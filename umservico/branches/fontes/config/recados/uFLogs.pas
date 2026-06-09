unit uFLogs;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
   uDMConexao, XPMenu, UZDataset, ZDataset;

type
   TfLogs = class(TForm)
   published
      XPMenu: TXPMenu;
      bvSep3: TBevel;
      bvSep4: TBevel;
      sbStatus: TStatusBar;
      pnFiltros: TPanel;
      pnTitFiltros: TPanel;
      rgResult: TRadioGroup;
      rgTipo: TRadioGroup;
      lbDtEnvioTit: TLabel;
      lbDtEnvio: TLabel;
      splitter: TSplitter;
      pnLogs: TPanel;
      pnTitLogs: TPanel;
      bvSep1: TBevel;
      dgLogs: TDBGrid;
      bvSep2: TBevel;
      pnErro: TPanel;
      pnTitErro: TPanel;
      mmErro: TMemo;
      dsDestinos: TDataSource;
      qyDestinos: TUMZQuery;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure rgTipoClick(Sender: TObject);
      procedure rgResultClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure dsDestinosDataChange(Sender: TObject; Field: TField);
      procedure dgLogsDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
   strict private
      FICodEnvio: integer;
      FUMConexao: TUMConexao;
      procedure Filtra;
   private
      constructor Create(AOwner: TComponent; AUMConn: TUMConexao;
         const ASRecado: string; const ASTipoRecado: string;
         const ADtEnvio: TDateTime; const AICodEnvio: Integer);
   public
      class procedure Mostra(AOwner: TComponent; AUMConn: TUMConexao;
         const ASRecado: string; const ASTipoRecado: string;
         const ADtEnvio: TDateTime; const AICodEnvio: Integer);
   end;

var
   fLogs: TfLogs;

implementation

uses Types;

const
   SQL_TODOS =
      'SELECT '+
         'rp.cd_pessoa,'+
         'p.nm_pessoa,'+
         'rp.tp_recado,'+
         'CASE WHEN rp.tp_recado = ''1'' THEN ''Recado Online'' ELSE ''E-Mail'' END AS tipo_recado,'+
         'rp.ds_email,'+
         'rp.sn_sucesso,'+
         'COALESCE(rp.me_erro, '''') me_erro '+
      'FROM '+
         'svc_recados_pessoas rp JOIN pessoas p USING(cd_pessoa) '+
      'WHERE '+
         'cd_recado_envio = :cd_recado_envio';

   SQL_FILTRA_RESULTADO =
      'SELECT '+
         'rp.cd_pessoa,'+
         'p.nm_pessoa,'+
         'rp.tp_recado,'+
         'CASE WHEN rp.tp_recado = ''1'' THEN ''Recado Online'' ELSE ''E-Mail'' END AS tipo_recado,'+
         'rp.ds_email,'+
         'rp.sn_sucesso,'+
         'COALESCE(rp.me_erro, '''') me_erro '+
      'FROM '+
         'svc_recados_pessoas rp JOIN pessoas p USING(cd_pessoa) '+
      'WHERE '+
         'cd_recado_envio = :cd_recado_envio AND '+
         'sn_sucesso = :sn_sucesso';

   SQL_FILTRA_TIPO =
      'SELECT '+
         'rp.cd_pessoa,'+
         'p.nm_pessoa,'+
         'rp.tp_recado,'+
         'CASE WHEN rp.tp_recado = ''1'' THEN ''Recado Online'' ELSE ''E-Mail'' END AS tipo_recado,'+
         'rp.ds_email,'+
         'rp.sn_sucesso,'+
         'COALESCE(rp.me_erro, '''') me_erro '+
      'FROM '+
         'svc_recados_pessoas rp JOIN pessoas p USING(cd_pessoa) '+
      'WHERE '+
         'cd_recado_envio = :cd_recado_envio AND '+
         'tp_recado = :tp_recado';

   SQL_FILTRA_RESULTADO_TIPO =
      'SELECT '+
         'rp.cd_pessoa,'+
         'p.nm_pessoa,'+
         'rp.tp_recado,'+
         'CASE WHEN rp.tp_recado = ''1'' THEN ''Recado Online'' ELSE ''E-Mail'' END AS tipo_recado,'+
         'rp.ds_email,'+
         'rp.sn_sucesso,'+
         'COALESCE(rp.me_erro, '''') me_erro '+
      'FROM '+
         'svc_recados_pessoas rp JOIN pessoas p USING(cd_pessoa) '+
      'WHERE '+
         'cd_recado_envio = :cd_recado_envio AND '+
         'sn_sucesso = :sn_sucesso AND '+
         'tp_recado = :tp_recado';

{$R *.dfm}

{ TfLogs }

constructor TfLogs.Create(AOwner: TComponent; AUMConn: TUMConexao;
   const ASRecado: string; const ASTipoRecado: string;
   const ADtEnvio: TDateTime; const AICodEnvio: Integer);
