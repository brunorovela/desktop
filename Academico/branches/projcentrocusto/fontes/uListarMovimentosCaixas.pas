unit uListarMovimentosCaixas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, uDM, uColigada, Main, General, StrUtils, Buttons, uBuscarVariosCaixas;

type
  TuFrmListarMovimentosCaixas = class(TForm)
    pnlGrid: TPanel;
    grd: TDBGrid;
    dsMovimentacoesCaixas: TDataSource;
    qryListaMov: TUMZQuery;
    qryListaMovDS_MOEDA: TStringField;
    qryListaMovDS_SIGLA: TStringField;
    qryListaMovCD_MOVIMENTO_TE: TLargeintField;
    qryListaMovCD_COLIGADA: TIntegerField;
    qryListaMovCD_CAIXA: TIntegerField;
    qryListaMovCD_ABERTURA_CAIXA: TIntegerField;
    qryListaMovDT_MOVIMENTO: TDateTimeField;
    qryListaMovCD_ACAO: TIntegerField;
    qryListaMovNR_DOCUMENTO: TStringField;
    qryListaMovDS_MOVIMENTO: TStringField;
    qryListaMovDT_LIBERACAO: TDateTimeField;
    qryListaMovCD_ORIGEM: TSmallintField;
    qryListaMovTP_ENTRADA_SAIDA: TSmallintField;
    qryListaMovVL_MOVIMENTO: TFloatField;
    qryListaMovCD_MOEDA: TLargeintField;
    qryListaMovVL_MOEDA: TFloatField;
    qryListaMovVL_SALDO: TFloatField;
    qryListaMovVL_DINHEIRO: TFloatField;
    qryListaMovVL_CHEQUE: TFloatField;
    qryListaMovCD_MENSALIDADE: TLargeintField;
    qryListaMovCD_USUARIO: TLargeintField;
    qryListaMovSN_COMPENSADO: TSmallintField;
    qryListaMovDT_COMPENSACAO: TDateTimeField;
    qryListaMovCD_FORMA_PGTO: TLargeintField;
    qryListaMovDT_REGISTRO: TDateTimeField;
    qryListaMovNR_CHEQUE: TIntegerField;
    qryListaMovVL_SALDO_COMPENSADO: TFloatField;
    qryListaMovCD_TITULO: TLargeintField;
    qryListaMovNR_ESTORNO: TLargeintField;
    qryListaMovCD_TRANSFERE: TLargeintField;
    qryListaMovCD_CHEQUE: TLargeintField;
    qryListaMovDS_OBSERVACAO: TMemoField;
    qryListaMovDS_OBSERVACAO_1: TMemoField;
    qryListaMovDESORIGEM: TStringField;
    qryListaMovVALMOVIMENTO: TFloatField;
    qryListaMovDESES: TStringField;
    qryListaMovDESDINCH: TStringField;
    qryListaMovDESCH: TStringField;
    qryListaMovDESCHSIT: TStringField;
    qryListaMovDESCHSITSIGLA: TStringField;
    qryListaMovDESCHCAIXA: TStringField;
    qryListaMovValEntradas: TStringField;
    qryListaMovValSaidas: TStringField;
    qryListaMovValSaidasBanco: TFloatField;
    qryListaMovValEntradasBanco: TFloatField;
    qryListaMovVLSALDO: TFloatField;
    qryListaMovVLSALDOCOMP: TFloatField;
    qryListaMovNM_FORNECEDOR: TStringField;
    qryListaMovNM_USUARIO: TStringField;
    qryListaMovCentroCusto: TStringField;
    qryListaMovPlanoContas: TStringField;
    qryListaMovContasCod: TStringField;
    qryListaMovCentrosCod: TStringField;
    pnTitulo: TPanel;
    pnRodape: TPanel;
    sbFechar: TSpeedButton;
    sbPlanilhaCaixa: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPlanilhaCaixaClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure qryListaMovCalcFields(DataSet: TDataSet);
    procedure grdDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure executaBusca(cd_coligada :Integer);
  end;

var
  uFrmListarMovimentosCaixas: TuFrmListarMovimentosCaixas;

implementation

uses uTesouraria_Planilha;

{$R *.dfm}

{ TuFrmListarMovimentosCaixas }

procedure TuFrmListarMovimentosCaixas.executaBusca(cd_coligada :Integer);
var
   aux, sSQL: string;
   qtdParams, i: Integer;
   qryFiltro2: TUMZquery;
