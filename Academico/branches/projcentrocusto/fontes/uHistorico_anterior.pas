unit uHistorico_anterior;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ZConnection, ImgList,
  DBCtrls, ComCtrls, ToolWin, Buttons, Mask, dbcgrids, Menus, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UMComboBox,
  uItemCombo;

type
  Tfrm_historico_anterior = class(TForm)
    Bevel3: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    lbl: TLabel;
    Bevel1: TBevel;
    tblHistorico: TUMZQuery;
    dsHistorico: TDataSource;
    ImageList1: TImageList;
    tblDisciplina: TUMZQuery;
    tblHistoricocodigoaluno: TIntegerField;
    tblHistoricodisciplina: TIntegerField;
    tblHistoricocurso: TStringField;
    tblHistoricoturma: TStringField;
    tblHistoricoserie: TSmallintField;
    tblHistoricoaproveitamento: TStringField;
    tblDisciplinacodigo: TIntegerField;
    tblDisciplinacurso: TStringField;
    tblDisciplinasigla: TStringField;
    tblDisciplinadescricao: TStringField;
    tblHistoricoDescDisciplina: TStringField;
    Label1: TLabel;
    txtCurso: TEdit;
    btnCurso: TSpeedButton;
    txtAluno: TEdit;
    SpeedButton2: TSpeedButton;
    tblHistoricomediafinal: TFloatField;
    toolPessoa: TToolBar;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    Bevel2: TBevel;
    tblHistoricoanosemestre: TSmallintField;
    tblHistoricosituacao: TSmallintField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnCad: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dbSerie: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    tblObsHistorico: TUMZQuery;
    dsObs: TDataSource;
    TabSheet3: TTabSheet;
    tblColegiosGrau1: TUMZQuery;
    dsColegiosGrau1: TDataSource;
    tblColegiosGrau2: TUMZQuery;
    dsColegiosGrau2: TDataSource;
    tblColegiosSeries: TUMZQuery;
    dsColegiosSeries: TDataSource;
    tblColegiosSeriescodigoaluno: TLargeintField;
    tblColegiosSeriesgrau: TSmallintField;
    tblColegiosSeriesserie: TSmallintField;
    tblColegiosSeriesano: TSmallintField;
    tblColegiosSeriesds_escola: TStringField;
    tblColegiosSeriesds_escola_cidade: TStringField;
    tblColegiosSeriesds_escola_estado: TStringField;
    pnEnsFundMedio: TPanel;
    Label19: TLabel;
    Bevel4: TBevel;
    Label12: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label20: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label21: TLabel;
    Bevel6: TBevel;
    dbEscolaG2: TDBEdit;
    Label16: TLabel;
    Bevel5: TBevel;
    dbEscolaG1: TDBEdit;
    Label13: TLabel;
    dbCidadeG1: TDBEdit;
    Label17: TLabel;
    dbCidadeG2: TDBEdit;
    dbEstadoG2: TDBEdit;
    Label18: TLabel;
    dbEstadoG1: TDBEdit;
    Label14: TLabel;
    Label29: TLabel;
    DBEdit21: TDBEdit;
    tblHistoricocarga_horaria: TFloatField;
    tblHistoricograu: TSmallintField;
    tblHistoricocodigograde: TStringField;
    tblHistoricosimbolo_obs: TStringField;
    Label30: TLabel;
    DBEdit22: TDBEdit;
    tblHistoricodescSituacao: TStringField;
    Label31: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    tsVestibular: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    qyVestibular: TUMZQuery;
    dsVestibular: TDataSource;
    qyVestibularanosemestre: TIntegerField;
    qyVestibularnotaredacao: TFloatField;
    qyVestibularnotaprova: TFloatField;
    qyVestibularmedia: TFloatField;
    qyVestibularclassificacaogeral: TIntegerField;
    qyVestibularclassificacaocurso: TIntegerField;
    qyVestibularanosem: TStringField;
    qyVestibularinstituicao: TStringField;
    Label32: TLabel;
    DBEdit23: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit25: TDBEdit;
    Label35: TLabel;
    DBEdit26: TDBEdit;
    Label36: TLabel;
    DBEdit27: TDBEdit;
    Label37: TLabel;
    DBEdit28: TDBEdit;
    Label38: TLabel;
    DBEdit29: TDBEdit;
    Label39: TLabel;
    qyVestibularnome: TStringField;
    qyVestibularcodigoaluno: TIntegerField;
    pnSeries: TPanel;
    Panel7: TPanel;
    Label22: TLabel;
    DBEdit15: TDBEdit;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    DBEdit17: TDBEdit;
    Label25: TLabel;
    dbEscolaSerie: TDBEdit;
    Label26: TLabel;
    dbCidadeSerie: TDBEdit;
    Label27: TLabel;
    dbEstadoSerie: TDBEdit;
    DBGrid3: TDBGrid;
    pmQtdHistorico: TPopupMenu;
    pmQtdColegiosSeries: TPopupMenu;
    pmQtdVersibular: TPopupMenu;
    qyVestibulards_resultado: TMemoField;
    Label28: TLabel;
    DBMemo2: TDBMemo;
    tblHistoricofrequencia: TFloatField;
    DBEdit30: TDBEdit;
    Label40: TLabel;
    qyVestibulartipo: TStringField;
    Label41: TLabel;
    DBEdit31: TDBEdit;
    tblHistoricods_media: TStringField;
    Label42: TLabel;
    DBEdit32: TDBEdit;
    ToolButton5: TToolButton;
    SpeedButton1: TSpeedButton;
    Bevel7: TBevel;
    btnIncluirGrade: TSpeedButton;
    tcSeries: TTabControl;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBEdit81: TDBEdit;
    tblColegiosSeriesds_escola_observacao: TStringField;
    Label43: TLabel;
    dbeDiasLetivo: TDBEdit;
    Label44: TLabel;
    DBEdit33: TDBEdit;
    Label45: TLabel;
    dbeTotalCargaHorario: TDBEdit;
    tblColegiosSeriesnr_total_carga_horaria: TFloatField;
    qyVestibularcd_instituicao: TLargeintField;
    tblColegiosSeriesNR_DIAS_LETIVOS: TLargeintField;
    qryMaxAnosem: TUMZReadOnlyQuery;
    qryMaxAnosemANOSEMESTRE: TIntegerField;
    qryInsertFicha: TUMZQuery;
    qryInsertHist: TUMZQuery;
    btnEscolaFundamental: TSpeedButton;
    btEscolaMedio: TSpeedButton;
    btEscolaSerie: TSpeedButton;
    tblColegiosSeriescd_instituicao: TLargeintField;
    tblObsHistoricocurso: TStringField;
    tblObsHistoricoobservacao: TMemoField;
    tblObsHistoricocodigoaluno: TLargeintField;
    tblColegiosGrau1codigoaluno: TLargeintField;
    tblColegiosGrau1grau: TSmallintField;
    tblColegiosGrau1ano: TIntegerField;
    tblColegiosGrau1ds_escola: TStringField;
    tblColegiosGrau1ds_escola_cidade: TStringField;
    tblColegiosGrau1ds_escola_estado: TStringField;
    tblColegiosGrau1cd_instituicao: TLargeintField;
    tblColegiosGrau2codigoaluno: TLargeintField;
    tblColegiosGrau2grau: TSmallintField;
    tblColegiosGrau2ano: TIntegerField;
    tblColegiosGrau2ds_escola: TStringField;
    tblColegiosGrau2ds_escola_cidade: TStringField;
    tblColegiosGrau2ds_escola_estado: TStringField;
    tblColegiosGrau2ds_curso: TStringField;
    tblColegiosGrau2cd_instituicao: TLargeintField;
    tblColegiosGrau1ds_curso: TStringField;
    DBEdit24: TDBEdit;
    qyVestibularcurso: TStringField;
    qyVestibularcurso_inscricao: TStringField;
    Label46: TLabel;
    Bevel8: TBevel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    btnEscolaSuperior: TSpeedButton;
    qryColegiosGrau3: TUMZQuery;
    dsColegiosGrau3: TDataSource;
    qryColegiosGrau3codigoaluno: TLargeintField;
    qryColegiosGrau3grau: TSmallintField;
    qryColegiosGrau3ano: TIntegerField;
    qryColegiosGrau3ds_escola: TStringField;
    qryColegiosGrau3ds_escola_cidade: TStringField;
    qryColegiosGrau3ds_escola_estado: TStringField;
    qryColegiosGrau3ds_curso: TStringField;
    qryColegiosGrau3cd_instituicao: TLargeintField;
    DBEdit1: TDBEdit;
    dbEscolaG3: TDBEdit;
    dbCidadeG3: TDBEdit;
    dbEstadoG3: TDBEdit;
    DBEdit12: TDBEdit;
    Label52: TLabel;
    DBEdit8: TDBEdit;
    qyCursos: TUMZQuery;
    qyCursosds_curso: TStringField;
    qyCursosds_apelido: TStringField;
    qyVestibularcurso_nome: TStringField;
    qyCursoscd_curso: TStringField;
    tblHistoricototalfaltas: TFloatField;
    tblHistoricocodigoescola: TIntegerField;
    edEscola: TEdit;
    edEscolaVest: TEdit;
    SpeedButton3: TSpeedButton;
    btnRemover1: TSpeedButton;
    btnRemover2: TSpeedButton;
    btnRemover3: TSpeedButton;
    cbInstituicoes: TUMComboBox;
    procedure cbInstituicoesExit(Sender: TObject);
    procedure cbInstituicoesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbInstituicoesChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsColegiosGrau3DataChange(Sender: TObject; Field: TField);
    procedure dsColegiosGrau2DataChange(Sender: TObject; Field: TField);
    procedure dsColegiosGrau1DataChange(Sender: TObject; Field: TField);
    procedure btnEscolaFundamentalClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure qryColegiosGrau3AfterOpen(DataSet: TDataSet);
    procedure tblColegiosGrau2AfterOpen(DataSet: TDataSet);
    procedure tblColegiosGrau1AfterOpen(DataSet: TDataSet);
    procedure btnRemover3Click(Sender: TObject);
    procedure btnRemover2Click(Sender: TObject);
    procedure btnRemover1Click(Sender: TObject);
    procedure qyVestibularAfterOpen(DataSet: TDataSet);
    procedure btEscolaSerieClick(Sender: TObject);
    procedure dsHistoricoDataChange(Sender: TObject; Field: TField);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dsColegiosGrau3StateChange(Sender: TObject);
    procedure qryColegiosGrau3FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryColegiosGrau3NewRecord(DataSet: TDataSet);
    procedure btnBloqueiaG3Click(Sender: TObject);
    procedure btnEscolaSuperiorClick(Sender: TObject);
    procedure btnBloqueiaSerieClick(Sender: TObject);
    procedure btnBloqueiaG2Click(Sender: TObject);
    procedure btEscolaMedioClick(Sender: TObject);
    procedure btnBloqueiaG1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tcSeriesChange(Sender: TObject);
    procedure btnIncluirGradeClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure dsHistoricoStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblHistoricoNewRecord(DataSet: TDataSet);
    procedure tblObsHistoricoNewRecord(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure tblColegiosGrau1NewRecord(DataSet: TDataSet);
    procedure dsObsStateChange(Sender: TObject);
    procedure dsColegiosGrau1StateChange(Sender: TObject);
    procedure tblColegiosGrau2NewRecord(DataSet: TDataSet);
    procedure tblColegiosGrau1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dsColegiosGrau2StateChange(Sender: TObject);
    procedure dsColegiosSeriesStateChange(Sender: TObject);
    procedure Label28Click(Sender: TObject);
    procedure qyVestibularCalcFields(DataSet: TDataSet);
    procedure qyVestibularNewRecord(DataSet: TDataSet);
    procedure dsVestibularDataChange(Sender: TObject; Field: TField);
    procedure pmQtdHistoricoPopup(Sender: TObject);
    procedure pmQtdColegiosSeriesPopup(Sender: TObject);
    procedure pmQtdVersibularPopup(Sender: TObject);
    procedure tblColegiosSeriesBeforePost(DataSet: TDataSet);
    procedure dsObsDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    comboIndex : Integer;
    codigoaluno : Integer;
    codigoMatriculaCurso : Integer;
  public
    { Public declarations }
    function GetCodigoaluno: Integer;
    function GetCodigoMatriculaCurso: Integer;
    procedure SetCodigoAluno(const Value: Integer);
    procedure SetCodigoMatriculaCurso(const Value: Integer);
    procedure Filtra;
    procedure CarregaInstituicoes;
  end;

var
  frm_historico_anterior: Tfrm_historico_anterior;

implementation

uses
   uDM, uFSelecionarCurso, UFCadInstituicao, uFSelecionarPessoa, Math, Main, uEscolas, uUsuario,
   uSelInstituicao, uCursoMestre;

{$R *.dfm}

procedure Tfrm_historico_anterior.btnCursoClick(Sender: TObject);
var
   qryBuscaCurso : TUMZQuery;
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
   end;

   //seta o matricula curso
   DM.CriarConsulta(qryBuscaCurso);
   qryBuscaCurso.SQL.Text := ''+
   ' SELECT                   '+
   '   cd_matricula_curso     '+
   ' FROM                     '+
   '   matriculas_curso       '+
   ' WHERE                    '+
   ' 	cd_pessoa = :cd_pessoa AND  '+
   '   cd_curso = :cd_curso        '+
   ' ORDER BY                      '+
   '  	cd_matricula_curso DESC';

   qryBuscaCurso.ParamByName('cd_pessoa').AsInteger := codigoaluno;
   qryBuscaCurso.ParamByName('cd_curso').AsString   := resultado_filtro.cd_curso;
   qryBuscaCurso.Open;

   codigoMatriculaCurso := qryBuscaCurso.FieldByName('cd_matricula_curso').AsInteger;

   tcSeries.TabIndex := 0;

   Filtra;

   FreeAndNil(qryBuscaCurso);

   if codigoMatriculaCurso <> 0 then
   begin
      toolPessoa.Enabled := true;
   end;
end;

procedure Tfrm_historico_anterior.SetCodigoAluno(const Value: Integer);
begin
   codigoaluno := Value;
end;

procedure Tfrm_historico_anterior.SetCodigoMatriculaCurso(const Value: Integer);
begin
   codigoMatriculaCurso := Value;
end;

procedure Tfrm_historico_anterior.SpeedButton1Click(Sender: TObject);
begin

   if not PrincipalForm.ProcuraForm( TForm(fCadInstituicao) ) then
   begin
      Application.CreateForm( TfCadInstituicao, fCadInstituicao );
   end;
      
   if fCadInstituicao.ShowModal = mrOk then
   begin
      edEscola.Text := fCadInstituicao.qryInstituicoesNM_INSTITUICAO.AsString;

      IF NOT (tblHistorico.State in [dsInsert, dsEdit]) then
      begin
         tblHistorico.Edit;
      end;
      
      tblHistoricocodigoescola.AsInteger := fCadInstituicao.qryInstituicoesCD_INSTITUICAO.AsInteger;
   end;

   SpeedButton1.Down := False;
end;

procedure Tfrm_historico_anterior.SpeedButton2Click(Sender: TObject);
var
   qryBuscaCurso : TUMZQuery;
   resultado_filtro : TResultadoFiltroCurso;
   resultado_filtro_pessoa : TResultadoFiltroPessoa;

begin
  { Pesquisar Aluno }
  resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

  if resultado_filtro_pessoa.filtrado then
  Begin
  
     txtAluno.Text        := resultado_filtro_pessoa.nm_pessoa;
     codigoaluno          := resultado_filtro_pessoa.cd_pessoa;
     
     try
      codigoMatriculaCurso := resultado_filtro_pessoa.cd_matricula_curso;
     except on E: Exception do

     end;
      if resultado_filtro_pessoa.Aba = afpEstudante then
      begin
         resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1,
            resultado_filtro_pessoa.nr_anosemestre, resultado_filtro_pessoa.cd_curso);

         if resultado_filtro.filtrado then
         begin
            txtCurso.Text := resultado_filtro.cd_curso;
         end
         else
         begin
           txtCurso.Text := '';
         end;
      end;
   End;

  tcSeries.TabIndex := 0;

  Filtra;

  //seta o matricula curso
  DM.CriarConsulta(qryBuscaCurso);
  qryBuscaCurso.SQL.Text := ''+
  ' SELECT                   '+
  '   cd_matricula_curso     '+
  ' FROM                     '+
  '   matriculas_curso       '+
  ' WHERE                    '+
  ' 	cd_pessoa = :cd_pessoa AND  '+
  '   cd_curso = :cd_curso        '+
  ' ORDER BY                      '+
  '  	cd_matricula_curso DESC';

  qryBuscaCurso.ParamByName('cd_pessoa').AsInteger := codigoaluno;
  qryBuscaCurso.ParamByName('cd_curso').AsString   := resultado_filtro.cd_curso;
  qryBuscaCurso.Open;

  codigoMatriculaCurso := qryBuscaCurso.FieldByName('cd_matricula_curso').AsInteger;

  if codigoMatriculaCurso <> 0 then
   begin
      toolPessoa.Enabled := true;
   end;
