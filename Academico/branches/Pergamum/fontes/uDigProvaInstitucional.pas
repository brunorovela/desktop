unit uDigProvaInstitucional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Db, ZConnection, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, Menus;

type
  TfrmDigProvaInstitucional = class(TForm)
    Panel3: TPanel;
    btnFechar: TSpeedButton;
    grd: TDBGrid;
    tblFicha: TUMZQuery;
    dtcFicha: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    lblM1: TLabel;
    dbeReda: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    Label9: TLabel;
    Label4: TLabel;
    txtTurma: TEdit;
    btnTurmas: TSpeedButton;
    qry: TUMZQuery;
    lblCodigoAluno: TLabel;
    txtCodigoAluno: TEdit;
    SpeedButton2: TSpeedButton;
    popTurmas: TPopupMenu;
    DBText2: TDBText;
    Label3: TLabel;
    Label5: TLabel;
    dbeProva: TDBEdit;
    dbeMedia: TDBEdit;
    tblFichaCodigoAluno: TIntegerField;
    tblFichaTurma: TStringField;
    tblFichaAnoSemestre: TSmallintField;
    tblFichaNotaRedacao: TFloatField;
    tblFichaNotaProva: TFloatField;
    tblFichaMediaInstitucional: TFloatField;
    tblFichaNome: TStringField;
    tblDigProva: TUMZQuery;
    tblDigProvaCodigoAluno: TIntegerField;
    tblDigProvaTurma: TStringField;
    tblDigProvaAnoSemestre: TSmallintField;
    tblDigProvaNotaRedacao: TFloatField;
    tblDigProvaNotaProva: TFloatField;
    tblDigProvaMediaInstitucional: TFloatField;
    tblInclusao: TUMZQuery;
    dtcDigPRova: TDataSource;
    qryCodigoAluno: TIntegerField;
    qryTurma: TStringField;
    qryAnoSemestre: TSmallintField;
    qryNotaRedacao: TFloatField;
    qryNotaProva: TFloatField;
    qryMediaInstitucional: TFloatField;
    tblFichaNProva: TStringField;
    tblFichaNReda: TStringField;
    tblFichaMPI: TStringField;
    Bevel4: TBevel;
    Bevel3: TBevel;
    pmQtd: TPopupMenu;
    btnMediaPI: TSpeedButton;
    tblFichanr_casas_decimais: TSmallintField;
    procedure btnMediaPIClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure dtcFichaDataChange(Sender: TObject; Field: TField);
    procedure Filtra;
    procedure IncluirAlunos;
    procedure dbeE1KeyPress(Sender: TObject; var Key: Char);
    procedure grdCellClick(Column: TColumn);
    procedure SalvaRegistro;
    procedure dbeRedaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeF1KeyPress(Sender: TObject; var Key: Char);
    procedure btnTurmasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure dbeF1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeRedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function FindValue(const aString1:TStringList; aValue1:String):Boolean;
    procedure ProcessarNotas;
    procedure SpeedButton2Click(Sender: TObject);
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure MyClick(Sender:TObject);
    procedure txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure txtAnoSemestreExit(Sender: TObject);
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure dbeProvaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeMediaKeyPress(Sender: TObject; var Key: Char);
    procedure tblFichaCalcFields(DataSet: TDataSet);
    procedure tblDigProvaNotaRedacaoChange(Sender: TField);
    procedure tblDigProvaNotaProvaChange(Sender: TField);
    procedure pmQtdPopup(Sender: TObject);
  private
    intAnoSemestre : Integer;
    intQtdadeBimestres : Integer;
    intDisciplina : Integer;
    sCodigoAluno, sTurma : TStringList;
    lngCodigoAluno: Longint;
    sFormulaPi : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDigProvaInstitucional: TfrmDigProvaInstitucional;

implementation

uses uDM, uFichaIndividual, uFSelecionarTurma, Main, uProcessando, uFSelecionarPessoa,
   uUMNucleo;

{$R *.DFM}

procedure TfrmDigProvaInstitucional.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDigProvaInstitucional.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if sCodigoAluno.Count > 0 then ProcessarNotas; //rotina para processar notas digitadas;

  sCodigoAluno.Free;
  sTurma.Free;

  if tblDigProva.State in [dsInsert, dsEdit] then tblDigProva.Cancel;
  Action := caFree;
end;

procedure TfrmDigProvaInstitucional.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick(nil);
  end;
end;

