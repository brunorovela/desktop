unit UFRemessaIncluir;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, DB, ZAbstractRODataset,
   UZDataset, DBCtrls, Buttons, DateUtils, uFSelecionarCurso, uFSelecionarTurma,
   uFSelecionarPessoa, CheckLst, Spin, UZDbcFuncs, ZDbcIntfs, ZVariant;

type
   TResultadoFiltroCursoPtr = ^TResultadoFiltroCurso;
   TResultadoFiltroTurmaPtr = ^TResultadoFiltroTurma;
   TResultadoFiltroPessoaPtr = ^TResultadoFiltroPessoa;

   TfrmRemessaIncluir = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnLimpar: TBitBtn;
      bbtnSalvar: TBitBtn;
      bvlSep1: TBevel;
      bvlTitulo: TBevel;
      chkAnoSemestre: TCheckBox;
      chkParcelas: TCheckBox;
      chkReservas: TCheckBox;
      clbTiposTitulo: TCheckListBox;
      dblcAcoes: TDBLookupComboBox;
      dsAcoes: TDataSource;
      dtpEmissaoAte: TDateTimePicker;
      dtpEmissaoDe: TDateTimePicker;
      dtpVenctoAte: TDateTimePicker;
      dtpVenctoDe: TDateTimePicker;
      edtAluno: TEdit;
      edtCurso: TEdit;
      edtTurma: TEdit;
      lblAcao: TLabel;
      lblAluno: TLabel;
      lblCurso: TLabel;
      lblEmissao: TLabel;
      lblEmissaoAte: TLabel;
      lblFiltros: TLabel;
      lblParcelaAte: TLabel;
      lblTipoTitulo: TLabel;
      lblTurma: TLabel;
      lblVencimento: TLabel;
      lblVenctoAte: TLabel;
      meAnoSemestre: TMaskEdit;
      pnlDados: TPanel;
      prbProgresso: TProgressBar;
      qryAcoes: TUMZReadOnlyQuery;
      qryAcoesCD_ACAO: TIntegerField;
      qryAcoesDS_ACAO: TStringField;
      qryAcoesDS_CHAVE: TStringField;
      qryTiposTitulo: TUMZReadOnlyQuery;
      qryTiposTituloCD_TIPO_TITULO: TIntegerField;
      qryTiposTituloDS_TIPO_TITULO: TStringField;
      sbAluno: TSpeedButton;
      sbCurso: TSpeedButton;
      sbDesmarcarTudo: TSpeedButton;
      sbMarcarTudo: TSpeedButton;
      sbTurma: TSpeedButton;
      speParcelaAte: TSpinEdit;
      speParcelaDe: TSpinEdit;
      stbStatus: TStatusBar;
      ubAnoSemestre: TUpDown;
      procedure bbtnLimparClick(Sender: TObject);
      procedure chkParcelasClick(Sender: TObject);
      procedure dsAcoesDataChange(Sender: TObject; Field: TField);
      procedure dtpEmissaoAteChange(Sender: TObject);
      procedure dtpEmissaoDeChange(Sender: TObject);
      procedure dtpVenctoAteChange(Sender: TObject);
      procedure dtpVenctoDeChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure sbAlunoClick(Sender: TObject);
      procedure sbCursoClick(Sender: TObject);
      procedure sbDesmarcarTudoClick(Sender: TObject);
      procedure sbMarcarTudoClick(Sender: TObject);
      procedure sbTurmaClick(Sender: TObject);
      procedure ubAnoSemestreClick(Sender: TObject; Button: TUDBtnType);

   public
      cdLayout: Integer;
      
   private
      FFiltroCurso: TResultadoFiltroCurso;
      FFiltroTurma: TResultadoFiltroTurma;
      FFiltroPessoa: TResultadoFiltroPessoa;
      FFiltroCursoPtr: TResultadoFiltroCursoPtr;
      FFiltroTurmaPtr: TResultadoFiltroTurmaPtr;
      FFiltroPessoaPtr: TResultadoFiltroPessoaPtr;
      function FetchMensalidades: IZResultSet;
      function GeraRemessa: Boolean;
      function GetAnoSemestre: Integer;
      procedure CleanFilters;
      procedure CreateStatus(const NossoNumero: AnsiString);
      procedure IgnoreEnviosPendentes(const NossoNumero: AnsiString);
      procedure InitProgressBar(const Size: Integer);
      procedure InsertEnvios(const NossoNumero: AnsiString; const cdBoleto: Integer);
      procedure InsertEnviosMensalidade(const NossoNumero: AnsiString);
      procedure LoadTiposTitulo;
      procedure ShowStatusMessage(const Msg: AnsiString);
      function InsertBoleto(const NossoNumero: AnsiString; const RespID,
         PessoaID, ContaID, ColigadaID: Integer; const Vencimento: TDate;
         const Valor, Desconto: Double): Integer;
      procedure UpdateButtonStatus;
      procedure UpdateStatus(const NossoNumero: AnsiString);
   end;

