unit ClassComprasEntradaSaida;

interface

uses
   SysUtils, Windows, UZDataset, ClassRegistros, ZDbcIntfs, UZDbcFuncs;

Type
   TMensalidadeSituacao = (msOK, msParcial, msPendente, msNegociada, msIsentada, msCancelada);

   ESemTurma = class(Exception);

   TClasseComprasEntradaSaida = class(TObject)
      private
         procedure SetAcumuladosToPago( const cd_pessoa: Integer; const cd_compra_produto: String = ''; is_produto: Boolean = False; const cd_kit: Integer = -1 );
         function GetDataVencimento( const nr_anosemestre: Integer; const cd_curso, cd_turma: String; const cd_pessoa: Integer ): TDateTime;
         function GerarMensalidade(const cd_pessoa: Integer; const cd_resp_finan: Integer;
               const cd_compra: Integer = 0;  cd_produto: String = '';
               const cd_kit: Integer = -1;
               const AnoSemestre: Integer = -1): Integer;
         procedure SetMensalidadeCompra( const cd_compra_produto: String; const cd_mensalidade: Integer; is_produto: Boolean = False; cd_pessoa: Integer = 0 );
         function GetPlanoConta( const cd_tipo_titulo: Integer ): Integer;
         procedure LimpaVinculoComprasMensalidade( const cd_compra: Integer );
         function getAnoSemSaidaProduto(codigoaluno: integer):Integer; overload;
         function GetAnoSemSaidaProduto(const AlunoId, AnoSemestre: Integer): Integer; overload;


         function FindTurma(const TurmaID: AnsiString; const AnoSemestre: Cardinal): AnsiString;
         
         function GerarMensalidadeVarios(
            const cd_pessoa,cd_resp_finan,cd_tipo_titulo, nr_parcela: Integer;
            vl_bruto : Currency;
            dt_vencto: TDateTime;
            const cd_compra: Integer = 0;
            cd_produto: String = '';
            const cd_kit : Integer = -1;
            const AnoSemestre: Integer = -1
         ): Integer;
      public
         procedure AdicionaAcumulado( const cd_compra, cd_pessoa: Integer; const cd_kit: Integer = -1 );

         function PodeImprimirCupom( const cd_compra_mensalidade: Integer;
                                        const IsMensalidade: Boolean ): Boolean;
         procedure RegistraImpressaoCupom( const cd_compra_mensalidade: Integer;
                                                 const IsMensalidade: Boolean );

         procedure CancelarMovimentacao( const cd_compra: Integer );
         procedure ImprimirCupomDOS( const cd_compra: Integer );

         function GerarTitulo(const cd_compra: Integer;
            const sn_gerar_mensalidade: Boolean = False;
            const AnoSemestre: Integer = -1;
            const ProdutoId: AnsiString = ''): Integer;
         function GerarTitulosAcumulados( cd_pessoa: Integer;
            cd_produto: String = '';
            const cd_kit: Integer = -1; const AnoSemestre: Integer = -1): Integer;

         function GerarTituloVarios( vl_bruto : Currency; dt_vencto: TDateTime;
            const cd_compra, cd_tipo_titulo, nr_parcela: Integer;
            const sn_gerar_mensalidade: Boolean = False;
            const sn_verifica_titulo: Boolean = true;
            const AnoSemestre: Integer = -1;
            const ProdutoId: AnsiString = ''): Integer;

         function hasAcumulado( const cd_pessoa: Integer ): Integer;
         function hasCompraFromMensalidade( const cd_mensalidade: Integer ): Integer;
         function hasMaisComprasMensalidade( const cd_compra: Integer ): Boolean;
         function GetCuponsMensalidade( const cd_mensalidade: Integer ): ClasseRegistros;
         function GetCuponsCompras( const cd_compra: Integer ): ClasseRegistros;

         function getValorAcumulado( const cd_pessoa: Integer ): Double;

         function SituacaoMensalidade( const cd_mensalidade: Integer ): TMensalidadeSituacao;

         function MensalidadeBaixadaBanco( const cd_mensalidade: Integer ): Boolean;
         function IsMensalidadeFromProduto( const cd_mensalidade: Integer ): Boolean;

         procedure ZeraImpressao( const cd_mensalidade: Integer );
   end;

var
   ClasseComprasEntradaSaida: TClasseComprasEntradaSaida;

implementation

uses uDM, ClassPlanosPagamento, ClassTurmas, ClassCursos, DB, General, uImpMens,
  uUsuario, ClassPessoa, uImpressaoDOS;

{ TClasseComprasEntradaSaida }

procedure TClasseComprasEntradaSaida.AdicionaAcumulado(const cd_compra,
  cd_pessoa: Integer; const cd_kit: Integer);
const
   SQL_ADICIONA_ACUMULADO =
      ' INSERT INTO COMP_ACUMULADOS ( CD_ACUMULADO, CD_COMPRA, CD_PESSOA, DT_REGISTRO, SN_PAGO, CD_KIT ) ' +
      ' VALUES ( NULL, :CD_COMPRA, :CD_PESSOA, Now(), 0, :CD_KIT ) ';
var
   qyAdicionaAcumulado: TUMZQuery;
begin
   DM.CriarConsulta(qyAdicionaAcumulado);

   qyAdicionaAcumulado.Close();
   qyAdicionaAcumulado.SQL.Text := SQL_ADICIONA_ACUMULADO;
   qyAdicionaAcumulado.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   qyAdicionaAcumulado.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;

   if (cd_kit > 0) then
   begin
      qyAdicionaAcumulado.ParamByName('CD_KIT').AsInteger := cd_kit;
   end else begin
      qyAdicionaAcumulado.ParamByName('CD_KIT').Clear();
   end;
   
   qyAdicionaAcumulado.ExecSQL();

   FreeAndNil(qyAdicionaAcumulado);
end;

procedure TClasseComprasEntradaSaida.CancelarMovimentacao(
  const cd_compra: Integer);
const
   SQL_CANCELAR_MOVIMENTACAO_INSERIR =
      ' INSERT INTO COMP_ESTOQUE ( ' +
      '    CD_COMPRA, CD_PRODUTO, TP_ENTRADA_SAIDA, CD_PESSOA, TP_PESSOA, ' +
      '    NR_QUANTIDADE, DT_COMPRA, DT_ENTRADA, VL_COMPRA, CD_USUARIO ' +
      ' ) ' +
      ' SELECT NULL, CD_PRODUTO, 3, CD_PESSOA, TP_PESSOA, NR_QUANTIDADE, ' + // 3 SERIA A COMPRA ESTORNADA
      '        DT_COMPRA, NOW(), VL_COMPRA, :CD_USUARIO ' +
      ' FROM COMP_ESTOQUE WHERE CD_COMPRA = :CD_COMPRA ';
   SQL_CANCELAR_MOVIMENTACAO_ALTERAR =
      ' UPDATE COMP_ESTOQUE SET TP_ENTRADA_SAIDA = 4 WHERE CD_COMPRA = :CD_COMPRA '; // 4 SERIA A COMPRA QUE FOI ESTORNADA
   SQL_CANCELAR_MOVIMENTACAO_ACUMULADOS =
      ' DELETE FROM COMP_ACUMULADOS WHERE CD_COMPRA = :CD_COMPRA ';
var
   qyCancelarMovimentacao: TUMZQuery;
begin
   DM.CriarConsulta(qyCancelarMovimentacao);

   { Insere um novo Movimento com a situação ESTORNO }
   qyCancelarMovimentacao.Close();

   qyCancelarMovimentacao.SQL.Text := SQL_CANCELAR_MOVIMENTACAO_INSERIR;
   qyCancelarMovimentacao.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   qyCancelarMovimentacao.ParamByName('CD_USUARIO').AsInteger := DM.iCdPessoaLogado;

   qyCancelarMovimentacao.ExecSQL();

   { Altera o Movimento atual para a situação de ESTORNADO }
   qyCancelarMovimentacao.Close();

   qyCancelarMovimentacao.SQL.Text := SQL_CANCELAR_MOVIMENTACAO_ALTERAR;
   qyCancelarMovimentacao.ParamByName('CD_COMPRA').AsInteger := cd_compra;

   qyCancelarMovimentacao.ExecSQL();

   { Remove os acumulos do Movimento ESTORNADO }
   qyCancelarMovimentacao.Close();

   if hasMaisComprasMensalidade( cd_compra ) then
   begin
      Mensagem('Existem outras compras acomuladas agrupadas a parcela de pagamento deste produto. Todos serão marcados como não gerados. Acesse o menu Cadastros > Controle de Produtos > Gerar Título de Vendas Acumuladas para visualizá-los.');
      LimpaVinculoComprasMensalidade( cd_compra );
   end;

   qyCancelarMovimentacao.SQL.Text := SQL_CANCELAR_MOVIMENTACAO_ACUMULADOS;
   qyCancelarMovimentacao.ParamByName('CD_COMPRA').AsInteger := cd_compra;

   qyCancelarMovimentacao.ExecSQL();
end;

function TClasseComprasEntradaSaida.FindTurma(const TurmaID: AnsiString;
  const AnoSemestre: Cardinal): AnsiString;
