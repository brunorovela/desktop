unit UFAdmissoes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, DB, ZAbstractRODataset,
   ZAbstractDataset, UZDataset, Grids, DBGrids, UZSortedGrid, StrUtils, DBCGrids,
   DBCtrls, StdCtrls, Mask, Buttons, ZSqlUpdate, uUsuario, Contnrs;

type
   TfrmAdmissoes = class(TFrame)
      btnAdmissaoAlterar: TToolButton;
      btnAdmissaoExcluir: TToolButton;
      btnAdmissaoIncluir: TToolButton;
      btnHistoricoAdicionar: TToolButton;
      btnHistoricoAlterar: TToolButton;
      btnHistoricoExcluir: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      dbgAdmissoes: TZSortedGrid;
      dbgCampos: TZSortedGrid;
      dbgHistorico: TZSortedGrid;
      dsAdmissoes: TDataSource;
      dsCampos: TDataSource;
      dsHistorico: TDataSource;
      ilAcoes: TImageList;
      pnlAdmissoes: TPanel;
      pnlDetalhes: TPanel;
      pnlDetalhesTitulo: TPanel;
      pnlHistorico: TPanel;
      pnlHistoricoTitulo: TPanel;
      pnlTitulo: TPanel;
      qryAdmissoes: TUMZQuery;
      qryAdmissoesCD_ADMISSAO: TLargeintField;
      qryAdmissoesCD_FUNCAO: TSmallintField;
      qryAdmissoesCD_PESSOA: TIntegerField;
      qryAdmissoesCD_SITUACAO: TIntegerField;
      qryAdmissoesDS_CODIGO_EXTERNO: TStringField;
      qryAdmissoesDS_FUNCAO: TStringField;
      qryAdmissoesDS_OBSERVACAO: TStringField;
      qryAdmissoesDS_SITUACAO: TStringField;
      qryAdmissoesDT_ADMISSAO: TDateField;
      qryAdmissoesDT_SAIDA: TDateField;
      qryAdmissoesVL_HORAS_SEMANAIS: TFloatField;
      qryAtualizarCampos: TUMZQuery;
      qryCampos: TUMZQuery;
      qryCamposCD_ADMISSAO_CAMPO: TSmallintField;
      qryCamposCD_ADMISSAO_HISTORICO: TLargeintField;
      qryCamposCD_CENTRO: TLargeintField;
      qryCamposCD_COLIGADA_MATRIZ: TIntegerField;
      qryCamposCD_CURSOS: TStringField;
      qryCamposDS_CENTRO: TStringField;
      qryCamposDS_CHAVE: TStringField;
      qryCamposDS_TITULO: TStringField;
      qryCamposNR_ORDEM: TSmallintField;
      qryCamposSN_ATIVO: TSmallintField;
      qryCamposSN_CENTRO_CUSTO: TSmallintField;
      qryCamposSN_CURSOS: TSmallintField;
      qryCamposSN_HORAS: TSmallintField;
      qryCamposVL_HORAS: TFloatField;
      qryHistorico: TUMZQuery;
      qryHistoricoCD_ADMISSAO: TLargeintField;
      qryHistoricoCD_ADMISSAO_HISTORICO: TLargeintField;
      qryHistoricoCD_REGIME: TIntegerField;
      qryHistoricoDS_REGIME: TStringField;
      qryHistoricoDT_FIM: TDateField;
      qryHistoricoDT_INICIO: TDateField;
      qryHistoricoSN_EXTENSAO: TSmallintField;
      qryHistoricoSN_GESTAO: TSmallintField;
      qryHistoricoSN_GRADUACAO_DISTANCIA: TSmallintField;
      qryHistoricoSN_GRADUACAO_PRESENCIAL: TSmallintField;
      qryHistoricoSN_PESQUISA: TSmallintField;
      qryHistoricoSN_POS_DISTANCIA: TSmallintField;
      qryHistoricoSN_POS_PRESENCIAL: TSmallintField;
      qryHistoricoSN_SEQUENCIAL: TSmallintField;
      qryOcupacoes: TUMZReadOnlyQuery;
      qryOcupacoesCD_FUNCAO: TSmallintField;
      qryOcupacoesDS_FUNCAO: TStringField;
      qryRegimes: TUMZReadOnlyQuery;
      qryRegimesCD_REGIME: TIntegerField;
      qryRegimesDS_REGIME: TStringField;
      qrySituacoes: TUMZReadOnlyQuery;
      qrySituacoesCD_SITUACAO: TIntegerField;
      qrySituacoesDS_VALOR: TStringField;
      splSep1: TSplitter;
      splSep3: TSplitter;
      tlbAdmissoes: TToolBar;
      tlbHistorico: TToolBar;
      updAdmissoes: TZUpdateSQL;
      updCampos: TZUpdateSQL;
      updHistorico: TZUpdateSQL;
      procedure btnAdmissaoAlterarClick(Sender: TObject);
      procedure btnAdmissaoExcluirClick(Sender: TObject);
      procedure btnAdmissaoIncluirClick(Sender: TObject);
      procedure btnHistoricoAdicionarClick(Sender: TObject);
      procedure btnHistoricoAlterarClick(Sender: TObject);
      procedure btnHistoricoExcluirClick(Sender: TObject);
      procedure dbgCamposCellClick(Column: TColumn);
      procedure dbgCamposDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dbgCamposEditButtonClick(Sender: TObject);
      procedure dbgCamposKeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure dbgHistoricoDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsHistoricoDataChange(Sender: TObject; Field: TField);
      procedure qryAdmissoesAfterOpen(DataSet: TDataSet);
      procedure qryAdmissoesAfterRefresh(DataSet: TDataSet);
      procedure qryCamposVL_HORASGetText(Sender: TField; var Text: string;
         DisplayText: Boolean);
      procedure qryHistoricoAfterOpen(DataSet: TDataSet);
      procedure qryHistoricoAfterRefresh(DataSet: TDataSet);
   private
      FPessoaID: Integer;
      FPermissoes: TUMPermissoes;
      class var FInstance: TfrmAdmissoes;
      constructor Create(AOwner: TComponent); override;
      procedure GridButtonOnClick(Sender: TObject);
   public
      destructor Destroy; override;
      class procedure Load(Aowner: TComponent; Parent: TWinControl;
         const PessoaID: Integer);
   end;

