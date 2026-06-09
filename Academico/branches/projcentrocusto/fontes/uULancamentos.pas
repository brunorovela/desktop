unit uULancamentos;

interface

uses
   uAExecucao, Classes, StrUtils, DateUtils, DB, SysUtils, uDM, UZDataset,
   General, Dialogs, Windows;

type

   // Tipos de contas - configurados na tabela situacoes (cd_modulo = 2028)
   // Estes valores NUNCA poderão ser alterados na tabela situacoes,
   // lembrando que estes valores representam o cd_auxiliar
   TTiposConta = (tcErro = 0, tcCaixaBanco = 1, tcAtivo = 2, tcPassivo = 3, tcResultado = 4, tcOutro = 5);

   // Identificar uso da conta
   TCategoriaConta = (ccDebito, ccCredito, cc);

   // Modo de inserção
   TTipoExecucao = (teInsert, teDelete, teUpdate, teInsertPai);

   TExecucaoLancamento = class(AExecucao)
      strict private
         FColigada: Integer;
         FContaDebito: Integer;
         FChave: Integer;
         FDataMovimento: String;
         FHistorico: Integer;
         FValor: Double;
         FContaCredito: Integer;
         FComplemento: String;
         FCriterio: Integer;
         FTipoExecucao: TTipoExecucao;
         FOperacao: String;
         FTitulo: Integer;

      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

      public
         constructor Create(TipoExecucao: TTipoExecucao; Chave: Integer);

         property Coligada: Integer read FColigada write FColigada;
         property Chave: Integer read FChave write FChave;
         property DataMovimento: String read FDataMovimento write FDataMovimento;
         property ContaDebito: Integer read FContaDebito write FContaDebito;
         property ContaCredito: Integer read FContaCredito write FContaCredito;
         property Valor: Double read FValor write FValor;
         property Historico: Integer read FHistorico write FHistorico;
         property Complemento: String read FComplemento write FComplemento;
         property Criterio: Integer read FCriterio write FCriterio;
         property TipoExecucao: TTipoExecucao read FTipoExecucao write FTipoExecucao;
         property Operacao: String read FOperacao write FOperacao;
         property Titulo: Integer read FTitulo write FTitulo;
   end;

   TExecucaoCompromisso = class(AExecucao)
      strict private
         FFornecedor: Integer;
         FNumeroDocumento: String;
         FNumeroParcela: String;
         FDataVencimento: String;
         FTipoTitulo: Integer;
         FValor: Double;
         FColigada: Integer;
         FTipoExecucao: TTipoExecucao;
         FTitulo: Integer;
         FSituacao: Integer;
         FFormaPagamento: Integer;
         FDespesa: String;
         FHistorico: String;
         FHistoricoContabil: Integer;
         FDataEmissaoNota: String;
         FDataLancamento: String;
         FDataCompetencia: String;
         FDataProvavelPagamento: String;
         FTituloPrincipal: Integer;
         FValorTotal: Double;

      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;
           
      public
         constructor Create(TipoExecucao: TTipoExecucao);

         { Esta função é usado para alterar o código do título principal,
         quando é inserido o título principal }
         function InsereCodigoTituloPrincipal(const last_insert_id: Integer; var qyExecucao: TUMZQuery): Boolean;

         {cd_pessoa}
         property Fornecedor: Integer read FFornecedor write FFornecedor;
         {nr_documento}
         property NumeroDocumento: String read FNumeroDocumento write FNumeroDocumento;
         {nr_parcela}
         property NumeroParcela: String read FNumeroParcela write FNumeroParcela;
         {cd_tipo_titulo}
         property TipoTitulo: Integer read FTipoTitulo write FTipoTitulo;
         {vl_despesa}
         property Valor: Double read FValor write FValor;
         {cd_coligada}
         property Coligada: Integer read FColigada write FColigada;
         { Forma de execução do SQL }
         property TipoExecucao: TTipoExecucao read FTipoExecucao write FTipoExecucao;
         { cd_titulo, preenchido com LAST_INSERT_ID após a execução
         (usado para dependência) }
         property Titulo: Integer read FTitulo write FTitulo;
         { cd_situacao }
         property Situacao: Integer read FSituacao write FSituacao;
         { cd_forma_pgto }
         property FormaPagamento: Integer read FFormaPagamento write FFormaPagamento;
         { ds_despesa }
         property Despesa: String read FDespesa write FDespesa;
         { ds_historico }
         property Historico: String read FHistorico write FHistorico;
         { cd_historico = fin_cp_historicos.cd_historico }
         property HistoricoContabil: Integer read FHistoricoContabil write FHistoricoContabil;
         { dt_emissao_nota }
         property DataEmissaoNota: String read FDataEmissaoNota write FDataEmissaoNota;
         { dt_lancamento }
         property DataLancamento: String read FDataLancamento write FDataLancamento;
         { dt_competencia }
         property DataCompetencia: String read FDataCompetencia write FDataCompetencia;
         { dt_vencimento }
         property DataVencimento: String read FDataVencimento write FDataVencimento;
         { dt_provavel_pgto }
         property DataProvavelPagamento: String read FDataProvavelPagamento write FDataProvavelPagamento;
         { cd_titulo_principal }
         property TituloPrincipal: Integer read FTituloPrincipal write FTituloPrincipal;
         { vl_total_despesa }
         property ValorTotal: Double read FValorTotal write FValorTotal;
   end;

   TExecucaoRateioLC = class(AExecucao)
      strict private
         FCentro: Integer;
         FValor: Double;
         FTipoExecucao: TTipoExecucao;
         FLancamento: Integer;
         FChave: Integer;
         
      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

      public
         constructor Create(TipoExecucao: TTipoExecucao);

         property Centro: Integer read FCentro write FCentro;
         property Valor: Double read FValor write FValor;
         property TipoExecucao: TTipoExecucao read FTipoExecucao write FTipoExecucao;
         property Lancamento: Integer read FLancamento write FLancamento;

         // Usado para exclusão dos rateios
         property Chave: Integer read FChave write FChave;
   end;


   TExecucaoRateioCP = class(AExecucao)
      strict private
         FCentro: Integer;
         FValor: Double;
         FColigada: Integer;
         FConta: Integer;
         FTipoExecucao: TTipoExecucao;
         FTitulo: Integer;
         
      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

      public
         constructor Create(TipoExecucao: TTipoExecucao);

         property Centro: Integer read FCentro write FCentro;
         property Valor: Double read FValor write FValor;
         property Conta: Integer read FConta write FConta;
         property Coligada: Integer read FColigada write FColigada;
         property Titulo: Integer read FTitulo write FTitulo;
         property TipoExecucao: TTipoExecucao read FTipoExecucao write FTipoExecucao;
   end;


