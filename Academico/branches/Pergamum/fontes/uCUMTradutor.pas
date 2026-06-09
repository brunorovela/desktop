{*******************************************************************************

  Classe de Tradução

  Aqui está o modelo para codificacao e comentários de código. as regras de
  nomenclatura devem ser seguidas, assim como as regras de escrita e
  organização.

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  @author Uninformare Informática
  @version 20/07/2006

*******************************************************************************}
unit uCUMTradutor;

interface

uses
   Classes, Forms, Controls, Windows, uAGerais, SysUtils,
   uCUMStringList, Buttons,
   IniFiles, StdCtrls;

type
   {**
      Classe TTradutor
      Tradução em tempo real de componentes
    }
    TUMTradutor = class(TUMObjeto)
    private
      ATelas: TUMStringList;
      AModulos: TStringList;
      FIdioma: String;
      procedure SetIdioma(const Value: String);
      function getArquivoDicionario(sModulo: string): string;
      procedure loadTela(sTela: string; sModulo: string; slValores: TStringList);

      procedure updateIdioma();
    protected
    public
      constructor Create();
      destructor Destroy(); override;
      procedure doTraduzir(Comp: TComponent);
      procedure loadDicionario(sModulo: string; bForcar: Boolean = False);
      procedure clearDicionario(sModulo: string);
      function isDicCarregado(sModulo: string): boolean;

      property Idioma: String read FIdioma write SetIdioma;
    published
    end;
   
   {**
      Classe TUMTradItem
      Tradução em tempo real de componentes
    }
    TUMTradComponente = class(TUMObjeto)
    private
      ANome: string;
      ATraducoes: TStringList;
    protected
      constructor Create(sNome: string);
      procedure setNome(sNome: string);
      procedure clearTraducoes();
    public
      procedure addTraducao(sPropriedade: string; sValor: string);
      procedure doTraduzir(Ctrl: TComponent);
      function hasTraducao(): Boolean;
    published
    end;

    {**
      Classe TUMTradTela
      Tradução em tempo real de componentes
    }
   TUMTradTela = class(TUMObjeto)
   private
      AModulo: string;
      ATela: string;
      AComponentes: TUMStringList;
   protected
      procedure addComponente(sNome: string; slItens: TStringList);
      procedure clearComponentes();
      function getComponente(sNome: string): TUMtradComponente;
   public
      constructor Create(sTela: string; sModulo: string);
      destructor Destroy(); override;
      function getTela(): string;
      function getModulo(): string;
      procedure doTraducao(Comp: TComponent);
   published
   end;
   
implementation

uses
   uCFuncClasses, StrUtils, ExtCtrls, Menus, uCFuncString, CheckLst, ComCtrls, Mask,  DB, DBGrids,
  DBCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

{ TUMTradutor }
constructor TUMTradutor.Create();
begin
   inherited;
   ATelas := TUMStringList.Create();
   AModulos := TStringList.Create();
end;

destructor TUMTradutor.Destroy();
begin
   FreeObj(ATelas);
   FreeObj(AModulos);
   inherited;
end;

procedure TUMTradutor.doTraduzir(Comp: TComponent);
var
   oTela: TUMTradTela;
begin
   //se nao existe tenta criar
   oTela := TUMTradTela(ATelas.locateObjeto(Comp.Name));
   if (Assigned(oTela)) then begin
      //manda pro dicionario se virar
      oTela.doTraducao(Comp);
   end;
end;

function TUMTradutor.getArquivoDicionario(sModulo: string): string;
var
  sPastaIdioma: string;
  sIdioma: string;
  sArquivo: string;
begin
  //procura o arquivo
  sPastaIdioma := ExtractFilePath(Application.ExeName) + '\idiomas';
