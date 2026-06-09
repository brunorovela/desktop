unit UFVouchers;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, StdCtrls, Buttons, DB,
   ZAbstractRODataset, UZDataset, Grids, DBGrids, UZSortedGrid, Tabs, Provider,
   DBClient, UDBGrids, uUsuario, ZAbstractDataset, ZSqlUpdate, UFMonthCalendar;

type
   TfrmVouchers = class(TForm)
      bbtnFiltrar: TBitBtn;
      bbtnLimparFiltros: TBitBtn;
      btnAlterar: TToolButton;
      btnCancelar: TToolButton;
      btnConsultar: TToolButton;
      btnDesmarcar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnIncluirCurso: TToolButton;
      btnIncluirTurma: TToolButton;
      btnMarcar: TToolButton;
      btnRemoverTurma: TToolButton;
      btnSalvar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnSep3: TToolButton;
      btnSep4: TToolButton;
      btnSep5: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      bvlSep6: TBevel;
      bvlSep7: TBevel;
      cdsTurmas: TClientDataSet;
      cdsTurmasCD_LOTE: TLargeintField;
      cdsTurmasCD_TURMA: TStringField;
      cdsTurmasDS_TURMA: TStringField;
      cdsTurmasNM_CURSO: TStringField;
      cdsTurmasNR_ANOSEMESTRE: TSmallintField;
      cdsTurmasNR_SELECIONADO: TIntegerField;
      cdsTurmasSN_SELECIONADO: TBooleanField;
      cdsTurmasSUM_SELECIONADO: TAggregateField;
      cdsVouchers: TClientDataSet;
      cdsVouchersCD_LOTE: TLargeintField;
      cdsVouchersCD_VOUCHER: TLargeintField;
      cdsVouchersDS_VOUCHER: TStringField;
      cdsVouchersDT_VENCIMENTO: TDateField;
      cdsVouchersNR_SEQUENCIAL: TLargeintField;
      cdsVouchersNR_UTILIZADO: TIntegerField;
      cdsVouchersSN_UTILIZADO: TBooleanField;
      cdsVouchersSUM_UTILIZADO: TAggregateField;
      cdsVouchersVL_DESCONTO: TFloatField;
      dbgLotes: TZSortedGrid;
      dbgTurmas: TSortedDBGrid;
      dbgVouchers: TSortedDBGrid;
      dsLotes: TDataSource;
      dspTurmas: TDataSetProvider;
      dspVouchers: TDataSetProvider;
      dsTurmas: TDataSource;
      dsVouchers: TDataSource;
      edtFiltroCurso: TEdit;
      edtFiltroFornecedor: TEdit;
      edtFiltroTurma: TEdit;
      ilAcoes: TImageList;
      lblFiltroCurso: TLabel;
      lblFiltroFornecedor: TLabel;
      lblFiltroTurma: TLabel;
    pnlFiltros: TPanel;
      pgcOpcoes: TPageControl;
      pnlDetalhes: TPanel;
      pnlFiltrosTitulo: TPanel;
      pnlTitulo: TPanel;
      pnlVouchers: TPanel;
      qryConsultarVoucher: TUMZReadOnlyQuery;
      qryConsultarVoucherCD_LOTE: TLargeintField;
      qryConsultarVoucherCD_VOUCHER: TLargeintField;
      qryInsertCurso: TUMZQuery;
      qryInsertTurma: TUMZQuery;
      qryLotes: TUMZQuery;
      qryLotesCD_FORNECEDOR: TIntegerField;
      qryLotesCD_LOTE: TLargeintField;
      qryLotesDS_LOTE: TStringField;
      qryLotesDS_PREFIXO: TStringField;
      qryLotesDS_SUFIXO: TStringField;
      qryLotesDT_VENCIMENTO: TDateField;
      qryLotesNM_PESSOA: TStringField;
      qryLotesNR_QUANTIDADE: TLargeintField;
      qryLotesVL_DESCONTO: TFloatField;
      qryTurmas: TUMZQuery;
      qryTurmasCD_LOTE: TLargeintField;
      qryTurmasCD_TURMA: TStringField;
      qryTurmasCurso: TUMZReadOnlyQuery;
      qryTurmasCursoCD_TURMA: TStringField;
      qryTurmasCursoNR_ANOSEMESTRE: TSmallintField;
      qryTurmasDS_TURMA: TStringField;
      qryTurmasNM_CURSO: TStringField;
      qryTurmasNR_ANOSEMESTRE: TSmallintField;
      qryVouchers: TUMZQuery;
      qryVouchersCD_LOTE: TLargeintField;
      qryVouchersCD_VOUCHER: TLargeintField;
      qryVouchersDS_VOUCHER: TStringField;
      qryVouchersDT_VENCIMENTO: TDateField;
      qryVouchersNR_SEQUENCIAL: TLargeintField;
      qryVouchersVL_DESCONTO: TFloatField;
      sbCalendario: TSpeedButton;
      sbFiltroCurso: TSpeedButton;
      sbFiltroFornecedor: TSpeedButton;
      sbFiltroTurma: TSpeedButton;
      splSep1: TSplitter;
      tbsTurmas: TTabSheet;
      tbsVouchers: TTabSheet;
      tlbAcoes: TToolBar;
      tlbAcoesTurma: TToolBar;
      updLote: TZUpdateSQL;
      updTurmas: TZUpdateSQL;
    qryLotesVL_DESCONTO_VISTA: TFloatField;
    qryVouchersVL_DESCONTO_VISTA: TFloatField;
    cdsVouchersVL_DESCONTO_VISTA: TFloatField;
    qryLotesTP_DESCONTO: TStringField;
    qryLotesTP_DESCONTO_GRID: TStringField;
    qryVouchersTP_DESCONTO: TStringField;
    cdsVouchersTP_DESCONTO_GRID: TStringField;
    cdsVouchersTP_DESCONTO: TStringField;
    cdsVouchersCD_PESSOA: TLargeintField;
    qryVouchersCD_PESSOA: TLargeintField;
    procedure qryLotesCalcFields(DataSet: TDataSet);
    procedure dbgVouchersColEnter(Sender: TObject);
    procedure dsVouchersDataChange(Sender: TObject; Field: TField);
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure bbtnLimparFiltrosClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnConsultarClick(Sender: TObject);
      procedure btnDesmarcarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnIncluirCursoClick(Sender: TObject);
      procedure btnIncluirTurmaClick(Sender: TObject);
      procedure btnMarcarClick(Sender: TObject);
      procedure btnRemoverTurmaClick(Sender: TObject);
      procedure cdsTurmasCalcFields(DataSet: TDataSet);
      procedure cdsVouchersAfterPost(DataSet: TDataSet);
      procedure cdsVouchersCalcFields(DataSet: TDataSet);
      procedure dbgTurmasCellClick(Column: TColumn);
      procedure dbgTurmasDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dbgVouchersDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsLotesDataChange(Sender: TObject; Field: TField);
      procedure dsLotesStateChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure sbCalendarioClick(Sender: TObject);
      procedure sbFiltroCursoClick(Sender: TObject);
      procedure sbFiltroFornecedorClick(Sender: TObject);
      procedure sbFiltroTurmaClick(Sender: TObject);
   private
      FPermissoes: TUMPermissoes;
      FParams: TParams;
      procedure UpdateButtonDeleteTurma;
      procedure OnSelectDate(const Date: TDate);
   end;

