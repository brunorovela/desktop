unit UFGrupoCopiarPerms;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, DBCtrls, DB, ZAbstractRODataset, UZDataset, ZDbcIntfs;

type
   TfGrupoCopiarPerms = class(TForm)
      lblTexto: TLabel;
      dblcGrupos: TDBLookupComboBox;
      dsGrupos: TDataSource;
      qryGrupos: TUMZReadOnlyQuery;
      qryGruposCD_GRUPO: TIntegerField;
      qryGruposDS_NOME_GRUPO: TStringField;
      btnConfirmar: TButton;
      btnCancelar: TButton;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure dsGruposDataChange(Sender: TObject; Field: TField);
      procedure FormShow(Sender: TObject);
   private
      FGroupCode: Integer;
      FGroupName: string;
      function GetGroupCode: Integer;
      function GetGroupName: string;
      procedure SetGroupCode(const Value: Integer);
      procedure SetGroupName(const Value: string);
      procedure CopyPermissions;
      procedure DeleteCurrPermissions;
   public
      property GroupCode: Integer read GetGroupCode write SetGroupCode;
      property GroupName: string read GetGroupName write SetGroupName;
   end;

var
   fGrupoCopiarPerms: TfGrupoCopiarPerms;

implementation

uses
   uDM, UZDbcFuncs;

{$R *.dfm}

{ TfGrupoCopiarPerms }

procedure TfGrupoCopiarPerms.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfGrupoCopiarPerms.btnConfirmarClick(Sender: TObject);
const
   SCaption = 'Confirmação';
   SMsgConfirm = 'Você está prestes a copiar as permissões do grupo [%s] para o grupo [%s]. Todas as atuais permissões do grupo [%s] serão desconsideradas. Tem certeza que deseja continuar?';
var
   Msg: string;
begin
   Msg := Format(SMsgConfirm, [qryGruposDS_NOME_GRUPO.AsString, GroupName, GroupName]);
   if MessageBox(Handle, PChar(Msg), PChar(SCaption), MB_ICONINFORMATION or MB_YESNO) = ID_YES then
   begin
      DM.db.ShowSQLHourGlass;
      Application.ProcessMessages;
      DeleteCurrPermissions;
      CopyPermissions;
      ModalResult := mrOk;
      DM.db.HideSQLHourGlass;
      Application.ProcessMessages;
   end;
end;

procedure TfGrupoCopiarPerms.CopyPermissions;
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement('INSERT INTO NU_GRUPOS_PERMISSOES (CD_GRUPO, CD_ACAO, NR_PERMISSAO) SELECT ?, CD_ACAO, NR_PERMISSAO FROM NU_GRUPOS_PERMISSOES WHERE CD_GRUPO = ?');
   try
      Statement.SetInt(1, GroupCode);
      Statement.SetInt(2, qryGruposCD_GRUPO.AsInteger);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TfGrupoCopiarPerms.DeleteCurrPermissions;
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement('DELETE FROM NU_GRUPOS_PERMISSOES WHERE CD_GRUPO = ?');
   try
      Statement.SetInt(1, GroupCode);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TfGrupoCopiarPerms.dsGruposDataChange(Sender: TObject; Field: TField);
begin
   btnConfirmar.Enabled := not (dblcGrupos.KeyValue = Null);
end;

procedure TfGrupoCopiarPerms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryGrupos.Close;
   Action := caFree;
end;

procedure TfGrupoCopiarPerms.FormShow(Sender: TObject);
begin
   lblTexto.Caption := Format(lblTexto.Caption, [GroupName]);
   qryGrupos.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
   qryGrupos.ParamByName('CD_GRUPO').AsInteger := GroupCode;
   qryGrupos.Open;
end;

function TfGrupoCopiarPerms.GetGroupCode: Integer;
begin
   Result := FGroupCode;
end;

function TfGrupoCopiarPerms.GetGroupName: string;
begin
   Result := FGroupName;
end;

procedure TfGrupoCopiarPerms.SetGroupCode(const Value: Integer);
begin
   FGroupCode := Value;
end;

procedure TfGrupoCopiarPerms.SetGroupName(const Value: string);
begin
   FGroupName := Value;
end;

end.
