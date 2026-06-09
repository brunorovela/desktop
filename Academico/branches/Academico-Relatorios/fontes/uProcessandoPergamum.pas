unit uProcessandoPergamum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList, ToolWin;

type
  TfrmProcessandoPergamum = class(TForm)
    Panel1: TPanel;
    lbtitle: TLabel;
    Bar: TProgressBar;
    Label1: TLabel;
    lblRegistro: TLabel;
    toolAcademico: TToolBar;
    btAcad_Cancelar: TToolButton;
    imgListFoto: TImageList;
    procedure FormShow(Sender: TObject);
    procedure btAcad_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    paraExecucaoPergamum : Boolean;
    { Public declarations }
  end;

var
  frmProcessandoPergamum: TfrmProcessandoPergamum;

implementation

{$R *.dfm}

procedure TfrmProcessandoPergamum.btAcad_CancelarClick(Sender: TObject);
begin
   self.paraExecucaoPergamum := true;
end;

procedure TfrmProcessandoPergamum.FormShow(Sender: TObject);
begin
   self.paraExecucaoPergamum := false;
end;

end.