implementation

uses uIUMDataModule;

{ TLancamentos }

constructor TExecucaoLancamento.Create(TipoExecucao: TTipoExecucao; Chave: Integer);
begin
   Self.TipoExecucao := TipoExecucao;
   Self.Chave := Chave;
end;

function TExecucaoLancamento.GetSQL: String;
const
   SQL_INSERE_LANCAMENTOS =
      ' INSERT INTO fin_contabil ( '+
      ' 	 cd_coligada, '+
      ' 	 cd_chave, '+
      ' 	 dt_movimento, '+
      ' 	 cd_debito, '+
      ' 	 cd_credito, '+
      ' 	 vl_movimento, '+
      '   cd_historico, '+
      '   ds_historico, '+
      '   cd_origem, '+
      '   cd_operacao, '+
      '   cd_titulo, '+
      '   cd_usuario, '+
      '   cd_criterio_apropria '+
      ' ) VALUES ( '+
      ' 	:cd_coligada, '+
      '  :cd_chave, '+
      ' 	:dt_movimento, '+
      ' 	:cd_debito, '+
      ' 	:cd_credito, '+
      ' 	:vl_movimento, '+
      ' 	:cd_historico, '+
      ' 	:ds_historico, '+
      ' 	:cd_origem, '+
      ' 	:cd_operacao, '+
      ' 	:cd_titulo, '+
      ' 	:cd_usuario, '+
      ' 	:cd_criterio_apropria '+
      ' ) ';
      
   SQL_DELETE_LANCAMENTOS =
      ' DELETE '+
      ' FROM '+
      '  fin_contabil '+
      ' WHERE '+
      '  cd_chave = :cd_chave ';
      
