unit uReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Mask, Grids, DBGrids, Db, ZConnection, DBCtrls,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ucrpe32,
  checklst, Buttons, ToolWin, Menus, ZSqlUpdate, uUsuario, uMensagem, DBClient,
  DateUtils;

const
   DESCONTO_CONDICIONAL = 1;
   DESCONTO_FIXO = 2;

   TIPO_DESCONTO_SOMA = 0;
   TIPO_DESCONTO_PROPORCIONAl = 1;
   TIPO_DESCONTO_SOBREPOR = 2;  

type
   TMatriculaCurso = packed record
      Grade: Integer;
      AnoSemGrade: Integer;
      AnoSemIngresso: Integer;
      Ingresso: Integer;
      Situacao: Integer;
      Curso: string;
      Turno: string;
   end;

   PMatriculaCurso = ^TMatriculaCurso;

  TfrmReserva = class(TForm)
    qryReservar: TUMZQuery;
    tblPlanos: TUMZQuery;
    dtcPlanos: TDataSource;
    tblItensPagamento: TUMZQuery;
    Bevel1: TBevel;
    paCabecalho: TPanel;
    Bevel2: TBevel;
    ToolBar1: TToolBar;
    btnGerar: TToolButton;
    tbSeparador1: TToolButton;
    btnExcluir: TToolButton;
    tbSeparador2: TToolButton;
    btnRequerimentos: TToolButton;
    tbSeparador3: TToolButton;
    btnContratos: TToolButton;
    tbSeparador4: TToolButton;
    btnFechar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    xMatriculas: TUMZQuery;
    qryInsert: TUMZQuery;
    pmQtd: TPopupMenu;
    qryBloqDataVencto: TUMZQuery;
    qryBloqDataVenctonr_dia_vencimento: TLargeintField;
    qryMatriculaCurso: TUMZQuery;
    qryMatriculaCursoCD_MATRICULA_CURSO: TLargeintField;
    qryMatriculaCursoCD_PESSOA: TIntegerField;
    qryMatriculaCursoNR_MATRICULA: TStringField;
    qryMatriculaCursoCD_CURSO: TStringField;
    qryMatriculaCursoCD_GRADE: TLargeintField;
    qryMatriculaCursoNR_ANOSEM_GRADE: TLargeintField;
    qryMatriculaCursoNR_ANOSEM_INGRESSO: TLargeintField;
    qryMatriculaCursoCD_TURNO: TStringField;
    qryMatriculaCursoDT_INGRESSO: TDateTimeField;
    qryMatriculaCursoCD_INGRESSO: TLargeintField;
    qryMatriculaCursoCD_SITUACAO: TLargeintField;
    updMatriculaCurso: TZUpdateSQL;
    Panel1: TPanel;
    lstAlunos: TCheckListBox;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Panel2: TPanel;
    UpDown1: TUpDown;
    txtAnoSemestreDe: TMaskEdit;
    Label2: TLabel;
    btnTurmas: TSpeedButton;
    txtTurmaDe: TEdit;
    lbTurma: TLabel;
    lbTituloOrigem: TLabel;
    Label7: TLabel;
    Bevel5: TBevel;
    pnDestino: TPanel;
    Panel4: TPanel;
    Label9: TLabel;
    cbPlanos: TComboBox;
    Label8: TLabel;
    txtTurmaPara: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    txtAnoSemestrePara: TMaskEdit;
    UpDown2: TUpDown;
    Label4: TLabel;
    Label1: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    lst: TListBox;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    lbAlunos: TLabel;
    qryTiposTituloDesc: TUMZReadOnlyQuery;
    qryTiposTituloDescCD_DESCONTO_PESSOA: TIntegerField;
    qryTiposTituloDescCD_TIPO_TITULO: TSmallintField;
    qryTiposTituloDescCD_COLIGADA: TSmallintField;
    qryProximaTurma: TUMZQuery;
    qryProximaTurmacd_proxima_turma: TStringField;
    qryDadosProxTurma: TUMZQuery;
    qryDadosProxTurmaturno: TStringField;
    qryDadosProxTurmacurso: TStringField;
    qryDadosProxTurmacodigo: TStringField;
    qryDadosProxTurmaanosemestre: TIntegerField;
    qryDivisaoProgramada: TUMZReadOnlyQuery;
    cbForcarMatriculaPreRequisito: TCheckBox;
    qryUpdatePagamento: TUMZQuery;
    qryDescontoProgFixo: TUMZReadOnlyQuery;
    cdsParcelas: TClientDataSet;
    cdsParcelasCD_TIPO_TITULO: TIntegerField;
    cdsParcelasDS_TIPO_TITULO: TStringField;
    cdsParcelasNR_PARCELA: TIntegerField;
    cdsParcelasNR_CREDITOS: TFloatField;
    cdsParcelasDT_VENCTO: TDateField;
    cdsParcelasVL_BRUTO: TCurrencyField;
    cdsParcelasVL_DESCONTO: TCurrencyField;
    cdsParcelasVL_DESC_EXTRA: TCurrencyField;
    cdsParcelasVL_EXTRA: TCurrencyField;
    cdsParcelasCD_RESPONSAVEL: TIntegerField;
    cdsParcelasNM_RESPONSAVEL: TStringField;
    cdsParcelasSN_DIVISIVEL: TBooleanField;
    cdsParcelasSN_RECIBO_IMP: TBooleanField;
    cdsParcelasSN_GERAR: TBooleanField;
    cdsParcelasSN_PERDOAR: TBooleanField;
    cdsParcelasCD_CONTA: TIntegerField;
    cdsParcelasPtrItemPlano: TIntegerField;
    cdsParcelasCD_ACAO_MOVIMENTO: TLargeintField;
    cdsParcelasCD_DESC_CONDICIONAL: TLargeintField;
    cdsParcelasVENC_ATUAL: TBooleanField;
    cdsParcelasSN_DIVIDIDO: TBooleanField;
    cdsParcelasVL_CREDITO: TCurrencyField;
    cdsParcelasIDX_PARCELA: TIntegerField;
    cdsDescontos: TClientDataSet;
    cdsDescontosVL_DESCONTO: TCurrencyField;
    cdsDescontosCD_ACAO_MOVIMENTO: TIntegerField;
    cdsDescontosCD_TIPO_DESCONTO: TIntegerField;
    cdsDescontosCD_TIPO_COMPORTAMENTO: TIntegerField;
    cdsDescontosDS_OBSERVACAO: TStringField;
    cdsDescontosIDX_PARCELA: TIntegerField;
    cdsDescontosSN_DESCONTO_PLANO: TIntegerField;
    qryDescontoProgCondicional: TUMZReadOnlyQuery;
    qryAcoesMovimentoFixo: TUMZQuery;
    qryAcoesMovimentoCondicional: TUMZQuery;
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure cbPlanosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaDeKeyPress(Sender: TObject; var Key: Char);
    procedure txtTurmaDeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure txtTurmaParaExit(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRequerimentosClick(Sender: TObject);
    procedure btnContratosClick(Sender: TObject);
    procedure Filtra;
    procedure ZerarArray;
    procedure txtTurmaParaKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure GerarMensalidades;
    procedure dtcPlanosDataChange(Sender: TObject; Field: TField);
    procedure btnTurmasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure txtAnoSemestreDeKeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
  private
    FMatriculaCurso: PMatriculaCurso;
    strCursoPara : String;
    nrIdxProxParcela: Integer;

    ArrayValores : Array[0..100] of Currency;
    ArrayDescontos : Array[0..100] of Currency;
    ArrayDescontosExtra : Array[0..100] of Currency;
    ArrayDatas : Array[0..100] of TDateTime;
    ArrayParcelas : Array[0..100] of Integer;
    ArrayTipoParcela : Array[0..100] of Integer;
    ArrayPlanoContas : Array[0..100] of Integer;
    ArrayDescricaoTipo : Array[0..100] of String;
    ArrayValorExtra : Array[0..100] of Currency;
    ArrayNr_Credito :  ARRAY[0..100] of Currency;

    ArraySN_Credito :  ARRAY[0..100] of Char;
    ArrayValorCredito : Array[0..100] of Real;
    ArrayItemPlano : ARRAY[0..100] of Integer;

    ArrayDescontosPlano : Array[0..100] of Currency;
    ArrayDescontosExtraPlano : Array[0..100] of Currency;

    ArrayCodMensalidade: TStringList;


    lngPlano : Longint; { VARIAVEL PARA DESIGNAR PLANO DE DESCONTO }

    slPlanos : TStringList;
    slAlunos : TStringList;

    snTelaExcluirReserva : Boolean;
    procedure DividirAcoesMovimentoCondicional(codigoMensalidade,
      codigoMensalidadeDividida: Integer; indicePercentual,
      descontoCondicional: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
    procedure DividirAcoesMovimentoFixo(codigoMensalidade,
      codigoMensalidadeDividida: Integer; indicePercentual,
      descontoFixo: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
    procedure InserirParcelaAluno(indicePercentual: Currency;
      qyDadosMensalidade: TUMZQuery);
    procedure InserirParcelaResponsavel(indicePercentual: Currency; qyDadosMensalidade: TUMZQuery);
    procedure atualizarBaixaPorDesconto(cd_mensalidade: Integer;
      MensDataBaixa: String);
    procedure gerarAcoesMovimento(cd_mensalidade: Integer; idxParcela: String);
    function GetDescontoCondicionalPlanoPagamento(
      idxParcela: Integer): Currency;
    procedure AplicaDescontoCondicionalProgramado;
    function GetNrIdxProxParcela: Integer;
    procedure AplicaDescontoFixoProgramado;
    procedure DivisaoTitulo(iMensalidade: Integer);

    Procedure CalcularVencimento;

    function GeraMatriculaCurso(const Pessoa: Integer): Integer;

    procedure MostrarAlunos();
    procedure MostrarPlanos();
    procedure CarregarProximaTurma();

    { Private declarations }
  public
    { Public declarations }
    iAcaoDesconto : Integer;
    FIndexParcelaResp: Cardinal;

    Procedure PrepararTelaReserva(ExcluirReserva : Boolean);
    
    function total_creditos : double;

  end;

var
  frmReserva: TfrmReserva;

implementation

uses
   uFSelecionarTurma, uDM, Main, uMatriculas, uProcessando, uClassMovimento,
   uFuncoesGerais, UZDbcFuncs, ZDbcIntfs, uUMNucleo;

{$R *.DFM}


procedure TfrmReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmReserva.FormCreate(Sender: TObject);
begin
   New(FMatriculaCurso);
end;

procedure TfrmReserva.FormDestroy(Sender: TObject);
begin
   Dispose(FMatriculaCurso);
end;

procedure TfrmReserva.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnGerarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil ); 
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmReserva.txtTurmaDeKeyPress(Sender: TObject; var Key: Char);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   if Key <> #13 then Exit;

   if txtTurmaDe.Text = '' then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

      if not resultado_filtro.filtrado then Exit;

      txtTurmaDe.Text := resultado_filtro.cd_turma;
      txtAnoSemestreDe.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;

   SelectNext( TWinControl( Sender ), True, True );
   Key := #0;
end;

procedure TfrmReserva.txtTurmaDeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmReserva.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReserva.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestreDe.text := DM.incrementar_ano_semestre(txtAnoSemestreDe.Text);
  end
  else
  begin
     txtAnoSemestreDe.text := DM.decrementar_ano_semestre(txtAnoSemestreDe.Text);
  end;

end;

procedure TfrmReserva.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestrePara.text := DM.incrementar_ano_semestre(txtAnoSemestrePara.Text);
  end
  else
  begin
     txtAnoSemestrePara.text := DM.decrementar_ano_semestre(txtAnoSemestrePara.Text);
  end;

  MostrarPlanos();

end;

procedure TfrmReserva.ZerarArray;
var
   i: integer;
begin
   for I := 0 to 100 do
   begin
      ArrayValores[i]:=0;
      ArrayDescontos[i]:=0;
      ArrayDescontosExtra[i]:=0;
      ArrayDatas[i]:=0;
      ArrayParcelas[i] := 0;
      ArrayTipoParcela[i] := 0;
      ArrayPlanoContas[i] := 0;
      ArrayDescricaoTipo[i] := '';
      ArrayValorExtra[i] := 0;
      ArrayNr_Credito[i] := 0;
      ArraySN_Credito[i] := #0;
      ArrayValorCredito[i] := 0;
      ArrayItemPlano[i] := 0;
      ArrayDescontosPlano[i] := 0;
      ArrayDescontosExtraPlano[i] := 0;

   end;
end;

procedure TfrmReserva.txtTurmaParaExit(Sender: TObject);
begin

  if txtTurmaPara.Text <> '' then
  begin
    DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );
    strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
  end;

  MostrarPlanos()
end;

procedure TfrmReserva.btnGerarClick(Sender: TObject);
const
   SSQLGrade =
      'SELECT G.CD_GRADE, G.NR_ANO_INICIAL FROM GRADES G JOIN TURMAS T ON ' +
      '(G.CD_GRADE = T.CD_GRADE) AND (G.CD_CURSO = T.CURSO) WHERE T.CODIGO = ? ' +
      'AND G.SN_ATIVO = ''S''';

   SSQLProcuraMatriculaCurso =
      'SELECT CD_MATRICULA_CURSO, CD_SITUACAO FROM MATRICULAS_CURSO WHERE CD_PESSOA = ? AND CD_CURSO = ?';

   SMsgSemGrade =
      'Não foi configurada a grade curricular para o curso selecionado. Não é possível prosseguir.';
Var
   qryGetTurma,
   qryGetGrade: TUMZQuery;

   lngAux: Longint;

   iCodMensa, n, i,
   i2,
   iCont,
   MatriculaCurso: Integer;
   
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   NovaMatricula: Boolean;

   avisoAluno,
   avisoGeral,
   sMsg: String;
   
   parametros: TParamsIni;
begin
  if not DM.UsuarioLogado.TemPermissao( 1011, npIncluir, True ) then Exit;

  dm.CriarConsulta(qryGetTurma);
  qryGetTurma.SQL.Text := '    '+
   ' SELECT                    '+
   '   cd_grade                '+
   ' FROM                      '+
   '   turmas                  '+
   ' WHERE                     '+
   '	codigo = :codigo         '+
	'  AND anosemestre = :anosemestre ';


  if (Trim(txtTurmaDe.Text) = '') then begin
      MessageDlg( 'Selecione a turma de origem.', mtInformation,  [mbOK], -1 );
      Exit
  end;

  if (Trim(txtTurmaPara.Text) = '') then begin
      MessageDlg( 'Selecione a turma de destino.', mtInformation,  [mbOK], -1  );
  end;

  if (txtAnoSemestreDe.Text = txtAnoSemestrePara.Text) then begin
      if MessageDlg( 'Atenção' + CHR(13) + CHR(13) +
      'Você selecionou o mesmo ano/semestre de origem e destino.' + CHR(13) +
      'Tem certeza que deseja gerar as reservas para o mesmo ano/semestre?' 
      ,  mtConfirmation, [mbYes, mbNo],  -1, mbNo) = mrNo then exit;
  end;

  sMsg := 'Confirmação: ' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Você está solicitando a reserva de vaga para os alunos ativos selecionados ' + CHR(13) + CHR(13);
  sMsg := sMsg + 'DA TURMA: ' + txtTurmaDe.Text + ' (' + txtAnoSemestreDe.Text + ')' + CHR(13);
  sMsg := sMsg + 'PARA A TURMA: ' + txtTurmaPara.Text + ' (' + txtAnoSemestrePara.Text + ')' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Deseja continuar? ';

  if MessageDlg( sMsg, mtConfirmation, [mbYes, mbNo],  -1, mbNo) = mrNo then Exit;

  // Fazer a confirmação quando não selecionou nenhuma parcela;

  { Filtrar a tabela de Departamentos e Cursos }
  DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );

  strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;

  iCont := 0 ;

  for i := 0 to lstAlunos.Count - 1 do begin
     if lstAlunos.Checked[i] then begin
        INC(iCont);
     end;
  end;

  if iCont <= 0 Then
  Begin
     Mensagem( 'Você precisa selecionar ao menos um aluno para efetuar a geração da reserva.', Application.Title,  MB_OK + MB_ICONWARNING);
     Exit;
  End;

  lngAux := 0;

  frmProcessando.Bar.Max := iCont;
  frmProcessando.Show;

  frmProcessando.lblRegistros.Caption := 'Registros: 1 de ' + IntToStr( iCont );
  frmProcessando.Bar.Position := 1;
  Application.ProcessMessages;

  xMatriculas.First;

  // Pegar os dados do curso e grade somente do primeiro registro

  if xMatriculas.FieldByName('CURSO').AsString <> strCursoPara then
   begin
      NovaMatricula := True;
      Stmt := PrepareStatement(SSQLGrade);
      Stmt.SetString(1, txtTurmaPara.Text);
      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
         begin
            FMatriculaCurso^.Grade := ResultSet.GetIntByName('CD_GRADE');
            FMatriculaCurso^.AnoSemGrade := ResultSet.GetIntByName('NR_ANO_INICIAL');
            FMatriculaCurso^.AnoSemIngresso := DM.GetAnoSemestreAtual;
         end
         else
         begin
            MessageBox(Handle, PChar(SMsgSemGrade), PChar('Atenção'), MB_ICONINFORMATION or MB_OK);
            Exit;
         end;
      finally
         ResultSet.Close;
      end;
   end
   else
      NovaMatricula := False;

  // fim dados do curso e grade

  avisoGeral := '';

  // Percorrer os alunos marcados na lista

  i2:= 1;

  for i := 0 to lstAlunos.Count - 1 do
  begin

     if lstAlunos.Checked[i] then
     begin
         avisoAluno := '';

         frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(i2) + ' de ' + IntToStr( iCont );
         frmProcessando.Bar.Position := i2;
         Application.ProcessMessages;

         INC(i2);

        // Posicionar no aluno que será rematriculado
        xMatriculas.GotoBookmark(slAlunos.Objects[i]);

        try
            if NovaMatricula then
            begin
               // Verifica se o aluno já possui matrícula no curso selecionado

               Stmt := PrepareStatement(SSQLProcuraMatriculaCurso);
               try
                  Stmt.SetResultSetConcurrency(rcUpdatable);
                  Stmt.SetInt(1, xMatriculas.FieldByName('CODIGOALUNO').AsInteger);
                  Stmt.SetString(2, strCursoPara);
                  ResultSet := Stmt.ExecuteQueryPrepared;
                  try
                     if ResultSet.Next then
                     begin
                        MatriculaCurso := ResultSet.GetInt(1);
                        if ResultSet.GetInt(2) <> 1 then
                        begin
                           ResultSet.UpdateInt(2, 1);
                           ResultSet.UpdateRow;
                        end;
                     end
                     else
                        MatriculaCurso := GeraMatriculaCurso(xMatriculas.FieldByName('CODIGOALUNO').AsInteger);
                  finally
                     ResultSet.Close;
                  end;
               finally
                  Stmt.Close;
               end;
            end
            else
               MatriculaCurso := xMatriculas.FieldByName('cd_matricula_curso').AsInteger;

            { Tentar registrar a matrícula }
            qryReservar.ParamByName('AnoSemestre').AsInteger    := StrToInt(txtAnoSemestrePara.Text);
            qryReservar.ParamByName('Turma').AsString           := txtTurmaPara.Text;
            qryReservar.ParamByName('CodigoAluno').AsInteger    := xMatriculas.FieldByName('codigoaluno').AsInteger;
            qryReservar.ParamByName('Curso').AsString           := strCursoPara;

            if DM.variavel_parametro('data_emissao_matricula_ativacao') = 'S' then
            begin
               qryReservar.ParamByName('DataEmissao').Clear
            end
            else
            begin
               qryReservar.ParamByName('DataEmissao').AsDateTime := DataHoje;
            end;

            qryReservar.ParamByName('Usuario').AsString         := DM.sLogin;
            qryReservar.ParamByName('PlanoPagamento').AsInteger := tblPlanos.FieldByName('cd_plano').AsInteger;
            qryreservar.ParamByName('cd_matricula_curso').AsInteger := MatriculaCurso;
            qryreservar.ParamByName('cd_ingresso').AsInteger := GetFormaIngresso(2);
            qryReservar.ParamByName('cd_pessoa_matriculou').AsInteger := DM.iCdPessoaLogado;
            qryReservar.ParamByName('sn_matricula_internet').AsInteger := 0;

            qryReservar.ExecSQL;

            qryBloqDataVencto.Close();
            qryBloqDataVencto.ParamByName('cd_pessoa').AsInteger :=  xMatriculas.FieldByName('codigoaluno').AsInteger;
            qryBloqDataVencto.Open();

            GerarMensalidades;

            qryGetTurma.Close;
            qryGetTurma.ParamByName('codigo').AsString           :=  txtTurmaPara.Text;
            qryGetTurma.ParamByName('anosemestre').AsInteger     := StrToInt(txtAnoSemestrePara.Text);
            qryGetTurma.open;
            avisoAluno :=
               DM.MatricularGrade(
                  xMatriculas.FieldByName('CodigoAluno').AsInteger,
                  txtTurmaPara.Text,
                  StrToInt(txtAnoSemestrePara.Text),
                  qryGetTurma.FieldByName('cd_grade').AsString,
                  cbForcarMatriculaPreRequisito.Checked
               );

            if (Length(avisoAluno) > 0) then
            begin
               avisoGeral := avisoGeral + avisoAluno;
            end;

            // Não existia o recalculo nesta tela, deste modo quando o aluno tinha alguma restrição,
            // o valor da mensalidade não seria mais cheio, havendo a necessidade de recalculo dos créditos
            DM.recalcular_creditos_financeiros(
               xMatriculas.FieldByName('codigoaluno').AsInteger,
               txtTurmaPara.Text,
               StrToInt(txtAnoSemestrePara.Text),
               false,
               false);

            FIndexParcelaResp := 0;

            for n := 0 to ArrayCodMensalidade.Count-1 do
            begin
               iCodMensa := StrToInt(ArrayCodMensalidade[n]);
               DivisaoTitulo(iCodMensa);
            end;

            DM.setLog(1011, 'Inclusao', xMatriculas.FieldByName('CodigoAluno').AsString + ';' +
                                        txtTurmaDe.Text + ';' +
                                        txtAnoSemestreDe.Text, DM.iColigadaMatriz, 'Reserva efetuada para ' + txtTurmaPara.Text + ' ' + txtAnoSemestrePara.Text);



        except
            { Não conseguiu registrar a matrícula para este aluno }

        end;


     end;


  End;

  if (Length(avisoGeral) > 0) then
  begin
     parametros.titulo := 'Atenção';
     parametros.opcoes := (BT_OK + MB_ICONWARNING);
     parametros.mensagens.msgPrincipal := avisoGeral;
     parametros.mensagens.msgTopo := 'É recomendável verificar algumas situações que ocorreram com os alunos descritos abaixo:';
     parametros.mensagens.msgRodape := '';
     parametros.dimensao.altura := 350;
     parametros.dimensao.largura := 600;

     TfrmMensagem.create(Self, parametros).ShowModal;
  end;

  DM.setLog(1011, 'Inclusao', txtTurmaDe.Text + ';' + txtAnoSemestreDe.Text, DM.iColigadaMatriz, 'Reserva efetuada para ' + txtTurmaPara.Text + ' ' + txtAnoSemestrePara.Text);

  frmProcessando.Close;

  Mensagem( 'Reservas efetuadas com sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION );

end;

procedure TfrmReserva.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   { Definir o Ano/Semestre Atual }
   txtAnoSemestreDe.text := IntToStr(ano_semestre);
   txtAnoSemestrePara.Text := IntToStr(ano_semestre);

   {
      Inicializa o número de indice da próxima parcela como sendo 1
      Esse nrIdxProxParcela é um número que será utilizado para linkar a parcela gerada no clientDataSet cdsParcelas
      com todos os descontos aplicados a essa parcela (que gerarão fin_mov_cr) que estão no clientDataSet cdsDescontos
      A variável é incrementada sempre que seu valor atual é pego
   }
   nrIdxProxParcela := 1;

   txtAnoSemestreDe.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   txtAnoSemestrePara.Visible := txtAnoSemestreDe.Visible;
   Label2.Visible := txtAnoSemestreDe.Visible;
   Label4.Visible := txtAnoSemestreDe.Visible;
   UpDown1.Visible := txtAnoSemestreDe.Visible;
   UpDown2.Visible := txtAnoSemestreDe.Visible;
   cbForcarMatriculaPreRequisito.Enabled := DM.UsuarioLogado.TemPermissao( 0, 'Academico.MatricularPreRequisito', npEspecial, False );
end;

procedure TfrmReserva.btnRequerimentosClick(Sender: TObject);
var
   sAux: string;
begin
  if Mensagem( 'Deseja imprimir os requerimentos de matrícula da turma reservada?',
               Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;


  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS  C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('turma').AsString := txtTurmaPara.Text;
  DM.tblCursosTurma.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestrePara.Text);
  DM.tblCursosTurma.Open;

  if Dm.tblCursosTurmaDS_REQUERIMENTO.AsString = '' Then
  Begin
     Mensagem( 'Não existe requerimento definido para este curso.',
            Application.Title, MB_OK );
     Exit;
  End;

  sAux := ' {matriculas.anosemestre} = ' + txtAnoSemestrePara.Text + ' and ';
  sAux := sAux + ' {matriculas.turma} = "' + txtTurmaPara.Text + '"';

  PrincipalForm.ImprimeRpt(Self, Dm.tblCursosTurmaDS_REQUERIMENTO.AsString, -1, sAux, '', nil, nil, nil,nil, True, False, nil, True);

end;

procedure TfrmReserva.btnContratosClick(Sender: TObject);
var
   sAux: string;
begin
  if Mensagem( 'Deseja imprimir os contratos de matrícula da turma reservada?',
               Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS  C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('turma').AsString := txtTurmaPara.Text;
  DM.tblCursosTurma.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestrePara.Text);
  DM.tblCursosTurma.Open;

  if Dm.tblCursosTurmaDS_CONTRATO.AsString = '' Then
  Begin
     Mensagem( 'Não existe contrato definido para este curso.', Application.Title, MB_OK );
     Exit;
  End;

  sAux := ' {matriculas.anosemestre} = ' + txtAnoSemestrePara.Text + ' and ';
  sAux := sAux + ' {matriculas.turma} = ' + QuotedStr(txtTurmaPara.Text) + '';

  PrincipalForm.Rel.PrintOptions.Copies := 2;

  PrincipalForm.ImprimeRpt(Self, DM.tblCursosTurmaDS_CONTRATO.AsString, -1, sAux, '', nil, nil, nil,nil, True, False, nil, True);

end;

procedure TfrmReserva.Filtra;
begin

  tblPlanos.Close;
  tblPlanos.ParamByName('turma').AsString := txtTurmaPara.Text;
  tblPlanos.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestrePara.Text);
  tblPlanos.Open;

  FreeAndNil(slPlanos);

  slPlanos := TStringList.Create();

  cbPlanos.Clear();
  // Preencher a combo dos planos
  if not tblPlanos.EOF then begin
     tblPlanos.First();

     while not tblPlanos.EOF do begin
       slPlanos.AddObject(tblPlanos.FieldByName('cd_plano').AsString, TObject(tblPlanos.GetBookmark));
       cbPlanos.Items.Add(tblPlanos.FieldByName('ds_plano').AsString);
       tblPlanos.Next();
     end;

     // Selecionar o primeiro plano encontrado
     cbPlanos.ItemIndex := 0;
     tblPlanos.First();
  end;

  CalcularVencimento;
