unit uPlanoPagamento;

interface

uses uIChecarUsoColigada, uListaColigadas;

type
   TPlanoPagamento = class(TInterfacedObject, ICheckUsoColigada)
      strict private
         cd_plano_pagamento: Integer;

      public
         constructor Create(const ACodPlanoPagamento: Integer);

         {Implementação de interface ICheckUsoColigada}
         function GetColigadasUso(const ColigadasUsuario: String): TListaColigadas;
   end;

implementation

uses UZDataset, uLoginManager, SysUtils, uColigada, DB;

{ TDocumento }

constructor TPlanoPagamento.Create(const ACodPlanoPagamento: Integer);
begin
   Self.cd_plano_pagamento := ACodPlanoPagamento;
end;

function TPlanoPagamento.GetColigadasUso(
  const ColigadasUsuario: String): TListaColigadas;
const
   SQL_USUARIO_POSSUI_PERMISSAO =
      'SELECT '+
	      'c.cd_coligada, '+
	      'c.nm_coligada '+
      'FROM '+
	      'fin_planos fp '+
      'JOIN fin_planos_turmas fpt ON(fp.CD_PLANO = fpt.CD_PLANO) '+
      'JOIN turmas t ON(fpt.CD_TURMA = t.codigo) '+
      'JOIN coligadas c ON(c.cd_coligada = t.cd_coligada) '+
      'WHERE '+
	      'fp.CD_PLANO = :cd_plano_pagamento '+
	      'AND t.cd_coligada NOT IN %s '+
      'GROUP BY '+
	      'c.cd_coligada';
var
   qyUsuarioPossuiPermissao : TUMZReadOnlyQuery;
begin

   Result := TListaColigadas.Create;

   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyUsuarioPossuiPermissao);
   qyUsuarioPossuiPermissao.SQL.Text := Format(SQL_USUARIO_POSSUI_PERMISSAO, [ColigadasUsuario]);
   qyUsuarioPossuiPermissao.ParamByName('cd_plano_pagamento').AsInteger := Self.cd_plano_pagamento;
   qyUsuarioPossuiPermissao.Open;

   while not qyUsuarioPossuiPermissao.Eof do
   begin
      Result.Add( TColigada.Create(
         qyUsuarioPossuiPermissao.FieldByName( 'cd_coligada' ).AsInteger,
         qyUsuarioPossuiPermissao.FieldByName( 'nm_coligada' ).AsString
      ) );

      qyUsuarioPossuiPermissao.Next;
   end;

   FreeAndNil(qyUsuarioPossuiPermissao);
end;

end.
