{
#TIT= Tela inicial do Módulo Financeiro
#OBJ= Menus e funções
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, IniFiles, StdCtrls, ImgList, Buttons, ToolWin, ZConnection, DBCtrls,
  ExtDlgs, uRelUtils, UCrpe32, UCrpeClasses, SynHighlighterSQL, uUsuario,
  uLoginManager, uDM, uTrataExcecao;

type
  TPrincipalForm = class(TForm)
    ImageList2: TImageList;
    tbLeitoraGabarito: TToolBar;                                                     
    btnSep1: TToolButton;
    tbProvas: TToolButton;
    btnSep2: TToolButton;
    btnSair: TToolButton;
    btnSep5: TToolButton;
    BarraDeStatus: TToolBar;
    traco1: TToolButton;
    btnUsuario: TToolButton;
    traco2: TToolButton;
    traco3: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    traco4: TToolButton;
    mmPrincipal: TMainMenu;
    miPrincipal: TMenuItem;
    Correes1: TMenuItem;
    Sair1: TMenuItem;
    tbCorrecoes: TToolButton;
    tbRelatorios: TToolButton;
    ToolButton4: TToolButton;
    Visualizar1: TMenuItem;
    N1: TMenuItem;
    pmCorrecoes: TPopupMenu;
    Visualizar2: TMenuItem;
    N2: TMenuItem;
    Corrigir2: TMenuItem;
    IniciarCorrees1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    popConfiguracoes: TPopupMenu;
    TrocarUsurio1: TMenuItem;
    MenuItem1: TMenuItem;
    Parmetros2: TMenuItem;
    Configuraes1: TMenuItem;
    rocarUsurio1: TMenuItem;
    N3: TMenuItem;
    Parmetros1: TMenuItem;
    Correomanual1: TMenuItem;
    N4: TMenuItem;
    CorreoManualPorQuesto1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ticoDebug: TTrayIcon;
    procedure ToolButton3Click(Sender: TObject);
    procedure CorreoManualPorQuesto1Click(Sender: TObject);
    procedure Correomanual1Click(Sender: TObject);
    procedure Parmetros2Click(Sender: TObject);
    procedure IniciarCorrees1Click(Sender: TObject);
    procedure Corrigir1Click(Sender: TObject);
    procedure Corrigir2Click(Sender: TObject);
    procedure Visualizar2Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure miPrincipalClick(Sender: TObject);
    procedure tbProvasClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure imSairClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDatasClick(Sender: TObject);
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
    

    Function PrintRpt(AReport:String;ACabecalho:String;ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String; const AFields: Array of String;
	     const AValues: Array of String;const ASortFields: Array of String;ADialog: Boolean):Boolean;
    }
   function ImprimeRpt(sRelatorio: string; iCodCabecalho: Integer = 1;
                        sFormulaSelecao: string = ''; sFormulaGrupo: string = '';
                        slFormulas: TStringList = nil; slOrdem: TStringList = nil;
                        slParamVariaveis: TStringList = nil; bDialogo: Boolean = False): Boolean;

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
  strPrograma : String;
  strReports : String;
  ano_semestre : Integer;
  ano_semestre_incremento : Byte;
  Relatorio : TCrpe;

Const
  SenhaBD = 'UniMestreProSurf';

implementation

uses uSplash, uErro, DB, uCadProvas, uCorrecoes, uDataHoje,
  uCorrigir, uParametros, uCorrecaoManual, uCorrecaoManualPorQuestao, 
  uCadProvasDiario;