end;

procedure TfrmReserva.txtTurmaParaKeyPress(Sender: TObject; var Key: Char);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   if Key <> #13 then Exit;

   if txtTurmaPara.Text = '' then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

      if not resultado_filtro.filtrado then Exit;

      txtTurmaPara.Text := resultado_filtro.cd_turma;
      txtAnoSemestrePara.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end
   else
   begin
      DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );
      strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
   end;

   SelectNext( TWinControl( Sender ), True, True );
   Key := #0;
   MostrarPlanos();
end;


procedure TfrmReserva.btnExcluirClick(Sender: TObject);
const
   SCaptionWarn = 'Atenção';
   SMsgAlunosNaoExcluidos = ''
      + '%d reservas não foram excluídas pois não foi possível remover as '
      + 'parcelas do financeiro.'#13'%s'#13'As demais reservas foram '
      + 'excluídas com sucesso';
var
   AlunosNaoExcluidos: TStrings;
   sMsg : String;
   i, i2 : Integer;
   iCont : Integer;

   function PodeExcluir(const PessoaId: Integer;
      const AnoSemestre, TurmaId: AnsiString): Boolean;
   const
      SSQLSelectSearchMens = ''
         + 'SELECT '
         + '	p.cd_pessoa, '
         + '	p.nm_pessoa '
         + 'FROM '
         + '	pessoas p '
         + 'WHERE '
         + '	EXISTS ( '
         + '		SELECT '
         + '			m.codigoaluno '
         + '		FROM '
         + '			matriculas m '
         + '				JOIN mensalidades e ON '
         + '					(m.codigoaluno = e.codigoaluno) AND '
         + '					(m.turma = e.turma) AND '
         + '					(m.anosemestre = e.anosemestre) '
         + '		WHERE '
         + '			p.cd_pessoa = m.codigoaluno AND '
         + '			m.codigoaluno = ? AND '
         + '			m.turma = ? AND '
         + '			m.anosemestre = ? AND '
         + '			m.situacao = 10 '
         + '	) ';
   var
      Stmt: IZPreparedStatement;
      Rs: IZResultSet;
      S: AnsiString;
   begin
      Result := True;

      Stmt := PrepareStatement(SSQLSelectSearchMens);
      try
         Stmt.SetInt(1, PessoaId);
         Stmt.SetString(2, TurmaId);
         Stmt.SetString(3, AnoSemestre);
         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
            begin
               Result := False;
               S := '[' + Rs.GetString(1) + '] ' + Rs.GetString(2);
               AlunosNaoExcluidos.Add(S); 
            end;
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;
begin

  if not DM.UsuarioLogado.TemPermissao( 1011, npExcluir, True ) then Exit;

  sMsg := 'Atenção:' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Você está tentando excluir as reservas de vaga dos alunos selecionados ' + CHR(13);
  sMsg := sMsg + 'da Turma: ' + txtTurmaDe.Text + ' (' + txtAnoSemestreDe.Text +  ')' + CHR(13);
  sMsg := sMsg + 'Todas as mensalidades geradas para esta reserva serão excluídas.' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Deseja realmente continuar? ';


  if MessageDlg( sMsg, mtConfirmation, [mbYes, mbNo], -1, mbNo) <> mrYes then Exit;

  iCont := 0 ;

  for i := 0 to lstAlunos.Count - 1 do begin
     if lstAlunos.Checked[i] then begin
        INC(iCont);
     end;
  end;

  if iCont <= 0 Then
  Begin
     Mensagem( 'Você precisa selecionar ao menos um aluno para excluir a reserva.', Application.Title,  MB_OK + MB_ICONWARNING);
     Exit;
  End;

  frmProcessando.Bar.Max := iCont;
  frmProcessando.Show;

  i2 := 1;
  AlunosNaoExcluidos := TStringList.Create;

  for i := 0 to lstAlunos.Count - 1 do begin

     if lstAlunos.Checked[i] then begin

         frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(i2) + ' de ' + IntToStr( iCont );
         frmProcessando.Bar.Position := i2;
         Application.ProcessMessages;

         INC(i2);
     

        // Posicionar no aluno que será rematriculado
        xMatriculas.GotoBookmark(slAlunos.Objects[i]);

        // Excluindo mensalidades na situação de reserva;
        with Dm.qAux1 do begin
            close();
            SQL.Clear;
            SQl.Text := 'DELETE cr.* FROM mensalidades as me ' +
                        ' INNER JOIN fin_mov_cr as cr ON (me.cd_mensalidade = cr.cd_mensalidade) '+
                        ' WHERE me.codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                        '   AND me.turma = "' + txtTurmaDe.Text + '" ' +  
                        '   AND me.anosemestre = ' + txtAnoSemestreDe.Text +
                        '   AND me.situacao = 10 ';
            ExecSQL();
        end;

        with Dm.qAux1 do begin
            close();
            SQL.Clear;
            SQl.Text := ' DELETE FROM mensalidades ' +
                        '  WHERE codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                        '    AND turma = "' + txtTurmaDe.Text + '" ' +
                        '    AND anosemestre = ' + txtAnoSemestreDe.Text +
                        '    AND situacao = 10 ';
            ExecSQL();
        end;

        if PodeExcluir(xMatriculas.FieldByName('codigoaluno').AsInteger,
            txtAnoSemestreDe.Text, txtTurmaDe.Text) then
        begin

           // Excluir fichaindividual em reserva
           with Dm.qAux1 do begin
               close();
               SQL.Clear;
               SQl.Text := ' DELETE FROM fichaindividual ' +
                           '  WHERE codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                           '    AND turmamatricula = "' + txtTurmaDe.Text + '" ' +
                           '    AND anosemestre = ' + txtAnoSemestreDe.Text +
                           '    AND situacao = 10 ';
               ExecSQL();
           end;

           // Excluir fichaindividual em reserva
           with Dm.qAux1 do begin
               close();
               SQL.Clear;
               SQl.Text := ' DELETE FROM matriculas ' +
                           '  WHERE codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                           '    AND turma = "' + txtTurmaDe.Text + '" ' +
                           '    AND anosemestre = ' + txtAnoSemestreDe.Text +
                           '    AND situacao = 10 ';
               ExecSQL();
           end;

           DM.setLog(1011, 'Exclusao', xMatriculas.FieldByName('CodigoAluno').AsString + ';' +
                                           txtTurmaDe.Text + ';' +
                                           txtAnoSemestreDe.Text, DM.iColigadaMatriz, 'Reserva excluida');
        end;

     end;

  end;

  frmProcessando.Close;

   if AlunosNaoExcluidos.Count = 0 then
   begin
      Mensagem( 'As reservas de matrículas foram excluídas com sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION );
   end;

   if AlunosNaoExcluidos.Count > 0 then
   begin
      sMsg := Format(SMsgAlunosNaoExcluidos,
         [AlunosNaoExcluidos.Count, AlunosNaoExcluidos.Text]);
      MessageBox(Handle, PChar(sMsg), SCaptionWarn, MB_ICONWARNING or MB_OK);
   end;

   AlunosNaoExcluidos.Free;
  MostrarAlunos();

end;

function TfrmReserva.GeraMatriculaCurso(const Pessoa: Integer): Integer;
begin
   qryMatriculaCurso.Close;
   qryMatriculaCurso.ParamByName('CD_PESSOA').AsInteger := Pessoa;
   qryMatriculaCurso.Open;
   qryMatriculaCurso.Insert;
   qryMatriculaCursoCD_PESSOA.AsInteger := Pessoa;
   qryMatriculaCursoNR_MATRICULA.AsString := DM.NovoCodMatricula(Pessoa,
      FMatriculaCurso^.Curso, FMatriculaCurso^.AnoSemIngresso,
      FMatriculaCurso^.AnoSemIngresso);
   qryMatriculaCursoCD_CURSO.AsString := FMatriculaCurso^.Curso;
   qryMatriculaCursoCD_GRADE.AsInteger := FMatriculaCurso^.Grade;
   qryMatriculaCursoNR_ANOSEM_GRADE.AsInteger := FMatriculaCurso^.AnoSemGrade;
   qryMatriculaCursoNR_ANOSEM_INGRESSO.AsInteger := FMatriculaCurso^.AnoSemIngresso;
   qryMatriculaCursoCD_TURNO.AsString := FMatriculaCurso^.Turno;
   qryMatriculaCursoCD_SITUACAO.AsInteger := 1;
   qryMatriculaCurso.Post;
   qryMatriculaCurso.Refresh;
   qryMatriculaCurso.Last;
   Result := qryMatriculaCursoCD_MATRICULA_CURSO.AsInteger;
end;

procedure TfrmReserva.GerarMensalidades;
var
   n, iCodMensa: Integer;
   Indice, valorDescontoCondicionalPlano, valorDescontoExtraPlano: Currency;
   AcaoDesconto, AcaoDescontoPadrao, AcaoDescontoCondicionalPadrao: Integer;
   MensDataBaixa: String;
   Movimento: TMovimento;
   ano, mes, dia : Word;
   Vencto: TDateTime;
begin

   // Busca as ações automáticas de desconto fixo e condicional
   AcaoDescontoPadrao := DM.BuscarCodigoAcaoPadrao(11);
   AcaoDescontoCondicionalPadrao := DM.BuscarCodigoAcaoPadrao(24);

   // Cria novamente o array de codigo de mensalidades
   ArrayCodMensalidade := TStringList.Create;

  { Gerar Mensalidades somente para o aluno selecionado
    Percorrer o array de mensalidades e gerar toda as parcelas }
  for n := 0 to lst.Count - 1 do
  begin
      // Zera os clientDataSet de parcelas e descontos do aluno
      cdsParcelas.EmptyDataSet;
      cdsDescontos.EmptyDataSet;

      // Abre o clientDataSet para preparar os valores da parcela 
      cdsParcelas.Insert;

      // Define o index da parcela (que vinculará a parcela com os descontos no clientDataSet - cdsDescontos)
      cdsParcelasIDX_PARCELA.AsInteger := GetNrIdxProxParcela();

      // Calcula os valores da mensalidade (quando plano definido por crédito ou não)
      cdsParcelasVL_BRUTO.AsCurrency := RoundFloat(ArrayValores[n], 2);
      cdsParcelasVL_DESC_EXTRA.AsCurrency := RoundFloat(ArrayDescontosExtraPlano[n], 2);
      cdsParcelasVL_DESCONTO.AsCurrency := RoundFloat(ArrayDescontosPlano[n], 2);
      cdsParcelasVL_EXTRA.AsCurrency := RoundFloat(ArrayValorExtra[n], 2);
      cdsParcelasNR_PARCELA.AsInteger := ArrayParcelas[n];
      cdsParcelasCD_TIPO_TITULO.AsInteger := ArrayTipoParcela[n];

      // Cálcula o valor dos descontos se a mensalidade for por crédito quando o desconto é fixo
      if ArraySN_Credito[n] = 'S' then
      begin
         cdsParcelasVL_DESC_EXTRA.AsCurrency := RoundFloat((cdsParcelasVL_DESC_EXTRA.AsCurrency * cdsParcelasVL_BRUTO.AsCurrency) / ArrayValorCredito[n], 2);
      end;

      // Salva os dados da parcela
      cdsParcelas.Post;

      // Grava os dados da parcela criada original (antes da programação de desconto)
      valorDescontoExtraPlano := cdsParcelasVL_DESC_EXTRA.AsCurrency;

      // Aplica os descontos fixos programados
      AplicaDescontoFixoProgramado;

      // Aplica os descontos condicionais programados
      AplicaDescontoCondicionalProgramado;

      {
         Grava os descontos do plano de pagamento APÓS os descontos programados,
         isso porque o desconto condicional do plano de pagamento sofre influência
         conforme os tipos de descontos programados (soma, sobrepor, proporcional)
      }

      // Grava o desconto FIXO do plano de pagamento (na lista de descontos)
      if ArrayDescontosExtraPlano[n] > 0 then
      begin
         if (not tblPlanos.FieldByName('cd_acao_movimento_desc_fixo').IsNull) AND
            (tblPlanos.FieldByName('cd_acao_movimento_desc_fixo').AsInteger > 0) then
         begin
            AcaoDesconto := tblPlanos.FieldByName('cd_acao_movimento_desc_fixo').AsInteger;
         end else begin
            AcaoDesconto := AcaoDescontoPadrao;
         end;

         cdsDescontos.Insert;
         cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
         cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoExtraPlano;
         cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := AcaoDesconto;
         cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_FIXO;
         cdsDescontosDS_OBSERVACAO.AsString := cdsParcelasDS_TIPO_TITULO.AsString + ' (desconto do plano de pagamento)';
         cdsDescontosSN_DESCONTO_PLANO.AsInteger := 1;
         cdsDescontosCD_TIPO_COMPORTAMENTO.Clear;
         cdsDescontos.Post;
      end;

      // Grava o desconto CONDICIONAL do plano de pagamento (na lista de descontos)
      if cdsParcelasVL_DESCONTO.AsCurrency > 0 then
      begin
         if (not tblPlanos.FieldByName('cd_acao_movimento_desc_cond').IsNull) AND
            (tblPlanos.FieldByName('cd_acao_movimento_desc_cond').AsInteger > 0) then
         begin
            AcaoDesconto := tblPlanos.FieldByName('cd_acao_movimento_desc_cond').AsInteger;
         end else begin
            AcaoDesconto := AcaoDescontoCondicionalPadrao;
         end;

         // Posiciona na última parcela criada para calcular o desconto condicional do plano
         cdsParcelas.Last;
         valorDescontoCondicionalPlano := GetDescontoCondicionalPlanoPagamento(cdsParcelasIDX_PARCELA.AsInteger);

         // Verifica se possui valor do desconto condicional do plano de pagamento
         if valorDescontoCondicionalPlano > 0 then
         begin
            cdsDescontos.Insert;
            cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
            cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoCondicionalPlano;
            cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := AcaoDesconto;
            cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_CONDICIONAL;
            cdsDescontosDS_OBSERVACAO.AsString := cdsParcelasDS_TIPO_TITULO.AsString + ' (desconto do plano de pagamento)';
            cdsDescontosSN_DESCONTO_PLANO.AsInteger := 1;
            cdsDescontosCD_TIPO_COMPORTAMENTO.Clear;
            cdsDescontos.Post;
         end;
      end;

      cdsParcelas.Last;

      if qryBloqDataVenctonr_dia_vencimento.AsInteger > 0 then
      begin
         DecodeDate(ArrayDatas[n], ano, mes, dia);
         Vencto := DataValida(ano, mes, qryBloqDataVenctonr_dia_vencimento.AsInteger);
      end else begin
         Vencto := ArrayDatas[n];
      end;

      iCodMensa := Dm.GerarMensalidade(
         xMatriculas.FieldByName('CodigoAluno').AsInteger,
         ArrayParcelas[n],
         txtTurmaPara.Text,
         RoundFloat(ArrayValores[n], 2),
         0,
         StrToInt(txtAnoSemestrePara.Text),
         Vencto,
         Vencto,
         10, // parcelas reservadas
         DM.tblDeptoCursoTurmaCurso.AsString,
         DM.tblDeptoCursoTurmaDepto.AsInteger,
         0,
         -1,
         cdsParcelasVL_DESCONTO.AsCurrency,
         ArrayNr_Credito[n],
         ArrayDescricaoTipo[n],
         ArrayTipoParcela[n],
         ArrayPlanoContas[n],
         DM.tblDeptoCursoTurmacd_centro.AsInteger,
         cdsParcelasVL_DESC_EXTRA.AsCurrency,
         ArrayValorExtra[n],
         ArraySN_Credito[n],
         ArrayValorCredito[n],
         ArrayItemPlano[n], 10, 0, 0, Dm.tblDeptoCursoTurmacd_coligada.AsInteger, 0, 100, cdsParcelasCD_DESC_CONDICIONAL.AsInteger,
         '', 0, false, false
      );



      // Gerar as ações de movimento dos DESCONTOS da parcela que está sendo gerada,
      // a ação de movimento da parcela foi gerada no momento de geração da parcela
      gerarAcoesMovimento(iCodMensa, cdsParcelasIDX_PARCELA.AsString);

      // Busca a data da baixa da mensalidade
      MensDataBaixa := DM.variavel_parametro('mensalidades_data_baixa');
      MensDataBaixa := Trim(MensDataBaixa);

      // Realiza a atualização da baixa da mensalidade por desconto (quando ela for aplicada)
      atualizarBaixaPorDesconto(iCodMensa, MensDataBaixa);

      // Adiciona o código da mensalidade
      ArrayCodMensalidade.Add(IntToStr(iCodMensa));

   end;

end;

procedure TfrmReserva.InserirParcelaResponsavel(indicePercentual: Currency; qyDadosMensalidade: TUMZQuery);

   function GetDataVencto: TDate;
   var
      Start: TDate;
      Holiday: Boolean;
      Year, Month, NewMonth, Day, DayWeek: Word;
   begin
      Result := qryDivisaoProgramada.FieldByName('DT_VENCTO_INICIAL').AsDateTime;

      if FIndexParcelaResp > 0 then
      begin

         Start := Result;

         Result := IncMonth(Result, FIndexParcelaResp);
         DecodeDate(Result, Year, Month, Day);
         NewMonth := Month;

         DayWeek := DayOfWeek(Result);
         Holiday := DM.getFeriado(Result);

         while (DayWeek in [1, 7]) or Holiday do
         begin

            Result := IncDay(Result, 1);
            DecodeDate(Result, Year, NewMonth, Day);

            if NewMonth <> Month then
               Break;

            DayWeek := DayOfWeek(Result);
            Holiday := DM.getFeriado(Result);
         end;

         if NewMonth <> Month then
         begin

            Result := IncMonth(Start, FIndexParcelaResp);
            DayWeek := DayOfWeek(Result);
            Holiday := DM.getFeriado(Result);

            while (DayWeek in [1, 7]) or Holiday do
            begin

               Result := IncDay(Result, -1);
               DecodeDate(Result, Year, NewMonth, Day);

               if NewMonth <> Month then
                  Break;

               DayWeek := DayOfWeek(Result);
               Holiday := DM.getFeriado(Result);
            end;
         end;

         if NewMonth <> Month then
         begin
            Result := Start;
         end;
      end;

      Inc(FIndexParcelaResp);
   end;

var
   percentualDivisao, valorBruto,
   descontoCondicional, descontoFixo,
   valorCreditos, valorExtra, valorJuros: Currency;
   iCodigoResponsavel, iNovaMensalidade, TipoTituloId: Integer;
   bManterDescontoAluno, bParcelaAluno: Boolean;
   snCredito: Char;
   Vencto: TDate;
begin

   TipoTituloId := qyDadosMensalidade.FieldByName('cd_tipo_titulo').AsInteger;

   // Verifica se a programação de descontos está configurada
   // para alterar o tipo de título das parcelas divididas

   if (qryDivisaoProgramada.FieldByName('SN_ALTERAR_TIPO_TITULO').AsInteger = 1) and
      (not qryDivisaoProgramada.FieldByName('CD_TIPO_TITULO').IsNull) and
      (not qryDivisaoProgramada.FieldByName('CD_COLIGADA_MATRIZ').IsNull) then
   begin

      // Altera o tipo de título da parcela dividida do responsável
      TipoTituloId := qryDivisaoProgramada.FieldByName('CD_TIPO_TITULO').AsInteger;
   end;

   Vencto := qyDadosMensalidade.FieldByName('datavencimento').AsDateTime;

   // Verifica se a programação de descontos está configurada
   // para alterar a data de vencimento das parcelas divididas

   if (qryDivisaoProgramada.FieldByName('SN_ALTERAR_VENCTO').AsInteger = 1) and
      (not qryDivisaoProgramada.FieldByName('DT_VENCTO_INICIAL').IsNull) then
   begin

      // Altera a data de vencimento da parcela dividida do responsável
      Vencto := GetDataVencto;
   end;

   // Define o percentual de divisão do responsável
   percentualDivisao := indicePercentual*100;

   // Define o novo responsável
   iCodigoResponsavel := qryDivisaoProgramada.FieldByName('cd_responsavel').AsInteger;

   {
      Verifica se NÃO deve manter o desconto fixo (e condicional quando não é do plano de pagamento) na parcela do responsavel
      Nesse caso divide o desconto fixo entre o aluno e responsável
   }
   if not (qryDivisaoProgramada.FieldByName('sn_manter_desconto_fixo').AsInteger = 1) then
   begin
      // Divide o desconto condicional
      descontoCondicional := RoundFloat(qyDadosMensalidade.FieldByName('ValorDesconto').AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto fixo
      descontoFixo := RoundFloat(qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto bruto
      valorBruto := RoundFloat(qyDadosMensalidade.FieldByName('valorbruto').AsCurrency * indicePercentual, 2);
   end;

   {
      Verifica se deve manter o desconto fixo (e condicional quando não é do plano de pagamento) na parcela do aluno
      Nesse caso existem duas opções de cálculo, sendo:
      - aplicação do desconto fixo sobre o valor bruto
      - aplicação do desconto fixo sobre o valor liquido
   }
   if (qryDivisaoProgramada.FieldByName('sn_manter_desconto_fixo').AsInteger = 1) then
   begin

      {
         Aplicando o fixo sobre o valor bruto
         Cálculo novo bruto responsavel = Bruto * indice
      }
      if (qryDivisaoProgramada.FieldByName('nr_forma_aplicar_divisao').AsInteger = 1) then
      begin
         valorBruto := RoundFloat(qyDadosMensalidade.FieldByName('valorbruto').AsCurrency*indicePercentual, 2);
      end;

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto responsavel = ((Bruto - Fixo) * indice)
      }
      if (qryDivisaoProgramada.FieldByName('nr_forma_aplicar_divisao').AsInteger = 2) then
      begin

         if qryDivisaoProgramada.FieldByName('SN_DIVIDIR_DESCONTO_CONDICIONAL').AsInteger = 0 then
         begin
            valorBruto :=
               RoundFloat(((qyDadosMensalidade.FieldByName('valorbruto').AsCurrency - qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency)*indicePercentual), 2);
         end;

         if qryDivisaoProgramada.FieldByName('SN_DIVIDIR_DESCONTO_CONDICIONAL').AsInteger = 1 then
         begin
            valorBruto :=
               RoundFloat(((
                  qyDadosMensalidade.FieldByName('valorbruto').AsCurrency -
                  qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency -
                  qyDadosMensalidade.FieldByName('valordesconto').AsCurrency
                  )*indicePercentual), 2);
         end;
      end;

      // Sempre divide o desconto fixo do plano de pagamento
      // Os demais descontos fixos serão mantidos na parcela do aluno
      descontoFixo := RoundFloat(qyDadosMensalidade.FieldByName('vl_desc_fixo_plano').AsCurrency * indicePercentual, 2);
      // Sempre divide o desconto condicional do plano de pagamento
      // Os demais descontos condicionais serão mantidos na parcela do aluno
      descontoCondicional := RoundFloat(qyDadosMensalidade.FieldByName('vl_desc_cond_plano').AsCurrency * indicePercentual, 2);
   end;

   // Divide o valor dos créditos
   valorCreditos := qyDadosMensalidade.FieldByName('vl_credito').AsCurrency * indicePercentual;
   // Divide o valor extra
   valorExtra := RoundFloat(qyDadosMensalidade.FieldByName('ValorExtra').AsCurrency * indicePercentual, 2);
   // Divide o valor juros
   valorJuros := RoundFloat(qyDadosMensalidade.FieldByName('ValorJuros').AsCurrency * indicePercentual, 2);

   snCredito := 'N';
   if qyDadosMensalidade.FieldByName('sn_credito_parcela').AsString = 'S' then
   begin
      snCredito := 'S';
   end;

   {
      Verifica se o valor da bolsa é maior que o valor da parcela do responsável
      Nesse caso ajusta o valor da bolsa para o valor da parcela
      Zera o desconto condicional da parcela
   }
   if descontoFixo >= (valorBruto+valorExtra) then
   begin
      descontoFixo := (valorBruto+valorExtra);
      descontoCondicional := 0;
   end;

   // Cria a parcela do responsável
   iNovaMensalidade := DM.GerarMensalidade(
      xMatriculas.FieldByName('CodigoAluno').AsInteger,
      qyDadosMensalidade.FieldByName('parcela').AsInteger,
      txtTurmaPara.Text, valorBruto, valorJuros, StrToInt(txtAnoSemestrePara.Text),
      Vencto,
      qyDadosMensalidade.FieldByName('dt_competencia').AsDateTime,
      10,
      DM.tblDeptoCursoTurmaCurso.AsString,
      DM.tblDeptoCursoTurmaDepto.AsInteger,
      0,
      -1,
      descontoCondicional,
      qyDadosMensalidade.FieldByName('nr_creditos').AsFloat,
      qyDadosMensalidade.FieldByName('ds_historico').AsString,
      TipoTituloId,
      qyDadosMensalidade.FieldByName('cd_plano_conta').AsInteger,
      qyDadosMensalidade.FieldByName('cd_centro_custo').AsInteger,
      descontoFixo, valorExtra,
      snCredito,
      valorCreditos,
      qyDadosMensalidade.FieldByName('cd_item_plano').AsInteger, 10, 0, iCodigoResponsavel,
      Dm.tblDeptoCursoTurmacd_coligada.AsInteger, 0, percentualDivisao,
      qyDadosMensalidade.FieldByName('cd_desc_condicional').AsInteger,
      qyDadosMensalidade.FieldByName('ds_obs_desc').AsString,
      0, false, false
   );

   {
      Criar as ações de movimento do titulo dividido com base no título selecionado
      As ações criadas são de desconto fixo e desconto condicional
   }
   bManterDescontoAluno := (qryDivisaoProgramada.FieldByName('sn_manter_desconto_fixo').AsInteger = 1);
   bParcelaAluno := False;

   if descontoFixo > 0 then
   begin
      DividirAcoesMovimentoFixo(qyDadosMensalidade.FieldByName('cd_mensalidade').AsInteger, iNovaMensalidade, indicePercentual, descontoFixo, bManterDescontoAluno, bParcelaAluno);
   end;

   if descontoCondicional > 0 then
   begin
      DividirAcoesMovimentoCondicional(qyDadosMensalidade.FieldByName('cd_mensalidade').AsInteger, iNovaMensalidade, indicePercentual, descontoCondicional, bManterDescontoAluno, bParcelaAluno);
   end;

end;

procedure TfrmReserva.InserirParcelaAluno(indicePercentual: Currency; qyDadosMensalidade: TUMZQuery);
var
   percentualDivisao, valorBruto,
   descontoCondicional, descontoFixo,
   valorCreditos, valorExtra, valorJuros: Currency;
   iNovaMensalidade: Integer;
   bManterDescontoAluno, bParcelaAluno: Boolean;
   snCredito: Char;
begin

   // Define o percentual de divisão do responsável
   percentualDivisao := indicePercentual*100;

   // Cálcula o percentual de divisão do responsável
   indicePercentual := 1 - indicePercentual;

   {
      Verifica se NÃO deve manter o desconto fixo (e condicional que não é do plano de pagamento) na parcela do aluno
      Nesse caso divide o desconto fixo entre o aluno e responsável
   }
   if not (qryDivisaoProgramada.FieldByName('sn_manter_desconto_fixo').AsInteger = 1) then
   begin
      // Divide o desconto condicional
      descontoCondicional := qyDadosMensalidade.FieldByName('ValorDesconto').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('ValorDesconto').AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto fixo
      descontoFixo := qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto bruto
      valorBruto := qyDadosMensalidade.FieldByName('valorbruto').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('valorbruto').AsCurrency * indicePercentual, 2);
   end;

   {
      Verifica se deve manter o desconto fixo (e condicional que não é do plano de pagamento) na parcela do aluno
      Nesse caso existem duas opções de cálculo, sendo:
      - aplicação do desconto fixo sobre o valor bruto
      - aplicação do desconto fixo sobre o valor liquido
   }
   if (qryDivisaoProgramada.FieldByName('sn_manter_desconto_fixo').AsInteger = 1) then
   begin

      {
         Aplicando o fixo sobre o valor bruto
         Cálculo novo bruto aluno = Bruto - (Bruto * indice)
      }
      if (qryDivisaoProgramada.FieldByName('nr_forma_aplicar_divisao').AsInteger = 1) then
      begin
         valorBruto := qyDadosMensalidade.FieldByName('valorbruto').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('valorbruto').AsCurrency*indicePercentual, 2);
      end;

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto aluno = Bruto - ((Bruto - Fixo) * indice)
      }
      if (qryDivisaoProgramada.FieldByName('nr_forma_aplicar_divisao').AsInteger = 2) then
      begin

         if qryDivisaoProgramada.FieldByName('SN_DIVIDIR_DESCONTO_CONDICIONAL').AsInteger = 0 then
         begin
            valorBruto :=
               qyDadosMensalidade.FieldByName('valorbruto').AsCurrency -
               RoundFloat(((
                  qyDadosMensalidade.FieldByName('valorbruto').AsCurrency -
                  qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency)
                  *indicePercentual), 2);
         end;

         if qryDivisaoProgramada.FieldByName('SN_DIVIDIR_DESCONTO_CONDICIONAL').AsInteger = 1 then
         begin
            valorBruto :=
               qyDadosMensalidade.FieldByName('valorbruto').AsCurrency -
               RoundFloat(((
                  qyDadosMensalidade.FieldByName('valorbruto').AsCurrency -
                  qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency -
                  qyDadosMensalidade.FieldByName('valordesconto').AsCurrency
                  )*indicePercentual), 2);
         end;
      end;

      // Pega o total de descontos diminui o desconto do plano para descobrir o valor dos descontos fixos que devem ser mantidos no aluno
      descontoFixo := qyDadosMensalidade.FieldByName('DescontoExtra').AsCurrency - qyDadosMensalidade.FieldByName('vl_desc_fixo_plano').AsCurrency;
      // Soma aos descontos que devem ser mantidos no aluno a parte dele da divisão dos fixos do plano
      descontoFixo := descontoFixo + qyDadosMensalidade.FieldByName('vl_desc_fixo_plano').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('vl_desc_fixo_plano').AsCurrency * indicePercentual, 2);

      // Pega o total de descontos diminui o desconto do plano para descobrir o valor dos descontos condicionais que devem ser mantidos no aluno
      descontoCondicional := qyDadosMensalidade.FieldByName('ValorDesconto').AsCurrency - qyDadosMensalidade.FieldByName('vl_desc_cond_plano').AsCurrency;
      // Soma aos descontos que devem ser mantidos no aluno a parte dele da divisão dos condicionais do plano
      descontoCondicional := descontoCondicional + qyDadosMensalidade.FieldByName('vl_desc_cond_plano').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('vl_desc_cond_plano').AsCurrency * indicePercentual, 2);
   end;

   // Divide o valor dos créditos
   valorCreditos := qyDadosMensalidade.FieldByName('vl_credito').AsCurrency - (qyDadosMensalidade.FieldByName('vl_credito').AsCurrency * indicePercentual);
   // Divide o valor extra
   valorExtra := qyDadosMensalidade.FieldByName('ValorExtra').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('ValorExtra').AsCurrency * indicePercentual, 2);
   // Divide o valor juros
   valorJuros := qyDadosMensalidade.FieldByName('ValorJuros').AsCurrency - RoundFloat(qyDadosMensalidade.FieldByName('ValorJuros').AsCurrency * indicePercentual, 2);

   snCredito := 'N';
   if qyDadosMensalidade.FieldByName('sn_credito_parcela').AsString = 'S' then
   begin
      snCredito := 'S';
   end;

   {
      Verifica se o valor da bolsa é maior que o valor da parcela do responsável
      Nesse caso ajusta o valor da bolsa para o valor da parcela
      Zera o desconto condicional da parcela
   }
   if descontoFixo >= (valorBruto+valorExtra) then
   begin
      descontoFixo := (valorBruto+valorExtra);
      descontoCondicional := 0;
   end;

   iNovaMensalidade := DM.GerarMensalidade(
      xMatriculas.FieldByName('CodigoAluno').AsInteger,
      qyDadosMensalidade.FieldByName('parcela').AsInteger,
      txtTurmaPara.Text, valorBruto, valorJuros, StrToInt(txtAnoSemestrePara.Text),
      qyDadosMensalidade.FieldByName('datavencimento').AsDateTime,
      qyDadosMensalidade.FieldByName('dt_competencia').AsDateTime,
      10,
      DM.tblDeptoCursoTurmaCurso.AsString,
      DM.tblDeptoCursoTurmaDepto.AsInteger,
      0,
      -1,
      descontoCondicional,
      qyDadosMensalidade.FieldByName('nr_creditos').AsFloat,
      qyDadosMensalidade.FieldByName('ds_historico').AsString,
      qyDadosMensalidade.FieldByName('cd_tipo_titulo').AsInteger,
      qyDadosMensalidade.FieldByName('cd_plano_conta').AsInteger,
      qyDadosMensalidade.FieldByName('cd_centro_custo').AsInteger,
      descontoFixo, valorExtra,
      snCredito,
      valorCreditos,
      qyDadosMensalidade.FieldByName('cd_item_plano').AsInteger, 10, 0,
      qyDadosMensalidade.FieldByName('cd_resp').AsInteger,
      Dm.tblDeptoCursoTurmacd_coligada.AsInteger, 0, percentualDivisao,
      qyDadosMensalidade.FieldByName('cd_desc_condicional').AsInteger,
      qyDadosMensalidade.FieldByName('ds_obs_desc').AsString,
      0, false, false
   );
   
   {
      Criar as ações de movimento do titulo dividido com base no título selecionado
      As ações criadas são de desconto fixo e desconto condicional
   }
   bManterDescontoAluno := (qryDivisaoProgramada.FieldByName('sn_manter_desconto_fixo').AsInteger = 1);
   bParcelaAluno := True;

   if descontoFixo > 0 then
   begin
      DividirAcoesMovimentoFixo(qyDadosMensalidade.FieldByName('cd_mensalidade').AsInteger, iNovaMensalidade, indicePercentual, descontoFixo, bManterDescontoAluno, bParcelaAluno);
   end;

   if descontoCondicional > 0 then
   begin
      DividirAcoesMovimentoCondicional(qyDadosMensalidade.FieldByName('cd_mensalidade').AsInteger, iNovaMensalidade, indicePercentual, descontoCondicional, bManterDescontoAluno, bParcelaAluno);
   end;

