unit uTableFields;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, uDM, ExtCtrls, StdCtrls, dblookup, DBCtrls, UMComboBox, uItemCombo;

type
  TfrmTableFields = class(TForm)
    qry: TUMZQuery;
    tblDisciplinas: TUMZQuery;
    tblDisciplinasCurso: TStringField;
    tblDisciplinasSigla: TStringField;
    tblDisciplinasDescricao: TStringField;
    qyMatriculas: TUMZQuery;
    qyMatriculasCurso: TStringField;
    qyMatriculasTurma: TStringField;
    qyMatriculasDisciplina: TIntegerField;
    qyMatriculasDescricao: TStringField;
    qyProcSelAreas: TUMZQuery;
    qyProcSelAreascd_area: TStringField;
    qyProcSelAreasds_area: TStringField;
    qyProcSelDisc: TUMZQuery;
    qyProcSelDisccd_area: TStringField;
    qyProcSelDisccd_disc: TIntegerField;
    qyProcSelDisccd_curso: TStringField;
    qyProcSelDiscsigla: TStringField;
    qyProcSelDiscdescricao: TStringField;
    qyGrade: TUMZQuery;
    qyGradeCurso: TStringField;
    qyGradeTurma: TStringField;
    qyGradeDisciplina: TIntegerField;
    qyGradeDescricao: TStringField;
    qyGradeProfessor: TIntegerField;
    tblCursos: TUMZQuery;
    tblCursoscodigo: TStringField;
    tblCursosapelido: TStringField;
    tblDisciplinascodigo: TIntegerField;
    pnlFiltraDisc: TPanel;
    pnlRegistros: TPanel;
    Tree: TTreeView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDescricao: TEdit;
    Button1: TButton;
    qryDepartamento: TUMZQuery;
    qryCurso: TUMZQuery;
    qryUnidade: TUMZQuery;
    dsUnidade: TDataSource;
    dsDepartamento: TDataSource;
    dsCurso: TDataSource;
    qryUnidadecd_coligada: TIntegerField;
    qryUnidadenm_coligada: TStringField;
    qryUnidadenm_razao_social: TStringField;
    qryUnidadeds_cnpj: TStringField;
    qryUnidadecd_municipio: TLargeintField;
    qryUnidadecd_escola: TLargeintField;
    qryUnidadecd_unidade_rede: TLargeintField;
    qryUnidadesn_academico: TIntegerField;
    qryUnidadesn_financeiro: TIntegerField;
    qryUnidadeds_codcliente: TStringField;
    qryUnidadenm_diretor_geral: TStringField;
    qryUnidadenm_diretor_acad: TStringField;
    qryUnidadenm_diretor_finan: TStringField;
    qryUnidadenm_testemunha1: TStringField;
    qryUnidadenm_testemunha2: TStringField;
    qryUnidadeds_cpf_geral: TStringField;
    qryUnidadeds_cpf_acad: TStringField;
    qryUnidadeds_cpf_finan: TStringField;
    qryUnidadeds_cpf_test1: TStringField;
    qryUnidadeds_cpf_test2: TStringField;
    qryUnidademe_instituicao: TStringField;
    qryUnidademe_diretor: TStringField;
    qryUnidadeds_cidade: TStringField;
    qryUnidadeSN_MATRIZ: TSmallintField;
    qryUnidadeCD_COLIGADA_MATRIZ: TIntegerField;
    qryUnidadeds_estado: TStringField;
    qryUnidadecd_instituicao_mec: TIntegerField;
    qryUnidadeds_endereco: TStringField;
    qryUnidadeds_numero: TStringField;
    qryUnidadeds_complemento: TStringField;
    qryUnidadeds_bairro: TStringField;
    qryUnidadeds_cep: TStringField;
    qryUnidadeds_email_geral: TStringField;
    qryUnidadeds_latitude: TStringField;
    qryUnidadeds_longitude: TStringField;
    qryUnidadeds_nre: TStringField;
    qryUnidadeds_ato_direto: TStringField;
    qryUnidademe_secretaria: TStringField;
    qryUnidadeds_ato_secretaria: TStringField;
    qryUnidadeds_ato_ofic_estab: TStringField;
    qryDepartamentocodigo: TSmallintField;
    qryDepartamentodescricao: TStringField;
    qryDepartamentorazaosocial: TStringField;
    qryDepartamentosn_online: TStringField;
    qryDepartamentocd_caixa: TIntegerField;
    qryDepartamentocd_coligada: TIntegerField;
    qryDepartamentocd_boleto_padrao: TIntegerField;
    qryDepartamentosn_alterar_boleto: TSmallintField;
    qryDepartamentods_cnpj: TStringField;
    qryDepartamentocd_boleto_online: TIntegerField;
    qryDepartamentods_mascara_matricula: TStringField;
    qryDepartamentods_endereco: TStringField;
    qryDepartamentods_bairro: TStringField;
    qryDepartamentods_cidade: TStringField;
    qryDepartamentods_estado: TStringField;
    qryDepartamentods_cep: TStringField;
    qryDepartamentocd_instituicao: TIntegerField;
    qryCursoCD_CURSO: TStringField;
    qryCursoDS_CURSO: TStringField;
    CbUnidade: TUMComboBox;
    cbCurso: TUMComboBox;
    cbDepartamento: TUMComboBox;
    procedure CbUnidadeCloseUp(Sender: TObject);
    procedure cbDepartamentoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    procedure ConstroiTree(strQuery:String);
    procedure ConstroiReports;
    procedure ConstroiTreeCurso();
    procedure ConstroiTreeDisc(Curso: string; Coligada: Integer);
    procedure ConstroiTreeTodasDisc(Curso: string; Coligada: Integer);
    procedure ConstroiTreeGradeProf;
    procedure ConstroiTreeMatriculas;
    procedure ConstroiTreeProcSelAreas();
    procedure ConstroiTreeProcSelDisc(cd_area:string);
    procedure ConstroiTreeProdutos();
    procedure limpaTree();
    procedure arrumarCombos();
    { Public declarations }
  end;
  const sqlDisc = ''+
         'SELECT                          '+
         '  	d.CURSO AS curso,          '+
         '  	d.SIGLA AS sigla,          '+
         '  	d.DESCRICAO AS descricao,  '+
         '	   d.codigo AS codigo         '+
         'FROM                            '+
         '	DISCIPLINAS d                 '+
         '	INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = d.curso AND cc.SN_ATIVO = 1)'+
         'WHERE                           '+
         '	d.curso like :Curso AND       '+
         '	cc.CD_COLIGADA in             '; 

        ordenarDisc =
        'GROUP BY              '+
        ' d.curso, d.descricao '+
        'ORDER BY              '+
        ' d.curso, d.descricao ';
