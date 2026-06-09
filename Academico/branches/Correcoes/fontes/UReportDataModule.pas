unit UReportDataModule;

interface

uses
   SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset,
   Provider, DBClient, ZSqlUpdate;

type
   TReportDataModule = class(TDataModule)
      cdsArquivo: TClientDataSet;
      cdsArquivoCD_ARQUIVO: TLargeintField;
      cdsArquivoDS_CHAVE: TStringField;
      cdsArquivoDS_MD5: TStringField;
      cdsArquivoDT_ALTERACAO: TDateTimeField;
      cdsArquivoDT_INCLUSAO: TDateTimeField;
      cdsArquivoME_ARQUIVO: TBlobField;
      cdsArquivoNM_ARQUIVO: TStringField;
      cdsCategorias: TClientDataSet;
      cdsCategoriasCD_CATEGORIA: TLargeintField;
      cdsCategoriasCD_CATEGORIA_PAI: TLargeintField;
      cdsCategoriasCD_MODULO: TIntegerField;
      cdsCategoriasDS_CATEGORIA: TStringField;
      cdsCategoriasDS_CHAVE: TStringField;
      cdsCategoriasDT_ALTERACAO: TDateTimeField;
      cdsCategoriasDT_INCLUSAO: TDateTimeField;
      cdsCategoriasSN_ATIVO: TSmallintField;
      cdsCategoriasSN_CONCEDER: TLargeintField;
      cdsCategoriasSN_PADRAO: TSmallintField;
      cdsCategoriasSN_RENOMEAR: TLargeintField;
      cdsFiltros: TClientDataSet;
      cdsFiltrosCD_FILTRO: TLargeintField;
      cdsFiltrosCD_RELATORIO: TLargeintField;
      cdsFiltrosCD_SQL: TLargeintField;
      cdsFiltrosDT_ALTERACAO: TDateTimeField;
      cdsFiltrosDT_INCLUSAO: TDateTimeField;
      cdsFiltrosME_CONFIG: TMemoField;
      cdsFiltrosNM_FILTRO: TStringField;
      cdsFiltrosNR_CLASSE: TSmallintField;
      cdsFiltrosNR_ORDEM: TSmallintField;
      cdsFiltrosSN_ATIVO: TSmallintField;
      cdsFiltrosSN_OBRIGATORIO: TSmallintField;
      cdsHistorico: TClientDataSet;
      cdsHistoricoCD_HISTORICO: TLargeintField;
      cdsHistoricoCD_RELATORIO: TLargeintField;
      cdsHistoricoDT_ALTERACAO: TDateTimeField;
      cdsHistoricoDT_INCLUSAO: TDateTimeField;
      cdsHistoricoME_DESCRICAO: TMemoField;
      cdsHistoricoNM_AUTOR: TStringField;
      cdsImpressao: TClientDataSet;
      cdsImpressaoCD_IMPRESSAO: TLargeintField;
      cdsImpressaoCD_PESSOA: TIntegerField;
      cdsImpressaoCD_RELATORIO: TLargeintField;
      cdsImpressaoDT_ALTERACAO: TDateTimeField;
      cdsImpressaoDT_INCLUSAO: TDateTimeField;
      cdsImpressaoME_FILTRO: TMemoField;
      cdsRelatorios: TClientDataSet;
      cdsRelatoriosCD_ARQUIVO: TLargeintField;
      cdsRelatoriosCD_CATEGORIA: TLargeintField;
      cdsRelatoriosCD_PESSOA: TIntegerField;
      cdsRelatoriosCD_RELATORIO: TLargeintField;
      cdsRelatoriosCD_RELATORIO_PAI: TLargeintField;
      cdsRelatoriosDS_BOLETO_FILTRO: TStringField;
      cdsRelatoriosDS_BOLETO_FILTRO_MENSALIDADE: TStringField;
      cdsRelatoriosDS_CHAVE: TStringField;
      cdsRelatoriosDS_LINK_HELP: TStringField;
      cdsRelatoriosDT_ALTERACAO: TDateTimeField;
      cdsRelatoriosDT_INCLUSAO: TDateTimeField;
      cdsRelatoriosME_CONFIG: TMemoField;
      cdsRelatoriosME_DESC_CLIENTE: TMemoField;
      cdsRelatoriosME_DESC_PADRAO: TMemoField;
      cdsRelatoriosNM_RELATORIO: TStringField;
      cdsRelatoriosNR_PADRAO: TSmallintField;
      cdsRelatoriosSN_ATIVO: TSmallintField;
      cdsRelatoriosSN_BOLETO: TSmallintField;
      cdsRelatoriosSN_CONCEDER: TLargeintField;
      cdsRelatoriosSN_RENOMEAR: TLargeintField;
      cdsSQL: TClientDataSet;
      cdsSQLCD_SQL: TLargeintField;
      cdsSQLDT_ALTERACAO: TDateTimeField;
      cdsSQLDT_INCLUSAO: TDateTimeField;
      cdsSQLME_CONFIG: TMemoField;
      cdsSQLNM_AUTOR: TStringField;
      cdsSQLNM_SQL: TStringField;
      dspArquivo: TDataSetProvider;
      dspCategorias: TDataSetProvider;
      dspFiltros: TDataSetProvider;
      dspHistorico: TDataSetProvider;
      dspImpressao: TDataSetProvider;
      dspRelatorios: TDataSetProvider;
      dspSQL: TDataSetProvider;
      qryArquivo: TUMZReadOnlyQuery;
      qryArquivoCD_ARQUIVO: TLargeintField;
      qryArquivoDS_CHAVE: TStringField;
      qryArquivoDS_MD5: TStringField;
      qryArquivoDT_ALTERACAO: TDateTimeField;
      qryArquivoDT_INCLUSAO: TDateTimeField;
      qryArquivoME_ARQUIVO: TBlobField;
      qryArquivoNM_ARQUIVO: TStringField;
      qryCategorias: TUMZQuery;
      qryCategoriasCD_CATEGORIA: TLargeintField;
      qryCategoriasCD_CATEGORIA_PAI: TLargeintField;
      qryCategoriasCD_MODULO: TIntegerField;
      qryCategoriasDS_CATEGORIA: TStringField;
      qryCategoriasDS_CHAVE: TStringField;
      qryCategoriasDT_ALTERACAO: TDateTimeField;
      qryCategoriasDT_INCLUSAO: TDateTimeField;
      qryCategoriasSN_ATIVO: TSmallintField;
      qryCategoriasSN_CONCEDER: TLargeintField;
      qryCategoriasSN_PADRAO: TSmallintField;
      qryCategoriasSN_RENOMEAR: TLargeintField;
      qryFiltros: TUMZReadOnlyQuery;
      qryFiltrosCD_FILTRO: TLargeintField;
      qryFiltrosCD_RELATORIO: TLargeintField;
      qryFiltrosCD_SQL: TLargeintField;
      qryFiltrosDT_ALTERACAO: TDateTimeField;
      qryFiltrosDT_INCLUSAO: TDateTimeField;
      qryFiltrosME_CONFIG: TMemoField;
      qryFiltrosNM_FILTRO: TStringField;
      qryFiltrosNR_CLASSE: TSmallintField;
      qryFiltrosNR_ORDEM: TSmallintField;
      qryFiltrosSN_ATIVO: TSmallintField;
      qryFiltrosSN_OBRIGATORIO: TSmallintField;
      qryHistorico: TUMZReadOnlyQuery;
      qryHistoricoCD_HISTORICO: TLargeintField;
      qryHistoricoCD_RELATORIO: TLargeintField;
      qryHistoricoDT_ALTERACAO: TDateTimeField;
      qryHistoricoDT_INCLUSAO: TDateTimeField;
      qryHistoricoME_DESCRICAO: TMemoField;
      qryHistoricoNM_AUTOR: TStringField;
      qryImpressao: TUMZQuery;
      qryImpressaoCD_IMPRESSAO: TLargeintField;
      qryImpressaoCD_PESSOA: TIntegerField;
      qryImpressaoCD_RELATORIO: TLargeintField;
      qryImpressaoDT_ALTERACAO: TDateTimeField;
      qryImpressaoDT_INCLUSAO: TDateTimeField;
      qryImpressaoME_FILTRO: TMemoField;
      qryRelatorios: TUMZQuery;
      qryRelatoriosCD_ARQUIVO: TLargeintField;
      qryRelatoriosCD_CATEGORIA: TLargeintField;
      qryRelatoriosCD_PESSOA: TIntegerField;
      qryRelatoriosCD_RELATORIO: TLargeintField;
      qryRelatoriosCD_RELATORIO_PAI: TLargeintField;
      qryRelatoriosDS_BOLETO_FILTRO: TStringField;
      qryRelatoriosDS_BOLETO_FILTRO_MENSALIDADE: TStringField;
      qryRelatoriosDS_CHAVE: TStringField;
      qryRelatoriosDS_LINK_HELP: TStringField;
      qryRelatoriosDT_ALTERACAO: TDateTimeField;
      qryRelatoriosDT_INCLUSAO: TDateTimeField;
      qryRelatoriosME_CONFIG: TMemoField;
      qryRelatoriosME_DESC_CLIENTE: TMemoField;
      qryRelatoriosME_DESC_PADRAO: TMemoField;
      qryRelatoriosNM_RELATORIO: TStringField;
      qryRelatoriosNR_PADRAO: TSmallintField;
      qryRelatoriosSN_ATIVO: TSmallintField;
      qryRelatoriosSN_BOLETO: TSmallintField;
      qryRelatoriosSN_CONCEDER: TLargeintField;
      qryRelatoriosSN_RENOMEAR: TLargeintField;
      qrySQL: TUMZReadOnlyQuery;
      qrySQLCD_SQL: TLargeintField;
      qrySQLDT_ALTERACAO: TDateTimeField;
      qrySQLDT_INCLUSAO: TDateTimeField;
      qrySQLME_CONFIG: TMemoField;
      qrySQLNM_AUTOR: TStringField;
      qrySQLNM_SQL: TStringField;
      updCategorias: TZUpdateSQL;
      updRelatorios: TZUpdateSQL;
      procedure DataModuleCreate(Sender: TObject);
   private
      function FindFileStream(const FileID: Cardinal): TStream;
      function SaveStreamToFile(const Stream: TStream;
         const FileName: AnsiString): AnsiString;
   public
      function GetReportFilePath: AnsiString;
      function LocateReportByKey(const Key: AnsiString): Boolean;
   end;

