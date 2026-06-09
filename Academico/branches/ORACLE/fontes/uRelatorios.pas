unit uRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, ZConnection, StdCtrls, Mask,
  Menus, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, UCrpe32, UCrpeClasses, DateUtils, UMComboBox, Math,
  UMDateTimePicker, Variants, uItemCombo, Contnrs;

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
    lblAnoSemestre: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
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
    UpDown2: TUpDown;
    txtCodigoAluno: TEdit;
    popTurmas: TPopupMenu;
    lbDepartamento: TLabel;
    txtDepartamento: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbFechar: TSpeedButton;
    sbPropriedades: TSpeedButton;
    lblData: TLabel;
    ckDtFiltrar: TCheckBox;
    lblDtInicial: TLabel;
    lblDtFinal: TLabel;
    Label1: TLabel;
    txtGenerico: TEdit;
    lblGenerico: TLabel;
    txtBimestre: TEdit;
    sbPreencherVariaveis: TSpeedButton;
    qyDelete: TUMZQuery;
    Label2: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure cbUnidadeEnsinoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPreencherVariaveisClick(Sender: TObject);
    procedure txtBimestreExit(Sender: TObject);
    procedure txtBimestreKeyPress(Sender: TObject; var Key: Char);
    procedure Label1Click(Sender: TObject);
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
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPropriedadesClick(Sender: TObject);
    procedure ckDtFiltrarClick(Sender: TObject);
    function PerguntaVerRelatorio(): integer;
  strict private
      iColigadaSelecionadaCombo: Integer;
      stGrupos: TObjectList;

      procedure CarregarColigadas();
      function isGrupoPai(selecionado: String): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
//    Modulo : Smallint;
    CamposAdicionaisRelatorio: TStringList;
    bDeptoObrigar, bCursoObrigar, bTurmaObrigar, bDisciplinaObrigar,
    bPessoaObrigar, bProfessorObrigar : boolean;

    Function validarCampos : Boolean;
  end;

var
  frm_Relatorios: Tfrm_Relatorios;

implementation

uses
   uDM, uFSelecionarTurma, uFSelecionarPessoa, Main, uFSelecionarDepartamento, uFSelecionarCurso,
   uFSelecionarDisciplina, StrUtils, uRelatorios_adicional, uDepartamento,
   uListaColigadas, uColigada;

{$R *.DFM}

procedure Tfrm_Relatorios.FormShow(Sender: TObject);
var
  i:Integer;
  str1: String;
  treeNode : TTreeNode;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  lblAnoSemestre.Visible := DM.UsaAnosemestre;
  txtAnoSemestre.Visible := DM.UsaAnosemestre;
  UpDown1.Visible := DM.UsaAnosemestre;

  stGrupos := TObjectList.Create;

  txtCurso.Clear;
  txtTurma.Clear;
  txtDisciplina.Clear;
  txtCodigoAluno.Clear;
  txtProfessor.Clear;

  { Montar o TreeView }

  CarregarColigadas();

  txtAnoSemestre.text := IntToStr(DM.GetAnoSemestreAtual);

  { Adicionar os Relatório na Árvore }
  qRelatorios.Close;
//  qRelatorios.ParamByName('modulo').ASInteger := modulo;
  qRelatorios.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
  qrelatorios.Open;

  Tree.Items.Clear;

  Tree.Items.Add( Tree.TopItem, qRelatorios.FieldByName('ds_Grupo').AsString );
  stGrupos.Add(
    TItemCombo.Create('1', qRelatorios.FieldByName('ds_grupo').AsString)
  );

  i := Tree.Items.Count - 1;

  str1 := qRelatorios.FieldByName('ds_grupo').AsString;

  while not qRelatorios.Eof do
  begin

    if qRelatorios.FieldByName('ds_grupo').AsString <> str1 then
    begin
      Tree.Items.Add( Tree.TopItem, qRelatorios.FieldByName('ds_grupo').AsString );
      str1 := qRelatorios.FieldByName('ds_grupo').AsString;
      i := Tree.Items.Count - 1;

      stGrupos.Add(
        TItemCombo.Create('1', qRelatorios.FieldByName('ds_grupo').AsString)
      );
    end;

    treeNode := Tree.Items.AddChild( Tree.Items[i], qRelatorios.FieldByName('nm_relatorio').AsString );

    treeNode.ImageIndex := 1;
    
    qRelatorios.Next;
    
  end;

  Tree.FullCollapse;

end;


function Tfrm_Relatorios.isGrupoPai(selecionado: String): Boolean;
var
  i: Integer;
begin
  Result := False;

  for I := 0 to stGrupos.count -1 do
  begin
    if TItemCombo(stGrupos.Items[i]).descricao = selecionado then
    begin
      Result := True;
      Exit;
    end;
  end;
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
var
   resultado_filtro : TResultadoFiltroCurso;
   curso: String;
   anosemestre: Integer;
begin

   curso := txtCurso.Text;
   anosemestre := StrToInt(txtAnoSemestre.Text);

   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([],
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo,
         StrToIntDef(txtDepartamento.Text, -2)
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([],
         -2,
         StrToIntDef(txtDepartamento.Text, -2)
      );
   end;

   if ( resultado_filtro.filtrado )  and
      ( ( curso <> resultado_filtro.cd_curso ) OR
      ( anosemestre <> resultado_filtro.nr_anosemestre) ) then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      txtDepartamento.Text := IntToStr(resultado_filtro.cd_departamento);
      txtTurma.Text := '';
      DM.LocalizaColigada( cbUnidadeEnsino, resultado_filtro.cd_coligada );
   end;
end;

procedure Tfrm_Relatorios.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro: TResultadoFiltroTurma;
   curso: String;
begin

   if txtCurso.Text = '' then
   begin
      curso := '-2';
   end
   else
   begin
      curso := txtCurso.Text;
   end;

   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestre.Text),
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo,
         StrToIntDef(txtDepartamento.Text, -2),
         curso
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestre.Text),
         -2,
         StrToIntDef(txtDepartamento.Text, -2),
         curso
      );
   end;

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;

   if txtCurso.Enabled then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
   end;

   if txtDepartamento.Enabled then
   begin
      txtDepartamento.Text := IntToStr(resultado_filtro.cd_departamento);
   end;

   DM.LocalizaColigada(cbUnidadeEnsino, resultado_filtro.cd_coligada);

   txtAnoSemestre.Text := IntToStr(resultado_filtro.nr_anosemestre);
