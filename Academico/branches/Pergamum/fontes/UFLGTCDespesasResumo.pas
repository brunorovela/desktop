unit UFLGTCDespesasResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractDataset, UZDataset, DBClient, ZAbstractRODataset,
  ExtCtrls, StdCtrls, Grids, DBGrids, UZSortedGrid, Buttons, ZSqlUpdate,
  Provider, DateUtils, ZDbcIntfs, uLoginManager, UDBGrids;

type
   TfrmLGTCDespesasResumo = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnConfirmar: TBitBtn;
      bvlSep1: TBevel;
      lblOrientacao: TLabel;
      pnlDados: TPanel;
    qryAulas: TUMZReadOnlyQuery;
    qryAulasCD_DIARIO_AULA: TLargeintField;
    qryAulasDT_AULA: TDateTimeField;
    dspAulas: TDataSetProvider;
    cdsAulas: TClientDataSet;
    cdsAulasCD_DIARIO_AULA: TLargeintField;
    cdsAulasDT_AULA: TDateTimeField;
    cdsAulasSN_GERAR: TBooleanField;
    qryDespesas: TUMZQuery;
    qryDespesasCD_DESPESA: TLargeintField;
    qryDespesasCD_DIARIO_AULA: TLargeintField;
    qryDespesasCD_COLIGADA: TIntegerField;
    qryDespesasCD_CENTRO: TLargeintField;
    qryDespesasCD_FORNECEDOR: TIntegerField;
    qryDespesasCD_CONTA: TLargeintField;
    qryDespesasCD_COLIGADA_MATRIZ: TIntegerField;
    qryDespesasCD_TIPO_TITULO: TIntegerField;
    qryDespesasDS_OBSERVACAO: TStringField;
    qryDespesasVL_TOTAL: TFloatField;
    qryDespesasCD_TITULO: TLargeintField;
    qryDespesasCD_SITUACAO: TLargeintField;
    qryDespesasDS_CHAVE: TStringField;
    qryDespesasCD_TURMA: TStringField;
    qryDespesasCD_DISCIPLINA: TIntegerField;
    qryDespesasNR_ANOSEMESTRE: TSmallintField;
    qryDespesasCD_FORMA_PGTO: TLargeintField;
    dsAulas: TDataSource;
    qryContaPagar: TUMZQuery;
    qryContaPagarCD_TITULO: TLargeintField;
    qryContaPagarCD_TITULO_PRINCIPAL: TLargeintField;
    qryContaPagarCD_COLIGADA: TSmallintField;
    qryContaPagarCD_PESSOA: TIntegerField;
    qryContaPagarDS_DESPESA: TStringField;
    qryContaPagarNR_PARCELA: TIntegerField;
    qryContaPagarDT_LANCAMENTO: TDateTimeField;
    qryContaPagarDT_COMPETENCIA: TDateTimeField;
    qryContaPagarDT_VENCIMENTO: TDateTimeField;
    qryContaPagarDT_PROVAVEL_PGTO: TDateTimeField;
    qryContaPagarVL_DESPESA: TFloatField;
    qryContaPagarCD_SITUACAO: TSmallintField;
    qryContaPagarSN_PREVISAO: TStringField;
    qryContaPagarCD_TIPO_TITULO: TSmallintField;
    qryContaPagarTP_ENTRADA_SAIDA: TSmallintField;
    qryContaPagarCD_FORMA_PGTO: TIntegerField;
    qryContaPagarDS_OBSERVACAO: TMemoField;
    qryContaPagarVL_ABATIMENTO: TFloatField;
    qryContaPagarVL_DESCONTO: TFloatField;
    qryContaPagarVL_MORA: TFloatField;
    qryContaPagarVL_MULTA: TFloatField;
    qryContaPagarVL_PREVISTO_PGTO_INSS: TFloatField;
    qryContaPagarVL_OUTRAS_ENTIDADES: TFloatField;
    qryContaPagarVL_ATUALIZACAO_MOTENARIA: TFloatField;
    qryContaPagarVL_TOTAL_DESPESA: TFloatField;
    qryContaPagarCD_TURMA: TStringField;
    qryContaPagarCD_DISCIPLINA: TIntegerField;
    qryContaPagarNR_ANOSEMESTRE_DISCIPLINA: TSmallintField;
    dspContaPagar: TDataSetProvider;
    cdsContaPagar: TClientDataSet;
    cdsContaPagarCD_TITULO: TLargeintField;
    cdsContaPagarCD_TITULO_PRINCIPAL: TLargeintField;
    cdsContaPagarCD_COLIGADA: TSmallintField;
    cdsContaPagarCD_PESSOA: TIntegerField;
    cdsContaPagarDS_DESPESA: TStringField;
    cdsContaPagarNR_PARCELA: TIntegerField;
    cdsContaPagarDT_LANCAMENTO: TDateTimeField;
    cdsContaPagarDT_COMPETENCIA: TDateTimeField;
    cdsContaPagarDT_VENCIMENTO: TDateTimeField;
    cdsContaPagarDT_PROVAVEL_PGTO: TDateTimeField;
    cdsContaPagarVL_DESPESA: TFloatField;
    cdsContaPagarCD_SITUACAO: TSmallintField;
    cdsContaPagarSN_PREVISAO: TStringField;
    cdsContaPagarCD_TIPO_TITULO: TSmallintField;
    cdsContaPagarTP_ENTRADA_SAIDA: TSmallintField;
    cdsContaPagarCD_FORMA_PGTO: TIntegerField;
    cdsContaPagarDS_OBSERVACAO: TMemoField;
    cdsContaPagarVL_ABATIMENTO: TFloatField;
    cdsContaPagarVL_DESCONTO: TFloatField;
    cdsContaPagarVL_MORA: TFloatField;
    cdsContaPagarVL_MULTA: TFloatField;
    cdsContaPagarVL_PREVISTO_PGTO_INSS: TFloatField;
    cdsContaPagarVL_OUTRAS_ENTIDADES: TFloatField;
    cdsContaPagarVL_ATUALIZACAO_MOTENARIA: TFloatField;
    cdsContaPagarVL_TOTAL_DESPESA: TFloatField;
    cdsContaPagarCD_TURMA: TStringField;
    cdsContaPagarCD_DISCIPLINA: TIntegerField;
    cdsContaPagarNR_ANOSEMESTRE_DISCIPLINA: TSmallintField;
    cdsContaPagarCD_CENTRO: TLargeintField;
    cdsContaPagarCD_COLIGADA_MATRIZ: TSmallintField;
    cdsContaPagarCD_CONTA: TLargeintField;
    qryMovimentoCP: TUMZQuery;
    qryApropriacao: TUMZQuery;
    cdsCompromissos: TClientDataSet;
    cdsCompromissosCD_DIARIO_AULA: TLargeintField;
    cdsCompromissosCD_COLIGADA: TIntegerField;
    cdsCompromissosCD_CENTRO: TLargeintField;
    cdsCompromissosCD_FORNECEDOR: TIntegerField;
    cdsCompromissosCD_CONTA: TLargeintField;
    cdsCompromissosCD_COLIGADA_MATRIZ: TIntegerField;
    cdsCompromissosDS_OBSERVACAO: TStringField;
    cdsCompromissosVL_TOTAL: TFloatField;
    cdsCompromissosDS_CHAVE: TStringField;
    cdsCompromissosCD_TURMA: TStringField;
    cdsCompromissosCD_DISCIPLINA: TIntegerField;
    cdsCompromissosNR_ANOSEMESTRE: TSmallintField;
    cdsCompromissosCD_TIPO_TITULO: TIntegerField;
    cdsCompromissosCD_DESPESA: TLargeintField;
    cdsCompromissosCD_FORMA_PGTO: TLargeintField;
    updDespesas: TZUpdateSQL;
    dspDespesas: TDataSetProvider;
    cdsDespesas: TClientDataSet;
    cdsDespesasCD_DESPESA: TLargeintField;
    cdsDespesasCD_DIARIO_AULA: TLargeintField;
    cdsDespesasCD_COLIGADA: TIntegerField;
    cdsDespesasCD_CENTRO: TLargeintField;
    cdsDespesasCD_FORNECEDOR: TIntegerField;
    cdsDespesasCD_CONTA: TLargeintField;
    cdsDespesasCD_COLIGADA_MATRIZ: TIntegerField;
    cdsDespesasCD_TIPO_TITULO: TIntegerField;
    cdsDespesasDS_OBSERVACAO: TStringField;
    cdsDespesasVL_TOTAL: TFloatField;
    cdsDespesasCD_TITULO: TLargeintField;
    cdsDespesasCD_SITUACAO: TLargeintField;
    cdsDespesasDS_CHAVE: TStringField;
    cdsDespesasCD_TURMA: TStringField;
    cdsDespesasCD_DISCIPLINA: TIntegerField;
    cdsDespesasNR_ANOSEMESTRE: TSmallintField;
    cdsDespesasCD_FORMA_PGTO: TLargeintField;
    qryDespesasDS_TIPO_DESPESA: TStringField;
    qryDespesasNM_PESSOA: TStringField;
    cdsDespesasDS_TIPO_DESPESA: TStringField;
    cdsDespesasNM_PESSOA: TStringField;
    cdsDespesasSN_MOSTRAR: TBooleanField;
    dsDespesas: TDataSource;
    dbgDespesas: TSortedDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FAulaID: Cardinal;
      FSituacaoGeradoID: Cardinal; 
      FUsuarioID: Integer;
      function GetCodigoTitulo: Cardinal;
      procedure CriaApropriacoes;
      procedure CriaCompromissos;
      procedure CriaMovimentacoes;
      procedure GeraCompromissos;
      procedure Load;
      procedure LoadAulas;
      procedure LoadDespesas;
      procedure LoadSituacaoGerado;
      procedure LoadUsuario;
      procedure LogCompromissos;
      property AulaID: Cardinal read FAulaID write FAulaID;
      property SituacaoGeradoID: Cardinal read FSituacaoGeradoID write FSituacaoGeradoID;
      property UsuarioID: Integer read FUsuarioID write FUsuarioID;
   public
      class function ShowDespesas(const AAulaID: Cardinal): TModalResult;
   end;

