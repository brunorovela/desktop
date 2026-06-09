unit uCorrecoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uPSComponent, uPSCompiler, uPSRuntime,
  Buttons, uUsuario, uTProva, Tabs, ZDbcIntfs, uLkJSON;

type
  TfrmCorrecoes = class(TForm)
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
    qyProvassn_permitir_maior: TSmallintField;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    tsPartes: TTabSet;
    qyRespostasnr_parte: TIntegerField;
    qyRespostasDiscursivasnr_parte: TIntegerField;
    pmInfoProva: TPopupMenu;
    hjgjhj1: TMenuItem;
    otaldealunoscomnotas1: TMenuItem;
    otaldealunoscomnotas2: TMenuItem;
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure tsPartesChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure pgDisciplinasChange(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
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
    procedure gravaLog(cd_pessoa :Integer; cd_acao : Integer; cd_atividade: integer; descricao: string; cd_professor: integer);
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
    procedure contNotasPopup();
  private
      provaAtual : TProva;
      usaEfeitosVisuais : Boolean;

    procedure definirPontuacaoQuestao(cd_prova_aluno_resposta: integer;
      db_pontuacao: double);
    { Private declarations }
    procedure AtualizaDiarioMatriculas( cd_turma : string ; cd_disciplina : integer );
    procedure AtualizaNotas( cd_turma : string ; cd_disciplina : integer; nr_prova : string; prova : TProva; nr_etapa : integer; cd_prova_gabarito : integer );
    procedure insereDisciplinas(cdProva, cdProvaAluno: Integer);

  public
    iAux : integer;
    iAux2 : integer;
    iAux4: integer;
    iAlternativas : integer;
    n, contComNotas, contSemNotas: integer ;


    procedure RecalculaGabaritos(cd_prova:integer);
    { Public declarations }
  end;

var
  frmCorrecoes: TfrmCorrecoes;

implementation

uses Main, uDM, uCadProvasDisciplinas, uCadProvasTurmas, uCadProvasGabaritos,
  uCadProvasAlunos, uSelProvas, uDigitarQuestoes, uAtribuicaoAvancada,
  uDigitarQuestoesDiscursivas, uImportarLayouts, ufuncoesGerais, uFSplash,
  uFSelecionarTurma;

{$R *.dfm}

procedure TfrmCorrecoes.insereDisciplinas(cdProva, cdProvaAluno: Integer);
const
   SQL_INSERE_DISCIPLINA =
      ' INSERT INTO leitora_provas_alunos_dis (cd_prova_aluno, cd_prova_disciplina) '+
      ' SELECT '+
      '    %d, '+
      '    lpd.cd_prova_disciplina '+
      ' FROM '+
      '    leitora_provas_disciplinas lpd '+
      ' WHERE '+
      '    lpd.cd_prova = :cd_prova '+
      '    AND lpd.cd_prova_disciplina NOT IN ( SELECT lpad.cd_prova_disciplina FROM leitora_provas_alunos_dis AS lpad WHERE lpad.cd_prova_aluno = %d)';
var
   qyInsereDisc: TUMZQuery;
begin
   DM.CriarConsulta(qyInsereDisc);

   qyInsereDisc.SQL.Text := Format(SQL_INSERE_DISCIPLINA, [cdProvaAluno, cdProvaAluno]);
   qyInsereDisc.ParamByName('cd_prova').AsInteger := cdProva;
   qyInsereDisc.ExecSQL;
end;

procedure TfrmCorrecoes.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));
   usaEfeitosVisuais := DM.db.SQLHourGlass;
   DM.db.SQLHourGlass := False;

   Self.Caption := pnTitulo.Caption;

   txtAnoSemestre.Text := IntToStr(ano_semestre);

   qyProvas.Close;
   qyProvas.Open;

   pgDisciplinas.ActivePageIndex := 0;
   pcQuestoes.ActivePageIndex := 0;
end;

procedure TfrmCorrecoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   DM.db.SQLHourGlass := usaEfeitosVisuais;
end;

procedure TfrmCorrecoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F8 : btnImprimirClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCorrecoes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCorrecoes.btnEcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     qyProvas.Delete;
  end;
end;

procedure TfrmCorrecoes.btnFecharClick(Sender: TObject);
begin
   qyProvas.Close;
   qyProvas.Open;
   Close;
end;

procedure TfrmCorrecoes.srcProvasStateChange(Sender: TObject);
var
   estado : boolean;
begin
   estado := (qyProvas.State in [dsInsert, dsEdit]);

   btnFechar.Enabled := not estado;
end;

procedure TfrmCorrecoes.pgDisciplinasChange(Sender: TObject);
begin
   if pgDisciplinas.ActivePage = tsAlunos then begin
      qyAlunos.Close();
      qyAlunos.Open();
      contNotasPopup();
    end;
end;

procedure TfrmCorrecoes.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyProvas, pmQtd);
end;

procedure TfrmCorrecoes.grdTitleClick(Column: TColumn);
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

procedure TfrmCorrecoes.qyProvasNewRecord(DataSet: TDataSet);
begin
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('select max(cd_prova) ultimo from leitora_provas');
   DM.qyAux.Open;

   qyProvas.FieldByName('cd_prova').AsInteger := DM.qyAux.FieldByName('ultimo').AsInteger + 1;

   DM.qyAux.Close;
end;

procedure TfrmCorrecoes.qyDisciplinasNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
end;

procedure TfrmCorrecoes.srcProvasDataChange(Sender: TObject; Field: TField);
var
   I : Integer;
begin
   tsPartes.Tabs.Clear();

   if qyProvas.RecordCount > 0 then
   begin
      provaAtual := TProva.Create(qyProvascd_prova.AsInteger);

      if provaAtual.QuantidadePartesGabarito > 1 then
      begin
         tsPartes.Tabs.Add('Todas as Partes');
      end;

      for I := 1 to provaAtual.QuantidadePartesGabarito do
      begin
         tsPartes.Tabs.Add('Parte ' + IntToStr(I));
      end;

      tsPartes.TabIndex := 0;
   end;

   qyTurmas.Close();
   qyTurmas.Open();
end;

