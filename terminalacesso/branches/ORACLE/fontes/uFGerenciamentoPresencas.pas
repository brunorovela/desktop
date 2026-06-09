unit uFGerenciamentoPresencas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, DBCtrls, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
   Buttons, Mask, UMComboBox, DB, ZAbstractRODataset, ZAbstractDataset,
   UZDataset, ZSqlUpdate;

const PERMISSAO_GERENCIAMENTO_PRESENCAS = 'TerminalAcesso.GerenciamentoPresencas';


type
   TfrmGerenciamentoPresencas = class(TForm)
      Panel3: TPanel;
      toolPessoa: TToolBar;
      ToolButton6: TToolButton;
      btnFechar: TToolButton;
      ToolButton2: TToolButton;
      Panel1: TPanel;
      gdAcoes: TDBGrid;
      gbFiltrarCadastrar: TGroupBox;
      udAnoSem: TUpDown;
      Label1: TLabel;
      txtAnoSem: TMaskEdit;
      Label6: TLabel;
      dtpDataAcao: TDateTimePicker;
      ToolButton1: TToolButton;
      btnAlterar: TToolButton;
      btnIncluir: TToolButton;
      btnCancelar: TToolButton;
      btnExcluir: TToolButton;
      ToolButton4: TToolButton;
      btnSalvar: TToolButton;
      qyGerenciarPresencas: TUMZQuery;
      dsGerenciarPresencas: TDataSource;
      qyGerenciarPresencasnr_anosemestre: TSmallintField;
      qyGerenciarPresencascd_curso: TStringField;
      qyGerenciarPresencascd_turma: TStringField;
      qyGerenciarPresencascd_disciplina: TIntegerField;
      qyGerenciarPresencasdt_execucao_acao: TDateField;
      qyGerenciarPresencascd_acao: TStringField;
      qyGerenciarPresencasds_curso: TStringField;
      qyGerenciarPresencasds_disciplina: TStringField;
      qyGerenciarPresencasds_acao: TStringField;
      gbCadastro: TGroupBox;
      Label2: TLabel;
      edCurso: TEdit;
      sbCurso: TSpeedButton;
      Label3: TLabel;
      edTurma: TEdit;
      sbTurma: TSpeedButton;
      Label4: TLabel;
      edDisciplina: TEdit;
      sbDisciplina: TSpeedButton;
      Label7: TLabel;
      cbAcao: TUMComboBox;
      upsqlGerenciarPresencas: TZUpdateSQL;
      qyGerenciarPresencascd_gerenciar_presenca: TIntegerField;
      ckbFiltroData: TCheckBox;
      procedure ckbFiltroDataClick(Sender: TObject);
      procedure dtpDataAcaoKeyUp(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure qyGerenciarPresencasBeforeEdit(DataSet: TDataSet);
      procedure qyGerenciarPresencasBeforeInsert(DataSet: TDataSet);
      procedure gdAcoesKeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure qyGerenciarPresencasBeforePost(DataSet: TDataSet);
      procedure gdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure cbAcaoChange(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure dsGerenciarPresencasStateChange(Sender: TObject);
      procedure qyGerenciarPresencasCalcFields(DataSet: TDataSet);
      procedure qyGerenciarPresencasBeforeOpen(DataSet: TDataSet);
      procedure qyGerenciarPresencasAfterOpen(DataSet: TDataSet);
      procedure dsGerenciarPresencasDataChange(Sender: TObject; Field: TField);
      procedure qyGerenciarPresencasAfterScroll(DataSet: TDataSet);
      procedure qyGerenciarPresencasBeforeScroll(DataSet: TDataSet);
      procedure dtpDataAcaoCloseUp(Sender: TObject);
      procedure txtAnoSemChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
      procedure FormShow(Sender: TObject);
      procedure sbDisciplinaClick(Sender: TObject);
      procedure sbTurmaClick(Sender: TObject);
      procedure sbCursoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
      FCurso, FTurma: String;
      FDisciplina: Integer;

      procedure CarregarComboAcao();

      function GetAcaoAtual(): String;
      function GetIndiceAcaoByCodigo(const cd_acao: String): Integer;
      function GetDescricaoAcao(const cd_acao: String): String;

      function GetAnoSemestre: Integer;
      procedure SetAnoSemestre(const Value: Integer);

      procedure FiltrarAcoes();

      function DadosValidos(): Boolean;
      procedure IncluirAcao(const nr_anosemestre: Integer; const cd_curso, cd_turma: String;
         const cd_disciplina: Integer; const cd_acao: String; const dt_acao: TDate);

      property FAnoSemestre : Integer read GetAnoSemestre write SetAnoSemestre;

   public
      { Public declarations }
   end;

var
   frmGerenciamentoPresencas: TfrmGerenciamentoPresencas;

implementation

uses uDM, uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina,
   uGeneral, uItemCombo, uUMNucleo, General, uUsuario, uFSplash;

{$R *.dfm}

procedure TfrmGerenciamentoPresencas.btnAlterarClick(Sender: TObject);
begin
   qyGerenciarPresencas.Edit();
end;

procedure TfrmGerenciamentoPresencas.btnCancelarClick(Sender: TObject);
begin
   qyGerenciarPresencas.Cancel();
end;

procedure TfrmGerenciamentoPresencas.btnExcluirClick(Sender: TObject);
const
   MSG_EXCLUIR = 'Tem certeza que deseja excluir o(s) registro(s) selecionado(s)?';
var
   I : Integer;
   sChave, sDescricao, qtdTotal: String;
begin
   if (qyGerenciarPresencas.RecordCount > 0) AND (gdAcoes.SelectedRows.Count > 0) then
   begin
      if NOT(DM.UsuarioLogado.TemPermissao(0, PERMISSAO_GERENCIAMENTO_PRESENCAS, npExcluir, True)) then
      begin
         Exit;
      end;

      if Mensagem(MSG_EXCLUIR, '', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = mrYes then
      begin
         qtdTotal := IntToStr(gdAcoes.SelectedRows.Count);
         TfSplash.GetInstancia().ShowSplashScreen('Excluindo registros de Gerenciamento de Presença', '0 de ' + qtdTotal);
         DM.db.SQLHourGlass := False;

         for I := 0 to gdAcoes.SelectedRows.Count - 1 do
         begin
            if qyGerenciarPresencas.BookmarkValid(Pointer(gdAcoes.SelectedRows.Items[I])) then
            begin
               qyGerenciarPresencas.GotoBookmark(Pointer(gdAcoes.SelectedRows.Items[I]));

               sChave := Format(
                  '%d;%s;%s;%s',
                  [
                     qyGerenciarPresencasnr_anosemestre.AsInteger,
                     qyGerenciarPresencascd_curso.AsString,
                     qyGerenciarPresencascd_turma.AsString,
                     qyGerenciarPresencascd_disciplina.AsString
                  ]
               );

               sDescricao := Format(
                  'Ação: %s',
                  [GetDescricaoAcao(qyGerenciarPresencascd_acao.AsString)]
               );

               qyGerenciarPresencas.Delete();

               DM.SetLog(10043, 'exclusao', sChave, DM.UsuarioLogado.GetColigadaLogada.Codigo, sDescricao);
               TfSplash.GetInstancia().SetSplashText(IntToStr(I+1) + ' de ' + qtdTotal);
            end;
         end;

         DM.db.SQLHourGlass := True;
         TfSplash.GetInstancia().CloseSplashScreen();

         gdAcoes.SelectedRows.Clear();
         qyGerenciarPresencas.Refresh();
         gdAcoes.Refresh();

         Mensagem('Ação(ões) excluída(s) com sucesso.');
      end;
   end;
end;

procedure TfrmGerenciamentoPresencas.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmGerenciamentoPresencas.btnIncluirClick(Sender: TObject);
begin
   qyGerenciarPresencas.Insert();
end;

procedure TfrmGerenciamentoPresencas.btnSalvarClick(Sender: TObject);
var
   sChave, sDescricao : String;
begin
   case qyGerenciarPresencas.State of
      dsInsert: begin
         if DadosValidos() then
         begin
            IncluirAcao(FAnoSemestre, FCurso, FTurma, FDisciplina, GetAcaoAtual(), dtpDataAcao.Date);
            qyGerenciarPresencas.Refresh();
         end;
      end;
      dsEdit: begin
         sChave := Format(
            '%d;%s;%s;%s',
            [
               qyGerenciarPresencasnr_anosemestre.AsInteger,
               qyGerenciarPresencascd_curso.AsString,
               qyGerenciarPresencascd_turma.AsString,
               qyGerenciarPresencascd_disciplina.AsString
            ]
         );
         sDescricao := Format(
            'Ação De: %s; Para: %s',
            [GetDescricaoAcao(qyGerenciarPresencascd_acao.OldValue), GetDescricaoAcao(qyGerenciarPresencascd_acao.Value)]
         );

         qyGerenciarPresencas.Post();

         DM.SetLog(10043, 'alteracao', sChave, DM.UsuarioLogado.GetColigadaLogada.Codigo, sDescricao);
      end;
   end;
end;

procedure TfrmGerenciamentoPresencas.CarregarComboAcao;
const
   ACAO_REGISTRAR_PRESENCA = 'Registrar presença para todos da Turma';
   ACAO_DISPENSAR_ALUNOS = 'Dispensar Alunos';
   ACAO_NAO_CRIAR_AULA = 'Não criar Aula';
begin
   cbAcao.Clear();

   cbAcao.AddItem(ACAO_REGISTRAR_PRESENCA, TItemCombo.Create('P', ACAO_REGISTRAR_PRESENCA));
   cbAcao.AddItem(ACAO_DISPENSAR_ALUNOS, TItemCombo.Create('D', ACAO_DISPENSAR_ALUNOS));
   cbAcao.AddItem(ACAO_NAO_CRIAR_AULA, TItemCombo.Create('N', ACAO_NAO_CRIAR_AULA));
end;

procedure TfrmGerenciamentoPresencas.cbAcaoChange(Sender: TObject);
begin
   if qyGerenciarPresencas.State IN [dsEdit] then
   begin
      qyGerenciarPresencascd_acao.AsString := GetAcaoAtual();
   end;
end;

procedure TfrmGerenciamentoPresencas.ckbFiltroDataClick(Sender: TObject);
begin
   FiltrarAcoes();
end;

function TfrmGerenciamentoPresencas.DadosValidos: Boolean;
const
   MSG_ERRO = 'As seguintes específicações devem ser corrigidas: ';
var
   erros, cola: String;
begin
   erros := '';
   cola := '';

   if Length(Trim(FCurso)) = 0 then
   begin
      erros := erros + cola + '   - É necessário selecionar pelo menos um Curso.';
      cola := #13;
   end;

   if NOT(cbAcao.ItemIndex > -1) then
   begin
      erros := erros + cola + '   - É necessário informar uma ação para ser executada.';
      cola := #13;
   end;

   if erros <> '' then
   begin
      Mensagem(MSG_ERRO + #13 + erros, '', MB_OK + MB_ICONWARNING, Handle);
      Result := False;
   end else begin
      Result := True;
   end;
end;

procedure TfrmGerenciamentoPresencas.gdAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if gdAcoes.SelectedRows.CurrentRowSelected then
   begin
      gdAcoes.Canvas.Brush.Color := cl3DLight;
      gdAcoes.Canvas.Font.Color := clBlack;

      if gdSelected in State then
         gdAcoes.Canvas.Font.Style := [fsBold];

      gdAcoes.Canvas.FillRect(Rect);
      gdAcoes.DefaultDrawColumnCell(Rect,DataCol,Column,state);
   end;
end;

procedure TfrmGerenciamentoPresencas.gdAcoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   { Não deixa usar a opção Ctrl + Delete da Grid para excluir registros }
   if (ssCtrl in Shift) AND (Key = VK_DELETE) then Exit;

   if (ssCtrl in Shift) AND (Key = Ord('A')) then TGeneral.SelecionarTodasLinhas(gdAcoes);
end;

procedure TfrmGerenciamentoPresencas.dsGerenciarPresencasDataChange(
  Sender: TObject; Field: TField);
begin
   edTurma.Font.Color := clBlack;
   edDisciplina.Font.Color := edTurma.Font.Color;

   edTurma.Text := '';
   edDisciplina.Text := '';

   if (qyGerenciarPresencas.RecNo = 0) OR (qyGerenciarPresencas.State IN [dsInsert]) then
   begin
      FCurso := '';
      FTurma := '';
      FDisciplina := -1;

      if qyGerenciarPresencas.State IN [dsInsert] then
      begin
         edTurma.Text := 'Aplicar ação em todas Turmas';
         edDisciplina.Text := 'Aplicar ação em todas Disciplinas';

         edTurma.Font.Color := clAppWorkSpace;
         edDisciplina.Font.Color := edTurma.Font.Color;
      end;

      edCurso.Text := '';

      cbAcao.ItemIndex := -1;
   end else begin
      FCurso := qyGerenciarPresencascd_curso.AsString;
      FTurma := qyGerenciarPresencascd_turma.AsString;
      FDisciplina := qyGerenciarPresencascd_disciplina.AsInteger;

      edCurso.Text := qyGerenciarPresencasds_curso.AsString;
      edTurma.Text := FTurma;
      edDisciplina.Text := qyGerenciarPresencasds_disciplina.AsString;

      cbAcao.ItemIndex := GetIndiceAcaoByCodigo(qyGerenciarPresencascd_acao.AsString);
   end;
end;

procedure TfrmGerenciamentoPresencas.dsGerenciarPresencasStateChange(
  Sender: TObject);
var
   entrar_modo_insert: Boolean;
begin
   btnIncluir.Enabled := NOT(qyGerenciarPresencas.State IN [dsInsert, dsEdit]);
   btnAlterar.Enabled := btnIncluir.Enabled;
   btnExcluir.Enabled := btnIncluir.Enabled;

   
   btnSalvar.Enabled := NOT(btnIncluir.Enabled);
   btnCancelar.Enabled := btnSalvar.Enabled;

   edCurso.Enabled := qyGerenciarPresencas.State IN [dsInsert];
   sbCurso.Enabled := edCurso.Enabled;

   edTurma.Enabled := edCurso.Enabled;
   sbTurma.Enabled := edCurso.Enabled;

   edDisciplina.Enabled := edCurso.Enabled;
   sbDisciplina.Enabled := edCurso.Enabled;

   cbAcao.Enabled := qyGerenciarPresencas.State IN [dsInsert, dsEdit];

   txtAnoSem.Enabled := NOT(cbAcao.Enabled);
   udAnoSem.Enabled := txtAnoSem.Enabled;
   ckbFiltroData.Enabled := txtAnoSem.Enabled;
   dtpDataAcao.Enabled := txtAnoSem.Enabled;

   entrar_modo_insert := (qyGerenciarPresencas.State IN [dsInsert]) AND
                         gdAcoes.Enabled AND NOT(txtAnoSem.Enabled);

   gdAcoes.Enabled := txtAnoSem.Enabled;

   if entrar_modo_insert AND
      (qyGerenciarPresencas.State IN [dsBrowse]) then
   begin
      qyGerenciarPresencas.BeforeInsert := nil;
      qyGerenciarPresencas.Insert();
      qyGerenciarPresencas.BeforeInsert := qyGerenciarPresencasBeforeInsert;
   end;


   if edCurso.Enabled then
      edCurso.SetFocus();
end;

procedure TfrmGerenciamentoPresencas.dtpDataAcaoCloseUp(Sender: TObject);
begin
   FiltrarAcoes();
end;

procedure TfrmGerenciamentoPresencas.dtpDataAcaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   dtpDataAcaoCloseUp(Sender);
end;

procedure TfrmGerenciamentoPresencas.FiltrarAcoes;
begin
   qyGerenciarPresencas.Close();

   qyGerenciarPresencas.ParamByName('nr_anosemestre').AsInteger := FAnoSemestre;

   if ckbFiltroData.Checked then
   begin
      qyGerenciarPresencas.ParamByName('dt_execucao_acao').AsDate := dtpDataAcao.Date;
   end else begin
      qyGerenciarPresencas.ParamByName('dt_execucao_acao').AsInteger := 0;
   end;

   qyGerenciarPresencas.Open();
end;

procedure TfrmGerenciamentoPresencas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmGerenciamentoPresencas.FormCreate(Sender: TObject);
begin
   CarregarComboAcao();
end;

procedure TfrmGerenciamentoPresencas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2: if btnIncluir.Enabled then btnIncluirClick(nil);
      VK_F3: if btnAlterar.Enabled then btnAlterarClick(nil);
      VK_F5: if btnSalvar.Enabled then btnSalvarClick(nil);
      VK_F6: if btnCancelar.Enabled then btnCancelarClick(nil);
      VK_F9: if btnExcluir.Enabled then btnExcluirClick(nil);
      VK_F12: if btnFechar.Enabled then btnFecharClick(nil);
   end;
end;

procedure TfrmGerenciamentoPresencas.FormShow(Sender: TObject);
begin
   txtAnoSem.Text := IntToStr(TUMNucleo.GetAnosemestreInicial());
   dtpDataAcao.Date := TUMNucleo.GetDataAtual();

   FiltrarAcoes();
end;

function TfrmGerenciamentoPresencas.GetAcaoAtual: String;
begin
   Result := TItemCombo(cbAcao.Items.Objects[cbAcao.ItemIndex]).getCodigo();
end;

function TfrmGerenciamentoPresencas.GetAnoSemestre: Integer;
begin
   Result := StrToIntDef( txtAnoSem.Text, 1 );
end;

function TfrmGerenciamentoPresencas.GetDescricaoAcao(
  const cd_acao: String): String;
begin
   Result := TItemCombo(cbAcao.Items.Objects[GetIndiceAcaoByCodigo(cd_acao)]).getDescricao();
end;

function TfrmGerenciamentoPresencas.GetIndiceAcaoByCodigo(
  const cd_acao: String): Integer;
var
   I : Integer;
begin
   for I := 0 to cbAcao.Items.Count - 1 do
   begin
      if ( cbAcao.Items.Objects[I] <> nil ) AND
         ( cbAcao.Items.Objects[I] is TItemCombo ) AND
         ( TItemCombo(cbAcao.Items.Objects[I]).getCodigo() = cd_acao ) then
      begin
         Result := I;
         Exit;
      end;
   end;

   raise Exception.Create('Tipo de Ação inválida. Tipo: ' + cd_acao);
end;

procedure TfrmGerenciamentoPresencas.IncluirAcao(const nr_anosemestre: Integer;
  const cd_curso, cd_turma: String; const cd_disciplina: Integer;
  const cd_acao: String; const dt_acao: TDate);
const
   SQL_INCLUSAO_ACAO =
      ' INSERT IGNORE INTO ta_gerenciar_presencas(nr_anosemestre, cd_curso, cd_turma, cd_disciplina, cd_acao, dt_execucao_acao) ' +
      ' SELECT t.anosemestre, t.curso, t.codigo, thc.cd_disciplina, :cd_acao, :dt_execucao ' +
      ' FROM turmas_horarios_config thc ' +
      '      INNER JOIN turmas t ON ( t.codigo = thc.cd_turma AND t.anosemestre = thc.nr_anosemestre ) ' +
      '      LEFT JOIN ta_gerenciar_presencas tgp ON ( ' +
      '         tgp.nr_anosemestre = thc.nr_anosemestre AND tgp.cd_curso = t.curso AND ' +
      '         tgp.cd_turma = thc.cd_turma AND tgp.cd_disciplina = thc.cd_disciplina AND ' +
		'         DATE_FORMAT(tgp.dt_execucao_acao, ''%Y-%m-%d'') = :dt_execucao ' +
      '      ) ' +
      ' WHERE thc.nr_anosemestre = :nr_anosemestre AND t.curso = :cd_curso AND ' +
      '       tgp.cd_gerenciar_presenca IS NULL AND ' +
      '       IS_HORARIO_TURMA_ATIVA(:dt_execucao, thc.dt_inicial, thc.dt_final, thc.sn_ativo) = 1 AND ' +
      '       thc.nr_dia_semana = DAYOFWEEK(:dt_execucao) ';
   SQL_CONDICAO_TURMA = ' AND thc.cd_turma = :cd_turma ';
   SQL_CONDICAO_DISCIPLINA = ' AND thc.cd_disciplina = :cd_disciplina ';
   SQL_GROUP_BY = ' GROUP BY t.anosemestre, t.curso, t.codigo, thc.cd_disciplina ';
var
   qyInclusao : TUMZQuery;
   sTurmaLog, sDisciplinaLog: String;
begin
   DM.CriarConsulta( qyInclusao );

   qyInclusao.SQL.Clear();
   qyInclusao.SQL.Add(SQL_INCLUSAO_ACAO);

   qyInclusao.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyInclusao.ParamByName('cd_curso').AsString := cd_curso;
   qyInclusao.ParamByName('cd_acao').AsString := cd_acao;
   qyInclusao.ParamByName('dt_execucao').AsDate := dt_acao;

   sTurmaLog := 'TODAS';
   sDisciplinaLog := 'TODAS';

   if cd_turma <> '' then
   begin
      qyInclusao.SQL.Add(SQL_CONDICAO_TURMA);
      qyInclusao.ParamByName('cd_turma').AsString := cd_turma;
      sTurmaLog := cd_turma;
   end;

   if cd_disciplina > 0 then
   begin
      qyInclusao.SQL.Add(SQL_CONDICAO_DISCIPLINA);
      qyInclusao.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      sDisciplinaLog := IntToStr(cd_disciplina);
   end;

   qyInclusao.SQL.Add(SQL_GROUP_BY);

   qyInclusao.ExecSQL();
   DM.SetLog(10043, 'inclusao', Format(
      '%d;%s;%s;%s',
      [nr_anosemestre, cd_curso, sTurmaLog, sDisciplinaLog]
   ), DM.UsuarioLogado.GetColigadaLogada.Codigo, Format('Ação: %s', [GetDescricaoAcao(cd_acao)]));

   FreeAndNil(qyInclusao);
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasAfterOpen(
  DataSet: TDataSet);
begin
   DM.db.SQLHourGlass := True;
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasAfterScroll(
  DataSet: TDataSet);
begin
   DM.db.SQLHourGlass := True;
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasBeforeEdit(
  DataSet: TDataSet);
const
   MSG_OBRIGATORIO_DATA_POSTERIOR =
      'Não é possível realizar a alteração de registros anteriores a data atual.';
   MSG_AVISO_DATA_ATUAL =
      'Você está alterando uma ação a ser executada para o dia de hoje. ' + #13 +
      'Caso o encerramento de período já tenha sido executado, a ação alterada neste momento será desconsiderada.' + #13 + #13 +
      'Deseja continuar mesmo assim?';
begin
   if NOT(DM.UsuarioLogado.TemPermissao(0, PERMISSAO_GERENCIAMENTO_PRESENCAS, npAlterar, True)) then
      Abort();

   case TGeneral.ComparacaoData(dtpDataAcao.Date, TUMNucleo.GetDataAtual()) of
      cdMenor: begin
         Mensagem(MSG_OBRIGATORIO_DATA_POSTERIOR, '', MB_OK + MB_ICONSTOP, Handle);
         Abort();
      end;
      cdIgual: begin
         if Mensagem(MSG_AVISO_DATA_ATUAL, 'ATENÇÃO', MB_YESNO + MB_ICONEXCLAMATION + MB_DEFBUTTON2, Handle) <> mrYes then
         begin
            Abort();
         end;
      end;
   end;
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasBeforeInsert(
  DataSet: TDataSet);
const
   MSG_OBRIGATORIO_DATA_POSTERIOR =
      'Não é possível realizar a inclusão de registros anteriores a data atual.';
   MSG_AVISO_DATA_ATUAL =
      'Você está incluindo uma ação a ser executada para o dia de hoje. ' + #13 +
      'Caso o encerramento de período já tenha sido executado, a ação inserida neste momento será desconsiderada.' + #13 + #13 +    
      'Deseja continuar mesmo assim?';
begin
   if NOT(DM.UsuarioLogado.TemPermissao(0, PERMISSAO_GERENCIAMENTO_PRESENCAS, npIncluir, True)) then
      Abort();

   case TGeneral.ComparacaoData(dtpDataAcao.Date, TUMNucleo.GetDataAtual()) of
      cdMenor: begin
         Mensagem(MSG_OBRIGATORIO_DATA_POSTERIOR, '', MB_OK + MB_ICONSTOP, Handle);
         Abort();
      end;
      cdIgual: begin
         if Mensagem(MSG_AVISO_DATA_ATUAL, 'ATENÇÃO', MB_YESNO + MB_ICONEXCLAMATION + MB_DEFBUTTON2, Handle) <> mrYes then
         begin
            Abort();
         end;
      end;
   end;
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasBeforeOpen(
  DataSet: TDataSet);
begin
   DM.db.SQLHourGlass := False;
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasBeforePost(
  DataSet: TDataSet);
begin
   if NOT(DadosValidos()) then
      Abort();
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasBeforeScroll(
  DataSet: TDataSet);
begin
   DM.db.SQLHourGlass := False;
end;

procedure TfrmGerenciamentoPresencas.qyGerenciarPresencasCalcFields(
  DataSet: TDataSet);
begin
   qyGerenciarPresencasds_acao.AsString := GetDescricaoAcao(qyGerenciarPresencascd_acao.AsString);
end;

procedure TfrmGerenciamentoPresencas.SetAnoSemestre(const Value: Integer);
begin
   txtAnoSem.Text := IntToStr(Value);
end;

procedure TfrmGerenciamentoPresencas.sbTurmaClick(Sender: TObject);
var
   resultado : TResultadoFiltroTurma;
begin
   resultado := TfrmSelecionarTurma.Filtrar([], FAnoSemestre, -1, -1, FCurso);

   if resultado.filtrado then
   begin
      FCurso := resultado.cd_curso;
      edCurso.Text := resultado.ds_curso;

      FTurma := resultado.cd_turma;
      edTurma.Text := resultado.ds_turma;

      edTurma.Font.Color := clBlack;
   end;
end;

procedure TfrmGerenciamentoPresencas.sbDisciplinaClick(Sender: TObject);
var
   resultado : TResultadoFiltroDisciplina;
begin
   resultado := TfrmSelecionarDisciplina.Filtrar([bfdCurso], FCurso, FAnoSemestre, FTurma);

   if resultado.filtrado then
   begin
      FDisciplina := resultado.cd_disciplina;
      edDisciplina.Text := resultado.ds_disciplina;

      edDisciplina.Font.Color := clBlack;
   end;
end;

procedure TfrmGerenciamentoPresencas.sbCursoClick(Sender: TObject);
var
   resultado : TResultadoFiltroCurso;
begin
   resultado := TfrmSelecionarCurso.Filtrar([], -1, -1, FAnoSemestre);

   if resultado.filtrado then
   begin
      FCurso := resultado.cd_curso;
      edCurso.Text := resultado.ds_curso;
   end;
end;

procedure TfrmGerenciamentoPresencas.txtAnoSemChange(Sender: TObject);
begin
   FiltrarAcoes();
end;

procedure TfrmGerenciamentoPresencas.udAnoSemClick(Sender: TObject;
  Button: TUDBtnType);
begin
   DM.inc_dec_ano_semestre(txtAnoSem, Button);
end;

end.
