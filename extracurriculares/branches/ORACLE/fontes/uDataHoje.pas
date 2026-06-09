unit uDataHoje;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask;

type
   TfrmDataHoje = class(TForm)
      Label1: TLabel;
      txt: TMaskEdit;
      procedure txtKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
   end;

var
   frmDataHoje: TfrmDataHoje;

implementation

uses Main;

{$R *.DFM}

procedure TfrmDataHoje.txtKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      DataHoje := StrToDate(txt.Text);
      Key := #0;
      Close;
   end;
end;

procedure TfrmDataHoje.FormShow(Sender: TObject);
begin
   DataHoje := Date;
   txt.Text := FormatDateTime('dd/mm/yyyy', DataHoje);
end;

end.
