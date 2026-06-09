unit uBiblioMultaEmprestimoLivros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGrids, Provider, SqlExpr, DB,
   uDM, StdCtrls, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset;

type
  TFrmMultaEmprestimoLivros = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    dgMultas: TDBGrid;
    SpeedButton3: TSpeedButton;
    dsMultas: TDataSource;
    tblMultas: TUMZQuery;
    tblMultasregistro: TIntegerField;
    tblMultasdataretirada: TDateTimeField;
    tblMultasdataentrega: TDateTimeField;
    tblMultasdatadevolucao: TDateTimeField;
    tblMultastitulo: TStringField;
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function TemEmprestimo(cd_multa : Integer) : Boolean;
  end;

var
  FrmMultaEmprestimoLivros: TFrmMultaEmprestimoLivros;

implementation

uses
   VarUtils, Main;

{$R *.dfm}

function TFrmMultaEmprestimoLivros.TemEmprestimo(cd_multa: Integer): Boolean;
begin
   tblMultas.Close;
   tblMultas.ParamByName('cd_multa').AsInteger := cd_multa;
   tblMultas.Open;

   if tblMultas.RecordCount = 0 Then
      result := False
   Else
      Begin
         Result := True;
         ShowModal;
      End;
end;

procedure TFrmMultaEmprestimoLivros.SpeedButton3Click(Sender: TObject);
begin
   Close;
end;

end.