const
   SFiltroFornecedor = 'L.`CD_FORNECEDOR` = :CD_FORNECEDOR';
   SFiltroCurso = 'EXISTS(SELECT C.`CD_CURSO` FROM `UNIM_VOUCHER_LOTE_TURMA` O JOIN `TURMAS` T ON(O.`NR_ANOSEMESTRE` = T.`ANOSEMESTRE`) AND (O.`CD_TURMA`=T.`CODIGO`) JOIN `CURSOS_MESTRE` C ON (T.`CURSO`=C.`CD_CURSO`) WHERE L.`CD_LOTE`=O.`CD_LOTE` AND C.`CD_CURSO`=:CD_CURSO)';
   SFiltroTurma = 'EXISTS(SELECT T.`CD_TURMA` FROM `UNIM_VOUCHER_LOTE_TURMA` T WHERE L.`CD_LOTE` = T.`CD_LOTE` AND T.`NR_ANOSEMESTRE` = :NR_ANOSEMESTRE AND T.`CD_TURMA` = :CD_TURMA)';

var
   frmVouchers: TfrmVouchers;

implementation

{$R *.dfm}

uses
   uDM, UFVouchersCadastro, uFSelecionarCurso, uFSelecionarTurma,
   uFSelecionarPessoa, uLkJSON;

