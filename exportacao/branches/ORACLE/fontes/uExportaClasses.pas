unit uExportaClasses;

interface

uses
   SysUtils, Forms, Controls, Windows, IniFiles, Graphics, Classes,
   StrUtils, uPSRuntime, uPSComponent, uRegExpr, ZDataset, UZDataset;

const
   L_LINE_NUMBER: string = 'LINHA_NUMERO';
   L_LINE_NUMBER_USED: string = 'LINHA_NUMERO_USADO';
   L_REG_NUMBER: string = 'REGISTRO_NUMERO';
   L_NM_ARQUIVO: string = 'ARQUIVO';
   L_ARQ_NUMBER: string = 'ARQUIVO_NUMERO';
   L_COMP_VARS: Integer = 99;

type
   {OLIVER - Objeto exportação}
   TLoggerExportacao = class(TObject)
   private
      FIsProcesso: Boolean;
      FProcesso, FCodigoUsuario, FNroExportacao: Integer;

      function GetProximaExportacao(): Integer;
      function GetNroExportacaoAtual(): Integer;
   public
      constructor Create(); overload;

      procedure SetIsProcesso(Valor: Boolean);
      procedure SetProcesso(Valor: Integer);
      function GetProcesso(): Integer;

      procedure SetUsuario(Valor: String);
      function GetUsuario(): Integer;

      // Procedure que irá inserir o registro na tabela expo_processo_logs
      procedure LogaExportacao();
      // Procedure que irá inserir os registros na tabela expo_processo_item
      procedure LogaItem(const cd_item: Integer; const ds_item: String);
      // Procedure que irá inserir os registros na tabela expo_processo_especificacoes
      procedure LogaEspecificacao(const cd_item, cd_especificacao: Integer; ds_especificacao: String);
      // Procedure que irá inserir os registros na tabela expo_processo_valores
      procedure LogaValor(const cd_item, cd_especificacao, nr_linha: Integer; const me_valor: String);

      // Salva o arquivo na exportação atual
      procedure SalvaArquivo(const arquivo: String);
   end;

   TExpoCampo = class(TObject)
   private
      ANome: string;
      ATabela: string;
      AConsulta: string;
      AUsaSQL: Boolean;
      ASQL: string;
      ACarregado: Boolean;
   protected
   public
     constructor Create;
     destructor Destroy; override;
     procedure setNome(sCampo: string);
     procedure setTabela(sTabela: string);
     procedure setConsulta(sConsulta: string);
     procedure setUsaSQL(bUsaSQL: Boolean);
     procedure setSQL(sSQL: string);
     procedure setCarregado(bValor: Boolean);
     function getNome(): string;
     function getTabela(): string;
     function getConsulta(): string;
     function usaSQL(): Boolean;
     function getSQL(): string;
     function getCampo(): string;
     function getApelido(): string;
     function isCarregado(): Boolean;
   published
   end;
   TExpoScriptCompilador = class(TObject)
   private
      APS: TPSScript;
      AFnList: TStringList;
      AVariaveis: TStringList;
      ARegExp: TRegExpr;
      AOut: TStringList;
      procedure setVarByName(sNome: string; sValor: String);
      function getVarByName(sNome: string): string;
      function getOutput(): TStringList;
      procedure setOutput(slDados: TStringList);
   protected
   published
      procedure OnBeforeCompile(Sender: TPSScript);
      procedure OnBeforeExecute(Sender: TPSScript);
   public
      property Output: TStringList read getOutput write setOutput;
      property VarByName[sNome: string]: string read getVarByName write setVarByName;
      constructor Create();
      destructor Destroy(); override;
      function compila(sDados: string): string;
      function executa(sCompilado: string): string;
      function CompilaExecuta(sCompilado: string): string;
   end;
   TExpoLayoutEspec = class(TObject)
   private
      AOrdem: Integer;
      ATamanho: Integer;
      ADesc: string;
      APreenchimento: string;
      APosicao: Integer;
      ATipo: Integer;
      ACompiled: Boolean;
      AStrCompilada: string;
      AListaCampos: TStringList;
      function getOrdem(): Integer;
      function getTamanho(): Integer;
      function getDesc(): string;
      function getPosicao(): Integer;
      function getPreenchimento(): string;
      function getTipo(): Integer;
      function getStrCompilada(): string;
      function getCompiled(): Boolean;
      function getCampos(): TStringList;
      procedure setOrdem(iValor: Integer);
      procedure setTamanho(iTamanho: Integer);
      procedure setDesc(sValor: string);
      procedure setPosicao(iVal: Integer);
      procedure setPreenchimento(sPreenchimento: string);
      procedure setTipo(iTipo: Integer);
      procedure setCompiled(bValor: Boolean);
      procedure setStrCompilada(sStrCompilada: string);
      procedure setCampos(slDados: TStringList);
   protected
   published
   public
      property Ordem: Integer read getOrdem write setOrdem;
      property Tamanho: Integer read getTamanho write setTamanho;
      property Desc: string read getDesc write setDesc;
      property Tipo: Integer read getTipo write setTipo;
      property Compilada: string read getStrCompilada write setStrCompilada;
      property Preenchimento: string read getPreenchimento write setPreenchimento;
      property Posicao: Integer read getPosicao write setPosicao;
      property Campos: TStringList read getCampos write setCampos;
      property Compiled: Boolean read getCompiled;
      constructor Create();
      destructor Destroy(); override;
      procedure parseValor(oComp: TExpoScriptCompilador);
      function getValor(oComp: TExpoScriptCompilador; oCampos, oFiltros: TStringList): string;
   end;
   TExpoLayoutItem = class(TObject)
   private
      AOrdem: Integer;
      ALayoutItem: Integer;
      ALayoutItemPai: Integer;
      ALayout: Integer;
      AConsulta: String;
      AEspec: TStringList;
      ACampos: TStringList;
      ASQLAntes: String;
      ASQLDepois: String;
      ASeparador: string;
      //procedure fndEspec();
      procedure SetOrdem(iValor: Integer);
      procedure setSeparador(sValor: string);
      procedure setLayoutItem(iCod: Integer);
      procedure setLayoutItemPai(iCod: Integer);
      procedure setLayout(iCod : Integer);
      procedure setConsulta(sConsulta : String);
      procedure setSQLAntes(sSQL: string);
      procedure setSQLDepois(sSQL: string);
      function getOrdem(): Integer;
      function getLayoutItem(): Integer;
      function getLayoutItemPai(): Integer;
      function getLayout(): Integer;
      function getConsulta(): string;
      function getSQLAntes(): string;
      function getSQLDepois(): string;
      function getEspecCount(): Integer;
      function getSeparador(): string;
      function getEspec(iPos: Integer): TExpoLayoutEspec;
      procedure setEspec(iPos: Integer; oEspec: TExpoLayoutEspec);
      function getCampo(sNome: string): TExpoCampo; overload;
      procedure setCampo(sNome: string; oCampo: TExpoCampo);
      function getCampo(iPos: Integer): TExpoCampo; overload;
      function getCampoCount(): Integer;
   protected
   published
   public
      property Ordem: Integer read getOrdem write setOrdem;
      property LayoutItem: Integer read getLayoutItem write setLayoutItem;
      property LayoutItemPai: Integer read getLayoutItemPai write setLayoutItemPai;
      property Consulta: string read getConsulta write setConsulta;
      property Layout: Integer read getLayout write setLayout;
      property Espec[iPos: Integer]: TExpoLayoutEspec read getEspec write setEspec;
      property EspecCount: Integer read getEspecCount;
      property Campo[iPos: Integer]: TExpoCampo read getCampo;
      property CampoByName[sCampo: string]: TExpoCampo read getCampo write setCampo;
      property CampoCount: Integer read getCampoCount;
      property Separador: string read getSeparador write setSeparador;
      property SQLAntes: string read getSQLAntes write setSQLAntes;
      property SQLDepois: string read getSQLDepois write setSQLDepois;
      constructor Create();
      destructor Destroy(); override;
      procedure addEspec(oEspec: TExpoLayoutEspec; iPos: Integer = -1);
      procedure remEspec(iPos: Integer);
      procedure getAllCampos(var slCampos: TStringList);

   end;
   TExpoLayout = class(TObject)
   private
      AItems: TStringList;
      AFiltros: TStringList;
      ALineNumber: Integer;
      ALineNumberUsed: Integer;
      AArquivo: string;
      AArquivoNumero: Integer;
      ARegNumber: Integer;
      AComp: TExpoScriptCompilador;
      function getLineNumber(): Integer;
      procedure setLineNumber(iNumero: Integer);
      function getLineNumberUsed(): Integer;
      procedure setLineNumberUsed(iNumero: Integer);
      function getRegNumber(): Integer;
      procedure setRegNumber(iNumero: Integer);
      function getArquivo(): string;
      procedure setArquivo(sArquivo: string);
      function getArqNumero(): Integer;
      procedure setArqNumero(iNumero: Integer);
      procedure IncLineNumber();
      procedure IncLineNumberUsed();
      procedure IncRegNumber();
      procedure setItem(iPos: Integer; oItem: TExpoLayoutItem);
      function getItem(iPos: Integer): TExpoLayoutItem;
      function getCompilador(): TExpoScriptCompilador;
   protected
   published
   public
      property Linha: Integer read getLineNumber;
      property Arquivo: string read getArquivo write setArquivo;
      property RegNumero: Integer read getRegNumber;
      property ArqNumero: Integer read getArqNumero;
      property Comp: TExpoScriptCompilador read getCompilador;
      property Items[iPos: Integer]: TExpoLayoutItem read getItem write setItem;
      procedure addItem(oItem: TExpoLayoutItem; iPos: Integer = -1);
      procedure remItem(iPos: Integer);
      function getItemCount(): Integer;
      function ExportaItem(iPos: Integer; slCampos: TStringList; var LogExportacao: TLoggerExportacao): string;
      procedure ResetLinha();
      procedure ResetRegistro();

      procedure SetListaFiltros(LFiltros : TStringList);

      constructor Create();
      destructor Destroy(); override;

   end;

