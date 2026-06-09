{*******************************************************************************

  Unit Para Gerenciar Cabecalhos de Relatórios

  Através das Classes TRelObjetosItem e TRelObjetos, temos vários cabecalhos
  personalizáveis.

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  @author Uninformare Informática
  @version 3/02/2005

*******************************************************************************}
unit uRelUtils;

interface

uses
   SysUtils, Classes, UCrpeClasses, UCrpe32, uRegExpr, UCrpeUtl, StrUtils,
   CRAXDRT_TLB, ActiveX, Variants, uDM;

const
  ENTER: string = #$D#$A; //* String de Enter

type
  TImpRet = (irSucesso, irErrArquivo, irErrFormula);
  TRelTipo = (rtTxt, rtImg, rtNone);
  TRelItem = record
      FTipo: TRelTipo;
      FNome: string[5];
      FEsquerda: LongInt;
      FTopo: LongInt;
      FLargura: LongInt;
      FAltura: LongInt;
      FValor: string;
      FSource: string;
  end;
   {**
      Classe TRelObjetosItem
      Classe para guardar dados de um Cabecalho em memória
   }
  TRelObjetosItem = class (TObject)
   private
      FCodCabecalho: LongInt;
      FRegExp: TRegExpr;
      FItems: array of TRelItem;
      function CheckRange(Index: Integer): Boolean;
      function MilimToTwips(iMm: Integer): LongInt;
      function getAtrValor(sl: TStringList; sNome: string): LongInt;
      procedure Split(sBase, sQuebra: string; var slRetorno: TStringList);
   protected
   public
      constructor Create(iCdCabecalho: LongInt);
      destructor Destroy(); override;
      procedure setCodigo(nCod: LongInt);
      procedure setTipo(Index: Integer; nTipo: TRelTipo);
      procedure setNome(Index: Integer; nNome: string);
      procedure setEsquerda(Index: Integer; nEsq: Integer);
      procedure setTopo(Index: Integer; nTop: Integer);
      procedure setLargura(Index: Integer; nLar: Integer);
      procedure setAltura(Index: Integer; nAlt: Integer);
      procedure setValor(Index: Integer; nValor: string);
      procedure setSource(Index: Integer; nValor: string);

      function getCodigo(): LongInt;
      function getTipo(Index: Integer): TRelTipo;
      function getNome(Index: Integer): string;
      function getEsquerda(Index: Integer): LongInt;
      function getTopo(Index: Integer): LongInt;
      function getLargura(Index: Integer): LongInt;
      function getAltura(Index: Integer): LongInt;
      function getValor(Index: Integer): string;
      function getSource(Index: Integer): string;

      function Add(sNome: string; slAtr: TStringList = nil;  sSource: string = ''): Integer;

      procedure Clear();
      function Count(): Integer;
      function First(): Integer;

      procedure ProcessaRelObjetos(sCampos: string; slParamFixos: TStringList);
      procedure ProcessaParam(Index: Integer; slParam: TStringList = nil; bFixo: Boolean = True);
     // procedure ProcessaParamFixos(Index: Integer; slParamFixos: TStringList);


  end;
   {**
      Classe TRelObjetos
      Classe para guardar todos os cabecalhos
   }
  TRelObjetos = class(TObject)
  private
      FObjetos: array of TRelObjetosItem;
      function CheckRange(Index: Integer): Boolean;

      procedure CarregaNoRelatorio(var Rel: TCrpe; sSub: string; var ObjItem: TRelObjetosItem);
  protected
  public
    constructor Create();
    destructor Destroy(); override;
    procedure Add(iCodCabecalho: LongInt);
    procedure Clear();
    function Count(): Integer;
    function First(): Integer;
    function getObjetoItem(iCodRelatorio: LongInt): TRelObjetosItem;
    function FindObjetoItem(iCodRelatorio: LongInt): Integer;
    procedure DefineCabecalho(var Rel: TCrpe; sSubRelNome: string; iCodCabecalho: Integer; slParamVariaveis: TStringList);
    procedure ProcessaParamVariaveis(var ObjItem: TRelObjetosItem; slParam: TStringList = nil);
  published

  end;

   procedure UpdateReportConnection(const ReportPath: AnsiString);

