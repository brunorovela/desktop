unit uMain;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Menus, ExtCtrls, uMGerais, IniFiles, StdCtrls, ImgList, Buttons, ToolWin, DBTables, DBCtrls,
   ExtDlgs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uDiretivas;

type
  TfMain = class(TForm)
    ImageList2: TImageList;
    toolFinanceiro: TToolBar;
    btnSep1: TToolButton;
    btnCadastro: TToolButton;
    btnSep2: TToolButton;
    btnSair: TToolButton;
    BarraDeStatus: TToolBar;
    traco1: TToolButton;
    btnUsuario: TToolButton;
    traco2: TToolButton;
    traco3: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    traco4: TToolButton;
    btnSep3: TToolButton;
    mmPrincipal: TMainMenu;
    miArquivo: TMenuItem;
    miArqSair: TMenuItem;
    ToolButton2: TToolButton;
    miAjuda: TMenuItem;
    miAjudaSobre: TMenuItem;
    btnAjuda: TToolButton;
    pmTray: TPopupMenu;
    btnExporta: TToolButton;
    miCadastro: TMenuItem;
    miCadCamposTab: TMenuItem;
    miCadTabelas: TMenuItem;
    N2: TMenuItem;
    miCadConsultas: TMenuItem;
    miCadLayouts: TMenuItem;
    miExportar: TMenuItem;
    miExpoArquivo: TMenuItem;
    procedure miAjudaSobreClick(Sender: TObject);
    procedure miExpoArquivoClick(Sender: TObject);
    procedure miCadLayoutsClick(Sender: TObject);
    procedure miCadConsultasClick(Sender: TObject);
    procedure miCadCamposTabClick(Sender: TObject);
    procedure miCadTabelasClick(Sender: TObject);
    procedure miArqSairClick(Sender: TObject);
    procedure btnDatasClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);

  private
     //AAtalhos: array of TMenuItem;
     function GetLayoutFromProcesso(cd_processo: Integer): Integer;
  public
    ALogado: Boolean;
    FDiretivas: TUMDiretivas;
    { Public declarations }
    procedure MostraHint(Sender: TObject);

    function VerificaParametros(): Boolean;

    procedure exportaByCommandLine(is_processo: Boolean = False);
  end;

var
  fMain: TfMain;
  Pref: TIniFile;

Const
  SenhaBD = 'UniMestreProSurf';

implementation

uses
   uMSistema, uMForms, uDM, uCadTabelas, uCadCampos,
   uCadConsultas, uCadLayout, uExporta, ShellAPI, uLoginManager, uUsuario,
  uPessoa;

{$R *.DFM}

procedure TfMain.FormCreate(Sender: TObject);
begin
   { Redirecional o Hint }
   Application.OnHint := MostraHint;
   FDiretivas := TUMDiretivas.Create();
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if (Mensagem('Você tem certeza que deseja sair do Sistema??', 'Atenção!!', MB_YESNO + MB_ICONQUESTION, Self.Handle) = mrYes) then begin
      CanClose := True;
      DM.ZConn.Disconnect();
   end
   else begin
      CanClose := False;
   end;
end;

procedure TfMain.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfMain.FormShow(Sender: TObject);
begin
   if not DM.ZConn.Connected then Application.Terminate();

   if not DM.GetUsuarioLogado.TemPermissao( 12000, npAcesso, True ) then
   begin
      Application.Terminate;
   end;

   btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;
   btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', Now() ) + ' - ' + FormatDateTime( 'dddd', Now() );
   Self.Caption := Application.Title + ' - UNINFORMARE INFORMÁTICA - (' + GetVersao() + ') ';

   { Configurar posição da Data }
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);

end;

function TfMain.GetLayoutFromProcesso(cd_processo: Integer): Integer;
begin
   with DM.qyAux do begin
      Close();
      SQL.Text := 'SELECT cd_layout FROM expo_processos WHERE cd_processo = :cd_processo';
      ParamByName('cd_processo').AsInteger := cd_processo;

      Open();

      Result := FieldByName('cd_layout').AsInteger;
   end;
end;

{ FormShow }

procedure TfMain.MostraHint(Sender: TObject);
begin
   pnlMsg.Caption := GetLongHint(Application.Hint)
end;

