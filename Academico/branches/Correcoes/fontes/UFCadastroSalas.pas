unit UFCadastroSalas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Buttons;


type
  Tfrm_CadastroSalas = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    PnLista: TPanel;
    Bevel5: TBevel;
    grdSalas: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    PnCadastra: TPanel;
    Bevel6: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edCod: TDBEdit;
    edDesc: TDBEdit;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    edQuant: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbCodForn: TDBEdit;
    edDesForn: TDBEdit;
    dtsListaSalas: TDataSource;
    pmQtd: TPopupMenu;
    qryListaSalas: TUMZQuery;
    qryListaSalasDS_SALA: TStringField;
    qryListaSalasSN_ATIVO: TIntegerField;
    qryListaSalasSN_ATIVO_MASK: TStringField;
    qryListaSalasDS_FORNECEDOR: TStringField;
    qryListaSalasCD_SALA: TLargeintField;
    qryListaSalasQTD_VAGAS: TLargeintField;
    qryListaSalasCD_FORNECEDOR: TLargeintField;
    sbBuscaFornecedor: TSpeedButton;
    checkAtivo: TCheckBox;
    Panel1: TPanel;
    rgFiltroSalas: TRadioGroup;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    qryListaSalasnr_intervalo_uso: TLargeintField;
    procedure rgFiltroSalasClick(Sender: TObject);
    procedure checkAtivoEnter(Sender: TObject);
    procedure dtsListaSalasDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsListaSalasStateChange(Sender: TObject);
    procedure sbBuscaFornecedorClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure edQuantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadastroSalas: Tfrm_CadastroSalas;

implementation

uses Main, uDM, uUsuario, uChecarUsoColigada, uFormaIngresso, uFSelecionarPessoa;

{$R *.dfm}

procedure Tfrm_CadastroSalas.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao( 0, 'Academico.Turmas.CadastroSalas', npAlterar, True ) then
   begin
      qryListaSalas.Edit;
      edDesc.SetFocus;
   end;
end;

procedure Tfrm_CadastroSalas.btnCancelarClick(Sender: TObject);
begin
  qryListaSalas.Cancel;
end;

procedure Tfrm_CadastroSalas.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_CadastroSalas.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao( 0, 'Academico.Turmas.CadastroSalas', npIncluir, True ) then
   begin
      checkAtivo.Checked := false;
      edDesc.SetFocus;
      qryListaSalas.Insert;
   end;
end;

procedure Tfrm_CadastroSalas.btnSalvarClick(Sender: TObject);
const
  sqlCadastraSala =
      'INSERT INTO unim_sala ('+
        'DS_SALA, '+
        'QTD_VAGAS, '+
        'SN_ATIVO, '+
        'CD_FORNECEDOR,'+
        'nr_intervalo_uso'+
      ') VALUES ('+
        ':ds_sala, :qtd_vagas, :sn_ativo, :cd_fornecedor, :nr_intervalo_uso)';
  sqlUpdateSala =
      'UPDATE unim_sala '+
        'SET DS_SALA = :ds_sala, '+
        'QTD_VAGAS = :qtd_vagas, '+
        'SN_ATIVO = :sn_ativo, '+
        'CD_FORNECEDOR = :cd_fornecedor, '+
        'nr_intervalo_uso = :nr_intervalo_uso '+
      'WHERE id = :cd_sala';
var
  qryAux : TUMZQuery;
begin
   // Altera ou edita as salas manualmentes por causa da FK de turmas -> sala
   DM.CriarConsulta(qryAux);
  
   if qryListaSalas.State = DsEdit then
   begin
      qryAux.SQL.Text := sqlUpdateSala;
      qryAux.ParamByName('cd_sala').AsInteger := qryListaSalasCD_SALA.AsInteger
   end else begin
      qryAux.SQL.Text := sqlCadastraSala;
   end;

   qryAux.ParamByName('ds_sala').AsString := edDesc.Text;

   if StrToIntDef(edQuant.Text, -1) >= 0 then
   begin
      qryAux.ParamByName('qtd_vagas').AsInteger  := StrToInt(edQuant.Text);
   end else begin
      qryAux.ParamByName('qtd_vagas').Clear();
   end;


   if checkAtivo.Checked then
      qryAux.ParamByName('sn_ativo').AsInteger := 1
   else
      qryAux.ParamByName('sn_ativo').AsInteger := 0;

   if StrToIntDef(dbCodForn.Text, -1) >= 0 then
   begin
      qryAux.ParamByName('cd_fornecedor').AsInteger := StrToInt(dbCodForn.Text);
   end else begin
      qryAux.ParamByName('cd_fornecedor').Clear();
   end;

   if StrToIntDef(DBEdit1.Text, -1) >= 0 then
   begin
      qryAux.ParamByName('nr_intervalo_uso').AsInteger := StrToInt(DBEdit1.Text);
   end else begin
      qryAux.ParamByName('nr_intervalo_uso').AsInteger := 0;
   end;

   qryAux.ExecSQL;

   qryListaSalas.Close;
   qryListaSalas.Open;
   grdSalas.Refresh;
