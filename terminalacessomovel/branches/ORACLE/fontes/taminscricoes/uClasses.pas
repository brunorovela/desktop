unit uClasses;

interface

uses
   Classes, ZConnection, ZDataSet, DB, ZAbstractDataset, UZDataset,
   Variants, SysUtils, ZAbstractRODataset;

type
   { Todas as situações financeiras.
   }
   TUMTAMSituacoesFinanceiras = (sfOK, sfParcial, sfPendente, sfNegociada,
      sfIsentada, sfCancelada, sfDesconto, sfBanco = 8, sfProtesto, sfReservada);

   { Possíveis resultados ao tentar efetuar a inscrição de um aluno no evento:
     riErroBanco: ocorreu um erro no banco de dados ao tentar executar a inscrição
     riSucesso: a inscrição do aluno efetuada com sucesso
     riSemTurma: o aluno não está cursando disciplina/turma/curso válidos para este evento
     riInvalido: esta pessoa não foi encontrada no sistema UNIMESTRE
     riInscrito: este aluno já havia sido previamente inscrito no evento
     riSemVagas: não há mais vagas para este evento
     riFinPendencia: indica que o aluno possui pendências financeiras e não pode ser inscrito
   }
   TUMTAMRetInscricao = (riErroBanco, riSucesso, riSemTurma, riInvalido, riInscrito, riSemVagas, riFinPendencia);

   { Possíveis condições periódicas ao consultar se o evento está no período de inscrições:
     rpAntecipado: as inscrições para o evento ainda não iniciaram
     rpInscricoes: está no período de inscrições
     rpAtrasado: as inscrições para o evento já encerraram 
   }
   TUMTAMRetPeriodo = (rpAntecipado, rpInscricoes, rpAtrasado);

   { Informações do nosso número (prefixo, ultimo e tamanho)
   }
   TUMTAMFinNossoNumero = (nnPrefixo, nnUltimo, nnTamanho);

   { Array contendo as informações necessárias para montar o nosso número.
     O array é composto pelo:
     prefixo: índice nnPrefixo
     último: índice nnUltimo
     tamanho: índice nnTamanho
   }
   TUMTAMRetNossoNumero = array[TUMTAMFinNossoNumero] of string;

   { Possíveis retornos na tentativa de de gerar a mensalidade para o aluno:
     rmErrAtuCod: erro ao tentar atualizar o código da mensalidade
     rmErrMov: erro ao tentar gerar ação de movimento
     rmSucesso: mensalidade gerada com sucesso
     rmErroBanco: erro no banco de dados
   }
   TUMTAMRetMensalidade = (rmErrAtuCod, rmErrMov, rmSucesso, rmErrBanco);

   TUMTAMEvento = class;

   { Esta classe é responsável por gerenciar a geração de mensalidades para o
     evento, bem como montar o nosso número, atualizar o código da mensalidade
     e gerar ação de movimento.
   }
   TUMTAMFinanceiro = class(TObject)
   strict private
      FVCentroCusto: OleVariant;
      FVTipoTitulo: OleVariant;
      FVPlanoConta: OleVariant;
      FVValorInsc: OleVariant;
      FVDtVencto: OleVariant;
      FVParcela: OleVariant;
      FBBBoleto: boolean;
      FUMTAMEvento: TUMTAMEvento;
      function getNossoNumeroFromDepartamento(const AIDepartamento: integer; var AUMTAMRetNossoNumero: TUMTAMRetNossoNumero): boolean;
      function getNossoNumeroFromTurma(const AIAnoSemestre: integer; const ASTurma: string; var AUMTAMRetNossoNumero: TUMTAMRetNossoNumero): boolean;
      function getNossoNumeroPadrao: TUMTAMRetNossoNumero;
      function getNossoNumero(const ASPrefixoNN, ASCodPessoa: string): string; overload;
      function getNossoNumero(const AIDepartamento, AIAnoSemestre: integer; const ASTurma, ASCodPessoa: string; AITentativas: integer): string; overload;
      function procuraNossoNumero(const ASNossoNumero: string): boolean;
      function getContaBoleto(const AIDepartamento, AIAnoSemestre: integer; const ASTurma: string): integer;
      function getBoletoAsStr: string;
      function getDataVencimento: TDateTime;
      function getDataCompetencia: TDateTime;
      function getParcela: integer;
      function getTipoTitulo: integer;
      function getPlanoConta: integer;
      function getCentroCusto(const ASTurma: string; const AIAnoSemestre: integer): integer;
      function getAcaoAutomatica: integer;
      function getMensalidade(const ASNossoNumero, ASTurma, ASCodPessoa: string; const AIAnoSemestre, AIParcela: integer; var ADVlEntrada: Double): integer;
      function atualizaMensalidade(const ASNossoNumero, ASTurma, ASCodPessoa: string; const AIAnoSemestre, AIParcela: integer): TUMTAMRetMensalidade;
      function geraMovimentacao(const AICodMensalidade: Integer; const AICodAcao: Integer; const ADVlEntrada: Double): boolean;
   private
      constructor Create(AUMTAMEvento: TUMTAMEvento; const AVTipoTitulo, AVValorInsc,AVDtVencto, AVParcela: OleVariant; const ABBoleto: boolean);
      destructor Destroy; override;
      function geraMensalidade(const ASCodPessoa, ASTurma, ASCurso: string; const AIAnoSemestre, AIDepartamento: integer): TUMTAMRetMensalidade;
   end;
   
   { Esta classe armazena as informações relacionadas a uma inscrição para o
     evento, idependente da inscrição ter sido realizada ou não.
     Possui método que permite efetuar a inscrição e gerar parcela de
     mensalidade para cobrança de taxa de inscrição para o evento.
   }
   TUMTAMInscricao = class(TObject)
   strict private
      FSTurma: string;
      FSCurso: string;
      FSCodPessoa: string;
      FSNomePessoa: string;
      FIAnoSemestre: integer;
      FIDepartamento: integer;
      FICodMensalidade: integer;
      FBJaInscrito: boolean;
      FBPossuiTurma: boolean;
      FBPessoaExiste: boolean;
      FUMTAMEvento: TUMTAMEvento;
      FUMTAMFinanceiro: TUMTAMFinanceiro;
      procedure carregaDados;
      procedure carregaMatricula;
      procedure carregaAnoSemestre;
      procedure procuraTurma;
      procedure procuraPessoa;
      procedure procuraInscricao;
      function getComprovante: string;
      function isInadimplente: boolean;
      procedure atualizaMensalidade(const AICodMensalidade: integer);
   private
      constructor Create(const ASCodPessoa: string; AUMTAMEvento: TUMTAMEvento);
      destructor Destroy; override;
   public
      function inscreve: TUMTAMRetInscricao;
      function geraMensalidade: TUMTAMRetMensalidade;
      property NomePessoa: string read FSNomePessoa;
      property Comprovante: string read getComprovante;
      property Mensalidade: integer write atualizaMensalidade;
   end;

   { Esta classe armazena as informações referentes ao cadastro do evento, como
     informações referentes a geração de parcelas de mensalidade e perído de
     inscrições no evento.
     Disponibiliza propriedades que permitem manipular inscrições e verificar
     a quantidade de vagas disponíveis para o evento.
   }
   TUMTAMEvento = class(TObject)
   strict private
      FZConn: TZConnection;
      FICodigo: integer;
      FSEvento: string;
      FSSenhaMD5: string;
      FVChecarFin: OleVariant;
      FVDtIniInsc: OleVariant;
      FVDtFimInsc: OleVariant;
      FSlParametros: TStringList;
      FSlInscricoes: TStringList;
      FUMTAMFinanceiro: TUMTAMFinanceiro;
      procedure carregaDados;
      procedure carregaParametros;
      function isChecarFinanceiro: boolean;
      function getDataInicioInscricoes: TDateTime;
      function getDataFimInscricoes: TDateTime;
      function getDataHoraAtual: TDateTime;
      function getPeriodo: TUMTAMRetPeriodo;
      function temVagas: boolean;
      function getParametro(const ASParam: string): string;
      function getInscricao(const ASCodPessoa: string): TUMTAMInscricao;
   private
      property Conn: TZConnection read FZConn;
      property Financeiro: TUMTAMFinanceiro read FUMTAMFinanceiro;
      property DataAtual: TDateTime read getDataHoraAtual;
      property ChecarFinanceiro: boolean read isChecarFinanceiro;
   public
      constructor Create(const AICodigo: integer; AZConn: TZConnection);
      destructor Destroy; override;
      property Codigo: integer read FICodigo;
      property HaVagas: boolean read temVagas;
      property SenhaMD5: string read FSSenhaMD5;
      property Descricao: string read FSEvento;
      property DataIniInsc: OleVariant read FVDtIniInsc;
      property DataFimInsc: OleVariant read FVDtFimInsc;
      property Parametros[const Param: string]: string read getParametro;
      property Inscricoes[const CodPessoa: string]: TUMTAMInscricao read getInscricao;
      property Periodo: TUMTAMRetPeriodo read getPeriodo;
      class function getInscricaoBase(const iCodigoPessoa:Integer;const iCodigoEvento:Integer;const con:TZConnection):Integer;
      class procedure inscreveEmTodasAsAtividades(const con:TZConnection;const iCodigoInscricao:Integer);
   end;

