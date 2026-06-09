unit UFLGTCDespesas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ToolWin, ComCtrls, Grids, DBGrids, DB, DBClient,
   UZSortedGrid, ZAbstractRODataset, UZDataset, uUsuario, Provider, Contnrs,
   ZAbstractDataset, UDBGrids, ZSqlUpdate, Menus;

type
   TfrmLGTCDespesas = class(TForm)
      btnAlterar: TToolButton;
      btnCompromissos: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnFiltrar: TToolButton;
      btnIncluir: TToolButton;
      btnLimparFiltros: TToolButton;
      btnSelecionarColunas: TToolButton;
      btnSelecionarNenhum: TToolButton;
      btnSelecionarTodos: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnSep3: TToolButton;
      btnSep4: TToolButton;
      btnSep5: TToolButton;
      btnSep6: TToolButton;
      btnSituacao: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      cdsDespesas: TClientDataSet;
      cdsDespesasCD_DESPESA: TLargeintField;
      cdsDespesasCD_DIARIO_AULA: TLargeintField;
      cdsDespesasCD_DISCIPLINA: TIntegerField;
      cdsDespesasCD_FORNECEDOR: TIntegerField;
      cdsDespesasCD_PROFESSOR: TIntegerField;
      cdsDespesasCD_SITUACAO: TLargeintField;
      cdsDespesasCD_TIPO_DESPESA: TLargeintField;
      cdsDespesasCD_TURMA: TStringField;
      cdsDespesasDESCRICAO: TStringField;
      cdsDespesasDS_CONTA: TStringField;
      cdsDespesasDS_CURSO: TStringField;
      cdsDespesasDS_DISCIPLINA: TStringField;
      cdsDespesasDS_ESTADO: TStringField;
      cdsDespesasDS_MUNICIPIO: TStringField;
      cdsDespesasDS_SITUACAO: TStringField;
      cdsDespesasDS_TIPO_DESPESA: TStringField;
      cdsDespesasDT_ALTERACAO: TDateTimeField;
      cdsDespesasDT_AULA: TDateTimeField;
      cdsDespesasDT_CADASTRO: TDateTimeField;
      cdsDespesasDT_COMPROMISSO: TDateTimeField;
      cdsDespesasID_DISCIPLINA: TLargeintField;
      cdsDespesasME_JSON_VALOR: TMemoField;
      cdsDespesasNM_COLIGADA: TStringField;
      cdsDespesasNM_PESSOA: TStringField;
      cdsDespesasNM_PROFESSOR: TStringField;
      cdsDespesasNR_ANOSEMESTRE: TSmallintField;
      cdsDespesasNR_AULA: TSmallintField;
      cdsDespesasNR_ETAPA: TSmallintField;
      cdsDespesasNR_SELECAO: TIntegerField;
      cdsDespesasSN_SELECIONADO: TBooleanField;
      cdsDespesasSUM_SELECIONADO: TAggregateField;
      cdsDespesasSUM_TOTAL: TAggregateField;
      cdsDespesasSUM_TOTAL_SELECIONADO: TAggregateField;
      cdsDespesasVL_TOTAL: TFloatField;
      dbgDespesas: TSortedDBGrid;
      dsDespesas: TDataSource;
      dspDespesas: TDataSetProvider;
      ilAcoes: TImageList;
      pmSituacoes: TPopupMenu;
      pnlTitulo: TPanel;
      qryDespesas: TUMZQuery;
      qryDespesasCD_DESPESA: TLargeintField;
      qryDespesasCD_DIARIO_AULA: TLargeintField;
      qryDespesasCD_DISCIPLINA: TIntegerField;
      qryDespesasCD_FORNECEDOR: TIntegerField;
      qryDespesasCD_PROFESSOR: TIntegerField;
      qryDespesasCD_SITUACAO: TLargeintField;
      qryDespesasCD_TIPO_DESPESA: TLargeintField;
      qryDespesasCD_TURMA: TStringField;
      qryDespesasDESCRICAO: TStringField;
      qryDespesasDS_CONTA: TStringField;
      qryDespesasDS_CURSO: TStringField;
      qryDespesasDS_DISCIPLINA: TStringField;
      qryDespesasDS_ESTADO: TStringField;
      qryDespesasDS_MUNICIPIO: TStringField;
      qryDespesasDS_SITUACAO: TStringField;
      qryDespesasDS_TIPO_DESPESA: TStringField;
      qryDespesasDT_ALTERACAO: TDateTimeField;
      qryDespesasDT_AULA: TDateTimeField;
      qryDespesasDT_CADASTRO: TDateTimeField;
      qryDespesasDT_COMPROMISSO: TDateTimeField;
      qryDespesasID_DISCIPLINA: TLargeintField;
      qryDespesasME_JSON_VALOR: TMemoField;
      qryDespesasNM_COLIGADA: TStringField;
      qryDespesasNM_PESSOA: TStringField;
      qryDespesasNM_PROFESSOR: TStringField;
      qryDespesasNR_ANOSEMESTRE: TSmallintField;
      qryDespesasNR_AULA: TSmallintField;
      qryDespesasNR_ETAPA: TSmallintField;
      qryDespesasVL_TOTAL: TFloatField;
      qrySituacao: TUMZReadOnlyQuery;
      qrySituacaoCD_SITUACAO: TLargeintField;
      qrySituacaoDS_CHAVE: TStringField;
      qrySituacaoDS_COR: TStringField;
      qrySituacaoDS_SITUACAO: TStringField;
      qrySituacaoFluxo: TUMZReadOnlyQuery;
      qrySituacaoFluxoCD_SITUACAO_DESTINO: TLargeintField;
      qrySituacaoFluxoCD_SITUACAO_FLUXO: TLargeintField;
      qrySituacaoFluxoCD_SITUACAO_ORIGEM: TLargeintField;
      stbStatus: TStatusBar;
      tlbAcoes: TToolBar;
      updDespesas: TZUpdateSQL;
      procedure btnAlterarClick(Sender: TObject);
      procedure btnCompromissosClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnLimparFiltrosClick(Sender: TObject);
      procedure btnSelecionarColunasClick(Sender: TObject);
      procedure btnSelecionarNenhumClick(Sender: TObject);
      procedure btnSelecionarTodosClick(Sender: TObject);
      procedure cdsDespesasAfterOpen(DataSet: TDataSet);
      procedure cdsDespesasCalcFields(DataSet: TDataSet);
      procedure dbgDespesasCellClick(Column: TColumn);
      procedure dbgDespesasDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsDespesasStateChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure pmSituacoesPopup(Sender: TObject);
      procedure qryDespesasBeforeDelete(DataSet: TDataSet);
   private
      FPermissoes: TUMPermissoes;
   public
      procedure FiltraAula(const ID: Int64);
      procedure SituacaoMenuItemClick(Sender: TObject);
      procedure UpdateStatusBar;
      property Permissoes: TUMPermissoes read FPermissoes;
   end;

