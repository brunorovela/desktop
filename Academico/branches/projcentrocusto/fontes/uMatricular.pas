unit uMatricular;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, ZConnection, StdCtrls, ComCtrls, ExtCtrls, Mask, DBCtrls,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, checklst,
  IniFiles, ucrpe32, Buttons, Variants, StrUtils, ClassRegistros;

type
  tDisc = record
     turma : string[50];
     curso : string[15];
     disciplina : integer;
     creditos : Currency;
  end;


  TfrmMatricular = class(TForm)
    dtcTurmas: TDataSource;
    Page: TPageControl;
    tabMatricula: TTabSheet;
    tabPlano: TTabSheet;
    Panel3: TPanel;
    dtcMatriculas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    txtAnoSemestre: TDBEdit;
    dtcPlanos: TDataSource;
    Bevel1: TBevel;
    btnF2: TButton;
    btnF3: TButton;
    btnFechar: TButton;
    tabVencimento: TTabSheet;
    Panel1: TPanel;
    radUtil: TRadioButton;
    txtDiaUtil: TEdit;
    Label4: TLabel;
    radSempre: TRadioButton;
    txtSempreDia: TEdit;
    Panel2: TPanel;
    grd2: TDBGrid;
    Panel4: TPanel;
    grd: TDBGrid;
    Label5: TLabel;
    txtApartir: TMaskEdit;
    tabImprimir: TTabSheet;
    Panel5: TPanel;
    btnRecibo: TButton;
    btnRequerimento: TButton;
    btnBloqueto: TButton;
    btnContrato: TButton;
    EditDataMatricula: TDBEdit;
    btnPlanosDesconto: TButton;
    lst: TCheckListBox;
    tblTurmas: TUMZQuery;
    tblMatriculas: TUMZQuery;
    tblMatriculasCodigoAluno: TIntegerField;
    tblMatriculasTurma: TStringField;
    tblMatriculasDataEmissao: TDateTimeField;
    tblMatriculasUsuario: TStringField;
    tblMatriculasPlanoPagamento: TIntegerField;
    tblMatriculasSituacao: TSmallintField;
    tblMatriculasDataSaida: TDateTimeField;
    tblMatriculasPlanoDesconto: TIntegerField;
    tblPlanos: TUMZQuery;
    tblPlanosCodigo: TIntegerField;
    tblPlanosTurma: TStringField;
    tblPlanosParcelas: TSmallintField;
    tblPlanosValorCobrado: TFloatField;
    tblPlanosValorContrato: TFloatField;
    tblPlanosTaxaApostila: TFloatField;
    tblPlanosDesconto: TFloatField;
    tblPlanosMatricula: TFloatField;
    tblPlanosApartir: TDateTimeField;
    tblMatriculasRead: TUMZQuery;
    tblMatriculasReadCodigoAluno: TIntegerField;
    tblMatriculasReadTurma: TStringField;
    tblMatriculasReadDataEmissao: TDateTimeField;
    tblMatriculasReadUsuario: TStringField;
    tblMatriculasReadPlanoPagamento: TIntegerField;
    tblMatriculasReadSituacao: TSmallintField;
    tblMatriculasReadDataSaida: TDateTimeField;
    tblMatriculasReadPlanoDesconto: TIntegerField;
    tblMatriculasAnoSemestre: TSmallintField;
    tblMatriculasReadAnoSemestre: TSmallintField;
    tblMatriculasCurso: TStringField;
    tblMatriculasTurmaDependencia: TStringField;
    tblItensPagamento: TUMZQuery;
    tblItensPagamentoCodigoPlano: TIntegerField;
    tblItensPagamentoMes: TSmallintField;
    tblItensPagamentoParcela: TSmallintField;
    tblItensPagamentoValorBruto: TFloatField;
    tblItensPagamentoValorDesconto: TFloatField;
    tblItensPagamentoValorExtra: TFloatField;
    tblItensPagamentoDescontoExtra: TFloatField;
    tblItensPagamentoValorTotal: TFloatField;
    tblPlanosAnoSemestre: TSmallintField;
    tblPlanosDescricao: TStringField;
    Label3: TLabel;
    txtCurso: TDBEdit;
    btnCurso: TSpeedButton;
    tblTurmasqtd_matriculas: TIntegerField;
    CheckBox1: TCheckBox;
    Bevel2: TBevel;
    tblMatriculasdescInstituicao: TStringField;
    tblMatriculasdescIngressos: TStringField;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    tblMatriculasReadImpresso: TStringField;
    tblMatriculasReadDiploma: TStringField;
    tblMatriculasImpresso: TStringField;
    tblMatriculasDiploma: TStringField;
    tblMens: TUMZQuery;
    qMat: TUMZQuery;
    qCaixaDepto: TUMZQuery;
    tblPlanoDesc: TUMZQuery;
    tabDisc: TTabSheet;
    Panel6: TPanel;
    lstDisciplinas: TCheckListBox;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    btnRemoverDisciplinas: TSpeedButton;
    lbCreditos: TLabel;
    tblPlanosnr_dias_parczero: TSmallintField;
    tblPlanossn_dias_uteis: TStringField;
    tblPlanossn_creditos: TStringField;
    tblPlanosnr_creditos_base: TFloatField;
    tblItensPagamentonr_creditos_minimos: TFloatField;
    tblItensPagamentosn_credito_parcela: TStringField;
    qryInsert: TUMZQuery;
    qryMatricularGrade: TUMZQuery;
    btnConfiguracoes: TButton;
    radPlano: TRadioButton;
    tblItensPagamentonr_dia: TSmallintField;
    tblItensPagamentonr_ano: TSmallintField;
    tblMatriculasnr_aluno: TSmallintField;
    pnSemPlano: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lbMsg: TLabel;
    Label14: TLabel;
    sbDesmarcar: TSpeedButton;
    sbMarcar: TSpeedButton;
    pnAltera: TPanel;
    Label18: TLabel;
    sbConfirmaAltera: TSpeedButton;
    sbCancelaAltera: TSpeedButton;
    edValorExtra: TEdit;
    edDescontoEmDia: TEdit;
    edDescontoFixo: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    sbMarcarNovas: TSpeedButton;
    sbDesmarcarNovas: TSpeedButton;
    sbAlterar: TSpeedButton;
    tblItensPagamentocd_coligada: TSmallintField;
    tblItensPagamentocd_tipo_parcela: TSmallintField;
    tblMatriculascd_matricula: TStringField;
    tblItensPagamentods_tipo_titulo: TStringField;
    btnExecutarPlano: TSpeedButton;
    Label16: TLabel;
    txtParcelas: TEdit;
    chkList: TCheckListBox;
    SpeedButton2: TSpeedButton;
    qryTurmasLotacaoVagas: TUMZQuery;
    qryBloqDataVencto: TUMZQuery;
    qryBloqDataVenctonr_dia_vencimento: TLargeintField;
    tblMatriculascd_ingresso: TIntegerField;
    tblMatriculascd_instituicao_origem: TIntegerField;
    tblItensPagamentocd_conta: TLargeintField;
    qrySelectHorarios: TUMZReadOnlyQuery;
    qrySelectSerie: TUMZReadOnlyQuery;
    qrySelectHorariosHORARIO: TStringField;
    qrySelectSerieSERIE: TIntegerField;
    qrySelectPreReq: TUMZReadOnlyQuery;
    qrySelectPreReqCD_CURSO: TStringField;
    qrySelectPreReqCD_GRADE: TLargeintField;
    qrySelectPreReqCD_DISCIPLI: TIntegerField;
    qrySelectPreReqCD_DISCIPLI_PRE: TIntegerField;
    qrySelectPreReqDESCRICAO: TStringField;
    qrySelectNaoCursadas: TUMZReadOnlyQuery;
    qrySelectNaoCursadasCODIGO: TIntegerField;
    qrySelectNaoCursadasDESCRICAO: TStringField;
    qrySelectNaoCursadasCODIGOALUNO: TIntegerField;
    qrySelectCreditos: TUMZReadOnlyQuery;
    qrySelectCreditosNUMEROAULAS: TFloatField;
    qryTurmasLotacaoVagasNR_ANOSEMESTRE: TIntegerField;
    qryTurmasLotacaoVagasCD_TURMA: TStringField;
    qryTurmasLotacaoVagasCD_DISCIPLINA: TIntegerField;
    qryTurmasLotacaoVagasCD_CURSO: TStringField;
    qryTurmasLotacaoVagasSN_BLOQUEAR_VAGAS: TSmallintField;
    qryTurmasLotacaoVagasNR_VAGAS: TIntegerField;
    qryTurmasLotacaoVagasDS_DISCIPLINA: TStringField;
    qryTurmasLotacaoVagasNR_MATRICULADOS: TLargeintField;
    tblMatriculascd_matricula_curso: TLargeintField;
    tblItensPagamentocd_item_plano: TIntegerField;
    tblTurmasANOSEMESTRE: TSmallintField;
    tblTurmasCODIGO: TStringField;
    tblTurmasCURSO: TStringField;
    tblTurmasSERIE: TSmallintField;
    tblTurmasTURNO: TStringField;
    tblTurmasDESCRICAO: TStringField;
    tblTurmasCONTRATO: TStringField;
    tblTurmasVAGAS: TSmallintField;
    tblTurmasSN_BLOQUEAR_VAGAS: TSmallintField;
    tblTurmasHORAINICIO: TDateTimeField;
    tblTurmasHORAFIM: TDateTimeField;
    tblTurmasDATAINICIO: TDateTimeField;
    tblTurmasDATAFIM: TDateTimeField;
    tblTurmasIDADECONCLUSAO: TSmallintField;
    tblTurmasDATACONCLUSAO: TDateTimeField;
    tblTurmasCD_CENTRO: TLargeintField;
    tblTurmasCD_SITUACAO: TSmallintField;
    tblTurmasSN_USAR_PLANO: TSmallintField;
    tblTurmasDEPTO: TSmallintField;
    tblTurmasDS_VALOR: TStringField;
    tblTurmasCD_COLIGADA: TIntegerField;
    procedure lstDisciplinasDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure txtSempreDiaChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edValorExtraKeyPress(Sender: TObject; var Key: Char);
    procedure sbCancelaAlteraClick(Sender: TObject);
    procedure sbConfirmaAlteraClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbDesmarcarNovasClick(Sender: TObject);
    procedure sbMarcarNovasClick(Sender: TObject);
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure btnF3Click(Sender: TObject);
    procedure btnF2Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtAnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure PageChange(Sender: TObject);
    procedure grd2KeyPress(Sender: TObject; var Key: Char);
    procedure txtDiaUtilKeyPress(Sender: TObject; var Key: Char);
    procedure txtApartirKeyPress(Sender: TObject; var Key: Char);
    procedure CalcularVencimento;
    procedure GerarMensalidades;
    procedure btnExecutarPlanoClick(Sender: TObject);
    procedure btnReciboClick(Sender: TObject);
    procedure btnContratoClick(Sender: TObject);
    procedure btnRequerimentoClick(Sender: TObject);
    procedure btnBloquetoClick(Sender: TObject);
    procedure grd2DblClick(Sender: TObject);
    procedure txtSempreDiaEnter(Sender: TObject);
    procedure radSempreClick(Sender: TObject);
    procedure radUtilClick(Sender: TObject);
    procedure txtDiaUtilEnter(Sender: TObject);
    procedure txtSempreDiaKeyPress(Sender: TObject; var Key: Char);
    function AtualizarControle( dblValor : Single ) : Boolean;
    procedure EditDataMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPlanosDescontoClick(Sender: TObject);
    procedure InicializaArrays;
    procedure tblMatriculasAfterInsert(DataSet: TDataSet);
    procedure tblMatriculasBeforePost(DataSet: TDataSet);
    procedure txtDiaUtilExit(Sender: TObject);
    procedure dtcMatriculasDataChange(Sender: TObject; Field: TField);
    procedure btnCursoClick(Sender: TObject);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
    procedure tblTurmasCalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure tblMatriculasNewRecord(DataSet: TDataSet);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure PageChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lstDisciplinasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure btnRemoverDisciplinasClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure radPlanoClick(Sender: TObject);

  private
    FBBloqVencto: boolean;
    FSObsPlanoDesconto: string;
    flgMensalidades : Boolean;
    PodeMudar : Boolean;
    gerarDisciplinas : Boolean;
    ListaHorarios : TStringList;
    function IsBloquearDataVencto: boolean;
    function VerificaVagas: boolean;
    function getDiaVencimentoAluno(const AICodigoAluno: Integer): Integer;
    Procedure FiltraTurma;
    Procedure MontarGradeDisciplinas;
    Procedure InserirDisciplinas;
    function total_creditos : Currency;
    procedure perdoar_mensalidades(codigoaluno : Integer; parcela : Integer; anosemestre : Integer; turma : String; vencimento : TDateTime );
    Procedure DefinirTamanhoArray(Tamanho : Integer);
    { Private declarations }
  public
    { 100 é o número máximo de parcelas permitido }
    LIDiaVencto: integer;
    iIngressoPadrao : Integer;
    iAcaoDesconto : Integer;
    ArrayValores : Array of Currency;
    ArrayDescontos : Array of Currency;
    ArrayDescontosPlano : Array of Currency;
    ArrayDescontosExtra : Array of Currency;
    ArrayDescontosExtraPlano : Array of Currency;
    ArrayDatas : Array of TDateTime;
    ArrayParcelas : Array of Integer;
    ArrayCDMensalidade : Array of Integer;
    ArrayValorExtra :  Array of Currency;
    ArraySN_Credito :  ARRAY of Char;
    ArrayNr_Credito :  ARRAY of Currency;
    ArrayTipoParcela : ARRAY of Integer;
    ArrayValorCredito : Array of Currency;
    ArrayItemPlano : ARRAY of Integer;
    ArrayPlanoContas : ARRAY of Integer;
    ArrayDescricaoTipo : ARRAY of String;
    ArrayReciboImpresso : ARRAY of Boolean;
    lngPlano : Longint; { VARIAVEL PARA DESIGNAR PLANO DE DESCONTO }
    lngPlanoOpc : SmallInt; { VARIÁVEL PARA SABER SE DEVE APLICAR O DESCONTO COMO FIXO OU COMO PGTO EM DIA }
    serie : SmallInt;
    ManterDesconto : boolean;

    { Disciplinas Selecionadas }
    ArrayDisciplinas : Array of tDisc;
    iGradeCurso : Integer;
    property ObsPlanoDesconto: string read FSObsPlanoDesconto write FSObsPlanoDesconto;
  end;

var
  frmMatricular: TfrmMatricular;

implementation

uses uDM, Main, uRepRecibo, uRepBloquetos, uDinCh,
     uPlanosDesconto, uManutMens, uAluno, uMensalidades,
     uFSelecionarCurso, Math, uTableFields, MaskUtils, uMotivos, uPessoas, uClassMovimento,
     uFuncoesGerais, uImpMens, uUsuario;

{$R *.DFM}

procedure TfrmMatricular.btnF3Click(Sender: TObject);
begin
  { Botão Avançar }

  if Page.ActivePage = tabImprimir then Exit;

  podeMudar := True;
  Page.SelectNextPage( True );
end;



