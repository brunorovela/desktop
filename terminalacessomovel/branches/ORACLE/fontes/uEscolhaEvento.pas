unit uEscolhaEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uModelTam;

type
  TfEscolhaEventos = class(TForm)
    cbEventos: TComboBox;
    lbListaEventos: TLabel;
    btEntrar: TButton;
    procedure btEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscolhaEventos: TfEscolhaEventos;
  oEventoSel: TUMEvento;

implementation
uses
   uDM,Main,ZDataset, UZDataset, DB,General;

{$R *.dfm}

procedure TfEscolhaEventos.btEntrarClick(Sender: TObject);
begin
   if(cbEventos.ItemIndex <> -1)then
   begin
      oEventoSel    := TUMEvento(cbEventos.Items.Objects[cbEventos.ItemIndex]);
      //Fecha as entradas do evento selecionado
      TUMEvento.fecharEntradas(oEventoSel);
      Self.Close;
   end
   else
   begin
      Mensagem('Selecione um evento para efetuar a finalização!');
   end;
end;

procedure TfEscolhaEventos.FormShow(Sender: TObject);
var
   oEvento: TUMEvento;
   qryEventos: TUMZQuery;
begin
   qryEventos := DM.newQuery;
   with qryEventos do
   begin

      SQL.Text:='SELECT * FROM TAM_EVENTOS WHERE DT_EVENTO=DATE_FORMAT(now(),"%Y-%m-%d")';

      //abre a query
      Open;


      //aponta para o primeiro registro
      First;

      //enquanto houverem registros
      while not EOF do
      begin
         //cria instancia de cada evento
         oEvento := TUMEvento.Create(FieldByName('CD_EVENTO').AsInteger,FieldByName('DS_EVENTO').AsString,FieldByName('DT_EVENTO').AsDateTime,FieldByName('DS_SENHA').asString,Boolean(FieldByName('SN_CHECAR_FIN_ACESSO').AsInteger));

         //adiciona o evento na combo
         cbEventos.AddItem(oEvento.DescricaoEvento,oEvento);

         Next;
      end;

      //fecha query
      Close;
   end;

end;


end.