implementation

{ TUMTAMInscricao }

{ Atualiza o código da mensalidade na inscrição do aluno. }
procedure TUMTAMInscricao.atualizaMensalidade(const AICodMensalidade: integer);
const
   SQL_ATU_MENS =
   'UPDATE tam_inscricoes '+
   'SET CD_MENSALIDADE = :cd_mensalidade '+
   'WHERE CD_PESSOA = :cd_pessoa AND CD_EVENTO = :cd_evento';
var
   qyAtuMens: TUMZQuery;
begin
   qyAtuMens := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyAtuMens.Connection := Self.FUMTAMEvento.Conn;
      qyAtuMens.ParamCheck := True;
      qyAtuMens.SQL.Text := SQL_ATU_MENS;
      qyAtuMens.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyAtuMens.ParamByName('cd_evento').AsInteger := Self.FUMTAMEvento.Codigo;
      qyAtuMens.ParamByName('cd_mensalidade').AsInteger := AICodMensalidade;
      qyAtuMens.ExecSQL;
   finally
      qyAtuMens.Free;
   end;
end;

{ Busca na base de dados o útlimo ano/semestre no qual o aluno possui matricula.
  Esta informação é utilizada posteriormente para geração de parcelas de
  mensalidade e para buscar informações de turma, curso e departamento.
}
procedure TUMTAMInscricao.carregaAnoSemestre;
const
   SQL_ANOSEM =
      'SELECT anosemestre '+
      'FROM matriculas '+
      'WHERE codigoaluno = :cd_pessoa '+
      'GROUP BY anosemestre '+
      'ORDER BY anosemestre DESC';
var
   qyAnoSemestre: TUMZReadOnlyQuery;
begin
   qyAnoSemestre := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyAnoSemestre.Connection := Self.FUMTAMEvento.Conn;
      qyAnoSemestre.ParamCheck := True;
      qyAnoSemestre.SQL.Text := SQL_ANOSEM;
      qyAnoSemestre.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyAnoSemestre.Open;
      if not qyAnoSemestre.IsEmpty then
         Self.FIAnoSemestre := qyAnoSemestre.FieldByName('anosemestre').AsInteger;
   finally
      qyAnoSemestre.Close;
      qyAnoSemestre.Free;
   end;
end;

{ Carrega todas as informações do aluno que estão relacionadas à inscrição no
  evento.
}
procedure TUMTAMInscricao.carregaDados;
begin
   Self.procuraPessoa;
   if Self.FBPessoaExiste then // Verifica se é pessoa válida
   begin
      Self.procuraInscricao;
      if not Self.FBJaInscrito then // Verifica se já foi inscrito
      begin
         Self.procuraTurma; 
         if Self.FBPossuiTurma then // Verifica se possui turma válida
         begin
            Self.carregaAnoSemestre;
            Self.carregaMatricula;
         end;
      end;
   end;
end;

{ Acessa as matriculas do aluno no ano/semestre previamente definido no atributo
  FIAnoSemestre para carregar as informações de turma, curso e departamento.
  As informações são utilizadas posteriormente para a geração de parcelas
  de mensalidade para cobrança da inscrição no evento.
}
procedure TUMTAMInscricao.carregaMatricula;
const
   SQL_MATRICULA =
      'SELECT m.curso, m.turma, c.depto '+
      'FROM matriculas m JOIN cursos c ON(m.curso = c.codigo) '+
      'WHERE m.codigoaluno = :cd_pessoa AND m.anosemestre = :anosemestre';
var
   qyMatricula: TUMZReadOnlyQuery;
begin
   qyMatricula := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyMatricula.Connection := Self.FUMTAMEvento.Conn;
      qyMatricula.ParamCheck := True;
      qyMatricula.SQL.Text := SQL_MATRICULA;
      qyMatricula.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyMatricula.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyMatricula.Open;
      if not qyMatricula.IsEmpty then
      begin
         Self.FSTurma := qyMatricula.FieldByName('turma').AsString;
         Self.FSCurso := qyMatricula.FieldByName('curso').AsString;
         Self.FIDepartamento := qyMatricula.FieldByName('depto').AsInteger;
      end;
   finally
      qyMatricula.Close;
      qyMatricula.Free;
   end;
end;

{ Construtor }
constructor TUMTAMInscricao.Create(const ASCodPessoa: string;
  AUMTAMEvento: TUMTAMEvento);
begin
   inherited Create;
   Self.FSCodPessoa := ASCodPessoa;
   Self.FUMTAMEvento := AUMTAMEvento;
   Self.carregaDados;
end;

{ Destrutor }
destructor TUMTAMInscricao.Destroy;
begin
   inherited;
end;

{ Gera uma parcela de mensalidade para o aluno. }
function TUMTAMInscricao.geraMensalidade: TUMTAMRetMensalidade;
begin
   Result := Self.FUMTAMEvento.Financeiro.geraMensalidade(Self.FSCodPessoa, Self.FSTurma, Self.FSCurso, Self.FIAnoSemestre, Self.FIDepartamento);
end;

{ Busca as informações da inscrição do aluno no evento e substituí as variáveis
  no layout configurado no parâmetro.
}
function TUMTAMInscricao.getComprovante: string;
const
   SQL_DADOS =
   'SELECT '+
      'p.cd_pessoa, p.nm_pessoa, p.ds_identidade, p.ds_cpf, i.CD_MENSALIDADE,'+
      'i.DT_INSCRICAO, e.DS_EVENTO, e.ME_EVENTO, e.DT_EVENTO, MIN(tegv.vl_inscricao),'+
      'e.DT_VENCIMENTO '+
   'FROM '+
      '((pessoas p JOIN tam_inscricoes i USING(cd_pessoa))'+
         'JOIN tam_eventos e USING(cd_evento))'+
            'LEFT JOIN mensalidades USING(cd_mensalidade) '+
         'INNER JOIN nu_grupos_pessoas AS ngp ON (ngp.cd_pessoa = i.CD_PESSOA) '+
         'INNER JOIN tam_eventos_grupos_valores AS tegv ON (tegv.cd_evento = e.CD_EVENTO AND tegv.cd_grupo = ngp.cd_grupo) '+
   'WHERE '+
      'i.cd_pessoa = :cd_pessoa AND '+
      'i.cd_evento = :cd_evento';
var
   i: Byte;
   qyDados: TUMZReadOnlyQuery;