const
   IntToStrFmt = '%d';

var
   frmRemessaIncluir: TfrmRemessaIncluir;

implementation

{$R *.dfm}

uses
   uDM, Main;

procedure TfrmRemessaIncluir.bbtnLimparClick(Sender: TObject);
begin
   CleanFilters;
end;

procedure TfrmRemessaIncluir.chkParcelasClick(Sender: TObject);
begin
   speParcelaDe.Enabled := chkParcelas.Checked;
   speParcelaAte.Enabled := chkParcelas.Checked;
end;

procedure TfrmRemessaIncluir.CleanFilters;
var
   FirstDay, LastDay, Today: TDate;
   Year, Month, Day: Word;
   I: Integer;
begin
   bbtnSalvar.Enabled := False;

   FFiltroCursoPtr := nil;
   FFiltroTurmaPtr := nil;
   FFiltroPessoaPtr := nil;

   chkAnoSemestre.Checked := DM.UsaAnosemestre;
   chkAnoSemestre.Enabled := DM.UsaAnosemestre;
   meAnoSemestre.Enabled := DM.UsaAnosemestre;
   meAnoSemestre.Text := Format(IntToStrFmt, [DM.GetAnoSemestreAtual]);

   Today := Date;
   DecodeDate(Today, Year, Month, Day);
   FirstDay := EncodeDate(Year, Month, 1);
   LastDay := EncodeDate(Year, Month, DaysInAMonth(Year, Month));

   dtpVenctoDe.Date := FirstDay;
   dtpVenctoDe.Checked := False;
   dtpVenctoAte.Date := LastDay;
   dtpVenctoAte.Checked := False;
   dtpEmissaoDe.Date := FirstDay;
   dtpEmissaoDe.Checked := False;
   dtpEmissaoAte.Date := LastDay;
   dtpEmissaoAte.Checked := False;

   edtCurso.Clear;
   edtTurma.Clear;
   edtAluno.Clear;
   chkParcelas.Checked := False;
   speParcelaDe.Value := 0;
   speParcelaAte.Value := 0;

   sbDesmarcarTudo.Click;
   dblcAcoes.KeyValue := Null;
   chkReservas.Checked := False;
end;

procedure TfrmRemessaIncluir.CreateStatus(const NossoNumero: AnsiString);
const
   SQLInsert = ''
      + ' INSERT INTO rem_status (cd_layout, nr_nossonumero, ds_situacao) VALUES (?,?,"F") '
      + '   ON DUPLICATE KEY UPDATE cd_layout = ?';
var
   Stmt: IZPreparedStatement;
begin
    Stmt := PrepareStatement(SQLInsert);
    try
       Stmt.SetInt(1, cdLayout);
       Stmt.SetString(2, NossoNumero);
       Stmt.SetInt(3, cdLayout);
       try
          Stmt.ExecutePrepared;
       except
          on E: EZSQLException do raise;
       end;
    finally
       Stmt.Close;
       Stmt := nil;
    end;
end;

procedure TfrmRemessaIncluir.dsAcoesDataChange(Sender: TObject; Field: TField);
begin
   UpdateButtonStatus;
end;

procedure TfrmRemessaIncluir.dtpEmissaoAteChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

procedure TfrmRemessaIncluir.dtpEmissaoDeChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

procedure TfrmRemessaIncluir.dtpVenctoAteChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

procedure TfrmRemessaIncluir.dtpVenctoDeChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