function TfMain.VerificaParametros(): Boolean;
begin
   Result := True;
   //cria os Parâmetros
   with FDiretivas do begin
      //secao onde o sistema ira veriifica login padrao
      addParametro('u', 'usuario', pitParametro, False, pivNenhum);
      addParametro('p', 'senha', pitParametro, False, pivNenhum);
      addParametro('l', 'layout', pitParametro, False, pivNumero);
      addParametro('e', 'layout_processo', pitParametro, False, pivNumero);
      addParametro('o', 'saida', pitParametro, False, pivArquivoValido);
      parseParametros();
   end;

   if (FDiretivas.hasErros()) then begin
      Mensagem(FDiretivas.getErros().Text);
      Result := False;
      Exit;
   end;

   ALogado := False;
   if FDiretivas.ParamByChave['u'].isDefinido() then begin
      with DM.qyAux do begin
         Close();
         SQL.Text := 'SELECT * FROM pessoas WHERE ds_login = :usuario AND ds_senha = :senha';
         ParamByName('usuario').AsString := FDiretivas.ParamByChave['u'].getValor();
         ParamByName('senha').AsString := FDiretivas.ParamByChave['p'].getValor();;
         Open();

         if not Eof then begin
            ALogado := True;         
            DM.FindUser(FDiretivas.ParamByChave['u'].getValor());
         end;
      end;
   end;

   //verifica o parâmetro layout e saida
   if (FDiretivas.ParamByChave['l'].isDefinido()) OR (FDiretivas.ParamByChave['e'].isDefinido()) then begin
      //exporta o bagulho.
      DM.usuario_logado := FDiretivas.ParamByChave['u'].getValor();
      exportaByCommandLine(FDiretivas.ParamByChave['e'].isDefinido());
      Result := False;
   end;
end;

procedure TfMain.btnUsuarioClick(Sender: TObject);
begin
   if TLoginManager.GetInstancia().RealizarLogin(False, False) then
   begin
      btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;
   end;
end;

procedure TfMain.exportaByCommandLine(is_processo: Boolean = False);
var
  fExporta: TfExportar;
  iLayout: Integer;
  ChaveParam: Char;
begin
   //oi
   if is_processo then
   begin
      ChaveParam := 'e';
      iLayout := GetLayoutFromProcesso(StrToInt(FDiretivas.ParamByChave[ChaveParam].getValor()));
   end
   else
   begin
      ChaveParam := 'l';
      iLayout := StrToInt(FDiretivas.ParamByChave[ChaveParam].getValor());
   end;

   fExporta := TfExportar.Create(Application);
   fExporta.FiltraDados();
   if (fExporta.qyRLayouts.Locate('cd_layout', iLayout,[])) then begin
      fExporta.Exportar(FDiretivas.ParamByChave['o'].getValor(), is_processo, StrToInt(FDiretivas.ParamByChave[ChaveParam].getValor()));
   end
   else begin
      //pau
   end;
   FreeAndNil(fExporta);
end;


procedure TfMain.FormResize(Sender: TObject);
begin
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);
end;

procedure TfMain.btnDatasClick(Sender: TObject);
begin
  btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', Now() ) + ' - ' + FormatDateTime( 'dddd', Now() );
end;

procedure TfMain.miArqSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfMain.miCadTabelasClick(Sender: TObject);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12001, npAcesso, True)) then begin
      Exit;
   end;


   if not ProcuraForm(Self, fCadTabelas) then begin
      Application.CreateForm(TfCadTabelas, fCadTabelas);
   end;
   fCadTabelas.Show();
end;

procedure TfMain.miCadCamposTabClick(Sender: TObject);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12002, npAcesso, True)) then begin
      Exit;
   end;

   if not ProcuraForm(Self, fCadCampos) then begin
      Application.CreateForm(TfCadCampos, fCadCampos);
   end;
   fCadCampos.Show();
end;

procedure TfMain.miCadConsultasClick(Sender: TObject);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12004, npAcesso, True)) then begin
      Exit;
   end;

   if not ProcuraForm(Self, fCadConsultas) then begin
      Application.CreateForm(TfCadConsultas, fCadConsultas);
   end;
   fCadConsultas.Show();
end;

procedure TfMain.miCadLayoutsClick(Sender: TObject);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12003, npAcesso, True)) then begin
      Exit;
   end;

   if not ProcuraForm(Self, fCadLayout) then begin
      Application.CreateForm(TfCadLayout, fCadLayout);
   end;
   fCadLayout.Show();
end;

procedure TfMain.miExpoArquivoClick(Sender: TObject);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12000, npAcesso, True)) then begin
      Exit;
   end;

   if not ProcuraForm(Self, fExportar) then begin
      Application.CreateForm(TfExportar, fExportar);
   end;
   fExportar.Show();
end;

procedure TfMain.miAjudaSobreClick(Sender: TObject);
begin
   ShellAbout(Self.Handle, 'Exportação', 'Direitos autorais reservados a'#13'Uninformare Informática LTDA.', Application.Icon.Handle);
end;

end.
