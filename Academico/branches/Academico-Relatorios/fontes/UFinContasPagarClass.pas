unit UFinContasPagarClass;

{Classe para manipulação de dados na tabela fin_contas_pagar}

interface

uses
   Classes, udm, UZDataset, ZAbstractRODataset, SysUtils, General, ZDbcIntfs,
   UZDbcFuncs;

Type
  TFinContasPagar = class(TObject)

  private
    Campos  : TStringList;

  protected

  public
    constructor Create();
    destructor Destroy; override;

    procedure defineCampos();
    procedure setValorCampo( ds_campo: string; ds_valor: string );
    procedure inserir();
    procedure atualizar();
    procedure atualizaCodigoPrincipal(cd_compromisso:string; cd_compromisso_principal:string);
    procedure atualizarTodosCabecalhos();
    procedure atualizaTurma();
    function retorna_campos() : string;
    function retorna_valores() : string;
    function getValorCampo( ds_campo: string) : string;
end;

implementation

{ TFinContasPagar }

procedure TFinContasPagar.atualizaCodigoPrincipal(cd_compromisso,
  cd_compromisso_principal: string);
var
   qyFinContasPagar  : TUMZQuery;
begin
   try
      DM.CriarConsulta( qyFinContasPagar );
      qyFinContasPagar.Close();
      qyFinContasPagar.SQL.Clear();
      qyFinContasPagar.SQL.Add( 'UPDATE fin_contas_pagar ' );
      qyFinContasPagar.SQL.Add( ' SET ');
      qyFinContasPagar.SQL.Add( '  cd_titulo_principal = ' + cd_compromisso_principal);
      qyFinContasPagar.SQL.Add( ' WHERE ' );
      qyFinContasPagar.SQL.Add( '  cd_titulo = ' +  cd_compromisso );
      qyFinContasPagar.SQL.Add( '  AND cd_coligada = ' +  Self.getValorCampo('cd_coligada') );
      qyFinContasPagar.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinContasPagar, E );
   end;

   FreeAndNil( qyFinContasPagar );
end;

procedure TFinContasPagar.atualizar;

   function GetFields: string;
   var
      I: Integer;
   begin
      for I := 0 to Campos.Count - 1 do
      begin
         if Campos.Names[I] = 'valor_pagar' then Continue;

         if Result <> '' then
         begin
            Result := Result + #44; // código da vírgula
         end;

         if (Campos.ValueFromIndex[I] <> 'null') then
         begin
            Result := Result +
               Format('%s = %s', [
                  Campos.Names[I],
                  QuotedStr(Campos.ValueFromIndex[I])
               ]);
         end
         else
         begin
            Result := Result +
               Format('%s = %s', [
                  Campos.Names[I],
                  'null'
               ]);
         end;
      end;
   end;

const
   SSQLUpdTitulos =
      'UPDATE FIN_CONTAS_PAGAR SET %s WHERE CD_TITULO = ? AND CD_COLIGADA = ?';
var
   SQL: string;
   Stmt: IZPreparedStatement;
begin
   SQL := Format(SSQLUpdTitulos, [GetFields]);
   Stmt := PrepareStatement(SQL);
   try
      Stmt.SetString(1, Campos.Values['cd_titulo']);
      Stmt.SetString(2, Campos.Values['cd_coligada']);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
   end;
end;

procedure TFinContasPagar.atualizarTodosCabecalhos;
var
   qyFinContasPagar  : TUMZQuery;
