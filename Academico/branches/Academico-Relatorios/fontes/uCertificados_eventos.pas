unit uCertificados_eventos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   uDM, uModelTam,ZConnection, ToolWin, ImgList, UZSortedGrid;

type
   EUMTAMCertificadoErro = class(Exception);

   TUMTAMCertificadoLivro = class(TObject)
   strict private
      FICodigo: integer;
      FIPaginas: integer;
      FILinhas: integer;
      FIPaginaAtual: integer;
      FBAberto: boolean;
      FSNome: string;
      FSTipo: string;
      FSLastError: string;
      FQyRegistrosLivro: TUMZQuery;
      FQyRegistrosPagina: TUMZQuery;
      FQyLivroCheio: TUMZQuery;
      FQyPaginaCheia: TUMZQuery;
      FQyNumeroRegistro: TUMZQuery;
      FQyRegistroPessoa: TUMZQuery;
      FQyRegistra: TUMZQuery;
      FQyFechaLivro: TUMZQuery;
      FQyAtualizaPagina: TUMZQuery;
      procedure fecha;
      function getPagina: integer;
      function isCheio: boolean;
      function isPessoaRegistrada(const AIEvento, AIPessoa: integer): boolean;
      function isPaginaCheia(const AIPagina: integer): boolean;
      function getTotalRegistros: integer; overload;
      function getTotalRegistros(const AIPagina: integer): integer; overload;
      function getNumeroRegistro(const AIEvento: integer): integer;
   private
      constructor Create(const AICodigo, AIPaginas, AILinhas, AIPaginaAtual: integer;
         const ASNome, ASTipo: string; const ABAberto: boolean);
      destructor Destroy; override;
      procedure atualizaPagina;
      procedure registraCertificadoEvento(const AIEvento, AIPessoa: integer);
      property Codigo: integer read FICodigo;
      property Nome: string read FSNome;
      property PaginaAtual: integer read FIPaginaAtual;
      property Aberto: boolean read FBAberto;
      property Cheio: boolean read isCheio;
   end;

   TfCertificadosEventos = class(TForm)
    bnAdicionaLivro: TSpeedButton;
    qyDados: TUMZQuery;
    qyInsereAtividade: TUMZQuery;
    qyMatriculaAluno: TUMZQuery;
    ImageList1: TImageList;
    ImageList2: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    qryGetParcial: TUMZQuery;
    qryGe_atividade: TUMZQuery;
    qryIsAluno: TUMZQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
   published
      pnTitulo: TPanel;
      bvSep1: TBevel;
      sbStatus: TStatusBar;
      pnRegistrar: TPanel;
      cbLivro: TComboBox;
      lbLivro: TLabel;
      ledPagina: TLabeledEdit;
      pbProgresso: TProgressBar;
      bnRegistrar: TSpeedButton;
      pnFiltros: TPanel;
      lbEvento: TLabel;
      cbEvento: TComboBox;
      ledPessoa: TLabeledEdit;
      bnPessoa: TSpeedButton;
      pnDados: TPanel;
      bvSep2: TBevel;
      bvSep3: TBevel;
      dgDados: TZSortedGrid;
      dsDados: TDataSource;
      FQyHorasDeferidasAluno: TUMZQuery;
      procedure informaPessoa(Sender: TObject; var Key: Char);
      procedure informaPagina(Sender: TObject; var Key: Char);
//      procedure desenhaItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
      procedure selecionaPessoa(Sender: TObject);
      procedure registra(Sender: TObject);
      procedure selecionaEvento(Sender: TObject);
      procedure selecionaLivro(Sender: TObject);
      procedure fechaFormulario(Sender: TObject; var Action: TCloseAction);
      procedure mostraFormulario(Sender: TObject);
      procedure sair(Sender: TObject);
      procedure adicionaLivro(Sender: TObject);
      procedure gravarLog(const AICodPessoa, AIAnoSem, AIEtapa, AICodAtividade, AIHoras: integer;
         const ASCodCurso, ASAtividade, ASLocal: string; const ADtInicio, ADtTermino: TDateTime);
   strict private
      function registraAtividade(const AICodPessoa, AIAnoSem, AIEtapa, AICodAtividade, AIHoras, AICodInscricao: integer;
         const ASCodCurso, ASAtividade, ASLocal: string; const ADtInicio, ADtTermino: TDateTime): boolean;
      function verificaSeAindaTemHorasLivres(const AICodigoPessoa , AIAnoSem, AICodigoAtivide: Integer):boolean;
      function isAtividadeRegistrada(const AICodInscricao:Integer):boolean;
      function defineNrRegistroEvento(evento : Integer):Integer;
      function verificaHorasDefiridas(nr_horas_atuais : Double; cd_ge_atividade_atual, cd_pessoa_atual, nr_anosemestre : Integer; cd_curso_atual : String ) : Double;
      function getHorasDeferidaAluno( cd_pessoa_atual ,cd_ge_atividade_atual : Integer; cd_curso_atual : String ): TUMZQuery;
      function verificaHorasPorGrade( cd_curso : String; cd_pessoa, cd_ge_atividade, nr_anosemestre : Integer ) : Double;
      function is_aluno( cd_pessoa : integer ) :  Boolean; 
      procedure getDadosMatricula(const AICodPessoa: integer);
      procedure carregaEventos;
      procedure carregaLivros;
      procedure filtra;
   end;

var
   fCertificadosEventos: TfCertificadosEventos;

implementation

uses
   uCadLivro_eventos, uFSelecionarPessoa;

