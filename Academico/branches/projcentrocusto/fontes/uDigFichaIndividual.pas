unit uDigFichaIndividual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Db, ZConnection, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, Menus, Variants, uDMDiario;

type
  TfrmDigFichaIndividual = class(TForm)
    Panel3: TPanel;
    tblFicha: TUMZQuery;
    tblFichaCodigoAluno: TIntegerField;
    tblFichaNome: TStringField;
    dtcFicha: TDataSource;
    tblFichaAnoSemestre: TSmallintField;
    tblFichaTurma: TStringField;
    tblFichaCurso: TStringField;
    tblFichaNota1: TFloatField;
    tblFichaExame1: TFloatField;
    tblFichaNota2: TFloatField;
    tblFichaExame2: TFloatField;
    tblFichaNota3: TFloatField;
    tblFichaExame3: TFloatField;
    tblFichaNota4: TFloatField;
    tblFichaExame4: TFloatField;
    tblFichaNotaExame: TFloatField;
    tblFichaSituacao: TSmallintField;
    tblFichaSigla: TStringField;
    tblFichaDescricaoSituacao: TStringField;
    tblFichaM1: TStringField;
    tblFichaM2: TStringField;
    tblFichaM3: TStringField;
    tblFichaM4: TStringField;
    tblFichaEmExame: TBooleanField;
    tblFichaExF: TStringField;
    tblFichaField2EP: TStringField;
    tblFichaF1: TStringField;
    tblFichaF2: TStringField;
    tblFichaF3: TStringField;
    tblFichaF4: TStringField;
    tblFichaCodigoGrade: TStringField;
    tblFichaDS_Disciplinas: TStringField;
    tblFichaGrau: TSmallintField;
    tblFichaSerie: TSmallintField;
    tblFichaNota5: TFloatField;
    tblFichaExame5: TFloatField;
    tblFichaNota6: TFloatField;
    tblFichaExame6: TFloatField;
    tblFichaNota7: TFloatField;
    tblFichaExame7: TFloatField;
    tblFichaNota8: TFloatField;
    tblFichaExame8: TFloatField;
    tblFichaNota9: TFloatField;
    tblFichaExame9: TFloatField;
    tblFichaNota10: TFloatField;
    tblFichaExame10: TFloatField;
    tblFichaMediaFinal: TFloatField;
    tblFichaUsuario: TIntegerField;
    tblFichaCodigoEscola: TSmallintField;
    tblFichaMediaAnual: TFloatField;
    tblFichaTurmaMatricula: TStringField;
    tblFichaM5: TStringField;
    tblFichaM6: TStringField;
    tblFichaM7: TStringField;
    tblFichaM8: TStringField;
    tblFichaM9: TStringField;
    tblFichaM10: TStringField;
    tblFichaF5: TStringField;
    tblFichaF6: TStringField;
    tblFichaF7: TStringField;
    tblFichaF8: TStringField;
    tblFichaF9: TStringField;
    tblFichaF10: TStringField;
    Bevel4: TBevel;
    tblFichaArrumarDiario: TStringField;
    tblFichaAproveitamento: TStringField;
    tblFichaSegunda_Epoca: TFloatField;
    pmQtd: TPopupMenu;
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
    tblFichafrequencia: TFloatField;
    tblFichanr_aluno: TSmallintField;
    tblFichads_media: TStringField;
    tblFichadisciplina: TIntegerField;
    tblFichacd_grade: TLargeintField;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    btnDisciplina: TSpeedButton;
    Label9: TLabel;
    Label4: TLabel;
    btnTurmas: TSpeedButton;
    lblCodigoAluno: TLabel;
    SpeedButton2: TSpeedButton;
    txtBimestre: TMaskEdit;
    UpDown1: TUpDown;
    txtDisciplina: TEdit;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    radOpcoes: TRadioGroup;
    txtTurma: TEdit;
    txtCodigoAluno: TEdit;
    grd: TDBGrid;
    Panel4: TPanel;
    Bevel1: TBevel;
    Label8: TLabel;
    lblProfessores: TLabel;
    Label3: TLabel;
    DBText2: TDBText;
    popTurmas: TPopupMenu;
    Panel5: TPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    dbeCodigo: TDBEdit;
    lblM1: TLabel;
    dbeN1: TDBEdit;
    lblF1: TLabel;
    dbeF1: TDBEdit;
    lblM1Info: TLabel;
    btnFechar: TSpeedButton;
    tblFichasn_bloq_freq1: TIntegerField;
    tblFichasn_bloq_freq2: TIntegerField;
    tblFichasn_bloq_freq3: TIntegerField;
    tblFichasn_bloq_freq4: TIntegerField;
    tblFichasn_bloq_freq5: TIntegerField;
    tblFichasn_bloq_freq6: TIntegerField;
    tblFichasn_bloq_freq7: TIntegerField;
    tblFichasn_bloq_freq8: TIntegerField;
    tblFichasn_bloq_freq9: TIntegerField;
    tblFichasn_bloq_freq10: TIntegerField;
    tblFichasn_bloqueio_ds_media: TIntegerField;
    procedure dbeN1Enter(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure dbeCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure dtcFichaDataChange(Sender: TObject; Field: TField);
    procedure btnDisciplinaClick(Sender: TObject);
    procedure Filtra;
    procedure dbeE1KeyPress(Sender: TObject; var Key: Char);
    procedure grdCellClick(Column: TColumn);
    procedure NotasBimestrais;
    procedure ExamesBimestrais;
    procedure ExameFinal;
    procedure Conceito;
    procedure SegundaEpoca;
    procedure SalvaRegistro;
    procedure dbeN1KeyPress(Sender: TObject; var Key: Char);
    procedure radOpcoesClick(Sender: TObject);
    procedure dbeF1KeyPress(Sender: TObject; var Key: Char);
    procedure tblFichaCalcFields(DataSet: TDataSet);
    procedure btnTurmasClick(Sender: TObject);
    procedure txtDisciplinaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure txtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure dbeF1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeN1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function FindValue(const aString1, aString2:TStringList; aValue1, aValue2:String):Boolean;
    procedure ProcessarNotas;
    procedure SpeedButton2Click(Sender: TObject);
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure MyClick(Sender:TObject);
    procedure txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure txtAnoSemestreExit(Sender: TObject);
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure txtBimestreExit(Sender: TObject);
    procedure tblFichaNota1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblFichaExame1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblFichaFalta1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure pmQtdPopup(Sender: TObject);
  private
    intAnoSemestre : Integer;
    intQtdadeBimestres : Integer;
    intDisciplina : Integer;
    sCodigoAluno, sTurma : TStringList; sCodigoGrade: TStringList;
    lngCodigoAluno: Longint;

    procedure OnSaveConceito(Sender: TDBEdit; value: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDigFichaIndividual: TfrmDigFichaIndividual;
  
  nota : ARRAY [1..10] of Double;
  notad : ARRAY [1..10] of Double;
  falta : ARRAY [1..10] of Double;
  exame : ARRAY [1..10] of Double;
  Notaexame, mediaFinal, segunda_Epoca, frequencia : Double;
  

implementation

uses uDM, uFichaIndividual, uFSelecionarTurma, Main, uProcessando,
  uFSelecionarPessoa, uFSelecionarDisciplina, uFSelecionarCurso, uAvaliacoesConceitos;

{$R *.DFM}

procedure TfrmDigFichaIndividual.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDigFichaIndividual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  { Ao Fechar o Formulário - //rotina para processar notas digitadas; }

  if sCodigoAluno.Count > 0 then ProcessarNotas;

  sCodigoAluno.Free;
  sTurma.Free;
  sCodigoGrade.Free;

  if DM.tblFichaIndividual.State in dsEditModes then DM.tblFichaIndividual.Cancel;
  Action := caFree;

end;

procedure TfrmDigFichaIndividual.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  { Atalho para Fechar }

  case Key of
    VK_F12 : btnFecharClick(nil);
  end;
  
end;

procedure TfrmDigFichaIndividual.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  Label9.Visible := DM.UsaAnosemestre;
  txtAnoSemestre.Visible := DM.UsaAnosemestre;
  UpDown2.Visible := DM.UsaAnosemestre;

  DM.TodasMaiusculas(TForm(Sender));

  sCodigoAluno := TStringList.Create;
  sTurma := TStringList.Create;
  sCodigoGrade := TStringList.Create;


  if txtAnoSemestre.Text = '' then
  begin
      txtAnoSemestre.text := IntToStr(ano_semestre);
  end;


  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

  lblProfessores.Caption := '';

  DM.tblFichaIndividual.SQL.Clear;

  NotasBimestrais;

  Filtra;
end;

procedure TfrmDigFichaIndividual.Filtra;
begin

  if (txtTurma.Text = '') then Exit;

  tblFicha.Close();
  tblFicha.SQL.Clear();
  tblFicha.SQL.Text :=
   ' SELECT                                                                    ' +
   '    m.nr_aluno, f.disciplina, f.*, p.nm_pessoa as nome,                    ' +
   '    d.sigla, d.descricao As ds_disciplinas,                                ' +
   '    gd.CD_GRADE,                                                           ' +
   '    gd.CD_CURSO,                                                           ' +
   '    gd.CD_DISCIPLINA,                                                      ' +
   '    gd.NR_SERIE                                                            ' +
   ' FROM                                                                      ' +
   '   pessoas p INNER JOIN fichaIndividual f ON (p.cd_pessoa = f.codigoaluno) '+
   '   INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) '+
   '   INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) '+
   '   INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina AND gd.NR_SERIE = t.serie) '+
   '   INNER JOIN matriculas m ON (f.codigoaluno = m.codigoaluno) AND (f.turmamatricula = m.turma) AND (f.anosemestre = m.anosemestre) '+
   '   INNER JOIN disciplinas d ON (f.Curso = d.Curso) AND (f.disciplina = d.codigo) ' +
   ' WHERE                                                                           ' +
   '   f.anosemestre = :AnoSemestre and                                              ' ;

  if (txtDisciplina.Text <> '') then
    tblFicha.SQL.Add( ' d.codigo = :CodDisciplina and ' );

  if (txtCodigoAluno.Text <> '') then
    tblFicha.SQL.Add( ' f.codigoaluno = :CodigoAluno and ' );

  tblFicha.SQL.Add( ' (NOT ( f.Situacao IN ( 3, 4, 5, 6, 7, 8 ) ) )  and ' );

  tblFicha.SQL.Add( ' f.turma = :Turma' );

  tblFicha.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  tblFicha.ParamByName('Turma').AsString := txtTurma.Text;

  // Atualiza anosemestre selecionado
  intAnoSemestre := StrToInt(txtAnoSemestre.Text);  

  if (txtDisciplina.Text <> '') then
    tblFicha.ParamByName('CodDisciplina').AsInteger := intDisciplina;

  if (txtCodigoAluno.Text <> '') then
    tblFicha.ParamByName('CodigoAluno').AsInteger := StrToInt(txtCodigoAluno.Text);

  if radOpcoes.ItemIndex in [2,3] then
  begin
    tblFicha.SQL.Add( 'and' );
    if radOpcoes.ItemIndex = 2 then
      tblFicha.SQL.Add( '( f.situacao = 2 or (not IsNull(f.notaexame)))' )
    else
      tblFicha.SQL.Add( '( f.Situacao = 11 or (not IsNull(f.segunda_epoca)))' );
  end;

  if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
    tblFicha.SQL.Add( 'order by m.nr_aluno, p.nm_pessoa, d.ordem' );
    grd.Columns[0].Visible := True;
  end
  else begin
    tblFicha.SQL.Add( 'order by p.nm_pessoa, d.ordem' );
    grd.Columns[0].Visible := False;
  end;

  tblFicha.Open;

  DM.tblAvaliacao.Close;
  DM.tblAvaliacao.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  DM.tblAvaliacao.ParamByName('Turma').AsString := txtTurma.Text;
  DM.tblAvaliacao.Open;

  radOpcoes.Items.Strings[0] := 'Media ' + DM.tblAvaliacaods_periodicidade.AsString;
  radOpcoes.Items.Strings[1] := 'Exame ' + DM.tblAvaliacaods_periodicidade.AsString;

  if (DM.tblAvaliacaosn_conceitos.AsString = 'S') AND (Dm.tblAvaliacaosn_notas.AsString <> 'S') then
  begin
     radOpcoes.ItemIndex:= 4;
  end;
                       
  intQtdadeBimestres := DM.tblAvaliacaonr_avaliacoes.AsInteger;
//  DM.tblAvaliacao.Close;
  dbeCodigo.SetFocus;

end;


procedure TfrmDigFichaIndividual.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
var
  intBimestre : Integer;
begin

  intBimestre := StrToInt(txtBimestre.Text);

  if Button = btNext then
  begin
//    if intBimestre >= intQtdadeBimestres  Then
//    Begin
//       intBimestre := intQtdadeBimestres;
//       Exit
//    End
//    Else
       Inc( intBimestre );
  end
  else
  begin
    if intBimestre <= 1 then
    Begin
       intBimestre := 1;
       Exit;
    End
    Else
       Dec( intBimestre );
  end;

  txtBimestre.Text := FillString(IntToStr( intBimestre ), alRight, '0', 2, true);

  case radOpcoes.ItemIndex of
    0 : NotasBimestrais;
    1 : ExamesBimestrais;
    2 : ExameFinal;
    3 : SegundaEpoca;
    4 :
  end;
  
  Filtra;
  
  dbeCodigo.SetFocus;
end;

procedure TfrmDigFichaIndividual.NotasBimestrais;
var
  intBimestre : Integer;
  n : Integer;
begin
  { Atualizar os campos quando clicar sobre Digitação de Médias }

        intBimestre := StrToInt(txtBimestre.Text);

        dbeN1.DataField := 'Nota' + IntToStr(intBimestre);
        dbeF1.DataField := 'Falta' + IntToStr(intBimestre);

        lblM1.Caption := 'Nota: ' + DM.tblAvaliacaods_periodo_abreviado.AsString + ' ' + IntToStr(intBimestre);
        lblF1.Caption := 'Falta: ' + IntToStr(intBimestre);

        for n := 0 to ComponentCount - 1 do
        begin
          if (Components[n] is TField) then
          begin
            if TField(Components[n]).Tag = 1 then
              TField(Components[n]).Visible := False;
          end;
        end;

        grd.Columns[5].FieldName := 'Nota' + IntToStr(intBimestre);
        grd.Columns[5].Title.Caption := DM.tblAvaliacaods_periodo_abreviado.AsString + ' ' + IntToStr(intBimestre);
        grd.Columns[6].FieldName := 'Falta' + IntToStr(intBimestre);
        grd.Columns[7].FieldName := '';

        dbeN1.Enabled := True;
        dbeN1.Visible := True;
        dbeF1.Enabled := True;
        lblF1.Enabled := True;

end;

procedure TfrmDigFichaIndividual.OnSaveConceito(Sender: TDBEdit; value: String);
var
   modificado: boolean;
   nota: double;
begin
   Sender.Field.DataSet.Edit();
   modificado := True;
   if Sender.Field.FieldName = 'ds_media' then
   begin
      if value = dbeN1.Field.AsString then
      begin
         modificado := False;
      end else begin
         DM.tblFichaIndividualsn_bloqueio_ds_media.AsInteger := 1;
      end;
      dbeN1.Field.AsString := value;
      DM.tblFichaIndividual.Post;
      Filtra;      
   end else begin
      if value <> '' then
      begin
         nota := TAvaliacoesConceitos.GetInstancia().GetNotaFromConceito(DM.tblAvaliacaocd_avaliacao.AsInteger, value);
      end;

      if dbeN1.Field.AsString = FloatToStr(nota) then
      begin
         modificado := False;
      end else if value = '' then
      begin
         DM.tblFichaIndividual.FieldByName(dbeN1.DataField).AsString := '';
         SalvaRegistro;
      end else begin
         DM.tblFichaIndividual.FieldByName(dbeN1.DataField).AsFloat := nota;
         SalvaRegistro;
      end;
   end;
   Sender.Modified := modificado;
end;

procedure TfrmDigFichaIndividual.ExamesBimestrais;
var
  intBimestre : Integer;
  n : Integer;
begin

   { Atualizar os campos quando clicar sobre Exames de Avaliação }

  intBimestre := StrToInt(txtBimestre.Text);

  dbeN1.DataField := 'Exame' + IntToStr(intBimestre);

  lblM1.Caption := 'Exame: ' + IntToStr(intBimestre);
  lblF1.Caption := 'Falta: ' + IntToStr(intBimestre);

  for n := 0 to ComponentCount - 1 do
  begin
    if (Components[n] is TField) then
    begin
      if TField(Components[n]).Tag = 1 then
        TField(Components[n]).Visible := False;
    end;
  end;

  grd.Columns[5].FieldName := 'Exame' + IntToStr(intBimestre);
  grd.Columns[6].FieldName := '';
  grd.Columns[7].FieldName := '';


  dbeF1.Enabled := False;
  lblF1.Enabled := False;

end;


procedure TfrmDigFichaIndividual.ExameFinal;
begin

  { Atualizar os campos quando clicar sobre Digitação de Exames Finais }

  grd.Columns[5].FieldName := 'NotaExame';
  grd.Columns[5].Title.Caption := 'Ex.F';
  grd.Columns[6].FieldName := '';
  grd.Columns[7].FieldName := '';

  dbeN1.DataField := 'NotaExame';
  lblM1.Caption := 'Ex.Final:';

  dbeF1.Enabled := False;
  lblF1.Enabled := False;

end;

procedure TfrmDigFichaIndividual.SegundaEpoca;
begin

  { Atualizar os campos quando clicar sobre Digitação Segunda Écopa }
  
  grd.Columns[5].FieldName := 'Segunda_Epoca';
  grd.Columns[5].Title.Caption := '2ªEpo';
  grd.Columns[6].FieldName := '';
  grd.Columns[7].FieldName := '';

  dbeN1.DataField := 'Segunda_Epoca';
  lblM1.Caption := Dm.lst_situacao_desc[ 11 ];

  dbeF1.Enabled := False;
  lblF1.Enabled := False;

end;

procedure TfrmDigFichaIndividual.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
begin

  if Button = btNext then
  begin
      txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

  Filtra;

end;

procedure TfrmDigFichaIndividual.dbeCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key in ['0'..'9'] then Exit;

  if Key = #13 then
  begin

    if dbeCodigo.Modified then
    begin

      DM.tblFichaIndividual.Cancel;
      dbeCodigo.SetFocus;
      dbeCodigo.SelectAll;
      Key := #0;
      Exit;

    end;

    SelectNext(ActiveControl, True, True );
    DM.tblFichaIndividual.Edit;
    Key := #0;

  end;
end;

procedure TfrmDigFichaIndividual.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmDigFichaIndividual.dtcFichaDataChange(Sender: TObject;
  Field: TField);
Var
   intBimestre : Integer;
   n : integer;
begin

  IntBimestre := StrToInt(txtBimestre.text);

  with DM.tblFichaIndividual do
  begin

    Close;

    if SQL.Count = 0 then
    begin

      SQL.Add('select f.* from FichaIndividual f' );
      SQL.Add('INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) ');
      SQL.Add('INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) ');
      SQL.Add('INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina) ');
      SQL.Add('WHERE ' );
      SQL.Add('f.Turma = :Turma and ' );
      SQL.Add('f.AnoSemestre = :AnoSemestre and ' );
      SQL.Add('f.CodigoAluno = :CodigoAluno and ' );
      SQL.Add('gd.cd_grade = :cd_grade and ' );
      SQL.Add('gd.cd_curso = :cd_curso and ' );
      SQL.Add('gd.nr_serie = :nr_serie and ' );
      SQL.Add('gd.cd_disciplina = :Disciplina' );

    end;

    ParamByName('AnoSemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
    ParamByName('CodigoAluno').AsInteger := tblFichaCodigoAluno.AsInteger;
    ParamByName('Turma').AsString := tblFichaTurma.AsString;
    ParamByName('cd_grade').AsInteger := tblFichacd_grade.AsInteger;
    ParamByName('cd_curso').AsString := tblFichaCurso.AsString;
    ParamByName('nr_serie').AsInteger := tblFichaSerie.AsInteger;
    ParamByName('Disciplina').AsInteger := tblFichaDisciplina.AsInteger;

    Open;

  end;

  lblProfessores.Caption := DM.ProfessoresTurma( intAnoSemestre, txtTurma.Text, intDisciplina );

  if radOpcoes.ItemIndex in [2,3] then begin
     lblM1.Enabled := tblFicha.FieldByName('aproveitamento').AsString = 'N';
     dbeN1.Enabled := tblFicha.FieldByName('aproveitamento').AsString = 'N';
     lblF1.Enabled := tblFicha.FieldByName('aproveitamento').AsString = 'N';
     dbeF1.Enabled := tblFicha.FieldByName('aproveitamento').AsString = 'N';
  end else begin
     lblM1.Enabled := tblFicha.FieldByName('sn_bloqueado'+IntToStr(intBimestre)).AsInteger <> 1;
     dbeN1.Enabled := tblFicha.FieldByName('sn_bloqueado'+IntToStr(intBimestre)).AsInteger <> 1;
     lblF1.Enabled := tblFicha.FieldByName('sn_bloq_freq'+IntToStr(intBimestre)).AsInteger <> 1;
     dbeF1.Enabled := tblFicha.FieldByName('sn_bloq_freq'+IntToStr(intBimestre)).AsInteger <> 1;

     if tblFicha.FieldByName('sn_bloqueado'+IntToStr(intBimestre)).AsInteger = 1 then begin
        lblM1Info.Caption := '(Nota Bloqueada)';
     end else if tblFicha.FieldByName('sn_bloqueado'+IntToStr(intBimestre)).AsInteger = 2 then begin
        lblM1Info.Caption := '(Nota Digitada Manualmente)';
     end else if (radOpcoes.ItemIndex in [4]) and (tblFicha.FieldByName('sn_bloqueio_ds_media').AsInteger = 1) then begin
        lblM1Info.Caption := '(Conceito Digitado Manualmente)';
     end else begin
        lblM1Info.Caption := '(Nota Desbloqueada)';
     end;
  end;

  for n := 1 to 10 do begin

     nota[n]   := DM.tblFichaIndividual.FieldByName('Nota' + IntToStr(n)).AsFloat;
     falta[n]  := DM.tblFichaIndividual.FieldByName('falta' + IntToStr(n)).AsFloat;
     exame[n]  := DM.tblFichaIndividual.FieldByName('Exame' + IntToStr(n)).AsFloat;
     notad[n]  := DM.tblFichaIndividual.FieldByName('Nota_d' + IntToStr(n)).AsFloat;

  end;

  NotaExame     := DM.tblFichaIndividual.FieldByName('NotaExame').AsFloat;
  mediaFinal     := DM.tblFichaIndividual.FieldByName('MediaFinal').AsFloat;
  segunda_Epoca   := DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsFloat;
  frequencia     := DM.tblFichaIndividual.FieldByName('Frequencia').AsFloat;


end;

procedure TfrmDigFichaIndividual.btnDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplinas }
   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], '', StrToInt(txtAnoSemestre.Text), txtTurma.Text);

   if resultado_filtro.filtrado then
   begin
      txtDisciplina.Text := resultado_filtro.ds_sigla;
      intDisciplina := resultado_filtro.cd_disciplina;
      ProcessarNotas;
      Filtra;
   end;
end;

procedure TfrmDigFichaIndividual.dbeE1KeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    if DM.tblFichaIndividual.State in [dsInsert, dsEdit] then
	SalvaRegistro;

    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;

end;

procedure TfrmDigFichaIndividual.grdCellClick(Column: TColumn);
begin
  dbeCodigo.SetFocus;
end;

procedure TfrmDigFichaIndividual.SalvaRegistro;
var
  xCodigoAluno, xCodigoGrade, xCodigoDisciplina, xCodigoSerie : Integer;
  xCodigoCurso : String;
  log : string;
  chaves, logDesc : string;
  n, atividade : Integer;

  intBimestre : integer;
  sNota_D, sBloq : String;
begin

  xCodigoAluno := tblFichaCodigoAluno.AsInteger;
  xCodigoGrade := tblFichacd_grade.AsInteger;
  xCodigoCurso := tblFichaCurso.AsString;
  xCodigoDisciplina := tblFichaDisciplina.AsInteger;
  xCodigoSerie := tblFichaSerie.AsInteger;

   if Dm.tblFichaIndividual.State in [dsInsert, dsEdit] then begin
      // Gravar o campo, caso a digitação seja referente a notas, então temos que repassar para a NOTA_D

      intBimestre := StrToInt(txtBimestre.Text);

      // Verifica se alterou alguma informação de NOTA e se está usando Nota1, Nota2, etc..
      if dbeN1.Modified and (dbeN1.DataField = 'Nota' + IntToStr(intBimestre)) then
      begin
         sNota_D := 'nota_d' +  IntToStr(intBimestre);
         if (DM.tblFichaIndividual.FieldByName(sNota_D).AsString = FloatToStr(Nota[intBimestre])) or
            (DM.tblFichaIndividual.FieldByName(sNota_D).IsNull) then
         begin
            DM.tblFichaIndividual.FieldByName(sNota_D).AsString :=  DM.tblFichaIndividual.FieldByName(dbeN1.DataField).AsString;
         end;

         sBloq := 'sn_bloqueado' +  IntToStr(intBimestre);
         DM.tblFichaIndividual.FieldByName(sBloq).AsInteger := 2;
      end;

      if dbeF1.Modified AND (dbeF1.Text = '') then
      begin
         DM.ZerarFaltaEtapaAluno(
            intBimestre,
            DM.tblFichaIndividualAnoSemestre.AsInteger,
            DM.tblFichaIndividualTurma.AsString,
            DM.tblFichaIndividualdisciplina.AsInteger,
            DM.tblFichaIndividualCodigoAluno.AsInteger
         );
      end;

      DM.tblFichaIndividual.Post;

      // Gravar Log de Alteração
      chaves := DM.tblFichaIndividual.FieldByName('codigoaluno').AsString + ';' +
                DM.tblFichaIndividual.FieldByName('anosemestre').AsString + ';' +
                DM.tblFichaIndividual.FieldByName('turma').AsString + ';' +
                DM.tblFichaIndividual.FieldByName('disciplina').AsString + ';'+
                DateTimeToStr(now())+ ';';

      // Inserir log de alteração de nota
      atividade := 0;

      logDesc := '';
      logDesc := logDesc + 'Aluno: '+DM.tblFichaIndividual.FieldByName('codigoaluno').AsString+', ';

      log := '';

      for n:= 1 to 10 do
      begin

        if DM.tblFichaIndividual.FieldByName('Nota' + IntToStr(n)).AsFloat <> Nota[n] then
           log := log + 'Nota '+ IntToStr(n) +  ': ['+FloatToStr(Nota[n])+'] => ['+DM.tblFichaIndividual.FieldByName('Nota' + IntToStr(n)).AsString+'].'+chr(13);
        if DM.tblFichaIndividual.FieldByName('Falta' + IntToStr(n)).AsFloat <> Falta[n] then
           log := log + 'Falta '+ IntToStr(n) + ': ['+FloatToStr(Falta[n])+'] => ['+DM.tblFichaIndividual.FieldByName('Falta' + IntToStr(n)).AsString+'].'+chr(13);
        if DM.tblFichaIndividual.FieldByName('Exame' + IntToStr(n)).AsFloat <> Exame[n] then
           log := log + 'Exame '+ IntToStr(n) + ': ['+FloatToStr(Exame[n])+'] => ['+DM.tblFichaIndividual.FieldByName('Exame' + IntToStr(n)).AsString+'].'+chr(13);
        if DM.tblFichaIndividual.FieldByName('nota_d' + IntToStr(n)).AsFloat <> notad[n] then
           log := log + 'Nota Def. ' + IntToStr(n) + ': ['+FloatToStr(notad[n])+'] => ['+DM.tblFichaIndividual.FieldByName('nota_d' + IntToStr(n)).AsString+'].'+chr(13);

      end;

      if DM.tblFichaIndividual.FieldByName('NotaExame').AsFloat <> NotaExame then
      begin
         log := log + 'Exame Final: ['+FloatToStr(NotaExame)+'] => ['+DM.tblFichaIndividual.FieldByName('NotaExame').AsString+'].'+chr(13);
      end;
      if radOpcoes.ItemIndex = 2 then begin
         logDesc := logDesc + 'Nota: '+DM.tblFichaIndividual.FieldByName('NotaExame').AsString+', ';
         atividade := uDMDiario.ATIVIDADE_EXAME;
      end;

      if DM.tblFichaIndividual.FieldByName('MediaFinal').AsFloat <> mediaFinal then
      begin
         log := log + 'Média Final: ['+FloatToStr(mediaFinal)+'] => ['+DM.tblFichaIndividual.FieldByName('MediaFinal').AsString+'].'+chr(13);
         logDesc := logDesc + 'Ajuste na média final: '+DM.tblFichaIndividual.FieldByName('MediaFinal').AsString+', ';
         atividade := uDMDiario.ATIVIDADE_MEDIA;
      end;

      if DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsFloat <> segunda_Epoca then
      begin
         log := log + 'Segunda Época: ['+FloatToStr(segunda_Epoca)+'] => ['+DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsString+'].'+chr(13);
      end;
      if radOpcoes.ItemIndex = 3 then begin
         logDesc := logDesc + 'Nota: '+DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsString+', ';
         atividade := uDMDiario.ATIVIDADE_SEGUNDA_EPOCA;
      end;

      if DM.tblFichaIndividual.FieldByName('Frequencia').AsFloat <> frequencia then
      begin
         log := log + 'Freqüência: ['+FloatToStr(frequencia)+'] => ['+DM.tblFichaIndividual.FieldByName('Frequencia').AsString+'].'+chr(13);
      end;

      logDesc := logDesc + 'Anosemestre: '+DM.tblFichaIndividual.FieldByName('anosemestre').AsString+', ';
      logDesc := logDesc + 'Turma: '+DM.tblFichaIndividual.FieldByName('turma').AsString+', ';
      logDesc := logDesc + 'Disciplina: '+ DM.tblFichaIndividual.FieldByName('disciplina').AsString+' [Acadêmico]';

      if atividade <> 0 then begin
        { Insere log de alteração de nota de exame }
        DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, atividade, logDesc, DM.iCdPessoaLogado);
      end;

      DM.gerar_log(9, log, DM.iCdPessoaLogado, chaves);
      // Fim da gravação do log

   end;

   if not (FindValue(sCodigoAluno, sCodigoGrade, DM.tblFichaIndividualCodigoAluno.AsString, DM.tblFichaIndividualCodigoGrade.AsString)) then
   begin
      sCodigoAluno.Add( DM.tblFichaIndividualCodigoAluno.AsString );
      sTurma.Add( DM.tblFichaIndividualTurma.AsString);
      sCodigoGrade.Add( DM.tblFichaIndividualCodigoGrade.AsString );
   end;

   tblFicha.Close;
   tblFicha.Open;
   tblFicha.Locate('CodigoAluno;cd_grade;Curso;Disciplina;Serie', VarArrayOf([xCodigoAluno, xCodigoGrade, xCodigoCurso, xCodigoDisciplina, xCodigoSerie]),[]);

   tblFicha.Next;

   if tblFicha.Eof then
   begin
      Mensagem( 'Digitação chegou ao final da lista.', Application.Title, MB_OK + MB_ICONINFORMATION );
   end;

   if dbeN1.Enabled then begin
      dbeN1.SetFocus;
      dbeN1.SelectAll;
   end;

