unit uSelCentro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  Tfrm_SelCentro = class(TForm)
    qyCentros: TUMZQuery;
    srcCentros: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    edClassificacao: TEdit;
    pmQtd: TPopupMenu;
    Label1: TLabel;
    edDescricao: TEdit;
    btnFechar: TSpeedButton;
    qyCentrosCD_CENTRO: TLargeintField;
    qyCentrosDS_CENTRO: TStringField;
    qyCentrosCD_CLASSIFICACAO: TStringField;
    qyCentrosTP_CENTRO: TIntegerField;
    qyCentrosCD_GRUPO: TLargeintField;
    qyCentrosSN_ATIVO: TSmallintField;
    qyCentrosDS_OBSERVACAO: TMemoField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edClassificacaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_SelCentro: Tfrm_SelCentro;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_SelCentro.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_SelCentro.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_SelCentro.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelCentro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_SelCentro.edClassificacaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edDescricao.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_SelCentro.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_SelCentro.FormShow(Sender: TObject);
begin

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra();

  edClassificacao.SetFocus;

end;

procedure Tfrm_SelCentro.Filtra;
begin

  qyCentros.Close();
  qyCentros.SQL.Clear();
  qyCentros.SQL.Add( 'SELECT                                     ');
  qyCentros.SQL.Add( '  *                                        ');
  qyCentros.SQL.Add( 'FROM                                       ');
  qyCentros.SQL.Add( '  fin_config_centro_custos                        ');

  qyCentros.SQL.Add(Format(' WHERE cd_coligada_matriz = %d ', [DM.GetUsuarioLogado.GetColigadaLogada.Codigo]));

  if edClassificacao.Text <> '' then
  begin
    qyCentros.SQL.Add(' AND cd_classificacao LIKE :cd_classificacao  ');
    qyCentros.ParamByName('cd_classificacao').AsString := '%' + edClassificacao.Text + '%';
  end;

  if edDescricao.Text <> '' then
  begin
    qyCentros.SQL.Add(' AND ds_centro LIKE :ds_centro ');
    qyCentros.ParamByName('ds_centro').AsString := '%' + edDescricao.Text + '%';
  end;

    qyCentros.SQL.Add('ORDER BY                                    ');
    qyCentros.SQL.Add('   cd_classificacao                         ');

  qyCentros.Open();

end;

procedure Tfrm_SelCentro.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyCentros, pmQtd);

end;

procedure Tfrm_SelCentro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_SelCentro.edDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;

end;

procedure Tfrm_SelCentro.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

end.

