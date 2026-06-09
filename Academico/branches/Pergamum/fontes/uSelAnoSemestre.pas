unit uSelAnoSemestre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Mask, Buttons, ImgList;

type
  TuFrmSelAnosemestre = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    edAnosemestre: TMaskEdit;
    UpDown1: TUpDown;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    pnTitulo: TPanel;
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edAnosemestreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmSelAnosemestre: TuFrmSelAnosemestre;

implementation
   uses
      uDM;
{$R *.dfm}

procedure TuFrmSelAnosemestre.BitBtn1Click(Sender: TObject);
begin

   if Length(edAnosemestre.Text) <> 5 then
   begin
      ShowMessage('Informe um anosemestre válido');
      Abort;
   end;

   Self.ModalResult := mrOk;
end;

procedure TuFrmSelAnosemestre.BitBtn2Click(Sender: TObject);
begin
   self.ModalResult := mrCancel;
end;

procedure TuFrmSelAnosemestre.edAnosemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not ( Key IN ['0'..'9', Chr(8), Chr(9)] ) then
   begin
      Key := #0;
   end;
end;

procedure TuFrmSelAnosemestre.FormShow(Sender: TObject);
begin
   edAnosemestre.Text := DM.variavel_parametro('estuda_reserv_matric_anosem_atual');
end;

procedure TuFrmSelAnosemestre.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      edAnosemestre.Text := ( DM.incrementar_ano_semestre( edAnosemestre.Text ) );
   end else begin
      edAnosemestre.Text := ( DM.decrementar_ano_semestre( edAnosemestre.Text ) );
   end;
end;

end.