const
   SQL_GET_REGISTROS_LIVRO =
      'SELECT '+
         'cd_pessoa '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_livro = :cd_livro';

   SQL_GET_REGISTROS_PAGINA =
      'SELECT '+
         'cd_pessoa '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_livro = :cd_livro AND '+
         'nr_folha = :nr_folha';

   SQL_IS_LIVRO_CHEIO =
      'SELECT '+
         'CASE WHEN ((NR_PAGINAS * NR_LINHAS) <= :NR_REGISTROS) THEN 1 ELSE 0 END AS CHEIO '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_livro';

   SQL_IS_PAGINA_CHEIA =
      'SELECT '+
         'CASE WHEN nr_linhas <= :nr_registros THEN 1 ELSE 0 END AS cheio '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_livro';

   SQL_REGISTRA_CERTIFICADO =
      'INSERT INTO certificado_eventos(cd_evento, cd_pessoa, cd_livro, nr_folha, nr_registro, dt_registro) '+
      'VALUES(:cd_evento, :cd_pessoa, :cd_livro, :nr_folha, :nr_registro, NOW())';

   SQL_FECHA_LIVRO =
      'UPDATE certificado_livros '+
      'SET sn_aberto = 0 '+
      'WHERE cd_cert_livro = :cd_livro';

   SQL_ATUALIZA_PAGINA =
      'UPDATE certificado_livros '+
      'SET pg_atual = :nr_pagina '+
      'WHERE cd_cert_livro = :cd_livro';

   SQL_GET_PROX_REGISTRO =
      'SELECT '+
         '(COALESCE(MAX(COALESCE(nr_registro, 0)), 0) + 1) AS nr_registro '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_livro = :cd_livro';

   SQL_GET_CERT_PESSOA =
      'SELECT '+
         'cd_evento,'+
         'cd_pessoa '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_evento = :cd_evento AND '+
         'cd_pessoa = :cd_pessoa';

   SQL_GET_HORAS_DEFERIDAS_MYSQL =
      'SELECT '+
		'	SUM(al.nr_horas) as total, '+
      '	ga.nr_horas as limite, '+
      '  ga.ds_ge_atividade as ds_ge_atividade '+
      'FROM '+
      '  ge_atividades AS ga '+
      '  LEFT JOIN ge_alunos AS al ON(al.cd_ge_atividade = ga.cd_ge_atividade AND al.nr_anosem = :nr_anosemestre and al.cd_pessoa = :cd_pessoa  and (al.cd_situacao = 1 OR (al.cd_situacao IS NULL OR al.cd_situacao=0 ) ) )   '+
		'WHERE  '+
		'	ga.cd_ge_atividade = :cd_ge_atividade 	'+
      'GROUP BY '+
		'	ga.cd_ge_atividade ';

   SQL_GET_HORAS_DEFERIDAS_ORACLE =
      'SELECT '+
         'SUM(AL.NR_HORAS) TOTAL,'+
         'FIRST_OCCURRENCE(GA.NR_HORAS) LIMITE,'+
         'FIRST_OCCURRENCE(GA.DS_GE_ATIVIDADE) DS_GE_ATIVIDADE '+
      'FROM '+
         'GE_ATIVIDADES GA ' +
            'LEFT JOIN GE_ALUNOS AL ON '+
               '(AL.CD_GE_ATIVIDADE = GA.CD_GE_ATIVIDADE) AND '+
               '(AL.NR_ANOSEM = :NR_ANOSEMESTRE) AND '+
               '(AL.CD_PESSOA = :CD_PESSOA) AND '+
               '(AL.CD_SITUACAO = 1 OR (AL.CD_SITUACAO IS NULL OR AL.CD_SITUACAO = 0)) '+
      'WHERE '+
         'GA.CD_GE_ATIVIDADE = :CD_GE_ATIVIDADE '+
      'GROUP BY '+
         'GA.CD_GE_ATIVIDADE';

   SQL_GET_CERTIFICADOS_EVENTO =
      'SELECT         '+
      '  i.CD_EVENTO, '+
      '  i.CD_INSCRICAO,  '+
      '  i.CD_PESSOA,    '+
      '  COALESCE(P.nm_pessoa, i.NM_PESSOA)nm_pessoa,  '+
      '  COALESCE(v.nr_horas_evento,0) as nr_horas_evento, '+
      '  COALESCE(v.nr_horas_participacao,0) as nr_horas_participacao, '+
      '  COALESCE(v.horas_atividades,0) as horas_atividades, '+
      '  COALESCE(v.vl_presenca,0) as vl_presenca, '+
      '  l.cd_cert_livro,   '+
      '  CASE             '+
      '  WHEN '+
      '     (v.sn_certificar = 1) AND (E .VL_PRESENCA <= v.vl_presenca) '+
      '      AND(c.nr_folha IS NULL) AND(c.nr_registro IS NULL) AND '+
      '     (E.SN_CHECAR_FIN_CERTIFICADO = 0 OR (NOT(ISNULL(m.cd_mensalidade)) AND m.situacao IN (0, 1, 6))) '+
      '  THEN   '+
      '  1      '+
      '  ELSE   '+
      '  0      '+
      '  END as is_registrar,  '+
	   '  COALESCE(l.nm_livro, '''') nm_livro, '+
      '  c.nr_folha,    '+
      '  c.nr_registro, '+
      '  IFNULL(s.ds_situacao, "SEM FINANCEIRO") as ds_situacao '+
      'FROM             '+
      '  VIEW_EVENTOS_CARGA v  '+
      '  JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO) '+
      '  JOIN tam_eventos E on(i.CD_EVENTO= E.cd_evento)           '+
      '  LEFT JOIN pessoas P ON(i.CD_PESSOA = P .cd_pessoa)        '+
      '  LEFT JOIN certificado_eventos c ON(i.CD_EVENTO = c.cd_evento AND i.CD_PESSOA = c.cd_pessoa) '+
      '  LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cert_livro)   '+
      '  LEFT JOIN mensalidades m ON (i.CD_MENSALIDADE = m.cd_mensalidade) '+
      '  LEFT JOIN situacoes_financeiras s ON (m.situacao = s.cd_situacao) '+
      'WHERE                '+
      '  i.CD_EVENTO =  :cd_evento ';
      
   SQL_GET_CERTIFICADOS_EVENTO_PARCIAL =
     'SELECT '+
         'i.CD_EVENTO,'+
         'i.CD_INSCRICAO,'+
         'i.CD_PESSOA,'+
         'IFNULL(p.nm_pessoa, i.NM_PESSOA) nm_pessoa,'+
         'sum(v.nr_horas_evento) nr_horas_evento,'+
         'sum(v.nr_horas_participacao) nr_horas_participacao,'+
         'SUM(COALESCE(v.horas_atividades,0)) as horas_atividades, '+
         'round(avg(v.vl_presenca))  vl_presenca,'+
         'l.cd_cert_livro,'+
         'IF('+
            '(v.sn_certificar = 1) AND '+
            '(e.VL_PRESENCA <= avg(v.vl_presenca)) AND '+
            '(l.nm_livro IS NULL) AND '+
            '(c.nr_folha IS NULL) AND '+
            '(c.nr_registro IS NULL) AND '+
            '('+
               'e.SN_CHECAR_FIN_CERTIFICADO = 0 OR '+
               '('+
                  'NOT(ISNULL(m.cd_mensalidade)) '+
                  'AND m.situacao IN (0, 1, 6) '+
               ')'+
            ') '+
            ', 1, 0) is_registrar,'+
         'IFNULL(l.nm_livro, "") nm_livro,'+
         'c.nr_folha,'+
         'c.nr_registro, '+
         'IFNULL(s.ds_situacao, "SEM FINANCEIRO") as ds_situacao '+
      'FROM '+
         'view_eventos_carga_atividades v '+
            'JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO) '+
            'JOIN tam_eventos e USING(CD_EVENTO) '+
            'LEFT JOIN pessoas p ON(i.CD_PESSOA = p.cd_pessoa) '+
            'LEFT JOIN certificado_eventos c ON(i.CD_EVENTO = c.cd_evento AND i.CD_PESSOA = c.cd_pessoa) '+
            'LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cert_livro) '+
            'LEFT JOIN mensalidades m ON (i.CD_MENSALIDADE = m.cd_mensalidade) '+
            'LEFT JOIN situacoes_financeiras s ON (m.situacao = s.cd_situacao) '+
      'WHERE '+
         'i.CD_EVENTO = :cd_evento '+
         'AND v.sn_certificar = 1  '+
      'GROUP BY '+
         'i.CD_EVENTO,v.cd_pessoa';


   SQL_GET_CERTIFICADOS_EVENTO_PESSOA =
   'SELECT                                                                                         '+
	'  i.cd_evento,                                                                                 '+
	'  i.CD_INSCRICAO,                                                                              '+
	'  i.CD_PESSOA,                                                                                 '+
	'  COALESCE(p.nm_pessoa, i.NM_PESSOA) nm_pessoa,                                                '+
	'  v.nr_horas_evento,                                                                           '+
	'  v.nr_horas_participacao,                                                                     '+
   '  COALESCE(v.horas_atividades,0) as horas_atividades,                                          '+
	'  v.vl_presenca,                                                                               '+
	'  l.cd_cert_livro,                                                                             '+
	'  CASE                                                                                         '+
	'  WHEN (v.sn_certificar = 1) AND                                                               '+
   '		  (e.VL_PRESENCA <= v.vl_presenca) AND                                                    '+
	'		  (l.nm_livro IS NULL) AND                                                                '+
	'		  (c.nr_folha IS NULL) AND                                                                '+
	'		  (c.nr_registro IS NULL) AND                                                             '+
   '       (                                                                                       '+
   '           e.SN_CHECAR_FIN_CERTIFICADO = 0 OR                                                  '+
   '           (NOT(ISNULL(m.cd_mensalidade)) AND m.situacao IN (0, 1, 6))                         '+
   '       )                                                                                       '+
   '  THEN                                                                                         '+
	'	1                                                                                            '+
	'  ELSE                                                                                         '+
   '  0                                                                                            '+
	'  end is_registrar,                                                                            '+
	'  COALESCE(l.nm_livro,'''' ) nm_livro,                                                         '+
	'  c.nr_folha,                                                                                  '+
	'  c.nr_registro,                                                                               '+
   '  IFNULL(s.ds_situacao, "SEM FINANCEIRO")  as ds_situacao                                      '+
   'FROM                                                                                           '+
	'  VIEW_EVENTOS_CARGA v                                                                         '+
	'  JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO)                                    '+
	'  JOIN tam_eventos e ON(i.CD_EVENTO = e.CD_EVENTO)                                             '+
	'  LEFT JOIN pessoas p ON(i.CD_PESSOA = p.cd_pessoa)                                            '+
	'  LEFT JOIN certificado_eventos c ON(i.cd_evento = c.cd_evento AND i.CD_PESSOA = c.cd_pessoa)  '+
	'  LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cert_livro)                              '+
   '  LEFT JOIN mensalidades m ON (i.CD_MENSALIDADE = m.cd_mensalidade)                            '+
   '  LEFT JOIN situacoes_financeiras s ON (m.situacao = s.cd_situacao)                            '+
   'WHERE                                                                                          '+
	' i.CD_EVENTO = :cd_evento AND                                                                  '+
	' i.CD_PESSOA = :cd_pessoa                                                                      ';

   SQL_GET_CERTIFICADOS_EVENTO_PESSOA_PARCIAL =
      'SELECT '+
         'i.CD_EVENTO,'+
         'i.CD_INSCRICAO,'+
         'i.CD_PESSOA,'+
         'IFNULL(p.nm_pessoa, i.NM_PESSOA) nm_pessoa,'+
         'sum(v.nr_horas_evento) nr_horas_evento,'+
         'sum(v.nr_horas_participacao) nr_horas_participacao,'+
         'SUM(COALESCE(v.horas_atividades,0)) as horas_atividades, '+
         'round(avg(v.vl_presenca))  vl_presenca,'+
         'l.cd_cert_livro,'+
         'IF('+
            '(v.sn_certificar = 1) AND '+
            '(e.VL_PRESENCA <= avg(v.vl_presenca)) AND '+
            '(l.nm_livro IS NULL) AND '+
            '(c.nr_folha IS NULL) AND '+
            '(c.nr_registro IS NULL) AND '+
            '('+
               'e.SN_CHECAR_FIN_CERTIFICADO = 0 OR '+
               '('+
                  'NOT(ISNULL(m.cd_mensalidade)) '+
                  'AND m.situacao IN (0, 1, 6) '+
               ')'+
            ') '+
         ', 1, 0) is_registrar,'+
         'IFNULL(l.nm_livro, "") nm_livro,'+
         'c.nr_folha,'+
         'c.nr_registro, '+
         '  IFNULL(s.ds_situacao, "SEM FINANCEIRO") as ds_situacao '+
      'FROM '+
         'view_eventos_carga_atividades v '+
            'JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO) '+
            'JOIN tam_eventos e USING(CD_EVENTO) '+
            'LEFT JOIN pessoas p ON(i.CD_PESSOA = p.cd_pessoa) '+
            'LEFT JOIN certificado_eventos c ON(i.CD_EVENTO = c.cd_evento AND i.CD_PESSOA = c.cd_pessoa) '+
            'LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cert_livro) '+
            'LEFT JOIN mensalidades m ON (i.CD_MENSALIDADE = m.cd_mensalidade) '+
            'LEFT JOIN situacoes_financeiras s ON (m.situacao = s.cd_situacao) '+
      'WHERE '+
         'i.CD_EVENTO = :cd_evento AND '+
         'i.CD_PESSOA = :cd_pessoa AND '+
         'v.sn_certificar = 1          '+
      'GROUP BY '+
         'i.CD_EVENTO,v.cd_pessoa';

   MSG_ERRO_FECHA_LIVRO =
      'Ocorreu um erro ao tentar fechar o livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_ERRO_GET_PROX_REG =
      'Ocorreu um erro ao tentar pegar o próximo número de registro do livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_LIMITE_PAGINAS =
      'O livro atingiu o limite de páginas. Selecione outro livro para prosseguir.';

   MSG_ERRO_GET_TOTAL =
      'Ocorreu um erro ao tentar resgatar o total de registros cadastrados para o livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_ERRO_GET_TOTAL_PAGINA =
      'Ocorreu um erro ao tentar resgatar o total de registros na página $nr_pagina$ no livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_ERRO_IS_LIVRO_CHEIO =
      'Ocorreu um erro ao tentar verificar a disponibilidade de espaço do livro $nm_livro$ : $erro$';

   MSG_ERRO_IS_PAGINA_CHEIA =
      'Ocorreu um erro ao tentar verificar a disponibilidade de espaço na página $nr_pagina$ do livro $nm_livro$ : $erro$';

   MSG_ERRO_GET_CERT_PESSOA =
      'Ocorreu um erro ao tentar verificar certificados previamente cadastrados para o aluno $cd_aluno$ no evento $cd_evento$ : $erro$';

   MSG_ERRO_REGISTRA_CERT =
      'Ocorreu um erro ao tentar registrar certificado para o aluno $cd_aluno$ no evento $cd_evento$ : $erro$';

   MSG_SUCESSO =
      'Os certificados foram registrados com sucesso!';

   MSG_LIVRO_CHEIO =
      'O livro está completo! Não é possível inserir mais registros.' + #13 +
      'Você precisa selecionar outro livro para continuar!';

   MSG_ERRO_ATUALIZA_PAGINA =
      'Ocorreu um erro ao tentar atualizar a página do livro : $erro$';

   MSG_ERRO_HORAS_DEFERIDAS =
      'Ocorreu um erro ao tentar buscar as horas deferidas desse aluno : $erro$';

