unit uFAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, DBCtrls, Mask, Grids,
  DBGrids, DB, DBClient, Buttons, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, uDm, General;

type
  TformAtendimento = class(TForm)
    Panel3: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    pnMeio: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    lblTiposTitulo: TLabel;
    dbgLocais: TDBGrid;
    sbAdcTipoTitulo: TSpeedButton;
    sbExcTipoTitulo: TSpeedButton;
    dsLocais: TDataSource;
    qryMotivos: TUMZQuery;
    dsMotivos: TDataSource;
    qryMotivosnm_motivo: TStringField;
    qryMotivosds_observacoes: TMemoField;
    qryMotivossn_ativo: TSmallintField;
    Panel7: TPanel;
    DBMemo1: TDBMemo;
    edNome: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    edCodigo: TDBEdit;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    dbgProcedimento: TDBGrid;
    sbProcedimento: TSpeedButton;
    sbExclusao: TSpeedButton;
    Label4: TLabel;
    qryMotivosativo: TStringField;
    qryMotivosdsObservacoes: TStringField;
    qryLocais: TUMZQuery;
    qryLocaisDS_LOCAL: TStringField;
    qryProcedimentos: TUMZQuery;
    dsProcedimentos: TDataSource;
    qryProcedimentosds_procedimento: TStringField;
    qryProcedimentoscd_motivo: TSmallintField;
    pnFiltros: TPanel;
    Panel8: TPanel;
    dbMotivos: TDBGrid;
    lbBusca: TLabeledEdit;
    qryLocaiscd_local: TLargeintField;
    qryMotivoscd_motivo: TLargeintField;
    qryLocaiscd_motivo: TLargeintField;
    qryProcedimentoscd_procedimento: TLargeintField;
    procedure dbgLocaisKeyPress(Sender: TObject; var Key: Char);
    procedure lbBuscaChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryProcedimentosBeforePost(DataSet: TDataSet);
    procedure sbExclusaoClick(Sender: TObject);
    procedure sbProcedimentoClick(Sender: TObject);
    procedure qryLocaisBeforePost(DataSet: TDataSet);
    procedure sbExcTipoTituloClick(Sender: TObject);
    procedure sbAdcTipoTituloClick(Sender: TObject);
    procedure dsMotivosDataChange(Sender: TObject; Field: TField);
    procedure btnSairClick(Sender: TObject);
    procedure dsMotivosStateChange(Sender: TObject);
    procedure edNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    procedure limpaDados();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAtendimento: TformAtendimento;

implementation

uses uUsuario;

{$R *.dfm}

procedure TformAtendimento.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.FichaSaude.Atendimento', npAlterar, true) then
   begin
      Exit;
   end;
   qryMotivos.Edit;
end;

procedure TformAtendimento.btnCancelarClick(Sender: TObject);
begin
   qryMotivos.Cancel;
end;

procedure TformAtendimento.btnExcluirClick(Sender: TObject);
const
   SQL_VERIFICA =
      'SELECT count(cd_atendimento) as countMotivos FROM pessoas_atendimentos_ficha WHERE cd_motivo = :motivo';
var
   qryVerifica : TUMZQuery;
   nrMotivos: Integer;
