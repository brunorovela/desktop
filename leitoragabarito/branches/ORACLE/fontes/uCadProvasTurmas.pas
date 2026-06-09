unit uCadProvasTurmas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, uGeneral, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus,
  DBCtrls, Buttons, uTProva, uPessoa;

type
  TfrmCadProvasTurmas = class(TForm)
    qryTurmas: TUMZQuery;
    dtcTurmas: TDataSource;
    Bevel1: TBevel;
    Label1: TLabel;
    grd: TDBGrid;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    pmQtd: TPopupMenu;
    qryTurmasdepto: TStringField;
    qryTurmascurso: TStringField;
    qryTurmasanosemestre: TSmallintField;
    qryTurmasturma: TStringField;
    cbDepto: TComboBox;
    cbCurso: TComboBox;
    cbTurma: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnFechar: TSpeedButton;
    qyCombo: TUMZQuery;
    cbAnoSemextre: TCheckBox;
    SpeedButton1: TSpeedButton;
    sbSalvar: TSpeedButton;
    cbAlunosCursando: TCheckBox;
    procedure grdDblClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra(Sender : TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure cbDeptoChange(Sender: TObject);
    procedure cbCursoChange(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure cbTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbAnoSemextreClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Salvar();
    procedure Fechar();
  public
    flgSearch : Boolean;
    cd_prova : integer;
    { Public declarations }
  end;

var
  frmCadProvasTurmas: TfrmCadProvasTurmas;

implementation

uses Main, uDM, uCadProvas, uFSplash;

{$R *.DFM}

procedure TfrmCadProvasTurmas.btnFecharClick(Sender: TObject);
begin
   Fechar();
end;

procedure TfrmCadProvasTurmas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmCadProvasTurmas.txtTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  Filtra(Sender);
end;

procedure TfrmCadProvasTurmas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  Filtra(Sender);

end;


procedure TfrmCadProvasTurmas.FormPaint(Sender: TObject);
begin
   PapelParede(Sender);
end;

procedure TfrmCadProvasTurmas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  if qryTurmas.Active then Exit;

  txtAnoSemestre.text := IntToStr(ano_semestre);

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  txtAnoSemestre.Enabled := cbAnoSemextre.Checked;
  UpDown2.Enabled := cbAnoSemextre.Checked;;

  Filtra(Sender);

end;

procedure TfrmCadProvasTurmas.Filtra(Sender : TObject);
var
  depto, curso, turma: integer;
begin

  qryTurmas.Close;
  qryTurmas.SQL.Clear;

  qryTurmas.SQL.Add( ' SELECT ' );
  qryTurmas.SQL.Add( '	  d.descricao as depto, ' );
  qryTurmas.SQL.Add( '	  cc.cd_curso as curso, ' );
  qryTurmas.SQL.Add( '	  t.anosemestre, ' );
  qryTurmas.SQL.Add( '	  t.codigo as turma ' );
  qryTurmas.SQL.Add( ' FROM ' );
  qryTurmas.SQL.Add( '    departamentos d ' );

  qryTurmas.SQL.Add( '    INNER JOIN cursos_coligadas cc ON ( ' );
  qryTurmas.SQL.Add( '       cc.CD_DEPTO = d.codigo AND cc.CD_COLIGADA = d.cd_coligada AND cc.SN_ATIVO = 1 ' );
  qryTurmas.SQL.Add( '    ) ' );

  qryTurmas.SQL.Add( '    INNER JOIN turmas t ON ( ' );
  qryTurmas.SQL.Add( '       t.curso = cc.CD_CURSO AND t.cd_coligada = cc.CD_COLIGADA ' );
  qryTurmas.SQL.Add( '    ) ' );

  qryTurmas.SQL.Add( '    INNER JOIN grades_disciplinas gd ON ( ' );
  qryTurmas.SQL.Add( '       gd.NR_SERIE = t.serie AND gd.CD_CURSO = t.curso AND gd.CD_GRADE = t.cd_grade ' );
  qryTurmas.SQL.Add( '    ) ' );

  qryTurmas.SQL.Add( ' WHERE 1=1 ' );

  if cbAnoSemextre.Checked then
  begin
     qryTurmas.SQL.Add( '	AND t.anosemestre = :anosemestre ');
     qryTurmas.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);
  end;

  if cbDepto.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND d.descricao like :depto ');
    qryTurmas.ParamByName('depto').AsString := cbDepto.Text + '%';
  end;

  if cbCurso.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND cc.cd_curso like :curso ');
    qryTurmas.ParamByName('curso').AsString := cbCurso.Text  + '%';
  end;

  if cbTurma.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND t.codigo like :turma ');
    qryTurmas.ParamByName('turma').AsString := cbTurma.Text + '%';
  end;

  qryTurmas.SQL.Add( 'GROUP BY ');
  qryTurmas.SQL.Add( '	d.codigo, ');
  qryTurmas.SQL.Add( '	cc.cd_curso, ');
  qryTurmas.SQL.Add( '	t.codigo ');
  qryTurmas.SQL.Add( 'ORDER BY ');
  qryTurmas.SQL.Add( '	t.codigo ');

  qryTurmas.Open;

  if TWinControl(Sender).Tag < 2 then
  begin
   { Preenchendo o combo Departamentos }
     depto := cbDepto.ItemIndex;
     cbDepto.Items.Clear;
     qyCombo.Close;
     qyCombo.SQL.Clear;
     qyCombo.SQL.Add( 'SELECT ' );
     qyCombo.SQL.Add( ' 	DISTINCT(d.descricao) as depto ' );
     qyCombo.SQL.Add( ' FROM ' );
     qyCombo.SQL.Add( '    departamentos d ' );

     qyCombo.SQL.Add( '    INNER JOIN cursos_coligadas cc ON ( ' );
     qyCombo.SQL.Add( '       cc.CD_DEPTO = d.codigo AND cc.CD_COLIGADA = d.cd_coligada AND cc.SN_ATIVO = 1 ' );
     qyCombo.SQL.Add( '    ) ' );

     qyCombo.SQL.Add( ' WHERE ' );
     qyCombo.SQL.Add( ' 	1=1 ' );

     qyCombo.SQL.Add( ' ORDER BY ' );
     qyCombo.SQL.Add( ' 	d.descricao ' );
     qyCombo.Open;


     while not qyCombo.eof do
     begin
       cbDepto.Items.Add(qyCombo.FieldByName('depto').AsString);
       qyCombo.Next;
     end;
     cbDepto.ItemIndex := depto;
     { / Preenchendo o combo Departamentos }

  end;

  if TWinControl(Sender).Tag < 3 then
  begin
     { Preenchendo o combo Cursos }
     curso := cbCurso.ItemIndex;
     cbCurso.Items.Clear;
     qyCombo.Close;
     qyCombo.SQL.Clear;
     qyCombo.SQL.Add( ' SELECT ' );
     qyCombo.SQL.Add( ' 	DISTINCT(cc.cd_curso) as curso ' );
     qyCombo.SQL.Add( ' FROM ' );
     qyCombo.SQL.Add( '    departamentos d ' );

     qyCombo.SQL.Add( '    INNER JOIN cursos_coligadas cc ON ( ' );
     qyCombo.SQL.Add( '       cc.CD_DEPTO = d.codigo AND cc.CD_COLIGADA = d.cd_coligada AND cc.SN_ATIVO = 1 ' );
     qyCombo.SQL.Add( '    ) ' );
     qyCombo.SQL.Add( ' WHERE ' );
     qyCombo.SQL.Add( ' 	1=1 ' );

     if cbDepto.Text <> '' then
       qyCombo.SQL.Add('	AND d.descricao like :depto ' );

     qyCombo.SQL.Add('ORDER BY ' );
     qyCombo.SQL.Add('	cc.cd_curso ' );

     if cbDepto.Text <> '' then
       qyCombo.ParamByName('depto').AsString := cbDepto.Text + '%';

     qyCombo.Open;
     while not qyCombo.eof do
     begin
       cbCurso.Items.Add(qyCombo.FieldByName('curso').AsString);
       qyCombo.Next;
     end;
     cbCurso.ItemIndex := curso;
     { / Preenchendo o combo Cursos }

  end;

  if TWinControl(Sender).Tag < 4 then
  begin

     { Preenchendo o combo Turmas }
     turma := cbTurma.ItemIndex;
     cbTurma.Items.Clear;

     qyCombo.Close;
     qyCombo.SQL.Clear;

     qyCombo.SQL.Add( ' SELECT ' );
     qyCombo.SQL.Add( ' 	d.descricao as depto, ' );
     qyCombo.SQL.Add( ' 	cc.cd_curso as curso, ' );
     qyCombo.SQL.Add( ' 	t.anosemestre, ' );
     qyCombo.SQL.Add( ' 	t.codigo as turma ' );
     qyCombo.SQL.Add( ' FROM ' );
     qyCombo.SQL.Add( '    departamentos d ' );

     qyCombo.SQL.Add( '    INNER JOIN cursos_coligadas cc ON ( ' );
     qyCombo.SQL.Add( '       cc.CD_DEPTO = d.codigo AND cc.CD_COLIGADA = d.cd_coligada AND cc.SN_ATIVO = 1 ' );
     qyCombo.SQL.Add( '    ) ' );

     qyCombo.SQL.Add( '    INNER JOIN turmas t ON ( ' );
     qyCombo.SQL.Add( '       t.curso = cc.CD_CURSO AND t.cd_coligada = cc.CD_COLIGADA ' );
     qyCombo.SQL.Add( '    ) ' );
     qyCombo.SQL.Add( ' WHERE 1=1 ');

     if cbAnoSemextre.Checked then
     begin
        qyCombo.SQL.Add( '	AND t.anosemestre = :anosemestre ' );
        qyCombo.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);
     end;

     if cbDepto.Text <> '' then
     begin
        qyCombo.SQL.Add( '	AND d.descricao like :depto ' );
        qyCombo.ParamByName('depto').AsString := cbDepto.Text + '%';
     end;

     if cbCurso.Text <> '' then
     begin
        qyCombo.SQL.Add( '	AND cc.cd_curso like :curso '  );
        qyCombo.ParamByName('curso').AsString := cbCurso.Text + '%';
     end;

     if cbTurma.Text <> '' then
     begin
       qyCombo.SQL.Add( '	AND t.codigo like :turma ' );
       qyCombo.ParamByName('turma').AsString := cbTurma.Text + '%';
     end;

     qyCombo.SQL.Add( 'GROUP BY ' );
     qyCombo.SQL.Add( '	d.codigo, ' );
     qyCombo.SQL.Add( '	cc.cd_curso, ' );
     qyCombo.SQL.Add( '	t.codigo ' );
     qyCombo.SQL.Add( 'ORDER BY ' );
     qyCombo.SQL.Add( '	t.codigo ' );

     qyCombo.Open;

     while not qyCombo.eof do
     begin
       cbTurma.Items.Add(qyCombo.FieldByName('turma').AsString);
       qyCombo.Next;
     end;
     cbTurma.ItemIndex := turma;
     { / Preenchendo o combo Turmas }
   End;