var
   frmLGTCDespesasResumo: TfrmLGTCDespesasResumo;

implementation

{$R *.dfm}

uses
   uDM, UZDbcFuncs;

{ TfrmLGTCDespesasResumo }

procedure TfrmLGTCDespesasResumo.CriaApropriacoes;
const
   SChaveFmt = '%u;%d';
   SObsFmt = 'Gerou apropriação com o título "%u"';
var
   Chave, Obs: AnsiString;
begin
   cdsContaPagar.First;

   while not cdsContaPagar.Eof do
   begin
      qryApropriacao.ParamByName('CD_TITULO').AsInteger := cdsContaPagarCD_TITULO.AsLargeInt;
      qryApropriacao.ParamByName('CD_COLIGADA').AsInteger := cdsContaPagarCD_COLIGADA.AsInteger;
      qryApropriacao.ParamByName('CD_CONTA').AsInteger := cdsContaPagarCD_CONTA.AsLargeInt;
      qryApropriacao.ParamByName('CD_CENTRO').AsInteger := cdsContaPagarCD_CENTRO.AsLargeInt;
      qryApropriacao.ParamByName('VL_MOVIMENTO').AsCurrency := cdsContaPagarVL_DESPESA.AsCurrency;
      qryApropriacao.ExecSQL;

      Chave := Format(SChaveFmt, [
         cdsContaPagarCD_TITULO.AsLargeInt,
         cdsContaPagarCD_COLIGADA.AsInteger]);

      Obs := Format(SObsFmt, [cdsContaPagarCD_TITULO.AsLargeInt]);

      DM.setLog(2033, 'Inclusao', Chave, cdsContaPagarCD_COLIGADA.AsInteger, Obs);

      cdsContaPagar.Next;
   end;
