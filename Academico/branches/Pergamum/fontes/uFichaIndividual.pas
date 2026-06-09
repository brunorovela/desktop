unit uFichaIndividual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls,  Buttons, ComCtrls, Db, ZConnection,
  Menus, DBCtrls, DBCGrids, Mask, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, ImgList, ToolWin, Variants, uFSelecionarTurma;
  
type
  TfrmFichaIndividual = class(TForm)
    Panel3: TPanel;
    Panel8: TPanel;
    btnAluno: TSpeedButton;
    btnTurmas: TSpeedButton;
    tblFicha: TUMZQuery;
    dtcFicha: TDataSource;
    tblFichaCodigoAluno: TIntegerField;
    tblFichaNome: TStringField;
    tblFichaTurma: TStringField;
    tblFichaSigla: TStringField;
    tblFichaNota1: TFloatField;
    tblFichaNota2: TFloatField;
    tblFichaNota3: TFloatField;
    tblFichaNota4: TFloatField;
    tblFichaNotaExame: TFloatField;
    tblFichaSituacao: TSmallintField;
    Panel1: TPanel;
    lbl: TLabel;
    lbl2: TLabel;
    tblFichaDescricaoSituacao: TStringField;
    tblFichaAnoSemestre: TSmallintField;
    qry: TUMZQuery;
    Label7: TLabel;
    txtDisciplina: TEdit;
    tblFichaMediaFinal: TFloatField;
    tblAtualizar: TUMZQuery;
    tblFichaCurso: TStringField;
    tbl: TUMZQuery;
    tblFichaCodigoGrade: TStringField;
    SpeedButton6: TSpeedButton;
    tblFichaTurmaMatricula: TStringField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    tblFichaGrau: TSmallintField;
    tblFichaSerie: TSmallintField;
    tblFichaNota5: TFloatField;
    tblFichaNota6: TFloatField;
    tblFichaNota7: TFloatField;
    tblFichaNota8: TFloatField;
    tblFichaNota9: TFloatField;
    tblFichaNota10: TFloatField;
    tblFichaUsuario: TIntegerField;
    tblFichaCodigoEscola: TSmallintField;
    tblFichaMediaAnual: TFloatField;
    popFicha: TPopupMenu;
    PorAluno1: TMenuItem;
    PorTurma1: TMenuItem;
    toolPessoa: TToolBar;
    SpeedButton5: TToolButton;
    SpeedButton3: TToolButton;
    btnAcerto: TToolButton;
    ToolButton4: TToolButton;
    btnObservacoes: TToolButton;
    SpeedButton1: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    tblFichaSegunda_Epoca: TFloatField;
    tblFichaexame1: TFloatField;
    tblFichaexame2: TFloatField;
    tblFichaexame3: TFloatField;
    tblFichaexame4: TFloatField;
    tblFichaexame5: TFloatField;
    tblFichaexame6: TFloatField;
    tblFichaexame7: TFloatField;
    tblFichaexame8: TFloatField;
    tblFichaexame9: TFloatField;
    tblFichaexame10: TFloatField;
    tblFichanota_d1: TFloatField;
    tblFichanota_d2: TFloatField;
    tblFichanota_d3: TFloatField;
    tblFichanota_d4: TFloatField;
    tblFichanota_d5: TFloatField;
    tblFichanota_d6: TFloatField;
    tblFichanota_d7: TFloatField;
    tblFichanota_d8: TFloatField;
    tblFichanota_d9: TFloatField;
    tblFichanota_d10: TFloatField;
    btnCodigoDisciplina: TSpeedButton;
    pmQtd: TPopupMenu;
    pmLog: TPopupMenu;
    tcFicha: TTabControl;
    grd: TDBGrid;
    tblFichaaproveitamento: TStringField;
    tblFichaarrumardiario: TStringField;
    tblFichasimbolo_obs: TStringField;
    tblFichacarga_horaria: TFloatField;
    tblFichasn_bloqueado1: TSmallintField;
    tblFichasn_bloqueado2: TSmallintField;
    tblFichasn_bloqueado3: TSmallintField;
    tblFichasn_bloqueado4: TSmallintField;
    tblFichasn_bloqueado5: TSmallintField;
    tblFichasn_bloqueado6: TSmallintField;
    tblFichasn_bloqueado7: TSmallintField;
    tblFichasn_bloqueado8: TSmallintField;
    tblFichasn_bloqueado9: TSmallintField;
    tblFichasn_bloqueado10: TSmallintField;
    tblFichabloq1: TStringField;
    tblFichabloq2: TStringField;
    tblFichabloq3: TStringField;
    tblFichabloq4: TStringField;
    tblFichabloq5: TStringField;
    tblFichabloq6: TStringField;
    tblFichabloq7: TStringField;
    tblFichabloq8: TStringField;
    tblFichabloq9: TStringField;
    tblFichabloq10: TStringField;
    tblFichafrequencia: TFloatField;
    tblFichadt_saida: TDateTimeField;
    tblFichadb_media_periodo1: TFloatField;
    tblFichacd_situacao_periodo1: TSmallintField;
    tblFichadb_media_periodo2: TFloatField;
    tblFichacd_situacao_periodo2: TSmallintField;
    tblFichadb_media_periodo3: TFloatField;
    tblFichacd_situacao_periodo3: TSmallintField;
    tblFichadb_media_periodo4: TFloatField;
    tblFichacd_situacao_periodo4: TSmallintField;
    tblFichadb_media_periodo5: TFloatField;
    tblFichacd_situacao_periodo5: TSmallintField;
    tblFichadb_media_periodo6: TFloatField;
    tblFichacd_situacao_periodo6: TSmallintField;
    tblFichadb_media_periodo7: TFloatField;
    tblFichacd_situacao_periodo7: TSmallintField;
    tblFichadb_media_periodo8: TFloatField;
    tblFichacd_situacao_periodo8: TSmallintField;
    tblFichadb_media_periodo9: TFloatField;
    tblFichacd_situacao_periodo9: TSmallintField;
    tblFichadb_media_periodo10: TFloatField;
    tblFichacd_situacao_periodo10: TSmallintField;
    qySituacoes: TUMZQuery;
    qySituacoesds_valor: TStringField;
    qySituacoesds_sigla: TStringField;
    qySituacoesme_descricao: TMemoField;
    tblFichads_situacao_periodo1: TStringField;
    tblFichads_situacao_periodo2: TStringField;
    tblFichads_situacao_periodo3: TStringField;
    tblFichads_situacao_periodo4: TStringField;
    tblFichads_situacao_periodo5: TStringField;
    tblFichads_situacao_periodo6: TStringField;
    tblFichads_situacao_periodo7: TStringField;
    tblFichads_situacao_periodo8: TStringField;
    tblFichads_situacao_periodo9: TStringField;
    tblFichads_situacao_periodo10: TStringField;
    tblFichads_media: TStringField;
    tblFichabloqA: TStringField;
    ckbSomenteAtivos: TCheckBox;
    Panel2: TPanel;
    Label1: TLabel;
    lblProfessores: TLabel;
    tblFichadescricao: TStringField;
    ckbBloq: TCheckBox;
    tblFichasn_bloq_freq1: TSmallintField;
    tblFichasn_bloq_freq2: TSmallintField;
    tblFichasn_bloq_freq3: TSmallintField;
    tblFichasn_bloq_freq4: TSmallintField;
    tblFichasn_bloq_freq5: TSmallintField;
    tblFichasn_bloq_freq6: TSmallintField;
    tblFichasn_bloq_freq7: TSmallintField;
    tblFichasn_bloq_freq8: TSmallintField;
    tblFichasn_bloq_freq9: TSmallintField;
    tblFichasn_bloq_freq10: TSmallintField;
    tblFichasn_bloq_freq_global: TSmallintField;
    tblFichabloq_freq1: TStringField;
    tblFichabloq_freq3: TStringField;
    tblFichabloq_freq2: TStringField;
    tblFichabloq_freq4: TStringField;
    tblFichabloq_freq5: TStringField;
    tblFichabloq_freq6: TStringField;
    tblFichabloq_freq8: TStringField;
    tblFichabloq_freq7: TStringField;
    tblFichabloq_freq9: TStringField;
    tblFichabloq_freq10: TStringField;
    tblFichabloq_freq_global: TStringField;
    tblFichadisciplina: TIntegerField;
    tblFichanota_pi: TFloatField;
    tblFichamediainstitucional: TStringField;
    qySituacoescodigo: TLargeintField;
    qySituacoescd_modulo: TLargeintField;
    qySituacoescd_situacao: TIntegerField;
    qySituacoescd_auxiliar: TLargeintField;
    tblFichasn_faltou_exame: TSmallintField;
    tblFichasn_faltou_2epoca: TSmallintField;
    tblFichasn_possui_adap: TSmallintField;
    tblFichasn_possui_depen: TSmallintField;
    tblFichatotalfaltas: TFloatField;
    tblFichafalta1: TFloatField;
    tblFichafalta2: TFloatField;
    tblFichafalta3: TFloatField;
    tblFichafalta4: TFloatField;
    tblFichafalta5: TFloatField;
    tblFichafalta6: TFloatField;
    tblFichafalta7: TFloatField;
    tblFichafalta8: TFloatField;
    tblFichafalta9: TFloatField;
    tblFichafalta10: TFloatField;
    tblFichacd_avaliacao: TIntegerField;
    tblFichacd_grupo: TStringField;
    procedure ckbBloqClick(Sender: TObject);
    procedure ckbSomenteAtivosClick(Sender: TObject);
    procedure tblFichaSegunda_EpocaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tblFichaNotaExameGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure tblFichaCalcFields(DataSet: TDataSet);
    procedure PorAluno1Click(Sender: TObject);
    procedure grdTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnAlunoClick(Sender: TObject);
    procedure btnTurmasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtcFichaDataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure txtDisciplinaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnAcertoClick(Sender: TObject);
    procedure tblFichaAfterClose(DataSet: TDataSet);
    procedure AtualizarMedias;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tblFichaNota1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure tblFichaAfterPost(DataSet: TDataSet);
    procedure tblFichaFalta1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnCodigoDisciplinaClick(Sender: TObject);
    procedure tblFichaexame1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure pmQtdPopup(Sender: TObject);
    procedure pmLogPopup(Sender: TObject);
  strict private
    resultado_filtro_turma : TResultadoFiltroTurma;
    dol_calcular_pi_novo : Boolean;

    procedure pmLogItemExibirZerosFichaClick(Sender: TObject);

  private
    lngCodigoAlunoAnterior : Longint;
    Disciplina : Integer;
    mostrar_per : boolean;
    procedure Filtra;
    procedure RecalcularMediaCurso;
    procedure RecalcularMediaDepto;

    Procedure AdicionarColuna(campo : string; titulo : string; tamanho : word; cor : TColor; alinhamento : TAlignment);
    { Private declarations }
  public
    lngCodigoAluno : Longint;
    strFichaTurma : String;
    intFichaAnoSemestre : Integer;
    intFrequencia: Integer;
    { Public declarations }
  end;

