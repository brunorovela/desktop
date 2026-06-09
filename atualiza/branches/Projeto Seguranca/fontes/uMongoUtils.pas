unit uMongoUtils;

interface

uses
   MongoDB, MongoBson;

type
   TMongoUtils = class(TObject)
      public
         class function changePasswordUser(conexao: Tmongo; const db, user, pwd: String): Boolean;
   end;

implementation

{ TMongoUtils }

class function TMongoUtils.changePasswordUser(conexao: Tmongo;
   const db, user, pwd: String): Boolean;
var
   resultado : TBson;
begin
   resultado := conexao.command(db, BSON(['updateUser', user, 'pwd', pwd]));

   Result := False;
   if resultado <> nil then
   begin
      if resultado.find('ok') <> nil then
      begin
         Result := resultado.find('ok').value = 1;
      end;
   end;
end;

end.
