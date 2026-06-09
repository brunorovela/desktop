{ Tela principal - Módulo Acadêmico e Financeiro }
{ Data Revisão: 19/092003 }

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, IniFiles, StdCtrls, ImgList, Buttons, ToolWin;

type
  TPrincipalForm = class(TForm)
    popConfiguracoes: TPopupMenu;
    TrocarUsurio1: TMenuItem;
    N2: TMenuItem;
    ImageList2: TImageList;
    toolEscolar: TToolBar;
    ToolButton20: TToolButton;
    btnAcademico: TToolButton;
    ToolButton22: TToolButton;
    btnAcademicoCadastros: TToolButton;
    ToolButton24: TToolButton;
    btnAcademicoPessoas: TToolButton;
    ToolButton26: TToolButton;
    btnAcademicoMatriculas: TToolButton;
    ToolButton28: TToolButton;
    btnAcademicoSecretaria: TToolButton;
    ToolButton30: TToolButton;
    btnAcademicoRelatorios: TToolButton;
    ToolButton36: TToolButton;
    btnAcademicoSair: TToolButton;
    ToolButton38: TToolButton;
    toolFinanceiro: TToolBar;
    ToolButton19: TToolButton;
    btnFinanceiro: TToolButton;
    ToolButton2: TToolButton;
    btnFinanceiroCadastro: TToolButton;
    ToolButton3: TToolButton;
    btnFinanceiroPessoas: TToolButton;
    ToolButton5: TToolButton;
    btnFinanceiroMensalidades: TToolButton;
    ToolButton7: TToolButton;
    btnFinanceiroCaixa: TToolButton;
    ToolButton9: TToolButton;
    btnFinanceiroRelatorios: TToolButton;
    ToolButton13: TToolButton;
    btnFinanceiroSair: TToolButton;
    ToolButton18: TToolButton;
    popAcademicoCadastros: TPopupMenu;
    Departamentos1: TMenuItem;
    Disciplinas2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    InstituiesdeEnsino1: TMenuItem;
    popAcademicosPessoas: TPopupMenu;
    CadastroPessoa1: TMenuItem;
    Aluno1: TMenuItem;
    Professor1: TMenuItem;
    popFinanceiroMensalidades: TPopupMenu;
    PlanilhadeMensalidades1: TMenuItem;
    N6: TMenuItem;
    RetornodoBanco1: TMenuItem;
    popFinanceiroCadastros: TPopupMenu;
    PlanodeDescontos1: TMenuItem;
    PlanodePagamento1: TMenuItem;
    N7: TMenuItem;
    ndicedaPoupana1: TMenuItem;
    popAcademicoMatriculas: TPopupMenu;
    PlanilhadeMatrculas1: TMenuItem;
    N8: TMenuItem;
    ReservadeVagas1: TMenuItem;
    N9: TMenuItem;
    Equivalencia1: TMenuItem;
    popFinanceiroCaixa: TPopupMenu;
    PlanilhadeCaixa1: TMenuItem;
    popAcademicoSecretaria: TPopupMenu;
    VisualizaodoDiriodeClasse1: TMenuItem;
    N10: TMenuItem;
    FichaIndividual3: TMenuItem;
    DigitaodeNotaseFaltas1: TMenuItem;
    N11: TMenuItem;
    DigitaodaProvaInstitucional1: TMenuItem;
    N12: TMenuItem;
    ObservaesparaHistrico1: TMenuItem;
    ObservaesparaDiploma1: TMenuItem;
    Individual1: TMenuItem;
    Curso1: TMenuItem;
    N13: TMenuItem;
    InformaesGerenciais1: TMenuItem;
    popFinanceiroRelatorios: TPopupMenu;
    popAcademicoRelatorios: TPopupMenu;
    Bloquetos1: TMenuItem;
    ResumodeCaixa1: TMenuItem;
    Negociaes2: TMenuItem;
    Vencidos2: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    PreenchimentodeVafas1: TMenuItem;
    PreenchimentodeVagas2: TMenuItem;
    Documentao2: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    VisualizarDirios1: TMenuItem;
    ImportarDadosparaoDiario1: TMenuItem;
    ExportarDadosparaoDirio1: TMenuItem;
    N20: TMenuItem;
    ToolButton11: TToolButton;
    btnFinanceiroConfiguracoes: TToolButton;
    ToolButton14: TToolButton;
    btnAcademicoConfiguracoes: TToolButton;
    MenuFinanceiro: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem12: TMenuItem;
    PlanodeDesconto1: TMenuItem;
    PlanodePagamento2: TMenuItem;
    N22: TMenuItem;
    ndicedaPoupana2: TMenuItem;
    Cadastro2: TMenuItem;
    Alunos3: TMenuItem;
    Professores1: TMenuItem;
    PlanilhadeMensalidades2: TMenuItem;
    N23: TMenuItem;
    RetornodoBanco2: TMenuItem;
    N24: TMenuItem;
    InformaesGerenciais2: TMenuItem;
    PlanilhadeCaixa2: TMenuItem;
    Bloquetos2: TMenuItem;
    N26: TMenuItem;
    PreenchimentodeVagas3: TMenuItem;
    N27: TMenuItem;
    ResumodeCaixa2: TMenuItem;
    N28: TMenuItem;
    Negociaes3: TMenuItem;
    Vencidos3: TMenuItem;
    UsuriosMdulos2: TMenuItem;
    TrocarUsurio2: TMenuItem;
    N29: TMenuItem;
    MenuAcademico: TMainMenu;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem52: TMenuItem;
    Disciplinas3: TMenuItem;
    N21: TMenuItem;
    DepartamentoseCursos1: TMenuItem;
    N30: TMenuItem;
    InstituiesdeEnsino2: TMenuItem;
    PlanilhadeMatrculas2: TMenuItem;
    N31: TMenuItem;
    ReservadeVagas2: TMenuItem;
    N32: TMenuItem;
    EquivalnciadeDisciplinas1: TMenuItem;
    DiriodeClasse1: TMenuItem;
    VisualizarDirio1: TMenuItem;
    ImportarDirioparaaSecretaria1: TMenuItem;
    ExportarDadosparaoDirio2: TMenuItem;
    N33: TMenuItem;
    FichaIndividual4: TMenuItem;
    N34: TMenuItem;
    DigitaodeMdiaseFaltas2: TMenuItem;
    DigitaodaProvaInstitucional2: TMenuItem;
    N35: TMenuItem;
    ObservaesparaHistrico2: TMenuItem;
    ObservaesparaDiploma2: TMenuItem;
    Individual2: TMenuItem;
    Curso2: TMenuItem;
    PreenchimentodeVagas4: TMenuItem;
    N37: TMenuItem;
    Documentao3: TMenuItem;
    MensagensGerais3: TMenuItem;
    N38: TMenuItem;
    BarraDeStatus: TToolBar;
    ToolButton39: TToolButton;
    btnUsuario: TToolButton;
    ToolButton41: TToolButton;
    ToolButton43: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    ToolButton21: TToolButton;
    DisciplinaseTurmasdoProfessor1: TMenuItem;
    Todos1: TMenuItem;
    MduloseUsurios1: TMenuItem;
    N3: TMenuItem;
    MensagensdoBloqueto1: TMenuItem;
    DisciplinaseTurmasdoProfessor2: TMenuItem;
    N14: TMenuItem;
    N25: TMenuItem;
    N39: TMenuItem;
    Todos2: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    RelatriosFinanceiros1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Mensalidades1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure Bloquetos1Click(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDatasClick(Sender: TObject);
    procedure Disciplinas2Click(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure InstituiesdeEnsino1Click(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnAcademicoClick(Sender: TObject);
    procedure CadastroPessoa1Click(Sender: TObject);
    procedure Professor1Click(Sender: TObject);
    procedure Aluno1Click(Sender: TObject);
    procedure PlanilhadeMensalidades1Click(Sender: TObject);
    procedure RetornodoBanco1Click(Sender: TObject);
    procedure ndicedaPoupana1Click(Sender: TObject);
    procedure PlanodePagamento1Click(Sender: TObject);
    procedure PlanodeDescontos1Click(Sender: TObject);
    procedure PlanilhadeMatrculas1Click(Sender: TObject);
    procedure ReservadeVagas1Click(Sender: TObject);
    procedure Equivalencia1Click(Sender: TObject);
    procedure PlanilhadeCaixa1Click(Sender: TObject);
    procedure FichaIndividual3Click(Sender: TObject);
    procedure DigitaodeNotaseFaltas1Click(Sender: TObject);
    procedure DigitaodaProvaInstitucional1Click(Sender: TObject);
    procedure ObservaesparaHistrico1Click(Sender: TObject);
    procedure Curso1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Negociaes2Click(Sender: TObject);
    procedure Vencidos2Click(Sender: TObject);
    procedure PreenchimentodeVafas1Click(Sender: TObject);
    procedure ListadeChamadas1Click(Sender: TObject);
    procedure Documentao2Click(Sender: TObject);
    procedure MensagensGerais2Click(Sender: TObject);
    procedure VisualizarDirios1Click(Sender: TObject);
    procedure ImportarDadosparaoDiario1Click(Sender: TObject);
    procedure DisciplinaseTurmasdoProfessor1Click(Sender: TObject);
    procedure Todos1Click(Sender: TObject);
    procedure MduloseUsurios1Click(Sender: TObject);
    procedure MensagensdoBloqueto1Click(Sender: TObject);
    procedure ExportarDadosparaoDirio2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
    function ProcuraForm(frmForm : TForm):Boolean;

    { # Função:     ProcuraForm
      # Descrição:  Verifica se o formulário está carregado na tela
      # Retorno:    Boolean (True quando está carregado)
      #
      # Parametros: frmForm: Nome do formulário
    }

    Function PrintRpt(AReport:String;ASelectionFormula:String;const AFields: Array of String;
	     const AValues: Array of String;const ASortFields: Array of String;ADialog: Boolean):Boolean;

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
  PrincipalForm: TPrincipalForm;
  DataHoje : TDateTime;
  strWindows : String;
  strPrograma : String;
  strReports : String;

Const
  SenhaBD = 'UniMestreProSurf';

implementation

uses uSplash, uSenha, uDataHoje, uDM, uUsuarios, uMatriculas,
  uManutMens, uTransferir, uNovaMens, uMensalidades, uPlanos, uPoupanca,
  uReserva, uCaixa, uResumo, uRetornoCEF, uPreenchimento,
  uImpBloquetos, uSistema, uInformacoes, uPlanosDesconto,
  uDisciplinas, uCursos, uImpNegociacoes,
  uImpVencidos, uListaChamada, uFichaIndividual,
  uDigFichaIndividual, uImpDocumentacao,
  uMensagensGerais, uEscolas, ObsDipAluno, ObsDipCurso,
  uEquivalencias, uCaixaDepto, uImportarDiario,
  uDigProvaInstitucional, uDiarioView, uPlanosDescontoCAd, uPessoas, uAluno,
  uProfessor, uRelatorios, uProcessando, uProfessores, HistAluno,
  uDiario_Classe_Exportacao;

{$R *.DFM}

Function TPrincipalForm.PrintRpt(AReport:String;
                  ASelectionFormula:String;
                  const AFields: Array of String;
                  const AValues: Array of String;
                  const ASortFields: Array of String;
                  ADialog: Boolean):Boolean;
var
  n : Integer;
begin

    { O arquivo CRPE.DLL deve estar na mesma pasta do executável }
    Report.CrpePath := ExtractFilePath(Application.ExeName);

    Report.DiscardSavedData := True;

    { A pasta de relatórios strReports é configurada no arquivo wmestre.ini }
    Report.ReportName := strReports + '\' + AReport;

    Report.Connect.Retrieve;

    Report.Connect.Password := SenhaBD;

    Report.ReportTitle := Application.Title;

    for n := Low(AFields) to High(AFields) do
    begin
      Report.Formulas.Retrieve;
      Report.Formulas.Name := AFields[n];
      Report.Formulas.Formula.Clear;
      Report.Formulas.Formula.Add( '"' + AValues[n] + '"' );
      Report.Formulas.Send;
    end;

    Report.Selection.Formula.Clear;
    Report.Selection.Formula.Add( ASelectionFormula );

    if Length(ASortFields) > 0 then
    begin
      Report.SortFields.Retrieve;
      Report.SortFields.Clear;

      for n := Low(ASortFields) to High(ASortFields) do
      begin
	Report.SortFields.Add(n);
	Report.SortFields.Number := n;
	Report.SortFields.Field := ASortFields[n];
	Report.SortFields.Direction := sdAscending;
      end;
    end;

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

    try

      if not Report.Execute then
      begin
	Report.CloseEngine;
	Screen.Cursor := crDefault;
	Result := False;
	Exit;
      end;

      while not Report.PrintEnded do Application.ProcessMessages;
      Report.CloseJob;
      Result := True;
    except
       Messagedlg('Não foi possível imprimir o relatório.', mtError, [mbOk], 0);
       Result := False;
    End;

end; { PrintRpt }


procedure TPrincipalForm.FormShow(Sender: TObject);
begin

   frmSplash.Close;

   { Login do Usuário }

   PasswordDlg.ShowModal;
   frmDataHoje.ShowModal;

   btnUsuario.Caption := ' USUÁRIO : ' + DM.tblUsuariosNomeNome.AsString;
   btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) +
                       ' - ' + FormatDateTime( 'dddd', DataHoje );
   PrincipalForm.Caption := Application.Title;

end; { FormShow }


procedure TPrincipalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if Mensagem( 'Deseja realmente sair do sistema ?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

     CanClose := True;

  end
  else

    CanClose := False;

end; { FormCloseQuery }


procedure TPrincipalForm.Mensalidades1Click(Sender: TObject);
{ Planilha de Mensalidades }
begin                       

  if not PasswordDlg.Autorizar( 2001, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmManutencaoMens) ) then
     Application.CreateForm( TfrmManutencaoMens, frmManutencaoMens );

  Application.CreateForm( TfrmTransferir, frmTransferir );
  Application.CreateForm( TfrmNovaMens, frmNovaMens );

  if not ProcuraForm( TForm(frmMensalidades) ) then
     Application.CreateForm( TfrmMensalidades, frmMensalidades )
  else
     frmMensalidades.Show;

end; { Mensalidades1Click }

procedure TPrincipalForm.FormCreate(Sender: TObject);
var
  pWindows : PChar;
  n : Integer;
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


procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
{ Trocar de Usuários }
begin

  PasswordDlg.intTipo := 0;
  PasswordDlg.ShowModal;
  btnUsuario.Caption := ' USUÁRIO : ' + DM.tblUsuariosNomeNome.AsString;

end; { TrocarUsurio1Click }


procedure TPrincipalForm.Bloquetos1Click(Sender: TObject);
{ Impressão de Bloquetos }
begin

  if not PasswordDlg.Autorizar( 2002, taAcessar ) then Exit;

  try

     Application.CreateForm(TfrmImpBloquetos, frmImpBloquetos);
     frmImpBloquetos.ShowModal;

  finally

     frmImpBloquetos.Free;
     
  end;

end; { Bloquetos1Click }

procedure TPrincipalForm.Sistema1Click(Sender: TObject);
{ Menagens do Bloqueto }
begin

  if not PasswordDlg.Autorizar( 2003, taAcessar ) then Exit;

  Application.CreateForm( TfrmSistema, frmSistema );
  frmSistema.ShowModal;
  
end; { Sistema1Click }


procedure TPrincipalForm.btnSairClick(Sender: TObject);
{ Sair do Sistema }
begin

  Close;

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


procedure TPrincipalForm.btnDatasClick(Sender: TObject);
{ Trocar data de Hoje }
begin

  frmDataHoje.ShowModal;

end; { btnDatasClick }


procedure TPrincipalForm.Disciplinas2Click(Sender: TObject);
{ Cadastro de Disciplinas }
begin

  if not PasswordDlg.Autorizar( 1006, taAcessar ) then Exit;
  Application.CreateForm( TfrmDisciplinas, frmDisciplinas );

end; { Disciplinas2Click }

procedure TPrincipalForm.Departamentos1Click(Sender: TObject);
{ Cadastro de Departamentos e Cursos }
begin

  if not PasswordDlg.Autorizar( 1006, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmCursos) ) then
      Application.CreateForm( TfrmCursos, frmCursos )
  else
      frmCursos.Show;
    
end;  { Departamentos1Click }

procedure TPrincipalForm.InstituiesdeEnsino1Click(Sender: TObject);
{ Cadastro de Instituições de Ensino }
begin

  if not PasswordDlg.Autorizar( 1004, taAcessar ) then Exit;

  Application.CreateForm( TfrmEscolas, frmEscolas );
  frmEscolas.Show;

end; { InstituiesdeEnsino1Click }

procedure TPrincipalForm.btnFinanceiroClick(Sender: TObject);
{ Alterar para Menu Acadêmico  }
begin

  toolFinanceiro.Visible := False;
  toolEscolar.Visible := True;
  PrincipalForm.Menu := MenuAcademico;

end; { btnFinanceiroClick }

procedure TPrincipalForm.btnAcademicoClick(Sender: TObject);
{ Alterar para Menu Financeiro  }
begin

  toolEscolar.Visible := False;
  toolFinanceiro.Visible := True;
  PrincipalForm.Menu := MenuFinanceiro;

end; { btnAcademicoClick }


procedure TPrincipalForm.CadastroPessoa1Click(Sender: TObject);
{ Cadastro de Pessoas }
begin

 if not PasswordDlg.Autorizar( 1001, taAcessar ) then Exit;

 if not ProcuraForm( TForm(frm_Pessoas) ) then
      Application.CreateForm( Tfrm_Pessoas, frm_Pessoas )
  else
      frm_Pessoas.Show;

  pnlMsg.Caption := '';

end; { CadastroPessoa1Click }


procedure TPrincipalForm.Professor1Click(Sender: TObject);
{ Cadastro de Professores }
begin

  if not PasswordDlg.Autorizar( 1002, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frm_Professores) ) then
     Application.CreateForm( Tfrm_Professores, frm_Professores )
  else
     frm_Professores.Show;
     
  pnlMsg.Caption := '';

