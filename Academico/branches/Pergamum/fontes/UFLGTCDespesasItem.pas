unit UFLGTCDespesasItem;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList, DB,
   ZAbstractRODataset, UZDataset, DBCtrls, Buttons, Menus, Contnrs,
   UFLGTCDespesasAula, UFLGTCDespesa, UFLGTCDespesas, uUsuario;

type
   TfrmLGTCDespesasItem = class(TForm)
      btnDescartarFechar: TToolButton;
      btnExcluir: TToolButton;
      btnSalvarFechar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnSep3: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      dblcTiposDespesa: TDBLookupComboBox;
      dsValores: TDataSource;
      gbTipoDespesa: TGroupBox;
      ilAcoes: TImageList;
      lblTipoDespesa: TLabel;
      pgcDespesas: TPageControl;
      pnlTitulo: TPanel;
      pnlTudo: TPanel;
      qryDespesas: TUMZReadOnlyQuery;
      qryDespesasCD_DESPESA: TLargeintField;
      qryDespesasCD_DIARIO_AULA: TLargeintField;
      qryDespesasDS_CHAVE: TStringField;
      qryDespesasDS_TIPO_DESPESA: TStringField;
      qryFornecedorSala: TUMZReadOnlyQuery;
      qryFornecedorSalaCD_FORNECEDOR: TLargeintField;
      qryTiposDespesa: TUMZReadOnlyQuery;
      qryTiposDespesaCD_COLIGADA_MATRIZ: TIntegerField;
      qryTiposDespesaCD_CONTA: TLargeintField;
      qryTiposDespesaCD_TIPO_DESPESA: TLargeintField;
      qryTiposDespesaCD_TIPO_TITULO: TIntegerField;
      qryTiposDespesaDS_CHAVE: TStringField;
      qryTiposDespesaDS_CHAVE_FORNECEDOR: TStringField;
      qryTiposDespesaDS_TIPO_DESPESA: TStringField;
      qryTiposDespesaSN_ATIVO: TSmallintField;
      qryTiposDespesaSN_PADRAO: TSmallintField;
      sbAdicionar: TSpeedButton;
      tlbAcoes: TToolBar;
      procedure btnDescartarFecharClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnSalvarFecharClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure pgcDespesasChange(Sender: TObject);
      procedure sbAdicionarClick(Sender: TObject);
   private
      FAulaID: UINT;
      FProfessorID: UINT;
      FFrames: TComponentList;
      function GetFornecedor: UINT;
      function GetPermissoes: TUMPermissoes;
      property Permissoes: TUMPermissoes read GetPermissoes;
   public
      function Edit(const AulaID, ProfessorID: UINT): TModalResult; overload;
      function Edit(const AulaID, ProfessorID, DespesaID: UINT): TModalResult; overload;
   end;

var
   frmLGTCDespesasItem: TfrmLGTCDespesasItem;

implementation

{$R *.dfm}

{ TfrmLGTCDespesasItem }

procedure TfrmLGTCDespesasItem.btnDescartarFecharClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente descartar todas as alterações efetuadas?';
var
   I: Integer;
begin
   if MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      for I := 0 to FFrames.Count - 1 do
         TfrmLGTCDespesa(FFrames.Items[I]).Cancel;

      ModalResult := mrCancel;
   end;
end;

procedure TfrmLGTCDespesasItem.btnExcluirClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente excluir a despesa atual?';
var
   UserChoice: Integer;
   Frame: TfrmLGTCDespesa;
   TabSheet: TTabSheet;
begin
   UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin
      TabSheet := pgcDespesas.ActivePage;

      Frame := TfrmLGTCDespesa(Pointer(TabSheet.Tag));
      FFrames.Remove(Frame);

      TabSheet.Free;

      btnExcluir.Enabled :=
         (pgcDespesas.ActivePage <> nil) and
         (pgcDespesas.ActivePage.Tag > 0);
   end;
end;

procedure TfrmLGTCDespesasItem.btnSalvarFecharClick(Sender: TObject);
const
   SMsgCamposObrigatorios = 'Para confirmar o lançamento das despesas, é necessário preencher todos os campos obrigatórios.';
   SMsgConfirmacao = 'Deseja realmente aplicar todas as alterações efetuadas?';
var
   I: Integer;
   CanSave: Boolean;
begin
   CanSave := True;

   for I := 0 to FFrames.Count - 1 do
   begin
      if not TfrmLGTCDespesa(FFrames.Items[I]).CanSave then
      begin
         CanSave := False;
         TfrmLGTCDespesa(FFrames.Items[I]).HighlightControls;
      end;
   end;

   if not CanSave then
      MessageDlg(SMsgCamposObrigatorios, mtInformation, [mbOK], 0);

   if CanSave and
      (MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], 0) = ID_YES) then
   begin
      for I := 0 to FFrames.Count - 1 do
         TfrmLGTCDespesa(FFrames.Items[I]).Post;

      ModalResult := mrOk;
   end;
end;

function TfrmLGTCDespesasItem.Edit(const AulaID,
  ProfessorID: UINT): TModalResult;
var
   TabSheet: TTabSheet;
   Frame: TfrmLGTCDespesa;
