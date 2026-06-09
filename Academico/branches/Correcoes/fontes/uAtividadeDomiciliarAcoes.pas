unit uAtividadeDomiciliarAcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Mask, ToolWin, ImgList, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, DBCtrls, uFSelecionarPessoa;

type
  TfrmAtividadeDomiciliarAcoes = class(TForm)
    pnTitulo: TPanel;
    pnFiltro: TPanel;
    gbFiltro: TGroupBox;
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
    dpDataInicial: TDateTimePicker;
    dpDataFinal: TDateTimePicker;
    lbTurma: TLabel;
    sbTurma: TSpeedButton;
    lbObservacoes: TLabel;
    tbAcoes: TToolBar;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ilAcoes: TImageList;
    qySituacao: TUMZQuery;
    dbeAluno: TDBEdit;
    dbeTurma: TDBEdit;
    dbcSituacao: TDBLookupComboBox;
    dbmObservacoes: TDBMemo;
    dsAtividadeDomiciliar: TDataSource;
    qyAtividadeDomiciliar: TUMZQuery;
    qyAtividadeDomiciliarnr_anosemestre: TIntegerField;
    qyAtividadeDomiciliarcd_curso: TStringField;
    qyAtividadeDomiciliarcd_turma: TStringField;
    qyAtividadeDomiciliards_observacao: TMemoField;
    qyAtividadeDomiciliardt_inicio: TDateField;
    qyAtividadeDomiciliardt_fim: TDateField;
    dbeCurso: TDBEdit;
    dsSituacao: TDataSource;
    qySituacaods_situacao: TStringField;
    qyAtividadeDomiciliards_situacao: TStringField;
    qySituacaocd_situacao: TLargeintField;
    qyAtividadeDomiciliarcd_situacao: TIntegerField;
    qyAtividadeDomiciliarcd_pessoa: TIntegerField;
    qyAtividadeDomiciliardt_cadastro: TDateTimeField;
    qyAtividadeDomiciliarcd_usuario_cadastrou: TIntegerField;
    qyVerificaAlunoTurma: TUMZQuery;
    qyVerificaAlunoTurmaaluno_cursa: TLargeintField;
    qyAtividadeDomiciliarnm_pessoa: TStringField;
    qyNmPessoa: TUMZQuery;
    qyNmPessoanm_pessoa: TStringField;
    procedure qyAtividadeDomiciliarCalcFields(DataSet: TDataSet);
    procedure dbeTurmaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeAlunoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbTurmaClick(Sender: TObject);
    procedure sbCursoClick(Sender: TObject);
    procedure dsAtividadeDomiciliarStateChange(Sender: TObject);
    procedure sbAlunoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure udAnosemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function validarInformacoes(): Boolean;
  public
    { Public declarations }
    procedure Filtrar();
    
    var
      cd_atividade: Integer;
  end;

var
  frmAtividadeDomiciliarAcoes: TfrmAtividadeDomiciliarAcoes;

implementation

uses
   uDM, General, uFSelecionarCurso, uFSelecionarTurma, uUsuario, UFObservacoes;

{$R *.dfm}

procedure TfrmAtividadeDomiciliarAcoes.FormCreate(Sender: TObject);
begin
   // Inicializa o código de atividade com 0 (não possui atividade)
   cd_atividade := 0;
end;

procedure TfrmAtividadeDomiciliarAcoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   {Configura as teclas de atalho}
   case key of
      VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
      VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
   end;
end;

procedure TfrmAtividadeDomiciliarAcoes.FormShow(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmAtividadeDomiciliarAcoes.qyAtividadeDomiciliarCalcFields(
  DataSet: TDataSet);
begin
   qyNmPessoa.Close;
   qyNmPessoa.ParamByName('cd_pessoa').AsInteger := qyAtividadeDomiciliar.FieldByName('cd_pessoa').AsInteger;
   qyNmPessoa.Open;

   if not qyNmPessoa.Eof then
   begin
      qyAtividadeDomiciliar.FieldByName('nm_pessoa').AsString := qyAtividadeDomiciliar.FieldByName('cd_pessoa').AsString + ' - ' + qyNmPessoa.FieldByName('nm_pessoa').AsString;
   end;

end;

procedure TfrmAtividadeDomiciliarAcoes.sbAlunoClick(Sender: TObject);
var
   pessoaFiltrada: TResultadoFiltroPessoa;
   objPessoa: TfrmSelecionarPessoa;
begin
   pessoaFiltrada := TfrmSelecionarPessoa.Filtrar([bapPessoa, bapProfessor, bapAvancada, bapObservacoes, bapFuncionario, bapOrientador, bapOrientadorAtivo, bapFornecedor], afpEstudante, StrToInt(edAnosemestre.Text));

   if pessoaFiltrada.filtrado then
	begin
      qyAtividadeDomiciliar.FieldByName('cd_pessoa').AsInteger := pessoaFiltrada.cd_pessoa;
	end;
end;

procedure TfrmAtividadeDomiciliarAcoes.sbCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   // Chama o form de filtro de cursos
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(edAnosemestre.Text));

   // Verifica se houve algum curso filtrado
   if resultado_filtro.filtrado then
   Begin
      // Atualiza o anosemestre de acordo com o curso filtrado
      edAnosemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );

      // Atualiza o curso
      qyAtividadeDomiciliar.FieldByName('cd_curso').AsString := resultado_filtro.cd_curso;

      // Atualiza a turma
      qyAtividadeDomiciliar.FieldByName('cd_turma').AsString := '';
   end;