{$R *.dfm}

{ TUMTAMCertificadoLivro }

procedure TUMTAMCertificadoLivro.atualizaPagina;
begin
   Self.FQyAtualizaPagina.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   Self.FQyAtualizaPagina.ParamByName('nr_pagina').AsInteger := Self.FIPaginaAtual;
   try
      Self.FQyAtualizaPagina.ExecSQL;
   except
      on E: Exception do
         raise EUMTAMCertificadoErro.Create(StringReplace(MSG_ERRO_ATUALIZA_PAGINA, '$erro$', E.Message, []));
   end;
end;

constructor TUMTAMCertificadoLivro.Create(const AICodigo, AIPaginas, AILinhas,
  AIPaginaAtual: integer; const ASNome, ASTipo: string;
  const ABAberto: boolean);
begin
   Self.FICodigo := AICodigo;
   Self.FIPaginas := AIPaginas;
   Self.FILinhas := AILinhas;
   Self.FIPaginaAtual := AIPaginaAtual;
   Self.FBAberto := ABAberto;
   Self.FSNome := ASNome;
   Self.FSTipo := ASTipo;
   
   DM.CriarConsulta(Self.FQyRegistrosLivro);
   DM.CriarConsulta(Self.FQyRegistrosPagina);
   DM.CriarConsulta(Self.FQyLivroCheio);
   DM.CriarConsulta(Self.FQyPaginaCheia);
   DM.CriarConsulta(Self.FQyNumeroRegistro);
   DM.CriarConsulta(Self.FQyRegistroPessoa);
   DM.CriarConsulta(Self.FQyRegistra);
   DM.CriarConsulta(Self.FQyFechaLivro);
   DM.CriarConsulta(Self.FQyAtualizaPagina);

   Self.FQyRegistrosLivro.SQL.Text := SQL_GET_REGISTROS_LIVRO;
   Self.FQyRegistrosPagina.SQL.Text := SQL_GET_REGISTROS_PAGINA;
   Self.FQyLivroCheio.SQL.Text := SQL_IS_LIVRO_CHEIO;
   Self.FQyPaginaCheia.SQL.Text := SQL_IS_PAGINA_CHEIA;
   Self.FQyNumeroRegistro.SQL.Text := SQL_GET_PROX_REGISTRO;
   Self.FQyRegistroPessoa.SQL.Text := SQL_GET_CERT_PESSOA;
   Self.FQyRegistra.SQL.Text := SQL_REGISTRA_CERTIFICADO;
   Self.FQyFechaLivro.SQL.Text := SQL_FECHA_LIVRO;
   Self.FQyAtualizaPagina.SQL.Text := SQL_ATUALIZA_PAGINA;


   Self.FQyRegistrosLivro.ParamCheck := True;
   Self.FQyRegistrosPagina.ParamCheck := True;
   Self.FQyLivroCheio.ParamCheck := True;
   Self.FQyPaginaCheia.ParamCheck := True;
   Self.FQyNumeroRegistro.ParamCheck := True;
   Self.FQyRegistroPessoa.ParamCheck := True;
   Self.FQyRegistra.ParamCheck := True;
   Self.FQyFechaLivro.ParamCheck := True;
   Self.FQyAtualizaPagina.ParamCheck := True;

