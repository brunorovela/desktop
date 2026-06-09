unit uFExportacaoDadosNovoProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, DBTables, Mask, DBCtrls, ToolWin, ComCtrls,
  ImgList, ZAbstractRODataset, ZAbstractDataset, UZDataset, UMDateTimePicker;

type
  TfExportacaoDadosNovoProcesso = class(TForm)
    paCabecalho: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    qyNovoProcesso: TUMZQuery;
    dsNovoProcesso: TDataSource;
    edNomeProcesso: TDBEdit;
    mmEdital: TDBMemo;
    qyNovoProcessocd_processo: TIntegerField;
    qyNovoProcessocd_layout: TIntegerField;
    qyNovoProcessods_processo: TStringField;
    Label3: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnSalvar: TToolButton;
    ilToolBar: TImageList;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton4: TToolButton;
    cbLayoutsExportacao: TDBLookupComboBox;
    qyLayouts: TUMZQuery;
    qyLayoutscd_layout: TIntegerField;
    qyLayoutsds_layout: TStringField;
    qyNovoProcessolk_layout: TStringField;
    qyNovoProcessome_edital: TMemoField;
    Label4: TLabel;
    qyNovoProcessodt_processo: TDateTimeField;
    umdtProcesso: TUMDateTimePicker;
    procedure qyNovoProcessoBeforePost(DataSet: TDataSet);
    procedure qyNovoProcessoNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure NovoProcesso();
  public
    { Public declarations }
  end;

var
  fExportacaoDadosNovoProcesso: TfExportacaoDadosNovoProcesso;

implementation

uses General;

{$R *.dfm}

procedure TfExportacaoDadosNovoProcesso.btnSalvarClick(Sender: TObject);
begin
   if not (qyNovoProcessocd_layout.AsInteger > 0) then
   begin
      Mensagem('É necessário selecionar um layout de exportação.', 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   try
      qyNovoProcesso.Post();
   except

   end;

   Mensagem('Novo processo cadastrado.', 'Cadastro de Processo', MB_OK + MB_ICONINFORMATION, Handle);
   Close();
end;

procedure TfExportacaoDadosNovoProcesso.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F5: btnSalvarClick(nil);
      VK_F6: btnFecharClick(nil);
   end;
end;

procedure TfExportacaoDadosNovoProcesso.FormShow(Sender: TObject);
begin
   qyLayouts.Open();
   NovoProcesso();
end;

procedure TfExportacaoDadosNovoProcesso.NovoProcesso;
begin
   with qyNovoProcesso do
   begin
      Close();
      SQL.Clear();

      // Colocado where cd_processo = 0, para não carregar todos os registros da tabela sem necessidade
      SQL.Add('SELECT * FROM expo_processos WHERE cd_processo = 0');

      Open();
      Insert();
   end;
end;

procedure TfExportacaoDadosNovoProcesso.qyNovoProcessoBeforePost(
  DataSet: TDataSet);
begin
   qyNovoProcessodt_processo.AsDateTime := umdtProcesso.Date;
end;

procedure TfExportacaoDadosNovoProcesso.qyNovoProcessoNewRecord(
  DataSet: TDataSet);
begin
   umdtProcesso.Date := Now;
end;

procedure TfExportacaoDadosNovoProcesso.btnFecharClick(Sender: TObject);
begin
   Close();
end;

end.
