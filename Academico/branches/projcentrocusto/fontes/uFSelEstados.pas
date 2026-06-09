unit uFSelEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, UZDataset, StdCtrls, Grids, DBGrids,
  ImgList, ComCtrls, ToolWin, CheckLst;

const
   // Array que é acessado usando o Type "TUMSqlConsulta"
   TUMListaSqlEstados : array[1..2] of String = (

      // Todos os estados, somente tabela estados
      ' SELECT DISTINCT e.ds_uf AS codigo, e.ds_estado AS descricao ' +
      ' FROM estados e ',

      // Somente estados de coligadas existentes
      ' SELECT DISTINCT e.ds_uf AS codigo, e.ds_estado AS descricao ' +
      ' FROM estados e ' +
      '      INNER JOIN coligadas c ON ( c.ds_estado = e.ds_uf ) '

   );

type
  TUMSqlConsultaEstados = (scePadrao = 1, sceFromColigadas = 2);

  TfrmSelEstados = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnMarcarTodos: TToolButton;
    btnDesmarcarTodos: TToolButton;
    ToolButton3: TToolButton;
    btnSalvar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton4: TToolButton;
    ilToolBar: TImageList;
    paCabecalho: TPanel;
    clbEstados: TCheckListBox;
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
  private
    { Private declarations }
    FListaEstadosSelecionadas: TStringList;

    procedure CarregarRegistros(var listaRegistros: TUMZReadOnlyQuery);
    procedure CarregarSelecionados(selecionados: String);
    procedure MarcarTodos();
    procedure DesmarcarTodos();
  public
    { Public declarations }
    Filtrar: Boolean;
    
    procedure CarregaTelaFiltro( selecionados: String = ''; TipoConsulta: TUMSqlConsultaEstados = scePadrao );

    function GetStrEstadosSelecionados(sem_aspas: boolean = False): String;
  end;

var
  frmSelEstados: TfrmSelEstados;

implementation

uses uDM, uItemCombo, General;

{$R *.dfm}

{ TfrmSelEstados }

{ TfrmSelEstados }

procedure TfrmSelEstados.btnDesmarcarTodosClick(Sender: TObject);
begin
   DesmarcarTodos();
end;

procedure TfrmSelEstados.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmSelEstados.btnMarcarTodosClick(Sender: TObject);
begin
   MarcarTodos();
end;

procedure TfrmSelEstados.btnSalvarClick(Sender: TObject);
begin
   Filtrar := True;
   Close();
end;

procedure TfrmSelEstados.CarregarRegistros(var listaRegistros: TUMZReadOnlyQuery);
begin
   while not listaRegistros.Eof do
   begin
      clbEstados.AddItem(
         listaRegistros.FieldByName( 'descricao' ).AsString,
         TItemCombo.Create(
            listaRegistros.FieldByName( 'codigo' ).AsString,
            listaRegistros.FieldByName( 'descricao' ).AsString
         )
      );
                                                                                 
      listaRegistros.Next;
   end;
end;

procedure TfrmSelEstados.CarregarSelecionados(selecionados: String);
var
   arrSelecionados: TStringList;
   I: Integer;
begin
   arrSelecionados := TStringList.Create;
   SplitString(selecionados, ',', arrSelecionados);

   if ( clbEstados.Items.Count > 0 ) then
   begin
      for I := 0 to clbEstados.Items.Count - 1 do
      begin
         // Recebe TRUE caso o código do estado esteja no array "arrSelecionados"
         clbEstados.Checked[ I ] := ( arrSelecionados.IndexOf( TItemCombo( clbEstados.Items.Objects[ I ] ).codigo ) > -1 );
      end;
   end;
end;

procedure TfrmSelEstados.CarregaTelaFiltro(selecionados: String; TipoConsulta: TUMSqlConsultaEstados);
var
   qyListaEstados: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyListaEstados);
   qyListaEstados.SQL.Text := TUMListaSqlEstados[ Ord( TipoConsulta ) ];
   qyListaEstados.Open();

   // Se tem registro
   if not qyListaEstados.Eof then
   begin
      CarregarRegistros( qyListaEstados );

      // Carrega os registros já selecionados
      CarregarSelecionados( selecionados );
   end;

   FreeAndNil( qyListaEstados );

   Self.ShowModal;
end;

procedure TfrmSelEstados.DesmarcarTodos;
var
   I: Integer;
begin
   for I := 0 to clbEstados.Items.Count - 1 do
      clbEstados.Checked[I] := False;
end;

procedure TfrmSelEstados.FormShow(Sender: TObject);
begin
   Filtrar := False;
end;

function TfrmSelEstados.GetStrEstadosSelecionados(sem_aspas: boolean): String;
var
   I: Integer;
   Separador: String;
begin
   Result := '';
   Separador := '';

   for I := 0 to clbEstados.Items.Count - 1 do
   begin
      if clbEstados.Checked[I] then
      begin
         if ( not sem_aspas ) then
            Result := Result + Separador + QuotedStr( TItemCombo( clbEstados.Items.Objects[I] ).codigo )
         else
            Result := Result + Separador + TItemCombo( clbEstados.Items.Objects[I] ).codigo;
         
         Separador := ',';
      end;
   end;
end;

procedure TfrmSelEstados.MarcarTodos;
var
   I: Integer;
begin
   for I := 0 to clbEstados.Items.Count - 1 do
      clbEstados.Checked[I] := True;
end;

end.