var
   frmLGTCDespesas: TfrmLGTCDespesas;

implementation

uses
   UFLGTCDespesasFiltrar, UFLGTCDespesasAula, uCamposPlanilhas, uDM, uLkJSON,
  uIUMDataModule;

{$R *.dfm}

const
   Modulo = 2102;

procedure TfrmLGTCDespesas.btnAlterarClick(Sender: TObject);
begin
   Application.CreateForm(TfrmLGTCDespesasAula, frmLGTCDespesasAula);

   if frmLGTCDespesasAula.Edit(
      cdsDespesasCD_DIARIO_AULA.AsLargeInt,
      cdsDespesasCD_DESPESA.AsLargeInt) = mrOk then

      cdsDespesas.Refresh;
end;

procedure TfrmLGTCDespesas.btnCompromissosClick(Sender: TObject);
const
   MsgDesenvolvimento = 'Recurso em fase de desenvolvimento.';
begin
   MessageDlg(MsgDesenvolvimento, mtInformation, [mbOK], 0);
end;

procedure TfrmLGTCDespesas.btnExcluirClick(Sender: TObject);
const
   SMsgSemRegistroSelecionado = 'É necessário selecionar os registros que deseja-se excluir.';
   SMsgConfirmaExclusao = 'Tem certeza que deseja excluir os %u registros selecionados? Esta operação não poderá ser revertida!';
var
   S: AnsiString;
   I: Integer;
