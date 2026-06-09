unit UFFinRepasseAluno;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, DB, ZAbstractRODataset,
   UZDataset, Provider, DBClient, Grids, DBGrids, UDBGrids, StdCtrls,
   UMEditMonetario, Spin, Buttons, UZDbcFuncs, ZDbcIntfs, DateUtils, uUsuario,
  ZAbstractDataset, Mask;

type
   TfrmFinRepasseAluno = class(TForm)
      bbtnPadrao: TBitBtn;
      btnCancelar: TToolButton;
      btnSalvar: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      cdsAlunos: TClientDataSet;
      cdsAlunosCD_CONTRATO: TLargeintField;
      cdsAlunosCD_SITUACAO_PAI: TIntegerField;
      cdsAlunosCODIGOALUNO: TIntegerField;
      cdsAlunosCOUNT_REGISTROS: TAggregateField;
      cdsAlunosCOUNT_SELECAO: TAggregateField;
      cdsAlunosDS_SITUACAO: TStringField;
      cdsAlunosNM_PESSOA: TStringField;
      cdsAlunosNR_PARCELAS: TSmallintField;
      cdsAlunosSN_ATIVO: TFloatField;
      cdsAlunosSUM_SELECAO: TAggregateField;
      cdsAlunosSUM_VALOR: TAggregateField;
      cdsAlunosVL_REPASSE: TFloatField;
      dbgAlunos: TSortedDBGrid;
      dsAlunos: TDataSource;
      dspAlunos: TDataSetProvider;
      edtValor: TUMEditMonetario;
      ilAcoes: TImageList;
      lblPadrao: TLabel;
      lblParcelas: TLabel;
      lblPrimeira: TLabel;
      lblValor: TLabel;
      meReferencia: TMaskEdit;
      pnlAlunos: TPanel;
      pnlPadrao: TPanel;
      qryAlunos: TUMZReadOnlyQuery;
      qryAlunosCD_CONTRATO: TLargeintField;
      qryAlunosCD_SITUACAO_PAI: TIntegerField;
      qryAlunosCODIGOALUNO: TIntegerField;
      qryAlunosDS_SITUACAO: TStringField;
      qryAlunosNM_PESSOA: TStringField;
      qryAlunosNR_PARCELAS: TSmallintField;
      qryAlunosSN_ATIVO: TFloatField;
      qryAlunosVL_REPASSE: TFloatField;
      qryTurma: TUMZQuery;
      qryTurmaCD_CONTRATO: TLargeintField;
      qryTurmaCD_TURMA: TStringField;
      qryTurmaDT_REFERENCIA: TDateField;
      qryTurmaNR_ANOSEMESTRE: TIntegerField;
      qryTurmaNR_PARCELAS: TSmallintField;
      qryTurmaSN_ATIVO: TSmallintField;
      qryTurmaVL_REPASSE: TFloatField;
      speParcelas: TSpinEdit;
      stbStatus: TStatusBar;
      tlbAcoes: TToolBar;
      procedure bbtnPadraoClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure cdsAlunosAfterOpen(DataSet: TDataSet);
      procedure cdsAlunosAfterPost(DataSet: TDataSet);
      procedure dbgAlunosCellClick(Column: TColumn);
      procedure dbgAlunosColEnter(Sender: TObject);
      procedure dbgAlunosDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      FPermissoes: TUMPermissoes;
      procedure UpdateStatusBar;
   public
      class function Edit(const ContratoID, AnoSemestre: Integer;
         const TurmaID: AnsiString): Boolean;
   end;

implementation

uses
   uDM, UFMonthCalendar;

{$R *.dfm}

{ TfrmFinRepasseAluno }

procedure TfrmFinRepasseAluno.bbtnPadraoClick(Sender: TObject);
const
   DefaultDateFmt = '01/%s';
var
   StartDate: TDate;
begin
   StartDate := StrToDate(Format(DefaultDateFmt, [meReferencia.Text]));

   cdsAlunos.DisableControls;
   cdsAlunos.First;
   
   while not cdsAlunos.Eof do
   begin
      cdsAlunos.Edit;
      cdsAlunosVL_REPASSE.AsFloat := edtValor.getValorDouble;
      cdsAlunosNR_PARCELAS.AsInteger := speParcelas.Value;
      cdsAlunos.Next;
   end;

   if cdsAlunos.State = dsEdit then
      cdsAlunos.Post;
      
   cdsAlunos.First;
   cdsAlunos.EnableControls;

   UpdateStatusBar;
end;

