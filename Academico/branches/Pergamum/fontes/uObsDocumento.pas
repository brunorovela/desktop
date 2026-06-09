unit uObsDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Buttons ;

type
  TfrmObSDoc = class(TForm)
    Bevel1: TBevel;
    lbDoc: TLabel;
    eDoc: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObSDoc: TfrmObSDoc;

implementation

uses uDM;

{$R *.DFM}

procedure TfrmObSDoc.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   eDoc.SetFocus;
end;

end.

