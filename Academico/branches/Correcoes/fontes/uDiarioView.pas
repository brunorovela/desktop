unit uDiarioView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  ExtCtrls, StdCtrls, DBCtrls, ComCtrls, uDMDiario, Grids, DBGrids, Buttons, Db, dbTables,
  Mask, FileCtrl, Shellapi, Menus, General, DBClient, Provider, UMGrid, UZDataset, MidasLib,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ImgList, ToolWin, uJustificarFaltas,
  StrUtils, ZDbcIntfs, UZDbcFuncs;

type
  TDiarioView = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    pgPrincipal: TPageControl;
    tsTurmas: TTabSheet;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    DBText5: TDBText;
    Label10: TLabel;
    DBText6: TDBText;
    tsAlunos: TTabSheet;
    DBGrid4: TDBGrid;
    Label3: TLabel;
    DBText2: TDBText;
    DBText7: TDBText;
    Label1: TLabel;
    Panel8: TPanel;
    txtAnoSemestreCursos: TMaskEdit;
    UpDownCursos: TUpDown;
    Label5: TLabel;
    lblProfessor: TLabel;
    txtProfessor: TEdit;
    btn: TSpeedButton;
    txtDisciplina: TEdit;
    SpeedButton1: TSpeedButton;
    lblDisciplina: TLabel;
    btnCurso: TSpeedButton;
    txtCurso: TEdit;
    lblCurso: TLabel;
    lblTurma: TLabel;
    btnTurmas: TSpeedButton;
    txtTurma: TEdit;
    Label8: TLabel;
    txtBimestre: TEdit;
    UpDown1: TUpDown;
    Label11: TLabel;
    DBText3: TDBText;
    pnAluno: TPanel;
    SpeedButton3: TSpeedButton;
    pmQtdTurmas: TPopupMenu;
    pmQtdAlunos: TPopupMenu;
    pmQtdNotasDigitacao: TPopupMenu;
    pmQtdNotasAvaliacoes: TPopupMenu;
    pmQtdFreqAulas: TPopupMenu;
    pmQtdFreq: TPopupMenu;
    tsDescricoes: TTabSheet;
    DBGrid5: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    pmQtdNotas_Logs: TPopupMenu;
    tsDiarioNotas: TTabSheet;
    tsDiarioFrequencias: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid6: TDBGrid;
    Panel7: TPanel;
    Bevel2: TBevel;
    DBText8: TDBText;
    Label12: TLabel;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    DBGrid7: TDBGrid;
    Panel11: TPanel;
    DBMemo3: TDBMemo;
    Panel12: TPanel;
    DBNavigator2: TDBNavigator;
    TabSheet5: TTabSheet;
    pmQtdNotas_LogsNovo: TPopupMenu;
    qryInsert: TUMZQuery;
    qyVerificaTipoDigitacao: TUMZQuery;
    UMGridNotas2: TUMGrid;
    UMGridAulas2: TUMGrid;
    Memo1: TMemo;
    qyAtualizaAtividadesDomiciliares: TUMZQuery;
    lbGrupo: TLabel;
    txtGrupo: TEdit;
    btnGrupo: TSpeedButton;
    DBText4: TDBText;
    Label4: TLabel;
    ilAcoes: TImageList;
    btLimpar: TBitBtn;
    pnTitulo: TPanel;
    tbTurmasProfessor: TToolBar;
    sbOlhoTurmasProf: TSpeedButton;
    separador1: TToolButton;
    btIniciarDiarios: TToolButton;
    separador2: TToolButton;
    btFechaTurmasProf: TToolButton;
    tbAlunos: TToolBar;
    btFechaAlunos: TToolButton;
    tbDescricoes: TToolBar;
    btFechaDescricoes: TToolButton;
    tbSalvarDescricoes: TToolButton;
    tbCancelarDescricoes: TToolButton;
    ToolButton4: TToolButton;
    lbSituacaoDescricoes: TLabel;
    tbNotas: TToolBar;
    sbSelecionarColuna: TSpeedButton;
    ToolButton1: TToolButton;
    btnAplicarAlteracoesNotas: TToolButton;
    btnCancelarNotas: TToolButton;
    ToolButton2: TToolButton;
    btnCalcularAluno: TToolButton;
    btnCalcularTurma: TToolButton;
    ToolButton3: TToolButton;
    ckbInativosNovo: TCheckBox;
    btFechaNotas: TToolButton;
    ToolButton5: TToolButton;
    tbFrequencias: TToolBar;
    btnAplicarAlteracoesFrequencias: TToolButton;
    btnCancelarFrequencias: TToolButton;
    ToolButton6: TToolButton;
    btAtualizarFreqAluno: TToolButton;
    btAtualizarFreqTurma: TToolButton;
    btAplicarPresenca: TToolButton;
    ToolButton7: TToolButton;
    CheckBox2: TCheckBox;
    btFechaFrequencias: TToolButton;
    ToolButton9: TToolButton;
    qyVerificaTipoDigitacaocd_avaliacao: TIntegerField;
    lblProva: TLabel;
    nm_prova: TLabel;
    pmJustificarFaltas: TPopupMenu;
    Justificativadefaltas1: TMenuItem;
    btnOrdernarAulas: TToolButton;
    btnObs: TToolButton;
    qryInsertDescricao: TUMZQuery;
    procedure btnObsClick(Sender: TObject);
    procedure btnOrdernarAulasClick(Sender: TObject);
    procedure UMGridAulas2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Justificativadefaltas1Click(Sender: TObject);
    procedure UMGridNotas2CellClick(Column: TColumn);
    procedure UMGridNotas2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure txtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDisciplinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtProfessorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbOlhoTurmasProfClick(Sender: TObject);
    procedure btGruposFiltrarClick(Sender: TObject);
    procedure txtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnAplicarAlteracoesFrequenciasClick(Sender: TObject);
    procedure btnCancelarFrequenciasClick(Sender: TObject);
    procedure UMGridNotas2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Memo1Change(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure sbCancelAvaClick(Sender: TObject);
    procedure sbSalvaAvaClick(Sender: TObject);
    procedure UMGridAulas2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UMGridNotas2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarNotasClick(Sender: TObject);
    procedure PageControl2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UMGridNotas2DoVerificacoesBeforeUpdates(Sender: TObject;
      var CanUpdate: Boolean);
    procedure btnAplicarAlteracoesNotasClick(Sender: TObject);
    procedure UMGridAulas2AfterUpdateColumn(Sender: TObject;
      const campo_base: string; const valor_antigo, valor_novo: Variant;
      var NotUpdateRow: Boolean);
    procedure UMGridAulas2KeyPress(Sender: TObject; var Key: Char);
    procedure UMGridAulas2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UMGridAulas2DblClick(Sender: TObject);
    procedure UMGridAulas2ColExit(Sender: TObject);
    procedure UMGridAulas2ColEnter(Sender: TObject);
    procedure UMGridAulas2CellClick(Column: TColumn);
    procedure UMGridNotas2AfterUpdateColumn(Sender: TObject;
      const campo_base: string; const valor_antigo, valor_novo: Variant;
      var NotUpdateRow: Boolean);
    procedure UMGridNotas2KeyPress(Sender: TObject; var Key: Char);
    procedure UMGridNotas2BeforeUpdateColumn(Sender: TObject;
      const campo_base: string; var valor: Variant; var NotUpdateColumn,
      NotUpdateRow: Boolean);
    procedure CheckBox2Click(Sender: TObject);
    procedure pgPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
    procedure UMGridAulasBeforeUpdateRegister(Sender: TObject;
      var Valor: string; campobase_nome, campobase_valor,
      coluna_edicao_atual: string);
    procedure ckbInativosNovoClick(Sender: TObject);
    procedure pmQtdNotas_LogsNovoPopup(Sender: TObject);
    procedure UMGridAulasDblClick(Sender: TObject);
    procedure UMGridAulasKeyPress(Sender: TObject; var Key: Char);
    procedure sbAplicarPresencaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure Troca_Frequencia2(Freq : Char);
    procedure pgPrincipalChange(Sender: TObject);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BackupFile1NeedDisk(Sender: TObject; DiskID: Word;
      var Continue: Boolean);
    procedure EmailSuccess(Sender: TObject);
    procedure EmailFailure(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure txtAnoSemestreCursosChange(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnTurmasClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAbrirWordClick(Sender: TObject);
    procedure l(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbCalcularMediaAlunoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure pmQtdTurmasPopup(Sender: TObject);
    procedure pmQtdAlunosPopup(Sender: TObject);
    procedure pmQtdNotasDigitacaoPopup(Sender: TObject);
    procedure pmQtdNotasAvaliacoesPopup(Sender: TObject);
    procedure pmQtdFreqPopup(Sender: TObject);
    procedure pmQtdFreqAulasPopup(Sender: TObject);
    procedure pmQtdNotas_LogsPopup(Sender: TObject);
    procedure btnAtualizaFrequenciaClick(Sender: TObject);
    procedure InsereAlunosDescricao();
  private
    nota_maxima       : String;
    DesabilitarFiltro : Boolean;
    iPageIndex        : Integer;
    PaginaAnterior    : Integer;
    sn_notas_calcular_medias : Integer;
    { Private declarations }
    lngProfessor : Longint;
    lngDisciplina : Longint;
    lngGrupo : Longint;
    bSalvaLog : Boolean;
    bSalvaNota : Boolean;

    arrBackupQtdAulas: TStringList;
    arrBloqueioNotas: TStringList;
    arrBloqueioAulas: TStringList;

    arrBackupParametroAvaliacaoTurmaDisc : TStringList;

    bDisciplinaUtilizaProficiencia : Boolean;

    Procedure Filtrar;

    function hasPendenciaNotas(): Boolean;
    function hasPendenciaFrequencias(): Boolean;
    function isParametroHabilitado(cd_curso, cd_turma: String; nr_anosemestre, cd_disciplina: Integer): Boolean;

    Procedure AtualizaDiarioProvas(mostra_todos : Integer);
    Procedure AtualizaDiarioFrequencias(mostra_todos : Integer);
  public
    { Public declarations }

    function trocafrequencia(fAtual : string; tecla : char; aulas : integer) : string;

    procedure BloqueioFormula(Sender: TObject);

  end;

var
  DiarioView: TDiarioView;
  Nome : String;
  var_X, var_Y : Integer;
  sn_professor_informar_motivo_media : Boolean;

implementation

uses uDM, uFSelecionarTurma, uCadAlunos, uUsuario, Main, uItemCombo, uAvaliacoesConceitos,
  uFSelecionarPessoa, uFSelecionarDisciplina, uFSelecionarCurso, uFSelecionarGrupo,
  ClassRegistros, uCamposDiarioNotas, uFreq, uFSplash, uCamposPlanilhas, uGeneral,
  uProcessando, UFObservacoes, ClassTurmas;

{$R *.DFM}

procedure TDiarioView.FormShow(Sender: TObject);
begin

   // Verifica se o usuário possui permissão
   // para visualizar o botão de ordenação de aulas

   btnOrdernarAulas.Visible :=
      DM.UsuarioLogado.TemPermissao(DM.GetUsuarioLogado.Pessoa.Codigo,
         'Academico.PermitirOrdenarAulas', npAcesso, False);

   arrBackupParametroAvaliacaoTurmaDisc := TStringList.Create();
   arrBackupParametroAvaliacaoTurmaDisc.Clear();

  { Todas em maiúsculas }
  DM.BloquearComponenteAnosemestre(DBGrid1, 'ANOSEMESTRE');
  Label5.Visible := DM.UsaAnosemestre;
  Label3.Visible := DM.UsaAnosemestre;
  DBText2.Visible := DM.UsaAnosemestre;
  txtAnoSemestreCursos.Visible := DM.UsaAnosemestre;
  UpDownCursos.Visible := DM.UsaAnosemestre;

  arrBackupQtdAulas := TStringList.Create;
  arrBackupQtdAulas.Clear;

  nota_maxima := DM.variavel_parametro('diario_online_digita_max');

  DM.TodasMaiusculas(TForm(Sender));

  txtProfessor.Text:='';

  DM.MontarPlanilha(DBGrid1, 'planilha_diario_turmas_professores');

{   if not PrincipalForm.ProcuraForm(TForm(FormRelConteudo)) Then
      Application.CreateForm(TFormRelConteudo, FormRelConteudo);
   if not PrincipalForm.ProcuraForm(TForm(FormDiarioNotas)) Then
      Application.CreateForm(TFormDiarioNotas, FormDiarioNotas);
   if not PrincipalForm.ProcuraForm(TForm(FormRelFrequencia2)) Then
      Application.CreateForm(TFormRelFrequencia2, FormRelFrequencia2);
   if not PrincipalForm.ProcuraForm(TForm(FormRelFrequencia)) Then
      Application.CreateForm(TFormRelFrequencia, FormRelFrequencia);
   txtAnoSemestreCursos.text := IntToStr(ano_semestre);
}
   pgPrincipal.ActivePageIndex := 0;

   if not DM.UsuarioLogado.TemPermissao( 1007, npAlterar, false ) then // Não autorizado para Edição
   Begin
       pnAluno.Visible := False;

   End
   Else // Autorizado para Edição
   Begin
       pnAluno.Visible := True;

   End;
   pnAluno.Visible := False;

   DMDiario.qTurmas.Close();

   Filtrar;
end;

procedure TDiarioView.Troca_Frequencia2(Freq: Char);
begin
   if ( UMGridAulas2.SelectedIndex > 1 ) and ( UMGridAulas2.SelectedIndex <> (UMGridAulas2.Columns.Count - 1) ) AND
      ( Pos( 'P', UMGridAulas2.GetValorStr( UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].FieldName ) ) = 0)  then
      try
         UMGridAulas2.SetValor(
            UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].FieldName,
            trocafrequencia(
               UMGridAulas2.GetValorStr(UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].FieldName),
               Freq,
               StrToInt( arrBackupQtdAulas.Values[ UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].FieldName ] )
            )
         );
      except on E: Exception do
      end;
end;

procedure TDiarioView.pgPrincipalChange(Sender: TObject);
Var
   nomeArquivo : String;
begin

   lblProva.Visible := False;
   nm_prova.Visible := False;

   { Quando mudar de Guias Atualiza Tabelas }
   if pgPrincipal.ActivePage = tsAlunos  Then Begin
      DmDiario.qAlunos.Close;
      DmDiario.qAlunos.Open;
   End
   Else if pgPrincipal.ActivePage = tsDescricoes  Then Begin
      if not DM.UsuarioLogado.TemPermissao( 10072, npAcesso, False ) then
      begin
         Mensagem('Você não possui permissão para acesso aos Pareceres Descritivos.', 'Atenção', MB_OK,Handle);
         pgPrincipal.ActivePageIndex := PaginaAnterior;
         Abort;
      end;

      InsereAlunosDescricao();

      DmDiario.qDescricoes.Close;
      DmDiario.qDescricoes.Open;

      if not DM.UsuarioLogado.TemPermissao( 10072, npAlterar, False ) then
      begin
         Memo1.Enabled := False;
      end;
   End
   Else if pgPrincipal.ActivePage = tsDiarioNotas then Begin
      if DMDiario.qTurmasCD_GRUPO.AsInteger > 0 then
      begin
         btnCalcularTurma.Caption := 'F8 Calcular média do grupo atual';
      end else begin
         btnCalcularTurma.Caption := 'F8 Calcular média de toda a turma';
      end;

      if not DM.UsuarioLogado.TemPermissao( 10071, npAcesso, False ) then
      begin
         Mensagem('Você não possui permissão para acesso aos Diários Notas.', 'Atenção', MB_OK,Handle);
         pgPrincipal.ActivePageIndex := PaginaAnterior;
         Abort;
      end;

      // AtualizaDiarioProvas
      AtualizaDiarioProvas(Integer(ckbInativosNovo.Checked));

      if not DM.UsuarioLogado.TemPermissao( 10071, npAlterar, False ) then
      begin
         UMGridNotas2.Options := UMGridNotas2.Options - [dgEditing];
         btnCalcularAluno.Enabled := False; // calcular média do aluno selecionado
      end;

      if not DM.UsuarioLogado.TemPermissao( 10071, npEspecial, False ) then
      begin
         btnCalcularTurma.Enabled := False;
      end;


   end
   else if pgPrincipal.ActivePage = tsDiarioFrequencias then Begin
      if DMDiario.qTurmasCD_GRUPO.AsInteger > 0 then
      begin
         btAtualizarFreqTurma.Caption := 'Atualizar frequências do grupo';
      end else begin
         btAtualizarFreqTurma.Caption := 'Atualizar frequências da turma';
      end;
      // AtualizaDiarioFrequencias

      DmDiario.qAulas.Close;
      DmDiario.qAulas.Open;

      AtualizaDiarioFrequencias(Integer(CheckBox2.Checked));

      UMGridAulas2.Tag := 0;

      if not DM.UsuarioLogado.TemPermissao( 1007, npAlterar, False ) then
      begin
         UMGridAulas2.Tag := 5;
         UMGridAulas2.Options := UMGridAulas2.Options - [dgEditing];
         btAtualizarFreqAluno.Enabled := False; // calcular a frequencia do aluno
         DBMemo3.Enabled := False;
      end;

      if not DM.UsuarioLogado.TemPermissao( 1007, npEspecial, False ) then
      begin
         btAtualizarFreqTurma.Enabled := False;
         btAplicarPresenca.Enabled := False;
      end;

   end;

end;

procedure TDiarioView.pgPrincipalChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if DmDiario.qTurmasTURMA.AsString = '' then
   begin
      Mensagem('Nenhuma turma está disponível para visualização, tente clicar em Iniciar Diários. Certifique-se também de que a turma/disciplina possua professores e um parâmetro de avaliação definidos para permitir o acesso ao diário.', 'Atenção', MB_OK,Handle);
      AllowChange := False;
      exit;
   end;

   if ( hasPendenciaNotas() ) OR ( hasPendenciaFrequencias() ) then
      AllowChange := False;

   PaginaAnterior :=  pgPrincipal.ActivePageIndex;
end;

procedure TDiarioView.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   Key := #0;
end;

procedure TDiarioView.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := 0;
end;

procedure TDiarioView.AtualizaDiarioFrequencias(mostra_todos : Integer);
var
   qyAux, qyRegistros : TUMZQuery;
   xBimestre, I, tamanho : Integer;
   EfeitosVisuais : Boolean;
