unit uDataSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  TfrmDataSaida = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataSaida: TfrmDataSaida;

implementation

uses uMatriculas, uDM;

{$R *.DFM}


procedure TfrmDataSaida.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Close;
  end;
end;

procedure TfrmDataSaida.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

end;

end.

