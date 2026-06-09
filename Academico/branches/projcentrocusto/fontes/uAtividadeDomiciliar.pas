unit uAtividadeDomiciliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ToolWin,
  ImgList, Grids, DBGrids, UMComboBox, uFSelecionarPessoa, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uAtividadeDomiciliarAcoes;

type
  TfrmAtividadeDomiciliar = class(TForm)
    pnTitulo: TPanel;
    pnFiltro: TPanel;
    gbFiltro: TGroupBox;
    lbUnidade: TLabel;
    lbAnosemestre: TLabel;
    sbAluno: TSpeedButton;
    lbAluno: TLabel;
    lbCurso: TLabel;
    sbCurso: TSpeedButton;
    lbSituacao: TLabel;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    edAnosemestre: TMaskEdit;
    udAnosemestre: TUpDown;
    edAluno: TEdit;
    cbSituacao: TComboBox;
    btFiltrar: TBitBtn;
    dpDataInicial: TDateTimePicker;
    dpDataFinal: TDateTimePicker;
    tbAcoes: TToolBar;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    tbSeparador1: TToolButton;
    btnFechar: TToolButton;
    tbSeparador2: TToolButton;
    ilAcoes: TImageList;
    pnAtividades: TPanel;
    grAtividades: TDBGrid;
    cbUnidade: TUMComboBox;
    sbUnidade: TSpeedButton;
    qySituacao: TUMZQuery;
    qySituacaods_valor: TStringField;
    qySituacaocodigo: TLargeintField;
    edCurso: TEdit;
    qyAtividades: TUMZQuery;
    dsAtividades: TDataSource;
    qyAtividadesnm_pessoa: TStringField;
    qyAtividadesnr_anosemestre: TIntegerField;
    qyAtividadesds_curso: TStringField;
    qyAtividadesdt_inicio: TStringField;
    qyAtividadesdt_fim: TStringField;
    qyAtividadescd_turma: TStringField;
    qyAtividadescd_atividade: TIntegerField;
    qyExcluirAtividade: TUMZQuery;
    ckDtInicio: TCheckBox;
    ckDtFinal: TCheckBox;
    qyObsExclusaoAtividadeDomiciliar: TUMZQuery;
    qyObsExclusaoAtividadeDomiciliarcd_pessoa: TIntegerField;
    qyObsExclusaoAtividadeDomiciliarnr_anosemestre: TIntegerField;
    qyObsExclusaoAtividadeDomiciliarcd_curso: TStringField;
    qyObsExclusaoAtividadeDomiciliarcd_turma: TStringField;
    qyObsExclusaoAtividadeDomiciliardt_inicio: TStringField;
    qyObsExclusaoAtividadeDomiciliardt_fim: TStringField;
    qyObsExclusaoAtividadeDomiciliards_situacao: TStringField;
    qyObsExclusaoAtividadeDomiciliards_observacao: TMemoField;
    edTurma: TEdit;
    lbTurma: TLabel;
    sbTurma: TSpeedButton;
    procedure sbTurmaClick(Sender: TObject);
    procedure ckDtFinalClick(Sender: TObject);
    procedure ckDtInicioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edAlunoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure edCursoChange(Sender: TObject);
    procedure cbUnidadeChange(Sender: TObject);
    procedure udAnosemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure sbAlunoClick(Sender: TObject);
    procedure sbCursoClick(Sender: TObject);
    procedure sbUnidadeClick(Sender: TObject);
  private
    procedure Filtrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtividadeDomiciliar: TfrmAtividadeDomiciliar;
  frmAtividadeDomiciliarAcoes: TfrmAtividadeDomiciliarAcoes;
  abaSelecionada: AbasFiltroPessoa;

implementation

uses
   Main, uDM, General, uFSelecionarColigada, uFSelecionarCurso, uFSelecionarTurma, uItemCombo, uColigada, uUsuario, UFObservacoes;

{$R *.dfm}