end;

procedure TfrmLGTCDespesasResumo.CriaCompromissos;
const
   KeyFields = 'CD_PESSOA;CD_CONTA;CD_COLIGADA_MATRIZ;CD_TIPO_TITULO';
var
   KeyValues: Variant;
   Found: Boolean;
begin
   cdsContaPagar.Open;
   cdsCompromissos.First;

   while not cdsCompromissos.Eof do
   begin

      KeyValues := VarArrayOf([
         cdsCompromissosCD_FORNECEDOR.AsInteger,
         cdsCompromissosCD_CONTA.AsLargeInt,
         cdsCompromissosCD_COLIGADA_MATRIZ.AsInteger,
         cdsCompromissosCD_TIPO_TITULO.AsInteger]);

      Found := cdsContaPagar.Locate(KeyFields, KeyValues, []);

      if Found and (cdsCompromissosDS_CHAVE.AsString = 'aula') then
      begin
         cdsContaPagar.Edit;
         cdsContaPagarDS_OBSERVACAO.AsString :=
            cdsContaPagarDS_OBSERVACAO.AsString + #13#10 +
            cdsCompromissosDS_OBSERVACAO.AsString;
         cdsContaPagarVL_DESPESA.AsCurrency :=
            cdsContaPagarVL_DESPESA.AsCurrency +
            cdsCompromissosVL_TOTAL.AsCurrency;
         cdsContaPagarVL_TOTAL_DESPESA.AsCurrency :=
            cdsContaPagarVL_TOTAL_DESPESA.AsCurrency +
            cdsCompromissosVL_TOTAL.AsCurrency;
         cdsContaPagar.Post;

         if cdsDespesas.Locate('CD_DESPESA', cdsCompromissosCD_DESPESA.AsLargeInt, []) then
         begin
            cdsDespesas.Edit;
            cdsDespesasCD_TITULO.AsLargeInt := cdsContaPagarCD_TITULO.AsLargeInt;
            cdsDespesasCD_SITUACAO.AsLargeInt := SituacaoGeradoID;
            cdsDespesas.Post;
         end;
      end;

      if (not Found) or (cdsCompromissosDS_CHAVE.AsString = 'dia') then
      begin
         cdsContaPagar.Insert;
         cdsContaPagarCD_TITULO.AsLargeInt := GetCodigoTitulo;
         cdsContaPagarCD_TITULO_PRINCIPAL.AsLargeInt := cdsContaPagarCD_TITULO.AsLargeInt;
         cdsContaPagarCD_COLIGADA.AsInteger := cdsCompromissosCD_COLIGADA.AsInteger;
         cdsContaPagarCD_PESSOA.AsInteger := cdsCompromissosCD_FORNECEDOR.AsInteger;
         cdsContaPagarDS_OBSERVACAO.AsString := cdsCompromissosDS_OBSERVACAO.AsString;
         cdsContaPagarNR_PARCELA.AsInteger := 1;
         cdsContaPagarDT_LANCAMENTO.AsDateTime := Now;
         cdsContaPagarDT_COMPETENCIA.AsDateTime := Date;
         cdsContaPagarDT_VENCIMENTO.AsDateTime := IncDay(Date, 10);
         cdsContaPagarDT_PROVAVEL_PGTO.AsDateTime := IncDay(Date, 10);
         cdsContaPagarVL_DESPESA.AsCurrency := cdsCompromissosVL_TOTAL.AsCurrency;
         cdsContaPagarCD_SITUACAO.AsInteger := 1;
         cdsContaPagarSN_PREVISAO.AsString := 'S';
         cdsContaPagarCD_TIPO_TITULO.AsInteger := cdsCompromissosCD_TIPO_TITULO.AsInteger;
         cdsContaPagarTP_ENTRADA_SAIDA.AsInteger := 2;
         cdsContaPagarCD_FORMA_PGTO.AsInteger := cdsCompromissosCD_FORMA_PGTO.AsLargeInt;
         cdsContaPagarVL_ABATIMENTO.AsCurrency := 0;
         cdsContaPagarVL_DESCONTO.AsCurrency := 0;
         cdsContaPagarVL_MORA.AsCurrency := 0;
         cdsContaPagarVL_MULTA.AsCurrency := 0;
         cdsContaPagarVL_PREVISTO_PGTO_INSS.AsCurrency := 0;
         cdsContaPagarVL_OUTRAS_ENTIDADES.AsCurrency := 0;
         cdsContaPagarVL_ATUALIZACAO_MOTENARIA.AsCurrency := 0;
         cdsContaPagarVL_TOTAL_DESPESA.AsCurrency := cdsCompromissosVL_TOTAL.AsCurrency;
         cdsContaPagarCD_TURMA.AsString := cdsCompromissosCD_TURMA.AsString;
         cdsContaPagarCD_DISCIPLINA.AsInteger := cdsCompromissosCD_DISCIPLINA.AsInteger;
         cdsContaPagarNR_ANOSEMESTRE_DISCIPLINA.AsInteger := cdsCompromissosCD_DISCIPLINA.AsInteger;
         cdsContaPagarCD_CONTA.AsLargeInt := cdsCompromissosCD_CONTA.AsLargeInt;
         cdsContaPagarCD_COLIGADA_MATRIZ.AsInteger := cdsCompromissosCD_COLIGADA_MATRIZ.AsInteger;
         cdsContaPagarCD_CENTRO.AsLargeInt := cdsCompromissosCD_CENTRO.AsLargeInt;
         cdsContaPagar.Post;

         if cdsDespesas.Locate('CD_DESPESA', cdsCompromissosCD_DESPESA.AsLargeInt, []) then
         begin
            cdsDespesas.Edit;
            cdsDespesasCD_TITULO.AsLargeInt := cdsContaPagarCD_TITULO.AsLargeInt;
            cdsDespesasCD_SITUACAO.AsLargeInt := SituacaoGeradoID;
            cdsDespesas.Post;
         end;
      end;
         
      cdsCompromissos.Next;
   end;

   cdsContaPagar.ApplyUpdates(0);
   cdsDespesas.ApplyUpdates(0);
