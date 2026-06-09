unit UFCadIdentificacao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, DB, ZAbstractRODataset,
   ZDataset, DBCtrls, StdCtrls, Buttons, ZAbstractDataset, Grids, DBGrids,
   UZSortedGrid, Mask, UDateTimePicker, uUsuario, ZDbcIntfs, ZSqlUpdate,
   SynEdit, SynDBEdit, SynEditHighlighter, SynHighlighterJScript, StrUtils,
   DateUtils;

type
   TfrmCadIdentificacao = class(TForm)
      bbtnFiltrar: TBitBtn;
      bbtnLimparFiltros: TBitBtn;
      btnAlterar: TToolButton;
      btnCancelar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnSalvar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      bvlep8: TBevel;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      bvlSep6: TBevel;
      bvlSep7: TBevel;
      cbFiltroSituacao: TComboBox;
      dbchAtivo: TDBCheckBox;
      dbchMaster: TDBCheckBox;
      dbeCodigo: TDBEdit;
      dbeNumero: TDBEdit;
      dbePessoaCodigo: TDBEdit;
      dbePessoaNome: TDBEdit;
      dbeValidade: TDBEdit;
      dbgHistorico: TZSortedGrid;
      dbgIdentificacao: TZSortedGrid;
      dblcFiltroTipo: TDBLookupComboBox;
      dblcTipo: TDBLookupComboBox;
      dbmMotivo: TDBMemo;
      dbseLog: TDBSynEdit;
      dsFiltroTipo: TDataSource;
      dsHistorico: TDataSource;
      dsIdentificacao: TDataSource;
      dsIdentificacaoTipo: TDataSource;
      dtpFiltroValidadeAte: TDateTimePicker;
      dtpFiltroValidadeDe: TDateTimePicker;
      edtFiltroIdentificacao: TEdit;
      edtFiltroPessoaCodigo: TEdit;
      edtFiltroPessoaNome: TEdit;
      hlgJScript: TSynJScriptSyn;
      ilOpcoes: TImageList;
      lblCodigo: TLabel;
      lblFiltroIdentificacao: TLabel;
      lblFiltroPessoa: TLabel;
      lblFiltroSituacao: TLabel;
      lblFiltroTipo: TLabel;
      lblFiltroValidade: TLabel;
      lblFiltroValidadeAte: TLabel;
      lblLimpar: TLabel;
      lblMotivo: TLabel;
      lblNumero: TLabel;
      lblPessoa: TLabel;
      lblTipo: TLabel;
      lblValidade: TLabel;
      mmMotivo: TMemo;
      pgcIdentificacao: TPageControl;
      pnlFiltros: TPanel;
      pnlFiltrosTitulo: TPanel;
      pnlLog: TPanel;
      pnlLogTitulo: TPanel;
      pnlMotivo: TPanel;
      pnlMotivoTitulo: TPanel;
      pnlRegistros: TPanel;
      pnlTitulo: TPanel;
      qryFiltroTipo: TZReadOnlyQuery;
      qryFiltroTipoCD_CATRACA_IDENTIFICACAO_TIPO: TSmallintField;
      qryFiltroTipoDS_CHAVE: TStringField;
      qryFiltroTipoNM_IDENTIFICACAO: TStringField;
      qryHistorico: TZQuery;
      qryHistoricoCD_CATRACA_IDENTIFICACAO: TLargeintField;
      qryHistoricoCD_CATRACA_IDENTIFICACAO_LOG: TLargeintField;
      qryHistoricoCD_USUARIO: TIntegerField;
      qryHistoricoDS_OBSERVACOES: TMemoField;
      qryHistoricoDT_ALTERACAO: TDateTimeField;
      qryHistoricoNM_PESSOA: TStringField;
      qryHistoricoTX_LOG: TMemoField;
      qryIdentificacao: TZQuery;
      qryIdentificacaoCD_CATRACA_IDENTIFICACAO: TLargeintField;
      qryIdentificacaoCD_CATRACA_IDENTIFICACAO_TIPO: TSmallintField;
      qryIdentificacaoCD_PESSOA: TIntegerField;
      qryIdentificacaoDT_VALIDADE: TDateTimeField;
      qryIdentificacaoNM_IDENTIFICACAO: TStringField;
      qryIdentificacaoNM_PESSOA: TStringField;
      qryIdentificacaoNR_IDENTIFICACAO: TStringField;
      qryIdentificacaoSN_ATIVO: TSmallintField;
      qryIdentificacaoSN_MASTER: TSmallintField;
      qryIdentificacaoTipo: TZReadOnlyQuery;
      qryIdentificacaoTipoCD_CATRACA_IDENTIFICACAO_TIPO: TSmallintField;
      qryIdentificacaoTipoDS_CHAVE: TStringField;
      qryIdentificacaoTipoNM_IDENTIFICACAO: TStringField;
      sbBuscaPessoa: TSpeedButton;
      sbFiltroPessoa: TSpeedButton;
      sbRemoveFiltroTipo: TSpeedButton;
      splSep1: TSplitter;
      splSep2: TSplitter;
      splSep3: TSplitter;
      tbsCadastro: TTabSheet;
      tbsHistorico: TTabSheet;
      tlbOpcoes: TToolBar;
      updHistorico: TZUpdateSQL;
      updIdentificacao: TZUpdateSQL;
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure bbtnLimparFiltrosClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure dbeNumeroExit(Sender: TObject);
      procedure dbgIdentificacaoDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn;
         State: TGridDrawState);
      procedure dsIdentificacaoStateChange(Sender: TObject);
      procedure edtFiltroPessoaCodigoExit(Sender: TObject);
      procedure edtFiltroPessoaCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure lblLimparClick(Sender: TObject);
      procedure mmMotivoChange(Sender: TObject);
      procedure qryIdentificacaoCD_PESSOAChange(Sender: TField);
      procedure qryIdentificacaoNewRecord(DataSet: TDataSet);
      procedure sbBuscaPessoaClick(Sender: TObject);
      procedure sbFiltroPessoaClick(Sender: TObject);
      procedure sbRemoveFiltroTipoClick(Sender: TObject);
   private
      FPermissoesCad: TUMPermissoes;
      FPermissoesHist: TUMPermissoes;
      FUltimaPessoa: AnsiString;
      FTamanhoCartao: Byte;
      function SearchNomePessoa(const ID: AnsiString): AnsiString;
      procedure ApplyFilters;
   end;

