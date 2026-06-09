unit uCadPlanosDescontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_CadPlanosDescontos = class(TForm)
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
    srcPlanosDescontos: TDataSource;
    pmQtd: TPopupMenu;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    dePercentual: TDBEdit;
    Label4: TLabel;
    deValor: TDBEdit;
    Panel5: TPanel;
    Label5: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    UpDown1: TUpDown;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    qyAux1: TUMZQuery;
    qyPlanosDescontos: TUMZQuery;
    qyAux1nr_anosemestre: TIntegerField;
    qyAux1qt_atividades: TIntegerField;
    qyAux1vl_percentual: TFloatField;
    qyAux1vl_desconto: TFloatField;
    qyAux1vl_desconto_fixo: TFloatField;
    qyAux1cd_tipo_pessoa: TIntegerField;
    qyPlanosDescontosNR_ANOSEMESTRE: TIntegerField;
    qyPlanosDescontosQT_ATIVIDADES: TIntegerField;
    qyPlanosDescontosVL_DESCONTO: TFloatField;
    qyPlanosDescontosVL_DESCONTO_FIXO: TFloatField;
    qyPlanosDescontosCD_TIPO_PESSOA: TIntegerField;
    qyPlanosDescontosVL_PERCENTUAL: TFloatField;
    qryTiposPessoa: TUMZReadOnlyQuery;
    qryTiposPessoaCD_TIPO_PESSOA: TIntegerField;
    qryTiposPessoaDS_TIPO_PESSOA: TStringField;
    qryTiposPessoaSN_ATIVO: TSmallintField;
    qryTiposPessoaTP_PESSOA: TStringField;
    qryTiposPessoaDS_OBSERVACAO: TMemoField;
    qyPlanosDescontosDSTIPOPESSOA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure srcPlanosDescontosStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click2(Sender: TObject; Button: TUDBtnType);
    Procedure Filtra;
    procedure qyPlanosDescontosAfterInsert(DataSet: TDataSet);
    procedure srcPlanosDescontosDataChange(Sender: TObject; Field: TField);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadPlanosDescontos: Tfrm_CadPlanosDescontos;

implementation

uses
   Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadPlanosDescontos.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
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
      TRadioButton(Components[n]).OnKeyPress := KeyPressEvent;
  end ;

   txtAnoSemestre.Text := IntToStr(ano_semestre);
   Filtra;

end;

procedure Tfrm_CadPlanosDescontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadPlanosDescontos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadPlanosDescontos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadPlanosDescontos.btnExcluirClick(Sender: TObject);
begin
   if Mensagem('Deseja realmente excluir?', Application.Title,
         MB_YESNO + MB_ICONQUESTION) = ID_YES then
      qyPlanosDescontos.Delete;
end;

procedure Tfrm_CadPlanosDescontos.btnFecharClick(Sender: TObject);
begin
   qyPlanosDescontos.Close;
   qyPlanosDescontos.Open;
   Close;
end;

procedure Tfrm_CadPlanosDescontos.btnInserirClick(Sender: TObject);
begin
   DBEdit2.SetFocus;
   qyPlanosDescontos.Insert;
end;

procedure Tfrm_CadPlanosDescontos.btnAlterarClick(Sender: TObject);
begin
   DBEdit2.SetFocus;
   qyPlanosDescontos.Edit;
end;

procedure Tfrm_CadPlanosDescontos.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qyPlanosDescontos.FieldByName('qt_atividades').AsInteger;
  qyPlanosDescontos.Post;
  qyPlanosDescontos.Close;
  qyPlanosDescontos.Open;
  qyPlanosDescontos.Locate('qt_atividades', reg, []);
end;

procedure Tfrm_CadPlanosDescontos.btnCancelarClick(Sender: TObject);
begin
   qyPlanosDescontos.Cancel;
end;

procedure Tfrm_CadPlanosDescontos.srcPlanosDescontosStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyPlanosDescontos.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyPlanosDescontos.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyPlanosDescontos.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyPlanosDescontos.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyPlanosDescontos.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyPlanosDescontos.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadPlanosDescontos.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyPlanosDescontos, pmQtd);
end;