end;

procedure TfrmLGTCDespesasResumo.CriaMovimentacoes;
const
   SChaveFmt = '%u;%d';
   SObsFmt = 'Gerou movimento com o título "%u"';
var
   Chave, Obs: AnsiString;
begin
   cdsContaPagar.First;

   while not cdsContaPagar.Eof do
   begin
      qryMovimentoCP.ParamByName('CD_TITULO').AsInteger := cdsContaPagarCD_TITULO.AsLargeInt;
      qryMovimentoCP.ParamByName('CD_COLIGADA').AsInteger := cdsContaPagarCD_COLIGADA.AsInteger;
      qryMovimentoCP.ParamByName('NR_SEQUENCIA').AsInteger := 1;
      qryMovimentoCP.ParamByName('CD_ACAO').AsInteger := 1;
      qryMovimentoCP.ParamByName('DT_MOVIMENTO').AsDateTime := Now;
      qryMovimentoCP.ParamByName('VL_ENTRADA').AsCurrency := cdsContaPagarVL_DESPESA.AsCurrency;
      qryMovimentoCP.ParamByName('CD_USUARIO').AsInteger := UsuarioID;
      qryMovimentoCP.ExecSQL;

      Chave := Format(SChaveFmt, [
         cdsContaPagarCD_TITULO.AsLargeInt,
         cdsContaPagarCD_COLIGADA.AsInteger]);

      Obs := Format(SObsFmt, [cdsContaPagarCD_TITULO.AsLargeInt]);

      DM.setLog(2033, 'Inclusao', Chave, cdsContaPagarCD_COLIGADA.AsInteger, Obs);

      cdsContaPagar.Next;
   end;
