unit UFBuscaPessoa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, DB,
   ZAbstractRODataset, UZDataset;

type
   TfBuscaPessoa = class(TForm)
      bvlSep1: TBevel;
      ilBotoes: TImageList;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnSelecionar: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      bvlSep2: TBevel;
      pnlFiltro: TPanel;
      lblCodigo: TLabel;
      edtCodigo: TEdit;
      lblNome: TLabel;
      edtNome: TEdit;
      bvlSep3: TBevel;
      dbgPessoas: TDBGrid;
      qryPessoas: TUMZReadOnlyQuery;
      dsPessoas: TDataSource;
      qryPessoasCD_PROVA_PESSOA: TIntegerField;
      qryPessoasCD_PESSOA: TIntegerField;
      qryPessoasSN_FINALIZADA: TSmallintField;
      qryPessoasNM_PESSOA: TStringField;
      qryPessoasCD_TURMA: TStringField;
      qryPessoasCD_CURSO: TStringField;
      procedure edtCodigoChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure btnSelecionarClick(Sender: TObject);
      procedure dbgPessoasTitleClick(Column: TColumn);
      procedure edtNomeChange(Sender: TObject);
      procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
   private
      FFixedFilter: string;
      function GetFixedFilter: string;
      procedure SetFixedFilter(const Value: string);
      procedure DoFilter;
   public
      property FixedFilter: string read GetFixedFilter write SetFixedFilter;
   end;

var
   fBuscaPessoa: TfBuscaPessoa;

implementation

{$R *.dfm}

procedure TfBuscaPessoa.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfBuscaPessoa.btnSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfBuscaPessoa.dbgPessoasTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := #59;
      SortedFields.StrictDelimiter := True;

      SortedFields.NameValueSeparator := #32;

      SortedFields.DelimitedText := qryPessoas.IndexFieldNames;

      for I := 0 to SortedFields.Count - 1 do

         if SortedFields.Names[I] = Column.FieldName then
         begin

            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;

            Found := True;
            Break;
         end;
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;

      qryPessoas.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfBuscaPessoa.DoFilter;
begin
   if edtCodigo.Text <> '' then
      if Trim(edtNome.Text) <> '' then
      begin
         if FixedFilter <> '' then
            qryPessoas.Filter := FixedFilter +
               Format(' AND CD_PESSOA = %s OR NM_PESSOA LIKE %s',
                  [edtCodigo.Text, QuotedStr('*' + edtNome.Text + '*')])
         else
            qryPessoas.Filter := Format('CD_PESSOA = %s OR NM_PESSOA LIKE %s',
               [edtCodigo.Text, QuotedStr('*' + edtNome.Text + '*')]);
      end
      else
      begin
         if FixedFilter <> '' then
            qryPessoas.Filter := FixedFilter + Format(' AND CD_PESSOA = %s',
               [edtCodigo.Text])
         else
            qryPessoas.Filter := Format('CD_PESSOA = %s', [edtCodigo.Text])
      end
   else if Trim(edtNome.Text) <> '' then
   begin
      if FixedFilter <> '' then
         qryPessoas.Filter := FixedFilter + Format(' AND NM_PESSOA LIKE %s',
            [QuotedStr('*' + edtNome.Text + '*')])
      else
         qryPessoas.Filter := Format('NM_PESSOA LIKE %s',
            [QuotedStr('*' + edtNome.Text + '*')])
   end
   else
      qryPessoas.Filter := '';
end;

procedure TfBuscaPessoa.edtCodigoChange(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaPessoa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then edtNome.SetFocus
   else if not (Key in [#48..#57, #8]) then Key := #0;
end;

procedure TfBuscaPessoa.edtNomeChange(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

function TfBuscaPessoa.GetFixedFilter: string;
begin
   Result := FFixedFilter;
end;

procedure TfBuscaPessoa.SetFixedFilter(const Value: string);
begin
   FFixedFilter := Value;
end;

end.
