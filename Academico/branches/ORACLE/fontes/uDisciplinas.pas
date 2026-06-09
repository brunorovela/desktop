unit uDisciplinas;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids,
   ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   ToolWin, ImgList, Menus, CheckLst,StrUtils, ZSqlUpdate, ZDbcIntfs, UZDbcFuncs,
   uMensagem, UZSortedGrid;

type
   TfrmDisciplinas = class(TForm)
      pnlTitulo: TPanel;
      ilOpcoes: TImageList;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnIncluir: TToolButton;
      btnAlterar: TToolButton;
      btnExcluir: TToolButton;
      btnSep2: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      btnFechar: TToolButton;
      btnSep4: TToolButton;
      bvlSep1: TBevel;
      bvlSep4: TBevel;
      qryCategorias: TUMZQuery;
      dsCategorias: TDataSource;
      qryDisciplinasMestra: TUMZQuery;
      dsDisciplinasMestra: TDataSource;
      pgcTabs: TPageControl;
      tbsCategorias: TTabSheet;
      tbsDisciplinas: TTabSheet;
      qryCategoriasCD_CATEGORIA: TIntegerField;
      qryCategoriasDS_CHAVE: TStringField;
      qryCategoriasDS_CATEGORIA: TStringField;
      qryCategoriasSN_OCULTAR_DO_HISTORICO: TSmallintField;
      pnlCategoriasDados: TPanel;
      lblCategoriaCod: TLabel;
      dbeCategoriaCod: TDBEdit;
      lblCategoriaChave: TLabel;
      dbeCategoriaChave: TDBEdit;
      lblCategoriaDesc: TLabel;
      dbeCategoriaDesc: TDBEdit;
      dbchCategoriaOcultar: TDBCheckBox;
      splSep1: TSplitter;
      dbgCategorias: TDBGrid;
      qryDisciplinasMestraCD_DISCIPLINA_PAI: TStringField;
      qryDisciplinasMestraDS_DISCIPLINA: TStringField;
      qryDisciplinasMestraNR_ORDEM: TSmallintField;
      qryDisciplinasMestraDS_SIGLA: TStringField;
      qryDisciplinasMestraDS_DESCRICAO: TStringField;
      qryDisciplinasMestraCD_DISC_MEC: TLargeintField;
      qryDisciplinasMestraSN_ATIVA: TIntegerField;
      sbxDisciplinasDados: TScrollBox;
      qryCursosDisciplinas: TUMZQuery;
      updCursosDisciplinas: TZUpdateSQL;
      pnlDiscDados: TPanel;
      lblDiscCodPai: TLabel;
      dbeDiscCodPai: TDBEdit;
      lblDiscSigla: TLabel;
      dbeDiscSigla: TDBEdit;
      lblDiscDesc: TLabel;
      dbeDiscDesc: TDBEdit;
      lblDiscCodMec: TLabel;
      dbeDiscCodMec: TDBEdit;
      lblDiscOrdem: TLabel;
      dbeDiscOrdem: TDBEdit;
      dbchDiscAtiva: TDBCheckBox;
      splSep3: TSplitter;
      pnlDiscEmentas: TPanel;
      lblEmentas: TLabel;
      bvlSep3: TBevel;
      pnlDiscEmentasFiltros: TPanel;
      qryEmentas: TUMZQuery;
      qryEmentasCD_DISCIPLINA_PAI: TStringField;
      qryEmentasNR_ANOSEMESTRE: TSmallintField;
      qryEmentasME_EMENTA: TMemoField;
      qryEmentasME_BIBLIOGRAFIA_BASICA: TBlobField;
      qryEmentasME_BIBLIOGRAFIA_COMPLEMENTAR: TBlobField;
      qryEmentasME_OBJETIVO: TMemoField;
      qryEmentasTX_BIB_BASICA_HTML: TMemoField;
      qryEmentasTX_BIB_COMP_HTML: TMemoField;
      dsEmentas: TDataSource;
      dbnEmentas: TDBNavigator;
      lblDiscEmentaAnoSem: TLabel;
      dbeDiscEmentaAnoSem: TDBEdit;
      pgcEmentas: TPageControl;
      tbsEmenta: TTabSheet;
      tbsBibBasica: TTabSheet;
      tbsBibComp: TTabSheet;
      tbsObjetivos: TTabSheet;
      dbmEmenta: TDBMemo;
      dbmObjetivo: TDBMemo;
      dbreBibBasica: TDBRichEdit;
      dbreBibComp: TDBRichEdit;
      splSep4: TSplitter;
      pnlDiscListagem: TPanel;
      pnlDiscFiltros: TPanel;
      gbDiscFiltros: TGroupBox;
      sbDiscBusca: TSpeedButton;
      sbDiscLimpa: TSpeedButton;
      edtDiscBusca: TEdit;
      rbDiscFiltroCod: TRadioButton;
      rbDiscFiltroSigla: TRadioButton;
      rbDiscFiltroDesc: TRadioButton;
    dbgDisciplinas: TZSortedGrid;
      qryCursosDisciplinasCD_DISCIPLINA: TIntegerField;
      qryCursosDisciplinasNR_ORDEM: TSmallintField;
      qryCursosDisciplinasDS_SIGLA: TStringField;
      qryCursosDisciplinasDS_DESCRICAO: TStringField;
      qryCursosDisciplinasCD_DISC_MEC: TIntegerField;
      qryCursosDisciplinasSN_BLOQUEADO: TSmallintField;
      qryCursosDisciplinasSN_EMENTA_PADRAO: TSmallintField;
      qryCursosDisciplinasCD_DISCIPLINA_PAI: TStringField;
      qryCursosDisciplinasCD_CURSO: TStringField;
      qryCursosDisciplinasDS_CURSO: TStringField;
      lblResultadoBusca: TLabel;
      sbBibNegrito: TSpeedButton;
      sbBibItalico: TSpeedButton;
      sbBibSublinhado: TSpeedButton;
    Panel1: TPanel;
    qryDepartamentos: TUMZQuery;
    dsDepartamentos: TDataSource;
    qryDepartamentoscodigo: TSmallintField;
    qryDepartamentosdescricao: TStringField;
    qryCursosDisciplinasCD_DEPTO: TSmallintField;
    dbchExportaMoodle: TDBCheckBox;
    qryDisciplinasMestraSN_EXPORTA_MOODLE: TSmallintField;
    GroupBox1: TGroupBox;
    qyColigadas: TUMZQuery;
    pnlDiscCursos: TPanel;
    clbCursos: TCheckListBox;
    pnlDiscCursosBtns: TPanel;
    sbDiscSelCursos: TSpeedButton;
    sbDiscDesSelCursos: TSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    cbColigada: TComboBox;
    Label1: TLabel;
    cbDepartamentos: TComboBox;
    Label3: TLabel;
    edNmCurso: TEdit;
    edCdCurso: TEdit;
    lblCodCurso: TLabel;
    tbsBibSup: TTabSheet;
    dbreBibSup: TDBRichEdit;
    qryEmentasME_BIBLIOGRAFIA_SUPLEMENTAR: TBlobField;
    qryEmentasTX_BIB_SUP_HTML: TMemoField;
    tbsJustificativa: TTabSheet;
    tbsHabilidadesCompetencias: TTabSheet;
    dbreJustiticativa: TDBRichEdit;
    dbreHabilidadesCompetencias: TDBRichEdit;
    qryEmentasME_JUSTIFICATIVA: TBlobField;
    qryEmentasTX_JUSTIFICATIVA_HTML: TMemoField;
    qryEmentasME_HABILIDADES_COMPET: TBlobField;
    qryEmentasTX_HABILIDADES_COMPET_HTML: TMemoField;
    qry_verifica_cursos_disciplinas: TUMZQuery;
    procedure dbeDiscDescKeyPress(Sender: TObject; var Key: Char);
    procedure edNmCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCdCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbColigadaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbeDiscDescExit(Sender: TObject);
    procedure pgcTabsChange(Sender: TObject);
    procedure cbDepartamentosChange(Sender: TObject);
    procedure qryDepartamentosAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryDisciplinasMestraBeforePost(DataSet: TDataSet);
    procedure edtDiscBuscaChange(Sender: TObject);
    procedure qryDisciplinasMestraAfterPost(DataSet: TDataSet);
    procedure qryEmentasAfterPost(DataSet: TDataSet);
    procedure qryDisciplinasMestraAfterInsert(DataSet: TDataSet);
      procedure qryEmentasBeforePost(DataSet: TDataSet);
      procedure qryEmentasNewRecord(DataSet: TDataSet);
      procedure dsEmentasStateChange(Sender: TObject);
      procedure pgcEmentasChange(Sender: TObject);
      procedure dbreBibBasicaSelectionChange(Sender: TObject);
      procedure sbBibSublinhadoClick(Sender: TObject);
      procedure sbBibItalicoClick(Sender: TObject);
      procedure sbBibNegritoClick(Sender: TObject);
      procedure dbgDisciplinasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure clbCursosClickCheck(Sender: TObject);
      procedure dsDisciplinasMestraStateChange(Sender: TObject);
      procedure qryDisciplinasMestraBeforeDelete(DataSet: TDataSet);
      procedure pgcTabsChanging(Sender: TObject; var AllowChange: Boolean);
      procedure dsCategoriasStateChange(Sender: TObject);
      procedure dbgCategoriasTitleClick(Column: TColumn);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure edtDiscBuscaKeyPress(Sender: TObject; var Key: Char);
      procedure sbDiscBuscaClick(Sender: TObject);
      procedure sbDiscLimpaClick(Sender: TObject);
      procedure sbDiscDesSelCursosClick(Sender: TObject);
      procedure sbDiscSelCursosClick(Sender: TObject);
      procedure dsDisciplinasMestraDataChange(Sender: TObject; Field: TField);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure aplicaFiltroCursos;
  private
    { Private declarations }
      FResultBusca: TList;
      podeTrocar: Boolean;
      DescDiscMaiusculo: Boolean;
      qyTemp1 : TUMZQuery;
      function GetCodigoDisciplina(curso : String): Integer;
      function GetHtmlText(RichEdit: TCustomRichEdit): string;
      function ValidaCamposDisciplina: Boolean;
      procedure CarregaCursos;
      procedure ExcluiEmentas;
      procedure RecriaEmentas;
      procedure SalvaDisciplina;
      procedure trocarFiltroMensagem;
      function verifica_cursos_disciplinas() : Boolean;
  public
    { Public declarations }
      checarUsoColigada: Boolean;
  end;

