unit Main;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Menus, ExtCtrls,  IniFiles, StdCtrls, ImgList, Buttons, ToolWin, DBTables, DBCtrls,
   ExtDlgs, uXML, General, ShellApi, md5;

type
   TPrincipalForm = class(TForm)
      bnSep6: TToolButton;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   strict private
      sModoTerminal:string;
      function getTituloApp: string;
      function getNumeroVersao: string;
   published
      ImageList2: TImageList;
      toolFinanceiro: TToolBar;
      btnSep1: TToolButton;
      btnIniciarTerminal: TToolButton;
      btnSep2: TToolButton;
      btnEncerrarPeriodo: TToolButton;
      btnSair: TToolButton;
      BarraDeStatus: TToolBar;
      traco1: TToolButton;
      traco2: TToolButton;
      traco3: TToolButton;
      btnDatas: TToolButton;
      ImagensMenu: TImageList;
      pnlMsg: TPanel;
      traco4: TToolButton;
      btnSep3: TToolButton;
      mmPrincipal: TMainMenu;
      miPrincipal: TMenuItem;
      miIniciarTerminal: TMenuItem;
      CalcularFrequncia1: TMenuItem;
      N1: TMenuItem;
      imSair: TMenuItem;
      opdImagem: TOpenPictureDialog;
      btnInscrever: TToolButton;
      popConfiguracoes: TPopupMenu;
      TrocarUsurio1: TMenuItem;
      MenuItem1: TMenuItem;
      Parmetros2: TMenuItem;
      btnImportar: TToolButton;
      odArquivo: TOpenDialog;
      ToolButton3: TToolButton;
      procedure btnEncerrarPeriodoClick(Sender: TObject);
      procedure btnImportarClick(Sender: TObject);
      procedure imSairClick(Sender: TObject);
      procedure miIniciarTerminalClick(Sender: TObject);
      procedure tblLogoClick(Sender: TObject);
      procedure btnIniciarTerminalClick(Sender: TObject);
      procedure registrarCertificados(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormResize(Sender: TObject);
      procedure TrocarUsurio1Click(Sender: TObject);
      procedure btnSairClick(Sender: TObject);
      procedure btnDatasClick(Sender: TObject);
      procedure chamaPreInscricao(Sender: TObject);
      private

      { Private declarations }
      function MostraVersao : String ;

      public

      FUMTerminalAcessoXML: TUMTerminalAcessoXML;
      { Public declarations }
      function ProcuraForm(frmForm : TForm):Boolean;



      {
      Function PrintRpt(AReport:String;ACabecalho:String;ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String; const AFields: Array of String;
      const AValues: Array of String;const ASortFields: Array of String;ADialog: Boolean):Boolean;
      }

      Procedure MostraHint(Sender: TObject);
      { # Procedure   MostraHint
      # Descrição:  Redireciona o Hint da Aplicação para o painel no formulário principal
      #
      # Parametros: Sender : Usado pela própria aplicação
      }
      procedure MostraHint2(Sender: TObject);
      { # Procedure   MostraHint
      # Descrição:  Redireciona o Hint do objeto para o painel no formulário principal
      #
      # Parametros: Sender : Nome do objeto que dispara o Hint
      }
      Procedure MostraErro(Sender: TObject; E : Exception);
      { # Procedure   MostraErro
      # Descrição:  Apresenta uma mensagem geral quando acontecer um erro
       e não foi tratado pelo sistema
      #
      # Parametros: Sender : Nome do Objeto que causou o erro
                 E : Exceção gerada
      }
      procedure setModoTerminal(sModo:string);
      function getModoTerminal:string;
   end;

var
  PrincipalForm: TPrincipalForm;
  DataHoje : TDateTime;
  strWindows : String;
  strPrograma : String;
  strReports : String;
  ano_semestre : Integer;
  ano_semestre_incremento : Byte;

Const
  SenhaBD = 'UniMestreProSurf';
  C_MODO_OFFLINE    = 'mod-off-line';
  C_MODO_ONLINE     = 'mod-on-line';
  
implementation

uses
   uTerminal, DB, DM, uTerminalOnline,uModelTam, uEscolhaAtividade,
   uCertificados, uModoTrabalho;

{$R *.DFM}

procedure TPrincipalForm.FormShow(Sender: TObject);
begin

   fModoTrabalho.ShowModal;
   
   if(Self.sModoTerminal = C_MODO_OFFLINE) then
   begin
     btnIniciarTerminal.Enabled:= false;
     btnEncerrarPeriodo.Enabled:= False;
     Self.btnInscrever.Enabled := FileExists(ExtractFileDir(ParamStr(0)) + '\taminscricoes\TAMInscricoes.exe');
     Self.Caption := Self.getTituloApp;

   end
   else
   if (Self.sModoTerminal = C_MODO_ONLINE) then
   begin
      Self.btnImportar.Enabled := false;
      Self.btnIniciarTerminal.Enabled := true;
      Self.btnEncerrarPeriodo.Enabled:=true;

   end;
   Self.Caption := Self.getTituloApp;
end;

function TPrincipalForm.getTituloApp: string;
begin
   Result := Application.Title +' (' + Self.getNumeroVersao + ')';
end;

function TPrincipalForm.getNumeroVersao: string;
var
   dwInfoSize, dwVerSize, dwWnd: DWORD;
   FI: PVSFixedFileInfo;
   ptVerBuff: Pointer;
   sFileName, sVersion: string;
begin
   sFileName := Application.ExeName;
   dwInfoSize := GetFileVersionInfoSize(PChar(sFileName), dwWnd);
   if dwInfoSize = 0 then
   begin
      Result := 'UMTerminalAcesso';
   end
   else
   begin
      GetMem(ptVerBuff, dwInfoSize);
      try
         if GetFileVersionInfo(PChar(sFileName), dwWnd, dwInfoSize, ptVerBuff) then
         begin
            if VerQueryValue(ptVerBuff, '\', Pointer(FI),dwVerSize) then
            begin
               sVersion :=
                  Format(  '%d.%d.%d.%d',
                           [HiWord(FI.dwFileVersionMS),
                           LoWord(FI.dwFileVersionMS),
                           HiWord(FI.dwFileVersionLS),
                           LoWord(FI.dwFileVersionLS)]);
            end;
         end;
      finally
         FreeMem(ptVerBuff);
      end;
      Result := sVersion;
   end;
end;


{ FormShow }


procedure TPrincipalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TPrincipalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin


end;

procedure TPrincipalForm.FormCreate(Sender: TObject);
begin

end;

{ FormCloseQuery }


procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
{ Trocar de Usuários }
begin
  {
  if PasswordDlg.EfetuaLogin() then
  begin
    btnUsuario.Caption := ' USUÁRIO : ' + DM.qyUsuariosNome.FieldByName('Nome').AsString;
  end;
  }
end; { TrocarUsurio1Click }

procedure TPrincipalForm.btnSairClick(Sender: TObject);
{ Sair do Sistema }
begin
  close;
end;

procedure TPrincipalForm.chamaPreInscricao(Sender: TObject);
begin
   ShellExecute(Self.Handle, 'open', 'TAMInscricoes.exe', nil, PChar(ExtractFileDir(ParamStr(0)) + '\taminscricoes\'), SW_SHOWMAXIMIZED);
end;

function TPrincipalForm.ProcuraForm(frmForm : TForm):Boolean;
var
  n : Integer;
begin
   Result := False;

   for n := 0 to MDIChildCount - 1 do
   begin
      if MDIChildren[n] = frmForm then
      begin
	      Result := True;
	      Break;
      end;
   end;
end;

procedure TPrincipalForm.registrarCertificados(Sender: TObject);
begin
   if not Self.ProcuraForm(fCertificados) then
   begin
      Application.CreateForm(TfCertificados, fCertificados);
   end;
   fCertificados.Show;
end;

{ProcuraForm }

procedure TPrincipalForm.MostraHint(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(Application.Hint);

end; { MostraHint }


procedure TPrincipalForm.MostraHint2(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(TWinControl(Sender).Hint);

end;  { MostraHint2 }


procedure TPrincipalForm.MostraErro(Sender: TObject; E: Exception);
begin

   if Pos('Duplicate entry', E.Message) > 0 then
      Mensagem('Cadastro Duplicado! O sistema detectou informações duplicadas neste cadastro.','Atenção', MB_OK)
   else
   Begin
      //frm_erro.lbErro.Caption := E.Message;
      //frm_Erro.ShowModal;
   End;

end;  { MostraErro }



function TPrincipalForm.MostraVersao: String;
const
   NOVIDATA = '';

var
  dwInfoSize,           // Size of VERSIONINFO structure
  dwVerSize,            // Size of Version Info Data
  dwWnd: DWORD;         // Handle for the size call.
  FI: PVSFixedFileInfo; // Delphi structure; see WINDOWS.PAS
  ptrVerBuf: Pointer;   // pointer to a version buffer
  strFileName,          // Name of the file to check
  strVersion : string;  // Holds parsed version number
begin

   strFileName := Application.ExeName;
   dwInfoSize :=
      getFileVersionInfoSize( pChar( strFileName ), dwWnd);

   if ( dwInfoSize = 0 ) then
      result := NOVIDATA
   else
   begin

      getMem( ptrVerBuf, dwInfoSize );
      try

         if getFileVersionInfo( pChar( strFileName ),
            dwWnd, dwInfoSize, ptrVerBuf ) then

            if verQueryValue( ptrVerBuf, '\',
                              pointer(FI), dwVerSize ) then

            strVersion :=   
               format( '%d.%d.%d.%d',
                       [ hiWord( FI.dwFileVersionMS ),
                         loWord( FI.dwFileVersionMS ),
                         hiWord( FI.dwFileVersionLS ),
                         loWord( FI.dwFileVersionLS ) ] );

      finally
        FreeMem( ptrVerBuf );
      end;
    end;
  Result := strVersion;
end;

procedure TPrincipalForm.FormResize(Sender: TObject);
begin
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width +btnDatas.Width);
end;



procedure TPrincipalForm.btnDatasClick(Sender: TObject);
begin
   
  btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) + ' - ' + FormatDateTime( 'dddd', DataHoje );

end;


procedure TPrincipalForm.btnEncerrarPeriodoClick(Sender: TObject);
begin


   if Mensagem('Tem certeza que deseja encerrar todas as entradas abertas?', 'Confirmação', MB_YESNO) = IDYES then
   begin
      if(sModoTerminal = C_MODO_OFFLINE) then
      begin
         FUMTerminalAcessoXML.UMEvento.fechaEntradas();
         FUMTerminalAcessoXML.salvaXML();
      end
      else if (sModoTerminal = C_MODO_ONLINE) then
      begin
         if not Assigned(oEventoSel) or not Assigned(oAtividadeSel) then
         begin
            Mensagem('Nenhuma atividade inciada!', 'Informação', MB_OK + MB_ICONINFORMATION);
            exit;
         end;
         //Fecha as entradas do evento selecionado
         TUMEvento.fecharEntradas(oEventoSel,oAtividadeSel);
      end;
      Mensagem('Todas as entradas em aberto foram finalizadas!', Application.Title,MB_OK+MB_ICONINFORMATION);
      Self.Close;
   end else
   begin
      Mensagem('Nenhuma operação efetuada!', 'Informação', MB_OK + MB_ICONINFORMATION);
   end;
end;

procedure TPrincipalForm.btnImportarClick(Sender: TObject);
var
   sChave: string;
begin
  odArquivo.Execute;
  if odArquivo.FileName <> '' then begin
    try
      Self.FUMTerminalAcessoXML := TUMTerminalAcessoXML.Create(Self);
      Self.FUMTerminalAcessoXML.carregaXML(odArquivo.FileName);
      PasswordInputQuery(Application.Title, 'Informe a chave de acesso ao arquivo', sChave, #42);
      if MD5Print(MD5String(sChave)) = Self.FUMTerminalAcessoXML.UMEvento.Senha then
      begin
         btnIniciarTerminal.Enabled:= True;
         btnEncerrarPeriodo.Enabled:= True;
         Mensagem('Arquivo '+odArquivo.FileName+' importado com sucesso!',Application.Title, MB_OK+MB_ICONINFORMATION);
      end
      else
      begin
         Mensagem('Chave inválida!', Application.Title, MB_OK + MB_ICONINFORMATION);
         btnIniciarTerminal.Enabled := False;
         btnEncerrarPeriodo.Enabled := False;
      end;
   except
      on E: EUMTAMXMLError do
         MessageBox(Self.Handle, PChar(E.Message), 'Erro!', MB_ICONERROR);
   end;
  end;

end;

procedure TPrincipalForm.btnIniciarTerminalClick(Sender: TObject);
begin
  if(Self.sModoTerminal = C_MODO_OFFLINE) then
  begin
     Application.CreateForm(TfTerminal, fTerminal);
     fTerminal.ShowModal();
  end
  else if (Self.sModoTerminal = C_MODO_ONLINE) then
  begin
     Application.CreateForm(TfEscolheAtividade, fEscolheAtividade);
     fEscolheAtividade.ShowModal();
  end;

end;

procedure TPrincipalForm.tblLogoClick(Sender: TObject);
begin
  if opdImagem.Execute(Self.Handle) then begin
    if FileExists(opdImagem.FileName) then begin
      iniWMestre.WriteString('TerminalAcesso', 'Imagem', opdImagem.FileName);
    end;
  end;
end;

procedure TPrincipalForm.miIniciarTerminalClick(Sender: TObject);
begin
  btnIniciarTerminalClick(nil);
end;

procedure TPrincipalForm.imSairClick(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TPrincipalForm.setModoTerminal(sModo: string);
begin
  //Modifica o modo do terminal
  Self.sModoTerminal := sModo;
end;

function TPrincipalForm.getModoTerminal: string;
begin
  //pega o modo atual do terminal
  Result := Self.sModoTerminal;
  exit;
end;

end.