begin

   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.FichaSaude.Atendimento', npExcluir, true) then
   begin
      Exit;
   end;


   dm.CriarConsulta(qryVerifica);
   qryVerifica.SQL.Add(SQL_VERIFICA);
   qryVerifica.ParamByName('motivo').AsString := qryMotivoscd_motivo.AsString;
   qryVerifica.Open;

   nrMotivos := qryVerifica.FieldByName('countMotivos').AsInteger;
   FreeAndNil(qryVerifica);

   if(nrMotivos > 0) then
   begin
      Mensagem( 'Este motivo está atribuido a uma ficha de saude, portanto não pode ser excluido.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      Exit;
   end;

   limpaDados();

   qryMotivos.Delete;
end;

procedure TformAtendimento.btnIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.FichaSaude.Atendimento', npIncluir, true) then
   begin
      Exit;
   end;

   qryMotivos.Insert;
   edNome.SetFocus;
end;

procedure TformAtendimento.btnSairClick(Sender: TObject);
begin
   self.Close;
end;

procedure TformAtendimento.btnSalvarClick(Sender: TObject);
var
   codigoMotivo: Integer;
begin

   if (edNome.Text = '') then
   begin
      Mensagem( 'O nome deve ser preenchido.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      Exit;
   end;

   qryMotivos.Post;

   codigoMotivo := qryMotivoscd_motivo.AsInteger;
   qryMotivos.Refresh;
   qryMotivos.Locate('cd_motivo',codigoMotivo,[]);
end;


procedure TformAtendimento.dbgLocaisKeyPress(Sender: TObject; var Key: Char);
begin
   if(qryMotivoscd_motivo.IsNull) then
   begin
      Key := #0;
      exit;
   end;
end;

procedure TformAtendimento.dsMotivosDataChange(Sender: TObject; Field: TField);
begin
   qryLocais.Close;
   qryLocais.ParamByName('motivo').AsString := qryMotivoscd_motivo.AsString;
   qryLocais.Open;

   qryProcedimentos.Close;
   qryProcedimentos.ParamByName('motivo').AsString := qryMotivoscd_motivo.AsString;
   qryProcedimentos.Open;
end;

procedure TformAtendimento.dsMotivosStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not (qryMotivos.State IN [ dsInsert, dsEdit ]);
   btnAlterar.Enabled := not (qryMotivos.State IN [ dsInsert, dsEdit ]);
   btnExcluir.Enabled := not (qryMotivos.State IN [ dsInsert, dsEdit ]);
   
   btnCancelar.Enabled := qryMotivos.State IN [ dsInsert, dsEdit ];
   btnSalvar.Enabled   := qryMotivos.State IN [ dsInsert, dsEdit ];

   edNome.Enabled       := NOT ( qryMotivos.State IN [ dsBrowse ] );
   DBMemo1.Enabled      := NOT ( qryMotivos.State IN [ dsBrowse ] );
   DBCheckBox1.Enabled  := NOT ( qryMotivos.State IN [ dsBrowse ] );

   dbgLocais.Enabled       := NOT ( qryMotivos.State IN [ dsBrowse ] );
   dbgProcedimento.Enabled := NOT ( qryMotivos.State IN [ dsBrowse ] );
   sbAdcTipoTitulo.Enabled := NOT ( qryMotivos.State IN [ dsBrowse ] );
   sbExcTipoTitulo.Enabled := NOT ( qryMotivos.State IN [ dsBrowse ] );
   sbExclusao.Enabled      := NOT ( qryMotivos.State IN [ dsBrowse ] );
   sbProcedimento.Enabled  := NOT ( qryMotivos.State IN [ dsBrowse ] );
end;

procedure TformAtendimento.edNomeKeyPress(Sender: TObject; var Key: Char);
begin
   if not (qryMotivos.State in [dsEdit,dsInsert]) then
   begin
      qryMotivos.Edit;
   end;
end;

procedure TformAtendimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TformAtendimento.FormShow(Sender: TObject);
begin
   qryMotivos.Close;
   qryMotivos.Open;
end;

procedure TformAtendimento.lbBuscaChange(Sender: TObject);
begin
   qryMotivos.Refresh;
   qryMotivos.Filtered := false;
   qryMotivos.Filter := Format(' nm_motivo LIKE %s', [QuotedStr(AnsiQuotedStr(lbBusca.Text,#42))]);
   qryMotivos.Filtered := true;
end;

procedure TformAtendimento.limpaDados;
const
   SQL_APAGA_LOCAL =
      'DELETE FROM pessoas_atendimentos_locais WHERE cd_motivo = :motivo';
   SQL_APAGA_PROCEDIMENTO =
      'DELETE FROM pessoas_atendimentos_procedimentos WHERE cd_motivo = :motivo';
var
   qryApaga : TUMZQuery;
   nrMotivos: Integer;
begin
   dm.CriarConsulta(qryApaga);
   qryApaga.SQL.Add(SQL_APAGA_LOCAL);
   qryApaga.ParamByName('motivo').AsString := qryMotivoscd_motivo.AsString;
   qryApaga.ExecSQL;

   qryApaga.SQL.Clear;

   qryApaga.SQL.Add(SQL_APAGA_PROCEDIMENTO);
   qryApaga.ParamByName('motivo').AsString := qryMotivoscd_motivo.AsString;
   qryApaga.ExecSQL;

   FreeAndNil(qryApaga);
end;

procedure TformAtendimento.qryLocaisBeforePost(DataSet: TDataSet);
begin
   qryLocaiscd_motivo.AsString := qryMotivoscd_motivo.AsString;
end;

procedure TformAtendimento.qryProcedimentosBeforePost(DataSet: TDataSet);
begin
   qryProcedimentoscd_motivo.AsString := qryMotivoscd_motivo.AsString;
end;

procedure TformAtendimento.sbAdcTipoTituloClick(Sender: TObject);
begin
   if(qryMotivoscd_motivo.IsNull) then
   begin
      exit;
   end;
   qryLocais.Append;
   dbgLocais.SetFocus;
end;

procedure TformAtendimento.sbExcTipoTituloClick(Sender: TObject);
begin
   if(qryMotivoscd_motivo.IsNull) then
   begin
      exit;
   end;
   qryLocais.Delete;
end;

procedure TformAtendimento.sbProcedimentoClick(Sender: TObject);
begin
   if(qryMotivoscd_motivo.IsNull) then
   begin
      exit;
   end;
   qryProcedimentos.Append;
   dbgProcedimento.SetFocus;
end;

procedure TformAtendimento.sbExclusaoClick(Sender: TObject);
begin
   if(qryMotivoscd_motivo.IsNull) then
   begin
      exit;
   end;
   qryProcedimentos.Delete;
end;

end.