begin
   FAulaID := AulaID;
   FProfessorID := ProfessorID;

   sbAdicionar.Enabled := True;

   qryTiposDespesa.Filtered := True;

   if not qryTiposDespesa.IsEmpty then
   begin
      qryTiposDespesa.First;
      while not qryTiposDespesa.Eof do
      begin
         TabSheet := TTabSheet.Create(Self);
         TabSheet.PageControl := pgcDespesas;
         TabSheet.Caption := qryTiposDespesaDS_TIPO_DESPESA.AsString;

         Frame := TfrmLGTCDespesa.Create(Self);
         Frame.Name := EmptyStr;
         Frame.Parent := TabSheet;
         Frame.Load(
            qryTiposDespesaCD_TIPO_DESPESA.AsLargeInt,
            AulaID,
            GetFornecedor,
            qryTiposDespesaCD_CONTA.AsLargeInt,
            qryTiposDespesaCD_COLIGADA_MATRIZ.AsInteger,
            qryTiposDespesaCD_TIPO_TITULO.AsInteger,
            qryTiposDespesaDS_CHAVE.AsString);
         FFrames.Add(Frame);

         TabSheet.Constraints.MinHeight := Frame.Constraints.MinHeight;
         TabSheet.Tag := Integer(Pointer(Frame));

         qryTiposDespesa.Next;
      end;

      btnExcluir.Enabled := True;
      pgcDespesas.ActivePageIndex := 0;
      pgcDespesas.Show;
   end;

   qryTiposDespesa.Filtered := False;

   Result := ShowModal;
end;

function TfrmLGTCDespesasItem.Edit(const AulaID, ProfessorID,
  DespesaID: UINT): TModalResult;
var
   TabSheet, ActiveTabSheet: TTabSheet;
   Frame: TfrmLGTCDespesa;
begin
   FAulaID := AulaID;
   FProfessorID := ProfessorID;

   sbAdicionar.Enabled := npIncluir in Permissoes;

   if npAlterar in Permissoes then
   begin
      qryDespesas.Close;
      qryDespesas.ParamByName('CD_DIARIO_AULA').AsInteger := AulaID;
      qryDespesas.Open;

      while not qryDespesas.Eof do
      begin
         TabSheet := TTabSheet.Create(Self);
         TabSheet.PageControl := pgcDespesas;
         TabSheet.Caption := qryDespesasDS_TIPO_DESPESA.AsString;

         if qryDespesasCD_DESPESA.AsInteger = DespesaID then
            ActiveTabSheet := TabSheet;

         Frame := TfrmLGTCDespesa.Create(Self);
         Frame.Name := EmptyStr;
         Frame.Parent := TabSheet;
         Frame.Load(qryDespesasCD_DESPESA.AsLargeInt);
         FFrames.Add(Frame);

         TabSheet.Constraints.MinHeight := Frame.Constraints.MinHeight;

         qryDespesas.Next;
      end;
   end;

   if Assigned(ActiveTabSheet) then
      pgcDespesas.ActivePage := ActiveTabSheet;

   pgcDespesas.Show;
   Result := ShowModal;
end;

procedure TfrmLGTCDespesasItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLGTCDespesasItem.FormCreate(Sender: TObject);
begin
   FFrames := TComponentList.Create;
   qryTiposDespesa.Open;
end;

procedure TfrmLGTCDespesasItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if btnSalvarFechar.Enabled then
            btnSalvarFechar.Click;
      VK_F6:
         if btnDescartarFechar.Enabled then
            btnDescartarFechar.Click;
   end;
end;

function TfrmLGTCDespesasItem.GetFornecedor: UINT;
var
   S: AnsiString;
begin
   Result := 0;
   
   S := qryTiposDespesaDS_CHAVE_FORNECEDOR.AsString;

   if S = 'nenhum' then
      Result := 0;

   if S = 'professor' then
      Result := FProfessorID;

   if S = 'fornecedor' then
   begin
      qryFornecedorSala.ParamByName('CD_DIARIO_AULA').AsInteger := FAulaID;
      qryFornecedorSala.Open;

      if not qryFornecedorSala.IsEmpty then
         Result := qryFornecedorSalaCD_FORNECEDOR.AsLargeInt;

      qryFornecedorSala.Close;
   end;
end;

function TfrmLGTCDespesasItem.GetPermissoes: TUMPermissoes;
begin
   Result := frmLGTCDespesas.Permissoes;
end;

procedure TfrmLGTCDespesasItem.pgcDespesasChange(Sender: TObject);
begin
   btnExcluir.Enabled := pgcDespesas.ActivePage.Tag > 0;
end;

procedure TfrmLGTCDespesasItem.sbAdicionarClick(Sender: TObject);
var
   TabSheet: TTabSheet;
   Frame: TfrmLGTCDespesa;
begin
   if dblcTiposDespesa.KeyValue <> Null then
   begin
      pgcDespesas.Show;

      TabSheet := TTabSheet.Create(Self);
      TabSheet.Caption := qryTiposDespesaDS_TIPO_DESPESA.AsString;
      TabSheet.PageControl := pgcDespesas;

      Frame := TfrmLGTCDespesa.Create(Self);
      Frame.Name := EmptyStr;
      Frame.Parent := TabSheet;
      Frame.Load(
         qryTiposDespesaCD_TIPO_DESPESA.AsLargeInt,
         FAulaID,
         GetFornecedor,
         qryTiposDespesaCD_CONTA.AsLargeInt,
         qryTiposDespesaCD_COLIGADA_MATRIZ.AsInteger,
         qryTiposDespesaCD_TIPO_TITULO.AsInteger,
         qryTiposDespesaDS_CHAVE.AsString);
      FFrames.Add(Frame);

      TabSheet.Constraints.MinHeight := Frame.Constraints.MinHeight;
      TabSheet.Tag := Integer(Pointer(Frame));
      btnExcluir.Enabled := True;

      pgcDespesas.ActivePage := TabSheet;
   end;
end;

end.