//  sIdioma := iniWMestre.ReadString( 'Configuracoes', 'Idioma', 'pt-br');

  if Trim(FIdioma) = '' then begin
     FIdioma := sIdioma;
  end;
  
  sArquivo := sPastaIdioma + '\' + FIdioma + '\' + sModulo + '.ini';
  Result := sArquivo;
end;

function TUMTradutor.isDicCarregado(sModulo: string): Boolean;
begin
   Result := AModulos.Values[sModulo] = '1';
end;

procedure TUMTradutor.loadDicionario(sModulo: string; bForcar: Boolean);
var
   sArq: string;
   ini: TIniFile;
   slSecoes, slItens: TStringList;
   i: Integer;
begin
   if not (bForcar) then begin
      if (isDicCarregado(sModulo)) then begin
         Exit;
      end;
   end
   else begin
      clearDicionario(sModulo);
   end;
   sArq := getArquivoDicionario(sModulo);
   ini := TIniFile.Create(sArq);
   slSecoes := TStringList.Create();
   slItens := TStringList.Create();
   ini.ReadSections(slSecoes);
   for i := 0 to slSecoes.Count - 1 do begin
      slItens.Clear();
      ini.ReadSectionValues(slSecoes[i], slItens);
      slItens.Sort();
      loadTela(slSecoes[i], sModulo, slItens);
   end;
   AModulos.Values[sModulo] := '1';
end;

procedure TUMTradutor.loadTela(sTela: string; sModulo: string; slValores: TStringList);
var
   oTela: TUMTradTela;
   i, iPos: Integer;
   slAux, slComps: TStringList;
   sItem, sDesc, sValor, sObjeto1, sObjeto: string;
begin

   if not (ATelas.findObjeto(sTela)) then begin
      oTela := TUMTradTela.Create(sTela, sModulo);
      ATelas.AddObjeto(oTela, sTela);
   end
   else begin
      oTela := TUMTradTela(Atelas.locateObjeto(sTela));
   end;
   oTela.clearComponentes();

   sObjeto := '';
   slComps := TStringList.Create();
   for i := 0 to slValores.Count - 1 do begin
   sItem := slValores.Names[i];
   iPos := Pos('.', sItem);
   sObjeto1 := LowerCase(LeftStr(sItem, iPos-1));
   if (sObjeto1 <> '') then begin
      if ((sObjeto1) <> LowerCase(sObjeto)) then begin
         sObjeto := sObjeto1;
         slAux := TStringList.Create();
         slComps.AddObject(sObjeto, slAux);
      end;
      sDesc := Trim(Copy(sItem, iPos + 1));
      sValor := slValores.ValueFromIndex[i];
      if (sDesc <> '') then begin
         slAux.Add(sDesc + '=' + sValor);
      end;
   end; //se existe o sObjeto1
   end; //for z

   //carrega os componentes
   for i := 0 to slComps.Count - 1 do begin
      slAux := TStringList(slComps.Objects[i]);
      oTela.addComponente(slComps.Strings[i], slAux);
   end;

   //limpa os objetos
   FreeObj(slComps);
   if (Assigned(slAux)) then FreeObj(slAux);
end;

procedure TUMTradutor.SetIdioma(const Value: String);
begin
   if FIdioma = Value then begin
      Exit;
   end;
   FIdioma := Value;
   updateIdioma();
end;

procedure TUMTradutor.updateIdioma();
var
   i: Integer;
begin
   for i := 0 to AModulos.Count-1 do begin
      clearDicionario(AModulos.Names[i]);
      loadDicionario(AModulos.Names[i]);
   end;
   
   for i := 0 to Screen.FormCount-1 do begin
      doTraduzir(Screen.Forms[i]);
   end;

end;

procedure TUMTradutor.clearDicionario(sModulo: string);
var
   i: Integer;
   oTela: TUMTradTela;
   ATelasDel: TStringList;