begin
   qyDados := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyDados.Connection := Self.FUMTAMEvento.Conn;
      qyDados.ParamCheck := True;
      qyDados.SQL.Text := SQL_DADOS;
      qyDados.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyDados.ParamByName('cd_evento').AsInteger := Self.FUMTAMEvento.Codigo;
      qyDados.Open;
      Result := Self.FUMTAMEvento.Parametros['impressao_layout'];
      for i := 0 to qyDados.FieldCount - 1 do
         Result := StringReplace(Result, '$' + qyDados.Fields[i].DisplayName + '$', qyDados.Fields[i].AsString, [rfReplaceAll, rfIgnoreCase]);
   finally
      qyDados.Close;
      qyDados.Free;
   end;
end;

{ Efetua a inscrição do aluno no evento e retorna um valor informando se a
  operação foi bem sucedida ou se ocorreu algum erro.
  No caso do erro retorna um valor para auxiliar na identificação do mesmo.
}
function TUMTAMInscricao.inscreve: TUMTAMRetInscricao;
const
   SQL_INSCRICAO =
   'INSERT INTO tam_inscricoes(CD_EVENTO, CD_PESSOA, NM_PESSOA, SN_INSCRICAO_EVENTO, DT_INSCRICAO,CD_GRUPO) '+
   'VALUES(:cd_evento, :cd_pessoa, :nm_pessoa, 1, Now(),2)';
var
   qyInscricao: TUMZQuery;
   iCodigoNovaInscricao :Integer;
begin
   if Self.FBPessoaExiste then // Verifica se a pessoa está cadastrada no UNIMESTRE
   begin
      if not Self.FBJaInscrito then // Verifica se o aluno já está inscrito no evento
      begin
         if Self.FUMTAMEvento.HaVagas then // Verifica se há vagas
         begin
            if Self.FBPossuiTurma then // Verifica se o aluno possui matrícula numa turma válida
            begin
               if Self.FUMTAMEvento.ChecarFinanceiro and Self.isInadimplente then
               begin
                  Result := riFinPendencia; // Possui pendência financeira
               end else
               begin
                  qyInscricao := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
                  try
                     qyInscricao.Connection := Self.FUMTAMEvento.Conn;
                     qyInscricao.ParamCheck := True;
                     qyInscricao.SQL.Text := SQL_INSCRICAO;
                     qyInscricao.ParamByName('cd_evento').AsInteger := Self.FUMTAMEvento.Codigo;
                     qyInscricao.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
                     qyInscricao.ParamByName('nm_pessoa').AsString := Self.FSNomePessoa;
                     try
                        qyInscricao.ExecSQL;
                        iCodigoNovaInscricao := TUMTAMEvento.getInscricaoBase(StrToInt(Self.FSCodPessoa),Self.FUMTAMEvento.Codigo,Self.FUMTAMEvento.Conn);
                        if(iCodigoNovaInscricao <> 0) then
                        begin
                           //inscrever em todas as atividades obrigatórias para a inscrição do evento
                           TUMTAMEvento.inscreveEmTodasAsAtividades(Self.FUMTAMEvento.Conn,iCodigoNovaInscricao);
                        end;
                     except
                        on E: EZDatabaseError do Result := riErroBanco;
                     end;
                     Result := riSucesso;
                     Self.FBJaInscrito := True;
                  finally
                     qyInscricao.Free;
                  end;
               end;
            end
            else Result := riSemTurma; // Não possui turma válida
         end
         else Result := riSemVagas; // Não há vagas
      end
      else Result := riInscrito; // Usuário já inscrito
   end
   else Result := riInvalido; // Usuário inexistente no UNIMESTRE
end;

{ Verifica se o aluno possui pendências financeiras. }
function TUMTAMInscricao.isInadimplente: boolean;
const
   SQL_MENS =
   'SELECT cd_mensalidade '+
   'FROM mensalidades '+
   'WHERE codigoaluno = :codigoaluno AND '+
         'situacao NOT IN(0, 1, 3, 4, 5, 6, 7) AND '+
         'datavencimento < NOW()';
var
   qyMens: TUMZReadOnlyQuery;
begin
   qyMens := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyMens.Connection := Self.FUMTAMEvento.Conn;
      qyMens.ParamCheck := True;
      qyMens.SQL.Text := SQL_MENS;
      qyMens.ParamByName('codigoaluno').AsString := Self.FSCodPessoa;
      qyMens.Open;
      Result := not qyMens.IsEmpty;
   finally
      qyMens.Close;
      qyMens.Free;
   end;
end;

{ Procura por uma inscrição prévia do aluno no evento. }
procedure TUMTAMInscricao.procuraInscricao;
const
   SQL_INSCRICAO =
   'SELECT CD_INSCRICAO '+
   'FROM tam_inscricoes JOIN tam_eventos e USING(CD_EVENTO) '+
   'WHERE CD_PESSOA = :cd_pessoa AND e.CD_EVENTO = :cd_evento';
var
   qyInscricao: TUMZReadOnlyQuery;
begin
   qyInscricao := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyInscricao.Connection := Self.FUMTAMEvento.Conn;
      qyInscricao.ParamCheck := True;
      qyInscricao.SQL.Text := SQL_INSCRICAO;
      qyInscricao.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyInscricao.ParamByName('cd_evento').AsInteger := Self.FUMTAMEvento.Codigo;
      qyInscricao.Open;
      Self.FBJaInscrito := not qyInscricao.IsEmpty;
   finally
      qyInscricao.Close;
      qyInscricao.Open;
   end;
end;

{ Procura no cadastro de pessoas do UNIMESTRE a pessoa informada pelo código. }
procedure TUMTAMInscricao.procuraPessoa;
const
   SQL_PESSOA = 'SELECT nm_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa';
var
   qyPessoa: TUMZReadOnlyQuery;
begin
   qyPessoa := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyPessoa.Connection := Self.FUMTAMEvento.Conn;
      qyPessoa.ParamCheck := True;
      qyPessoa.SQL.Text := SQL_PESSOA;
      qyPessoa.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyPessoa.Open;
      Self.FBPessoaExiste := not qyPessoa.IsEmpty;
      if Self.FBPessoaExiste then
         Self.FSNomePessoa := qyPessoa.FieldByName('nm_pessoa').AsString;
   finally
      qyPessoa.Close;
      qyPessoa.Free;
   end;
end;

{ Procura em todas as matrículas do aluno no ano/semestre mais recente no qual
  ele possui matrícula e verifica se alguma de suas matrículas é válida para
  participar do evento atual, verificando as ligações de disciplina, turma e
  curso.
}
procedure TUMTAMInscricao.procuraTurma;
const
   SQL_TURMA =
   'SELECT f.codigoaluno '+
   'FROM tam_eventos_turmas te JOIN fichaindividual f '+
      'ON(te.CD_TURMA = f.turma AND te.CD_DISCIPLINA = f.disciplina AND te.CD_CURSO = f.curso) '+
   'WHERE '+
      'f.situacao IN(0, 1, 2, 9, 12, 14) AND '+
      'f.anosemestre = (SELECT MAX(anosemestre) FROM fichaindividual WHERE codigoaluno = :cd_pessoa) '+
      'AND codigoaluno = :cd_pessoa '+
   'GROUP BY f.codigoaluno';
var
   qyTurmas: TUMZReadOnlyQuery;
begin
   qyTurmas := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyTurmas.Connection := Self.FUMTAMEvento.Conn;
      qyTurmas.ParamCheck := True;
      qyTurmas.SQL.Text := SQL_TURMA;
      qyTurmas.ParamByName('cd_pessoa').AsString := Self.FSCodPessoa;
      qyTurmas.Open;
      Self.FBPossuiTurma := not qyTurmas.IsEmpty;
   finally
      qyTurmas.Close;
      qyTurmas.Free;
   end;
end;

{ TUMTAMEvento }