end;

procedure Tfrm_Relatorios.btnCodigoDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }
   // Iniciamos as variáveis do filtro de disciplina com os valores padroes
   resultado_filtro.nr_anosemestre := -1;
   resultado_filtro.cd_curso := '';
   resultado_filtro.cd_turma := '';
   resultado_filtro.cd_professor := -1;

   if txtAnoSemestre.Enabled then
      resultado_filtro.nr_anosemestre := StrToInt(txtAnoSemestre.Text);

   if txtCurso.Enabled AND (TRIM(txtCurso.Text) <> '') then
      resultado_filtro.cd_curso := txtCurso.Text;

   if txtTurma.Enabled AND (TRIM(txtTurma.Text) <> '') then
      resultado_filtro.cd_turma := txtturma.Text;

   if txtProfessor.Enabled AND (TRIM(txtProfessor.Text) <> '') then
      resultado_filtro.cd_professor := StrToInt(txtProfessor.Text);

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar( [],
      resultado_filtro.cd_curso, resultado_filtro.nr_anosemestre, resultado_filtro.cd_turma,
      resultado_filtro.cd_professor );

   if resultado_filtro.filtrado then
   begin
      txtDisciplina.Text := IntToStr( resultado_filtro.cd_disciplina );
   end;
end;

procedure Tfrm_Relatorios.btnCodigoProfessorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
  { Pesquisar Aluno }
  resultado_filtro := TfrmSelecionarPessoa.Filtrar([], AbasFiltroPessoa(btnCodigoProfessor.Tag));

  if not resultado_filtro.filtrado then
  begin
     Exit;
  end;

  txtProfessor.Text := IntToStr(resultado_filtro.cd_pessoa);

  if resultado_filtro.nr_anosemestre <> -1 then
  begin
     txtAnoSemestre.Text := IntToStr(resultado_filtro.nr_anosemestre);
  end;
  
  if resultado_filtro.cd_turma <> '' then
  begin
     txtTurma.Text := resultado_filtro.cd_turma;
  end;
end;

procedure Tfrm_Relatorios.txtBimestreExit(Sender: TObject);
begin
  if trim(txtBimestre.Text) = '' then begin

     txtBimestre.Text := '0';
     UpDown2.Position := 0;

  end;
end;

procedure Tfrm_Relatorios.txtBimestreKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9', #8]) then begin
     Key := #0;
 end;
 
end;

procedure Tfrm_Relatorios.txtCodigoAlunoExit(Sender: TObject);
  { Ao digitar o Código do Aluno, Mostrar as Turmas }
var
   qyListaMatriculas : TUMZReadOnlyQuery;
begin
   if txtCodigoAluno.Text = '' then Exit;

   while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

   if Pos(',', txtCodigoAluno.Text) > 0 then Exit;

   DM.CriarConsulta(qyListaMatriculas);

   qyListaMatriculas.SQL.Add( 'SELECT cd_pessoa, nm_pessoa , Matriculas.AnoSemestre, ' +
      'Matriculas.Curso, Matriculas.Turma FROM Pessoas LEFT JOIN ' +
      ' Matriculas ON ( Pessoas.cd_pessoa = Matriculas.CodigoAluno ) ' +
      ' WHERE Pessoas.cd_pessoa = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' );
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
       txtTurma.Text := qyListaMatriculas.FieldByNAme('Turma').AsString;

   FreeAndNil(qyListaMatriculas);
end;

procedure Tfrm_Relatorios.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;


procedure Tfrm_Relatorios.TreeClick(Sender: TObject);
var
  xField : String;
  xFormula : String;
  atual, anterior, ds_grupo : String;
  isPai: boolean;