var
  RelObj: TRelObjetos;
  Relatorio : TCrpe;

implementation

uses ZConnection;

{-------------------------------------------------------------------------------
                      Classe TRelObjetosItem
-------------------------------------------------------------------------------}
function TRelObjetosItem.Add(sNome: string; slAtr: TStringList = nil;  sSource: string = ''): Integer;
var
   i: Integer;
begin
   Result := 0;
   i := High(FItems) + 1;
   SetLength(FItems, i+1);
   if (High(FItems) = i) then
   begin
      FItems[i].FNome := sNome;

      if (LeftStr(sNome, 3) = 'TXT') then begin
         FItems[i].FTipo := rtTxt;
      end
      else if (LeftStr(sNome, 3) = 'IMG') then begin
         FItems[i].FTipo := rtImg;
      end
      else begin
         FItems[i].FTipo := rtNone;
      end;
      if slAtr <> nil then
      begin
         FItems[i].FEsquerda := getAtrValor(slAtr, 'esq');
         FItems[i].FTopo := getAtrValor(slAtr, 'top');
         FItems[i].FAltura := getAtrValor(slAtr, 'alt');
         FItems[i].FLargura := getAtrValor(slAtr, 'lar');
         FItems[i].FValor := StringReplace(sSource, ENTER, ' ', [rfReplaceAll]);
         FItems[i].FSource := StringReplace(sSource, ENTER, ' ', [rfReplaceAll]);
      end;
   Result := i;
   end;
end;

function TRelObjetosItem.getAltura(Index: Integer): LongInt;
begin
   Result := 0;
   if CheckRange(Index) then begin
      Result := FItems[Index].FAltura;
   end;
end;

function TRelObjetosItem.getEsquerda(Index: Integer): LongInt;
begin
   Result := 0;
   if CheckRange(Index) then begin
      Result := FItems[Index].FEsquerda;
   end;
end;

function TRelObjetosItem.getLargura(Index: Integer): LongInt;
begin
   Result := 0;
   if CheckRange(Index) then begin
      Result := FItems[Index].FLargura;
   end;
end;

function TRelObjetosItem.getNome(Index: Integer): string;
begin
   Result := '';
   if CheckRange(Index) then begin
      Result := FItems[Index].FNome;
   end;
end;

function TRelObjetosItem.getTipo(Index: Integer): TRelTipo;
begin
   Result := rtNone;
   if CheckRange(Index) then begin
      Result := FItems[Index].FTipo;
   end;
end;

function TRelObjetosItem.getTopo(Index: Integer): LongInt;
begin
   Result := 0;
   if CheckRange(Index) then begin
      Result := FItems[Index].FTopo;
   end;
end;

function TRelObjetosItem.getValor(Index: Integer): string;
begin
   if CheckRange(Index) then begin
      Result := FItems[Index].FValor;
   end;
end;

procedure TRelObjetosItem.setAltura(Index, nAlt: Integer);
begin
   if CheckRange(Index) then begin
      if (nAlt > 0) then begin
         FItems[Index].FAltura := MilimToTwips(nAlt);
      end;
   end;
end;

procedure TRelObjetosItem.setEsquerda(Index, nEsq: Integer);
begin
   if CheckRange(Index) then begin
      if (nEsq > 0) then begin
         FItems[Index].FEsquerda := MilimToTwips(nEsq);
      end;
   end;
end;

procedure TRelObjetosItem.setLargura(Index, nLar: Integer);
begin
   if CheckRange(Index) then begin
      if (nLar > 0) then begin
         FItems[Index].FLargura := MilimToTwips(nLar);
      end;
   end;
end;

procedure TRelObjetosItem.setNome(Index: Integer; nNome: string);
begin
   if CheckRange(Index) then begin
      if (Length(nNome) > 0) then begin
         FItems[Index].FNome := nNome;
      end;
   end;
end;

procedure TRelObjetosItem.setTipo(Index: Integer; nTipo: TRelTipo);
begin
   if CheckRange(Index) then begin
      FItems[Index].FTipo := nTipo;
   end;
end;

procedure TRelObjetosItem.setTopo(Index, nTop: Integer);
begin
   if CheckRange(Index) then begin
      if (nTop > 0) then begin
         FItems[Index].FTopo := MilimToTwips(nTop);
      end;
   end;
