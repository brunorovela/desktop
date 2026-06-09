unit uRelEscolares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, wwidlg, Mask, StdCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Db, ZConnection, ucrpe32,
  Menus, wwDialog;

type
  TfrmRelEscolares = class(TForm)
    lblTurma: TLabel;
    lblProfessor: TLabel;
    lblAnoSemestre: TLabel;
    btn: TSpeedButton;
    lblDisciplina: TLabel;
    SpeedButton1: TSpeedButton;
    lblCurso: TLabel;
    btnCurso: TSpeedButton;
    btnTurmas: TSpeedButton;
    lblBimestre: TLabel;
    btnImprimir: TButton;
    btnFechar: TButton;
    txtTurma: TEdit;
    txtProfessor: TEdit;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    txtDisciplina: TEdit;
    txtCurso: TEdit;
    txtBimestre: TMaskEdit;
    UpDown2: TUpDown;
    lblCodigoAluno: TLabel;
    SpeedButton2: TSpeedButton;
    txtCodigoAluno: TEdit;
    Tree: TTreeView;
    tblRel: TUMZQuery;
    tblRelRelatorio: TStringField;
    tblRelTipo: TStringField;
    tblRelSub: TStringField;
    tblRelArquivo: TStringField;
    tblRelParametros: TStringField;
    tblRelFormula: TStringField;
    tblRelConteudoFormula: TStringField;
    tblRelEspecial: TStringField;
    popTurmas: TPopupMenu;
    Label1: TLabel;
    meObs: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure btnTurmasClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure TreeClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure MyClick(Sender:TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    lngProfessor : Longint;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEscolares: TfrmRelEscolares;

implementation

uses uDM, uSelTurmas, uSelProfessores, uSelAlunos, Main,
  uBoletimRegular, uDocumentacao, uBoletimSupletivo, uRelPI, uBolSuperior,
  RelaDiaExame, RClasseExame, uNotasProf, uAta2aEpoca,
  uClasse2aEpoca, uDocumentosPendentes, uSel_Pessoas;

{$R *.DFM}




procedure TfrmRelEscolares.SpeedButton1Click(Sender: TObject);
begin
  { Pesquisar Disciplina }

  Dm.tblDisciplinas.Close;
  DM.tblDisciplinas.SQL.Clear;
  DM.tblDisciplinas.SQL.Add( 'select * from Disciplinas');
  if txtCurso.Text <> '' then
     Dm.tblDisciplinas.SQL.Add('Where Curso = ''' + txtCurso.Text + '''');
  Dm.tblDisciplinas.SQL.Add( 'order by Sigla' );
  DM.tblDisciplinas.Prepare;
  DM.tblDisciplinas.Open;
  if LookupDisciplinas.Execute then
  begin
    txtDisciplina.Text := DM.tblDisciplinasCodigo.AsString;
  end;
end;

procedure TfrmRelEscolares.FormShow(Sender: TObject);
var
  wAno, wMes, wDia : Word;
  i:Integer;
  str1: String;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Montar o TreeView }

  DecodeDate(DataHoje,wAno,wMes,wDia);

  if wMes >= 7 then
     txtAnoSemestre.text := FormatDateTime('yyyy',DataHoje)+'2'
  else
     txtAnoSemestre.text := FormatDateTime('yyyy',DataHoje)+'1';

  { Limpar os Edits }
  txtCurso.Text := '';
  txtTurma.Text := '';
  txtProfessor.Text := '';
  txtDisciplina.Text := '';
  txtCodigoAluno.Text := '';

  { Adicionar os Relatório na Árvore }
  tblRel.Open;
  Tree.Items.Add( Tree.TopItem, tblRelTipo.AsString );
  i := Tree.Items.Count - 1;
  str1 := tblRelTipo.AsString;

  while not tblRel.Eof do
  begin
    if tblRelTipo.AsString <> str1 then
    begin
      Tree.Items.Add( Tree.TopItem, tblRelTipo.AsString );
      str1 := tblRelTipo.AsString;
      i := Tree.Items.Count - 1;
    end;
    Tree.Items.AddChild( Tree.Items[i], tblRelRelatorio.AsString );
    tblRel.Next;
  end;

  Tree.FullCollapse;

end;

procedure TfrmRelEscolares.btnCursoClick(Sender: TObject);
begin
  { Pesquisar Cursos }
  DM.tblCursos.Close;
  DM.tblCursos.SQL.Clear;
  DM.tblCursos.SQL.Add( 'select * from Cursos where AnoSemestre = :AnoSemestre' );
  DM.tblCursos.SQL.Add( 'order by AnoSemestre DESC, Codigo ASC' );
  DM.tblCursos.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  DM.tblCursos.Prepare;
  DM.tblCursos.Open;

  if LookupCursos.Execute then
  begin
    txtCurso.Text := DM.tblCursosCodigo.AsString;
  end;

end;

procedure TfrmRelEscolares.btnTurmasClick(Sender: TObject);
begin
  { Pesquisar Turmas }

  frmSelTurmas.ShowModal;
  if not frmSelTurmas.flgSearch then Exit;
  txtTurma.Text := frmSelTurmas.qryTurmasTurma.AsString;
  txtAnoSemestre.Text := frmSelTurmas.qryTurmasAnoSemestre.AsString;
end;

procedure TfrmRelEscolares.btnClick(Sender: TObject);
begin
  { Pesquisar Professor }

  if frmSelProfessores.ShowModal = mrOk then
  begin
    lngProfessor := frmSelProfessores.tblSelProfessorProfessor.AsInteger;
    txtProfessor.Text := frmSelProfessores.tblSelProfessorApelido.AsString;

    DM.tblProfessoresDisciplinas.Close;
    DM.tblProfessoresDisciplinas.ParamByName('Codigo').AsInteger :=
      frmSelProfessores.tblSelProfessorProfessor.AsInteger;
    DM.tblProfessoresDisciplinas.Open;

    txtDisciplina.Text := DM.tblProfessoresDisciplinasSigla.AsString;
  end;
end;

procedure TfrmRelEscolares.SpeedButton2Click(Sender: TObject);
begin
  { Pesquisar Aluno }
  
  if frm_Sel_Pessoa.flgSearch then
  Begin
     txtCodigoAluno.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('cd_pessoa').AsString;
     txtTurma.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('turma').AsString;
     txtAnoSemestre.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('anosemestre').AsString;

     frm_Sel_Pessoa.qryPessoa.Close;
  End
  else Exit;
end;


procedure TfrmRelEscolares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblRel.Close;

  frmBoletimRegular.Free;
  frmBoletimRegular := nil;
  frmBoletimSupletivo.Free;
  frmBoletimSupletivo := nil;
  Action := caFree;

end;

procedure TfrmRelEscolares.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelEscolares.TreeClick(Sender: TObject);
var
  xField : String;
begin

  { Limpar os Edits e Desativá-los }
{  for n := 0 to ComponentCount - 1 do
  begin
    if (Components[n] is TEdit) then TEdit(Components[n]).Enabled := False;
    if (Components[n] is TEdit) then TEdit(Components[n]).Text := '';
    if (Components[n] is TLabel) then TEdit(Components[n]).Enabled := False;
  end;}

  tblRel.Locate('Relatorio', Tree.Selected.Text, [loCaseInsensitive]);

  xField := tblRelParametros.AsString;

  { Verificar os Parametros que tem que ficar ligados }

  txtAnoSemestre.Enabled := Pos('AnoSemestre', xField) > 0;
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;

  txtBimestre.Enabled := Pos('Bimestre', xField) > 0;
  lblBimestre.Enabled := txtBimestre.Enabled;

  txtCurso.Enabled := Pos('Curso', xField) > 0;
  lblCurso.Enabled := txtCurso.Enabled;

  txtTurma.Enabled := Pos('Turma', xField) > 0;
  lblTurma.Enabled := txtTurma.Enabled;

  txtDisciplina.Enabled := Pos('Disciplina', xField) > 0;
  lblDisciplina.Enabled := txtDisciplina.Enabled;

  txtCodigoAluno.Enabled := Pos('CodigoAluno', xField) > 0;
  lblCodigoAluno.Enabled := txtCodigoAluno.Enabled;

  txtProfessor.Enabled := Pos('Professor', xField) > 0;
  lblProfessor.Enabled := txtProfessor.Enabled;

end;

procedure TfrmRelEscolares.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
begin
  { Incremento do AnoSemestre }

  intAno := StrToInt(Copy(txtAnoSemestre.Text,1,4));
  intSemestre := StrToInt(Copy(txtAnoSemestre.Text,5,1));

  if Button = btNext then
  begin
    Inc( intSemestre );
    if intSemestre = 3 then
    begin
      Inc( intAno );
      intSemestre := 1;
    end;
  end
  else
  begin
    Dec( intSemestre );
    if intSemestre = 0 then
    begin
      Dec( intAno );
      intSemestre := 2;
    end;
  end;

  txtAnoSemestre.Text := IntToStr( intAno ) + IntToStr( intSemestre );

end;

procedure TfrmRelEscolares.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
var
  intBimestre : Integer;
begin
  { Incremento do Bimestre }
  intBimestre := StrToInt(txtBimestre.Text);

  if Button = btNext then
  begin
    Inc( intBimestre );
  end
  else
  begin
    Dec( intBimestre );
  end;

  txtBimestre.Text := IntToStr( intBimestre );
end;


procedure TfrmRelEscolares.txtCodigoAlunoExit(Sender: TObject);
begin
  { Ao digitar o Código do Aluno, Mostrar as Turmas }

  if txtCodigoAluno.Text = '' then Exit;

//#Novo
{
  while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

  frmSelAlunos.qryAlunos.Close;
  frmSelAlunos.qryAlunos.SQL.Clear;
  frmSelAlunos.qryAlunos.SQL.Add( 'SELECT Codigo , Nome , Matriculas.AnoSemestre, ' +
    'Matriculas.Curso, Matriculas.Turma, Alunos.Situacao FROM Alunos LEFT JOIN ' +
    ' Matriculas ON ( Alunos.Codigo = Matriculas.CodigoAluno ) ' +
    ' WHERE Alunos.Codigo = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' );
  frmSelAlunos.qryAlunos.SQL.Add( ' order by Matriculas.AnoSemestre' );
  frmSelAlunos.qryAlunos.ParamByName('Codigo').AsInteger := StrToInt( txtCodigoAluno.Text );
  frmSelAlunos.qryAlunos.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  frmSelAlunos.qryAlunos.Prepare;
  frmSelAlunos.qryAlunos.Open;

  while not frmSelAlunos.qryAlunos.Eof do
  begin
    popTurmas.Items.Add(
      NewItem( frmSelAlunos.qryAlunosTurma.AsString, 0, False, True, MyClick, 0, '' ) );
    frmSelAlunos.qryAlunos.Next;
  end;

  if popTurmas.Items.Count = 1 then
    txtTurma.Text := frmSelAlunos.qryAlunosTurma.AsString
  else
    popTurmas.Popup( frmImpFicha.Left + txtTurma.Left, frmImpFicha.Top + txtTurma.Top );

  frmSelAlunos.qryAlunos.Close;

}

end;

procedure TfrmRelEscolares.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;



procedure TfrmRelEscolares.btnImprimirClick(Sender: TObject);
Var Aluno : Integer;
begin
  // Passar os Parâmetros da Empresa
  Dm.tblParametros.Open;
  Dm.tblParametros.First;


  tblRel.Locate('Relatorio', Tree.Selected.Text, [loCaseInsensitive]);

  { Boletim Regular }
  if tblRelArquivo.AsString = 'Boletim_Regular'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimRegular = nil then
          frmBoletimRegular := TfrmBoletimRegular.Create(Application);

       if frmBoletimRegular.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 0 )
       Then
       Begin
          frmBoletimRegular.ObsTurma := meObs.Lines.Text;
          frmBoletimRegular.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Documentos Individual }
  if tblRelArquivo.AsString = 'Documentos_Boletim'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmDocumentosPendentes = nil then
          frmDocumentosPendentes := TfrmDocumentosPendentes.Create(Application);

       if frmDocumentosPendentes.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 0 )
       Then
       Begin
          frmDocumentosPendentes.ObsTurma := meObs.Lines.Text;
          frmDocumentosPendentes.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Relatório de Documentação', mtInformation, [mbOk],0);
  End;


  { Boletim Regular - Exame }
  if tblRelArquivo.AsString = 'Boletim_Regular_Exame'
  Then Begin
       try
	  Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimRegular = nil then
          frmBoletimRegular := TfrmBoletimRegular.Create(Application);

       if frmBoletimRegular.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 2 )
       Then
       Begin
          frmBoletimRegular.ObsTurma := meObs.Lines.Text;
          frmBoletimRegular.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Boletim Regular 2aEpoca }
  if tblRelArquivo.AsString = 'Boletim_Regular_2aEpoca'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimRegular = nil then
          frmBoletimRegular := TfrmBoletimRegular.Create(Application);

       if frmBoletimRegular.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 4 )
       Then
       Begin
          frmBoletimRegular.ObsTurma := meObs.Lines.Text;
          frmBoletimRegular.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Boletim Supletivo }
  if tblRelArquivo.AsString = 'Boletim_Supletivo'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimSupletivo = nil then
          frmBoletimSupletivo := TfrmBoletimSupletivo.Create(Application);

       if frmBoletimSupletivo.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 0 )
       Then
       Begin
          frmBoletimSupletivo.ObsTurma := meObs.Lines.Text;
          frmBoletimSupletivo.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Boletim Supletivo Exame }
  if tblRelArquivo.AsString = 'Boletim_Supletivo_Exame'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimSupletivo = nil then
          frmBoletimSupletivo := TfrmBoletimSupletivo.Create(Application);

       if frmBoletimSupletivo.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 2 )
       Then
       Begin
	  frmBoletimSupletivo.ObsTurma := meObs.Lines.Text;
          frmBoletimSupletivo.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Boletim Supletivo 2aEpoca } 
  if tblRelArquivo.AsString = 'Boletim_Supletivo_2aepoca'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimSupletivo = nil then
          frmBoletimSupletivo := TfrmBoletimSupletivo.Create(Application);

       if frmBoletimSupletivo.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 4 )
       Then
       Begin
          frmBoletimSupletivo.ObsTurma := meObs.Lines.Text;
          frmBoletimSupletivo.QuickRep1.Preview
       End
       Else
	  Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Boletim Superior }
  if tblRelArquivo.AsString = 'Boletim_Superior'
  Then Begin
       try
          Aluno := StrToInt(txtCodigoAluno.Text);
       Except
          Aluno := 0
       End;

       IF frmBoletimSuperior = nil then
          frmBoletimSuperior := TfrmBoletimSuperior.Create(Application);
          
       if frmBoletimSuperior.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), Aluno, 0 )
       Then
       Begin
          frmBoletimSuperior.ObsTurma := meObs.Lines.Text;
          frmBoletimSuperior.QuickRep1.Preview
       End
       Else
          Messagedlg('Informações não são suficientes para gerar Boletim', mtInformation, [mbOk],0);
  End;

  { Relatório de Documentação }
  if tblRelArquivo.AsString = 'Documentos_Pendentes' Then
  Begin

       IF frmRelDocumentacao = nil then
          frmRelDocumentacao := TfrmRelDocumentacao.Create(Application);

       if frmRelDocumentacao.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text))
       Then
          frmRelDocumentacao.pagina.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);

      Exit;
  End;

  { Relatório de Documentação }
  if tblRelArquivo.AsString = 'PI' Then
  Begin

       IF frmRelProvaInstitucional = nil then
          frmRelProvaInstitucional := TfrmRelProvaInstitucional.Create(Application);

       if frmRelProvaInstitucional.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text))
       Then
          frmRelProvaInstitucional.pagina.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);
      Exit;
  End;

  { Relatório de Notas para o Professor - Superior }
  if tblRelArquivo.AsString = 'Notas_Professor' Then
  Begin

       IF fmNotasProf = nil then
          fmNotasProf := TfmNotasProf.Create(Application);

       if fmNotasProf.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), txtDisciplina.Text)
       Then
          fmNotasProf.quickRep1.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);
      Exit;
  End;

  { Ata da 2aEpoca }
  if tblRelArquivo.AsString = 'Ata_2aEpoca' Then
  Begin

       IF frmAta2aEpoca = nil then
          frmAta2aEpoca := TfrmAta2aEpoca.Create(Application);

       if frmAta2aEpoca.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), txtDisciplina.Text)
       Then
          frmAta2aEpoca.quickRep1.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);
      Exit;
  End;

  { Ata da 2a Epoca do Conselho }
  if tblRelArquivo.AsString = 'Ata_2aEpoca_Classe' Then
  Begin

       IF fmClasse2aEpoca = nil then
          fmClasse2aEpoca := TfmClasse2aEpoca.Create(Application);

       if fmClasse2aEpoca.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), txtDisciplina.Text)
       Then
          fmClasse2aEpoca.quickRep1.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);
      Exit;
  End;

  { Relacao de Alunos em Exame }
  if tblRelArquivo.AsString = 'Relacao_Exame' Then
  Begin

       IF frmRelaDiaExame = nil then
          frmRelaDiaExame := TfrmRelaDiaExame.Create(Application);

       if frmRelaDiaExame.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), txtDisciplina.Text)
       Then
          frmRelaDiaExame.Pagina.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);
      Exit;
  End;


  { Ata de Exame do Conselho }
  if tblRelArquivo.AsString = 'Ata_Exame_Classe' Then
  Begin

       IF fmClasseExame = nil then
          fmClasseExame := TfmClasseExame.Create(Application);

       if fmClasseExame.PreparaImpressao(txtCurso.Text, txtTurma.Text,
                            StrToInt(txtAnoSemestre.Text), txtDisciplina.Text)
       Then
          fmClasseExame.quickRep1.Preview
       Else
          Messagedlg('Informações não são suficientes para gerar Relatorio', mtInformation, [mbOk],0);
      Exit;
  End;

end;

end.