end;

procedure TfrmCadProvasTurmas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryTurmas, pmQtd);

end;

procedure TfrmCadProvasTurmas.cbDeptoChange(Sender: TObject);
begin
  Filtra(Sender);
end;

procedure TfrmCadProvasTurmas.cbCursoChange(Sender: TObject);
begin
  Filtra (Sender);
end;

procedure TfrmCadProvasTurmas.cbTurmaChange(Sender: TObject);
begin
  Filtra (Sender) ;
end;

procedure TfrmCadProvasTurmas.cbTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmCadProvasTurmas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmCadProvasTurmas.cbAnoSemextreClick(Sender: TObject);
begin
   Filtra(Sender);
end;

procedure TfrmCadProvasTurmas.SpeedButton1Click(Sender: TObject);
begin
  Salvar();
  Fechar();
end;

procedure TfrmCadProvasTurmas.Salvar();
var
   qyListaAlunosTurmas : TUMZReadOnlyQuery;
   iNumero1, resp : Integer;

   prova : TProva;
   builder : TInclusaoProvaAlunoBuilder;

   sAuxDisc : string;
   sAuxCurso : string;

   pessoa : TPessoa;

   usaEfeitoVisual : Boolean;

   {iNumero : integer;
   iNumero1 : integer;
   iNumero2 : integer;
   sCodigo : string;
   iProva : integer;
   iQuestoes : integer;

   bComparacao: Boolean;}