begin
   EfeitosVisuais := DM.db.SQLHourGlass;
   DM.db.SQLHourGlass := False;

   arrBackupQtdAulas.Clear;

   UMGridAulas2.LimparGrid();
   UMGridAulas2.Conexao := DM.db;

   DM.CriarConsulta( qyAux );
   DM.CriarConsulta( qyRegistros );

   xBimestre := DMDiario.qTurmasBIMESTRE.AsInteger;

   // Atribui o Abono de faltas para os alunos em atividades domiciliares, utilizado através do '-'
   qyAtualizaAtividadesDomiciliares.Close;
   qyAtualizaAtividadesDomiciliares.ParamByName('nr_anosemestre').AsInteger := DMDiario.qAulasANOSEMESTRE.AsInteger;
   qyAtualizaAtividadesDomiciliares.ParamByName('cd_turma').AsString := DMDiario.qAulasTURMA.AsString;
   qyAtualizaAtividadesDomiciliares.ExecSQL;

   with qyAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add( ' SELECT da.nro_aula, DATE_FORMAT(da.data, ''%d/%m/%Y'') AS data, da.sn_bloqueado, qtd_aulas ' );
      SQL.Add( ' FROM diario_aulas da ' );
      SQL.Add( ' WHERE da.anosemestre = :ANOSEMESTRE AND da.turma = :TURMA AND ' );
      SQL.Add( ' da.bimestre = :BIMESTRE AND da.disciplina = :DISCIPLINA ' );
      SQL.Add( ' AND CASE WHEN :CD_GRUPO > 0 THEN da.cd_grupo = :CD_GRUPO ELSE 1=1 END ' );

      if (lngProfessor > 0) then      
        SQL.Add( ' AND da.cd_professor = :CD_PROFESSOR ' );

      SQL.Add( ' ORDER BY da.data, da.nro_aula ' );

      ParamByName( 'ANOSEMESTRE' ).AsInteger := DMDiario.qAulasANOSEMESTRE.AsInteger;
      ParamByName( 'TURMA' ).AsString := DMDiario.qAulasTURMA.AsString;
      ParamByName( 'BIMESTRE' ).AsInteger := xBimestre;
      ParamByName( 'DISCIPLINA' ).AsInteger := DMDiario.qAulasDISCIPLINA.AsInteger;
      ParamByName( 'CD_GRUPO' ).AsInteger := DMDiario.qTurmasCD_GRUPO.AsInteger;

      if (lngProfessor > 0) then
        ParamByName( 'CD_PROFESSOR' ).AsInteger := lngProfessor;

      Open;
      First;
      UMGridAulas2.ListaCampos.AdicionarCampo('cd_pessoa')
               .SetTitulo('Cód. Aluno').SetTipo(tcInteger).SetBloqueado(True);

      UMGridAulas2.ListaCampos.AdicionarCampo('nro_aula').SetTipo(tcInteger).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('qtd_aulas').SetTipo(tcInteger).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('nr_anosem').SetTipo(tcInteger).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('turma').SetTipo(tcString).SetTamanho(50).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('cd_disciplina').SetTipo(tcInteger).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('situacao').SetTipo(tcInteger).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('cd_bimestre').SetTipo(tcInteger).SetVisivel(False);
      UMGridAulas2.ListaCampos.AdicionarCampo('ativo_grupo').SetTipo(tcInteger).SetVisivel(False);

      UMGridAulas2.ListaCampos.AdicionarCampo('nm_pessoa')
               .SetTitulo('Nome do Aluno').SetTipo(tcString).SetTamanho(60).SetBloqueado(True);

      while not Eof do
      begin
         //seta um tamanho minimo para o campo STRING
         tamanho := FieldByName('qtd_aulas').AsInteger;
         if(tamanho = 0)then
         begin
            tamanho := 3;
         end;

         if (FieldByName('data').AsDateTime > now) then
         begin
            UMGridAulas2.ListaCampos.AdicionarCampo('coluna'+FieldByName('nro_aula').AsString)
               .SetTitulo(FieldByName('data').AsString).SetTipo(tcString).SetTamanho(tamanho).setBloqueado(True);
         end else begin
            UMGridAulas2.ListaCampos.AdicionarCampo('coluna'+FieldByName('nro_aula').AsString)
               .SetTitulo(FieldByName('data').AsString).SetTipo(tcString).SetTamanho(tamanho);
         end;

         UMGridAulas2.ListaCampos.AdicionarCampo( 'bloqueio_frequencia' + FieldByName('nro_aula').AsString )
            .SetColunaPesquisa('bloqueio_frequencia').SetCampoCondicao('nro_aula')
            .SetColunaValor('bloqueio_frequencia').SetTipo(tcInteger).SetVisivel(False);

         Next;
      end;

      UMGridAulas2.ListaCampos.AdicionarCampo('faltas')
               .SetTitulo('Faltas').SetTipo(tcFloat).SetBloqueado(True);
   end;

   with qyRegistros do
   begin
      Close;
      SQL.Clear;

      if Connection.Protocol = DB_PROTOCOL_MYSQL then
      begin
         SQL.Add( '(' );
         SQL.Add( ' SELECT CASE WHEN fi.situacao IN (3, 4, 5, 6) OR (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) = 0) THEN ');
         SQl.Add( '        CONCAT(p.nm_pessoa, " (",CASE WHEN SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0 THEN s.ds_situacao ELSE "INATIVO" END,")") ELSE p.nm_pessoa END nm_pessoa, p.cd_pessoa, p.cd_pessoa AS chave, ' );
         SQL.Add( '        fi.falta' + IntToStr( xBimestre ) + ' AS faltas, fi.turmamatricula, fi.turma, ' );
         SQL.Add( '        fi.anosemestre AS nr_anosem, fi.disciplina AS cd_disciplina, ' );
         SQL.Add( '        da.bimestre AS cd_bimestre, da.nro_aula AS ordena, ' );
         SQL.Add( '        da.nro_aula, da.nro_aula AS coluna, ');
         SQL.Add( '        CASE WHEN fi.sn_aprovado_proficiencia = 1 THEN CAST(LPAD('''', da.qtd_aulas, ''P'') AS CHAR) ELSE CAST(daa.ds_freq AS CHAR) END AS registro, ' );
         SQL.Add( '        s.cd_situacao_pai AS situacao, da.qtd_aulas, ' );
         SQL.Add( '        CASE WHEN (COALESCE(fi.dt_saida, ma.datasaida) IS NULL) OR (DATE_FORMAT(da.data, "%Y-%m-%d") <= DATE_FORMAT(COALESCE(fi.dt_saida, ma.datasaida), "%Y-%m-%d")) THEN 0 ELSE 1 END AS bloqueio, ' );
         SQL.Add( '        CASE WHEN aad.cd_atividade IS NOT NULL THEN 1 ELSE 0 END bloqueio_frequencia, ' );
         // Para verificar se o aluno está ativo no grupo OU
         // Se a aula aconteceu em um período em que o aluno estava ativo no grupo
         SQL.Add( '        CASE WHEN (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) OR (SUM(CASE WHEN da.data BETWEEN dgp.dt_entrada AND dgp.dt_saida THEN 1 ELSE 0 END) > 0) THEN 0 ELSE 1 END bloqueio_grupo, ');
         // Verifica apenas se o aluno está ativo no grupo
         SQL.Add( '        CASE WHEN (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) THEN 1 ELSE 0 END ativo_grupo ');

         SQL.Add( ' FROM fichaindividual fi ' );

         SQL.Add( '      INNER JOIN situacao s ON (fi.situacao = s.cd_situacao) ' );

         SQL.Add( '      INNER JOIN matriculas ma ON ( ' );
         SQL.Add( '         ma.codigoaluno = fi.codigoaluno ' );
         SQL.Add( '         AND ma.anosemestre = fi.anosemestre ' );
         SQL.Add( '         AND ma.turma = fi.turmamatricula ' );
         SQL.Add( '      ) ' );

         SQL.Add( '      INNER JOIN diario_aulas da ON ( ' );
         SQL.Add( '         da.anosemestre = fi.anosemestre AND ' );
         SQL.Add( '         da.turma = fi.turma AND da.disciplina = fi.disciplina ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      INNER JOIN pessoas p ON (p.cd_pessoa = fi.codigoaluno) ' );

         SQL.Add( '      INNER JOIN turmas t ON ( t.anosemestre = da.anosemestre AND t.codigo = da.turma ) ');

         SQL.Add( '      INNER JOIN grades_disciplinas gd ON ( gd.cd_disciplina = fi.disciplina AND gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade ) ');

         SQL.Add( '      INNER JOIN avaliacoes_parametros ap ON ( ap.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao ) ) ');

         // Essa ligação será ativada apenas se possuir um grupo selecionado (:CD_GRUPO > 0)
         // Caso seja ativada, a ligação pegará as pessoas do grupo
         SQL.Add( '      LEFT JOIN diario_grupos_pessoas dgp ON (:CD_GRUPO > 0 AND dgp.cd_pessoa = fi.codigoaluno AND dgp.cd_grupo = da.cd_grupo) ' );

         SQL.Add( '      LEFT JOIN diario_aulas_alunos daa ON ( ' );
         SQL.Add( '         daa.nr_anosem = da.anosemestre AND daa.cd_turma = da.turma AND ' );
         SQL.Add( '         daa.cd_pessoa = fi.codigoaluno AND daa.cd_disciplina = da.disciplina AND ' );
         SQL.Add( '         daa.cd_bimestre = da.bimestre AND daa.nr_aula = da.nro_aula ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      LEFT JOIN atd_atividades_domiciliares aad ON ( ' );
         SQL.Add( '         aad.cd_pessoa = fi.codigoaluno AND aad.nr_anosemestre = da.anosemestre AND ' );
         SQL.Add( '         aad.cd_curso = t.curso AND aad.cd_turma = da.turma AND ' );
         SQL.Add( '         da.data BETWEEN aad.dt_inicio AND aad.dt_fim ' );
         SQL.Add( '      )    ' );


         SQL.Add( ' WHERE fi.anosemestre = :ANOSEMESTRE AND fi.turma = :TURMA AND ' );
         SQL.Add( '       fi.disciplina = :DISCIPLINA AND da.bimestre = :BIMESTRE AND ' );
         SQL.Add( '       CASE WHEN :CD_GRUPO > 0 THEN DGP.CD_GRUPO = :CD_GRUPO ELSE 1=1 END ' );

         SQL.Add( ' GROUP BY fi.codigoaluno, coluna ' );

         SQL.Add( ' HAVING ((SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) AND situacao NOT IN (3,4,5,6,7,8,10)) OR :MOSTRA_TODOS = 1 ' );

         {UNION}
         SQL.Add( ') UNION (' );
         {UNION}

         SQL.Add( ' SELECT CASE WHEN fi.situacao IN (3, 4, 5, 6) OR (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) = 0) THEN ');
         SQL.Add( '        CONCAT(p.nm_pessoa, " (",CASE WHEN SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0 THEN s.ds_situacao ELSE "INATIVO" END,")") ELSE p.nm_pessoa END nm_pessoa, p.cd_pessoa, p.cd_pessoa AS chave, ' );
         SQL.Add( '        fi.falta' + IntToStr( xBimestre ) + ' AS faltas, fi.turmamatricula, fi.turma, ' );
         SQL.Add( '        fi.anosemestre AS nr_anosem, fi.disciplina AS cd_disciplina, ' );
         SQL.Add( '        da.bimestre AS cd_bimestre, 99999 AS ordena, ' );
         SQL.Add( '        da.nro_aula, ' + QuotedStr( 'faltas' ) + ' AS coluna, fi.falta' + inttostr(xBimestre) + ' AS registro, ' );
         SQL.Add( '        s.cd_situacao_pai AS situacao, 0, ' );
         SQL.Add( '        CASE WHEN (COALESCE(fi.dt_saida, ma.datasaida) IS NULL) OR (DATE_FORMAT(da.data, "%Y-%m-%d") <= DATE_FORMAT(COALESCE(fi.dt_saida, ma.datasaida), "%Y-%m-%d")) THEN 0 ELSE 1 END AS bloqueio, ' );
         SQL.Add( '        0 bloqueio_frequencia, ' );
         // Para verificar se o aluno está ativo no grupo OU
         // Se a aula aconteceu em um período em que o aluno estava ativo no grupo
         SQL.Add( '        CASE WHEN (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) OR (SUM(CASE WHEN da.data BETWEEN dgp.dt_entrada AND dgp.dt_saida THEN 1 ELSE 0 END) > 0) THEN 0 ELSE 1 END bloqueio_grupo, ');
         // Verifica apenas se o aluno está ativo no grupo
         SQL.Add( '        CASE WHEN (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) THEN 1 ELSE 0 END ativo_grupo ');

         SQL.Add( ' FROM fichaindividual fi ' );

         SQL.Add( '      INNER JOIN situacao s ON (fi.situacao = s.cd_situacao) ' );

         SQL.Add( '      INNER JOIN matriculas ma ON ( ' );
         SQL.Add( '         ma.codigoaluno = fi.codigoaluno ' );
         SQL.Add( '         AND ma.anosemestre = fi.anosemestre ' );
         SQL.Add( '         AND ma.turma = fi.turmamatricula ' );
         SQL.Add( '      ) ' );

         SQL.Add( '      INNER JOIN diario_aulas da ON ( ' );
         SQL.Add( '         da.anosemestre = fi.anosemestre AND ' );
         SQL.Add( '         da.turma = fi.turma AND da.disciplina = fi.disciplina ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      INNER JOIN pessoas p ON (p.cd_pessoa = fi.codigoaluno) ' );

         // Essa ligação será ativada apenas se possuir um grupo selecionado (:CD_GRUPO > 0)
         // Caso seja ativada, a ligação pegará as pessoas do grupo
         SQL.Add( '      LEFT JOIN diario_grupos_pessoas dgp ON (:CD_GRUPO > 0 AND dgp.cd_pessoa = fi.codigoaluno AND dgp.cd_grupo = da.cd_grupo) ' );

         SQL.Add( ' WHERE fi.anosemestre = :ANOSEMESTRE AND fi.turma = :TURMA AND ' );
         SQL.Add( '       fi.disciplina = :DISCIPLINA AND da.bimestre = :BIMESTRE AND ' );
         SQL.Add( '       CASE WHEN :CD_GRUPO > 0 THEN DGP.CD_GRUPO = :CD_GRUPO ELSE 1=1 END ' );

         SQL.Add( ' GROUP BY fi.codigoaluno, coluna ' );

         SQL.Add( ' HAVING ((SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) AND situacao NOT IN (3,4,5,6,7,8,10)) OR :MOSTRA_TODOS = 1 ' );

         SQL.Add( ')' );

         SQL.Add( 'ORDER BY nm_pessoa, chave, ordena' );

      end else if Connection.Protocol = DB_PROTOCOL_ORACLE then begin

         SQL.Add( 'SELECT CASE WHEN fi.situacao IN (3, 4, 5, 6) OR (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) = 0) THEN ');
         SQL.Add( ' p.nm_pessoa || " (" || CASE WHEN SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0 THEN s.ds_situacao ELSE "INATIVO" END || ")" ELSE p.nm_pessoa END nm_pessoa, cd_pessoa, chave, faltas, turmamatricula, ');
         SQL.Add( ' turma, nr_anosem, cd_disciplina, cd_bimestre, ordena, nro_aula, TO_CHAR(coluna) AS coluna, ');
         SQL.Add( ' TO_CHAR(registro) AS registro, situacao, qtd_aulas, ' );
         SQL.Add( ' CASE WHEN (COALESCE(fi.dt_saida, ma.datasaida) IS NULL) OR (DATE_FORMAT(da.data, "%Y-%m-%d") <= DATE_FORMAT(COALESCE(fi.dt_saida, ma.datasaida), "%Y-%m-%d")) THEN 0 ELSE 1 END AS bloqueio, bloqueio_frequencia ' );
         SQL.Add( 'FROM (' );
         SQL.Add( ' SELECT p.nm_pessoa AS nm_pessoa, p.cd_pessoa AS cd_pessoa, p.cd_pessoa AS chave, ' );
         SQL.Add( '        fi.falta' + IntToStr( xBimestre ) + ' AS faltas, fi.turmamatricula AS turmamatricula, ' );
         SQL.Add( '        fi.turma AS turma, fi.anosemestre AS nr_anosem, fi.disciplina AS cd_disciplina, ' );
         SQL.Add( '        da.bimestre AS cd_bimestre, da.nro_aula AS ordena, da.nro_aula, da.nro_aula AS coluna, TO_CHAR(daa.ds_freq) AS registro, ' );
         SQL.Add( '        fi.situacao AS situacao, da.qtd_aulas AS qtd_aulas, ' );
         SQL.Add( '        CASE WHEN aad.cd_atividade IS NOT NULL THEN 1 ELSE 0 END bloqueio_frequencia ' );
         SQL.Add( ' FROM fichaindividual fi ' );

         SQL.Add( '      INNER JOIN situacao s ON (fi.situacao = s.cd_situacao) ' );

         SQL.Add( '      INNER JOIN matriculas ma ON ( ' );
         SQL.Add( '         ma.codigoaluno = fi.codigoaluno ' );
         SQL.Add( '         AND ma.anosemestre = fi.anosemestre ' );
         SQL.Add( '         AND ma.turma = fi.turmamatricula ' );
         SQL.Add( '      ) ' );

         SQL.Add( '      INNER JOIN diario_aulas da ON ( ' );
         SQL.Add( '         da.anosemestre = fi.anosemestre AND ' );
         SQL.Add( '         da.turma = fi.turma AND da.disciplina = fi.disciplina ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      LEFT JOIN diario_aulas_alunos daa ON ( ' );
         SQL.Add( '         daa.nr_anosem = da.anosemestre AND daa.cd_turma = da.turma AND ' );
         SQL.Add( '         daa.cd_pessoa = fi.codigoaluno AND daa.cd_disciplina = da.disciplina AND ' );
         SQL.Add( '         daa.cd_bimestre = da.bimestre AND daa.nr_aula = da.nro_aula ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      LEFT JOIN atd_atividades_domiciliares aad ON ( ' );
         SQL.Add( '         aad.cd_pessoa = fi.codigoaluno AND aad.nr_anosemestre = da.anosemestre AND ' );
         SQL.Add( '         aad.cd_curso = fi.curso AND aad.cd_turma = da.turma AND ' );
         SQL.Add( '         da.data BETWEEN aad.dt_inicio AND aad.dt_fim ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      INNER JOIN pessoas p ON (p.cd_pessoa = fi.codigoaluno) ' );

         SQL.Add( ' WHERE fi.anosemestre = :ANOSEMESTRE AND fi.turma = :TURMA AND ' );
         SQL.Add( '       fi.disciplina = :DISCIPLINA AND da.bimestre = :BIMESTRE AND ' );
         SQL.Add( '       (fi.situacao NOT IN (3,4,5,6,7,8,10) OR :MOSTRA_TODOS = 1) ' );

         {UNION}
         SQL.Add( ') UNION (' );
         {UNION}

         SQL.Add( ' SELECT CASE WHEN fi.situacao IN (3, 4, 5, 6) OR (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) = 0) THEN ');
         SQL.Add( '        p.nm_pessoa || " (" || CASE WHEN SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0 THEN s.ds_situacao ELSE "INATIVO" END || ")" ELSE p.nm_pessoa END nm_pessoa, p.cd_pessoa AS cd_pessoa, p.cd_pessoa AS chave, fi.falta' + IntToStr( xBimestre ) + ' AS faltas, ' );
         SQL.Add( '        fi.turmamatricula AS turmamatricula, fi.turma AS turma, fi.anosemestre AS nr_anosem, fi.disciplina AS cd_disciplina, ' );
         SQL.Add( '        da.bimestre AS cd_bimestre, 99999 AS ordena,  ' );
         SQL.Add( '        da.nro_aula, ' + QuotedStr( 'faltas' ) + ' AS coluna, TO_CHAR(fi.falta' + inttostr(xBimestre) + ') AS registro, ' );
         SQL.Add( '        fi.situacao AS situacao, 0 AS qtd_aulas,' );
         SQL.Add( '        CASE WHEN (COALESCE(fi.dt_saida, ma.datasaida) IS NULL) OR (DATE_FORMAT(da.data, "%Y-%m-%d") <= DATE_FORMAT(COALESCE(fi.dt_saida, ma.datasaida), "%Y-%m-%d")) THEN 0 ELSE 1 END AS bloqueio, ' );
         SQL.Add( '        0 bloqueio_frequencia ' );
         SQL.Add( ' FROM fichaindividual fi ' );

         SQL.Add( '      INNER JOIN situacao s ON (fi.situacao = s.cd_situacao) ' );

         SQL.Add( '      INNER JOIN matriculas ma ON ( ' );
         SQL.Add( '         ma.codigoaluno = fi.codigoaluno ' );
         SQL.Add( '         AND ma.anosemestre = fi.anosemestre ' );
         SQL.Add( '         AND ma.turma = fi.turmamatricula ' );
         SQL.Add( '      ) ' );

         SQL.Add( '      INNER JOIN diario_aulas da ON ( ' );
         SQL.Add( '         da.anosemestre = fi.anosemestre AND ' );
         SQL.Add( '         da.turma = fi.turma AND da.disciplina = fi.disciplina ' );
         SQL.Add( '      )    ' );

         SQL.Add( '      INNER JOIN pessoas p ON (p.cd_pessoa = fi.codigoaluno) ' );

         SQL.Add( ' WHERE fi.anosemestre = :ANOSEMESTRE AND fi.turma = :TURMA AND ' );
         SQL.Add( '       fi.disciplina = :DISCIPLINA AND da.bimestre = :BIMESTRE AND ' );
         SQL.Add( '       (fi.situacao NOT IN (3,4,5,6,7,8,10) OR :MOSTRA_TODOS = 1) ' );

         SQL.Add( ')' );

         SQL.Add( 'ORDER BY nm_pessoa, chave, ordena' );
      end;

      ParamByName( 'DISCIPLINA' ).AsInteger := DMDiario.qAulasDISCIPLINA.AsInteger;
      ParamByName( 'TURMA' ).AsString := DMDiario.qAulasTURMA.AsString;
      ParamByName( 'BIMESTRE' ).AsInteger := xBimestre;
      ParamByName( 'ANOSEMESTRE' ).AsInteger := DMDiario.qAulasANOSEMESTRE.AsInteger;
      ParamByName( 'MOSTRA_TODOS' ).AsInteger := mostra_todos;
      ParamByName( 'CD_GRUPO' ).AsInteger := DMDiario.qTurmasCD_GRUPO.AsInteger;

      Open;
      First;

      arrBloqueioAulas := TStringList.Create;
      arrBloqueioAulas.Clear;

      while not Eof do
      begin
         if ( arrBackupQtdAulas.Values['coluna'+FieldByName('coluna').AsString] = '' ) then
            arrBackupQtdAulas.Values['coluna'+FieldByName('coluna').AsString] := FieldByName('qtd_aulas').AsString;

         if (FieldByName('bloqueio').AsInteger > 0) or (FieldByName('bloqueio_grupo').AsInteger > 0) then
         begin
            arrBloqueioAulas.Values[FieldByName('cd_pessoa').AsString+'_bloqueio'+FieldByName('coluna').AsString] := '1';
         end else begin
            arrBloqueioAulas.Values[FieldByName('cd_pessoa').AsString+'_bloqueio'+FieldByName('coluna').AsString] := '0';
         end;

         Next;
      end;

   end;

   UMGridAulas2.AdicionaSQLPadrao(
      ' REPLACE INTO diario_aulas_alunos( cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_aula, ds_freq ) ' +
      ' VALUES ( :cd_pessoa, :cd_turma, :nr_anosemestre, :cd_disciplina, :nr_etapa, [$condicao_valor$], [$campo_valor$] ) ',
      [ 'cd_pessoa', 'turma', 'nr_anosem', 'cd_disciplina', 'cd_bimestre' ],
      [ 'cd_pessoa', 'cd_turma', 'nr_anosemestre', 'cd_disciplina', 'nr_etapa' ]
   );

   UMGridAulas2.QueryRegistros := qyRegistros;
   UMGridAulas2.CarregarRegistros();

   for I := 0 to UMGridAulas2.Columns.Count - 1 do
      if ( Pos( 'coluna', UMGridAulas2.Columns[I].FieldName ) > 0 ) AND
         ( UMGridAulas2.Columns[I].FieldName <> 'colunafaltas' ) AND
         ( StrToIntDef( arrBackupQtdAulas.Values[UMGridAulas2.Columns[I].FieldName], 0 ) > 4 ) then
      begin
         UMGridAulas2.Columns[I].Width := StrToInt( arrBackupQtdAulas.Values[UMGridAulas2.Columns[I].FieldName] ) * 8;
      end;

   DM.db.SQLHourGlass := EfeitosVisuais;
end;

procedure TDiarioView.AtualizaDiarioProvas(mostra_todos : Integer);
Var
   qNotas, qNotaRE, qNotas2, qyAux : TUMZQuery;
   i, j, iDisciplinaFrente : Integer;
   snNumero : Boolean;
   nr_casas_decimais, casas_decimais, colunaRE : String;
   colunasUtilizadas: TStringList;
   qyAvalParametros: TUMZQuery;
   EfeitosVisuais : Boolean;
begin
   EfeitosVisuais := DM.db.SQLHourGlass;
   DM.db.SQLHourGlass := False;

   Dm.CriarConsulta(qyAvalParametros);

   qyAvalParametros.Close;
   qyAvalParametros.SQL.Text := '';
   qyAvalParametros.SQL.Add(' SELECT ap.sn_recuperacao FROM turmas t ');
   qyAvalParametros.SQL.Add(' INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE) ');
   qyAvalParametros.SQL.Add(' INNER JOIN avaliacoes_parametros ap ON ( COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = ap.cd_avaliacao ) ');
   qyAvalParametros.SQL.Add(' WHERE t.anosemestre = '+DMDiario.qTurmasANOSEMESTRE.AsString+' AND t.codigo LIKE '+QuotedStr(DMDiario.qTurmasTURMA.AsString)+' AND gd.cd_disciplina = '+DMDiario.qTurmasDISCIPLINA.AsString);

   qyAvalParametros.Open();
   qyAvalParametros.First;

   // Inserir alunos na diario_provas_alunos
   qryInsert.Close;
   qryInsert.ParamByName('turma').AsString       := DMDiario.qTurmasTURMA.AsString;
   qryInsert.ParamByName('anosem').AsString := DMDiario.qTurmasANOSEMESTRE.AsString;
   qryInsert.ParamByName('disciplina').AsInteger := DMDiario.qTurmasDISCIPLINA.AsInteger;
   qryInsert.ParamByName('bimestre').AsInteger   := DMDiario.qTurmasBIMESTRE.AsInteger;
   qryInsert.ExecSQL;

   // Retorna a disciplina frente
   iDisciplinaFrente := DM.getDisciplinaFrente(DMDiario.qTurmasDISCIPLINA.AsInteger, DMDiario.qTurmasANOSEMESTRE.AsInteger, DMDiario.qTurmasTURMA.AsString);

   // Inserir alunos na diario_provas_alunos da disciplina frente
   qryInsert.Close;
   qryInsert.ParamByName('turma').AsString       := DMDiario.qTurmasTURMA.AsString;
   qryInsert.ParamByName('anosem').AsString := DMDiario.qTurmasANOSEMESTRE.AsString;
   qryInsert.ParamByName('disciplina').AsInteger := iDisciplinaFrente;
   qryInsert.ParamByName('bimestre').AsInteger   := DMDiario.qTurmasBIMESTRE.AsInteger;
   qryInsert.ExecSQL;

   colunasUtilizadas := TStringList.Create;
   colunaRE := '';
   bSalvaLog := false;
   i := 0;
   // Atualizar a guia DiarioProvas
   DMDiario.qProvas.Close();
   DMDiario.qProvas.Open();

   bDisciplinaUtilizaProficiencia := false;

   // Verificar se encontrou uma proficiencia
   DMDiario.qProvas.First();
   while not DMDiario.qProvas.Eof do
   begin
      if DMDiario.qProvassn_proficiencia.AsInteger = 1 then
      begin
         bDisciplinaUtilizaProficiencia := true;
         break;
      end;
      DMDiario.qProvas.Next();
   end;
   DMDiario.qProvas.First();


   if(DMDiario.qProvasTURMA.AsString = '')then
   begin
      DM.db.SQLHourGlass := EfeitosVisuais;

      Mensagem('Não existem avaliações cadastradas para essa turma/disciplina, é necessário cadastrá-las para utilizar este recurso.','Atenção',MB_OK,Handle);
      pgPrincipal.ActivePageIndex := PaginaAnterior;
      Abort;
   end;

   // Fazer a leitura das notas para mostrar na grid
   Dm.CriarConsulta(qNotas);
   Dm.CriarConsulta(qNotaRE);
   Dm.CriarConsulta(qNotas2);
   Dm.CriarConsulta(qyAux);

   qyAux.Close;
   qyAux.SQL.Text := '';
   qyAux.SQL.Add(' SELECT ap.cd_avaliacao, ap.sn_conceitos_parciais sn_conceitos_parciais, ap.sn_notas sn_notas, ap.nr_casas_decimais, ap.sn_notas_calcular_medias FROM turmas t ');
   qyAux.SQL.Add(' INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE) ');
   qyAux.SQL.Add(' INNER JOIN avaliacoes_parametros ap ON ( COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = ap.cd_avaliacao ) ');
   qyAux.SQL.Add(' WHERE t.anosemestre = '+DMDiario.qProvasANOSEMESTRE.AsString+' AND t.codigo LIKE '+QuotedStr(DMDiario.qProvasTURMA.AsString)+' AND gd.cd_disciplina = '+DMDiario.qProvasDISCIPLINA.AsString);

   qyAux.Open();
   qyAux.First;

   sn_notas_calcular_medias := qyAux.FieldByName( 'sn_notas_calcular_medias' ).AsInteger;

   try
      // Fazemos essa conversão louca, somente para garantir que está digitado números
      casas_decimais := IntToStr( StrToInt( qyAux.FieldByName('nr_casas_decimais').AsString ) );
      nr_casas_decimais := casas_decimais;
      casas_decimais := StringOfChar( '0', StrToInt( casas_decimais ) );
   except
      casas_decimais := '00'; // padrão
      nr_casas_decimais := '2';
   end;

   // Neste momento temos a formatação do Float
   casas_decimais := '#0.' + casas_decimais;

   UMGridNotas2.LimparGrid();
   UMGridNotas2.Conexao := DM.db;

   qNotas.Close;
   qNotas.SQL.Text := '';
   qNotas.SQL.Add(' SELECT dp.vl_peso, dp.id_atividade_moodle, ap.sn_conceitos_parciais AS sn_conceitos_parciais, ap.sn_notas AS sn_notas, dp.sn_especial AS sn_especial, dp.nro_nota nro_nota, ');
   qNotas.SQL.Add('  IF(COALESCE(dp.nr_tipo_digitacao, 2)=0, 2, COALESCE(dp.nr_tipo_digitacao, 2)) AS nr_tipo_digitacao, ');
   qNotas.SQL.Add('    ap.sn_professor_informar_motivo_media ');
   qNotas.SQL.Add(' FROM diario_provas dp ');
   qNotas.SQL.Add(' INNER JOIN turmas t ON (dp.anosemestre = t.anosemestre AND dp.turma = t.codigo) ');
   qNotas.SQL.Add(' INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE AND dp.disciplina = gd.CD_DISCIPLINA) ');
   qNotas.SQL.Add(' INNER JOIN avaliacoes_parametros_matriz ap ON (COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = ap.cd_avaliacao) ');
   qNotas.SQL.Add(' WHERE dp.anosemestre = :ANOSEMESTRE AND dp.turma = :TURMA AND dp.disciplina = :DISCIPLINA AND dp.bimestre = :BIMESTRE AND dp.sn_especial = 0');
   qNotas.SQL.Add(' AND CASE WHEN :CD_GRUPO > 0 THEN (dp.cd_grupo = :CD_GRUPO OR dp.sn_proficiencia = 1) ELSE 1=1 END ');
   qNotas.SQL.Add(' ORDER BY dp.sn_especial, dp.nro_nota ');

   qNotas.ParamByName('ANOSEMESTRE').AsInteger := DMDiario.qProvasANOSEMESTRE.AsInteger;
   qNotas.ParamByName('TURMA').AsString        := DMDiario.qProvasTURMA.AsString;
   qNotas.ParamByName('DISCIPLINA').AsInteger  := DMDiario.qProvasDISCIPLINA.AsInteger;
   qNotas.ParamByName('BIMESTRE').AsInteger    := DMDiario.qTurmasBIMESTRE.AsInteger;
   qNotas.ParamByName('CD_GRUPO').AsInteger    := DMDiario.qTurmasCD_GRUPO.AsInteger;
   qNotas.Open();
   qNotas.First;

   sn_professor_informar_motivo_media := (qNotas.FieldByName('sn_professor_informar_motivo_media').AsInteger = 1);

   qNotaRE.Close;
   qNotaRE.SQL.Text := '';
   qNotaRE.SQL.Add(' SELECT ap.sn_conceitos_parciais sn_conceitos_parciais, ap.sn_notas sn_notas, dp.sn_especial sn_especial, dp.nro_nota nro_nota, IF(COALESCE(dp.nr_tipo_digitacao, 2)=0, 2, COALESCE(dp.nr_tipo_digitacao, 2)) nr_tipo_digitacao FROM diario_provas dp ');
   qNotaRE.SQL.Add(' INNER JOIN turmas t ON (dp.anosemestre = t.anosemestre AND dp.turma = t.codigo) ');
   qNotaRE.SQL.Add(' INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE AND dp.disciplina = gd.CD_DISCIPLINA) ');
   qNotaRE.SQL.Add(' INNER JOIN avaliacoes_parametros ap ON (COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = ap.cd_avaliacao) ');
   qNotaRE.SQL.Add(' WHERE dp.anosemestre = :ANOSEMESTRE AND dp.turma = :TURMA AND dp.disciplina = :DISCIPLINA AND dp.bimestre = :BIMESTRE AND dp.sn_especial = 1');
   qNotaRE.SQL.Add(' ORDER BY dp.sn_especial, dp.nro_nota ');

   qNotaRE.ParamByName('ANOSEMESTRE').AsInteger := DMDiario.qProvasANOSEMESTRE.AsInteger;
   qNotaRE.ParamByName('TURMA').AsString        := DMDiario.qProvasTURMA.AsString;
   qNotaRE.ParamByName('DISCIPLINA').AsInteger  := DMDiario.qProvasDISCIPLINA.AsInteger;
   qNotaRE.ParamByName('BIMESTRE').AsInteger    := DMDiario.qTurmasBIMESTRE.AsInteger;
   qNotaRE.Open();
   qNotaRE.First;


   // Construir a GRID com as NOTAS:

   snNumero := DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S';

   UMGridNotas2.ListaCampos.AdicionarCampo( 'chave' ).SetTipo(tcInteger).SetBloqueado(True).SetVisivel(False);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'indice' ).SetTipo(tcInteger).SetBloqueado(True);
   if ( snNumero ) then
   begin
      UMGridNotas2.ListaCampos.Campo['indice'].SetTitulo('Nº');
   end else begin
      UMGridNotas2.ListaCampos.Campo['indice'].SetTitulo('Cod.');
   end;

   Inc(i);

   UMGridNotas2.ListaCampos.AdicionarCampo( 'cd_pessoa' )
         .SetVisivel(False).SetTipo(tcInteger);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'turma' )
         .SetVisivel(False).SetTipo(tcString).SetTamanho(50);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'nr_anosem' )
         .SetVisivel(False).SetTipo(tcInteger);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'disciplina' )
         .SetVisivel(False).SetTipo(tcInteger);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'bimestre' )
         .SetVisivel(False).SetTipo(tcInteger);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'situacao' )
         .SetVisivel(False).SetTipo(tcInteger);
   UMGridNotas2.ListaCampos.AdicionarCampo( 'ativo_grupo' )
         .SetVisivel(False).SetTipo(tcInteger);

   UMGridNotas2.ListaCampos.AdicionarCampo( 'nm_pessoa' )
         .SetTitulo('Nome').SetBloqueado(True).SetTipo(tcString).SetTamanho(60);

   while not qNotas.Eof do
   begin
      UMGridNotas2.ListaCampos.AdicionarCampo( 'coluna' + qNotas.FieldByName('nro_nota').AsString )
            .SetCampoValor('vl_nota').SetCampoCondicao('nr_prova').SetColunaValor('registro').SetTipo(tcString).SetTamanho(10);

      UMGridNotas2.ListaCampos.AdicionarCampo( 'bloqueio_nota' + qNotas.FieldByName('nro_nota').AsString )
            .SetColunaPesquisa('bloqueio_nota').SetCampoCondicao('nr_prova')
            .SetColunaValor('bloqueio_nota').SetTipo(tcInteger).SetVisivel(False);

      if sn_notas_calcular_medias = 1 then begin
         UMGridNotas2.ListaCampos.AdicionarCampo( 'col_sn_faltou' + qNotas.FieldByName('nro_nota').AsString )
               .SetColunaPesquisa('col_sn_faltou').SetCampoValor('sn_faltou').SetCampoCondicao('nr_prova')
               .SetTitulo('F ' + qNotas.FieldByName('nro_nota').AsString).SetCampoToSQL('sn_faltou')
               .SetColunaValor('sn_faltou').SetTamanho(5).SetChaveSQL('fichaindividual_sn_faltou').SetTipo(tcString);
      end;

      Inc(i);
      UMGridNotas2.ListaCampos.Campo['coluna' + qNotas.FieldByName('nro_nota').AsString]
         .SetTitulo('N ' + qNotas.FieldByName('nro_nota').AsString);

      // Se for somente avaliações por conceitos parciais
      if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString = 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString <> 'S') ) then
      begin
         UMGridNotas2.ListaCampos.Campo['coluna' + qNotas.FieldByName('nro_nota').AsString]
            .SetTipo(tcString).SetTamanho(10).SetCampoValor('ds_conceito');

      // Se for somente avaliações por notas
      end else if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString <> 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString = 'S') ) then begin

         UMGridNotas2.ListaCampos.Campo['coluna' + qNotas.FieldByName('nro_nota').AsString]
            .SetTipo(tcFloat).SetDisplayFormatFloat(casas_decimais).SetTamanho(0);

      // Se for avaliações por notas e conceitos parciais
      end else if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString = 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString = 'S') ) then begin

         // Verifica pelo tipo de digitação da prova
         if (qNotas.FieldByName('nr_tipo_digitacao').AsInteger = 1) then
         begin
            UMGridNotas2.ListaCampos.Campo['coluna' + qNotas.FieldByName('nro_nota').AsString]
               .SetTipo(tcString).SetTamanho(10);
         end else begin
            UMGridNotas2.ListaCampos.Campo['coluna' + qNotas.FieldByName('nro_nota').AsString]
               .SetTipo(tcFloat).SetDisplayFormatFloat(casas_decimais).SetTamanho(0);
         end;

      end;

      qNotas.Next();
   end;

   SplitString(DM.variavel_parametro('diario_notas_campos'), ';', colunasUtilizadas);

   UMGridNotas2.ListaCampos.AdicionarCampo( 'nota_sa' )
      .SetTitulo('Méd. s/ Ajuste').SetTipo(tcFloat).SetBloqueado(True).SetDisplayFormatFloat('#0.000').SetTag(1);

   if colunasUtilizadas.IndexOf('nota_sa') < 0 then
      UMGridNotas2.ListaCampos.Campo[ 'nota_sa' ].SetVisivel(False)
   else
      UMGridNotas2.ListaCampos.Campo[ 'nota_sa' ].SetVisivel(True);

   UMGridNotas2.ListaCampos.AdicionarCampo( 'ajuste' + DMDiario.qTurmasBIMESTRE.AsString )
      .SetTitulo('Ajuste').SetTipo(tcFloat).SetDisplayFormatFloat(casas_decimais)
      .SetChaveSQL('fichaindividual').SetCampoValor('ajuste' + DMDiario.qTurmasBIMESTRE.AsString);

   if qyAvalParametros.FieldByName('sn_recuperacao').AsString = 'S' then
   begin
      UMGridNotas2.ListaCampos.AdicionarCampo( 'nota' + DMDiario.qTurmasBIMESTRE.AsString )
         .SetTitulo('Méd. s/ Recuperação').SetTipo(tcString).SetBloqueado(True).SetTamanho(10);
   end;

   while not qNotaRE.Eof and (qyAvalParametros.FieldByName('sn_recuperacao').AsString = 'S') do
   begin
      UMGridNotas2.ListaCampos.AdicionarCampo( 'coluna' + qNotaRE.FieldByName('nro_nota').AsString )
            .SetCampoValor('vl_nota').SetCampoCondicao('nr_prova').SetColunaValor('registro').SetTipo(tcString).SetTamanho(10);

      UMGridNotas2.ListaCampos.AdicionarCampo( 'bloqueio_nota' + qNotaRE.FieldByName('nro_nota').AsString )
            .SetColunaPesquisa('bloqueio_nota').SetCampoCondicao('nr_prova')
            .SetColunaValor('bloqueio_nota').SetTipo(tcInteger).SetVisivel(False);

      if sn_notas_calcular_medias = 1 then begin
         UMGridNotas2.ListaCampos.AdicionarCampo( 'col_sn_faltou' + qNotaRE.FieldByName('nro_nota').AsString )
               .SetColunaPesquisa('col_sn_faltou').SetCampoValor('sn_faltou').SetCampoCondicao('nr_prova')
               .SetTitulo('F ' + qNotaRE.FieldByName('nro_nota').AsString).SetCampoToSQL('sn_faltou')
               .SetColunaValor('sn_faltou').SetTamanho(5).SetChaveSQL('fichaindividual_sn_faltou').SetTipo(tcString);
      end;

      Inc(i);
      UMGridNotas2.ListaCampos.Campo['coluna' + qNotaRE.FieldByName('nro_nota').AsString].SetTitulo('RE');

      // Se for somente avaliações por conceitos parciais
      if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString = 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString <> 'S') ) then
      begin
         UMGridNotas2.ListaCampos.Campo['coluna' + qNotaRE.FieldByName('nro_nota').AsString]
            .SetTipo(tcString).SetTamanho(10).SetCampoValor('ds_conceito');

      // Se for somente avaliações por notas
      end else if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString <> 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString = 'S') ) then begin

         UMGridNotas2.ListaCampos.Campo['coluna' + qNotaRE.FieldByName('nro_nota').AsString]
            .SetTipo(tcFloat).SetDisplayFormatFloat(casas_decimais).SetTamanho(0);

      // Se for avaliações por notas e conceitos parciais
      end else if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString = 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString = 'S') ) then begin

         // Verifica pelo tipo de digitação da prova
         if (qNotaRE.FieldByName('nr_tipo_digitacao').AsInteger = 1) then
         begin
            UMGridNotas2.ListaCampos.Campo['coluna' + qNotaRE.FieldByName('nro_nota').AsString]
               .SetTipo(tcString).SetTamanho(10);
         end else begin
            UMGridNotas2.ListaCampos.Campo['coluna' + qNotaRE.FieldByName('nro_nota').AsString]
               .SetTipo(tcFloat).SetDisplayFormatFloat(casas_decimais).SetTamanho(0);
         end;

      end;

      qNotaRE.Next();
   end;

   UMGridNotas2.ListaCampos.AdicionarCampo( 'nota_d' + DMDiario.qTurmasBIMESTRE.AsString )
      .SetTitulo('Méd. Definitiva').SetTipo(tcString).SetBloqueado(True).SetTamanho(10);//.SetDisplayFormatFloat(casas_decimais);

   if not qyAux.Eof then begin

      // Se for somente avaliações por conceitos parciais
      if ( (qyAux.FieldByName( 'sn_conceitos_parciais' ).AsString = 'S') and (qyAux.FieldByName( 'sn_notas' ).AsString <> 'S') ) then begin
         if (qyAvalParametros.FieldByName('sn_recuperacao').AsString = 'S') then
         begin
            UMGridNotas2.ListaCampos.Campo[ 'nota' + DMDiario.qTurmasBIMESTRE.AsString ].SetTipo(tcString).SetTamanho(10);
         end;
         UMGridNotas2.ListaCampos.Campo[ 'nota_sa' ].SetTipo(tcString).SetTamanho(10);
         UMGridNotas2.ListaCampos.Campo[ 'nota_d' + DMDiario.qTurmasBIMESTRE.AsString ].SetTipo(tcString).SetTamanho(10);
      end;

   end;

   // Carregar os dados para a GRID
   qNotas2.Close;
   qNotas2.SQL.Clear;

   if (qNotas2.Connection.Protocol = DB_PROTOCOL_MYSQL) then
   begin
      qNotas2.SQL.Add( ' SELECT CASE WHEN (SELECT ds_valor FROM parametros WHERE ds_variavel = :PARAMETRO) = :VALOR_PARAMETRO THEN ma.nr_aluno ELSE dpa.cd_pessoa END AS indice, ' );
   end else if (qNotas2.Connection.Protocol = DB_PROTOCOL_ORACLE) then begin
      qNotas2.SQL.Add( ' SELECT CASE WHEN (SELECT TO_CHAR(ds_valor) FROM parametros WHERE ds_variavel = :PARAMETRO) = :VALOR_PARAMETRO THEN ma.nr_aluno ELSE dpa.cd_pessoa END AS indice, ' );
   end;


   if (qNotas2.Connection.Protocol = DB_PROTOCOL_MYSQL) then
   begin
      qNotas2.SQL.Add( ' dpa.cd_pessoa, CASE WHEN fi.situacao IN (3,4,5,6) OR (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) = 0) THEN ');
      qNotas2.SQL.Add( ' CONCAT(p.nm_pessoa, " (",CASE WHEN SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0 THEN s.ds_situacao ELSE "INATIVO" END,")") ');
      qNotas2.SQL.Add( ' ELSE p.nm_pessoa END nm_pessoa, dpa.nr_prova AS coluna, ');
      qNotas2.SQL.Add( ' CAST(COALESCE(ac_notas.ds_conceito, dpa.vl_nota) AS CHAR) registro, CASE WHEN dpa.sn_faltou = 1 THEN ''X'' ELSE '''' END AS sn_faltou, fi.ajuste'+DMDiario.qTurmasBIMESTRE.AsString+', ');
   end else if (qNotas2.Connection.Protocol = DB_PROTOCOL_ORACLE) then begin
      qNotas2.SQL.Add( ' dpa.cd_pessoa, CASE WHEN fi.situacao IN (3,4,5,6) OR (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) = 0) THEN ');
      qNotas2.SQL.Add( ' p.nm_pessoa || " (" || CASE WHEN SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0 THEN s.ds_situacao ELSE "INATIVO" END || ")" ');
      qNotas2.SQL.Add( ' ELSE p.nm_pessoa END nm_pessoa, dpa.nr_prova AS coluna, ');
      qNotas2.SQL.Add( ' COALESCE(ac_notas.ds_conceito, TO_CHAR(dpa.vl_nota)) AS registro, CASE WHEN dpa.sn_faltou = 1 THEN ''X'' ELSE '''' END AS sn_faltou, fi.ajuste'+DMDiario.qTurmasBIMESTRE.AsString+', ');
   end;

   if (qNotas2.Connection.Protocol = DB_PROTOCOL_MYSQL) then
   begin
      qNotas2.SQL.Add( ' CAST(COALESCE(ac_media_sa.ds_conceito, fi.nota_sa'+DMDiario.qTurmasBIMESTRE.AsString+') AS CHAR) nota_sa, ');
      qNotas2.SQL.Add( ' CASE WHEN ac_media.ds_conceito IS NOT NULL THEN ac_media.ds_conceito ');
      qNotas2.SQL.Add( '      WHEN fi.nota'+DMDiario.qTurmasBIMESTRE.AsString+' = -1 THEN ''DISP'' ');
      qNotas2.SQL.Add( '      WHEN fi.nota'+DMDiario.qTurmasBIMESTRE.AsString+' = -2 THEN ''****'' ');
      qNotas2.SQL.Add( '      ELSE CAST(FORMAT(fi.nota'+DMDiario.qTurmasBIMESTRE.AsString+', '+nr_casas_decimais+') AS CHAR) END nota'+DMDiario.qTurmasBIMESTRE.AsString+', ');

      qNotas2.SQL.Add( ' CASE WHEN ac_media_def.ds_conceito IS NOT NULL THEN ac_media_def.ds_conceito ');
      qNotas2.SQL.Add( '      WHEN fi.nota_d'+DMDiario.qTurmasBIMESTRE.AsString+' = -1 THEN ''DISP'' ');
      qNotas2.SQL.Add( '      WHEN fi.nota_d'+DMDiario.qTurmasBIMESTRE.AsString+' = -2 THEN ''****'' ');
      qNotas2.SQL.Add( '      ELSE CAST(FORMAT(fi.nota_d'+DMDiario.qTurmasBIMESTRE.AsString+', '+nr_casas_decimais+') AS CHAR) END nota_d'+DMDiario.qTurmasBIMESTRE.AsString+', ');
   end else if (qNotas2.Connection.Protocol = DB_PROTOCOL_ORACLE) then begin
      qNotas2.SQL.Add( ' COALESCE(ac_media_sa.ds_conceito, TO_CHAR(fi.nota_sa'+DMDiario.qTurmasBIMESTRE.AsString+')) nota_sa, ');
      qNotas2.SQL.Add( ' COALESCE(ac_media.ds_conceito, TO_CHAR(fi.nota'+DMDiario.qTurmasBIMESTRE.AsString+')) nota'+DMDiario.qTurmasBIMESTRE.AsString+', COALESCE(ac_media_def.ds_conceito, TO_CHAR(FORMAT(fi.nota_d'+DMDiario.qTurmasBIMESTRE.AsString+', '+nr_casas_decimais+'))) nota_d'+DMDiario.qTurmasBIMESTRE.AsString+', ');
   end;

   qNotas2.SQL.Add( ' dpa.cd_pessoa as chave, dpa.nr_anosem, dpa.cd_disciplina AS disciplina, dpa.cd_turma AS turma, dpa.cd_bimestre AS bimestre, ' );
   qNotas2.SQL.Add( ' fi.situacao AS situacao, CASE WHEN (COALESCE(fi.dt_saida, ma.datasaida) IS NULL) OR (DATE_FORMAT(dp.data, "%Y-%m-%d") <= DATE_FORMAT(COALESCE(fi.dt_saida, ma.datasaida), "%Y-%m-%d")) THEN 0 ELSE 1 END AS bloqueio, ' );
   qNotas2.SQL.Add( ' dpa.sn_bloqueado bloqueio_nota, ' );

   // Para verificar se o aluno está ativo no grupo OU
   // Se a prova aconteceu em um período em que o aluno estava ativo no grupo
   qNotas2.SQL.Add( ' CASE WHEN (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) OR (SUM(CASE WHEN dp.data BETWEEN dgp.dt_entrada AND dgp.dt_saida THEN 1 ELSE 0 END) > 0) THEN 0 ELSE 1 END bloqueio_grupo, ');
   // Verifica apenas se o aluno está ativo no grupo
   qNotas2.SQL.Add( ' CASE WHEN (SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) THEN 1 ELSE 0 END ativo_grupo ');

   qNotas2.SQL.Add( ' FROM diario_provas_alunos dpa ' );
   qNotas2.SQL.Add( ' INNER JOIN diario_provas dp ON (dp.turma = dpa.cd_turma AND dp.anosemestre = dpa.nr_anosem AND dp.disciplina = dpa.cd_disciplina AND dp.bimestre = dpa.cd_bimestre AND dp.nro_nota = dpa.nr_prova) ' );
   qNotas2.SQL.Add( ' INNER JOIN pessoas p ON (p.cd_pessoa = dpa.cd_pessoa) ' );
   qNotas2.SQL.Add( ' INNER JOIN fichaindividual fi ON (fi.codigoaluno = dpa.cd_pessoa AND fi.turma = dpa.cd_turma AND fi.anosemestre = dpa.nr_anosem AND fi.disciplina = dpa.cd_disciplina) ' );
   qNotas2.SQL.Add( ' INNER JOIN situacao s ON (fi.situacao = s.cd_situacao) ' );
   qNotas2.SQL.Add( ' INNER JOIN matriculas ma ON (ma.codigoaluno = fi.codigoaluno AND ma.anosemestre = fi.anosemestre AND ma.turma = fi.turmamatricula)' );

   // Essa ligação será ativada apenas se possuir um grupo selecionado (:CD_GRUPO > 0)
   // Caso seja ativada, a ligação pegará as pessoas do grupo, existe tratamento para RE (Recuperação) e PS (Suficiência),
   //   pois são provas não vinculadas ao grupo (uma para disciplina apenas)
   qNotas2.SQL.Add( ' LEFT JOIN diario_grupos_pessoas dgp ON (:CD_GRUPO > 0 AND dgp.cd_pessoa = dpa.cd_pessoa AND (dgp.cd_grupo = dp.cd_grupo OR dp.sn_especial = 1 OR dp.sn_proficiencia = 1)) ' );

   qNotas2.SQL.Add( ' LEFT JOIN turmas t ON (t.codigo = fi.turma AND t.anosemestre = fi.anosemestre) ' );
   qNotas2.SQL.Add( ' LEFT JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE AND dpa.cd_disciplina = gd.CD_DISCIPLINA) ');
   qNotas2.SQL.Add( ' LEFT JOIN avaliacoes_parametros ap ON (ap.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) ' );
   qNotas2.SQL.Add( ' LEFT JOIN avaliacoes_conceitos ac_notas ON (((ap.sn_conceitos_parciais = ''S'' AND ap.sn_notas = ''S'' AND COALESCE(dp.nr_tipo_digitacao,2) = 1) OR (ap.sn_conceitos_parciais = ''S'' AND ap.sn_notas = ''N'')) ');
   qNotas2.SQL.Add( ' AND ap.cd_avaliacao = ac_notas.cd_avaliacao AND ac_notas.nr_inicial <= dpa.vl_nota AND ac_notas.nr_final >= dpa.vl_nota)' );
   qNotas2.SQL.Add( ' LEFT JOIN avaliacoes_conceitos ac_media ON (ap.sn_conceitos_parciais = ''S'' AND ap.sn_notas = ''N'' AND ap.cd_avaliacao = ac_media.cd_avaliacao AND ac_media.nr_inicial <= fi.nota'+DMDiario.qTurmasBIMESTRE.AsString+' AND ac_media.nr_final >= fi.nota'+DMDiario.qTurmasBIMESTRE.AsString+')' );
   qNotas2.SQL.Add( ' LEFT JOIN avaliacoes_conceitos ac_media_sa ON (ap.sn_conceitos_parciais = ''S'' AND ap.sn_notas = ''N'' AND ap.cd_avaliacao = ac_media_sa.cd_avaliacao AND ac_media_sa.nr_inicial <= fi.nota_sa'+DMDiario.qTurmasBIMESTRE.AsString+' AND ac_media_sa.nr_final >= fi.nota_sa'+DMDiario.qTurmasBIMESTRE.AsString+')' );
   qNotas2.SQL.Add( ' LEFT JOIN avaliacoes_conceitos ac_media_def ON (ap.sn_conceitos_parciais = ''S'' AND ap.sn_notas = ''N'' AND ap.cd_avaliacao = ac_media_def.cd_avaliacao AND ac_media_def.nr_inicial <= fi.nota_d'+DMDiario.qTurmasBIMESTRE.AsString+' AND ac_media_def.nr_final >= fi.nota_d'+DMDiario.qTurmasBIMESTRE.AsString+')' );
   qNotas2.SQL.Add( ' WHERE dpa.cd_turma = :TURMA AND dpa.nr_anosem = :ANOSEMESTRE AND dpa.cd_disciplina = :DISCIPLINA AND dpa.cd_bimestre = :BIMESTRE ' );
   qNotas2.SQL.Add( ' AND CASE WHEN :CD_GRUPO > 0 THEN DGP.CD_GRUPO = :CD_GRUPO ELSE 1=1 END ' );
   qNotas2.SQL.Add( ' GROUP BY dpa.cd_pessoa, coluna ' );
   qNotas2.SQL.Add( ' HAVING ((SUM(CASE WHEN dgp.dt_saida IS NULL THEN 1 ELSE 0 END) > 0) AND fi.situacao NOT IN (3,4,5,6,7,8,10)) OR :MOSTRAR_TODOS = 1 ' );
   if (snNumero) then
      qNotas2.SQL.Add( ' ORDER BY ma.nr_aluno, p.nm_pessoa, p.cd_pessoa ' )
   else
      qNotas2.SQL.Add( ' ORDER BY p.nm_pessoa, p.cd_pessoa ' );

   qNotas2.ParamByName('PARAMETRO').AsString        := 'matriculas_apresentar_nro_aluno';
   qNotas2.ParamByName('VALOR_PARAMETRO').AsString  := 'S';
   qNotas2.ParamByName('ANOSEMESTRE').AsInteger     := DMDiario.qProvasANOSEMESTRE.AsInteger;
   qNotas2.ParamByName('TURMA').AsString            := DmDiario.qProvasTURMA.AsString;
   qNotas2.ParamByName('DISCIPLINA').AsInteger      := DMDiario.qProvasDISCIPLINA.AsInteger;
   qNotas2.ParamByName('BIMESTRE').AsInteger        := DMDiario.qTurmasBIMESTRE.AsInteger;
   qNotas2.ParamByName('CD_GRUPO').AsInteger        := DMDiario.qTurmasCD_GRUPO.AsInteger;
   qNotas2.ParamByName('MOSTRAR_TODOS').AsInteger   := mostra_todos;
   qNotas2.Open;

   qNotas2.First;

   arrBloqueioNotas := TStringList.Create;
   arrBloqueioNotas.Clear;

   while not qNotas2.Eof do
   begin
      // Se houver bloqueio de nota por parte de saída da disciplina ou saída do grupo (bloqueia a digitação da nota da prova)
      if (qNotas2.FieldByName('bloqueio').AsInteger > 0) or (qNotas2.FieldByName('bloqueio_grupo').AsInteger > 0) then
      begin
         arrBloqueioNotas.Values[qNotas2.FieldByName('cd_pessoa').AsString+'_bloqueio'+qNotas2.FieldByName('coluna').AsString] := '1';
      end else begin
         arrBloqueioNotas.Values[qNotas2.FieldByName('cd_pessoa').AsString+'_bloqueio'+qNotas2.FieldByName('coluna').AsString] := '0';
      end;

      qNotas2.Next;
   end;

   UMGridNotas2.AdicionaSQLPadrao(
      ' UPDATE diario_provas_alunos dpa ' +
      '        INNER JOIN diario_provas dp ON ( ' +
      '        dp.turma = dpa.cd_turma AND ' +
      '        dp.anosemestre = dpa.nr_anosem AND ' +
      '        dp.disciplina = dpa.cd_disciplina AND ' +
      '        dp.bimestre = dpa.cd_bimestre AND ' +
      '        dp.nro_nota = dpa.nr_prova ' +
      '        ) ' +

      ' SET dpa.vl_nota = ' +
      '        CASE IF(COALESCE(dp.nr_tipo_digitacao, 2)=0, 2, COALESCE(dp.nr_tipo_digitacao, 2)) ' +
      '           WHEN 2 THEN CASE WHEN ''[$campo_valor$]'' = '''' THEN NULL ELSE [$campo_valor$] END ' +
      '           WHEN 1 THEN (SELECT nr_final FROM avaliacoes_conceitos WHERE cd_avaliacao = '+qyAux.FieldByName('cd_avaliacao').AsString+' AND ds_conceito = [$campo_valor$]) ' +
      '           ELSE NULL ' +
      '        END ' +

      ' WHERE cd_pessoa = :cd_pessoa AND cd_turma = :cd_turma AND ' +
      '       nr_anosem = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND ' +
      '       cd_bimestre = :nr_etapa [$condicao$] ',
      [ 'cd_pessoa', 'turma', 'nr_anosem', 'disciplina', 'bimestre' ],
      [ 'cd_pessoa', 'cd_turma', 'nr_anosemestre', 'cd_disciplina', 'nr_etapa' ]
   );

   UMGridNotas2.AdicionaSQLAdicional(
      'fichaindividual',
      ' UPDATE fichaindividual SET [$valor$] ' +
      ' WHERE codigoaluno = :cd_pessoa AND turma = :cd_turma AND ' +
      '       anosemestre = :nr_anosemestre AND disciplina = :cd_disciplina ' +
      '       [$condicao$] ',
      [ 'cd_pessoa', 'turma', 'nr_anosem', 'disciplina' ],
      [ 'cd_pessoa', 'cd_turma', 'nr_anosemestre', 'cd_disciplina' ]
   );

   UMGridNotas2.AdicionaSQLAdicional(
      'fichaindividual_sn_faltou',
      ' UPDATE diario_provas_alunos SET sn_faltou = (CASE WHEN :valor_sn_faltou = ''X'' THEN 1 ELSE 0 END) ' +
      ' WHERE cd_pessoa = :cd_pessoa AND cd_turma = :cd_turma AND ' +
      '       nr_anosem = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND ' +
      '       cd_bimestre = :nr_etapa [$condicao$] ',
      [ 'cd_pessoa', 'turma', 'nr_anosem', 'disciplina', 'bimestre' ],
      [ 'cd_pessoa', 'cd_turma', 'nr_anosemestre', 'cd_disciplina', 'nr_etapa' ]
   );

   UMGridNotas2.QueryRegistros := qNotas2;
   UMGridNotas2.CarregarRegistros();

   DM.db.SQLHourGlass := EfeitosVisuais;
