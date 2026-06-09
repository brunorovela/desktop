{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadOpcoesIngresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_CadOpcoesIngresso = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
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
    qyGrupos: TUMZQuery;
    srcGrupos: TDataSource;
    pmQtd: TPopupMenu;
    Bevel1: TBevel;
    pcOpcoesIngresso: TPageControl;
    tsGrupos: TTabSheet;
    tsOpcoes: TTabSheet;
    Bevel5: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    dbeCodigoGrupo: TDBEdit;
    Label2: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    srcOpcoes: TDataSource;
    qyOpcoes: TUMZQuery;
    Label3: TLabel;
    dbeCodigoOpcao: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    qyGruposCD_GRUPO_INGRESSO: TLargeintField;
    qyGruposDS_GRUPO_INGRESSO: TStringField;
    qyOpcoesCD_INGRESSO_ONLINE: TLargeintField;
    qyOpcoesDS_INGRESSO_ONLINE: TStringField;
    qyOpcoesCD_INGRESSO_GRUPO: TLargeintField;
    qyOpcoesDS_URL: TStringField;
    qyOpcoesSN_DISPONIVEL: TIntegerField;
    qyOpcoesDS_OBS_INGRESSO: TMemoField;
    procedure pcOpcoesIngressoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure srcGruposDataChange(Sender: TObject; Field: TField);
    procedure srcOpcoesStateChange(Sender: TObject);
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
    procedure srcGruposStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadOpcoesIngresso: Tfrm_CadOpcoesIngresso;

implementation

uses Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadOpcoesIngresso.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
//  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPress;
  end ;

   pcOpcoesIngresso.ActivePage := tsGrupos;

   qyGrupos.Close;
   qyGrupos.Open;
end;

procedure Tfrm_CadOpcoesIngresso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadOpcoesIngresso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadOpcoesIngresso.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadOpcoesIngresso.btnExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1030, npExcluir, True ) then Exit;
  if pcOpcoesIngresso.ActivePage = tsGrupos then begin
    if Mensagem( 'Deseja realmente excluir o grupo e tudas as suas opções de ingresso ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
      with DM.qyAux do begin
        Close();
        SQL.Text := 'DELETE FROM online_ingressos WHERE cd_ingresso_grupo = :cd_grupo_ingresso';
        ParamByName('cd_grupo_ingresso').AsInteger := qyGrupos.FieldByName('cd_grupo_ingresso').AsInteger;
        ExecSQL();
      end;
      qyGrupos.Delete;
    end;
  end
  else begin
    if Mensagem( 'Deseja realmente excluir a opção ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
      qyOpcoes.Delete;
    end;
  end;

end;

procedure Tfrm_CadOpcoesIngresso.btnFecharClick(Sender: TObject);
begin
   qyGrupos.Close;
   qyGrupos.Open;
   Close;
end;

procedure Tfrm_CadOpcoesIngresso.btnInserirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1030, npIncluir, True ) then Exit;

  if pcOpcoesIngresso.ActivePage = tsGrupos then begin
    dbeCodigoGrupo.SetFocus;
    qyGrupos.Insert;
  end
  else begin
    dbeCodigoOpcao.SetFocus;
    qyOpcoes.Insert;
  end;
end;

procedure Tfrm_CadOpcoesIngresso.btnAlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1030, npAlterar, True ) then Exit;
  if pcOpcoesIngresso.ActivePage = tsGrupos then begin
    dbeCodigoGrupo.SetFocus;
    qyGrupos.Edit;
  end
  else begin
    dbeCodigoOpcao.SetFocus;
    qyOpcoes.Edit;
  end;
end;

procedure Tfrm_CadOpcoesIngresso.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin

  if pcOpcoesIngresso.ActivePage = tsGrupos then begin
    reg := qyGrupos.FieldByName('CD_GRUPO_INGRESSO').AsInteger;
    qyGrupos.Post;
    qyGrupos.Close;
    qyGrupos.Open;

    qyGrupos.Locate('CD_GRUPO_INGRESSO', reg, []);
  end
  else begin
    reg := qyOpcoes.FieldByName('cd_ingresso_online').AsInteger;
    qyOpcoes.Post;
    qyOpcoes.Close;
    qyOpcoes.Open;
    qyOpcoes.Locate('cd_ingresso_online', reg, []);
  end;
end;

procedure Tfrm_CadOpcoesIngresso.btnCancelarClick(Sender: TObject);
begin
  if pcOpcoesIngresso.ActivePage = tsGrupos then begin
    qyGrupos.Cancel;
  end
  else begin
    qyOpcoes.Cancel;
  end;
end;

procedure Tfrm_CadOpcoesIngresso.srcGruposStateChange(Sender: TObject);
begin
  if pcOpcoesIngresso.ActivePage = tsGrupos then begin
    btnInserir.Enabled := not (qyGrupos.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyGrupos.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyGrupos.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyGrupos.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyGrupos.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyGrupos.State in [dsInsert, dsEdit]);
  end;
end;

procedure Tfrm_CadOpcoesIngresso.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyGrupos, pmQtd);
end;

procedure Tfrm_CadOpcoesIngresso.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_CadOpcoesIngresso.srcOpcoesStateChange(Sender: TObject);
begin
  if pcOpcoesIngresso.ActivePage = tsOpcoes then begin
    btnInserir.Enabled := not (qyOpcoes.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyOpcoes.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyOpcoes.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyOpcoes.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyOpcoes.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyOpcoes.State in [dsInsert, dsEdit]);
  end;
end;

procedure Tfrm_CadOpcoesIngresso.srcGruposDataChange(Sender: TObject;
  Field: TField);
begin
  qyOpcoes.Close();
  qyOpcoes.Open();
end;

procedure Tfrm_CadOpcoesIngresso.DBGrid1DblClick(Sender: TObject);
begin
  pcOpcoesIngresso.ActivePage := tsOpcoes;
end;

procedure Tfrm_CadOpcoesIngresso.pcOpcoesIngressoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if qyGrupos.State in [dsInsert,dsEdit] then begin
    qyGrupos.Cancel();
  end;
  if qyOpcoes.State in [dsInsert,dsEdit] then begin
    qyOpcoes.Cancel();
  end;
end;

end.