begin
   if not TryStrToInt(cdsDespesasSUM_SELECIONADO.AsString, I) then
      I := 0;

   if I = 0 then
   begin
      MessageDlg(SMsgSemRegistroSelecionado, mtInformation, [mbOK], 0);
      Exit;
   end;

   S := Format(SMsgConfirmaExclusao, [I]);

   if MessageDlg(S, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      cdsDespesas.DisableControls;
      cdsDespesas.Filter := 'SN_SELECIONADO';
      cdsDespesas.Filtered := True;
      
      while not cdsDespesas.IsEmpty do
         cdsDespesas.Delete;
         
      cdsDespesas.ApplyUpdates(0);
      cdsDespesas.Filtered := False;
      cdsDespesas.EnableControls;
   end;
end;

procedure TfrmLGTCDespesas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLGTCDespesas.btnFiltrarClick(Sender: TObject);
const
   SSQLDespesas =
      'SELECT ' +
         'D.`CD_DESPESA`,' +
         'D.`CD_TIPO_DESPESA`,' +
         'D.`CD_DIARIO_AULA`,' +
         'D.`CD_SITUACAO`,' +
         'D.`CD_FORNECEDOR`,' +
         'D.`DT_COMPROMISSO`,' +
         'D.`VL_TOTAL`,' +
         'D.`ME_JSON_VALOR`,' +
         'D.`DT_CADASTRO`,' +
         'D.`DT_ALTERACAO`,' +
         'T.`DS_TIPO_DESPESA`,' +
         'C.`DS_CONTA`,' +
         'S.`DS_SITUACAO`,' +
         'A.`TURMA` `CD_TURMA`,' +
         'A.`ANOSEMESTRE` `NR_ANOSEMESTRE`,' +
         'A.`DISCIPLINA` `CD_DISCIPLINA`,' +
         'A.`BIMESTRE` `NR_ETAPA`,' +
         'A.`NRO_AULA` `NR_AULA`,' +
         'A.`DATA` `DT_AULA`,' +
         'A.`CD_PROFESSOR`,' +
         'M.`DS_CURSO`,' +
         'I.`DESCRICAO` `DS_DISCIPLINA`,' +
         'P.`NM_PESSOA`,' +
         'I.`ID_DISCIPLINA`,' +
         'R.`NM_PESSOA` `NM_PROFESSOR`,' +
         'O.`NM_COLIGADA`,' +
         'E.`DESCRICAO`,' +
         'N.`DS_MUNICIPIO`,' +
         'O.`DS_ESTADO` ' +
      'FROM ' +
        '`LGTC_DESPESA_AULA` D ' +
          'JOIN `LGTC_TIPO_DESPESA` T ON ' +
            '(D.`CD_TIPO_DESPESA` = T.`CD_TIPO_DESPESA`) ' +
          'JOIN `FIN_CONFIG_PLANO_CONTAS` C ON ' +
            '(D.`CD_CONTA` = C.`CD_CONTA`) AND ' +
            '(D.`CD_COLIGADA_MATRIZ` = C.`CD_COLIGADA_MATRIZ`) ' +
          'JOIN `LGTC_DESPESA_SITUACAO` S ON ' +
            '(D.`CD_SITUACAO` = S.`CD_SITUACAO`) ' +
          'JOIN `PESSOAS` P ON ' +
            '(D.`CD_FORNECEDOR` = P.`CD_PESSOA`) ' +
          'JOIN `DIARIO_AULAS` A ON ' +
            '(D.`CD_DIARIO_AULA` = A.`CD_DIARIO_AULA`) ' +
            'JOIN `PESSOAS` R ON ' +
              '(A.`CD_PROFESSOR` = R.`CD_PESSOA`) ' +
            'JOIN `TURMAS` U ON ' +
              '(A.`TURMA` = U.`CODIGO`) AND ' +
              '(A.`ANOSEMESTRE` = U.`ANOSEMESTRE`) ' +
              'JOIN `CURSOS_MESTRE` M ON ' +
                '(U.`CURSO` = M.`CD_CURSO`) ' +
              'JOIN `COLIGADAS` O ON ' +
                '(U.`CD_COLIGADA` = O.`CD_COLIGADA`) ' +
                'LEFT JOIN `MUNICIPIOS` N ON ' +
                  '(O.`CD_MUNICIPIO` = N.`CD_MUNICIPIO`) ' +
                'JOIN `CURSOS_COLIGADAS` CC ON ' +
                  '(M.`CD_CURSO` = CC.`CD_CURSO`) AND ' +
                  '(O.`CD_COLIGADA` = CC.`CD_COLIGADA`) ' +
                  'JOIN `DEPARTAMENTOS` E ON ' +
                    '(CC.`CD_DEPTO` = E.`CODIGO`) ' +
              'JOIN `DISCIPLINAS` I ON ' +
                '(A.`DISCIPLINA` = I.`CODIGO`) AND ' +
                '(U.`CURSO` = I.`CURSO`) %s';
   SSQLWhere = 'WHERE %s';
var
   I: Integer;
   SQL, Filters: AnsiString;
   Params: TParams;
begin
   if frmLGTCDespesasFiltrar = nil then
      Application.CreateForm(TfrmLGTCDespesasFiltrar, frmLGTCDespesasFiltrar);
   
   if frmLGTCDespesasFiltrar.ShowModal = mrOk then
   begin
      Params := frmLGTCDespesasFiltrar.Params;
      try
         Filters := frmLGTCDespesasFiltrar.SQLExpression;

         if Filters = EmptyStr then
            SQL := Format(SSQLDespesas, [EmptyStr]);

         if Filters <> EmptyStr then
         begin
            SQL := Format(SSQLDespesas, [SSQLWhere]);
            SQL := Format(SQL, [Filters]);
         end;

         cdsDespesas.DisableControls;
         cdsDespesas.Close;
         qryDespesas.SQL.Text := SQL;
         cdsDespesas.FetchParams;

         for I := 0 to Params.Count - 1 do
         begin
            cdsDespesas.Params.ParamByName(Params.Items[I].Name).Value := Params.Items[I].Value;
         end;

         cdsDespesas.Open;
         cdsDespesas.EnableControls;
         
      finally
         Params := nil;
      end;
   end;
end;

procedure TfrmLGTCDespesas.btnIncluirClick(Sender: TObject);
begin
   Application.CreateForm(TfrmLGTCDespesasAula, frmLGTCDespesasAula);

   if frmLGTCDespesasAula.ShowModal = mrOk then
   begin
      FiltraAula(frmLGTCDespesasAula.qryAulaCD_DIARIO_AULA.AsLargeInt);
      UpdateStatusBar;
   end;
end;

procedure TfrmLGTCDespesas.btnLimparFiltrosClick(Sender: TObject);
const
   SSQLOriginal =
      'SELECT ' +
         'D.`CD_DESPESA`,' +
         'D.`CD_TIPO_DESPESA`,' +
         'D.`CD_DIARIO_AULA`,' +
         'D.`CD_SITUACAO`,' +
         'D.`CD_FORNECEDOR`,' +
         'D.`DT_COMPROMISSO`,' +
         'D.`VL_TOTAL`,' +
         'D.`ME_JSON_VALOR`,' +
         'D.`DT_CADASTRO`,' +
         'D.`DT_ALTERACAO`,' +
         'T.`DS_TIPO_DESPESA`,' +
         'C.`DS_CONTA`,' +
         'S.`DS_SITUACAO`,' +
         'A.`TURMA` `CD_TURMA`,' +
         'A.`ANOSEMESTRE` `NR_ANOSEMESTRE`,' +
         'A.`DISCIPLINA` `CD_DISCIPLINA`,' +
         'A.`BIMESTRE` `NR_ETAPA`,' +
         'A.`NRO_AULA` `NR_AULA`,' +
         'A.`DATA` `DT_AULA`,' +
         'A.`CD_PROFESSOR`,' +
         'M.`DS_CURSO`,' +
         'I.`DESCRICAO` `DS_DISCIPLINA`,' +
         'P.`NM_PESSOA`,' +
         'I.`ID_DISCIPLINA`,' +
         'R.`NM_PESSOA` `NM_PROFESSOR`,' +
         'O.`NM_COLIGADA`,' +
         'E.`DESCRICAO`,' +
         'N.`DS_MUNICIPIO`,' +
         'O.`DS_ESTADO` ' +
      'FROM ' +
        '`LGTC_DESPESA_AULA` D ' +
          'JOIN `LGTC_TIPO_DESPESA` T ON ' +
            '(D.`CD_TIPO_DESPESA` = T.`CD_TIPO_DESPESA`) ' +
          'JOIN `FIN_CONFIG_PLANO_CONTAS` C ON ' +
            '(D.`CD_CONTA` = C.`CD_CONTA`) AND ' +
            '(D.`CD_COLIGADA_MATRIZ` = C.`CD_COLIGADA_MATRIZ`) ' +
          'JOIN `LGTC_DESPESA_SITUACAO` S ON ' +
            '(D.`CD_SITUACAO` = S.`CD_SITUACAO`) ' +
          'JOIN `PESSOAS` P ON ' +
            '(D.`CD_FORNECEDOR` = P.`CD_PESSOA`) ' +
          'JOIN `DIARIO_AULAS` A ON ' +
            '(D.`CD_DIARIO_AULA` = A.`CD_DIARIO_AULA`) ' +
            'JOIN `PESSOAS` R ON ' +
              '(A.`CD_PROFESSOR` = R.`CD_PESSOA`) ' +
            'JOIN `TURMAS` U ON ' +
              '(A.`TURMA` = U.`CODIGO`) AND ' +
              '(A.`ANOSEMESTRE` = U.`ANOSEMESTRE`) ' +
              'JOIN `CURSOS_MESTRE` M ON ' +
                '(U.`CURSO` = M.`CD_CURSO`) ' +
              'JOIN `COLIGADAS` O ON ' +
                '(U.`CD_COLIGADA` = O.`CD_COLIGADA`) ' +
                'LEFT JOIN `MUNICIPIOS` N ON ' +
                  '(O.`CD_MUNICIPIO` = N.`CD_MUNICIPIO`) ' +
                'JOIN `CURSOS_COLIGADAS` CC ON ' +
                  '(M.`CD_CURSO` = CC.`CD_CURSO`) AND ' +
                  '(O.`CD_COLIGADA` = CC.`CD_COLIGADA`) ' +
                  'JOIN `DEPARTAMENTOS` E ON ' +
                    '(CC.`CD_DEPTO` = E.`CODIGO`) ' +
              'JOIN `DISCIPLINAS` I ON ' +
                '(A.`DISCIPLINA` = I.`CODIGO`) AND ' +
                '(U.`CURSO` = I.`CURSO`)';
begin
   cdsDespesas.DisableControls;
   cdsDespesas.Close;
   qryDespesas.SQL.Text := SSQLOriginal;
   cdsDespesas.Open;
   cdsDespesas.EnableControls;
end;

procedure TfrmLGTCDespesas.btnSelecionarColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(dbgDespesas)), 'Financeiro.Compromissos.DespesasAula');
end;