end;

procedure TDiarioView.BackupFile1NeedDisk(Sender: TObject; DiskID: Word;
  var Continue: Boolean);
begin
  if DiskID > 1 Then
  Begin
     Mensagem('Não foi possível exportar o diário.' + #13 +
             'Verifique se você possui um disquete vazio na unidade (A:) e tente novamente.');
     Application.Terminate;
     Continue := False;
  End;
end;

procedure TDiarioView.EmailSuccess(Sender: TObject);
begin
   Mensagem('E-Mail enviado com sucesso para: ' +  #13 + Nome ) ;
end;

procedure TDiarioView.EmailFailure(Sender: TObject);
begin
   Mensagem('Ocorreu um erro ao enviar o E-Mail.');
end;

procedure TDiarioView.UMGridAulas2AfterUpdateColumn(Sender: TObject;
  const campo_base: string; const valor_antigo, valor_novo: Variant;
  var NotUpdateRow: Boolean);
var
   nro_aula, logDesc, vl_novo: String;
begin
   if not ( Pos( 'coluna', campo_base ) > 0 ) then
      Exit;

   nro_aula := StringReplace( campo_base, 'coluna', '', [rfReplaceAll, rfIgnoreCase] );

   if UMGridAulas2.IsNull( valor_novo ) OR ( trim(valor_novo) = '' ) then
      vl_novo := ''
   else
      vl_novo := valor_novo;


   if ( valor_novo <> valor_antigo ) then
   begin
      TRecFreq.CalcularFrequenciaAluno(
         UMGridAulas2.GetValorInt('nr_anosem'),
         UMGridAulas2.GetValorInt('cd_bimestre'),
         UMGridAulas2.GetValorStr('turma'),
         UMGridAulas2.GetValorInt('cd_pessoa'),
         UMGridAulas2.GetValorInt('cd_disciplina')
      );

      logDesc := '';
      logDesc := logDesc + 'Aluno: '+UMGridAulas2.GetValorStr('cd_pessoa')+', ';
      logDesc := logDesc + 'Aula: '+UMGridAulas2.GetValorStr('nro_aula')+', ';
      logDesc := logDesc + 'Frequência: '+vl_novo+', ';
      logDesc := logDesc + 'Anosemestre: '+UMGridAulas2.GetValorStr('nr_anosem')+', ';
      logDesc := logDesc + 'Turma: '+UMGridAulas2.GetValorStr('turma')+', ';
      logDesc := logDesc + 'Disciplina: '+UMGridAulas2.GetValorStr('cd_disciplina')+', ';
      logDesc := logDesc + 'Etapa: '+UMGridAulas2.GetValorStr('cd_bimestre')+' [Acadêmico]';

      { Insere log de alteração de frequencias }
      DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_FREQUENCIA, logDesc, DMDiario.qTurmas.FieldByName('PROFESSOR').AsInteger);
   end;
