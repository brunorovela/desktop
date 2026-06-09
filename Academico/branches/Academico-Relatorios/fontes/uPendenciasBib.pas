unit uPendenciasBib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset;

type
  TfrmPendenciaFinanceiras = class(TForm)
    pnlPrincipal: TPanel;
    btnFechar: TSpeedButton;
    lst: TCheckListBox;
    qryPendenciasBib: TUMZQuery;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cd_pessoa : Integer;
  end;

var
  frmPendenciaFinanceiras: TfrmPendenciaFinanceiras;

implementation

{$R *.dfm}

procedure TfrmPendenciaFinanceiras.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPendenciaFinanceiras.FormShow(Sender: TObject);
begin
  qryPendenciasBib.Close;
  qryPendenciasBib.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
  qryPendenciasBib.Open;

  qryPendenciasBib.First;

  while Not qryPendenciasBib.Eof do
  begin
    lst.AddItem(FormatDateTime('dd/mm/yyyy', qryPendenciasBib.FieldByName('dt_emprestimo').AsDateTime)+ ' - '+
      Format('R$%8.2n', [qryPendenciasBib.FieldByName('db_valor').AsFloat])
    , nil);
    qryPendenciasBib.Next;
  end;
  
end;

end.