{ Busca na base de dados todas as informações sobre o evento e armazena
  internamente. Inicializa também o objeto responsável pela geração das
  mensalidades.
}
procedure TUMTAMEvento.carregaDados;
const
   SQL_EVENTO =
   'SELECT '+
      'DS_EVENTO, VL_INSCRICAO, CD_TIPO_TITULO, DT_VENCIMENTO, SN_CHECAR_FIN_INSCRICAO,'+
      'DT_INICIO_INSCRICAO, DT_FIM_INSCRICAO, SN_BOLETO, DS_SENHA, NR_PARCELA '+
   'FROM tam_eventos '+
   'WHERE CD_EVENTO = :cd_evento';
var
   qyEvento: TUMZReadOnlyQuery;
begin
   qyEvento := TUMZReadOnlyQuery.Create(Self.Conn);
   try
      qyEvento.Connection := Self.Conn;
      qyEvento.ParamCheck := True;
      qyEvento.SQL.Text := SQL_EVENTO;
      qyEvento.ParamByName('cd_evento').AsInteger := Self.Codigo;
      qyEvento.Open;
      if not qyEvento.IsEmpty then
      begin
         Self.FVChecarFin := qyEvento.FieldByName('SN_CHECAR_FIN_INSCRICAO').AsVariant;
         Self.FVDtIniInsc := qyEvento.FieldByName('DT_INICIO_INSCRICAO').AsVariant;
         Self.FVDtFimInsc := qyEvento.FieldByName('DT_FIM_INSCRICAO').AsVariant;
         Self.FSSenhaMD5 := qyEvento.FieldByName('DS_SENHA').AsString;
         Self.FSEvento := qyEvento.FieldByName('DS_EVENTO').AsString;
         Self.FUMTAMFinanceiro :=
            TUMTAMFinanceiro.Create(Self,
               qyEvento.FieldByName('CD_TIPO_TITULO').AsVariant,
               qyEvento.FieldByName('VL_INSCRICAO').AsVariant,
               qyEvento.FieldByName('DT_VENCIMENTO').AsVariant,
               qyEvento.FieldByName('NR_PARCELA').AsVariant,
               qyEvento.FieldByName('SN_BOLETO').AsString = 'S');
      end;
   finally
      qyEvento.Close;
      qyEvento.Free;
   end;
end;

{ Carrega todos os parâmetros do módulo de eventos. }
procedure TUMTAMEvento.carregaParametros;
const
   SQL_PARAMS =
   'SELECT ds_parametro, ds_valor FROM nu_parametros p JOIN nu_modulos m USING(cd_modulo) WHERE m.ds_chave = "Eventos"';
var
   qyParams: TUMZReadOnlyQuery;
begin
   qyParams := TUMZReadOnlyQuery.Create(Self.FZConn);
   try
      qyParams.Connection := Self.Conn;
      qyParams.ParamCheck := False;
      qyParams.SQL.Text := SQL_PARAMS;
      qyParams.Open;
      while not qyParams.Eof do
      begin
         Self.FSlParametros.Values[qyParams.FieldByName('ds_parametro').AsString] :=
            qyParams.FieldByName('ds_valor').AsString;
         qyParams.Next;
      end;
   finally
      qyParams.Close;
      qyParams.Free;
   end;
end;

{ Construtor. }
constructor TUMTAMEvento.Create(const AICodigo: integer; AZConn: TZConnection);
begin
   inherited Create;
   Self.FICodigo := AICodigo;
   Self.FZConn := AZConn;
   Self.FSlParametros := TStringList.Create;
   Self.FSlInscricoes := TStringList.Create;
   Self.carregaDados;
end;

{ Destrutor. }
destructor TUMTAMEvento.Destroy;
var
   i: integer;
begin
   for i := 0 to Self.FSlInscricoes.Count - 1 do
   begin
      TUMTAMInscricao(Self.FSlInscricoes.Objects[i]).Free;
   end;
   Self.FSlInscricoes.Free;
   Self.FSlParametros.Free;
   Self.FUMTAMFinanceiro.Free;
   inherited;
end;

{ Retorna a data de início das inscrições no evento. }
function TUMTAMEvento.getDataFimInscricoes: TDateTime;
begin
   if Self.FVDtFimInsc = Null then Result := StrToDateTime('00/00/0000 00:00:00')
   else Result := Self.FVDtFimInsc;
end;

{ Pega a data e hora atuais na base de dados. }
function TUMTAMEvento.getDataHoraAtual: TDateTime;
const
   SQL_DATA_HORA = 'SELECT NOW() Agora';
var
   qyDataHora: TUMZReadOnlyQuery;
begin
   qyDataHora := TUMZReadOnlyQuery.Create(Self.Conn);
   try
      qyDataHora.Connection := Self.Conn;
      qyDataHora.ParamCheck := False;
      qyDataHora.SQL.Text := SQL_DATA_HORA;
      qyDataHora.Open;
      Result := qyDataHora.FieldByName('Agora').AsDateTime;
   finally
      qyDataHora.Close;
      qyDataHora.Free;
   end;
end;

{ Retorna a data de finalização das inscrições no evento. }
function TUMTAMEvento.getDataInicioInscricoes: TDateTime;
begin
   if Self.FVDtIniInsc = Null then Result := StrToDateTime('00/00/0000 00:00:00')
   else Result := Self.FVDtIniInsc;
end;

{ Procura pelo aluno informado no parâmetro o objeto de inscrição na lista de
  inscrições. Se não encontrar a inscrição então cria um novo objeto de inscrição.
  O resultado da função é o objeto de inscrição solicitado.
}
function TUMTAMEvento.getInscricao(const ASCodPessoa: string): TUMTAMInscricao;
var
   iIndex: integer;
begin
   Self.FSlInscricoes.Sort;
   if Self.FSlInscricoes.Find(ASCodPessoa, iIndex) then
   begin
      Result := TUMTAMInscricao(Self.FSlInscricoes.Objects[iIndex]);
   end
   else
   begin
      Result := TUMTAMInscricao.Create(ASCodPessoa, Self);
      Self.FSlInscricoes.AddObject(ASCodPessoa, Result);
   end;
end;

class function TUMTAMEvento.getInscricaoBase(
  const iCodigoPessoa: Integer;const iCodigoEvento:Integer;const con:TZConnection): Integer;
var
   qryInscricao: TUMZQuery;
begin

qryInscricao := TUMZQuery.Create(con);
   try
      with qryInscricao do
      begin

         Connection := con;
         ParamCheck := True;
         SQL.Text := 'SELECT * FROM TAM_INSCRICOES WHERE CD_EVENTO=:pCDEvento AND CD_PESSOA=:pCDPessoa';
         ParamByName('pCDEvento').AsInteger := iCodigoEvento;
         ParamByName('pCDPessoa').AsInteger := iCodigoPessoa;
         try
            Open;
         except
            on E: EZDatabaseError do
            begin
               Result := 0;
               qryInscricao.Free;
               exit;
            end;
         end;
         Result := FieldByName('CD_INSCRICAO').asInteger;
      end;
   finally
      qryInscricao.Free;
   end;
end;

{ Retorna o valor do parâmetro solicitado. }
function TUMTAMEvento.getParametro(const ASParam: string): string;
begin
   Result := Self.FSlParametros.Values[ASParam];
end;

{ Compara a data e hora atuais com as datas de início e fim de inscrições para o
  evento para verificar se está dentro de período de inscrições para o evento.
  Se estiver dentro do período estabelecido, então retorna rpInscricoes.
  Se o período de inscrições não iniciou, então retorna rpAntecipado.
  Se o período de inscrições já foi finalizado, então retorna rpAtrasado.
}
function TUMTAMEvento.getPeriodo: TUMTAMRetPeriodo;
var
   dtAtual, dtInicio, dtFim: TDateTime;
begin
   dtAtual := Self.getDataHoraAtual;
   dtInicio := Self.getDataInicioInscricoes;
   dtFim := Self.getDataFimInscricoes;
   if (dtAtual >= dtInicio) and (dtAtual <= dtFim) then
   begin
      Result := rpInscricoes;
   end
   else if dtAtual < dtInicio then
   begin
      Result := rpAntecipado;
   end
   else
      Result := rpAtrasado;
