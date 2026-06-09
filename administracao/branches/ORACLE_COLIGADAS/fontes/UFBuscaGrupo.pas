unit UFBuscaGrupo;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset, UZDataset,
   Buttons;

type
   TfBuscaGrupo = class(TForm)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      qryGrupos: TUMZReadOnlyQuery;
      dsGrupos: TDataSource;
      qryGruposCD_GRUPO: TIntegerField;
      qryGruposDS_NOME_GRUPO: TStringField;
      qryGruposDS_PAPEL: TStringField;
      pnlAll: TPanel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      dbgGrupos: TDBGrid;
      pnlFiltros: TPanel;
      lblCodigo: TLabel;
      lblNome: TLabel;
      edtCodigo: TEdit;
      edtNome: TEdit;
      pnlOpcoes: TPanel;
      sbSelecionar: TSpeedButton;
      sbFechar: TSpeedButton;
      procedure dbgGruposDblClick(Sender: TObject);
      procedure sbFecharClick(Sender: TObject);
      procedure sbSelecionarClick(Sender: TObject);
      procedure edtCodigoChange(Sender: TObject);
      procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure dbgGruposTitleClick(Column: TColumn);
   public
      class function SelectGroup: Boolean;
   end;

var
   fBuscaGrupo: TfBuscaGrupo;

implementation

uses
   UDM;

{$R *.dfm}

procedure TfBuscaGrupo.dbgGruposDblClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfBuscaGrupo.dbgGruposTitleClick(Column: TColumn);
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

      SortedFields.DelimitedText := qryGrupos.IndexFieldNames;

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

      qryGrupos.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfBuscaGrupo.edtCodigoChange(Sender: TObject);
var
   LCode, LName: string;
begin
   if edtCodigo.Text <> '' then
   begin
      LCode := edtCodigo.Text;
      if Trim(edtNome.Text) <> '' then
      begin
         LName := QuotedStr('*' + edtNome.Text + '*');
         qryGrupos.Filter := Format('CD_GRUPO = %s OR DS_NOME_GRUPO LIKE %s', [LCode, LName])
      end
      else
         qryGrupos.Filter := Format('CD_GRUPO = %s', [LCode])
   end
   else if Trim(edtNome.Text) <> '' then
   begin
      LName := QuotedStr('*' + edtNome.Text + '*');
      qryGrupos.Filter := Format('DS_NOME_GRUPO LIKE %s', [LName]);
   end
   else
      qryGrupos.Filter := '';
end;

procedure TfBuscaGrupo.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#48..#57, #8]) then Key := #0;
end;

procedure TfBuscaGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfBuscaGrupo.FormCreate(Sender: TObject);
begin
   qryGrupos.ParamByName('CD_PESSOA').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
   qryGrupos.Open;
end;

procedure TfBuscaGrupo.FormDestroy(Sender: TObject);
begin
   qryGrupos.Close;
end;

procedure TfBuscaGrupo.sbFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfBuscaGrupo.sbSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

class function TfBuscaGrupo.SelectGroup: Boolean;
begin
   if fBuscaGrupo = nil then
      Application.CreateForm(TfBuscaGrupo, fBuscaGrupo);
   Result := fBuscaGrupo.ShowModal = mrOk;
end;

end.
