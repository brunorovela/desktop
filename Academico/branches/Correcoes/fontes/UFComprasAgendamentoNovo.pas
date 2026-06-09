unit UFComprasAgendamentoNovo;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, Buttons, ImgList, ToolWin, DB,
   DBClient, Grids, DBGrids, Contnrs, ZDbcIntfs, UZDbcFuncs;

type
   TfrmComprasAgendamentoNovo = class(TForm)
      btnCancelar: TToolButton;
      btnConfirmar: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      cdsProdutos: TClientDataSet;
      cdsProdutoscd_produto: TStringField;
      cdsProdutosds_produto: TStringField;
      cdsProdutosnr_estoque: TIntegerField;
      cdsProdutosnr_quantidade: TIntegerField;
      chkReservados: TCheckBox;
      dbgProdutos: TDBGrid;
      dsProdutos: TDataSource;
      dtpVigenciaAte: TDateTimePicker;
      dtpVigenciaDe: TDateTimePicker;
      edtCursoCodigo: TEdit;
      edtCursoNome: TEdit;
      edtEstudanteCodigo: TEdit;
      edtEstudanteNome: TEdit;
      edtProdutoCodigo: TEdit;
      edtProdutoNome: TEdit;
      edtTurma: TEdit;
      ilAcoes: TImageList;
      lblAnoSemestre: TLabel;
      lblCurso: TLabel;
      lblEstudante: TLabel;
      lblProdutos: TLabel;
      lblTurma: TLabel;
      lblVigencia: TLabel;
      lblVigenciaAte: TLabel;
      meAnoSemestre: TMaskEdit;
      pnlFiltros: TPanel;
      pnlOpcoes: TPanel;
      pnlProduto: TPanel;
      prbProgresso: TProgressBar;
      rbAluno: TRadioButton;
      rbCurso: TRadioButton;
      rbTurma: TRadioButton;
      sbAdicionaProduto: TSpeedButton;
      sbCurso: TSpeedButton;
      sbEstudante: TSpeedButton;
      sbProduto: TSpeedButton;
      sbTurma: TSpeedButton;
      tlbAcoes: TToolBar;
      udAnoSemestre: TUpDown;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure dbgProdutosCellClick(Column: TColumn);
      procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dbgProdutosMouseMove(Sender: TObject; Shift: TShiftState;
         X, Y: Integer);
      procedure edtCursoCodigoExit(Sender: TObject);
      procedure edtEstudanteCodigoExit(Sender: TObject);
      procedure edtEstudanteCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure edtProdutoCodigoExit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure rbAlunoClick(Sender: TObject);
      procedure rbCursoClick(Sender: TObject);
      procedure rbTurmaClick(Sender: TObject);
      procedure sbAdicionaProdutoClick(Sender: TObject);
      procedure sbCursoClick(Sender: TObject);
      procedure sbEstudanteClick(Sender: TObject);
      procedure sbProdutoClick(Sender: TObject);
      procedure sbTurmaClick(Sender: TObject);
      procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
   private
      function ValidateProdutos: Boolean;
      function ValidateVigencia: Boolean;
      function SelecionaAlunos: IZResultSet;
      procedure AdicionaProduto;
      procedure DisableControls;
      procedure LoadFont;
      procedure RegistraAgendamentos;
      procedure UpdateControls;
   end;

var
   frmComprasAgendamentoNovo: TfrmComprasAgendamentoNovo;

implementation

uses
   uDM, uIUMDataModule, uFSelecionarCurso, uFSelecionarTurma,
   uFSelecionarPessoa, uFComprasBuscaProdutos;

{$R *.dfm}

{ TfrmComprasAgendamentoNovo }

procedure TfrmComprasAgendamentoNovo.AdicionaProduto;
begin
   if cdsProdutos.Locate('cd_produto', edtProdutoCodigo.Text, []) then
   begin
      edtProdutoCodigo.Clear;
      edtProdutoCodigo.Tag := 0;
      edtProdutoNome.Clear;
      Exit;
   end;
   
   cdsProdutos.Insert;
   cdsProdutoscd_produto.AsString := edtProdutoCodigo.Text;
   cdsProdutosds_produto.AsString := edtProdutoNome.Text;
   cdsProdutosnr_estoque.AsInteger := edtProdutoCodigo.Tag;
   cdsProdutosnr_quantidade.AsInteger := 0;
   cdsProdutos.Post;
   
   edtProdutoCodigo.Clear;
   edtProdutoCodigo.Tag := 0;
   edtProdutoNome.Clear;

   UpdateControls;

   dbgProdutos.Options := dbgProdutos.Options + [dgEditing]; 
   dbgProdutos.SetFocus;
   dbgProdutos.SelectedIndex := 3;
   dbgProdutos.SelectedField.FocusControl;