end;

destructor TUMTAMCertificadoLivro.Destroy;
begin
   Self.FQyRegistrosLivro.Close;
   Self.FQyRegistrosPagina.Close;
   Self.FQyLivroCheio.Close;
   Self.FQyPaginaCheia.Close;
   Self.FQyNumeroRegistro.Close;
   Self.FQyRegistroPessoa.Close;
   FreeAndNil(Self.FQyRegistrosLivro);
   FreeAndNil(Self.FQyRegistrosPagina);
   FreeAndNil(Self.FQyLivroCheio);
   FreeAndNil(Self.FQyPaginaCheia);
   FreeAndNil(Self.FQyNumeroRegistro);
   FreeAndNil(Self.FQyRegistroPessoa);
   FreeAndNil(Self.FQyRegistra);
   FreeAndNil(Self.FQyFechaLivro);
   FreeAndNil(Self.FQyAtualizaPagina);
   inherited;
end;

procedure TUMTAMCertificadoLivro.fecha;
begin
   Self.FQyFechaLivro.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyFechaLivro.ExecSQL;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_FECHA_LIVRO, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.getNumeroRegistro(
  const AIEvento: integer): integer;
begin
   Self.FQyNumeroRegistro.Close;
   Self.FQyNumeroRegistro.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyNumeroRegistro.Open;
      if Self.FQyNumeroRegistro.IsEmpty then
         Result := 1
      else
         Result := Self.FQyNumeroRegistro.FieldByName('nr_registro').AsInteger;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_PROX_REG, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.getPagina: integer;
begin
   Result := Self.FIPaginaAtual;
   try
      while Self.isPaginaCheia(Result) and (Result <= Self.FIPaginas) do
         Inc(Result);
   except
      on E: EUMTAMCertificadoErro do raise;
   end;
   if Result > Self.FIPaginas then
   begin
      Self.fecha;
      raise EUMTAMCertificadoErro.Create(MSG_LIMITE_PAGINAS);
   end
   else
      Self.FIPaginaAtual := Result;
end;

function TUMTAMCertificadoLivro.getTotalRegistros: integer;
begin
   Result := 0;
   Self.FQyRegistrosLivro.Close;
   Self.FQyRegistrosLivro.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyRegistrosLivro.Open;
      Result := Self.FQyRegistrosLivro.RecordCount;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_TOTAL, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError); 
      end;
   end;
end;

function TUMTAMCertificadoLivro.getTotalRegistros(
  const AIPagina: integer): integer;
begin
   Result := 0;
   Self.FQyRegistrosPagina.Close;
   Self.FQyRegistrosPagina.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   Self.FQyRegistrosPagina.ParamByName('nr_folha').AsInteger := AIPagina;
   try
      Self.FQyRegistrosPagina.Open;
      Result := Self.FQyRegistrosPagina.RecordCount;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_TOTAL_PAGINA, '$nr_pagina$', IntToStr(AIPagina), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.isCheio: boolean;
begin
   Result := False;
   Self.FQyLivroCheio.Close;
   Self.FQyLivroCheio.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyLivroCheio.ParamByName('NR_REGISTROS').AsInteger := Self.getTotalRegistros;
      Self.FQyLivroCheio.Open;
      Result := Self.FQyLivroCheio.FieldByName('CHEIO').AsInteger = 1;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_IS_LIVRO_CHEIO, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.isPaginaCheia(const AIPagina: integer): boolean;
begin
   Result := False;
   Self.FQyPaginaCheia.Close;
   Self.FQyPaginaCheia.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyPaginaCheia.ParamByName('nr_registros').AsInteger := Self.getTotalRegistros(AIPagina);
      Self.FQyPaginaCheia.Open;
      Result := Self.FQyPaginaCheia.FieldByName('cheio').AsInteger = 1;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_IS_PAGINA_CHEIA, '$nr_pagina$', IntToStr(AIPagina), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.isPessoaRegistrada(const AIEvento,
  AIPessoa: integer): boolean;
begin
   Result := False;
   Self.FQyRegistroPessoa.Close;
   Self.FQyRegistroPessoa.ParamByName('cd_pessoa').AsInteger := AIPessoa;
   Self.FQyRegistroPessoa.ParamByName('cd_evento').AsInteger := AIEvento;
   try
      Self.FQyRegistroPessoa.Open;
      Result := not Self.FQyRegistroPessoa.IsEmpty;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_CERT_PESSOA, '$cd_aluno$', IntToStr(AIPessoa), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$cd_evento$', IntToStr(AIEvento), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

procedure TUMTAMCertificadoLivro.registraCertificadoEvento(const AIEvento,
  AIPessoa: integer);
begin
   try
      if not Self.isPessoaRegistrada(AIEvento, AIPessoa) then
      begin
         Self.FQyRegistra.ParamByName('cd_evento').AsInteger := AIEvento;
         Self.FQyRegistra.ParamByName('cd_pessoa').AsInteger := AIPessoa;
         Self.FQyRegistra.ParamByName('cd_livro').AsInteger := Self.FICodigo;
         Self.FQyRegistra.ParamByName('nr_folha').AsInteger := Self.getPagina;
         Self.FQyRegistra.ParamByName('nr_registro').AsInteger := Self.getNumeroRegistro(AIEvento);
         Self.FQyRegistra.ExecSQL;
      end;
   except
      on E: EUMTAMCertificadoErro do raise;
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_REGISTRA_CERT, '$cd_aluno$', IntToStr(AIPessoa), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$cd_evento$', IntToStr(AIEvento), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

{ TfCertificados }

procedure TfCertificadosEventos.adicionaLivro(Sender: TObject);
var
   sLivro: string;
   i: integer;
begin
   sLivro := TfCadLivroEventos.AdicionaLivro(Self);
   if sLivro <> '' then
   begin
      Self.cbLivro.Clear;
      Self.carregaLivros;
      for i := 0 to Self.cbLivro.Items.Count - 1 do
         if sLivro = Self.cbLivro.Items.Strings[i] then
            Break;
      Self.cbLivro.ItemIndex := i;
      Self.ledPagina.Text := IntToStr(TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[i]).PaginaAtual);
      Self.selecionaLivro(nil);
   end;   
end;