procedure TfrmFinRepasseAluno.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmFinRepasseAluno.btnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmFinRepasseAluno.cdsAlunosAfterOpen(DataSet: TDataSet);
begin
   UpdateStatusBar;
end;

procedure TfrmFinRepasseAluno.cdsAlunosAfterPost(DataSet: TDataSet);
begin
   UpdateStatusBar;
end;

procedure TfrmFinRepasseAluno.dbgAlunosCellClick(Column: TColumn);
const
   ReverseValue: array[0..1] of Integer = (1, 0);
var
   Grid: TSortedDBGrid;
   GridOptions: TDBGridOptions;
begin
   Grid := TSortedDBGrid(Column.Grid);

   GridOptions := Grid.Options;

   Include(GridOptions, dgEditing);

   if Column.FieldName = 'SN_ATIVO' then
   begin
      Exclude(GridOptions, dgEditing);
      Column.Field.DataSet.Edit;
      Column.Field.AsInteger := ReverseValue[Column.Field.AsInteger];
      Column.Field.DataSet.Post;
      UpdateStatusBar;
   end;

   Grid.Options := GridOPtions;
end;

procedure TfrmFinRepasseAluno.dbgAlunosColEnter(Sender: TObject);
var
   Grid: TSortedDBGrid;
   GridOptions: TDBGridOptions;
begin
   Grid := TSortedDBGrid(Sender);

   GridOptions := Grid.Options;

   Include(GridOptions, dgEditing);

   if Grid.SelectedField.FieldName = 'SN_ATIVO' then
      Exclude(GridOptions, dgEditing);

   Grid.Options := GridOPtions;
end;

procedure TfrmFinRepasseAluno.dbgAlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.FieldName = 'SN_ATIVO' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger = 1]);
   end;
end;

class function TfrmFinRepasseAluno.Edit(const ContratoID, AnoSemestre: Integer;
   const TurmaID: AnsiString): Boolean;
const
   DefaultDateFmt = '01/%s';
   SQLInsertRepasse = ''
      + ' INSERT INTO CONV_CONTRATOS_TURMAS_PESSOAS ( '
      + '   CD_CONTRATO, '
      + '   CD_TURMA, '
      + '   NR_ANOSEMESTRE, '
      + '   CD_PESSOA, '
      + '   NR_PARCELAS, '
      + '   VL_REPASSE, '
      + '   SN_ATIVO '
      + ' ) VALUES (?, ?, ?, ?, ?, ?, ?) ';
   SQLUpdateRepasse = ''
      + ' UPDATE '
      + '   CONV_CONTRATOS_TURMAS_PESSOAS '
      + ' SET '
      + '   NR_PARCELAS = ?, '
      + '   VL_REPASSE = ?, '
      + '   SN_ATIVO = ? '
      + ' WHERE '
      + '   CD_CONTRATO = ? AND '
      + '   CD_TURMA = ? AND '
      + '   NR_ANOSEMESTRE = ? AND '
      + '   CD_PESSOA = ? ';
   SQLUpdateTurma = ''
      + ' UPDATE '
      + '   CONV_CONTRATOS_TURMAS '
      + ' SET '
      + '   NR_PARCELAS = ?, '
      + '   DT_REFERENCIA = ? '
      + ' WHERE '
      + '   CD_CONTRATO = ? AND '
      + '   CD_TURMA = ? AND '
      + '   NR_ANOSEMESTRE = ? ';
var
   Form: TfrmFinRepasseAluno;
   Stmt: IZPreparedStatement;
   StartDate: TDate;
