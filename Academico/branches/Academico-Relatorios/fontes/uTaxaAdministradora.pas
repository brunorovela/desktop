unit uTaxaAdministradora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, UMEditNumerico, Buttons, uDM, UMEditMonetario, General;

type
  TfrmTaxaAdministradora = class(TForm)
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Label3: TLabel;
    Label2: TLabel;
    edValorTaxa: TUMEditMonetario;
    edNumeroIntervalo: TUMEditNumerico;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure insereIntervaloTaxa();

    function isIntervalo(cd_admin_cartao: Integer; vl_valor: Integer): Boolean;
  public
    codigoAdministradora: Integer;
  end;

var
  frmTaxaAdministradora: TfrmTaxaAdministradora;

implementation

{$R *.dfm}

procedure TfrmTaxaAdministradora.btnCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmTaxaAdministradora.btnConfirmarClick(Sender: TObject);
begin
   if (edNumeroIntervalo.Text = '') then
   begin
      Mensagem('Favor preencher o número de intervalo.', 'Aviso', MB_OK + MB_ICONWARNING);
      edNumeroIntervalo.SetFocus;
      Exit;
   end;

   if edNumeroIntervalo.getValor < 1 then
   begin
      edNumeroIntervalo.SetFocus;
      Mensagem('O número mínimo para intervalo é um (1).', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

//   if edValorTaxa.getValorDouble = 0 then
//   begin
//      edValorTaxa.SetFocus;
//      Mensagem('Não é possível incluir uma taxa com valor zero (0).', 'Aviso', MB_OK + MB_ICONWARNING);
//      Exit;
//   end;

   if isIntervalo(codigoAdministradora, edNumeroIntervalo.getValor) then
   begin
      edNumeroIntervalo.SetFocus;
      Mensagem('Já existe um intervalo com este número para esta administradora.', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   insereIntervaloTaxa;
   
   Self.Close;
end;

procedure TfrmTaxaAdministradora.FormShow(Sender: TObject);
begin
   edValorTaxa.Text := '';
   edNumeroIntervalo.SetFocus;
end;

procedure TfrmTaxaAdministradora.insereIntervaloTaxa;
const
   SQL_INSERE_INTERVALO =
      ' INSERT INTO fin_cartao_taxas_credito VALUES (:cd_admin_cartao, :vl_taxa, :vl_valor)';
var
   qyInsereIntervalo: TUMZQuery;
begin
   DM.CriarConsulta(qyInsereIntervalo);

   qyInsereIntervalo.SQL.Text := SQL_INSERE_INTERVALO;
   
   qyInsereIntervalo.ParamByName('cd_admin_cartao').AsInteger :=
      codigoAdministradora;
   qyInsereIntervalo.ParamByName('vl_taxa').AsFloat :=
      edValorTaxa.getValorDouble;
   qyInsereIntervalo.ParamByName('vl_valor').AsInteger :=
      edNumeroIntervalo.getValor;

   qyInsereIntervalo.ExecSQL;   
end;

function TfrmTaxaAdministradora.isIntervalo(cd_admin_cartao: Integer;
  vl_valor: Integer): Boolean;
const
   SQL_IS_INTERVALO =
      ' SELECT ' +
      '   COUNT(cd_admin_cartao) AS qtd '+
      ' FROM '+
      '   fin_cartao_taxas_credito '+
      ' WHERE '+
      '   cd_admin_cartao = :cd_admin_cartao AND vl_valor = :vl_valor ';
var
   qyIsIntervalo: TUMZReadOnlyQuery;
begin
   Result := True;

   DM.CriarConsulta(qyIsIntervalo);

   qyIsIntervalo.SQL.Text := SQL_IS_INTERVALO;
   qyIsIntervalo.ParamByName('cd_admin_cartao').AsInteger := cd_admin_cartao;
   qyIsIntervalo.ParamByName('vl_valor').AsInteger := vl_valor;
   qyIsIntervalo.Open;

   if qyIsIntervalo.FieldByName('qtd').AsInteger = 0 then
   begin
      Result := False;
   end;
end;

end.
