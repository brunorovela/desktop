unit uRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, ZConnection, StdCtrls, Mask,
  Menus, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UCrpe32, UCrpeClasses;

type
  Tfrm_Relatorios = class(TForm)
    Bevel4: TBevel;
    Panel3: TPanel;
    pnDados: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    Bevel6: TBevel;
    pnDigitacao: TPanel;
    Bevel7: TBevel;
    Tree: TTreeView;
    ImageList1: TImageList;
    qRelatorios: TUMZQuery;
    qRelatoriosnm_relatorio: TStringField;
    qRelatorioscd_modulo: TIntegerField;
    qRelatoriosnm_arquivo: TStringField;
    qRelatoriosds_parametros: TStringField;
    qRelatoriosds_Formula: TStringField;
    qRelatoriosds_ConteudoFormula: TStringField;
    qRelatoriosds_Especial: TStringField;
    lblAnoSemestre: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    qRelatoriosds_grupo: TStringField;
    lblTurma: TLabel;
    lblProfessor: TLabel;
    btnCodigoProfessor: TSpeedButton;
    lblDisciplina: TLabel;
    btnCodigoDisciplina: TSpeedButton;
    lblCurso: TLabel;
    btnCodigoCurso: TSpeedButton;
    btnCodigoTurma: TSpeedButton;
    lblBimestre: TLabel;
    lblCodigoAluno: TLabel;
    btnCodigoAluno: TSpeedButton;
    txtTurma: TEdit;
    txtProfessor: TEdit;
    txtDisciplina: TEdit;
    txtCurso: TEdit;
    txtBimestre: TMaskEdit;
    UpDown2: TUpDown;
    txtCodigoAluno: TEdit;
    popTurmas: TPopupMenu;
    lbDepartamento: TLabel;
    txtDepartamento: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    qRelatoriossn_disponivel: TStringField;
    qRelatoriosds_formula_grupo: TStringField;
    qRelatoriosnm_cabecalho: TStringField;
    qRelatoriossn_impressao_numero: TStringField;
    qRelatorioscd_relatorio: TIntegerField;
    sbImprimir: TSpeedButton;
    sbFechar: TSpeedButton;
    sbPropriedades: TSpeedButton;
    lblData: TLabel;
    ckDtFiltrar: TCheckBox;
    lblDtInicial: TLabel;
    txtDtInicial: TDateTimePicker;
    lblDtFinal: TLabel;
    txtDtFinal: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure btnCodigoDisciplinaClick(Sender: TObject);
    procedure btnCodigoProfessorClick(Sender: TObject);
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure MyClick(Sender:TObject);
    procedure TreeClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbImprimirClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPropriedadesClick(Sender: TObject);
    procedure ckDtFiltrarClick(Sender: TObject);
    function PerguntaVerRelatorio(): integer;
  private
    { Private declarations }
  public
    { Public declarations }
    Modulo : Smallint;
  end;

var
  frm_Relatorios: Tfrm_Relatorios;

implementation

uses uDM, uSelTurmas, uSelPessoas, Main, uSelDepartamento, uSelCursos,
  uSelDisciplinas;

{$R *.DFM}

procedure Tfrm_Relatorios.FormShow(Sender: TObject);
var
  i:Integer;
  str1: String;
  treeNode : TTreeNode;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  txtCurso.Clear;
  txtTurma.Clear;
  txtDisciplina.Clear;
  txtCodigoAluno.Clear;
  txtProfessor.Clear;

  { Montar o TreeView }

  txtAnoSemestre.text := IntToStr(ano_semestre);

  { Adicionar os Relatório na Árvore }
  qRelatorios.Close;
  qRelatorios.ParamByName('modulo').ASInteger := modulo;
  qrelatorios.Open;

  Tree.Items.Clear;

  Tree.Items.Add( Tree.TopItem, qRelatoriosds_Grupo.AsString );

  i := Tree.Items.Count - 1;

  str1 := qRelatoriosds_grupo.AsString;

  while not qRelatorios.Eof do
  begin

    if qRelatoriosds_grupo.AsString <> str1 then
    begin
      Tree.Items.Add( Tree.TopItem, qRelatoriosds_grupo.AsString );
      str1 := qRelatoriosds_grupo.AsString;
      i := Tree.Items.Count - 1;
    end;

    treeNode := Tree.Items.AddChild( Tree.Items[i], qRelatoriosnm_relatorio.AsString );

    treeNode.ImageIndex := 1;
    
    qRelatorios.Next;
    
  end;

  Tree.FullCollapse;