end;

procedure TDiarioView.UMGridAulas2CellClick(Column: TColumn);
begin
   UMGridAulas2.Columns.Items[Column.Index].Title.Font.Color := clRed;
   UMGridAulas2.Refresh;
end;

procedure TDiarioView.UMGridAulas2ColEnter(Sender: TObject);
begin
   UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].Title.Font.Color := clRed;
end;

procedure TDiarioView.UMGridAulas2ColExit(Sender: TObject);
begin
   UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].Title.Font.Color := clBlack;
end;

procedure TDiarioView.UMGridAulas2DblClick(Sender: TObject);
var
   nome_coluna, nro_aula, cd_pessoa: String;
   situacaoAluno, ativoGrupo: Integer;
begin
   if UMGridAulas2.Tag = 5 then Exit;

   nome_coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].FieldName;

   situacaoAluno := UMGridAulas2.cdsRegistros.FieldByName('situacao').AsInteger;
   ativoGrupo := UMGridAulas2.cdsRegistros.FieldByName('ativo_grupo').AsInteger;
   cd_pessoa := UMGridAulas2.cdsRegistros.FieldByName('cd_pessoa').AsString;

   if Pos('coluna', nome_coluna) > 0 then
   begin
      nro_aula := ReplaceStr(nome_coluna, 'coluna', '');

      if ((situacaoAluno in [3, 4, 5, 6]) or (ativoGrupo = 0)) and
         (arrBloqueioAulas.Values[cd_pessoa+'_bloqueio'+nro_aula] = '1') then
      begin
         Abort;
      end;

      // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
      if (UMGridAulas2.cdsRegistros.FieldByName('bloqueio_frequencia'+nro_aula).AsInteger = 1) then
      begin
         Abort();
      end;
   end;

   Troca_Frequencia2(' ');
end;

procedure TDiarioView.UMGridAulas2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   nome_coluna, nro_aula: String;
begin

   if (UMGridAulas2.GetValorInt('situacao') in [3,4,5,6,7,8]) or
      (UMGridAulas2.GetValorInt('ativo_grupo') = 0) Then  // condição
   Begin
     UMGridAulas2.Canvas.Font.Color:= clGrayText; // coloque aqui a cor desejada
   End;

   // Pinta somente as colunas de código e nome da pessoa
   if (Column.DisplayName = 'cd_pessoa') or (Column.DisplayName = 'nm_pessoa') then
   begin

      // Caso situação do aluno for 3 - Cancelada, 4 - Trancada, 5 - Desistencia ou 6 - Abandono
      // Define a cor de escrita como vermelho
      if (UMGridAulas2.cdsRegistros.FieldByName('situacao').AsInteger in [3, 4, 5, 6]) or
         (UMGridAulas2.cdsRegistros.FieldByName('ativo_grupo').AsInteger = 0) then
      begin
         UMGridAulas2.Canvas.Font.Color := clRed;
         UMGridAulas2.Canvas.FillRect(Rect);
         UMGridAulas2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

   end;

   nome_coluna := Column.FieldName;

   if Pos('coluna', nome_coluna) > 0 then
   begin
      nro_aula := ReplaceStr(nome_coluna, 'coluna', '');

      // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
      if (UMGridAulas2.cdsRegistros.FieldByName('bloqueio_frequencia'+nro_aula).AsInteger = 1) then
      begin
         UMGridAulas2.Canvas.Brush.Color := $00E7E8E5;
         UMGridAulas2.Canvas.Font.Color:= clBlack;
         UMGridAulas2.Canvas.FillRect(Rect);
         UMGridAulas2.DefaultDrawColumnCell(Rect,DataCol,Column,state);
      end;
   end;

end;

procedure TDiarioView.UMGridAulas2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   nome_coluna, nro_aula: String;
begin
   case Key of
      VK_DELETE, VK_BACK: begin
         nome_coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].FieldName;

         if Pos('coluna', nome_coluna) > 0 then
         begin
            nro_aula := ReplaceStr(nome_coluna, 'coluna', '');

            // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
            if (UMGridAulas2.cdsRegistros.FieldByName('bloqueio_frequencia'+nro_aula).AsInteger = 1) then
            begin
               Abort();
            end;

         end;

         if not ( TUMGrid(Sender).cdsRegistros.State IN [dsInsert, dsEdit] ) then
            TUMGrid(Sender).cdsRegistros.Edit();

         TUMGrid(Sender).cdsRegistros.FieldByName(nome_coluna).Clear();
      end;
      VK_INSERT: Abort();
   end;
end;

procedure TDiarioView.UMGridAulas2KeyPress(Sender: TObject; var Key: Char);
var
   nome_coluna, nro_aula, cd_pessoa: String;
   situacaoAluno, ativoGrupo: Integer;
begin
   nome_coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].FieldName;

   situacaoAluno := UMGridAulas2.cdsRegistros.FieldByName('situacao').AsInteger;
   ativoGrupo := UMGridAulas2.cdsRegistros.FieldByName('ativo_grupo').AsInteger;
   cd_pessoa := UMGridAulas2.cdsRegistros.FieldByName('cd_pessoa').AsString;

   if Pos('coluna', nome_coluna) > 0 then
   begin
      nro_aula := ReplaceStr(nome_coluna, 'coluna', '');

      if ((situacaoAluno in [3, 4, 5, 6]) or (ativoGrupo = 0)) and
         (arrBloqueioAulas.Values[cd_pessoa+'_bloqueio'+nro_aula] = '1') then
      begin
         Abort;
      end;

      // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
      if (UMGridAulas2.cdsRegistros.FieldByName('bloqueio_frequencia'+nro_aula).AsInteger = 1) then
      begin
         Abort();
      end;
   end;

   //troca o hifen por -
   if key = '-' then
      Key := '-';


   case key of
      ' ' : Troca_Frequencia2(' ');
      'c', 'f', 'C', 'F', '-' : Troca_Frequencia2(key);
   End;
end;

procedure TDiarioView.UMGridAulas2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  c: TGridCoord;
  p: TPoint;
begin
   if Button = mbRight then
   begin
      c := DBGrid1.MouseCoord (X, Y);

      // Clicou em uma coluna ou linha
      if (c.X = 0) or (c.Y = 0) then Exit;

      if Pos('coluna', UMGridAulas2.SelectedField.FieldName) > 0 then
      begin
         p := UMGridAulas2.ClientToScreen(Point (X, Y));
         pmJustificarFaltas.Popup(p.X, p.Y)
      end;
   end;
end;

procedure TDiarioView.UMGridAulasBeforeUpdateRegister(Sender: TObject; var Valor: string;
   campobase_nome, campobase_valor, coluna_edicao_atual: string);
var
   nr_aula, logDesc : string;
   qyAux : TUMZQuery;
begin

  { Verificar se houve alterações de FREQUENCIA }
  if (campobase_nome = 'nr_aula') then
  begin

     DM.qAux1.Close;
     Dm.qAux1.SQL.Clear;
     DM.qAux1.SQL.Add('SELECT daa.* ');
     DM.qAux1.SQL.Add('FROM diario_aulas_alunos daa ');
     DM.qAux1.SQL.Add('INNER JOIN diario_aulas da ON (da.anosemestre = daa.nr_anosem AND da.turma = daa.cd_turma AND ');
     DM.qAux1.SQL.Add('    da.disciplina = daa.cd_disciplina AND da.bimestre = daa.cd_bimestre AND da.nro_aula = daa.nr_aula  )');
     DM.qAux1.SQL.Add('WHERE daa.cd_pessoa = :CODALUNO AND daa.nr_anosem = :ANOSEMESTRE AND ');
     DM.qAux1.SQL.Add('      daa.cd_turma = :TURMA AND daa.cd_disciplina = :DISCIPLINA AND daa.cd_bimestre = :BIMESTRE ');
     DM.qAux1.SQL.Add('      AND ' + campobase_nome + ' = ' + campobase_valor);

     DM.qAux1.ParamByName('CODALUNO').AsInteger := UMGridAulas2.GetValorInt('cd_pessoa');
     DM.qAux1.ParamByName('ANOSEMESTRE').AsInteger := UMGridAulas2.GetValorInt('nr_anosem');
     DM.qAux1.ParamByName('TURMA').AsString := UMGridAulas2.GetValorStr('turma');
     DM.qAux1.ParamByName('DISCIPLINA').AsInteger := UMGridAulas2.GetValorInt('cd_disciplina');
     DM.qAux1.ParamByName('BIMESTRE').AsInteger := UMGridAulas2.GetValorInt('cd_bimestre');

     Dm.qAux1.Open;

     { Gravar o Logo do Tipo 4 - Visualização do Diario }
     DM.qAux1.First;
     while not DM.qAux1.Eof do
     begin
        nr_aula := 'coluna' + DM.qAux1.FieldByName( 'nr_aula' ).AsString;

        if DM.qAux1.FieldByName( 'ds_freq' ).AsString <> UMGridAulas2.GetValorStr(nr_aula) then
         begin

             // Inserir log de alteração de frequencias
             logDesc := '';
             logDesc := logDesc + 'Aluno: '+UMGridAulas2.GetValorStr('cd_pessoa')+', ';
             logDesc := logDesc + 'Aula: '+DM.qAux1.FieldByName( 'nr_aula' ).AsString+', ';
             logDesc := logDesc + 'Frequência: '+UMGridAulas2.GetValorStr(nr_aula)+', ';
             logDesc := logDesc + 'Anosemestre: '+UMGridAulas2.GetValorStr('nr_anosem')+', ';
             logDesc := logDesc + 'Turma: '+UMGridAulas2.GetValorStr('turma')+', ';
             logDesc := logDesc + 'Disciplina: '+UMGridAulas2.GetValorStr('cd_dsiciplina')+', ';
             logDesc := logDesc + 'Etapa: '+UMGridAulas2.GetValorStr('cd_bimestre')+' [Acadêmico]';

             { Insere log de alteração de frequencias }
             DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_FREQUENCIA, logDesc, DMDiario.qTurmas.FieldByName('PROFESSOR').AsInteger);

         end;
         DM.qAux1.Next;
     end;
  end;

end;

procedure TDiarioView.UMGridAulasDblClick(Sender: TObject);
begin
   Troca_Frequencia2(' ');
end;

procedure TDiarioView.UMGridAulasKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
     ' ' : Troca_Frequencia2(' ');
     'c', 'f', 'C', 'F', '-' : Troca_Frequencia2(key);
  End;
end;

procedure TDiarioView.UMGridNotas2AfterUpdateColumn(Sender: TObject;
  const campo_base: string; const valor_antigo, valor_novo: Variant;
  var NotUpdateRow: Boolean);
var
   strAltera, nro_nota, chaves, logDesc, vl_antigo, vl_novo, sn_faltou, avl_param_frente_media: String;
   iDisciplinaFrente, iDisciplina, iCdTipoAvaliacao, i: Integer;
   rSomaTotalNotas, rSomaNotas, rNota: TNota;
   arrDisciplinasFazemFrente: TStringList;
   notaMaxima, notaMinima: Double;
