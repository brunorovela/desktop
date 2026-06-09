unit UFPrincipal;

interface

uses
   Forms, Classes, Menus, Controls, ToolWin, ComCtrls, ImgList, Windows,
   SysUtils, UDM, ExtCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
   UZDataset, uLoginManager, uTrataExcecao, StdCtrls, uTratamentoExcecaoAdm,
   uUsuario,uMensagem;

type
   TfPrincipal = class(TForm)
      mmPrincipal: TMainMenu;
      miModulo: TMenuItem;
      miSair: TMenuItem;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnModulo: TToolButton;
      btnSep2: TToolButton;
      btnBackup: TToolButton;
      btnRelatorios: TToolButton;
      btnSep3: TToolButton;
      btnSair: TToolButton;
      btnSep4: TToolButton;
      ilOpcoes: TImageList;
      btnAgendmnt: TToolButton;
      btnRest: TToolButton;
      stbOpcoes: TStatusBar;
      sbUsuario: TSpeedButton;
      sbDataHora: TSpeedButton;
      btnSenhas: TToolButton;
      sbServidor: TSpeedButton;
      btnParametros: TToolButton;
    qryParametro: TUMZQuery;
      procedure btnParametrosClick(Sender: TObject);
      procedure btnSenhasClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbUsuarioClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure stbOpcoesDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
         const Rect: TRect);
      procedure btnRestClick(Sender: TObject);
      procedure btnBackupClick(Sender: TObject);
      procedure btnAgendmntClick(Sender: TObject);
      procedure miSairClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnSairClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure btnRelatoriosClick(Sender: TObject);
   private
      function FindForm(const AChild: TForm): Boolean;
   end;

var
   fPrincipal: TfPrincipal;
   OldWindowProc: Pointer;
   WM_REOPENAPPLICATION: UINT;

function ProcessMessages(Handle: HWND; Msg, WParam, LParam: Longint): Longint stdcall;

implementation

uses
   UFRelConfig, UFAgendamento, UFBackup, UFRestaura, UMySQLDump, UUtils,
   UFSenhas, UFParams;

{$R *.dfm}

function ProcessMessages(Handle: HWND; Msg, WParam, LParam: Longint): Longint stdcall;
begin
   if Msg = WM_REOPENAPPLICATION then
   begin
      if fPrincipal.Visible then
         fPrincipal.Show
      else
         DM.miAbrir.Click;
      Result := 0;
   end
   else
      Result := CallWindowProc(OldWindowProc, Handle, Msg, WParam, LParam);
end;

{ TfPrincipal }

procedure TfPrincipal.btnAgendmntClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Agendamento', npAcesso, True) then
   begin
      if fAgendamento = nil then
         Application.CreateForm(TfAgendamento, fAgendamento);
      fAgendamento.ShowModal;
   end;
end;

procedure TfPrincipal.btnBackupClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Backup', npAcesso, True) then
   begin
      if fBackup = nil then
         Application.CreateForm(TfBackup, fBackup);
      fBackup.ShowModal;
   end;
end;

procedure TfPrincipal.btnParametrosClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Parametros.Gerenciar', npAcesso, True) then
   begin
      if not FindForm(fParams) then
         Application.CreateForm(TfParams, fParams);
      fParams.Show;
   end;
end;

procedure TfPrincipal.btnRelatoriosClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Relatorios.Cadastro', npAcesso, True) then
   begin
      if not FindForm(fRelConfig) then
         Application.CreateForm(TfRelConfig, fRelConfig);
      fRelConfig.Show;
   end;
end;

procedure TfPrincipal.btnRestClick(Sender: TObject);
begin

{
   Adriano desabilitou esta opção em 08/2024 para evitar problemas em clientes.
   Se o cliente não sabe fazer seu próprio backup e restore,
   ele nao deveria estar sendo responsável pelo seu próprio
   servidor de banco de dados.
   
   if DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Restore', npAcesso, True) then
   begin
      if fRestaura = nil then
         Application.CreateForm(TfRestaura, fRestaura);
      fRestaura.ShowModal;
   end;
   }
end;

procedure TfPrincipal.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPrincipal.btnSenhasClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Senhas.Gerenciar', npAcesso, True) then
   begin
      if not FindForm(fSenhas) then
         Application.CreateForm(TfSenhas, fSenhas);
      fSenhas.Show;
   end;
end;

function TfPrincipal.FindForm(const AChild: TForm): Boolean;
var
   I: Integer;
