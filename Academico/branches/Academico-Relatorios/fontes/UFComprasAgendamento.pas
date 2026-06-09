unit UFComprasAgendamento;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, ZDbcIntfs, UZDbcFuncs,
   uUsuario, ToolWin, ImgList, DB, ZAbstractRODataset, ZDataset, Provider,
   DBClient, Grids, DBGrids, UZSortedGrid, UZDataset, UDBGrids, ZSqlUpdate,
   ZAbstractDataset;

type
   TfrmComprasAgendamento = class(TForm)
      bbtnColunas: TToolButton;
      bbtnFiltrar: TBitBtn;
      bbtnLimpar: TBitBtn;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnSelecionarNenhum: TToolButton;
      btnSelecionarTodos: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      cbFiltroSituacao: TComboBox;
      cdsAgendamentos: TClientDataSet;
      cdsAgendamentoscd_agendamento: TLargeintField;
      cdsAgendamentoscd_pessoa: TIntegerField;
      cdsAgendamentoscd_produto: TStringField;
      cdsAgendamentoscd_turma: TStringField;
      cdsAgendamentoscd_usuario_agendamento: TIntegerField;
      cdsAgendamentoscd_usuario_cancelamento: TIntegerField;
      cdsAgendamentosDS_PRODUTO: TStringField;
      cdsAgendamentosds_situacao: TStringField;
      cdsAgendamentosdt_agendamento: TDateTimeField;
      cdsAgendamentosdt_cancelamento: TDateTimeField;
      cdsAgendamentosdt_fim_vigencia: TDateField;
      cdsAgendamentosdt_inicio_vigencia: TDateField;
      cdsAgendamentosnm_aluno: TStringField;
      cdsAgendamentosnm_usuario_agendamento: TStringField;
      cdsAgendamentosnm_usuario_cancelamento: TStringField;
      cdsAgendamentosnr_anosemestre: TSmallintField;
      cdsAgendamentosnr_quantidade: TLargeintField;
      cdsAgendamentosnr_selecionado: TIntegerField;
      cdsAgendamentossn_selecionado: TBooleanField;
      cdsAgendamentossum_selecionados: TAggregateField;
      dbgAgendamentos: TSortedDBGrid;
      dsAgendamentos: TDataSource;
      dspAgendamentos: TDataSetProvider;
      dtpFiltroVigenciaAte: TDateTimePicker;
      dtpFiltroVigenciaDe: TDateTimePicker;
      edtFiltroPessoaCodigo: TEdit;
      edtFiltroPessoaNome: TEdit;
      edtFiltroProdutoCodigo: TEdit;
      edtFiltroProdutoNome: TEdit;
      edtFiltroTurma: TEdit;
      ilAcoes: TImageList;
      lblFiltroPessoa: TLabel;
      lblFiltroProduto: TLabel;
      lblFiltroSituacao: TLabel;
      lblFiltroTurma: TLabel;
      lblFiltroVigencia: TLabel;
      lblFiltroVigenciaAte: TLabel;
      pnlFiltros: TPanel;
      pnlFiltrosTitulo: TPanel;
      pnlTitulo: TPanel;
      qryAgendamentos: TZQuery;
      qryAgendamentoscd_agendamento: TLargeintField;
      qryAgendamentoscd_pessoa: TIntegerField;
      qryAgendamentoscd_produto: TStringField;
      qryAgendamentoscd_turma: TStringField;
      qryAgendamentoscd_usuario_agendamento: TIntegerField;
      qryAgendamentoscd_usuario_cancelamento: TIntegerField;
      qryAgendamentosDS_PRODUTO: TStringField;
      qryAgendamentosds_situacao: TStringField;
      qryAgendamentosdt_agendamento: TDateTimeField;
      qryAgendamentosdt_cancelamento: TDateTimeField;
      qryAgendamentosdt_fim_vigencia: TDateField;
      qryAgendamentosdt_inicio_vigencia: TDateField;
      qryAgendamentosnm_aluno: TStringField;
      qryAgendamentosnm_usuario_agendamento: TStringField;
      qryAgendamentosnm_usuario_cancelamento: TStringField;
      qryAgendamentosnr_anosemestre: TSmallintField;
      qryAgendamentosnr_quantidade: TLargeintField;
      sbFiltroPessoa: TSpeedButton;
      sbFiltroProduto: TSpeedButton;
      sbFiltroTurma: TSpeedButton;
      tlbAcoes: TToolBar;
      updAgendamento: TZUpdateSQL;
    cdsAgendamentosdt_entrega: TDateField;
    cdsAgendamentosnm_usuario_entrega: TStringField;
    qryAgendamentosdt_entrega: TDateField;
    qryAgendamentosnm_usuario_entrega: TStringField;
      procedure bbtnColunasClick(Sender: TObject);
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure bbtnLimparClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnSelecionarNenhumClick(Sender: TObject);
      procedure btnSelecionarTodosClick(Sender: TObject);
      procedure cbFiltroSituacaoChange(Sender: TObject);
      procedure cdsAgendamentosCalcFields(DataSet: TDataSet);
      procedure dbgAgendamentosCellClick(Column: TColumn);
      procedure dbgAgendamentosDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn;
         State: TGridDrawState);
      procedure dtpFiltroVigenciaAteChange(Sender: TObject);
      procedure dtpFiltroVigenciaAteClick(Sender: TObject);
      procedure dtpFiltroVigenciaDeChange(Sender: TObject);
      procedure dtpFiltroVigenciaDeClick(Sender: TObject);
      procedure edtFiltroPessoaCodigoExit(Sender: TObject);
      procedure edtFiltroPessoaCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure edtFiltroProdutoCodigoExit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure sbFiltroPessoaClick(Sender: TObject);
      procedure sbFiltroProdutoClick(Sender: TObject);
      procedure sbFiltroTurmaClick(Sender: TObject);
   private
      FPermissoes: TUMPermissoes;
      FAnoSemestre: Integer;
      FSavedVigenciaDe: TDate;
      FSavedVigenciaAte: TDate;
      FSavedVigenciaDeChecked: Boolean;
      FSavedVigenciaAteChecked: Boolean;
      FSavedTurmaId: AnsiString;
      FSavedPessoaId: AnsiString;
      FSavedSituacaoIndex: Integer;
      FSavedProdutoId: AnsiString;
      function FiltersChanged: Boolean;
      procedure ApplyFilters;
      procedure CancelaAgendamentos;
      procedure ClearFilters;
      procedure InitializeFilters;
      procedure SaveFilters;
      procedure UpdateButtonState;
      procedure UpdateToolBar;
   end;