implementation

uses
   uDM;

{$R *.dfm}

procedure TReportDataModule.DataModuleCreate(Sender: TObject);
begin
   inherited;
   RemoveDataModule(Self);
   cdsRelatorios.Params.ParamByName('CD_PESSOA').AsInteger :=
      DM.UsuarioLogado.Pessoa.Codigo;
   cdsCategorias.Params.ParamByName('CD_PESSOA').AsInteger :=
      DM.UsuarioLogado.Pessoa.Codigo;
end;

function TReportDataModule.FindFileStream(const FileID: Cardinal): TStream;
begin
   Result := nil;
   cdsArquivo.Close;
   cdsArquivo.Params.ParamByName('CD_ARQUIVO').AsInteger := FileID;
   cdsArquivo.Open;

   if not cdsArquivo.IsEmpty then
   begin
      Result := cdsArquivo.CreateBlobStream(cdsArquivoME_ARQUIVO, bmRead);
   end;
end;

function TReportDataModule.GetReportFilePath: AnsiString;
const
   SFilterFmt = 'DS_CHAVE = %s';
var
   Stream: TStream;
begin
   Result := '';
   Stream := FindFileStream(cdsRelatoriosCD_ARQUIVO.AsLargeInt);
   try
      if Stream <> nil then
      begin
         Result := SaveStreamToFile(Stream, cdsArquivoNM_ARQUIVO.AsString);
      end;
   finally
      FreeAndNil(Stream);
   end;
end;

function TReportDataModule.LocateReportByKey(const Key: AnsiString): Boolean;
begin
   if not cdsRelatorios.Active then
   begin
      cdsRelatorios.Open;
   end;
   Result := cdsRelatorios.Locate('DS_CHAVE', Key, []);
end;

function TReportDataModule.SaveStreamToFile(const Stream: TStream;
  const FileName: AnsiString): AnsiString;
const
   SFilePathFmt = '%s\%s.rpt';
var
   Path, FilePath: AnsiString;
   FileStream: TFileStream;
begin
   Path := GetEnvironmentVariable('TEMP');
   FilePath := Format(SFilePathFmt, [Path, FileName]);
   Result := FilePath;

   FileStream := TFileStream.Create(FilePath, fmCreate);
   try
      try
         FileStream.CopyFrom(Stream, Stream.Size);
      except
         on E: EFileStreamError do
         begin
            Result := '';
         end;
      end;
   finally
      FreeAndNil(FileStream);
   end;
end;

end.