procedure TfrmVouchers.bbtnFiltrarClick(Sender: TObject);
const
   SSQL =
      'SELECT ' +
         'L.`CD_LOTE`,' +
         'L.`CD_FORNECEDOR`,' +
         'L.`DS_LOTE`,' +
         'L.`DT_VENCIMENTO`,' +
         'L.`DS_PREFIXO`,' +
         'L.`DS_SUFIXO`,' +
         'L.`VL_DESCONTO`,' +
         'L.`VL_DESCONTO_VISTA`,' +
         'L.`NR_QUANTIDADE`,' +
         'P.`NM_PESSOA`,' +
         'L.`TP_DESCONTO` '+
      'FROM ' +
         '`UNIM_VOUCHER_LOTE` L ' +
            'JOIN `PESSOAS` P ON ' +
               '(L.`CD_FORNECEDOR` = P.`CD_PESSOA`) %s';

   SWhere = 'WHERE %s'; 
var
   Filtros: TStrings;
   Param: TParam;
   SQL, S: AnsiString;
   I: Integer;
begin
   Filtros := TStringList.Create;
   try
      Param := FParams.FindParam('CD_FORNECEDOR');

      if Param <> nil then
         Filtros.Add(SFiltroFornecedor);

      Param := FParams.FindParam('CD_TURMA');

      if Param <> nil then
         Filtros.Add(SFiltroTurma);

      if Param = nil then
      begin
         Param := FParams.FindParam('CD_CURSO');

         if Param <> nil then
            Filtros.Add(SFiltroCurso);
      end;

      if Filtros.Count = 0 then
      begin
         SQL := Format(SSQL, ['']);
         qryLotes.Close;
         qryLotes.SQL.Text := SQL;
      end;

      if Filtros.Count > 0 then
      begin
         SQL := Format(SSQL, [SWhere]);

         S := '';
         for I := 0 to Filtros.Count - 1 do
         begin
            if S <> '' then
               S := S + ' AND ';

            S := S + Filtros[I];
         end;

         SQL := Format(SQL, [S]);

         qryLotes.Close;
         qryLotes.SQL.Text := SQL;
         qryLotes.Params.Assign(FParams);
      end;

      qryLotes.Open;
   finally
      FreeAndNil(Filtros);
   end;
end;

procedure TfrmVouchers.bbtnLimparFiltrosClick(Sender: TObject);
begin
   FParams.Clear;
   edtFiltroFornecedor.Clear;
   edtFiltroCurso.Clear;
   edtFiltroTurma.Clear;
end;

procedure TfrmVouchers.btnAlterarClick(Sender: TObject);
begin
   if TfrmVouchersCadastro.Edit(qryLotesCD_LOTE.AsLargeInt) = mrOk then
      qryLotes.Refresh;
end;

procedure TfrmVouchers.btnConsultarClick(Sender: TObject);
const
   SCaption = 'Consultar';
   SPrompt = 'Informe o código do voucher:';
   SNotFound = 'Voucher não encontrado.';
var
   S: AnsiString;
   LoteID, VoucherID: Cardinal;
begin
   if InputQuery(SCaption, SPrompt, S) then
   begin
      S := Trim(S);
      if S <> '' then
      begin
         qryConsultarVoucher.Close;
         qryConsultarVoucher.ParamByName('DS_VOUCHER').AsString := S;
         qryConsultarVoucher.Open;

         if qryConsultarVoucher.IsEmpty then
         begin
            MessageDlg(SNotFound, mtInformation, [mbOK], -1);
         end;

         if not qryConsultarVoucher.IsEmpty then
         begin
            LoteID := qryConsultarVoucherCD_LOTE.AsLargeInt;
            VoucherID := qryConsultarVoucherCD_VOUCHER.AsLargeInt;

            if not qryLotes.Locate('CD_LOTE', LoteID, []) then
            begin
               bbtnLimparFiltros.Click;
               bbtnFiltrar.Click;
            end;
            
            qryLotes.Locate('CD_LOTE', LoteID, []);
            cdsVouchers.Locate('CD_VOUCHER', VoucherID, []);
         end;
      end;
   end;
