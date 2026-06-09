unit uDigAulaDadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Db, ZConnection, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, Menus, Variants;

type
  TfrmDigAulasDadas = class(TForm)
    Panel3: TPanel;
    btnFechar: TSpeedButton;
    grd: TDBGrid;
    tblAulas: TUMZQuery;
    dtcFicha: TDataSource;
    Label1: TLabel;
    lblM1: TLabel;
    dbeN1: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbeCodigo: TDBEdit;
    Label7: TLabel;
    txtDisciplina: TEdit;
    btnDisciplina: TSpeedButton;
    Label8: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    Label9: TLabel;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    txtTurma: TEdit;
    btnTurmas: TSpeedButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
    tblDigita: TUMZQuery;
    dsDigita: TDataSource;
    tblAulasanosemestre: TSmallintField;
    tblAulascurso: TStringField;
    tblAulasturma: TStringField;
    tblAulasdisciplina: TIntegerField;
    tblAulasprofessor: TIntegerField;
    tblAulasnumeroaulas: TIntegerField;
    tblAulasordem: TSmallintField;
    tblAulassigla: TStringField;
    tblAulasdescricao: TStringField;
    tblAulasnm_pessoa: TStringField;
    DBText3: TDBText;
    Label5: TLabel;
    txtProfessor: TEdit;
    btnProfessor: TSpeedButton;
    pmQtd: TPopupMenu;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure dbeCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure dtcFichaDataChange(Sender: TObject; Field: TField);
    procedure btnDisciplinaClick(Sender: TObject);
    procedure Filtra;
    procedure dbeE1KeyPress(Sender: TObject; var Key: Char);
    procedure grdCellClick(Column: TColumn);
    procedure SalvaRegistro;
    procedure dbeN1KeyPress(Sender: TObject; var Key: Char);
    procedure btnTurmasClick(Sender: TObject);
    procedure txtDisciplinaKeyPress(Sender: TObject; var Key: Char);
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
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure txtAnoSemestreExit(Sender: TObject);
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure tblAulasAfterPost(DataSet: TDataSet);
    procedure tblAulasNota1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblAulasExame1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblAulasFalta1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnProfessorClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    intAnoSemestre : Integer;
    intDisciplina : Integer;
    sCodigoAluno, sTurma : TStringList; sCodigoGrade: TStringList;
    lngCodigoAluno: Longint;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDigAulasDadas: TfrmDigAulasDadas;

implementation

uses uDM, uFichaIndividual, uFSelecionarTurma, Main, uProcessando,
  uFSelecionarPessoa, uFSelecionarDisciplina, uFSelecionarCurso, uDigFichaIndividual,
  uUMNucleo;

{$R *.DFM}