end; { Professor1Click } 


procedure TPrincipalForm.Aluno1Click(Sender: TObject);
{ Cadastro de Alunos }
begin

  if not PasswordDlg.Autorizar( 1003, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frm_Alunos) ) then
    Application.CreateForm( Tfrm_Alunos, frm_Alunos )
  else
    frm_Alunos.Show;

end; { Aluno1Click }

procedure TPrincipalForm.PlanilhadeMensalidades1Click(Sender: TObject);
{ Planilha de Mensalidades }
begin

  if not PasswordDlg.Autorizar( 2001, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmManutencaoMens) ) then
     Application.CreateForm( TfrmManutencaoMens, frmManutencaoMens );

  Application.CreateForm( TfrmTransferir, frmTransferir );

  Application.CreateForm( TfrmNovaMens, frmNovaMens );

  if not ProcuraForm( TForm(frmMensalidades) ) then
     Application.CreateForm( TfrmMensalidades, frmMensalidades )
  else
     frmMensalidades.Show;

end;  {PlanilhadeMensalidades1Click}

procedure TPrincipalForm.RetornodoBanco1Click(Sender: TObject);
{ Retorno do Banco } 
begin

  if not PasswordDlg.Autorizar( 2004, taAcessar ) then Exit;

  Application.CreateForm( TfrmRetCEF, frmRetCEF );
  frmRetCEF.ShowModal;

