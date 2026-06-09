unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, IniFiles, StdCtrls, ImgList, Buttons,
  ToolWin, ZConnection, uCFuncClasses, ClassRegistros, UCrpe32, UCrpeClasses, Mask, DBCtrls,
  uRelutils, CropImage, uUsuario, uLoginManager, uTrataExcecao, uTratamentoExcecaoPI;

type
  TPrincipalForm = class(TForm)
    popConfiguracoes: TPopupMenu;
    TrocarUsurio1: TMenuItem;
    ImageList2: TImageList;
    toolEscolar: TToolBar;                        
    ToolButton22: TToolButton;
    btnNovoProcesso: TToolButton;
    btnUltimoProcesso: TToolButton;
    ToolButton36: TToolButton;
    btnAcademicoSair: TToolButton;
    ToolButton14: TToolButton;
    MenuAcademico: TMainMenu;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem18: TMenuItem;
    miCadastroAcad: TMenuItem;
    miPessoasAcad: TMenuItem;
    BarraDeStatus: TToolBar;
    traco1: TToolButton;
    btnUsuario: TToolButton;
    traco2: TToolButton;
    traco3: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    traco4: TToolButton;
    N63: TMenuItem;
    Sobre1: TMenuItem;
    procedure btnUltimoProcessoClick(Sender: TObject);
    procedure btnNovoProcessoClick(Sender: TObject);

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Sobre1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    FecharForcado : Boolean;
    procedure CarregarObjetoRelatorio();
    procedure SairSistema( CanClose: Boolean);

  public
    { Public declarations }

    iColigadaAcademico : Integer;
    iColigadaFinanceiro : Integer;

    function MostraVersao : String ;

    procedure SetRelatorio(Value: TCrpe);
    function GetRelatorio(): TCrpe;
    procedure LimpaRelObj();

    property Rel: TCrpe read GetRelatorio write SetRelatorio;
    function ProcuraForm(frmForm : TForm):Boolean;



    { # Função:     ProcuraForm
      # Descrição:  Verifica se o formulário está carregado na tela
      # Retorno:    Boolean (True quando está carregado)
      #
      # Parametros: frmForm: Nome do formulário


    Function PrintRpt(AReport:String;ACabecalho:String;ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String; const AFields: Array of String;
	     const AValues: Array of String;const ASortFields: Array of String;ADialog: Boolean):Boolean;
    }
   function ImprimeRpt(sRelatorio: string; iCodCabecalho: Integer = -1;
      sFormulaSelecao: string = ''; sFormulaGrupo: string = '';
      slFormulas: TStringList = nil; slOrdem: TStringList = nil;
      slParamVariaveis: TStringList = nil; slSQLExp : TStringList = nil;
      bDialogo: Boolean = False; bForcaConexao: Boolean = False;
      const ABNaoImprimir: boolean = false): Boolean;


    { # Função:     PrintRpt
      # Descrição:  Imprime o relatório do Crystal report
      # Retorno:    Boolean (True quando o relatório foi impresso corretamente)
      #
      # Parametros: AReport: Nome do relatório
		    ASelectionFormula : Fórmula do Crystal para filtro do relatório
		    AFields : Lista de nomes dos campos de fórmulas
		    AValues : Valores dos campos de fórmulas
		    ASortFields : Lista de campos para ordenação
		    ADialog : True se precisa apresentar a pergunta para visualizar
    }

    function GetInfoRpt(sChaveRelatorio: String): ClasseRegistros;


    { # Função:     PrintRpt
      # Descrição:  Imprime o relatório do Crystal report
      # Retorno:    Boolean (True quando o relatório foi impresso corretamente)
      #
      # Parametros: AReport: Nome do relatório
		    ASelectionFormula : Fórmula do Crystal para filtro do relatório
		    AFields : Lista de nomes dos campos de fórmulas
		    AValues : Valores dos campos de fórmulas
		    ASortFields : Lista de campos para ordenação
		    ADialog : True se precisa apresentar a pergunta para visualizar
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
  ano_semestre : Integer;
  ano_semestre_incremento : Byte;

Const
  SenhaBD = 'B251EA051EB116C178EF73A1579339FC2A';
  UsuarioBD = '1FD96898B024A247E664';

implementation

uses
   uDM, uErro, ufPIntGeracao, uFPintImportacao,
   Masks, uSobre, uFPIntRelatorios, uIUMDataModule, uImportarDados;

{$R *.DFM}

procedure TPrincipalForm.FormShow(Sender: TObject);
var
  wAno, wMes, wDia : Word;
  sDtMsg: string;
  dtDataServidor: TDateTime;

begin


   if not DM.db.Connected then Exit;

   dtDataServidor := DM.DataAtual();

   DataHoje := Trunc(dtDataServidor);


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


   PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + MostraVersao() + ') ';

   { Configurar posição da Data }

   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);


// if (Copy(FormatDateTime('yyyymmddhhnn', dtDataServidor), 1, 11) <> Copy(FormatDateTime('yyyymmddhhnn', Now()), 1, 11) ) then begin
//      sDtMsg := 'A data da máquina está diferente da do servidor ('+FormatDateTime('dd/mm/yyyy hh:nn', dtDataServidor)+').' + #13#13;
//      sDtMsg := sDtMsg + 'Deseja corrigir a data?';
//
//      if (Mensagem(sDtMsg, 'ATENÇÃO!!!!', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin
//         SetSystemDate(dtDataServidor);
//      end;
//   end;

end; { FormShow }


procedure TPrincipalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if FecharForcado then begin

     CanClose := True;

      if Relatorio <> nil then begin
         Relatorio.CloseEngine;
         Relatorio.Free();
      end;
      Exit;
   end;

   if (ProcuraForm(uImportarDados.frmImportarDados) ) AND
   
    (  uImportarDados.frmImportarDados.pcImportarDados.ActivePageIndex <> 4 ) then
   begin
      if ( Mensagem(
         'Todas as informações já selecionadas até o momento serão perdidas. '
          + 'Deseja continuar?',
         '',
         MB_YESNO + MB_ICONQUESTION) = IDYES
      ) then
      begin
        SairSistema(True);
      end else
      begin
         CanClose:= False;
      end;
   end
   else
   begin
      if (Mensagem(
         'Deseja realmente sair do sistema ?',
         '',
         MB_YESNO + MB_ICONQUESTION ) = IDYES
      ) then
      begin
         SairSistema(True);
      end
      else
      begin
         CanClose:= False;
      end;
   end;
