unit uSelCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  Tfrm_SelCaixa = class(TForm)
    qyCaixa: TUMZQuery;
    srcCaixa: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    edDescricao: TEdit;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    qyCaixaativa: TStringField;
    qyCaixacd_caixa: TIntegerField;
    qyCaixads_caixa: TStringField;
    qyCaixasn_ativa: TStringField;
    qyCaixacd_coligada: TSmallintField;
    sbSelecionar: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbSelecionarClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qyCaixaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    iForcarColigada : Integer;
    { Public declarations }
  end;

var
  frm_SelCaixa: Tfrm_SelCaixa;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_SelCaixa.grdDblClick(Sender: TObject);
begin
   sbSelecionarClick(Self);
end;

procedure Tfrm_SelCaixa.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   { Bloqueia o CRTL+DEL }
   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;
end;

procedure Tfrm_SelCaixa.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    sbSelecionarClick(Self);
    Key := #0;
  end;
end;

procedure Tfrm_SelCaixa.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_SelCaixa.edDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_SelCaixa.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_SelCaixa.FormShow(Sender: TObject);
begin
  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra();

  edDescricao.SetFocus();

end;

procedure Tfrm_SelCaixa.Filtra();
var
   sOp : String;
begin

   qyCaixa.Close;
   qyCaixa.SQL.Clear;

   qyCaixa.SQL.Text := '' +
     ' SELECT cc.cd_caixa, cc.ds_caixa, cc.cd_coligada, cc.sn_ativa  ' +
     ' FROM fin_cadastro_contas cc                          ' +
     ' INNER JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa ) AND (cc.CD_COLIGADA = u.CD_COLIGADA) ' +
     ' WHERE cc.sn_ativa = "S"           ' +
     Format( '   AND ( cc.cd_coligada IN ( %s ) ', [ DM.UsuarioLogado.GetColigadasFilhaSelecionada() ] ) + 
     '         OR cc.sn_todas_coligadas = 1 ) ' +
     '   AND u.cd_usuario = ' + IntToStr(DM.iCdPessoaLogado);

   qyCaixa.Open();

   sOp := ' AND ' ;

   if edDescricao.Text <> '' then begin
      qyCaixa.SQL.Add( sOP + ' cc.ds_caixa LIKE :descricao ' );
      qyCaixa.ParamByName('descricao').AsString := edDescricao.Text;
      sOP := ' AND ';
   end;

   if iForcarColigada > 0 then begin
      qyCaixa.SQL.Add( sOP + ' cc.cd_coligada = :cd_coligada ' );
      qyCaixa.ParamByName('cd_coligada').AsInteger := iForcarColigada;
      sOP := ' AND ';

   end;

   qyCaixa.SQL.Add( ' ORDER BY                          ');
   qyCaixa.SQL.Add( '   cc.ds_caixa                     ');

   qyCaixa.Open();
end;

procedure Tfrm_SelCaixa.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyCaixa, pmQtd);

end;

procedure Tfrm_SelCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  iForcarColigada := 0;
end;

procedure Tfrm_SelCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));

  if qyCaixa.RecordCount <= 0 then begin
      flgSearch := False;
  end;
  
end;

procedure Tfrm_SelCaixa.FormCreate(Sender: TObject);
begin
   iForcarColigada := 0;
end;

procedure Tfrm_SelCaixa.qyCaixaCalcFields(DataSet: TDataSet);
begin

  if qyCaixa.FieldByName('sn_ativa').AsString = 'S' then
    qyCaixa.FieldByName('ativa').AsString := 'X';
end;

procedure Tfrm_SelCaixa.sbSelecionarClick(Sender: TObject);
begin
  if qyCaixa.RecordCount <= 0 then begin
     Mensagem('Selecione uma conta.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     Exit;
  end;

  flgSearch := True;
  Close;
end;

end.

