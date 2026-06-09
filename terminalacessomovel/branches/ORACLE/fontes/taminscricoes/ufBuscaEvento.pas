unit ufBuscaEvento;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ToolWin, ComCtrls, Grids, DBGrids, DB, uAFuncoes,
   UZDataset, ZDataset, ufTAMInscricoes, ImgList, ZConnection,
  ZAbstractRODataset;

const
   INOEVENTO = -1;

type
   { Esta classe disponibiliza ao usuário uma interface que permite-o selecionar
     um dos eventos previamente cadastrados na base de dados.
   }
   TfBuscaEvento = class(TForm)
   strict private
      FICodEvento: integer;            // Código do evento selecionado
      procedure setEventoSelecionado;  // Define o evento selecionado
   private
      constructor Create(AZConn: TZConnection); // Construtor
      destructor Destroy; override;             // Destrutor
   public
      class function getCodEvento(AZConn: TZConnection;
         const AIEventoAnt: integer; ABForcaSelecao: boolean): integer;
   published
      FBvSep2: TBevel;
      FDGEvento: TDBGrid;
      FPnFiltro: TPanel;
      FIlImagens: TImageList;
      FDsEventos: TDataSource;
      FQyEventos: TUMZReadOnlyQuery;
      FLedNomeEvento: TLabeledEdit;
      FTbAcoes: TToolBar;
      FTbFiltro: TToolBar;
      FBnSep1: TToolButton;
      FBnSep2: TToolButton;
      FBnSep3: TToolButton;
      FBnSep4: TToolButton;
      FBnSep5: TToolButton;
      FBnSep6: TToolButton;
      FBnTodos: TToolButton;
      FBnFiltrar: TToolButton;
      FBnCancelar: TToolButton;
      FBnConfirmar: TToolButton;
      procedure filtra(Sender: TObject);
      procedure mostraTodos(Sender: TObject);
      procedure selecionaEventoDuploClick(Sender: TObject);
      procedure confirmaSelecao(Sender: TObject);
      procedure cancelaSelecao(Sender: TObject);
      procedure mostraForm(Sender: TObject);
      procedure fechaJanela(Sender: TObject; var Action: TCloseAction);
      procedure processaAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
      property CodEvento: integer read FICodEvento;
   end;

var
   fBuscaEvento: TfBuscaEvento;

implementation

{$R *.dfm}

{ TfBuscaEvento }

{ Cancela a busca/seleção.
}
procedure TfBuscaEvento.cancelaSelecao(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.FICodEvento := INOEVENTO;
   Self.CloseModal;
end;

{ Confirma a seleção.
}
procedure TfBuscaEvento.confirmaSelecao(Sender: TObject);
begin
   Self.ModalResult := mrOk;
   Self.setEventoSelecionado;
end;

{ Construtor. }
constructor TfBuscaEvento.Create(AZConn: TZConnection);
begin
   inherited Create(nil);
   Self.FQyEventos.Connection := AZConn;
   Self.FICodEvento := INOEVENTO;
   Self.ModalResult := mrCancel;
end;

{ Destrutor. }
destructor TfBuscaEvento.Destroy;
begin
   inherited;
end;

procedure TfBuscaEvento.fechaJanela(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

{ Efetua o filtro pelo nome do evento com base no valor informado pelo usuário.
}
procedure TfBuscaEvento.filtra(Sender: TObject);
begin
   Self.FQyEventos.Close;
   Self.FQyEventos.ParamByName('ds_evento').AsString := '%' + Self.FLedNomeEvento.Text + '%';
   Self.FQyEventos.Open;
   Self.FBnConfirmar.Enabled := not Self.FQyEventos.IsEmpty;
end;

{ Efetua a busca do evento desejado.
}
class function TfBuscaEvento.getCodEvento(AZConn: TZConnection;
  const AIEventoAnt: integer; ABForcaSelecao: boolean): integer;
begin
   Result := 0;
   if Assigned(fBuscaEvento) then
   begin
      fBuscaEvento.Free;
   end;
   fBuscaEvento := TfBuscaEvento.Create(AZConn);
   fBuscaEvento.FBnCancelar.Enabled := not ABForcaSelecao;
   try
      fBuscaEvento.ShowModal;
      case fBuscaEvento.ModalResult of
         // Seleção confirmada
         mrOk:
         begin
            if fBuscaEvento.CodEvento = INOEVENTO then
            begin
               Result := AIEventoAnt;
            end else
            begin
               Result := fBuscaEvento.CodEvento;
            end;
         end;
         // Busca cancelada
         mrCancel:
         begin
            Result := AIEventoAnt;
         end;
      end;
   finally
      fBuscaEvento.Free;
   end;
end;

{ Quando o form é exibido mostra todos os eventos cadastrados na base de dados.
}
procedure TfBuscaEvento.mostraForm(Sender: TObject);
begin
   Self.FQyEventos.ParamByName('ds_evento').AsString := '%';
   Self.FQyEventos.Close;
   Self.FQyEventos.Open;
   Self.FBnConfirmar.Enabled := not Self.FQyEventos.IsEmpty;
end;

{ Ignora o filtro e exibe todos os eventos.
}
procedure TfBuscaEvento.mostraTodos(Sender: TObject);
begin
   Self.FLedNomeEvento.Clear;
   Self.FQyEventos.ParamByName('ds_evento').AsString := '%';
   Self.FQyEventos.Close;
   Self.FQyEventos.Open;
   Self.FBnConfirmar.Enabled := not Self.FQyEventos.IsEmpty;
end;

procedure TfBuscaEvento.processaAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_F4) and (ssAlt in Shift) then Key := 0;

   case key of
      VK_F5 : Self.confirmaSelecao( nil );
      VK_F7 : Self.cancelaSelecao( nil );
   end;
end;

{ Seleciona o evento desejado no duplo click do usuário.
}
procedure TfBuscaEvento.selecionaEventoDuploClick(Sender: TObject);
begin
   Self.setEventoSelecionado;
end;

{ Define o ponteiro do DataSet para a linha selecionada pelo usuário e define o
  valor do código do evento para o código do evento na linha selecionada.
}
procedure TfBuscaEvento.setEventoSelecionado;
begin
   if Self.FDGEvento.SelectedIndex <> -1 then
   begin
      Self.FDGEvento.DataSource.DataSet.GotoBookmark(Pointer(Self.FDGEvento.SelectedIndex));
      Self.FICodEvento := Self.FDGEvento.DataSource.DataSet.FieldByName('CD_EVENTO').AsInteger;
      fTAMInscricoes.FPnEvento.Caption := Self.FDGEvento.DataSource.DataSet.FieldByName('DS_EVENTO').AsString;
      Self.ModalResult := mrOk;
      Self.CloseModal;
   end else
   begin
      Self.ModalResult := mrCancel;
      Mensagem('É necessário selecionar um evento para confirmar.', 'Atenção!', MB_ICONINFORMATION, Self.Handle);
   end;
end;

end.