implementation

uses
   UFAdmissaoEditar, UFAdmissaoHistoricoEditar, UFAdmissaoCursos, uSelCentro,
   uDM;

{$R *.dfm}

{ TfrmAdmissoes }

procedure TfrmAdmissoes.btnAdmissaoAlterarClick(Sender: TObject);
begin
   if frmAdmissaoEditar = nil then
      Application.CreateForm(TfrmAdmissaoEditar, frmAdmissaoEditar);

   frmAdmissaoEditar.Edit(qryAdmissoesCD_ADMISSAO.AsLargeInt);

   if frmAdmissaoEditar.ShowModal = mrOk then
      qryAdmissoes.Refresh;
end;

procedure TfrmAdmissoes.btnAdmissaoExcluirClick(Sender: TObject);
const
   SMsgConfirmaExclusao = 'Deseja realmente excluir o registro de admissão selecionado?';
begin
   if MessageDlg(SMsgConfirmaExclusao, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      qryAdmissoes.Delete;
      btnAdmissaoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryAdmissoes.IsEmpty);
      btnAdmissaoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
      btnHistoricoAdicionar.Enabled := (npIncluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
      btnHistoricoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryHistorico.IsEmpty);
      btnHistoricoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryHistorico.IsEmpty);
   end;
end;

procedure TfrmAdmissoes.btnAdmissaoIncluirClick(Sender: TObject);
begin
   if frmAdmissaoEditar = nil then
      Application.CreateForm(TfrmAdmissaoEditar, frmAdmissaoEditar);

   frmAdmissaoEditar.Insert(FPessoaID);

   if frmAdmissaoEditar.ShowModal = mrOk then
      qryAdmissoes.Refresh;