function TfrmRemessaIncluir.FetchMensalidades: IZResultSet;
const
   SQLSelectMensalidades = ''
      + ' SELECT '
      + ' 	M.CD_RESP, '
      + ' 	M.CODIGOALUNO, '
      + ' 	M.NOSSONUMERO, '
      + ' 	M.DATAVENCIMENTO, '
      + ' 	M.CD_COLIGADA, '
      + ' 	M.CD_CAIXA, '
      + ' 	ROUND( '
      + ' 		SUM( '
      + ' 			GET_ACRESCIMOS(M.CD_MENSALIDADE, ''1999-08-13'') + '
      + ' 			COALESCE(M.VALORBRUTO, 0) + '
      + ' 			COALESCE(M.VALOREXTRA, 0) + '
      + ' 			COALESCE(M.VALORJUROS, 0) - '
      + ' 			COALESCE(M.DESCONTOEXTRA, 0) - '
      + ' 			CASE '
      + ' 				WHEN COALESCE(M.SN_LIBERAR_DESCONTOS, 0) = 1 THEN GET_DESCONTOS(M.CD_MENSALIDADE, ''1999-08-13'') '
      + ' 				ELSE 0 '
      + ' 			END '
      + ' 		), '
      + ' 		2 '
      + ' 	) VL_NOMINAL, '
      + ' 	ROUND( '
      + ' 		SUM( '
      + ' 			CASE '
      + ' 				WHEN COALESCE(M.SN_LIBERAR_DESCONTOS, 0) = 0 THEN GET_DESCONTOS(M.CD_MENSALIDADE, ''1999-08-13'') '
      + ' 				ELSE 0 '
      + ' 			END '
      + ' 		), '
      + ' 		2 '
      + ' 	) VL_DESCONTO '
      + ' FROM '
      + ' 	MENSALIDADES M '
      + ' WHERE '
      + ' 	%s AND '
      + ' 	EXISTS ( '
      + ' 		SELECT '
      + ' 			P.CD_PESSOA '
      + ' 		FROM '
      + ' 			PESSOAS_DEBITO_AUTOMATICO P '
      + ' 		WHERE '
      + '       P.SN_AUTORIZA_DEBITO = 1 AND '
      + ' 			M.CODIGOALUNO = P.CD_PESSOA '
      + ' 	) AND '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT '
      + ' 			S.NR_NOSSONUMERO '
      + ' 		FROM '
      + ' 			REM_STATUS S '
      + ' 		WHERE '
      + ' 			M.NOSSONUMERO = S.NR_NOSSONUMERO AND '
      + ' 			S.DS_SITUACAO IN (''R'', ''E'', ''B'', ''S'') '
      + ' 	) AND '
      + ' 	EXISTS ( '
      + ' 		SELECT '
      + ' 			P.CD_PESSOA '
      + ' 		FROM '
      + ' 			PESSOAS P, '
      + ' 			REM_LAYOUTS L '
      + ' 				JOIN REM_OCORRENCIAS O ON '
      + ' 					(L.CD_LAYOUT = O.CD_LAYOUT) '
      + ' 				JOIN REM_ACOES A ON '
      + ' 					(O.CD_ACAO = A.CD_ACAO) '
      + ' 		WHERE '
      + '       O.SN_ATIVO = 1 AND'
      + ' 			L.CD_CAIXA IS NULL AND '
      + ' 			M.CD_RESP = P.CD_PESSOA AND '
      + ' 			A.DS_CHAVE = ? AND '
      + ' 			(L.SN_FIES = 2 OR L.SN_FIES = P.SN_NAO_BLOQUEAR_FINANCEIRO) '
      + ' 	) '
      + ' GROUP BY '
      + ' 	M.NOSSONUMERO, '
      + ' 	M.DATAVENCIMENTO, '
      + ' 	M.CD_RESP, '
      + ' 	M.CODIGOALUNO, '
      + ' 	M.CD_CAIXA ';
   SQLFiltroColigada = 'M.CD_COLIGADA IN (%s)';
   SQLFiltroAnoSemestre = 'M.ANOSEMESTRE = ?';
   SQLFiltroCurso = 'M.CURSO = ?';
   SQLFiltroTurma = 'M.TURMA = ?';
   SQLFiltroAluno = 'M.CODIGOALUNO = ?';
   SQLFiltroVenctoDe = 'M.DATAVENCIMENTO >= ?';
   SQLFiltroVenctoAte = 'M.DATAVENCIMENTO <= ?';
   SQLFiltroEmissaoDe = 'M.DATAEMISSAO >= ?';
   SQLFiltroEmissaoAte = 'M.DATAEMISSAO <= ?';
   SQLFiltroParcelas = 'M.PARCELA BETWEEN ? AND ?';
   SQLFiltroTipoTitulo = 'M.CD_TIPO_TITULO IN (%s)';
   SQLFiltroSituacoes = 'M.SITUACAO IN (%s)';