begin


   sSQL := TfrmBuscarVariosCaixas.getFiltro(
      cd_coligada
   );

   if sSQL <> '' then
   begin

      qryListaMov.SQL.Text := sSQL;

      qtdParams := qryListaMov.Params.Count - 1;

      aux := qryListaMov.SQL.Text;

      for I := 0 to qtdParams do
         try

            //Tratamento para ser usado no caso da condição "IN" no filtro de caixas
            if qryListaMov.Params[I].Name = 'CD_CAIXAS' then
            begin

               aux :=
                  StringReplace(
                     aux,
                     ':CD_CAIXAS',
                     frmBuscarVariosCaixas.Params.ParamByName(qryListaMov.Params[I].Name).Value,
                     [rfReplaceAll, rfIgnoreCase]
                  );
            end
            else //Insere os demais parametros normalmente.
            begin
               qryListaMov.Params[I].Value :=
                  frmBuscarVariosCaixas.Params.ParamByName(qryListaMov.Params[I].Name).Value;
            end;

         except

         end;

      qryListaMov.SQL.Text := aux;

      qryListaMov.Open;
      qryListaMov.Active := True;
      qryListaMov.FieldByName('cd_caixa').asString;

      if (qryListaMov.RecordCount <= 0) then
      begin
         Mensagem('Nenhum lançamento encontrado com este filtro.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
         executaBusca(cd_coligada);
      end
      else
      begin
         Self.Show;
         self.SetFocus;
      end;
      
   end
   else
   begin
      Close;
   end;

end;

procedure TuFrmListarMovimentosCaixas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TuFrmListarMovimentosCaixas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_F12 : sbFecharClick( nil );
   end;
end;

procedure TuFrmListarMovimentosCaixas.FormShow(Sender: TObject);
var
   i: Integer;
begin
   DM.MontarPlanilha(grd, 'planilha_tesouraria_campos');

   for I := 0 to grd.Columns.Count - 1 do
   begin
      if grd.Columns[i].FieldName = 'VLSALDO' then
      begin
         grd.Columns[i].Visible := False;
      end;
   end;
end;

procedure TuFrmListarMovimentosCaixas.grdDblClick(Sender: TObject);
CONST
   SQL_CONTROLE = '                    '+
   'SELECT                             '+
	'  *                                '+
   'FROM                               '+
   '  fin_controle_caixa               '+
   'WHERE                              '+
	'  ds_situacao = "A"                '+
   '  AND cd_coligada IN (1)           '+
   '  AND cd_conta_banco = :cd_caixa   '+
   'ORDER BY                           '+
	'  cd_conta_banco                   ';

   SQL_TESTE = 'SELECT * FROM fin_cadastro_contas where cd_caixa = :cd_caixa';

var
   qyControle: TUMZQuery;
   qyCaixas: TUMZQuery;
   ativo: Boolean;
begin

   DM.criarConsulta(qyControle);
   DM.criarConsulta(qyCaixas);

   qyCaixas.SQL.Text := SQL_TESTE;
   qyCaixas.ParamByName('cd_caixa').asInteger := qryListaMovCD_CAIXA.AsInteger;
   
   qyControle.SQL.Text := SQL_CONTROLE;
   qyControle.ParamByName('cd_caixa').asInteger := qryListaMovCD_CAIXA.AsInteger;

   qyControle.Open;
   qyCaixas.open;

   if qyCaixas.FieldByName('tp_conta').AsInteger = 3 then // Conta Caixa
   begin

      qyControle.Locate('cd_conta_banco', qyCaixas.FieldByNAme('cd_caixa').AsString , []);

      if qyControle.FieldByName('cd_conta_banco').AsString = qyCaixas.FieldByNAme('cd_caixa').AsString then
      begin
         ativo := True;
      end
      else
      begin
         ativo := False;
      end;

   end
   else
   begin
      ativo := True;
   end;


   if (ativo = False) then
   begin

      Mensagem(
         'Este movimento esta em um controle de caixa fechado e não pode mais ser alterado',
         '',
         MB_OK + MB_ICONINFORMATION,
         Handle
      );

      Exit;
   end;

   if not PrincipalForm.ProcuraForm( TForm(frm_Tesouraria_Planilha) ) then
   Begin
      Application.CreateForm( Tfrm_Tesouraria_Planilha, frm_Tesouraria_Planilha );
   end;

   if qyControle.RecordCount < 1 then
   begin
      frm_Tesouraria_Planilha.dtpDataInicio.Date := qryListaMovDT_MOVIMENTO.AsDateTime;
      frm_Tesouraria_Planilha.dtpDataFinal.Date := qryListaMovDT_MOVIMENTO.AsDateTime;
   end;

   frm_Tesouraria_Planilha.cd_coligada_caixa := qryListaMovcd_coligada.AsInteger;
   frm_tesouraria_planilha.pnTitulo.Caption  := 'PLANILHA DE CAIXA';

   frm_Tesouraria_Planilha.sbReceber.Caption := '';
   frm_Tesouraria_Planilha.sbPagar.Caption := '';

   frm_Tesouraria_Planilha.qryTesouraria.Close;
   frm_Tesouraria_Planilha.intCodAbertura := qyControle.FieldByName('cd_abertura_caixa').AsInteger;
   frm_Tesouraria_Planilha.intCodCaixa := qryListaMovcd_caixa.AsInteger;
   frm_Tesouraria_Planilha.lbCaixa.Caption := 'Caixa aberto em: ' + FormatDateTime('dd/mm/yyyy hh:mm',qyControle.FieldByName('dt_abertura').AsDateTime);
   frm_Tesouraria_Planilha.Filtra;



   frm_Tesouraria_Planilha.qryTesouraria.Locate('cd_movimento_te', qryListaMovCD_MOVIMENTO_TE.AsInteger, []);
end;

procedure TuFrmListarMovimentosCaixas.qryListaMovCalcFields(DataSet: TDataSet);
begin

   if qryListaMovValSaidasBanco.AsFloat = 0.0 then
   begin
      qryListaMovValSaidas.AsString := ''
   end
   else
   begin
      qryListaMovValSaidas.AsString := FormatCurr('###,###,##0.00', qryListaMovValSaidasBanco.AsCurrency);
   end;

   if qryListaMovValEntradasBanco.AsFloat = 0.0 then
   begin
      qryListaMovValEntradas.AsString := ''
   end
   else
   begin
      qryListaMovValEntradas.AsString := FormatCurr('###,###,##0.00', qryListaMovValEntradasBanco.AsCurrency);
   end;
   
end;

procedure TuFrmListarMovimentosCaixas.sbFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TuFrmListarMovimentosCaixas.sbPlanilhaCaixaClick(Sender: TObject);
begin
   grdDblClick(self);
end;

end.