end;

procedure Tfrm_historico_anterior.SpeedButton3Click(Sender: TObject);
begin
   
   Application.CreateForm(TfCadInstituicao, fCadInstituicao);
   if fCadInstituicao.ShowModal = mrOk then
   begin

      IF NOT (qyVestibular.State in [dsInsert, dsEdit]) then
      begin
         qyVestibular.Edit;
      end;

      qyVestibularcd_instituicao.AsInteger  := fCadInstituicao.qryInstituicoescd_instituicao.AsInteger;
      edEscolaVest.Text := fCadInstituicao.qryInstituicoesNM_INSTITUICAO.AsString;
      
   end;

   SpeedButton3.Down := False;

end;

procedure Tfrm_historico_anterior.btnBloqueiaG3Click(Sender: TObject);
var
  iResp: Integer;
begin

end;

procedure Tfrm_historico_anterior.btnBloqueiaG1Click(Sender: TObject);
Var
   iResp : Integer;
begin

end;

procedure Tfrm_historico_anterior.btnBloqueiaG2Click(Sender: TObject);
Var
   iResp : Integer;
begin

end;
procedure Tfrm_historico_anterior.btnBloqueiaSerieClick(Sender: TObject);
Var
   iResp : Integer;
begin

end;

procedure Tfrm_historico_anterior.tcSeriesChange(Sender: TObject);
begin
   Filtra();
