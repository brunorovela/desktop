unit uFCadastroHorariosTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Forms, Controls,
  ComCtrls, Classes, Dialogs, ExtCtrls, StdCtrls, Buttons, UMComboBox,
  ImgList, ToolWin, Grids, UZDataset, uFSelecionarTurma, Menus,
  uDisciplina, Contnrs, uUCadastroHorariosTurma, DB, ZAbstractRODataset,
  ZAbstractDataset;

type
   TfrmCadastroHorariosTurma = class(TForm)
      Panel3: TPanel;
      Panel1: TPanel;
      lbTurma: TLabel;
      lbCategoria: TLabel;
      edTurma: TEdit;
      sbTurma: TSpeedButton;
      cbCategorias: TUMComboBox;
      lbAnoSemestre: TLabel;
      Panel2: TPanel;
      sgHorarios: TStringGrid;
      toolPessoa: TToolBar;
      ToolButton4: TToolButton;
      tbImportar: TToolButton;
      ToolButton1: TToolButton;
      btnFechar: TToolButton;
      ToolButton2: TToolButton;
      ImageList1: TImageList;
      lbShowAnosemestre: TLabel;
      pmDisciplinas: TPopupMenu;
      btnAlterar: TToolButton;
      ToolButton5: TToolButton;
      btnSalvar: TToolButton;
      ToolButton6: TToolButton;
      btnCancelar: TToolButton;
      dtpDataSimulacao: TDateTimePicker;
      cbSimularHorario: TCheckBox;
      odXMLUrania: TOpenDialog;
      procedure pmDisciplinasPopup(Sender: TObject);
      procedure dtpDataSimulacaoKeyPress(Sender: TObject; var Key: Char);

      procedure dtpDataSimulacaoCloseUp(Sender: TObject);
      procedure cbSimularHorarioClick(Sender: TObject);
      procedure sgHorariosMouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
      procedure btnSalvarClick(Sender: TObject);
      procedure tbImportarClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure sgHorariosClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure sbTurmaClick(Sender: TObject);
      procedure cbCategoriasSelect(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);

      procedure pmDisciplinasClick(Sender: TObject);
   const
      TITULO_TODAS_CATEGORIAS = 'TODAS AS CATEGORIAS';
      MENUITEM_NOVA_LEGENDA = '<Definir nova legenda>';
      MENUITEM_NOVA_SALA = '<Definir nova sala>';
      MENUITEM_REMOVER_SALA = '<Remover Sala>';
      MENUITEM_APAGAR = '<Apagar>';
      MENUITEM_INCLUIR_DISCIPLINA_OUTRA_TURMA = '<Incluir disciplina de outra turma>';

   strict private
      resultado_filtro_turma : TResultadoFiltroTurma;
      QtdItensAuxiliares, LinhaSelecionada, ColunaSelecionada : Integer;
      horario_turmas_checar_coincidencias : Boolean;

      HorariosTurma : THorariosTurmaGrid;

      function GetCategoriaFiltrada: String;
      function GetTurmaFiltrada: String;

      procedure CarregarCategorias();
      procedure CarregarDisciplinas();
      procedure CarregarHorariosTurma();

      procedure Filtrar(const BCarregarComboDisciplinas : Boolean = True);
      procedure MontarGrade(const ASFiltro : String = '');

      function ProfessorPossuiAulaNoHorario(const nr_linha, nr_coluna: Integer; const disciplina: TDisciplina): Boolean;

      property CategoriaFiltrada: String read GetCategoriaFiltrada;
      property TurmaFiltrada: String read GetTurmaFiltrada;
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmCadastroHorariosTurma: TfrmCadastroHorariosTurma;

implementation

uses uUMNucleo, uDM, uGeneral, uUsuario, General, Main, uFSelDisciplinaProfessor,
  uFDefinicaoNovaDataHorario, uListaExecucao, uUrania, uFSelCategoriaHorario, uFUraniaErros,
   uFReajusteAulasHorarios, uFSelecionarSala, uSala, uTurma, uHorario;

{$R *.dfm}

procedure TfrmCadastroHorariosTurma.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.CadHoraTurma', npAlterar, ( Sender <> nil ) ) then Exit;

   if edTurma.Text = '' then
   begin
      TGeneral.Mensagem('É necessário a seleção de uma turma.');
      Exit;
   end;

   HorariosTurma.Edit();
end;

procedure TfrmCadastroHorariosTurma.btnCancelarClick(Sender: TObject);
begin
   HorariosTurma.Revert();
   HorariosTurma.Draw();
end;

procedure TfrmCadastroHorariosTurma.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmCadastroHorariosTurma.btnSalvarClick(Sender: TObject);
const
   MSG_PERGUNTA_ALTERACAO_HORARIO =
      'Indique o motivo para a alteração de horário desta turma:';
   MSG_PERGUNTA_SALVAR_ALTERACOES =
      'Tem certeza de que deseja salvar as alterações?';
   MSG_EXCECAO_ERRO_SQL =
      'Ocorreu um erro no momento de salvar as alterações.' + #13 +
      'Nenhum dado foi alterado.' + #13 + #13 + 'Erro: %s';
var
   ListaExecucao : TListaExecucao;
   ListaDisciplinasHorarios : TStringList;
