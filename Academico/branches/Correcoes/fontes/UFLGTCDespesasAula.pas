unit UFLGTCDespesasAula;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ToolWin, ComCtrls, ImgList, Grids, DBGrids, DB,
   DBClient, Buttons, ZAbstractRODataset, ZAbstractDataset, UZDataset, DBCtrls,
   UZSortedGrid, ZSqlUpdate, UFLGTCDespesas, uUsuario;

type
   TfrmLGTCDespesasAula = class(TForm)
      btnAlterar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnSep3: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      dbgDespesas: TZSortedGrid;
      dbtAula: TDBText;
      dbtCurso: TDBText;
      dbtData: TDBText;
      dbtDisciplina: TDBText;
      dbtProfessor: TDBText;
      dbtTurma: TDBText;
      dsAula: TDataSource;
      dsDespesas: TDataSource;
      gbAula: TGroupBox;
      gbDespesas: TGroupBox;
      ilAcoes: TImageList;
      lblEtiquetaAula: TLabel;
      lblEtiquetaCurso: TLabel;
      lblEtiquetaData: TLabel;
      lblEtiquetaDisciplina: TLabel;
      lblEtiquetaProfessor: TLabel;
      lblEtiquetaTurma: TLabel;
      pnlTitulo: TPanel;
      pnlTudo: TPanel;
      qryAula: TUMZReadOnlyQuery;
      qryAulaANOSEMESTRE: TSmallintField;
      qryAulaBIMESTRE: TSmallintField;
      qryAulaCD_DIARIO_AULA: TLargeintField;
      qryAulaCD_PROFESSOR: TIntegerField;
      qryAulaCURSO: TStringField;
      qryAulaDATA: TDateTimeField;
      qryAulaDESCRICAO: TStringField;
      qryAulaNM_PESSOA: TStringField;
      qryAulaNRO_AULA: TSmallintField;
      qryAulaTURMA: TStringField;
      qryDespesas: TUMZQuery;
      qryDespesasCD_DESPESA: TLargeintField;
      qryDespesasCD_DIARIO_AULA: TLargeintField;
      qryDespesasDS_CONTA: TStringField;
      qryDespesasDS_OBSERVACAO: TStringField;
      qryDespesasDS_SITUACAO: TStringField;
      qryDespesasDS_TIPO_DESPESA: TStringField;
      qryDespesasNM_PESSOA: TStringField;
      qryDespesasVL_TOTAL: TFloatField;
      sbAlterarAula: TSpeedButton;
      tlbAcoes: TToolBar;
      updDespesas: TZUpdateSQL;
      procedure btnAlterarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
      procedure qryDespesasAfterRefresh(DataSet: TDataSet);
      procedure sbAlterarAulaClick(Sender: TObject);
   private
      function GetPermissoes: TUMPermissoes;
      property Permissoes: TUMPermissoes read GetPermissoes;
   public
      function Edit(const AulaID, DespesaID: UINT): TModalResult;
   end;

var
   frmLGTCDespesasAula: TfrmLGTCDespesasAula;

implementation

uses
   UFAulasBuscar, UFLGTCDespesasItem, UFLGTCDespesa, uDM, uLkJSON;

{$R *.dfm}

const
   Modulo = 2102;

procedure TfrmLGTCDespesasAula.btnAlterarClick(Sender: TObject);
begin
   btnIncluir.Click;
end;

procedure TfrmLGTCDespesasAula.btnExcluirClick(Sender: TObject);
const
   SMsgConfirmaExclusao = 'Deseja realmente remover a despesa "%s" no valor total de R$ %f?';
var
   JSON: TlkJSONobject;
   Chave, S: AnsiString;
