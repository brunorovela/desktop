unit uDiario_Prazos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
  Tfrm_DiariosPrazos = class(TForm)
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
    qyPrazos: TUMZQuery;
    dsPrazos: TDataSource;
    pmQtd: TPopupMenu;
    qyPrazosnr_anosemestre: TSmallintField;
    qyPrazoscd_curso: TStringField;
    qyPrazoscd_turma: TStringField;
    qyPrazosdt_baixa_inicio: TDateTimeField;
    qyPrazosdt_baixa_fim: TDateTimeField;
    qyPrazosdt_envio_inicio: TDateTimeField;
    qyPrazosdt_envio_fim: TDateTimeField;
    qyPrazosdt_exame_inicio: TDateTimeField;
    qyPrazosdt_exame_fim: TDateTimeField;
    qyPrazosnr_etapa: TSmallintField;
    Panel5: TPanel;
    Label1: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    btnPorCurso: TToolButton;
    btnPorTurma: TToolButton;
    ToolButton6: TToolButton;
    qyPrazosCurso: TStringField;
    qyPrazosTurma: TStringField;
    Bevel1: TBevel;
    pnCadastro: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    sbCurso: TSpeedButton;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    sbTurma: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    qyPrazosdt_notas_inicio: TDateTimeField;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    qyProvasTipos: TUMZQuery;
    dsProvasTipos: TDataSource;
    qyProvasTiposcd_prova_tipo: TIntegerField;
    qyProvasTiposds_prova_tipo: TStringField;
    qyProvasTiposds_chave: TStringField;
    qyPrazossn_recuperacao: TSmallintField;
    qyPrazosnm_recuperacao: TStringField;
    qyPrazoscd_prova_tipo: TIntegerField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    sbDisciplina: TSpeedButton;
    qyPrazosDisciplina: TStringField;
    qyPrazoscd_disciplina: TIntegerField;
    qyPrazossn_ocultar_provas: TSmallintField;
    DBCheckBox2: TDBCheckBox;
    procedure sbDisciplinaClick(Sender: TObject);
    procedure qyPrazosAfterOpen(DataSet: TDataSet);
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
    procedure btnPorCursoClick(Sender: TObject);
    procedure btnPorTurmaClick(Sender: TObject);
    procedure qyPrazosCalcFields(DataSet: TDataSet);
    procedure qyPrazosNewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure mcDatasClick(Sender: TObject);
    procedure dtpBaixaInicioChange(Sender: TObject);
    procedure dtpBaixaFimChange(Sender: TObject);
    procedure dtpEnvioInicioChange(Sender: TObject);
    procedure dtpEnvioFimChange(Sender: TObject);
    procedure dtpExameInicioChange(Sender: TObject);
    procedure dtpExameFimChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DiariosPrazos: Tfrm_DiariosPrazos;

implementation

uses Main, uDM, uSelCursos, uSelTurmas, uSelDisciplinas;

{$R *.dfm}

procedure Tfrm_DiariosPrazos.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }

   txtAnoSemestre.text := IntToStr(ano_semestre);

   Filtra;
   
end;

procedure Tfrm_DiariosPrazos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_DiariosPrazos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnInserir.Enabled then btnInserirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnFechar.Enabled then btnSairClick( nil );
  end;

end;

procedure Tfrm_DiariosPrazos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DiariosPrazos.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     qyPrazos.Delete;
  end;
end;

procedure Tfrm_DiariosPrazos.btnFecharClick(Sender: TObject);
begin
   qyPrazos.Close;
   qyPrazos.Open;
   Close;
end;

procedure Tfrm_DiariosPrazos.btnInserirClick(Sender: TObject);
begin
   pnCadastro.Enabled := True;
   DBEdit1.SetFocus;
   qyPrazos.Insert;
end;

procedure Tfrm_DiariosPrazos.btnAlterarClick(Sender: TObject);
begin
   pnCadastro.Enabled := True;
   DBEdit1.SetFocus;
   qyPrazos.Edit;