procedure TfrmLGTCDespesas.btnSelecionarNenhumClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsDespesas.GetBookmark;
   cdsDespesas.DisableControls;
   cdsDespesas.First;
   while not cdsDespesas.Eof do
   begin
      cdsDespesas.Edit;
      cdsDespesasSN_SELECIONADO.AsBoolean := False;
      cdsDespesas.Next;
   end;
   cdsDespesas.GotoBookmark(Bookmark);
   cdsDespesas.EnableControls;
   UpdateStatusBar;
end;

procedure TfrmLGTCDespesas.btnSelecionarTodosClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsDespesas.GetBookmark;
   cdsDespesas.DisableControls;
   cdsDespesas.First;
   while not cdsDespesas.Eof do
   begin
      cdsDespesas.Edit;
      cdsDespesasSN_SELECIONADO.AsBoolean := True;
      cdsDespesas.Next;
   end;
   cdsDespesas.GotoBookmark(Bookmark);
   cdsDespesas.EnableControls;
   UpdateStatusBar;
end;

procedure TfrmLGTCDespesas.cdsDespesasAfterOpen(DataSet: TDataSet);
begin
   UpdateStatusBar;
end;

procedure TfrmLGTCDespesas.cdsDespesasCalcFields(DataSet: TDataSet);
begin
   cdsDespesasNR_SELECAO.AsInteger := 0;

   if cdsDespesasSN_SELECIONADO.AsBoolean then
   begin
      cdsDespesasNR_SELECAO.AsInteger := 1;
   end;

