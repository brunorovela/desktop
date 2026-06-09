unit uCadProvas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, UCrpeClasses, UCrpe32,
  DBClient, Provider, dblookup, CheckLst, MidasLib, uUsuario, UMAjuda, uTProva,
  uFSelecionarDisciplina, General, uLkJSON, ZDbcIntfs, ZSqlProcessor;

type
   TItem = class(TObject)
   private
      ANome: string;
      AValor: string;
   protected

   public
     constructor Create;
     destructor Destroy; override;
     function getNome(): string;
     procedure setNome(sValor: string);
     function getValor(): string;
     procedure setValor(sValor: string);

     property Nome: string read getNome write setNome;
     property Valor: string read getValor write setValor;
   published

   end;

   TItemProvas = class(TObject)
   private
      ABimestre, ATurma, ADisciplina, ANota : string;

    function getBimestre(): string;
    procedure setBimestre(sValor: string);
    function getTurma(): string;
    procedure setTurma(sValor: string);
    function getDisciplina(): string;
    procedure setDisciplina(sValor: string);
    function getNota(): string;
    procedure setNota(sValor: string);
      
   protected

   public
     constructor Create;
     destructor Destroy; override;

     property Bimestre: string read getBimestre write setBimestre;
     property Turma: string read getTurma write setTurma;
     property Disciplina: string read getDisciplina write setDisciplina;
     property Nota: string read getNota write setNota;
   published

   end;

  TfrmCadProvas = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    pnTitulo: TPanel;
    pnGrade: TPanel;
    Bevel5: TBevel;
    Panel2: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
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
    ilDisciplinas: TImageList;
    qyDisciplinas: TUMZQuery;
    srcDisciplinas: TDataSource;
    qyDisciplinascd_prova_disciplina: TIntegerField;
    qyDisciplinascd_prova: TIntegerField;
    qyDisciplinascd_disciplina: TSmallintField;
    qyDisciplinascd_curso: TStringField;
    qyDisciplinasdescricao: TStringField;
    qyTurmas: TUMZQuery;
    srcTurmas: TDataSource;
    qyTurmasnr_anosemestre: TSmallintField;
    qyTurmascd_turma: TStringField;
    qyTurmascd_prova: TIntegerField;
    srcGabaritos: TDataSource;
    qyGabaritos: TUMZQuery;
    qyGabaritoscd_prova_gabarito: TIntegerField;
    qyGabaritosds_nome_gabarito: TStringField;
    btnImprimir: TToolButton;
    ToolButton11: TToolButton;
    Label3: TLabel;
    qyProvasnr_prova: TSmallintField;
    tbCopiarProva: TToolButton;
    qyProvasnr_correcoes: TIntegerField;
    qyProvasnr_anosemestre: TSmallintField;
    Panel1: TPanel;
    txtAnoSemestre: TMaskEdit;
    UpDown3: TUpDown;
    cbAnoSemextre: TCheckBox;
    Label7: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label4: TLabel;
    dbNumero: TDBEdit;
    Label2: TLabel;
    dbDescricao: TDBEdit;
    Label5: TLabel;
    dbeQtdCorrecoes: TDBEdit;
    UpDown2: TUpDown;
    Label6: TLabel;
    dbeAnoSemestre: TDBEdit;
    UpDown1: TUpDown;
    Panel5: TPanel;
    pgDisciplinas: TPageControl;
    tsDisciplinas: TTabSheet;
    grdDisciplinas: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    tbIncluirDisciplina: TToolButton;
    tbExcluirDisciplina: TToolButton;
    ToolButton10: TToolButton;
    tsGabaritos: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton6: TToolButton;
    tbIncluirGabarito: TToolButton;
    tbExcluirGabarito: TToolButton;
    ToolButton12: TToolButton;
    grdGabaritos: TDBGrid;
    tsTurmas: TTabSheet;
    grdTurmas: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    tbIncluirTurma: TToolButton;
    ToolButton7: TToolButton;
    tbExcluirTurma: TToolButton;
    ToolButton9: TToolButton;
    btnImprimirTurma: TToolButton;
    ToolButton13: TToolButton;
    Bevel1: TBevel;
    DBCheckBox1: TDBCheckBox;
    qyProvassn_permitir_maior: TSmallintField;
    ToolButton16: TToolButton;
    tqu: TDBGrid;
    qyProvascd_proxima_prova: TIntegerField;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    qyDiarioProvas: TUMZQuery;
    srcDiarioProvas: TDataSource;
    tsProvas: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton17: TToolButton;
    tbIncluirProva: TToolButton;
    tbExcluirProva: TToolButton;
    ToolButton20: TToolButton;
    cdsSituacao: TClientDataSet;
    dsSituacao: TDataSource;
    cdsSituacaocodigo: TIntegerField;
    cdsSituacaodescricao: TStringField;
    clbProvasDiario: TCheckListBox;
    Panel7: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    tbExcluirTodasProvas: TToolButton;
    rgTipoProva: TRadioGroup;
    qyProvassn_tipo_prova: TSmallintField;
    qyProvassn_nota_compartilhada: TIntegerField;
    DBCheckBox2: TDBCheckBox;
    UMAjuda1: TUMAjuda;
    dbedQtdPartesGabarito: TDBEdit;
    qyProvasnr_qtd_partes_gabarito: TIntegerField;
    UpDown4: TUpDown;
    Label11: TLabel;
    DBCheckBox3: TDBCheckBox;
    qyProvassn_simulado: TIntegerField;
    sqlProcessorDeleteTurma: TZSQLProcessor;
    sqlProcessorDeleteProva: TZSQLProcessor;
    sqlProcessorDeleteGabaritos: TZSQLProcessor;
    sqlProcessorDeleteGabarito: TZSQLProcessor;
    procedure UpDown4MouseLeave(Sender: TObject);
    procedure UpDown4MouseEnter(Sender: TObject);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure dbDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure tbExcluirGabaritoClick(Sender: TObject);
    procedure tbIncluirGabaritoClick(Sender: TObject);
    procedure grdTurmasDblClick(Sender: TObject);
    procedure tbExcluirTodasProvasClick(Sender: TObject);
    procedure clbProvasDiarioClickCheck(Sender: TObject);
    procedure clbProvasDiarioDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure clbProvasDiarioDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tbExcluirProvaClick(Sender: TObject);
    procedure tbIncluirProvaClick(Sender: TObject);
    procedure pgDisciplinasChange(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure tbImportarGabaritoDeArquivoClick(Sender: TObject);
    procedure cbAnoSemextreClick(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure qyProvasAfterEdit(DataSet: TDataSet);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure ToolButton7Click(Sender: TObject);
    procedure pgDisciplinasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbCopiarProvaClick(Sender: TObject);
    procedure btnImprimirTurmaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure grdGabaritosDblClick(Sender: TObject);
    procedure tbExcluirTurmaClick(Sender: TObject);
    procedure tbIncluirTurmaClick(Sender: TObject);
    procedure srcProvasDataChange(Sender: TObject; Field: TField);
    procedure tbIncluirDisciplinaClick(Sender: TObject);
    procedure tbExcluirDisciplinaClick(Sender: TObject);
    procedure qyDisciplinasNewRecord(DataSet: TDataSet);
    procedure qyProvasNewRecord(DataSet: TDataSet);
    procedure tquTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnEcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure srcProvasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  strict private
      provaAtual : TProva;

      procedure ExcluirProvaDisciplinas(const cd_prova_disciplina: Integer);
  private
    { Private declarations }
    sCampo : string;
    sOrdem : string;
    procedure CopiaProva(iAnoSemestre : Integer);
    procedure carregarArquivoImportacao();
    procedure importarArquivo(sNomeArquivo: String);
    procedure atualizaProvas();
    procedure incluirDisciplina(cd_prova: Integer);

    Procedure FiltraProva();
  public
   { Public declarations }
    procedure ExcluirProvaGabarito(const cd_prova_gabarito: Integer);   
  end;

var
  frmCadProvas: TfrmCadProvas;

implementation

uses Main, uDM, uCadProvasDisciplinas, uCadProvasTurmas, uCadProvasGabaritos,
  uCadProvasAlunos, uCadProvasCadAlunos, uFuncoesGerais,
  uImportarLayouts, uTableFields, uSelAnoSemestres, uGeneral;

{$R *.dfm}

procedure TfrmCadProvas.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   Self.Caption := pnTitulo.Caption;

   txtAnoSemestre.Text := IntToStr(ano_semestre);

   sOrdem := ' DESC ';
   sCampo := ' cd_prova ';

   FiltraProva();

   pgDisciplinas.ActivePageIndex := 0;

   cdsSituacao.Active := false;
   cdsSituacao.CreateDataSet;
   cdsSituacao.Append;
   cdsSituacao.FieldByName('codigo').AsInteger := 0;
   cdsSituacao.FieldByName('descricao').AsString := 'Não';
   cdsSituacao.Post;
   cdsSituacao.Append;
   cdsSituacao.FieldByName('codigo').AsInteger := 1;
   cdsSituacao.FieldByName('descricao').AsString := 'Sim';
   cdsSituacao.Post;
   cdsSituacao.Active := true;

   //tbImportarGabaritoDeArquivo.Enabled := DM.variavel_parametro('lg_programa_leitora') = '';
end;

procedure TfrmCadProvas.FiltraProva;
begin

   qyProvas.Close();

   qyProvas.SQL.Clear();
   qyProvas.SQL.Add('SELECT * FROM leitora_provas ');

   if cbAnoSemextre.Checked then begin
   
       qyProvas.SQL.Add('WHERE nr_anosemestre = ' + txtAnoSemestre.Text );

   end;
   qyProvas.SQL.Add('ORDER BY '+sCampo+' '+sOrdem+' ');

   qyProvas.Open();

end;

procedure TfrmCadProvas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadProvas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F9 : btnEcluirClick( nil );
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCadProvas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProvas.btnEcluirClick(Sender: TObject);
const
   SMsgConfirmaExclusao = 'Deseja realmente efetuar a exclusão da prova, incluindo seus gabaritos, turmas e disciplinas?';
   SSQLProvasAlunos =
      'SELECT ' +
         'A.`CD_PROVA_ALUNO`,' +
         'A.`CD_PESSOA`,' +
         'A.`CD_PROVA_GABARITO`,' +
         'A.`NR_ACERTOS`,' +
         'A.`CD_TURMA`,' +
         'A.`NR_ANOSEMESTRE` ' +
      'FROM ' +
         '`LEITORA_PROVAS_ALUNOS` A ' +
      'WHERE ' +
         'EXISTS ( ' +
            'SELECT ' +
               'G.`CD_PROVA` ' +
            'FROM ' +
               '`LEITORA_PROVAS_GABARITOS` G ' +
            'WHERE ' +
               'A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND ' +
               'G.`CD_PROVA` = ?)';

   function GetChave: AnsiString;
   var
      JSON: TlkJSONobject;
   begin
      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('formulario', Name);
         JSON.Add('botao', btnExcluir.Name);

         Result := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;
   end;

var
   UserChoice, ProvaID: Integer;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   JSON: TlkJSONobject;
   S: AnsiString;
begin
   // Verifica se o usuário possui permissão para realizar esta operação

   if DM.GetUsuarioLogado.TemPermissao(7001, npExcluir, True) then
   begin

      // Solicita confirmação do usuário para efetuar a exclusão

      UserChoice := MessageDlg(SMsgConfirmaExclusao, mtConfirmation, [mbYes, mbNo], -1);

      if UserChoice = ID_YES then
      begin

         qyProvas.DisableControls;
         ProvaID := qyProvascd_prova.AsInteger;

         // Recupera todos os registros de provas de alunos
         // vinculados à prova que será excluída

         Stmt := DM.db.DbcConnection.PrepareStatement(SSQLProvasAlunos);
         try
            Stmt.SetInt(1, ProvaID);
            Rs := Stmt.ExecuteQueryPrepared;
            try

               // Transforma os registros encontrados em objeto JSON

               JSON := TlkJSONobject.Create(False);
               try
                  JSON.Add('registros', DM.DataSetToJSON(Rs));

                  S := UTF8Decode(TlkJSON.GenerateText(JSON));

                  // Registro log da exclusão

                  DM.Log(7001, GetChave, S, tlExclusao);

               finally
                  FreeAndNil(JSON);
               end;
            finally
               Rs.Close;
            end;
         finally
            Stmt.Close;
         end;

         // Executa a exclusão da prova e todos os seus registros vinculados

         sqlProcessorDeleteProva.ParamByName('CD_PROVA').AsInteger := ProvaID;
         sqlProcessorDeleteProva.Execute;

         qyProvas.Refresh;
         qyProvas.EnableControls;
      end;

   end;
end;

procedure TfrmCadProvas.btnFecharClick(Sender: TObject);
begin
   FiltraProva();
   Close;
end;

procedure TfrmCadProvas.btnInserirClick(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npIncluir, True ) then Exit;

   pgDisciplinas.ActivePage := tsDisciplinas;
   dbNumero.SetFocus;
   qyProvas.Insert;
end;

procedure TfrmCadProvas.atualizaProvas;
var
   aux : String;
   oItem : TItem;
   i : Integer;
begin
   clbProvasDiario.Clear;

   if ( qyTurmas.RecordCount > 0 ) and
      ( qyDisciplinas.RecordCount > 0 ) then
   begin
      with qyDiarioProvas do
      begin
         Close;
         SQL.Clear;

         SQL.Add( 'SELECT dp.*, t.descricao AS dsTurma, d.descricao AS dsDisciplina ' );
         SQL.Add( 'FROM	diario_provas AS dp ' );
         SQL.Add( 'INNER JOIN turmas AS t ON (t.codigo = dp.turma AND t.anosemestre = dp.anosemestre) ' );
	      SQL.Add( 'INNER JOIN disciplinas AS d ON (d.codigo = dp.disciplina AND d.curso = t.curso) ' );
         SQL.Add( 'WHERE dp.anosemestre = :ANOSEMESTRE AND ' );

         aux := '';
         qyTurmas.First;
         while not qyTurmas.Eof do
         begin
            if ( aux = '' ) then
               aux := '''' + qyTurmascd_turma.AsString + ''''
            else
               aux := aux + ', ''' + qyTurmascd_turma.AsString + '''';
            qyTurmas.Next;
         end;
         SQL.Add( 'dp.turma IN ( ' + aux + ' ) AND ' );

         aux := '';
         qyDisciplinas.First;
         while not qyDisciplinas.Eof do
         begin
            if ( aux = '' ) then
               aux := qyDisciplinascd_disciplina.AsString
            else
               aux := aux + ', ' + qyDisciplinascd_disciplina.AsString;
            qyDisciplinas.Next;
         end;
         SQL.Add( 'dp.disciplina IN ( ' + aux + ' ) AND ' );

         SQL.Add( 'dp.cd_prova_leitora = :PROVA_LEITORA ' );
         SQL.Add( 'ORDER BY dp.bimestre, t.descricao, d.descricao ' );

         ParamByName( 'ANOSEMESTRE' ).AsInteger := qyProvasnr_anosemestre.AsInteger;
         ParamByName( 'PROVA_LEITORA' ).AsInteger := qyProvascd_prova.AsInteger;

         qyDiarioProvas.Open;

         First;
         if not IsEmpty then begin

            while not Eof do begin
               oItem := TItem.Create();
               oItem.setNome(Trim(FieldByName('assunto').AsString));
               oItem.setValor(FieldByName('cd_prova').AsString);

               aux := trim(oItem.getNome());
               while Length(aux) < 50 do aux := aux + ' ';

               aux := aux + ' -  Turma: ' + FieldByName('dsTurma').AsString + ', Disciplina: ' + FieldByName('dsDisciplina').AsString;

               clbProvasDiario.AddItem(aux, oItem);
               i := clbProvasDiario.Items.Count-1;

               if ( (FieldByName('sn_discursiva_leitora').IsNull) or (FieldByName('sn_discursiva_leitora').AsInteger = 0) ) then
                  clbProvasDiario.Checked[i] := False
               else
                  clbProvasDiario.Checked[i] := True;

               Next();
            end;
         end;
      end;
   end
   else
   begin
      TGeneral.Mensagem('É necessário informar pelomenos uma Turma e Uma disciplina para utilizar está funcionalidade.', Application.Title, MB_OK + MB_ICONINFORMATION );
      if( qyDisciplinas.RecordCount > 0 )then
         pgDisciplinas.ActivePage := tsTurmas
      else
         pgDisciplinas.ActivePage := tsDisciplinas;
   end;

end;

procedure TfrmCadProvas.btnAlterarClick(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npAlterar, True ) then Exit;

   dbNumero.SetFocus;
   qyProvas.Edit;
end;

procedure TfrmCadProvas.btnSalvarClick(Sender: TObject);
var lugar : Pointer;
begin
   lugar := qyProvas.GetBookmark;
   if rgTipoProva.ItemIndex = -1  then
   begin
    TGeneral.Mensagem('Não foi selecionado nenhum tipo para a prova.', Application.Title, MB_OK + MB_ICONERROR);
    exit;
   end;
   qyProvassn_tipo_prova.AsInteger := rgTipoProva.ItemIndex;
   qyProvas.Post;

   FiltraProva();


   
   
   qyProvas.GotoBookmark(lugar);
end;

procedure TfrmCadProvas.btnCancelarClick(Sender: TObject);
begin
   qyProvas.Cancel;
end;

procedure TfrmCadProvas.srcProvasStateChange(Sender: TObject);
var
   estado : boolean;
begin
   estado := (qyProvas.State in [dsInsert, dsEdit]);
   btnInserir.Enabled := not estado;
   btnAlterar.Enabled := not estado;
   btnExcluir.Enabled := not estado;
   tbCopiarProva.Enabled := not estado;

   btnSalvar.Enabled := estado;
   btnCancelar.Enabled := estado;

   btnFechar.Enabled := not estado;
   btnImprimir.Enabled := not estado;
end;

procedure TfrmCadProvas.TabControl1Change(Sender: TObject);
begin
  FiltraProva
end;

procedure TfrmCadProvas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyProvas, pmQtd);
end;

procedure TfrmCadProvas.tquTitleClick(Column: TColumn);
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

   FiltraProva();
end;

procedure TfrmCadProvas.qyProvasNewRecord(DataSet: TDataSet);
begin
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('select max(cd_prova) ultimo from leitora_provas');
   DM.qyAux.Open;

   qyProvas.FieldByName('cd_prova').AsInteger := DM.qyAux.FieldByName('ultimo').AsInteger + 1;
   qyProvas.FieldByName('nr_anosemestre').AsInteger := ano_semestre;
   qyProvas.FieldByName('nr_correcoes').AsInteger := 1;
   qyProvas.FieldByName('nr_qtd_partes_gabarito').AsInteger := 1;

   DM.qyAux.Close;
end;

procedure TfrmCadProvas.qyDisciplinasNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
end;

procedure TfrmCadProvas.tbExcluirDisciplinaClick(Sender: TObject);
const
   MSG_EXCLUSAO_DISCIPLINA =
      'ATENÇÃO! A disciplina %s já possui questões vinculadas em algum gabarito desta Prova.'+#13#13+'Deseja realmente excluir a disciplina e as questões criadas?';
var
   iNumero : integer;
   qyCheckDisciplinaUso : TUMZReadOnlyQuery;
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npEspecial, True ) then Exit;

   with grdDisciplinas.SelectedRows do begin

      if Count < 1 then begin
         TGeneral.Mensagem( 'Selecione pelo menos uma disciplina.', Application.Title, MB_OK + MB_ICONINFORMATION );
         Abort();
      end;

      if TGeneral.Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then begin
         Abort();
      end;

      DM.CriarConsulta(qyCheckDisciplinaUso);
      qyCheckDisciplinaUso.SQL.Text := 'SELECT COUNT(*) AS qtd FROM leitora_provas_gabaritos_resp WHERE cd_prova_disciplina = :cd_prova_disciplina ';


      for iNumero:= 0 to Count - 1 do
      begin
         grdDisciplinas.DataSource.DataSet.GotoBookmark(Pointer(Items[iNumero]));

         qyCheckDisciplinaUso.Close;
         qyCheckDisciplinaUso.ParamByName('cd_prova_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_prova_disciplina').AsInteger;
         qyCheckDisciplinaUso.Open;

         // Permite exclusão se não tiver registros vinculados
         if ( qyCheckDisciplinaUso.FieldByName('qtd').AsInteger = 0 ) OR
            // Ou se o usuário concordar em que estes registros sejam excluídos
            ( TGeneral.Mensagem(Format( MSG_EXCLUSAO_DISCIPLINA,
                               [qyDisciplinas.FieldByName('descricao').AsString]
                       ), '', MB_YESNO + MB_ICONEXCLAMATION, Handle) = mrYes ) then
         begin
            ExcluirProvaDisciplinas(qyDisciplinas.FieldByName('cd_prova_disciplina').AsInteger);
         end;
      end;

      FreeAndNil(qyCheckDisciplinaUso);

   end;

   qyDisciplinas.Close();
   qyDisciplinas.Open();

end;

procedure TfrmCadProvas.tbExcluirGabaritoClick(Sender: TObject);
const
   SMsgSemGabarito = 'É necessário selecionar ao menos um gabarito para realizar a exclusão.';
   SMsgConfirmaExclusao = 'Deseja realmente efetuar a exclusão dos gabaritos selecionados?';
   SSQLProvasAlunos = 'SELECT `CD_PROVA_ALUNO`, `CD_PESSOA`, `CD_PROVA_GABARITO`, `NR_ACERTOS`, `CD_TURMA`, `NR_ANOSEMESTRE` FROM `LEITORA_PROVAS_ALUNOS` WHERE `CD_PROVA_GABARITO` IN (%s)';

   function GetChave: AnsiString;
   var
      JSON: TlkJSONobject;
   begin
      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('formulario', Name);
         JSON.Add('aba', tsGabaritos.Name);
         JSON.Add('botao', tbExcluirGabarito.Name);

         Result := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;
   end;

var
   iNumero : integer;
   Grid: TDBGrid;
   DataSet: TDataSet;
   I, UserChoice: Integer;
   Filters: TStrings;
   Stmt: IZStatement;
   Rs: IZResultSet;
   SQL, S: AnsiString;
   JSON: TlkJSONobject;
begin
   // Verifica se o usuário possui permissão para executar a ação

   if DM.GetUsuarioLogado.TemPermissao(7001, npEspecial, True) then
   begin

      Grid := grdGabaritos;

      // Verifica se o usuário selecionou gabaritos para exclusão

      if Grid.SelectedRows.Count < 1 then
         MessageDlg(SMsgSemGabarito, mtInformation, [mbOK], -1);

      if Grid.SelectedRows.Count > 0 then
      begin

         // Solicita confirmação do usuário para realizar a operação
         UserChoice := MessageDlg(SMsgConfirmaExclusao, mtConfirmation, [mbYes, mbNo], -1);

         if UserChoice = ID_YES then
         begin

            Filters := TStringList.Create;
            try

               Filters.StrictDelimiter := True;
               Filters.Delimiter := ',';

               DataSet := Grid.DataSource.DataSet;
               DataSet.DisableControls;

               // Monta uma lista com os identificadores
               // dos gabaritos selecionados

               for I := 0 to Grid.SelectedRows.Count - 1 do
               begin
                  DataSet.GotoBookmark(Pointer(Grid.SelectedRows.Items[I]));
                  Filters.Add(DataSet.FieldByName('cd_prova_gabarito').AsString);
               end;

               // Recupera todas as provas de alunos vinculadas
               // com os gabaritos selecionados para exclusão

               SQL := Format(SSQLProvasAlunos, [Filters.DelimitedText]);

               Stmt := DM.db.DbcConnection.CreateStatement;
               try
                  Rs := Stmt.ExecuteQuery(SQL);
                  try
                     JSON := TlkJSONobject.Create(False);
                     try
                        // Transforma os registros encontrados no formato JSON

                        JSON.Add('registros', DM.DataSetToJSON(Rs));

                        S := UTF8Decode(TlkJSON.GenerateText(JSON));

                        // Registra log de exclusão

                        DM.Log(7001, GetChave, S, tlExclusao);
                     finally
                        FreeAndNil(JSON);
                     end;
                  finally
                     Rs.Close;
                  end;
               finally
                  Stmt.Close;
               end;

               // Realiza a exclusão dos gabaritos e registros relacionados

               S := sqlProcessorDeleteGabaritos.Script.Text;
               SQL := Format(S, [Filters.DelimitedText, Filters.DelimitedText,
                  Filters.DelimitedText, Filters.DelimitedText,
                  Filters.DelimitedText, Filters.DelimitedText]);

               sqlProcessorDeleteGabaritos.Script.Text := SQL;
               sqlProcessorDeleteGabaritos.Execute;
               sqlProcessorDeleteGabaritos.Script.Text := S;

               DataSet.Refresh;
               DataSet.EnableControls;

            finally
               FreeAndNil(Filters);
            end;         
         end;
      end;
   end;
end;

procedure TfrmCadProvas.tbImportarGabaritoDeArquivoClick(Sender: TObject);
begin
   carregarArquivoImportacao();
end;

procedure TfrmCadProvas.tbIncluirDisciplinaClick(Sender: TObject);
var lugar : Pointer;
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npEspecial, True ) then Exit;

   if (qyProvas.State in [dsInsert,dsEdit]) then
   begin
      lugar := qyProvas.GetBookmark;

      qyProvas.Post;
      FiltraProva();

      qyProvas.GotoBookmark(lugar);
   end;

   incluirDisciplina(qyProvas.FieldByName('cd_prova').AsInteger);
end;

procedure TfrmCadProvas.tbIncluirGabaritoClick(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npEspecial, True ) then Exit;

   with frmCadProvasGabaritos do
   begin
      LoadNumeroPartes(StrToInt(dbedQtdPartesGabarito.Text));
      cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
      cd_prova_gabarito := qyGabaritos.FieldByName('cd_prova_gabarito').AsInteger;
      qyGabarito.Close();
      qyGabarito.ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
      qyGabarito.Open();
      qyGabarito.Insert();
      ShowModal();
   end;
   qyGabaritos.Close();
   qyGabaritos.Open();
end;

procedure TfrmCadProvas.srcProvasDataChange(Sender: TObject; Field: TField);
begin
   qyDisciplinas.Close();
   qyDisciplinas.Open();

   qyGabaritos.Close();
   qyGabaritos.Open();

   qyTurmas.Close();
   qyTurmas.Open();

   rgTipoProva.ItemIndex := qyProvassn_tipo_prova.AsInteger;

   if ( pgDisciplinas.ActivePage = tsProvas ) then
      atualizaProvas();

   try
      provaAtual := TProva.Create(qyProvascd_prova.AsInteger);
   except
   end;
end;

procedure TfrmCadProvas.tbIncluirTurmaClick(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npEspecial, True ) then Exit;

   if (qyDisciplinas.RecordCount <= 0) OR (qyGabaritos.RecordCount <= 0) then begin
      TGeneral.Mensagem( 'Você precisa ter pelo menos uma disciplina e um gabarito definidos para escolher a(s) turma(s).', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;

   frmCadProvasTurmas.cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
   frmCadProvasTurmas.ShowModal();
   if frmCadProvasTurmas.flgSearch then begin
      qyTurmas.Close();
      qyTurmas.Open();
   end;
end;

procedure TfrmCadProvas.tbExcluirTodasProvasClick(Sender: TObject);
var
   sql : String;
   i : Integer;
begin
   if ( TGeneral.Mensagem( 'Deseja desvincular todas as provas do Diário?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = mrNo ) then
      exit;

   for i := 0 to clbProvasDiario.Items.Count - 1 do
   begin
      sql := 'UPDATE diario_provas SET cd_prova_leitora = NULL, sn_discursiva_leitora = NULL WHERE cd_prova = :PROVA ';

      DM.qyAux.Close;
      DM.qyAux.SQL.Text := sql;

      DM.qyAux.ParamByName('PROVA').AsInteger := StrToInt( TItem( clbProvasDiario.Items.Objects[i] ).getValor() );

      DM.qyAux.ExecSQL;
   end;

   atualizaProvas();
end;

procedure TfrmCadProvas.tbExcluirTurmaClick(Sender: TObject);
const
   SMsgSemTurma = 'É necessário selecionar ao menos uma turma para realizar a exclusão.';
   SMsgConfirmaExclusao = 'Deseja realmente efetuar a exclusão das turmas selecionadas?';
   SFilterFmt = '%s%s';
   SSQLFilter = '(%d, %s, %d)';
   SSQLProvasAlunos =
      'SELECT ' +
         'A.`CD_PROVA_ALUNO`,' +
         'A.`CD_PESSOA`,' +
         'A.`CD_PROVA_GABARITO`,' +
         'A.`NR_ACERTOS`,' +
         'A.`CD_TURMA`,' +
         'A.`NR_ANOSEMESTRE` ' +
      'FROM ' +
         '`LEITORA_PROVAS_ALUNOS` A ' +
      'WHERE ' +
         'EXISTS ( ' +
            'SELECT ' +
               'G.`CD_PROVA_GABARITO` ' +
            'FROM ' +
               '`LEITORA_PROVAS_GABARITOS` G ' +
            'WHERE ' +
               'A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND ' +
               '(A.`NR_ANOSEMESTRE`, A.`CD_TURMA`, G.`CD_PROVA`) IN (%s))';

   function GetChave: AnsiString;
   var
      JSON: TlkJSONobject;
   begin
      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('formulario', Name);
         JSON.Add('aba', tsTurmas.Name);
         JSON.Add('botao', tbExcluirTurma.Name);

         Result := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;
   end;

var
   iNumero : integer;
   I, AnoSem, ProvaID: Integer;
   UserChoice: Integer;
   S, Chave, Filter, SQL, TurmaID: AnsiString;
   Grid: TDBGrid;
   DataSet: TDataSet;
   Filters: TStrings;
   Stmt: IZStatement;
   Rs: IZResultSet;
   JSON: TlkJSONobject;
begin

   // Verifica se o usuário possui permissão para realizar esta operação

   if DM.GetUsuarioLogado.TemPermissao(7001, npEspecial, True) then
   begin

      Grid := grdTurmas;

      // Verifica se pelo menos um registro de turma foi selecionado

      if Grid.SelectedRows.Count < 1 then
         MessageDlg(SMsgSemTurma, mtInformation, [mbOK], -1);

      if Grid.SelectedRows.Count > 0 then
      begin

         // Solicita confirmação do usuário para realizar a operação

         UserChoice := MessageDlg(SMsgConfirmaExclusao, mtConfirmation, [mbYes, mbNo], -1);

         // Verifica se o usuário confirmou a realização da exclusão da turma

         if UserChoice = ID_YES then
         begin
            Filters := TStringList.Create;
            try

               DataSet := Grid.DataSource.DataSet;
               DataSet.DisableControls;

               // Cria um lista de filtros combinando ano/semestre,
               // código da turma e código da prova
               
               for I := 0 to Grid.SelectedRows.Count - 1 do
               begin
                  DataSet.GotoBookmark(Pointer(Grid.SelectedRows.Items[I]));

                  AnoSem := DataSet.FieldByName('nr_anosemestre').AsInteger;
                  TurmaID := DataSet.FieldByName('cd_turma').AsString;
                  ProvaID := DataSet.FieldByName('cd_prova').AsInteger;

                  S := Format(SSQLFilter, [AnoSem, QuotedStr(TurmaID), ProvaID]);

                  Filters.Add(S);
               end;

               // Processa a lista de filtros para converter em forma SQL

               Filter := EmptyStr;

               for I := 0 to Filters.Count - 1 do
               begin
                  if Filter <> EmptyStr then
                     Filter := Format(SFilterFmt, [Filter, ',']);

                  Filter := Format(SFilterFmt, [Filter, Filters[I]]);
               end;

               // Monta a instrução SQL para obter todos os registros da tabela
               // LEITORA_PROVAS_ALUNOS que serão excluídos

               SQL := Format(SSQLProvasAlunos, [Filter]);

               Stmt := DM.db.DbcConnection.CreateStatement;
               try
                  Rs := Stmt.ExecuteQuery(SQL);
                  try
                     JSON := TlkJSONobject.Create(False);
                     try

                        // Transforma os registros no formato JSON

                        JSON.Add('registros', DM.DataSetToJSON(Rs));
                        S := UTF8Decode(TlkJSON.GenerateText(JSON));

                        // Guarda log de exclusão dos registros
                        DM.Log(7001, GetChave, S, tlExclusao);
                        
                     finally
                        FreeAndNil(JSON);
                     end;
                  finally
                     Rs.Close;
                  end;
               finally
                  Stmt.Close;
               end;

            finally
               FreeAndNil(Filters);
            end;

            // Guarda o SQL original do script de exclusão de turmas
            S := sqlProcessorDeleteTurma.Script.Text;

            // Formata o SQL para exclusão usando os filtros
            SQL := Format(S, [Filter, Filter, Filter, Filter]);

            // Executa o script para realizar a exclusão
            // e retorna para o SQL original
            
            sqlProcessorDeleteTurma.Script.Text := SQL;
            sqlProcessorDeleteTurma.Execute;
            sqlProcessorDeleteTurma.Script.Text := S;

            // Atualiza a lista de turmas

            DataSet.EnableControls;
            DataSet.Refresh;
         end;
      end;

   end;

end;

procedure TfrmCadProvas.grdGabaritosDblClick(Sender: TObject);
begin
   with frmCadProvasGabaritos do
   begin
      LoadNumeroPartes(StrToInt(dbedQtdPartesGabarito.Text));
      cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
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

procedure TfrmCadProvas.grdTurmasDblClick(Sender: TObject);
begin
   with frmCadProvasAlunos do begin
      cd_prova := qyTurmas.FieldByName('cd_prova').AsInteger;
      cd_turma := qyTurmas.FieldByName('cd_turma').AsString;
      nr_anosemestre := qyTurmas.FieldByName('nr_anosemestre').AsInteger;
      ShowModal();
   end;
end;

procedure TfrmCadProvas.importarArquivo(sNomeArquivo: String);
var
   tfArq: TextFile;
   sLinha: String;
//   iPosCodAluno, iTamCodAluno: Integer;
   iPosCodProva, iTamCodProva, iCodProva: Integer;
   iPosInicioQuestoes, iTamQuestao: Integer;
   iEspacoEntreQuestoes, iPosAlternativa, iPosSomatorio: Integer;
   AQueryAux: TUMZQuery;
   iCodProvaGabarito: Integer;
   iQuestao: Integer;
   sSomatorio, sAlternativa: String;
   iAux: Integer;
begin
//   iPosCodAluno         := StrToInt(  DM.variavel_parametro('lg_imp_cod_aluno_pos')             );
//   iTamCodAluno         := StrToInt(  DM.variavel_parametro('lg_imp_cod_aluno_tam')             );
   iPosCodProva         := StrToInt(  DM.variavel_parametro('lg_imp_cod_prova_pos')             );
   iTamCodProva         := StrToInt(  DM.variavel_parametro('lg_imp_cod_prova_tam')             );
   iPosInicioQuestoes   := StrToInt(  DM.variavel_parametro('lg_imp_questoes_inicio')           );
   iTamQuestao          := StrToInt(  DM.variavel_parametro('lg_imp_questoes_tamanho')          );
   iEspacoEntreQuestoes := StrToInt(  DM.variavel_parametro('lg_imp_espaco_entre_questoes')     );
   iPosAlternativa      := StrToInt(  DM.variavel_parametro('lg_imp_questoes_pos_alternativa')  );
   iPosSomatorio        := StrToInt(  DM.variavel_parametro('lg_imp_questoes_pos_somatorio')    );

   AQueryAux := TUMZQuery.Create(Self);
   AQueryAux.Connection := DM.db;

   AssignFile ( tfArq, sNomeArquivo );
   Reset ( tfArq );

   ReadLn ( tfArq, sLinha );
   iAux := 0;
   while (not Eof(tfArq)) OR (iAux = 0) do begin
      iAux := 1;
      iCodProva := StrToInt( Copy(sLinha, iPosCodProva, iTamCodProva) );

      if not qyProvas.Locate('nr_prova', IntToStr(iCodProva), []) then begin
         ReadLn ( tfArq, sLinha );
         Continue;
      end;

      with AQueryAux do begin
         SQL.Text := 'INSERT INTO leitora_provas_gabaritos(cd_prova, ds_nome_gabarito) VALUES (:cd_prova, :ds_nome_gabarito)';
         ParamByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
         ParamByName('ds_nome_gabarito').AsString := 'Gabarito ' + IntToStr(qyGabaritos.RecordCount+1);
         ExecSQL();

         SQL.Text := 'SELECT cd_prova_gabarito FROM leitora_provas_gabaritos WHERE cd_prova = :cd_prova ORDER BY cd_prova_gabarito DESC LIMIT 1';
         ParamByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
         Open();

         if Eof then begin
            ReadLn ( tfArq, sLinha );
            Continue;
         end;

         iCodProvaGabarito := FieldByName('cd_prova_gabarito').AsInteger;

         SQL.Text := 'INSERT INTO leitora_provas_gabaritos_resp(cd_prova_gabarito, nr_alternativas, nr_questao, ds_resposta, cd_prova_disciplina) VALUES (:cd_prova_gabarito, :nr_alternativas, :nr_questao, :ds_resposta, :cd_prova_disciplina)';
         ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
         ParamByName('cd_prova_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_prova_disciplina').AsInteger;
      end;

      sLinha := Trim(Copy(sLinha, iPosInicioQuestoes));
      iQuestao := 0;
      while Trim(sLinha) <> '' do begin
         iQuestao := iQuestao + 1;

         sSomatorio := Trim(Copy(sLinha, iPosSomatorio, 2));
         sAlternativa := Trim(Copy(sLinha, iPosAlternativa, 1));

         AQueryAux.ParamByName('nr_questao').AsInteger := iQuestao;

         if sSomatorio <> '' then begin
            AQueryAux.ParamByName('nr_alternativas').AsString := '';
            AQueryAux.ParamByName('ds_resposta').AsString := sSomatorio;
         end
         else if sAlternativa <> '' then begin
            AQueryAux.ParamByName('nr_alternativas').AsInteger := 5;
            AQueryAux.ParamByName('ds_resposta').AsString := sAlternativa;
         end;
         AQueryAux.ExecSQL();

         sLinha := Copy(sLinha, iTamQuestao+iEspacoEntreQuestoes+1);
      end;

      with AQueryAux do begin
         SQL.Text := 'UPDATE leitora_provas_gabaritos_resp SET vl_peso = 10/'+IntToStr(iQuestao)+' WHERE cd_prova_gabarito = :cd_prova_gabarito';
         ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
         ExecSQL();
      end;

      ReadLn ( tfArq, sLinha );
   end;

   CloseFile ( tfArq );

   qyGabaritos.Close();
   qyGabaritos.Open();
end;

procedure TfrmCadProvas.incluirDisciplina(cd_prova: Integer);
var
   resultado: TResultadoFiltroDisciplina;
   i: Integer;
   separador: String;
begin
   resultado := TfrmSelecionarDisciplina.Filtrar([bfMultiSelect]);

   if not(resultado.filtrado) then Exit;

   with DM.qyAux do
   begin
      SQL.Text := '' +
         'INSERT INTO leitora_provas_disciplinas ( ' +
         '   cd_prova, ' +
         '   cd_curso, ' +
         '   cd_disciplina ' +
         ') VALUES ';
   end;

   for I := 0 to resultado.arrDisciplinas.Count - 1 do
   begin
      with DM.qyAux2 do
      begin
         Close();
         SQL.Text := 'SELECT d.codigo, d.curso, d.descricao FROM leitora_provas_disciplinas pd INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) WHERE pd.cd_prova = :cd_prova AND pd.cd_curso = :cd_curso AND pd.cd_disciplina = :cd_disciplina';
         ParamByName('cd_prova').AsInteger := cd_prova;
         ParamByName('cd_curso').AsString := TStringList(resultado.arrDisciplinas.Items[i]).Values['cd_curso'];
         ParamByName('cd_disciplina').AsInteger := StrToInt(TStringList(resultado.arrDisciplinas.Items[i]).Values['cd_disciplina']);
         Open();
      end;

      if not DM.qyAux2.Eof then
      begin
         Mensagem(
            'A disciplina ' +
            DM.qyAux2.FieldByName('descricao').AsString +
            ' do curso ' +
            DM.qyAux2.FieldByName('curso').AsString +
            ' já está cadastrada.' +
            chr(13) +
            'Portanto não será cadastrada novamente.',
            Application.Title,
            MB_OK + MB_ICONINFORMATION
         );

         continue;
      end;
      
      with DM.qyAux do
      begin
         SQL.Add(
            separador +
            '(' +
            IntToStr(cd_prova) +
            ' , ' +
            QuotedStr(TStringList(resultado.arrDisciplinas.Items[i]).Values['cd_curso']) +
            ' , ' +
            TStringList(resultado.arrDisciplinas.Items[i]).Values['cd_disciplina'] +
            ')'
         );
            
         separador := ' , ';
      end;
   end;

   DM.qyAux.ExecSQL;

   qyDisciplinas.Close();
   qyDisciplinas.Open();
end;

procedure TfrmCadProvas.carregarArquivoImportacao();
var
   odImportar: TOpenDialog;
begin
   if qyDisciplinas.RecordCount <> 1 then begin
      Exit;
   end;
   
   odImportar := TOpenDialog.Create(Self);
   with odImportar do begin
      Filter := 'Arquivo gerado pelo programa da Leitora|*.dat';
      InitialDir := ExtractFilePath(Application.ExeName);
      Title := 'Selecione um arquivo...';
   end;
   
   if odImportar.Execute then begin
      importarArquivo(odImportar.FileName);
   end;

   odImportar.Destroy();
end;

procedure TfrmCadProvas.btnImprimirClick(Sender: TObject);
var
   qtdAlunosProva : Integer;
   lista_partes_selecao : TListInputQueryCheck;
   partesSelecionadas, colaParte : String;
   IParte: Integer;
begin
   qtdAlunosProva := provaAtual.GetQuantidadeAlunos();

   if qtdAlunosProva = 0 then
   begin
      TGeneral.Mensagem( 'Não é possível imprimir, não há alunos cadastrados para esta prova !', Application.Title, MB_OK + MB_ICONERROR );
   end;

   if TGeneral.Mensagem( 'Imprimir os cartões da prova selecionada, contendo ' + IntToStr(qtdAlunosProva) + ' aluno(s) ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      lista_partes_selecao := provaAtual.GetPartesInputQuery();

      partesSelecionadas := '';
      while (lista_partes_selecao.Quantidade[True] = 0) AND
            TGeneral.InputQueryListCheck('Partes da Prova', 'Selecione as partes que deseja imprimir', lista_partes_selecao) do
      begin
         if lista_partes_selecao.Quantidade[True] = 0 then
         begin
            TGeneral.Mensagem('É necessário selecionar pelo menos uma parte para impressão');
         end;

         for IParte := 0 to lista_partes_selecao.GetObjetosSelecionados().Count - 1 do
         begin
            partesSelecionadas := partesSelecionadas + colaParte + IntToStr(TInputQueryCheck(lista_partes_selecao.GetObjetosSelecionados().Items[IParte]).Codigo);
            colaParte := ', ';
         end;
      end;

      if lista_partes_selecao.Quantidade[True] > 0 then
      begin
         PrincipalForm.ImprimeRpt(DM.sRelatoriosGabaritos, -1, '{leitora_provas_gabaritos.cd_prova} = '+qyProvas.FieldByName('cd_prova').AsString + ' AND {leitora_provas_alunos_cartoes.nr_parte} IN [' + partesSelecionadas + ']', '', nil, nil, nil, True);
      end;
   end;
end;

procedure TfrmCadProvas.btnImprimirTurmaClick(Sender: TObject);
var
   qtdAlunosProva, IParte : Integer;
   lista_partes_selecao : TListInputQueryCheck;
   partesSelecionadas, colaParte : String;
begin
   qtdAlunosProva := provaAtual.GetQuantidadeAlunos(
      qyTurmas.FieldByName('cd_turma').AsString,
      qyTurmas.FieldByName('nr_anosemestre').AsInteger
   );

   if qtdAlunosProva = 0 then
   begin
      TGeneral.Mensagem(
         'Não é possível imprimir, não há alunos cadastrados para esta prova na turma ' +
            qyTurmas.FieldByName('cd_turma').AsString+' !',
         Application.Title, MB_OK + MB_ICONERROR
      );
   end;

   if TGeneral.Mensagem(
         'Imprimir os cartões da prova selecionada, contendo ' +
            IntToStr(qtdAlunosProva) + ' aluno(s) da turma ' +
            qyTurmas.FieldByName('cd_turma').AsString + ' ?',
         Application.Title, MB_YESNO + MB_ICONQUESTION
      ) = ID_YES then
   begin
      lista_partes_selecao := TListInputQueryCheck.Create();

      for IParte := 1 to provaAtual.QuantidadePartesGabarito do
      begin
         lista_partes_selecao.Add(TInputQueryCheck.Create( IParte, 'Parte ' + IntToStr(IParte) ));
      end;

      partesSelecionadas := '';
      while (lista_partes_selecao.Quantidade[True] = 0) AND
            TGeneral.InputQueryListCheck('Partes da Prova', 'Selecione as partes que deseja imprimir', lista_partes_selecao) do
      begin
         if lista_partes_selecao.Quantidade[True] = 0 then
         begin
            TGeneral.Mensagem('É necessário selecionar pelo menos uma parte para impressão');
         end;

         for IParte := 0 to lista_partes_selecao.GetObjetosSelecionados().Count - 1 do
         begin
            partesSelecionadas := partesSelecionadas + colaParte + IntToStr(TInputQueryCheck(lista_partes_selecao.GetObjetosSelecionados().Items[IParte]).Codigo);
            colaParte := ', ';
         end;
      end;

      if lista_partes_selecao.Quantidade[True] > 0 then
      begin
         PrincipalForm.ImprimeRpt(DM.sRelatoriosGabaritos, -1, '{leitora_provas_gabaritos.cd_prova} = '+qyTurmas.FieldByName('cd_prova').AsString+' AND {leitora_provas_alunos.cd_turma} = "'+qyTurmas.FieldByName('cd_turma').AsString+'" AND {leitora_provas_alunos.nr_anosemestre} = '+qyTurmas.FieldByName('nr_anosemestre').AsString + ' AND {leitora_provas_alunos_cartoes.nr_parte} IN [' + partesSelecionadas + ']', '', nil, nil, nil, True);
      end;
   end;
end;

procedure TfrmCadProvas.tbCopiarProvaClick(Sender: TObject);
begin
   if not DM.GetUsuarioLogado.TemPermissao( 7001, npIncluir, True ) then Exit;

   if not PrincipalForm.ProcuraForm(frmSelAnoSemestres) then
   begin
      Application.CreateForm(TfrmSelAnoSemestres, frmSelAnoSemestres);
   end;
   
   frmSelAnoSemestres.ShowModal();

   CopiaProva(frmSelAnoSemestres.iAnoSemestre);
end;

//efetua cópia de provas, disciplinas da prova, gabaritos e respostas do gabarito
procedure TfrmCadProvas.CopiaProva(iAnoSemestre : Integer);
var
   iCodProvaAntiga, iCodProva, iCodProvaGabarito: integer;

   //copia a prova selecionada
   procedure copiaProva(iAnoSemestreNovo : Integer);
   begin
      //guarda o código da prova selecionada
      iCodProvaAntiga := qyProvas.FieldByName('cd_prova').AsInteger;
      //pega o maior código de prova na tabela leitora_provas e incrementa 1
      DM.qyAux2.Close;
      DM.qyAux2.SQL.Text := 'SELECT MAX(CD_PROVA) AS CD_PROVA FROM LEITORA_PROVAS';
      DM.qyAux2.Open;
      if DM.qyAux2.IsEmpty then
         iCodProva := 1
      else
         iCodProva := DM.qyAux2.FieldByName('CD_PROVA').AsInteger+1;
      //insere a nova prova na base de dados
      DM.qyAux.Close;
      DM.qyAux.SQL.Text :=
         'INSERT INTO LEITORA_PROVAS(cd_prova, nr_prova, ds_prova, nr_correcoes, nr_anosemestre, cd_chave)'+
         ' VALUES(:cd_prova, :nr_prova, :ds_prova, :nr_correcoes, :nr_anosemestre, :cd_chave)';
      DM.qyAux.ParamByName('cd_prova').AsInteger := iCodProva;
      DM.qyAux.ParamByName('nr_prova').AsInteger := qyProvas.FieldByName('nr_prova').AsInteger;
      DM.qyAux.ParamByName('ds_prova').AsString := qyProvas.FieldByName('ds_prova').AsString+' (Cópia)';
      DM.qyAux.ParamByName('nr_correcoes').AsInteger := qyProvas.FieldByName('nr_correcoes').AsInteger;
      DM.qyAux.ParamByName('nr_anosemestre').AsInteger := iAnoSemestreNovo;
      DM.qyAux.ParamByName('cd_chave').AsInteger := 0;
      DM.qyAux.ExecSQL;
   end;
   
   //copia as disciplinas da antiga prova
   procedure copiaProvaDisciplina;
   begin
      //carrega todas as disciplinas da prova antiga
      DM.qyAux.Close;
      DM.qyAux.SQL.Text := 'SELECT * FROM LEITORA_PROVAS_DISCIPLINAS WHERE CD_PROVA = :cd_prova';
      DM.qyAux.ParamByName('cd_prova').AsInteger := iCodProvaAntiga;
      //faz a inserção das disciplinas para a nova prova
      DM.qyAux2.Close;
      DM.qyAux2.SQL.Text := 'INSERT INTO LEITORA_PROVAS_DISCIPLINAS (cd_prova_disciplina, cd_prova, cd_curso, cd_disciplina) VALUES(NULL, :cd_prova, :cd_curso, :cd_disciplina)';
      DM.qyAux.Open;
      //enquanto houver disciplinas na prova antiga ...
      while not DM.qyAux.Eof do begin
         DM.qyAux2.ParamByName('cd_prova').AsInteger := iCodProva;
         DM.qyAux2.ParamByName('cd_curso').AsString := DM.qyAux.FieldByName('cd_curso').AsString;
         DM.qyAux2.ParamByName('cd_disciplina').AsInteger := DM.qyAux.FieldByName('cd_disciplina').AsInteger;
         //insere na tabela leitora_provas_disciplinas para a prova nova
         DM.qyAux2.ExecSQL;
         DM.qyAux.Next;
      end;
   end;
   
   //copia as respostas dos gabaritos da antiga prova
   procedure copiaProvaGabaritosRespostas(iCodProvaGabAntiga: integer);
   begin
      //carrega todas as respostas do gabarito antigo
      DM.qyAux4.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabAntiga;
      DM.qyAux4.Open;
      //enquanto houve respostas no gabarito antigo ...
      while not DM.qyAux4.Eof do begin
         DM.qyAux3.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
         DM.qyAux3.ParamByName('nr_alternativas').AsInteger := DM.qyAux4.FieldByName('nr_alternativas').AsInteger;
         DM.qyAux3.ParamByName('nr_questao').AsInteger := DM.qyAux4.FieldByName('nr_questao').AsInteger;
         DM.qyAux3.ParamByName('ds_resposta').AsString := DM.qyAux4.FieldByName('ds_resposta').AsString;
         DM.qyAux3.ParamByName('cd_prova_disciplina').AsInteger := DM.qyAux4.FieldByName('cd_prova_disciplina').AsInteger;
         //copia para o novo gabarito da nova prova
         DM.qyAux3.ExecSQL;
         DM.qyAux4.Next;
      end;
   end;
   //faz a cópia dos gabaritos
   procedure copiaProvaGabarito;
   begin
      //pega o maior código de gabarito e soma 1
      DM.qyAux.Close;
      DM.qyAux.SQL.Text := 'SELECT MAX(CD_PROVA_GABARITO) AS CD_PROVA_GABARITO FROM LEITORA_PROVAS_GABARITOS';
      DM.qyAux.Open;
      if not DM.qyAux.IsEmpty then
         iCodProvaGabarito := DM.qyAux.FieldByName('CD_PROVA_GABARITO').AsInteger+1
      else
         iCodProvaGabarito := 1;
      //pega todos os gabaritos da prova antiga
      DM.qyAux.Close;
      DM.qyAux.SQL.Text := 'SELECT * FROM LEITORA_PROVAS_GABARITOS WHERE CD_PROVA = :cd_prova';
      DM.qyAux.ParamByName('cd_prova').AsInteger := iCodProvaAntiga;
      //faz a inserção dos novos gabaritos para a nova prova
      DM.qyAux2.Close;
      DM.qyAux2.SQL.Text := ' INSERT INTO LEITORA_PROVAS_GABARITOS ( '+
                            '    cd_prova_gabarito, cd_prova, ds_nome_gabarito ' +
                            ' ) VALUES(:cd_prova_gabarito, :cd_prova, :ds_nome_gabarito) ';
      //faz a inserção das respostas para o novo gabarito
      DM.qyAux3.Close;
      DM.qyAux3.SQL.Text := 'INSERT INTO leitora_provas_gabaritos_resp (cd_prova_gabarito_resposta, cd_prova_gabarito, nr_alternativas, nr_questao, ds_resposta, cd_prova_disciplina)'+
                            ' VALUES(NULL, :cd_prova_gabarito, :nr_alternativas, :nr_questao, :ds_resposta, :cd_prova_disciplina)';
      //busca todas as respostas do gabarito antigo
      DM.qyAux4.Close;
      DM.qyAux4.SQL.Text := 'SELECT * FROM leitora_provas_gabaritos_resp WHERE CD_PROVA_GABARITO = :cd_prova_gabarito';
      DM.qyAux.Open;
      //enquanto houver gabaritos na prova antiga ...
      //para cada gabarito da antiga prova copia o próprio gabarito e as respostas desse gabarito
      while not DM.qyAux.Eof do begin
         DM.qyAux2.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
         DM.qyAux2.ParamByName('cd_prova').AsInteger := iCodProva;
         DM.qyAux2.ParamByName('ds_nome_gabarito').AsString := DM.qyAux.FieldByName('ds_nome_gabarito').AsString;
         //copia o gabarito para a nova prova...
         DM.qyAux2.ExecSQL;
         //... e copia também as respostas para cada gabarito
         copiaProvaGabaritosRespostas(DM.qyAux.FieldByName('cd_prova_gabarito').AsInteger);
         //incrementa o código de gabarito para inserir o próximo
         Inc(iCodProvaGabarito);
         DM.qyAux.Next;
      end;
   end;

begin
   //inicializa os componentes
   DM.qyAux.ParamCheck := true;
   DM.qyAux2.ParamCheck := true;
   DM.qyAux3.ParamCheck := true;
   DM.qyAux4.ParamCheck := true;
   copiaProva(iAnoSemestre);
   copiaProvaDisciplina;
   copiaProvaGabarito;
   //fecha todas as querys utilizadas
   DM.qyAux.Close;
   DM.qyAux2.Close;
   DM.qyAux3.Close;
   DM.qyAux4.Close;
   FiltraProva();
end;

procedure TfrmCadProvas.dbDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Pos('OBJETIV',dbDescricao.Text ) > 0) or
      (Pos('MEDI',dbDescricao.Text ) > 0) or
      (Pos('SIMUL',dbDescricao.Text ) > 0) or
      (Pos('SELETIV',dbDescricao.Text ) > 0)then
    rgTipoProva.ItemIndex := 0
  else if (Pos('REDAC',dbDescricao.Text ) > 0) or
          (Pos('DESCRITIV',dbDescricao.Text ) > 0) or
          (Pos('DISCURSIV',dbDescricao.Text ) > 0) then
     rgTipoProva.ItemIndex := 1
  else
    rgTipoProva.ItemIndex := -1;
end;

procedure TfrmCadProvas.ExcluirProvaDisciplinas(
  const cd_prova_disciplina: Integer);
const
   SQL_DELETE_PROVA_ALUNOS_RESP =
      ' DELETE FROM leitora_provas_alunos_resp ' +
      ' WHERE ( cd_prova_aluno, nr_questao ) IN ( ' +
      '    SELECT pad.cd_prova_aluno, pgr.nr_questao ' +
      '    FROM leitora_provas_alunos_dis pad ' +
      '         INNER JOIN leitora_provas_gabaritos_resp pgr ON ( pgr.cd_prova_disciplina = pad.cd_prova_disciplina ) ' +
      '    WHERE pad.cd_prova_disciplina = :cd_prova_disciplina ' +
      ' ) ';
   SQL_DELETE_PROVA_ALUNOS_DISC = 'DELETE FROM leitora_provas_alunos_dis WHERE cd_prova_disciplina = :cd_prova_disciplina';
   SQL_DELETE_PROVA_GABARITO_RESPS = 'DELETE FROM leitora_provas_gabaritos_resp WHERE cd_prova_disciplina = :cd_prova_disciplina';
   SQL_DELETE_PROVA_GABARITO = 'DELETE FROM leitora_provas_disciplinas WHERE cd_prova_disciplina = :cd_prova_disciplina';
var
   qyDelete : TUMZQuery;

   procedure ExecuteSQLDelete(const SQLDelete : String);
   begin
      qyDelete.SQL.Text := SQLDelete;
      qyDelete.ParamByName('cd_prova_disciplina').AsInteger := cd_prova_disciplina;
      qyDelete.ExecSQL();
   end;
begin
   DM.CriarConsulta( qyDelete );

   ExecuteSQLDelete( SQL_DELETE_PROVA_ALUNOS_RESP );
   ExecuteSQLDelete( SQL_DELETE_PROVA_ALUNOS_DISC );
   ExecuteSQLDelete( SQL_DELETE_PROVA_GABARITO_RESPS );
   ExecuteSQLDelete( SQL_DELETE_PROVA_GABARITO );

   FreeAndNil( qyDelete );
end;

procedure TfrmCadProvas.ExcluirProvaGabarito(const cd_prova_gabarito: Integer);
const
   SSQLProvasAlunos = 'SELECT `CD_PROVA_ALUNO`, `CD_PESSOA`, `CD_PROVA_GABARITO`, `NR_ACERTOS`, `CD_TURMA`, `NR_ANOSEMESTRE` FROM `LEITORA_PROVAS_ALUNOS` WHERE `CD_PROVA_GABARITO` = ?';

   function GetChave: AnsiString;
   var
      JSON: TlkJSONobject;
   begin
      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('unidade', 'uCadProvas');
         JSON.Add('metodo', 'ExcluirProvaGabarito');
         JSON.Add('cd_prova_gabarito', cd_prova_gabarito);

         Result := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;
   end;

var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   JSON: TlkJSONobject;
   S: AnsiString;
begin
   Stmt := DM.db.DbcConnection.PrepareStatement(SSQLProvasAlunos);
   try
      Stmt.SetInt(1, cd_prova_gabarito);

      Rs := Stmt.ExecuteQueryPrepared;
      try
         JSON := TlkJSONobject.Create(False);
         try
            JSON.Add('registros', DM.DataSetToJSON(Rs));

            S := UTF8Decode(TlkJSON.GenerateText(JSON));

            DM.Log(7001, GetChave, S, tlExclusao);
         finally
            FreeAndNil(JSON);
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
   end;

   sqlProcessorDeleteGabarito.ParamByName('CD_PROVA_GABARITO').AsInteger := cd_prova_gabarito;
   sqlProcessorDeleteGabarito.Execute;
end;

procedure TfrmCadProvas.pgDisciplinasChange(Sender: TObject);
begin
   if ( pgDisciplinas.ActivePage = tsProvas ) then
   begin
      atualizaProvas();
   end;
end;

procedure TfrmCadProvas.pgDisciplinasChanging(Sender: TObject;
  var AllowChange: Boolean);
var lugar : Pointer;
begin

   if not (qyProvas.State in [dsInsert,dsEdit]) then begin
    exit;
   end;

   lugar := qyProvas.GetBookmark;

   qyProvas.Post;
   FiltraProva();

   qyProvas.GotoBookmark(lugar);

end;

procedure TfrmCadProvas.ToolButton7Click(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 7001, npEspecial, True ) then Exit;

   if (qyDisciplinas.RecordCount <= 0) OR (qyGabaritos.RecordCount <= 0) then begin
      TGeneral.Mensagem( 'Você precisa ter pelo menos uma disciplina e um gabarito definidos para escolher a(s) turma(s).', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;

   frmCadProvasCadAlunos.cd_prova := qyProvas.FieldByName('cd_prova').AsInteger;
   frmCadProvasCadAlunos.ShowModal();
   if frmCadProvasCadAlunos.flgSearch then
   begin
      qyTurmas.Close();
      qyTurmas.Open();
   end;
end;

procedure TfrmCadProvas.ToolButton16Click(Sender: TObject);
var
   odImportar: TOpenDialog;
   sMsg : String;
begin
   // Carregar Layouts
   sMsg := 'Confirmação' + CHR(13) + CHR(13);
   sMsg := sMsg + 'O seguinte layout está configurado para importação:' + CHR(13);
   sMsg := sMsg + FrmImportarLayouts.GetNomeLayoutPadrao() + CHR(13) + CHR(13);
   sMsg := sMsg + 'Deseja selecionar outro Layout? ';

   if TGeneral.Mensagem(sMsg, 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION) = mrYEs then
   begin
      if FrmImportarLayouts.ShowModal() = mrCancel then
      begin
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
      Title := 'Selecione um arquivo de gabarito...';
   end;
   
   if odImportar.Execute then
   begin
      // Carregar Layouts
      qyGabaritos.Close();
      qyGabaritos.Open();

      // Se houverem gabaritos pergunta se deseja remover os existentes ou não
      if qyGabaritos.RecordCount > 0 then
      begin
         sMsg := 'Confirmação' + CHR(13) + CHR(13);
         sMsg := sMsg + 'A prova já possui gabaritos, deseja REMOVER os gabaritos existentes?';

         if TGeneral.Mensagem(sMsg, 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION) = mrYEs then
         begin
            ImportarGabarito(odImportar.FileName, qyProvascd_prova.AsInteger, 0, 0, true);
         end else begin
            ImportarGabarito(odImportar.FileName, qyProvascd_prova.AsInteger, 0, 0, false);
         end;

      end else begin
         ImportarGabarito(odImportar.FileName, qyProvascd_prova.AsInteger, 0, 0, true);
      end;

      qyGabaritos.Close();
      qyGabaritos.Open();
   end;

   odImportar.Destroy();
end;

procedure TfrmCadProvas.tbIncluirProvaClick(Sender: TObject);
var
   arr, arr2, arr3 : TStringList;
begin
   if (frmTableFields = nil) then begin
      Application.CreateForm( TfrmTableFields, frmTableFields );
   end;

   frmTableFields.Left := 525;
   frmTableFields.Tag := 1; // Isso vai indicar que está aberto a janela de Disciplinas

   arr := TStringList.Create;
   qyTurmas.First;
   while not qyTurmas.Eof do
   begin
      arr.Add(qyTurmascd_turma.AsString);
      qyTurmas.Next;
   end;

   arr2 := TStringList.Create;
   qyDisciplinas.First;
   while not qyDisciplinas.Eof do
   begin
      arr2.Add(qyDisciplinascd_disciplina.AsString);
      qyDisciplinas.Next;
   end;

   arr3 := TStringList.Create;
   qyDiarioProvas.First;
   while not qyDiarioProvas.Eof do
   begin
      arr3.Add(qyDiarioProvas.FieldByName('cd_prova').AsString);
      qyDiarioProvas.Next;
   end;                      

   frmTableFields.ConstroiTreeProvas(qyProvasnr_anosemestre.AsInteger, arr, arr2, arr3);
   frmTableFields.Show;
end;

procedure TfrmCadProvas.tbExcluirProvaClick(Sender: TObject);
var
   sql : String;
begin
   if ( clbProvasDiario.ItemIndex = -1 ) then
   begin
      TGeneral.Mensagem( 'É necessário selecionar uma prova.', Application.Title, MB_OK + MB_ICONEXCLAMATION );
      exit;
   end;
   
   if ( TGeneral.Mensagem(
           'Deseja remover a ligação desta Prova do Diário com a Prova da leitora?',
           Application.Title,
           MB_YESNO + MB_ICONQUESTION) = ID_NO ) then
   exit;

   sql := 'UPDATE diario_provas SET cd_prova_leitora = NULL, sn_discursiva_leitora = NULL WHERE cd_prova = :PROVA ';

   DM.qyAux.Close;
   DM.qyAux.SQL.Text := sql;

   DM.qyAux.ParamByName('PROVA').AsInteger := StrToInt( TItem( clbProvasDiario.Items.Objects[clbProvasDiario.ItemIndex] ).getValor() );

   DM.qyAux.ExecSQL;

   atualizaProvas();
end;

procedure TfrmCadProvas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then begin
     if not (qyProvas.State in [dsEdit]) then begin
       qyProvas.Edit();
     end;
     if StrToInt(dbeQtdCorrecoes.Text) < 9 then begin
       qyProvas.FieldByName('nr_correcoes').AsInteger := (StrToInt(dbeQtdCorrecoes.Text)+1);
     end;
  end
  else if Button = btPrev then begin
     if not (qyProvas.State in [dsEdit]) then begin
       qyProvas.Edit();
     end;
     if StrToInt(dbeQtdCorrecoes.Text) > 1 then begin
       qyProvas.FieldByName('nr_correcoes').AsInteger := (StrToInt(dbeQtdCorrecoes.Text)-1);
     end;
  end;

end;

procedure TfrmCadProvas.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
  ano, semestre: integer;
begin

  if Button = btNext then begin
     if not (qyProvas.State in [dsEdit]) then begin
       qyProvas.Edit();
     end;
     ano := StrToInt(Copy(dbeAnoSemestre.Text, 1, 4));
     semestre := StrToInt(Copy(dbeAnoSemestre.Text, 6, 1));

     if semestre = 1 then begin
       dbeAnoSemestre.Text := IntToStr(ano)+'2';
     end
     else begin
       dbeAnoSemestre.Text := IntToStr(ano+1)+'1';
     end;
     qyProvas.FieldByName('nr_anosemestre').AsInteger := StrToInt(dbeAnoSemestre.Text);

  end
  else if Button = btPrev then begin
     if not (qyProvas.State in [dsEdit]) then begin
       qyProvas.Edit();
     end;
     ano := StrToInt(Copy(dbeAnoSemestre.Text, 1, 4));
     semestre := StrToInt(Copy(dbeAnoSemestre.Text, 6, 1));

     if semestre = 1 then begin
       dbeAnoSemestre.Text := IntToStr(ano-1)+'2';
     end
     else begin
       dbeAnoSemestre.Text := IntToStr(ano)+'1';
     end;
     qyProvas.FieldByName('nr_anosemestre').AsInteger := StrToInt(dbeAnoSemestre.Text);
  end;

end;

procedure TfrmCadProvas.qyProvasAfterEdit(DataSet: TDataSet);
begin
   if qyProvas.FieldByName('nr_anosemestre').AsString = '' then begin
     qyProvas.FieldByName('nr_anosemestre').AsInteger := ano_semestre;
   end;
end;

procedure TfrmCadProvas.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
  FiltraProva();
end;

procedure TfrmCadProvas.UpDown4Click(Sender: TObject; Button: TUDBtnType);
var
   valorAtual : Integer;
begin
   if UpDown4.Tag <> 1 then Exit;

   if not (qyProvas.State in [dsEdit]) then
   begin
      qyProvas.Edit();
   end;

   valorAtual := StrToInt(dbedQtdPartesGabarito.Text);

   if (Button = btNext) AND (valorAtual < 9) then
   begin
      Inc(valorAtual);
   end
   else if (Button = btPrev) AND (valorAtual > 1) then
   begin
      Dec(valorAtual);

      if NOT(qyProvas.State IN [dsInsert]) AND NOT(provaAtual.isQuantidadePartesValida(valorAtual)) then
      begin
         TGeneral.Mensagem('Não é possível diminuir a quantidade de partes da prova, pois, existem questões vinculadas a esta parte.', '', MB_OK + MB_ICONWARNING, Handle);
         Exit;
      end;
   end;

   dbedQtdPartesGabarito.Text := IntToStr(valorAtual);
end;

procedure TfrmCadProvas.UpDown4MouseEnter(Sender: TObject);
begin
   UpDown4.Tag := 1;
end;

procedure TfrmCadProvas.UpDown4MouseLeave(Sender: TObject);
begin
   UpDown4.Tag := 0;
end;

procedure TfrmCadProvas.cbAnoSemextreClick(Sender: TObject);
begin
  FiltraProva();

  txtAnoSemestre.Enabled := cbAnoSemextre.Checked;
  UpDown3.Enabled := cbAnoSemextre.Checked;
end;

procedure TfrmCadProvas.clbProvasDiarioClickCheck(Sender: TObject);
begin
   with DM.qyAux do
   begin
      SQL.Text := 'UPDATE diario_provas SET sn_discursiva_leitora = :CHECK WHERE cd_prova = :PROVA ';

      if clbProvasDiario.Checked[clbProvasDiario.ItemIndex] then
         DM.qyAux.ParamByName('CHECK').AsInteger := 1
      else
         DM.qyAux.ParamByName('CHECK').AsInteger := 0;
      DM.qyAux.ParamByName('PROVA').AsInteger := StrToInt( TItem(clbProvasDiario.Items.Objects[clbProvasDiario.ItemIndex]).getValor() );

      ExecSQL();
   end;
end;

procedure TfrmCadProvas.clbProvasDiarioDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  sql, bimestre, turma, disciplina, nota : String;
  arrTurmas, arrDisciplinas, arrProvas: TStringList;
  qyNroProva: TUMZQuery;
begin
   { Quando arrastar da Disciplina para a Grade }
  if Source is TTreeView then
  begin
    case frmTableFields.Tag of
      2 : Begin
            TGeneral.Mensagem( 'Arraste para a grade de Provas.', Application.Title, MB_OK + MB_ICONSTOP );
            Exit;
          End;
    End;

    MyTreeNode := frmTableFields.Tree.Selected;

    sql := 'UPDATE diario_provas AS dp SET cd_prova_leitora = ' + dbCodigo.Text + ', sn_discursiva_leitora = 0 WHERE ';

    bimestre := TItemProvas(MyTreeNode.Data).getBimestre();
    turma := QuotedStr(TItemProvas(MyTreeNode.Data).getTurma());
    disciplina := TItemProvas(MyTreeNode.Data).getDisciplina();
    nota := TItemProvas(MyTreeNode.Data).getNota();

    sql := sql + ' anosemestre = ' + txtAnosemestre.Text;
    sql := sql + ' AND bimestre = ' + bimestre;

    // Verifica se o usuário selecionou um nodo que possui a turma
    if (TItemProvas(MyTreeNode.Data).getTurma() = '') then
    begin
      // Se a turma não foi selecionada, faz de todas as turmas listadas
      arrTurmas := TStringList.Create;
      arrTurmas.Delimiter := ',';
      qyTurmas.First;
      while not qyTurmas.Eof do
      begin
         arrTurmas.Add(QuotedStr(qyTurmascd_turma.AsString));
         qyTurmas.Next;
      end;
      turma := arrTurmas.DelimitedText;
    end;
    sql := sql + ' AND turma IN (' + turma + ')';

    // Verifica se o usuário selecionou um nodo que possui a disciplina
    if ( TItemProvas(MyTreeNode.Data).getDisciplina() = '' ) then
    begin
      // Se a disciplina não foi selecionada, faz de todas as disciplinas listadas
      arrDisciplinas := TStringList.Create;
      arrDisciplinas.Delimiter := ',';
      qyDisciplinas.First;
      while not qyDisciplinas.Eof do
      begin
         arrDisciplinas.Add(qyDisciplinascd_disciplina.AsString);
         qyDisciplinas.Next;
      end;
      disciplina := arrDisciplinas.DelimitedText;
    end;
    sql := sql + ' AND disciplina IN (' + disciplina + ')';

    // Verifica se o usuário selecionou um nodo que possui a prova
    if ( TItemProvas(MyTreeNode.Data).getNota() = '' ) then
    begin
      // Se a prova não foi selecionada, faz de todas as provas listadas
      arrProvas := TStringList.Create;
      DM.CriarConsulta(qyNroProva);
      qyNroProva.SQL.Text := 'SELECT DISTINCT nro_nota FROM diario_provas WHERE ';
      qyNroProva.SQL.Add(' anosemestre = '+IntToStr(ano_semestre)+' AND ');
      qyNroProva.SQL.Add(' turma IN ('+ turma +') AND ');
      qyNroProva.SQL.Add(' disciplina IN ('+ disciplina +') AND ');
      qyNroProva.SQL.Add(' bimestre = '+bimestre);
      qyNroProva.Close;
      qyNroProva.Open;
      qyNroProva.First;
      while not qyNroProva.Eof do
      begin
         arrProvas.Add(qyNroProva.FieldByName('nro_nota').AsString);
         qyNroProva.Next;
      end;
      nota := arrProvas.DelimitedText;
    end;
    sql := sql + ' AND nro_nota IN (' + nota + ')';

    DM.qyAux.SQL.Text := sql;
    DM.qyAux.ExecSQL;

    atualizaProvas();
  end;
end;

procedure TfrmCadProvas.clbProvasDiarioDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;

{ TItem }

constructor TItem.Create;
begin
  inherited;
  ANome := '';
  AValor:= '';
end;

procedure TItem.setValor(sValor: string);
begin
   Self.AValor := sValor;
end;

function TItem.getNome: string;
begin
   Result := SElf.ANome;
end;

function TItem.getValor: string;
begin
   REsult := Self.AValor;
end;

destructor TItem.Destroy;
begin

  inherited;
end;

procedure TItem.setNome(sValor: string);
begin
   Self.ANome := sValor;
end;

{ TItemProvas }

constructor TItemProvas.Create;
begin
   ABimestre := '';
   ATurma := '';
   ADisciplina := '';
   ANota := '';
end;

destructor TItemProvas.Destroy;
begin

  inherited;
end;

function TItemProvas.getBimestre: string;
begin
   Result := Self.ABimestre;
end;

function TItemProvas.getDisciplina: string;
begin
   Result := Self.ADisciplina;
end;

function TItemProvas.getNota: string;
begin
   Result := Self.ANota;
end;

function TItemProvas.getTurma: string;
begin
   Result := Self.ATurma;
end;

procedure TItemProvas.setBimestre(sValor: string);
begin
   Self.ABimestre := sValor;
end;

procedure TItemProvas.setDisciplina(sValor: string);
begin
   Self.ADisciplina := sValor;
end;

procedure TItemProvas.setNota(sValor: string);
begin
   Self.ANota := sValor;
end;

procedure TItemProvas.setTurma(sValor: string);
begin
   Self.ATurma := sValor;
end;

end.