var
  frmTableFields: TfrmTableFields;

implementation

uses uProfessor, uProfessores;

{$R *.DFM}

procedure TfrmTableFields.ConstroiTreeGradeProf;
{ Utilizado para construir o Tree View do Professor }
var
//  n, i, j:Integer;
  str1, str2: String;
  NoCurso : TTreeNode;
  NoTurma : TTreeNode;
begin
  limpaTree();
  frmProfessores.tblGrade.First;
  //NoCurso := Tree.Items.Add( Tree.TopItem, 'Curso: '+frmProfessores.tblGradeCurso.AsString );
  NoCurso := Tree.Items.Add( Tree.TopItem, frmProfessores.tblGradeCurso.AsString );
//  i := Tree.Items.Count - 1;

  //NoTurma := Tree.Items.AddChild( NoCurso, 'Turma: '+FrmProfessores.tblGradeTurma.AsString );
  NoTurma := Tree.Items.AddChild( NoCurso, frmProfessores.tblGradeTurma.AsString );
//  j := Tree.Items[i].Count - 1;
  str2 := frmProfessores.tblGradeTurma.AsString;
  str1 := frmProfessores.tblGradeCurso.AsString;
  frmProfessores.tblGradeTurma.AsString;
  while not frmProfessores.tblGrade.Eof do
  begin
    if frmProfessores.tblGradeCurso.AsString <> str1 then
    begin
      //Nocurso := Tree.Items.Add( Tree.TopItem, 'Curso: '+frmProfessores.tblGradeCurso.AsString );
      Nocurso := Tree.Items.Add( Tree.TopItem, frmProfessores.tblGradeCurso.AsString );
      str1 := frmProfessores.tblGradeCurso.AsString;