begin
   if ( Pos('coluna', campo_base) > 0 ) then
   begin

      nro_nota := StringReplace( campo_base, 'coluna', '', [rfReplaceAll, rfIgnoreCase] );

      case UMGridNotas2.ListaCampos.Campo[ campo_base ].Tipo of
         ftFloat: begin
            if UMGridNotas2.IsNull(valor_antigo) OR (trim(valor_antigo) = '') then
               vl_antigo := ''
            else
               vl_antigo := FloatToStrF(StrToFloat(valor_antigo), ffFixed, 5, 2 );

            if UMGridNotas2.IsNull(valor_novo) OR (trim(valor_novo) = '') then
               vl_novo := ''
            else
               vl_novo := FloatToStrF(StrToFloat(valor_novo), ffFixed, 5, 2 );
         end;
         else begin
            if UMGridNotas2.IsNull(valor_antigo) OR (trim(valor_antigo) = '') then
               vl_antigo := ''
            else
               vl_antigo := valor_antigo;

            if UMGridNotas2.IsNull(valor_novo) OR (trim(valor_novo) = '') then
               vl_novo := ''
            else
               vl_novo := valor_novo;
         end;
      end;

      if (sn_notas_calcular_medias = 1) and (UMGridNotas2.GetValorStr( 'col_sn_faltou' + nro_nota) = 'X') then
      begin
         sn_faltou := 'S';
      end else begin
         sn_faltou := 'N';
      end;

      if ( trim(vl_antigo) = '' ) then
         vl_antigo := QuotedStr(' ');
      if ( trim(vl_novo) = '' ) then
         vl_novo := QuotedStr(' ');


      strAltera := 'alterada a Nota' + nro_nota + ' de ' + vl_antigo +
                   ' para ' + vl_novo;

      chaves := UMGridNotas2.GetValorStr( 'cd_pessoa' ) + ';' +
                UMGridNotas2.GetValorStr( 'turma' ) + ';' +
                UMGridNotas2.GetValorStr( 'nr_anosem' ) + ';' +
                UMGridNotas2.GetValorStr( 'disciplina' ) + ';' +
                UMGridNotas2.GetValorStr( 'bimestre' ) + ';';

       DM.gerar_log(4, strAltera, DM.iCdPessoaLogado, chaves);

       // Inserir log de alteração de nota
       logDesc := '';
       logDesc := logDesc + 'Aluno: '+UMGridNotas2.GetValorStr( 'cd_pessoa' )+', ';
       logDesc := logDesc + 'Prova: '+nro_nota+', ';
       logDesc := logDesc + 'Nota de: '+vl_antigo+', ';
       logDesc := logDesc + 'Nota para: '+vl_novo+', ';
       logDesc := logDesc + 'Faltou: '+sn_faltou+', ';
       logDesc := logDesc + 'Anosemestre: '+UMGridNotas2.GetValorStr( 'nr_anosem' )+', ';
       logDesc := logDesc + 'Turma: '+UMGridNotas2.GetValorStr( 'turma' )+', ';
       logDesc := logDesc + 'Disciplina: '+UMGridNotas2.GetValorStr( 'disciplina' )+', ';
       logDesc := logDesc + 'Etapa: '+UMGridNotas2.GetValorStr( 'bimestre' )+' [Acadêmico]';

       { Insere log de alteração de notas }
       DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_NOTA, logDesc, DMDiario.qTurmas.FieldByName('PROFESSOR').AsInteger);

   end else if (Pos('ajuste'+DMDiario.qTurmasBIMESTRE.AsString, campo_base) > 0) then
   begin
      strAltera := '';
      chaves := '';

      if UMGridNotas2.IsNull(valor_antigo) OR (trim(valor_antigo) = '')  then
         vl_antigo := ''
      else
         vl_antigo := FloatToStrF(StrToFloat(valor_antigo), ffFixed, 5, 2 );

      if UMGridNotas2.IsNull(valor_novo) OR (trim(valor_novo) = '') then
         vl_novo := ''
      else
         vl_novo := FloatToStrF(StrToFloat(valor_novo), ffFixed, 5, 2 );

      if ( trim(vl_antigo) = '' ) then
         vl_antigo := QuotedStr(' ');
      if ( trim(vl_novo) = '' ) then
         vl_novo := QuotedStr(' ');


      strAltera := 'alterado o ' + campo_base + ' de ' + vl_antigo +
      ' para ' + vl_novo;

      chaves := UMGridNotas2.GetValorStr( 'cd_pessoa' ) + ';' +
                UMGridNotas2.GetValorStr( 'turma' ) + ';' +
                UMGridNotas2.GetValorStr( 'nr_anosem' ) + ';' +
                UMGridNotas2.GetValorStr( 'disciplina' ) + ';' +
                UMGridNotas2.GetValorStr( 'bimestre' ) + ';';

      DM.gerar_log(4, strAltera, DM.iCdPessoaLogado, chaves);
   end;

   // Busca a disciplina frente da disciplina que o usuário está modificando as notas
   iDisciplinaFrente := DM.getDisciplinaFrente(
      UMGridNotas2.GetValorInt( 'disciplina' ),
      UMGridNotas2.GetValorInt( 'nr_anosem' ),
      UMGridNotas2.GetValorStr( 'turma' )
   );

   // Se é uma disciplina frente
   if iDisciplinaFrente > 0 then begin

      // Busca se o parâmetro é do que copia todas avaliações para a mãe ou é por tipo de avl
      avl_param_frente_media := UpperCase(ClasseTurmas.GetParametroAvaliacao(
         UMGridNotas2.GetValorInt( 'nr_anosem' ),
         UMGridNotas2.GetValorStr( 'turma' ),
         UMGridNotas2.GetValorStr( 'disciplina' ),
         'sn_disc_frente_media'
      ));

      if avl_param_frente_media = '0' then
      begin
         // Busca o codigo do tipo de avaliação utilizada nessa prova que está alterando a nota
         iCdTipoAvaliacao := DM.getTipoAvaliacao(
            UMGridNotas2.GetValorInt( 'nr_anosem' ),
            UMGridNotas2.GetValorStr( 'turma' ),
            UMGridNotas2.GetValorInt( 'disciplina' ),
            UMGridNotas2.GetValorInt( 'bimestre' ),
            StrToInt(nro_nota)
         );

         // Busca as disciplinas que fazem frente
         arrDisciplinasFazemFrente := DM.getDisciplinasFazemFrente(UMGridNotas2.GetValorInt( 'nr_anosem' ), UMGridNotas2.GetValorStr( 'turma' ), iDisciplinaFrente);

         // Varre as disciplinas que fazem frente buscando as notas de mesmo tipo de prova que está sendo editado
         rSomaTotalNotas.vl_nota := 0;
         rSomaTotalNotas.IsNull := True;
         for i := 0 to arrDisciplinasFazemFrente.Count - 1 do
         begin
            iDisciplina := StrToInt(arrDisciplinasFazemFrente.Strings[i]);

            rSomaNotas := DM.getSomaNotasProvasMesmoTipo(
                              UMGridNotas2.GetValorInt( 'nr_anosem' ),
                              UMGridNotas2.GetValorStr( 'turma' ),
                              iDisciplina,
                              UMGridNotas2.GetValorInt( 'bimestre' ),
                              iCdTipoAvaliacao,
                              UMGridNotas2.GetValorInt( 'cd_pessoa' )
                           );

            if not rSomaNotas.IsNull then
            begin
               rSomaTotalNotas.vl_nota := rSomaTotalNotas.vl_nota + rSomaNotas.vl_nota;
               rSomaTotalNotas.IsNull := False;
            end;
         end;

         // Verifica se a nota da disciplina pai está nos limites de mínima e máxima
         notaMaxima := StrToFloat(DM.variavel_parametro('diario_online_digita_max'));
         notaMinima := StrToFloat(DM.variavel_parametro('diario_online_digita_min'));

         if rSomaTotalNotas.vl_nota > notaMaxima then
            rSomaTotalNotas.vl_nota := notaMaxima;

         if rSomaTotalNotas.vl_nota < notaMinima then
            rSomaTotalNotas.vl_nota := notaMinima;

         // Retorna alguns dados da prova da disciplina frente
         DM.gerarLogAlteracaoNota(
            UMGridNotas2.GetValorInt( 'nr_anosem' ),
            UMGridNotas2.GetValorStr( 'turma' ),
            iDisciplinaFrente,
            UMGridNotas2.GetValorInt( 'bimestre' ),
            iCdTipoAvaliacao,
            UMGridNotas2.GetValorInt( 'cd_pessoa' ),
            rSomaTotalNotas
         );

         // Atribui a soma das notas das provas de mesmo tipo das disciplinas que fazem frente para a prova da disciplina frente
         DM.atribuiNotaProvaDisciplinaFrente(
            UMGridNotas2.GetValorInt( 'nr_anosem' ),
            UMGridNotas2.GetValorStr( 'turma' ),
            iDisciplinaFrente,
            UMGridNotas2.GetValorInt( 'bimestre' ),
            iCdTipoAvaliacao,
            UMGridNotas2.GetValorInt( 'cd_pessoa' ),
            rSomaTotalNotas
         );

      end else begin
          if avl_param_frente_media <> '2' then
          begin
             // Atribui a nota da prova com o mesmo cd_prova_origem
             DM.atribuiNotaProvaDisciplinaFrenteOrigem(
                UMGridNotas2.GetValorInt( 'nr_anosem' ),
                UMGridNotas2.GetValorStr( 'turma' ),
                UMGridNotas2.GetValorInt( 'disciplina' ),
                UMGridNotas2.GetValorInt( 'bimestre' ),
                StrToInt(nro_nota),
                UMGridNotas2.GetValorInt( 'cd_pessoa' )
             );
          end;
      end;
   end;

   if (Pos('coluna', campo_base) > 0) or (Pos('ajuste'+DMDiario.qTurmasBIMESTRE.AsString, campo_base) > 0) then
   begin
      if DM.CalcularMediaAutomaticamente(
               UMGridNotas2.GetValorInt( 'nr_anosem' ),
               UMGridNotas2.GetValorStr( 'turma' ),
               UMGridNotas2.GetValorInt( 'disciplina' ),
               UMGridNotas2.GetValorInt( 'bimestre' ),
               DMDiario.qTurmasCD_GRUPO.AsInteger,
               UMGridNotas2.GetValorInt( 'cd_pessoa' )
         ) AND ( UMGridNotas2.Tag = 0 ) then
      begin
       UMGridNotas2.Tag := 1;
      end;
   end;
end;

procedure TDiarioView.UMGridNotas2BeforeUpdateColumn(Sender: TObject;
  const campo_base: string; var valor: Variant; var NotUpdateColumn,
  NotUpdateRow: Boolean);
var
   qyAux: TUMZQuery;
   nro_nota: Integer;
begin
   DM.CriarConsulta(qyAux);

   if not ( Pos('coluna', campo_base) > 0 ) then
      Exit;

   try
      nro_nota := StrToInt( StringReplace( campo_base, 'coluna', '', [rfReplaceAll, rfIgnoreCase] ) );
   except
      on Exception : EConvertError do
         ShowMessage( 'Falha ao converter valores.' );
   end;

   if not (UMGridNotas2.IsNull(valor)) AND ( trim(valor) <> '' ) then
   begin
      with qyAux do
      begin
         Close;
         SQL.Clear;

         SQL.Add( ' SELECT COUNT(*) as registros FROM diario_provas_alunos WHERE ' );
         SQL.Add( ' cd_pessoa = :cd_pessoa AND cd_turma = :cd_turma AND ' );
         SQL.Add( ' nr_anosem = :nr_anosem AND cd_disciplina = :cd_disciplina AND ' );
         SQL.Add( ' cd_bimestre = :cd_bimestre AND nr_prova = :nr_prova ');

         ParamByName('cd_pessoa').AsInteger := UMGridNotas2.GetValorInt( 'cd_pessoa' );
         ParamByName('cd_turma').AsString := UMGridNotas2.GetValorStr( 'turma' );
         ParamByName('nr_anosem').AsInteger := UMGridNotas2.GetValorInt( 'nr_anosem' );
         ParamByName('cd_disciplina').AsInteger := UMGridNotas2.GetValorInt( 'disciplina' );
         ParamByName('cd_bimestre').AsInteger := UMGridNotas2.GetValorInt( 'bimestre' );
         ParamByName('nr_prova').AsInteger := nro_nota;
         Open;

         if FieldByName('registros').AsInteger = 0 then
         begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO diario_provas_alunos ( cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_prova, vl_nota )');
            SQL.Add('VALUES(:cd_pessoa, :cd_turma, :nr_anosem, :cd_disciplina, :cd_bimestre, :nr_prova, NULL)');
            ParamByName('cd_pessoa').AsInteger := UMGridNotas2.GetValorInt( 'cd_pessoa' );
            ParamByName('cd_turma').AsString := UMGridNotas2.GetValorStr( 'turma' );
            ParamByName('nr_anosem').AsInteger := UMGridNotas2.GetValorInt( 'nr_anosem' );
            ParamByName('cd_disciplina').AsInteger := UMGridNotas2.GetValorInt( 'disciplina' );
            ParamByName('cd_bimestre').AsInteger := UMGridNotas2.GetValorInt( 'bimestre' );
            ParamByName('nr_prova').AsInteger := nro_nota;
            ExecSQL;
         end;
      end;
   end;
end;

procedure TDiarioView.UMGridNotas2CellClick(Column: TColumn);
var
   qNotas: TUMZQuery;
   nome_prova: String;
   xBimestre: Integer;
   nro_nota: Integer;
begin

   lblProva.Visible := False;
   nm_prova.Visible := False;

   if pos('coluna', Column.FieldName) <> 0 then
   begin

      nro_nota := StrToInt(StringReplace(Column.FieldName, 'coluna', '', []));

      Dm.CriarConsulta(qNotas);

      qNotas.Close;
      qNotas.SQL.Text := '';
      qNotas.SQL.Add(' SELECT dp.assunto ');
      qNotas.SQL.Add(' FROM diario_provas dp ');
      qNotas.SQL.Add(' INNER JOIN turmas t ON (dp.anosemestre = t.anosemestre AND dp.turma = t.codigo) ');
      qNotas.SQL.Add(' INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE AND dp.disciplina = gd.CD_DISCIPLINA) ');
      qNotas.SQL.Add(' INNER JOIN avaliacoes_parametros_matriz ap ON (COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = ap.cd_avaliacao) ');
      qNotas.SQL.Add(' WHERE dp.anosemestre = :ANOSEMESTRE AND dp.turma = :TURMA AND dp.disciplina = :DISCIPLINA AND dp.bimestre = :BIMESTRE AND dp.sn_especial = 0');
      qNotas.SQL.Add(' AND dp.nro_nota = :NRO_NOTA AND CASE WHEN :CD_GRUPO > 0 THEN (dp.cd_grupo = :CD_GRUPO OR dp.sn_proficiencia = 1) ELSE 1=1 END ');
      qNotas.SQL.Add(' ORDER BY dp.sn_especial, dp.nro_nota ');

      qNotas.ParamByName('ANOSEMESTRE').AsInteger := DMDiario.qProvasANOSEMESTRE.AsInteger;
      qNotas.ParamByName('TURMA').AsString        := DMDiario.qProvasTURMA.AsString;
      qNotas.ParamByName('DISCIPLINA').AsInteger  := DMDiario.qProvasDISCIPLINA.AsInteger;
      qNotas.ParamByName('BIMESTRE').AsInteger    := DMDiario.qTurmasBIMESTRE.AsInteger;
      qNotas.ParamByName('CD_GRUPO').AsInteger    := DMDiario.qTurmasCD_GRUPO.AsInteger;
      qNotas.ParamByName('NRO_NOTA').AsInteger    := nro_nota;
      qNotas.Open;
      qNotas.First;

      lblProva.Visible := True;
      nm_prova.Visible := True;
      nm_prova.Caption := qNotas.FieldByName('assunto').AsString;


   end;

end;

procedure TDiarioView.UMGridNotas2DoVerificacoesBeforeUpdates(Sender: TObject;
  var CanUpdate: Boolean);
var
   I, nro_nota, qtd_alunos: Integer;
   campo_base, msg_geral, msg, chave_nota_min_max: String;
   qyAvalParametros: TUMZQuery;
begin
   msg_geral := '';
   qtd_alunos := 0;

   Dm.CriarConsulta(qyAvalParametros);

   qyAvalParametros.Close;
   qyAvalParametros.SQL.Text := '';
   qyAvalParametros.SQL.Add(' SELECT ap.vl_ajuste_min, ap.vl_ajuste_max FROM turmas t ');
   qyAvalParametros.SQL.Add(' INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE) ');
   qyAvalParametros.SQL.Add(' INNER JOIN avaliacoes_parametros ap ON ( COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = ap.cd_avaliacao ) ');
   qyAvalParametros.SQL.Add(' WHERE t.anosemestre = '+DMDiario.qProvasANOSEMESTRE.AsString+' AND t.codigo LIKE '+QuotedStr(DMDiario.qProvasTURMA.AsString)+' AND gd.cd_disciplina = '+DMDiario.qProvasDISCIPLINA.AsString);

   qyAvalParametros.Open();
   qyAvalParametros.First;

   TUMGrid(Sender).cdsRegistros.First();

   while not TUMGrid(Sender).cdsRegistros.Eof do
   begin
      msg := '';
      for I := 0 to TUMGrid(Sender).ListaCampos.Count - 1 do
      begin
         campo_base := TUMGrid(Sender).ListaCampos.CampoByIndex[I].Campo;

         if not ( TUMGrid(Sender).ListaCampos.Campo[ campo_base ].Visivel ) OR
            ( TUMGrid(Sender).ListaCampos.Campo[ campo_base ].Bloqueado ) OR
            TUMGrid(Sender).cdsRegistros.FieldByName( campo_base ).IsNull OR
            ( TUMGrid(Sender).cdsRegistros.FieldByName( campo_base ).AsString = '' ) OR
            ( TUMGrid(Sender).ListaCampos.Campo[ campo_base ].Tipo <> ftFloat ) then
            Continue;

         if ( TUMGrid(Sender).cdsRegistros.FieldByName( campo_base ).AsFloat > StrToFloat( nota_maxima ) ) then
         begin
            if ( trim(msg) = '' ) then msg := '   - ' + TUMGrid(Sender).cdsRegistros.FieldByName( 'nm_pessoa' ).AsString;
            { Nota acima do definido pela Instituição }
            msg := msg + Chr(13) + '                  ' + TUMGrid(Sender).ListaCampos.Campo[ campo_base ].Titulo +
                   ', a nota ultrapassou o limite da instituição: ' + nota_maxima + ';';
         end;

         if Pos('ajuste', campo_base) > 0 then
         begin

            if (TUMGrid(Sender).cdsRegistros.FieldByName( campo_base ).AsFloat < qyAvalParametros.FieldByName('vl_ajuste_min').AsFloat) or
               (TUMGrid(Sender).cdsRegistros.FieldByName( campo_base ).AsFloat > qyAvalParametros.FieldByName('vl_ajuste_max').AsFloat) then
            begin
               if ( trim(msg) = '' ) then msg := '   - ' + TUMGrid(Sender).cdsRegistros.FieldByName( 'nm_pessoa' ).AsString;
               { Ajuste não está entre mínimo e máximo }
               msg := msg + Chr(13) + '                  ' + TUMGrid(Sender).ListaCampos.Campo[ campo_base ].Titulo +
                      ', o ajuste deve estar entre ' +
                      qyAvalParametros.FieldByName('vl_ajuste_min').AsString + ' e ' +
                      qyAvalParametros.FieldByName('vl_ajuste_max').AsString + ';';
            end;

         end;

         if ( Pos('coluna', campo_base) > 0 ) then
         begin
            nro_nota := StrToInt( StringReplace( campo_base, 'coluna', '', [rfReplaceAll, rfIgnoreCase] ) );

            if ( Pos('coluna', campo_base) > 0 ) AND not (DMDiario.verificaValorNota(
               TUMGrid(Sender).GetValorInt( 'nr_anosem' ), UMGridNotas2.GetValorStr( 'turma' ),
               TUMGrid(Sender).GetValorInt( 'disciplina' ), UMGridNotas2.GetValorInt( 'bimestre' ),
               TUMGrid(Sender).cdsRegistros.FieldByName( campo_base ).AsFloat, nro_nota, False
            )) then
            begin
               if ( trim(msg) = '' ) then msg := '   - ' + TUMGrid(Sender).cdsRegistros.FieldByName( 'nm_pessoa' ).AsString;
               { Nota não está entre a nota mínima e máxima }
               chave_nota_min_max := TUMGrid(Sender).GetValorStr( 'nr_anosem' )+'_'+
                                     UMGridNotas2.GetValorStr( 'turma' )+'_'+
                                     TUMGrid(Sender).GetValorStr( 'disciplina' )+'_'+
                                     UMGridNotas2.GetValorStr( 'bimestre' )+'_'+
                                     IntToStr(nro_nota);
               msg := msg + Chr(13) + '                  ' + TUMGrid(Sender).ListaCampos.Campo[ campo_base ].Titulo +
                      ', a nota deve estar entre ' +
                      DMDiario.arrNotasMinima.Values[chave_nota_min_max] + ' e ' +
                      DMDiario.arrNotasMaxima.Values[ chave_nota_min_max ] + ';';
            end;
         end;
      end;

      if ( trim(msg) <> '' ) AND ( qtd_alunos <= 3 ) then
      begin
         if ( qtd_alunos = 3 ) then
            msg_geral := msg_geral + Chr(13) + '...'
         else
            msg_geral := msg_geral + Chr(13) + msg + Chr(13);

         Inc(qtd_alunos);
      end;

      TUMGrid(Sender).cdsRegistros.Next();
   end;

   if ( trim(msg_geral) <> '' ) then
   begin
      Mensagem( msg_geral, Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      CanUpdate := False;
   end;
end;

procedure TDiarioView.UMGridNotas2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   nro_prova_coluna, nome_coluna: string;
begin

   // Pinta somente as colunas de código e nome da pessoa
   if (Column.DisplayName = 'indice') or (Column.DisplayName = 'nm_pessoa') then
   begin

      // Caso situação do aluno for 3 - Cancelada, 4 - Trancada, 5 - Desistencia ou 6 - Abandono
      // Ou aluno nao esta ativo no grupo
      // Define a cor de escrita como vermelho
      if (UMGridNotas2.cdsRegistros.FieldByName('situacao').AsInteger in [3, 4, 5, 6]) or
         (UMGridNotas2.cdsRegistros.FieldByName('ativo_grupo').AsInteger = 0) then
      begin
         UMGridNotas2.Canvas.Font.Color := clRed;
         UMGridNotas2.Canvas.FillRect(Rect);
         UMGridNotas2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

   end;

   nome_coluna := Column.FieldName;

   if (Pos('coluna', nome_coluna) > 0 ) or (Pos('col_sn_faltou', nome_coluna) > 0) then
   begin
      nro_prova_coluna := ReplaceStr(ReplaceStr(nome_coluna, 'coluna', ''), 'col_sn_faltou', '');

      // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
      if (UMGridNotas2.cdsRegistros.FieldByName('bloqueio_nota'+nro_prova_coluna).AsInteger = 1) then
      begin
         UMGridNotas2.Canvas.Brush.Color := $00E7E8E5;
         UMGridNotas2.Canvas.FillRect(Rect);
         UMGridNotas2.DefaultDrawColumnCell(Rect,DataCol,Column,state);
      end;

   end;

end;

procedure TDiarioView.UMGridNotas2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   nome_coluna : String;
   nome_prox_coluna : String;
begin
   if NOT( dgEditing in UMGridNotas2.Options ) then Abort;

   case Key of
      VK_DELETE, VK_BACK: begin
         nome_coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].FieldName;
         if not ( TUMGrid(Sender).cdsRegistros.State IN [dsInsert, dsEdit] ) then
            TUMGrid(Sender).cdsRegistros.Edit();

         TUMGrid(Sender).cdsRegistros.FieldByName(nome_coluna).Clear();
      end;
      VK_INSERT: Abort();
   end;

   case Key of VK_RETURN: begin
         TUMGrid(Sender).cdsRegistros.Next;
      end;
   end;

   nome_prox_coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].FieldName;

   // Correção de um bug que criava uma linha a mais na grid
   if (KEY in [VK_TAB]) and
   ( UMGridNotas2.DataSource.DataSet.RecNo = UMGridNotas2.DataSource.DataSet.RecordCount ) and
   ( nome_prox_coluna = 'nota_d1')  then
      abort;

end;