end; { RetornodoBanco1Click }

procedure TPrincipalForm.ndicedaPoupana1Click(Sender: TObject);
{ Cadastro de Índice de Poupança }
begin

  if not PasswordDlg.Autorizar( 2005, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmPoupanca) ) then
      Application.CreateForm( TfrmPoupanca, frmPoupanca )
  else
     frmPoupanca.Show;

end; { ndicedaPoupana1Click }


procedure TPrincipalForm.PlanodePagamento1Click(Sender: TObject);
{ Cadastro de Planos de Pagamento }
begin

  if not PasswordDlg.Autorizar( 2006, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmPlanos) ) then
     Application.CreateForm( TfrmPlanos, frmPlanos )
  else
     frmPlanos.Show;

end; { PlanodePagamento1Click }

procedure TPrincipalForm.PlanodeDescontos1Click(Sender: TObject);
{ Planos de Descontos }
begin

  if not PasswordDlg.Autorizar( 2007, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmPlanosDescontoCad) ) then
     Application.CreateForm( TfrmPlanosDescontoCad, frmPlanosDescontoCad )
  else
     frmPlanosDescontoCad.Show;

end; { PlanodeDescontos1Click }


procedure TPrincipalForm.PlanilhadeMatrculas1Click(Sender: TObject);
{ Planilha de Matrículas }
begin

  if not PasswordDlg.Autorizar( 1009, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmMatriculas) ) then
    Application.CreateForm( TfrmMatriculas, frmMatriculas )
  else
    frmMatriculas.Show;

