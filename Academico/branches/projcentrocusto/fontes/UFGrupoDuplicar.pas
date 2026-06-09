unit UFGrupoDuplicar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ZDbcIntfs;

type
   TfGrupoDuplicar = class(TForm)
      lblTexto: TLabel;
      edtNomeGrupo: TEdit;
      lblAlerta: TLabel;
      btnOk: TButton;
      btnCancelar: TButton;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnOkClick(Sender: TObject);
      procedure edtNomeGrupoExit(Sender: TObject);
      procedure edtNomeGrupoChange(Sender: TObject);
   private
      FNewGroup: Integer;
      FSourceGroup: Integer;
      function GetNewGroup: Integer;
      function GetSourceGroup: Integer;
      procedure SetNewGroup(const Value: Integer);
      procedure SetSourceGroup(const Value: Integer);
      function InsertGroup(const Name: string): Integer;
      function IsAvailableName(const Name: string): Boolean;
      procedure DuplicateGroup;
      procedure DuplicateHierarchy(const Code: Integer);
      procedure DuplicateOwners(const Code: Integer);
      procedure DuplicatePermission(const Code: Integer);
   public
      property NewGroup: Integer read GetNewGroup write SetNewGroup;
      property SourceGroup: Integer read GetSourceGroup write SetSourceGroup;
   end;

var
   fGrupoDuplicar: TfGrupoDuplicar;

implementation

uses
   UZDbcFuncs, ZConnection, uDM;

{$R *.dfm}

procedure TfGrupoDuplicar.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfGrupoDuplicar.btnOkClick(Sender: TObject);
begin
   if IsAvailableName(edtNomeGrupo.Text) then
   begin
      lblAlerta.Visible := False;
      DM.db.ShowSQLHourGlass;
      Application.ProcessMessages;
      DuplicateGroup;
      DM.db.HideSQLHourGlass;
      Application.ProcessMessages;
      ModalResult := mrOk;
   end
   else
      lblAlerta.Visible := True;
end;

procedure TfGrupoDuplicar.DuplicateGroup;
var
   Name: string;
begin
   Name := edtNomeGrupo.Text;
   NewGroup := InsertGroup(Name);
   DuplicatePermission(NewGroup);
   DuplicateHierarchy(NewGroup);
   DuplicateOwners(NewGroup);
end;

procedure TfGrupoDuplicar.DuplicateHierarchy(const Code: Integer);
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement('INSERT INTO NU_GRUPOS_HIERARQUIA (CD_GRUPO, CD_GRUPO_LIBERADO) SELECT ?, CD_GRUPO_LIBERADO FROM NU_GRUPOS_HIERARQUIA WHERE CD_GRUPO = ?');
   Statement.SetInt(1, Code);
   Statement.SetInt(2, SourceGroup);
   try
      Statement.SetResultSetConcurrency(rcUpdatable);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TfGrupoDuplicar.DuplicateOwners(const Code: Integer);
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement('INSERT INTO NU_GRUPOS_HIERARQUIA (CD_GRUPO, CD_GRUPO_LIBERADO) SELECT CD_GRUPO, ? FROM NU_GRUPOS_HIERARQUIA WHERE CD_GRUPO_LIBERADO = ?');
   Statement.SetInt(1, Code);
   Statement.SetInt(2, SourceGroup);
   try
      Statement.SetResultSetConcurrency(rcUpdatable);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TfGrupoDuplicar.DuplicatePermission(const Code: Integer);
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement('INSERT INTO NU_GRUPOS_PERMISSOES (CD_GRUPO, CD_ACAO, NR_PERMISSAO) SELECT ?, CD_ACAO, NR_PERMISSAO FROM NU_GRUPOS_PERMISSOES WHERE CD_GRUPO = ?');
   Statement.SetInt(1, Code);
   Statement.SetInt(2, SourceGroup);
   try
      Statement.SetResultSetConcurrency(rcUpdatable);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TfGrupoDuplicar.edtNomeGrupoChange(Sender: TObject);
begin
   lblAlerta.Visible := False;
end;

procedure TfGrupoDuplicar.edtNomeGrupoExit(Sender: TObject);
begin
   edtNomeGrupo.Text := Trim(edtNomeGrupo.Text);
   lblAlerta.Visible := not IsAvailableName(edtNomeGrupo.Text);
end;

procedure TfGrupoDuplicar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

function TfGrupoDuplicar.GetNewGroup: Integer;
begin
   Result := FNewGroup;
end;

function TfGrupoDuplicar.GetSourceGroup: Integer;
begin
   Result := FSourceGroup;
end;

function TfGrupoDuplicar.InsertGroup(const Name: string): Integer;
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement('INSERT INTO NU_GRUPOS (DS_NOME_GRUPO) VALUES (?)');
   Statement.SetString(1, Name);
   try
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;

   ResultSet := ExecuteQuery('SELECT MAX(CD_GRUPO) CD_GRUPO FROM NU_GRUPOS');
   try
      ResultSet.Next;
      Result := ResultSet.GetInt(1);
   finally
      ResultSet.Close;
   end;
end;

function TfGrupoDuplicar.IsAvailableName(const Name: string): Boolean;
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement('SELECT CD_GRUPO FROM NU_GRUPOS WHERE DS_NOME_GRUPO LIKE ?');
   Statement.SetString(1, Name);
   ResultSet := Statement.ExecuteQueryPrepared;
   try
      Result := not ResultSet.Next;
   finally
      Statement.Close;
      ResultSet.Close;
   end;
end;

procedure TfGrupoDuplicar.SetNewGroup(const Value: Integer);
begin
   FNewGroup := Value;
end;

procedure TfGrupoDuplicar.SetSourceGroup(const Value: Integer);
begin
   FSourceGroup := Value;
end;

end.