implementation

uses
   uScriptFunctions, uDM;

{ TExpoLayoutEspec }

constructor TExpoLayoutEspec.Create;
begin
   AListaCampos := TStringList.Create();
   setStrCompilada('');
   setCompiled(False);
end;

procedure TExpoLayoutEspec.setStrCompilada(sStrCompilada: string);
begin
   AStrCompilada := sStrCompilada;
end;

procedure TExpoLayoutEspec.setTamanho(iTamanho: Integer);
begin
   ATamanho := iTamanho;
end;

function TExpoLayoutEspec.getCampos: TStringList;
begin
   Result := AListaCampos;
end;

function TExpoLayoutEspec.getPreenchimento: string;
begin
   Result := APreenchimento;
end;

procedure TExpoLayoutEspec.setCampos(slDados: TStringList);
begin
   AListaCampos := slDados;
end;

function TExpoLayoutEspec.getDesc: string;
begin
   Result := ADesc;
end;

function TExpoLayoutEspec.getOrdem: Integer;
begin
   Result := AOrdem;
end;

function TExpoLayoutEspec.getTipo: Integer;
begin
   Result := ATipo;
end;

procedure TExpoLayoutEspec.setPreenchimento(sPreenchimento: string);
begin
   APreenchimento := sPreenchimento;