end;



procedure TfrmDigFichaIndividual.dbeN1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if radOpcoes.ItemIndex = 4 then
   begin
      if Key <> #13 then
      begin
         DM.tblFichaIndividual.Edit;
         TDBEdit(Sender).Field.AsString := UpperCase(Key);
      end else begin
         key :=#0
      end;
   end else begin
      if Key = '*' then
      begin
         DM.tblFichaIndividual.Edit;
         TDBEdit(Sender).Field.AsFloat := -2;
         Key := #0;
      end
      else if (Key = 'd') or (Key = 'D') then
      begin
         DM.tblFichaIndividual.Edit;
         TDBEdit(Sender).Field.AsFloat := -1;
         Key := #0;
      end
      else if Key = '.' then
      begin
         Key := DecimalSeparator
      end;
   end;

   if key = #13 then
   begin
      if dbeF1.Enabled then
      begin
         SelectNext(Sender as TWinControl, True, True)
      end else begin
         SalvaRegistro;
      end;

      Key := #0;
   end;
end;

procedure TfrmDigFichaIndividual.radOpcoesClick(Sender: TObject);
begin

   Dm.tblAvaliacao.Close;
   Dm.tblAvaliacao.ParamByName('Anosemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
   Dm.tblAvaliacao.ParamByName('Turma').AsString := tblFichaTurma.AsString;
   Dm.tblAvaliacao.Open;

   tblFicha.First;
   case radOpcoes.ItemIndex of
     0 : Begin
            lblM1Info.Show;
            NotasBimestrais;
         End;
     1 : Begin
            if not Dm.isTrue(DM.tblAvaliacaosn_recuperacao.AsString) Then
            Begin
               Mensagem('Curso não tem Exame de Avaliação.', 'Atenção', MB_OK + MB_ICONWARNING);
               radOpcoes.ItemIndex := 0;
               Abort;
            end else if (DM.tblAvaliacaosn_diario_online.AsInteger = 1) then
            begin
               Mensagem('Essa turma utiliza diário de classe, por favor informe a Recuperação da Etapa pelo diário de classe.', 'Atenção', MB_OK + MB_ICONWARNING);
               radOpcoes.ItemIndex := 0;
               Abort;
            end else begin
               lblM1Info.Hide;
               ExamesBimestrais;
            end;
         End;
     2 : Begin
           if not Dm.isTrue(DM.tblAvaliacaosn_exame.AsString) Then
           Begin
               Mensagem('Curso não tem Exame Final.', 'Atenção', MB_OK + MB_ICONWARNING);
               radOpcoes.ItemIndex := 0;
               Abort;
           End
           else begin
               lblM1Info.Hide;
               ExameFinal;
           end;
	     End;
     3 : Begin
           if not Dm.isTrue(DM.tblAvaliacaosn_segunda_epoca.AsString) Then
           Begin
               Mensagem('Curso não tem Segunda Época.',  'Atenção', MB_OK + MB_ICONWARNING);
               radOpcoes.ItemIndex := 0;
               Abort;
           End
           else begin
               lblM1Info.Hide;
               SegundaEpoca;
           end;
       End;

     4 : Begin
           if not Dm.isTrue(Dm.tblAvaliacaosn_conceitos.AsString) Then
           Begin
               Mensagem('Curso não tem avaliação por conceito.',  'Atenção', MB_OK + MB_ICONWARNING);
               radOpcoes.ItemIndex := 0;
               exit;
           End
           else begin
               lblM1Info.Show;
               Conceito;
           end;
       End
       else begin
          Filtra;
       end;
   end;

   if dbeN1.Enabled then begin
     dbeN1.SetFocus;
     dbeN1.SelectAll;
   end;
end;

procedure TfrmDigFichaIndividual.dbeF1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SalvaRegistro;

    Key := #0;
  end;
end;

procedure TfrmDigFichaIndividual.tblFichaCalcFields(DataSet: TDataSet);
begin
   try
      tblFichaDescricaoSituacao.AsString := DM.lst_situacao_sigla[tblFichaSituacao.AsInteger];
   except
      tblFichaDescricaoSituacao.AsString := '';
   end;
end;


procedure TfrmDigFichaIndividual.btnTurmasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   if sCodigoAluno.Count > 0 then
      ProcessarNotas;

   txtTurma.Text := resultado_filtro.cd_turma;
   txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
   intAnoSemestre := StrToInt(txtAnoSemestre.Text);

   Filtra;
end;

procedure TfrmDigFichaIndividual.Conceito;
var
  intBimestre : Integer;
  n : Integer;
begin
  { Atualizar os campos quando clicar sobre Digitação de Médias }

  intBimestre := StrToInt(txtBimestre.Text);

  dbeN1.DataField := 'ds_media';
  dbeF1.DataField := 'falta' + IntToStr(intBimestre);

  lblM1.Caption := 'Conceito:';
  lblF1.Caption := 'Falta: ' + IntToStr(intBimestre);

  for n := 0 to ComponentCount - 1 do
  begin
     if (Components[n] is TField) then
     begin
        if TField(Components[n]).Tag = 1 then
               TField(Components[n]).Visible := False;
     end;
  end;

  grd.Columns[5].FieldName := 'ds_media';
  grd.Columns[5].Title.Caption := 'Conceito';
  grd.Columns[6].FieldName := 'falta' + IntToStr(intBimestre);
  grd.Columns[7].FieldName := '';

  dbeN1.Text := dbeN1.Field.DataSet.FieldByName(dbeN1.Field.FieldName).AsString; 

  dbeN1.Enabled := True;
  dbeN1.Visible := True;
  dbeF1.Enabled := True;
  lblF1.Enabled := True;

end;

procedure TfrmDigFichaIndividual.txtDisciplinaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    if txtDisciplina.Modified then ProcessarNotas;

    DM.tblDisciplinas.SQL.Clear;
    DM.tblDisciplinas.SQL.Add( 'select * from Disciplinas order by Sigla' );
    DM.tblDisciplinas.Open;

    if DM.tblDisciplinas.Locate( 'Sigla', txtDisciplina.Text, [loCaseInsensitive] ) then
      intDisciplina := DM.tblDisciplinasCodigo.AsInteger
    else
    begin
      Mensagem( 'Disciplina não encontrada.', Application.Title, MB_OK + MB_ICONSTOP );
      txtDisciplina.SetFocus;
      Exit;
      Key := #0;
    end;

    if (txtTurma.Text = '') and (txtCodigoAluno.Text = '') then
    begin
      Mensagem( 'Escolha uma turma antes de começar a digitação.', application.Title,
                MB_OK + MB_ICONSTOP );
      txtTurma.SetFocus;
      Exit;
      Key := #0;
    end;
    intDisciplina := DM.tblDisciplinasCodigo.AsInteger;
    Filtra;
    Key := #0;
  end;

end;

procedure TfrmDigFichaIndividual.FormCreate(Sender: TObject);
begin

  if (frmFichaIndividual <> nil) then
  begin
    if frmFichaIndividual.popFicha.Items[1].Checked then
    begin
      txtAnoSemestre.Text := frmFichaIndividual.tblFichaAnoSemestre.AsString;
      txtTurma.Text := frmFichaIndividual.tblFichaTurmaMatricula.AsString;
      txtDisciplina.Text := frmFichaIndividual.tblFichaSigla.AsString;
      intDisciplina := frmFichaIndividual.tblFichaDisciplina.AsInteger;
    end
    else
    begin
      txtTurma.Text := frmFichaIndividual.tblFichaTurmaMatricula.AsString;
      txtCodigoAluno.Text := frmFichaIndividual.tblFichaCodigoAluno.AsString;
      txtAnoSemestre.Text := frmFichaIndividual.tblFichaAnoSemestre.AsString;
    end;
  end;

  if DMDiario = nil then
  begin
     Application.CreateForm(TDMDiario, DMDiario);
     { Insere log de acesso ao diário }
     DMDiario.inserirLogAcesso;
  end;

end;

procedure TfrmDigFichaIndividual.txtTurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin

    if txtTurma.Modified then ProcessarNotas;

    if (txtDisciplina.Text = '') and (txtCodigoAluno.Text = '') then
    begin
      Mensagem( 'Escolha uma disciplina antes de começar a digitação.', Application.Title,
                MB_OK + MB_ICONSTOP );
      txtDisciplina.SetFocus;
      Key := #0;
      Exit;
    end;
    Filtra;
    Key := #0;
  end;
end;

procedure TfrmDigFichaIndividual.txtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_UP then SelectNext(ActiveControl,False,True);

end;

procedure TfrmDigFichaIndividual.FormDestroy(Sender: TObject);
begin
  frmDigFichaIndividual := nil;
end;

procedure TfrmDigFichaIndividual.dbeF1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then SelectNext(ActiveControl,False,True);
end;

procedure TfrmDigFichaIndividual.dbeN1Enter(Sender: TObject);
begin
   if (DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S') or (DM.tblAvaliacaosn_conceitos.AsString = 'S') then
   begin
      TAvaliacoesConceitos.GetInstancia().AbrirCampoConceito(DM.tblAvaliacaocd_avaliacao.AsInteger, TDBEdit(Sender), ['****', 'DISP'], OnSaveConceito);
   end;
end;

procedure TfrmDigFichaIndividual.dbeN1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then SelectNext(ActiveControl,False,True);
end;

procedure TfrmDigFichaIndividual.dbeCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP : tblFicha.Prior;
    VK_DOWN : tblFicha.Next;
    VK_RETURN: Key := VK_RETURN;
  else
    Key := 0;
  end;
end;

function TfrmDigFichaIndividual.FindValue(const aString1, aString2:TStringList;
  aValue1, aValue2:String):Boolean;
var
  n, x: Integer;
begin
  n := aString1.IndexOf(aValue1);
  if n >= 0 then
    Result := True
  else
    Result := False;

{
 NAO BUSCAR PELO CODIGO DA GRADE
 if Result then
  begin
    x := aString2.IndexOf(aValue2);
    if x = n then
      Result := True
    else
      Result := False;

    if (txtCodigoAluno.Text = '') and (not Result) then Result := True;
  end;
}
end;

procedure TfrmDigFichaIndividual.ProcessarNotas;
var
   tentativas, n : Integer;
   erro : Boolean;
begin

   { Se não tiver aluno com nota alterada, Sair }
   if sCodigoAluno.Count <= 0 then Exit;

   DM.db.StartTransaction;
   if sCodigoAluno.Count > 0 then
    frmProcessando.Bar.Max := sCodigoAluno.Count - 1;

   frmProcessando.Show;
   Application.ProcessMessages;

   { Faça do primeiro aluno até o último }

   for n := 0 to sCodigoAluno.Count - 1 do
   begin
      try
         DM.CalcularMediaFinal( StrToInt(sCodigoAluno.Strings[n]),
                                StrToInt( txtAnoSemestre.Text ),
                                DM.getGrupoAtividade(StrToInt(txtAnoSemestre.Text), tblFichaCurso.AsString, sTurma.Strings[n], intDisciplina, StrToInt(sCodigoAluno.Strings[n])),
                                sTurma.Strings[n],
                                sTurma.Strings[n] );
      except on E:Exception do
         begin

            erro := true;
            tentativas := 0;
            // Tenta pelo menos mais 10 vezes
            while (tentativas <= 10) and erro do
            begin
               try
                  DM.CalcularMediaFinal( StrToInt(sCodigoAluno.Strings[n]),
                               StrToInt( txtAnoSemestre.Text ),
                                DM.getGrupoAtividade(StrToInt(txtAnoSemestre.Text), tblFichaCurso.AsString, sTurma.Strings[n], intDisciplina, StrToInt(sCodigoAluno.Strings[n])),
                                sTurma.Strings[n],
                                sTurma.Strings[n] );
                  erro := false;              
               except on E:Exception do
                  begin
                     tentativas := tentativas + 1;
                  end;
               end;
            end;

            if erro then
            begin
               frmProcessando.Close;
               DM.db.Rollback;
               Mensagem( 'Ocorreu um erro inesperado.' + #13 +
                         'Erro nos cálculos das médias da digitação.' + #13 +
                         'Msg: ' + E.Message, Application.Title,
                         MB_OK + MB_ICONSTOP );
               Exit;
            end;
         end;
      end;
      frmProcessando.Bar.Position := n;
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(n+1) + ' de ' +
        IntToStr(frmProcessando.Bar.Max+1) + ' - ' + sCodigoAluno.Strings[n];
      Application.ProcessMessages;
   end;

   frmProcessando.Close;

   sCodigoaluno.Clear;
   sTurma.Clear;
   sCodigoGrade.Clear;

   DM.tblFichaIndividual.SQL.Clear;

   DM.db.Commit;
end;


procedure TfrmDigFichaIndividual.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
     lngCodigoAluno := resultado_filtro.cd_pessoa;
   end
   else Exit;

  if sCodigoAluno.Count > 0 then ProcessarNotas;

  txtCodigoAluno.Text := IntToStr(lngCodigoAluno);
  txtTurma.Text := resultado_filtro.cd_turma;
  txtAnoSemestre.Text := IntToStr(resultado_filtro.nr_anosemestre);
  Filtra;
  
end;

procedure TfrmDigFichaIndividual.txtCodigoAlunoExit(Sender: TObject);
var
   qyListaMatriculas : TUMZReadOnlyQuery;
begin
   if txtCodigoAluno.Text = '' then Exit;

   while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

   DM.CriarConsulta(qyListaMatriculas);

   qyListaMatriculas.SQL.Text := 'SELECT cd_pessoa as Codigo , nm_pessoa as Nome , Matriculas.AnoSemestre, ' +
      'Matriculas.Curso, Matriculas.Turma FROM Pessoas LEFT JOIN ' +
      ' Matriculas ON ( Pessoas.cd_pessoa = Matriculas.CodigoAluno ) ' +
      ' WHERE Pessoas.cd_Pessoa = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' +
      ' order by Matriculas.AnoSemestre ';
   qyListaMatriculas.ParamByName('Codigo').AsInteger := StrToInt( txtCodigoAluno.Text );
   qyListaMatriculas.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   qyListaMatriculas.Open;

   while not qyListaMatriculas.Eof do
   begin
      popTurmas.Items.Add(
         NewItem( qyListaMatriculas.FieldByName('Turma').AsString, 0, False, True, MyClick, 0, '' ) );
      qyListaMatriculas.Next;
   end;

   if popTurmas.Items.Count = 1 then
      txtTurma.Text := qyListaMatriculas.FieldByName('Turma').AsString
   else
      popTurmas.Popup( frmDigFichaIndividual.Left + txtTurma.Left, frmDigFichaIndividual.Top + txtTurma.Top );

   Filtra;
end;

procedure TfrmDigFichaIndividual.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;



procedure TfrmDigFichaIndividual.txtCodigoAlunoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if sCodigoAluno.Count > 0 then ProcessarNotas;
    Filtra;
    SelectNext(ActiveControl,True,True);
  end;
end;

procedure TfrmDigFichaIndividual.txtAnoSemestreExit(Sender: TObject);
begin
  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

  Filtra;
end;

procedure TfrmDigFichaIndividual.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEy = #13 then
  begin
    intAnoSemestre := StrToInt(txtAnoSemestre.Text);
    Key := #0;
  end;
end;

procedure TfrmDigFichaIndividual.txtBimestreExit(Sender: TObject);
Var
  intBimestre : Integer;
begin
   intBimestre := StrToInt(txtBimestre.Text);
   if intBimestre > 10 then begin
      txtBimestre.Text := '10';
   end;

  case radOpcoes.ItemIndex of
       0 : NotasBimestrais;
       1 : ExamesBimestrais;
       2 : ExameFinal;
       3 : SegundaEpoca;
  end;

end;

procedure TfrmDigFichaIndividual.tblFichaNota1GetText(Sender: TField;
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
   else if (Sender.AsString = '') then
   begin
      Text := '';
   end
   else if DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         DM.tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      );
   end else begin
      Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
   end;
end;

procedure TfrmDigFichaIndividual.tblFichaExame1GetText(Sender: TField;
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
   else if (Sender.AsString = '') OR (Sender.AsFloat = 0) then
   begin
      Text := '';
   end
   else if DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         DM.tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      );
   end else begin
      Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
   end;
end;

procedure TfrmDigFichaIndividual.tblFichaFalta1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;
   if Sender.AsFloat = 0 then
      Text := ''
   else
      Text := FloatToStr(Sender.AsFloat);

end;

procedure TfrmDigFichaIndividual.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblFicha, pmQtd);

end;

end.

