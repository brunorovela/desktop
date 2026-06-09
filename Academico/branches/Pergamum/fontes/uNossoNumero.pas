unit uNossoNumero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfrmNossoNumero = class(TForm)
    pcBusca: TPageControl;
    tsNN: TTabSheet;
    tsDeposito: TTabSheet;
    tsCodigo: TTabSheet;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    txtNossoNumero: TEdit;
    Label2: TLabel;
    txtTalaoDeposito: TEdit;
    Label3: TLabel;
    txtCodigoBarras: TEdit;
    procedure txtNossoNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNossoNumero: TfrmNossoNumero;

implementation

uses uDM;

{$R *.DFM}

procedure TfrmNossoNumero.txtNossoNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin

     Close();
     Key := #0;

  end;

end;

procedure TfrmNossoNumero.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE : Close();
  end;
end;


procedure TfrmNossoNumero.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  case pcBusca.ActivePageIndex of
     0 : txtNossoNumero.SetFocus();
     1 : txtTalaoDeposito.SetFocus();
     2 : txtCodigoBarras.SetFocus();
  end;

end;

end.

