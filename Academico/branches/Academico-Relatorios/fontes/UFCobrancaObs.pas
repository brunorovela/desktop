unit UFCobrancaObs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Buttons;

type
  TfrmCobrancaObs = class(TForm)
    bvlSep1: TBevel;
    pnlTitulo: TPanel;
    bvlSep2: TBevel;
    bvlSep3: TBevel;
    tlbAcoes: TToolBar;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ilAcoes: TImageList;
    bvlSep4: TBevel;
    pnlPainel: TPanel;
    reNovaObs: TRichEdit;
    sbBibNegrito: TSpeedButton;
    sbBibItalico: TSpeedButton;
    sbBibSublinhado: TSpeedButton;
    sbVermelho: TSpeedButton;
    lblNovaObs: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure reNovaObsChange(Sender: TObject);
    procedure sbVermelhoClick(Sender: TObject);
    procedure sbBibSublinhadoClick(Sender: TObject);
    procedure sbBibItalicoClick(Sender: TObject);
    procedure sbBibNegritoClick(Sender: TObject);
  private
      function GetPlainText: AnsiString;
      function GetRTF: AnsiString;
      procedure SetTitle(const Value: AnsiString);
    { Private declarations }
  public
    { Public declarations }
      property PlainText: AnsiString read GetPlainText;
      property RTF: AnsiString read GetRTF;
      property Title: AnsiString write SetTitle;
  end;

var
  frmCobrancaObs: TfrmCobrancaObs;

implementation

{$R *.dfm}

procedure TfrmCobrancaObs.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmCobrancaObs.btnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmCobrancaObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCobrancaObs.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrNone then
      CanClose := False;
end;

procedure TfrmCobrancaObs.FormCreate(Sender: TObject);
begin
   reNovaObs.Text := '';
   ModalResult := mrNone;
end;

procedure TfrmCobrancaObs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if btnSalvar.Enabled then
            btnSalvar.Click;
      VK_F6:
         if btnCancelar.Enabled then
            btnCancelar.Click;
   end;
end;

function TfrmCobrancaObs.GetPlainText: AnsiString;
begin
   Result := reNovaObs.Text;
end;

function TfrmCobrancaObs.GetRTF: AnsiString;
var
   StrStream: TStringStream;
begin
   StrStream := TStringStream.Create('');
   try
      reNovaObs.Lines.SaveToStream(StrStream);
      Result := StrStream.DataString;
   finally
      FreeAndNil(StrStream);
   end;
end;

procedure TfrmCobrancaObs.reNovaObsChange(Sender: TObject);
begin
   btnSalvar.Enabled := Trim(reNovaObs.Text) <> '';
end;

procedure TfrmCobrancaObs.sbBibItalicoClick(Sender: TObject);
begin
   if sbBibItalico.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style + [fsItalic];
   end;

   if not sbBibItalico.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsItalic];
   end;
end;

procedure TfrmCobrancaObs.sbBibNegritoClick(Sender: TObject);
begin
   if sbBibNegrito.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style + [fsBold];
   end;

   if not sbBibNegrito.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsBold];
   end;
end;

procedure TfrmCobrancaObs.sbBibSublinhadoClick(Sender: TObject);
begin
   if sbBibSublinhado.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style + [fsUnderline];
   end;

   if not sbBibSublinhado.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsUnderline];
   end;
end;

procedure TfrmCobrancaObs.sbVermelhoClick(Sender: TObject);
begin
   if sbVermelho.Down then
   begin
      reNovaObs.SelAttributes.Color := clRed;
   end;

   if not sbVermelho.Down then
   begin
      reNovaObs.SelAttributes.Color := clBlack;
   end;
end;

procedure TfrmCobrancaObs.SetTitle(const Value: AnsiString);
begin
   pnlTitulo.Caption := AnsiUpperCase(Value);
end;

end.