var
   S: AnsiString;
   Filters: TStrings;
   Stmt: IZPreparedStatement;
   Params: Variant;

   procedure AddParam(const Value: Variant);
   var
      I: Integer;
   begin
      I := 0;

      if not VarIsNull(Params) then
      begin
         I := VarArrayHighBound(Params, 1);
         Inc(I);
         VarArrayRedim(Params, I);
      end;

      if VarIsNull(Params) then
      begin
         Params := VarArrayCreate([0, 0], varVariant);
         I := 0;
      end;

      Params[I] := Value;
   end;

   procedure AssignParams;
   var
      I, L: Integer;
      Values: TZVariantDynArray;
   begin
      Values := DecodeVariantArray(Params);
      L := Length(Values);

      // bug fix
      
      for I := 0 to L - 1 do
      begin
         if Values[I].VType = vtUnicodeString then
         begin
            Values[I].VType := vtString;
            Values[I].VString := Values[I].VUnicodeString;
         end;
      end;

      for I := 0 to L - 1 do
      begin
         Stmt.SetValue(I + 1, Values[I]);
      end;         
   end;

   function GetFilters: AnsiString;
   const
      SQLAND = ' AND ';
      ConcatFmt = '%s%s';
   var
      I: Integer;
   begin
      Result := '';

      for I := 0 to Filters.Count - 1 do
      begin
         if Result <> '' then
            Result := Format(ConcatFmt, [Result, SQLAND]);
            
         Result := Format(ConcatFmt, [Result, Filters[I]]);
      end;
   end;

   function GetListaTiposTitulo: AnsiString;
   var
      I: Integer;
      S: AnsiString;
      Items: TStrings;
      Bookmark: TBookmark;
   begin
      Result := '';

      Items := TStringList.Create;
      try
         Items.Delimiter := ',';

         for I := 0 to clbTiposTitulo.Count - 1 do
         begin
            if clbTiposTitulo.Checked[I] then
            begin
               Bookmark := TBookmark(clbTiposTitulo.Items.Objects[I]);
               qryTiposTitulo.GotoBookmark(Bookmark);
               Items.Add(qryTiposTituloCD_TIPO_TITULO.AsString);
            end;
         end;

         Result := Items.DelimitedText;
      finally
         Items.Free;
         Items := nil;
      end;
   end;
   
