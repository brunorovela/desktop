unit uFCadAssuntoArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Tabs, ComCtrls, ImgList, DB, ZAbstractRODataset,
   ZAbstractDataset, UZDataset, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Mask,
   ToolWin, uMensagem, General;

type
  TuFrmCadAssuntoArea = class(TForm)
    tsOpcoes: TTabSet;
    pgcOpcoes: TPageControl;
    tbsConsulta: TTabSheet;
    bvlSep1: TBevel;
    pnlFiltros: TPanel;
    lblFiltroNome: TLabel;
    sbFiltrar: TSpeedButton;
    edtFiltroNome: TEdit;
    dbgAreasAssuntos: TDBGrid;
    tbsCadastro: TTabSheet;
    lblNome: TLabel;
    dbeNome: TDBEdit;
    qyAreasAssuntos: TUMZQuery;
    ilOpcoes: TImageList;
    ilToolBar: TImageList;
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
    qyAreasAssuntoscodigo: TLargeintField;
    qyAreasAssuntoscd_modulo: TLargeintField;
    qyAreasAssuntoscd_situacao: TIntegerField;
    qyAreasAssuntosds_valor: TStringField;
    qyAreasAssuntosds_sigla: TStringField;
    qyAreasAssuntosme_descricao: TMemoField;
    qyAreasAssuntoscd_auxiliar: TLargeintField;
    dsAreasAssuntos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbgAreasAssuntosDblClick(Sender: TObject);
    procedure edtFiltroNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsAreasAssuntosStateChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure tsOpcoesChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmCadAssuntoArea: TuFrmCadAssuntoArea;

implementation

{$R *.dfm}

procedure TuFrmCadAssuntoArea.btnCancelarClick(Sender: TObject);
begin

   qyAreasAssuntos.Cancel;
   tsOpcoes.TabIndex := 0;
   
end;

procedure TuFrmCadAssuntoArea.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TuFrmCadAssuntoArea.btnIncluirClick(Sender: TObject);
begin
   tsOpcoes.TabIndex := 1;
end;

procedure TuFrmCadAssuntoArea.btnSalvarClick(Sender: TObject);
begin

   if (dbeNome.Text = '') then
   begin
      Mensagem('Por favor informe um nome.', '', MB_OK, MB_ICONWARNING);
      exit;
   end;

   qyAreasAssuntoscd_modulo.AsInteger := 1035;
   qyAreasAssuntos.Post;
   
   ModalResult := mrOk;
   CloseModal;

end;

procedure TuFrmCadAssuntoArea.btnSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TuFrmCadAssuntoArea.dbgAreasAssuntosDblClick(Sender: TObject);
begin
   if not qyAreasAssuntos.IsEmpty then
   begin
      ModalResult := mrOk;
      CloseModal;
   end;
end;

procedure TuFrmCadAssuntoArea.dsAreasAssuntosStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := qyAreasAssuntos.State = dsBrowse;
   btnSalvar.Enabled := qyAreasAssuntos.State = dsInsert;
   btnCancelar.Enabled := qyAreasAssuntos.State = dsInsert;
   btnSelecionar.Enabled := (not qyAreasAssuntos.IsEmpty) and
      (tsOpcoes.TabIndex = 0) and (qyAreasAssuntos.State = dsBrowse);
end;

procedure TuFrmCadAssuntoArea.edtFiltroNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      sbFiltrarClick(self);
   end;
end;

procedure TuFrmCadAssuntoArea.FormCreate(Sender: TObject);
begin
   qyAreasAssuntos.Open;
end;

procedure TuFrmCadAssuntoArea.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TuFrmCadAssuntoArea.sbFiltrarClick(Sender: TObject);
begin
   qyAreasAssuntos.SQL.Text := 'SELECT * from situacoes where cd_modulo = 1035 and ISNULL(cd_auxiliar) and ds_valor LIKE ''%' + edtFiltroNome.Text + '%''';
   qyAreasAssuntos.Open;
end;

procedure TuFrmCadAssuntoArea.tsOpcoesChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin

   pgcOpcoes.ActivePageIndex := NewTab;

   if NewTab = 1 then
   begin
      qyAreasAssuntos.Insert;      
   end;

   if NewTab = 0 then
   begin
      if qyAreasAssuntos.State = dsInsert then
      begin
         qyAreasAssuntos.Cancel;
      end;
   end;
   
end;

end.
