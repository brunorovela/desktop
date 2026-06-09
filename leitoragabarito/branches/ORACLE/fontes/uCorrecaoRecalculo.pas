unit uCorrecaoRecalculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uPSComponent, uPSCompiler, uPSRuntime,
  Buttons, uUsuario;

type
  TfrmCorrecoesRecalculo = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    pnTitulo: TPanel;
    pnGrade: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyProvas: TUMZQuery;
    srcProvas: TDataSource;
    pmQtd: TPopupMenu;
    Panel4: TPanel;
    Bevel6: TBevel;
    qyProvascd_prova: TIntegerField;
    qyProvasds_prova: TStringField;
    pnAnoSemestre: TPanel;
    Bevel1: TBevel;
    ilDisciplinas: TImageList;
    qyTurmas: TUMZQuery;
    srcTurmas: TDataSource;
    qyTurmasnr_anosemestre: TSmallintField;
    qyTurmascd_turma: TStringField;
    qyTurmascd_prova: TIntegerField;
    pgDisciplinas: TPageControl;
    tsTurmas: TTabSheet;
    grdTurmas: TDBGrid;
    tsAlunos: TTabSheet;
    qyAlunos: TUMZQuery;
    qyAlunoscd_prova_aluno: TIntegerField;
    qyAlunoscd_pessoa: TIntegerField;
    qyAlunosnm_pessoa: TStringField;
    DBGrid1: TDBGrid;
    srcAlunos: TDataSource;
    tsRespostas: TTabSheet;
    qyRespostas: TUMZQuery;
    srcRespostas: TDataSource;
    qyRespostasnr_questao: TSmallintField;
    qyRespostasds_resposta_aluno: TStringField;
    qyRespostasds_resposta_gabarito: TStringField;
    qyRespostascd_prova_aluno: TIntegerField;
    qyRespostascd_prova_disciplina: TIntegerField;
    qyRespostascd_prova_aluno_resposta: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label3: TLabel;
    qyProvasnr_prova: TSmallintField;
    tbAtribuirNotas: TToolButton;
    ToolButton4: TToolButton;
    qyAlunosnr_acertos: TFloatField;
    qyRespostascd_situacao: TSmallintField;
    qyRespostasds_situacao: TStringField;
    tbRecalcular: TToolButton;
    qyAlunoscd_prova_gabarito: TIntegerField;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    Panel3: TPanel;
    srcAcertosEspecifico: TDataSource;
    DBGrid2: TDBGrid;
    qyAcertosEspecifico: TUMZQuery;
    qyAcertosEspecificonr_acertos: TFloatField;
    qyAcertosEspecificods_disciplina: TStringField;
    qyRespostassigla: TStringField;
    qyRespostasvl_peso: TFloatField;
    Label4: TLabel;
    DBText4: TDBText;
    qyAlunosds_nome_gabarito: TStringField;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Label7: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown3: TUpDown;
    cbAnoSemextre: TCheckBox;
    pcQuestoes: TPageControl;
    tsQuestoesNormais: TTabSheet;
    grdRespostas: TDBGrid;
    tsQuestoesDiscursivas: TTabSheet;
    Bevel2: TBevel;
    grdRespostasDiscursivas: TDBGrid;
    qyRespostasDiscursivas: TUMZQuery;
    srcRespostasDiscursivas: TDataSource;
    qyRespostasDiscursivascd_prova_aluno: TIntegerField;
    qyRespostasDiscursivascd_prova_disciplina: TIntegerField;
    qyRespostasDiscursivascd_prova_aluno_resposta: TIntegerField;
    qyRespostasDiscursivasnr_questao: TSmallintField;
    qyRespostasDiscursivassigla: TStringField;
    qyRespostasDiscursivasvl_peso: TFloatField;
    qyRespostasDiscursivasdb_pontuacao: TFloatField;
    psFormula: TPSScript;
    procedure grdRespostasDiscursivasDblClick(Sender: TObject);
    procedure qyProvasBeforeOpen(DataSet: TDataSet);
    procedure cbAnoSemextreClick(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton1Click(Sender: TObject);
    procedure psFormulaExecute(Sender: TPSScript);
    procedure psFormulaCompile(Sender: TPSScript);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure tbRecalcularClick(Sender: TObject);
    procedure tbAtribuirNotasClick(Sender: TObject);
    procedure grdRespostasDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure srcAlunosDataChange(Sender: TObject; Field: TField);
    procedure srcTurmasDataChange(Sender: TObject; Field: TField);
    procedure btnImprimirTurmaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure grdTurmasDblClick(Sender: TObject);
    procedure srcProvasDataChange(Sender: TObject; Field: TField);
    procedure qyDisciplinasNewRecord(DataSet: TDataSet);
    procedure qyProvasNewRecord(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnEcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure srcProvasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }

  public
    iAux : integer;
    iAux2 : integer;
    iAux4: integer;
    iAlternativas : integer;
    procedure AtualizaDiarioMatriculas( cd_turma : string ; cd_disciplina : integer );
    procedure AtualizaNotas( cd_turma : string ; cd_disciplina : integer; nr_prova : string; cd_prova : integer; nr_etapa : integer; cd_prova_gabarito : integer );
    procedure gravaLog(cd_pessoa :Integer; cd_acao : Integer; cd_atividade: integer; descricao: string; cd_professor: integer);


    procedure RecalculaGabaritos(cd_prova:integer);
    { Public declarations }
  end;

var
  frmCorrecoesRecalculo: TfrmCorrecoesRecalculo;

implementation

uses Main, uDM, uCadProvasDisciplinas, uCadProvasTurmas, uCadProvasGabaritos,
  uCadProvasAlunos, uSelProvas, uDigitarQuestoes, uAtribuicaoAvancada,
  uDigitarQuestoesDiscursivas, uFSelecionarTurma;

{$R *.dfm}

procedure TfrmCorrecoesRecalculo.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   Self.Caption := pnTitulo.Caption;

   txtAnoSemestre.Text := IntToStr(ano_semestre);

   qyProvas.Close;
   qyProvas.Open;

   pgDisciplinas.ActivePageIndex := 0;
   pcQuestoes.ActivePageIndex := 0;
end;

procedure TfrmCorrecoesRecalculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCorrecoesRecalculo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F8 : btnImprimirClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCorrecoesRecalculo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCorrecoesRecalculo.btnEcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     qyProvas.Delete;
  end;
end;

procedure TfrmCorrecoesRecalculo.btnFecharClick(Sender: TObject);
begin
   qyProvas.Close;
   qyProvas.Open;
   Close;
end;

procedure TfrmCorrecoesRecalculo.srcProvasStateChange(Sender: TObject);
var
   estado : boolean;
begin
   estado := (qyProvas.State in [dsInsert, dsEdit]);

   btnFechar.Enabled := not estado;
end;

procedure TfrmCorrecoesRecalculo.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyProvas, pmQtd);
end;

procedure TfrmCorrecoesRecalculo.grdTitleClick(Column: TColumn);
var
   sCampo : string;
   sOrdem : string;
begin
   sCampo := Column.FieldName;

   if Column.Title.Font.Style = [fsBold] then begin
      sOrdem := 'DESC';
      Column.Title.Font.Style := [fsItalic];
   end
   else if Column.Title.Font.Style = [fsItalic] then begin
      sOrdem := '';
      Column.Title.Font.Style := [];
   end
   else begin
      sOrdem := 'ASC';
      Column.Title.Font.Style := [fsBold];
   end;

   if sOrdem <> '' then begin
      with qyProvas do begin
         Close();
         SQL.Text := '                ' +
            'SELECT                   ' +
            '   *                     ' +
            'FROM                     ' +
            '   leitora_provas        ' +
            'ORDER BY                 ' +
            '   '+sCampo+' '+sOrdem+' ' +
         '';
         Open();
      end;
   end;

end;

procedure TfrmCorrecoesRecalculo.qyProvasNewRecord(DataSet: TDataSet);
begin
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('select max(cd_prova) ultimo from leitora_provas');
   DM.qyAux.Open;

   qyProvas.FieldByName('cd_prova').AsInteger := DM.qyAux.FieldByName('ultimo').AsInteger + 1;

   DM.qyAux.Close;
end;

procedure TfrmCorrecoesRecalculo.qyDisciplinasNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
end;

procedure TfrmCorrecoesRecalculo.srcProvasDataChange(Sender: TObject; Field: TField);
begin
   qyTurmas.Close();
   qyTurmas.Open();
end;

procedure TfrmCorrecoesRecalculo.grdTurmasDblClick(Sender: TObject);
begin
   pgDisciplinas.ActivePageIndex := 1;
end;