procedure TfrmCorrecoes.grdTurmasDblClick(Sender: TObject);
begin
   pgDisciplinas.ActivePageIndex := 1;
end;

procedure TfrmCorrecoes.btnImprimirClick(Sender: TObject);
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

procedure TfrmCorrecoes.btnImprimirTurmaClick(Sender: TObject);
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

procedure TfrmCorrecoes.srcTurmasDataChange(Sender: TObject; Field: TField);
begin
   with qyAlunos do begin
      Close();
      ParamByName('cd_turma').AsString := qyTurmas.FieldByName('cd_turma').AsString;
      ParamByName('nr_anosemestre').AsInteger := qyTurmas.FieldByName('nr_anosemestre').AsInteger;
      Open();
   end;
   // Atualiza os totais na popup da aba Alunos
   contNotasPopup();
end;

procedure TfrmCorrecoes.srcAlunosDataChange(Sender: TObject; Field: TField);
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

procedure TfrmCorrecoes.DBGrid1ColEnter(Sender: TObject);
begin
   n:= DBGrid1.SelectedIndex;
end;

procedure TfrmCorrecoes.DBGrid1DblClick(Sender: TObject);
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

procedure TfrmCorrecoes.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   Pt: TPoint;
begin
   // Se clicou com o Direito
   if Button = mbright then
   Begin
      // Pega a posição que o clique foi efetuado
      GetCursorPos(Pt);
      pmInfoProva.Items[0].Caption := 'Total de registros: ' + IntToStr(qyAlunos.RecordCount);
      pmInfoProva.Items[1].Caption := 'Total de Alunos com Notas: ' + IntToStr(contComNotas);
      pmInfoProva.Items[2].Caption := 'Total de Alunos sem Notas: ' + IntToStr(contSemNotas);
      
      // Passa as coordenadas para o componente popup
      pmInfoProva.Popup(
         Pt.x,
         Pt.y
      );
   end;
end;

procedure TfrmCorrecoes.grdRespostasDiscursivasDblClick(Sender: TObject);
var
   sNovaPontuacao : string;
   sPontuacaoAntiga : string;
   ponto : Pointer;
   icdPessoa : Integer;
begin
   if grdRespostasDiscursivas.SelectedIndex = 3 then begin

      if not DM.GetUsuarioLogado.TemPermissao( 7002, npAlterar, True ) then Exit;

      sPontuacaoAntiga := qyRespostasDiscursivas.FieldByName('db_pontuacao').AsString;
      sNovaPontuacao := '-1';
      while (StrToCurr(sNovaPontuacao) > qyRespostasDiscursivas.FieldByName('vl_peso').AsCurrency) OR (sNovaPontuacao = '-1') do begin
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
      icdPessoa := qyAlunoscd_pessoa.AsInteger;
      qyAlunos.Close();
      qyAlunos.Open();
      qyAlunos.Locate('cd_pessoa',icdPessoa, []);
   end;
end;
procedure TfrmCorrecoes.grdRespostasDblClick(Sender: TObject);
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

procedure TfrmCorrecoes.tbAtribuirNotasClick(Sender: TObject);
const
   SQL_LISTA_PROVAS_DISCIPLINAS =
      ' SELECT d.codigo, d.sigla, d.descricao ' +
      ' FROM leitora_provas_disciplinas pd ' +
      '      INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) ' +
      ' WHERE pd.cd_prova = :cd_prova ';
   SQL_LISTA_PROVAS_ALUNOS_GABARITOS =
      ' SELECT a.nr_anosemestre, a.cd_turma, g.cd_prova_gabarito ' +
      ' FROM leitora_provas_alunos a ' +
      '      INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = a.cd_prova_gabarito) ' +
      ' WHERE g.cd_prova = :cd_prova ' +
      ' GROUP BY a.nr_anosemestre, a.cd_turma, g.cd_prova_gabarito ';
var
   iNumero1, iNumero2 : integer;
{   anosem_turma, nr_prova : string;}
   anosem_turma, cd_turma, nr_anosemestre, nr_prova, ds_disciplina : String;
   cd_disciplina, cd_prova_gabarito : Integer;
var
   qyListaProvasAlunos, qyListaProvasAlunosGabaritos : TUMZReadOnlyQuery;
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7002, npEspecial, True ) then Exit;

   Application.CreateForm(TfrmSelProvas, frmSelProvas);

   frmSelProvas.cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
   frmSelProvas.ShowModal();

   if NOT(frmSelProvas.flgSearch) then Exit;

   DM.CriarConsulta(qyListaProvasAlunos);
   DM.CriarConsulta(qyListaProvasAlunosGabaritos);

   qyListaProvasAlunos.SQL.Text := SQL_LISTA_PROVAS_DISCIPLINAS;
   qyListaProvasAlunosGabaritos.SQL.Text := SQL_LISTA_PROVAS_ALUNOS_GABARITOS;

   qyListaProvasAlunos.ParamByName('cd_prova').AsInteger := frmSelProvas.cd_prova;

   qyListaProvasAlunos.Open();
   iNumero1 := 1;

   while not qyListaProvasAlunos.Eof do
   begin
      cd_disciplina := qyListaProvasAlunos.FieldByName('codigo').AsInteger;
      ds_disciplina := qyListaProvasAlunos.FieldByName('descricao').AsString;

      qyListaProvasAlunosGabaritos.Close();
      qyListaProvasAlunosGabaritos.ParamByName('cd_prova').AsInteger := frmSelProvas.cd_prova;
      qyListaProvasAlunosGabaritos.Open();
      iNumero2 := 1;

      anosem_turma := '';
      while not qyListaProvasAlunosGabaritos.Eof do
      begin
         cd_turma := qyListaProvasAlunosGabaritos.FieldByName('cd_turma').AsString;
         nr_anosemestre := qyListaProvasAlunosGabaritos.FieldByName('nr_anosemestre').AsString;
         cd_prova_gabarito := qyListaProvasAlunosGabaritos.FieldByName('cd_prova_gabarito').AsInteger;

         TfSplash.GetInstancia().ShowSplashScreen('Atribuindo notas', 'Atribuindo notas para '+cd_turma+' / '+ds_disciplina+', aguarde...');

         if anosem_turma <> nr_anosemestre + cd_turma then
         begin
           AtualizaDiarioMatriculas(cd_turma, cd_disciplina);
           anosem_turma := nr_anosemestre + cd_turma;

           nr_prova := Copy(frmSelProvas.sgSelecionadas.Cells[iNumero2,iNumero1], 1, Pos(' -',frmSelProvas.sgSelecionadas.Cells[iNumero2,iNumero1])-1);
           Inc(iNumero2);

         end;

         if nr_prova <> '' then
         begin
            AtualizaNotas(cd_turma, cd_disciplina, nr_prova, provaAtual, frmSelProvas.nr_etapa, cd_prova_gabarito);
         end;


         qyListaProvasAlunosGabaritos.Next();
      end;

      Inc(iNumero1);
      qyListaProvasAlunos.Next();
   end;

   TfSplash.GetInstancia().CloseSplashScreen();

   Mensagem( 'Notas atribuidas com sucesso !', Application.Title, MB_OK + MB_ICONINFORMATION );
