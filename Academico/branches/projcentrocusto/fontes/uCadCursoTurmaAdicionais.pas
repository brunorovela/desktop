unit uCadCursoTurmaAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, DB, DBTables, Grids, DBGrids, ImgList,
  DBCtrls, StdCtrls, Mask, ZDataset, UZDataset, ZAbstractRODataset,
  ZAbstractDataset, General;

type
  TfrmCadCursoTurmaAdicionais = class(TForm)
    pnPrincipal: TPanel;
    pnTopo: TPanel;
    imgRodaPe: TImageList;
    pnRodaPe: TPanel;
    toolAcoes: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    pnConteudo: TPanel;
    dtcCursosTurmasCampos: TDataSource;
    pnEsquerda: TPanel;
    dbeCodigo: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeNome: TDBEdit;
    lblCampo: TLabel;
    lblDescricao: TLabel;
    lblNome: TLabel;
    lblOpcao: TLabel;
    lblOrdem: TLabel;
    lblTipoCampo: TLabel;
    pnDireita: TPanel;
    dbgCamposAdicionais: TDBGrid;
    dblNomeOpcao: TDBLookupComboBox;
    dtcOpcoes: TDataSource;
    cmCurso: TComboBox;
    cmTipoCampo: TComboBox;
    dbeOrdenacao: TDBEdit;
    lblCurso: TLabel;
    qyCursosTurmasCampos: TUMZQuery;
    qyOpcoes: TUMZReadOnlyQuery;
    qyOpcoesCD_OPCAO: TLargeintField;
    qyOpcoesDS_OPCAO: TStringField;
    dbchUtilizarCadastro: TDBCheckBox;
    dbeOrdemExtra: TDBEdit;
    Label1: TLabel;
    lblOrdenacaoEx: TLabel;
    qyCursosTurmasCamposCD_CAMPO: TIntegerField;
    qyCursosTurmasCamposDS_CAMPO: TStringField;
    qyCursosTurmasCamposDS_CAMPO_DESCRICAO: TStringField;
    qyCursosTurmasCamposDS_TIPO: TStringField;
    qyCursosTurmasCamposNR_ORDEM: TIntegerField;
    qyCursosTurmasCamposCD_OPCAO: TSmallintField;
    qyCursosTurmasCamposSN_APENAS_CADASTRO: TSmallintField;
    qyCursosTurmasCamposds_opcoes: TStringField;
    qyCursosTurmasCamposnr_ordem_externa: TSmallintField;
    qyCursosTurmasCamposds_chave: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    qyCursosTurmasCampossn_curso: TSmallintField;
    procedure dtcCursosTurmasCamposDataChange(Sender: TObject; Field: TField);
    procedure dbeCodigoChange(Sender: TObject);
    procedure cmCursoChange(Sender: TObject);
    procedure cmTipoCampoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dtcCursosTurmasCamposStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCursoTurmaAdicionais: TfrmCadCursoTurmaAdicionais;

implementation

uses Main;

{$R *.dfm}

procedure TfrmCadCursoTurmaAdicionais.btnAlterarClick(Sender: TObject);
begin
   qyCursosTurmasCampos.Edit;
   dbeNome.SetFocus();
end;

procedure TfrmCadCursoTurmaAdicionais.btnCancelarClick(Sender: TObject);
begin
   qyCursosTurmasCampos.Cancel;
end;

procedure TfrmCadCursoTurmaAdicionais.btnExcluirClick(Sender: TObject);
begin
   qyCursosTurmasCampos.Delete;
end;

procedure TfrmCadCursoTurmaAdicionais.btnIncluirClick(Sender: TObject);
begin
   dbeNome.SetFocus();
   qyCursosTurmasCampos.Insert();
   cmTipoCampo.ItemIndex := 0;
   cmCurso.ItemIndex :=0;
   lblOpcao.Visible:= false;
   dblNomeOpcao.Visible:=false;
end;

