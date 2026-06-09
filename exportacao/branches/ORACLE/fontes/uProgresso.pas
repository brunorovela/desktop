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
       { Private declarations }
   protected
   public
   published
    { Public declarations }
  end;
  TProgresso = class(TObject)
  private
    Form: TfrmProg;
    ASilencioso: Boolean;
    hwd: Pointer;

    procedure setSilencioso(bValor: Boolean);
    function getSilencioso(): Boolean;
    { Private declarations }
  protected
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

    property Silencioso: Boolean read getSilencioso write setSilencioso;
    constructor Create;
    destructor Destroy; override;
  published

  end;

var
  frmProg: TfrmProg;

implementation

{$R *.dfm}
uses
   uMain;

procedure TProgresso.SetMax(iVal: Integer);
begin
   if ASilencioso then Exit;
  Form.pgbProgresso.Max := iVal;
end;

procedure TProgresso.SetMin(iVal: Integer);
begin
   if ASilencioso then Exit;
  Form.pgbProgresso.Min := iVal;
end;

procedure TProgresso.SetStatus(iVal: Integer; sTexto: string);
begin
   if ASilencioso then Exit;
  Self.SetAtual(iVal);
  Self.SetText(sTexto);
  Application.ProcessMessages;
end;

procedure TProgresso.SetAtual(iVal: Integer);
begin
  if ASilencioso then Exit;
  if ((iVal >= Form.pgbProgresso.Min) and (iVal <= Form.pgbProgresso.Max)) then begin

    Form.pgbProgresso.Position := iVal;
    Application.ProcessMessages;
  end;
end;

procedure TProgresso.SetText(sTexto: string);
begin
  if ASilencioso then Exit;
  if (Length(sTexto) > 0) then begin
    Form.lblDesc.Caption := sTexto;
    Application.ProcessMessages;
  end;
end;

procedure TProgresso.NovaBarra(sTitulo: string);
begin
  if ASilencioso then Exit;
  Form := TfrmProg.Create(Application);
  hwd := DisableTaskWindows(Form.Handle);
  SetMin(0);
  SetMax(1);
  SetTitulo(sTitulo);
  SetAtual(0);
  Form.Show();
end;

procedure TProgresso.SetTitulo(sTexto: string);
begin
  if ASilencioso then Exit;
  if (Length(sTexto) > 0) then begin
    Form.Caption := sTexto;
    Application.ProcessMessages;
  end;  
end;

procedure TProgresso.FechaBarra();
begin
  Form.Close();
  FreeANdNil(Form);
  EnableTaskWindows(hwd);
  if (fMain.Visible) then begin
    fMain.SetFocus();
  end;
end;

function TProgresso.getMin: Integer;
begin
   Result := 0;
   if ASilencioso then Exit;
   Result := Form.pgbProgresso.Min;
end;

function TProgresso.getAtual: Integer;
begin
   Result := 0;
   if ASilencioso then Exit;
   Result := Form.pgbProgresso.Position;
end;

function TProgresso.getText: string;
begin
   Result := '';
   if ASilencioso then Exit;
   Result := Form.lblDesc.Caption;
end;

function TProgresso.getMax: Integer;
begin
   Result := 0;
   if ASilencioso then Exit;
   Result := Form.pgbProgresso.Max;
end;

function TProgresso.getTitulo: string;
begin
   Result := '';
   if ASilencioso then Exit;
   Result := Form.Caption;
end;

function TProgresso.getSilencioso: Boolean;
begin
   Result := ASilencioso;
end;

procedure TProgresso.setSilencioso(bValor: Boolean);
begin
   ASilencioso := bValor;
end;

constructor TProgresso.Create;
begin
   inherited;
end;

destructor TProgresso.Destroy;
begin

  inherited;
end;

end.