begin
  isPai := isGrupoPai(Tree.Selected.Text);

  if not isPai then
  begin
    ds_grupo := Tree.Selected.Parent.Text;
  end;

  //Verifica se esta vendo um relatório com o mesmo nome da pasta/nó pai da Treeview;
  try

     if Tree.Selected.Parent.Text = Tree.Selected.Text then
     begin
        ds_grupo := Tree.Selected.Text;
     end;

  except
     //Não possui registro pai para acessar, ignora acess violation.
     ds_grupo := '';
  end;

  if not qRelatorios.Locate('ds_grupo;nm_relatorio',VarArrayOf([ds_grupo, Tree.Selected.Text]), [loCaseInsensitive]) Then
  Begin
      { Não existe o relatório, desabilitar tudo }
      lblAnoSemestre.Enabled := False;
      txtAnoSemestre.Enabled := False;
      UpDown1.Enabled := False;
      txtBimestre.Enabled := False;
      lblBimestre.Enabled := False;
      UpDown2.Enabled := False;
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
      lblGenerico.Enabled := False;
      txtGenerico.Enabled := False;
      cbUnidadeEnsino.Enabled := false;
      Label2.Enabled := false;

      lblData.Enabled := false;
      ckDtFiltrar.Enabled := false;
      ckDtFiltrar.Checked := false;
      ckDtFiltrarClick(Sender);

      btnCodigoProfessor.Enabled := False;

      sbImprimir.Enabled := False;
      Exit;
  End;

  sbImprimir.Enabled := True;

  if ((qRelatorios.FieldByName('ds_variaveis').IsNull) or (qRelatorios.FieldByName('ds_variaveis').AsString = '')) then
  begin
    sbPreencherVariaveis.Visible := False;
  end else begin
    CamposAdicionaisRelatorio.Clear;
    sbPreencherVariaveis.Visible := True;
  end;

  xField := lowercase(qRelatorios.FieldByName('ds_parametros').AsString);
  xFormula :=  qRelatorios.FieldByName('ds_formula').AsString;

  { Verificar os Parametros que tem que ficar ligados }

  txtAnoSemestre.Enabled := (Pos('.anosemestre', xField) > 0) OR (Pos('[nr_anosem]', xFormula) > 0);
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;
  UpDown1.Enabled := txtAnoSemestre.Enabled;

  txtBimestre.Enabled := (Pos('bimestre', xField) > 0 ) OR (Pos('bimestre', xFormula) > 0) OR (Pos('[nr_etapa]', xFormula) > 0);
  lblBimestre.Enabled := txtBimestre.Enabled;
  UpDown2.Enabled := txtBimestre.Enabled;

  txtDepartamento.Enabled := (Pos('.depto', xField) > 0) OR (Pos('[cd_depto]', xFormula) > 0);
  lbDepartamento.Enabled := txtDepartamento.Enabled;
  btnCodigoDepartamento.Enabled := txtDepartamento.Enabled;
  bDeptoObrigar := Pos('?.depto', xField) > 0;

  txtCurso.Enabled := (Pos('.curso', xField) > 0) OR (Pos('[cd_curso]', xFormula) > 0);
  lblCurso.Enabled := txtCurso.Enabled;
  btnCodigoCurso.Enabled := txtCurso.Enabled;
  bCursoObrigar := Pos('?.curso', xField) > 0;

  txtTurma.Enabled := (Pos('.turma', xField) > 0) OR (Pos('[cd_turma]', xFormula) > 0);
  lblTurma.Enabled := txtTurma.Enabled;
  btnCodigoTurma.Enabled := txtTurma.Enabled;
  bTurmaObrigar := Pos('?.turma', xField) > 0;

  txtDisciplina.Enabled := (Pos('.disciplina', xField) > 0) OR (Pos('[cd_disciplina]', xFormula) > 0);
  lblDisciplina.Enabled := txtDisciplina.Enabled;
  btnCodigoDisciplina.Enabled := txtDisciplina.Enabled;
  bDisciplinaObrigar := Pos('?.disciplina', xField) > 0;

  txtCodigoAluno.Enabled := (Pos('.codigoaluno', xField) > 0) or (Pos('.cd_pessoa', xField) > 0) OR (Pos('[cd_pessoa]', xFormula) > 0);
  lblCodigoAluno.Enabled := txtCodigoAluno.Enabled;
  btnCodigoAluno.Enabled := txtCodigoAluno.Enabled;
  bPessoaObrigar := Pos('?.codigoaluno', xField) > 0;

  txtProfessor.Enabled := (Pos('.professor', xField) > 0) or (Pos('.funcionario', xField) > 0) OR (Pos('[cd_professor]', xFormula) > 0);
  lblProfessor.Enabled := txtProfessor.Enabled;
  btnCodigoProfessor.Enabled := txtProfessor.Enabled;
  bProfessorObrigar := (Pos('?.professor', xField) > 0) or (Pos('?.funcionario', xField) > 0);

  if Pos('.funcionario', xField) > 0 then
  begin
     btnCodigoProfessor.Tag := 5;
  end
  else
     btnCodigoProfessor.Tag := 2;

  txtGenerico.Enabled := (Pos('generic', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) OR (Pos('[ds_observacao]', xFormula) > 0);
  lblGenerico.Enabled := txtGenerico.Enabled;

  if Pos('generic', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0 then begin

     lblGenerico.Caption := Copy(qRelatorios.FieldByName('ds_parametros').AsString, Pos('[', qRelatorios.FieldByName('ds_parametros').AsString) + 1, Pos(']', qRelatorios.FieldByName('ds_parametros').AsString)-Pos('[', qRelatorios.FieldByName('ds_parametros').AsString)-1);

  end else begin

     lblGenerico.Caption := 'Observações:';

  end;

  cbUnidadeEnsino.Enabled := Pos('.cd_coligada', xField) > 0;
  Label2.Enabled := cbUnidadeEnsino.Enabled;

  lblData.Enabled := (Pos('data', xField) > 0) or (Pos('.dt', xField) > 0) or (Pos('data', xFormula) > 0) or (Pos('dt', xFormula) > 0) ;
  umdtInicial.Date := DataHoje;
  umdtFinal.Date := DataHoje;
  ckDtFiltrar.Enabled := lblData.Enabled;
  ckDtFiltrar.Checked := lblData.Enabled;
  ckDtFiltrarClick(Sender);

end;


procedure Tfrm_Relatorios.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Relatorios.btnImprimirClick(Sender: TObject);
const
   SQL_BUSCA_DESCRICAO_DEPTO =
      ' SELECT '+
	   '   GROUP_CONCAT(descricao) AS descricao '+
      ' FROM '+
	   '    departamentos '+
      ' WHERE '+
	   '    codigo IN (%s) ';
var
  sArqRelatorio: string;
  sParametros: string;
  sFSelecao: string;
  sFGrupo: string;
  sFiltroShow: string;
  sAux: string;
  pAtual : string;
  slFormulas, slOrdem, SLParametros: TStringList;
  bAux: Boolean;
  iNum: LongInt;
  sFiltro : String;
  sOp : String;
  pCampo : String;
  pAtual_Aux : String;
  i: Integer;
  ds_especial : String;   
  wMes, wAno, wDia : Word;

  sSQL, S : String;

  slSQL : TStringList;
  slSQLExp : TStringList;
  qyDelete: TUMZQuery;
   PodeExportar : Boolean;

   qryBuscaDescricaoDepartamentos: TUMZReadOnlyQuery;
begin
   ds_especial := qRelatorios.fieldbyname('ds_especial').AsString;
   
   // Campos passados para o relatório para serem utilizados como comand quando
   // não preenchidos fazem no crystall abrir novamente a tela de preenchimento
   // de filtros. Deste modo foi feita a obrigatoriedade de preenchimento no delphi
   if (validarCampos) then
   begin
      exit;
   end;

   sFSelecao := '';

   //localiza relatorio na query
   qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

   //define o arquivo de relatorio
   sArqRelatorio := qRelatorios.FieldByName('nm_arquivo').AsString;
   if (Trim(sArqRelatorio) = '') then
   begin
      Mensagem('O Relatório não foi selecionado ou é inválido!', '', mrOk);
      Exit;
   end;

   sArqRelatorio := sArqRelatorio + '.rpt';

   // Adiciona os parâmetros dinâmicos para filtrar no relatório

   SLParametros := TStringList.Create;

   if txtAnoSemestre.Enabled then
   begin
      SLParametros.Values['.anosemestre'] := txtAnoSemestre.Text;
   end;

   if txtBimestre.Enabled then
   begin
      SLParametros.Values['.bimestre'] := txtBimestre.Text;
   end;

   if txtDepartamento.Enabled and (txtDepartamento.Text <> '') then
   begin
      SLParametros.Values['.depto'] := txtDepartamento.Text;
   end;

   if txtCurso.Enabled and (txtCurso.Text <> '') then
   begin
      SLParametros.Values['.curso'] := txtCurso.Text;
   end;

   if txtTurma.Enabled and (txtTurma.Text <> '') then
   begin
      SLParametros.Values['.turma'] := txtTurma.Text;
   end;

   if txtDisciplina.Enabled and (txtDisciplina.Text <> '') then
   begin
      SLParametros.Values['.disciplina'] := txtDisciplina.Text;
   end;

   if txtCodigoAluno.Enabled and (txtCodigoAluno.Text <> '') then
   begin
      SLParametros.Values['.codigoaluno'] := txtCodigoAluno.Text;
   end;

   if txtProfessor.Enabled and (txtProfessor.Text <> '') then
   begin
      SLParametros.Values['.professor'] := txtProfessor.Text;
   end;

   if ckDtFiltrar.Checked then
   begin
      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(umdtInicial.Date),
         MonthOf(umdtInicial.Date),
         DayOf(umdtInicial.Date),
         HourOf(umdtInicial.Date),
         MinuteOf(umdtInicial.Date),
         SecondOf(umdtInicial.Date)
      ]);
      SLParametros.Values['.dataInicio'] := S;

      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(umdtFinal.Date),
         MonthOf(umdtFinal.Date),
         DayOf(umdtFinal.Date),
         HourOf(umdtFinal.Date),
         MinuteOf(umdtFinal.Date),
         SecondOf(umdtFinal.Date)
      ]);
      SLParametros.Values['.dataFim'] := S;
   end;

   if txtGenerico.Enabled and (txtGenerico.Text <> '') then
   begin
      SLParametros.Values['.extra'] := txtGenerico.Text;
   end;

   //define parametros
   sParametros :=  LowerCase(qRelatorios.FieldByName('ds_parametros').AsString);

   // sFiltro é utilizado para SQL
   if Pos('where', lowercase(qRelatorios.FieldByName('ds_sql').AsString)) > 0 then
       sOp := ' and '
   else
       sOp := ' where ';

   sAux := ' ';
   while (Length(Trim(sParametros)) > 1) do begin

      pAtual := Copy(sParametros, 1, Pos(';', sParametros) - 1);
      pCampo := Copy(pAtual, Pos('.', pAtual) + 1, Length(pAtual));
      sParametros := Copy(sParametros, Pos(';', sParametros)+1, Length(sParametros));

      // Verificar qual é o parâmetro
      if (Pos('.anosemestre', pAtual) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;
         sFiltroShow := sFiltroShow + '"ANO/SEMESTRE = ' + Copy(txtAnoSemestre.Text,1,4) + '/' + Copy(txtAnoSemestre.Text,5,1) + '" + CHR(13) + ';
         sAux := ' and ';

         sFiltro := sFiltro + sOp + pAtual + ' = ' + txtAnoSemestre.Text;
         sOp := ' and ';
      end;

      if (Pos('bimestre', pAtual) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtBimestre.Text ;
         sFiltroShow := sFiltroShow + '"AVALIAÇÃO = ' + txtBimestre.Text + '" + CHR(13) + ';
         sAux := ' and ';

         sFiltro := sFiltro + sOp + pAtual + ' = ' + txtBimestre.Text;
         sOp := ' and ';

      end;

      if (Pos('.curso', pAtual) > 0) then begin
         if (txtCurso.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + txtCurso.Text + '"';
            sFiltroShow := sFiltroShow + '"CURSO = ' + txtCurso.Text + '" + CHR(13) + ';
            sAux := ' and ';

           sFiltro := sFiltro + sOp + pAtual + ' = ''' + txtCurso.Text + '''';
           sOp := ' and ';

         end;
      end;

      if (Pos('.depto', pAtual) > 0) then
      begin
         if (txtDepartamento.Text <> '') then
         begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + txtDepartamento.Text+']'  ;

            // Pegar o Nome do Depto
            DM.CriarConsulta(qryBuscaDescricaoDepartamentos);
            
            qryBuscaDescricaoDepartamentos.SQL.Text := Format(SQL_BUSCA_DESCRICAO_DEPTO, [txtDepartamento.Text]);
            qryBuscaDescricaoDepartamentos.Open;
            
            sFiltroShow := sFiltroShow + '"DEPARTAMENTO = ' + qryBuscaDescricaoDepartamentos.FieldByName('descricao').AsString + '" + CHR(13) + ';
            FreeAndNil(qryBuscaDescricaoDepartamentos);
            // Pegar o Nome do Depto

            sAux := ' and ';
            sFiltro := sFiltro + sOp + pAtual + ' IN (' + txtDepartamento.Text+')';
            sOp := ' and ';
         end;
      end;

      if (Pos('.turma', pAtual) > 0) then begin
         if txtTurma.Text <> '' then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + txtTurma.text +  '"' ;
            sFiltroShow := sFiltroShow + '"TURMA = ' + txtTurma.Text + '" + CHR(13) + ';
            sAux := ' and ';

            sFiltro := sFiltro + sOp + pAtual + ' = ''' + txtTurma.Text + '''';
            sOp := ' and ';

         end;
      end;

      if (Pos('.disciplina', pAtual) > 0) then begin
         if (txtDisciplina.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtDisciplina.Text ;
            sFiltroShow := sFiltroShow + '"DISCIPLINA = ' + txtDisciplina.Text + '" + CHR(13) + ';
            sAux := ' and ';

            sFiltro := sFiltro + sOp + pAtual + ' = ' + txtDisciplina.Text;
            sOp := ' and ';

         end;
      end;

      if (Pos('.codigoaluno', pAtual) > 0) or (Pos('.cd_pessoa', pAtual) > 0) then begin
         if (txtCodigoAluno.Text <> '') then begin

            if Pos(',', txtCodigoAluno.Text) > 0  then begin

               sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + txtCodigoAluno.Text + '] ';
               sFiltroShow := sFiltroShow + '"ALUNO = ' + txtCodigoAluno.Text + '" + CHR(13) + ';
               sAux := ' and ';

               sFiltro := sFiltro + sOp + pAtual + ' = ' + txtCodigoAluno.Text;
               sOp := ' and ';
            end else begin

               sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtCodigoAluno.Text;
               sFiltroShow := sFiltroShow + '"ALUNO = ' + txtCodigoAluno.Text + '" + CHR(13) + ';
               sAux := ' and ';

               sFiltro := sFiltro + sOp + pAtual + ' = ' + txtCodigoAluno.Text;
               sOp := ' and ';

            end;

         end;
      end;

      if (Pos('.professor', pAtual) > 0) or (Pos('.funcionario', pAtual) > 0) then
      begin
      if (txtProfessor.Text <> '') then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtProfessor.text;
         sFiltroShow := sFiltroShow + '"PROFESSOR = ' + txtCodigoAluno.Text + '" + CHR(13) + ';
         sAux := ' and ';

         sFiltro := sFiltro + sOp + pAtual + ' = ' + txtCodigoAluno.Text;
         sOp := ' and ';

      end;
      end;

      if (Pos('generic', pAtual) > 0 ) then begin
      if (txtGenerico.Text <> '') then begin
         sFSelecao := sFSelecao + sAux + '{' + Copy(pAtual, Pos(']', pAtual)+1, length(pAtual)) + '} LIKE "*' + txtGenerico.Text + '*"';
         sFiltroShow := sFiltroShow + '"' + UpperCase(Copy(pAtual, Pos('[', pAtual)+1, Pos(']', pAtual)-Pos('[',pAtual)-1)) + ' contendo ' + txtGenerico.Text + '" + CHR(13) + ';
         sAux := ' and ';
         sFiltro := sFiltro + sOp + Copy(pAtual, Pos(']', pAtual)+1, length(pAtual)) + ' like "%' + txtGenerico.Text + '%"';
         sOp := ' and ';
      end;
      end;


      if ((Pos('data', pCampo) > 0) or (Pos('dt_', pCampo) > 0))then begin
      if ckDtFiltrar.Checked then begin

        sFSelecao := sFSelecao + sAux + ' ( ';
        sFiltro := sFiltro + sOp + ' ( ';

        sAux := ' ';

        while (Length(pAtual) > 0) do begin

           if Pos(' or ',pAtual) > 0 then begin
              pAtual_Aux := Copy(pAtual, Pos(' or ', pAtual) + 4, Length(pAtual));
              pAtual := Copy(pAtual, 1, Pos(' or ',pAtual) - 1);
           end
           else begin
              pAtual_Aux := '';
           end;

           DecodeDate(umdtInicial.Date, wAno, wMes, wDia);

           sFSelecao := sFSelecao + sAux + '( {' + pAtual +'} >= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + '';
           sFiltro := sFiltro + sAux + '( ' + pAtual + ' >= ''' + FormatDateTime( 'yyyy-mm-dd', umdtInicial.Date ) + '''';
           sAux := ' and ';

           DecodeDate(umdtFinal.Date, wAno, wMes, wDia);

           sFSelecao := sFSelecao + sAux + '{' + pAtual +'} <= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + ' )';
           sFiltro := sFiltro + sAux + pAtual + ' <= ''' + FormatDateTime( 'yyyy-mm-dd', umdtFinal.Date ) + ''')';
           pAtual := pAtual_Aux;
           sAux := ' or ';  

        end;

        sFSelecao := sFSelecao +  ' ) ';
        sFiltro := sFiltro +  ' ) ';

        sFiltroShow := sFiltroShow + '"DATA = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';

        sAux := ' and ';

      end;
      
      end;

      // Se tiver a palavra cd_coligada em ds_parametros, o sistema passara no filtro do relatório todos os códigos de coligadas relacionados.

      if (Pos('cd_coligada', pCampo) > 0) then begin
          if (cbUnidadeEnsino.ItemIndex = -1) or (cbUnidadeEnsino.ItemIndex = 0)  then
          begin
             cbUnidadeEnsino.SetFocus();  sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + DM.GetColigadas() + ']'  ;
             sFiltro := sFiltro + sAux + pAtual + ' in (' + Dm.GetColigadas() + ')' ;
             sAux := ' and ';
             sFiltroShow := sFiltroShow + '"U.E. = ' + DM.sColigadaSelecionada + '" + CHR(13) + ';
          end
          else
          begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
            sFiltro := sFiltro + sAux + pAtual + ' = ' + IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"U.E. = ' + DM.sColigadaSelecionada + '" + CHR(13) + ';
          end;
      end;



   end; //end while

   //especial
  //if Trim(qRelatorios.FieldByName('ds_especial').AsString) <> '' then
   if Trim(ds_especial) <> '' then
   begin
      sFSelecao := sFSelecao + sAux + ds_especial;
   end;

   slFormulas := TStringList.Create();

   sAux := qRelatorios.FieldByName('ds_Formula').AsString;

   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slFormulas);

         for i := 0 to (slFormulas.Count - 1) do begin

            sAux := slFormulas.ValueFromIndex[i];

            //processa formulas
            if (sAux = '[data_inicio]') then begin
               if ( ckDtFiltrar.Checked ) then
               begin
                  DecodeDate(umdtInicial.Date, wAno, wMes, wDia);
                  slFormulas.ValueFromIndex[i] := 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
               end
               else
                  slFormulas.Strings[i] := '';
            end
            else if (sAux = '[data_fim]') then begin
               if ( ckDtFiltrar.Checked ) then
               begin
                  DecodeDate(umdtFinal.Date, wAno, wMes, wDia);
                  slFormulas.ValueFromIndex[i] :=  'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
               end
               else
                  slFormulas.Strings[i] := '';
            end
            else if (sAux = '[nr_etapa]') then begin
               slFormulas.ValueFromIndex[i] := txtBimestre.Text;
            end
            else if (sAux = '[nm_coligada]') then begin
               slFormulas.ValueFromIndex[i] := '"' + DM.sColigadaSelecionada + '"';
            end
            else if (sAux = '[nm_coligada_razao]') then begin
               slFormulas.ValueFromIndex[i] := '"' + DM.sColigadaSelecionadaRazao + '"';
            end
            else if (sAux = '[cd_coligada]') then begin
               if cbUnidadeEnsino.ItemIndex = -1 then
               begin
                  Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONINFORMATION, Handle);
                  cbUnidadeEnsino.SetFocus();
                  Exit;
               end;
               
               slFormulas.ValueFromIndex[i] := '"' +
                  IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo) +
                  '"';
            end
            // CLAUDIONOR
            // Adicionado todos os campos da tela para receberem valores como formula

            else if (sAux = '[nr_anosem]') then begin
               slFormulas.ValueFromIndex[i] := txtAnoSemestre.Text;
            end
            else if (sAux = '[cd_depto]') then begin
                if txtDepartamento.Text <> '' then
                   slFormulas.ValueFromIndex[i] := trim(txtDepartamento.Text)
                else
                   slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
            end
            else if (sAux = '[cd_curso]') then begin
               slFormulas.ValueFromIndex[i] := '"' + txtCurso.Text + '"'  ;
            end
            else if (sAux = '[cd_turma]') then begin
               slFormulas.ValueFromIndex[i] :=  '"' + txtTurma.Text + '"' ;
            end
            else if (sAux = '[cd_disciplina]') then begin
                if txtDisciplina.Text <> '' then
                   slFormulas.ValueFromIndex[i] := trim(txtDisciplina.Text)
                else
                   slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
            end
            else if (sAux = '[cd_pessoa]') then begin
                if txtCodigoAluno.Text <> '' then
                   slFormulas.ValueFromIndex[i] := trim(txtCodigoAluno.Text)
                else
                   slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
            end
            else if (sAux = '[cd_professor]') then begin
                if txtProfessor.Text <> '' then
                   slFormulas.ValueFromIndex[i] := trim(txtProfessor.Text)
                else
                   slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
            end
            else if (sAux = '[ds_observacao]') then begin
               slFormulas.ValueFromIndex[i] :=  '"' + txtGenerico.Text +  '"' ;
            end
            else if ( sAux = '[usuario]' ) then
            begin
               slFormulas.ValueFromIndex[i] := IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo);
            end;
         end;
   end;

   //SQL Expression
   slSQLExp := TStringList.Create();

   sAux := qRelatorios.FieldByName('ds_sql_exp').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slSQLExp);

      for i := 0 to (slSQLExp.Count - 1) do begin

         sAux := slSQLExp.ValueFromIndex[i];

          if (Pos('[data_inicio]', sAux) > 0 ) and (ckDtFiltrar.Checked) then begin
             sAux := ReplaceStr(sAux, '[data_inicio]', ''''+ FormatDateTime('yyyy-mm-dd', umdtInicial.Date) + '''');
          end;
          if (Pos('[data_fim]', sAux) > 0 ) and (ckDtFiltrar.Checked) then begin
             sAux := ReplaceStr(sAux, '[data_fim]', ''''+ FormatDateTime('yyyy-mm-dd', umdtFinal.Date) + '''');
          end;
          if (Pos('[cd_coligada]', sAux) >0 ) then
          begin
             if cbUnidadeEnsino.ItemIndex = -1 then
             begin
                Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONINFORMATION, Handle);
                cbUnidadeEnsino.SetFocus();
                Exit;
             end;

             sAux := ReplaceStr(
                  sAux,
                  '[cd_coligada]',
                  IntToStr(
                     TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
                  )
             );
          end;

          if (Pos('[usuario]', sAux) > 0 ) then
          begin
            sAux := ReplaceStr(
                  sAux,
                  '[usuario]',
                  IntToStr( DM.GetUsuarioLogado.Pessoa.Codigo)
            );
          end;

          slSQLExp.ValueFromIndex[i] := sAux;

      end;

   end;

   //SQL EXP
   if Length(qRelatorios.FieldByName('ds_sql').AsString) > 0 then begin

      sSQL := qRelatorios.FieldByName('ds_sql').AsString;

      sSQL := StringReplace(sSQL, '[data_inicio]', '''' + FormatDateTime('yyyy-mm-dd', umdtInicial.Date) + '''', [rfReplaceAll] );
      sSQL := StringReplace(sSQL, '[data_fim]', '''' + FormatDateTime('yyyy-mm-dd', umdtFinal.Date) + '''', [rfReplaceAll] );

      if(Trim(sSQL) <> '')then
      begin
         sSQL := sSQL + ' ' + sFiltro + qRelatorios.FieldByName('ds_sql_ordem').AsString;
      end else begin
         sSQL := '';
      end;

      slSQL := TStringList.Create;

      SplitString(sSQL, ';', slSQL);

      // Executar o SQL
      with DM.qAux2 do begin
          For i:= 0 to slSQL.Count -1 do begin
             Close;
             SQL.Clear;
             SQL.Add( slSQL.Strings[i] );
             ExecSQL;
          end;
      end;


      sFSelecao := '';

   end;


   //formula grupo
   sAux := qRelatorios.FieldByName('ds_formula_grupo').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      sFGrupo := sAux;
   end;

   slOrdem := TStringList.Create();

   //ordem
   sAux := qRelatorios.FieldByName('ds_ordem').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slOrdem);
   end;

   //formulas padrao
   slFormulas.Add('nm_titulo="' + qRelatorios.FieldByName('nm_relatorio').AsString + '"');

   //Adiciona os campos adicionais do relatório
   for i := 0 to CamposAdicionaisRelatorio.Count - 1 do
   begin
      slFormulas.Add(CamposAdicionaisRelatorio[i]);
   end;
      

   if (Length(sFiltroShow) > 0) then begin
      sFiltroShow := LeftStr(sFiltroShow, Length(sFiltroShow) - 3);
      slFormulas.Add('ds_filtro=' + sFiltroShow);
   end;

   if (Dm.isTrue(qRelatorios.FieldByName('sn_impressao_numero').AsString)) then begin
   
      try
         iNum :=  StrToInt(DM.variavel_parametro('relatorio_impressao_numero'));
      except
         iNum := 1;
      end;

      sAux := IntToStr(iNum);

      Inc(iNum);

      sAux := sAux + DV44(sAux);

      DM.set_variavel_parametro('relatorio_impressao_numero', IntToStr(iNum));

      DM.qAux1.Close;
      Dm.qAux1.SQL.Clear;
      Dm.qAux1.SQL.Add('INSERT INTO relatorios_impressos (nr_impresso, cd_relatorio, cd_pessoa, cd_usuario, anosemestre, turma, dt_relatorio)');
      Dm.qAux1.SQL.Add('VALUES (:numero, :relatorio, :pessoa, :cd_usuario, :anosemestre, :turma, "'+FormatDateTime('yyyy-mm-dd hh:MM:ss', DM.DataAtual())+'")');
      Dm.qAux1.ParamByName('numero').AsInteger := StrToInt(sAux);
      DM.qAux1.ParamByName('relatorio').AsInteger := qRelatorios.FieldByName('cd_relatorio').AsInteger;
      DM.qAux1.ParamByName('pessoa').AsString := txtCodigoAluno.Text;
      DM.qAux1.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
      DM.qAux1.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
      DM.qAux1.ParamByName('turma').AsString := txtTurma.Text;
      DM.qAux1.ExecSQL;
   End;

   if qRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 1 then
      PodeExportar := True
   else if qRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 0 then
      PodeExportar := False;

   if Length(qRelatorios.FieldByName('ds_sql_apos_relatorio').AsString) > 0 then begin

      // Define a mensagem que será apresentada após impressão do relatório
      PrincipalForm.MsgPosImpressao := qRelatorios.FieldByName('ds_mensagem_apos_relatorio').AsString;
              
      // Retorna o SQL que deve ser executado
      PrincipalForm.SQLPosImpressao := qRelatorios.FieldByName('ds_sql_apos_relatorio').AsString;

      // Verifica se possui anosemestre
      if SLParametros.Values['.anosemestre'] <> '' then begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.anosemestre', SLParametros.Values['.anosemestre'], [rfReplaceAll] );
         PrincipalForm.MsgPosImpressao := StringReplace(PrincipalForm.MsgPosImpressao, '.anosemestre', SLParametros.Values['.anosemestre'], [rfReplaceAll] );
      end else begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.anosemestre', 'NULL', [rfReplaceAll] );
      end;

      // Verifica se possui curso
      if SLParametros.Values['.curso'] <> '' then begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.curso', ''''+SLParametros.Values['.curso']+'''', [rfReplaceAll] );
         PrincipalForm.MsgPosImpressao := StringReplace(PrincipalForm.MsgPosImpressao, '.curso', SLParametros.Values['.curso'], [rfReplaceAll] );
      end else begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.curso', 'NULL', [rfReplaceAll] );
      end;

      // Verifica se possui turma
      if SLParametros.Values['.turma'] <> '' then begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.turma', ''''+SLParametros.Values['.turma']+'''', [rfReplaceAll] );
         PrincipalForm.MsgPosImpressao := StringReplace(PrincipalForm.MsgPosImpressao, '.turma', ''''+SLParametros.Values['.turma']+'''', [rfReplaceAll] );
      end else begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.turma', 'NULL', [rfReplaceAll] );
      end;

      // Verifica se possui disciplina
      if SLParametros.Values['.disciplina'] <> '' then begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.disciplina', SLParametros.Values['.disciplina'], [rfReplaceAll] );
         PrincipalForm.MsgPosImpressao := StringReplace(PrincipalForm.MsgPosImpressao, '.disciplina', SLParametros.Values['.disciplina'], [rfReplaceAll] );
      end else begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.disciplina', 'NULL', [rfReplaceAll] );
      end;

      // Verifica se possui bimestre
      if SLParametros.Values['.bimestre'] <> '' then begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.bimestre', SLParametros.Values['.bimestre'], [rfReplaceAll] );
         PrincipalForm.MsgPosImpressao := StringReplace(PrincipalForm.MsgPosImpressao, '.bimestre', SLParametros.Values['.bimestre'], [rfReplaceAll] );
      end else begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.bimestre', 'NULL', [rfReplaceAll] );
      end;

      // Verifica se possui codigoaluno
      if SLParametros.Values['.codigoaluno'] <> '' then begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.codigoaluno', SLParametros.Values['.codigoaluno'], [rfReplaceAll] );
         PrincipalForm.MsgPosImpressao := StringReplace(PrincipalForm.MsgPosImpressao, '.codigoaluno', SLParametros.Values['.codigoaluno'], [rfReplaceAll] );
      end else begin
         PrincipalForm.SQLPosImpressao := StringReplace(PrincipalForm.SQLPosImpressao, '.codigoaluno', 'NULL', [rfReplaceAll] );
      end;

   end;

   bAux := PrincipalForm.ImprimeRpt(
      Self,
      sArqRelatorio,
      qRelatorios.FieldByName('cd_cabecalho').AsInteger,
      sFSelecao,
      SFGrupo,
      slFormulas,
      slOrdem,
      nil,
      slSQLExp,
      True,
      False,
      SLParametros,
      PodeExportar);

   if (not bAux) AND (Dm.isTrue(qRelatorios.FieldByName('sn_impressao_numero').AsString)) then
   begin

      Dm.CriarConsulta(qyDelete);

      qyDelete.SQL.Clear;
      qyDelete.SQL.Add('DELETE FROM relatorios_impressos WHERE nr_impresso = :numero AND cd_relatorio = :relatorio AND cd_pessoa = :pessoa AND ');
      qyDelete.SQL.Add('cd_usuario =  :cd_usuario AND anosemestre = :anosemestre AND turma = :turma ');
      qyDelete.ParamByName('numero').AsInteger     := StrToInt(sAux);
      qyDelete.ParamByName('relatorio').AsInteger  := qRelatorios.FieldByName('cd_relatorio').AsInteger;
      qyDelete.ParamByName('pessoa').AsString      := txtCodigoAluno.Text;
      qyDelete.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
      qyDelete.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
      qyDelete.ParamByName('turma').AsString       := txtTurma.Text;
      qyDelete.ExecSQL;

      FreeAndNil(qyDelete);

   end;

   Exit;


end;

procedure Tfrm_Relatorios.CarregarColigadas;
begin
   DM.CarregaColigadas(cbUnidadeEnsino, true);
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


function Tfrm_Relatorios.validarCampos: Boolean;
var
   sMsgValida : String;
   bValidou : boolean;
begin

   bValidou := false;
   result   := false;
   
   sMsgValida := 'O relatório que está sendo impresso utiliza um recurso especial que obriga o preenchimento do(s) seguinte(s) campo(s):'+#13;
   
   if bDeptoObrigar AND (trim(txtDepartamento.Text) = '')  then begin
      sMsgValida :=  sMsgValida + '-Departamento';
      bValidou   := true;
   end;

   if bCursoObrigar AND (trim(txtCurso.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 +'-Curso';
      bValidou   := true;
   end;

   if bTurmaObrigar AND (trim(txtTurma.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Turma';
      bValidou   := true;
   end;

   if bDisciplinaObrigar AND (trim(txtDisciplina.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Disciplina';
      bValidou   := true;
   end;

   if bPessoaObrigar AND (trim(txtCodigoAluno.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Código Aluno';
      bValidou   := true;
   end;

   if bProfessorObrigar AND (trim(txtProfessor.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Código Professor/Funcionário';
      bValidou   := true;
   end;

   if bValidou then
   begin
      result := true;
      Mensagem(sMsgValida,'Preenchimento de campos',MB_OK+MB_ICONEXCLAMATION);
   end; 

end;

procedure Tfrm_Relatorios.btnCodigoAlunoClick(Sender: TObject);
var
   Field: TField;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante, StrToInt(txtAnoSemestre.Text));

   if resultado_filtro.filtrado then
   begin
      txtCodigoAluno.Text := IntToStr( resultado_filtro.cd_pessoa );

      try
         if resultado_filtro.cd_turma <> '' then
         begin
            txtTurma.Text := resultado_filtro.cd_turma;
         end;
         if resultado_filtro.nr_anosemestre <> -1 then
         begin
            txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
         end;
         if resultado_filtro.cd_curso <> '' then
         begin
            txtCurso.Text := Field.AsString;
         end;
      except
      end;
   end
   else Exit;
end;

procedure Tfrm_Relatorios.btnCodigoDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;

   separador: String;

   i: Integer;
begin
   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([bfdSelecaoMultipla],
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([bfdSelecaoMultipla]);
   end;

   separador := '';

   if (resultado_filtro.filtrado) Then
   begin
      txtDepartamento.Text := '';

      for i := 0 to Length(resultado_filtro.arrDepartamentos) - 1 do
      begin
         txtDepartamento.Text := txtDepartamento.Text +
                                 separador +
                                 IntToStr(resultado_filtro.arrDepartamentos[i].cd_departamento);

         separador := ', ';                                    
      end;

      txtCurso.Text := '';
      txtTurma.Text := '';

      if Length(resultado_filtro.arrDepartamentos) = 1 then
      begin
         DM.LocalizaColigada(cbUnidadeEnsino, resultado_filtro.arrDepartamentos[0].cd_coligada);
      end;
   end;
end;

procedure Tfrm_Relatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
      VK_F7 : btnImprimirClick( nil );
      VK_F12: sbFecharClick( nil );
      VK_F10: begin
         if(sbPreencherVariaveis.Visible)then
         begin
            sbPreencherVariaveisClick( nil );
         end;
      end;
  end;

end;

procedure Tfrm_Relatorios.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Relatorios.sbPreencherVariaveisClick(Sender: TObject);
begin
   { Apresentar a tela de campos adicionais }
   Application.CreateForm(Tfrm_relatorios_adicional, frm_relatorios_adicional);

   qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

   frm_relatorios_adicional.tela := 'academico_relatorios';
   frm_relatorios_adicional.carregar_campos(qRelatorios.FieldByName('cd_relatorio').AsInteger);

   FreeAndNil(frm_relatorios_adicional);
end;

procedure Tfrm_Relatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CamposAdicionaisRelatorio.Free;
   Action := caFree;
end;

procedure Tfrm_Relatorios.FormCreate(Sender: TObject);
begin
   CamposAdicionaisRelatorio := TStringList.Create();
end;

procedure Tfrm_Relatorios.sbPropriedadesClick(Sender: TObject);
begin

   // Mostra a Janela de configuracao da impressora
   PrincipalForm.getRelatorio().Printer.Prompt();
   PrincipalForm.GetRelatorio().Printer.SetCurrent();

end;

procedure Tfrm_Relatorios.cbUnidadeEnsinoChange(Sender: TObject);
begin
   txtDepartamento.Text := '';
   txtCurso.Text := '';
   txtTurma.Text := '';
end;

procedure Tfrm_Relatorios.cbUnidadeEnsinoCloseUp(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure Tfrm_Relatorios.ckDtFiltrarClick(Sender: TObject);
begin
  lblDtInicial.Enabled := ckDtFiltrar.Checked;
  umdtInicial.Enabled := ckDtFiltrar.Checked;
  lblDtFinal.Enabled := ckDtFiltrar.Checked;
  umdtFinal.Enabled := ckDtFiltrar.Checked;
end;

function Tfrm_Relatorios.PerguntaVerRelatorio():Integer;
var
    iQVer: Integer;
begin

      iQVer := Mensagem('Deseja visualizar antes de imprimir?', 'UniMestre - Relatórios', MB_YESNOCANCEL, Self.Handle);

      case iQVer of
    	  IDNO: PrincipalForm.Rel.Output := toPrinter;
	      IDYES: PrincipalForm.Rel.Output := toWindow;
	      IDCANCEL: begin

	         PrincipalForm.Rel.CloseEngine;
           Result := 0;
           Exit;
	      end;
      end;
      Result := iQVer;
end;

procedure Tfrm_Relatorios.Label1Click(Sender: TObject);
begin
   PrincipalForm.LimpaRelObj();
end;

end.