end;

procedure TfrmComprasAgendamentoNovo.btnCancelarClick(Sender: TObject);
const
   SCaptionConfirm = 'Confirmação';
   SMsgConfirm = 'Deseja realmente cancelar a inclusão do agendamento?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(Handle, SMsgConfirm, SCaptionConfirm,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice <> ID_YES then
      Exit;

   ModalResult := mrCancel;
end;

procedure TfrmComprasAgendamentoNovo.btnConfirmarClick(Sender: TObject);
begin
   RegistraAgendamentos;
end;

procedure TfrmComprasAgendamentoNovo.dbgProdutosCellClick(Column: TColumn);
const
   SCaptionConfirm = 'Confirmação';
   SMsgConfirm = 'Deseja realmente remover o registro selecionado?';
var
   UserChoice: Integer;
   GridOptions: TDBGridOptions;
begin
   GridOptions := dbgProdutos.Options;
   GridOptions := GridOptions - [dgEditing];
   
   if Column.Index = 3 then
      GridOptions := GridOptions + [dgEditing];

   dbgProdutos.Options := GridOptions;
   
   if Column.Index <> 4 then
      Exit;

   if cdsProdutos.IsEmpty then
      Exit;

   UserChoice := MessageBox(Handle, SMsgConfirm, SCaptionConfirm,
      MB_YESNO or MB_ICONQUESTION);

   dbgProdutos.SetFocus;
   dbgProdutos.SelectedIndex := 3;
   dbgProdutos.SelectedField.FocusControl;

   if UserChoice <> ID_YES then
      Exit;

   cdsProdutos.Delete;
end;

procedure TfrmComprasAgendamentoNovo.dbgProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   CharNumber = 61453;
   GlyphPadding = 2;
var
   SaveFont: TFont;
   LCanvas: TCanvas;
   DrawRect, CalcRect: TRect;
   S: WideString;
   CharLen, CharWidth: Integer;
begin
   if DataCol <> 4 then
      Exit;

   if cdsProdutos.IsEmpty then
   begin
      dbgProdutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   LCanvas := dbgProdutos.Canvas;
   SaveFont := TFont.Create;
   try
      SaveFont.Assign(LCanvas.Font);
      LCanvas.Font.Name := 'FontAwesome';
      LCanvas.Font.Size := 12;      
      DrawRect := Rect;
      CalcRect := Rect;
      
      S := WideChar(CharNumber);
      CharLen := Length(S);
      
      DrawTextW(LCanvas.Handle, PWideChar(S), CharLen, CalcRect,
         DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_CALCRECT);

      CharWidth := CalcRect.Right - CalcRect.Left;

      DrawRect.Left := DrawRect.Left + GlyphPadding;
      DrawRect.Right := DrawRect.Left + CharWidth + GlyphPadding * 2;
      DrawRect.Top := Rect.Top;
      DrawRect.Bottom := Rect.Bottom;

      DrawTextW(LCanvas.Handle, PWideChar(S), CharLen, DrawRect,
         DT_CENTER or DT_VCENTER or DT_SINGLELINE);

   finally
      LCanvas.Font.Assign(SaveFont);
      LCanvas := nil;
      FreeAndNil(SaveFont);
   end;
end;

procedure TfrmComprasAgendamentoNovo.dbgProdutosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   GridCoord: TGridCoord;
begin
   GridCoord := dbgProdutos.MouseCoord(X, Y);

   if (GridCoord.X = 5) and (GridCoord.Y > 0) then
      dbgProdutos.Cursor := crHandPoint;

   if (GridCoord.X <> 5) or (GridCoord.Y <= 0) then
      dbgProdutos.Cursor := crDefault;
end;

procedure TfrmComprasAgendamentoNovo.DisableControls;
begin
   pnlFiltros.Enabled := False;
   pnlProduto.Enabled := False;
   dbgProdutos.Enabled := False;
   tlbAcoes.Enabled := False;