end;

procedure TfrmVouchers.btnDesmarcarClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsTurmas.GetBookmark;
   cdsTurmas.DisableControls;
   cdsTurmas.First;
   while not cdsTurmas.Eof do
   begin
      cdsTurmas.Edit;
      cdsTurmasSN_SELECIONADO.AsBoolean := False;
      cdsTurmas.Next;
   end;
   cdsTurmas.GotoBookmark(Bookmark);
   cdsTurmas.EnableControls;

   btnRemoverTurma.Enabled := False;
end;

procedure TfrmVouchers.btnExcluirClick(Sender: TObject);
const
   SMsgVoucherUtilizado = '1 voucher deste lote já foi utilizado. Não é possível realizar a exclusão.';
   SMsgVouchersUtilizados = '%d vouchers deste lote já foram utilizados. Não é possível realizar a exclusão.';
   SMsgConfirmacao = 'Deseja realmente excluir o lote selecionado e todos os seus vouchers?';
var
   Utilizados, UserChoice: Integer;
   S: AnsiString;
   JSON: TlkJSONobject;
begin
   Utilizados := StrToIntDef(cdsVouchersSUM_UTILIZADO.AsString, 0);

   if Utilizados = 1 then
   begin
      MessageDlg(SMsgVoucherUtilizado, mtError, [mbOK], -1);
   end;

   if Utilizados > 1 then
   begin
      S := Format(SMsgVouchersUtilizados, [Utilizados]);
      MessageDlg(S, mtError, [mbOK], -1);
   end;

   if Utilizados = 0 then
   begin
      UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

      if UserChoice = ID_YES then
      begin
         JSON := DM.RecordToJSON(qryLotes);
         try
            JSON.Add('vouchers', DM.DataSetToJson(cdsVouchers));
            S := UTF8Decode(TlkJSON.GenerateText(JSON));

            DM.setLog(0, 'Exclusao', qryLotesCD_LOTE.AsString, DM.UsuarioLogado.ColigadaLogada, S);
         finally
            FreeAndNil(JSON);
         end;

         qryLotes.Delete;
      end;
   end;
end;

procedure TfrmVouchers.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmVouchers.btnIncluirClick(Sender: TObject);
begin
   if TfrmVouchersCadastro.Insert = mrOk then
      qryLotes.Refresh;
end;

procedure TfrmVouchers.btnIncluirCursoClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente vincular todas as turmas do curso selecionado com este lote de vouchers?';
var
   ResultFiltro: TResultadoFiltroCurso;
   UserChoice: Integer;
   JSONList: TlkJSONlist;
   JSON: TlkJSONobject;
   S: AnsiString;
begin
   ResultFiltro := TfrmSelecionarCurso.Filtrar([]);

   if ResultFiltro.filtrado then
   begin
   
      UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

      if UserChoice = ID_YES then
      begin

         qryTurmasCurso.Close;
         qryTurmasCurso.ParamByName('NR_ANOSEMESTRE').AsInteger := ResultFiltro.nr_anosemestre;
         qryTurmasCurso.ParamByName('CD_CURSO').AsString := ResultFiltro.cd_curso;
         qryTurmasCurso.Open;

         JSON := TlkJSONobject.Create(False);
         try
            JSON.Add('CD_LOTE', qryLotesCD_LOTE.AsLargeInt);
            JSON.Add('turmas', DM.DataSetToJson(qryTurmasCurso));

            S := UTF8Decode(TlkJSON.GenerateText(JSON));

            DM.setLog(0, 'Inclusao', qryLotesCD_LOTE.AsString, DM.UsuarioLogado.ColigadaLogada, S);
            
         finally
            FreeAndNil(JSON);
         end;

         qryInsertCurso.ParamByName('CD_LOTE').AsInteger := qryLotesCD_LOTE.AsLargeInt;
         qryInsertCurso.ParamByName('NR_ANOSEMESTRE').AsInteger := ResultFiltro.nr_anosemestre;
         qryInsertCurso.ParamByName('CD_CURSO').AsString := ResultFiltro.cd_curso;
         qryInsertCurso.ExecSQL;
      end;

      cdsTurmas.Refresh;
      
   end;