end;

procedure TfrmCorrecoes.AtualizaDiarioMatriculas( cd_turma : string ; cd_disciplina : integer );
var
   iAnoSemestre : integer;
   iEtapa : integer;
   iProfessor : integer;
   sCurso : string;
begin

   with DM.qyAux4 do begin
      Close();
      SQL.Text := ' ' +
         ' SELECT ' +
         '    tp.turma, ' +
         '    tp.anosemestre, ' +
         '    tp.disciplina, ' +
         '    dp.cd_tipo_prazo AS nr_etapa, ' +
         '    tp.professor, ' +
         '    tp.curso ' +
         ' FROM ' +
         '    turmasprofessores tp ' +
         '    INNER JOIN dia_prazos_turmas dpt ON ( ' +
         '       dpt.NR_ANOSEMESTRE = tp.anosemestre AND ' +
         '       dpt.CD_CURSO = tp.curso AND ' +
         '       dpt.CD_TURMA = tp.turma AND ' +
         '       dpt.CD_DISCIPLINA = tp.disciplina ' +
         '    ) ' +
         '    INNER JOIN dia_prazos dp ON ( dp.CD_PRAZO = dpt.CD_PRAZO ) ' +
         '    LEFT JOIN diario_turmas dt ON ( ' +
         '       dt.anosemestre = tp.anosemestre AND ' +
         '       dt.turma = tp.turma AND ' +
         '       dt.disciplina = tp.disciplina AND ' +
         '       dt.professor = tp.professor ' +
         '    ) ' +
         ' WHERE ' +
         '    tp.turma = :cd_turma AND ' +
         '    tp.disciplina = :cd_disciplina AND ' +
         '    dp.dt_inicio_etapa <= CURDATE() AND ' +
         '    dp.dt_fim_etapa >= CURDATE() ' +
         ' GROUP BY ' +
         '    tp.turma, ' +
         '    tp.anosemestre, ' +
         '    tp.disciplina, ' +
         '    dp.cd_tipo_prazo ' +
         ' ORDER BY ' +
         '    tp.turma ASC, ' +
         '    dpt.cd_turma ASC, ' +
         '    dpt.cd_curso ASC ';
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      Open();

      while not Eof do begin
         with DM.qyAux5 do begin
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

            if RecordCount = 0 then begin
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
      iAnoSemestre := FieldByName('anosemestre').AsInteger;
      iEtapa := FieldByName('nr_etapa').AsInteger;
      iProfessor := FieldByName('professor').AsInteger;
      sCurso := FieldByName('curso').AsString;

         with DM.qyAux5 do begin
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

            while not Eof do begin

               with DM.qyAux4 do begin
                  SQL.Text := ' ' +
                     'SELECT ' +
                     '   fi.codigoaluno AS codaluno ' +
                     'FROM ' +
                     '   fichaindividual fi ' +
                     '   INNER JOIN diario_turmas dt ON ( ' +
                     '      fi.anosemestre = dt.anosemestre AND ' +
                     '      fi.curso = dt.curso AND ' +
                     '      fi.turma = dt.turma AND ' +
                     '      fi.disciplina = dt.disciplina ' +
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

               with DM.qyAux3 do begin
                  Close();
                  if DM.qyAux4.Eof then begin
                     SQL.Text := ' ' +
                        'INSERT INTO ' +
                        '   fichaindividual( ' +
                        '      codigoaluno, ' +
                        '      turma, ' +
                        '      anosemestre, ' +
                        '      disciplina, ' +
                        '      situacao ' +
                        '   ) VALUES ( ' +
                        '      :cd_pessoa, ' +
                        '      :cd_turma, ' +
                        '      :nr_anosemestre, ' +
                        '      :cd_disciplina, ' +
                        '      :nr_situacao ' +
                        '   ) ';
                  end
                  else begin
                     SQL.Text := ' ' +
                        'UPDATE ' +
                        '   fichaindividual ' +
                        'SET ' +
                        '   situacao = :nr_situacao ' +
                        'WHERE ' +
                        '   codigoaluno = :cd_pessoa AND ' +
                        '   anosemestre = :nr_anosemestre AND ' +
                        '   turma = :cd_turma AND ' +
                        '   disciplina = :cd_disciplina ';
                  end;
                  ParamByName('cd_pessoa').AsInteger := DM.qyAux5.FieldByName('codigoaluno').AsInteger;
                  ParamByName('cd_turma').AsString := cd_turma;
                  ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
                  ParamByName('cd_disciplina').AsInteger := cd_disciplina;
//                  ParamByName('nr_etapa').AsInteger := iEtapa;
                  ParamByName('nr_situacao').AsInteger := DM.qyAux5.FieldByName('situacao').AsInteger;
//                  ParamByName('dt_saida').AsString := FormatDateTime('yyyy-mm-dd', DM.qyAux5.FieldByName('datasaida').AsDateTime);
                  ExecSQL();
               end;

               Next();
            end;

         end;
      end;

end;

