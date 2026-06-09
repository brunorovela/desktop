unit UFCadCatracas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, DB, ZAbstractRODataset,
   ZAbstractDataset, ZDataset, Grids, DBGrids, UZSortedGrid, DBCtrls, StdCtrls,
   Mask, SynEdit, SynDBEdit, SynEditHighlighter, SynHighlighterJScript, uUsuario,
   Buttons, ZDbcIntfs, UZDbcFuncs;

type
   TfrmCadCatracas = class(TForm)
      bbtnFiltrar: TBitBtn;
      btnAlterar: TToolButton;
      btnCancelar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnSalvar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      bvlSep6: TBevel;
      bvlSep7: TBevel;
      dbchAtivo: TDBCheckBox;
      dbeCodigo: TDBEdit;
      dbeIP: TDBEdit;
      dbeMac: TDBEdit;
      dbeNome: TDBEdit;
      dbePorta: TDBEdit;
      dbgCatracas: TZSortedGrid;
      dbgEventos: TZSortedGrid;
      dblcFiltroTipo: TDBLookupComboBox;
      dblcMarca: TDBLookupComboBox;
      dblcModelo: TDBLookupComboBox;
      dbseConfig: TDBSynEdit;
      dbseEventoInfo: TDBSynEdit;
      dsCatracas: TDataSource;
      dsEventos: TDataSource;
      dsEventoTipoFiltro: TDataSource;
      dtpFiltroDataAte: TDateTimePicker;
      dtpFiltroDataDe: TDateTimePicker;
      hlgJScript: TSynJScriptSyn;
      ilOpcoes: TImageList;
      lblCodigo: TLabel;
      lblConfig: TLabel;
      lblFiltroDataAte: TLabel;
      lblFiltroDataDe: TLabel;
      lblFiltroTipo: TLabel;
      lblIP: TLabel;
      lblMac: TLabel;
      lblMarca: TLabel;
      lblModelo: TLabel;
      lblNome: TLabel;
      lblPorta: TLabel;
      pgcCatraca: TPageControl;
      pnlEventoInfo: TPanel;
      pnlEventoInfoTitulo: TPanel;
      pnlFiltros: TPanel;
      pnlFiltrosTitulo: TPanel;
      pnlRegistros: TPanel;
      pnlTitulo: TPanel;
      qryCatracas: TZQuery;
      qryCatracasCD_CATRACA: TLargeintField;
      qryCatracasCD_CATRACA_MODELO: TLargeintField;
      qryCatracasDS_CONFIG: TMemoField;
      qryCatracasDS_IP: TStringField;
      qryCatracasDS_MAC_ADDRESS: TStringField;
      qryCatracasNM_CATRACA: TStringField;
      qryCatracasNM_MARCA: TStringField;
      qryCatracasNM_MODELO: TStringField;
      qryCatracasNR_PORTA: TIntegerField;
      qryCatracasSN_ATIVO: TSmallintField;
      qryEventos: TZReadOnlyQuery;
      qryEventosCD_CATRACA: TLargeintField;
      qryEventosCD_CATRACA_EVENTO: TLargeintField;
      qryEventosCD_CATRACA_EVENTO_TIPO: TSmallintField;
      qryEventosCD_CATRACA_IDENTIFICACAO: TLargeintField;
      qryEventosCD_PESSOA: TIntegerField;
      qryEventosDS_INFO: TMemoField;
      qryEventosDT_EVENTO: TDateTimeField;
      qryEventosNM_EVENTO: TStringField;
      qryEventosNR_IDENTIFICACAO: TStringField;
      qryEventoTipoFiltro: TZReadOnlyQuery;
      qryEventoTipoFiltroCD_CATRACA_EVENTO_TIPO: TSmallintField;
      qryEventoTipoFiltroDS_CHAVE: TStringField;
      qryEventoTipoFiltroNM_EVENTO: TStringField;
      qryEventoTipos: TZReadOnlyQuery;
      qryEventoTiposCD_CATRACA_EVENTO_TIPO: TSmallintField;
      qryEventoTiposDS_CHAVE: TStringField;
      qryEventoTiposNM_EVENTO: TStringField;
      qryIdentificacao: TZReadOnlyQuery;
      qryIdentificacaoCD_CATRACA_IDENTIFICACAO: TLargeintField;
      qryIdentificacaoCD_PESSOA: TIntegerField;
      qryIdentificacaoNR_IDENTIFICACAO: TStringField;
      qryMarcas: TZReadOnlyQuery;
      qryMarcasCD_CATRACA_MARCA: TLargeintField;
      qryMarcasDS_CHAVE: TStringField;
      qryMarcasNM_MARCA: TStringField;
      qryModelos: TZReadOnlyQuery;
      qryModelosCD_CATRACA_MARCA: TLargeintField;
      qryModelosCD_CATRACA_MODELO: TLargeintField;
      qryModelosDS_CHAVE: TStringField;
      qryModelosNM_MARCA: TStringField;
      qryModelosNM_MODELO: TStringField;
      sbLimpaFiltroTipo: TSpeedButton;
      splSep1: TSplitter;
      splSep2: TSplitter;
      tbsCadastro: TTabSheet;
      tbsEventos: TTabSheet;
      tlbOpcoes: TToolBar;
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure dbgCatracasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsCatracasStateChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure sbLimpaFiltroTipoClick(Sender: TObject);
   private
      FPermissoesCad: TUMPermissoes;
      FPermissoesEventos: TUMPermissoes;
      procedure ApplyFilters;
   end;