begin
   ATelasDel := TStringList.Create();
   for i := 0 to ATelas.Count - 1 do begin
      oTela := TUMTradTela(ATelas.Objeto[i]);
      if (oTela.getModulo() = sModulo) then begin
         ATelasDel.Add(ATelas.Nome[i]);
      end;
   end;

   for i := 0 to ATelasDel.Count - 1 do begin
      ATelas.DeleteDeDescricao(ATelasDel[i]);
   end;
   AModulos.Values[sModulo] := '0';

end;

{ TUMTradTela }
procedure TUMTradTela.addComponente(sNome: string; slItens: TStringList);
var
   oComp: TUMTradComponente;
  i: Integer;
begin
   if not (AComponentes.findObjeto(sNome)) then begin
      oComp := TUMTradComponente.Create(sNome);
      AComponentes.AddObjeto(oComp, sNome);
   end
   else begin
      oComp := TUMTradComponente(AComponentes.locateObjeto(sNome));
   end;
   oComp.clearTraducoes();
   for i := 0 to slItens.Count - 1 do begin
      oComp.addTraducao(slItens.Names[i], slItens.ValueFromIndex[i]);
   end;
end;

procedure TUMTradTela.clearComponentes;
begin
   AComponentes.Clear();
end;

constructor TUMTradTela.Create(sTela: string; sModulo: string);
begin
   inherited Create();
   AComponentes := TUMStringList.Create();
   ATela := sTela;
   AModulo := sModulo;
end;

destructor TUMTradTela.Destroy;
begin
   FreeObj(AComponentes);
   inherited;
end;

function TUMTradTela.getComponente(sNome: string): TUMtradComponente;
begin
   Result := nil;
   if (AComponentes.findObjeto(sNome)) then begin
      Result := TUMTradComponente(AComponentes.locateObjeto(sNome));
   end;
end;

function TUMTradTela.getModulo: string;
begin
   Result := AModulo;
end;

function TUMTradTela.getTela: string;
begin
   Result := ATela;
end;

procedure TUMTradTela.doTraducao(Comp: TComponent);
var
  i: Integer;
  oItem: TUMTradComponente;
  sNome: string;
begin
   oItem := nil;
  for i := 0 to Comp.ComponentCount - 1 do begin
    if (Comp.Components[i].ComponentCount > 0) then begin
      doTraducao(Comp.Components[i]);
    end;
    sNome := LowerCase(Comp.Components[i].Name);
    if (Comp.Components[i] is TControl) then begin
       oItem := getComponente(sNome);
       if not (oItem = nil) then begin
          oItem.doTraduzir(TControl(Comp.Components[i]));
       end;
    end;
  end;
end;

{ TUMTradComponente }
procedure TUMTradComponente.clearTraducoes();
begin
   ATraducoes.Clear();
end;

constructor TUMTradComponente.Create(sNome: string);
begin
   inherited Create();
   ATraducoes := TStringList.Create();
   ATraducoes.Duplicates := dupIgnore;
   ATraducoes.Sorted := False;
   ANome := sNome;
end;

procedure TUMTradComponente.setNome(sNome: string);
begin
   ANome := sNome;
end;

procedure TUMTradComponente.addTraducao(sPropriedade, sValor: string);
begin
   sPropriedade := LowerCase(sPropriedade);
   if (ATraducoes.IndexOfName(sPropriedade) = -1) then begin
      ATraducoes.Add(sPropriedade + '=');
   end;
   ATraducoes.Values[sPropriedade] := sValor;
end;

procedure TUMTradComponente.doTraduzir(Ctrl: TComponent);
var
  i: Integer;
  sProp, sValor: string;