end;

procedure TRelObjetosItem.setValor(Index: Integer; nValor: string);
begin
   if CheckRange(Index) then begin
      if (Length(nValor) > 0) then begin
         FItems[Index].FValor := nValor;
      end;
   end;
end;

function TRelObjetosItem.CheckRange(Index: Integer): Boolean;
begin
   Result := ((Index >= Low(FItems)) and (Index <= High(FItems)));
end;

procedure TRelObjetosItem.Clear();
begin
   SetLength(FItems, 0);
end;

function TRelObjetosItem.Count(): Integer;
begin
   Result := High(FItems);
end;

constructor TRelObjetosItem.Create(iCdCabecalho: Integer);
begin
   SetLength(FItems, 0);
   inherited Create();
   FCodCabecalho := iCdCabecalho;
end;

destructor TRelObjetosItem.Destroy();
begin
   Self.Clear();
   inherited Destroy();
end;

function TRelObjetosItem.getCodigo(): LongInt;
begin
   Result := FCodCabecalho;
end;

procedure TRelObjetosItem.setCodigo(nCod: LongInt);
begin
   FCodCabecalho := nCod;
end;

function TRelObjetosItem.MilimToTwips(iMm: Integer): LongInt;
var
   dAux: Double;
begin
   dAux := (iMM * 1440) / 25.4;

   Result := Trunc(dAux);
end;

procedure TRelObjetosItem.ProcessaRelObjetos(sCampos: string; slParamFixos: TStringList);
var
   i: Integer;
   rE: TRegExpr;
   slAux: TStringList;
begin
    //
   rE := TRegExpr.Create();
   slAux := TStringList.Create();

   //captura dados
   rE.ModifierI := True;
   rE.ModifierS := True;
   rE.ModifierM := False;
   rE.Expression := '<(TXT[0-9]{2}|IMG[0-9]{2})(.*?)>(.*?)</\1>';

   if rE.Exec(sCampos) then begin
      repeat

         slAux.Clear();
         Split(Trim(rE.Match[2]), ' ', slAux);
         i := Add(rE.Match[1], slAux, rE.Match[3]);
         if (getTipo(i) = rtTxt) then begin
            ProcessaParam(i, slParamFixos, True);
         end;

      until not rE.ExecNext()
   end;
   //FreeAndNil(slAux);

end;

function TRelObjetosItem.getAtrValor(sl: TStringList; sNome: string): LongInt;
var
   i: Integer;
begin
   i := sl.IndexOfName(sNome);
   if (i >= 0) then begin
      Result := MilimToTwips(StrToInt(sl.ValueFromIndex[i]));
   end
   else begin
      Result := -1;
   end;
end;

procedure TRelObjetosItem.Split(sBase, sQuebra: string; var slRetorno: TStringList);
var
   EndOfCurrentString: byte;
begin
   slRetorno.Clear();
   repeat
      EndOfCurrentString := Pos(sQuebra, sBase);
      if EndOfCurrentString = 0 then begin
         slRetorno.Add(sBase);
      end
      else begin
         slRetorno.Add(Copy(sBase, 1, EndOfCurrentString - 1));
      end;
      sBase := Copy(sBase, EndOfCurrentString + Length(sQuebra), Length(sBase) - EndOfCurrentString);
   until EndOfCurrentString = 0;
end;

function TRelObjetosItem.getSource(Index: Integer): string;
begin
   if CheckRange(Index) then begin
      Result := FItems[Index].FSource;
   end;
end;

procedure TRelObjetosItem.setSource(Index: Integer; nValor: string);
begin
   if CheckRange(Index) then begin
      if (Length(nValor) > 0) then begin
         FItems[Index].FSource := nValor;
      end;
   end;
end;

function TRelObjetosItem.First(): Integer;
begin
   Result := Low(FItems);
end;

procedure TRelObjetosItem.ProcessaParam(Index: Integer; slParam: TStringList;
  bFixo: Boolean);
var
   i: Integer;
   sAux: String;
