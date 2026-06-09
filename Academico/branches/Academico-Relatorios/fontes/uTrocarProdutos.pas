unit uTrocarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  Tfrm_trocar_produto = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    txt_nr_quantidade: TEdit;
    txt_cd_produto: TEdit;
    UpDown2: TUpDown;
    procedure btnConfirmarClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    nr_quantidade_max : Integer;
  end;

var
  frm_trocar_produto: Tfrm_trocar_produto;

implementation

{$R *.dfm}

procedure Tfrm_trocar_produto.btnConfirmarClick(Sender: TObject);
var
   nr_codigo_produto : String;
   qtd_produtos : Integer;
begin
   try
      nr_codigo_produto := txt_cd_produto.Text;
   except
      nr_codigo_produto := '';
   end;

   try
      qtd_produtos := StrToInt(txt_nr_quantidade.Text);
   except
      qtd_produtos := -1;
   end;

   if (nr_codigo_produto = '') then
   begin
      ShowMessage('Código de produto inválido!');
      ModalResult := mrNone;
      Exit;
   end;

   if (qtd_produtos < 0) then
   begin
      ShowMessage('Quantidade de produtos inválida!');
      ModalResult := mrNone;
      Exit;
   end;
end;

procedure Tfrm_trocar_produto.UpDown2Click(Sender: TObject; Button: TUDBtnType);
var
   i: Integer;
begin
   if txt_nr_quantidade.Text = '' then begin
      txt_nr_quantidade.Text := '1';
   end
   else begin
      try
         i := StrToInt(txt_nr_quantidade.Text);
      except
         i := 1;
      end;
      if Button = btNext then
      begin
         if i < nr_quantidade_max  then
            Inc(i);
      end
      else begin
         if (i > 1) then
         begin
            Dec(i);
         end;
      end;
      txt_nr_quantidade.Text := IntToStr(i);
   end;
end;

end.