begin
   inherited Create(AOwner);
   Self.FICodEnvio := AICodEnvio;
   Self.FUMConexao := AUMConn;
   Self.Caption := ASRecado;
   lbDtEnvio.Caption := FormatDateTime('dd/mm/yyyy', ADtEnvio);
   qyDestinos.Connection := Self.FUMConexao.Conn;
   if ASTipoRecado = '1' then
   begin
      rgResult.ItemIndex := 0;
      dgLogs.Columns.Items[2].Visible := False;
      dgLogs.Columns.Items[3].Visible := False;
   end
   else if ASTipoRecado = '2' then
   begin
      rgResult.ItemIndex := 1;
      dgLogs.Columns.Items[2].Visible := False;
      dgLogs.Columns.Items[3].Visible := True;
   end
   else
   begin
      rgResult.ItemIndex := 2;
      dgLogs.Columns.Items[2].Visible := True;
      dgLogs.Columns.Items[3].Visible := True;
   end;
   rgTipo.Enabled := ASTipoRecado = '3';
   rgResult.ItemIndex := 2;
   pnErro.Visible := True;
end;

procedure TfLogs.dgLogsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   CtrlState: array[boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   LCheckBoxRect: TRect;
begin
   if Column.FieldName = 'sn_sucesso' then
   begin
      dgLogs.Canvas.FillRect(Rect);
      LCheckBoxRect.Left := Rect.Left + 2;
      LCheckBoxRect.Right := Rect.Right - 2;
      LCheckBoxRect.Top := Rect.Top + 2;
      LCheckBoxRect.Bottom := Rect.Bottom - 2;
      DrawFrameControl(dgLogs.Canvas.Handle, LCheckBoxRect,DFC_BUTTON,
         CtrlState[Column.Field.AsInteger = 1]);
   end;
end;

procedure TfLogs.dsDestinosDataChange(Sender: TObject; Field: TField);
begin
   mmErro.Lines.Text := qyDestinos.FieldByName('me_erro').AsString;
end;

procedure TfLogs.Filtra;
begin
   pnErro.Visible := rgResult.ItemIndex <> 0;
   dgLogs.Columns.Items[2].Visible := rgTipo.ItemIndex = 2;
   dgLogs.Columns.Items[3].Visible := rgTipo.ItemIndex = 1;
   dgLogs.Columns.Items[4].Visible := rgResult.ItemIndex = 2;
   if (rgResult.ItemIndex = 2) and (rgTipo.ItemIndex = 2) then
   begin
      qyDestinos.SQL.Text := SQL_TODOS;
   end
   else if (rgResult.ItemIndex <> 2) and (rgTipo.ItemIndex <> 2) then
   begin
      qyDestinos.SQL.Text := SQL_FILTRA_RESULTADO_TIPO;
      case rgResult.ItemIndex of
         0: qyDestinos.ParamByName('sn_sucesso').AsInteger := 1;
         1: qyDestinos.ParamByName('sn_sucesso').AsInteger := 0;
      end;
      case rgTipo.ItemIndex of
         0: qyDestinos.ParamByName('tp_recado').AsString := '1';
         1: qyDestinos.ParamByName('tp_recado').AsString := '2';
      end;
   end
   else if rgResult.ItemIndex <> 2 then
   begin
      qyDestinos.SQL.Text := SQL_FILTRA_RESULTADO;
      case rgResult.ItemIndex of
         0: qyDestinos.ParamByName('sn_sucesso').AsInteger := 1;
         1: qyDestinos.ParamByName('sn_sucesso').AsInteger := 0;
      end;
   end
   else if rgTipo.ItemIndex <> 2 then
   begin
      qyDestinos.SQL.Text := SQL_FILTRA_TIPO;
      case rgTipo.ItemIndex of
         0: qyDestinos.ParamByName('tp_recado').AsString := '1';
         1: qyDestinos.ParamByName('tp_recado').AsString := '2';
      end;
   end;
   qyDestinos.ParamByName('cd_recado_envio').AsInteger := Self.FICodEnvio;
   qyDestinos.Open;
   sbStatus.Panels.Items[1].Text :=
      IntToStr(qyDestinos.RecordCount) + ' registro(s) encontrados(s)'; 
end;

procedure TfLogs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FUMConexao := nil;
   Action := caFree;
end;

procedure TfLogs.FormShow(Sender: TObject);
begin
   Filtra;
end;

class procedure TfLogs.Mostra(AOwner: TComponent; AUMConn: TUMConexao;
   const ASRecado: string; const ASTipoRecado: string;
   const ADtEnvio: TDateTime; const AICodEnvio: Integer);
begin
   if not Assigned(fLogs) then
   begin
      fLogs :=
         TfLogs.Create(
            AOwner, AUMConn, ASRecado, ASTipoRecado, ADtEnvio, AICodEnvio);
      try
         fLogs.ShowModal;
      finally
         fLogs.Free;
         fLogs := nil;
      end;
   end;
end;

procedure TfLogs.rgResultClick(Sender: TObject);
begin
   Filtra;
end;

procedure TfLogs.rgTipoClick(Sender: TObject);
begin
   Filtra;
end;

end.
