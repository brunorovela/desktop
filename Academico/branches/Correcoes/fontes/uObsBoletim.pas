unit uObsBoletim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Db, ZConnection, Buttons, uFichaIndividual;

type
  TFrmObsBoletim = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tblObs: TUMZQuery;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tblObsCODIGOALUNO: TIntegerField;
    tblObsTURMA: TStringField;
    tblObsANOSEMESTRE: TSmallintField;
    tblObsOBS: TMemoField;
    dsObs: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmObsBoletim: TFrmObsBoletim;

implementation

uses uDM;

{$R *.DFM}

procedure TFrmObsBoletim.BitBtn1Click(Sender: TObject);
begin
   tblObs.Post;
   Close;
end;

procedure TFrmObsBoletim.BitBtn2Click(Sender: TObject);
begin
   tblObs.CAncel;
   Close;
end;

procedure TFrmObsBoletim.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  tblObs.Close;
  tblObs.Open; 
  tblObs.Edit;
  tblObsCODIGOALUNO.AsInteger := frmFichaIndividual.tblFichaCodigoAluno.AsInteger;
  tblObsTURMA.AsString := frmFichaIndividual.tblFichaTurma.AsString;
  tblObsANOSEMESTRE.AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
  DBMemo1.SetFocus;
end;

end.

