unit UFFinDebitos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, UZDataset, Grids, DBGrids,
  UZSortedGrid, StdCtrls, Buttons, ZDbcIntfs, UZDbcFuncs;

type
  TfrmFinDebitos = class(TForm)
    pnlDados: TPanel;
    qryMensalidades: TUMZReadOnlyQuery;
    dsMensalidades: TDataSource;
    dbgMensalidades: TZSortedGrid;
    bbtnObservacoes: TBitBtn;
    bbtnFechar: TBitBtn;
    qryMensalidadesVL_TOTAL: TFloatField;
    qryMensalidadesDT_VENCTO: TDateTimeField;
    qryMensalidadesNR_PARCELA: TSmallintField;
    qryMensalidadesDS_TIPO_TITULO: TStringField;
    qryMensalidadesNM_ALUNO: TStringField;
    qryMensalidadesNM_RESPONSAVEL: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbtnObservacoesClick(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
  private
      FAlunoID: Cardinal;
      FFiltro: AnsiString;
      FFiltroPendencia: AnsiString;
      FFiltroPessoa: AnsiString;
      procedure Load(const AlunoID, ColigadaID: Cardinal);
      class var FInstance: TfrmFinDebitos;
      class function GetInstance: TfrmFinDebitos; static;
      class property Instance: TfrmFinDebitos read GetInstance;
  public
    { Public declarations }
      class function HasDebitos(const AlunoID, ColigadaID: Cardinal): Boolean;
      class procedure ShowDebitos(const AlunoID, ColigadaID: Cardinal);
  end;

implementation

{$R *.dfm}

uses
   uDM, UFObservacoes;

{ TfrmFinDebitos }

procedure TfrmFinDebitos.bbtnFecharClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmFinDebitos.bbtnObservacoesClick(Sender: TObject);
begin
   TfObservacoes.ShowObservations(Self, FAlunoID, okFinancial);
end;

procedure TfrmFinDebitos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      bbtnFechar.Click;
end;

class function TfrmFinDebitos.GetInstance: TfrmFinDebitos;
begin
   if not Assigned(TfrmFinDebitos.FInstance) then
      TfrmFinDebitos.FInstance := TfrmFinDebitos.Create(Application);
   
   Result := TfrmFinDebitos.FInstance;
end;

class function TfrmFinDebitos.HasDebitos(const AlunoID,
  ColigadaID: Cardinal): Boolean;
begin
   TfrmFinDebitos.Instance.Load(AlunoID, ColigadaID);
   Result := not TfrmFinDebitos.Instance.qryMensalidades.IsEmpty;
end;

procedure TfrmFinDebitos.Load(const AlunoID, ColigadaID: Cardinal);
const
   SSQLSelectMens =
      'SELECT ' +
	      'M.VALORBRUTO ' +
		      '+ COALESCE(M.VALORJUROS, 0) ' +
		      '+ COALESCE(M.VALOREXTRA, 0) ' +
		      '- COALESCE(M.DESCONTOEXTRA, 0) ' +
		      '- GET_DESCONTOS(M.CD_MENSALIDADE, CURRENT_DATE) ' +
		      '+ GET_ACRESCIMOS(M.CD_MENSALIDADE, CURRENT_DATE) VL_TOTAL,' +
	      'M.DATAVENCIMENTO DT_VENCTO,' +
	      'M.PARCELA NR_PARCELA,' +
         '(SELECT T.DS_TIPO_TITULO FROM FIN_CONFIG_TIPOS_TITULO T JOIN COLIGADAS C ON (T.CD_COLIGADA_MATRIZ = C.CD_COLIGADA_MATRIZ) WHERE T.CD_TIPO_TITULO = M.CD_TIPO_TITULO AND C.CD_COLIGADA = M.CD_COLIGADA LIMIT 1) DS_TIPO_TITULO,' +
         '(SELECT A.NM_PESSOA FROM PESSOAS A WHERE A.CD_PESSOA = M.CODIGOALUNO LIMIT 1) NM_ALUNO,' +
         '(SELECT R.NM_PESSOA FROM PESSOAS R WHERE R.CD_PESSOA = M.CD_RESP LIMIT 1) NM_RESPONSAVEL ' +
      'FROM ' +
	      'MENSALIDADES M ' +
      'WHERE ' +
	      '%s';
   SSQLSelectRespFinan = 'SELECT CD_RESP_FINAN FROM PESSOAS WHERE CD_PESSOA = ?';
   SParamFiltroPendencia = 'matricula_avisa_financeiro_filtro';
   SParamFiltroResp = 'sn_avisa_financeiro_pendencia_alunos_resp';
   SParamAgruparObs = 'AGRUPAR_OBSERVACOES';
   SParamBotaoObs = 'botao_observacoes_nome';
   SFiltroPendenciaDefault = 'M.SITUACAO IN (2, 10) AND M.DATAVENCIMENTO < CURRENT_DATE';
   SFiltroPessoaPadraoFmt = 'M.CODIGOALUNO = %d';
   SFiltroRespFmt = '(M.CD_RESP = %d OR M.CODIGOALUNO = %d)';
   SFiltroFmt = '%s AND %s';
   SIntToStrFmt = '%d';
var
   S, ColigadaStr: AnsiString;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   bbtnObservacoes.Caption := '&Observações';
   FAlunoID := AlunoID;

   S := DM.variavel_parametro(SParamAgruparObs);
   S := Trim(S);

   if S = 'S' then
   begin
      S := DM.variavel_parametro(SParamBotaoObs);
      S := Trim(S);

      if S <> '' then
      begin
         bbtnObservacoes.Caption := S;
      end;
   end;

   ColigadaStr := Format(SIntToStrFmt, [ColigadaID]);

   S := DM.getParametroPorColigadaNaoLogada(SParamFiltroPendencia, ColigadaStr);
   S := Trim(S);

   if S = '' then
   begin
      S := DM.variavel_parametro(SParamFiltroPendencia);
      S := Trim(S);
   end;

   if S = '' then
      S := SFiltroPendenciaDefault;

   FFiltroPendencia := S;

   S := DM.getParametroPorColigadaNaoLogada(SParamFiltroResp, ColigadaStr);
   S := Trim(S);

   if S = '' then
   begin
      S := DM.variavel_parametro(SParamFiltroResp);
      S := Trim(S);
   end;

   FFiltroPessoa := Format(SFiltroPessoaPadraoFmt, [AlunoID]);

   if S = 'S' then
   begin
      Stmt := PrepareStatement(SSQLSelectRespFinan);
      try
         Stmt.SetInt(1, AlunoID);
         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
            begin
               if not Rs.IsNull(1) then
               begin
                  FFiltroPessoa := Format(SFiltroRespFmt, [Rs.GetInt(1), AlunoID]);
               end;
            end;
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;

   FFiltro := Format(SFiltroFmt, [
      TfrmFinDebitos.Instance.FFiltroPessoa,
      TfrmFinDebitos.Instance.FFiltroPendencia]);

   S := Format(SSQLSelectMens, [TfrmFinDebitos.Instance.FFiltro]);

   qryMensalidades.Close;
   qryMensalidades.SQL.Text := S;
   qryMensalidades.Open;
end;

class procedure TfrmFinDebitos.ShowDebitos(const AlunoID, ColigadaID: Cardinal);
begin
   TfrmFinDebitos.Instance.Load(AlunoID, ColigadaID);
   TfrmFinDebitos.Instance.ShowModal;
end;

end.