{$R *.DFM}
{
function TPrincipalForm.PrintRpt(AReport:String; ACabecalho:String;
                  ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String;
                  const AFields: Array of String;
                  const AValues: Array of String;
                  const ASortFields: Array of String;
                  ADialog: Boolean):Boolean;  
var
  n : Integer;
begin

    if not FileExists(strReports + '\' + AReport) Then
    Begin

       Messagedlg('Não foi encontrado o arquivo de relatório: ' + AReport, mtWarning, [mbOk], 0);
       Result := False;
       Exit;

    End;

    Report.ReportName := strReports + '\' + AReport;

    // O arquivo CRPE.DLL deve estar na mesma pasta do executável

    Report.Clear;

    Report.WindowState := wsMaximized;

    Report.DiscardSavedData;

    // A pasta de relatórios strReports é configurada no arquivo wmestre.ini
    Report.ReportName := strReports + '\' + AReport;

    Report.Connect.Clear();
    Report.Connect.ServerName := 'unimestre';
    Report.Connect.DatabaseName := 'unimestre';
    Report.Connect.UserID := 'academico';
    Report.Connect.Password := SenhaBD;
    Report.Connect.Propagate := True;

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

    // Acrescentar as fórmulas fixas

    // Título do relatório

    if ATitulo <> '' Then
       if Report.Formulas.IndexOf('nm_titulo') > 0 then
          Report.FormulaByName('nm_titulo').Formula.Text := '"' + ATitulo + '"';

    if AFiltro <> '' Then
       if Report.Formulas.IndexOf('ds_filtro') > 0 then
          Report.FormulaByName('ds_filtro').Formula.Text := AFiltro;

    // Filtros dos relatórios

    // fim das fórmulas fixas


    if Length(ASortFields) > 0 then
    begin
      Report.SortFields.Clear;

      for n := Low(ASortFields) to High(ASortFields) do
      begin
        Report.SortFields.Add(ASortFields[n]);
        Report.SortFields.Items[Report.SortFields.ItemIndex].Direction := sdAscending;
      end;
    end;

    // Verificar cabeçalho do relatorio

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

end; // PrintRpt
}

{------------------- RELATORIO -----------------------}

function TPrincipalForm.ImprimeRpt(sRelatorio: string; iCodCabecalho: Integer = 1;
                    sFormulaSelecao: string = ''; sFormulaGrupo: string = '';
                    slFormulas: TStringList = nil; slOrdem: TStringList = nil;
                    slParamVariaveis: TStringList = nil; bDialogo: Boolean = False): Boolean;
var
  n : Integer;
  i : integer;
begin
    Result := False;

    if not FileExists(strReports + '\' + sRelatorio) then
    begin
       Mensagem('Não foi encontrado o arquivo de relatório: ' + sRelatorio, '', MB_OK + MB_ICONINFORMATION);
       Exit;
    end;

    Relatorio.ReportName := strReports + '\' + sRelatorio;

    Relatorio.WindowState := wsMaximized;
    if Relatorio.HasSavedData then begin
      Relatorio.DiscardSavedData();
    end;

    //conexao
    Relatorio.Connect.Clear();
    Relatorio.Connect.ServerName := 'unimestre';
    Relatorio.Connect.DatabaseName := 'unimestre';
    Relatorio.Connect.UserID :=  DM.db.User;
    Relatorio.Connect.Password := DM.db.Password;
    //Relatorio.Connect.Propagate := True;

    //titulo da janela de relatorio
    Relatorio.ReportTitle := Application.Title;

    if (iCodCabecalho > -1) then begin
      //carrega cabecalho
      if (RelObj.FindObjetoItem(iCodCabecalho) = -1) then begin
        DM.CabecalhoParamFixos();
        RelObj.Add(iCodCabecalho);
        RelObj.getObjetoItem(iCodCabecalho).ProcessaRelObjetos(DM.CabecalhoCampos(iCodCabecalho), slPFixos);
      end;

      //carrega o cabecalho
      RelObj.DefineCabecalho(Relatorio, 'Cabecalho', iCodCabecalho, slParamVariaveis);
    end;
    
    //Mostra a Janela de configuracao da impressora
    if DM.variavel_parametro('relatorios_apresentar_impressora') = 'S' then
       Relatorio.PrintOptions.Prompt();

    //define formula de selecao
    Relatorio.Selection.Formula.Clear;
    Relatorio.Selection.Formula.Add( sFormulaSelecao );

    //define formula de grupo
    if sFormulaGrupo <> '' then begin
       Relatorio.GroupSelection.Formula.Clear;
       Relatorio.GroupSelection.Formula.Add( sFormulaGrupo );
    end;

    //formulas
    if slFormulas <> nil then begin
       if slFormulas.Count > 0 then begin
         for i := 0 to (slFormulas.Count -1) do begin
           try
             n := Relatorio.Formulas.IndexOf(slFormulas.Names[i]);
             if (n > -1) then begin
               Relatorio.Formulas.Items[n].Formula.Text := slFormulas.ValueFromIndex[i];
             end;
           except
           end;
         end;
      end;
    end;

    //Define Ordem
    if slOrdem <> nil then begin
       if slOrdem.Count > 0 then begin

         Relatorio.SortFields.Clear();

         for i := 0 to (slOrdem.Count -1) do begin
           try
             Relatorio.SortFields.Add(slOrdem.Names[i]);
             if (Trim(slOrdem.ValueFromIndex[i]) = 'DESC') then
               Relatorio.SortFields.Items[Relatorio.SortFields.ItemIndex].Direction := sdDescending
             else
               Relatorio.SortFields.Items[Relatorio.SortFields.ItemIndex].Direction := sdAscending;
           except
           end;
         end;

       end;
    end;

    //define saida padrao
    Relatorio.Output := toPrinter;


    //verifica dialogo
    if (bDialogo) then begin
      case Mensagem( 'Deseja visualizar antes de imprimir?', '', MB_YESNOCANCEL + MB_ICONQUESTION) of
    	  mrNo  :  Relatorio.Output := toPrinter;
	      mrYes :  Relatorio.Output := toWindow;
	      mrCancel : begin
          Screen.Cursor := crDefault;
          Result := False;
          Exit;
	      end;
      end;
    end;


    //executa Relatorio
    if not Relatorio.Execute() then
    begin
      	Screen.Cursor := crDefault;
      	Result := False;
     	  Exit;
    end;
    {
    while not Relatorio.PrintEnded do begin
      Application.ProcessMessages;
    end;     }

    Result := True;

end; { PrintRpt }

procedure TPrincipalForm.FormShow(Sender: TObject);
var
  wAno, wMes, wDia : Word;
begin
   if not DM.db.Connected then Exit;

   if not DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'LeitoraGabarito.Modulo.Acesso', npAcesso, True ) then
   begin
      Application.Terminate;
   end;

   DataHoje := DM.DataAtual();

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


   { Configurar posição da Data }
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);

   { Configurando os parâmetros }
   DM.ConfiguraParametros();

   Corrigir2.Enabled := DM.variavel_parametro('lg_programa_leitora') <> '';
   IniciarCorrees1.Enabled := Corrigir2.Enabled;

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
begin
  Application.OnException := TTrataExcecao.Create(nil).TrataExcecao;
  
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

  //Relatorios
  RelObj := TRelObjetos.Create();
  Relatorio := TCrpe.Create(Application);

  Relatorio.LoadEngine();

  PrincipalForm.Caption := Application.Title + ' - ' +
                           DM.variavel_parametro('cliente_nome_fantasia') +
                           '  (' + MostraVersao + ')';