end;

procedure TfrmComprasAgendamentoNovo.edtCursoCodigoExit(Sender: TObject);
const
   SSQLSelectNomeCurso = ''
      + 'SELECT '
      + '	DS_CURSO '
      + 'FROM '
      + '	cursos_mestre '
      + 'WHERE '
      + '	CD_CURSO = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Found: Boolean;
begin
   if Trim(edtCursoCodigo.Text) = '' then
      Exit;

   Stmt := PrepareStatement(SSQLSelectNomeCurso);
   try
      Stmt.SetString(1, edtCursoCodigo.Text);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Found := Rs.Next;

         if not Found then
         begin
            edtCursoCodigo.Clear;
            edtCursoNome.Clear;
         end;

         if Found then
            edtCursoNome.Text := Rs.GetString(1);
      finally
         Rs.Close;
         Rs := nil;
      end;   
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmComprasAgendamentoNovo.edtEstudanteCodigoExit(Sender: TObject);
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
   if edtEstudanteCodigo.Text = '' then
   begin
      edtEstudanteNome.Clear;
      Exit;
   end;

   Stmt := PrepareStatement(SSQLSelectNomePessoa);
   try
      Stmt.SetString(1, edtEstudanteCodigo.Text);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Found := Rs.Next;

         if not Found then
         begin
            edtEstudanteCodigo.Clear;
            edtEstudanteNome.Clear;
         end;

         if Found then
            edtEstudanteNome.Text := Rs.GetString(1);
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmComprasAgendamentoNovo.edtEstudanteCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8, #48..#57, #127]) then
      Key := #0;
end;

procedure TfrmComprasAgendamentoNovo.edtProdutoCodigoExit(Sender: TObject);
const
   SSQLSelectNomeProduto = ''
      + 'SELECT '
      + '	p.DS_PRODUTO, '
      + '	SUM( '
      + '		CASE e.TP_ENTRADA_SAIDA '
      + '			WHEN 1 THEN COALESCE(e.NR_QUANTIDADE, 0) '
      + '			WHEN 3 THEN COALESCE(e.NR_QUANTIDADE, 0) '
      + '			ELSE 0 - COALESCE(e.NR_QUANTIDADE, 0) '
      + '		END '
      + '	) '
      + 'FROM '
      + '	comp_produtos p '
      + '		LEFT JOIN comp_estoque e ON '
      + '			(p.CD_PRODUTO = e.CD_PRODUTO) '
      + 'WHERE '
      + '	p.CD_PRODUTO = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Found: Boolean;
begin
   if Trim(edtProdutoCodigo.Text) = '' then
   begin
      edtProdutoNome.Clear;
      Exit;
   end;

   Stmt := PrepareStatement(SSQLSelectNomeProduto);
   try
      Stmt.SetString(1, edtProdutoCodigo.Text);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Found := Rs.Next;

         if not Found then
         begin
            edtProdutoCodigo.Clear;
            edtProdutoNome.Clear;
         end;

         if Found then
         begin
            edtProdutoCodigo.Tag := Rs.GetInt(2);
            edtProdutoNome.Text := Rs.GetString(1);
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
   
   UpdateControls;   
end;

procedure TfrmComprasAgendamentoNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   cdsProdutos.EmptyDataSet;
   cdsProdutos.Close;
   frmComprasAgendamentoNovo := nil;
   Action := caFree;
end;

procedure TfrmComprasAgendamentoNovo.FormCreate(Sender: TObject);
begin
   LoadFont;
   dbgProdutos.Columns[4].Font.Name := 'FontAwesome';
   meAnoSemestre.Text := Format('%d', [DM.GetAnoSemestreAtual]);
   dtpVigenciaDe.Date := Date;
   dtpVigenciaAte.Date := Date;
   cdsProdutos.CreateDataSet;
   cdsProdutos.Open;
end;

procedure TfrmComprasAgendamentoNovo.LoadFont;
var
   ResStream: TResourceStream;
   FontsCount: Integer;
begin
   ResStream := TResourceStream.Create(HInstance, 'FontAwesome', 'TTF');
   try
      AddFontMemResourceEx(ResStream.Memory, ResStream.Size, nil, @FontsCount);
   finally
      FreeAndNil(ResStream);
   end;
end;

