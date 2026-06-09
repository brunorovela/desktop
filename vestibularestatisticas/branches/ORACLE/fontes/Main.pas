unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, General, IniFiles, StdCtrls, ImgList, Buttons, ToolWin, DBTables,
  UCrpe32, UCrpeClasses, DBCtrls, uUsuario, uLoginManager, uTrataExcecao;

type
  TPrincipalForm = class(TForm)
    popConfiguracoes: TPopupMenu;
    TrocarUsurio1: TMenuItem;
    Report: TCrpe;
    ImageList2: TImageList;
    toolFinanceiro: TToolBar;
    ToolButton19: TToolButton;
    btnFinanceiro: TToolButton;
    ToolButton2: TToolButton;
    btnFinanceiroCadastro: TToolButton;
    ToolButton3: TToolButton;
    btnFinanceiroSair: TToolButton;
    ToolButton18: TToolButton;
    ToolButton11: TToolButton;
    btnFinanceiroConfiguracoes: TToolButton;
    BarraDeStatus: TToolBar;
    traco1: TToolButton;
    btnUsuario: TToolButton;
    traco2: TToolButton;
    traco3: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    traco4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    popRelatorios: TPopupMenu;
    ListadeAprovados1: TMenuItem;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    ListadeaprovadosNomesidnticos1: TMenuItem;
    ListadeaprovadosNomesSemelhantes1: TMenuItem;
    N1: TMenuItem;
    Parmetros1: TMenuItem;
    procedure Parmetros1Click(Sender: TObject);
    procedure ListadeAprovados1Click(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure MduloseUsurios1Click(Sender: TObject);
    procedure UsuriosMdulos2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure btnFinanceiroCadastroClick(Sender: TObject);
    procedure btnDatasClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure ListadeaprovadosNomesidnticos1Click(Sender: TObject);
    procedure ListadeaprovadosNomesSemelhantes1Click(Sender: TObject);
  private

    { Private declarations }
    function MostraVersao : String ;

  public

    { Public declarations }
    function ProcuraForm(frmForm : TForm):Boolean;
    { # Função:     ProcuraForm
      # Descrição:  Verifica se o formulário está carregado na tela
      # Retorno:    Boolean (True quando está carregado)
      #
      # Parametros: frmForm: Nome do formulário
    }
    Function PrintRpt(AReport:String;ACabecalho:String;ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String; const AFields: Array of String;
	     const AValues: Array of String;const ASortFields: Array of String;ADialog: Boolean):Boolean;
    {
    #FDES= Imprime o relatório do Crystal report
    #FRET= Boolean (True quando o relatório foi impresso corretamente)
    #FPAR= AReport= Nome do relatório
    #FPAR= ASelectionFormula= Fórmula do Crystal para filtro do relatório
    #FPAR= AFields= Lista de nomes dos campos de fórmulas
    #FPAR= AValues= Valores dos campos de fórmulas
    #FPAR= ASortFields= Lista de campos para ordenação
    #FPAR= ADialog= True se precisa apresentar a pergunta para visualizar
    #FAUT= Jonathan
    #FMOD= ...
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
  end;

var
  PrincipalForm: TPrincipalForm;
  DataHoje : TDateTime;
  strWindows : String;
  ano_semestre : Integer;
  ano_semestre_incremento : Byte;

Const
 SenhaBD = 'B251EA051EB116C178EF73A1579339FC2A';
 UsuarioBD = '1FD96898B024A247E664';

implementation

uses uDataHoje, uDM, uUsuarios, uErro, uRelatorios,
  uImportacao, uParametros, uIUMDataModule;

{$R *.DFM}

Function TPrincipalForm.PrintRpt(AReport:String; ACabecalho:String;
                  ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String;
                  const AFields: Array of String;
                  const AValues: Array of String;
                  const ASortFields: Array of String;
                  ADialog: Boolean):Boolean;
var
  n : Integer;
  i : integer;
begin

    if not FileExists(DM.strReports + '\' + AReport) Then
    Begin

       Messagedlg('Não foi encontrado o arquivo de relatório: ' + AReport, mtWarning, [mbOk], 0);
       Exit;

    End;

    Report.ReportName := DM.strReports + '\' + AReport;

    { O arquivo CRPE.DLL deve estar na mesma pasta do executável }

    Report.Clear;

    Report.WindowState := wsMaximized;

    Report.DiscardSavedData;

    { A pasta de relatórios strReports é configurada no arquivo wmestre.ini }
    Report.ReportName := DM.strReports + '\' + AReport;

    Report.Connect.Clear();
    Report.Connect.ServerName := 'unimestre';
    Report.Connect.DatabaseName := 'unimestre';
    Report.Connect.UserID :=  DM.db.User;
    Report.Connect.Password := DM.db.Password;
    //Report.Connect.Propagate := True;

    Report.ReportTitle := Application.Title;

    //Mostra a Janela de configuracao da impressora
    if DM.variavel_parametro('relatorios_apresentar_impressora') = 'S' then
       Report.Printer.Prompt();


    Report.Selection.Formula.Clear;
    Report.Selection.Formula.Add( ASelectionFormula );

    Report.GroupSelection.Formula.Clear;
    Report.GroupSelection.Formula.Add( AGroupFormula );

    for n := Low(AFields) to High(AFields) do
    Begin
     try
       if Report.Formulas.IndexOf(AFields[n]) > 0 then
          Report.FormulaByName(AFields[n]).Formula.Text := AValues[n];
     except

     end;

    End;

    { Acrescentar as fórmulas fixas }

    // Título do relatório

    if ATitulo <> '' Then
       if Report.Formulas.IndexOf('nm_titulo') > 0 then
          Report.FormulaByName('nm_titulo').Formula.Text := '"' + ATitulo + '"';

    if AFiltro <> '' Then
       if Report.Formulas.IndexOf('ds_filtro') > 0 then
          Report.FormulaByName('ds_filtro').Formula.Text := AFiltro;

    // Filtros dos relatórios

    { fim das fórmulas fixas }


    if Length(ASortFields) > 0 then
    begin
      Report.SortFields.Clear;

      for n := Low(ASortFields) to High(ASortFields) do
      begin
        Report.SortFields.Add(ASortFields[n]);
        Report.SortFields.Items[Report.SortFields.ItemIndex].Direction := sdAscending;
      end;
    end;

    { Verificar cabeçalho do relatorio }

    Report.Output := toPrinter;

    if ADialog then
    begin
      case Mensagem( 'Deseja visualizar antes de imprimir?', Application.Title,
	  MB_YESNOCANCEL + MB_ICONQUESTION ) of
	  ID_NO :  PrincipalForm.Report.Output := toPrinter;
	  ID_YES : PrincipalForm.Report.Output := toWindow;
	  ID_CANCEL: begin
	  Report.CloseEngine;
	  Result := False;
	  Exit;
	end;
      end;
    end
    else
      Report.Output := toPrinter;

    Report.Printer.SetCurrent;

    if not Report.execute then
    begin
       	Report.CloseEngine;
      	Screen.Cursor := crDefault;
      	Result := False;
     	  Exit;
    end;

    while not Report.PrintEnded do Application.ProcessMessages;
    Report.CloseJob;

    Result := True;

end; { PrintRpt }


procedure TPrincipalForm.FormShow(Sender: TObject);
var
  wAno, wMes, wDia : Word;
begin

   if not DM.db.Connected then Exit;

   if not DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'EstatisticasVestibular.Modulo.Acesso', npAcesso, True) then
   begin
      Application.Terminate;
   end;

   DataHoje := DM.DataAtual();

   if (DM.GetUsuarioLogado.TemPermissao( 1026, npAcesso , False )) then
   Begin
      Application.CreateForm(TfrmDataHoje, frmDataHoje);
      frmDataHoje.ShowModal;
   end;

   btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;
   btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) + ' - ' + FormatDateTime( 'dddd', DataHoje );

   { Pegar AnoSemestre Atual }

   DecodeDate(DataHoje,wAno,wMes,wDia);

   if DM.variavel_parametro('ano_semestre_incremento') = '2' then
      ano_semestre_incremento := 2
   else
      ano_semestre_incremento := 1;

   if ano_semestre_incremento = 1 then
      if wMes >= 7 then
         Ano_Semestre := StrToInt(FormatDateTime('yyyy',DataHoje)+'2')
      else
         Ano_Semestre := StrTOInt(FormatDateTime('yyyy',DataHoje)+'1')
   else
      Ano_Semestre := StrTOInt(FormatDateTime('yyyy',DataHoje)+'1');


   PrincipalForm.Caption := Application.Title + '  (' + MostraVersao + ')';

   { Configurar posição da Data }
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);