end;

procedure TfrmAdmissoes.btnHistoricoAdicionarClick(Sender: TObject);
begin
   if frmAdmissaoHistoricoEditar = nil then
      Application.CreateForm(TfrmAdmissaoHistoricoEditar, frmAdmissaoHistoricoEditar);

   frmAdmissaoHistoricoEditar.Insert(qryAdmissoesCD_ADMISSAO.AsLargeInt);

   if frmAdmissaoHistoricoEditar.ShowModal = mrOk then
      qryHistorico.Refresh;
end;

procedure TfrmAdmissoes.btnHistoricoAlterarClick(Sender: TObject);
begin
   if frmAdmissaoHistoricoEditar = nil then
      Application.CreateForm(TfrmAdmissaoHistoricoEditar, frmAdmissaoHistoricoEditar);

   frmAdmissaoHistoricoEditar.Edit(qryHistoricoCD_ADMISSAO_HISTORICO.AsInteger);

   if frmAdmissaoHistoricoEditar.ShowModal = mrOk then
      qryHistorico.Refresh;
end;

procedure TfrmAdmissoes.btnHistoricoExcluirClick(Sender: TObject);
const
   SMsgConfirmaExclusao = 'Deseja realmente excluir o registro de histórico selecionado?';
begin
   if MessageDlg(SMsgConfirmaExclusao, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      qryHistorico.Delete;
      btnAdmissaoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryAdmissoes.IsEmpty);
      btnAdmissaoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
      btnHistoricoAdicionar.Enabled := (npIncluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
      btnHistoricoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryHistorico.IsEmpty);
      btnHistoricoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryHistorico.IsEmpty);
   end;
end;

constructor TfrmAdmissoes.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FPermissoes := DM.GetUsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo,
      'Academico.Pessoas.Professores.Contratacao');
      
   btnAdmissaoIncluir.Enabled := npIncluir in FPermissoes;
   btnAdmissaoAlterar.Enabled := npAlterar in FPermissoes;
   btnAdmissaoExcluir.Enabled := npExcluir in FPermissoes;
   btnHistoricoAdicionar.Enabled := npIncluir in FPermissoes;
   btnHistoricoAlterar.Enabled := npAlterar in FPermissoes;
   btnHistoricoExcluir.Enabled := npExcluir in FPermissoes;
end;

procedure TfrmAdmissoes.dbgCamposCellClick(Column: TColumn);
var
   Editable, RecActive: Boolean;
   SelFieldName: AnsiString;
   GridOptions: TDBGridOptions;
begin
   if Column.FieldName = 'SN_ATIVO' then
   begin
      Column.Field.DataSet.Edit;
      if Column.Field.AsInteger = 1 then
         Column.Field.AsInteger := 0
      else
         Column.Field.AsInteger := 1;
      Column.Field.DataSet.Post;
   end;

   RecActive := qryCamposSN_ATIVO.AsInteger = 1;
   SelFieldName := dbgCampos.SelectedField.FieldName;
   
   Editable :=
      RecActive and
      (
         ((SelFieldName = 'VL_HORAS') and (qryCamposSN_HORAS.AsInteger = 1) and (qryCamposSN_CURSOS.AsInteger = 0)) or
         ((SelFieldName = 'CD_CURSOS') and (qryCamposSN_CURSOS.AsInteger = 1)) or
         ((SelFieldName = 'DS_CENTRO') and (qryCamposSN_CENTRO_CUSTO.AsInteger = 1) and (qryCamposSN_CURSOS.AsInteger = 0))
      );

   GridOptions := dbgCampos.Options;

   if Editable then
      Include(GridOptions, dgEditing);

   if not Editable then
      Exclude(GridOptions, dgEditing);

   dbgCampos.Options := GridOptions;
