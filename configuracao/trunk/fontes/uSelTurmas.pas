unit uSelTurmas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General;

type
  TfrmSelTurmas = class(TForm)
    qryTurmas: TQuery;
    dtcTurmas: TDataSource;
    qryTurmasTurma: TStringField;
    qryTurmasAnoSemestre: TSmallintField;
    Bevel1: TBevel;
    Label3: TLabel;
    Label1: TLabel;
    grd: TDBGrid;
    txtTurma: TEdit;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    btnFechar: TButton;
    qryTurmasCurso: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frmSelTurmas: TfrmSelTurmas;

implementation

uses uPrincipal, uDM;

{$R *.DFM}

procedure TfrmSelTurmas.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelTurmas.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelTurmas.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelTurmas.FormDestroy(Sender: TObject);
begin
   frmSelTurmas := nil;
end;

procedure TfrmSelTurmas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelTurmas.txtTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelTurmas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  Filtra;

end;


procedure TfrmSelTurmas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelTurmas.FormShow(Sender: TObject);
begin

  if qryTurmas.Active then Exit;
  
  txtAnoSemestre.text := IntToStr(ano_semestre);

  Filtra;

end;

procedure TfrmSelTurmas.Filtra;
begin
  qryTurmas.Close;
  qryTurmas.SQL.Clear;
  qryTurmas.SQL.Add( 'select Codigo AS Turma, AnoSemestre, Curso from Turmas' );

  qryTurmas.SQL.Add( 'where AnoSemestre = :AnoSemestre' );

  if txtTurma.Text <> '' then
    qryTurmas.SQL.Add( ' and codigo = :Turma' );

  qryTurmas.SQL.Add( 'group by codigo, AnoSemestre, Curso' );
  qryTurmas.SQL.Add( 'order by  AnoSemestre DESC, codigo' );

  if txtTurma.Text <> '' then
    qryTurmas.ParamByName('Turma').AsString := txtTurma.Text;

  qryTurmas.ParamByName('AnoSemestre').asInteger := StrToInt(txtAnoSemestre.Text);

  qryTurmas.Prepare;
  qryTurmas.Open;

end;

end.