begin
   Filters := TStringList.Create;
   try
      Params := Null;

      S := Format(SQLFiltroColigada, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
      Filters.Add(S);

      S := GetListaTiposTitulo;
      if S <> '' then
      begin
         S := Format(SQLFiltroTipoTitulo, [S]);
         Filters.Add(S);
      end;

      S := Format(SQLFiltroSituacoes, ['2']);
      if chkReservas.Checked then S := Format(SQLFiltroSituacoes, ['2, 10']);
      Filters.Add(S);

      if chkAnoSemestre.Checked then
      begin
         Filters.Add(SQLFiltroAnoSemestre);
         AddParam(meAnoSemestre.Text);
      end;
      
      if edtCurso.Text <> '' then
      begin
         Filters.Add(SQLFiltroCurso);
         AddParam(FFiltroCurso.cd_curso);
      end;

      if edtTurma.Text <> '' then
      begin
         Filters.Add(SQLFiltroTurma);
         AddParam(FFiltroTurma.cd_turma);
      end;

      if edtAluno.Text <> '' then
      begin
         Filters.Add(SQLFiltroAluno);
         AddParam(FFiltroPessoa.cd_pessoa);
      end;

      if dtpVenctoDe.Checked then
      begin
         Filters.Add(SQLFiltroVenctoDe);
         AddParam(dtpVenctoDe.DateTime);
      end;

      if dtpVenctoAte.Checked then
      begin
         Filters.Add(SQLFiltroVenctoAte);
         AddParam(dtpVenctoAte.DateTime);
      end;

      if dtpEmissaoDe.Checked then
      begin
         Filters.Add(SQLFiltroEmissaoDe);
         AddParam(dtpEmissaoDe.DateTime);
      end;

      if dtpEmissaoAte.Checked then
      begin
         Filters.Add(SQLFiltroEmissaoAte);
         AddParam(dtpEmissaoAte.DateTime);
      end;

      if chkParcelas.Checked then
      begin
         Filters.Add(SQLFiltroParcelas);
         AddParam(speParcelaDe.Value);
         AddParam(speParcelaAte.Value);
      end;

      AddParam(qryAcoesDS_CHAVE.AsString);

      S := Format(SQLSelectMensalidades, [GetFilters]);
      Stmt := PrepareStatement(S);
      try
         AssignParams;
         try
            Result := Stmt.ExecuteQueryPrepared;
         except
            on E: EZSQLException do raise;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;

   finally
      Filters.Free;
      Filters := nil;
   end;
end;

procedure TfrmRemessaIncluir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   clbTiposTitulo.Items.Clear;
   qryAcoes.Close;
   qryTiposTitulo.Close;
   frmRemessaIncluir := nil;
   Action := caFree;
end;

procedure TfrmRemessaIncluir.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOk then
   begin
      CanClose := GeraRemessa;
   end;
end;

procedure TfrmRemessaIncluir.FormCreate(Sender: TObject);
begin
   CleanFilters;

   qryAcoes.Close;
   qryAcoes.Open;

   LoadTiposTitulo;
end;

function TfrmRemessaIncluir.GeraRemessa: Boolean;
const
   QuestionFmt = 'Tem certeza que deseja efetuar o lançamento da operação "%s" para %d título(s) selecionado(s)?';
   QuestionCaption = 'Confirmação';
   InfoSemRegistros = 'Não foram encontrados registros correspondentes com os filtros aplicados.';
   InfoCaption = 'Informação';
   SuccessMsg = 'O processo de lançamento da remessa de DDA foi finalizado com sucesso.';
   ErrorMsgFmt = 'Ocorreu um erro durante o processo de lançamento do DDA na remessa: %s';
   ErrorCaption = 'Erro';
   StatusMsg = 'Selecionando mensalidades. Aguarde...';
var
   S, Question: AnsiString;
   Rs: IZResultSet;
   UserChoice, Count,
   cdBoleto: Integer;
begin
   Result := False;
   
   try
      ShowStatusMessage(StatusMsg);
      Rs := FetchMensalidades;
      ShowStatusMessage(EmptyStr);

      Rs.Last;
      Count := Rs.GetRow;

      if Count > 0 then
      begin
         Question := Format(QuestionFmt, [qryAcoesDS_ACAO.AsString, Count]);

         UserChoice := MessageBox(0, PChar(Question), QuestionCaption,
            MB_YESNO + MB_ICONQUESTION);

         if UserChoice = ID_YES then
         begin
            DM.db.StartTransaction;
            Rs.First;
            InitProgressBar(Count);

            repeat
               IgnoreEnviosPendentes(Rs.GetStringByName('NOSSONUMERO'));
               cdBoleto :=
                 InsertBoleto(
                    Rs.GetStringByName('NOSSONUMERO'),
                    Rs.GetIntByName('CD_RESP'),
                    Rs.GetIntByName('CODIGOALUNO'),
                    Rs.GetIntByName('CD_CAIXA'),
                    Rs.GetIntByName('CD_COLIGADA'),
                    Rs.GetDateByName('DATAVENCIMENTO'),
                    Rs.GetDoubleByName('VL_NOMINAL'),
                    Rs.GetDoubleByName('VL_DESCONTO'));
               CreateStatus(Rs.GetStringByName('NOSSONUMERO'));
               InsertEnvios(Rs.GetStringByName('NOSSONUMERO'), cdBoleto);
               InsertEnviosMensalidade(Rs.GetStringByName('NOSSONUMERO'));
               UpdateStatus(Rs.GetStringByName('NOSSONUMERO'));
               prbProgresso.StepIt;
            until not Rs.Next;

            DM.db.Commit;
            MessageBox(0, PChar(SuccessMsg), InfoCaption,
               MB_OK + MB_ICONINFORMATION);

            Result := True;

         end;
      end;

      if Count = 0 then
      begin
         Result := False;
         ShowStatusMessage(EmptyStr);
         MessageBox(0, PChar(InfoSemRegistros), InfoCaption,
            MB_OK + MB_ICONINFORMATION);
      end;

   except
      on E: EZSQLException do
      begin
         ShowStatusMessage(EmptyStr);
         DM.db.Rollback;
         S := Format(ErrorMsgFmt, [E.Message]);
         MessageBox(Handle, PChar(S), ErrorCaption, MB_ICONERROR);
      end;
   end;
end;

function TfrmRemessaIncluir.GetAnoSemestre: Integer;
begin
   Result := DM.GetAnoSemestreAtual;

   if chkAnoSemestre.Checked then
      Result := StrToIntDef(meAnoSemestre.Text, Result);
end;

procedure TfrmRemessaIncluir.IgnoreEnviosPendentes(
  const NossoNumero: AnsiString);
const
   SQLUpdate = ''
      + ' UPDATE REM_ENVIOS E '
      + ' SET '
      + '   E.SN_IGNORADO = 1, '
      + ' 	E.DT_IGNORADO = CURRENT_TIMESTAMP '
      + ' WHERE '
      + ' 	E.SN_IGNORADO = 0 AND '
      + ' 	E.NR_NOSSONUMERO = ? AND '
      + ' 	EXISTS ( '
      + ' 		SELECT '
      + ' 			S.NR_NOSSONUMERO '
      + ' 		FROM '
      + ' 			REM_STATUS S '
      + ' 		WHERE '
      + ' 			E.NR_NOSSONUMERO = S.NR_NOSSONUMERO AND '
      + ' 			S.DS_SITUACAO IN (''F'', ''J'') '
      + ' 	) ';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SQLUpdate);
   try
      Stmt.SetString(1, NossoNumero);
      try
         Stmt.ExecutePrepared;
      except
         on E: EZSQLException do raise;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmRemessaIncluir.InitProgressBar(const Size: Integer);
var
   ProgressBarStyle: Integer;
