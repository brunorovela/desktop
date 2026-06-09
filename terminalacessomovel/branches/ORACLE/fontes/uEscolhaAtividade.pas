unit uEscolhaAtividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, UZDataset,
  ZAbstractDataset, ZDataset,uDM,uModelTam,General;

type
  TfEscolheAtividade = class(TForm)
    lbListaEventos: TLabel;
    lbAtividadeEscolha: TLabel;
    btEntrar: TButton;
    cbEventos: TComboBox;
    cbAtividades: TComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbEventosChange(Sender: TObject);
  protected
    procedure preencheListaEventos();
    procedure preencheListaAtividades(iCodigoEvento: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
     bSair:Boolean;    
  end;

var
  fEscolheAtividade: TfEscolheAtividade;
  oEventoSel: TUMEvento;
  oAtividadeSel: TUMAtividade;


implementation

uses
uTerminalOnline;
{$R *.dfm}


{Valida atividade selecionada e finaliza seleção do inscrito}
procedure TfEscolheAtividade.btEntrarClick(Sender: TObject);
begin
   if((cbEventos.ItemIndex <> -1) and (cbAtividades.ItemIndex <> -1))then
   begin
      oEventoSel    := TUMEvento(cbEventos.Items.Objects[cbEventos.ItemIndex]);
      oAtividadeSel := TUMAtividade(cbAtividades.Items.Objects[cbAtividades.ItemIndex]);
      Self.Close;
      Application.CreateForm(TfTerminalOnline, fTerminalOnline);
      fTerminalOnline.ShowModal();
   end
   else
   begin
      Mensagem('Selecione uma atividade que deseja realizar a entrada!');
   end;
end;

procedure TfEscolheAtividade.cbEventosChange(Sender: TObject);
var
   oEventoSelecionado:TUMEvento;
begin
    oEventoSelecionado := nil;
    oEventoSelecionado := TUMEvento(cbEventos.Items.Objects[cbEventos.ItemIndex]);

    //Verifica se foi selecionado um evento
    if(Assigned(oEventoSelecionado))then
    begin
        Self.preencheListaAtividades(oEventoSelecionado.CodigoEvento);
    end;

end;


{Ao mostrar o form preenche as combos}
procedure TfEscolheAtividade.FormCreate(Sender: TObject);
begin
   oEventoSel:= nil;
   oAtividadeSel := nil;
   bSair:=false;
end;

procedure TfEscolheAtividade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   sChave: string;
   oEventoSair:TUMEvento;
begin
   if Key = VK_ESCAPE then
   begin
       Self.Close;
       bSair :=true;
   end
   else if (Key = VK_F4) and (ssAlt in Shift) then Key := 0;
end;

procedure TfEscolheAtividade.FormShow(Sender: TObject);
begin
   bSair:= false;
   //executa consulta para prencher a lista de eventos disponíveis
   Self.preencheListaEventos();
end;

procedure TfEscolheAtividade.preencheListaAtividades(iCodigoEvento: Integer);
var
   oAtividadeItem :TUMAtividade;
   qryAtividadeS:TUMZQuery;
begin
   qryAtividades := DM.newQuery();
   with qryAtividades do
   begin
      SQL.Text := 'SELECT                   '+
                  '   *                     '+
                  'FROM                     '+
                  '   TAM_ATIVIDADES  as ta '+
                  '   INNER JOIN TAM_EVENTOS as te ON (te.cd_evento=ta.cd_evento)'+
                  'WHERE'+
                  '   ta.cd_evento=:pCDEvento';
      //somente as atividades deste evento serão preenchidas
      ParamByName('pCDEvento').AsInteger := iCodigoEvento;

      //Abre a query
      Open;

      //aponta para o primeiro registro
      First;

      //habilita combo de atividades
      cbAtividades.Enabled := true;

      //Limpa a listagem de atividades
      cbAtividades.Clear;

      //enquanto existirem registros de atividades
      while not EOF do
      begin
         //cria atividade
         oAtividadeItem := TUMAtividade.Create(FieldByName('cd_atividade').AsInteger,
                                           FieldByName('ds_atividade').AsString,
                                           FieldByName('dt_atividade').AsDateTime,
                                           FieldByName('hr_inicio').AsDateTime,
                                           FieldByName('hr_fim').AsDateTime
                                           );
         //adiciona atividade na combo
         cbAtividades.AddItem(oAtividadeItem.DescricaoAtividade,oAtividadeItem);

         //proximo registro
         Next;
      end;//while

      //fecha a query
      Close;

   end;//with query

end;

procedure TfEscolheAtividade.preencheListaEventos;
var
   oEvento: TUMEvento;
   qryEventos: TUMZQuery;
begin
   qryEventos := DM.newQuery;

   try
      with qryEventos do
      begin
         SQL.Clear;
         SQL.Text:='SELECT * FROM TAM_EVENTOS WHERE date(now()) >= date(DT_EVENTO) and date(now()) <= date(DT_EVENTO_FIM) ';

         //abre a query
         Open;


         //aponta para o primeiro registro
         First;

         cbEventos.Clear;
         //enquanto houverem registros
         while not EOF do
         begin
            //cria instancia de cada evento
            oEvento := TUMEvento.Create(
               FieldByName('CD_EVENTO').AsInteger,
               FieldByName('DS_EVENTO').AsString,
               FieldByName('DT_EVENTO').AsDateTime,
               FieldByName('DS_SENHA').asString,
               Boolean(FieldByName('SN_CHECAR_FIN_ACESSO').AsInteger),
               Boolean(FieldByName('SN_LIBERAR_INSCRICOES').AsInteger),
               FieldByName('CD_GE_ATIVIDADE').AsInteger,
               FieldByName('ME_LOCAL').AsString,
               FieldByName('DT_EVENTO_FIM').AsDateTime);

            //adiciona o evento na combo
            cbEventos.AddItem(oEvento.DescricaoEvento,oEvento);

            Next;
         end;

         //fecha query
         Close;
      end;
   finally
      qryEventos.Free();
   end;


end;

end.
