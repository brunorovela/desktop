unit uSelPlanoPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  TfrmSelPlanoPgto = class(TForm)
    qryPlanoPgto: TUMZQuery;
    srcPlanoPgto: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    txtDescricao: TEdit;
    btnFechar: TButton;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    qryPlanoPgtocodigo: TIntegerField;
    qryPlanoPgtoanosemestre: TSmallintField;
    qryPlanoPgtodescricao: TStringField;
    qryPlanoPgtoturma: TStringField;
    qryPlanoPgtocurso: TStringField;
    qryPlanoPgtoparcelas: TSmallintField;
    qryPlanoPgtovalorcobrado: TFloatField;
    qryPlanoPgtovalorcontrato: TFloatField;
    qryPlanoPgtotaxamaterial: TFloatField;
    qryPlanoPgtotaxaapostila: TFloatField;
    qryPlanoPgtodesconto: TFloatField;
    qryPlanoPgtomatricula: TFloatField;
    qryPlanoPgtoapartir: TDateTimeField;
    qryPlanoPgtonumerotaxasmaterial: TSmallintField;
    qryPlanoPgtoparagrafo3: TStringField;
    qryPlanoPgtonr_dias_parczero: TSmallintField;
    qryPlanoPgtosn_dias_uteis: TStringField;
    qryPlanoPgtosn_creditos: TStringField;
    qryPlanoPgtonr_creditos_base: TFloatField;
    Label1: TLabel;
    txtAnoSemestre: TMaskEdit;
    udAnoSemestre: TUpDown;
    procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frmSelPlanoPgto: TfrmSelPlanoPgto;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelPlanoPgto.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelPlanoPgto.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelPlanoPgto.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelPlanoPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelPlanoPgto.txtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelPlanoPgto.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelPlanoPgto.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  if qryPlanoPgto.Active then Exit;


  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  txtDescricao.SetFocus;

end;

procedure TfrmSelPlanoPgto.Filtra;
begin
  qryPlanoPgto.Close;
  qryPlanoPgto.SQL.Clear;
  qryPlanoPgto.SQL.Add( 'select * from planospagamento where anosemestre = :nr_anosemestre' );
  qryPlanoPgto.ParamByName('nr_anosemestre').AsString := txtAnoSemestre.Text;

  if txtDescricao.Text <> '' then
    qryPlanoPgto.SQL.Add( ' and descricao like :descricao' );

  qryPlanoPgto.SQL.Add( ' order by  descricao' );

  if txtDescricao.Text <> '' then
    qryPlanoPgto.ParamByName('descricao').AsString := '%'+txtDescricao.Text+'%';

  qryPlanoPgto.Open;

end;

procedure TfrmSelPlanoPgto.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryPlanoPgto, pmQtd);

end;

procedure TfrmSelPlanoPgto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelPlanoPgto.udAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);
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

end.