const
   SSQLTurma = 'SELECT CODIGO FROM TURMAS WHERE CODIGO = ? AND ANOSEMESTRE = ?';
   SSQLInsertTurma =
      'INSERT INTO turmas ( ' +
         'ANOSEMESTRE,' +
         'CODIGO,' +
         'CURSO,' +
         'GRAU,' +
         'SERIE,' +
         'TURNO,' +
         'DESCRICAO,' +
         'DATAINICIO,' +
         'DATAFIM,' +
         'DATACONCLUSAO,' +
         'CD_AVALIACAO,' +
         'CD_CENTRO,' +
         'CD_CAIXA,' +
         'SN_ALTERAR_BOLETO,' +
         'CD_COLIGADA,' +
         'SN_ATIVA,' +
         'CD_SITUACAO,' +
         'SN_USAR_PLANO,' +
         'CD_PLANO_PADRAO,' +
         'DT_INICIO_FINANCEIRO,' +
         'DT_FIM_FINANCEIRO ' +
      ') ' +
      'SELECT ' +
         '?,' +
         'CODIGO,' +
         'CURSO,' +
         'GRAU,' +
         'SERIE,' +
         'TURNO,' +
         'DESCRICAO,' +
         'TIMESTAMP(CONCAT(YEAR(CURRENT_DATE), ''-01-01'')),' +
         'TIMESTAMP(CONCAT(YEAR(CURRENT_DATE), ''-12-31'')),' +
         'TIMESTAMP(CONCAT(YEAR(CURRENT_DATE), ''-12-31'')),' +
         'CD_AVALIACAO,' +
         'CD_CENTRO,' +
         'CD_CAIXA,' +
         'SN_ALTERAR_BOLETO,' +
         'CD_COLIGADA,' +
         'SN_ATIVA,' +
         'CD_SITUACAO,' +
         'SN_USAR_PLANO,' +
         'CD_PLANO_PADRAO,' +
         'TIMESTAMP(CONCAT(YEAR(CURRENT_DATE), ''-01-01'')),' +
         'TIMESTAMP(CONCAT(YEAR(CURRENT_DATE), ''-12-31'')) ' +
      'FROM ' +
         'TURMAS ' +
      'WHERE ' +
         'CODIGO = ? '+
      'ORDER BY ' +
         'ANOSEMESTRE DESC ' +
      'LIMIT 1';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := '';
   
   Stmt := PrepareStatement(SSQLTurma);
   try
      Stmt.SetString(1, TurmaID);
      Stmt.SetInt(2, AnoSemestre);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := TurmaID;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if Result = '' then
   begin
      Stmt := PrepareStatement(SSQLInsertTurma);
      try
         Stmt.SetInt(1, AnoSemestre);
         Stmt.SetString(2, TurmaID);
         if Stmt.ExecuteUpdatePrepared = 1 then
            Result := TurmaID;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;
end;

function TClasseComprasEntradaSaida.GerarMensalidade( const cd_pessoa: Integer;
   const cd_resp_finan: Integer; const cd_compra: Integer = 0;
   cd_produto: String = ''; const cd_kit : Integer = -1;
   const AnoSemestre: Integer = -1): Integer;
const
   SQL_GERAR_MENSALIDADE_CAMPOS =
      ' SELECT CA.CD_COMPRA, SUM(CE.VL_COMPRA) AS VL_COMPRA, SUM(CE.NR_QUANTIDADE) AS NR_QUANTIDADE, CP.DS_PRODUTO, CC.CD_TIPO_TITULO ';
   SQL_GERAR_MENSALIDADE_CAMPOS_KIT =
      ' SELECT CA.CD_COMPRA, SUM(CE.VL_COMPRA) AS VL_COMPRA, ROUND(SUM(CE.NR_QUANTIDADE) / (SELECT SUM(NR_QUANTIDADE) ' +
      ' FROM COMP_KITS_ITENS WHERE CD_KIT = :CD_KIT)) AS NR_QUANTIDADE, CK.NM_KIT AS DS_PRODUTO, CC.CD_TIPO_TITULO ';
   SQL_GERAR_MENSALIDADE_CAMPOS_COMPRA =
      ' SELECT CE.CD_COMPRA, SUM(CE.VL_COMPRA) AS VL_COMPRA, SUM(CE.NR_QUANTIDADE) AS NR_QUANTIDADE, CP.DS_PRODUTO, CC.CD_TIPO_TITULO ';
   // Tabelas
   SQL_GERAR_MENSALIDADE_TABELAS =
      ' FROM COMP_ACUMULADOS CA ' +
      '      INNER JOIN COMP_ESTOQUE CE ON (CE.CD_COMPRA = CA.CD_COMPRA) ' +
      '      INNER JOIN COMP_PRODUTOS CP ON (CP.CD_PRODUTO = CE.CD_PRODUTO) ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON (CC.CD_CATEGORIA = CP.CD_CATEGORIA) ' +
      ' WHERE CA.CD_PESSOA = :CD_PESSOA AND CP.SN_GERAR_TITULO = 1 AND CA.SN_PAGO = 0 ';
   SQL_GERAR_MENSALIDADE_TABELAS_KIT =
      ' FROM COMP_ACUMULADOS CA ' +
      '      INNER JOIN COMP_ESTOQUE CE ON (CE.CD_COMPRA = CA.CD_COMPRA) ' +
      '      INNER JOIN COMP_KITS CK ON (CK.CD_KIT = CA.CD_KIT) ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON (CC.CD_CATEGORIA = CK.CD_CATEGORIA) ' +
      ' WHERE CA.CD_PESSOA = :CD_PESSOA AND CA.CD_KIT = :CD_KIT AND CA.SN_PAGO = 0 ';
   SQL_GERAR_MENSALIDADE_TABELAS_COMPRA =
      ' FROM COMP_ESTOQUE CE ' +
      '      INNER JOIN COMP_PRODUTOS CP ON (CP.CD_PRODUTO = CE.CD_PRODUTO) ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON (CC.CD_CATEGORIA = CP.CD_CATEGORIA) ' +
      ' WHERE CE.CD_PESSOA = :CD_PESSOA AND CP.SN_GERAR_TITULO = 1 AND CE.CD_COMPRA = :CD_COMPRA ';
   SQL_GERAR_MENSALIDADE_GRUPO =
      ' GROUP BY CE.CD_PRODUTO ';
   SQL_GERAR_MENSALIDADE_GRUPO_KIT =
      ' GROUP BY CA.CD_KIT ';
var
   nr_anosemestre, cd_coligada_turma, cd_tipo_titulo: Integer;
   cd_curso, cd_turma, S: String;
   qyGerarMensalidade: TUMZQuery;
   curso_turma : ClasseRegistros;
   dt_vencimento: TDateTime;
begin
   DM.CriarConsulta(qyGerarMensalidade);
   Result := 0;

   if (cd_kit > 0) then
   begin
      cd_produto := '';
   end;

   qyGerarMensalidade.Close();
   if ( cd_compra > 0 ) then
   begin
      qyGerarMensalidade.SQL.Text := SQL_GERAR_MENSALIDADE_CAMPOS_COMPRA;
      qyGerarMensalidade.SQL.Add(SQL_GERAR_MENSALIDADE_TABELAS_COMPRA);

      qyGerarMensalidade.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   end else begin
      if cd_kit > 0 then
      begin
         qyGerarMensalidade.SQL.Text := SQL_GERAR_MENSALIDADE_CAMPOS_KIT;
         qyGerarMensalidade.SQL.Add(SQL_GERAR_MENSALIDADE_TABELAS_KIT);
         qyGerarMensalidade.ParamByName('CD_KIT').AsInteger := cd_kit;
      end else begin
         qyGerarMensalidade.SQL.Text := SQL_GERAR_MENSALIDADE_CAMPOS;
         qyGerarMensalidade.SQL.Add(SQL_GERAR_MENSALIDADE_TABELAS);
      end;

      if ( cd_produto <> '' ) then
      begin
         qyGerarMensalidade.SQL.Add( ' AND CE.CD_PRODUTO = :CD_PRODUTO ' );
         qyGerarMensalidade.ParamByName('CD_PRODUTO').AsString := cd_produto;
      end;
   end; 
   qyGerarMensalidade.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;

   if NOT( cd_compra > 0 ) AND (cd_kit > 0) then
   begin
      qyGerarMensalidade.SQL.Add( SQL_GERAR_MENSALIDADE_GRUPO_KIT );
   end else begin
      qyGerarMensalidade.SQL.Add( SQL_GERAR_MENSALIDADE_GRUPO );
   end;

   qyGerarMensalidade.Open();

   if qyGerarMensalidade.FieldByName('VL_COMPRA').AsFloat <= 0 then
   begin
      qyGerarMensalidade.Close;
      qyGerarMensalidade.Free;
      Exit;
   end;

   try
      if AnoSemestre = -1 then
      begin
         nr_anosemestre := getAnoSemSaidaProduto(cd_pessoa);
      end;

      if AnoSemestre <> -1 then
      begin
         nr_anosemestre := GetAnoSemSaidaProduto(cd_pessoa, AnoSemestre);
      end;
      
   except
      Mensagem('Erro ao capturar o anosemestre atual da Instituição.');
      exit;
   end;

   S := DM.variavel_parametro('Financeiro.Produtos.UsarTurmaPadrao');

   curso_turma := nil;
   
   if S <> 'S' then
   begin
      curso_turma := ClasseTurmas.GetCursoTurmaFromAlunoAnosemestre(cd_pessoa, nr_anosemestre);

      if curso_turma.QtdRegistros  > 0 then
      begin
         cd_curso := curso_turma.Campo['cd_curso'];
         cd_turma := curso_turma.Campo['cd_turma'];
      end;
      
   end;

   if (S = 'S') or (curso_turma.QtdRegistros = 0) then
   begin
      cd_turma := DM.variavel_parametro('financeiro_cd_turma_padrao');
      cd_turma := FindTurma(cd_turma, nr_anosemestre);

      if cd_turma = '' then
      begin
         raise ESemTurma.Create('Erro ao tentar definir a turma para geração da mensalidade.');
      end;

      cd_curso := ClasseCursos.GetCursoFromTurma(cd_turma, nr_anosemestre);
   end;

   dt_vencimento := Now;
   cd_coligada_turma := DM.getColigadaByTurma(cd_turma, nr_anosemestre);

   while not qyGerarMensalidade.Eof do
   begin
      cd_tipo_titulo := qyGerarMensalidade.FieldByName('cd_tipo_titulo').AsInteger;

      Result := DM.GerarMensalidade(
         cd_pessoa,
         ClassePlanosPagamento.GetParcelaFromTipoTitulo( cd_tipo_titulo ),
         cd_turma,
         qyGerarMensalidade.FieldByName('VL_COMPRA').AsFloat,
         0,
         nr_anosemestre,
         dt_vencimento, dt_vencimento, 2, cd_curso,
         ClasseCursos.GetDepartamento( cd_curso, cd_coligada_turma ),
         0, -1, 0, 0,
         qyGerarMensalidade.FieldByName('ds_produto').AsString + ' ('+qyGerarMensalidade.FieldByName('nr_quantidade').AsString+'x)',
         cd_tipo_titulo, GetPlanoConta( cd_tipo_titulo ),
         ClasseTurmas.GetCentroCusto( nr_anosemestre, cd_curso, cd_turma, cd_coligada_turma ),
         0, 0, 'N', 0, 0, 22, 0, cd_resp_finan,
         cd_coligada_turma
      );

      if ( (cd_compra = 0) AND (cd_produto <> '') ) then
         SetMensalidadeCompra( cd_produto, Result, true, cd_pessoa )
      else
         SetMensalidadeCompra( qyGerarMensalidade.FieldByName('CD_COMPRA').AsString, Result );

      qyGerarMensalidade.Next();
   end;

   if ( (cd_compra = 0) AND ((cd_produto <> '') OR (cd_kit > 0)) ) then
   begin
      if (cd_kit > 0) then
      begin
         SetAcumuladosToPago( cd_pessoa, '', False, cd_kit );
      end else begin
         SetAcumuladosToPago( cd_pessoa, cd_produto, True );
      end;
   end else begin
      SetAcumuladosToPago( cd_pessoa, IntToStr(cd_compra) );
   end;
