unit uCompromisso_cadastro_acoes;

interface

uses udm, UZDataset, SysUtils, Dialogs, UZDbcFuncs, ZDbcIntfs;

procedure alteraMsgAutorizacao( cd_autoriza: integer; msg: string );
procedure alteraHistoricoParcela( ds_hitorico : string; cd_titulo : string );
procedure alteraHistoricoTesouraria( ds_hitorico : string; cd_titulo : string );
function busca_turma_disciplina( vl_pessoa:string; vl_turma : string; vl_disciplina : string; vl_anosemestre: string ) : string;

implementation

procedure alteraMsgAutorizacao( cd_autoriza: integer; msg: string );
var
   qyContasPagarAutoriza : TUMZQuery;
begin
   if Trim(msg) = '' then
   begin
      msg := 'O histórico do compromisso foi alterado. Por favor efetue nova ' +
      'autorização.';
   end;

   DM.CriarConsulta( qyContasPagarAutoriza );

   qyContasPagarAutoriza.SQL.Text := 'UPDATE fin_contas_pagar_autoriza ';
   qyContasPagarAutoriza.SQL.add( Concat('SET me_autoriza = ', QuotedStr(msg)));
   qyContasPagarAutoriza.SQL.Add( ' WHERE cd_autoriza = :cd_autoriza' );

   qyContasPagarAutoriza.ParamByName('cd_autoriza').AsInteger := cd_autoriza;

   qyContasPagarAutoriza.ExecSQL();

   FreeAndNil( qyContasPagarAutoriza );
end;

procedure alteraHistoricoParcela( ds_hitorico : string; cd_titulo : string );
var
   qyCompromisso : TUMZQuery;
begin
   //atualiza histório do compromisso
   DM.CriarConsulta( qyCompromisso );

   qyCompromisso.SQL.Text := 'UPDATE fin_contas_pagar ';
   qyCompromisso.SQL.add( Concat('SET ds_despesa = ', QuotedStr(ds_hitorico)));
   qyCompromisso.SQL.Add( ' WHERE cd_titulo = :cd_titulo' );

   qyCompromisso.ParamByName('cd_titulo').AsString := cd_titulo;

   qyCompromisso.ExecSQL();

   FreeAndNil( qyCompromisso );
end;

procedure alteraHistoricoTesouraria( ds_hitorico : string; cd_titulo : string );
var
   qyMovTesouraria : TUMZQuery;
begin
   //atualiza histório do compromisso
   DM.CriarConsulta( qyMovTesouraria );

   qyMovTesouraria.SQL.Text := 'UPDATE fin_mov_tesouraria ';
   qyMovTesouraria.SQL.add( Concat('SET ds_movimento = ', QuotedStr(ds_hitorico)));
   qyMovTesouraria.SQL.Add( ' WHERE cd_titulo = :cd_titulo' );

   qyMovTesouraria.ParamByName('cd_titulo').AsString := cd_titulo;

   qyMovTesouraria.ExecSQL();

   FreeAndNil( qyMovTesouraria );
end;

function busca_turma_disciplina( vl_pessoa:string; vl_turma : string; vl_disciplina : string; vl_anosemestre: string ) : string;
const
   SSQLSearchDisc =
      'SELECT T.CODIGO, D.DESCRICAO ' +
      'FROM ' +
         'CURSOS_MESTRE C ' +
         'JOIN TURMAS T ON (C.CD_CURSO = T.CURSO) ' +
         'JOIN DISCIPLINAS D ON (C.CD_CURSO = D.CURSO) ' +
      'WHERE ' +
         'T.ANOSEMESTRE = ? AND T.CODIGO = ? AND D.CODIGO = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   if (trim(vl_pessoa) <> '') and
      (trim(vl_turma) <> '') and
      (trim(vl_disciplina) <> '') and
      (trim(vl_anosemestre) <> '') then
   begin
      Statement := PrepareStatement(SSQLSearchDisc);
      try
         Statement.SetString(1, vl_anosemestre);
         Statement.SetString(2, vl_turma);
         Statement.SetString(3, vl_disciplina);
         ResultSet := Statement.ExecuteQueryPrepared;
         try
            if ResultSet.Next then
               Result := ResultSet.GetStringByName('CODIGO') + ' - ' +
                  ResultSet.GetStringByName('DESCRICAO')
            else
               Result := '';
         finally
            ResultSet.Close;
         end;
      finally
         Statement.Close;
      end;
   end;
end;
end.