end;

procedure TfrmLGTCDespesasResumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if ModalResult = mrOk then
   begin
      GeraCompromissos;
   end;

   Action := caFree;
   frmLGTCDespesasResumo := nil;
end;

procedure TfrmLGTCDespesasResumo.GeraCompromissos;
begin
   CriaCompromissos;
   LogCompromissos;
   CriaMovimentacoes;
   CriaApropriacoes;
end;

function TfrmLGTCDespesasResumo.GetCodigoTitulo: Cardinal;
const
   SQL = 'UPDATE `PARAMETROS` SET `DS_VALOR` = `DS_VALOR` + 1 WHERE `DS_VARIAVEL` = ''financeiro_cd_titulo_cp''';
var
   S: AnsiString;
begin
   ExecuteUpdate(SQL);

   S := DM.variavel_parametro('financeiro_cd_titulo_cp');
   Result := StrToIntDef(S, 0);
end;

procedure TfrmLGTCDespesasResumo.Load;
begin
   LoadUsuario;
   LoadSituacaoGerado;
   LoadAulas;
   LoadDespesas;
   cdsDespesas.Filtered := True;
end;

procedure TfrmLGTCDespesasResumo.LoadAulas;
var
   PrevDate, CurrDate, NewDate: TDateTime;
   Bookmark: TBookmark;
