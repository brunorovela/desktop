unit uBiblioMotivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
  TfmMotivos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    pnlUsuario: TPanel;
    BitBtn1: TBitBtn;
    btnCancelar: TBitBtn;
    txtMotivo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMotivos: TfmMotivos;

implementation

{$R *.dfm}

procedure TfmMotivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmMotivos.BitBtn1Click(Sender: TObject);
var
  CanClose : boolean;
begin

  if Trim( txtMotivo.Text ) <> '' then
  begin
    ModalResult := mrOK;
    CanClose := True;
  end
  else
  begin
    Mensagem( 'Motivo inválido.', Application.Title, MB_OK + MB_ICONSTOP );
    ModalResult := mrCancel;
    CanClose := False;
  end;

end;

end.