end;



function TClasseComprasEntradaSaida.GerarMensalidadeVarios(const cd_pessoa,
  cd_resp_finan, cd_tipo_titulo, nr_parcela: Integer; vl_bruto: Currency;
  dt_vencto: TDateTime; const cd_compra: Integer; cd_produto: String;
  const cd_kit: Integer; const AnoSemestre: Integer): Integer;

   function GetTurmaMensalidade(const AlunoId: Integer;
      const ProdutoId: AnsiString; out TurmaId, CursoId: AnsiString;
      out AnoSemestre: Integer): Boolean;
   const
      SSQLSelectComAnoSem = ''
         + 'SELECT '
         + '	pt.cd_turma, '
         + '	pt.cd_anosemestre, '
         + '	c.CD_CURSO '
         + 'FROM '
         + '	comp_produtos_turmas pt '
         + '		JOIN matriculas m ON '
         + '			(pt.cd_turma = m.turma) AND '
         + '			(pt.cd_anosemestre = m.anosemestre)		 '
         + '		JOIN fichaindividual f ON '
         + '			(m.codigoaluno = f.codigoaluno) AND '
         + '			(m.anosemestre = f.anosemestre) AND '
         + '			(m.turma = f.turmamatricula) '
         + '		JOIN cursos_mestre c ON '
         + '			(m.curso = c.CD_CURSO) '
         + '		JOIN situacao s ON '
         + '			(m.situacao = s.cd_situacao) '
         + 'WHERE '
         + '	m.codigoaluno = ? AND '
         + '	pt.cd_produto = ? '
         + 'ORDER BY '
         + '	(f.anosemestre = ?) DESC, '
         + '	f.anosemestre DESC, '
         + '	(s.cd_situacao_pai = 1) DESC, '
         + '	(s.cd_situacao_pai = 2) DESC, '
         + '	(s.cd_situacao_pai = 0) DESC, '
         + '	c.NR_RELEVANCIA DESC ';

      SSQLSelectSemAnoSem = ''
         + 'SELECT '
         + '	pt.cd_turma, '
         + '	pt.cd_anosemestre, '
         + '	c.CD_CURSO '
         + 'FROM '
         + '	comp_produtos_turmas pt '
         + '		JOIN matriculas m ON '
         + '			(pt.cd_turma = m.turma) AND '
         + '			(pt.cd_anosemestre = m.anosemestre)		 '
         + '		JOIN fichaindividual f ON '
         + '			(m.codigoaluno = f.codigoaluno) AND '
         + '			(m.anosemestre = f.anosemestre) AND '
         + '			(m.turma = f.turmamatricula) '
         + '		JOIN cursos_mestre c ON '
         + '			(m.curso = c.CD_CURSO) '
         + '		JOIN situacao s ON '
         + '			(m.situacao = s.cd_situacao) '
         + 'WHERE '
         + '	m.codigoaluno = ? AND '
         + '	pt.cd_produto = ? '
         + 'ORDER BY '
         + '	f.anosemestre DESC, '
         + '	(s.cd_situacao_pai = 1) DESC, '
         + '	(s.cd_situacao_pai = 2) DESC, '
         + '	(s.cd_situacao_pai = 0) DESC, '
         + '	c.NR_RELEVANCIA DESC ';
   var
      Stmt: IZPreparedStatement;
      Rs: IZResultSet;
   begin
      if AnoSemestre = -1 then
      begin
         Stmt := PrepareStatement(SSQLSelectSemAnoSem);
      end;

      if AnoSemestre <> -1 then
      begin
         Stmt := PrepareStatement(SSQLSelectComAnoSem);
      end;

      try
         Stmt.SetInt(1, AlunoId);
         Stmt.SetString(2, ProdutoId);

         if AnoSemestre <> -1 then
            Stmt.SetInt(3, AnoSemestre);

         Rs := Stmt.ExecuteQueryPrepared;
         try
            Result := Rs.Next;

            if Result then
            begin
               TurmaId := Rs.GetStringByName('cd_turma');
               CursoId := Rs.GetStringByName('CD_CURSO');
               AnoSemestre := Rs.GetIntByName('cd_anosemestre');
            end;
            
         finally
            Rs.Close;
         end;
      finally
         Stmt.Close;
      end;
   end;

const
   SQL_GERAR_MENSALIDADE_CAMPOS =
      ' SELECT CA.CD_COMPRA, SUM(CE.NR_QUANTIDADE) AS NR_QUANTIDADE, CP.DS_PRODUTO ';
   SQL_GERAR_MENSALIDADE_CAMPOS_KIT =
      ' SELECT CA.CD_COMPRA, ROUND(SUM(CE.NR_QUANTIDADE) / (SELECT SUM(NR_QUANTIDADE) ' +
      ' FROM COMP_KITS_ITENS WHERE CD_KIT = :CD_KIT)) AS NR_QUANTIDADE, CK.NM_KIT AS DS_PRODUTO, CC.CD_TIPO_TITULO ';
   SQL_GERAR_MENSALIDADE_CAMPOS_COMPRA =
      ' SELECT CE.CD_COMPRA, SUM(CE.NR_QUANTIDADE) AS NR_QUANTIDADE, CP.DS_PRODUTO, CC.CD_TIPO_TITULO ';
   // Tabelas
   SQL_GERAR_MENSALIDADE_TABELAS =
      ' FROM COMP_ACUMULADOS CA ' +
      '      INNER JOIN COMP_ESTOQUE CE ON (CE.CD_COMPRA = CA.CD_COMPRA) ' +
      '      INNER JOIN COMP_PRODUTOS CP ON (CP.CD_PRODUTO = CE.CD_PRODUTO) ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON (CC.CD_CATEGORIA = CP.CD_CATEGORIA) ' +
      ' WHERE CA.CD_PESSOA = :CD_PESSOA AND CP.SN_GERAR_TITULO = 1 AND CA.SN_PAGO = 0 ';
   SQL_GERAR_MENSALIDADE_TABELAS_KIT =
      ' FROM COMP_ACUMULADOS CA ' +
      '      INNER JOIN COMP_ESTOQUE CE ON (CE.CD_COMPRA = CA.CD_COMPRA) ' +
      '      INNER JOIN COMP_KITS CK ON (CK.CD_KIT = CA.CD_KIT) ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON (CC.CD_CATEGORIA = CK.CD_CATEGORIA) ' +
      ' WHERE CA.CD_PESSOA = :CD_PESSOA AND CA.CD_KIT = :CD_KIT AND CA.SN_PAGO = 0 ';
   SQL_GERAR_MENSALIDADE_TABELAS_COMPRA =
      ' FROM COMP_ESTOQUE CE ' +
      '      INNER JOIN COMP_PRODUTOS CP ON (CP.CD_PRODUTO = CE.CD_PRODUTO) ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON (CC.CD_CATEGORIA = CP.CD_CATEGORIA) ' +
      ' WHERE CE.CD_PESSOA = :CD_PESSOA AND CP.SN_GERAR_TITULO = 1 AND CE.CD_COMPRA = :CD_COMPRA ';
   SQL_GERAR_MENSALIDADE_GRUPO =
      ' GROUP BY CE.CD_PRODUTO ';
   SQL_GERAR_MENSALIDADE_GRUPO_KIT =
      ' GROUP BY CA.CD_KIT ';
var
   nr_anosemestre, cd_coligada_turma: Integer;
   cd_curso, cd_turma, S: String;
   qyGerarMensalidade: TUMZQuery;
   curso_turma : ClasseRegistros;
   SelecionouTurma: Boolean;
