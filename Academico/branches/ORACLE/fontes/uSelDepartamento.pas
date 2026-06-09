unit uSelDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, Buttons, DB, ZConnection, uZDataSet;

type
  TfrmSelDepartamento = class(TForm)
    pnTitulo: TPanel;
    blSeparadorTitulo: TBevel;
    cklbDepartamentos: TCheckListBox;
    sbMarcarTodos: TSpeedButton;
    sbDesmarcarTodos: TSpeedButton;
    btConfirmar: TBitBtn;
    procedure sbDesmarcarTodosClick(Sender: TObject);
    procedure sbMarcarTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    slDepartamentos : TStringList;
    sDeptosSelecionados: String;
  end;

var
  frmSelDepartamento: TfrmSelDepartamento;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmSelDepartamento.FormShow(Sender: TObject);
var
   qyDepartamentos: TUMZQuery;
   i: Integer;
begin
   DM.CriarConsulta(qyDepartamentos);

   if Length(sDeptosSelecionados) = 0 then
   begin
      sDeptosSelecionados := '-1';
   end;

   qyDepartamentos.SQL.Text := '' +
     'SELECT ' +
     '   codigo cd_departamento, ' +
     '   descricao ds_departamento, '+
     '   CASE WHEN codigo IN ('+sDeptosSelecionados+') THEN 1 ELSE 0 END sn_selecionado '+
     'FROM ' +
     '   departamentos '+
     'WHERE '+
     '   cd_coligada IN (' + DM.UsuarioLogado.GetColigadasFilhaSelecionada + ') ' +
     'ORDER BY '+
     '   descricao ';

   qyDepartamentos.Open();

   cklbDepartamentos.Clear();
   slDepartamentos.Clear();

   while not qyDepartamentos.Eof do
   begin
      i := cklbDepartamentos.Items.Add(qyDepartamentos.FieldByName('ds_departamento').AsString);

      if qyDepartamentos.FieldByName('sn_selecionado').AsInteger = 1 then
      begin
         cklbDepartamentos.Checked[i] := True;
      end;

      slDepartamentos.Add(qyDepartamentos.FieldByName('cd_departamento').AsString);

      qyDepartamentos.Next();
   end;

   FreeAndNil(qyDepartamentos);
end;

procedure TfrmSelDepartamento.sbDesmarcarTodosClick(Sender: TObject);
var
  i : integer;
begin

   for i := 0 to (cklbDepartamentos.Items.Count-1) do
   begin
      cklbDepartamentos.Checked[i] := False;
   end;
end;

procedure TfrmSelDepartamento.sbMarcarTodosClick(Sender: TObject);
var
  i : integer;
begin

   for i := 0 to (cklbDepartamentos.Items.Count-1) do
   begin
      cklbDepartamentos.Checked[i] := True;
   end;

end;

end.
