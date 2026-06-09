{ Tela principal - Módulo Configurações }
{ Data Revisão: 02/10/2003 }

unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, IniFiles, StdCtrls, ImgList, Buttons, ToolWin, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmPrincipal = class(TForm)
    ImgMenuPrinc: TImageList;
    toolParametros: TToolBar;
    ToolButton19: TToolButton;
    btParametros: TToolButton;
    btnSair: TToolButton;
    ToolButton18: TToolButton;
    ToolButton11: TToolButton;
    MenuAcademico: TMainMenu;
    MenuItem13: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem52: TMenuItem;
    BarraDeStatus: TToolBar;
    ToolButton39: TToolButton;
    btnUsuario: TToolButton;
    ToolButton41: TToolButton;
    ToolButton43: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    ToolButton21: TToolButton;
    btnBaseDados: TToolButton;
    btnBackup: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    btnCenso: TToolButton;
    ToolButton7: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    btnRelatorios: TToolButton;
    ToolButton9: TToolButton;
    procedure btnRelatoriosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDatasClick(Sender: TObject);
    procedure btParametrosClick(Sender: TObject);
    procedure btnOnlineClick(Sender: TObject);
    procedure btnParametrosRestritosClick(Sender: TObject);
    procedure btnOnlineRestritosClick(Sender: TObject);
    procedure btnBaseDadosClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCensoClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
     function MostraVersao: String;    
  public
    { Public declarations }

    function ProcuraForm(frmForm : TForm):Boolean;

    { # Função:     ProcuraForm
      # Descrição:  Verifica se o formulário está carregado na tela
      # Retorno:    Boolean (True quando está carregado)
      #
      # Parametros: frmForm: Nome do formulário
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
  end;

var
  frmPrincipal: TfrmPrincipal;
  DataHoje : TDateTime;
  strWindows : String;
  strPrograma : String;
  strReports : String;
  ano_semestre : integer;
  ano_semestre_incremento : Byte;
  toTrayOnClose: Boolean;

implementation

uses uDM, uSplash, uSenha, uDataHoje, uParametros, uOnline,
  uParametrosRestritos, uOnlineRestritos, uBaseDados, uBackup, uCenso,
  uSenhas, uRelatorios, ZConnection, unBAckupAgendado;

{$R *.DFM}

function TfrmPrincipal.MostraVersao: String;
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
        freeMem( ptrVerBuf );
      end;
    end;
  result := strVersion;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  autologin : boolean;
begin

   DM.db.Disconnect;
   DM.db.Connect;

   { Login do Usuário }
   frmSplash.Close;

   autologin := false;
   if (ParamStr(1) <> '') AND (ParamStr(2) <> '') AND (DM.FindUser(ParamStr(1))) then begin
     with DM.qyAux do begin
      Close();
      SQL.Text := 'SELECT * FROM usuarios WHERE nome = :usuario AND senha = :senha AND online = ''S''';
      ParamByName('usuario').AsString := ParamStr(1);
      ParamByName('senha').AsString := ParamStr(2);
      Open();
      if not Eof then
        autologin := true;
     end;
   end;

   if not autologin then begin
     frmSenha.ShowModal;
     frmDataHoje.ShowModal;
   end else begin
     DataHoje := Date;
   end;

   btnUsuario.Caption := ' USUÁRIO : ' + DM.tblUsuariosNomeNome.AsString;
   btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) +
                       ' - ' + FormatDateTime( 'dddd', DataHoje );
   frmPrincipal.Caption := Application.Title + '  (' + MostraVersao + ')';

  { Incremento de ano_semestre }
   if DM.variavel_parametro('ano_semestre_incremento') = '2' then
      ano_semestre_incremento := 2
   else
      ano_semestre_incremento := 1;

   { Definição de ano_semestre }
   if ano_semestre_incremento = 1 then
      if StrToInt(FormatDateTime('MM', DataHoje)) >= 7 then
         Ano_Semestre := StrToInt(FormatDateTime('yyyy',DataHoje)+'2')
      else
         Ano_Semestre := StrTOInt(FormatDateTime('yyyy',DataHoje)+'1')
   else
      Ano_Semestre := StrTOInt(FormatDateTime('yyyy',DataHoje)+'1');

end; { FormShow }


procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;

  if frmBackup <> nil then
    if frmBackup.Cursor = crSQLWait then Exit;

  if Mensagem( 'Deseja realmente sair do sistema ?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

     //CanClose := True;

     if toTrayOnClose then
     begin
       Self.Hide;
       Application.CreateForm(TfrmBackupAgendado, frmBackupAgendado);
       frmBackupAgendado.Show;
     end
     else
       CanClose := True;

  end
  else

    CanClose := False;

end; { FormCloseQuery }


procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  pWindows : PChar;
begin

  { Aguarde Conectando Banco de Dados }
  frmSplash := TfrmSplash.Create(nil);
  frmSplash.Show;
  Application.ProcessMessages;

  { Pega o Path do Programa e do Relatório }

  strPrograma := iniWMestre.ReadString( 'Configuracoes', 'Programa', 'C:\UNIVERSITARIO' );
  strReports := iniWMestre.ReadString( 'Configuracoes', 'Relatorios', 'C:\UNIVERSITARIO' );

  { Diretório do Windows }
  pWindows := strAlloc( 144 );
  GetWindowsDirectory( pWindows, 144 );
  strWindows := strPas( pWindows );
  strDispose( pWindows );

  { Parâmetros Gerais }
  
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  CurrencyDecimals := 4;
  ShortDateFormat := 'dd/mm/yyyy';
  
  LongMonthNames[1] := 'Janeiro';
  LongMonthNames[2] := 'Fevereiro';
  LongMonthNames[3] := 'Março';
  LongMonthNames[4] := 'Abril';
  LongMonthNames[5] := 'Maio';
  LongMonthNames[6] := 'Junho';
  LongMonthNames[7] := 'Julho';
  LongMonthNames[8] := 'Agosto';
  LongMonthNames[9] := 'Setembro';
  LongMonthNames[10] := 'Outubro';
  LongMonthNames[11] := 'Novembro';
  LongMonthNames[12] := 'Dezembro';
  
  ShortMonthNames[1] := 'JAN';
  ShortMonthNames[2] := 'FEV';
  ShortMonthNames[3] := 'MAR';
  ShortMonthNames[4] := 'ABR';
  ShortMonthNames[5] := 'MAI';
  ShortMonthNames[6] := 'JUN';
  ShortMonthNames[7] := 'JUL';
  ShortMonthNames[8] := 'AGO';
  ShortMonthNames[9] := 'SET';
  ShortMonthNames[10] := 'OUT';
  ShortMonthNames[11] := 'NOV';
  ShortMonthNames[12] := 'DEZ';
  
  LongDayNames[1] := 'Domingo';
  LongDayNames[2] := 'Segunda-Feira';
  LongDayNames[3] := 'Terça-Feira';
  LongDayNames[4] := 'Quarta-Feira';
  LongDayNames[5] := 'Quinta-Feira';
  LongDayNames[6] := 'Sexta-Feira';
  LongDayNames[7] := 'Sábado';

  { Redirecional o Hint }

  Application.OnHint := MostraHint;


end;  { FormCreate }


procedure TfrmPrincipal.TrocarUsurio1Click(Sender: TObject);
{ Trocar de Usuários }
begin

  frmSenha.intTipo := 0;
  frmSenha.ShowModal;
  btnUsuario.Caption := ' USUÁRIO : ' + DM.tblUsuariosNomeNome.AsString;

end; { TrocarUsurio1Click }


procedure TfrmPrincipal.btnSairClick(Sender: TObject);
{ Sair do Sistema }
begin
  Close;
  //Self.Hide;
  //Application.CreateForm(TfrmBackupAgendado, frmBackupAgendado);
  //frmBackupAgendado.Show;
end; { btnSair }

function TfrmPrincipal.ProcuraForm(frmForm : TForm):Boolean;
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

end; {ProcuraForm }


procedure TfrmPrincipal.btnDatasClick(Sender: TObject);
{ Trocar data de Hoje }
begin
   if not Assigned(frmDataHoje) then
      Application.CreateForm(TfrmDataHoje, frmDataHoje);
   frmDataHoje.ShowModal;
end; { btnDatasClick }


procedure TfrmPrincipal.MostraHint(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(Application.Hint);

end; { MostraHint }


procedure TfrmPrincipal.MostraHint2(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(TWinControl(Sender).Hint);

end;  { MostraHint2 }


procedure TfrmPrincipal.MostraErro(Sender: TObject; E: Exception);
begin

   ShowMessage('Erro: ' + E.Message + #13 + Sender.ClassName);

end;  { MostraErro }


procedure TfrmPrincipal.btParametrosClick(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3003, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmParametros) ) then
  begin
     Application.CreateForm( TfrmParametros, frmParametros );
     frmParametros.Filtra(Configuracao, DM.db, frmSenha.Autorizar( 3003, taAlterar ));
  end
  else
     frmParametros.Show;
end;

procedure TfrmPrincipal.btnOnlineClick(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3003, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmOnline) ) then
     Application.CreateForm( TfrmOnline, frmOnline )
  else
     frmOnline.Show;
end;

procedure TfrmPrincipal.btnParametrosRestritosClick(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3006, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmParametrosRestritos) ) then
     Application.CreateForm( TfrmParametrosRestritos, frmParametrosRestritos )
  else
     frmParametrosRestritos.Show;
end;

procedure TfrmPrincipal.btnOnlineRestritosClick(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3004, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmOnlineRestritos) ) then
     Application.CreateForm( TfrmOnlineRestritos, frmOnlineRestritos )
  else
     frmOnlineRestritos.Show;
end;

procedure TfrmPrincipal.btnBaseDadosClick(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3007, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmBaseDados) ) then
     Application.CreateForm( TfrmBaseDados, frmBaseDados )
  else
     frmBaseDados.Show;
end;

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin

  if not frmSenha.Autorizar( 3008, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmBackup) ) then
     Application.CreateForm( TfrmBackup, frmBackup )
  else
     frmBackup.Show;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Self.Hide;
  //Application.CreateForm(TfrmBackupAgendado, frmBackupAgendado);
  //frmBackupAgendado.Show;
  DM.db.Disconnect;
end;

procedure TfrmPrincipal.btnCensoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCenso, frmCenso);
end;

procedure TfrmPrincipal.ToolButton4Click(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3009, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmSenhas) ) then
     Application.CreateForm( TfrmSenhas, frmSenhas )
  else
     frmSenhas.Show;
end;

procedure TfrmPrincipal.btnRelatoriosClick(Sender: TObject);
begin
  if not frmSenha.Autorizar( 3006, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmRelatorios) ) then
     Application.CreateForm( TfrmRelatorios, frmRelatorios )
  else
     frmRelatorios.Show;
end;

end.