end;

procedure Tfrm_DiariosPrazos.btnSalvarClick(Sender: TObject);
var
  registro: Pointer;
begin
   registro := qyPrazos.GetBookmark;
   qyPrazos.Post;
   qyPrazos.Close;
   qyPrazos.Open;
   qyPrazos.GotoBookmark(registro);
end;

procedure Tfrm_DiariosPrazos.btnCancelarClick(Sender: TObject);
begin
   qyPrazos.Cancel;
end;

procedure Tfrm_DiariosPrazos.dsPrazosStateChange(Sender: TObject);
begin
    pnCadastro.Enabled := qyPrazos.State in [dsInsert, dsEdit];

    btnInserir.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyPrazos.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyPrazos.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);

    btnPorCurso.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
    btnPorTurma.Enabled := not (qyPrazos.State in [dsInsert, dsEdit]);
    
    sbCurso.Enabled       := (qyPrazos.State in [dsInsert, dsEdit]);
    sbTurma.Enabled       := (qyPrazos.State in [dsInsert, dsEdit]);
    sbDisciplina.Enabled  := (qyPrazos.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_DiariosPrazos.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyPrazos, pmQtd);
end;

procedure Tfrm_DiariosPrazos.sbCursoClick(Sender: TObject);
begin
  frmSelCursos.ShowModal;
  Filtra;
end;

procedure Tfrm_DiariosPrazos.sbDisciplinaClick(Sender: TObject);
begin

     frmSelDisciplinas.PadraoAnosemestre := qyPrazosnr_anosemestre.AsInteger;
     frmSelDisciplinas.PadraoTurma := qyPrazosTurma.AsString;

     frmSelDisciplinas.ShowModal;

     if frmSelDisciplinas.flgSearch then
     Begin
        qyPrazoscd_disciplina.AsInteger := frmSelDisciplinas.qryCursoscodigo.AsInteger
     end;

end;

procedure Tfrm_DiariosPrazos.sbTurmaClick(Sender: TObject);
begin
  frmSelTurmas.ShowModal;
  Filtra;
end;

Procedure Tfrm_DiariosPrazos.Filtra;
begin

  qyPrazos.Close;
  qyPrazos.SQL.Clear;

  qyPrazos.SQL.Add('SELECT ');
  qyPrazos.SQL.Add('  * ');
  qyPrazos.SQL.Add('FROM ');
  qyPrazos.SQL.Add('  diario_prazos ');
  qyPrazos.SQL.Add('WHERE ');
  qyPrazos.SQL.Add('  nr_anosemestre = :anosemestre ');
  qyPrazos.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);

  {
  if frmSelCursos.flgSearch then
  begin
    qyPrazos.SQL.Add('  AND cd_curso = :curso ');
    qyPrazos.ParamByName('curso').AsString := frmSelCursos.qryCursos.FieldByName('codigo').AsString;
  end;

  if frmSelTurmas.flgSearch then
  begin
    qyPrazos.SQL.Add('  AND cd_turma = :turma ');
    qyPrazos.ParamByName('turma').AsString := frmSelTurmas.qryTurmas.FieldByName('turma').AsString;
  end;
  }

  qyPrazos.SQL.Add('ORDER BY ');
  qyPrazos.SQL.Add('  nr_etapa ');

  qyPrazos.Open;

end;

