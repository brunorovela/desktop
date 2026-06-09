unit uSelCep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Menus;

type
  TfrmSelCep = class(TForm)
    qyCep: TUMZQuery;
    dtcCep: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    btnFechar: TButton;
    edLogradouro: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    qyCepnm_logradouro: TStringField;
    qyCepds_cep: TStringField;
    qyCepds_complemento: TStringField;
    qyCepnm_bairro: TStringField;
    qyCepnm_cidade: TStringField;
    qyCepds_uf: TStringField;
    edCep: TEdit;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    qyCepds_pais: TStringField;
    qyCepcd_cidade: TIntegerField;
    qyCepcd_municipio: TLargeintField;
    qyCepds_logradouro: TStringField;
    qyCepcd_logradouro: TIntegerField;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure Filtra;
    procedure meCepKeyPress(Sender: TObject; var Key: Char);
    procedure edCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edLogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure edBairroKeyPress(Sender: TObject; var Key: Char);
    procedure edCepKeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    PadraoCurso : String;
    PadraoTurma : String;
    PadraoProfessor : Integer;
    PadraoAnosemestre : Integer;

    { Public declarations }
  end;

var
  frmSelCep: TfrmSelCep;

implementation

uses Main, uDM, uFSelecionarCurso, Math;

{$R *.DFM}

procedure TfrmSelCep.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelCep.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelCep.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelCep.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelCep.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  Filtra;

end;


procedure TfrmSelCep.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelCep.Filtra;
begin

  qyCep.Close;
  qyCep.SQL.Clear;

  qyCep.SQL.Text := ' ' +
                    ' SELECT DISTINCT ' +
                    '  	nm_logradouro, ' +
                    '   ct.ds_logradouro, ' +
                    '   ct.cd_logradouro, ' +
                    ' 	cl.ds_cep, ' +
                    ' 	cl.ds_complemento, ' +
                    ' 	cb.nm_bairro, ' +
                    ' 	cc.nm_cidade, ' +
                    ' 	ce.ds_uf, ' +
                    ' 	cp.ds_pais, ' +
                    '   cc.cd_cidade, ' +
                    '   m.cd_municipio ' +
                    ' FROM ' +
                    ' 	cep_logradouros cl ' +
                    ' INNER JOIN logradouros ct ON( ' +
                    ' 	cl.cd_tipo = ct.cd_logradouro ' +
                    ' ) ' +
                    ' INNER JOIN cep_bairros cb ON( ' +
                    '   cl.cd_cidade = cb.cd_cidade ' +
                    ' 	AND cl.ds_uf = cb.ds_uf ' +
                    ' 	AND( ' +
                    ' 		cl.cd_bairro1 = cb.cd_bairro ' +
                    ' 		OR cl.cd_bairro2 = cb.cd_bairro ' +
                    ' 	) ' +
                    ' ) ' +
                    ' INNER JOIN cep_cidades cc ON( ' +
                    ' 	cl.cd_cidade = cc.cd_cidade ' +
                    ' ) ' +
                    ' INNER JOIN estados ce ON( ' +
                    ' 	cl.ds_uf = ce.ds_uf ' +
                    ' ) ' +
                    ' INNER JOIN municipios m ON( ' +
                    '    m.ds_municipio = cc.nm_cidade ' +
                    '    AND m.uf = ce.ds_uf ' +
                    ' ) ' +
                    ' INNER JOIN paises cp ON( ' +
                    ' 	cp.cd_pais = ce.cd_pais ' +
                    ' ) ' +
                    ' WHERE 1 = 1 ';

  if edCep.Text <> '' then
  begin
    qyCep.SQL.Text := qyCep.SQL.Text + ' AND cl.ds_cep = :ds_cep ';
    qyCep.ParamByName('ds_cep').AsString := edCep.Text;        
  end;

  if edCidade.Text <> '' then
  begin
    qyCep.SQL.Text := qyCep.SQL.Text + ' AND cc.nm_cidade  LIKE :nm_cidade ';
    qyCep.ParamByName('nm_cidade').AsString := '%'+edCidade.Text+'%';
  end;

  if edLogradouro.Text <> '' then
  begin
    qyCep.SQL.Text := qyCep.SQL.Text + ' AND cl.nm_logradouro LIKE :nm_logradouro ';
    qyCep.ParamByName('nm_logradouro').AsString := '%'+edLogradouro.Text+'%';
  end;

  if edBairro.Text <> '' then
  begin
    qyCep.SQL.Text := qyCep.SQL.Text + ' AND cb.nm_bairro LIKE :nm_bairro ';
    qyCep.ParamByName('nm_bairro').AsString := '%'+edBairro.Text+'%';
  end;

  qyCep.Open;

end;

procedure TfrmSelCep.meCepKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
  Filtra;

end;

procedure TfrmSelCep.edCidadeKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
  Filtra;

end;

procedure TfrmSelCep.edLogradouroKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
  Filtra;

end;

procedure TfrmSelCep.edBairroKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
  Filtra;

end;

procedure TfrmSelCep.edCepKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
  Filtra;

end;

procedure TfrmSelCep.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyCep, pmQtd);

end;

procedure TfrmSelCep.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelCep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfrmSelCep.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelCep.FormDestroy(Sender: TObject);
begin
   frmSelCep := nil;
end;

procedure TfrmSelCep.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.

