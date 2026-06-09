{
#TIT= Data do dia atual
#OBJ= Confirmar a data do dia
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uDataHoje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmDataHoje = class(TForm)
    Label1: TLabel;
    txt: TMaskEdit;
    procedure txtKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Main;

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

procedure TfrmDataHoje.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

end.
