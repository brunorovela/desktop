unit UFDisciplinasSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, StdCtrls, UMComboBox,
  Buttons, ComCtrls, Tabs;

type
   TfrmDisciplinasSelecao = class(TForm)
      bbtnFiltrar: TBitBtn;
      bbtnLimpar: TBitBtn;
      bvlSep1: TBevel;
      cbCursos: TUMComboBox;
      cbDepto: TUMComboBox;
      cbDisciplinas: TUMComboBox;
      cbUnidades: TUMComboBox;
      lblCurso: TLabel;
      lblDepto: TLabel;
      lblDisciplina: TLabel;
      lblUnidade: TLabel;
      pgcOpcoes: TPageControl;
      pnlDisciplinas: TPanel;
      pnlFiltros: TPanel;
      qryCursos: TUMZReadOnlyQuery;
      qryCursosCD_COLIGADA: TSmallintField;
      qryCursosCD_CURSO: TStringField;
      qryCursosCD_DEPTO: TSmallintField;
      qryCursosDS_CURSO: TStringField;
      qryDepto: TUMZReadOnlyQuery;
      qryDeptoCD_COLIGADA: TIntegerField;
      qryDeptoCD_DEPTO: TSmallintField;
      qryDeptoNM_DEPTO: TStringField;
      qryDiscFiltro: TUMZReadOnlyQuery;
      qryDiscFiltroDS_DISCIPLINA: TStringField;
      qryDisciplinas: TUMZReadOnlyQuery;
      qryDisciplinasCD_CURSO: TStringField;
      qryDisciplinasCD_DISCIPLINA: TIntegerField;
      qryDisciplinasCD_DISCIPLINA_PAI: TStringField;
      qryDisciplinasDS_DISCIPLINA: TStringField;
      qryDisciplinasDS_DISCIPLINA_DISPLAY: TStringField;
      qryDisciplinasDS_DISCIPLINA_MESTRE: TStringField;
      qryDisciplinasDS_DISCIPLINA_MESTRE_DISPLAY: TStringField;
      qryDisciplinasDS_SIGLA: TStringField;
      qryDisciplinasDS_SIGLA_MESTRE: TStringField;
      qryUnidades: TUMZReadOnlyQuery;
      qryUnidadesCD_COLIGADA: TIntegerField;
      qryUnidadesNM_COLIGADA: TStringField;
      tbsCurso: TTabSheet;
      tbsDisciplinaMestre: TTabSheet;
      tsOpcoes: TTabSet;
      tvCurso: TTreeView;
      tvMestre: TTreeView;
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure bbtnLimparClick(Sender: TObject);
      procedure cbCursosExit(Sender: TObject);
      procedure cbDeptoExit(Sender: TObject);
      procedure cbUnidadesExit(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure qryDisciplinasCalcFields(DataSet: TDataSet);
      procedure tsOpcoesChange(Sender: TObject; NewTab: Integer;
         var AllowChange: Boolean);
      procedure tvCursoDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure tvMestreDragDrop(Sender, Source: TObject; X, Y: Integer);
   private
      function GetSelectedRecords: TList;
      procedure ApplyFilters;
      procedure LoadGroupByCurso;
      procedure LoadGroupByMestre;
      procedure LoadFilter(const DisplayField: AnsiString; DataSet: TDataSet;
         ComboBox: TComboBox);
      procedure LoadFilters;
      procedure RefreshFilters;
   public
      property SelectedRecords: TList read GetSelectedRecords;
   end;

var
   frmDisciplinasSelecao: TfrmDisciplinasSelecao;

implementation

{$R *.dfm}

{ TfrmDisciplinasSelecao }

procedure TfrmDisciplinasSelecao.ApplyFilters;
const
   SSQLDisciplinas =
      'SELECT DISTINCT ' +
         'D.`CURSO` `CD_CURSO`,' +
         'D.`SIGLA` `DS_SIGLA`,' +
         'D.`DESCRICAO` `DS_DISCIPLINA`,' +
         'D.`CODIGO` `CD_DISCIPLINA`,' +
         'M.`DS_DISCIPLINA` `DS_DISCIPLINA_MESTRE`,' +
         'M.`DS_SIGLA` `DS_SIGLA_MESTRE`,' +
         'D.`CD_DISCIPLINA_PAI` ' +
      'FROM ' +
         '`DISCIPLINAS` D ' +
            'JOIN `CURSOS_MESTRE` C ON ' +
               '(D.`CURSO` = C.`CD_CURSO`) ' +
            'JOIN `DISCIPLINAS_MESTRE` M ON ' +
               '(D.`CD_DISCIPLINA_PAI` = M.`CD_DISCIPLINA_PAI`) ' +
      'WHERE ' +
         'EXISTS ( ' +
            'SELECT ' +
               'C.`CD_CURSO` ' +
            'FROM ' +
               '`CURSOS_MESTRE` C ' +
            'WHERE ' +
               'C.`CD_CURSO` = D.`CURSO` AND ' +
               'C.`SN_ATIVO` = ''S''' +
         ')%s';
   SFilterUnidade = 'EXISTS (SELECT CC.`CD_COLIGADA` FROM `CURSOS_COLIGADAS` CC WHERE CC.`CD_COLIGADA` = :CD_COLIGADA AND CC.`CD_CURSO` = D.`CURSO`)';
   SFilterUnidadeDepto = 'EXISTS (SELECT CC.`CD_COLIGADA` FROM `CURSOS_COLIGADAS` CC WHERE CC.`CD_COLIGADA` = :CD_COLIGADA AND CC.`CD_DEPTO` = :CD_DEPTO AND CC.`CD_CURSO` = D.`CURSO`)';
   SFilterDepto = 'EXISTS (SELECT CC.`CD_COLIGADA` FROM `CURSOS_COLIGADAS` CC WHERE CC.`CD_DEPTO` = :CD_DEPTO AND CC.`CD_CURSO` = D.`CURSO`)';
   SFilterCurso = 'D.`CURSO` = :CD_CURSO';
   SFilterDisc = 'D.`DESCRICAO` LIKE :DS_DISCIPLINA';
   SFilter = '%s AND %s';
   SFilterLike = '%%%s%%';
var
   Params: TParams;
   Filters: TStrings;
   Bookmark: TBookmark;
   I: Integer;
   S: AnsiString;
begin
   Filters := TStringList.Create;
   Params := TParams.Create;
   try

      if (cbUnidades.ItemIndex > -1) and (cbDepto.ItemIndex = -1) then
      begin
         Filters.Add(SFilterUnidade);
         I := cbUnidades.ItemIndex;
         Bookmark := cbUnidades.Items.Objects[I];
         qryUnidades.GotoBookmark(Bookmark);
         Params.CreateParam(ftUnknown, 'CD_COLIGADA', ptUnknown).AsInteger :=
            qryUnidadesCD_COLIGADA.AsInteger;
      end;

      if (cbUnidades.ItemIndex > -1) and (cbDepto.ItemIndex > -1) then
      begin
         Filters.Add(SFilterUnidadeDepto);

         I := cbUnidades.ItemIndex;
         Bookmark := cbUnidades.Items.Objects[I];
         qryUnidades.GotoBookmark(Bookmark);
         Params.CreateParam(ftUnknown, 'CD_COLIGADA', ptUnknown).AsInteger :=
            qryUnidadesCD_COLIGADA.AsInteger;

         I := cbDepto.ItemIndex;
         Bookmark := cbDepto.Items.Objects[I];
         qryDepto.GotoBookmark(Bookmark);
         Params.CreateParam(ftUnknown, 'CD_DEPTO', ptUnknown).AsInteger :=
            qryDeptoCD_DEPTO.AsInteger;
      end;

      if (cbUnidades.ItemIndex = -1) and (cbDepto.ItemIndex > -1) then
      begin
         Filters.Add(SFilterDepto);
         I := cbDepto.ItemIndex;
         Bookmark := cbDepto.Items.Objects[I];
         qryDepto.GotoBookmark(Bookmark);
         Params.CreateParam(ftUnknown, 'CD_DEPTO', ptUnknown).AsInteger :=
            qryDeptoCD_DEPTO.AsInteger;
      end;

      if cbCursos.ItemIndex > -1 then
      begin
         Filters.Add(SFilterCurso);
         I :=  cbCursos.ItemIndex;
         Bookmark := cbCursos.Items.Objects[I];
         qryCursos.GotoBookmark(Bookmark);
         Params.CreateParam(ftUnknown, 'CD_CURSO', ptUnknown).AsString :=
            qryCursosCD_CURSO.AsString;
      end;

      if cbDisciplinas.Text <> EmptyStr then
      begin
         Filters.Add(SFilterDisc);
         Params.CreateParam(ftUnknown, 'DS_DISCIPLINA', ptUnknown).AsString :=
            Format(SFilterLike, [cbDisciplinas.Text]);
      end;

      S := EmptyStr;
      qryDisciplinas.Close;

      if Filters.Count > 0 then
         for I := 0 to Filters.Count - 1 do
            S := Format(SFilter, [S, Filters[I]]);

      qryDisciplinas.SQL.Text := Format(SSQLDisciplinas, [S]);

      for I := 0 to Params.Count - 1 do
         qryDisciplinas.ParamByName(Params.Items[I].Name).Value :=
            Params.Items[I].Value;

      qryDisciplinas.Open;

      LoadGroupByCurso;
      LoadGroupByMestre;

   finally
      Filters.Free;
      Params.Free;
   end;
end;

procedure TfrmDisciplinasSelecao.bbtnFiltrarClick(Sender: TObject);
begin
   ApplyFilters;
end;

procedure TfrmDisciplinasSelecao.bbtnLimparClick(Sender: TObject);
const
   SSQLDisciplinas =
      'SELECT DISTINCT ' +
         'D.`DESCRICAO` `DS_DISCIPLINA` ' +
      'FROM ' +
         '`DISCIPLINAS` D ' +
      'WHERE ' +
	      'EXISTS ( ' +
		      'SELECT ' +
			      'CC.`CD_CURSO` ' +
		      'FROM ' +
			      '`CURSOS_COLIGADAS` CC ' +
		      'WHERE ' +
			      'D.`CURSO` = CC.`CD_CURSO` AND ' +
			      'CC.`SN_ATIVO` = 1' +
	   ')';
begin
   qryUnidades.Filtered := False;
   qryDepto.Filtered := False;
   qryCursos.Filtered := False;
   qryDiscFiltro.Tag := 0;
   qryDiscFiltro.Close;
   qryDiscFiltro.SQL.Text := SSQLDisciplinas;
   LoadFilter('NM_COLIGADA', qryUnidades, cbUnidades);
   LoadFilter('NM_DEPTO', qryDepto, cbDepto);
   LoadFilter('DS_CURSO', qryCursos, cbCursos);
   LoadFilter('DS_DISCIPLINA', qryDiscFiltro, cbDisciplinas);
end;

procedure TfrmDisciplinasSelecao.cbCursosExit(Sender: TObject);
begin
   RefreshFilters;
end;

procedure TfrmDisciplinasSelecao.cbDeptoExit(Sender: TObject);
begin
   RefreshFilters;
end;

procedure TfrmDisciplinasSelecao.cbUnidadesExit(Sender: TObject);
begin
   RefreshFilters;
end;

procedure TfrmDisciplinasSelecao.FormCreate(Sender: TObject);
begin
   LoadFilters;
end;

procedure TfrmDisciplinasSelecao.FormDestroy(Sender: TObject);
begin
   qryDisciplinas.Close;
   qryUnidades.Close;
   qryDepto.Close;
   qryCursos.Close;
   qryDiscFiltro.Close;
   frmDisciplinasSelecao := nil;
end;

function TfrmDisciplinasSelecao.GetSelectedRecords: TList;
var
   SelectedNode: TTreeNode;
   I: Integer;
begin
   Result := TList.Create;

   if pgcOpcoes.ActivePageIndex = 0 then
      SelectedNode := tvCurso.Selected;

   if pgcOpcoes.ActivePageIndex = 1 then
      SelectedNode := tvMestre.Selected;

   if SelectedNode.Parent = nil then
   begin
      for I := 0 to SelectedNode.Count - 1 do
      begin
         Result.Add(SelectedNode.Item[I].Data);
      end;
   end;

   if SelectedNode.Parent <> nil then
      Result.Add(SelectedNode.Data);
end;

procedure TfrmDisciplinasSelecao.LoadFilter(const DisplayField: AnsiString;
  DataSet: TDataSet; ComboBox: TComboBox);
var
   S: AnsiString;
   Bookmark: TBookmark;
begin
   if not DataSet.Active then
      DataSet.Open;

   DataSet.DisableControls;
   DataSet.First;

   ComboBox.Items.BeginUpdate;
   ComboBox.Clear;

   while not DataSet.Eof do
   begin
      S := DataSet.FieldByName(DisplayField).AsString;
      Bookmark := DataSet.GetBookmark;
      ComboBox.AddItem(S, Bookmark);
      DataSet.Next;
   end;

   DataSet.EnableControls;

   ComboBox.Items.EndUpdate;
end;

procedure TfrmDisciplinasSelecao.LoadFilters;
begin
   LoadFilter('NM_COLIGADA', qryUnidades, cbUnidades);
   LoadFilter('NM_DEPTO', qryDepto, cbDepto);
   LoadFilter('DS_CURSO', qryCursos, cbCursos);
   LoadFilter('DS_DISCIPLINA', qryDisciplinas, cbDisciplinas);
end;

procedure TfrmDisciplinasSelecao.LoadGroupByCurso;
var
   PreviousID, CurrentID, DisplayValue: AnsiString;
   ParentNode: TTreeNode;
   Bookmark: TBookmark;
begin
   qryDisciplinas.SortedFields := 'CD_CURSO;DS_DISCIPLINA';
   qryDisciplinas.SortType := stAscending;
   qryDisciplinas.First;

   tvCurso.Items.BeginUpdate;
   tvCurso.Items.Clear;

   PreviousID := EmptyStr;

   while not qryDisciplinas.Eof do
   begin
      Bookmark := qryDisciplinas.GetBookmark;

      CurrentID := qryDisciplinasCD_CURSO.AsString;

      if CurrentID <> PreviousID then
      begin
         DisplayValue := qryDisciplinasCD_CURSO.AsString;
         ParentNode := tvCurso.Items.AddObject(tvCurso.TopItem, DisplayValue,
            Bookmark);
         PreviousID := CurrentID;
      end;

      DisplayValue := qryDisciplinasDS_DISCIPLINA_DISPLAY.AsString;
      tvCurso.Items.AddChildObject(ParentNode, DisplayValue, Bookmark);

      qryDisciplinas.Next;
   end;

   tvCurso.Items.EndUpdate;
end;

procedure TfrmDisciplinasSelecao.LoadGroupByMestre;
var
   PrevMestreID, CurrMestreID, DisplayValue: AnsiString;
   PrevDiscID, CurrDiscID: Integer;
   ParentNode: TTreeNode;
   Bookmark: TBookmark;
begin
   qryDisciplinas.SortedFields := 'DS_DISCIPLINA_MESTRE;CD_DISCIPLINA_PAI;DS_DISCIPLINA;CD_DISCIPLINA';
   qryDisciplinas.SortType := stAscending;
   qryDisciplinas.First;

   tvMestre.Items.BeginUpdate;
   tvMestre.Items.Clear;

   PrevMestreID := EmptyStr;
   PrevDiscID := -1;

   while not qryDisciplinas.Eof do
   begin
      Bookmark := qryDisciplinas.GetBookmark;

      CurrMestreID := qryDisciplinasCD_DISCIPLINA_PAI.AsString;

      if CurrMestreID <> PrevMestreID then
      begin
         DisplayValue := qryDisciplinasDS_DISCIPLINA_MESTRE_DISPLAY.AsString;
         ParentNode := tvMestre.Items.AddObject(tvMestre.TopItem, DisplayValue,
            Bookmark);
         PrevMestreID := CurrMestreID;
         PrevDiscID := -1;
      end;

      CurrDiscID := qryDisciplinasCD_DISCIPLINA.AsInteger;

      if CurrDiscID <> PrevDiscID then
      begin
         DisplayValue := qryDisciplinasDS_DISCIPLINA_DISPLAY.AsString;
         tvMestre.Items.AddChildObject(ParentNode, DisplayValue, Bookmark);
         PrevDiscID := CurrDiscID;
      end;

      qryDisciplinas.Next;
   end;

   tvMestre.Items.EndUpdate;
end;

procedure TfrmDisciplinasSelecao.qryDisciplinasCalcFields(DataSet: TDataSet);
const
   SFormatDisplayDisc = '%s - %s (%s) - %s';
   SFormatDisplayMestre = '%s - %s (%s)';
begin
   if DataSet.State = dsCalcFields then
   begin
      DataSet.FieldByName('DS_DISCIPLINA_DISPLAY').AsString :=
         Format(SFormatDisplayDisc, [
            DataSet.FieldByName('CD_DISCIPLINA').DisplayText,
            DataSet.FieldByName('DS_DISCIPLINA').AsString,
            DataSet.FieldByName('DS_SIGLA').AsString,
            DataSet.FieldByName('CD_CURSO').AsString
         ]);

      DataSet.FieldByName('DS_DISCIPLINA_MESTRE_DISPLAY').AsString :=
         Format(SFormatDisplayMestre, [
            DataSet.FieldByName('CD_DISCIPLINA_PAI').AsString,
            DataSet.FieldByName('DS_DISCIPLINA_MESTRE').AsString,
            DataSet.FieldByName('DS_SIGLA_MESTRE').AsString
         ]);
   end;
end;

procedure TfrmDisciplinasSelecao.RefreshFilters;

   function BuildFilter(Filters: TStrings): AnsiString;
   const
      SOp = ' AND ';
      SFilterFmt = '%s%s';
   var
      I: Integer;
   begin
      Result := EmptyStr;
      for I := 0 to Filters.Count - 1 do
      begin
         if Result <> EmptyStr then
            Result := Format(SFilterFmt, [Result, SOp]);

         Result := Format(SFilterFmt, [Result, Filters[I]]);
      end;
   end;

const
   SSQLDisciplinas =
      'SELECT DISTINCT ' +
         'D.`DESCRICAO` `DS_DISCIPLINA` ' +
      'FROM ' +
         '`DISCIPLINAS` D ' +
      'WHERE ' +
	      'EXISTS ( ' +
		      'SELECT ' +
			      'CC.`CD_CURSO` ' +
		      'FROM ' +
			      '`CURSOS_COLIGADAS` CC ' +
		      'WHERE ' +
			      'D.`CURSO` = CC.`CD_CURSO` AND ' +
			      'CC.`SN_ATIVO` = 1%s%s' +
	   ')';

   SFilterColigadaFmt = 'CD_COLIGADA = %d';
   SFilterDeptoFmt = 'CD_DEPTO = %d';
   SFilterCursoFmt = 'CD_CURSO = %s';
   SOp = ' AND ';
var
   Bookmark: TBookmark;
   Filters: TStrings;
   I: Integer;
   S: AnsiString;
begin
   Filters := TStringList.Create;
   try

      I := cbUnidades.ItemIndex;

      if (I = -1) and qryDepto.Filtered then
      begin
         qryDepto.Filtered := False;
         LoadFilter('NM_DEPTO', qryDepto, cbDepto);
      end;

      if I > -1 then
      begin
         Bookmark := cbUnidades.Items.Objects[I];
         qryUnidades.GotoBookmark(Bookmark);
         I := qryUnidadesCD_COLIGADA.AsInteger;
         S := Format(SFilterColigadaFmt, [I]);
         Filters.Add(S);

         S := BuildFilter(Filters);

         if (qryDepto.Filter <> S) or (not qryDepto.Filtered) then
         begin
            qryDepto.Filter := S;
            qryDepto.Filtered := True;
            LoadFilter('NM_DEPTO', qryDepto, cbDepto);
         end;
      end;

      I := cbDepto.ItemIndex;

      if I > -1 then
      begin
         Bookmark := cbDepto.Items.Objects[I];
         qryDepto.GotoBookmark(Bookmark);
         I := qryDeptoCD_DEPTO.AsInteger;
         S := Format(SFilterDeptoFmt, [I]);
         Filters.Add(S);
      end;

      if (Filters.Count = 0) and qryCursos.Filtered then
      begin
         qryCursos.Filtered := False;
         LoadFilter('DS_CURSO', qryCursos, cbCursos);
      end;

      if Filters.Count > 0 then
      begin
         S := BuildFilter(Filters);

         if (qryCursos.Filter <> S) or (not qryCursos.Filtered) then
         begin
            qryCursos.Filter := S;
            qryCursos.Filtered := True;
            LoadFilter('DS_CURSO', qryCursos, cbCursos);
         end;
      end;

      I := cbCursos.ItemIndex;

      if I > -1 then
      begin
         Bookmark := cbCursos.Items.Objects[I];
         qryCursos.GotoBookmark(Bookmark);
         S := QuotedStr(qryCursosCD_CURSO.AsString);
         S := Format(SFilterCursoFmt, [S]);
         Filters.Add(S);
      end;

      if (Filters.Count = 0) and (qryDiscFiltro.Tag = 1) then
      begin
         qryDiscFiltro.Tag := 0;
         qryDiscFiltro.SQL.Text := Format(SSQLDisciplinas, [EmptyStr, EmptyStr]);
         qryDiscFiltro.Close;
         LoadFilter('DS_DISCIPLINA', qryDiscFiltro, cbDisciplinas);
      end;

      if Filters.Count > 0 then
      begin
         S := BuildFilter(Filters);

         if (qryDiscFiltro.Filter <> S) or (qryDiscFiltro.Tag = 0) then
         begin
            qryDiscFiltro.Filter := S;
            qryDiscFiltro.Tag := 1;
            qryDiscFiltro.SQL.Text := Format(SSQLDisciplinas, [SOp, S]);
            qryDiscFiltro.Close;
            LoadFilter('DS_DISCIPLINA', qryDiscFiltro, cbDisciplinas);
         end;
      end;

   finally
      Filters.Free;
   end;
end;

procedure TfrmDisciplinasSelecao.tsOpcoesChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
   pgcOpcoes.ActivePageIndex := NewTab;
   pgcOpcoes.ActivePage.SetFocus;
end;

procedure TfrmDisciplinasSelecao.tvCursoDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   TTreeView(Sender).BeginDrag(True);
end;

procedure TfrmDisciplinasSelecao.tvMestreDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   TTreeView(Sender).BeginDrag(True);
end;

end.
