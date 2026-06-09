unit uFPrincipal;

interface

uses
  Windows, Forms, Classes, Controls, ComCtrls, ExtCtrls, jpeg, Buttons, uFTasy,
  uFBiblioshop, uFBorges, uFRecado, Graphics, Tlhelp32, SysUtils, ToolWin,
  ImgList, uSvcConfClasses, IniFiles, uDMConexao, uAFuncoes, WinSvc;

type
   PFrame = ^TFrame;

   PSpeedButton = ^TSpeedButton;

   TfPrincipal = class(TForm)
   published
      tbAcoes: TToolBar;
      ilImagens: TImageList;
      bnSalvar: TToolButton;
      bnDescartar: TToolButton;
      bnSep1: TToolButton;
      bnSair: TToolButton;
      bnSep2: TToolButton;
      bnSep3: TToolButton;
      bnSep4: TToolButton;
      imLogo: TImage;
      pnLogo: TPanel;
      pnConfig: TPanel;
      pnServicos: TPanel;
      bnBiblioshop: TSpeedButton;
      bnTasy: TSpeedButton;
      bnBorges: TSpeedButton;
      bnRecados: TSpeedButton;
      pnServico: TPanel;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure bnDescartarClick(Sender: TObject);
      procedure bnSairClick(Sender: TObject);
      procedure bnRecadosClick(Sender: TObject);
      procedure bnBorgesClick(Sender: TObject);
      procedure bnTasyClick(Sender: TObject);
      procedure bnBiblioshopClick(Sender: TObject);
      procedure bnSalvarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   strict private
      FUMServicoSel: TUMServicos;
      FUMConexao: TUMConexao;
      FIfConfig: TIniFile;
      FSlServicos: TStringList;
      FBiblioshop: TfBiblioshop;
      FTasy: TfTasy;
      FBorges: TfBorges;
      FRecados: TfRecado;
      FAtivo: PFrame;
      FBotao: PSpeedButton;
      function Conecta: boolean;
      procedure VerificaAlteracoes;
   public
      property UMConexao: TUMConexao read FUMConexao;
   end;

var
   fPrincipal: TfPrincipal;
   fUMSvcConfiguracoes: TUMSvcConfiguracoes;

implementation

uses
   uFLogin;

{$R *.dfm}

{ TfPrincipal }

procedure TfPrincipal.bnBiblioshopClick(Sender: TObject);
begin
   if FBotao <> @bnBiblioshop then
   begin
      FUMServicoSel := svcBiblioshop;
      if Assigned(FAtivo) then
      begin
         FAtivo^.Visible := false;
         FAtivo^.Parent := nil;
      end;
      if Assigned(FBotao) then
      begin
         FBotao^.Font.Style := [];
         FBotao^.Font.Color := clWindowText;
      end;
      FBiblioshop.Parent := pnServico as TWinControl;
      FBiblioshop.Visible := true;
      FAtivo := @FBiblioshop;
      bnBiblioshop.Down := true;
      bnBiblioshop.Font.Style := [fsBold];
      bnBiblioshop.Font.Color := clGreen;
      FBotao := @bnBiblioshop;
      VerificaAlteracoes;
   end;
end;

procedure TfPrincipal.bnBorgesClick(Sender: TObject);
begin
   if FBotao <> @bnBorges then
   begin
      FUMServicoSel := svcBorges;
      if Assigned(FAtivo) then
      begin
         FAtivo^.Visible := false;
         FAtivo^.Parent := nil;
      end;
      if Assigned(FBotao) then
      begin
         FBotao^.Font.Style := [];
         FBotao^.Font.Color := clWindowText;
      end;
      FBorges.Parent := pnServico as TWinControl;
      FBorges.Visible := true;
      FAtivo := @FBorges;
      bnBorges.Down := true;
      bnBorges.Font.Style := [fsBold];
      bnBorges.Font.Color := clGreen;
      FBotao := @bnBorges;
      VerificaAlteracoes;
   end;
end;