//      i := Tree.Items.Count - 1;
      str2 := '';
    end;
    // Adicionar as Turmas
    if frmProfessores.tblGradeTurma.AsString <> str2 Then
    Begin
       //NoTurma := Tree.Items.AddChild( NoCurso, 'Turma: '+FrmProfessores.tblGradeTurma.AsString );
       NoTurma := Tree.Items.AddChild( NoCurso, frmProfessores.tblGradeTurma.AsString );
       str2 := frmProfessores.tblGradeTurma.AsString;
//       j := Tree.Items[i].Count - 1;
    End;
    // Disciplinas
    Tree.Items.AddChild( NoTurma, frmProfessores.tblGradeDisciplina.DisplayText + ' - ' +
      frmProfessores.tblGradeDescricao.AsString );
    frmProfessores.tblGrade.Next;
  end;
end;



procedure TfrmTableFields.ConstroiTree(strQuery:String);
var
  n, i:Integer;
begin

  with qry do
  begin
    Close;
    SQL.Clear;
    SQL.Add( strQuery );
    try
      ParamByName('NULL').AsInteger := 0;
      Open;
    except
      ParamByName('NULL').AsString := '';
      Open;
    end;

    i := Tree.Items.Count - 1;

    for n := 0 to qry.FieldCount - 1 do
    begin
      Tree.Items.AddChild( Tree.Items[i], qry.FieldDefs.Items[n].Name );
    end;

  end;

end;

procedure TfrmTableFields.ConstroiTreeCurso;
begin

  limpaTree();

  tblCursos.Close();
  tblCursos.Open();

  while not tblCursos.Eof do
  begin

      Tree.Items.Add( Tree.TopItem, tblCursoscodigo.AsString );
      tblCursos.Next();
  end;
  
end;

procedure TfrmTableFields.TreeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  Tree.BeginDrag(True);
end;

procedure TfrmTableFields.arrumarCombos;
CONST
   SQL_CURSO = 'Select * From cursos_mestre;';
   SQL_DEPTO = 'Select * From departamentos;';
   SQL_UNIDADE = 'Select * From coligadas;';
begin
   // indica se é pra abrir por disciplina
   if frmTableFields.Tag = 1 then
   begin
      qryCurso.SQL.Text := SQL_CURSO;
      qryUnidade.SQL.Text := SQL_UNIDADE;
      qryDepartamento.SQL.Text := SQL_DEPTO;

      qryCurso.Open;
      qryUnidade.Open;
      qryDepartamento.Open;

      qryUnidade.First;

      CbUnidade.addItem('Todas Unidades', nil);
      while not qryUnidade.Eof do
      begin

         CbUnidade.addItem(
            qryUnidadenm_coligada.asString,
            TItemCombo.create(
               qryUnidadecd_coligada.asString, ''
            )
         );

         qryUnidade.Next;

      end;
      CbUnidade.ItemIndex := 0;

      qryDepartamento.First;
      cbDepartamento.addItem('Todos Departamentos', nil);
      while not qryDepartamento.Eof do
      begin

         cbDepartamento.addItem(
            qryDepartamentodescricao.asString,
            TItemCombo.create(
               qryDepartamentocodigo.asString, ''
            )
         );

         qryDepartamento.Next;

      end;
      cbDepartamento.ItemIndex := 0;

      qryCurso.First;
      cbCurso.addItem('Todos Cursos', nil);
      while not qryCurso.Eof do
      begin

         cbCurso.addItem(
            qryCursoDS_CURSO.AsString,
            TItemCombo.create(
               qryCursoCD_CURSO.asString, ''
            )
         );

         qryCurso.Next;

      end;
      cbCurso.ItemIndex := 0;

   end;
end;

procedure TfrmTableFields.Button1Click(Sender: TObject);
begin
   ConstroiTreeDisc('-1', -1);
end;

