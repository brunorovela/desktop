unit uAgrupamentoSelecionaHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, DB, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfrmAgrupamentoSelecionaHorarios = class(TForm)
    dsHorarios: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    lbCategoria: TLabel;
    cbCategorias: TComboBox;
    dbgHorarios: TDBGrid;
    qyCategoriasU: TUMZQuery;
    qryHorariosU: TUMZQuery;
    qryHorariosUcodigo: TIntegerField;
    qryHorariosUds_horario: TStringField;
    qryHorariosUhr_inicio: TTimeField;
    qryHorariosUhr_fim: TTimeField;
    qryHorariosUds_sigla: TStringField;
    qryHorariosUturno: TStringField;
    qryHorariosUds_chave: TStringField;
    qryHorariosUds_categoria: TStringField;
    qryHorariosUcd_horario_urania: TLargeintField;
    procedure cbCategoriasSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgHorariosColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgrupamentoSelecionaHorarios: TfrmAgrupamentoSelecionaHorarios;

implementation

{$R *.dfm}

procedure TfrmAgrupamentoSelecionaHorarios.cbCategoriasSelect(Sender: TObject);
begin
   if Self.cbCategorias.Items.Strings[Self.cbCategorias.ItemIndex] = 'TODAS AS CATEGORIAS' then
   begin
         qryHorariosU.close;
         qryHorariosU.SQL.Text := 'select * from horarios where ds_categoria is null';
         qryHorariosU.Open;
   end
   else
   begin
      qryHorariosU.close;
      if Self.cbCategorias.Items.Strings[Self.cbCategorias.ItemIndex] <> '' then
      begin
         qryHorariosU.SQL.Text := 'select * from horarios where ds_categoria =' + QuotedStr( Self.cbCategorias.Items.Strings[Self.cbCategorias.ItemIndex] );
         qryHorariosU.Open;
      end
      else
      begin
         qryHorariosU.close;
         qryHorariosU.SQL.Text := 'select * from horarios where ds_categoria is null';
         qryHorariosU.Open;
      end;
   end;
end;

procedure TfrmAgrupamentoSelecionaHorarios.dbgHorariosColEnter(Sender: TObject);
begin
      dbgHorarios.BeginDrag( True );
end;

procedure TfrmAgrupamentoSelecionaHorarios.FormShow(Sender: TObject);
begin

   qryHorariosU.close;
   qryHorariosU.SQL.Text := 'select * from horarios where ds_categoria is null';
   qryHorariosU.Open;

   Self.qyCategoriasU.Open;
   if Self.qyCategoriasU.IsEmpty then
   begin
      Self.cbCategorias.Enabled := false;
   end
   else
   begin
      Self.cbCategorias.Items.Add('TODAS AS CATEGORIAS');
      while not Self.qyCategoriasU.Eof do
      begin
         Self.cbCategorias.Items.Add(Self.qyCategoriasU.FieldByName('ds_categoria').AsString);
         Self.qyCategoriasU.Next;
      end;
   end;
   Self.qyCategoriasU.Close;


   Self.cbCategorias.ItemIndex := 0;

end;

end.
