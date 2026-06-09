unit uSelAtividades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  Menus, Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_SelAtividades = class(TForm)
    dtcTurmas: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    txtAtividade: TEdit;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    Label1: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    qyAtividades: TUMZQuery;
    qyAtividadescd_atividade: TIntegerField;
    qyAtividadesnr_anosemestre: TIntegerField;
    qyAtividadescd_professor: TIntegerField;
    qyAtividadescd_tipo_titulo: TIntegerField;
    qyAtividadescd_centro: TLargeintField;
    qyAtividadescd_coligada: TIntegerField;
    qyAtividadesds_atividade: TStringField;
    qyAtividadesds_observacao: TMemoField;
    qyAtividadesds_sigla: TStringField;
    qyAtividadesnm_professor: TStringField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtAtividadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_SelAtividades: Tfrm_SelAtividades;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_SelAtividades.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_SelAtividades.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_SelAtividades.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelAtividades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_SelAtividades.txtAtividadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_SelAtividades.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  qyAtividades.Active;


  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  txtAtividade.SetFocus;

end;

procedure Tfrm_SelAtividades.Filtra;
begin
  qyAtividades.Close;
  qyAtividades.SQL.Clear;
  qyAtividades.SQL.Add( 'select * from extra_atividades ' );
  qyAtividades.SQL.Add( ' where nr_anosemestre = :nr_anosemestre' );
  qyAtividades.ParamByName('nr_anosemestre').AsString := txtAnoSemestre.Text;

  if txtAtividade.Text <> '' then
  begin
    qyAtividades.SQL.Add( ' and ds_atividade like :ds_atividade ' );
    qyAtividades.ParamByName('ds_atividade').AsString := txtAtividade.Text;
  end;

  qyAtividades.SQL.Add( 'order by ds_atividade' );

  qyAtividades.Open;

end;

procedure Tfrm_SelAtividades.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyAtividades, pmQtd);

end;

procedure Tfrm_SelAtividades.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_SelAtividades.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelAtividades.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text)
  else
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);

  Filtra;

end;

end.
