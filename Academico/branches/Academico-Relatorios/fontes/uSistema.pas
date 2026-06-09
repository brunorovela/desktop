unit uSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Db, Grids, DBGrids, ZConnection, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, IniFiles, Mask, Menus;

type
  TfrmSistema = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnFechar: TSpeedButton;
    Panel2: TPanel;
    chkMatricula: TCheckBox;
    Panel3: TPanel;
    tblMensagensTurma: TZTable;
    dtcMensagensTurma: TDataSource;
    tblMensagensTurmaTurma: TStringField;
    tblMensagensTurmaCodigoMensagem: TIntegerField;
    grd: TDBGrid;
    btnMensagem: TSpeedButton;
    tblMensagens: TZTable;
    dtcMensagens: TDataSource;
    tblMensagensCodigo: TIntegerField;
    tblMensagensTitulo: TStringField;
    Navigator: TDBNavigator;
    tblMensagensTurmaTitulo: TStringField;
    tblMensagensTurmaMes: TSmallintField;
    tblMensagensMensagem: TBlobField;
    Label2: TLabel;
    txtTurma: TEdit;
    Label1: TLabel;
    txtMes: TEdit;
    pmQtd: TPopupMenu;
    procedure btnFecharClick(Sender: TObject);
    procedure tblMensagensTurmaBeforeDelete(DataSet: TDataSet);
    procedure btnMensagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
  private
    Univer : TIniFile;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSistema: TfrmSistema;

implementation

uses uMensagens, Main, uDM;

{$R *.DFM}

procedure TfrmSistema.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmSistema.tblMensagensTurmaBeforeDelete(DataSet: TDataSet);
begin
  if Mensagem( 'Deseja excluir o registro ?', Application.Title,
               MB_YESNO + MB_ICONQUESTION ) = ID_NO then Abort;
end;

procedure TfrmSistema.btnMensagemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMensagens, frmMensagens);
  frmMensagens.ShowModal;
end;

procedure TfrmSistema.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  chkMatricula.Checked := iniWMestre.ReadBool('Configuracoes', 'Matriculas', True );
  Screen.Cursor := crHourGlass;
  tblMensagens.Open;
  tblMensagensTurma.Open;
  Screen.Cursor := crDefault;
end;

procedure TfrmSistema.FormHide(Sender: TObject);
begin
  tblMensagensTurma.Close;
  tblMensagens.Close;

  if chkMatricula.Checked then
    iniWMestre.WriteBool( 'Configuracoes', 'Matriculas', True )
  else
    iniWMestre.WriteBool( 'Configuracoes', 'Matriculas', False );

end;

procedure TfrmSistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;


procedure TfrmSistema.txtTurmaKeyPress(Sender: TObject; var Key: Char);
var
  str : String;
begin

  if Key = #13 then
  begin
    str := '';

    if txtTurma.Text <> '' then
      str := str + '[Turma] = ''' + txtTurma.Text + '''';

    if txtMes.Text <> '' then
    begin
      if str <> '' then
        str := str + ' and [Mes] = ' + txtMes.Text
      else
        str := str + '[Mes] = ' + txtMes.Text
    end;

    tblMensagensTurma.Filter := str;

    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmSistema.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros_table(tblMensagensTurma, pmQtd);

end;

end.

