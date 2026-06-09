unit uSvcImportacaoTerminalCatracaImpCatracas;

interface

uses
  uCFuncString, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, StrUtils, Windows, Messages, SysUtils,
  Variants, Classes, DB, ZConnection, DateUtils, uSvcImportacaoTerminalCatraca,
  uSvcImportacaoTerminalCatracaImpRegistro;
                 
type
   IImpCatraca = interface
   ['{68773334-E713-4B54-924E-4F8EDF9A3345}']
      function processaArquivo(sArquivo: string): TStringList;
      function getConteudo: String;
   end;

   TImpCatracaBase = class(TInterfacedObject, IImpCatraca)
   private
      ALinhas: TStringList;
      FUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca;
   protected
      procedure carregaArquivo(sNome: string);
   public
      constructor Create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
      function processaArquivo(sArquivo: string): TStringList; virtual;
      function getConteudo: String;
   end;

   TImpCatracaX = class(TImpCatracaBase)
   public
      function processaArquivo(sArquivo: string): TStringList; override;
   end;

   TImpCatracaMicrodin = class(TImpCatracaBase)
   private
      AHistorico: TStringList;
      AQuery: TUMZQuery;
      procedure defineEntradaSaida(oItem: TImpRegistro);
   public
      constructor Create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
      function processaArquivo(sArquivo: string): TStringList; override;
   end;

   TImpCatracaInners = class(TImpCatracaBase)
   public
      function processaArquivo(sArquivo: string): TStringList; override;
   end;

   TImpCatracaInnersNew = class(TImpCatracaBase)
   private
      AHistorico: TStringList;
      qryVerificaBase: TUMZQuery;
      procedure defineEntradaSaida(oItem: TImpRegistro);
   public
      constructor create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
      function processaArquivo(sArquivo: String): TStringList; override;
   end; 

   TImpCatracaPrimmePonto = class(TImpCatracaBase)
   private
      AHistorico: TStringList;
      qryVerificaBase: TUMZQuery;
      procedure defineEntradaSaida(oItem: TImpRegistro);
   public
      constructor create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
      function processaArquivo(sArquivo: String): TStringList; override;
   end;

   TImpCatracaFlexpoint = class(TImpCatracaBase)
   public
      function processaArquivo(sArquivo: string): TStringList; override;
   end;

   TImpCatracaFlexpointPessoa = class(TImpCatracaBase)
   public
      function processaArquivo(sArquivo: string): TStringList; override;
   end;

   {
   Modelos:
      "Henry Lumen Card 2", layout: "7x":
         Layout:
            "FF D F   [--DATA--] [-HORA-] [-----MATRICULA----]" // "F" ou "FF" = Fixo, "D" = Direção
         exemplos:
            "01 S 0   25/03/2011 11:23:31 00000000000022330139"
            "01 N 0   25/03/2011 11:23:38 00000000000022330139"
   }
   TImpCatracaHenry = class(TImpCatracaBase)
   public
      function processaArquivo(sArquivo: string): TStringList; override;
   end;


implementation

{ TImpCatracaBase }

procedure TImpCatracaBase.carregaArquivo(sNome: string);
begin
   ALinhas.LoadFromFile(sNome);
end;

constructor TImpCatracaBase.Create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
begin
  inherited Create();
  ALinhas := TStringList.Create();
  Self.FUSvcImportacaoTerminalCatraca := AUSvcImportacaoTerminalCatraca;
end;

function TImpCatracaBase.getConteudo: String;
begin
   Result := Self.ALinhas.Text;
end;

function TImpCatracaBase.processaArquivo(sArquivo: string): TStringList;
begin
   carregaArquivo(sArquivo);
   Result := nil;
end;