procedure TfrmCorrecoes.AtualizaNotas( cd_turma : string ; cd_disciplina : integer; nr_prova : string; prova : TProva; nr_etapa : integer; cd_prova_gabarito : integer );
{var
   iMaiorPeso : currency;
   sAtribuicao: string;
   i, iDisciplina, iDisciplinaFrente: Integer;
   nr_anosemestre: Integer;
   iCdTipoAvaliacao: Integer;
   rSomaTotalNotas, rSomaNotas: TNota;
   arrDisciplinasFazemFrente: TStringList;
   notaMaxima, notaMinima: Double;}
const
   SQL_ATUALIZA_PROVAS_ALUNOS =
      ' REPLACE INTO diario_provas_alunos ( cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_prova, vl_nota ) ' +
      ' VALUES( :cd_pessoa, :cd_turma, :nr_anosem, :cd_disciplina, :cd_bimestre, :nr_prova, :vl_nota ) ';
   SQL_UPDATE_FICHA_INDIVIDUAL_EXAME =
      ' UPDATE ' +
      '    leitora_provas_alunos pa ' +
      '    INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_gabarito = pa.cd_prova_gabarito) ' +
      '    INNER JOIN leitora_provas_disciplinas pd ON (pd.cd_prova = pg.cd_prova) ' +
      '    INNER JOIN leitora_provas_alunos_dis pad ON ( ' +
      '       pad.cd_prova_aluno = pa.cd_prova_aluno AND pad.cd_prova_disciplina = pd.cd_prova_disciplina ' +
      '    ) ' +
      '    LEFT JOIN fichaindividual fi ON ( ' +
      '       fi.codigoaluno = pa.cd_pessoa AND fi.anosemestre = pa.nr_anosemestre AND ' +
      '       fi.turma = pa.cd_turma AND fi.disciplina = pd.cd_disciplina ' +
      '    ) ' +
      ' SET fi.nota%s = %s ' +
      ' WHERE pg.cd_prova = :cd_prova AND pg.cd_prova_gabarito = :cd_prova_gabarito AND ' +
      '       fi.turma = :cd_turma AND fi.disciplina = :cd_disciplina AND ' +
      '       fi.situacao IN (2) AND pad.nr_acertos IS NOT NULL ';
   SQL_LISTA_NOTAS_ALUNOS =
      ' SELECT pa.cd_pessoa, pa.cd_turma, pa.nr_anosemestre, ' +
      '        pd.cd_disciplina, dt.bimestre, dp.cd_grupo, ''%s'' AS nr_prova, %s AS valor ' +
      ' FROM leitora_provas_alunos pa ' +
      '     INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_gabarito = pa.cd_prova_gabarito) ' +
      '     INNER JOIN leitora_provas_disciplinas pd ON (pd.cd_prova = pg.cd_prova) ' +
      '     INNER JOIN leitora_provas_alunos_dis pad ON (pad.cd_prova_aluno = pa.cd_prova_aluno AND pad.cd_prova_disciplina = pd.cd_prova_disciplina) ' +
      '     INNER JOIN leitora_provas lp ON (lp.cd_prova = pg.cd_prova) ' +
      '     INNER JOIN diario_turmas dt ON (pa.nr_anosemestre = dt.anosemestre AND pd.cd_curso = dt.curso AND pa.cd_turma = dt.turma AND pd.cd_disciplina = dt.disciplina ) ' +
      '     LEFT JOIN diario_provas dp ON (dp.cd_prova_leitora = pg.cd_prova AND dp.anosemestre = pa.nr_anosemestre AND dp.turma = pa.cd_turma AND dp.disciplina = pd.cd_disciplina AND dp.bimestre = dt.bimestre AND dp.nro_nota = :nro_nota) '+
      ' WHERE pg.cd_prova = :cd_prova AND pg.cd_prova_gabarito = :cd_prova_gabarito AND ' +
      '       pa.cd_turma = :cd_turma AND pd.cd_disciplina = :cd_disciplina AND ' +
      '       dt.bimestre = :cd_bimestre AND CASE WHEN lp.sn_nota_compartilhada = 1 THEN 1=1 ELSE pad.nr_acertos IS NOT NULL END ';

var
   nr_anosemestre, iDisciplinaFrente, iCdTipoAvaliacao, I, iDisciplina : Integer;
   sAtribuicao, sCampoAtribuicao, log : String;
   qyExecuteSQL, qyListaNotasAlunos : TUMZQuery;
   arrDisciplinasFazemFrente: TStringList;
   rSomaTotalNotas, rSomaNotas: TNota;
   notaMaxima, notaMinima: Double;