begin
   if Self.TipoExecucao = teDelete then
   begin
      Result := SQL_DELETE_LANCAMENTOS;
      Exit;
   end;

   Result := SQL_INSERE_LANCAMENTOS;
end;

procedure TExecucaoLancamento.PrepareParams(var Parametros: TParams);
begin

   if Self.TipoExecucao = teDelete then
   begin
      Parametros.ParamByName('cd_chave').AsInteger := Self.Chave;
      Exit;
   end;

   Parametros.ParamByName('cd_coligada').AsInteger := Self.Coligada;
   Parametros.ParamByName('cd_chave').AsInteger := Self.Chave;
   Parametros.ParamByName('dt_movimento').AsString := Self.DataMovimento;
   Parametros.ParamByName('cd_debito').AsInteger := Self.ContaDebito;
   Parametros.ParamByName('cd_credito').AsInteger := Self.ContaCredito;
   Parametros.ParamByName('vl_movimento').AsFloat := Self.Valor;
   Parametros.ParamByName('cd_historico').AsInteger := Self.Historico;
   Parametros.ParamByName('ds_historico').AsString := Self.Complemento;
   Parametros.ParamByName('cd_origem').AsString := 'CO';
   Parametros.ParamByName('cd_operacao').AsString := Self.Operacao;
   Parametros.ParamByName('cd_usuario').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
   Parametros.ParamByName('cd_criterio_apropria').AsInteger := Self.Criterio;

   if Self.Dependencia <> nil then
   begin
      Parametros.ParamByName('cd_titulo').AsInteger := Self.Dependencia.LastInsertID;
   end
   else
   begin
      Parametros.ParamByName('cd_titulo').AsInteger := 0;

      if (Self.Operacao = 'MV') or
         (Self.Operacao = 'MS') then
      begin
         Parametros.ParamByName('cd_titulo').AsInteger := Self.Titulo;
      end;
   end;
end;

{ TExecucaoCompromisso }

constructor TExecucaoCompromisso.Create(TipoExecucao: TTipoExecucao);
begin
   Self.TipoExecucao := TipoExecucao;

   { Caso seja o titulo principal de um compromisso, quando o mesmo for
   inserido deve ser alterado o cd_titulo_principal do mesmo para o novo código
   gerado }
   if Self.TipoExecucao = teInsertPai then
   begin
      Self.FOnAfterSQLExecuteWithLastInsert := Self.InsereCodigoTituloPrincipal;
   end;
end;