{ TImpCatracaX }
function TImpCatracaX.processaArquivo(sArquivo: string): TStringList;
var
   slAux, slData, slHora: TStringList;
   oItem: TImpRegistro;
   i: Integer;
   dtTemp, hrTemp: TDateTime;
   fmt: TFormatSettings;
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   for i := 0 to (ALinhas.Count-1) do begin

      if not (Length(Trim(ALinhas.Strings[i])) <= 40) then begin
         //Erro!!;
         Continue;
      end;
      slAux := TFuncString.splitString(ALinhas.Strings[i], ' ');

      if (slAux.Count >= 5 ) then begin
         //continua processando
         oItem := TImpRegistro.Create();
         oItem.Conteudo := ALinhas.Strings[i];

         //Tipo ( Entrada, Saída ).
         if (LeftStr(Trim(slAux.Strings[0]), 3) = 'ENT') or (LeftStr(Trim(slAux.Strings[0]), 3) = '010') then
         begin
            oItem.Tipo := itEntrada;
         end
         else
         begin
            oItem.Tipo := itSaida;
         end;

         //Data
         try

            // Verifica se a data está em formato brasileiro
            if Pos('/', slAux.Strings[1]) > 0 then
            begin

               slData := TFuncString.splitString(slAux.Strings[1], '/');
               slHora := TFuncString.splitString(slAux.Strings[2], ':');
               // Monta a data completa utilizando function EncodeDateTime ( const Year, Month, Day, Hour, Min, Sec, MSec : Word ) : TDateTime;
               oItem.Data := EncodeDateTime(StrToInt(slData.Strings[2]), StrToInt(slData.Strings[1]), StrToInt(slData.Strings[0]), StrToInt(slHora.Strings[0]), StrToInt(slHora.Strings[1]), 00, 00);

            // Verifica se a data está em formato americano               
            end else if Pos('-', slAux.Strings[1]) > 0 then
            begin

               slData := TFuncString.splitString(slAux.Strings[1], '-');
               slHora := TFuncString.splitString(slAux.Strings[2], ':');
               // Monta a data completa utilizando function EncodeDateTime ( const Year, Month, Day, Hour, Min, Sec, MSec : Word ) : TDateTime;
               oItem.Data := EncodeDateTime(StrToInt(slData.Strings[0]), StrToInt(slData.Strings[1]), StrToInt(slData.Strings[2]), StrToInt(slHora.Strings[0]), StrToInt(slHora.Strings[1]), 00, 00);

            // Verifica se a data está em formato americano
            end else begin

               // Tenta montar a data utilizando StrToDate
               fmt.ShortDateFormat:='dd/mm/yyyy';
               fmt.DateSeparator  :='/';
               fmt.LongTimeFormat :='hh:nn';
               fmt.TimeSeparator  :=':';
               oItem.Data := StrToDateTime(slAux.Strings[1]+' '+slAux.Strings[2],Fmt);

            end;

         except
            oItem.Data := Self.FUSvcImportacaoTerminalCatraca.NowFromDB;
         end;

         //Codigo
         try
            oItem.Codigo := StrToInt(Trim(slAux.Strings[3]));
         except
            oItem.Invalido := true;
         end;
         Result.AddObject('', oItem);
      end
      else begin
         //nao é registro válido
      end;
   end;
end;

{ TImpCatracaMicrodin }

constructor TImpCatracaMicrodin.Create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
begin
  inherited Create(AUSvcImportacaoTerminalCatraca);
   AHistorico := TStringList.Create();
   AQuery := Self.FUSvcImportacaoTerminalCatraca.UMConn.newQuery;
   AQuery.SQL.Clear();
   AQuery.SQL.Add(''+
   'SELECT                                 '+
   '     codigo, dt_entrada, dt_saida      '+
   'FROM                                   '+
   '    diario_terminal_acessos dta        '+
   'WHERE                                  '+
   '     cd_pessoa = :cdpessoa             '+
   '     AND sn_finalizado = 0             '+
   '     AND (DATE_FORMAT(dt_entrada, "%Y-%m-%d") = :dt) '+
   '     AND ((dt_saida IS NULL) OR (DATE_FORMAT(dt_saida, "%Y-%m-%d") = :dt)) '+
   'ORDER BY                               '+
   '      dt_entrada DESC                  '+
   ' LIMIT 1                               '+
   '');
end;

procedure TImpCatracaMicrodin.defineEntradaSaida(oItem: TImpRegistro);
var
   sId: string;