begin
   DM.CriarConsulta(qyExecuteSQL);
   DM.CriarConsulta(qyListaNotasAlunos);

   if prova.NotaCompartilhada then
   begin
      sCampoAtribuicao := 'pa.nr_acertos';
   end else begin
      sCampoAtribuicao := 'pad.nr_acertos';
   end;

   if qyProvassn_permitir_maior.AsInteger = 1 then
   begin
      sAtribuicao := sCampoAtribuicao;
   end else begin
      sAtribuicao := 'CASE WHEN ' + sCampoAtribuicao + ' > 10.0 then 10 ELSE ' + sCampoAtribuicao + ' END';
   end;

   if nr_prova <> 'EF' then
   begin
      if nr_prova = 'RB' then
      begin
         nr_prova := '-1';
      end;

      qyListaNotasAlunos.SQL.Text := Format(SQL_LISTA_NOTAS_ALUNOS, [nr_prova, sAtribuicao]);

      qyListaNotasAlunos.ParamByName('cd_prova').AsInteger := prova.Codigo;
      qyListaNotasAlunos.ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
      qyListaNotasAlunos.ParamByName('cd_turma').AsString := cd_turma;
      qyListaNotasAlunos.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      qyListaNotasAlunos.ParamByName('cd_bimestre').AsInteger := nr_etapa;
      qyListaNotasAlunos.ParamByName('nro_nota').AsString := nr_prova;

      qyListaNotasAlunos.Open();

      // Se conseguiu encontrar alguma nota a ser atribuída
      if not qyListaNotasAlunos.Eof then
      begin
         nr_anosemestre := qyListaNotasAlunos.FieldByName('nr_anosemestre').AsInteger;
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

      while not qyListaNotasAlunos.Eof do
      begin
         qyExecuteSQL.Close();
         qyExecuteSQL.SQL.Text := SQL_ATUALIZA_PROVAS_ALUNOS;
         qyExecuteSQL.ParamByName('cd_pessoa').AsInteger := qyListaNotasAlunos.FieldByName('cd_pessoa').AsInteger;
         qyExecuteSQL.ParamByName('cd_turma').AsString := cd_turma;
         qyExecuteSQL.ParamByName('nr_anosem').AsInteger := qyListaNotasAlunos.FieldByName('nr_anosemestre').AsInteger;
         qyExecuteSQL.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         qyExecuteSQL.ParamByName('cd_bimestre').AsInteger := nr_etapa;
         qyExecuteSQL.ParamByName('nr_prova').AsInteger := qyListaNotasAlunos.FieldByName('nr_prova').AsInteger;
         qyExecuteSQL.ParamByName('vl_nota').AsFloat := qyListaNotasAlunos.FieldByName('valor').AsFloat;
         qyExecuteSQL.ExecSQL();


         //Monta a mensagem do log de inserção de cada nota
         log := CHR(13) + '[Importação de gabaritos da leitora de gabaritos] ';
         log := log + 'Aluno: '+ IntToStr(qyListaNotasAlunos.FieldByName('cd_pessoa').AsInteger) + CHR(13);
         log := log + 'Prova: '+ IntToStr(qyListaNotasAlunos.FieldByName('nr_prova').AsInteger) + CHR(13);
         log := log + 'Nota: '+ FloatToStr(qyListaNotasAlunos.FieldByName('valor').AsFloat) + CHR(13);
         log := log + 'Ano/semestre: '+ IntToStr(qyListaNotasAlunos.FieldByName('nr_anosemestre').AsInteger) + CHR(13);
         log := log + 'Turma: '+ cd_turma + CHR(13);
         log := log + 'Disciplina: '+ IntToStr(cd_disciplina) + CHR(13);
         log := log + 'Etapa: '+ IntToStr(nr_etapa) + CHR(13);
         log := log + '';

         // gravar o log
         gravaLog(0, 3, 2, log,0);

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
                  nr_anosemestre, cd_turma, iDisciplina, nr_etapa,
                  iCdTipoAvaliacao, qyListaNotasAlunos.FieldByName('cd_pessoa').AsInteger
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
               nr_anosemestre, cd_turma, iDisciplinaFrente, nr_etapa,
               iCdTipoAvaliacao, qyListaNotasAlunos.FieldByName('cd_pessoa').AsInteger,
               rSomaTotalNotas
            );
         end;

         DM.CalcularMediaAutomaticamente(
            qyListaNotasAlunos.FieldByName('nr_anosemestre').AsInteger,
            cd_turma, cd_disciplina, nr_etapa,
            qyListaNotasAlunos.FieldByName('cd_grupo').AsInteger,
            qyListaNotasAlunos.FieldByName('cd_pessoa').AsInteger
         );

         qyListaNotasAlunos.Next;
      end;
   end else begin
      nr_prova := 'exame';

      qyExecuteSQL.SQL.Text := Format(SQL_UPDATE_FICHA_INDIVIDUAL_EXAME, [nr_prova, sAtribuicao]);
      qyExecuteSQL.ParamByName('cd_prova').AsInteger := prova.Codigo;
      qyExecuteSQL.ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
      qyExecuteSQL.ParamByName('cd_turma').AsString := cd_turma;
      qyExecuteSQL.ParamByName('cd_disciplina').AsInteger := cd_disciplina;

      qyExecuteSQL.ExecSQL();
   end;

   FreeAndNil(qyExecuteSQL);
   FreeAndNil(qyListaNotasAlunos);
end;

procedure TfrmCorrecoes.gravaLog(cd_pessoa :Integer; cd_acao : Integer; cd_atividade: integer; descricao: string; cd_professor: integer);
const
   SQL_INSERIR_LOG_DIARIO =
   'INSERT INTO diario_logs (cd_pessoa, cd_acao, cd_atividade,dt_log, descricao, cd_log_pai, cd_professor)'
   +'VALUES (:cd_pessoa, :cd_acao, :cd_atividade, :dt_log, :descricao, NULL, :cd_professor)';
var
   qyInseriLog: TUMZQuery;
   msgLog: String;
begin
   DM.CriarConsulta(qyInseriLog);
   qyInseriLog.Close();
   qyInseriLog.SQL.Text := SQL_INSERIR_LOG_DIARIO;
   qyInseriLog.ParamByName('cd_pessoa').AsInteger := cd_pessoa;//codigo de pessoa
   qyInseriLog.ParamByName('cd_acao').AsInteger := cd_acao;//codigo da acao
   qyInseriLog.ParamByName('cd_atividade').AsInteger := cd_atividade;//codigo atividade
   qyInseriLog.ParamByName('dt_log').AsDateTime := DM.DataAtual(); //data do log
   qyInseriLog.ParamByName('descricao').AsString := descricao;// descricao mensagem
   qyInseriLog.ParamByName('cd_professor').AsInteger := cd_professor;//codigo de professor
   qyInseriLog.ExecSQL();
   FreeAndNil(qyInseriLog);
end;

procedure TfrmCorrecoes.tbRecalcularClick(Sender: TObject);
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

procedure TfrmCorrecoes.definirPontuacaoQuestao(cd_prova_aluno_resposta:integer; db_pontuacao: double);
var
   qyAtualizarPontuacao: TUMZQuery;
begin
   Dm.CriarConsulta(qyAtualizarPontuacao);

   qyAtualizarPontuacao.SQL.Text :=  'UPDATE leitora_provas_alunos_resp SET db_pontuacao = :pontuacao WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
   qyAtualizarPontuacao.ParamByName('pontuacao').AsFloat:= db_pontuacao;
   qyAtualizarPontuacao.ParamByName('cd_prova_aluno_resposta').AsFloat:= cd_prova_aluno_resposta;

   qyAtualizarPontuacao.ExecSQL();

   FreeAndNil(qyAtualizarPontuacao);
