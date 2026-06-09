unit UFBuscaPessoa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ZAbstractRODataset,
   UZDataset;

type
   TfBuscaPessoa = class(TForm)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      dsPessoas: TDataSource;
      qryPessoas: TUMZReadOnlyQuery;
      qryPessoasCD_PESSOA: TIntegerField;
      qryPessoasNM_PESSOA: TStringField;
      qryPessoasDT_NASCIMENTO: TDateTimeField;
      qryPessoasDS_CPF: TStringField;
      pnlAll: TPanel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      dbgPessoas: TDBGrid;
      pnlFiltros: TPanel;
      lblCodigo: TLabel;
      lblNome: TLabel;
      edtCodigo: TEdit;
      edtNome: TEdit;
      pnlOpcoes: TPanel;
      sbSelecionar: TSpeedButton;
      sbFechar: TSpeedButton;
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgPessoasDblClick(Sender: TObject);
      procedure sbFecharClick(Sender: TObject);
      procedure sbSelecionarClick(Sender: TObject);
      procedure dbgPessoasTitleClick(Column: TColumn);
      procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
      procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
   private
      procedure DoFilter;
   public
      class function SelectPerson: Boolean;
   end;

var
   fBuscaPessoa: TfBuscaPessoa;

implementation

{$R *.dfm}

procedure TfBuscaPessoa.dbgPessoasDblClick(Sender: TObject);
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
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;

      SortedFields.NameValueSeparator := ' ';

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
const
   SSQLPersons = 'SELECT CD_PESSOA, NM_PESSOA, DT_NASCIMENTO, DS_CPF FROM PESSOAS WHERE %s';
   SFilterCode = 'CD_PESSOA = %s';
   SFilterName = 'NM_PESSOA LIKE %s';
var
   LCode, LName, LFilter: string;
begin
   qryPessoas.Close;

   LFilter := '';
   if edtCodigo.Text <> '' then
   begin
      LCode := edtCodigo.Text;
      LFilter := Format(SFilterCode, [LCode]);
      if Trim(edtNome.Text) <> '' then
      begin
         LName := QuotedStr('%' + edtNome.Text + '%');
         LFilter := LFilter + ' OR ' + Format(SFilterName, [LName]);
      end;
   end
   else if Trim(edtNome.Text) <> '' then
   begin
      LName := QuotedStr('%' + edtNome.Text + '%');
      LFilter := Format(SFilterName, [LName]);
   end;

   if LFilter <> '' then
   begin
      qryPessoas.SQL.Text := Format(SSQLPersons, [LFilter]);
      qryPessoas.Open;
   end;
end;

procedure TfBuscaPessoa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then DoFilter
   else if not (Key in [#48..#57, #8]) then Key := #0;
end;

procedure TfBuscaPessoa.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then DoFilter;
end;

procedure TfBuscaPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfBuscaPessoa.FormDestroy(Sender: TObject);
begin
   qryPessoas.Close;
end;

procedure TfBuscaPessoa.sbFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfBuscaPessoa.sbSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

class function TfBuscaPessoa.SelectPerson: Boolean;
begin
   if fBuscaPessoa = nil then
      Application.CreateForm(TfBuscaPessoa, fBuscaPessoa);
   Result := fBuscaPessoa.ShowModal = mrOk;
end;

end.