begin
   DM.CriarConsulta(qyGerarMensalidade);
   Result := 0;

   if (cd_kit > 0) then
   begin
      cd_produto := '';
   end;

   qyGerarMensalidade.Close();
   if ( cd_compra > 0 ) then
   begin
      qyGerarMensalidade.SQL.Text := SQL_GERAR_MENSALIDADE_CAMPOS_COMPRA;
      qyGerarMensalidade.SQL.Add(SQL_GERAR_MENSALIDADE_TABELAS_COMPRA);

      qyGerarMensalidade.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   end else begin
      if cd_kit > 0 then
      begin
         qyGerarMensalidade.SQL.Text := SQL_GERAR_MENSALIDADE_CAMPOS_KIT;
         qyGerarMensalidade.SQL.Add(SQL_GERAR_MENSALIDADE_TABELAS_KIT);
         qyGerarMensalidade.ParamByName('CD_KIT').AsInteger := cd_kit;
      end else begin
         qyGerarMensalidade.SQL.Text := SQL_GERAR_MENSALIDADE_CAMPOS;
         qyGerarMensalidade.SQL.Add(SQL_GERAR_MENSALIDADE_TABELAS);
      end;

      if ( cd_produto <> '' ) then
      begin
         qyGerarMensalidade.SQL.Add( ' AND CE.CD_PRODUTO = :CD_PRODUTO ' );
         qyGerarMensalidade.ParamByName('CD_PRODUTO').AsString := cd_produto;
      end;
   end;
   qyGerarMensalidade.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;

   if NOT( cd_compra > 0 ) AND (cd_kit > 0) then
   begin
      qyGerarMensalidade.SQL.Add( SQL_GERAR_MENSALIDADE_GRUPO_KIT );
   end else begin
      qyGerarMensalidade.SQL.Add( SQL_GERAR_MENSALIDADE_GRUPO );
   end;

   qyGerarMensalidade.Open();

   SelecionouTurma := False;

   if cd_produto <> '' then
   begin
      nr_anosemestre := AnoSemestre;
      SelecionouTurma := GetTurmaMensalidade(cd_pessoa, cd_produto, cd_turma,
         cd_curso, nr_anosemestre);
   end;

   if not SelecionouTurma then
   begin
      try
         if AnoSemestre = -1 then
         begin
            nr_anosemestre := getAnoSemSaidaProduto(cd_pessoa);
         end;

         if AnoSemestre <> -1 then
         begin
            nr_anosemestre := GetAnoSemSaidaProduto(cd_pessoa, AnoSemestre);
         end;
      except
         Mensagem('Erro ao capturar o anosemestre atual da Instituição.');
         exit;
      end;

      S := DM.variavel_parametro('Financeiro.Produtos.UsarTurmaPadrao');

      curso_turma := nil;
   
      if S <> 'S' then
      begin
         curso_turma := ClasseTurmas.GetCursoTurmaFromAlunoAnosemestre(cd_pessoa, nr_anosemestre);

         if curso_turma.QtdRegistros  > 0 then
         begin
            cd_curso := curso_turma.Campo['cd_curso'];
            cd_turma := curso_turma.Campo['cd_turma'];
         end;
      
      end;

      if (S = 'S') or (curso_turma.QtdRegistros = 0) then
      begin
         cd_turma := DM.variavel_parametro('financeiro_cd_turma_padrao');
         cd_turma := FindTurma(cd_turma, nr_anosemestre);

         if cd_turma = '' then
         begin
            raise ESemTurma.Create('Erro ao tentar definir a turma para geração da mensalidade.');
         end;

         cd_curso := ClasseCursos.GetCursoFromTurma(cd_turma, nr_anosemestre);
      end;
   end;

   cd_coligada_turma := DM.getColigadaByTurma(cd_turma, nr_anosemestre);

   while not qyGerarMensalidade.Eof do
   begin

      Result := DM.GerarMensalidade(
         cd_pessoa,
         nr_parcela,
         cd_turma,
         vl_bruto,
         0,
         nr_anosemestre,
         dt_vencto, dt_vencto, 2, cd_curso,
         ClasseCursos.GetDepartamento( cd_curso, cd_coligada_turma ),
         0, -1, 0, 0,
         qyGerarMensalidade.FieldByName('ds_produto').AsString + ' ('+qyGerarMensalidade.FieldByName('nr_quantidade').AsString+'x)',
         cd_tipo_titulo, GetPlanoConta( cd_tipo_titulo ),
         ClasseTurmas.GetCentroCusto( nr_anosemestre, cd_curso, cd_turma, cd_coligada_turma ),
         0, 0, 'N', 0, 0, 22, 0, cd_resp_finan,
         cd_coligada_turma
      );

      if ( (cd_compra = 0) AND (cd_produto <> '') ) then
         SetMensalidadeCompra( cd_produto, Result, true, cd_pessoa )
      else
         SetMensalidadeCompra( qyGerarMensalidade.FieldByName('CD_COMPRA').AsString, Result );

      qyGerarMensalidade.Next();
   end;

   if ( (cd_compra = 0) AND ((cd_produto <> '') OR (cd_kit > 0)) ) then
   begin
      if (cd_kit > 0) then
      begin
         SetAcumuladosToPago( cd_pessoa, '', False, cd_kit );
      end else begin
         SetAcumuladosToPago( cd_pessoa, cd_produto, True );
      end;
   end else begin
      SetAcumuladosToPago( cd_pessoa, IntToStr(cd_compra) );
   end;
end;

function TClasseComprasEntradaSaida.GerarTitulo(
  const cd_compra: Integer; const sn_gerar_mensalidade: Boolean = False;
  const AnoSemestre: Integer = -1;
  const ProdutoId: AnsiString = ''): Integer;
const
   SQL_GERAR_TITULO =
      ' SELECT cp.SN_ACUMULAR_VALORES, cp.SN_GERAR_TITULO, ce.CD_PESSOA, ce.VL_COMPRA ' +
      ' FROM comp_estoque ce ' +
      '      INNER JOIN comp_produtos cp ON ( cp.CD_PRODUTO = ce.CD_PRODUTO ) ' +
      '      INNER JOIN comp_categorias cc ON ( cc.CD_CATEGORIA = cp.CD_CATEGORIA ) ' +
      ' WHERE ce.cd_compra = :cd_compra ';
var
   qyGerarTitulo: TUMZQuery;
begin
   DM.CriarConsulta(qyGerarTitulo);
   Result := 0;

   qyGerarTitulo.Close();
   qyGerarTitulo.SQL.Text := SQL_GERAR_TITULO;
   qyGerarTitulo.ParamByName('cd_compra').AsInteger := cd_compra;
   qyGerarTitulo.Open();

   { Se não é para gerar titulo, então caimos fora daqui }
   if qyGerarTitulo.FieldByName('sn_gerar_titulo').AsInteger <> 1 then Exit;

   { Se o produto não tem valor tambem não geramos}
   if qyGerarTitulo.FieldByName('vl_compra').AsFloat = 0.00 then Exit;

   { Verificamos se, o titulo irá ser acumulado ou não }
   if ( qyGerarTitulo.FieldByName('sn_acumular_valores').AsInteger <> 1 ) OR ( sn_gerar_mensalidade ) then
   begin
      // Vamos gerar um título a ser pago
      GerarMensalidade( qyGerarTitulo.FieldByName('cd_pessoa').AsInteger, 0, cd_compra, ProdutoId, -1, AnoSemestre);
   end else begin
      // Vamos acumular os valores
      AdicionaAcumulado( cd_compra, qyGerarTitulo.FieldByName('cd_pessoa').AsInteger );
   end;
end;

function TClasseComprasEntradaSaida.GerarTitulosAcumulados(
  cd_pessoa: Integer; cd_produto: String = '';
  const cd_kit : Integer = -1;
  const AnoSemestre: Integer = -1): Integer;
var
   pessoa: TClassePessoa;
   cd_resp_finan: Integer;
begin
   pessoa := TClassePessoa.Create( cd_pessoa );

   cd_resp_finan := pessoa.Codigo;
   if ( pessoa.Codigo <> pessoa.RespFinan.Codigo ) AND ( pessoa.RespFinan.Codigo > 0 ) then
      cd_resp_finan := pessoa.RespFinan.Codigo
   else if ( pessoa.RespFinan.Codigo = 0 ) AND ( pessoa.Idade < 18 ) then
   begin
      Result := -18;
      Exit;
   end;

   if (cd_kit > 0) then
   begin
      cd_produto := '';
   end;
   
   Result := GerarMensalidade(cd_pessoa, cd_resp_finan, 0, cd_produto, cd_kit,
      AnoSemestre);
end;

function TClasseComprasEntradaSaida.GerarTituloVarios(vl_bruto : Currency; dt_vencto: TDateTime;
   const cd_compra, cd_tipo_titulo, nr_parcela: Integer;
   const sn_gerar_mensalidade: Boolean = False;
   const sn_verifica_titulo: Boolean = true;
   const AnoSemestre: Integer = -1;
   const ProdutoId: AnsiString = ''): Integer;
const
   SQL_GERAR_TITULO =
      ' SELECT cp.SN_ACUMULAR_VALORES, cp.SN_GERAR_TITULO, ce.CD_PESSOA, ce.VL_COMPRA ' +
      ' FROM comp_estoque ce ' +
      '      INNER JOIN comp_produtos cp ON ( cp.CD_PRODUTO = ce.CD_PRODUTO ) ' +
      '      INNER JOIN comp_categorias cc ON ( cc.CD_CATEGORIA = cp.CD_CATEGORIA ) ' +
      ' WHERE ce.cd_compra = :cd_compra ';
var
   qyGerarTitulo: TUMZQuery;
begin
   DM.CriarConsulta(qyGerarTitulo);
   Result := 0;

   qyGerarTitulo.Close();
   qyGerarTitulo.SQL.Text := SQL_GERAR_TITULO;
   qyGerarTitulo.ParamByName('cd_compra').AsInteger := cd_compra;
   qyGerarTitulo.Open();

   { Se não é para gerar titulo, então caimos fora daqui }
   if (qyGerarTitulo.FieldByName('sn_gerar_titulo').AsInteger <> 1) AND ( sn_verifica_titulo ) then Exit;

   { Se o produto não tem valor tambem não geramos}
   if qyGerarTitulo.FieldByName('vl_compra').AsFloat = 0.00 then Exit;

   { Verificamos se, o titulo irá ser acumulado ou não }
   if ( qyGerarTitulo.FieldByName('sn_acumular_valores').AsInteger <> 1 ) OR ( sn_gerar_mensalidade ) then
   begin
      // Vamos gerar um título a ser pago
      GerarMensalidadeVarios(
         qyGerarTitulo.FieldByName('cd_pessoa').AsInteger,
         0,
         cd_tipo_titulo,
         nr_parcela,
         vl_bruto,
         dt_vencto,
         cd_compra,
         ProdutoId,
         -1,
         AnoSemestre
      );
   end else begin
      // Vamos acumular os valores
      AdicionaAcumulado(
         cd_compra,
         qyGerarTitulo.FieldByName('cd_pessoa').AsInteger
      );
   end;
end;

