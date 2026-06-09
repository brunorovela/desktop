unit uFSelecionarAcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, Grids,
  DBGrids, StdCtrls, UMComboBox, uDM, uItemCombo, Buttons;

type

  TResultadoAcao = record
     cd_acao: Integer;
     ds_nome_acao: String;
  end;

  TfrmSelecionarAcao = class(TForm)
    Panel1: TPanel;
    pnTopo: TPanel;
    qryAcoes: TUMZQuery;
    dsAcoes: TDataSource;
    DBGrid1: TDBGrid;
    edCodigo: TEdit;
    lbCodigo: TLabel;
    Label1: TLabel;
    edNomeAcao: TEdit;
    Label2: TLabel;
    cbModulos: TUMComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    class var FInstancia: TfrmSelecionarAcao;

    procedure carregaModulos();
    procedure filtra();

  strict private
    FRetorno: TResultadoAcao;
    
    constructor CreatePrivate();

  public
    constructor Create(); reintroduce;

    function ShowModal(): TResultadoAcao; reintroduce;

    class function getInstancia: TfrmSelecionarAcao;
  end;

var
  frmSelecionarAcao: TfrmSelecionarAcao;

implementation

{$R *.dfm}

procedure TfrmSelecionarAcao.Button1Click(Sender: TObject);
begin
   filtra;
end;

procedure TfrmSelecionarAcao.Button2Click(Sender: TObject);
begin
   edCodigo.Text := '';
   edNomeAcao.Text := '';
   cbModulos.ItemIndex := -1;
end;

procedure TfrmSelecionarAcao.carregaModulos;
var
   qryModulos: TUMZReadOnlyQuery;
const
   SQL_BUSCA_MODULOS =
   'SELECT ' +
   '	cd_modulo, ' +
	'  ds_nome_modulo ' +
   'FROM ' +
   '	nu_modulos '+
   'ORDER BY '+
   '  ds_nome_modulo'; 
begin
   DM.CriarConsulta(qryModulos);

   qryModulos.SQL.Text := SQL_BUSCA_MODULOS;
   qryModulos.Open;

   cbModulos.Clear;

   while not(qryModulos.Eof) do
   begin
      cbModulos.AddItem(
         qryModulos.FieldByName('ds_nome_modulo').AsString,
         TItemCombo.Create(
            qryModulos.FieldByName('cd_modulo').AsString,
            qryModulos.FieldByName('ds_nome_modulo').AsString
         )
      );

      qryModulos.Next;
   end;
end;

constructor TfrmSelecionarAcao.Create;
begin
   raise Exception.Create('Para instanciar a classe utilize o método getInstancia!');
end;

constructor TfrmSelecionarAcao.CreatePrivate;
begin
   inherited Create(nil);
end;

procedure TfrmSelecionarAcao.DBGrid1DblClick(Sender: TObject);
begin
   FRetorno.cd_acao := qryAcoes.FieldByName('cd_acao').AsInteger;
   FRetorno.ds_nome_acao := qryAcoes.FieldByName('ds_nome_acao').AsString;

   Close;
end;

procedure TfrmSelecionarAcao.filtra;
begin
   qryAcoes.Filter := ' 1=1 ';

   if edCodigo.Text <> '' then
   begin
      qryAcoes.Filter :=
         qryAcoes.Filter +
         ' AND cd_acao = ' +
         QuotedStr(edCodigo.Text);
   end;

   if edNomeAcao.Text <> '' then
   begin
      qryAcoes.Filter :=
         qryAcoes.Filter +
         ' AND ds_nome_acao LIKE ' +
         QuotedStr('*'+edNomeAcao.Text+'*');
   end;

   if cbModulos.ItemIndex >= 0 then
   begin
      qryAcoes.Filter :=
         qryAcoes.Filter +
         ' AND cd_modulo = ' +
         TItemCombo(cbModulos.Items.Objects[cbModulos.ItemIndex]).codigo;
   end;

   qryAcoes.Filtered := True;
end;

procedure TfrmSelecionarAcao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
   begin
      filtra;
      Key := #0;
   end;
end;

procedure TfrmSelecionarAcao.FormShow(Sender: TObject);
begin
   carregaModulos();
   qryAcoes.Open;
end;

class function TfrmSelecionarAcao.getInstancia: TfrmSelecionarAcao;
begin
   if FInstancia = nil then
   begin
      FInstancia := TfrmSelecionarAcao.CreatePrivate();
   end;

   Result := FInstancia;
end;

function TfrmSelecionarAcao.ShowModal(): TResultadoAcao;
begin
   inherited ShowModal;

   Result := FRetorno;
end;

end.
