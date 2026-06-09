unit uFSelecionarHistoricos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, UZDataset, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, uDM, uExceptions;

type

  TResultadoHistoricos = record
    cd_historico: Integer;
    ds_historico: String;
  end;

  TfrmSelecionarHistoricos = class(TForm)
    qryHistoricos: TUMZReadOnlyQuery;
    dsHistoricos: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    dbgHistoricos: TDBGrid;
    btnFechar: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgHistoricosDblClick(Sender: TObject);
    procedure edDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    class var FInstancia : TfrmSelecionarHistoricos;
    procedure Filtro();

  strict private
    constructor CreatePrivate();
    
  public
    constructor Create(); reintroduce;
    class function GetInstancia(): TfrmSelecionarHistoricos;
    class function Filtrar(): TResultadoHistoricos;
  end;

var
  frmSelecionarHistoricos: TfrmSelecionarHistoricos;

const
   SQL_BUSCA_HISTORICOS = 'SELECT * FROM fin_cp_historicos';

implementation

{$R *.dfm}

{ TfrmSelecionarHistoricos }

procedure TfrmSelecionarHistoricos.BitBtn1Click(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmSelecionarHistoricos.btnFecharClick(Sender: TObject);
begin
   Self.GetInstancia.qryHistoricos.Close;
   Self.Close;
end;

constructor TfrmSelecionarHistoricos.Create;
begin
   raise TExceptionConstructor.Create(fecConstrucaoInvalida);
end;

constructor TfrmSelecionarHistoricos.CreatePrivate;
begin
   inherited Create(nil);
end;

procedure TfrmSelecionarHistoricos.dbgHistoricosDblClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmSelecionarHistoricos.edCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Filtro;
   end;
end;

procedure TfrmSelecionarHistoricos.edCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key in ['0'..'9']) or (key = #8) then
   begin
      Exit;
   end;

   Key := #0;
end;

procedure TfrmSelecionarHistoricos.edDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Filtro;
   end;
end;

class function TfrmSelecionarHistoricos.Filtrar : TResultadoHistoricos;
begin
   Self.GetInstancia.ShowModal;

   if not(Self.GetInstancia.qryHistoricos.Active) then
   begin
      Result.cd_historico := -1;
      Result.ds_historico := '';
   end;

   if Self.GetInstancia.qryHistoricos.Active then
   begin
      Result.cd_historico := Self.GetInstancia.qryHistoricos.FieldByName('cd_historico').AsInteger;
      Result.ds_historico := Self.GetInstancia.qryHistoricos.FieldByName('ds_historico').AsString;
   end;
end;

procedure TfrmSelecionarHistoricos.Filtro;
var
   separador: String;
begin
   separador := ' WHERE ';

   qryHistoricos.Close;

   qryHistoricos.SQL.Text := SQL_BUSCA_HISTORICOS;

   if edCodigo.Text <> '' then
   begin
      qryHistoricos.SQL.Add(separador + 'cd_historico = :cd_historico ');
      qryHistoricos.ParamByName('cd_historico').AsInteger := StrToInt(edCodigo.Text);
      separador := ' AND ';
   end;

   if edDescricao.Text <> '' then
   begin
      qryHistoricos.SQL.Add(separador + 'ds_historico LIKE :ds_historico');
      qryHistoricos.ParamByName('ds_historico').AsString := '%' + edDescricao.Text + '%';
   end;

   qryHistoricos.Open;
end;

procedure TfrmSelecionarHistoricos.FormShow(Sender: TObject);
begin
   edCodigo.Text := '';
   edDescricao.Text := '';
   Filtro;
end;

class function TfrmSelecionarHistoricos.GetInstancia: TfrmSelecionarHistoricos;
begin
   if FInstancia = nil then
   begin
      FInstancia := TfrmSelecionarHistoricos.CreatePrivate();
   end;

   Result := FInstancia;
end;

end.