var
   frmComprasAgendamento: TfrmComprasAgendamento;

implementation

uses
   uDM, uCamposPlanilhas, uFSelecionarTurma, uFSelecionarPessoa,
   uFComprasBuscaProdutos, UFComprasAgendamentoNovo;

{$R *.dfm}

procedure TfrmComprasAgendamento.ApplyFilters;
const
   SSQLSelectAgendamentos = ''
      + 'SELECT '
      + '	a.cd_agendamento, '
      + '	a.cd_pessoa, '
      + '	a.cd_produto, '
      + '	a.cd_turma, '
      + '	a.cd_usuario_agendamento, '
      + '	a.cd_usuario_cancelamento, '
      + '	a.ds_situacao, '
      + '	a.dt_agendamento, '
      + '	a.dt_cancelamento, '
      + '	a.dt_fim_vigencia, '
      + '	a.dt_inicio_vigencia, '
      + '	a.nr_anosemestre, '
      + '	a.nr_quantidade, '
      + '	p.nm_pessoa nm_aluno, '
      + '	pa.nm_pessoa nm_usuario_agendamento, '
      + '	pc.nm_pessoa nm_usuario_cancelamento, '
      + '	r.DS_PRODUTO, '
      + '	ce.DT_COMPRA dt_entrega, '
      + '	ps.nm_pessoa nm_usuario_entrega   '
      + ' FROM '
      + '   comp_agendamento a '
      + '      JOIN pessoas p ON '
      + '         (a.cd_pessoa = p.cd_pessoa) '
      + '      JOIN pessoas pa ON '
      + '         (a.cd_usuario_agendamento = pa.cd_pessoa) '
      + '      LEFT JOIN pessoas pc ON '
      + '         (a.cd_usuario_cancelamento = pc.cd_pessoa) '
      + '      LEFT JOIN comp_estoque ce ON ( ce.CD_COMPRA = a.cd_compra ) '
      + '      LEFT JOIN pessoas ps ON (ps.cd_pessoa = ce.CD_USUARIO) '
      + '      JOIN comp_produtos r ON '
      + '         (a.cd_produto = r.CD_PRODUTO) ';
   SSQLFilterVigenciaDe = 'a.dt_inicio_vigencia >= :dt_inicio_vigencia';
   SSQLFilterVigenciaAte = 'a.dt_fim_vigencia <= :dt_fim_vigencia';
   SSQLFilterTurma = 'a.cd_turma = :cd_turma';
   SSQLFilterAnoSemestre = 'a.nr_anosemestre = :nr_anosemestre';
   SSQLFilterAluno = 'a.cd_pessoa = :cd_pessoa';
   SSQLFilterSituacao = 'a.ds_situacao = :ds_situacao';
   SSQLFilterProduto = 'a.cd_produto = :cd_produto';
