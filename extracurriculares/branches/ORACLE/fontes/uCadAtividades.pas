unit uCadAtividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uFSelecionarPessoa;

type
  Tfrm_CadAtividades = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel4: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    srcAtividades: TDataSource;
    pmQtd: TPopupMenu;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Panel5: TPanel;
    Label2: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    DBText1: TDBText;
    Label6: TLabel;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    srcAtividadesValores: TDataSource;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBMemo2: TDBMemo;
    labelTipoTitulo: TLabel;
    cbColigadas: TDBLookupComboBox;
    cbCentroCustos: TDBLookupComboBox;
    lbColigada: TLabel;
    lbCentroCusto: TLabel;
    dsColigadas: TDataSource;
    dsCentroCustos: TDataSource;
    cbTiposTitulo: TDBLookupComboBox;
    dsTiposTitulo: TDataSource;
    qyAtividadesValores: TUMZQuery;
    qyAux1: TUMZQuery;
    qyAtividades: TUMZQuery;
    qyColigadas: TUMZQuery;
    qyCentroCustos: TUMZQuery;
    qyTiposTitulo: TUMZQuery;
    qyTiposTitulocd_tipo_titulo: TIntegerField;
    qyTiposTitulods_tipo_titulo: TStringField;
    qyTiposTitulocd_coligada: TIntegerField;
    qyColigadascd_coligada: TIntegerField;
    qyColigadasnm_coligada: TStringField;
    qyAtividadeslookupTiposTitulo: TStringField;
    qyAtividadeslookupCentroCustos: TStringField;
    qyAtividadeslookupColigada: TStringField;
    qyAtividadesnm_pessoa: TStringField;
    qyAtividadesCD_ATIVIDADE: TIntegerField;
    qyAtividadesNR_ANOSEMESTRE: TIntegerField;
    qyAtividadesCD_PROFESSOR: TIntegerField;
    qyAtividadesCD_TIPO_TITULO: TIntegerField;
    qyAtividadesDS_ATIVIDADE: TStringField;
    qyAtividadesDS_SIGLA: TStringField;
    qyAtividadesCD_COLIGADA: TIntegerField;
    qyCentroCustosCD_COLIGADA: TIntegerField;
    qyCentroCustosDS_CENTRO: TStringField;
    qyAtividadesCD_CENTRO: TLargeintField;
    qyAtividadesValoresCD_ATIVIDADE: TIntegerField;
    qyAtividadesValoresNR_ANOSEMESTRE: TIntegerField;
    qyAtividadesValoresCD_TIPO_PESSOA: TIntegerField;
    qyAtividadesValoresVL_ATIVIDADE: TFloatField;
    qyAtividadesValoresDS_OBSERVACAO: TBlobField;
    qyAtividadesDS_OBSERVACAO: TBlobField;
    qyCentroCustoscd_centro: TLargeintField;
    qryTiposPessoa: TUMZReadOnlyQuery;
    qryTiposPessoaCD_TIPO_PESSOA: TIntegerField;
    qryTiposPessoaDS_TIPO_PESSOA: TStringField;
    qryTiposPessoaSN_ATIVO: TSmallintField;
    qryTiposPessoaTP_PESSOA: TStringField;
    qryTiposPessoaDS_OBSERVACAO: TMemoField;
    qyAtividadesValoresDS_TIPO_PESSOA: TStringField;
    procedure qyAtividadesBeforeDelete(DataSet: TDataSet);
    procedure qyAtividadesAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure srcAtividadesStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyAtividadesAfterInsert(DataSet: TDataSet);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    Procedure Filtra;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure qyAtividadesValoresNewRecord(DataSet: TDataSet);
    procedure qyAtividadesValoresAfterPost(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadAtividades: Tfrm_CadAtividades;

implementation

uses Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadAtividades.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    {if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPressEvent;}
  end ;

   txtAnoSemestre.Text := IntToStr(ano_semestre);
   Filtra;

   qyAtividadesValores.Open;
end;

procedure Tfrm_CadAtividades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadAtividades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         btnInserir.Click;
      VK_F3:
         btnAlterar.Click;
      VK_F5:
         btnSalvar.Click;
      VK_F9:
         btnExcluir.Click;
      VK_F6:
         btnCancelar.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

procedure Tfrm_CadAtividades.btnExcluirClick(Sender: TObject);
begin
   if DM.RequestPermission('Cadastros.Atividades', npExcluir, False, Handle) then
      if Mensagem('Deseja realmente excluir?', Application.Title,
         MB_YESNO + MB_ICONQUESTION) = ID_YES then
            qyAtividades.Delete;
end;

procedure Tfrm_CadAtividades.btnFecharClick(Sender: TObject);
begin
   qyAtividades.Close;
   Close;
end;

procedure Tfrm_CadAtividades.btnInserirClick(Sender: TObject);
begin
   DBEdit2.SetFocus;
   qyAtividades.Insert;
end;

procedure Tfrm_CadAtividades.btnAlterarClick(Sender: TObject);
begin
   DBEdit2.SetFocus;
   qyAtividades.Edit;
end;

procedure Tfrm_CadAtividades.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qyAtividades.FieldByName('cd_atividade').AsInteger;
  qyAtividades.Post;
  qyAtividades.Close;
  qyAtividades.Open;
  qyAtividades.Locate('cd_atividade', reg, []);
end;

procedure Tfrm_CadAtividades.btnCancelarClick(Sender: TObject);
begin
   qyAtividades.Cancel;
end;

procedure Tfrm_CadAtividades.srcAtividadesStateChange(Sender: TObject);
begin
    btnInserir.Enabled := (qyAtividades.State = dsBrowse) and
         DM.RequestPermission('Cadastros.Atividades', npIncluir, False, Handle);
         
    btnAlterar.Enabled := (qyAtividades.State = dsBrowse) and
         DM.RequestPermission('Cadastros.Atividades', npAlterar, False, Handle);

    btnExcluir.Enabled := (qyAtividades.State = dsBrowse) and
         (not qyAtividades.IsEmpty) and
         DM.RequestPermission('Cadastros.Atividades', npExcluir, False, Handle);

    ToolButton3.Enabled := (qyAtividades.State = dsBrowse) and
         DM.RequestPermission('Cadastros.Atividades', npEspecial, False, Handle);

    btnSalvar.Enabled := qyAtividades.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyAtividades.State in [dsInsert, dsEdit];
    btnFechar.Enabled := qyAtividades.State = dsBrowse;
end;

procedure Tfrm_CadAtividades.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyAtividades, pmQtd);
end;

