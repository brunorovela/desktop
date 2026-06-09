unit uGrades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls;

type
  TfrmGrades = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnSair: TSpeedButton;
    btnPesquisar: TSpeedButton;
    Navigator: TDBNavigator;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrades: TfrmGrades;

implementation

{$R *.DFM}




procedure TfrmGrades.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGrades.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

end;

end.

