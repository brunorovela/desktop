unit uCadProfissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, DB, ZAbstractRODataset, ZAbstractDataset, General ,UZDataset, UDM;

type
  TfrmCadProfissoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    label1: TLabel;
    dbeDS_PROFISSAO: TDBEdit;
    qyProfissoes: TUMZQuery;
    dsProfissoes: TDataSource;
    qyProfissoesCD_OPCAO: TIntegerField;
    qyProfissoesCD_CAMPO: TIntegerField;
    qyProfissoesDS_OPCAO: TStringField;
    qyRetornaCodCampo: TUMZQuery;
    qyRetornaCodCampoCD_CAMPO: TIntegerField;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsProfissoesStateChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProfissoes: TfrmCadProfissoes;

implementation
 USES
   uAluno;
{$R *.dfm}

procedure TfrmCadProfissoes.btnAlterarClick(Sender: TObject);
begin
   dbeDS_PROFISSAO.SetFocus();
   qyProfissoes.Edit();
end;

procedure TfrmCadProfissoes.btnCancelarClick(Sender: TObject);
begin
   qyProfissoes.Cancel;
end;

procedure TfrmCadProfissoes.btnExcluirClick(Sender: TObject);
begin
 if Mensagem(
      'Deseja realmente excluir ?',
       Application.Title,
       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  Begin
      qyProfissoes.Delete();
      qyProfissoes.Close();
      qyProfissoes.Open();
  End;


end;

procedure TfrmCadProfissoes.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrOK;
  // Close;
end;

procedure TfrmCadProfissoes.btnInserirClick(Sender: TObject);
begin
   qyRetornaCodCampo.Close();
   qyRetornaCodCampo.Open();
   
   dbeDS_PROFISSAO.SetFocus();
   qyProfissoes.Insert();
   qyProfissoesDS_OPCAO.AsString := UpperCase(dbeDS_PROFISSAO.Text);
   qyProfissoesCD_CAMPO.AsString :=  qyRetornaCodCampoCD_CAMPO.AsString;
end;

procedure TfrmCadProfissoes.btnSalvarClick(Sender: TObject);
var
   codigo_opcao : integer;
begin
   if ( dbeDS_PROFISSAO.Text = '' ) then
   begin
      Mensagem('Informe uma profissão para continuar!');
      Exit;
   end;

   codigo_opcao := qyProfissoesCD_OPCAO.AsInteger;
      
   qyProfissoes.Post();
   qyProfissoes.Close();
   qyProfissoes.Open();

   qyProfissoes.Locate(
      'cd_opcao',
      codigo_opcao,
      []
   );

   frm_Alunos.qyCadastroCampos_Opcoes.Close();
   frm_Alunos.qyCampos.Close();
   frm_Alunos.qyCategorias.Close();
   frm_Alunos.qyCadastroCampos_Opcoes.Open();
   frm_Alunos.qyCampos.Open();
   frm_Alunos.qyCategorias.Open();

end;

procedure TfrmCadProfissoes.dsProfissoesStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyProfissoes.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyProfissoes.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyProfissoes.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyProfissoes.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyProfissoes.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyProfissoes.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadProfissoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F2  : btnInserirClick( nil );
      VK_F3  : btnAlterarClick( nil );
      VK_F5  : btnSalvarClick( nil );
      VK_F6  : btnCancelarClick( nil );
      VK_F9  : btnExcluirClick( nil );
      VK_F12 : btnFecharClick( nil );
   end;
end;

procedure TfrmCadProfissoes.FormShow(Sender: TObject);
begin
   qyProfissoes.Close();
   qyProfissoes.Open();
end;

end.
