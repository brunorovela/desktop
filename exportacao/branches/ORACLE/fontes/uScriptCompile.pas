unit uScriptCompile;

interface

uses
   SysUtils, Forms, Controls, Windows, IniFiles, Graphics, Classes,
   StrUtils, uPSRuntime, uPSComponent;

type
   TPSCompila = class(TObject)
   private
      AScript: TPSScript;
      ALisFn: TStringList; //lista de funcoes
   protected
      procedure AddFuncoes();
      function GetFuncoes(): TStringList;
      procedure SetFuncoes(slFuncoes: TStringList);
   public
      property ListaFuncoes: TStringList read GetFuncoes write SetFuncoes;


     constructor Create();
     destructor Destroy; override;
   published

   end;

implementation


{ TPSCompila }

constructor TPSCompila.Create();
begin
   inherited Create();
   AScript := TPSScript.Create(nil);
   ALisFn := TStringList.Create();
   AddFuncoes();
end;

destructor TPSCompila.Destroy;
begin
   FreeAndNil(ALisFn);
   FreeAndNil(AScript);
   inherited;
end;

procedure TPSCompila.AddFuncoes;
begin

end;

procedure TPSCompila.SetFuncoes(slFuncoes: TStringList);
begin
   ALisFn := slFuncoes;
end;

function TPSCompila.GetFuncoes: TStringList;
begin
   Result := ALisFn;
end;

end.
