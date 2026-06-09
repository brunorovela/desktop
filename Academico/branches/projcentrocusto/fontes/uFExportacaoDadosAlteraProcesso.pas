unit uFExportacaoDadosAlteraProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, DBTables, DBCtrls, ComCtrls, ToolWin, StdCtrls, Mask,
  ExtCtrls, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfExportacaoDadosAlteraProcesso = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    paCabecalho: TPanel;
    edNomeProcesso: TDBEdit;
    mmEdital: TDBMemo;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnSalvar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton4: TToolButton;
    cbLayoutsExportacao: TDBLookupComboBox;
    qyProcesso: TUMZQuery;
    qyProcessocd_processo: TIntegerField;
    qyProcessocd_layout: TIntegerField;
    qyProcessods_processo: TStringField;
    qyProcessolk_layout: TStringField;
    qyProcessome_edital: TMemoField;
    dsProcesso: TDataSource;
    ilToolBar: TImageList;
    qyLayouts: TUMZQuery;
    qyLayoutscd_layout: TIntegerField;
    qyLayoutsds_layout: TStringField;
    qyProcessodt_processo: TDateTimeField;
    DateTimePicker1: TDateTimePicker;
    procedure qyProcessoBeforePost(DataSet: TDataSet);
    procedure qyProcessoAfterEdit(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AlterarProcesso( cd_processo: Integer );
    { Public declarations }
  end;

var
  fExportacaoDadosAlteraProcesso: TfExportacaoDadosAlteraProcesso;

implementation

uses General;

{$R *.dfm}

{ TfExportacaoDadosAlteraProcesso }

procedure TfExportacaoDadosAlteraProcesso.AlterarProcesso(cd_processo: Integer);
begin
   with qyProcesso do
   begin
      Close();

      ParamByName('cd_processo').AsInteger := cd_processo;

      Open();
      Edit();
   end;

   ShowModal();
end;

procedure TfExportacaoDadosAlteraProcesso.btnFecharClick(Sender: TObject);
begin
   qyProcesso.Cancel();
   Close();
end;

procedure TfExportacaoDadosAlteraProcesso.btnSalvarClick(Sender: TObject);
begin
   if not (qyProcessocd_layout.AsInteger > 0) then
   begin
      Mensagem('É necessário selecionar um layout de exportação.', 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   qyProcesso.Post();

   Mensagem('Processo alterado.', 'Cadastro de Processo', MB_OK + MB_ICONINFORMATION, Handle);
   Close();
end;

procedure TfExportacaoDadosAlteraProcesso.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F5: btnSalvarClick(nil);
      VK_F6: btnFecharClick(nil);
   end;
end;

procedure TfExportacaoDadosAlteraProcesso.qyProcessoAfterEdit(
  DataSet: TDataSet);
begin
   DateTimePicker1.Date := qyProcessodt_processo.AsDateTime;
end;

procedure TfExportacaoDadosAlteraProcesso.qyProcessoBeforePost(
  DataSet: TDataSet);
begin
   qyProcessodt_processo.AsDateTime := DateTimePicker1.DateTime;
end;

end.