procedure TfrmComprasAgendamentoNovo.rbAlunoClick(Sender: TObject);
begin
   UpdateControls;
end;

procedure TfrmComprasAgendamentoNovo.rbCursoClick(Sender: TObject);
begin
   UpdateControls;
end;

procedure TfrmComprasAgendamentoNovo.rbTurmaClick(Sender: TObject);
begin
   UpdateControls;
end;

procedure TfrmComprasAgendamentoNovo.RegistraAgendamentos;
const
   SCaptionConfirm = 'Confirmação';
   SCaptionInfo = 'Informação';
   SMsgConfirmFmt = ''
      + 'Deseja realmente confirmar o agendamento dos produtos incluídos para '
      + 'um total de %d aluno(s) selecionado(s) de acordo com os filtros '
      + 'aplicados?';
   SMsgInfoSuccess = ''
      + 'O agendamento para entrega de materiais foi concluído com sucesso.';
   SSQLInsertAgendamento = ''
      + 'INSERT INTO comp_agendamento ( '
      + '	cd_pessoa, '
      + '	cd_turma, '
      + '	nr_anosemestre, '
      + '	cd_produto, '
      + '	nr_quantidade, '
      + '	dt_inicio_vigencia, '
      + '	dt_fim_vigencia, '
      + '	cd_usuario_agendamento, '
      + '	dt_agendamento '
      + ') VALUES '
      + '	(?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP) ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   RecordCount, UserChoice: Integer;
   S: AnsiString;
begin
   if not ValidateVigencia then
      Exit;

   if not ValidateProdutos then
      Exit;

   cdsProdutos.DisableControls;
   cdsProdutos.Filter := 'nr_quantidade = 0';
   cdsProdutos.Filtered := True;

   while not cdsProdutos.IsEmpty do
      cdsProdutos.Delete;

   cdsProdutos.Filtered := False;

   Rs := SelecionaAlunos;
   Rs.Last;
   RecordCount := Rs.GetRow;
   Rs.BeforeFirst;

   S := Format(SMsgConfirmFmt, [RecordCount]);
   UserChoice := MessageBox(Handle, PChar(S), SCaptionConfirm,
      MB_ICONQUESTION or MB_YESNO);

   if UserChoice <> ID_YES then
   begin
      cdsProdutos.EnableControls;
      Exit;
   end;

   DisableControls;  

   prbProgresso.Max := RecordCount * cdsProdutos.RecordCount;
   prbProgresso.Min := 0;
   prbProgresso.Position := 0;
   prbProgresso.Show;
   
   Stmt := PrepareStatement(SSQLInsertAgendamento);
   try
      while Rs.Next do
      begin
      
         cdsProdutos.First;
         
         while not cdsProdutos.Eof do
         begin
            Stmt.ClearParameters;
            Stmt.SetInt(1, Rs.GetIntByName('codigoaluno'));
            Stmt.SetString(2, Rs.GetStringByName('turma'));
            Stmt.SetString(3, meAnoSemestre.Text);
            Stmt.SetString(4, cdsProdutoscd_produto.AsString);
            Stmt.SetInt(5, cdsProdutosnr_quantidade.AsInteger);
            Stmt.SetDate(6, dtpVigenciaDe.Date);
            Stmt.SetDate(7, dtpVigenciaAte.Date);
            Stmt.SetInt(8, DM.UsuarioLogado.Pessoa.Codigo);
            Stmt.ExecutePrepared;

            prbProgresso.StepIt;
            Application.ProcessMessages;

            cdsProdutos.Next;
         end;
         
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   MessageBox(Handle, SMsgInfoSuccess, SCaptionInfo,
      MB_ICONINFORMATION or MB_OK);

   cdsProdutos.EnableControls;
   ModalResult := mrOk;
end;

procedure TfrmComprasAgendamentoNovo.sbAdicionaProdutoClick(Sender: TObject);
begin
   AdicionaProduto;
end;

procedure TfrmComprasAgendamentoNovo.sbCursoClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroCurso;
   AnoSemestre: Integer;
begin
   AnoSemestre := StrToIntDef(meAnoSemestre.Text, DM.GetAnoSemestreAtual);

   ResultadoFiltro := TfrmSelecionarCurso.Filtrar([], -1, -1, AnoSemestre);

   if not ResultadoFiltro.filtrado then
      Exit;

   meAnoSemestre.Text := Format('%d', [ResultadoFiltro.nr_anosemestre]);
   edtCursoCodigo.Text := ResultadoFiltro.cd_curso;
   edtCursoNome.Text := ResultadoFiltro.ds_curso;