begin
   cdsAulas.Filtered := False;
   cdsAulas.Close;
   cdsAulas.Params.ParamByName('CD_DIARIO_AULA').AsInteger := AulaID;
   cdsAulas.Open;

   if cdsAulas.Locate('CD_DIARIO_AULA', AulaID, []) then
   begin

      Bookmark := cdsAulas.GetBookmark;
      PrevDate := cdsAulasDT_AULA.AsDateTime;

      cdsAulas.Edit;
      cdsAulasSN_GERAR.AsBoolean := True;
      cdsAulas.Post;
      cdsAulas.Next;

      while not cdsAulas.Eof do
      begin

         CurrDate := cdsAulasDT_AULA.AsDateTime;
         NewDate := IncDay(CurrDate, -1);

         if NewDate <> PrevDate then
            Break;

         PrevDate := cdsAulasDT_AULA.AsDateTime;
         cdsAulas.Edit;
         cdsAulasSN_GERAR.AsBoolean := True;
         cdsAulas.Post;
         cdsAulas.Next;
         
      end;

      cdsAulas.GotoBookmark(Bookmark);
      PrevDate := cdsAulasDT_AULA.AsDateTime;
      cdsAulas.Prior;

      while not cdsAulas.Bof do
      begin

         CurrDate := cdsAulasDT_AULA.AsDateTime;
         NewDate := IncDay(CurrDate, 1);

         if NewDate <> PrevDate then
            Break;

         PrevDate := cdsAulasDT_AULA.AsDateTime;
         cdsAulas.Edit;
         cdsAulasSN_GERAR.AsBoolean := True;
         cdsAulas.Post;
         cdsAulas.Prior;
         
      end;
      
   end;
end;

procedure TfrmLGTCDespesasResumo.LoadDespesas;
var
   S: AnsiString;
   ColigadaID: Integer;