begin
   sId := IntToStr(oItem.Codigo) + ':' + FormatDateTime('yyyy-mm-dd', oItem.Data);
   //verificar no historico, se ja tem algo, se nao tiver, pega da base
   if (AHistorico.IndexOfName(sId) = -1) then begin
      //tenta pegar de base
      with AQuery do begin
         Close();
         ParamByName('cdpessoa').AsInteger := oItem.Codigo;
         ParamByName('dt').AsString := FormatDateTime('yyyy-mm-dd', oItem.Data);
         Open();
         //se tiver vazio, signifca que é entrada
         if (IsEmpty) then begin
            oItem.Tipo := itEntrada;
            AHistorico.Add(sId + '=' + 'ENT');
         end
         else begin
            oItem.Tipo := itSaida;
            AHistorico.Add(sId + '=' + 'SAI');
         end;
         Close();
      end;
   end
   else begin
      if (AHistorico.Values[sId] = 'SAI') then begin
         oItem.Tipo := itEntrada;
         AHistorico.Values[sId] := 'ENT';
      end
      else if (AHistorico.Values[sId] = 'ENT') then begin
         oItem.Tipo := itSaida;
         AHistorico.Values[sId] := 'SAI';
      end;
   end;
end;

function TImpCatracaMicrodin.processaArquivo(sArquivo: string): TStringList;
var
   i: Integer;
   oItem: TImpRegistro;
   dtTemp, hrTemp: TDateTime;
   sReg, sAux: string;
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();
   for i := 0 to (ALinhas.Count-1) do begin
      if not (Length(Trim(ALinhas.Strings[i])) = 29) then begin
         //Erro!!;
         Continue;
      end;
      oItem := TImpRegistro.Create();
      oItem.Conteudo := ALinhas.Strings[i];
      sReg := ALinhas.Strings[i];

      //Data
      try
         //data
         sAux := Copy(sReg, 6, 2) + ':' + Copy(sReg, 8, 2);
         hrTemp := StrToDateTime(sAux);

         //hra
         sAux := Copy(sReg, 10, 2) + '/' + Copy(sReg, 12, 2)  + '/' + Copy(sReg, 14, 2);
         dtTemp := StrToDate(sAux);
         oItem.Data := (dtTemp+hrTemp);
      except
         oItem.Data := Self.FUSvcImportacaoTerminalCatraca.NowFromDB;
      end;

      //Codigo
      try
         oItem.Codigo := StrToInt(Copy(sReg, 18, 12));
      except
         oItem.Invalido := true;
      end;

      //define se eh entrada ou saida
      defineEntradaSaida(oItem);

      Result.AddObject('', oItem);
   end;

end;

{ TImpCatracaInner }

function TImpCatracaInners.processaArquivo(sArquivo: string): TStringList;
var
   slAux: TStringList;
   oItem: TImpRegistro;
   i: Integer;
   dtTemp, hrTemp: TDateTime;
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   for i := 0 to (ALinhas.Count-1) do begin

      if not (Length(Trim(ALinhas.Strings[i])) <= 39) then begin
         //Erro!!;
         Continue;
      end;
      // Separar os campos pelos espaços
      slAux := TFuncString.splitString(ALinhas.Strings[i], ' ');

      if (slAux.Count >= 5 ) then begin
         //continua processando
         oItem := TImpRegistro.Create();
         oItem.Conteudo := ALinhas.Strings[i];

         //Tipo ( Entrada, Saída ).
         if (LeftStr(Trim(slAux.Strings[0]), 3) = 'ENT') or (LeftStr(Trim(slAux.Strings[0]), 3) = '010') or (LeftStr(Trim(slAux.Strings[0]), 3) = '110') then
         begin
            oItem.Tipo := itEntrada;
         end
         else
         begin
            oItem.Tipo := itSaida;
         end;

         //Data
         try
            dtTemp := StrToDate(slAux.Strings[1]);
            hrTemp := StrToDateTime(slAux.Strings[2]);
            oItem.Data := (dtTemp+hrTemp);
         except
            oItem.Data := Self.FUSvcImportacaoTerminalCatraca.NowFromDB;
         end;

         //Codigo
         try
            oItem.Codigo := StrToInt(Trim(slAux.Strings[3]));
         except
            oItem.Invalido := true;
         end;
         Result.AddObject('', oItem);
      end
      else begin
         //nao é registro válido
      end;
   end;
