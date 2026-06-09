unit uCaixas_Abertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  tOperacao = (Abertura, Fechamento);
  
  Tfrm_Caixas_Abertura = class(TForm)
    lbDataTitulo: TLabel;
    lbData: TLabel;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lbSaldoTitulo: TLabel;
    lbSaldo: TLabel;
    Label4: TLabel;
    lbConta: TLabel;
    txtMsg: TLabel;
    txtMsg2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    cSaldo : Currency;
    sConta : String;
    dData  : TDateTime;
    tOp    : tOperacao;   
  end;

var
  frm_Caixas_Abertura: Tfrm_Caixas_Abertura;

implementation

{$R *.dfm}

procedure Tfrm_Caixas_Abertura.FormShow(Sender: TObject);
begin
    case tOp of

       Abertura : begin

            Self.Caption := 'Abertura de Caixa';
            lbDataTitulo.Caption := 'Data de Abertura: ';
            lbSaldoTitulo.Caption := 'Saldo inicial: ';
            txtMsg.Visible := False;
            txtMsg2.Visible := FAlse;

          end;

       Fechamento : begin

            Self.Caption := 'Fechamento de Caixa';
            lbDataTitulo.Caption := 'Data de Fechamento: ';
            lbSaldoTitulo.Caption := 'Saldo Final: ';
            txtMsg.Visible := True;
            txtMsg2.Visible := True;


          end;
    end;

    lbConta.Caption := sConta;
    lbData.Caption := FormatDateTime('dd/mm/yyyy hh:mm', dData);
    lbSaldo.Caption := FloatToStrF(cSaldo, ffNumber, 12, 2);

end;

procedure Tfrm_Caixas_Abertura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.