var
  frmFichaIndividual: TfrmFichaIndividual;

implementation

uses
   uDM, uDigFichaIndividual, uAcertoFicha, uFichaIndividualRecalculoMedia, uProcessando,
   uDigProvaInstitucional, uFSelecionarPessoa, uFSelecionarDisciplina, Math, uUsuario,
   UFObservacoes, ClassTurmas, Contnrs, uAvaliacoesConceitos;

{$R *.DFM}

procedure TfrmFichaIndividual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFichaIndividual.FormDestroy(Sender: TObject);
begin
  frmFichaIndividual := nil;
end;


procedure TfrmFichaIndividual.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmFichaIndividual.tblFichaCalcFields(DataSet: TDataSet);
var
  i : integer;
  qyDisciplinasPI : TUMZReadOnlyQuery;
begin
   if dol_calcular_pi_novo then
   begin
      DM.CriarConsulta(qyDisciplinasPI);

      // busca apenas as disciplinas que estão na pi nova
      qyDisciplinasPI.SQL.Text :=
		   '	SELECT  ' +
		   '		uni_fi.turma, uni_fi.anosemestre, uni_fi.disciplina, uni_fi.curso,  ' +
		   '		pint_pt.cd_disciplina, uni_fi.sn_dispensado_pi   ' +
		   '	FROM  ' +
		   '		fichaindividual uni_fi  ' +
		   '		INNER JOIN pint_provas_turmas pint_pt ON (  ' +
		   '			pint_pt.nr_anosemestre 	= uni_fi.anosemestre and  ' +
		   '			pint_pt.cd_curso 				= uni_fi.curso and  ' +
		   '			pint_pt.cd_turma 				= uni_fi.turma and  ' +
		   '			pint_pt.cd_disciplina   = uni_fi.disciplina  ' +
		   '		)  ' +
		   '	WHERE  ' +
		   '		uni_fi.codigoaluno 	= :codigoaluno and  ' +
		   '		uni_fi.anosemestre	= :anosemestre and ' +
         '    pint_pt.cd_disciplina = :cd_disciplina  ';

      qyDisciplinasPI.ParamByName('codigoaluno').AsInteger := tblFichaCodigoAluno.AsInteger;
      qyDisciplinasPI.ParamByName('anosemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
      qyDisciplinasPI.ParamByName('cd_disciplina').AsInteger := tblFichadisciplina.AsInteger;

      qyDisciplinasPI.Open();

      //sn_dispensado_pi = 1 - possui PI
      //sn_dispensado_pi = 0 - não possui PI
      if not qyDisciplinasPI.Eof AND (qyDisciplinasPI.FieldByName('sn_dispensado_pi').AsInteger = 0) then
      begin
         tblFichaMediainstitucional.Value := tblFichaNota_pi.AsString;
      end else begin
         tblFichaMediainstitucional.Value := 'SPI';
      end;

      qyDisciplinasPI.close();
      FreeAndNil(qyDisciplinasPI);

   end else begin
      // atribui a nota digita manualmente
      tblFichaMediainstitucional.Value := tblFichaNota_pi.AsString;
   end;

   try
      tblFichaDescricaoSituacao.AsString := DM.lst_situacao_sigla[tblFichaSituacao.AsInteger];
   except
      tblFichaDescricaoSituacao.AsString := '';
   end;

   // Etapas bloqueadas
   for i := 1 to DM.tblAvaliacao.FieldByName('nr_avaliacoes').AsInteger do
   begin
      if tblFicha.FieldByName('sn_bloqueado'+IntToStr(i)).AsInteger in [1, 2] then
         tblFicha.FieldByName('bloq'+IntToStr(i)).AsString := 'X';
      if tblFicha.FieldByName(Format('sn_bloq_freq%d', [i])).AsInteger = 1 then
         tblFicha.FieldByName(Format('bloq_freq%d', [i])).AsString := 'X'
      else
         tblFicha.FieldByName(Format('bloq_freq%d', [i])).AsString := '';
   end;

   if tblFicha.FieldByName('aproveitamento').AsString = 'S' then
   begin
      tblFicha.FieldByName('bloqA').AsString := 'X';
   end;

   if tblFicha.FieldByName('sn_bloq_freq_global').AsInteger = 1 then
      tblFicha.FieldByName('bloq_freq_global').AsString := 'X'
   else
      tblFicha.FieldByName('bloq_freq_global').AsString := '';
end;


procedure TfrmFichaIndividual.PorAluno1Click(Sender: TObject);
var
   n : Integer;
   resultado_filtro_pessoa : TResultadoFiltroPessoa;
begin
   for n := 0 to ComponentCount - 1 do
   begin
      if Components[n] is TMenuItem then
      begin
         if TMenuItem( Components[n] ).Checked = True then
         begin
            TMenuItem( Components[n] ).Checked := False;
            Break;
         end;
      end;
   end;

   TMenuItem( Sender ).Checked := True;
   case TMenuItem( Sender ).Tag of
      1 : begin
	      txtDisciplina.Enabled := False;

         resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

	      if not resultado_filtro_pessoa.filtrado then Exit;

	      lngCodigoAluno := resultado_filtro_pessoa.cd_pessoa;
	   end;

      2 : begin
	      txtDisciplina.Enabled := True;

	      resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);
	      if not resultado_filtro_turma.filtrado then Exit;
      end;
  end;
  Filtra;
end;

procedure TfrmFichaIndividual.Filtra;
var
  strAux : String;

  n,
  iEtapasPorPeriodo,
  iEtapa: Integer;
  
  lstColunas: TStringList;

  CorAux: TColor;

  LBExibiu: boolean;