begin
   prbProgresso.Parent := stbStatus;
   prbProgresso.Align := alClient;
   prbProgresso.Max := Size;
   prbProgresso.Min := 0;
   prbProgresso.Position := 0;

   ProgressBarStyle :=
      GetWindowLong(prbProgresso.Handle, GWL_EXSTYLE) - WS_EX_STATICEDGE;

   SetWindowLong(prbProgresso.Handle, GWL_EXSTYLE, ProgressBarStyle);
   prbProgresso.Visible := True;
   Application.ProcessMessages;
end;

procedure TfrmRemessaIncluir.InsertEnvios(const NossoNumero: AnsiString; const cdBoleto: Integer);
const
   SQLInsert = ''
      + ' INSERT INTO REM_ENVIOS ( '
      + ' 	CD_LAYOUT, '
      + ' 	NR_NOSSONUMERO, '
      + ' 	NR_SEQUENCIA, '
      + ' 	CD_RESP, '
      + ' 	DT_VENCIMENTO, '
      + ' 	VL_NOMINAL, '
      + ' 	VL_DESCONTO, '
      + ' 	CD_OCORRENCIA, '
      + ' 	CD_BOLETO, '
      + ' 	DT_INCLUSAO '
      + ' ) '
      + ' SELECT DISTINCT '
      + ' 	L.CD_LAYOUT, '
      + ' 	B.NR_NOSSONUMERO, '
      + ' 	?, '
      + ' 	B.CD_RESP_FINAN, '
      + ' 	B.DT_VENCIMENTO, '
      + ' 	B.VL_BOLETO, '
      + ' 	B.VL_DESCONTO, '
      + ' 	O.CD_OCORRENCIA, '
      + ' 	B.CD_BOLETO, '
      + ' 	CURRENT_TIMESTAMP '
      + ' FROM '
      + ' 	FIN_BOLETO B '
      + '   INNER JOIN REM_STATUS RS ON (RS.NR_NOSSONUMERO = B.NR_NOSSONUMERO) '
      + ' 	INNER JOIN REM_LAYOUTS L ON (RS.CD_LAYOUT = L.CD_LAYOUT) '
      + ' 	INNER JOIN REM_OCORRENCIAS O ON (L.CD_LAYOUT = O.CD_LAYOUT) '
      + ' 	INNER JOIN REM_ACOES A ON (O.CD_ACAO = A.CD_ACAO) '
      + ' WHERE '
      + '   O.SN_ATIVO = 1 AND '
      + '   B.CD_BOLETO = ? AND '
      + ' 	RS.NR_NOSSONUMERO = ? AND '
      + ' 	A.DS_CHAVE = ? ';

   function GetNextSequencia: Integer;
   const
      SQLSelect = ''
         + ' SELECT '
         + ' 	COALESCE(MAX(NR_SEQUENCIA), 0) + 1 '
         + ' FROM '
         + ' 	REM_ENVIOS '
         + ' WHERE '
         + ' 	NR_NOSSONUMERO = ? ';
   var
      Stmt: IZPreparedStatement;
      Rs: IZResultSet;
   begin
      Result := 1;
      
      Stmt := PrepareStatement(SQLSelect);
      try
         Stmt.SetString(1, NossoNumero);
         try
            Rs := Stmt.ExecuteQueryPrepared;
            try
               if Rs.Next then
                  Result := Rs.GetInt(1);
            finally
               Rs.Close;
               Rs := nil;
            end;
         except
            on E: EZSQLException do raise;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;

var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Stmt := PrepareStatement(SQLInsert);
   try
      Stmt.SetInt(1, GetNextSequencia);
      Stmt.SetInt(2, cdBoleto);
      Stmt.SetString(3, NossoNumero);
      Stmt.SetString(4, qryAcoesDS_CHAVE.AsString);
      try
         Stmt.ExecutePrepared;
      except
         on E: EZSQLException do raise;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmRemessaIncluir.InsertEnviosMensalidade(
  const NossoNumero: AnsiString);
const
   SQLInsert = ''
      + ' INSERT IGNORE INTO REM_ENVIOS_MENSALIDADES ( '
      + '       CD_ENVIO, '
      + '       CD_MENSALIDADE '
      + ' ) '
      + ' SELECT DISTINCT '
      + '       E.CD_ENVIO, '
      + '       M.CD_MENSALIDADE '
      + ' FROM '
      + '       REM_ENVIOS E '
      + '             JOIN MENSALIDADES M ON '
      + '                   (E.NR_NOSSONUMERO = M.NOSSONUMERO) '
      + ' WHERE '
      + '       E.NR_NOSSONUMERO = ? AND '
      + '       E.SN_IGNORADO = 0 ';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SQLInsert);
   try
      Stmt.SetString(1, NossoNumero);
      try
         Stmt.ExecutePrepared;
      except
         on E: EZSQLException do raise;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmRemessaIncluir.LoadTiposTitulo;