const
   err_duplicate_key = 1062;

var
  frmDisciplinas: TfrmDisciplinas;
  frmMensagem: TfrmMensagem;


implementation

uses
   uDM, uUsuario, uDisciplinaMestra, uChecarUsoColigada, uDisciplinaCategoria;



{$R *.DFM}

procedure TfrmDisciplinas.aplicaFiltroCursos;
var
   auxTeste: String;
begin
   qryDepartamentos.GotoBookmark(cbDepartamentos.Items.Objects[cbDepartamentos.ItemIndex]);

   qryCursosDisciplinas.SQL.Text :=
         ' SELECT                                                          '+
         '  D.CODIGO CD_DISCIPLINA,                                        '+
         '  D.ORDEM NR_ORDEM,                                              '+
         '  D.SIGLA DS_SIGLA,                                              '+
         '  D.DESCRICAO DS_DESCRICAO,                                      '+
         '  D.CD_DISC_MEC,                                                 '+
         '  D.SN_BLOQUEADO,                                                '+
         '  D.SN_EMENTA_PADRAO,                                            '+
         '  D.CD_DISCIPLINA_PAI,                                           '+
         '  C.CD_CURSO,                                                    '+
         '  C.DS_CURSO,                                                    '+
         '  cc.CD_DEPTO                                                    '+
         ' FROM                                                            '+
         '  CURSOS_MESTRE C                                                '+
         '  INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = c.CD_CURSO)   '+
         '  LEFT JOIN DISCIPLINAS D ON                                     '+
         '  (C.CD_CURSO = D.CURSO) AND                                     '+
         '  (D.CD_DISCIPLINA_PAI = :CD_DISCIPLINA_PAI)                     '+
         ' WHERE                                                           '+
         '     C.SN_ATIVO = "S"                                            ';

   if cbColigada.ItemIndex = 0 then
   begin
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text + ' AND CC.cd_coligada IN (%s) ';
      qryCursosDisciplinas.SQL.Text := Format(qryCursosDisciplinas.SQL.Text, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
   end;

   if cbColigada.ItemIndex > 0 then
   begin
      qyColigadas.Locate('nm_coligada', cbColigada.Text, []);
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text + ' AND CC.CD_COLIGADA = ' + qyColigadas.FieldByName('cd_coligada').AsString;
   end;

   if cbDepartamentos.ItemIndex <> 0  then
   begin
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text+ ' AND CC.cd_depto = '+ qryDepartamentoscodigo.AsString;
   end;

   if ((cbDepartamentos.ItemIndex IN [0, 1]) and (cbDepartamentos.Items.Count <= 1) AND (cbColigada.ItemIndex <> 0))  then
   begin
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text+ ' AND CC.cd_depto = -2';
   end
   else if (cbDepartamentos.ItemIndex <> 0)  then
   begin
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text+ ' AND CC.cd_depto = '+ qryDepartamentoscodigo.AsString;
   end;
   
   if (edCdCurso.Text <> '') then
   begin
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text+ ' AND c.cd_curso = ' + #39 + edCdCurso.Text + #39;
   end;

   if (edNmCurso.Text <> '') then
   begin
      qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text + ' AND c.ds_curso LIKE ' + #39 + '%'+ edNmCurso.Text + '%' + #39;
   end;

   qryCursosDisciplinas.SQL.Text := qryCursosDisciplinas.SQL.Text           +
         ' GROUP BY                                                        '+
         '   c.CD_CURSO                                                    ';

   qryCursosDisciplinas.Open();
//      qryCursosDisciplinas.SQL.Add('')
//      qryCursosDisciplinas.Filtered := true;
   CarregaCursos;
end;

procedure TfrmDisciplinas.BitBtn1Click(Sender: TObject);
begin
   trocarFiltroMensagem;
   aplicaFiltroCursos;
end;

procedure TfrmDisciplinas.btnAlterarClick(Sender: TObject);
begin
   if pgcTabs.ActivePage = tbsCategorias then
   begin
      if TChecarUsoColigada.Create( TDisciplinaCategoria.Create( qryCategoriasCD_CATEGORIA.AsInteger ) ).NaoPossuiPermissao() then
      begin
         Exit;
      end;

      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.DisciplinasMestras.Categorias', npAlterar, true) then
      begin
         qryCategorias.Edit;
      end;
   end
   else if pgcTabs.ActivePage = tbsDisciplinas then
   begin
      if TChecarUsoColigada.Create( TDisciplinaMestra.Create( qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString ) ).NaoPossuiPermissao() then
      begin
         Exit;
      end;

      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CadDiscMestra', npAlterar, true) then
      begin
         qryDisciplinasMestra.Edit;
      end;
    end;
end;

procedure TfrmDisciplinas.btnCancelarClick(Sender: TObject);
begin
   if pgcTabs.ActivePage = tbsCategorias then
   begin
      qryCategorias.Cancel;
   end
   else if pgcTabs.ActivePage = tbsDisciplinas then
   begin
      qryDisciplinasMestra.Cancel;
      podeTrocar := True;
   end;
end;

procedure TfrmDisciplinas.btnExcluirClick(Sender: TObject);
begin
   if ( ( pgcTabs.ActivePage = tbsCategorias ) AND TChecarUsoColigada.Create( TDisciplinaCategoria.Create( qryCategoriasCD_CATEGORIA.AsInteger ) ).NaoPossuiPermissao() ) OR
      ( ( pgcTabs.ActivePage = tbsDisciplinas ) AND TChecarUsoColigada.Create( TDisciplinaMestra.Create( qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString ) ).NaoPossuiPermissao() ) then
   begin
      Exit;
   end;
   
   if ( verifica_cursos_disciplinas() ) then
   begin
      Mensagem(
         'Não é possível realizar a exclusão desta disciplina. Há vínculos com cursos que impedem esta ação.',
         'Alerta',
         MB_OK + MB_ICONINFORMATION
      );
      Exit;
   end;

   if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
   begin
      if pgcTabs.ActivePage = tbsCategorias then
      begin
         if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.DisciplinasMestras.Categorias', npExcluir, true) then
         begin
            qryCategorias.Delete;
         end;
      end
      else if pgcTabs.ActivePage = tbsDisciplinas then
      begin
         if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CadDiscMestra', npExcluir, true) then
         begin
            qryDisciplinasMestra.Delete;
         end;
       end;
    end;
end;

procedure TfrmDisciplinas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDisciplinas.btnIncluirClick(Sender: TObject);
begin

    if pgcTabs.ActivePage = tbsCategorias then
    begin
       if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.DisciplinasMestras.Categorias', npIncluir, true) then
       begin
         dbeCategoriaCod.SetFocus;
         qryCategorias.Insert;
       end;
    end
    else if pgcTabs.ActivePage = tbsDisciplinas then
    begin
       if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CadDiscMestra', npIncluir, true) then
       begin
         dbeDiscCodPai.SetFocus;
         qryDisciplinasMestra.Insert;

         if not DM.UsaAnosemestre then
         begin
            dbeDiscEmentaAnoSem.Text := '1';
         end;
       end;
    end;
end;

procedure TfrmDisciplinas.btnSalvarClick(Sender: TObject);
begin
   if pgcTabs.ActivePage = tbsCategorias then
   begin
      qryCategorias.Post;
   end
   else if pgcTabs.ActivePage = tbsDisciplinas then
   begin
      if ValidaCamposDisciplina then
      begin
         SalvaDisciplina;
      end;
      podeTrocar := True;
   end;
end;

procedure TfrmDisciplinas.CarregaCursos;
var
   I: Integer;
begin
   qryCursosDisciplinas.DisableControls;
   qryCursosDisciplinas.First;

   clbCursos.Items.BeginUpdate;
   clbCursos.Clear;

   while not qryCursosDisciplinas.Eof do
   begin
      I := clbCursos.Items.AddObject(
         qryCursosDisciplinasDS_CURSO.AsString,
         qryCursosDisciplinas.GetBookmark
      );
      if qryCursosDisciplinasCD_DISCIPLINA_PAI.IsNull then
      begin
         clbCursos.Checked[I] := False;
      end
      else
      begin
         clbCursos.Checked[I] := True;
         clbCursos.ItemEnabled[I] := False;
      end;
      qryCursosDisciplinas.Next;
   end;

   clbCursos.Items.EndUpdate;
   qryCursosDisciplinas.EnableControls;
end;

procedure TfrmDisciplinas.cbColigadaChange(Sender: TObject);
CONST
   sqlCamposDep = ''+
   'SELECT                                  '+
	'   *                                    '+
   'FROM                                    '+
	'  DEPARTAMENTOS                         ';

   sqlWhereDep = ''+
   'WHERE                                   '+
	'  cd_coligada IN (:coligadaSelecionada)                   ';

   sqlWhereColigadaDep = ''+
   'WHERE                                   '+
	'  cd_coligada = (SELECT cd_coligada FROM coligadas where nm_coligada = ' + ' TRIM(' + #39 + ':coligadaSelecionada' + #39 + ') ' + ') ';

   sqlOrdemDep = ''+
   'ORDER BY                                '+
   '  DESCRICAO                             ';
begin

   trocarFiltroMensagem;

   qryDepartamentos.Close;

   if cbColigada.Text = 'Todas unidades de ensino' then
   begin
      qryDepartamentos.SQL.Text := sqlCamposDep + sqlWhereDep + sqlOrdemDep;
      qryDepartamentos.SQL.Text := StringReplace(qryDepartamentos.SQL.Text, ':coligadaSelecionada', DM.UsuarioLogado.GetColigadasFilhaSelecionada, []);
   end
   else
   begin
      qryDepartamentos.SQL.Text := sqlCamposDep + sqlWhereColigadaDep + sqlOrdemDep;
      qryDepartamentos.SQL.Text := StringReplace(qryDepartamentos.SQL.Text, ':coligadaSelecionada', cbColigada.Text, []);
   end;

   qryDepartamentos.Open;

   qryDepartamentos.First;

   cbDepartamentos.Items.Clear;
   cbDepartamentos.AddItem('Todos', nil);

   while not(qryDepartamentos.Eof) do
   begin
      cbDepartamentos.AddItem(qryDepartamentosdescricao.AsString, qryDepartamentos.GetBookmark);
      qryDepartamentos.Next;
   end;

   cbDepartamentos.ItemIndex := 0;

   aplicaFiltroCursos();
end;

procedure TfrmDisciplinas.cbDepartamentosChange(Sender: TObject);
begin
   trocarFiltroMensagem;

   aplicaFiltroCursos;
end;

procedure TfrmDisciplinas.clbCursosClickCheck(Sender: TObject);
var
   I: Integer;
   Checked: Boolean;
begin
   I := clbCursos.ItemIndex;
   Checked := clbCursos.Checked[I];

   checarUsoColigada := False;
   if clbCursos.ItemEnabled[I] then
   begin
      qryDisciplinasMestra.Edit;
      clbCursos.ItemIndex := I;
      clbCursos.Checked[I] := Checked;
   end;
   checarUsoColigada := True;

   podeTrocar := False;
end;

procedure TfrmDisciplinas.dbeDiscDescExit(Sender: TObject);
begin
   if qryDisciplinasMestra.State in [dsInsert, dsEdit] then
   begin
      DM.CriarConsulta(qyTemp1);
      qyTemp1.Close;
      qyTemp1.SQL.Clear;
      qyTemp1.SQL.Add('SELECT cd_disciplina_pai, ds_disciplina FROM disciplinas_mestre WHERE ds_disciplina = :ds_disciplina AND cd_disciplina_pai <> :cd_disciplina_pai');
      qyTemp1.ParamByName('ds_disciplina').AsString := qryDisciplinasMestraDS_DISCIPLINA.AsString;
      qyTemp1.ParamByName('cd_disciplina_pai').AsString := qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString;
      qyTemp1.Open;

      if qyTemp1.FieldByName('ds_disciplina').AsString <> '' then
      begin
         Mensagem('Existe uma disciplina com a mesma descrição cadastrada no sistema.' + chr(13) +
                     '   Código Mestre : ' + qyTemp1.FieldByName('cd_disciplina_pai').AsString + chr(13),
                     'Alerta', MB_OK);
         dbeDiscDesc.SetFocus();
      end;
   end;
end;

procedure TfrmDisciplinas.dbeDiscDescKeyPress(Sender: TObject; var Key: Char);
var
   k: String[1];
begin

   if DescDiscMaiusculo = True then
   begin
      k := Key;
      k := AnsiUpperCase(k);
      Key := k[1];
   end;
   
end;

procedure TfrmDisciplinas.dbgCategoriasTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   qryCategorias.DisableControls;
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := #59;
      SortedFields.StrictDelimiter := True;
      SortedFields.NameValueSeparator := #32;
      SortedFields.DelimitedText := qryCategorias.IndexFieldNames;

      for I := 0 to SortedFields.Count - 1 do

         if SortedFields.Names[I] = Column.FieldName then
         begin

            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;

            Found := True;
            Break;
         end;

      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;

      Application.ProcessMessages;
      qryCategorias.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
   qryCategorias.EnableControls;
end;

procedure TfrmDisciplinas.dbgDisciplinasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

   function IsRegistroFiltrado: Boolean;
   var
      I: Integer;
   begin
      Result := False;
      for I := 0 to FResultBusca.Count - 1 do
      begin
         if qryDisciplinasMestra.CompareBookmarks(
               qryDisciplinasMestra.GetBookmark,
               FResultBusca.Items[I]) = 0 then
         begin
            Result := True;
            Break;
         end;
      end;
   end;
   
begin
   if IsRegistroFiltrado then
   begin
      dbgDisciplinas.Canvas.Font.Color := clWindowText;
      dbgDisciplinas.Canvas.Brush.Color := clInfoBk;
      dbgDisciplinas.Canvas.FillRect(Rect);
      dbgDisciplinas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfrmDisciplinas.dbreBibBasicaSelectionChange(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   if Sender is TCustomRichEdit then
   begin
      RichEdit := TCustomRichEdit(Sender);
      sbBibNegrito.Down := fsBold in RichEdit.SelAttributes.Style;
      sbBibItalico.Down := fsItalic in RichEdit.SelAttributes.Style;
      sbBibSublinhado.Down := fsUnderline in RichEdit.SelAttributes.Style;
   end;
end;

procedure TfrmDisciplinas.dsCategoriasStateChange(Sender: TObject);
var
   possuiPermissao: Boolean;
begin
   if pgcTabs.ActivePage = tbsCategorias then
   begin
      if (qryCategorias.State in [dsInsert, dsEdit]) and (TChecarUsoColigada.Create( TDisciplinaCategoria.Create( qryCategoriasCD_CATEGORIA.AsInteger ) ).NaoPossuiPermissao()) then
      begin
         qryCategorias.Cancel;
      end;

      btnIncluir.Enabled := qryCategorias.State = dsBrowse;
      btnAlterar.Enabled := (qryCategorias.State = dsBrowse) and
         (not qryCategorias.IsEmpty);
      btnExcluir.Enabled := (qryCategorias.State = dsBrowse) and
         (not qryCategorias.IsEmpty);
      btnSalvar.Enabled := qryCategorias.State in dsEditModes;
      btnCancelar.Enabled := qryCategorias.State in dsEditModes;
      btnFechar.Enabled := qryCategorias.State = dsBrowse;
   end;
end;

procedure TfrmDisciplinas.dsDisciplinasMestraDataChange(Sender: TObject;
  Field: TField);
begin
   CarregaCursos;
end;

procedure TfrmDisciplinas.dsDisciplinasMestraStateChange(Sender: TObject);
begin
   if pgcTabs.ActivePage = tbsDisciplinas then
   begin

      if (qryDisciplinasMestra.State in [dsEdit]) and checarUsoColigada and (TChecarUsoColigada.Create( TDisciplinaMestra.Create( qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString ) ).NaoPossuiPermissao()) then
      begin
         qryDisciplinasMestra.Cancel;
      end;

      btnIncluir.Enabled := qryDisciplinasMestra.State = dsBrowse;
      btnAlterar.Enabled := (qryDisciplinasMestra.State = dsBrowse) and
         (not qryDisciplinasMestra.IsEmpty);
      btnExcluir.Enabled := (qryDisciplinasMestra.State = dsBrowse) and
         (not qryDisciplinasMestra.IsEmpty);
      btnSalvar.Enabled := qryDisciplinasMestra.State in dsEditModes;
      btnCancelar.Enabled := qryDisciplinasMestra.State in dsEditModes;
      btnFechar.Enabled := qryDisciplinasMestra.State = dsBrowse;
   end;
end;

procedure TfrmDisciplinas.dsEmentasStateChange(Sender: TObject);
begin
   if (qryEmentas.State in dsEditModes) and
      (pgcEmentas.ActivePageIndex in [1, 2, 3, 5, 6]) then
   begin
      sbBibNegrito.Enabled := True;
      sbBibItalico.Enabled := True;
      sbBibSublinhado.Enabled := True;
   end
   else
   begin
      sbBibNegrito.Enabled := False;
      sbBibItalico.Enabled := False;
      sbBibSublinhado.Enabled := False;
   end;

   if qryEmentas.State in dsEditModes then
   begin
      qryDisciplinasMestra.DisableControls;
      btnIncluir.Enabled := False;
      btnAlterar.Enabled := False;
      btnExcluir.Enabled := False;
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnFechar.Enabled := False;
   end
   else if qryEmentas.State = dsBrowse then
   begin
      while qryDisciplinasMestra.ControlsDisabled do
         qryDisciplinasMestra.EnableControls;
      btnIncluir.Enabled := qryDisciplinasMestra.State = dsBrowse;
      btnAlterar.Enabled := (qryDisciplinasMestra.State = dsBrowse) and
         (not qryDisciplinasMestra.IsEmpty);
      btnExcluir.Enabled := (qryDisciplinasMestra.State = dsBrowse) and
         (not qryDisciplinasMestra.IsEmpty);
      btnSalvar.Enabled := qryDisciplinasMestra.State in dsEditModes;
      btnCancelar.Enabled := qryDisciplinasMestra.State in dsEditModes;
      btnFechar.Enabled := qryDisciplinasMestra.State = dsBrowse;
   end;
end;

procedure TfrmDisciplinas.edCdCursoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      trocarFiltroMensagem;
      aplicaFiltroCursos;
   end;
end;

procedure TfrmDisciplinas.edNmCursoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      trocarFiltroMensagem;
      aplicaFiltroCursos;
   end;
end;

procedure TfrmDisciplinas.edtDiscBuscaChange(Sender: TObject);
begin
   if FResultBusca.Count > 0 then
   begin
      FResultBusca.Clear;
   end;
end;

procedure TfrmDisciplinas.edtDiscBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      sbDiscBusca.Click;
   end;
end;

procedure TfrmDisciplinas.ExcluiEmentas;
const
   SSQLExcluiEmentasMySQL = 'DELETE DE.* FROM DISCIPLINAS_EMENTAS DE WHERE EXISTS (SELECT D.CODIGO FROM DISCIPLINAS D WHERE DE.CODIGO = D.CODIGO AND DE.CURSO = D.CURSO AND D.CD_DISCIPLINA_PAI = ? AND D.SN_EMENTA_PADRAO = 1)';
   SSQLExcluiEmentasOra = 'DELETE FROM DISCIPLINAS_EMENTAS DE WHERE EXISTS (SELECT D.CODIGO FROM DISCIPLINAS D WHERE DE.CODIGO = D.CODIGO AND DE.CURSO = D.CURSO AND D.CD_DISCIPLINA_PAI = ? AND D.SN_EMENTA_PADRAO = 1)';
var
   Stmt: IZPreparedStatement;
begin
   if DM.db.Protocol = DB_PROTOCOL_MYSQL then
   begin
      Stmt := PrepareStatement(SSQLExcluiEmentasMySQL);
   end
   else if DM.db.Protocol = DB_PROTOCOL_ORACLE then
   begin
      Stmt := PrepareStatement(SSQLExcluiEmentasOra);
   end;
   try
      Stmt.SetString(1, qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
   end;
end;

procedure TfrmDisciplinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryEmentas.Close;
   qryCursosDisciplinas.Close;
   qryDisciplinasMestra.Close;
   qryCategorias.Close;
   FResultBusca.Free;
   qryDepartamentos.Close;
   cbDepartamentos.Clear;
   Action := caFree;
end;

procedure TfrmDisciplinas.FormCreate(Sender: TObject);
begin

   podeTrocar := True;

   qyColigadas.SQL.Text := StringReplace(qyColigadas.SQL.Text, ':coligadasFilhas', DM.UsuarioLogado.GetColigadasFilhaSelecionada, [rfReplaceAll, rfIgnoreCase]);

   qyColigadas.Open;
   
   qyColigadas.First;

   while not(qyColigadas.Eof) do
   begin
      cbColigada.AddItem(qyColigadas.FieldByName('nm_coligada').AsString, qyColigadas.GetBookmark);
      qyColigadas.Next;
   end;

   cbColigada.ItemIndex := 0;

   FResultBusca := TList.Create;
   qryCategorias.Open;
   qryEmentas.Open;
   qryCursosDisciplinas.Close;
   qryCursosDisciplinas.SQL.Text := Format(qryCursosDisciplinas.SQL.Text, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
   qryCursosDisciplinas.Open;
   qryDisciplinasMestra.Open;

   if ( DM.UtilizaMoodle() ) then
   begin
      pnlDiscDados.Height := dbchExportaMoodle.Top + dbchExportaMoodle.Height + 7;
      dbchExportaMoodle.Visible := True;
   end else begin
      pnlDiscDados.Height := dbeDiscCodMec.Top + dbeDiscCodMec.Height + 7;
      dbchExportaMoodle.Visible := False;
   end;
end;

procedure TfrmDisciplinas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         begin
            btnIncluir.Click;
         end;
      VK_F3:
         begin
            btnAlterar.Click;
         end;
      VK_F9:
         begin
            btnExcluir.Click;
         end;
      VK_F5:
         begin
            btnSalvar.Click;
         end;
      VK_F6:
         begin
            btnCancelar.Click;
         end;
      VK_F12:
         begin
            btnFechar.Click;
         end;
   end;
end;

procedure TfrmDisciplinas.FormShow(Sender: TObject);
var
   qyVerificaMaisculo: TUMZQuery;
begin
   checarUsoColigada := True;
   qryDepartamentos.Close;
   qryDepartamentos.SQL.Text := Format(qryDepartamentos.SQL.Text, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
   qryDepartamentos.Open;
   pgcEmentas.activePage := tbsEmenta;

   dm.CriarConsulta(qyVerificaMaisculo);

   qyVerificaMaisculo.SQL.Text := '' +
   'Select ds_valor ' +
   'FROM parametros ' +
   'WHERE ds_variavel = ''descricao_disciplina_maisculo''';

   qyVerificaMaisculo.Open;

   if qyVerificaMaisculo.FieldByName('ds_valor').asString = 'S' then
   begin
      Self.DescDiscMaiusculo := True;
   end
   else
   begin
      Self.DescDiscMaiusculo := False;
   end;
   
end;

function TfrmDisciplinas.GetCodigoDisciplina(curso : String): Integer;
const
   SSQLNovoCodigo = 'SELECT COALESCE(MAX(CODIGO), 0) + 1 FROM DISCIPLINAS WHERE CURSO = ?';

   SSQLCodigoUsado = 'SELECT DISTINCT d.CODIGO '+
   'FROM DISCIPLINAS as D LEFT JOIN DISCIPLINAS as D2 ON (d.codigo = d2.codigo and d2.curso = ?) '+
   'WHERE d.CD_DISCIPLINA_PAI = ? AND d2.curso is null';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := 0;   

   Stmt := PrepareStatement(SSQLCodigoUsado);
   try
      Stmt.SetString(2, qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString);
      Stmt.SetString(1, curso);
      Rs := Stmt.ExecuteQueryPrepared;

      try
         if Rs.Next then
         begin
            Result := Rs.GetInt(1);
         end
         else
         begin
            Stmt := PrepareStatement(SSQLNovoCodigo);
            Stmt.SetString(1, curso);
            Rs := Stmt.ExecuteQueryPrepared;
            if Rs.Next then
            begin
               Result := Rs.GetInt(1);
            end
            else
            begin
               Result := 1;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
   end;
end;

function TfrmDisciplinas.GetHtmlText(RichEdit: TCustomRichEdit): string;
var
   I, TextLen: Integer;
   Bold, Italic, Underline: Boolean;
begin
   LockWindowUpdate(RichEdit.Handle);
   Bold := False;
   Italic := False;
   Underline := False;
   Result := '';
   TextLen := Length(RichEdit.Text);

   for I := 0 to TextLen - 1 do
   begin
      RichEdit.SelStart := I;
      RichEdit.SelLength := 1;

      if fsBold in RichEdit.SelAttributes.Style then
      begin
         if not Bold then
         begin
            Result := Result + '<b>';
            Bold := True;
         end;
      end
      else
      begin
         if Bold then
         begin
            Result := Result + '</b>';
            Bold := False;
         end;
      end;

      if fsItalic in RichEdit.SelAttributes.Style then
      begin
         if not Italic then
         begin
            Result := Result + '<i>';
            Italic := True;
         end;
      end
      else
      begin
         if Italic then
         begin
            Result := Result + '</i>';
            Italic := False;
         end;
      end;

      if fsUnderline in RichEdit.SelAttributes.Style then
      begin
         if not Underline then
         begin
            Result := Result + '<u>';
            Underline := True;
         end;
      end
      else
      begin
         if Underline then
         begin
            Result := Result + '</u>';
            Underline := False;
         end;
      end;

      Result := Result + Copy(RichEdit.Text, I + 1, 1);
   end;

   if Bold then
   begin
      Result := Result + '</b>';
   end;

   if Italic then
   begin
      Result := Result + '</i>';
   end;

   if Underline then
   begin
      Result := Result + '</u>';
   end;

   LockWindowUpdate(0);
end;

procedure TfrmDisciplinas.pgcEmentasChange(Sender: TObject);
begin
   if pgcEmentas.ActivePageIndex in [1, 2, 3, 5, 6] then
   begin
      sbBibNegrito.Visible := True;
      sbBibItalico.Visible := True;
      sbBibSublinhado.Visible := True;
      
      sbBibNegrito.Enabled := qryEmentas.State in dsEditModes;
      sbBibItalico.Enabled := qryEmentas.State in dsEditModes;
      sbBibSublinhado.Enabled := qryEmentas.State in dsEditModes;
   end
   else
   begin
      sbBibNegrito.Visible := False;
      sbBibItalico.Visible := False;
      sbBibSublinhado.Visible := False;
   end;
end;

procedure TfrmDisciplinas.pgcTabsChange(Sender: TObject);
begin
  if pgcTabs.ActivePage = tbsCategorias then
  begin
      if not(DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.DisciplinasMestras.Categorias', npAcesso, true)) then
      begin
        pgcTabs.ActivePage := tbsDisciplinas;
        Abort;
      end;            
  end;
end;

procedure TfrmDisciplinas.pgcTabsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := (qryCategorias.State = dsBrowse) and
      (qryDisciplinasMestra.State = dsBrowse);
   if not AllowChange then
   begin
      MessageDlg('É necessário salvar as alterações para alternar entre as abas', mtInformation, [mbOK], -1);
   end;
end;

procedure TfrmDisciplinas.qryDepartamentosAfterOpen(DataSet: TDataSet);
begin
   qryDepartamentos.First;

   while not(qryDepartamentos.Eof) do
   begin
      cbDepartamentos.AddItem(qryDepartamentosdescricao.AsString, qryDepartamentos.GetBookmark);
      qryDepartamentos.Next;
   end;
end;

procedure TfrmDisciplinas.qryDisciplinasMestraAfterInsert(DataSet: TDataSet);
begin
   qryEmentas.DisableControls;
end;

procedure TfrmDisciplinas.qryDisciplinasMestraAfterPost(DataSet: TDataSet);
begin
   while qryEmentas.ControlsDisabled do qryEmentas.EnableControls;
end;

procedure TfrmDisciplinas.qryDisciplinasMestraBeforeDelete(DataSet: TDataSet);
begin
   ExcluiEmentas;
end;

procedure TfrmDisciplinas.qryDisciplinasMestraBeforePost(DataSet: TDataSet);
begin
    edtDiscBusca.SetFocus;
end;

procedure TfrmDisciplinas.qryEmentasAfterPost(DataSet: TDataSet);
begin
   RecriaEmentas;
end;

procedure TfrmDisciplinas.qryEmentasBeforePost(DataSet: TDataSet);
begin
   qryEmentasTX_BIB_BASICA_HTML.AsString := GetHtmlText(dbreBibBasica);
   qryEmentasTX_BIB_COMP_HTML.AsString := GetHtmlText(dbreBibComp);
   qryEmentasTX_BIB_SUP_HTML.AsString := GetHtmlText(dbreBibSup);
   qryEmentasTX_JUSTIFICATIVA_HTML.AsString := GetHtmlText(dbreJustiticativa);
   qryEmentasTX_HABILIDADES_COMPET_HTML.AsString := GetHtmlText(dbreHabilidadesCompetencias);

   if (qryEmentasNR_ANOSEMESTRE.AsInteger = 0) and not(DM.UsaAnosemestre) then
   begin
      qryEmentasNR_ANOSEMESTRE.AsInteger := 1;
   end
   else if (qryEmentasNR_ANOSEMESTRE.AsInteger = 0) then
   begin
      Mensagem('Favor indique um Ano/Semestre!', 'Alerta!', MB_ICONWARNING + MB_OK);
      abort;
   end;
end;

procedure TfrmDisciplinas.qryEmentasNewRecord(DataSet: TDataSet);
begin
   qryEmentasCD_DISCIPLINA_PAI.AsString := qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString;
end;

procedure TfrmDisciplinas.RecriaEmentas;
const
   SSQLAtualizaEmentas = '';

   SSQLRecriaEmentas =
      'INSERT INTO DISCIPLINAS_EMENTAS ' +
         '(CODIGO, CURSO, ANOSEMESTRE, EMENTA, BIBLIOGRAFIA_BASICA, BIBLIOGRAFIA_COMPLEMENTAR, BIBLIOGRAFIA_SUPLEMENTAR, OBJETIVO, TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML, TX_BIB_SUP_HTML, '+
         '  ME_JUSTIFICATIVA, TX_JUSTIFICATIVA_HTML, ME_HABILIDADES_COMPET, TX_HABILIDADES_COMPET_HTML) ' +
      'SELECT DISTINCT ' +
         'D.CODIGO, ' +
         'D.CURSO, ' +
         'E.NR_ANOSEMESTRE, ' +
         'E.ME_EMENTA, ' +
         'E.ME_BIBLIOGRAFIA_BASICA, ' +
         'E.ME_BIBLIOGRAFIA_COMPLEMENTAR, ' +
         'E.ME_BIBLIOGRAFIA_SUPLEMENTAR, ' +
         'E.ME_OBJETIVO, ' +
         'E.TX_BIB_BASICA_HTML, ' +
         'E.TX_BIB_COMP_HTML, ' +
         'E.TX_BIB_SUP_HTML, ' +
         'E.ME_JUSTIFICATIVA, ' +
         'E.TX_JUSTIFICATIVA_HTML, ' +
         'E.ME_HABILIDADES_COMPET, ' +
         'E.TX_HABILIDADES_COMPET_HTML ' +         
      'FROM ' +
         'DISCIPLINAS D ' +
         'JOIN DISCIPLINAS_MESTRE_EMENTAS E ON ' +
            '(D.CD_DISCIPLINA_PAI = E.CD_DISCIPLINA_PAI) ' +
      'WHERE ' +
         'E.CD_DISCIPLINA_PAI = ? AND D.SN_EMENTA_PADRAO = 1 AND ' +
         'NOT EXISTS (' +
            'SELECT DE.CODIGO FROM DISCIPLINAS_EMENTAS DE WHERE ' +
            'D.CODIGO = DE.CODIGO AND D.CURSO = DE.CURSO AND E.NR_ANOSEMESTRE = DE.ANOSEMESTRE' +
         ')';
var
   Stmt: IZPreparedStatement;
begin
   ExcluiEmentas;
   
   Stmt := PrepareStatement(SSQLRecriaEmentas);
   try
      Stmt.SetString(1, qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
   end;
end;

procedure TfrmDisciplinas.SalvaDisciplina;

   function GetListaCursos: string;
   var
      I: Integer;
   begin
      Result := '';
      for I := 0 to clbCursos.Count - 1 do
      begin
         if clbCursos.ItemEnabled[I] and clbCursos.Checked[I] then
         begin
            qryCursosDisciplinas.GotoBookmark(clbCursos.Items.Objects[I]);
            if Trim(qryCursosDisciplinasDS_CURSO.AsString) <> '' then
               Result := Result + #13#10 + Trim(qryCursosDisciplinasDS_CURSO.AsString);
         end;
      end;
   end;

var
   I, CodigoDisc: Integer;
   S, Msg, CodCurso: string;
   Confirmado: Boolean;
   parametros: TParamsIni;
   qryUpdateEmentas: TUMZQuery;
begin
   qryCursosDisciplinas.DisableControls;
   qryDisciplinasMestra.DisableControls;
   qryEmentas.DisableControls;

   S := GetListaCursos;
   Confirmado := S = '';

   if not Confirmado then
   begin
      Msg := S;
      
      parametros.titulo := 'Confirmação';
      parametros.opcoes := (BT_YESNO + ICO_CONFIRMATION);
      parametros.mensagens.msgPrincipal := Msg;
      parametros.mensagens.msgTopo := 'Você habilitou a disciplina para os seguintes cursos:';
      parametros.mensagens.msgRodape := 'Ao confirmar uma nova disciplina para cada curso selecionado será criada.'#13'Deseja prosseguir?';
      parametros.dimensao.altura := 350;
      parametros.dimensao.largura := 600;

      with TfrmMensagem.create(Self, parametros) do
      begin
         ShowModal;
         Confirmado := getResposta = RESP_YES;   
      end;
   end;
   
   if Confirmado then
   begin

      for I := 0 to clbCursos.Count - 1 do
      begin
         if clbCursos.ItemEnabled[I] and clbCursos.Checked[I] then
         begin
            qryCursosDisciplinas.GotoBookmark(clbCursos.Items.Objects[I]);
            CodCurso := qryCursosDisciplinasCD_CURSO.AsString;

            CodigoDisc := GetCodigoDisciplina(CodCurso);

            qryCursosDisciplinas.Insert;
            qryCursosDisciplinasCD_DISCIPLINA.AsInteger := CodigoDisc;
            qryCursosDisciplinasCD_DISCIPLINA_PAI.AsString := qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString;
            qryCursosDisciplinasNR_ORDEM.AsInteger := qryDisciplinasMestraNR_ORDEM.AsInteger;
            qryCursosDisciplinasDS_SIGLA.AsString := qryDisciplinasMestraDS_SIGLA.AsString;
            qryCursosDisciplinasDS_DESCRICAO.AsString := qryDisciplinasMestraDS_DISCIPLINA.AsString;
            qryCursosDisciplinasCD_DISC_MEC.AsInteger := qryDisciplinasMestraCD_DISC_MEC.AsInteger;
            qryCursosDisciplinasCD_CURSO.AsString := CodCurso;
            qryCursosDisciplinasSN_EMENTA_PADRAO.AsInteger := 1;
            qryCursosDisciplinasSN_BLOQUEADO.AsInteger := 1;

            qryCursosDisciplinas.Post();

            //Insere e ementa cadastrada na base para ao visualizar a mesma
            //na disciplina do curso ser listada.
            
            dm.CriarUniConsulta(qryUpdateEmentas);
            
           qryUpdateEmentas.SQL.Text := ''+
            'INSERT INTO disciplinas_ementas (codigo,anosemestre,ementa,bibliografia_basica,bibliografia_complementar,bibliografia_suplementar,objetivo,curso, TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML,TX_BIB_SUP_HTML, '+
            '  ME_JUSTIFICATIVA,TX_JUSTIFICATIVA_HTML,ME_HABILIDADES_COMPET,TX_HABILIDADES_COMPET_HTML) '+
            'SELECT                                                           '+
               IntToStr(CodigoDisc)+',                                        '+
            '  nr_anosemestre,                                                '+
            '  me_ementa,                                                     '+
            '  me_bibliografia_basica,                                        '+
            '  me_bibliografia_complementar,                                  '+
            '  me_bibliografia_suplementar,                                   '+
            '  me_objetivo,                                                   '+
            '' + QuotedStr(qryCursosDisciplinasCD_CURSO.AsString) + ',        '+
            ' TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML, TX_BIB_SUP_HTML,          '+
            ' ME_JUSTIFICATIVA, TX_JUSTIFICATIVA_HTML,                        '+
            ' ME_HABILIDADES_COMPET, TX_HABILIDADES_COMPET_HTML               '+
            'FROM                                                             '+
            '  disciplinas_mestre_ementas                                     '+
            'WHERE                                                            '+
            '	cd_disciplina_pai like '''+qryCursosDisciplinasCD_DISCIPLINA_PAI.AsString+'''';


            qryUpdateEmentas.ExecSQL;
            
            //NOVA PROGRAMAÇÃO AQUI.
         end;
      end;

      if qryCursosDisciplinas.State = dsInsert then
      begin
         qryCursosDisciplinas.Post;
      end;

      
      try
         qryDisciplinasMestra.Post;
      Except
         Mensagem('Não foi possível salvar a disciplina mestra pois já existe uma disciplina mestra com o mesmo código!','Aviso',MB_ICONWARNING);
      end;

   end;

   qryEmentas.EnableControls;
   qryDisciplinasMestra.EnableControls;
   qryCursosDisciplinas.EnableControls;
end;

procedure TfrmDisciplinas.sbBibItalicoClick(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   Application.ProcessMessages;

   if pgcEmentas.ActivePage = tbsBibBasica then
   begin
      RichEdit := dbreBibBasica;
   end
   else
   if pgcEmentas.ActivePage = tbsBibComp then
   begin
      RichEdit := dbreBibComp;
   end
   else
   if pgcEmentas.ActivePage = tbsBibSup then
   begin
      RichEdit := dbreBibSup;
   end
   else
   if pgcEmentas.ActivePage = tbsJustificativa then
   begin
      RichEdit := dbreJustiticativa;
   end
   else
   if pgcEmentas.ActivePage = tbsHabilidadesCompetencias then
   begin
      RichEdit := dbreHabilidadesCompetencias;
   end
   else
   begin
      RichEdit := nil;
   end;

   if Assigned(RichEdit) then
   begin
      if sbBibItalico.Down then
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style + [fsItalic];
      end
      else
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style - [fsItalic];
      end;
   end;
end;

procedure TfrmDisciplinas.sbBibNegritoClick(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   Application.ProcessMessages;

   if pgcEmentas.ActivePage = tbsBibBasica then
   begin
      RichEdit := dbreBibBasica;
   end
   else
   if pgcEmentas.ActivePage = tbsBibComp then
   begin
      RichEdit := dbreBibComp;
   end
   else
   if pgcEmentas.ActivePage = tbsBibSup then
   begin
      RichEdit := dbreBibSup;
   end
   else
   if pgcEmentas.ActivePage = tbsJustificativa then
   begin
      RichEdit := dbreJustiticativa;
   end
   else
   if pgcEmentas.ActivePage = tbsHabilidadesCompetencias then
   begin
      RichEdit := dbreHabilidadesCompetencias;
   end
   else
   begin
      RichEdit := nil;
   end;

   if Assigned(RichEdit) then
   begin
      if sbBibNegrito.Down then
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style + [fsBold];
      end
      else
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style - [fsBold];
      end;
   end;
end;

procedure TfrmDisciplinas.sbBibSublinhadoClick(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   Application.ProcessMessages;

   if pgcEmentas.ActivePage = tbsBibBasica then
   begin
      RichEdit := dbreBibBasica;
   end
   else
   if pgcEmentas.ActivePage = tbsBibComp then
   begin
      RichEdit := dbreBibComp;
   end
   else
   if pgcEmentas.ActivePage = tbsBibSup then
   begin
      RichEdit := dbreBibSup;
   end
   else
   if pgcEmentas.ActivePage = tbsJustificativa then
   begin
      RichEdit := dbreJustiticativa;
   end
   else
   if pgcEmentas.ActivePage = tbsHabilidadesCompetencias then
   begin
      RichEdit := dbreHabilidadesCompetencias;
   end
   else
   begin
      RichEdit := nil;
   end;

   if Assigned(RichEdit) then
   begin
      if sbBibSublinhado.Down then
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style + [fsUnderline];
      end
      else
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style - [fsUnderline];
      end;
   end;
end;

procedure TfrmDisciplinas.sbDiscBuscaClick(Sender: TObject);
const
   SFiltroCodigo = 'CD_DISCIPLINA_PAI = %s';
   SFiltroSigla = 'DS_SIGLA LIKE %s';
   SFiltroDesc = 'DS_DISCIPLINA LIKE %s';
var
   LFiltro, S: string;
begin
   if FResultBusca.Count = 0 then
   begin
      S := edtDiscBusca.Text;

      if rbDiscFiltroCod.Checked then
      begin
         LFiltro := Format(SFiltroCodigo, [QuotedStr(S)]);
      end
      else if rbDiscFiltroSigla.Checked then
      begin
         S := AnsiQuotedStr(S, #42);
         LFiltro := Format(SFiltroSigla, [QuotedStr(S)]);
      end
      else if rbDiscFiltroDesc.Checked then
      begin
         S := AnsiQuotedStr(S, #42);
         LFiltro := Format(SFiltroDesc, [QuotedStr(s)]);
      end;

      edtDiscBusca.Tag := 0;

      qryDisciplinasMestra.DisableControls;
      qryDisciplinasMestra.Filter := LFiltro;
      qryDisciplinasMestra.Filtered := True;
      
      if not qryDisciplinasMestra.IsEmpty then
      begin
         lblResultadoBusca.Font.Color := clGreen;
         lblResultadoBusca.Caption := Format('%d registros encontrados',
            [qryDisciplinasMestra.RecordCount]
         );
         qryDisciplinasMestra.First;
         while not qryDisciplinasMestra.Eof do
         begin
            FResultBusca.Add(qryDisciplinasMestra.GetBookmark);
            qryDisciplinasMestra.Next;
         end;
         qryDisciplinasMestra.GotoBookmark(FResultBusca.Items[0]);
      end
      else
      begin
         lblResultadoBusca.Font.Color := clRed;
         lblResultadoBusca.Caption := 'Nenhum registro encontrado';
      end;

      qryDisciplinasMestra.Filtered := False;      
      qryDisciplinasMestra.EnableControls;
   end
   else
   begin
      edtDiscBusca.Tag := edtDiscBusca.Tag + 1;
      
      if edtDiscBusca.Tag < FResultBusca.Count then
      begin
         qryDisciplinasMestra.GotoBookmark(FResultBusca.Items[edtDiscBusca.Tag]);
      end
      else
      begin
         edtDiscBusca.Tag := 0;
         qryDisciplinasMestra.GotoBookmark(FResultBusca.Items[0]);
      end;
   end;
end;

procedure TfrmDisciplinas.sbDiscDesSelCursosClick(Sender: TObject);
var
   I: Integer;
begin
   clbCursos.Items.BeginUpdate;
   for I := 0 to clbCursos.Count - 1 do
   begin
      if clbCursos.Checked[I] and clbCursos.ItemEnabled[I] then
      begin
         clbCursos.Checked[I] := False;
      end;
   end;
   clbCursos.Items.EndUpdate;
end;

procedure TfrmDisciplinas.sbDiscLimpaClick(Sender: TObject);
begin
   edtDiscBusca.Clear;
   lblResultadoBusca.Caption := '';
   FResultBusca.Clear;
   dbgDisciplinas.Repaint;
end;

procedure TfrmDisciplinas.sbDiscSelCursosClick(Sender: TObject);
var
   I: Integer;
begin
   clbCursos.Items.BeginUpdate;
   for I := 0 to clbCursos.Count - 1 do
   begin
      if not clbCursos.Checked[I] then
      begin
         clbCursos.Checked[I] := True;
      end;
   end;
   clbCursos.Items.EndUpdate;
end;

procedure TfrmDisciplinas.trocarFiltroMensagem;
var
   mensResult: Integer;
begin

   if podeTrocar = False then
   begin
      mensResult := Mensagem('Deseja salvar as alterações antes de trocar o filtro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION);
      
      if mensResult = mrYes then
      begin
         podeTrocar := True;
         btnSalvarClick(self);
      end;
      if mensResult = mrNo then
      begin
         podeTrocar := True;
         btnCancelarClick(self);
      end;
   end;
end;

function TfrmDisciplinas.ValidaCamposDisciplina: Boolean;
const
   SSQLSelectDescDup = ''
      + 'SELECT '
      + '	CD_DISCIPLINA_PAI, '
      + '	DS_DISCIPLINA '
      + 'FROM '
      + '	DISCIPLINAS_MESTRE '
      + 'WHERE '
      + '	DS_DISCIPLINA = ? AND '
      + '	CD_DISCIPLINA_PAI != ? ';

   SMsgDiscDupFmt = ''
      + 'Existe uma disciplina com a mesma descrição cadastrada no sistema'#13
      + #9'Código mestre: %s';
   SMsgCaption = 'Atenção';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   S: AnsiString;
begin
   Stmt := PrepareStatement(SSQLSelectDescDup);
   try
      Stmt.SetString(1, qryDisciplinasMestraDS_DISCIPLINA.AsString);
      Stmt.SetString(2, qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString);
      Rs := Stmt.ExecuteQueryPrepared;
      if Rs.Next then
      begin
         S := Format(SMsgDiscDupFmt, [Rs.GetStringByName('CD_DISCIPLINA_PAI')]);
         MessageBox(Handle, PChar(S), SMsgCaption, MB_ICONWARNING or MB_OK);
         Result := False;
         Exit;
      end;
   finally
      Stmt.Close;
   end;
   if qryDisciplinasMestraDS_SIGLA.AsString = '' then
   begin
      Result := False;
      MessageDlg('É obrigatório preencher a sigla da disciplina', mtInformation, [mbOK], -1);
   end
   else if qryDisciplinasMestraDS_DISCIPLINA.AsString = '' then
   begin
      Result := False;
      MessageDlg('É obrigatório preencher a descrição da disciplina', mtInformation, [mbOK], -1);
   end
   else
   begin
      Result := True;
   end;
end;

function TfrmDisciplinas.verifica_cursos_disciplinas: Boolean;
begin
   qry_verifica_cursos_disciplinas.Close();

   // Filtra pela coligada
   qry_verifica_cursos_disciplinas.SQL.Text := Format(
      qry_verifica_cursos_disciplinas.SQL.Text,
      [DM.UsuarioLogado.GetColigadasFilhaSelecionada]
   );

   qry_verifica_cursos_disciplinas.ParamByName('CD_DISCIPLINA_PAI').AsString := qryDisciplinasMestraCD_DISCIPLINA_PAI.AsString;
   qry_verifica_cursos_disciplinas.Open();

   if ( qry_verifica_cursos_disciplinas.FieldByName('has_disciplinas_curso').AsInteger > 0 ) then
   begin
      qry_verifica_cursos_disciplinas.Close();
      Result := true;
      Exit;
   end;

   Result := false;
end;

end.

