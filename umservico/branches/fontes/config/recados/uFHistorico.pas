unit uFHistorico;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, DB,
   Menus, uDMConexao, XPMenu, UZDataset, ZDataset, ZAbstractRODataset,
  ZAbstractDataset;

type
   TfHistorico = class(TForm)
   published
      XPMenu: TXPMenu;
      sbStatus: TStatusBar;
      pnRecados: TPanel;
      pnTitRecados: TPanel;
      pnEnvios: TPanel;
      spSep: TSplitter;
      pnTitEnvios: TPanel;
      bnListar: TSpeedButton;
      dgRecados: TDBGrid;
      dgEnvios: TDBGrid;
      bvSep2: TBevel;
      bvSep1: TBevel;
      qyEnvios: TUMZQuery;
      qyRecados: TUMZQuery;
      dsRecados: TDataSource;
      dsEnvios: TDataSource;
      pmEnvios: TPopupMenu;
      mi10Ultimos: TMenuItem;
      mi25Ultimos: TMenuItem;
      mi50Ultimos: TMenuItem;
      miTodos: TMenuItem;
      procedure bnListarClick(Sender: TObject);
      procedure miTodosClick(Sender: TObject);
      procedure dgEnviosDblClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dsRecadosDataChange(Sender: TObject; Field: TField);
      procedure dgEnviosDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
   strict private
      FUMConexao: TUMConexao;
   private
      constructor Create;
   public
      class procedure mostra;
   end;

var
   fHistorico: TfHistorico;

implementation

uses
   uFLogs, uFPrincipal;

const
   FILTRO_ULTIMOS10 = 'Exibindo: 10 envios mais recentes';
   FILTRO_ULTIMOS25 = 'Exibindo: 25 envios mais recentes';
   FILTRO_ULTIMOS50 = 'Exibindo: 50 envios mais recentes';
   FILTRO_TODOS = 'Exibindo: todos os envios';

{$R *.dfm}

{ TfHistorico }

procedure TfHistorico.bnListarClick(Sender: TObject);
var
   LPoint: TPoint;
begin
   GetCursorPos(LPoint);
   pmEnvios.Popup(LPoint.X, LPoint.Y);
end;

constructor TfHistorico.Create;
begin
   inherited Create(Application);
   Self.FUMConexao := TUMConexao.Create;
   Self.FUMConexao.Conectar(fUMSvcConfiguracoes.UMSvcRecadosIni.IniFile, 'Conexao', false);
   qyEnvios.Connection := Self.FUMConexao.Conn;
   qyRecados.Connection := Self.FUMConexao.Conn;
   qyRecados.Open;
   sbStatus.Panels.Items[0].Text :=
      IntToStr(qyRecados.RecordCount) + ' recado(s) encontrado(s)';
end;

procedure TfHistorico.dgEnviosDblClick(Sender: TObject);
begin
   qyEnvios.GotoBookmark(Pointer(dgEnvios.SelectedIndex));
   TfLogs.Mostra(
      Self, Self.FUMConexao, qyRecados.FieldByName('ds_titulo').AsString,
      qyEnvios.FieldByName('tp_recado').AsString,
      qyEnvios.FieldByName('dt_envio').AsDateTime,
      qyEnvios.FieldByName('cd_recado_envio').AsInteger);
end;

procedure TfHistorico.dgEnviosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   CtrlState: array[boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   LBChecked: boolean;
   LCheckBoxRect: TRect;
begin
   if Column.FieldName = 'tp_recado' then
   begin
      LBChecked := false;
      dgEnvios.Canvas.FillRect(Rect);
      LCheckBoxRect.Left := Rect.Left + 2;
      LCheckBoxRect.Right := Rect.Right - 2;
      LCheckBoxRect.Top := Rect.Top + 2;
      LCheckBoxRect.Bottom := Rect.Bottom - 2;
      if Column.Title.Caption = 'Recado' then
      begin
         LBChecked := (Column.Field.AsString = '1') or (Column.Field.AsString = '3');
      end
      else if Column.Title.Caption = 'EMail' then
      begin
         LBChecked := (Column.Field.AsString = '2') or (Column.Field.AsString = '3');
      end;
      DrawFrameControl(dgEnvios.Canvas.Handle, LCheckBoxRect, DFC_BUTTON, CtrlState[LBChecked]);
   end;
end;

procedure TfHistorico.dsRecadosDataChange(Sender: TObject; Field: TField);
begin
   qyEnvios.Close;
   qyEnvios.ParamByName('cd_recado').AsInteger :=
      qyRecados.FieldByName('cd_recado').AsInteger;
   qyEnvios.ParamByName('limite').AsInteger := 10;
   qyEnvios.Open;
   bnListar.Caption := FILTRO_ULTIMOS10;
   bnListar.Enabled := not qyEnvios.IsEmpty;
   sbStatus.Panels.Items[1].Text :=
      Format('%d envio(s) encontrado(s)', [qyEnvios.RecordCount]);
end;

procedure TfHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FUMConexao := nil;
   Action := caFree;
end;

procedure TfHistorico.miTodosClick(Sender: TObject);
begin
   if Sender is TMenuItem then
   begin
      qyEnvios.Close;
      qyEnvios.ParamByName('limite').AsInteger := TMenuItem(Sender).Tag;
      qyEnvios.Open;
      case TMenuItem(Sender).Tag of
         10: bnListar.Caption := FILTRO_ULTIMOS10;
         25: bnListar.Caption := FILTRO_ULTIMOS25;
         50: bnListar.Caption := FILTRO_ULTIMOS50;
         99999: bnListar.Caption := FILTRO_TODOS;
      end;
   end;
end;

class procedure TfHistorico.mostra;
begin
   if not Assigned(fHistorico) then
   begin
      fHistorico := TfHistorico.Create;
      try
         fHistorico.ShowModal;
      finally
         fHistorico.Free;
         fHistorico := nil;
      end;
   end;
end;

end.