end;

procedure TfrmLGTCDespesas.dbgDespesasCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
      UpdateStatusBar;
   end;
end;

procedure TfrmLGTCDespesas.dbgDespesasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.Field.DataType = ftBoolean then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;
end;

procedure TfrmLGTCDespesas.dsDespesasStateChange(Sender: TObject);
begin
   btnSelecionarColunas.Enabled := dsBrowse = cdsDespesas.State;
   btnSelecionarTodos.Enabled := dsBrowse = cdsDespesas.State;
   btnSelecionarNenhum.Enabled := dsBrowse = cdsDespesas.State;
   btnIncluir.Enabled := (npIncluir in FPermissoes) and (dsBrowse = cdsDespesas.State);
   btnAlterar.Enabled := (npAlterar in FPermissoes) and (dsBrowse = cdsDespesas.State);
   btnExcluir.Enabled := (npExcluir in FPermissoes) and (dsBrowse = cdsDespesas.State);
end;

procedure TfrmLGTCDespesas.FiltraAula(const ID: Int64);
const
   SSQLDespesa =
      'SELECT ' +
         'D.`CD_DESPESA`,' +
         'D.`CD_TIPO_DESPESA`,' +
         'D.`CD_DIARIO_AULA`,' +
         'D.`CD_SITUACAO`,' +
         'D.`CD_FORNECEDOR`,' +
         'D.`DT_COMPROMISSO`,' +
         'D.`VL_TOTAL`,' +
         'D.`ME_JSON_VALOR`,' +
         'D.`DT_CADASTRO`,' +
         'D.`DT_ALTERACAO`,' +
         'T.`DS_TIPO_DESPESA`,' +
         'C.`DS_CONTA`,' +
         'S.`DS_SITUACAO`,' +
         'A.`TURMA` `CD_TURMA`,' +
         'A.`ANOSEMESTRE` `NR_ANOSEMESTRE`,' +
         'A.`DISCIPLINA` `CD_DISCIPLINA`,' +
         'A.`BIMESTRE` `NR_ETAPA`,' +
         'A.`NRO_AULA` `NR_AULA`,' +
         'A.`DATA` `DT_AULA`,' +
         'A.`CD_PROFESSOR`,' +
         'M.`DS_CURSO`,' +
         'I.`DESCRICAO` `DS_DISCIPLINA`,' +
         'P.`NM_PESSOA`,' +
         'I.`ID_DISCIPLINA`,' +
         'R.`NM_PESSOA` `NM_PROFESSOR`,' +
         'O.`NM_COLIGADA`,' +
         'E.`DESCRICAO`,' +
         'N.`DS_MUNICIPIO`,' +
         'O.`DS_ESTADO` ' +
      'FROM ' +
        '`LGTC_DESPESA_AULA` D ' +
          'JOIN `LGTC_TIPO_DESPESA` T ON ' +
            '(D.`CD_TIPO_DESPESA` = T.`CD_TIPO_DESPESA`) ' +
          'JOIN `FIN_CONFIG_PLANO_CONTAS` C ON ' +
            '(D.`CD_CONTA` = C.`CD_CONTA`) AND ' +
            '(D.`CD_COLIGADA_MATRIZ` = C.`CD_COLIGADA_MATRIZ`) ' +
          'JOIN `LGTC_DESPESA_SITUACAO` S ON ' +
            '(D.`CD_SITUACAO` = S.`CD_SITUACAO`) ' +
          'JOIN `PESSOAS` P ON ' +
            '(D.`CD_FORNECEDOR` = P.`CD_PESSOA`) ' +
          'JOIN `DIARIO_AULAS` A ON ' +
            '(D.`CD_DIARIO_AULA` = A.`CD_DIARIO_AULA`) ' +
            'JOIN `PESSOAS` R ON ' +
              '(A.`CD_PROFESSOR` = R.`CD_PESSOA`) ' +
            'JOIN `TURMAS` U ON ' +
              '(A.`TURMA` = U.`CODIGO`) AND ' +
              '(A.`ANOSEMESTRE` = U.`ANOSEMESTRE`) ' +
              'JOIN `CURSOS_MESTRE` M ON ' +
                '(U.`CURSO` = M.`CD_CURSO`) ' +
              'JOIN `COLIGADAS` O ON ' +
                '(U.`CD_COLIGADA` = O.`CD_COLIGADA`) ' +
                'LEFT JOIN `MUNICIPIOS` N ON ' +
                  '(O.`CD_MUNICIPIO` = N.`CD_MUNICIPIO`) ' +
                'JOIN `CURSOS_COLIGADAS` CC ON ' +
                  '(M.`CD_CURSO` = CC.`CD_CURSO`) AND ' +
                  '(O.`CD_COLIGADA` = CC.`CD_COLIGADA`) ' +
                  'JOIN `DEPARTAMENTOS` E ON ' +
                    '(CC.`CD_DEPTO` = E.`CODIGO`) ' +
              'JOIN `DISCIPLINAS` I ON ' +
                '(A.`DISCIPLINA` = I.`CODIGO`) AND ' +
                '(U.`CURSO` = I.`CURSO`) ' +
      'WHERE A.`CD_DIARIO_AULA` = :CD_DIARIO_AULA';
