{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
unit uSvcIntegraBorgesMendoncaMultas;

interface

uses
   Classes, uSvcClasses, uDMConexao, uIntegraBase, uSvcIntegraBorgesMendonca,
   ZAbstractRODataset, SysUtils, ZStoredProcedure, UZDataSet;

type
   { Esta enumeração lista as possíveis bases de dados de destino para criação
     de uma nova parcela de mensalidade no sistema financeiro referente a multa
     da biblioteca no Borges de Mendonça.
     bdCOC: a parcela será gerada na base de dados do COC
     bdDecisao: a parcela será gerada na base de dados do Decisão
   }
   TUMBaseDestino = (bdCOC, bdDecisao);

   { Esta classe armazena todas as informações referentes a multa gerada no
     sistema da biblioteca do Borges de Mendonça. Também armazena as configurações
     definidas pelo usuário para geração da parcela financeira. Tais configurações
     são condicionadas pela biblioteca à qual o exemplar referente ao empréstimo
     está vinculado. Se as configurações específicas da biblioteca não foram
     definidas, então utilizará as configurações gerais.
   }
   TUMBibMulta = class(TObject)
   strict private
      FICodigo: integer;
      FIDepto: integer;
      FIPessoa: integer;
      FIParcela: integer;
      FIMensalidade: integer;
      FITipoTitulo: integer;
      FDtVencto: TDateTime;
      FDtEmissao: TDateTime;
      FDtCompetencia: TDateTime;
      FDValor: Double;
      FDValorPago: Double;
      FDValorExtra: Double;
      FDValorDesconto: Double;
      FDDescontoExtra: Double;
      FDValorJuros: Double;
      FDIndiceCorrecao: Double;
      FSCodigo: string;
      FSMotivoIsencao: string;
      FSTurma: string;
      FSCurso: string;
      FUMBaseDestino: TUMBaseDestino;
   private
      constructor Create(const ASCodMulta: string);
      destructor Destroy;
      procedure carregaDados(AQyDados: TUMZReadOnlyQuery);
      property Codigo: integer read FICodigo;
      property Pessoa: integer read FIPessoa;
      property Parcela: integer read FIParcela;
      property TipoTitulo: integer read FITipoTitulo;
      property Depto: integer read FIDepto;
      property CodigoAsStr: string read FSCodigo;
      property Turma: string read FSTurma;
      property Curso: string read FSCurso;
      property Vencto: TDateTime read FDtVencto;
      property Competencia: TDateTime read FDtCompetencia;
      property Emissao: TDateTime read FDtEmissao;
      property Valor: Double read FDValor;
      property ValorPago: Double read FDValorPago;
      property ValorExtra: Double read FDValorExtra;
      property ValorTotal: Double read FDValor;
      property ValorJuros: Double read FDValorJuros;
      property ValorDesconto: Double read FDValorDesconto;
      property DescontoExtra: Double read FDDescontoExtra;
      property IndiceCorrecao: Double read FDIndiceCorrecao;
      property BaseDestino: TUMBaseDestino read FUMBaseDestino write FUMBaseDestino;
   end;

   { Esta classe é responsável por efetuar a leitura dos registros de multas que
     deverão ser integradas no sistema financeiro do COC e Decisão.
   }
   TUMSvcIntegraBorgesMendoncaMultas = class(TInterfacedObject, IUMIntegraRegistros)
   strict private
      FUMIntegraBorges: TUMSvcIntegraBorgesMendonca;
      FUMBibMulta: TUMBibMulta;
      FQyIntegraCOC: TUMZQuery;
      FQyIntegraDecisao: TUMZQuery;
      FQyMulta: TUMZReadOnlyQuery;
      function getDadosMulta: boolean;
      function getAnoSemestreAtual: string;
      function getDataBaseCorrecao: TDateTime;
      function integraMultaBiblioteca: boolean;
      function integraMultaFinanceiroCOC: boolean;
      function integraMultaFinanceiroDecisao: boolean;
      procedure setMensalidadeMulta(const ASMensalidade: string);
   public
      constructor Create(AUMIntegraBorges: TUMSvcIntegraBorgesMendonca);
      destructor Destroy; override;
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

   { Esta classe efetua a leitura das mensalidades no sistema financeiro do COC
     e Decisão para verificar quais mensalidades foram baixadas, pegar as
     informações e atualizar as multas da biblioteca no Borges de Mendonça.
   }
   TUMSvcIntegraMensalidade = class(TInterfacedObject, IUMIntegraRegistros)
   strict private
      FUMIntegraBorges: TUMSvcIntegraBorgesMendonca;
      FQyIntegraBorges: TUMZQuery;
      FQyMensalidade: TUMZReadOnlyQuery;
      function integraMultaBiblioteca: boolean;
      function getDadosMensalidade(const ASMensalidade: string): boolean;
   public
      constructor Create(AUMIntegraBorges: TUMSvcIntegraBorgesMendonca);
      destructor Destroy; override;
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

implementation

uses DB;

const
   // usuário padrão para geração das parcelas no sistema financeiro
   USUARIO_BIBLIOTECA = 'BIBLIOTECA';

   // sql que efetua a consulta dos dados da multa na Biblioteca
   SQL_GET_BIB_MULTA =
      'SELECT '+
         'bm.cd_multa,'+
         'be.cd_pessoa,'+
         'bm.db_valor,'+
         'bm.dt_vencimento,'+
         'NOW() dt_emissao,'+
         'COALESCE(bbc.nr_multa_parcela, bc.nr_multa_parcela) nr_multa_parcela,'+
         'COALESCE(bbc.ds_multa_turma, bc.ds_multa_turma) ds_multa_turma,'+
         'COALESCE(bbc.ds_multa_curso, bc.ds_multa_curso) ds_multa_curso,'+
         'COALESCE(bbc.cd_multa_departamento, bc.cd_multa_departamento) cd_multa_departamento,'+
         'COALESCE(bbc.cd_tipo_titulo, bc.cd_tipo_titulo) cd_tipo_titulo '+
      'FROM '+
         'bib_multas bm '+
            'JOIN bib_emprestimos be USING(cd_emprestimo) '+
               'JOIN bib_titulos_exemplares bte USING(cd_exemplar) '+
                  'JOIN bib_bibliotecas_config bbc USING(cd_biblioteca),'+
         'bib_config bc '+
      'WHERE '+
         'bm.cd_multa = :cd_multa';

   // efetua a integração da multa no sistema financeiro do COC e Decisão
   SQL_INTEGRA_MULTA =
      'SELECT FMD_ADICIONA_MULTA_BIB('+
         ':cd_pessoa, :nr_parcela, :dt_vencto, :dt_competencia, :cd_turma,'+
         ':dt_emissao, :vl_bruto, :vl_desconto, :vl_desconto_extra, :vl_extra,'+
         ':vl_total, :vl_juros, :vl_pago, :cd_situacao, :ds_usuario,'+
         ':sn_bloqueto, :cd_carta, :nr_anosemestre, :dt_base_correcao,'+
         ':vl_indice_correcao, :cd_curso, :cd_depto, :cd_tipo_titulo,'+
         ':sn_credito_parcela, :nr_creditos) AS cd_mensalidade';

   // efetua a integração da mensalidade no sistema da biblioteca no Borges de Mendonça
   SQL_INTEGRA_MENS =
      'CALL SPM_INTEGRA_MULTA_BIB('+
         ':cd_mensalidade, :db_valor_pago, :db_valor_bruto, :cd_situacao, :dt_pagamento, :cd_usuario)';

   // busca as informações da mensalidade no sistema financeiro do COC e Decisão
   SQL_GET_MENSALIDADE =
      'SELECT '+
         'cd_mensalidade_origem,'+
         'CASE WHEN valortotal = 0 THEN valorbruto ELSE valortotal END AS valortotal,'+
         'valorbruto,'+
         'situacao,'+
         'CASE WHEN valorpago = 0 THEN NULL ELSE valorpago END AS valorpago,'+
         'datapagamento,'+
         'COALESCE(cd_usuario, 0) cd_usuario '+
      'FROM '+
         'mensalidades '+
      'WHERE '+
         'cd_mensalidade_origem = :cd_mensalidade '+
      'ORDER BY '+
         'cd_mensalidade';

   // define o código da mensalidade à qual a multa da biblioteca está associada
   SQL_ATU_MENS_MULTA =
      'UPDATE bib_multas SET cd_mensalidade = :cd_mensalidade WHERE cd_multa = :cd_multa';

   LOG_LINHA_NOVA = #13 + #9;

   LOG_ERRO = LOG_LINHA_NOVA + '[ERRO: $erro$]';

   LOG_SEM_DADOS =
      '[Não foram econtradas informações sobre a multa]' + LOG_LINHA_NOVA +
      'Multa : $cd_multa$';

   LOG_ERRO_GET_DADOS =
      '[Ocorreu um erro ao tentar resgatas as informações da multa na Biblioteca]' + LOG_LINHA_NOVA +
      'Multa : $cd_multa$' + LOG_ERRO;

   LOG_ERRO_INSERE_FIN =
      '[Ocorreu um erro na tentativa de inserir a parcela da biblioteca no financeiro]' + LOG_LINHA_NOVA +
      'Multa : $cd_multa$' + LOG_ERRO;

   LOG_ERRO_GET_NN =
      '[Ocorreu um erro ao tentar pegar o nosso número]' + LOG_LINHA_NOVA +
      'Multa : $cd_multa$' + LOG_ERRO;

   LOG_MULTA_SEM_ORIGEM =
      '[A pessoa vinculada a multa não está associada a um grupo de usuário de origem remota]' + LOG_LINHA_NOVA +
      'Multa : $cd_multa$';

   LOG_MENS_SEM_ORIGEM =
      '[Não foi possível identificar a origem da mensalidade no financeiro]' + LOG_LINHA_NOVA +
      'Mensalidade : $cd_mensalidade$';

   LOG_ERRO_ATU_MENS =
      '[Ocorreu um erro ao tentar atualizar o código de mensalidade da multa na biblioteca]' + LOG_LINHA_NOVA +
      'Multa : $cd_multa$' + LOG_LINHA_NOVA +
      'Mensalidade : $cd_mensalidade$' + LOG_ERRO;

   LOG_ERRO_INTEGRA_MENS =
      '[Ocorreu um erro ao tentar efetuar a integração da mensalidade financeira no sistema da biblioteca]' + LOG_LINHA_NOVA +
      'Mensalidade : $cd_mensalidade$' + LOG_ERRO;

   LOG_ERRO_GET_MEN =
      '[Ocorreu um erro ao tentar resgatar as informações da mensalidade no sistema financeiro]' + LOG_LINHA_NOVA +
      'Mensalidade : $cd_mensalidade$' + LOG_ERRO;

{ TUMSvcIntegraBorgesMendoncaMultas }

{ Esta função acessa a base de dados do Borges de Mendonça para pegar todas os
  dados referentes à multa da biblioteca.
}
function TUMSvcIntegraBorgesMendoncaMultas.getDadosMulta: boolean;
var
   sLog: string;
begin
   Self.FQyMulta.ParamByName('cd_multa').AsString := Self.FUMBibMulta.CodigoAsStr;
   try
      try
         // tenta buscar os dados da multa
         Self.FQyMulta.Open;
         if Self.FQyMulta.IsEmpty then
         begin
            // não foram encontradas as informações
            Self.FUMIntegraBorges.Log.log(StringReplace(LOG_SEM_DADOS, '$cd_multa$', Self.FUMBibMulta.CodigoAsStr, []));
            Result := false;
         end
         else
         begin
            Self.FUMBibMulta.carregaDados(Self.FQyMulta);
            Result := true;
         end;
      except
         on E: Exception do
         begin
            // ocorreu um erro ao tentar buscar as informações
            Result := false;
            sLog := StringReplace(LOG_ERRO_GET_DADOS, '$cd_multa$', Self.FUMBibMulta.CodigoAsStr, []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end;
      end;
   finally
      Self.FQyMulta.Close;
   end;
end;

{ Define o código da mensalidade vinculada à multa da biblioteca. 
}
procedure TUMSvcIntegraBorgesMendoncaMultas.setMensalidadeMulta(
  const ASMensalidade: string);
var
   sLog: string;
   qyAtuMens: TUMZQuery;
begin
   qyAtuMens := Self.FUMIntegraBorges.ConnBM.newQuery;
   try
      qyAtuMens.ParamCheck := True;
      qyAtuMens.SQL.Text := SQL_ATU_MENS_MULTA;
      qyAtuMens.ParamByName('cd_mensalidade').AsString := ASMensalidade;
      qyAtuMens.ParamByName('cd_multa').AsInteger := Self.FUMBibMulta.Codigo;
      try
         // tenta definir o código de mensalidade para a multa
         qyAtuMens.ExecSQL;
      except
         on E: Exception do
         begin
            sLog := StringReplace(LOG_ERRO_ATU_MENS, '$cd_multa$', Self.FUMBibMulta.CodigoAsStr, []);
            sLog := StringReplace(sLog, '$cd_mensalidade$', ASMensalidade, []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);         
         end;
      end;
   finally
      qyAtuMens.Free;
   end;
end;

{ Construtor.
}
constructor TUMSvcIntegraBorgesMendoncaMultas.Create(
  AUMIntegraBorges: TUMSvcIntegraBorgesMendonca);
begin
   Self.FUMIntegraBorges := AUMIntegraBorges;

   Self.FQyMulta := Self.FUMIntegraBorges.ConnBM.newROQuery;
   Self.FQyIntegraCOC := Self.FUMIntegraBorges.ConnCOC.newQuery;
   Self.FQyIntegraDecisao := Self.FUMIntegraBorges.ConnDecisao.newQuery;

   Self.FQyMulta.ParamCheck := True;
   Self.FQyIntegraCOC.ParamCheck := True;
   Self.FQyIntegraDecisao.ParamCheck := True;

   Self.FQyMulta.SQL.Text := SQL_GET_BIB_MULTA;
   Self.FQyIntegraCOC.SQL.Text := SQL_INTEGRA_MULTA;
   Self.FQyIntegraDecisao.SQL.Text := SQL_INTEGRA_MULTA;
end;

{ Destrutor.
}
destructor TUMSvcIntegraBorgesMendoncaMultas.Destroy;
begin
   Self.FUMBibMulta.Free;
   Self.FQyMulta.Free;
   Self.FQyIntegraCOC.Free;
   Self.FQyIntegraDecisao.Free;
   inherited;
end;

{ Pega o ano/semestre atual.
}
function TUMSvcIntegraBorgesMendoncaMultas.getAnoSemestreAtual: string;
var
   wAno, wMes, wDia: Word;
begin
   DecodeDate(Now, wAno, wMes, wDia);
   if wMes < 7 then
      Result := IntToStr(wAno) + '1'
   else
      Result := IntToStr(wAno) + '2'
end;

{ Pega a data base de correção com base na data de vencimento da multa.
}
function TUMSvcIntegraBorgesMendoncaMultas.getDataBaseCorrecao: TDateTime;
var
   wAno, wMes, wDia: Word;
begin
   DecodeDate(Self.FUMBibMulta.Vencto, wAno, wMes, wDia);
   Result := EncodeDate(wAno, wMes, 1);
end;

{ Efetua a integração da multa da biblioteca no sistema financeiro.
}
function TUMSvcIntegraBorgesMendoncaMultas.integraMultaBiblioteca: boolean;
begin
   case Self.FUMBibMulta.BaseDestino of
      bdCOC: Result := Self.integraMultaFinanceiroCOC;
      bdDecisao: Result := Self.integraMultaFinanceiroDecisao;
   end;
end;

{ Efetua a integração da multa da biblioteca no sistema financeiro do COC.
}
function TUMSvcIntegraBorgesMendoncaMultas.integraMultaFinanceiroCOC: boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyIntegraCOC.ParamByName('cd_pessoa').AsInteger := Self.FUMBibMulta.Pessoa;
   Self.FQyIntegraCOC.ParamByName('nr_parcela').AsInteger := Self.FUMBibMulta.Parcela;
   Self.FQyIntegraCOC.ParamByName('dt_vencto').AsDateTime := Self.FUMBibMulta.Vencto;
   Self.FQyIntegraCOC.ParamByName('dt_competencia').AsDateTime := Self.FUMBibMulta.Competencia;
   Self.FQyIntegraCOC.ParamByName('cd_turma').AsString := Self.FUMBibMulta.Turma;
   Self.FQyIntegraCOC.ParamByName('dt_emissao').AsDateTime := Self.FUMBibMulta.Emissao;
   Self.FQyIntegraCOC.ParamByName('vl_bruto').AsCurrency := Self.FUMBibMulta.Valor;
   Self.FQyIntegraCOC.ParamByName('vl_desconto').AsCurrency := Self.FUMBibMulta.ValorDesconto;
   Self.FQyIntegraCOC.ParamByName('vl_desconto_extra').AsCurrency := Self.FUMBibMulta.DescontoExtra;
   Self.FQyIntegraCOC.ParamByName('vl_extra').AsCurrency := Self.FUMBibMulta.ValorExtra;
   Self.FQyIntegraCOC.ParamByName('vl_total').AsCurrency := Self.FUMBibMulta.ValorTotal;
   Self.FQyIntegraCOC.ParamByName('vl_juros').AsCurrency := Self.FUMBibMulta.ValorJuros;
   Self.FQyIntegraCOC.ParamByName('vl_pago').AsCurrency := Self.FUMBibMulta.ValorPago;
   Self.FQyIntegraCOC.ParamByName('cd_situacao').AsInteger := 2;
   Self.FQyIntegraCOC.ParamByName('ds_usuario').AsString := USUARIO_BIBLIOTECA;
   Self.FQyIntegraCOC.ParamByName('sn_bloqueto').AsString := 'N';
   Self.FQyIntegraCOC.ParamByName('cd_carta').AsInteger := 0;
   Self.FQyIntegraCOC.ParamByName('nr_anosemestre').AsString := Self.getAnoSemestreAtual;
   Self.FQyIntegraCOC.ParamByName('dt_base_correcao').AsDateTime := Self.getDataBaseCorrecao;
   Self.FQyIntegraCOC.ParamByName('vl_indice_correcao').AsCurrency := Self.FUMBibMulta.IndiceCorrecao;
   Self.FQyIntegraCOC.ParamByName('cd_curso').AsString := Self.FUMBibMulta.Curso;
   Self.FQyIntegraCOC.ParamByName('cd_depto').AsInteger := Self.FUMBibMulta.Depto;
   Self.FQyIntegraCOC.ParamByName('cd_tipo_titulo').AsInteger := Self.FUMBibMulta.TipoTitulo;
   Self.FQyIntegraCOC.ParamByName('sn_credito_parcela').AsString := 'N';
   Self.FQyIntegraCOC.ParamByName('nr_creditos').AsInteger := 0;
   try
      try
         Self.FQyIntegraCOC.Open;
      except
         on E: Exception do
         begin
            Result := False;
            sLog := StringReplace(LOG_ERRO_INSERE_FIN, '$cd_multa$', Self.FUMBibMulta.CodigoAsStr, []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end;
      end;
      if Result then
         Self.setMensalidadeMulta(Self.FQyIntegraCOC.FieldByName('cd_mensalidade').AsString);
   finally
      Self.FQyIntegraCOC.Close;
   end;
end;

{ Efetua a integração da multa da biblioteca no sistema financeiro do Decisão.
}
function TUMSvcIntegraBorgesMendoncaMultas.integraMultaFinanceiroDecisao: boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyIntegraDecisao.ParamByName('cd_pessoa').AsInteger := Self.FUMBibMulta.Pessoa;
   Self.FQyIntegraDecisao.ParamByName('nr_parcela').AsInteger := Self.FUMBibMulta.Parcela;
   Self.FQyIntegraDecisao.ParamByName('dt_vencto').AsDateTime := Self.FUMBibMulta.Vencto;
   Self.FQyIntegraDecisao.ParamByName('dt_competencia').AsDateTime := Self.FUMBibMulta.Competencia;
   Self.FQyIntegraDecisao.ParamByName('cd_turma').AsString := Self.FUMBibMulta.Turma;
   Self.FQyIntegraDecisao.ParamByName('dt_emissao').AsDateTime := Self.FUMBibMulta.Emissao;
   Self.FQyIntegraDecisao.ParamByName('vl_bruto').AsCurrency := Self.FUMBibMulta.Valor;
   Self.FQyIntegraDecisao.ParamByName('vl_desconto').AsCurrency := Self.FUMBibMulta.ValorDesconto;
   Self.FQyIntegraDecisao.ParamByName('vl_desconto_extra').AsCurrency := Self.FUMBibMulta.DescontoExtra;
   Self.FQyIntegraDecisao.ParamByName('vl_extra').AsCurrency := Self.FUMBibMulta.ValorExtra;
   Self.FQyIntegraDecisao.ParamByName('vl_total').AsCurrency := Self.FUMBibMulta.ValorTotal;
   Self.FQyIntegraDecisao.ParamByName('vl_juros').AsCurrency := Self.FUMBibMulta.ValorJuros;
   Self.FQyIntegraDecisao.ParamByName('vl_pago').AsCurrency := Self.FUMBibMulta.ValorPago;
   Self.FQyIntegraDecisao.ParamByName('cd_situacao').AsInteger := 2;
   Self.FQyIntegraDecisao.ParamByName('ds_usuario').AsString := USUARIO_BIBLIOTECA;
   Self.FQyIntegraDecisao.ParamByName('sn_bloqueto').AsString := 'N';
   Self.FQyIntegraDecisao.ParamByName('cd_carta').AsInteger := 0;
   Self.FQyIntegraDecisao.ParamByName('nr_anosemestre').AsString := Self.getAnoSemestreAtual;
   Self.FQyIntegraDecisao.ParamByName('dt_base_correcao').AsDateTime := Self.getDataBaseCorrecao;
   Self.FQyIntegraDecisao.ParamByName('vl_indice_correcao').AsCurrency := Self.FUMBibMulta.IndiceCorrecao;
   Self.FQyIntegraDecisao.ParamByName('cd_curso').AsString := Self.FUMBibMulta.Curso;
   Self.FQyIntegraDecisao.ParamByName('cd_depto').AsInteger := Self.FUMBibMulta.Depto;
   Self.FQyIntegraDecisao.ParamByName('cd_tipo_titulo').AsInteger := Self.FUMBibMulta.TipoTitulo;
   Self.FQyIntegraDecisao.ParamByName('sn_credito_parcela').AsString := 'N';
   Self.FQyIntegraDecisao.ParamByName('nr_creditos').AsInteger := 0;
   try
      try
         Self.FQyIntegraDecisao.Open;
      except
         on E: Exception do
         begin
            Result := False;
            sLog := StringReplace(LOG_ERRO_INSERE_FIN, '$cd_multa$', Self.FUMBibMulta.CodigoAsStr, []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end;
      end;
      if Result then
         Self.setMensalidadeMulta(Self.FQyIntegraDecisao.FieldByName('cd_mensalidade').AsString);
   finally
      Self.FQyIntegraDecisao.Close;
   end;
end;

{ Processa um registro de integração.
}
function TUMSvcIntegraBorgesMendoncaMultas.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
begin
   Result := irrSuccess;
   Self.FUMBibMulta := TUMBibMulta.Create(ASChave);
   // verifica qual será o destino da criação da parcela financeira
   if ASExtra = 'COC' then
   begin
      Self.FUMBibMulta.BaseDestino := bdCOC;
   end
   else if ASExtra = 'Decisao' then
   begin
      Self.FUMBibMulta.BaseDestino := bdDecisao
   end
   else
   begin
      // não foi definido um destino
      Result := irrFailed;
      Self.FUMIntegraBorges.Log.log(StringReplace(LOG_MULTA_SEM_ORIGEM, '$cd_multa$', ASChave, []));
   end;
   // verifica se ação é M
   if (Result = irrSuccess) and (ACAcao = 'M') then
   begin
      if Self.getDadosMulta then // tenta buscar os dados da multa
      begin
         if not Self.integraMultaBiblioteca then // efetua a integração
         begin
            Result := irrFailed
         end
      end
      else
         Result := irrFailed;
   end;
end;

{ TUMBibMulta }

{ Carrega os dados da multa no objeto.
}
procedure TUMBibMulta.carregaDados(AQyDados: TUMZReadOnlyQuery);
begin
   Self.FICodigo := AQyDados.FieldByName('cd_multa').AsInteger;
   Self.FIDepto := AQyDados.FieldByName('cd_multa_departamento').AsInteger;
   Self.FIPessoa := AQyDados.FieldByName('cd_pessoa').AsInteger;
   Self.FIParcela := AQyDados.FieldByName('nr_multa_parcela').AsInteger;
   Self.FITipoTitulo := AQyDados.FieldByName('cd_tipo_titulo').AsInteger;
   Self.FDtVencto := AQyDados.FieldByName('dt_vencimento').AsDateTime;
   Self.FDtEmissao := AQyDados.FieldByName('dt_emissao').AsDateTime;
   if Self.FDtVencto < Self.FDtEmissao then
      Self.FDtCompetencia := Self.FDtEmissao
   else
      Self.FDtCompetencia := Self.FDtVencto;
   Self.FDValor := AQyDados.FieldByName('db_valor').AsCurrency;
   Self.FSTurma := AQyDados.FieldByName('ds_multa_turma').AsString;
   Self.FSCurso := AQyDados.FieldByName('ds_multa_curso').AsString;
end;

{ Construtor.
}
constructor TUMBibMulta.Create(const ASCodMulta: string);
begin
   Self.FSCodigo := ASCodMulta;
   Self.FDValorPago := 0;
   Self.FDValorExtra := 0;
   Self.FDValorDesconto := 0;
   Self.FDDescontoExtra := 0;
   Self.FDValorJuros := 0;
   Self.FDIndiceCorrecao := 0;
   Self.FSMotivoIsencao := '';
end;

{ Destrutor.
}
destructor TUMBibMulta.Destroy;
begin
   inherited;
end;

{ TUMSvcIntegraMensalidade }

{ Construtor.
}
constructor TUMSvcIntegraMensalidade.Create(
  AUMIntegraBorges: TUMSvcIntegraBorgesMendonca);
begin
   Self.FUMIntegraBorges := AUMIntegraBorges;
   Self.FQyIntegraBorges := Self.FUMIntegraBorges.ConnBM.newQuery;
   Self.FQyIntegraBorges.ParamCheck := True;
   Self.FQyIntegraBorges.SQL.Text := SQL_INTEGRA_MENS;
end;

{ Destrutor.
}
destructor TUMSvcIntegraMensalidade.Destroy;
begin
   Self.FQyIntegraBorges.Free;
   Self.FQyMensalidade.Free;   
   inherited;
end;

{ Pega os dados da mensalidade no sistema financeiro.
}
function TUMSvcIntegraMensalidade.getDadosMensalidade(
  const ASMensalidade: string): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyMensalidade.Close;
   Self.FQyMensalidade.ParamByName('cd_mensalidade').AsString := ASMensalidade;
   try
      Self.FQyMensalidade.Open;
   except
      on E: Exception do
      begin
         Result := False;
         sLog := StringReplace(LOG_ERRO_GET_MEN, '$cd_mensalidade$', ASMensalidade, []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Efetua a integração da multa no sistema financeiro.
}
function TUMSvcIntegraMensalidade.integraMultaBiblioteca: boolean;
var
   sLog: string;
   dtPagto: TDateTime;
   iSituacao, iCodUsuario: integer;
   cValor, cValorPago: Currency;
begin
   cValor := 0;
   cValorPago := 0;
   dtPagto := 0;
   Result := True;
   try
      try
         Self.FQyMensalidade.First;
         while not Self.FQyMensalidade.Eof do
         begin
            if Self.FQyMensalidade.FieldByName('valorpago').IsNull then
            begin
               cValor := cValor + Self.FQyMensalidade.FieldByName('valortotal').AsCurrency;
            end
            else
            begin
               cValor := cValor + Self.FQyMensalidade.FieldByName('valorpago').AsCurrency;
               cValorPago := cValorPago + Self.FQyMensalidade.FieldByName('valorpago').AsCurrency;
            end;
            if not Self.FQyMensalidade.FieldByName('datapagamento').IsNull then
            begin
               dtPagto := Self.FQyMensalidade.FieldByName('datapagamento').AsDateTime;
            end;
            iSituacao := Self.FQyMensalidade.FieldByName('situacao').AsInteger;
            iCodUsuario := Self.FQyMensalidade.FieldByName('cd_usuario').AsInteger;
            Self.FQyMensalidade.Next;
         end;
         Self.FQyIntegraBorges.ParamByName('cd_mensalidade').AsInteger :=
            Self.FQyMensalidade.FieldByName('cd_mensalidade_origem').AsInteger;
         if cValorPago = 0 then
            Self.FQyIntegraBorges.ParamByName('db_valor_pago').Clear
         else
            Self.FQyIntegraBorges.ParamByName('db_valor_pago').AsCurrency := cValorPago;
         Self.FQyIntegraBorges.ParamByName('db_valor_bruto').AsCurrency := cValor;
         Self.FQyIntegraBorges.ParamByName('cd_situacao').AsInteger := iSituacao;
         if dtPagto = 0 then
            Self.FQyIntegraBorges.ParamByName('dt_pagamento').Clear
         else
            Self.FQyIntegraBorges.ParamByName('dt_pagamento').AsDateTime := dtPagto;
         Self.FQyIntegraBorges.ParamByName('cd_usuario').AsInteger := iCodUsuario;
         Self.FQyIntegraBorges.ExecSQL;
      except
         on E: Exception do
         begin
            Result := False;
            sLog := StringReplace(LOG_ERRO_INTEGRA_MENS, '$cd_mensalidade$', Self.FQyMensalidade.FieldByName('cd_mensalidade').AsString, []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end;
      end;
   finally
      Self.FQyMensalidade.Close;
   end;
end;

{ Efetua a integração do registro do sistema financeiro no sistema da biblitoeca.
}
function TUMSvcIntegraMensalidade.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
begin
   Result := irrSuccess;
   // verifica a origem do registro...
   if ASExtra = 'COC' then
   begin
      if not Assigned(Self.FQyMensalidade) then
      begin
         Self.FQyMensalidade := Self.FUMIntegraBorges.ConnCOC.newROQuery;
         Self.FQyMensalidade.ParamCheck := True;
         Self.FQyMensalidade.SQL.Text := SQL_GET_MENSALIDADE;
      end;
   end
   else if ASExtra = 'Decisao' then
   begin
      if not Assigned(Self.FQyMensalidade) then
      begin
         Self.FQyMensalidade := Self.FUMIntegraBorges.ConnDecisao.newROQuery;
         Self.FQyMensalidade.ParamCheck := True;
         Self.FQyMensalidade.SQL.Text := SQL_GET_MENSALIDADE;
      end;
   end
   else
   begin
      // não foi definida a origem
      Result := irrFailed;
      Self.FUMIntegraBorges.Log.log(StringReplace((LOG_MENS_SEM_ORIGEM), '$cd_mensalidade$', ASChave, []));
   end;
   if (Result = irrSuccess) and (ACAcao = 'M') then
      if Self.getDadosMensalidade(ASChave) then
      begin
         if not Self.integraMultaBiblioteca then
            Result := irrFailed;
      end
      else
         Result := irrFailed;
end;

end.