end;

procedure TfrmAdmissoes.dbgCamposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array [Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawState: Integer;
   DrawRect: TRect;
   DisableColumn: Boolean;
begin
   if Column.FieldName = 'SN_ATIVO' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);
      DrawState := IsChecked[Column.Field.AsInteger = 1];
      dbgCampos.Canvas.FillRect(Rect);
      DrawFrameControl(dbgCampos.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
   end;

   if Column.FieldName <> 'SN_ATIVO' then
   begin
   
      DisableColumn :=
         (((Column.FieldName = 'VL_HORAS') or (Column.FieldName = 'DS_CENTRO')) and (qryCamposSN_CURSOS.AsInteger = 1)) or
         ((Column.FieldName = 'VL_HORAS') and (qryCamposSN_HORAS.AsInteger = 0)) or
         ((Column.FieldName = 'CD_CURSOS') and (qryCamposSN_CURSOS.AsInteger = 0)) or
         ((Column.FieldName = 'DS_CENTRO') and (qryCamposSN_CENTRO_CUSTO.AsInteger = 0));

      if DisableColumn then
      begin
         dbgCampos.Canvas.Brush.Color := clBtnFace;
      end;

      dbgCampos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfrmAdmissoes.dbgCamposEditButtonClick(Sender: TObject);
begin
   if dbgCampos.SelectedField.FieldName = 'CD_CURSOS' then
   begin
      if frmAdmissaoCursos = nil then
         Application.CreateForm(TfrmAdmissaoCursos, frmAdmissaoCursos);

      frmAdmissaoCursos.Load(
         qryCamposCD_ADMISSAO_HISTORICO.AsLargeInt,
         qryCamposCD_ADMISSAO_CAMPO.AsInteger,
         qryAdmissoesCD_PESSOA.AsInteger);

      if frmAdmissaoCursos.ShowModal = mrOk then
         qryCampos.Refresh;
   end;

   if dbgCampos.SelectedField.FieldName = 'DS_CENTRO' then
   begin
      frm_SelCentro.ShowModal;
      if frm_SelCentro.flgSearch then
      begin
         qryCampos.Edit;
         qryCamposCD_CENTRO.AsLargeInt := frm_SelCentro.qyCentrosCD_CENTRO.AsLargeInt;
         qryCamposCD_COLIGADA_MATRIZ.AsInteger := frm_SelCentro.qyCentrosCD_COLIGADA_MATRIZ.AsInteger;
         qryCampos.Post;
         qryCampos.Refresh;
      end;
   end;
end;

procedure TfrmAdmissoes.dbgCamposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_DELETE) and (dbgCampos.SelectedField.FieldName = 'DS_CENTRO') then
   begin
      qryCampos.Edit;
      qryCamposCD_CENTRO.Clear;
      qryCamposCD_COLIGADA_MATRIZ.Clear;
      qryCampos.Post;
      qryCampos.Refresh;
   end;
end;