begin
   qryDespesas.SQL.Text := SSQLDespesa;
   cdsDespesas.Close;
   cdsDespesas.FetchParams;
   cdsDespesas.Params.ParamByName('CD_DIARIO_AULA').AsInteger := ID;
   cdsDespesas.Open;
end;

procedure TfrmLGTCDespesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frmLGTCDespesas := nil;
   Action := caFree;
end;

procedure TfrmLGTCDespesas.FormCreate(Sender: TObject);
const
   SChave = 'UMFinanceiro.Compromissos.DespesasAula';
var
   MenuItem: TMenuItem;
begin
   FPermissoes := DM.UsuarioLogado.GetPermissoes(DM.UsuarioLogado.Pessoa.Codigo, SChave);
   DM.montarPlanilha(TDBGrid(TCustomDBGrid(dbgDespesas)), 'Financeiro.Compromissos.DespesasAula');

   btnIncluir.Enabled := npIncluir in Permissoes;
   
   btnSituacao.Enabled := DM.UsuarioLogado.TemPermissao(
      DM.UsuarioLogado.Pessoa.Codigo,
      'UMFinanceiro.Compromissos.DespesasAula.Situacao', npAcesso, False);

   btnCompromissos.Enabled := DM.UsuarioLogado.TemPermissao(
      DM.UsuarioLogado.Pessoa.Codigo,
      'UMFinanceiro.Compromissos.DespesasAula.Compromisso',
      npAcesso, False);

   qrySituacao.Open;

   if not qrySituacao.IsEmpty then
   begin
      qrySituacao.First;
      while not qrySituacao.Eof do
      begin
         MenuItem := TMenuItem.Create(Self);
         MenuItem.Caption := qrySituacaoDS_SITUACAO.AsString;
         MenuItem.Tag := qrySituacaoCD_SITUACAO.AsLargeInt;
         MenuItem.OnClick := SituacaoMenuItemClick;
         pmSituacoes.Items.Add(MenuItem);
         qrySituacao.Next;
      end;
   end;

   qrySituacaoFluxo.Open;
