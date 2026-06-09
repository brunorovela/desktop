unit uAMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, db, dbTables;

type
  TfrmAMensagem = class(TForm)
    Panel1: TPanel;
    btnFechar: TSpeedButton;
    RichEdit: TDBRichEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAMensagem: TfrmAMensagem;

implementation

uses uMensagens;

{$R *.DFM}


procedure TfrmAMensagem.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAMensagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmAMensagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMensagens.tblMensagens.State in [dsInsert, dsEdit] then
    frmMensagens.tblMensagens.Post;
  Action := caFree;
end;

end.

