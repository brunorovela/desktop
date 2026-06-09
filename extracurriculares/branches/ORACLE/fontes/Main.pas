unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, General, IniFiles, StdCtrls, ImgList,
  Buttons, ToolWin, DBTables, uUsuario,
  UCrpe32, UCrpeClasses, DBCtrls, uRelUtils, uLoginManager;

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
    popFinanceiroCadastros: TPopupMenu;
    ToolButton11: TToolButton;
    btnFinanceiroConfiguracoes: TToolButton;
    MenuFinanceiro: TMainMenu;
    MenuItem6: TMenuItem;
    MenuItem12: TMenuItem;
    TrocarUsurio2: TMenuItem;
    ImagensMenu: TImageList;
    Contas1: TMenuItem;
    PlanodeContas1: TMenuItem;
    ToolButton1: TToolButton;
    btnFinanceiroTesouraria: TToolButton;
    N1: TMenuItem;
    PlanosdeDescontos2: TMenuItem;
    ToolButton4: TToolButton;
    btnFinanc: TToolButton;
    pmFinanc: TPopupMenu;
    Cobrana1: TMenuItem;
    Resgatarpagamentos1: TMenuItem;
    Resgatarpagamentos2: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    iposdePessoas1: TMenuItem;
    Atividades1: TMenuItem;
    N2: TMenuItem;
    PlanosdeDescontos1: TMenuItem;
    Financeiro1: TMenuItem;
    Cobrana2: TMenuItem;
    N3: TMenuItem;
    ResgatarPagamentos3: TMenuItem;
    Mdulo1: TMenuItem;
    Sair1: TMenuItem;
    sbUsuario: TSpeedButton;
    sbDataHora: TSpeedButton;
    stbOpcoes: TStatusBar;
    procedure stbOpcoesDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure PlanosdeDescontos1Click(Sender: TObject);
    procedure PlanosdeDescontos2Click(Sender: TObject);
    procedure btnFinanceiroTesourariaClick(Sender: TObject);
    procedure Resgatarpagamentos2Click(Sender: TObject);
    procedure Cobrana1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private

    { Private declarations }
    function MostraVersao : String ;

  public
    { Public declarations }
    procedure SetRelatorio(Value: TCrpe);
    function GetRelatorio(): TCrpe;

    property Rel: TCrpe read GetRelatorio write SetRelatorio;


    { Public declarations }
    function ProcuraForm(frmForm : TForm):Boolean;
    { # Função:     ProcuraForm
      # Descrição:  Verifica se o formulário está carregado na tela
      # Retorno:    Boolean (True quando está carregado)
      #
      # Parametros: frmForm: Nome do formulário
    }
   function ImprimeRpt(sRelatorio: string; iCodCabecalho: Integer = 1;
                        sFormulaSelecao: string = ''; sFormulaGrupo: string = '';
                        slFormulas: TStringList = nil; slOrdem: TStringList = nil;
                        slParamVariaveis: TStringList = nil; bDialogo: Boolean = False; bForcaConexao: Boolean = True): Boolean;


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
  strWindows : String;
  strReports : String;
  ano_semestre : Integer;
  ano_semestre_incremento : Byte;

Const
  SenhaBD = 'UniMestreProSurf';

implementation

uses
   uDataHoje, uDM, uCadTiposPessoas, uCadAtividades,
   uCadPlanosDescontos, uInscricoesPlanilha, uCobranca, uRelatorios;

{$R *.DFM}

function TPrincipalForm.ImprimeRpt(sRelatorio: string; iCodCabecalho: Integer = 1;
                    sFormulaSelecao: string = ''; sFormulaGrupo: string = '';
                    slFormulas: TStringList = nil; slOrdem: TStringList = nil;
                    slParamVariaveis: TStringList = nil; bDialogo: Boolean = False; bForcaConexao: Boolean = True): Boolean;
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

    Relatorio.Clear;

    Relatorio.WindowState := wsMaximized;

    Relatorio.ReportName := strReports + '\' + sRelatorio;

    if Relatorio.HasSavedData then begin
      Relatorio.DiscardSavedData();
    end;

    //conexao
    if (bForcaConexao) then begin
       Relatorio.Connect.Clear();
       Relatorio.Connect.ServerName := 'unimestre';
       Relatorio.Connect.DatabaseName := 'unimestre';
       Relatorio.Connect.UserID := DM.db.User;
    end;
    Relatorio.Connect.Password := DM.db.Password;
    Relatorio.Connect.Propagate := True;

    //titulo da janela de relatorio
    Relatorio.ReportTitle := Application.Title;