function TClasseComprasEntradaSaida.getAnoSemSaidaProduto(const AlunoId,
  AnoSemestre: Integer): Integer;
const
   SSQLSelectAnoSem = ''
      + 'SELECT DISTINCT '
      + '	anosemestre '
      + 'FROM '
      + '	fichaindividual '
      + 'WHERE '
      + '	codigoaluno = ? '
      + 'ORDER BY '
      + '	(anosemestre = ?) DESC, '
      + '	(anosemestre = ?) DESC, '
      + '	anosemestre DESC ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   S: AnsiString;      
begin
   S := DM.variavel_parametro('nr_anosem_atual');
   
   Result := StrToIntDef(S, DM.GetAnoSemestreAtual);

   Stmt := PrepareStatement(SSQLSelectAnoSem);
   try
      Stmt.SetInt(1, AlunoId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetString(3, S);

      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := Rs.GetIntByName('anosemestre');

      finally
         Rs.Close;
      end;
      
   finally
      Stmt.Close;
   end;
end;

function TClasseComprasEntradaSaida.getAnoSemSaidaProduto(codigoaluno: integer): Integer;
const
   SQL_BUSCA_ANOSEM =
      'select anosemestre from fichaindividual '+
      'where codigoaluno = :codigoaluno '+
      'group by anosemestre '+
      'ORDER BY (anosemestre = :anosem) DESC, anosemestre desc ';
var
   nr_anosemestre : String;
   qryBuscaAnosem : TUMZQuery;
   anoSemReturn : Integer;
begin
   nr_anosemestre := DM.variavel_parametro('nr_anosem_atual');

   dm.CriarConsulta(qryBuscaAnosem);
   qryBuscaAnosem.SQL.Text := SQL_BUSCA_ANOSEM;
   qryBuscaAnosem.ParamByName('codigoaluno').AsInteger := codigoaluno;
   qryBuscaAnosem.ParamByName('anosem').AsString := nr_anosemestre;
   qryBuscaAnosem.Open;

   if qryBuscaAnosem.IsEmpty then
   begin
      Result := StrToInt(nr_anosemestre);
   end;

   if not qryBuscaAnosem.IsEmpty then
   begin
      Result := qryBuscaAnosem.FieldByName('anosemestre').AsInteger;
   end;

   qryBuscaAnosem.Close;
   FreeAndNil(qryBuscaAnosem);
end;

function TClasseComprasEntradaSaida.GetCuponsCompras(
  const cd_compra: Integer): ClasseRegistros;
const
   SQL_GET_CUPONS_MENSALIDADE =
      ' SELECT c.nm_coligada, c.ds_cnpj, p.cd_pessoa, p.nm_pessoa, ce.nr_quantidade, cp.ds_produto, cp.cd_produto, cp.vl_produto, cp.tp_impressao_cupom, ' +
      '        GET_PARAMETROS_COLIGADA( ''cliente_endereco'', c.cd_coligada ) AS cliente_endereco, ' +
      '        GET_PARAMETROS_COLIGADA( ''cliente_telefone'', c.cd_coligada ) AS cliente_telefone, ' +
      '        m.turma AS ds_turma, m.anosemestre AS nr_anosemestre ' +
      ' FROM comp_estoque ce ' +
      '      INNER JOIN comp_produtos cp ON (cp.CD_PRODUTO = ce.CD_PRODUTO) ' +
      '      INNER JOIN comp_categorias cc ON (cc.CD_CATEGORIA = cp.CD_CATEGORIA) ' +
      '      INNER JOIN comp_categorias_coligadas ccc ON ( ccc.cd_categoria = cc.CD_CATEGORIA ) ' +      
      '      INNER JOIN coligadas c ON (c.cd_coligada = ccc.cd_coligada) ' +
      '      INNER JOIN pessoas p ON (p.cd_pessoa = ce.cd_pessoa) ' +
      '      LEFT JOIN comp_estoque_mensalidade cem ON (ce.CD_COMPRA = cem.CD_COMPRA) '+
      '      LEFT JOIN mensalidades m ON (m.cd_mensalidade = cem.cd_mensalidade) ' +
      ' WHERE ce.cd_compra = :cd_compra AND ( ce.SN_PRIMEIRA_IMPRESSAO = 0 OR 1 = :PERMISSAO ) ' +
      ' GROUP BY ce.cd_compra ' +
      ' ORDER BY cp.cd_produto ';
var
   qyGetCuponsMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qyGetCuponsMensalidade);
   Result := ClasseRegistros.Create;

   qyGetCuponsMensalidade.Close();

   qyGetCuponsMensalidade.SQL.Text := SQL_GET_CUPONS_MENSALIDADE;
   qyGetCuponsMensalidade.ParamByName('cd_compra').AsInteger := cd_compra;

   if DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.PlanilhaRecebimentos.Imprimir.CuponsProdutos', npEspecial, False ) then
      qyGetCuponsMensalidade.ParamByName('PERMISSAO').AsInteger := 1
   else
      qyGetCuponsMensalidade.ParamByName('PERMISSAO').AsInteger := 0;

   qyGetCuponsMensalidade.Open();

   Result.CarregarQuery(qyGetCuponsMensalidade);
   Result.Primeiro;

   FreeAndNil(qyGetCuponsMensalidade);
end;

function TClasseComprasEntradaSaida.GetCuponsMensalidade(
  const cd_mensalidade: Integer): ClasseRegistros;
const
   SQL_GET_CUPONS_MENSALIDADE =
      ' SELECT c.nm_coligada, c.ds_cnpj, p.cd_pessoa, p.nm_pessoa, SUM(ce.nr_quantidade) AS nr_quantidade, cp.ds_produto, cp.cd_produto, cp.vl_produto, cp.tp_impressao_cupom, m.turma, ' +
      '        GET_PARAMETROS_COLIGADA( ''cliente_endereco'', c.cd_coligada ) AS cliente_endereco, ' +
      '        GET_PARAMETROS_COLIGADA( ''cliente_telefone'', c.cd_coligada ) AS cliente_telefone ' +
      ' FROM mensalidades m ' +
      '      INNER JOIN comp_estoque_mensalidade cem ON (cem.CD_MENSALIDADE = m.cd_mensalidade) '+
      '      INNER JOIN comp_estoque ce ON (cem.cd_compra = ce.cd_compra) ' +
      '      INNER JOIN coligadas c ON (c.cd_coligada = m.cd_coligada) ' +
      '      INNER JOIN pessoas p ON (p.cd_pessoa = ce.cd_pessoa) ' +
      '      INNER JOIN comp_produtos cp ON (cp.CD_PRODUTO = ce.CD_PRODUTO) ' +
      ' WHERE m.cd_mensalidade = :cd_mensalidade AND ( ce.SN_PRIMEIRA_IMPRESSAO = 0 OR 1 = :PERMISSAO ) ' +
      ' GROUP BY CASE WHEN cp.TP_IMPRESSAO_CUPOM = ''A'' THEN cp.CD_PRODUTO ELSE ce.CD_COMPRA END ' +
      ' ORDER BY cp.cd_produto ';
var
   qyGetCuponsMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qyGetCuponsMensalidade);
   Result := ClasseRegistros.Create;

   qyGetCuponsMensalidade.Close();

   qyGetCuponsMensalidade.SQL.Text := SQL_GET_CUPONS_MENSALIDADE;
   qyGetCuponsMensalidade.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;

   if DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.PlanilhaRecebimentos.Imprimir.CuponsProdutos', npEspecial, False ) then
      qyGetCuponsMensalidade.ParamByName('PERMISSAO').AsInteger := 1
   else
      qyGetCuponsMensalidade.ParamByName('PERMISSAO').AsInteger := 0;

   qyGetCuponsMensalidade.Open();

   Result.CarregarQuery(qyGetCuponsMensalidade);
   Result.Primeiro;

   FreeAndNil(qyGetCuponsMensalidade);
end;

function TClasseComprasEntradaSaida.GetDataVencimento(
  const nr_anosemestre: Integer; const cd_curso, cd_turma: String;
  const cd_pessoa: Integer): TDateTime;
const
   SQL_GET_DATA_VENCIMENTO =
      ' SELECT CAST( CONCAT( LPAD( fpi.NR_ANO, 4, ''0'' ), ''-'', ' +
      '                LPAD( fpi.NR_MES, 2, ''0'' ), ''-'', ' +
      '                LPAD( fpi.NR_DIA, 2, ''0'' ), '' 23:59:59'' ) AS DATETIME ) AS dt_vencimento ' +
      ' FROM matriculas m ' +
      '      INNER JOIN fin_planos_itens fpi ON ( fpi.CD_PLANO = m.planopagamento ) ' +
      ' WHERE m.codigoaluno = :cd_pessoa AND m.anosemestre = :nr_anosemestre AND ' +
      '       m.curso = :cd_curso AND m.turma = :cd_turma AND ' +
      '       CONCAT( LPAD( fpi.NR_ANO, 4, ''0'' ), ' +
      '               LPAD( fpi.NR_MES, 2, ''0'' ), ' +
      '               LPAD( fpi.NR_DIA, 2, ''0'' ) ' +
      '       ) > DATE_FORMAT( Now(),''%Y%m%d'' ) ' +
      ' LIMIT 1 ';
   SQL_GET_DATA_VENCIMENTO_ORACLE =
      ' SELECT CONCAT( LPAD( fpi.NR_ANO, 4, ''0'' ), ''-'' || ' +
      '                LPAD( fpi.NR_MES, 2, ''0'' ) || ''-'' || ' +
      '                LPAD( fpi.NR_DIA, 2, ''0'' ) || '' 23:59:59'' ' +
      '        ) AS dt_vencimento ' +
      ' FROM matriculas m ' +
      '      INNER JOIN fin_planos_itens fpi ON ( fpi.CD_PLANO = m.planopagamento ) ' +
      ' WHERE m.CODIGOALUNO = :cd_pessoa AND m.ANOSEMESTRE = :nr_anosemestre AND ' +
      '       m.CURSO = :cd_curso AND m.TURMA = :cd_turma AND ' +
      '       CONCAT( LPAD( fpi.NR_ANO, 4, ''0'' ), ' +
      '               LPAD( fpi.NR_MES, 2, ''0'' ) || ' +
      '               LPAD( fpi.NR_DIA, 2, ''0'' ) ' +
      '       ) > DATE_FORMAT( Now(),''%Y%m%d'' ) AND ' +
      '       ROWNUM = 1 ';