end;

procedure TfrmComprasAgendamentoNovo.sbEstudanteClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
   AnoSemestre: Integer;
begin
   AnoSemestre := StrToIntDef(meAnoSemestre.Text, DM.GetAnoSemestreAtual);

   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([bapPessoa, bapProfessor,
      bapAvancada, bapObservacoes, bapFuncionario, bapOrientadorAtivo,
      bapFornecedor], afpEstudante,
      AnoSemestre);

   if not ResultadoFiltro.filtrado then
      Exit;

   meAnoSemestre.Text := Format('%d', [ResultadoFiltro.nr_anosemestre]);
   edtCursoCodigo.Text := ResultadoFiltro.cd_curso;
   edtCursoNome.Text := ResultadoFiltro.CursoNome;
   edtTurma.Text := ResultadoFiltro.cd_turma;
   edtEstudanteCodigo.Text := Format('%d', [ResultadoFiltro.cd_pessoa]);
   edtEstudanteNome.Text := ResultadoFiltro.nm_pessoa;
end;

procedure TfrmComprasAgendamentoNovo.sbProdutoClick(Sender: TObject);
begin
   if frmComprasBuscaProdutos = nil then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   frmComprasBuscaProdutos.ShowModal;

   if not frmComprasBuscaProdutos.flgSearch then
      Exit;

   edtProdutoCodigo.Tag :=
      frmComprasBuscaProdutos.qyListaProdutosQTD_PRODUTOS.AsInteger;
   edtProdutoCodigo.Text :=
      frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edtProdutoNome.Text :=
      frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;

   UpdateControls;
end;

procedure TfrmComprasAgendamentoNovo.sbTurmaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroTurma;
   AnoSemestre: Integer;
begin
   AnoSemestre := StrToIntDef(meAnoSemestre.Text, DM.GetAnoSemestreAtual);

   ResultadoFiltro := TfrmSelecionarTurma.Filtrar([], AnoSemestre, -1, -1,
      edtCursoCodigo.Text);

   if not ResultadoFiltro.filtrado then
      Exit;

   meAnoSemestre.Text := Format('%d', [ResultadoFiltro.nr_anosemestre]);
   edtCursoCodigo.Text := ResultadoFiltro.cd_curso;
   edtCursoNome.Text := ResultadoFiltro.ds_curso;
   edtTurma.Text := ResultadoFiltro.cd_turma;
end;

function TfrmComprasAgendamentoNovo.SelecionaAlunos: IZResultSet;
const
   SSQLSelectAlunos = ''
      + 'SELECT DISTINCT '
      + '	m.codigoaluno, '
      + '	m.turma '
      + 'FROM '
      + '	matriculas m '
      + '		JOIN situacao s ON '
      + '			(m.situacao = s.cd_situacao) '
      + 'WHERE '
      + '	m.anosemestre = ? AND ';
      
   SSQLFilterSituacoes = 's.cd_situacao_pai IN (0, 1, 2, 9, 11, 14)';
   SSQLFilterReservados = 's.cd_situacao_pai IN (0, 1, 2, 9, 10, 11, 14)';
   SSQLFilterCurso = 'm.curso = ?';
   SSQLFilterTurma = 'm.turma = ?';
   SSQLFilterAluno = 'm.codigoaluno = ?';
var
   Filters: TStrings;
   Stmt: IZPreparedStatement;
   S: AnsiString;
   I: Integer;
begin
   Filters := TStringList.Create;
   try
      if chkReservados.Checked then
         Filters.Add(SSQLFilterReservados);

      if not chkReservados.Checked then
         Filters.Add(SSQLFilterSituacoes);

      if rbCurso.Checked then
         Filters.Add(SSQLFilterCurso);

      if rbTurma.Checked then
         Filters.Add(SSQLFilterTurma);

      if rbAluno.Checked then
         Filters.Add(SSQLFilterAluno);

      for I := 0 to Filters.Count - 1 do
      begin
         if S <> '' then
            S := S + ' AND ';
         S := S + Filters[I];
      end;

      S := SSQLSelectAlunos + S;

      Stmt := PrepareStatement(S);
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Stmt.SetString(1, meAnoSemestre.Text);

      if rbCurso.Checked then
         Stmt.SetString(2, edtCursoCodigo.Text);

      if rbTurma.Checked then
         Stmt.SetString(2, edtTurma.Text);

      if rbAluno.Checked then
         Stmt.SetString(2, edtEstudanteCodigo.Text);

      Result := Stmt.ExecuteQueryPrepared;
   finally
      FreeAndNil(Filters);
   end;