var
   frmCadIdentificacao: TfrmCadIdentificacao;

implementation

uses
   uDM, uFSelecionarPessoa, UZDbcFuncs;

{$R *.dfm}

procedure TfrmCadIdentificacao.ApplyFilters;
const
   SDateTimeToIsoFmt = 'yyyy-mm-dd hh:nn:ss';
   SFiltroTipoFmt = 'CD_CATRACA_IDENTIFICACAO_TIPO = %s';
   SFiltroPessoaFmt = 'CD_PESSOA = %s';
   SFiltroIdFmt = 'NR_IDENTIFICACAO LIKE %s';
   SFiltroSituacaoFmt = 'SN_ATIVO = %d';
   SFiltroValidadeDeFmt = 'DT_VALIDADE >= ''%s''';
   SFiltroValidadeAteFmt = 'DT_VALIDADE <= ''%s''';
var
   Filters: TStrings;
   S: AnsiString;
   I: Integer;
begin
   Filters := TStringList.Create;
   try
      if dblcFiltroTipo.KeyValue <> Null then
      begin
         S := Format(SFiltroTipoFmt, [dblcFiltroTipo.KeyValue]);
         Filters.Add(S);
      end;

      if edtFiltroPessoaCodigo.Text <> '' then
      begin
         S := Format(SFiltroPessoaFmt, [edtFiltroPessoaCodigo.Text]);
         Filters.Add(S);
      end;

      if edtFiltroIdentificacao.Text <> '' then
      begin
         S := '*' + edtFiltroIdentificacao.Text + '*';
         S := QuotedStr(S);
         S := Format(SFiltroIdFmt, [S]);
         Filters.Add(S);
      end;

      if cbFiltroSituacao.ItemIndex = 0 then
      begin
         S := Format(SFiltroSituacaoFmt, [1]);
         Filters.Add(S);
      end;

      if cbFiltroSituacao.ItemIndex = 1 then
      begin
         S := Format(SFiltroSituacaoFmt, [0]);
      end;

      if dtpFiltroValidadeDe.Checked then
      begin
         S := FormatDateTime(SDateTimeToIsoFmt, dtpFiltroValidadeDe.DateTime);
         S := Format(SFiltroValidadeDeFmt, [S]);
         Filters.Add(S);
      end;

      if dtpFiltroValidadeAte.Checked then
      begin
         S := FormatDateTime(SDateTimeToIsoFmt, dtpFiltroValidadeAte.DateTime);
         S := Format(SFiltroValidadeAteFmt, [S]);
         Filters.Add(S);
      end;

      if Filters.Count = 0 then
      begin
         qryIdentificacao.Filtered := False;
      end;

      if Filters.Count > 0 then
      begin
      
         S := '';
         
         for I := 0 to Filters.Count - 1 do
         begin
            if S <> '' then
               S := S + ' AND ';
            S := S + Filters[I];
         end;

         qryIdentificacao.Filter := S;
         qryIdentificacao.Filtered := True;
      end;
   finally
      FreeAndNil(Filters);
   end;