procedure TfrmMatricular.btnF2Click(Sender: TObject);
begin
  { Botão Voltar }

  if Page.ActivePage = tabMatricula then Exit;

  if Page.ActivePage = tabImprimir then Exit;

  PodeMudar := True;
  Page.SelectNextPage( False );
end;

procedure TfrmMatricular.btnFecharClick(Sender: TObject);
begin
  { Botão Fechar }
  Close;
end;

procedure TfrmMatricular.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { Teclas de Atalho }
  case Key of
    VK_F2  : btnF2Click( nil );
    VK_F3  : btnF3Click( nil );
    VK_F12 : btnFecharClick( nil );
    { Só na guia Vencimentos }
    VK_F5  : if Page.ActivePage = tabVencimento Then btnPlanosDescontoClick( nil );
    VK_F6  : if Page.ActivePage = tabVencimento Then btnExecutarPlanoClick( nil );
    { Só na guia Imprimir }
    VK_F7  : if Page.ActivePage = tabImprimir Then btnReciboClick( nil );
    VK_F8  : if Page.ActivePage = tabImprimir Then btnRequerimentoClick( nil );
    VK_F9  : if Page.ActivePage = tabImprimir Then btnBloquetoClick( nil );
    VK_F10 : if Page.ActivePage = tabImprimir Then btnContratoClick( nil );
    VK_F11 : if Page.ActivePage = tabImprimir Then btnConfiguracoesClick( nil );
  end;
end;

procedure TfrmMatricular.txtAnoKeyPress(Sender: TObject; var Key: Char);
begin
  { Enter no AnoSemestre }
  if Key = #13 then
  begin
    SelectNext( TWinControl( Sender ), True, True );
    FiltraTurma;
    Key := #0;
  end;
end;

procedure TfrmMatricular.FormShow(Sender: TObject);
var
  strAnoSem : String;
begin
  CheckBox1.OnClick := CheckBox1Click;

  iAcaoDesconto := 0;

  DM.tblInstituicoes.Close();
  DM.tblInstituicoes.Open();

  Label2.Visible := DM.UsaAnosemestre;
  txtAnoSemestre.Visible := DM.UsaAnosemestre;

  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Criar o formulário para baixar de mensalidade }
  if not PrincipalForm.ProcuraForm( TForm(frm_Mensa_Baixar) ) then
    Application.CreateForm( Tfrm_Mensa_Baixar, frm_Mensa_Baixar );

  Application.CreateForm(TfrmImpMens, frmImpMens);
  Application.CreateForm(TfrmRepRecibo, frmRepRecibo);

  strAnoSem := '';
  Screen.Cursor := crHourGlass;

  flgMensalidades := False;

  gerarDisciplinas := True;

  tblPlanos.Close;

  { A tabela de matrículas está no modo de inserção quando tenta uma rematricula, pelo form alunos }
  if (not tblMatriculas.Active) or
     (tblMatriculas.Active and (tblMatriculas.State = dsBrowse)) then
  Begin

        { Definir AnoSemestre Padrão }
        if ( FormatDateTime( 'mm', DataHoje ) >= '01' ) and ( FormatDateTime( 'mm', DataHoje ) <= '09' ) then
            strAnoSem := FormatDateTime( 'yyyy', DataHoje )
        else
            strAnoSem := FormatDateTime( 'yyyy', DataHoje + 365 );
        if ( ( FormatDateTime( 'mm', DataHoje ) >= '10' ) and  ( FormatDateTime( 'mm', DataHoje ) <= '12' ) ) or
            ( ( FormatDateTime( 'mm', DataHoje ) >= '01' ) and  ( FormatDateTime( 'mm', DataHoje ) <= '06' ) ) then
          strAnoSem := strAnoSem + '1'
        else
          strAnoSem := strAnoSem + '2';

        tblMatriculasAnoSemestre.AsString := strAnoSem;

  End;


  Page.ActivePage := tabMatricula;
  PodeMudar := False;

  if DM.UsaAnosemestre then
  begin
     txtAnoSemestre.SetFocus;
  end;
  EditDataMatricula.Enabled := True;

  FiltraTurma();

  lbMsg.Caption := 'Finalizando Matrícula...';

  Screen.Cursor := crDefault;
end;

procedure TfrmMatricular.grdDblClick(Sender: TObject);
begin
  { Avançar com duplo clique }
  btnF3Click( nil );
end;

procedure TfrmMatricular.PageChange(Sender: TObject);
var
  MyKey : Char;
  wYear, wMonth, wDay : Word;