procedure TfrmTableFields.cbDepartamentoChange(Sender: TObject);
begin

   if cbDepartamento.ItemIndex > 0 then
   begin

       //Filtra curso
      qryCurso.Close;
      
      qryCurso.SQL.Text :=  ''+
         ' SELECT ' + 
         '    cm.cd_curso AS CD_CURSO, ' +
	      '    cm.DS_CURSO AS DS_CURSO ' +
         ' FROM ' +
	      '    cursos_mestre cm ' +
         ' INNER JOIN cursos_coligadas cc ON (cm.CD_CURSO = cc.cd_curso) ' +
         ' WHERE ' +
         '    CD_DEPTO = :cd_depto';

      qryCurso.ParamByName('cd_depto').AsInteger :=
         StrToInt(TItemCombo(cbDepartamento.items.objects[cbDepartamento.ItemIndex]).getCodigo);

      if CbUnidade.ItemIndex > 0 then
      begin
         qryCurso.SQL.Add(' AND cd_coligada = :cd_coligada ');

         qryCurso.ParamByName('cd_coligada').AsInteger :=
            StrToInt(TItemCombo(CbUnidade.items.objects[CbUnidade.ItemIndex]).getCodigo);
      end;

      qryCurso.Open;
      qryCurso.First;
      
      cbCurso.Clear;
      cbCurso.addItem('Todos Cursos', nil);
      while not qryCurso.Eof do
      begin
         cbCurso.addItem(
            qryCursoDS_CURSO.AsString,
            TItemCombo.create(
               qryCursoCD_CURSO.asString, ''
            )
         );

         qryCurso.Next;

      end;
      cbCurso.ItemIndex := 0;

   end;
   
end;

procedure TfrmTableFields.CbUnidadeCloseUp(Sender: TObject);
begin
   {Se selecionou alguma unidade especifica carregar apenas os departamentos e cursos da coligada}
   if CbUnidade.ItemIndex > 0 then
   begin
      //Filtra departamento
      qryDepartamento.Close;
      qryDepartamento.SQL.Text := 'SELECT * FROM departamentos where cd_coligada = :cd_coligada';

      qryDepartamento.ParamByName('cd_coligada').AsInteger :=
         StrToInt(TItemCombo(CbUnidade.items.objects[CbUnidade.itemindex]).getCodigo);

      qryDepartamento.Open;

      qryDepartamento.First;
      cbDepartamento.Clear;

      cbDepartamento.addItem('Todos Departamentos', nil);
      while not qryDepartamento.Eof do
      begin

         cbDepartamento.addItem(
            qryDepartamentodescricao.asString,
            TItemCombo.create(
               qryDepartamentocodigo.asString, ''
            )
         );

         qryDepartamento.Next;

      end;
      cbDepartamento.ItemIndex := 0;

      //Filtra curso
      qryCurso.Close;
      
      qryCurso.SQL.Text :=  ''+
         ' SELECT ' + 
         '    cm.cd_curso AS CD_CURSO, ' +
	      '    cm.DS_CURSO AS DS_CURSO ' +
         ' FROM ' +
	      '    cursos_mestre cm ' +
         ' INNER JOIN cursos_coligadas cc ON (cm.CD_CURSO = cc.cd_curso) ' +
         ' WHERE ' +
         '    CD_COLIGADA = :cd_coligada';

      qryCurso.ParamByName('cd_coligada').AsInteger :=
         StrToInt(TItemCombo(CbUnidade.items.objects[CbUnidade.itemindex]).getCodigo);

      qryCurso.Open;
      qryCurso.First;
      
      cbCurso.Clear;
      cbCurso.addItem('Todos Cursos', nil);
      while not qryCurso.Eof do
      begin
         cbCurso.addItem(
            qryCursoDS_CURSO.AsString,
            TItemCombo.create(
               qryCursoCD_CURSO.asString, ''
            )
         );

         qryCurso.Next;

      end;
      cbCurso.ItemIndex := 0;
   end
   else if CbUnidade.ItemIndex = 0 then // Se selecionou todas as unidades recarrega as combos com todas as opções
   begin
      CbUnidade.Clear;
      cbDepartamento.Clear;
      cbCurso.Clear;
      arrumarCombos;
   end;
end;