begin

  // Destruir todas as colunas atuais;
  grd.Columns.Clear();

  // Não pode filtrar porque não selecionou nem turma e nem aluno 

  if not (popFicha.Items[0].Checked OR popFicha.Items[1].Checked) then
  begin
     Exit;
  end;

  Screen.Cursor := crHourGlass;

  if tcFicha.TabIndex = 0 then begin

      tblFicha.Close;
      tblFicha.SQL.Clear;
      tblFicha.SQL.Add( 'SELECT Pessoas.nm_pessoa as Nome, t.cd_avaliacao, fie.ds_observacao AS observacao, Disciplinas.codigo AS disciplina,                                             ');
      tblFicha.SQL.Add( '       FichaIndividual.*, Disciplinas.Sigla, Disciplinas.descricao, ROUND( Provainstitucional.mediainstitucional, ava.nr_casas_decimais) As nota_pi, ');
      tblFicha.SQL.Add( '       COALESCE((SELECT CAST(GROUP_CONCAT(dg.cd_grupo) AS CHAR(255)) cd_grupo FROM diario_grupos_pessoas dgp INNER JOIN diario_grupos dg ON ( dg.cd_grupo = dgp.cd_grupo ) WHERE dgp.cd_pessoa = fichaindividual.codigoaluno AND dgp.dt_saida IS NULL AND ');
      tblFicha.SQL.Add( '       dg.nr_anosemestre = fichaindividual.anosemestre AND dg.cd_curso = fichaindividual.curso AND dg.cd_turma = fichaindividual.turma AND dg.cd_disciplina = fichaindividual.disciplina ), 0) cd_grupo ');
      tblFicha.SQL.Add( 'FROM (FichaIndividual INNER JOIN Pessoas ON                                     ');
      tblFicha.SQL.Add( '      FichaIndividual.CodigoAluno = Pessoas.cd_pessoa)                                 ');
      tblFicha.SQL.Add( '      INNER JOIN TURMAS t ON (t.codigo = FichaIndividual.turma and FichaIndividual.anosemestre = t.anosemestre)      ');
      tblFicha.SQL.Add( '      INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO)      ');
      tblFicha.SQL.Add( '      INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = FichaIndividual.curso AND gd.CD_DISCIPLINA = FichaIndividual.disciplina AND gd.NR_SERIE = t.SERIE)      ');
      tblFicha.SQL.Add( '      INNER JOIN Disciplinas ON                                                        ');
      tblFicha.SQL.Add( '        (gd.cd_disciplina = Disciplinas.Codigo and                             ');
      tblFicha.SQL.Add( '        gd.cd_curso = Disciplinas.Curso)                                       ');
      tblFicha.SQL.Add( '     LEFT JOIN Provainstitucional ON (FichaIndividual.codigoaluno = Provainstitucional.codigoaluno');
      tblFicha.SQL.Add( '        AND FichaIndividual.anosemestre = Provainstitucional.anosemestre AND FichaIndividual.turmamatricula = Provainstitucional.turma)');
      tblFicha.SQL.Add( '     LEFT JOIN fichaindividual_extras fie ON ( ' );
      tblFicha.SQL.Add( '        fie.anosemestre = FichaIndividual.anosemestre AND ' );
      tblFicha.SQL.Add( '        fie.turma = FichaIndividual.turma AND ' );
      tblFicha.SQL.Add( '        fie.disciplina = FichaIndividual.disciplina AND ' );
      tblFicha.SQL.Add( '        fie.serie = FichaIndividual.serie AND ' );
      tblFicha.SQL.Add( '        fie.codigoaluno = FichaIndividual.codigoaluno ) ' );
      tblFicha.SQL.Add( '     INNER JOIN avaliacoes_parametros_matriz ava on ( ');
      tblFicha.SQL.Add( '        t.cd_avaliacao = ava.cd_avaliacao ' );
      tblFicha.SQL.Add( '     ) ');
      tblFicha.SQL.Add( 'WHERE                                                                            ');

     if popFicha.Items[0].Checked then
     begin
       tblFicha.SQL.Add( 'FichaIndividual.CodigoAluno = :CodigoAluno AND                                 ');
       tblFicha.SQL.Add( 'FichaIndividual.TurmaMatricula = :Turma AND                                    ');
       tblFicha.SQL.Add( 'FichaIndividual.AnoSemestre = :AnoSemestre                                     ');
       tblFicha.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
       tblFicha.ParamByName('Turma').AsString := strFichaTurma;
       tblFicha.ParamByName('AnoSemestre').AsInteger := intFichaAnoSemestre;
     end;

     if popFicha.Items[1].Checked then
     begin
       tblFicha.SQL.Add( 'FichaIndividual.Turma = :Turma AND' );
       tblFicha.SQL.Add( 'FichaIndividual.AnoSemestre = :AnoSemestre' );
       tblFicha.ParamByName('Turma').AsString := resultado_filtro_turma.cd_turma;
       tblFicha.ParamByName('AnoSemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;
     end;

     { Verificar os parametros de avaliação }
     DM.tblAvaliacao.Close;
     DM.tblAvaliacao.ParamByName('AnoSemestre').AsInteger := tblFicha.ParamByName('AnoSemestre').AsInteger;
     DM.tblAvaliacao.ParamByName('Turma').AsString := tblFicha.ParamByName('Turma').AsString;  
     DM.tblAvaliacao.Open;

  end;

  if (txtDisciplina.Text <> '') and (popFicha.Items[1].Checked) then
  begin
    tblFicha.SQL.Add( 'AND' );
    tblFicha.SQL.Add( 'FichaIndividual.Disciplina = :Disciplina' );
    tblFicha.ParamByName('Disciplina').AsInteger := Disciplina;
  end;

  if ckbSomenteAtivos.Checked then begin
    tblFicha.SQL.Add( 'AND FichaIndividual.Situacao NOT IN ( 3,4,5,6,7,8,10 )' );
  end;


  strAux := '';

  for n := 0 to grd.Columns.Count - 1 do
  begin
    if grd.Columns[n].Title.Font.Style = [fsUnderline] then
    begin
      case n of
       	0 : strAux := 'ORDER BY FichaIndividual.CodigoAluno, ';
        	1 : strAux := 'ORDER BY Pessoas.nm_pessoa, ';
        	2 : strAux := 'ORDER BY FichaIndividual.Turma, ';
        	3 : strAux := 'ORDER BY Disciplinas.sigla ';
      else
        	strAux := 'ORDER BY Pessoas.nm_pessoa, ';
      end;
      if n <> 3 then strAux := strAux + 'Disciplinas.Ordem, Disciplinas.sigla  ';
    end;
  end;

  if strAux = '' then strAux := 'ORDER BY Pessoas.nm_pessoa, Disciplinas.Ordem, Disciplinas.Sigla   ';

  if not tblFicha.Active then
  begin

    if Length( strAux ) > 0 then
      tblFicha.SQL.Add(' ' + strAux );

    tblFicha.Open;
  end;

  {if (dm.tblAvaliacaods_sigla.AsString = '') then
  begin
     ckbBloq.Visible := true;
  end
  else
  begin
     ckbBloq.Visible := false;
  end;}

  // Seta as casas decimais da frequencia quando houverem
  if dm.tblAvaliacaonr_casas_decimais_frequencia.AsInteger > 0 then begin
     tblFichafrequencia.DisplayFormat := '##0.'+StringOfChar('0', dm.tblAvaliacaonr_casas_decimais_frequencia.AsInteger);
  end;

  // Terminou de filtrar - agora deve compor as colunas

  AdicionarColuna('codigoaluno',        'Cód.',   50,   clWhite,   taRightJustify);
  AdicionarColuna('nome',               'Nome',   180,  clWhite,   taLeftJustify );
  // AdicionarColuna('turma',              'Turma',  80,   clWhite,   taCenter );
  AdicionarColuna('sigla',              'Sigla',  40,   clWhite,   taCenter );
  AdicionarColuna('descricao',          'Descrição', 180 ,clWhite,   taLeftJustify );

  if (Dm.tblAvaliacaosn_pi.AsString = 'S') then begin
     AdicionarColuna('mediainstitucional', 'P.I.',   32,   $00CAFFFF, taCenter);
  end;

  iEtapa := 1;
  if (DM.tblAvaliacaonr_periodos.AsInteger > 1) AND (mostrar_per) then begin

     iEtapasPorPeriodo := (DM.tblAvaliacaonr_avaliacoes.AsInteger div DM.tblAvaliacaonr_periodos.AsInteger);

  end else begin

     iEtapasPorPeriodo := 999;

  end;

  // Montar as notas / frequencias periodics
  for n := 1 to DM.tblAvaliacao.FieldByName('nr_avaliacoes').AsInteger do begin

     // Alternar entre as cores amarelinha e verdinha
     if CorAux = $00FCF2D8 then begin
        CorAux := $00CAFFFF
     end else begin
        CorAux := $00FCF2D8;
     end;

     LBExibiu := false;

     // Se tiver nota
     if (DM.tblAvaliacaosn_notas.AsString = 'S') OR
        (DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S') then
     begin

        if DM.tblAvaliacaosn_recuperacao.AsString = 'S' then
        begin
           AdicionarColuna('nota' + IntToStr(n), IntToStr(n) + '.' + DM.tblAvaliacaods_periodo_abreviado.AsString, 32, CorAux, taCenter)
        end else begin
           AdicionarColuna('nota_d' + IntToStr(n), IntToStr(n) + '.' + DM.tblAvaliacaods_periodo_abreviado.AsString, 32, CorAux, taCenter);
        end;

         if ckbBloq.Checked then
         begin
            AdicionarColuna('bloq'+ IntToStr(n), 'Blq. N' + IntToStr(n), 38, CorAux, taCenter);
            LBExibiu := true;
         end;

        // Tem recuperação periodica
        if DM.tblAvaliacaosn_recuperacao.AsString = 'S' then begin

           AdicionarColuna('exame' + IntToStr(n), 'Etapa ' + IntToStr(n), 40, CorAux, taCenter);
           AdicionarColuna('nota_d' + IntToStr(n), 'Méd.' + IntToStr(n), 32, CorAux, taCenter);

        end;

        // As faltas sempre serão apresentadas
        AdicionarColuna('falta' + IntToStr(n), 'F ' + IntToStr(n), 32, CorAux, taCenter);

        // Se foi pressionado o CTRL - B
        if ckbBloq.Checked then
           AdicionarColuna(Format('bloq_freq%d', [n]), Format('Blq. F%d', [n]), 38, CorAux, taCenter);

        // Médias Periódicas

        if iEtapasPorPeriodo = n then begin

           if (Pos('recuperacao', LOWERCASE(DM.tblAvaliacaods_formula_periodo.AsString)) > 0) then begin
              AdicionarColuna('nota' + IntToStr(iEtapa + DM.tblAvaliacaonr_avaliacoes.AsInteger), 'Rec.Per.' + IntToStr(iEtapa), 45, $00D0FEC2, taCenter);
           end;

           AdicionarColuna('db_media_periodo'+IntToStr(iEtapa), 'Per.'+IntToStr(iEtapa), 32, $00D0FEC2, taCenter);
           AdicionarColuna('ds_situacao_periodo'+IntToStr(iEtapa), 'Sit.'+IntToStr(iEtapa), 32, $00D0FEC2, taCenter);

           iEtapasPorPeriodo := iEtapasPorPeriodo + (DM.tblAvaliacaonr_avaliacoes.AsInteger div DM.tblAvaliacaonr_periodos.AsInteger);
           INC(iEtapa);

        end;

     end;

     if (not LBExibiu) and ckbBloq.Checked then
        AdicionarColuna('bloq'+ IntToStr(n), 'Blq. N' + IntToStr(n), 38, CorAux, taCenter);



  end;

  // Exame final


  // Implementação específica pro ISPU

  AdicionarColuna('mediaanual', 'MA', 32, $00D0FEC2, taCenter);

  AdicionarColuna('nota10', 'AJUS', 32, $00D0FEC2, taCenter);


  if Dm.tblAvaliacaosn_exame.AsString = 'S' then begin

     AdicionarColuna('notaexame', 'Ex F', 32, $00D0FEC2, taCenter);

  end;

  // Segunda Época
  if DM.tblAvaliacaosn_segunda_epoca.AsString = 'S' then begin

     AdicionarColuna('segunda_epoca', '2ª Ep', 32, $00D0FEC2, taCenter);

  end;

  // Media Final
  if DM.tblAvaliacaosn_notas.AsString = 'S' then begin

     AdicionarColuna('mediafinal', 'Média', 32, $0080FFFF, taCenter );

  end;

  // Conceito
  if (DM.tblAvaliacao.FieldByName('sn_conceitos').AsString = 'S') or ((DM.tblAvaliacaosn_notas.AsString = 'N') and (DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S')) or (pos('ds_media', DM.tblAvaliacao.FieldByName('ds_sigla').AsString) > 0) then begin

     AdicionarColuna('ds_media', 'Conceito', 45, $0080FFFF, taCenter );

  end;

  // Frequencia
  AdicionarColuna('frequencia', 'F. %', 32, clWhite, taCenter);

  // Situacao
  AdicionarColuna('descricaosituacao', 'Sit.', 40, clWhite, taLeftJustify);

  // Observação do Aluno
  AdicionarColuna('observacao', 'Observação',  80,  clWhite,   taLeftJustify );

  // CTRL - B
  if ckbBloq.Checked then begin

     AdicionarColuna('bloqA', 'Blq. MF', 38, clWhite, taCenter);
     AdicionarColuna('bloq_freq_global', 'Blq. FF', 38, clWhite, taCenter);
  end;

   // Verificar a necessidade de Renomear as colunas...
   // Devemos posteriormente melhorar este processo a fim de
   // apresentar nesta planilha somente as colunas que foram selecionadas

   if Trim(DM.tblAvaliacao.FieldByName('ds_sigla').AsString) <> '' then
   begin

      lstColunas := TStringList.Create();

      SplitString(Trim(DM.tblAvaliacao.FieldByName('ds_sigla').AsString), ';', lstColunas);

      for n := 0 to grd.Columns.Count - 1 do
      begin
         if (lstColunas.IndexOfName(grd.Columns.Items[n].FieldName) >= 0) then
         begin
            grd.Columns.Items[n].Title.Caption := lstColunas.Values[grd.Columns.Items[n].FieldName];
         end
         else
         begin
            if (pos('bloq', grd.Columns.Items[n].FieldName) = 0) and
               (pos('bloq_freq', grd.Columns.Items[n].FieldName) = 0) then
            begin
               grd.Columns.Items[n].Visible := False;
            end;
         end;

         if lstColunas.IndexOfName('width_' + grd.Columns.Items[n].FieldName) >= 0 then
         begin
            grd.Columns.Items[n].Width := StrToInt(lstColunas.Values['width_' + grd.Columns.Items[n].FieldName]);
         end;
      end;
   end
   else
   // tira a visibilidade de  determinadas colunas para que as mesmas não venham como padrão
   begin
      for n := 0 to grd.Columns.Count - 1 do
      begin
         if (grd.Columns.Items[n].FieldName = 'descricao') then
         begin
            grd.Columns.Items[n].Visible := false;
         end;
      end;
   end;

   grd.SetFocus;

   Screen.Cursor := crDefault;
end;

procedure TfrmFichaIndividual.grdTitleClick(Column: TColumn);
var
  strAux : String;
  n : Integer;
begin
  strAux := '';

  for n := 0 to Column.Grid.FieldCount - 1 do
    if grd.Columns[n].Title.Font.Style = [fsUnderline] then
      grd.Columns[n].Title.Font.Style := [];

  grd.Columns[Column.Index].Title.Font.Style := [fsUnderline];

  Filtra;
end;

procedure TfrmFichaIndividual.FormCreate(Sender: TObject);
begin
  tblFicha.Close;
  tcFicha.TabIndex := 0;
  lblProfessores.Caption := '';
  if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
  begin
     btnObservacoes.Caption := DM.variavel_parametro('botao_observacoes_nome');
     if Trim(btnObservacoes.Caption) = EmptyStr then
        btnObservacoes.Caption := 'Observações';
  end;
end;

procedure TfrmFichaIndividual.btnAlunoClick(Sender: TObject);
var
   resultado_filtro_pessoa : TResultadoFiltroPessoa;
begin
   popFicha.Items[1].Checked := False;
   popFicha.Items[0].Checked := True;

   resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro_pessoa.filtrado then
   begin
      try
        lngCodigoAluno := resultado_filtro_pessoa.cd_pessoa;
        strFichaTurma :=  resultado_filtro_pessoa.cd_turma;
        intFichaAnoSemestre := resultado_filtro_pessoa.nr_anosemestre;
     except
        ShowMessage('Não foi possível identificar a turma da pessoa que foi selecionada. Repita a busca utilizando a guia Estudante ou Pesquisa Avançada');
     end;
   end
   else Exit;

   Filtra;
end;

procedure TfrmFichaIndividual.btnTurmasClick(Sender: TObject);
begin
   popFicha.Items[1].Checked := True;
   popFicha.Items[0].Checked := False;

   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);
   if not resultado_filtro_turma.filtrado then Exit;

   Filtra;
end;

procedure TfrmFichaIndividual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F8 : btnAlunoClick( nil );
      VK_F9 : btnTurmasClick( nil );
      VK_F12 : btnFecharClick( nil );
   end;
   if ( Shift = [ssCtrl] ) and ( Key =  Ord('C') ) then begin
      AtualizarMedias;
   end;

   if ( Shift = [ssCtrl] ) and ( Key =  Ord('B') ) then begin

       ckbBloq.Checked := not ckbBloq.Checked

   end;

   if ( Shift = [ssCtrl] ) and ( Key =  Ord('P') ) then begin
      mostrar_per := not mostrar_per;
      Filtra;
   end;

end;

procedure TfrmFichaIndividual.AdicionarColuna(campo, titulo: string;
  tamanho: word; cor: TColor; alinhamento: TAlignment);
var
   coluna : TColumn;
begin
   coluna := grd.Columns.Add();
   coluna.FieldName       := campo;
   coluna.Title.Caption   := titulo;
   coluna.Title.Alignment := taCenter;
   coluna.Alignment       := alinhamento;
   coluna.Color           := cor;
   coluna.Width           := tamanho;
end;

procedure TfrmFichaIndividual.AtualizarMedias;
var
  lngAux : Longint;
begin

  try
//  DM.db.StartTransaction;
  tblAtualizar.SQL.Clear;
  tblAtualizar.SQL.Add( 'select * from FichaIndividual order by CodigoAluno' );
  tblAtualizar.Open;
  frmProcessando.Bar.Max := tblAtualizar.RecordCount;
  frmProcessando.Show;
  lngAux := 0;

  while not tblAtualizar.Eof do
  begin

    DM.TotalFaltas( tblAtualizar.FieldByName('CodigoAluno').AsInteger,
                    tblAtualizar.FieldByName('Turma').AsString,
                    tblAtualizar.FieldByName('AnoSemestre').AsInteger);


    Inc( lngAux );
    frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(lngAux) + ' de ' +
                                           IntToStr( frmProcessando.Bar.Max );
    frmProcessando.Bar.Position := lngAux;
    Application.ProcessMessages;
    tblAtualizar.Next;
  end;

//  DM.db.Commit;
  tblAtualizar.Close;
  frmProcessando.Close;
  except
    Mensagem( 'Processo abortado' );
//    DM.db.Rollback;
    Exit;
  end;
  Mensagem( 'Processo efetuado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
end;

procedure TfrmFichaIndividual.dtcFichaDataChange(Sender: TObject;
  Field: TField);
Var
  sProf : String;
begin

//  if popFicha.Items[0].Checked then

  // Apresentar sempre o nome do Professor
  lblProfessores.Caption := tblFichadescricao.AsString;
  sProf := DM.ProfessoresTurma(tblFichaAnoSemestre.AsInteger, tblFichaTurma.AsString, tblFichaDisciplina.AsInteger );

  if Trim(sProf) <> ''  then begin
     lblProfessores.Caption := lblProfessores.Caption + '  /  Professor: ' + sProf;
  end;

  if lngCodigoAlunoAnterior <> tblFichaCodigoAluno.AsInteger then
  begin
    DM.InicializaTabelaMatriculas;
    with DM.tblMatriculas do
    begin
      ParamByName('CodigoAluno').AsInteger := tblFichaCodigoAluno.AsInteger;
      ParamByName('Turma').AsString := tblFichaTurmaMatricula.AsString;
      ParamByName('AnoSemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
      Open;
      lngCodigoAlunoAnterior := tblFichaCodigoAluno.AsInteger;

      if DM.UsaAnosemestre then
         lbl2.Caption := DM.tblMatriculasQualSituacao.AsString + ' - ' + tblFichaAnoSemestre.DisplayText
      else
         lbl2.Caption := DM.tblMatriculasQualSituacao.AsString;
               
      Close;
    end;
  end;
  
  lbl.Caption := 'ALUNO: ' + tblFichaNome.AsString + ' - ' +  tblFichaTurma.AsString;
   btnObservacoes.Marked :=
      TfObservacoes.HasObservations(tblFichaCodigoAluno.AsInteger,
         okMatriculation);
end;

procedure TfrmFichaIndividual.PageControl1Change(Sender: TObject);
begin
   Filtra;
end;


procedure TfrmFichaIndividual.btnObservacoesClick(Sender: TObject);
begin
   if not tblFicha.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblFichaCodigoAluno.AsInteger,
         okMatriculation)
   else
      Mensagem('Selecione um aluno para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure TfrmFichaIndividual.SpeedButton3Click(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 1012, npAcesso, True ) then Exit;

  if (popFicha.Items[1].Checked) then
    if (txtDisciplina.Text = '') and (popFicha.Items[1].Checked) then
    begin
      Mensagem( 'Selecione uma disciplina para o início da digitação.',
                Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
    end;

  Application.CreateForm( TfrmDigFichaIndividual, frmDigFichaIndividual );

  filtra;
end;


procedure TfrmFichaIndividual.txtDisciplinaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    if popFicha.Items[0].Checked then Exit;

    DM.tblDisciplinas.SQL.Clear;
    DM.tblDisciplinas.SQL.Add( 'select * from Disciplinas ' );
    DM.tblDisciplinas.SQL.Add( 'order by Sigla' );
    DM.tblDisciplinas.Open;
    DM.tblDisciplinas.Locate( 'Sigla', txtDisciplina.Text, [loCaseInsensitive] );
    Filtra;
    lblProfessores.Caption := DM.ProfessoresTurma(
      resultado_filtro_turma.nr_anosemestre,
      resultado_filtro_turma.cd_turma, Disciplina );
    Key := #0;
  end;
end;

procedure TfrmFichaIndividual.FormShow(Sender: TObject);
begin
   grd.Columns.Clear();
   tblFicha.Tag := StrToIntDef(DM.Get_Parametro_usuario_valor('pmLogItemExibirZerosFicha', Self.Name), 0);

   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   lblProfessores.Caption := '';
   ckbBloq.Checked := False;
   mostrar_per := True;

   dol_calcular_pi_novo := DM.UsuarioLogado.GetColigadaLogada.GetParametro('dol_calcular_pi_novo') = '1';

   if DM.lite then
   begin
      SpeedButton3.Enabled := DM.GetChavePermissaoLite('1012', 'Academico');
      SpeedButton5.Enabled := DM.GetChavePermissaoLite('1013', 'Academico');
   end;
end;

procedure TfrmFichaIndividual.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

// {$O-}
procedure TfrmFichaIndividual.btnAcertoClick(Sender: TObject);
var
  lngCodigoAluno : Longint;
  strTurma, strCodigoGrade : String;
  intAnoSemestre : Integer;

  frmAcertoFicha: TfrmAcertoFicha;

begin
  if not DM.UsuarioLogado.TemPermissao( 1012, npAcesso, True ) then Exit;
  
  if tblFicha.Eof Then Exit;

  if tblFichaSituacao.AsInteger in [3,4, 6,7,8] then
  begin
    Mensagem( 'Não é possível fazer acerto de notas do aluno devido a situação de matrícula.',
	      Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;
  
  Application.CreateForm(TfrmAcertoFicha,frmAcertoFicha);
  frmAcertoFicha.ShowModal;
  FreeAndNil(frmAcertoFicha);

  lngCodigoAluno := tblFichaCodigoAluno.AsInteger;
  strTurma := tblFichaTurma.AsString;
  intAnoSemestre := tblFichaAnoSemestre.AsInteger;
  strCodigoGrade := tblFichaCodigoGrade.AsString;

  tblFicha.DisableControls;
  tblFicha.Close;
  tblFicha.Open;
  tblFicha.Locate( 'CodigoAluno;Turma;AnoSemestre;CodigoGrade', VarArrayOf( [lngCodigoAluno, strTurma,intAnoSemestre, strCodigoGrade]), [loCaseInsensitive] );
  tblFicha.EnableControls;

end;
// {$O+}


procedure TfrmFichaIndividual.tblFichaAfterClose(DataSet: TDataSet);
begin
  lngCodigoAlunoAnterior := 0;
end;

procedure TfrmFichaIndividual.Button1Click(Sender: TObject);
var
  n : Longint;
begin

  tbl.Close;
  tbl.Open;

  frmProcessando.Bar.Max := tbl.RecordCount;
  frmProcessando.Show;
  Application.ProcessMessages;

  tbl.Close;
  tbl.Open;

  frmProcessando.Bar.Max := tbl.RecordCount;
  frmProcessando.Show;
  Application.ProcessMessages;

  n := 1;
  while not tbl.Eof do
  begin

      DM.TotalFaltas(      tbl.FieldByName('CodigoAluno').AsInteger,
                           tbl.FieldByName('Turma').asString,
                           tbl.FieldByName('AnoSemestre').AsInteger);

      tbl.Next;
      Inc(n);
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(n) + ' de ' +
                                             IntToStr(frmProcessando.Bar.Max);
      frmProcessando.Bar.Position := n;
      Application.ProcessMessages;
  end;

  frmProcessando.Close;

end;

procedure TfrmFichaIndividual.ckbBloqClick(Sender: TObject);
begin
   Filtra;
end;

procedure TfrmFichaIndividual.ckbSomenteAtivosClick(Sender: TObject);
begin
   Filtra();
end;

procedure TfrmFichaIndividual.SpeedButton2Click(Sender: TObject);
begin
  popFicha.Popup( TSpeedButton( Sender ).Left,
                  TSpeedButton( Sender ).Top + 100 );
end;

procedure TfrmFichaIndividual.tblFichaNota1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.AsFloat = -2 then
   begin
      Text := '****'
   end
   else if Sender.AsFloat = -1 then
   begin
      Text := 'DISP'
   end
   else if Sender.AsString = '' then
   begin
      Text := ''
   end
   else if DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         DM.tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      )
   end else begin
      if DM.tblAvaliacao.EOF then
      begin
         Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, 2 )
      end else begin
         Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
      end
   end;
end;

procedure TfrmFichaIndividual.tblFichaNotaExameGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.AsFloat = -2 then
      Text := '****'
   else
      if Sender.AsFloat = -1 then
         Text := 'DISP'
      else
         if Sender.AsFloat = -3 then
            Text := 'FALTOU'
         else
            if tblFichasn_faltou_exame.AsInteger = 1 then
               Text := 'F'
            else
               if Sender.AsString = '' then
                  Text := ''
               else
                  if DM.tblAvaliacao.EOF then
                     Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, 2 )
                  else
                     Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
end;

procedure TfrmFichaIndividual.tblFichaSegunda_EpocaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.AsFloat = -2 then
      Text := '****'
   else
      if Sender.AsFloat = -1 then
         Text := 'DISP'
      else
         if tblFichasn_faltou_2epoca.AsInteger = 1 then
               Text := 'F'
         else
            if Sender.AsString = '' then
               Text := ''
            else
               Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, 2 )            
end;

procedure TfrmFichaIndividual.SpeedButton5Click(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1013, npAcesso, True ) then Exit;

  if not grd.Columns[4].Visible Then
  Begin
       Mensagem(' Este curso não possui nota de prova institucional ',  'Atenção', MB_OK + MB_ICONWARNING);
       Exit;
  End;

  Dm.tblAvaliacao.Close();
  Dm.tblAvaliacao.ParamByName('anosemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
  Dm.tblAvaliacao.ParamByName('turma').AsString := tblFichaTurma.AsString;
  Dm.tblAvaliacao.Open();

  if Dm.tblAvaliacao.Eof then begin

     Mensagem('Não existe parâmetro de avaliação configurado para a turma selecionada. Configure um parametro para poder utilizar esta tela.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;

  end else begin
  
     if DM.tblAvaliacaosn_pi.AsString <> 'S' then begin

       Mensagem('Esta turma não utiliza Prova Interdisciplinar. Para usar essa tela, você deverá configurar o parâmetro de avaliação.', 'Atenção', MB_OK + MB_ICONWARNING);
       Exit;
     end;
  end;

  if grd.Columns[4].Visible Then begin
    Application.CreateForm( TfrmDigProvaInstitucional, frmDigProvaInstitucional );
    frmDigProvaInstitucional.ShowModal;
    tblFicha.DisableControls;
    tblFicha.Close;
    tblFicha.Open;
    tblFicha.EnableControls;
  end;
end;

procedure TfrmFichaIndividual.SpeedButton6Click(Sender: TObject);
var
   lugar : Pointer;
   grupo, grupo_aux : string;
   bCalcularDisciplina : Boolean;
   i : Integer;
   etapas: TStringList;
begin
   if not DM.UsuarioLogado.TemPermissao( 1012, npAcesso, True ) then Exit;

   if tblFicha.IsEmpty Then Exit;

   Dm.qyVerificaNotasLancada.Close;
   Dm.qyVerificaNotasLancada.ParamByName('cd_curso').AsString := tblFichaCurso.AsString;
   Dm.qyVerificaNotasLancada.ParamByName('cd_turma').AsString := tblFichaTurma.AsString;
   Dm.qyVerificaNotasLancada.ParamByName('nr_anosemestre').AsString := tblFichaAnoSemestre.AsString;
   // Se for uma pesquisa por DISCIPLINA e não por ALUNO (pois quando filtra aluno não é filtrado uma disciplina específica)
   if (txtDisciplina.Text <> '') and (not popFicha.Items[0].Checked) then
   begin
      Dm.qyVerificaNotasLancada.ParamByName('cd_disciplina').AsString := tblFichadisciplina.AsString;
   end else begin
      Dm.qyVerificaNotasLancada.ParamByName('cd_disciplina').Clear;
   end;
   Dm.qyVerificaNotasLancada.ParamByName('nr_etapa').Clear;
   Dm.qyVerificaNotasLancada.ParamByName('cd_pessoa').Clear;

   Dm.qyVerificaNotasLancada.Open;

   if (not Dm.qyVerificaNotasLancada.Eof) and (Dm.qyVerificaNotasLancada.FieldByName('retorno').AsInteger > 0) then
   begin
      Mensagem('Todas as informações de notas e frequências devem estar lançadas para permitir o cálculo de médias.', 'Atenção!!', MB_OK, Handle);
      Exit;
   end;
   Dm.qyVerificaNotasLancada.Close;

   Dm.qyValidaQtdAvaliacoes.ParamByName('cd_curso').AsString := tblFichaCurso.AsString;
   Dm.qyValidaQtdAvaliacoes.ParamByName('cd_turma').AsString := tblFichaTurma.AsString;
   Dm.qyValidaQtdAvaliacoes.ParamByName('nr_anosemestre').AsString := tblFichaAnoSemestre.AsString;
   // Se for uma pesquisa por DISCIPLINA e não por ALUNO (pois quando filtra aluno não é filtrado uma disciplina específica)
   if (txtDisciplina.Text <> '') and (not popFicha.Items[0].Checked) then
   begin
      Dm.qyValidaQtdAvaliacoes.ParamByName('cd_disciplina').AsString := tblFichadisciplina.AsString;
   end else begin
      Dm.qyValidaQtdAvaliacoes.ParamByName('cd_disciplina').Clear;
   end;
   Dm.qyValidaQtdAvaliacoes.ParamByName('nr_etapa').Clear;

   Dm.qyValidaQtdAvaliacoes.Close;
   Dm.qyValidaQtdAvaliacoes.Open;
   if (not Dm.qyValidaQtdAvaliacoes.Eof) and (trim(Dm.qyValidaQtdAvaliacoes.FieldByName('mensagem_retorno').AsString) <> '') then
   begin
      Mensagem('Não é possível cálcular a média porque os limites de quantidade mínima e máxima não foram atendidos: '+#13#13+Dm.qyValidaQtdAvaliacoes.FieldByName('mensagem_retorno').AsString, 'Atenção!!', MB_OK, Handle);
      Exit;
   end;
   Dm.qyValidaQtdAvaliacoes.Close;

   {**********************************************************
     Cria o form que irá informar ao usuário qual o universo
     utilizado para realizar o cálculo de média, sendo:
     - estudante Tiago Piske na turma de matrícula BCC21
     - disciplina de Banco de Dados da turma BCC21
     - todas as disciplinas da turma BCC21
     Também para solicitar em quais etapas (1 - 10) o cálculo
     de média será aplicado nesse universo.
   ***********************************************************}

   // Cria o formulário para recálculo de média
   Application.CreateForm(TfrmFichaIndividualRecalculoMedia,frmFichaIndividualRecalculoMedia);

   // Seta os atributos da classe para realizar o cálculo de média
   frmFichaIndividualRecalculoMedia.setAnosemestre(tblFichaAnoSemestre.AsInteger);
   frmFichaIndividualRecalculoMedia.setTurmaMatricula(tblFichaTurmaMatricula.AsString);

   if popFicha.Items[0].Checked then
   begin
      // Se for uma pesquisa por ALUNO
      frmFichaIndividualRecalculoMedia.setMensagemUniverso('estudante ' + tblFichaNome.AsString + ' na turma de matrícula ' + tblFichaTurmaMatricula.AsString);
   end else if txtDisciplina.Text <> '' then
   begin
      // Se for uma pesquisa por DISCIPLINA
      frmFichaIndividualRecalculoMedia.setMensagemUniverso('disciplina de ' + tblFichadescricao.AsString + ' da turma ' + tblFichaTurma.AsString);
   end else begin
      // Considera como cálculo para todas as disciplinas da turma
      frmFichaIndividualRecalculoMedia.setMensagemUniverso('todas as disciplinas da turma ' + tblFichaTurma.AsString);
   end;


   // Abre o forma para verificar quais etapas o usuário quer cálcular a média
   frmFichaIndividualRecalculoMedia.ShowModal;

   // Se o usuário CANCELOU a operação não faz NADA
   if not frmFichaIndividualRecalculoMedia.getCalcularMedia() then
   begin
      Exit;
   end;

   // Retorna quais as etapas que o usuário deseja cálcular a média
   etapas := frmFichaIndividualRecalculoMedia.getEtapas();
   

   lugar := tblFicha.GetBookmark;

   if tblFicha.RecordCount > 0 then frmProcessando.Bar.Max := tblFicha.RecordCount;

   frmProcessando.Show;
   Application.ProcessMessages;

   { Faça do primeiro aluno até o último }
   tblFicha.First;
   frmProcessando.Bar.Position := 1;

   grupo := '-----';

   // Verifica se alguma etapa foi selecionada, nesse caso calcular da media da DISCIPLINA
   bCalcularDisciplina := (etapas.Count > 0);

   while not tblFicha.EOF do
   begin
      if Pos(',', tblFichacd_grupo.AsString) > 0 then
      begin
         Mensagem(
            'O aluno ' +
            tblFichaNome.AsString +
            ' na disciplina ' +
            tblFichadescricao.AsString +
            ' está ativo em mais de um grupo (' +
            tblFichacd_grupo.AsString +
            '). Por favor verifique qual o grupo correto e remova o grupo incorreto para poder prosseguir com o cálculo de média desse aluno.',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );

         tblFicha.Next;
         continue;
      end;

      grupo_aux := tblFichaTurma.AsString + tblFichaAnoSemestre.AsString + tblFichaCodigoAluno.AsString;

      if bCalcularDisciplina then grupo_aux := grupo_aux + tblFichadisciplina.AsString;

      { Controle para não cálcular a média para um mesmo aluno duas vezes }
      if grupo <> grupo_aux then
      begin
         if bCalcularDisciplina then
         begin
            // Varre as etapas selecionadas
            for i := 0 to etapas.Count-1 do
            begin
               DM.CalcularMediaAutomaticamente(
                  tblFichaAnoSemestre.AsInteger, tblFichaTurma.AsString,
                  tblFichadisciplina.AsInteger, StrToInt(etapas[i]), tblFichacd_grupo.AsInteger,
                  tblFichaCodigoAluno.AsInteger, True
               );
            end;
         end
         else
         begin
            DM.CalcularMediaFinal(
               tblFichaCodigoAluno.AsInteger, tblFichaAnoSemestre.AsInteger, tblFichacd_grupo.AsInteger,
               tblFichaTurma.AsString, tblFichaTurmaMatricula.AsString
            );
         end;
         
         DM.Gerar_Series_Conclusao(tblFichaCodigoAluno.AsInteger, tblFichaCurso.AsString, tblFichaAnoSemestre.AsInteger, tblFichaTurma.AsString);

         grupo := grupo_aux;
      end;

      frmProcessando.Bar.Position := frmProcessando.Bar.Position + 1;
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(frmProcessando.Bar.Position) + ' de ' +
                     IntToStr(frmProcessando.Bar.Max+1) + ' - ' + tblFichaCodigoAluno.AsString;
      Application.ProcessMessages;
      tblFicha.Next;
   end;
   frmProcessando.Close;

   tblFicha.GotoBookmark(lugar);
   tblFicha.EnableControls;
   tblFicha.Close;
   tblFicha.Open;
   tblFicha.GotoBookmark(lugar);
end;

procedure TfrmFichaIndividual.tblFichaAfterPost(DataSet: TDataSet);
begin
   DM.tblAvaliacao.Close;
   DM.tblAvaliacao.ParamByName('turma').AsString := tblFichaTurma.AsString;
   DM.tblAvaliacao.ParamByName('anosemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
   DM.tblAvaliacao.Open;
end;

procedure TfrmFichaIndividual.tblFichaFalta1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.IsNull OR
      ((tblFicha.Tag <> 1) AND (Sender.AsFloat = 0)) then
   begin
      Text := ''
   end else begin
      Text := FloatToStr(Sender.AsFloat);
   end;
end;

procedure TfrmFichaIndividual.btnCodigoDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   if btnCodigoDisciplina.Down then
   begin
      if ( tblFicha.State = dsInactive ) OR ( tblFicha.RecordCount = 0 ) then
      begin
         resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], '');
      end else begin
         resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], tblFichaCurso.AsString,
            tblFichaAnoSemestre.AsInteger, tblFichaTurma.AsString);
      end;

      if resultado_filtro.filtrado then
      begin
         txtDisciplina.Text := resultado_filtro.ds_sigla;
         Disciplina := resultado_filtro.cd_disciplina;
      end;
   end else begin
      txtDisciplina.Text := '';
      Disciplina := 0;
   end;

   Filtra;
end;

procedure TfrmFichaIndividual.tblFichaexame1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.AsFloat = -2 then
      Text := '****'
   else
      if Sender.AsFloat = -1 then
         Text := 'DISP'
      else
         if Sender.AsString = '' then
            Text := ''
         else
            Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
end;

procedure TfrmFichaIndividual.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblFicha, pmQtd);

end;

procedure TfrmFichaIndividual.pmLogItemExibirZerosFichaClick(Sender: TObject);
begin
   TMenuItem(Sender).Checked := NOT(TMenuItem(Sender).Checked);
   DM.Set_Parametro_usuario(TMenuItem(Sender), Self.Name);

   tblFicha.Close();
   if TMenuItem(Sender).Checked then
   begin
      tblFicha.Tag := 1;
   end else begin
      tblFicha.Tag := 0;
   end;
   tblFicha.Open();
end;

procedure TfrmFichaIndividual.pmLogPopup(Sender: TObject);
var
  Item: TMenuItem;
  chaves : string;

  qyGetLog : TUMZReadOnlyQuery;
begin
   pmLog.Items.Clear;
   Item := TMenuItem.Create(self);

   chaves := tblFicha.FieldByName('codigoaluno').AsString + ';' +
             tblFicha.FieldByName('anosemestre').AsString + ';' +
             tblFicha.FieldByName('turma').AsString + ';' +
             tblFicha.FieldByName('disciplina').AsString + ';';

   DM.CriarConsulta(qyGetLog);

   qyGetLog.SQL.Clear();
   qyGetLog.SQL.Add('SELECT l.ds_log, l.dt_log, p.ds_login');
   qyGetLog.SQL.Add('FROM logs l');
   qyGetLog.SQL.Add('     LEFT JOIN pessoas p ON (p.cd_pessoa = l.cd_usuario)');
   qyGetLog.SQL.Add('WHERE l.cd_tipo = 9 AND l.cd_chave LIKE :cd_chave');
   qyGetLog.SQL.Add('ORDER by l.dt_log ');
   qyGetLog.ParamByName('cd_chave').AsString := '%'+chaves+'%';
   qyGetLog.Open;

   if qyGetLog.EOF then
   begin
      Item.Caption := 'Nenhuma alteração foi registrada';
      pmLog.Items.Add(Item);
   end else begin
      Item.Caption := 'Alterações registradas: ';
      pmLog.Items.Add(Item);
      Item := TMenuItem.Create(self);
      Item.Caption := '-';
      pmLog.Items.Add(Item);
   end;

   while not qyGetLog.EOF do
   begin
      Item := TMenuItem.Create(self);
      Item.Caption := FormatDateTime('dd/mm/yyyy hh:MM',qyGetLog.FieldByName('dt_log').AsDateTime) + ' - ' + qyGetLog.FieldByName('ds_login').AsString + ':  ' + ReplaceStr( qyGetLog.FieldByName('ds_log').AsSTring , chr(13) , ' | ' );

      pmLog.Items.Add(Item);
      qyGetLog.Next;
   end;

   FreeAndNil(qyGetLog);

   Item := TMenuItem.Create(Self);
   Item.Caption := '-';
   pmLog.Items.Add(Item);

   Item := TMenuItem.Create(Self);
   Item.Caption := 'Exibir faltas com valor 0 (zero)';
   Item.Name := 'pmLogItemExibirZerosFicha';
   DM.Get_Parametro_usuario(Item, Self.Name);
   Item.OnClick := pmLogItemExibirZerosFichaClick;
   pmLog.Items.Add(Item);
end;

procedure TfrmFichaIndividual.RecalcularMediaCurso;
begin
   // Recalcular a média do curso, com o atalho CTRL SHIFT M

   if not DM.UsuarioLogado.TemPermissao( 1012, npAcesso, True ) then Exit;

   {**********************************************************
     Cria o form que irá informar ao usuário qual o universo
     utilizado para realizar o cálculo de média, sendo nesse caso SEMPRE:
     - Todos os alunos do curso ADM21 de 20141
   ***********************************************************}

   // Cria o formulário para recálculo de média
   Application.CreateForm(TfrmFichaIndividualRecalculoMedia,frmFichaIndividualRecalculoMedia);

   // Seta o universo que será cálculada a média
   frmFichaIndividualRecalculoMedia.setMensagemUniverso('todos os estudantes do curso de ' + tblFichaCurso.AsString + ' de ' + tblFichaAnoSemestre.AsString);

   // Abre o forma para verificar quais etapas o usuário quer cálcular a média
   frmFichaIndividualRecalculoMedia.ShowModal;

   // Se o usuário CANCELOU a operação não faz NADA
   if not frmFichaIndividualRecalculoMedia.getCalcularMedia() then
   begin
      Exit;
   end;

   if tblFicha.IsEmpty Then Exit;

   DM.qyAux2.Close();
   DM.qyAux2.SQL.Clear();
   DM.qyAux2.SQL.Text :=
     ' SELECT DISTINCT codigoaluno, turma, curso, anosemestre, turmamatricula, COALESCE(dg.cd_grupo, 0) cd_grupo ' +
     ' FROM FichaIndividual ' +
     ' LEFT JOIN diario_grupos_pessoas dgp ON ( '+
	  '	dgp.cd_pessoa = fichaindividual.codigoaluno AND '+
	  '	dgp.dt_saida IS NULL '+
	  ' ) '+
     ' LEFT JOIN diario_grupos dg ON ( '+
	  '	dg.nr_anosemestre = fichaindividual.anosemestre AND '+
	  '	dg.cd_curso = fichaindividual.curso AND '+
	  '	dg.cd_turma = fichaindividual.turma AND '+
	  '	dg.cd_disciplina = fichaindividual.disciplina AND '+
	  '	dg.cd_grupo = dgp.cd_grupo '+
	  ' ) '+
     ' WHERE anosemestre = :anosemestre AND curso = :curso ' +
     ' ORDER By anosemestre, turma, codigoaluno ';
   Dm.qyAux2.ParamByName('anosemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
   Dm.qyAux2.ParamByName('curso').AsString := tblFichaCurso.AsString;
   Dm.qyAux2.Open();

   tblFicha.DisableControls;

   if DM.qyAux2.RecordCount > 0 then
     frmProcessando.Bar.Max := DM.qyAux2.RecordCount;

   frmProcessando.Show;
   Application.ProcessMessages;


  { Faça do primeiro aluno até o último }
   DM.qyAux2.First;
   frmProcessando.Bar.Position := 1;

   while not DM.qyAux2.EOF do
   begin
      { Calcular a média Final, individualmente por aluno }
           DM.TotalFaltas( DM.qyAux2.FieldByNAme('CodigoAluno').AsInteger,
                           DM.qyAux2.FieldByNAme('Turma').AsString,
                           DM.qyAux2.FieldByNAme('AnoSemestre').AsInteger);

           { OLIVER - CALCULO_MEDIA - OK - }
          Dm.CalcularMediaFinal(
            DM.qyAux2.FieldByNAme('CodigoAluno').AsInteger,
            DM.qyAux2.FieldByNAme('AnoSemestre').AsInteger,
            DM.qyAux2.FieldByNAme('cd_grupo').AsInteger,
            DM.qyAux2.FieldByNAme('Turma').AsString,
            DM.qyAux2.FieldByNAme('turmamatricula').AsString
          );

          DM.Gerar_Series_Conclusao(DM.qyAux2.FieldByNAme('CodigoAluno').AsInteger, DM.qyAux2.FieldByNAme('Curso').AsString, DM.qyAux2.FieldByNAme('AnoSemestre').AsInteger);                             

      frmProcessando.Bar.Position := frmProcessando.Bar.Position + 1;
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(frmProcessando.Bar.Position) + ' de ' +
                     IntToStr(frmProcessando.Bar.Max+1) + ' - ' + DM.qyAux2.FieldByNAme('CodigoAluno').AsString + ' - ' + DM.qyAux2.FieldByNAme('Turma').AsString;
      Application.ProcessMessages;
      DM.qyAux2.Next;
  end;
  frmProcessando.Close;

  tblFicha.EnableControls;
  frmProcessando.Close;

  tblFicha.Close;
  tblFicha.Open;

end;

procedure TfrmFichaIndividual.grdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if Copy(Column.FieldName, 1, 19) = 'ds_situacao_periodo' then begin
      if tblFicha.FieldByName('cd_situacao_periodo'+trim(Copy(Column.FieldName, 20, 2))).AsInteger = 1 then begin
         grd.Canvas.Font.Color:= clBlue;
      end
      else begin
         grd.Canvas.Font.Color:= clRed;
      end;
   end;

   grd.DefaultDrawDataCell(Rect, grd.columns[datacol].field, State);
end;

procedure TfrmFichaIndividual.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = Ord('C')) AND (Shift = [ssCtrl, ssShift])
   then
      RecalcularMediaCurso;
   if (key = Ord('A')) AND (Shift = [ssCtrl, ssShift])
   then
      RecalcularMediaDepto;

end;

procedure TfrmFichaIndividual.RecalcularMediaDepto;
var
   etapas : TStringList;
begin
   // Recalcular a média do curso, com o atalho CTRL SHIFT M

   if not DM.UsuarioLogado.TemPermissao( 1012, npAcesso, True ) then Exit;


   {**********************************************************
     Cria o form que irá informar ao usuário qual o universo
     utilizado para realizar o cálculo de média, sendo nesse caso SEMPRE:
     - Todos os estudantes de 20141
   ***********************************************************}

   // Cria o formulário para recálculo de média
   Application.CreateForm(TfrmFichaIndividualRecalculoMedia,frmFichaIndividualRecalculoMedia);

   // Seta o universo que será cálculada a média
   frmFichaIndividualRecalculoMedia.setMensagemUniverso('todos os estudantes de ' + tblFichaAnoSemestre.AsString);

   // Abre o forma para verificar quais etapas o usuário quer cálcular a média
   frmFichaIndividualRecalculoMedia.ShowModal;

   // Se o usuário CANCELOU a operação não faz NADA
   if not frmFichaIndividualRecalculoMedia.getCalcularMedia() then
   begin
      Exit;
   end;

   if tblFicha.IsEmpty Then Exit;

   DM.qyAux2.Close();
   DM.qyAux2.SQL.Clear();
   DM.qyAux2.SQL.Text :=
     ' SELECT DISTINCT codigoaluno, curso, turma, anosemestre, turmamatricula, COALESCE(dg.cd_grupo, 0) cd_grupo ' +
     ' FROM FichaIndividual ' +
     ' LEFT JOIN diario_grupos_pessoas dgp ON ( '+
	  '	dgp.cd_pessoa = fichaindividual.codigoaluno AND '+
	  '	dgp.dt_saida IS NULL '+
	  ' ) '+
     ' LEFT JOIN diario_grupos dg ON ( '+
	  '	dg.nr_anosemestre = fichaindividual.anosemestre AND '+
	  '	dg.cd_curso = fichaindividual.curso AND '+
	  '	dg.cd_turma = fichaindividual.turma AND '+
	  '	dg.cd_disciplina = fichaindividual.disciplina AND '+
	  '	dg.cd_grupo = dgp.cd_grupo '+
	  ' ) '+
     ' WHERE anosemestre = :anosemestre AND turma <> "HISTORICO" ' +
     ' ORDER By anosemestre, turma, codigoaluno ';
   Dm.qyAux2.ParamByName('anosemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
   Dm.qyAux2.Open();

   tblFicha.DisableControls;

   if DM.qyAux2.RecordCount > 0 then
     frmProcessando.Bar.Max := DM.qyAux2.RecordCount;

   frmProcessando.Show;
   Application.ProcessMessages;


  { Faça do primeiro aluno até o último }
   DM.qyAux2.First;
   frmProcessando.Bar.Position := 1;

   while not DM.qyAux2.EOF do
   begin
      { Calcular a média Final, individualmente por aluno }
           DM.TotalFaltas( DM.qyAux2.FieldByNAme('CodigoAluno').AsInteger,
                           DM.qyAux2.FieldByNAme('Turma').AsString,
                           DM.qyAux2.FieldByNAme('AnoSemestre').AsInteger);

           { OLIVER - CALCULO_MEDIA - OK - }
          Dm.CalcularMediaFinal(
            DM.qyAux2.FieldByNAme('CodigoAluno').AsInteger,
            DM.qyAux2.FieldByNAme('AnoSemestre').AsInteger,
            DM.qyAux2.FieldByNAme('cd_grupo').AsInteger,
            DM.qyAux2.FieldByNAme('Turma').AsString,
            DM.qyAux2.FieldByNAme('turmamatricula').AsString
          );

//          DM.Gerar_Series_Conclusao(DM.qyAux2.FieldByNAme('CodigoAluno').AsInteger, DM.qyAux2.FieldByNAme('Curso').AsString, DM.qyAux2.FieldByNAme('AnoSemestre').AsInteger);

      frmProcessando.Bar.Position := frmProcessando.Bar.Position + 1;
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(frmProcessando.Bar.Position) + ' de ' +
                     IntToStr(frmProcessando.Bar.Max+1) + ' - ' + DM.qyAux2.FieldByNAme('CodigoAluno').AsString + ' - ' + DM.qyAux2.FieldByNAme('Turma').AsString;
      Application.ProcessMessages;
      DM.qyAux2.Next;
  end;
  frmProcessando.Close;

  tblFicha.EnableControls;
  frmProcessando.Close;

  tblFicha.Close;
  tblFicha.Open;

end;

end.

