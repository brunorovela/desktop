unit uCadPresencas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
   StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
   ZAbstractDataset, ZDataset, UZDataset, Buttons, CheckLst, jpeg, Contnrs,
   uListaHorarios, uDisciplina, UMRadioButton, uDMDiario, uUCadPresenca, UMAjuda,
  UMDateTimePicker;

type


   Tfrm_Presencas = class(TForm)
      Bevel3: TBevel;
      Bevel7: TBevel;
      pnTitulo: TPanel;
      toolPessoa: TToolBar;
      ToolButton1: TToolButton;
      btnFechar: TToolButton;
      ImageList1: TImageList;
      pmQtd: TPopupMenu;
      Bevel2: TBevel;
      qyPessoas: TUMZQuery;
      qyPessoascd_pessoa: TIntegerField;
      qyPessoasnm_pessoa: TStringField;
      qyPessoasturma: TStringField;
      srcPessoas: TDataSource;
      qyPessoasanosemestre: TSmallintField;
      qyPessoascurso: TStringField;
      ToolButton4: TToolButton;
      btnSalvar: TToolButton;
      qyHorarios: TUMZReadOnlyQuery;
      qyListaAulasAluno: TUMZReadOnlyQuery;
      Splitter1: TSplitter;
      pnFiltros: TPanel;
      Label3: TLabel;
      Label6: TLabel;
      sbFiltroTurma: TSpeedButton;
      Label2: TLabel;
      sbFiltroAluno: TSpeedButton;
      EDcd_turma: TEdit;
      EDcd_aluno: TEdit;
      Label5: TLabel;
      txtAnoSemestre: TMaskEdit;
      UpDown2: TUpDown;
      Label7: TLabel;
      edBimentre: TEdit;
      udBimestre: TUpDown;
      Bevel1: TBevel;
      Panel1: TPanel;
      grd: TDBGrid;
      pnHorarios: TScrollBox;
      lblList_0: TLabel;
      lblList_1: TLabel;
      lblList_2: TLabel;
      chk_0: TUMRadioButton;
      chk_1: TUMRadioButton;
      chk_2: TUMRadioButton;
      pnAulasExtras: TLabel;
      UMAjuda1: TUMAjuda;
    umdtData: TUMDateTimePicker;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    BtnAplicarPresencaTurma: TButton;
    procedure BtnAplicarPresencaTurmaClick(Sender: TObject);
    procedure umdtDataChangeDate(Sender: TObject);
      procedure qyPessoasAfterScroll(DataSet: TDataSet);
      procedure qyPessoasAfterOpen(DataSet: TDataSet);
      procedure qyPessoasBeforeScroll(DataSet: TDataSet);
      procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
         var Accept: Boolean);
      procedure Splitter1Moved(Sender: TObject);
      procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
      procedure udBimestreMouseLeave(Sender: TObject);
      procedure udBimestreMouseEnter(Sender: TObject);
      procedure udBimestreClick(Sender: TObject; Button: TUDBtnType);
      procedure udBimestreChanging(Sender: TObject; var AllowChange: Boolean);
      procedure UpDown2MouseLeave(Sender: TObject);
      procedure UpDown2MouseEnter(Sender: TObject);
      procedure pnHorariosMouseLeave(Sender: TObject);
      procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
         MousePos: TPoint; var Handled: Boolean);
      procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
         MousePos: TPoint; var Handled: Boolean);
      procedure grdMouseEnter(Sender: TObject);
      procedure pnHorariosMouseEnter(Sender: TObject);
      procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure srcPessoasDataChange(Sender: TObject; Field: TField);
      procedure mcDataCloseUp(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure btnFecharClick(Sender: TObject);
      procedure sbFiltroAlunoClick(Sender: TObject);
      procedure imBaixoClick(Sender: TObject);
      procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
      procedure sbFiltroTurmaClick(Sender: TObject);
      procedure EDcd_turmaKeyPress(Sender: TObject; var Key: Char);
      procedure EDcd_alunoKeyPress(Sender: TObject; var Key: Char);
      procedure grdKeyPress(Sender: TObject; var Key: Char);
      procedure edBimentreChange(Sender: TObject);
      procedure txtAnoSemestreChange(Sender: TObject);
      procedure SelecionouTodos( Sender : TObject);
   strict private
      cd_pessoa_filtrada : Integer;
      ponteiroCallbackError: Pointer;
      DataAtual : TDateTime;
      ScrollFocada : TScrollBox;
      FEditando : Boolean;
      cursoTurma: String;

  private
      function getTipoAulaPadrao(cd_curso, cd_turma: String;
         nr_anosemestre, cd_disciplina: Integer): Integer;
      
      procedure GerarAulasConformeGradeHorarios(dataAula: TDateTime);
      { Private declarations }
      procedure SetEditando(const Value: Boolean);

      procedure FiltraAluno;
      procedure FiltraTurma;

      procedure SelecionarEtapa;

      procedure SelecionarTurmaAluno(const cd_pessoa: Integer);

      procedure CarregarHorariosAulasBanco();
      procedure CarregarAulasAluno();

      procedure LimparListaHorarios();

      procedure OnClickFrequencia(Sender: TObject);

      function Salvar(const refreshQuery: Boolean = True): Boolean;
      procedure GerarPresencaAlunosTurma;
      procedure AlterarPresencaAlunosTurma;

      procedure MontarChecks(ListaHorarios: TListaHorarios);

      property Editando : Boolean read FEditando write SetEditando;

   public
      { Public declarations }

   end;

var
   frm_Presencas: Tfrm_Presencas;

implementation

uses Main, uDM, uFSelecionarPessoa, Math, StrUtils, uFSelecionarTurma, uFreq,
   uUMNucleo, uHorario, uListaDisciplinas, uGeneral, uListaExecucao;

{$R *.dfm}


procedure Tfrm_Presencas.FormShow(Sender: TObject);
begin
   DM.TodasMaiusculas(TForm(Sender));

   DataAtual := DM.DataAtual();

//   umdtData. := DataAtual;
   umdtData.Date := DataAtual;

   txtAnoSemestre.Text := IntToStr( ano_semestre );
   udBimestre.Position := DM.getEtapaAtual(1);
   edBimentre.Text := IntToStr(udBimestre.Position);

   FiltraTurma();
end;

procedure Tfrm_Presencas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   { Apagando todos os check-boxes }
   Action := caFree;
end;

procedure Tfrm_Presencas.FormCreate(Sender: TObject);
begin
   ScrollFocada := nil;

   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
      { Insere log de acesso ao diário }
      DMDiario.inserirLogAcesso;
   end;
end;

procedure Tfrm_Presencas.FormDestroy(Sender: TObject);
begin
   ScrollFocada := nil;
end;

procedure Tfrm_Presencas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F12 : btnFecharClick( nil );
      VK_F5  : btnSalvarClick( nil );
   end;
end;

procedure Tfrm_Presencas.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
   if ScrollFocada = nil then Exit;

   with ScrollFocada.VertScrollBar do
   begin
      if ( Position <= ( Range - Increment ) ) then
         Position := Position + (Increment*2)
      else
         Position := Range - (Increment*2);
   end;
end;

procedure Tfrm_Presencas.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
   if ScrollFocada = nil then Exit;

   with ScrollFocada.VertScrollBar do
   begin
      if ( Position >= Increment ) then
         Position := Position - (Increment*2)
      else
         Position := 0;
   end;
end;

procedure Tfrm_Presencas.btnSalvarClick(Sender: TObject);
begin
   Salvar();
end;

procedure Tfrm_Presencas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Presencas.sbFiltroAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      EDcd_aluno.Text := IntToStr( resultado_filtro.cd_pessoa );
      EDcd_turma.Text := resultado_filtro.cd_turma;

      if resultado_filtro.cd_turma = '' then
      begin
         SelecionarTurmaAluno(resultado_filtro.cd_pessoa);
      end else begin
         cd_pessoa_filtrada := StrToInt( EDcd_aluno.Text );
         FiltraTurma;
      end;
   end;
end;

procedure Tfrm_Presencas.FiltraAluno;
begin
   Editando := False;
   CarregarHorariosAulasBanco();
   CarregarAulasAluno();
   grd.SetFocus;

   // Guardar a data que conseguiu selecionar
   DataAtual := umdtData.Date;
end;

procedure Tfrm_Presencas.SelecionouTodos( Sender : TObject );
var
   I : Integer;
begin
   for I := Self.ComponentCount - 1 downto 0 do
   begin
      if (Self.Components[ I ] is TRadioButtonHorarioDisciplina) AND
         { GroupIndex > 0 representa os RadioButtons de horários }
         (TRadioButtonHorarioDisciplina(Self.Components[ I ]).GroupIndex > 0) then
      begin
         if NOT(TRadioButtonHorarioDisciplina( Self.Components[ I ] ).Enabled) then
            Continue;

         if ( TRadioButtonHorarioDisciplina( Self.Components[ I ] ).Tag = TUMRadioButton(Sender).Tag ) then
         begin
            TRadioButtonHorarioDisciplina( Self.Components[ I ] ).Checked := True;;
         end;
      end;
   end;
end;

procedure Tfrm_Presencas.SetEditando(const Value: Boolean);
begin                        
   btnSalvar.Enabled := Value;
   FEditando := Value;
end;

procedure Tfrm_Presencas.Splitter1CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
   pnHorarios.Visible := False;
end;

procedure Tfrm_Presencas.Splitter1Moved(Sender: TObject);
begin
   pnHorarios.Visible := True;
end;

procedure Tfrm_Presencas.srcPessoasDataChange(Sender: TObject; Field: TField);
begin
   EDcd_aluno.Text := qyPessoascd_pessoa.AsString;
   FiltraAluno();
end;

procedure Tfrm_Presencas.MontarChecks(ListaHorarios: TListaHorarios);
var
   IHorario, IDisciplina, IAulas, NroTab, WidthRadioButton : Integer;
   DistanciaTop, ItemIndex, GroupIndexHorarios : Integer;
   LListaDisciplinas : TListaDisciplinas;
   LDisciplina : TDisciplina;
   LHorario : THorario;
begin
   ItemIndex := 0;
   GroupIndexHorarios := 1;
   DistanciaTop := 40;
   NroTab := chk_2.Tag + 1;


   for IHorario := 0 to ListaHorarios.Count - 1 do
   begin
      LHorario := ListaHorarios.Items[IHorario];
      LListaDisciplinas := LHorario.adicionais.ListaDisciplinas;

      if ( LHorario.Codigo = -1 ) AND NOT(pnAulasExtras.Visible) then
      begin
         Inc(DistanciaTop, 50);

         pnAulasExtras.Top := DistanciaTop;
         pnAulasExtras.Visible := True;
         UMAjuda1.Visible := True;
      end;

      for IDisciplina := 0 to LListaDisciplinas.Count - 1 do
      begin
         LDisciplina := LListaDisciplinas.Items[IDisciplina];

         for IAulas := 1 to LDisciplina.adicionais.qtd_aulas do
         begin
            Inc(DistanciaTop, 25);

            with TRadioButtonHorarioDisciplina.Create( Self, LDisciplina, LHorario.Codigo,
                  IAulas, LHorario.adicionais.cd_turma_horario, 'C', LHorario.adicionais.cd_turma ) do
            begin
               Tag := 0;
               Parent := pnHorarios;
               Visible := False;
               Left := 5;
               Name := 'chk_' + IntToStr(ItemIndex) + '_0';
               Top := DistanciaTop;
               TabOrder := NroTab;
               Caption := '';
               OnMouseEnter := pnHorariosMouseEnter;
               OnClick := OnClickFrequencia;
               GroupIndex := GroupIndexHorarios;
               Visible := True;
               Width := 14;
               Enabled := NOT(LDisciplina.adicionais.sn_frequencia_bloqueada);
               SendToBack;
            end;

            Inc(ItemIndex);
            Inc(NroTab);

            with TRadioButtonHorarioDisciplina.Create( Self, LDisciplina, LHorario.Codigo,
                     IAulas, LHorario.adicionais.cd_turma_horario, 'F', LHorario.adicionais.cd_turma ) do
            begin
               Tag := 1;
               Parent := pnHorarios;
               Visible := False;
               Left := 25;
               Name := 'chk_' + IntToStr(ItemIndex) + '_1';
               Top := DistanciaTop;
               TabOrder := NroTab;
               Caption := '';
               OnMouseEnter := pnHorariosMouseEnter;
               OnClick := OnClickFrequencia;
               GroupIndex := GroupIndexHorarios;
               Visible := True;
               Width := 14;
               Enabled := NOT(LDisciplina.adicionais.sn_frequencia_bloqueada);
               SendToBack;
            end;

            Inc(ItemIndex);
            Inc(NroTab);

            with TRadioButtonHorarioDisciplina.Create( Self, LDisciplina, LHorario.Codigo,
                     IAulas, LHorario.adicionais.cd_turma_horario, '-', LHorario.adicionais.cd_turma ) do
            begin
               Tag := 2;
               Parent := pnHorarios;
               Visible := False;
               Left := 45;
               Name := 'chk_' + IntToStr(ItemIndex) + '_2';
               Top := DistanciaTop;
               TabOrder := NroTab;
               SendToBack;

               if ( LHorario.Codigo = -1 ) AND LDisciplina.adicionais.sn_aula_extra then
               begin
                  Caption := LDisciplina.Descricao + ' - ' + LeftStr(LDisciplina.adicionais.ds_assunto_aula, 40);
                  if ( Length(LDisciplina.adicionais.ds_assunto_aula) > 40 ) then
                     Caption := Caption + '...';

                  Hint := 'Assunto da Aula: ' + LDisciplina.adicionais.ds_assunto_aula;
               end else begin
                  Hint := '';
                  if (LHorario.Codigo = -1) AND (LDisciplina.adicionais.objeto is THorario) then
                  begin
                        Caption := Format('%s às %s - %s (%s)', [
                        THorario(LDisciplina.adicionais.objeto).GetHoraInicioFormatada(),
                        THorario(LDisciplina.adicionais.objeto).GetHoraFimFormatada(),
                        LDisciplina.Descricao,
                        THorario(LDisciplina.adicionais.objeto).Descricao
                     ]);
                  end else begin
                     Caption := Format('%s às %s - %s (%s)', [
                        LHorario.GetHoraInicioFormatada(),
                        LHorario.GetHoraFimFormatada(),
                        LDisciplina.Descricao,
                        LHorario.Descricao
                     ]);
                  end;
               end;

               Width := 700;
               Enabled := NOT(LDisciplina.adicionais.sn_frequencia_bloqueada);
               WidthRadioButton := Left + Width; 

               OnMouseEnter := pnHorariosMouseEnter;
               OnClick := OnClickFrequencia;
               GroupIndex := GroupIndexHorarios;

               { Verificando se faltou/compareceu e habilitando }
               Visible := True;

               if (LHorario.Codigo = -1) then
               begin
                  LabelAdicional := TLabel.Create( Self );
                  with LabelAdicional do
                  begin
                     Parent := pnHorarios;
                     Visible := True;
                     Left := WidthRadioButton + 10;
                     Top := DistanciaTop;

                     if LDisciplina.adicionais.sn_aula_extra then
                     begin
                        Caption := '(aula extra)';
                     end else begin
                        Caption := '(aula excedida)';
                     end;

                     Font.Style := [fsBold];
                  end;
               end;
            end;

            Inc(ItemIndex);
            Inc(NroTab);
            Inc(GroupIndexHorarios);

         end;
      end;
   end;

   { Faz com que o sistema processe todas as mensagens pendentes antes de prosseguir.
     Esta técnica auxilia para que o Delphi não de erro de componente já existente
     durante a criação de componentes dinâmicas, pois, desta forma, todas as informações de UM aluno
     será processada, antes de iniciar o próxima (isso durante o Scroll) }
   Application.ProcessMessages();
end;



procedure Tfrm_Presencas.OnClickFrequencia(Sender: TObject);
begin
   Editando := True;
end;

procedure Tfrm_Presencas.pnHorariosMouseEnter(Sender: TObject);
begin
   ScrollFocada := pnHorarios;
   pnHorarios.SetFocus;
end;

procedure Tfrm_Presencas.pnHorariosMouseLeave(Sender: TObject);
begin
   ScrollFocada := nil;
end;

procedure Tfrm_Presencas.qyPessoasAfterOpen(DataSet: TDataSet);
begin
   ponteiroCallbackError := nil;
end;

procedure Tfrm_Presencas.qyPessoasAfterScroll(DataSet: TDataSet);
var
   bkpPonteiroCallbackError : Pointer;
begin
   if (ponteiroCallbackError <> nil) then
   begin
      { É necessário criar um backup do Ponteiro e usa-lo ao invés do original,
         pois, o original devemos retornar para NIL, para que na próxima passagem dessa função ela não seja executada
         e assim não fique em loop infinito } 
      bkpPonteiroCallbackError := ponteiroCallbackError;
      ponteiroCallbackError := nil;

      if qyPessoas.BookmarkValid(bkpPonteiroCallbackError) then
      begin
         qyPessoas.GotoBookmark(bkpPonteiroCallbackError);
      end;
   end;
end;

procedure Tfrm_Presencas.qyPessoasBeforeScroll(DataSet: TDataSet);
const
   MSG_BLOQUEIO =
      'Você está em modo de edição. Deseja salvar as alterações antes de ir para o próximo aluno?';
begin
   if Editando AND
      ( Mensagem(MSG_BLOQUEIO, '', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = mrYes) then
   begin
      if NOT(Salvar(False)) then
      begin
         { Em caso de erro ao salvar o registro, definimos um pointer de Callback para a query.
            Ou seja, quando o evento AfterScroll ocorrer, ele vai voltar o usuário atual }
         ponteiroCallbackError := qyPessoas.GetBookmark;
      end;
   end;
end;

procedure Tfrm_Presencas.FiltraTurma;
begin
   qyPessoas.Close();

   if Length(Trim(EDcd_turma.Text)) = 0 then
   begin
      Exit;
   end;

   qyPessoas.ParamByName( 'cd_pessoa' ).AsInteger := cd_pessoa_filtrada;
   qyPessoas.ParamByName( 'nr_anosemestre' ).AsString := txtAnoSemestre.Text;
   qyPessoas.ParamByName( 'cd_turma' ).AsString := EDcd_turma.Text;

   qyPessoas.Open;

   if (qyPessoas.RecordCount = 0) AND (cd_pessoa_filtrada > 0) AND
      (Length(Trim(EDcd_aluno.Text)) = 0) then
   begin
      EDcd_aluno.Text := IntToStr(cd_pessoa_filtrada);
   end;

   lblList_0.visible := true;
   lblList_1.visible := true;
   lblList_2.visible := true;

   chk_0.visible := true;
   chk_1.visible := true;
   chk_2.visible := true;

   SelecionarEtapa;

   {bAtualizandoTodos := false;}
end;

procedure Tfrm_Presencas.SelecionarEtapa();
const
   GET_ETAPA_PRAZO_DIARIO =
      'SELECT dpt.cd_tipo_prazo FROM dia_prazos_turmas dpt INNER JOIN dia_prazos dp ON (dp.cd_prazo = dpt.cd_prazo) WHERE dpt.nr_anosemestre = :nr_anosemestre AND '+
      '  dpt.cd_turma LIKE :cd_turma AND :dt_selecionada BETWEEN dp.dt_inicio_etapa AND dp.dt_fim_etapa GROUP BY dpt.cd_tipo_prazo';
var
   qyEtapa: TUMZReadOnlyQuery;
begin

   DM.CriarConsulta(qyEtapa);
   qyEtapa.SQL.Text := GET_ETAPA_PRAZO_DIARIO;
   qyEtapa.ParamByName('nr_anosemestre').AsInteger := StrToIntDef(txtAnoSemestre.Text, -1);
   qyEtapa.ParamByName('cd_turma').AsString := EDcd_turma.Text;
   qyEtapa.ParamByName('dt_selecionada').AsDate := umdtData.Date;

   qyEtapa.Open;

   // Verifica se o anosemestre/turma/data selecionados possui apenas um prazo do diário de prazos, nesse caso selecionada o prazo
   if qyEtapa.RecordCount = 1 then
   begin
      // Modifica o bimestre e carregas as informações novamente
      edBimentre.Text := qyEtapa.FieldByName('cd_tipo_prazo').AsString;
      FiltraAluno();
   end else begin
      Mensagem('Atenção: A turma selecionada está em mais de um prazo do diário de classe ou não encontra-se em nenhum prazo para a data informada. Favor confira a etapa selecionada em tela antes de realizar qualquer atribuição de frequências.');
   end;

end;

procedure Tfrm_Presencas.SelecionarTurmaAluno(const cd_pessoa: Integer);
const
   GET_LISTA_TURMAS_ALUNO =
      'SELECT turma FROM matriculas WHERE codigoaluno = :cd_pessoa AND anosemestre = :nr_anosemestre';
var
   qyListaTurmas : TUMZReadOnlyQuery;
   lista_turmas_selecao : TListInputQueryCheck;
begin
   if cd_pessoa = -1 then
   begin
      cd_pessoa_filtrada := 0;
      EDcd_aluno.Text := '';
      qyPessoas.Close();

      if Length(Trim(EDcd_aluno.Text)) = 0 then
      begin
         FiltraTurma();
      end;

      Exit;
   end;


   cd_pessoa_filtrada := cd_pessoa;

   DM.CriarConsulta(qyListaTurmas);
   qyListaTurmas.SQL.Text := GET_LISTA_TURMAS_ALUNO;
   qyListaTurmas.ParamByName('cd_pessoa').AsInteger := cd_pessoa_filtrada;
   qyListaTurmas.ParamByName('nr_anosemestre').AsInteger := StrToIntDef(txtAnoSemestre.Text, -1);


   qyListaTurmas.Open();

   if qyListaTurmas.RecordCount = 0 then
   begin
      Mensagem('O aluno não possui turma neste ano/semestre.');
   end
   else if qyListaTurmas.RecordCount = 1 then
   begin
      EDcd_turma.Text := qyListaTurmas.FieldByName('turma').AsString;
   end else begin
      lista_turmas_selecao := TListInputQueryCheck.Create;
      while not qyListaTurmas.Eof do
      begin
         lista_turmas_selecao.Add( TInputQueryCheck.Create( lista_turmas_selecao.Count+1, qyListaTurmas.FieldByName('turma').AsString ) );
         qyListaTurmas.Next();
      end;

      while ( lista_turmas_selecao.Quantidade[True] <> 1 ) AND
            ( TGeneral.InputQueryListCheck('Turmas do Aluno', 'Selecione a Turma que deseja listar', lista_turmas_selecao, True) ) do
      begin
         if ( lista_turmas_selecao.Quantidade[True] = 0 ) then
         begin
            Mensagem( 'É necessário selecionar uma turma.', '', MB_OK + MB_ICONEXCLAMATION, Handle );
         end
         else if ( lista_turmas_selecao.Quantidade[True] = 1 ) then
         begin
            EDcd_turma.Text := TInputQueryCheck(lista_turmas_selecao.GetObjetosSelecionados().Items[0]).Descricao;
         end;
      end;
   end;

   FreeAndNil(qyListaTurmas);

   FiltraTurma;
end;

function Tfrm_Presencas.Salvar(const refreshQuery: Boolean): Boolean;
var
   I : Integer;
   radio : TRadioButtonHorarioDisciplina;
   listaDiarioAulas : TListaAulas;
   listaExecucao : TListaExecucaoAulas;
   listaFrequencia: TStringList;
   Freq: TRecFreq;

begin
   listaExecucao := TListaExecucaoAulas.Create;
   listaDiarioAulas := TListaAulas.Create;
   listaFrequencia := TStringList.Create;

   Result := False;

   // Gera aulas conforme a lógica de Geração de Aulas conf. grade de horários
   GerarAulasConformeGradeHorarios(umdtData.Date);

   // Salva as frequências preenchidas para o aluno
   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (Self.Components[ I ] is TRadioButtonHorarioDisciplina) AND
         { GroupIndex > 0 representa os RadioButtons de horários }
         (TRadioButtonHorarioDisciplina(Self.Components[ I ]).GroupIndex > 0) then
      begin
         radio := TRadioButtonHorarioDisciplina(Self.Components[ I ]);

         if radio.Checked then
         begin
            listaFrequencia.Add(IntToStr(I));
         end;
      end;
   end;

   // Recarrega as checks agora que as aulas foram criadas carregando o número das aulas
   FiltraAluno;

   // Seta as frequencias das aulas novamente na tela
   for I := 0 to listaFrequencia.Count-1 do
   begin
      radio := TRadioButtonHorarioDisciplina(Self.Components[ StrToInt(listaFrequencia[I]) ]);
      radio.Checked := true;
   end;

   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (Self.Components[ I ] is TRadioButtonHorarioDisciplina) AND
         { GroupIndex > 0 representa os RadioButtons de horários }
         (TRadioButtonHorarioDisciplina(Self.Components[ I ]).GroupIndex > 0) then
      begin
         radio := TRadioButtonHorarioDisciplina(Self.Components[ I ]);

         if (radio.Disciplina.adicionais.cd_diario_aula = 0) then
         begin
            if radio.Checked then
            begin
               if listaExecucao.GetAulaExistente(radio.Turma,
                     qyPessoasanosemestre.AsInteger, radio.Disciplina.Codigo,
                     StrToInt(edBimentre.Text), qyPessoascd_pessoa.AsInteger, umdtData.Date) <> nil
               then
               begin
                  listaExecucao.GetAulaExistente(radio.Turma,
                     qyPessoasanosemestre.AsInteger, radio.Disciplina.Codigo,
                     StrToInt(edBimentre.Text),
                     qyPessoascd_pessoa.AsInteger, umdtData.Date).AddFreq(radio.FreqPadrao).AddTurmaHorario(radio.TurmaHorario);
               end;
            end;

            Continue;
         end;

         { Para não ocorrer de duplicar os registros no array para validação,
           tomamos como base só os campos de 'C' para inserção } 
         if radio.FreqPadrao = 'C' then
         begin
            listaDiarioAulas.AddDiarioAula(radio.Disciplina.adicionais.cd_diario_aula);
         end;

         if radio.Checked then
         begin
            listaDiarioAulas.GetDiarioAula(radio.Disciplina.adicionais.cd_diario_aula).AddFreq(radio.FreqPadrao);
         end;
      end;
   end;

   try
      if listaDiarioAulas.RegistrosValidos() then
      begin
         for I := 0 to Length(listaDiarioAulas.ListaDiarioAulas) - 1 do
         begin
            listaExecucao.Add(TAlterarFrequenciaAula.Create(
               listaDiarioAulas.ListaDiarioAulas[I].DiarioAula,
               listaDiarioAulas.ListaDiarioAulas[I].Frequencia,
               qyPessoascd_pessoa.AsInteger
            ));
         end;

         if listaExecucao.ExecuteAll() then
         begin             
            Editando := False;

            if refreshQuery then
               qyPessoas.Refresh();

            TRecFreq.CalcularFrequenciaAluno(
               qyPessoasanosemestre.AsInteger,
               StrToInt(edBimentre.Text),
               qyPessoasturma.AsString,
               qyPessoascd_pessoa.AsInteger
            );


            Result := True;
            Mensagem('As alterações foram salvas com sucesso.');
         end;
      end else begin
         Mensagem('Existem dados não preenchidos. É necessário selecionar a frequência corretamente para todos os horários do Aluno.', '', MB_OK + MB_ICONINFORMATION, Handle);
      end;
   except
      on E:Exception do
      begin
         Mensagem('Ocorreu um erro na tentativa de salvar os dados na base de dados: ' + E.Message, 'Erro', MB_ICONERROR + MB_OK, Handle);
      end;
   end;
end;

procedure Tfrm_Presencas.BtnAplicarPresencaTurmaClick(Sender: TObject);
begin
  GerarPresencaAlunosTurma();
end;

procedure Tfrm_Presencas.GerarPresencaAlunosTurma;
begin
  try
    if (umdtData.Date <= 0) then
      raise Exception.Create('Informe a data para registro.');

    if (Trim(txtAnoSemestre.Text) = EmptyStr) then
      raise Exception.Create('Informe o ano/semestre.');

    if (Trim(edBimentre.Text) = EmptyStr) then
      raise Exception.Create('Informe a etapa.');

    if (EDcd_turma.Text = EmptyStr) then
      raise Exception.Create('Informe a turma.');

     // Gera aulas conforme a lógica de Geração de Aulas conf. grade de horários
     GerarAulasConformeGradeHorarios(umdtData.Date);

     // Define as presencas para todos os alunos
     AlterarPresencaAlunosTurma();

     // Atualiza a tela
     qyPessoas.Refresh();
   except
      on E:Exception do
      begin
         Mensagem('Não foi possível atribuir as presenças: ' + E.Message, 'Erro', MB_ICONERROR + MB_OK, Handle);
      end;
   end;
end;

procedure Tfrm_Presencas.AlterarPresencaAlunosTurma;
var
   qyAlterarPresencas: TUMZQuery;
begin
   DM.CriarConsulta(qyAlterarPresencas);

   qyAlterarPresencas.SQL.Text :=
    'INSERT INTO diario_aulas_alunos(cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_aula, ds_freq, sn_importada, dt_base, cd_aula_aluno) ' +
    'SELECT ' +
    '  fi.codigoaluno AS cd_pessoa, ' +
    '  fi.turma AS cd_turma, ' +
    '  fi.anosemestre AS nr_anosem, ' +
    '  fi.disciplina AS cd_disciplina, ' +
    '  da.bimestre AS cd_bimestre, ' +
    '  da.nro_aula AS nr_aula, ' +
    '  LPAD("C", da.qtd_aulas, "C") AS ds_freq, ' +
    '  0 AS sn_importada, ' +
    '  NOW() AS dt_base, ' +
    '  NULL AS cd_aula_aluno ' +
    'FROM ' +
    '  diario_aulas AS da ' +
    '  INNER JOIN fichaindividual AS fi ' +
    '    ON ( ' +
    '      fi.turma = da.turma ' +
    '      AND fi.anosemestre = da.anosemestre ' +
    '      AND fi.disciplina = da.disciplina ' +
    '    ) ' +
    'WHERE da.turma = :cd_turma ' +
    '  AND da.anosemestre = :nr_anosemestre ' +
    '  AND da.data = :dt_aula ' +
    '  AND da.bimestre = :nr_etapa ' +
    '  AND fi.situacao NOT IN (3, 4, 5, 6, 7, 8, 10) ' +
    'ON DUPLICATE KEY UPDATE ds_freq = VALUES(ds_freq) ';

  qyAlterarPresencas.Close();
  qyAlterarPresencas.ParamByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  qyAlterarPresencas.ParamByName('cd_turma').AsString := EDcd_turma.Text;
  qyAlterarPresencas.ParamByName('nr_etapa').AsInteger := StrToInt(edBimentre.Text);
  qyAlterarPresencas.ParamByName('dt_aula').AsDateTime := umdtData.Date;
  qyAlterarPresencas.ExecSQL();
end;

procedure Tfrm_Presencas.GerarAulasConformeGradeHorarios(dataAula: TDateTime);
var
   i,
   cdDiarioAula,
   cd_tipo_aula: Integer;

   listaHorarios: TStringList;
   logDesc: String;

   qyGradeHorariosAula,
   qyVincularHorario,
   qyVerificaAulaExistente,
   qyInserirAula,
   qyCriarEstruturaTemporaria: TUMZQuery;
begin
   DM.CriarConsulta(qyGradeHorariosAula);
   DM.CriarConsulta(qyVincularHorario);
   DM.CriarConsulta(qyVerificaAulaExistente);
   DM.CriarConsulta(qyInserirAula);
   DM.CriarConsulta(qyCriarEstruturaTemporaria);

   listaHorarios := TStringList.Create;

   // Cria o SQL que fará a inserção da aula
   qyInserirAula.SQL.Text := ''+
      'INSERT INTO diario_aulas (anosemestre, turma, bimestre, disciplina, nro_aula, data, qtd_aulas, sn_bloqueado, conteudo, cd_professor, dt_envio, cd_aula_tipo) '+
      '  VALUES ( '+
      '     :nr_anosemestre, :cd_turma, :nr_etapa, :cd_disciplina, '+
      '     (SELECT t.proxima FROM (SELECT COALESCE(MAX(nro_aula), 0)+1 AS proxima FROM diario_aulas WHERE anosemestre = :nr_anosemestre AND turma = :cd_turma AND disciplina = :cd_disciplina AND bimestre = :nr_etapa) AS t), '+
      '     DATE_FORMAT(:data_aula, "%Y-%m-%d 00:00:00"), :qtd_aulas, :sn_bloqueado, :ds_conteudo, :cd_professor, DATE_FORMAT(:data_aula, "%Y-%m-%d 00:00:00"), :cd_aula_tipo '+
      '  )';

   // Cria o SQL que fará o vinculo do horário
   qyVincularHorario.SQL.Text := ''+
      'INSERT IGNORE INTO diario_aulas_turmas_horarios (cd_diario_aula, cd_turma_horario) '+
      '  VALUES (:cd_diario_aula, :cd_turma_horario)';

   // Cria a tabela temporária
   qyCriarEstruturaTemporaria.Close;
   qyCriarEstruturaTemporaria.SQL.Text := 'DROP TEMPORARY TABLE IF EXISTS TMP_TA_GERAR_AULAS';
   qyCriarEstruturaTemporaria.ExecSQL;

   qyCriarEstruturaTemporaria.Close;
   qyCriarEstruturaTemporaria.SQL.Text := 'CREATE TEMPORARY TABLE TMP_TA_GERAR_AULAS( '+
                                          '   nr_anosemestre INTEGER(6), '+
                                          '   cd_turma VARCHAR(50), '+
                                          '   cd_disciplina INTEGER(11), '+
                                          '   turmas_horarios_ins MEDIUMTEXT, '+
                                          '   cd_professor INTEGER(11), '+
                                          '   dt_aula DATETIME, '+
                                          '   qtd_aulas INTEGER(11), '+
                                          '   aulas_sequencia INTEGER(11), '+
                                          '   coluna_grupo INTEGER(11), '+
                                          '   cd_turma_anterior VARCHAR(50), '+
                                          '   cd_disciplina_anterior INTEGER(11), '+
                                          '   cd_professor_anterior INTEGER(11) '+
                                          ') ';
   qyCriarEstruturaTemporaria.ExecSQL;

   qyCriarEstruturaTemporaria.Close;
   qyCriarEstruturaTemporaria.SQL.Text := 'DELETE FROM TMP_TA_GERAR_AULAS';
   qyCriarEstruturaTemporaria.ExecSQL;

   // SQL que monta a grade de horários agrupados para a criação das aulas (insere as mesmas em uma estrutura temporária)
   qyGradeHorariosAula.SQL.Text := ''+
      'INSERT INTO TMP_TA_GERAR_AULAS( '+
      '   nr_anosemestre, cd_turma, cd_disciplina, turmas_horarios_ins, cd_professor, dt_aula, '+
      '   qtd_aulas, aulas_sequencia, coluna_grupo, cd_turma_anterior, cd_disciplina_anterior, cd_professor_anterior '+
      ') '+
      'SELECT '+
      '  nr_anosemestre, '+
      '  cd_turma, '+
      '  cd_disciplina, '+
      '  GROUP_CONCAT(DISTINCT cd_turmas_horarios) turmas_horarios_ins, '+
      '  cd_professor, '+
      '  :data_aula dt_aula, '+
      '  COUNT(DISTINCT cd_turmas_horarios) qtd_aulas, '+
      '  @grupo := IF((cd_turma <> @turmaAnterior) OR (cd_disciplina <> @disciplinaAnterior) OR (cd_professor <> @professorAnterior), @cont := @cont+1, @cont) aulasSequencia, '+
      '  @grupo coluna_grupo, '+
      '  @turmaAnterior := cd_turma, '+
      '  @disciplinaAnterior := cd_disciplina, '+
      '  @professorAnterior := cd_professor '+
      'FROM ( '+
      '  SELECT '+
      '     thc.nr_anosemestre, '+
      '     thc.cd_turma, '+
      '     thc.cd_disciplina, '+
      '     thc.cd_turmas_horarios, '+
      '     COALESCE(thc.cd_professor, 0) cd_professor, '+
      '     @cont := 0, '+
      '     @turmaAnterior := NULL, '+
      '     @disciplinaAnterior := NULL, '+
      '     @professorAnterior := NULL, '+
      '     @grupo := NULL '+
      '  FROM '+
      '     turmas t '+
		'	   INNER JOIN turmas_horarios_config thc ON (thc.cd_turma = t.codigo AND thc.nr_anosemestre = t.anosemestre) '+
		'	   INNER JOIN horarios h ON (h.codigo = thc.cd_horario) '+
		'	   INNER JOIN disciplinas d ON (d.codigo = thc.cd_disciplina AND d.curso = t.curso) '+
      '  WHERE '+
      '	   t.anosemestre = :nr_anosemestre '+
      '     AND t.codigo = :cd_turma '+
      '     AND thc.nr_dia_semana = DAYOFWEEK(:data_aula) '+
		'	   AND IS_HORARIO_TURMA_ATIVA(:data_aula, thc.dt_inicial, thc.dt_final, thc.sn_ativo) = 1 '+
      '     AND t.cd_coligada IN ('+DM.GetColigadas+') '+
      '  ORDER BY '+
		'   	thc.nr_anosemestre, thc.cd_turma, h.hr_inicio, h.hr_fim '+
      ') aulas_horarios '+
      'GROUP BY '+
	   '  coluna_grupo';

   qyGradeHorariosAula.Close();

   qyGradeHorariosAula.ParamByName('nr_anosemestre').AsInteger := StrToInt(Self.txtAnoSemestre.Text);
   qyGradeHorariosAula.ParamByName('cd_turma').AsString := EDcd_turma.Text;
   qyGradeHorariosAula.ParamByName('data_aula').AsDate := dataAula;

   qyGradeHorariosAula.ExecSQL();

   {
      CORRIGE A QUEBRA DE AULAS DE DISCIPLINAS QUE ACONTECEM NO MESMO HORÁRIO
      OU SEJA, MESMO QUE A DISCIPLINA ACONTEÇA EM MESMO HORÁRIO QUE OUTRA,
      SE A DISCIPLINA DO PRÓXIMO HORÁRIO FOR A MESMA E MESMO PROFESSOR,
      ENTÃO DEVE SER GERADA UMA ÚNICA AULA COM A QUANTIDADE DESSAS
   }
   DM.callProcedure('CALL TA_AJUSTE_GERAR_AULAS()');

   qyGradeHorariosAula.Close;
   qyGradeHorariosAula.SQL.Text := ''+
      'SELECT '+
      '   nr_anosemestre, '+
      '   cd_turma, '+
      '   cd_disciplina, '+
      '   turmas_horarios_ins, '+
      '   cd_professor, '+
      '   dt_aula, '+
      '   qtd_aulas, '+
      '   aulas_sequencia, '+
      '   coluna_grupo, '+
      '   cd_disciplina_anterior, '+
      '   cd_professor_anterior '+
      'FROM '+
      '   TMP_TA_GERAR_AULAS '+
      'ORDER BY '+
      '   nr_anosemestre, cd_turma';
   qyGradeHorariosAula.Open();

   qyGradeHorariosAula.First;

   while not qyGradeHorariosAula.Eof do
   begin
      // Cria o SQL que verifica se a aula já existe
      qyVerificaAulaExistente.SQL.Text := ''+
         'SELECT DISTINCT '+
         '  da.cd_diario_aula cd_diario_aula '+
         'FROM '+
         '  diario_aulas da '+
         '  INNER JOIN diario_aulas_turmas_horarios dath ON (dath.cd_diario_aula = da.cd_diario_aula) '+
         'WHERE '+
         '  da.anosemestre = :nr_anosemestre AND '+
         '  da.turma = :cd_turma AND '+
         '  da.disciplina = :cd_disciplina AND '+
         '  da.bimestre = :nr_etapa AND '+
         '  DATE_FORMAT(da.data, "%Y-%m-%d") = DATE_FORMAT(:data_aula, "%Y-%m-%d") AND '+
         '  dath.cd_turma_horario IN ('+qyGradeHorariosAula.FieldByName('turmas_horarios_ins').AsString+') '+
         'LIMIT 1';

      qyVerificaAulaExistente.Close;
      qyVerificaAulaExistente.ParamByName('nr_anosemestre').AsInteger := qyGradeHorariosAula.FieldByName('nr_anosemestre').AsInteger;
      qyVerificaAulaExistente.ParamByName('cd_turma').AsString := qyGradeHorariosAula.FieldByName('cd_turma').AsString;
      qyVerificaAulaExistente.ParamByName('cd_disciplina').AsInteger := qyGradeHorariosAula.FieldByName('cd_disciplina').AsInteger;
      qyVerificaAulaExistente.ParamByName('data_aula').AsDateTime := dataAula;
      qyVerificaAulaExistente.ParamByName('nr_etapa').AsInteger := StrToInt(edBimentre.Text);

      qyVerificaAulaExistente.Open;

      // Verifica se já existia uma aula criada nesse caso usa a chave primaria dessa aula criada para vincular o horario
      if qyVerificaAulaExistente.FieldByName('cd_diario_aula').AsInteger > 0 then
      begin
         // Pega o codigo da aula que já existia
         cdDiarioAula := qyVerificaAulaExistente.FieldByName('cd_diario_aula').AsInteger;
      end else begin
         // Cria uma nova aula para cada registro encontrado no SQL
         qyInserirAula.Close();

         qyInserirAula.ParamByName('nr_anosemestre').AsInteger := qyGradeHorariosAula.FieldByName('nr_anosemestre').AsInteger;
         qyInserirAula.ParamByName('cd_turma').AsString := qyGradeHorariosAula.FieldByName('cd_turma').AsString;
         qyInserirAula.ParamByName('nr_etapa').AsInteger := StrToInt(edBimentre.Text);
         qyInserirAula.ParamByName('cd_disciplina').AsInteger := qyGradeHorariosAula.FieldByName('cd_disciplina').AsInteger;
         qyInserirAula.ParamByName('data_aula').AsDateTime := dataAula;
         qyInserirAula.ParamByName('qtd_aulas').AsInteger := qyGradeHorariosAula.FieldByName('qtd_aulas').AsInteger;
         qyInserirAula.ParamByName('sn_bloqueado').AsInteger := 0;
         qyInserirAula.ParamByName('ds_conteudo').AsString := '';
         qyInserirAula.ParamByName('cd_professor').AsInteger := qyGradeHorariosAula.FieldByName('cd_professor').AsInteger;

         cd_tipo_aula := getTipoAulaPadrao(
            cursoTurma,
            qyGradeHorariosAula.FieldByName('cd_turma').AsString,
            qyGradeHorariosAula.FieldByName('nr_anosemestre').AsInteger,
            qyGradeHorariosAula.FieldByName('cd_disciplina').AsInteger
         );

         if cd_tipo_aula <> 0 then
         begin
            qyInserirAula.ParamByName('cd_aula_tipo').AsInteger := cd_tipo_aula;
         end;

         qyInserirAula.ExecSQL();

         //Resgada a chave primaria da aula inserida (cd_diario_aula)
         cdDiarioAula := DM.LastInsert();

         // Inserir log de inserção de aulas
         logDesc := '';
         logDesc := logDesc + 'Código diário aula (cd_diario_aula): '+IntToStr(cdDiarioAula)+', ';
         logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', dataAula)+', ';
         logDesc := logDesc + 'Qtd. Aulas: '+qyGradeHorariosAula.FieldByName('qtd_aulas').AsString+', ';
         logDesc := logDesc + 'Conteúdo: , ';
         logDesc := logDesc + 'Anosemestre: '+qyGradeHorariosAula.FieldByName('nr_anosemestre').AsString+', ';
         logDesc := logDesc + 'Turma: '+qyGradeHorariosAula.FieldByName('cd_turma').AsString+', ';
         logDesc := logDesc + 'Disciplina: '+qyGradeHorariosAula.FieldByName('cd_disciplina').AsString+', ';
         logDesc := logDesc + 'Etapa: '+edBimentre.Text+', Geração de aulas conforme grade horários [Acadêmico]';

         { Insere log de inserção de aulas }
         DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_AULA, logDesc, qyGradeHorariosAula.FieldByName('cd_professor').AsInteger);
      end;

      // Cria um StringList dos horários da turma
      listaHorarios.Delimiter := ',';
      listaHorarios.DelimitedText := qyGradeHorariosAula.FieldByName('turmas_horarios_ins').AsString;

      // Varre a lista de horários e vincula todos a aula que foi criada 
      for i := 0 to listaHorarios.Count - 1 do
      begin
         qyVincularHorario.Close;
         qyVincularHorario.ParamByName('cd_diario_aula').AsInteger := cdDiarioAula;
         qyVincularHorario.ParamByName('cd_turma_horario').AsInteger := StrToInt(listaHorarios.Strings[i]);
         qyVincularHorario.ExecSQL;
      end;

      qyGradeHorariosAula.Next;
   end;
   
end;

procedure Tfrm_Presencas.LimparListaHorarios;
var
   I : Integer;
begin
   chk_0.Checked := False;
   chk_1.Checked := False;
   chk_2.Checked := False;

   pnAulasExtras.Visible := False;
   UMAjuda1.Visible := False;

   { Apagando todos os check-boxes }
   for I := Self.ComponentCount - 1 downto 0 do
   begin
      if Self.Components[ I ] is TRadioButtonHorarioDisciplina then
      begin
         if ( TRadioButtonHorarioDisciplina( Self.Components[ I ] ).Parent = pnHorarios ) AND
            ( Self.Components[ I ] <> chk_0 ) AND
            ( Self.Components[ I ] <> chk_1 ) AND
            ( Self.Components[ I ] <> chk_2 ) then
         begin
            TRadioButtonHorarioDisciplina( Self.Components[ I ] ).Destroy;
         end;
      end;
   end;
end;

procedure Tfrm_Presencas.mcDataCloseUp(Sender: TObject);
begin
   FiltraAluno();
   SelecionarEtapa;
end;

procedure Tfrm_Presencas.imBaixoClick(Sender: TObject);
begin
{   pnFiltros.Height := 220;
   imCima.Visible := True;
   imBaixo.Visible := False;}
end;

procedure Tfrm_Presencas.UpDown2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   { Este valor de controle, detecta se o usuário realmente está clicando no componente ou não.
      Isso evita o bug de a pessoa mudar a etapa, colocar o mouse em outro campo para uso normal do sistema
      e quando realiza o click novamente, o Delphi realiza novamente a execução da alteração de Etapa }
   AllowChange := (UpDown2.Tag = 1);
end;

procedure Tfrm_Presencas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
   DM.inc_dec_ano_semestre(txtAnoSemestre, Button);
end;

procedure Tfrm_Presencas.UpDown2MouseEnter(Sender: TObject);
begin
   UpDown2.Tag := 1;
end;

procedure Tfrm_Presencas.UpDown2MouseLeave(Sender: TObject);
begin
   UpDown2.Tag := 0;
end;

procedure Tfrm_Presencas.sbFiltroTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(txtAnoSemestre.Text));

   if resultado_filtro.filtrado then
   begin
      EDcd_turma.Text := resultado_filtro.cd_turma;
      Self.txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      cd_pessoa_filtrada := 0;
      cursoTurma := resultado_filtro.cd_curso;
      FiltraTurma;
   end;