end; { PlanilhadeMatrculas1Click }

procedure TPrincipalForm.ReservadeVagas1Click(Sender: TObject);
{ Reserva de Vagas }
begin

  if not PasswordDlg.Autorizar( 1011, taAcessar ) then Exit;
  try

     Application.CreateForm(TfrmReserva, frmReserva);
     frmReserva.ShowModal;

  finally

     frmreserva.Free;

  end;

end; { ReservadeVagas1Click }


procedure TPrincipalForm.Equivalencia1Click(Sender: TObject);
{ Equivalencia de Disciplinas }
begin

  if not PasswordDlg.Autorizar( 1010, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmEquivalencias) ) then
      Application.CreateForm( TfrmEquivalencias, frmEquivalencias )
  else
      frmEquivalencias.Show;

end; { Equivalencia1Click } 


procedure TPrincipalForm.PlanilhadeCaixa1Click(Sender: TObject);
{ Planilha de Caixa }
begin

 try

    Application.CreateForm(TfmCaixaDepto, fmCaixaDepto);
    fmCaixaDepto.tblControle.Close;
    fmCaixaDepto.tblControle.Open;
    fmCaixaDepto.tblCaixas.Close;
    fmCaixaDepto.tblCaixas.Open;
    fmCaixaDepto.tblCaixa.Close;
    fmCaixaDepto.tblCaixa.Open;

    fmCaixaDepto.ShowModal
    
  finally

    fmCaixaDepto.Free;

  end;

