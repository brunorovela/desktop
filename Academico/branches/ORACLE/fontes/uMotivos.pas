unit uMotivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, DB;

type
  TfrmMotivos = class(TForm)
    Label1: TLabel;
    pnlUsuario: TPanel;
    BitBtn1: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    txtMotivo: TDBMemo;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMotivos: TfrmMotivos;

implementation

uses Main, uMensalidades, uDM;

{$R *.DFM}

procedure TfrmMotivos.btnCancelarClick(Sender: TObject);
begin
    Dm.tblMotivos.Cancel();
end;

procedure TfrmMotivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrmMotivos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if (Dm.tblMotivos.State in [dsInsert, dsEdit]) then begin
     if  ( Trim(txtMotivo.Text)  = '') then  begin
          Mensagem( 'Por favor, preencha o motivo da saída do aluno.', Application.Title, MB_OK + MB_ICONSTOP );
          ModalResult := mrCancel;
          CanClose := False;
     end else begin
          DM.tblMotivos.Post();
          ModalResult := mrOk;
          CanClose := True;
     end;
  end else begin
     ModalResult := mrOk;
    CanClose := True;
  end;

end;

end.