procedure TfrmAtividadeDomiciliar.btFiltrarClick(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmAtividadeDomiciliar.btnAlterarClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npAlterar, True ) then Exit;

   // Verifica se possui alguma atividade domiciliar selecionada
   if qyAtividades.FieldByName('cd_atividade').AsInteger > 0 then
   begin

      // Exibe a tela para cadastro de novas atividades domiciliares
      if frmAtividadeDomiciliarAcoes = nil then
      begin
         Application.CreateForm(TfrmAtividadeDomiciliarAcoes, frmAtividadeDomiciliarAcoes);
      end;

      frmAtividadeDomiciliarAcoes.cd_atividade := qyAtividades.FieldByName('cd_atividade').AsInteger;

      frmAtividadeDomiciliarAcoes.ShowModal();

      Filtrar();

   end
   else
   begin
      Mensagem('Selecione um registro para alterar.', 'Atenção', MB_OK);
   end;

end;

procedure TfrmAtividadeDomiciliar.btnExcluirClick(Sender: TObject);
var
   sObservacao : string;
begin

   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npExcluir, True ) then Exit;

   // Verifica se possui alguma atividade domiciliar selecionada
   if qyAtividades.FieldByName('cd_atividade').AsInteger > 0 then
   begin

      if Mensagem('Você tem certeza que deseja excluir o registro selecionado?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
         // Registra observação na matricula do aluno sobre a atividade domiciliar removida
         qyObsExclusaoAtividadeDomiciliar.Close;
         qyObsExclusaoAtividadeDomiciliar.ParamByName('cd_atividade').AsInteger := qyAtividades.FieldByName('cd_atividade').AsInteger;
         qyObsExclusaoAtividadeDomiciliar.Open;

         if not qyObsExclusaoAtividadeDomiciliar.Eof then
         begin
            sObservacao := 'Atividade Domiciliar do aluno foi removida:' + #13;
            sObservacao := sObservacao + 'Ano/Semestre: ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('nr_anosemestre').AsString + #13;
            sObservacao := sObservacao + 'Curso: ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('cd_curso').AsString + #13;
            sObservacao := sObservacao + 'Turma: ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('cd_turma').AsString + #13;
            sObservacao := sObservacao + 'Período: ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('dt_inicio').AsString + ' até ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('dt_fim').AsString + #13;
            sObservacao := sObservacao + 'Situacao: ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('ds_situacao').AsString + #13;
            sObservacao := sObservacao + 'Observação: ' + qyObsExclusaoAtividadeDomiciliar.FieldByName('ds_observacao').AsString;

            // Inclui uma observação na matrícula do aluno
            TfObservacoes.RegisterObservation(qyObsExclusaoAtividadeDomiciliar.FieldByName('cd_pessoa').AsInteger, okMatriculation, sObservacao);
         end;

         // Deleta todos os registros de turmas/disciplinas do prazo selecionado
         qyExcluirAtividade.Close;
         qyExcluirAtividade.ParamByName('cd_atividade').AsInteger := qyAtividades.FieldByName('cd_atividade').AsInteger;
         qyExcluirAtividade.ExecSQL;

         // Atualiza os dados da grid
         Filtrar;
      end;

   end
   else
   begin
      Mensagem('Selecione um registro para excluir.', 'Atenção', MB_OK);
   end;
end;

procedure TfrmAtividadeDomiciliar.btnFecharClick(Sender: TObject);
begin
   qySituacao.Close;
   Close;
end;

procedure TfrmAtividadeDomiciliar.btnInserirClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npIncluir, True ) then Exit;

   // Exibe a tela para cadastro de novas atividades domiciliares
   if frmAtividadeDomiciliarAcoes = nil then
   begin
      Application.CreateForm(TfrmAtividadeDomiciliarAcoes, frmAtividadeDomiciliarAcoes);
   end;

   frmAtividadeDomiciliarAcoes.cd_atividade := 0;

   frmAtividadeDomiciliarAcoes.ShowModal();

   Filtrar();
end;

