unit uAlunosDetalhes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons, DBCtrls, ZAbstractRODataset, ZAbstractDataset,
  UZDataset;

type
  Tfrm_Detalhes = class(TForm)
    qyDetalhes: TUMZQuery;
    srcDetalhes: TDataSource;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    qyDetalhescd_pessoa: TIntegerField;
    qyDetalhescd_candidato: TIntegerField;
    qyDetalhesds_status: TStringField;
    qyDetalhescd_inst_vestibular: TIntegerField;
    qyDetalhesds_curso: TStringField;
    qyDetalhesnm_pessoa: TStringField;
    qyDetalhescurso: TStringField;
    qyDetalhesturma: TStringField;
    qyDetalhesds_contato: TStringField;
    qyDetalhesapelido: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qyDetalhesnm_instituicao: TStringField;
    Label7: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    qyDetalhesanosemestre: TSmallintField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_Detalhes: Tfrm_Detalhes;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Detalhes.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Detalhes.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Detalhes.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Detalhes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Detalhes.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Detalhes.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

end;

procedure Tfrm_Detalhes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Detalhes.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

end.
