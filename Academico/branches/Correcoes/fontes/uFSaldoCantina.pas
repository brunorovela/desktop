unit uFSaldoCantina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, DBCtrls, uDM, ImgList, ComCtrls, ToolWin;

type
  TformSaldoCantina = class(TForm)
    Panel1: TPanel;
    lblAcaoMovimento: TLabel;
    Label1: TLabel;
    pnlTitulo: TPanel;
    qrySaldo: TUMZQuery;
    qrySaldosaldo: TFloatField;
    dbSaldo: TDBText;
    dsSaldo: TDataSource;
    qryCreditos: TUMZQuery;
    qryCreditosvl_valor: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    dsCreditos: TDataSource;
    Label4: TLabel;
    qryCreditosdt_acao: TDateField;
    tlbAcoes: TToolBar;
    btnSep1: TToolButton;
    btnConfirmar: TToolButton;
    btnSep2: TToolButton;
    ilImagens: TImageList;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    cd_pessoa: Integer;
    { Public declarations }
  end;

var
  formSaldoCantina: TformSaldoCantina;

implementation

{$R *.dfm}

procedure TformSaldoCantina.btnConfirmarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TformSaldoCantina.FormCreate(Sender: TObject);
begin
   cd_pessoa := 0;
end;

procedure TformSaldoCantina.FormShow(Sender: TObject);
begin
   qrySaldo.Close;
   qrySaldo.ParamByName('pessoa').AsInteger := cd_pessoa;
   qrySaldo.Open;

   dbSaldo.Font.Color := clGreen;
   Label1.Font.Color := clGreen;
   if(qrySaldosaldo.AsFloat < 0.00) then
   begin
      Label1.Font.Color := clRed;
      dbSaldo.Font.Color := clRed;
   end;

   qryCreditos.Close;
   qryCreditos.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qryCreditos.Open;
end;

end.