begin
   Result := False;
   for I := 0 to MDIChildCount - 1 do
      if MDIChildren[I] = AChild then
      begin
         Result := True;
         Break;
      end;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
   I: Integer;
begin
   for I := MDIChildCount - 1 downto 0 do
      MDIChildren[I].Close;
end;

procedure TfPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SCapInfo = 'Informação';
   SMsgConfirm = 'Deseja realmente sair do sistema?';
   SMsgTryIcon =
      'O UNIMESTRE - Administração foi minimizado na bandeja do Windows.';
begin
   if DM.GetUsuarioLogado <> nil then
      if MessageBox(Handle, PChar(SMsgConfirm), PChar(Application.Name),
         MB_ICONQUESTION + MB_YESNO) = IDYES then
         if DM.tiAgenda.Visible then
         begin
            Hide;
            CanClose := False;
            MessageBox(Handle, PChar(SMsgTryIcon), PChar(SCapInfo),
               MB_ICONINFORMATION + MB_OK);
         end
         else
            CanClose := True
      else
         CanClose := False
   else
      CanClose := True;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
   OldWindowProc := Pointer(SetWindowLong(Handle, GWL_WNDPROC,
      Longint(@ProcessMessages)));
      
   sbUsuario.Parent := stbOpcoes;
   sbServidor.Parent := stbOpcoes;
   sbDataHora.Parent := stbOpcoes;
   Application.OnException := TTrataExcecao.Create(TTratamentoExcecaoAdm.Create).TrataExcecao;
end;

procedure TfPrincipal.FormDestroy(Sender: TObject);
begin
   SetWindowLong(Handle, GWL_WNDPROC, Longint(OldWindowProc));
end;

procedure TfPrincipal.FormShow(Sender: TObject);
var
   parametroLicenca, parametroCpnj: String;
begin
   Caption := Format('%s - %s - (%s)', [Application.Title, DM.conn.HostName,
      UUtils.GetVersion]);

   qryParametro.SQL.Text := 'SELECT ds_valor FROM parametros WHERE ds_variavel = ''cliente_cnpj'' ';
   qryParametro.Open;

   parametroCpnj := qryParametro.FieldByName('ds_valor').AsString;
   qryParametro.close;

   qryParametro.SQL.Text := 'SELECT ds_valor FROM parametros WHERE ds_variavel = ''cliente_licenca'' ';
   qryParametro.Open;

   parametroLicenca := qryParametro.FieldByName('ds_valor').AsString;
   qryParametro.close;

   DM.Lite := (DM.UMCrypt( parametroLicenca, ctDecode, parametroCpnj ) = 'LITE');

   if DM.Lite then
   begin
      btnRest.visible := DM.GetChavePermissaoLite('Restore', 'UMAdministracao');
      btnRelatorios.visible := DM.GetChavePermissaoLite('Relatorios.Cadastro', 'UMAdministracao');
      FPrincipal.Caption := FPrincipal.Caption + ' - LITE';
   end;
end;

procedure TfPrincipal.miSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPrincipal.sbUsuarioClick(Sender: TObject);
var
   I: Integer;
begin
   if TLoginManager.GetInstancia.RealizarLogin(False, False) then
   begin
      for I := MDIChildCount - 1 downto 0 do
         MDIChildren[I].Close;
      sbUsuario.Caption := Format('Usuário: %s',
         [DM.GetUsuarioLogado.Pessoa.Login]);
   end
   else
      Close
end;

procedure TfPrincipal.stbOpcoesDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   case Panel.Index of
      0:
         begin
            sbUsuario.Top := Rect.Top;
            sbUsuario.Left := Rect.Left;
            sbUsuario.Width := Rect.Right - Rect.Left;
            sbUsuario.Height := Rect.Bottom - Rect.Top;
         end;
      1:
         begin
            sbServidor.Top := Rect.Top;
            sbServidor.Left := Rect.Left;
            sbServidor.Width := Rect.Right - Rect.Left;
            sbServidor.Height := Rect.Bottom - Rect.Top;
         end;
      2:
         begin
            sbDataHora.Top := Rect.Top;
            sbDataHora.Left := Rect.Left;
            sbDataHora.Width := Rect.Right - Rect.Left;
            sbDataHora.Height := Rect.Bottom - Rect.Top;
         end;
   end;
end;

initialization
   WM_REOPENAPPLICATION := RegisterWindowMessage(PChar('ReOpenApplicationMsg'));

end.
