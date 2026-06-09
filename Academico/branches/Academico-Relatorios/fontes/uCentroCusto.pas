unit uCentroCusto;

interface

uses
   UZDataset, uDM, SysUtils;

type

   TCentroCusto = class(TObject)
      strict private
      
         cd_centro,
         cd_grupo,
         cd_centro_pai,
         cd_coligada_matriz: Integer;

         tp_centro: Integer;

         sn_ativo: Boolean;

         cd_classificacao: String;

         nr_tipo_regra: Integer;

         ds_centro,
         ds_sql,
         ds_observacao: String;

         // Setters
         procedure SetCentroPai(const Value: Integer);
         procedure SetColigadaMatriz(const Value: Integer);
         procedure setIsAtivo(const Value: Boolean);
         procedure SetTipoCentro(const Value: Integer);
         procedure SetGrupo(const Value: Integer);
         procedure SetCodigoCentro(const Value: Integer);
         procedure SetClassificacao(const Value: String);
         procedure SetDescricao(const Value: String);
         procedure SetObservacao(const Value: String);
         procedure SetSQL(const Value: String);
         procedure SetTipoRegra(const Value: Integer);

         procedure LoadDados(cd_centro: Integer);

      public

         InserirBanco,
         grupoExtensoSetado: Boolean;

         FGrupoExtenso: String;

         constructor Create(cd_centro: Integer; CarregarDados: Boolean = True);

         function getTipoExtenso(): String;
         function getGrupoExtenso(): String;

         property Centro: Integer read cd_centro write SetCodigoCentro;
         property Grupo: Integer read cd_grupo write SetGrupo;
         property CentroPai: Integer read cd_centro_pai write SetCentroPai;
         property ColigadaMatriz: Integer read cd_coligada_matriz write SetColigadaMatriz;
         property TipoCentro: Integer read tp_centro write SetTipoCentro;
         property Ativo: Boolean read sn_ativo write setIsAtivo;
         property Classificacao: String read cd_classificacao write SetClassificacao;
         property TipoRegra: Integer read nr_tipo_regra write SetTipoRegra;
         property Descricao: String read ds_centro write SetDescricao;
         property SQL: String read ds_sql write SetSQL;
         property Observacao: String read ds_observacao write SetObservacao;

   end;

const

   SQL_BUSCA_GRUPO_EXTENSO =
      ' SELECT '+
      ' 	ds_grupo '+
      ' FROM '+
      ' 	fin_centro_grupo '+
      ' WHERE '+
      ' 	cd_grupo = :cd_grupo ';

implementation

uses uIUMDataModule;

{ TCentroCusto }

constructor TCentroCusto.Create(cd_centro: Integer; CarregarDados: Boolean);
begin
   if CarregarDados then
   begin
      LoadDados(cd_centro);
   end;
end;

function TCentroCusto.getGrupoExtenso: String;
var
   qryBuscaGrupoExtenso: TUMZReadOnlyQuery;
begin
   if grupoExtensoSetado then
   begin
      Result := FGrupoExtenso;
      Exit;
   end;

   DM.CriarConsulta(qryBuscaGrupoExtenso);

   qryBuscaGrupoExtenso.SQL.Text := SQL_BUSCA_GRUPO_EXTENSO;
   qryBuscaGrupoExtenso.ParamByName('cd_grupo').AsInteger := cd_centro;
   qryBuscaGrupoExtenso.Open;

   FGrupoExtenso := qryBuscaGrupoExtenso.FieldByName('ds_grupo').AsString;

   Result := FGrupoExtenso;

   FreeAndNil(qryBuscaGrupoExtenso);
end;

function TCentroCusto.getTipoExtenso: String;
begin

   if tp_centro = 1 then
   begin
      Result := 'Analítico';
   end;

   if tp_centro = 2 then
   begin
      Result := 'Sintético';
   end;

end;

procedure TCentroCusto.LoadDados(cd_centro: Integer);
var
   qryLoadDados: TUMZReadOnlyQuery;

const
   SQL_LOAD_INFORMACOES =
      ' SELECT ' +
      '  f.cd_centro, ' +
      '  f.cd_coligada_matriz, ' +
      '  f.ds_centro, ' +
      '  f.ds_observacao, ' +
      '  f.cd_classificacao, ' +
      '  f.tp_centro, ' +
      '  f.cd_grupo, ' +
      '  f.sn_ativo, ' +
      '  f.cd_centro_pai, ' +
      '  f.nr_tipo_regra, ' +
      '  f.ds_sql ' +
      ' FROM ' +
      '  fin_config_centro_custos AS f ' +
      ' WHERE ' +
      '  f.cd_centro = :cd_centro ' +
      '  AND f.cd_coligada_matriz = :cd_coligada_matriz ';

begin
   DM.CriarConsulta(qryLoadDados);

   qryLoadDados.SQL.Text := SQL_LOAD_INFORMACOES;

   qryLoadDados.ParamByName('cd_centro').AsInteger := cd_centro;
   qryLoadDados.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   qryLoadDados.Open;

   SetCodigoCentro(cd_centro);
   SetColigadaMatriz(DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

   SetCentroPai(qryLoadDados.FieldByName('cd_centro_pai').AsInteger);
   setIsAtivo((qryLoadDados.FieldByName('sn_ativo').AsInteger = 1));
   SetTipoCentro(qryLoadDados.FieldByName('tp_centro').AsInteger);
   SetGrupo(qryLoadDados.FieldByName('cd_grupo').AsInteger);
   SetClassificacao(qryLoadDados.FieldByName('cd_classificacao').AsString);
   SetDescricao(qryLoadDados.FieldByName('ds_centro').AsString);
   SetObservacao(qryLoadDados.FieldByName('ds_observacao').AsString);
   SetSQL(qryLoadDados.FieldByName('ds_sql').AsString);
   SetTipoRegra(qryLoadDados.FieldByName('nr_tipo_regra').AsInteger);

   FGrupoExtenso := '';
end;

procedure TCentroCusto.SetCentroPai(const Value: Integer);
begin
   cd_centro_pai := Value;
end;

procedure TCentroCusto.SetClassificacao(const Value: String);
begin
   cd_classificacao := Value;
end;

procedure TCentroCusto.SetCodigoCentro(const Value: Integer);
begin
   cd_centro := Value;
end;

procedure TCentroCusto.SetColigadaMatriz(const Value: Integer);
begin
   cd_coligada_matriz := Value;
end;

procedure TCentroCusto.SetDescricao(const Value: String);
begin
   ds_centro := Value;
end;

procedure TCentroCusto.SetGrupo(const Value: Integer);
begin
   cd_grupo := Value;
end;

procedure TCentroCusto.setIsAtivo(const Value: Boolean);
begin
   sn_ativo := Value;
end;

procedure TCentroCusto.SetObservacao(const Value: String);
begin
   ds_observacao := Value;
end;

procedure TCentroCusto.SetSQL(const Value: String);
begin
   ds_sql := Value;
end;

procedure TCentroCusto.SetTipoCentro(const Value: Integer);
begin
   tp_centro := Value;
end;

procedure TCentroCusto.SetTipoRegra(const Value: Integer);
begin
   nr_tipo_regra := Value;
end;

end.