var
   qyGetDataVencimento: TUMZQuery;
begin
   DM.CriarConsulta( qyGetDataVencimento );

   qyGetDataVencimento.Close();

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qyGetDataVencimento.SQL.Text := SQL_GET_DATA_VENCIMENTO_ORACLE
   else
      qyGetDataVencimento.SQL.Text := SQL_GET_DATA_VENCIMENTO;

   qyGetDataVencimento.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyGetDataVencimento.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyGetDataVencimento.ParamByName('cd_curso').AsString := cd_curso;
   qyGetDataVencimento.ParamByName('cd_turma').AsString := cd_turma;

   qyGetDataVencimento.Open();

   try
      Result := qyGetDataVencimento.FieldByName('dt_vencimento').AsDateTime;
   except
      Result := Now;
   end;

   FreeAndNil(qyGetDataVencimento);
end;

function TClasseComprasEntradaSaida.GetPlanoConta(
  const cd_tipo_titulo: Integer): Integer;
const
   SQL_GET_PLANO_CONTA =
      ' SELECT cd_conta FROM fin_tipos_titulo ' +
      ' WHERE cd_tipo_titulo = :cd_tipo_titulo ';
var
   qyGetPlanoConta: TUMZQuery;
begin
   DM.CriarConsulta(qyGetPlanoConta);

   qyGetPlanoConta.Close();
   qyGetPlanoConta.SQL.Text := SQL_GET_PLANO_CONTA;
   qyGetPlanoConta.ParamByName('cd_tipo_titulo').AsInteger := cd_tipo_titulo;
   qyGetPlanoConta.Open();

   Result := qyGetPlanoConta.FieldByName('cd_conta').AsInteger;

   FreeAndNil(qyGetPlanoConta);
end;

function TClasseComprasEntradaSaida.getValorAcumulado(
  const cd_pessoa: Integer): Double;
const
   SQL_GET_VALOR_ACUMULADO =
      ' SELECT SUM( COALESCE( CE.VL_COMPRA, 0 ) ) AS VL_TOTAL ' +
      ' FROM COMP_ACUMULADOS CA ' +
      '      INNER JOIN COMP_ESTOQUE CE ON ( CE.CD_COMPRA = CA.CD_COMPRA ) ' +
      ' WHERE CA.CD_PESSOA = :CD_PESSOA AND SN_PAGO = 0 ';
var
   qyGetValorAcumulado: TUMZQuery;
begin
   DM.CriarConsulta(qyGetValorAcumulado);

   qyGetValorAcumulado.Close();
   qyGetValorAcumulado.SQL.Text := SQL_GET_VALOR_ACUMULADO;
   qyGetValorAcumulado.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyGetValorAcumulado.Open();

   Result := qyGetValorAcumulado.FieldByName('VL_TOTAL').AsFloat;

   FreeAndNil(qyGetValorAcumulado);
end;

function TClasseComprasEntradaSaida.hasAcumulado(
  const cd_pessoa: Integer): Integer;
const
   SQL_HAS_ACUMULADO =
      ' SELECT CD_COMPRA FROM COMP_ACUMULADOS ' +
      ' WHERE CD_PESSOA = :CD_PESSOA AND SN_PAGO = 0 ';
   SQL_HAS_ACUMULADO_ORDER =
      ' ORDER BY DT_REGISTRO DESC ';
var
   qyHasAcumulado: TUMZQuery;
begin
   DM.CriarConsulta(qyHasAcumulado);

   qyHasAcumulado.Close();
   qyHasAcumulado.SQL.Text := SQL_HAS_ACUMULADO;
   qyHasAcumulado.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
   begin
      qyHasAcumulado.SQL.Add( ' AND ROWNUM = 1 ' );
      qyHasAcumulado.SQL.Add( SQL_HAS_ACUMULADO_ORDER );
   end else begin
      qyHasAcumulado.SQL.Add( SQL_HAS_ACUMULADO_ORDER );
      qyHasAcumulado.SQL.Add( ' LIMIT 1 ' );
   end;
   qyHasAcumulado.Open();

   Result := 0;

   if ( qyHasAcumulado.RecordCount = 1 ) then
      Result := qyHasAcumulado.FieldByName('CD_COMPRA').AsInteger;

   FreeAndNil(qyHasAcumulado);
end;

function TClasseComprasEntradaSaida.hasCompraFromMensalidade(
  const cd_mensalidade: Integer): Integer;
const
   SQL_HAS_COMPRA_FROM_MENSALIDADE =
      ' SELECT cd_compra FROM comp_estoque_mensalidade WHERE cd_mensalidade = :cd_mensalidade ';
var
   qyHasCompraFromMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qyHasCompraFromMensalidade);
   qyHasCompraFromMensalidade.Close();
   qyHasCompraFromMensalidade.SQL.Text := SQL_HAS_COMPRA_FROM_MENSALIDADE;
   qyHasCompraFromMensalidade.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;
   qyHasCompraFromMensalidade.Open();

   Result := 0;

   if ( qyHasCompraFromMensalidade.RecordCount >= 1 ) then
      Result := qyHasCompraFromMensalidade.FieldByName('cd_compra').AsInteger;

   FreeAndNil(qyHasCompraFromMensalidade);
end;

function TClasseComprasEntradaSaida.hasMaisComprasMensalidade(
  const cd_compra: Integer): Boolean;
const
   SQL_HAS_MAIS_COMPRAS_MENSALIDADE =
      ' SELECT COUNT(*) AS registros ' +
      ' FROM comp_estoque_mensalidade ce ' +
      '      INNER JOIN comp_estoque_mensalidade cee ON (cee.CD_MENSALIDADE = ce.CD_MENSALIDADE) ' +
      ' WHERE ce.CD_COMPRA = :CD_COMPRA AND cee.CD_COMPRA != :CD_COMPRA ';
var
   qyHasMaisComprasMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qyHasMaisComprasMensalidade);

   qyHasMaisComprasMensalidade.Close();
   qyHasMaisComprasMensalidade.SQL.Text := SQL_HAS_MAIS_COMPRAS_MENSALIDADE;
   qyHasMaisComprasMensalidade.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   qyHasMaisComprasMensalidade.Open();

   Result := qyHasMaisComprasMensalidade.FieldByName('registros').AsInteger >= 1;

   FreeAndNil(qyHasMaisComprasMensalidade);
end;