end;

class procedure TUMTAMEvento.inscreveEmTodasAsAtividades(
  const con: TZConnection; const iCodigoInscricao: Integer);
var
   qryInsereInscricoesAtividades:TUMZQuery;
begin
   qryInsereInscricoesAtividades :=  TUMZQuery.Create(con);

   try
      with qryInsereInscricoesAtividades do
      begin
         Connection := con;
         ParamCheck := True;

         SQL.Text := ''+
         'INSERT IGNORE INTO tam_inscricoes_atividades  '+
         '  (cd_inscricao,cd_atividade)  '+
         'SELECT   '+
         ' ti.cd_inscricao,ta.cd_atividade  '+
         'FROM    '+
         '	tam_atividades as ta  '+
         '   INNER JOIN tam_eventos as te ON(ta.cd_evento = te.cd_evento)  '+
         '   INNER JOIN tam_inscricoes as ti ON(ti.CD_EVENTO = te.CD_EVENTO)  '+
         'WHERE    '+
         '	ti.cd_inscricao =:pCDInscricao AND ta.sn_escolhe=0   ';

         ParamByName('pCDInscricao').AsInteger:= iCodigoInscricao;
         ExecSQL;
      end;
   finally
      qryInsereInscricoesAtividades.Free;
   end;

end;

function TUMTAMEvento.isChecarFinanceiro: boolean;
begin
   if Self.FVChecarFin = Null then
   begin
      Result := False;
   end else
   begin
      Result := Self.FVChecarFin = 1;
   end;
end;

{ Compara o total de alunos inscritos até o momento com o total de vagas
  disponíveis. Retorna True se houver vagas e False se não houver vagas.
}
function TUMTAMEvento.temVagas: boolean;
const
   SQL_VAGAS =
   'SELECT IF(NR_VAGAS > '+
      '(SELECT COUNT(CD_INSCRICAO) FROM tam_inscricoes WHERE CD_EVENTO = :cd_evento), "SIM", "NÃO") haVagas '+
   'FROM tam_eventos WHERE CD_EVENTO = :cd_evento';
var
   qyVagas: TUMZReadOnlyQuery;
begin
   qyVagas := TUMZReadOnlyQuery.Create(Self.Conn);
   try
      qyVagas.Connection := Self.Conn;
      qyVagas.ParamCheck := True;
      qyVagas.SQL.Text := SQL_VAGAS;
      qyVagas.ParamByName('cd_evento').AsInteger := Self.FICodigo;
      qyVagas.Open;
      Result := qyVagas.FieldByName('haVagas').AsString = 'SIM';
   finally
      qyVagas.Close;
      qyVagas.Free;
   end;
end;

{ TUMTAMFinanceiro }

{ Procura pela parcela de mensalidade. Se não encontrar retorna o erro rmErrAtuCod.
  Se encontrar a mensalidade, atualiza o valor do código de mensalidade de origem
  para o mesmo código da própria mensalidade.
  Depois tenta gerar ação de movimento automática.
}
function TUMTAMFinanceiro.atualizaMensalidade(const ASNossoNumero, ASTurma,
  ASCodPessoa: string; const AIAnoSemestre, AIParcela: integer): TUMTAMRetMensalidade;
const
   SQL_ATU_MENS =
   'UPDATE mensalidades '+
   'SET cd_mensalidade_origem = cd_mensalidade '+
   'WHERE cd_mensalidade = :cd_mensalidade';
var
   qyAtuMens: TUMZQuery;
   dValorEntrada: Double;
   iCodMensalidade: integer;
begin
   iCodMensalidade := Self.getMensalidade(ASNossoNumero, ASTurma, ASCodPessoa, AIAnoSemestre, AIParcela, dValorEntrada);
   if iCodMensalidade = -1 then
   begin
      Result := rmErrAtuCod;
   end else
   begin
      qyAtuMens := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
      try
         qyAtuMens.Connection := Self.FUMTAMEvento.Conn;
         qyAtuMens.ParamCheck := True;
         qyAtuMens.SQL.Text := SQL_ATU_MENS;
         qyAtuMens.ParamByName('cd_mensalidade').AsInteger := iCodMensalidade;
         try
            qyAtuMens.ExecSQL;
         except
            on E: EZDatabaseError do Result := rmErrBanco;
         end;
         if Self.geraMovimentacao(iCodMensalidade, Self.getAcaoAutomatica, dValorEntrada) then
         begin
            Result := rmSucesso;
         end else
         begin
            Result := rmErrMov;
         end;
      finally
         qyAtuMens.Free;
      end;
      Self.FUMTAMEvento.Inscricoes[ASCodPessoa].Mensalidade := iCodMensalidade;
   end;
end;

{ Construtor. }
constructor TUMTAMFinanceiro.Create(AUMTAMEvento: TUMTAMEvento;
  const AVTipoTitulo, AVValorInsc, AVDtVencto, AVParcela: OleVariant;
  const ABBoleto: boolean);
begin
   inherited Create;
   Self.FUMTAMEvento := AUMTAMEvento;
   Self.FVCentroCusto := Null;
   Self.FVTipoTitulo := AVTipoTitulo;
   Self.FVPlanoConta := Null;
   Self.FVValorInsc := AVValorInsc;
   Self.FVDtVencto := AVDtVencto;
   Self.FVParcela := AVParcela;
   Self.FBBBoleto := ABBoleto;
end;

{ Destrutor. }
destructor TUMTAMFinanceiro.Destroy;
begin
   inherited;
end;

{ Gera parcela de mensalidade para pagamento da inscrição no evento. }
function TUMTAMFinanceiro.geraMensalidade(const ASCodPessoa, ASTurma,
  ASCurso: string; const AIAnoSemestre, AIDepartamento: integer): TUMTAMRetMensalidade;
const
   INDICE_CORRECAO = 0;
   NUMERO_CREDITOS = 0;
   SQL_MENS =
   'INSERT INTO mensalidades('+
      'codigoaluno, parcela, datavencimento, turma, dataemissao, valorbruto,'+
      'valortotal, situacao, bloqueto, anosemestre, indicecorrecao, curso,'+
      'depto, nr_creditos, cd_tipo_titulo, cd_caixa, nossonumero, dt_competencia,'+
      'cd_plano_conta, cd_centro_custo, valorextra)'+
   'VALUES('+
      ':codigoaluno, :parcela, :datavencimento, :turma, NOW(), :valorbruto,'+
      ':valortotal, :situacao, :bloqueto, :anosemestre, :indicecorrecao, :curso,'+
      ':depto, :nr_creditos, :cd_tipo_titulo, :cd_caixa, :nossonumero, :dt_competencia,'+
      ':cd_plano_conta, :cd_centro_custo, 0)';
var
   qyMens, qyGetVl: TUMZQuery;
   vl_evento : OleVariant;