end;

procedure TPrincipalForm.FormCreate(Sender: TObject);
begin
   FecharForcado := False;

   Application.OnException := TTrataExcecao.Create(TTratamentoExcecaoPI.Create()).TrataExcecao;
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
   CarregarObjetoRelatorio();

end;


procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
{ Trocar de Usuários }
begin
  if not TLoginManager.GetInstancia().RealizarLogin(False, False) then
  begin
     FecharForcado := True;
     Close();
  end
  else
  begin
     btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;
  end;
end;

function TPrincipalForm.GetInfoRpt(sChaveRelatorio: String): ClasseRegistros;
Const
   sSQL = 'SELECT nm_arquivo, sn_pode_exportar FROM relatorios WHERE ds_chave = :sChaveRelatorio;';
Var
   qryBuscaRelatorio: TUMZQuery;
begin
  DM.CriarConsulta(qryBuscaRelatorio);

  Result := ClasseRegistros.Create();

  qryBuscaRelatorio.SQL.Text := sSQL;
  qryBuscaRelatorio.ParamByName('sChaveRelatorio').AsString := sChaveRelatorio;

  qryBuscaRelatorio.Open();

  Result.CarregarQuery( qryBuscaRelatorio );
  Result.Primeiro;

  FreeAndNil( qryBuscaRelatorio );
end;

procedure TPrincipalForm.btnNovoProcessoClick(Sender: TObject);
var
   qryVerificaPessoasImportadas, qryLimparDadosAnteriores : TUMZQuery;
   msgExclusao : String;
   i: integer;
