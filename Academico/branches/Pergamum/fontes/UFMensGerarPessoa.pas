unit UFMensGerarPessoa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, StdCtrls, Buttons, ZDbcIntfs, UZDbcFuncs;

type
   TfMensGerarPessoa = class(TFrame)
      lblSelecionaPessoa: TLabel;
      edtCodigoPessoa: TEdit;
      edtNomePessoa: TEdit;
      sbSelPessoa: TSpeedButton;
      procedure edtCodigoPessoaExit(Sender: TObject);
      procedure sbSelPessoaClick(Sender: TObject);
      procedure edtCodigoPessoaKeyPress(Sender: TObject; var Key: Char);
   public
      procedure LocatePerson(const Code: string);
   end;

implementation

uses
   uFSelecionarPessoa, UFMensalidadeGerar;

{$R *.dfm}

procedure TfMensGerarPessoa.edtCodigoPessoaExit(Sender: TObject);
begin
   if edtCodigoPessoa.Text <> '' then
   begin
      LocatePerson(edtCodigoPessoa.Text);
      fMensalidadeGerar.DoFiltro;
   end;
end;

procedure TfMensGerarPessoa.edtCodigoPessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      edtNomePessoa.SetFocus;
   end
   else if not (Key in [#48..#57, #8]) then
      Key := #0;
end;

procedure TfMensGerarPessoa.LocatePerson(const Code: string);
const
   SSQLSearch = 'SELECT CD_PESSOA, NM_PESSOA FROM PESSOAS WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLSearch);
   try
      Statement.SetString(1, Code);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
            edtNomePessoa.Text := ResultSet.GetString(2)
         else
         begin
            edtCodigoPessoa.Clear;
            edtNomePessoa.Clear;
         end;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;
end;

procedure TfMensGerarPessoa.sbSelPessoaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);
   
   if resultado_filtro.filtrado then
   begin
      edtCodigoPessoa.Text := IntToStr(resultado_filtro.cd_pessoa);
      edtNomePessoa.Text := resultado_filtro.nm_pessoa;

      fMensalidadeGerar.centro_custo_ativo := True;
      fMensalidadeGerar.custo_ativo_negado := False;

      fMensalidadeGerar.DoFiltro;

      //Faz uma verificação se o centro de custo padrão da turma é inativo ou não.
      fMensalidadeGerar.avisaCentroCustoInativo;
   end;
end;

end.
