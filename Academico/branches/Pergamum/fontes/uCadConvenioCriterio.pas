unit uCadConvenioCriterio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, uCadConvenioPgto, ComCtrls,
  ToolWin, udm, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, General;

type
  TfrmCadConvenioCriterio = class(TForm)
    Panel1: TPanel;
    lbValor: TLabel;
    dbValor: TDBEdit;
    lbCargo: TLabel;
    lbTipo: TLabel;
    lbDepartamento: TLabel;
    dbCargo: TDBEdit;
    dbValorLimite: TDBEdit;
    dbDepartamento: TDBLookupComboBox;
    dbTipo: TDBLookupComboBox;
    lbValorLimite: TLabel;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton14: TToolButton;
    qyDepartamentos: TUMZQuery;
    dsDepartamentos: TDataSource;
    qyCriteriosTipos: TUMZQuery;
    dsCriteriosTipos: TDataSource;
    procedure dbValorLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure dbValorKeyPress(Sender: TObject; var Key: Char);
    procedure dbTipoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    cd_criterio : integer;
    procedure getTipoSelecionado();
    { Private declarations }
  public
    procedure setCdCriterio(valor : integer );
    { Public declarations }
  end;

var
  frmCadConvenioCriterio: TfrmCadConvenioCriterio;

implementation

{$R *.dfm}

procedure TfrmCadConvenioCriterio.btnCancelarClick(Sender: TObject);
begin
   frmCadConvenioPgto.qyCriterios.Cancel;
   Self.Close();
end;

procedure TfrmCadConvenioCriterio.btnSalvarClick(Sender: TObject);
var
   buscaUltimoCodigo : Boolean;
   cd_pessoa         : string;
   cd_convenio       : string;
   chave_log         : string;
begin
   if frmCadConvenioPgto.qyCriterios.State in [dsInsert] then
   begin
      buscaUltimoCodigo := true;
   end
   else
   begin
      buscaUltimoCodigo := false;
   end;

   if dbDepartamento.KeyValue = null then
   begin
      Mensagem('Selecione o Departamento.', 'Atenção', MB_OK + MB_ICONINFORMATION );
      exit;
   end;

   if dbTipo.KeyValue = null then
   begin
      Mensagem('Selecione o Tipo.', 'Atenção', MB_OK + MB_ICONINFORMATION );
      exit;
   end;

   frmCadConvenioPgto.qyCriterios.Post;

   if buscaUltimoCodigo = true then
   begin
      Self.setCdCriterio( DM.LastInsert() );
      cd_pessoa   := frmCadConvenioPgto.qyNfeConveniosEmpresascd_convenio_pessoa.AsString;
      cd_convenio := frmCadConvenioPgto.qyNfeConveniosEmpresascd_convenio.AsString;

      chave_log := cd_convenio + ':' + cd_pessoa + ':' + IntToStr(Self.cd_criterio);

      DM.setLog( frmCadConvenioPgto.getCdModulo(), 'inclusao', chave_log , qyDepartamentos.FieldByName('cd_coligada').AsInteger, 'Incluido o critério de código '+ inttostr(Self.cd_criterio) +'. Critério referente ao convênio de código ' + cd_convenio + '. Empresa de código ' + cd_pessoa);
   end;

   Self.Close();
end;

procedure TfrmCadConvenioCriterio.dbTipoClick(Sender: TObject);
begin
   Self.getTipoSelecionado;      
end;

procedure TfrmCadConvenioCriterio.dbValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;

   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if not (Key in['0'..'9',Chr(8), Chr(44)]) then Key:= #0;
end;

procedure TfrmCadConvenioCriterio.dbValorLimiteKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if not (Key in['0'..'9',Chr(8), Chr(44)]) then Key:= #0;
end;

procedure TfrmCadConvenioCriterio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmCadConvenioPgto.qyCriterios.Cancel;
   frmCadConvenioPgto.qyCriterios.Close;
   frmCadConvenioPgto.qyCriterios.Open;

   if cd_criterio <> 0 then
   begin
      frmCadConvenioPgto.qyCriterios.Locate('cd_convenio_criterio', cd_criterio, [loPartialKey]);
   end;

   Action := caFree;
end;

procedure TfrmCadConvenioCriterio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5  : if btnSalvar.Enabled   then btnSalvarClick( nil );
      VK_F6  : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F12 : Self.Close;
   end;
end;

procedure TfrmCadConvenioCriterio.FormShow(Sender: TObject);
const
   SQL_DEPARTAMENTOS =
      ' SELECT codigo, descricao, cd_coligada ' +
      ' FROM departamentos ' +
      ' WHERE cd_coligada IN (%s) ';
begin
   qyDepartamentos.SQL.Text := Format( SQL_DEPARTAMENTOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qyDepartamentos.Open;
   qyCriteriosTipos.Open;

   Self.getTipoSelecionado;

   dbCargo.SelectAll();
end;

procedure TfrmCadConvenioCriterio.getTipoSelecionado;
begin
   if dbtipo.KeyValue <> null then
   begin
      //códigos(1,2,3) fixos da tabela fin_nfe_criterios_tipos
      case dbtipo.KeyValue of
         1:  
         begin
            lbValorLimite.Visible   := false; 
            dbValorLimite.Visible   := false;

            lbValor.Caption         := 'No valor de R$:';
            lbValor.Visible         := true;
            dbValor.Visible         := true;
         end;

         2:
         begin
            lbValorLimite.Visible   := false;
            dbValorLimite.Visible   := false;

            lbValor.Caption         := 'No valor de %:';
            lbValor.Visible         := true;
            dbValor.Visible         := true;
         end;

         3:
         begin
            lbValorLimite.Visible   := true;
            dbValorLimite.Visible   := true;

            lbValor.Caption         := 'No valor de %:';
            lbValor.Visible         := true;
            dbValor.Visible         := true;
         end;
      end;
   end;
end;

procedure TfrmCadConvenioCriterio.setCdCriterio(valor: integer);
begin
   Self.cd_criterio := valor;
end;


end.