end;

procedure TfrmAtividadeDomiciliarAcoes.sbTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin

   // Chama o formulário de filtro de turmas
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(edAnosemestre.Text), -1, -1, qyAtividadeDomiciliar.FieldByName('cd_curso').AsString);

   // Verifica se houve alguma turma filtrada
   if resultado_filtro.filtrado then
   begin
      // Atualiza o curso e anosemestre de acordo com a turma filtrada
      edAnosemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      qyAtividadeDomiciliar.FieldByName('cd_curso').AsString := resultado_filtro.cd_curso;

      // Atualiza a turma
      qyAtividadeDomiciliar.FieldByName('cd_turma').AsString := resultado_filtro.cd_turma;
   end;
end;

procedure TfrmAtividadeDomiciliarAcoes.udAnosemestreClick(Sender: TObject;
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

procedure TfrmAtividadeDomiciliarAcoes.btnCancelarClick(Sender: TObject);
begin
   qyAtividadeDomiciliar.Cancel;
   Close;
end;

procedure TfrmAtividadeDomiciliarAcoes.btnSalvarClick(Sender: TObject);
var
   sObservacao: String;
begin

   if (qyAtividadeDomiciliar.State in [dsInsert]) and (not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npIncluir, False )) then Exit;
   if (qyAtividadeDomiciliar.State in [dsEdit]) and (not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GerenciamentoAtividadesDomiciliar', npAlterar, False )) then Exit;

   // Verifica se todas as informações fornecidas pelo usuário estão corretas
   if not validarInformacoes() then
   begin
      Abort;
   end;

   // Verifica se o usuário está Inserindo uma nova atividade
   if qyAtividadeDomiciliar.State in [dsInsert] then
   begin
      qyAtividadeDomiciliar.FieldByName('nr_anosemestre').AsString := edAnosemestre.Text;
      qyAtividadeDomiciliar.FieldByName('dt_cadastro').AsDateTime := DM.DataAtual;
      qyAtividadeDomiciliar.FieldByName('cd_usuario_cadastrou').AsInteger := DM.iCdPessoaLogado;
   end;

   qyAtividadeDomiciliar.FieldByName('dt_inicio').AsDateTime := dpDataInicial.DateTime;
   qyAtividadeDomiciliar.FieldByName('dt_fim').AsDateTime := dpDataFinal.DateTime;


   // Prepara a observação para incluir na matricula do aluno
   if qyAtividadeDomiciliar.State in [dsEdit] then
   begin
      sObservacao := 'Atividade Domiciliar do aluno alterada:' + #13;
   end else begin
      sObservacao := 'Aluno incluído em Atividade Domiciliar:' + #13;
   end;
   sObservacao := sObservacao + 'Ano/Semestre: ' + qyAtividadeDomiciliar.FieldByName('nr_anosemestre').AsString + #13;
   sObservacao := sObservacao + 'Curso: ' + qyAtividadeDomiciliar.FieldByName('cd_curso').AsString + #13;
   sObservacao := sObservacao + 'Turma: ' + qyAtividadeDomiciliar.FieldByName('cd_turma').AsString + #13;
   sObservacao := sObservacao + 'Período: ' + qyAtividadeDomiciliar.FieldByName('dt_inicio').AsString + ' até ' + qyAtividadeDomiciliar.FieldByName('dt_fim').AsString + #13;
   sObservacao := sObservacao + 'Situacao: ' + qyAtividadeDomiciliar.FieldByName('ds_situacao').AsString + #13;
   sObservacao := sObservacao + 'Observação: ' + dbmObservacoes.Text;

   // Inclui uma observação na matrícula do aluno
   TfObservacoes.RegisterObservation(qyAtividadeDomiciliar.FieldByName('cd_pessoa').AsInteger, okMatriculation, sObservacao);

   // Inclui a atividade domiciliar
   qyAtividadeDomiciliar.Post;

   // Fecha a tela com a atividade
   Close;
end;

procedure TfrmAtividadeDomiciliarAcoes.dbeAlunoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_DELETE) and (sbAluno.Enabled) then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfrmAtividadeDomiciliarAcoes.dbeCursoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_DELETE) and (sbCurso.Enabled) then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfrmAtividadeDomiciliarAcoes.dbeTurmaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_DELETE) and (sbTurma.Enabled) then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfrmAtividadeDomiciliarAcoes.dsAtividadeDomiciliarStateChange(
  Sender: TObject);
