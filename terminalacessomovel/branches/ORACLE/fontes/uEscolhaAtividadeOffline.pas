unit uEscolhaAtividadeOffline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uXML;

type
  TfEscolheAtividadeOffline = class(TForm)
    lbAtividadeEscolha: TLabel;
    cbAtividades: TComboBox;
    btEntrar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btEntrarClick(Sender: TObject);
  protected
    procedure preencheListaAtividades();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscolheAtividadeOffline: TfEscolheAtividadeOffline;


implementation
uses
General,Main;

{$R *.dfm}

procedure TfEscolheAtividadeOffline.btEntrarClick(Sender: TObject);
var
   oAtividadeSel : TUMTAMAtividade;
begin
   //Finalizar a escolha da atividade
   if(cbAtividades.ItemIndex <> -1)then
   begin

      oAtividadeSel := TUMTAMAtividade(cbAtividades.Items.Objects[cbAtividades.ItemIndex]);
      PrincipalForm.FUMTerminalAcessoXML.setAtividadeSel(oAtividadeSel);      
      Self.Close;
   end
   else
   begin
      Mensagem('Selecione uma atividade que deseja realizar a entrada!');
   end;
end;


procedure TfEscolheAtividadeOffline.FormShow(Sender: TObject);
begin
   preencheListaAtividades();
end;

procedure TfEscolheAtividadeOffline.preencheListaAtividades();
var
   iIndice:integer;
begin
   //Limpa a listagem de atividades
   cbAtividades.Clear;

   //Prenche com todas as atividades do evento selecionado
   with PrincipalForm.FUMTerminalAcessoXML.UMEvento do
   begin

      //Adiciona todas as atividades do evento na combo de seleção
      for iIndice := 0 to AtividadesCount - 1 do
      begin
         cbAtividades.AddItem(Atividade[iIndice].DescricaoAtividade,Atividade[iIndice]);
      end;

   end;

end;

end.