procedure TfCertificadosEventos.carregaEventos;
const
   SQL_GET_EVENTOS_MYSQL =
      'SELECT      '+
      '   CD_EVENTO,'+
      '   DS_EVENTO,'+
      '   DT_EVENTO,                                   '+
      '   DT_EVENTO_FIM,                               '+
      '   DS_SENHA,                                    '+
      '   SN_CHECAR_FIN_ACESSO,                        '+
      '   SN_LIBERAR_INSCRICOES,                       '+
      '   COALESCE(CD_GE_ATIVIDADE, 0) CD_GE_ATIVIDADE,'+
      '   ME_LOCAL,                                    '+
      '   NR_REGISTRO                                  '+
      'FROM                                            '+
      '   tam_eventos                                  '+
      'ORDER BY                                        '+
      'DS_EVENTO                                       ';
      
   SQL_GET_EVENTOS_ORACLE =
      'SELECT      '+
      '  CD_EVENTO,'+
		'  DS_EVENTO,'+
      '   DT_EVENTO,                                   '+
      '   DT_EVENTO_FIM,                               '+
      '   DS_SENHA,                                    '+
      '   SN_CHECAR_FIN_ACESSO,                        '+
      '   SN_LIBERAR_INSCRICOES,                       '+
      '   COALESCE(CD_GE_ATIVIDADE, 0) CD_GE_ATIVIDADE,'+
      '   ME_LOCAL,                                    '+
      '   NR_REGISTRO                                  '+
      'FROM                                            '+
      '   tam_eventos                                  '+
      'ORDER BY                                        '+
      '   DS_EVENTO                                    ';

   SQL_CALL_ATUALIZA_VIEW =
      ' CALL TAM_ATUALIZA_CARGA_EVENTOS(NULL) ';
var
   qyEventos,
   qyAtualizaView: TUMZQuery;
begin
   DM.CriarConsulta(qyEventos);
   DM.CriarConsulta(qyAtualizaView);

   qyAtualizaView.SQL.Text := SQL_CALL_ATUALIZA_VIEW;
   qyAtualizaView.ExecSQL;

   try
      qyEventos.ParamCheck := False;
      qyEventos.SQL.Text := SQL_GET_EVENTOS_ORACLE;
      qyEventos.SQLList.Values['mysql-5'] := SQL_GET_EVENTOS_MYSQL;
      qyEventos.SQLList.Values['oracle'] := SQL_GET_EVENTOS_ORACLE;
      qyEventos.Open;
      Self.cbEvento.Enabled := not qyEventos.IsEmpty;
      while not qyEventos.Eof do
      begin             
         Self.cbEvento.AddItem(
            qyEventos.FieldByName('DS_EVENTO').AsString,
            TUMEvento.Create(
               qyEventos.FieldByName('CD_EVENTO').AsInteger,
               qyEventos.FieldByName('DS_EVENTO').AsString,
               qyEventos.FieldByName('DT_EVENTO').AsDateTime,
               qyEventos.FieldByName('DS_SENHA').AsString,
               qyEventos.FieldByName('SN_CHECAR_FIN_ACESSO').AsInteger = 1,
               qyEventos.FieldByName('SN_LIBERAR_INSCRICOES').AsInteger = 1,
               qyEventos.FieldByName('CD_GE_ATIVIDADE').AsInteger,
               qyEventos.FieldByName('ME_LOCAL').AsString,
               qyEventos.FieldByName('DT_EVENTO_FIM').AsDateTime));
         qyEventos.Next;
      end;
   finally
      qyEventos.Close;
      FreeAndNil(qyEventos);
   end; 
end;

procedure TfCertificadosEventos.carregaLivros;
const
   SQL_GET_LIVROS =
      'SELECT '+
         'cd_cert_livro,'+
         'nm_livro,'+
         'cd_tipo,'+
         'nr_paginas,'+
         'nr_linhas,'+
         'pg_atual,'+
         'sn_aberto '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_tipo LIKE ''E'' AND '+
         'sn_aberto = 1';
var
   qyLivros: TUMZQuery;
begin
   DM.CriarConsulta(qyLivros);
   try
      qyLivros.ParamCheck := False;
      qyLivros.SQL.Text := SQL_GET_LIVROS;
      qyLivros.Open;
      Self.cbLivro.Enabled := not qyLivros.IsEmpty;
      while not qyLivros.Eof do
      begin
         Self.cbLivro.Items.AddObject(
            qyLivros.FieldByName('nm_livro').AsString,
            TUMTAMCertificadoLivro.Create(
               qyLivros.FieldByName('cd_cert_livro').AsInteger,
               qyLivros.FieldByName('nr_paginas').AsInteger,
               qyLivros.FieldByName('nr_linhas').AsInteger,
               qyLivros.FieldByName('pg_atual').AsInteger,
               qyLivros.FieldByName('nm_livro').AsString,
               qyLivros.FieldByName('cd_tipo').AsString,
               (qyLivros.FieldByName('sn_aberto').AsInteger = 1)));
         qyLivros.Next;
      end;
   finally
      qyLivros.Close;
      FreeAndNil(qyLivros);
   end;  
end;

function TfCertificadosEventos.defineNrRegistroEvento(evento: Integer): Integer;
const
   SQL_GET_MAX_REGISTRO =
      'SELECT MAX(nr_registro)+1 registro from tam_eventos';
const
   SQL_SET_NR_REGISTRO_EVENTO =
      'UPDATE tam_eventos SET nr_registro = :nr_registro WHERE CD_EVENTO = :cd_evento AND nr_registro = 0';
var
   qyMaxRegistro, qyInsereNrRegistroEvento : TUMZQuery;
   registro : integer;
begin
   DM.CriarConsulta(qyMaxRegistro);
   qyMaxRegistro.SQL.Text := SQL_GET_MAX_REGISTRO;
   qyMaxRegistro.Open;
   registro := qyMaxRegistro.FieldByName('registro').AsInteger;

   DM.CriarConsulta(qyInsereNrRegistroEvento);
   qyInsereNrRegistroEvento.SQL.Text := SQL_SET_NR_REGISTRO_EVENTO;
   qyInsereNrRegistroEvento.ParamByName('nr_registro').AsInteger := registro;
   qyInsereNrRegistroEvento.ParamByName('cd_evento').AsInteger := evento;
   qyInsereNrRegistroEvento.ExecSQL;
end;

procedure TfCertificadosEventos.dsDadosDataChange(Sender: TObject;
  Field: TField);
begin

end;

//procedure TfCertificados.desenhaItem(Control: TWinControl; Index: integer;
//  Rect: TRect; State: TOwnerDrawState);
//begin
//   Self.cbEvento.Canvas.TextOut(Rect.Left + 2, Rect.Top, Self.cbEvento.Items.Values[Self.cbEvento.Items.Names[Index]]);
//end;

procedure TfCertificadosEventos.fechaFormulario(Sender: TObject;
  var Action: TCloseAction);
var
   i: integer;
begin
   for i := 0 to Self.cbLivro.Items.Count - 1 do
      TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[i]).Free;
   for i := 0 to Self.cbEvento.Items.Count - 1 do
      TUMEvento(Self.cbEvento.Items.Objects[i]).Free;
   Action := caFree;
end;

