unit uParametrosGerais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Db, StdCtrls, Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TFrmParametrosGerais = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParametrosGerais: TFrmParametrosGerais;

implementation

uses uDM;

{$R *.DFM}

procedure TFrmParametrosGerais.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmParametrosGerais.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmParametrosGerais.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

procedure TFrmParametrosGerais.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
end;

end.

