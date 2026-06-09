{
   Atenção essa tela gera logs na tabela de logs_geral, quando a situação de um aluno é alterado e/ou a situação do aluno no curso
   cd_modulo = 1081
}

unit uFExportacaoDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, StdCtrls, UMComboBox, DB, DBTables,
  ImgList, Buttons, Grids, DBGrids, ExtDlgs, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, DBCtrls, ClassRegistros;

type
   TipoSituacao = (tsExportado, tsNaoExportado);

  TfExportacaoDados = class(TForm)
    paCabecalho: TPanel;
    pnMarginLeft: TPanel;
    pnMarginRight: TPanel;
    pnCentro: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluirAluno: TToolButton;
    btnExcluirAluno: TToolButton;
    ToolButton4: TToolButton;
    btnExportarDados: TToolButton;
    ToolButton6: TToolButton;
    btnFechar: TToolButton;
    pnProcesso: TPanel;
    Label1: TLabel;
    cbProcessos: TUMComboBox;
    btnCriarProcessoExportacao: TButton;
    ilToolBar: TImageList;
    Panel2: TPanel;
    qyAlunos: TUMZQuery;
    dsAlunos: TDataSource;
    qyAlunoscd_pessoa: TIntegerField;
    qyAlunosnm_pessoa: TStringField;
    qyAlunoscd_turma: TStringField;
    qyAlunoscd_curso: TStringField;
    qyAlunosnr_carga_horaria: TFloatField;
    qyAlunosnr_anosemestre: TSmallintField;
    qyAlunosds_situacao: TStringField;
    qyAlunoscd_situacao: TSmallintField;
    pcExportacao: TPageControl;
    tsAlunos: TTabSheet;
    grdAlunos: TDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    Bevel2: TBevel;
    pnFiltros: TPanel;
    lbCurso: TLabel;
    lbTurma: TLabel;
    lbAluno: TLabel;
    sbBuscaCurso: TSpeedButton;
    sbBuscaTurma: TSpeedButton;
    sbBuscaAluno: TSpeedButton;
    lbSituacao: TLabel;
    edCurso: TEdit;
    edTurma: TEdit;
    edAluno: TEdit;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    cbSituacoes: TUMComboBox;
    tsExportacoes: TTabSheet;
    gdArquivosExportados: TDBGrid;
    qyArquivosExportados: TUMZQuery;
    qyArquivosExportadoscd_processo: TIntegerField;
    qyArquivosExportadosnr_exportacao: TIntegerField;
    qyArquivosExportadossn_oficial: TIntegerField;
    qyArquivosExportadosnome: TStringField;
    qyArquivosExportadosdt_exportacao: TStringField;
    dsArquivosExportados: TDataSource;
    btnBaixarArquivo: TToolButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    sbRegistrarSituacao: TToolButton;
    cbAlteraSituacao: TComboBox;
    pnUltimaExportacao: TPanel;
    Label2: TLabel;
    edUltimaExportacao: TEdit;
    Panel3: TPanel;
    qyAlunosdt_exportado: TDateTimeField;
    btnGeraRelatorio: TToolButton;
    lbSituacaoCurso: TLabel;
    cbSituacoesCurso: TUMComboBox;
    cbAlteraSituacaoCurso: TComboBox;
    qyAlunosds_situacao_curso: TStringField;
    qyAlunoscd_situacao_curso: TSmallintField;
    sbRegistrarSituacaoCurso: TToolButton;
    btnAlterarProcessoSelecionado: TButton;
    qyAlunosnr_anosemestre_formatado: TStringField;
    qyAlunosds_situacao_matricula: TStringField;
    qyAlunossn_excluir: TStringField;
    cbSelecionarExcluir: TCheckBox;
    procedure grdAlunosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbSelecionarExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qyAlunosCalcFields(DataSet: TDataSet);
    procedure btnAlterarProcessoSelecionadoClick(Sender: TObject);
    procedure sbRegistrarSituacaoCursoClick(Sender: TObject);
    procedure cbAlteraSituacaoCursoChange(Sender: TObject);
    procedure gdArquivosExportadosCellClick(Column: TColumn);
    procedure btnGeraRelatorioClick(Sender: TObject);
    procedure gdArquivosExportadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnBaixarArquivoClick(Sender: TObject);
    procedure pcExportacaoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pcExportacaoChange(Sender: TObject);
    procedure grdAlunosTitleClick(Column: TColumn);
    procedure sbBuscaAlunoClick(Sender: TObject);
    procedure sbRegistrarSituacaoClick(Sender: TObject);
    procedure cbAlteraSituacaoChange(Sender: TObject);
    procedure grdAlunosColExit(Sender: TObject);
    procedure grdAlunosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExportarDadosClick(Sender: TObject);
    procedure cbProcessosChange(Sender: TObject);
    procedure btnExcluirAlunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirAlunoClick(Sender: TObject);
    procedure btnCriarProcessoExportacaoClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FOrdenacaoAtual : String;
    FListaProcessosUsaCH_Sit, FListaProcessosUsaAnosemestre : TStringList;
    FListaPessoasSelecionadas : TStringList;
    
    FAnosemestre: Integer;

    // Funções das propertys
    function getSituacao: Integer;
    procedure setSituacao(const Value: Integer);
    function getSituacaoCurso: Integer;
    procedure setSituacaoCurso(const Value: Integer);
    function getAluno: Integer;
    procedure setAluno(const Value: Integer);
    function getTurma: String;
    procedure setTurma(const Value: String);

    function getProcesso: Integer;
    procedure setProcesso(const Value: Integer);
    function getCurso: String;
    procedure setCurso(const Value: String);

    function getProcessoUsaCH_Sit: Boolean;
    function getUsaAnosemestre: Boolean;

    function getQtdAlunosSelecionados: Integer;  
    function getAlunoSelecionado: Boolean;
    procedure setAlunoSelecionado(const Value: Boolean);
    { Private declarations }

    // Função responsável por carregar a combo cbProcessos
    procedure CarregarProcessos();
    // Função responsável por carregar a combo de situações
    procedure CarregarSituacoes();
    // Função responsável por carregar a combo de Situações do aluno no Curso
    procedure CarregarSituacoesCurso();

    // Filtrar
    procedure Filtrar(const sn_filtrar: Boolean = True; ordenacao: String = '');
    // Zerar Filtros
    procedure ZerarFiltros();

    // Executa a Exportação dos Dados
    procedure ExportarDados();

    // Copia exportação oficial
    procedure CopiaExportacao(const nr_exportacao: Integer);

    // Altera a situação dos alunos
    procedure AlteraSituacaoAlunos(tsSituacao: TipoSituacao);
    // Altera a situação do aluno
    procedure AlteraSituacaoAluno(const cd_pessoa, nr_anosemestre: Integer;
            const cd_turma: String; const cd_situacao: Integer);
    // Altera a situação no curso do aluno
    procedure AlteraSituacaoCursoAluno(const cd_pessoa, nr_anosemestre: Integer;
            const cd_turma: String; const cd_situacao_curso: Integer);


    // Mostra/Esconde os campos de Carga horária
    procedure HideShowCH();

    // Mostra arquivos exportados
    procedure MostraArquivosExportados();
    // Baixar arquivo exportado
    procedure BaixarExportacao();
    // Selecionar arquivo como oficial
    procedure SelecionaArquivoOficial(const sn_oficial: Boolean);
    // Verifica se possui arquivo oficial
    function PossuiArquivoOficial(): Boolean;
    // Gerar relatório
    procedure GerarRelatorio();

    // Mostra/Esconde os botões do rodapé
    procedure VerificaBotoes();

    { Propertys }
    property Processo: Integer read getProcesso write setProcesso;
    property ProcessoUsaCH_Sit: Boolean read getProcessoUsaCH_Sit;
    property ProcessoUsaAnosemestre: Boolean read getUsaAnosemestre;
    property Anosemestre: Integer read FAnosemestre write FAnosemestre;
    property Curso: String read getCurso write setCurso;
    property Turma: String read getTurma write setTurma;
    property Aluno: Integer read getAluno write setAluno;
    property Situacao: Integer read getSituacao write setSituacao;
    property SituacaoCurso: Integer read getSituacaoCurso write setSituacaoCurso;
    property AlunoSelecionado: Boolean read getAlunoSelecionado write setAlunoSelecionado;
  public
    { Public declarations }
  end;

