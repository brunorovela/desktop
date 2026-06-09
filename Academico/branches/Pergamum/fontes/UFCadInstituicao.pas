unit UFCadInstituicao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Tabs, ComCtrls, ImgList, DB, ZAbstractRODataset,
   ZAbstractDataset, UZDataset, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Mask,
   ToolWin, uMensagem, General, uDM;

type
   TfCadInstituicao = class(TForm)
      tsOpcoes: TTabSet;
      ilOpcoes: TImageList;
      pgcOpcoes: TPageControl;
      tbsConsulta: TTabSheet;
      tbsCadastro: TTabSheet;
      pnlFiltros: TPanel;
      qryInstituicoes: TUMZQuery;
      qryEstados: TUMZReadOnlyQuery;
      qryEstadosCD_MEC: TLargeintField;
      qryEstadosDS_UF: TStringField;
      qryEstadosDS_ESTADO: TStringField;
      qryEstadosCD_PAIS: TIntegerField;
      qryPaises: TUMZReadOnlyQuery;
      qryInstituicoesCD_INSTITUICAO: TIntegerField;
      qryInstituicoesNM_INSTITUICAO: TStringField;
      qryInstituicoesNM_FANTASIA: TStringField;
      qryInstituicoesDS_CIDADE: TStringField;
      qryInstituicoesDS_ESTADO: TStringField;
      qryInstituicoesCD_MUNICIPIO_CORREIO: TIntegerField;
      lblFiltroNome: TLabel;
      edtFiltroNome: TEdit;
      qryInstituicoesNM_ESTADO: TStringField;
      lblFiltroEstado: TLabel;
      dsEstados: TDataSource;
      dblcFiltroEstados: TDBLookupComboBox;
      lblFiltroMunicipio: TLabel;
      qryMunicipios: TUMZReadOnlyQuery;
      dsMunicipios: TDataSource;
      lblFiltroPaises: TLabel;
      dblcFiltroPaises: TDBLookupComboBox;
      dsPaises: TDataSource;
      bvlSep1: TBevel;
      dbgInstituicoes: TDBGrid;
      dsInstituicoes: TDataSource;
      qryMunicipiosCD_MUNICIPIO: TLargeintField;
      qryMunicipiosCD_ESTADO: TLargeintField;
      qryMunicipiosUF: TStringField;
      qryMunicipiosDS_MUNICIPIO: TStringField;
      lblNome: TLabel;
      dbeNome: TDBEdit;
      lblNomeFantasia: TLabel;
      dbeNomeFantasia: TDBEdit;
      lblPais: TLabel;
      dblcPaises: TDBLookupComboBox;
      lblEstado: TLabel;
      dblcEstados: TDBLookupComboBox;
      lblMunicipio: TLabel;
      bvlSep2: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnIncluir: TToolButton;
      btnSep2: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      btnSelecionar: TToolButton;
      btnSep4: TToolButton;
      btnFechar: TToolButton;
      ilToolBar: TImageList;
      bvlSep3: TBevel;
      sbFiltrar: TSpeedButton;
      qryPaisesCD_PAIS: TLargeintField;
      qryPaisesDS_PAIS: TStringField;
      qryPaisesDS_SIGLA: TStringField;
      qryPaisesDS_NACIONALIDADE: TStringField;
      dblcFiltroMunicipios: TDBLookupComboBox;
      sbLimpar: TSpeedButton;
      dblcMunicipios: TDBLookupComboBox;
   	  qryInstituicoesDS_TIPO: TStringField;
   	  DBRadioGroup1: TDBRadioGroup;
      qryInstituicoessn_irregular: TSmallintField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgInstituicoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dblcFiltroMunicipiosKeyPress(Sender: TObject; var Key: Char);
      procedure dblcFiltroEstadosKeyPress(Sender: TObject; var Key: Char);
      procedure dblcFiltroPaisesKeyPress(Sender: TObject; var Key: Char);
      procedure edtFiltroNomeKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure dsInstituicoesStateChange(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure dbgInstituicoesDblClick(Sender: TObject);
      procedure sbLimparClick(Sender: TObject);
      procedure sbFiltrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnSelecionarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure tsOpcoesChange(Sender: TObject; NewTab: Integer;
         var AllowChange: Boolean);
   private
      procedure FiltraInstituicoes;
   end;

var
   fCadInstituicao: TfCadInstituicao;

implementation

{$R *.dfm}

procedure TfCadInstituicao.btnCancelarClick(Sender: TObject);
begin
   qryInstituicoes.Cancel;
   tsOpcoes.TabIndex := 0;
end;

procedure TfCadInstituicao.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfCadInstituicao.btnIncluirClick(Sender: TObject);
begin
   if not qryInstituicoes.Active then
      FiltraInstituicoes;
   tsOpcoes.TabIndex := 1;
end;

procedure TfCadInstituicao.btnSalvarClick(Sender: TObject);
begin

   if (dbeNome.Text = '') then
   begin
      Mensagem('Por favor informe um nome.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   if (dbeNomeFantasia.Text = '') then
   begin
      Mensagem('Por favor informe um nome fantasia.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   if (dblcPaises.Text = '') then
   begin
      Mensagem('Por favor informe um país.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   if ((dblcEstados.Text = '') AND (qryEstados.recordCount > 0)) then
   begin
      Mensagem('Por favor informe um estado.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   if ((dblcMunicipios.Text = '') AND (qryMunicipios.recordCount > 0)) then
   begin
      Mensagem('Por favor informe um município.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   if (DBRadioGroup1.Value = '') then
   begin
      Mensagem('Por selecione uma categoria.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   qryInstituicoes.Post;
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfCadInstituicao.btnSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfCadInstituicao.dbgInstituicoesDblClick(Sender: TObject);
begin
   if not qryInstituicoes.IsEmpty then
   begin
      ModalResult := mrOk;
      CloseModal;
   end;
end;

procedure TfCadInstituicao.dbgInstituicoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if( qryInstituicoes.FieldByName('sn_irregular').AsInteger = 1) then
   begin
       dbgInstituicoes.Canvas.Brush.Color := clRed;
   end;
   dbgInstituicoes.DefaultDrawDataCell(Rect, dbgInstituicoes.columns[datacol].field, State);
end;

procedure TfCadInstituicao.dblcFiltroEstadosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      dblcFiltroMunicipios.SetFocus;
end;

procedure TfCadInstituicao.dblcFiltroMunicipiosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      sbFiltrar.Click;
end;

procedure TfCadInstituicao.dblcFiltroPaisesKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      dblcFiltroEstados.SetFocus;
end;

procedure TfCadInstituicao.dsInstituicoesStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := qryInstituicoes.State = dsBrowse;
   btnSalvar.Enabled := qryInstituicoes.State = dsInsert;
   btnCancelar.Enabled := qryInstituicoes.State = dsInsert;
   btnSelecionar.Enabled := (not qryInstituicoes.IsEmpty) and
      (tsOpcoes.TabIndex = 0) and (qryInstituicoes.State = dsBrowse);
end;

procedure TfCadInstituicao.edtFiltroNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      dblcFiltroPaises.SetFocus;
end;

procedure TfCadInstituicao.FiltraInstituicoes;
const
   SFiltroNome = 'NM_INSTITUICAO LIKE %s';
   SFiltroUF = 'DS_ESTADO = %s';
   SFiltroMunicipio = 'DS_CIDADE LIKE %s';
   SSQLInstituicoes =
      'SELECT ' + #13#32#32#32 +
         'CD_INSTITUICAO,' + #13#32#32#32 +
         'NM_INSTITUICAO,' + #13#32#32#32 +
         'NM_FANTASIA,' + #13#32#32#32 +
         'DS_CIDADE,' + #13#32#32#32 +
         'DS_ESTADO,' + #13#32#32#32 +
         'CD_MUNICIPIO_CORREIO, ' + #13#32#32#32 +
         'DS_TIPO, ' + #13 +
         'sn_irregular ' + #13 +
      'FROM ' + #13#32#32#32 +
         'INSTITUICOES_ENSINO ' + #13 +
      'WHERE ' + #13#32#32#32 +
         '%s';
var
   Filtro: string;
begin
   if Trim(edtFiltroNome.Text) <> '' then
   begin
      Filtro := Format(SFiltroNome, [QuotedStr(AnsiQuotedStr(edtFiltroNome.Text, #37))])
   end
   else
      Filtro := '';

   if dblcFiltroEstados.KeyValue <> Null then
   begin
      if Filtro <> '' then
         Filtro := Filtro + ' AND ';
      Filtro := Filtro + Format(SFiltroUF, [QuotedStr(qryEstadosDS_UF.AsString)]);
   end;

   if dblcFiltroMunicipios.KeyValue <> Null then
   begin
      if Filtro <> '' then
         Filtro := Filtro + ' AND ';
      Filtro := Filtro + Format(SFiltroMunicipio,
         [QuotedStr(qryMunicipiosDS_MUNICIPIO.AsString)]);
   end;

   if Filtro = '' then
      Filtro := 'CD_INSTITUICAO IS NULL';

   if qryInstituicoes.Active then
      qryInstituicoes.Close;
   qryInstituicoes.SQL.Text := Format(SSQLInstituicoes, [Filtro]);
   qryInstituicoes.Open;
end;

procedure TfCadInstituicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM.Set_Parametros_usuario(TForm(Self));
   
   Action := caFree;
end;

procedure TfCadInstituicao.FormCreate(Sender: TObject);
begin
   qryPaises.Open;
   qryEstados.Open;
   qryMunicipios.Open;
end;

procedure TfCadInstituicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         btnIncluir.Click;
      VK_F5:
         btnSalvar.Click;
      VK_F6:
         btnCancelar.Click;
      VK_F8:
         btnSelecionar.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

procedure TfCadInstituicao.FormShow(Sender: TObject);
begin
   DM.Parametros_usuario(TForm(self));
end;

procedure TfCadInstituicao.sbFiltrarClick(Sender: TObject);
begin
   FiltraInstituicoes;
end;

procedure TfCadInstituicao.sbLimparClick(Sender: TObject);
begin
   edtFiltroNome.Clear;
   dblcFiltroPaises.KeyValue := Null;
   dblcFiltroEstados.KeyValue := Null;
   dblcFiltroMunicipios.KeyValue := Null;
end;

procedure TfCadInstituicao.tsOpcoesChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   pgcOpcoes.ActivePageIndex := NewTab;
   
   if NewTab = 1 then
   begin
      if not qryInstituicoes.Active then
         FiltraInstituicoes;
      qryInstituicoes.Insert;
   end
   else if NewTab = 0 then
   begin
      if qryInstituicoes.State = dsInsert then
         qryInstituicoes.Cancel;
   end;
end;

end.
