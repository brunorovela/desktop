unit uDespesasTurmas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Variants, Menus;

type
  TEstado = (Incluindo, Alterando);

  Tfrm_Turmas_Despesas = class(TForm)
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
    tblDespesas: TUMZQuery;
    dsDespesas: TDataSource;
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
    tblContas: TUMZQuery;
    Panel1: TPanel;
    tblDespesascd_despesa: TIntegerField;
    tblDespesasnr_anosemestre: TSmallintField;
    tblDespesascd_turma: TStringField;
    tblDespesascd_curso: TStringField;
    tblDespesascd_conta_lcto: TStringField;
    tblDespesasds_historico: TStringField;
    tblDespesasvl_despesa: TFloatField;
    tblDespesasdt_despesa: TDateTimeField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    tblDespesasdescConta: TStringField;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    cbAnoSemestre: TCheckBox;
    Label10: TLabel;
    cbCurso: TComboBox;
    Label1: TLabel;
    cbTurma: TComboBox;
    qyCombo: TUMZQuery;
    pmQtdTurmas: TPopupMenu;
    pmQtdDespesas: TPopupMenu;
    tblContascd_conta: TIntegerField;
    tblContasds_conta: TStringField;
    tblContasds_observacao: TMemoField;
    tblContascd_classificacao: TStringField;
    tblContascd_apropriacao: TIntegerField;
    tblContastp_conta: TSmallintField;
    tblContastp_entrada_saida: TSmallintField;
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
    procedure dsDespesasStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblDespesasNewRecord(DataSet: TDataSet);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure tblDespesasAfterPost(DataSet: TDataSet);
    procedure tblDespesasBeforePost(DataSet: TDataSet);
    procedure cbAnoSemestreClick(Sender: TObject);
    procedure cbCursoExit(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure cbCursoChange(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure cbTurmaExit(Sender: TObject);
    procedure pmQtdTurmasPopup(Sender: TObject);
    procedure pmQtdDespesasPopup(Sender: TObject);
  private
    { Private declarations }

    estado : TEstado;

    procedure filtrar;

    procedure atualiza_combo_curso ;
    procedure atualiza_combo_turma ;
  public
    { Public declarations }
  end;

var
  frm_Turmas_Despesas: Tfrm_Turmas_Despesas;
CONST
  COD_ACAO_PADRAO = 9;

implementation

uses Main, uDM, Math, uClassMovimento;

{$R *.DFM}

procedure Tfrm_Turmas_Despesas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Turmas_Despesas.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     tblDespesas.Delete;
  end;
end;

procedure Tfrm_Turmas_Despesas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_Turmas_Despesas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Turmas_Despesas.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure Tfrm_Turmas_Despesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Turmas_Despesas.btnInserirClick(Sender: TObject);
begin

   PageControl1.ActivePageIndex := 1;
   DBEdit1.SetFocus;

   tblDespesas.Insert;

end;

procedure Tfrm_Turmas_Despesas.btnAlterarClick(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 1;
   DBEdit1.SetFocus;

   tblDespesas.Edit;
end;

procedure Tfrm_Turmas_Despesas.btnSalvarClick(Sender: TObject);
Var
   turma, curso, conta : string;
   data :  TDateTime;
   anosemestre : integer;
begin
   turma := tblDespesascd_turma.AsString;
   curso := tblDespesascd_curso.AsString;
   conta := tblDespesascd_conta_lcto.AsString;
   anosemestre := tblDespesasnr_anosemestre.AsInteger;
   data := tblDespesasdt_despesa.AsDateTime;

   tblDespesas.Post;
   tblDespesas.Close;
   tblDespesas.Open;

   tblDespesas.Locate('nr_anosemestre;cd_turma;cd_curso;cd_conta_lcto;dt_despesa', VarArrayOf([anosemestre, turma, curso, conta, data]), []);
end;

procedure Tfrm_Turmas_Despesas.btnCancelarClick(Sender: TObject);
begin
   tblDespesas.Cancel;
end;

procedure Tfrm_Turmas_Despesas.dsDespesasStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblDespesas.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblDespesas.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblDespesas.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblDespesas.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblDespesas.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblDespesas.State in [dsInsert, dsEdit]);

    if tblDespesas.State = dsInsert then
       estado := Incluindo
    else
       if tblDespesas.State = dsEdit then
          estado := Alterando;
end;

procedure Tfrm_Turmas_Despesas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblContas.Close;
   tblContas.Open;

   cbAnoSemestre.Checked := False;

   atualiza_combo_curso;
   atualiza_combo_turma;

   filtrar;
end;

procedure Tfrm_Turmas_Despesas.tblDespesasNewRecord(DataSet: TDataSet);
begin
   tblDespesasnr_anosemestre.AsInteger := tblTurmasanosemestre.AsInteger;
   tblDespesascd_turma.AsString := tblTurmascodigo.AsString;
   tblDespesascd_curso.AsString := tblTurmascurso.AsString;
   tblDespesasdt_despesa.AsString := DateTimeToStr(DM.DataAtual());

   PageControl1.ActivePageIndex := 1;
   DBEdit1.SetFocus;
end;

procedure Tfrm_Turmas_Despesas.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   IF KEY = #13 tHEN
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;

procedure Tfrm_Turmas_Despesas.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   IF (tblDespesas.State in [dsInsert, dsEdit])
      and (PageControl1.ActivePageIndex = 1) 
   then
      AllowChange := False
   else
      AllowChange := True;
end;

procedure Tfrm_Turmas_Despesas.FormCreate(Sender: TObject);
begin
   txtAnoSemestre.text := IntToStr(ano_semestre);
end;

procedure Tfrm_Turmas_Despesas.UpDownCursosClick(Sender: TObject;
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

procedure Tfrm_Turmas_Despesas.filtrar;
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

   tblDespesas.Close;
   tblDespesas.Open;
end;

procedure Tfrm_Turmas_Despesas.tblDespesasAfterPost(DataSet: TDataSet);
var
   movimento : TMovimento;
   qyApropria : TUMZQuery;
   CdMovimento : Integer;
begin
  { Lançar a Despesa no Caixa }

  { Soh vai incluir no caixa se for uma inclusão }
  if estado = Incluindo then
  Begin

      { Vai registrar na conta caixa estipulada para este departamento }
      movimento := TMovimento.Create;

      movimento.CodAcao := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
      movimento.ValorEmCheque := 0;
      movimento.ValorEmDinheiro := tblDespesasvl_despesa.AsCurrency;
      movimento.ValorMovimento := tblDespesasvl_despesa.AsCurrency;
      movimento.Historico := tblDespesasds_historico.AsString;
      movimento.DataLiberacao := Date;
      movimento.EntradaSaida := 2;
      movimento.NumeroDocumento := tblDespesascd_turma.AsString;
      movimento.NumeroDocumento := tblDespesascd_conta_lcto.AsString;
      movimento.DataMovimento := Dm.DataAtual();

      // CdMovimento := movimento.RegistrarMovimentacaoTe(DM.tblControlecd_conta_banco.AsInteger);
      movimento.RegistrarMovimentacaoTe(DM.tblControlecd_conta_banco.AsInteger);

      movimento.Free;

      // Registrar nas apropriações da Te

      // Novo Financeiro - Verificar

      Dm.CriarConsulta(qyApropria);

      qyApropria.SQL.Clear();
      qyApropria.SQL.Add(
      ' INSERT INTO                       ' +
      '    fin_apropria_te (cd_movimento_te, cd_conta, cd_centro, vl_movimento) ' +
      ' VALUES (:cd_movimento_te, :cd_conta, :cd_centro, :vl_movimento) ');

      qyApropria.ParamByName('cd_movimento_te').AsInteger := CdMovimento;
      qyApropria.ParamByName('cd_conta').AsInteger := tblContascd_conta.AsInteger;
      qyApropria.ParamByName('cd_centro').AsInteger := 0;
      qyApropria.ParamByName('vl_movimento').AsCurrency := tblDespesasvl_despesa.AsCurrency;

      qyApropria.ExecSQL(); 


  End
  else // Alteração
  Begin
      Mensagem('Você vez uma alteração no lançamento das despesas de turma. Por favor, confira o caixa deste dia!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
  End;

end;

procedure Tfrm_Turmas_Despesas.tblDespesasBeforePost(DataSet: TDataSet);
begin

  DM.DeptoCursoTurma(tblDespesasnr_anosemestre.AsInteger, tblDespesascd_turma.AsString);

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Add('select d.cd_caixa from');
  Dm.qAux1.SQL.Add('departamentos d');
  Dm.qAux1.SQL.Add('where d.codigo = :depto');
  Dm.qAux1.ParamByName('depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
  Dm.qAux1.Open;

  DM.tblControle.Close;
  DM.tblControle.ParamByName('Situacao').asString := 'A';
  Dm.tblControle.ParamByName('codcaixadepto').AsInteger := Dm.qAux1.FieldByNAme('cd_caixa').AsInteger;
  DM.tblControle.Open;

  if DM.tblControle.RecordCount = 0 then
  begin
    Mensagem( 'Não é possível lançar despesas com o caixa fechado.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;

    Abort; // Não permitir Salvar

  end;

end;

procedure Tfrm_Turmas_Despesas.atualiza_combo_curso;
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

procedure Tfrm_Turmas_Despesas.atualiza_combo_turma;
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

procedure Tfrm_Turmas_Despesas.cbAnoSemestreClick(Sender: TObject);
begin
   atualiza_combo_curso;
   atualiza_combo_turma;

   filtrar;
end;

procedure Tfrm_Turmas_Despesas.cbCursoExit(Sender: TObject);
begin
    atualiza_combo_turma;
    filtrar;
end;

procedure Tfrm_Turmas_Despesas.sbFiltrarClick(Sender: TObject);
begin
   filtrar;
end;

procedure Tfrm_Turmas_Despesas.cbCursoChange(Sender: TObject);
begin
   filtrar;
end;

procedure Tfrm_Turmas_Despesas.cbTurmaChange(Sender: TObject);
begin
   filtrar
end;

procedure Tfrm_Turmas_Despesas.cbTurmaExit(Sender: TObject);
begin
   filtrar
end;

procedure Tfrm_Turmas_Despesas.pmQtdTurmasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblTurmas, pmQtdTurmas);

end;

procedure Tfrm_Turmas_Despesas.pmQtdDespesasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDespesas, pmQtdDespesas);

end;

end.

