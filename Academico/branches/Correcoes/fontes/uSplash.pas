unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls;

type
  TfrmSplash = class(TForm)
    lblAguarde: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    pgbStatus: TProgressBar;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Processando(bStatus: Boolean = True);
    procedure setTexto(sTexto: string);
    procedure setTitulo(sTexto: string);
    procedure InitProgresso(vMin: LongInt; vMax: LongInt);
    procedure setProgresso(vValor: LongInt);
  end;

var
  frmSplash: TfrmSplash;
  frmSpl2: TfrmSplash;

implementation

{$R *.DFM}



procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;


procedure TfrmSplash.InitProgresso(vMin, vMax: Integer);
begin
   if (vMin <= vMax) then begin
      pgbStatus.Min := vMin;
      pgbStatus.Max := vMax;
      pgbStatus.Position := vMin;
      pgbStatus.Visible := True;
   end;
end;

procedure TfrmSplash.Processando(bStatus: Boolean = True);
begin
   if bStatus then begin

      if frmSpl2 = nil then begin
         frmSpl2 := TfrmSplash.Create(Self);
      end;
      frmSpl2.pgbStatus.Visible := False;
      frmSpl2.Position := poMainFormCenter;
      frmSpl2.FormStyle := fsNormal;
      frmSpl2.Label1.Caption := 'Criando aulas...';
      frmSpl2.Show();
   end
   else begin
      if frmSpl2 <> nil then begin
         FreeAndNil(frmSpl2);
      end;
   end;
end;

procedure TfrmSplash.setProgresso(vValor: Integer);
begin
   if ((vValor >= pgbStatus.Min) and (vValor <= pgbStatus.Max)) then begin
      pgbStatus.Position := vValor;
      Application.ProcessMessages();
   end;
end;

procedure TfrmSplash.setTexto(sTexto: string);
begin
   label1.Caption := sTexto;
   application.ProcessMessages();
end;

procedure TfrmSplash.setTitulo(sTexto: string);
begin
   lblAguarde.Caption := sTexto;
   application.ProcessMessages();
end;

end.