procedure TfrmDigProvaInstitucional.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Criar as StringList para controlar as alterações }

  sCodigoAluno := TStringList.Create;
  sTurma := TStringList.Create;

  { Iniciar AnoSemestre } 
  if txtAnoSemestre.Text = '' then
  begin
      txtAnoSemestre.text := IntToStr(ano_semestre);
  end;

  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

  // Bloquear Anosemestre
  txtAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre;
  Label9.Visible := txtAnoSemestre.Visible;
  UpDown2.Visible := txtAnoSemestre.Visible;
  DM.BloquearComponenteAnosemestre(grd, 'AnoSemestre');

  Filtra;
end;

procedure TfrmDigProvaInstitucional.Filtra;
begin

  if (txtTurma.Text = '') then Exit;

  IncluirAlunos;
  tblFicha.Close;
  tblFicha.SQL.Clear;
  tblFicha.SQL.Add( 'SELECT P.codigoaluno, P.turma, P.anosemestre, P.notaredacao, ' );
  tblFicha.SQL.Add( 'P.notaredacao1, P.notaredacao2, P.cd_prova, P.sn_pi, Pessoas.nm_pessoa AS nome, ' );
  tblFicha.SQL.Add( 'ROUND( P.notaprova, ava.nr_casas_decimais) AS notaprova, ' );
  tblFicha.SQL.Add( 'ROUND( P.mediainstitucional, ava.nr_casas_decimais) AS mediainstitucional, ' );
  tblFicha.SQL.Add( 'ava.nr_casas_decimais ' );
  tblFicha.SQL.Add( 'FROM (Pessoas INNER JOIN ProvaInstitucional P ON Pessoas.cd_pessoa = P.CodigoAluno ' );
  tblFicha.SQL.Add( 'INNER JOIN TURMAS t ON (t.codigo = P.Turma and P.AnoSemestre = t.anosemestre) ' );
  tblFicha.SQL.Add( 'INNER JOIN avaliacoes_parametros_matriz ava on (t.cd_avaliacao = ava.cd_avaliacao))' );

  tblFicha.SQL.Add( 'where P.AnoSemestre = :AnoSemestre' );

  if (txtCodigoAluno.Text <> '') then
    tblFicha.SQL.Add( ' and P.CodigoAluno = :CodigoAluno' );

  tblFicha.SQL.Add( 'and P.Turma = :Turma' );

  tblFicha.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  tblFicha.ParamByName('Turma').AsString := txtTurma.Text;

  if (txtCodigoAluno.Text <> '') then
     tblFicha.ParamByName('CodigoAluno').AsInteger := StrToInt(txtCodigoAluno.Text);

  tblFicha.SQL.Add( 'order by Pessoas.nm_pessoa, P.Turma' );

  tblFicha.Open;

  // Abrir o parametro de Avaliacao

  Dm.tblAvaliacao.Close();
  Dm.tblAvaliacao.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  Dm.tblAvaliacao.ParamByName('turma').AsString := txtTurma.Text;
  Dm.tblAvaliacao.Open();

  if Dm.tblAvaliacao.Eof then begin

     Mensagem('Não existe parâmetro de avaliação configurado para a turma selecionada. Configure um parametro para poder utilizar esta tela.', 'Atenção', MB_OK + MB_ICONWARNING);
     tblFicha.Close();
     Exit;

  end else begin
  
     if DM.tblAvaliacaosn_pi.AsString <> 'S' then begin

       Mensagem('Esta turma não utiliza Prova Interdisciplinar. Para usar essa tela, você deverá configurar o parâmetro de avaliação.', 'Atenção', MB_OK + MB_ICONWARNING);
       tblFicha.Close();
       frmDigProvaInstitucional.Close();
       Exit;

     end;

  end;

  sFormulaPi := DM.tblAvaliacaods_formula_pi.AsString;

  if trim(sFormulaPi) = '' then begin
  
     sFormulaPi := '( notaredacao + notaprova )';
  
  end;


end;

