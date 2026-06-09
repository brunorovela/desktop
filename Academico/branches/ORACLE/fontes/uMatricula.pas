unit uMatricula;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, ZConnection, General,
   uMatricula_curso, ImgList, ToolWin, DBCtrls, Mask, Grids, DBGrids, CheckLst,
   ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Main, Spin,
   uClassMovimento, ZDbcIntfs, ClassRegistros;

type
 tDisc = record
     turma : string;
     curso : string;
     disciplina : integer;
     creditos : Currency;
     descricao : String;
     acao : Char;
  end;
  tResp = record
     codigo : Integer;
     bolsa : Integer;
     nome : string;
     valor : currency;
     percentual : currency;
  end;
  TAcao = (Matricular, AjustarMatricula);
  TFrmMatricula = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    qyMatriculaCurso: TUMZQuery;
    qyMatriculaCursonr_matricula: TStringField;
    qyMatriculaCursocd_curso: TStringField;
    qyMatriculaCursocd_turno: TStringField;
    qyMatriculaCursodt_ingresso: TDateTimeField;
    qyMatriculaCursodt_conclusao: TDateTimeField;
    qyMatriculaCursodt_colacao: TDateTimeField;
    qyMatriculaCursodt_exp_diploma: TDateTimeField;
    qyMatriculaCursodt_saida: TDateTimeField;
    qyMatriculaCursods_obs: TStringField;
    qyMatriculaCursodescIngressos: TStringField;
    qyMatriculaCursodescInstituicoes: TStringField;
    qyMatriculaCursods_situacao: TStringField;
    dsMatriculaCurso: TDataSource;
    ImageList2: TImageList;
    ImageList1: TImageList;
    qySituacoes: TUMZQuery;
    Panel1: TPanel;
    sbVoltar: TSpeedButton;
    sbAvancar: TSpeedButton;
    tblTurmas: TUMZQuery;
    dtcTurmas: TDataSource;
    qyTmpMensa: TUMZQuery;
    qyTmpMensavl_bruto: TFloatField;
    qyTmpMensavl_desconto: TFloatField;
    qyTmpMensavl_bolsa: TFloatField;
    qyTmpMensavl_extra: TFloatField;
    qyTmpMensadt_vencimento: TDateTimeField;
    qyTmpMensasn_credito: TSmallintField;
    qyTmpMensanr_credito: TFloatField;
    qyTmpMensads_mensa: TStringField;
    qyTmpMensasn_recibo: TSmallintField;
    dsTmpMensa: TDataSource;
    qyTmpMensanm_aluno: TStringField;
    qyTmpMensanm_resp: TStringField;
    qryInsert: TUMZQuery;
    qryMatricularGrade: TUMZQuery;
    PageControl1: TPageControl;
    tsMatriculaCurso: TTabSheet;
    Label14: TLabel;
    TabControl1: TTabControl;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbDataSaida: TLabel;
    Label6: TLabel;
    btnCurso: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbSituacao: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label32: TLabel;
    mc_dbCurso: TDBEdit;
    mc_dbAnoIngresso: TDBEdit;
    mc_dbDataIngresso: TDBEdit;
    mc_dbDataSaida: TDBEdit;
    mc_dbObs: TDBEdit;
    mc_dbTurno: TDBComboBox;
    mc_dbNumeroMatricula: TDBEdit;
    mc_dbFormaIngresso: TDBLookupComboBox;
    mc_dbInstituicao: TDBLookupComboBox;
    mc_dbSituacaoMatricula: TDBLookupComboBox;
    mc_dbGrade: TDBEdit;
    mc_dbDataConclusao: TDBEdit;
    mc_dbDataColacao: TDBEdit;
    mc_dbDataDiploma: TDBEdit;
    mc_dbAnoConclusao: TDBEdit;
    DBEdit1: TDBEdit;
    tsMatriculaEtapa: TTabSheet;
    Label1: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    sbCursoEtapa: TSpeedButton;
    grd: TDBGrid;
    CheckBox1: TCheckBox;
    txtCurso: TEdit;
    txtAnoSem: TEdit;
    dtpMatricula: TDateTimePicker;
    tsSelecaoDisciplina: TTabSheet;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    btnRemoverDisciplinas: TSpeedButton;
    lbCreditos: TLabel;
    lstDisciplinas: TCheckListBox;
    tsAlteracoesFinanceiras: TTabSheet;
    btnDesconto: TSpeedButton;
    btnBolsa: TSpeedButton;
    btnEntidade: TSpeedButton;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    Label24: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbDiscGrade: TLabel;
    lbDiscAnuais: TLabel;
    lbDiscMat: TLabel;
    DBGrid1: TDBGrid;
    tsConclusaoMatricula: TTabSheet;
    Label25: TLabel;
    Bevel1: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lbNomeAluno: TLabel;
    lbCurso: TLabel;
    lbTurmaMatricula: TLabel;
    lbDisciplinas: TLabel;
    lbPlanoPagamento: TLabel;
    Label36: TLabel;
    tsImpressaoDocumentos: TTabSheet;
    Label31: TLabel;
    btnRequerimento: TButton;
    btnBloqueto: TButton;
    btnContrato: TButton;
    btnConfiguracoes: TButton;
    qyTmpMensads_tipo_titulo: TStringField;
    DBGrid2: TDBGrid;
    Label33: TLabel;
    cbPlanos: TComboBox;
    qCaixaDepto: TUMZQuery;
    qyMatriculaCursocd_matricula_curso: TLargeintField;
    qyMatriculaCursocd_pessoa: TIntegerField;
    qyMatriculaCursonr_anosem_ingresso: TLargeintField;
    qyMatriculaCursocd_ingresso: TLargeintField;
    qyMatriculaCursocd_instituicao: TLargeintField;
    qyMatriculaCursocd_situacao: TLargeintField;
    qyMatriculaCursocd_grade: TLargeintField;
    qyMatriculaCursonr_anosem_conclusao: TLargeintField;
    qyMatriculaCursonr_anosem_grade: TLargeintField;
    qyTmpMensacd_planocontas: TLargeintField;
    qyTmpMensacd_mensa: TLargeintField;
    qyTmpMensacd_aluno: TLargeintField;
    qyTmpMensacd_resp: TLargeintField;
    qyTmpMensanr_parcela: TLargeintField;
    qyTmpMensacd_tipo_parcela: TLargeintField;
    qyTmpMensacd_bolsa: TLargeintField;
    tblTurmasCODIGO: TStringField;
    tblTurmasANOSEMESTRE: TSmallintField;
    tblTurmasCD_COLIGADA: TIntegerField;
    tblTurmasCURSO: TStringField;
    tblTurmasCD_DEPTO: TSmallintField;
    tblTurmasCD_CENTRO: TLargeintField;
    tblTurmasSN_BLOQUEAR_DISC_PENDENTES: TSmallintField;
    tblTurmasTURNO: TStringField;
    tblTurmasCD_GRADE: TLargeintField;
    tblTurmasSERIE: TSmallintField;
    tblTurmasDESCRICAO: TStringField;
    tblTurmasVAGAS: TSmallintField;
    tblTurmasNR_MATRICULAS: TLargeintField;
    sbDiscSelCursos: TSpeedButton;
    sbDiscDesSelCursos: TSpeedButton;
    procedure sbDiscDesSelCursosClick(Sender: TObject);
    procedure sbDiscSelCursosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbPlanosChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure btnContratoClick(Sender: TObject);
    procedure btnBloquetoClick(Sender: TObject);
    procedure btnRequerimentoClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure sbVoltarClick(Sender: TObject);
    procedure btnEntidadeClick(Sender: TObject);
    procedure btnBolsaClick(Sender: TObject);
    procedure lstDisciplinasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstDisciplinasDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnRemoverDisciplinasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure txtAnoSemExit(Sender: TObject);
    procedure sbCursoEtapaClick(Sender: TObject);
    procedure sbAvancarClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure qyMatriculaCursoNewRecord(DataSet: TDataSet);
    procedure qyMatriculaCursoBeforePost(DataSet: TDataSet);
    procedure qyMatriculaCursoBeforeOpen(DataSet: TDataSet);
    procedure mc_dbNumeroMatriculaEnter(Sender: TObject);
    procedure mc_dbCursoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCursoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    gerarDisciplinas : Boolean;
    aResponsaveis : Array of tResp;
    PodeMudar : Boolean;
    iPlanoPgto : Integer;
    ListaHorarios : TStringList;

    Function SalvarMatriculaCurso() : Boolean;
    Function MatriculaEtapa() : Boolean;
    Function SelecaoDisciplina() : Boolean;
    Function AlteracaoFinanceiro() : Boolean;
    Function ConclusaoMatricula() : Boolean;
    Function ImpressaoDocumentos() : Boolean;

    Procedure AtualizarGuias;
    Procedure SelecionarMatricula(CodMatricula : Integer);
    Procedure EditarMatricula(CodMatricula : Integer);
    Function IncluirMatricula() : Integer;
    Function ObterUltimoCodigo() : Integer;
    Procedure FiltraTurma;
    Function BuscarUltimaSerie() : Integer;
    Procedure MontarGradeDisciplinas;
    function total_creditos : Currency;
    procedure GerarMensalidades;
    procedure perdoar_mensalidades(codigoaluno : Integer; parcela : Integer; anosemestre : Integer; turma : String; vencimento : TDateTime );
    procedure InserirDisciplinas;
    procedure AplicarPlanoSelecionado(plano : TUMZQuery);

    Function BuscarDiscGrade(turma : String; anosem : integer) : Integer;
    Function BuscarDiscAnuais(codigoaluno : integer; anosem_atual : integer) : integer;

    procedure CalcularVencimento;
    procedure BuscarPlanos;
    function ExisteNoArray(VarArray : array of integer; valor : integer) : boolean;

    Procedure AplicarBolsasGratuidade(Bolsa : Integer; Valor : Currency; Percentual : Currency; Condicional : Boolean);
    Procedure AplicarBolsasEntidade(Bolsa : Integer; Valor : Currency; Percentual : Currency; Responsavel : Integer; NomeResponsavel : String);

    Procedure VerificarProgramacaoDescontos();
    function geraCdMatricula(Curso: String; AnoSem : Integer) : String;
  public
    { Public declarations }
    iCodAluno : Integer;
    sNomeAluno : String;
    iCodRespFinan : Integer;
    sNomeRespFinan : String;
    iAnoSem : Integer;
    aMatriculas : Array [0..100] of Integer;
    iMatriculaCurso : Integer;
    ArrayDisciplinas : Array of tDisc;
    ArrayDisciplinasAnteriores : Array of tDisc;
    Acao : TAcao;
    sTurma : String;
  end;

var
  FrmMatricula: TFrmMatricula;

implementation

uses
   uDM, uFSelecionarCurso, uTableFields, uMatricula_bolsas, uRepBloquetos, uAluno,
   uFuncoesGerais, uUsuario, uRemessaClass;

{$R *.dfm}

Function TFrmMatricula.AlteracaoFinanceiro : Boolean;
Var
  i : Integer;
  sAux : String;
  sOp : String;
begin

   // Preencher o resumo da matrícula

   lbNomeAluno.Caption := sNomeAluno;
   lbCurso.Caption := qyMatriculaCursocd_curso.AsString;
   lbTurmaMatricula.Caption := tblTurmasCODIGO.AsString + ' (' + tblTurmasANOSEMESTRE.AsString + ')';

   // Disciplinas
   sAux := '';
   sOp := '';
   for i := 0 to Length(ArrayDisciplinas) - 1 do begin
      sAux := sAux + sOp + ArrayDisciplinas[i].descricao;
      sOp := ' / ';
   end;

   lbDisciplinas.Caption := sAux;

   // Plano de Pagamento
   sAux := '';
   sOp := '';

//   sAux := tblPlanosDescricao.AsString + CHR(13) + CHR(13);
   sAux := sAux + 'Responsável Financeiro: ' + sNomeRespFinan + CHR(13) + CHR(13);
   
   for i := 0 to Length(aResponsaveis) - 1 do begin
      sAux := sAux + sOp + FloatToStrF(aResponsaveis[i].percentual, ffFixed, 5, 2) + ' % + ' + FloatToStrF(aResponsaveis[i].valor, ffFixed, 5, 2) + ' -> ' + aResponsaveis[i].nome;
      sOp := CHR(13);
   end;
   lbPlanoPagamento.Caption := sAux;

   sbAvancar.Caption := 'Confirmar';
   sbAvancar.Font.Style := [fsBold];

   PageControl1.ActivePage := tsConclusaoMatricula;

end;

procedure TFrmMatricula.CalcularVencimento;
Var
  i : Integer;
  iDiscGrade : Integer;
  iDiscAnuais : Integer;
  iDiscMatric : Integer;
  qyPlano : TUMZQuery;
  iDiscACobrar : Integer;
  qyAux : TUMZQuery;
  PlanosSemRepeticao : Array of integer;