procedure TfPrincipal.bnDescartarClick(Sender: TObject);
begin
   if bnBiblioshop.Visible then
   begin
      FBiblioshop.Visible := False;
      FreeAndNil(FBiblioshop);
   end;
   if bnTasy.Visible then
   begin
      FTasy.Visible := False;
      FreeAndNil(FTasy);
   end;
   if bnBorges.Visible then
   begin
      FBorges.Visible := False;
      FreeAndNil(FBorges);
   end;
   if bnRecados.Visible then
   begin
      FRecados.Visible := False;
      FreeAndNil(FRecados);
   end;
   if FSlServicos.Values['UMSvcIntegraBiblioshop'] = 'S' then
   begin
      FBiblioshop := TfBiblioshop.Create(Self);
      bnBiblioshop.Visible := True;
   end;
   if FSlServicos.Values['UMSvcIntegraTasy'] = 'S' then
   begin
      FTasy := TfTasy.Create(Self);
      bnTasy.Visible := True;
   end;
   if FSlServicos.Values['UMSvcIntegraBorgesMendonca'] = 'S' then
   begin
      FBorges := TfBorges.Create(Self);
      bnBorges.Visible := True;
   end;
   if FSlServicos.Values['UMSvcRecados'] = 'S' then
   begin
      FRecados := TfRecado.Create(Self);
      bnRecados.Visible := True;
   end;
   FAtivo := nil;
   FBotao := nil;
   if bnBiblioshop.Down then
      bnBiblioshopClick(nil)
   else if bnTasy.Down then
      bnTasyClick(nil)
   else if bnBorges.Down then
      bnBorgesClick(nil)
   else if bnRecados.Down then
      bnRecadosClick(nil);
   bnSalvar.Enabled := false;
   bnDescartar.Enabled := false;
end;

procedure TfPrincipal.bnRecadosClick(Sender: TObject);
begin
   if FBotao <> @bnRecados then
   begin
      FUMServicoSel := svcRecados;
      if Assigned(FAtivo) then
      begin
         FAtivo^.Visible := false;
         FAtivo^.Parent := nil;
      end;
      if Assigned(FBotao) then
      begin
         FBotao^.Font.Style := [];
         FBotao^.Font.Color := clWindowText;
      end;
      FRecados.Parent := pnServico as TWinControl;
      FRecados.Visible := true;
      FAtivo := @FRecados;
      bnRecados.Down := true;
      bnRecados.Font.Style := [fsBold];
      bnRecados.Font.Color := clGreen;
      FBotao := @bnRecados;
      VerificaAlteracoes;
   end;
end;

procedure TfPrincipal.bnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPrincipal.bnSalvarClick(Sender: TObject);
begin
   case FUMServicoSel of
      svcBiblioshop:
      begin
         FBiblioshop.Salva;
         fUMSvcConfiguracoes.UMSvcBiblioshopIni.Salva;
      end;
      svcTasy:
      begin
         FTasy.Salva;
         fUMSvcConfiguracoes.UMSvcTasyIni.Salva;
      end;
      svcBorges:
      begin
         FBorges.Salva;
         fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.Salva;
      end;
      svcRecados:
      begin
         FRecados.Salva;
         fUMSvcConfiguracoes.UMSvcRecadosIni.Salva;
      end;
   end;
   bnSalvar.Enabled := false;
   bnDescartar.Enabled := false;
end;

procedure TfPrincipal.bnTasyClick(Sender: TObject);
begin
   if FBotao <> @bnTasy then
   begin
      FUMServicoSel := svcTasy;
      if Assigned(FAtivo) then
      begin
         FAtivo^.Visible := false;
         FAtivo^.Parent := nil;
      end;
      if Assigned(FBotao) then
      begin
         FBotao^.Font.Style := [];
         FBotao^.Font.Color := clWindowText;
      end;
      FTasy.Parent := pnServico as TWinControl;
      FTasy.Visible := true;
      FAtivo := @FTasy;
      bnTasy.Down := true;
      bnTasy.Font.Style := [fsBold];
      bnTasy.Font.Color := clGreen;
      FBotao := @bnTasy;
      VerificaAlteracoes;
   end;