end;


procedure Tfrm_Relatorios.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  { Incremento do AnoSemestre }

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

end;


procedure Tfrm_Relatorios.btnCodigoCursoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSelCursos, frmSelCursos);

  { Pesquisar Cursos }
  frmSelCursos.ShowModal;
  if frmSelCursos.flgSearch then
  Begin
     txtCurso.Text := frmSelCursos.qryCursoscodigo.AsString;
     txtAnoSemestre.Text := frmSelCursos.qryCursosanosemestre.AsString;
  end;
  frmSelCursos.Free();

  
end;

procedure Tfrm_Relatorios.btnCodigoTurmaClick(Sender: TObject);
begin
  { Pesquisar Turmas }

  Application.CreateForm(TfrmSelTurmas, frmSelTurmas);
  
  frmSelTurmas.ShowModal;
  if not frmSelTurmas.flgSearch then Exit;
  txtTurma.Text := frmSelTurmas.qryTurmasTurma.AsString;
  txtAnoSemestre.Text := frmSelTurmas.qryTurmasAnoSemestre.AsString;

  frmSelTurmas.Free();
end;

procedure Tfrm_Relatorios.btnCodigoDisciplinaClick(Sender: TObject);
begin
  { Pesquisar Disciplina }

  Application.CreateForm(TfrmSelDisciplinas, frmSelDisciplinas);

  if txtAnoSemestre.Enabled then
     frmSelDisciplinas.PadraoAnosemestre := StrToInt(txtAnoSemestre.Text);
  if txtCurso.Enabled then
     frmSelDisciplinas.PadraoCurso := txtCurso.Text;
  if txtTurma.Enabled then
     frmSelDisciplinas.PadraoTurma := txtturma.Text;
  if txtProfessor.Enabled then
     if txtProfessor.Text <> '' then
        frmSelDisciplinas.PadraoProfessor := StrToInt(txtProfessor.Text);

  frmSelDisciplinas.ShowModal;
  if frmSelDisciplinas.flgSearch then
  Begin
     txtDisciplina.Text := frmSelDisciplinas.qryCursoscodigo.AsString;
  end;

  frmSelDisciplinas.Free();
end;

procedure Tfrm_Relatorios.btnCodigoProfessorClick(Sender: TObject);
begin
  { Pesquisar Aluno }

  Application.CreateForm(Tfrm_SelPessoa, frm_SelPessoa);

  frm_SelPessoa.ShowModal;

  if frm_SelPessoa.flgSearch then
  Begin
     txtProfessor.Text := frm_SelPessoa.qryPessoa.FieldByName('cd_pessoa').AsString;
     if txtTurma.Text = '' Then
     Begin
	    txtTurma.Text := frm_SelPessoa.qryPessoa.FieldByName('turma').AsString;
	    txtAnoSemestre.Text := frm_SelPessoa.qryPessoa.FieldByName('anosemestre').AsString;
     End;
  End;

  frm_SelPessoa.Free();
end;