procedure Tfrm_CadAtividades.qyAtividadesAfterInsert(DataSet: TDataSet);
begin

  qyAtividades.FieldByName('cd_atividade').AsInteger := DM.ProximoId2('cd_atividade', 'nr_anosemestre', 'extra_atividades', strToInt(txtAnoSemestre.Text));
  qyAtividades.FieldByName('nr_anosemestre').AsInteger := strToInt(txtAnoSemestre.Text);

end;

procedure Tfrm_CadAtividades.qyAtividadesAfterPost(DataSet: TDataSet);
Var
   qyInsere: TUMZQuery;
begin
   // Atualizar a grade de valores das atividades

   qyInsere := TUMZQuery.Create(Self);
   qyInsere.Connection := DM.db;

   qyInsere.SQL.Text :=
    ' INSERT INTO extra_valores_pessoas (cd_atividade, nr_anosemestre, cd_tipo_pessoa, vl_atividade, ds_observacao) ' +
    ' SELECT ' + qyAtividadescd_atividade.AsString +  ', ' + qyAtividadesnr_anosemestre.AsString + ', cd_tipo_pessoa, 0, NULL FROM extra_tipos_pessoas etp WHERE sn_ativo = 1 ' +
    ' AND (SELECT count(*) as qtd FROM extra_valores_pessoas evp WHERE evp.cd_atividade = ' + qyAtividadescd_atividade.AsString +  ' AND evp.nr_anosemestre = ' + qyAtividadesnr_anosemestre.AsString +
    ' AND evp.cd_tipo_pessoa = etp.cd_tipo_pessoa) = 0 ';

   qyInsere.ExecSQL();

   FreeAndNil(qyInsere);