begin
   try
      DM.CriarConsulta( qyFinContasPagar );
      qyFinContasPagar.Close();
      qyFinContasPagar.SQL.Clear();
      qyFinContasPagar.SQL.Add( 'UPDATE fin_contas_pagar ' );
      qyFinContasPagar.SQL.Add( ' SET ');
      qyFinContasPagar.SQL.Add( '  cd_pessoa = :cd_pessoa, ');
      qyFinContasPagar.SQL.Add( '  cd_tipo_titulo = :cd_tipo_titulo, ');
      qyFinContasPagar.SQL.Add( '  nr_documento = :nr_documento, ');
      qyFinContasPagar.SQL.Add( '  dt_emissao_nota = :dt_emissao_nota, ');
      qyFinContasPagar.SQL.Add( '  dt_competencia = :dt_competencia, ');
      qyFinContasPagar.SQL.Add( '  sn_nf_entregue = :sn_nf_entregue, ');
      qyFinContasPagar.SQL.Add( '  vl_total_despesa = :vl_total_despesa, ');
      qyFinContasPagar.SQL.Add( '  ds_historico = :ds_historico ');
      //qyFinContasPagar.SQL.Add( '  ds_observacao = :ds_observacao ');
      qyFinContasPagar.SQL.Add( ' WHERE ' );
      qyFinContasPagar.SQL.Add( '  cd_titulo_principal = '  + Self.getValorCampo('cd_titulo_principal') );
      qyFinContasPagar.SQL.Add( '  AND cd_coligada = '      + Self.getValorCampo('cd_coligada') );

      qyFinContasPagar.ParamByName('cd_pessoa').AsInteger := StrToInt(Self.getValorCampo('cd_pessoa'));
      qyFinContasPagar.ParamByName('cd_tipo_titulo').AsInteger := StrToInt(Self.getValorCampo('cd_tipo_titulo'));
      qyFinContasPagar.ParamByName('nr_documento').AsString := Self.getValorCampo('nr_documento');
      qyFinContasPagar.ParamByName('dt_emissao_nota').AsString := Self.getValorCampo('dt_emissao_nota');
      qyFinContasPagar.ParamByName('dt_competencia').AsString := Self.getValorCampo('dt_competencia');
      qyFinContasPagar.ParamByName('sn_nf_entregue').AsInteger := StrToInt(Self.getValorCampo('sn_nf_entregue'));
      qyFinContasPagar.ParamByName('vl_total_despesa').AsString := Self.getValorCampo('vl_total_despesa');
      qyFinContasPagar.ParamByName('ds_historico').AsString := Self.getValorCampo('ds_historico');
      //qyFinContasPagar.ParamByName('ds_observacao').AsString := Self.getValorCampo('ds_observacao');

      qyFinContasPagar.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinContasPagar, E );
   end;

   FreeAndNil( qyFinContasPagar );
end;

procedure TFinContasPagar.atualizaTurma();
var
   qyFinContasPagar  : TUMZQuery;
begin
   try
      DM.CriarConsulta( qyFinContasPagar );

      qyFinContasPagar.Close();

      qyFinContasPagar.SQL.Clear();

      qyFinContasPagar.SQL.Add( ' UPDATE fin_contas_pagar ' );
      qyFinContasPagar.SQL.Add( ' SET ');
      qyFinContasPagar.SQL.Add( '   cd_turma = :cd_turma, ');
      qyFinContasPagar.SQL.Add( '   cd_disciplina = :cd_disciplina, ');
      qyFinContasPagar.SQL.Add( '   nr_anosemestre_disciplina = :nr_anosemestre_disciplina ');
      qyFinContasPagar.SQL.Add( ' WHERE ' );
      qyFinContasPagar.SQL.Add( '   cd_titulo_principal = '  + Self.getValorCampo('cd_titulo_principal') );
      qyFinContasPagar.SQL.Add( '   AND cd_coligada = '      + Self.getValorCampo('cd_coligada') );

      qyFinContasPagar.ParamByName('cd_turma').AsString :=
         Self.getValorCampo('cd_turma');

      qyFinContasPagar.ParamByName('cd_disciplina').AsInteger :=
         StrToInt(Self.getValorCampo('cd_disciplina'));

      qyFinContasPagar.ParamByName('nr_anosemestre_disciplina').AsInteger :=
         StrToInt(Self.getValorCampo('nr_anosemestre_disciplina'));

      qyFinContasPagar.ExecSQL();
      
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinContasPagar, E );
   end;

   FreeAndNil( qyFinContasPagar );
end;

constructor TFinContasPagar.Create;
begin
   //define os campos da tabela
   defineCampos();
end;

{ao destroir o objeto libera as listas}
destructor TFinContasPagar.Destroy;
begin
   inherited;
   Campos.Free;
end;

{retorna o valor do campo}
function TFinContasPagar.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TFinContasPagar.inserir();
var
   qyFinContasPagar  : TUMZQuery;
   ds_campos         : string;
   ds_valores        : string;
