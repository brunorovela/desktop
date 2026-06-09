unit uSelCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmSelCursos = class(TForm)
    qryCursos: TUMZQuery;
    dtcCursos: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    Label1: TLabel;
    grd: TDBGrid;
    txtCurso: TEdit;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    btnFechar: TButton;
    qryCursoscodigo: TStringField;
    qryCursosdescricao: TStringField;
    qryCursosanosemestre: TSmallintField;
    qryCursosgrau: TSmallintField;
    procedure FormDestroy(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
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
  frmSelCursos: TfrmSelCursos;

implementation

uses uPrincipal, uDM;

{$R *.DFM}

procedure TfrmSelCursos.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelCursos.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelCursos.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelCursos.FormDestroy(Sender: TObject);
begin
   frmSelCursos := nil;
end;

procedure TfrmSelCursos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelCursos.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelCursos.UpDown2Click(Sender: TObject; Button: TUDBtnType);
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


procedure TfrmSelCursos.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelCursos.FormShow(Sender: TObject);
begin

  if qryCursos.Active then Exit;

  txtAnoSemestre.text := IntToStr(ano_semestre);
  
  Filtra;

end;

procedure TfrmSelCursos.Filtra;
begin
  qryCursos.Close;
  qryCursos.SQL.Clear;
  qryCursos.SQL.Add( 'select codigo, descricao, anosemestre, grau from cursos' );

  qryCursos.SQL.Add( 'where anosemestre = :AnoSemestre' );

  if txtCurso.Text <> '' then
    qryCursos.SQL.Add( ' and codigo = :curso' );

  qryCursos.SQL.Add( 'order by anoSemestre DESC, codigo' );

  if txtCurso.Text <> '' then
    qryCursos.ParamByName('curso').AsString := txtCurso.Text;

  qryCursos.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);

  qryCursos.Open;

end;

end.
