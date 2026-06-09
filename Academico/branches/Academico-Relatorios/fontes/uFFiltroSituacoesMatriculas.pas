unit uFFiltroSituacoesMatriculas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ComCtrls, ToolWin, ImgList, ExtCtrls,
  UZDataSet;

type
  TfrmFiltroSituacoesMatriculas = class(TForm)
    clbSituacoesMatriculas: TCheckListBox;
    paCabecalho: TPanel;
    ilToolBar: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnMarcarTodos: TToolButton;
    btnDesmarcarTodos: TToolButton;
    ToolButton3: TToolButton;
    btnSalvar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton4: TToolButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FListaMatriculasSelecionadas: TStringList;

    procedure CarregarSituacoesMatriculas();
  public
    Filtrar : Boolean;

    function GetSituacoesMatriculas(): TStringList;
    procedure SetSituacoesMatriculas(const lista: TStringList);
    { Public declarations }
  end;

var
  frmFiltroSituacoesMatriculas: TfrmFiltroSituacoesMatriculas;

implementation

uses uDM, uItemCombo;

{$R *.dfm}

procedure TfrmFiltroSituacoesMatriculas.btnDesmarcarTodosClick(Sender: TObject);
var
   I: Integer;
begin
   for I := 0 to clbSituacoesMatriculas.Items.Count - 1 do
      clbSituacoesMatriculas.Checked[I] := False;      
end;

procedure TfrmFiltroSituacoesMatriculas.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmFiltroSituacoesMatriculas.btnMarcarTodosClick(Sender: TObject);
var
   I: Integer;
begin
   for I := 0 to clbSituacoesMatriculas.Items.Count - 1 do
      clbSituacoesMatriculas.Checked[I] := True;
end;

procedure TfrmFiltroSituacoesMatriculas.btnSalvarClick(Sender: TObject);
begin
   Filtrar := True;
   Close();
end;

procedure TfrmFiltroSituacoesMatriculas.CarregarSituacoesMatriculas;
const
   SQL_SITUACOES_MATRICULAS =
      ' SELECT cd_situacao, ds_situacao ' +
      ' FROM situacao ' +
      ' WHERE cd_situacao <> -1 ' +
      ' ORDER BY ds_situacao ';
var
   qySituacoesMatriculas : TUMZReadOnlyQuery;
   I : Integer;
begin
   DM.CriarConsulta(qySituacoesMatriculas);

   qySituacoesMatriculas.SQL.Text := SQL_SITUACOES_MATRICULAS;
   qySituacoesMatriculas.Open();

   clbSituacoesMatriculas.Clear();
   while not qySituacoesMatriculas.Eof do
   begin
      clbSituacoesMatriculas.AddItem(
         qySituacoesMatriculas.FieldByName('ds_situacao').AsString,
         TItemCombo.Create(
            qySituacoesMatriculas.FieldByName('cd_situacao').AsString,
            qySituacoesMatriculas.FieldByName('ds_situacao').AsString )
      );

      if FListaMatriculasSelecionadas <> nil then
         for I := 0 to FListaMatriculasSelecionadas.Count - 1 do
            if ( FListaMatriculasSelecionadas.Objects[I] is TItemCombo ) AND
               ( TItemCombo( FListaMatriculasSelecionadas.Objects[I] ).getCodigo = qySituacoesMatriculas.FieldByName('cd_situacao').AsString ) then
            begin
               clbSituacoesMatriculas.Checked[ clbSituacoesMatriculas.Count-1 ] := True;
               break;
            end;              

      qySituacoesMatriculas.Next();   
   end;

   FreeAndNil(qySituacoesMatriculas);
end;

procedure TfrmFiltroSituacoesMatriculas.FormShow(Sender: TObject);
begin
   CarregarSituacoesMatriculas();
   Filtrar := False;
end;

function TfrmFiltroSituacoesMatriculas.GetSituacoesMatriculas: TStringList;
var
   I: Integer;
begin
   Result := TStringList.Create;

   for I := 0 to clbSituacoesMatriculas.Items.Count - 1 do
   begin
      if clbSituacoesMatriculas.Checked[I] then
         Result.AddObject( clbSituacoesMatriculas.Items[I], clbSituacoesMatriculas.Items.Objects[I] );
   end;
end;

procedure TfrmFiltroSituacoesMatriculas.SetSituacoesMatriculas(
  const lista: TStringList);
begin
   FListaMatriculasSelecionadas := lista;
end;

end.