end;

procedure Tfrm_Presencas.EDcd_turmaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      FiltraTurma;
   end;
end;

procedure Tfrm_Presencas.EDcd_alunoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelecionarTurmaAluno(StrToIntDef(EDcd_aluno.Text, -1));
   end;
end;

function Tfrm_Presencas.getTipoAulaPadrao(cd_curso, cd_turma: String;
  nr_anosemestre, cd_disciplina: Integer): Integer;
const
   SQL_CARREGA_PARAMETROS_AVALIACAO =
      ' SELECT '+
		' 	 atp.cd_aula_tipo '+
		' FROM '+
		'   turmas t '+
    '	  INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade) '+
	  '   INNER JOIN avaliacoes_parametros avl ON (avl.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) '+
    '   INNER JOIN aulas_tipos_parametros atp ON (atp.cd_avaliacao = avl.cd_avaliacao AND atp.sn_padrao = 1) '+
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

   Result := 0;

   if qyParametrosAvaliacao.RecordCount > 0 then
   begin
      Result := qyParametrosAvaliacao.FieldByName('cd_aula_tipo').AsInteger;
   end;
end;

procedure Tfrm_Presencas.grdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (gdSelected in State) then
   begin
      grd.Canvas.Brush.Color := cl3DLight;
      grd.Canvas.Font.Color := clBlack;
      grd.Canvas.Font.Style := [fsBold];
      grd.Canvas.FillRect(Rect);
      grd.DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;