begin
   if (hasTraducao()) then begin
      //Caption, Hint, Text, Tag
      for i := 0 to ATraducoes.Count - 1 do begin
         sProp := LowerCase(Trim(ATraducoes.Names[i]));
         sValor := Trim(ATraducoes.ValueFromIndex[i]);
         if (sProp <> '') then begin
            if (sProp = 'caption') then begin
               //CAPTION
               if Ctrl is TPanel then
                  TPanel(Ctrl).Caption := sValor
               else if Ctrl is TMenuItem then
                  TMenuItem(Ctrl).Caption := sValor
               else if Ctrl is TLabel then
                  TLabel(Ctrl).Caption := sValor
               else if CTrl is TButton then
                  TButton(Ctrl).Caption := sValor
               else if Ctrl is TCheckBox then
                  TCheckBox(Ctrl).Caption := sValor
               else if Ctrl is TRadioButton then
                  TRadioButton(Ctrl).Caption := sValor
               else if Ctrl is TGroupBox then
                  TGroupBox(Ctrl).Caption := sValor
               else if Ctrl is TRadioGroup then
                  TRadioGroup(Ctrl).Caption := sValor
               else if Ctrl is TStaticText then
                  TStaticText(Ctrl).Caption := sValor
               else if Ctrl is TLabeledEdit then
                  TLabeledEdit(Ctrl).EditLabel.Caption := sValor
               else if Ctrl is TFlowPanel then
                  TFlowPanel(Ctrl).Caption := sValor
               else if Ctrl is TTabSheet then
                  TTabSheet(Ctrl).Caption := sValor
               else if Ctrl is TSpeedButton then
                  TTabSheet(Ctrl).Caption := sValor
               else if Ctrl is TDBCheckBox then
                  TDBCheckBox(Ctrl).Caption := sValor
               else if Ctrl is TDBRadioGroup then
                  TDBRadioGroup(Ctrl).Caption := sValor;
            end
            else if (sProp = 'items') then begin
               //ITEMS
               if Ctrl is TListBox then
                  TListBox(Ctrl).Items := TStrings(TFuncString.splitString(sValor, ';'))
               else if Ctrl is TComboBox then
                  TComboBox(Ctrl).Items := TStrings(TFuncString.splitString(sValor, ';'))
               else if Ctrl is TComboBoxEx then
                  TComboBoxEx(Ctrl).Items := TStrings(TFuncString.splitString(sValor, ';'))
               else if Ctrl is TCheckListBox then
                  TCheckListBox(Ctrl).Items := TStrings(TFuncString.splitString(sValor, ';'));
            end
            else if (sProp = 'tabs') then begin
               //TABS
               if Ctrl is TTabControl then
                  TTabControl(Ctrl).Tabs := TStrings(TFuncString.splitString(sValor, ';'));
            end
            else if (sProp = 'editmask') then begin
               //TABS
               if Ctrl is TMaskEdit then
                  TMaskEdit(Ctrl).EditMask := sValor;
            end
            else if (sProp = 'hint') then begin
               //HINT
               if (Ctrl is TControl) then
                  TControl(Ctrl).Hint := sValor;
            end
            else if (sProp = 'text') then begin
               //TEXT
               if Ctrl is TEdit then
                  TEdit(Ctrl).Text := sValor
               else if Ctrl is TMemo then
                  TMemo(Ctrl).Text := sValor
               else if Ctrl is TMaskEdit then
                  TMaskEdit(Ctrl).Text := sValor
               else if CTrl is TLabeledEdit then
                  TLabeledEdit(Ctrl).Text := sValor
               else if Ctrl is TComboBox then
                  TComboBox(Ctrl).Text := sValor
               else if Ctrl is TComboBoxEx then
                  TComboBoxEx(Ctrl).Text := sValor
               else if Ctrl is TDBEdit then
                  TDBEdit(Ctrl).Text := sValor
               else if Ctrl is TDBMemo then
                  TDBMemo(Ctrl).Text := sValor
               else if Ctrl is TDBRichEdit then
                  TDBRichEdit(Ctrl).Text := sValor;
            end;
         end;
      end;
   end;
end;

function TUMTradComponente.hasTraducao(): Boolean;
begin
   Result := ATraducoes.Count > 0;
end;


end.