end;

procedure TfrmReserva.DivisaoTitulo(iMensalidade: Integer);
var
   qyDadosMensalidade, qyUpdateMensalidade, qyMovimentacaoDivisao : TUMZQuery;
   percResponsavel, percAluno: Currency;
   chaves : String;
begin

   DM.CriarConsulta(qyDadosMensalidade);
   DM.CriarConsulta(qyUpdateMensalidade);
   DM.CriarConsulta(qyMovimentacaoDivisao);

   // SQL que verifica se o aluno possui alguma divisão de título programada

   qryDivisaoProgramada.SQL.Text := ' SELECT  ' +
                                    '    pd.* ' +
                                    ' FROM    ' +
                                    '    pessoas_descontos pd ' +
                                    '    INNER JOIN fin_tp_titulos_pessoas_desc tptp ON (tptp.cd_desconto_pessoa = pd.cd_desconto_pessoa) ' +
                                    ' WHERE ' +
                                    '    pd.tp_desconto = 2 AND ' +
                                    '    pd.cd_pessoa = :CD_PESSOA AND ' +
                                    '    pd.cd_depto = :CD_DEPTO AND ' +
                                    '    pd.nr_parc_inicio <= :NR_PARCELA AND ' +
                                    '    pd.nr_parc_fim >= :NR_PARCELA AND ' +
                                    '    tptp.cd_tipo_titulo = :CD_TIPO_TITULO AND ' +
                                    '    CASE WHEN :CD_COLIGADA > 0 THEN tptp.cd_coligada = :CD_COLIGADA ELSE 1=1 END AND ' +
                                    '    CURDATE() BETWEEN pd.dt_inicio AND pd.dt_fim ' +
                                    ' ORDER BY ' +
                                    '    pd.cd_desconto_pessoa DESC ' +
                                    ' LIMIT 1 ';

   qyDadosMensalidade.Close;
   qyDadosMensalidade.SQL.Text := ' SELECT '+
                                  '    m.parcela, m.cd_tipo_titulo, m.situacao, m.datavencimento, m.turma, m.anosemestre, '+
                                  '    m.nossonumero, m.ValorDesconto, m.DescontoExtra, m.valorbruto, m.vl_credito, m.ValorExtra, '+
                                  '    m.ValorJuros, m.sn_credito_parcela, m.dt_competencia, m.nr_creditos, m.ds_historico, '+
                                  '    m.cd_plano_conta, m.cd_centro_custo, m.cd_item_plano, m.cd_desc_condicional, m.ds_obs_desc, '+
                                  '    m.cd_mensalidade, m.cd_resp, '+
                                  '    (SELECT SUM(vl_desconto) FROM fin_mov_cr cr WHERE m.cd_mensalidade = cr.cd_mensalidade_origem AND cr.sn_desc_plano_pagamento = 1 AND cr.sn_desc_condicional = 1) vl_desc_cond_plano, '+
                                  '    (SELECT SUM(vl_saida) FROM fin_mov_cr cr WHERE m.cd_mensalidade = cr.cd_mensalidade_origem AND cr.sn_desc_plano_pagamento = 1 AND cr.sn_desc_condicional = 0) vl_desc_fixo_plano '+
                                  ' FROM '+
                                  '    mensalidades m WHERE m.cd_mensalidade = ' + IntToStr(iMensalidade);
   qyDadosMensalidade.Open;

   { Verificar se o aluno possui divisão de título }
   qryDivisaoProgramada.Close;
   qryDivisaoProgramada.ParamByName('CD_PESSOA').AsInteger := xMatriculas.FieldByName('CodigoAluno').AsInteger;
   qryDivisaoProgramada.ParamByName('CD_DEPTO').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
   qryDivisaoProgramada.ParamByName('NR_PARCELA').AsInteger := qyDadosMensalidade.FieldByName('parcela').AsInteger;
   qryDivisaoProgramada.ParamByName('CD_TIPO_TITULO').AsInteger := qyDadosMensalidade.FieldByName('cd_tipo_titulo').AsInteger;
   if tblPlanos.FieldByName('cd_coligada').AsInteger > 0 then
   begin
      qryDivisaoProgramada.ParamByName('CD_COLIGADA').AsInteger := tblPlanos.FieldByName('cd_coligada').AsInteger;
   end else begin
      qryDivisaoProgramada.ParamByName('CD_COLIGADA').Clear;
   end;
   qryDivisaoProgramada.Open;

   while not qryDivisaoProgramada.Eof do
   begin

      // Verifica se existe a divisão de títulos e também a mensalidade
      if (qryDivisaoProgramada.FieldByName('cd_desconto_pessoa').AsInteger > 0) and (iMensalidade > 0) then
      begin

         // Verifica a situação da mensalidade, se a mesma já estiver baixada não há porque dividir
         // Caso a situação da mensalidade seja 6 = Baixa por desconto, não é necessário dividir a parcela
         if (qyDadosMensalidade.FieldByName('situacao').AsInteger = 6) then
         begin
            Exit;
         end;

         // Se existir a divisão de títulos, primeiramente verifica se ela é de 100%
         if (qryDivisaoProgramada.FieldByName('vl_percentual').AsFloat >= 100) then
         begin
            // Transfere o título para o novo responsável
            qyUpdateMensalidade.Close;
            qyUpdateMensalidade.SQL.Text := 'UPDATE mensalidades SET cd_resp = ' + qryDivisaoProgramada.FieldByName('cd_responsavel').AsString + ' WHERE cd_mensalidade = ' + IntToStr(iMensalidade);
            qyUpdateMensalidade.ExecSQL;
            Exit;
         end;

         // Cálcula o percentual a pagar do título pelo Responsável
         percResponsavel := qryDivisaoProgramada.FieldByName('vl_percentual').AsFloat / 100;
         // Cálcula o percentual a pagar do título pelo Aluno
         percAluno := 1 - percResponsavel;

         // Insere parcela do responsável
         InserirParcelaResponsavel(percResponsavel, qyDadosMensalidade);

         if percAluno > 0 then
         begin
            // Insere parece do aluno
            InserirParcelaAluno(percAluno, qyDadosMensalidade);
         end;

         {**********************************************
          * Gerar log da divisão de título
          **********************************************}    
         chaves := FillString(xMatriculas.FieldByName('CodigoAluno').AsString, alRight, '0', 10, true ) + ';' +
                   txtAnoSemestrePara.Text + ';' + txtTurmaPara.Text + ';' +
                   qyDadosMensalidade.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qyDadosMensalidade.FieldByName('datavencimento').AsDateTime) + ';';

         DM.setLog(2, 'Alteracao', chaves, Dm.getColigadaByTurma(qyDadosMensalidade.FieldByName('turma').AsString, qyDadosMensalidade.FieldByName('anosemestre').AsInteger), 'Parcela Dividida. (NN = ' + qyDadosMensalidade.FieldByName('nossonumero').AsString +  ')');

         {**********************************************
          * Apaga a mensalidade original
          **********************************************}

         // Apaga as movimentações financeiras da mensalidade original
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := ' DELETE FROM fin_mov_cr WHERE COALESCE(cd_mensalidade_origem, cd_mensalidade) = ' + IntToStr(iMensalidade);
         qyUpdateMensalidade.ExecSQL;
         
         // Apaga a mensalidade original
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := ' DELETE FROM mensalidades WHERE cd_mensalidade = ' + IntToStr(iMensalidade);
         qyUpdateMensalidade.ExecSQL;

      end;

      qryDivisaoProgramada.Next;
   end;

