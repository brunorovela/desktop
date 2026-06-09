unit URemessaThread;

interface

uses
   SysUtils, StrUtils, Classes, Contnrs, Controls, DateUtils, IniFiles,
   ZDbcIntfs, UZDbcFuncs, General, uDM;

const
   SIniPathFmt = '%sunimestre.ini';

var
   IniFile: TIniFile;
   FilePath: AnsiString;

type
   TLayoutSection = (lsHeader = 1, lsBody, lsFooter = 4);

   TLayoutItem = class
   strict private
      FLayoutID: Cardinal;
      FSection: TLayoutSection;
      FStart: Cardinal;
      FSize: Integer;
      FValue: AnsiString;
      FFillChar: AnsiChar;
      function GetAsSQLColumn: AnsiString;
      function Pad(const S: AnsiString): AnsiString;
   private
      class var FCounter: Cardinal;
      function CalcDV(const NossoNumero: AnsiString): AnsiString;
      function GetFieldNN: AnsiString;
      function Replace(const Line: AnsiString): AnsiString;
      class procedure IncCounter;
      class procedure DecCounter;
      property LayoutID: Cardinal read FLayoutID write FLayoutID;
      property Section: TLayoutSection read FSection write FSection;
      property Start: Cardinal read FStart write FStart;
      property Size: Integer read FSize write FSize;
      property Value: AnsiString read FValue write FValue;
      property FillChar: AnsiChar read FFillChar write FFillChar;
      property AsSQLColumn: AnsiString read GetAsSQLColumn;
      class property Counter: Cardinal read FCounter write FCounter;
   end;

   TLayout = class
   strict private
      FRunning: Boolean;
      FID: Cardinal;
      FNamePattern: AnsiString;
      FInterval: Cardinal;
      FFileCounter: Cardinal;
      FMaxFiles: Cardinal;
      FLastTime: TDate;
      FStartTime: TDateTime;
      FEndTime: TDateTime;
      FFileContents: TStrings;
      FLastError: AnsiString;
      FItems: TObjectList;
      class var FLayouts: TObjectList;
      function BuildFile: Boolean;
      function BuildSQL(const Section: TLayoutSection): AnsiString;
      function CanExecute: Boolean;
      function GetEllapsedMinutes: Cardinal;
      function GetFileName: AnsiString;
      function GetLastFileID: Cardinal;
      function SaveFile: Boolean;
      procedure DecFileCounter;
      procedure IncFileCounter;
      procedure Log;
      procedure UpdateRemessa;
   private
      constructor Create;
      destructor Destroy; override;
      procedure Execute;
      procedure FetchItems;
      class procedure FetchLayouts;
      property Running: Boolean read FRunning write FRunning;
      property ID: Cardinal read FID write FID;
      property NamePattern: AnsiString read FNamePattern write FNamePattern;
      property Interval: Cardinal read FInterval write FInterval;
      property FileCounter: Cardinal read FFileCounter write FFileCounter;
      property MaxFiles: Cardinal read FMaxFiles write FMaxFiles;
      property LastTime: TDate read FLastTime write FLastTime;
      property StartTime: TDateTime read FStartTime write FStartTime;
      property EndTime: TDateTime read FEndTime write FEndTime;
      property FileContents: TStrings read FFileContents write FFileContents;
      property LastError: AnsiString read FLastError write FLastError;
      property Items: TObjectList read FItems write FItems;
      class property Layouts: TObjectList read FLayouts write FLayouts;
   end;

   TRemessaThread = class(TThread)
   private
      class var FEnabled: Boolean;
      class var FInstance: TRemessaThread;
      class function GetEnabled: Boolean; static;
      class procedure SetEnabled(const Value: Boolean); static;
      class function GetInstance: TRemessaThread; static;
      constructor Create(CreateSuspended: Boolean);
   protected
      procedure Execute; override;
      procedure DoTerminate; override;
      procedure ShowIcon;
   public
      class property Instance: TRemessaThread read GetInstance;
      class property Enabled: Boolean read GetEnabled write SetEnabled;
   end;

implementation

{ TLayoutItem }

function TLayoutItem.CalcDV(const NossoNumero: AnsiString): AnsiString;
var
   S: AnsiString;
   Parts: TStrings;