end;

procedure Tfrm_CadAtividades.qyAtividadesBeforeDelete(DataSet: TDataSet);
begin
   while not qyAtividadesValores.IsEmpty do qyAtividadesValores.Delete;
end;

procedure Tfrm_CadAtividades.KeyPressEvent(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_CadAtividades.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text)
  else
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);

  Filtra;

end;

Procedure Tfrm_CadAtividades.Filtra;
Begin
   qyAtividades.Close;
   qyAtividades.ParamByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   qyAtividades.Open;
End;

procedure Tfrm_CadAtividades.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

  DBEdit2.SetFocus;

  resultado := TfrmSelecionarPessoa.Filtrar([], afpProfessor);
  
  if (resultado.filtrado) then
  begin
      qyAtividades.FieldByName('cd_professor').AsInteger := resultado.cd_pessoa;
  end;
end;

procedure Tfrm_CadAtividades.ToolButton3Click(Sender: TObject);
begin
  frm_CadAtividades.Cursor := crHourGlass;

  qyAux1.Close;
  qyAux1.ParamByName('nr_anosemestre').AsString := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  qyAux1.Open;

  while not qyAux1.Eof do
  begin
      qyAtividades.Insert;
      qyAtividadesCD_PROFESSOR.AsInteger := qyAux1.FieldByName('cd_professor').AsInteger;
      qyAtividadesCD_TIPO_TITULO.AsInteger := qyAux1.FieldByName('cd_tipo_titulo').AsInteger;
      qyAtividadesCD_CENTRO.AsInteger := qyAux1.FieldByName('cd_centro').AsInteger;
      qyAtividadesCD_COLIGADA.AsInteger := qyAux1.FieldByName('cd_coligada').AsInteger;
      qyAtividadesDS_ATIVIDADE.AsString := qyAux1.FieldByName('ds_atividade').AsString;
      qyAtividadesDS_OBSERVACAO.AsString := qyAux1.FieldByName('ds_observacao').AsString;
      qyAtividadesDS_SIGLA.AsString := qyAux1.FieldByName('ds_sigla').AsString;
      qyAtividades.Post;
      qyAux1.Next;
  end;

  Filtra;

  frm_CadAtividades.Cursor := crDefault;

  MessageBox(Handle, PChar('Atividades copiadas com sucesso.'), PChar('Informação'), MB_ICONINFORMATION + MB_OK);
end;

procedure Tfrm_CadAtividades.qyAtividadesValoresNewRecord(
  DataSet: TDataSet);
begin
  qyAtividadesValores.FieldByName('cd_atividade').AsInteger := qyAtividades.FieldByName('cd_atividade').AsInteger;
  qyAtividadesValores.FieldByName('nr_anosemestre').AsInteger := qyAtividades.FieldByName('nr_anosemestre').AsInteger;
end;

procedure Tfrm_CadAtividades.qyAtividadesValoresAfterPost(
  DataSet: TDataSet);
begin
   qyAtividadesValores.Close;
   qyAtividadesValores.Open;
end;

procedure Tfrm_CadAtividades.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then begin
    if Mensagem( 'Deseja realmente apagar o valor da atividade para '+qyAtividadesValores.FieldByName('ds_tipo_pessoa').AsString+' ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
      qyAtividadesValores.Delete;
    end;
  end;
end;

end.