end;

procedure TfrmReserva.DividirAcoesMovimentoFixo(codigoMensalidade, codigoMensalidadeDividida: Integer; indicePercentual, descontoFixo: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
var
   movimento: TMovimento;
   somaDescontos, valorDesconto: Currency;
   bDescontoPlano: Boolean;
begin

   qryAcoesMovimentoFixo.Close;
   qryAcoesMovimentoFixo.ParamByName('cd_mensalidade_origem').AsInteger := codigoMensalidade;
   qryAcoesMovimentoFixo.Open;

   somaDescontos := 0;

   while not qryAcoesMovimentoFixo.Eof do
   begin

      // Verifica se o desconto fixo é do plano de pagamento (esse desconto sempre divide)
      bDescontoPlano := (qryAcoesMovimentoFixo.FieldByName('sn_desc_plano_pagamento').AsInteger = 1);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do responsável (não aluno)
      if (not bDescontoPlano) and bManterDescontoAluno and (not bParcelaAluno) then
      begin
         // Não insere o desconto para o responsável nesse caso
         qryAcoesMovimentoFixo.Next;
         // Avança para o próximo desconto
         continue;
      end;

      Movimento := TMovimento.create;

      try
         Movimento.Observacao := qryAcoesMovimentoFixo.FieldByName('ds_observacao').AsString;
         Movimento.TipoDeAcao := BaixarporDesconto;
         Movimento.CodigoTitulo := codigoMensalidadeDividida;
         Movimento.CodAcao := qryAcoesMovimentoFixo.FieldByName('cd_acao').AsInteger;

         // Cálcula o valor do desconto da ação de movimento
         valorDesconto := RoundFloat(qryAcoesMovimentoFixo.FieldByName('vl_saida').AsCurrency*indicePercentual, 2);

         // Se não for um desconto do plano de pagamento e
         // Deve-se manter o desconto na parcela do aluno
         // E está dividindo uma parcela do aluno
         if (not bDescontoPlano) and bManterDescontoAluno and bParcelaAluno then
         begin
            // Mantém o desconto integral para o aluno (sem dividir ele)
            valorDesconto := qryAcoesMovimentoFixo.FieldByName('vl_saida').AsCurrency;
         end;

         // Se for o último desconto que estiver sendo varrido cálcula o valor da ação pela diferença
         if qryAcoesMovimentoFixo.RecNo = qryAcoesMovimentoFixo.RecordCount then
         begin
            valorDesconto := descontoFixo - somaDescontos;
         end;

         somaDescontos := somaDescontos + valorDesconto;

         Movimento.ValorMovimento := valorDesconto;
         Movimento.DescontoPlano := qryAcoesMovimentoFixo.FieldByName('sn_desc_plano_pagamento').AsInteger;
         Movimento.Coligada := qryAcoesMovimentoFixo.FieldByName('cd_coligada').AsInteger;
         Movimento.RegistrarMovimentacaoCR(0);
      finally
         Movimento.Free;
      end;

      qryAcoesMovimentoFixo.Next;
   end;
      
end;

procedure TfrmReserva.DividirAcoesMovimentoCondicional(codigoMensalidade, codigoMensalidadeDividida: Integer; indicePercentual, descontoCondicional: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
var
   movimento: TMovimento;
   somaDescontos, valorDesconto: Currency;
   bDescontoPlano: Boolean;
begin

   qryAcoesMovimentoCondicional.Close;
   qryAcoesMovimentoCondicional.ParamByName('cd_mensalidade_origem').AsInteger := codigoMensalidade;
   qryAcoesMovimentoCondicional.Open;

   somaDescontos := 0;

   while not qryAcoesMovimentoCondicional.Eof do
   begin

      // Verifica se o desconto condicional é do plano de pagamento (esse desconto sempre divide)
      bDescontoPlano := (qryAcoesMovimentoCondicional.FieldByName('sn_desc_plano_pagamento').AsInteger = 1);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do responsável (não aluno)
      if (not bDescontoPlano) and bManterDescontoAluno and (not bParcelaAluno) then
      begin
         // Não insere o desconto para o responsável nesse caso
         qryAcoesMovimentoCondicional.Next;
         // Avança para o próximo desconto
         continue;
      end;

      Movimento := TMovimento.create;

      try
         Movimento.Observacao := qryAcoesMovimentoCondicional.FieldByName('ds_observacao').AsString;
         Movimento.TipoDeAcao := BaixarporDesconto;
         Movimento.CodigoTitulo := codigoMensalidadeDividida;
         Movimento.CodAcao := qryAcoesMovimentoCondicional.FieldByName('cd_acao').AsInteger;

         // Cálcula o valor do desconto da ação de movimento
         valorDesconto := RoundFloat(qryAcoesMovimentoCondicional.FieldByName('vl_desconto').AsCurrency*indicePercentual, 2);

         // Se não for um desconto do plano de pagamento e
         // Deve-se manter o desconto na parcela do aluno
         // E está dividindo uma parcela do aluno
         if (not bDescontoPlano) and bManterDescontoAluno and bParcelaAluno then
         begin
            // Mantém o desconto integral para o aluno (sem dividir ele)
            valorDesconto := qryAcoesMovimentoCondicional.FieldByName('vl_desconto').AsCurrency;
         end;

         // Se for o último desconto que estiver sendo varrido cálcula o valor da ação pela diferença
         if qryAcoesMovimentoCondicional.RecNo = qryAcoesMovimentoCondicional.RecordCount then
         begin
            valorDesconto := descontoCondicional - somaDescontos;
         end;

         somaDescontos := somaDescontos + valorDesconto;

         Movimento.ValorDesconto := valorDesconto;
         Movimento.DescontoPlano := qryAcoesMovimentoCondicional.FieldByName('sn_desc_plano_pagamento').AsInteger;
         Movimento.Coligada := qryAcoesMovimentoCondicional.FieldByName('cd_coligada').AsInteger;
         Movimento.DescCondicional := 1;
         Movimento.RegistrarMovimentacaoCR(0);
      finally
         Movimento.Free;
      end;

      qryAcoesMovimentoCondicional.Next;
   end;
      
end;

procedure TfrmReserva.MostrarAlunos;
begin

   // Tem que ter uma turma de origem selecionada
   if TRIM(txtTurmaDe.Text) = '' then exit;


   if snTelaExcluirReserva then begin

      xMatriculas.SQL.Text :=
      ' SELECT ma.cd_matricula_curso, ma.codigoaluno, pe.nm_pessoa, si.ds_situacao, ma.curso from matriculas as ma ' +
      '  INNER JOIN pessoas as pe ON (pe.cd_pessoa = ma.codigoaluno) ' +
      '  INNER JOIN situacao as si ON (si.cd_situacao= ma.situacao) ' +
      '  WHERE situacao = 10 ' +
      '    AND ma.turma = :turma ' +
      '    AND ma.anosemestre = :anosemestre ' +
      '  ORDER BY pe.nm_pessoa ';

   end else begin

      xMatriculas.SQL.Text :=
      ' SELECT ma.cd_matricula_curso, ma.codigoaluno, pe.nm_pessoa, si.ds_situacao, ma.curso from matriculas as ma ' +
      '  INNER JOIN pessoas as pe ON (pe.cd_pessoa = ma.codigoaluno) ' +
      '  INNER JOIN situacao as si ON (si.cd_situacao= ma.situacao) ' +
      '  WHERE situacao not in (3,4,5,6,7,8,10) ' +
      '    AND ma.turma = :turma ' +
      '    AND ma.anosemestre = :anosemestre ' +
      '  ORDER BY pe.nm_pessoa ';   


   end;
   
   xMatriculas.Close;
   xMatriculas.ParamByName('turma').AsString := txtTurmaDe.Text;
   xMatriculas.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestreDe.Text);
   xMatriculas.Open;

   slAlunos := TStringList.Create();

   // Percorrer as matriculas DE e listar na listbox
   xMatriculas.First();
   lstAlunos.Clear();
   while not xMatriculas.EOF do begin
        slAlunos.AddObject(xMatriculas.FieldByName('codigoaluno').AsString, TObject(xMatriculas.GetBookmark));
        lstAlunos.Items.Add(FillString( Copy(xMatriculas.FieldByName('nm_pessoa').AsString, 1, 35), alLeft, ' ', 35, false) + ' - ' + xMatriculas.FieldByName('ds_situacao').AsString );

        xMatriculas.Next();
   end;

   sbMarcarClick(nil);
    
end;

procedure TfrmReserva.MostrarPlanos;
begin
   if txtTurmaPara.Text = '' then exit;

   

   Filtra();
end;

procedure TfrmReserva.CarregarProximaTurma;
var
   anosemestre: Integer;
begin
   anosemestre := StrToInt(txtAnoSemestreDe.Text);

   // Busca qual a próxima turma
   qryProximaTurma.Close;
   qryProximaTurma.ParamByName('turma').AsString := txtTurmaDe.Text;
   qryProximaTurma.ParamByName('anosemestre').AsInteger := anosemestre;
   qryProximaTurma.Open;

   // Verifica se encontrou próxima turma configurada
   if qryProximaTurma.FieldByName('cd_proxima_turma').AsString <> '' then
   begin

      // Incrementa o anosemestre da matricula para o próximo anosemestre
      if DM.UsaAnosemestre then
      begin
         if ano_semestre_incremento = 1 then
         begin
            if (anosemestre mod 2) = 0 then
            begin
               Inc(anosemestre, 9);
            end
            else
               Inc(anosemestre);
         end
         else
            Inc(anosemestre, 10);
      end;

      // Busca dados/informações da próxima turma (para rematrícula)
      qryDadosProxTurma.Close;
      qryDadosProxTurma.ParamByName('turma').AsString := qryProximaTurma.FieldByName('cd_proxima_turma').AsString;
      qryDadosProxTurma.ParamByName('anosemestre').AsInteger := anosemestre;
      qryDadosProxTurma.Open;

      if not qryDadosProxTurma.IsEmpty then
      begin
         // Preenche a próxima turma nos campos de Turma Destino
         txtTurmaPara.Text := qryDadosProxTurma.FieldByName('codigo').AsString;
         txtAnoSemestrePara.Text := qryDadosProxTurma.FieldByName('anosemestre').AsString;

         // Carrega informações próxima turma
         if txtTurmaPara.Text <> '' then
         begin
            DM.DeptoCursoTurma( qryDadosProxTurma.FieldByName('anosemestre').AsInteger, qryDadosProxTurma.FieldByName('codigo').AsString );
            strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
            FMatriculaCurso^.Curso := strCursoPara;
            FMatriculaCurso^.Turno := qryDadosProxTurma.FieldByName('turno').AsString;
         end;

         // Mostra os planos de pagamento da próxima turma
         MostrarPlanos();
      end;
   end;
end;

procedure TfrmReserva.CalcularVencimento;
const
   SSQLSelectInicioTurma = 'SELECT DATAINICIO FROM TURMAS WHERE CODIGO = ? AND ANOSEMESTRE = ?';
var
  i : Byte;
  wDay, wMonth, wYear : Word;
  MyDay : TDateTime;
  cIndDesconto : Double;
  ParcelaZero : Boolean;
  nPar : Integer;
  dCreditosRestantes : double;
   dtBloqueio, DataInicioTurma, DataMatricula, PrimeiroVencto: TDateTime;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;

   function CalcVencimentoFormula: TDate;
   var
      BaseData, Temp: TDate;
      Day, OriginalMonth, OriginalYear, CalcMonth, CalcYear: Word;
      Days: Integer;
      ValidDay, GoBackMonth: Boolean;
   begin
      case tblItensPagamento.FieldByName('NR_FORMULA_VENCTO').AsInteger of
         0:
            BaseData := DataInicioTurma;
         1:
            BaseData := DataMatricula;
         2:
            BaseData := PrimeiroVencto;
      end;

      Days := tblItensPagamento.FieldByName('NR_FORMULA_DIAS').AsInteger;

      if tblItensPagamento.FieldByName('NR_FORMULA_OPERADOR').AsInteger = 0 then
         Days := Days * -1;

      Result := IncDay(BaseData, Days);

      if tblPlanos.FieldByName('SN_DIAS_UTEIS').AsInteger = 1 then
      begin
         Temp := EncodeDate(YearOf(Result), MonthOf(Result), 1);
         Day := DayOf(Result);

         while Day > 0 do
         begin
            if (not DM.getFeriado(Temp)) and
               (not (DayOfWeek(Temp) in [1, 7])) then
            begin
               Dec(Day);
            end;

            if Day > 0 then
            begin
               Temp := IncDay(Temp);
            end;
         end;

         Result := Temp;
      end;

      if tblPlanos.FieldByName('SN_DIAS_UTEIS').AsInteger = 0 then
      begin
         Day := DayOf(Result);
         OriginalMonth := MonthOf(Result);
         OriginalYear := YearOf(Result);

         Temp := Result;

         if Day > DaysInMonth(Result) then
         begin
            Temp := EndOfTheMonth(Result);
         end;

         ValidDay :=
            (
               (tblPlanos.FieldByName('SN_PULAR_FERIADOS').AsInteger = 0) or
               (not DM.getFeriado(Temp))
            )
            and
            (
               (tblPlanos.FieldByName('SN_PULAR_SABADOS').AsInteger = 0) or
               (DayOfWeek(Temp) <> 7)
            )
            and
            (
               (tblPlanos.FieldByName('SN_PULAR_DOMINGOS').AsInteger = 0) or
               (DayOfWeek(Temp) <> 1)
            );

         while not ValidDay do
         begin
            Temp := IncDay(Temp);
            CalcMonth := MonthOf(Temp);
            CalcYear := YearOf(Temp);

            if (CalcMonth <> OriginalMonth) or
               (CalcYear <> OriginalYear) then
               Break;

            ValidDay :=
               (
                  (tblPlanos.FieldByName('SN_PULAR_FERIADOS').AsInteger = 0) or
                  (not DM.getFeriado(Temp))
               )
               and
               (
                  (tblPlanos.FieldByName('SN_PULAR_SABADOS').AsInteger = 0) or
                  (DayOfWeek(Temp) <> 7)
               )
               and
               (
                  (tblPlanos.FieldByName('SN_PULAR_DOMINGOS').AsInteger = 0) or
                  (DayOfWeek(Temp) <> 1)
               );
         end;

         CalcMonth := MonthOf(Temp);
         CalcYear := YearOf(Temp);

         GoBackMonth :=
            (CalcMonth > OriginalMonth) or
            (CalcYear > OriginalYear);

         while (CalcMonth > OriginalMonth) or (CalcYear > OriginalYear) do
         begin
            Temp := IncDay(Temp, -1);
            CalcMonth := MonthOf(Temp);
            CalcYear := YearOf(Temp);
         end;

         if GoBackMonth then
         begin
            repeat
               ValidDay := True;

               ValidDay :=
                  (
                     (tblPlanos.FieldByName('SN_PULAR_FERIADOS').AsInteger = 0) or
                     (not DM.getFeriado(Temp))
                  )
                  and
                  (
                     (tblPlanos.FieldByName('SN_PULAR_SABADOS').AsInteger = 0) or
                     (DayOfWeek(Temp) <> 7)
                  )
                  and
                  (
                     (tblPlanos.FieldByName('SN_PULAR_DOMINGOS').AsInteger = 0) or
                     (DayOfWeek(Temp) <> 1)
                  );

               if not ValidDay then
                  Temp := IncDay(Temp, -1);
                     
            until (ValidDay);
         end;

         Result := Temp;
      end;
   end;

begin

   zerarArray();

   dtBloqueio := DM.DataBloqueioFinanceiro(ArrayDatas[i]);

  { Calcula os valores e vencimentos nos arrays }

  tblItensPagamento.Close();
  tblItensPagamento.Open();
  tblItensPagamento.First();

  lngPlano := 0;
  lst.Clear;

  i := 0;

  // Usar como data base inicial o A PARTIR DE....
  try
     DecodeDate( tblPlanos.FieldByName('DT_APARTIR').AsDateTime, wYear, wMonth, wDay );
  except
     // Se não tiver tiver A PARTIR DE Selecionar a data de Hoje
     DecodeDate( DataHoje, wYear, wMonth, wDay );
  End;

  dCreditosRestantes := total_creditos * tblPlanos.FieldByName('NR_PARCELAS').AsInteger;
  nPar := tblPlanos.FieldByName('NR_PARCELAS').AsInteger;

   Stmt := PrepareStatement(SSQLSelectInicioTurma);
   try
      Stmt.SetString(1, txtTurmaPara.Text);
      Stmt.SetString(2, txtAnoSemestrePara.Text);

      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            DataInicioTurma := Rs.GetDate(1);
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   DataMatricula := DM.CurrDateFromDatabase;
  
  while not tblItensPagamento.Eof do
  begin

      // Resgatar o índice de desconto para calcular proporcional
      if tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency > 0 then
         cIndDesconto := tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency / tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency
      else
         cIndDesconto := 0;

      if tblPlanos.FieldByName('NR_TIPO_VENCTO').AsInteger = 0 then
      begin
         MyDay := DataValida(
            tblItensPagamento.FieldByName('NR_ANO').AsInteger,
            tblItensPagamento.FieldByName('NR_MES').AsInteger,
            tblItensPagamento.FieldByName('NR_DIA').AsInteger);
      end;

      if tblPlanos.FieldByName('NR_TIPO_VENCTO').AsInteger = 1 then
      begin
         MyDay := TDate(CalcVencimentoFormula);
      end;

      if tblItensPagamento.FieldByName('NR_PARCELA').AsInteger = 0 then
      begin
         PrimeiroVencto := MyDay;
      end;

      if tblItensPagamento.FieldByName('SN_CREDITO_PARCELA').AsString[1] IN ['S', 'F'] then
      Begin  // Programação com Créditos

         ArrayValorCredito[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsCurrency;
         ArraySN_Credito[i] := tblItensPagamento.FieldByName('SN_CREDITO_PARCELA').AsString[1];

         if tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger <> 0 then begin

            if tblItensPagamento.FieldByName('SN_CREDITO_PARCELA').AsString = 'S' then begin

               if total_creditos < tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger then begin
                  ArrayNr_Credito[i] := tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;
                  ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;
               End else Begin
                  ArrayNr_Credito[i] := total_creditos;
                  ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * total_creditos;
               End;

               dCreditosRestantes := dCreditosRestantes -  total_creditos;

            end else begin

               ArrayNr_Credito[i] := tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;
               ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;

               dCreditosRestantes := dCreditosRestantes -  tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;

            end

         end else begin

            if(nPar <> 0) then
            begin
               ArrayNr_Credito[i] := (dCreditosRestantes / nPar);
            end else begin
               ArrayNr_Credito[i] := nPar;
            end;
            
            ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * ArrayNr_Credito[i];

            dCreditosRestantes := dCreditosRestantes - ArrayNr_Credito[i];

         end;

         nPar := nPar - 1;

         // O desconto é calculado proporcionalmente ao novo valor bruto, conforme créditos
         ArrayDescontos[i] := ArrayValores[i] * cIndDesconto;

         ArrayDescontosPlano[i] := (tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency / tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency) * ArrayValores[i];
         ArrayDescontosExtra[i] := (tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency / tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency) * ArrayValores[i];
         ArrayDescontosExtraPlano[i] := tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency;
         ArrayValorExtra[i] := tblItensPagamento.FieldByName('VL_EXTRA').AsCurrency;

      End
      else  { Programação Sem Créditos }
      Begin
         ArrayValorCredito[i] := 0;
         ArraySN_Credito[i] := 'N';
         ArrayNr_Credito[i] := 0;
         ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency;
         ArrayDescontos[i] := tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency;
         ArrayDescontosPlano[i] := tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency;
         ArrayDescontosExtra[i] := tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency;
         ArrayDescontosExtraPlano[i] := tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency;
         ArrayValorExtra[i] := tblItensPagamento.FieldByName('VL_EXTRA').AsCurrency;
      End;

      // Verificar data de vencimento
      ParcelaZero := False; 
      if tblItensPagamento.FieldByName('NR_DIA').AsInteger = 0 then begin
        ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;
        ArrayDatas[i] := DataHoje + tblPlanos.FieldByName('NR_DIAS_PARCELA_ZERO').AsInteger;
        ParcelaZero := True;

         if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
         begin
            ArrayDatas[i] := dtBloqueio + 1;
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end
         else
         begin
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end;

      end
      else
      if MyDay < DataHoje then Begin

        { O vencimento ficará menor q a data de hoje, verificar se deve ser criada a parcela }
        if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[VENCIMENTO=PLANO]' then begin
           { Mandar data do Plano, mesmo em Atraso }
           ArrayDatas[i] := MyDay;

           ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;

            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format( 'PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime( 'dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format( '%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        end
        else
        if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[PERDOAR]' then Begin
             { Perdoar a Mensalidade }
             ArrayDatas[i] := DataHoje;
             ArrayParcelas[i] := - tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;
             
            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger] ) + ' - ISENTADA - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        end
        else
        if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[NAO_GERAR]' then Begin { NÃO GERAR AS PARCELAS }
              ArrayDatas[i] := DataHoje;
              ArrayParcelas[i] := -99;

            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ELIMINADA - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        End
        else
        begin //  '[VENCIMENTO=HOJE]'
           { Colocar data de Hoje, para não deixar em Atraso }
           ArrayDatas[i] := DataHoje;

           ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;

            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger] ) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        end


      End
      else
      begin
         { Data do Plano }
         ArrayDatas[i] := MyDay;

         ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;

         if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
         begin
            ArrayDatas[i] := dtBloqueio + 1;
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end
         else
         begin
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger] ) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i] ) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end;
      end;

      ArrayItemPlano[i] := tblItensPagamento.FieldByName('CD_PLANO_ITEM').AsInteger;
      ArrayTipoParcela[i] := tblItensPagamento.FieldByName('CD_TIPO_PARCELA').AsInteger;
      ArrayPlanoContas[i] := tblItensPagamento.FieldByName('CD_CONTA').AsInteger;
      ArrayDescricaoTipo[i] := tblItensPagamento.FieldByName('DS_TIPO_TITULO').AsString;

      tblItensPagamento.Next;

      Inc( i );

      if not ParcelaZero then begin

            wMonth := wMonth + 1;
            if wMonth = 13 then
            begin
              wMonth := 1;
              wYear := wYear + 1;
            end;
            MyDay := DataValida( wYear, wMonth, wDay );

      end;

  end;
