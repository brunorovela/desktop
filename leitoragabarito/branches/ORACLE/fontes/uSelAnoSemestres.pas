unit uSelAnoSemestres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, uDM , Main;

type
  TfrmSelAnoSemestres = class(TForm)
    pnlPrincipal: TPanel;
    UpDown3: TUpDown;
    mkAnoSemestre: TMaskEdit;
    lblTitulo: TLabel;
    Cancelar: TButton;
    Button1: TButton;
    procedure CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure ConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iAnoSemestre : Integer;
  end;

var
  frmSelAnoSemestres: TfrmSelAnoSemestres;

implementation

{$R *.dfm}

procedure TfrmSelAnoSemestres.CancelarClick(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.Close;
end;

procedure TfrmSelAnoSemestres.ConfirmarClick(Sender: TObject);
begin
   Self.ModalResult := mrOk;
   iAnoSemestre := StrToInt(mkAnoSemestre.text);
   Close;
end;

procedure TfrmSelAnoSemestres.FormShow(Sender: TObject);
begin
   mkAnoSemestre.Text := IntToStr(ano_semestre);
end;

procedure TfrmSelAnoSemestres.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      mkAnoSemestre.text := DM.incrementar_ano_semestre(mkAnoSemestre.Text);
   end
   else
   begin
      mkAnoSemestre.text := DM.decrementar_ano_semestre(mkAnoSemestre.Text);
   end;
end;

end.