end;

procedure TfrmVouchers.btnIncluirTurmaClick(Sender: TObject);
var
   ResultFiltro: TResultadoFiltroTurma;
   JSON: TlkJSONobject;
   S: AnsiString;
begin
   ResultFiltro := TfrmSelecionarTurma.Filtrar([], DM.GetAnoSemestreAtual,
      DM.UsuarioLogado.ColigadaLogada);

   if ResultFiltro.filtrado then
   begin

      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('CD_LOTE', qryLotesCD_LOTE.AsLargeInt);
         JSON.Add('NR_ANOSEMESTRE', ResultFiltro.nr_anosemestre);
         JSON.Add('CD_TURMA', ResultFiltro.cd_turma);

         S := TlkJSON.GenerateText(JSON);

         DM.setLog(0, 'Inclusao', qryLotesCD_LOTE.AsString, DM.UsuarioLogado.ColigadaLogada, S);
      finally
         FreeAndNil(JSON);
      end;

      qryInsertTurma.ParamByName('CD_LOTE').AsInteger := qryLotesCD_LOTE.AsLargeInt;
      qryInsertTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := ResultFiltro.nr_anosemestre;
      qryInsertTurma.ParamByName('CD_TURMA').AsString := ResultFiltro.cd_turma;
      qryInsertTurma.ExecSQL;
      cdsTurmas.Refresh;
   end;
end;

procedure TfrmVouchers.btnMarcarClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsTurmas.GetBookmark;
   cdsTurmas.DisableControls;
   cdsTurmas.First;
   while not cdsTurmas.Eof do
   begin
      cdsTurmas.Edit;
      cdsTurmasSN_SELECIONADO.AsBoolean := True;
      cdsTurmas.Next;
   end;
   cdsTurmas.GotoBookmark(Bookmark);
   cdsTurmas.EnableControls;

   UpdateButtonDeleteTurma;
end;

procedure TfrmVouchers.btnRemoverTurmaClick(Sender: TObject);
const
   SMsgConfirmar = 'Deseja realmente remover o vínculo com o lote para todas as turmas selecionadas?';
var
   UserChoice: Integer;
   JSON: TlkJSONobject;
   JSONList: TlkJSONlist;
   S: AnsiString;
