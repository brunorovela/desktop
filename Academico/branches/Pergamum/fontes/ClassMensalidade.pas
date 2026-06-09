unit ClassMensalidade;

interface

uses
   UZDataSet, ClassRegistros, SysUtils;

Type
   TClasseMensalidade = class(TObject)

      private
      protected
      public
         function GetMensalidade( const cd_mensalidade: Integer ): ClasseRegistros;

   end;

var
   ClasseMensalidade: TClasseMensalidade;

implementation

uses uDM;

{ TClasseMensalidade }

function TClasseMensalidade.GetMensalidade(
  const cd_mensalidade: Integer): ClasseRegistros;
const
   SQL_GET_MENSALIDADE =
      ' SELECT m.cd_mensalidade, m.datavencimento, m.valorbruto, ftt.ds_tipo_titulo  ' +
      ' FROM MENSALIDADES m ' +
      '      INNER JOIN FIN_TIPOS_TITULO ftt ON ( ftt.cd_tipo_titulo = m.cd_tipo_titulo ) ' +
      ' WHERE m.cd_mensalidade = :cd_mensalidade ';
var
   qyGetMensalidade: TUMZQuery;
begin
   DM.CriarConsulta(qyGetMensalidade);
   Result := ClasseRegistros.Create;

   qyGetMensalidade.SQL.Text := SQL_GET_MENSALIDADE;
   qyGetMensalidade.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;

   qyGetMensalidade.Open;

   Result.CarregarQuery(qyGetMensalidade);

   FreeAndNil(qyGetMensalidade);
end;

end.