end;

function TfPrincipal.Conecta: boolean;
const
   MSG_SEM_CONEXAO =
      'Não foi possível efetuar conexão com a base de dados para autenticação do usuário';
begin
   Result := true;
   FUMConexao := TUMConexao.Create;
   try
      if not FUMConexao.Conectar(FIfConfig, 'Conexao', false) then
      begin
         Mensagem(MSG_SEM_CONEXAO, Application.Title, MB_ICONERROR);
         Result := false;
      end;
   except
      on E: Exception do
      begin
         Mensagem(MSG_SEM_CONEXAO + #13 + E.Message, Application.Title, MB_ICONERROR);
         Result := false;
      end;
   end;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FUMConexao.Desconectar;
   FAtivo := nil;
   FBotao := nil;
   FreeAndNil(FUMConexao);
   FreeAndNil(FBiblioshop);
   FreeAndNil(FTasy);
   FreeAndNil(FBorges);
   FreeAndNil(FRecados);
   FreeAndNil(fUMSvcConfiguracoes);
   FreeAndNil(FIfConfig);
   FreeAndNil(FSlServicos);
   Action := caFree;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
   FIfConfig := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'unimestre.ini');
   if Conecta then
   begin
      if TfLogin.Autentica(Self, FUMConexao) then
      begin
         FSlServicos := TStringList.Create;
         FIfConfig.ReadSectionValues('UMServico', FSlServicos);
         fUMSvcConfiguracoes :=
            TUMSvcConfiguracoes.Create(ExtractFilePath(ParamStr(0)) + 'services\');
         New(FAtivo);
         New(FBotao);
         FAtivo := nil;
         FBotao := nil;
         if FSlServicos.Values['UMSvcIntegraBiblioshop'] = 'S' then
         begin
            FBiblioshop := TfBiblioshop.Create(Self);
            bnBiblioshop.Visible := True;
         end;
         if FSlServicos.Values['UMSvcIntegraTasy'] = 'S' then
         begin
            FTasy := TfTasy.Create(Self);
            bnTasy.Visible := True;
         end;
         if FSlServicos.Values['UMSvcIntegraBorgesMendonca'] = 'S' then
         begin
            FBorges := TfBorges.Create(Self);
            bnBorges.Visible := True;
         end;
         if FSlServicos.Values['UMSvcRecados'] = 'S' then
         begin
            FRecados := TfRecado.Create(Self);
            bnRecados.Visible := True;
         end;
      end
      else
      begin
         Application.Terminate;
         Application.ProcessMessages;
      end;
   end
   else
   begin
      Application.Terminate;
      Application.ProcessMessages;
   end;
end;

procedure TfPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if bnSalvar.Enabled then
            bnSalvarClick(nil);
      VK_F6:
         if bnDescartar.Enabled then
            bnDescartarClick(nil);
      VK_F12:
         if bnSair.Enabled then
            bnSairClick(nil);
   end;
end;

procedure TfPrincipal.VerificaAlteracoes;
const
   ServicoAsStr: array[TUMServicos] of string =
      ('Biblioshop', 'Tasy', 'Borges de Mendonça', 'Recados');
   S_PERGUNTA_SALVAR =
      'Foram efetuadas alterações na configuração do serviço "%s".' + #13 +
      'Deseja salvar as alterações antes de prosseguir?';
var
   LResultMsg: integer;
begin
   if bnSalvar.Enabled and bnDescartar.Enabled then
   begin
      LResultMsg := Mensagem(
         Format(S_PERGUNTA_SALVAR, [ServicoAsStr[FUMServicoSel]]),
         'Confirmação', MB_ICONQUESTION + MB_YESNO, Self.Handle);
      case LResultMsg of
         ID_YES:
            bnSalvarClick(nil);
         ID_NO:
            bnDescartarClick(nil);
      end;
      bnSalvar.Enabled := false;
      bnDescartar.Enabled := false;
   end;
end;

end.
