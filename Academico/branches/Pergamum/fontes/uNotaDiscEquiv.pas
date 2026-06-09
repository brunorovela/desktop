unit uNotaDiscEquiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, General;

type
  TfrmNotaDiscEquiv = class(TForm)
    Bevel1: TBevel;
    lbAluno: TLabel;
    Label2: TLabel;
    eNota: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbDisc: TLabel;
    lbTurmaMatricula: TLabel;
    Label1: TLabel;
    eConceito: TEdit;
    eFrequencia: TEdit;
    Label3: TLabel;
    procedure eFrequenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure eNotaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotaDiscEquiv: TfrmNotaDiscEquiv;

implementation

uses uDM;

{$R *.DFM}

procedure TfrmNotaDiscEquiv.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  if (eConceito.Text <> '') then begin
   eConceito.SetFocus;
  end
  else begin
   eNota.SetFocus;
  end;

end;

procedure TfrmNotaDiscEquiv.eFrequenciaKeyPress(Sender: TObject; var Key: Char);
begin

   if not (key in ['0'..'9']) then
       key := #0;

end;

procedure TfrmNotaDiscEquiv.eNotaKeyPress(Sender: TObject; var Key: Char);
begin

    if not (key in ['0'..'9', #8, ',' , '.']) then
       key := #0;

    if key = '.' then
       key := ',';

end;

end.