end; { PlanilhadeCaixa1Click }


procedure TPrincipalForm.FichaIndividual3Click(Sender: TObject);
{ Planilha de Ficha Individual }
begin

  if not PasswordDlg.Autorizar( 1014, taAcessar ) then Exit;

  Application.CreateForm( TfrmFichaIndividual, frmFichaIndividual );

end; { FichaIndividual3Click }

procedure TPrincipalForm.DigitaodeNotaseFaltas1Click(Sender: TObject);
{ Digitação de Notas e Faltas }
begin

  if not PasswordDlg.Autorizar( 1012, taAcessar ) then Exit;

  Application.CreateForm( TfrmDigFichaIndividual, frmDigFichaIndividual );
  frmDigFichaIndividual.ShowModal;

end;{ DigitaodeNotaseFaltas1Click }


procedure TPrincipalForm.DigitaodaProvaInstitucional1Click(
  Sender: TObject);
{ Digitação da Prova Institucional }
begin

  if not PasswordDlg.Autorizar( 1013, taAcessar ) then Exit;

  Application.CreateForm( TfrmDigProvaInstitucional, frmDigProvaInstitucional );
  frmDigProvaInstitucional.ShowModal;

end; { DigitaodaProvaInstitucional1Click }


procedure TPrincipalForm.ObservaesparaHistrico1Click(Sender: TObject);
{ Observações para o Histórico }
begin

  if not PasswordDlg.Autorizar( 1015, taAcessar ) then Exit;

  try

    if fmObsHistorico = nil then
       Application.CreateForm( TfmObsHistorico, fmObsHistorico );

    fmObsHistorico.showmodal;

  finally

    fmObsHistorico.free;
    fmObsHistorico := nil;

  end;