end;

procedure Tfrm_historico_anterior.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   codigoaluno := 0;
   codigoMatriculaCurso := 0;

   txtCurso.Text := '';

   PageControl1.ActivePageIndex := 0;

   CarregaInstituicoes;

   Filtra;
end;

function Tfrm_historico_anterior.GetCodigoaluno: Integer;
begin
   Result := codigoaluno;
end;

function Tfrm_historico_anterior.GetCodigoMatriculaCurso: Integer;
begin
   Result := codigoMatriculaCurso;
end;

procedure Tfrm_historico_anterior.Filtra;
Var
  iPosAtual : Integer;
  qyTemp : TUMZQuery;
begin
   if (codigoaluno = 0) or (txtCurso.Text = '') Then
   Begin
      tblDisciplina.Close;
      tblHistorico.Close;
      Dm.tblEscolas.Close;
      tblObsHistorico.Close;
      tblColegiosGrau1.Close;
      tblColegiosGrau2.Close;
      tblColegiosSeries.Close;
      qyVestibular.Close;

      //Desabilita campos para busca/cadastro de instituições.
      SpeedButton1.Enabled := False;
      btnEscolaFundamental.Enabled := False;
      btEscolaMedio.Enabled := False;
      btnEscolaSuperior.Enabled := False;
      btEscolaSerie.Enabled := False;
      SpeedButton3.Enabled := False;

      pnCad.Enabled := False;

      Exit;
   End;

   Dm.tblEscolas.Open;

   tblDisciplina.Close;
   tblDisciplina.ParamByName('curso').AsSTring := txtCurso.Text;
   tblDisciplina.Open;

   //Montar as Tabs...

   DM.CriarConsulta(qyTemp);

   qyTemp.SQL.Text := 'SELECT DISTINCT serie ' +
   ' from fichaindividual ' +
   ' where codigoaluno = :codigoaluno  and curso = :curso and turma = ''HISTORICO'' ';
   qyTemp.SQL.Add(' order by serie ');

   qyTemp.ParamByName('codigoaluno').AsInteger := codigoaluno;
   qyTemp.ParamByName('curso').AsString := txtCurso.Text;
   qyTemp.Open();

   iPosAtual := tcSeries.TabIndex;

   tcSeries.Tabs.Clear();
   tcSeries.Tabs.Add('Todas');
   while not qyTemp.Eof do begin
      tcSeries.Tabs.Add(qyTemp.FieldByName('serie').AsString);
      qyTemp.Next();
   end;

   if tcSeries.Tabs.Count -1 >= iPosAtual  then begin
      tcSeries.TabIndex := iPosAtual
   end else begin
      tcSeries.TabIndex := 0;
   end;

   FreeAndNil(qyTemp);

   tblHistorico.Close;
   tblHistorico.SQL.Text := '' +
   ' select simbolo_obs, codigograde, grau, carga_horaria, anosemestre, situacao, mediafinal, codigoaluno, disciplina, frequencia, curso, turma, serie, aproveitamento, codigoescola, ds_media, totalfaltas ' +
   ' from fichaindividual ' +
   ' where codigoaluno = :codigoaluno  and curso = :curso and turma = ''HISTORICO'' ';

   if tcSeries.TabIndex > 0 then begin

      iPosAtual := StrToInt(tcSeries.Tabs[tcSeries.TabIndex]);

      tblHistorico.SQL.Add(' AND serie = ''' + IntToStr(iPosAtual) + ''' ' );

   end;

   tblHistorico.SQL.Add(' order by curso, serie ');

   tblHistorico.ParamByName('codigoaluno').AsInteger := codigoaluno;
   tblHistorico.ParamByName('curso').AsString := txtCurso.Text;
   tblHistorico.Open;

   tblObsHistorico.Close;
   tblObsHistorico.ParamByName('codigoaluno').AsInteger := codigoaluno;
   tblObsHistorico.ParamByName('curso').AsString := txtCurso.Text;
   tblObsHistorico.Open;

   tblColegiosGrau1.Close;
   tblColegiosGrau1.ParamByName('codigoaluno').AsInteger := codigoaluno;
   tblColegiosGrau1.Open;

   tblColegiosGrau2.Close;
   tblColegiosGrau2.ParamByName('codigoaluno').AsInteger := codigoaluno;
   tblColegiosGrau2.Open;

   qryColegiosGrau3.Close;
   qryColegiosGrau3.ParamByName('codigoaluno').AsInteger := codigoaluno;
   qryColegiosGrau3.Open;

   tblColegiosSeries.Close;
   tblColegiosSeries.ParamByName('codigoaluno').AsInteger := codigoaluno;
   tblColegiosSeries.Open;

   qyCursos.Close;
   qyCursos.Open();

   qyVestibular.Close;
   qyVestibular.ParamByName('cd_aluno').AsInteger := codigoaluno;
   qyVestibular.Open;

   //Habilita campos para busca/cadastro de instituições.
   SpeedButton1.Enabled := True;
   btnEscolaFundamental.Enabled := True;
   btEscolaMedio.Enabled := True;
   btnEscolaSuperior.Enabled := True;
   btEscolaSerie.Enabled := True;
   SpeedButton3.Enabled := True;

   pnCad.Enabled := True;

end;

procedure Tfrm_historico_anterior.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  Begin
      SelectNext(Sender as tWincontrol, True, True);
      Key := #0;
  End;
end;

procedure Tfrm_historico_anterior.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   cbInstituicoes.Visible := false;
   
   if ( gdSelected IN State ) and
      ( Column.FieldName = 'descEscola' ) then
   begin
      cbInstituicoes.Top := Rect.Top + DBGrid1.Top;
      cbInstituicoes.Left := DBGrid1.Left + Rect.Left;
      cbInstituicoes.Width := Rect.Right - Rect.Left +1 ;
      cbInstituicoes.Height := Rect.Bottom - Rect.Top - 2;
      cbInstituicoes.Visible := true;
   end;
end;

procedure Tfrm_historico_anterior.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= DBGrid1.MouseCoord(x, y);

  if pt.y=0 then
    DBGrid1.Cursor:=crHandPoint
  else
    DBGrid1.Cursor:=crDefault;
end;

procedure Tfrm_historico_anterior.DBGrid1TitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      // Os campos são separados por ;
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
 
      // Espaço é o separador entre o nome do campo e o seu valor (Asc ou Desc)
      SortedFields.NameValueSeparator := ' ';
 
      // qrySample é o componente TZQuery/TZReadOnlyQuery ligado à grid
      SortedFields.DelimitedText := tblHistorico.IndexFieldNames;
 
      // Percorre todos os campos sobre os quais foi aplicado ordenação
      for I := 0 to SortedFields.Count - 1 do
 
         // Verifica se o campo é o mesmo selecionado pelo usuário
         // Caso sim, significa que o campo já possui uma ordenação
 
         if SortedFields.Names[I] = Column.FieldName then
         begin
 
            // Verifica se a ordenação é Asc ou Desc
 
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               // Se a ordenação é Asc, então muda para Desc
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               // Se a ordenação é Desc, então remove a ordenação do campo
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
 
            // Sinaliza que o campo foi encontrado e quebra o loop
 
            Found := True;
            Break;
         end;
 
      // Se o campo não foi encontrado, significa que
      // ele não possui ordenação
      // Vamos aplicar a ordenação ascendente
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      // Configura a propriedade da query
      tblHistorico.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure Tfrm_historico_anterior.DBGrid2TitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      // Os campos são separados por ;
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
 
      // Espaço é o separador entre o nome do campo e o seu valor (Asc ou Desc)
      SortedFields.NameValueSeparator := ' ';

      // qrySample é o componente TZQuery/TZReadOnlyQuery ligado à grid
      SortedFields.DelimitedText := qyVestibular.IndexFieldNames;
 
      // Percorre todos os campos sobre os quais foi aplicado ordenação
      for I := 0 to SortedFields.Count - 1 do
 
         // Verifica se o campo é o mesmo selecionado pelo usuário
         // Caso sim, significa que o campo já possui uma ordenação
 
         if SortedFields.Names[I] = Column.FieldName then
         begin
 
            // Verifica se a ordenação é Asc ou Desc
 
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               // Se a ordenação é Asc, então muda para Desc
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               // Se a ordenação é Desc, então remove a ordenação do campo
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
 
            // Sinaliza que o campo foi encontrado e quebra o loop
 
            Found := True;
            Break;
         end;
 
      // Se o campo não foi encontrado, significa que
      // ele não possui ordenação
      // Vamos aplicar a ordenação ascendente
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      // Configura a propriedade da query
      qyVestibular.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure Tfrm_historico_anterior.DBGrid3TitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      // Os campos são separados por ;
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
 
      // Espaço é o separador entre o nome do campo e o seu valor (Asc ou Desc)
      SortedFields.NameValueSeparator := ' ';

      // qrySample é o componente TZQuery/TZReadOnlyQuery ligado à grid
      SortedFields.DelimitedText := tblColegiosSeries.IndexFieldNames;
 
      // Percorre todos os campos sobre os quais foi aplicado ordenação
      for I := 0 to SortedFields.Count - 1 do
 
         // Verifica se o campo é o mesmo selecionado pelo usuário
         // Caso sim, significa que o campo já possui uma ordenação
 
         if SortedFields.Names[I] = Column.FieldName then
         begin
 
            // Verifica se a ordenação é Asc ou Desc
 
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               // Se a ordenação é Asc, então muda para Desc
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               // Se a ordenação é Desc, então remove a ordenação do campo
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
 
            // Sinaliza que o campo foi encontrado e quebra o loop
 
            Found := True;
            Break;
         end;
 
      // Se o campo não foi encontrado, significa que
      // ele não possui ordenação
      // Vamos aplicar a ordenação ascendente
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      // Configura a propriedade da query
      tblColegiosSeries.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure Tfrm_historico_anterior.dsHistoricoDataChange(Sender: TObject;
  Field: TField);
var
   i: Integer;
   indice : Integer;
begin
   //Carrega a combo de instituições, foi separado para mostar ao cliente as instituições inativas
   edEscola.Text := '';
   
   for I := 0 to cbInstituicoes.Items.Count - 1 do
   begin
      if tblHistoricocodigoescola.AsString = TItemCombo(cbInstituicoes.Items.Objects[I]).codigo then
      begin
         edEscola.Text := TItemCombo(cbInstituicoes.Items.Objects[I]).descricao;
      end;
   end;
end;

procedure Tfrm_historico_anterior.dsHistoricoStateChange(Sender: TObject);
begin
   case PageControl1.ActivePageIndex of
   0 : Begin
         btnInserir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]);

         btnIncluirGrade.Enabled := (tblHistorico.State in [dsInsert, dsEdit]) ;

       End;
   1 : Begin
         btnInserir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]);
       End;
   2 : Begin
         btnInserir.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (qyVestibular.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (qyVestibular.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (qyVestibular.State in [dsInsert, dsEdit]);
   end;
   3 : Begin
         btnInserir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblObsHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]);
       End;
   End;

end;

procedure Tfrm_historico_anterior.btnIncluirGradeClick(Sender: TObject);
Var
   iSerie, iAno, iEscola : Integer;
   sMsg : String;
   CursoMestre : TCursoMestre;
begin

  // Seta o focus em outro componente para garantir que as informações de tblHistorico sejam atualizadas
  DBEdit2.SetFocus;

  sMsg := sMsg + 'Este procedimento incluirá todas as disciplinas ' + CHR(13);
  sMsg := sMsg + 'da "etapa '+ tblHistoricoserie.AsString + '" da grade como historico anterior. ' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Depois, você poderá excluí-las do histórico se necessário.' + CHR(13) + CHR(13);

  sMsg := sMsg + 'Deseja continuar? ';

  if Mensagem( sMsg, 'Confirmação: ', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION ) = ID_NO then Exit;

   // Guardar as informações inseridas
   iSerie := tblHistoricoserie.AsInteger;
   iAno := tblHistoricoanosemestre.AsInteger;
   iEscola := tblHistoricocodigoescola.AsInteger;

   // Cancelar as Alterações atuais
   tblHistorico.Cancel();


   CursoMestre := TCursoMestre.Create( txtCurso.Text, True );


   qryMaxAnosem.Close;
   
   // Inserir todas as disciplinas da Etapa.

   // Pegar as etapas da grade
   qryInsertFicha.ParamByName('CD_ALUNO').AsInteger := codigoaluno;
   qryInsertFicha.ParamByName('CD_CURSO').AsString := txtCurso.Text;
   qryInsertFicha.ParamByName('NR_ANOSEMESTRE').AsInteger := iAno;
   qryInsertFicha.ParamByName('CD_ESCOLA').AsInteger := iEscola;
   qryInsertFicha.ParamByName('NR_GRAU').AsInteger := CursoMestre.Grau;
   qryInsertFicha.ParamByName('NR_SERIE').AsInteger := iSerie;
   qryInsertFicha.ParamByName('cd_matricula_curso').AsInteger := codigoMatriculaCurso;
   try
     qryInsertFicha.ExecSQL;     
   except on E: Exception do
   end;


   // Pegar as etapas da grade
   qryInsertHist.ParamByName('CD_ALUNO').AsInteger := codigoaluno;
   qryInsertHist.ParamByName('NR_GRAU').AsInteger := CursoMestre.Grau;
   qryInsertHist.ParamByName('NR_SERIE').AsInteger := iSerie;
   qryInsertHist.ParamByName('NR_ANO').AsInteger := iAno;
   qryInsertHist.ParamByName('CD_INSTITUICAO').AsInteger := iEscola;
   qryInsertHist.ExecSQL;

   FreeAndNil(CursoMestre);

   Filtra();   

end;

procedure Tfrm_historico_anterior.btnInserirClick(Sender: TObject);
var
   serie, cod_escola, anosemestre : integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1015, npIncluir, True ) then Exit;

   if (txtCurso.Text = '') or (txtAluno.Text = '') then
   begin
      Mensagem('Selecione primeiro o curso e o aluno. ',  'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
   end;

   case PageControl1.ActivePageIndex of
    0: Begin

         pnCad.Enabled := True;
         dbSerie.SetFocus;

         { Ao incluir uma disciplina, sugerir as informações do último cadastro }
         serie := tblHistoricoserie.AsInteger;
         cod_escola := tblHistoricocodigoescola.AsInteger;
         anosemestre := tblHistoricoanosemestre.AsInteger;

         tblHistorico.Insert;

         tblHistoricoserie.AsInteger := serie;
         tblHistoricocodigoescola.AsInteger := cod_escola;
         tblHistoricoanosemestre.AsInteger := anosemestre;

       end;
    1: Begin
         DBEdit17.SetFocus;
         tblColegiosSeries.Insert;
       End;
    2: Begin
         DBEdit23.SetFocus;
         qyVestibular.Insert;
         Dm.tblInstituicoes.Close();
         DM.tblInstituicoes.Open();
       End;
    3: Begin
         DBMemo1.SetFocus;
         tblObsHistorico.Edit;
       End;
    End;

end;

procedure Tfrm_historico_anterior.btEscolaMedioClick(Sender: TObject);
begin

   Application.CreateForm(TfCadInstituicao, fCadInstituicao);
   if fCadInstituicao.ShowModal = mrOk then
   begin

      IF NOT (tblColegiosGrau2.State in [dsInsert, dsEdit]) then
      begin
         tblColegiosGrau2.Edit;
      end;

      tblColegiosGrau2ds_escola.AsString := fCadInstituicao.qryInstituicoesNM_INSTITUICAO.AsString;
      tblColegiosGrau2ds_escola_cidade.AsString := fCadInstituicao.qryInstituicoesDS_CIDADE.AsString;
      tblColegiosGrau2ds_escola_estado.AsString := fCadInstituicao.qryInstituicoesds_estado.AsString;
      tblColegiosGrau2cd_instituicao.AsInteger  := fCadInstituicao.qryInstituicoescd_instituicao.AsInteger;
   end;

   btEscolaMedio.Down := False;
end;

procedure Tfrm_historico_anterior.btEscolaSerieClick(Sender: TObject);
begin

   Application.CreateForm(TfCadInstituicao, fCadInstituicao);
   if fCadInstituicao.ShowModal = mrOk then
   begin

      IF NOT (tblColegiosSeries.State in [dsInsert, dsEdit]) then
      begin
         tblColegiosSeries.Edit;
      end;

      tblColegiosSeriesds_escola.AsString := fCadInstituicao.qryInstituicoesNM_INSTITUICAO.AsString;
      tblColegiosSeriesds_escola_cidade.AsString := fCadInstituicao.qryInstituicoesDS_CIDADE.AsString;
      tblColegiosSeriesds_escola_estado.AsString := fCadInstituicao.qryInstituicoesds_estado.AsString;
      tblColegiosSeriescd_instituicao.AsInteger  := fCadInstituicao.qryInstituicoescd_instituicao.AsInteger;
   end;

   btEscolaSerie.Down := False;
end;

procedure Tfrm_historico_anterior.btnAlterarClick(Sender: TObject);
begin
if not DM.UsuarioLogado.TemPermissao( 1015, npAlterar, True ) then Exit;

if (txtCurso.Text = '') or (txtAluno.Text = '') then
begin
  Mensagem('Selecione primeiro o curso e o aluno. ',  'Atenção', MB_OK + MB_ICONWARNING);
  Abort;
end;

   case PageControl1.ActivePageIndex of
    0: Begin
         pnCad.Enabled := True;
         dbSerie.SetFocus;
         tblHistorico.Edit;
       end;
    1: Begin

         if (DBEdit7.Focused) or (dbEscolaG1.Focused) or (dbCidadeG1.Focused) or
            (dbEstadoG1.Focused) or (DBEdit11.Focused) or (dbEscolaG2.Focused) or
            (dbCidadeG2.Focused) or (dbEstadoG2.Focused)
            then begin
              DBEdit7.SetFocus;
              tblColegiosGrau1.Edit;
            end
         else
         begin
              DBEdit15.SetFocus;
              tblColegiosSeries.Edit;
         end;

       End;
    2: Begin
         DBEdit23.SetFocus;
         qyVestibular.Edit;
       End;
    3: Begin
         DBMemo1.SetFocus;
         tblObsHistorico.Edit;
       End;
    End;

end;

procedure Tfrm_historico_anterior.btnEscolaFundamentalClick(Sender: TObject);
begin

   Application.CreateForm(TfCadInstituicao, fCadInstituicao);
   if fCadInstituicao.ShowModal = mrOk then
   begin

      IF NOT (tblColegiosGrau1.State in [dsInsert, dsEdit]) then
      begin
         tblColegiosGrau1.Edit;
      end;

      tblColegiosGrau1ds_escola.AsString := fCadInstituicao.qryInstituicoesNM_INSTITUICAO.AsString;
      tblColegiosGrau1ds_escola_cidade.AsString := fCadInstituicao.qryInstituicoesDS_CIDADE.AsString;
      tblColegiosGrau1ds_escola_estado.AsString := fCadInstituicao.qryInstituicoesds_estado.AsString;
      tblColegiosGrau1cd_instituicao.AsInteger  := fCadInstituicao.qryInstituicoescd_instituicao.AsInteger;
   end;

   btnEscolaFundamental.Down := False;

end;

procedure Tfrm_historico_anterior.btnEscolaSuperiorClick(Sender: TObject);
begin

   Application.CreateForm(TfCadInstituicao, fCadInstituicao);
   if fCadInstituicao.ShowModal = mrOk then
   begin

      IF NOT (qryColegiosGrau3.State in [dsInsert, dsEdit]) then
      begin
         qryColegiosGrau3.Edit;
      end;

      qryColegiosGrau3ds_escola.AsString := fCadInstituicao.qryInstituicoesNM_INSTITUICAO.AsString;
      qryColegiosGrau3ds_escola_cidade.AsString := fCadInstituicao.qryInstituicoesDS_CIDADE.AsString;
      qryColegiosGrau3ds_escola_estado.AsString := fCadInstituicao.qryInstituicoesds_estado.AsString;
      qryColegiosGrau3cd_instituicao.AsInteger  := fCadInstituicao.qryInstituicoescd_instituicao.AsInteger;
   end;

   btnEscolaSuperior.Down := False;
end;

procedure Tfrm_historico_anterior.btnExcluirClick(Sender: TObject);
begin
if not DM.UsuarioLogado.TemPermissao( 1015, npExcluir, True ) then Exit;

if (txtCurso.Text = '') or (txtAluno.Text = '') then
begin
  Mensagem('Selecione primeiro o curso e o aluno. ',  'Atenção', MB_OK + MB_ICONWARNING);
  Abort;
end;

  case PageControl1.ActivePageIndex of

  0 : Begin
        if Mensagem('Tem certeza que deseja apagar a informação do histórico anterior do aluno?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes
        then Exit;

        tblHistorico.Delete;
      End;
  1 : Begin
        if Mensagem('Tem certeza que deseja apagar a informação do histórico anterior do aluno?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes
        then Exit;

        tblColegiosSeries.Delete;
      End;
  2 : Begin
        if Mensagem('Tem certeza que deseja apagar a informação do histórico anterior do aluno?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes
        then Exit;

        qyVestibular.Delete;
      End;

  end;
end;

procedure Tfrm_historico_anterior.btnSalvarClick(Sender: TObject);
Var
   serie, disciplina : Integer;
begin

if (txtCurso.Text = '') or (txtAluno.Text = '') then
begin
  Mensagem('Selecione primeiro o curso e o aluno. ',  'Atenção', MB_OK + MB_ICONWARNING);
  Abort;
end;

   case PageControl1.ActivePageIndex of

   0 :  Begin
          serie := tblHistoricoserie.AsInteger;
          disciplina := tblHistoricodisciplina.AsInteger;
          tblHistorico.Post;

          tblHistorico.Close;
          tblHistorico.Open;

          tblHistorico.Locate('serie;disciplina', VarArrayOf([serie,disciplina]), []);

        End;
   1 :  Begin

          if tblColegiosGrau1.State in [dsInsert, dsEdit] Then
                tblColegiosGrau1.Post;

          if tblColegiosGrau2.State in [dsInsert, dsEdit] Then
                tblColegiosGrau2.Post;

          iF qryColegiosGrau3.State in [dsInsert, dsEdit] then
                qryColegiosGrau3.Post;
          
          if tblColegiosSeries.State in [dsInsert, dsEdit] Then
                tblColegiosSeries.Post;

          tblColegiosGrau1.Close;
          tblColegiosGrau1.Open;
          tblColegiosGrau2.Close;
          tblColegiosGrau2.Open;
          qryColegiosGrau3.Close;
          qryColegiosGrau3.Open;
          tblColegiosSeries.Close;
          tblColegiosSeries.Open;
        End;
   2 :  Begin
          pnCad.Enabled := False;
          qyVestibular.Post;
          qyVestibular.Close;
          qyVestibular.Open;
        End;
   3 :  Begin
          tblObsHistorico.Post;
          tblObsHistorico.Close;
          tblObsHistorico.Open;
        End;
   End;

end;

procedure Tfrm_historico_anterior.CarregaInstituicoes;
begin

   DM.tblInstituicoes.Close;
   DM.tblInstituicoes.Open;

   while not(DM.tblInstituicoes.Eof) do
   begin
      cbInstituicoes.Items.AddObject(
         DM.tblInstituicoesnm_instituicao.AsString,
         TItemCombo.Create(
            DM.tblInstituicoescd_instituicao.AsString,
            DM.tblInstituicoesnm_instituicao.AsString
         )
      );

      DM.tblInstituicoes.Next;
   end;
end;

procedure Tfrm_historico_anterior.cbInstituicoesChange(Sender: TObject);
begin
   comboIndex := cbInstituicoes.ItemIndex;
end;

procedure Tfrm_historico_anterior.cbInstituicoesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   DM.tblInstituicoes.Locate(
      'nm_instituicao',
      cbInstituicoes.Items[index],
      []
   );

   if (DM.tblInstituicoessn_irregular.AsString = '1') then
   begin
      cbInstituicoes.Canvas.Brush.Color := clRed;
   end;

   cbInstituicoes.Canvas.FillRect(Rect);
   
   cbInstituicoes.Canvas.TextOut(
      Rect.Left,
      Rect.Top,
      TItemCombo(cbInstituicoes.Items.Objects[cbInstituicoes.ItemIndex]).descricao
   );

   if( State = [odComboBoxEdit] ) then
   begin
      cbInstituicoes.ItemIndex := comboIndex;
   end;
end;

procedure Tfrm_historico_anterior.cbInstituicoesExit(Sender: TObject);
begin
   DM.tblInstituicoes.Locate(
      'nm_instituicao',
      cbInstituicoes.Items[cbInstituicoes.ItemIndex],
      []
   );

   if(tblHistoricocodigoescola.AsString <> DM.tblInstituicoescd_instituicao.AsString) then
   begin

      if not (tblHistorico.State  in [dsInsert,dsEdit]) then
      begin
         tblHistorico.Edit;
      end;

      tblHistoricocodigoescola.AsString := dm.tblInstituicoescd_instituicao.AsString;
   end;
end;

procedure Tfrm_historico_anterior.btnRemover1Click(Sender: TObject);
begin
   tblColegiosGrau1.Delete;
end;

procedure Tfrm_historico_anterior.btnRemover2Click(Sender: TObject);
begin
   tblColegiosGrau2.Delete;
end;

procedure Tfrm_historico_anterior.btnRemover3Click(Sender: TObject);
begin
   qryColegiosGrau3.Delete;
end;

procedure Tfrm_historico_anterior.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_historico_anterior.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
      VK_F2 : if btnInserir.Enabled then btnInserir.Click;
      VK_F3 : if btnAlterar.Enabled then btnAlterar.Click;
      VK_F9 : if btnExcluir.Enabled then btnExcluir.Click;
      VK_F5 : if btnSalvar.Enabled then btnSalvar.Click;
      VK_F6 : if btnCancelar.Enabled then btnCancelar.Click;
      VK_F12 : if btnFechar.Enabled then btnFechar.Click;
    end;
end;

procedure Tfrm_historico_anterior.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_historico_anterior.tblHistoricoNewRecord(DataSet: TDataSet);
var
   CursoMestre : TCursoMestre;
begin
   CursoMestre := TCursoMestre.Create( txtCurso.Text, True );

   tblHistoricocodigoaluno.AsInteger := codigoaluno;
   tblHistoricocurso.AsString := txtCurso.Text;
   tblHistoricosituacao.AsInteger := 0;
   tblHistoricoturma.AsString := 'HISTORICO';
   tblHistoricograu.AsInteger := CursoMestre.Grau;
   tblHistoricocodigograde.AsString := '';

   FreeAndNil(CursoMestre);
end;

procedure Tfrm_historico_anterior.tblObsHistoricoNewRecord(
  DataSet: TDataSet);
begin
    tblObsHistoricocodigoaluno.AsInteger := codigoaluno;
    tblObsHistoricocurso.AsString := txtCurso.Text;
end;

procedure Tfrm_historico_anterior.btnCancelarClick(Sender: TObject);
begin

if (txtCurso.Text = '') or (txtAluno.Text = '') then
begin
  Mensagem('Selecione primeiro o curso e o aluno. ',  'Atenção', MB_OK + MB_ICONWARNING);
  Abort;
end;

   tblColegiosGrau1.Cancel;
   tblColegiosGrau2.Cancel;
   tblColegiosSeries.Cancel;
   tblObsHistorico.Cancel;
   tblHistorico.Cancel;
   qyVestibular.Cancel;
   qryColegiosGrau3.Cancel;
end;

procedure Tfrm_historico_anterior.tblColegiosGrau1NewRecord(DataSet: TDataSet);
begin
    tblColegiosGrau1codigoaluno.AsInteger := codigoaluno;
    tblColegiosGrau1grau.AsInteger := 1;
end;

procedure Tfrm_historico_anterior.dsObsStateChange(Sender: TObject);
begin
   case PageControl1.ActivePageIndex of
   0 : Begin
         btnInserir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]);

       End;
   1 : Begin
         btnInserir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]);
       End;
   2 : Begin
         btnInserir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblObsHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]);
       End;
   End;


end;

procedure Tfrm_historico_anterior.dsColegiosGrau1DataChange(Sender: TObject;
  Field: TField);
begin
   if tblColegiosGrau1.RecordCount > 0 then
   begin
      btnRemover1.Enabled := True;
   end
   else
   begin
      btnRemover1.Enabled := False;
   end;
end;

procedure Tfrm_historico_anterior.dsColegiosGrau1StateChange(Sender: TObject);
begin
   case PageControl1.ActivePageIndex of
   0 : Begin
         btnInserir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]);

       End;
   1 : Begin
         btnInserir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]);
       End;
   2 : Begin
         btnInserir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblObsHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]);
       End;
   End;
end;

procedure Tfrm_historico_anterior.tblColegiosGrau2AfterOpen(DataSet: TDataSet);
begin
   if tblColegiosGrau2.RecordCount > 0 then
   begin
      btnRemover2.Enabled := True;
   end
   else
   begin
      btnRemover2.Enabled := False;
   end;
end;

procedure Tfrm_historico_anterior.tblColegiosGrau2NewRecord(
  DataSet: TDataSet);
begin
    tblColegiosGrau2codigoaluno.AsInteger := codigoaluno;
    tblColegiosGrau2grau.AsInteger := 2;
end;

procedure Tfrm_historico_anterior.tblColegiosGrau1AfterOpen(DataSet: TDataSet);
begin
   if tblColegiosGrau1.RecordCount > 0 then
   begin
      btnRemover1.Enabled := True;   
   end
   else
   begin
      btnRemover1.Enabled := False;
   end;
end;

procedure Tfrm_historico_anterior.tblColegiosGrau1FilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
    tblColegiosGrau1codigoaluno.AsInteger := codigoaluno;
    tblColegiosGrau1grau.AsInteger := 1;
end;

procedure Tfrm_historico_anterior.dsColegiosGrau2DataChange(Sender: TObject;
  Field: TField);
begin
   if tblColegiosGrau2.RecordCount > 0 then
   begin
      btnRemover2.Enabled := True;
   end
   else
   begin
      btnRemover2.Enabled := False;
   end;
end;

procedure Tfrm_historico_anterior.dsColegiosGrau2StateChange(
  Sender: TObject);
begin
   if tblColegiosGrau2.State in [dsInsert, dsEdit] then
       tblColegiosGrau1.Edit;
end;

procedure Tfrm_historico_anterior.dsColegiosGrau3DataChange(Sender: TObject;
  Field: TField);
begin
   if qryColegiosGrau3.RecordCount > 0 then
   begin
      btnRemover3.Enabled := True;
   end
   else
   begin
      btnRemover3.Enabled := False;
   end;
end;

procedure Tfrm_historico_anterior.dsColegiosGrau3StateChange(Sender: TObject);
begin
  btnInserir.Enabled :=  (not (qryColegiosGrau3.State in [dsInsert, dsEdit]));
  btnAlterar.Enabled :=  (not (qryColegiosGrau3.State in [dsInsert, dsEdit]));
  btnExcluir.Enabled :=  (not (qryColegiosGrau3.State in [dsInsert, dsEdit]));
  btnFechar.Enabled :=   (not (qryColegiosGrau3.State in [dsInsert, dsEdit]));

  btnSalvar.Enabled :=  (qryColegiosGrau3.State in [dsInsert, dsEdit]) ;
  btnCancelar.Enabled :=  (qryColegiosGrau3.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_historico_anterior.dsColegiosSeriesStateChange(
  Sender: TObject);
begin
   if tblColegiosSeries.State in [dsInsert, dsEdit] then
       tblColegiosGrau1.Edit; 

end;

procedure Tfrm_historico_anterior.Label28Click(Sender: TObject);
begin
   if  Mensagem('Excluir informações da série selecionada?',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
   <> mrYes then Exit;

   tblColegiosSeries.Delete; 
end;

procedure Tfrm_historico_anterior.qryColegiosGrau3AfterOpen(DataSet: TDataSet);
begin
   if qryColegiosGrau3.RecordCount > 0 then
   begin
      btnRemover3.Enabled := True;
   end
   else
   begin
      btnRemover3.Enabled := False;
   end;
end;

 procedure Tfrm_historico_anterior.qryColegiosGrau3FilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
    qryColegiosGrau3codigoaluno.AsInteger := codigoaluno;
    qryColegiosGrau3grau.AsInteger := 1;
end;

procedure Tfrm_historico_anterior.qryColegiosGrau3NewRecord(DataSet: TDataSet);
begin
    qryColegiosGrau3codigoaluno.AsInteger := codigoaluno;
    qryColegiosGrau3grau.AsInteger := 3;
end;

procedure Tfrm_historico_anterior.qyVestibularAfterOpen(DataSet: TDataSet);
begin
   edEscolaVest.Text := qyVestibularinstituicao.AsString;
end;

procedure Tfrm_historico_anterior.qyVestibularCalcFields(
  DataSet: TDataSet);
begin
  qyVestibular.FieldByName('anosem').AsString := Copy(qyVestibular.FieldByName('anosemestre').AsString,1,4)+'/'+Copy(qyVestibular.FieldByName('anosemestre').AsString,5,1);
end;

procedure Tfrm_historico_anterior.qyVestibularNewRecord(DataSet: TDataSet);
begin
    qyVestibular.FieldByName('codigoaluno').AsInteger := codigoaluno;
    qyVestibular.FieldByName('curso_inscricao').AsString := txtCurso.Text;
    qyVestibular.FieldByName('curso').AsString := txtCurso.Text;
    qyVestibular.FieldByName('nome').AsString := txtAluno.Text;
end;

procedure Tfrm_historico_anterior.dsVestibularDataChange(Sender: TObject;
  Field: TField);
begin
   case PageControl1.ActivePageIndex of
   0 : Begin
         btnInserir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]);

       End;
   1 : Begin
         btnInserir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]);
       End;
   2 : Begin
         btnInserir.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (qyVestibular.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (qyVestibular.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (qyVestibular.State in [dsInsert, dsEdit]);
   end;
   3 : Begin
         btnInserir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblObsHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]);
       End;
   End;
end;

procedure Tfrm_historico_anterior.pmQtdHistoricoPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblHistorico, pmQtdHistorico);

end;

procedure Tfrm_historico_anterior.pmQtdColegiosSeriesPopup(
  Sender: TObject);
begin
  DM.quantidade_registros(tblColegiosSeries, pmQtdColegiosSeries);

end;

procedure Tfrm_historico_anterior.pmQtdVersibularPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyVestibular, pmQtdVersibular);

end;

procedure Tfrm_historico_anterior.tblColegiosSeriesBeforePost(
  DataSet: TDataSet);
begin
    tblColegiosSeriescodigoaluno.AsInteger := codigoaluno;
end;

procedure Tfrm_historico_anterior.dsObsDataChange(Sender: TObject;
  Field: TField);
begin
   case PageControl1.ActivePageIndex of
   0 : Begin
         btnInserir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblHistorico.State in [dsInsert, dsEdit]);

       End;
   1 : Begin
         btnInserir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblColegiosGrau1.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblColegiosGrau1.State in [dsInsert, dsEdit]);
       End;
   2 : Begin
         btnInserir.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (qyVestibular.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (qyVestibular.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (qyVestibular.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (qyVestibular.State in [dsInsert, dsEdit]);
   end;
   3 : Begin
         btnInserir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnAlterar.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnExcluir.Enabled :=  (not (tblObsHistorico.State in [dsInsert, dsEdit]));
         btnFechar.Enabled :=   (not (tblObsHistorico.State in [dsInsert, dsEdit]));

         btnSalvar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]) ;
         btnCancelar.Enabled :=  (tblObsHistorico.State in [dsInsert, dsEdit]);
       End;
   End;
end;

end.

