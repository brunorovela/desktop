unit uFTrocaDeTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls,
  CheckLst, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, Mask, General;

type
  TformTransferenciaDeTurma = class(TForm)
    pnMatricula: TPanel;
    pnMatriculaTitulo: TPanel;
    gbOrigem: TGroupBox;
    lbOTTurma: TLabel;
    lbOTurma: TLabel;
    lbOTCurso: TLabel;
    lbOCurso: TLabel;
    pnTitulo: TPanel;
    lbOAnoSem: TLabel;
    lbOTAnoSem: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    pnListaAlunos: TPanel;
    Panel2: TPanel;
    lstAlunos: TCheckListBox;
    gbDestino: TGroupBox;
    bnSelTurma: TSpeedButton;
    bnSelCurso: TSpeedButton;
    lbDTCurso: TLabel;
    lbDTTurma: TLabel;
    lbDTAnoSem: TLabel;
    edDCurso: TEdit;
    edDTurma: TEdit;
    meAnoSem: TMaskEdit;
    udDAnoSem: TUpDown;
    Label1: TLabel;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    qryAtual: TUMZQuery;
    qryNova: TUMZQuery;
    qryAlterarTurma: TUMZQuery;
    qyGruposAtividadesAluno: TUMZQuery;
    qyInativarAluno: TUMZQuery;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure udDAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure bnSelTurmaClick(Sender: TObject);
    procedure bnSelCursoClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    dataMatricula : string;
    procedure carregaAlunos(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer);
    procedure percorreListaPessoas(checar:boolean);
    procedure efetuaTrocaDeTurma();
    function verificaSelecionados(): boolean;
    { Private declarations }
  public
    procedure carregaDados(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer;dt_matricula:String);
    { Public declarations }
  end;

var
  formTransferenciaDeTurma: TformTransferenciaDeTurma;

implementation

uses uDM,uFSelecionarCurso, uFSelecionarTurma, UFObservacoes;

{$R *.dfm}

procedure TformTransferenciaDeTurma.bnSelCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
   curso: String;
begin
   { Pesquisar Cursos }
   curso := lbOCurso.Caption;
   if(edDCurso.Text <> '') then
   begin
      curso := edDCurso.Text;
   end;

   resultado_filtro := TfrmSelecionarCurso.Filtrar([],-1,-1,strtoint(meAnoSem.Text),curso);

   if resultado_filtro.filtrado then
   begin

      meAnoSem.Text := inttostr(resultado_filtro.nr_anosemestre);
      edDCurso.Text := resultado_filtro.cd_curso;
      edDTurma.Text := '';
   end;
end;

procedure TformTransferenciaDeTurma.bnSelTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   curso: String;
begin
   { Pesquisar Turmas }
   curso := lbOCurso.Caption;
   if(edDCurso.Text <> '') then
   begin
      curso := edDCurso.Text;
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([],strtoint(meAnoSem.Text),-1,-1,curso);

   if resultado_filtro.filtrado then
   begin
      meAnoSem.Text := inttostr(resultado_filtro.nr_anosemestre);
      edDCurso.Text := resultado_filtro.cd_curso;
      edDTurma.Text := resultado_filtro.cd_turma;
   end;
end;

procedure TformTransferenciaDeTurma.btnCancelarClick(Sender: TObject);
begin
   self.Close;
end;

