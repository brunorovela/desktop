unit uCursosCopia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ExtCtrls, StdCtrls, Mask;

type
  TfrmCursosCopia = class(TForm)
    Panel3: TPanel;
    ToolBar4: TToolBar;
    btnConfirmar: TToolButton;
    ToolButton8: TToolButton;
    btnCancelar: TToolButton;
    imgBotoes: TImageList;
    Label1: TLabel;
    txtAnoSemestreCopia: TMaskEdit;
    UpDownCursos: TUpDown;
    Label2: TLabel;
    ckbCursos: TCheckBox;
    ckbTurmas: TCheckBox;
    ckbGradeCurricular: TCheckBox;
    ckbTurmasProfessores: TCheckBox;
    ckbHorarios: TCheckBox;
    ckbAtosOficiais: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCursosCopia: TfrmCursosCopia;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmCursosCopia.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal();
end;

procedure TfrmCursosCopia.btnConfirmarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal();
end;

procedure TfrmCursosCopia.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestreCopia.text := DM.incrementar_ano_semestre(txtAnoSemestreCopia.Text);
  end
  else
  begin
     txtAnoSemestreCopia.text := DM.decrementar_ano_semestre(txtAnoSemestreCopia.Text);
  end;

end;

end.