end;

{ TImpCatracaFlexpoint }

function TImpCatracaFlexpoint.processaArquivo(sArquivo: string): TStringList;
var
   MySettings: TFormatSettings;
   i: Integer;
   oItem: TImpRegistro;
   linha: string;
   matricula: string; // matricula 8 caracteres
   hora: string; // hora 2 caracteres
   minuto: string; // minuto 2 caracteres
   dia: string; // dia 2 caracteres
   mes: string; // mes 2 caracteres
   ano: string; // ano 4 caracteres
   direcao: string; // direcao 1 caracter (E ou S)
   fixo: string; // fixo, seila
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   GetLocaleFormatSettings( GetUserDefaultLCID, MySettings );
   MySettings.DateSeparator := '-';
   MySettings.TimeSeparator := ':';
   MySettings.ShortDateFormat := 'yyyy-mm-dd';
   MySettings.ShortTimeFormat := 'hh:nn:ss';

   for i := 0 to (ALinhas.Count-1) do begin

      if (Length(Trim(ALinhas.Strings[i])) <> 26) then
      begin
         //Erro!!
         Continue;
      end;

      linha := Trim(ALinhas.Strings[i]);

      try
         matricula := Copy( linha, 1, 8 );
         hora := Copy( linha, 9, 2 );
         minuto := Copy( linha, 11, 2 );
         dia := Copy( linha, 13, 2 );
         mes := Copy( linha, 15, 2 );
         ano := Copy( linha, 17, 4 );
         direcao := Copy( linha, 21, 1 );
         fixo := Copy( linha, 22, 5 );

         // Se ao fazer a conversão conter erro, vamos para o próximo registro
         StrToInt( matricula );
         StrToInt( hora );
         StrToInt( minuto );
         StrToInt( dia );
         StrToInt( mes );
         StrToInt( ano );
      except
         Continue;
      end;

      if not ( StrToInt( matricula ) > 0 ) then
         Continue;

      oItem := TImpRegistro.Create(); 
      oItem.UsaMatricula := True;
      oItem.Conteudo := ALinhas.Strings[i];

      try
         if ( UpperCase( direcao ) = 'E' ) then
            oItem.Tipo := itEntrada
         else
            oItem.Tipo := itSaida;

         oItem.Data := StrToDateTime( ano + '-' + mes + '-' + dia + ' ' + hora + ':' + minuto + ':00', MySettings );
         oItem.Codigo := StrToInt( matricula );
      finally
         Result.AddObject('', oItem);
      end;
   end;
end;

{ TImpCatracaFlexpointPessoa }