end;

procedure Tfrm_Presencas.grdKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then chk_0.SetFocus();
end;

procedure Tfrm_Presencas.grdMouseEnter(Sender: TObject);
begin
   grd.SetFocus();
end;

procedure Tfrm_Presencas.CarregarAulasAluno;
var
   ListaHorarios : TListaHorarios;
   HorarioNovo : THorario;
   Disciplina : TDisciplina;

   listaTurmasHorariosAula : TStringList;
   listaHorariosPercorridosDisc: TStringList;

   sDisciplinas: String;

   I, J, K, posHorario, ultimaAula : Integer;
begin
   LimparListaHorarios();

   ListaHorarios := TListaHorarios.Create;
   listaHorariosPercorridosDisc := TStringList.Create;

   qyHorarios.First();
   qyListaAulasAluno.First();

   sDisciplinas := '';
   while not qyListaAulasAluno.Eof do
   begin
      sDisciplinas := sDisciplinas + qyListaAulasAluno.FieldByName('cd_chave').AsString+'=0,';
      qyListaAulasAluno.Next;
   end;

   listaHorariosPercorridosDisc.CommaText := sDisciplinas;

   qyListaAulasAluno.First();

   while not qyHorarios.Eof do
   begin
      I := ListaHorarios.IndexOfByTurmaHorario(qyHorarios.FieldByName('cd_turmas_horarios').AsInteger);

      if I = -1 then
      begin
         HorarioNovo := THorario.Create(
            qyHorarios.FieldByName('CD_HORARIO').AsInteger,
            qyHorarios.FieldByName('DS_HORARIO').AsString,
            qyHorarios.FieldByName('HR_INICIO').AsString
         );

         HorarioNovo.SetHoraFim(qyHorarios.FieldByName('HR_FIM').AsString);
         HorarioNovo.adicionais.cd_turma_horario := qyHorarios.FieldByName('cd_turmas_horarios').AsInteger;
         HorarioNovo.adicionais.cd_turma := qyHorarios.FieldByName('cd_turma').AsString;

         ListaHorarios.Add(HorarioNovo);
      end else begin
         HorarioNovo := ListaHorarios.Items[I];
      end;

      Disciplina := TDisciplina.Create(
         qyHorarios.FieldByName('CD_DISC').AsInteger,
         qyHorarios.FieldByName('DS_DISC').AsString,
         qyHorarios.FieldByName('CD_CURSO').AsString
      );
      Disciplina.adicionais.qtd_aulas := 1;
      Disciplina.adicionais.sn_frequencia_bloqueada := qyHorarios.FieldByName('sn_bloq_freq' + edBimentre.Text).AsInteger = 1;

      HorarioNovo.adicionais.ListaDisciplinas.Add(Disciplina);

      qyHorarios.Next;
   end;

   ListaHorarios.Add(THorario.Create(
      -1,
      'Aulas Extras',
      '23:59:59'
   ));
   THorario(ListaHorarios.Last).SetHoraFim('23:59:59');

   while not qyListaAulasAluno.Eof do
   begin
      if ( qyListaAulasAluno.FieldByName('sn_aula_extra').AsInteger = 1 ) then
      begin
         { Se é aula extra (não tem vínculo de horario_turma). Buscamos na lista de horários a sua posição }
         I := ListaHorarios.IndexOf(-1);

         { Caso não exista, infelizmente não podemos fazer nada, então vamos para o próximo registro}
         if I = -1 then
         begin
            qyListaAulasAluno.Next;
            Continue;
         end;

         { Caso encontrou corretamente, criamos o registro de uma disciplina }
         Disciplina := TDisciplina.Create(
            qyListaAulasAluno.FieldByName('CD_DISCIPLINA').AsInteger,
            qyListaAulasAluno.FieldByName('DS_DISCIPLINA').AsString,
            qyListaAulasAluno.FieldByName('CD_CURSO').AsString
         );

         { Definimos qual é o código da aula vinculado e quantas aulas há aqui }
         Disciplina.adicionais.cd_diario_aula := qyListaAulasAluno.FieldByName('cd_diario_aula').AsInteger;
         Disciplina.adicionais.qtd_aulas := qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger;
         Disciplina.adicionais.objeto := ListaHorarios.Items[I];
         Disciplina.adicionais.sn_frequencia_bloqueada := qyListaAulasAluno.FieldByName('sn_bloq_freq' + edBimentre.Text).AsInteger = 1;

         Disciplina.adicionais.sn_aula_extra := True;

         { Definimos a frequência do aluno nesta aula }
         Disciplina.adicionais.ds_freq := qyListaAulasAluno.FieldByName('ds_freq').AsString;

         { Definimos qual é o assunto da aula }
         Disciplina.adicionais.ds_assunto_aula := qyListaAulasAluno.FieldByName('conteudo').AsString;

         { E simplesmente adicionamos na lista de Disciplinas/Aulas no horário de Aula extra }
         ListaHorarios.Items[I].adicionais.ListaDisciplinas.Add(Disciplina);
      end else begin
         TGeneral.SplitString(
            qyListaAulasAluno.FieldByName('lista_horarios').AsString,
            ',', listaTurmasHorariosAula
         );

         posHorario := StrToInt(listaHorariosPercorridosDisc.Values[qyListaAulasAluno.FieldByName('cd_chave').AsString]);

         Disciplina := TDisciplina.Create(
            qyListaAulasAluno.FieldByName('CD_DISCIPLINA').AsInteger,
            qyListaAulasAluno.FieldByName('DS_DISCIPLINA').AsString,
            qyListaAulasAluno.FieldByName('CD_CURSO').AsString
         );
         Disciplina.adicionais.sn_frequencia_bloqueada := qyListaAulasAluno.FieldByName('sn_bloq_freq' + edBimentre.Text).AsInteger = 1;

         for K := 0 to listaTurmasHorariosAula.Count - 1 do
         begin
            if (K >= qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger) then break;

            { Verifica se a posição do horário já passou do total de horarios,
              significa que todos foram usados e essa é uma aula extra }
            if posHorario > listaTurmasHorariosAula.Count-1 then
            begin
               I := -1;
            end else begin
               I := ListaHorarios.IndexOfByTurmaHorario(StrToInt(listaTurmasHorariosAula[posHorario]));
            end;
            posHorario := posHorario + 1;

            { Caso contrário, não é uma aula extra, pesquisamos se o horário desta aula existe no array de horários }
            if I = -1 then
            begin
               { Se não existir, nós ainda podemos tentar adicionar ao menos na categoria de Aula Extra, para a aula não se perder}
               I := ListaHorarios.IndexOf(-1);
               Disciplina.adicionais.sn_aula_extra := True;
               Disciplina.adicionais.qtd_aulas := qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger;
            end;

            Disciplina.adicionais.objeto := ListaHorarios.Items[I];

            { Definimos qual é o código da aula vinculado e quantas aulas há aqui }
            Disciplina.adicionais.cd_diario_aula := qyListaAulasAluno.FieldByName('cd_diario_aula').AsInteger;
   //         Disciplina.adicionais.qtd_aulas := qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger;

            { Definimos qual é o assunto da aula }
            Disciplina.adicionais.ds_assunto_aula := qyListaAulasAluno.FieldByName('conteudo').AsString;

            { Definimos a frequência do aluno nesta aula }
            Disciplina.adicionais.ds_freq := Copy(qyListaAulasAluno.FieldByName('ds_freq').AsString, K+1, 1);

            { Se o horário que eu encontrei, foi o horário de Aulas Extras, então vamos simplesmente incluir a Aula }
            if ListaHorarios.Items[I].Codigo = -1 then
            begin
               Disciplina.adicionais.ds_freq := qyListaAulasAluno.FieldByName('ds_freq').AsString;
               ListaHorarios.Items[I].adicionais.ListaDisciplinas.Add(Disciplina);
               break;
            end else begin
               { Caso contrário, precisamos verificar se a disciplina foi incluída na lista de horários }
               J := ListaHorarios.Items[I].adicionais.ListaDisciplinas.IndexOf(
                  qyListaAulasAluno.FieldByName('CD_DISCIPLINA').AsInteger,
                  qyListaAulasAluno.FieldByName('CD_CURSO').AsString
               );

               { Novamente, se essa disciplina não está cadastrada nos horários da turma, adicionamos nas Aulas Extras }
               if (J = -1) OR
                  (ListaHorarios.Items[I].adicionais.ListaDisciplinas.Items[J]
                     .adicionais.cd_diario_aula > 0)  then
               begin
                  if J = -1 then
                  begin
                     ListaHorarios.Items[I].adicionais.ListaDisciplinas.Add(Disciplina);
                  end else begin
                     I := ListaHorarios.IndexOf(-1);
                     if I > -1 then
                     begin
                        Disciplina.adicionais.qtd_aulas := qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger;
                        ListaHorarios.Items[I].adicionais.ListaDisciplinas.Add(Disciplina);
                     end;

                     qyListaAulasAluno.Next;
                     Continue;
                  end;
               end else begin
                  { Caso contrário, encontramos a disciplina corretamente como esperavamos }
                  ListaHorarios.Items[I].adicionais.ListaDisciplinas.Items[J]
                     .adicionais.cd_diario_aula := qyListaAulasAluno.FieldByName('cd_diario_aula').AsInteger;
   //               ListaHorarios.Items[I].adicionais.ListaDisciplinas.Items[J]
   //                  .adicionais.qtd_aulas := qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger;

                  { Definimos a frequência do aluno nesta aula }
                  ListaHorarios.Items[I].adicionais.ListaDisciplinas.Items[J]
                     .adicionais.ds_freq := Copy(qyListaAulasAluno.FieldByName('ds_freq').AsString, K+1, 1);
               end;
            end;
         end;

         // Grava em qual posição do horário parou para a disciplina em questão
         listaHorariosPercorridosDisc.Values[qyListaAulasAluno.FieldByName('cd_chave').AsString] := IntToStr(posHorario);

         if (qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger - listaTurmasHorariosAula.Count) > 0 then
         begin
            Disciplina.adicionais.qtd_aulas := (qyListaAulasAluno.FieldByName('qtd_aulas').AsInteger - listaTurmasHorariosAula.Count);
            Disciplina.adicionais.ds_freq := Copy(
               qyListaAulasAluno.FieldByName('ds_freq').AsString,
               listaTurmasHorariosAula.Count+1,
               Length(qyListaAulasAluno.FieldByName('ds_freq').AsString)-1
            );

            I := ListaHorarios.IndexOf(-1);
            if I > -1 then
            begin
               ListaHorarios.Items[I].adicionais.ListaDisciplinas.Add(Disciplina);
            end;
         end;
      end;

      qyListaAulasAluno.Next;
   end;

   MontarChecks(ListaHorarios);
