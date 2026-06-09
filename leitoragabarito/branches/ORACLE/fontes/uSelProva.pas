unit uSelProva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  TfrmSelProva = class(TForm)
    qyProva: TUMZQuery;
    srcProva: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    txtDescricao: TEdit;
    btnFechar: TButton;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    UpDown2: TUpDown;
    txtNroProva: TMaskEdit;
    Label1: TLabel;
    qyProvacd_prova: TIntegerField;
    qyProvanr_prova: TSmallintField;
    qyProvads_prova: TStringField;
    qyProvanr_correcoes: TIntegerField;
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
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
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frmSelProva: TfrmSelProva;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelProva.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelProva.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelProva.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelProva.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelProva.txtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelProva.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelProva.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

end;

procedure TfrmSelProva.Filtra;
begin

   with qyProva do begin

      Close();
      SQL.Text := 'SELECT * FROM leitora_provas WHERE nr_prova = :nr_prova ';
      ParamByName('nr_prova').AsInteger := StrToInt(txtNroProva.Text);

      if (txtDescricao.Text <> '') then begin
         SQL.Add('AND ds_prova LIKE :ds_prova ');
         ParamByName('ds_prova').AsString := '%'+txtDescricao.Text+'%';
      end;

      SQL.Add('ORDER BY nr_prova, ds_prova');
      Open();

   end;

end;

procedure TfrmSelProva.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyProva, pmQtd);

end;

procedure TfrmSelProva.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelProva.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelProva.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if (Button = btNext) then
  begin
     txtNroProva.text := IntToStr(StrToInt(txtNroProva.text)+1);
     Filtra;
  end
  else if (Button = btPrev) AND (StrToInt(txtNroProva.text) > 1) then
  begin
     txtNroProva.text := IntToStr(StrToInt(txtNroProva.text)-1);
     Filtra;
  end;

end;

end.