end;


procedure TfrmReserva.cbPlanosChange(Sender: TObject);
begin
   tblPlanos.GotoBookmark(slPlanos.Objects[cbPlanos.ItemIndex]);
   CalcularVencimento();                                      
end;

procedure TfrmReserva.dtcPlanosDataChange(Sender: TObject; Field: TField);
begin
//  if Field = nil then CalcularVencimento;
end;

procedure TfrmReserva.btnTurmasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }

   resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestreDe.Text)
      );

   if not resultado_filtro.filtrado then Exit;
  
   txtTurmaDe.Text := resultado_filtro.cd_turma;
   txtAnoSemestreDe.Text := IntToStr( resultado_filtro.nr_anosemestre );

   MostrarAlunos();

   CarregarProximaTurma();
end;

procedure TfrmReserva.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestrePara.Text)
      );

   if not resultado_filtro.filtrado then Exit;

   txtTurmaPara.Text := resultado_filtro.cd_turma;
   txtAnoSemestrePara.Text := IntToStr( resultado_filtro.nr_anosemestre );

   if txtTurmaPara.Text <> '' then
   begin
      DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );
      strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
      FMatriculaCurso^.Curso := strCursoPara;
      FMatriculaCurso^.Turno := resultado_filtro.vl_turno;
   end;

   MostrarPlanos();