end;

procedure TfrmComprasAgendamentoNovo.udAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSemestre.Text := DM.incrementar_ano_semestre(meAnoSemestre.Text);

   if Button = btPrev then
      meAnoSemestre.Text := DM.decrementar_ano_semestre(meAnoSemestre.Text);
end;

procedure TfrmComprasAgendamentoNovo.UpdateControls;
begin
   if not rbAluno.Checked then
   begin
      edtEstudanteCodigo.Clear;
      edtEstudanteNome.Clear;
   end;
   if not rbTurma.Checked then
   begin
      edtTurma.Clear;
   end;
   edtTurma.Enabled := not rbCurso.Checked;
   edtEstudanteCodigo.Enabled := rbAluno.Checked;
   edtEstudanteNome.Enabled := rbAluno.Checked;
   sbTurma.Enabled := not rbCurso.Checked;
   sbEstudante.Enabled := rbAluno.Checked;
   sbAdicionaProduto.Enabled := edtProdutoCodigo.Text <> '';
   btnConfirmar.Enabled :=
      (not cdsProdutos.IsEmpty) and
      ((not rbCurso.Checked) or (edtCursoCodigo.Text <> '')) and
      ((not rbTurma.Checked) or (edtTurma.Text <> '')) and
      ((not rbAluno.Checked) or (edtEstudanteCodigo.Text <> ''));
end;

function TfrmComprasAgendamentoNovo.ValidateProdutos: Boolean;
const
   SCaptionWarn = 'Atenção';
   SMsgSemQuantidade = ''
      + 'Existem produtos cujo quantidade informada é igual ou inferior à zero.'
      + ' Esses produtos não serão incluídos no agendamento.'#13'Clique em "Sim"'
      + ' para confirmar o agendamento ou "Não" para corrigir.';
var
   UserChoice: Integer;
begin
   Result := True;

   if cdsProdutos.State in [dsInsert, dsEdit] then
      cdsProdutos.Post;

   cdsProdutos.DisableControls;
   cdsProdutos.First;

   while not cdsProdutos.Eof do
   begin
      if cdsProdutosnr_quantidade.AsInteger <= 0 then
      begin
         UserChoice := MessageBox(Handle, SMsgSemQuantidade, SCaptionWarn,
            MB_ICONWARNING or MB_YESNO);

         if UserChoice <> ID_YES then
            Result := False;
            
         Break;
      end;
      cdsProdutos.Next;
   end;

   cdsProdutos.EnableControls;

   if not Result then
   begin
      dbgProdutos.Options := dbgProdutos.Options + [dgEditing];
      dbgProdutos.SetFocus;
      dbgProdutos.SelectedIndex := 3;
      dbgProdutos.SelectedField.FocusControl;
   end;
end;

function TfrmComprasAgendamentoNovo.ValidateVigencia: Boolean;
const
   SCaptionError = 'Erro';
   SMsgVigenciaInvalida = ''
      + 'A data limite da vigência do agendamento não pode ser inferior à '
      + 'data de início da vigência.';
   SMsgVigenciaPassada = ''
      + 'Não é possível incluir um agendamento cujo início da vigência é '
      + 'inferior à data de hoje.';
begin
   Result := True;

   if dtpVigenciaAte.Date < dtpVigenciaDe.Date then
   begin
      Result := False;
      MessageBox(Handle, SMsgVigenciaInvalida, SCaptionError,
         MB_ICONERROR or MB_OK);
      dtpVigenciaAte.SetFocus;
      Exit;
   end;

   if dtpVigenciaDe.Date < Date then
   begin
      Result := False;
      MessageBox(Handle, SMsgVigenciaPassada, SCaptionError,
         MB_ICONERROR or MB_OK);
      dtpVigenciaDe.SetFocus;
      Exit;
   end;
end;

end.