procedure TfCertificadosEventos.filtra;
begin
   Self.qyDados.Close;
   qryGetParcial.Close;
   qryGetParcial.ParamByName('CD_EVENTO').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
   qryGetParcial.Open;
   if Trim(Self.ledPessoa.Text) = '' then
   begin
      if(qryGetParcial.FieldByName('SN_CERTIFICAR_PARCIAL').AsInteger = 1 )then
      begin
         Self.qyDados.SQL.Text := SQL_GET_CERTIFICADOS_EVENTO_PARCIAL;
         Self.qyDados.ParamByName('cd_evento').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
         Self.qyDados.Open;
      end
      else
      begin
         Self.qyDados.SQL.Text := SQL_GET_CERTIFICADOS_EVENTO;
         Self.qyDados.ParamByName('cd_evento').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
         Self.qyDados.Open;
      end;
   end
   else
   begin
      if(qryGetParcial.FieldByName('SN_CERTIFICAR_PARCIAL').AsInteger = 1) then
      begin
         Self.qyDados.SQL.Text := SQL_GET_CERTIFICADOS_EVENTO_PESSOA_PARCIAL;
         Self.qyDados.ParamByName('cd_evento').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
         Self.qyDados.ParamByName('cd_pessoa').AsString := Self.ledPessoa.Text;
         Self.qyDados.Open;

      end
      else
      begin
         Self.qyDados.SQL.Text := SQL_GET_CERTIFICADOS_EVENTO_PESSOA;
         Self.qyDados.ParamByName('cd_evento').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
         Self.qyDados.ParamByName('cd_pessoa').AsString := Self.ledPessoa.Text;
         Self.qyDados.Open;
      end;

   end;
   Self.cbLivro.Enabled := not Self.qyDados.IsEmpty;
//   Self.ledPagina.Enabled := not Self.qyDados.IsEmpty;
//   Self.bnRegistrar.Enabled := not Self.qyDados.IsEmpty;
   Self.sbStatus.Panels[1].Text := IntToStr(Self.qyDados.RecordCount) + ' registros encontrados';
end;

procedure TfCertificadosEventos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F12 : if btnSair.Enabled then sair( nil );
   end;
end;

procedure TfCertificadosEventos.getDadosMatricula(const AICodPessoa: integer);
begin
   Self.qyMatriculaAluno.Close();
   Self.qyMatriculaAluno.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
   Self.qyMatriculaAluno.Open;
end;

procedure TfCertificadosEventos.gravarLog(const AICodPessoa, AIAnoSem, AIEtapa, AICodAtividade,
AIHoras : integer;const ASCodCurso, ASAtividade, ASLocal: string;
const ADtInicio, ADtTermino: TDateTime);
  var
   ds_log, operacao, ds_chave : String;

begin
   operacao := 'Inclusão';
   ds_chave := 'InclusaoAtividadesComplemetaresViaEventos';

   ds_log := ''
   + ' cd_pessoa: ' + IntToStr(AICodPessoa) 
   + ', nr_etapa: ' + IntToStr(AIEtapa)
   + ', cd_ge_atividade: ' + IntToStr(AICodAtividade)
   + ', ds_atividade: ' +  ASAtividade
   + ', nr_horas_original: ' + IntToStr(AIHoras)
   + ', ds_local: '  +  ASLocal
   + ', dt_inicio: ' + DateToStr(ADtInicio)
   + ', dt_termino: ' + DateToStr(ADtTermino)
   + ', nr_horas: ' + IntToStr(AIHoras)
   + ', cd_curso: ' + ASCodCurso
   + ', nr_anosem: ' + IntToStr(AIAnoSem)
   + ', ds_usuario_cadastrou_origem: '
   + IntTostr(DM.GetUsuarioLogado.Pessoa.Codigo)
   + ', ds_origem_cad: Eventos';

   DM.SetLog(
      1053,
      operacao,
      ds_chave,
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo,
      ds_log
   );
end;

procedure TfCertificadosEventos.informaPagina(Sender: TObject; var Key: Char);
begin
   if (Trim(Self.ledPagina.Text) <> '') and (Key = #13) then
      Self.registra(nil)
   else if not (Key in[#48..#57, #8]) then
      Key := #0;
end;

procedure TfCertificadosEventos.informaPessoa(Sender: TObject; var Key: Char);
begin
   if (Trim(Self.ledPagina.Text) <> '') and (Key = #13) then
      Self.filtra
   else if not (Key in[#48..#57, #8]) then
   begin
      Key := #0;
      Self.filtra;
   end;


end;

function TfCertificadosEventos.isAtividadeRegistrada(
  const AICodInscricao: Integer): boolean;
const
  SQL_GET_INSCRICAO_GEATIVIDADE_ALUNO =
    'SELECT COUNT(*) as conta FROM tam_inscricao_ge_alunos WHERE cd_inscricao = :cd_inscricao';
var
   qyTesteAtividade: TUMZQuery;
begin
   DM.CriarConsulta(qyTesteAtividade);

   Result := False;
   qyTesteAtividade.Close;
   qyTesteAtividade.SQL.Text := SQL_GET_INSCRICAO_GEATIVIDADE_ALUNO;
   qyTesteAtividade.ParamByName('cd_inscricao').AsInteger := AICodInscricao;

   qyTesteAtividade.Open;
   if(qyTesteAtividade.FieldByName('conta').AsInteger = 0) then
    Result := false
   else
    Result := true;
end;

function TfCertificadosEventos.is_aluno(cd_pessoa: integer): Boolean;
begin
   qryIsAluno.Close();

   qryIsAluno.ParamByName('cd_pessoa').AsInteger := cd_pessoa;

   qryIsAluno.Open();

   result := false;

   if ( qryIsAluno.FieldByName('is_aluno').AsInteger > 0 ) then
   begin
      result := true;   
   end;
end;

procedure TfCertificadosEventos.mostraFormulario(Sender: TObject);
begin
   Self.carregaEventos;
   Self.carregaLivros;
end;

procedure TfCertificadosEventos.registra(Sender: TObject);
const
   SQL_GET_INSCRICAO =
      'SELECT CD_INSCRICAO FROM tam_inscricoes WHERE CD_EVENTO = :cd_evento AND CD_PESSOA = :cd_pessoa';
var
   bSucesso, sn_aluno: boolean;
   qyBuscaInscricao: TUMZQuery;
begin
   bSucesso := True;
   Self.qyDados.First;
   try
   
      with TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]) do
      begin
         if Cheio then
         begin
            Mensagem(MSG_LIVRO_CHEIO, Application.Title, MB_ICONERROR);
         end
         else
         begin
            Self.sbStatus.Panels[2].Text := 'Registrando ...';
            Self.pbProgresso.Min := 0;
            Self.pbProgresso.Max := Self.qyDados.RecordCount;
            defineNrRegistroEvento(Self.qyDados.FieldByName('CD_EVENTO').AsInteger);
            while not Self.qyDados.Eof do
            begin
               Self.pbProgresso.Position := Self.qyDados.RecNo;

               if ( qyDados.FieldByName('is_registrar').AsInteger = 1 ) then
               begin
                  try
                     registraCertificadoEvento(
                        qyDados.FieldByName('CD_EVENTO').AsInteger,
                        qyDados.FieldByName('CD_PESSOA').AsInteger
                     );

                     with TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]) do
                     begin
                        if CodAtividade > 0 then
                        begin
                           Self.getDadosMatricula(Self.qyDados.FieldByName('CD_PESSOA').AsInteger);

                           // Busca a inscricao da pessoa
                           DM.CriarConsulta(qyBuscaInscricao);
                           qyBuscaInscricao.Close();
                           qyBuscaInscricao.SQL.Clear();
                           qyBuscaInscricao.SQL.Text:= SQL_GET_INSCRICAO;

                           qyBuscaInscricao.ParamByName('cd_evento').AsInteger := qyDados.FieldByName('CD_EVENTO').AsInteger;
                           qyBuscaInscricao.ParamByName('cd_pessoa').AsInteger := qyDados.FieldByName('CD_PESSOA').AsInteger;
                           qyBuscaInscricao.Open();

                           {
                              Verifica se é aluno e se pode registrar
                           }
                           sn_aluno := is_aluno( Self.qyDados.FieldByName('CD_PESSOA').AsInteger );

                           if ( sn_aluno ) then
                           begin
                              Self.registraAtividade(
                                 Self.qyDados.FieldByName('CD_PESSOA').AsInteger,
                                 Self.qyMatriculaAluno.FieldByName('anosemestre').AsInteger,
                                 Self.qyMatriculaAluno.FieldByName('serie').AsInteger,
                                 CodAtividade,
                                 Self.qyDados.FieldByName('nr_horas_evento').AsInteger,
                                 qyBuscaInscricao.FieldByName('CD_INSCRICAO').AsInteger,
                                 Self.qyMatriculaAluno.FieldByName('curso').AsString,
                                 DescricaoEvento,
                                 Local,
                                 DataEvento,
                                 DataFim
                              );
                           end;

                        end;
                     end;
                  except
                     on E: Exception do
                     begin
                        bSucesso := False;
                        Mensagem(E.Message, Application.Title, MB_ICONERROR);
                        Break;
                     end;
                  end;
               end;
               Self.qyDados.Next;
            end;
            atualizaPagina;
            if bSucesso then
            begin
               Mensagem(MSG_SUCESSO, Application.Title, MB_ICONINFORMATION);
            end;
         end;
      end;
   finally
      Self.sbStatus.Panels[2].Text := '';
      Self.filtra;
      Self.pbProgresso.Position := 0;
      Self.ledPagina.Text := IntToStr(TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]).PaginaAtual);
   end;