function TImpCatracaFlexpointPessoa.processaArquivo(sArquivo: string): TStringList;
var
   MySettings: TFormatSettings;
   i: Integer;
   oItem: TImpRegistro;
   linha: string;
   matricula: string; // matricula 8 caracteres
   hora: string; // hora 2 caracteres
   minuto: string; // minuto 2 caracteres
   dia: string; // dia 2 caracteres
   mes: string; // mes 2 caracteres
   ano: string; // ano 4 caracteres
   direcao: string; // direcao 1 caracter (E ou S)
   fixo: string; // fixo, seila
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   GetLocaleFormatSettings( GetUserDefaultLCID, MySettings );
   MySettings.DateSeparator := '-';
   MySettings.TimeSeparator := ':';
   MySettings.ShortDateFormat := 'yyyy-mm-dd';
   MySettings.ShortTimeFormat := 'hh:nn:ss';

   for i := 0 to (ALinhas.Count-1) do begin

      if (Length(Trim(ALinhas.Strings[i])) <> 26) then
      begin
         //Erro!!
         Continue;
      end;

      linha := Trim(ALinhas.Strings[i]);

      try
         matricula := Copy( linha, 1, 8 );
         hora := Copy( linha, 9, 2 );
         minuto := Copy( linha, 11, 2 );
         dia := Copy( linha, 13, 2 );
         mes := Copy( linha, 15, 2 );
         ano := Copy( linha, 17, 4 );
         direcao := Copy( linha, 21, 1 );
         fixo := Copy( linha, 22, 5 );

         // Se ao fazer a conversão conter erro, vamos para o próximo registro
         StrToInt( matricula );
         StrToInt( hora );
         StrToInt( minuto );
         StrToInt( dia );
         StrToInt( mes );
         StrToInt( ano );
      except
         Continue;
      end;

      if not ( StrToInt( matricula ) > 0 ) then
         Continue;

      oItem := TImpRegistro.Create(); 
      oItem.UsaMatricula := False;
      oItem.Conteudo := ALinhas.Strings[i];

      try
         if ( UpperCase( direcao ) = 'E' ) then
            oItem.Tipo := itEntrada
         else
            oItem.Tipo := itSaida;

         oItem.Data := StrToDateTime( ano + '-' + mes + '-' + dia + ' ' + hora + ':' + minuto + ':00', MySettings );
         oItem.Codigo := StrToInt( matricula );
      finally
         Result.AddObject('', oItem);
      end;
   end;
end;

function TImpCatracaHenry.processaArquivo(sArquivo: string): TStringList;
var
   MySettings: TFormatSettings;
   i: Integer;
   linha: string;
   matricula, hora, minuto, segundo, dia, mes, ano, direcao: string;
   oItem: TImpRegistro;
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   GetLocaleFormatSettings( GetUserDefaultLCID, MySettings );
   MySettings.DateSeparator := '-';
   MySettings.TimeSeparator := ':';
   MySettings.ShortDateFormat := 'yyyy-mm-dd';
   MySettings.ShortTimeFormat := 'hh:nn:ss';

   for i := 0 to (ALinhas.Count-1) do begin

      if (Length(Trim(ALinhas.Strings[i])) <> 49) then
      begin
         //Erro!!
         Continue;
      end;

      linha := Trim(ALinhas.Strings[i]);

      try
         direcao := Copy( linha, 4, 1 );
         dia := Copy( linha, 10, 2 );
         mes := Copy( linha, 13, 2 );
         ano := Copy( linha, 16, 4 );
         hora := Copy( linha, 21, 2 );
         minuto := Copy( linha, 24, 2 );
         segundo := Copy( linha, 27, 2 );
         matricula := Copy( linha, 30, 20 );

         // Se ao fazer a conversão conter erro, vamos para o próximo registro
         StrToInt( matricula );
         StrToInt( hora );
         StrToInt( minuto );
         StrToInt( dia );
         StrToInt( mes );
         StrToInt( ano );
      except
         Continue;
      end;

      if not ( StrToInt( matricula ) > 0 ) then
         Continue;

      oItem := TImpRegistro.Create();
      oItem.Conteudo := ALinhas.Strings[i];
      oItem.UsaMatricula := False;

      try
         if ( UpperCase( direcao ) = 'S' ) then
            oItem.Tipo := itEntrada
         else
            oItem.Tipo := itSaida;

         oItem.Data := StrToDateTime( ano + '-' + mes + '-' + dia + ' ' + hora + ':' + minuto + ':' + segundo, MySettings );
         oItem.Codigo := StrToInt( matricula );
      finally
         Result.AddObject('', oItem);
      end;
   end;
end;

{ TImpCatracaInnersNew }

constructor TImpCatracaInnersNew.create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca);
begin
   inherited create(AUSvcImportacaoTerminalCatraca);
   AHistorico := TStringList.Create;
   qryVerificaBase := Self.FUSvcImportacaoTerminalCatraca.UMConn.newQuery;
   qryVerificaBase.SQL.Clear();
   qryVerificaBase.Params.Clear();
   qryVerificaBase.SQL.Add(''+
   'SELECT                                 '+
   '     codigo, dt_entrada, dt_saida      '+
   'FROM                                   '+
   '    diario_terminal_acessos dta        '+
   'WHERE                                  '+
   '     cd_pessoa = :cdpessoa             '+
   '     AND sn_finalizado = 0             '+
   '     AND (DATE_FORMAT(dt_entrada, "%Y-%m-%d") = :dt) '+
   '     AND ((dt_saida IS NULL) OR (DATE_FORMAT(dt_saida, "%Y-%m-%d") = :dt)) '+
   'ORDER BY                               '+
   '      dt_entrada DESC                  '+
   ' LIMIT 1                               '+
   '');