procedure TfrmDigProvaInstitucional.IncluirAlunos;
begin
  { Inclui os Alunos na Tabela da ProvaInstitucional }

  tblInclusao.Close;
  tblInclusao.SQL.Clear;
  tblInclusao.SQL.Add( 'Select * From Matriculas' );
  tblInclusao.SQL.Add( 'Where AnoSemestre = :AnoSemestre' );
  tblInclusao.SQL.Add( 'and Turma = :Turma' );

  if (txtCodigoAluno.Text <> '') then
    tblInclusao.SQL.Add( ' and CodigoAluno = :CodigoAluno' );

  tblInclusao.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  tblInclusao.ParamByName('Turma').AsString := txtTurma.Text;

  if (txtCodigoAluno.Text <> '') then
     tblInclusao.ParamByName('CodigoAluno').AsInteger := StrToInt(txtCodigoAluno.Text);

  tblInclusao.Open;

  while not tblInclusao.EOF do
  Begin
     with tblDigProva do
     begin
       Close;
       SQL.Clear;
       SQL.Add( 'SELECT P.codigoaluno, P.turma, P.anosemestre, ' );
       SQL.Add( 'P.notaredacao, P.notaredacao2, P.cd_prova, P.sn_pi, ' );
       SQL.Add( 'P.notaprova AS notaprova, ' );
       SQL.Add( 'P.mediainstitucional AS mediainstitucional ' );
       SQL.Add( 'FROM ProvaInstitucional P where ' );
       SQL.Add('P.Turma = :Turma and' );
       SQL.Add('P.AnoSemestre = :AnoSemestre and' );
       SQL.Add('P.CodigoAluno = :CodigoAluno' );
       ParamByName('AnoSemestre').AsInteger := tblInclusao.FieldByNAme('AnoSemestre').AsInteger;
       ParamByName('CodigoAluno').AsInteger := tblInclusao.FieldByNAme('CodigoAluno').AsInteger;
       ParamByName('Turma').AsString := tblInclusao.FieldByNAme('Turma').AsString;
       Open;
       //tblDigProvaNotaProva.AsString
       if EOF Then Begin
          Insert;
          FieldByName('AnoSemestre').AsInteger := tblInclusao.FieldByNAme('AnoSemestre').AsInteger;
          FieldByName('CodigoAluno').AsInteger := tblInclusao.FieldByNAme('CodigoAluno').AsInteger;
          FieldByName('Turma').AsString := tblInclusao.FieldByNAme('Turma').AsString;
          FieldByNAme('NotaRedacao').ASString := '';
          FieldByName('NotaProva').AsString;
          FieldByName('MediaInstitucional').AsString;
          Post;
       End;
     end;
     tblInclusao.Next;
  End;

end;


procedure TfrmDigProvaInstitucional.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmDigProvaInstitucional.dtcFichaDataChange(Sender: TObject;
  Field: TField);
begin

  with tblDigProva do
  begin
    Close;
    SQL.Clear;
    SQL.Add( 'SELECT P.codigoaluno, P.turma, P.anosemestre, ' );
    SQL.Add( 'P.notaredacao, P.notaredacao2, P.cd_prova, P.sn_pi, ' );
    SQL.Add( 'P.notaprova AS notaprova, ' );
    SQL.Add( 'P.mediainstitucional AS mediainstitucional ' );
    SQL.Add( 'FROM ProvaInstitucional P where ' );
    SQL.Add(' P.Turma = :Turma and' );
    SQL.Add(' P.AnoSemestre = :AnoSemestre and' );
    SQL.Add(' P.CodigoAluno = :CodigoAluno' );
    ParamByName('AnoSemestre').AsInteger := tblFichaAnoSemestre.AsInteger;
    ParamByName('CodigoAluno').AsInteger := tblFichaCodigoAluno.AsInteger;
    ParamByName('Turma').AsString := tblFichaTurma.AsString;
    Open;
  end;

  tblDigProvaNotaRedacao.DisplayFormat := '#0.'+StringOfChar('0', tblFicha.FieldByName('nr_casas_decimais').AsInteger);
  tblDigProvaNotaProva.DisplayFormat := '#0.'+StringOfChar('0', tblFicha.FieldByName('nr_casas_decimais').AsInteger);
  tblDigProvaMediaInstitucional.DisplayFormat := '#0.'+StringOfChar('0', tblFicha.FieldByName('nr_casas_decimais').AsInteger);

  tblFichaNotaRedacao.DisplayFormat := '#0.'+StringOfChar('0', tblFicha.FieldByName('nr_casas_decimais').AsInteger);
  tblFichaNotaProva.DisplayFormat := '#0.'+StringOfChar('0', tblFicha.FieldByName('nr_casas_decimais').AsInteger);
  tblFichaMediaInstitucional.DisplayFormat := '#0.'+StringOfChar('0', tblFicha.FieldByName('nr_casas_decimais').AsInteger);
end;