begin
   Result := '';

   if AnsiStartsStr('[dv:', Value) then
   begin
      S := Copy(S, 2, Length(Value) - 2);

      Parts := TStringList.Create;
      try
         Parts.Delimiter := ':';
         Parts.DelimitedText := S;

         Result := '0';

         if Parts[1] = '10' then
         begin
            Result := DV10(NossoNumero, Parts[3]);
         end;

         if Parts[1] = '11' then
         begin
            Result := DV11(NossoNumero, Parts[2], Parts[3]);
         end;

         if Parts[1] = 'A2' then
         begin
            Result := DVA2(NossoNumero, Parts[2], Parts[3]);
         end;

         Result := Pad(Result);
      finally
         Parts.Free;
         Parts := nil;
      end;
   end;
end;

class procedure TLayoutItem.DecCounter;
begin
   Dec(FCounter);
end;

function TLayoutItem.GetAsSQLColumn: AnsiString;
const
   SSQLFindContatoFmt = ''
      + '( '
      + '   SELECT '
      + '      %s(COALESCE(cp.ds_contato, ''''), %d, ''%s'') '
      + '   FROM '
      + '      contatos_pessoas cp '
      + '   WHERE '
      + '      cp.cd_pessoa = %s AND '
      + '      cp.cd_contato = %s '
      + '   ORDER BY '
      + '      cp.ds_contato '
      + '   LIMIT 1 '
      + ') ';
   SSQLFindContatoNumericFmt = ''
      + '( '
      + '   SELECT '
      + '      %s(RETORNA_NUMERO(COALESCE(cp.ds_contato, '''')), %d, ''%s'') '
      + '   FROM '
      + '      contatos_pessoas cp '
      + '   WHERE '
      + '      cp.cd_pessoa = %s AND '
      + '      cp.cd_contato = %s '
      + '   ORDER BY '
      + '      cp.ds_contato '
      + '   LIMIT 1 '
      + ') ';
   SSQLColumnFmt = 'COALESCE(%s, '''')';
   SSQLPaddedColumnFmt = '%s(COALESCE(%s, ''''), %d, ''%s'')';
   SSQLColumnFileNumberFmt = '%s(COALESCE(LAYOUT.NR_REMESSA, 0) + 1, %d, ''%s'')';
var
   LValue, PadFunc, SQL, Join, S: AnsiString;
   Parts: TStrings;