procedure Tfrm_CadPlanosDescontos.KeyPressEvent(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_CadPlanosDescontos.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text)
  else
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);

  Filtra;

end;

procedure Tfrm_CadPlanosDescontos.UpDown2Click2(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
     qyPlanosDescontos.FieldByName('qt_atividades').AsInteger := qyPlanosDescontos.FieldByName('qt_atividades').AsInteger + 1
  else
     qyPlanosDescontos.FieldByName('qt_atividades').AsInteger := qyPlanosDescontos.FieldByName('qt_atividades').AsInteger - 1;

end;

Procedure Tfrm_CadPlanosDescontos.Filtra;
Begin

  qyPlanosDescontos.Close;
  qyPlanosDescontos.ParamByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  qyPlanosDescontos.Open;

End;

procedure Tfrm_CadPlanosDescontos.qyPlanosDescontosAfterInsert(
  DataSet: TDataSet);
begin
  qyPlanosDescontos.FieldByName('nr_anosemestre').AsInteger := strToInt(txtAnoSemestre.Text);
  qyPlanosDescontos.FieldByName('qt_atividades').AsInteger := 2;
end;

procedure Tfrm_CadPlanosDescontos.srcPlanosDescontosDataChange(
  Sender: TObject; Field: TField);
begin
   btnInserir.Enabled := (qyPlanosDescontos.State = dsBrowse) and
         DM.RequestPermission('Cadastros.PlanosDescontos', npIncluir, False, Handle);

   btnAlterar.Enabled := (qyPlanosDescontos.State = dsBrowse) and
         DM.RequestPermission('Cadastros.PlanosDescontos', npAlterar, False, Handle);

   btnExcluir.Enabled := (qyPlanosDescontos.State = dsBrowse) and
         (not qyPlanosDescontos.IsEmpty) and
         DM.RequestPermission('Cadastros.PlanosDescontos', npExcluir, False, Handle);

   btnSalvar.Enabled := qyPlanosDescontos.State in [dsEdit, dsInsert];
   btnCancelar.Enabled := qyPlanosDescontos.State in [dsEdit, dsInsert];

   ToolButton3.Enabled := (qyPlanosDescontos.State = dsBrowse) and
         DM.RequestPermission('Cadastros.PlanosDescontos', npExcluir, False, Handle);
         
   if (qyPlanosDescontos.State in [dsInsert,dsEdit]) and
         (qyPlanosDescontos.FieldByName('qt_atividades').AsInteger < 1) then
         qyPlanosDescontos.FieldByName('qt_atividades').AsInteger := 1;
end;

procedure Tfrm_CadPlanosDescontos.ToolButton3Click(Sender: TObject);
begin
   frm_CadPlanosDescontos.Cursor := crHourGlass;

   qyAux1.Close;
   qyAux1.ParamByName('nr_anosemestre').AsString := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
   qyAux1.Open;

   while not qyAux1.Eof do
   begin
      qyPlanosDescontos.Insert;
      qyPlanosDescontos.FieldByName('cd_tipo_pessoa').AsInteger := qyAux1.FieldByName('cd_tipo_pessoa').AsInteger;
      qyPlanosDescontos.FieldByName('qt_atividades').AsInteger := qyAux1.FieldByName('qt_atividades').AsInteger;
      qyPlanosDescontos.FieldByName('vl_percentual').AsFloat := qyAux1.FieldByName('vl_percentual').AsFloat;
      qyPlanosDescontos.FieldByName('vl_desconto').AsFloat := qyAux1.FieldByName('vl_desconto').AsFloat;
      qyPlanosDescontos.FieldByName('vl_desconto_fixo').AsFloat := qyAux1.FieldByName('vl_desconto_fixo').AsFloat;
      qyPlanosDescontos.Post;
      qyAux1.Next;
   end;

   Filtra;

   frm_CadPlanosDescontos.Cursor := crDefault;

   MessageBox(Handle, PChar('Planos de Descontos copiados com sucesso.'), PChar('Informação'), MB_ICONINFORMATION + MB_OK);
end;

end.