end; { FormShow }


procedure TPrincipalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if Mensagem( 'Deseja realmente sair do sistema ?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

     CanClose := True;
     Dm.db.Disconnect;

  end
  else

    CanClose := False;

end; { FormCloseQuery }


procedure TPrincipalForm.FormCreate(Sender: TObject);
var
  pWindows : PChar;
  n : Integer;
begin

  Application.OnException := TTrataExcecao.Create(nil).TrataExcecao;

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


procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
begin
   if not TLoginManager.GetInstancia().RealizarLogin(False, False) then
   begin
      Application.Terminate;
   end;
   
   btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;
end;

procedure TPrincipalForm.btnSairClick(Sender: TObject);
begin
   Close;
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

end; {ProcuraForm }

procedure TPrincipalForm.MostraHint(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(Application.Hint);

end; { MostraHint }


procedure TPrincipalForm.MostraHint2(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(TWinControl(Sender).Hint);

end;

procedure TPrincipalForm.MduloseUsurios1Click(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 3001, npAcesso, True ) then
   begin
      Exit;
   end;

   Application.CreateForm( TfrmUsuarios, frmUsuarios );
   frmUsuarios.Show;
end;

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
        freeMem( ptrVerBuf );
      end;
    end;
  result := strVersion;
end;

procedure TPrincipalForm.FormResize(Sender: TObject);
begin
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);
end;

procedure TPrincipalForm.UsuriosMdulos2Click(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 3001, npAcesso, True ) then
   begin
      Exit;
   end;

   if not ProcuraForm( TForm(frmUsuarios) ) then
      Application.CreateForm( TfrmUsuarios, frmUsuarios )
   else
      frmUsuarios.Show;
end;

procedure TPrincipalForm.ToolButton6Click(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 6002, npAcesso, True ) then
   begin
      Exit;
   end;

   Application.CreateForm(Tfrm_Relatorios, frm_Relatorios);

   frm_Relatorios.Modulo := 6 ;
   frm_Relatorios.ShowModal;

end;

procedure TPrincipalForm.btnFinanceiroCadastroClick(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 6001, npAcesso, True ) then
   begin
      Exit;
   end;

   if not ProcuraForm( TForm(frm_Importacao) ) then
      Application.CreateForm( Tfrm_Importacao, frm_Importacao )
   else
      frm_Importacao.Show;

end;

procedure TPrincipalForm.btnDatasClick(Sender: TObject);
begin

   if DM.GetUsuarioLogado.TemPermissao( 1026, npAcesso, False ) then
   begin
      Application.CreateForm(TfrmDataHoje, frmDataHoje);
      frmDataHoje.ShowModal;
   end
   else
   begin
      DataHoje := DM.DataAtual();
   end;

   btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) + ' - ' + FormatDateTime( 'dddd', DataHoje );

end;

procedure TPrincipalForm.ListadeAprovados1Click(Sender: TObject);
begin
  PrintRpt('repListaAprovadosVestibular.rpt', '', '({alunos_vestibular.ds_status}="Idêntico" OR {alunos_vestibular.ds_status}="Semelhante")', '', '', '', [], [], [], true);
end;

procedure TPrincipalForm.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TPrincipalForm.ListadeaprovadosNomesidnticos1Click(
  Sender: TObject);
begin
   PrintRpt('repListaAprovadosVestibular.rpt', '', '{alunos_vestibular.ds_status}="Idêntico"', '', '', '', [], [], [], true);
end;

procedure TPrincipalForm.ListadeaprovadosNomesSemelhantes1Click(
  Sender: TObject);
begin
   PrintRpt('repListaAprovadosVestibular.rpt', '', '{alunos_vestibular.ds_status}="Semelhante"', '', '', '', [], [], [], true);
end;

procedure TPrincipalForm.Parmetros1Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 6041, npAcesso, True ) then Exit;

   if not ProcuraForm( TForm(frmParametros) ) then
   begin
      Application.CreateForm(TfrmParametros, frmParametros)
   end
   else
   begin
      frmParametros.Show;
   end;

   frmParametros.Filtra(VestibularEstatisticas, DM.db, DM.GetUsuarioLogado.TemPermissao( 6041, npAlterar, False ));
end;

end.