end;

procedure TImpCatracaInnersNew.defineEntradaSaida(oItem: TImpRegistro);
var
   sId: string;
begin
   sId := IntToStr(oItem.Codigo) + ':' + FormatDateTime('yyyy-mm-dd', oItem.Data);
   //verificar no historico, se ja tem algo, se nao tiver, pega da base
   if (AHistorico.IndexOfName(sId) = -1) then begin
      //tenta pegar de base
      with qryVerificaBase do begin
         Close();
         ParamByName('cdpessoa').AsInteger := oItem.Codigo;
         ParamByName('dt').AsString := FormatDateTime('yyyy-mm-dd', oItem.Data);
         Open();
         //se tiver vazio, signifca que é entrada
         if (IsEmpty) then begin
            oItem.Tipo := itEntrada;
            AHistorico.Add(sId + '=' + 'ENT');
         end
         else begin
            oItem.Tipo := itSaida;
            AHistorico.Add(sId + '=' + 'SAI');
         end;
         Close();
      end;
   end
   else begin
      if (AHistorico.Values[sId] = 'SAI') then begin
         oItem.Tipo := itEntrada;
         AHistorico.Values[sId] := 'ENT';
      end
      else if (AHistorico.Values[sId] = 'ENT') then begin
         oItem.Tipo := itSaida;
         AHistorico.Values[sId] := 'SAI';
      end;
   end;
end;

function TImpCatracaInnersNew.processaArquivo(sArquivo: String): TStringList;
var
   slAux: TStringList;
   oItem: TImpRegistro;
   i: Integer;
   dtTemp, hrTemp: TDateTime;
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   for i := 0 to (ALinhas.Count-1) do begin

      // Verifica se existe erro na sintaxe do arquivo
      if not (Length(Trim(ALinhas.Strings[i])) <= 41) then begin
         // Cria o registro somente informando que o mesmo possui erro
         oItem := TImpRegistro.Create();
         oItem.Conteudo := ALinhas.Strings[i];
         oItem.Invalido := true;
         Result.AddObject('', oItem);

         // Como ocorreu o erro, continua o processamento para o próximo registro
         Continue;
      end;
      // Separar os campos pelos espaços
      slAux := TFuncString.splitString(Trim(ALinhas.Strings[i]), ' ');

      if (slAux.Count >= 3 ) then begin
         //continua processando
         oItem := TImpRegistro.Create();
         oItem.Conteudo := ALinhas.Strings[i];

         //Data
         try
            dtTemp := StrToDate(slAux.Strings[0]);
            hrTemp := StrToDateTime(slAux.Strings[1]);
            oItem.Data := (dtTemp+hrTemp);
         except
            oItem.Data := Self.FUSvcImportacaoTerminalCatraca.NowFromDB;
         end;

         //Codigo
         try
            //Pega apenas os ultimos 6 caracteres do código.
            oItem.Codigo := StrToInt(copy(slAux.Strings[2], (Length(slAux.Strings[2]) - 5), 6));
         except
            oItem.Invalido := true;
         end;

         defineEntradaSaida(oItem);

         Result.AddObject('', oItem);
         
      end else begin
         // Cria o registro somente informando que o mesmo possui erro
         oItem := TImpRegistro.Create();
         oItem.Conteudo := ALinhas.Strings[i];
         oItem.Invalido := true;
         Result.AddObject('', oItem);
      end;
   end;
end;

{ TImpCatracaPrimmePonto }

