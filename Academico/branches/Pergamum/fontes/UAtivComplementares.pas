unit UAtivComplementares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBCtrls, Mask, Grids, DBGrids,
  Buttons, ImgList, DB, ZConnection, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, DBTables, ZSqlUpdate, UMComboBox, uItemCombo;

type
  TfrmAtivComplementares = class(TForm)
    pcGeral: TPageControl;
    tsCadAreas: TTabSheet;
    pnTopoAreas: TPanel;
    tsCadGrupos: TTabSheet;
    pnTopoGrupos: TPanel;
    tsCadAtividades: TTabSheet;
    tsCadAtivCurso: TTabSheet;
    pnTopoAtivCurso: TPanel;
    pnTopoAtividades: TPanel;
    pnCadAreaDir: TPanel;
    imgBotoes: TImageList;
    tbBotoesAcao: TToolBar;
    tpSeparador1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    tpSeparador2: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    tpSeparador3: TToolButton;
    btnSair: TToolButton;
    pnCadAreaEsq: TPanel;
    pnCadGruposEsq: TPanel;
    pnCadGruposDir: TPanel;
    pnCadAtivEsq: TPanel;
    pnCadAtivDir: TPanel;
    pnCadAtivCursoEsq: TPanel;
    pnCadAtivCursoDir: TPanel;
    qyAreas: TUMZQuery;
    dsAreas: TDataSource;
    qyGrupos: TUMZQuery;
    dsGrupos: TDataSource;
    qyAtividades: TUMZQuery;
    dsAtividades: TDataSource;
    qyAtivCursos: TUMZQuery;
    dsAtivCursos: TDataSource;
    lbAreaCodigo: TLabel;
    dbAreaCodigo: TDBEdit;
    lbAreaDescricao: TLabel;
    lbAreaHoras: TLabel;
    dbAreaHoras: TDBEdit;
    lbGruposCodigo: TLabel;
    dbGruposCodigo: TDBEdit;
    lbGruposDescricao: TLabel;
    lbAtividadesCodigo: TLabel;
    dbAtividadesCodigo: TDBEdit;
    lbAtividadesGrupo: TLabel;
    lbAtividadesDescricao: TLabel;
    dbAtividadesDescricao: TDBEdit;
    lbAtividadesHoras: TLabel;
    dbAtividadesHoras: TDBEdit;
    lbAtividadesHrCurso: TLabel;
    dbAtividadesHrCurso: TDBEdit;
    lbAtividadesHrAtividade: TLabel;
    dbAtividadesHrAtividade: TDBEdit;
    lbAtivCursoCodigo: TLabel;
    dbAtivCursoCodigo: TDBEdit;
    lbAtivCursoAnoSemestre: TLabel;
    dbAtivCursoAnoSemestre: TDBEdit;
    lbAtivCursoEtapa: TLabel;
    dbAtivCursoEtapa: TDBEdit;
    lbAtivCursoAtividade: TLabel;
    lbAtivCursoGrade: TLabel;
    dbAtivCursoGrade: TDBEdit;
    dbGruposDescricao: TDBMemo;
    dblcbAtividadesGrupo: TDBLookupComboBox;
    dbgrdAtividades: TDBGrid;
    dbgrdAreas: TDBGrid;
    dbgrdGrupos: TDBGrid;
    bvAtivCursoCopia: TBevel;
    btnCopiarCurso: TSpeedButton;
    dbgrdAtivCursos: TDBGrid;
    pnFiltroAnoSemestre: TPanel;
    cbAnoSemestre: TCheckBox;
    txtAnoSemestreCursos: TMaskEdit;
    UpDownCursos: TUpDown;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    updCursos: TZUpdateSQL;
    qyAtivSelecao: TUMZQuery;
    dbAtividade: TDBLookupComboBox;
    btnCodigoCurso: TSpeedButton;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    qyAreascd_ge_area: TLargeintField;
    qyAreasds_ge_area: TStringField;
    qyAreasnr_horas: TFloatField;
    qyGruposcd_ge_grupo: TLargeintField;
    qyGruposcd_ge_area: TLargeintField;
    qyGruposnr_horas: TFloatField;
    qyAtividadescd_ge_atividade: TLargeintField;
    qyAtividadescd_ge_grupo: TLargeintField;
    qyAtividadesds_ge_atividade: TStringField;
    qyAtividadesnr_horas: TFloatField;
    qyAtividadesnr_horas_curso: TFloatField;
    qyAtividadesnr_horas_atividade: TFloatField;
    qyAtivCursoscd_curso: TStringField;
    qyAtivCursosnr_anosem: TSmallintField;
    qyAtivCursosnr_etapa: TIntegerField;
    qyAtivCursoscd_ge_atividade: TLargeintField;
    qyAtivSelecaocd_ge_atividade: TLargeintField;
    qyAtivSelecaods_ge_atividade: TStringField;
    qyAtivCursosnr_horas: TFloatField;
    qyGruposds_ge_grupo: TMemoField;
    qyGruposds_observacao: TStringField;
    qyAtividadesds_observacao: TStringField;
    qyAtividadessn_selecao_online: TSmallintField;
    dbcbSelecaoOnline: TDBCheckBox;
    qyAtivCursosds_atividade: TStringField;
    qyAtivCursoscd_grade: TIntegerField;
    Label3: TLabel;
    dbeCaracteristicas: TDBEdit;
    qyAtividadesds_caracteristica: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qyAtivCursossn_validar_horas_grade: TSmallintField;
    checkvalidaHora: TDBCheckBox;
    cbTabelaSiga: TUMComboBox;
    Label10: TLabel;
    qryTabelaSiga: TUMZQuery;
    qryTabelaSigacd_siga: TLargeintField;
    qryTabelaSigacd_siga_pai: TLargeintField;
    qryTabelaSigacd_tipo: TLargeintField;
    qryTabelaSigacd_local: TLargeintField;
    qryTabelaSigads_codigo_siga: TStringField;
    qryTabelaSigads_assunto: TStringField;
    qryTabelaSigads_fase_corrente: TStringField;
    qryTabelaSigads_fase_intermediaria: TStringField;
    qryTabelaSigads_fase_final: TStringField;
    qryTabelaSigads_destinacao_final: TStringField;
    qryTabelaSigame_observacao: TStringField;
    qryTabelaSigasn_mec: TSmallintField;
    qryTabelaSigadt_cadastro: TDateTimeField;
    dsTabelasiga: TDataSource;
    qryModuloSiga: TUMZQuery;
    qyAtividadescd_siga: TIntegerField;
    procedure dsAtividadesDataChange(Sender: TObject; Field: TField);
    procedure cbTabelaSigaCloseUp(Sender: TObject);
    procedure cbTabelaSigaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTabelaSigaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTabelaSigaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure qyAtividadesCalcFields(DataSet: TDataSet);
    procedure qyGruposCalcFields(DataSet: TDataSet);
    procedure dsAreasDataChange(Sender: TObject; Field: TField);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure qyAtivCursosAfterPost(DataSet: TDataSet);
    procedure dbgrdAtivCursosCellClick(Column: TColumn);
    procedure cbAnoSemestreClick(Sender: TObject);
    procedure txtAnoSemestreCursosKeyPress(Sender: TObject; var Key: Char);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure btnCopiarCursoClick(Sender: TObject);
    procedure qyAtivCursosBeforeDelete(DataSet: TDataSet);
    procedure qyAtividadesBeforeDelete(DataSet: TDataSet);
    procedure qyGruposBeforeDelete(DataSet: TDataSet);
    procedure qyAreasBeforeDelete(DataSet: TDataSet);
    procedure qyAtivCursosBeforeEdit(DataSet: TDataSet);
    procedure qyAtividadesBeforeEdit(DataSet: TDataSet);
    procedure qyGruposBeforeEdit(DataSet: TDataSet);
    procedure qyAreasBeforeEdit(DataSet: TDataSet);
    procedure qyAtivCursosNewRecord(DataSet: TDataSet);
    procedure qyAtividadesNewRecord(DataSet: TDataSet);
    procedure qyGruposNewRecord(DataSet: TDataSet);
    procedure pcGeralChange(Sender: TObject);
    procedure qyAreasNewRecord(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbAtivCursoGradeKeyPress(Sender: TObject; var Key: Char);
    procedure dblcbAtivCursoAtividadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtivCursoEtapaKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtivCursoAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtivCursoCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtividadesHrAtividadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtividadesHrCursoKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtividadesHorasKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtividadesDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dblcbAtividadesGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure dbAtividadesCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure dbGruposCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure dbAreaHorasKeyPress(Sender: TObject; var Key: Char);
    procedure dbAreaDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbAreaCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ProximoCampo( var Key : char );
    procedure HabilitaBotoes ( bEnable: Boolean );
    function SugereCodigo( tabIndex : Integer ) : integer;
    procedure FiltroAnoSemestre();
    procedure carregaTabelaSiga();
    procedure atualizaTabelaSiga();
  public
    { Public declarations }
  end;

var
  frmAtivComplementares: TfrmAtivComplementares;

implementation

{$R *.dfm}
   uses Main, uUsuario, uDM, General, uAtivCompCopiaCurso, uFSelecionarCurso;

procedure TfrmAtivComplementares.atualizaTabelaSiga;
var
   i:integer;
begin
   if (qyAtividades.State = dsBrowse) then
   begin
      for I := 0 to (cbTabelaSiga.items.Count - 1) do
      begin
         if (TItemcombo(cbTabelaSiga.Items.Objects[i]).getCodigo = qyAtividadescd_siga.asString) then
         begin
            cbTabelaSiga.ItemIndex := i;
            break;
         end;
      end;
   end;
end;

procedure TfrmAtivComplementares.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npAlterar, True ) then Exit;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0: //Cadastro de Areas
      begin
         if not (qyAreas.State = dsEdit) then
         begin
            qyAreas.Edit;
            Self.HabilitaBotoes( true );
            dbAreaCodigo.SetFocus;
         end;
      end;
      1: //Cadastro de Grupos
      begin
         if not (qyGrupos.State = dsEdit) then
         begin
            qyGrupos.Edit;
            Self.HabilitaBotoes( true );
            dbGruposCodigo.SetFocus;
         end;

      end;
      2: //Cadastro de Atividades
      begin
         if not (qyAtividades.State = dsEdit) then
         begin
            qyAtividades.Edit;
            Self.HabilitaBotoes( true );
            dbAtividadesCodigo.SetFocus;
         end;
      end;
      3: //Cadastro de Atividades por Curso
      begin
         if not (qyAtivCursos.State = dsEdit) then
         begin
            qyAtivCursos.Edit;
            Self.HabilitaBotoes( true );
            dbAtivCursoCodigo.SetFocus;
         end;
      end;
   end;
