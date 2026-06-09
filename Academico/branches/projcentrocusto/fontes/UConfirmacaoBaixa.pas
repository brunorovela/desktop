unit UConfirmacaoBaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, uMensalidadeListaBaixa, Contnrs,
  uMensalidadesBaixarChequesClass, uFinChequesMensalidades, General;

type
  TfrmMBConfirmacaoBaixa = class(TForm)
    sgGridMensalidades: TStringGrid;
    pnTitulo: TPanel;
    pnBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    sgGridCheques: TStringGrid;
    Panel1: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
     ListaMensalidadesBaixa   : TObjectList;
     ListaChequesMensalidades : TObjectList;
     ListaCheques             : TObjectList;
     vl_total                 : double;
    { Private declarations }
  public

    procedure setListaMensalidades( objLista : TObjectList );
    procedure setListaChequesMensalidades (objLista : TObjectList );
    procedure setListaCheques( objLista : TObjectList );  
    procedure carregaGridMensalidades();
    procedure carregaGridCheques();
    procedure ApagarCheques();
    procedure limparListaBaixaMensalidades();
    procedure setValorTotal( valor: double );
    function substituiCaracter( valor: string; str_antigo: string; str_novo: string ) : string;
    function validaValores() : Boolean;
    function getValorTotal() : double;

    { Public declarations }
  end;

var
  frmMBConfirmacaoBaixa       : TfrmMBConfirmacaoBaixa;
  
implementation

{$R *.dfm}

{ TfrmMBConfirmacaoBaixa }

procedure TfrmMBConfirmacaoBaixa.ApagarCheques;
var
   i : integer;
begin

   //libera a lista de cheques
   if ListaCheques <> nil then
   begin
      for i := ListaCheques.Count - 1 downto 0 do
      begin
         (ListaCheques.Items[i] as TMBCheque).apagarCheque();
         (ListaCheques.Items[i] as TMBCheque).setValorCampo('vl_cheque',
         (ListaCheques.Items[i] as TMBCheque).getValorCampo('vl_cheque_bkp'));
      end;

   end;   
end;

procedure TfrmMBConfirmacaoBaixa.btnCancelarClick(Sender: TObject);
begin
   //libera a lista de cheques
   Self.ApagarCheques();

   //Self.limparListaBaixaMensalidades();

   ListaChequesMensalidades := nil;
end;

procedure TfrmMBConfirmacaoBaixa.carregaGridCheques;
var
   i                          : integer;
   objFinChequesMensalidades  : TMBFinCheques;
   nr_total_cheques           : integer;
   total_linhas               : integer;
   total_colunas              : integer;
begin
   total_colunas              := 2;
   sgGridCheques.RowCount     := 2;
   sgGridCheques.FixedRows    := 1;
   sgGridCheques.ColCount     := total_colunas;
   sgGridCheques.Cols[0][0]   := 'Mensalidade';
   sgGridCheques.Cols[1][0]   := 'Nº Cheque';

   //tamanho das colunas
   sgGridCheques.ColWidths[0]  := 80;
   sgGridCheques.ColWidths[1]  := 80;

   if ListaChequesMensalidades <> nil then
   begin

      //informações para preparar a grid
      nr_total_cheques         := ListaChequesMensalidades.Count;
      total_linhas             := nr_total_cheques + 1; // +1 por que a primeira linha é fixa
      sgGridCheques.ColCount   := total_colunas;
      sgGridCheques.RowCount   := total_linhas;

      for i := 0 to nr_total_cheques - 1 do
      begin
         objFinChequesMensalidades := (ListaChequesMensalidades.items[i] as TMBFinCheques);

         sgGridCheques.Cols[0][i+1]  := objFinChequesMensalidades.getValorCampo('cd_mensalidade');
         sgGridCheques.Cols[1][i+1]  := objFinChequesMensalidades.getValorCampo('cd_cheque');
      end;
   end;

end;

procedure TfrmMBConfirmacaoBaixa.carregaGridMensalidades;
var
   i                       : integer;
   objMensalidadeBaixa     : TMBMensalidadeBaixa;
   nr_total_mensalidades   : integer;
   total_linhas            : integer;
   total_colunas           : integer;