procedure TfrmDigProvaInstitucional.dbeE1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if tblDigProva.State in [dsInsert, dsEdit] then
      SalvaRegistro;
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfrmDigProvaInstitucional.grdCellClick(Column: TColumn);
begin
  dbeReda.SetFocus;
end;

procedure TfrmDigProvaInstitucional.SalvaRegistro;
var
  MyBookmark : TBookmark;
begin

  MyBookmark := tblFicha.GetBookmark;
  tblFicha.DisableControls;

    if tblDigProva.State in [dsInsert, dsEdit] Then
       tblDigProva.Post;

    if not (FindValue(sCodigoAluno,tblDigProvaCodigoAluno.AsString)) then
    begin
      sCodigoAluno.Add( tblDigProvaCodigoAluno.AsString );
      sTurma.Add( tblDigProvaTurma.AsString );
    end;

    try
      tblFicha.GotoBookmark( MyBookmark );
    finally
      tblFicha.FreeBookmark( MyBookmark );
    end;

  tblFicha.Next;
  tblFicha.EnableControls;

  if tblFicha.Eof then
  begin
    Mensagem( 'Digitação chegou ao final da lista.', Application.Title,
               MB_OK + MB_ICONINFORMATION );
  end;
  dbeReda.SetFocus;
end;



procedure TfrmDigProvaInstitucional.dbeRedaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if TUMZQuery( TDataSource( TDBEdit(Sender).DataSource ).DataSet).FieldByName(
    TDBEdit(Sender).DataField ) is TFloatField then
  begin
    if Key = '.' then Key := DecimalSeparator;
  end;

  if Key = #13 then
  begin
    dbeProva.Setfocus;
    Key := #0;
  end;
end;

procedure TfrmDigProvaInstitucional.dbeF1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if TUMZQuery( TDataSource( TDBEdit(Sender).DataSource ).DataSet).FieldByName(
    TDBEdit(Sender).DataField ) is TFloatField then
  begin
    if Key = '.' then Key := DecimalSeparator;
  end;

  if Key = #13 then
  begin
    if tblDigProva.State in [dsInsert, dsEdit] then
      SalvaRegistro;
    dbeReda.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmDigProvaInstitucional.btnMediaPIClick(Sender: TObject);
Var
  qyCalc : TUMZQuery;
begin
    if Mensagem('Atenção' + CHR(13) + CHR(13) +
             'Este procedimento irá calcular a Média da PI para os alunos selecionados, aplicando a fórmula configurada nos parâmetros de avaliação. ' + CHR(13) + CHR(13) +
             'Tem certeza que deseja continuar ?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION)
    <> mrYes then Exit;

    // calcular a Média da PI
    DM.CriarConsulta(qyCalc);

    qyCalc.SQL.Text :=
      ' UPDATE provainstitucional ' +
      '    SET mediainstitucional = ' + sFormulaPi +
      '  WHERE (' + sFormulaPi +') is not null ' + 
      '    AND turma = ' + QuotedStr(txtTurma.Text) + ' ' +
      '    AND anosemestre = ' + txtAnoSemestre.Text;

    if TRim(txtCodigoAluno.Text) <> '' then begin
    
       qyCalc.SQL.ADD(' AND codigoaluno = ' + txtCodigoAluno.Text);

    end;

    qyCalc.ExecSQL;

    Filtra();
    
    Mensagem('Média Interdisciplinar atualizada com sucesso!', 'UNIMESTRE', MB_OK + MB_ICONINFORMATION);

    FreeAndNil(qyCalc);
    
end;

procedure TfrmDigProvaInstitucional.btnTurmasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   if sCodigoAluno.Count > 0 then
      ProcessarNotas;

   txtTurma.Text := resultado_filtro.cd_turma;
   txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );

   Filtra;
end;

procedure TfrmDigProvaInstitucional.FormCreate(Sender: TObject);
begin
  { Atualizar os Edits dos Filtros AnoSemestre / Turma / CodigoAluno }
  if (frmFichaIndividual <> nil) then
  begin
    if frmFichaIndividual.popFicha.Items[1].Checked then
    begin
      txtAnoSemestre.Text := frmFichaIndividual.tblFichaAnoSemestre.AsString;
      txtTurma.Text := frmFichaIndividual.tblFichaTurma.AsString;
    end
    else
    begin
      txtTurma.Text := frmFichaIndividual.tblFichaTurmaMatricula.AsString;
      txtCodigoAluno.Text := frmFichaIndividual.tblFichaCodigoAluno.AsString;
      txtAnoSemestre.Text := frmFichaIndividual.tblFichaAnoSemestre.AsString;
    end;
  end;