end;


function TfCertificadosEventos.registraAtividade(const AICodPessoa, AIAnoSem, AIEtapa,
  AICodAtividade, AIHoras, AICodInscricao: integer; const ASCodCurso, ASAtividade,
  ASLocal: string; const ADtInicio, ADtTermino: TDateTime): boolean;
const
    SQL_SET_INSCRICAO_ALUNO =
    'INSERT INTO tam_inscricao_ge_alunos(cd_ge_aluno, cd_inscricao) VALUES (:aluno, :inscricao)';
var
    qyInsereGeAtividadeInscricao: TUMZQuery;
    nr_horas : double;
begin

   // Inicialização da Query
   DM.CriarConsulta(qyInsereGeAtividadeInscricao);
   qyInsereGeAtividadeInscricao.Close();
   qyInsereGeAtividadeInscricao.SQL.Clear();
   qyInsereGeAtividadeInscricao.ParamCheck:= true;

   nr_horas := 0;
   if( Self.verificaSeAindaTemHorasLivres(AICodPessoa,AIAnoSem,AICodAtividade) )then
   begin
      if not Self.isAtividadeRegistrada(AICodInscricao) then
      begin
        Result := True;


        // Valida as horas deferidas( MESMA VALIDAÇÃO DA TELA DE GRADES EXTRAS )
        nr_horas := verificaHorasDefiridas(
             AIHoras,
             AICodAtividade,
             AICodPessoa,
             AIAnoSem,
             ASCodCurso
        );

        Self.qyInsereAtividade.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
        Self.qyInsereAtividade.ParamByName('nr_anosem').AsInteger := AIAnoSem;
        Self.qyInsereAtividade.ParamByName('nr_etapa').AsInteger := AIEtapa;
        Self.qyInsereAtividade.ParamByName('cd_ge_atividade').AsInteger := AICodAtividade;
        Self.qyInsereAtividade.ParamByName('nr_horas').AsFloat := nr_horas;
        Self.qyInsereAtividade.ParamByName('cd_curso').AsString := ASCodCurso;
        Self.qyInsereAtividade.ParamByName('ds_atividade').AsString := ASAtividade;
        Self.qyInsereAtividade.ParamByName('ds_local').AsString := ASLocal;
        Self.qyInsereAtividade.ParamByName('dt_inicio').AsDateTime := ADtInicio;
        Self.qyInsereAtividade.ParamByName('dt_termino').AsDateTime := ADtTermino;
        Self.qyInsereAtividade.ParamByName('cd_situacao').AsInteger := 1;
        Self.qyInsereAtividade.ParamByName('nr_horas_original').AsInteger := AIHoras;
        Self.qyInsereAtividade.ParamByName('ds_origem_cad').AsString := 'Eventos';
        Self.qyInsereAtividade.ParamByName('ds_usuario_cadastrou_origem').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
        try
           Self.qyInsereAtividade.ExecSQL;

           // Vincula inscrição a atividade complementar
           qyInsereGeAtividadeInscricao.SQL.Text := SQL_SET_INSCRICAO_ALUNO;
           qyInsereGeAtividadeInscricao.ParamByName('aluno').AsInteger := DM.LastInsert;
           qyInsereGeAtividadeInscricao.ParamByName('inscricao').AsInteger := AICodInscricao;
           qyInsereGeAtividadeInscricao.ExecSQL();

           gravarLog(
               AICodPessoa,
               AIAnoSem,
               AIEtapa,
               AICodAtividade,
               AIHoras,
               ASCodCurso,
               ASAtividade,
               ASLocal,
               ADtInicio,
               ADtTermino
           );
        except
           on E: Exception do
           begin
              Result := false;
              Mensagem(E.Message, Application.Title, MB_ICONERROR);
           end;
        end;
      end;
   end
   else
   begin
      Result:=true;
   end;

end;

function TfCertificadosEventos.verificaHorasDefiridas(
  nr_horas_atuais : Double; cd_ge_atividade_atual, cd_pessoa_atual, nr_anosemestre : Integer; cd_curso_atual : String
): Double;
var
   nrHorasPorAtividade, nrHorasPorCurso, nrHorasNaAtividade, nrHorasPorGrade, nrHoras : Double;
   nrHorasRequisitadasOriginais, nrHorasRequisitadas : Double;
   nrHorasDeferidasAtividade, nrHorasDeferidasCurso : Double;
   qyHorasAtividadeDeferidas : TUMZQuery;
   aviso : Boolean;
   mensagemHoras : String;
begin
   nrHorasPorAtividade := -1;
   nrHorasPorCurso := -1;
   nrHorasNaAtividade := -1;

   nrHorasRequisitadas :=  nr_horas_atuais;

   qryGe_atividade.Close;
   qryGe_atividade.ParamByName('cd_ge_atividade').AsFloat := cd_ge_atividade_atual;
   qryGe_atividade.Open;

   if not qryGe_atividade.Eof then
   begin
      nrHorasPorAtividade := qryGe_atividade.FieldByName('nr_horas_atividade').AsFloat;
      nrHorasPorCurso     := qryGe_atividade.FieldByName('nr_horas_curso').AsFloat;
      nrHorasNaAtividade  := qryGe_atividade.FieldByName('nr_horas').AsFloat;
   end;

   // Retorna o total de horas restantes (desconsiderando a atividade que se está editando)
   qyHorasAtividadeDeferidas := getHorasDeferidaAluno(
      cd_pessoa_atual,
      cd_ge_atividade_atual,
      cd_curso_atual
   );

   nrHorasDeferidasAtividade := qyHorasAtividadeDeferidas.FieldByName('nr_horas_acumuladas_aluno').AsFloat;
   nrHorasDeferidasCurso := qyHorasAtividadeDeferidas.FieldByName('nr_horas_aluno_curso').AsFloat;
   qyHorasAtividadeDeferidas.Close;

      {1ª VALIDAÇÃO - Número de Horas por Atividade
      O Número de Horas por Atividade é o valor máximo permitido ser digitado na atividade selecionada,
      independente do valor total de horas acumuladas do aluno na atividade ou no curso, é o valor de horas
      do cadastro que está sendo realizado em questão.

      VERIFICAÇÃO: Se o número de horas digitado pelo usuário ultrapassa o valor de número de horas por atividade.}

   if ( nrHorasPorAtividade > 0 ) then
   begin
      //Se ultrapassou o limite de horas por atividade modifica as horas para as horas máximas.
      if ( nrHorasRequisitadas > nrHorasPorAtividade) then
      begin
         nrHorasRequisitadas := nrHorasPorAtividade;
      end;
   end;

   {2ª VALIDAÇÃO - Número de Horas por Curso
      O Número de Horas por Curso é o valor máximo permitido de horas deferidas o aluno nesse tipo de atividade
      independente do anosemestre mas levando em consideração o curso selecionado.

      VERIFICAÇÃO: Se o número de horas acumuladas do aluno nessa atividade, ultrapassa o valor de número de horas por curso.
      Caso o exista algum registro na tabela ge_cursos de horas para a grade do aluno  e esta deva ser validado iremos usar este}

   nrHorasPorGrade := self.verificaHorasPorGrade(
          cd_curso_atual,
          cd_ge_atividade_atual,
          cd_pessoa_atual,
          nr_anosemestre
   );

   if(nrHorasPorGrade = -1) then
   begin
      nrHoras := nrHorasPorCurso;
   end else begin
      nrHoras := nrHorasPorGrade;
   end;

   // Verifica se existe limitação de quantidade de horas por curso
   if ( nrHoras > 0 ) then
   begin

      if (nrHorasDeferidasCurso + nrHorasRequisitadas) > nrHoras then
      begin
         nrHorasRequisitadas := nrHoras - nrHorasDeferidasCurso;
      end;

   end;

   {3ª VALIDAÇÃO - Número de Horas da Atividade
      O Número de Horas da Atividade é o valor máximo permitido de horas deferidas o aluno nesse tipo de atividade
      independente do anosemestre ou curso, apenas levando em consideração o total de horas acumuladas pelo aluno nessa atividade.

      VERIFICAÇÃO: Se o número de horas acumuladas do aluno nessa atividade, ultrapassa o valor de número de horas da atividade.}

   // Verifica se existe limitação de quantidade de horas na atividade
   if ( nrHorasNaAtividade > 0 ) then
   begin

      if (nrHorasDeferidasAtividade + nrHorasRequisitadas) > nrHorasNaAtividade then
      begin
         nrHorasRequisitadas := nrHorasNaAtividade - nrHorasDeferidasAtividade;
      end;
   end;
    result := nrHorasRequisitadas;