begin
   Result := rmSucesso;
   // Verifica se o valor da inscrição definido no cadastro de eventos é
   // diferente de nulo. Se o valor é nulo não fará nada pois não é necessário
   // cadastro de mensalidade de valor "zero". Se o valor foi definido, utiliza-o para gerar
   // os valores bruto e total da mensalidade.
   vl_evento := Self.FVValorInsc;
   
   qyGetVl := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
   with qyGetVl do
   begin
      Connection := Self.FUMTAMEvento.Conn;
      ParamCheck := True;
      SQL.Clear;
      SQL.Text := 'SELECT MIN(tegv.vl_inscricao) vl_inscricao '+
                  'FROM tam_eventos_grupos_valores AS tegv '+
	               'INNER JOIN nu_grupos_pessoas AS ngp ON (ngp.cd_grupo = tegv.cd_grupo) '+
                  'WHERE ngp.cd_pessoa = :cd_pessoa AND tegv.cd_evento = :cd_evento';
      ParamByName('cd_pessoa').AsString := ASCodPessoa;
      ParamByName('cd_evento').AsInteger := Self.FUMTAMEvento.Codigo;

      try
         Open;
         Self.FVValorInsc := FieldByName('vl_inscricao').AsFloat;
      except
         on E:Exception do
            Self.FVValorInsc := vl_evento;
      end;
   end;     

   if (Self.FVValorInsc <> Null) and (Self.FVValorInsc <> 0) then
   begin
      qyMens := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
      try
         qyMens.Connection := Self.FUMTAMEvento.Conn;
         qyMens.ParamCheck := True;
         qyMens.SQL.Text := SQL_MENS;
         // Substituições das variáveis
         qyMens.ParamByName('codigoaluno').AsString      := ASCodPessoa;
         qyMens.ParamByName('parcela').AsInteger         := Self.getParcela;
         qyMens.ParamByName('datavencimento').AsDateTime := Self.getDataVencimento;
         qyMens.ParamByName('turma').AsString            := ASTurma;
         qyMens.ParamByName('situacao').AsInteger        := Ord(sfPendente);
         qyMens.ParamByName('bloqueto').AsString         := Self.getBoletoAsStr;
         qyMens.ParamByName('anosemestre').AsInteger     := AIAnoSemestre;
         qyMens.ParamByName('indicecorrecao').AsInteger  := INDICE_CORRECAO;
         qyMens.ParamByName('curso').AsString            := ASCurso;
         qyMens.ParamByName('depto').AsInteger           := AIDepartamento;
         qyMens.ParamByName('nr_creditos').AsInteger     := NUMERO_CREDITOS;
         qyMens.ParamByName('cd_tipo_titulo').AsInteger  := Self.getTipoTitulo;
         qyMens.ParamByName('cd_caixa').AsInteger        := Self.getContaBoleto(AIDepartamento, AIAnoSemestre, ASTurma);
         qyMens.ParamByName('dt_competencia').AsDateTime := Self.getDataCompetencia;
         qyMens.ParamByName('cd_plano_conta').AsInteger  := Self.getPlanoConta;
         qyMens.ParamByName('cd_centro_custo').AsInteger := Self.getCentroCusto(ASTurma, AIAnoSemestre);
         qyMens.ParamByName('nossonumero').AsString      := Self.getNossoNumero(AIDepartamento, AIAnoSemestre, ASTurma, ASCodPessoa, 0);
         qyMens.ParamByName('valorbruto').AsFloat        := Self.FVValorInsc;
         qyMens.ParamByName('valortotal').AsFloat        := Self.FVValorInsc;

         // Executa a inserção da mensaliadde no banco de dados.
         try
            qyMens.ExecSQL;
         except
            on E: EZDatabaseError do Result := rmErrBanco;
         end;
         // Atualiza o código da mensalidade de origem após a inserção
         if Result <> rmErrBanco then
         begin
            Result := Self.atualizaMensalidade(qyMens.ParamByName('nossonumero').AsString, ASTurma, ASCodPessoa, AIAnoSemestre, Self.getParcela);
         end;
      finally
         qyMens.Free;
      end;
   end;
   Self.FVCentroCusto := vl_evento;
end;

{ Gera ação de movimento para a mensalidade. }
function TUMTAMFinanceiro.geraMovimentacao(const AICodMensalidade: Integer; const AICodAcao: Integer; const ADVlEntrada: Double): boolean;
const
   OBSERVACAO =
   'Mensalidade gerada através de inscrição local';
   SQL_ACAO =
   'INSERT INTO fin_mov_cr(cd_mensalidade, cd_acao, vl_entrada, dt_movimento, ds_observacao)'+
   'VALUES(:cd_mensalidade, :cd_acao, :vl_entrada, NOW(), :ds_observacao)';
var
   qyMovimento: TUMZQuery;
begin
   Result := True;
   qyMovimento := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyMovimento.Connection := Self.FUMTAMEvento.Conn;
      qyMovimento.ParamCheck := True;
      qyMovimento.SQL.Text := SQL_ACAO;
      qyMovimento.ParamByName('cd_mensalidade').AsInteger := AICodMensalidade;
      qyMovimento.ParamByName('cd_acao').AsInteger := AICodAcao;
      qyMovimento.ParamByName('vl_entrada').AsFloat := ADVlEntrada;
      qyMovimento.ParamByName('ds_observacao').AsString := OBSERVACAO;
      try
         qyMovimento.ExecSQL;
      except
         on E: EZDatabaseError do Result := False;
      end;
   finally
      qyMovimento.Free;
   end;
end;

{ Pega o código de ação automática para gerar ação de movimento. }
function TUMTAMFinanceiro.getAcaoAutomatica: integer;
const
   SQL_ACAO = 'SELECT cd_acao FROM fin_acoes_movimento WHERE cd_acao_automatica = 1';
var
   qyAcao: TUMZReadOnlyQuery;
begin
   qyAcao := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyAcao.Connection := Self.FUMTAMEvento.Conn;
      qyAcao.ParamCheck := False;
      qyAcao.SQL.Text := SQL_ACAO;
      qyAcao.Open;
      Result := qyAcao.FieldByName('cd_acao').AsInteger;
   finally
      qyAcao.Close;
      qyAcao.Free;
   end;
end;

function TUMTAMFinanceiro.getBoletoAsStr: string;
begin
   if Self.FBBBoleto then
   begin
      Result := 'S';
   end else
   begin
      Result := 'N';
   end;
end;

{ Retorna o código do centro de custo com base na turma e anosemestre. }
function TUMTAMFinanceiro.getCentroCusto(const ASTurma: string;
  const AIAnoSemestre: integer): integer;
const
   SQL_CENTRO =
   'SELECT cd_centro FROM turmas WHERE codigo = :turma AND anosemestre = :anosemestre';
var
   qyCentro: TUMZReadOnlyQuery;
begin
   qyCentro := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyCentro.Connection := Self.FUMTAMEvento.Conn;
      qyCentro.ParamCheck := True;
      qyCentro.SQL.Text := SQL_CENTRO;
      qyCentro.ParamByName('turma').AsString := ASTurma;
      qyCentro.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
      qyCentro.Open;
      Result := qyCentro.FieldByName('cd_centro').AsInteger;
   finally
      qyCentro.Close;
      qyCentro.Free;
   end;
end;

{ Retorna o código de caixa com base nos parâmetros recebidos.
  Primeiro procura um código de caixa na turma e ano/semestre recebidos como
  parâmetro.
  Se não encontrar o código de caixa na turma então procura no departamento.
  Se não encontrar no departamento o retorna será 0.
}
function TUMTAMFinanceiro.getContaBoleto(const AIDepartamento,
  AIAnoSemestre: integer; const ASTurma: string): integer;
const
   SQL_CONTA_TURMA =
   'SELECT fcc.cd_caixa '+
   'FROM fin_cadastro_contas fcc INNER JOIN turmas t '+
      'ON(fcc.cd_caixa = t.cd_caixa AND fcc.cd_coligada = t.cd_coligada) '+
   'WHERE t.codigo = :turma AND t.anosemestre = :anosemestre';
   SQL_CONTA_DEPTO =
   'SELECT fcc.cd_caixa '+
   'FROM fin_cadastro_contas fcc INNER JOIN departamentos d '+
      'ON(fcc.cd_caixa = d.cd_boleto_padrao AND fcc.cd_coligada = d.cd_coligada) '+
   'WHERE d.codigo = :depto';
var
   qyConta: TUMZReadOnlyQuery;
begin
   qyConta := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyConta.Connection := Self.FUMTAMEvento.Conn;
      qyConta.ParamCheck := True;
      qyConta.SQL.Text := SQL_CONTA_TURMA;
      qyConta.ParamByName('turma').AsString := ASTurma;
      qyConta.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
      qyConta.Open;
      if qyConta.IsEmpty then
      begin
         qyConta.Close;
         qyConta.SQL.Text := SQL_CONTA_DEPTO;
         qyConta.ParamByName('depto').AsInteger := AIDepartamento;
         qyConta.Open;
         if qyConta.IsEmpty then
         begin
            Result := 0;
         end else
         begin
            Result := qyConta.FieldByName('cd_caixa').AsInteger;
         end;
      end else
      begin
         Result := qyConta.FieldByName('cd_caixa').AsInteger;
      end;
   finally
      qyConta.Close;
      qyConta.Free;
   end;