end;

procedure TfrmLGTCDespesas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if btnIncluir.Enabled then
            btnIncluir.Click;
      VK_F3:
         if btnAlterar.Enabled then
            btnAlterar.Click;
      VK_F9:
         if btnExcluir.Enabled then
            btnExcluir.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfrmLGTCDespesas.pmSituacoesPopup(Sender: TObject);
const
   FiltroSituacaoOrigem = 'CD_SITUACAO_ORIGEM = %d';
var
   Bookmark: TBookmark;
   ShowOptions: Boolean;
   SituacaoOrigem: Int64;
   I: Integer;
begin
   ShowOptions := True;

   for I := 0 to pmSituacoes.Items.Count - 1 do
      pmSituacoes.Items[I].Enabled := False;

   if not cdsDespesas.Active then
      Exit;

   Bookmark := cdsDespesas.GetBookmark;
   cdsDespesas.DisableControls;
   cdsDespesas.Filter := 'SN_SELECIONADO';
   cdsDespesas.Filtered := True;
   cdsDespesas.First;

   ShowOptions := not cdsDespesas.IsEmpty;

   SituacaoOrigem := cdsDespesasCD_SITUACAO.AsLargeInt;

   while not cdsDespesas.Eof do
   begin

      if SituacaoOrigem <> cdsDespesasCD_SITUACAO.AsLargeInt then
      begin
         ShowOptions := False;
         Break;
      end;

      cdsDespesas.Next;
   end;

   if ShowOptions then
   begin
      qrySituacaoFluxo.Filtered := False;
      qrySituacaoFluxo.Filter := Format(FiltroSituacaoOrigem, [SituacaoOrigem]);
      qrySituacaoFluxo.Filtered := True;

      if not qrySituacaoFluxo.IsEmpty then
      begin
         qrySituacaoFluxo.First;
         while not qrySituacaoFluxo.Eof do
         begin
            for I := 0 to pmSituacoes.Items.Count - 1 do
            begin
               if pmSituacoes.Items[I].Tag = qrySituacaoFluxoCD_SITUACAO_DESTINO.AsInteger then
                  pmSituacoes.Items[I].Enabled := True;
            end;
            qrySituacaoFluxo.Next;
         end;
      end;
   end;

   cdsDespesas.Filtered := False;
   cdsDespesas.EnableControls;
   cdsDespesas.GotoBookmark(Bookmark);

