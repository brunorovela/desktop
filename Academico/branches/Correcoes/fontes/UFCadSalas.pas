unit UFCadSalas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
   ToolWin, ComCtrls, ImgList, Grids, DBGrids, Tabs, StdCtrls, Mask, DBCtrls,
   Buttons;

type
   TfCadSalas = class(TForm)
      qrySalas: TUMZQuery;
      qrySalasCD_SALA: TLargeintField;
      qrySalasDS_SALA: TStringField;
      qrySalasSN_ATIVO: TSmallintField;
      bvlSep1: TBevel;
      ilOpcoes: TImageList;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnSelecionar: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      bvlSep2: TBevel;
      pnlGeral: TPanel;
      bvlSep3: TBevel;
      dbgSalas: TDBGrid;
      dsSalas: TDataSource;
      pgcOpcoes: TPageControl;
      tbsBusca: TTabSheet;
      tbsCadastro: TTabSheet;
      tsOpcoes: TTabSet;
      lblBuscaDesc: TLabel;
      edtBuscaDesc: TEdit;
      lblCadDesc: TLabel;
      dbeCadDesc: TDBEdit;
      sbSalvar: TSpeedButton;
      sbCancelar: TSpeedButton;
    qrySalasnr_qtd_vagas: TIntegerField;
    procedure dsSalasStateChange(Sender: TObject);
    procedure dbgSalasDblClick(Sender: TObject);
      procedure qrySalasAfterCancel(DataSet: TDataSet);
      procedure qrySalasAfterPost(DataSet: TDataSet);
      procedure edtBuscaDescEnter(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure qrySalasAfterOpen(DataSet: TDataSet);
      procedure btnSelecionarClick(Sender: TObject);
      procedure sbCancelarClick(Sender: TObject);
      procedure tsOpcoesChange(Sender: TObject; NewTab: Integer;
         var AllowChange: Boolean);
      procedure FormDestroy(Sender: TObject);
      procedure dbeCadDescKeyPress(Sender: TObject; var Key: Char);
      procedure sbSalvarClick(Sender: TObject);
      procedure qrySalasNewRecord(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure edtBuscaDescChange(Sender: TObject);
   end;

var
   fCadSalas: TfCadSalas;

implementation

uses uUsuario, uDM;

{$R *.dfm}

procedure TfCadSalas.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfCadSalas.btnSelecionarClick(Sender: TObject);
begin
   if not qrySalas.IsEmpty then
   begin
      ModalResult := mrOk;
   end;
end;

procedure TfCadSalas.dbeCadDescKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      qrySalas.Post;
   end
   else if Key = #27 then
   begin
      qrySalas.Cancel;
   end;
end;

procedure TfCadSalas.dbgSalasDblClick(Sender: TObject);
begin
   if not qrySalas.IsEmpty then
   begin
      ModalResult := mrOk;
   end;
end;

procedure TfCadSalas.dsSalasStateChange(Sender: TObject);
begin
   dbgSalas.Enabled := qrySalas.State <> dsInsert;
end;

procedure TfCadSalas.edtBuscaDescChange(Sender: TObject);
var
   S: string;
begin
   if fsItalic in edtBuscaDesc.Font.Style then
   begin
      edtBuscaDesc.Font.Style := [];
   end;

   S := Trim(edtBuscaDesc.Text);

   if S <> '' then
   begin
      qrySalas.Filter := Format('DS_SALA LIKE %s', [QuotedStr(AnsiQuotedStr(S, #42))]);
      if not qrySalas.Filtered then
      begin
         qrySalas.Filtered := True;
      end;
   end
   else if qrySalas.Filtered then
   begin
      qrySalas.Filtered := False;
   end;
end;

procedure TfCadSalas.edtBuscaDescEnter(Sender: TObject);
begin
   edtBuscaDesc.Clear;
end;

procedure TfCadSalas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfCadSalas.FormCreate(Sender: TObject);
begin
   qrySalas.Open;
end;

procedure TfCadSalas.FormDestroy(Sender: TObject);
begin
   qrySalas.Close;
end;

procedure TfCadSalas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_RETURN, VK_F8:
         begin
            btnSelecionar.Click;
         end;
      VK_F12:
         begin
            btnFechar.Click;
         end;   
   end;
end;

procedure TfCadSalas.qrySalasAfterCancel(DataSet: TDataSet);
begin
   tsOpcoes.SelectNext(False);
end;

procedure TfCadSalas.qrySalasAfterOpen(DataSet: TDataSet);
begin
   btnSelecionar.Enabled := not qrySalas.IsEmpty;
end;

procedure TfCadSalas.qrySalasAfterPost(DataSet: TDataSet);
begin
   tsOpcoes.SelectNext(False);
   btnSelecionar.Enabled := not qrySalas.IsEmpty;
end;

procedure TfCadSalas.qrySalasNewRecord(DataSet: TDataSet);
var
   S: string;
begin
   if not (fsItalic in edtBuscaDesc.Font.Style) then
   begin
      S := Trim(edtBuscaDesc.Text);
   end
   else
      S := '';

   qrySalasDS_SALA.AsString := S;
   qrySalasSN_ATIVO.AsInteger := 1;
end;

procedure TfCadSalas.sbCancelarClick(Sender: TObject);
begin
   qrySalas.Cancel;
end;

procedure TfCadSalas.sbSalvarClick(Sender: TObject);
begin
   qrySalas.Post;
end;

procedure TfCadSalas.tsOpcoesChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   pgcOpcoes.ActivePageIndex := NewTab;


   if NewTab = 0 then
   begin
      if qrySalas.State in dsEditModes then
      begin
         qrySalas.Cancel;
      end;
   end
   else if NewTab = 1 then
   begin
      if not DM.UsuarioLogado.TemPermissao( 0, 'Academico.Turmas.CadastroSalas', npAcesso, True ) then
      begin
        pgcOpcoes.ActivePageIndex := 0;

        if qrySalas.State in dsEditModes then
        begin
          qrySalas.Cancel;
        end;
        abort;
      end;



      qrySalas.Insert;
      dbeCadDesc.SetFocus;
   end;
end;

end.
