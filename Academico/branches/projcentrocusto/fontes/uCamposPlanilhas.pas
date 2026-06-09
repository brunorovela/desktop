unit uCamposPlanilhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmSelColunas = class(TForm)
    Panel3: TPanel;
    Bevel4: TBevel;
    lbDisponiveis: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    lbUtilizadas: TListBox;
    btInsereUm: TSpeedButton;
    btRemoveUm: TSpeedButton;
    btInsereTodos: TSpeedButton;
    btRemoveTodos: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbGravarPadrao: TCheckBox;
    sbParaCima: TSpeedButton;
    sbParaBaixo: TSpeedButton;
    procedure sbParaBaixoClick(Sender: TObject);
    procedure sbParaCimaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btRemoveTodosClick(Sender: TObject);
    procedure btInsereTodosClick(Sender: TObject);
    procedure btRemoveUmClick(Sender: TObject);
    procedure btInsereUmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure registraCamposUtilizados(grd: TDBGrid; cdPessoa: Integer; dsChave: String);
    procedure registraCampo(cdPessoa, nrTamanho, nrOrdem: Integer; dsChave, dsColuna: String);
    procedure deleteRegistros(cdPessoa: Integer; dsChave: String);

    function getCamposUtilizados(cdPessoa: Integer; dsChave: String): TStringList;
    function isCampoGrid(grd: TDBGrid; fieldName: String): Boolean;
  public
    { Public declarations }

    function SelecionaColunas( grd : TDbGrid; ParametroColunasAtuais : String ) : String;
  end;

var
  frmSelColunas: TfrmSelColunas;

implementation

uses uDM, DB;

{$R *.dfm}

{ TfrmSelColunas }

function TfrmSelColunas.SelecionaColunas(grd: TDbGrid; ParametroColunasAtuais: String): String;
var
  n,
  i: Integer;

  lstUtilizados,
  lstCampos,
  lstCamposTamanhos: TStringList;

  isNuPlanilhas: Boolean;

  sCampos,
  sOp: String;
begin
   lstUtilizados := TStringList.Create;
   lstCampos := TStringList.Create;
   lstCamposTamanhos := TStringList.Create;

   lstUtilizados := getCamposUtilizados(DM.GetUsuarioLogado.Pessoa.Codigo, ParametroColunasAtuais);

   isNuPlanilhas := True;

   if lstUtilizados = nil then
   begin
      SplitString(DM.variavel_parametro(ParametroColunasAtuais), ';', lstUtilizados);
      isNuPlanilhas := False;
   end;

   lbDisponiveis.Items.Clear;
   lbUtilizadas.Items.Clear;

   for n := 0 to lstUtilizados.Count - 1 do begin
      try
         lbUtilizadas.Items.Add(grd.DataSource.DataSet.FieldByName(lstUtilizados.Strings[n]).DisplayLabel);
      except
      end;
   end;

   for n := 0 TO grd.DataSource.DataSet.FieldCount - 1 do
   begin
      if grd.DataSource.DataSet.Fields[n].Tag = 1 then
      begin
         lstCampos.Add(grd.DataSource.DataSet.Fields[n].DisplayLabel + '=' + grd.DataSource.DataSet.Fields[n].FieldName);

         for i := 0 to grd.Columns.Count - 1 do
         begin
            if grd.Columns.Items[i].FieldName = grd.DataSource.DataSet.Fields[n].FieldName then
            begin
               lstCamposTamanhos.Add(grd.DataSource.DataSet.Fields[n].DisplayLabel + '=' + IntToStr(grd.Columns[i].Width))
            end;
         end;

         if lstUtilizados.IndexOf(grd.DataSource.DataSet.Fields[n].FieldName) < 0 then
         begin
           lbDisponiveis.Items.Add(grd.DataSource.DataSet.Fields[n].DisplayLabel);
         end;
      end;
   end;

   if ShowModal() = mrAll then
   begin
      grd.Columns.Clear;

      for n := 0 to lbUtilizadas.Count - 1 do
      begin
         grd.Columns.Add;
         grd.Columns[n].FieldName   := lstCampos.Values[lbUtilizadas.Items.Strings[n]];

         if isCampoGrid(grd, grd.Columns[n].FieldName) then
         begin
            grd.Columns[n].Width := StrToIntDef(lstCamposTamanhos.Values[lbUtilizadas.Items.Strings[n]], 100);
         end;
      end;

      if cbGravarPadrao.Checked then
      begin
         Self.registraCamposUtilizados(grd, DM.GetUsuarioLogado.Pessoa.Codigo, ParametroColunasAtuais);
      end;

      if isNuPlanilhas then
      begin
         DM.montarPlanilha(grd, ParametroColunasAtuais);
      end
   end;
