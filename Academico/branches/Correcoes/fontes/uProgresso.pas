unit uProgresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmProg = class(TForm)
    pgbProgresso: TProgressBar;
    lblDesc: TLabel;
  private
    hwd: Pointer;
    { Private declarations }
  public
    procedure SetMin(iVal: Integer);
    procedure SetMax(iVal: Integer);
    procedure SetAtual(iVal: Integer);
    procedure SetText(sTexto: string);
    procedure SetStatus(iVal: Integer; sTexto: string = '');
    procedure NovaBarra(sTitulo: string);
    procedure SetTitulo(sTexto: string);
    procedure FechaBarra();

    function getMax(): Integer;
    function getAtual(): Integer;
    function getMin(): Integer;
    function getText(): string;
    function getTitulo(): string;

    { Public declarations }
  end;

var
  frmProg: TfrmProg;

implementation

{$R *.dfm}
uses
   Main;

procedure TfrmProg.SetMax(iVal: Integer);
begin
  pgbProgresso.Max := iVal;
end;

procedure TfrmProg.SetMin(iVal: Integer);
begin
  pgbProgresso.Min := iVal;
end;

procedure TfrmProg.SetStatus(iVal: Integer; sTexto: string);
begin
  Self.SetAtual(iVal);
  Self.SetText(sTexto);
  Application.ProcessMessages;
end;

procedure TfrmProg.SetAtual(iVal: Integer);
begin
  if ((iVal >= pgbProgresso.Min) and (iVal <= pgbProgresso.Max)) then begin

    pgbProgresso.Position := iVal;
    Application.ProcessMessages;
  end;
end;

procedure TfrmProg.SetText(sTexto: string);
begin
  if (Length(sTexto) > 0) then begin
    lblDesc.Caption := sTexto;
    Application.ProcessMessages;
  end;
end;

procedure TfrmProg.NovaBarra(sTitulo: string);
begin
  hwd := DisableTaskWindows(Self.Handle);
  SetMin(0);
  SetMax(1);
  SetTitulo(sTitulo);
  SetAtual(0);
  Self.Show();
end;

procedure TfrmProg.SetTitulo(sTexto: string);
begin
  if (Length(sTexto) > 0) then begin
    Self.Caption := sTexto;
    Application.ProcessMessages;
  end;  
end;

procedure TfrmProg.FechaBarra();
begin
  Self.Close();
  EnableTaskWindows(hwd);
  PrincipalForm.SetFocus();
end;

function TfrmProg.getMin: Integer;
begin
   Result := pgbProgresso.Min;
end;

function TfrmProg.getAtual: Integer;
begin
   Result := pgbProgresso.Position;
end;

function TfrmProg.getText: string;
begin
   Result := lblDesc.Caption;
end;

function TfrmProg.getMax: Integer;
begin
   Result := pgbProgresso.Max;
end;

function TfrmProg.getTitulo: string;
begin
   Result := Self.Caption;
end;

end.