begin
   if CheckRange(Index) then begin

      if (getTipo(Index) = rtTxt) then begin
         sAux := getSource(Index);

         if FRegExp = nil then
            FRegExp := TRegExpr.Create();

         //captura dados
         FRegExp.ModifierI := True;
         FRegExp.ModifierS := True;
         FRegExp.ModifierM := False;
         if bFixo then
            FRegExp.Expression := '\(\$([A-z0-9_-]*?)\$\)'
         else
            FRegExp.Expression := '\[\$([A-z0-9_-]*?)\$\]';

         if slParam = nil then begin
            FRegExp.Replace(sAux, '', True);
         end
         else begin
            if FRegExp.Exec(sAux) then begin

               repeat
                  i := slParam.IndexOfName(FRegExp.Match[1]);
                  if (i >= 0) then begin
                     sAux := StringReplace(sAux, FRegExp.Match[0], slParam.ValueFromIndex[i], [rfReplaceAll, rfIgnoreCase]);
                  end
                  else begin
                     sAux := StringReplace(sAux, FRegExp.Match[0], '', [rfReplaceAll, rfIgnoreCase]);
                  end;

               until not FRegExp.ExecNext()
            end;
         end;
         setValor(Index, sAux);
         if bFixo then
            setSource(Index, sAux);
      end;
   end;

end;


{-------------------------------------------------------------------------------
                      Classe TRelObjetos
-------------------------------------------------------------------------------}
constructor TRelObjetos.Create();
begin
   SetLength(FObjetos, 0);
  inherited Create();
end;

destructor TRelObjetos.Destroy();
begin
  Self.Clear();
  inherited Destroy();
end;

procedure TRelObjetos.Add(iCodCabecalho: LongInt);
var
   i: Integer;
begin
   i := High(FObjetos) + 1;
   SetLength(FObjetos, i+1);
   
   if (High(FObjetos) = i) then begin
      FObjetos[i] := TRelObjetosItem.Create(iCodCabecalho);
   end;
end;

procedure TRelObjetos.Clear();
var
   i: Integer;
begin
  for i := Low(FObjetos) to High(FObjetos) do begin
      FreeAndNil(FObjetos[i]);
  end;
  SetLength(FObjetos, 0);
end;


function TRelObjetos.FindObjetoItem(iCodRelatorio: LongInt): Integer;
var
   i: Integer;
begin
   Result := -1;
   for i := Low(FObjetos) to High(FObjetos) do begin
      if FObjetos[i].getCodigo() = iCodRelatorio then begin
         Result := i;
         Break;
      end;
   end;
end;

function TRelObjetos.getObjetoItem(iCodRelatorio: LongInt): TRelObjetosItem;
var
   i: Integer;
begin
   Result := nil;
   i := Self.FindObjetoItem(iCodRelatorio);
   if CheckRange(i) then begin
      Result := FObjetos[i];
   end;
end;

function TRelObjetos.CheckRange(Index: Integer): Boolean;
begin
   Result := ((Index >= Low(FObjetos)) and (Index <= High(FObjetos)));
end;

function TRelObjetos.Count(): Integer;
begin
   Result := High(FObjetos);
end;

function TRelObjetos.First(): Integer;
begin
   Result := Low(FObjetos);
end;

procedure TRelObjetos.DefineCabecalho(var Rel: TCrpe; sSubRelNome: string; iCodCabecalho: Integer;
  slParamVariaveis: TStringList);
var
   ObjItem: TRelObjetosItem;
begin
   if (Rel.Subreports.IndexOf(sSubRelNome) > -1) then begin
      if (FindObjetoItem(iCodCabecalho) > -1) then begin

         ObjItem := RelObj.getObjetoItem(iCodCabecalho);

         //processa parametros variaveis
         ProcessaParamVariaveis(ObjItem, slParamVariaveis);

         //carrega no relatorio
         CarregaNoRelatorio(Rel, sSubRelNome, ObjItem);

         //define selectionformula
         //Rel.SubreportByName(sSubRelNome).Selection.Formula.Add('{relatorios_cabecalhos.cd_cabecalho} = ' + IntToStr(iCodCabecalho));
      end;
   end;
end;


procedure TRelObjetos.CarregaNoRelatorio(var Rel: TCrpe; sSub: string;
  var ObjItem: TRelObjetosItem);
var
   iAux: LongInt;
   sAux: string;
   i: Integer;