begin
   // Calcular as propinas e inserir na tabela temporária do financeiro
   // Iniciar as parcelas conforme o plano de pagamentos;

   iDiscGrade := BuscarDiscGrade(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger);
   iDiscAnuais := BuscarDiscAnuais(iCodAluno, tblTurmasANOSEMESTRE.AsInteger);
   iDiscMatric := lstDisciplinas.Count;

   // Cobrar as disciplinas que o aluno está se inscrevendo + as disciplinas anuais em curso;
   iDiscACobrar :=  iDiscMatric + iDiscAnuais;

   lbDiscGrade.Caption := IntToStr(iDiscGrade);
   lbDiscAnuais.Caption := IntToStr(iDiscAnuais);
   lbDiscMat.Caption := IntToStr(iDiscMatric);

   // As disciplinas anuais devem agora fazer parte das disciplinas da grade curricular

   iDiscGrade := iDiscGrade + iDiscAnuais;

   Dm.CriarConsulta(qyAux);
   qyAux.SQL.Text :=
     ' DELETE FROM tmp_mensalidades WHERE cd_aluno = ' + InttoStr(iCodAluno);

   qyAux.ExecSQL();
   FreeAndNil(qyAux);

   // Proximo Passo - Selecionar o Plano de Pagamento apropriado pela turma

   Dm.CriarConsulta(qyPlano);

   // Buscar os itens do plano de pagamento por ordem de disciplinas mínimas decrescente
   // O número de disciplinas da grade ja será trocado pelo -1 dentro da seleção


   qyPlano.SQL.Text :=
     ' SELECT pp.cd_plano, pp.ds_plano, pi.cd_plano_item, ' +
     ' IF(pi.nr_disc_min=-1,'+IntToStr(iDiscGrade)+',pi.nr_disc_min) nr_disc_min, IF(pi.nr_disc_max=-1,'+IntToStr(iDiscGrade)+',pi.nr_disc_max) nr_disc_max, ' +
     ' pi.sn_pode_repetir, pi.cd_tipo_titulo, pi.nr_parcelas, ' +
     ' pi.vl_parcela, pi.vl_desconto, pi.dt_inicial, pi.dt_primeira_parc, pi.DT_SEGUNDA_PARC, pi.sn_dia_util, tt.cd_conta, tt.ds_tipo_titulo, ' +
     ' pi.sn_ultimo_dia_mes'+
     ' FROM fin_plano_pgto pp ' +
     ' INNER JOIN fin_plano_turmas pt ON (pp.cd_plano = pt.cd_plano) ' +
     ' INNER JOIN turmas as tu ON (tu.codigo = pt.cd_turma AND tu.anosemestre = pt.nr_anosem) '+
     ' INNER JOIN fin_planos_pgto_itens pi ON (pp.cd_plano = pi.cd_plano) ' +
     ' INNER JOIN fin_config_tipos_titulo tt ON (pi.cd_tipo_titulo = tt.cd_tipo_titulo) ' +
     ' WHERE pt.cd_turma = ' + QuotedStr(tblTurmasCODIGO.AsString) + ' AND pt.nr_anosem = ' + tblTurmasANOSEMESTRE.AsString +
     '   AND pp.ds_plano = "' + cbPlanos.Items.Strings[cbPlanos.ItemIndex] + '" ' +
     ' ORDER BY IF(pi.nr_disc_min=-1,'+IntToStr(iDiscGrade)+',pi.nr_disc_min) DESC ';

   qyPlano.Open();

   iPlanoPgto := qyPlano.FieldByName('cd_plano').AsInteger;

   // Varrer plano até que tenha disciplinas a cobrar

   while (not qyPlano.EOF) AND (iDiscACobrar > 0) do begin

      if (qyPlano.FieldByName('nr_disc_min').AsInteger <= iDiscACobrar) then begin

        if not ExisteNoArray(PlanosSemRepeticao, qyPlano.FieldByName('cd_plano_item').AsInteger) then begin

           i := qyPlano.FieldByName('nr_disc_min').AsInteger;
           iDiscACobrar := iDiscACobrar - qyPlano.FieldByName('nr_disc_max').AsInteger;

           repeat

               AplicarPlanoSelecionado(qyPlano);

               if qyPlano.FieldByName('sn_pode_repetir').AsInteger = 0 then begin

                  SetLength(PlanosSemRepeticao, Length(PlanosSemRepeticao) + 1);
                  PlanosSemRepeticao[Length(PlanosSemRepeticao)-1] := qyPlano.FieldByName('cd_plano_item').AsInteger;

               end;

              qyPlano.Next();

           until ((i <> qyPlano.FieldByName('nr_disc_min').AsInteger) OR (qyPlano.EOF));

           qyPlano.First();

        end else begin

           qyPlano.Next;
           
        end;

      end else begin

         qyPlano.Next();

      end;
   end;

   // Vefificar Plano de Desconto Programado

   qyTmpMensa.Close();
   qyTmpMensa.ParamByName('cd_aluno').AsInteger := iCodAluno;
   qyTmpMensa.ParamByName('cd_coligada').AsInteger := tblTurmasCD_COLIGADA.AsInteger;
   qyTmpMensa.Open();

   // Pegar o nome do responsavel financeiro
   if not qyTmpMensa.Eof then begin
      sNomeRespFinan := qyTmpMensanm_resp.AsString;
   end;

end;


procedure TFrmMatricula.cbPlanosChange(Sender: TObject);
begin
   CalcularVencimento();
end;

procedure TFrmMatricula.CheckBox1Click(Sender: TObject);
begin
   FiltraTurma;
end;

Function TFrmMatricula.ConclusaoMatricula : Boolean;
var
  qyAux : TUMZQuery;
begin

  { Aplica o Plano de Desconto Selecionado }

  if Mensagem( 'Deseja registrar a Matrícula ?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then begin

    // Inserir na tabela de matrículas

    if Acao = Matricular then begin

       DM.CriarConsulta( qyAux );

       qyAux.SQL.Text :=
         ' INSERT INTO matriculas (anosemestre, curso, turma, codigoaluno, dataemissao, ' +
         '   situacao, usuario, planopagamento, nr_aluno, cd_matricula_curso, cd_matricula) ' +
         ' VALUES ( :anosemestre, :curso, :turma, :codigoaluno, :dataemissao, ' +
         '   :situacao, :usuario, :planopagamento, :nr_aluno, :cd_matricula_curso, :cd_matricula) ';

       qyAux.ParamByName('anosemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
       qyAux.ParamByName('curso').AsString := tblTurmasCURSO.AsString;
       qyAux.ParamByName('turma').AsString := tblTurmasCODIGO.AsString;
       qyAux.ParamByName('codigoaluno').AsInteger := iCodAluno;
       qyAux.ParamByName('dataemissao').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);

       if DM.variavel_parametro('matriculas_situacao_padrao') <> '' Then begin
          qyAux.ParamByName('situacao').AsInteger := StrToInt(DM.variavel_parametro('matriculas_situacao_padrao'))
       end else begin
          qyAux.ParamByName('situacao').AsInteger := 1; { 1 - EM CURSO }
       end;

       qyAux.ParamByName('usuario').AsString := DM.sLogin;
       qyAux.ParamByName('planopagamento').AsInteger := iPlanoPgto;

       if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
         qyAux.ParamByName('nr_aluno').AsInteger := DM.DefineNumeroMatricula(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger)
       end else begin
         qyAux.ParamByName('nr_aluno').AsString := '';
       end;
       qyAux.ParamByName('cd_matricula').AsString := geraCdMatricula(tblTurmasCURSO.AsString,tblTurmasANOSEMESTRE.AsInteger);
       qyAux.ParamByName('cd_matricula_curso').AsInteger := qyMatriculaCursocd_matricula_curso.AsInteger;

       qyAux.ExecSQL();
       
    end;

    if not qyTmpMensa.IsEmpty() then begin
       GerarMensalidades;
    end;

    InserirDisciplinas;

    { Atualizar a Documentação }

    DM.AtualizaDocumentacao(iCodAluno, tblTurmasCURSO.AsString);

    if DM.variavel_parametro('academico_historico_series_inserir') = 'S' then
       DM.Gerar_Series_Conclusao(iCodAluno, tblTurmasCURSO.AsString, tblTurmasANOSEMESTRE.AsInteger);

    PageControl1.ActivePage := tsImpressaoDocumentos;
    
    sbAvancar.Caption := 'Fechar';
    sbVoltar.Enabled := False;

  end  else  begin
    
  end;


end;

procedure TFrmMatricula.mc_dbCursoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      Key := #0;
      SelectNext(Sender as TWinControl, True, True);
   end;
end;

procedure TFrmMatricula.mc_dbNumeroMatriculaEnter(Sender: TObject);
begin
     if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
     else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSem );

end;

procedure TFrmMatricula.EditarMatricula(CodMatricula: Integer);
begin

  mc_dbCurso.enabled := false;
  mc_dbAnoIngresso.enabled := false;
  mc_dbDataIngresso.enabled := false;
  mc_dbDataSaida.enabled := false;
  mc_dbObs.enabled := true;
  mc_dbTurno.enabled := true;
  mc_dbNumeroMatricula.enabled := true;
  mc_dbFormaIngresso.enabled := true;
  mc_dbInstituicao.enabled := false;
  mc_dbSituacaoMatricula.enabled := true;
  mc_dbGrade.enabled := true;
  mc_dbDataConclusao.enabled := false;
  mc_dbDataColacao.enabled := false;
  mc_dbDataDiploma.enabled := false;
  mc_dbAnoConclusao.enabled := true;
  btnCurso.Enabled := false;

   SelecionarMatricula(CodMatricula);
   qyMatriculaCurso.Edit();
   

end;

function TFrmMatricula.ExisteNoArray(VarArray: array of integer;
  valor: integer): boolean;
var
  n : integer;
begin

  result := false;

  for n := 0 to Length(VarArray) -1 do begin

     if VarArray[n] = valor then begin
        result := true;
     end;
  end;

end;

Function TFrmMatricula.ImpressaoDocumentos : Boolean;
begin

end;

function TFrmMatricula.IncluirMatricula: Integer;
begin

  mc_dbCurso.enabled := true;
  mc_dbAnoIngresso.enabled := true;
  mc_dbDataIngresso.enabled := true;
  mc_dbDataSaida.enabled := true;
  mc_dbObs.enabled := true;
  mc_dbTurno.enabled := true;
  mc_dbNumeroMatricula.enabled := true;
  mc_dbFormaIngresso.enabled := true;
  mc_dbInstituicao.enabled := true;
  mc_dbSituacaoMatricula.enabled := true;
  mc_dbGrade.enabled := true;
  mc_dbDataConclusao.enabled := true;
  mc_dbDataColacao.enabled := true;
  mc_dbDataDiploma.enabled := true;
  mc_dbAnoConclusao.enabled := true;
  btnCurso.Enabled := true;

  SelecionarMatricula(-1);
  qyMatriculaCurso.Insert();
  qyMatriculaCurso.FieldByName('cd_pessoa').AsInteger := iCodAluno;
  qyMatriculaCurso.FieldByName('dt_ingresso').AsDateTime := Dm.DataAtual;
  qyMatriculaCurso.FieldByName('nr_anosem_ingresso').AsInteger := iAnoSem;
  qyMatriculaCurso.FieldByName('nr_anosem_grade').AsInteger := iAnoSem;
  qyMatriculaCurso.FieldByName('cd_situacao').AsInteger := 1; // ATIVO;
  Result := 0;

end;

procedure TFrmMatricula.InserirDisciplinas;
Var
   n, i : Integer;
   iSit : Integer;
   Achou : Boolean;
   qyAcao : TUMZQuery;
   sChave : String;
   sAux : String;