end;

procedure TfrmDigProvaInstitucional.txtTurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin

    if txtTurma.Modified then ProcessarNotas;

    Filtra;
    Key := #0;
  end;
end;

procedure TfrmDigProvaInstitucional.FormDestroy(Sender: TObject);
begin
  frmDigProvaInstitucional := nil;
end;

procedure TfrmDigProvaInstitucional.dbeF1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then SelectNext(ActiveControl,False,True);
end;

procedure TfrmDigProvaInstitucional.dbeRedaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then SelectNext(ActiveControl,False,True);
end;

procedure TfrmDigProvaInstitucional.dbeCodigoKeyDown(Sender: TObject;
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

function TfrmDigProvaInstitucional.FindValue(const aString1:TStringList;
  aValue1 :String):Boolean;
var
  n, x: Integer;
begin
  n := aString1.IndexOf(aValue1);
  if n >= 0 then
    Result := True
  else
    Result := False;

end;

procedure TfrmDigProvaInstitucional.ProcessarNotas;
var
  n : Integer;
begin

  { Se não tiver aluno com nota alterada, Sair }
  if sCodigoAluno.Count <= 0 then Exit;

  DM.db.StartTransaction;
  if sCodigoAluno.Count > 0 then
    frmProcessando.Bar.Max := sCodigoAluno.Count - 1;

  frmProcessando.Show;
  Application.ProcessMessages;

  try
    { Faça do primeiro aluno até o último }
    for n := 0 to sCodigoAluno.Count - 1 do
    begin
      { Selecionar Todas as Disciplinas do Aluno }
      tblInclusao.Close;
      tblInclusao.SQL.Text := 'Select codigoaluno, turma, turmamatricula, anosemestre, curso, disciplina From FichaIndividual';
      tblInclusao.SQL.Add('Where CodigoAluno = :CodigoAluno');
      tblInclusao.SQL.Add('AND turmamatricula = :Turma');
      tblInclusao.SQL.Add('AND AnoSemestre = :AnoSemestre');
      tblInclusao.ParamByName('CodigoAluno').ASInteger := StrToInt(sCodigoAluno.Strings[n]);
      tblInclusao.ParamByName('Turma').AsString := sTurma.Strings[n];
      tblInclusao.ParamByName('AnoSemestre').AsInteger := StrToInt( txtAnoSemestre.Text );
      tblInclusao.Open;

      While not tblInclusao.Eof do
      Begin
         DM.CalcularMediaFinal( tblInclusao.FieldByName('codigoaluno').AsInteger,
                                tblInclusao.FieldByName('anosemestre').AsInteger,
                                DM.getGrupoAtividade(tblInclusao.FieldByName('anosemestre').AsInteger, tblInclusao.FieldByName('curso').AsString, tblInclusao.FieldByName('turma').AsString, tblInclusao.FieldByName('disciplina').AsInteger, tblInclusao.FieldByName('codigoaluno').AsInteger),
                                tblInclusao.FieldByName('turma').AsString,
                                tblInclusao.FieldByName('turmamatricula').AsString
                                );

         tblInclusao.Next;
      End;

      frmProcessando.Bar.Position := n;
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(n+1) + ' de ' +
        IntToStr(frmProcessando.Bar.Max+1) + ' - ' + sCodigoAluno.Strings[n];
      Application.ProcessMessages;
    end;
    frmProcessando.Close;

    sCodigoaluno.Clear;
    sTurma.Clear;

    DM.tblFichaIndividual.SQL.Clear;

    DM.db.Commit;
  except on E:Exception do
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


procedure TfrmDigProvaInstitucional.SpeedButton2Click(Sender: TObject);
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
  txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
  Filtra;
end;

procedure TfrmDigProvaInstitucional.txtCodigoAlunoExit(Sender: TObject);
var
   qyListaMatriculas : TUMZReadOnlyQuery;
begin
   if txtCodigoAluno.Text = '' then Exit;

   while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

   DM.CriarConsulta(qyListaMatriculas);

   qyListaMatriculas.SQL.Add( 'SELECT cd_pessoa as Codigo , nm_pessoa as Nome , Matriculas.AnoSemestre, ' +
      'Matriculas.Curso, Matriculas.Turma FROM Pessoas LEFT JOIN ' +
      ' Matriculas ON ( Pessoas.cd_pessoa = Matriculas.CodigoAluno ) ' +
      ' WHERE Pessoas.cd_Pessoa = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' );
   qyListaMatriculas.SQL.Add( ' order by Matriculas.AnoSemestre' );
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
      popTurmas.Popup( frmDigProvaInstitucional.Left + txtTurma.Left, frmDigProvaInstitucional.Top + txtTurma.Top );

//  frm_Sel_Pessoa.qryPessoa.Close;

   Filtra;
end;

procedure TfrmDigProvaInstitucional.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;



procedure TfrmDigProvaInstitucional.txtCodigoAlunoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if sCodigoAluno.Count > 0 then ProcessarNotas;
    Filtra;
    SelectNext(ActiveControl,True,True);
  end;
end;

procedure TfrmDigProvaInstitucional.txtAnoSemestreExit(Sender: TObject);
begin
  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

  Filtra;
end;

procedure TfrmDigProvaInstitucional.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEy = #13 then
  begin
    intAnoSemestre := StrToInt(txtAnoSemestre.Text);
    Key := #0;
  end;
end;

procedure TfrmDigProvaInstitucional.dbeProvaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if TUMZQuery( TDataSource( TDBEdit(Sender).DataSource ).DataSet).FieldByName(
    TDBEdit(Sender).DataField ) is TFloatField then
  begin
    if Key = '.' then Key := DecimalSeparator;
  end;

  if Key = #13 then
  begin
    dbeMedia.Setfocus;
{    if dbeF1.Enabled then dbeF1.SetFocus else
    begin
      SalvaRegistro;
      txt.SetFocus;
    end; }
    Key := #0;
  end;

end;

procedure TfrmDigProvaInstitucional.dbeMediaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if TUMZQuery( TDataSource( TDBEdit(Sender).DataSource ).DataSet).FieldByName(
    TDBEdit(Sender).DataField ) is TFloatField then
  begin
    if Key = '.' then Key := DecimalSeparator;
  end;

  if Key = #13 then
  begin
      SalvaRegistro;
      dbeReda.SetFocus;
      Key := #0;
  end;

end;

procedure TfrmDigProvaInstitucional.tblFichaCalcFields(DataSet: TDataSet);
var
  dblMedia : Double;
begin

  qry.Close;
  qry.ParamByName('AnoSemestre').Asinteger := tblFichaAnoSemestre.AsInteger;
  qry.ParamByName('CodigoAluno').AsInteger := tblFichaCodigoAluno.AsInteger;
  qry.ParamByName('Turma').AsString := tblFichaTurma.AsString;
  qry.Open;


// ***************** NOTA PROVA  *******************

  tblFichaNProva.AsString := qryNotaProva.DisplayText;

  if (qryNotaProva.AsFloat = 0) and (qryNotaProva.AsString = '0') then
    tblFichaNProva.AsString := 'ZERO';

  if (qryNotaProva.AsString = '') then
    tblFichaNProva.AsString := '';

// ***************** NOTA REDACAO  *******************

  tblFichaNReda.AsString := qryNotaRedacao.DisplayText;

  if (qryNotaRedacao.AsFloat = 0) and (qryNotaRedacao.AsString = '0') then
    tblFichaNReda.AsString := 'ZERO';

  if (qryNotaRedacao.AsString = '') then
    tblFichaNReda.AsString := '';

// ***************** MEDIA PI  *******************

  tblFichaMPI.AsString := qryMediaInstitucional.DisplayText;

  if (qryMediaInstitucional.AsFloat = 0) and (qryMediaInstitucional.AsString = '0') then
     tblFichaMPI.AsString := 'ZERO';

  if (qryMediaInstitucional.AsString = '') then
    tblFichaMPI.AsString := '';

end;

procedure TfrmDigProvaInstitucional.tblDigProvaNotaRedacaoChange(
  Sender: TField);
begin
   // Calcular a Média da PI conforme a fórmula estabelecida...
   // tblDigProvaMediaInstitucional.AsFloat := tblDigProvaNotaRedacao.Asfloat + tblDigProvaNotaProva.AsFloat;
end;

procedure TfrmDigProvaInstitucional.tblDigProvaNotaProvaChange(
  Sender: TField);
begin
   // tblDigProvaMediaInstitucional.AsFloat := tblDigProvaNotaRedacao.Asfloat + tblDigProvaNotaProva.AsFloat;
end;

procedure TfrmDigProvaInstitucional.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblFicha, pmQtd);

end;

end.

