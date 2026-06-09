unit uRelFrequencia2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, uDMDiario, uDM;

type
  TFormRelFrequencia2 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
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
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    Aula1: TQRDBText;
    Aula7: TQRDBText;
    Aula6: TQRDBText;
    Aula5: TQRDBText;
    Aula4: TQRDBText;
    Aula3: TQRDBText;
    Aula2: TQRDBText;
    Aula8: TQRDBText;
    Aula9: TQRDBText;
    Aula10: TQRDBText;
    Aula11: TQRDBText;
    Aula12: TQRDBText;
    Aula13: TQRDBText;
    Aula14: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    Aula16: TQRDBText;
    Aula17: TQRDBText;
    Aula18: TQRDBText;
    Aula19: TQRDBText;
    Aula20: TQRDBText;
    Aula21: TQRDBText;
    Aula22: TQRDBText;
    Aula15: TQRDBText;
    Aula23: TQRDBText;
    QRShape5: TQRShape;
    ColumnHeaderBand1: TQRBand;
    QRShape33: TQRShape;
    QRShape50: TQRShape;
    QRShape49: TQRShape;
    QRShape48: TQRShape;
    QRShape47: TQRShape;
    QRShape46: TQRShape;
    QRShape45: TQRShape;
    QRShape44: TQRShape;
    QRShape43: TQRShape;
    QRShape42: TQRShape;
    QRShape41: TQRShape;
    QRShape40: TQRShape;
    QRShape39: TQRShape;
    QRShape38: TQRShape;
    QRShape37: TQRShape;
    QRShape36: TQRShape;
    QRShape35: TQRShape;
    QRShape34: TQRShape;
    QRShape32: TQRShape;
    QRShape31: TQRShape;
    QRShape30: TQRShape;
    QRShape29: TQRShape;
    QRShape28: TQRShape;
    QRShape27: TQRShape;
    QRShape26: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel19: TQRLabel;
    lbDia1: TQRLabel;
    lbDia2: TQRLabel;
    lbDia3: TQRLabel;
    lbDia4: TQRLabel;
    lbDia5: TQRLabel;
    lbDia6: TQRLabel;
    lbDia7: TQRLabel;
    lbDia8: TQRLabel;
    lbDia9: TQRLabel;
    lbDia10: TQRLabel;
    lbDia11: TQRLabel;
    lbDia12: TQRLabel;
    lbDia13: TQRLabel;
    lbDia14: TQRLabel;
    lbDia15: TQRLabel;
    lbDia16: TQRLabel;
    lbDia17: TQRLabel;
    lbDia18: TQRLabel;
    lbDia19: TQRLabel;
    lbDia20: TQRLabel;
    lbDia21: TQRLabel;
    lbDia22: TQRLabel;
    lbDia23: TQRLabel;
    QRLabel25: TQRLabel;
    Shape111: TQRShape;
    Mes1: TQRLabel;
    Mes2: TQRLabel;
    Mes3: TQRLabel;
    mes4: TQRLabel;
    Mes5: TQRLabel;
    Mes6: TQRLabel;
    Mes7: TQRLabel;
    Mes8: TQRLabel;
    Mes9: TQRLabel;
    Mes10: TQRLabel;
    Mes11: TQRLabel;
    Mes12: TQRLabel;
    Mes13: TQRLabel;
    Mes14: TQRLabel;
    Mes15: TQRLabel;
    Mes16: TQRLabel;
    Mes17: TQRLabel;
    Mes18: TQRLabel;
    Mes19: TQRLabel;
    Mes20: TQRLabel;
    Mes21: TQRLabel;
    Mes22: TQRLabel;
    Mes23: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRImage1: TQRImage;
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelFrequencia2: TFormRelFrequencia2;
  Repete : Boolean;

implementation

{$R *.DFM}

procedure TFormRelFrequencia2.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var n : smallint;
    mes : String;
    Atual : smallInt;
begin
   mes := '';
   DMDiario.qAulas.First;
   DMDiario.qAulas.MoveBy(23);
   Atual := 0;
   For n := 41 To 63 do  // 23 Aulas, começa pelo componente 43
   Begin
     if not DMDiario.qAulas.Eof Then
       Begin
          if mes <> Copy(FormatDateTime('dd/mm/yy',DmDiario.qAulasDATA.AsDateTime),4,2) Then
          Begin
              TQRLabel(Components[66+Atual]).Caption := Copy(FormatDateTime('dd/mm/yy',DmDiario.qAulasDATA.AsDateTime),4,2); // 68 é o número do Componente Inicial
              mes := Copy(FormatDateTime('dd/mm/yy',DmDiario.qAulasDATA.AsDateTime),4,2);
          End
          Else
          Begin
             TQRLabel(Components[66+Atual]).Caption := ' ';
             // Não Imprimir
          End;

          TQRLabel(Components[n]).Caption := Copy(FormatDateTime('dd/mm/yy',DmDiario.qAulasDATA.AsDateTime),1,2);
          DMDiario.qAulas.Next;
       End
     Else
     Begin
        TQRLabel(Components[n]).Caption := '  ';
        TQRLabel(Components[66+Atual]).Caption := ' ';
     End;
     Atual := Atual + 1;
   End;

end;

procedure TFormRelFrequencia2.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if (DMDiario.qFrequencia.RecordCount = 43) or
      (DMDiario.qFrequencia.RecordCount = 44) or
      (DMDiario.qFrequencia.RecordCount = 45)  Then
         PrintBand := False
   Else
      PrintBand := True;
end;

procedure TFormRelFrequencia2.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value := DMDiario.qTurmasTURMA.AsString +  ' - ' + DMDiario.qTurmasANOSEMESTRE.AsString
           + ' - Bim ' + DMDiario.qTurmasBIMESTRE.AsString;
end;

end.

