unit uFCadRepasseJustificativa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, ToolWin, ImgList, ExtCtrls;

type
  TfrmRepasseJustificativa = class(TForm)
    pnlTop: TPanel;
    ImageList1: TImageList;
    toolAcoes: TToolBar;
    ToolButton22: TToolButton;
    btnSalvar: TToolButton;
    ToolButton35: TToolButton;
    pnPrincipal: TPanel;
    pnlInstrucoes: TPanel;
    dbmObservacao: TDBMemo;
    lblDeclaracao: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbmObservacaoChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    frmPai : TForm;
  end;

var
  frmRepasseJustificativa: TfrmRepasseJustificativa;

implementation

uses
   uFGerarRepasseMensal;

{$R *.dfm}

procedure TfrmRepasseJustificativa.btnSalvarClick(Sender: TObject);
begin
   Close;
   TfrmGerarRepasse(frmPai).Salvar;
end;

procedure TfrmRepasseJustificativa.dbmObservacaoChange(Sender: TObject);
begin
   btnSalvar.Enabled :=  true;
end;

procedure TfrmRepasseJustificativa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = vk_F5) then
   begin
      btnSalvar.Click;

   end;
end;

procedure TfrmRepasseJustificativa.FormShow(Sender: TObject);
begin
   dbmObservacao.DataSource := TfrmGerarRepasse(frmPai).dsRepasses;
   dbmObservacao.DataField  := 'ds_observacao';
   if dbmObservacao.Text = '' then
   begin
      btnSalvar.Enabled :=  False;
   end;
end;

end.