begin
   UserChoice := MessageDlg(SMsgConfirmar, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin
      cdsTurmas.DisableControls;
      cdsTurmas.Filter := 'SN_SELECIONADO';
      cdsTurmas.Filtered := True;
      cdsTurmas.First;

      JSONList := TlkJSONlist.Create;

      while not cdsTurmas.IsEmpty do
      begin
         JSON := TlkJSONobject.Create(False);
         JSON.Add('NR_ANOSEMESTRE', cdsTurmasNR_ANOSEMESTRE.AsInteger);
         JSON.Add('CD_TURMA', cdsTurmasCD_TURMA.AsString);
         JSONList.Add(JSON);
         
         cdsTurmas.Delete;
      end;

      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('CD_LOTE', qryLotesCD_LOTE.AsLargeInt);
         JSON.Add('turmas', JSONList);

         S := UTF8Decode(TlkJSON.GenerateText(JSON));

         DM.setLog(0, 'Exclusao', qryLotesCD_LOTE.AsString, DM.UsuarioLogado.ColigadaLogada, S);
         
      finally
         FreeAndNil(JSON);
      end;

      cdsTurmas.ApplyUpdates(0);
      cdsTurmas.Filtered := False;
      cdsTurmas.EnableControls;
   end;
end;

procedure TfrmVouchers.cdsTurmasCalcFields(DataSet: TDataSet);
begin
   cdsTurmasNR_SELECIONADO.AsInteger := 0;

   if cdsTurmasSN_SELECIONADO.AsBoolean then
      cdsTurmasNR_SELECIONADO.AsInteger := 1;
end;

procedure TfrmVouchers.cdsVouchersAfterPost(DataSet: TDataSet);
var
   JSON, JSONBefore, JSONAfter: TlkJSONobject;
   S: AnsiString;
   I: Int64;
   D: TDateTime;
   F: Double;
begin
   JSONBefore := TlkJSONobject.Create(False);

   I := cdsVouchersCD_VOUCHER.OldValue;
   JSONBefore.Add('CD_VOUCHER', I);

   I := cdsVouchersCD_LOTE.OldValue;
   JSONBefore.Add('CD_LOTE', I);

   if cdsVouchersCD_PESSOA.OldValue = Null then
      JSONBefore.Add('CD_PESSOA', TlkJSONnull.Create);

   if cdsVouchersCD_PESSOA.OldValue <> Null then
   begin
      I := cdsVouchersCD_PESSOA.OldValue;
      JSONBefore.Add('CD_PESSOA', I);
   end;

   I := cdsVouchersNR_SEQUENCIAL.OldValue;
   JSONBefore.Add('NR_SEQUENCIAL', I);

   S := cdsVouchersDS_VOUCHER.OldValue;
   JSONBefore.Add('DS_VOUCHER', S);

   if cdsVouchersDT_VENCIMENTO.OldValue = Null then
      JSONBefore.Add('DT_VENCIMENTO', TlkJSONnull.Create);

   if cdsVouchersDT_VENCIMENTO.OldValue <> Null then
   begin
      D := VarToDateTime(cdsVouchersDT_VENCIMENTO.OldValue);
      S := DateToStr(D);
      JSONBefore.Add('DT_VENCIMENTO', S);
   end;

   F := cdsVouchersVL_DESCONTO.OldValue;
   JSONBefore.Add('VL_DESCONTO', F);

   F := cdsVouchersVL_DESCONTO_VISTA.OldValue;
   JSONBefore.Add('VL_DESCONTO_VISTA', F);

   JSONAfter := TlkJSONobject.Create(False);
   JSONAfter.Add('CD_VOUCHER', cdsVouchersCD_VOUCHER.AsLargeInt);
   JSONAfter.Add('CD_LOTE', cdsVouchersCD_LOTE.AsLargeInt);
   JSONAfter.Add('CD_PESSOA', cdsVouchersCD_PESSOA.AsInteger);
   JSONAfter.Add('NR_SEQUENCIAL', cdsVouchersNR_SEQUENCIAL.AsLargeInt);
   JSONAfter.Add('DS_VOUCHER', cdsVouchersDS_VOUCHER.AsString);
   JSONAfter.Add('DT_VENCIMENTO', cdsVouchersDT_VENCIMENTO.AsString);
   JSONAfter.Add('VL_DESCONTO', cdsVouchersVL_DESCONTO.AsFloat);
   JSONAfter.Add('VL_DESCONTO_VISTA', cdsVouchersVL_DESCONTO_VISTA.AsFloat);

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('antigo', JSONBefore);
      JSON.Add('novo', JSONAfter);
      S := UTF8Decode(TlkJSON.GenerateText(JSON));

      DM.setLog(0, 'Alteracao', qryLotesCD_LOTE.AsString, DM.UsuarioLogado.ColigadaLogada, S);
   finally
      FreeAndNil(JSON);
   end;
   
   cdsVouchers.ApplyUpdates(0);
end;

procedure TfrmVouchers.cdsVouchersCalcFields(DataSet: TDataSet);
begin
   cdsVouchersSN_UTILIZADO.AsBoolean := not cdsVouchersCD_PESSOA.IsNull;

   cdsVouchersNR_UTILIZADO.AsInteger := 0;

   if cdsVouchersSN_UTILIZADO.AsBoolean then
      cdsVouchersNR_UTILIZADO.AsInteger := 1;

   if cdsVouchersTP_DESCONTO.AsString = 'F' then
   begin
      cdsVouchersTP_DESCONTO_GRID.AsString:= 'Valor Fixo'
   end
   else
   begin
     cdsVouchersTP_DESCONTO_GRID.AsString:= 'Percentual';
   end;
end;

procedure TfrmVouchers.dbgTurmasCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
      UpdateButtonDeleteTurma;
   end;
end;

procedure TfrmVouchers.dbgTurmasDrawColumnCell(Sender: TObject;
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

procedure TfrmVouchers.dbgVouchersColEnter(Sender: TObject);
var
   GridOptions: TDBGridOptions;
begin
   GridOptions := dbgVouchers.Options;

   Exclude(GridOptions, dgEditing);

   if dbgVouchers.SelectedField.FieldName = 'VL_DESCONTO' then
      Include(GridOptions, dgEditing);

   if dbgVouchers.SelectedField.FieldName = 'VL_DESCONTO_VISTA' then
      Include(GridOptions, dgEditing);

   dbgVouchers.Options := GridOptions;
end;

procedure TfrmVouchers.dbgVouchersDrawColumnCell(Sender: TObject;
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

   if (Column.FieldName = 'DT_VENCIMENTO') and
      (gdSelected in State) and
      (gdFocused in State) then
   begin

      sbCalendario.Visible :=
         (npAlterar in FPermissoes) and
         (not cdsVouchersSN_UTILIZADO.AsBoolean);

      if sbCalendario.Visible then
      begin

         DrawRect := Rect;
         InflateRect(DrawRect, -2, -2);
         sbCalendario.Parent := dbgVouchers;
         sbCalendario.Height := DrawRect.Bottom - DrawRect.Top;
         sbCalendario.Top := DrawRect.Top;
         sbCalendario.Left := DrawRect.Right - sbCalendario.Width;
      end;

   end;

end;

procedure TfrmVouchers.dsLotesDataChange(Sender: TObject; Field: TField);
var
   I: Integer;
begin
   cdsVouchers.Close;
   cdsVouchers.Params.ParamByName('CD_LOTE').AsInteger := qryLotesCD_LOTE.AsLargeInt;
   cdsVouchers.Open;
   cdsVouchers.Refresh;

   cdsTurmas.Close;
   cdsTurmas.Params.ParamByName('CD_LOTE').AsInteger := qryLotesCD_LOTE.AsLargeInt;
   cdsTurmas.Open;

   btnIncluirCurso.Enabled := (npIncluir in FPermissoes);
   btnIncluirTurma.Enabled := (npIncluir in FPermissoes);
   btnRemoverTurma.Enabled := False;
end;

procedure TfrmVouchers.dsLotesStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := (npIncluir in FPermissoes) and (dsBrowse = qryLotes.State);
   btnAlterar.Enabled := (npAlterar in FPermissoes) and (dsBrowse = qryLotes.State) and (not qryLotes.IsEmpty);
   btnExcluir.Enabled := (npExcluir in FPermissoes) and (dsBrowse = qryLotes.State) and (not qryLotes.IsEmpty);
   btnSalvar.Enabled := qryLotes.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryLotes.State in [dsInsert, dsEdit];
   btnConsultar.Enabled := qryLotes.State = dsBrowse;
   btnFechar.Enabled := qryLotes.State = dsBrowse;
   sbFiltroCurso.Enabled := qryLotes.State = dsBrowse;
   sbFiltroTurma.Enabled := qryLotes.State = dsBrowse;
   sbFiltroFornecedor.Enabled := qryLotes.State = dsBrowse;
   btnIncluirCurso.Enabled := (qryLotes.State = dsBrowse) and (not qryLotes.IsEmpty);
   btnIncluirTurma.Enabled := (qryLotes.State = dsBrowse) and (not qryLotes.IsEmpty);
   btnRemoverTurma.Enabled := qryLotes.State = dsBrowse;
end;

procedure TfrmVouchers.dsVouchersDataChange(Sender: TObject; Field: TField);
begin
   sbCalendario.Visible := False;

   dbgVouchers.Columns[3].ReadOnly := True;

   if (npAlterar in FPermissoes) and (not cdsVouchersSN_UTILIZADO.AsBoolean) then
      dbgVouchers.Columns[3].ReadOnly := False;
end;

procedure TfrmVouchers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryLotes.Close;
   qryVouchers.Close;
   cdsTurmas.Close;
   Action := caFree;
   frmVouchers := nil;
end;

procedure TfrmVouchers.FormCreate(Sender: TObject);
const
   SChavePermissao = 'UMFinanceiro.Vouchers';
begin
   FPermissoes := DM.UsuarioLogado.GetPermissoes(DM.UsuarioLogado.Pessoa.Codigo, SChavePermissao);
   FParams := TParams.Create;
   qryLotes.Open;
   qryVouchers.Open;
   cdsTurmas.Open;
end;

procedure TfrmVouchers.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F5:
         if btnSalvar.Enabled then
            btnSalvar.Click;
      VK_F6:
         if btnCancelar.Enabled then
            btnCancelar.Click;
      VK_F7:
         if btnConsultar.Enabled then
            btnConsultar.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfrmVouchers.OnSelectDate(const Date: TDate);
begin
   cdsVouchers.Edit;
   cdsVouchersDT_VENCIMENTO.AsDateTime := Date;
   cdsVouchers.Post;
end;

procedure TfrmVouchers.qryLotesCalcFields(DataSet: TDataSet);
begin
  if qryLotesTP_DESCONTO.AsString = 'F' then
  begin
    qryLotesTP_DESCONTO_GRID.AsString:= 'Valor Fixo'
  end
  else
  begin
    qryLotesTP_DESCONTO_GRID.AsString:= 'Percentual';
  end;
end;

procedure TfrmVouchers.sbCalendarioClick(Sender: TObject);
var
   HasDate: Boolean;
begin
   if (not cdsVouchersSN_UTILIZADO.AsBoolean) and (npAlterar in FPermissoes) then
   begin
      HasDate := not cdsVouchersDT_VENCIMENTO.IsNull;

      if HasDate then
         TfrmMonthCalendar.ShowCalendar(sbCalendario, OnSelectDate,
            cdsVouchersDT_VENCIMENTO.AsDateTime);

      if not HasDate then
         TfrmMonthCalendar.ShowCalendar(sbCalendario, OnSelectDate);
   end;
end;

procedure TfrmVouchers.sbFiltroCursoClick(Sender: TObject);
var
   ResultFiltro: TResultadoFiltroCurso;
   Param: TParam;
begin
   ResultFiltro := TfrmSelecionarCurso.Filtrar([]);

   if ResultFiltro.filtrado then
   begin

      Param := FParams.FindParam('CD_CURSO');

      if Param = nil then
         Param := FParams.CreateParam(ftUnknown, 'CD_CURSO', ptUnknown);

      Param.AsString := ResultFiltro.cd_curso;

      edtFiltroCurso.Text := ResultFiltro.ds_curso;

   end;
end;

procedure TfrmVouchers.sbFiltroFornecedorClick(Sender: TObject);
var
   ResultFiltro: TResultadoFiltroPessoa;
   Param: TParam;
begin
   ResultFiltro := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);
   
   if ResultFiltro.filtrado then
   begin
      Param := FParams.FindParam('CD_FORNECEDOR');

      if Param = nil then
         Param := FParams.CreateParam(ftUnknown, 'CD_FORNECEDOR', ptUnknown);

      Param.AsInteger := ResultFiltro.cd_pessoa;

      edtFiltroFornecedor.Text := ResultFiltro.nm_pessoa;
   end;
end;

procedure TfrmVouchers.sbFiltroTurmaClick(Sender: TObject);
var
   ResultFiltro: TResultadoFiltroTurma;
   Param: TParam;
begin
   ResultFiltro := TfrmSelecionarTurma.Filtrar([], DM.GetAnoSemestreAtual,
      DM.UsuarioLogado.ColigadaLogada);

   if ResultFiltro.filtrado then
   begin
      Param := FParams.FindParam('CD_TURMA');

      if Param = nil then
         Param := FParams.CreateParam(ftUnknown, 'CD_TURMA', ptUnknown);

      Param.AsString := ResultFiltro.cd_turma;

      Param := FParams.FindParam('NR_ANOSEMESTRE');

      if Param = nil then
         Param := FParams.CreateParam(ftUnknown, 'NR_ANOSEMESTRE', ptUnknown);

      Param.AsInteger := ResultFiltro.nr_anosemestre;

      Param := FParams.FindParam('CD_CURSO');

      if Param <> nil then
         FParams.RemoveParam(Param);

      edtFiltroTurma.Text := ResultFiltro.cd_turma;
   end;
end;

procedure TfrmVouchers.UpdateButtonDeleteTurma;
var
   Utilizados, Selecionados: Integer;
begin
   Utilizados := StrToIntDef(cdsVouchersSUM_UTILIZADO.AsString, 0);
   Selecionados := StrToIntDef(cdsTurmasSUM_SELECIONADO.AsString, 0);

   btnRemoverTurma.Enabled :=
      (npExcluir in FPermissoes) and
      (Utilizados = 0) and
      (Selecionados > 0);
end;

end.