end;

procedure Tfrm_Presencas.CarregarHorariosAulasBanco;
begin
   qyHorarios.Close();
   qyListaAulasAluno.Close();

   qyHorarios.ParamByName( 'CD_TURMA' ).AsString := qyPessoas.ParamByName( 'cd_turma' ).AsString;
   qyHorarios.ParamByName( 'NR_ANOSEMESTRE' ).AsString := qyPessoas.ParamByName( 'nr_anosemestre' ).AsString;
   qyHorarios.ParamByName( 'DIA_SEMANA' ).AsInteger := DayOfWeek( umdtData.Date );
   qyHorarios.ParamByName( 'DT_SELECIONADA' ).AsDate := umdtData.Date;
   qyHorarios.ParamByName( 'CD_PESSOA' ).AsInteger := qyPessoascd_pessoa.AsInteger;

   qyListaAulasAluno.ParamByName( 'CD_TURMA' ).AsString := qyPessoas.ParamByName( 'cd_turma' ).AsString;
   qyListaAulasAluno.ParamByName( 'NR_ANOSEMESTRE' ).AsInteger := qyPessoas.ParamByName( 'nr_anosemestre' ).AsInteger;
   qyListaAulasAluno.ParamByName( 'DT_SELECIONADA' ).AsDate := umdtData.Date;
   qyListaAulasAluno.ParamByName( 'CD_PESSOA' ).AsInteger := qyPessoascd_pessoa.AsInteger;
   qyListaAulasAluno.ParamByName( 'NR_ETAPA' ).AsString := edBimentre.Text;

   qyListaAulasAluno.Open();
   qyHorarios.Open();