procedure Tfrm_Relatorios.txtCodigoAlunoExit(Sender: TObject);
Begin
{  if txtCodigoAluno.Text = '' then Exit;

  while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

  frm_sel_pessoa.qryPessoa.Close;
  frm_sel_pessoa.qryPessoa.SQL.Clear;
  frm_sel_pessoa.qryPessoa.SQL.Add( 'SELECT cd_pessoa, nm_pessoa , Matriculas.AnoSemestre, ' +
    'Matriculas.Curso, Matriculas.Turma FROM Pessoas LEFT JOIN ' +
    ' Matriculas ON ( Pessoas.cd_pessoa = Matriculas.CodigoAluno ) ' +
    ' WHERE Pessoas.cd_pessoa = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' );
  frm_sel_pessoa.qryPessoa.SQL.Add( ' order by Matriculas.AnoSemestre' );
  frm_sel_pessoa.qryPessoa.ParamByName('Codigo').AsInteger := StrToInt( txtCodigoAluno.Text );
  frm_sel_pessoa.qryPessoa.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  frm_sel_pessoa.qryPessoa.Prepare;
  frm_sel_pessoa.qryPessoa.Open;

  while not frm_sel_pessoa.qryPessoa.Eof do
  begin
    popTurmas.Items.Add(
      NewItem( frm_sel_pessoa.qryPessoa.FieldByName('Turma').AsString, 0, False, True, MyClick, 0, '' ) );
    frm_sel_pessoa.qryPessoa.Next;
  end;

  if popTurmas.Items.Count = 1 then
       txtTurma.Text := frm_sel_pessoa.qryPessoa.FieldByNAme('Turma').AsString;

//  frm_sel_pessoa.qryPessoa.Close;
}
end;

procedure Tfrm_Relatorios.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;


procedure Tfrm_Relatorios.TreeClick(Sender: TObject);
var
  xField : String;
begin

  if not qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]) Then
  Begin
      { Não existe o relatório, desabilitar tudo }
      lblAnoSemestre.Enabled := False;
      txtAnoSemestre.Enabled := False;
      txtBimestre.Enabled := False;
      lblBimestre.Enabled := False;
      lbDepartamento.Enabled := False;
      txtDepartamento.Enabled := False;
      btnCodigoDepartamento.Enabled := False; 
      txtCurso.Enabled := False;
      lblCurso.Enabled := False;
      btnCodigoCurso.Enabled := False;
      txtTurma.Enabled := False;
      lblTurma.Enabled := False;
      btnCodigoTurma.Enabled := False;
      txtDisciplina.Enabled := False;
      lblDisciplina.Enabled := False;
      btnCodigoDisciplina.Enabled := False;
      txtCodigoAluno.Enabled := False;
      lblCodigoAluno.Enabled := False;
      btnCodigoAluno.Enabled := False;
      txtProfessor.Enabled := False;
      lblProfessor.Enabled := False;

      lblData.Enabled := false;
      ckDtFiltrar.Enabled := false;
      ckDtFiltrar.Checked := false;
      ckDtFiltrarClick(Sender);

      btnCodigoProfessor.Enabled := False;

      sbImprimir.Enabled := False;
      Exit;
  End;

  sbImprimir.Enabled := True;


  xField := lowercase(qRelatoriosds_parametros.AsString);

  { Verificar os Parametros que tem que ficar ligados }

  txtAnoSemestre.Enabled := Pos('.anosemestre', xField) > 0;
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;

  txtBimestre.Enabled := Pos('.bimestre', xField) > 0;
  lblBimestre.Enabled := txtBimestre.Enabled;

  txtDepartamento.Enabled := Pos('.depto', xField) > 0;
  lbDepartamento.Enabled := txtDepartamento.Enabled;
  btnCodigoDepartamento.Enabled := txtDepartamento.Enabled;

  txtCurso.Enabled := Pos('.curso', xField) > 0;
  lblCurso.Enabled := txtCurso.Enabled;
  btnCodigoCurso.Enabled := Pos('.curso', xField) > 0;

  txtTurma.Enabled := Pos('.turma', xField) > 0;
  lblTurma.Enabled := txtTurma.Enabled;
  btnCodigoTurma.Enabled := Pos('.turma', xField) > 0;

  txtDisciplina.Enabled := Pos('.disciplina', xField) > 0;
  lblDisciplina.Enabled := txtDisciplina.Enabled;
  btnCodigoDisciplina.Enabled := Pos('.disciplina', xField) > 0;

  txtCodigoAluno.Enabled := (Pos('.codigoaluno', xField) > 0) or (Pos('.cd_pessoa', xField) > 0) ;
  lblCodigoAluno.Enabled := txtCodigoAluno.Enabled;
  btnCodigoAluno.Enabled := (Pos('.codigoaluno', xField) > 0) or (Pos('.cd_pessoa', xField) > 0);

  txtProfessor.Enabled := Pos('.professor', xField) > 0;
  lblProfessor.Enabled := txtProfessor.Enabled;
  btnCodigoProfessor.Enabled := Pos('.professor', xField) > 0;

  lblData.Enabled := (Pos('data', xField) > 0) or (Pos('.dt', xField) > 0);
  txtDtInicial.DateTime := DataHoje;
  txtDtFinal.DateTime := DataHoje;
  ckDtFiltrar.Enabled := lblData.Enabled;
  ckDtFiltrar.Checked := lblData.Enabled;
  ckDtFiltrarClick(Sender);