procedure TfrmCorrecoesRecalculo.btnImprimirClick(Sender: TObject);
begin

   with DM.qyAux do begin

      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '	COUNT(a.cd_prova_aluno) AS qtde ' +
         'FROM ' +
         '	leitora_provas_gabaritos g ' +
         '		INNER JOIN leitora_provas_alunos a ON (a.cd_prova_gabarito = g.cd_prova_gabarito) ' +
         'WHERE ' +
         '	g.cd_prova = :cd_prova ';
      ParamByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
      Open();

      if FieldByName('qtde').AsInteger = 0 then begin
         Mensagem( 'Não é possível imprimir, não há alunos cadastrados para esta prova !', Application.Title, MB_OK + MB_ICONERROR );
      end;

      if Mensagem( 'Imprimir os cartões da prova selecionada, contendo '+FieldByName('qtde').AsString+' aluno(s) ?', Application.Title,
        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         PrincipalForm.ImprimeRpt(DM.variavel_parametro('lg_relatorio_gabaritos'), -1, '{leitora_provas_gabaritos.cd_prova} = '+qyProvas.FieldByName('cd_prova').AsString, '', nil, nil, nil, True);
      end;

   end;

end;

procedure TfrmCorrecoesRecalculo.btnImprimirTurmaClick(Sender: TObject);
begin

   with DM.qyAux do begin

      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '	COUNT(a.cd_prova_aluno) AS qtde ' +
         'FROM ' +
         '	leitora_provas_gabaritos g ' +
         '		INNER JOIN leitora_provas_alunos a ON (a.cd_prova_gabarito = g.cd_prova_gabarito) ' +
         'WHERE ' +
         '	g.cd_prova = :cd_prova AND ' +
         '	a.cd_turma = :cd_turma AND ' +
         '	a.nr_anosemestre = :nr_anosemestre ';
      ParamByName('cd_prova').AsInteger := qyTurmas.FieldByName('cd_prova').AsInteger;
      ParamByName('cd_turma').AsString := qyTurmas.FieldByName('cd_turma').AsString;
      ParamByName('nr_anosemestre').AsInteger := qyTurmas.FieldByName('nr_anosemestre').AsInteger;
      Open();

      if FieldByName('qtde').AsInteger = 0 then begin
         Mensagem( 'Não é possível imprimir, não há alunos cadastrados para esta prova na turma '+qyTurmas.FieldByName('cd_turma').AsString+' !', Application.Title, MB_OK + MB_ICONERROR );
      end;

      if Mensagem( 'Imprimir os cartões da prova selecionada, contendo '+FieldByName('qtde').AsString+' aluno(s) da turma '+qyTurmas.FieldByName('cd_turma').AsString+' ?', Application.Title,
        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         PrincipalForm.ImprimeRpt(DM.variavel_parametro('lg_relatorio_gabaritos'), -1, '{leitora_provas_gabaritos.cd_prova} = '+qyTurmas.FieldByName('cd_prova').AsString+' AND {leitora_provas_alunos.cd_turma} = "'+qyTurmas.FieldByName('cd_turma').AsString+'" AND {leitora_provas_alunos.nr_anosemestre} = '+qyTurmas.FieldByName('nr_anosemestre').AsString, '', nil, nil, nil, True);
      end;

   end;

end;

procedure TfrmCorrecoesRecalculo.srcTurmasDataChange(Sender: TObject; Field: TField);
begin
   with qyAlunos do begin
      Close();
      ParamByName('cd_turma').AsString := qyTurmas.FieldByName('cd_turma').AsString;
      ParamByName('nr_anosemestre').AsInteger := qyTurmas.FieldByName('nr_anosemestre').AsInteger;
      Open();
   end;
end;

procedure TfrmCorrecoesRecalculo.srcAlunosDataChange(Sender: TObject; Field: TField);
begin
   with qyRespostas do begin
      Close();
      Open();
   end;

   with qyRespostasDiscursivas do begin
      Close();
      Open();
   end;

   with qyAcertosEspecifico do begin
      Close();
      Open();
   end;
end;

procedure TfrmCorrecoesRecalculo.DBGrid1DblClick(Sender: TObject);
begin
      with DM.qyAux do begin
         Close();
         SQL.Text := 'SELECT * FROM leitora_provas_gabaritos_resp WHERE cd_prova_gabarito = :cd_prova_gabarito';
         ParamByName('cd_prova_gabarito').AsInteger := qyAlunos.FieldByName('cd_prova_gabarito').AsInteger;
         Open();
         while not Eof do begin
            with DM.qyAux2 do begin
               Close();
               SQL.Text := 'SELECT * FROM leitora_provas_alunos_resp WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao';
               ParamByName('cd_prova_aluno').AsInteger := qyAlunos.FieldByName('cd_prova_aluno').AsInteger;
               ParamByName('nr_questao').AsInteger := DM.qyAux.FieldByName('nr_questao').AsInteger;
               Open();
               if Eof then begin
                  with DM.qyAux3 do begin
                     Close();
                     SQL.Text := ' ' +
                        'INSERT INTO leitora_provas_alunos_resp( ' +
                        '  cd_prova_aluno, ' +
                        '  nr_questao, ' +
                        '  ds_resposta, ' +
                        '  cd_situacao, ' +
                        '  nr_correcao ' +
                        ') VALUES( ' +
                        '  :cd_prova_aluno, ' +
                        '  :nr_questao, ' +
                        '  '''', ' +
                        '  -1, ' +
                        '  1 ' +
                        ')';
                     ParamByName('cd_prova_aluno').AsInteger := qyAlunos.FieldByName('cd_prova_aluno').AsInteger;
                     ParamByName('nr_questao').AsInteger := DM.qyAux.FieldByName('nr_questao').AsInteger;
                     ExecSQL();
                  end;
               end;
            end;
            Next();
         end;
      end;
   qyRespostas.Close();
   qyRespostas.Open();
   qyRespostasDiscursivas.Close();
   qyRespostasDiscursivas.Open();
   pgDisciplinas.ActivePageIndex := 2;
end;

procedure TfrmCorrecoesRecalculo.grdRespostasDiscursivasDblClick(Sender: TObject);
var
   sNovaPontuacao : string;
   sPontuacaoAntiga : string;
   ponto : Pointer;
begin
   if grdRespostasDiscursivas.SelectedIndex = 3 then begin

      if not DM.GetUsuarioLogado.TemPermissao( 7002, npAlterar, True ) then Exit;

      sPontuacaoAntiga := qyRespostasDiscursivas.FieldByName('db_pontuacao').AsString;
      sNovaPontuacao := '0';
      while (StrToCurr(sNovaPontuacao) > qyRespostasDiscursivas.FieldByName('vl_peso').AsCurrency) OR (sNovaPontuacao = '0') do begin
         sNovaPontuacao := UpperCase(InputBox(Application.Title, 'Nova pontuação do aluno:', sPontuacaoAntiga));

         if StrToCurr(sNovaPontuacao) > qyRespostasDiscursivas.FieldByName('vl_peso').AsCurrency then begin
            if Mensagem('A pontuação do aluno deve ser menor ou igual ao peso da questão !'+chr(13)+'Deseja digitar novamente ?', Application.Title, MB_YESNO+MB_ICONEXCLAMATION) <> mrYes then begin
               exit;
            end;
         end;
      end;


      if (sNovaPontuacao <> sPontuacaoAntiga) AND (sNovaPontuacao <> '') then begin

         with DM.qyAux do begin
            Close();
            SQL.Text := 'UPDATE leitora_provas_alunos_resp SET db_pontuacao = :db_pontuacao WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
            ParamByName('db_pontuacao').AsCurrency := StrToCurr(sNovaPontuacao);
            ParamByName('cd_prova_aluno_resposta').AsInteger := qyRespostasDiscursivas.FieldByName('cd_prova_aluno_resposta').AsInteger;
            ExecSQL;
         end;

      end;

      qyRespostasDiscursivas.Close();
      qyRespostasDiscursivas.Open();

      ponto := qyAlunos.GetBookmark();
      qyAlunos.Close();
      qyAlunos.Open();
      qyAlunos.GotoBookmark(ponto);

   end;
end;
procedure TfrmCorrecoesRecalculo.grdRespostasDblClick(Sender: TObject);
var
   sNovaResposta : string;
   sRespostaAntiga : string;
   sRespostaGabarito : string;
   ponto : Pointer;
begin
   if grdRespostas.SelectedIndex = 3 then begin

      if not DM.GetUsuarioLogado.TemPermissao( 7002, npAlterar, True ) then Exit;

      sRespostaAntiga := qyRespostas.FieldByName('ds_resposta_aluno').AsString;
      sRespostaGabarito := qyRespostas.FieldByName('ds_resposta_gabarito').AsString;
      sNovaResposta := UpperCase(InputBox(Application.Title, 'Nova resposta do aluno:', sRespostaAntiga));

      if (DM.VerificaeNumero(sNovaResposta)) AND (Length(sNovaResposta) = 1) then begin
        sNovaResposta := '0' + sNovaResposta;
      end;

      if (sNovaResposta <> sRespostaAntiga) AND (sNovaResposta <> '') then begin

         with DM.qyAux do begin
            Close();
            SQL.Text := 'UPDATE leitora_provas_alunos_resp SET ds_resposta = :ds_resposta WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
            ParamByName('ds_resposta').AsString := sNovaResposta;
            ParamByName('cd_prova_aluno_resposta').AsInteger := qyRespostas.FieldByName('cd_prova_aluno_resposta').AsInteger;
            ExecSQL;

         end;

      end;

      qyRespostas.Close();
      qyRespostas.Open();

      ponto := qyAlunos.GetBookmark();
      qyAlunos.Close();
      qyAlunos.Open();
      qyAlunos.GotoBookmark(ponto);

   end;
end;

procedure TfrmCorrecoesRecalculo.tbAtribuirNotasClick(Sender: TObject);
var
   iNumero1 : integer;
   iNumero2 : integer;
   anosem_turma, nr_prova : string;
begin

   if not DM.GetUsuarioLogado.TemPermissao( 7002, npEspecial, True ) then Exit;

   Application.CreateForm(TfrmSelProvas, frmSelProvas);

   with frmSelProvas do begin
      cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
      ShowModal();
      if flgSearch then begin

        with DM.qyAux do begin
            Close();
            SQL.Text := ' ' +
               'SELECT ' +
               '  d.codigo, ' +
               '  d.sigla ' +
               'FROM ' +
               '  leitora_provas_disciplinas pd ' +
               '     INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) ' +
               'WHERE ' +
               '  pd.cd_prova = :cd_prova ';
            ParamByName('cd_prova').AsInteger := cd_prova;
            Open();
            iNumero1 := 1;
            while not Eof do begin
               with DM.qyAux2 do begin

                  Close();
                  SQL.Text := ' ' +
                     'SELECT ' +
                     '   a.nr_anosemestre, ' +
                     '   a.cd_turma, ' +
                     '   g.cd_prova_gabarito ' +
                     'FROM ' +
                     '   leitora_provas_alunos a ' +
                     '      INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = a.cd_prova_gabarito) ' +
                     'WHERE ' +
                     '   g.cd_prova = :cd_prova ' +
                     'GROUP BY ' +
                     '   a.nr_anosemestre, ' +
                     '   a.cd_turma, ' +
                     '   g.cd_prova_gabarito ';
                  ParamByName('cd_prova').AsInteger := cd_prova;
                  Open();
                  iNumero2 := 1;
                  while not Eof do begin
                     if anosem_turma <> FieldByName('nr_anosemestre').AsString+FieldByName('cd_turma').AsString then begin
                       AtualizaDiarioMatriculas(FieldByName('cd_turma').AsString, DM.qyAux.FieldByName('codigo').AsInteger);
                       anosem_turma := FieldByName('nr_anosemestre').AsString+FieldByName('cd_turma').AsString;

                       nr_prova := Copy(frmSelProvas.sgSelecionadas.Cells[iNumero2,iNumero1], 1, Pos(' -',frmSelProvas.sgSelecionadas.Cells[iNumero2,iNumero1])-1);
                       iNumero2 := iNumero2 + 1;
                     end;
                     AtualizaNotas(FieldByName('cd_turma').AsString, DM.qyAux.FieldByName('codigo').AsInteger, nr_prova, cd_prova, nr_etapa, FieldByName('cd_prova_gabarito').AsInteger);

                     Next();
                  end;

               end;

               iNumero1 := iNumero1 + 1;
               Next();
            end;
         end;

         Mensagem( 'Notas atribuidas com sucesso !', Application.Title, MB_OK + MB_ICONINFORMATION );
      end;
   end;

end;

procedure TfrmCorrecoesRecalculo.AtualizaDiarioMatriculas( cd_turma : string ; cd_disciplina : integer );
begin

   with DM.qyAux4 do
   begin
      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '   tp.turma, ' +
         '   tp.anosemestre, ' +
         '   tp.disciplina, ' +
         '   dpt.CD_TIPO_PRAZO AS nr_etapa, ' +
         '   tp.professor, ' +
         '   tp.curso ' +
         'FROM ' +
         '   turmasprofessores tp ' +

         '      INNER JOIN dia_prazos_turmas dpt ON ( ' +
         '         (dpt.NR_ANOSEMESTRE = tp.anosemestre) AND ( ' +
         '            (dpt.CD_CURSO = tp.curso AND dpt.CD_TURMA = tp.turma) OR ' +
         '            (dpt.CD_CURSO = tp.curso AND dpt.CD_TURMA = '+QuotedStr('')+') OR ' +
         '            (dpt.CD_CURSO = '+QuotedStr('')+' AND dpt.CD_TURMA = '+QuotedStr('')+') ' +
         '         ) ' +
         '      ) ' +
         '      INNER JOIN dia_prazos dp ON ( ' +
         '         dp.CD_PRAZO = dpt.CD_PRAZO ' +
         '      ) ' +
         '      LEFT JOIN diario_turmas dt ON ( ' +
         '         dt.anosemestre = tp.anosemestre AND ' +
         '         dt.turma = tp.turma AND ' +
         '         dt.disciplina = tp.disciplina AND ' +
         '         dt.professor = tp.professor ' +
         '      ) ' +
         'WHERE ' +
         '   tp.turma = :cd_turma AND ' +
         '   tp.disciplina = :cd_disciplina AND ' +
         '   dp.DT_INICIO_NOTAS <= CURDATE() AND ' +
         '   dp.DT_FIM_NOTAS >= CURDATE() ' +
         'GROUP BY ' +
         '   tp.turma, ' +
         '   tp.anosemestre, ' +
         '   tp.disciplina, ' +
         '   dpt.CD_TIPO_PRAZO ' +
         'ORDER BY ' +
         '   tp.turma ASC, ' +
         '   dpt.cd_turma ASC, ' +
         '   dpt.cd_curso ASC ';
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      Open();

      while not Eof do
      begin
         with DM.qyAux5 do
         begin
            Close();
            SQL.Text := ' ' +
               'SELECT ' +
               '   * ' +
               'FROM ' +
               '   diario_turmas ' +
               'WHERE ' +
               '   anosemestre = :nr_anosemestre AND ' +
               '   turma = :cd_turma AND ' +
               '   bimestre = :nr_etapa AND ' +
               '   disciplina = :cd_disciplina ';
            ParamByName('cd_turma').AsString := cd_turma;
            ParamByName('nr_anosemestre').AsInteger := DM.qyAux4.FieldByName('anosemestre').AsInteger;
            ParamByName('cd_disciplina').AsInteger := cd_disciplina;
            ParamByName('nr_etapa').AsInteger := DM.qyAux4.FieldByName('nr_etapa').AsInteger;
            Open();

            if RecordCount = 0 then
            begin
               Close();
               SQL.Text := ' ' +
                  'INSERT INTO ' +
                  '   diario_turmas( ' +
                  '      turma, ' +
                  '      anosemestre, ' +
                  '      disciplina, ' +
                  '      bimestre, ' +
                  '      professor, ' +
                  '      curso ' +
                  '   ) VALUES ( ' +
                  '      :cd_turma, ' +
                  '      :nr_anosemestre, ' +
                  '      :cd_disciplina, ' +
                  '      :nr_etapa, ' +
                  '      :cd_professor, ' +
                  '      :cd_curso ' +
                  '   ) ';
                  ParamByName('cd_turma').AsString := cd_turma;
                  ParamByName('nr_anosemestre').AsInteger := DM.qyAux4.FieldByName('anosemestre').AsInteger;
                  ParamByName('cd_disciplina').AsInteger := cd_disciplina;
                  ParamByName('nr_etapa').AsInteger := DM.qyAux4.FieldByName('nr_etapa').AsInteger;
                  ParamByName('cd_professor').AsInteger := DM.qyAux4.FieldByName('professor').AsInteger;
                  ParamByName('cd_curso').AsString := DM.qyAux4.FieldByName('curso').AsString;
               ExecSQL();
            end;
         end;

         Next();
      end;
      {iAnoSemestre := FieldByName('anosemestre').AsInteger;
      iEtapa := FieldByName('nr_etapa').AsInteger;
      iProfessor := FieldByName('professor').AsInteger;
      sCurso := FieldByName('curso').AsString;

         with DM.qyAux5 do
         begin
            Close();
            SQL.Text := ' ' +
               'SELECT ' +
               '   fi.codigoaluno, ' +
               '   fi.situacao, ' +
               '   m.datasaida ' +
               'FROM ' +
               '   fichaindividual fi ' +
               '      INNER JOIN matriculas m ON ( ' +
               '         m.codigoaluno = fi.codigoaluno AND ' +
               '         m.anosemestre = fi.anosemestre AND ' +
               '         m.turma = fi.turmamatricula ' +
               '      ) ' +
               'WHERE ' +
               '   fi.anosemestre = :nr_anosemestre AND ' +
               '   fi.turma = :cd_turma AND ' +
               '   fi.disciplina = :cd_disciplina ';
            ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
            ParamByName('cd_turma').AsString := cd_turma;
            ParamByName('cd_disciplina').AsInteger := cd_disciplina;
            Open();

            while not Eof do
            begin

               with DM.qyAux4 do
               begin
                  SQL.Text := ' ' +
                     'SELECT ' +
                     '   fi.codigoaluno AS codaluno ' +
                     'FROM ' +
                     '   fichaindividual fi ' +
                     '   INNER JOIN diario_turmas dt ON ( ' +
                     '      dt.anosemestre = fi.anosemestre AND ' +
                     '      dt.curso = fi.curso AND ' +
                     '      dt.turma = fi.turma AND ' +
                     '      dt.disciplina = fi.disciplina AND ' +
                     '   ) ' +
                     'WHERE ' +
                     '   fi.anosemestre = :nr_anosemestre AND ' +
                     '   fi.turma = :cd_turma AND ' +
                     '   fi.disciplina = :cd_disciplina AND ' +
                     '   fi.codigoaluno = :cd_pessoa AND ' +
                     '   dt.bimestre = :nr_etapa ';
                  ParamByName('cd_pessoa').AsInteger := DM.qyAux5.FieldByName('codigoaluno').AsInteger;
                  ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
                  ParamByName('cd_turma').AsString := cd_turma;
                  ParamByName('cd_disciplina').AsInteger := cd_disciplina;
                  ParamByName('nr_etapa').AsInteger := iEtapa;
                  Open();
               end;

               with DM.qyAux3 do
               begin
                  Close();
                  if DM.qyAux4.Eof then
                  begin
                     SQL.Text := ' ' +
                        'INSERT INTOa ' +
                        '   fichaindividual( ' +
                        '      codigoaluno, ' +
                        '      turma, ' +
                        '      anosemestre, ' +
                        '      disciplina, ' +
                        '      bimestre, ' +
                        '      situacao, ' +
                        '      data_saida ' +
                        '   ) VALUES ( ' +
                        '      :cd_pessoa, ' +
                        '      :cd_turma, ' +
                        '      :nr_anosemestre, ' +
                        '      :cd_disciplina, ' +
                        '      :nr_etapa, ' +
                        '      :nr_situacao, ' +
                        '      :dt_saida ' +
                        '   ) ';
                  end
                  else
                  begin
                     SQL.Text := ' ' +
                        'UPDATEa ' +
                        '   diario_matriculas ' +
                        'SET ' +
                        '   situacao = :nr_situacao, ' +
                        '   data_saida = :dt_saida ' +
                        'WHERE ' +
                        '   codaluno = :cd_pessoa AND ' +
                        '   anosemestre = :nr_anosemestre AND ' +
                        '   turma = :cd_turma AND ' +
                        '   disciplina = :cd_disciplina AND ' +
                        '   bimestre = :nr_etapa ';
                  end;
                  ParamByName('cd_pessoa').AsInteger := DM.qyAux5.FieldByName('codigoaluno').AsInteger;
                  ParamByName('cd_turma').AsString := cd_turma;
                  ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
                  ParamByName('cd_disciplina').AsInteger := cd_disciplina;
                  ParamByName('nr_etapa').AsInteger := iEtapa;
                  ParamByName('nr_situacao').AsInteger := DM.qyAux5.FieldByName('situacao').AsInteger;
                  ParamByName('dt_saida').AsString := FormatDateTime('yyyy-mm-dd', DM.qyAux5.FieldByName('datasaida').AsDateTime);
                  ExecSQL();
               end;

               Next();
            end;

         end;}
      end;

end;

procedure TfrmCorrecoesRecalculo.AtualizaNotas( cd_turma : string ; cd_disciplina : integer; nr_prova : string; cd_prova : integer; nr_etapa : integer; cd_prova_gabarito : integer );
var
   iQtdQuestoes : currency;
   sAux, log : String;
   qyBuscaNota: TUMZQuery;
   i, iDisciplina, iDisciplinaFrente: Integer;
   nr_anosemestre: Integer;
   iCdTipoAvaliacao: Integer;
   rSomaTotalNotas, rSomaNotas: TNota;
   arrDisciplinasFazemFrente: TStringList;
   notaMaxima, notaMinima: Double;
begin
   with DM.qyAux4 do
   begin
      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '   COUNT(*) AS nr_questoes ' +
         'FROM ' +
         '   leitora_provas_gabaritos_resp pgr ' +
         '      INNER JOIN leitora_provas_disciplinas pd ON (pd.cd_prova_disciplina = pgr.cd_prova_disciplina) ' +
         'WHERE ' +
         '   pd.cd_prova = :cd_prova AND ' +
         '   pd.cd_disciplina = :cd_disciplina AND ' +
         '   not isNull(pgr.nr_alternativas) AND ' +
         '   pgr.cd_prova_gabarito = :cd_prova_gabarito ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
      Open();
      iQtdQuestoes := FieldByName('nr_questoes').AsCurrency;
      if iQtdQuestoes > 10 then
      begin
         SQL.Text := ' ' +
            'SELECT ' +
            '   SUM(pgr.vl_peso) AS nr_questoes ' +
            'FROM ' +
            '   leitora_provas_gabaritos_resp pgr ' +
            '      INNER JOIN leitora_provas_disciplinas pd ON (pd.cd_prova_disciplina = pgr.cd_prova_disciplina) ' +
            'WHERE ' +
            '   pd.cd_prova = :cd_prova AND ' +
            '   pd.cd_disciplina = :cd_disciplina AND ' +
            '   not isNull(pgr.nr_alternativas) AND ' +
            '   pgr.cd_prova_gabarito = :cd_prova_gabarito ';
         ParamByName('cd_prova').AsInteger := cd_prova;
         ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
         Open();
         iQtdQuestoes := FieldByName('nr_questoes').AsCurrency;
      end;

      if nr_prova <> 'EF' then
      begin

         if (nr_prova = 'RB') then
         begin
            DM.CriarConsulta(qyBuscaNota);
            with qyBuscaNota do
            begin
               SQL.Add( ' SELECT nro_nota ' );
               SQL.Add( ' FROM diario_provas ' );
               SQL.Add( ' WHERE cd_prova_leitora = :cd_prova_leitora AND ' );
               SQL.Add( '       turma = :cd_turma AND ' );
               SQL.Add( '       bimestre = :nr_etapa AND ' );
               SQL.Add( '       cd_disciplina = :cd_disciplina AND ' );
               SQL.Add( '       ( sn_especial = 1 OR nro_nota = -1 ) ' );

               ParamByName( 'cd_prova_leitora' ).AsInteger := cd_prova;
               ParamByName( 'cd_turma' ).AsString := cd_turma;
               ParamByName( 'nr_etapa' ).AsInteger := nr_etapa;
               ParamByName( 'cd_disciplina' ).AsInteger := cd_disciplina;

               Open();

               nr_prova := FieldByName('nro_nota').AsString;

               Close();
            end;

            sAux := 'RB';
         end
         else
         begin
            sAux := 'Nota' + nr_prova;
         end;

// Verificar LOGS de ALTERAÇão

         DM.CriarConsulta(qyBuscaNota);
         with qyBuscaNota do
         begin
            SQL.Add( ' SELECT pa.cd_pessoa, pa.cd_turma, pa.nr_anosemestre, ' );
            SQL.Add( '        pd.cd_disciplina, dt.bimestre, dp.cd_grupo, (pad.nr_acertos) AS valor_acerto ' );
            SQL.Add( ' FROM leitora_provas_alunos pa ' );
            SQL.Add( '      INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_gabarito = pa.cd_prova_gabarito) ' );
            SQL.Add( '      INNER JOIN leitora_provas_disciplinas pd ON (pd.cd_prova = pg.cd_prova) ' );
            SQL.Add( '      INNER JOIN leitora_provas_alunos_dis pad ON (pad.cd_prova_aluno = pa.cd_prova_aluno AND pad.cd_prova_disciplina = pd.cd_prova_disciplina) ' );
            SQL.Add( '      INNER JOIN diario_turmas dt ON (dt.anosemestre = pa.nr_anosemestre AND dt.turma = pa.cd_turma AND dt.turma = pa.cd_turma AND dt.curso = pd.cd_curso) ' );
            SQL.Add( '      LEFT JOIN diario_provas dp ON (dp.cd_prova_leitora = pg.cd_prova) ');
            SQL.Add( '      LEFT JOIN logs lo ON ( CONCAT(pa.cd_pessoa, '+QuotedStr(';')+', pa.cd_turma, '+QuotedStr(';')+', pa.nr_anosemestre, '+QuotedStr(';')+', pd.cd_disciplina, '+QuotedStr(';')+', dt.bimestre, '+QuotedStr(';')+') = lo.cd_chave AND lo.ds_log LIKE '+QuotedStr(sAux)+' ) ' );
            SQL.Add( ' WHERE pg.cd_prova = :cd_prova AND ' );
            SQL.Add( '       pa.cd_turma = :cd_turma AND ' );
            SQL.Add( '       pd.cd_disciplina = :cd_disciplina AND ' );
            SQL.Add( '       dt.bimestre = :nr_etapa AND ' );
            SQL.Add( '       not IsNull(pad.nr_acertos) AND ' );
            SQL.Add( '       lo.cd_log is null ' );

            ParamByName('cd_prova').AsInteger := cd_prova;
            ParamByName('cd_turma').AsString := cd_turma;
            ParamByName('cd_disciplina').AsInteger := cd_disciplina;
            ParamByName('nr_etapa').AsInteger := nr_etapa;

            Open();
            First();
         end;

         // Se conseguiu encontrar alguma nota a ser atribuída
         if not qyBuscaNota.Eof then
         begin
            nr_anosemestre := qyBuscaNota.FieldByName('nr_anosemestre').AsInteger;
         end;

         // Retorna a disciplina frente
         iDisciplinaFrente := DM.getDisciplinaFrente(cd_disciplina, nr_anosemestre, cd_turma);

         // Se é uma disciplina frente
         if (iDisciplinaFrente > 0) then
         begin
            // Inserir alunos na diario_provas_alunos da disciplina frente
            DM.inserirAlunosDisciplina(nr_anosemestre, cd_turma, iDisciplinaFrente, nr_etapa);

            // Busca o codigo do tipo de avaliação utilizada nessa prova que está alterando a nota
            iCdTipoAvaliacao := DM.getTipoAvaliacao(nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, StrToInt(nr_prova));

            // Busca as disciplinas que fazem frente
            arrDisciplinasFazemFrente := DM.getDisciplinasFazemFrente(nr_anosemestre, cd_turma, iDisciplinaFrente);
         end;

         while not qyBuscaNota.Eof do
         begin
            Close();
            SQL.Clear;
            SQL.Add( ' REPLACE INTO diario_provas_alunos ( cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_prova, vl_nota ) ' );
            SQL.Add( ' VALUES ( :cd_pessoa, :cd_turma, :nr_anosem, :cd_disciplina, :cd_bimestre, :nr_prova, :vl_nota ) ' );

            ParamByName('cd_pessoa').AsInteger := qyBuscaNota.FieldByName('cd_pessoa').AsInteger;
            ParamByName('cd_turma').AsString := qyBuscaNota.FieldByName('cd_turma').AsString;
            ParamByName('nr_anosem').AsInteger := qyBuscaNota.FieldByName('nr_anosemestre').AsInteger;
            ParamByName('cd_disciplina').AsInteger := qyBuscaNota.FieldByName('cd_disciplina').AsInteger;
            ParamByName('cd_bimestre').AsInteger := qyBuscaNota.FieldByName('bimestre').AsInteger;
            ParamByName('nr_prova').AsInteger := StrToInt(nr_prova);
            ParamByName('vl_nota').Value := qyBuscaNota.FieldByName('valor_acerto').Value;
            ExecSQL();

            // gravar o log

            //Monta a mensagem do log de inserção de cada nota
            log := CHR(13) + '[Importação de gabaritos da leitora de gabaritos] ';
            log := log + 'Aluno: '+ IntToStr(qyBuscaNota.FieldByName('cd_pessoa').AsInteger) + CHR(13);
            log := log + 'Prova: '+ nr_prova + CHR(13);
            log := log + 'Nota: '+ FloatToStr(qyBuscaNota.FieldByName('valor').AsFloat) + CHR(13);
            log := log + 'Ano/semestre: '+ IntToStr(qyBuscaNota.FieldByName('nr_anosemestre').AsInteger) + CHR(13);
            log := log + 'Turma: '+ qyBuscaNota.FieldByName('cd_turma').AsString + CHR(13);
            log := log + 'Disciplina: '+ IntToStr(qyBuscaNota.FieldByName('cd_disciplina').AsInteger) + CHR(13);
            log := log + 'Etapa: ' + IntToStr(nr_etapa) + CHR(13);
            log := log + '';

            {
            Função responsavel por inserir um log na tabela diario_logs com os parametros
               cd_pessoa :Integer;
               cd_acao : Integer;
               cd_atividade: integer;
               descricao: string;
               cd_professor: integer
            }
            gravaLog(0, 3, 2, log, 0 );

            // Se é uma disciplina frente
            if iDisciplinaFrente > 0 then
            begin
               // Varre as disciplinas que fazem frente buscando as notas de mesmo tipo de prova que está sendo editado
               rSomaTotalNotas.vl_nota := 0;
               rSomaTotalNotas.IsNull := True;
               for i := 0 to arrDisciplinasFazemFrente.Count - 1 do
               begin
                  iDisciplina := StrToInt(arrDisciplinasFazemFrente.Strings[i]);

                  rSomaNotas := DM.getSomaNotasProvasMesmoTipo(
                                    nr_anosemestre,
                                    cd_turma,
                                    iDisciplina,
                                    nr_etapa,
                                    iCdTipoAvaliacao,
                                    qyBuscaNota.FieldByName('cd_pessoa').AsInteger
                                 );

                  if not rSomaNotas.IsNull then
                  begin
                     rSomaTotalNotas.vl_nota := rSomaTotalNotas.vl_nota + rSomaNotas.vl_nota;
                     rSomaTotalNotas.IsNull := False;
                  end;
               end;

               // Verifica se a nota da disciplina pai está nos limites de mínima e máxima
               notaMaxima := StrToFloat(DM.variavel_parametro('diario_online_digita_max'));
               notaMinima := StrToFloat(DM.variavel_parametro('diario_online_digita_min'));

               if rSomaTotalNotas.vl_nota > notaMaxima then
                  rSomaTotalNotas.vl_nota := notaMaxima;

               if rSomaTotalNotas.vl_nota < notaMinima then
                  rSomaTotalNotas.vl_nota := notaMinima;

               // Atribui a soma das notas das provas de mesmo tipo das disciplinas que fazem frente para a prova da disciplina frente
               DM.atribuiNotaProvaDisciplinaFrente(
                  nr_anosemestre,
                  cd_turma,
                  iDisciplinaFrente,
                  nr_etapa,
                  iCdTipoAvaliacao,
                  qyBuscaNota.FieldByName('cd_pessoa').AsInteger,
                  rSomaTotalNotas
               );
            end;


            DM.CalcularMediaAutomaticamente(
               qyBuscaNota.FieldByName('nr_anosemestre').AsInteger,
               qyBuscaNota.FieldByName('cd_turma').AsString,
               qyBuscaNota.FieldByName('cd_disciplina').AsInteger,
               qyBuscaNota.FieldByName('bimestre').AsInteger,
               qyBuscaNota.FieldByName('cd_grupo').AsInteger,
               qyBuscaNota.FieldByName('cd_pessoa').AsInteger
            );

            qyBuscaNota.Next;
         end;               
      end
      else
      begin
         nr_prova := 'exame';

         Close();
         SQL.Text := ' ' +
            'UPDATE ' +
            '   leitora_provas_alunos pa ' +
            '      INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_gabarito = pa.cd_prova_gabarito) ' +
            '            INNER JOIN leitora_provas_disciplinas pd ON (pd.cd_prova = pg.cd_prova) ' +
            '               INNER JOIN leitora_provas_alunos_dis pad ON (pad.cd_prova_aluno = pa.cd_prova_aluno AND pad.cd_prova_disciplina = pd.cd_prova_disciplina) ' +
            '      LEFT JOIN fichaindividual fi ON (fi.codigoaluno = pa.cd_pessoa AND fi.anosemestre = pa.nr_anosemestre AND fi.turma = pa.cd_turma AND fi.disciplina = pd.cd_disciplina) ' +
            'SET ' +
            '   fi.nota'+nr_prova+' = ((pad.nr_acertos/'+StringReplace(FloatToStr(iQtdQuestoes), ',', '.', [rfReplaceAll, rfIgnoreCase])+')*10) ' +
            'WHERE ' +
            '   pg.cd_prova = :cd_prova AND ' +
            '   pg.cd_prova_gabarito = :cd_prova_gabarito AND ' +
            '   fi.turma = :cd_turma AND ' +
            '   fi.disciplina = :cd_disciplina AND ' +
            '   fi.situacao IN (2) AND ' +
            '   not IsNull(pad.nr_acertos) ';
         ParamByName('cd_prova').AsInteger := cd_prova;
         ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
         ParamByName('cd_turma').AsString := cd_turma;
         ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         ExecSQL();
      end;
   end;

end;

procedure TfrmCorrecoesRecalculo.gravaLog(cd_pessoa :Integer; cd_acao : Integer; cd_atividade: integer; descricao: string; cd_professor: integer);
const
   SQL_INSERIR_LOG_DIARIO =
   'INSERT INTO diario_logs (cd_pessoa, cd_acao, cd_atividade,dt_log, descricao, cd_log_pai, cd_professor)'
   +'VALUES (:cd_pessoa, :cd_acao, :cd_atividade, :dt_log, :descricao, NULL, :cd_professor)';
var
   qyInseriLog: TUMZQuery;
   msgLog: String;
begin
   DM.CriarConsulta(qyInseriLog);
   qyInseriLog.SQL.Text := SQL_INSERIR_LOG_DIARIO;
   qyInseriLog.ParamByName('cd_pessoa').AsInteger := cd_pessoa;//codigo de pessoa
   qyInseriLog.ParamByName('cd_acao').AsInteger := cd_acao;//codigo da acao
   qyInseriLog.ParamByName('cd_atividade').AsInteger := cd_atividade;//codigo atividade
   qyInseriLog.ParamByName('dt_log').AsDateTime := DM.DataAtual(); //data do log
   qyInseriLog.ParamByName('descricao').AsString := descricao;// descricao mensagem
   qyInseriLog.ParamByName('cd_professor').AsInteger := cd_professor;//codigo de professor
   qyInseriLog.ExecSQL();
end;

procedure TfrmCorrecoesRecalculo.tbRecalcularClick(Sender: TObject);
Var
  reg : Pointer;
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7002, npAlterar, True ) then Exit;

   RecalculaGabaritos(qyProvas.FieldByName('cd_prova').AsInteger);

   reg := qyProvas.GetBookmark;

   pgDisciplinas.ActivePageIndex := 0;
   reg := qyProvas.GetBookmark;
   qyProvas.Close();
   qyProvas.Open();
   qyProvas.GotoBookmark(reg);
   
   if Mensagem( 'Gabaritos re-calculados com sucesso !'+chr(13)+'Deseja atribuir as notas ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
      tbAtribuirNotasClick(nil);
   end;
   
end;

procedure TfrmCorrecoesRecalculo.RecalculaGabaritos(cd_prova:integer);
var
   iCdProvaAluno : integer;
   iCdDisciplina : integer;
   iAcertos : double;
   iAcertosTotal : double;
   iAux3 : integer;
   sAux : string;
   sAux2 : string;
   iQuestao : integer;
   rPeso : real;
   bSomatoria : boolean;
begin

   DM.ConfiguraParametros();
   
   with DM.qyAux do begin

   // Colocar db_pontuacao das questões discursivas
      Close();
      SQL.Text := '' +
        ' UPDATE leitora_provas_alunos a ' +
        ' INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = a.cd_prova_gabarito) '+
        ' INNER JOIN leitora_provas_gabaritos_resp gr ON (gr.cd_prova_gabarito = g.cd_prova_gabarito)' +
        ' INNER JOIN leitora_provas_alunos_resp ar ON (ar.cd_prova_aluno = a.cd_prova_aluno AND ar.nr_questao = gr.nr_questao)' +
        ' SET ar.db_pontuacao = Concat(MID(LPAD(IFNULL(ar.ds_resposta, "0"), 3, "0" ), 1, 2), ".", MID(LPAD(IFNULL(ar.ds_resposta, "0"),3, "0" ), 3,1) ) ' +
        ' WHERE    (ar.nr_correcao = 1 OR isNull(nr_correcao)) AND g.cd_prova = :cd_prova AND sn_discursiva = 1 ';

      ParamByName('cd_prova').AsInteger := cd_prova;
      ExecSQL();

      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '   a.cd_pessoa, ' +
         '   a.cd_prova_aluno, ' +
         '   ar.cd_prova_aluno_resposta, ' +
         '   gr.nr_questao, ' +
         '   gr.nr_alternativas, ' +
         '   gr.cd_prova_disciplina, ' +
         '   gr.vl_peso, ' +
         '   gr.ds_resposta AS ds_resposta_gabarito, ' +
         '   gr.sn_discursiva, ' +
         '   ar.ds_resposta AS ds_resposta_aluno, ' +
         '   ar.db_pontuacao, ' +
         '   gr.cd_situacao, ' +
         '   gr.sn_parcial ' +
         'FROM ' +
         '   leitora_provas_alunos a ' +
         '      INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = a.cd_prova_gabarito) ' +
         '         INNER JOIN leitora_provas_gabaritos_resp gr ON (gr.cd_prova_gabarito = g.cd_prova_gabarito) ' +
         '      INNER JOIN leitora_provas_alunos_resp ar ON (ar.cd_prova_aluno = a.cd_prova_aluno AND ar.nr_questao = gr.nr_questao) ' +
         'WHERE ' +
         '   (ar.nr_correcao = 1 OR isNull(nr_correcao)) AND ' +
         '   g.cd_prova = :cd_prova ' +
         'ORDER BY ' +
         '   a.cd_prova_aluno, ' +
         '   gr.cd_prova_disciplina, ' +
         '   gr.nr_questao ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();

      while not Eof do begin
         iCdProvaAluno := FieldByName('cd_prova_aluno').AsInteger;
         iAcertosTotal := 0;

         while (iCdProvaAluno = FieldByName('cd_prova_aluno').AsInteger) AND (not Eof) do begin
            iCdProvaAluno := FieldByName('cd_prova_aluno').AsInteger;
            iCdDisciplina := FieldByName('cd_prova_disciplina').AsInteger;
            iAcertos := 0;

            while (iCdDisciplina = FieldByName('cd_prova_disciplina').AsInteger) AND (iCdProvaAluno = FieldByName('cd_prova_aluno').AsInteger) AND (not Eof) do begin

               iCdDisciplina := FieldByName('cd_prova_disciplina').AsInteger;
               bSomatoria := DM.VerificaeNumero(FieldByName('ds_resposta_gabarito').AsString);
               iAlternativas := FieldByName('nr_alternativas').AsInteger;
               rPeso := FieldByName('vl_peso').AsFloat;
               iAux := 0;

               // Se a questão estiver anulada, já coloca como certa para o aluno
               if FieldByName('cd_situacao').AsInteger = 3 then begin
                  iAcertos := iAcertos + FieldByName('vl_peso').AsFloat;
                  iAcertosTotal := iAcertosTotal + FieldByName('vl_peso').AsFloat;

                  with DM.qyAux2 do begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 3 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;
               end
               // Se a questão for descritiva, já contabiliza a pontuação
               else if FieldByName('sn_discursiva').AsInteger = 1 then begin
                  iAcertos := iAcertos + FieldByName('db_pontuacao').AsFloat * (FieldByName('vl_peso').AsFloat / 10);
                  iAcertosTotal := iAcertosTotal + FieldByName('db_pontuacao').AsFloat * (FieldByName('vl_peso').AsFloat / 10);

                  with DM.qyAux2 do begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 3 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;
               end
               // Se o aluno não respondeu nada, coloca como ERRADA para o aluno
               else if FieldByName('ds_resposta_aluno').AsString = '' then begin
                  with DM.qyAux2 do begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;
               end
               // Se a resposta do aluno é exatamente igual a resposta correta da questão
               else if FieldByName('ds_resposta_aluno').AsString = FieldByName('ds_resposta_gabarito').AsString then begin
                  iAcertos := iAcertos + FieldByName('vl_peso').AsFloat;
                  iAcertosTotal := iAcertosTotal + FieldByName('vl_peso').AsFloat;

                  with DM.qyAux2 do begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 0 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;
               end
               //se o numero de alternativas for zero sigfinica que o resultado eh um número, então so compara se esta certo ou não
               else if (FieldByName('nr_alternativas').AsInteger = 0) then begin
                  if (FieldByName('ds_resposta_aluno').AsString = FieldByName('ds_resposta_gabarito').AsString) then begin
                     iAcertos := iAcertos + FieldByName('vl_peso').AsFloat;
                     iAcertosTotal := iAcertosTotal + FieldByName('vl_peso').AsFloat;

                     with DM.qyAux2 do begin
                        Close();
                        SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 0 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                        ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                        ExecSQL();
                     end;
                  end;
               end
               // Se a questão é somatória, e permite parcial
               else if (DM.qyAux.FieldByName('sn_parcial').AsInteger = 1) AND bSomatoria AND DM.VerificaeNumero(trim(FieldByName('ds_resposta_aluno').AsString)) AND (Length(trim(FieldByName('ds_resposta_aluno').AsString)) = Length(trim(FieldByName('ds_resposta_gabarito').AsString))) then begin

                  if (StrToInt(trim(FieldByName('ds_resposta_aluno').AsString)) <= FieldByName('ds_resposta_gabarito').AsInteger) OR (DM.sSomatoriasParciaisTipo = 'UFSC_20061') OR (DM.sSomatoriasParciaisTipo = 'FORMULA') then begin

                    sAux := DM.DecompoeNumero(FieldByName('ds_resposta_gabarito').AsInteger);
                    sAux2 := DM.DecompoeNumero(FieldByName('ds_resposta_aluno').AsInteger);
                    iAux4 := 0;
                    while Pos(';',sAux2) > 0 do begin
                       if Pos(Copy(sAux2, 1, pos(';',sAux2)-1), sAux) = 0 then begin
                          iAux := -1;
                          iAux4 := iAux4 + 1;
                       end;
                       sAux2 := Copy(sAux2, pos(';',sAux2)+1);
                    end;

                    if (iAux = -1) AND (DM.sSomatoriasParciaisTipo <> 'UFSC_20061') AND (DM.sSomatoriasParciaisTipo <> 'FORMULA') then begin
                       with DM.qyAux2 do begin
                          Close();
                          SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                          ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                          ExecSQL();
                       end;

                    end
                    else begin
                       iAux := 0;
                       iAux2 := 0;
                       sAux := DM.DecompoeNumero(FieldByName('ds_resposta_gabarito').AsInteger);
                       while Pos(';',sAux) > 0 do begin
                          sAux2 := DM.DecompoeNumero(FieldByName('ds_resposta_aluno').AsInteger);
                          while Pos(';',sAux2) > 0 do begin
                             if Copy(sAux, 1, pos(';',sAux)-1) = Copy(sAux2, 1, pos(';',sAux2)-1) then begin
                                iAux := iAux + 1;
                             end;
                             sAux2 := Copy(sAux2, pos(';',sAux2)+1);
                          end;
                          sAux := Copy(sAux, pos(';',sAux)+1);
                          iAux2 := iAux2 + 1;
                       end;

                       if DM.sSomatoriasParciaisTipo = 'UFSC' then begin
                          // Se o número de proposições corretar for menor ou igual a 2
                          if iAux2 <= 2 then begin
                             // Clau
                             iAcertos := iAcertos + RoundFloat((rPeso-((iAux2-iAux)*RoundFloat((rPeso/iAlternativas), 4))),4);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso-((iAux2-iAux)*RoundFloat((rPeso/iAlternativas), 4))),4);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();
                             end;
                          end
                          // Se o número de proposições corretas for maior que 2
                          // e o cara assinalou 1 ou 0 -> Resposta totalmente inválida
                          else if (iAux2 > 2) AND (iAux <= 1) then begin
                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();
                             end;
                          end
                          // Acima de 2 proposições corretas e o cara assinalou pelo menos 2
                          else begin
                             iAcertos := iAcertos + RoundFloat((rPeso-((iAux2-iAux)*(rPeso/iAlternativas))),4);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso-((iAux2-iAux)*(rPeso/iAlternativas))),4);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();
                             end;
                          end;
                       end
                       else if DM.sSomatoriasParciaisTipo = 'UFSC_20061' then begin

                       // INÍCIO - UFSC 20061

                          // FÓRMULA DA UFSC A PARTIR DE 2006/1:
                          //
                          // Se NPC > NPI
                          //
                          // Então P = NP - (NTPC - (NPC-NPI))
                          //   	      -----------------------
                          //		                 NP
                          //
                          // Senão P = 0,00

                          // NTPC - iAux2;
                          // NPC  - iAux;
                          // NPI  - iAux4;
                          // NP   - iAlternativas;

                          // Se o número de proposições corretas assinaladas
                          // for <= ao número de proposições incorretas assinaladas
                          if (iAux <= iAux4) then begin
                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();
                             end;
                          end
                          // Se Não, aplicando a nova fórmula da UFSC
                          else begin
                             iAcertos := iAcertos + RoundFloat((rPeso*((iAlternativas -(iAux2-(iAux-iAux4)))/iAlternativas)),4);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso*((iAlternativas -(iAux2-(iAux-iAux4)))/iAlternativas)),4);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();
                             end;
                          end;

                       // FIM - UFSC 20061

                       end
                       else if DM.sSomatoriasParciaisTipo = 'FORMULA' then begin

                       // INÍCIO - FORMULA

                          // NTPC - iAux2;
                          // NPC  - iAux;
                          // NPI  - iAux4;
                          // NP   - iAlternativas;


                          psFormula.Script.Text := 'begin if ('+DM.sSomatoriasCondicaoZero+') then Output := 1 else Output := 0; end.';
                          psFormula.Compile;
                          psFormula.Execute;
                          
                          // Se Não, aplicando a nova fórmula da UFSC
                          if (VGetReal(psFormula.GetVariable('Output')) = 1) then begin
                             //psFormula.Stop;
                             psFormula.Script.Text := 'begin Output := ('+DM.sSomatoriasFormula+'); end.';;
                             psFormula.Compile;
                             psFormula.Execute;

                             iAcertos := iAcertos + RoundFloat((rPeso*VGetReal(psFormula.GetVariable('Output'))),4);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso*VGetReal(psFormula.GetVariable('Output'))),4);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();
                             end;
                          end
                          // Se o número de proposições corretas assinaladas
                          // for <= ao número de proposições incorretas assinaladas
                          else begin
                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := Abs(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger);
                                ExecSQL();
                             end;
                          end;

                       // FIM - UFSC 20061

                       end
                       else begin
                          iAcertos := iAcertos + RoundFloat(((iAux/iAux2)*FieldByName('vl_peso').AsFloat),4);
                          iAcertosTotal := iAcertosTotal + RoundFloat(((iAux/iAux2)*FieldByName('vl_peso').AsFloat),4);

                          with DM.qyAux2 do begin
                             Close();
                             SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                             ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                             ExecSQL();
                          end;
                       end;

                    end;

                  end
                  else begin
                     with DM.qyAux2 do begin
                        Close();
                        SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                        ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                        ExecSQL();
                     end;
                  end;

               end
               // Se não, só lamento, tá errado !
               else begin
                  with DM.qyAux2 do begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;
               end;

               Next();
            end;

            // Computando os acertos do aluno [iCdProvaAluno] na disciplina [iCdDisciplina]
            with DM.qyAux2 do begin
               if (iAcertos <= 0) then begin
                  iAcertos := 0;
               end;
               Close();
               if pos(',',FloatToStr(iAcertos)) > 0 then begin
                  SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = '+Copy(FloatToStr(iAcertos),1,pos(',',FloatToStr(iAcertos))-1)+'.'+Copy(FloatToStr(iAcertos),pos(',',FloatToStr(iAcertos))+1)+' WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
               end
               else begin
                  SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = '+FloatToStr(iAcertos)+' WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
               end;
               ParamByName('cd_prova_aluno').AsInteger := iCdProvaAluno;
               ParamByName('cd_prova_disciplina').AsInteger := iCdDisciplina;
               ExecSQL();
            end;

         end;


         // Computando os acertos do aluno [iCdProvaAluno]
         with DM.qyAux2 do begin
            if (iAcertosTotal <= 0) then begin
               iAcertosTotal := 0;
            end;
            Close();
            if pos(',',FloatToStr(iAcertosTotal)) > 0 then begin
               SQL.Text := 'UPDATE leitora_provas_alunos SET nr_acertos = '+Copy(FloatToStr(iAcertosTotal),1,pos(',',FloatToStr(iAcertosTotal))-1)+'.'+Copy(FloatToStr(iAcertosTotal),pos(',',FloatToStr(iAcertosTotal))+1)+' WHERE cd_prova_aluno = :cd_prova_aluno';
            end
            else begin
               SQL.Text := 'UPDATE leitora_provas_alunos SET nr_acertos = '+FloatToStr(iAcertosTotal)+' WHERE cd_prova_aluno = :cd_prova_aluno';
            end;
            ParamByName('cd_prova_aluno').AsInteger := iCdProvaAluno;
            ExecSQL();
         end;

      end;

   end;


end;

procedure TfrmCorrecoesRecalculo.ToolButton5Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7002, npAlterar, True ) then Exit;

   if pcQuestoes.ActivePage = tsQuestoesNormais then begin
      frmDigitarQuestoes.cd_prova_aluno := qyAlunos.FieldByName('cd_prova_aluno').AsInteger;
      frmDigitarQuestoes.ds_nome_aluno := qyAlunos.FieldByName('nm_pessoa').AsString;

      qyRespostas.First();
      frmDigitarQuestoes.sQuestoes := '';
      frmDigitarQuestoes.sPesos := '';
      while not qyRespostas.Eof do begin
         if Length(frmDigitarQuestoes.sQuestoes) > 0 then begin
            frmDigitarQuestoes.sQuestoes := frmDigitarQuestoes.sQuestoes + ',';
            frmDigitarQuestoes.sPesos := frmDigitarQuestoes.sQuestoes + ',';
         end;
         frmDigitarQuestoes.sQuestoes := frmDigitarQuestoes.sQuestoes + qyRespostas.FieldByName('nr_questao').AsString;
         frmDigitarQuestoes.sPesos := frmDigitarQuestoes.sQuestoes + qyRespostas.FieldByName('vl_peso').AsString;

         qyRespostas.Next();
      end;
      qyRespostas.First();

      frmDigitarQuestoes.ShowModal();
      qyRespostas.Close();
      qyRespostas.Open();
   end
   else begin
      frmDigitarQuestoesDiscursivas.cd_prova_aluno := qyAlunos.FieldByName('cd_prova_aluno').AsInteger;
      frmDigitarQuestoesDiscursivas.ds_nome_aluno := qyAlunos.FieldByName('nm_pessoa').AsString;

      qyRespostasDiscursivas.First();
      frmDigitarQuestoesDiscursivas.sQuestoes := '';
      frmDigitarQuestoesDiscursivas.sPesos := '';
      while not qyRespostasDiscursivas.Eof do begin
         if Length(frmDigitarQuestoesDiscursivas.sQuestoes) > 0 then begin
            frmDigitarQuestoesDiscursivas.sQuestoes := frmDigitarQuestoesDiscursivas.sQuestoes + ',';
            frmDigitarQuestoesDiscursivas.sPesos := frmDigitarQuestoesDiscursivas.sPesos + ',';
         end;
         frmDigitarQuestoesDiscursivas.sQuestoes := frmDigitarQuestoesDiscursivas.sQuestoes + qyRespostasDiscursivas.FieldByName('nr_questao').AsString;
         frmDigitarQuestoesDiscursivas.sPesos := frmDigitarQuestoesDiscursivas.sPesos + qyRespostasDiscursivas.FieldByName('vl_peso').AsString;

         qyRespostasDiscursivas.Next();
      end;
      qyRespostasDiscursivas.First();

      frmDigitarQuestoesDiscursivas.ShowModal();
      qyRespostasDiscursivas.Close();
      qyRespostasDiscursivas.Open();
   end;
end;

procedure TfrmCorrecoesRecalculo.ToolButton6Click(Sender: TObject);
var
   i        : integer;
   cd_valor : string[2];
   ligacoes : string;
begin

   if not DM.GetUsuarioLogado.TemPermissao( 7005, npEspecial, True ) then Exit;

   Application.CreateForm(TfrmAtribuicaoAvancada, frmAtribuicaoAvancada);

   with frmAtribuicaoAvancada do begin
      cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
      ShowModal();

      if (flgSearch) then begin

         if (frmAtribuicaoAvancada.cbTabelas.ItemIndex = 0) then begin
            Exit;
         end;

         ligacoes := '';
         for i := 0 to Length(frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].ligacoes)-1 do begin
            ligacoes := ligacoes + frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].ligacoes[i].leitora+' = atu.'+frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].ligacoes[i].origem+' AND ';
         end;
         ligacoes := Copy(ligacoes, 1, Length(ligacoes)-5);

         with sgSelecionadas do begin
            for i := 0 to RowCount do begin
               if (Cells[1, i] <> '') then begin

                  cd_valor := Copy(Cells[1,i], 1, Pos(' -',Cells[1,i])-1);

                  if (cd_valor = 'AT') then begin

                     with DM.qyAux do begin
                        Close();
                        SQL.Clear();

                        SQL.Add('UPDATE ');
                        SQL.Add(' leitora_provas_gabaritos lpg ');
                        SQL.Add('  INNER JOIN leitora_provas_alunos lpa ON (lpa.cd_prova_gabarito = lpg.cd_prova_gabarito) ');

                        if (Pos('lpd', ligacoes) > 0) then begin
                           SQL.Add('  INNER JOIN leitora_provas_alunos_dis lpad ON (lpad.cd_prova_aluno = lpa.cd_prova_aluno ) ');
                           SQL.Add('     INNER JOIN leitora_provas_disciplinas lpd ON (lpd.cd_prova_disciplina = lpad.cd_prova_disciplina) ');
                        end;

                        SQL.Add('  INNER JOIN '+frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].chave+' atu ON ('+ligacoes+') ');
                        SQL.Add('SET ');

                        if (Pos('lpd', ligacoes) > 0) then begin
                           SQL.Add(' atu.'+frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].campos[i].chave+' = lpad.nr_acertos ');
                        end
                        else begin
                           SQL.Add(' atu.'+frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].campos[i].chave+' = lpa.nr_acertos ');
                        end;

                        SQL.Add('WHERE ');
                        SQL.Add(' lpg.cd_prova = :cd_prova ');

                        ParamByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;

                        ExecSQL();
                     end;


                  end
                  else begin

                     with DM.qyAux do begin
                        Close();
                        SQL.Clear();

                        SQL.Add('UPDATE ');
                        SQL.Add(' leitora_provas_gabaritos lpg ');

                        if (Pos('lpd', ligacoes) > 0) then begin
                           SQL.Add('  INNER JOIN leitora_provas_disciplinas lpd ON (lpd.cd_prova = lpg.cd_prova) ');
                        end;

                        SQL.Add('  INNER JOIN leitora_provas_alunos lpa ON (lpa.cd_prova_gabarito = lpg.cd_prova_gabarito) ');
                        SQL.Add('     INNER JOIN leitora_provas_alunos_resp lpar ON (lpar.cd_prova_aluno = lpa.cd_prova_aluno AND lpar.nr_correcao = 1 AND lpar.nr_questao = :nr_questao) ');
                        SQL.Add('  INNER JOIN '+frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].chave+' atu ON ('+ligacoes+') ');
                        SQL.Add('SET ');
                        SQL.Add(' atu.'+frmAtribuicaoAvancada.recTabelas[frmAtribuicaoAvancada.cbTabelas.ItemIndex-1].campos[i].chave+' = lpar.ds_resposta ');
                        SQL.Add('WHERE ');
                        SQL.Add(' lpg.cd_prova = :cd_prova ');

                        ParamByName('nr_questao').AsInteger := StrToInt(cd_valor);
                        ParamByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;

                        ExecSQL();
                     end;

                  end;
               end;
            end;
         end;
      end;
   end;

end;

procedure TfrmCorrecoesRecalculo.psFormulaCompile(Sender: TPSScript);
begin
   Sender.AddRegisteredVariable('Output', 'extended');  // Retorno
   Sender.AddRegisteredVariable('NTPC', 'integer');     // N. total de proposições corretas da questão
   Sender.AddRegisteredVariable('NPC', 'integer');      // N. de proposições corretas assinaladas
   Sender.AddRegisteredVariable('NPI', 'integer');      // N. de proposições INcorretas assinaladas
   Sender.AddRegisteredVariable('NP', 'integer');       // N. de proposições da questão
end;

procedure TfrmCorrecoesRecalculo.psFormulaExecute(Sender: TPSScript);
begin
  VSetInt(Sender.GetVariable('NTPC'), iAux2);
  VSetInt(Sender.GetVariable('NPC'), iAux);
  VSetInt(Sender.GetVariable('NPI'), iAux4);
  VSetInt(Sender.GetVariable('NP'), iAlternativas);
end;

procedure TfrmCorrecoesRecalculo.SpeedButton1Click(Sender: TObject);
begin
   if (qyAcertosEspecifico.RecordCount = 0) then begin
      if (DM.GeraLeitoraDisciplinas(qyProvas.FieldByName('cd_prova').AsInteger, qyAlunos.FieldByName('cd_prova_aluno').AsInteger)) then begin
         qyAcertosEspecifico.Close();
         qyAcertosEspecifico.Open();
      end;
   end;
end;

procedure TfrmCorrecoesRecalculo.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
  qyProvas.Close();
  qyProvas.Open();

end;

procedure TfrmCorrecoesRecalculo.cbAnoSemextreClick(Sender: TObject);
begin
  qyProvas.Close();
  qyProvas.Open();

  txtAnoSemestre.Enabled := cbAnoSemextre.Checked;
  UpDown3.Enabled := cbAnoSemextre.Checked;

end;

procedure TfrmCorrecoesRecalculo.qyProvasBeforeOpen(DataSet: TDataSet);
begin
  if cbAnoSemextre.Checked then begin
    with qyProvas do begin
      SQL.Text := 'SELECT * FROM leitora_provas WHERE nr_anosemestre = :nr_anosemestre ORDER BY cd_prova';
      ParamByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
    end;
  end
  else begin
    with qyProvas do begin
      SQL.Text := 'SELECT * FROM leitora_provas ORDER BY cd_prova';
    end;
  end;

end;

end.
