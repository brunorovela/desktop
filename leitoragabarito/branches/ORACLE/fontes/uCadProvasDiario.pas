unit uCadProvasDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UCrpeClasses, UCrpe32,
  Buttons, uUsuario;

type
  TfrmCadProvasDiario = class(TForm)
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
    qyProvasDiario: TUMZQuery;
    dsProvasDiario: TDataSource;
    pmQtd: TPopupMenu;
    Panel4: TPanel;
    Bevel6: TBevel;
    pnAnoSemestre: TPanel;
    ilDisciplinas: TImageList;
    qyAlunos: TUMZQuery;
    srcAlunos: TDataSource;
    qyAlunosnr_anosemestre: TSmallintField;
    qyAlunoscd_turma: TStringField;
    srcGabaritos: TDataSource;
    qyGabaritos: TUMZQuery;
    qyGabaritoscd_prova_gabarito: TIntegerField;
    qyGabaritosds_nome_gabarito: TStringField;
    Label3: TLabel;
    Panel1: TPanel;
    txtAnoSemestre: TMaskEdit;
    UpDown3: TUpDown;
    cbAnoSemextre: TCheckBox;
    Label7: TLabel;
    Panel5: TPanel;
    pgDisciplinas: TPageControl;
    tsInformacoes: TTabSheet;
    tsGabaritos: TTabSheet;
    grdGabaritos: TDBGrid;
    tsAlunos: TTabSheet;
    Bevel1: TBevel;
    Label8: TLabel;
    edTurma: TMaskEdit;
    Label9: TLabel;
    edDisciplina: TMaskEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    qyProvasDiarionro_nota: TSmallintField;
    qyProvasDiarioturma: TStringField;
    qyProvasDiarioanosemestre: TSmallintField;
    qyProvasDiariodisciplina: TIntegerField;
    qyProvasDiariobimestre: TSmallintField;
    qyProvasDiariodata: TStringField;
    qyProvasDiarioassunto: TStringField;
    qyProvasDiariosn_bloqueado: TSmallintField;
    qyProvasDiariocd_professor: TIntegerField;
    qyProvasDiariosn_compoe: TSmallintField;
    qyProvasDiariosn_especial: TSmallintField;
    qyProvasDiarionm_professor: TStringField;
    qyProvasDiariods_disciplina_sigla: TStringField;
    qyProvasDiariods_disciplina: TStringField;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    qyProvasDiariocd_prova: TIntegerField;
    qyProvasDiariocd_chave: TIntegerField;
    qyAlunoscd_pessoa: TIntegerField;
    qyAlunosnm_pessoa: TStringField;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    qyProvasDiariocd_curso: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit9: TDBEdit;
    bev: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel8: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qyGabaritoscd_prova: TIntegerField;
    qyAlunosnr_acertos: TFloatField;
    UpDown2: TUpDown;
    txtBimestre: TMaskEdit;
    Label12: TLabel;
    qyProvasDiarionr_serie: TSmallintField;
    qyProvasDiariocd_prova_leitora: TIntegerField;
    cbSimulado: TCheckBox;
    Panel3: TPanel;
    ckbSobreescrever: TCheckBox;
    qyProvasDiariosn_leitora: TIntegerField;
    qyProvasDiarionr_prova: TSmallintField;
    qyGabaritosnr_questoes: TLargeintField;
    procedure qyProvasDiarioCalcFields(DataSet: TDataSet);
    procedure cbSimuladoClick(Sender: TObject);
    procedure qyAlunosBeforeOpen(DataSet: TDataSet);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure srcGabaritosDataChange(Sender: TObject; Field: TField);
    procedure ToolButton5Click(Sender: TObject);
    procedure grdGabaritosDblClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cbAnoSemextreClick(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure qyProvasDiarioAfterEdit(DataSet: TDataSet);
    procedure ToolButton14Click(Sender: TObject);
    procedure pgDisciplinasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnImprimirTurmaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dsProvasDiarioDataChange(Sender: TObject; Field: TField);
    procedure tbIncluirDisciplinaClick(Sender: TObject);
    procedure tbExcluirDisciplinaClick(Sender: TObject);
    procedure qyDisciplinasNewRecord(DataSet: TDataSet);
    procedure qyProvasDiarioNewRecord(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }

    sSqlOriginal: String;

    PastaArquivos : String;

    procedure GabaritoCarregarArquivoImportacao();
    procedure GabaritoImportarArquivo(sNomeArquivo: String);
    procedure AtribuirNotas;

    procedure Filtra();
  public
    { Public declarations }
  end;

var
  frmCadProvasDiario: TfrmCadProvasDiario;

implementation

uses Main, uDM, uCadProvasDisciplinas, uCadProvasTurmas, uCadProvasGabaritos,
  uCadProvasAlunos, uCadProvasCadAlunos, uSelDisciplinasAcad, uFSelecionarTurma,
  uCorrecaoRecalculo, uSelProvas, uImportarLayouts, uFuncoesGerais;

{$R *.dfm}

procedure TfrmCadProvasDiario.GabaritoImportarArquivo(sNomeArquivo: String);
var
   tfArq: TextFile;
   sLinha: String;
//   iPosCodAluno, iTamCodAluno: Integer;
   iPosCodProva, iTamCodProva, iCodProva, iCodDisciplina: Integer;
   iPosInicioQuestoes, iTamQuestao, iTamQuestoesSomatorio: Integer;
   iEspacoEntreQuestoes, iPosAlternativa, iPosSomatorio: Integer;
   AQueryAux, AQueryAux2: TUMZQuery;
   iCodProvaGabarito: Integer;
   iQuestao: Integer;
   sSomatorio, sAlternativa: String;
   iAux: Integer;
   iPesoSomatorias, iPesoAlternativas: Integer;
   sCodProvaGabarito: String;
begin
//   iPosCodAluno         := StrToInt(  DM.variavel_parametro('lg_imp_cod_aluno_pos')             );
//   iTamCodAluno         := StrToInt(  DM.variavel_parametro('lg_imp_cod_aluno_tam')             );

   // Carregar Parametros de importação
   
   iPosCodProva         := StrToInt(  DM.variavel_parametro('lg_imp_cod_prova_pos')             );
   iTamCodProva         := StrToInt(  DM.variavel_parametro('lg_imp_cod_prova_tam')             );
   iPosInicioQuestoes   := StrToInt(  DM.variavel_parametro('lg_imp_questoes_inicio')           );
   iTamQuestao          := StrToInt(  DM.variavel_parametro('lg_imp_questoes_tamanho')          );
   iTamQuestoesSomatorio:= StrToInt(  DM.variavel_parametro('lg_imp_questoes_somatorio_tamanho'));
   iEspacoEntreQuestoes := StrToInt(  DM.variavel_parametro('lg_imp_espaco_entre_questoes')     );
   iPosAlternativa      := StrToInt(  DM.variavel_parametro('lg_imp_questoes_pos_alternativa')  );
   iPosSomatorio        := StrToInt(  DM.variavel_parametro('lg_imp_questoes_pos_somatorio')    );
   iPesoSomatorias      := StrToInt(  DM.variavel_parametro('lg_peso_padrao_somatoria')         );
   iPesoAlternativas    := StrToInt(  DM.variavel_parametro('lg_peso_padrao_multipla_escolha')  );

   AQueryAux := TUMZQuery.Create(Self);
   AQueryAux.Connection := DM.db;

   AQueryAux2 := TUMZQuery.Create(Self);
   AQueryAux2.Connection := DM.db;

   // Inserir uma nova prova na leitora

   with AQueryAux do begin

      // Verificar se a prova já foi importada

      SQL.Text := 'SELECT * from  leitora_provas WHERE cd_chave > 0 AND cd_chave = :chave ';

      if cbSimulado.Checked then
         SQL.Add(' AND sn_simulado = 1 ')
      else
         SQL.Add(' AND sn_simulado = 0 ');

      ParamByName('chave').AsInteger := qyProvasDiario.FieldByName('cd_prova').AsInteger;
      Open();

      if not EOF then begin
         // Ja existe um gabarito para essa prova, EXCLUIR e REIMPORTAR

         SQL.Text := 'DELETE FROM leitora_provas  WHERE cd_chave = :cd_chave ';
         if cbSimulado.Checked then
            SQL.Add(' AND sn_simulado = 1 ')
         else
            SQL.Add(' AND sn_simulado = 0 ');

         ParamByName('cd_chave').AsInteger := qyProvasDiario.FieldByName('cd_prova').AsInteger;
         ExecSQL;

         SQL.Text := 'DELETE FROM leitora_provas_disciplinas  WHERE cd_prova = :cd_prova ';
         ParamByName('cd_prova').AsInteger := qyProvasDiario.FieldByName('cd_prova_leitora').AsInteger;
         ExecSQL;

         SQL.Text := 'DELETE FROM leitora_provas_gabaritos  WHERE cd_prova = :cd_prova ';
         ParamByName('cd_prova').AsInteger := qyProvasDiario.FieldByName('cd_prova_leitora').AsInteger;
         ExecSQL;


      end;

      // incluida uma prova na leitora

      SQL.Text := 'INSERT INTO leitora_provas (nr_prova, ds_prova, nr_correcoes, nr_anosemestre, cd_chave, sn_simulado) VALUES (:nr_prova, :ds_prova, :nr_correcoes, :nr_anosemestre, :cd_chave, :sn_simulado)';

      ParamByName('nr_prova').AsInteger := qyProvasDiario.FieldByName('nro_nota').AsInteger;
      ParamByName('ds_prova').AsString := qyProvasDiario.FieldByName('assunto').AsString;
      ParamByName('nr_correcoes').AsInteger := 1;
      ParamByName('nr_anosemestre').AsInteger := qyProvasDiario.FieldByName('anosemestre').AsInteger;
      ParamByName('cd_chave').AsInteger := qyProvasDiario.FieldByName('cd_prova').AsInteger;

      if cbSimulado.Checked then
         ParamByName('sn_simulado').AsInteger := 1
      else
         ParamByName('sn_simulado').AsInteger := 0;

      // ParamByName('ds_nome_gabarito').AsString := 'Gabarito ' + IntToStr(qyGabaritos.RecordCount+1);
      ExecSQL();


      // Pegar o Código da Prova na Leitora
      SQL.Text := 'SELECT cd_prova FROM leitora_provas WHERE cd_chave = :cd_chave';
      if cbSimulado.Checked then
         SQL.Add(' AND sn_simulado = 1 ')
      else
         SQL.Add(' AND sn_simulado = 0 ');

      ParamByName('cd_chave').AsInteger := qyProvasDiario.FieldByName('cd_prova').AsInteger;
      Open();

      if Eof then begin
         Exit;
      end;
      iCodProva := FieldByName('cd_prova').AsInteger;

   end;

   // Atualizar a Prova na tela
   iAux := qyProvasDiario.FieldByName('cd_prova').AsInteger;
   qyProvasDiario.Close();
   qyProvasDiario.Open();
   qyProvasDiario.Locate('cd_prova', IntToStr(iAux), []);

   // Inserir a Prova Disciplina
   with AQueryAux do begin
      SQL.Text := 'INSERT INTO leitora_provas_disciplinas (cd_prova, cd_curso, cd_disciplina) VALUES (:cd_prova, :cd_curso, :cd_disciplina)';
      ParamByName('cd_prova').AsInteger := iCodProva;
      ParamByName('cd_curso').AsString := qyProvasDiario.FieldByName('cd_curso').AsString;
      ParamByName('cd_disciplina').AsInteger := qyProvasDiario.FieldByName('disciplina').AsInteger;
      ExecSQL();

      SQL.Text := 'SELECT * FROM leitora_provas_disciplinas WHERE cd_prova = :cd_prova';
      ParamByName('cd_prova').AsInteger := iCodProva;
      Open();

      if Eof then begin
         Exit;
      end;

      iCodDisciplina := FieldByName('cd_prova_disciplina').AsInteger;
   end;

   // Iniciar a Leitura do arquivo de Importação do Gabarito

   AssignFile ( tfArq, sNomeArquivo );
   Reset ( tfArq );

   ReadLn ( tfArq, sLinha );
   iAux := 0;

   while (iAux = 0) do begin

      if Eof(tfArq) then begin
         iAux := 1;
      end;

      ////////////////////////////////////////////////
      ////////////////////////////////////////////////

      sCodProvaGabarito :=  Copy(sLinha, iPosCodProva, iTamCodProva);

      // Inserir o Gabarito
      with AQueryAux do begin

         AQueryAux2.SQL.Text := 'SELECT cd_prova_gabarito FROM leitora_provas_gabaritos WHERE cd_prova = :cd_prova AND ds_nome_gabarito = :ds_nome_gabarito';
         AQueryAux2.ParamByName('cd_prova').AsInteger := iCodProva;
         AQueryAux2.ParamByName('ds_nome_gabarito').AsString := 'Gabarito '+ sCodProvaGabarito;
         AQueryAux2.Open();

         if not AQueryAux2.Eof then begin
            ReadLn ( tfArq, sLinha );
            Continue;
         end;

         SQL.Text := 'INSERT INTO leitora_provas_gabaritos (cd_prova, ds_nome_gabarito) VALUES (:cd_prova, :ds_nome_gabarito)';
         ParamByName('cd_prova').AsInteger := iCodProva;
         ParamByName('ds_nome_gabarito').AsString := 'Gabarito ' + sCodProvaGabarito;
         ExecSQL();

         SQL.Text := 'SELECT cd_prova_gabarito FROM leitora_provas_gabaritos WHERE cd_prova = :cd_prova ORDER BY cd_prova_gabarito DESC LIMIT 1';
         ParamByName('cd_prova').AsInteger := iCodProva;
         Open();

         if Eof then begin
            ReadLn ( tfArq, sLinha );
            Continue;
         end;

         iCodProvaGabarito := FieldByName('cd_prova_gabarito').AsInteger;

         SQL.Text := 'INSERT INTO leitora_provas_gabaritos_resp (cd_prova_gabarito, nr_alternativas, nr_questao, ds_resposta, cd_prova_disciplina, vl_peso) VALUES (:cd_prova_gabarito, :nr_alternativas, :nr_questao, :ds_resposta, :cd_prova_disciplina, :vl_peso)';
         ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
         ParamByName('cd_prova_disciplina').AsInteger := iCodDisciplina;
      end;

      sLinha := Copy(sLinha, iPosInicioQuestoes);
      iQuestao := 0;
      while Trim(sLinha) <> '' do begin
         iQuestao := iQuestao + 1;

         sSomatorio := Trim(Copy(sLinha, iPosSomatorio, iTamQuestoesSomatorio));
         sAlternativa := Trim(Copy(sLinha, iPosAlternativa, 1));

         AQueryAux.ParamByName('nr_questao').AsInteger := iQuestao;

         AQueryAux.ParamByName('nr_alternativas').AsInteger := 5;

         if sSomatorio <> '' then begin
            AQueryAux.ParamByName('ds_resposta').AsString := sSomatorio;
            AQueryAux.ParamByName('vl_peso').AsInteger := iPesoSomatorias;
         end
         else if sAlternativa <> '' then begin
            AQueryAux.ParamByName('ds_resposta').AsString := sAlternativa;
            AQueryAux.ParamByName('vl_peso').AsInteger := iPesoAlternativas;
         end else begin
            AQueryAux.ParamByName('ds_resposta').AsString := '';
            AQueryAux.ParamByName('vl_peso').AsInteger := 0;
         end;
         AQueryAux.ExecSQL();

         sLinha := Copy(sLinha, iTamQuestao+iEspacoEntreQuestoes+1);
      end;

      ////////////////////////////////////////////////
      ////////////////////////////////////////////////

      ReadLn ( tfArq, sLinha );
   end;

   CloseFile ( tfArq );

   qyGabaritos.Close();
   qyGabaritos.Open();

   // Fim da Importação do Gabarito
end;

procedure TfrmCadProvasDiario.GabaritoCarregarArquivoImportacao();
var
   odImportar: TOpenDialog;
begin
   //if qyDisciplinas.RecordCount <> 1 then begin
   //   Exit;
   //end;

   odImportar := TOpenDialog.Create(Self);
   with odImportar do begin
      Filter := 'Arquivo gerado pelo programa da Leitora|*.dat';
      if PastaArquivos = '' then
         PastaArquivos := ExtractFilePath(Application.ExeName);

      InitialDir := PastaArquivos;
      Title := 'Selecione um arquivo...';
   end;
   
   if odImportar.Execute then begin
      PastaArquivos :=odImportar.InitialDir;
      GabaritoImportarArquivo(odImportar.FileName);
   end;

   odImportar.Destroy();
end;

procedure TfrmCadProvasDiario.SpeedButton1Click(Sender: TObject);
begin
   frmSelDisciplinasAcad.ShowModal();
   if frmSelDisciplinasAcad.flgSearch then begin
      edDisciplina.Text := frmSelDisciplinasAcad.qryCursos.FieldByName('codigo').AsString;
      Filtra();
   end;
end;

procedure TfrmCadProvasDiario.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro_turma : TResultadoFiltroTurma;
begin
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro_turma.filtrado then
   begin
      txtAnoSemestre.Text := IntToStr(resultado_filtro_turma.nr_anosemestre);
      edTurma.Text := resultado_filtro_turma.cd_turma;
      Filtra();
   end;
end;

procedure TfrmCadProvasDiario.srcGabaritosDataChange(Sender: TObject;
  Field: TField);
begin
   qyAlunos.Close();
   qyAlunos.Open();
end;

procedure TfrmCadProvasDiario.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   Self.Caption := pnTitulo.Caption;

   txtAnoSemestre.Text := IntToStr(ano_semestre);

   pgDisciplinas.ActivePageIndex := 0;

   DM.Parametros_usuario(Self);

   Filtra();

   //tbImportarGabaritoDeArquivo.Enabled := DM.variavel_parametro('lg_programa_leitora') = '';
end;

procedure TfrmCadProvasDiario.Filtra();
var
   sAux: String;
begin

   if cbSimulado.Checked then begin
   
      qyProvasDiario.SQL.Text := 'SELECT ' +
      ' lp.nr_prova,'+
      ' dp.cd_prova, ' +
      ' dp.cd_prova_leitora, ' +
      ' dp.nro_nota, ' +
      ' dp.turma, ' +
      ' dp.anosemestre, ' +
      ' dp.disciplina, ' +
      ' dp.bimestre, ' +
      ' DATE_FORMAT(dp.data,"%d/%m/%Y") AS data, ' +
      ' dp.assunto, ' +
      ' dp.sn_bloqueado, ' +
      ' dp.cd_professor, ' +
      ' dp.sn_compoe, ' +
      ' dp.sn_especial, ' +
      ' p.nm_pessoa AS nm_professor, ' +
      ' d.sigla AS ds_disciplina_sigla, ' +
      ' d.descricao AS ds_disciplina, ' +
      ' IF(isNull(lp.nr_prova),0,1) AS sn_leitora, ' +
      ' lp.cd_chave, ' +
      ' t.curso AS cd_curso, ' +
      ' t.serie AS nr_serie ' +
      ' FROM ' +
      '    diario_provas_simulado dp ' +
      '    INNER JOIN turmas t ON (t.anosemestre = dp.anosemestre AND t.codigo = dp.turma) ' +
      '    INNER JOIN disciplinas d ON (d.codigo = dp.disciplina AND d.curso = t.curso) ' +
      '    LEFT JOIN leitora_provas lp ON (lp.cd_chave = dp.cd_prova) ' +
      '    LEFT JOIN pessoas p ON (p.cd_pessoa = dp.cd_professor) ' +
      '  WHERE ' +
      ' 1=1 ' +
      '   ORDER BY ' +
      '  dp.nro_nota ';

   end else begin

      qyProvasDiario.SQL.Text := 'SELECT ' +
      ' lp.nr_prova,'+
      ' dp.cd_prova, ' +
      ' dp.cd_prova_leitora, ' +
      ' dp.nro_nota, ' +
      ' dp.turma, ' +
      ' dp.anosemestre, ' +
      ' dp.disciplina, ' +
      ' dp.bimestre, ' +
      ' DATE_FORMAT(dp.data,"%d/%m/%Y") AS data, ' +
      ' dp.assunto, ' +
      ' dp.sn_bloqueado, ' +
      ' dp.cd_professor, ' +
      ' dp.sn_compoe, ' +
      ' dp.sn_especial, ' +
      ' p.nm_pessoa AS nm_professor, ' +
      ' d.sigla AS ds_disciplina_sigla, ' +
      ' d.descricao AS ds_disciplina, ' +
      ' IF(isNull(lp.nr_prova),0,1) AS sn_leitora, ' +
      ' lp.cd_chave, ' +
      ' t.curso AS cd_curso, ' +
      ' t.serie AS nr_serie ' +
      ' FROM ' +
      '    diario_provas dp ' +
      '    INNER JOIN turmas t ON (t.anosemestre = dp.anosemestre AND t.codigo = dp.turma) ' +
      '    INNER JOIN disciplinas d ON (d.codigo = dp.disciplina AND d.curso = t.curso) ' +
      '    LEFT JOIN leitora_provas lp ON (lp.cd_chave = dp.cd_prova) ' +
      '    LEFT JOIN pessoas p ON (p.cd_pessoa = dp.cd_professor) ' +
      '  WHERE ' +
      ' 1=1 ' +
      '   ORDER BY ' +
      '  dp.nro_nota ';

   end;

   sAux := '1=1';

   if cbAnoSemextre.Checked then begin
      sAux := sAux + ' AND dp.anosemestre = ' + txtAnoSemestre.Text;
   end;

   if edTurma.Text <> '' then begin
      sAux := sAux + ' AND dp.turma = ''' + edTurma.Text + '''';
   end;

   if edDisciplina.Text <> '' then begin
      sAux := sAux + ' AND dp.disciplina = ' + edDisciplina.Text;
   end;

   sAux := sAux + ' AND dp.bimestre = ' +  txtBimestre.Text;

//   if sSqlOriginal = '' then begin
      sSqlOriginal := qyProvasDiario.SQL.Text;
//   end;

   qyProvasDiario.SQL.Text := StringReplace(sSqlOriginal, '1=1', sAux, []);
   qyProvasDiario.Close();
   qyProvasDiario.Open();
   
end;

procedure TfrmCadProvasDiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadProvasDiario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(Self);
end;

procedure TfrmCadProvasDiario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCadProvasDiario.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProvasDiario.AtribuirNotas;
var
   iNumero1 : integer;
   iNumero2 : integer;
   anosem_turma, nr_prova : string;
   cd_prova : integer;
begin

   if not DM.GetUsuarioLogado.TemPermissao( 7002, npEspecial, True ) then Exit;

   cd_prova := qyGabaritoscd_prova.AsInteger;

   with DM.qyAux do begin
      Close();
      SQL.Text := ' ' +
        ' SELECT              ' +
        '   d.codigo, d.sigla ' +
        ' FROM                ' +
        '   leitora_provas_disciplinas pd ' +
        '   INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) ' +
        ' WHERE               ' +
        '   pd.cd_prova = :cd_prova       ';

      ParamByName('cd_prova').AsInteger := cd_prova;

      Open();

      iNumero1 := 1;

      while not Eof do begin

        with DM.qyAux2 do begin

            Close();
            SQL.Text := ' ' +
              ' SELECT                                                       ' +
              '    a.nr_anosemestre, a.cd_turma, g.cd_prova_gabarito         ' +
              ' FROM                                                         ' +
              '   leitora_provas_gabaritos g                                 ' +
              '   INNER JOIN leitora_provas_alunos a ON (a.cd_prova_gabarito = g.cd_prova_gabarito) ' +
              ' WHERE                                                        ' +
              '   g.cd_prova = :cd_prova                                     ' +
              ' GROUP BY                                                     ' +
              '   a.nr_anosemestre, a.cd_turma, g.cd_prova_gabarito          ';
            ParamByName('cd_prova').AsInteger := cd_prova;
            Open();
            iNumero2 := 1;
            while not Eof do begin
                if anosem_turma <> FieldByName('nr_anosemestre').AsString+FieldByName('cd_turma').AsString then begin
                    frmCorrecoesRecalculo.AtualizaDiarioMatriculas(FieldByName('cd_turma').AsString, DM.qyAux.FieldByName('codigo').AsInteger);
                    anosem_turma := FieldByName('nr_anosemestre').AsString+FieldByName('cd_turma').AsString;

                    nr_prova := qyProvasDiarionro_nota.AsString;
                    iNumero2 := iNumero2 + 1;
                end;
                frmCorrecoesRecalculo.AtualizaNotas(FieldByName('cd_turma').AsString, DM.qyAux.FieldByName('codigo').AsInteger, qyProvasDiarionro_nota.AsString, cd_prova, qyProvasDiariobimestre.AsInteger, FieldByName('cd_prova_gabarito').AsInteger);

                Next();
            end;

        end;

        iNumero1 := iNumero1 + 1;
        Next();
      end;
   end;
   
end;

procedure TfrmCadProvasDiario.btnFecharClick(Sender: TObject);
begin
   qyProvasDiario.Close;
   qyProvasDiario.Open;
   Close;
end;

procedure TfrmCadProvasDiario.btnSalvarClick(Sender: TObject);
var lugar : Pointer;
begin
end;

procedure TfrmCadProvasDiario.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyProvasDiario, pmQtd);
end;

procedure TfrmCadProvasDiario.grdGabaritosDblClick(Sender: TObject);
begin
   with frmCadProvasGabaritos do begin
      cd_prova := qyProvasDiario.FieldByName('cd_prova').AsInteger;
      cd_prova_gabarito := qyGabaritos.FieldByName('cd_prova_gabarito').AsInteger;
      qyGabarito.Close();
      qyGabarito.ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
      qyGabarito.Open();
      qyGabarito.Edit();
      pnQuestoes.Enabled := True;
      grdRespostas.Enabled := True;
      ShowModal();
   end;
   qyGabaritos.Close();
   qyGabaritos.Open();
end;

procedure TfrmCadProvasDiario.grdTitleClick(Column: TColumn);
var
   sCampo : string;
   sOrdem : string;
begin
{   sCampo := Column.FieldName;

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
      with qyProvasDiario do begin
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
}
end;

procedure TfrmCadProvasDiario.qyProvasDiarioNewRecord(DataSet: TDataSet);
begin
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('select max(cd_prova) ultimo from leitora_provas');
   DM.qyAux.Open;

   qyProvasDiario.FieldByName('cd_prova').AsInteger := DM.qyAux.FieldByName('ultimo').AsInteger + 1;
   qyProvasDiario.FieldByName('nr_anosemestre').AsInteger := ano_semestre;
   qyProvasDiario.FieldByName('nr_correcoes').AsInteger := 1;

   DM.qyAux.Close;
end;

procedure TfrmCadProvasDiario.qyAlunosBeforeOpen(DataSet: TDataSet);
begin
   qyAlunos.ParamByName('cd_turma').AsString := qyProvasDiarioturma.AsString;
end;

procedure TfrmCadProvasDiario.qyDisciplinasNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('cd_prova').AsInteger := qyProvasDiario.FieldByName('cd_prova').AsInteger;
end;

procedure TfrmCadProvasDiario.tbExcluirDisciplinaClick(Sender: TObject);
var
   iNumero : integer;
begin
end;

procedure TfrmCadProvasDiario.tbIncluirDisciplinaClick(Sender: TObject);
var lugar : Pointer;
begin
end;

procedure TfrmCadProvasDiario.dsProvasDiarioDataChange(Sender: TObject; Field: TField);
begin
   qyGabaritos.Close();
   qyGabaritos.Open();
end;

procedure TfrmCadProvasDiario.btnImprimirClick(Sender: TObject);
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
      ParamByName('cd_prova').AsInteger := qyProvasDiario.FieldByName('cd_prova').AsInteger;
      Open();

      if FieldByName('qtde').AsInteger = 0 then begin
         Mensagem( 'Não é possível imprimir, não há alunos cadastrados para esta prova !', Application.Title, MB_OK + MB_ICONERROR );
      end;

      if Mensagem( 'Imprimir os cartões da prova selecionada, contendo '+FieldByName('qtde').AsString+' aluno(s) ?', Application.Title,
        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         PrincipalForm.ImprimeRpt(DM.sRelatoriosGabaritos, -1, '{leitora_provas_gabaritos.cd_prova} = '+qyProvasDiario.FieldByName('cd_prova').AsString, '', nil, nil, nil, True);
      end;

   end;

end;

procedure TfrmCadProvasDiario.btnImprimirTurmaClick(Sender: TObject);
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
      //ParamByName('cd_prova').AsInteger := qyTurmas.FieldByName('cd_prova').AsInteger;
      //ParamByName('cd_turma').AsString := qyTurmas.FieldByName('cd_turma').AsString;
      //ParamByName('nr_anosemestre').AsInteger := qyTurmas.FieldByName('nr_anosemestre').AsInteger;
      Open();

      if FieldByName('qtde').AsInteger = 0 then begin
//         Mensagem( 'Não é possível imprimir, não há alunos cadastrados para esta prova na turma '+qyTurmas.FieldByName('cd_turma').AsString+' !', Application.Title, MB_OK + MB_ICONERROR );
      end;

//      if Mensagem( 'Imprimir os cartões da prova selecionada, contendo '+FieldByName('qtde').AsString+' aluno(s) da turma '+qyTurmas.FieldByName('cd_turma').AsString+' ?', Application.Title,
//        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
//      begin
//         PrincipalForm.ImprimeRpt(DM.sRelatoriosGabaritos, -1, '{leitora_provas_gabaritos.cd_prova} = '+qyTurmas.FieldByName('cd_prova').AsString+' AND {leitora_provas_alunos.cd_turma} = "'+qyTurmas.FieldByName('cd_turma').AsString+'" AND {leitora_provas_alunos.nr_anosemestre} = '+qyTurmas.FieldByName('nr_anosemestre').AsString, '', nil, nil, nil, True);
  //    end;

   end;

end;

procedure TfrmCadProvasDiario.pgDisciplinasChanging(Sender: TObject;
  var AllowChange: Boolean);
var lugar : Pointer;
begin

   if not (qyProvasDiario.State in [dsInsert,dsEdit]) then begin
    exit;
   end;

   lugar := qyProvasDiario.GetBookmark;

   qyProvasDiario.Post;
   qyProvasDiario.Close;
   qyProvasDiario.Open;

   qyProvasDiario.GotoBookmark(lugar);

end;

procedure TfrmCadProvasDiario.ToolButton14Click(Sender: TObject);
begin

  if Mensagem('ATENÇÃO !!'+chr(13)+chr(13)+'Esta ação possivelmente irá alterar o gabarito de alguns alunos.'+chr(13)+'Sendo assim, caso já tenha impresso gabaritos, talvez será necessário re-imprimir alguns gabaritos.'+chr(13)+chr(13)+'Deseja continuar assim mesmo ?', Application.Title, MB_YESNO+MB_ICONQUESTION, -1) = ID_YES then begin

    with DM.qyAux do begin
      Close();
      SQL.Text := 'SELECT * FROM leitora_provas';
    end;

  end;

end;

procedure TfrmCadProvasDiario.ToolButton3Click(Sender: TObject);
var
   odImportar: TOpenDialog;
   sMsg : String;
   iAux : Integer;
begin
   // GabaritoCarregarArquivoImportacao();

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
   with odImportar do begin
      Filter := 'Arquivo gerado pelo programa da Leitora|*.dat';

      Title := 'Selecione um arquivo de gabarito...';
   end;

   if odImportar.Execute then begin

      if cbSimulado.Checked then begin

         ImportarGabarito(odImportar.FileName, qyProvasDiariocd_prova_leitora.AsInteger, qyProvasDiariocd_prova.AsInteger, 1, ckbSobreescrever.Checked);

      end else begin

         ImportarGabarito(odImportar.FileName, qyProvasDiariocd_prova_leitora.AsInteger, qyProvasDiariocd_prova.AsInteger, 0, ckbSobreescrever.Checked);

      end;

      // Atualizar a Prova na tela
      iAux := qyProvasDiario.FieldByName('cd_prova').AsInteger;
      qyProvasDiario.Close();
      qyProvasDiario.Open();
      qyProvasDiario.Locate('cd_prova', IntToStr(iAux), []);

      qyGabaritos.Close();
      qyGabaritos.Open();
   end;

   odImportar.Destroy();
end;


procedure TfrmCadProvasDiario.ToolButton5Click(Sender: TObject);
var
   AQuery: TUMZQuery;
   bOk: Boolean;
   odImportar: TOpenDialog;
   sMsg : String;
begin

   if qyProvasDiario.FieldByName('sn_leitora').AsInteger = 0 then begin
      Mensagem('Não é possível fazer a importação das respostas por que você ainda não importou os gabaritos !', Application.Title, MB_OK+MB_ICONWARNING);
      Exit;
   end;

   bOk := False;

   AQuery := TUMZQuery.Create(Application);
   
   with AQuery do begin
      Connection := DM.db;
   end;

   // Verificar se está dentro do Prazo para importar
   with AQuery do
   begin
      SQL.Text := ' ' +
                         'SELECT ' +
                         '	  dp.DT_INICIO_NOTAS AS dt_envio_inicio, ' +
                         '	  dp.DT_FIM_NOTAS AS dt_envio_fim ' +
                         'FROM ' +
                         '	  dia_prazos_turmas dpt ' +
                         '	  INNER JOIN dia_prazos dp ON ( dp.CD_PRAZO = dpt.CD_PRAZO ) ' +
                         'WHERE ' +
                         '	 (dp.DT_INICIO_NOTAS <= NOW() AND dp.DT_FIM_NOTAS >= NOW()) AND ' +
                         '	 dpt.NR_ANOSEMESTRE = :nr_anosemestre AND ' +
                         '	 dpt.CD_TIPO_PRAZO = :nr_etapa AND ' +
                         '	 dpt.CD_CURSO = :cd_curso AND ' +
                         '  dpt.CD_TURMA = :cd_turma ' +
      ' ';

      ParamByName('nr_anosemestre').AsInteger := qyProvasDiario.FieldByName('anosemestre').AsInteger;
      ParamByName('nr_etapa').AsInteger := qyProvasDiario.FieldByName('bimestre').AsInteger;
   end;

   // Verificando no curso e na turma
   if not bOk then begin
      with AQuery do begin
         ParamByName('cd_curso').AsString := qyProvasDiario.FieldByName('cd_curso').AsString;
         ParamByName('cd_turma').AsString := qyProvasDiario.FieldByName('turma').AsString;
         Open();

         bOk := RecordCount > 0;
      end;
   end;

   // Verificando no curso
   if not bOk then begin
      with AQuery do begin
         ParamByName('cd_turma').AsString := '';
         Open();

         bOk := RecordCount > 0;
      end;
   end;

   // Verificando geral
   if not bOk then begin
      with AQuery do begin
         ParamByName('cd_curso').AsString := '';
         ParamByName('cd_turma').AsString := '';
         Open();

         bOk := RecordCount > 0;
      end;
   end;

   // Só faz se estiver dentro de algum prazo !
   if not bOk then begin
      if Mensagem('Você está tentando atribuir uma nota fora do prazo estipulado para o bimestre. Tem certeza que deseja continuar ?', Application.Title, MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then begin
         Exit;
      end;
   end;



 // Importar os resultados dos gabaritos
//   ResultadoCarregarArquivoImportacao();


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
   with odImportar do begin
      Filter := 'Arquivo gerado pelo programa da Leitora|*.dat';

      Title := 'Selecione um arquivo de resultado...';
   end;
   
   if odImportar.Execute then begin
      if cbSimulado.Checked then begin

         ImportarResultados(odImportar.FileName, qyProvasDiariocd_prova_leitora.AsInteger, qyProvasDiariocd_prova.AsInteger, 1, 0, ckbSobreescrever.Checked);

      end else begin

         ImportarResultados(odImportar.FileName, qyProvasDiariocd_prova_leitora.AsInteger, qyProvasDiariocd_prova.AsInteger, 0, 0, ckbSobreescrever.Checked);

      end;

  end;

   odImportar.Destroy();


   // Recalcular o gabarito

   try
   Application.CreateForm(TfrmCorrecoesRecalculo, frmCorrecoesRecalculo);

   frmCorrecoesRecalculo.RecalculaGabaritos(qyGabaritoscd_prova.AsInteger);
   
   qyAlunos.Close();
   qyAlunos.Open();

   if not cbSimulado.Checked then begin

      if Mensagem('Respostas importadas com sucesso. Deseja atribuir os resultados na prova selecionada?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION ) <> mrYes then begin
         Exit;
      end;

      // Atribuir as Notas

      AtribuirNotas;

      Mensagem('Notas atribuidas com sucesso no diário de classe.', Application.Title, MB_OK + MB_ICONEXCLAMATION);

   end;
   
   finally
     FreeAndNil(frmCorrecoesRecalculo);
   end;

end;

procedure TfrmCadProvasDiario.qyProvasDiarioAfterEdit(DataSet: TDataSet);
begin
   if qyProvasDiario.FieldByName('nr_anosemestre').AsString = '' then begin
     qyProvasDiario.FieldByName('nr_anosemestre').AsInteger := ano_semestre;
   end;
end;

procedure TfrmCadProvasDiario.qyProvasDiarioCalcFields(DataSet: TDataSet);
begin
   if qyProvasDiarionr_prova.AsInteger = 0 then
      qyProvasDiariosn_leitora.AsInteger := 0
   else
      qyProvasDiariosn_leitora.AsInteger := 1;
end;

procedure TfrmCadProvasDiario.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  if (Button = btNext) then
  begin
     txtBimestre.text := IntToStr(StrToInt(txtBimestre.text)+1);
     Filtra;
  end
  else if (Button = btPrev) AND (StrToInt(txtBimestre.text) > 1) then
  begin
     txtBimestre.text := IntToStr(StrToInt(txtBimestre.text)-1);
     Filtra;
  end;
end;

procedure TfrmCadProvasDiario.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
  Filtra();
end;

procedure TfrmCadProvasDiario.cbAnoSemextreClick(Sender: TObject);
begin
  qyProvasDiario.Close();
  qyProvasDiario.Open();

  txtAnoSemestre.Enabled := cbAnoSemextre.Checked;
  UpDown3.Enabled := cbAnoSemextre.Checked;
end;

procedure TfrmCadProvasDiario.cbSimuladoClick(Sender: TObject);
begin
   Filtra();
end;

end.
