unit uRelConteudo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, uDMDIARIO, Qrctrls;

type
  TFormRelConteudo = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText14: TQRDBText;
    QRImage1: TQRImage;
    procedure QRLabel5Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelConteudo: TFormRelConteudo;

implementation

uses uDM;

{$R *.DFM}

procedure TFormRelConteudo.QRLabel5Print(sender: TObject;
  var Value: String);
begin
   Value := DMDIARIO.qTurmasTURMA.AsString +  ' - ' + DMDIARIO.qTurmasANOSEMESTRE.AsString
           + ' - Bim ' + DMDIARIO.qTurmasBIMESTRE.AsString;

end;

end.