procedure TfrmAtividadeDomiciliar.cbUnidadeChange(Sender: TObject);
begin
   // Se mudar a unidade, deve filtrar novamente o curso e aluno
   edCurso.Text := '';
   edAluno.Text := '';
end;

procedure TfrmAtividadeDomiciliar.ckDtFinalClick(Sender: TObject);
begin
   dpDataFinal.Enabled := ckDtFinal.Checked;
end;

procedure TfrmAtividadeDomiciliar.ckDtInicioClick(Sender: TObject);
begin
   dpDataInicial.Enabled := ckDtInicio.Checked;
end;

procedure TfrmAtividadeDomiciliar.edAlunoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfrmAtividadeDomiciliar.edCursoChange(Sender: TObject);
begin
   // Se mudar o curso deve filtrar novamente o aluno
   edAluno.Text := '';
end;

procedure TfrmAtividadeDomiciliar.edCursoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfrmAtividadeDomiciliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAtividadeDomiciliar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {Configura as teclas de atalho}
   case key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btnInserir.Enabled then btnInserirClick( nil );
      VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
      VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
      VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
   end;
end;

procedure TfrmAtividadeDomiciliar.FormShow(Sender: TObject);
begin

   btnInserir.Enabled := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npIncluir, False );
   btnAlterar.Enabled := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npAlterar, False );
   btnExcluir.Enabled := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npExcluir, False );

   // Carrega as coligadas para dentro da combo de unidades
   DM.CarregaColigadas(cbUnidade);

   // Busca o anosemestre atual para carregar ao abrir a tela
   edAnosemestre.Text := IntToStr(DM.GetAnoSemestreAtual);

   // Apresenta inicialmente a data atual para filtro
   dpDataInicial.DateTime := DM.DataAtual;
   dpDataFinal.DateTime := DM.DataAtual;

   // Busca as situações definidas para atividades domiciliares
   qySituacao.Close;
   qySituacao.Open;

   cbSituacao.AddItem('Todas as situações.', TItemCombo.Create('0', '0'));
   while not qySituacao.Eof do
   begin
      cbSituacao.AddItem(qySituacao.FieldByName('ds_valor').AsString, TItemCombo.Create(qySituacao.FieldByName('codigo').AsString, qySituacao.FieldByName('codigo').AsString));

      qySituacao.Next;
   end;
   // Seleciona a primeira opção como padrão
   cbSituacao.ItemIndex := 0;

   // Executa o filtro da tela
   Filtrar();
end;

procedure TfrmAtividadeDomiciliar.Filtrar();
var
   cd_situacao, nr_anosemestre, cd_curso, cd_pessoa: String;
begin
   // Fecha o SQL atual de pesquisa de atividades domiciliares
   qyAtividades.Close;

   // Aplica o filtro de coligada
   if cbUnidade.ItemIndex > 0 then
   begin
      qyAtividades.ParamByName('cd_coligada').AsInteger := TColigada(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).Codigo;
   end else begin
      qyAtividades.ParamByName('cd_coligada').Clear;
   end;

   // Aplica o filtro de anosemestre
   qyAtividades.ParamByName('nr_anosemestre').AsString := edAnosemestre.Text;

   // Aplica o filtro de curso
   if Length(edCurso.Text) > 0 then
   begin
      qyAtividades.ParamByName('cd_curso').AsString := edCurso.Text;
   end else begin
      qyAtividades.ParamByName('cd_curso').Clear;
   end;

   // Aplica o filtro de curso
   if Length(edTurma.Text) > 0 then
   begin
      qyAtividades.ParamByName('cd_turma').AsString := edTurma.Text;
   end else begin
      qyAtividades.ParamByName('cd_turma').Clear;
   end;

   // Aplica o filtro de aluno
   if Length(edAluno.Text) > 0 then
   begin
      qyAtividades.ParamByName('cd_pessoa').AsInteger := edAluno.Tag;
   end else begin
      qyAtividades.ParamByName('cd_pessoa').Clear;
   end;

   // Aplica o filtro de data de inicio e fim
   if ckDtInicio.Checked then
   begin
      qyAtividades.ParamByName('dt_inicio').AsString := DateToStr(dpDataInicial.Date, DM.fsDateTimeFormatPadrao);
   end else begin
      qyAtividades.ParamByName('dt_inicio').Clear;
   end;

   if ckDtFinal.Checked then
   begin
      qyAtividades.ParamByName('dt_fim').AsString := DateToStr(dpDataFinal.Date, DM.fsDateTimeFormatPadrao);
   end else begin
      qyAtividades.ParamByName('dt_fim').Clear;
   end;

   // Aplica o filtro de situação
   if cbSituacao.ItemIndex > 0 then
   begin
      qyAtividades.ParamByName('cd_situacao').AsString := TItemCombo(cbSituacao.Items.Objects[cbSituacao.ItemIndex]).Codigo;
   end else begin
      qyAtividades.ParamByName('cd_situacao').Clear;
   end;

   qyAtividades.Open;