begin
   // Permite modificar os campos de aluno, curso, anosemestre e turma somente quando for inserção de nova atividade
   sbAluno.Enabled := qyAtividadeDomiciliar.State in [dsInsert];
   sbCurso.Enabled := qyAtividadeDomiciliar.State in [dsInsert];
   udAnosemestre.Enabled := qyAtividadeDomiciliar.State in [dsInsert];
   sbTurma.Enabled := qyAtividadeDomiciliar.State in [dsInsert];
end;

procedure TfrmAtividadeDomiciliarAcoes.Filtrar();
begin

   qyAtividadeDomiciliar.Close;
   qyAtividadeDomiciliar.ParamByName('cd_atividade').AsInteger := cd_atividade;
   qyAtividadeDomiciliar.Open;

   if not qyAtividadeDomiciliar.Eof then
   begin
      dpDataInicial.DateTime := qyAtividadeDomiciliar.FieldByName('dt_inicio').AsDateTime;
      dpDataFinal.DateTime := qyAtividadeDomiciliar.FieldByName('dt_fim').AsDateTime;

      edAnosemestre.Text := qyAtividadeDomiciliar.FieldByName('nr_anosemestre').AsString;

      qyAtividadeDomiciliar.Edit;
   end else begin
      dpDataInicial.DateTime := DM.DataAtual;
      dpDataFinal.DateTime := DM.DataAtual;

      edAnosemestre.Text := IntToStr(DM.GetAnoSemestreAtual);

      qyAtividadeDomiciliar.Insert;
   end;

end;

function TfrmAtividadeDomiciliarAcoes.validarInformacoes(): Boolean;
var
   slErros: TStringList;
begin

   slErros := TStringList.Create;

   // Verifica se houve algum aluno selecionado
   if qyAtividadeDomiciliar.FieldByName('cd_pessoa').IsNull then
   begin
      slErros.Add('- Selecione um aluno');
   end;

   // Verifica se foi informado um curso
   if qyAtividadeDomiciliar.FieldByName('cd_curso').IsNull then
   begin
      slErros.Add('- Selecione um curso');
   end;

   // Verifica se foi informado uma turma
   if qyAtividadeDomiciliar.FieldByName('cd_turma').IsNull then
   begin
      slErros.Add('- Selecione uma turma');
   end;

   // Se todas as informações de curso, turma e aluno foram informadas, verifica se o aluno curso o curso/turma/anosemestre selecionados
   if slErros.Count = 0 then
   begin
      qyVerificaAlunoTurma.Close;
      qyVerificaAlunoTurma.ParamByName('nr_anosemestre').AsInteger := StrToInt(edAnosemestre.Text);
      qyVerificaAlunoTurma.ParamByName('cd_curso').AsString := qyAtividadeDomiciliar.FieldByName('cd_curso').AsString;
      qyVerificaAlunoTurma.ParamByName('cd_turma').AsString := qyAtividadeDomiciliar.FieldByName('cd_turma').AsString;
      qyVerificaAlunoTurma.ParamByName('cd_pessoa').AsInteger := qyAtividadeDomiciliar.FieldByName('cd_pessoa').AsInteger;
      qyVerificaAlunoTurma.Open;

      // Verifica se o aluno não cursa o curso/anosemestre/turmas informados
      if qyVerificaAlunoTurma.FieldByName('aluno_cursa').AsInteger = 0 then
      begin
         slErros.Add('- O aluno não possui vinculo com o Ano/Semestre, Curso e Turmas selecionados');
      end;
   end;

   // Verifica se houve alguma situação foi selecionada
   if qyAtividadeDomiciliar.FieldByName('cd_situacao').IsNull then
   begin
      slErros.Add('- Selecione uma situação');
   end;

   // A data inicial da atividade domiciliar deve ser menor ou igual a data final da mesma
   if dpDataInicial.DateTime > dpDataFinal.DateTime then
   begin
      slErros.Add('- Data de início é maior que data de fim');
   end;

   // Verifica se ocorreu algum erro durante o processo de salvar
   if slErros.Count > 0 then
   begin
      slErros.Delimiter := #13;
      slErros.QuoteChar := ' ';
      Mensagem('Verifique os erros abaixo antes de prosseguir:' + #13 + slErros.DelimitedText, 'Atenção', MB_OK);

      Result := False;
   end else begin
      Result := True;
   end;

end;

end.