end;

function TExpoLayoutEspec.getStrCompilada: string;
begin
   Result := AStrCompilada;
end;

function TExpoLayoutEspec.getTamanho: Integer;
begin
   Result := ATamanho;
end;

destructor TExpoLayoutEspec.Destroy;
begin
   FreeANdNil(AListaCampos);
   inherited;
end;

procedure TExpoLayoutEspec.setDesc(sValor: string);
begin
   ADesc := sValor;
end;

procedure TExpoLayoutEspec.setOrdem(iValor: Integer);
begin
   AOrdem := iValor;
end;

procedure TExpoLayoutEspec.setTipo(iTipo: Integer);
begin
   ATipo := iTipo;
end;

procedure TExpoLayoutEspec.parseValor(oComp: TExpoScriptCompilador);
var
   sChave: string;
   sFinal: string;
begin
   setStrCompilada('');
   if not (oComp = nil) then begin
      AListaCampos.Clear();
      sFinal := getDesc();
      oComp.ARegExp.ModifierS := True;
      oComp.ARegExp.Expression := '\{([A-z0-9._-]+)\}';

      if (oComp.ARegExp.Exec(sFinal)) then begin
         repeat
            sChave := oComp.ARegExp.Match[1];
            if (AListaCampos.IndexOf(sChave) = -1) then begin
               //adiciona o campo
               AListaCampos.Add(sChave);
               sFinal := StringReplace(sFinal, '{'+sChave+'}', 'sParam'+IntToStr(AListaCampos.Count-1)+'', [rfReplaceAll, rfIgnoreCase]);
            end;
         until not oComp.ARegExp.ExecNext();
      end;
      setStrCompilada(sFinal);
      setCompiled(True);
   end;
end;

function TExpoLayoutEspec.getValor(oComp: TExpoScriptCompilador;
  oCampos, oFiltros: TStringList): string;
var
   i,z: Integer;
   sAux, sCampo: string;