procedure TDiarioView.UMGridNotas2KeyPress(Sender: TObject; var Key: Char);
const
   teclas = ['0'..'9', ',', '.', 'A'..'Z', #8];
var
   coluna : TField;
   nome_coluna, chave_conceito, cd_pessoa: String;
   nro_prova_coluna, situacaoAluno, ativoGrupo: Integer;
   cd_avaliacao : Integer;
begin
   // Se caso a tecla for ENTER aborta a procedure de key press
   if ( Key = #13 ) OR
      NOT( dgEditing in UMGridNotas2.Options ) OR ( Key = #09 ) then abort;

   coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].Field;
   nome_coluna := TUMGrid(Sender).Columns.Items[TUMGrid(Sender).SelectedIndex].FieldName;

   situacaoAluno := UMGridNotas2.cdsRegistros.FieldByName('situacao').AsInteger;
   ativoGrupo := UMGridNotas2.cdsRegistros.FieldByName('ativo_grupo').AsInteger;
   cd_pessoa := UMGridNotas2.cdsRegistros.FieldByName('cd_pessoa').AsString;

   if ( Key IN ['a'..'z'] ) then
      Key := UpCase(Key);

   if Pos('coluna', nome_coluna) > 0 then
   begin
      nro_prova_coluna := StrToInt(ReplaceStr(nome_coluna, 'coluna', ''));

      if ((situacaoAluno in [3, 4, 5, 6])  or (ativoGrupo = 0)) and
         (arrBloqueioNotas.Values[cd_pessoa+'_bloqueio'+IntToStr(nro_prova_coluna)] = '1') then
      begin
         Abort;
      end;

      // Se faltou, não deixa alterar a nota
      if ( (sn_notas_calcular_medias = 1) and (UMGridNotas2.GetValorStr( 'col_sn_faltou' + IntToStr(nro_prova_coluna) ) = 'X') ) then
         Abort();

      // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
      if (UMGridNotas2.cdsRegistros.FieldByName('bloqueio_nota'+IntToStr(nro_prova_coluna)).AsInteger = 1) then
      begin
         Abort();
      end;

      chave_conceito := DMDiario.qProvasANOSEMESTRE.AsString+'_'+
                        DMDiario.qProvasTURMA.AsString+'_'+
                        DMDiario.qProvasDISCIPLINA.AsString+'_'+
                        DMDiario.qTurmasBIMESTRE.AsString;

      if ( arrBackupParametroAvaliacaoTurmaDisc.IndexOf( chave_conceito ) = -1 ) then
      begin
         qyVerificaTipoDigitacao.Close;

         qyVerificaTipoDigitacao.ParamByName('turma').AsString := DMDiario.qProvasTURMA.AsString;
         qyVerificaTipoDigitacao.ParamByName('anosemestre').AsString := DMDiario.qProvasANOSEMESTRE.AsString;
         qyVerificaTipoDigitacao.ParamByName('disciplina').AsString := DMDiario.qProvasDISCIPLINA.AsString;
         qyVerificaTipoDigitacao.ParamByName('bimestre').AsString := DMDiario.qTurmasBIMESTRE.AsString;
         qyVerificaTipoDigitacao.ParamByName('nro_nota').AsString := IntToStr(nro_prova_coluna);

         qyVerificaTipoDigitacao.Open;

         if qyVerificaTipoDigitacao.RecordCount = 1 then
         begin
            arrBackupParametroAvaliacaoTurmaDisc.AddObject(chave_conceito, TItemCombo.Create(qyVerificaTipoDigitacaocd_avaliacao.AsString, ''));
         end;
      end;

      if (arrBackupParametroAvaliacaoTurmaDisc.IndexOf(chave_conceito) = -1) OR
         (UMGridNotas2.ListaCampos.Campo[nome_coluna].Tipo = ftFloat) then
      begin
         if ( not (Key in teclas) ) then
         begin
            abort;
         end;
      end else begin
         cd_avaliacao := StrToIntDef(TItemCombo(
            arrBackupParametroAvaliacaoTurmaDisc.Objects[arrBackupParametroAvaliacaoTurmaDisc.IndexOf(chave_conceito)]
         ).codigo, 0);

         TAvaliacoesConceitos.GetInstancia().AbrirCampoConceito(cd_avaliacao, UMGridNotas2, coluna, Key);
         Abort();
      end;

   end
   else if Pos('col_sn_faltou', nome_coluna) > 0 then
   begin
      nro_prova_coluna := StrToInt(ReplaceStr(nome_coluna, 'col_sn_faltou', ''));

      if ((situacaoAluno in [3, 4, 5, 6])  or (ativoGrupo = 0)) and
         (arrBloqueioNotas.Values[cd_pessoa+'_bloqueio'+IntToStr(nro_prova_coluna)] = '1') then
      begin
         Abort;
      end;

      // Se a digitação de nota desse estudante estiver bloqueada não permite digitar
      if (UMGridNotas2.cdsRegistros.FieldByName('bloqueio_nota'+IntToStr(nro_prova_coluna)).AsInteger = 1) then
      begin
         Abort();
      end;

      if UpCase(Key) IN ['X'] then
      begin
         // Caso o usuário esteja setando o campo faltou muda a nota dele para 0
         nro_prova_coluna := StrToInt(ReplaceStr(nome_coluna, 'col_sn_faltou', ''));
         UMGridNotas2.SetValor('coluna' + IntToStr( nro_prova_coluna ), null);
      end else begin
         abort;
      end;

   end
   else if ((situacaoAluno in [3, 4, 5, 6]) or (ativoGrupo = 0)) then
   begin
      Abort;
   end;
end;

procedure TDiarioView.UMGridNotas2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if TAvaliacoesConceitos.GetInstancia().ConceitoEmEdicao then
   begin
      ckbInativosNovo.SetFocus();
      UMGridNotas2.SetFocus();
   end;
end;

procedure TDiarioView.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if(txtAnoSemestreCursos.Text = '')then
  begin
     exit;
  end;
  if Button = btNext then
  begin
     txtAnoSemestreCursos.text := DM.incrementar_ano_semestre(txtAnoSemestreCursos.Text);
  end
  else
  begin
     txtAnoSemestreCursos.text := DM.decrementar_ano_semestre(txtAnoSemestreCursos.Text);
  end;

  Filtrar

end;

function TDiarioView.hasPendenciaFrequencias: Boolean;
var
   retorno: Integer;
begin
   Result := False;
   if ( pgPrincipal.ActivePage = tsDiarioFrequencias ) AND ( UMGridAulas2.hasAlteracao() ) then
   begin
      retorno := Mensagem('Houve alteração de frequências, deseja aplicar as alterações?', Application.Title, MB_YESNOCANCEL + MB_ICONQUESTION, Handle);

      try
         if retorno = mrYes then
         begin
            btnAplicarAlteracoesFrequenciasClick(nil);
            Result := False;
         end else if retorno = mrNo then
         begin
            btnCancelarFrequenciasClick(nil);
            Result := False;
         end else begin
            Result := True;
         end;
      except
         //
      end;
   end;
end;

function TDiarioView.hasPendenciaNotas: Boolean;
var
   retorno, I: Integer;
   posicaoNota: Pointer;
   cd_pessoa: String;
begin
   { Quando o usuário está editando um valor, e clica no botão para calcular a média
     antes de ter finalizado a edição de um aluno (mover a linha para cima e para baixo).
     o valor da célula estava sendo limpado automaticamente.
     Com isso, realizamos o foco em outro componente para simular a conclusão de alteração do Registro NA GRID (não no banco) }
   if ckbInativosNovo.Visible and ckbInativosNovo.Enabled and ( pgPrincipal.ActivePage = tsDiarioNotas ) and ckbInativosNovo.CanFocus then
   begin
      ckbInativosNovo.SetFocus;
   end;

   Result := False;
   if ( pgPrincipal.ActivePage = tsDiarioNotas ) AND ( UMGridNotas2.hasAlteracao() ) then
   begin
      retorno := Mensagem('Houve alteração de notas, deseja aplicar as alterações?', Application.Title, MB_YESNOCANCEL + MB_ICONQUESTION, Handle);

      try
         if retorno = mrYes then
         begin
            cd_pessoa := UMGridNotas2.GetValorStr( 'cd_pessoa' );

            btnAplicarAlteracoesNotasClick(nil);

            //Restaura a pessoa original
            UMGridNotas2.SetValor('cd_pessoa',cd_pessoa);

            Result := False;
         end else if retorno = mrNo then
         begin
            btnCancelarNotasClick(nil);
            Result := False;
         end else begin
            Result := True;
         end;
      except
         //
      end;
   end;
end;

procedure TDiarioView.InsereAlunosDescricao;
begin
   {
      Pega os alunos que estão na fichaindividual mas
      não estão no diarios_descricoes e joga na tabela diarios_descricoes
   }

   qryInsertDescricao.ParamByName('cd_bimestre').AsInteger := DMDiario.qTurmasBIMESTRE.AsInteger;
   qryInsertDescricao.ParamByName('anosemestre').AsInteger :=  DMDiario.qTurmasANOSEMESTRE.AsInteger;
   qryInsertDescricao.ParamByName('turma').AsString := DMDiario.qTurmasTURMA.AsString;
   qryInsertDescricao.ParamByName('disciplina').AsInteger := DMDiario.qTurmasDISCIPLINA.AsInteger;

   qryInsertDescricao.ExecSQL();
end;

function TDiarioView.isParametroHabilitado(cd_curso, cd_turma: String; nr_anosemestre, cd_disciplina: Integer): Boolean;
const
   SQL_CARREGA_PARAMETROS_AVALIACAO =
      ' SELECT '+
      '   avl.sn_permitir_justificar '+
      ' FROM '+
      '   turmas t '+
      '   INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade) '+
      '   INNER JOIN avaliacoes_parametros_matriz avl ON (avl.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) '+
      ' WHERE '+
      '   [$condicoes$] '+
      '   AND t.anosemestre = :anosemestre '+
      '   AND t.cd_coligada IN(:coligadas) '+
      ' GROUP BY '+
      '   avl.cd_avaliacao '+
      ' LIMIT 1 ';
var
   qyParametrosAvaliacao: TUMZReadOnlyQuery;

   sCondicoes,
   sSqlParametros,
   sSqlQtdParametros: String;
begin
   Result := False;

   DM.CriarConsulta(qyParametrosAvaliacao);

   // Prepara SQL que busca informações dos parametros de avaliação das turmas do curso selecionado
   qyParametrosAvaliacao.SQL.Text := SQL_CARREGA_PARAMETROS_AVALIACAO;

   // Carrega os parametros de avaliação por CURSO
   sCondicoes := ' t.curso LIKE '+QuotedStr(cd_curso);

   // Carrega os parametros de avaliação por CURSO/TURMA - se tiver filtrado
   sCondicoes := sCondicoes + ' AND gd.cd_disciplina LIKE '+QuotedStr(IntToStr(cd_disciplina));

   // Carrega os parametros de avaliação por CURSO/DISCIPLINA ou CURSO/TURMA/DISCIPLINA - se tiver filtrado
   sCondicoes := sCondicoes + ' AND t.codigo LIKE '+QuotedStr(cd_turma);

   qyParametrosAvaliacao.ParamByName('anosemestre').AsInteger := nr_anosemestre;

   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    '[$condicoes$]',
                                                    sCondicoes,
                                                    [rfReplaceAll, rfIgnoreCase] );

   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    ':coligadas',
                                                    dm.GetColigadas,
                                                    [rfReplaceAll, rfIgnoreCase] );

   // SQL que busca os parametros de avaliação das turmas
   sSqlParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                    ':campos',
                                    'DISTINCT avl.cd_avaliacao',
                                    [rfReplaceAll, rfIgnoreCase] );

   // SQL que busca os a quantidade de parametros de avalição das turmas
   sSqlQtdParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                       ':campos',
                                       'COUNT(DISTINCT avl.cd_avaliacao) qtd_parametros',
                                       [rfReplaceAll, rfIgnoreCase] );

   // Executa SQL que busca os parametros de avaliação das turmas
   qyParametrosAvaliacao.SQL.Text := sSqlParametros;
   qyParametrosAvaliacao.Open();

   if qyParametrosAvaliacao.RecordCount > 0 then
   begin
      Result := qyParametrosAvaliacao.FieldByName('sn_permitir_justificar').AsInteger = 1;
   end;
end;

procedure TDiarioView.Justificativadefaltas1Click(Sender: TObject);
begin
   if not(isParametroHabilitado(
      DBText7.Caption,
      VarToStr(UMGridAulas2.GetValor('turma')),
      UMGridAulas2.GetValor('nr_anosem'),
      UMGridAulas2.GetValor('cd_disciplina')
   )) then
   begin
      Mensagem(
         'Parâmetro de avaliação não está habilitado para justificar faltas.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );
      Exit;
   end;

   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.PermitirJustificarFaltas' ,npAcesso, True ) then Exit;

   if frmJustificarFaltas = nil then
   begin
      Application.CreateForm(TfrmJustificarFaltas, frmJustificarFaltas);
   end;

   frmJustificarFaltas.anosemestre  := UMGridAulas2.GetValor('nr_anosem');
   frmJustificarFaltas.turma        := VarToStr(UMGridAulas2.GetValor('turma'));
   frmJustificarFaltas.disciplina   := UMGridAulas2.GetValor('cd_disciplina');
   frmJustificarFaltas.bimestre     := UMGridAulas2.GetValor('cd_bimestre');
   frmJustificarFaltas.numeroaula   := StrToInt(AnsiMidStr(UMGridAulas2.SelectedField.FieldName, 7, Length(UMGridAulas2.SelectedField.FieldName)));
   frmJustificarFaltas.dataaula     := StrToDate(UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].Title.Caption);
   frmJustificarFaltas.nrqtdaulas   := UMGridAulas2.GetValor('qtd_aulas');
   frmJustificarFaltas.cdpessoa     := UMGridAulas2.GetValor('cd_pessoa');
   frmJustificarFaltas.possuiFaltas := not((Pos('F', UMGridAulas2.GetValor(UMGridAulas2.SelectedField.FieldName)) = 0));

   frmJustificarFaltas.lbTDisciplina := DBText6.Caption;
   frmJustificarFaltas.lbTTurma      := VarToStr(UMGridAulas2.GetValor('turma'));
   frmJustificarFaltas.lbTDataAula   := UMGridAulas2.Columns.Items[UMGridAulas2.SelectedIndex].Title.Caption;
   frmJustificarFaltas.lbTAluno      := VarToStr(UMGridAulas2.GetValor('nm_pessoa'));

   btnAplicarAlteracoesFrequenciasClick(nil);

   frmJustificarFaltas.ShowModal;
   FreeAndNil(frmJustificarFaltas);

   pgPrincipalChange(nil);
end;