end;


procedure Tfrm_Relatorios.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Relatorios.btnImprimirClick(Sender: TObject);
var
  //str: String;
  SFormula : String;
  //NomeRel : String;
  Formula : ARRAY of String;
  Valores : ARRAY of String;
  xField : String;

  Parametros : String;
  pAtual : String;

  //resposta : boolean;
  //nro_impresso : Integer;
  //nro_str : String;
  filtro_show : string;

  strFor : String;

  op : String;

begin


//    SetLength(Valores, 1);

    qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

    xField := qRelatoriosnm_arquivo.AsString;

    if Trim(xField) = '' Then Exit;

    SFormula := '';
    op := '';

    Parametros :=  LowerCase(qRelatoriosds_parametros.AsString); //Matriculas.AnoSemestre;Matriculas.Turma;

    while Length(Trim(Parametros)) > 1 do Begin

	  pAtual := Copy(Parametros, 1, Pos(';', Parametros) - 1);
	  Parametros := Copy(PArametros, Pos(';', Parametros)+1, Length(parametros));

	  { Verificar qual é o parâmetro }

	  if Pos('.anosemestre', pAtual) > 0 Then
	  Begin
	      SFormula := SFormula + op + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;

        filtro_show := filtro_show + '"ANO/SEMESTRE = ' + txtAnoSemestre.Text + '" + CHR(13) + ';

	      op := ' and ';
	  End;

	  if  Pos('.bimestre', pAtual) > 0 Then
	  Begin
	      SFormula := SFormula + op + '{' + pAtual +'} = ' + txtBimestre.Text ;

        filtro_show := filtro_show + '"AVALIAÇÃO = ' + txtBimestre.Text + '" + CHR(13) + ';

	      op := ' and ';
	  End;

	  if Pos('.curso', pAtual) > 0 Then
	  Begin
	      if txtCurso.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = "' + txtCurso.Text + '"' ;

           filtro_show := filtro_show + '"CURSO = ' + txtCurso.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;

	  if Pos('.depto', pAtual) > 0 Then
	  Begin
	      if txtDepartamento.Text <> '' Then
	      Begin
      		 SFormula := SFormula + op + '{' + pAtual +'} = ' + txtDepartamento.Text  ;

           filtro_show := filtro_show + '"DEPARTAMENTO = ' + txtDepartamento.Text + '" + CHR(13) + ';

      		 op := ' and ';
	      End;
	  End;


	  if Pos('.turma', pAtual) > 0 Then
	  Begin
	      if txtTurma.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = "' + txtTurma.text +  '"' ;

           filtro_show := filtro_show + '"TURMA = ' + txtTurma.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;

	  if Pos('.disciplina', pAtual) > 0 Then
	  Begin
	      if txtDisciplina.Text <> '' Then
	      Begin
            SFormula := SFormula + op + '{' + pAtual +'} = ' + txtDisciplina.Text ;

            filtro_show := filtro_show + '"DISCIPLINA = ' + txtDisciplina.Text + '" + CHR(13) + ';

            op := ' and ';
	      End;
	  End;

	  if (Pos('.codigoaluno', pAtual) > 0) or (Pos('.cd_pessoa', pAtual) > 0) Then
	  Begin
	      if txtCodigoAluno.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = ' + txtCodigoAluno.Text;

           filtro_show := filtro_show + '"ALUNO = ' + txtCodigoAluno.Text + '" + CHR(13) + ';
           
           op := ' and ';
	      End;
	  End;

	  if Pos('.professor', pAtual) > 0 Then
	  Begin
	      if txtProfessor.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = ' + txtProfessor.text;

           filtro_show := filtro_show + '"PROFESSOR = ' + txtCodigoAluno.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;
    End;

    { Fórmulas }
    strFor := qRelatoriosds_Formula.AsString;
    
    while Pos(';', strFor) > 0 do
    Begin
       SetLength(Formula, Length(formula) + 1);

       Formula[Length(formula)-1] := Copy(strFor, 1, pos(';',strFor) - 1 );

       strFor := Copy( strFor, pos(';',strFor) + 1, length(strFor)) ;
    End;

    { Valores da Fórmulas }

    strFor := qRelatoriosds_ConteudoFormula.AsString;

    while Pos(';', strFor) > 0 do
    Begin
       SetLength(Valores, Length(Valores) + 1);
       Valores[Length(Valores)-1] := Copy(strFor, 1, pos(';',strFor) - 1 );

       strFor := Copy( strFor, pos(';',strFor) + 1, length(strFor)) ;
    End;


    if Trim(qRelatoriosds_Especial.AsString) <> '' Then
       SFormula := SFormula + op + qRelatoriosds_Especial.AsString;

   { Imprimir o Relatório }

   PrincipalForm.PrintRpt(xField + '.rpt', qRelatoriosnm_cabecalho.AsString ,SFormula, qRelatoriosds_formula_grupo.AsString , qRelatoriosnm_relatorio.AsString,'',Formula, Valores, [],True);
   {
   if (Dm.isTrue(qRelatoriossn_impressao_numero.AsString)) and (resposta)
      and (txtCodigoAluno.Text <> '')
   then
   Begin
       Criar um novo Número de Impressao 
      try
         nro_impresso :=  StrToInt(DM.variavel_parametro('relatorio_impressao_numero'));
      except
         nro_impresso := 10000;
      end;

      nro_str := IntToStr(nro_impresso);

      INC(nro_impresso);

      nro_str := nro_str + DV44(nro_str);

      DM.set_variavel_parametro('relatorio_impressao_numero', IntToStr(nro_impresso));
      
      
      DM.qAux1.Close;
      Dm.qAux1.SQL.Clear;
      Dm.qAux1.SQL.Add('INSERT INTO relatorios_impressos (nr_impresso, cd_relatorio, cd_pessoa, anosemestre, turma, dt_relatorio)');
      Dm.qAux1.SQL.Add('VALUES (:numero, :relatorio, :pessoa, :anosemestre, :turma, :data_hora)');
      Dm.qAux1.ParamByName('numero').AsInteger := StrToInt(nro_str);
      DM.qAux1.ParamByName('relatorio').AsInteger := qRelatorioscd_relatorio.AsInteger;
      DM.qAux1.ParamByName('pessoa').AsString := txtCodigoAluno.Text;
      DM.qAux1.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
      DM.qAux1.ParamByName('turma').AsString := txtTurma.Text;
      DM.qAux1.ParamByName('data_hora').AsString := FormatDateTime('yyyy-mm-dd hh:MM:ss', Now);
      DM.qAux1.ExecSQL; 
   End;

   Exit;
   }