end;

procedure TfrmCorrecoes.RecalculaGabaritos(cd_prova:integer);
const
   SSQLSelectProvaAluno = 'SELECT `CD_PROVA_ALUNO`, `CD_PESSOA`, `CD_PROVA_GABARITO`, `NR_ACERTOS`, `CD_TURMA`, `NR_ANOSEMESTRE` FROM `LEITORA_PROVAS_ALUNOS` WHERE `CD_PROVA_ALUNO` = ?';
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
   totalRegistros : Integer;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   JSON, JSONOld, JSONNew, JSONChave: TlkJSONobject;
   S, Chave: AnsiString;
begin

   DM.ConfiguraParametros();
   
   with DM.qyAux do
   begin
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
         '      INNER JOIN leitora_provas_alunos_resp ar ON (ar.cd_prova_aluno = a.cd_prova_aluno AND ar.nr_questao = gr.nr_questao AND ar.nr_parte = gr.nr_parte) ' +
         'WHERE ' +
         '   (ar.nr_correcao = 1 OR isNull(nr_correcao)) AND ' +
         '   g.cd_prova = :cd_prova ' +
         'ORDER BY ' +
         '   a.cd_prova_aluno, ' +
         '   gr.cd_prova_disciplina, ' +
         '   gr.nr_questao ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();

      totalRegistros := RecordCount;

      while not Eof do
      begin

         // Esta função insere o aluno em todas as disciplinas da prova, caso
         // ja esteja inserido não vai inserir
         insereDisciplinas(
            cd_prova,
            FieldByName('cd_prova_aluno').AsInteger
         );

         iCdProvaAluno := FieldByName('cd_prova_aluno').AsInteger;
         iAcertosTotal := 0;

         while (iCdProvaAluno = FieldByName('cd_prova_aluno').AsInteger) AND (not Eof) do
         begin
            TfSplash.GetInstancia().ShowSplashScreen('Recalculando gabaritos, aguarde...', IntToStr(Trunc( (RecNo * 100) / totalRegistros )) + '%');

            iCdProvaAluno := FieldByName('cd_prova_aluno').AsInteger;
            iCdDisciplina := FieldByName('cd_prova_disciplina').AsInteger;
            iAcertos := 0;

            while (iCdDisciplina = FieldByName('cd_prova_disciplina').AsInteger) AND
                  (iCdProvaAluno = FieldByName('cd_prova_aluno').AsInteger) AND (not Eof) do
            begin
               iCdDisciplina := FieldByName('cd_prova_disciplina').AsInteger;
               bSomatoria := DM.VerificaeNumero(FieldByName('ds_resposta_gabarito').AsString);
               iAlternativas := FieldByName('nr_alternativas').AsInteger;
               rPeso := FieldByName('vl_peso').AsFloat;
               iAux := 0;

               // Se a questão estiver anulada, já coloca como certa para o aluno
               if FieldByName('cd_situacao').AsInteger = 3 then
               begin
                  iAcertos := iAcertos + FieldByName('vl_peso').AsFloat;
                  iAcertosTotal := iAcertosTotal + FieldByName('vl_peso').AsFloat;

                  with DM.qyAux2 do
                  begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 3 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;

                  definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,DM.qyAux.FieldByName('vl_peso').AsFloat);
               end
               // Se a questão for descritiva, já contabiliza a pontuação
               else if FieldByName('sn_discursiva').AsInteger = 1 then
               begin
                  iAcertos := iAcertos + FieldByName('db_pontuacao').AsFloat;
                  iAcertosTotal := iAcertosTotal + FieldByName('db_pontuacao').AsFloat;

                  with DM.qyAux2 do
                  begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 3 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;
                   // Não precisa definir pontuação nas discursivas
                  //definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,DM.qyAux.FieldByName('vl_peso').AsFloat);
               end
               // Se o aluno não respondeu nada, coloca como ERRADA para o aluno
               else if FieldByName('ds_resposta_aluno').AsString = '' then
               begin
                  with DM.qyAux2 do
                  begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                  end;

                  definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,0);
               end
               // Se a resposta do aluno é exatamente igual a resposta correta da questão
               else if FieldByName('ds_resposta_aluno').AsString = FieldByName('ds_resposta_gabarito').AsString then
               begin
                  iAcertos := iAcertos + FieldByName('vl_peso').AsFloat;
                  iAcertosTotal := iAcertosTotal + FieldByName('vl_peso').AsFloat;

                  with DM.qyAux2 do
                  begin
                     Close();
                     SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 0 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                     ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                     ExecSQL();
                     
                     definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,DM.qyAux.FieldByName('vl_peso').AsFloat);
                  end;
               end
               //se o numero de alternativas for zero sigfinica que o resultado eh um número, então so compara se esta certo ou não
               else if (FieldByName('nr_alternativas').AsInteger = 0) then
               begin
                  if (FieldByName('ds_resposta_aluno').AsString = FieldByName('ds_resposta_gabarito').AsString) then
                  begin
                     iAcertos := iAcertos + FieldByName('vl_peso').AsFloat;
                     iAcertosTotal := iAcertosTotal + FieldByName('vl_peso').AsFloat;

                     with DM.qyAux2 do
                     begin
                        Close();
                        SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 0 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                        ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                        ExecSQL();

                        definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,DM.qyAux.FieldByName('vl_peso').AsFloat);
                     end;
                  end;
               end
               // Se a questão é somatória, e permite parcial
               else if (DM.qyAux.FieldByName('sn_parcial').AsInteger = 1) AND bSomatoria AND
                        DM.VerificaeNumero(trim(FieldByName('ds_resposta_aluno').AsString)) AND
                        (Length(trim(FieldByName('ds_resposta_aluno').AsString)) = Length(trim(FieldByName('ds_resposta_gabarito').AsString))) then
               begin

                  if (StrToInt(trim(FieldByName('ds_resposta_aluno').AsString)) <= FieldByName('ds_resposta_gabarito').AsInteger) OR (DM.sSomatoriasParciaisTipo = 'UFSC_20061') OR (DM.sSomatoriasParciaisTipo = 'FORMULA') then
                  begin
                    sAux := DM.DecompoeNumero(FieldByName('ds_resposta_gabarito').AsInteger);
                    sAux2 := DM.DecompoeNumero(FieldByName('ds_resposta_aluno').AsInteger);
                    iAux4 := 0;
                    while Pos(';',sAux2) > 0 do
                    begin
                       if Pos(Copy(sAux2, 1, pos(';',sAux2)-1), sAux) = 0 then
                       begin
                          iAux := -1;
                          iAux4 := iAux4 + 1;
                       end;
                       sAux2 := Copy(sAux2, pos(';',sAux2)+1);
                    end;

                    if (iAux = -1) AND (DM.sSomatoriasParciaisTipo <> 'UFSC_20061') AND (DM.sSomatoriasParciaisTipo <> 'FORMULA') then
                    begin
                       with DM.qyAux2 do
                       begin
                          Close();
                          SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                          ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                          ExecSQL();

                          definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,0);
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
                             iAcertos := iAcertos + RoundFloat((rPeso-((iAux2-iAux)*RoundFloat((rPeso/iAlternativas), 2))),2);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso-((iAux2-iAux)*RoundFloat((rPeso/iAlternativas), 2))),2);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,RoundFloat((rPeso-((iAux2-iAux)*RoundFloat((rPeso/iAlternativas), 2))),2));
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

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger, 0);
                             end;
                          end
                          // Acima de 2 proposições corretas e o cara assinalou pelo menos 2
                          else begin
                             iAcertos := iAcertos + RoundFloat((rPeso-((iAux2-iAux)*(rPeso/iAlternativas))),2);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso-((iAux2-iAux)*(rPeso/iAlternativas))),2);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,RoundFloat((rPeso-((iAux2-iAux)*(rPeso/iAlternativas))),2));
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

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger, 0);
                             end;
                          end
                          // Se Não, aplicando a nova fórmula da UFSC
                          else begin
                             iAcertos := iAcertos + RoundFloat((rPeso*((iAlternativas -(iAux2-(iAux-iAux4)))/iAlternativas)),2);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso*((iAlternativas -(iAux2-(iAux-iAux4)))/iAlternativas)),2);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,RoundFloat((rPeso*((iAlternativas -(iAux2-(iAux-iAux4)))/iAlternativas)),2));
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

                             iAcertos := iAcertos + RoundFloat((rPeso*VGetReal(psFormula.GetVariable('Output'))),2);
                             iAcertosTotal := iAcertosTotal + RoundFloat((rPeso*VGetReal(psFormula.GetVariable('Output'))),2);

                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,RoundFloat((rPeso*VGetReal(psFormula.GetVariable('Output'))),2));
                             end;
                          end
                          // Se o número de proposições corretas assinaladas
                          // for <= ao número de proposições incorretas assinaladas
                          else begin
                             with DM.qyAux2 do begin
                                Close();
                                SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                                ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                                ExecSQL();

                                definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,0);
                             end;
                          end;

                       // FIM - UFSC 20061

                       end
                       else begin
                          iAcertos := iAcertos + RoundFloat(((iAux/iAux2)*DM.qyAux.FieldByName('vl_peso').AsFloat),3);
                          iAcertosTotal := iAcertosTotal + RoundFloat(((iAux/iAux2)*DM.qyAux.FieldByName('vl_peso').AsFloat),3);

                          with DM.qyAux2 do begin
                             Close();
                             SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno_resposta = :cd_prova_aluno_resposta';
                             ParamByName('cd_prova_aluno_resposta').AsInteger := DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger;
                             ExecSQL();

                             definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,RoundFloat(((iAux/iAux2)*DM.qyAux.FieldByName('vl_peso').AsFloat),3));
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

                        definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger, 0);
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

                     definirPontuacaoQuestao(DM.qyAux.FieldByName('cd_prova_aluno_resposta').AsInteger,0);
                  end;
               end;

               Next();
            end;

            // Computando os acertos do aluno [iCdProvaAluno] na disciplina [iCdDisciplina]
            with DM.qyAux2 do begin
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

         Stmt := DM.db.DbcConnection.PrepareStatement(SSQLSelectProvaAluno);
         try
            Stmt.SetResultSetConcurrency(rcUpdatable);

            Stmt.SetInt(1, iCdProvaAluno);

            Rs := Stmt.ExecuteQueryPrepared;
            try
               if Rs.Next then
               begin
                  // Rs.MoveToCurrentRow;

                  JSONOld := DM.RecordToJSON(Rs);

                  Rs.UpdateDouble(4, iAcertosTotal);
                  Rs.UpdateRow;

                  JSONNew := DM.RecordToJSON(Rs);

                  JSON := TlkJSONobject.Create(False);
                  try
                     JSON.Add('anterior', JSONOld);
                     JSON.Add('novo', JSONNew);

                     S := UTF8Decode(TlkJSON.GenerateText(JSON));
                  finally
                     FreeAndNil(JSON);
                  end;

                  JSONChave := TlkJSONobject.Create(False);
                  try
                     JSONChave.Add('formulario', Self.Name);
                     JSONChave.Add('metodo', 'RecalculaGabaritos');
                     JSONChave.Add('cd_prova_aluno', iCdProvaAluno);

                     Chave := UTF8Decode(TlkJSON.GenerateText(JSONChave));
                  finally
                     FreeAndNil(JSONChave);
                  end;

                  DM.Log(7001, Chave, S, tlAlteracao);
               end;
            finally
               Rs.Close;
            end;
         finally
            Stmt.Close;
         end;
      end;

      TfSplash.GetInstancia().CloseSplashScreen();

   end;