end;

procedure TfrmCadIdentificacao.bbtnFiltrarClick(Sender: TObject);
begin
   ApplyFilters;
end;

procedure TfrmCadIdentificacao.bbtnLimparFiltrosClick(Sender: TObject);
begin
   dblcFiltroTipo.KeyValue := Null;
   edtFiltroPessoaCodigo.Clear;
   edtFiltroPessoaNome.Clear;
   edtFiltroIdentificacao.Clear;
   cbFiltroSituacao.ItemIndex := 2;
   dtpFiltroValidadeDe.Date := Date;
   dtpFiltroValidadeDe.Checked := False;
   dtpFiltroValidadeAte.Date := Date;
   dtpFiltroValidadeAte.Checked := False;
end;

procedure TfrmCadIdentificacao.btnAlterarClick(Sender: TObject);
begin
   mmMotivo.Clear;
   qryIdentificacao.Edit;
end;

procedure TfrmCadIdentificacao.btnCancelarClick(Sender: TObject);
begin
   qryIdentificacao.Cancel;
end;

procedure TfrmCadIdentificacao.btnExcluirClick(Sender: TObject);
const
   SConfirmCaption = 'Confirmação';
   SConfirmDelete = 'Deseja realmente excluir o registro selecionado?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(Handle, SConfirmDelete, SConfirmCaption,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
      qryIdentificacao.Delete;
end;

procedure TfrmCadIdentificacao.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadIdentificacao.btnIncluirClick(Sender: TObject);
begin
   dblcTipo.SetFocus;
   qryIdentificacao.Insert;
end;

procedure TfrmCadIdentificacao.btnSalvarClick(Sender: TObject);
const
   SCaption = 'Atenção';
   SMsgPreencherMotivo = 'Informe o motivo da alteração.';
begin
   if mmMotivo.Visible and (Trim(mmMotivo.Text) = '') then
   begin
      MessageBox(Handle, SMsgPreencherMotivo, SCaption, MB_ICONWARNING or MB_OK);
      mmMotivo.SetFocus;
      Exit;
   end;

   qryIdentificacao.Post;
   qryIdentificacao.Refresh;
end;

procedure TfrmCadIdentificacao.dbeNumeroExit(Sender: TObject);
var
   S: AnsiString;
begin
   if not (qryIdentificacao.State in dsEditModes) then
      Exit;

   if Length(qryIdentificacaoNR_IDENTIFICACAO.AsString) < FTamanhoCartao then
   begin
      S := DupeString('0', FTamanhoCartao);
      S := S + qryIdentificacaoNR_IDENTIFICACAO.AsString;
      S := RightStr(S, FTamanhoCartao);
      qryIdentificacaoNR_IDENTIFICACAO.AsString := S;
   end;
end;