end;

function TfCertificadosEventos.verificaHorasPorGrade( cd_curso : String; cd_pessoa, cd_ge_atividade, nr_anosemestre : Integer ) : Double;
const
   sql_busca_horas_grade =
   'SELECT '+
   '   max(gc.nr_horas) as maxHoras '+
   '   FROM matriculas_curso mc   '+
   '   INNER JOIN ge_cursos gc ON ( '+
   '      mc.cd_curso = gc.cd_curso AND '+
   '      mc.cd_grade = gc.cd_grade '+
   '   ) WHERE                        '+
   '   gc.sn_validar_horas_grade = 1 AND '+
   '   mc.cd_curso = :curso AND           '+
   '   mc.cd_pessoa = :pessoa AND         '+
   '   gc.cd_ge_atividade = :cd_atividade AND '+
   '   gc.nr_anosem = :anosemestre ';
var
   qyBuscaHorasGrade : TUMZQuery;
begin
   dm.CriarConsulta(qyBuscaHorasGrade);
   qyBuscaHorasGrade.SQL.Text := sql_busca_horas_grade;

   With qyBuscaHorasGrade do
   begin
      ParamByName('curso').AsString := cd_curso;
      ParamByName('pessoa').AsInteger := cd_pessoa;
      ParamByName('cd_atividade').AsInteger := cd_ge_atividade;
      ParamByName('anosemestre').AsInteger := nr_anosemestre;

      Open;

      if(FieldByName('maxHoras').IsNull) then
      begin
         result := -1;
      end else begin
         result := FieldByName('maxHoras').AsInteger;
      end;
   end;

   FreeAndNil(qyBuscaHorasGrade);
end;

function TfCertificadosEventos.getHorasDeferidaAluno(
   cd_pessoa_atual, cd_ge_atividade_atual  : Integer; cd_curso_atual : String
) : TUMZQuery;
begin
   // Pega as horas deferidas da atividade do aluno
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Text := ''
      + ' SELECT '
      + '  COALESCE(SUM(CASE WHEN al.cd_ge_aluno <> :cd_ge_aluno THEN al.nr_horas ELSE 0 END), "0") AS nr_horas_acumuladas_aluno, '
      + '  COALESCE(SUM(CASE WHEN al.cd_ge_aluno <> :cd_ge_aluno AND al.cd_curso = :cd_curso THEN al.nr_horas ELSE 0 END), "0") AS nr_horas_aluno_curso '
      + ' FROM '
      + '  ge_atividades ga '
      + '  LEFT JOIN ge_alunos al ON ( '
      + '     al.cd_ge_atividade = ga.cd_ge_atividade AND '
      + '     al.cd_situacao = 1 AND '
      + '     al.cd_pessoa = :cd_pessoa '
      + '  ) '
      + ' WHERE '
      + '    ga.cd_ge_atividade = :cd_atividade '
      + ' GROUP BY '
      + '    ga.cd_ge_atividade';

   DM.qyAux.ParamByName('cd_atividade').AsInteger := cd_ge_atividade_atual;
   DM.qyAux.ParamByName('cd_pessoa').AsInteger    := cd_pessoa_atual;
   DM.qyAux.ParamByName('cd_ge_aluno').AsInteger   := 0;
   DM.qyAux.ParamByName('cd_curso').AsString      := cd_curso_atual;

   DM.qyAux.Open;

   Result := DM.qyAux;
end;

function TfCertificadosEventos.verificaSeAindaTemHorasLivres(const AICodigoPessoa,
  AIAnoSem, AICodigoAtivide : Integer): boolean;
begin
   DM.CriarConsulta(FQyHorasDeferidasAluno);
   try
      with Self.FQyHorasDeferidasAluno do
      begin
         SQL.Text := SQL_GET_HORAS_DEFERIDAS_MYSQL;
         SQLList.Values['mysql-5'] := SQL_GET_HORAS_DEFERIDAS_MYSQL;
         SQLList.Values['oracle'] := SQL_GET_HORAS_DEFERIDAS_ORACLE;
         ParamCheck := true;
         ParamByName('cd_pessoa').asInteger := AICodigoPessoa;
         ParamByName('nr_anosemestre').asInteger := AIAnoSem;
         ParamByName('cd_ge_atividade').asInteger := AICodigoAtivide;
         try
            Open();
         except
            on E: Exception do
            begin
               Result:=false;
               raise EUMTAMCertificadoErro.Create(StringReplace(MSG_ERRO_HORAS_DEFERIDAS, '$erro$', E.Message, []));
            end;
         end;

         if not EOF then
         begin
            if( FieldByName('total').AsInteger <= FieldByName('limite').AsInteger) then
            begin
                Result := true;
                exit;
            end;
         end;

      end;
   finally
         FreeAndNil(Self.FQyHorasDeferidasAluno);
   end;
   
   Result :=false;
end;

procedure TfCertificadosEventos.sair(Sender: TObject);
begin
   Self.Close;
end;

procedure TfCertificadosEventos.selecionaEvento(Sender: TObject);
begin
   Self.ledPessoa.Enabled := True;
   Self.bnPessoa.Enabled := True;
   Self.filtra;
end;

procedure TfCertificadosEventos.selecionaLivro(Sender: TObject);
begin
   Self.ledPagina.Enabled := True;
   Self.bnRegistrar.Enabled := True;
   Self.ledPagina.Text :=
      IntToStr(TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]).PaginaAtual);
   Self.sbStatus.Panels[0].Text := 'Livro ' + TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]).Nome;
end;

procedure TfCertificadosEventos.selecionaPessoa(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      Self.ledPessoa.Text := IntToStr(resultado_filtro.cd_pessoa);
   end;
   Self.filtra;
end;


end.