end;  { FormCreate }


procedure TPrincipalForm.ToolButton3Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7006, npAcesso, True ) then Exit;

   if not ProcuraForm(frmCadProvasDiario) then begin
      Application.CreateForm(TfrmCadProvasDiario, frmCadProvasDiario);
   end
   else begin
      frmCadProvasDiario.Show();
   end;
end;

procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
{ Trocar de Usuários }
begin
   if TLoginManager.GetInstancia().RealizarLogin(False, False) then
   begin
      Application.Terminate;
   end;

   btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;

   PrincipalForm.Caption := Application.Title + ' - ' +
                           DM.variavel_parametro('cliente_nome_fantasia') +
                           '  (' + MostraVersao + ')';
end; { TrocarUsurio1Click }

procedure TPrincipalForm.btnSairClick(Sender: TObject);
{ Sair do Sistema }
begin
  close;
end; { btnSair }

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

end;  { MostraHint2 }

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
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);
end;



procedure TPrincipalForm.btnDatasClick(Sender: TObject);
var
   frmDataHoje: TfrmDataHoje;
begin
   if DM.GetUsuarioLogado.TemPermissao( 1026, npAcesso, False ) then
   begin
      Application.CreateForm(TfrmDataHoje, frmDataHoje);
      frmDataHoje.ShowModal;

      btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) + ' - ' + FormatDateTime( 'dddd', DataHoje );
  end;