end;

procedure Tfrm_CadastroSalas.checkAtivoEnter(Sender: TObject);
begin
  if not (qryListaSalas.State = dsInsert) then
  begin
    checkAtivo.Checked := not checkAtivo.Checked;
    btnAlterarClick(nil);
  end;
end;

procedure Tfrm_CadastroSalas.dtsListaSalasDataChange(Sender: TObject;
  Field: TField);
begin
  if not (qryListaSalas.State in [dsInsert,dsEdit]) then
    begin
    if qryListaSalasSN_ATIVO.AsInteger = 1 then
      checkAtivo.Checked := true
    else
      checkAtivo.Checked := false ;
  end;
end;

procedure Tfrm_CadastroSalas.dtsListaSalasStateChange(Sender: TObject);
begin
   btnInserir.Enabled := not (qryListaSalas.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled := not (qryListaSalas.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled := qryListaSalas.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryListaSalas.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (qryListaSalas.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadastroSalas.edQuantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  charAux : Char;
  stringAux: string;
begin

   if length(edQuant.Text) = 0 then
   begin
      exit;
   end;

  stringAux := copy(edQuant.Text,length(edQuant.Text),1);
  charAux := stringAux[1];

  if edQuant.Focused() then
  begin
     if charAux in ['1','2','3','4','5','6','7','8','9','0'] then
        exit
     else
     begin
        stringAux := edQuant.Text;
        delete(stringAux,length(stringAux),1);
        edQuant.Text := stringAux;
        edQuant.SetFocus;
        edQuant.Selstart := Length(edQuant.text);
        exit;
     end;
  end;
end;

procedure Tfrm_CadastroSalas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_CadastroSalas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;

end;

procedure Tfrm_CadastroSalas.FormShow(Sender: TObject);
begin
  rgFiltroSalas.ItemIndex := 1;
  rgFiltroSalasClick(nil);
end;

procedure Tfrm_CadastroSalas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryListaSalas, pmQtd);
end;

procedure Tfrm_CadastroSalas.rgFiltroSalasClick(Sender: TObject);
const
  sqlListaSalas = 'SELECT '+
   'u.id as CD_SALA, '+
   'u.DS_SALA, '+
   'u.QTD_VAGAS, '+
   'CASE WHEN u.SN_ATIVO = 0 THEN ''Não'' ELSE ''Sim'' END as SN_ATIVO_MASK, '+
   'u.SN_ATIVO, '+  
   'u.CD_FORNECEDOR, '+
   'u.nr_intervalo_uso, '+
   'p.NM_PESSOA as DS_FORNECEDOR '+
'FROM '+
   'unim_sala u '+
'LEFT JOIN pessoas p ON  (p.CD_PESSOA = u.CD_FORNECEDOR)';
begin
  qryListaSalas.Close;
  qryListaSalas.SQL.Clear;
  qryListaSalas.SQL.Add(sqlListaSalas);

  if rgFiltroSalas.ItemIndex < 2 then
  begin
    qryListaSalas.SQL.Add('where sn_ativo = :ativo ');
    qryListaSalas.ParamByName('ativo').AsInteger := rgFiltroSalas.ItemIndex;
  end;
  
  qryListaSalas.Open;
  grdSalas.Refresh;
end;

procedure Tfrm_CadastroSalas.sbBuscaFornecedorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

   if resultado_filtro.filtrado then
   begin
      if qryListaSalas.State <> dsInsert then
        btnAlterarClick(nil);
        
     qryListaSalasCD_FORNECEDOR.AsInteger := resultado_filtro.cd_pessoa;
     qryListaSalasDS_FORNECEDOR.AsString := resultado_filtro.nm_pessoa;
   end;
end;

end.