end;

procedure TfrmLGTCDespesas.qryDespesasBeforeDelete(DataSet: TDataSet);
var
   JSON: TlkJSONobject;
   Chave: AnsiString;
begin
   JSON := DM.RecordToJSON(DataSet);
   try
      Chave := DataSet.FieldByName('CD_DESPESA').AsString;
      DM.setLog(Modulo, 'Exclusão', Chave, 0, UTF8Decode(TlkJSON.GenerateText(JSON)));
   finally
      FreeAndNil(JSON);
   end;
end;

procedure TfrmLGTCDespesas.SituacaoMenuItemClick(Sender: TObject);
const
   MsgConfirmaAlteracao = 'Deseja realmente alterar a situação dos registros selecionados para "%s"';
var
   MenuItem: TMenuItem;
   Bookmark: TBookmark;
   S: AnsiString;
begin
   MenuItem := TMenuItem(Sender);

   S := Format(MsgConfirmaAlteracao, [MenuItem.Caption]);

   if MessageDlg(S, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      Bookmark := cdsDespesas.GetBookmark;
   
      cdsDespesas.DisableControls;
      cdsDespesas.Filter := 'SN_SELECIONADO';
      cdsDespesas.Filtered := True;
      cdsDespesas.First;

      while not cdsDespesas.Eof do
      begin
         cdsDespesas.Edit;
         cdsDespesasCD_SITUACAO.AsInteger := MenuItem.Tag;
         cdsDespesas.Post;
         cdsDespesas.Next;
      end;

      cdsDespesas.ApplyUpdates(0);
      cdsDespesas.Filtered := False;
      cdsDespesas.EnableControls;
      cdsDespesas.GotoBookmark(Bookmark);
      cdsDespesas.Refresh;
   end;
end;

procedure TfrmLGTCDespesas.UpdateStatusBar;
const
   ValorTotalFmt = 'Valor total: R$ %s';
   ValorTotalSelecaoFmt = 'Valor total selecionado: R$ %s';
   RegistrosSelecionados = '%s registro(s) selecionado(s)';
   CurrencyFmt = '###,###,##0.00';
var
   S: AnsiString;
   I: Integer;
   TotalSelecao, Total: Currency;
   FmtSettings: TFormatSettings;
begin
   if not TryStrToCurr(cdsDespesasSUM_TOTAL_SELECIONADO.AsString, TotalSelecao) then
   begin
      TotalSelecao := 0;
   end;

   if TryStrToInt(cdsDespesasSUM_SELECIONADO.AsString, I) then
   begin
      if (I = 0) and (TotalSelecao <> 0) then
      begin
         TotalSelecao := 0;
      end;
   end;

   if not TryStrToCurr(cdsDespesasSUM_TOTAL.AsString, Total) then
   begin
      Total := 0;
   end;

   stbStatus.Panels[0].Text := Format(RegistrosSelecionados, [cdsDespesasSUM_SELECIONADO.AsString]);

   FmtSettings.ThousandSeparator := #46;
   FmtSettings.DecimalSeparator := #44;

   S := FormatCurr(CurrencyFmt, Total, FmtSettings);
   stbStatus.Panels[1].Text := Format(ValorTotalFmt, [S]);

   S := FormatCurr(CurrencyFmt, TotalSelecao, FmtSettings);
   stbStatus.Panels[2].Text := Format(ValorTotalSelecaoFmt, [S]);
end;

end.