var
   Filters: TStrings;
   Params: TParams;
   S: AnsiString;
   I: Integer;
begin
   Filters := TStringList.Create;
   try
      Params := TParams.Create;
      try
         if dtpFiltroVigenciaDe.Checked then
         begin
            Filters.Add(SSQLFilterVigenciaDe);
            Params.CreateParam(ftUnknown, 'dt_inicio_vigencia',
               ptUnknown).AsDate := dtpFiltroVigenciaDe.Date;
         end;

         if dtpFiltroVigenciaAte.Checked then
         begin
            Filters.Add(SSQLFilterVigenciaAte);
            Params.CreateParam(ftUnknown, 'dt_fim_vigencia',
               ptUnknown).AsDate := dtpFiltroVigenciaAte.Date;
         end;

         if edtFiltroTurma.Text <> '' then
         begin
            Filters.Add(SSQLFilterTurma);
            Filters.Add(SSQLFilterAnoSemestre);
            Params.CreateParam(ftUnknown, 'cd_turma', ptUnknown).AsString :=
               edtFiltroTurma.Text;
            Params.CreateParam(ftUnknown, 'nr_anosemestre',
               ptUnknown).AsInteger := FAnoSemestre;
         end;

         if edtFiltroPessoaCodigo.Text <> '' then
         begin
            Filters.Add(SSQLFilterAluno);
            Params.CreateParam(ftUnknown, 'cd_pessoa', ptUnknown).AsString :=
               edtFiltroPessoaCodigo.Text;
         end;

         if cbFiltroSituacao.ItemIndex > 0 then
         begin
            Filters.Add(SSQLFilterSituacao);
            Params.CreateParam(ftUnknown, 'ds_situacao', ptUnknown).AsString :=
               cbFiltroSituacao.Text;
         end;

         if edtFiltroProdutoCodigo.Text <> '' then
         begin
            Filters.Add(SSQLFilterProduto);
            Params.CreateParam(ftUnknown, 'cd_produto', ptUnknown).AsString :=
               edtFiltroProdutoCodigo.Text;
         end;

         if Filters.Count = 0 then
         begin
            cdsAgendamentos.Close;
            qryAgendamentos.SQL.Text := SSQLSelectAgendamentos;
            cdsAgendamentos.Open;
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
            S := SSQLSelectAgendamentos + ' WHERE ' + S;

            qryAgendamentos.SQL.Text := S;
            cdsAgendamentos.FetchParams;
            cdsAgendamentos.Params.AssignValues(Params);

            if cdsAgendamentos.Active then
               cdsAgendamentos.Refresh;
               
            if not cdsAgendamentos.Active then
               cdsAgendamentos.Open;
         end;
         
      finally
         Params.Free;
      end;
   finally
      Filters.Free;
   end;
end;

procedure TfrmComprasAgendamento.bbtnColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(dbgAgendamentos)),
      'frmComprasAgendamento.dbgAgendamentos');
end;

procedure TfrmComprasAgendamento.bbtnFiltrarClick(Sender: TObject);
begin
   SaveFilters;
   UpdateButtonState;
   UpdateToolBar;
   ApplyFilters;
end;

procedure TfrmComprasAgendamento.bbtnLimparClick(Sender: TObject);
begin
   ClearFilters;
end;

procedure TfrmComprasAgendamento.btnExcluirClick(Sender: TObject);
const
   SCaptionConfirm = 'Confirmação';
   SMsgConfirmFmt = ''
      + 'Deseja realmente efetuar o cancelamento do(s) %s agendamento(s) '
      + 'selecionado(s)? Essa operação não poderá ser revertida.'#13'Deseja '
      + 'realmente continuar?';
var
   S: AnsiString;
   UserChoice: Integer;