procedure TfrmTableFields.ConstroiTreeTodasDisc(Curso: string; Coligada: Integer);
const
   SQL_DISCIPLINA =
      'SELECT ' +
         'CC.CD_CURSO CURSO,' +
         'D.SIGLA,' +
         'D.DESCRICAO,' +
         'D.CODIGO,' +
         'CC.CD_COLIGADA ' +
      'FROM ' +
         'DISCIPLINAS D ' +
            'JOIN CURSOS_COLIGADAS CC ON ' +
               '(D.CURSO = CC.CD_CURSO) ' +
            'JOIN CURSOS_MESTRE CM ON ' +
               '(CM.CD_CURSO = CC.CD_CURSO) ' +
      'WHERE ' +
         'CM.SN_ATIVO = ''S'' AND '+
         'D.SN_ATIVO = 1 AND ' +
         'D.CURSO LIKE :CD_CURSO AND ' +
         'CC.CD_COLIGADA = :CD_COLIGADA ' +
      'ORDER BY ' +
         'D.CURSO, D.DESCRICAO';
         
   SQL_TODAS_DISCIPLINA =
      'SELECT ' +
         'CC.CD_CURSO CURSO,' +
         'D.SIGLA,' +
         'D.DESCRICAO,' +
         'D.CODIGO,' +
         '0 CD_COLIGADA ' +
      'FROM ' +
         'DISCIPLINAS D ' +
         'JOIN CURSOS_COLIGADAS CC ON ' +
           '(D.CURSO = CC.CD_CURSO) ' +
            'JOIN CURSOS_MESTRE CM ON ' +
               '(CM.CD_CURSO = CC.CD_CURSO) ' +
      'WHERE ' +
         'D.CURSO LIKE :CD_CURSO  '+
         'D.SN_ATIVO = 1 AND ' +
         'AND CC.CD_COLIGADA  IN (%s) '+
      'GROUP BY                   '+
      '   cc.CD_CURSO,D.CODIGO     '+
      'ORDER BY ' +
         'D.CURSO, D.DESCRICAO';
var
  n, i:Integer;
  str1: String;