begin
   qryTiposTitulo.Close;
   qryTiposTitulo.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qryTiposTitulo.Open;

   clbTiposTitulo.Items.BeginUpdate;
   clbTiposTitulo.Items.Clear;

   while not qryTiposTitulo.Eof do
   begin
      clbTiposTitulo.AddItem(
         qryTiposTituloDS_TIPO_TITULO.AsString,
         qryTiposTitulo.GetBookmark);
      qryTiposTitulo.Next;
   end;

   clbTiposTitulo.Items.EndUpdate;
end;

procedure TfrmRemessaIncluir.sbAlunoClick(Sender: TObject);
begin
   FFiltroPessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante, GetAnoSemestre);

   if FFiltroPessoa.filtrado then
   begin

      if FFiltroTurmaPtr = nil then
      begin
         FFiltroTurmaPtr := @FFiltroTurma;         
      end;

      FFiltroTurma.cd_turma := FFiltroPessoa.cd_turma;
      FFiltroTurma.cd_curso := FFiltroPessoa.cd_curso;
      FFiltroTurma.nr_anosemestre := FFiltroPessoa.nr_anosemestre;

      FFiltroPessoaPtr := @FFiltroPessoa;
      edtCurso.Clear;
      edtTurma.Text := FFiltroPessoa.cd_turma;
      edtAluno.Text := FFiltroPessoa.nm_pessoa;
      meAnoSemestre.Text := Format(IntToStrFmt, [FFiltroPessoa.nr_anosemestre]);
      UpdateButtonStatus;
   end;
end;

procedure TfrmRemessaIncluir.sbCursoClick(Sender: TObject);
begin
   FFiltroCurso := TfrmSelecionarCurso.Filtrar([]);

   if FFiltroCurso.filtrado then
   begin
      FFiltroCursoPtr := @FFiltroCurso;
      edtCurso.Text := FFiltroCurso.ds_curso;
      meAnoSemestre.Text := Format(IntToStrFmt, [FFiltroCurso.nr_anosemestre]);
   end;
end;

procedure TfrmRemessaIncluir.sbDesmarcarTudoClick(Sender: TObject);
var
   I: Integer;
begin
   clbTiposTitulo.Items.BeginUpdate;

   for I := 0 to clbTiposTitulo.Count - 1 do
   begin
      clbTiposTitulo.Checked[I] := False;
   end;

   clbTiposTitulo.Items.EndUpdate;
end;

procedure TfrmRemessaIncluir.sbMarcarTudoClick(Sender: TObject);
var
   I: Integer;
begin
   clbTiposTitulo.Items.BeginUpdate;

   for I := 0 to clbTiposTitulo.Count - 1 do
   begin
      clbTiposTitulo.Checked[I] := True;
   end;

   clbTiposTitulo.Items.EndUpdate;
end;

procedure TfrmRemessaIncluir.sbTurmaClick(Sender: TObject);
begin
   if FFiltroCursoPtr <> nil then
      FFiltroTurma := TfrmSelecionarTurma.Filtrar([],
         FFiltroCurso.nr_anosemestre,
         FFiltroCurso.cd_coligada,
         FFiltroCurso.cd_departamento,
         FFiltroCurso.cd_curso);

   if FFiltroCursoPtr = nil then
      FFiltroTurma := TfrmSelecionarTurma.Filtrar([], GetAnoSemestre);

   if FFiltroTurma.filtrado then
   begin
      FFiltroTurmaPtr := @FFiltroTurma;

      if FFiltroCursoPtr = nil then
      begin
         FFiltroCursoPtr := @FFiltroCurso;
      end;

      FFiltroCurso.cd_coligada := FFiltroTurma.cd_coligada;
      FFiltroCurso.cd_curso := FFiltroTurma.cd_curso;
      FFiltroCurso.cd_departamento := FFiltroTurma.cd_departamento;
      FFiltroCurso.ds_curso := FFiltroTurma.ds_curso;
      FFiltroCurso.nr_anosemestre := FFiltroTurma.nr_anosemestre;

      edtCurso.Text := FFiltroTurma.ds_curso;
      edtTurma.Text := FFiltroTurma.cd_turma;
      meAnoSemestre.Text := Format(IntToStrFmt, [FFiltroTurma.nr_anosemestre]);

      UpdateButtonStatus;
   end;
end;

procedure TfrmRemessaIncluir.ShowStatusMessage(const Msg: AnsiString);
begin
   stbStatus.SimpleText := Msg;
   Application.ProcessMessages;