begin
   if ( HorariosTurma.Modo = mgNone ) then Exit;

   ListaExecucao := HorariosTurma.GetListaExecucao( resultado_filtro_turma.nr_anosemestre );
   ListaDisciplinasHorarios := HorariosTurma.GetListaHorariosDasDisciplinas();

   try
      if HorariosTurma.Modo = mgInsert then
      begin
         if TGeneral.Mensagem(MSG_PERGUNTA_SALVAR_ALTERACOES, '', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = mrYes then
         begin
            ListaExecucao.ExecuteAll();
            Filtrar(False);
         end;
      end
      else if HorariosTurma.Modo = mgEdit then
      begin
         case TGeneral.Mensagem(MSG_PERGUNTA_ALTERACAO_HORARIO, mtConfirmation, [mbYes, mbNo, mbCancel], ['Manutenção do horário atual', 'Novo horário após data específica', 'Cancelar'], 150, mbCancel) of
            mrYes: begin
               if TfrmReajusteAulasTurma.ajustarAulasHoras(ListaExecucao, ListaDisciplinasHorarios, resultado_filtro_turma.nr_anosemestre, resultado_filtro_turma.cd_turma) then
               begin
                  if TGeneral.Mensagem(MSG_PERGUNTA_SALVAR_ALTERACOES, '', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = mrYes then
                  begin
                     ListaExecucao.ExecuteAll();
                     Filtrar(False);
                  end;
               end;
            end;
            mrNo: begin
               if TfrmDefinicaoNovaDataHorario.definirNovoHorario(ListaExecucao, ListaDisciplinasHorarios, resultado_filtro_turma.nr_anosemestre, resultado_filtro_turma.cd_turma) then
               begin
                  if TGeneral.Mensagem(MSG_PERGUNTA_SALVAR_ALTERACOES, '', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = mrYes then
                  begin
                     ListaExecucao.ExecuteAll();
                     Filtrar(False);
                  end;
               end;
            end;
            mrCancel: Exit;
         end;
      end;
   except
      on E:Exception do
      begin
         if Pos('SQL Error', E.Message) > 0 then
         begin
            TGeneral.Mensagem(Format(MSG_EXCECAO_ERRO_SQL, [E.Message]), 'Atenção', MB_OK + MB_ICONEXCLAMATION, Handle);
         end else begin
            raise E;
         end;
      end;
   end;
end;

procedure TfrmCadastroHorariosTurma.CarregarCategorias;
const
   SQL_CARREGAR_CATEGORIAS =
      ' SELECT DISTINCT ds_categoria FROM horarios ' +
      ' WHERE TRIM(ds_categoria) <> '''' AND sn_ativo = 1 ' +
      ' ORDER BY ds_categoria ';
var
   qyCategorias: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyCategorias);

   qyCategorias.SQL.Text := SQL_CARREGAR_CATEGORIAS;
   qyCategorias.Open;

   cbCategorias.Enabled := not qyCategorias.IsEmpty;

   if cbCategorias.Enabled then
   begin
      cbCategorias.Items.Add(TITULO_TODAS_CATEGORIAS);

      while not qyCategorias.Eof do
      begin
         cbCategorias.Items.Add(qyCategorias.FieldByName('ds_categoria').AsString);
         qyCategorias.Next;
      end;
   end;

   cbCategorias.ItemIndex := 0;
   cbCategoriasSelect(cbCategorias);

   FreeAndNil(qyCategorias);
end;

procedure TfrmCadastroHorariosTurma.CarregarDisciplinas;
const
   SQL_GET_DISCIPLINAS =
      ' SELECT gc.cd_disciplina AS disciplina, d.sigla, d.descricao, ' +
      '        p.cd_pessoa as cd_professor, t.curso, ' +
      '        COALESCE(p.nm_pessoa, ''<professor não definido>'') as nm_professor '+
      ' FROM grades_disciplinas gc ' +
      '      INNER JOIN disciplinas d ON (d.codigo = gc.cd_disciplina AND d.curso = gc.cd_curso) '+
      '  	 INNER JOIN turmas t ON ( ' +
      '		    t.serie = gc.nr_serie AND t.curso = gc.cd_curso  AND gc.cd_grade = t.cd_grade ' +
      '  	 ) ' +
      '  	 LEFT JOIN turmasprofessores tp ON ( ' +
      '		    tp.anosemestre = t.anosemestre AND tp.disciplina = gc.cd_disciplina AND tp.curso = t.curso AND ' +
      '		    tp.anosemestre = t.anosemestre AND tp.curso = t.curso AND tp.turma = t.codigo ' +
      '      ) ' +
      '  	 LEFT JOIN pessoas p ON (p.cd_pessoa = tp.professor) ' +
      ' WHERE gc.cd_curso = :cd_curso AND t.anosemestre = :nr_anosemestre AND ' +
      '       t.codigo = :cd_turma AND gc.sn_optativa = 0 AND t.cd_coligada IN ( %s ) ' +
      ' ORDER BY d.descricao ';
   SQL_GET_DISCIPLINAS_OPTATIVAS =
      ' SELECT DISTINCT tdo.cd_disciplina_optativa AS disciplina, d.sigla, ' +
      '        CONCAT(d.descricao, '' ('',t.codigo,'')'') descricao, ' +
      '        p.cd_pessoa as cd_professor, t.codigo turma_optativa, t.curso, ' +
      '        COALESCE(p.nm_pessoa, ''<professor não definido>'') as nm_professor ' +
      ' FROM turmas_disciplinas_optativas tdo ' +
      '      INNER JOIN turmas tm ON ( ' +
		'         tm.anosemestre = tdo.nr_anosemestre AND ' +
      '         tm.curso = tdo.cd_curso AND tm.codigo = tdo.cd_turma ' +
      '      ) ' +
      '      INNER JOIN turmas t ON ( ' +
      '         t.curso = tdo.cd_curso AND t.anosemestre = tdo.nr_anosemestre AND ' +
      '         t.serie = -100 AND t.cd_grade = tm.cd_grade ' +
      '      ) ' +
      '      INNER JOIN disciplinas d ON ( ' +
      '         d.codigo = tdo.cd_disciplina_optativa AND d.curso = tdo.cd_curso ' +
      '      ) ' +
      '      LEFT JOIN turmasprofessores tp ON ( ' +
      '         tp.anosemestre = t.anosemestre AND tp.curso = t.curso AND ' +
      '         tp.disciplina = d.codigo AND tp.turma = t.codigo ' +
      '      ) ' +
      '      LEFT JOIN pessoas p ON (p.cd_pessoa = tp.professor) ' +
      ' WHERE tdo.nr_anosemestre = :nr_anosemestre AND ' +
      '       tdo.cd_curso LIKE :cd_curso AND tdo.cd_turma LIKE :cd_turma AND ' +
      '       t.cd_coligada IN ( %s ) ' +
      ' ORDER BY d.descricao ';
var
   qyGetDisciplinas : TUMZReadOnlyQuery;
   disciplina : TDisciplina;
   sala : TSala;

   procedure AdicionarItemPopup(const Texto: String; const nr_tag: Integer = -1; const disciplina : TDisciplina = nil);
   var
      Item : TMenuItemDisciplina;
   begin
      Item := TMenuItemDisciplina.Create(pmDisciplinas, disciplina);
      Item.Caption := Texto;
      if (disciplina <> nil) AND (disciplina.adicionais.sala <> nil) then
      begin
         Item.Caption := Item.Caption + ' - Sala: ' + TGeneral.LimitString(disciplina.adicionais.sala.Descricao, 40);
      end;

      Item.OnClick := pmDisciplinasClick;

      if nr_tag < 0 then
      begin
         Item.Tag := pmDisciplinas.Tag
      end else begin
         Item.Tag := nr_tag;
      end;

      pmDisciplinas.Tag := pmDisciplinas.Tag + 1;

      pmDisciplinas.Items.Add(Item);
   end;
begin
   DM.CriarConsulta(qyGetDisciplinas);


   pmDisciplinas.Items.Clear();
   pmDisciplinas.Tag := 1;

   AdicionarItemPopup(MENUITEM_APAGAR); // 1
   AdicionarItemPopup(MENUITEM_INCLUIR_DISCIPLINA_OUTRA_TURMA); // 2
   AdicionarItemPopup(MENUITEM_NOVA_LEGENDA); // 3
   AdicionarItemPopup(MENUITEM_NOVA_SALA); // 4
   AdicionarItemPopup(MENUITEM_REMOVER_SALA); // 5

   {ATENÇÃO: Esta linha sempre deve ficar acima do Bloco de inclusão de disciplinas na POPUP,
              pois ela deve contem somente a quantidade de itens da POPUP desconsiderando disciplinas.
              Qual quer novo item opcional, deve ser inserido acima desta linha}
   QtdItensAuxiliares := pmDisciplinas.Items.Count;


   {
      INCLUSÃO DE DISCIPLINAS NORMAIS
   }
   qyGetDisciplinas.SQL.Text := Format(SQL_GET_DISCIPLINAS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);

   qyGetDisciplinas.ParamByName('cd_curso').AsString := resultado_filtro_turma.cd_curso;
   qyGetDisciplinas.ParamByName('cd_turma').AsString := resultado_filtro_turma.cd_turma;
   qyGetDisciplinas.ParamByName('nr_anosemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;

   qyGetDisciplinas.Open();

   while not qyGetDisciplinas.Eof do
   begin
      disciplina := TDisciplina.Create(
         qyGetDisciplinas.FieldByName('disciplina').AsInteger,
         qyGetDisciplinas.FieldByName('descricao').AsString,
         qyGetDisciplinas.FieldByName('curso').AsString,
         qyGetDisciplinas.FieldByName('sigla').AsString
      );

      disciplina.adicionais.cd_turma := resultado_filtro_turma.cd_turma;
      disciplina.adicionais.cd_turma_base := resultado_filtro_turma.cd_turma;
      disciplina.adicionais.cd_professor := qyGetDisciplinas.FieldByName('cd_professor').AsInteger;
      disciplina.adicionais.sala := TTurma.Create(resultado_filtro_turma).GetSalaAutomatico(disciplina, False);

      AdicionarItemPopup(
         qyGetDisciplinas.FieldByName('sigla').AsString + ' - ' +
         qyGetDisciplinas.FieldByName('descricao').AsString + ' - ' +
         qyGetDisciplinas.FieldByName('nm_professor').AsString, 0,
         disciplina);

      qyGetDisciplinas.Next();
   end;

   {
      INCLUSÃO DE DISCIPLINAS OPTATIVAS
   }
   qyGetDisciplinas.Close();
   qyGetDisciplinas.SQL.Text := Format(SQL_GET_DISCIPLINAS_OPTATIVAS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);

   qyGetDisciplinas.ParamByName('cd_curso').AsString := resultado_filtro_turma.cd_curso;
   qyGetDisciplinas.ParamByName('cd_turma').AsString := resultado_filtro_turma.cd_turma;
   qyGetDisciplinas.ParamByName('nr_anosemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;

   qyGetDisciplinas.Open();

   while not qyGetDisciplinas.Eof do
   begin
      disciplina := TDisciplina.Create(
         qyGetDisciplinas.FieldByName('disciplina').AsInteger,
         qyGetDisciplinas.FieldByName('descricao').AsString,
         qyGetDisciplinas.FieldByName('curso').AsString,
         qyGetDisciplinas.FieldByName('sigla').AsString
      );

      disciplina.adicionais.cd_turma := resultado_filtro_turma.cd_turma;
      disciplina.adicionais.cd_turma_base := resultado_filtro_turma.cd_turma;
      disciplina.adicionais.cd_professor := qyGetDisciplinas.FieldByName('cd_professor').AsInteger;
      disciplina.adicionais.sala := TTurma.Create(resultado_filtro_turma).GetSalaAutomatico(disciplina, False);

      AdicionarItemPopup(
         qyGetDisciplinas.FieldByName('sigla').AsString + ' - ' +
         qyGetDisciplinas.FieldByName('descricao').AsString + ' - ' +
         qyGetDisciplinas.FieldByName('nm_professor').AsString, 0,
         disciplina);

      qyGetDisciplinas.Next();
   end;

   FreeAndNil(qyGetDisciplinas);
end;

procedure TfrmCadastroHorariosTurma.CarregarHorariosTurma;
const
   SQL_TURMAS_HORARIOS =
      ' SELECT h.codigo AS cd_horario, th.nr_dia_semana AS dia_semana, th.cd_turma AS turma, ' +
      '        d.codigo, d.sigla, d.descricao, d.curso, us.id as cd_sala, ' +
      '        th.cd_turma_base AS turma_base, th.ds_legenda, th.cd_professor  as cd_professor' +
      ' FROM turmas_horarios_config th ' +
      '      INNER JOIN horarios h ON ( h.codigo = th.cd_horario ) ' +
      '      INNER JOIN turmas t ON ( ' +
      '          t.codigo = th.cd_turma AND t.anosemestre = th.nr_anosemestre ' +
      '      ) ' +
      '      INNER JOIN disciplinas d ON ( ' +
      '          d.codigo = th.cd_disciplina AND d.curso = t.curso ' +
      '      ) ' +
      '      LEFT JOIN unim_sala us ON (us.id = th.cd_sala) ' +
      ' WHERE th.nr_anosemestre = :nr_anosemestre AND ' +
      '       th.cd_turma_base = :cd_turma AND t.cd_coligada IN ( %s ) ' +
      '       %s ' +
      ' ORDER BY codigo, dia_semana ';
var
   qyGetTurmasHorarios : TUMZReadOnlyQuery;
   SFiltro : String;
   disciplina : TDisciplina;
begin
   DM.CriarConsulta(qyGetTurmasHorarios);

   if cbSimularHorario.Checked then
   begin
      SFiltro := ' AND IS_HORARIO_TURMA_ATIVA(:dt_simulacao, th.dt_inicial, th.dt_final, th.sn_ativo) = 1 ';
   end else begin
      SFiltro := ' AND th.sn_ativo = 1 ';
   end;

   if ( CategoriaFiltrada <> TITULO_TODAS_CATEGORIAS ) AND ( cbCategorias.ItemIndex <> -1 ) then
   begin
      SFiltro := SFiltro + Format(' AND h.ds_categoria = %s ', [QuotedStr(CategoriaFiltrada)]);
   end;

   qyGetTurmasHorarios.SQL.Text := Format(SQL_TURMAS_HORARIOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), SFiltro]);
   qyGetTurmasHorarios.ParamByName('nr_anosemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;
   qyGetTurmasHorarios.ParamByName('cd_turma').AsString := resultado_filtro_turma.cd_turma;

   if cbSimularHorario.Checked then
   begin
      qyGetTurmasHorarios.ParamByName('dt_simulacao').AsDateTime := dtpDataSimulacao.DateTime;
   end;

   qyGetTurmasHorarios.Open();

   while not qyGetTurmasHorarios.Eof do
   begin
      if ( HorariosTurma.HorarioExiste( qyGetTurmasHorarios.FieldByName('cd_horario').AsInteger ) ) then
      begin
         HorariosTurma.DefinirLegenda(
            qyGetTurmasHorarios.FieldByName('cd_horario').AsInteger,
            qyGetTurmasHorarios.FieldByName('dia_semana').AsInteger,
            qyGetTurmasHorarios.FieldByName('ds_legenda').AsString
         );

         if NOT(qyGetTurmasHorarios.FieldByName('cd_sala').IsNull) then
         begin
            HorariosTurma.DefinirSala(
               qyGetTurmasHorarios.FieldByName('cd_horario').AsInteger,
               qyGetTurmasHorarios.FieldByName('dia_semana').AsInteger,
               TSala.Create(qyGetTurmasHorarios.FieldByName('cd_sala').AsInteger)
            );
         end;

         disciplina := TDisciplina.Create(
            qyGetTurmasHorarios.FieldByName('codigo').AsInteger,
            qyGetTurmasHorarios.FieldByName('descricao').AsString,
            qyGetTurmasHorarios.FieldByName('curso').AsString,
            qyGetTurmasHorarios.FieldByName('sigla').AsString,
            qyGetTurmasHorarios.FieldByName('cd_professor').AsInteger
         );

         disciplina.adicionais.cd_turma := qyGetTurmasHorarios.FieldByName('turma').AsString;
         disciplina.adicionais.cd_turma_base := qyGetTurmasHorarios.FieldByName('turma_base').AsString; 

         HorariosTurma.AdicionarDisciplina(
            qyGetTurmasHorarios.FieldByName('cd_horario').AsInteger,
            qyGetTurmasHorarios.FieldByName('dia_semana').AsInteger,
            disciplina
         );
      end;

      qyGetTurmasHorarios.Next();
   end;

   HorariosTurma.Draw();

   btnAlterar.Enabled := not cbSimularHorario.Checked;

   FreeAndNil(qyGetTurmasHorarios);
end;

procedure TfrmCadastroHorariosTurma.cbCategoriasSelect(Sender: TObject);
begin
   if ( CategoriaFiltrada = TITULO_TODAS_CATEGORIAS ) then
   begin
      if ( TurmaFiltrada <> '' ) then
      begin
         Filtrar(False);
      end else begin
         MontarGrade();
      end;
   end else begin
      if TurmaFiltrada <> '' then
      begin
         Filtrar(False);
      end;
   end;
end;

procedure TfrmCadastroHorariosTurma.cbSimularHorarioClick(Sender: TObject);
begin
   Filtrar(False);
end;

procedure TfrmCadastroHorariosTurma.dtpDataSimulacaoCloseUp(Sender: TObject);
begin
   Filtrar(False);
end;

procedure TfrmCadastroHorariosTurma.dtpDataSimulacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      dtpDataSimulacaoCloseUp(nil);
   end;
end;

procedure TfrmCadastroHorariosTurma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadastroHorariosTurma.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   MSG_PERGUNTA_FECHAR_SEM_SALVAR =
      'Você está editando os horários da turma. Deseja sair sem salvar?';
begin
   CanClose := btnFechar.Enabled OR
               ( TGeneral.Mensagem(MSG_PERGUNTA_FECHAR_SEM_SALVAR, '', MB_YESNO + MB_ICONQUESTION, Handle) = mrYes );
end;

procedure TfrmCadastroHorariosTurma.FormCreate(Sender: TObject);
begin
   dtpDataSimulacao.DateTime := Now();                                        
   HorariosTurma := THorariosTurmaGrid.Create(sgHorarios);

   horario_turmas_checar_coincidencias := (Dm.variavel_parametro('horario_turmas_checar_coincidencias') = 'S');

   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(btnAlterar, HorariosTurma, False));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(btnSalvar, HorariosTurma, True));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(btnCancelar, HorariosTurma, True));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(btnFechar, HorariosTurma, False));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(cbCategorias, HorariosTurma, False));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(sbTurma, HorariosTurma, False));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(cbSimularHorario, HorariosTurma, False));
   HorariosTurma.Subject.RegisterObserver(TComponentHorariosTurmasObserver.Create(dtpDataSimulacao, HorariosTurma, False));

   CarregarCategorias();

   ToolButton4.Visible := (DM.variavel_parametro('horario_integracao_urania') = 'S');
   tbImportar.Visible := ToolButton4.Visible;

   lbAnoSemestre.Visible := DM.UsaAnosemestre;
   lbShowAnosemestre.Visible := lbAnoSemestre.Visible;
end;

procedure TfrmCadastroHorariosTurma.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F7: if tbImportar.Visible then tbImportarClick(nil);
      VK_F3: if btnAlterar.Enabled then btnAlterarClick(nil);
      VK_F5: if btnSalvar.Enabled then btnSalvarClick(nil);
      VK_F6: if btnCancelar.Enabled then btnCancelarClick(nil);
      VK_F12 : if btnFechar.Enabled then btnFecharClick(nil);
   end;
end;

procedure TfrmCadastroHorariosTurma.FormShow(Sender: TObject);
begin
   lbAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre();
   lbShowAnosemestre.Visible := lbAnoSemestre.Visible;
end;

function TfrmCadastroHorariosTurma.GetCategoriaFiltrada: String;
begin
   Result := cbCategorias.Items[cbCategorias.ItemIndex];
end;

function TfrmCadastroHorariosTurma.GetTurmaFiltrada: String;
begin
   Result := edTurma.Text;
end;

procedure TfrmCadastroHorariosTurma.MontarGrade(const ASFiltro : String);
const
   SQL_CARREGAR_HORARIOS =
      ' SELECT codigo, ds_horario, hr_inicio FROM horarios ' +
      ' WHERE sn_ativo = 1 %s ORDER BY ds_horario ';
var
   I: Integer;
   qyGetHorarios : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetHorarios);
   if ASFiltro = '' then
   begin
      qyGetHorarios.SQL.Text := Format(SQL_CARREGAR_HORARIOS, ['']);
   end else begin
      qyGetHorarios.SQL.Text := Format(SQL_CARREGAR_HORARIOS, ['AND ' + ASFiltro]);
   end;

   qyGetHorarios.Open();

   HorariosTurma.Clear();
   while not qyGetHorarios.Eof do
   begin
      HorariosTurma.AddHorario(THorarioDiaSemana.Create(
         qyGetHorarios.FieldByName('codigo').AsInteger,
         qyGetHorarios.FieldByName('ds_horario').AsString,
         qyGetHorarios.FieldByName('hr_inicio').AsString
      ));

      qyGetHorarios.Next();
   end;

   HorariosTurma.Draw();

   FreeAndNil(qyGetHorarios);
end;

procedure TfrmCadastroHorariosTurma.pmDisciplinasClick(Sender: TObject);
const
   MSG_NOVA_LEGENDA = 'Defina uma nova legenda:';
   MSG_TITULO_NOVA_LEGENDA = 'Nova Legenda';
   MSG_TURMA_POSSUI_DISCIPLINA_HORARIO = 'Esta turma ja possui uma disciplina neste horário. Deseja elimina-la?';
   MSG_HORARIO_POSSUI_DISCIPLINA = 'Este horário já possui a disciplina %s.';
   MSG_HORARIO_JA_POSSUI_SALA =
      'ATENÇÃO! Você acabou de adicionar uma nova disciplina ao qual possui uma sala diferente da sala atualmente registrada.' + #13 +
      '     Sala Atual: %s' + #13 + '     Nova Sala: %s' + #13 + #13 + 'Deseja substituir a Sala Atual pela Nova Sala?';
var
   Item, Coluna, Linha, LICodDisciplina, LICodProfessor, contador : Integer;
   ds_legenda, LSCodTurma, LSSigla, LSDescricao, LSCurso: String;
   disciplina : TDisciplina;
   resultadoSala : TResultadoFiltroSala;
   sala, salaNova : TSala;

   procedure AdicionarDisciplina(const LDisciplina : TDisciplina);
   begin
      if ( HorariosTurma.TemDisciplinaGrid(Linha, Coluna, LDisciplina) ) then
      begin
         TGeneral.Mensagem(Format(MSG_HORARIO_POSSUI_DISCIPLINA, [LDisciplina.Descricao]), '', MB_OK + MB_ICONINFORMATION, Handle);
         Exit;
      end;

      if horario_turmas_checar_coincidencias AND ProfessorPossuiAulaNoHorario(Linha, Coluna, LDisciplina) then
      begin
         Exit;
      end;

      if ( HorariosTurma.GetQtdDisciplinasGrid(Linha, Coluna) > 0 ) then
      begin
         case TGeneral.Mensagem(MSG_TURMA_POSSUI_DISCIPLINA_HORARIO, 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) of
            mrYes: HorariosTurma.LimparDisciplinas(Linha, Coluna);
            mrCancel: Exit;
         end;
      end;

      HorariosTurma.AdicionarDisciplinaGrid(Linha, Coluna, LDisciplina);
   end;
begin
   Item := TMenuItemDisciplina(Sender).MenuIndex;
   {
      Como existe a ação de capturar a Coluna & Linha selecionada no OnClick e no MouseMOVE,
      Quando damos mensagem de alerta o sistema pode perder a linha inicial que o usuário havia clicado,
      com isso, guardamos então, antes de mais nada a linha que o mesmo clicou
   }
   Coluna := ColunaSelecionada;
   Linha := LinhaSelecionada;

   if Item = 0 then // Limpar Disciplinas
   begin
      HorariosTurma.LimparDisciplinas(Linha, Coluna);
   end
   else if Item = 1 then // Incluir disciplina de outra Turma
   begin
      LSCodTurma := resultado_filtro_turma.cd_turma;
      LSSigla := '';
      LICodDisciplina := 0;
      LICodProfessor := 0;

      if TfSelDisciplinaProfessor.SelecionaDisciplina(Self, LSCodTurma, LSSigla,
            LSDescricao, LSCurso, LICodDisciplina, LICodProfessor,
            IntToStr(resultado_filtro_turma.nr_anosemestre)) then
      begin
         disciplina := TDisciplina.Create( LICodDisciplina, LSDescricao, LSCurso, LSSigla );
         disciplina.adicionais.cd_turma := LSCodTurma;
         disciplina.adicionais.cd_turma_base := resultado_filtro_turma.cd_turma;
         disciplina.adicionais.cd_professor := LICodProfessor;

         AdicionarDisciplina(disciplina);
      end;
   end
   else if Item = 2 then // Alterar Legenda
   begin
      ds_legenda := HorariosTurma.GetLegendaGrid(Linha, Coluna);
      if not InputQuery( MSG_TITULO_NOVA_LEGENDA, MSG_NOVA_LEGENDA, ds_legenda ) then
         Exit;

      while ( Length(ds_legenda) > 50 ) do
      begin
         if Length(ds_legenda) > 50 then
            Mensagem( 'A legenda não pode ter mais de 50 caracteres.', '', MB_OK + MB_ICONEXCLAMATION, Handle );
         
         if not InputQuery( MSG_TITULO_NOVA_LEGENDA, MSG_NOVA_LEGENDA, ds_legenda ) then
            Exit;
      end;

      HorariosTurma.DefinirLegendaGrid(Linha, Coluna, ds_legenda);
   end
   else if Item = 3 then // Alterar Sala
   begin
      resultadoSala := TfrmSelecionarSala.Filtrar([]);

      if resultadoSala.filtrado then
      begin
         if resultadoSala.sala.PerguntarContinuarConflito(resultadoSala.sala.GetConflitos(
               TTurma.Create(resultado_filtro_turma),
               THorario.Create(HorariosTurma.FindHorarioLinhaGrid(Linha-1).Codigo),
               nil,
               Coluna-1,
               tccTurmaHorario
            )) then
         begin
            HorariosTurma.DefinirSalaGrid(Linha, Coluna, resultadoSala.sala);
         end;
      end;
   end
   else if Item = 4 then // Limpar Sala
   begin
      HorariosTurma.DefinirSalaGrid(Linha, Coluna, nil);
   end else begin
      AdicionarDisciplina(TMenuItemDisciplina(Sender).Disciplina);

      if HorariosTurma.GetQtdDisciplinasGrid(Linha, Coluna) = 1 then
      begin
         sala := TMenuItemDisciplina(Sender).Disciplina.adicionais.sala;

         if sala <> nil then
         begin
            HorariosTurma.DefinirSalaGrid(Linha, Coluna, sala);
         end;
      end
      else if (HorariosTurma.GetQtdDisciplinasGrid(Linha, Coluna) > 1) then
      begin
         salaNova := TMenuItemDisciplina(Sender).Disciplina.adicionais.sala;

         if (salaNova <> nil) then
         begin
            sala := HorariosTurma.GetSalaGrid(Linha, Coluna);

            if (sala = nil) then
            begin
               HorariosTurma.DefinirSalaGrid(Linha, Coluna, salaNova);
            end else begin
               if (salaNova.Codigo <> sala.Codigo) AND
                  (Mensagem(Format(MSG_HORARIO_JA_POSSUI_SALA, [sala.Descricao, salaNova.Descricao]),
                            'ATENÇÃO', MB_YESNO + MB_ICONEXCLAMATION, Handle) = mrYes) then
               begin
                  HorariosTurma.DefinirSalaGrid(Linha, Coluna, salaNova);
               end;
            end;
         end;
      end;
   end;
end;

procedure TfrmCadastroHorariosTurma.pmDisciplinasPopup(Sender: TObject);
var
   I : Integer;
begin
   pmDisciplinas.Items[4].Visible := pmDisciplinas.Items[3].Caption <> MENUITEM_NOVA_SALA;

   for I := QtdItensAuxiliares to pmDisciplinas.Items.Count - 1 do
   begin
      pmDisciplinas.Items[I].Checked := False;

      if (HorariosTurma.TemDisciplinaGrid(LinhaSelecionada, ColunaSelecionada, TMenuItemDisciplina(pmDisciplinas.Items[I]).Disciplina)) then
      begin
         pmDisciplinas.Items[I].Checked := True;
      end;
   end;
end;

function TfrmCadastroHorariosTurma.ProfessorPossuiAulaNoHorario(const nr_linha,
  nr_coluna: Integer; const disciplina: TDisciplina): Boolean;
const
   MSG_PROFESSOR_POSSUI_AULA_NO_HORARIO =
      'Não é possível registrar este horário.'+#13+'O professor desta disciplina já possui aula neste horário com a turma %s';
   MSG_PROFESSOR_POSSUI_AULA_NO_HORARIO_TEM_PERMISSAO_CONFLITO =
      'O professor desta disciplina já possui aula neste horário com a turma %s.' + #13 +
      'Deseja continuar mesmo assim?';
   SQL_PROFESSOR_POSSUI_AULA_NO_HORARIO =
      ' SELECT thc.cd_turma_base ' +
      ' FROM turmas_horarios_config thc ' +
      ' WHERE nr_anosemestre = :nr_anosemestre AND cd_horario = :cd_horario AND ' +
      '       nr_dia_semana = :nr_dia_semana AND cd_professor = :cd_professor AND ' +
      '       cd_turma_base != :cd_turma_base AND sn_ativo = 1';
var
   qyProfessorPossuiAulaNoHorario : TUMZReadOnlyQuery;
begin
   if NOT( disciplina.adicionais.cd_professor > 0 ) then
   begin
      Result := False;
      Exit;
   end;

   DM.CriarConsulta(qyProfessorPossuiAulaNoHorario);

   qyProfessorPossuiAulaNoHorario.SQL.Text := SQL_PROFESSOR_POSSUI_AULA_NO_HORARIO;

   qyProfessorPossuiAulaNoHorario.ParamByName('nr_anosemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;
   qyProfessorPossuiAulaNoHorario.ParamByName('cd_horario').AsInteger := THorarioDiaSemana(HorariosTurma.GetListaHorarios[nr_linha-1]).Codigo;
   qyProfessorPossuiAulaNoHorario.ParamByName('nr_dia_semana').AsInteger := nr_coluna-1;
   qyProfessorPossuiAulaNoHorario.ParamByName('cd_professor').AsInteger := disciplina.adicionais.cd_professor;
   qyProfessorPossuiAulaNoHorario.ParamByName('cd_turma_base').AsString := resultado_filtro_turma.cd_turma;

   qyProfessorPossuiAulaNoHorario.Open();

   Result := qyProfessorPossuiAulaNoHorario.RecordCount > 0;

   if Result then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.UsuarioLogado.Pessoa.Codigo, 'Academico.CadastroHorarioTurmaConflitoProfessor', npIncluir, False) then
      begin
         if TGeneral.Mensagem(Format(
            MSG_PROFESSOR_POSSUI_AULA_NO_HORARIO_TEM_PERMISSAO_CONFLITO, [ qyProfessorPossuiAulaNoHorario.FieldByName('cd_turma_base').AsString ] ),
            'Atenção', MB_YESNO + MB_ICONWARNING) = mrYes then
         begin
            Result := False;
         end;
      end else begin
         TGeneral.Mensagem(Format(
            MSG_PROFESSOR_POSSUI_AULA_NO_HORARIO, [ qyProfessorPossuiAulaNoHorario.FieldByName('cd_turma_base').AsString ] ),
            'Atenção', MB_OK + MB_ICONWARNING);
      end;
   end;

   FreeAndNil(qyProfessorPossuiAulaNoHorario);
end;

procedure TfrmCadastroHorariosTurma.sbTurmaClick(Sender: TObject);
begin
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro_turma.filtrado then
   begin
      if lbShowAnosemestre.Visible then
      begin
         lbShowAnosemestre.Caption :=
            Copy(IntToStr( resultado_filtro_turma.nr_anosemestre ), 1, 4) + '/' +
            Copy(IntToStr( resultado_filtro_turma.nr_anosemestre ), 5, 1);
      end else begin
         lbShowAnosemestre.Caption := IntToStr( resultado_filtro_turma.nr_anosemestre );
      end;

      edTurma.Text := resultado_filtro_turma.cd_turma;

      cbSimularHorario.Checked := False;

      Filtrar();
   end;
end;

procedure TfrmCadastroHorariosTurma.sgHorariosClick(Sender: TObject);
var
   Pt: TPoint;
begin
   if edTurma.Text = '' then
   begin
      TGeneral.Mensagem('É necessário a seleção de uma turma.');
      Exit;
   end;

   if btnAlterar.Enabled then
   begin
      TGeneral.Mensagem('Você deve clicar no botão alterar para prosseguir com as alterações.');
      Exit;
   end;

   if cbSimularHorario.Enabled then
   begin
      TGeneral.Mensagem('Você não pode realizar alterações de horários com a opção "' + cbSimularHorario.Caption + '" marcada.');
      Exit;
   end;

   TGeneral.GetColunaLinhaGrid(sgHorarios, ColunaSelecionada, LinhaSelecionada);
   GetCursorPos(Pt);
   pmDisciplinas.Popup(Pt.x, Pt.y);
end;

procedure TfrmCadastroHorariosTurma.sgHorariosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
   MSG_HINT_PADRAO = 'Passe o mouse sobre as aulas para verificar sua legenda.';
var
   ds_legenda: String;
   sala: TSala;
begin
   sgHorarios.Hint := MSG_HINT_PADRAO;
   PrincipalForm.pnlMsg.Font.Style := [];

   TGeneral.GetColunaLinhaGrid(sgHorarios, ColunaSelecionada, LinhaSelecionada);

   // Sai da função se ainda não preencheu os itens do Popup, ou se não é um campo válido da Grid
   if ( pmDisciplinas.Items.Count < 4 ) OR ( ColunaSelecionada < 2 ) OR ( LinhaSelecionada < 1 ) then
      Exit;

   ds_legenda := HorariosTurma.GetLegendaGrid(LinhaSelecionada, ColunaSelecionada);
   sala := HorariosTurma.GetSalaGrid(LinhaSelecionada, ColunaSelecionada);

   pmDisciplinas.Items.Items[2].Caption := MENUITEM_NOVA_LEGENDA;
   pmDisciplinas.Items.Items[3].Caption := MENUITEM_NOVA_SALA;

   // Se o horário atual não possuir disciplina, bloqueia as opções de Legenda e Apagar
   pmDisciplinas.Items.Items[2].Enabled := HorariosTurma.GetQtdDisciplinasGrid(LinhaSelecionada, ColunaSelecionada) > 0;
   pmDisciplinas.Items.Items[3].Enabled := pmDisciplinas.Items.Items[2].Enabled;
   pmDisciplinas.Items.Items[0].Enabled :=  pmDisciplinas.Items.Items[2].Enabled;

   if ( Length(Trim( ds_legenda )) > 0 ) then
   begin
      sgHorarios.Hint := 'Legenda: ' + ds_legenda;
      PrincipalForm.pnlMsg.Font.Style := [fsBold];
      pmDisciplinas.Items.Items[2].Caption := MENUITEM_NOVA_LEGENDA + ' Atual: ' + ds_legenda;
   end;

   if ( sala <> nil ) then
   begin
      if sgHorarios.Hint = MSG_HINT_PADRAO then
      begin
         sgHorarios.Hint := 'Sala: ' + sala.Descricao;
      end else begin
         sgHorarios.Hint := sgHorarios.Hint + ' / Sala: ' + sala.Descricao;
      end;
      PrincipalForm.pnlMsg.Font.Style := [fsBold];
      pmDisciplinas.Items.Items[3].Caption := MENUITEM_NOVA_SALA + ' Atual: ' + TGeneral.LimitString(sala.Descricao, 40); 
   end;
end;

procedure TfrmCadastroHorariosTurma.tbImportarClick(Sender: TObject);
const
   MSG_CATEGORIA_NSELECIONADA =
      'Categoria de horários não selecionada.'+ #13 +
      'O processo de importação dos horários foi cancelado.';
   MSG_ARQUIVO_NSELECIONADO =
      'Não foi selecionado o arquivo para importação.' + #13 +
      'O processo de importação dos horários foi cancelado.';
   MSG_CONFIRMACAO =
      'Tem certeza de que deseja prosseguir com o processo de importação dos horários?' + #13 + #13 +
      'Esta ação apagará quaisquer horários previamente cadastrados quando houver coincidência com os dados importados.' + #13 + #13 +
      'Deseja prosseguir?';
   MSG_INFO_CANCELADO =
      'A importação dos horários não foi executada.';
   MSG_INFO_IMPORTADO =
      'O processo de importação dos horários foi finalizado.';
var
   LSCategoria, SAnoSemestre: string;
   LUMUraniaXML: TUMUraniaXML;
   nr_anosemestre : Integer;
begin
   if resultado_filtro_turma.filtrado then
   begin
      nr_anosemestre := resultado_filtro_turma.nr_anosemestre;
   end else begin
      SAnoSemestre := '';
      while NOT(TryStrToInt(SAnoSemestre, nr_anosemestre)) do
      begin
         if NOT(InputQuery( Application.Title, 'Digite o Ano/Semestre (aaaas)', SAnoSemestre)) then
         begin
            Exit;
         end;
      end;
   end;

   if TfSelCategoriaHorario.GetCategoria(Self, LSCategoria) then
   begin
      if Self.odXMLUrania.Execute then
      begin
         if Mensagem(MSG_CONFIRMACAO, 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2, Self.Handle) = ID_YES then
         begin
            LUMUraniaXML := TUMUraniaXML.Create(nr_anosemestre, LSCategoria, Self);
            try
               LUMUraniaXML.CarregaXML(Self.odXMLUrania.FileName);
               if not LUMUraniaXML.Executa then
                  TfUraniaErros.VerificaErros(Self, LUMUraniaXML.UraniaImportacao);
            finally
               LUMUraniaXML.Free;
            end;
            Filtrar(False);
            Mensagem(MSG_INFO_IMPORTADO, 'Informação', MB_ICONINFORMATION + MB_OK, Self.Handle);
         end
         else
            Mensagem(MSG_INFO_CANCELADO, 'Informação', MB_ICONINFORMATION + MB_OK, Self.Handle);
      end
      else
         Mensagem(MSG_ARQUIVO_NSELECIONADO, 'Informação', MB_ICONINFORMATION + MB_OK, Self.Handle);
   end
   else
   begin
      Mensagem(MSG_CATEGORIA_NSELECIONADA, 'Informação', MB_ICONINFORMATION + MB_OK, Self.Handle);
   end;
end;

procedure TfrmCadastroHorariosTurma.Filtrar(const BCarregarComboDisciplinas : Boolean);
begin
   if resultado_filtro_turma.filtrado then
   begin
      if BCarregarComboDisciplinas then
      begin
         CarregarDisciplinas();
      end;

      if ( CategoriaFiltrada = TITULO_TODAS_CATEGORIAS ) OR ( cbCategorias.ItemIndex = -1 ) then
      begin
         MontarGrade();
      end else begin
         MontarGrade(Format('ds_categoria = %s', [QuotedStr(CategoriaFiltrada)]));
      end;
      
      CarregarHorariosTurma();
   end;
end;

end.