begin
   S := Format(SMsgConfirmaExclusao, [qryDespesasDS_TIPO_DESPESA.AsString, qryDespesasVL_TOTAL.AsCurrency]);
   
   if MessageDlg(S, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      JSON := DM.RecordToJSON(qryDespesas);
      try
         Chave := qryDespesasCD_DESPESA.AsString;
         DM.setLog(Modulo, 'Exclusão', Chave, 0, UTF8Decode(TlkJSON.GenerateText(JSON)));
         qryDespesas.Delete;
      finally
         FreeAndNil(JSON);
      end;
   end;
end;

procedure TfrmLGTCDespesasAula.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmLGTCDespesasAula.btnIncluirClick(Sender: TObject);
begin
   Application.CreateForm(TfrmLGTCDespesasItem, frmLGTCDespesasItem);

   if qryDespesas.IsEmpty then
   begin
      if frmLGTCDespesasItem.Edit(
         qryAulaCD_DIARIO_AULA.AsLargeInt,
         qryAulaCD_PROFESSOR.AsInteger) = mrOk then
      begin
         qryDespesas.Refresh;
         btnAlterar.Enabled := (not qryDespesas.IsEmpty) and (npAlterar in Permissoes);
      end;

      Exit;
   end;

   if frmLGTCDespesasItem.Edit(
      qryAulaCD_DIARIO_AULA.AsLargeInt,
      qryAulaCD_PROFESSOR.AsInteger,
      qryDespesasCD_DESPESA.AsLargeInt) = mrOk then
   begin
      qryDespesas.Refresh;
      btnAlterar.Enabled := (not qryDespesas.IsEmpty) and (npAlterar in Permissoes);
   end;
end;

function TfrmLGTCDespesasAula.Edit(const AulaID, DespesaID: UINT): TModalResult;
begin
   qryAula.Close;
   qryAula.ParamByName('CD_DIARIO_AULA').AsInteger := AulaID;
   qryAula.Open;

   qryDespesas.Refresh;
   qryDespesas.Locate('CD_DESPESA', DespesaID, []);

   btnIncluir.Enabled := npIncluir in Permissoes;
   btnAlterar.Enabled := (not qryDespesas.IsEmpty) and (npAlterar in Permissoes);
   btnExcluir.Enabled := (not qryDespesas.IsEmpty) and (npExcluir in Permissoes);

   sbAlterarAula.Hide;

   Result := ShowModal;
end;

procedure TfrmLGTCDespesasAula.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLGTCDespesasAula.FormCreate(Sender: TObject);
begin
   qryDespesas.Open;
end;

procedure TfrmLGTCDespesasAula.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLGTCDespesasAula.FormShow(Sender: TObject);
begin
   if qryAula.IsEmpty then
      sbAlterarAula.Click;

   if qryAula.IsEmpty then
      PostMessage(Handle, WM_CLOSE, 0, 0);
end;

function TfrmLGTCDespesasAula.GetPermissoes: TUMPermissoes;
begin
   Result := frmLGTCDespesas.Permissoes;
end;

procedure TfrmLGTCDespesasAula.qryDespesasAfterRefresh(DataSet: TDataSet);
begin
   btnExcluir.Enabled := not qryDespesas.IsEmpty;
end;

procedure TfrmLGTCDespesasAula.sbAlterarAulaClick(Sender: TObject);
begin
   if frmAulasBuscar = nil then
      Application.CreateForm(TfrmAulasBuscar, frmAulasBuscar);

   if frmAulasBuscar.ShowModal = mrOk then
   begin
      qryAula.Close;
      qryAula.ParamByName('CD_DIARIO_AULA').AsInteger := frmAulasBuscar.qryAulasCD_DIARIO_AULA.AsLargeInt;
      qryAula.Open;

      btnExcluir.Enabled := (not qryDespesas.IsEmpty) and (npExcluir in Permissoes);
      btnAlterar.Enabled := (not qryDespesas.IsEmpty) and (npAlterar in Permissoes);
      btnIncluir.Enabled := npIncluir in Permissoes;
   end;

end;

end.
