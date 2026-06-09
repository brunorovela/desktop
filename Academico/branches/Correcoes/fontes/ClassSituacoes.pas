unit ClassSituacoes;

interface

uses
   SysUtils, Classes, UZDataSet;

Type
   TClasseSituacoes = class(TObject)
      public
         function GetSituacoesToItems(const cd_modulo: Integer; const filtro_todas: Boolean = False): TStringList;
   end;

var
   ClasseSituacoes: TClasseSituacoes;

implementation

uses uDM, uItemCombo;

{ TClasseSituacoes }

function TClasseSituacoes.GetSituacoesToItems(const cd_modulo: Integer; const filtro_todas: Boolean): TStringList;
const
   SQL_GET_SITUACOES_TO_ITEMS =
      ' SELECT cd_situacao, ds_valor AS ds_situacao ' +
      ' FROM situacoes ' +
      ' WHERE cd_modulo = :cd_modulo ' +
      ' ORDER BY ds_valor ';
var
   qyGetSituacoesToItems : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta( qyGetSituacoesToItems );
   qyGetSituacoesToItems.SQL.Text := SQL_GET_SITUACOES_TO_ITEMS;
   qyGetSituacoesToItems.ParamByName('cd_modulo').AsInteger := cd_modulo;
   qyGetSituacoesToItems.Open();

   Result := TStringList.Create;

   if ( filtro_todas ) then
   begin
      Result.AddObject( 'Todas as Situações', nil );
   end;   

   while not qyGetSituacoesToItems.Eof do
   begin
      Result.AddObject( qyGetSituacoesToItems.FieldByName('ds_situacao').AsString,
                        TItemCombo.Create( qyGetSituacoesToItems.FieldByName('cd_situacao').AsString,
                                           qyGetSituacoesToItems.FieldByName('ds_situacao').AsString ) );

      qyGetSituacoesToItems.Next;
   end;   

   FreeAndNil( qyGetSituacoesToItems );
end;

end.
