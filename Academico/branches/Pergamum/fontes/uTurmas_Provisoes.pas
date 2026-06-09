unit uTurmas_Provisoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Variants, Menus;

type
  Tfrm_Turmas_Provisoes = class(TForm)
    Panel3: TPanel;
    Bevel7: TBevel;
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
    tblProvisoes: TUMZQuery;
    dsProvisoes: TDataSource;
    tblTurmas: TUMZQuery;
    dsTurmas: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel5: TBevel;
    Panel5: TPanel;
    txtAnoSemestre: TMaskEdit;
    UpDownCursos: TUpDown;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    grd: TDBGrid;
    Panel6: TPanel;
    tblTurmascodigo: TStringField;
    tblTurmascurso: TStringField;
    tblTurmasdesc_curso: TStringField;
    tblTurmasdesc_turma: TStringField;
    tblTurmasanosemestre: TSmallintField;
    tblProvisoesnr_anosemestre: TSmallintField;
    tblProvisoescd_turma: TStringField;
    tblProvisoescd_curso: TStringField;
    tblProvisoescd_conta_lcto: TStringField;
    tblProvisoesvl_debito: TFloatField;
    tblProvisoesvl_credito: TFloatField;
    tblContas: TUMZQuery;
    tblContascodigo: TStringField;
    tblContasdescricao: TStringField;
    tblContastipomovimento: TStringField;
    tblContasclasse: TStringField;
    tblContassaldo: TFloatField;
    tblProvisoesdescConta: TStringField;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    cbTurma: TComboBox;
    Label1: TLabel;
    cbCurso: TComboBox;
    Label10: TLabel;
    cbAnoSemestre: TCheckBox;
    qyCombo: TUMZQuery;
    pmQtdTurmas: TPopupMenu;
    pmQtdProvisoes: TPopupMenu;
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsProvisoesStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblProvisoesNewRecord(DataSet: TDataSet);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure cbCursoExit(Sender: TObject);
    procedure cbTurmaExit(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure cbCursoChange(Sender: TObject);
    procedure cbAnoSemestreClick(Sender: TObject);
    procedure pmQtdTurmasPopup(Sender: TObject);
    procedure pmQtdProvisoesPopup(Sender: TObject);
  private
    { Private declarations }
    procedure filtrar;

    procedure atualiza_combo_curso ;
    procedure atualiza_combo_turma ;
    
  public
    { Public declarations }
  end;

var
  frm_Turmas_Provisoes: Tfrm_Turmas_Provisoes;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Turmas_Provisoes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Turmas_Provisoes.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     tblProvisoes.Delete;
  end;
end;

procedure Tfrm_Turmas_Provisoes.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_Turmas_Provisoes.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Turmas_Provisoes.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure Tfrm_Turmas_Provisoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Turmas_Provisoes.btnInserirClick(Sender: TObject);
begin

   PageControl1.ActivePageIndex := 1;
   DBEdit1.SetFocus;

   tblProvisoes.Insert;

end;

procedure Tfrm_Turmas_Provisoes.btnAlterarClick(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 1;
   DBEdit1.SetFocus;

   tblProvisoes.Edit;
end;

procedure Tfrm_Turmas_Provisoes.btnSalvarClick(Sender: TObject);
Var
   turma, curso, conta : string;
   anosemestre : integer;
begin
   turma := tblProvisoescd_turma.AsString;
   curso := tblProvisoescd_curso.AsString;
   conta := tblProvisoescd_conta_lcto.AsString;
   anosemestre := tblProvisoesnr_anosemestre.AsInteger;

   tblProvisoes.Post;
   tblProvisoes.Close;
   tblProvisoes.Open;

   tblProvisoes.Locate('nr_anosemestre;cd_turma;cd_curso;cd_conta_lcto', VarArrayOf([anosemestre, turma, curso, conta]), []);
end;

procedure Tfrm_Turmas_Provisoes.btnCancelarClick(Sender: TObject);
begin
   tblProvisoes.Cancel;
end;

procedure Tfrm_Turmas_Provisoes.dsProvisoesStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblProvisoes.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblProvisoes.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_Turmas_Provisoes.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblContas.Close;
   tblContas.Open;
   
   filtrar;
end;

procedure Tfrm_Turmas_Provisoes.tblProvisoesNewRecord(DataSet: TDataSet);
begin
   tblProvisoesnr_anosemestre.AsInteger := tblTurmasanosemestre.AsInteger;
   tblProvisoescd_turma.AsString := tblTurmascodigo.AsString;
   tblProvisoescd_curso.AsString := tblTurmascurso.AsString;

   PageControl1.ActivePageIndex := 1;
   DBEdit1.SetFocus;
end;

procedure Tfrm_Turmas_Provisoes.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   IF KEY = #13 tHEN
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;

procedure Tfrm_Turmas_Provisoes.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   IF (tblProvisoes.State in [dsInsert, dsEdit])
      and (PageControl1.ActivePageIndex = 1) 
   then
      AllowChange := False
   else
      AllowChange := True;
end;

procedure Tfrm_Turmas_Provisoes.FormCreate(Sender: TObject);
begin
   txtAnoSemestre.text := IntToStr(ano_semestre);
end;

procedure Tfrm_Turmas_Provisoes.UpDownCursosClick(Sender: TObject;
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

  atualiza_combo_curso;

  atualiza_combo_turma;

  filtrar;

end;

procedure Tfrm_Turmas_Provisoes.filtrar;
begin
   tblTurmas.Close;
   tblTurmas.SQL.Clear;

   tblTurmas.SQL.Add('select t.codigo, t.curso, c.descricao desc_curso, t.descricao desc_turma, t.anosemestre');
   tblTurmas.SQL.Add('from turmas t, cursos c ');
   tblTurmas.SQL.Add('where  t.curso = c.codigo and t.anosemestre = c.anosemestre');
   if cbAnoSemestre.Checked then
      tblTurmas.SQL.Add('and t.anosemestre = ' + txtAnoSemestre.Text );
   if cbCurso.ItemIndex > 0 then
      tblTurmas.SQL.Add('and c.codigo = ''' + cbCurso.Items[cbCurso.ItemIndex] + '''');
   if cbTurma.ItemIndex > 0 then
      tblTurmas.SQL.Add('and t.codigo = ''' + cbTurma.Items[cbTurma.ItemIndex] + '''');

   tblTurmas.SQL.Add('order by t.codigo');

   tblTurmas.Open;


   tblProvisoes.Close;
   tblProvisoes.Open;
end;

procedure Tfrm_Turmas_Provisoes.atualiza_combo_curso;
begin
   qyCombo.close;
   qyCombo.SQL.Clear;

   qyCombo.SQL.Add('SELECT DISTINCT codigo FROM cursos');

   if cbAnoSemestre.Checked then
      qyCombo.SQL.Add('WHERE anosemestre = ' + txtAnoSemestre.Text);

   qyCombo.SQL.Add('ORDER BY codigo');

   qyCombo.Open;

   cbCurso.Items.Clear;
   cbCurso.Items.Add('  ');

   while not qyCombo.Eof do
   Begin
       cbCurso.Items.Add(qyCombo.FieldByName('codigo').AsString);

       qyCombo.Next;
   End;

   qyCombo.Close;
end;

procedure Tfrm_Turmas_Provisoes.atualiza_combo_turma;
var
   op : string;
begin
   qyCombo.close;
   qyCombo.SQL.Clear;

   qyCombo.SQL.Add('SELECT DISTINCT codigo FROM turmas');

   op :=  ' WHERE ';
   
   if cbAnoSemestre.Checked then
   Begin
      qyCombo.SQL.Add(op + 'anosemestre = ' + txtAnoSemestre.Text);
      op := ' AND ';
   End;

   if cbCurso.ItemIndex > 0 then
   Begin
      qyCombo.SQL.Add(op + 'curso = ''' + cbCurso.Items[cbCurso.ItemIndex] + '''');
   End;

   qyCombo.SQL.Add('ORDER BY codigo');

   qyCombo.Open;

   cbTurma.Items.Clear;
   cbTurma.Items.Add('  ');

   while not qyCombo.Eof do
   Begin
       cbTurma.Items.Add(qyCombo.FieldByName('codigo').AsString);

       qyCombo.Next;
   End;

   qyCombo.Close;
end;


procedure Tfrm_Turmas_Provisoes.cbCursoExit(Sender: TObject);
begin
   atualiza_combo_turma;

   filtrar;
end;

procedure Tfrm_Turmas_Provisoes.cbTurmaExit(Sender: TObject);
begin
   filtrar
end;

procedure Tfrm_Turmas_Provisoes.cbTurmaChange(Sender: TObject);
begin
   filtrar;
end;

procedure Tfrm_Turmas_Provisoes.cbCursoChange(Sender: TObject);
begin
   filtrar
end;

procedure Tfrm_Turmas_Provisoes.cbAnoSemestreClick(Sender: TObject);
begin
   atualiza_combo_curso;
   atualiza_combo_turma;
   filtrar;
end;

procedure Tfrm_Turmas_Provisoes.pmQtdTurmasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblTurmas, pmQtdTurmas);

end;

procedure Tfrm_Turmas_Provisoes.pmQtdProvisoesPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblProvisoes, pmQtdProvisoes);

end;

end.