begin
   //  DM.GetUsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Modulo.Acesso', npAcesso, True) then
   if NOT DM.GetUsuarioLogado.TemPermissao(
      DM.iCdPessoaLogado,
      'EstatisticasVestibular.Modulo.Acesso',
      npAcesso,
      False
   ) then
   begin
      Mensagem('Usuário não possui permissão ao módulo!');
      Exit;
   end;

   DM.CriarConsulta(qryVerificaPessoasImportadas);

   qryVerificaPessoasImportadas.SQL.Text := '' +
     ' SELECT '                   +
     ' pi.cd_importada, '         +
     ' pi.cd_pessoa_unimestre,'   +
     ' pi.ds_nome,'               +
     ' pi.ds_curso, '             +
     ' pi.nr_classificacao, '     +
     ' pi.ds_proposito '          +
     ' FROM '                     +
     ' pessoas_importadas pi ';

   qryVerificaPessoasImportadas.Open();
   if not ( qryVerificaPessoasImportadas.IsEmpty )then
   begin

      msgExclusao := (
         'Ao prosseguir com esta operação você estará limpando '
         + 'os dados processados na importação anterior. Deseja continuar?'
      );

      if ( Mensagem(msgExclusao,Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES ) then
      begin
         Exit;
      end;

    // limpa o banco para nova execução
      dm.callProcedure(
         'CALL limpa_candidatos_vestibular();',
         true
      );
   end;

   if not ProcuraForm(frmImportarDados) then
   begin
      Application.CreateForm(TfrmImportarDados, frmImportarDados);

      // Limpa os campos
      frmImportarDados.txtBuscar.Clear();
      frmImportarDados.cbPropositoImportacao.ClearSelection;
      frmImportarDados.txtOutros.Clear();
      frmImportarDados.lblQtdRegistros.Caption := '0';
      frmImportarDados.ckbMetodo2.Checked := false;
      frmImportarDados.ckbMetodo3.Checked := false;
      frmImportarDados.ckbMetodo4.Checked := false;
   end
   else
   begin
      frmImportarDados.Show;
      frmImportarDados.txtBuscar.Clear();
      frmImportarDados.cbPropositoImportacao.ClearSelection;
      frmImportarDados.txtOutros.Clear();
      frmImportarDados.lblQtdRegistros.Caption := '0';
      frmImportarDados.ckbMetodo2.Checked := false;
      frmImportarDados.ckbMetodo3.Checked := false;
      frmImportarDados.ckbMetodo4.Checked := false;

      frmImportarDados.qryPessoasImportadas.Close();
      uImportarDados.frmImportarDados.pcImportarDados.ActivePageIndex := 0;
   end;
end;

procedure TPrincipalForm.btnSairClick(Sender: TObject);
{ Sair do Sistema }
begin
   try
      Close();
   except

   end;
end;

procedure TPrincipalForm.btnUltimoProcessoClick(Sender: TObject);
begin
   if not ProcuraForm(frmImportarDados) then
   begin
      Application.CreateForm(TfrmImportarDados, frmImportarDados);
   end
   else
   begin
     frmImportarDados.Show;
   end;
   uImportarDados.frmImportarDados.pcImportarDados.ActivePageIndex := 4;
end;

{ btnSair }

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

Procedure TPrincipalForm.MostraHint(Sender: TObject);
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
        freeMem( ptrVerBuf );
      end;
    end;
  result := strVersion;
end;

procedure TPrincipalForm.FormResize(Sender: TObject);
begin
   // pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);
end;


function TPrincipalForm.ImprimeRpt(
   sRelatorio: string;
   iCodCabecalho: Integer = -1;
   sFormulaSelecao: string = '';
   sFormulaGrupo: string = '';
   slFormulas: TStringList = nil;
   slOrdem: TStringList = nil;
   slParamVariaveis: TStringList = nil;
   slSQLExp : TStringList = nil;
   bDialogo: Boolean = False;
   bForcaConexao: Boolean = False;
   const ABNaoImprimir: boolean = false): Boolean;
var
  n : Integer;
  i : integer;
  iCopias: Word;
begin
   Result := false;

   if not FileExists(DM.strReports + '\' + sRelatorio) then
   begin
      Mensagem('Não foi encontrado o arquivo de relatório: ' + sRelatorio, '', MB_OK + MB_ICONINFORMATION);
      Exit;
   end;

   Relatorio.ReportName := '';
   Relatorio.ReportName := DM.strReports + '\' + sRelatorio;
   Relatorio.WindowState := wsMaximized;
   iCopias := Relatorio.PrintOptions.Copies;
   if Relatorio.HasSavedData then
      Relatorio.DiscardSavedData;

   Relatorio.Connect.Clear;
   Relatorio.Connect.ServerName := 'unimestre';
   Relatorio.Connect.UserID := DM.db.User;
   Relatorio.Connect.Password := DM.db.Password;
   Relatorio.Connect.DatabaseName := ODBCInfo('DATABASE');
  // Relatorio.Connect.Propagate := true;

    //titulo da janela de relatorio
    Relatorio.ReportTitle := Application.Title;

    //define formula de selecao
    Relatorio.Selection.Formula.Clear;
    Relatorio.Selection.Formula.Add( sFormulaSelecao );

   if (iCodCabecalho > -1) then begin
      //carrega cabecalho
      if (RelObj.FindObjetoItem(iCodCabecalho) = -1) then begin
        DM.CabecalhoParamFixos();
        RelObj.Add(iCodCabecalho);
        RelObj.getObjetoItem(iCodCabecalho).ProcessaRelObjetos(DM.CabecalhoCampos(iCodCabecalho), slPFixos);
      end;
      slFormulas.Add('cd_cabecalho='+IntToStr(iCodCabecalho));
      //carrega o cabecalho
      RelObj.DefineCabecalho(Relatorio, 'Cabecalho', iCodCabecalho, slParamVariaveis);
    end;

    {
    //Mostra a Janela de configuracao da impressora
    if DM.variavel_parametro('relatorios_apresentar_impressora') = 'S' then
    begin
       Relatorio.Printer.Prompt;
       Relatorio.Printer.SetCurrent;
    end;
    }

    //define formula de grupo
    Relatorio.GroupSelection.Formula.Clear;
    if sFormulaGrupo <> '' then begin
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

    //SQL Expression
    if slSQLExp <> nil then begin
       if slSQLExp.Count > 0 then begin
         for i := 0 to (slSQLExp.Count -1) do begin
           try
             n := Relatorio.SQLExpressions.IndexOf(slSQLExp.Names[i]);
             if (n > -1) then begin
               Relatorio.SQLExpressions.Items[n].Expression.Text := slSQLExp.ValueFromIndex[i];
             end;
           except
           end;
         end;
      end;
    end;

//    Relatorio.SQLExpressions.Items[0].Expression.Text:='GET_SALDO(22,1,''2008-07-01'',NULL)';

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

    if Dm.variavel_parametro('impressao_sempre_visualiza') = 'S' then
       bDialogo := True;

    //verifica dialogo
    if not ABNaoImprimir then
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

   Relatorio.PrintOptions.Copies := iCopias;
    //executa Relatorio
    if not ABNaoImprimir then
       if not Relatorio.Execute() then
       begin
            Screen.Cursor := crDefault;
            Result := False;
           Exit;
       end;
    Relatorio.PrintOptions.Copies := 1;

    Result := True;

end; { PrintRpt }


procedure TPrincipalForm.CarregarObjetoRelatorio;
begin
   //Relatorios
   RelObj := TRelObjetos.Create();
   Relatorio := TCrpe.Create(Application);

   with Relatorio do
   begin
      About := 'Version and Credits...';
      DesignControls := 'Design-Time Window Controls';
      Version.Crpe.Major := 0;
      Version.Crpe.Minor := 0;
      Version.Crpe.Release := 0;
      Version.Crpe.Build := 0;
      Version.Report.Major := 0;
      Version.Report.Minor := 0;
      Version.Report.Letter := #0;
      Version.Windows.Platform := 'NT';
      Version.Windows.Major := 5;
      Version.Windows.Minor := 1;
      Version.Windows.Build := '2600';
      TempPath := 'C:\DOCUME~1\CLAUDI~1\CONFIG~1\Temp\';
      PrintDate.Day := 0;
      PrintDate.Month := 0;
      PrintDate.Year := 0;
      Subreports.Number := 0;
      Subreports.Item.Top := -1;
      Subreports.Item.Left := -1;
      Subreports.Item.Width := -1;
      Subreports.Item.Height := -1;
      Subreports.Item.Border.Left := lsNone;
      Subreports.Item.Border.Right := lsNone;
      Subreports.Item.Border.Top := lsNone;
      Subreports.Item.Border.Bottom := lsNone;
      Subreports.Item.Border.TightHorizontal := False;
      Subreports.Item.Border.DropShadow := False;
      Subreports.Item.Border.ForeColor := clNone;
      Subreports.Item.Border.BackgroundColor := clNone;
      Subreports.Item.NLinks := 0;
      GroupSortFields.Number := -1;
      Groups.Number := -1;
      Groups.Item.CustomizeGroupName := False;
      ParamFields.AllowDialog := True;
      ParamFields.Item.Top := -1;
      ParamFields.Item.Left := -1;
      ParamFields.Item.Width := -1;
      ParamFields.Item.Height := -1;
      ParamFields.Item.Border.Left := lsNone;
      ParamFields.Item.Border.Right := lsNone;
      ParamFields.Item.Border.Top := lsNone;
      ParamFields.Item.Border.Bottom := lsNone;
      ParamFields.Item.Border.TightHorizontal := False;
      ParamFields.Item.Border.DropShadow := False;
      ParamFields.Item.Border.ForeColor := clNone;
      ParamFields.Item.Border.BackgroundColor := clNone;
      ParamFields.Item.Format.Alignment := haDefault;
      ParamFields.Item.Format.SuppressIfDuplicated := False;
      ParamFields.Item.Format.CanGrow := False;
      ParamFields.Item.Format.MaxNLines := 0;
      ParamFields.Item.Format.Field.Number.CurrencySymbol := '$';
      ParamFields.Item.Format.Field.Number.ThousandSymbol := ',';
      ParamFields.Item.Format.Field.Number.DecimalSymbol := '.';
      ParamFields.Item.Format.Field.Number.ShowZeroValueAs := '0';
      ParamFields.Item.Format.Field.Date.FirstSeparator := '/';
      ParamFields.Item.Format.Field.Date.SecondSeparator := '/';
      ParamFields.Item.Format.Field.Time.AMString := 'AM';
      ParamFields.Item.Format.Field.Time.PMString := 'PM';
      ParamFields.Item.Format.Field.Time.HourMinSeparator := ':';
      ParamFields.Item.Format.Field.Time.MinSecSeparator := ':';
      ParamFields.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      ParamFields.Item.Font.Charset := DEFAULT_CHARSET;
      ParamFields.Item.Font.Color := clWindowText;
      ParamFields.Item.Font.Height := -11;
      ParamFields.Item.Font.Name := 'MS Sans Serif';
      ParamFields.Item.Font.Style := [];
      ParamFields.Item.HiliteConditions.Item.FontColor := clNone;
      ParamFields.Item.HiliteConditions.Item.Background := clNone;
      ParamFields.Item.ParamType := pfNoValue;
      ParamFields.Item.ParamSource := psReport;
      ParamFields.Item.Info.AllowNull := True;
      ParamFields.Item.Info.AllowEditing := True;
      ParamFields.Item.Info.AllowMultipleValues := False;
      ParamFields.Item.Info.ValueType := vtDiscrete;
      ParamFields.Item.Info.PartOfGroup := False;
      ParamFields.Item.Info.MutuallyExclusiveGroup := True;
      ParamFields.Item.Info.GroupNum := -1;
      ParamFields.Item.ValueLimit := False;
      ParamFields.Item.Ranges.Item.Bounds := IncludeStartAndEnd;
      ParamFields.Item.NeedsCurrentValue := False;
      ParamFields.Item.IsLinked := False;
      Formulas.Item.Top := -1;
      Formulas.Item.Left := -1;
      Formulas.Item.Width := -1;
      Formulas.Item.Height := -1;
      Formulas.Item.Border.Left := lsNone;
      Formulas.Item.Border.Right := lsNone;
      Formulas.Item.Border.Top := lsNone;
      Formulas.Item.Border.Bottom := lsNone;
      Formulas.Item.Border.TightHorizontal := False;
      Formulas.Item.Border.DropShadow := False;
      Formulas.Item.Border.ForeColor := clNone;
      Formulas.Item.Border.BackgroundColor := clNone;
      Formulas.Item.Format.Alignment := haDefault;
      Formulas.Item.Format.SuppressIfDuplicated := False;
      Formulas.Item.Format.CanGrow := False;
      Formulas.Item.Format.MaxNLines := 0;
      Formulas.Item.Format.Field.Number.CurrencySymbol := '$';
      Formulas.Item.Format.Field.Number.ThousandSymbol := ',';
      Formulas.Item.Format.Field.Number.DecimalSymbol := '.';
      Formulas.Item.Format.Field.Number.ShowZeroValueAs := '0';
      Formulas.Item.Format.Field.Date.FirstSeparator := '/';
      Formulas.Item.Format.Field.Date.SecondSeparator := '/';
      Formulas.Item.Format.Field.Time.AMString := 'AM';
      Formulas.Item.Format.Field.Time.PMString := 'PM';
      Formulas.Item.Format.Field.Time.HourMinSeparator := ':';
      Formulas.Item.Format.Field.Time.MinSecSeparator := ':';
      Formulas.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      Formulas.Item.Font.Charset := DEFAULT_CHARSET;
      Formulas.Item.Font.Color := clWindowText;
      Formulas.Item.Font.Height := -11;
      Formulas.Item.Font.Name := 'MS Sans Serif';
      Formulas.Item.Font.Style := [];
      Formulas.Item.HiliteConditions.Item.FontColor := clNone;
      Formulas.Item.HiliteConditions.Item.Background := clNone;
      AreaFormat.Item.NSections := 0;
      SectionSize.Item.Height := -1;
      SectionSize.Item.Width := -1;
      SQLExpressions.Item.Top := -1;
      SQLExpressions.Item.Left := -1;
      SQLExpressions.Item.Width := -1;
      SQLExpressions.Item.Height := -1;
      SQLExpressions.Item.Border.Left := lsNone;
      SQLExpressions.Item.Border.Right := lsNone;
      SQLExpressions.Item.Border.Top := lsNone;
      SQLExpressions.Item.Border.Bottom := lsNone;
      SQLExpressions.Item.Border.TightHorizontal := False;
      SQLExpressions.Item.Border.DropShadow := False;
      SQLExpressions.Item.Border.ForeColor := clNone;
      SQLExpressions.Item.Border.BackgroundColor := clNone;
      SQLExpressions.Item.Format.Alignment := haDefault;
      SQLExpressions.Item.Format.SuppressIfDuplicated := False;
      SQLExpressions.Item.Format.CanGrow := False;
      SQLExpressions.Item.Format.MaxNLines := 0;
      SQLExpressions.Item.Format.Field.Number.CurrencySymbol := '$';
      SQLExpressions.Item.Format.Field.Number.ThousandSymbol := ',';
      SQLExpressions.Item.Format.Field.Number.DecimalSymbol := '.';
      SQLExpressions.Item.Format.Field.Number.ShowZeroValueAs := '0';
      SQLExpressions.Item.Format.Field.Date.FirstSeparator := '/';
      SQLExpressions.Item.Format.Field.Date.SecondSeparator := '/';
      SQLExpressions.Item.Format.Field.Time.AMString := 'AM';
      SQLExpressions.Item.Format.Field.Time.PMString := 'PM';
      SQLExpressions.Item.Format.Field.Time.HourMinSeparator := ':';
      SQLExpressions.Item.Format.Field.Time.MinSecSeparator := ':';
      SQLExpressions.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      SQLExpressions.Item.Font.Charset := DEFAULT_CHARSET;
      SQLExpressions.Item.Font.Color := clWindowText;
      SQLExpressions.Item.Font.Height := -11;
      SQLExpressions.Item.Font.Name := 'MS Sans Serif';
      SQLExpressions.Item.Font.Style := [];
      SQLExpressions.Item.HiliteConditions.Item.FontColor := clNone;
      SQLExpressions.Item.HiliteConditions.Item.Background := clNone;
      LogOnInfo.Item.Table := -1;
      SessionInfo.Table := -1;
      SessionInfo.Item.Propagate := True;
      ExportOptions.Excel.Constant := 9.000000000000000000;
      ExportOptions.Excel.Area := 'D';
      ExportOptions.Excel.WorksheetFunctions := False;
      ExportOptions.Excel.FirstPage := 1;
      ExportOptions.Excel.LastPage := 1;
      ExportOptions.HTML.PageNavigator := True;
      ExportOptions.HTML.SeparatePages := True;
      ExportOptions.HTML.FirstPage := 1;
      ExportOptions.HTML.LastPage := 1;
      ExportOptions.RTF.FirstPage := 1;
      ExportOptions.RTF.LastPage := 1;
      ExportOptions.Word.FirstPage := 1;
      ExportOptions.Word.LastPage := 1;
      ExportOptions.PDF.FirstPage := 1;
      ExportOptions.PDF.LastPage := 1;
      ExportOptions.Text.StringDelimiter := '"';
      ExportOptions.Text.FieldSeparator := ',';
      Printer.PreserveRptSettings := [prOrientation, prPaperSize];
      PrintOptions.StartPage := 1;
      PrintOptions.StopPage := 65535;
      Lines.Item.LineStyle := lsNone;
      Lines.Item.Left := -1;
      Lines.Item.Right := -1;
      Lines.Item.Width := -1;
      Lines.Item.Top := -1;
      Lines.Item.Bottom := -1;
      Lines.Item.Color := clNone;
      Lines.Item.Extend := False;
      Lines.Item.Suppress := False;
      Boxes.Number := -1;
      Pictures.Item.Top := -1;
      Pictures.Item.Left := -1;
      Pictures.Item.Width := -1;
      Pictures.Item.Height := -1;
      Pictures.Item.Border.Left := lsNone;
      Pictures.Item.Border.Right := lsNone;
      Pictures.Item.Border.Top := lsNone;
      Pictures.Item.Border.Bottom := lsNone;
      Pictures.Item.Border.TightHorizontal := False;
      Pictures.Item.Border.DropShadow := False;
      Pictures.Item.Border.ForeColor := clNone;
      Pictures.Item.Border.BackgroundColor := clNone;
      Pictures.Item.CropLeft := -1;
      Pictures.Item.CropRight := -1;
      Pictures.Item.CropTop := -1;
      Pictures.Item.CropBottom := -1;
      TextObjects.Item.Top := -1;
      TextObjects.Item.Left := -1;
      TextObjects.Item.Width := -1;
      TextObjects.Item.Height := -1;
      TextObjects.Item.Border.Left := lsNone;
      TextObjects.Item.Border.Right := lsNone;
      TextObjects.Item.Border.Top := lsNone;
      TextObjects.Item.Border.Bottom := lsNone;
      TextObjects.Item.Border.TightHorizontal := False;
      TextObjects.Item.Border.DropShadow := False;
      TextObjects.Item.Border.ForeColor := clNone;
      TextObjects.Item.Border.BackgroundColor := clNone;
      TextObjects.Item.Format.Alignment := haDefault;
      TextObjects.Item.Format.SuppressIfDuplicated := False;
      TextObjects.Item.Format.CanGrow := False;
      TextObjects.Item.Format.MaxNLines := 0;
      TextObjects.Item.Format.Paragraph.LineSpacing := 1.000000000000000000;
      TextObjects.Item.Font.Charset := DEFAULT_CHARSET;
      TextObjects.Item.Font.Color := clWindowText;
      TextObjects.Item.Font.Height := -11;
      TextObjects.Item.Font.Name := 'MS Sans Serif';
      TextObjects.Item.Font.Style := [];
      TextObjects.Item.Paragraphs.Item.Alignment := haDefault;
      TextObjects.Item.Paragraphs.Item.IndentFirstLine := 0;
      TextObjects.Item.Paragraphs.Item.IndentLeft := 0;
      TextObjects.Item.Paragraphs.Item.IndentRight := 0;
      TextObjects.Item.Paragraphs.Item.TextStart := 0;
      TextObjects.Item.Paragraphs.Item.TextEnd := 0;
      TextObjects.Item.Paragraphs.Item.TabStops.Item.Alignment := haDefault;
      TextObjects.Item.Paragraphs.Item.TabStops.Item.Offset := -1;
      TextObjects.Item.EmbeddedFields.Item.FieldObjectType := oftNone;
      TextObjects.Item.EmbeddedFields.Item.FieldType := fvUnknown;
      TextObjects.Item.EmbeddedFields.Item.TextStart := 0;
      TextObjects.Item.EmbeddedFields.Item.TextEnd := 0;
      TextObjects.Item.EmbeddedFields.Item.Format.Alignment := haDefault;
      TextObjects.Item.EmbeddedFields.Item.Format.SuppressIfDuplicated := False;
      TextObjects.Item.EmbeddedFields.Item.Format.CanGrow := False;
      TextObjects.Item.EmbeddedFields.Item.Format.MaxNLines := 0;
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.CurrencySymbol := '$';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ThousandSymbol := ',';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.DecimalSymbol := '.';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ShowZeroValueAs := '0';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.FirstSeparator := '/';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.SecondSeparator := '/';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.AMString := 'AM';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.PMString := 'PM';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.HourMinSeparator := ':';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.MinSecSeparator := ':';
      TextObjects.Item.EmbeddedFields.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      TextObjects.Item.EmbeddedFields.Item.Border.Left := lsNone;
      TextObjects.Item.EmbeddedFields.Item.Border.Right := lsNone;
      TextObjects.Item.EmbeddedFields.Item.Border.Top := lsNone;
      TextObjects.Item.EmbeddedFields.Item.Border.Bottom := lsNone;
      TextObjects.Item.EmbeddedFields.Item.Border.TightHorizontal := False;
      TextObjects.Item.EmbeddedFields.Item.Border.DropShadow := False;
      TextObjects.Item.EmbeddedFields.Item.Border.ForeColor := clNone;
      TextObjects.Item.EmbeddedFields.Item.Border.BackgroundColor := clNone;
      TextObjects.Item.TextSize := -1;
      TextObjects.Item.TextHeight := -1;
      OleObjects.Item.Top := -1;
      OleObjects.Item.Left := -1;
      OleObjects.Item.Width := -1;
      OleObjects.Item.Height := -1;
      OleObjects.Item.Border.Left := lsNone;
      OleObjects.Item.Border.Right := lsNone;
      OleObjects.Item.Border.Top := lsNone;
      OleObjects.Item.Border.Bottom := lsNone;
      OleObjects.Item.Border.TightHorizontal := False;
      OleObjects.Item.Border.DropShadow := False;
      OleObjects.Item.Border.ForeColor := clNone;
      OleObjects.Item.Border.BackgroundColor := clNone;
      CrossTabs.Item.Top := -1;
      CrossTabs.Item.Left := -1;
      CrossTabs.Item.Width := -1;
      CrossTabs.Item.Height := -1;
      CrossTabs.Item.Border.Left := lsNone;
      CrossTabs.Item.Border.Right := lsNone;
      CrossTabs.Item.Border.Top := lsNone;
      CrossTabs.Item.Border.Bottom := lsNone;
      CrossTabs.Item.Border.TightHorizontal := False;
      CrossTabs.Item.Border.DropShadow := False;
      CrossTabs.Item.Border.ForeColor := clNone;
      CrossTabs.Item.Border.BackgroundColor := clNone;
      Maps.Item.Top := -1;
      Maps.Item.Left := -1;
      Maps.Item.Width := -1;
      Maps.Item.Height := -1;
      Maps.Item.Border.Left := lsNone;
      Maps.Item.Border.Right := lsNone;
      Maps.Item.Border.Top := lsNone;
      Maps.Item.Border.Bottom := lsNone;
      Maps.Item.Border.TightHorizontal := False;
      Maps.Item.Border.DropShadow := False;
      Maps.Item.Border.ForeColor := clNone;
      Maps.Item.Border.BackgroundColor := clNone;
      OLAPCubes.Item.Top := -1;
      OLAPCubes.Item.Left := -1;
      OLAPCubes.Item.Width := -1;
      OLAPCubes.Item.Height := -1;
      OLAPCubes.Item.Border.Left := lsNone;
      OLAPCubes.Item.Border.Right := lsNone;
      OLAPCubes.Item.Border.Top := lsNone;
      OLAPCubes.Item.Border.Bottom := lsNone;
      OLAPCubes.Item.Border.TightHorizontal := False;
      OLAPCubes.Item.Border.DropShadow := False;
      OLAPCubes.Item.Border.ForeColor := clNone;
      OLAPCubes.Item.Border.BackgroundColor := clNone;
      DatabaseFields.Item.Top := -1;
      DatabaseFields.Item.Left := -1;
      DatabaseFields.Item.Width := -1;
      DatabaseFields.Item.Height := -1;
      DatabaseFields.Item.Border.Left := lsNone;
      DatabaseFields.Item.Border.Right := lsNone;
      DatabaseFields.Item.Border.Top := lsNone;
      DatabaseFields.Item.Border.Bottom := lsNone;
      DatabaseFields.Item.Border.TightHorizontal := False;
      DatabaseFields.Item.Border.DropShadow := False;
      DatabaseFields.Item.Border.ForeColor := clNone;
      DatabaseFields.Item.Border.BackgroundColor := clNone;
      DatabaseFields.Item.Format.Alignment := haDefault;
      DatabaseFields.Item.Format.SuppressIfDuplicated := False;
      DatabaseFields.Item.Format.CanGrow := False;
      DatabaseFields.Item.Format.MaxNLines := 0;
      DatabaseFields.Item.Format.Field.Number.CurrencySymbol := '$';
      DatabaseFields.Item.Format.Field.Number.ThousandSymbol := ',';
      DatabaseFields.Item.Format.Field.Number.DecimalSymbol := '.';
      DatabaseFields.Item.Format.Field.Number.ShowZeroValueAs := '0';
      DatabaseFields.Item.Format.Field.Date.FirstSeparator := '/';
      DatabaseFields.Item.Format.Field.Date.SecondSeparator := '/';
      DatabaseFields.Item.Format.Field.Time.AMString := 'AM';
      DatabaseFields.Item.Format.Field.Time.PMString := 'PM';
      DatabaseFields.Item.Format.Field.Time.HourMinSeparator := ':';
      DatabaseFields.Item.Format.Field.Time.MinSecSeparator := ':';
      DatabaseFields.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      DatabaseFields.Item.Font.Charset := DEFAULT_CHARSET;
      DatabaseFields.Item.Font.Color := clWindowText;
      DatabaseFields.Item.Font.Height := -11;
      DatabaseFields.Item.Font.Name := 'MS Sans Serif';
      DatabaseFields.Item.Font.Style := [];
      DatabaseFields.Item.HiliteConditions.Item.FontColor := clNone;
      DatabaseFields.Item.HiliteConditions.Item.Background := clNone;
      SummaryFields.Item.Top := -1;
      SummaryFields.Item.Left := -1;
      SummaryFields.Item.Width := -1;
      SummaryFields.Item.Height := -1;
      SummaryFields.Item.Border.Left := lsNone;
      SummaryFields.Item.Border.Right := lsNone;
      SummaryFields.Item.Border.Top := lsNone;
      SummaryFields.Item.Border.Bottom := lsNone;
      SummaryFields.Item.Border.TightHorizontal := False;
      SummaryFields.Item.Border.DropShadow := False;
      SummaryFields.Item.Border.ForeColor := clNone;
      SummaryFields.Item.Border.BackgroundColor := clNone;
      SummaryFields.Item.Format.Alignment := haDefault;
      SummaryFields.Item.Format.SuppressIfDuplicated := False;
      SummaryFields.Item.Format.CanGrow := False;
      SummaryFields.Item.Format.MaxNLines := 0;
      SummaryFields.Item.Format.Field.Number.CurrencySymbol := '$';
      SummaryFields.Item.Format.Field.Number.ThousandSymbol := ',';
      SummaryFields.Item.Format.Field.Number.DecimalSymbol := '.';
      SummaryFields.Item.Format.Field.Number.ShowZeroValueAs := '0';
      SummaryFields.Item.Format.Field.Date.FirstSeparator := '/';
      SummaryFields.Item.Format.Field.Date.SecondSeparator := '/';
      SummaryFields.Item.Format.Field.Time.AMString := 'AM';
      SummaryFields.Item.Format.Field.Time.PMString := 'PM';
      SummaryFields.Item.Format.Field.Time.HourMinSeparator := ':';
      SummaryFields.Item.Format.Field.Time.MinSecSeparator := ':';
      SummaryFields.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      SummaryFields.Item.Font.Charset := DEFAULT_CHARSET;
      SummaryFields.Item.Font.Color := clWindowText;
      SummaryFields.Item.Font.Height := -11;
      SummaryFields.Item.Font.Name := 'MS Sans Serif';
      SummaryFields.Item.Font.Style := [];
      SummaryFields.Item.HiliteConditions.Item.FontColor := clNone;
      SummaryFields.Item.HiliteConditions.Item.Background := clNone;
      SpecialFields.Number := -1;
      SpecialFields.Item.Top := -1;
      SpecialFields.Item.Left := -1;
      SpecialFields.Item.Width := -1;
      SpecialFields.Item.Height := -1;
      SpecialFields.Item.Border.Left := lsNone;
      SpecialFields.Item.Border.Right := lsNone;
      SpecialFields.Item.Border.Top := lsNone;
      SpecialFields.Item.Border.Bottom := lsNone;
      SpecialFields.Item.Border.TightHorizontal := False;
      SpecialFields.Item.Border.DropShadow := False;
      SpecialFields.Item.Border.ForeColor := clNone;
      SpecialFields.Item.Border.BackgroundColor := clNone;
      SpecialFields.Item.Format.Alignment := haDefault;
      SpecialFields.Item.Format.SuppressIfDuplicated := False;
      SpecialFields.Item.Format.CanGrow := False;
      SpecialFields.Item.Format.MaxNLines := 0;
      SpecialFields.Item.Format.Field.Number.CurrencySymbol := '$';
      SpecialFields.Item.Format.Field.Number.ThousandSymbol := ',';
      SpecialFields.Item.Format.Field.Number.DecimalSymbol := '.';
      SpecialFields.Item.Format.Field.Number.ShowZeroValueAs := '0';
      SpecialFields.Item.Format.Field.Date.FirstSeparator := '/';
      SpecialFields.Item.Format.Field.Date.SecondSeparator := '/';
      SpecialFields.Item.Format.Field.Time.AMString := 'AM';
      SpecialFields.Item.Format.Field.Time.PMString := 'PM';
      SpecialFields.Item.Format.Field.Time.HourMinSeparator := ':';
      SpecialFields.Item.Format.Field.Time.MinSecSeparator := ':';
      SpecialFields.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      SpecialFields.Item.Font.Charset := DEFAULT_CHARSET;
      SpecialFields.Item.Font.Color := clWindowText;
      SpecialFields.Item.Font.Height := -11;
      SpecialFields.Item.Font.Name := 'MS Sans Serif';
      SpecialFields.Item.Font.Style := [];
      SpecialFields.Item.HiliteConditions.Item.FontColor := clNone;
      SpecialFields.Item.HiliteConditions.Item.Background := clNone;
      GroupNameFields.Number := -1;
      GroupNameFields.Item.Top := -1;
      GroupNameFields.Item.Left := -1;
      GroupNameFields.Item.Width := -1;
      GroupNameFields.Item.Height := -1;
      GroupNameFields.Item.Border.Left := lsNone;
      GroupNameFields.Item.Border.Right := lsNone;
      GroupNameFields.Item.Border.Top := lsNone;
      GroupNameFields.Item.Border.Bottom := lsNone;
      GroupNameFields.Item.Border.TightHorizontal := False;
      GroupNameFields.Item.Border.DropShadow := False;
      GroupNameFields.Item.Border.ForeColor := clNone;
      GroupNameFields.Item.Border.BackgroundColor := clNone;
      GroupNameFields.Item.Format.Alignment := haDefault;
      GroupNameFields.Item.Format.SuppressIfDuplicated := False;
      GroupNameFields.Item.Format.CanGrow := False;
      GroupNameFields.Item.Format.MaxNLines := 0;
      GroupNameFields.Item.Format.Field.Number.CurrencySymbol := '$';
      GroupNameFields.Item.Format.Field.Number.ThousandSymbol := ',';
      GroupNameFields.Item.Format.Field.Number.DecimalSymbol := '.';
      GroupNameFields.Item.Format.Field.Number.ShowZeroValueAs := '0';
      GroupNameFields.Item.Format.Field.Date.FirstSeparator := '/';
      GroupNameFields.Item.Format.Field.Date.SecondSeparator := '/';
      GroupNameFields.Item.Format.Field.Time.AMString := 'AM';
      GroupNameFields.Item.Format.Field.Time.PMString := 'PM';
      GroupNameFields.Item.Format.Field.Time.HourMinSeparator := ':';
      GroupNameFields.Item.Format.Field.Time.MinSecSeparator := ':';
      GroupNameFields.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      GroupNameFields.Item.Font.Charset := DEFAULT_CHARSET;
      GroupNameFields.Item.Font.Color := clWindowText;
      GroupNameFields.Item.Font.Height := -11;
      GroupNameFields.Item.Font.Name := 'MS Sans Serif';
      GroupNameFields.Item.Font.Style := [];
      GroupNameFields.Item.HiliteConditions.Item.FontColor := clNone;
      GroupNameFields.Item.HiliteConditions.Item.Background := clNone;
      RunningTotals.Number := -1;
      RunningTotals.Item.Top := -1;
      RunningTotals.Item.Left := -1;
      RunningTotals.Item.Width := -1;
      RunningTotals.Item.Height := -1;
      RunningTotals.Item.Border.Left := lsNone;
      RunningTotals.Item.Border.Right := lsNone;
      RunningTotals.Item.Border.Top := lsNone;
      RunningTotals.Item.Border.Bottom := lsNone;
      RunningTotals.Item.Border.TightHorizontal := False;
      RunningTotals.Item.Border.DropShadow := False;
      RunningTotals.Item.Border.ForeColor := clNone;
      RunningTotals.Item.Border.BackgroundColor := clNone;
      RunningTotals.Item.Format.Alignment := haDefault;
      RunningTotals.Item.Format.SuppressIfDuplicated := False;
      RunningTotals.Item.Format.CanGrow := False;
      RunningTotals.Item.Format.MaxNLines := 0;
      RunningTotals.Item.Format.Field.Number.CurrencySymbol := '$';
      RunningTotals.Item.Format.Field.Number.ThousandSymbol := ',';
      RunningTotals.Item.Format.Field.Number.DecimalSymbol := '.';
      RunningTotals.Item.Format.Field.Number.ShowZeroValueAs := '0';
      RunningTotals.Item.Format.Field.Date.FirstSeparator := '/';
      RunningTotals.Item.Format.Field.Date.SecondSeparator := '/';
      RunningTotals.Item.Format.Field.Time.AMString := 'AM';
      RunningTotals.Item.Format.Field.Time.PMString := 'PM';
      RunningTotals.Item.Format.Field.Time.HourMinSeparator := ':';
      RunningTotals.Item.Format.Field.Time.MinSecSeparator := ':';
      RunningTotals.Item.Format.Field.Paragraph.LineSpacing := 1.000000000000000000;
      RunningTotals.Item.Font.Charset := DEFAULT_CHARSET;
      RunningTotals.Item.Font.Color := clWindowText;
      RunningTotals.Item.Font.Height := -11;
      RunningTotals.Item.Font.Name := 'MS Sans Serif';
      RunningTotals.Item.Font.Style := [];
      RunningTotals.Item.HiliteConditions.Item.FontColor := clNone;
      RunningTotals.Item.HiliteConditions.Item.Background := clNone;
      WindowZoom.Preview := pwDefault;
      WindowZoom.Magnification := -1;
      WindowState := wsMaximized;
      WindowButtonBar.CancelBtn := True;
      WindowButtonBar.CloseBtn := True;
      WindowButtonBar.PrintSetupBtn := True;
      WindowCursor.GroupArea := wcDefault;
      WindowCursor.GroupAreaField := wcMagnify;
      WindowCursor.DetailArea := wcDefault;
      WindowCursor.DetailAreaField := wcDefault;
      WindowCursor.Graph := wcMagnify;
      WindowCursor.OnDemandSubreport := wcMagnify;
      WindowCursor.HyperLink := wcMagnify;
      Graphs.Number := -1;
      Graphs.Item.Top := -1;
      Graphs.Item.Left := -1;
      Graphs.Item.Width := -1;
      Graphs.Item.Height := -1;
      Graphs.Item.Border.Left := lsNone;
      Graphs.Item.Border.Right := lsNone;
      Graphs.Item.Border.Top := lsNone;
      Graphs.Item.Border.Bottom := lsNone;
      Graphs.Item.Border.TightHorizontal := False;
      Graphs.Item.Border.DropShadow := False;
      Graphs.Item.Border.ForeColor := clNone;
      Graphs.Item.Border.BackgroundColor := clNone;
      Graphs.Item.Style := unknownGraphType;
      Graphs.Item.Text.TitleFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.TitleFont.Color := clWindowText;
      Graphs.Item.Text.TitleFont.Height := -11;
      Graphs.Item.Text.TitleFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.TitleFont.Style := [];
      Graphs.Item.Text.SubTitleFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.SubTitleFont.Color := clWindowText;
      Graphs.Item.Text.SubTitleFont.Height := -11;
      Graphs.Item.Text.SubTitleFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.SubTitleFont.Style := [];
      Graphs.Item.Text.FootNoteFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.FootNoteFont.Color := clWindowText;
      Graphs.Item.Text.FootNoteFont.Height := -11;
      Graphs.Item.Text.FootNoteFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.FootNoteFont.Style := [];
      Graphs.Item.Text.GroupsTitleFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.GroupsTitleFont.Color := clWindowText;
      Graphs.Item.Text.GroupsTitleFont.Height := -11;
      Graphs.Item.Text.GroupsTitleFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.GroupsTitleFont.Style := [];
      Graphs.Item.Text.DataTitleFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.DataTitleFont.Color := clWindowText;
      Graphs.Item.Text.DataTitleFont.Height := -11;
      Graphs.Item.Text.DataTitleFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.DataTitleFont.Style := [];
      Graphs.Item.Text.LegendFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.LegendFont.Color := clWindowText;
      Graphs.Item.Text.LegendFont.Height := -11;
      Graphs.Item.Text.LegendFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.LegendFont.Style := [];
      Graphs.Item.Text.GroupLabelsFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.GroupLabelsFont.Color := clWindowText;
      Graphs.Item.Text.GroupLabelsFont.Height := -11;
      Graphs.Item.Text.GroupLabelsFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.GroupLabelsFont.Style := [];
      Graphs.Item.Text.DataLabelsFont.Charset := DEFAULT_CHARSET;
      Graphs.Item.Text.DataLabelsFont.Color := clWindowText;
      Graphs.Item.Text.DataLabelsFont.Height := -11;
      Graphs.Item.Text.DataLabelsFont.Name := 'MS Sans Serif';
      Graphs.Item.Text.DataLabelsFont.Style := [];
      Graphs.Item.Axis.GridLineX := gglNone;
      Graphs.Item.Axis.GridLineY := gglMajor;
      Graphs.Item.Axis.GridLineY2 := gglNone;
      Graphs.Item.Axis.GridLineZ := gglNone;
      Graphs.Item.Axis.DataValuesY := gdvAutomatic;
      Graphs.Item.Axis.DataValuesY2 := gdvAutomatic;
      Graphs.Item.Axis.DataValuesZ := gdvAutomatic;
      Graphs.Item.Axis.MinY := -1.000000000000000000;
      Graphs.Item.Axis.MaxY := -1.000000000000000000;
      Graphs.Item.Axis.MinY2 := -1.000000000000000000;
      Graphs.Item.Axis.MaxY2 := -1.000000000000000000;
      Graphs.Item.Axis.MinZ := -1.000000000000000000;
      Graphs.Item.Axis.MaxZ := -1.000000000000000000;
      Graphs.Item.Axis.NumberFormatY := gnfNoDecimal;
      Graphs.Item.Axis.NumberFormatY2 := gnfNoDecimal;
      Graphs.Item.Axis.NumberFormatZ := gnfNoDecimal;
      Graphs.Item.Axis.DivisionTypeY := gdvAutomatic;
      Graphs.Item.Axis.DivisionTypeY2 := gdvAutomatic;
      Graphs.Item.Axis.DivisionTypeZ := gdvAutomatic;
      Graphs.Item.Axis.DivisionsY := -1;
      Graphs.Item.Axis.DivisionsY2 := -1;
      Graphs.Item.Axis.DivisionsZ := -1;
      SummaryInfo.SavePreviewPicture := False;
   end;

   Relatorio.LoadEngine();
end;

procedure TPrincipalForm.FormDestroy(Sender: TObject);
begin
    RelObj.Clear();
    RelObj.Free();
end;

procedure TPrincipalForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F1 : Self.Sobre1Click( nil );   
   end;
end;

function TPrincipalForm.getRelatorio: TCrpe;
begin
  Result := Relatorio;
end;

procedure TPrincipalForm.SairSistema(CanClose: Boolean);
var
   sn_sair: Boolean;
begin
  sn_sair  := CanClose;
 if ( sn_sair )  then
 begin
    CanClose := True;
    DM.db.Disconnect;

    if Relatorio <> nil then
    begin
       Relatorio.CloseEngine;
    end;
 end else
 begin
  CanClose := False;
 end;
end;

procedure TPrincipalForm.SetRelatorio(Value: TCrpe);
begin
   Relatorio := Value;
end;

procedure TPrincipalForm.Sobre1Click(Sender: TObject);
begin
   if not Assigned(frmSobre) then
   begin
      Application.CreateForm(TfrmSobre, frmSobre);
   end;
   frmSobre.ShowModal;
end;

procedure TPrincipalForm.LimpaRelObj;
begin
    RelObj.Clear();
end;

end.