function TExecucaoCompromisso.GetSQL: String;
const
   SQL_INSERE_COMPROMISSO =
      ' INSERT INTO fin_contas_pagar ( '+
      ' 	cd_pessoa, '+
      ' 	nr_documento, '+
      ' 	nr_parcela, '+
      ' 	dt_vencimento, '+
      ' 	cd_tipo_titulo, '+
      ' 	vl_despesa, '+
      ' 	cd_coligada, '+
      ' 	cd_situacao, '+
      ' 	cd_forma_pgto, '+
      '  ds_despesa, '+
      '  ds_historico, '+
      '  cd_historico, '+
      '  dt_emissao_nota, '+
      '  dt_lancamento, '+
      '  dt_competencia, '+
      '  dt_provavel_pgto, '+
      '  vl_total_despesa, '+
      '  cd_titulo_principal '+
      ' ) VALUES ( '+
      ' 	:cd_pessoa, '+
      ' 	:nr_documento, '+
      ' 	:nr_parcela, '+
      ' 	:dt_vencimento, '+
      ' 	:cd_tipo_titulo, '+
      ' 	:vl_despesa, '+
      ' 	:cd_coligada, '+
      ' 	:cd_situacao, '+
      ' 	:cd_forma_pgto, '+
      '  :ds_despesa, '+
      '  :ds_historico, '+
      '  :cd_historico, '+
      '  :dt_emissao_nota, '+
      '  :dt_lancamento, '+
      '  :dt_competencia, '+
      '  :dt_provavel_pgto, '+
      '  :vl_total_despesa, '+
      '  :cd_titulo_principal '+
      ' ); ';
      
   SQL_DELETE_COMPROMISSO =
      ' DELETE '+
      ' FROM '+
      ' 	fin_contas_pagar '+
      ' WHERE '+
      ' 	cd_titulo = :cd_titulo '+
      '  OR cd_titulo_principal = :cd_titulo ';

begin
   if Self.TipoExecucao = teDelete then
   begin
      Result := SQL_DELETE_COMPROMISSO;
      Exit;
   end;

   Result := SQL_INSERE_COMPROMISSO;
end;

function TExecucaoCompromisso.InsereCodigoTituloPrincipal(
  const last_insert_id: Integer; var qyExecucao: TUMZQuery): Boolean;
const
   SQL_UPDATE_COMPROMISSO = '  '+
      ' UPDATE '+
      '  fin_contas_pagar '+
      ' SET '+
      '  cd_titulo_principal = :cd_titulo_principal '+
      ' WHERE '+
      '  cd_titulo = :cd_titulo ';
begin
   qyExecucao.SQL.Text := SQL_UPDATE_COMPROMISSO;

   qyExecucao.ParamByName('cd_titulo_principal').AsInteger := last_insert_id;
   qyExecucao.ParamByName('cd_titulo').AsInteger := last_insert_id;

   qyExecucao.ExecSQL;
end;

procedure TExecucaoCompromisso.PrepareParams(var Parametros: TParams);
begin
   if Self.TipoExecucao = teDelete then
   begin
      Parametros.ParamByName('cd_titulo').AsInteger := Self.Titulo;
      Exit;
   end;

   Parametros.ParamByName('cd_pessoa').AsInteger := Self.Fornecedor;
   Parametros.ParamByName('nr_documento').AsString := Self.NumeroDocumento;
   Parametros.ParamByName('nr_parcela').AsString := Self.NumeroParcela;
   Parametros.ParamByName('dt_vencimento').AsString := Self.DataVencimento;
   Parametros.ParamByName('cd_tipo_titulo').AsInteger := Self.TipoTitulo;
   Parametros.ParamByName('vl_despesa').AsFloat := Self.Valor;
   Parametros.ParamByName('cd_coligada').AsInteger := Self.Coligada;
   Parametros.ParamByName('cd_situacao').AsInteger := Self.Situacao;
   Parametros.ParamByName('cd_forma_pgto').AsInteger := Self.FormaPagamento;
   Parametros.ParamByName('ds_despesa').AsString := Self.Despesa;
   Parametros.ParamByName('ds_historico').AsString := Self.Historico;
   Parametros.ParamByName('cd_historico').AsInteger := Self.HistoricoContabil;
   Parametros.ParamByName('dt_emissao_nota').AsString := Self.DataEmissaoNota;
   Parametros.ParamByName('dt_lancamento').AsString := Self.DataLancamento;
   Parametros.ParamByName('dt_competencia').AsString := Self.DataCompetencia;
   Parametros.ParamByName('dt_provavel_pgto').AsString := Self.DataProvavelPagamento;
   Parametros.ParamByName('vl_total_despesa').AsFloat := Self.ValorTotal;

   if not (Self.TipoExecucao = teInsertPai) then
   begin
      Parametros.ParamByName('cd_titulo_principal').AsInteger := 0;
   end;

   if not (Self.TipoExecucao = teInsertPai) and
      Assigned(Self.Dependencia) then
   begin
      Parametros.ParamByName('cd_titulo_principal').AsInteger := Self.Dependencia.LastInsertID;
   end;
