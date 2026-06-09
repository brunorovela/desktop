{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadTiposMovto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_CadTiposMovto = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel4: TPanel;
    Bevel6: TBevel;
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
    qyTiposMovto: TUMZQuery;
    srcTiposMovto: TDataSource;
    pmQtd: TPopupMenu;
    qyTiposMovtocd_movimento: TIntegerField;
    qyTiposMovtods_movimento: TStringField;
    qyTiposMovtocd_tipo_movimento: TSmallintField;
    qyTiposMovtocd_movimento_caixa: TIntegerField;
    qyTiposMovtosn_ativo: TStringField;
    qyTiposMovtosn_manual: TStringField;
    qyTiposMovtocd_origem: TSmallintField;
    qyTiposMovtoativo: TStringField;
    qyTiposMovtotp_entrada_saida: TSmallintField;
    ScrollBox1: TScrollBox;
    Label4: TLabel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    drgOrigem: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
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
    procedure srcTiposMovtoStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyTiposMovtoCalcFields(DataSet: TDataSet);
    procedure grdDblClick(Sender: TObject);
    procedure qyTiposMovtoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadTiposMovto: Tfrm_CadTiposMovto;
  movtos_te: array of integer;

implementation

uses Main, uDM;

{$R *.dfm}

procedure Tfrm_CadTiposMovto.FormShow(Sender: TObject);
var
  n: integer;
begin
  { Todas em maiúsculas }
 //  DM.TodasMaiusculas(TForm(Sender));

   qyTiposMovto.Close;
   qyTiposMovto.Open;

   DM.qyTiposMovtoTipos.Close;
   DM.qyTiposMovtoTipos.Open;

   DM.qyTiposMovto.Close;
   DM.qyTiposMovto.Open;

end;

procedure Tfrm_CadTiposMovto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadTiposMovto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F4 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadTiposMovto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadTiposMovto.btnExcluirClick(Sender: TObject);
begin

  if (DM.ExisteRegistro('fin_mov_tesouraria','cd_movimento',qyTiposMovto.FieldByName('cd_movimento').AsString)) OR (DM.ExisteRegistro('fin_mov_cp','cd_movimento',qyTiposMovto.FieldByName('cd_movimento').AsString)) then
  begin
    Mensagem( 'Não é possível excluir este registro.'+CHR(13)+'Há informações ligadas a ele.', Application.Title, MB_OK + MB_ICONWARNING );
    Exit;
  end;

  IF qyTiposMovtosn_manual.AsString = 'N' then
  begin
    Mensagem( 'Não é possível excluir uma ação de movimento automática.', Application.Title, MB_OK + MB_ICONWARNING );
    Exit;
  end;

  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     DM.gerar_log_acesso(2105, 'N', 'N', 'N', 'S');
     qyTiposMovto.Delete;
  end;
end;

procedure Tfrm_CadTiposMovto.btnFecharClick(Sender: TObject);
begin
   qyTiposMovto.Close;
   qyTiposMovto.Open;
   Close;
end;

procedure Tfrm_CadTiposMovto.btnInserirClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   qyTiposMovto.Insert;
end;

procedure Tfrm_CadTiposMovto.btnAlterarClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   qyTiposMovto.Edit;
end;

procedure Tfrm_CadTiposMovto.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qyTiposMovto.FieldByName('cd_movimento').AsInteger;

  { Gerando LOG de acesso }
  if qyTiposMovto.State in [dsInsert] then
   DM.gerar_log_acesso(2105, 'N', 'S', 'N', 'N')
  else
   DM.gerar_log_acesso(2105, 'N', 'N', 'S', 'N');

  qyTiposMovto.Post;
  qyTiposMovto.Close;
  qyTiposMovto.Open;
  qyTiposMovto.Locate('cd_movimento', reg, []);
end;

procedure Tfrm_CadTiposMovto.btnCancelarClick(Sender: TObject);
begin
   qyTiposMovto.Cancel;
end;

procedure Tfrm_CadTiposMovto.srcTiposMovtoStateChange(Sender: TObject);
begin

    if qyTiposMovto.State in [dsInsert] then
    begin
      drgOrigem.ReadOnly := False;
    end
    else
    if (DM.ExisteRegistro('fin_mov_tesouraria','cd_movimento',qyTiposMovto.FieldByName('cd_movimento').AsString)) OR (DM.ExisteRegistro('fin_mov_cp','cd_movimento',qyTiposMovto.FieldByName('cd_movimento').AsString)) then
    begin
      drgOrigem.ReadOnly := True;
    end
    else
    begin
      drgOrigem.ReadOnly := False;
    end;

    btnInserir.Enabled := not (qyTiposMovto.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyTiposMovto.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyTiposMovto.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyTiposMovto.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyTiposMovto.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyTiposMovto.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadTiposMovto.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyTiposMovto, pmQtd);
end;

procedure Tfrm_CadTiposMovto.qyTiposMovtoCalcFields(DataSet: TDataSet);
begin

  {
  #SE= O campo sn_ativo da tabela for igual a S
  }
  if DM.isTrue(qyTiposMovto.FieldByName('sn_ativo').AsString) then
    {
    #ENTAO= Atribua o valor X ao campo ativa
    }
    qyTiposMovto.FieldByName('ativo').AsString := 'X';

end;

procedure Tfrm_CadTiposMovto.grdDblClick(Sender: TObject);
var
  reg: Pointer;
begin

if DM.isTrue(qyTiposMovto.FieldByName('sn_manual').AsString) then
begin
  case grd.SelectedIndex of
    1: begin

      if DM.isTrue(qyTiposMovto.FieldByName('sn_ativo').AsString) then
      begin
        qyTiposMovto.Edit;
        qyTiposMovto.FieldByName('sn_ativo').AsString := 'N';
      end
      else
      begin
        qyTiposMovto.Edit;
        qyTiposMovto.FieldByName('sn_ativo').AsString := 'S';
      end;

      reg := qyTiposMovto.GetBookmark;
      qyTiposMovto.Post;
      qyTiposMovto.Close;
      qyTiposMovto.Open;
      qyTiposMovto.GotoBookmark(reg);

    end;
  end;
end;

end;

procedure Tfrm_CadTiposMovto.qyTiposMovtoAfterInsert(DataSet: TDataSet);
begin
  qyTiposMovto.FieldByName('cd_movimento').AsInteger := DM.ProximoId('cd_movimento', 'fin_tipos_movimento');
  qyTiposMovto.FieldByName('sn_manual').AsString := 'S';
end;

end.