procedure Tfrm_DiariosPrazos.UpDown2Click(Sender: TObject;
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

procedure Tfrm_DiariosPrazos.btnPorCursoClick(Sender: TObject);
begin
  frmSelCursos.txtAnoSemestre.Text := txtAnoSemestre.Text;
  frmSelCursos.ShowModal;
  Filtra;
end;

procedure Tfrm_DiariosPrazos.btnPorTurmaClick(Sender: TObject);
begin
  frmSelTurmas.txtAnoSemestre.Text := txtAnoSemestre.Text;
  frmSelTurmas.ShowModal;
  Filtra;
end;

procedure Tfrm_DiariosPrazos.qyPrazosAfterOpen(DataSet: TDataSet);
begin
   qyProvasTipos.Close();
   qyProvasTipos.Open();
end;

procedure Tfrm_DiariosPrazos.qyPrazosCalcFields(DataSet: TDataSet);
begin

  if (qyPrazos.FieldByName('cd_curso').AsString = '') then begin
     qyPrazos.FieldByName('Curso').AsString := 'TODOS';
  end else begin
     qyPrazos.FieldByName('Curso').AsString := qyPrazos.FieldByName('cd_curso').AsString;
  end;

  if (qyPrazos.FieldByName('cd_turma').AsString = '') then begin
     qyPrazos.FieldByName('Turma').AsString := 'TODAS';
  end else begin
     qyPrazos.FieldByName('Turma').AsString := qyPrazos.FieldByName('cd_turma').AsString;
  end;

  if (qyPrazos.FieldByName('cd_disciplina').AsInteger = 0) then begin
      qyPrazos.FieldByName('Disciplina').AsString := 'TODAS';
  end else begin
      qyPrazos.FieldByName('Disciplina').AsString := qyPrazos.FieldByName('cd_disciplina').AsString;
  end;
  
end;

procedure Tfrm_DiariosPrazos.qyPrazosNewRecord(DataSet: TDataSet);
begin
  qyPrazos.FieldByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  qyPrazos.FieldByName('nr_etapa').AsInteger := 1;
end;

procedure Tfrm_DiariosPrazos.SpeedButton1Click(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
  begin
    frmSelCursos.txtAnoSemestre.Text := txtAnoSemestre.Text;
    frmSelCursos.ShowModal;
    if frmSelCursos.flgSearch then
      qyPrazos.FieldByName('cd_curso').AsString := frmSelCursos.qryCursos.FieldByName('codigo').AsString;
  end;
end;

procedure Tfrm_DiariosPrazos.SpeedButton2Click(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
  begin
    frmSelTurmas.txtAnoSemestre.Text := txtAnoSemestre.Text;
    frmSelTurmas.ShowModal;
    if frmSelTurmas.flgSearch then
      qyPrazos.FieldByName('cd_turma').AsString := frmSelTurmas.qryTurmas.FieldByName('turma').AsString;
  end;
end;

procedure Tfrm_DiariosPrazos.mcDatasClick(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
  begin

    

  end;
end;

procedure Tfrm_DiariosPrazos.dtpBaixaInicioChange(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
    qyPrazos.FieldByName('dt_baixa_inicio').AsDateTime := TDateTimePicker(Sender).DateTime;
end;

procedure Tfrm_DiariosPrazos.dtpBaixaFimChange(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
    qyPrazos.FieldByName('dt_baixa_fim').AsDateTime := TDateTimePicker(Sender).DateTime;
end;

procedure Tfrm_DiariosPrazos.dtpEnvioInicioChange(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
    qyPrazos.FieldByName('dt_envio_inicio').AsDateTime := TDateTimePicker(Sender).DateTime;
end;

procedure Tfrm_DiariosPrazos.dtpEnvioFimChange(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
    qyPrazos.FieldByName('dt_envio_fim').AsDateTime := TDateTimePicker(Sender).DateTime;
end;

procedure Tfrm_DiariosPrazos.dtpExameInicioChange(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
    qyPrazos.FieldByName('dt_exame_inicio').AsDateTime := TDateTimePicker(Sender).DateTime;
end;

procedure Tfrm_DiariosPrazos.dtpExameFimChange(Sender: TObject);
begin
  if qyPrazos.State in [dsInsert, dsEdit] then
    qyPrazos.FieldByName('dt_exame_fim').AsDateTime := TDateTimePicker(Sender).DateTime;
end;

end.