begin
   Result := '';

   if FillChar = '' then
   begin
      FillChar := #32;
   end;

   LValue := Trim(Value);
   LValue := StringReplace(LValue, '"', '''', [rfReplaceAll]);

   if LValue = '' then
   begin
      LValue := QuotedStr(#32);
   end;

   PadFunc := 'RPAD';

   if FillChar = '0' then
   begin
      PadFunc := 'LPAD';
   end;

   Result := Format(SSQLPaddedColumnFmt, [PadFunc, LValue, Size, FillChar]);

   if LValue = '[arquivo_numero]' then
   begin
      Result := Format(SSQLColumnFileNumberFmt, [PadFunc, Size, FillChar]);
   end;

   if (LValue = '[linha_numero]') or
      (LValue = '[linha_continua]') or
      (LValue = '[linhas_total]') or
      (LValue = '[registro_sequencia]') or
      (LValue = '[registro_sequencia1]') or
      (LValue = '[registro_sequencia2]') then
   begin
      Result := QuotedStr(LValue);
   end;

   if Size = -1 then
   begin
      Result := Format(SSQLColumnFmt, [LValue]);
   end;

   if AnsiStartsStr('[dv:', LValue) then
   begin
      Result := '[DIGITO_VERIFICADOR]';
   end;

   if AnsiStartsStr('[contato:', LValue) or
      AnsiStartsStr('[contato_somente_numeros:', LValue) then
   begin
      S := Copy(LValue, 2, Length(LValue) - 2);

      Parts := TStringList.Create;
      try
         Parts.Delimiter := ':';
         Parts.DelimitedText := S;

         Join := 'boleto.cd_pessoa';

         if Parts[1] = 'responsavel' then
         begin
            Join := 'resp.cd_pessoa';
         end;

         SQL := SSQLFindContatoFmt;

         if AnsiStartsStr('[contato_somente_numeros:', LValue) then
         begin
            SQL := SSQLFindContatoNumericFmt;
         end;

         Result := Format(SQL, [PadFunc, Size, FillChar, Join, Parts[2]]);

      finally
         Parts.Free;
         Parts := nil;
      end;
   end;
end;

function TLayoutItem.GetFieldNN: AnsiString;
const
   SSQLNamedColumnFmt = ', (%s) %s';
var
   S: AnsiString;
   Parts: TStrings;
begin
   if AnsiStartsStr('[dv:', Value) then
   begin
      S := Copy(Value, 2, Length(Value) - 2);

      Parts := TStringList.Create;
      try
         Parts.Delimiter := ':';
         Parts.DelimitedText := S;

         Result := Format(SSQLNamedColumnFmt, [Parts[4], 'DS_NOSSONUMERO']);
      finally
         Parts.Free;
         Parts := nil;
      end;
   end;
end;

class procedure TLayoutItem.IncCounter;
begin
   Inc(FCounter);
end;

function TLayoutItem.Pad(const S: AnsiString): AnsiString;
begin
   Result := DupeString(FillChar, Size);

   if FillChar = '0' then
   begin
      Result := Result + S;
      Result := RightStr(Result, Size);
   end;

   if FillChar <> '0' then
   begin
      Result := S + Result;
      Result := LeftStr(Result, Size);
   end;
end;

function TLayoutItem.Replace(const Line: AnsiString): AnsiString;
const
   SIntToStrFmt = '%d';
var
   I: Integer;
   S, OldPattern: AnsiString;
begin
   Result := Line;

   I := Counter;
   OldPattern := '';

   if (FValue = '[linha_numero]') or
      (FValue = '[linha_continua_cab]') or
      (FValue = '[linha_continua]') or
      (FValue = '[registro_sequencia]') or
      (FValue = '[registro_sequencia1]') or
      (FValue = '[registro_sequencia2]') then
   begin
      OldPattern := FValue;

      if FValue = '[registro_sequencia1]' then
         I := Counter * 2 - 1;

      if FValue = '[registro_sequencia2]' then
         I := Counter * 2;
   end;

   if OldPattern <> '' then
   begin
      S := Format(SIntToStrFmt, [I]);
      S := Pad(S);
      Result := StringReplace(Result, OldPattern, S, [rfReplaceAll]);
   end;
end;

{ TLayout }

function TLayout.BuildFile: Boolean;

   function ProccessLineBreak(const Line: AnsiString): TStrings;
   var
      S: AnsiString;
      I: Integer;
   begin
      Result := TStringList.Create;
      S := Line;
      I := AnsiPos('||', S);
      while I > 0 do
      begin
         Result.Add(Copy(S, 1, I - 1));
         S := Copy(S, I + 2, Length(S));
         I := AnsiPos('||', S);
      end;
      Result.Add(S);
   end;

const
   SIntToStrFmt = '%d';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   I, Start, Size: Integer;
   Item: TLayoutItem;
   Line, S: AnsiString;
begin
   Result := False;

   if Assigned(FileContents) then
   begin
      FileContents.Free;
   end;
   FileContents := TStringList.Create;

   TLayoutItem.Counter := 0;
   
   Stmt := PrepareStatement(BuildSQL(lsHeader));
   try
      Stmt.SetInt(1, ID);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := True;
            TLayoutItem.IncCounter;
            
            Line := Rs.GetStringByName('DS_DATA');
            
            for I := 0 to Items.Count - 1 do
            begin
               Item := TLayoutItem(Items[I]);
               if Item.Section = lsHeader then
               begin
                  Line := Item.Replace(Line);
               end;
            end;

            FileContents.AddStrings(ProccessLineBreak(Line));
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Result := False;
   
   Stmt := PrepareStatement(BuildSQL(lsBody));
   try
      Stmt.SetInt(1, ID);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         while Rs.Next do
         begin
            Result := True;
            TLayoutItem.IncCounter;
            
            Line := Rs.GetStringByName('DS_DATA');
            
            for I := 0 to Items.Count - 1 do
            begin
               Item := TLayoutItem(Items[I]);

               if Item.Section = lsBody then
               begin
                  Line := Item.Replace(Line);

                  if Rs.FindColumn('DS_NOSSONUMERO') > 0 then
                  begin
                     S := Item.CalcDV(Rs.GetStringByName('DS_NOSSONUMERO'));

                     if S <> '' then
                     begin
                        Line := StringReplace(Line, '[DIGITO_VERIFICADOR]', S, [rfReplaceAll]);
                     end;
                  end;
                  
               end;
            end;

            Start := Rs.GetIntByName('NR_POSICAO_INICIO');
            Size := Rs.GetIntByName('NR_TAMANHO');

            if (Start <> 0) and (Size <> 0) then
            begin
               Line := Copy(Line, Start, Size);
            end;

            FileContents.AddStrings(ProccessLineBreak(Line));
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      Exit;
   end;

   Result := False;
   
   Stmt := PrepareStatement(BuildSQL(lsFooter));
   try
      Stmt.SetInt(1, ID);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := True;
            TLayoutItem.IncCounter;
            
            Line := Rs.GetStringByName('DS_DATA');

            for I := 0 to Items.Count - 1 do
            begin
               Item := TLayoutItem(Items[I]);
               
               if Item.Section = lsFooter then
               begin
                  Line := Item.Replace(Line);
               end;
            end;

            S := Format(SIntToStrFmt, [FileContents.Count]);
            Line := StringReplace(Line, '[linhas_total]', S, [rfReplaceAll]);

            FileContents.AddStrings(ProccessLineBreak(Line));
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Result := Trim(FileContents.Text) <> '';
end;

function TLayout.BuildSQL(const Section: TLayoutSection): AnsiString;
const
   SMySQLConcatFmt = 'CONCAT(%s)';
   SSQLHeader = ''
      + 'SELECT '
      + '   %s DS_DATA '
      + 'FROM '
      + '   REM_LAYOUTS layout '
      + '      LEFT JOIN FIN_CADASTRO_CONTAS financeiro ON '
      + '         (layout.CD_CAIXA = financeiro.CD_CAIXA) '
      + 'WHERE '
      + '   layout.CD_LAYOUT = ? ';
   SSQLBody = ''
      + 'SELECT '
      + '    DDA.NR_CONTA_CORRENTE, '
      + '    DDA.DS_BANCO, '
      + '    DDA.NR_AGENCIA, '
      + '    DDA.NR_DOCUMENTO, '
      + '    DDA.SN_AUTORIZA_DEBITO, '
      + '    RESP.CD_PESSOA CODRESP, '
      + '    O.NR_POSICAO_INICIO, '
      + '    O.NR_TAMANHO, '
      + '    %s DS_DATA %s '
      + 'FROM '
      + '    REM_ENVIOS REMESSA '
      + '        JOIN REM_STATUS REM_STATUS ON '
      + '            (REM_STATUS.NR_NOSSONUMERO = REMESSA.NR_NOSSONUMERO) '
      + '        JOIN REM_ENVIOS REGISTRO ON '
      + '            (REM_STATUS.CD_ENVIO_REGISTRO = REGISTRO.CD_ENVIO) '
      + '        JOIN PESSOAS RESP ON '
      + '            (REMESSA.CD_RESP = RESP.CD_PESSOA) '
      + '        JOIN REM_LAYOUTS LAYOUT ON '
      + '            (REMESSA.CD_LAYOUT = LAYOUT.CD_LAYOUT) '
      + '        LEFT JOIN FIN_BOLETO BOLETO ON '
      + '            (BOLETO.CD_BOLETO = REMESSA.CD_BOLETO) '
      + '        LEFT JOIN FIN_CADASTRO_CONTAS FINANCEIRO ON '
      + '            (LAYOUT.CD_CAIXA = FINANCEIRO.CD_CAIXA) '
      + '        LEFT JOIN PESSOAS_DEBITO_AUTOMATICO DDA ON '
      + '            (DDA.CD_PESSOA = BOLETO.CD_PESSOA ) '
      + '        JOIN REM_OCORRENCIAS O ON '
      + '            (REMESSA.CD_OCORRENCIA = O.CD_OCORRENCIA) AND '
      + '            (LAYOUT.CD_LAYOUT = O.CD_LAYOUT) '
      + 'WHERE '
      + '    LAYOUT.CD_LAYOUT = ? AND '
      + '    REMESSA.SN_IGNORADO = 0 AND '
      + '    REMESSA.CD_ARQUIVO IS NULL AND '
      + '    O.SN_ATIVO = 1 '
      + 'GROUP BY '
      + '    REMESSA.CD_RESP, '
      + '    REMESSA.NR_NOSSONUMERO, '
      + '    REMESSA.CD_OCORRENCIA '
      + 'ORDER BY '
      + '    REMESSA.CD_ENVIO ASC ';
   SSQLFooter = ''
      + 'SELECT '
      + '    %s DS_DATA '
      + 'FROM '
      + '    REM_ENVIOS REMESSA '
      + '        JOIN REM_STATUS REM_STATUS ON '
      + '            (REM_STATUS.NR_NOSSONUMERO = REMESSA.NR_NOSSONUMERO) '
      + '        JOIN REM_ENVIOS REGISTRO ON '
      + '            (REM_STATUS.CD_ENVIO_REGISTRO = REGISTRO.CD_ENVIO) '
      + '        JOIN PESSOAS RESP ON '
      + '            (REMESSA.CD_RESP = RESP.CD_PESSOA) '
      + '        JOIN REM_LAYOUTS LAYOUT ON '
      + '            (REMESSA.CD_LAYOUT = LAYOUT.CD_LAYOUT) '
      + '        LEFT JOIN FIN_BOLETO BOLETO ON '
      + '            (BOLETO.CD_BOLETO = REMESSA.CD_BOLETO) '
      + '        LEFT JOIN FIN_CADASTRO_CONTAS FINANCEIRO ON '
      + '            (LAYOUT.CD_CAIXA = FINANCEIRO.CD_CAIXA) '
      + 'WHERE '
      + '    LAYOUT.CD_LAYOUT = ? AND '
      + '    REMESSA.SN_IGNORADO = 0 AND '
      + '    REMESSA.CD_ARQUIVO IS NULL '
      + 'GROUP BY '
      + '    LAYOUT.CD_LAYOUT '
      + 'ORDER  BY '
      + '    REMESSA.CD_ENVIO ASC ';
   SectionToSQLQuery: array[TLayoutSection] of AnsiString = (
      SSQLHeader, SSQLBody, '', SSQLFooter
   );
var
   I: Integer;
   Item: TLayoutItem;
   FieldList: TStrings;
   Fields, ExtraField, SQL: AnsiString;
begin
   Result := '';
   ExtraField := '';

   FieldList := TStringList.Create;
   try
      FieldList.Delimiter := ',';

      for I := 0 to Items.Count - 1 do
      begin
         Item := TLayoutItem(Items[I]);

         if Item.Section = Section then
         begin
            FieldList.Add(Item.AsSQLColumn);

            if ExtraField = '' then
            begin
               ExtraField := Item.GetFieldNN;
            end;
         end;
      end;

      Fields := '''''';
      
      if FieldList.Count > 0 then
      begin
         Fields := FieldList.DelimitedText;
         Fields := AnsiReplaceStr(Fields, #34, '');
      end;

      Fields := Format(SMySQLConcatFmt, [Fields]);

      SQL := SectionToSQLQuery[Section];

      if Section = lsBody then
      begin
         Result := Format(SQL, [Fields, ExtraField]);
      end;

      if Section <> lsBody then
      begin
         Result := Format(SQL, [Fields]);
      end;
      
   finally
      FieldList.Free;
      FieldList := nil;
   end;
end;

function TLayout.CanExecute: Boolean;
begin
   Result :=
      (not Running) and
      (GetEllapsedMinutes >= Interval) and
      (FileCounter < MaxFiles);
end;

constructor TLayout.Create;
begin
   Items := TObjectList.Create;
   Running := False;
   StartTime := 0;
   EndTime := 0;
end;

procedure TLayout.DecFileCounter;
begin
   Dec(FFileCounter);
end;

destructor TLayout.Destroy;
var
   I: Integer;
begin
   for I := Items.Count - 1 downto 0 do
   begin
      TLayoutItem(Items.Extract(Items[I])).Free;
   end;
   Items.Free;
   inherited;
end;

procedure TLayout.Execute;
begin
   if CanExecute then
   begin
      StartTime := Now;
      Running := True;
      LastError := '';
      if BuildFile then
      begin
         SaveFile;
         LastTime := Today;
         UpdateRemessa;
         EndTime := Now;
         Log;
      end;
      EndTime := Now;
      Running := False;
   end;
end;

procedure TLayout.FetchItems;
const
   SSQLSelectItems = ''
      + 'SELECT '
      + '	CD_LAYOUT, '
      + '	CD_TIPO, '
      + '	NR_INICIO, '
      + '	NR_TAMANHO, '
      + '	DS_VALOR, '
      + '	CHR_FILL '
      + 'FROM '
      + '	REM_LAYOUT_ESPEC '
      + 'WHERE '
      + '	CD_LAYOUT = ? AND '
      + '	CD_TIPO IN (1, 2, 4) '
      + 'ORDER BY '
      + '	CD_TIPO, '
      + '	NR_INICIO ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Item: TLayoutItem;
   C: AnsiChar;
   S: AnsiString;
begin
   Stmt := PrepareStatement(SSQLSelectItems);
   try
      Stmt.SetInt(1, ID);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         while Rs.Next do
         begin
            Item := TLayoutItem.Create;
            Item.LayoutID := ID;
            Item.Section := TLayoutSection(Rs.GetIntByName('CD_TIPO'));
            Item.Start := Rs.GetIntByName('NR_INICIO');
            Item.Size := Rs.GetIntByName('NR_TAMANHO');
            Item.Value := Rs.GetStringByName('DS_VALOR');

            Item.FillChar := #32;
            S := Rs.GetStringByName('CHR_FILL');
            if Length(S) = 1 then
            begin
               Item.FillChar := S[1];
            end;

            Items.Add(Item);
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

class procedure TLayout.FetchLayouts;
const
   SSQLSelectLayouts = ''
      + 'SELECT '
      + '	CD_LAYOUT, '
      + '	NM_ARQUIVO, '
      + '	NR_INTERVALO_AUTO_GERAR, '
      + '	DT_ULTIMA_AUTO_GERAR, '
      + '	NR_ARQUIVOS_GERADOS_DIA, '
      + '	NR_MAXIMO_ARQUIVOS_DIA '
      + 'FROM '
      + '	REM_LAYOUTS '
      + 'WHERE '
      + '	SN_ATIVO = 1 AND '
      + '	SN_AUTO_GERAR = 1 ';
var
   Rs: IZResultSet;
   Layout: TLayout;
begin
   Layouts := TObjectList.Create;

   Rs := ExecuteQuery(SSQLSelectLayouts);
   try
      while Rs.Next do
      begin
         Layout := TLayout.Create;
         Layout.ID := Rs.GetIntByName('CD_LAYOUT');
         Layout.NamePattern := Rs.GetStringByName('NM_ARQUIVO');
         Layout.Interval := Rs.GetIntByName('NR_INTERVALO_AUTO_GERAR');
         Layout.LastTime := Rs.GetDateByName('DT_ULTIMA_AUTO_GERAR');
         Layout.FileCounter := Rs.GetIntByName('NR_ARQUIVOS_GERADOS_DIA');
         Layout.MaxFiles := Rs.GetIntByName('NR_MAXIMO_ARQUIVOS_DIA');

         if Layout.LastTime < Today then
         begin
            Layout.FileCounter := 0;
         end;

         Layout.FetchItems;
         Layouts.Add(Layout);
      end;
   finally
      Rs.Close;
      Rs := nil;
   end;
end;

function TLayout.GetEllapsedMinutes: Cardinal;
begin
   Result := Interval;
   if StartTime <> 0 then
   begin
      Result := MinutesBetween(Now, StartTime);
   end;
end;

function TLayout.GetFileName: AnsiString;
const
   SIntToStrFmt = '%d';
   SNumberFormatFmt = '%%.%dd';
var
   Today: TDateTime;
   Month: Word;
   S, DirPath, NumberFmt: AnsiString;
   I: Integer;
   DC: Byte;
begin
   if NamePattern = '' then
   begin
      NamePattern := 'CB[dd][mm]A[c].REM';
   end;

   Result := NamePattern;
   
   Today := Now;

   Result := StringReplace(Result, '[dd]', FormatDateTime('dd', Today), [rfReplaceAll]);
   Result := StringReplace(Result, '[mm]', FormatDateTime('mm', Today), [rfReplaceAll]);
   Result := StringReplace(Result, '[aa]', FormatDateTime('yy', Today), [rfReplaceAll]);
   Result := StringReplace(Result, '[aaaa]', FormatDateTime('yyyy', Today), [rfReplaceAll]);
   Result := StringReplace(Result, '[hh]', FormatDateTime('hh', Today), [rfReplaceAll]);
   Result := StringReplace(Result, '[nn]', FormatDateTime('nn', Today), [rfReplaceAll]);
   Result := StringReplace(Result, '[ss]', FormatDateTime('ss', Today), [rfReplaceAll]);

   if AnsiContainsStr(Result, '[m]') then
   begin
      Month := MonthOf(Today);
      
      case Month of
         1..9:
            S := Format(SIntToStrFmt, [Month]);
         10:
            S := 'O';
         11:
            S := 'N';
         12:
            S := 'D';
      end;

      Result := StringReplace(Result, '[m]', S, [rfReplaceAll]);
   end;

   if AnsiContainsStr(Result, '|CRM|') then
   begin
      S := StringReplace(Result, '|', '', [rfReplaceAll]);

      if FileExists(S) then
         S := StringReplace(Result, '|CRM|', 'RM[c]', [rfReplaceAll]);

      Result := S;
   end;

   if AnsiContainsStr(Result, '[c]') then
   begin
      DC := DigitCount(MaxFiles);
      NumberFmt := Format(SNumberFormatFmt, [DC]);
      S := Format(NumberFmt, [FileCounter]);
      Result := StringReplace(Result, '[c]', S, [rfReplaceAll]);
      if FileExists(Result) then
      begin
         Result := '';
      end;
   end;

   if Result <> '' then
   begin
      DirPath := ExtractFileDir(Result);

      if (DirPath <> '') and (not DirectoryExists(DirPath)) then
      begin
         if not CreateDir(DirPath) then
         begin
            Result := '';
         end;
      end;
   end;

end;

function TLayout.GetLastFileID: Cardinal;
const
   SSQLSelect = 'SELECT MAX(CD_ARQUIVO) FROM REM_ARQUIVOS';
var
   Rs: IZResultSet;
begin
   Result := 0;
   
   Rs := ExecuteQuery(SSQLSelect);
   try
      if Rs.Next then
      begin
         Result := Rs.GetInt(1);
      end;
   finally
      Rs.Close;
      Rs := nil;
   end;
end;

procedure TLayout.IncFileCounter;
begin
   if LastTime < Today then
   begin
      FFileCounter := 0;
   end;
   Inc(FFileCounter);
end;

procedure TLayout.Log;
const
   SSQLInsertLog = ''
      + 'INSERT INTO REM_LAYOUTS_EXECUCAO ( '
      + '	CD_LAYOUT, '
      + '	CD_ARQUIVO, '
      + '	DT_INICIO, '
      + '	DT_FIM, '
      + '	SN_SUCESSO, '
      + '	ME_ERRO '
      + ') VALUES (?, ?, ?, ?, ?, ?) ';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SSQLInsertLog);
   try
      Stmt.SetInt(1, ID);
      Stmt.SetInt(2, GetLastFileID);
      Stmt.SetTimestamp(3, StartTime);
      Stmt.SetTimestamp(4, EndTime);
      Stmt.SetInt(5, Ord(LastError = ''));
      Stmt.SetString(6, LastError);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

function TLayout.SaveFile: Boolean;
const
   SSQLInsertFile = ''
      + 'INSERT INTO REM_ARQUIVOS ( '
      + '    CD_PESSOA, '
      + '    DT_EXPORTACAO, '
      + '    DS_SITUACAO, '
      + '    NM_ARQUIVO, '
      + '    ME_ARQUIVO '
      + ') '
      + 'VALUES (?, CURRENT_TIMESTAMP, ''A'', ?, ?) ';
var
   FileName: AnsiString;
   Stmt: IZPreparedStatement;
begin
   Result := False;
   IncFileCounter;
   FileName := GetFileName;

   if FileName = '' then
      DecFileCounter;

   if FileName <> '' then
   begin
      try
         FileContents.SaveToFile(FileName);
         Stmt := PrepareStatement(SSQLInsertFile);
         try
            Stmt.SetInt(1, DM.iCdPessoaLogado);
            Stmt.SetString(2, FileName);
            Stmt.SetString(3, FileContents.Text);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
            Stmt := nil;
         end;

         Result := True;
      except
         on E: EFCreateError do
         begin
            LastError := E.Message;
            Result := False;
            DecFileCounter;
         end;

         on E: EZSQLException do
         begin
            LastError := E.Message;
            Result := False;
            DecFileCounter;
         end;
      end;
   end;
end;

procedure TLayout.UpdateRemessa;
const
   SSQLUpdateStatus = ''
      + 'UPDATE '
      + '	REM_STATUS S '
      + 'SET '
      + '	S.DS_SITUACAO = '
      + '		CASE '
      + '			WHEN S.DS_SITUACAO IN (''F'', ''J'') THEN ''E'' '
      + '			ELSE S.DS_SITUACAO '
      + '		END '
      + 'WHERE '
      + '	EXISTS ( '
      + '		SELECT '
      + '			E.NR_NOSSONUMERO '
      + '		FROM '
      + '			REM_ENVIOS E '
      + '		WHERE '
      + '			S.NR_NOSSONUMERO = E.NR_NOSSONUMERO AND '
      + '			E.CD_LAYOUT = ? AND '
      + '			E.SN_IGNORADO = 0 AND '
      + '			E.CD_ARQUIVO IS NULL '
      + '	) ';
   SSQLUpdateEnvios = ''
      + 'UPDATE '
      + '	REM_ENVIOS E '
      + 'SET '
      + '	E.CD_ARQUIVO = ? '
      + 'WHERE '
      + '	E.CD_LAYOUT = ? AND '
      + '	E.SN_IGNORADO = 0 AND '
      + '	E.CD_ARQUIVO IS NULL ';
   SSQLUpdateLayout = ''
      + 'UPDATE '
      + '	REM_LAYOUTS '
      + 'SET '
      + '	NR_REMESSA = COALESCE(NR_REMESSA, 0) + 1, '
      + '	NR_ARQUIVOS_GERADOS_DIA = ?, '
      + '	DT_ULTIMA_AUTO_GERAR = ? '
      + 'WHERE '
      + '	CD_LAYOUT = ?  ';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SSQLUpdateStatus);
   try
      Stmt.SetInt(1, ID);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLUpdateEnvios);
   try
      Stmt.SetInt(1, GetLastFileID);
      Stmt.SetInt(2, ID);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLUpdateLayout);
   try
      Stmt.SetInt(1, FileCounter);
      Stmt.SetDate(2, LastTime);
      Stmt.SetInt(3, ID);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

{ TRemessaThread }

constructor TRemessaThread.Create(CreateSuspended: Boolean);
begin
   inherited Create(CreateSuspended);
   
   if TRemessaThread.Enabled then
   begin
      TLayout.FetchLayouts;
      ShowIcon;
   end;
end;

procedure TRemessaThread.DoTerminate;
var
   I: Integer;
   Layout: TLayout;
begin
   if Assigned(TLayout.Layouts) then
   begin
      for I := TLayout.Layouts.Count - 1 downto 0 do
      begin
         Layout := TLayout(TLayout.Layouts.Extract(TLayout.Layouts[I]));
         Layout.Free;
      end;
   end;
   TRemessaThread.FInstance := nil;
   inherited;
end;

procedure TRemessaThread.Execute;
var
   I: Integer;
   Layout: TLayout;
begin
 while (not Terminated) and TRemessaThread.Enabled do
   begin
      Sleep(10000);
      for I := 0 to TLayout.Layouts.Count - 1 do
      begin
         Layout := TLayout(TLayout.Layouts[I]);
         Synchronize(Layout.Execute);
      end;
   end;
end;

class function TRemessaThread.GetEnabled: Boolean;
begin
   Result := TRemessaThread.FEnabled;
end;

class function TRemessaThread.GetInstance: TRemessaThread;
begin
   if not Assigned(TRemessaThread.FInstance) then
   begin
      TRemessaThread.FInstance := TRemessaThread.Create(True);
   end;

   Result := TRemessaThread.FInstance;
end;

class procedure TRemessaThread.SetEnabled(const Value: Boolean);
begin
   TRemessaThread.FEnabled := Value;
end;

procedure TRemessaThread.ShowIcon;
begin
   DM.tiRemessa.Visible :=
      (TLayout.Layouts.Count > 0) and TRemessaThread.Enabled;
      
   if DM.tiRemessa.Visible then
   begin
      DM.tiRemessa.ShowBalloonHint;
   end;
end;

initialization
   FilePath := Format(SIniPathFmt, [ExtractFilePath(ParamStr(0))]);
   IniFile := TIniFile.Create(FilePath);
   try
      TRemessaThread.Enabled := IniFile.ReadBool('Configuracoes', 'Remessa', False);
   finally
      IniFile.Free;
      IniFile := nil;
   end;

finalization

end.