end;

procedure TfrmAtivComplementares.btnCancelarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0: //Cadastro de Areas
      begin
         qyAreas.Cancel;
         Self.HabilitaBotoes( false );
      end;
      1: //Cadastro de Grupos
      begin
         qyGrupos.Cancel;
         Self.HabilitaBotoes( false );
      end;
      2: //Cadastro de Atividades
      begin
         qyAtividades.Cancel;
         Self.HabilitaBotoes( false );
      end;
      3: //Cadastro de Atividades por Curso
      begin
         qyAtivCursos.Cancel;
         Self.HabilitaBotoes( false );
      end;
   end;
end;

procedure TfrmAtivComplementares.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   if qyAtivCursos.State IN [dsEdit, dsInsert] then
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

      if resultado_filtro.filtrado then
      begin
         qyAtivCursoscd_curso.AsString := resultado_filtro.cd_curso;
         qyAtivCursosnr_anosem.AsInteger := resultado_filtro.nr_anosemestre;
      end;
  end;
end;

procedure TfrmAtivComplementares.btnCopiarCursoClick(Sender: TObject);
var
   sAnoSemestre, sGrade, sCurso : string;

   qyCursos    : TUMZQuery;
begin

   qyCursos    := nil;
   sAnoSemestre := '';
   sCurso := '';
   sGrade := '';

   if not DM.UsuarioLogado.TemPermissao( 1059, npAcesso, True ) then Exit;

   if qyAtivCursos.RecordCount > 0  then
   begin
      Application.CreateForm( TfrmAtivCompCopiaCurso, frmAtivCompCopiaCurso );

      // Copiar as informações selecionadas para a tela de copia
      frmAtivCompCopiaCurso.txtAnoSemestreCopia.Text := qyAtivCursosnr_anosem.AsString;
      frmAtivCompCopiaCurso.txtCurso.Text := qyAtivCursoscd_curso.AsString;
      frmAtivCompCopiaCurso.txtGrade.Text := qyAtivCursoscd_grade.AsString;

      //Se a pessoa não clicou no botão OK ele destroi o formulário
      if frmAtivCompCopiaCurso.ShowModal() = mrOk then begin

         sAnoSemestre := frmAtivCompCopiaCurso.txtAnoSemestreCopia.Text;
         sCurso := frmAtivCompCopiaCurso.txtCurso.Text;
         sGrade := frmAtivCompCopiaCurso.txtGrade.Text;

         DM.CriarConsulta( qyCursos );
         qyCursos.Close;
         qyCursos.SQL.Text := '' +
          ' REPLACE INTO ge_cursos (cd_curso, nr_anosem, cd_grade, nr_etapa, cd_ge_atividade, nr_horas, sn_validar_horas_grade) ' +
          ' SELECT :cd_curso, :nr_anosem, :cd_grade, nr_etapa, cd_ge_atividade, nr_horas, sn_validar_horas_grade FROM ge_cursos ' +
          '  WHERE cd_curso = :CursoAtual AND nr_anosem = :AnoSemAtual AND cd_grade = :GradeAtual ';


         qyCursos.ParamByName('cd_curso').AsString            := sCurso;
         qyCursos.ParamByName('nr_anosem').AsString           := sAnoSemestre;
         qyCursos.ParamByName('cd_grade').AsString            := sGrade;
         
         qyCursos.ParamByName('CursoAtual').AsString            := qyAtivCursoscd_curso.AsString;
         qyCursos.ParamByName('AnoSemAtual').AsString           := qyAtivCursosnr_anosem.AsString;
         qyCursos.ParamByName('GradeAtual').AsString            := qyAtivCursoscd_grade.AsString;
         
         qyCursos.ExecSQL;

         FreeAndNil( qyCursos );

         qyAtivCursos.Close;
         qyAtivCursos.Open;

         Mensagem('Grade replicada com sucesso.', 'Aviso', MB_OK + MB_ICONINFORMATION);

      End;

   end
   else
   begin
      Mensagem('Tabela sem registro para copiar.', 'Aviso', MB_OK + MB_ICONWARNING);
   end;

