unit uRetornoTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, uRetornoBanco, Buttons;

type
  TfrmRetornoTitulos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    dsTitulos: TDataSource;
    sbSelecionarColuna: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  frmRetornoTitulos: TfrmRetornoTitulos;



implementation

uses uDM, uCamposPlanilhas;

{$R *.dfm}

procedure TfrmRetornoTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmRetornoBanco.btnTitulos.Down := false;
   frmRetornoBanco.btnTitulos.Tag := 0;
   Action := caFree;
end;

procedure TfrmRetornoTitulos.FormCreate(Sender: TObject);
begin
  DM.MontarPlanilha(DBGrid1, 'planilha_retorno_titulos');
end;

procedure TfrmRetornoTitulos.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(DBGrid1, 'planilha_retorno_titulos');
end;

end.