end; { ObservaesparaHistrico1Click }

procedure TPrincipalForm.Curso1Click(Sender: TObject);
{ Observações para Diploma por Curso }
begin

  if not PasswordDlg.Autorizar( 1015, taAcessar ) then Exit;

  try

    if fmObsDipCurso = nil then
       Application.CreateForm( TfmObsDipCurso, fmObsDipCurso);

    fmObsDipCurso.showmodal;

  finally

    fmObsDipCurso.free;
    fmObsDipCurso:=nil;

  end;

end; { Curso1Click }


procedure TPrincipalForm.Individual1Click(Sender: TObject);
{ Observações para Diploma Individual }
begin

  if not PasswordDlg.Autorizar( 1015, taAcessar ) then Exit;

  try
    if fmObsDipAluno = nil then

       Application.CreateForm( TfmObsDipAluno, fmObsDipAluno);

    fmObsDipAluno.showmodal;

  finally

    fmObsDipAluno.free;
    fmObsDipAluno:=nil;

  end;

end; { Individual1Click }

procedure TPrincipalForm.Negociaes2Click(Sender: TObject);
{ Negociações de Mensalidades } 
begin

  if not PasswordDlg.Autorizar( 2017, taAcessar ) then Exit;

  try

     Application.CreateForm(TfrmImpNegociacoes, frmImpNegociacoes);
     frmImpNegociacoes.ShowModal;

  finally

     frmImpNegociacoes.Free;

  end;

end; { Negociaes2Click }

procedure TPrincipalForm.Vencidos2Click(Sender: TObject);
{ Vencidos }
begin

  if not PasswordDlg.Autorizar( 2011, taAcessar ) then Exit;

  try
    Application.CreateForm(TfrmImpVencidos, frmImpVencidos);
    frmImpVencidos.ShowModal;

  finally

    frmImpVencidos.Free;

  end;