procedure TfrmCadIdentificacao.dbgIdentificacaoDrawColumnCell(Sender: TObject;
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

procedure TfrmCadIdentificacao.dsIdentificacaoStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := (npIncluir in FPermissoesCad) and
      (qryIdentificacao.State = dsBrowse);
   btnAlterar.Enabled := (npAlterar in FPermissoesCad) and
      (qryIdentificacao.State = dsBrowse) and (not qryIdentificacao.IsEmpty);
   btnExcluir.Enabled := (npExcluir in FPermissoesCad) and
      (qryIdentificacao.State = dsBrowse) and (not qryIdentificacao.IsEmpty);
   btnSalvar.Enabled := qryIdentificacao.State in dsEditModes;
   btnCancelar.Enabled := qryIdentificacao.State in dsEditModes;
   btnFechar.Enabled := qryIdentificacao.State = dsBrowse;
   sbBuscaPessoa.Enabled := qryIdentificacao.State in dsEditModes;
   lblMotivo.Visible := qryIdentificacao.State = dsEdit;
   mmMotivo.Visible := qryIdentificacao.State = dsEdit;
   bbtnFiltrar.Enabled := qryIdentificacao.State = dsBrowse;
   bbtnLimparFiltros.Enabled := qryIdentificacao.State = dsBrowse;
   lblLimpar.Visible := qryIdentificacao.State in dsEditModes;

   if qryIdentificacao.State in dsEditModes then
   begin
      updIdentificacao.Params.ParamByName('CD_USUARIO').AsInteger :=
         DM.UsuarioLogado.Pessoa.Codigo;
   end;
end;

procedure TfrmCadIdentificacao.edtFiltroPessoaCodigoExit(Sender: TObject);
begin
   if edtFiltroPessoaCodigo.Text = FUltimaPessoa then
   begin
      Exit;   
   end;
   FUltimaPessoa := edtFiltroPessoaCodigo.Text;
   edtFiltroPessoaNome.Text := SearchNomePessoa(FUltimaPessoa);
end;

procedure TfrmCadIdentificacao.edtFiltroPessoaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8, #9, #48..#57, #127]) then
      Key := #0;   
end;

procedure TfrmCadIdentificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadIdentificacao.FormCreate(Sender: TObject);
const
   SChaveModuloCad = 'TerminalAcesso.Configuracoes.Identificacao.Cadastro';
   SChaveModuloHist = 'TerminalAcesso.Configuracoes.Identificacao.Historico';
var
   S: AnsiString;
begin
   FUltimaPessoa := '';
   FPermissoesCad := DM.UsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo, SChaveModuloCad);
   FPermissoesHist := DM.UsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo, SChaveModuloHist);
   qryFiltroTipo.Open;
   qryIdentificacaoTipo.Open;
   qryIdentificacao.Open;
   qryHistorico.Open;

   tbsHistorico.TabVisible := False;
   if npAcesso in FPermissoesHist then
   begin
      tbsHistorico.TabVisible := True;
   end;

   cbFiltroSituacao.ItemIndex := 0;
   dtpFiltroValidadeDe.Date := Date;
   dtpFiltroValidadeDe.Checked := False;
   dtpFiltroValidadeAte.Date := Date;
   dtpFiltroValidadeAte.Checked := False;
   ApplyFilters;

   S := DM.variavel_parametro('ta_identificacao_tamanho');
   FTamanhoCartao := StrToIntDef(S, 0);
end;

procedure TfrmCadIdentificacao.FormDestroy(Sender: TObject);
begin
   frmCadIdentificacao := nil;
end;

procedure TfrmCadIdentificacao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadIdentificacao.lblLimparClick(Sender: TObject);
begin
   qryIdentificacaoDT_VALIDADE.Clear;
end;

procedure TfrmCadIdentificacao.mmMotivoChange(Sender: TObject);
begin
   if qryIdentificacao.State = dsEdit then
   begin
      updIdentificacao.Params.ParamByName('DS_OBSERVACOES').AsString := mmMotivo.Text;
   end;
end;

procedure TfrmCadIdentificacao.qryIdentificacaoCD_PESSOAChange(Sender: TField);
begin
   qryIdentificacaoNM_PESSOA.AsString :=
      SearchNomePessoa(qryIdentificacaoCD_PESSOA.AsString);
end;

procedure TfrmCadIdentificacao.qryIdentificacaoNewRecord(DataSet: TDataSet);
var
   EndOfDay: TDateTime;
begin
   EndOfDay := RecodeTime(Date, 23, 59, 59, 0);
   qryIdentificacaoDT_VALIDADE.AsDateTime := EndOfDay;
end;

procedure TfrmCadIdentificacao.sbBuscaPessoaClick(Sender: TObject);
var
   ResFiltro: TResultadoFiltroPessoa;
begin
   ResFiltro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if ResFiltro.filtrado then
   begin
      qryIdentificacaoCD_PESSOA.AsInteger := ResFiltro.cd_pessoa;
      qryIdentificacaoNM_PESSOA.AsString := ResFiltro.nm_pessoa;
   end;
end;

procedure TfrmCadIdentificacao.sbFiltroPessoaClick(Sender: TObject);
var
   ResFiltro: TResultadoFiltroPessoa;
begin
   ResFiltro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if ResFiltro.filtrado then
   begin
      edtFiltroPessoaCodigo.Text := Format('%d', [ResFiltro.cd_pessoa]);
      edtFiltroPessoaNome.Text := ResFiltro.nm_pessoa;
   end;
end;

procedure TfrmCadIdentificacao.sbRemoveFiltroTipoClick(Sender: TObject);
begin
   dblcFiltroTipo.KeyValue := Null;
end;

function TfrmCadIdentificacao.SearchNomePessoa(
  const ID: AnsiString): AnsiString;
const
   SSQLSelectNomePessoa = ''
      + 'SELECT '
      + '    nm_pessoa '
      + 'FROM '
      + '    pessoas '
      + 'WHERE '
      + '    cd_pessoa = ? ';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Result := '';
   Statement := PrepareStatement(SSQLSelectNomePessoa);
   try
      Statement.SetString(1, ID);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
         begin
            Result := ResultSet.GetStringByName('nm_pessoa');
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Statement.Close;
      Statement := nil;
   end;
end;

end.