procedure TfrmAdmissoes.dbgHistoricoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array [Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawState: Integer;
   DrawRect: TRect;
begin
   if AnsiStartsStr('SN_', Column.FieldName) then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);
      DrawState := IsChecked[Column.Field.AsInteger = 1];
      dbgHistorico.Canvas.FillRect(Rect);
      DrawFrameControl(dbgHistorico.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
   end
   else
      dbgHistorico.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

destructor TfrmAdmissoes.Destroy;
begin
   FInstance := nil;
   inherited;
end;

procedure TfrmAdmissoes.dsHistoricoDataChange(Sender: TObject; Field: TField);
begin
   if not qryHistoricoCD_ADMISSAO_HISTORICO.IsNull then
   begin
      qryAtualizarCampos.ParamByName('CD_ADMISSAO_HISTORICO').AsInteger := qryHistoricoCD_ADMISSAO_HISTORICO.AsInteger;
      qryAtualizarCampos.ExecSQL;
      if qryCampos.Active then
         qryCampos.Refresh;
   end;
end;

procedure TfrmAdmissoes.GridButtonOnClick(Sender: TObject);
begin
   if dbgCampos.SelectedField.FieldName = 'CD_CURSOS' then
   begin
      if frmAdmissaoCursos = nil then
         Application.CreateForm(TfrmAdmissaoCursos, frmAdmissaoCursos);

      frmAdmissaoCursos.Load(
         qryCamposCD_ADMISSAO_HISTORICO.AsLargeInt,
         qryCamposCD_ADMISSAO_CAMPO.AsInteger,
         qryAdmissoesCD_PESSOA.AsInteger);

      if frmAdmissaoCursos.ShowModal = mrOk then
         qryCampos.Refresh;
   end;

   if dbgCampos.SelectedField.FieldName = 'DS_CENTRO' then
   begin
      frm_SelCentro.ShowModal;
      if frm_SelCentro.flgSearch then
      begin
         qryCampos.Edit;
         qryCamposCD_CENTRO.AsLargeInt := frm_SelCentro.qyCentrosCD_CENTRO.AsLargeInt;
         qryCamposCD_COLIGADA_MATRIZ.AsInteger := frm_SelCentro.qyCentrosCD_COLIGADA_MATRIZ.AsInteger;
         qryCampos.Post;
         qryCampos.Refresh;
      end;
   end;
end;

class procedure TfrmAdmissoes.Load(Aowner: TComponent; Parent: TWinControl;
  const PessoaID: Integer);
begin
   if not Assigned(TfrmAdmissoes.FInstance) then
   begin
      FInstance := TfrmAdmissoes.Create(Aowner);
      FInstance.Parent := Parent;
   end;

   FInstance.FPessoaID := PessoaID;

   FInstance.qryAdmissoes.Close;
   FInstance.qryHistorico.Close;
   FInstance.qryCampos.Close;

   FInstance.qryAdmissoes.ParamByName('CD_PESSOA').AsInteger := PessoaID;
   FInstance.qryAdmissoes.Open;
   FInstance.qryHistorico.Open;
   FInstance.qryCampos.Open;
end;

procedure TfrmAdmissoes.qryAdmissoesAfterOpen(DataSet: TDataSet);
begin
   btnAdmissaoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryAdmissoes.IsEmpty);
   btnAdmissaoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
   btnHistoricoAdicionar.Enabled := (npIncluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
end;

procedure TfrmAdmissoes.qryAdmissoesAfterRefresh(DataSet: TDataSet);
begin
   btnAdmissaoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryAdmissoes.IsEmpty);
   btnAdmissaoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
   btnHistoricoAdicionar.Enabled := (npIncluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
end;

procedure TfrmAdmissoes.qryCamposVL_HORASGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text := qryCamposVL_HORAS.AsString;
   
   if qryCamposVL_HORAS.AsCurrency = 0 then
      Text := '';
end;

procedure TfrmAdmissoes.qryHistoricoAfterOpen(DataSet: TDataSet);
begin
   btnHistoricoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryHistorico.IsEmpty);
   btnHistoricoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryHistorico.IsEmpty);
   btnHistoricoAdicionar.Enabled := (npIncluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
end;

procedure TfrmAdmissoes.qryHistoricoAfterRefresh(DataSet: TDataSet);
begin
   btnHistoricoAlterar.Enabled := (npAlterar in FPermissoes) and (not qryHistorico.IsEmpty);
   btnHistoricoExcluir.Enabled := (npExcluir in FPermissoes) and (not qryHistorico.IsEmpty);
   btnHistoricoAdicionar.Enabled := (npIncluir in FPermissoes) and (not qryAdmissoes.IsEmpty);
end;

end.