var
   frmCadCatracas: TfrmCadCatracas;

implementation

uses
   uDM;

{$R *.dfm}

procedure TfrmCadCatracas.ApplyFilters;
const
   SDateToIsoFmt = 'yyyy-mm-dd';
   SFiltroTipoEventoFmt = 'CD_CATRACA_EVENTO_TIPO = %d';
   SFiltroDataDeFmt = 'DT_EVENTO >= ''%s 00:00:00''';
   SFiltroDataAteFmt = 'DT_EVENTO <= ''%s 23:59:59''';
var
   Filtro: AnsiString;
begin
   Filtro := '';
   
   if dblcFiltroTipo.KeyValue <> Null then
   begin
      Filtro := Format(SFiltroTipoEventoFmt, [
         qryEventoTipoFiltroCD_CATRACA_EVENTO_TIPO.AsInteger]);
   end;

   if dtpFiltroDataDe.Checked then
   begin
      if Filtro <> '' then
         Filtro := Filtro + ' AND ';
      Filtro := Filtro + Format(SFiltroDataDeFmt,
         [FormatDateTime(SDateToIsoFmt, dtpFiltroDataDe.Date)]);
   end;

   if dtpFiltroDataAte.Checked then
   begin
      if Filtro <> '' then
         Filtro := Filtro + ' AND ';
      Filtro := Filtro + Format(SFiltroDataAteFmt,
         [FormatDateTime(SDateToIsoFmt, dtpFiltroDataAte.Date)]);
   end;

   if Filtro = '' then
   begin
      qryEventos.Filtered := False;
   end;

   if Filtro <> '' then
   begin
      qryEventos.Filter := Filtro;
      qryEventos.Filtered := True;
   end;
end;

procedure TfrmCadCatracas.bbtnFiltrarClick(Sender: TObject);
begin
   ApplyFilters;
end;

procedure TfrmCadCatracas.btnAlterarClick(Sender: TObject);
begin
   pgcCatraca.ActivePageIndex := 0;
   qryCatracas.Edit;
   dblcMarca.SetFocus;
end;

procedure TfrmCadCatracas.btnCancelarClick(Sender: TObject);
begin
   qryCatracas.Cancel;
end;

procedure TfrmCadCatracas.btnExcluirClick(Sender: TObject);
const
   SInfoCaption = 'Informação';
   SConfirmCaption = 'Confirmação';
   SConfirmDelete = 'Deseja realmente excluir o registro selecionado?';
   SConfirmInactivate = ''
      + 'Este ponto de acesso possui registros de acesso. Não é possível '
      + 'efetuar a exclusão. Deseja inativar este ponto de acesso e impedir '
      + 'novos acessos?';
   SInfoCantDelete = ''
      + 'Este ponto de acesso possui registros de acesso. Não é possível '
      + 'efetuar a exclusão.';
   SSQLVerificaAcessos = ''
      + 'SELECT '
      + '  1 '
      + 'FROM '
      + '  ta_catraca c '
      + 'WHERE '
      + '  c.CD_CATRACA = ? AND '
      + '  EXISTS ( '
      + '    SELECT '
      + '      a.codigo '
      + '    FROM '
      + '      diario_terminal_acessos a '
      + '    WHERE '
      + '      c.CD_CATRACA = a.CD_CATRACA_ENTRADA '
      + '  ) OR '
      + '  EXISTS ( '
      + '    SELECT '
      + '      a.codigo '
      + '    FROM '
      + '      diario_terminal_acessos a '
      + '    WHERE '
      + '      c.CD_CATRACA = a.CD_CATRACA_SAIDA '
      + '  ) ';