procedure TfrmCadCursoTurmaAdicionais.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadCursoTurmaAdicionais.btnSalvarClick(Sender: TObject);
begin

   if cmCurso.ItemIndex = 0 then
      qyCursosTurmasCampossn_curso.AsInteger := 1
   else if cmCurso.ItemIndex = 1 then
      qyCursosTurmasCampossn_curso.AsInteger := 0
   else
      qyCursosTurmasCampossn_curso.AsInteger := 2;   

   if cmTipoCampo.ItemIndex = 0 then
      qyCursosTurmasCamposds_tipo.AsString := 'A'
   else if cmTipoCampo.ItemIndex = 1 then
      qyCursosTurmasCamposds_tipo.AsString := 'S'
   else if cmTipoCampo.ItemIndex = 2 then
      qyCursosTurmasCamposds_tipo.AsString := 'M'
   else
      qyCursosTurmasCamposDS_TIPO.AsString := 'E';
   qyCursosTurmasCampos.Post;

   qyCursosTurmasCampos.close();
   qyCursosTurmasCampos.open();
end;

procedure TfrmCadCursoTurmaAdicionais.cmCursoChange(Sender: TObject);
begin

   if (not(qyCursosTurmasCampos.State in [dsInsert,dsEdit]))then
   begin
      qyCursosTurmasCampos.Edit
   end;
   if cmTipoCampo.ItemIndex = 1 then begin
      dblNomeOpcao.Visible := true;
      lblOpcao.Visible := true;
   end
   else begin
      dblNomeOpcao.Visible := false;
      lblOpcao.Visible := false;
   end;
end;

procedure TfrmCadCursoTurmaAdicionais.cmTipoCampoChange(Sender: TObject);
begin
   if(not (qyCursosTurmasCampos.State in [dsInsert,dsEdit]))then
   begin
      qyCursosTurmasCampos.Edit
   end;
end;

procedure TfrmCadCursoTurmaAdicionais.dbeCodigoChange(Sender: TObject);
begin

      if qyCursosTurmasCampossn_curso.AsInteger = 0 then
         cmCurso.ItemIndex := 1
      else if qyCursosTurmasCampossn_curso.AsInteger = 1 then
         cmCurso.ItemIndex := 0
      else
         cmCurso.ItemIndex := 2;   
           

      if (qyCursosTurmasCamposds_tipo.AsString ='A')  then
         cmTipoCampo.ItemIndex := 0
      else if (qyCursosTurmasCamposds_tipo.AsString ='S')   then
         cmTipoCampo.ItemIndex := 1
      else if (qyCursosTurmasCamposds_tipo.AsString ='M') then
         cmTipoCampo.ItemIndex := 2
      else
         cmTipoCampo.ItemIndex := 3;

end;

procedure TfrmCadCursoTurmaAdicionais.dtcCursosTurmasCamposDataChange(
  Sender: TObject; Field: TField);
begin

   btnExcluir.Enabled := (qyCursosTurmasCamposds_chave.AsString = '')
      and (qyCursosTurmasCampos.State in [dsBrowse]);

  if cmTipoCampo.ItemIndex = 1 then begin
      dblNomeOpcao.Visible := true;
      lblOpcao.Visible := true;
   end
   else begin
      dblNomeOpcao.Visible := false;
      lblOpcao.Visible := false;
   end;
end;

procedure TfrmCadCursoTurmaAdicionais.dtcCursosTurmasCamposStateChange(
  Sender: TObject);

begin
   if(qyCursosTurmasCampos.State in [dsInsert,dsEdit])then
   begin
      btnIncluir.Enabled  := false;
      btnAlterar.Enabled  := false;
      btnExcluir.Enabled  := false;
      btnSalvar.Enabled   := true;
      btnCancelar.Enabled := true;
   end
   else
   begin
      btnIncluir.Enabled  := true;
      btnAlterar.Enabled  := true;
      btnExcluir.Enabled  := true;
      btnSalvar.Enabled   := false;
      btnCancelar.Enabled := false;
   end;
end;

procedure TfrmCadCursoTurmaAdicionais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadCursoTurmaAdicionais.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnIncluir.Enabled  then btnIncluirClick( nil );
    VK_F3 : if btnAlterar.Enabled  then btnAlterarClick( nil );
    VK_F9 : if btnExcluir.Enabled  then btnExcluirClick( nil );
    VK_F5 : if btnSalvar.Enabled   then btnSalvarClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure TfrmCadCursoTurmaAdicionais.FormShow(Sender: TObject);
begin
   qyCursosTurmasCampos.Open;
   qyOpcoes.Open;
   if qyCursosTurmasCamposds_tipo.AsString = 'S' then begin
      dblNomeOpcao.Visible := true;
      lblOpcao.Visible := true;
   end;
end;

end.
