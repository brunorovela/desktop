unit uErro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tfrm_Erro = class(TForm)
    Label3: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    btnDetalhes: TBitBtn;
    Label4: TLabel;
    lbErro: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Erro : String;
  end;

var
  frm_Erro: Tfrm_Erro;

implementation

{$R *.dfm}

procedure Tfrm_Erro.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Erro.FormShow(Sender: TObject);
begin
   btnDetalhes.Caption := '>> Detalhes';
   frm_Erro.Height := 200;
end;

procedure Tfrm_Erro.btnDetalhesClick(Sender: TObject);
begin
   if btnDetalhes.Caption = '>> Detalhes' then
   Begin
      btnDetalhes.Caption := '<< Detalhes';
      frm_Erro.Height := 320;
   End
   Else
   Begin
      btnDetalhes.Caption := '>> Detalhes';
      frm_Erro.Height := 200;
   End;

end;

end.