var
  fExportacaoDados: TfExportacaoDados;

implementation

uses uDM, uItemCombo, uFSelecionarCurso, uFSelecionarTurma, General,
  uFExportacaoDadosNovoProcesso, uFExportacaoDadosIncluirAlunos, Main,
  uFSelecionarPessoa, uUsuario, uProcessando, uFExportacaoDadosAlteraProcesso, Types;

{$R *.dfm}

// Função responsável por carregar a combo cbProcessos
procedure TfExportacaoDados.AlteraSituacaoAluno(const cd_pessoa,
  nr_anosemestre: Integer; const cd_turma: String; const cd_situacao: Integer);
const
   SQL_ALTERA_SITUACAO = 'UPDATE expo_processo_pessoas SET cd_situacao = :cd_situacao ' +
                         'WHERE cd_processo = :cd_processo AND cd_pessoa = :cd_pessoa AND ' +
                         '      nr_anosemestre = :nr_anosemestre AND cd_turma = :cd_turma ';
var
   qyAlteraSituacao: TUMZQuery;
begin
   if (qyAlunoscd_situacao.AsInteger = 0) then
   begin
      Mensagem('Você não pode alterar a situação de um aluno que ainda não foi exportado.');
      Exit;
   end;       

   if (cd_situacao = 0) OR (cd_situacao = 1) then
   begin
      Mensagem('Você não pode definir o aluno com situações padrões do sistema.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      Exit;
   end;

   DM.CriarConsulta(qyAlteraSituacao);

   with qyAlteraSituacao do
   begin
      SQL.Text := SQL_ALTERA_SITUACAO;

      ParamByName('cd_situacao').AsInteger := cd_situacao;

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;

      ExecSQL();

      DM.setLog(1081, '3',
             IntToStr(Processo)+';'+qyAlunosnr_anosemestre.AsString+';'+qyAlunoscd_turma.AsString+';'+qyAlunoscd_pessoa.AsString, 1,
             'Alterado situação de ['+qyAlunoscd_situacao.AsString+', '+qyAlunosds_situacao.AsString+'] para ['+IntToStr(cd_situacao)+', '+(cbAlteraSituacao.Items.Objects[cbAlteraSituacao.ItemIndex] as TItemCombo).getDescricao()+']');
   end;

   Filtrar();
end;

procedure TfExportacaoDados.AlteraSituacaoAlunos(tsSituacao: TipoSituacao);
const
   SQL_ALTERA_SITUACAO = 'UPDATE expo_processo_pessoas SET dt_exportado = NOW(), cd_situacao = :cd_situacao WHERE cd_processo = :cd_processo';
var
   qyAlteraSituacoes: TUMZQuery;
   cd_situacao: Integer;
begin
   DM.CriarConsulta(qyAlteraSituacoes);

   with qyAlteraSituacoes do
   begin
      SQL.Text := SQL_ALTERA_SITUACAO;

      if ( tsSituacao = tsExportado ) then
         cd_situacao := 1
      else if ( tsSituacao = tsNaoExportado ) then
         cd_situacao := 0
      else
         cd_situacao := 0;

      ParamByName('cd_situacao').AsInteger := cd_situacao;
      ParamByName('cd_processo').AsInteger := Processo;

      ExecSQL();

      DM.setLog(1081, '3', IntToStr(Processo), 1,
             'Alterado situação dos alunos do processo '+IntToStr(Processo)+' para ['+IntToStr(cd_situacao)+']');
   end;

   Filtrar();
end;

procedure TfExportacaoDados.AlteraSituacaoCursoAluno(const cd_pessoa,
  nr_anosemestre: Integer; const cd_turma: String; const cd_situacao_curso: Integer);
const
   SQL_ALTERA_SITUACAO_CURSO = 'UPDATE expo_processo_pessoas SET cd_situacao_curso = :cd_situacao_curso ' +
                         'WHERE cd_processo = :cd_processo AND cd_pessoa = :cd_pessoa AND ' +
                         '      nr_anosemestre = :nr_anosemestre AND cd_turma = :cd_turma ';
var
   qyAlteraSituacaoCurso: TUMZQuery;
begin
   DM.CriarConsulta(qyAlteraSituacaoCurso);

   with qyAlteraSituacaoCurso do
   begin
      SQL.Text := SQL_ALTERA_SITUACAO_CURSO;

      ParamByName('cd_situacao_curso').AsInteger := cd_situacao_curso;

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;

      ExecSQL();

      DM.setLog(1081, '3',
             IntToStr(Processo)+';'+qyAlunosnr_anosemestre.AsString+';'+qyAlunoscd_turma.AsString+';'+qyAlunoscd_pessoa.AsString, 1,
             'Alterado situação do aluno '+qyAlunoscd_pessoa.AsString+' de ['+qyAlunoscd_situacao_curso.AsString+', '+qyAlunosds_situacao_curso.AsString+'] para ['+IntToStr(cd_situacao_curso)+', '+(cbAlteraSituacaoCurso.Items.Objects[cbAlteraSituacaoCurso.ItemIndex] as TItemCombo).getDescricao()+']');
   end;

   Filtrar();
end;

procedure TfExportacaoDados.BaixarExportacao;
const
{   Substituido essa lógica, pegando direto o arquivo do banco de dados
   SQL_GET_VALORES = 'SELECT nr_linha, me_valor ' +
                     'FROM expo_processo_valores ' +
                     'WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao ' +
                     'ORDER BY cd_item, nr_linha, cd_especificacao';
}

   SQL_GET_VALORES = 'SELECT me_arquivo ' +
                     'FROM expo_processo_logs ' +
                     'WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao ';

var
   qyGetValores: TUMZQuery;
   LLinhaValor: String;
   LArquivo: TStringList;
   LLinhaAtual: Integer;
begin
   if ( not PossuiArquivoOficial() ) AND
      ( Mensagem('Ao baixar o arquivo, você estará marcando o arquivo como oficial, deseja prosseguir?', 'Atenção', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes ) then
   begin
      Exit;
   end;
   LArquivo := TStringList.Create();

   DM.CriarConsulta(qyGetValores);

   with qyGetValores do
   begin
      SQL.Text := SQL_GET_VALORES;

      ParamByName('cd_processo').AsInteger := qyArquivosExportadoscd_processo.AsInteger;
      ParamByName('nr_exportacao').AsInteger := qyArquivosExportadosnr_exportacao.AsInteger;

      Open();
   end;

   LArquivo.Text := qyGetValores.FieldByName('me_arquivo').AsString;

   if SaveTextFileDialog1.Execute then
   begin
      LArquivo.SaveToFile(SaveTextFileDialog1.FileName);

      if (not PossuiArquivoOficial()) then
         SelecionaArquivoOficial(true);

      Mensagem('Arquivo salvo no local: ' + SaveTextFileDialog1.FileName, 'Baixar Arquivo', MB_OK + MB_ICONINFORMATION, Handle);
   end;

{ Substituido essa lógica, pegando direto o arquivo do banco de dados
   DM.CriarConsulta(qyGetValores);
   LArquivo := TStringList.Create();
   LLinhaAtual := 0;

   with qyGetValores do
   begin
      SQL.Text := SQL_GET_VALORES;

      ParamByName('cd_processo').AsInteger := qyArquivosExportadoscd_processo.AsInteger;
      ParamByName('nr_exportacao').AsInteger := qyArquivosExportadosnr_exportacao.AsInteger;

      Open();
   end;

   LLinhaValor := '';
   while not qyGetValores.Eof do
   begin
      if qyGetValores.FieldByName('nr_linha').AsInteger <> LLinhaAtual then
      begin
         if LLinhaAtual > 0 then
         begin
            LArquivo.Add(LLinhaValor);
         end;
         Inc(LLinhaAtual);

         LLinhaValor := qyGetValores.FieldByName('me_valor').AsString;
      end
      else
      begin
         LLinhaValor := LLinhaValor + qyGetValores.FieldByName('me_valor').AsString;
      end;

      qyGetValores.Next();
   end;

   LArquivo.Add(LLinhaValor);

   if SaveTextFileDialog1.Execute then
   begin
      LArquivo.SaveToFile(SaveTextFileDialog1.FileName);

      if (not PossuiArquivoOficial()) then
         SelecionaArquivoOficial(true);

      Mensagem('Arquivo salvo no local: ' + SaveTextFileDialog1.FileName, 'Baixar Arquivo', MB_OK + MB_ICONINFORMATION, Handle);
   end;
}   
end;

procedure TfExportacaoDados.btnAlterarProcessoSelecionadoClick(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   if not (Processo > 0) then
   begin
      Mensagem('É necessário selecionar um processo para edição.', 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;  

   if fExportacaoDadosAlteraProcesso = nil then
      Application.CreateForm(TfExportacaoDadosAlteraProcesso, fExportacaoDadosAlteraProcesso);

   fExportacaoDadosAlteraProcesso.AlterarProcesso( Processo );

   // Recarrega os processos
   CarregarProcessos();

   // Limpa os registros atuais
   Filtrar(False);
end;

procedure TfExportacaoDados.btnBaixarArquivoClick(Sender: TObject);
begin
   BaixarExportacao();
end;

procedure TfExportacaoDados.btnExcluirAlunoClick(Sender: TObject);
var
   pergunta : Integer;
begin
   sbRegistrarSituacao.Down := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacao.Visible := False;
   cbAlteraSituacaoCurso.Visible := False;
   pergunta := -1;

   // Verifica se um processo foi selecionado
   if (Processo <= 0) then
   begin
      Mensagem('É necessário selecionar um processo de Exportação.', 'Exclusão de Aluno', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   // Verifica se os alunos já foram filtrados
   if not (qyAlunos.State IN [dsBrowse]) then
   begin
      Mensagem('Filtre os alunos antes de excluir um aluno.', 'Exclusão de Aluno', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   // Verifica se existe um aluno selecionado  
   if ( getQtdAlunosSelecionados = 0 ) then
   begin
      Mensagem('É necessário selecionar um aluno.', 'Exclusão de Aluno', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   qyAlunos.DisableControls;
   qyAlunos.First;

   while not qyAlunos.Eof do
   begin
      if ( AlunoSelecionado ) then
      begin
         if ( pergunta = -1 ) OR ( pergunta IN [ mrYes, mrNo ] ) then
         begin
            pergunta := MensagemCustomizavel(
               'Deseja remover o Aluno: ' + qyAlunos.FieldByName('nm_pessoa').AsString + ' do processo de exportação?',
               mtConfirmation, [mbYes, mbYesToAll, mbNo, mbNoToAll], ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'], 97, mbNoToAll );
         end;
         
         if ( pergunta IN [mrYes, mrYesToAll] ) then
         begin
            fExportacaoDadosIncluirAlunos.RemoverAlunoProcesso(
               Processo, qyAlunos.FieldByName('nr_anosemestre').AsInteger,
               qyAlunos.FieldByName('cd_turma').AsString, qyAlunos.FieldByName('cd_pessoa').AsInteger);
         end;
      end;

      qyAlunos.Next;
   end;

   qyAlunos.EnableControls;

   Filtrar();

   cbSelecionarExcluir.Visible := False;
end;

procedure TfExportacaoDados.btnExportarDadosClick(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   ExportarDados();
end;

procedure TfExportacaoDados.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfExportacaoDados.btnFiltrarClick(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   Filtrar();
end;

procedure TfExportacaoDados.btnIncluirAlunoClick(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   if Processo <= 0 then
   begin
      Mensagem('É necessário selecionar um processo de Exportação.', 'Inclusão de Aluno', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   fExportacaoDadosIncluirAlunos.IncluirAlunosProcesso(Processo, Anosemestre,
                Curso, Turma, Aluno, ProcessoUsaCH_Sit, ProcessoUsaAnosemestre);

   Filtrar();
end;

procedure TfExportacaoDados.btnLimparClick(Sender: TObject);
begin
   ZerarFiltros();

   // Zera registros na Grid
   Filtrar(False);
end;

procedure TfExportacaoDados.btnCriarProcessoExportacaoClick(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   if fExportacaoDadosNovoProcesso = nil then
      Application.CreateForm(TfExportacaoDadosNovoProcesso, fExportacaoDadosNovoProcesso);

   fExportacaoDadosNovoProcesso.ShowModal();

   // Recarrega os processos
   CarregarProcessos();

   // Limpa os registros atuais
   Filtrar(False);
end;

procedure TfExportacaoDados.CarregarProcessos;
const
   SQL_PROCESSOS = 'SELECT * FROM expo_processos';
var
   qyProcessos: TUMZQuery;
begin
   DM.CriarConsulta(qyProcessos);

   cbProcessos.Items.Clear();

   with qyProcessos do
   begin
      Close();
      SQL.Clear();

      SQL.Add( SQL_PROCESSOS );

      Open();

      while not Eof do
      begin
         cbProcessos.AddItem( FieldByName('ds_processo').AsString,
                              TItemCombo.Create( FieldByName('cd_processo').AsString,
                                                 FieldByName('ds_processo').AsString ) );

         Next();
      end;
   end;

   if cbProcessos.Items.Count = 1 then
   begin
      cbProcessos.ItemIndex := 0;
   end;
end;

procedure TfExportacaoDados.CarregarSituacoes;
const
   SQL_SITUACOES = 'SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1080';
var
   qySituacoes: TUMZQuery;
begin
   DM.CriarConsulta(qySituacoes);

   cbSituacoes.Items.Clear();
   cbAlteraSituacao.Items.Clear();

   with qySituacoes do
   begin
      Close();
      SQL.Clear();

      SQL.Add( SQL_SITUACOES );

      Open();

      while not Eof do
      begin
         cbSituacoes.AddItem( FieldByName('ds_valor').AsString,
                              TItemCombo.Create( FieldByName('cd_situacao').AsString,
                                                 FieldByName('ds_valor').AsString ) );
         cbAlteraSituacao.AddItem( FieldByName('ds_valor').AsString,
                              TItemCombo.Create( FieldByName('cd_situacao').AsString,
                                                 FieldByName('ds_valor').AsString ) );

         Next();
      end;
   end;
end;

procedure TfExportacaoDados.CarregarSituacoesCurso;
const
   SQL_SITUACOES_CURSO = 'SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1081';
var
   qySituacoesCurso: TUMZQuery;
begin
   DM.CriarConsulta(qySituacoesCurso);

   cbSituacoesCurso.Items.Clear();
   cbAlteraSituacaoCurso.Items.Clear();

   with qySituacoesCurso do
   begin
      Close();
      SQL.Clear();

      SQL.Add( SQL_SITUACOES_CURSO );

      Open();

      while not Eof do
      begin
         cbSituacoesCurso.AddItem( FieldByName('ds_valor').AsString,
                              TItemCombo.Create( FieldByName('cd_situacao').AsString,
                                                 FieldByName('ds_valor').AsString ) );
         cbAlteraSituacaoCurso.AddItem( FieldByName('ds_valor').AsString,
                              TItemCombo.Create( FieldByName('cd_situacao').AsString,
                                                 FieldByName('ds_valor').AsString ) );

         Next();
      end;
   end;
end;

procedure TfExportacaoDados.cbAlteraSituacaoChange(Sender: TObject);
begin
   AlteraSituacaoAluno( qyAlunoscd_pessoa.AsInteger,
                        qyAlunosnr_anosemestre.AsInteger, qyAlunoscd_turma.AsString,
                        StrToInt((cbAlteraSituacao.Items.Objects[cbAlteraSituacao.ItemIndex] as TItemCombo).getCodigo()) );

   cbAlteraSituacao.Visible := False;
end;

procedure TfExportacaoDados.cbAlteraSituacaoCursoChange(Sender: TObject);
begin
   AlteraSituacaoCursoAluno( qyAlunoscd_pessoa.AsInteger,
                        qyAlunosnr_anosemestre.AsInteger, qyAlunoscd_turma.AsString,
                        StrToInt((cbAlteraSituacaoCurso.Items.Objects[cbAlteraSituacaoCurso.ItemIndex] as TItemCombo).getCodigo()) );

   cbAlteraSituacaoCurso.Visible := False;
end;

procedure TfExportacaoDados.cbProcessosChange(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   pcExportacao.ActivePage := tsAlunos;
   VerificaBotoes();

   Filtrar(false);
end;

procedure TfExportacaoDados.cbSelecionarExcluirClick(Sender: TObject);
begin
   AlunoSelecionado := not AlunoSelecionado;
end;

procedure TfExportacaoDados.CopiaExportacao(const nr_exportacao: Integer);
const
   SQL_COPIA_TABELA_LOGS = 'INSERT INTO expo_processo_logs(cd_processo, nr_exportacao, dt_exportacao, cd_usuario, sn_oficial, me_arquivo) ' +
                           'SELECT epl.cd_processo, :nr_proxima_exportacao, ' +
                           '       NOW(), :cd_usuario, 0, epl.me_arquivo ' +
                           'FROM expo_processo_logs epl ' +
                           'WHERE epl.cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao ';
   SQL_COPIA_TABELA_ITEM = 'INSERT INTO expo_processo_item (cd_processo, nr_exportacao, cd_item, ds_item) ' +
                           'SELECT cd_processo, :nr_proxima_exportacao, cd_item, ds_item ' +
                           'FROM expo_processo_item WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao ';
   SQL_COPIA_TABELA_ESPECIFICACOES = 'INSERT INTO expo_processo_especificacoes (cd_processo, nr_exportacao, cd_item, cd_especificacao, ds_especificacao) ' +
                                     'SELECT cd_processo, :nr_proxima_exportacao, cd_item, cd_especificacao, ds_especificacao ' +
                                     'FROM expo_processo_especificacoes ' +
                                     'WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao';
   SQL_COPIA_TABELA_VALORES = 'INSERT INTO expo_processo_valores (cd_processo, nr_exportacao, cd_item, cd_especificacao, nr_linha, me_valor) ' +
                              'SELECT cd_processo, :nr_proxima_exportacao, cd_item, cd_especificacao, nr_linha, me_valor ' +
                              'FROM expo_processo_valores ' +
                              'WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao ';
var
   qyExecutaInsercao: TUMZQuery;
   nr_proxima_exportacao: Integer;
begin
   DM.CriarConsulta(qyExecutaInsercao);

   qyExecutaInsercao.SQL.Text := 'SELECT MAX(nr_exportacao)+1 AS proximo FROM expo_processo_logs WHERE cd_processo = :cd_processo';
   qyExecutaInsercao.ParamByName('cd_processo').AsInteger := Processo;
   qyExecutaInsercao.Open();

   nr_proxima_exportacao := qyExecutaInsercao.FieldByName('proximo').AsInteger;

   with qyExecutaInsercao do
   begin
      Close();

      { COPIA_TABELA_LOGS }
      SQL.Text := SQL_COPIA_TABELA_LOGS;

      ParamByName('cd_usuario').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_exportacao').AsInteger := nr_exportacao;
      ParamByName('nr_proxima_exportacao').AsInteger := nr_proxima_exportacao;

      ExecSQL();

      Close();

      { COPIA_TABELA_ITEM }
      SQL.Text := SQL_COPIA_TABELA_ITEM;

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_exportacao').AsInteger := nr_exportacao;
      ParamByName('nr_proxima_exportacao').AsInteger := nr_proxima_exportacao;

      ExecSQL();

      Close();

      { COPIA_TABELA_ESPECIFICACOES }
      SQL.Text := SQL_COPIA_TABELA_ESPECIFICACOES;

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_exportacao').AsInteger := nr_exportacao;
      ParamByName('nr_proxima_exportacao').AsInteger := nr_proxima_exportacao;

      ExecSQL();

      Close();

      { COPIA_TABELA_VALORES }
      SQL.Text := SQL_COPIA_TABELA_VALORES;

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_exportacao').AsInteger := nr_exportacao;
      ParamByName('nr_proxima_exportacao').AsInteger := nr_proxima_exportacao;

      ExecSQL();

      Close();
   end;
end;

procedure TfExportacaoDados.ExportarDados;
const
   SQL_EXPORTACAO_OFICIAL = 'SELECT nr_exportacao FROM expo_processo_logs ' +
                            'WHERE cd_processo = :cd_processo AND sn_oficial = 1';
var
   DiretorioExecutavelExportacao: String;
   qyExportacaoOficial: TUMZQuery;
begin
   if Processo <= 0 then
   begin
      Mensagem('É necessário selecionar um processo de Exportação.', 'Exportação de Dados', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   // Antes de continuarmos, verificamos se já existe 1 arquivo de exportação oficial,
   // caso exista, então copiamos ele, e não faremos o processo de exportação em si
   DM.CriarConsulta(qyExportacaoOficial);
   with qyExportacaoOficial do
   begin
      SQL.Text := SQL_EXPORTACAO_OFICIAL;

      ParamByName('cd_processo').AsInteger := Processo;

      Open();

      // Fazemos a cópia da exportação oficial
      if RecordCount = 1 then
      begin
         if ( Mensagem('Este processo já possui uma exportação oficial, '+Chr(13)+
                          'caso seja realizada uma nova exportação ela possuirá o mesmo conteúdo da oficial. Deseja prosseguir?',
                       'Atenção', MB_YESNO + MB_ICONINFORMATION) <> mrYes ) then
         begin
            Exit;
         end;         

         CopiaExportacao( FieldByName('nr_exportacao').AsInteger );
         Mensagem('Processo de exportação concluído!', 'Exportação de Dados', MB_OK + MB_ICONINFORMATION);
         exit;
      end;
      
   end;

   DiretorioExecutavelExportacao := ExtractFilePath(Application.ExeName);

   // Verifica se o executável do módulo existe no computador
   if FileExists(DiretorioExecutavelExportacao + 'Exportacao.exe') then
   begin
      ExecAndWait(DiretorioExecutavelExportacao + 'Exportacao.exe', '-u '+ DM.UsuarioLogado.Pessoa.Login +' -p '+ DM.UsuarioLogado.Pessoa.Senha +' -e ' + IntToStr(Processo) + ' -o "'+DiretorioExecutavelExportacao+'exportacao.csv"', SW_SHOW);

      AlteraSituacaoAlunos( tsExportado );

      Mensagem('Processo de exportação concluído!', 'Exportação de Dados', MB_OK + MB_ICONINFORMATION, Handle);
   end
   else
      Mensagem('Você não possui o módulo de Exportação de Dados', 'Módulo não encontrado!', MB_OK + MB_ICONEXCLAMATION, Handle);
end;

procedure TfExportacaoDados.Filtrar(const sn_filtrar: Boolean = True; ordenacao: String = '');
const
   SQL_FILTRO_ALUNO =
      ' SELECT epp.cd_pessoa, p.nm_pessoa, epp.cd_turma, epp.cd_situacao, epp.dt_exportado, ' +
      '        c.codigo AS cd_curso, epp.vl_ch AS nr_carga_horaria, s_matricula.ds_situacao AS ds_situacao_matricula, ' +
      '        s.ds_valor AS ds_situacao, ss.ds_valor AS ds_situacao_curso, epp.cd_situacao_curso, epp.nr_anosemestre ' +
      ' FROM expo_processo_pessoas epp ' +
      '      INNER JOIN turmas t ON ( t.codigo = epp.cd_turma AND t.anosemestre = epp.nr_anosemestre ) ' +
      '      INNER JOIN cursos c ON ( c.codigo = t.curso AND c.anosemestre = t.anosemestre ) ' +
      '      INNER JOIN pessoas p ON ( p.cd_pessoa = epp.cd_pessoa ) ' +
      '      INNER JOIN situacoes s ON ( s.cd_modulo = 1080 AND s.cd_situacao = epp.cd_situacao ) ' +
      '      INNER JOIN situacoes ss ON ( ss.cd_modulo = 1081 AND ss.cd_situacao = epp.cd_situacao_curso ) ' +
      '      INNER JOIN matriculas m ON ( ' +
      '         m.anosemestre = t.anosemestre AND ' +
      '         m.turma = t.codigo AND ' +
      '         m.curso = t.curso AND ' +  
      '         m.codigoaluno = epp.cd_pessoa ' +
      '      ) ' +
      '      INNER JOIN situacao s_matricula ON (s_matricula.cd_situacao = m.situacao) ' +
      ' WHERE epp.cd_processo = :cd_processo AND epp.sn_selecionado = 1 ';
   SQL_FILTRO_ALUNO_SEM_GRADE =
      ' SELECT epp.cd_pessoa, p.nm_pessoa, epp.cd_turma, epp.dt_exportado, ' +
      '        c.codigo AS cd_curso, epp.nr_anosemestre, s.ds_situacao AS ds_situacao_matricula ' +
      ' FROM expo_processo_pessoas epp ' +
      '      INNER JOIN turmas t ON ( t.codigo = epp.cd_turma AND t.anosemestre = epp.nr_anosemestre ) ' +
      '      INNER JOIN cursos c ON ( c.codigo = t.curso AND c.anosemestre = t.anosemestre ) ' +
      '      INNER JOIN pessoas p ON ( p.cd_pessoa = epp.cd_pessoa ) ' +
      '      INNER JOIN matriculas m ON ( ' +
      '         m.anosemestre = t.anosemestre AND ' +
      '         m.turma = t.codigo AND ' +
      '         m.curso = t.curso AND ' +  
      '         m.codigoaluno = epp.cd_pessoa ' +
      '      ) ' +     
      '      INNER JOIN situacao s ON (s.cd_situacao = m.situacao) ' +
      ' WHERE epp.cd_processo = :cd_processo AND epp.sn_selecionado = 1 ';
   SQL_FILTRO_ALUNO_GRUPO =
      ' GROUP BY epp.cd_pessoa, epp.cd_turma, epp.nr_anosemestre ';
var
   I : Integer;
begin
   cbSelecionarExcluir.Visible := False;

   { Se a pessoa estiver tentando ordenar os campos, por exclusão, então não iremos limpar }
   if ordenacao = '' then
      FListaPessoasSelecionadas.Clear;

   // Limpar registros
   if not sn_filtrar then
   begin
      qyAlunos.Close();

      HideShowCH();

      Exit;
   end;

   // Filtros necessários para pesquisar os alunos
   if Processo = 0 then
   begin
      Mensagem( 'É necessário selecionar um processo.' );
      Exit;
   end;

   frmProcessando.Show();

   frmProcessando.Bar.Max := 2;
   frmProcessando.Bar.Position := 1;

   with qyAlunos do
   begin
      Close();
      SQL.Clear();

      if ( ProcessoUsaCH_Sit ) then
         SQL.Add( SQL_FILTRO_ALUNO )
      else
         SQL.Add( SQL_FILTRO_ALUNO_SEM_GRADE );
      
      ParamByName('cd_processo').AsInteger := Processo;

      { Filtros opcionais da tela }
      
      // Filtro de Curso / Anosemestre
      if (Curso <> '') then
      begin
         SQL.Add( 'AND t.curso = :cd_curso' );
         if ProcessoUsaAnosemestre then
            SQL.Add( 'AND epp.nr_anosemestre = :nr_anosemestre' )
         else
            SQL.Add( 'AND LEFT(epp.nr_anosemestre, 4) = :nr_anosemestre' );         
         ParamByName('cd_curso').AsString := Curso;
         ParamByName('nr_anosemestre').AsInteger := Anosemestre;
      end;

      // Filtro de Turma
      if (Turma <> '') then
      begin
         SQL.Add('AND epp.cd_turma = :cd_turma');
         ParamByName('cd_turma').AsString := Turma;
      end;

      // Filtro de Aluno
      if (Aluno <> 0) then
      begin
         SQL.Add('AND epp.cd_pessoa = :cd_pessoa');
         ParamByName('cd_pessoa').AsInteger := Aluno;
      end;

      // Filtro de Situação
      if (ProcessoUsaCH_Sit) AND (Situacao <> -1) then
      begin
         SQL.Add('AND epp.cd_situacao = :cd_situacao');
         ParamByName('cd_situacao').AsInteger := Situacao;
      end;

      // Filtro de Situação do Curso
      if  (ProcessoUsaCH_Sit)AND (SituacaoCurso <> -1) then
      begin
         SQL.Add('AND epp.cd_situacao_curso = :cd_situacao_curso');
         ParamByName('cd_situacao_curso').AsInteger := SituacaoCurso;
      end;
      { Filtros opcionais da tela }

      SQL.Add( SQL_FILTRO_ALUNO_GRUPO );

      { Ordenação }
      if ( trim(ordenacao) <> '' ) then
      begin
         if ordenacao = qyAlunossn_excluir.FieldName then
         begin
            ordenacao := ' CASE WHEN CONCAT( epp.nr_anosemestre, epp.cd_pessoa ) IN ( -1';

            for I := 0 to FListaPessoasSelecionadas.Count - 1 do
            begin
               if FListaPessoasSelecionadas.ValueFromIndex[ I ] = 'S' then
               begin
                  ordenacao := ordenacao + ', ' + ReplaceStr( FListaPessoasSelecionadas[I], '=S', '' );
               end;
            end;

            ordenacao := ordenacao + ' ) THEN 10 ELSE 99 END ';
         end;

         if FOrdenacaoAtual = ordenacao + ' DESC' then
         begin
            // Tira ordenação
            FOrdenacaoAtual := '';
         end
         else if FOrdenacaoAtual = ordenacao then
         begin
            SQL.Add( 'ORDER BY ' + ordenacao + ' DESC' );
            FOrdenacaoAtual := ordenacao + ' DESC';
         end
         else
         begin
            SQL.Add( 'ORDER BY ' + ordenacao );
            FOrdenacaoAtual := ordenacao;
         end;
      end;

      Open();
   end;

   frmProcessando.Close();
end;

procedure TfExportacaoDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfExportacaoDados.FormCreate(Sender: TObject);
begin
   CarregarProcessos();
   CarregarSituacoes();
   CarregarSituacoesCurso();

   // Zerar todos os Filtros da Tela
   ZerarFiltros();
end;

procedure TfExportacaoDados.FormDestroy(Sender: TObject);
begin
   FreeAndNil( FListaProcessosUsaCH_Sit );
   FreeAndNil( FListaProcessosUsaAnosemestre );
   FreeAndNil( FListaPessoasSelecionadas );
end;

procedure TfExportacaoDados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F12: begin
         btnFecharClick(nil);
         exit;
      end;      
   end;

   if pcExportacao.ActivePage = tsAlunos then
   begin
      case Key of
         VK_F2: btnIncluirAlunoClick(nil);
         VK_F9: btnExcluirAlunoClick(nil);
         VK_F5: begin
            if not sbRegistrarSituacao.Visible then Exit;

            sbRegistrarSituacao.Down := not sbRegistrarSituacao.Down;
            if not sbRegistrarSituacao.Down then
               cbAlteraSituacao.Visible := False;
         end;
         VK_F6: begin
            if not sbRegistrarSituacaoCurso.Visible then Exit;

            sbRegistrarSituacaoCurso.Down := not sbRegistrarSituacaoCurso.Down;
            if not sbRegistrarSituacaoCurso.Down then
               cbAlteraSituacaoCurso.Visible := False;
         end;
         VK_F11: btnExportarDadosClick(nil);
      end;
   end
   else if pcExportacao.ActivePage = tsExportacoes then
   begin
      case Key of
         VK_F7: btnGeraRelatorioClick(nil);
         VK_F11: btnBaixarArquivoClick(nil);
      end;
   end;        
end;

procedure TfExportacaoDados.FormShow(Sender: TObject);
begin
   sbRegistrarSituacao.Down := False;
   sbRegistrarSituacaoCurso.Down := False;
   pcExportacao.ActivePage := tsAlunos;
   FListaProcessosUsaCH_Sit := TStringList.Create;
   FListaProcessosUsaAnosemestre := TStringList.Create;
   FListaPessoasSelecionadas := TStringList.Create;

   // Se não usa anosemestre, esconde a Coluna
   grdAlunos.Columns[8].Visible := DM.UsaAnosemestre;

   if fExportacaoDadosIncluirAlunos = nil then
      Application.CreateForm(TfExportacaoDadosIncluirAlunos, fExportacaoDadosIncluirAlunos);
end;

procedure TfExportacaoDados.gdArquivosExportadosCellClick(Column: TColumn);
begin
   if (Column.FieldName = 'sn_oficial') then
   begin
      if not DM.UsuarioLogado.TemPermissao( 12005, npEspecial, True ) then Exit;

      if ( not PossuiArquivoOficial() ) then
      begin
         SelecionaArquivoOficial(true);
      end
      else if ( qyArquivosExportadossn_oficial.AsInteger = 1 ) then
      begin
         SelecionaArquivoOficial(false);
      end
      else
         Mensagem('É necessário desmarcar a flag de Oficial das outras exportações, para marcar uma nova.', 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
   end;
end;

procedure TfExportacaoDados.gdArquivosExportadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Checado: Integer;
   R: TRect;
begin
   if (Column.FieldName = 'sn_oficial') then
   begin
      gdArquivosExportados.Canvas.FillRect(Rect);

      if (qyArquivosExportadossn_oficial.AsInteger = 1) then
         Checado := DFCS_CHECKED
      else
         Checado := 0;

      R := Rect;

      InflateRect(R, -2, -2);
      DrawFrameControl(gdArquivosExportados.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Checado);
   end;
end;

procedure TfExportacaoDados.GerarRelatorio;
var
   sFSelecao: String;
   slFormulas: TStringList;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   sFSelecao := '{expo_processo_logs.cd_processo} = ' + IntToStr(Processo);
   sFSelecao := sFSelecao + ' AND {expo_processo_logs.nr_exportacao} = ' + qyArquivosExportadosnr_exportacao.AsString;

   slFormulas := TStringList.Create();

   infoRelatorio := PrincipalForm.GetInfoRpt('repExportacao');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFSelecao, '', slFormulas, nil, nil, nil, true, False, nil, PodeExportar);

   FreeAndNil(slFormulas);
end;

function TfExportacaoDados.getAluno: Integer;
begin
   Result := 0;

   if trim(edAluno.Text) <> '' then
      Result := StrToInt(edAluno.Text);
end;

function TfExportacaoDados.getAlunoSelecionado: Boolean;
begin
   Result := ( FListaPessoasSelecionadas.Values[ qyAlunosnr_anosemestre.AsString + qyAlunoscd_pessoa.AsString ] = 'S' );
end;

function TfExportacaoDados.getCurso: String;
begin
   Result := edCurso.Text;
end;

function TfExportacaoDados.getProcessoUsaCH_Sit: Boolean;
const
   SQL_GET_PROCESSO_USA_CH_SIT =
      ' SELECT SN_USAR_CH_SIT FROM expo_layouts ' +
      ' WHERE cd_layout = ( SELECT cd_layout FROM expo_processos WHERE cd_processo = :cd_processo ) ';
var
   LProcesso: Integer;
   qyGetProcessoUsaCH_Sit: TUMZQuery;
begin
   LProcesso := Processo;
   Result := False;

   if ( LProcesso = 0 ) then Exit;   

   if ( trim(FListaProcessosUsaCH_Sit.Values[ IntToStr( LProcesso ) ]) = '' ) then
   begin
      DM.CriarConsulta( qyGetProcessoUsaCH_Sit );
      qyGetProcessoUsaCH_Sit.SQL.Text := SQL_GET_PROCESSO_USA_CH_SIT;
      qyGetProcessoUsaCH_Sit.ParamByName('cd_processo').AsInteger := LProcesso;

      qyGetProcessoUsaCH_Sit.Open();
      FListaProcessosUsaCH_Sit.Values[ IntToStr( LProcesso ) ] := qyGetProcessoUsaCH_Sit.FieldByName('SN_USAR_CH_SIT').AsString;
      qyGetProcessoUsaCH_Sit.Close();

      FreeAndNil( qyGetProcessoUsaCH_Sit );
   end;

   Result := ( StrToInt( FListaProcessosUsaCH_Sit.Values[ IntToStr( LProcesso ) ] ) = 1 );
end;

function TfExportacaoDados.getQtdAlunosSelecionados: Integer;
var
   I : Integer;
begin
   Result := 0;

   for I := 0 to FListaPessoasSelecionadas.Count - 1 do
   begin
      if ( FListaPessoasSelecionadas.ValueFromIndex[ I ] = 'S' ) then
      begin
         Inc(Result);
      end;
   end;
end;

function TfExportacaoDados.getProcesso: Integer;
begin
   Result := 0;

   if cbProcessos.ItemIndex > -1 then
      Result := StrToInt(TItemCombo(cbProcessos.Items.Objects[cbProcessos.ItemIndex]).getCodigo());

   cbAlteraSituacao.Visible := False;
end;

function TfExportacaoDados.getSituacao: Integer;
begin
   Result := -1;

   if cbSituacoes.ItemIndex > -1 then
      Result := StrToInt(TItemCombo(cbSituacoes.Items.Objects[cbSituacoes.ItemIndex]).getCodigo());
end;

function TfExportacaoDados.getSituacaoCurso: Integer;
begin
   Result := -1;

   if cbSituacoesCurso.ItemIndex > -1 then
      Result := StrToInt(TItemCombo(cbSituacoesCurso.Items.Objects[cbSituacoesCurso.ItemIndex]).getCodigo());
end;

function TfExportacaoDados.getTurma: String;
begin
   Result := edTurma.Text;
end;

function TfExportacaoDados.getUsaAnosemestre: Boolean;
const
   SQL_GET_PROCESSO_USA_ANOSEMESTRE =
      ' SELECT SN_USAR_ANOSEMESTRE FROM expo_layouts ' +
      ' WHERE cd_layout = ( SELECT cd_layout FROM expo_processos WHERE cd_processo = :cd_processo ) ';
var
   LProcesso: Integer;
   qyGetProcessoUsaAnosemestre: TUMZQuery;
begin
   LProcesso := Processo;
   Result := False;

   if ( LProcesso = 0 ) then Exit;   

   if ( trim(FListaProcessosUsaAnosemestre.Values[ IntToStr( LProcesso ) ]) = '' ) then
   begin
      DM.CriarConsulta( qyGetProcessoUsaAnosemestre );
      qyGetProcessoUsaAnosemestre.SQL.Text := SQL_GET_PROCESSO_USA_ANOSEMESTRE;
      qyGetProcessoUsaAnosemestre.ParamByName('cd_processo').AsInteger := LProcesso;

      qyGetProcessoUsaAnosemestre.Open();
      FListaProcessosUsaAnosemestre.Values[ IntToStr( LProcesso ) ] := qyGetProcessoUsaAnosemestre.FieldByName('SN_USAR_ANOSEMESTRE').AsString;
      qyGetProcessoUsaAnosemestre.Close();

      FreeAndNil( qyGetProcessoUsaAnosemestre );
   end;

   Result := ( StrToInt( FListaProcessosUsaAnosemestre.Values[ IntToStr( LProcesso ) ] ) = 1 );
end;

procedure TfExportacaoDados.grdAlunosColExit(Sender: TObject);
begin
   cbAlteraSituacao.Visible := False;
   cbAlteraSituacaoCurso.Visible := False;

   if grdAlunos.SelectedField.FieldName = qyAlunossn_excluir.FieldName then
   begin
      cbSelecionarExcluir.Visible := False;
   end;
end;

procedure TfExportacaoDados.grdAlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   I, DrawState : Integer;
   DrawRect : TRect;
begin
   case DataCol of
      { Coluna de Seleção de Alunos para exclusão }
      0: begin
         if gdFocused IN State then
         begin
            cbSelecionarExcluir.Left := Rect.Left + grdAlunos.Left + Trunc( Column.Width / 2 ) - Trunc( cbSelecionarExcluir.Width / 2 ) + 1;
            cbSelecionarExcluir.Top := Rect.Top + grdAlunos.Top + 4;

            cbSelecionarExcluir.OnClick := nil;
            cbSelecionarExcluir.Checked := AlunoSelecionado;
            cbSelecionarExcluir.OnClick := cbSelecionarExcluirClick;

            cbSelecionarExcluir.Visible := True;
         end else begin
            DrawRect := Rect;
            InflateRect( DrawRect, -2, -2 ); { Diminui o tamanho do Checkbox }

            DrawState := IsChecked[ AlunoSelecionado ];

            grdAlunos.Canvas.FillRect( Rect );
            DrawFrameControl( grdAlunos.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState );
         end;
      end;
      { Coluna de Situação do Curso }
      6: begin
         if (gdSelected in State) AND (sbRegistrarSituacaoCurso.Down) then
         begin
            cbAlteraSituacaoCurso.Left := Rect.Left + grdAlunos.Left + 1;
            cbAlteraSituacaoCurso.Top := Rect.Top + grdAlunos.Top + 1;

            cbAlteraSituacaoCurso.Width := Rect.Right - Rect.Left + 3;
            cbAlteraSituacaoCurso.Height := Rect.Bottom - Rect.Top - 3;

            for I := 0 to cbAlteraSituacaoCurso.Items.Count - 1 do
            begin
               if ( (cbAlteraSituacaoCurso.Items.Objects[I] as TItemCombo).getCodigo() = qyAlunoscd_situacao_curso.AsString ) then
               begin
                  cbAlteraSituacaoCurso.ItemIndex := I;
                  break;
               end;
            end;

            cbAlteraSituacaoCurso.Visible := True;
         end
         else
         begin
            cbAlteraSituacaoCurso.Visible := False;
         end;
      end;
      { Coluna de Situação }
      7: begin
         if (gdSelected in State) AND (sbRegistrarSituacao.Down) then
         begin
            cbAlteraSituacao.Left := Rect.Left + grdAlunos.Left + 1;
            cbAlteraSituacao.Top := Rect.Top + grdAlunos.Top + 1;

            cbAlteraSituacao.Width := Rect.Right - Rect.Left + 3;
            cbAlteraSituacao.Height := Rect.Bottom - Rect.Top - 3;

            for I := 0 to cbAlteraSituacao.Items.Count - 1 do
            begin
               if ( (cbAlteraSituacao.Items.Objects[I] as TItemCombo).getCodigo() = qyAlunoscd_situacao.AsString ) then
               begin
                  cbAlteraSituacao.ItemIndex := I;
                  break;
               end;
            end;

            cbAlteraSituacao.Visible := True;
         end
         else
         begin
            cbAlteraSituacao.Visible := False;
         end;
      end;

   end;
end;

procedure TfExportacaoDados.grdAlunosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_SPACE : begin
         cbSelecionarExcluir.OnClick := nil;
         AlunoSelecionado := not AlunoSelecionado;
         cbSelecionarExcluir.Checked := AlunoSelecionado;
         cbSelecionarExcluir.OnClick := cbSelecionarExcluirClick;
      end;
   end;
end;

procedure TfExportacaoDados.grdAlunosTitleClick(Column: TColumn);
var
   ponteiro : Pointer;
   selecionar : Boolean;
begin
   if Column.FieldName = qyAlunossn_excluir.FieldName then
   begin
      ponteiro := qyAlunos.GetBookmark;
      selecionar := (getQtdAlunosSelecionados = 0);

      qyAlunos.DisableControls;
      qyAlunos.First;
      while not qyAlunos.Eof do
      begin
         AlunoSelecionado := selecionar;

         qyAlunos.Next;
      end;

      try
         qyAlunos.GotoBookmark(ponteiro);
      except
      end;

      qyAlunos.EnableControls;
   end else begin
      Filtrar( True, Column.FieldName );
   end;
end;

procedure TfExportacaoDados.HideShowCH;
var
   mostrar : Boolean;
   queryAux: TUMZQuery;
begin
   mostrar := ProcessoUsaCH_Sit;

   // Como a função Filtrar sempre é executada com sn_filtrar igual a False ao mudar o Processo,
   // colocamos aqui a programação para desabilitar as colunas caso não seja processo do ENADE
   grdAlunos.Columns[5].Visible := mostrar;
   grdAlunos.Columns[6].Visible := mostrar;
   grdAlunos.Columns[7].Visible := mostrar;

   cbSituacoes.Visible := mostrar;
   cbSituacoesCurso.Visible := mostrar;

   sbRegistrarSituacao.Visible := mostrar;
   sbRegistrarSituacaoCurso.Visible := mostrar;

   if not mostrar then
   begin
      queryAux := nil;
      pnFiltros.Height := 31;
      btnFiltrar.Top := 5;
      btnFiltrar.Left := 606;
      btnLimpar.Top := 5;
      btnLimpar.Left := 674;
   end
   else
   begin
      queryAux := qyAlunos;
      pnFiltros.Height := 61;
      btnFiltrar.Top := 36;
      btnFiltrar.Left := 478;
      btnLimpar.Top := 36;
      btnLimpar.Left := 546;
   end;

   qyAlunosnr_carga_horaria.SetParentComponent(queryAux);
   qyAlunoscd_situacao.SetParentComponent(queryAux);
   qyAlunosds_situacao.SetParentComponent(queryAux);
   qyAlunoscd_situacao_curso.SetParentComponent(queryAux);
   qyAlunosds_situacao_curso.SetParentComponent(queryAux);
end;

procedure TfExportacaoDados.MostraArquivosExportados;
const
   SQL_DATA_ULTIMA_EXPORTACAO = 'SELECT DATE_FORMAT(dt_exportacao, ''%d/%m/%Y %H:%i:%s'') AS ultima_exportacao ' +
                                'FROM expo_processo_logs WHERE cd_processo = :cd_processo ' +
                                'GROUP BY cd_processo ' +
                                'ORDER BY nr_exportacao DESC';
var
   qyUltimaExportacao: TUMZQuery;
begin
   qyArquivosExportados.Close();
   qyArquivosExportados.ParamByName('cd_processo').AsInteger := Processo;

   qyArquivosExportados.Open();

   DM.CriarConsulta(qyUltimaExportacao);

   with qyUltimaExportacao do
   begin
      SQL.Text := SQL_DATA_ULTIMA_EXPORTACAO;

      ParamByName('cd_processo').AsInteger := Processo;

      Open();

      if (trim(FieldByName('ultima_exportacao').AsString) = '') then
         edUltimaExportacao.Text := 'Nenhuma exportação.'
      else
         edUltimaExportacao.Text := FieldByName('ultima_exportacao').AsString;
   end;
end;

procedure TfExportacaoDados.pcExportacaoChange(Sender: TObject);
begin
   if pcExportacao.ActivePage = tsExportacoes then
      mostraArquivosExportados();   

   VerificaBotoes();
end;

procedure TfExportacaoDados.pcExportacaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   sbRegistrarSituacao.Down := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacao.Visible := False;
   cbAlteraSituacaoCurso.Visible := False;

   // Verifica se um processo foi selecionado
   if (Processo <= 0) AND (pcExportacao.ActivePage = tsAlunos) then
   begin
      Mensagem('É necessário selecionar um processo de Exportação.', 'Exclusão de Aluno', MB_OK + MB_ICONEXCLAMATION, Handle);
      AllowChange := False;
   end;
end;

function TfExportacaoDados.PossuiArquivoOficial: Boolean;
const
   SQL_VERIFICA_OFICIAL = 'SELECT COUNT(*) AS registros ' +
                          'FROM expo_processo_logs WHERE cd_processo = :cd_processo AND sn_oficial = 1 ';
var
   qyVerificaOficial: TUMZQuery;
begin
   DM.CriarConsulta(qyVerificaOficial);
   
   with qyVerificaOficial do
   begin
      Close();
      SQL.Text := SQL_VERIFICA_OFICIAL;
      ParamByName('cd_processo').AsInteger := Processo;
      Open();

      Result := (FieldByName('registros').AsInteger > 0);
   end;
end;

procedure TfExportacaoDados.qyAlunosCalcFields(DataSet: TDataSet);
begin
   qyAlunosnr_anosemestre_formatado.AsString :=
      Copy( qyAlunosnr_anosemestre.AsString, 1, 4 ) + '/' +
      Copy( qyAlunosnr_anosemestre.AsString, 5, Length(qyAlunosnr_anosemestre.AsString) );
end;

procedure TfExportacaoDados.sbBuscaAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      edAluno.Text := IntToStr( resultado_filtro.cd_pessoa );
   end;
end;

procedure TfExportacaoDados.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   { Buscar Curso }
   if not ProcessoUsaAnosemestre then
      resultado_filtro := TfrmSelecionarCurso.Filtrar([bfcSomenteAno])
   else
      resultado_filtro := TfrmSelecionarCurso.Filtrar([]);


   if resultado_filtro.filtrado then
   begin
      Anosemestre := resultado_filtro.nr_anosemestre;
      Curso := resultado_filtro.cd_curso;
   end;
end;

procedure TfExportacaoDados.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   filtro_anosemestre : Integer;
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   if (Anosemestre > 0) then
      filtro_anosemestre := Anosemestre
   else
      filtro_anosemestre := ano_semestre;

   { Pesquisar Turma }
   if ProcessoUsaAnosemestre then
      resultado_filtro := TfrmSelecionarTurma.Filtrar([], filtro_anosemestre, -1, -1, Curso)
   else
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftSomenteAno], filtro_anosemestre, -1, -1, Curso);

   if not resultado_filtro.filtrado then Exit;

   Anosemestre := resultado_filtro.nr_anosemestre;
   Curso := resultado_filtro.cd_curso;
   Turma := resultado_filtro.cd_turma;
end;

procedure TfExportacaoDados.sbRegistrarSituacaoClick(Sender: TObject);
begin
   cbAlteraSituacao.Visible := False;

   sbRegistrarSituacao.Down := not sbRegistrarSituacao.Down
end;

procedure TfExportacaoDados.sbRegistrarSituacaoCursoClick(Sender: TObject);
begin
   cbAlteraSituacaoCurso.Visible := False;

   sbRegistrarSituacaoCurso.Down := not sbRegistrarSituacaoCurso.Down
end;

procedure TfExportacaoDados.SelecionaArquivoOficial(const sn_oficial: Boolean);
const
   SQL_ALTERA_OFICIAL = 'UPDATE expo_processo_logs SET sn_oficial = CASE WHEN sn_oficial = 0 THEN 1 ELSE 0 END ' +
                        'WHERE cd_processo = :cd_processo AND nr_exportacao = :nr_exportacao';
var
   qyAlteraOficial: TUMZQuery;
   ponteiro: Pointer;
begin
   DM.CriarConsulta(qyAlteraOficial);
   
   with qyAlteraOficial do
   begin
      // Executa a marcação do arquivo oficial
      Close();
      SQL.Text := SQL_ALTERA_OFICIAL;

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_exportacao').AsInteger := qyArquivosExportadosnr_exportacao.AsInteger;

      ExecSQL();

      ponteiro := qyArquivosExportados.GetBookmark;
      qyArquivosExportados.Close();
      qyArquivosExportados.Open();

      try
         qyArquivosExportados.GotoBookmark(ponteiro);
      except
      end;
   end;
end;

procedure TfExportacaoDados.setAluno(const Value: Integer);
begin
   if Value = 0 then
      edAluno.Text := ''
   else
      edAluno.Text := IntToStr(Value);
end;

procedure TfExportacaoDados.setAlunoSelecionado(const Value: Boolean);
begin
   if ( qyAlunos.RecordCount = 0 ) then
      Exit;

   if Value then
      FListaPessoasSelecionadas.Values[ qyAlunosnr_anosemestre.AsString + qyAlunoscd_pessoa.AsString ] := 'S'
   else
      FListaPessoasSelecionadas.Values[ qyAlunosnr_anosemestre.AsString + qyAlunoscd_pessoa.AsString ] := 'N';
end;

procedure TfExportacaoDados.setCurso(const Value: String);
begin
   edCurso.Text := Value;
end;

procedure TfExportacaoDados.setProcesso(const Value: Integer);
var
   I: Integer;
begin
   if Value > -1 then
   begin
      for I := 0 to cbProcessos.Items.Count - 1 do
      begin
         if StrToInt(TItemCombo(cbProcessos.Items.Objects[cbProcessos.ItemIndex]).getCodigo()) = Value then
         begin
            cbProcessos.ItemIndex := I;
            break;
         end;
      end;
   end
   else
      cbProcessos.ItemIndex := Value;
end;

procedure TfExportacaoDados.setSituacao(const Value: Integer);
var
   I: Integer;
begin
   if Value > -1 then
   begin
      for I := 0 to cbSituacoes.Items.Count - 1 do
      begin
         if StrToInt(TItemCombo(cbSituacoes.Items.Objects[cbSituacoes.ItemIndex]).getCodigo()) = Value then
         begin
            cbSituacoes.ItemIndex := I;
            break;
         end;
      end;
   end
   else
      cbSituacoes.ItemIndex := Value;
end;

procedure TfExportacaoDados.setSituacaoCurso(const Value: Integer);
var
   I: Integer;
begin
   if Value > -1 then
   begin
      for I := 0 to cbSituacoesCurso.Items.Count - 1 do
      begin
         if StrToInt(TItemCombo(cbSituacoesCurso.Items.Objects[cbSituacoesCurso.ItemIndex]).getCodigo()) = Value then
         begin
            cbSituacoesCurso.ItemIndex := I;
            break;
         end;
      end;
   end
   else
      cbSituacoesCurso.ItemIndex := Value;
end;

procedure TfExportacaoDados.setTurma(const Value: String);
begin
   edTurma.Text := Value;
end;

procedure TfExportacaoDados.VerificaBotoes;
begin
   btnBaixarArquivo.Visible := (pcExportacao.ActivePage = tsExportacoes);
   btnGeraRelatorio.Visible := (pcExportacao.ActivePage = tsExportacoes);
   btnExportarDados.Visible := (pcExportacao.ActivePage = tsAlunos);
   btnIncluirAluno.Visible := (pcExportacao.ActivePage = tsAlunos);
   btnExcluirAluno.Visible := (pcExportacao.ActivePage = tsAlunos);
   sbRegistrarSituacao.Visible := (pcExportacao.ActivePage = tsAlunos);
   sbRegistrarSituacaoCurso.Visible := (pcExportacao.ActivePage = tsAlunos);
end;

procedure TfExportacaoDados.btnGeraRelatorioClick(Sender: TObject);
begin
   GerarRelatorio();
end;

procedure TfExportacaoDados.ZerarFiltros;
begin
   sbRegistrarSituacao.Down := False;
   cbAlteraSituacao.Visible := False;
   sbRegistrarSituacaoCurso.Down := False;
   cbAlteraSituacaoCurso.Visible := False;

   Anosemestre := 0;
   Curso := '';
   Turma := '';
   Situacao := -1;
   SituacaoCurso := -1;
end;

end.