procedure TDiarioView.Filtrar;
begin
   if DesabilitarFiltro = true then Exit;

   DMDiario.qTurmas.SQL.Clear;

   DMDiario.qTurmas.Sql.Text :=
   ' SELECT DT.TURMA, DT.ANOSEMESTRE, DT.DISCIPLINA, DT.BIMESTRE, TP.PROFESSOR, ' +
   '        DT.CURSO, DT.DATAENTREGA, DT.FORMULA_MEDIA, ' +
   '        CAST(CASE WHEN PROF_GRUPO.NM_PESSOA IS NOT NULL THEN ' +
   '           PROF_GRUPO.NM_PESSOA '+
   '        WHEN PROF_ANTIGO.NM_PESSOA IS NOT NULL THEN ' +
   '           CONCAT(GROUP_CONCAT(P.NM_PESSOA ORDER BY PC.DS_ASCENSAO, P.NM_PESSOA SEPARATOR ", "), CONCAT(" (Anterior: ", GROUP_CONCAT(PROF_ANTIGO.NM_PESSOA ORDER BY PROF_ANTIGO.NM_PESSOA), ")"))' +
   '        ELSE ' +
   '           GROUP_CONCAT(P.NM_PESSOA ORDER BY PC.DS_ASCENSAO, P.NM_PESSOA SEPARATOR ", ") ' +
   '        END AS CHAR(1000)) AS NOME, ' +
   '        D.DESCRICAO, C.DS_CURSO DSCURSO, DC.CD_GRUPO, DC.NM_GRUPO GRUPO' +
   ' FROM DIARIO_TURMAS DT ' +
   '      INNER JOIN TURMASPROFESSORES TP ON ( TP.ANOSEMESTRE = DT.ANOSEMESTRE AND TP.TURMA = DT.TURMA AND TP.DISCIPLINA = DT.DISCIPLINA ) ' +
   '      INNER JOIN PESSOAS P ON ( P.CD_PESSOA = TP.PROFESSOR ) ' +
   '      INNER JOIN DISCIPLINAS D ON ( D.CURSO = DT.CURSO AND D.CODIGO = DT.DISCIPLINA ) ' +
   '      INNER JOIN CURSOS_MESTRE C ON ( C.CD_CURSO = DT.CURSO ) ' +
   '      INNER JOIN TURMAS T ON ( T.CODIGO = TP.TURMA AND T.ANOSEMESTRE = TP.ANOSEMESTRE ) ' +
   '      LEFT JOIN PESSOAS PROF_ANTIGO ON (PROF_ANTIGO.CD_PESSOA = DT.PROFESSOR AND PROF_ANTIGO.CD_PESSOA != TP.PROFESSOR AND ' +
   '        PROF_ANTIGO.CD_PESSOA NOT IN (SELECT TP_ANTERIOR.PROFESSOR FROM TURMASPROFESSORES TP_ANTERIOR WHERE TP_ANTERIOR.ANOSEMESTRE = DT.ANOSEMESTRE AND TP_ANTERIOR.TURMA = DT.TURMA AND TP_ANTERIOR.DISCIPLINA = DT.DISCIPLINA)) ' +
   '      LEFT JOIN DIARIO_GRUPOS DC ON (DC.CD_GRUPO = DT.CD_GRUPO) ' +
   '      LEFT JOIN PESSOAS PROF_GRUPO ON ( PROF_GRUPO.CD_PESSOA = DC.CD_PROFESSOR ) ' +
   '      LEFT JOIN PROFESSORES_CATEGORIAS PC ON (TP.CD_CATEGORIA = PC.CD_CATEGORIA) ' +
   ' WHERE DT.ANOSEMESTRE = :ANOSEM AND ' +
   ' IF(ISNULL(DT.CD_GRUPO) OR DT.CD_GRUPO = 0,true,TP.PROFESSOR = DT.PROFESSOR) AND '+
   '       DT.BIMESTRE = :BIMESTRE AND ' +
   '       T.CD_COLIGADA IN (%s) ';

   DMDiario.qTurmas.SQL.Text := Format(DMDiario.qTurmas.SQL.Text, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);

   if Trim(txtCurso.Text) <> '' Then
      DMDiario.qTurmas.SQL.Add(' AND DT.CURSO = ''' + txtCurso.Text + '''');

   if Trim(txtTurma.Text) <> '' Then
      DMDiario.qTurmas.Sql.Add(' AND DT.TURMA = ''' + txtturma.Text + '''');

   if lngProfessor > 0 Then
      DMDiario.qTurmas.Sql.Add(' AND DT.PROFESSOR = ' + IntToStr(lngProfessor));

   if lngDisciplina > 0 Then
      DMDiario.qTurmas.Sql.Add(' AND DT.DISCIPLINA = ' + IntToStr(lngDisciplina));

   if lngGrupo > 0 Then
      DMDiario.qTurmas.Sql.Add(' AND DT.CD_GRUPO = ' + IntToStr(lngGrupo));

   DMDiario.qTurmas.Sql.Add(' GROUP BY DT.ANOSEMESTRE, DT.CURSO, DT.TURMA, DT.DISCIPLINA, DT.BIMESTRE, DT.CD_GRUPO ');
   DMDiario.qTurmas.Sql.Add(' ORDER BY DT.CURSO, DT.TURMA, D.DESCRICAO ');

   if(Trim(txtAnoSemestreCursos.Text) <> '' ) then
   begin
      DMDiario.qTurmas.ParamByName('ANOSEM').AsInteger := StrToInt(txtAnoSemestreCursos.Text);
   end else begin
      DMDiario.qTurmas.ParamByName('ANOSEM').AsInteger := 0;
   end;

   if (Trim(txtBimestre.Text) = '' ) then
      txtBimestre.Text := '1';

   DMDiario.qTurmas.ParamByName('BIMESTRE').AsInteger := StrToInt(txtBimestre.Text);

   DMDiario.qTurmas.Open;
   DMDiario.qTurmas.FetchAll();
end;

procedure TDiarioView.FormCreate(Sender: TObject);
var
   camposIgnorados: TStringList;
begin

   DM.MontarPlanilha(DBGrid6, 'diario_notas_avaliacoes_campos');

   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
      { Insere log de acesso ao diário }
      DMDiario.inserirLogAcesso;
   end;

   camposIgnorados := TStringList.Create;
   camposIgnorados.Add('CheckBox2');
   camposIgnorados.Add('ckbInativosNovo');
   DesabilitarFiltro := true;
   DM.Parametros_usuario(TForm(Sender), camposIgnorados);
   DesabilitarFiltro := false;
end;

procedure TDiarioView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5: begin
         if ( pgPrincipal.ActivePage = tsDiarioNotas ) then
            btnAplicarAlteracoesNotasClick(nil)
         else if ( pgPrincipal.ActivePage = tsDiarioFrequencias ) then
            btnAplicarAlteracoesFrequenciasClick(nil)
         else if ( pgPrincipal.ActivePage = tsDescricoes ) then
            sbSalvaAvaClick(nil);
      end;
      VK_F6: begin
         if ( pgPrincipal.ActivePage = tsDiarioNotas ) then
            btnCancelarNotasClick(nil)
         else if ( pgPrincipal.ActivePage = tsDiarioFrequencias ) then
            btnCancelarFrequenciasClick(nil)
         else if ( pgPrincipal.ActivePage = tsDescricoes ) then
            sbCancelAvaClick(nil);
      end;
      VK_F7: begin
         if ( pgPrincipal.ActivePage = tsDiarioNotas ) then
         begin
            sbCalcularMediaAlunoClick(btnCalcularAluno);
         end;
      end;
      VK_F8: begin
         if ( pgPrincipal.ActivePage = tsDiarioNotas ) then
         begin
            sbCalcularMediaAlunoClick(sender);
         end;
      end;
      VK_F12: begin
         btnFecharClick(nil);
      end;
   end;
end;

procedure TDiarioView.txtAnoSemestreCursosChange(Sender: TObject);
begin
   Filtrar;
end;

procedure TDiarioView.btnCancelarFrequenciasClick(Sender: TObject);
begin
   UMGridAulas2.CancelarAlteracoes();
end;

procedure TDiarioView.btnCancelarNotasClick(Sender: TObject);
begin
   TAvaliacoesConceitos.GetInstancia().SairCampoConceito();
   UMGridNotas2.CancelarAlteracoes();
end;

procedure TDiarioView.btnClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if resultado_filtro.filtrado then
   begin
     lngProfessor := resultado_filtro.cd_pessoa;
     txtProfessor.Text := resultado_filtro.nm_pessoa;

     Filtrar;
   end
   else Exit;
end;

procedure TDiarioView.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   resultado_filtro.cd_curso := '';
   resultado_filtro.cd_turma := '';
   resultado_filtro.cd_professor := -1;

   if txtCurso.Enabled then
      resultado_filtro.cd_curso := txtCurso.Text;

   if txtTurma.Enabled then
      resultado_filtro.cd_turma := txtturma.Text;

   if txtProfessor.Enabled then
      if txtProfessor.Text <> '' then
         resultado_filtro.cd_professor := lngProfessor;

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([],
      resultado_filtro.cd_curso, StrToInt(txtAnoSemestreCursos.Text),
      resultado_filtro.cd_turma, resultado_filtro.cd_professor);

   if resultado_filtro.filtrado then
   begin
      lngDisciplina := resultado_filtro.cd_disciplina;
      txtDisciplina.Text := resultado_filtro.ds_disciplina;

      Filtrar;
   end;
end;

procedure TDiarioView.btnTurmasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   if (txtAnoSemestreCursos.Text = '') then begin
      txtAnoSemestreCursos.Text := '1';
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([], strtoint(txtAnoSemestreCursos.Text), -1, -1, txtCurso.Text);

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;
   txtAnoSemestreCursos.Text := IntToStr( resultado_filtro.nr_anosemestre );

   Filtrar;
end;

procedure TDiarioView.btnAplicarAlteracoesFrequenciasClick(Sender: TObject);
var
   retorno : Integer;
begin
   TfSplash.GetInstancia().ShowSplashScreen('Diário de Frequências', 'Aguarde enquanto o sistema registra as frequências...');

   retorno := UMGridAulas2.SalvarAlteracoes();

   TfSplash.GetInstancia().CloseSplashScreen();

   case retorno of
      0: Mensagem( 'Ocorreu um erro durante o salvamento das informações.' );
      1: begin
         AtualizaDiarioFrequencias(Integer(CheckBox2.Checked));
         Mensagem( 'Alterações salvas com sucesso.' );
      end;
   end;
end;

procedure TDiarioView.btnAplicarAlteracoesNotasClick(Sender: TObject);
var
   retorno: Integer;
begin
   TfSplash.GetInstancia().ShowSplashScreen('Diário de Notas', 'Aguarde enquanto o sistema registra as notas...');

   UMGridNotas2.Tag := 0;
   retorno := UMGridNotas2.SalvarAlteracoes();

   TfSplash.GetInstancia().CloseSplashScreen();

   case retorno of
      0: Mensagem( 'Ocorreu um erro durante o salvamento das informações.' );
      1: begin
         if UMGridNotas2.Tag = 1 then
         begin
            TfSplash.GetInstancia().ShowSplashScreen('Diário de Notas', 'Aguarde enquanto o sistema registra as notas...');
            AtualizaDiarioProvas(Integer(ckbInativosNovo.Checked));
            TfSplash.GetInstancia().CloseSplashScreen();
         end;

         Mensagem( 'Alterações salvas com sucesso.' );
      end;
   end;
end;

procedure TDiarioView.CheckBox2Click(Sender: TObject);
begin
   AtualizaDiarioFrequencias(Integer(CheckBox2.Checked));
end;

procedure TDiarioView.ckbInativosNovoClick(Sender: TObject);
var
   temAlteracao: Boolean;
begin

   temAlteracao := hasPendenciaNotas();

   if temAlteracao then
   begin
      ckbInativosNovo.OnClick := nil;
      ckbInativosNovo.Checked := not ckbInativosNovo.Checked;
      ckbInativosNovo.OnClick := ckbInativosNovoClick;

      Exit;
   end;

   AtualizaDiarioProvas(Integer(ckbInativosNovo.Checked));
end;

procedure TDiarioView.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   if (txtAnoSemestreCursos.Text = '') then
   begin
      txtAnoSemestreCursos.Text := '1';
   end;

   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, strtoint(txtAnoSemestreCursos.Text));

   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestreCursos.Text := IntToStr( resultado_filtro.nr_anosemestre );
      Filtrar;
   end;
end;

procedure TDiarioView.SpeedButton2Click(Sender: TObject);
begin
   txtCurso.Clear;
   txtTurma.Clear;
   txtProfessor.Clear;
   txtDisciplina.Clear;
   txtGrupo.Clear;
   lngDisciplina := 0;
   lngProfessor := 0;
   lngGrupo := 0;
   Filtrar;
end;

procedure TDiarioView.txtCursoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('txtCurso', TEDit(Sender).Name) > 0) then begin
         Filtrar;
      end;
   end;
end;

procedure TDiarioView.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      Filtrar;
  End;
end;

procedure TDiarioView.txtDisciplinaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('txtDisciplina', TEDit(Sender).Name) > 0) then begin
         lngDisciplina := 0;
         Filtrar;
      end;
   end;
end;

procedure TDiarioView.txtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('txtGrupo', TEDit(Sender).Name) > 0) then begin
         lngGrupo := 0;
         Filtrar;
      end;
   end;
end;

procedure TDiarioView.txtGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      Filtrar;
  End;
end;

procedure TDiarioView.txtProfessorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('txtProfessor', TEDit(Sender).Name) > 0) then begin
         lngProfessor := 0;
         Filtrar;
      end;
   end;
end;

procedure TDiarioView.txtTurmaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('txtTurma', TEDit(Sender).Name) > 0) then begin
         Filtrar;
      end;
   end;
end;

procedure TDiarioView.txtTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      Filtrar;
  End;

end;

procedure TDiarioView.btGruposFiltrarClick(Sender: TObject);
begin
   Filtrar;
end;

procedure TDiarioView.btnAbrirWordClick(Sender: TObject);
Var
    arquivo : PChar;
begin
{   Arquivo := PChar('"' + ExtractFilePath(Application.ExeName) +  'Planos\' + pnArquivo.Caption + '"');
   ShellExecute(handle, 'open', 'winword.exe', Arquivo,'NULL', SW_SHOWNORMAL);}
end;

procedure TDiarioView.l(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     if txtBimestre.text = '10' then
      txtBimestre.text := '10'
     else
      txtBimestre.text := IntToStr( StrToInt( txtBimestre.text ) + 1 );
  end
  else
  begin
     if txtBimestre.text = '1' then
      txtBimestre.text := '1'
     else
      txtBimestre.text := IntToStr( StrToInt( txtBimestre.text ) - 1 );
  end;

  Filtrar;
end;

procedure TDiarioView.Memo1Change(Sender: TObject);
begin
   tbCancelarDescricoes.Enabled := True;
   tbSalvarDescricoes.Enabled := True;
end;

procedure TDiarioView.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   if ( hasPendenciaNotas() ) then
      AllowChange := False;
end;

procedure TDiarioView.PageControl2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin

   btnAplicarAlteracoesFrequencias.Enabled := true;
   btnCancelarFrequencias.Enabled := true;
   btAtualizarFreqAluno.Enabled := true;
   btAtualizarFreqTurma.Enabled := true;
   btAplicarPresenca.Enabled := true;
   CheckBox2.Enabled := true;

   if PageControl2.TabIndex = 1  then
   begin
      btnAplicarAlteracoesFrequencias.Enabled := false;
      btnCancelarFrequencias.Enabled := false;
      btAtualizarFreqAluno.Enabled := false;
      btAtualizarFreqTurma.Enabled := false;
      btAplicarPresenca.Enabled := false;
      CheckBox2.Enabled := false;
   end;

   if ( hasPendenciaFrequencias() ) then
      AllowChange := False;
end;

procedure TDiarioView.SpeedButton3Click(Sender: TObject);
Var Lugar :Pointer;
    i: integer;
begin
   DmDiario.qAlunos.Edit;

   if FormCadAluno = nil then
      Application.CreateForm(TformCadAluno, formCadAluno);

   FormCadAluno.ShowModal;



//  if DMDiario.qAlunosSITUACAO.AsInteger = 1 Then
  Begin
   i := 0;

   DmDiario.qAulas.Open;
   DmDiario.qAulas.First;

   while (not DmDiario.qAulas.EOF) and (i <= 99) do
    Begin
        with DMDIARIO.qDarPresenca do
        Begin
            Sql.Text := 'UPDATE DIARIO_AULAS_ALUNOS ';
            Sql.Add('SET DS_FREQ = :PRESENCA');
            Sql.Add('WHERE CD_TURMA = :TURMA AND CD_DISCIPLINA = :DISCIPLINA AND NR_ANOSEM = :ANOSEMESTRE AND CD_PESSOA = :CODALUNO AND (DS_FREQ = ''-'' OR DS_FREQ = ''--'')');
            ParamByName('Turma').Value := DMDIARIO.qAulasTURMA.Value;
            ParamByName('Disciplina').Value := DMDIARIO.qAulasDISCIPLINA.Value;
            ParamByName('AnoSemestre').Value := DMDIARIO.qAulasANOSEMESTRE.Value;
            ParamByName('CodAluno').Value := DMDiario.qAlunosCODALUNO.Value;
            ParamByName('nr_aula').Value := DMDIARIO.qAulasNRO_AULA.Value;

            if DMDIARIO.qAulasQTD_AULAS.Value > 1 Then
               ParamByName('PRESENCA').Value := 'CC'
            Else
               ParamByName('PRESENCA').Value := 'C';
            ExecSQL;
        End;

        i := i +1;
        DmDiario.qAulas.Next;
    End;
  End;
  DmDiario.qAlunos.Close;
  DmDiario.qAlunos.Open;

end;

procedure TDiarioView.SpeedButton4Click(Sender: TObject);
begin
   DM.IniciarDiario( StrToInt(txtAnoSemestreCursos.Text), StrToInt(txtBimestre.Text),
                     txtCurso.Text, txtTurma.Text, lngDisciplina, lngProfessor, lngGrupo );

   Filtrar();

   Mensagem('Diários "iniciados" com sucesso!', Application.Title, MB_OK + MB_ICONEXCLAMATION);
end;

procedure TDiarioView.btnObsClick(Sender: TObject);
begin
   if DMDiario.qTurmas.IsEmpty then
   begin
      Mensagem(
         'Selecione um registro para visualizar as observações.',
         'Atenção',
         MB_ICONINFORMATION + MB_OK, Handle
      );
      Exit;
   end;

   TfObservacoes.ShowObservations(
      Self,
      DMDiario.qTurmasPROFESSOR.AsInteger,
      okTurmasProfessores
   );
end;

function TDiarioView.trocafrequencia(fAtual: string; tecla: char; aulas: integer): string;
var
   qtd : Array of string;
   sim : Array of Char;
   i : Integer;
   fNova : string;
begin

  SetLength(qtd, aulas);
  SetLength(sim, 3);

   sim[0] := 'F';
   sim[1] := 'C';
   sim[2] := '-';

   //preenche as aulas com "-" caso esteja nulla a presença
  if(Length(fAtual) = 0) then
  begin
     for i := 0 to aulas - 1 do begin
      fAtual := fAtual + '-';
     end;
  end;

  for i := 0 to aulas - 1 do begin
    if(Length(fAtual) > 0) then
    begin
       if (fAtual[i+1] = '') then begin
            qtd[i] := '-';
       end else begin
         qtd[i] := fAtual[i+1];
       end;
    end
  end;

   fNova := '';

   // Se for a tecla espaco
   if ( tecla = ' ' ) then begin

     if (aulas > 2) then begin

        if (qtd[0] = 'F') then begin
          fNova := FillString('',alLeft,sim[2],aulas, false);
        end else if (qtd[0] = 'C') then begin
          fNova := FillString('',alLeft,sim[0],aulas, false);
        end else if (qtd[0] = '-') then begin
          fNova := FillString('',alLeft,sim[1],aulas, false);
        end else begin
          fNova := FillString('',alLeft,sim[1],aulas, false);
        end;

     end else begin
         if (fAtual = '') then begin
            fNova := 'CC';
         end else if (fAtual = '--') then begin
            fNova := 'FF';
         end else if (fAtual = 'FF') then begin
            fNova := 'FC';
         end else if (fAtual = 'FC') then begin
            fNova := 'CF';
         end else if (fAtual = 'CF') then begin
            fNova := 'CC';
         end else if (fAtual = 'CC') then begin
            fNova := '--';
         end else if (fAtual = 'F') then begin
            fNova := '-';
         end else if (fAtual = 'C') then begin
            fNova := 'F';
         end else if (fAtual = '-') then begin
            fNova := 'C';
         end else begin
            fNova := 'C';
         end;
     end;

  end else if ( tecla = 'F') OR (tecla = 'f') then begin // F || f

      fNova := '';
         for i := 1 to length(fAtual)-1 do begin
            fNova := fNova + fAtual[i+1];
         end;
      fNova := FillString(fNova, alLeft, 'F', aulas, false);

  end else if ( tecla = 'C' ) OR ( tecla = 'c' ) then begin// Se apertar no c ou C

      fNova := '';
         for i := 1 to length(fAtual)-1 do begin
            fNova := fNova + fAtual[i+1];
         end;
      fNova := FillString(fNova, alLeft, 'C', aulas, false);

  end else if ( tecla = '-' ) then begin // Se apertar no -
      fNova := '';
         for i := 1 to length(fAtual)-1 do begin
            fNova := fNova + fAtual[i+1];
         end;
      fNova := FillString(fNova, alLeft, '-', aulas, false);
  end;

  Result := fNova

end;

procedure TDiarioView.sbAplicarPresencaClick(Sender: TObject);
var
   qyPessoasPresenca : TUMZQuery;
begin

   if ( hasPendenciaFrequencias() ) then
      Exit;

   if Mensagem('Esse procedimento irá aplicar presenças para todos os alunos que não possuem faltas registradas. Deseja continuar?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes Then Exit;

   DM.CriarConsulta( qyPessoasPresenca );

   with qyPessoasPresenca do
   begin
      SQL.Clear;
      SQL.Add( 'SELECT dm.codaluno, dm.anosemestre, dm.turma, dm.disciplina, dm.bimestre, da.nro_aula, da.qtd_aulas, daa.ds_freq ' );
      SQL.Add( 'FROM diario_matriculas dm ' );
      SQl.Add( 'INNER JOIN diario_aulas da ON ( da.anosemestre = dm.anosemestre AND ' );
      SQL.Add( 'da.turma = dm.turma AND da.disciplina = dm.disciplina AND da.bimestre = dm.bimestre ) ' );
      SQL.Add( 'INNER JOIN fichaindividual fi ON (fi.anosemestre = da.anosemestre AND fi.turma = da.turma AND fi.disciplina = da.disciplina AND fi.codigoaluno = dm.codaluno) ');
      SQL.Add( 'LEFT JOIN diario_aulas_alunos daa ON (daa.cd_pessoa = dm.codaluno AND ' );
      SQL.Add( 'daa.nr_anosem = da.anosemestre AND daa.cd_turma = da.turma AND ' );
      SQL.Add( 'daa.cd_disciplina = da.disciplina AND daa.cd_bimestre = da.bimestre AND daa.nr_aula = da.nro_aula) ' );
      SQL.Add( 'LEFT JOIN diario_grupos_pessoas dgp ON (dgp.cd_grupo = da.cd_grupo AND dgp.cd_pessoa = daa.cd_pessoa AND dgp.dt_saida IS NULL) ' );
      SQL.Add( 'WHERE dm.anosemestre = :ANOSEMESTRE AND dm.turma = :TURMA AND dm.disciplina = :DISCIPLINA AND ' );
      SQL.Add( 'dm.bimestre = :BIMESTRE AND (daa.ds_freq = '''' OR daa.ds_freq IS NULL) AND ' );
      SQL.Add( '(DATE_FORMAT(da.data, "%Y-%m-%d") <= DATE_FORMAT(NOW(), "%Y-%m-%d")) AND ' );
      SQL.Add( 'fi.situacao NOT IN (3, 4, 5, 6) AND ' );
      SQL.Add( 'CASE WHEN :CD_GRUPO > 0 THEN dgp.cd_grupo = :CD_GRUPO ELSE 1=1 END ' );

      ParamByName('ANOSEMESTRE').AsInteger := DMDIARIO.qAulasANOSEMESTRE.Value;
      ParamByName('TURMA').AsString := DMDIARIO.qAulasTURMA.Value;
      ParamByName('DISCIPLINA').AsInteger := DMDIARIO.qAulasDISCIPLINA.Value;
      ParamByName('BIMESTRE').AsInteger := DMDIARIO.qAulasBIMESTRE.Value;
      ParamByName('CD_GRUPO').AsInteger := DMDIARIO.qTurmasCD_GRUPO.AsInteger;
      Open;
   end;

   qyPessoasPresenca.First;
   while not qyPessoasPresenca.Eof do
   begin
      with DMDIARIO.qDarPresenca do
      begin
         Close;
         SQL.Clear;

         if Connection.Protocol = DB_PROTOCOL_MYSQL then begin

            SQl.Add( ' REPLACE INTO diario_aulas_alunos (cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_aula, ds_freq) ' );
            SQL.Add( ' VALUES ( :PESSOA, :TURMA, :ANOSEMESTRE, :DISCIPLINA, :BIMESTRE, :NROAULA, :FREQUENCIA ) ' );

         end else if Connection.Protocol = DB_PROTOCOL_ORACLE then begin

            SQl.Add( ' MERGE INTO diario_aulas_alunos daa USING ' );
            SQl.Add( ' (SELECT ' );
            SQl.Add( '     :PESSOA AS cd_pessoa, ' );
            SQl.Add( '     :TURMA AS cd_turma, ' );
            SQl.Add( '     :ANOSEMESTRE AS nr_anosem, ' );
            SQl.Add( '     :DISCIPLINA AS cd_disciplina, ' );
            SQl.Add( '     :BIMESTRE AS cd_bimestre, ' );
            SQl.Add( '     :NROAULA AS nr_aula, ' );
            SQl.Add( '     :FREQUENCIA AS ds_freq ' );
            SQl.Add( ' FROM dual) daa2 ON ' );
            SQl.Add( '     (daa.cd_pessoa = daa2.cd_pessoa AND ' );
            SQl.Add( '      daa.cd_turma = daa2.cd_turma AND ' );
            SQl.Add( '      daa.nr_anosem = daa2.nr_anosem AND ' );
            SQl.Add( '      daa.cd_disciplina = daa2.cd_disciplina AND ' );
            SQl.Add( '      daa.cd_bimestre = daa2.cd_bimestre AND ' );
            SQl.Add( '      daa.nr_aula = daa2.nr_aula)' );
            SQl.Add( ' WHEN MATCHED THEN ' );
            SQl.Add( '      UPDATE SET daa.ds_freq = daa2.ds_freq ' );
            SQl.Add( ' WHEN NOT MATCHED THEN ' );
            SQl.Add( '      INSERT (daa.cd_pessoa, daa.cd_turma, daa.nr_anosem, daa.cd_disciplina, daa.cd_bimestre, daa.nr_aula, daa.ds_freq) VALUES (daa2.cd_pessoa, daa2.cd_turma, daa2.nr_anosem, daa2.cd_disciplina, daa2.cd_bimestre, daa2.nr_aula, daa2.ds_freq) ' );

         end;

         ParamByName('PESSOA').AsInteger := qyPessoasPresenca.FieldByName('codaluno').AsInteger;
         ParamByName('TURMA').AsString := qyPessoasPresenca.FieldByName('turma').AsString;
         ParamByName('ANOSEMESTRE').AsInteger := qyPessoasPresenca.FieldByName('anosemestre').AsInteger;
         ParamByName('DISCIPLINA').AsInteger := qyPessoasPresenca.FieldByName('disciplina').AsInteger;
         ParamByName('BIMESTRE').AsInteger := qyPessoasPresenca.FieldByName('bimestre').AsInteger;
         ParamByName('NROAULA').AsInteger := qyPessoasPresenca.FieldByName('nro_aula').AsInteger;
         ParamByName('FREQUENCIA').AsString := FillString('', alLeft, 'C', qyPessoasPresenca.FieldByName('qtd_aulas').AsInteger , false );

         ExecSQL;
      end;

      qyPessoasPresenca.Next;
   end;

   AtualizaDiarioFrequencias(Integer(CheckBox2.Checked));

end;

procedure TDiarioView.sbCalcularMediaAlunoClick(Sender: TObject);
const
   SSQLVerificaFreq = 'SELECT DIA_VERIFICA_FREQ_LANCADAS(?, ?, ?, ?, ?) FROM DUAL';
   MSG_PROGRESSO_ALUNOS = 'Aguarde enquanto o sistema calcula as médias. Aluno %d de %d...';
   SMsgPreencherFreq = 'Todas as informações de frequências devem estar lançadas para permitir o cálculo de médias.';
