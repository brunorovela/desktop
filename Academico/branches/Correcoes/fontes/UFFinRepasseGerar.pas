unit UFFinRepasseGerar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons, DB,
   ZAbstractRODataset, ZAbstractDataset, UZDataset, Provider, DBClient, Grids,
   DBGrids, UDBGrids, uUsuario, DateUtils, UZDbcFuncs, ZDbcIntfs, ZSqlUpdate,
   ClassRegistros, Mask, Spin, Menus;

type
   TfrmFinRepasseGerar = class(TForm)
      bbtnFiltrar: TBitBtn;
      bbtnLancar: TBitBtn;
      btnDesmarcar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnFinanceiro: TToolButton;
      btnImprimir: TToolButton;
      btnMarcar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnSep3: TToolButton;
      btnSep4: TToolButton;
      bvlFiltro: TBevel;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      cdsRepasses: TClientDataSet;
      cdsRepassesCD_CENTRO: TLargeintField;
      cdsRepassesCD_CONTA: TLargeintField;
      cdsRepassesCD_CONTRATO: TLargeintField;
      cdsRepassesCD_DEPTO: TSmallintField;
      cdsRepassesCD_MENSALIDADE: TIntegerField;
      cdsRepassesCD_PESSOA: TIntegerField;
      cdsRepassesCD_TIPO: TSmallintField;
      cdsRepassesCD_TIPO_TITULO: TIntegerField;
      cdsRepassesCD_TURMA: TStringField;
      cdsRepassesCOUNT_SELECAO: TAggregateField;
      cdsRepassesCURSO: TStringField;
      cdsRepassesDS_PARCELA: TStringField;
      cdsRepassesDT_VENCIMENTO: TDateField;
      cdsRepassesNM_COLIGADA: TStringField;
      cdsRepassesNM_PESSOA: TStringField;
      cdsRepassesNR_ALUNOS: TLargeintField;
      cdsRepassesNR_ANOSEMESTRE: TIntegerField;
      cdsRepassesNR_DIA_VENCIMENTO: TSmallintField;
      cdsRepassesNR_PARCELA: TSmallintField;
      cdsRepassesNR_PARCELAS: TSmallintField;
      cdsRepassesNR_SELECAO: TIntegerField;
      cdsRepassesSN_SELECAO: TBooleanField;
      cdsRepassesVL_REPASSE: TFloatField;
      dbgRepasses: TSortedDBGrid;
      dspRepasses: TDataSetProvider;
      dsRepasses: TDataSource;
      ilAcoes: TImageList;
      lblPeriodo: TLabel;
      meReferencia: TMaskEdit;
      miExcluirSelecionados: TMenuItem;
      miExcluirTodos: TMenuItem;
      pmExcluir: TPopupMenu;
      pnlFiltros: TPanel;
      pnlTitulo: TPanel;
      qryRepasses: TUMZQuery;
      qryRepassesCD_CENTRO: TLargeintField;
      qryRepassesCD_CONTA: TLargeintField;
      qryRepassesCD_CONTRATO: TLargeintField;
      qryRepassesCD_DEPTO: TSmallintField;
      qryRepassesCD_MENSALIDADE: TIntegerField;
      qryRepassesCD_PESSOA: TIntegerField;
      qryRepassesCD_TIPO: TSmallintField;
      qryRepassesCD_TIPO_TITULO: TIntegerField;
      qryRepassesCD_TURMA: TStringField;
      qryRepassesCURSO: TStringField;
      qryRepassesDT_VENCIMENTO: TDateField;
      qryRepassesNM_COLIGADA: TStringField;
      qryRepassesNM_PESSOA: TStringField;
      qryRepassesNR_ALUNOS: TLargeintField;
      qryRepassesNR_ANOSEMESTRE: TIntegerField;
      qryRepassesNR_DIA_VENCIMENTO: TSmallintField;
      qryRepassesNR_PARCELA: TSmallintField;
      qryRepassesNR_PARCELAS: TSmallintField;
      qryRepassesVL_REPASSE: TFloatField;
      rbMensalidades: TRadioButton;
      rbSemMensalidade: TRadioButton;
      rbTodas: TRadioButton;
      tlbAcoes: TToolBar;
      updRepasses: TZUpdateSQL;
      upReferencia: TUpDown;
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure bbtnLancarClick(Sender: TObject);
      procedure btnDesmarcarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnFinanceiroClick(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
      procedure btnMarcarClick(Sender: TObject);
      procedure cdsRepassesAfterOpen(DataSet: TDataSet);
      procedure cdsRepassesAfterRefresh(DataSet: TDataSet);
      procedure cdsRepassesCalcFields(DataSet: TDataSet);
      procedure cdsRepassesVL_REPASSEChange(Sender: TField);
      procedure dbgRepassesCellClick(Column: TColumn);
      procedure dbgRepassesDblClick(Sender: TObject);
      procedure dbgRepassesDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure miExcluirSelecionadosClick(Sender: TObject);
      procedure miExcluirTodosClick(Sender: TObject);
      procedure rbMensalidadesClick(Sender: TObject);
      procedure rbSemMensalidadeClick(Sender: TObject);
      procedure rbTodasClick(Sender: TObject);
      procedure upReferenciaClick(Sender: TObject; Button: TUDBtnType);
   private
      FPermissoes: TUMPermissoes;
      procedure Gera;
      procedure Exclui;
      procedure UpdateButtonStatus;
   end;

var
   frmFinRepasseGerar: TfrmFinRepasseGerar;

implementation

uses
   uDM, Main, UFFinRepasseAluno, UFFinRepasseTurma;

{$R *.dfm}

procedure TfrmFinRepasseGerar.bbtnFiltrarClick(Sender: TObject);
const
   DefaultDateFmt = '01/%s';
   SQLSelect = ''
      + ' SELECT DISTINCT '
      + '   R.CD_CONTRATO, '
      + '   R.CD_TURMA, '
      + '   R.NR_ANOSEMESTRE, '
      + '   R.NR_PARCELA, '
      + '   R.NR_PARCELAS, '
      + '   R.VL_REPASSE, '
      + '   R.DT_VENCIMENTO, '
      + '   C.NR_DIA_VENCIMENTO, '
      + '   C.CD_PESSOA, '
      + '   C.CD_TIPO_TITULO, '
      + '   O.NM_COLIGADA, '
      + '   TT.CD_CONTA, '
      + '   P.NM_PESSOA, '
      + '   T.CURSO, '
      + '   T.CD_CENTRO, '
      + '   CC.CD_DEPTO, '
      + '   M.CD_MENSALIDADE, '
      + '   C.CD_TIPO, '
      + '   CASE '
      + '     WHEN C.CD_TIPO = 1 THEN COUNT(DISTINCT MAT.CODIGOALUNO) '
      + '     WHEN C.CD_TIPO = 0 THEN COUNT(DISTINCT CTP.CD_PESSOA) '
      + '     ELSE 0 '
      + '   END NR_ALUNOS '
      + ' FROM '
      + '   CONV_REPASSES R '
      + '     JOIN CONV_CONTRATOS C ON '
      + '       (R.CD_CONTRATO = C.CD_CONTRATO) '
      + '     LEFT JOIN CONV_CONTRATOS_TURMAS_PESSOAS CTP ON '
      + '       (R.CD_CONTRATO = CTP.CD_CONTRATO) AND '
      + '       (R.CD_TURMA = CTP.CD_TURMA) AND '
      + '       (R.NR_ANOSEMESTRE = CTP.NR_ANOSEMESTRE) AND '
      + '       (CTP.SN_ATIVO = 1) '
      + '     LEFT JOIN MATRICULAS MAT ON '
      + '       (R.CD_TURMA = MAT.TURMA) AND '
      + '       (R.NR_ANOSEMESTRE = MAT.ANOSEMESTRE) '
      + '     LEFT JOIN SITUACAO S ON '
      + '       (MAT.SITUACAO = S.CD_SITUACAO) AND '
      + '       (S.CD_SITUACAO_PAI IN (0, 1, 2, 9, 11, 14, 15)) '
      + '     JOIN COLIGADAS O ON '
      + '       (C.CD_COLIGADA = O.CD_COLIGADA) '
      + '     JOIN FIN_CONFIG_TIPOS_TITULO TT ON '
      + '       (C.CD_TIPO_TITULO = TT.CD_TIPO_TITULO) AND '
      + '       (O.CD_COLIGADA_MATRIZ = TT.CD_COLIGADA_MATRIZ) '
      + '     JOIN PESSOAS P ON '
      + '       (C.CD_PESSOA = P.CD_PESSOA) '
      + '     JOIN TURMAS T ON '
      + '       (R.CD_TURMA = T.CODIGO) AND '
      + '       (R.NR_ANOSEMESTRE = T.ANOSEMESTRE) '
      + '     JOIN CURSOS_COLIGADAS CC ON '
      + '       (T.CURSO = CC.CD_CURSO) AND '
      + '       (T.CD_COLIGADA = CC.CD_COLIGADA) '
      + '     LEFT JOIN MENSALIDADES M ON '
      + '       (R.CD_MENSALIDADE = M.CD_MENSALIDADE) '
      + ' WHERE '
      + '   C.CD_COLIGADA IN (%s) AND '
      + '   MONTH(R.DT_VENCIMENTO) = :NR_MES AND '
      + '   YEAR(R.DT_VENCIMENTO) = :NR_ANO '
      + ' GROUP BY '
      + '   R.CD_CONTRATO, '
      + '   R.CD_TURMA, '
      + '   R.NR_ANOSEMESTRE, '
      + '   R.NR_PARCELA ';
var
   S: AnsiString;
   Mes, Ano: Word;
   DateSelecao: TDate;
begin
   DateSelecao := StrToDate(Format(DefaultDateFmt, [meReferencia.Text]));

   Mes := MonthOf(DateSelecao);
   Ano := YearOf(DateSelecao);

   S := Format(SQLSelect, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
   qryRepasses.SQL.Text := S;

   cdsRepasses.Close;
   cdsRepasses.FetchParams;
   cdsRepasses.Params.ParamByName('NR_ANO').AsInteger := Ano;
   cdsRepasses.Params.ParamByName('NR_MES').AsInteger := Mes;
   cdsRepasses.Open;
end;

procedure TfrmFinRepasseGerar.bbtnLancarClick(Sender: TObject);
const
   MsgConfirmaLancamento = 'Deseja realmente efetuar o lançamento dos repasses para o mês selecionado?';
   MsgConfirmaExclusao = 'Deseja efetuar a exclusão dos lançamentos já realizados para o mês informado antes de efetuar o novo lançamento?';
   MsgNaoExclusao = 'Os lançamentos que possuem vínculo com o financeiro não serão excluídos. Para excluir esses lançamentos, é necessário primeiro efetuar a exclusão do título através da planilha de recebimentos.';
   CaptionConfirma = 'Confirmação';
   CaptionAtencao = 'Atenção';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(0, MsgConfirmaLancamento, CaptionConfirma,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
   begin

      UserChoice := MessageBox(0, MsgConfirmaExclusao, CaptionConfirma,
         MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

      if UserChoice = ID_YES then
      begin
         MessageBox(0, MsgNaoExclusao, CaptionAtencao,
            MB_ICONWARNING or MB_OK);
         Exclui;
      end;

      Gera;
      cdsRepasses.Refresh;
   end;
end;

procedure TfrmFinRepasseGerar.btnDesmarcarClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsRepasses.GetBookmark;
   cdsRepasses.DisableControls;
   cdsRepasses.First;
   while not cdsRepasses.Eof do
   begin
      if cdsRepassesCD_MENSALIDADE.IsNull then
      begin
         cdsRepasses.Edit;
         cdsRepassesSN_SELECAO.AsBoolean := False;
         cdsRepassesNR_SELECAO.AsInteger := 0;
         cdsRepasses.Post;
      end;
      cdsRepasses.Next;
   end;
   cdsRepasses.GotoBookmark(Bookmark);
   cdsRepasses.EnableControls;
   UpdateButtonStatus;
end;

procedure TfrmFinRepasseGerar.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmFinRepasseGerar.btnFinanceiroClick(Sender: TObject);
const
   MsgConfirmacao = 'Tem certeza que deseja lançar um título a receber para cada registro selecionado?';
   MsgConfirmacaoCaption = 'Confirmação';
   MsgInformacao = 'Os títulos foram gerados com sucesso.';
   MsgInformacaoCaption = 'Informação';
   HistoricoMensalidade = 'Geração de mensalidade a partir do repasse';
   SQLCountParcelas =
        ' SELECT '
      + ' 	COUNT(*) '
      + ' FROM '
      + ' 	CONV_REPASSES_MENSAL '
      + ' WHERE '
      + ' 	CD_TURMA = ? AND '
      + ' 	NR_ANOSEMESTRE = ? AND '
      + ' 	CD_CONTRATO = ? AND '
      + ' 	DT_REFERENCIA = ? ';
var
   UserChoice, MensalidadeID: Integer;
   SaveFilter: AnsiString;
   Filtered: Boolean;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   UserChoice := MessageBox(0, MsgConfirmacao, MsgConfirmacaoCaption,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
   begin
      cdsRepasses.DisableControls;

      SaveFilter := cdsRepasses.Filter;
      Filtered := cdsRepasses.Filtered;

      Stmt := PrepareStatement(SQLCountParcelas);

      try
         cdsRepasses.Filter := 'SN_SELECAO';
         cdsRepasses.Filtered := True;
         cdsRepasses.First;
         
         while not cdsRepasses.Eof do
         begin
            MensalidadeID := DM.GerarMensalidade(
               cdsRepassesCD_PESSOA.AsInteger,      // aluno
               cdsRepassesNR_PARCELA.AsInteger,     // parcela
               cdsRepassesCD_TURMA.AsString,        // turma
               cdsRepassesVL_REPASSE.AsFloat,       // valor bruto
               0,                                   // juros
               cdsRepassesNR_ANOSEMESTRE.AsInteger, // ano/semestre
               cdsRepassesDT_VENCIMENTO.AsDateTime, // vencimento
               cdsRepassesDT_VENCIMENTO.AsDateTime, // competência
               2,                                   // situação
               cdsRepassesCURSO.AsString,           // curso
               cdsRepassesCD_DEPTO.AsInteger,       // departamento
               0,                                   // tipo de parcela
               0,                                   // mensalidade origem
               0,                                   // desconto condicional
               0,                                   // créditos
               HistoricoMensalidade,                // histórico
               cdsRepassesCD_TIPO_TITULO.AsInteger, // tipo de título
               cdsRepassesCD_CONTA.AsInteger,       // plano de contas
               cdsRepassesCD_CENTRO.AsInteger       // centro de custo
            );
            cdsRepasses.Edit;
            cdsRepassesCD_MENSALIDADE.AsInteger := MensalidadeID;
            cdsRepasses.Next;
         end;
         
         if cdsRepasses.State = dsEdit then
         begin
            cdsRepasses.Post;
         end;
         
         cdsRepasses.ApplyUpdates(0);
         cdsRepasses.Filter := SaveFilter;
         cdsRepasses.Filtered := Filtered;
         cdsRepasses.Refresh;
         cdsRepasses.EnableControls;

         MessageBox(0, MsgInformacao, MsgInformacaoCaption,
            MB_ICONQUESTION or MB_OK);
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;
end;

procedure TfrmFinRepasseGerar.btnImprimirClick(Sender: TObject);
const
   FormulaFmt = '{@ano} = "%d" AND {@mes} = "%d"';
   RepNameFmt = '%s.rpt';
   DefaultDateFmt = '01/%s';
var
   Formula, RepName: AnsiString;
   RepInfo: ClasseRegistros;
   DateSelecao: TDate;
begin
   RepInfo := PrincipalForm.GetInfoRpt('repConveniosRepasse');

   DateSelecao := StrToInt(Format(DefaultDateFmt, [meReferencia.Text]));

   Formula := Format(FormulaFmt, [YearOf(DateSelecao), MonthOf(DateSelecao)]);
   RepName := Format(RepNameFmt, [RepInfo.Campo['nm_arquivo']]);

   PrincipalForm.ImprimeRpt(
      Self,
      RepName,
      -1,
      Formula,
      '',
      nil,
      nil,
      nil,
      nil,
      True,
      False,
      nil,
      RepInfo.Campo['sn_pode_exportar'] <> 0);
end;

procedure TfrmFinRepasseGerar.btnMarcarClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsRepasses.GetBookmark;
   cdsRepasses.DisableControls;
   cdsRepasses.First;
   while not cdsRepasses.Eof do
   begin
      if cdsRepassesCD_MENSALIDADE.IsNull then
      begin
         cdsRepasses.Edit;
         cdsRepassesSN_SELECAO.AsBoolean := True;
         cdsRepassesNR_SELECAO.AsInteger := 1;
         cdsRepasses.Post;
      end;
      cdsRepasses.Next;
   end;
   cdsRepasses.GotoBookmark(Bookmark);
   cdsRepasses.EnableControls;
   UpdateButtonStatus;
end;

procedure TfrmFinRepasseGerar.cdsRepassesAfterOpen(DataSet: TDataSet);
begin
   UpdateButtonStatus;
end;

procedure TfrmFinRepasseGerar.cdsRepassesAfterRefresh(DataSet: TDataSet);
begin
   UpdateButtonStatus;
end;

procedure TfrmFinRepasseGerar.cdsRepassesCalcFields(DataSet: TDataSet);
const
   ParcelaFmt = '%d/%d';
begin
   cdsRepassesDS_PARCELA.AsString := Format(ParcelaFmt, [
      cdsRepassesNR_PARCELA.AsInteger, cdsRepassesNR_PARCELAS.AsInteger]);
end;

procedure TfrmFinRepasseGerar.cdsRepassesVL_REPASSEChange(Sender: TField);
begin
   cdsRepasses.ApplyUpdates(0);
end;

procedure TfrmFinRepasseGerar.dbgRepassesCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      if cdsRepassesCD_MENSALIDADE.IsNull then
      begin
         Column.Field.DataSet.Edit;
         Column.Field.AsBoolean := not Column.Field.AsBoolean;
         Column.Field.DataSet.FieldByName('NR_SELECAO').AsInteger := Ord(Column.Field.AsBoolean);
         Column.Field.DataSet.Post;
         UpdateButtonStatus;
      end;
   end;
end;

procedure TfrmFinRepasseGerar.dbgRepassesDblClick(Sender: TObject);
begin
   if cdsRepassesCD_TIPO.AsInteger = 0 then
      TfrmFinRepasseAluno.Edit(cdsRepassesCD_CONTRATO.AsInteger,
         cdsRepassesNR_ANOSEMESTRE.AsInteger, cdsRepassesCD_TURMA.AsString);

   if cdsRepassesCD_TIPO.AsInteger = 1 then
      TfrmFinRepasseTurma.Edit(Mouse.CursorPos.X, Mouse.CursorPos.Y,
         cdsRepassesCD_CONTRATO.AsInteger, cdsRepassesNR_ANOSEMESTRE.AsInteger,
         cdsRepassesCD_TURMA.AsString);
end;

procedure TfrmFinRepasseGerar.dbgRepassesDrawColumnCell(Sender: TObject;
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

   if not cdsRepassesCD_MENSALIDADE.IsNull then
   begin
      dbgRepasses.Canvas.Font.Color := clGrayText;
      dbgRepasses.Canvas.Brush.Color := clBtnFace;
      dbgRepasses.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfrmFinRepasseGerar.Exclui;
const
   DefaultDateFmt = '01/%s';
   SQLDelete = ''
      + ' DELETE R FROM CONV_REPASSES R '
      + ' WHERE '
      + '   R.DT_VENCIMENTO >= ? AND '
      + '   EXISTS ( '
      + '     SELECT '
      + '       T.CD_CONTRATO '
      + '     FROM '
      + '       CONV_CONTRATOS_TURMAS T '
      + '     WHERE '
      + '       R.CD_CONTRATO = T.CD_CONTRATO AND '
      + '       R.CD_TURMA = T.CD_TURMA AND '
      + '       R.NR_ANOSEMESTRE = T.NR_ANOSEMESTRE '
      + '   ) AND '
      + '   NOT EXISTS ( '
      + '     SELECT '
      + '       M.CD_MENSALIDADE '
      + '     FROM '
      + '       MENSALIDADES M '
      + '     WHERE '
      + '       R.CD_MENSALIDADE = M.CD_MENSALIDADE '
      + '   ) ';
var
   Stmt: IZPreparedStatement;
   StartDate: TDate;
begin
   StartDate := StrToDate(Format(DefaultDateFmt, [meReferencia.Text]));

   Stmt := PrepareStatement(SQLDelete);
   try
      Stmt.SetDate(1, StartDate);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmFinRepasseGerar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmFinRepasseGerar := nil;
   Action := caFree;
end;

procedure TfrmFinRepasseGerar.FormCreate(Sender: TObject);
const
   Chave = 'UMFinanceiro.Contratos.RelatorioRepasse';
begin
   meReferencia.Text := FormatDateTime('mm/yyyy', Date);
   FPermissoes := DM.UsuarioLogado.GetPermissoes(0, Chave);
   btnFinanceiro.Enabled := npEspecial in FPermissoes;
   bbtnFiltrar.Click;
end;

procedure TfrmFinRepasseGerar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

procedure TfrmFinRepasseGerar.Gera;
const
   DefaultDateFmt = '01/%s';
   SQLSelectTitulos = ''
      + '( '
      + '  SELECT '
      + '    T.DT_REFERENCIA, '
      + '    T.CD_CONTRATO, '
      + '    T.CD_TURMA, '
      + '    T.NR_ANOSEMESTRE, '
      + '    C.NR_DIA_VENCIMENTO, '
      + '    T.NR_PARCELAS, '
      + '    ( '
      + '      ( '
      + '        (YEAR(?) - YEAR(T.DT_REFERENCIA)) * 12 '
      + '      ) + '
      + '      (MONTH(?) - MONTH(T.DT_REFERENCIA)) + 1 '
      + '    ) NR_PARCELA_INICIAL, '
      + '    T.VL_REPASSE, '
      + '    COUNT(DISTINCT M.CODIGOALUNO) NR_ALUNOS, '
      + '    T.NR_PARCELAS NR_PARCELAS_TOTAL '
      + '  FROM '
      + '    CONV_CONTRATOS_TURMAS T '
      + '      JOIN CONV_CONTRATOS C ON '
      + '        (T.CD_CONTRATO = C.CD_CONTRATO) '
      + '      JOIN MATRICULAS M ON '
      + '        (T.CD_TURMA = M.TURMA) AND '
      + '        (T.NR_ANOSEMESTRE = M.ANOSEMESTRE) '
      + '      JOIN SITUACAO S ON '
      + '        (M.SITUACAO = S.CD_SITUACAO) '
      + '  WHERE '
      + '    T.SN_ATIVO = 1 AND '
      + '    C.SN_ATIVO = 1 AND '
      + '    C.CD_TIPO = 1 AND '
      + '    S.CD_SITUACAO_PAI IN (0, 1, 2, 9, 11, 14, 15) AND '
      + '    DATE_ADD(T.DT_REFERENCIA, INTERVAL T.NR_PARCELAS MONTH) >= ? '
      + '  GROUP BY '
      + '    T.CD_CONTRATO, '
      + '    T.CD_TURMA, '
      + '    T.NR_ANOSEMESTRE '
      + ') '
      + 'UNION '
      + '( '
      + '  SELECT '
      + '    T.DT_REFERENCIA, '
      + '    P.CD_CONTRATO, '
      + '    P.CD_TURMA, '
      + '    P.NR_ANOSEMESTRE, '
      + '    C.NR_DIA_VENCIMENTO, '
      + '    MAX(P.NR_PARCELAS) NR_PARCELAS, '
      + '    ( '
      + '      COALESCE(MAX(P.NR_PARCELAS), 0) + '
      + '      ( '
      + '        ( '
      + '          YEAR(?) - '
      + '          YEAR(DATE_ADD(T.DT_REFERENCIA, INTERVAL COALESCE(MAX(P.NR_PARCELAS), 0) - 1 MONTH)) '
      + '        ) * 12 '
      + '      ) + '
      + '      ( '
      + '        MONTH(?) - '
      + '        MONTH(DATE_ADD(T.DT_REFERENCIA, INTERVAL COALESCE(MAX(P.NR_PARCELAS), 0) - 1 MONTH)) '
      + '      ) '
      + '    ) NR_PARCELA_INICIAL, '
      + '    (  '
      + '      SUM(P.VL_REPASSE) + '
      + '      ( '
      + '        SELECT '
      + '          COALESCE(SUM(P2.VL_REPASSE), 0)  '
      + '        FROM '
      + '          CONV_CONTRATOS_TURMAS_PESSOAS P2 '
      + '        WHERE '
      + '          P.CD_CONTRATO = P2.CD_CONTRATO AND '
      + '          P.CD_TURMA = P2.CD_TURMA AND '
      + '          P.NR_ANOSEMESTRE = P2.NR_ANOSEMESTRE AND '
      + '          P.NR_PARCELAS < P2.NR_PARCELAS '
      + '      ) '
      + '    ) * C.VL_CONTRATO / 100 VL_REPASSE, '
      + '    COUNT(DISTINCT P.CD_PESSOA) + '
      + '    ( '
      + '      SELECT '
      + '        COALESCE(COUNT(DISTINCT P2.CD_PESSOA), 0)  '
      + '      FROM '
      + '        CONV_CONTRATOS_TURMAS_PESSOAS P2  '
      + '      WHERE '
      + '        P.CD_CONTRATO = P2.CD_CONTRATO AND '
      + '        P.CD_TURMA = P2.CD_TURMA AND '
      + '        P.NR_ANOSEMESTRE = P2.NR_ANOSEMESTRE AND '
      + '        P.NR_PARCELAS < P2.NR_PARCELAS '
      + '    ) NR_ALUNOS, '
      + '    ( '
      + '      SELECT '
      + '        MAX(P2.NR_PARCELAS) '
      + '      FROM '
      + '        CONV_CONTRATOS_TURMAS_PESSOAS P2  '
      + '      WHERE '
      + '        P.CD_CONTRATO = P2.CD_CONTRATO AND '
      + '        P.CD_TURMA = P2.CD_TURMA AND '
      + '        P.NR_ANOSEMESTRE = P2.NR_ANOSEMESTRE '
      + '    ) NR_PARCELAS_TOTAL '
      + '  FROM '
      + '    CONV_CONTRATOS_TURMAS_PESSOAS P  '
      + '      JOIN CONV_CONTRATOS_TURMAS T ON  '
      + '        (P.CD_CONTRATO = T.CD_CONTRATO) AND '
      + '        (P.CD_TURMA = T.CD_TURMA) AND '
      + '        (P.NR_ANOSEMESTRE = T.NR_ANOSEMESTRE) '
      + '      JOIN CONV_CONTRATOS C ON '
      + '        (P.CD_CONTRATO = C.CD_CONTRATO)  '
      + '  WHERE '
      + '    P.SN_ATIVO = 1 AND '
      + '    C.SN_ATIVO = 1 AND '
      + '    C.CD_TIPO = 0 AND '
      + '    DATE_ADD(T.DT_REFERENCIA, INTERVAL P.NR_PARCELAS MONTH) > ? '
      + '  GROUP BY '
      + '    P.CD_CONTRATO,  '
      + '    P.CD_TURMA, '
      + '    P.NR_ANOSEMESTRE, '
      + '    P.NR_PARCELAS '
      + ') ';
   SQLInsertRepasse = ''
      + ' INSERT IGNORE INTO CONV_REPASSES ( '
      + '   CD_CONTRATO, '
      + '   CD_TURMA, '
      + '   NR_ANOSEMESTRE, '
      + '   NR_PARCELA, '
      + '   NR_PARCELAS, '
      + '   VL_REPASSE, '
      + '   DT_VENCIMENTO '
      + ' ) VALUES (?, ?, ?, ?, ?, ?, ?) ';
var
   StmtSelect, StmtInsert: IZPreparedStatement;
   Rs: IZResultSet;
   StartDate, Vencto: TDate;
   I: Integer;
begin
   StartDate := StrToDate(Format(DefaultDateFmt, [meReferencia.Text]));

   StmtSelect := PrepareStatement(SQLSelectTitulos);
   try
      StmtSelect.SetDate(1, StartDate);
      StmtSelect.SetDate(2, StartDate);
      StmtSelect.SetDate(3, StartDate);
      StmtSelect.SetDate(4, StartDate);
      StmtSelect.SetDate(5, StartDate);
      StmtSelect.SetDate(6, StartDate);
      
      Rs := StmtSelect.ExecuteQueryPrepared;
      try
         StmtInsert := PrepareStatement(SQLInsertRepasse);
         try
            while Rs.Next do
               for I := Rs.GetIntByName('NR_PARCELA_INICIAL') to Rs.GetIntByName('NR_PARCELAS') do
               begin
                  Vencto := IncMonth(Rs.GetDateByName('DT_REFERENCIA'), I - 1);

                  Vencto := EncodeDate(
                     YearOf(Vencto),
                     MonthOf(Vencto),
                     Rs.GetIntByName('NR_DIA_VENCIMENTO'));

                  StmtInsert.ClearParameters;
                  StmtInsert.SetInt(1, Rs.GetIntByName('CD_CONTRATO'));
                  StmtInsert.SetString(2, Rs.GetStringByName('CD_TURMA'));
                  StmtInsert.SetInt(3, Rs.GetIntByName('NR_ANOSEMESTRE'));
                  StmtInsert.SetInt(4, I);
                  StmtInsert.SetInt(5, Rs.GetIntByName('NR_PARCELAS_TOTAL'));
                  StmtInsert.SetFloat(6, Rs.GetFloatByName('VL_REPASSE'));
                  StmtInsert.SetDate(7, Vencto);
                  StmtInsert.ExecutePrepared;
               end;
         finally
            StmtInsert.Close;
            StmtInsert := nil;
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      StmtSelect.Close;
      StmtSelect := nil;
   end;
   
end;

procedure TfrmFinRepasseGerar.miExcluirSelecionadosClick(Sender: TObject);
const
   MsgConfirmaExclusao = 'Deseja realmente efetuar a exclusão dos registros selecionados?';
   CaptionConfirma = 'Confirmação';
var
   SaveFilter: AnsiString;
   Filtered: Boolean;
   UserChoice: Integer;
begin
   UserChoice := MessageBox(0, MsgConfirmaExclusao, CaptionConfirma,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
   begin
      SaveFilter := cdsRepasses.Filter;
      Filtered := cdsRepasses.Filtered;

      cdsRepasses.DisableControls;
      cdsRepasses.Filter := 'SN_SELECAO';
      cdsRepasses.Filtered := True;
      cdsRepasses.First;

      while not cdsRepasses.IsEmpty do
         cdsRepasses.Delete;

      cdsRepasses.ApplyUpdates(0);
      cdsRepasses.Filter := SaveFilter;
      cdsRepasses.Filtered := Filtered;
      cdsRepasses.Refresh;
      cdsRepasses.EnableControls;
   end;
end;

procedure TfrmFinRepasseGerar.miExcluirTodosClick(Sender: TObject);
const
   MsgConfirmaExclusao = 'Deseja realmente efetuar a exclusão dos registros visualizados? Registros que possuem vínculo com o financeiro não poderão ser excluídos.';
   CaptionConfirma = 'Confirmação';
var
   SaveFilter: AnsiString;
   Filtered: Boolean;
   UserChoice: Integer;
begin
   UserChoice := MessageBox(0, MsgConfirmaExclusao, CaptionConfirma,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
   begin
      SaveFilter := cdsRepasses.Filter;
      Filtered := cdsRepasses.Filtered;

      cdsRepasses.DisableControls;
      cdsRepasses.Filtered := False;
      cdsRepasses.First;

      while not cdsRepasses.IsEmpty do
         cdsRepasses.Delete;

      cdsRepasses.ApplyUpdates(0);
      cdsRepasses.Filter := SaveFilter;
      cdsRepasses.Filtered := Filtered;
      cdsRepasses.Refresh;
      cdsRepasses.EnableControls;
   end;
end;

procedure TfrmFinRepasseGerar.rbMensalidadesClick(Sender: TObject);
begin
   cdsRepasses.Filter := 'CD_MENSALIDADE <> 0';
   cdsRepasses.Filtered := True;
end;

procedure TfrmFinRepasseGerar.rbSemMensalidadeClick(Sender: TObject);
begin
   cdsRepasses.Filter := 'CD_MENSALIDADE = 0';
   cdsRepasses.Filtered := True;
end;

procedure TfrmFinRepasseGerar.rbTodasClick(Sender: TObject);
begin
   cdsRepasses.Filtered := False;
end;

procedure TfrmFinRepasseGerar.UpdateButtonStatus;
var
   Selecionados: Integer;
begin
   Selecionados := StrToIntDef(cdsRepassesCOUNT_SELECAO.AsString, 0);

   btnExcluir.Enabled := not cdsRepasses.IsEmpty;
   miExcluirSelecionados.Enabled := Selecionados > 0;
   miExcluirTodos.Enabled := not cdsRepasses.IsEmpty;
   btnFinanceiro.Enabled := Selecionados > 0;
end;

procedure TfrmFinRepasseGerar.upReferenciaClick(Sender: TObject;
  Button: TUDBtnType);
const
   DefaultDateFmt = '01/%s';
var
   StartDate: TDate;
begin
   StartDate := StrToDate(Format(DefaultDateFmt, [meReferencia.Text]));
   
   if Button = btNext then
   begin
      StartDate := IncMonth(StartDate, 1);
   end;

   if Button = btPrev then
   begin
      StartDate := IncMonth(StartDate, -1);
   end;

   meReferencia.Text := FormatDateTime('mm/yyyy', StartDate);
   bbtnFiltrar.Click;
end;

end.