end;  { Vencidos2Click } 

procedure TPrincipalForm.PreenchimentodeVafas1Click(Sender: TObject);
{ Preenchimento de Vagas }
begin

  if not PasswordDlg.Autorizar( 1016, taAcessar ) then Exit;

  try
  
    Application.CreateForm(TfrmPreenchimento, frmPreenchimento);
    frmPreenchimento.ShowModal;

  finally

    frmPreenchimento.Free;

  end;

end; { Preenchimento de Vagas }


procedure TPrincipalForm.ListadeChamadas1Click(Sender: TObject);
{ Lista de Chamadas }
begin

  if not PasswordDlg.Autorizar( 1016, taAcessar ) then Exit;

  try
     Application.CreateForm(TfrmListaChamada, frmListaChamada);
     frmListaChamada.ShowModal;
  finally
     frmListaChamada.Free;
  end;

end;  { ListadeChamadas1Click } 

procedure TPrincipalForm.Documentao2Click(Sender: TObject);
{ Documentação }
begin

  if not PasswordDlg.Autorizar( 1020, taAcessar ) then Exit;
  try

     Application.CreateForm(TfrmImpDocumentacao, frmImpDocumentacao);
     frmImpDocumentacao.ShowModal;

  finally

     frmImpDocumentacao.Free;
     
  end;

end; { Documentao2Click }


procedure TPrincipalForm.MensagensGerais2Click(Sender: TObject);
{ Mensagens Gerais } 
begin

  if not PasswordDlg.Autorizar( 1005, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmMensagensGerais) ) then

    Application.CreateForm( TfrmMensagensGerais, frmMensagensGerais )
    
  else
    frmMensagensGerais.Show;

end; { MensagensGerais2Click } 

procedure TPrincipalForm.VisualizarDirios1Click(Sender: TObject);
{ Visualizar Diários de Classe } 
begin

   if not PasswordDlg.Autorizar( 1007, taAcessar ) then Exit;

   DiarioView.Show;

end; { VisualizarDirios1Click }


procedure TPrincipalForm.ImportarDadosparaoDiario1Click(Sender: TObject);
{ Importar dados para o Diário de Classe }
begin

  if not PasswordDlg.Autorizar( 1008, taAcessar ) then Exit;

  if not ProcuraForm( TForm(frmImportarDiario) ) then

    Application.CreateForm( TfrmImportarDiario, frmImportarDiario )

  else
     frmImportarDiario.Show;

end; { ImportarDadosparaoDiario1Click }


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

   ShowMessage('Erro: ' + E.Message + #13 + Sender.ClassName);

end;  { MostraErro }


procedure TPrincipalForm.DisciplinaseTurmasdoProfessor1Click(
  Sender: TObject);
{ Turmas do Professor }  
begin

  if not PasswordDlg.Autorizar( 1006, taAcessar ) then Exit;

  Application.CreateForm( TfrmProfessores, frmProfessores );
  frmProfessores.Show;

end; { DisciplinaseTurmasdoProfessor1Click }


procedure TPrincipalForm.Todos1Click(Sender: TObject);
{ Todos os Relatórios }
begin

   if not PasswordDlg.Autorizar( 1018, taAcessar ) then Exit;

   frm_Relatorios.Modulo := 1 ;
   frm_Relatorios.ShowModal ;

end; { Todos1Click }


procedure TPrincipalForm.MduloseUsurios1Click(Sender: TObject);
{ Módulos e Usuários }
begin

  if not PasswordDlg.Autorizar( 3001, taAcessar ) then Exit;

  Application.CreateForm( TfrmUsuarios, frmUsuarios );
  frmUsuarios.Show;

end;  { MduloseUsurios1Click } 


procedure TPrincipalForm.MensagensdoBloqueto1Click(Sender: TObject);
{ Mensagens do Bloqueto }
begin

  if not PasswordDlg.Autorizar( 2003, taAcessar ) then Exit;

  Application.CreateForm( TfrmSistema, frmSistema );
  frmSistema.ShowModal;

end; { MensagensdoBloqueto1Click } 

procedure TPrincipalForm.ExportarDadosparaoDirio2Click(Sender: TObject);
begin
   Application.CreateForm(Tfrm_Diario_Classe_Exportacao, frm_Diario_Classe_Exportacao);
end;

end.
