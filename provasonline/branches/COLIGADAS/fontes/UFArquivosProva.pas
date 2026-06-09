unit UFArquivosProva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ExtCtrls, StdCtrls, DB, UUtils,
  ZAbstractRODataset, UZDataset, DBCtrls, Grids, DBGrids, ShellAPI;

type
  TfArquivosProva = class(TForm)
    ilOpcoes: TImageList;
    tlbOpcoes: TToolBar;
    btnSep1: TToolButton;
    btnBaixar: TToolButton;
    btnVisualizar: TToolButton;
    btnSep2: TToolButton;
    btnFechar: TToolButton;
    btnSep3: TToolButton;
    bvlSep1: TBevel;
    bvlSep2: TBevel;
    qryProva: TUMZReadOnlyQuery;
    qryProvaCD_PROVA: TIntegerField;
    qryProvaDS_PROVA: TStringField;
    qryProvaNR_ANOSEMESTRE: TSmallintField;
    qryProvaDT_INICIO: TDateTimeField;
    qryProvaDT_FIM: TDateTimeField;
    qryProvaDS_DISCIPLINA: TStringField;
    qryProvaNM_RESPONSAVEL: TStringField;
    pnlDados: TPanel;
    gbProva: TGroupBox;
    lblTitulo: TLabel;
    lblAnoSem: TLabel;
    lblInicio: TLabel;
    lblFim: TLabel;
    lblDisc: TLabel;
    lblResp: TLabel;
    lblCodigo: TLabel;
    dbtCodigo: TDBText;
    dbtTitulo: TDBText;
    dbtAnoSem: TDBText;
    dbtInicio: TDBText;
    dbtFim: TDBText;
    dbtDisc: TDBText;
    dbtResp: TDBText;
    dsProva: TDataSource;
    bvlSep3: TBevel;
    qryArquivos: TUMZReadOnlyQuery;
    dsArquivos: TDataSource;
    sdlgPdf: TSaveDialog;
    qryArquivosDS_TAMANHO: TStringField;
    qryArquivosCD_TURMA: TStringField;
    qryArquivosCD_CURSO: TStringField;
    qryArquivosME_ARQUIVO: TBlobField;
    qryArquivosFILENAME: TStringField;
    pnlLista: TPanel;
    lblListaTit: TLabel;
    bvlSep4: TBevel;
    dbgArquivos: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryArquivosAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryArquivosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
      class procedure ShowFiles(const Code: Integer);
  end;

var
  fArquivosProva: TfArquivosProva;

implementation

{$R *.dfm}

procedure TfArquivosProva.btnBaixarClick(Sender: TObject);
const
   SInfoCaption = 'Informação';
   SInfoFileSaved = 'O documento foi salvo com sucesso em %s';
   SInfoFileNotSaved = 'Não foi possível gravar o documento em %s';
begin
   if sdlgPdf.Execute then
   begin
      qryArquivosME_ARQUIVO.SaveToFile(sdlgPdf.FileName);
      if FileExists(sdlgPdf.FileName) then
      begin
         MessageBox(Handle, PChar(Format(SInfoFileSaved, [sdlgPdf.FileName])),
            PChar(SInfoCaption), MB_ICONINFORMATION or MB_OK);
      end
      else
         MessageBox(Handle, PChar(Format(SInfoFileNotSaved, [sdlgPdf.FileName])),
            PChar(SInfoCaption), MB_ICONERROR or MB_OK);
   end;
end;

procedure TfArquivosProva.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfArquivosProva.btnVisualizarClick(Sender: TObject);
const
   SInfoCap = 'Informação';
   SErrorSave = 'Não foi possível recuperar o arquivo.';
var
   FilePath: TFileName;
begin
   FilePath := GetTempDirectory + PathDelim + qryArquivosFILENAME.AsString + '.pdf';
   if FileExists(FilePath) then
   begin
      DeleteFile(FilePath);
   end;
   
   qryArquivosME_ARQUIVO.SaveToFile(FilePath);
   
   if FileExists(FilePath) then
   begin
      ShellExecute(Handle, 'open', PChar(FilePath), nil, nil, SW_SHOWNORMAL)
   end
   else
      MessageBox(Handle, PChar(SErrorSave), PChar(SInfoCap), MB_ICONERROR or
         MB_OK);
end;

procedure TfArquivosProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryArquivos.Close;
   qryProva.Close;
   Action := caFree;
end;

procedure TfArquivosProva.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F7:
         btnBaixar.Click;
      VK_F8:
         btnVisualizar.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

procedure TfArquivosProva.qryArquivosAfterOpen(DataSet: TDataSet);
begin
   btnBaixar.Enabled := not qryArquivos.IsEmpty;
   btnVisualizar.Enabled := not qryArquivos.IsEmpty;
end;

procedure TfArquivosProva.qryArquivosCalcFields(DataSet: TDataSet);
var
   ContentSize: Double;
   Measure: 0..4;
begin
   Measure := 0;
   ContentSize := Length(qryArquivosME_ARQUIVO.AsString);

   while (ContentSize > 1024) and (Measure < 4) do
   begin
      ContentSize := ContentSize / 1024;
      Inc(Measure);
   end;

   case Measure of
      0:
         qryArquivosDS_TAMANHO.AsString := Format('%f %s', [ContentSize, 'Bytes']);
      1:
         qryArquivosDS_TAMANHO.AsString := Format('%f %s', [ContentSize, 'KB']);
      2:
         qryArquivosDS_TAMANHO.AsString := Format('%f %s', [ContentSize, 'MB']);
      3:
         qryArquivosDS_TAMANHO.AsString := Format('%f %s', [ContentSize, 'GB']);
      4:
         qryArquivosDS_TAMANHO.AsString := Format('%f %s', [ContentSize, 'TB']);
   end;
end;

class procedure TfArquivosProva.ShowFiles(const Code: Integer);
begin
   if fArquivosProva = nil then
      Application.CreateForm(TfArquivosProva, fArquivosProva);
   try
      fArquivosProva.qryArquivos.Close;
      fArquivosProva.qryProva.Close;

      fArquivosProva.qryProva.ParamByName('CD_PROVA').AsInteger := Code;
      fArquivosProva.qryProva.Open;
      fArquivosProva.qryArquivos.Open;

      fArquivosProva.ShowModal;
   finally
      fArquivosProva.Free;
      fArquivosProva := nil;
   end;
end;

end.