begin
   S := DM.variavel_parametro('LogisticaAulas.Compromisso.Gerar.Coligada');
   ColigadaID := StrToIntDef(S, -1);

   cdsCompromissos.Filtered := False;
   cdsCompromissos.CreateDataSet;
   cdsCompromissos.Open;

   cdsAulas.Filtered := True;
   cdsAulas.First;
   
   cdsDespesas.Close;
   cdsDespesas.Params.ParamByName('CD_DIARIO_AULA').AsInteger := AulaID;
   cdsDespesas.Open;

   while not cdsDespesas.Eof do
   begin

      if cdsAulas.Locate('CD_DIARIO_AULA', cdsDespesasCD_DIARIO_AULA.AsLargeInt, []) then
      begin

         if (cdsDespesasCD_DIARIO_AULA.AsLargeInt = AulaID) or
            (cdsDespesasDS_CHAVE.AsString = 'aula') then
         begin
            cdsDespesas.Edit;
            cdsDespesasSN_MOSTRAR.AsBoolean := True;
            cdsDespesas.Post;

            cdsCompromissos.Insert;
            cdsCompromissosCD_DIARIO_AULA.AsLargeInt := cdsDespesasCD_DIARIO_AULA.AsLargeInt;

            if ColigadaID = -1 then
               cdsCompromissosCD_COLIGADA.AsInteger := cdsDespesasCD_COLIGADA.AsInteger;

            if ColigadaID <> -1 then
               cdsCompromissosCD_COLIGADA.AsInteger := ColigadaID;

            cdsCompromissosCD_CENTRO.AsLargeInt := cdsDespesasCD_CENTRO.AsLargeInt;
            cdsCompromissosCD_FORNECEDOR.AsInteger := cdsDespesasCD_FORNECEDOR.AsInteger;
            cdsCompromissosCD_CONTA.AsLargeInt := cdsDespesasCD_CONTA.AsLargeInt;

            if ColigadaID = -1 then
               cdsCompromissosCD_COLIGADA_MATRIZ.AsInteger := cdsDespesasCD_COLIGADA_MATRIZ.AsInteger;

            if ColigadaID <> -1 then
               cdsCompromissosCD_COLIGADA_MATRIZ.AsInteger := ColigadaID;

            cdsCompromissosCD_TIPO_TITULO.AsInteger := cdsDespesasCD_TIPO_TITULO.AsInteger;
            cdsCompromissosDS_OBSERVACAO.AsString := cdsDespesasDS_OBSERVACAO.AsString;
            cdsCompromissosVL_TOTAL.AsCurrency := cdsDespesasVL_TOTAL.AsCurrency;
            cdsCompromissosDS_CHAVE.AsString := cdsDespesasDS_CHAVE.AsString;
            cdsCompromissosCD_TURMA.AsString := cdsDespesasCD_TURMA.AsString;
            cdsCompromissosCD_DISCIPLINA.AsInteger := cdsDespesasCD_DISCIPLINA.AsInteger;
            cdsCompromissosNR_ANOSEMESTRE.AsInteger := cdsDespesasNR_ANOSEMESTRE.AsInteger;
            cdsCompromissosCD_DESPESA.AsLargeInt := cdsDespesasCD_DESPESA.AsLargeInt;
            cdsCompromissosCD_FORMA_PGTO.AsLargeInt := cdsDespesasCD_FORMA_PGTO.AsLargeInt;
            cdsCompromissos.Post;
         end;
         
      end;

      cdsDespesas.Next;

   end;
end;

procedure TfrmLGTCDespesasResumo.LoadSituacaoGerado;
const
   SQL = 'SELECT `CD_SITUACAO` FROM `LGTC_DESPESA_SITUACAO` WHERE `DS_CHAVE` = ''gerado''';
var
   Rs: IZResultSet;
begin
   SituacaoGeradoID := 0;
   
   Rs := ExecuteQuery(SQL);
   try
   
      if Rs.Next then
         SituacaoGeradoID := Rs.GetInt(1);
         
   finally
      Rs.Close;
      Rs := nil;
   end;
end;

procedure TfrmLGTCDespesasResumo.LoadUsuario;
begin
   UsuarioID := TLoginManager.GetInstancia.GetDM.GetUsuarioLogado.Pessoa.Codigo;
end;

procedure TfrmLGTCDespesasResumo.LogCompromissos;
const
   SChaveFmt = '%u;%d';
   SObsFmt = 'Gerou compromisso com o título "%u"';
var
   Chave, Obs: AnsiString;
begin
   cdsContaPagar.First;

   while not cdsContaPagar.Eof do
   begin
      Chave := Format(SChaveFmt, [
         cdsContaPagarCD_TITULO.AsLargeInt,
         cdsContaPagarCD_COLIGADA.AsInteger]);

      Obs := Format(SObsFmt, [cdsContaPagarCD_TITULO.AsLargeInt]);

      DM.setLog(2033, 'Inclusao', Chave, cdsContaPagarCD_COLIGADA.AsInteger, Obs);

      cdsContaPagar.Next;
   end;
end;

class function TfrmLGTCDespesasResumo.ShowDespesas(
  const AAulaID: Cardinal): TModalResult;
begin
   Application.CreateForm(TfrmLGTCDespesasResumo, frmLGTCDespesasResumo);
   frmLGTCDespesasResumo.AulaID := AAulaID;
   frmLGTCDespesasResumo.Load;
   Result := frmLGTCDespesasResumo.ShowModal;
end;

end.