end;


procedure TfrmAtividadeDomiciliar.sbAlunoClick(Sender: TObject);
var
   pessoaFiltrada: TResultadoFiltroPessoa;
   objPessoa: TfrmSelecionarPessoa;
begin
   pessoaFiltrada := TfrmSelecionarPessoa.Filtrar([bapPessoa, bapProfessor, bapAvancada, bapObservacoes, bapFuncionario, bapOrientador, bapOrientadorAtivo, bapFornecedor], afpEstudante, StrToInt(edAnosemestre.Text));

   if pessoaFiltrada.filtrado then
	begin
      edAluno.Tag := pessoaFiltrada.cd_pessoa;
	   edAluno.Text := IntToStr(pessoaFiltrada.cd_pessoa) + ' - ' + pessoaFiltrada.nm_pessoa;
	end;
end;

procedure TfrmAtividadeDomiciliar.sbCursoClick(Sender: TObject);
var
   cd_coligada: Integer;
   resultado_filtro : TResultadoFiltroCurso;
begin
   // Filtra a coligada selecionada para seleção dos cursos
   if cbUnidade.ItemIndex = 0 then
   begin
      cd_coligada := -1;
   end else begin
      cd_coligada := TColigada(cbUnidade.Items[cbUnidade.ItemIndex]).Codigo;
   end;

   // Chama o form de filtro de cursos
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], cd_coligada, -1, StrToInt(edAnosemestre.Text));

   // Verifica se houve algum curso filtrado
   if resultado_filtro.filtrado then
   Begin
      // Atualiza o anosemestre de acordo com o curso filtrado
      edAnosemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      // Atualiza o curso
      edCurso.Text := resultado_filtro.cd_curso;
      // Atualiza a turma
      edTurma.Text := '';      
   end;
end;

procedure TfrmAtividadeDomiciliar.sbTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin

   // Chama o formulário de filtro de turmas
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(edAnosemestre.Text), -1, -1, edCurso.Text);

   // Verifica se houve alguma turma filtrada
   if resultado_filtro.filtrado then
   begin
      // Atualiza o curso de acordo com a turma filtrada
      edAnosemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      // Atualiza o anosemestre de acordo com o curso filtrado      
      edCurso.Text := resultado_filtro.cd_curso;
      // Atualiza a turma
      edTurma.Text := resultado_filtro.cd_turma;
   end;
end;

procedure TfrmAtividadeDomiciliar.sbUnidadeClick(Sender: TObject);
begin
   if not TfrmSelecionarColigada.ShowModal then Exit;

   cbUnidade.ItemIndex := DM.UsuarioLogado.GetListaColigadasFilhaSelecionada.IndexOf(
      TfrmSelecionarColigada.getResultado.Codigo )+1;
end;

procedure TfrmAtividadeDomiciliar.udAnosemestreClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     edAnosemestre.text := DM.incrementar_ano_semestre(edAnosemestre.Text);
  end
  else
  begin
    edAnosemestre.text := DM.decrementar_ano_semestre(edAnosemestre.Text);
  end;
end;

end.