{    if (iCodCabecalho > -1) then begin
      //carrega cabecalho
      if (RelObj.FindObjetoItem(iCodCabecalho) = -1) then begin
        DM.CabecalhoParamFixos();
        RelObj.Add(iCodCabecalho);
        RelObj.getObjetoItem(iCodCabecalho).ProcessaRelObjetos(DM.CabecalhoCampos(iCodCabecalho), slPFixos);
      end;

      //carrega o cabecalho
      RelObj.DefineCabecalho(Relatorio, 'Cabecalho', iCodCabecalho, slParamVariaveis);
    end;
}
    
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
   wAno, wMes, wDia: Word;
   Depto: Integer;
begin

   frmDataHoje.ShowModal;

   if not DM.db.Connected then Exit;

   if not DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'ExtraCurriculares.Modulo.Acesso', npAcesso,True) then
   begin
      Application.Terminate;
   end;

   { Gerando LOG de acesso }
   DM.gerar_log_acesso(2, 'S', 'N', 'N', 'N');

   sbUsuario.Caption :=
         Format('Usuário: %s', [AnsiUpper(PChar(DM.GetUsuarioLogado.Pessoa.Login))]);
   sbDataHora.Caption :=
         Format('Data: %s', [FormatDateTime('dd/mm/yyyy - dddd', DataHoje)]);

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


   Caption := Application.Title + '  (' + MostraVersao + ')';

   { Verificar se já foi criado o departamento para cursos Extra-Curriculares }
   { Apresentar uma mensagem lembrando que o mesmo deve ser criado }
   if dm.isTrue(DM.variavel_parametro('extra_sn_gerar_mensalidades')) then
   begin
      if not TryStrToInt(DM.variavel_parametro('extra_mensalidades_depto'), Depto) then
         Depto := 0;
         
      DM.qyAux1.Close;
      DM.qyAux1.SQL.Clear;
      DM.qyAux1.SQL.Add('SELECT COUNT(*) AS qtde FROM departamentos WHERE codigo = :codigo');
      DM.qyAux1.ParamByName('codigo').AsInteger := Depto;
      DM.qyAux1.Open;
      if DM.qyAux1.FieldByName('qtde').AsInteger = 0 then
         MessageBox(Handle, PChar('Ainda não foi criado departamento para os cursos Extra-Curriculares.'#13'Para gerar mensalidades este departamento é necessário.'#13'O departamento deve ter o código: '+DM.variavel_parametro('extra_mensalidades_depto')), PChar('Informação'), MB_ICONINFORMATION + MB_OK);
   end;
   { / Verificar se já foi criado o departamento para cursos Extra-Curriculares }

  { Habilitando/Desabilitando o botão financeiro de acordo com parâmetro }
  Resgatarpagamentos2.Enabled := DM.isTrue(DM.variavel_parametro('extra_sn_gerar_mensalidades'));
   Cobrana1.Enabled := not DM.isTrue(DM.variavel_parametro('extra_sn_gerar_mensalidades'));

   Cobrana2.Enabled := Cobrana1.Enabled;
   ResgatarPagamentos3.Enabled := Resgatarpagamentos2.Enabled;
end;


procedure TPrincipalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   if DM.GetUsuarioLogado <> nil then
   begin
      if Mensagem( 'Deseja realmente sair do sistema ?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         CanClose := True;
         Dm.db.Disconnect;
      end
      else
         CanClose := False;
      end
   else
   begin
      Dm.db.Disconnect;
      CanClose := True;
   end;

end; { FormCloseQuery }


procedure TPrincipalForm.FormCreate(Sender: TObject);
var
   pWindows: PChar;
   Config: TIniFile;
   ExeDir, IniPath, DefPath: string;
begin
   ExeDir := ExtractFilePath(ParamStr(0));
   IniPath := ExeDir + 'unimestre.ini';
   DefPath := ExeDir + 'Relatorios';

   Config := TIniFile.Create(IniPath);
   try
      strReports := Config.ReadString('Configuracoes', 'Relatorios', DefPath);
   finally
      Config.Free;
   end;

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


  //Relatorios
  RelObj := TRelObjetos.Create();
  Relatorio := TCrpe.Create(Application);

  Relatorio.LoadEngine();

   sbUsuario.Parent := stbOpcoes;
   sbDataHora.Parent := stbOpcoes;

end;  { FormCreate }


procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
var
   I: Integer;
   S: AnsiString;
begin

   if TLoginManager.GetInstancia().RealizarLogin(False) then
   begin
      S := DM.GetUsuarioLogado.Pessoa.Login;
      for I := MDIChildCount - 1 downto 0 do
         MDIChildren[I].Close;
      sbUsuario.Caption :=
            Format('Usuário: %s', [S]);
   end
   else
      Close;
end;

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
   stbOpcoes.Panels.Items[1].Text := GetLongHint(Application.Hint);
end;


procedure TPrincipalForm.MostraHint2(Sender: TObject);
begin
   stbOpcoes.Panels.Items[1].Text := GetLongHint(TWinControl(Sender).Hint);
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

procedure TPrincipalForm.Contas1Click(Sender: TObject);
{ Tipos de Pessoas }
begin
   if DM.RequestPermission('Cadastros.TiposPessoas', npAcesso, True, Handle) then
   begin
      if not ProcuraForm(frm_CadTiposPessoas) then
         Application.CreateForm(Tfrm_CadTiposPessoas, frm_CadTiposPessoas)
      else
         frm_CadTiposPessoas.Show;
   end;

end;

{ Tipos de Pessoas }

procedure TPrincipalForm.PlanodeContas1Click(Sender: TObject);
{ Atividades }
begin
   if DM.RequestPermission('Cadastros.Atividades', npAcesso, True, Handle) then
   begin
      if not ProcuraForm( TForm(frm_CadAtividades) ) then
         Application.CreateForm( Tfrm_CadAtividades, frm_CadAtividades )
      else
         frm_CadAtividades.Show;
   end;

end; { Atividades }

procedure TPrincipalForm.PlanosdeDescontos1Click(Sender: TObject);
{ Planos de Descontos }
begin
   if DM.RequestPermission('Cadastros.Atividades', npAcesso, True, Handle) then
   begin
      if not ProcuraForm(frm_CadPlanosDescontos) then
         Application.CreateForm(Tfrm_CadPlanosDescontos, frm_CadPlanosDescontos)
      else
         frm_CadPlanosDescontos.Show;
   end;
end; { Planos de Descontos }

procedure TPrincipalForm.PlanosdeDescontos2Click(Sender: TObject);
{ Planos de Descontos }
begin
   if DM.RequestPermission('Cadastros.PlanosDescontos', npAcesso, True, Handle) then
   begin
      if not ProcuraForm( TForm(frm_CadPlanosDescontos) ) then
         Application.CreateForm( Tfrm_CadPlanosDescontos, frm_CadPlanosDescontos )
      else
         frm_CadPlanosDescontos.Show;
   end;
end; { Planos de Descontos }

procedure TPrincipalForm.btnFinanceiroTesourariaClick(Sender: TObject);
{ Inscrições }
begin
   if DM.RequestPermission('PlanilhaInscricoes', npAcesso, True, Handle) then
   begin
      if not ProcuraForm( TForm(frm_Inscricoes_Planilha) ) then
         Application.CreateForm( Tfrm_Inscricoes_Planilha, frm_Inscricoes_Planilha )
      else
         frm_Inscricoes_Planilha.Show;
   end;
end; { Inscrições }

procedure TPrincipalForm.Resgatarpagamentos2Click(Sender: TObject);
begin
   if DM.RequestPermission('ResgatarPagamentos', npAcesso, True, Handle) then
   begin
      DM.ResgataPagamentos;
      MessageBox(Handle, PChar('Pagamentos resgatados com sucesso !'), PChar('Informação'), MB_ICONINFORMATION + MB_OK);
   end;
end;

procedure TPrincipalForm.Cobrana1Click(Sender: TObject);
begin
   if DM.RequestPermission('Financeiro.Cobranca', npAcesso, True, Handle) then
      frm_Cobranca.ShowModal;
end;

procedure TPrincipalForm.ToolButton6Click(Sender: TObject);
begin
   if DM.RequestPermission('Relatorios', npAcesso, True, Handle) then
   begin
      Application.CreateForm(Tfrm_Relatorios, frm_Relatorios);
      frm_Relatorios.Modulo := 5 ;
      frm_Relatorios.ShowModal ;
   end;
end;

function TPrincipalForm.getRelatorio: TCrpe;
begin
  Result := Relatorio;
end;

procedure TPrincipalForm.SetRelatorio(Value: TCrpe);
begin
   Relatorio := Value;
end;

procedure TPrincipalForm.stbOpcoesDrawPanel(StatusBar: TStatusBar;
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
      2:
         begin
            sbDataHora.Top := Rect.Top;
            sbDataHora.Left := Rect.Left;
            sbDataHora.Width := Rect.Right - Rect.Left;
            sbDataHora.Height := Rect.Bottom - Rect.Top;
         end;
   end;
end;

end.
