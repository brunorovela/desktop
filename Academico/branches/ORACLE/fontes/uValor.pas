unit uValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmValor = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    EditValor: TEdit;
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValor: TfrmValor;

implementation

uses uMatricular, uDM;

{$R *.DFM}


procedure TfrmValor.EditValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TfrmValor.EditValorEnter(Sender: TObject);
begin
  btnOk.Enabled := True;
  btnCancel.Enabled := True;
end;

procedure TfrmValor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i : Integer;
begin
  i := frmMatricular.lst.ItemIndex;
    try
    if ModalResult = mrCancel then
    begin
      CanClose := True;
      Exit;
    end;
    frmMatricular.ArrayValorExtra[i] :=
      frmMatricular.ArrayValorExtra[i] + StrToFloat( EditValor.Text );
    CanClose := True;
   except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      EditValor.SetFocus;
      EditValor.SelectAll;
      CanClose := False;
   end;

end;

procedure TfrmValor.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  EditValor.Text := '';
  EditValor.SelectAll;
  EditValor.SetFocus;
end;

end.

