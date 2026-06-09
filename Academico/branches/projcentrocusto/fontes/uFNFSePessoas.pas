unit uFNFSePessoas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, StdCtrls, Buttons, Grids,
   uFNFSe;

type
   TfNFSePessoas = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      tlbOpcoes: TToolBar;
      ilImagens: TImageList;
      btnSep1: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      bvlSep3: TBevel;
      pnlFiltros: TPanel;
      ledCodigo: TLabeledEdit;
      ledNome: TLabeledEdit;
      bbtnFiltrar: TBitBtn;
      bvlSep4: TBevel;
      sgPessoas: TStringGrid;
      procedure sgPessoasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure sgPessoasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      procedure sgPessoasDblClick(Sender: TObject);
      procedure ledNomeKeyPress(Sender: TObject; var Key: Char);
      procedure ledCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      FPontoClick: TPoint;
      procedure FiltraPessoas;
   end;

var
   fNFSePessoas: TfNFSePessoas;

implementation

uses DB;

{$R *.dfm}

procedure TfNFSePessoas.bbtnFiltrarClick(Sender: TObject);
begin
   FiltraPessoas;
end;

procedure TfNFSePessoas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfNFSePessoas.FiltraPessoas;
var
   LILinha, LICodAnterior: integer;
   LBFilCodigo, LBFilNome, LBAchouCodigo, LBAchouNome, LBNaoFiltrar,
   LBNovoCodigo, LBNaoIncluido, LBAdicionar: boolean;
begin
   sgPessoas.RowCount := 2;
   sgPessoas.Cells[0, 1] := '';
   sgPessoas.Cells[1, 1] := '';
   sgPessoas.Cells[2, 1] := '';
   sgPessoas.Cells[3, 1] := '';
   LILinha := 1;
   LICodAnterior := -1;
   with fNFSe do
   begin
      if qryTitulos.Active and (qryTitulos.RecordCount > 0) then
      begin
         qryTitulos.First;
         while not qryTitulos.Eof do
         begin
            LBAchouCodigo := qryTituloscodigoaluno.AsString = ledCodigo.Text;
            LBFilCodigo := (ledCodigo.Text <> '') and LBAchouCodigo;
            LBAchouNome := AnsiPos(
               AnsiUpperCase(ledNome.Text),
               AnsiUpperCase(qryTitulosnm_pessoa.AsString)) > 0;
            LBFilNome := (Trim(ledNome.Text) <> '') and LBAchouNome;
            LBNaoFiltrar := (ledCodigo.Text = '') and (Trim(ledNome.Text) = '');
            LBNovoCodigo := LICodAnterior <> qryTituloscodigoaluno.AsInteger;
            LBNaoIncluido := lbAlunos.Items.IndexOf(qryTituloscodigoaluno.AsString) = -1;
            LBAdicionar :=
               LBNaoIncluido and LBNovoCodigo and
               (LBNaoFiltrar or (LBFilCodigo or LBFilNome));
            if LBAdicionar then
            begin
               sgPessoas.RowCount := LILinha + 1;
               sgPessoas.Cells[0, LILinha] := qryTituloscodigoaluno.AsString;
               sgPessoas.Cells[1, LILinha] := qryTitulosnm_pessoa.AsString;
               sgPessoas.Cells[2, LILinha] := qryTitulosturma.AsString;
               sgPessoas.Cells[3, LILinha] := qryTituloscurso.AsString;
               Inc(LILinha);
            end;
            LICodAnterior := qryTituloscodigoaluno.AsInteger;
            qryTitulos.Next;
         end;
      end;
   end;
end;

procedure TfNFSePessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfNFSePessoas.FormCreate(Sender: TObject);
begin
   sgPessoas.Cells[0, 0] := 'Código';
   sgPessoas.Cells[1, 0] := 'Nome';
   sgPessoas.Cells[2, 0] := 'Turma';
   sgPessoas.Cells[3, 0] := 'Curso';
   FiltraPessoas;
end;

procedure TfNFSePessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

procedure TfNFSePessoas.ledCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in['0'..'9', #8, #13]) then
      Key := #0;
   if Key = #13 then
   begin
      ledNome.SelectAll;
      ledNome.SetFocus;
   end;
end;

procedure TfNFSePessoas.ledNomeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      FiltraPessoas;
end;

procedure TfNFSePessoas.sgPessoasDblClick(Sender: TObject);
var
   LILinha, LIColuna, I: integer;
begin
   sgPessoas.MouseToCell(FPontoClick.X, FPontoClick.Y, LIColuna, LILinha);
   if LILinha > 0 then
   begin
      fNFSe.Filtrado := false;
      fNFSe.lbAlunos.Items.Values[sgPessoas.Cells[0, LILinha]] := sgPessoas.Cells[1, LILinha];
      if LILinha < (sgPessoas.RowCount - 1) then
         for I := LILinha to sgPessoas.RowCount - 1 do
            sgPessoas.Rows[I] := sgPessoas.Rows[I + 1];
      if sgPessoas.RowCount = 2 then
      begin
         sgPessoas.Cells[0, 1] := '';
         sgPessoas.Cells[1, 1] := '';
         sgPessoas.Cells[2, 1] := '';
         sgPessoas.Cells[3, 1] := '';      
      end
      else
         sgPessoas.RowCount := sgPessoas.RowCount - 1
   end;
end;

procedure TfNFSePessoas.sgPessoasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   LSTexto: string;
   LITamTexto, LITamCelula, LIInicioEsq: integer;
begin
   if (ACol >= sgPessoas.Selection.Left) and (ACol <= sgPessoas.Selection.Right) and
      (ARow >= sgPessoas.Selection.Top) and (ARow <= sgPessoas.Selection.Bottom) then
   begin
      LSTexto := sgPessoas.Cells[ACol, ARow];
      sgPessoas.Canvas.Brush.Color := clInfoBk;
      sgPessoas.Canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 2, LSTexto);
   end;
   if (ARow > 0) and (ACol = 0) then
   begin
      LSTexto := sgPessoas.Cells[ACol, ARow];
      LITamTexto := sgPessoas.Canvas.TextWidth(LSTexto) + 3;
      LITamCelula := sgPessoas.ColWidths[ACol];
      LIInicioEsq := LITamCelula - LITamTexto;
      sgPessoas.Canvas.TextRect(Rect, Rect.Left + LIInicioEsq, Rect.Top, LSTexto);
   end;
end;

procedure TfNFSePessoas.sgPessoasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FPontoClick.X := X;
   FPontoClick.Y := Y;
end;

end.

