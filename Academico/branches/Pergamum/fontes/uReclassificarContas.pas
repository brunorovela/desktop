unit uReclassificarContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, UMEditMonetario, Mask, StdCtrls, Tabs,
  Grids, ImgList;

type
  TfrmReclassificarContas = class(TForm)
    pnTitulo: TPanel;
    pnBotoes: TPanel;
    pnCabecalho: TPanel;
    txtCodigoMovimento: TEdit;
    MaskEdit1: TMaskEdit;
    UMEditMonetario1: TUMEditMonetario;
    btnBuscar: TSpeedButton;
    lbCodigoMovimento: TLabel;
    Label1: TLabel;
    lbData: TLabel;
    lbValorTotal: TLabel;
    tsControleAbas: TTabSet;
    StringGrid1: TStringGrid;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    imgBotoes: TImageList;
    procedure tsControleAbasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReclassificarContas: TfrmReclassificarContas;

implementation

{$R *.dfm}

procedure TfrmReclassificarContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmReclassificarContas.tsControleAbasClick(Sender: TObject);
begin
   showmessage(inttostr(tsControleAbas.TabIndex));
end;

end.
