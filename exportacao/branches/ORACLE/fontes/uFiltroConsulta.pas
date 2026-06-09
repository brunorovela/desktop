unit uFiltroConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ZAbstractRODataset,
  ZDataset, Grids, ZAbstractDataset, UZDataset;

type
  TfFiltrosConsulta = class(TForm)
    pnTitulo: TPanel;
    ZReadOnlyQuery1: TUMZQuery;
    qyRConsultaFiltros: TUMZQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Panel3: TPanel;
    sgFiltros: TStringGrid;
    rbPersonalizar: TRadioButton;
    rbPadrao: TRadioButton;
    ckSemprePadrao: TCheckBox;
    procedure ckSemprePadraoClick(Sender: TObject);
    procedure rbPersonalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fFiltrosConsulta: TfFiltrosConsulta;

implementation

uses
   uDM;

{$R *.dfm}

procedure TfFiltrosConsulta.rbPersonalizarClick(Sender: TObject);
begin
   sgFiltros.Enabled := rbPersonalizar.Checked and (not ckSemprePadrao.Checked);
end;

procedure TfFiltrosConsulta.ckSemprePadraoClick(Sender: TObject);
begin
   rbPersonalizar.Enabled := not ckSemprePadrao.Checked;
   rbPadrao.Enabled := not ckSemprePadrao.Checked;
   sgFiltros.Enabled := not ckSemprePadrao.Checked;
end;

end.