end;

{ TExecucaoRateioLC }

constructor TExecucaoRateioLC.Create(TipoExecucao: TTipoExecucao);
begin
   Self.TipoExecucao := TipoExecucao;
end;

function TExecucaoRateioLC.GetSQL: String;
const
   SQL_INSERE_CONTABIL_CC =
      ' INSERT INTO fin_contabil_cc ( '+
      ' 	cd_lancamento, '+
      ' 	cd_centro, '+
      ' 	vl_movimento '+
      ' ) '+
      ' VALUES '+
      ' ( '+
      ' 	:cd_lancamento, '+
      ' 	:cd_centro, '+
      ' 	:vl_movimento '+
      ' ) ';

   SQL_DELETE_CONTABIL_CC =
      ' DELETE '+
      ' FROM '+
      ' 	fin_contabil_cc '+
      ' WHERE '+
      ' 	cd_lancamento IN (SELECT cd_lancamento FROM fin_contabil WHERE cd_chave = :cd_chave)';
begin
   if Self.TipoExecucao = teDelete then
   begin
      Result := SQL_DELETE_CONTABIL_CC;
      Exit;
   end;

   Result := SQL_INSERE_CONTABIL_CC;
end;

procedure TExecucaoRateioLC.PrepareParams(var Parametros: TParams);
begin

   if Self.TipoExecucao = teDelete then
   begin
      Parametros.ParamByName('cd_chave').AsInteger := Self.Chave;
      Exit;
   end;

   Parametros.ParamByName('cd_lancamento').AsInteger := Self.Dependencia.LastInsertID;
   Parametros.ParamByName('cd_centro').AsInteger := Self.Centro;
   Parametros.ParamByName('vl_movimento').AsFloat := Self.Valor;
end;

{ TExecucaoRateioCP }

constructor TExecucaoRateioCP.Create(TipoExecucao: TTipoExecucao);
begin
   Self.TipoExecucao := TipoExecucao;
end;

function TExecucaoRateioCP.GetSQL: String;
const
   SQL_INSERE_APROPRIA_CP =
      ' INSERT INTO fin_apropria_cp ( '+
      ' 	cd_titulo, '+
      ' 	cd_coligada, '+
      ' 	cd_conta, '+
      ' 	cd_centro, '+
      ' 	vl_movimento '+
      ' ) '+
      ' VALUES '+
      ' ( '+
      ' 	:cd_titulo, '+
      ' 	:cd_coligada, '+
      ' 	:cd_conta, '+
      ' 	:cd_centro, '+
      ' 	:vl_movimento '+
      ' ) ';
   SQL_DELETE_APROPRIA_CP =
      ' DELETE '+
      ' FROM '+
      ' 	fin_apropria_cp '+
      ' WHERE '+
      ' 	cd_titulo = :cd_titulo ';      
begin

   if Self.TipoExecucao = teDelete then
   begin
      Result := SQL_DELETE_APROPRIA_CP;
      Exit;
   end;

   Result := SQL_INSERE_APROPRIA_CP;
end;

procedure TExecucaoRateioCP.PrepareParams(var Parametros: TParams);
begin

   if Self.TipoExecucao = teDelete then
   begin
      Parametros.ParamByName('cd_titulo').AsInteger := Self.Titulo;
      Exit;
   end;

   Parametros.ParamByName('cd_titulo').AsInteger := Self.Dependencia.LastInsertID;
   Parametros.ParamByName('cd_coligada').AsInteger := Self.Coligada;
   Parametros.ParamByName('cd_conta').AsInteger := Self.Conta;
   Parametros.ParamByName('cd_centro').AsInteger := Self.Centro;
   Parametros.ParamByName('vl_movimento').AsFloat := Self.Valor;
end;

end.
