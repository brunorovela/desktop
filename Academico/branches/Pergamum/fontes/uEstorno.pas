unit uEstorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmEstorno = class(TForm)
    pnlEstorno: TPanel;
    pnTopo: TPanel;
    pnlPrincipal: TPanel;
    pnlBotton: TPanel;
    meMotivo: TMemo;
    btnSalvar: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    motivoEstorno : string;
  end;

var
  frmEstorno: TfrmEstorno;

implementation

uses General;

{$R *.dfm}

procedure TfrmEstorno.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   MSG_MOTIVO_EM_BRANCO =
      'O preenchimento do campo Observações é obrigatório.';
begin
   if Length(trim(meMotivo.Text)) = 0 then
   begin
      Mensagem( MSG_MOTIVO_EM_BRANCO, '', MB_OK + MB_ICONEXCLAMATION, Handle );
      CanClose := False;
      meMotivo.SetFocus;
   end;
end;

procedure TfrmEstorno.SalvarClick(Sender: TObject);
begin
   motivoEstorno := meMotivo.Text;
   Close;
end;

end.
