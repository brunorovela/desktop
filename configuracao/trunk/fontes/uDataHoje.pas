unit uDataHoje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, General;

type
  TfrmDataHoje = class(TForm)
    Label1: TLabel;
    txt: TMaskEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataHoje: TfrmDataHoje;

implementation

uses uPrincipal;

{$R *.DFM}

procedure TfrmDataHoje.txtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DataHoje := StrToDate( txt.Text );
    Key := #0;
    Close;
  end;
end;

procedure TfrmDataHoje.FormShow(Sender: TObject);
begin
  DataHoje := Date;
  txt.Text := FormatDateTime( 'dd/mm/yyyy', DataHoje );
end;

procedure TfrmDataHoje.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmDataHoje.FormDestroy(Sender: TObject);
begin
   frmDataHoje := nil;
end;

procedure TfrmDataHoje.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

end.
