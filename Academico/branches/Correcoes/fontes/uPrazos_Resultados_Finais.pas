unit uPrazos_Resultados_Finais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
  Tfrm_ResultadosFinais = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    pnCadastro: TPanel;
    Bevel6: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyPrazos: TUMZQuery;
    dsPrazos: TDataSource;
    pmQtd: TPopupMenu;
    Bevel1: TBevel;
    Panel5: TPanel;
    Label1: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    Bevel2: TBevel;
    qyPrazosdt_resultado_final: TDateTimeField;
    Panel6: TPanel;
    Label2: TLabel;
    lbCurso: TLabel;
    qyPrazosapelido: TStringField;
    Label3: TLabel;
    edDepto: TEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    dbData: TDBEdit;
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
    procedure dsPrazosStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure sbCursoClick(Sender: TObject);
    procedure sbTurmaClick(Sender: TObject);

    Procedure Filtra;
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dsPrazosDataChange(Sender: TObject; Field: TField);
    procedure cbDeptoChange(Sender: TObject);
    procedure dtpDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ResultadosFinais: Tfrm_ResultadosFinais;

implementation

uses Main, uDM, uSelCursos, uSelTurmas, uSelDepartamento;

{$R *.dfm}

procedure Tfrm_ResultadosFinais.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   txtAnoSemestre.text := IntToStr(ano_semestre);

   Filtra;

end;

procedure Tfrm_ResultadosFinais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_ResultadosFinais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_ResultadosFinais.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ResultadosFinais.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     qyPrazos.Delete;
  end;
end;

procedure Tfrm_ResultadosFinais.btnFecharClick(Sender: TObject);
begin
   qyPrazos.Close;
   qyPrazos.Open;
   Close;
end;

procedure Tfrm_ResultadosFinais.btnInserirClick(Sender: TObject);
begin
   qyPrazos.Insert;
end;

procedure Tfrm_ResultadosFinais.btnAlterarClick(Sender: TObject);
begin
   pnCadastro.Enabled := True;
   dbData.SetFocus;
   qyPrazos.Edit;
end;

procedure Tfrm_ResultadosFinais.btnSalvarClick(Sender: TObject);
var
  registro: Pointer;
begin
   registro := qyPrazos.GetBookmark;
   qyPrazos.Post;
   qyPrazos.Close;
   qyPrazos.Open;
   qyPrazos.GotoBookmark(registro);
end;

procedure Tfrm_ResultadosFinais.btnCancelarClick(Sender: TObject);
begin
   qyPrazos.Cancel;
end;

procedure Tfrm_ResultadosFinais.dsPrazosStateChange(Sender: TObject);
begin
    pnCadastro.Enabled := qyPrazos.State in [dsInsert, dsEdit];
    btnAlterar.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyPrazos.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyPrazos.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_ResultadosFinais.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyPrazos, pmQtd);
end;

procedure Tfrm_ResultadosFinais.sbCursoClick(Sender: TObject);
begin
  frmSelCursos.ShowModal;
end;

procedure Tfrm_ResultadosFinais.sbTurmaClick(Sender: TObject);
begin
  frmSelTurmas.ShowModal;
end;

procedure Tfrm_ResultadosFinais.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  Filtra;

end;

procedure Tfrm_ResultadosFinais.SpeedButton1Click(Sender: TObject);
begin
  if qyPrazos.State <> dsEdit then
  begin
    frmSelDepartamento.ShowModal;
    if frmSelDepartamento.flgSearch then
    begin
      edDepto.Text := frmSelDepartamento.qryDepartamento.FieldByName('descricao').AsString;
      Filtra;
    end;

  end;
end;

procedure Tfrm_ResultadosFinais.dsPrazosDataChange(Sender: TObject;
  Field: TField);
begin
  lbCurso.Caption := qyPrazos.FieldByName('apelido').AsString;
end;

Procedure Tfrm_ResultadosFinais.Filtra;
begin
   qyPrazos.Close;
   qyPrazos.SQL.Clear;
   qyPrazos.SQL.Add('SELECT ');
   qyPrazos.SQL.Add('   apelido, ');
   qyPrazos.SQL.Add('   dt_resultado_final ');
   qyPrazos.SQL.Add('FROM ');
   qyPrazos.SQL.Add('   cursos ');
   qyPrazos.SQL.Add('WHERE ');

   if txtAnoSemestre.Text <> '' then
   begin
     qyPrazos.SQL.Add('   anosemestre = :anosemestre ');
     qyPrazos.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   end;

   if frmSelDepartamento.flgSearch then
   begin
     qyPrazos.SQL.Add('   AND depto = :depto ');
     qyPrazos.ParamByName('depto').AsInteger := frmSelDepartamento.qryDepartamento.FieldByName('codigo').AsInteger;
   end;

   qyPrazos.SQL.Add('ORDER BY ');
   qyPrazos.SQL.Add('   apelido ');

   qyPrazos.Open;
end;

procedure Tfrm_ResultadosFinais.cbDeptoChange(Sender: TObject);
begin
  Filtra;
end;

procedure Tfrm_ResultadosFinais.dtpDataClick(Sender: TObject);
begin
  pnCadastro.Enabled := True;
  dbData.SetFocus;
  qyPrazos.Edit;
end;

end.