var
   sFormula, avl_param_frente_media: string;
   bRet: Boolean;
   lugar: Pointer;
   iTotal: Integer;
   iAtual: Integer;
   iDisciplinaFrente: Integer;
   totalAlunos : Integer;

   bObrigatorios, bProficiencia : Boolean;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   // Busca se o parâmetro é do que copia todas avaliações para a mãe ou é por tipo de avl
   avl_param_frente_media := UpperCase(ClasseTurmas.GetParametroAvaliacao(
      UMGridNotas2.GetValorInt( 'nr_anosem' ),
      UMGridNotas2.GetValorStr( 'turma' ),
      UMGridNotas2.GetValorStr( 'disciplina' ),
      'sn_disc_frente_media'
   ));

   if (avl_param_frente_media <> '2') then
   begin
     iDisciplinaFrente := DM.getDisciplinaFrente(UMGridNotas2.GetValorInt( 'disciplina' ), UMGridNotas2.GetValorInt( 'nr_anosem' ), UMGridNotas2.GetValorStr( 'turma' ));

     if iDisciplinaFrente > 0 then
     begin
        Mensagem('Não é possível cálcular a média da disciplina "'+DMDiario.qTurmasDESCRICAO.AsString+'", pois a mesma faz frente para outra disciplina!', 'Atenção!!', MB_OK);
        Exit;
     end;
   end;

   if ( hasPendenciaNotas() ) then
      Exit;

   // Verifica se tem alguma alteração em aberto
   if DMDiario.qNotas.State = dsEdit  then begin
      DMDiario.QNotas.Post;
   end;


   bObrigatorios := true;

   if UMGridNotas2.GetValorStr('nr_anosem') = '' then
      bObrigatorios := false;

   if DMDiario.qTurmasCURSO.AsString = '' then
      bObrigatorios := false;

   if DMDiario.qTurmasTURMA.AsString = '' then
      bObrigatorios := false;

   if DMDiario.qTurmasDISCIPLINA.AsString = '' then
      bObrigatorios := false;

   if DMDiario.qTurmasBIMESTRE.AsString = '' then
      bObrigatorios := false;

   if bObrigatorios = true then
   begin
      // confirma formula do professor
      sFormula := DMDiario.getFormulaTurma(
         DMDiario.qProvasANOSEMESTRE.AsInteger, DMDiario.qProvasTURMA.AsString,
         DMDiario.qProvasDISCIPLINA.AsInteger, DMDiario.qTurmasBIMESTRE.AsInteger,
         DMDiario.qTurmasCD_GRUPO.AsInteger
      );

      bProficiencia := false;

      if not bDisciplinaUtilizaProficiencia then
      begin
         if not InputQuery(Application.Title, 'Confirme a fórmula para cálculo ou deixe em branco para média aritmética das notas digitadas: ', sFormula) then
            exit;
      end else begin
         if not InputQueryCheck(Application.Title, 'Confirme a fórmula para cálculo ou deixe em branco para média aritmética das notas digitadas: ','Suficiência', sFormula, bProficiencia, BloqueioFormula) then
            Exit;

         if bProficiencia then
         begin
            sFormula := 'SUFICIENCIA';
         end;
      end;

      {
         Ocorrência 39342: Somente verificar pendencia de provas, quando NÃO CALCULAR PROFICIENCIA
      }
      if not bProficiencia then
      begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_curso').AsString := DMDiario.qTurmasCURSO.AsString;
         Dm.qyVerificaNotasLancada.ParamByName('cd_turma').AsString := UMGridNotas2.GetValorStr('turma');
         Dm.qyVerificaNotasLancada.ParamByName('nr_anosemestre').AsString := UMGridNotas2.GetValorStr('nr_anosem');
         Dm.qyVerificaNotasLancada.ParamByName('cd_disciplina').AsString := UMGridNotas2.GetValorStr('disciplina');
         Dm.qyVerificaNotasLancada.ParamByName('nr_etapa').AsInteger := UMGridNotas2.GetValorInt('bimestre');
         if DMDiario.qTurmasCD_GRUPO.AsInteger > 0 then begin
            Dm.qyVerificaNotasLancada.ParamByName('cd_grupo').AsInteger := DMDiario.qTurmasCD_GRUPO.AsInteger;
         end else begin
            Dm.qyVerificaNotasLancada.ParamByName('cd_grupo').Clear;
         end;
         if (TSpeedButton(Sender).Tag = 1) then begin
            Dm.qyVerificaNotasLancada.ParamByName('cd_pessoa').AsInteger := StrToInt(UMGridNotas2.GetValorStr('cd_pessoa'));
         end else begin
            Dm.qyVerificaNotasLancada.ParamByName('cd_pessoa').Clear;
         end;

         Dm.qyVerificaNotasLancada.Close;
         Dm.qyVerificaNotasLancada.Open;
         if (not Dm.qyVerificaNotasLancada.Eof) and (Dm.qyVerificaNotasLancada.FieldByName('retorno').AsInteger > 0) then
         begin
            Mensagem('Todas as informações de notas devem estar lançadas para permitir o cálculo de médias.', 'Atenção!!', MB_OK, Handle);
            Exit;
         end;
         Dm.qyVerificaNotasLancada.Close;

         Stmt := PrepareStatement(SSQLVerificaFreq);
         try
            Stmt.SetString(1, UMGridNotas2.GetValorStr('turma'));
            Stmt.SetInt(2, UMGridNotas2.GetValorInt('nr_anosem'));
            Stmt.SetInt(3, UMGridNotas2.GetValorInt('disciplina'));
            Stmt.SetInt(4, UMGridNotas2.GetValorInt('bimestre'));

            if (TSpeedButton(Sender).Tag = 1) then
               Stmt.SetInt(5, UMGridNotas2.GetValorInt('cd_pessoa'));

            if (TSpeedButton(Sender).Tag <> 1) then
               Stmt.SetNull(5, stInteger);

            Rs := Stmt.ExecuteQueryPrepared;
            try
               if Rs.Next then
               begin
                  if Rs.GetInt(1) = 0 then
                  begin
                     MessageDlg(SMsgPreencherFreq, mtWarning, [mbOK], -1);
                     Exit;
                  end;
               end;
            finally
               Rs.Close;
               Rs := nil;
            end;
         finally
            Stmt.Close;
            Stmt := nil;
         end;

         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_curso').AsString := DMDiario.qTurmasCURSO.AsString;
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_turma').AsString := UMGridNotas2.GetValorStr('turma');
         Dm.qyValidaQtdAvaliacoes.ParamByName('nr_anosemestre').AsString := UMGridNotas2.GetValorStr('nr_anosem');
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_disciplina').AsString := UMGridNotas2.GetValorStr('disciplina');
         Dm.qyValidaQtdAvaliacoes.ParamByName('nr_etapa').AsInteger := UMGridNotas2.GetValorInt('bimestre');
         if DMDiario.qTurmasCD_GRUPO.AsInteger > 0 then begin
            Dm.qyValidaQtdAvaliacoes.ParamByName('cd_grupo').AsInteger := DMDiario.qTurmasCD_GRUPO.AsInteger;
         end else begin
            Dm.qyValidaQtdAvaliacoes.ParamByName('cd_grupo').Clear;
         end;

         Dm.qyValidaQtdAvaliacoes.Close;
         Dm.qyValidaQtdAvaliacoes.Open;
         if (not Dm.qyValidaQtdAvaliacoes.Eof) and (trim(Dm.qyValidaQtdAvaliacoes.FieldByName('mensagem_retorno').AsString) <> '') then
         begin
            Mensagem('Não é possível cálcular a média porque os limites de quantidade mínima e máxima não foram atendidos: '+#13#13+Dm.qyValidaQtdAvaliacoes.FieldByName('mensagem_retorno').AsString, 'Atenção!!', MB_OK, Handle);
            Exit;
         end;
         Dm.qyValidaQtdAvaliacoes.Close;
      end;

      if (Trim(sFormula) = '') then
      begin
         sFormula := 'ARITMETICA';
      end;

      if (Trim(sFormula) = 'ZERAR') then
      begin
         sFormula := '';
      end;

      // Guardar a Formula da Média
      if (TSpeedButton(Sender).Tag = 99) and (UpperCase(sFormula) <> 'SUFICIENCIA') then
      begin
         DMDiario.qyAux2.Close();
         DMDiario.qyAux2.SQL.Text :=
            ' UPDATE diario_turmas SET formula_media = ' + QuotedStr(sFormula) + ' ' +
            ' WHERE turma = ' + QuotedStr(DMDiario.qTurmasTURMA.AsString) + ' AND anosemestre = ' + DMDiario.qTurmasANOSEMESTRE.AsString +
            '   AND disciplina = ' + DMDiario.qTurmasDISCIPLINA.AsString + ' AND bimestre = ' + DMDiario.qTurmasBIMESTRE.AsString +
            '   AND cd_grupo = ' + IntToStr(DMDiario.qTurmasCD_GRUPO.AsInteger);
         DMDiario.qyAux2.ExecSQL();
      end;

      // Selecionar os alunos e processar o cálculo das médias da disciplina
      with DMDiario.qyAux1 do
      begin
         Close();
         SQL.Clear();
         SQLList.Values['oracle'] := '';
         SQLList.Values['mysql-5'] := '';
         Params.Clear();
         SQL.Add(''+
            'SELECT                                                                  '+
            '   fi.turma, fi.curso, fi.disciplina, fi.codigoaluno, fi.turmamatricula '+
            'FROM                                                                    '+
            '   fichaindividual fi                                                   '+
            '   INNER JOIN situacao s ON (fi.situacao = s.cd_situacao)               '+
            '   LEFT JOIN diario_grupos_pessoas dgp ON (                             '+
            '     dgp.cd_pessoa = fi.codigoaluno AND                                 '+
            '     dgp.dt_saida IS NULL                                               '+
            '   )                                                                    '+
            'WHERE                                                                   '+
            '  s.cd_situacao_pai IN (0,1,2,9,11)                                     '+
            '');
         SQL.Add('AND fi.curso = ''' + DMDiario.qTurmasCURSO.AsString + ''' ');
         SQL.Add('AND fi.anosemestre = ' + UMGridNotas2.GetValorStr('nr_anosem') + ' ');
         SQL.Add('AND fi.turma = ''' + UMGridNotas2.GetValorStr('turma') + ''' ');
         SQL.Add('AND fi.disciplina = ' + UMGridNotas2.GetValorStr('disciplina') + ' ');
         SQL.Add('AND CASE WHEN ' + IntToStr(DMDiario.qTurmasCD_GRUPO.AsInteger) + ' > 0 THEN dgp.cd_grupo = ' + IntToStr(DMDiario.qTurmasCD_GRUPO.AsInteger) + ' ELSE 1=1 END ');
         //so de um aluno

         if (TSpeedButton(Sender).Tag = 1) then
         begin
            SQL.Add('AND codigoaluno = ' + UMGridNotas2.GetValorStr('cd_pessoa') + ' ');
         end;

         Open();
         FetchAll;
         First();
         iTotal := RecordCount;
         iAtual := 1;

         if not IsEmpty then
         begin
            //carrega o temporizador
            totalAlunos := RecordCount;
            TfSplash.GetInstancia().ShowSplashScreen('Calculo de Médias', Format(MSG_PROGRESSO_ALUNOS, [RecNo, totalAlunos]));

            try
               while not Eof do
               begin
                  bRet := DM.CalcularNotaDisciplina(
                     UMGridNotas2.GetValorInt('nr_anosem'),
                     FieldByName('turma').AsString,
                     FieldByName('disciplina').AsInteger,
                     UMGridNotas2.GetValorInt('bimestre'),
                     DMDiario.qTurmasCD_GRUPO.AsInteger,
                     FieldByName('codigoaluno').AsInteger,
                     sFormula
                  );

                  Inc(iAtual);
                  DMDiario.qyAux1.Next();

                  TfSplash.GetInstancia().SetSplashText(Format(MSG_PROGRESSO_ALUNOS, [RecNo, totalAlunos]));
               end; //while
            except
               on E:Exception do
               begin
                  TfSplash.GetInstancia().CloseSplashScreen();
                  raise E;
               end;

            end;

            AtualizaDiarioProvas(Integer(ckbInativosNovo.Checked));

            TfSplash.GetInstancia().CloseSplashScreen();
         end;

         Close();
      end; //with

      { Atualizar a Turma }

      lugar := DMDiario.qTurmas.GetBookmark;


      DMDiario.qTurmas.Close;
      DMDiario.qTurmas.Open;

      DMDiario.qTurmas.GotoBookmark(lugar);

   end;
end;


procedure TDiarioView.sbCancelAvaClick(Sender: TObject);
begin
   DMDiario.qDescricoes.Cancel;
   Memo1.Text := DMDiario.html_entity_decode(DMDiario.qDescricoesds_avaliacao.AsString);
   tbCancelarDescricoes.Enabled := False;
   tbSalvarDescricoes.Enabled := False;
end;

procedure TDiarioView.sbOlhoTurmasProfClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   case pgPrincipal.TabIndex of
      0 : begin
         frmSelColunas.SelecionaColunas(DBGrid1, 'planilha_diario_turmas_professores');
      end;
   end;
end;

procedure TDiarioView.sbSalvaAvaClick(Sender: TObject);
var
   sAux : String;
begin
   sAux := Memo1.Text;
   sAux := StringReplace(sAux, CHAR(13)+CHAR(10), CHAR(10), [rfReplaceAll]);
   sAux := StringReplace(sAux, CHAR(13), CHAR(10), [rfReplaceAll]);

   DMDiario.qDescricoesds_avaliacao.AsString := sAux;
   DMDiario.qDescricoes.Edit;
   DMDiario.qDescricoes.Post;
   tbCancelarDescricoes.Enabled := False;
   tbSalvarDescricoes.Enabled := False;
end;

procedure TDiarioView.sbSelecionarColunaClick(Sender: TObject);
begin

   if PageControl1.ActivePage = TabSheet1 then
   begin
      Application.CreateForm(TfrmSelColunas, frmSelColunas);
      frmSelColunas.SelecionaColunas(DBGrid6, 'diario_notas_avaliacoes_campos');
   end
   else
   begin
      Application.CreateForm(TfrmCamposDiarioNotas, frmCamposDiarioNotas);
      frmCamposDiarioNotas.SelecionaColunas(UMGridNotas2, 'diario_notas_campos');
   end;

end;

procedure TDiarioView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FormCadAluno <> nil then
   begin
      FormCadAluno.Free;
      FormCadAluno := nil;
   end;

   FreeAndNil(DMDiario);
   Action := caFree;
end;

procedure TDiarioView.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if ( hasPendenciaNotas() ) OR ( hasPendenciaFrequencias() ) then
      CanClose := false
   Else
      DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TDiarioView.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TDiarioView.btnGrupoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
begin
   { Pesquisar Grupo }
   resultado_filtro := TfrmSelecionarGrupo.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   lngGrupo := resultado_filtro.cd_grupo;
   txtGrupo.Text := resultado_filtro.nm_grupo;

   Filtrar();
end;

procedure TDiarioView.btnOrdernarAulasClick(Sender: TObject);
const
   MsgSemRegistros = 'Antes de efetuar a ordenação é necessário utilizar os filtros para encontrar as aulas desejadas.';
   MsgConfirmacao = 'Deseja realmente efetuar a ordenação das aulas para todos os registros apresentados?';
   MsgSucesso = 'As aulas foram ordenadas com sucesso.';
   MsgErro = 'Ocorreu um erro e não foi possível efetuar a reordenação das aulas. Entre em contato com o suporte técnico.';
   SQLCallProcedure = 'CALL PROC_ORDER_AULAS(''%s'', %d, %d, %d)';
   EtiquetaRegistros = 'Processando registro %d de %d (%.2f%%)';
var
   S: AnsiString;
   Bookmark: TBookmark;
begin
   if DMDiario.qTurmas.IsEmpty then
   begin
      MessageDlg(MsgSemRegistros, mtInformation, [mbOK], 0);
      Exit;
   end;

   if MessageDlg(MsgConfirmacao, mtConfirmation, [mbYes, mbNo], 0) = ID_NO then
      Exit;

   Bookmark := DMDiario.qTurmas.GetBookmark;

   frmProcessando.Bar.Max := DMDiario.qTurmas.RecordCount;
   frmProcessando.Bar.Step := 1;
   frmProcessando.Bar.Position := 0;
   frmProcessando.Show;

   Application.ProcessMessages;

   DMDiario.qTurmas.First;

   while not DMDiario.qTurmas.Eof do
   begin

      frmProcessando.Bar.StepIt;
      frmProcessando.lblRegistros.Caption :=
      Format(EtiquetaRegistros, [
         DMDiario.qTurmas.RecNo,
         DMDiario.qTurmas.RecordCount,
         (DMDiario.qTurmas.RecNo / DMDiario.qTurmas.RecordCount * 100)
         ]);

      Application.ProcessMessages;

      S := Format(SQLCallProcedure, [
         DMDiario.qTurmasTURMA.AsString,
         DMDiario.qTurmasANOSEMESTRE.AsInteger,
         DMDiario.qTurmasDISCIPLINA.AsInteger,
         DMDiario.qTurmasBIMESTRE.AsInteger]);

      if not DM.db.ExecuteDirect(S) then
      begin
         MessageDlg(MsgErro, mtError, [mbOK], 0);
         frmProcessando.Close;
         DMDiario.qTurmas.GotoBookmark(Bookmark);
         Exit;
      end;

      DMDiario.qTurmas.Next;
   end;

   frmProcessando.Close;
   DMDiario.qTurmas.GotoBookmark(Bookmark);
   MessageDlg(MsgSucesso, mtConfirmation, [mbOK], 0);
end;

procedure TDiarioView.BloqueioFormula(Sender: TObject);
var
   Edit: TEdit;
begin
   Edit := TEdit(TCheckBox(Sender).Parent.FindComponent('Edit'));

   Edit.Enabled := not TCheckBox(Sender).Checked;
end;

procedure TDiarioView.pmQtdTurmasPopup(Sender: TObject);
begin
  DM.quantidade_registros(DMDiario.qTurmas, pmQtdTurmas);

end;

procedure TDiarioView.pmQtdAlunosPopup(Sender: TObject);
begin
  DM.quantidade_registros(DMDiario.qAlunos, pmQtdAlunos);

end;

procedure TDiarioView.pmQtdNotasDigitacaoPopup(Sender: TObject);
begin
  DM.quantidade_registros(DMDiario.qNotas, pmQtdNotasDigitacao);

end;

procedure TDiarioView.pmQtdNotasAvaliacoesPopup(Sender: TObject);
begin
  DM.quantidade_registros(DMDiario.qProvas, pmQtdNotasAvaliacoes);

end;

procedure TDiarioView.pmQtdFreqPopup(Sender: TObject);
begin
  DM.quantidade_registros(DMDiario.qDescricoes, pmQtdFreq);
end;

procedure TDiarioView.pmQtdFreqAulasPopup(Sender: TObject);
begin
  DM.quantidade_registros(DMDiario.qAulas, pmQtdFreqAulas);

end;

procedure TDiarioView.pmQtdNotas_LogsNovoPopup(Sender: TObject);
var
  Item: TMenuItem;
  chaves : string;
begin
  pmQtdNotas_LogsNovo.Items.Clear;
  Item := TMenuItem.Create(self);

  chaves := UMGridNotas2.GetValorStr('cd_pessoa') + ';' +
            UMGridNotas2.GetValorStr('turma') + ';' +
            UMGridNotas2.GetValorStr('nr_anosem') + ';' +
            UMGridNotas2.GetValorStr('disciplina') + ';' +
            UMGridNotas2.GetValorStr('bimestre') + ';';

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Add('SELECT l.*, p.nm_pessoa FROM logs l LEFT JOIN pessoas p ON (l.cd_usuario = p.cd_pessoa) WHERE l.cd_tipo = 4 AND l.cd_chave = ''' + chaves + '''');
  Dm.qAux1.SQL.Add('ORDER by dt_log ');
  Dm.qAux1.Open;

  if DM.qAux1.EOF then
  Begin
     Item.Caption := 'Nenhuma alteração foi registrada';
     pmQtdNotas_LogsNovo.Items.Add(Item);
  end
  else
  begin
     Item.Caption := 'Alterações registradas: ';
     pmQtdNotas_LogsNovo.Items.Add(Item);
     Item := TMenuItem.Create(self);
     Item.Caption := '-';
     pmQtdNotas_LogsNovo.Items.Add(Item);
  end;

  while not DM.qAux1.EOF do
  Begin

    Item := TMenuItem.Create(self);
    Item.Caption := FormatDateTime('dd/mm/yyyy hh:MM',DM.qAux1.FieldByName('dt_log').AsDateTime) + ':  ' + DM.qAux1.FieldByName('ds_log').AsSTring + '. Usuário: ' + DM.qAux1.FieldByName('nm_pessoa').AsSTring + '.';

    pmQtdNotas_LogsNovo.Items.Add(Item);
    Dm.qAux1.Next;
  End;

  if sn_professor_informar_motivo_media then
  begin

     Dm.qAux1.Close;
     Dm.qAux1.SQL.Clear;
     Dm.qAux1.SQL.Text := ''+
       'SELECT                                '+
       '  ds_motivo,                          '+
       '  dt_envio                            '+
       'FROM                                  '+
       '  ficha_motivo_ajuste                 '+
       'WHERE                                 '+
       '  cd_aluno = :cd_aluno                '+
       '  AND cd_bimestre = :cd_bimestre      '+
       '  AND cd_disciplina = :cd_disciplina  '+
       '  AND cd_turma = :cd_turma            '+
       '  AND nr_anosemestre = :nr_anosemestre';

     Dm.qAux1.ParamByName('cd_aluno').AsInteger         := UMGridNotas2.GetValorInt('cd_pessoa');
     Dm.qAux1.ParamByName('cd_bimestre').AsInteger      := UMGridNotas2.GetValorInt('bimestre');
     Dm.qAux1.ParamByName('cd_disciplina').AsInteger    := UMGridNotas2.GetValorInt('disciplina');
     Dm.qAux1.ParamByName('cd_turma').AsString          := UMGridNotas2.GetValorStr('turma');
     Dm.qAux1.ParamByName('nr_anosemestre').AsInteger   := UMGridNotas2.GetValorInt('nr_anosem');

     Dm.qAux1.Open;

     if ((not(DM.qAux1.Eof)) and (Length(dm.qAux1.FieldByName('ds_motivo').AsString)> 0)) then
     begin
        Item := TMenuItem.Create(self);
        Item.Caption := '-';
        pmQtdNotas_LogsNovo.Items.Add(Item);

        Item := TMenuItem.Create(self);
        Item.Caption := 'Ajuste da média realizado no dia ' + FormatDateTime('dd/mm/yyyy hh:MM',DM.qAux1.FieldByName('dt_envio').AsDateTime) + ', com o seguinte motivo informado:  ' + DM.qAux1.FieldByName('ds_motivo').AsString;
        pmQtdNotas_LogsNovo.Items.Add(Item);
     end;

  end;

end;

procedure TDiarioView.pmQtdNotas_LogsPopup(Sender: TObject);
var
  Item: TMenuItem;
  chaves : string;
begin
  pmQtdNotas_Logs.Items.Clear;
  Item := TMenuItem.Create(self);

  chaves := DMDiario.qNotasCODALUNO.AsString + ';' +
            DMDiario.qProvasTURMA.AsString + ';' +
            DMDiario.qProvasANOSEMESTRE.AsString + ';' +
            DMDiario.qProvasDISCIPLINA.AsString + ';' +
            DMDiario.qTurmasBIMESTRE.AsString + ';';

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Add('SELECT * from logs where cd_tipo = 4 AND cd_chave = ''' + chaves + '''');
  Dm.qAux1.SQL.Add('ORDER by dt_log ');
  Dm.qAux1.Open;

  if DM.qAux1.EOF then
  Begin
     Item.Caption := 'Nenhuma alteração foi registrada';
     pmQtdNotas_Logs.Items.Add(Item);
  end
  else
  begin
     Item.Caption := 'Alterações registradas: ';
     pmQtdNotas_Logs.Items.Add(Item);
     Item := TMenuItem.Create(self);
     Item.Caption := '-';
     pmQtdNotas_Logs.Items.Add(Item);
  end;

  while not DM.qAux1.EOF do
  Begin

    DM.FindUserCodigo(DM.qAux1.FieldByNAme('cd_usuario').AsInteger);

    Item := TMenuItem.Create(self);
    Item.Caption := FormatDateTime('dd/mm/yyyy hh:MM',DM.qAux1.FieldByName('dt_log').AsDateTime) + ' - ' + DM.tblUsuariosNome2.AsString + ':  ' + DM.qAux1.FieldByName('ds_log').AsSTring;

    pmQtdNotas_Logs.Items.Add(Item);
    Dm.qAux1.Next;
  End;


end;

procedure TDiarioView.btnAtualizaFrequenciaClick(Sender: TObject);
CONST
   MSG_PROGRESSO_ALUNOS = 'Aguarde enquanto o sistema calcula as frequências. Aluno %d de %d...';
   SQL_GET_PARAMETRO_AVALIACAO =
      ' SELECT apm.ds_frequencia_registro, apm.vl_hora_aula, apm.ds_frequencia_tipo                   ' +
      ' FROM turmas t                                                                                 ' +
      '   INNER JOIN fichaindividual f ON (f.turma = t.codigo AND f.anosemestre = t.anosemestre)      ' +
      '   INNER JOIN grades_disciplinas gd ON (gd.cd_disciplina = f.disciplina AND gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade)'+
      '   INNER JOIN avaliacoes_parametros_matriz apm ON (apm.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao))' +
      ' WHERE t.codigo LIKE :cd_turma AND t.anosemestre = :nr_anosemestre and f.disciplina = :disciplina';

var
   codigo, bimestre, anosemestre, disciplina, grupo, totalRegistros : integer;
   turma, turmamatricula: string;
   lugar : pointer;
   qyFrequencia, qyAlteraFreq, qyParametroAvaliacao : TUMZQuery;
begin

   if ( hasPendenciaFrequencias() ) then
      Exit;


   if Mensagem('Deseja atualizar as faltas?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
   Begin
      { Atualização da Ficha Individual }
      DM.CriarConsulta(qyFrequencia);
      DM.CriarConsulta(qyAlteraFreq);

      codigo := UMGridAulas2.GetValorInt('cd_pessoa');
      bimestre := UMGridAulas2.GetValorInt('cd_bimestre');
      disciplina := UMGridAulas2.GetValorInt('cd_disciplina');
      anosemestre := UMGridAulas2.GetValorInt('nr_anosem');
      turma := UMGridAulas2.GetValorStr('turma');
      turmamatricula := UMGridAulas2.GetValorStr('turma');
      grupo := DMDiario.qTurmasCD_GRUPO.AsInteger;

      DM.CriarConsulta(qyParametroAvaliacao);

      qyParametroAvaliacao.SQL.Text := SQL_GET_PARAMETRO_AVALIACAO;
      qyParametroAvaliacao.ParamByName('cd_turma').AsString := turma;
      qyParametroAvaliacao.ParamByName('nr_anosemestre').AsInteger := anosemestre;
      qyParametroAvaliacao.ParamByName('disciplina').AsInteger := disciplina;
      qyParametroAvaliacao.Open();

      with qyFrequencia do
      begin
         SQL.Add( ' SELECT daa.cd_pessoa, ' );
         SQL.Add( '        LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(GROUP_CONCAT(COALESCE(daa.ds_freq, "")), ",", ""), "C", ""), "P", ""), "-", "")) faltas ');
         SQL.Add( ' FROM diario_aulas_alunos daa ' );
         SQL.Add( '      INNER JOIN diario_aulas da ON ( ' );
         SQL.Add( '         daa.nr_anosem = da.anosemestre AND daa.cd_bimestre = da.bimestre AND ' );
         SQL.Add( '         daa.cd_turma = da.turma AND daa.cd_disciplina = da.disciplina AND ' );
         SQL.Add( '         daa.nr_aula = da.nro_aula) ' );
         SQL.Add( '      LEFT JOIN (SELECT cd_grupo, cd_pessoa FROM diario_grupos_pessoas WHERE cd_grupo = :CD_GRUPO GROUP BY cd_grupo, cd_pessoa) dgp ON ( ');
         SQL.Add( '         dgp.cd_grupo = da.cd_grupo AND ');
         SQL.Add( '         dgp.cd_pessoa = daa.cd_pessoa ');
         SQL.Add( '      ) ');
         SQL.Add( ' WHERE daa.nr_anosem = :ANOSEMESTRE AND daa.cd_bimestre = :BIMESTRE AND ' );
         SQL.Add( '       daa.cd_turma = :TURMA AND daa.cd_disciplina = :DISCIPLINA AND ' );
         SQL.Add( '       CASE WHEN :CD_GRUPO > 0 THEN dgp.cd_grupo = :CD_GRUPO ELSE 1=1 END AND ' );
         SQL.Add( '       CASE WHEN '+QuotedStr(qyParametroAvaliacao.FieldByName('ds_frequencia_tipo').AsString)+' = "A" THEN daa.ds_freq IS NOT NULL ELSE 1=1 END AND ');
         SQL.Add( '       da.data <= NOW() ' );

         //grupo
         if TSpeedButton(Sender).Tag = 1 then
            SQL.Add( ' AND daa.cd_pessoa = :CD_PESSOA ' );

         SQL.Add( ' GROUP BY daa.nr_anosem, daa.cd_turma, daa.cd_disciplina, daa.cd_pessoa, daa.cd_bimestre ' );

         if TSpeedButton(Sender).Tag = 1 then
            ParamByName('CD_PESSOA').AsInteger := codigo;

         ParamByName('ANOSEMESTRE').AsInteger := anosemestre;
         ParamByName('DISCIPLINA').AsInteger := disciplina;
         ParamByName('BIMESTRE').AsInteger := bimestre;
         ParamByName('TURMA').AsString := turma;
         ParamByName('CD_GRUPO').AsInteger := grupo;

         Open();
      end;

      { Verificar se selecionou o botão Calcular somente um ALUNO }
      Application.ProcessMessages;

      { Faça do primeiro aluno até o último }
      qyFrequencia.First;

      totalRegistros := qyFrequencia.RecordCount;
      TfSplash.GetInstancia().ShowSplashScreen('Cálculo de Frequência', Format(MSG_PROGRESSO_ALUNOS, [qyFrequencia.RecNo, totalRegistros]));

      try
         while not qyFrequencia.EOF do
         begin
            codigo := qyFrequencia.FieldByName('cd_pessoa').AsInteger;

            if qyParametroAvaliacao.FieldByName('ds_frequencia_registro').AsString = 'A' then
            begin
               with qyAlteraFreq do
               begin
                  Close();
                  SQL.Clear();

                  SQL.Add( ' UPDATE fichaindividual ' );
                  SQL.Add( ' SET falta'+inttostr(bimestre)+' = CASE WHEN sn_bloq_freq'+inttostr(bimestre)+' = 1 THEN falta'+inttostr(bimestre)+' ELSE :FALTAS END ' );
                  SQL.Add( ' WHERE anosemestre = :ANOSEMESTRE AND turma = :TURMA AND ' );
                  SQL.Add( '       disciplina = :DISCIPLINA AND ' );
                  SQL.Add( '       codigoaluno = :CD_PESSOA ' );

                  ParamByName( 'FALTAS' ).AsFloat := qyFrequencia.FieldByName('faltas').AsFloat * qyParametroAvaliacao.FieldByName('vl_hora_aula').AsFloat;
                  ParamByName( 'ANOSEMESTRE' ).AsInteger := anosemestre;
                  ParamByName( 'TURMA' ).AsString := turma;
                  ParamByName( 'DISCIPLINA' ).AsInteger := disciplina;
                  ParamByName( 'CD_PESSOA' ).AsInteger := codigo;

                  ExecSQL();
               end;
            end;

            { Calcular a média Final, individualmente por aluno }
            DM.TotalFaltas( codigo, turma, anosemestre );


            Dm.CalcularMediaFinal( codigo, anosemestre, grupo, turma, turmamatricula );

            qyFrequencia.Next;

            TfSplash.GetInstancia().SetSplashText(Format(MSG_PROGRESSO_ALUNOS, [qyFrequencia.RecNo, totalRegistros]));
         end;

         AtualizaDiarioFrequencias( Integer(CheckBox2.Checked) );
      except

         on E:Exception do
         begin
            TfSplash.GetInstancia().CloseSplashScreen();
            raise E;
         end;
      end;

      TfSplash.GetInstancia().CloseSplashScreen();

      { Atualizar a Turma }

      lugar := DMDiario.qTurmas.GetBookmark;

      DMDiario.qTurmas.Close();
      DMDiario.qTurmas.Open();

      DMDiario.qTurmas.GotoBookmark(lugar);

    End;
end;

end.