begin
   resp := -1;

   if grd.SelectedRows.Count < 1 then
   begin
      TGeneral.Mensagem( 'Selecione pelo menos uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;

   usaEfeitoVisual := DM.db.SQLHourGlass;
   DM.db.SQLHourGlass := False;

   DM.CriarConsulta(qyListaAlunosTurmas);
   prova := TProva.Create(cd_prova);
   builder := prova.createBuilderInclusaoProvaAluno();

   TfSplash.GetInstancia().ShowSplashScreen('Inclusão de Alunos na Prova');

   for iNumero1 := 0 to grd.SelectedRows.Count - 1 do
   begin
      grd.DataSource.DataSet.GotoBookmark(Pointer(grd.SelectedRows.Items[iNumero1]));
      qyListaAlunosTurmas.Close();

      TfSplash.GetInstancia().SetSplashText(Format(
         '[Turmas: %d de %d] Carregando alunos da turma: %s',
         [iNumero1+1, grd.SelectedRows.Count, qryTurmas.FieldByName('turma').AsString]
      ));

      if cbAlunosCursando.Checked then
      begin
         sAuxDisc := '';
         sAuxCurso := '';

         frmCadProvas.qyDisciplinas.First;
         while not frmCadProvas.qyDisciplinas.Eof do
         begin
            sAuxDisc := sAuxDisc + ',' + frmCadProvas.qyDisciplinas.FieldByName('cd_disciplina').AsString;
            sAuxCurso := sAuxCurso + ',''' + frmCadProvas.qyDisciplinas.FieldByName('cd_curso').AsString+'''';

            frmCadProvas.qyDisciplinas.Next;
         end;

         sAuxDisc := Copy(sAuxDisc,2);
         sAuxCurso := Copy(sAuxCurso,2);

         qyListaAlunosTurmas.SQL.Text :=
            'SELECT ' +
            '  m.codigoaluno, ' +
            '  fi.turma, ' +
            '  m.anosemestre, ' +
            '  COUNT(fi.codigoaluno) AS qtd_discs ' +
            'FROM ' +
            '  matriculas m ' +
            '  	INNER JOIN fichaindividual fi ON (fi.anosemestre = m.anosemestre ANd fi.codigoaluno = m.codigoaluno AND m.turma = fi.turmamatricula AND fi.disciplina in ('+sAuxDisc+') AND fi.curso in ('+sAuxCurso+')) ' +
            '     INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) ' +
            'WHERE ' +
            '  m.anosemestre = :nr_anosemestre AND ' +
            '  fi.turma = :cd_turma AND ' +
            '  fi.situacao not in (3, 4, 5, 6, 7, 8) ' +
            'GROUP BY ' +
            '  m.codigoaluno ' +
            'ORDER BY ' +
            '	p.nm_pessoa ';
      end else begin
         qyListaAlunosTurmas.SQL.Text :=
            'SELECT ' +
            '  m.codigoaluno, ' +
            '  m.turma, ' +
            '  m.anosemestre ' +
            'FROM ' +
            '  matriculas m ' +
            '     INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) ' +
            'WHERE ' +
            '  m.anosemestre = :nr_anosemestre AND ' +
            '  m.turma = :cd_turma AND ' +
            '  m.situacao not in (3, 4, 5, 6, 7, 8) ' +
            'GROUP BY ' +
            '  m.codigoaluno ' +
            'ORDER BY ' +
            '	p.nm_pessoa ';
      end;

      qyListaAlunosTurmas.ParamByName('nr_anosemestre').AsInteger := qryTurmas.FieldByName('anosemestre').AsInteger;
      qyListaAlunosTurmas.ParamByName('cd_turma').AsString := qryTurmas.FieldByName('turma').AsString;
      qyListaAlunosTurmas.Open();

      while not qyListaAlunosTurmas.Eof do
      begin
         pessoa := TPessoa.Create(qyListaAlunosTurmas.FieldByName('codigoaluno').AsInteger);

         try
            TfSplash.GetInstancia().SetSplashText(Format(
               '[%s] - [Alunos: %d de %d] Incluindo aluno(a) %s na prova',
               [qryTurmas.FieldByName('turma').AsString, qyListaAlunosTurmas.RecNo, qyListaAlunosTurmas.RecordCount, Copy(pessoa.Nome, 1, 20) + '...']
            ));

            builder.AddAluno(TAlunoProvaIncluir.Create(
               pessoa,
               qyListaAlunosTurmas.FieldByName('anosemestre').AsInteger,
               qyListaAlunosTurmas.FieldByName('turma').AsString
            ));
         except
            on E: ExceptionInclusaoProvaAlunoBuilder do
            begin
               if resp <> mrYesToAll then
               begin
                  TfSplash.GetInstancia().HideSplashScreen();
                  resp := TGeneral.Mensagem(E.Message + #13 + 'Deseja continuar?', mtInformation, [mbYes, mbNo, mbYesToAll], ['Sim', 'Não', 'Sim para Todos'], 97 );
               end;

               if resp = mrNo then
               begin
                  break;
               end;

               TfSplash.GetInstancia().ShowSplash();
            end;
         end;

         qyListaAlunosTurmas.Next();
      end;
   end;

   TfSplash.GetInstancia().SetSplashText('Aguarde...');

   try
      builder.Executar();

      TfSplash.GetInstancia().CloseSplashScreen();
      Mensagem('Alunos inseridos com sucesso.');

      frmCadProvas.qyTurmas.Close();
      frmCadProvas.qyTurmas.Open();
   except
      on E: ExceptionInclusaoProvaAlunoBuilder do
      begin
         TfSplash.GetInstancia().CloseSplashScreen();
         Mensagem(E.Message);
      end;
   end;

   DM.db.SQLHourGlass := usaEfeitoVisual;
end;

procedure TfrmCadProvasTurmas.Fechar();
begin
  flgSearch := True;
  Close;
end;

procedure TfrmCadProvasTurmas.sbSalvarClick(Sender: TObject);
begin
   Salvar();
end;

procedure TfrmCadProvasTurmas.grdDblClick(Sender: TObject);
begin
  Salvar();
end;

end.
