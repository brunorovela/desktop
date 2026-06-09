unit uAbertura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
  TfrmAbertura = class(TForm)
    lbl1: TLabel;
    txt: TMaskEdit;
    txtValorAbertura: TEdit;
    lbl2: TLabel;
    Label1: TLabel;
    txtNomeCaixa: TEdit;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure txtValorAberturaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbertura: TfrmAbertura;

implementation

uses uDM;

{$R *.DFM}


procedure TfrmAbertura.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  txt.Text := FormatDateTime( 'dd/mm/yyyy hh:nn:ss', Now );
  txtValorAbertura.Text := '';
end;


procedure TfrmAbertura.txtValorAberturaKeyPress(Sender: TObject;
  var Key: Char);

  begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin
    try
      if StrToFloat( txtValorAbertura.Text ) >= 0 then Close;
    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      txtValorAbertura.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmAbertura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    try
      if frmAbertura.ModalResult = mrOk then
      Begin
         if StrToFloat( txtValorAbertura.Text ) >= 0 then 
	   CanClose := True;
      End
    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      txtValorAbertura.SetFocus;
      CanClose := False;
    end;
end;

end.