begin
   limpaTree();

   // na tela de cadastro de grades não existe necessidade de separar disciplinas por coligada
   // como esta treeview é também utilizada em outras areas do sistema fizemos este tratamento
   tblDisciplinas.Close;

   if Coligada = 0 then
   begin
      tblDisciplinas.SQL.Text := Format(SQL_TODAS_DISCIPLINA, [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);
   end
   else
   begin
      tblDisciplinas.SQL.Text := SQL_DISCIPLINA;
      tblDisciplinas.ParamByName('CD_COLIGADA').AsInteger := Coligada;
   end;

   tblDisciplinas.ParamByName('CD_CURSO').AsString := Curso;
   tblDisciplinas.Open;

   Tree.Items.Add( Tree.TopItem, tblDisciplinasCurso.AsString );

   i := Tree.Items.Count - 1;

   str1 := tblDisciplinasCurso.AsString;

   while not tblDisciplinas.Eof do
   begin

      if tblDisciplinasCurso.AsString <> str1 then
      begin
         Tree.Items.Add( Tree.TopItem, tblDisciplinasCurso.AsString );
         str1 := tblDisciplinasCurso.AsString;
         i := Tree.Items.Count - 1;
      end;

      Tree.Items.AddChild( Tree.Items[i],
                        tblDisciplinasCodigo.DisplayText + ' - '+
                        tblDisciplinasDescricao.AsString +' (' +
                        tblDisciplinasSigla.AsString + ') ' );

      tblDisciplinas.Next;
  end;
end;

procedure TfrmTableFields.ConstroiReports;
var
  i : Integer;
begin
  limpaTree();
  Tree.Items.Add( Tree.TopItem, 'Alunos' );
  ConstroiTree('select * from Alunos where Codigo = :NULL' );

  Tree.Items.Add( Tree.TopItem, 'Matriculas' );
  ConstroiTree('select * from Matriculas where CodigoAluno = :NULL' );

  Tree.Items.Add( Tree.TopItem, 'Turmas' );
  ConstroiTree('select * from Turmas where AnoSemestre = :NULL' );

  Tree.Items.Add( Tree.TopItem, 'Cursos' );
  ConstroiTree('select * from Cursos where AnoSemestre = :NULL' );

  Tree.Items.Add( Tree.TopItem, 'Turnos' );
  ConstroiTree('select * from Turnos where Codigo = :NULL' );

  Tree.Items.Add( Tree.TopItem, 'Campos do Relatório' );
  i := Tree.Items.Count - 1;
  Tree.Items.AddChild( Tree.Items[i], '@CodigoAluno');
  Tree.Items.AddChild( Tree.Items[i], '@AnoSemestre');
  Tree.Items.AddChild( Tree.Items[i], '@Situacao');
  Tree.Items.AddChild( Tree.Items[i], '@DataAtual');
  Tree.Items.AddChild( Tree.Items[i], '@Serie');
end;

procedure TfrmTableFields.ConstroiTreeDisc(Curso: string; Coligada: Integer);
const
   SQL_DISCIPLINA =
      'SELECT ' +
         'CC.CD_CURSO CURSO,' +
         'D.SIGLA,' +
         'D.DESCRICAO,' +
         'D.CODIGO,' +
         'CC.CD_COLIGADA ' +
      'FROM ' +
         'DISCIPLINAS D ' +
            'JOIN CURSOS_COLIGADAS CC ON ' +
               '(D.CURSO = CC.CD_CURSO) ' +
            'JOIN CURSOS_MESTRE CM ON ' +
               '(CM.CD_CURSO = CC.CD_CURSO) ' +
      'WHERE ' +
         'CM.SN_ATIVO = ''S''';
var
  n, i:Integer;
  str1: String;
begin
   limpaTree();

   // na tela de cadastro de grades não existe necessidade de separar disciplinas por coligada
   // como esta treeview é também utilizada em outras areas do sistema fizemos este tratamento
   tblDisciplinas.Close;


   tblDisciplinas.SQL.Text := SQL_DISCIPLINA;

   if Curso = '-1' then
   begin

      if cbCurso.ItemIndex <> 0 then
      begin
         tblDisciplinas.SQL.Add(' AND D.CURSO = ''' + TItemCombo(cbcurso.items.objects[cbcurso.itemindex]).getCodigo + '''');
      end;

      if cbDepartamento.ItemIndex <> 0 then
      begin
         tblDisciplinas.SQL.Add(' AND CC.CD_DEPTO = ' + TItemCombo(cbDepartamento.items.objects[cbDepartamento.itemindex]).getCodigo);
      end;

      if CbUnidade.ItemIndex <> 0 then
      begin
         tblDisciplinas.SQL.Add(' AND CC.CD_COLIGADA = ' + TItemCombo(CbUnidade.items.objects[CbUnidade.itemindex]).getCodigo);
      end;

      if edDescricao.Text <> '' then
      begin
         tblDisciplinas.SQL.Add(' AND D.DESCRICAO LIKE ''%' + edDescricao.Text +'%''' );
      end;
      
   end;

   tblDisciplinas.SQL.add('GROUP BY                   '+
                          '   cc.CD_CURSO,D.CODIGO    '+
                          'ORDER BY                   '+
                             'D.CURSO, D.DESCRICAO'   );

   tblDisciplinas.Open;

   Tree.Items.Clear;
   Tree.Items.Add( Tree.TopItem, tblDisciplinasCurso.AsString );

   i := Tree.Items.Count - 1;

   str1 := tblDisciplinasCurso.AsString;

   while not tblDisciplinas.Eof do
   begin

      if tblDisciplinasCurso.AsString <> str1 then
      begin
         Tree.Items.Add( Tree.TopItem, tblDisciplinasCurso.AsString );
         str1 := tblDisciplinasCurso.AsString;
         i := Tree.Items.Count - 1;
      end;

      Tree.Items.AddChild( Tree.Items[i],
                        tblDisciplinasCodigo.DisplayText + ' - '+
                        tblDisciplinasDescricao.AsString +' (' +
                        tblDisciplinasSigla.AsString + ') ' );

      tblDisciplinas.Next;
  end;
end;


procedure TfrmTableFields.ConstroiTreeMatriculas;
{ Utilizado para construir o Tree View do Professor }
var
//  n, i, j:Integer;
  str1, str2: String;
  NoCurso : TTreeNode;
  NoTurma : TTreeNode;
begin
  limpaTree();
  qyMatriculas.First;
  NoCurso := Tree.Items.Add( Tree.TopItem, qyMatriculas.FieldByName('Curso').AsString );

  NoTurma := Tree.Items.AddChild( NoCurso, qyMatriculas.FieldByName('Turma').AsString );

  str2 := qyMatriculas.FieldByName('Turma').AsString;
  str1 := qyMatriculas.FieldByName('Curso').AsString;

  //  FrmProfessores.tblGradeTurma.AsString;

  while not qyMatriculas.Eof do
  begin
    if qyMatriculas.FieldByName('Curso').AsString <> str1 then
    begin
      Nocurso := Tree.Items.Add( Tree.TopItem, qyMatriculas.FieldByName('Curso').AsString );
      str1 := qyMatriculas.FieldByName('Curso').AsString;
      str2 := '';
    end;

    // Adicionar as Turmas
    if qyMatriculas.FieldByName('Turma').AsString <> str2 Then
    Begin
       NoTurma := Tree.Items.AddChild( NoCurso, qyMatriculas.FieldByName('Turma').AsString );
       str2 := qyMatriculas.FieldByName('Turma').AsString;
//       j := Tree.Items[i].Count - 1;
    End;
    // Disciplinas
    Tree.Items.AddChild( NoTurma, qyMatriculas.FieldByName('Disciplina').DisplayText + ' - ' +
      qyMatriculas.FieldByName('Descricao').AsString );
    qyMatriculas.Next;
  end;
end;


procedure TfrmTableFields.ConstroiTreeProcSelAreas();
{ Utilizado para construir o Tree View do Processo Seletivo - Áreas de Concentração }
var
//  n, i, j:Integer;
  NoPrincipal : TTreeNode;
begin
   limpaTree();
  qyProcSelAreas.Close();
  qyProcSelAreas.Open();

  qyProcSelAreas.First;

  NoPrincipal := Tree.Items.Add( Tree.TopItem, 'Escolha:' );

  while not qyProcSelAreas.Eof do
  begin
    Tree.Items.AddChild( NoPrincipal, qyProcSelAreas.FieldByName('cd_area').DisplayText + ' - ' + qyProcSelAreas.FieldByName('ds_area').AsString );
    qyProcSelAreas.Next;
  end;

end;

procedure TfrmTableFields.ConstroiTreeProcSelDisc(cd_area:string);
{ Utilizado para construir o Tree View do Processo Seletivo - Disciplinas }
var
//  n, i, j:Integer;
  NoPrincipal : TTreeNode;
begin
  limpaTree();
  with qyProcSelDisc do begin
    Close();
    ParamByName('cd_area').AsString := cd_area;
    Open();

    First;
  end;

  NoPrincipal := Tree.Items.Add( Tree.TopItem, 'Escolha:' );

  while not qyProcSelDisc.Eof do
  begin
    Tree.Items.AddChild( NoPrincipal, qyProcSelDisc.FieldByName('cd_curso').DisplayText + ' - ' + qyProcSelDisc.FieldByName('cd_disc').AsString + ' - [' + qyProcSelDisc.FieldByName('sigla').AsString + ' - '+qyProcSelDisc.FieldByName('descricao').AsString+']' );
    qyProcSelDisc.Next;
  end;

end;


procedure TfrmTableFields.ConstroiTreeProdutos();
const
   SQL_SELECT_PRODUTO =
      'SELECT ' +
      '  cd_produto, ds_produto ' +
      'FROM ' +
      '  COMP_PRODUTOS' ;
var
    NoPrincipal : TTreeNode;
begin
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add( SQL_SELECT_PRODUTO );
      open;
      First;
   end;      

   NoPrincipal := Tree.Items.Add(Tree.TopItem, 'Produtos: ' );
   
   while not qry.Eof do
   begin
      Tree.Items.AddChild( NoPrincipal, qry.FieldByName('cd_produto').AsString + ' - ' + qry.FieldByName('ds_produto').AsString );
      qry.Next;
   end;
end;

procedure TfrmTableFields.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmTableFields.LimpaTree;
begin
  Tree.Items.Clear();
end;

procedure TfrmTableFields.FormDestroy(Sender: TObject);
begin
   frmTableFields := nil;
end;

procedure TfrmTableFields.FormShow(Sender: TObject);
begin
   arrumarCombos;
end;

end.