end;

{ Retorna a data de competência. }
function TUMTAMFinanceiro.getDataCompetencia: TDateTime;
var
   dtAtual: TDateTime;
begin
   dtAtual := Self.FUMTAMEvento.DataAtual;
   if Self.getDataVencimento < dtAtual then
   begin
      Result := dtAtual;
   end else
   begin
      Result := Self.getDataVencimento;
   end;
end;

{ Retorna a data de vencimento. }
function TUMTAMFinanceiro.getDataVencimento: TDateTime;
begin
   if Self.FVDtVencto = Null then
   begin
      Result := Self.FUMTAMEvento.DataAtual;
      Self.FVDtVencto := Result;
   end else
   begin
      Result := Self.FVDtVencto;
   end;
end;

{ Busca a mensalidade na base de dados e retorna o código da mensalidade.
  Assina a variável ADVlEntrada com o valor de valor bruto e valor extra
  somados.
}
function TUMTAMFinanceiro.getMensalidade(const ASNossoNumero, ASTurma,
  ASCodPessoa: string; const AIAnoSemestre, AIParcela: integer;
  var ADVlEntrada: Double): integer;
const
   SQL_MENS =
   'SELECT cd_mensalidade, (valorbruto + valorextra) vl_entrada '+
   'FROM mensalidades '+
   'WHERE nossonumero = :nossonumero AND '+
         'codigoaluno = :codigoaluno AND '+
         'anosemestre = :anosemestre AND '+
         'turma = :turma AND parcela = :parcela';
var
   qyMens: TUMZReadOnlyQuery;
begin
   qyMens := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyMens.Connection := Self.FUMTAMEvento.Conn;
      qyMens.ParamCheck := True;
      qyMens.SQL.Text := SQL_MENS;
      qyMens.ParamByName('nossonumero').AsString := ASNossoNumero;
      qyMens.ParamByName('codigoaluno').AsString := ASCodPessoa;
      qyMens.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
      qyMens.ParamByName('parcela').AsInteger := AIParcela;
      qyMens.ParamByName('turma').AsString := ASTurma;
      qyMens.Open;
      if not qyMens.IsEmpty then
      begin
         Result := qyMens.FieldByName('cd_mensalidade').AsInteger;
         ADVlEntrada := qyMens.FieldByName('vl_entrada').AsCurrency;
      end else
      begin
         Result := -1;
         ADVlEntrada := 0.0;
      end;
   finally
      qyMens.Close;
      qyMens.Free;
   end;
end;