end;                                                  

function TfrmReserva.total_creditos: double;
var
  qSel : TUMZQuery;
begin
 // Total de Créditos

  DM.CriarConsulta(qSel);

  qSel.Close();
  qSel.SQL.Text := ' SELECT SUM(g.NR_AULAS) QtdCreditos ';
  qSel.SQL.Add(' FROM  turmas t INNER JOIN grades_disciplinas as g ON (  g.cd_curso = t.curso AND g.cd_grade = t.cd_grade AND t.serie = g.nr_serie) ');
  qSel.SQL.Add(' WHERE t.codigo = ' + QuotedStr(txtTurmaPara.Text) + ' AND t.anosemestre = ' + txtAnoSemestrePara.Text);
  qSel.Open();

  result := qSel.FieldByName('QtdCreditos').AsCurrency;

  FreeAndNil(qSel);

end;

procedure TfrmReserva.txtAnoSemestreDeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 Then
   Begin
    SelectNext( TWinControl( Sender ), True, True );
    Key := #0;
   End;
end;

procedure TfrmReserva.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblPlanos, pmQtd);

end;

procedure TfrmReserva.PrepararTelaReserva(ExcluirReserva: Boolean);
begin
    if ExcluirReserva then begin
       // Tela para exclusão de reserva;
       pnDestino.Visible := false;
       lbTituloOrigem.Caption := 'EXCLUIR RESERVAS';
       lbTurma.Caption := 'Selecione a turma para excluir as reservas:';
       lbAlunos.Caption := 'Apenas os alunos marcados terão suas reservas excluidas.';

       btnGerar.Visible     := false;
       tbSeparador1.Visible := false;
       btnExcluir.Visible   := true;
       tbSeparador2.Visible := true;
       btnRequerimentos.Visible := false;
       tbSeparador3.Visible := false;
       btnContratos.Visible := false;
       tbSeparador4.Visible := false;

       SnTelaExcluirReserva := true;

    end else begin
       // Tela para geração da reserva;

       pnDestino.Visible := true;
       lbTituloOrigem.Caption := 'ORIGEM:';
       lbTurma.Caption := 'Selecione a turma de origem:';
       lbAlunos.Caption := 'Apenas os alunos marcados serão pré-rematriculados.';

       btnGerar.Visible     := true;
       tbSeparador1.Visible := true; 
       btnExcluir.Visible   := false;
       tbSeparador2.Visible := false;
       btnRequerimentos.Visible := true;
       tbSeparador3.Visible := true;
       btnContratos.Visible := true;
       tbSeparador4.Visible := true;

       SnTelaExcluirReserva := false;

    end;
