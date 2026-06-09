unit UFNFSeBuscaPessoa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, ImgList, ComCtrls, ToolWin, Grids, DB;

type
   TQueryField = (qfCodigo, qfNome, qfTurma, qfCurso);

   TQueryFields = array [TQueryField] of string;

   TfNFSeBuscaPessoa = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      pnlFiltros: TPanel;
      ledCodigo: TLabeledEdit;
      ledNome: TLabeledEdit;
      bbtnFiltrar: TBitBtn;
      bvlSep3: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      ilImagens: TImageList;
      bvlSep4: TBevel;
      sgPessoas: TStringGrid;
      procedure FormShow(Sender: TObject);
      procedure ledNomeKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure sgPessoasMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure sgPessoasDrawCell(Sender: TObject; ACol, ARow: Integer;
         Rect: TRect; State: TGridDrawState);
      procedure sgPessoasDblClick(Sender: TObject);
      procedure ledCodigoKeyPress(Sender: TObject; var Key: Char);
   private
      FClick: TPoint;
      FListBox: TListBox;
      FDataSet: TDataSet;
      FQueryFields: TQueryFields;
      procedure Filtra;
   public
      procedure SetField(const QueryField: TQueryField; const Name: string);
      procedure SetListBox(const ListBox: TListBox);
      procedure SetDataSet(const DataSet: TDataSet);
  end;

var
   fNFSeBuscaPessoa: TfNFSeBuscaPessoa;

implementation

{$R *.dfm}

procedure TfNFSeBuscaPessoa.bbtnFiltrarClick(Sender: TObject);
begin
   Filtra;
end;

procedure TfNFSeBuscaPessoa.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfNFSeBuscaPessoa.Filtra;
var
   Nome, Curso, Turma, Codigo, CodAnterior: string;
   AchouCodigo, AchouNome, FilCodigo, FilNome, NaoFiltrar, NovoCodigo,
   NaoIncluso, Adicionar: Boolean;
   Linha: Integer;
begin
   // Limpa a tabela de pessoas
   
   sgPessoas.RowCount := 2;
   sgPessoas.Cells[0, 1] := '';
   sgPessoas.Cells[1, 1] := '';
   sgPessoas.Cells[2, 1] := '';
   sgPessoas.Cells[3, 1] := '';
   
   Linha := 1;
   CodAnterior := '';

   // Verifica se existem registros no Data Set para adicioná-los à tabela
   if FDataSet.Active and (FDataSet.RecordCount > 0) then
   begin
      FDataSet.First;
      while not FDataSet.Eof do
      begin
         // Guarda os dados do registro atual
         
         Nome := FDataSet.FieldByName(FQueryFields[qfNome]).AsString;
         Turma := FDataSet.FieldByName(FQueryFields[qfTurma]).AsString;
         Curso := FDataSet.FieldByName(FQueryFields[qfCurso]).AsString;
         Codigo := FDataSet.FieldByName(FQueryFields[qfCodigo]).AsString;

         // Verifica se o código do registro atual é igual ao código filtrado
         // pelo usuário.
         
         AchouCodigo := Codigo = ledCodigo.Text;
         FilCodigo := (ledCodigo.Text <> '') and AchouCodigo;

         // Veririfica se o nome filtrado pelo usuário é próximo ao nome no
         // registro atual.

         AchouNome :=
            AnsiPos(AnsiUpperCase(ledNome.Text), AnsiUpperCase(Nome)) > 0;
         FilNome := (Trim(ledNome.Text) <> '') and AchouNome;

         // Verifica se o usuário informou algum filtro
         NaoFiltrar := (ledCodigo.Text = '') and (Trim(ledNome.Text) = '');

         // Verifica se o registro é novo nesta tabela
         NovoCodigo := CodAnterior <> Codigo;

         // Verifica se esta exceção já foi adicionada à lista referenciada
         NaoIncluso := FListBox.Items.IndexOf(Codigo) = -1;

         // Verifica se é para adicionar o registro à tabela
         Adicionar := NaoIncluso and NovoCodigo and
            (NaoFiltrar or (FilCodigo or FilNome));

         if Adicionar then
         begin
            // Adiciona as informações do registro na linha
            
            sgPessoas.RowCount := Linha + 1;
            sgPessoas.Cells[0, Linha] := Codigo;
            sgPessoas.Cells[1, Linha] := Nome;
            sgPessoas.Cells[2, Linha] := Turma;
            sgPessoas.Cells[3, Linha] := Curso;
            Inc(Linha);
         end;
         CodAnterior := Codigo;
         FDataSet.Next;
      end;
   end;   
