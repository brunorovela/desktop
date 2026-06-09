unit uAddDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, DB, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmAddDocumento = class(TForm)
    Panel3: TPanel;
    Label30: TLabel;
    qyDoc: TUMZQuery;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    cbLista: TComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      FCodDoc: LongInt;
    { Private declarations }
  public
      function getCodDoc(): LongInt;
    { Public declarations }
  end;

var
  frmAddDocumento: TfrmAddDocumento;
  iCodDocs: array of Integer;

implementation

{$R *.dfm}
uses
   uDM;

procedure TfrmAddDocumento.FormShow(Sender: TObject);
var
   i: Integer;
begin
   qyDoc.Close();
   qyDoc.Open();
   qyDoc.First();

   cbLista.Clear();
   SetLength(iCodDocs, 0);
   i := 0;
   while not qyDoc.Eof do begin
      cbLista.AddItem(qyDoc.FieldByName('DOCUMENTO').AsString, nil);
      SetLength(iCodDocs, i+1);
      iCodDocs[i] := qyDoc.FieldByName('CODIGO').AsInteger;
      Inc(i);
      qyDoc.Next();
   end;
   qyDoc.Close();
end;

procedure TfrmAddDocumento.btnCancelarClick(Sender: TObject);
begin
   FCodDoc := 0;
   Self.ModalResult := mrCancel;
   Self.CloseModal();
end;

procedure TfrmAddDocumento.btnOkClick(Sender: TObject);
begin
   FCodDoc := iCodDocs[cbLista.ItemIndex];
   Self.ModalResult := mrOk;
   Self.CloseModal();
end;

function TfrmAddDocumento.getCodDoc(): LongInt;
begin
   Result := FCodDoc;
end;

end.