procedure TfrmDigAulasDadas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDigAulasDadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  { Ao Fechar o Formulário - //rotina para processar notas digitadas; }

  if sCodigoAluno.Count > 0 then ProcessarNotas;

  sCodigoAluno.Free;
  sTurma.Free;
  sCodigoGrade.Free;

  if tblDigita.State in [dsInsert, dsEdit] then tblDigita.Cancel;
  Action := caFree;

end;

procedure TfrmDigAulasDadas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  { Atalho para Fechar }

  case Key of
    VK_F12 : btnFecharClick(nil);
  end;
  
end;

procedure TfrmDigAulasDadas.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   sCodigoAluno := TStringList.Create;
   sTurma := TStringList.Create;
   sCodigoGrade := TStringList.Create;

   if txtAnoSemestre.Text = '' then
   begin
      txtAnoSemestre.text := IntToStr(ano_semestre);
   end;

   intAnoSemestre := StrToInt(txtAnoSemestre.Text);

   // Bloquear Anosemestre
   txtAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre();
   Label9.Visible := txtAnoSemestre.Visible;
   UpDown2.Visible := txtAnoSemestre.Visible;
   grd.Columns[0].Visible := txtAnoSemestre.Visible;

   Filtra;
end;

procedure TfrmDigAulasDadas.Filtra;
begin

 if (txtTurma.Text = '') and (txtDisciplina.Text = '') and (txtProfessor.Text='') then Exit;

  tblAulas.Close;
  tblAulas.SQL.Clear;

  tblAulas.SQL.Add( 'select tp.*, d.*, p.nm_pessoa' );
  tblAulas.SQL.Add( 'from turmasprofessores tp, disciplinas d, pessoas p' );
  tblAulas.SQL.Add( 'where tp.disciplina = d.codigo and tp.curso = d.curso' );
  tblAulas.SQL.Add( 'and tp.professor = p.cd_pessoa' );

  tblAulas.SQL.Add( 'and tp.anosemestre = :anosemestre' );

  if (txtDisciplina.Text <> '') then
    tblAulas.SQL.Add( 'and d.sigla = :sigla' );

  if (txtTurma.Text <> '') Then
     tblAulas.SQL.Add( 'and tp.Turma = :Turma' );

  if (txtProfessor.Text <> '') Then
     tblAulas.SQL.Add( 'and tp.professor = :professor' );


  tblAulas.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;

  if (txtTurma.Text <> '') Then
     tblAulas.ParamByName('Turma').AsString := txtTurma.Text;

  if (txtDisciplina.Text <> '') then
    tblAulas.ParamByName('Sigla').AsString := txtDisciplina.Text;

  if (txtProfessor.Text <> '') Then
     tblAulas.ParamByName('professor').AsInteger := StrToInt(txtProfessor.Text);

  tblAulas.SQL.Add('order by tp.curso, tp.turma, d.ordem, p.nm_pessoa');

  tblAulas.Open;

  DM.tblAvaliacao.Close;
  DM.tblAvaliacao.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  DM.tblAvaliacao.ParamByName('Turma').AsString := txtTurma.Text;
  DM.tblAvaliacao.Open;

  dbeCodigo.SetFocus;

end;


procedure TfrmDigAulasDadas.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
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

procedure TfrmDigAulasDadas.dbeCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key in ['0'..'9'] then Exit;

  if Key = #13 then
  begin

    if dbeCodigo.Modified then
    begin

      tblDigita.Cancel;
      dbeCodigo.SetFocus;
      dbeCodigo.SelectAll;
      Key := #0;
      Exit;

    end;

    SelectNext(ActiveControl, True, True );
    tblDigita.Edit;
    Key := #0;

  end;
end;

procedure TfrmDigAulasDadas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmDigAulasDadas.dtcFichaDataChange(Sender: TObject;
  Field: TField);
begin

  with tblDigita do
  begin

    Close;

    ParamByName('anosemestre').AsInteger := tblAulasanosemestre.AsInteger;
    ParamByName('turma').AsString := tblAulasturma.AsString;
    ParamByName('curso').AsString := tblAulascurso.AsString;
    ParamByName('disciplina').AsInteger := tblAulasdisciplina.AsInteger;
    ParamByName('professor').AsInteger := tblAulasprofessor.AsInteger;

    Open;

  end;

end;

procedure TfrmDigAulasDadas.btnDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplinas }
   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], '', StrToInt(txtAnoSemestre.Text), txtTurma.Text);

   if not resultado_filtro.filtrado then Exit;


   txtDisciplina.Text := resultado_filtro.ds_sigla;
   intDisciplina := resultado_filtro.cd_disciplina;
   ProcessarNotas;
   Filtra;
end;

procedure TfrmDigAulasDadas.dbeE1KeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    if tblDigita.State in [dsInsert, dsEdit] then
      	SalvaRegistro;

    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;

end;

procedure TfrmDigAulasDadas.grdCellClick(Column: TColumn);
begin
  dbeCodigo.SetFocus;
end;

procedure TfrmDigAulasDadas.SalvaRegistro;
var
  xDisciplina, xProfessor : Integer;
  xTurma  : String;
begin

   xDisciplina := tblAulasdisciplina.AsInteger;
   xTurma := tblAulasturma.AsString;
   xProfessor := tblAulasprofessor.AsInteger;

   if tblDigita.State in [dsInsert, dsEdit] then
     tblDigita.Post;

  tblAulas.Close;
  tblAulas.Open;
  tblAulas.Locate('turma;disciplina;professor', VarArrayOf([xTurma, xDisciplina, xProfessor]),[]);

  tblAulas.Next;

  if tblAulas.Eof then
  begin
    Mensagem( 'Digitação chegou ao final da lista.', Application.Title, MB_OK + MB_ICONINFORMATION );
  end;
  
  dbeN1.SetFocus;
  dbeN1.SelectAll;
end;



procedure TfrmDigAulasDadas.dbeN1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if Key = '*' then
   Begin
      tblDigita.Edit;
      TDBEdit(Sender).Field.AsFloat := -2;
      Key := #0;
   End
   else
   if (Key = 'd') or (Key = 'D') then
   Begin
      tblDigita.Edit;
      TDBEdit(Sender).Field.AsFloat := -1;
      Key := #0;
   End
   else
   if Key = '.' then
      Key := DecimalSeparator
   else
   if key = #13 then
   Begin
       SalvaRegistro;
       Key := #0;
   End
end;

procedure TfrmDigAulasDadas.btnTurmasClick(Sender: TObject);
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