begin
   sAux := '';
   if ((getStrCompilada() <> '') and (getStrCompilada() <> '''')) then begin
      if (Pos('[', getStrCompilada()) > 0) AND (Pos(']', getStrCompilada()) > 0) then
      begin
         for I := 0 to oFiltros.Count - 1 do
         begin
            setStrCompilada( StringReplace(
               getStrCompilada(),
               oFiltros.Names[I],
               oFiltros.ValueFromIndex[I],
               [rfReplaceAll]
            ) );
         end;

         if Pos('"', getStrCompilada()) > 0 then
         begin
            setStrCompilada(StringReplace(getStrCompilada(), '"', '''', [rfReplaceAll]));
         end;
      end;

      if not (oComp = nil) then begin
         for i := 0 to Campos.Count-1 do begin
            sCampo := StringReplace(Campos.Strings[i], '.', '_', [rfIgnoreCase,rfReplaceAll]);
            z := oCampos.IndexOfName(sCampo);
            if (z = -1) then begin
               oComp.setVarByName('sParam'+IntToStr(i)+'', '');
            end
            else begin
               oComp.setVarByName('sParam'+IntToStr(i)+'', oCampos.ValueFromIndex[z]);
            end;
         end;
         sAux := oComp.compila(getStrCompilada());
         sAux := oComp.executa(sAux);
         if (sAux = '-1') then begin
            sAux := '';
         end;
      end;
   end;
   if Preenchimento = '' then begin
      Preenchimento := ' ';
   end;
   if Tamanho > 0 then
      begin
      //verifica direitao ou esquerda
      if Posicao = 1 then begin
         //preenchimento na esquerda
         sAux := RightStr(DupeString(Preenchimento, Tamanho-Length(sAux)) + sAux, Tamanho);
      end
      else if Posicao = 2 then begin
         //preenchimento na direita
         sAux := LeftStr(sAux + DupeString(Preenchimento, Tamanho-Length(sAux)), Tamanho);
      end
      else begin
         //sem preenchimento
         sAux := LeftStr(sAux, Tamanho);
      end;
   end;
   Result := sAux;
end;

function TExpoLayoutEspec.getPosicao: Integer;
begin
   Result := APosicao;
end;

procedure TExpoLayoutEspec.setPosicao(iVal: Integer);
begin
   APosicao := iVal;
end;

function TExpoLayoutEspec.getCompiled: Boolean;
begin
   Result := ACompiled;
end;

procedure TExpoLayoutEspec.setCompiled(bValor: Boolean);
begin
   ACompiled := bValor;
end;

{ TExpoScriptCompilador }

constructor TExpoScriptCompilador.Create;
begin
   AFnList := TStringList.Create();
   AVariaveis := TStringList.Create();
   ARegExp := TRegExpr.Create();
   APS := TPSScript.Create(nil);
   APS.OnCompile := OnBeforeCompile;
   APS.OnExecute := OnBeforeExecute;
   AOut := TStringList.Create();
end;

function TExpoScriptCompilador.executa(sCompilado: string): string;
var
   Executado: Boolean;
begin
   //define as variaveis
   Result := '';
   if (sCompilado = '-1') then begin
      Exit;
   end;
   try
      //APS.SetCompiled(sCompilado);
      //PSAddFunctions(APS);
      Executado := APS.Execute;
      if not Executado then begin
         AOut.Add('------------------------------------------------');
         AOut.Add('ERRO AO EXECUTAR!!');
         AOut.Add('Mensagem: '+APS.ExecErrorToString);
      end
      else begin
         //aguarda execucao
         while APS.Running do begin
            Sleep(50);
         end;
         //pega o valor
         Result := VGetString(APS.GetVariable('aOutput'));
      end;
   except
      Result := '';
   end;
end;

function TExpoScriptCompilador.compila(sDados: string): string;
var
   i: Integer;
   sAux: string;
   Compiled: Boolean;
begin
   Result := '-1';
   sAux := '';
   try
      APS.Script.Clear();
      if (((LeftStr(Trim(sDados), 5) = 'begin') or (LeftStr(Trim(sDados), 3) = 'var')) and (RightStr(Trim(sDados), 4) = 'end.')) then begin
         APS.Script.Add(sDados);
      end
      else begin
         if sDados = '' then sDados := '''''';
         APS.Script.Add('begin');
         APS.Script.Add('  aOutput := '+ sDados + ';');
         APS.Script.Add('end.');
      end;
      Compiled := APS.Compile;
      for i := 0 to APS.CompilerMessageCount-1 do begin
         AOut.Add('------------------------------------------------');
         AOut.Add('Dados: '+ sDados);
         AOut.Add('Mensa: '+APS.CompilerMessages[i].MessageToString);
      end;
      if Compiled then begin
         APS.GetCompiled(sAux);
         Result := sAux;
      end;
   except
      Result := '-1';
   end;
end;

destructor TExpoScriptCompilador.Destroy;
begin
  FreeAndNil(AFnList);
  FreeAndNil(AVariaveis);
  FreeAndNil(ARegExp);
  FreeAndNil(APS);
  FreeAndNil(AOut);
  inherited;
end;

function TExpoScriptCompilador.getVarByName(sNome: string): string;
begin
   Result := AVariaveis.Values[sNome];
end;

procedure TExpoScriptCompilador.setVarByName(sNome, sValor: String);
var
   i: Integer;
begin
   i := AVariaveis.IndexOfName(sNome);
   if (i <> -1) then begin
      AVariaveis.Delete(i);
   end;
   AVariaveis.Add(sNome + '='+ sValor);
end;

function TExpoScriptCompilador.getOutput: TStringList;
begin
   Result := AOut;
end;

procedure TExpoScriptCompilador.setOutput(slDados: TStringList);
begin
   AOut := slDados;
end;

procedure TExpoScriptCompilador.OnBeforeExecute(Sender: TPSScript);
var
   i: Integer;
begin
   for i := 0 to (AVariaveis.Count-1) do begin
      try
         VSetString(APS.GetVariable(AVariaveis.Names[i]), AVariaveis.ValueFromIndex[i]);
      except
      end;
   end;
end;

procedure TExpoScriptCompilador.OnBeforeCompile(Sender: TPSScript);
var
   i: Integer;
begin
   //define as variaveis
   PSAddFunctions(APS);
   for i := 0 to AVariaveis.Count-1 do begin
      APS.AddRegisteredVariable(AVariaveis.Names[i], 'string');
   end;
   APS.AddRegisteredVariable('aOutput', 'string');
{   for i := 0 to L_COMP_VARS do begin
      APS.AddRegisteredVariable('sParam'+IntToStr(i), 'string');
   end;
   APS.AddRegisteredVariable(L_LINE_NUMBER, 'string');
   APS.AddRegisteredVariable(L_REG_NUMBER, 'string');
   APS.AddRegisteredVariable(L_NM_ARQUIVO, 'string');
   APS.AddRegisteredVariable(L_ARQ_NUMBER, 'string'); }

end;

function TExpoScriptCompilador.CompilaExecuta(sCompilado: string): string;
begin
   Result := Self.executa(Self.compila(sCompilado));
end;

{ TExpoLayoutItem }

procedure TExpoLayoutItem.remEspec(iPos: Integer);
begin
   if ((iPos >= 0) and (iPos < AEspec.Count)) then begin
      AEspec.Delete(iPos);
   end;
end;

constructor TExpoLayoutItem.Create;
begin
   AEspec := TStringList.Create();
   ACampos := TStringList.Create();
   ASeparador := '';
   ALayoutItemPai := -1;
end;

procedure TExpoLayoutItem.setLayout(iCod: Integer);
begin
   ALayout := iCod;
end;

function TExpoLayoutItem.getConsulta: string;
begin
   Result := AConsulta;
end;

function TExpoLayoutItem.getEspec(iPos: Integer): TExpoLayoutEspec;
begin
   Result := nil;
   if ((iPos >= 0) and (iPos < AEspec.Count)) then begin
      Result := TExpoLayoutEspec(AEspec.Objects[iPos]);
   end;
end;

procedure TExpoLayoutItem.setConsulta(sConsulta: String);
begin
   AConsulta := sConsulta;
end;

function TExpoLayoutItem.getEspecCount: Integer;
begin
   Result := AEspec.Count;
end;

function TExpoLayoutItem.getLayout: Integer;
begin
   Result := ALayout;
end;

procedure TExpoLayoutItem.setEspec(iPos: Integer; oEspec: TExpoLayoutEspec);
begin
   if ((iPos >= 0) and (iPos < AEspec.Count)) then begin
      AEspec.Objects[iPos] := oEspec;
   end;
end;

procedure TExpoLayoutItem.addEspec(oEspec: TExpoLayoutEspec; iPos: Integer);
begin
   if (iPos >= 0) then begin
      Aespec.InsertObject(iPos, '', oEspec);
   end
   else begin
      AEspec.AddObject('', oEspec);
   end;
end;

destructor TExpoLayoutItem.Destroy;
var
   i: Integer;
   Obj: TObject;
begin
   for i := 0 to AEspec.Count-1 do begin
      Obj := Aespec.Objects[i];
      FreeAndNil(Obj);
   end;
   for i := 0 to ACampos.Count-1 do begin
      Obj := ACampos.Objects[i];
      FreeAndNil(Obj);
   end;
   FreeAndNil(AEspec);
   FreeAndNil(ACampos);
  inherited;
end;


procedure TExpoLayoutItem.getAllCampos(var slCampos: TStringList);
var
   i: Integer;
//   sAux: string;
begin
   if slCampos = nil then begin
      slCampos := TStringList.Create();
   end;
   slCampos.Clear();
   slCampos.Duplicates := dupIgnore;
   for i := 0 to EspecCount-1 do begin
      slCampos.AddStrings(Espec[i].getCampos());
   end;
   for i := 0 to slCampos.Count-1 do begin
      slCampos.Strings[i] := StringReplace(slCampos.Strings[i], '*', '.', []);
   end;
end;

function TExpoLayoutItem.getLayoutItem: Integer;
begin
   Result := ALayoutItem;
end;

procedure TExpoLayoutItem.setLayoutItem(iCod: Integer);
begin
   ALayoutItem := iCod;
end;

function TExpoLayoutItem.getLayoutItemPai: Integer;
begin
   Result := ALayoutItemPai;
end;

function TExpoLayoutItem.getOrdem: Integer;
begin
   Result := AOrdem;
end;

procedure TExpoLayoutItem.setLayoutItemPai(iCod: Integer);
begin
   ALayoutItemPai := iCod;
end;

procedure TExpoLayoutItem.SetOrdem(iValor: Integer);
begin
   AOrdem := iValor;
end;

function TExpoLayoutItem.getSeparador: string;
begin
   Result := Self.ASeparador;
end;

function TExpoLayoutItem.getSQLAntes: string;
begin
  Result := Self.ASQLAntes;
end;

function TExpoLayoutItem.getSQLDepois: string;
begin
  Result := Self.ASQLDepois;
end;

procedure TExpoLayoutItem.setSeparador(sValor: string);
begin
   Self.ASeparador := sValor;
end;

procedure TExpoLayoutItem.setSQLAntes(sSQL: string);
begin
  Self.ASQLAntes := sSQL;
end;

procedure TExpoLayoutItem.setSQLDepois(sSQL: string);
begin
  Self.ASQLDepois;
end;

function TExpoLayoutItem.getCampo(iPos: Integer): TExpoCampo;
begin
   Result := nil;
   if ((iPos >= 0) and (iPos < ACampos.Count)) then begin
      Result := TExpoCampo(ACampos.Objects[iPos]);
   end;
end;

function TExpoLayoutItem.getCampo(sNome: string): TExpoCampo;
var
   i: Integer;
begin
   Result := nil;
   i := ACampos.IndexOf(sNome);
   if (i >= 0) then begin
      Result := TExpoCampo(ACampos.Objects[i]);
   end;
end;

function TExpoLayoutItem.getCampoCount: Integer;
begin
   Result := ACampos.Count;
end;

procedure TExpoLayoutItem.setCampo(sNome: string; oCampo: TExpoCampo);
var
   i: Integer;
begin
   i := ACampos.IndexOf(sNome);
   if (i >= 0) then begin
      ACampos.Strings[i] := sNome;
      ACampos.Objects[i] := oCampo;
   end
   else begin
      ACampos.AddObject(sNome, oCampo);
   end;
end;

{ TExpoLayout }

function TExpoLayout.getArqNumero: Integer;
begin
   Result := AArquivoNumero;
end;

function TExpoLayout.getLineNumber: Integer;
begin
   Result := ALineNumber;
end;

function TExpoLayout.getLineNumberUsed: Integer;
begin
   Result := ALineNumberUsed;
end;

procedure TExpoLayout.setRegNumber(iNumero: Integer);
begin
   ARegNumber := iNumero;
   AComp.VarByName[L_REG_NUMBER] := IntToStr(iNumero);
end;

function TExpoLayout.getItem(iPos: Integer): TExpoLayoutItem;
begin
   Result := nil;
   if ((iPos >= 0) and (iPos < AItems.Count)) then begin
      Result := TExpoLayoutItem(AItems.Objects[iPos]);
   end;
end;

procedure TExpoLayout.setArqNumero(iNumero: Integer);
begin
   AArquivoNumero := iNumero;
   AComp.VarByName[L_ARQ_NUMBER] := IntToStr(iNumero);
end;

procedure TExpoLayout.setLineNumber(iNumero: Integer);
begin
   ALineNumber := iNumero;
   AComp.VarByName[L_LINE_NUMBER] := IntToStr(iNumero);
end;

procedure TExpoLayout.setLineNumberUsed(iNumero: Integer);
begin
   ALineNumberUsed := iNumero;
   AComp.VarByName[L_LINE_NUMBER_USED] := IntToStr(iNumero);
end;

procedure TExpoLayout.SetListaFiltros(LFiltros: TStringList);
begin
   Self.AFiltros.Assign(LFiltros);
end;

procedure TExpoLayout.IncRegNumber;
begin
   setRegNumber(getRegNumber()+1);
end;

function TExpoLayout.getArquivo: string;
begin
   Result := AArquivo;
end;

function TExpoLayout.getItemCount: Integer;
begin
   Result := AItems.Count;
end;

procedure TExpoLayout.setItem(iPos: Integer; oItem: TExpoLayoutItem);
begin
   if ((iPos >= 0) and (iPos < AItems.Count)) then begin
      AItems.Objects[iPos] := oItem;
   end;
end;

procedure TExpoLayout.addItem(oItem: TExpoLayoutItem; iPos: Integer);
begin
   if ((iPos >= 0)) then begin
      AItems.InsertObject(iPos, '', oItem);
   end
   else begin
      AItems.AddObject('', oItem);
   end;
end;

procedure TExpoLayout.IncLineNumber;
begin
   setLineNumber(getLineNumber()+1);
end;


procedure TExpoLayout.IncLineNumberUsed;
begin
   setLineNumberUsed(getLineNumberUsed()+1);
end;

function TExpoLayout.getRegNumber: Integer;
begin
   Result := ARegNumber;
end;

procedure TExpoLayout.setArquivo(sArquivo: string);
begin
   AArquivo := sArquivo;
end;

procedure TExpoLayout.remItem(iPos: Integer);
begin
   if ((iPos >= 0) and (iPos < AItems.Count)) then begin
      AItems.Delete(iPos);
   end;
end;

function TExpoLayout.ExportaItem(iPos: Integer; slCampos: TStringList;
            var LogExportacao: TLoggerExportacao): string;
var
   i: Integer;
   sAux: string;
begin
   {OLIVER - Gerando valores}
   IncRegNumber();
   IncLineNumber();
   sAux := '';
   for i := 0 to Items[iPos].EspecCount-1 do begin
      if not (Items[iPos].Espec[i].Compiled) then begin
         Items[iPos].Espec[i].parseValor(AComp);
      end;
      if Items[iPos].Espec[i].ADesc = L_LINE_NUMBER_USED then
      begin
         IncLineNumberUsed();
      end;
      
      sAux := sAux + Items[iPos].Espec[i].getValor(AComp, slCampos, AFiltros) + Items[iPos].Separador;

      // Neste momento percorremos todos os itens do processo e salvamos o log na base
         LogExportacao.LogaValor( Items[iPos].Ordem, Items[iPos].Espec[i].Ordem,
               getLineNumber(), Items[iPos].Espec[i].getValor(AComp, slCampos, AFiltros) + Items[iPos].Separador );
   end;
   Result := sAux;
end;

procedure TExpoLayout.ResetRegistro;
begin
   setRegNumber(0);
end;

procedure TExpoLayout.ResetLinha;
begin
   setLineNumber(0);
   setLineNumberUsed(0);
end;

function TExpoLayout.getCompilador: TExpoScriptCompilador;
begin
   Result := AComp;
end;

constructor TExpoLayout.Create;
begin
   inherited;
   AItems := TStringList.Create();
   AFiltros := TStringList.Create();
   AComp := TExpoScriptCompilador.Create();
end;

destructor TExpoLayout.Destroy;
var
   i: Integer;
   Obj: TObject;
begin
   for i := 0 to AItems.Count-1 do begin
      Obj := AItems.Objects[i];
      FreeAndNil(Obj);
   end;
   FreeAndNil(AItems);
   FreeAndNil(AFiltros);
   FreeAndNil(AComp);
   inherited;
end;

{ TExpoCampo }

function TExpoCampo.getApelido: string;
begin
   Result := getTabela()+ '_' + getNome();
end;

function TExpoCampo.getTabela: string;
begin
   Result := ATabela;
end;

constructor TExpoCampo.Create;
begin
   inherited;
end;

function TExpoCampo.getConsulta: string;
begin
   if (AConsulta = '') then begin
      Result := ATabela + '.' + ANome;
   end
   else begin
      Result := AConsulta;
   end;
end;

function TExpoCampo.getCampo: string;
begin
   Result := getTabela() + '.' + getNome();;
end;

function TExpoCampo.getSQL: string;
begin
   Result := ASQL;
end;

procedure TExpoCampo.setTabela(sTabela: string);
begin
   ATabela := sTabela;
end;

function TExpoCampo.getNome: string;
begin
   Result := ANome;
end;

procedure TExpoCampo.setConsulta(sConsulta: string);
begin
   AConsulta := sConsulta;
end;

function TExpoCampo.usaSQL: Boolean;
begin
   Result := AUsaSQL;
end;

procedure TExpoCampo.setSQL(sSQL: string);
begin
   ASQL := sSQL;
end;

procedure TExpoCampo.setUsaSQL(bUsaSQL: Boolean);
begin
   AUsaSQL := bUsaSQL;
end;

destructor TExpoCampo.Destroy;
begin

  inherited;
end;

procedure TExpoCampo.setNome(sCampo: string);
begin
   ANome := sCampo;
end;

function TExpoCampo.isCarregado: Boolean;
begin
   Result := ACarregado;
end;

procedure TExpoCampo.setCarregado(bValor: Boolean);
begin
   ACarregado := bValor;
end;

{ TLoggerExportacao }

constructor TLoggerExportacao.Create;
begin
   inherited Create();

   FIsProcesso := False;
   FProcesso := 0;
end;

function TLoggerExportacao.GetNroExportacaoAtual: Integer;
begin
   Result := FNroExportacao;
end;

function TLoggerExportacao.GetProcesso: Integer;
begin
   Result := FProcesso;
end;

function TLoggerExportacao.GetProximaExportacao(): Integer;
const
   SQL_GET_PROXIMO_PROCESSO = 'SELECT COALESCE(MAX(nr_exportacao), 0)+1 AS registros ' +
                              'FROM expo_processo_logs ' +
                              'WHERE cd_processo = :cd_processo ';
var
   qyGetProximoProcesso: TUMZQuery;
begin
   DM.CriarConsulta(qyGetProximoProcesso);

   with qyGetProximoProcesso do
   begin
      SQL.Text := SQL_GET_PROXIMO_PROCESSO;

      ParamByName('cd_processo').AsInteger := GetProcesso();

      Open();
   end;

   FNroExportacao := qyGetProximoProcesso.FieldByName('registros').AsInteger;

   Result := FNroExportacao;   
end;

function TLoggerExportacao.GetUsuario: Integer;
begin
   Result := FCodigoUsuario;
end;

procedure TLoggerExportacao.LogaEspecificacao(const cd_item,
  cd_especificacao: Integer; ds_especificacao: String);
const
   SQL_INSERE_ESPECIFICACAO = 'INSERT INTO expo_processo_especificacoes (cd_processo, nr_exportacao, cd_item, cd_especificacao, ds_especificacao) ' +
                              'VALUES (:cd_processo, :nr_exportacao, :cd_item, :cd_especificacao, :ds_especificacao)';
var
   qyInsereEspecificacao: TUMZQuery;
begin
   // Se não é processo de exportação, não executa insert
   if not FIsProcesso then
   begin
      exit;
   end;

   DM.CriarConsulta(qyInsereEspecificacao);

   with qyInsereEspecificacao do
   begin
      SQL.Text := SQL_INSERE_ESPECIFICACAO;

      ParamByName('cd_processo').AsInteger := GetProcesso();
      ParamByName('nr_exportacao').AsInteger := GetNroExportacaoAtual();
      ParamByName('cd_item').AsInteger := cd_item;
      ParamByName('cd_especificacao').AsInteger := cd_especificacao;
      ParamByName('ds_especificacao').AsString := ds_especificacao;

      ExecSQL();
   end;
end;

procedure TLoggerExportacao.LogaExportacao;
const
   SQL_INSERE_LOG = 'INSERT INTO expo_processo_logs (cd_processo, nr_exportacao, dt_exportacao, cd_usuario, sn_oficial) ' +
                    'VALUES (:cd_processo, :nr_exportacao, NOW(), :cd_usuario, 0)';
var
   qyInsereLog: TUMZQuery;
begin
   // Se não é processo de exportação, não executa insert
   if not FIsProcesso then
   begin
      exit;
   end;   

   DM.CriarConsulta(qyInsereLog);

   with qyInsereLog do
   begin
      SQL.Text := SQL_INSERE_LOG;

      ParamByName('cd_processo').AsInteger := GetProcesso();
      ParamByName('nr_exportacao').AsInteger := GetProximaExportacao();
      ParamByName('cd_usuario').AsInteger := GetUsuario();

      ExecSQL();
   end;
end;

procedure TLoggerExportacao.LogaItem(const cd_item: Integer; const ds_item: String);
const
   SQL_INSERE_ITEM = 'INSERT INTO expo_processo_item( cd_processo, nr_exportacao, cd_item, ds_item ) ' +
                     'VALUES( :cd_processo, :nr_exportacao, :cd_item, :ds_item )';
var
   qyInsereItem: TUMZQuery;
begin
   // Se não é processo de exportação, não executa insert
   if not FIsProcesso then
   begin
      exit;
   end;       

   DM.CriarConsulta(qyInsereItem);

   with qyInsereItem do
   begin
      SQL.Text := SQL_INSERE_ITEM;

      ParamByName('cd_processo').AsInteger := GetProcesso();
      ParamByName('nr_exportacao').AsInteger := GetNroExportacaoAtual();
      ParamByName('cd_item').AsInteger := cd_item;
      ParamByName('ds_item').AsString := ds_item;

      ExecSQL();
   end;
end;

procedure TLoggerExportacao.LogaValor(const cd_item, cd_especificacao,
  nr_linha: Integer; const me_valor: String);
const
   SQL_INSERE_VALOR = 'INSERT INTO expo_processo_valores(cd_processo, nr_exportacao, cd_item, cd_especificacao, nr_linha, me_valor) ' +
                      'VALUES(:cd_processo, :nr_exportacao, :cd_item, :cd_especificacao, :nr_linha, :me_valor)';
var
   qyInsereValor: TUMZQuery;
begin
   // Se não é processo de exportação, não executa insert
   if not FIsProcesso then
   begin
      exit;
   end;

   DM.CriarConsulta(qyInsereValor);

   with qyInsereValor do
   begin
      SQL.Text := SQL_INSERE_VALOR;

      ParamByName('cd_processo').AsInteger := GetProcesso();
      ParamByName('nr_exportacao').AsInteger := GetNroExportacaoAtual();
      ParamByName('cd_item').AsInteger := cd_item;
      ParamByName('cd_especificacao').AsInteger := cd_especificacao;
      ParamByName('nr_linha').AsInteger := nr_linha;
      ParamByName('me_valor').AsString := me_valor;

      ExecSQL();
   end;
end;

procedure TLoggerExportacao.SalvaArquivo(const arquivo: String);
const
   SQL_SALVA_ARQUIVO = 'UPDATE expo_processo_logs SET me_arquivo = :me_arquivo ' +
                       'WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao';
var
   LConteudoArquivo: TStringList;
   qySalvaArquivo: TUMZQuery;
begin
   // Se não é processo de exportação, não executa insert
   if not FIsProcesso then
   begin
      exit;
   end;

   DM.CriarConsulta(qySalvaArquivo);

   LConteudoArquivo := TStringList.Create();
   LConteudoArquivo.LoadFromFile(arquivo);      

   with qySalvaArquivo do
   begin
      SQL.Text := SQL_SALVA_ARQUIVO;

      ParamByName('cd_processo').AsInteger := GetProcesso();
      ParamByName('nr_exportacao').AsInteger := GetNroExportacaoAtual();

      ParamByName('me_arquivo').AsString := LConteudoArquivo.Text;

      ExecSQL();
   end;

   DeleteFile(PAnsiChar(arquivo));
end;

procedure TLoggerExportacao.SetIsProcesso(Valor: Boolean);
begin
   FIsProcesso := Valor;
end;

procedure TLoggerExportacao.SetProcesso(Valor: Integer);
begin
   FProcesso := Valor;
end;

procedure TLoggerExportacao.SetUsuario(Valor: String);
var
   qyVerificaUsuarioLogado: TUMZQuery;
begin
   DM.CriarConsulta(qyVerificaUsuarioLogado);

   with qyVerificaUsuarioLogado do
   begin
      SQL.Add( ' SELECT cd_pessoa as codigo FROM pessoas WHERE lower(ds_login) = lower(:usuario) ' );
      ParamByName('usuario').AsString := Valor;

      Open();
   end;

   FCodigoUsuario := qyVerificaUsuarioLogado.FieldByName('codigo').AsInteger;
end;

end.