var
   UserChoice: Integer;
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   Found: Boolean;
begin
   Found := False;

   Statement := PrepareStatement(SSQLVerificaAcessos);
   try
      Statement.SetInt(1, qryCatracasCD_CATRACA.AsInteger);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         Found := ResultSet.Next;

         if Found then
         begin
            if qryCatracasSN_ATIVO.AsInteger = 0 then
            begin
               MessageBox(Handle, SInfoCantDelete, SInfoCaption,
                  MB_ICONWARNING or MB_OK);
            end;

            if qryCatracasSN_ATIVO.AsInteger = 1 then
            begin
               UserChoice := MessageBox(Handle, SConfirmInactivate,
                  SConfirmCaption, MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);
               if UserChoice = ID_YES then
               begin
                  qryCatracas.Edit;
                  qryCatracasSN_ATIVO.AsInteger := 0;
                  qryCatracas.Post;
               end;
            end;
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Statement.Close;
      Statement := nil;
   end;

   if not Found then
   begin
      UserChoice := MessageBox(Handle, SConfirmDelete, SConfirmCaption,
         MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

      if UserChoice = ID_YES then
         qryCatracas.Delete;
   end;
end;

procedure TfrmCadCatracas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadCatracas.btnIncluirClick(Sender: TObject);
begin
   pgcCatraca.ActivePageIndex := 0;
   dblcMarca.SetFocus;
   qryCatracas.Insert;
end;

procedure TfrmCadCatracas.btnSalvarClick(Sender: TObject);
begin
   qryCatracas.Post;
end;

procedure TfrmCadCatracas.dbgCatracasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK or DFCS_MONO,
      DFCS_BUTTONCHECK or DFCS_MONO or DFCS_CHECKED);
var
   DrawState: Integer;
   DrawRect: TRect;
   Grid: TZSortedGrid;
begin
   if Column.FieldName = 'SN_ATIVO' then
   begin
      Grid := Sender as TZSortedGrid;
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);
      DrawState := IsChecked[Column.Field.AsInteger = 1];
      Grid.Canvas.FillRect(Rect);
      DrawFrameControl(Grid.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
   end;
end;

procedure TfrmCadCatracas.dsCatracasStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := (npIncluir in FPermissoesCad) and
      (qryCatracas.State = dsBrowse);
   btnAlterar.Enabled := (npAlterar in FPermissoesCad) and
      (qryCatracas.State = dsBrowse) and (not qryCatracas.IsEmpty);
   btnExcluir.Enabled := (npExcluir in FPermissoesCad) and
      (qryCatracas.State = dsBrowse) and (not qryCatracas.IsEmpty);
   btnSalvar.Enabled := qryCatracas.State in dsEditModes;
   btnCancelar.Enabled := qryCatracas.State in dsEditModes;
   btnFechar.Enabled := qryCatracas.State = dsBrowse;
end;

procedure TfrmCadCatracas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadCatracas.FormCreate(Sender: TObject);
const
   SChaveModuloCad = 'TerminalAcesso.Configuracoes.Catracas.Cadastro';
   SChaveModuloEventos = 'TerminalAcesso.Configuracoes.Catracas.Eventos';
begin
   FPermissoesCad := DM.UsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo, SChaveModuloCad);
      
   FPermissoesEventos := DM.UsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo, SChaveModuloEventos);

   tbsEventos.TabVisible := False;

   if npAcesso in FPermissoesEventos then
   begin
      qryEventoTipoFiltro.Open;
      qryEventos.Open;
      tbsEventos.TabVisible := True;
      dtpFiltroDataDe.Date := Date;
      dtpFiltroDataAte.Date := Date;
      ApplyFilters;
   end;

   qryCatracas.Open;
end;

procedure TfrmCadCatracas.FormDestroy(Sender: TObject);
begin
   frmCadCatracas := nil;
end;

procedure TfrmCadCatracas.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfrmCadCatracas.sbLimpaFiltroTipoClick(Sender: TObject);
begin
   dblcFiltroTipo.KeyValue := Null;
end;

end.