end;

procedure TfNFSeBuscaPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfNFSeBuscaPessoa.FormCreate(Sender: TObject);
begin
   sgPessoas.Cells[0, 0] := 'Código';
   sgPessoas.Cells[1, 0] := 'Nome';
   sgPessoas.Cells[2, 0] := 'Turma';
   sgPessoas.Cells[3, 0] := 'Curso';
end;

procedure TfNFSeBuscaPessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

procedure TfNFSeBuscaPessoa.FormShow(Sender: TObject);
begin
   Filtra;
end;

procedure TfNFSeBuscaPessoa.ledCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9', #8, #13]) then
      Key := #0;
   if Key = #13 then
   begin
      ledNome.SelectAll;
      ledNome.SetFocus;
   end;
end;

procedure TfNFSeBuscaPessoa.ledNomeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Filtra;
end;

procedure TfNFSeBuscaPessoa.SetDataSet(const DataSet: TDataSet);
begin
   FDataSet := DataSet;
end;

procedure TfNFSeBuscaPessoa.SetField(const QueryField: TQueryField;
  const Name: string);
begin
   FQueryFields[QueryField] := Name;
end;

procedure TfNFSeBuscaPessoa.SetListBox(const ListBox: TListBox);
begin
   FListBox := ListBox;
end;

procedure TfNFSeBuscaPessoa.sgPessoasDblClick(Sender: TObject);
var
   Linha, Coluna, I: Integer;
begin
   // Pega a linha e a coluna da célula selecionada pelo clique do usuário
   sgPessoas.MouseToCell(FClick.X, FClick.Y, Coluna, Linha);

   // Verifica se a linha não é o cabeçalho da tabela
   if Linha > 0 then
   begin
      // Pega o nome da pessoa e adiciona à lista referenciada
      FListBox.Items.Values[sgPessoas.Cells[0, Linha]] := sgPessoas.Cells[1, Linha];

      // Verifica se a linha selecionada não é a última e "empurra" todas as
      // linhas depois desta uma posição para cima

      LockWindowUpdate(sgPessoas.Handle);
      if Linha < (sgPessoas.RowCount - 1) then
      begin
         for I := Linha to sgPessoas.RowCount - 1 do
         begin
            sgPessoas.Rows[I] := sgPessoas.Rows[I + 1];
         end;
      end;
      LockWindowUpdate(0);

      // Se havia apenas um registro, duas linhas, então linha toda a tabela,
      // mantendo apenas o cabeçalho e uma linha em branco.
      
      if sgPessoas.RowCount = 2 then
      begin
         sgPessoas.Cells[0, 1] := '';
         sgPessoas.Cells[1, 1] := '';
         sgPessoas.Cells[2, 1] := '';
         sgPessoas.Cells[3, 1] := '';
      end
      else
         sgPessoas.RowCount := sgPessoas.RowCount - 1;
   end;
end;

procedure TfNFSeBuscaPessoa.sgPessoasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   Texto: string;
   TamTexto, TamCel, InicioEsq: Integer;
begin
   if (ACol >= sgPessoas.Selection.Left) and
      (ACol <= sgPessoas.Selection.Right) and
      (ARow >= sgPessoas.Selection.Top) and
      (ARow <= sgPessoas.Selection.Bottom) then
   begin
      Texto := sgPessoas.Cells[ACol, ARow];
      sgPessoas.Canvas.Brush.Color := clInfoBk;
      sgPessoas.Canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 2, Texto);
   end;
   if (ARow > 0) and (ACol = 0) then
   begin
      Texto := sgPessoas.Cells[ACol, ARow];
      TamTexto := sgPessoas.Canvas.TextWidth(Texto) + 3;
      TamCel := sgPessoas.ColWidths[ACol];
      InicioEsq := TamCel - TamTexto;
      sgPessoas.Canvas.TextRect(Rect, Rect.Left + InicioEsq, Rect.Top, Texto);
   end;
end;

procedure TfNFSeBuscaPessoa.sgPessoasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FClick.X := X;
   FClick.Y := Y;
end;

end.