end;

procedure TfrmAtivComplementares.btnExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npExcluir, True ) then Exit;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0: //Cadastro de Areas
      begin
      
         if qyAreas.RecordCount > 0 then
         begin
            if  Mensagem('Deseja excluir o registro selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
            begin
               qyAreas.Delete;
            end;
         end
         else
         begin
            Mensagem('Tabela sem registro.', 'Aviso', MB_OK);
         end;

      end;
      1: //Cadastro de Grupos
      begin

         if qyGrupos.RecordCount > 0 then
         begin
            if  Mensagem('Deseja excluir o registro selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
            begin
              qyGrupos.Delete;
            end
         end
         else
         begin
            Mensagem('Tabela sem registro.', 'Aviso', MB_OK);
         end;

      end;
      2: //Cadastro de Atividades
      begin

         if qyAtividades.RecordCount > 0 then
         begin
            if  Mensagem('Deseja excluir o registro selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
            begin
               qyAtividades.Delete;
            end;
         end
         else
         begin
            Mensagem('Tabela sem registro.', 'Aviso', MB_OK);
         end;

      end;
      3: //Cadastro de Atividades por Curso
      begin

         if qyAtivCursos.RecordCount > 0 then
         begin
            if  Mensagem('Deseja excluir o registro selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
            begin
               qyAtivCursos.Delete;
               qyAtivCursos.ApplyUpdates();
            end;
         end
         else
         begin
            Mensagem('Tabela sem registro.', 'Aviso', MB_OK);
         end;

      end;
   end;
end;

procedure TfrmAtivComplementares.btnIncluirClick(Sender: TObject);
Var
   sCurso : String;
   iAnoSem, iGrade, iEtapa : Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0: //Cadastro de Areas
      begin
         if not (qyAreas.State = dsInsert) then
         begin
            DBEdit1.SetFocus;
            qyAreas.Insert;
            qyAreas.FieldByName('cd_ge_area').AsInteger := SugereCodigo ( TTabSheet(pcGeral.ActivePage).PageIndex );
         end;
      end;
      1: //Cadastro de Grupos
      begin
         if not (qyGrupos.State = dsInsert) then
         begin
            dbGruposDescricao.SetFocus;
            qyGrupos.Insert;
            qyGrupos.FieldByName('cd_ge_grupo').AsInteger := SugereCodigo ( TTabSheet(pcGeral.ActivePage).PageIndex );
         end;

      end;
      2: //Cadastro de Atividades
      begin
         if not (qyAtividades.State = dsInsert) then
         begin
            dblcbAtividadesGrupo.SetFocus;
            qyAtividades.Insert;
            qyAtividades.FieldByName('cd_ge_atividade').AsInteger := SugereCodigo ( TTabSheet(pcGeral.ActivePage).PageIndex );
            cbTabelaSiga.ItemIndex := 0;
         end;
      end;
      3: //Cadastro de Atividades por Curso
      begin
         if not (qyAtivCursos.State = dsInsert) then
         begin

            if not qyAtivCursos.IsEmpty then begin
               dbAtividade.SetFocus();

               sCurso := qyAtivCursoscd_curso.AsString;
               iAnoSem := qyAtivCursosnr_anosem.AsInteger;
               iGrade := qyAtivCursoscd_grade.AsInteger;
               iEtapa := qyAtivCursosnr_etapa.AsInteger;

               qyAtivCursos.Insert;
               qyAtivCursos.FieldByName('cd_curso').AsString := sCurso;
               qyAtivCursos.FieldByName('nr_anosem').AsInteger := iAnoSem;
               qyAtivCursos.FieldByName('cd_grade').AsInteger := iGrade;
               qyAtivCursos.FieldByName('nr_etapa').AsInteger := iEtapa;


            end else begin
               dbAtivCursoAnoSemestre.SetFocus;
               qyAtivCursos.Insert;
            end;

         end;
      end;
   end;

end;

procedure TfrmAtivComplementares.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmAtivComplementares.btnSalvarClick(Sender: TObject);
var
   xCodigo : String;
   i: integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;

   {Ao fechar e abrir o banco ele deixar a selação no registro selecionado com
   base no código armazenado nessa variável.}
   xCodigo := '';

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0: //Cadastro de Areas
      begin
         if qyAreas.State IN [ dsInsert, dsEdit ] then
            qyAreas.Post;

         xCodigo := qyAreas.FieldByName('cd_ge_area').asString;
         qyAreas.Close;
         qyAreas.Open;
         qyAreas.Locate( 'cd_ge_area', xCodigo, [loCaseInsensitive] );
         Self.HabilitaBotoes( false );
      end;
      1: //Cadastro de Grupos
      begin
         qyGrupos.Post;
         xCodigo := qyGrupos.FieldByName('cd_ge_grupo').asString;
         qyGrupos.Close;
         qyGrupos.Open;
         qyGrupos.Locate( 'cd_ge_grupo', xCodigo, [loCaseInsensitive] );
         Self.HabilitaBotoes( false );
      end;
      2: //Cadastro de Atividades
      begin
         if cbTabelaSiga.ItemIndex > 0 then
         begin
            qyAtividadescd_siga.AsInteger :=
               StrToInt(
                  TItemcombo(cbTabelaSiga.Items.Objects[cbTabelaSiga.ItemIndex]).getCodigo
               );
         end;

         qyAtividades.Post;
         xCodigo := qyAtividades.FieldByName('cd_ge_atividade').asString;
         qyAtividades.Close;
         qyAtividades.Open;
         qyAtividades.Locate( 'cd_ge_atividade', xCodigo, [loCaseInsensitive] );
         Self.HabilitaBotoes( false );
         Self.atualizaTabelaSiga();
      end;
      3: //Cadastro de Atividades por Curso
      begin
         qyAtivCursos.Post;
         qyAtivCursos.ApplyUpdates();
         xCodigo := qyAtivCursos.FieldByName('cd_curso').asString;
         qyAtivCursos.Close;
         qyAtivCursos.Open;
         qyAtivCursos.Locate( 'cd_curso', xCodigo, [loCaseInsensitive] );
         Self.HabilitaBotoes( false );
      end;
   end;
end;

procedure TfrmAtivComplementares.carregaTabelaSiga;
begin
   qryTabelaSiga.Open;

   cbTabelaSiga.Items.Clear;

   cbTabelaSiga.addItem(
         'Selecione',
         TItemCombo.create(
            qryTabelaSigacd_siga.asString,
            'Selecione'
         )
      );

   qryTabelaSiga.First;
   while not(qryTabelaSiga.EOF) do
   begin

      cbTabelaSiga.addItem(
         qryTabelaSigads_codigo_siga.asString + ' - ' + qryTabelaSigads_assunto.AsString,
         TItemCombo.create(
            qryTabelaSigacd_siga.asString,
            qryTabelaSigads_assunto.AsString
         )
      );

      qryTabelaSiga.Next;
   end;
    
   if cbTabelaSiga.Items.Count > 0 then
   begin
      cbTabelaSiga.ItemIndex := 0;
   end;

   Self.atualizaTabelaSiga();

   qryModuloSiga.Close;
   qryModuloSiga.Open;
   if not(qryModuloSiga.FieldByName('sn_ativo').AsString = '1') then
   begin
      cbTabelaSiga.Enabled := false;
   end;

end;

procedure TfrmAtivComplementares.cbAnoSemestreClick(Sender: TObject);
begin
   FiltroAnoSemestre();
end;

procedure TfrmAtivComplementares.cbTabelaSigaCloseUp(Sender: TObject);
begin
   qyAtividades.Edit;
end;

procedure TfrmAtivComplementares.cbTabelaSigaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   Key := 0;
end;

procedure TfrmAtivComplementares.cbTabelaSigaKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key := #0;
end;

procedure TfrmAtivComplementares.cbTabelaSigaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   Key := 0;
end;

procedure TfrmAtivComplementares.dbAreaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAreaDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAreaHorasKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtivCursoAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtivCursoCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtivCursoEtapaKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtivCursoGradeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtividadesDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtividadesHorasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtividadesHrAtividadeKeyPress(
  Sender: TObject; var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbAtividadesHrCursoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbgrdAtivCursosCellClick(Column: TColumn);
begin
   if not cbAnoSemestre.Checked then
   begin
      txtAnoSemestreCursos.Text := qyAtivCursosnr_anosem.AsString;
   end;
end;

procedure TfrmAtivComplementares.DBGrid1CellClick(Column: TColumn);
begin
   Self.HabilitaBotoes( True );
end;

procedure TfrmAtivComplementares.dbAtividadesCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dbGruposCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dblcbAtivCursoAtividadeKeyPress(
  Sender: TObject; var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dblcbAtividadesGrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
end;

procedure TfrmAtivComplementares.dsAreasDataChange(Sender: TObject;
  Field: TField);
begin
   qyGrupos.Close();
   qyGrupos.ParamByName('cd_ge_area').AsInteger := qyAreascd_ge_area.AsInteger;
   qyGrupos.Open();
end;

procedure TfrmAtivComplementares.dsAtividadesDataChange(Sender: TObject;
  Field: TField);
begin
   if (qyAtividades.State = dsBrowse) then
   begin
      cbTabelaSiga.ItemIndex := 0;
      atualizaTabelaSiga();
   end;
end;

procedure TfrmAtivComplementares.HabilitaBotoes(bEnable: Boolean);
begin
   Self.btnSalvar.Enabled   := bEnable;
   Self.btnCancelar.Enabled := bEnable;
   Self.btnAlterar.Enabled  := not bEnable;
   Self.btnIncluir.Enabled  := not bEnable;
   Self.btnExcluir.Enabled  := not bEnable;
end;

procedure TfrmAtivComplementares.pcGeralChange(Sender: TObject);
begin
   Self.btnCancelarClick( nil );

   case pcGeral.ActivePageIndex of
     2 : begin
         qyAtividades.Close();
         qyAtividades.ParamByName('cd_ge_grupo').AsInteger := qyGruposcd_ge_grupo.AsInteger;
         qyAtividades.Open();
         carregaTabelaSiga();
     end;

     3 : begin

           qyAtivSelecao.Close();
           qyAtivSelecao.ParamByName('cd_ge_area').AsInteger := qyAreascd_ge_area.AsInteger;
           qyAtivSelecao.Open();

           FiltroAnoSemestre();
     end;


   end;
end;

procedure TfrmAtivComplementares.FiltroAnoSemestre;
var
   AnoSemestre : string;
begin

   AnoSemestre := '';

   if cbAnoSemestre.Checked then
   begin
      AnoSemestre := txtAnoSemestreCursos.Text;

      qyAtivCursos.Close;
      
      qyAtivCursos.SQL.Text := '' +
       ' select c.* from ge_cursos c ' +
       ' INNER JOIN ge_atividades a ON (c.cd_ge_atividade = a.cd_ge_atividade) ' +
       ' INNER JOIN ge_grupos g ON (a.cd_ge_grupo = g.cd_ge_grupo) ' +
       ' WHERE g.cd_ge_area=:cd_ge_area ' +
       '   AND c.nr_anosem = :anosemestre ' + 
       ' ORDER BY c.cd_curso, c.cd_grade, a.ds_ge_atividade ';
      qyAtivCursos.ParamByName('cd_ge_area').AsInteger := qyAreascd_ge_area.AsInteger;
      qyAtivCursos.ParamByName('anosemestre').AsString := AnoSemestre;

      qyAtivCursos.Open;
   end
   else
   begin
      AnoSemestre := txtAnoSemestreCursos.Text;
      qyAtivCursos.Close;
      
      qyAtivCursos.SQL.Text := '' +
       ' select c.* from ge_cursos c ' +
       ' INNER JOIN ge_atividades a ON (c.cd_ge_atividade = a.cd_ge_atividade) ' +
       ' INNER JOIN ge_grupos g ON (a.cd_ge_grupo = g.cd_ge_grupo) ' +
       ' WHERE g.cd_ge_area=:cd_ge_area ' +
       ' ORDER BY c.cd_curso, c.cd_grade, a.ds_ge_atividade ';
      qyAtivCursos.ParamByName('cd_ge_area').AsInteger := qyAreascd_ge_area.AsInteger;

      qyAtivCursos.Open;
      qyAtivCursos.Locate( 'nr_anosem', AnoSemestre, [loCaseInsensitive] );
   end;

end;

procedure TfrmAtivComplementares.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   i : Integer;
begin

   i := 0;

   //Procura por componentes do tipo Query no formulário
   for i := 0 to ComponentCount - 1 do
   begin
      //Se encontrar o componente executa a rotina para fecha-lo
      if Components[i] is TUMZQuery then
      begin
         if TUMZQuery(Components[i]).Active then
         begin
            //fecha componente query
            TUMZQuery(Components[i]).Cancel;
            TUMZQuery(Components[i]).Close;
         end;
      end;
   end;

   //Libera o form da memória
   Action := caFree;
end;

procedure TfrmAtivComplementares.FormCreate(Sender: TObject);
var
   Colunas: TStringList;
   S: string;
   I: Integer;
begin
   S := DM.variavel_parametro('ATIV.COMPLS.ATIVIDADES.COLUNAS');
   S := Trim(S);

   if S <> '' then
   begin
      Colunas := TStringList.Create;
      try
         Colunas.CaseSensitive := False;
         Colunas.StrictDelimiter := True;
         Colunas.Delimiter := ';';
         Colunas.DelimitedText := S;
         for I := 0 to dbgrdAtividades.Columns.Count - 1 do
         begin
            S := dbgrdAtividades.Columns.Items[I].FieldName;
            if Colunas.IndexOfName(S) > -1 then
            begin
               dbgrdAtividades.Columns.Items[I].Title.Caption := Colunas.Values[S];
            end;
         end;
      finally
         Colunas.Free;
      end;
   end;
end;

procedure TfrmAtivComplementares.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    VK_F1  : PrincipalForm.confSobreClick( nil );
    VK_F2  : if btnIncluir.Enabled  then btnIncluirClick( nil );
    VK_F3  : if btnAlterar.Enabled  then btnAlterarClick( nil );
    VK_F9  : if btnExcluir.Enabled  then btnExcluirClick( nil );
    VK_F5  : if btnSalvar.Enabled   then btnSalvarClick( nil );
    VK_F6  : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnSair.Enabled     then btnSairClick( nil );
  end;
end;

procedure TfrmAtivComplementares.FormShow(Sender: TObject);
begin
   
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   // Ativar as areas

   qyAreas.Close();
   qyAreas.Open();

   { Defini a primeira guia como padrão (Cadastro de Áreas) }
   pcGeral.ActivePageIndex := 0;
   txtAnoSemestreCursos.Text := FormatDateTime('yyyy',DataHoje)+'1';
end;

{
 Função para quando for pressionado a tecla ENTER em algum campo passa a seleção
 para o próximo campo.
 Parametro: Código da tecla pressionada. #13 = ENTER
}
procedure TfrmAtivComplementares.ProximoCampo( var Key: char );
begin
   if Key = #13 then
   begin
      SelectNext( ActiveControl, True, True );
      Key := #0;
   end;
end;

procedure TfrmAtivComplementares.qyAreasBeforeDelete(DataSet: TDataSet);
var
   codigo      : string;
   descricao   : string;
begin
   codigo      := '';
   descricao   := '';
   
   if not DM.UsuarioLogado.TemPermissao( 1059, npExcluir, True ) then Exit;

   codigo      := qyAreascd_ge_area.AsString;
   descricao   := qyAreasds_ge_area.AsString;

   DM.setLog(1059, 'Exclusao', codigo +  ' ; Descrição: ' + descricao );
end;

procedure TfrmAtivComplementares.qyAreasBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npAlterar, True ) then Exit;

   Self.HabilitaBotoes( true );
end;



procedure TfrmAtivComplementares.qyAreasNewRecord(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;
   
   HabilitaBotoes( true );
end;

procedure TfrmAtivComplementares.qyAtivCursosAfterPost(DataSet: TDataSet);
begin
   qyAtivCursos.ApplyUpdates;
end;

procedure TfrmAtivComplementares.qyAtivCursosBeforeDelete(DataSet: TDataSet);
var
   codigo   : string;
   grade    : string;
begin
   codigo   := '';
   grade    := '';
   
   if not DM.UsuarioLogado.TemPermissao( 1059, npExcluir, True ) then Exit;

   codigo   := qyAtivCursoscd_curso.AsString;
   grade    := qyAtivCursoscd_grade.AsString;

   DM.setLog(1059, 'Exclusao', codigo +  ' ; Grade: ' + grade );
end;

procedure TfrmAtivComplementares.qyAtivCursosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npAlterar, True ) then Exit;

   Self.HabilitaBotoes( true );
end;

procedure TfrmAtivComplementares.qyAtivCursosNewRecord(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;

   HabilitaBotoes( true );
end;

procedure TfrmAtivComplementares.qyAtividadesBeforeDelete(DataSet: TDataSet);
var
   codigo      : string;
   descricao   : string;
begin
   codigo      := '';
   descricao   := '';
   
   if not DM.UsuarioLogado.TemPermissao( 1059, npExcluir, True ) then Exit;

   codigo      := qyAtividadescd_ge_atividade.AsString;
   descricao   := qyAtividadesds_ge_atividade.AsString;

   DM.setLog(1059, 'Exclusao', codigo +  ' ; Descrição: ' + descricao );
end;

procedure TfrmAtivComplementares.qyAtividadesBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npAlterar, True ) then Exit;

   Self.HabilitaBotoes( true );
end;

procedure TfrmAtivComplementares.qyAtividadesCalcFields(DataSet: TDataSet);
begin
   qyAtividadesds_observacao.AsString := qyGruposds_observacao.AsString;
end;

procedure TfrmAtivComplementares.qyAtividadesNewRecord(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;

   qyAtividadescd_ge_grupo.AsInteger := qyGruposcd_ge_grupo.AsInteger;

   HabilitaBotoes( true );
end;

procedure TfrmAtivComplementares.qyGruposBeforeDelete(DataSet: TDataSet);
var
   codigo      : string;
   descricao   : string;
begin
   codigo      := '';
   descricao   := '';
   
   if not DM.UsuarioLogado.TemPermissao( 1059, npExcluir, True ) then Exit;

   codigo      := qyGruposcd_ge_grupo.AsString;
   descricao   := qyGruposds_ge_grupo.AsString;

   DM.setLog(1059, 'Exclusao', codigo +  ' ; Descrição: ' + descricao );
end;

procedure TfrmAtivComplementares.qyGruposBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npAlterar, True ) then Exit;
   
   Self.HabilitaBotoes( true );
end;

procedure TfrmAtivComplementares.qyGruposCalcFields(DataSet: TDataSet);
begin
   qyGruposds_observacao.AsString := qyGruposds_ge_grupo.AsString;
end;

procedure TfrmAtivComplementares.qyGruposNewRecord(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1059, npIncluir, True ) then Exit;

   qyGruposcd_ge_area.AsInteger := qyAreascd_ge_area.AsInteger;
   
   HabilitaBotoes( true );
end;

{
   Função para sugerir o código em campos que não são AUTOINCREMENT
}
function TfrmAtivComplementares.SugereCodigo(tabIndex: Integer): integer;
var
   qyQuery  : TUMZQuery;
   Codigo   : integer;
begin
   qyQuery  := nil;
   Codigo   := 0;
   
   DM.CriarConsulta( qyQuery );
   qyQuery.Close;

   case (tabIndex) of
      0: //Cadastro de Areas
      begin
         qyQuery.SQL.Text := 'SELECT MAX(cd_ge_area) AS codigo FROM ge_areas';
         qyQuery.Open;
      end;
      1: //Cadastro de Grupos
      begin
         qyQuery.SQL.Text := 'SELECT MAX(cd_ge_grupo) AS codigo FROM ge_grupos';
         qyQuery.Open;
      end;
      2: //Cadastro de Atividades
      begin
         qyQuery.SQL.Text := 'SELECT MAX(cd_ge_atividade) AS codigo FROM ge_atividades';
         qyQuery.Open;
      end;
   end;

   Codigo := qyQuery.FieldByName('codigo').AsInteger;
   Codigo := Codigo + 1;
   
   qyQuery.Close;

   FreeAndNil( qyQuery );

   SugereCodigo := Codigo;
end;

procedure TfrmAtivComplementares.txtAnoSemestreCursosKeyPress(Sender: TObject;
  var Key: Char);
begin
   Self.ProximoCampo( Key );
   FiltroAnoSemestre();
end;

procedure TfrmAtivComplementares.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      txtAnoSemestreCursos.text := DM.incrementar_ano_semestre( txtAnoSemestreCursos.Text );
   end
   else
   begin
      txtAnoSemestreCursos.text := DM.decrementar_ano_semestre( txtAnoSemestreCursos.Text );
   end;

   //Executa o Datachange do Dataset ao mudar o ano semestre
   FiltroAnoSemestre();
end;

end.