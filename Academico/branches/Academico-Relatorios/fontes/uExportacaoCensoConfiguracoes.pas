unit uExportacaoCensoConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfExportacaoCensoConfiguracoes = class(TForm)
    paCabecalho: TPanel;
    pnConfiguracoes: TPanel;
    tbAcoes: TToolBar;
    btSalvar: TToolButton;
    btCancelar: TToolButton;
    tbSeparator4: TToolButton;
    ilToolBar: TImageList;
    dblLayout: TDBLookupComboBox;
    lbLayout: TLabel;
    lbData1: TLabel;
    lbData2: TLabel;
    lbData3: TLabel;
    lbDataAtualizacao: TLabel;
    lbDataBloqueio: TLabel;
    lbDataExportacao: TLabel;
    qyConfigProcesso: TUMZQuery;
    dsConfigProcesso: TDataSource;
    qyLayouts: TUMZQuery;
    qyLayoutscd_layout: TIntegerField;
    qyLayoutsds_layout: TStringField;
    qyConfigProcessocd_layout: TIntegerField;
    qyConfigProcessodt_ultima_exportacao: TDateTimeField;
    qyConfigProcessodt_ultima_atualizacao: TDateTimeField;
    qyConfigProcessodt_ultimo_bloqueio: TDateTimeField;
    qyConfigProcessods_layout: TStringField;
    qyConfigProcessonr_ano: TIntegerField;
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure Filtrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExportacaoCensoConfiguracoes: TfExportacaoCensoConfiguracoes;

implementation

{$R *.dfm}

uses General, uExportacaoCenso, uDM;

procedure TfExportacaoCensoConfiguracoes.btCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfExportacaoCensoConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfExportacaoCensoConfiguracoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   {Configura as teclas de atalho}
   case key of
      VK_F5 : if btSalvar.Enabled then btSalvarClick( nil );
      VK_F6 : if btCancelar.Enabled then btCancelarClick( nil );
   end;
end;

procedure TfExportacaoCensoConfiguracoes.FormShow(Sender: TObject);
begin
   Filtrar();
end;

procedure TfExportacaoCensoConfiguracoes.btSalvarClick(Sender: TObject);
var
   ds_log, ds_resumo_log: String;
begin
   if qyConfigProcesso.State in [dsEdit] then
   begin
      qyConfigProcesso.Post;
   end;

   // Insere o log de desbloqueio de um processo
   ds_log := 'Definido o layout "'+qyConfigProcesso.FieldByName('ds_layout').AsString+'" para o processo '+fExportacaoCenso.qyProcesso.FieldByName('nr_ano').AsString+'.'+#13+
             ' cd_processo: '+fExportacaoCenso.qyProcesso.FieldByName('cd_processo').AsString+#13+
             ' cd_layout: '+qyConfigProcesso.FieldByName('cd_layout').AsString+#13+
             ' nr_ano: '+fExportacaoCenso.qyProcesso.FieldByName('nr_ano').AsString+#13+
             ' cd_coligada: '+fExportacaoCenso.qyProcesso.FieldByName('cd_coligada').AsString+#13+
             ' sn_bloqueado: '+fExportacaoCenso.qyProcesso.FieldByName('sn_bloqueado').AsString+#13+
             ' dt_ultima_exportacao: '+fExportacaoCenso.qyProcesso.FieldByName('dt_ultima_exportacao').AsString+#13+
             ' dt_ultima_atualizacao: '+fExportacaoCenso.qyProcesso.FieldByName('dt_ultima_atualizacao').AsString+#13+
             ' dt_ultimo_bloqueio: '+fExportacaoCenso.qyProcesso.FieldByName('dt_ultimo_bloqueio').AsString;
   ds_resumo_log := 'Definido layout "'+qyConfigProcesso.FieldByName('ds_layout').AsString+'" do processo '+fExportacaoCenso.qyProcesso.FieldByName('nr_ano').AsString+'.';
             
   fExportacaoCenso.inserirLog(DM.iCdPessoaLogado, fExportacaoCenso.qyProcesso.FieldByName('cd_processo').AsString+';'+fExportacaoCenso.qyProcesso.FieldByName('nr_ano').AsString, ds_log, ds_resumo_log);

   Close;
end;

procedure TfExportacaoCensoConfiguracoes.Filtrar();
begin
   qyLayouts.Close;
   qyLayouts.Open;

   qyConfigProcesso.Close;
   qyConfigProcesso.ParamByName('cd_processo').AsInteger := fExportacaoCenso.qyProcesso.FieldByName('cd_processo').AsInteger;
   qyConfigProcesso.Open;

   lbDataAtualizacao.Caption := qyConfigProcesso.FieldByName('dt_ultima_atualizacao').AsString;
   lbDataBloqueio.Caption := qyConfigProcesso.FieldByName('dt_ultimo_bloqueio').AsString;
   lbDataExportacao.Caption := qyConfigProcesso.FieldByName('dt_ultima_exportacao').AsString;

   paCabecalho.Caption := 'CONFIGURAÇÕES DO PROCESSO DE ' + qyConfigProcesso.FieldByName('nr_ano').AsString;

   dblLayout.Enabled := fExportacaoCenso.qyProcesso.FieldByName('sn_bloqueado').AsInteger = 0;
end;

end.
