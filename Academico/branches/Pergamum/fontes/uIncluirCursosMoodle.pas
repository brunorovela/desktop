unit uIncluirCursosMoodle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, ExtCtrls, uDM,  DB,
  ZAbstractRODataset, ZAbstractDataset,UZDataset,BDE, Buttons, Mask, DBCtrls;

type
  TfrmIncluirCursosMoodle = class(TForm)
    Panel1: TPanel;
    ImageList2: TImageList;
    lbleDescricao: TLabeledEdit;
    lbleSigla: TLabeledEdit;
    lbleCodigoKonviva: TLabeledEdit;
    chkKonviva: TCheckBox;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    procedure chkKonvivaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   {}
  end;

var
  frmIncluirCursosMoodle: TfrmIncluirCursosMoodle;

implementation

Uses
   uCursosMoodle;
   
{$R *.dfm}

procedure TfrmIncluirCursosMoodle.chkKonvivaClick(Sender: TObject);
begin
   lbleCodigoKonviva.Enabled := chkKonviva.Checked;
end;

procedure TfrmIncluirCursosMoodle.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   MESSAGE = 'O preenchimento dos campos "Descrição" é "Sigla" é obrigatório.'#13'Se a opção "Enviar este curso para o ambiente EAD do Konviva" está marcada, então o preenchimento do campo "Código Konviva" também é obrigatório.';
begin
   CanClose :=
      (ModalResult = mrCancel) or
      (
         (Trim(lbleDescricao.Text) <> EmptyStr) and
         (Trim(lbleSigla.Text) <> EmptyStr) and
         ((Trim(lbleCodigoKonviva.Text) <> EmptyStr) or (not chkKonviva.Checked))
      );

   if not CanClose then
   begin
      MessageDlg(MESSAGE, mtInformation, [mbOK], 0);
   end;
end;

procedure TfrmIncluirCursosMoodle.FormShow(Sender: TObject);
begin
   lbleDescricao.SetFocus;
end;

end.