end;

procedure Tfrm_Relatorios.UpDown2Click(Sender: TObject;
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


procedure Tfrm_Relatorios.btnCodigoAlunoClick(Sender: TObject);
begin
  { Pesquisar Aluno }

  Application.CreateForm(Tfrm_SelPessoa, frm_SelPessoa);
  frm_SelPessoa.ShowModal;

  if frm_SelPessoa.flgSearch then
  Begin
     txtCodigoAluno.Text := frm_SelPessoa.qryPessoa.FieldByName('cd_pessoa').AsString;
     try
       txtTurma.Text := frm_SelPessoa.qryPessoa.FieldByName('turma').AsString;
       txtAnoSemestre.Text := frm_SelPessoa.qryPessoa.FieldByName('anosemestre').AsString;
     except
     End;
  End
  else Exit;

end;

procedure Tfrm_Relatorios.btnCodigoDepartamentoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSelDepartamento, frmSelDepartamento);

   frmSelDepartamento.ShowModal;

   if frmSelDepartamento.flgSearch Then
   Begin
       txtDepartamento.Text := frmSelDepartamento.qryDepartamento.FieldByNAme('codigo').ASString;
   End;

  frmSelDepartamento.Free();
end;

procedure Tfrm_Relatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{ Teclas de atalho }
begin

  case Key of
      VK_F7 : sbImprimirClick( nil );
      VK_F12: sbFecharClick( nil );
  end;