begin
   Application.CreateForm(TfrmFinRepasseAluno, Form);

   Form.meReferencia.Text := FormatDateTime('mm/yyyy', Date);

   Form.qryTurma.Close;
   Form.qryTurma.ParamByName('CD_CONTRATO').AsInteger := ContratoID;
   Form.qryTurma.ParamByName('CD_TURMA').AsString := TurmaID;
   Form.qryTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   Form.qryTurma.Open;

   Form.edtValor.setValor(0);
   Form.speParcelas.Value := Form.qryTurmaNR_PARCELAS.AsInteger;
   Form.meReferencia.Text := FormatDateTime('mm/yyyy', Form.qryTurmaDT_REFERENCIA.AsDateTime);

   Form.cdsAlunos.Close;
   Form.cdsAlunos.Params.ParamByName('CD_CONTRATO').AsInteger := ContratoID;
   Form.cdsAlunos.Params.ParamByName('CD_TURMA').AsString := TurmaID;
   Form.cdsAlunos.Params.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   Form.cdsAlunos.Open;

   Result := Form.ShowModal = mrOk;

   if Result then
   begin
      Form.cdsAlunos.DisableControls;
      Form.cdsAlunos.First;
      while not Form.cdsAlunos.Eof do
      begin

         if Form.cdsAlunosCD_CONTRATO.IsNull then
         begin
            Stmt := PrepareStatement(SQLInsertRepasse);
            try
               Stmt.SetInt(1, ContratoID);
               Stmt.SetString(2, TurmaID);
               Stmt.SetInt(3, AnoSemestre);
               Stmt.SetInt(4, Form.cdsAlunosCODIGOALUNO.AsInteger);
               Stmt.SetInt(5, Form.cdsAlunosNR_PARCELAS.AsInteger);
               Stmt.SetDouble(6, Form.cdsAlunosVL_REPASSE.AsFloat);
               Stmt.SetInt(7, Form.cdsAlunosSN_ATIVO.AsInteger);
               Stmt.ExecutePrepared;
            finally
               Stmt.Close;
               Stmt := nil;
            end;
         end;        

         if not Form.cdsAlunosCD_CONTRATO.IsNull then
         begin
            Stmt := PrepareStatement(SQLUpdateRepasse);
            try
               Stmt.SetInt(1, Form.cdsAlunosNR_PARCELAS.AsInteger);
               Stmt.SetDouble(2, Form.cdsAlunosVL_REPASSE.AsFloat);
               Stmt.SetInt(3, Form.cdsAlunosSN_ATIVO.AsInteger);
               Stmt.SetInt(4, ContratoID);
               Stmt.SetString(5, TurmaID);
               Stmt.SetInt(6, AnoSemestre);
               Stmt.SetInt(7, Form.cdsAlunosCODIGOALUNO.AsInteger);
               Stmt.ExecutePrepared;
            finally
               Stmt.Close;
               Stmt := nil;
            end;
         end;

         StartDate := StrToDate(Format(DefaultDateFmt, [Form.meReferencia.Text]));

         Stmt := PrepareStatement(SQLUpdateTurma);
         try
            Stmt.SetInt(1, Form.speParcelas.Value);
            Stmt.SetDate(2, StartDate);
            Stmt.SetInt(3, ContratoID);
            Stmt.SetString(4, TurmaID);
            Stmt.SetInt(5, AnoSemestre);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
            Stmt := nil;
         end;

         Form.cdsAlunos.Next;
      end;
   end;
   
end;

procedure TfrmFinRepasseAluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFinRepasseAluno.FormCreate(Sender: TObject);
const
   ChavePermissao = 'UMFinanceiro.Contratos.IndicaoRepasse';
begin
   FPermissoes := DM.UsuarioLogado.GetPermissoes(0, ChavePermissao);

   edtValor.Enabled := npEspecial in FPermissoes;
   speParcelas.Enabled := npEspecial in FPermissoes;
   meReferencia.Enabled := npEspecial in FPermissoes;
   btnSalvar.Enabled := (npAlterar in FPermissoes) and (npIncluir in FPermissoes);
end;

procedure TfrmFinRepasseAluno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if btnSalvar.Enabled then
            btnSalvar.Click;
      VK_F6:
         if btnCancelar.Enabled then
            btnCancelar.Click;
   end;
end;

procedure TfrmFinRepasseAluno.UpdateStatusBar;
const
   ValorTotalSelecaoFmt = 'Valor total selecionado: R$ %s';
   RegistrosSelecionados = '%d registro(s) selecionado(s) num total de %d';
   CurrencyFmt = '###,###,##0.00';
var
   S: AnsiString;
   Registros, Selecionados: Integer;
   TotalSelecao: Currency;
   FmtSettings: TFormatSettings;
begin
   if not TryStrToCurr(cdsAlunosSUM_SELECAO.AsString, TotalSelecao) then
   begin
      TotalSelecao := 0;
   end;

   Selecionados := 0;
   
   if TryStrToInt(cdsAlunosCOUNT_SELECAO.AsString, Selecionados) then
   begin
      if (Selecionados = 0) and (TotalSelecao <> 0) then
      begin
         TotalSelecao := 0;
      end;
   end;

   Registros := StrToIntDef(cdsAlunosCOUNT_REGISTROS.AsString, 0);

   S := Format(RegistrosSelecionados, [Selecionados, Registros]);

   stbStatus.Panels[2].Text := S;

   FmtSettings.ThousandSeparator := #46;
   FmtSettings.DecimalSeparator := #44;

   S := FormatCurr(CurrencyFmt, TotalSelecao, FmtSettings);
   stbStatus.Panels[1].Text := Format(ValorTotalSelecaoFmt, [S]);
end;

end.