procedure TformTransferenciaDeTurma.btnConfirmarClick(Sender: TObject);
begin
   if (edDTurma.Text = '') then
   begin
      Mensagem( 'Você deve selecionar uma turma para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   if (verificaSelecionados() = false) then
   begin
      Mensagem( 'Você deve selecionar pelo menos um aluno para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   if ((edDTurma.Text = lbOTurma.Caption) AND (meAnoSem.Text = lbOAnoSem.Caption)) then
   begin
      Mensagem( 'Você deve selecionar uma turma diferente da atual para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   { Verificar se é no mesmo anosemestre }
   if (meAnoSem.Text <> lbOAnoSem.Caption) Then
   Begin
     if Mensagem('Você está tentando alterar a turma em diferentes Ano/Semestre. É aconselhável re-matricular o aluno na nova turma. Deseja continuar com a transferência mesmo assim?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
     begin
        Exit;
     end;
   End;

   //Troca de Turma
   efetuaTrocaDeTurma();

   self.Close;
end;

procedure TformTransferenciaDeTurma.carregaAlunos(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer);
const
   SQL_CURSOS =
   'SELECT'+
   '  p.cd_pessoa, p.nm_pessoa '+
   'FROM matriculas m '+
   'INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) '+
   'WHERE'+
	'  m.anosemestre = :anosemestre AND '+
   '  m.curso = :curso AND '+
	'  m.turma = :turma AND '+
	'  m.situacao NOT IN (0,2,4,5,6,7,8,9) '+
   'GROUP BY  '+
   ' m.codigoaluno '+
   'ORDER BY p.nm_pessoa';
var
  qryCarregaAlunos : TUMZQuery;
  lista : TStringList;
begin
   DM.CriarConsulta(qryCarregaAlunos);
   lstAlunos.Items.Clear;

   With qryCarregaAlunos do
   begin

      Close;
      SQL.Text := SQL_CURSOS;
      ParamByName('anosemestre').AsString := nr_anosemestre;
      ParamByName('curso').AsString := cd_curso;
      ParamByName('turma').AsString := cd_turma;
      Open;

      while not Eof do
      begin
         lista := TStringList.Create();
         lista.Add(FieldByName('cd_pessoa').AsString);

         lstAlunos.Items.AddObject(FieldByName('nm_pessoa').AsString,lista);

         if(FieldByName('cd_pessoa').AsInteger = cd_pessoa) then
         begin
            lstAlunos.checked[lstAlunos.Count -1] := true;
         end;

         Next;
      end;
   end;
end;

procedure TformTransferenciaDeTurma.carregaDados(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer;dt_matricula:String);
begin
   //Origem
   lbOAnoSem.Caption := nr_anosemestre;
   lbOCurso.Caption := cd_curso;
   lbOTurma.Caption := cd_turma;

   //Destino - padrão
   meAnoSem.Text := nr_anosemestre;
   edDCurso.Text := cd_curso;
   edDTurma.Text := '';

   dataMatricula := dt_matricula;

   carregaAlunos(cd_turma,cd_curso,nr_anosemestre,cd_pessoa);
end;

procedure TformTransferenciaDeTurma.efetuaTrocaDeTurma;
const
   LOG_TROCA_TURMA =
      '[Troca de Turma]' + #13 + #13 +
      #9 + 'Informações da Matrícula Anterior:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Informações da Matrícula Nova:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13;
var
  qyAlteraMonografia: TUMZQuery;
  strNova,strTurmaAntiga,codigoAluno,Observacao,chaves: String;
  strNovoAnoSem,iAnoSemAntigo : Integer;
  i : integer;
begin
   qryNova.Close;
   qryAtual.Close;
   qryAlterarTurma.Close;
   strNova := edDTurma.Text;
   strTurmaAntiga := lbOTurma.Caption;
   strNovoAnoSem := strtoint(meAnoSem.Text);
   iAnoSemAntigo := strtoint(lbOAnoSem.Caption);

   // Selecionar a nova turma
   qryNova.ParamByName('AnoSemestre').AsInteger := strNovoAnoSem;
   qryNova.ParamByName('Turma').AsString := strNova;
   qryNova.Open;

   // Selecionar a turma atual
   qryAtual.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
   qryAtual.ParamByName('Turma').AsString := strTurmaAntiga;
   qryAtual.Open;

   { Apenas troca de Turma }
   Screen.Cursor := crHourGlass;

   try

      for I := 0 to lstAlunos.Items.Count - 1 do
      begin
         if(lstAlunos.Checked[i] = false) then
         begin
            continue;
         end;

         codigoAluno := StringReplace(TStringList(lstAlunos.Items.Objects[i]).GetText,#$D#$A,'',[rfReplaceAll]);

         { Alteração de turma }

         With qryAlterarTurma do
         begin
            // Alteração na Tabela de Matriculas

            SQL.Clear;
            SQL.Add('update Matriculas set Turma = :NovaTurma, AnoSemestre = :NovoAnoSem, Curso = :NovoCurso, nr_aluno = :NrAluno ');
            SQL.Add('where CodigoAluno = :CodigoAluno and Turma = :Turma and AnoSemestre = :AnoSemestre');

            ParamByName('CodigoAluno').AsString := codigoAluno;
            ParamByName('Turma').AsString := strTurmaAntiga;
            ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
            ParamByName('NovaTurma').AsString := strNova;
            ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
            ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;

             // Pegar o Número do Aluno na turma
             if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
                ParamByName('NrAluno').AsInteger := DM.DefineNumeroMatricula(strNova, iAnoSemAntigo)
             end else
             begin
                ParamByName('NrAluno').AsInteger := 0;
             end;

             ExecSQL;

             { Alteração na Tabela de Mensalidades }

             SQL.Clear;
             SQL.Add('update Mensalidades set Turma = :NovaTurma, AnoSemestre = :NovoAnoSem, Curso = :NovoCurso, Depto = :NovoDepto, cd_coligada = :NovaColigada ');
             SQL.Add('where CodigoAluno = :CodigoAluno and Turma = :Turma and AnoSemestre = :AnoSemestre');

             ParamByName('CodigoAluno').AsString := codigoAluno;
             ParamByName('Turma').AsString := strTurmaAntiga;
             ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
             ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
             ParamByName('NovoDepto').AsInteger := qryNova.fieldByName('depto').AsInteger;
             ParamByName('NovaTurma').AsString := strNova;
             ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
             ParamByName('NovaColigada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;

             ExecSQL;

             {Verifica se o aluno possui alguma monografia cadastrada e altera o CD_TURMA da tabela de monografias caso possua algum registro}

             SQL.Clear;
             SQL.Add(' SELECT count(*) as qtd FROM monografias ');
             SQL.Add(' where cd_pessoa = :CodigoAluno ');

             ParamByName('CodigoAluno').AsString := codigoAluno;
             Open;

             DM.CriarConsulta(qyAlteraMonografia);

             if (FieldByName('qtd').AsInteger > 0) then
             begin
                qyAlteraMonografia.SQL.Text :=
                   'UPDATE monografias set cd_turma = :NovaTurma,    ' +
                   '   cd_curso = :NovoCurso,                        ' +
                   '   nr_anosemestre = :NovoAnoSem                  ' +
                   'WHERE cd_pessoa = :CodigoAluno                   ' +
                   '   AND cd_turma = :Turma                         ' +
                   '   AND nr_anosemestre = :AnoSem                  ';

                qyAlteraMonografia.ParamByName('CodigoAluno').AsString := codigoAluno;
                qyAlteraMonografia.ParamByName('Turma').AsString := strTurmaAntiga;
                qyAlteraMonografia.ParamByName('AnoSem').AsInteger := iAnoSemAntigo;
                qyAlteraMonografia.ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
                qyAlteraMonografia.ParamByName('NovaTurma').AsString := strNova;
                qyAlteraMonografia.ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;

                qyAlteraMonografia.ExecSQL;
             end;

             { Alteração na TurmaDisciplina da Tabela de Ficha }

             SQL.Clear;
             SQL.Add('update FichaIndividual set Turma = :NovaTurma, Curso = :NovoCurso,');
             // Bloquear as médias ja calculadas
             SQL.Add(' sn_bloqueado1 = CASE WHEN nota_d1 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado2 = CASE WHEN nota_d2 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado3 = CASE WHEN nota_d3 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado4 = CASE WHEN nota_d4 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado5 = CASE WHEN nota_d5 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado6 = CASE WHEN nota_d6 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado7 = CASE WHEN nota_d7 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado8 = CASE WHEN nota_d8 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado9 = CASE WHEN nota_d9 IS NULL THEN 0 ELSE 1 END,      ');
             SQL.Add(' sn_bloqueado10 = CASE WHEN nota_d10 IS NULL THEN 0 ELSE 1 END,    ');
             SQL.Add(' aproveitamento = CASE WHEN mediafinal IS NULL THEN ''N'' ELSE ''S'' END ');
             SQL.Add('where CodigoAluno = :CodigoAluno and TurmaMatricula = :Turma and AnoSemestre = :AnoSemestre');
             //Somente se for da mesma etapa troca a turma, do contrario so vai trocar turmamatricula
             SQL.Add(' AND Serie = :Serie AND Turma = :Turma2 AND curso = :NovoCurso2 ');

             ParamByName('Serie').AsInteger := qryNova.FieldByName('Serie').AsInteger;
             ParamByName('CodigoAluno').AsString := codigoAluno;
             ParamByName('Turma').AsString := strTurmaAntiga;
             ParamByName('Turma2').AsString := strTurmaAntiga;
             ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
             ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
             ParamByName('NovoCurso2').AsString := qryNova.fieldByName('curso').AsString;
             ParamByName('NovaTurma').AsString := strNova;
             ExecSQL;

             { Alteração na TurmaMatricula da Tabela de Ficha }
          
             SQL.Clear;
             SQL.Add('update FichaIndividual set TurmaMatricula = :NovaTurma, AnoSemestre = :NovoAnoSem');
             SQL.Add('where CodigoAluno = :CodigoAluno and TurmaMatricula = :Turma and AnoSemestre = :AnoSemestre');

             ParamByName('CodigoAluno').AsString := codigoAluno;
             ParamByName('Turma').AsString := strTurmaAntiga;
             ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
             ParamByName('NovaTurma').AsString := strNova;
             ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
             ExecSQL;

             { Arrumar os códigos da grade curricular }
          
             SQL.Clear;
             SQL.Add(' UPDATE fichaindividual f, gradecurricular g, turmas t ');
             SQL.Add(' SET f.codigograde = g.codigo ');
             SQL.Add(' WHERE f.turma = t.codigo and f.anosemestre = t.anosemestre AND ');
             SQL.Add(' f.anosemestre = g.anosemestre AND f.disciplina = g.disciplina AND f.curso = g.curso AND ');
             SQL.Add(' f.serie = g.serie AND g.turno = t.turno AND t.cd_grade = g.cd_grade ');
             SQL.Add(' AND f.anosemestre = :NovoAnoSem AND f.turma = :NovaTurma AND codigoaluno = :CodigoAluno ');

             ParamByName('CodigoAluno').AsString := codigoAluno;
             ParamByName('NovaTurma').AsString := strNova;
             ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
             ExecSQL;

             { Verificar Passagem de notas parciais }

             if Dm.variavel_parametro('TransferenciaLevarNotasParciais') = 'S' then begin
               SQL.Clear;
               SQL.Add(' update diario_matriculas INNER JOIN turmas ON (diario_matriculas.turma = turmas.codigo AND diario_matriculas.anosemestre = turmas.anosemestre)');
               SQL.Add(' set diario_matriculas.Turma = :NovaTurma, diario_matriculas.AnoSemestre = :NovoAnoSem ');
               SQL.Add(' where diario_matriculas.CodAluno = :CodigoAluno and diario_matriculas.Turma = :Turma and turmas.AnoSemestre = :AnoSemestre');
               SQL.Add(' AND turmas.serie = :Serie AND turmas.curso = :NovoCurso2 ');

               ParamByName('CodigoAluno').AsString := codigoAluno;
               ParamByName('Turma').AsString := strTurmaAntiga;
               ParamByName('Serie').AsInteger := qryNova.FieldByName('Serie').AsInteger;
               ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
               ParamByName('NovaTurma').AsString := strNova;
               ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
               ParamByName('NovoCurso2').AsString := qryNova.fieldByName('curso').AsString;

               ExecSQL;
             end;
         end;

         { Demais dados }

         { Tentar alterar a tabela de Vestibular }

         Dm.qAux1.Close;
         Dm.qAux1.SQL.Text := 'UPDATE vestibular SET curso = :cursonovo';
         Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND anosemestre = :anosemestre and curso = :cursoatual ');

         Dm.qAux1.ParamByName('codigoaluno').AsString := codigoAluno;
         Dm.qAux1.ParamByName('cursonovo').AsString := qryNova.fieldByName('curso').AsString;
         Dm.qAux1.ParamByName('cursoatual').AsString := qryAtual.fieldByName('curso').AsString;
         Dm.qAux1.ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
         Dm.qAux1.ExecSQL;

         { Registrar em observações }

         Observacao := 'TRANSFERIDO DA TURMA: ' + strTurmaAntiga  + '  PARA A TURMA: ' + strNova;

         TfObservacoes.RegisterObservation(strtoint(codigoAluno), okMatriculation, Observacao);

         DM.setLog(
            1018,
            'Alteracao',
            codigoAluno+';'+IntToStr(strNovoAnoSem)+';'+strNova+';'+strNova,
            DM.getColigadaByTurma(strNova,strNovoAnoSem),

            Format(LOG_TROCA_TURMA,
                     [strtoint(codigoAluno),
                      iAnoSemAntigo,
                      qryAtual.fieldByName('curso').AsString,
                      strTurmaAntiga,
                      strtoint(codigoAluno),
                      strNovoAnoSem,
                      qryNova.fieldByName('curso').AsString,
                      strNova]
            )
         );

         // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
         qyGruposAtividadesAluno.Close;
         qyGruposAtividadesAluno.ParamByName('nr_anosemestre').AsInteger := iAnoSemAntigo;
         qyGruposAtividadesAluno.ParamByName('cd_curso').AsString := qryAtual.fieldByName('curso').AsString;
         qyGruposAtividadesAluno.ParamByName('cd_turma').AsString := strTurmaAntiga;
         qyGruposAtividadesAluno.ParamByName('cd_pessoa').AsString := codigoAluno;
         qyGruposAtividadesAluno.Open;

         // Aluno vinculado a grupos de atividades (nessa matrícula)
         if not qyGruposAtividadesAluno.Eof then
         begin
            // Avisa o usuário que ele está trocando a turma de um aluno que possui vinculos em disciplinas com grupos de atividades
            Mensagem('Você trocou a turma de um aluno que possui disciplinas com grupos de atividades, o aluno foi inativado nesses grupos.', 'Informação', MB_OK + MB_ICONINFORMATION );

            // Varre os grupos de atividade que o aluno será desativado
            while not qyGruposAtividadesAluno.Eof do
            begin
               // Inativa o aluno no grupo de atividade que ele estiver relacionado
               qyInativarAluno.Close;
               qyInativarAluno.ParamByName('cd_pessoa').AsString := codigoAluno;
               qyInativarAluno.ParamByName('cd_grupo').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger;

               // Verifica se foi informada uma data de saída do aluno
               if not DM.tblMatriculasDataSaida.IsNull then
               begin
                  qyInativarAluno.ParamByName('dt_saida').AsString := dataMatricula;
               end else begin
                  qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;
               end;

               qyInativarAluno.ExecSQL;

               // Guardar log de inativação do aluno no grupo (tabela: log_geral)
               // Chave: CD_PESSOA;CD_GRUPO
               chaves := FillString(qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString, alRight, '0', 10, true ) + ';' + qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString;

               observacao := 'Troca de turma do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'", portanto o estudante foi inativado no grupo '+
                             qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                             'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', qyInativarAluno.ParamByName('dt_saida').AsDateTime);

               DM.setLog(
                  1018,
                  'Alteracao',
                  chaves,
                  dm.getColigadaByTurma(strTurmaAntiga, iAnoSemAntigo),
                  observacao
               );
         
               qyGruposAtividadesAluno.Next;
            end;
         end;
      end;

   Except on E:Exception do
      begin
         Screen.Cursor := crDefault;
         Mensagem( 'Não foi possível efetuar a troca de turmas.', Application.Title ,MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
      end;
   end;

   Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
   { *************************************** }
   Screen.Cursor := crDefault;
end;

procedure TformTransferenciaDeTurma.FormShow(Sender: TObject);
begin
   edDTurma.SetFocus;
end;

procedure TformTransferenciaDeTurma.percorreListaPessoas(checar: boolean);
var
   i : integer;
begin
   for i := 0 to lstAlunos.Items.Count - 1 do
   begin
      lstAlunos.Checked[i] := checar;
   end;
end;

procedure TformTransferenciaDeTurma.ToolButton5Click(Sender: TObject);
begin
   percorreListaPessoas(true);
end;

procedure TformTransferenciaDeTurma.ToolButton6Click(Sender: TObject);
begin
   percorreListaPessoas(false);
end;

procedure TformTransferenciaDeTurma.udDAnoSemClick(Sender: TObject;
  Button: TUDBtnType);
begin
   case Button of
      btNext:
      begin
         Self.meAnoSem.Text := DM.incrementar_ano_semestre(Self.meAnoSem.Text);
      end;
      btPrev:
         Self.meAnoSem.Text := DM.decrementar_ano_semestre(Self.meAnoSem.Text);
   end;
   edDCurso.Text := '';
   edDTurma.Text := '';
end;

function TformTransferenciaDeTurma.verificaSelecionados: boolean;
var
   i : integer;
begin
   for i := 0 to lstAlunos.Items.Count - 1 do
   begin
      if (lstAlunos.Checked[i] = true) then
      begin
         result := true;
         exit;
      end;
   end;
   result := false;
end;

end.