end;

procedure TfrmRemessaIncluir.ubAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);

   function IncAnoSemestre(const S: AnsiString): AnsiString;
   var
      I, Rest: Integer;
   begin
      I := StrToIntDef(S, DM.GetAnoSemestreAtual);
      Rest := I mod 2;

      if Main.ano_semestre_incremento = 1 then
      begin

         if Rest = 0 then
            Inc(I, 9);

         if Rest <> 0 then
            Inc(I);

      end;

      if Main.ano_semestre_incremento <> 1 then
         Inc(I, 10);

      Result := Format(IntToStrFmt, [I]);
   end;

   function DecAnoSemestre(const S: AnsiString): AnsiString;
   var
      I, Rest: Integer;
   begin
      I := StrToIntDef(S, DM.GetAnoSemestreAtual);
      Rest := I mod 2;

      if Main.ano_semestre_incremento = 1 then
      begin

         if Rest = 0 then
            Dec(I);

         if Rest <> 0 then
            Dec(I, 9);

      end;

      if Main.ano_semestre_incremento <> 1 then
         Dec(I, 10);

      Result := Format(IntToStrFmt, [I]);
   end;

begin
   if Button = btNext then
   begin
      meAnoSemestre.Text := IncAnoSemestre(meAnoSemestre.Text);
   end;

   if Button = btPrev then
   begin
      meAnoSemestre.Text := DecAnoSemestre(meAnoSemestre.Text);
   end;
end;

function TfrmRemessaIncluir.InsertBoleto(const NossoNumero: AnsiString;
  const RespID, PessoaID, ContaID, ColigadaID: Integer; const Vencimento: TDate;
  const Valor, Desconto: Double): Integer;
const
   SQLInsert = ''
      + ' INSERT INTO FIN_BOLETO( '
      + ' 	CD_RESP_FINAN, '
      + ' 	CD_PESSOA, '
      + ' 	NR_NOSSONUMERO, '
      + ' 	DT_VENCIMENTO, '
      + ' 	VL_BOLETO, '
      + ' 	VL_DESCONTO, '
      + ' 	CD_CONTA, '
      + ' 	CD_COLIGADA '
      + ' ) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
    Result := -1;

    Stmt := PrepareStatement(SQLInsert);
    try
       Stmt.SetInt(1, RespID);
       Stmt.SetInt(2, PessoaID);
       Stmt.SetString(3, NossoNumero);
       Stmt.SetDate(4, Vencimento);
       Stmt.SetDouble(5, Valor);
       Stmt.SetDouble(6, Desconto);
       Stmt.SetInt(7, ContaID);
       Stmt.SetInt(8, ColigadaID);
       try
          Stmt.ExecutePrepared;
          Result := DM.LastInsert;
       except
          on E: EZSQLException do raise;
       end;
    finally
       Stmt.Close;
       Stmt := nil;
    end;
end;

procedure TfrmRemessaIncluir.UpdateButtonStatus;
begin
   bbtnSalvar.Enabled :=
      (not VarIsNull(dblcAcoes.KeyValue)) and
      (
         (FFiltroTurmaPtr <> nil) or
         (FFiltroPessoaPtr <> nil) or
         dtpVenctoDe.Checked or
         dtpVenctoAte.Checked or
         dtpEmissaoDe.Checked or
         dtpEmissaoAte.Checked
      );
end;

procedure TfrmRemessaIncluir.UpdateStatus(const NossoNumero: AnsiString);
const
   SQLUpdate = ''
      + ' UPDATE REM_STATUS S '
      + ' SET '
      + '       S.CD_ENVIO_REGISTRO = ( '
      + '             SELECT  '
      + '                   MIN(E.CD_ENVIO)  '
      + '             FROM  '
      + '                   REM_ENVIOS E  '
      + '             WHERE  '
      + '                   E.SN_IGNORADO = 0 AND  '
      + '                   E.NR_NOSSONUMERO = ? '
      + '       ), '
      + '       S.CD_ENVIO_ATUAL = ( '
      + '             SELECT  '
      + '                   MAX(E.CD_ENVIO)  '
      + '             FROM  '
      + '                   REM_ENVIOS E  '
      + '             WHERE  '
      + '                   E.SN_IGNORADO = 0 AND  '
      + '                   E.NR_NOSSONUMERO = ? '
      + '       ) '
      + ' WHERE '
      + '       S.NR_NOSSONUMERO = ? ';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SQLUpdate);
   try
      Stmt.SetString(1, NossoNumero);
      Stmt.SetString(2, NossoNumero);
      Stmt.SetString(3, NossoNumero);
      try
         Stmt.ExecutePrepared;
      except
         on E: EZSQLException do raise;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

end.