begin
   S := Format(SMsgConfirmFmt, [cdsAgendamentossum_selecionados.Value]);

   UserChoice := MessageBox(Handle, PChar(S), SCaptionConfirm,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice <> ID_YES then
      Exit;

   CancelaAgendamentos;
end;

procedure TfrmComprasAgendamento.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmComprasAgendamento.btnIncluirClick(Sender: TObject);
begin
   if frmComprasAgendamentoNovo = nil then
      Application.CreateForm(TfrmComprasAgendamentoNovo,
         frmComprasAgendamentoNovo);

   if frmComprasAgendamentoNovo.ShowModal = mrOk then
      ApplyFilters;
end;

procedure TfrmComprasAgendamento.btnSelecionarNenhumClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsAgendamentos.GetBookmark;
   cdsAgendamentos.DisableControls;
   cdsAgendamentos.First;
   while not cdsAgendamentos.Eof do
   begin
      if cdsAgendamentosds_situacao.AsString = 'Pendente' then
      begin
         cdsAgendamentos.Edit;
         cdsAgendamentossn_selecionado.AsBoolean := False;
      end;
      cdsAgendamentos.Next;
   end;
   cdsAgendamentos.GotoBookmark(Bookmark);
   cdsAgendamentos.EnableControls;
   UpdateToolBar;
end;

procedure TfrmComprasAgendamento.btnSelecionarTodosClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsAgendamentos.GetBookmark;
   cdsAgendamentos.DisableControls;
   cdsAgendamentos.First;
   while not cdsAgendamentos.Eof do
   begin
      if cdsAgendamentosds_situacao.AsString = 'Pendente' then
      begin
         cdsAgendamentos.Edit;
         cdsAgendamentossn_selecionado.AsBoolean := True;
      end;
      cdsAgendamentos.Next;
   end;
   cdsAgendamentos.GotoBookmark(Bookmark);
   cdsAgendamentos.EnableControls;
   UpdateToolBar;
end;

procedure TfrmComprasAgendamento.CancelaAgendamentos;
begin
   cdsAgendamentos.DisableControls;
   cdsAgendamentos.Filter := 'sn_selecionado AND (ds_situacao = ''Pendente'')';
   cdsAgendamentos.Filtered := True;
   cdsAgendamentos.First;

   while not cdsAgendamentos.IsEmpty do
   begin
      cdsAgendamentos.Edit;
      cdsAgendamentoscd_usuario_cancelamento.AsInteger :=
         DM.UsuarioLogado.Pessoa.Codigo;
      cdsAgendamentosds_situacao.AsString := 'Cancelado';
      cdsAgendamentos.Post;
   end;

   cdsAgendamentos.ApplyUpdates(0);
   cdsAgendamentos.Filtered := False;
   cdsAgendamentos.Refresh;
   cdsAgendamentos.EnableControls;
end;

procedure TfrmComprasAgendamento.cbFiltroSituacaoChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.cdsAgendamentosCalcFields(DataSet: TDataSet);
begin
   cdsAgendamentosnr_selecionado.AsInteger :=
      Ord(cdsAgendamentossn_selecionado.AsBoolean);
end;

procedure TfrmComprasAgendamento.ClearFilters;
begin
   dtpFiltroVigenciaDe.Date := Date;
   dtpFiltroVigenciaDe.Checked := False;
   dtpFiltroVigenciaAte.Date := Date;
   dtpFiltroVigenciaAte.Checked := False;
   edtFiltroTurma.Clear;
   edtFiltroPessoaCodigo.Clear;
   edtFiltroPessoaNome.Clear;
   cbFiltroSituacao.ItemIndex := 0;
   edtFiltroProdutoCodigo.Clear;
   edtFiltroProdutoNome.Clear;
   UpdateButtonState;
   bbtnLimpar.Enabled := False;
end;

procedure TfrmComprasAgendamento.dbgAgendamentosCellClick(Column: TColumn);
begin
   if Column.Field.DataType <> ftBoolean then
      Exit;
   if cdsAgendamentosds_situacao.AsString <> 'Pendente' then
      Exit;
   Column.Field.DataSet.Edit;
   Column.Field.AsBoolean := not Column.Field.AsBoolean;
   Column.Field.DataSet.Post;
   UpdateToolBar;
end;

procedure TfrmComprasAgendamento.dbgAgendamentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
   // https://flatuicolors.com/palette/defo
   ColorAlizarim = $003C4CE7;
   ColorAsbestos = $008D8C7F;
   ColorNephritis = $0060AE27;
   ColorTurquoise = $009CBC1A;
var
   DrawRect: TRect;
   S: AnsiString;
begin
   if (Column.Field.DataType = ftBoolean) and
      (cdsAgendamentosds_situacao.AsString = 'Pendente') then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(dbgAgendamentos.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
      Exit;
   end;

   if (gdSelected in State) or (gdFocused in State) then
   begin
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   S := cdsAgendamentosds_situacao.AsString;

   if S = 'Entregue' then
   begin
      dbgAgendamentos.Canvas.Font.Color := clWhite;
      dbgAgendamentos.Canvas.Brush.Color := ColorNephritis;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   if S = 'Cancelado' then
   begin
      dbgAgendamentos.Canvas.Font.Color := clWhite;
      dbgAgendamentos.Canvas.Brush.Color := ColorAsbestos;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   if cdsAgendamentosdt_fim_vigencia.AsDateTime < Date then
   begin
      dbgAgendamentos.Canvas.Font.Color := clWhite;
      dbgAgendamentos.Canvas.Brush.Color := ColorAlizarim;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   if cdsAgendamentosdt_inicio_vigencia.AsDateTime <= Date then
   begin
      dbgAgendamentos.Canvas.Font.Color := clWhite;
      dbgAgendamentos.Canvas.Brush.Color := ColorTurquoise;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   if cdsAgendamentosdt_inicio_vigencia.AsDateTime > Date then
   begin
      dbgAgendamentos.Canvas.Font.Color := clBlack;
      dbgAgendamentos.Canvas.Brush.Color := clWhite;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

end;

procedure TfrmComprasAgendamento.dtpFiltroVigenciaAteChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.dtpFiltroVigenciaAteClick(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.dtpFiltroVigenciaDeChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.dtpFiltroVigenciaDeClick(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.edtFiltroPessoaCodigoExit(Sender: TObject);
const
   SSQLSelectNomePessoa = ''
      + 'SELECT '
      + '	nm_pessoa '
      + 'FROM '
      + '	pessoas '
      + 'WHERE '
      + '	cd_pessoa = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Found: Boolean;
begin
   if edtFiltroPessoaCodigo.Text = '' then
      edtFiltroPessoaNome.Clear;

   if edtFiltroPessoaCodigo.Text = FSavedPessoaId then
      Exit;

   Stmt := PrepareStatement(SSQLSelectNomePessoa);
   try
      Stmt.SetString(1, edtFiltroPessoaCodigo.Text);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Found := Rs.Next;

         if not Found then
         begin
            edtFiltroPessoaCodigo.Clear;
            edtFiltroPessoaNome.Clear;
         end;

         if Found then
            edtFiltroPessoaNome.Text := Rs.GetString(1);
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.edtFiltroPessoaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8, #48..#57, #127]) then
      Key := #0;
end;

procedure TfrmComprasAgendamento.edtFiltroProdutoCodigoExit(Sender: TObject);
const
   SSQLSelectNomeProduto = ''
      + 'SELECT '
      + '	DS_PRODUTO '
      + 'FROM '
      + '	comp_produtos '
      + 'WHERE '
      + '	CD_PRODUTO = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Found: Boolean;
begin
   edtFiltroProdutoCodigo.Text := Trim(edtFiltroProdutoCodigo.Text);

   if edtFiltroProdutoCodigo.Text = '' then
      edtFiltroProdutoNome.Clear;

   if edtFiltroProdutoCodigo.Text = FSavedProdutoId then
      Exit;

   Stmt := PrepareStatement(SSQLSelectNomeProduto);
   try
      Stmt.SetString(1, edtFiltroProdutoCodigo.Text);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Found := Rs.Next;

         if not Found then
         begin
            edtFiltroProdutoCodigo.Clear;
            edtFiltroProdutoNome.Clear;
         end;

         if Found then
            edtFiltroProdutoNome.Text := Rs.GetString(1);
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   UpdateButtonState;
end;

function TfrmComprasAgendamento.FiltersChanged: Boolean;
begin
   Result :=
      (FSavedVigenciaDe <> dtpFiltroVigenciaDe.Date) or
      (FSavedVigenciaDeChecked <> dtpFiltroVigenciaDe.Checked) or
      (FSavedVigenciaAte <> dtpFiltroVigenciaAte.Date) or
      (FSavedVigenciaAteChecked <> dtpFiltroVigenciaAte.Checked) or
      (FSavedTurmaId <> edtFiltroTurma.Text) or
      (FSavedPessoaId <> edtFiltroPessoaCodigo.Text) or
      (FSavedSituacaoIndex <> cbFiltroSituacao.ItemIndex) or
      (FSavedProdutoId <> edtFiltroProdutoCodigo.Text);            
end;

procedure TfrmComprasAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmComprasAgendamento := nil;
   Action := caFree;
end;

procedure TfrmComprasAgendamento.FormCreate(Sender: TObject);
const
   SChave = 'UMFinanceiro.Compras.Agendamentos';
begin
   DM.montarPlanilha(TDBGrid(TCustomDBGrid(dbgAgendamentos)),
      'frmComprasAgendamento.dbgAgendamentos');
   FPermissoes := DM.UsuarioLogado.GetPermissoes(DM.UsuarioLogado.Pessoa.Codigo,
      SChave);
   FAnoSemestre := DM.GetAnoSemestreAtual;
   InitializeFilters;
   SaveFilters;
   UpdateButtonState;
   ApplyFilters;
   UpdateToolBar;
end;

procedure TfrmComprasAgendamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if btnIncluir.Enabled then
            btnIncluir.Click;
      VK_F9:
         if btnExcluir.Enabled then
            btnExcluir.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfrmComprasAgendamento.InitializeFilters;
begin
   ClearFilters;
   dtpFiltroVigenciaDe.Date := Date;
   dtpFiltroVigenciaAte.Date := Date;
   dtpFiltroVigenciaDe.Checked := True;
   dtpFiltroVigenciaAte.Checked := False;
   cbFiltroSituacao.ItemIndex := 1;
   bbtnFiltrar.Enabled := False;
   bbtnLimpar.Enabled := True;
   SaveFilters;
end;

procedure TfrmComprasAgendamento.SaveFilters;
begin
   FSavedVigenciaDe := dtpFiltroVigenciaDe.Date;
   FSavedVigenciaAte := dtpFiltroVigenciaAte.Date;
   FSavedVigenciaDeChecked := dtpFiltroVigenciaDe.Checked;
   FSavedVigenciaAteChecked := dtpFiltroVigenciaAte.Checked;
   FSavedTurmaId := edtFiltroTurma.Text;
   FSavedPessoaId := edtFiltroPessoaCodigo.Text;
   FSavedSituacaoIndex := cbFiltroSituacao.ItemIndex;
   FSavedProdutoId := edtFiltroProdutoCodigo.Text;
end;

procedure TfrmComprasAgendamento.sbFiltroPessoaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([], afpEstudante,
      FAnoSemestre);

   if not ResultadoFiltro.filtrado then
      Exit;

   FAnoSemestre := ResultadoFiltro.nr_anosemestre;
   edtFiltroPessoaCodigo.Text := Format('%d', [ResultadoFiltro.cd_pessoa]);
   edtFiltroPessoaNome.Text := ResultadoFiltro.nm_pessoa;
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.sbFiltroProdutoClick(Sender: TObject);
begin
   if frmComprasBuscaProdutos = nil then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   frmComprasBuscaProdutos.PermitiSemEstoque := True;
   frmComprasBuscaProdutos.ShowModal;

   if not frmComprasBuscaProdutos.flgSearch then
      Exit;

   edtFiltroProdutoCodigo.Text :=
      frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edtFiltroProdutoNome.Text :=
      frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.sbFiltroTurmaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroTurma;
begin
   ResultadoFiltro := TfrmSelecionarTurma.Filtrar([], FAnoSemestre);

   if not ResultadoFiltro.filtrado then
      Exit;

   FAnoSemestre := ResultadoFiltro.nr_anosemestre;
   edtFiltroTurma.Text := ResultadoFiltro.cd_turma;
   UpdateButtonState;
end;

procedure TfrmComprasAgendamento.UpdateButtonState;
begin
   bbtnFiltrar.Enabled := FiltersChanged;
   bbtnLimpar.Enabled := FiltersChanged;
end;

procedure TfrmComprasAgendamento.UpdateToolBar;
begin
   btnSelecionarTodos.Enabled := True;
   btnSelecionarNenhum.Enabled := cdsAgendamentossum_selecionados.Value > 0;
   btnIncluir.Enabled := npIncluir in FPermissoes;
   btnExcluir.Enabled := (npExcluir in FPermissoes) and
      (cdsAgendamentossum_selecionados.Value > 0);
end;

end.
