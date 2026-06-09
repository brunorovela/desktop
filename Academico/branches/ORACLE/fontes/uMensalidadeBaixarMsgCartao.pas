unit uMensalidadeBaixarMsgCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmMensalidadeBaixaMsgCartao = class(TForm)
    tempo_fechar: TTimer;
    lbMensagem: TLabel;
    procedure FormShow(Sender: TObject);
    procedure tempo_fecharTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure setMensagem( msg: string );
    procedure setSegundos( segundos: integer );
    { Public declarations }
  end;

var
  frmMensalidadeBaixaMsgCartao: TfrmMensalidadeBaixaMsgCartao;

implementation

{$R *.dfm}

procedure TfrmMensalidadeBaixaMsgCartao.FormShow(Sender: TObject);
begin
   tempo_fechar.Enabled := true;
end;

procedure TfrmMensalidadeBaixaMsgCartao.setMensagem(msg: string);
begin
   lbMensagem.Caption := msg;
end;

procedure TfrmMensalidadeBaixaMsgCartao.setSegundos(segundos: integer);
begin
   tempo_fechar.Interval := (segundos * 1000);
end;

procedure TfrmMensalidadeBaixaMsgCartao.tempo_fecharTimer(Sender: TObject);
begin
   tempo_fechar.Enabled := false;
   Self.Close;
end;

end.
