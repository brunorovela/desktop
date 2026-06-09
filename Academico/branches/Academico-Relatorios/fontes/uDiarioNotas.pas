unit uDiarioNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, uDMDIARIO, Qrctrls;

type
  TFormDiarioNotas = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape25: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape26: TQRShape;
    QRImage1: TQRImage;
    ChildBand1: TQRChildBand;
    QRLabel22: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape27: TQRShape;
    qrNota: TQRMemo;
    qrData: TQRMemo;
    qrConteudo: TQRMemo;
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDiarioNotas: TFormDiarioNotas;

implementation

uses uDM;

{$R *.DFM}

procedure TFormDiarioNotas.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  Value := DMDIARIO.qTurmasTURMA.AsString +  ' - ' + DMDIARIO.qTurmasANOSEMESTRE.AsString
           + ' - Bim ' + DMDIARIO.qTurmasBIMESTRE.AsString;
end;

procedure TFormDiarioNotas.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrNota.Lines.Clear;
   qrData.Lines.Clear;
   qrConteudo.Lines.Clear;
   DMDIARIO.qProvas.First;
   While not DMDIARIO.qProvas.Eof do Begin
       qrConteudo.Lines.Add(DMDIARIO.qProvasASSUNTO.AsString);
       qrNota.Lines.Add('Nota ' + DMDIARIO.qProvasNRO_NOTA.AsString);
       qrData.Lines.Add(DMDIARIO.qProvasDATA.AsString);

       while qrConteudo.Height > QrNota.Height DO Begin
          qrNota.Lines.Add(' ');
          qrData.Lines.Add(' ');
       End;

       DMDIARIO.qProvas.Next;
   End;

   if QuickRep1.PageNumber = 1 Then
       QuickRep1.NewPage;
end;

end.