end;

procedure TfrmCorrecoes.ToolButton5Click(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7002, npAlterar, True ) then Exit;

   if pcQuestoes.ActivePage = tsQuestoesNormais then
   begin
      frmDigitarQuestoes.cd_prova_aluno := qyAlunos.FieldByName('cd_prova_aluno').AsInteger;
      frmDigitarQuestoes.ds_nome_aluno := qyAlunos.FieldByName('nm_pessoa').AsString;

      qyRespostas.First();
      frmDigitarQuestoes.sQuestoes := '';
      frmDigitarQuestoes.sPesos := '';
      while not qyRespostas.Eof do
      begin
         if Length(frmDigitarQuestoes.sQuestoes) > 0 then
         begin
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
   else
   begin
      frmDigitarQuestoesDiscursivas.cd_prova_aluno := qyAlunos.FieldByName('cd_prova_aluno').AsInteger;
      frmDigitarQuestoesDiscursivas.ds_nome_aluno := qyAlunos.FieldByName('nm_pessoa').AsString;

      qyRespostasDiscursivas.First();
      frmDigitarQuestoesDiscursivas.sQuestoes := '';
      frmDigitarQuestoesDiscursivas.sPesos := '';
      while not qyRespostasDiscursivas.Eof do
      begin
         if Length(frmDigitarQuestoesDiscursivas.sQuestoes) > 0 then
         begin
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