end;

procedure TfrmSelColunas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

function TfrmSelColunas.getCamposUtilizados(cdPessoa: Integer;
  dsChave: String): TStringList;
const
   SQL_GET_CAMPOS_UTILIZADOS =
      '  SELECT '+
      '     ds_coluna '+
      '  FROM '+
      '     nu_planilhas np '+
      '  WHERE '+
      '     np.cd_pessoa = :cd_pessoa '+
      '     AND np.ds_chave = :ds_chave '+
      '  ORDER BY '+
      '     nr_ordem ASC ';
var
   qryCamposUtilizados: TUMZReadOnlyQuery;
begin

   DM.CriarConsulta(qryCamposUtilizados);
   qryCamposUtilizados.SQL.Text := SQL_GET_CAMPOS_UTILIZADOS;
   qryCamposUtilizados.ParamByName('cd_pessoa').AsInteger := cdPessoa;
   qryCamposUtilizados.ParamByName('ds_chave').AsString := dsChave;
   qryCamposUtilizados.Open;

   if qryCamposUtilizados.RecordCount > 0 then
   begin
      Result := TStringList.Create;
   end
   else
   begin
      Result := nil;
   end;

   while not qryCamposUtilizados.Eof do
   begin
      Result.Add(qryCamposUtilizados.FieldByName('ds_coluna').AsString);
      
      qryCamposUtilizados.Next;
   end;
end;

function TfrmSelColunas.isCampoGrid(grd: TDBGrid; fieldName: String): Boolean;
var
   i: Integer;
begin
   Result := False;

   for i := 0 to grd.Columns.Count - 1 do
   begin
      if grd.Columns[i].FieldName = fieldName then
      begin
         Result := True;
         Exit;
      end;
   end;
end;

procedure TfrmSelColunas.registraCampo(cdPessoa, nrTamanho, nrOrdem: Integer;
   dsChave, dsColuna: String);
const
   SQL_REGISTRA_CAMPO =
      ' REPLACE INTO nu_planilhas '+
      '  (  '+
      '     cd_pessoa, '+
      '     ds_chave, '+
      '     ds_coluna, '+
      '     nr_ordem, '+
      '     nr_tamanho '+
      '  ) '+
      '  VALUES '+
      '  ( '+
      '     :cd_pessoa, '+
      '     :ds_chave, '+
      '     :ds_coluna, '+
      '     :nr_ordem, '+
      '     :nr_tamanho '+
      '  ) ';
var
   qryRegistraCampo: TUMZQuery;  
begin
   DM.CriarConsulta(qryRegistraCampo);
   qryRegistraCampo.SQL.Text := SQL_REGISTRA_CAMPO;

   qryRegistraCampo.ParamByName('cd_pessoa').AsInteger := cdPessoa;
   qryRegistraCampo.ParamByName('ds_chave').AsString := dsChave;
   qryRegistraCampo.ParamByName('ds_coluna').AsString := dsColuna;
   qryRegistraCampo.ParamByName('nr_tamanho').AsInteger := nrTamanho;
   qryRegistraCampo.ParamByName('nr_ordem').AsInteger := nrOrdem;

   qryRegistraCampo.ExecSQL;
