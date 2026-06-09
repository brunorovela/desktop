unit uFPintBuscaSalas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Grids, DBGrids,
   DB, ZConnection, DBCtrls, Contnrs, Buttons, ZAbstractRODataset,
   ZAbstractDataset, ZDataset, UZDataset, uDM, ufPIntGeracao, ufPIntRelatorios;

type
   TfPintBuscaSalas = class(TForm)
      btnFiltrar: TBitBtn;
      bvlSep2: TBevel;
      pnlTitulo: TPanel;
      bvlSep3: TBevel;
      pnlFiltros: TPanel;
      lblSala: TLabel;
      edtSala: TEdit;
      ilImagens: TImageList;
      tlbAcoes: TToolBar;
      btnSep1: TToolButton;
      btnSelecionar: TToolButton;
      btnSep2: TToolButton;
      btnSair: TToolButton;
      btnSep3: TToolButton;
      bvlSep4: TBevel;
      bvlSep1: TBevel;
      dbgSalas: TDBGrid;
      qrySalas: TUMZQuery;
      dsSalas: TDataSource;
      qrySalascd_sala: TLargeintField;
      qrySalasds_sala: TStringField;
      qrySalasqtd_vagas: TLargeintField;
      qrySalascd_prova: TLargeintField;
      qrySalassn_ativo: TSmallintField;
      qrySalaslotacao: TLargeintField;
      procedure dbgSalasColEnter(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure qrySalasAfterOpen(DataSet: TDataSet);
      procedure btnSairClick(Sender: TObject);
      procedure cbProvasSelect(Sender: TObject);
      procedure edtSalaKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure edtSalaExit(Sender: TObject);
      procedure edtSalaEnter(Sender: TObject);
   strict private
      FIRegraEnsalamento: integer;
      FSlSalas: TStringList;
      procedure Filtra;
   private
      property RegraEnsalamento: integer read FIRegraEnsalamento write FIRegraEnsalamento;
   public
      class procedure GetSalas(const AIRegraEnsalamento: Integer;
         const ASTituloProva: string);
   end;

var
   fPintBuscaSalas: TfPintBuscaSalas;

implementation

{$R *.dfm}

procedure TfPintBuscaSalas.btnFiltrarClick(Sender: TObject);
begin
   Filtra;
end;

procedure TfPintBuscaSalas.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPintBuscaSalas.cbProvasSelect(Sender: TObject);
begin
   Filtra;
   edtSala.SetFocus;
end;

procedure TfPintBuscaSalas.dbgSalasColEnter(Sender: TObject);
begin
   dbgSalas.BeginDrag(true);
end;

procedure TfPintBuscaSalas.edtSalaEnter(Sender: TObject);
begin
   if edtSala.Text = 'Identificação da sala...' then
      edtSala.Clear;
   edtSala.Font.Style := [];
   edtSala.Font.Color := clWindowText;
end;

procedure TfPintBuscaSalas.edtSalaExit(Sender: TObject);
begin
   if Trim(edtSala.Text) = '' then
   begin
      edtSala.Text := 'Identificação da sala...';
      edtSala.Font.Style := [fsItalic];
      edtSala.Font.Color := clGray;
   end;
end;

procedure TfPintBuscaSalas.edtSalaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Filtra;
end;

procedure TfPintBuscaSalas.Filtra;
begin
   qrySalas.Close;
   qrySalas.ParamByName('cd_regra_ensalamento').AsInteger := FIRegraEnsalamento;
   if edtSala.Text = 'Identificação da sala...' then
      qrySalas.ParamByName('ds_sala').AsString := '%'
   else
      qrySalas.ParamByName('ds_sala').AsString := '%' + Trim(edtSala.Text) + '%';
   qrySalas.Open;
end;

procedure TfPintBuscaSalas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qrySalas.Close;
end;

procedure TfPintBuscaSalas.FormCreate(Sender: TObject);
begin
   FSlSalas := TStringList.Create;
end;

procedure TfPintBuscaSalas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

class procedure TfPintBuscaSalas.GetSalas(const AIRegraEnsalamento: Integer;
  const ASTituloProva: string);
begin
   if not Assigned(fPintBuscaSalas) then
      Application.CreateForm(TfPintBuscaSalas, fPintBuscaSalas);
   fPintBuscaSalas.RegraEnsalamento := AIRegraEnsalamento;
   fPintBuscaSalas.Caption := ASTituloProva;
   fPintBuscaSalas.Filtra;

   try
      fPIntGeracao.SetFocus;

      fPintBuscaSalas.Top := fPIntGeracao.Top;
      fPintBuscaSalas.Left := fPIntGeracao.Left + fPIntGeracao.Width
   except
   
      fPintBuscaSalas.Top := fPIntRelatorios.Top;
      fPintBuscaSalas.Left := fPIntRelatorios.Left + fPIntRelatorios.Width;
   end;
   fPintBuscaSalas.Show;
end;

procedure TfPintBuscaSalas.qrySalasAfterOpen(DataSet: TDataSet);
begin
   btnSelecionar.Enabled := not qrySalas.IsEmpty;
end;

end.