end;


procedure TPrincipalForm.imSairClick(Sender: TObject);
begin
  Application.Terminate();
end;

{
   if not ProcuraForm(frmConsulta) then begin
      Application.CreateForm(TfrmConsulta, frmConsulta);
   end
   else begin
      frmConsulta.Show();
   end;
}

procedure TPrincipalForm.Sair1Click(Sender: TObject);
begin
   btnSairClick(nil);
end;

procedure TPrincipalForm.tbProvasClick(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 7001, npAcesso, True ) then Exit;

   if not ProcuraForm(frmCadProvas) then begin
      Application.CreateForm(TfrmCadProvas, frmCadProvas);
   end
   else begin
      frmCadProvas.Show();
   end;

end;

procedure TPrincipalForm.miPrincipalClick(Sender: TObject);
begin
   tbProvasClick(nil);
end;

procedure TPrincipalForm.Visualizar1Click(Sender: TObject);
begin
   Visualizar2Click(nil);
end;

procedure TPrincipalForm.Visualizar2Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7002, npAcesso, True ) then Exit;

   if not ProcuraForm(frmCorrecoes) then begin
      Application.CreateForm(TfrmCorrecoes, frmCorrecoes);
   end
   else begin
      frmCorrecoes.Show();
   end;
end;

procedure TPrincipalForm.Corrigir2Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7003, npAcesso, True ) then Exit;

   frmCorrigir.ShowModal();
end;

procedure TPrincipalForm.Corrigir1Click(Sender: TObject);
begin
   Corrigir2Click(nil);
end;

procedure TPrincipalForm.IniciarCorrees1Click(Sender: TObject);
begin
   Corrigir2Click(nil);
end;

procedure TPrincipalForm.Parmetros2Click(Sender: TObject);
begin
    if not DM.GetUsuarioLogado.TemPermissao( 7041, npAcesso, True ) then Exit;

    if not ProcuraForm( TForm(frmParametros) ) then
      Application.CreateForm(TfrmParametros, frmParametros)
    else
      frmParametros.Show;

    frmParametros.Filtra(LeitoraGabarito, DM.db, DM.GetUsuarioLogado.TemPermissao( 7041, npAlterar, False ));

end;

procedure TPrincipalForm.Correomanual1Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7004, npAcesso, True ) then Exit;

   if not ProcuraForm(frmCorrecaoManual) then begin
      Application.CreateForm(TfrmCorrecaoManual, frmCorrecaoManual);
   end
   else begin
      frmCorrecaoManual.Show();
   end;
end;

procedure TPrincipalForm.CorreoManualPorQuesto1Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7004, npAcesso, True ) then Exit;

   if not ProcuraForm(frmCorrecaoManualPorQuestao) then begin
      Application.CreateForm(TfrmCorrecaoManualPorQuestao, frmCorrecaoManualPorQuestao);
   end
   else begin
      frmCorrecaoManualPorQuestao.Show();
   end;

end;

end.