end;

procedure Tfrm_Relatorios.sbImprimirClick(Sender: TObject);
var
  //str: String;
  SFormula : String;
//  NomeRel : String;
  Formula : ARRAY of String;
  Valores : ARRAY of String;
  xField : String;

  Parametros : String;
  pAtual : String;

  //resposta : boolean;
  //nro_impresso : Integer;
 // nro_str : String;
  filtro_show : string;

  pCampo : String;
  pAtual_Aux : String;

  strFor : String;

  op : String;
begin


//    SetLength(Valores, 1);

    qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

    xField := qRelatoriosnm_arquivo.AsString;

    if Trim(xField) = '' Then Exit;

    SFormula := '';
    op := '';

    Parametros :=  LowerCase(qRelatoriosds_parametros.AsString); //Matriculas.AnoSemestre;Matriculas.Turma;

    while Length(Trim(Parametros)) > 1 do Begin

	  pAtual := Copy(Parametros, 1, Pos(';', Parametros) - 1);
    pCampo := Copy(pAtual, Pos('.', pAtual) + 1, Length(pAtual));
	  Parametros := Copy(PArametros, Pos(';', Parametros)+1, Length(parametros));

	  { Verificar qual é o parâmetro }

	  if Pos('.anosemestre', pAtual) > 0 Then
	  Begin
	      SFormula := SFormula + op + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;

        filtro_show := filtro_show + '"ANO/SEMESTRE = ' + txtAnoSemestre.Text + '" + CHR(13) + ';

	      op := ' and ';
	  End;

	  if  Pos('.bimestre', pAtual) > 0 Then
	  Begin
	      SFormula := SFormula + op + '{' + pAtual +'} = ' + txtBimestre.Text ;

        filtro_show := filtro_show + '"AVALIAÇÃO = ' + txtBimestre.Text + '" + CHR(13) + ';

	      op := ' and ';
	  End;

	  if Pos('.curso', pAtual) > 0 Then
	  Begin
	      if txtCurso.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = "' + txtCurso.Text + '"' ;

           filtro_show := filtro_show + '"CURSO = ' + txtCurso.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;

	  if Pos('.depto', pAtual) > 0 Then
	  Begin
	      if txtDepartamento.Text <> '' Then
	      Begin
      		 SFormula := SFormula + op + '{' + pAtual +'} = ' + txtDepartamento.Text  ;

           filtro_show := filtro_show + '"DEPARTAMENTO = ' + txtDepartamento.Text + '" + CHR(13) + ';

      		 op := ' and ';
	      End;
	  End;


	  if Pos('.turma', pAtual) > 0 Then
	  Begin
	      if txtTurma.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = "' + txtTurma.text +  '"' ;

           filtro_show := filtro_show + '"TURMA = ' + txtTurma.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;

	  if (Pos('data', pCampo) > 0) or (Pos('dt_', pCampo) > 0)Then
	  Begin
        if ckDtFiltrar.Checked = true then
          begin
       	   SFormula := SFormula + op + ' ( ';

           op := '';

           while length(pAtual) > 0 do
           begin

           if Pos(' or ',pAtual) > 0 then
           Begin
              pAtual_Aux := Copy(pAtual, Pos(' or ', pAtual) + 4, length(pAtual));
              pAtual := Copy(pAtual, 1, Pos(' or ',pAtual) - 1);
           End
           else
              pAtual_Aux := '';

           SFormula := SFormula + op + '(ToText({' + pAtual +'}, "yyyyMMdd") >= "' + FormatDateTime( 'yyyymmdd', txtDtInicial.Date ) + '"';
           op := ' and ';

    	     SFormula := SFormula + op + 'ToText({' + pAtual +'}, "yyyyMMdd") <= "' + FormatDateTime( 'yyyymmdd', txtDtFinal.Date ) + '")';

           pAtual := pAtual_Aux;

           op := ' or ';

        end;

        SFormula := SFormula +  ' ) ';

        filtro_show := filtro_show + '"DATA  = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDtFinal.Date ) + '" + CHR(13) + ';

        op := ' and ';
       end;
	  End;

    // Implementado em 07/12/2004 -> Para filtros de data
	  if (Pos('data', pCampo) > 0) or (Pos('dt_', pCampo) > 0)Then
	  Begin
        if ckDtFiltrar.Checked = true then
          begin
       	   SFormula := SFormula + op + ' ( ';

           op := '';

           while length(pAtual) > 0 do
           begin

           if Pos(' or ',pAtual) > 0 then
           Begin
              pAtual_Aux := Copy(pAtual, Pos(' or ', pAtual) + 4, length(pAtual));
              pAtual := Copy(pAtual, 1, Pos(' or ',pAtual) - 1);
           End
           else
              pAtual_Aux := '';

           SFormula := SFormula + op + '(ToText({' + pAtual +'}, "yyyyMMdd") >= "' + FormatDateTime( 'yyyymmdd', txtDtInicial.Date ) + '"';
           op := ' and ';

    	     SFormula := SFormula + op + 'ToText({' + pAtual +'}, "yyyyMMdd") <= "' + FormatDateTime( 'yyyymmdd', txtDtFinal.Date ) + '")';

           pAtual := pAtual_Aux;

           op := ' or ';

        end;

        SFormula := SFormula +  ' ) ';

        filtro_show := filtro_show + '"DATA  = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDtFinal.Date ) + '" + CHR(13) + ';

        op := ' and ';
       end;
	  End;
    // /Implementado em 07/12/2004 -> Para filtros de data

	  if Pos('.disciplina', pAtual) > 0 Then
	  Begin
	      if txtDisciplina.Text <> '' Then
	      Begin
            SFormula := SFormula + op + '{' + pAtual +'} = ' + txtDisciplina.Text ;

            filtro_show := filtro_show + '"DISCIPLINA = ' + txtDisciplina.Text + '" + CHR(13) + ';

            op := ' and ';
	      End;
	  End;

	  if (Pos('.codigoaluno', pAtual) > 0) or (Pos('.cd_pessoa', pAtual) > 0) Then
	  Begin
	      if txtCodigoAluno.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = ' + txtCodigoAluno.Text;

           filtro_show := filtro_show + '"ALUNO = ' + txtCodigoAluno.Text + '" + CHR(13) + ';
           
           op := ' and ';
	      End;
	  End;

	  if Pos('.professor', pAtual) > 0 Then
	  Begin
	      if txtProfessor.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = ' + txtProfessor.text;

           filtro_show := filtro_show + '"PROFESSOR = ' + txtCodigoAluno.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;
    End;

    { Fórmulas }
    strFor := qRelatoriosds_Formula.AsString;
    
    while Pos(';', strFor) > 0 do
    Begin
       SetLength(Formula, Length(formula) + 1);

       Formula[Length(formula)-1] := Copy(strFor, 1, pos(';',strFor) - 1 );

       strFor := Copy( strFor, pos(';',strFor) + 1, length(strFor)) ;
    End;

    { Valores da Fórmulas }

    strFor := qRelatoriosds_ConteudoFormula.AsString;

    while Pos(';', strFor) > 0 do
    Begin
       SetLength(Valores, Length(Valores) + 1);
       Valores[Length(Valores)-1] := Copy(strFor, 1, pos(';',strFor) - 1 );

       strFor := Copy( strFor, pos(';',strFor) + 1, length(strFor)) ;
    End;


    if Trim(qRelatoriosds_Especial.AsString) <> '' Then
       SFormula := SFormula + op + qRelatoriosds_Especial.AsString;

   { Imprimir o Relatório }

   PrincipalForm.PrintRpt(xField + '.rpt', qRelatoriosnm_cabecalho.AsString ,SFormula, qRelatoriosds_formula_grupo.AsString , qRelatoriosnm_relatorio.AsString,'',Formula, Valores, [],True);
    {
   if (Dm.isTrue(qRelatoriossn_impressao_numero.AsString)) and (resposta)
      and (txtCodigoAluno.Text <> '')
   then
   Begin
     
      try
         nro_impresso :=  StrToInt(DM.variavel_parametro('relatorio_impressao_numero'));
      except
         nro_impresso := 10000;
      end;

      nro_str := IntToStr(nro_impresso);
      //nro_str := Copy(nro_str, 1, length(nro_str) - 1);
      nro_str := Copy(nro_str, 1, length(nro_str));

      nro_impresso := StrToInt(nro_str);
      INC(nro_impresso);

      nro_str := IntToStr(nro_impresso) + DV44(nro_str);

      DM.set_variavel_parametro('relatorio_impressao_numero', nro_str);


      DM.qAux1.Close;
      Dm.qAux1.SQL.Clear;
      Dm.qAux1.SQL.Add('INSERT INTO relatorios_impressos (nr_impresso, cd_relatorio, cd_pessoa, anosemestre, turma, dt_relatorio)');
      Dm.qAux1.SQL.Add('VALUES (:numero, :relatorio, :pessoa, :anosemestre, :turma, :data_hora)');
      Dm.qAux1.ParamByName('numero').AsInteger := StrToInt(nro_str);
      DM.qAux1.ParamByName('relatorio').AsInteger := qRelatorioscd_relatorio.AsInteger;
      DM.qAux1.ParamByName('pessoa').AsString := txtCodigoAluno.Text;
      DM.qAux1.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
      DM.qAux1.ParamByName('turma').AsString := txtTurma.Text;
      DM.qAux1.ParamByName('data_hora').AsString := FormatDateTime('yyyy-mm-dd hh:MM:ss', Now);
      DM.qAux1.ExecSQL;
   End;

   Exit;
   }
end;

procedure Tfrm_Relatorios.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Relatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Relatorios.sbPropriedadesClick(Sender: TObject);
begin
    //Mostra a Janela de configuracao da impressora
    PrincipalForm.Report.Printer.Prompt();

end;

procedure Tfrm_Relatorios.ckDtFiltrarClick(Sender: TObject);
begin
  lblDtInicial.Enabled := ckDtFiltrar.Checked;
  txtDtInicial.Enabled := ckDtFiltrar.Checked;
  lblDtFinal.Enabled := ckDtFiltrar.Checked;
  txtDtFinal.Enabled := ckDtFiltrar.Checked;
end;

function Tfrm_Relatorios.PerguntaVerRelatorio():Integer;
var
    iQVer: Integer;
begin

      iQVer := Mensagem('Deseja visualizar antes de imprimir?', 'UniMestre - Relatórios', MB_YESNOCANCEL);

      case iQVer of
    	  IDNO: PrincipalForm.Report.Output := toPrinter;
	      IDYES: PrincipalForm.Report.Output := toWindow;
	      IDCANCEL: begin

	         PrincipalForm.Report.CloseEngine;
           Result := 0;
           Exit;
	      end;
      end;
      Result := iQVer;
end;

end.