begin
   { Mudança de Guias }

   if TPageControl( Sender ).ActivePage = tabDisc Then begin
     if tblTurmas.RecordCount = 0 then begin
        TPageControl( Sender ).ActivePage := tabMatricula;
        Abort;
     end;
   end;

  { Tem que usar o botão Avancar }
  if TPageControl( Sender ).ActivePage <> tabImprimir then
  begin
    btnF3.Enabled := True;
  end
  else
  begin
    btnF3.Enabled := False;
  end;
  MyKey := #13;

  if TPageControl( Sender ).ActivePage = tabMatricula then
  Begin
     txtAnoSemestre.SetFocus;
     gerarDisciplinas := True;
  End;
  
  if TPageControl( Sender ).ActivePage = tabDisc then
  begin

    if gerarDisciplinas then
      MontarGradeDisciplinas;

    gerarDisciplinas := False;

    // Ao seguir para a guia disciplinas, verificar se o aluno já tem matrícula nesta turma, neste semenstre.

    tblMatriculasRead.Close;
    tblMatriculasRead.SQL.Clear;
    tblMatriculasRead.SQL.Add( 'select * from Matriculas where' );
    tblMatriculasRead.SQL.Add( 'CodigoAluno = :CodigoAluno and' );
    tblMatriculasRead.SQL.Add( 'Turma = :Turma and' );
    tblMatriculasRead.SQL.Add( 'AnoSemestre = :AnoSemestre' );
    tblMatriculasRead.ParamByName('CodigoAluno').AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
    tblMatriculasRead.ParamByName('Turma').AsString := tblTurmasCodigo.AsString;
    tblMatriculasRead.ParamByName('AnoSemestre').AsInteger := tblTurmasAnoSemestre.AsInteger;
    tblMatriculasRead.Open;

    if not tblMatriculasRead.EOF  then
    begin

      TPageControl( Sender ).ActivePage := tabMatricula;
      Mensagem( 'O Aluno já possui uma matrícula nesta turma.' + CHR(13) +
                'Caso queira efetuar algum ajuste, utilize a Planilha de Matrículas.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
      Abort;

    end else begin

        // Verificar se o aluno tem uma matrícula no ano/semestre que está se matriculando

        tblMatriculasRead.Close;
        tblMatriculasRead.SQL.Clear;
        tblMatriculasRead.SQL.Add( 'select * from Matriculas where' );
        tblMatriculasRead.SQL.Add( 'CodigoAluno = :CodigoAluno and' );
        tblMatriculasRead.SQL.Add( 'AnoSemestre = :AnoSemestre' );
        tblMatriculasRead.ParamByName('CodigoAluno').AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
        tblMatriculasRead.ParamByName('AnoSemestre').AsInteger := tblTurmasAnoSemestre.AsInteger;
        tblMatriculasRead.Open;

        if not tblMatriculasRead.EOF then begin

           if Mensagem( 'O Aluno já possui uma matrícula em ' + txtAnoSemestre.Text +  ' na turma ' + tblMatriculasReadTurma.AsString + '.' + CHR(13) + CHR(13) +
                        'Deseja realmente efetuar uma nova matrícula em ' + txtAnoSemestre.Text + ' ?', Application.Title, MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL, Self.Handle) <> mrYes
           Then Begin
               TPageControl( Sender ).ActivePage := tabMatricula;
               Abort;
           end;
           
        end;

    end;

  end;

  if TPageControl( Sender ).ActivePage = tabPlano then
  begin
      // Verifica disponibilidade de vagas
      if (Length(ArrayDisciplinas) > 0) AND (not VerificaVagas) then
      begin
         TPageControl(Sender).ActivePageIndex := 1;
         Exit;
      end;
      tblPlanos.Close();
      tblPlanos.SQL.Clear();
      tblPlanos.SQL.Text :=
          ' SELECT * FROM PlanosPagamento WHERE ' +
          ' (Turma = :Turma or (Curso = :Curso and (Turma = '''' or Turma IS NULL))) and AnoSemestre = :AnoSemestre';
      tblPlanos.ParamByName('Turma').AsString := tblTurmasCodigo.AsString;
      tblPlanos.ParamByName('Curso').AsString := tblTurmasCurso.AsString;
      tblPlanos.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      // Esta parte do sql faz com que não apareça nenhum plano
      if tblTurmassn_usar_plano.AsInteger = 0 then
         tblPlanos.SQL.Add(' AND 1 <> 1 ');

      tblPlanos.Open();

      if tblPlanos.IsEmpty() then begin
         grd2.Visible := false;
         pnSemPlano.Visible := true;
      end
      else begin
         grd2.Visible := true;
         pnSemPlano.Visible := false;
         grd2.SetFocus;
      end;

  end;

  {Aba de vencimentos}
  if TPageControl( Sender ).ActivePage = tabVencimento then
  begin
    if (tblPlanos.IsEmpty()) OR ((tblPlanosParcelas.AsInteger = 0) AND (tblPlanosMatricula.AsCurrency = 0)) then begin
       Page.ActivePage := tabImprimir;
       { se não gerou mensalidades então está na hora né }
       if not flgMensalidades then btnExecutarPlanoClick( nil );
          chkList.Items := lst.Items;
       exit;
    end;

     pnAltera.Visible := False;

    lst.Top := 8;
    lst.Height := 185;

    { Montar as Mensalidades, na guia vencimentos }

    DefinirTamanhoArray(0);

    lst.Clear;
    chkList.Clear;

    try
       DecodeDate( tblPlanosApartir.AsDateTime, wYear, wMonth, wDay );
    except
       DecodeDate( DataHoje, wYear, wMonth, wDay );
    end;




    txtSempreDia.Text := IntToStr(wDay);
    txtDiaUtil.Text := IntToStr(wDay);


    

    try
       txtApartir.Text := FormatDateTime( 'dd/mm/yyyy', tblPlanosApartir.AsDateTime ) ;
    except
       txtApartir.Text := FormatDateTime( 'dd/mm/yyyy', DataHoje ) ;
    end;

    txtParcelas.Text := tblPlanosParcelas.AsString;

    if tblPlanossn_creditos.AsString = 'S' then begin
       Label16.Visible      := false;
       txtParcelas.Visible  := false;
       SpeedButton2.Visible := false;
    end;


    
    radPlano.Checked := True;

    if FBBloqVencto then
    begin
         txtSempreDia.Enabled := false;
         radUtil.Enabled := false;
         radPlano.Enabled := false;
         radSempre.Enabled := false;
         radSempre.Checked := true;
         txtDiaUtil.Enabled := false;
         Label4.Enabled := false;
         if LIDiaVencto > 0 then
         begin
            txtSempreDia.Text := qryBloqDataVenctonr_dia_vencimento.AsString;
            radSempre.Checked := true;
         end;
    end
    else if qryBloqDataVenctonr_dia_vencimento.AsInteger > 0 then
    begin
       txtSempreDia.Text := qryBloqDataVenctonr_dia_vencimento.AsString;
       radSempre.Checked := true;      
    end
    else
      radPlano.Checked := true;

    CalcularVencimento;


  end;

  if TPageControl( Sender ).ActivePage = tabImprimir then
  begin
    { se não gerou mensalidades então está na hora né }
    if not flgMensalidades then btnExecutarPlanoClick( nil );
    chkList.Items := lst.Items;
  end;


  { Verificar opções de Disciplinas }
   {
  if TPageControl( Sender ).ActivePage = tabDisc then
  Begin
      if (tblTurmassn_bloquear_vagas.AsInteger = 1) AND
         (tblTurmasqtd_matriculas.AsInteger >= tblTurmasVagas.AsInteger)
      then begin
         Mensagem('Atenção' + CHR(13) + CHR(13) +
         'Esta turma está configurada para receber no máximo ' + tblTurmasVagas.AsString + ' estudantes.' + CHR(13) +
         'Retorne a guia anterior e selecione outra Turma de Matrícula.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
         Page.ActivePageIndex := 0;
         exit;
      end;

      if gerarDisciplinas then
         MontarGradeDisciplinas;

      gerarDisciplinas := False;
  End;
  }


end;


{Retorna o dia de vencimento da mensalidad do aluno}
function TfrmMatricular.getDiaVencimentoAluno(
  const AICodigoAluno: Integer): Integer;
var
   qryGetDataVencimento : TUMZQuery;
begin

   DM.CriarConsulta(qryGetDataVencimento);

   try
      try
         with qryGetDataVencimento do
         begin
            SQL.Text := ' SELECT '+
                        '     nr_dia_vencimento  '+
                        ' FROM '+
                        '    pessoas as p '+
                        ' WHERE '+
                        '    p.cd_pessoa = :pCDPessoa ';
            ParamByName('pCDPessoa').AsInteger := AICodigoAluno;
            Open;
            if not EOF then
            begin
               Result:= FieldByName('nr_dia_vencimento').asInteger;
               exit;
            end;

         end;
      except on E: EDatabaseError do
         begin
            Result :=0;
            exit;
         end;
      end;
   finally
      qryGetDataVencimento.Free;
   end;
   Result:=0;
end;


procedure TfrmMatricular.grd2KeyPress(Sender: TObject; var Key: Char);
begin
  { Avançar na grade de Planos }
  if Key = #13 then
  begin
    btnF3Click( nil );
    Key := #0;
  end;
end;


procedure TfrmMatricular.txtDiaUtilKeyPress(Sender: TObject;
  var Key: Char);
var
  wYear, wMonth, wDay : Word;
begin
  { Enter no Campo Dia útil }
  if Key = #13 then
  begin
    try
       DecodeDate( StrToDate( txtApartir.Text ), wYear, wMonth, wDay );
    except
       DecodeDate( DataHoje, wYear, wMonth, wDay );
    end;

{    txtApartir.Text := FormatDateTime( 'dd/mm/yyyy', DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) ) );}

    txtApartir.SetFocus;
    txtAPartirKeyPress( txtApartir, Key );
    Key := #0;
  end;
end;

procedure TfrmMatricular.txtApartirKeyPress(Sender: TObject;
  var Key: Char);
begin
  { Enter no Campo a Partir de }
  if Key = #13 then
  begin
    CalcularVencimento;
    Key := #0;
  end;
end;

procedure TfrmMatricular.CalcularVencimento;
const
   S_DESCRICAO_PARCELA = 'PARCELA %.2d - %s - %8.2n';
var
  n, i, iTamArray : Byte;
  wDay, wMonth, wYear : Word;
  MyDay : TDateTime;
  nAux : Integer;
  cIndDesconto : Double;
  ParcelaZero : Boolean;
  iParcelasSelecionadas : Integer;
  nPar : Integer;
  dCreditosRestantes : double;
  dtBloqueio : TDateTime;
  qyTemp : TUMZQuery;
   LSVenctoParcAnterior, LSDescricao, LSDescAux: string;
   LWAno, LWMes, LWDia: Word;

   function GetDataVencto(const ADataVencto: TDateTime): TDateTime;
   var
      LWAnoAux, LWMesAux, LWDiaAux: Word;
   begin
      Result := ADataVencto;
      if (LSVenctoParcAnterior = '[VENCIMENTO=HOJE]') or (LSVenctoParcAnterior = '[VENCIMENTO=PLANO]') or (LSVenctoParcAnterior = '[VENCIMENTO=AMANHA]') then
      begin
         if FBBloqVencto or ((LIDiaVencto > 0) and radSempre.Checked) then
         begin
            DecodeDate(Result, LWAno, LWMes, LWDia);
            DecodeDate(DataHoje, LWAnoAux, LWMesAux, LWDiaAux);
            if (LWDia <> LIDiaVencto) or (LWMes < LWMesAux) then
            begin
               Result := DataValida(LWAno, LWMes, LIDiaVencto);
               if LSVenctoParcAnterior = '[VENCIMENTO=HOJE]' then begin
//                  while Result < DataHoje do   -- Quando usado esse parametro, o vencimento já está atrazado, então a data tem que ficar HOJE e não no dia selecionado.
//                     Result := IncMonth(Result, 1)
                    if Result < DataHoje then
                       Result := DataHoje

              end else if LSVenctoParcAnterior = '[VENCIMENTO=AMANHA]' then begin
//                  while Result <= DataHoje do
//                     Result := IncMonth(Result, 1);
                     if Result < DataHoje then
                        Result := DataHoje + 1;

              end;

            end;
         end;
      end;
   end;

begin
   LSVenctoParcAnterior := DM.variavel_parametro('financeiro_parcelas_anteriores');
   
  { Calcula os valores e vencimentos nos arrays }

  tblItensPagamento.Close();
  tblItensPagamento.Open();
  tblItensPagamento.First();

  try
    iParcelasSelecionadas := StrToInt(txtParcelas.Text);
  except
    iParcelasSelecionadas := tblPlanosParcelas.AsInteger;
  end;

  lngPlano := 0;
  lst.Clear;

  i := 0;
  iTamArray := 0;

  // Usar como data base inicial o A PARTIR DE....
  try
     DecodeDate( StrToDate( txtApartir.Text ), wYear, wMonth, wDay );
  except
     // Se não tiver tiver A PARTIR DE Selecionar a data de Hoje
     DecodeDate( DataHoje, wYear, wMonth, wDay );
  End;

  if radSempre.Checked then
  begin
    // Selecionar o Dia fixo do mês

    wDay := StrToInt( txtSempreDia.Text );

    n := 1;

  end;

//  if iParcelasSelecionadas = tblPlanosParcelas.AsInteger then begin

      dCreditosRestantes := total_creditos * tblPlanosParcelas.AsInteger;
      nPar := tblPlanosParcelas.AsInteger;

      // calcular todas as parcelas do plano, ou se o número de parcelas mudou, calcular somente as parcelas fixas.
      while not tblItensPagamento.Eof do
      begin
      if (iParcelasSelecionadas = tblPlanosParcelas.AsInteger) OR (tblItensPagamentosn_credito_parcela.AsString = 'F') then
      begin
          INC(iTamArray);
          i := iTamArray - 1;
          DefinirTamanhoArray(iTamArray);

          // Resgatar o índice de desconto para calcular proporcional
          if tblItensPagamentoValorBruto.AsCurrency > 0 then
             cIndDesconto := tblItensPagamentoValorDesconto.AsCurrency / tblItensPagamentoValorBruto.AsCurrency
          else
             cIndDesconto := 0;

          if radUtil.Checked then begin
              {MyDay := DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) );}
          end
          else if radSempre.Checked then begin
              MyDay := DataValida( wYear, wMonth, wDay );
          end
          else begin
              MyDay := DataValida( tblItensPagamentonr_ano.AsInteger, tblItensPagamentoMes.AsInteger, tblItensPagamentonr_dia.AsInteger);
          end;

          if (tblPlanossn_creditos.AsString[1] = 'S') AND (tblItensPagamentosn_credito_parcela.AsString[1] IN ['S', 'F']) then
          Begin  // Programação com Créditos

             ArrayValorCredito[i] := tblItensPagamentoValorBruto.AsCurrency / tblPlanosnr_creditos_base.AsCurrency;
             ArraySN_Credito[i] := tblItensPagamentosn_credito_parcela.AsString[1];

             if tblItensPagamentonr_creditos_minimos.AsInteger <> 0 then begin

                if tblItensPagamentosn_credito_parcela.AsString = 'S' then begin

                   if total_creditos < tblItensPagamentonr_creditos_minimos.AsInteger then begin
                      ArrayNr_Credito[i] := tblItensPagamentonr_creditos_minimos.AsInteger;
                      ArrayValores[i] := tblItensPagamentoValorBruto.Value / tblPlanosnr_creditos_base.AsInteger * tblItensPagamentonr_creditos_minimos.AsInteger;
                   End else Begin
                      ArrayNr_Credito[i] := total_creditos;
                      ArrayValores[i] := tblItensPagamentoValorBruto.Value / tblPlanosnr_creditos_base.AsInteger * total_creditos;
                   End;

                   dCreditosRestantes := dCreditosRestantes -  total_creditos;

                end else begin

                   ArrayNr_Credito[i] := tblItensPagamentonr_creditos_minimos.AsInteger;
                   ArrayValores[i] := tblItensPagamentoValorBruto.Value / tblPlanosnr_creditos_base.AsInteger * tblItensPagamentonr_creditos_minimos.AsInteger;

                   dCreditosRestantes := dCreditosRestantes -  tblItensPagamentonr_creditos_minimos.AsInteger

                end

             end else begin

                ArrayNr_Credito[i] := dCreditosRestantes / nPar;
                ArrayValores[i] := tblItensPagamentoValorBruto.Value / tblPlanosnr_creditos_base.AsInteger * ArrayNr_Credito[i];

                dCreditosRestantes := dCreditosRestantes - ArrayNr_Credito[i];

             end;

             nPar := nPar - 1;

             // O desconto é calculado proporcionalmente ao novo valor bruto, conforme créditos
             ArrayDescontos[i] := ArrayValores[i] * cIndDesconto;

             ArrayDescontosPlano[i] := (tblItensPagamentoValorDesconto.Value / tblItensPagamentoValorBruto.Value) * ArrayValores[i];
             ArrayDescontosExtra[i] := (tblItensPagamentoDescontoExtra.Value / tblItensPagamentoValorBruto.Value) * ArrayValores[i];
             ArrayDescontosExtraPlano[i] := tblItensPagamentoDescontoExtra.Value;
             ArrayValorExtra[i] := tblItensPagamentoValorExtra.Value;

          End
          else  { Programação Sem Créditos }
          Begin
             ArrayValorCredito[i] := 0;
             ArraySN_Credito[i] := 'N';
             ArrayNr_Credito[i] := 0;
             ArrayValores[i] := tblItensPagamentoValorBruto.Value;
             ArrayDescontos[i] := tblItensPagamentoValorDesconto.Value;
             ArrayDescontosPlano[i] := tblItensPagamentoValorDesconto.Value;
             ArrayDescontosExtra[i] := tblItensPagamentoDescontoExtra.Value;
             ArrayDescontosExtraPlano[i] := tblItensPagamentoDescontoExtra.Value;
             ArrayValorExtra[i] := tblItensPagamentoValorExtra.Value;
          End;

          // Verificar data de vencimento
          ParcelaZero := False;
          if tblItensPagamentonr_dia.AsInteger = 0 then begin
            ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;
            ArrayDatas[i] := DataHoje + tblPlanosnr_dias_parczero.AsInteger;
            ParcelaZero := True;
          end
          else
          if MyDay < DataHoje then Begin

            { O vencimento ficará menor q a data de hoje, verificar se deve ser criada a parcela }
            if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[VENCIMENTO=PLANO]' then begin
               { Mandar data do Plano, mesmo em Atraso }
               ArrayDatas[i] := MyDay;

               ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;
               ArrayReciboImpresso[i] := false;
            end
            else
            if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[PERDOAR]' then Begin
                 { Perdoar a Mensalidade }
                 ArrayDatas[i] := DataHoje;
                 ArrayParcelas[i] := - tblItensPagamentoParcela.AsInteger;;
                 ArrayReciboImpresso[i] := true;
            End
            else
            if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[NAO_GERAR]' then Begin { NÃO GERAR AS PARCELAS }
                  ArrayDatas[i] := DataHoje;
                  ArrayParcelas[i] := -99;
                  ArrayReciboImpresso[i] := True;
            End
            else
            if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[VENCIMENTO=AMANHA]' then  begin //  '[VENCIMENTO=AMANHA]'
               { Colocar data de Hoje, para não deixar em Atraso }
               ArrayDatas[i] := DataHoje + 1;

               Case DayOfWeek( ArrayDatas[i] ) of
                  1 : ArrayDatas[i] := ArrayDatas[i] + 1;
                  7 : ArrayDatas[i] := ArrayDatas[i] + 2;
               end;

               ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;
               ArrayReciboImpresso[i] := false;
            end

            else begin //  '[VENCIMENTO=HOJE]'
               { Colocar data de Hoje, para não deixar em Atraso }
               ArrayDatas[i] := DataHoje;

               ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;
               ArrayReciboImpresso[i] := false;
            end


          End
          else
          begin
             { Data do Plano }
             ArrayDatas[i] := MyDay;

             ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;
             ArrayReciboImpresso[i] := False;
          end;

          // Verificar Bloqueio de Parcela
          // Se a data que está sendo criada está bloqueada, alterar o vencimento para
          // um dia após o bloqueio

    //      dtBloqueio := DM.DataBloqueioFinanceiro();

          dtBloqueio := 0;

          if ( (dtBloqueio <> 0) AND (ArrayDatas[i] <= dtBloqueio) ) then begin

               ArrayDatas[i] := dtBloqueio + 1;

          end;

          ArrayItemPlano[i] := tblItensPagamentocd_item_plano.AsInteger;
          ArrayTipoParcela[i] := tblItensPagamentocd_tipo_parcela.AsInteger;
          ArrayPlanoContas[i] := tblItensPagamentocd_conta.AsInteger;
          ArrayDescricaoTipo[i] := tblItensPagamentods_tipo_titulo.AsString;


          if not ParcelaZero then begin

             if radUtil.Checked then
             Begin
                MyDay := MyDay + 31;

                DecodeDate( MyDay, wYear, wMonth, wDay );
                {MyDay := DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) );}
             end
             else
             Begin

                wMonth := wMonth + 1;
                if wMonth = 13 then
                begin
                  wMonth := 1;
                  wYear := wYear + 1;
                end;
                MyDay := DataValida( wYear, wMonth, wDay );

             End;

          end;
          // ArrayDatas[i] := GetDataVencto(ArrayDatas[i]);
          // Claudionor: Desativei a chamada dessa função, pois a data já estava sendo calculada corretamente acima,
          // e a função estava calculando datas erradas quano utilizado o parametro [VENCIMENTO=
                  
          begin
             if LSVenctoParcAnterior = '[PERDOAR]' then
                LSDescAux := 'ISENTADA '
             else if LSVenctoParcAnterior = '[NAO_GERAR]' then
                LSDescAux := 'ELIMINADA '
             else
                LSDescAux := FormatDateTime('dd/mm/yyyy', ArrayDatas[i]);
             LSDescricao := Format(S_DESCRICAO_PARCELA, [tblItensPagamentoParcela.AsInteger, LSDescAux, (ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i])]);
             lst.Items.Add(LSDescricao);
          end;
      end;
      tblItensPagamento.Next;
      end;
  // end
  // else begin  // Mudou número de parcelas

  if iParcelasSelecionadas <> tblPlanosParcelas.AsInteger then begin


  // Primeiro, SOMAR OS VALORES por TIPO DE TITULO, SOMENTE DAS PARCELAS com sn_credito <> 'F'

  Dm.CriarConsulta(qyTemp);
  qyTemp.SQL.Text :=
    ' SELECT i.cd_tipo_parcela '+
    '      , t.cd_conta ' +
    '      , t.ds_tipo_titulo '  +
    '      , SUM(i.valorbruto) as bruto ' +
    '      , SUM(i.valordesconto) as desconto ' +
    '   FROM itensplanospagamento i ' +
    '  INNER JOIN fin_tipos_titulo t ON (i.cd_tipo_parcela = t.cd_tipo_titulo AND i.cd_coligada = t.cd_coligada) ' +
    '  WHERE IFNULL(i.sn_credito_parcela,"N") <> "F" '+
    '    AND i.codigoplano =:CODIGOPLANO ' +
    '  GROUP BY i.cd_tipo_parcela, t.cd_conta, t.ds_tipo_titulo ';
  qyTemp.ParamByName('CODIGOPLANO').AsInteger := tblPlanosCodigo.AsInteger;
  qyTemp.Open();

  tblItensPagamento.Last();

  while not qyTemp.EOF DO begin

  for nPar := 1 to iParcelasSelecionadas  do begin

      INC(iTamArray);
      i := iTamArray - 1;
      DefinirTamanhoArray(iTamArray);

      if radUtil.Checked then begin
          {MyDay := DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) );}
      end
      else if radSempre.Checked then begin
          MyDay := DataValida( wYear, wMonth, wDay );
      end
      else begin
          MyDay := Dm.DataAtual();
      end;

      if tblPlanossn_creditos.AsString = 'S' then begin

         ArraySN_Credito[i] := 'S';
         ArrayValores[i] := (tblPlanosValorCobrado.AsCurrency / tblPlanosnr_creditos_base.AsCurrency * tblPlanosParcelas.AsInteger * total_creditos) / iParcelasSelecionadas;
      end else begin

         ArraySN_Credito[i] := 'N';
         ArrayValores[i] := (qyTemp.FieldByName('bruto').AsCurrency) / iParcelasSelecionadas;

      end;

      ArrayNr_Credito[i] := 0;

      ArrayDescontos[i] := (qyTemp.FieldByName('desconto').AsCurrency) / iParcelasSelecionadas;
      ArrayDescontosPlano[i] := (qyTemp.FieldByName('desconto').AsCurrency) / iParcelasSelecionadas;

      ArrayDescontosExtra[i] := 0;
      ArrayDescontosExtraPlano[i] := 0;
      ArrayValorExtra[i] := 0;

      // Verificar data de vencimento
      ParcelaZero := False;

     { O vencimento ficará menor q a data de hoje, verificar se deve ser criada a parcela }
     { Mandar data do Plano, mesmo em Atraso }
     ArrayDatas[i] := MyDay;
     ArrayParcelas[i] := nPar;
     ArrayReciboImpresso[i] := false;

      ArrayItemPlano[i] := 0;
      ArrayTipoParcela[i] := qyTemp.FieldByName('cd_tipo_parcela').AsInteger;
      ArrayPlanoContas[i] := qyTemp.FieldByName('cd_conta').AsInteger;
      ArrayDescricaoTipo[i] := qyTemp.FieldByName('ds_tipo_titulo').AsString;

      if not ParcelaZero then begin

         if radUtil.Checked then
         Begin
            MyDay := MyDay + 31;

            DecodeDate( MyDay, wYear, wMonth, wDay );
            {MyDay := DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) );}
         end
         else
         Begin

            wMonth := wMonth + 1;
            if wMonth = 13 then
            begin
              wMonth := 1;
              wYear := wYear + 1;
            end;
            MyDay := DataValida( wYear, wMonth, wDay );

         End;

      end;
      ArrayDatas[i] := GetDataVencto(ArrayDatas[i]);
      begin
         LSDescAux := FormatDateTime('dd/mm/yyyy', ArrayDatas[i]);
         LSDescricao := Format(S_DESCRICAO_PARCELA, [nPar, LSDescAux, (ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i])]);
         lst.Items.Add(LSDescricao);
       end;

  end; //For

  qyTemp.Next();
  end; // While

  end;

end;



procedure TfrmMatricular.GerarMensalidades;
var
  n : Byte;
  movimento : TMovimento;
  chaves : String;

  iMensalidade : Integer;

  iSituacao : Integer;
  qAtualiza : TUMZQuery;
  dt_competencia : TDateTime;
begin

  { Gera as mensalidades na tabela mensalidades }

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger :=  tblMatriculasAnoSemestre.AsInteger;
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  DM.tblDeptoCursoTurma.Open;

  if DM.variavel_parametro('matriculas_situacao_padrao') <> '' Then begin
     iSituacao := StrToInt(DM.variavel_parametro('matriculas_situacao_padrao'))
  end else begin
     iSituacao :=  2;
  end;


{  if tblPlanosTaxaApostila.Value = 0 then GeraTaxa; { GERA TAXA DE MATRICULA }
  for n := 0 to lst.Items.Count - 1 {tblPlanosParcelas.AsInteger} do
  begin

    if ArrayParcelas[n] <> -99 then
    Begin

       dt_competencia := ArrayDatas[n];
       
       if dt_competencia < DataHoje then begin

          dt_competencia := DataHoje;

       end;

       if dt_competencia < tblPlanosApartir.AsDateTime then begin

          dt_competencia := tblPlanosApartir.AsDateTime;

       end;
    
       iMensalidade :=

       DM.GerarMensalidade(
          frm_Alunos.tblPessoacd_pessoa.AsInteger,
          ABS(ArrayParcelas[n]),
          tblMatriculasTurma.AsString,
          RoundFloat( ArrayValores[n], 2 ),
          0,
          tblMatriculasAnoSemestre.AsInteger,
          ArrayDatas[n],
          dt_competencia,
          iSituacao,
          DM.tblDeptoCursoTurmaCurso.AsString,
          DM.tblDeptoCursoTurmaDepto.AsInteger,
          0,
          -1,
          ArrayDescontos[n],
          RoundFloat( ArrayNr_Credito[n], 5 ),
          ArrayDescricaoTipo[n],
          ArrayTipoParcela[n],
          ArrayPlanoContas[n],
          tblTurmascd_centro.AsInteger,
          ArrayDescontosExtra[n],
          ArrayValorExtra[n],
          ArraySN_Credito[n],
          ArrayValorCredito[n],
          ArrayItemPlano[n],
          1,
          0,
          0,
          tblTurmasCD_COLIGADA.AsInteger  // Acao Padrão - Mensalidade Gerada pela Matricula
       );


       ArrayCDMensalidade[n] := iMensalidade;

        // Log

       chaves := FillString(tblMatriculasCodigoAluno.AsString, alRight, '0', 10, true ) + ';' +
                   tblMatriculasAnoSemestre.AsString + ';' + tblMatriculasTurma.AsString + ';' +
                   IntToStr(ABS(ArrayParcelas[n])) + ';' +
                   FormatDateTime('yyyy-mm-dd',ArrayDatas[n]) + ';';

       DM.setLog(2013, 'inclusao', chaves, tblTurmascd_coligada.AsInteger, 'Parcela gerada pela matrícula (NN = ' + qryInsert.ParamByName('NossoNumero').AsString +  ')');


       // Gerar Movimentação do desconto extra

       if ArrayDescontosExtra[n] > 0 then begin

          Movimento := TMovimento.create;
          movimento.Observacao := Self.FSObsPlanoDesconto;
          movimento.TipoDeAcao      := BaixarporDesconto;
          movimento.CodigoTitulo    := iMensalidade;

          if iAcaoDesconto = 0 then begin
             iAcaoDesconto := DM.BuscarCodigoAcaoPadrao( 11 );
          end;

          movimento.CodAcao         := iAcaoDesconto;
          movimento.ValorMovimento  := ArrayDescontosExtra[n];


          movimento.RegistrarMovimentacaoCR( 0 );

          if (RoundFloat( ArrayDescontosExtra[n],2) >= RoundFloat( ArrayValores[n], 2 )) then begin

             Dm.CriarConsulta(qAtualiza);
             with qAtualiza do begin

                  Close;
                  SQL.Clear;
                  SQL.Add( 'UPDATE mensalidades                           ' );
                  SQL.Add(' SET datapagamento = :DtPagamento, valordesconto = 0 ');

                  if ( (DM.DataAtual() < ArrayDatas[n]) OR
                        ( Dm.variavel_parametro('mensalidades_data_baixa') = '[VENCIMENTO]' ) ) AND
                        ( (Dm.variavel_parametro('mensalidades_data_baixa') <> '[BAIXA]') AND
                          (Dm.variavel_parametro('mensalidades_data_baixa') <> '[ATUAL]') )
                     then
                        ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',ArrayDatas[n])
                     else
                        ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',DM.DataAtual());

                  SQL.Add(' WHERE cd_mensalidade = :CdMensalidade ' );
                  ParamByName('CdMensalidade').AsInteger := iMensalidade;
                  ExecSQL();
             end;

             FreeAndNil(qAtualiza);
          end;

       end;

       FreeAndNil( movimento );

       if ArrayParcelas[n] < 0 then
          perdoar_mensalidades(tblMatriculasCodigoAluno.AsInteger, ABS(ArrayParcelas[n]), tblMatriculasAnoSemestre.AsInteger, tblMatriculasTurma.AsString, ArrayDatas[n]);

    end;

 end;

end;

procedure TfrmMatricular.btnExecutarPlanoClick(Sender: TObject);
var
  MyKey : Char;
  n : Byte;
  flg : Boolean;

begin

  { Aplica o Plano de Desconto Selecionado }

  MyKey := #13;

  if not tblPlanos.IsEmpty()  then begin
  // Existem parcelas a serem geradas
     flg := False;
     for n := Low( ArrayDescontosExtra ) to High( ArrayDescontosExtra ) do begin
       if RoundFloat( ArrayDescontosExtra[n], 2 ) <> 0 then begin
          flg := True;
          Break;
       end;
     end;

     if not flg then begin
    { Verificar se tem Plano de Desconto Programado para o Aluno }

       DM.tblDeptoCursoTurma.Close;
       DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger :=  tblMatriculasAnoSemestre.AsInteger;
       DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := tblTurmasCodigo.AsString;
       DM.tblDeptoCursoTurma.Open;

       tblPlanoDesc.Close;
       tblPlanoDesc.SQL.Clear;
       tblPlanoDesc.SQL.Text :=
         ' SELECT pd.cd_tipo_titulo, pd.vl_percentual, p.nm_pessoa, d.*, de.descricao From pessoas_descontos pd ' +
         ' INNER JOIN pessoas p ON (pd.cd_pessoa = p.cd_pessoa) ' +
         ' INNER JOIN planosdesconto d ON (pd.cd_desconto = d.codigo) ' +
         ' INNER JOIN departamentos de ON (pd.cd_depto = de.codigo) ' +
         ' WHERE pd.cd_pessoa = :cd_pessoa AND pd.cd_depto = :cd_depto '+
         ' AND dt_inicio <= :data1 AND dt_fim >= :data2 ' +
         ' AND pd.cd_pessoa_indicada = 0  ';

       tblPlanoDesc.ParamByName('cd_pessoa').AsInteger := tblMatriculasCodigoAluno.AsInteger;
       tblPlanoDesc.ParamByName('cd_depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
       tblPlanoDesc.ParamByName('data1').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual);
       tblPlanoDesc.ParamByName('data2').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual);

       tblPlanoDesc.Open;

       if not tblPlanoDesc.IsEmpty Then begin

           { Neste ponto. temos o desconto programado do aluno. Montar o formulário de Planos de Desconto }

          if Mensagem( 'O aluno tem o seguinte plano de desconto programado: ' + CHR(13) +
          tblPlanoDesc.FieldByName('descricao').AsString + ': ' +
          FloatToStrF(tblPlanoDesc.FieldByName('vl_percentual').AsCurrency, ffNumber, 7, 2) + ' %' + CHR(13) + 'Deseja aplicar ?', Application.Title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = ID_YES then
          begin
            	 btnPlanosDescontoClick( nil );
          end;

       end;

     end;

   end;



  if Mensagem( 'Deseja registrar a Matrícula ?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then begin


    Screen.Cursor := crHourGlass;
    tblMatriculasCodigoAluno.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
    tblMatriculasTurma.AsString := tblTurmasCodigo.AsString;
    tblMatriculasPlanoPagamento.AsInteger := tblPlanosCodigo.AsInteger;

    if DM.variavel_parametro('matriculas_situacao_padrao') <> '' Then
       tblMatriculasSituacao.AsInteger := StrToInt(DM.variavel_parametro('matriculas_situacao_padrao'))
    else
       tblMatriculasSituacao.AsInteger := 1; { 1 - EM CURSO }

    tblMatriculasCurso.AsString := tblTurmasCurso.AsString;
    tblMatriculas.Post;



    // Gravar matrícula no curso;

    if not tblPlanos.IsEmpty() then begin
       GerarMensalidades;
       btnRecibo.Enabled := True;
       btnBloqueto.Enabled := True;
    end
    else begin
       btnRecibo.Enabled := False;
       btnBloqueto.Enabled := False;
    end;

    InserirDisciplinas;

    Screen.Cursor := crDefault;
    flgMensalidades := True;
    btnF3Click( nil );

    { Atualizar a Documentação }

    DM.AtualizaDocumentacao(tblMatriculasCodigoAluno.AsInteger, tblMatriculasCurso.AsString);

    // Tentar ativar a matrícula do aluno

    Dm.Ativar_Matricula(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger);

    if DM.variavel_parametro('academico_historico_series_inserir') = 'S' then
       DM.Gerar_Series_Conclusao(tblMatriculasCodigoAluno.AsInteger, tblMatriculasCurso.AsString, tblMatriculasAnoSemestre.AsInteger);

    lbMsg.Caption := 'Matrícula concluída com sucesso.';

  end
  else
  begin
    tblMatriculas.Cancel;
    Close;
  end;
end;

procedure TfrmMatricular.btnReciboClick(Sender: TObject);
var
  sFormulaSelecao: string;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   if not DM.UsuarioLogado.TemPermissao( 2012, npAcesso, True ) then Exit;

   qCaixaDepto.Close;
   qCaixaDepto.SQL.Clear;
   qCaixaDepto.SQL.Add('select d.cd_caixa from');
   qCaixaDepto.SQL.Add('departamentos d');
   qCaixaDepto.SQL.Add('where d.codigo = :depto ');
   qCaixaDepto.ParamByName('depto').AsInteger := tblTurmasDepto.AsInteger;
   qCaixaDepto.Open;

   DM.tblControle.Close;
   DM.tblControle.ParamByName('Situacao').AsString := 'A';
   Dm.tblControle.ParamByName('codcaixadepto').AsInteger := qCaixaDepto.FieldByNAme('cd_caixa').AsInteger;
   DM.tblControle.Open;

   { Faz a baixa da mensalidade e impressão de recibos }

   if chkList.ItemIndex = -1 then
   begin
     Mensagem( 'Selecione uma parcela para que seja impresso o recibo.', Application.Title,
      MB_OK + MB_ICONSTOP, Handle);
     Exit;
   end;

   Screen.Cursor := crHourGlass;
   Application.CreateForm(TfrmRepRecibo, frmRepRecibo);

   with frmRepRecibo do begin

    tblMensalidades.Close;
    tblMensalidades.ParamByName('cd_mensalidade').AsInteger := ArrayCDMensalidade[chkList.ItemIndex];
    tblMensalidades.Open;

    if not ArrayReciboImpresso[chkList.ItemIndex] then begin

      frmDinCh.AlunoAtual := tblMensalidadesCodigoAluno.AsInteger;

      frm_Mensa_Baixar.iConta := qCaixaDepto.FieldByNAme('cd_caixa').AsInteger;

      frm_Mensa_Baixar.lngCodigoAluno := frm_Alunos.tblPessoacd_pessoa.AsInteger;
      frm_Mensa_Baixar.intParcela := ArrayParcelas[chkList.ItemIndex];
      frm_Mensa_Baixar.datVencimento := ArrayDatas[chkList.ItemIndex];
      frm_Mensa_Baixar.strTurma := tblMatriculasTurma.AsString;
      frm_Mensa_Baixar.strAluno := frm_Alunos.tblPessoanm_pessoa.AsString;
      frm_Mensa_Baixar.strNossoNumero := tblMensalidadesNossoNumero.AsString;
      frm_mensa_baixar.iCodigoMensalidade := tblMensalidadescd_mensalidade.AsInteger;

      frmDinCh.AlunoAtual := tblMensalidadesCodigoAluno.AsInteger;

      frm_Mensa_Baixar.iConta := qCaixaDepto.FieldByNAme('cd_caixa').AsInteger; // DM.tblControlecd_conta_banco.AsInteger;

      if frm_Mensa_Baixar.ShowModal = mrCancel then begin
         Mensagem( 'Operação cancelada.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
         if tblMensalidades.State in [dsInsert, dsEdit] then tblMensalidades.Cancel;
         Screen.Cursor := crDefault;
         Exit;
      end Else begin
         Dm.Ativar_Matricula(tblMensalidadesCodigoAluno.AsInteger, tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger);
      end;

{
       if (DM.variavel_parametro('financeiro_qtd_autenticacao_baixa') <> '') AND
          (DM.variavel_parametro('financeiro_qtd_autenticacao_baixa') <> '-1')
       then
          AutenticarMensalidade;
}

   ArrayReciboImpresso[chkList.ItemIndex] := True;

    end;

    if DM.variavel_parametro('mensalidades_recibo_tipo') = 'DOS' then begin
       frmImpMens.ImprimirReciboDOS(frmRepRecibo.tblMensalidadescd_mensalidade.AsString);

    end else begin

        { Imprimir o Recibo diretamente }
        oRecibo := TFinReciboManager.Create(frmRepRecibo.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
        oRecibo.imprimirRecibo();

        sFormulaSelecao := '{mensalidades.cd_mensalidade} = ' + IntToStr(ArrayCDMensalidade[chkList.ItemIndex]);

        infoRelatorio := PrincipalForm.GetInfoRpt('relatorio_padrao_recibo');
        sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

        PodeExportar := True;
        if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
           PodeExportar := False;
           
        //imprime recibo
        if not PrincipalForm.ImprimeRpt(Self, sNomeRelatorio , -1,  sFormulaSelecao, '',nil,nil,nil,nil,False,False,nil,PodeExportar) then begin
          Mensagem('Não foi possível imprimir o recibo de pagamento.', '', mrOk, Handle);
        end;
    end;



  end;
  Screen.Cursor := crDefault;

  FreeAndNil( frmRepRecibo );
end;

procedure TfrmMatricular.btnContratoClick(Sender: TObject);
var
  sAux: string;
  iCopias: Integer;
begin

  { Impressão de Contrato }

  Screen.Cursor := crHourGlass;

  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS  C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  DM.tblCursosTurma.Open;

  if DM.tblCursosTurmaDS_CONTRATO.AsString = '' then
  begin
    Mensagem( 'Este curso não possui contrato formulado.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
    Exit;
  end;

  sAux := '{Matriculas.CodigoAluno} = ' + frm_Alunos.tblPessoacd_pessoa.AsString + ' and ';
  sAux := sAux + '{Matriculas.AnoSemestre} = ' + tblMatriculasAnoSemestre.AsString + ' and ';
  sAux := sAux + '{Matriculas.Turma} = ' + QuotedStr(tblMatriculasTurma.AsString) + '';

  try
    iCopias := StrToInt(DM.variavel_parametro('matriculas_contrato_nro_copias'));
  except
    iCopias := 1;
  end;

  PrincipalForm.Rel.PrintOptions.Copies := iCopias;
  PrincipalForm.ImprimeRpt(Self, DM.tblCursosTurmaDS_CONTRATO.AsString, -1, sAux, '', nil,nil,nil,nil,False,False,nil,True);
  PrincipalForm.Rel.PrintOptions.Copies := 1;

  Screen.Cursor := crDefault;
  PrincipalForm.pnlMsg.Caption := '';
end;

procedure TfrmMatricular.btnRequerimentoClick(Sender: TObject);
var
  sAux: string;
  iCopias: Integer;
begin

  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  DM.tblCursosTurma.Open;

  { Impressão do Requerimento de Matrículas }

  Screen.Cursor := crHourGlass;

  if DM.tblCursosTurmaDS_REQUERIMENTO.AsString <> '' then
  Begin
    { Imprimir o Requerimento diretamente }
     //procura o numero de copias
     try
       iCopias := StrToInt(DM.variavel_parametro('matriculas_requerimento_nro_copias'));
     except
       iCopias := 1;
     end;
     PrincipalForm.Rel.PrintOptions.Copies := iCopias;
     sAux := ' {Matriculas.AnoSemestre} = ' + tblMatriculasAnoSemestre.AsString + ' and ';
     sAux := sAux + ' {Matriculas.Turma} = ' + QuotedStr(tblMatriculasTurma.AsString) + ' and  ';
     sAux := sAux + ' {Matriculas.CodigoAluno} = ' + frm_Alunos.tblPessoacd_pessoa.AsString;

     PrincipalForm.ImprimeRpt(Self, DM.tblCursosTurmaDS_REQUERIMENTO.AsString, -1, sAux, '',nil,nil,nil,nil,False,False,nil,True );
     //define 1 novamente
     PrincipalForm.Rel.PrintOptions.Copies := 1;
  End
  Else
  begin
    Mensagem( 'Este curso não possui requerimento formulado.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
    Exit;
  end;
 

  Screen.Cursor := crDefault;

end;

procedure TfrmMatricular.btnBloquetoClick(Sender: TObject);
Var
   slAux: TStringList;
   sParcelas : String;
   iCont : Integer;
   Selecionou : Boolean;
   sFiltroAux : String;
   bAgrupado : Boolean;
   sContaImpressao : String;
   sParcelasFiltro : String;
   sNomeRelatorio: String;
begin
  { Impressão do Bloqueto }

  // Definir as parcelas que serão utilizadas para impressão do boleto;

  Selecionou := False;

  sParcelas := ' -1 ';
  sParcelasFiltro := ' ( m.parcela=-1 ';
  For iCont := 0 TO chkList.Items.Count -1 do begin
     if chkList.Checked[iCont] then begin
        sParcelas := sParcelas + ', ' + IntToStr(ABS(ArrayParcelas[iCont]));
        sParcelasFiltro := sParcelasFiltro + ' OR m.parcela=' + IntToStr(ABS(ArrayParcelas[iCont]));
        Selecionou := True;
     end;
  end;
  sParcelasFiltro := sParcelasFiltro + ' )';

  Application.CreateForm( TfrmRepBloquetos, frmRepBloquetos );

  if not Selecionou then begin
    Mensagem( 'Selecione as parcelas que deseja imprimir os boletos.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
    Exit;
  end;

  sContaImpressao := IntToStr(Dm.GetContaBoleto( DM.tblDeptoCursoTurmaDepto.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger ) ) + '=' + tblTurmascd_coligada.AsString;

  Screen.Cursor := crHourGlass;

  sFiltroAux := ' (m.codigoaluno = ' + tblMatriculasCodigoAluno.AsString + ') and  ';
  sFiltroAux := sFiltroAux + ' (m.parcela IN (' + sParcelas  + ')) and ';
  sFiltroAux := sFiltroAux + ' (m.turma = ' + QuotedStr(tblMatriculasTurma.AsString) + ') ';

  bAgrupado := DM.isTrue(DM.variavel_parametro('financeiro_boletos_agrupados'));

  if not frmRepBloquetos.PrepararBloquetosParaImpressao(sFiltroAux, bAgrupado,sContaImpressao) then begin
      Exit;
  end;

  frmRepBloquetos.tblBloquetos.First();

  while not frmRepBloquetos.tblBloquetos.Eof do begin
        DM.FazAcaoRemessa(arImpBoleto, frmRepBloquetos.tblBloquetos.FieldByName('cd_mensalidade').AsInteger);
        frmRepBloquetos.tblBloquetos.Next();
  end;

  frmRepBloquetos.tblBloquetos.First();

  slAux := TStringList.Create();

  slAux.Add( ' {fin_cadastro_contas.sn_ativa} = "S" and ');
  slAux.Add( ' {Mensalidades.codigoaluno} = ' + frm_Alunos.tblPessoacd_pessoa.AsString + ' and ');
  slAux.Add( ' {Mensalidades.parcela} in ['+ sParcelas +'] and ');
  slAux.Add( ' {Mensalidades.turma} = ' + QuotedStr(tblMatriculasTurma.AsString) + ' and ' );
  slAux.Add( ' {Mensalidades.situacao} in [2, 10]' );

  sNomeRelatorio := DM.NomeDoBoleto(DM.tblDeptoCursoTurmaDepto.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger );

  PrincipalForm.ImprimeRpt(Self,sNomeRelatorio , -1, slAux.Text,'',nil,nil,nil,nil,False,False,nil);

  Screen.Cursor := crDefault;

  FreeAndNil( frmRepBloquetos );
  FreeAndNil( slAux );
end;

procedure TfrmMatricular.grd2DblClick(Sender: TObject);
begin
  { Avançar }
  btnF3Click( nil );
end;

procedure TfrmMatricular.txtSempreDiaChange(Sender: TObject);
var
   I: integer;
begin
   try
      I := StrToInt(txtSempreDia.Text);
   except
      on E: EConvertError do
         I := LIDiaVencto;
   end;
   LIDiaVencto := I;
end;

procedure TfrmMatricular.txtSempreDiaEnter(Sender: TObject);
begin
  radSempre.Checked := True;
end;

procedure TfrmMatricular.radSempreClick(Sender: TObject);
begin
   if txtSempreDia.Enabled then
      if Page.ActivePage = tabVencimento then
         txtSempreDia.SetFocus;
   if Page.ActivePage = tabVencimento then
      CalcularVencimento;
end;

procedure TfrmMatricular.radUtilClick(Sender: TObject);
begin
  txtDiaUtil.SetFocus;
  CalcularVencimento;
end;

procedure TfrmMatricular.txtDiaUtilEnter(Sender: TObject);
begin
  radUtil.Checked := True;
end;

procedure TfrmMatricular.txtSempreDiaKeyPress(Sender: TObject;
  var Key: Char);
var
  wYear, wMonth, wDay : Word;
begin
  if Key = #13 then
  begin
    DecodeDate( tblPlanosApartir.AsDateTime, wYear, wMonth, wDay );
    case DayOfWeek( wDay ) of
      1 : wDay := wDay + 1;
      7 : wDay := wDay + 2;
    end;
    txtApartir.Text := FormatDateTime( 'dd/mm/yyyy', DataValida( wYear, wMonth, wDay ));
    txtApartir.SetFocus;
    txtAPartirKeyPress( txtApartir, Key );
    Key := #0;
  end;
end;

{ Verifica a quantidade de vagas disponibilizadas para a turma/disciplina e a
  quantidade de vagas preenchidas para definir se a turma/disicplina ainda
  possui vagas disponíveis. A verificação é efetuada somente quando a flag que
  habilita o uso de limite de vagas por turma estiver habilitada.
}
function TfrmMatricular.VerificaVagas: boolean;
const
   S_SQL_LOTACAO_ORACLE =
      'SELECT '+
         'fi.anosemestre nr_anosemestre,'+
         'fi.turma cd_turma,'+
         'fi.disciplina cd_disciplina,'+
         'fi.curso cd_curso,'+
         't.sn_bloquear_vagas,'+
         't.vagas nr_vagas,'+
         'd.descricao ds_disciplina,'+
         'CAST(COUNT(*) AS NUMBER(19)) nr_matriculados '+
      'FROM '+
         'fichaindividual fi '+
            'JOIN situacao s ON '+
               '(fi.situacao = s.cd_situacao) '+
            'JOIN turmas t ON '+
               '(fi.turma = t.codigo) AND '+
               '(fi.anosemestre = t.anosemestre) '+
            'JOIN disciplinas d ON '+
               '(fi.disciplina = d.codigo) AND '+
               '(fi.curso = d.curso) '+
      'WHERE '+
         's.cd_situacao_pai NOT IN (3, 4, 6, 7, 8) AND (%s)'+
      'GROUP BY '+
         'fi.turma,'+
         'fi.disciplina,'+
         'fi.anosemestre,'+
         'fi.curso,'+
         't.sn_bloquear_vagas,'+
         't.vagas,'+
         'd.descricao';
         
   S_SQL_LOTACAO_MYSQL =
      'SELECT '+
         'fi.anosemestre nr_anosemestre,'+
         'fi.turma cd_turma,'+
         'fi.disciplina cd_disciplina,'+
         'fi.curso cd_curso,'+
         't.sn_bloquear_vagas,'+
         't.vagas nr_vagas,'+
         'd.descricao ds_disciplina,'+
         'COUNT(*) nr_matriculados '+
      'FROM '+
         'fichaindividual fi '+
            'JOIN situacao s ON '+
               '(fi.situacao = s.cd_situacao) '+
            'JOIN turmas t ON '+
               '(fi.turma = t.codigo) AND '+
               '(fi.anosemestre = t.anosemestre) '+
            'JOIN disciplinas d ON '+
               '(fi.disciplina = d.codigo) AND '+
               '(fi.curso = d.curso) '+
      'WHERE '+
         's.cd_situacao_pai NOT IN (3, 4, 6, 7, 8) AND (%s)'+
      'GROUP BY '+
         'fi.turma,'+
         'fi.disciplina,'+
         'fi.anosemestre,'+
         'fi.curso,'+
         't.sn_bloquear_vagas,'+
         't.vagas,'+
         'd.descricao';

   S_FILTRO_DISCIPLINA =
      '(fi.turma = ''%s'' AND '+
       'fi.disciplina = %d AND '+
       'fi.curso = ''%s'' AND '+
       'fi.anosemestre = %d AND '+
       't.sn_bloquear_vagas = 1)';

   S_OP = ' OR ';

   S_MSG_LOTACAO =
      'As seguintes turmas/disciplinas estão com todas as vagas preenchidas:' +
      #13 + #13 + '%s' + #13 + #13 +
      'Remova as disciplinas da lista antes de prosseguir.';

var
   I: integer;
   LSDisciplinas, LSFiltro: string;
begin
   Result := true;
   LSFiltro := '';
   LSDisciplinas := '';
   

   for I := Low(ArrayDisciplinas) to High(ArrayDisciplinas) do
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;
      LSFiltro :=
         LSFiltro + Format(S_FILTRO_DISCIPLINA, [ArrayDisciplinas[I].turma, ArrayDisciplinas[I].disciplina, ArrayDisciplinas[I].curso, tblTurmasAnoSemestre.AsInteger]);
   end;

   // Abre o ResultSet com as informações de turmas, disciplinas e vagas
   qryTurmasLotacaoVagas.Close;
   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qryTurmasLotacaoVagas.SQL.Text := Format(S_SQL_LOTACAO_ORACLE, [LSFiltro])
   else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
      qryTurmasLotacaoVagas.SQL.Text := Format(S_SQL_LOTACAO_MYSQL, [LSFiltro]);
   qryTurmasLotacaoVagas.Open;
   if not qryTurmasLotacaoVagas.IsEmpty then
   begin
      // Perccore a lista de disciplinas selecionadas para a matrícula do aluno
      for I := Low(ArrayDisciplinas) to High(ArrayDisciplinas) do
      begin
         // Procura a turma/disciplina/curso/anosemestre no ResultSet...
         if qryTurmasLotacaoVagas.Locate(
               'cd_turma;cd_disciplina;cd_curso;nr_anosemestre',
               VarArrayOf(
                  [ArrayDisciplinas[I].turma,
                   ArrayDisciplinas[I].disciplina,
                   ArrayDisciplinas[I].curso,
                   tblTurmasAnoSemestre.AsInteger]
               ),
               [loCaseInsensitive]) then
         begin
            // ...se encontrar, verifica se a flag para verificação de limite de
            // vagas para a turma está habilitada
            if qryTurmasLotacaoVagassn_bloquear_vagas.AsInteger = 1 then
            begin
               if qryTurmasLotacaoVagasnr_matriculados.AsInteger >= qryTurmasLotacaoVagasnr_vagas.AsInteger then
               begin               
                  lstDisciplinas.Checked[I] := true;
                  // Não há vagas disponíveis para esta turma/disciplina
                  if LSDisciplinas <> '' then
                     LSDisciplinas := LSDisciplinas + #13;
                  LSDisciplinas := LSDisciplinas +
                     Format('%s/%s',
                        [qryTurmasLotacaoVagascd_turma.AsString,
                         qryTurmasLotacaoVagasds_disciplina.AsString]);
               end;
            end;
         end;
      end;
      if LSDisciplinas <> '' then
      begin
         // Exibe mensagem informando as disciplinas com todas as vagas preenchidas
         Mensagem(Format(S_MSG_LOTACAO, [LSDisciplinas]), 'Atenção', MB_ICONWARNING, Handle);
         Result := false;
      end;
   end;
end;

function TfrmMatricular.AtualizarControle( dblValor : Single ) : Boolean;
begin
  frmDinCh.dblValor := dblValor;
  if frmDinCh.ShowModal = mrCancel then
  begin
    Result := False;
    Exit;
  end;

  // Novo Financeiro

  // DM.tblControle.Close;
  // DM.tblControle.ParamByName('Situacao').AsString := 'A';
  // DM.tblControle.Prepare;
  // DM.tblControle.Open;

  // DM.tblControle.Edit;
  // DM.tblControleRecebido.Value := DM.tblControleRecebido.Value + dblValor;
  // DM.tblControleDinheiro.Value := DM.tblControleDinheiro.Value + frmDinCh.dblDin;
  // DM.tblControleCheque.Value := DM.tblControleCheque.Value + frmDinCh.dblCh;
  // DM.tblControleMensalidade.Value := DM.tblControleMensalidade.Value + dblValor;
  //DM.tblControle.Post;
  Result := True;
end;

procedure TfrmMatricular.EditDataMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DBLookupComboBox1.SetFocus;
    Key := #0;
  end;

end;


procedure TfrmMatricular.btnPlanosDescontoClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao(2020, npAcesso, true) then Exit;
  
  Application.CreateForm(TfrmPlanosDesconto, frmPlanosDesconto);
  frmPlanosDesconto.ShowModal;
//  ManterDesconto := frmPlanosDesconto.ckManterDesconto.Checked;
end;


procedure TfrmMatricular.InicializaArrays;
var
  n : Integer;
  datZero : TDateTime;
begin
  datZero := 0;
  for n := Low( ArrayValores ) to High( ArrayValores ) do ArrayValores[n] := 0;
  for n := Low( ArrayValorExtra ) to High( ArrayValorExtra ) do ArrayValorExtra[n] := 0;
  for n := Low( ArrayDescontos ) to High( ArrayDescontos ) do ArrayDescontos[n] := 0;
  for n := Low( ArrayDescontosExtra ) to High( ArrayDescontosExtra ) do ArrayDescontosExtra[n] := 0;
  for n := Low( ArrayParcelas ) to High( ArrayParcelas ) do ArrayParcelas[n] := 0;
  for n := Low( ArrayDatas ) to High( ArrayDatas ) do ArrayDatas[n] := datZero;
  for n := Low( ArrayDescontosPlano ) to High( ArrayDescontosPlano ) do ArrayDescontosPlano[n] := 0;
  for n := Low( ArrayDescontosExtraPlano ) to High( ArrayDescontosExtraPlano ) do ArrayDescontosExtraPlano[n] := 0;
end;

procedure TfrmMatricular.tblMatriculasAfterInsert(DataSet: TDataSet);
begin
   tblMatriculasDataEmissao.AsDateTime := DataHoje
end;

procedure TfrmMatricular.tblMatriculasBeforePost(DataSet: TDataSet);
begin
   tblMatriculasUsuario.AsString := DM.sLogin;
   if lngPlano = 0 then
      tblMatriculasPlanoDesconto.Clear
   else
      tblMatriculasPlanoDesconto.AsInteger := lngPlano;

  // Pegar o Número do Aluno na turma
   if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
      tblMatriculasnr_aluno.AsInteger := DM.DefineNumeroMatricula(tblMatriculas.FieldByName('turma').AsString, tblMatriculas.FieldByName('anosemestre').AsInteger)
   end;

end;

procedure TfrmMatricular.txtDiaUtilExit(Sender: TObject);
begin
  CalcularVencimento;
end;

procedure TfrmMatricular.dtcMatriculasDataChange(Sender: TObject;
  Field: TField);
begin
{ Desabilitado por Claudionor
  try
  if (tblMatriculasAnoSemestre.AsInteger <> tblTurmasAnoSemestre.AsInteger) or
     (tblMatriculasCurso.AsString <> tblTurmasCurso.AsString) then
  begin
      FiltraTurma;
  end;
  except
  end;
}
end;

procedure TfrmMatricular.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
  resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, tblMatriculasAnoSemestre.AsInteger);
  
  if resultado_filtro.filtrado then
  Begin
     tblMatriculasCurso.AsString := resultado_filtro.cd_curso;
     tblMatriculasAnoSemestre.AsInteger := resultado_filtro.nr_anosemestre;
     FiltraTurma;
     dtcMatriculasDataChange(nil,nil);
  end;

end;

procedure TfrmMatricular.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dtcMatriculasDataChange( nil, nil );
    EditDataMatricula.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmMatricular.tblTurmasCalcFields(DataSet: TDataSet);
begin

   qMat.Close;
   qMat.SQL.Text := 'Select Count(*) As QTD from matriculas';
   qMat.SQL.Add('where turma = :turma and anosemestre = :anosemestre');
   qMat.SQL.Add('and situacao not in (3,4,6,7,8)');
   qMat.ParamByName('turma').AsString := tblTurmasCodigo.AsString;
   qMat.ParamByName('anosemestre').AsInteger := tblTurmasAnoSemestre.AsInteger;
   qMat.Open;

   tblTurmasqtd_matriculas.AsInteger := qMat.FieldByName('QTD').AsInteger;

end;

procedure TfrmMatricular.FiltraTurma;
begin
   if CheckBox1.Visible Then
   Begin
       if CheckBox1.Checked Then
       Begin
          tblTurmas.Close;
          TBLTURMAS.SQL.TEXT := 'SELECT         '+
                                '  T.ANOSEMESTRE,T.CODIGO,T.SERIE,T.CURSO,T.TURNO,T.DESCRICAO,T.CONTRATO,T.VAGAS,'+
                                '  T.HORAINICIO,T.HORAFIM,T.DATAINICIO,T.DATAFIM,T.IDADECONCLUSAO,T.DATACONCLUSAO,T.CD_COLIGADA,'+
                                '  T.SN_BLOQUEAR_VAGAS,T.CD_CENTRO,T.CD_SITUACAO,T.SN_USAR_PLANO,     '+
                                '  C.CD_DEPTO DEPTO, S.DS_VALOR                                               '+
                                'FROM                        '+
                                '  TURMAS T                  '+
                                '  JOIN CURSOS_COLIGADAS C ON (C.CD_CURSO = T.CURSO AND T.CD_COLIGADA = C.CD_COLIGADA)'+
                                '  LEFT JOIN SITUACOES S ON ( S.CD_SITUACAO = T.CD_SITUACAO AND S.CD_MODULO = 1148 )'+
                                'WHERE           '+
                                '   T.ANOSEMESTRE =  :ANOSEMESTRE'+
                                '   AND C.CD_CURSO = :CURSO        '+
                                '   AND T.SERIE = :SERIE         '+
                                '   AND T.CD_COLIGADA IN ( ' + DM.GetColigadas + '  ) ' +
                                ' GROUP BY                       '+
            						  '   T.SN_USAR_PLANO,               '+
                                '   T .ANOSEMESTRE,                '+
                                '   T .CODIGO,                     '+
                                '   T .SERIE,                      '+
                                '   T .CURSO,                      '+
                                '   T .TURNO,                      '+
                                '   T .DESCRICAO,                  '+
                                '   T .CONTRATO,                   '+
                                '   T .VAGAS,                      '+
                                '   T .HORAINICIO,                 '+
                                '   T .HORAFIM,                    '+
                                '   T .DATAINICIO,                 '+
                                '   T .DATAFIM,                    '+
                                '   T .IDADECONCLUSAO,             '+
                                '   T .DATACONCLUSAO,              '+
                                '   T .CD_COLIGADA,                '+
                                '   T .SN_BLOQUEAR_VAGAS,          '+
                                '   T .CD_CENTRO,                  '+
                                '   T .CD_SITUACAO,                '+
                                '   C.CD_DEPTO ,                   '+
                                '   S.DS_VALOR                     '+
                                ' ORDER BY T.CODIGO';
          tblTurmas.ParamByName('CURSO').AsString := tblMatriculasCurso.ASString;
          tblTurmas.ParamByName('ANOSEMESTRE').AsInteger := tblMatriculasAnoSemestre.ASInteger;
          tblTurmas.ParamByName('SERIE').AsInteger := serie;
          tblTurmas.Open;

          if not tblTurmas.Eof then begin // Se tiver turmas (somente da etapa seguinte), apresentá-las
             exit;
          end else begin // se não tiver turmas, desligar a check e tentar novamente (deixar continuar a rotina)
             CheckBox1.Checked := false;
          end;
       End
   end;

   tblTurmas.Close;
   tblTurmas.SQL.Text :=
         'SELECT         '+
         '   T.ANOSEMESTRE,T.CODIGO,T.SERIE,T.CURSO,T.TURNO,T.DESCRICAO,T.CONTRATO,T.VAGAS,'+
         '   T.HORAINICIO,T.HORAFIM,T.DATAINICIO,T.DATAFIM,T.IDADECONCLUSAO,T.DATACONCLUSAO,T.CD_COLIGADA,'+
         '   T.SN_BLOQUEAR_VAGAS,T.CD_CENTRO,T.CD_SITUACAO,C.CD_DEPTO DEPTO, '+
         '   S.DS_VALOR,T.SN_USAR_PLANO                             '+
         'FROM                        '+
         '  TURMAS T                  '+
         '  JOIN CURSOS_COLIGADAS C ON (C.CD_COLIGADA = T.CD_COLIGADA AND T.CURSO = C.CD_CURSO)'+
         '  LEFT JOIN SITUACOES S ON ( S.CD_SITUACAO = T.CD_SITUACAO AND S.CD_MODULO = 1148 )'+
         'WHERE           '+
         '   T.ANOSEMESTRE =  :ANOSEMESTRE'+
         '   AND C.CD_CURSO = :CURSO        '+
         '   AND T.CD_COLIGADA IN ( ' + DM.GetColigadas + '  ) ' +
         ' GROUP BY                       '+
         '   T.ANOSEMESTRE,T.CODIGO,T.SERIE,T.CURSO,T.TURNO,T.DESCRICAO,T.CONTRATO,T.VAGAS,'+
         '   T.HORAINICIO,T.HORAFIM,T.DATAINICIO,T.DATAFIM,T.IDADECONCLUSAO,T.DATACONCLUSAO,T.CD_COLIGADA,'+
         '   T.SN_BLOQUEAR_VAGAS,T.CD_CENTRO,T.CD_SITUACAO,C.CD_DEPTO, S.DS_VALOR,T.SN_USAR_PLANO '+
         ' ORDER BY T.CODIGO';
   tblTurmas.ParamByName('CURSO').AsString := tblMatriculasCurso.ASString;
   tblTurmas.ParamByName('ANOSEMESTRE').AsInteger := tblMatriculasAnoSemestre.ASInteger;

   tblTurmas.Open;
end;

procedure TfrmMatricular.CheckBox1Click(Sender: TObject);
begin
   FiltraTurma;
end;

procedure TfrmMatricular.tblMatriculasNewRecord(DataSet: TDataSet);
begin
   tblMatriculascd_ingresso.AsInteger := iIngressoPadrao;
   tblMatriculasCodigoAluno.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
end;

procedure TfrmMatricular.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    DBLookupComboBox2.SetFocus;
    Key := #0;
  end;

end;

procedure TfrmMatricular.DBLookupComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    grd.SetFocus;
    Key := #0;
  end;

end;

procedure TfrmMatricular.DefinirTamanhoArray(Tamanho: Integer);
begin
   SetLength(ArrayValores, Tamanho);
   SetLength(ArrayParcelas, Tamanho);
   SetLength(ArrayDescontos, Tamanho);
   SetLength(ArrayDescontosPlano, Tamanho);
   SetLength(ArrayDescontosExtra, Tamanho);
   SetLength(ArrayDescontosExtraPlano, Tamanho);
   SetLength(ArrayDatas, Tamanho);
   SetLength(ArrayCDMensalidade, Tamanho);
   SetLength(ArrayValorExtra, Tamanho);
   SetLength(ArraySN_Credito, Tamanho);
   SetLength(ArrayNr_Credito, Tamanho);
   SetLength(ArrayTipoParcela, Tamanho);
   SetLength(ArrayValores, Tamanho);
   SetLength(ArrayValorCredito, Tamanho);
   SetLength(ArrayItemPlano, Tamanho);
   SetLength(ArrayPlanoContas, Tamanho);
   SetLength(ArrayDescricaoTipo, Tamanho);
   SetLength(ArrayReciboImpresso, Tamanho);
end;

procedure TfrmMatricular.PageChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
    AllowChange := PodeMudar;
    PodeMudar := False;
end;

procedure TfrmMatricular.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tblMatriculas.State in [dsInsert, dsEdit] then tblMatriculas.Cancel;
  tblMatriculas.Close;
  tblTurmas.Close;
  tblPlanos.Close;
  tblMatriculasRead.Close;

  FreeAndNil(frm_Mensa_Baixar);
  FreeAndNil(frmImpMens);


end;

procedure TfrmMatricular.FormCreate(Sender: TObject);
begin
   Self.FSObsPlanoDesconto := '';
   ListaHorarios := TStringList.Create();
   if IsBloquearDataVencto then
   begin
      FBBloqVencto := true;
      radPlano.Enabled := false;
      radPlano.Checked := false;
      radUtil.Enabled := false;
      radUtil.Checked := false;
      Label4.Enabled := false;
      txtSempreDia.Text := qryBloqDataVenctonr_dia_vencimento.AsString;
      txtSempreDia.Enabled := false;
      radSempre.Enabled := false;
      radSempre.Checked := true;
   end
   else
      FBBloqVencto := false;
end;

procedure TfrmMatricular.MontarGradeDisciplinas;
const
   SSQLDiscHorarios =
      'SELECT DISTINCT ' +
         'GD.CD_GRADE,' +
         'GD.NR_SERIE SERIE,' +
         'C.GRAU,' +
         'T.CURSO,' +
         'GD.CD_DISCIPLINA DISCIPLINA,' +
         'D.DESCRICAO,' +
         'GD.NR_AULAS NUMEROAULAS,' +
         'H.TURMA,' +
         'T.CURSO ' +
      'FROM ' +
         'TURMAS T ' +
            'JOIN GRADES G ON' +
               '(T.CD_GRADE = G.CD_GRADE) AND' +
               '(T.CURSO = G.CD_CURSO)' +
            'JOIN GRADES_DISCIPLINAS GD ON' +
               '(G.CD_GRADE = GD.CD_GRADE) AND' +
               '(G.CD_CURSO = GD.CD_CURSO) AND' +
               '(T.SERIE = GD.NR_SERIE)' +
            'JOIN DISCIPLINAS D ON' +
               '(GD.CD_DISCIPLINA = D.CODIGO) AND' +
               '(GD.CD_CURSO = D.CURSO)' +
            'JOIN CURSOS C ON' +
               '(T.CURSO = C.CODIGO) AND' +
               '(T.ANOSEMESTRE = C.ANOSEMESTRE)' +
            'JOIN TURMAS_HORARIOS H ON' +
               '(T.CODIGO = H.TURMA) AND' +
               '(T.ANOSEMESTRE = H.ANOSEMESTRE) AND' +
               '(D.CODIGO = H.DISCIPLINA)' +
      'WHERE ' +
         'H.TURMA_BASE = :CD_TURMA AND ' +
         'H.ANOSEMESTRE = :NR_ANOSEMESTRE';

   SSQLDisciplinas =
      'SELECT ' +
         'GD.CD_GRADE,' +
         'GD.NR_SERIE SERIE,' +
         'C.GRAU,' +
         'T.CURSO,' +
         'GD.CD_DISCIPLINA DISCIPLINA,' +
         'D.DESCRICAO,' +
         'GD.NR_AULAS NUMEROAULAS,' +
         'T.CODIGO TURMA,' +
         'T.CURSO ' +
      'FROM ' +
         'TURMAS T ' +
            'JOIN GRADES G ON' +
               '(T.CD_GRADE = G.CD_GRADE) AND' +
               '(T.CURSO = G.CD_CURSO)' +
            'JOIN GRADES_DISCIPLINAS GD ON' +
               '(G.CD_GRADE = GD.CD_GRADE) AND' +
               '(G.CD_CURSO = GD.CD_CURSO) AND' +
               '(T.SERIE = GD.NR_SERIE)' +
            'JOIN DISCIPLINAS D ON' +
               '(GD.CD_DISCIPLINA = D.CODIGO) AND' +
               '(GD.CD_CURSO = D.CURSO)' +
            'JOIN CURSOS C ON' +
               '(T.CURSO = C.CODIGO) AND' +
               '(T.ANOSEMESTRE = C.ANOSEMESTRE)' +
      'WHERE ' +
         'T.CODIGO = :CD_TURMA AND ' +
         'T.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'G.SN_ATIVO = ''S''';
Var
   qyDisc : TUMZQuery;
   qyHorario : TUMZQuery;
   i      : integer;
   prereq : string;
   aux    : string;
   sGrupoDisc : String;
   iSerie : Integer;
begin
   // Preparar a lista de horários matriculados pelo aluno

   ListaHorarios.Clear();

   { Criar uma nova query }
   try
      DM.CriarConsulta(qyDisc);
      DM.CriarConsulta(qyHorario);

      // Selecionar as disciplinas do horário registrado na turma matrícula
      if(DM.variavel_parametro('sn_mostra_disciplinas_horarios') = 'S')then
      begin
         qyDisc.Close;
         qyDisc.SQL.Text := SSQLDiscHorarios;
         qyDisc.ParamByName('CD_TURMA').AsString := tblTurmasCodigo.AsString;
         qyDisc.ParamByName('NR_ANOSEMESTRE').AsInteger := tblTurmasAnoSemestre.AsInteger;
         qyDisc.Open;
      end;

      // Se o horário ja estiver montado, o sistema deve sugerir as disciplinas do horário somente
      if qyDisc.IsEmpty then begin

        // Selecionar as disciplinas da grade referente a turma selecionada
        // Isso só vai acontecer se o horário da turma não foi definido

        qyDisc.Close;
        qyDisc.SQL.Text := SSQLDisciplinas;
        qyDisc.ParamByName('CD_TURMA').AsString := tblTurmasCodigo.AsString;
        qyDisc.ParamByName('NR_ANOSEMESTRE').AsInteger := tblTurmasAnoSemestre.AsInteger;
        qyDisc.Open;
        
      end;

      lstDisciplinas.Items.Clear;
      SetLength(ArrayDisciplinas, qyDisc.RecordCount);

      i := 0;

      // Listar as disciplinas do ListItems
      while not qyDisc.Eof do Begin

         // Retirar da listagem as disciplinas já cursadas

         if not CursouDisciplina(tblMatriculasCodigoAluno.AsInteger, qyDisc.FieldByName('curso').AsString, qyDisc.FieldByName('disciplina').AsInteger, qyDisc.FieldByName('serie').AsInteger) then begin

            // Carregar o horário de todas as disciplinas

            qyHorario.Close();
            qyHorario.SQL.Text := '' +
             ' SELECT DISTINCT dia_semana, cd_horario ' +
             ' FROM turmas_horarios                                ' +
             ' WHERE anosemestre = ' + tblMatriculasAnoSemestre.AsString +
             '   AND turma = ' +  QuotedStr(qyDisc.FieldByName('turma').AsString) + ' ' +
             '   AND disciplina = ' + qyDisc.FieldByName('disciplina').AsString;
            qyHorario.Open();

            while not qyHorario.Eof do begin
                ListaHorarios.Add(qyHorario.FieldByName('dia_semana').AsString + '_' + qyHorario.FieldByName('cd_horario').AsString);
                qyHorario.Next();
            end;

            // Horarios das disciplinas carregados para a ListaHorarios

            lstDisciplinas.Items.Add(qyDisc.FieldByName('turma').AsString + ' - ' + FillString(qyDisc.FieldByName('disciplina').AsString, alRight, '0', 11, False ) + ' - ' +  qyDisc.FieldByName('descricao').AsString);

            ArrayDisciplinas[i].turma := qyDisc.FieldByName('turma').AsString;
            ArrayDisciplinas[i].curso := qyDisc.FieldByName('curso').AsString;
            ArrayDisciplinas[i].disciplina := qyDisc.FieldByName('disciplina').AsInteger;
            ArrayDisciplinas[i].creditos := qyDisc.FieldByName('numeroaulas').AsCurrency;

            qyHorario.SQL.Text := ' '+
              ' SELECT serie FROM turmas  '+
              ' WHERE codigo = ' + QuotedStr(qyDisc.FieldByName('turma').AsString) + ' ' +
              '   AND anosemestre = ' + tblMatriculasAnoSemestre.AsString;
            qyHorario.Open();

            iSerie := qyHorario.FieldByName('serie').AsInteger;

            // Selecionar as disciplinas que são pré-requisitas
            DM.qAux1.Close();
            DM.qAux1.SQL.Clear();
            DM.qAux1.SQL.Add('SELECT * FROM disciplinas_prereq WHERE cd_curso = '''+qyDisc.FieldByName('curso').AsString+''' AND cd_discipli = '+qyDisc.FieldByName('disciplina').AsString);
            // Verificar se a Grade

            DM.qAux1.SQL.Add(' AND cd_grade = ' + IntToStr(iGradeCurso) );
            Dm.qAux1.SQL.Add(' ORDER by cd_discipli ');
            DM.qAux1.Open();

            sGrupoDisc := 'XXXXXXXXXXX';

            // Percorrer as disciplinas pré-requisitas
            while not DM.qAux1.Eof do begin

               if not CursouDisciplina(tblMatriculasCodigoAluno.AsInteger, DM.qAux1.FieldByName('cd_curso').AsString, DM.qAux1.FieldByName('cd_discipli_pre').AsInteger, iSerie ) then begin

                   //Verificar quais as disciplinas o aluno não cursou ainda
                   DM.qAux2.Close;
                   DM.qAux2.SQL.Clear;
                   DM.qAux2.SQL.Text :=
                    ' SELECT d.codigo, d.descricao, fi.codigoaluno ' +
                    ' FROM disciplinas d LEFT JOIN fichaindividual fi ON (fi.disciplina = d.codigo AND  ' +
                    ' d.curso = fi.curso AND fi.codigoaluno = ' + frm_Alunos.tblPessoacd_pessoa.AsString +
                    ' AND (fi.situacao in (SELECT cd_situacao FROM situacao WHERE cd_situacao_pai IN(0,12)) )) ' +
                    ' WHERE d.curso = ''' + Dm.qAux1.FieldByName('cd_curso').AsString + ''' AND d.codigo = '+DM.qAux1.FieldByName('cd_discipli_pre').AsString+' AND isNull(fi.codigoaluno)';
                   DM.qAux2.Open;

                   if (sGrupoDisc <> FillString(Dm.qAux1.FieldByName('cd_curso').AsString,alRight, '0', 15, false) + FillString(DM.qAux1.FieldByName('cd_discipli').AsString, alRight, '0',10, false)) then begin

                       sGrupoDisc := FillString(Dm.qAux1.FieldByName('cd_curso').AsString,alRight, '0', 15, false) + FillString(DM.qAux1.FieldByName('cd_discipli').AsString, alRight, '0',10, false);

                       aux := chr(13) + 'Para: '+qyDisc.FieldByName('disciplina').AsString + ' - ' + qyDisc.FieldByName('descricao').AsString+' os pré-requisitos são:';

                   end;

                   while not DM.qAux2.Eof do begin
                       prereq := prereq + aux + chr(13) + DM.qAux2.FieldByName('codigo').AsString + ' - ' + DM.qAux2.FieldByName('descricao').AsString;
                       aux := '';
                       DM.qAux2.Next;

                       lstDisciplinas.Checked[i] := true;
                   end;
               end;
               DM.qAux1.Next();
            end;

            Inc(i);

         end;

         qyDisc.Next;
      End;

      if prereq <> '' then begin
        if not DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false ) then begin
              // Não tem autorização para o pré-requisito 
              Mensagem('As disciplinas mostradas possuem pré-requisitos em que o aluno ainda não possui aprovação:'+chr(13)+prereq+chr(13)+chr(13)+'Você não tem permissão para adicionar disciplinas com pré-requisitos.', 'Confirmação', MB_OK + MB_ICONQUESTION, Handle);
              btnRemoverDisciplinasClick( nil );
        end else begin
           if Mensagem('As disciplinas mostradas possuem pré-requisitos em que o aluno ainda não possui aprovação:'+chr(13)+prereq+chr(13)+chr(13)+'Deseja matricula(s) essa(s) disciplina mesmo assim?', 'Confirmação', MB_YESNO + MB_ICONQUESTION, Handle) = mrNo then begin
              btnRemoverDisciplinasClick( nil );
           end;
        end;

      end;
      for i := 0 to lstDisciplinas.Count - 1 do begin
          lstDisciplinas.Checked[i] := false;
      end;


      lbCreditos.Caption := 'Número de Créditos: ' + CurrToStr(total_creditos);

   finally

     FreeAndNil(qyDisc);

     FreeAndNil(qyHorario);

   end;

end;

procedure TfrmMatricular.SpeedButton1Click(Sender: TObject);
begin

  Application.CreateForm( TfrmTableFields, frmTableFields );
  frmTableFields.qyMatriculas.Close;
  frmTableFields.qyMatriculas.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  frmTableFields.qyMatriculas.Open;

  frmTableFields.Left := 65;
  frmTableFields.Tag := 10; // Isso vai indicar que está aberto a janela de Disciplinas para Matrícula
  frmTableFields.ConstroiTreeMatriculas;
  frmTableFields.Show;
  
end;

procedure TfrmMatricular.SpeedButton2Click(Sender: TObject);
Var
  iQtdParcelas : Smallint; 
begin
   if radPlano.Checked then begin
      try
         iQtdParcelas := StrToInt(txtParcelas.Text);
      except
         iQtdParcelas := tblPlanosParcelas.AsInteger;
      end;

      if iQtdParcelas <> tblPlanosParcelas.AsInteger then begin

         radSempre.Checked := true;

      end;

   end;

   CalcularVencimento;
end;

procedure TfrmMatricular.lstDisciplinasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure TfrmMatricular.lstDisciplinasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
   CR = #13;
   S_FMT_ITEM = '%s - %s - %s';
   S_FMT_DISC = CR + '%s - %s';
   S_FMT_CREDITOS = 'Número de Créditos: %f';
   S_DISC_PRE_REQ = CR + 'Para: %s - %s or pré-requisitos são:';
   S_DISC_PRE_REQ_ESP = '- %s' + CR;
   S_ORIENTACAO = 'Arraste para as disciplinas matriculadas.';
   S_CONFLITO_HORARIO =
      'Atenção:' + CR + CR + 'Esta disciplina está em conflito de horário com '+
      'outra disciplina já selecionada.' + CR + 'Deseja continuar mesmo assim?';
   S_DISC_CURSADA =
      'Atenção!' + CR + CR + 'O estudante já cursou a disciplina selecionada '+
      'ou equivalente.' + CR + CR + 'Deseja continuar mesmo assim?';
   S_AUTORIZA_DISC =
      'As disciplinas mostradas possuem pré-requisitos em que o aluno ainda '+
      'não possui aprovação:' + CR + '%s' + CR + CR + 'Deseja matricular '+
      'essa(s) disciplina(s) mesmo assim?';
   S_DISC_SEM_APROV =
      'A disciplina que está sendo inserida possui pré-requisito especial em '+
      'que o aluno não possui aprovação:' + CR;
   S_CONFIRMA_SEM_PRE_REQ_ESP =
      '%s' + CR + 'Deseja matricular essa disciplina mesmo assim?';
   S_SEM_AUTORIZACAO = 'Você não tem autorização para prosseguir!';
   MSG_ICON_PERGUNTA = MB_YESNO + MB_ICONQUESTION;
var
   LSlPreReqEsp: TStringList;
   LICodDisc, LIAnoSem, LICodAluno, LISerie, LIItem, LITamStr, I: integer;
   LSCodDisc, LSCodTurma, LSCodCurso, LSNomeDisc, LSGrupoDisc, LSCodCursoTemp,
   LSCodTurmaTemp, LSPreReq, LSPreReqTemp, LSMsgPreReq: string;
begin
   if Source is TTreeView then
      if frmTableFields.Tag = 10 then
      begin
         // Pega as informações de disciplina, turma e curso selecionados
         LSCodDisc := Copy(frmTableFields.Tree.Selected.Text, 1, 11);
         LSCodTurma := Trim(frmTableFields.Tree.Selected.Parent.Text);
         LSCodCurso := Trim(frmTableFields.Tree.Selected.Parent.Parent.Text);
         LICodDisc := StrToInt(LSCodDisc);

         // Pega informações da matrícula do aluno
         LIAnoSem := tblMatriculasAnoSemestre.AsInteger;
         LICodAluno := tblMatriculasCodigoAluno.AsInteger;

         // Verificar se há conflito de horários
         qrySelectHorarios.ParamByName('NR_ANOSEMESTRE').AsInteger := LIAnoSem;
         qrySelectHorarios.ParamByName('CD_TURMA').AsString := LSCodTurma;
         qrySelectHorarios.ParamByName('CD_DISCIPLINA').AsInteger := LICodDisc;
         qrySelectHorarios.Open;

         while not qrySelectHorarios.Eof do
         begin
            if ListaHorarios.IndexOf(qrySelectHorariosHORARIO.AsString) > -1 then
               case Mensagem(S_CONFLITO_HORARIO, 'UNIMESTRE', MSG_ICON_PERGUNTA, Handle) of
                  ID_YES: Break;
                  ID_NO:
                  begin
                     qrySelectHorarios.Close;
                     Abort;
                  end;   
               end;
            qrySelectHorarios.Next;
         end;

         // Adiciona os horários à lista de horários
         qrySelectHorarios.First;
         while not qrySelectHorarios.Eof do
         begin
            ListaHorarios.Add(qrySelectHorariosHORARIO.AsString);
            qrySelectHorarios.Next;
         end;
         qrySelectHorarios.Close;

         // Verificar se o aluno já cursou alguma disciplina equivalente
         qrySelectSerie.ParamByName('CD_TURMA').AsString := LSCodTurma;
         qrySelectSerie.ParamByName('NR_ANOSEMESTRE').AsInteger := LIAnoSem;
         qrySelectSerie.Open;
         LISerie := qrySelectSerieSERIE.AsInteger;
         qrySelectSerie.Close;

         if CursouDisciplina(LICodAluno, LSCodCurso, LICodDisc, LISerie) then
         begin
            if Mensagem(S_DISC_CURSADA, 'Atenção!', MSG_ICON_PERGUNTA, Handle) = ID_NO then
               Abort;                    
         end;

         // Adiciona o item selecionado à lista de disciplinas
         LSNomeDisc := Copy(frmTableFields.Tree.Selected.Text, 14, Length(frmTableFields.Tree.Selected.Text));
         LIItem := lstDisciplinas.Items.Add(Format(S_FMT_ITEM, [LSCodTurma, LSCodDisc, LSNomeDisc]));

         // Verificar se o aluno cursou as disciplinas pré-requisitos
         qrySelectPreReq.ParamByName('CD_CURSO').AsString := LSCodCurso;
         qrySelectPreReq.ParamByName('CD_DISCIPLINA').AsInteger := LICodDisc;
         qrySelectPreReq.ParamByName('CD_TURMA').AsString := LSCodTurma;
         qrySelectPreReq.ParamByName('NR_ANOSEMESTRE').AsInteger := LIAnoSem;
         qrySelectPreReq.ParamByName('CD_GRADE').AsInteger := iGradeCurso;
         qrySelectPreReq.Open;
         LSGrupoDisc := StringOfChar(' ', 12);

         while not qrySelectPreReq.Eof do
         begin
            if not CursouDisciplina(LICodAluno, qrySelectPreReqCD_CURSO.AsString, qrySelectPreReqCD_DISCIPLI_PRE.AsInteger, LISerie) then
            begin
               // Verificar as disciplinas ainda não cursadas pelo aluno
               qrySelectNaoCursadas.ParamByName('CD_PESSOA').AsInteger := LICodAluno;
               qrySelectNaoCursadas.ParamByName('CD_CURSO').AsString := LSCodCurso;
               qrySelectNaoCursadas.ParamByName('CD_DISCIPLINA').AsInteger := LICodDisc;
               qrySelectNaoCursadas.Open;

               // Armazena o código do curso com tamanho de 15 caracteres
               LSCodCursoTemp := qrySelectPreReqCD_CURSO.AsString;
               LITamStr := Length(LSCodCursoTemp);
               if LITamStr < 15 then
                  LSCodCursoTemp := LSCodCurso + StringOfChar('0', 15 - LITamStr);
               // Armazena o código da discplina com tamanho de 10 caracteres
               LSCodTurmaTemp := qrySelectPreReqCD_DISCIPLI.AsString;
               LITamStr := Length(LSCodTurmaTemp);
               if LITamStr < 10 then
                  LSCodTurmaTemp := LSCodTurmaTemp + StringOfChar('0', 10 - LITamStr);
               
               if LSGrupoDisc <> LSCodCursoTemp + LSCodTurmaTemp then
               begin
                  LSGrupoDisc := LSCodCursoTemp + LSCodTurmaTemp;
                  LSPreReqTemp := Format(S_DISC_PRE_REQ, [qrySelectPreReqCD_DISCIPLI.AsString, qrySelectPreReqDESCRICAO.AsString]);
               end;

               // Percorre as disciplinas pré-requisito não cursadas
               while not qrySelectNaoCursadas.Eof do
               begin
                  LSPreReq := LSPreReq + LSPreReqTemp + Format(S_FMT_DISC, [qrySelectNaoCursadasCODIGO.AsString, qrySelectNaoCursadasDESCRICAO.AsString]);
                  LSPreReqTemp := '';
                  lstDisciplinas.Checked[LIItem] := true;
                  qrySelectNaoCursadas.Next;
               end;
            end;
            qrySelectPreReq.Next;
         end;

         // Verifica se o usuário possui autorização para adicionar a disciplina
         if LSPreReq <> '' then
         begin
            if DM.UsuarioLogado.TemPermissao(1019, npEspecial, false) then
            begin
               if Mensagem(Format(S_AUTORIZA_DISC, [LSPreReq]), 'Confirmação', MSG_ICON_PERGUNTA, Handle) = ID_NO then
                  btnRemoverDisciplinasClick(nil);
            end
            else
               btnRemoverDisciplinasClick(nil);
         end;
         for I := 0 to lstDisciplinas.Count - 1 do
            lstDisciplinas.Checked[I] := false;

         // Verifica pré-requisito especial
         LSlPreReqEsp := TStringList.Create;
         try
//            LSlPreReqEsp.Assign(VerificaPreRequisitosEspeciais(LICodAluno, LSCodCurso, LICodDisc, iGradeCurso));
            if LSlPreReqEsp.Count > 0 then
            begin
               LSMsgPreReq := S_DISC_SEM_APROV;
               for I := 0 to LSlPreReqEsp.Count - 1 do
                  LSMsgPreReq := LSMsgPreReq + Format(S_DISC_PRE_REQ_ESP, [LSMsgPreReq, LSlPreReqEsp[I]]);
               if DM.UsuarioLogado.TemPermissao(1019, npEspecial, false) then
               begin
                  if Mensagem(Format(S_CONFIRMA_SEM_PRE_REQ_ESP, [LSMsgPreReq]), 'Confirmação', MSG_ICON_PERGUNTA, Handle) = ID_NO then
                  begin
                     for I := 0 to lstDisciplinas.Count - 1 do
                        lstDisciplinas.Checked[I] := false;
                     lstDisciplinas.Checked[LIItem] := true;
                     btnRemoverDisciplinasClick(nil);
                  end;
               end
               else
                  Mensagem(S_SEM_AUTORIZACAO, 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
            end;
         finally
            FreeAndNil(LSlPreReqEsp);
         end;

         SetLength(ArrayDisciplinas, lstDisciplinas.Items.Count);
         ArrayDisciplinas[lstDisciplinas.Count - 1].turma := LSCodTurma;
         ArrayDisciplinas[lstDisciplinas.Count - 1].curso := LSCodCurso;
         ArrayDisciplinas[lstDisciplinas.Count - 1].disciplina := LICodDisc;

         // Pega a quantidade de créditos
         qrySelectCreditos.ParamByName('CD_TURMA').AsString := LSCodTurma;
         qrySelectCreditos.ParamByName('NR_ANOSEMESTRE').AsInteger := LIAnoSem;
         qrySelectCreditos.ParamByName('CD_DISCIPLINA').AsInteger := LICodDisc;
         qrySelectCreditos.Open;

         ArrayDisciplinas[lstDisciplinas.Count - 1].creditos := qrySelectCreditosNUMEROAULAS.AsCurrency;
         lbCreditos.Caption := Format(S_FMT_CREDITOS, [total_creditos]);
         qrySelectCreditos.Close; 
      end
      else
         Mensagem(S_ORIENTACAO, Application.Title, MB_OK + MB_ICONSTOP, Handle);
end;

procedure TfrmMatricular.btnRemoverDisciplinasClick(Sender: TObject);
var
 i : integer;
 y : Integer;
begin
   { Procurar por todas as disciplinas marcadas e apagá-las }

   ListaHorarios.Clear();

   for i := lstDisciplinas.Items.Count -1 downto 0 do
   Begin
       if lstDisciplinas.Checked[i] then
       Begin
           lstDisciplinas.Items.Delete(i);

           for y := i to Length(ArrayDisciplinas)-2 do
           Begin
              ArrayDisciplinas[y] := ArrayDisciplinas[y+1]
           End;

           SetLength(ArrayDisciplinas, lstDisciplinas.Items.Count );

       End;

   End;

   lbCreditos.Caption := 'Número de Créditos: ' + CurrToStr(total_creditos);

   // Carregar novamente os horários

   For i := 0 to Length(ArrayDisciplinas)-1 do Begin

      qrySelectHorarios.ParamByName('NR_ANOSEMESTRE').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      qrySelectHorarios.ParamByName('CD_TURMA').AsString := ArrayDisciplinas[i].turma;
      qrySelectHorarios.ParamByName('CD_DISCIPLINA').AsInteger := ArrayDisciplinas[i].disciplina;
      qrySelectHorarios.Open;
      
      while not qrySelectHorarios.Eof do begin
          ListaHorarios.Add( qrySelectHorarios.FieldByName('horario').AsString );
          qrySelectHorarios.Next();
      end;
      qrySelectHorarios.Close;
   End;

end;

function TfrmMatricular.total_creditos: Currency;
var
   i : integer;
   soma : Currency;
begin
   soma := 0;

   For i := 0 to Length(ArrayDisciplinas)-1 do
   Begin
       soma := soma + ArrayDisciplinas[i].creditos;
   End;

   result := soma;

end;

procedure TfrmMatricular.InserirDisciplinas;
Var
   n : Integer;
begin
  { Inserir as Disciplinas na FichaIndividual }

  For n := 0 to Length(ArrayDisciplinas)- 1 do
  Begin
    try
    
        qryMatricularGrade.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
        qryMatricularGrade.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
        qryMatricularGrade.ParamByName('disciplina').AsInteger := arrayDisciplinas[n].disciplina;
        qryMatricularGrade.ParamByName('turmamatricula').AsString := tblMatriculasTurma.AsString;
        qryMatricularGrade.ParamByName('situacao').AsInteger := tblMatriculasSituacao.AsInteger;
        qryMatricularGrade.ParamByName('turma').AsString := ArrayDisciplinas[n].turma;
        qryMatricularGrade.ExecSQL;

        DM.callProcedure('CALL INICIAR_MATRICULA ( ' +
           tblMatriculasAnoSemestre.AsString + ', ' +
           QuotedStr(ArrayDisciplinas[n].turma) + ', ' +
           IntToStr(arrayDisciplinas[n].disciplina) + ', ' +
           tblMatriculasCodigoAluno.AsString + ')',
           False
        );

    except
    end;

  End;


end;

function TfrmMatricular.IsBloquearDataVencto: boolean;
begin
   LIDiaVencto := 0;
   Result := DM.variavel_parametro('agrupar_mensalidades_proximo_mes') = 'S';
   if Result then
   begin
      qryBloqDataVencto.Close;
      qryBloqDataVencto.ParamByName('cd_pessoa').AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
      qryBloqDataVencto.Open;
      LIDiaVencto := qryBloqDataVenctonr_dia_vencimento.AsInteger;
      Result := (LIDiaVencto > 0) and (not DM.UsuarioLogado.TemPermissao(1107, npAlterar, False));
   end;
end;

procedure TfrmMatricular.perdoar_mensalidades(codigoaluno, parcela,
  anosemestre: Integer; turma: String; vencimento: TDateTime);
begin

      if DM.FindMotivo( codigoaluno, parcela, vencimento, turma ) then
           DM.tblMotivos.Edit
       else
	        DM.tblMotivos.Insert;

      DM.tblMotivosCodigoAluno.AsInteger   := codigoaluno;
      DM.tblMotivosParcela.AsInteger       := parcela;
      DM.tblMotivosDataMotivo.AsString     := DateToStr(vencimento);
      DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
      DM.tblMotivosMotivo.AsString := 'Matrícula após o inicio da turma';

      DM.tblMotivos.Post;
      DM.tblMotivos.Close;

      DM.tblMensalidades.Close;
      DM.tblMensalidades.SQL.Clear;
      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( '(CodigoAluno = :Codigo) and ' );
      DM.tblMensalidades.SQL.Add( '(Parcela = :Parcela) and ' );
      DM.tblMensalidades.SQL.Add( '(DataVencimento = :Data) and ' );
      DM.tblMensalidades.SQL.Add( '(Turma = :Turma) and ' );
      DM.tblMensalidades.SQL.Add( '(AnoSemestre = :anosemestre)' );
      DM.tblMensalidades.ParamByName('Codigo').AsInteger := codigoaluno;
      DM.tblMensalidades.ParamByName('Parcela').AsInteger := parcela;
      DM.tblMensalidades.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',vencimento);
      DM.tblMensalidades.ParamByName('Turma').AsString := turma;
      Dm.tblMensalidades.ParamByName('anosemestre').AsInteger := anosemestre;
      DM.tblMensalidades.Open;

      DM.tblMensalidades.Edit;

      DM.tblMensalidadesValorDesconto.Value := 0;
      DM.tblMensalidadesValorTotal.Value := 0;
      DM.tblMensalidadesSituacao.Value := 4; { PERDOADO }
      DM.tblMensalidadesDataPagamento.AsString := DateToStr(DataHoje);
      DM.tblMensalidades.Post;

end;

procedure TfrmMatricular.btnConfiguracoesClick(Sender: TObject);
begin

    //Mostra a Janela de configuracao da impressora
    PrincipalForm.Rel.Printer.Prompt();
end;

procedure TfrmMatricular.radPlanoClick(Sender: TObject);
begin
   CalcularVencimento;
end;

procedure TfrmMatricular.sbMarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (chkList.Items.Count-1) do
    chkList.Checked[i] := True;

end;


procedure TfrmMatricular.sbDesmarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (chkList.Items.Count-1) do
    chkList.Checked[i] := False;

end;

procedure TfrmMatricular.sbMarcarNovasClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (lst.Items.Count-1) do
    lst.Checked[i] := True;

end;

procedure TfrmMatricular.sbDesmarcarNovasClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (lst.Items.Count-1) do
    lst.Checked[i] := False;
end;

procedure TfrmMatricular.sbAlterarClick(Sender: TObject);
var
  n : Integer;
begin
   // Apresentar o Painel de Alteração de Valores

   lst.Top := 56;
   lst.Height := 137;

   pnAltera.Visible := True;

   edValorExtra.Text := '0,00';
   edDescontoFixo.Text := '0,00';
   edDescontoEmDia.Text := '0,00';

   For n := 0 to lst.Count - 1 do begin
      if lst.Checked[n] then begin
         edValorExtra.Text := Trim(Format( '%8.2n', [ArrayValorExtra[n]] ));
         edDescontoFixo.Text := Trim(Format( '%8.2n', [ArrayDescontosExtra[n]] ));
         edDescontoEmDia.Text := Trim(Format( '%8.2n', [ArrayDescontos[n]] ));
         Exit;
      end;
   end;

end;

procedure TfrmMatricular.sbConfirmaAlteraClick(Sender: TObject);
var
  n : Integer;
  cDescontoEmDia, cDescontoFixo, cValorExtra : Currency;
begin

    try
      cValorExtra := StrToCurr(edValorExtra.Text);
    except
      cValorExtra := 0;
    end;

    try
      cDescontoEmDia := StrToCurr(edDescontoEmDia.Text);
    except
      cDescontoEmDia := 0;
    end;

    try
      cDescontoFixo := StrToCurr(edDescontoFixo.Text);
    except
      cDescontoFixo := 0;
    end;

    For n := 0 to lst.Count - 1 do begin

       if lst.Checked[n] then begin
          ArrayValorExtra[n] := cValorExtra;
          ArrayDescontos[n] := cDescontoEmDia;
          ArrayDescontosExtra[n] := cDescontoFixo;

          lst.Items.Strings[n] :=
             Format( 'PARCELA %.2d', [ArrayParcelas[n]] ) + ' - ' +
                     FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] ) + ' - ' +
                     Format( '%8.2n', [ArrayValores[n] - ArrayDescontos[n] + ArrayValorExtra[n] - ArrayDescontosExtra[n] ] );
       end;

    end;

    pnAltera.Visible := False;

    lst.Top := 8;
    lst.Height := 185;

end;

procedure TfrmMatricular.sbCancelaAlteraClick(Sender: TObject);
begin
    pnAltera.Visible := False;

    lst.Top := 8;
    lst.Height := 185;

end;

procedure TfrmMatricular.edValorExtraKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      SelectNext(Sender As TWinControl, True, True);
      Key := #0;
   end;

   if key = '.' then begin
      key := ',';
   end;

   if not (Key in ['0'..'9',#8,',']) then begin
      Key := #0;
      exit;
   end;

end;

end.