procedure TfrmDigAulasDadas.txtDisciplinaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    Filtra;
    Key := #0;
  end;

end;

procedure TfrmDigAulasDadas.txtTurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    Key := #0;
  end;
end;

procedure TfrmDigAulasDadas.txtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_UP then SelectNext(ActiveControl,False,True);

end;

procedure TfrmDigAulasDadas.FormDestroy(Sender: TObject);
begin
  frmDigFichaIndividual := nil;
end;

procedure TfrmDigAulasDadas.dbeF1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then SelectNext(ActiveControl,False,True);
end;

procedure TfrmDigAulasDadas.dbeN1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then SelectNext(ActiveControl,False,True);
end;

procedure TfrmDigAulasDadas.dbeCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP : tblAulas.Prior;
    VK_DOWN : tblAulas.Next;
    VK_RETURN: Key := VK_RETURN;
  else
    Key := 0;
  end;
end;

function TfrmDigAulasDadas.FindValue(const aString1, aString2:TStringList;
  aValue1, aValue2:String):Boolean;
var
  n: Integer;
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

procedure TfrmDigAulasDadas.ProcessarNotas;
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
      { Calcular a média Final, individualmente por aluno }
{      DM.CalcularMediaFinal( StrToInt(sCodigoAluno.Strings[n]),
                             sTurma.Strings[n],
                             StrToInt( txtAnoSemestre.Text ),
                             sCodigoGrade.Strings[n] );

}

// Retirado provisoriamente para verificar uma solução para os clientes que calculam individualmente por aluno/disciplina
{
      DM.CalcularMediaFinal( StrToInt(sCodigoAluno.Strings[n]),
                             sTurma.Strings[n],
                             StrToInt( txtAnoSemestre.Text ));
}

      DM.TotalFaltas(        StrToInt(sCodigoAluno.Strings[n]),
                             sTurma.Strings[n],
                             StrToInt( txtAnoSemestre.Text ));



      { OLIVER - CALCULO_MEDIA - OK - }
      DM.SetaSituacaoFinal(  StrToInt(sCodigoAluno.Strings[n]),
                             sTurma.Strings[n],
                             StrToInt( txtAnoSemestre.Text ) );

      frmProcessando.Bar.Position := n;
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(n+1) + ' de ' +
        IntToStr(frmProcessando.Bar.Max+1) + ' - ' + sCodigoAluno.Strings[n];
      Application.ProcessMessages;
    end;
    frmProcessando.Close;

    sCodigoaluno.Clear;
    sTurma.Clear;
    sCodigoGrade.Clear;

    tblDigita.SQL.Clear;

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


procedure TfrmDigAulasDadas.txtCodigoAlunoExit(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmDigAulasDadas.txtCodigoAlunoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if sCodigoAluno.Count > 0 then ProcessarNotas;
    Filtra;
    SelectNext(ActiveControl,True,True);
  end;
end;

procedure TfrmDigAulasDadas.txtAnoSemestreExit(Sender: TObject);
begin
  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

  Filtra;
end;

procedure TfrmDigAulasDadas.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEy = #13 then
  begin
    intAnoSemestre := StrToInt(txtAnoSemestre.Text);
    Key := #0;
  end;
end;

procedure TfrmDigAulasDadas.tblAulasAfterPost(DataSet: TDataSet);
begin
   DM.tblAvaliacao.Close;
   DM.tblAvaliacao.ParamByName('turma').AsString := tblAulasturma.AsString;
   DM.tblAvaliacao.ParamByName('anosemestre').AsInteger := tblAulasAnoSemestre.AsInteger;
   DM.tblAvaliacao.Open;
end;

procedure TfrmDigAulasDadas.tblAulasNota1GetText(Sender: TField;
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

procedure TfrmDigAulasDadas.tblAulasExame1GetText(Sender: TField;
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
            if Sender.AsFloat = 0 then
                Text := ''
            else
                Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
end;

procedure TfrmDigAulasDadas.tblAulasFalta1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;
   if Sender.AsFloat = 0 then
      Text := ''
   else
      Text := FloatToStr(Sender.AsFloat);

end;

procedure TfrmDigAulasDadas.btnProfessorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

  if resultado_filtro.filtrado then
  Begin
     lngCodigoAluno := resultado_filtro.cd_pessoa;
  End
  else Exit;

  if sCodigoAluno.Count > 0 then ProcessarNotas;

  txtProfessor.Text := IntToStr(lngCodigoAluno);
  txtTurma.Text := resultado_filtro.cd_turma;
  txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
  Filtra;

end;

procedure TfrmDigAulasDadas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblAulas, pmQtd);

end;

end.