constructor TImpCatracaPrimmePonto.create;
begin
   inherited create(AUSvcImportacaoTerminalCatraca);
   AHistorico := TStringList.Create;
   qryVerificaBase := Self.FUSvcImportacaoTerminalCatraca.UMConn.newQuery;
   qryVerificaBase.SQL.Clear();
   qryVerificaBase.Params.Clear();
   qryVerificaBase.SQL.Add(''+
   'SELECT                                 '+
   '     codigo, dt_entrada, dt_saida      '+
   'FROM                                   '+
   '    diario_terminal_acessos dta        '+
   'WHERE                                  '+
   '     cd_pessoa = :cdpessoa             '+
   '     AND sn_finalizado = 0             '+
   '     AND (DATE_FORMAT(dt_entrada, "%Y-%m-%d") = :dt) '+
   '     AND ((dt_saida IS NULL) OR (DATE_FORMAT(dt_saida, "%Y-%m-%d") = :dt)) '+
   'ORDER BY                               '+
   '      dt_entrada DESC                  '+
   ' LIMIT 1                               '+
   '');
end;

procedure TImpCatracaPrimmePonto.defineEntradaSaida(oItem: TImpRegistro);
var
   sId: string;
begin
   sId := IntToStr(oItem.Codigo) + ':' + FormatDateTime('yyyy-mm-dd', oItem.Data);
   //verificar no historico, se ja tem algo, se nao tiver, pega da base
   if (AHistorico.IndexOfName(sId) = -1) then begin
      //tenta pegar de base
      with qryVerificaBase do begin
         Close();
         ParamByName('cdpessoa').AsInteger := oItem.Codigo;
         ParamByName('dt').AsString := FormatDateTime('yyyy-mm-dd', oItem.Data);
         Open();
         //se tiver vazio, signifca que é entrada
         if (IsEmpty) then begin
            oItem.Tipo := itEntrada;
            AHistorico.Add(sId + '=' + 'ENT');
         end
         else begin
            oItem.Tipo := itSaida;
            AHistorico.Add(sId + '=' + 'SAI');
         end;
         Close();
      end;
   end
   else begin
      if (AHistorico.Values[sId] = 'SAI') then begin
         oItem.Tipo := itEntrada;
         AHistorico.Values[sId] := 'ENT';
      end
      else if (AHistorico.Values[sId] = 'ENT') then begin
         oItem.Tipo := itSaida;
         AHistorico.Values[sId] := 'SAI';
      end;
   end;
end;

function TImpCatracaPrimmePonto.processaArquivo(sArquivo: String): TStringList;
var
   slAux: TStringList;
   oItem: TImpRegistro;
   i: Integer;
   dtTemp, hrTemp: TDateTime;
begin
   inherited processaArquivo(sArquivo);
   Result := TStringList.Create();

   for i := 0 to (ALinhas.Count-1) do begin

      if (Length(Trim(ALinhas.Strings[i])) >= 30) then begin
         //Erro!!;
         Continue;
      end;
      // Separar os campos pelos espaços
      slAux := TFuncString.splitString(Trim(ALinhas.Strings[i]), ' ');

      if (slAux.Count >= 3 ) then begin
         //continua processando
         oItem := TImpRegistro.Create();
         oItem.Conteudo := ALinhas.Strings[i];

         //Data
         try
            // Formata data e hora
            slAux.Strings[0] := copy(slAux.Strings[0],0,2) + '/' + copy(slAux.Strings[0],3,2) + '/' + copy(slAux.Strings[0],5,4);
            slAux.Strings[1] := copy(slAux.Strings[1],0,2) + ':' + copy(slAux.Strings[1],3,2);
            dtTemp := StrToDate(slAux.Strings[0]);
            hrTemp := StrToDateTime(slAux.Strings[1]);
            oItem.Data := (dtTemp+hrTemp);
         except
            oItem.Data := Self.FUSvcImportacaoTerminalCatraca.NowFromDB;
         end;

         //Codigo
         try
            oItem.Codigo := StrToInt(Trim(slAux.Strings[2]));
         except
            oItem.Invalido := true;
         end;

         defineEntradaSaida(oItem);

         Result.AddObject('', oItem);
         
      end
      else begin
         //nao é registro válido
      end;
   end;

end;

end.