end;

procedure TfrmReserva.sbDesmarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (lstAlunos.Items.Count-1) do
    lstAlunos.Checked[i] := false;
end;

procedure TfrmReserva.sbMarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (lstAlunos.Items.Count-1) do
    lstAlunos.Checked[i] := true;

end;

procedure TfrmReserva.AplicaDescontoFixoProgramado;
var
   valorDescontoFixo, valorDescontoAcumulado, idxPercentualPlano,
   valorTotal, diffDesconto: Currency;

   descontosCobremValorTitulo: Boolean;
begin

   {
     APLICA O DESCONTO FIXO SOBRE A MENSALIDADE DO ALUNO

     Se o desconto foi informado como percentual (%), o percentual é convertido em base numérica, ou seja,
     converte o valor percentual em um valor real cálculado (R$)
   }

   // Posiciona na ultima parcela inserida no clienteDataSet
   cdsParcelas.Last;

   // Busca os descontos programados FIXOS do estudante
   qryDescontoProgFixo.Close;
   qryDescontoProgFixo.ParamByName('cd_curso').AsString := DM.tblDeptoCursoTurmaCurso.AsString;
   qryDescontoProgFixo.ParamByName('cd_pessoa').AsInteger := xMatriculas.FieldByName('CodigoAluno').AsInteger;
   qryDescontoProgFixo.ParamByName('cd_depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
   qryDescontoProgFixo.ParamByName('nr_parcela').AsInteger := cdsParcelasNR_PARCELA.AsInteger;
   qryDescontoProgFixo.ParamByName('cd_tipo_parcela').AsInteger := cdsParcelasCD_TIPO_TITULO.AsInteger;

   if tblPlanos.FieldByName('cd_coligada').AsInteger > 0 then
   begin
      qryDescontoProgFixo.ParamByName('cd_coligada').AsInteger := tblPlanos.FieldByName('cd_coligada').AsInteger;
   end else begin
      qryDescontoProgFixo.ParamByName('cd_coligada').Clear;
   end;
   qryDescontoProgFixo.Open;

   // Prepara a edição da última parcela
   cdsParcelas.Edit;

   // Flag que irá ser setada se os valores dos descontos aplicados passarão o valor do titulo que o aluno deverá pagar
   descontosCobremValorTitulo := False;

   // Varre os descontos FIXOS programados do aluno
   qryDescontoProgFixo.First;
   while not qryDescontoProgFixo.Eof do
   begin
      valorDescontoFixo := 0;

      // Verifica se existe um percentual de desconto informado específicamente para a pessoa (desconto especial)
      if ( qryDescontoProgFixo.FieldByName('vl_percentual').AsFloat > 0 ) then
      begin

         // Caso PERCENTUAL então cálcula o valor do desconto que será aplicado
         valorDescontoFixo := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgFixo.FieldByName('vl_percentual').AsCurrency / 100);

      // Caso não existe um desconto especial para a pessoa, utiliza o desconto do plano de descontos se houver
      end else if ( qryDescontoProgFixo.FieldByName('cd_desconto').AsInteger > 0 ) then
      begin

         // Verifica se o desconto do plano de descontos é percentual (%)
         if ( qryDescontoProgFixo.FieldByName('percentualdesconto').AsFloat > 0 ) then
         begin
            valorDescontoFixo := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgFixo.FieldByName('percentualdesconto').AsCurrency / 100);

         // Verifica se o desconto do plano de descontos é em R$
         end else if ( qryDescontoProgFixo.FieldByName('valordesconto').AsCurrency > 0 ) then
         begin
            valorDescontoFixo := qryDescontoProgFixo.FieldByName('valordesconto').AsCurrency;
         end;
      end;

      // Arredonda o desconto fixo
      valorDescontoFixo := RoundFloat(valorDescontoFixo, 2);

      // Verifica se existe algum valor de desconto
      if ( valorDescontoFixo > 0 ) then
      begin

         // Soma o desconto fixo
         valorDescontoAcumulado := cdsParcelasVL_DESC_EXTRA.AsCurrency + valorDescontoFixo;

         //SOMA
         if ( qryDescontoProgFixo.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_SOMA ) then
         begin
            // Não faz NADA (não mexe) no desconto condicional

         //PROPORCIONAL
         end else if ( qryDescontoProgFixo.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_PROPORCIONAl ) then
         begin
            // Faz o desconto proporcional do desconto condicional
            idxPercentualPlano := (cdsParcelasVL_DESCONTO.AsCurrency / (cdsParcelasVL_BRUTO.AsCurrency-cdsParcelasVL_DESC_EXTRA.AsCurrency));
            cdsParcelasVL_DESCONTO.AsCurrency := (cdsParcelasVL_BRUTO.AsCurrency - valorDescontoAcumulado) * idxPercentualPlano;

         // SOBREPOR
         end else begin
            // Zera o desconto condicional
            cdsParcelasVL_DESCONTO.AsCurrency := 0;
         end;

         cdsParcelasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasVL_DESCONTO.AsCurrency, 2);

         cdsParcelasVL_DESC_EXTRA.AsCurrency := valorDescontoAcumulado;

         // Cálcula o valor total (valor bruto + valor extra)
         valorTotal := cdsParcelasVL_BRUTO.AsCurrency + cdsParcelasVL_EXTRA.AsCurrency;

         // Verifica se os descontos não são maiores
         diffDesconto := valorTotal - cdsParcelasVL_DESC_EXTRA.AsCurrency;
            
         // Se o desconto fixo for menor que zero significa que o valor do desconto é maior que a mensalidade
         if ( diffDesconto <= 0 ) then
         begin
            // Informa que não deve mais considerar os próximos descontos fixos pois o valor do título ja foi pago com os descontos
            descontosCobremValorTitulo := true;

            // Desconto Extra (fixo) será o valor da mensalidade (pois não se pode descontar mais que o total da mensalidade)
            cdsParcelasVL_DESC_EXTRA.AsCurrency := valorTotal;

            // Se o último desconto aplicado é maior que o necessário para pagar o título
            // ajusta o desconto para ser exatamente o valor que falta para pagar do título
            if (diffDesconto < 0) then
            begin
               // Subtrai a diferença do valor do desconto (deixa o desconto com o valor que falta para completar o título)
               valorDescontoFixo := valorDescontoFixo - Abs(diffDesconto);
            end;
            
         end;

         //Cria a acao de movimento
         if ( cdsParcelasVL_DESC_EXTRA.AsCurrency > 0 ) then
         begin
            cdsDescontos.Insert;
            cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
            cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoFixo;
            cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := qryDescontoProgFixo.FieldByName('cd_acao_movimento').AsInteger;
            cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_FIXO;
            cdsDescontosDS_OBSERVACAO.AsString := qryDescontoProgFixo.FieldByName('ds_historico').AsString;
            cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger := qryDescontoProgFixo.FieldByName('cd_tipo_desconto').AsInteger;
            cdsDescontosSN_DESCONTO_PLANO.AsInteger := 0;
            cdsDescontos.Post;
         end;

         // Se os descontos 
         if (descontosCobremValorTitulo) then
         begin
            break;
         end;

      end;

      qryDescontoProgFixo.Next;
   end;

   cdsParcelas.Post;