procedure TClasseComprasEntradaSaida.ImprimirCupomDOS(const cd_compra: Integer);
var
   ImpressoraDOS                    : TImpressaoDOS;
   iPular, i, iTamanho, n           : Integer;
   sPorta, strAut, strAuxQtdCupons  : String;
   LinhaDe, LinhaPara               : String;
   
   function escreveCupons(const AICodMCompra: integer) : string;
   var
      registros_cupons : ClasseRegistros;
      conteudo_cupom, conteudo_cupom_aux: String;
      nr_quantidade: Integer;
   begin
      Result := '';

      registros_cupons := ClasseComprasEntradaSaida.GetCuponsCompras( AICodMCompra );
      conteudo_cupom := DM.variavel_parametro( 'financeiro_cupom_campos' );

      while not registros_cupons.IsFim do
      begin
         nr_quantidade := registros_cupons.Campo['nr_quantidade'];
         conteudo_cupom_aux := '';

         while nr_quantidade > 0 do
         begin
            strAuxQtdCupons := '';

            if registros_cupons.Campo['tp_impressao_cupom'] = 'A' then
            begin
               strAuxQtdCupons := ' (' + IntToStr( nr_quantidade ) + 'x)';
               nr_quantidade := 1; 
            end;            

            conteudo_cupom_aux := conteudo_cupom_aux + Chr(13) + conteudo_cupom;

            conteudo_cupom_aux := ReplaceStr(conteudo_cupom_aux, '[DATA]',  FormatDateTime('dd/mm/yyyy', Now()) ) ;
            conteudo_cupom_aux := ReplaceStr(conteudo_cupom_aux, '[HORA]',  FormatDateTime('hh:nn', Now()) ) ;

            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_nome]',
                                                 registros_cupons.Campo['nm_coligada'], [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_cnpj]',
                                                 registros_cupons.Campo['ds_cnpj'], [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_endereco]',
                                                 registros_cupons.Campo['cliente_endereco'], [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_telefone]',
                                                 registros_cupons.Campo['cliente_telefone'], [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[cd_pessoa]',
                                                 IntToStr(registros_cupons.Campo['cd_pessoa']), [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[nm_pessoa]',
                                                 registros_cupons.Campo['nm_pessoa'], [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[produto_nome]',
                                                 registros_cupons.Campo['ds_produto'] + strAuxQtdCupons, [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[turma]',
                                              registros_cupons.Campo['ds_turma'], [rfReplaceAll, rfIgnoreCase] );
            conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[produto_valor]',
                                                 FloatToStrF(registros_cupons.Campo['vl_produto'], ffFixed, 9, 2 ) + strAuxQtdCupons, [rfReplaceAll, rfIgnoreCase] );

            Dec(nr_quantidade);
         end;

         Result := Result + conteudo_cupom_aux;

         registros_cupons.Proximo;
      end;
   end;
begin
   try
      iPular := DM.GetUnimestreINI.ReadInteger('ImpressoraDOS', 'PularLinhas', 0);
      sPorta := DM.GetUnimestreINI.ReadString('ImpressoraDOS', 'Porta', Dm.variavel_parametro('impressao_dos_porta'));
   except
      iPular := 0;
      sPorta := '';
   end;

   try
      iTamanho := StrToInt(DM.variavel_parametro('impressao_tamanho'));
      if (iTamanho = 0) then
      begin
         iTamanho := 40;
      end;
   except
      iTamanho := 40;
   end;

   if sPorta = '' Then
   begin
       sPorta := 'LPT1';
   end;

   try
      if ( not ClasseComprasEntradaSaida.PodeImprimirCupom( cd_compra, False ) ) then
      begin
         Mensagem( 'Os cupons já foram impressos.', '', MB_OK + MB_ICONEXCLAMATION, 0 );
         Exit;
      end;

      ImpressoraDOS := TImpressaoDOS.Create(sPorta);

      strAut := escreveCupons(cd_compra);

      // Trocar #13 por ENTER
      strAut := ReplaceStr(strAut, '#13',  CHR(13) ) ;

      //Trocar negrito
      strAut := ReplaceStr(strAut, '<b>',  CHR(27) + 'E' ) ;
      strAut := ReplaceStr(strAut, '</b>',  CHR(27) + 'E' ) ;

      TImpressaoDOS.TratarFuncaoEsc( strAut );

      // Tratar os alinhamentos  CENTRO[string|tamanho]
      try
         while Pos('CENTRO[', strAut) > 0 do begin
             LinhaDe := Copy(strAut, Pos('CENTRO[', strAut), Pos(']', strAut) - Pos('CENTRO[', strAut) + 1);
             LinhaPara := Copy(LinhaDe, 8, Pos('|', LinhaDe) - 8);
             n := StrToInt(Copy(LinhaDe, Pos('|', LinhaDe) + 1, Pos(']', LinhaDe) - Pos('|', LinhaDe) - 1));

             strAut := ReplaceStr( strAut, LinhaDe, frmImpMens.Centro(LinhaPara, n) );
         end;

         // Tratar os alinhamentos  DIREITA[string|tamanho]

         while Pos('DIREITA[', strAut) > 0 do begin
             LinhaDe := Copy(strAut, Pos('DIREITA[', strAut), Pos(']', strAut) - Pos('DIREITA[', strAut) + 1);
             LinhaPara := Copy(LinhaDe, 9, Pos('|', LinhaDe) - 9);
             n := StrToInt(Copy(LinhaDe, Pos('|', LinhaDe) + 1, Pos(']', LinhaDe) - Pos('|', LinhaDe) - 1));

             strAut := ReplaceStr( strAut, LinhaDe, frmImpMens.Direita(LinhaPara, n) );
         end;
      except
      end;

      strAut := ReplaceStr(strAut, '<corte:tm18>', chr(ord(strtoint('29')))+chr(ord(strtoint( '+86')))+chr(ord(strtoint('+01'))));

      ImpressoraDOS.Imprimir(strAut);
      ImpressoraDOS.PularLinhas(iPular);
      ImpressoraDOS.Finalizar();

      ClasseComprasEntradaSaida.RegistraImpressaoCupom( cd_compra, False );
   except
      on E:EInOutError do
      begin
         Mensagem('Impressora desconectada ou não configurada, não foi possível realizar a impressão.' + #13+#13 + 'Porta de impressão: ' + ImpressoraDOS.GetPorta(), '', MB_ICONEXCLAMATION + MB_OK);
      end;
   end;
end;

function TClasseComprasEntradaSaida.IsMensalidadeFromProduto(
  const cd_mensalidade: Integer): Boolean;
const
   SQL_IS_MENSALIDADE_FROM_PRODUTO =
      ' SELECT '+
      '   count(*) AS registros '+
      ' FROM '+
      '   comp_estoque ce '+
      ' INNER JOIN comp_estoque_mensalidade cem ON ( '+
      '      ce.CD_COMPRA = cem.CD_COMPRA '+
      ' ) '+
      ' WHERE '+
      '   cem.CD_MENSALIDADE = :CD_MENSALIDADE ';
var
   qyIsMensalidadeFromProduto: TUMZQuery;
begin
   DM.CriarConsulta(qyIsMensalidadeFromProduto);

   qyIsMensalidadeFromProduto.SQL.Text := SQL_IS_MENSALIDADE_FROM_PRODUTO;
   qyIsMensalidadeFromProduto.ParamByName('CD_MENSALIDADE').AsInteger := cd_mensalidade;
   qyIsMensalidadeFromProduto.Open();

   Result := ( qyIsMensalidadeFromProduto.FieldByName('registros').AsInteger >= 1 );

   FreeAndNil(qyIsMensalidadeFromProduto);
end;

procedure TClasseComprasEntradaSaida.LimpaVinculoComprasMensalidade(
  const cd_compra: Integer);
const
   SQL_LISTA_COMPRAS =
      'SELECT CD_COMPRA FROM (SELECT CD_COMPRA FROM comp_estoque_mensalidade WHERE cd_mensalidade = (SELECT cd_mensalidade FROM comp_estoque_mensalidade WHERE CD_COMPRA = :CD_COMPRA) AND CD_COMPRA != :CD_COMPRA) TABELA';
   SQL_LIMPA_VINCULO_COMPRAS_MENSALIDADE =
      ' UPDATE COMP_ACUMULADOS SET SN_PAGO = 0 WHERE CD_COMPRA IN ( ' + SQL_LISTA_COMPRAS + ' ) ';
   SQL_LIMPA_VINCULO_COMPRAS_MENSALIDADE_ESTOQUE =
      ' DELETE FROM comp_estoque_mensalidade WHERE CD_COMPRA IN ( ' + SQL_LISTA_COMPRAS + ' ) ';
var
   qyLimpaVinculoComprasMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qyLimpaVinculoComprasMensalidade);

   qyLimpaVinculoComprasMensalidade.Close();
   qyLimpaVinculoComprasMensalidade.SQL.Text := SQL_LIMPA_VINCULO_COMPRAS_MENSALIDADE;
   qyLimpaVinculoComprasMensalidade.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   qyLimpaVinculoComprasMensalidade.ExecSQL;

   qyLimpaVinculoComprasMensalidade.Close();
   qyLimpaVinculoComprasMensalidade.SQL.Text := SQL_LIMPA_VINCULO_COMPRAS_MENSALIDADE_ESTOQUE;
   qyLimpaVinculoComprasMensalidade.ParamByName('CD_COMPRA').AsInteger := cd_compra;
   qyLimpaVinculoComprasMensalidade.ExecSQL;

   FreeAndNil(qyLimpaVinculoComprasMensalidade);
end;

function TClasseComprasEntradaSaida.MensalidadeBaixadaBanco(
  const cd_mensalidade: Integer): Boolean;
const
   SSQLSelectMensalidadeBaixaBanco =
      'SELECT ' +
         'COUNT(*) NR_TOTAL ' +
      'FROM ' +
         'RETORNO_ITENS_TITULOS T ' +
            'JOIN RETORNO_ITENS I ON ' +
               '(T.CD_RETORNO = I.CD_RETORNO) AND ' +
               '(T.NR_SEQUENCIA = I.NR_SEQUENCIA) ' +
      'WHERE ' +
         'T.CD_MENSALIDADE = ? AND ' +
         'I.CD_SITUACAO = 10';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := False;
   
   Stmt := PrepareStatement(SSQLSelectMensalidadeBaixaBanco);
   try
      Stmt.SetInt(1, cd_mensalidade);

      Rs := Stmt.ExecuteQueryPrepared;

      try
         if Rs.Next then
            Result := Rs.GetInt(1) > 0;
            
      finally
         Rs.Close;
         Rs := nil;
      end;

   finally
      Stmt.Close;
      Stmt := nil;
   end; 

end;

function TClasseComprasEntradaSaida.PodeImprimirCupom(
  const cd_compra_mensalidade: Integer; const IsMensalidade: Boolean): Boolean;
const
   SQL_PODE_IMPRIMIR_CUPOM =
      ' SELECT count(*) AS registros ' +
      ' FROM comp_estoque ce ' +
      ' WHERE ce.CD_COMPRA = :cd_compra_mensalidade AND ' +
      '       ce.SN_PRIMEIRA_IMPRESSAO = 0 ';
      
   SQL_PODE_IMPRIMIR_CUPOM_MENSALIDADE = 
      ' SELECT count(*) AS registros ' +
      ' FROM comp_estoque ce ' +
      ' INNER JOIN comp_produtos cp ON (cp.CD_PRODUTO = ce.CD_PRODUTO) '+
      ' INNER JOIN comp_estoque_mensalidade cee ON (cee.CD_COMPRA = ce.CD_COMPRA) '+
      ' WHERE cee.CD_MENSALIDADE = :cd_compra_mensalidade AND ' +
      '       ce.SN_PRIMEIRA_IMPRESSAO = 0 AND cp.SN_IMPRIMIR_CUPOM = 1 ';
var
   qyPodeImprimirCupom: TUMZQuery;
begin
   DM.CriarConsulta(qyPodeImprimirCupom);

   qyPodeImprimirCupom.SQL.Clear();
   if IsMensalidade then
      qyPodeImprimirCupom.SQL.Text := SQL_PODE_IMPRIMIR_CUPOM_MENSALIDADE
   else
      qyPodeImprimirCupom.SQL.Text := SQL_PODE_IMPRIMIR_CUPOM;   

   qyPodeImprimirCupom.ParamByName('cd_compra_mensalidade').AsInteger := cd_compra_mensalidade;
   qyPodeImprimirCupom.Open();

   Result := ( qyPodeImprimirCupom.FieldByName('registros').AsInteger > 0 );

   FreeAndNil( qyPodeImprimirCupom );
end;

procedure TClasseComprasEntradaSaida.RegistraImpressaoCupom(
  const cd_compra_mensalidade: Integer; const IsMensalidade: Boolean);
const
   SQL_REGISTRA_PRIMEIRA_IMPRESSAO =
      ' UPDATE comp_estoque SET sn_primeira_impressao = 1 ';
   SQL_REGISTRA_IMPRESSAO_CUPOM =
      ' INSERT INTO recibos ( cd_mensalidade, cd_aluno, nr_parcela, cd_turma, cd_pessoa, dt_recibo, dt_impressao ) ' +
      ' SELECT ce.cd_mensalidade, ce.cd_pessoa, m.parcela, m.turma, :cd_pessoa, ce.DT_COMPRA, ce.DT_COMPRA ' +
      ' FROM comp_estoque ce ' +
      ' INNER JOIN comp_estoque_mensalidade cee ON (cee.cd_compra = ce.cd_compra) '+
      '      INNER JOIN mensalidades m ON ( m.cd_mensalidade = ce.cd_mensalidade ) ' +
      ' WHERE ce.cd_mensalidade = :cd_compra_mensalidade ' +
      ' GROUP BY ce.cd_mensalidade ';
   SQL_REGISTRA_IMPRESSAO_CUPOM_UPDATE =
      ' UPDATE mensalidades SET cd_recibo = :cd_recibo WHERE cd_mensalidade = :cd_compra_mensalidade ';
var
   qyRegistraImpressaoCupom: TUMZQuery;
   cd_recibo: Integer;
begin
   if not cd_compra_mensalidade > 0 then Exit;
   DM.CriarConsulta(qyRegistraImpressaoCupom);

   qyRegistraImpressaoCupom.Close();
   qyRegistraImpressaoCupom.SQL.Text := SQL_REGISTRA_PRIMEIRA_IMPRESSAO;
   if IsMensalidade then
      qyRegistraImpressaoCupom.SQL.Add(' WHERE cd_mensalidade = :cd_compra_mensalidade ')
   else
      qyRegistraImpressaoCupom.SQL.Add(' WHERE cd_compra = :cd_compra_mensalidade ');
   qyRegistraImpressaoCupom.ParamByName('cd_compra_mensalidade').AsInteger := cd_compra_mensalidade;
   qyRegistraImpressaoCupom.ExecSQL();

   if IsMensalidade then
   begin
      qyRegistraImpressaoCupom.Close();
      qyRegistraImpressaoCupom.SQL.Text := SQL_REGISTRA_IMPRESSAO_CUPOM;
      qyRegistraImpressaoCupom.ParamByName('cd_compra_mensalidade').AsInteger := cd_compra_mensalidade;
      qyRegistraImpressaoCupom.ParamByName('cd_pessoa').AsInteger := DM.iCdPessoaLogado;
      qyRegistraImpressaoCupom.ExecSQL();

      cd_recibo := DM.LastInsert();

      qyRegistraImpressaoCupom.Close();
      qyRegistraImpressaoCupom.SQL.Text := SQL_REGISTRA_IMPRESSAO_CUPOM_UPDATE;
      qyRegistraImpressaoCupom.ParamByName('cd_compra_mensalidade').AsInteger := cd_compra_mensalidade;
      qyRegistraImpressaoCupom.ParamByName('cd_recibo').AsInteger := cd_recibo;
      qyRegistraImpressaoCupom.ExecSQL();
   end;

   FreeAndNil(qyRegistraImpressaoCupom);
end;

procedure TClasseComprasEntradaSaida.SetAcumuladosToPago(
  const cd_pessoa: Integer; const cd_compra_produto: String = ''; is_produto: Boolean = False;  const cd_kit: Integer = -1);
const
   SQL_ACUMULADOS_TO_PAGO =
      ' UPDATE COMP_ACUMULADOS SET SN_PAGO = 1 ' +
      ' WHERE SN_PAGO = 0 AND CD_PESSOA = :CD_PESSOA ';
   SQL_ACUMULADOS_TO_PAGO_COMPRA =
      ' AND CD_COMPRA = :CODIGO ';
   SQL_ACUMULADOS_TO_PAGO_COMPRA_IN =
      ' AND CD_COMPRA IN ( SELECT CD_COMPRA FROM COMP_ESTOQUE WHERE CD_PRODUTO = :CODIGO ) ';
   SQL_ACUMULADOS_TO_PAGO_COMPRA_IN_KIT =
      ' AND CD_KIT = :CD_KIT ';
var
   qyAcumuladosToPago: TUMZQuery;
begin
   DM.CriarConsulta(qyAcumuladosToPago);

   qyAcumuladosToPago.Close();
   qyAcumuladosToPago.SQL.Text := SQL_ACUMULADOS_TO_PAGO;

   if ( cd_compra_produto <> '' ) then
   begin
      if is_produto then
         qyAcumuladosToPago.SQL.Add( SQL_ACUMULADOS_TO_PAGO_COMPRA_IN )
      else
         qyAcumuladosToPago.SQL.Add( SQL_ACUMULADOS_TO_PAGO_COMPRA );

      qyAcumuladosToPago.ParamByName('CODIGO').AsString := cd_compra_produto;
   end;

   if (cd_kit > 0) then
   begin
      qyAcumuladosToPago.SQL.Add( SQL_ACUMULADOS_TO_PAGO_COMPRA_IN_KIT );
      qyAcumuladosToPago.ParamByName('CD_KIT').AsInteger := cd_kit;
   end;

   qyAcumuladosToPago.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyAcumuladosToPago.ExecSQL();

   FreeAndNil(qyAcumuladosToPago);
end;

procedure TClasseComprasEntradaSaida.SetMensalidadeCompra(const cd_compra_produto: String;
   const cd_mensalidade: Integer; is_produto: Boolean = False; cd_pessoa: Integer = 0);
const
   SQL_MENSALIDADE_COMPRA =
      'INSERT INTO comp_estoque_mensalidade (CD_MENSALIDADE,CD_COMPRA) VALUES (:MENSA,:COMPRA)            ';

   SQL_GET_COMPRA =
      'SELECT ce.cd_compra, ce.VL_COMPRA, ce.NR_QUANTIDADE, cp.VL_PRODUTO                                 '+
      'FROM                                                                                               '+
      '  comp_estoque as ce                                                                               '+
      '  INNER JOIN comp_acumulados as ca ON (ca.CD_COMPRA = ce.cd_compra)                                '+
      '  INNER JOIN comp_produtos as cp ON (cp.CD_PRODUTO = ce.cd_produto)                                '+
      'WHERE                                                                                              '+
      ' ce.TP_ENTRADA_SAIDA IN (2) AND ca.SN_PAGO = 0 AND                                                 ';
var
   qyMensalidadeCompra,qyGetCompra: TUMZQuery;
   cd_compra : String;
begin
   DM.CriarConsulta(qyMensalidadeCompra);
   DM.CriarConsulta(qyGetCompra);

   qyMensalidadeCompra.SQL.Text := SQL_MENSALIDADE_COMPRA;

   // Embora pergunte se é produto, na verdade significa se é acumulada
   if (is_produto) then
   begin
      qyGetCompra.SQL.Text := SQL_GET_COMPRA;
      qyGetCompra.SQL.Add('ce.CD_PRODUTO = :CODIGO AND ce.CD_PESSOA = :CD_PESSOA');
      qyGetCompra.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
      qyGetCompra.ParamByName('CODIGO').AsString := cd_compra_produto;
      qyGetCompra.Open;

      // Uma compra pode ter vários itens, é preciso associar a mensalidade a cada um deles
      while not qyGetCompra.eof do
      begin
        cd_compra := qyGetCompra.FieldByName('cd_compra').AsString;
        qyMensalidadeCompra.ParamByName('MENSA').AsInteger := cd_mensalidade;
        qyMensalidadeCompra.ParamByName('COMPRA').AsString := cd_compra;
        qyMensalidadeCompra.ExecSQL();
        qyGetCompra.Next;
      end;
   end
   else
   begin
      // era apenas um produto que já veio por parâmetro
      cd_compra := cd_compra_produto;

      // Insere um único item de compra, pois a mensalidade foi gerada na hora
      qyMensalidadeCompra.ParamByName('MENSA').AsInteger := cd_mensalidade;
      qyMensalidadeCompra.ParamByName('COMPRA').AsString := cd_compra;
      qyMensalidadeCompra.ExecSQL();
   end;

   FreeAndNil(qyMensalidadeCompra);
   FreeAndNil(qyGetCompra);
end;

function TClasseComprasEntradaSaida.SituacaoMensalidade(
  const cd_mensalidade: Integer): TMensalidadeSituacao;
const
   SQL_SITUACAO_MENSALIDADE =
      ' SELECT situacao FROM mensalidades WHERE cd_mensalidade = :cd_mensalidade ';
var
   retorno: TMensalidadeSituacao;
   qySituacaoMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qySituacaoMensalidade);

   qySituacaoMensalidade.Close();
   qySituacaoMensalidade.SQL.Text := SQL_SITUACAO_MENSALIDADE;
   qySituacaoMensalidade.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;
   qySituacaoMensalidade.Open();

   case qySituacaoMensalidade.FieldByName('situacao').AsInteger of
      0: retorno := msOK;
      1: retorno := msParcial;
      2: retorno := msPendente;
      3: retorno := msNegociada;
      4: retorno := msIsentada;
      5: retorno := msCancelada;
   end;

   Result := retorno;
end;

procedure TClasseComprasEntradaSaida.ZeraImpressao(
  const cd_mensalidade: Integer);
const
   SQL_ZERA_IMPRESSAO =
      ' UPDATE COMP_ESTOQUE ce '
      + ' INNER JOIN comp_estoque_mensalidade cee ON (cee.cd_compra = ce.cd_compra) '
      + ' SET ce.SN_PRIMEIRA_IMPRESSAO = 0 '
      + ' WHERE cee.CD_MENSALIDADE = :CD_MENSALIDADE ';
var
   qyZeraImpressao: TUMZQuery;
begin
   DM.CriarConsulta(qyZeraImpressao);

   qyZeraImpressao.SQL.Text := SQL_ZERA_IMPRESSAO;
   qyZeraImpressao.ParamByName('CD_MENSALIDADE').AsInteger := cd_mensalidade;
   qyZeraImpressao.ExecSQL();

   FreeAndNil(qyZeraImpressao);

   DM.gerar_log(7, 'Mensalidade:' + IntToStr(cd_mensalidade) + ', possuia recibo impressor, mas foi estornada.',
                DM.iCdPessoaLogado, 'RECIBO;' + IntToStr(DM.iCdPessoaLogado) + ';' + IntToStr(cd_mensalidade));
end;

end.