begin
   for i := ObjItem.First() to ObjItem.Count() do begin
      try
         Rel.SubreportByName(sSub);

         if (ObjItem.getTipo(i) = rtTxt) then begin
            with Rel.Formulas.ByName(ObjItem.getNome(i)) do begin
               //esquerda
               iAux := ObjItem.getEsquerda(i);
               if (iAux > -1) then Left := iAux;

               //topo
               iAux := ObjItem.getTopo(i);
               if (iAux > -1) then Top := iAux;

               //largura
               iAux := ObjItem.getLargura(i);
               if (iAux > -1) then Width := iAux;

               //altura
               iAux := ObjItem.getAltura(i);
               if (iAux > -1) then Height := iAux;

               //valor
               sAux := ObjItem.getValor(i);
               if (Length(sAux) > -1) then Formula.Text := sAux;
            end;
         end
         else if (ObjItem.getTipo(i) = rtImg) then begin

            iAux := StrToInt(Copy(ObjItem.getNome(i),4, 2));
            Rel.Pictures.ItemIndex := iAux;

            with Rel.Pictures.Item do begin
               //esquerda
               iAux := ObjItem.getEsquerda(i);
               if (iAux > -1) then Left := iAux;

               //topo
               iAux := ObjItem.getTopo(i);
               if (iAux > -1) then Top := iAux;

               //largura
               iAux := ObjItem.getLargura(i);
               if (iAux > -1) then Width := iAux;

               //altura
               iAux := ObjItem.getAltura(i);
               if (iAux > -1) then Height := iAux;

            end;

         end;

      except
      end;

   end;
end;

procedure TRelObjetos.ProcessaParamVariaveis(var ObjItem: TRelObjetosItem;
  slParam: TStringList);
var
   i: Integer;
begin
   for i := ObjItem.First() to ObjItem.Count() do begin
      ObjItem.ProcessaParam(i, slParam, False);
   end;
end;

procedure UpdateReportConnection(const ReportPath: AnsiString);
var
   CrApp: CRAXDRT_TLB.IApplication;
   CrReport, CrSubReport: CRAXDRT_TLB.IReport;
   CrSections: CRAXDRT_TLB.ISections;
   CrSection: CRAXDRT_TLB.ISection;
   CrObjects: CRAXDRT_TLB.IReportObjects;
   CrObject: CRAXDRT_TLB.IReportObject;
   CrSubReportObject: CRAXDRT_TLB.ISubreportObject;
   ServerName, DatabaseName, UserID, Password: AnsiString;
   I, J, K: Integer;
begin
   ServerName := 'unimestre';
   DatabaseName := DM.db.Database;
   UserID := DM.db.User;
   Password := DM.db.Password;

   CoInitialize(nil);
   try
      CrApp := CoApplication.Create;
      CrReport := CrApp.OpenReport(ReportPath, crOpenReportByDefault);

      for I := 1 to CrReport.Database.Tables.Count do
      begin
         CrReport.Database.Tables[I].SetLogOnInfo(ServerName, DatabaseName,
            UserID, Password);
         CrReport.Database.Tables[I].Location :=
            CrReport.Database.Tables[I].Location;
      end;

      CrSections := CrReport.Sections;

      for I := 1 to CrSections.Count do
      begin
         CrSection := CrSections[I];
         CrObjects := CrSection.ReportObjects;

         for J := 1 to CrObjects.Count do
         begin
            CrObject := CrObjects[J] as IReportObject;

            if CrObject.Kind = CRAXDRT_TLB.crSubreportObject then
            begin

               CrSubReportObject := CrObject as ISubreportObject;
               CrSubReport := CrSubReportObject.OpenSubreport;

               for K := 1 to CrSubReport.Database.Tables.Count do
               begin
                  CrSubReport.Database.Tables[k].SetLogOnInfo(ServerName,
                     DatabaseName, UserID, Password);
                  CrSubReport.Database.Tables[K].Location :=
                     CrSubReport.Database.Tables[K].Location;
               end;

               CrSubReport := nil;               
            end;
         end;
      end;

      CrReport.Save(ReportPath);

      CrReport := nil;
      CrApp := nil;

   finally
      CoUninitialize;
   end;
end;

end.

