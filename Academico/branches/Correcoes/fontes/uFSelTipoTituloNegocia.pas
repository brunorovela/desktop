unit uFSelTipoTituloNegocia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, CheckLst, ExtCtrls, uItemCombo,
  ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfrmSelTipoTituloNegocia = class(TForm)
    qryTipoTitulo: TUMZQuery;
    qryTipoTitulocd_tipo_titulo: TIntegerField;
    qryTipoTitulods_tipo_titulo: TStringField;
    qryInsere: TUMZQuery;
    qryGetParamValor: TUMZQuery;
    pnlPrincipal: TPanel;
    pnlTopo: TPanel;
    chcklTipoTitulos: TCheckListBox;
    qryGetParamValords_valor: TMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chcklTipoTitulosClickCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function estaChecado(sCodigo: string): bool;
    function Explode(str, separador: string): TStringList;
    { Private declarations }
  public
    { Public declarations }
    lstTitulos : TStringList;
  end;

var
  frmSelTipoTituloNegocia: TfrmSelTipoTituloNegocia;

implementation

{$R *.dfm}

procedure TfrmSelTipoTituloNegocia.chcklTipoTitulosClickCheck(Sender: TObject);
var
  i: Integer;
  sOp :string;
  sParametroValor : string;
begin
   sParametroValor := '';
   sop := '';
   for I := 0 to chcklTipoTitulos.Count - 1 do
   begin
      if  chcklTipoTitulos.Checked[i] then
      begin
         sParametroValor :=  sParametroValor+sOp+ TItemCombo(chcklTipoTitulos.Items.Objects[i]).getCodigo;
         sOp := ' , ';
      end;
   end;
   qryInsere.ParamByName('valor').AsString := sParametroValor;
   qryInsere.ExecSQL;
end;

procedure TfrmSelTipoTituloNegocia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSelTipoTituloNegocia.FormShow(Sender: TObject);
var
   i : Integer;
begin

   qryGetParamValor.Close;
   qryGetParamValor.Open;
   lstTitulos := Explode(qryGetParamValords_valor.AsString,',');
   qryTipoTitulo.Close;
   qryTipoTitulo.Open;
   i:=0;
   while Not(qryTipoTitulo.Eof) do
   begin
      chcklTipoTitulos.Items.AddObject(qryTipoTitulods_tipo_titulo.AsString , TItemCombo.Create(qryTipoTitulocd_tipo_titulo.AsString, qryTipoTitulods_tipo_titulo.AsString));
      if(estaChecado(qryTipoTitulocd_tipo_titulo.AsString))then
      begin
         chcklTipoTitulos.Checked[i] := true;
      end;
      qryTipoTitulo.Next;
      i := i+1;
   end;
end;

function TfrmSelTipoTituloNegocia.Explode(str, separador: string): TStringList;
var
  p: integer;
begin
  Result := TStringList.Create;

  p := Pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p-1));
    Delete(str, 1, p + Length(separador) - 1);
    p := Pos(separador, str);
  end;

  if (str <> '') then
    Result.Add(str);
end;

function TfrmSelTipoTituloNegocia.estaChecado(sCodigo : string) : bool;
var
   i : Integer;
begin
   for I := 0 to lstTitulos.Count - 1 do
   begin
      if (trim(lstTitulos.Strings[i]) = sCodigo) then
      begin
         Result := True;
         Exit;
      end;
   end;
   Result := false;
end;

end.