procedure TfrmCorrecoes.ToolButton6Click(Sender: TObject);
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

procedure TfrmCorrecoes.ToolButton8Click(Sender: TObject);
var
   odImportar: TOpenDialog;
   sMsg : String;
begin

   // Carregar Layouts

   sMsg := 'Confirmação' + CHR(13) + CHR(13);
   sMsg := sMsg + 'O seguinte layout está configurado para importação:' + CHR(13);
   sMsg := sMsg + FrmImportarLayouts.GetNomeLayoutPadrao() + CHR(13) + CHR(13);
   sMsg := sMsg + 'Deseja selecionar outro Layout? ';

   if Mensagem(sMsg, 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION) = mrYEs then begin

      if FrmImportarLayouts.ShowModal() = mrCancel then begin

         Exit;

      end;

   end else begin
      // Carregar o Layout Padrão

      FrmImportarLayouts.CarregaItensLayout(FrmImportarLayouts.GetLayoutPadrao());

   end;

   odImportar := TOpenDialog.Create(Self);
   
   with odImportar do
   begin
      Filter := 'Arquivo gerado pelo programa da Leitora|*.dat';

      Title := 'Selecione um arquivo de resultado...';
   end;
   
   if odImportar.Execute then
   begin
      ImportarResultados(odImportar.FileName, qyProvascd_prova.AsInteger, 0, 0, StrToInt(txtAnoSemestre.Text), true);

      RecalculaGabaritos(qyProvascd_prova.AsInteger);

      qyTurmas.Close();
      qyTurmas.Open();
   end;

   odImportar.Destroy();
end;

procedure TfrmCorrecoes.tsPartesChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   if provaAtual = nil then Exit;

   qyRespostas.Filtered := False;
   qyRespostasDiscursivas.Filtered := False;

   if (tsPartes.Tabs.Count > 1) AND (NewTab > 0) then
   begin
      qyRespostas.Filter := 'nr_parte = ' + IntToStr(NewTab);
      qyRespostasDiscursivas.Filter := 'nr_parte = ' + IntToStr(NewTab);
   end else begin
      qyRespostas.Filter := '';
      qyRespostasDiscursivas.Filter := '';
   end;

   qyRespostas.Filtered := True;
   qyRespostasDiscursivas.Filtered := True;
end;

procedure TfrmCorrecoes.psFormulaCompile(Sender: TPSScript);
begin
   Sender.AddRegisteredVariable('Output', 'extended');  // Retorno
   Sender.AddRegisteredVariable('NTPC', 'integer');     // N. total de proposições corretas da questão
   Sender.AddRegisteredVariable('NPC', 'integer');      // N. de proposições corretas assinaladas
   Sender.AddRegisteredVariable('NPI', 'integer');      // N. de proposições INcorretas assinaladas
   Sender.AddRegisteredVariable('NP', 'integer');       // N. de proposições da questão
end;

procedure TfrmCorrecoes.psFormulaExecute(Sender: TPSScript);
begin
  VSetInt(Sender.GetVariable('NTPC'), iAux2);
  VSetInt(Sender.GetVariable('NPC'), iAux);
  VSetInt(Sender.GetVariable('NPI'), iAux4);
  VSetInt(Sender.GetVariable('NP'), iAlternativas);
end;

procedure TfrmCorrecoes.SpeedButton1Click(Sender: TObject);
begin
   if (qyAcertosEspecifico.RecordCount = 0) then begin
      if (DM.GeraLeitoraDisciplinas(qyProvas.FieldByName('cd_prova').AsInteger, qyAlunos.FieldByName('cd_prova_aluno').AsInteger)) then begin
         qyAcertosEspecifico.Close();
         qyAcertosEspecifico.Open();
      end;
   end;
end;

procedure TfrmCorrecoes.UpDown3Click(Sender: TObject; Button: TUDBtnType);
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

procedure TfrmCorrecoes.cbAnoSemextreClick(Sender: TObject);
begin
  qyProvas.Close();
  qyProvas.Open();

  txtAnoSemestre.Enabled := cbAnoSemextre.Checked;
  UpDown3.Enabled := cbAnoSemextre.Checked;

end;

procedure TfrmCorrecoes.contNotasPopup;
begin
   contComNotas := 0;
   contSemNotas := 0;
   qyAlunos.DisableControls;
   while not ( qyAlunos.Eof ) do
   begin
      if ( qyAlunosnr_acertos.AsString <> '' ) then
      begin
         inc(contComNotas);
      end else begin
         inc(contSemNotas);      
      end;
      qyAlunos.next;
   end;
  qyAlunos.EnableControls;
  qyAlunos.First;
end;

procedure TfrmCorrecoes.qyProvasBeforeOpen(DataSet: TDataSet);
begin
  if cbAnoSemextre.Checked then begin
    with qyProvas do begin
      SQL.Text := 'SELECT * FROM leitora_provas WHERE nr_anosemestre = :nr_anosemestre ORDER BY cd_prova DESC';
      ParamByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
    end;
  end
  else begin
    with qyProvas do begin
      SQL.Text := 'SELECT * FROM leitora_provas ORDER BY cd_prova DESC';
    end;
  end;

end;

end.