end;

procedure TfrmSelColunas.registraCamposUtilizados(grd: TDBGrid;
  cdPessoa: Integer; dsChave: String);
var
   i,
   j: Integer;  
begin
   deleteRegistros(cdPessoa, dsChave);

   for i := 0 to grd.Columns.Count - 1 do
   begin
      for j := 0 to grd.DataSource.DataSet.FieldCount - 1 do
      begin
         if grd.Columns.Items[i].FieldName = grd.DataSource.DataSet.Fields[j].FieldName then
         begin
            registraCampo(cdPessoa, grd.Columns.Items[i].Width, i, dsChave, grd.DataSource.DataSet.Fields[j].FieldName);
         end;
      end;
   end;
end;

procedure TfrmSelColunas.sbParaBaixoClick(Sender: TObject);
Var
  iAtual : Integer;
begin
  iAtual := lbUtilizadas.ItemIndex;
  if (iAtual < lbUtilizadas.Count -1) and (iAtual >= 0) then
  begin
     lbUtilizadas.Items.Move(iAtual, iAtual +1) ;
     lbUtilizadas.Selected[iAtual + 1] := true;
  end;
end;

procedure TfrmSelColunas.sbParaCimaClick(Sender: TObject);
Var
  iAtual : Integer;
begin
  iAtual := lbUtilizadas.ItemIndex;
  if iAtual > 0 then begin
     lbUtilizadas.Items.Move(iAtual, iAtual -1) ;
     lbUtilizadas.Selected[iAtual - 1] := true;
  end;
end;

procedure TfrmSelColunas.btInsereUmClick(Sender: TObject);
begin

   if lbDisponiveis.ItemIndex >= 0 then begin
     lbUtilizadas.Items.Add(lbDisponiveis.Items.Strings[lbDisponiveis.ItemIndex]);
     lbDisponiveis.DeleteSelected;
   end

end;

procedure TfrmSelColunas.btRemoveUmClick(Sender: TObject);
begin

   if lbUtilizadas.ItemIndex >= 0 then begin
     lbDisponiveis.Items.Add(lbUtilizadas.Items.Strings[lbUtilizadas.ItemIndex]);
     lbUtilizadas.DeleteSelected;
   end;

end;

procedure TfrmSelColunas.deleteRegistros(cdPessoa: Integer; dsChave: String);
const
   SQL_DELETE_REGISTROS =
      '  DELETE '+
      '  FROM '+
      '     nu_planilhas '+
      '  WHERE '+
      '     cd_pessoa = :cd_pessoa '+
      '     AND ds_chave = :ds_chave ';
var
   qryDeleteRegistros: TUMZQuery;      
begin
   DM.CriarConsulta(qryDeleteRegistros);
   
   qryDeleteRegistros.SQL.Text := SQL_DELETE_REGISTROS;
   qryDeleteRegistros.ParamByName('cd_pessoa').AsInteger := cdPessoa;
   qryDeleteRegistros.ParamByName('ds_chave').AsString := dsChave;
   qryDeleteRegistros.ExecSQL;
end;

procedure TfrmSelColunas.btInsereTodosClick(Sender: TObject);
begin

   lbUtilizadas.Items.AddStrings(lbDisponiveis.Items);
   lbDisponiveis.Items.Clear;

end;

procedure TfrmSelColunas.btRemoveTodosClick(Sender: TObject);
begin

   lbDisponiveis.Items.AddStrings(lbUtilizadas.Items);
   lbUtilizadas.Items.Clear;

end;

procedure TfrmSelColunas.BitBtn2Click(Sender: TObject);
begin
   if lbUtilizadas.Items.Count = 0 then begin
      Mensagem('Nenhuma coluna foi selecionada para compor a planilha', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end
   else
   begin
      ModalResult := mrAll;
      CloseModal();
   end;
end;

end.

