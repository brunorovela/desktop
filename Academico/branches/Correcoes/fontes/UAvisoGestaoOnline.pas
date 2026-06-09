unit UAvisoGestaoOnline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, ZDataset, UZDataset, uDM;

type
  TfrmAvisoGestaoOnline = class(TForm)
    Image1: TImage;
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvisoGestaoOnline: TfrmAvisoGestaoOnline;

implementation

uses DB;

{$R *.dfm}

procedure TfrmAvisoGestaoOnline.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAvisoGestaoOnline.FormShow(Sender: TObject);
var
   qyNuTexto: TUMZQuery;
begin
   DM.CriarConsulta(qyNuTexto);
   qyNuTexto.SQL.Text := 'select me_texto from nu_textos where ds_chave  = ''Unimestre.Desktop.Mensagem'' and sn_ativo = 1';
   qyNuTexto.Open;

   RichEdit1.Text := qyNuTexto.FieldByName('me_texto').AsString;

   Image1.Visible := RichEdit1.Text = '';
   RichEdit1.Visible := not Image1.Visible;
end;

end.