end;

procedure Tfrm_Presencas.udBimestreChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   { Este valor de controle, detecta se o usuário realmente está clicando no componente ou não.
      Isso evita o bug de a pessoa mudar a etapa, colocar o mouse em outro campo para uso normal do sistema
      e quando realiza o click novamente, o Delphi realiza novamente a execução da alteração de Etapa }
   AllowChange := (udBimestre.Tag = 1);
end;

procedure Tfrm_Presencas.udBimestreClick(Sender: TObject; Button: TUDBtnType);  
var
   nr_etapa : Integer;
begin
   nr_etapa := StrToIntDef(edBimentre.Text, 1);

   if Button = btNext then
   begin
      Inc(nr_etapa);

      if nr_etapa > 10 then
      begin
         nr_etapa := 1;
      end
   end else begin
      Dec(nr_etapa);

      if nr_etapa < 1 then
      begin
         nr_etapa := 10;
      end;
  end;

  edBimentre.Text := IntToStr(nr_etapa);
end;

procedure Tfrm_Presencas.udBimestreMouseEnter(Sender: TObject);
begin
   udBimestre.Tag := 1;
end;

procedure Tfrm_Presencas.udBimestreMouseLeave(Sender: TObject);
begin
   udBimestre.Tag := 0;
end;

procedure Tfrm_Presencas.umdtDataChangeDate(Sender: TObject);
begin
   FiltraAluno();
   SelecionarEtapa();
end;

procedure Tfrm_Presencas.edBimentreChange(Sender: TObject);
begin
   FiltraAluno();
end;

procedure Tfrm_Presencas.txtAnoSemestreChange(Sender: TObject);
begin
   FiltraTurma();
end;

end.