begin
  { Inserir as Disciplinas na FichaIndividual }

  if DM.variavel_parametro('matriculas_situacao_padrao') <> '' Then
     iSit := StrToInt(DM.variavel_parametro('matriculas_situacao_padrao'))
  else
     iSit := 1; { 1 - EM CURSO }

  // Verificar as disciplinas atuais que não ficarão mais na grade do aluno - REMOVER

  Achou := false;

  for n := 0 to Length(ArrayDisciplinasAnteriores) - 1 do begin

     // Verificar as disciplinas já matriculadas - Ignorá-las
     for i := 0 to Length(ArrayDisciplinas) - 1 do begin

        if (ArrayDisciplinas[i].turma = ArrayDisciplinasAnteriores[n].turma) AND (ArrayDisciplinas[i].disciplina = ArrayDisciplinasAnteriores[n].disciplina) then begin

           ArrayDisciplinas[i].acao := 'E'; // Excluir do Array - IGNORAR
           ArrayDisciplinasAnteriores[n].acao := 'E';
           Achou := True;

        end;

     end;

     // Verificar as disciplinas já matriculadas que serão removidas
     if not Achou then begin

        ArrayDisciplinasAnteriores[n].acao := 'D'; // Deletar da base de dados

     end;
     Achou := false;
  
  end;

  // Deletar as disciplinas matriculadas

  if Length(ArrayDisciplinasAnteriores) > 0 then begin

     DM.CriarConsulta(qyAcao);
     qyAcao.SQL.Text := ''+
       ' DELETE FROM fichaindividual ' +
       ' WHERE codigoaluno = ' + InttoStr(iCodAluno) +
       '   AND anosemestre = ' + IntToStr(iAnoSem) + 
       '   AND disciplina = :disciplina AND turma = :turma '; 

     for i := 0 to Length(ArrayDisciplinasAnteriores) - 1 do begin

        if ArrayDisciplinasAnteriores[i].acao = 'D' then begin

           // Gravar Ação da Mudança
           sChave := IntToStr(iCodAluno) + ';' + ArrayDisciplinasAnteriores[i].turma + ';' + IntToStr(ArrayDisciplinasAnteriores[i].disciplina);
           sAux := 'Ajuste de Matrícula - Retirou disciplina: ' + ArrayDisciplinasAnteriores[i].descricao;
           DM.setLog(1033, 'Exclusao', sChave, DM.getColigadaByTurma(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger), sAux );

           qyAcao.ParamByName('disciplina').AsInteger := ArrayDisciplinasAnteriores[i].disciplina;
           qyAcao.ParamByName('turma').AsString := ArrayDisciplinasAnteriores[i].turma;
           qyAcao.ExecSQL();

        end;

     end;

     FreeAndNil(qyAcao);     

  end;


  For n := 0 to Length(ArrayDisciplinas)- 1 do
  Begin
    try

        if ArrayDisciplinas[n].acao = 'I' then begin

           qryMatricularGrade.ParamByName('codigoaluno').AsInteger := iCodAluno;
           qryMatricularGrade.ParamByName('anosemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
           qryMatricularGrade.ParamByName('disciplina').AsInteger := arrayDisciplinas[n].disciplina;
           qryMatricularGrade.ParamByName('turmamatricula').AsString := tblTurmasCODIGO.AsString;
           qryMatricularGrade.ParamByName('situacao').AsInteger := iSit;
           qryMatricularGrade.ParamByName('turma').AsString := ArrayDisciplinas[n].turma;
           qryMatricularGrade.ExecSQL;

           DM.callProcedure('CALL INICIAR_MATRICULA ( ' +
              tblTurmasANOSEMESTRE.AsString + ', ' +
              QuotedStr(ArrayDisciplinas[n].turma) + ', ' +
              IntToStr(arrayDisciplinas[n].disciplina) + ', ' +
              IntToStr(iCodAluno) + ')',
              False
           );

        end;

        if Length(ArrayDisciplinasAnteriores) > 0 then begin

           // Gravar Ação da Mudança
           sChave := IntToStr(iCodAluno) + ';' + ArrayDisciplinas[n].turma + ';' + IntToStr(ArrayDisciplinas[n].disciplina);
           sAux := 'Ajuste de Matrícula - Incluiu disciplina: ' + ArrayDisciplinas[n].descricao;
           DM.setLog(1033, 'Inclusao', sChave, DM.getColigadaByTurma(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger), sAux );

        end;

    except
    end;

  End;


end;


procedure TFrmMatricula.lstDisciplinasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  int: Integer;
  qyDisc : TUMZQuery;
  sGrupoDisc : String;
  aux : String;
  prereq : String;
  i : Integer;

begin
  { Quando arrastar da Disciplina para a Grade }
  if Source is TTreeView then
  begin
    if frmTableFields.Tag <> 10 then
    Begin
            Mensagem( 'Arraste para as disciplinas Matriculadas.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
            Exit;
    End;

    MyTreeNode := frmTableFields.Tree.Selected.GetPrev;

    while (not MyTreeNode.HasChildren) do
    begin
      Inc(int);
      if int > 100 then break;
      MyTreeNode := MyTreeNode.GetPrev;
    end;

    // Checar a Disciplina, verificar se ja existe

    for i := 0 to Length(ArrayDisciplinas) - 1 do begin

       if (ArrayDisciplinas[i].disciplina = StrToInt(Copy(frmTableFields.Tree.Selected.Text,1,11))) AND
          (ArrayDisciplinas[i].curso = trim(frmTableFields.Tree.Selected.Parent.Parent.Text)) Then begin

          Mensagem('Disciplina já foi adicionada.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
          Abort;
          
       end;

    end;

    // ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].turma := trim(frmTableFields.Tree.Selected.Parent.Text);
    // ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].curso := trim(frmTableFields.Tree.Selected.Parent.Parent.Text);
    // ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].disciplina := StrToInt(Copy(frmTableFields.Tree.Selected.Text,1,5));


    lstDisciplinas.Items.Add(frmTableFields.Tree.Selected.Parent.Text + ' - ' + Copy(frmTableFields.Tree.Selected.Text,1,11) + ' - ' +  Copy(frmTableFields.Tree.Selected.Text,9,length(frmTableFields.Tree.Selected.Text)));

    // Pre requisito
    // Selecionar as disciplinas que são pré-requisitas
    DM.qAux1.Close();
    DM.qAux1.SQL.Clear();
    DM.qAux1.SQL.Add('SELECT pre.*, d.descricao FROM disciplinas_prereq pre INNER JOIN disciplinas d ON (pre.cd_discipli = d.codigo AND d.curso = pre.cd_curso) ');
    DM.qAux1.SQL.Add(', turmas as t ');
    DM.qAux1.SQL.Add(' WHERE pre.cd_curso = '''+trim(frmTableFields.Tree.Selected.Parent.Parent.Text)+''' AND pre.cd_discipli = '+Copy(frmTableFields.Tree.Selected.Text,1,11));
    DM.qAux1.SQL.Add(' AND t.codigo = "' + trim(frmTableFields.Tree.Selected.Parent.Text) + '" ');
    DM.qAux1.SQL.Add(' AND t.anosemestre = ' + tblTurmasANOSEMESTRE.AsString);
    DM.qAux1.SQL.Add(' AND t.cd_grade = pre.cd_grade ');
    Dm.qAux1.SQL.Add('ORDER by pre.cd_discipli ');
    DM.qAux1.Open();

    sGrupoDisc := 'XXXXXXXXXXX';

    // Percorrer as disciplinas pré-requisitas
    while not DM.qAux1.Eof do begin

         //Verificar quais as disciplinas o aluno não cursou ainda
         DM.qAux2.Close;
         DM.qAux2.SQL.Clear;
         DM.qAux2.SQL.Text :=
           ' SELECT d.codigo, d.descricao, fi.codigoaluno ' +
           ' FROM disciplinas d LEFT JOIN fichaindividual fi ON (fi.disciplina = d.codigo AND  ' +
           ' d.curso = fi.curso AND fi.codigoaluno = ' + IntToStr(iCodAluno) +
           ' AND (fi.situacao IN(SELECT cd_situacao FROM situacao WHERE cd_situacao_pai IN(0, 1, 12)))) ' +
           ' WHERE d.curso = ''' + Dm.qAux1.FieldByName('cd_curso').AsString + ''' AND d.codigo = '+DM.qAux1.FieldByName('cd_discipli_pre').AsString+' AND isNull(fi.codigoaluno)';
         DM.qAux2.Open;

         if (sGrupoDisc <> FillString(Dm.qAux1.FieldByName('cd_curso').AsString,alRight, '0', 15, false) + FillString(DM.qAux1.FieldByName('cd_discipli').AsString, alRight, '0',10, false)) then begin

              sGrupoDisc := FillString(Dm.qAux1.FieldByName('cd_curso').AsString,alRight, '0', 15, false) + FillString(DM.qAux1.FieldByName('cd_discipli').AsString, alRight, '0',10, false);
              aux := chr(13) + 'Para: '+Dm.qAux1.FieldByName('cd_discipli').AsString + ' - ' + Dm.qAux1.FieldByName('descricao').AsString+' os pré-requisitos são:';

          end;

          while not DM.qAux2.Eof do begin

              prereq := prereq + aux + chr(13) + DM.qAux2.FieldByName('codigo').AsString + ' - ' + DM.qAux2.FieldByName('descricao').AsString;
              aux := '';
              DM.qAux2.Next;

              lstDisciplinas.Checked[lstDisciplinas.Count-1] := true;
          end;

          DM.qAux1.Next();

    End;

    if prereq <> '' then begin
        if not DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false ) then begin
              // Não tem autorização para o pré-requisito 
              Mensagem('As disciplinas mostradas possuem pré-requisitos em que o aluno ainda não possui aprovação:'+chr(13)+prereq+chr(13)+chr(13)+'VocÃª não tem permissão para adicionar disciplinas com pré-requisitos.', 'Confirmação', MB_OK + MB_ICONQUESTION, Handle);
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

    // fim pré requisito

    SetLength(ArrayDisciplinas, lstDisciplinas.Items.Count);

    ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].turma := trim(frmTableFields.Tree.Selected.Parent.Text);
    ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].curso := trim(frmTableFields.Tree.Selected.Parent.Parent.Text);
    ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].disciplina := StrToInt(Copy(frmTableFields.Tree.Selected.Text,1,11));
    ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].acao := 'I';

    try
      Dm.CriarConsulta(qyDisc);

      // Pegar a quantidade de créditos

      qyDisc.SQL.Clear;
      qyDisc.SQL.Add(' select g.numeroaulas, d.descricao ');
      qyDisc.SQL.Add(' from gradecurricular g, turmas t, cursos c, disciplinas d ');
      qyDisc.SQL.Add(' where g.serie = t.serie and g.anosemestre = t.anosemestre and g.curso = t.curso and t.cd_grade = g.cd_grade and ');
      qyDisc.SQL.Add(' g.turno = t.turno and t.curso = c.codigo and t.anosemestre = c.anosemestre and ');
      qyDisc.SQL.Add(' g.disciplina = d.codigo and g.curso = d.curso');
      qyDisc.SQL.Add(' and t.codigo = ''' + ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].turma + ''' and t.anosemestre = ' + tblTurmasANOSEMESTRE.AsString );
      qyDisc.SQL.Add(' and g.disciplina = ' + IntToStr(ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].disciplina) );

      qyDisc.Open;

      ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].creditos := qyDisc.FieldByName('numeroaulas').AsInteger;
      ArrayDisciplinas[ lstDisciplinas.Items.Count - 1 ].descricao := qyDisc.FieldByName('descricao').AsString;

      lbCreditos.Caption := 'Número de Créditos: ' + CurrToStr(total_creditos);

    finally

      qyDisc.Free;

    end;

  end;

end;

procedure TFrmMatricula.lstDisciplinasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure TFrmMatricula.FiltraTurma;
var
   LFilter: string;
begin
   if Acao = Matricular then
   begin
      txtCurso.Enabled := true;
      txtAnoSem.Enabled := true;
      dtpMatricula.Enabled := true;
      CheckBox1.Visible := false;

      if CheckBox1.Visible Then
      begin
          if CheckBox1.Checked Then
          begin
             LFilter := Format('CURSO = %s AND SERIE = %d', [
                QuotedStr(txtCurso.Text), BuscarUltimaSerie
             ]);
             tblTurmas.Close;
             tblTurmas.ParamByName('NR_ANOSEMESTRE').AsString := txtAnoSem.Text;
             tblTurmas.Filter := LFilter;
             tblTurmas.Open;
             Exit;
          end
      end;
      LFilter := Format('CURSO = %s', [QuotedStr(txtCurso.Text)]);
      tblTurmas.Close;
      tblTurmas.ParamByName('NR_ANOSEMESTRE').AsString := txtAnoSem.Text;
      tblTurmas.Filter := LFilter;
      tblTurmas.Open;
   end
   else
   begin
      txtCurso.Enabled := false;
      txtAnoSem.Enabled := false;
      dtpMatricula.Enabled := false;
      CheckBox1.Visible := false;

      LFilter := Format('CODIGO = %s', [QuotedStr(sTurma)]);
      tblTurmas.Close;
      tblTurmas.ParamByName('NR_ANOSEMESTRE').AsInteger := iAnoSem;
      tblTurmas.Filter := LFilter;
      tblTurmas.Open;
   end;
end;

procedure TFrmMatricula.FormCreate(Sender: TObject);
begin
   ListaHorarios := TStringList.Create();
end;

procedure TFrmMatricula.FormShow(Sender: TObject);
begin
  {
    Abrindo o formulário de Matrícula
    Será repassado somente a variavel iCodPessoa
  }

  // Iniciar na Matrícula do curso
  PageControl1.ActivePage := tsMatriculaCurso;
  sbAvancar.Caption := 'Avançar';
  sbAvancar.Font.Style := [];


  // Atualizar as instituiçÃµes de Origem
  DM.tblInstituicoes.Close();
  DM.tblInstituicoes.Open();

  // Organizar as guias das matrículas no curso
  AtualizarGuias();

  gerarDisciplinas := True;

end;

function TFrmMatricula.geraCdMatricula(Curso: String; AnoSem : Integer): String;
Var
   NovoCod : String;
   Cod : Integer;
   qyCod : TUMZQuery;
   maxCod : Integer;
   maxCodStr : String;
   sqlAdicional : String;
begin
   Dm.CriarConsulta(qyCod);

   qyCod.Close();
   qyCod.SQL.Text :=
      ' SELECT ds_valor FROM parametros WHERE ds_variavel in (''matricula_numero_mascara'',''matricula_mascara_sql'') order by ds_variavel desc  ';
   qyCod.Open();
   qyCod.First;
   NovoCod := qyCod.FieldByName('ds_valor').AsString;

   if NovoCod = '' then NovoCod := '[cd_pessoa]';

   NovoCod := ReplaceStr(NovoCod, '[as]', Copy(IntToStr(AnoSem), 4, 2));
   NovoCod := ReplaceStr(NovoCod, '[AS]', Copy(IntToStr(Dm.GetAnoSemestreAtual), 4, 2));
   NovoCod := ReplaceSTR(NovoCod, '[curso]', FillString(Curso, alRight, '0', 2, true));

   NovoCod := ReplaceStr(NovoCod, '[cd_pessoa]', IntToStr(iCodAluno));

   NovoCod := ReplaceSTR(NovoCod, '[qqq]', '%');



   if(NovoCod = '%') then
   begin
      qyCod.Next;
      sqlAdicional := qyCod.FieldByName('ds_valor').AsString;
      
      qyCod.Close();
      qyCod.SQL.Text :=
          ' Select cd_matricula from matriculas ' +
          ' WHERE cd_matricula like ''' + NovoCod + ''' ' +
          sqlAdicional +
          ' ORDER BY cd_matricula DESC';
      qyCod.Open();
      qycod.First;

      maxCod := 0;
      while not qycod.Eof do
      begin
         try
            if(qyCod.FieldByName('cd_matricula').AsInteger > maxCod) then
            begin
               maxCod := qyCod.FieldByName('cd_matricula').AsInteger;
            end;
            qyCod.Next;
         except
            qycod.Next;
         end;
      end;
      novoCod := inttostr(maxCod + 1) ;

   end;
   
   Result := novoCod;

   FreeAndNil(qyCod);

end;

procedure TFrmMatricula.GerarMensalidades;
var
  wDia, wMes, wAno : Word;
  movimento : TMovimento;
  chaves : String;
  iMensalidade : Integer;
  qyTmp : TUMZQuery;
  objRemessa: TRemessa;
begin

  // Apagar as mensalidades criadas que não ficarão mais para o aluno
  DM.CriarConsulta(qyTmp);
  if Acao = AjustarMatricula then begin


     qyTmp.SQL.Text :=
       ' SELECT m.codigoaluno, m.cd_mensalidade, m.anosemestre, m.parcela, m.turma, m.datavencimento, m.nossonumero FROM mensalidades m     ' +
       ' LEFT JOIN tmp_mensalidades t ON (m.codigoaluno = t.cd_aluno AND m.parcela = t.nr_parcela AND ' +
       ' m.cd_tipo_titulo = t.cd_tipo_parcela AND m.cd_item_plano = t.cd_item_plano)  ' +
       ' WHERE m.codigoaluno = ' + IntToStr(iCodAluno) +
       '   AND m.turma = "' + sTurma + '" AND m.anosemestre = ' + IntToStr(iAnoSem) + ' AND t.cd_item_plano is null ' +
       '   AND m.situacao in (2,10) AND m.tipoparcela = 0 ';
     qyTmp.Open();

     // Apagar as mensalidades existentes que não estão mais no novo plano

     if not qyTmp.Eof then begin

        while not qyTmp.Eof do begin

            // Logs

            chaves := FillString(qyTmp.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                      qyTmp.FieldByName('anosemestre').AsString + ';' + qyTmp.FieldByName('turma').AsString + ';' +
                      qyTmp.FieldByName('parcela').AsString + ';' +
                      FormatDateTime('dd/mm/yyyy',qyTmp.FieldByName('datavencimento').AsDateTime) + ';';

            DM.FazAcaoRemessa(arCancelar, qyTmp.FieldByName('cd_mensalidade').AsInteger);

            if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
            begin
              // registra a nova ação de cancelamento no novo modelo de remessa
              objRemessa := TRemessa.Create;
              objRemessa.registraAcaoCancelamento(qyTmp.FieldByName('nossonumero').AsString);
            end;

            DM.setLog(2013, 'Exclusao', chaves, DM.getColigadaByTurma(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger), 'Parcela Excluída pela matrícula (NN = ' + qyTmp.FieldByName('nossonumero').AsString +  ')');
            qyTmp.Next();

        end;

        // Apagar as mensalidades

        qyTmp.Close();
        qyTmp.SQL.Text :=
          ' DELETE m,t FROM mensalidades m                                             ' +
          ' LEFT JOIN tmp_mensalidades t ON (m.codigoaluno = t.cd_aluno AND m.parcela = t.nr_parcela AND ' +
          ' m.cd_tipo_titulo = t.cd_tipo_parcela AND m.cd_item_plano = t.cd_item_plano)                  ' +
          ' WHERE m.codigoaluno = ' + IntToStr(iCodAluno) +
          '   AND m.turma = "' + sTurma + '" AND m.anosemestre = ' + IntToStr(iAnoSem) + ' AND t.cd_item_plano is null ' +
          '   AND m.situacao in (2,10) AND m.tipoparcela = 0 ';
        qyTmp.ExecSQL();

     end;

  end;

  { Gera as mensalidades na tabela mensalidades }

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger :=  tblTurmasANOSEMESTRE.AsInteger;
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := tblTurmasCODIGO.AsString;
  DM.tblDeptoCursoTurma.Open;

  qyTmp.Close();
  if Acao = Matricular then begin

     qyTmp.SQL.Text := ' SELECT m.*, a.nm_pessoa nm_aluno, r.nm_pessoa nm_resp, t.ds_tipo_titulo FROM tmp_mensalidades m '+
                       ' INNER JOIN pessoas a ON (m.cd_aluno = a.cd_pessoa) ' +
                       ' INNER JOIN pessoas r ON (m.cd_resp = r.cd_pessoa) ' +
                       ' INNER JOIN fin_tipos_titulo t ON (m.cd_tipo_parcela = t.cd_tipo_titulo AND t.cd_coligada = '+tblTurmasCD_COLIGADA.AsString+') ' +
                       ' WHERE m.cd_aluno = ' + IntToStr(iCodAluno) + 
                       ' ORDER BY cd_resp, dt_vencimento, nr_parcela, t.ds_tipo_titulo ' ;

  end else begin

     { qyTmp.SQL.Text := ' SELECT m.*, a.nm_pessoa nm_aluno, r.nm_pessoa nm_resp, t.ds_tipo_titulo FROM tmp_mensalidades m '+
                       ' INNER JOIN pessoas a ON (m.cd_aluno = a.cd_pessoa) ' +
                       ' INNER JOIN pessoas r ON (m.cd_resp = r.cd_pessoa) ' +
                       ' INNER JOIN fin_tipos_titulo t ON (m.cd_tipo_parcela = t.cd_tipo_titulo) ' +
                       ' LEFT JOIN mensalidades me ON (me.codigoaluno = m.cd_aluno AND me.parcela = m.nr_parcela AND ' +
                       '     me.cd_tipo_titulo = m.cd_tipo_parcela AND me.cd_item_plano = m.cd_item_plano ' +
                       '     AND me.turma = "' + sTurma + '" AND me.anosemestre = ' + IntToStr(iAnoSem) + ') '+
                       ' WHERE m.cd_aluno = ' + IntToStr(iCodAluno) + ' AND me.cd_item_plano is null ';
      }

      // Verificar se já tem alguma parcela gerada para o mesmo tipo, e mesmo valor, independente do plano 16/02/2011
     qyTmp.SQL.Text := ' SELECT m.*, a.nm_pessoa nm_aluno, r.nm_pessoa nm_resp, t.ds_tipo_titulo FROM tmp_mensalidades m '+
                       ' INNER JOIN pessoas a ON (m.cd_aluno = a.cd_pessoa) ' +
                       ' INNER JOIN pessoas r ON (m.cd_resp = r.cd_pessoa) ' +
                       ' INNER JOIN fin_tipos_titulo t ON (m.cd_tipo_parcela = t.cd_tipo_titulo AND t.cd_coligada = '+tblTurmasCD_COLIGADA.AsString+') ' +
                       ' LEFT JOIN mensalidades me ON (me.codigoaluno = m.cd_aluno AND me.parcela = m.nr_parcela AND ' +
                       '     me.cd_tipo_titulo = m.cd_tipo_parcela AND me.valorbruto = m.vl_bruto ' +
                       '     AND me.turma = "' + sTurma + '" AND me.anosemestre = ' + IntToStr(iAnoSem) + ') '+
                       ' WHERE m.cd_aluno = ' + IntToStr(iCodAluno) + ' AND me.cd_item_plano is null ';
  end;

  qyTmp.Open();

  qyTmp.First;
  while not qyTmp.Eof do begin

       qryInsert.Close;

       qCaixaDepto.Close;
       qCaixaDepto.SQL.Clear;
       qCaixaDepto.SQL.Add('select d.cd_caixa, d.cd_boleto_padrao from');
       qCaixaDepto.SQL.Add('departamentos d');
       qCaixaDepto.SQL.Add('where d.codigo = :depto ');
       qCaixaDepto.ParamByName('depto').AsInteger := tblTurmasCD_DEPTO.AsInteger;
       qCaixaDepto.Open;


       qryInsert.ParamByName('Curso').AsString := DM.tblDeptoCursoTurmaCurso.AsString;
       qryInsert.ParamByName('Depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;

       qryInsert.ParamByName('CodigoAluno').asInteger := iCodAluno;
       qryInsert.ParamByname('Parcela').AsSmallInt := ABS(qyTmp.FieldByName('nr_parcela').AsInteger);
       qryInsert.ParamByName('Turma').AsString := tblTurmasCODIGO.AsString;
       qryInsert.ParamByName('DataEmissao').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
       qryInsert.ParamByName('DataVencimento').AsString := FormatDateTime('yyyy-mm-dd',qyTmp.FieldByName('dt_vencimento').AsDateTime);

       if DM.variavel_parametro('financeiro_boleto_escolha_aluno') <> 'S' then begin
          qryInsert.ParamByName('nossonumero').AsString := DM.NovoNumero( DM.tblDeptoCursoTurmaDepto.AsInteger, tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger, 0, 0, 0, iCodAluno, Copy( qryInsert.ParamByName('DataVencimento').AsString , 3, 2 ), Copy( qryInsert.ParamByName('DataEmissao').AsString, 3, 2 ) );
       end else begin
          qryInsert.ParamByName('nossonumero').AsString := '';
       end;

       qryInsert.ParamByName('ValorBruto').AsFloat := RoundFloat( qyTmp.FieldByName('vl_bruto').AsCurrency, 2 );

       qryInsert.ParamByName('ValorDesconto').AsFloat := qyTmp.FieldByName('vl_desconto').AsCurrency;
       qryInsert.ParamByName('DescontoExtra').AsFloat := qyTmp.FieldByName('vl_bolsa').AsCurrency;

       qryInsert.ParamByName('ValorExtra').AsFloat := qyTmp.FieldByName('vl_extra').AsCurrency;
       qryInsert.ParamByName('ValorTotal').AsFloat := RoundFloat( ( qyTmp.FieldByName('vl_bruto').AsCurrency + qyTmp.FieldByName('vl_extra').AsCurrency -
                                                      qyTmp.FieldByName('vl_desconto').AsCurrency - qyTmp.FieldByName('vl_bolsa').AsCurrency ), 2 );
       qryInsert.ParamByName('ValorJuros').AsFloat := 0;
       if DM.variavel_parametro('matriculas_situacao_padrao') <> '' Then
          qryInsert.ParamByName('Situacao').AsSmallInt := StrToInt(DM.variavel_parametro('matriculas_situacao_padrao'))
       else
          qryInsert.ParamByName('Situacao').AsSmallInt := 2;
       qryInsert.ParamByName('Usuario').AsString := DM.sLogin;
       qryInsert.ParamByName('Bloqueto').AsString := 'N';
       qryInsert.ParamByName('AnoSemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
       qryInsert.ParamByName('Tipo').AsInteger := 0; // Mensalidade

       qryInsert.ParamByName('cd_caixa').AsInteger := qCaixaDepto.FieldByName('cd_boleto_padrao').AsInteger;

       qryInsert.ParamByName('IndiceCorrecao').AsFloat := 0;

       // A competencia refere-se ao vencimento inicial da mensalidade
       // Porém, ela não pode ser gerada em datas retroativas
        
       if qyTmp.FieldByName('dt_vencimento').AsDateTime < DataHoje then begin
           qryInsert.ParamByName('dt_competencia').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
       end
       else begin
           qryInsert.ParamByName('dt_competencia').AsString := FormatDateTime('yyyy-mm-dd',qyTmp.FieldByName('dt_vencimento').AsDateTime);
       end;

       DecodeDate( qyTmp.FieldByName('dt_vencimento').AsDateTime, wAno, wMes, wDia );
       qryInsert.ParamByName('DataBaseCorrecao').AsString := FormatDateTime('yyyy-mm-dd',DataValida( wAno, wMes, 1 ));

       if qyTmp.FieldByName('sn_credito').AsInteger = 1 then
          qryInsert.ParamByName('sn_credito_parcela').AsString := qyTmp.FieldByName('sn_credito').AsString
       else
          qryInsert.ParamByName('sn_credito_parcela').AsString := qyTmp.FieldByName('sn_credito').AsString;
          
       qryInsert.ParamByName('nr_creditos').AsCurrency := qyTmp.FieldByName('nr_credito').AsCurrency;
       qryInsert.ParamByName('cd_mensalidade_origem').AsInteger := -1;
       qryInsert.ParamByName('cd_tipo_titulo').AsInteger := qyTmp.FieldByName('cd_tipo_parcela').AsInteger;
       qryInsert.ParamByName('cd_plano_conta').AsInteger := qyTmp.FieldByName('cd_planocontas').AsInteger;
       qryInsert.ParamByName('cd_centro_custo').AsInteger := tblTurmasCD_CENTRO.AsInteger;;
       qryInsert.ParamByName('ds_historico').AsString := qyTmp.FieldByName('ds_mensa').AsString;
       qryInsert.ParamByName('cd_coligada').AsInteger := DM.getColigadaByTurma(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger);
       qryInsert.ParamByName('cd_resp').AsInteger := qyTmp.FieldByName('cd_resp').AsInteger;
       qryInsert.ParamByName('cd_bolsa').AsInteger := qyTmp.FieldByName('cd_bolsa').AsInteger;
       qryInsert.ParamByName('cd_item_plano').AsInteger := qyTmp.FieldByName('cd_item_plano').AsInteger;
       qryInsert.ExecSQL;

       iMensalidade := DM.LastInsert;

        // Log

       chaves := FillString(IntToStr(iCodAluno), alRight, '0', 10, true ) + ';' +
                   tblTurmasANOSEMESTRE.AsString + ';' + tblTurmasCODIGO.AsString + ';' +
                   IntToStr(ABS(qyTmp.FieldByName('nr_parcela').AsInteger)) + ';' +
                   FormatDateTime('yyyy-mm-dd',qyTmp.FieldByName('dt_vencimento').AsDateTime) + ';';

       DM.setLog(2013, 'inclusao', chaves, DM.getColigadaByTurma(tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger), 'Parcela gerada pela matrícula (NN = ' + qryInsert.ParamByName('NossoNumero').AsString +  ')');


        // Gerar Movimentação

          Movimento := TMovimento.create;

          movimento.TipoDeAcao      := GerarTitulos;
          movimento.CodigoTitulo    := iMensalidade;
          movimento.CodAcao         := DM.BuscarCodigoAcaoPadrao( 1 ); // Geração Manual de Mensalidades
          movimento.ValorMovimento  := RoundFloat( qyTmp.FieldByName('vl_bruto').AsCurrency, 2 ) + qyTmp.FieldByName('vl_extra').AsCurrency;
          
          movimento.RegistrarMovimentacaoCR( 0 );

          // Gerar Apropriações


          if qyTmp.FieldByName('vl_bolsa').AsCurrency > 0 then begin

             movimento.TipoDeAcao      := BaixarporDesconto;
             movimento.CodAcao         := DM.BuscarCodigoAcaoPadrao( 11 );  // Desconto Extra;
             movimento.ValorMovimento  := qyTmp.FieldByName('vl_bolsa').AsCurrency;

             Movimento.CodigoMovimento := movimento.CodigoTitulo;

             movimento.RegistrarMovimentacaoCR( 0 );

          end;

          FreeAndNil( movimento );



       if qyTmp.FieldByName('nr_parcela').AsInteger < 0 then
          perdoar_mensalidades(iCodAluno, ABS(qyTmp.FieldByName('nr_parcela').AsInteger), tblTurmasANOSEMESTRE.AsInteger, tblTurmasCODIGO.AsString, qyTmp.FieldByName('dt_vencimento').AsDateTime);


    with Dm.qyAux do begin
            Close;
            SQL.Clear;
            SQL.Add(
            ' UPDATE mensalidades                          ' +
            ' SET cd_mensalidade_origem  = cd_mensalidade  ' +
            ' WHERE                                        ' +
            '   codigoaluno = :CdAluno  AND                ' +
            '   cd_mensalidade_origem = -1                        '
            );
            ParamByName('CdAluno').AsInteger := iCodAluno;
            ExecSQL;

    end;

    qyTmp.Next();

  end;

  FreeAndNil(qyTmp);

end;

Function TFrmMatricula.SalvarMatriculaCurso : Boolean;
Var
  iRetorno : Integer;
begin

   if qyMatriculaCurso.State in [dsInsert, dsEdit] then begin
     if qyMatriculaCurso.State in [dsEdit] then begin
         txtAnoSem.Text := IntToStr(iAnoSem);
     end;
     qyMatriculaCurso.Post();
   end;

   if (TabControl1.TabIndex > 0) AND (Acao = Matricular) then begin
      iRetorno := aMatriculas[TabControl1.TabIndex];
   end else begin
      iRetorno := ObterUltimoCodigo();
   end;

   qyMatriculaCurso.Close();
   qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := iRetorno;
   qyMatriculaCurso.Open();

   // Fazer o filtro inicial das turmas para matrícula
   txtCurso.Text  := qyMatriculaCursocd_curso.AsString;
   dtpMatricula.Date := Date;
   FiltraTurma();

   PageControl1.ActivePage := tsMatriculaEtapa;
   sbAvancar.Caption := 'Avançar';
   sbAvancar.Font.Style := [];


end;

Function TFrmMatricula.MatriculaEtapa : Boolean;
Var qyDiscPendentes : TUMZQuery;
    sDisc, sOp : String;
begin

   // Verificar se a Matrícula na Etapa foi bem sucedida...

   if tblTurmasSN_BLOQUEAR_DISC_PENDENTES.AsInteger = 1 then begin

       Dm.CriarConsulta(qyDiscPendentes);
       qyDiscPendentes.Close();
       qyDiscPendentes.SQL.Text :=
         ' SELECT di.codigo, di.curso, di.descricao, gc.nr_serie as serie from grades_disciplinas gc ' +
         ' INNER JOIN disciplinas di ON (gc.cd_disciplina = di.codigo AND gc.cd_curso = di.curso) ' +
         ' LEFT JOIN fichaindividual fi ON (fi.curso = fi.curso AND fi.disciplina = gc.cd_disciplina AND fi.situacao IN (SELECT cd_situacao FROM situacao WHERE cd_situacao_pai IN(0,12)) ' +
         ' AND fi.codigoaluno = ' + IntToStr(iCodAluno) + ')' +
         ' WHERE ' +
         ' gc.cd_curso = "'+ tblTurmasCURSO.AsString + '" AND '  +
         ' gc.cd_grade = ' + tblTurmasCD_GRADE.AsString + ' AND ' +
         ' gc.nr_serie < ' + tblTurmasSERIE.AsString + ' AND fi.codigoaluno is null ';

       qyDiscPendentes.Open();

       if qyDiscPendentes.RecordCount > 0 then begin
          sDisc := '';
          sOp := '';

          while not qyDiscPendentes.EOF do begin

             if not CursouDisciplina(iCodAluno, qyDiscPendentes.FieldByName('curso').AsString, qyDiscPendentes.FieldByName('codigo').AsInteger, qyDiscPendentes.FieldByName('serie').AsInteger) then begin

                sDisc := sDisc + sOp + '- ' + qyDiscPendentes.FieldByName('descricao').AsString;
                sOp := CHR(13);

             end;
             qyDiscPendentes.Next();
          end;

          if sOp <> '' then begin

             Mensagem('Não é possível matricular o estudante nesta turma. As seguintes disciplinas estão pendentes: ' + CHR(13) + sDisc, 'Atenção', MB_OK + MB_ICONWARNING, Handle);
             PageControl1.ActivePage := tsMatriculaEtapa;
             sbAvancar.Caption := 'Avançar';
             sbAvancar.Font.Style := [];
             exit;

          end;

       end;

   end;


   if gerarDisciplinas then
      MontarGradeDisciplinas;

   PageControl1.ActivePage := tsSelecaoDisciplina;
   sbAvancar.Caption := 'Avançar';
   sbAvancar.Font.Style := [];

end;

procedure TFrmMatricula.MontarGradeDisciplinas;
const
   SSQLDiscHorarios =
      'SELECT DISTINCT ' +
         'GD.CD_GRADE,' +
         'GD.NR_SERIE SERIE,' +
         'C.NR_GRAU GRAU,' +
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
            'JOIN CURSOS_COLIGADAS CC ON ' +
               '(T.CURSO = CC.CD_CURSO) AND ' +
               '(T.CD_COLIGADA = CC.CD_COLIGADA) ' +
            'JOIN CURSOS_MESTRE C ON' +
               '(CC.CD_CURSO = C.CD_CURSO) ' +
            'JOIN TURMAS_HORARIOS H ON' +
               '(T.CODIGO = H.TURMA) AND' +
               '(T.ANOSEMESTRE = H.ANOSEMESTRE) AND' +
               '(D.CODIGO = H.DISCIPLINA)' +
      'WHERE ' +
         'H.TURMA_BASE = :CD_TURMA AND ' +
         'H.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'CC.SN_ATIVO = 1';

   SSQLDisciplinas =
      'SELECT ' +
         'GD.CD_GRADE,' +
         'GD.NR_SERIE SERIE,' +
         'C.NR_GRAU GRAU,' +
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
            'JOIN CURSOS_COLIGADAS CC ON ' +
               '(T.CURSO = CC.CD_CURSO) AND ' +
               '(T.CD_COLIGADA = CC.CD_COLIGADA) ' +
            'JOIN CURSOS_MESTRE C ON' +
               '(CC.CD_CURSO = C.CD_CURSO) ' +
      'WHERE ' +
         'T.CODIGO = :CD_TURMA AND ' +
         'T.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'CC.SN_ATIVO = 1 AND ' +
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

   ListaHorarios.Clear;


   if Acao = Matricular then begin

      { Criar uma nova query }
      try

         DM.CriarConsulta(qyDisc);
         DM.CriarConsulta(qyHorario);

         // Selecionar as disciplinas do horário registrado na turma matrícula
         qyDisc.Close;
         qyDisc.SQL.Text := SSQLDiscHorarios;
         qyDisc.ParamByName('CD_TURMA').AsString := tblTurmasCODIGO.AsString;
         qyDisc.ParamByName('NR_ANOSEMESTRE').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
         qyDisc.Open;

         // Se o horário ja estiver montado, o sistema deve sugerir as disciplinas do horário somente
         if qyDisc.IsEmpty then
         begin

           // Selecionar as disciplinas da grade referente a turma selecionada
           // Isso só vai acontecer se o horário da turma não foi definido

           qyDisc.Close;
           qyDisc.SQL.Text := SSQLDisciplinas;
           qyDisc.ParamByName('CD_TURMA').AsString := tblTurmasCODIGO.AsString;
           qyDisc.ParamByName('NR_ANOSEMESTRE').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
           qyDisc.Open;
         end;

         lstDisciplinas.Items.Clear;
         SetLength(ArrayDisciplinas, qyDisc.RecordCount);

         i := 0;

         // Listar as disciplinas do ListItems
         while not qyDisc.Eof do Begin

            // Retirar da listagem as disciplinas já cursadas

            if not CursouDisciplina(iCodAluno, qyDisc.FieldByName('curso').AsString, qyDisc.FieldByName('disciplina').AsInteger, qyDisc.FieldByName('serie').AsInteger) then begin

               // Carregar o horário de todas as disciplinas

               qyHorario.Close();
               qyHorario.SQL.Text := '' +
                ' SELECT DISTINCT CONCAT(dia_semana, "_", cd_horario) horario  ' +
                ' FROM turmas_horarios                                ' +
                ' WHERE anosemestre = ' + tblTurmasANOSEMESTRE.AsString +
                '   AND turma = "' +  qyDisc.FieldByName('turma').AsString + '" ' +
                '   AND disciplina = ' + qyDisc.FieldByName('disciplina').AsString;
               qyHorario.Open();

               while not qyHorario.Eof do begin
                   ListaHorarios.Add( qyHorario.FieldByName('horario').AsString );
                   qyHorario.Next();
               end;

               // Horarios das disciplinas carregados para a ListaHorarios

               lstDisciplinas.Items.Add(qyDisc.FieldByName('turma').AsString + ' - ' + FillString(qyDisc.FieldByName('disciplina').AsString, alRight, '0', 11, False ) + ' - ' +  qyDisc.FieldByName('descricao').AsString);

               ArrayDisciplinas[i].turma := qyDisc.FieldByName('turma').AsString;
               ArrayDisciplinas[i].curso := qyDisc.FieldByName('curso').AsString;
               ArrayDisciplinas[i].disciplina := qyDisc.FieldByName('disciplina').AsInteger;
               ArrayDisciplinas[i].descricao := qyDisc.FieldByName('descricao').AsString;
               ArrayDisciplinas[i].creditos := qyDisc.FieldByName('numeroaulas').AsCurrency;
               ArrayDisciplinas[i].acao := 'I'; // Incluir;


               qyHorario.SQL.Text := ' '+
                 ' SELECT serie FROM turmas  '+
                 ' WHERE codigo = "' + qyDisc.FieldByName('turma').AsString + '" ' +
                 '   AND anosemestre = ' + tblTurmasANOSEMESTRE.AsString;
               qyHorario.Open();

               iSerie := qyHorario.FieldByName('serie').AsInteger;

               // Selecionar as disciplinas que são pré-requisitas
               DM.qAux1.Close();
               DM.qAux1.SQL.Clear();
               DM.qAux1.SQL.Add('SELECT * FROM disciplinas_prereq WHERE cd_curso = '''+qyDisc.FieldByName('curso').AsString+''' AND cd_discipli = '+qyDisc.FieldByName('disciplina').AsString);
               DM.qAux1.SQL.Add(' AND cd_grade = ' + qyDisc.FieldByName('cd_grade').AsString );
               Dm.qAux1.SQL.Add(' ORDER by cd_discipli ');
               DM.qAux1.Open();

               sGrupoDisc := 'XXXXXXXXXXX';

               // Percorrer as disciplinas pré-requisitas
               while not DM.qAux1.Eof do begin

                  if not CursouDisciplina(iCodAluno, DM.qAux1.FieldByName('cd_curso').AsString, DM.qAux1.FieldByName('cd_discipli_pre').AsInteger, iSerie ) then begin

                      //Verificar quais as disciplinas o aluno não cursou ainda
                      DM.qAux2.Close;
                      DM.qAux2.SQL.Clear;
                      DM.qAux2.SQL.Text :=
                       ' SELECT d.codigo, d.descricao, fi.codigoaluno ' +
                       ' FROM disciplinas d LEFT JOIN fichaindividual fi ON (fi.disciplina = d.codigo AND  ' +
                       ' d.curso = fi.curso AND fi.codigoaluno = ' + IntToStr(iCodAluno) +
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
              // Não tem autorização para matricular com pré-requisitos
              btnRemoverDisciplinasClick( nil );

           end else begin

              // Tem autorização para matricular com pré-requisito
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
   end else begin //AjustarMatricula
      try
         DM.CriarConsulta(qyDisc);
         DM.CriarConsulta(qyHorario);

        // Selecionar as disciplinas da MATRÍCULA DO ALUNO, JÁ QUE É UM AJUSTE

        qyDisc.SQL.Clear;
        qyDisc.SQL.Add(' SELECT concat(g.NR_ANO_INICIAL,g.CD_CURSO,lpad(gd.NR_SERIE,2,0),t.turno,lpad(gd.CD_DISCIPLINA,5,0)) codigo, gd.nr_serie, c.grau, t.curso, gd.cd_disciplina disciplina, d.descricao, gd.nr_aulas numeroaulas, t.codigo as turma, t.curso ');
        qyDisc.SQL.Add(' FROM fichaindividual f ');
        qyDisc.SQL.Add(' INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) ');
        qyDisc.SQL.Add(' INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) ');
        qyDisc.SQL.Add(' INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina AND gd.nr_serie = f.serie) ');
        qyDisc.SQL.Add(' INNER JOIN cursos c ON (t.curso = c.codigo AND t.anosemestre = c.anosemestre ) ');
        qyDisc.SQL.Add(' INNER JOIN disciplinas d ON (gd.cd_disciplina = d.codigo and gd.cd_curso = d.curso ) ');
        qyDisc.SQL.Add(' WHERE ');
        qyDisc.SQL.Add('    f.turmamatricula = :turmamatricula and t.anosemestre = :anosemestre');
        qyDisc.SQL.Add('  AND f.codigoaluno = :codigoaluno');

        qyDisc.ParamByName('turmamatricula').AsString := tblTurmasCODIGO.AsString;
        qyDisc.ParamByName('anosemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
        qyDisc.ParamByName('codigoaluno').AsInteger := iCodAluno;

        qyDisc.Open();

         lstDisciplinas.Items.Clear;
         SetLength(ArrayDisciplinas, qyDisc.RecordCount);

         i := 0;

         // Listar as disciplinas do ListItems
         while not qyDisc.Eof do Begin

            // Retirar da listagem as disciplinas já cursadas

               // Carregar o horário de todas as disciplinas

               qyHorario.Close();
               qyHorario.SQL.Text := '' +
                ' SELECT DISTINCT CONCAT(dia_semana, "_", cd_horario) horario  ' +
                ' FROM turmas_horarios                                ' +
                ' WHERE anosemestre = ' + tblTurmasANOSEMESTRE.AsString +
                '   AND turma = "' +  qyDisc.FieldByName('turma').AsString + '" ' +
                '   AND disciplina = ' + qyDisc.FieldByName('disciplina').AsString;
               qyHorario.Open();

               while not qyHorario.Eof do begin
                   ListaHorarios.Add( qyHorario.FieldByName('horario').AsString );
                   qyHorario.Next();
               end;

               // Horarios das disciplinas carregados para a ListaHorarios

               lstDisciplinas.Items.Add(qyDisc.FieldByName('turma').AsString + ' - ' + FillString(qyDisc.FieldByName('disciplina').AsString, alRight, '0', 11, False ) + ' - ' +  qyDisc.FieldByName('descricao').AsString);

               ArrayDisciplinas[i].turma := qyDisc.FieldByName('turma').AsString;
               ArrayDisciplinas[i].curso := qyDisc.FieldByName('curso').AsString;
               ArrayDisciplinas[i].disciplina := qyDisc.FieldByName('disciplina').AsInteger;
               ArrayDisciplinas[i].descricao := qyDisc.FieldByName('descricao').AsString;
               ArrayDisciplinas[i].creditos := qyDisc.FieldByName('numeroaulas').AsCurrency;
               ArrayDisciplinas[i].acao := 'I';

               qyHorario.SQL.Text := ' '+
                 ' SELECT serie FROM turmas  '+
                 ' WHERE codigo = "' + qyDisc.FieldByName('turma').AsString + '" ' +
                 '   AND anosemestre = ' + tblTurmasANOSEMESTRE.AsString;
               qyHorario.Open();

               iSerie := qyHorario.FieldByName('serie').AsInteger;

               Inc(i);


               qyDisc.Next;
         End;

         for i := 0 to lstDisciplinas.Count - 1 do begin
             lstDisciplinas.Checked[i] := false;
         end;

         if Acao = AjustarMatricula then begin

            SetLength(ArrayDisciplinasAnteriores, Length(ArrayDisciplinas));

            for i := 0 to Length(ArrayDisciplinas) - 1 do begin
               ArrayDisciplinasAnteriores[i] := ArrayDisciplinas[i];
            end;

         end else begin

            SetLength(ArrayDisciplinasAnteriores, 0);

         end;      

         lbCreditos.Caption := 'Número de Créditos: ' + CurrToStr(total_creditos);

      finally

        FreeAndNil(qyDisc);

        FreeAndNil(qyHorario);

      end;       


   end;


end;

function TFrmMatricula.ObterUltimoCodigo: Integer;
Var
  qAux : TUMZQuery;
begin
  DM.CriarConsulta(qAux);
  qAux.SQL.Text :=
     ' SELECT cd_matricula_curso FROM matriculas_curso ' +
     ' WHERE cd_pessoa = ' + IntToStr( iCodAluno ) +
     ' ORDER BY cd_matricula_curso DESC LIMIT 1 ';
  qAux.Open();
  if qAux.EOF then
     Result := -1
  else
     Result := qAux.FieldByName('cd_matricula_curso').AsInteger;

  FreeAndNil(qAux);
end;

procedure TFrmMatricula.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    AllowChange := PodeMudar;
    if not PodeMudar then begin

       Mensagem('Utilize os botões Avançar ou Voltar para continuar a matrícula', 'Atenção', MB_OK + MB_ICONWARNING, Handle);

    end;
    PodeMudar := False;
end;

procedure TFrmMatricula.perdoar_mensalidades(codigoaluno, parcela,
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
      DM.tblMotivosMotivo.AsString := 'Matrícula apÃ³s o inicio da turma';

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

procedure TFrmMatricula.qyMatriculaCursoBeforeOpen(DataSet: TDataSet);
begin
   qySituacoes.Close();
   qySituacoes.Open();
end;

procedure TFrmMatricula.qyMatriculaCursoBeforePost(DataSet: TDataSet);
begin
   if qyMatriculaCursonr_matricula.AsString = '' then begin

      if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
      else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSem );
   end;
end;

procedure TFrmMatricula.qyMatriculaCursoNewRecord(DataSet: TDataSet);
begin
   qyMatriculaCursocd_grade.AsInteger := 1;
end;

Function TFrmMatricula.SelecaoDisciplina : Boolean;
begin

   // Pegar os Planos de Pagamentos

   SetLength(aResponsaveis, 0);

   BuscarPlanos;

   CalcularVencimento();

   VerificarProgramacaoDescontos;

   PageControl1.ActivePage := tsAlteracoesFinanceiras;

   sbAvancar.Caption := 'Avançar';
   sbAvancar.Font.Style := [];     

end;

procedure TFrmMatricula.AplicarBolsasEntidade(Bolsa: Integer; Valor,
  Percentual: Currency; Responsavel: Integer; NomeResponsavel : String);
Var
  cValorFixo, cValorPerc : Currency;
begin

   // Verificar se foi selecionado o responsável
   if Responsavel = 0 then begin

      Mensagem('Não foi selecionado o responsável financeiro.', 'Anteção', MB_OK + MB_ICONERROR, Handle);
      Exit;

   end;

   cValorFixo := Valor;
   cValorPerc := Percentual;

   // Adicionar o responsável Financeiro

   SetLength(aResponsaveis, Length(aResponsaveis) + 1);

   aResponsaveis[Length(aResponsaveis) - 1].codigo    := Responsavel;
   aResponsaveis[Length(aResponsaveis) - 1].bolsa     := Bolsa;
   aResponsaveis[Length(aResponsaveis) - 1].nome      := NomeResponsavel;
   aResponsaveis[Length(aResponsaveis) - 1].valor     := cValorFixo;
   aResponsaveis[Length(aResponsaveis) - 1].percentual:= cValorPerc;

   CalcularVencimento();

   qyTmpMensa.Close();
   qyTmpMensa.ParamByName('cd_aluno').AsInteger := iCodAluno;
   qyTmpMensa.ParamByName('cd_coligada').AsInteger := tblTurmasCD_COLIGADA.AsInteger;

   qyTmpMensa.Open();

end;


procedure TFrmMatricula.AplicarBolsasGratuidade(Bolsa : Integer; Valor : Currency; Percentual : Currency; Condicional : Boolean);
var
   cValorFixo, cValorPerc : Currency;
   qyAcao : TUMZQuery;
begin

   cValorFixo := Valor;
   cValorPerc := Percentual;

   qyTmpMensa.First();
   while NOT qyTmpMensa.EOF do begin

      // tmp_mensalidades tm INNER JOIN fin_bolsas_tipos_titulos tt ON (tt.cd_bolsa = 18 AND tm.cd_tipo_parcela = tt.cd_tipo_titulo)

      DM.CriarConsulta(qyAcao);
      qyAcao.SQL.Text := ' UPDATE tmp_mensalidades tm INNER JOIN fin_bolsas_tipos_titulos tt ' +
      ' ON (tt.cd_bolsa = '+IntToStr(Bolsa)+' AND tm.cd_tipo_parcela = tt.cd_tipo_titulo) ';

      if not Condicional then begin

         qyAcao.SQL.Add(' SET tm.cd_bolsa = '+ IntToStr(Bolsa) +',  tm.vl_bolsa = ((tm.vl_bruto * :bolsa_perc / 100)) + :bolsa_valor ')

      end else begin

         qyAcao.SQL.Add(' SET tm.cd_bolsa = '+ IntToStr(Bolsa) +', tm.vl_desconto = ((tm.vl_bruto * :bolsa_perc / 100)) + :bolsa_valor ');

      end;
      qyAcao.SQL.Add(' WHERE tm.cd_mensa = :cd_mensa AND tm.cd_aluno = ' + IntToStr(iCodAluno));

      qyAcao.ParamByName('bolsa_perc').AsCurrency  := cValorPerc;
      qyAcao.ParamByName('bolsa_valor').AsCurrency := cValorFixo;
      qyAcao.ParamByName('cd_mensa').AsInteger := qyTmpMensacd_mensa.AsInteger;

      qyAcao.ExecSQL();

      qyTmpMensa.Next();

   end;

   qyTmpMensa.Close();
   qyTmpMensa.ParamByName('cd_aluno').AsInteger := iCodAluno;
   qyTmpMensa.ParamByName('cd_coligada').AsInteger := tblTurmasCD_COLIGADA.AsInteger;
   qyTmpMensa.Open();

end;

procedure TFrmMatricula.AplicarPlanoSelecionado(plano : TUMZQuery);
Var
   qyAux : TUMZQuery;
   qyAux2 : TUMZQuery;
   n, nPar : Integer;
   dVenc, dPrimeira, SegundaParc: TDateTime;
   ValorRestante, DescRestante : Currency;
   bUltimoDia : Boolean;
   wdia, wmes, wano : Word;
   bDiaUtil : Boolean;
begin

   DM.CriarConsulta(qyAux);
   DM.CriarConsulta(qyAux2);


   qyAux.SQL.Text :=
     ' INSERT INTO tmp_mensalidades (cd_aluno, cd_resp, nr_parcela, ' +
     ' vl_bruto, vl_desconto, vl_bolsa, vl_extra, dt_vencimento, sn_credito,  ' +
     ' nr_credito, cd_tipo_parcela, cd_planocontas, ds_mensa, sn_recibo, cd_item_plano, cd_bolsa)      ' +
     ' VALUES (:cd_aluno, :cd_resp, :nr_parcela, ' +
     ' :vl_bruto, :vl_desconto, :vl_bolsa, :vl_extra, :dt_vencimento, :sn_credito,  ' +
     ' :nr_credito, :cd_tipo_parcela, :cd_planocontas, :ds_mensa, :sn_recibo, :cd_item_plano, :cd_bolsa)';

   // Inserir o número de parcelas do plano de pagamento;

   ValorRestante := plano.FieldByName('vl_parcela').AsCurrency;
   DescRestante := plano.FieldByName('vl_desconto').AsCurrency;

   for n := 0 to Length(aResponsaveis) - 1 do begin

     // SE TIPO DE TITULO TEM ESSA BOLSA...

     qyAux2.Close();
     qyAux2.SQL.Text :=
       ' SELECT * FROM fin_bolsas_tipos_titulos ' +
       ' WHERE cd_bolsa = '+IntToStr(aResponsaveis[n].bolsa)+' AND cd_tipo_titulo = ' + plano.FieldByName('cd_tipo_titulo').AsString;
     qyAux2.Open();

     if not qyAux2.EOF then begin

         dVenc := plano.FieldByName('dt_inicial').AsDateTime;

         // Pegar data da primeira parcela
         if plano.FieldByName('dt_primeira_parc').AsString <> '' then
            dPrimeira := plano.FieldByName('dt_primeira_parc').AsDateTime
         else
            dPrimeira := dVenc;

         if plano.FieldByName('DT_SEGUNDA_PARC').IsNull then
            SegundaParc := dVenc
         else
            SegundaParc := plano.FieldByName('DT_SEGUNDA_PARC').AsDateTime;

         DecodeDate(dVenc, wano, wmes, wdia);

         bUltimoDia := (plano.FieldByName('sn_ultimo_dia_mes').AsInteger = 1);

         bDiaUtil := (plano.FieldByName('sn_dia_util').AsInteger = 1);

         for nPar := 1 to plano.FieldByName('nr_parcelas').AsInteger do begin

           if bUltimoDia then begin
              wdia := DaysPerMonth[wmes];
           end;

           if bDiaUtil then
              dVenc := DiaUtilAteSabado(wano, wmes, wdia)
           else
              dVenc := DataValida(wano, wmes, wdia);

           qyAux.ParamByName('cd_aluno').AsInteger    := iCodAluno;
           qyAux.ParamByName('cd_resp').AsInteger     := aResponsaveis[n].codigo;
           qyAux.ParamByName('nr_parcela').AsInteger  := nPar;
           qyAux.ParamByName('vl_bruto').AsCurrency   := ((plano.FieldByName('vl_parcela').AsCurrency * aResponsaveis[n].percentual / 100) + aResponsaveis[n].valor);
           qyAux.ParamByName('vl_desconto').AsCurrency:= (plano.FieldByName('vl_desconto').AsCurrency * aResponsaveis[n].percentual / 100);
           qyAux.ParamByName('vl_bolsa').AsCurrency   := 0;
           qyAux.ParamByName('vl_extra').AsCurrency   := 0;

            if nPar = 1 then
            begin
               qyAux.ParamByName('dt_vencimento').AsDate := TDate(dPrimeira);
            end
            else if nPar = 2 then
            begin
               qyAux.ParamByName('dt_vencimento').AsDate := TDate(SegundaParc);
            end
            else
            begin
               qyAux.ParamByName('dt_vencimento').AsDate := TDate(dVenc);
               wmes := wmes + 1;
               if wmes > 12 then
               begin
                  wmes := 1;
                  wano := wano + 1;
               end;
            end;
           qyAux.ParamByName('sn_credito').AsInteger  := 0;
           qyAux.ParamByName('nr_credito').AsInteger  := 0;
           qyAux.ParamByName('cd_tipo_parcela').AsInteger := plano.FieldByName('cd_tipo_titulo').AsInteger;
           qyAux.ParamByName('cd_planocontas').AsInteger  := plano.FieldByName('cd_conta').AsInteger;
           qyAux.ParamByName('ds_mensa').AsString     := plano.FieldByName('ds_tipo_titulo').AsString ;
           qyAux.ParamByName('sn_recibo').AsInteger   := 0;
           qyAux.ParamByName('cd_item_plano').AsInteger   := plano.FieldByName('cd_plano_item').AsInteger ;
           qyAux.ParamByName('cd_bolsa').AsInteger := aResponsaveis[n].bolsa;

           qyAux.ExecSQL();

         end;

         ValorRestante := ValorRestante - ((plano.FieldByName('vl_parcela').AsCurrency * aResponsaveis[n].percentual / 100) + aResponsaveis[n].valor);
         DescRestante := DescRestante - (plano.FieldByName('vl_desconto').AsCurrency * aResponsaveis[n].percentual / 100);

     end;

   end;

   if ValorRestante > 0 then begin

      dVenc := plano.FieldByName('dt_inicial').AsDateTime;

      DecodeDate(dVenc, wano, wmes, wdia);

      bUltimoDia := (plano.FieldByName('sn_ultimo_dia_mes').AsInteger = 1);

      bDiaUtil := (plano.FieldByName('sn_dia_util').AsInteger = 1);

      // Pegar data da primeira parcela
      if plano.FieldByName('dt_primeira_parc').AsString <> '' then
         dPrimeira := plano.FieldByName('dt_primeira_parc').AsDateTime
      else
         dPrimeira := dVenc;

      if plano.FieldByName('DT_SEGUNDA_PARC').IsNull then
         SegundaParc := dVenc
      else
         SegundaParc := plano.FieldByName('DT_SEGUNDA_PARC').AsDateTime;

      for nPar := 1 to plano.FieldByName('nr_parcelas').AsInteger do begin

         if bUltimoDia then begin
            wdia := DaysPerMonth[wmes];
         end;

         if bDiaUtil then
            dVenc := DiaUtilAteSabado(wano, wmes, wdia)
         else
            dVenc := DataValida(wano, wmes, wdia);

         qyAux.ParamByName('cd_aluno').AsInteger    := iCodAluno;
         qyAux.ParamByName('cd_resp').AsInteger     := iCodRespFinan;
         qyAux.ParamByName('nr_parcela').AsInteger  := nPar;
         qyAux.ParamByName('vl_bruto').AsCurrency   := ValorRestante;
         qyAux.ParamByName('vl_desconto').AsCurrency:= DescRestante;
         qyAux.ParamByName('vl_bolsa').AsCurrency   := 0;
         qyAux.ParamByName('vl_extra').AsCurrency   := 0;

         if nPar = 1 then
         begin
            qyAux.ParamByName('dt_vencimento').AsDate := TDate(dPrimeira);
         end
         else if nPar = 2 then
         begin
            qyAux.ParamByName('dt_vencimento').AsDate := TDate(SegundaParc);
         end
         else
         begin
            qyAux.ParamByName('dt_vencimento').AsDate := TDate(dVenc);
            wmes := wmes + 1;
            if wmes > 12 then
            begin
               wmes := 1;
               wano := wano + 1;
            end;
         end;
         qyAux.ParamByName('sn_credito').AsInteger  := 0;
         qyAux.ParamByName('nr_credito').AsInteger  := 0;
         qyAux.ParamByName('cd_tipo_parcela').AsInteger := plano.FieldByName('cd_tipo_titulo').AsInteger;
         qyAux.ParamByName('cd_planocontas').AsInteger  := plano.FieldByName('cd_conta').AsInteger;
         qyAux.ParamByName('ds_mensa').AsString     := plano.FieldByName('ds_tipo_titulo').AsString ;
         qyAux.ParamByName('sn_recibo').AsInteger   := 0;
         qyAux.ParamByName('cd_item_plano').AsInteger   := plano.FieldByName('cd_plano_item').AsInteger ;
         qyAux.ParamByName('cd_bolsa').AsInteger := 0;

         qyAux.ExecSQL();

      end;

   end;

   FreeAndNil(qyAux);
   FreeAndNil(qyAux2);

end;

procedure TFrmMatricula.AtualizarGuias;
Var
   qyAux : TUMZQuery;
   i : Integer;
begin
   Dm.CriarConsulta(qyAux);

   if Acao = Matricular then begin
      qyAux.SQL.Text :=
        ' SELECT MC.CD_MATRICULA_CURSO, MC.CD_PESSOA, MC.CD_CURSO, C.DS_CURSO DESCRICAO, MC.NR_ANOSEM_INGRESSO ' +
        ' FROM MATRICULAS_CURSO MC JOIN PESSOAS P ON (P.CD_PESSOA = MC.CD_PESSOA) ' +
        ' JOIN CURSOS_MESTRE C ON (C.CD_CURSO = MC.CD_CURSO) '+
        ' WHERE MC.CD_PESSOA = ' + IntToStr(iCodAluno) +
        ' ORDER BY MC.NR_ANOSEM_INGRESSO DESC ';

      qyAux.Open();

      TabControl1.Tabs.Clear;

      TabControl1.Tabs.Add('[Matricular novo curso]');
      aMatriculas[0] := -1;

      i := 1;

   end else begin // AjustarMatricula
      qyAux.SQL.Text :=
        ' SELECT MC.CD_MATRICULA_CURSO, MC.CD_PESSOA, MC.CD_CURSO, C.DS_CURSO DESCRICAO, MC.NR_ANOSEM_INGRESSO ' +
        ' FROM MATRICULAS_CURSO MC JOIN PESSOAS P ON (P.CD_PESSOA = MC.CD_PESSOA) ' +
        ' JOIN CURSOS_MESTRE C ON (C.CD_CURSO = MC.CD_CURSO) '+
        ' WHERE MC.CD_PESSOA = ' + IntToStr(iCodAluno) +
        '   AND MC.CD_MATRICULA_CURSO = ' + IntToStr(iMatriculaCurso) +
        ' ORDER BY MC.NR_ANOSEM_INGRESSO DESC ';

      qyAux.Open();

      TabControl1.Tabs.Clear;

      i := 0;

   end;


   while not qyAux.Eof do begin

      TabControl1.Tabs.Add(qyAux.FieldByName('descricao').AsString + ' (' + qyAux.FieldByName('nr_anosem_ingresso').AsString + ')');

      aMatriculas[i] := qyAux.FieldByName('cd_matricula_curso').AsInteger;

      if qyAux.FieldByName('cd_matricula_curso').AsInteger = iMatriculaCurso then begin
         TabControl1.TabIndex := i;
      end;

      INC(i);
      qyAux.Next();

   end;

   TabControl1Change( nil );

end;

procedure TFrmMatricula.SelecionarMatricula(CodMatricula: Integer);
begin
  // Selecionar a matrícula existente
  qyMatriculaCurso.Close();
  qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := CodMatricula;
  qyMatriculaCurso.Open();
end;

procedure TFrmMatricula.SpeedButton1Click(Sender: TObject);
begin

  Application.CreateForm( TfrmTableFields, frmTableFields );
  frmTableFields.qyMatriculas.Close;
  frmTableFields.qyMatriculas.ParamByName('anosemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
  frmTableFields.qyMatriculas.Open;

  frmTableFields.Left := 65;
  frmTableFields.Tag := 10; // Isso vai indicar que está aberto a janela de Disciplinas para Matrícula
  frmTableFields.ConstroiTreeMatriculas;
  frmTableFields.Show;

end;

procedure TFrmMatricula.sbAvancarClick(Sender: TObject);
begin
//  PodeMudar := True;
  case PageControl1.ActivePageIndex of

    0 : begin // Matricula no Curso
        SalvarMatriculaCurso();

    end;
    1 : begin // Matricula na Etapa

       MatriculaEtapa();

    end;
    2 : begin // Seleção de Disciplinas

       SelecaoDisciplina();

    end;
    3 : begin // Alterações Financeiras

      AlteracaoFinanceiro();

    end;
    4 : begin // Conclusão da Matrícula
      ConclusaoMatricula();

    end;
    5 : begin // Impressão de Documentos

      Close();

    end;

  end;
end;

procedure TFrmMatricula.sbCursoEtapaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(txtAnoSem.Text));

   if resultado_filtro.filtrado then
   begin
     txtCurso.Text := resultado_filtro.cd_curso;
     txtAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
     FiltraTurma;
   end;
end;

procedure TFrmMatricula.sbDiscDesSelCursosClick(Sender: TObject);
var
   I: Integer;
begin
   lstDisciplinas.Items.BeginUpdate;
   for I := 0 to lstDisciplinas.Count - 1 do
   begin
      if lstDisciplinas.Checked[I] and lstDisciplinas.ItemEnabled[I] then
      begin
         lstDisciplinas.Checked[I] := False;
      end;
   end;
   lstDisciplinas.Items.EndUpdate;
end;

procedure TFrmMatricula.sbDiscSelCursosClick(Sender: TObject);
var
   I: Integer;
begin
   lstDisciplinas.Items.BeginUpdate;
   for I := 0 to lstDisciplinas.Count - 1 do
   begin
      if not lstDisciplinas.Checked[I] then
      begin
         lstDisciplinas.Checked[I] := True;
      end;
   end;
   lstDisciplinas.Items.EndUpdate;
end;

procedure TFrmMatricula.sbVoltarClick(Sender: TObject);
begin
  sbAvancar.Caption := 'Avançar';
  sbAvancar.Font.Style := [];

   if PageControl1.ActivePageIndex > 0 then begin

      PageControl1.ActivePageIndex := PageControl1.ActivePageIndex - 1;

   end;
end;

procedure TFrmMatricula.TabControl1Change(Sender: TObject);
begin
   if qyMatriculaCurso.State in [dsInsert, dsEdit] then begin
      qyMatriculaCurso.Cancel();
   end;

   if (TabControl1.TabIndex = 0) AND (Acao = Matricular) then begin

      IncluirMatricula();

   end else begin

      EditarMatricula(aMatriculas[TabControl1.TabIndex]);

   end;
end;

function TFrmMatricula.total_creditos: Currency;
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


procedure TFrmMatricula.txtAnoSemExit(Sender: TObject);
begin
  FiltraTurma();
end;

procedure TFrmMatricula.VerificarProgramacaoDescontos;
Var
  qyDesc : TUMZQuery;
begin
  DM.CriarConsulta(qyDesc);
  qyDesc.SQL.Text :=
    ' SELECT bp.*, b.sn_gratuidade, p.nm_pessoa FROM fin_bolsas_pessoas bp ' +
    ' INNER JOIN fin_bolsas_tipos b ON (bp.cd_bolsa = b.cd_bolsa) ' +
    ' LEFT JOIN pessoas p ON (bp.cd_resp = p.cd_pessoa) ' +
    ' WHERE bp.dt_inicio <= "' + FormatDateTime('yyyy-mm-dd', DataHoje) + '" AND bp.dt_termino >= "'+FormatDateTime('yyyy-mm-dd', DataHoje)+'" ' +
    ' AND bp.cd_aluno = ' +  IntToStr( iCodAluno );

  qyDesc.Open();

  if qyDesc.RecordCount > 0 then begin

     if qyDesc.FieldByName('sn_gratuidade').AsInteger = 1 then begin

        AplicarBolsasGratuidade(qyDesc.FieldByName('cd_bolsa').AsInteger, qyDesc.FieldByName('vl_fixo').AsCurrency, qyDesc.FieldByName('vl_percentual').AsCurrency, False );

     end else begin

        AplicarBolsasEntidade(qyDesc.FieldByName('cd_bolsa').AsInteger, qyDesc.FieldByName('vl_fixo').AsCurrency, qyDesc.FieldByName('vl_percentual').AsCurrency, qyDesc.FieldByName('cd_resp').AsInteger, qyDesc.FieldByName('nm_pessoa').AsString );

     end;

  end;

end;

procedure TFrmMatricula.btnBloquetoClick(Sender: TObject);
Var
   slAux: TStringList;
   sParcelas : String;
   iCont : Integer;
   Selecionou : Boolean;
   sFiltroAux : String;
   bAgrupado : Boolean;
   sContaImpressao : String;
   sNomeRelatorio: String;
begin
  { Impressão do Bloqueto }

  // Definir as parcelas que serão utilizadas para impressão do boleto;

  Selecionou := False;

  sParcelas := ' -1 ';
  for iCont := 0 to DBGrid2.SelectedRows.Count - 1 do begin

     if (qyTmpMensa.BookmarkValid(Pointer(DBGrid2.SelectedRows.Items[iCont]))) then begin
        qyTmpMensa.GotoBookmark(Pointer(DBGrid2.SelectedRows.Items[iCont]));
     end
     else begin
        Continue;
     end;

     sParcelas := sParcelas + ', ' + IntToStr(ABS(qyTmpMensanr_parcela.AsInteger));
     Selecionou := True;

  end;

  Application.CreateForm( TfrmRepBloquetos, frmRepBloquetos );

  if not Selecionou then begin
    Mensagem( 'Selecione as parcelas que deseja imprimir os boletos.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  sFiltroAux := ' (m.codigoaluno = ' + IntToStr(iCodAluno) + ') and  ';
  sFiltroAux := sFiltroAux + ' (m.parcela IN (' + sParcelas  + ')) and ';
  sFiltroAux := sFiltroAux + ' (m .turma = "' + tblTurmasCODIGO.AsString + '") ';

  bAgrupado := DM.isTrue(DM.variavel_parametro('financeiro_boletos_agrupados'));
  sContaImpressao := IntToStr(Dm.GetContaBoleto( DM.tblDeptoCursoTurmaDepto.AsInteger, tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger ) ) + '=' + tblTurmascd_coligada.AsString;

  if not frmRepBloquetos.PrepararBloquetosParaImpressao(sFiltroAux, bAgrupado, sContaImpressao) then begin
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
  slAux.Add( ' {Mensalidades.codigoaluno} = ' + IntToStr(iCodAluno) + ' and ');
  slAux.Add( ' {Mensalidades.parcela} in ['+ sParcelas +'] and ');
  slAux.Add( ' {Mensalidades.turma} = "' + tblTurmasCODIGO.AsString + '" and ' );
  slAux.Add( ' {Mensalidades.situacao} in [2, 10]' );

  sNomeRelatorio := DM.NomeDoBoleto(DM.tblDeptoCursoTurmaDepto.AsInteger, tblTurmasCODIGO.AsString, tblTurmasANOSEMESTRE.AsInteger );

  PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, slAux.Text, '',nil,nil,nil,nil,False,False,nil);

  Screen.Cursor := crDefault;

  FreeAndNil( frmRepBloquetos );
  FreeAndNil( slAux );
end;


procedure TFrmMatricula.btnBolsaClick(Sender: TObject);
Var
  Condicional : Boolean;
begin

   Application.CreateForm(TFrmMatricula_bolsa, FrmMatricula_bolsa);

   if FrmMatricula_bolsa.ShowModal <> mrOk then begin

      Exit;

   end;

   Condicional := TSpeedButton(Sender).Tag = 1;   

   AplicarBolsasGratuidade(FrmMatricula_bolsa.iBolsa, StrToCurr(FrmMatricula_bolsa.edValorBolsa.Text), StrToCurr(FrmMatricula_bolsa.edPercentual.Text), Condicional);

   FreeAndNil(FrmMatricula_bolsa);
end;

procedure TFrmMatricula.btnCancelarClick(Sender: TObject);
begin
   qyMatriculaCurso.Cancel();
end;

procedure TFrmMatricula.btnConfiguracoesClick(Sender: TObject);
begin

    //Mostra a Janela de configuracao da impressora
    PrincipalForm.Rel.Printer.Prompt();

end;

procedure TFrmMatricula.btnContratoClick(Sender: TObject);
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
     '  INNER JOIN CURSOS_COLIGADAS AS C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('Turma').AsString := tblTurmasCODIGO.AsString;
  DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
  DM.tblCursosTurma.Open;

  if DM.tblCursosTurmaDS_CONTRATO.AsString = '' then
  begin
    Mensagem( 'Este curso não possui contrato formulado.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
    Exit;
  end;

  sAux := '{Matriculas.CodigoAluno} = ' + IntToStr(iCodAluno) + ' and ';
  sAux := sAux + '{Matriculas.AnoSemestre} = ' + tblTurmasANOSEMESTRE.AsString + ' and ';
  sAux := sAux + '{Matriculas.Turma} = "' + tblTurmasCODIGO.AsString + '"';

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

procedure TFrmMatricula.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, qyMatriculaCursonr_anosem_ingresso.AsInteger);

   if resultado_filtro.filtrado then
   begin
     if not (qyMatriculaCurso.State in [dsInsert, dsEdit]) then
     begin
        qyMatriculaCurso.Edit;
     end;

     qyMatriculaCursocd_curso.AsString := resultado_filtro.cd_curso;
     qyMatriculaCursonr_anosem_ingresso.AsInteger := resultado_filtro.nr_anosemestre;
     qyMatriculaCursocd_grade.AsInteger := resultado_filtro.cd_grade;
     if (qyMatriculaCurso.State in [dsInsert]) then
     begin
        txtAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
     end;

     if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
     else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iCodAluno );
  end;
end;

procedure TFrmMatricula.btnEntidadeClick(Sender: TObject);
begin

   Application.CreateForm(TFrmMatricula_bolsa, FrmMatricula_bolsa);

   // Verificar se foi confirmada a tela de Bolsas
   if FrmMatricula_bolsa.ShowModal <> mrOk then begin

      Exit;

   end;

   // Verificar se foi selecionado o responsável
   if FrmMatricula_bolsa.edCodigoResp.Text = '' then begin

      Mensagem('Não foi selecionado o responsável financeiro.', 'Anteção', MB_OK + MB_ICONERROR, Handle);
      Exit;

   end;

   AplicarBolsasEntidade(FrmMatricula_bolsa.iBolsa,StrToCurr(FrmMatricula_bolsa.edValorBolsa.Text), StrToCurr(FrmMatricula_bolsa.edPercentual.Text), FrmMatricula_bolsa.iCodResp, FrmMatricula_bolsa.sNomeResp );

end;

procedure TFrmMatricula.btnRemoverDisciplinasClick(Sender: TObject);
var
 i : integer;
 y : Integer;
begin
   { Procurar por todas as disciplinas marcadas e apagá-las }

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


end;

procedure TFrmMatricula.btnRequerimentoClick(Sender: TObject);
var
  sAux: string;
  iCopias: Integer;
begin

  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS AS C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('Turma').AsString := tblTurmasCODIGO.AsString;
  DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := tblTurmasANOSEMESTRE.AsInteger;
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
     sAux := ' {Matriculas.AnoSemestre} = ' + tblTurmasANOSEMESTRE.AsString + ' and ';
     sAux := sAux + ' {Matriculas.Turma} = "' + tblTurmasCODIGO.AsString + '" and  ';
     sAux := sAux + ' {Matriculas.CodigoAluno} = ' + IntToStr(iCodAluno);

     PrincipalForm.ImprimeRpt(Self, DM.tblCursosTurmaDS_REQUERIMENTO.AsString, -1, sAux, '', nil,nil,nil,nil,False,False,nil,True );
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


function TFrmMatricula.BuscarDiscAnuais(codigoaluno,
  anosem_atual: integer): integer;
Var
  qyAux : TUMZQuery;
begin

  Dm.CriarConsulta(qyAux);

  // As disciplinas canceladas, aprovadas ou reprovadas não são consideradas anuais.
  qyAux.SQL.Text :=
    ' SELECT count(*) qtd ' +
    ' FROM fichaindividual f ' +
    ' INNER JOIN TURMAS t ON ( t.codigo = f.turma AND f.anosemestre = t.anosemestre ) ' +
    ' INNER JOIN GRADES g ON ( g.cd_grade = t.cd_grade	AND t.curso = g.CD_CURSO ) ' +
    ' INNER JOIN grades_disciplinas gd ON ( gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina ) ' +
    ' JOIN situacao s ON(f.situacao = s.cd_situacao) ' +
    ' WHERE s.cd_situacao_pai not in (0,3,4,5,6,7,8,9) AND gd.nr_creditos_academicos = 12 AND ' +
    ' f.codigoaluno = '+IntToStr(codigoaluno)+' and f.anosemestre = ' + DM.decrementar_ano_semestre(IntToStr(anosem_atual));

  qyAux.Open();

  result := qyAux.FieldByName('qtd').AsInteger;

  FreeAndNil(qyAux);

end;

function TFrmMatricula.BuscarDiscGrade(turma: String; anosem : integer): Integer;
Var
  qyAux : TUMZQuery;
begin
  Dm.CriarConsulta(qyAux);

  qyAux.SQL.Text :=
    ' SELECT count(*) qtd FROM turmas tu ' +
    ' INNER JOIN gradecurricular gc ON (gc.anosemestre = tu.anosemestre AND gc.curso = tu.curso ' +
    ' AND gc.turno = tu.turno AND gc.cd_grade = tu.cd_grade AND (gc.serie = tu.serie OR (gc.serie = tu.serie-1 AND gc.nr_creditos_academicos = 12) ) ) ' +
    ' WHERE tu.codigo = "'+turma+'" AND tu.anosemestre = ' + IntToStr(anosem);

  qyAux.Open();

  result := qyAux.FieldByName('qtd').AsInteger;

  FreeAndNil(qyAux);

end;

procedure TFrmMatricula.BuscarPlanos;
Var
   qyPl : TUMZQuery;
begin
   Dm.CriarConsulta(qyPl);
   qyPl.SQL.Text := ' SELECT pp.cd_plano, pp.ds_plano ' +
     ' FROM fin_plano_pgto pp  ' +
     ' INNER JOIN fin_plano_turmas pt ON (pp.cd_plano = pt.cd_plano) ' +
     ' WHERE pt.cd_turma = "' + tblTurmasCODIGO.AsString + '" ' +
     '   AND pt.nr_anosem = ' + tblTurmasANOSEMESTRE.AsString   +
     ' ORDER BY pp.ds_plano ';

   qyPl.Open();

   cbPlanos.Items.Clear;

   if qyPl.RecordCount > 0 then begin

      while not qyPl.EOF do begin
        cbPlanos.Items.Add(qyPl.FieldByName('ds_plano').AsString);
        qyPl.Next;
      end;

   end else begin

     cbPlanos.Items.Add('Nenhum Plano de Pagamento encontrado.');

   end;

   cbPlanos.ItemIndex := 0;

   FreeAndNil(qyPl);
end;

function TFrmMatricula.BuscarUltimaSerie: Integer;
Var
  qyAux : TUMZQuery;
begin

  Dm.CriarConsulta(qyAux);
  qyAux.SQL.Text :=
    ' SELECT Max(t.serie) UltimaSerie FROM turmas t INNER JOIN matriculas m ' +
    ' ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre) ' +
    ' WHERE t.curso = "' + txtCurso.Text + '" ' +
    ' AND m.codigoaluno = ' + IntToStr(iCodAluno);
  qyAux.Open();

  if not qyAux.IsEmpty then begin

     Result := qyAux.FieldByName('UltimaSerie').AsInteger + 1;
     
  end else begin

     Result := 1;

  end;

  FreeAndNil(qyAux);
  
end;

end.