end;

procedure TfrmReserva.AplicaDescontoCondicionalProgramado;
var
   valorDescontoCondicional, idxPercentualPlano,
   diffDesconto, valorTotal: Currency;
begin

   {
     APLICA O DESCONTO CONDICIONAL SOBRE A MENSALIDADE DO ALUNO

     Se o desconto foi informado como percentual (%), o percentual é convertido em base numérica, ou seja,
     converte o valor percentual em um valor real cálculado (R$)
   }

   // Posiciona na ultima parcela inserida no clienteDataSet
   cdsParcelas.Last;   

   // Busca os descontos programados CONDICIONAL do estudante
   qryDescontoProgCondicional.Close;
   qryDescontoProgCondicional.ParamByName('cd_curso').AsString := DM.tblDeptoCursoTurmaCurso.AsString;
   qryDescontoProgCondicional.ParamByName('cd_pessoa').AsInteger := xMatriculas.FieldByName('CodigoAluno').AsInteger;
   qryDescontoProgCondicional.ParamByName('cd_depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
   qryDescontoProgCondicional.ParamByName('nr_parcela').AsInteger := cdsParcelasNR_PARCELA.AsInteger;
   qryDescontoProgCondicional.ParamByName('cd_tipo_parcela').AsInteger := cdsParcelasCD_TIPO_TITULO.AsInteger;
   if tblPlanos.FieldByName('cd_coligada').AsInteger > 0 then
   begin
      qryDescontoProgCondicional.ParamByName('cd_coligada').AsInteger := tblPlanos.FieldByName('cd_coligada').AsInteger;
   end else begin
      qryDescontoProgCondicional.ParamByName('cd_coligada').Clear;
   end;
   qryDescontoProgCondicional.Open;

   cdsParcelas.Edit;      
      
   // Armazena todas as ações de movimento de desconto fixo
   qryDescontoProgCondicional.First;
   while not qryDescontoProgCondicional.Eof do
   begin
      valorDescontoCondicional := 0;

      // Verifica se existe um percentual de desconto informado específicamente para a pessoa (desconto especial)
      if ( qryDescontoProgCondicional.FieldByName('vl_percentual').AsFloat > 0 ) then
      begin
         valorDescontoCondicional := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgCondicional.FieldByName('vl_percentual').AsCurrency / 100);

      // Caso não existe um desconto especial para a pessoa, utiliza o desconto do plano de descontos se houver
      end else if ( qryDescontoProgCondicional.FieldByName('cd_desconto').AsFloat > 0 ) then
      begin
      
         // Verifica se o desconto do plano de descontos é percentual (%)
         if ( qryDescontoProgCondicional.FieldByName('percentualdesconto').AsFloat > 0 ) then
         begin
            valorDescontoCondicional := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgCondicional.FieldByName('percentualdesconto').AsCurrency / 100);

         // Verifica se o desconto do plano de descontos é em R$
         end else if ( qryDescontoProgCondicional.FieldByName('valordesconto').AsFloat > 0 ) then
         begin
            valorDescontoCondicional := qryDescontoProgCondicional.FieldByName('valordesconto').AsCurrency;
         end;
      end;

      valorDescontoCondicional := RoundFloat(valorDescontoCondicional, 2);

      // Verifica se existe algum valor de desconto
      if ( valorDescontoCondicional > 0 ) then
      begin
               
         //SOMA
         if ( qryDescontoProgCondicional.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_SOMA ) then
         begin
            cdsParcelasVL_DESCONTO.AsCurrency := cdsParcelasVL_DESCONTO.AsCurrency + valorDescontoCondicional;

         //PROPORCIONAL
         end else if ( qryDescontoProgCondicional.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_PROPORCIONAl ) then
         begin
            idxPercentualPlano := (cdsParcelasVL_DESCONTO.AsCurrency / (cdsParcelasVL_BRUTO.AsCurrency-cdsParcelasVL_DESC_EXTRA.AsCurrency));
            cdsParcelasVL_DESCONTO.AsCurrency := (((cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) - valorDescontoCondicional) * idxPercentualPlano) + valorDescontoCondicional;

         //SOBREPOR
         end else begin
            cdsParcelasVL_DESCONTO.AsCurrency := valorDescontoCondicional;
         end;

         cdsParcelasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasVL_DESCONTO.AsCurrency, 2); 

         // Verifica se os descontos não são maiores
         valorTotal := (cdsParcelasVL_BRUTO.AsCurrency + cdsParcelasVL_EXTRA.AsCurrency);
         diffDesconto := (valorTotal - cdsParcelasVL_DESC_EXTRA.AsCurrency);

         // Se o desconto fixo for menor que zero significa que o valor do desconto é maior que a mensalidade
         if ( diffDesconto < 0 ) then
         begin
            diffDesconto := 0;
         end;

         if ( cdsParcelasVL_DESCONTO.AsCurrency > diffDesconto ) then
         begin
            cdsParcelasVL_DESCONTO.AsCurrency := diffDesconto;
         end;

         cdsParcelasCD_DESC_CONDICIONAL.AsInteger := qryDescontoProgCondicional.FieldByName('cd_acao_movimento').AsInteger;

         //Cria a acao de movimento
         if ( cdsParcelasVL_DESCONTO.AsCurrency > 0 ) then
         begin
            cdsDescontos.Insert;
            cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
            cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoCondicional;
            cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := qryDescontoProgCondicional.FieldByName('cd_acao_movimento').AsInteger;
            cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_CONDICIONAL;
            cdsDescontosDS_OBSERVACAO.AsString := qryDescontoProgCondicional.FieldByName('ds_historico').AsString;
            cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger := qryDescontoProgCondicional.FieldByName('cd_tipo_desconto').AsInteger;
            cdsDescontosSN_DESCONTO_PLANO.AsInteger := 0;
            cdsDescontos.Post;
         end;

      end;

      qryDescontoProgCondicional.Next;      
   end;

   cdsParcelas.Post;
end;

function TfrmReserva.GetNrIdxProxParcela(): Integer;
begin

   {
      Retorna o número de indice da próxima parcela
      Esse nrIdxProxParcela é um número que será utilizado para linkar a parcela gerada no clientDataSet cdsParcelas
      com todos os descontos aplicados a essa parcela (que gerarão fin_mov_cr) que estão no clientDataSet cdsDescontos
      A variável após retornada é incrementada para que no próximo retorno já esteja com o valor atualizado
   }

   Result := nrIdxProxParcela;
   nrIdxProxParcela := nrIdxProxParcela + 1;
end;

function TfrmReserva.GetDescontoCondicionalPlanoPagamento(idxParcela: Integer): Currency;
var
   descontosCondicionaisAplicados: Currency;
begin

   {
      No campo cdsParcelasVL_DESCONTO.AsCurrency teremos o valor total dos descontos condicionais (que será gravado na tabela de mensalidades.valordesconto)
      A geração da ação de movimento (fin_mov_cr) do desconto condicional do plano de pagamento,
      deve ser o valor total dos descontos condicionais menos os valores dos descontos condicionais aplicados ao longo do processo.
      Exemplo:
      O total de descontos condicionais (plano + aplicados separadamente) é no valor de R$ 50,00
      O desconto condicional do plano que ficará para o plano é o que queremos descobrir, sendo que
      foi aplicado 2 descontos condicionais separadamente:
      1) R$ 10,00
      2) R$ 15,00
      Então o desconto condicional do plano de pagamento é 50,00 - 10,00 - 15,00 = R$ 25,00
   }

   cdsDescontos.Open;

   cdsDescontos.DisableControls;

   // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela repassada e que não são do plano de pagamento
   cdsDescontos.Filter := 'IDX_PARCELA = '+IntToStr(idxParcela)+' AND CD_TIPO_DESCONTO = 1 AND SN_DESCONTO_PLANO = 0';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;

   descontosCondicionaisAplicados := 0;
   
   while not cdsDescontos.Eof do
   begin
      descontosCondicionaisAplicados := descontosCondicionaisAplicados + RoundFloat(cdsDescontosVL_DESCONTO.AsCurrency, 2);

      cdsDescontos.Next;
   end;

   cdsDescontos.Close;
   cdsDescontos.Filter := '';
   cdsDescontos.Filtered := false;
   cdsDescontos.Open;

   Result := (cdsParcelasVL_DESCONTO.AsCurrency - descontosCondicionaisAplicados);

end;

procedure TfrmReserva.gerarAcoesMovimento(cd_mensalidade: Integer; idxParcela: String);
var
   Movimento: TMovimento;
   AcaoDescontoFixoPadrao, AcaoDescontoCondicionalPadrao: Integer;
begin

   // Ação de desconto padrão do fixo e condicional
   AcaoDescontoFixoPadrao := DM.BuscarCodigoAcaoPadrao(11);
   AcaoDescontoCondicionalPadrao := DM.BuscarCodigoAcaoPadrao(24);

   cdsDescontos.DisableControls;
   
   // Filtra apenas os descontos FIXOS (CD_TIPO_DESCONTO = 2) da parcela
   cdsDescontos.Filter := 'IDX_PARCELA = '+idxParcela+' AND CD_TIPO_DESCONTO = 2';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;
   while not cdsDescontos.Eof do
   begin
      Movimento := TMovimento.create;
      try
         Movimento.Observacao := cdsDescontosDS_OBSERVACAO.AsString;
         Movimento.TipoDeAcao := BaixarporDesconto;
         Movimento.CodigoTitulo := cd_mensalidade;
         Movimento.CodAcao := AcaoDescontoFixoPadrao;
         if cdsDescontosCD_ACAO_MOVIMENTO.AsInteger > 0 then
         begin
            Movimento.CodAcao := cdsDescontosCD_ACAO_MOVIMENTO.AsInteger;
         end;
         Movimento.ValorMovimento := RoundFloat(cdsDescontosVL_DESCONTO.AsCurrency, 2);
         Movimento.Coligada := Dm.tblDeptoCursoTurmacd_coligada.AsInteger;
         Movimento.DescontoPlano := cdsDescontosSN_DESCONTO_PLANO.AsInteger;
         Movimento.RegistrarMovimentacaoCR(0, false);
      finally
         Movimento.Free;
      end;

      cdsDescontos.Next;
   end;

   cdsDescontos.DisableControls;
   // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela
   cdsDescontos.Filter := 'IDX_PARCELA = '+idxParcela+' AND CD_TIPO_DESCONTO = 1';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;
   while not cdsDescontos.Eof do
   begin
      Movimento := TMovimento.create;
      try
         Movimento.Observacao := cdsDescontosDS_OBSERVACAO.AsString;
         Movimento.TipoDeAcao := BaixarporDesconto;
         Movimento.CodigoTitulo := cd_mensalidade;
         Movimento.CodAcao := AcaoDescontoCondicionalPadrao;
         if cdsDescontosCD_ACAO_MOVIMENTO.AsInteger > 0 then
         begin
            Movimento.CodAcao := cdsDescontosCD_ACAO_MOVIMENTO.AsInteger;
         end;
         Movimento.ValorDesconto := RoundFloat(cdsDescontosVL_DESCONTO.AsCurrency, 2);
         Movimento.Coligada := Dm.tblDeptoCursoTurmacd_coligada.AsInteger;
         Movimento.DescCondicional := 1;
         Movimento.DescontoPlano := cdsDescontosSN_DESCONTO_PLANO.AsInteger;
         Movimento.RegistrarMovimentacaoCR(0, false);
      finally
         Movimento.Free;
      end;

      cdsDescontos.Next;
   end;

end;

procedure TfrmReserva.atualizarBaixaPorDesconto(cd_mensalidade: Integer; MensDataBaixa: String);
const
   SQL_ATUALIZAR_BAIXA_POR_DESCONTO =
      'UPDATE '+
      '  mensalidades '+
      'SET '+
      '  situacao = 6, '+
      '  valordesconto = 0, '+
      '  datapagamento = CASE WHEN ((curdate() < datavencimento) OR (:MensDataBaixa LIKE "[VENCIMENTO]")) AND (:MensDataBaixa NOT LIKE "[BAIXA]") AND (:MensDataBaixa NOT LIKE "[ATUAL]") THEN datavencimento ELSE curdate() END, '+
      '  valortotal = CASE WHEN (valorbruto + valorextra + valorjuros - descontoextra - valordesconto) < 0 THEN 0 ELSE (valorbruto + valorextra + valorjuros - descontoextra - valordesconto) END '+
      'WHERE '+
      '  (descontoextra >= (valorbruto+valorextra)) AND '+
      '  cd_mensalidade = :cd_mensalidade';
var
   qyAtualizarBaixaDesconto: TUMZQuery;
begin

   if cd_mensalidade > 0 then
   begin
      DM.CriarConsulta(qyAtualizarBaixaDesconto);

      qyAtualizarBaixaDesconto.SQL.Text := SQL_ATUALIZAR_BAIXA_POR_DESCONTO;

      qyAtualizarBaixaDesconto.ParamByName('MensDataBaixa').AsString := MensDataBaixa;
      qyAtualizarBaixaDesconto.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;

      qyAtualizarBaixaDesconto.ExecSQL;
      
      qyAtualizarBaixaDesconto.Free;
   end;

end;

end.