begin
   total_colunas                   := 6;
   sgGridMensalidades.RowCount     := 2;
   sgGridMensalidades.FixedRows    := 1;
   sgGridMensalidades.ColCount     := total_colunas;
   sgGridMensalidades.Cols[0][0]   := 'Mensalidade';
   sgGridMensalidades.Cols[1][0]   := 'Parcela';
   sgGridMensalidades.Cols[2][0]   := 'Vencimento';
   sgGridMensalidades.Cols[3][0]   := 'Dinheiro';
   sgGridMensalidades.Cols[4][0]   := 'Cheque';
   sgGridMensalidades.Cols[5][0]   := 'Valor Pago';

   //tamanho das colunas
   sgGridMensalidades.ColWidths[0] := 80;
   sgGridMensalidades.ColWidths[1] := 65;
   sgGridMensalidades.ColWidths[2] := 90;
   sgGridMensalidades.ColWidths[3] := 80;
   sgGridMensalidades.ColWidths[4] := 80;
   sgGridMensalidades.ColWidths[5] := 80;

   if ListaMensalidadesBaixa <> nil then
   begin

      //informações para preparar a grid
      nr_total_mensalidades         := ListaMensalidadesBaixa.Count;
      total_linhas                  := nr_total_mensalidades + 1; // +1 por que a primeira linha é fixa
      sgGridMensalidades.ColCount   := total_colunas;
      sgGridMensalidades.RowCount   := total_linhas;

      for i := 0 to nr_total_mensalidades - 1 do
      begin
         objMensalidadeBaixa := (ListaMensalidadesBaixa.items[i] as TMBMensalidadeBaixa);

         sgGridMensalidades.Cols[0][i+1]  := objMensalidadeBaixa.getValorCampo('cd_mensalidade');
         sgGridMensalidades.Cols[1][i+1]  := objMensalidadeBaixa.getValorCampo('parcela');
         sgGridMensalidades.Cols[2][i+1]  := objMensalidadeBaixa.getValorCampo('datavencimento');
         sgGridMensalidades.Cols[3][i+1]  := objMensalidadeBaixa.getValorCampo('vl_pago_dinheiro');
         sgGridMensalidades.Cols[4][i+1]  := substituiCaracter(objMensalidadeBaixa.getValorCampo('vl_pago_cheque'),'.',',');
         sgGridMensalidades.Cols[5][i+1]  := objMensalidadeBaixa.getValorCampo('valorpago');
      end;
   end;

   //função que soma os valores dos cheques e os valores em dinheiro. Essa soma
   //tem que ser igual ao valor total da mensalidade, caso não seja o sistema
   //não permite a baixa
   if Self.validaValores() = false then
   begin
      btnConfirmar.Enabled := false;

      Mensagem('O sistema gerou uma inconsistência na distribuição dos ' +
      'valores. Por favor, Entre em contato com o suporte.', 'Atenção', MB_OK +
      MB_ICONERROR);
   end;

end;

procedure TfrmMBConfirmacaoBaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmMBConfirmacaoBaixa.FormShow(Sender: TObject);
begin
   Self.carregaGridMensalidades();
   Self.carregaGridCheques();
end;

function TfrmMBConfirmacaoBaixa.getValorTotal: double;
begin
   Result := Self.vl_total;
end;

procedure TfrmMBConfirmacaoBaixa.setListaCheques(objLista: TObjectList);
begin
   Self.ListaCheques := objLista;
end;

procedure TfrmMBConfirmacaoBaixa.setListaChequesMensalidades(
  objLista: TObjectList);
begin
   Self.ListaChequesMensalidades := objLista;
end;

procedure TfrmMBConfirmacaoBaixa.setListaMensalidades(objLista: TObjectList);
begin
   Self.ListaMensalidadesBaixa := objLista;
end;

procedure TfrmMBConfirmacaoBaixa.setValorTotal(valor: double);
begin
   Self.vl_total := valor;
end;

function TfrmMBConfirmacaoBaixa.substituiCaracter(valor, str_antigo,
  str_novo: string): string;
begin
   Result := StringReplace( valor, str_antigo, str_novo, [rfReplaceAll, rfIgnoreCase] );
end;

function TfrmMBConfirmacaoBaixa.validaValores() : Boolean ;
var
   i                    : integer;
   vl_cheque            : double;
   vl_dinheiro          : double;
   vl_soma              : double;
   vl_total_soma        : double;
   bResultado           : Boolean;
   objMensalidadeBaixa  : TMBMensalidadeBaixa;
begin
   bResultado     := true;
   vl_total_soma  := 0;

   for i := 0 to ListaMensalidadesBaixa.Count - 1 do
   begin
      objMensalidadeBaixa := (ListaMensalidadesBaixa.items[i] as TMBMensalidadeBaixa);

      vl_dinheiro :=  StrToFloat( objMensalidadeBaixa.getValorCampo('vl_pago_dinheiro')  );
      vl_cheque   :=  StrToFloat( objMensalidadeBaixa.getValorCampo('vl_pago_cheque')    );

      vl_soma     := RoundFloat( RoundFloat(vl_dinheiro, 2 ) + RoundFloat(vl_cheque, 2), 2 );

      vl_total_soma := RoundFloat(RoundFloat( vl_total_soma, 2) + RoundFloat( vl_soma, 2 ), 2)

   end;

   if RoundFloat(vl_total_soma, 2) <> RoundFloat(Self.getValorTotal(), 2) then
   begin
      bResultado := false;
   end;
   
   Result := bResultado;
end;

procedure TfrmMBConfirmacaoBaixa.limparListaBaixaMensalidades;
var
   i : integer;
begin

   //libera a lista de mensalidades a serem baixadas
   if ListaMensalidadesBaixa <> nil then
   begin
      for i := ListaMensalidadesBaixa.Count - 1 downto 0 do
      begin
         (ListaMensalidadesBaixa.Items[i] as TMBMensalidadeBaixa).Free;
      end;

      ListaMensalidadesBaixa := nil;
   end;
end;
end.
