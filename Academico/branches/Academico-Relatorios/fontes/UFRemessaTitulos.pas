unit UFRemessaTitulos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, Provider, DBClient, ExtCtrls,
   Grids, DBGrids, UDBGrids, Buttons, StdCtrls;

type
   TfrmRemessaTitulos = class(TForm)
      bbtnFechar: TBitBtn;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      cdsTitulos: TClientDataSet;
      cdsTitulosANOSEMESTRE: TSmallintField;
      cdsTitulosBLOQUETO: TStringField;
      cdsTitulosCD_AUTENTICACAO: TStringField;
      cdsTitulosCD_BOLETO: TLargeintField;
      cdsTitulosCD_BOLSA: TIntegerField;
      cdsTitulosCD_CAIXA: TIntegerField;
      cdsTitulosCD_CENTRO_CUSTO: TLargeintField;
      cdsTitulosCD_CHEQUE_DEVOLVIDO: TLargeintField;
      cdsTitulosCD_COLIGADA: TIntegerField;
      cdsTitulosCD_DESC_CONDICIONAL: TLargeintField;
      cdsTitulosCD_ITEM_PLANO: TLargeintField;
      cdsTitulosCD_MENSALIDADE: TIntegerField;
      cdsTitulosCD_MENSALIDADE_ORIGEM: TIntegerField;
      cdsTitulosCD_MOEDA: TLargeintField;
      cdsTitulosCD_MOEDA_PGTO: TLargeintField;
      cdsTitulosCD_PLANO_CONTA: TLargeintField;
      cdsTitulosCD_RECIBO: TIntegerField;
      cdsTitulosCD_RESP: TIntegerField;
      cdsTitulosCD_RESP_NFSE: TIntegerField;
      cdsTitulosCD_TIPO_TITULO: TSmallintField;
      cdsTitulosCD_USUARIO: TLargeintField;
      cdsTitulosCODIGOALUNO: TIntegerField;
      cdsTitulosCODIGOCARTA: TLargeintField;
      cdsTitulosCURSO: TStringField;
      cdsTitulosDATABASECORRECAO: TDateTimeField;
      cdsTitulosDATAEMISSAO: TDateTimeField;
      cdsTitulosDATAPAGAMENTO: TDateTimeField;
      cdsTitulosDATAVENCIMENTO: TDateTimeField;
      cdsTitulosDEPTO: TSmallintField;
      cdsTitulosDESCONTOEXTRA: TFloatField;
      cdsTitulosDS_AUTENTICA_IMPRESSAO: TStringField;
      cdsTitulosDS_DEPOSITO: TStringField;
      cdsTitulosDS_HISTORICO: TStringField;
      cdsTitulosDS_OBS_DESC: TMemoField;
      cdsTitulosDS_SITUACAO: TStringField;
      cdsTitulosDS_TIPO_TITULO: TStringField;
      cdsTitulosDT_BASE: TDateTimeField;
      cdsTitulosDT_COMPETENCIA: TDateTimeField;
      cdsTitulosDT_CREDITO: TDateTimeField;
      cdsTitulosINDICECORRECAO: TFloatField;
      cdsTitulosNOSSONUMERO: TStringField;
      cdsTitulosNR_CREDITOS: TFloatField;
      cdsTitulosNR_NF: TLargeintField;
      cdsTitulosOCORRENCIA_REMESSA: TSmallintField;
      cdsTitulosOCORRENCIA_RETORNO: TIntegerField;
      cdsTitulosPARCELA: TSmallintField;
      cdsTitulosSITUACAO: TSmallintField;
      cdsTitulosSN_BLOQUETO: TStringField;
      cdsTitulosSN_CREDITO_PARCELA: TStringField;
      cdsTitulosSN_LIBERAR_DESCONTOS: TSmallintField;
      cdsTitulosSN_LIBERAR_JUROS: TSmallintField;
      cdsTitulosSN_NFE_GERADA: TSmallintField;
      cdsTitulosSN_TIPO_NOTA: TSmallintField;
      cdsTitulosTIPOPARCELA: TSmallintField;
      cdsTitulosTURMA: TStringField;
      cdsTitulosUSUARIO: TStringField;
      cdsTitulosVALORBRUTO: TFloatField;
      cdsTitulosVALORDESCONTO: TFloatField;
      cdsTitulosVALORDESCONTO_FIXO: TFloatField;
      cdsTitulosVALOREXTRA: TFloatField;
      cdsTitulosVALORJUROS: TFloatField;
      cdsTitulosVALORJUROS_FIXO: TFloatField;
      cdsTitulosVALORPAGO: TFloatField;
      cdsTitulosVALORTOTAL: TFloatField;
      cdsTitulosVL_CREDITO: TFloatField;
      cdsTitulosVL_DESCONTO: TFloatField;
      cdsTitulosVL_FATURAMENTO: TFloatField;
      cdsTitulosVL_JUROS: TFloatField;
      cdsTitulosVL_PAGO_MOEDA: TFloatField;
      cdsTitulosVL_PERC_DESC_COND: TFloatField;
      cdsTitulosVL_PERC_DESC_FIXO: TFloatField;
      cdsTitulosVL_PERCENTUAL_DESC: TFloatField;
      cdsTitulosVL_PERCENTUAL_DESC_EXTRA: TFloatField;
      cdsTitulosVL_PERCENTUAL_DIVISAO: TFloatField;
      cdsTitulosVL_TOTAL: TFloatField;
      dbgTitulos: TSortedDBGrid;
      dspTitulos: TDataSetProvider;
      dsTitulos: TDataSource;
      pnlBotoes: TPanel;
      pnlTitulo: TPanel;
      qryTitulos: TUMZReadOnlyQuery;
      qryTitulosANOSEMESTRE: TSmallintField;
      qryTitulosBLOQUETO: TStringField;
      qryTitulosCD_AUTENTICACAO: TStringField;
      qryTitulosCD_BOLETO: TLargeintField;
      qryTitulosCD_BOLSA: TIntegerField;
      qryTitulosCD_CAIXA: TIntegerField;
      qryTitulosCD_CENTRO_CUSTO: TLargeintField;
      qryTitulosCD_CHEQUE_DEVOLVIDO: TLargeintField;
      qryTitulosCD_COLIGADA: TIntegerField;
      qryTitulosCD_DESC_CONDICIONAL: TLargeintField;
      qryTitulosCD_ITEM_PLANO: TLargeintField;
      qryTitulosCD_MENSALIDADE: TIntegerField;
      qryTitulosCD_MENSALIDADE_ORIGEM: TIntegerField;
      qryTitulosCD_MOEDA: TLargeintField;
      qryTitulosCD_MOEDA_PGTO: TLargeintField;
      qryTitulosCD_PLANO_CONTA: TLargeintField;
      qryTitulosCD_RECIBO: TIntegerField;
      qryTitulosCD_RESP: TIntegerField;
      qryTitulosCD_RESP_NFSE: TIntegerField;
      qryTitulosCD_TIPO_TITULO: TSmallintField;
      qryTitulosCD_USUARIO: TLargeintField;
      qryTitulosCODIGOALUNO: TIntegerField;
      qryTitulosCODIGOCARTA: TLargeintField;
      qryTitulosCURSO: TStringField;
      qryTitulosDATABASECORRECAO: TDateTimeField;
      qryTitulosDATAEMISSAO: TDateTimeField;
      qryTitulosDATAPAGAMENTO: TDateTimeField;
      qryTitulosDATAVENCIMENTO: TDateTimeField;
      qryTitulosDEPTO: TSmallintField;
      qryTitulosDESCONTOEXTRA: TFloatField;
      qryTitulosDS_AUTENTICA_IMPRESSAO: TStringField;
      qryTitulosDS_DEPOSITO: TStringField;
      qryTitulosDS_HISTORICO: TStringField;
      qryTitulosDS_OBS_DESC: TMemoField;
      qryTitulosDS_SITUACAO: TStringField;
      qryTitulosDS_TIPO_TITULO: TStringField;
      qryTitulosDT_BASE: TDateTimeField;
      qryTitulosDT_COMPETENCIA: TDateTimeField;
      qryTitulosDT_CREDITO: TDateTimeField;
      qryTitulosINDICECORRECAO: TFloatField;
      qryTitulosNOSSONUMERO: TStringField;
      qryTitulosNR_CREDITOS: TFloatField;
      qryTitulosNR_NF: TLargeintField;
      qryTitulosOCORRENCIA_REMESSA: TSmallintField;
      qryTitulosOCORRENCIA_RETORNO: TIntegerField;
      qryTitulosPARCELA: TSmallintField;
      qryTitulosSITUACAO: TSmallintField;
      qryTitulosSN_BLOQUETO: TStringField;
      qryTitulosSN_CREDITO_PARCELA: TStringField;
      qryTitulosSN_LIBERAR_DESCONTOS: TSmallintField;
      qryTitulosSN_LIBERAR_JUROS: TSmallintField;
      qryTitulosSN_NFE_GERADA: TSmallintField;
      qryTitulosSN_TIPO_NOTA: TSmallintField;
      qryTitulosTIPOPARCELA: TSmallintField;
      qryTitulosTURMA: TStringField;
      qryTitulosUSUARIO: TStringField;
      qryTitulosVALORBRUTO: TFloatField;
      qryTitulosVALORDESCONTO: TFloatField;
      qryTitulosVALORDESCONTO_FIXO: TFloatField;
      qryTitulosVALOREXTRA: TFloatField;
      qryTitulosVALORJUROS: TFloatField;
      qryTitulosVALORJUROS_FIXO: TFloatField;
      qryTitulosVALORPAGO: TFloatField;
      qryTitulosVALORTOTAL: TFloatField;
      qryTitulosVL_CREDITO: TFloatField;
      qryTitulosVL_DESCONTO: TFloatField;
      qryTitulosVL_FATURAMENTO: TFloatField;
      qryTitulosVL_JUROS: TFloatField;
      qryTitulosVL_PAGO_MOEDA: TFloatField;
      qryTitulosVL_PERC_DESC_COND: TFloatField;
      qryTitulosVL_PERC_DESC_FIXO: TFloatField;
      qryTitulosVL_PERCENTUAL_DESC: TFloatField;
      qryTitulosVL_PERCENTUAL_DESC_EXTRA: TFloatField;
      qryTitulosVL_PERCENTUAL_DIVISAO: TFloatField;
      qryTitulosVL_TOTAL: TFloatField;
      sbColunas: TSpeedButton;
      procedure bbtnFecharClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure sbColunasClick(Sender: TObject);
   public
      class procedure MostraTitulos(const EnvioID: Integer);
   end;

var
   frmRemessaTitulos: TfrmRemessaTitulos;

implementation

uses
   uCamposPlanilhas, uDM;

{$R *.dfm}

{ TfrmRemessaTitulos }

procedure TfrmRemessaTitulos.bbtnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmRemessaTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmRemessaTitulos.FormCreate(Sender: TObject);
begin
   DM.MontarPlanilha(TDBGrid(TCustomDBGrid(dbgTitulos)),
      'frmRemessaTitulos.dbgTitulos');
end;

class procedure TfrmRemessaTitulos.MostraTitulos(const EnvioID: Integer);
begin
   if frmRemessaTitulos = nil then
      Application.CreateForm(TfrmRemessaTitulos, frmRemessaTitulos);

   with frmRemessaTitulos do
   begin
      if cdsTitulos.Active then
         cdsTitulos.Close;
      cdsTitulos.Params.ParamByName('CD_ENVIO').AsInteger := EnvioID;
      cdsTitulos.Open;
      ShowModal;
   end;

   frmRemessaTitulos := nil;
end;

procedure TfrmRemessaTitulos.sbColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(
      TDBGrid(TCustomDBGrid(dbgTitulos)), 'frmRemessaTitulos.dbgTitulos');
end;

end.