begin
   ds_campos   := Self.retorna_campos();
   ds_valores  := Self.retorna_valores();

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
   begin
      DM.db.StartTransaction;
      DM.db.ExecuteDirect('ALTER SESSION SET NLS_DATE_FORMAT=''YYYY-MM-DD HH24:MI:SS''');
      Dm.db.ExecuteDirect('ALTER SESSION SET NLS_TIMESTAMP_FORMAT=''YYYY-MM-DD HH24:MI:SS''');
   end;

   try
      DM.CriarConsulta( qyFinContasPagar );
      qyFinContasPagar.Close();
      qyFinContasPagar.SQL.Clear();
      qyFinContasPagar.SQL.Add( 'INSERT INTO FIN_CONTAS_PAGAR ' );
      qyFinContasPagar.SQL.Add( ds_campos );
      qyFinContasPagar.SQL.Add( ' VALUES ' );
      qyFinContasPagar.SQL.Add( ds_valores );

      if DM.db.Protocol = DB_PROTOCOL_MYSQL then
      begin
         qyFinContasPagar.ExecSQL();
      end
      else
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      begin
         DM.db.ExecuteDirect(qyFinContasPagar.SQL.Text);
         DM.db.Commit;
      end;
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinContasPagar, E );
   end;

   FreeAndNil( qyFinContasPagar );
end;

function TFinContasPagar.retorna_campos: string;
var
   i           : integer;
   ds_campos   : string;
begin
   ds_campos   := '( ';

   for i := 0 to Campos.Count - 1 do
   begin
      if Campos.Names[i] = 'valor_pagar' then continue;

      ds_campos := ds_campos + Campos.Names[i];

      if i <> Campos.Count - 1 then
      begin
         ds_campos := ds_campos + ', ';
      end;
   end;
   ds_campos := ds_campos + ' )';

   Result := ds_campos;
end;

function TFinContasPagar.retorna_valores: string;
var
   i           : integer;
   ds_valores  : string;
begin
   ds_valores  := '( ';

   for i := 0 to Campos.Count - 1 do
   begin
      if Campos.Names[i] = 'valor_pagar' then continue;

      ds_valores := ds_valores + QuotedStr(Campos.ValueFromIndex[i]);

      if i <> Campos.Count - 1 then
      begin
         ds_valores := Concat(ds_valores, ', ');
      end;
   end;
   ds_valores := ds_valores + ' )';

   Result := ds_valores;
end;

{seta o valor do campo}
procedure TFinContasPagar.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

{lista todos os campos da tabela fin_contas_pagar}
procedure TFinContasPagar.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['cd_titulo']                   := '';
   Campos.Values['cd_coligada']                 := '';
   Campos.Values['cd_pessoa']                   := '';
   Campos.Values['ds_despesa']                  := '';
   Campos.Values['nr_documento']                := '';
   Campos.Values['sn_nf_entregue']              := '';
   Campos.Values['nr_parcela']                  := '';
   Campos.Values['dt_emissao_nota']             := '';
   Campos.Values['dt_lancamento']               := '';
   Campos.Values['dt_competencia']              := '';
   Campos.Values['dt_vencimento']               := '';
   Campos.Values['dt_provavel_pgto']            := '';
   Campos.Values['dt_pagamento']                := '';
   Campos.Values['vl_despesa']                  := '';
   Campos.Values['cd_situacao']                 := '';
   Campos.Values['sn_previsao']                 := 'N'; //valor padrão caso não seja selecionado
   Campos.Values['cd_tipo_titulo']              := '';
   Campos.Values['tp_entrada_saida']            := '';
   Campos.Values['cd_forma_pgto']               := '';
   Campos.Values['nr_cheque']                   := '';
   Campos.Values['cd_caixa']                    := '';
   Campos.Values['cd_titulo_origem']            := '';
   Campos.Values['cd_autoriza']                 := '';
   Campos.Values['ds_observacao']               := '';
   Campos.Values['cd_titulo_principal']         := '';
   Campos.Values['ds_cod_barras']               := '';
   Campos.Values['vl_abatimento']               := '';
   Campos.Values['vl_desconto']                 := '';
   Campos.Values['vl_mora']                     := '';
   Campos.Values['vl_multa']                    := '';
   Campos.Values['ds_historico']                := '';
   Campos.Values['nr_banco']                    := '';
   Campos.Values['nr_agencia']                  := '';
   Campos.Values['nr_conta']                    := '';
   Campos.Values['vl_total_despesa']            := '';
   Campos.Values['cd_turma']                    := '';
   Campos.Values['cd_disciplina']               := '';
   Campos.Values['nr_anosemestre_disciplina']   := '';
   Campos.Values['cd_remessa']                  := '';
end;

end.
