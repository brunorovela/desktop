unit UZDbcFuncs;

interface

uses
   ZDbcIntfs, Classes, ZClasses, SysUtils;

var
   Statements: TInterfaceList;
   ResultSets: TInterfaceList;

function GetConnection: IZConnection;

function CreateStatement: IZStatement;

function ExecuteQuery(const SQL: string): IZResultSet;

function ExecuteUpdate(const SQL: string): Integer;

function Execute(const SQL: string): Boolean;

function PrepareStatement(const SQL: string): IZPreparedStatement;

function ExecuteQueryPrepared(const SQL: string): IZResultSet;

function ExecuteUpdatePrepared(const SQL: string): Integer;

function ExecutePrepared(const SQL: string): Boolean;

function Instantiated(const Intf: IZInterface): Boolean;

procedure ReleaseAll;

procedure ReleaseResultSets;

procedure ReleaseStatements;

implementation

uses
   UDM, ZConnection;

function GetConnection: IZConnection;
begin
   Result := DM.conn.DbcConnection;
end;

function CreateStatement: IZStatement;
begin
   Result := GetConnection.CreateStatement;
   Statements.Add(Result);
end;

function ExecuteQuery(const SQL: string): IZResultSet;
begin
   Result := CreateStatement.ExecuteQuery(SQL);
   ResultSets.Add(Result);
end;

function ExecuteUpdate(const SQL: string): Integer;
begin
   Result := CreateStatement.ExecuteUpdate(SQL);
end;

function Execute(const SQL: string): Boolean;
begin
   Result := CreateStatement.Execute(SQL);
end;

function PrepareStatement(const SQL: string): IZPreparedStatement;
begin
   Result := GetConnection.PrepareStatement(SQL);
   Statements.Add(Result);
end;

function ExecuteQueryPrepared(const SQL: string): IZResultSet;
begin
   Result := PrepareStatement(SQL).ExecuteQueryPrepared;
   ResultSets.Add(Result);
end;

function ExecuteUpdatePrepared(const SQL: string): Integer;
begin
   Result := PrepareStatement(SQL).ExecuteUpdatePrepared;
end;

function ExecutePrepared(const SQL: string): Boolean;
begin
   Result := PrepareStatement(SQL).ExecutePrepared;
end;

function Instantiated(const Intf: IZInterface): Boolean;
begin
   if Intf <> nil then
      if Supports(Intf, IZStatement) or Supports(Intf, IZResultSet) then
         Result := TObject(Intf) <> nil
      else
         Result := False
   else
      Result := False;
end;

procedure ReleaseAll;
begin
   ReleaseResultSets;
   ReleaseStatements;
   ResultSets.Free;
   Statements.Free;
end;

procedure ReleaseResultSets;
var
   I: Integer;
begin
   for I := ResultSets.Count - 1 downto 0 do
      if Instantiated(ResultSets.Items[I]) then
         (ResultSets.Items[I] as IZResultSet).Close
      else
         ResultSets.Delete(I);
   ResultSets.Clear;
end;

procedure ReleaseStatements;
var
   I: Integer;
begin
   for I := Statements.Count - 1 downto 0 do
      if Instantiated(Statements.Items[I]) then
         (Statements.Items[I] as IZStatement).Close
      else
         Statements.Delete(I);
   Statements.Clear;
end;

initialization

Statements := TInterfaceList.Create;
ResultSets := TInterfaceList.Create;

finalization

ReleaseAll;

end.