{ Recebe o prefixo do nosso númeroe e o código do aluno. Procura pela ocorrência
  de [ALUNO: dentro do prefixo e caso encontre, monta o nosso número com o código
  do aluno.
}
function TUMTAMFinanceiro.getNossoNumero(const ASPrefixoNN,
  ASCodPessoa: string): string;
var
   sAluno: string;
   iTamanho: integer;
begin
   if AnsiPos('[ALUNO:', ASPrefixoNN) > 0 then
   begin
      sAluno := Copy(ASPrefixoNN, AnsiPos('[', ASPrefixoNN) , AnsiPos(']', ASPrefixoNN) - AnsiPos('[', ASPrefixoNN) + 1);
      iTamanho := StrToInt(Copy( sAluno, AnsiPos(':', sAluno) + 1, 1));
      Result := StringReplace(ASPrefixoNN, sAluno, StringOfChar('0', iTamanho) + ASCodPessoa, [rfReplaceAll, rfIgnoreCase]);
   end else
   begin
      Result := ASPrefixoNN;
   end;
end;

{ Pega o nosso número. Primeira busca o nosso número com base na turma da
  matrícula do aluno. Se não encontrar o nosso número na matrícula, então
  busca no departamento. Se não encontrar no departamento então utiliza o nosso
  número padrão cadastrado na tabela de parâmetros.
}
function TUMTAMFinanceiro.getNossoNumero(const AIDepartamento,
  AIAnoSemestre: integer; const ASTurma, ASCodPessoa: string;
  AITentativas: integer): string;
const
   SQL_ATU_NN =
   'UPDATE fin_cadastro_contas SET nr_nn_ultimo = :nr_nn_ultimo WHERE ds_nn_prefixo = :ds_nn_prefixo';
var
   qyAtualizaNN: TUMZQuery;
   bAtualizaNN: boolean;
   umTAMRetNN: TUMTAMRetNossoNumero;
begin
   bAtualizaNN := True;
   // Busca o nosso número cadastrado para a turma
   if not Self.getNossoNumeroFromTurma(AIAnoSemestre, ASTurma, umTAMRetNN) then
   begin
      // Busca o nosso número cadastrado para o departamento
      if not Self.getNossoNumeroFromDepartamento(AIDepartamento, umTAMRetNN) then
      begin
         // Busca o nosso número padrão
         umTAMRetNN := Self.getNossoNumeroPadrao;
         bAtualizaNN := False;
      end;
   end;
   // Verifica o tamanho
   if umTAMRetNN[nnTamanho] = '0' then
   begin
      umTAMRetNN[nnTamanho] := '8';
   end;
   // Atualiza o nosso número no cadastro de contas
   if bAtualizaNN then
   begin
      qyAtualizaNN := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
      try
         qyAtualizaNN.Connection := Self.FUMTAMEvento.Conn;
         qyAtualizaNN.ParamCheck := True;
         qyAtualizaNN.SQL.Text := SQL_ATU_NN;
         qyAtualizaNN.ParamByName('nr_nn_ultimo').AsInteger := StrToInt(umTAMRetNN[nnTamanho]) + 1;
         qyAtualizaNN.ParamByName('ds_nn_prefixo').AsString := umTAMRetNN[nnPrefixo];
         qyAtualizaNN.ExecSQL;
      finally
         qyAtualizaNN.Free;
      end;
   end;
   // Pega o nosso número com base no código do aluno
   Result := Self.getNossoNumero(umTAMRetNN[nnPrefixo], ASCodPessoa);
   // Monta o nosso número preenchendo com 0 (zeros) à esquerda
   umTAMRetNN[nnPrefixo] := umTAMRetNN[nnPrefixo] + StringOfChar('0', StrToInt(umTAMRetNN[nnTamanho]) - Length(umTAMRetNN[nnUltimo])) + umTAMRetNN[nnUltimo];
   // Não conseguiu encontrar o nosso número
   // Vai repetindo a operação até encontrar o nosso número por até 200 vezes
   if umTAMRetNN[nnPrefixo] <> '' then
   begin
      if Self.procuraNossoNumero(umTAMRetNN[nnPrefixo]) and (AITentativas < 200) then
      begin
         umTAMRetNN[nnPrefixo] := Self.getNossoNumero(AIDepartamento, AIAnoSemestre, ASTurma, ASCodPessoa, AITentativas + 1);
      end;
   end;
   Result := umTAMRetNN[nnPrefixo];
end;

{ Busca o valor do nosso número com base no vínculo do departamento cadastrado
  para a matrícula do aluno com o cadastro de contas do financeiro.
}
function TUMTAMFinanceiro.getNossoNumeroFromDepartamento(
  const AIDepartamento: integer;
  var AUMTAMRetNossoNumero: TUMTAMRetNossoNumero): boolean;
const
   SQL_NN_DEPTO =
   'SELECT fcc.ds_nn_prefixo, fcc.nr_nn_ultimo, fcc.nr_nn_tamanho '+
   'FROM fin_cadastro_contas fcc JOIN departamentos d '+
      'ON(fcc.cd_caixa = d.cd_boleto_padrao AND fcc.cd_coligada = d.cd_coligada)'+
   'WHERE d.codigo = :depto';
var
   qyNNDepto: TUMZReadOnlyQuery;
begin
   qyNNDepto := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyNNDepto.Connection := Self.FUMTAMEvento.Conn;
      qyNNDepto.ParamCheck := True;
      qyNNDepto.SQL.Text := SQL_NN_DEPTO;
      qyNNDepto.ParamByName('depto').AsInteger := AIDepartamento;
      qyNNDepto.Open;
      Result := not qyNNDepto.IsEmpty;
      if Result then
      begin
         AUMTAMRetNossoNumero[nnPrefixo] := qyNNDepto.FieldByName('ds_nn_prefixo').AsString;
         AUMTAMRetNossoNumero[nnUltimo] := qyNNDepto.FieldByName('nr_nn_ultimo').AsString;
         AUMTAMRetNossoNumero[nnTamanho] := qyNNDepto.FieldByName('nr_nn_tamanho').AsString;
      end;
   finally
      qyNNDepto.Close;
      qyNNDepto.Free;
   end;
end;

{ Pega o valor do nosso número com base no vínculo da turma cadastrada na
  matrícula do aluno com o cadastro de contas do financeiro.
}
function TUMTAMFinanceiro.getNossoNumeroFromTurma(const AIAnoSemestre: integer;
  const ASTurma: string;
  var AUMTAMRetNossoNumero: TUMTAMRetNossoNumero): boolean;
const
   SQL_NN_TURMA =
   'SELECT fcc.ds_nn_prefixo, fcc.nr_nn_ultimo, fcc.nr_nn_tamanho '+
   'FROM fin_cadastro_contas fcc JOIN turmas t '+
      'ON(fcc.cd_caixa = t.cd_caixa AND fcc.cd_coligada = t.cd_coligada)'+
   'WHERE t.codigo = :turma AND t.anosemestre = :anosemestre';
var
   qyNNTurma: TUMZReadOnlyQuery;
begin
   qyNNTurma := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyNNTurma.Connection := Self.FUMTAMEvento.Conn;
      qyNNTurma.ParamCheck := True;
      qyNNTurma.SQL.Text := SQL_NN_TURMA;
      qyNNTurma.ParamByName('turma').AsString := ASTurma;
      qyNNTurma.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
      qyNNTurma.Open;
      Result := not qyNNTurma.IsEmpty;
      if Result then
      begin
         AUMTAMRetNossoNumero[nnPrefixo] := qyNNTurma.FieldByName('ds_nn_prefixo').AsString;
         AUMTAMRetNossoNumero[nnUltimo] := qyNNTurma.FieldByName('nr_nn_ultimo').AsString;
         AUMTAMRetNossoNumero[nnTamanho] := qyNNTurma.FieldByName('nr_nn_tamanho').AsString;
      end;
   finally
      qyNNTurma.Close;
      qyNNTurma.Free;
   end;
end;

{ Busca o nosso número na tabela de parâmetros.
  Atualiza o nosso número no cadastro de contas inscrementando em 1. 
}
function TUMTAMFinanceiro.getNossoNumeroPadrao: TUMTAMRetNossoNumero;
const
   SQL_PARAMS =
   'SELECT ds_variavel, ds_valor FROM parametros WHERE ds_variavel IN("nosso_numero_prefixo", "nosso_numero_ultimo")';
   SQL_ATU_NN =
   'UPDATE parametros SET ds_valor = :ds_valor WHERE ds_variavel = "nosso_numero_ultimo"';
var
   qyNNPadrao: TUMZQuery;
begin
   qyNNPadrao := TUMZQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyNNPadrao.Connection := Self.FUMTAMEvento.Conn;
      qyNNPadrao.ParamCheck := True;
      qyNNPadrao.SQL.Text := SQL_PARAMS;
      qyNNPadrao.Open;
      if not qyNNPadrao.IsEmpty then
      begin
         if qyNNPadrao.Locate('ds_variavel', 'nosso_numero_prefixo', []) then
         begin
            Result[nnPrefixo] := qyNNPadrao.FieldByName('ds_valor').AsString;
         end;
         if qyNNPadrao.Locate('ds_variavel', 'nosso_numero_ultimo', []) then
         begin
            Result[nnUltimo] := qyNNPadrao.FieldByName('ds_valor').AsString;
         end;
         Result[nnTamanho] := '8';
         qyNNPadrao.Close;
         qyNNPadrao.SQL.Text := SQL_ATU_NN;
         qyNNPadrao.ParamByName('ds_valor').AsString := IntToStr(StrToInt(Result[nnUltimo]) + 1);
         qyNNPadrao.ExecSQL;
      end;
   finally
      qyNNPadrao.Free;
   end;
end;

{ Se a parcela para geração de mensalidade não foi definida no cadastro do
  evento, então utiliza a parcela padrão definida no cadastro de tipos
  de título.
}
function TUMTAMFinanceiro.getParcela: integer;
const
   SQL_PARCELA =
   'SELECT nr_parcela FROM fin_tipos_titulo WHERE cd_tipo_titulo = :cd_tipo_titulo';
var
   qyParcela: TUMZReadOnlyQuery;
begin
   if Self.FVParcela = Null then
   begin
      qyParcela := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
      try
         qyParcela.Connection := Self.FUMTAMEvento.Conn;
         qyParcela.ParamCheck := True;
         qyParcela.SQL.Text := SQL_PARCELA;
         qyParcela.ParamByName('cd_tipo_titulo').AsInteger := Self.getTipoTitulo;
         qyParcela.Open;
         Result := qyParcela.FieldByName('nr_parcela').AsInteger;
         Self.FVParcela := Result;
      finally
         qyParcela.Close;
         qyParcela.Free;
      end;
   end else
   begin
      Result := Self.FVParcela;
   end;
end;

{ Pega o código do plano de conta com base no cadastro de de tipos de título. }
function TUMTAMFinanceiro.getPlanoConta: integer;
const
   SQL_PLANO_CONTA =
   'SELECT cd_conta FROM fin_tipos_titulo WHERE cd_tipo_titulo = :cd_tipo_titulo';
var
   qyPlanoConta: TUMZReadOnlyQuery;
begin
   if Self.FVPlanoConta = Null then
   begin
      qyPlanoConta := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
      try
         qyPlanoConta.Connection := Self.FUMTAMEvento.Conn;
         qyPlanoConta.ParamCheck := True;
         qyPlanoConta.SQL.Text := SQL_PLANO_CONTA;
         qyPlanoConta.ParamByName('cd_tipo_titulo').AsInteger := Self.getTipoTitulo;
         qyPlanoConta.Open;
         Result := qyPlanoConta.FieldByName('cd_conta').AsInteger;
         Self.FVPlanoConta := Result;
      finally
         qyPlanoConta.Close;
         qyPlanoConta.Free;
      end;
   end else
   begin
      Result := Self.FVPlanoConta;
   end;
end;

{ Pega o tipo de título. Se não foi definido assume 1. }
function TUMTAMFinanceiro.getTipoTitulo: integer;
begin
   if Self.FVTipoTitulo = Null then
   begin
      Result := 1;
   end else
   begin
      Result := Self.FVTipoTitulo;
   end;
end;

{ Procura o nosso número na tabela de mensalidades. }
function TUMTAMFinanceiro.procuraNossoNumero(
  const ASNossoNumero: string): boolean;
const
   SQL_NN = 'SELECT nossonumero FROM mensalidades WHERE nossonumero = :nossonumero';
var
   qyNN: TUMZReadOnlyQuery;
begin
   qyNN := TUMZReadOnlyQuery.Create(Self.FUMTAMEvento.Conn);
   try
      qyNN.Connection := Self.FUMTAMEvento.Conn;
      qyNN.ParamCheck := True;
      qyNN.SQL.Text := SQL_NN;
      qyNN.Open;
      Result := not qyNN.IsEmpty;
   finally
      qyNN.Close;
      qyNN.Free;
   end;
end;

end.
