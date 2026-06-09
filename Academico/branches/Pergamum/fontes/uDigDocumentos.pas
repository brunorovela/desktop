unit uDigDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, ZConnection, Grids, DBGrids, ComCtrls,
  ImgList, Jpeg, Buttons, DelphiTwain, ExtDlgs, CropImage, General, DBTables,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ToolWin, Math, uAddDocumento,
  MidasLib, ShellAPI;

type
   TIntegerArray = array of integer;

  TFDigDocumentos = class(TForm)
    pnTitulo: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qyDocumentos: TUMZQuery;
    dsDocumentos: TDataSource;
    qyDocumentoscodigo: TSmallintField;
    qyDocumentosdocumento: TStringField;
    qyDocumentosprazo: TStringField;
    qyDocumentossigla: TStringField;
    qyDocumentosordem: TIntegerField;
    qyDocumentosds_sexo: TStringField;
    qyDocumentossn_digitaliza: TStringField;
    qyDocumentosnr_dpi: TSmallintField;
    qyDocumentosnr_largura: TSmallintField;
    qyDocumentosnr_altura: TSmallintField;
    ilDocumentos: TImageList;
    lvwDocumentos: TListView;
    qyDocumentosAlunos: TUMZQuery;
    dsDocumentosAlunos: TDataSource;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    btnDigitalizar: TSpeedButton;
    DelphiTwain1: TDelphiTwain;
    AbrirImagem: TOpenPictureDialog;
    Panel6: TPanel;
    Label1: TLabel;
    imDocs: TCropImage;
    btnAdicionar: TButton;
    cbTipos: TComboBox;
    ToolBar1: TToolBar;
    tbVisualizar: TToolButton;
    tbExcluir: TToolButton;
    ilBarra: TImageList;
    tbRotacionarDireita: TToolButton;
    ToolButton1: TToolButton;
    qyDocsAluno: TUMZQuery;
    dsDocsAluno: TDataSource;
    pnSuperior: TPanel;
    Panel1: TPanel;
    pcDocumentos: TPageControl;
    tsDocsAlunos: TTabSheet;
    dgDocsAluno: TDBGrid;
    tsDocsGeral: TTabSheet;
    DBGrid1: TDBGrid;
    spSeparador1: TSplitter;
    spSeparador2: TSplitter;
    spSeparador3: TSplitter;
    qyDocsUnimestre: TUMZQuery;
    qyDocsDocs: TUMZQuery;
    qySincronizaDocs: TUMZQuery;
    tbMudarTipoDocumento: TToolButton;
    qyBuscaDocumento: TUMZQuery;
    qyDeleteDocumentoAluno: TUMZQuery;
    qyAlteraDocumentoAluno: TUMZQuery;
    pnlImagem: TPanel;
    pgcOpcoes: TPageControl;
    tbsImagem: TTabSheet;
    tbsPDF: TTabSheet;
    imgPDF: TImage;
    ilPDF: TImageList;
    btnAbrirPDF: TToolButton;
    sdArquivos: TSaveDialog;
    procedure btnAbrirPDFClick(Sender: TObject);
    procedure sbPDFClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure tbMudarTipoDocumentoClick(Sender: TObject);
    procedure dgDocsAlunoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pcDocumentosChange(Sender: TObject);
    procedure dsDocsAlunoDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure DelphiTwain1AcquireCancel(Sender: TObject; const Index: Integer);
    procedure ToolButton1Click(Sender: TObject);
    procedure tbRotacionarDireitaClick(Sender: TObject);
    procedure DelphiTwain1AcquireError(Sender: TObject; const Index: Integer;
      ErrorCode, Additional: Integer);
    procedure DelphiTwain1TwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbVisualizarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure lvwDocumentosDblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure dsDocumentosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    FADocsNecessarios: TIntegerArray;
    FPDFPath: string;
    procedure atualizarDocumentacao;
    procedure aplicarRotacao(direcao: integer);
    function Rotacionar(Bitmap: TBitmap; const Angulo: Extended;
      bgColor: TColor): TBitmap;
    procedure ExcluirDocumento;
    procedure AbrirDocumento;
    procedure SalvaNoBancoDados( extensao : String );
    procedure ResizeFoto(var oJPG: TJPEGImage; iMaxWidth, iMaxHeigth: Integer);
    procedure VerificaBibliotecaTwain;
    { Private declarations }
    procedure carregaDocumentos;
    function TemItemSelecionado: boolean;
    procedure SincronizaDocumentos;
    procedure atualizaTabelaSiga(codDoc,codigoAluno:Integer);
    function GetPDFPath: string;
  public
    iCodAluno: Integer;
    iCodCurso: String;
    // Esta flag sinaliza se houve alguma alteração, exclusão ou inclusão,
    // para quando alternar entre as abas atualizar a documentação
    FBAlterado: boolean;
    procedure carregaTipos();
    property DocsNecessarios: TIntegerArray read FADocsNecessarios write FADocsNecessarios;
    property PDFPath: string read GetPDFPath;
  end;
const
   RT_DIREITA: integer = -90;
   RT_ESQUERDA: integer = 90;

var
  FDigDocumentos: TFDigDocumentos;
  Imagem: TJPEGImage;
  Origem: smallint;
  aTipos: array of integer;

implementation

uses uDM, StrUtils, uExibeImagem, uUsuario;

{$R *.dfm}


procedure TFDigDocumentos.btnAdicionarClick(Sender: TObject);
var
   Bookmark: TBookmark;
   img: TJPEGImage;
   img2: TBitmap;
   Stream : TStream;
   FileExt: String;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npIncluir, True ) then
   begin
      Mensagem('Você não tem a permissão necessária para efetuar essa operação.', '', MB_ICONWARNING + MB_OK);
      exit;
   end;


   FileExt := ExtractFileExt(AbrirImagem.FileName);
   FileExt := AnsiUpperCase(FileExt);

   if cbTipos.ItemIndex = -1 then begin
      Mensagem('Nenhum tipo de documento selecionado!', '', MB_ICONWARNING + MB_OK);
      exit;
   end;

   if (FileExt = '.JPEG') or (FileExt = '.JPG') or (Trim(FileExt) = '') then
   Begin
      if imDocs.GetRegion() = nil then begin
         Mensagem('Nenhuma imagem carregada', '', MB_ICONWARNING + MB_OK);
         Exit;
      end;

      img := TJPEGImage.Create();
      try
         img2 := imDocs.GetRegion();
         try
            img.Assign(img2);

            ResizeFoto(
               img,
               qyDocumentos.FieldByName('nr_largura').AsInteger,
               qyDocumentos.FieldByName('nr_altura').AsInteger
            );

            if Imagem <> nil then begin
               FreeAndNil(Imagem);
            end;
            Imagem := TJPEGImage.Create();

            //Joga na imagem que será salva no banco
            Imagem.Assign(img);
            SalvaNoBancoDados(FileExt);
            {
            if (pcDocumentos.TabIndex = 0) and qyDocsAluno.FieldByName('cd_documento').IsNull then
            begin
               Bookmark := qyDocsAluno.GetBookmark;
               //qyDocsAluno.Refresh;
               qyDocsAluno.GotoBookmark(Bookmark);
            end;
            }
         finally
            FreeAndNil(img2);
         end;
      finally
         FreeAndNil(img);
      end;
      Self.FBAlterado := true;
   end else
   if (FileExt = '.PDF') then
   begin
      SalvaNoBancoDados(FileExt);
   end;

end;

function TFDigDocumentos.Rotacionar(Bitmap: TBitmap; const Angulo: Extended;
   bgColor: TColor): TBitmap;
 type
   PRGBQuadArray = ^TRGBQuadArray;
   TRGBQuadArray = array[0..0] of TRGBQuad;
 var
   bgRGB: TRGBQuad;
   BitmapInfo: TBitmapInfo;
   CosTheta: Extended;
   DC: HDC;
   dstBMP: HBITMAP;
   dstHeight: Integer;
   dstRGB: PRGBQuad;
   dstRGBs: PRGBQuadArray;
   dstWidth: Integer;
   iCosTheta: Integer;
   iSinTheta: Integer;
   NormalAngle: Extended;
   SinTheta: Extended;
   srcBMP: HBITMAP;
   srcHeight: Integer;
   srcRGBs: PRGBQuadArray;
   srcWidth: Integer;
   xDst: Integer;
   xODst: Integer;
   xOSrc: Integer;
   xPrime: Integer;
   xSrc: Integer;
   yDst: Integer;
   yODst: Integer;
   yOSrc: Integer;
   yPrime: Integer;
   yPrimeCosTheta: Integer;
   yPrimeSinTheta: Integer;
   ySrc: Integer;
 begin
   // Convertendo o background da imagem em formato RGB:
   bgColor := ColorToRGB(bgColor);
   with bgRGB do
   begin
     rgbRed := Byte(bgColor);
     rgbGreen := Byte(bgColor shr 8);
     rgbBlue := Byte(bgColor shr 16);
     rgbReserved := Byte(bgColor shr 24);
   end;
  
   // Calculando o Sen e Cos do ângulo de rotação:
   NormalAngle := Frac(Angulo / 360.0) * 360.0;
   SinCos(Pi * -NormalAngle / 180, SinTheta, CosTheta);
   iSinTheta := Trunc(SinTheta * (1 shl 16));
   iCosTheta := Trunc(CosTheta * (1 shl 16));
  
   // Ajustando o bitmap de origem:
   srcBMP := Bitmap.Handle;
   srcWidth := Bitmap.Width;
   srcHeight := Bitmap.Height;
   xOSrc := srcWidth shr 1;
   yOSrc := srcHeight shr 1;
  
   // Preparando a imagem de destino:
   dstWidth := SmallInt((srcWidth * Abs(iCosTheta) +
     srcHeight * Abs(iSinTheta)) shr 16);
   dstHeight := SmallInt((srcWidth * Abs(iSinTheta) +
     srcHeight * Abs(iCosTheta)) shr 16);
   xODst := dstWidth shr 1;
   if not Odd(dstWidth) and
     ((NormalAngle = 0.0) or (NormalAngle = -90.0)) then
     Dec(xODst);
   yODst := dstHeight shr 1;
   if not Odd(dstHeight) and
     ((NormalAngle = 0.0) or (NormalAngle = +90.0)) then
     Dec(yODst);
  
   // Inicializa o header do bitmap:
   FillChar(BitmapInfo, SizeOf(BitmapInfo), 0);
   with BitmapInfo.bmiHeader do
   begin
     biSize := SizeOf(BitmapInfo.bmiHeader);
     biCompression := BI_RGB;
     biBitCount := 32;
     biPlanes := 1;
   end;
  
   // Lendo bits RGB do bitmap de origem e destino:
   DC := CreateCompatibleDC(0);
   try
     BitmapInfo.bmiHeader.biWidth := srcWidth;
     BitmapInfo.bmiHeader.biHeight := srcHeight;
     GetMem(srcRGBs, srcWidth * srcHeight * SizeOf(TRGBQuad));
     GdiFlush;
     GetDIBits(DC, srcBMP, 0, srcHeight, srcRGBS, BitmapInfo,
       DIB_RGB_COLORS);
     BitmapInfo.bmiHeader.biWidth := dstWidth;
     BitmapInfo.bmiHeader.biHeight := dstHeight;
     dstBMP := CreateDIBSection(DC, BitmapInfo, DIB_RGB_COLORS,
       Pointer(dstRGBs), 0, 0);
   finally
     DeleteDC(DC);
   end;
  
   // Rotacionando:
   dstRGB := @dstRGBs[(dstWidth * dstHeight) - 1];
   yPrime := yODst;
   for yDst := dstHeight - 1 downto 0 do
   begin
     yPrimeSinTheta := yPrime * iSinTheta;
     yPrimeCosTheta := yPrime * iCosTheta;
     xPrime := xODst;
     for xDst := dstWidth - 1 downto 0 do
     begin
       xSrc := SmallInt((xPrime * iCosTheta - yPrimeSinTheta)
         shr 16) + xOSrc;
       ySrc := SmallInt((xPrime * iSinTheta + yPrimeCosTheta)
         shr 16) + yOSrc;
       if (DWORD(ySrc) < DWORD(srcHeight)) and
         (DWORD(xSrc) < DWORD(srcWidth)) then
         dstRGB^ := srcRGBs[ySrc * srcWidth + xSrc]
       else
         dstRGB^ := bgRGB;
       Dec(dstRGB);
       Dec(xPrime);
     end;
     Dec(yPrime);
   end;
   FreeMem(srcRGBs);

   // Resultado:
   Result := TBitmap.Create;
   Result.Handle := dstBMP;
 end;

procedure TFDigDocumentos.SalvaNoBancoDados( extensao : String );
const
   sql_busca_siga = 'SELECT apresentou FROM documentos_alunos WHERE codigoaluno = :codigoaluno AND cod_documento = :cod_documento';
var
   StringStream: TStringStream;
   cd_documento_aluno : Integer;
   qyInclusaoDocumento, qyInclusaoExtArquivo,qryDoc : TUMZQuery;
   gerarSiga : boolean;
   incluindoDocumento : Boolean;
   codDoc: Integer;
begin
   DM.CriarConsultaDOCs(qyInclusaoDocumento);
   DM.CriarConsultaDOCs(qyInclusaoExtArquivo);

   qyInclusaoDocumento.Close();
   qyInclusaoExtArquivo.Close();

   with qyInclusaoDocumento.SQL do
   begin
      Clear();
      Add('SELECT');
      Add('   cd_documento_aluno ');
      Add('FROM');
      Add('    documentos_alunos');
      Add('WHERE');
      Add('    cd_pessoa = :cdpessoa');
      Add('AND');
      Add('    cd_documento = :cddocumento');
      Add('AND');
      Add('    cd_tipo = :cdtipo');
   end;

   if Self.pcDocumentos.ActivePage = tsDocsAlunos then
   begin
      codDoc := Self.qyDocsAluno.FieldByName('codigo').AsInteger;
   end else begin
      codDoc := qyDocumentos.FieldByName('codigo').AsInteger;
   end;

   qyInclusaoDocumento.Params.ParamByName('cddocumento').Value := codDoc;
   qyInclusaoDocumento.Params.ParamByName('cdpessoa').Value := iCodAluno;
   qyInclusaoDocumento.Params.ParamByName('cdtipo').Value := aTipos[cbTipos.ItemIndex];
   qyInclusaoDocumento.Open();

   incluindoDocumento := qyInclusaoDocumento.IsEmpty;

   if incluindoDocumento then
   begin
      qyInclusaoDocumento.Close();
      qyInclusaoExtArquivo.Close();
      
      qyInclusaoDocumento.SQL.Text := ''
      + ' INSERT INTO '
      + ' documentos_alunos '
      + ' ( cd_pessoa, cd_documento, cd_tipo, im_documento ) '
      + ' VALUES '
      + ' ( :cd_pessoa, :cd_documento, :cd_tipo, :im_documento )';

      qyInclusaoExtArquivo.SQL.Text := ''
       + ' INSERT INTO documentos_alunos_ext ( '
       + '     cd_documento_aluno_ext, '
   	 + '     cd_documento_aluno, '
       + '     ds_extensao '
       + '  ) '
       + '  VALUES ( '
       + '     NULL, '
       + '     LAST_INSERT_ID(), '
       + '     :ds_extensao '
       + '  ) ';

      if Self.pcDocumentos.ActivePage = tsDocsAlunos then
      begin
         codDoc := Self.qyDocsAluno.FieldByName('codigo').AsInteger;
      end else begin
         codDoc := qyDocumentos.FieldByName('codigo').AsInteger;
      end;

      qyInclusaoDocumento.ParamByName('cd_pessoa').AsInteger := iCodAluno;
      qyInclusaoDocumento.ParamByName('cd_documento').AsInteger := codDoc;
      qyInclusaoDocumento.ParamByName('cd_tipo').AsInteger := aTipos[cbTipos.ItemIndex];
   end
   else
   begin
      cd_documento_aluno := qyInclusaoDocumento.FieldByName('cd_documento_aluno').AsInteger;

      qyInclusaoDocumento.Close();
      qyInclusaoExtArquivo.Close();
      qyInclusaoDocumento.SQL.Text := ''
      + ' UPDATE '
      + ' documentos_alunos '
      + ' SET '
      + ' im_documento = :im_documento '
      + ' WHERE cd_documento_aluno = :cd_documento_aluno';

     qyInclusaoExtArquivo.SQL.Text := ''
     + ' UPDATE documentos_alunos_ext '
     + ' SET '
     + ' ds_extensao = :ds_extensao '
     + ' WHERE cd_documento_aluno = :cd_documento_aluno';

     qyInclusaoDocumento.ParamByName('cd_documento_aluno').AsInteger := cd_documento_aluno;
     qyInclusaoExtArquivo.ParamByName('cd_documento_aluno').AsInteger := cd_documento_aluno;
   end;

   if(incluindoDocumento) then
   begin
     dm.CriarConsulta(qryDoc);
     //Verifica se ja existe ou se estava como não marcado
     qryDoc.SQL.Clear;
     qryDoc.SQL.Add(sql_busca_siga);
     qryDoc.ParamByName('codigoaluno').Value := iCodAluno;
     qryDoc.ParamByName('cod_documento').Value := codDoc;
     qryDoc.Open;
     gerarSiga := (qryDoc.IsEmpty) OR (qryDoc.FieldByName('apresentou').AsString = 'N');
     qryDoc.Close;
   end;
   
   if pgcOpcoes.ActivePageIndex = 0 then
   begin
      if not (Imagem.Empty) then
      begin
         try
            StringStream := TStringStream.Create('');
            Imagem.SaveToStream(StringStream);

            qyInclusaoDocumento.ParamByName('im_documento').AsString := StringStream.DataString;
            qyInclusaoExtArquivo.ParamByName('ds_extensao').AsString := extensao;

            qyInclusaoDocumento.ExecSQL();
            qyInclusaoExtArquivo.ExecSQL();
            qyInclusaoDocumento.Close();
            qyInclusaoExtArquivo.Close();

            atualizarDocumentacao();
            carregaDocumentos;
         except
           on E:Exception do
         end;
      end;
   end;

   if pgcOpcoes.ActivePageIndex = 1 then
   begin
      qyInclusaoDocumento.ParamByName('im_documento').LoadFromFile(PDFPath, ftBlob);
      qyInclusaoExtArquivo.ParamByName('ds_extensao').AsString := extensao;

      qyInclusaoDocumento.ExecSQL();
      qyInclusaoExtArquivo.ExecSQL();
      qyInclusaoDocumento.Close();
      qyInclusaoExtArquivo.Close();
      
      atualizarDocumentacao();
      carregaDocumentos;
   end;

   
   //Se não existe ou se não tava marcado ve se deve gerar registro do SIGA
   if (incluindoDocumento and gerarSiga) then
   begin
      atualizaTabelaSiga(codDoc,iCodAluno);
   end;
end;



procedure TFDigDocumentos.sbPDFClick(Sender: TObject);
var
   SEInfo: TShellExecuteInfo;
begin
   ZeroMemory(@SEInfo, SizeOf(SEInfo));

   with SEInfo do
   begin
      cbSize := SizeOf(SEInfo);
      fMask := SEE_MASK_NOCLOSEPROCESS;
      lpVerb := PChar('open');
      lpFile := PChar(PDFPath);
      nShow := SW_SHOWNORMAL;
   end;

   ShellExecuteEx(@SEInfo);
end;

procedure TFDigDocumentos.SincronizaDocumentos;
begin
   qyDocsDocs.Open;
   qyDocsUnimestre.Open;
   while not qyDocsUnimestre.Eof do
   begin
      if not qyDocsDocs.Locate('codigo', qyDocsUnimestre.FieldByName('codigo').AsInteger, []) then
      begin
         qySincronizaDocs.ParamByName('codigo').AsInteger := qyDocsUnimestre.FieldByName('codigo').AsInteger;
         qySincronizaDocs.ParamByName('documento').AsString := qyDocsUnimestre.FieldByName('documento').AsString;
         qySincronizaDocs.ParamByName('prazo').AsString := qyDocsUnimestre.FieldByName('prazo').AsString;
         qySincronizaDocs.ParamByName('sigla').AsString := qyDocsUnimestre.FieldByName('sigla').AsString;
         qySincronizaDocs.ParamByName('ordem').AsInteger := qyDocsUnimestre.FieldByName('ordem').AsInteger;
         qySincronizaDocs.ParamByName('ds_sexo').AsString := qyDocsUnimestre.FieldByName('ds_sexo').AsString;
         qySincronizaDocs.ParamByName('sn_digitaliza').AsString := qyDocsUnimestre.FieldByName('sn_digitaliza').AsString;
         qySincronizaDocs.ParamByName('nr_dpi').AsInteger := qyDocsUnimestre.FieldByName('nr_dpi').AsInteger;
         qySincronizaDocs.ParamByName('nr_largura').AsInteger := qyDocsUnimestre.FieldByName('nr_largura').AsInteger;
         qySincronizaDocs.ParamByName('nr_altura').AsInteger := qyDocsUnimestre.FieldByName('nr_altura').AsInteger;
         qySincronizaDocs.ExecSQL;
      end;
      qyDocsUnimestre.Next;
   end;
   qyDocsUnimestre.Close;
   qyDocsDocs.Close;
end;

procedure TFDigDocumentos.atualizarDocumentacao();
var
   qyDoc, qyDocAcoes: TUMZQuery;
   sApresentou: String;
begin
   DM.CriarConsultaDOCs(qyDocAcoes);

   qyDocAcoes.Close();

   with qyDocAcoes.SQL do
   begin
      Clear();
      Add('SELECT');
      Add('   COUNT(*) as conta ');
      Add('FROM');
      Add('    documentos_alunos');
      Add('WHERE');
      Add('    cd_pessoa = :cdpessoa');
      Add('AND');
      Add('    cd_documento = :cddocumento');
   end;
   //qyDocAcoes.RequestLive := True;
   if Self.pcDocumentos.ActivePage = tsDocsAlunos then
      qyDocAcoes.Params.ParamByName('cddocumento').Value := Self.qyDocsAluno.FieldByName('codigo').AsInteger
   else
      qyDocAcoes.Params.ParamByName('cddocumento').Value := qyDocumentos.FieldByName('codigo').AsInteger;
   qyDocAcoes.ParamByName('cdpessoa').Value := iCodAluno;
   qyDocAcoes.Open();

   sApresentou:='N';
   if qyDocAcoes.FieldByName('conta').AsInteger > 0 then
      sApresentou:='S';


   dM.CriarConsulta(qyDoc);
   try
      qyDoc.Close();
      // qyDoc.RequestLive := True;
      qyDoc.SQL.Clear();
      qyDoc.SQL.Add('UPDATE ');
      qyDoc.SQL.Add('   documentos_alunos ');
      qyDoc.SQL.Add('SET ');
      qyDoc.SQL.Add('   apresentou=:apresentou, ');
      if qyDocAcoes.FieldByName('conta').AsInteger > 0 then
         qyDoc.SQL.Add('   dt_entrega = now() ')
      else
         qyDoc.SQL.Add('   dt_entrega = NULL ');
      qyDoc.SQL.Add('WHERE ');
      qyDoc.SQL.Add('    codigoaluno = :cdpessoa');
      qyDoc.SQL.Add('AND');
      qyDoc.SQL.Add('    cod_documento = :cddocumento');
      if Self.pcDocumentos.ActivePage = tsDocsAlunos then
         qyDoc.ParamByName('cddocumento').Value := Self.qyDocsAluno.FieldByName('codigo').AsInteger
      else
         qyDoc.ParamByName('cddocumento').Value := qyDocumentos.FieldByName('codigo').AsInteger;
      qyDoc.ParamByName('cdpessoa').Value := iCodAluno;
      qyDoc.ParamByName('apresentou').AsString := sApresentou;
      qyDoc.ExecSQL;
   finally
      FreeAndNil(qyDoc);
   end;
end;

procedure TFDigDocumentos.atualizaTabelaSiga(codDoc,codigoAluno:Integer);
const
   sql_gera_siga = 'select cd_siga from documentos where codigo = :coddoc';
   sql_ja_gerou_siga = 'select cd_siga from siga_documentos where cd_curso = :curso AND cd_uni_documento = :coddoc and cd_pessoa_doc = :codigoaluno ';
var
   qryDoc : TUMZQuery;
   qyDocumentos: TUMZQuery;
   cd_coligada, nr_codigo_siga_maior, nr_codigo_siga_atual, cd_local, cd_siga: Integer;
   me_observacao, ds_codigo_siga: String;
begin
  dm.CriarConsulta(qryDoc);

  qryDoc.SQL.Clear;
  qryDoc.SQL.Add(sql_ja_gerou_siga);
  qryDoc.ParamByName('coddoc').Value := codDoc;
  qryDoc.ParamByName('curso').Value := iCodCurso;
  qryDoc.ParamByName('codigoaluno').Value := codigoAluno;
  qryDoc.Open;

  //Nesse caso já tem um registro da tabela siga atrelado a esse aluno/documento/curso
  if(not qryDoc.IsEmpty) then
  begin
     qryDoc.Close;
     exit;
  end;

  qryDoc.Close;
  qryDoc.SQL.Clear;
  qryDoc.SQL.Add(sql_gera_siga);
  qryDoc.ParamByName('coddoc').Value := codDoc;
  qryDoc.Open;

  {Se possui um cd_siga informado na tabela de documentos para o documento
  atual, será inserido um registro em siga_documentos para o módulo de
  controle de documentos}
  if (not qryDoc.IsEmpty) AND (not qryDoc.FieldByName('cd_siga').IsNull) then
  begin
      dm.CriarConsulta(qyDocumentos);

      {INICIO - BUSCA INFORMAÇÕES DE SIGA_TABELA}
      qyDocumentos.SQL.Text := ''+
      'SELECT '+
      '   doc.cd_siga AS cd_siga, '+
      '   st.cd_local AS cd_local, '+
      '   st.ds_codigo_siga AS ds_codigo_siga,  ' +
      '   st.me_observacao as me_observacao ' +
      ' FROM '+
      '    documentos doc '+
      ' INNER JOIN siga_tabela st ON (st.cd_siga = doc.cd_siga) '+
      ' WHERE '+
      '    codigo = :codigo ';
   
      qyDocumentos.ParamByName('codigo').asInteger := (codDoc);
      qyDocumentos.Open;

      cd_siga := qyDocumentos.FieldByName('cd_siga').asInteger;
      cd_local := qyDocumentos.FieldByName('cd_local').asInteger;
      ds_codigo_siga := qyDocumentos.FieldByName('ds_codigo_siga').asString;
      me_observacao := qyDocumentos.FieldByName('me_observacao').asString;

      {FIM - BUSCA INFORMAÇÕES DE SIGA_TABELA}

      {INICIO - BUSCA PELO ATUAL NR_CODIGO_SIGA}

      qyDocumentos.SQL.Text := ''+
      ' SELECT                                   '+
      '    max(nr_codigo_siga) as nr_codigo_siga '+
      ' FROM                                     '+
      '    siga_documentos                       '+
      ' WHERE                                    '+
      '    cd_siga = :cd_siga                    ';

      qyDocumentos.ParamByName('cd_siga').asInteger := cd_siga;
      qyDocumentos.Open;

      nr_codigo_siga_atual := qyDocumentos.FieldByName('nr_codigo_siga').asInteger + 1;
   
      {FIM - BUSCA PELO ATUAL NR_CODIGO_SIGA}

      {INCIO - BUSCA CÓDIGO DA COLIGADA DO CURSO}

      qyDocumentos.SQL.Text := ' '+
      ' SELECT                   '+
      '     cd_coligada          '+
      ' FROM                     '+
      '     cursos_coligadas     '+
      ' WHERE                    '+
      '     cd_curso = :cd_curso ';

      qyDocumentos.ParamByName('cd_curso').AsString := iCodCurso;
      qyDocumentos.Open;

      cd_coligada := qyDocumentos.FieldByName('cd_coligada').AsInteger;

      {FIM - BUSCA CÓDIGO DA COLIGADA DO CURSO}

      {INCIO - INSERE REGISTRO EM SIGA_DOCUMENTOS}
      qyDocumentos.SQL.Text := '     ' +
      'INSERT INTO siga_documentos ( ' +
      '    cd_documento,             ' +
      '    cd_uni_documento,         ' +
      '    cd_local,                 ' +
      '    cd_curso,                 ' +
      '    cd_siga,                  ' +
      '    cd_pessoa_cadastro,       ' +
      '    cd_pessoa_doc ,           ' +
      '    cd_pessoa_resp,           ' +
      '    cd_coligada,              ' +
      '    nr_codigo_siga,           ' + 
      '    ds_codigo_siga,           ' +
      '    me_descricao,             ' +
      '    dt_cadastro,              ' +
      '    cd_origem_documento       ' +
      ' )                            ' +
      ' VALUES                       ' +
      ' (                            ' +
      '    null,                     ' +
      '    :cd_documento ,           ' +
      '    :cd_local ,               ' +
      '    :cd_curso ,               ' +
      '    :cd_siga ,                ' +
      '    :cd_pessoa_cadastro ,     ' +
      '    :cd_pessoa_doc ,          ' +
      '    :cd_pessoa_resp ,         ' +
      '    :cd_coligada ,            ' +
      '    :nr_codigo_siga ,         ' +
      '    :ds_codigo_siga ,         ' +
      '    :me_descricao ,           ' +
      '    :dt_cadastro,             ' +
      '    2                         ' +
      ' );                           ' ;

      qyDocumentos.ParamByName('cd_documento').asInteger := (codDoc);

      {Caso o registro siga do documento não possua um cd_local informado será
      informado nulo no campo, caso contrário será informado o cd_local normalmente}
      if cd_local <> 0 then
      begin
         qyDocumentos.ParamByName('cd_local').asInteger := cd_local;
      end
      else
      begin
         qyDocumentos.ParamByName('cd_local').Clear;
      end;

      qyDocumentos.ParamByName('cd_curso').asString := iCodCurso;
      qyDocumentos.ParamByName('cd_siga').asInteger := cd_siga;
      qyDocumentos.ParamByName('cd_pessoa_cadastro').asInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
      qyDocumentos.ParamByName('cd_pessoa_doc').asInteger := codigoAluno;
      qyDocumentos.ParamByName('cd_pessoa_resp').asInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
      qyDocumentos.ParamByName('cd_coligada').asInteger := cd_coligada;
      qyDocumentos.ParamByName('nr_codigo_siga').asInteger := nr_codigo_siga_atual;
      qyDocumentos.ParamByName('ds_codigo_siga').asString := ds_codigo_siga + '.' + IntToStr(nr_codigo_siga_atual);
      qyDocumentos.ParamByName('me_descricao').asString := me_observacao;
      qyDocumentos.ParamByName('dt_cadastro').asString :=   FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);

      qyDocumentos.ExecSQL;
      {FIM - INSERE REGISTRO EM SIGA_DOCUMENTOS}
  end;

  qryDoc.Close;
end;

procedure TFDigDocumentos.carregaDocumentos;
const
   BASE = 150;
var
   b: TStream;
   m: TMemoryStream;
   img: TBitmap;
   img2: TJPEGImage;
   itemAux: TListItem;
   itemIndex: Integer;
begin
   // busca os documentos

   btnAbrirPDF.Enabled := False;

   qyDocumentosAlunos.Close();

   if Self.pcDocumentos.ActivePage = tsDocsAlunos then
   begin
      Self.qyDocumentosAlunos.ParamByName('documento').AsInteger := Self.qyDocsAluno.FieldByName('codigo').AsInteger;
   end
   else
   begin
      qyDocumentosAlunos.ParamByName('documento').AsInteger := qyDocumentos.FieldByName('codigo').AsInteger;
   end;

   qyDocumentosAlunos.ParamByName('pessoa').AsInteger := iCodAluno;
   qyDocumentosAlunos.Open();

   // limpa as listas
   lvwDocumentos.Clear();
   ilDocumentos.Clear();
   itemIndex:=0;

   // Para cada imagem referente ao documento atual
   while not qyDocumentosAlunos.Eof do
   begin
      // Verifica se imagem não é nula
      if (LeftStr(qyDocumentosAlunos.FieldByName('im_documento').AsString, 4) = 'ÿØÿà' ) then
      begin
         // Cria os buffers, blobs e imagens
         m := TMemoryStream.Create();
         img := TBitmap.Create();

         img2 := TJPEGImage.Create();
         b := qyDocumentosAlunos.CreateBlobStream(qyDocumentosAlunos.FieldByName('im_documento'), bmRead);
         img2.Assign(qyDocumentosAlunos.FieldByName('im_documento'));

            try
               m.LoadFromStream(b);
               if b.Size > 0 then begin

                  ResizeFoto(img2, BASE, BASE);

                  // Define que o tamanho das imagens no ListView será o tamanho base
                  lvwDocumentos.LargeImages.Width:= BASE;
                  lvwDocumentos.LargeImages.Height:= BASE;

                  // Transforma de JPEG p/ bmp e redimenciona
                  img.Assign(img2);
                  img.Width:= BASE;
                  img.Height:= BASE;

                  //Adiciona no ImageList
                  ilDocumentos.Add(img,nil);

                  //Adiciona no listView
                  itemAux := lvwDocumentos.Items.Add;
                  itemAux.Caption := DM.getSituacao(qyDocumentosAlunos.FieldByName('cd_tipo').AsInteger, 1020);
                  itemAux.ImageIndex := itemIndex;
                  itemAux.Indent:= qyDocumentosAlunos.FieldByName('cd_tipo').AsInteger;

               end;
            finally
               // Libera a memória
               FreeAndNil(m);
               FreeAndNil(b);
               FreeAndNil(img);
               FreeAndNil(img2);
            end;
         end else
         if ( LeftStr(qyDocumentosAlunos.FieldByName('im_documento').AsString, 4) = '%PDF' ) then
         begin

            btnAbrirPDF.Enabled := True;
            // Cria os buffers, blobs e imagens
            m := TMemoryStream.Create();
            img := TBitmap.Create();

            img2 := TJPEGImage.Create();
            b := qyDocumentosAlunos.CreateBlobStream(qyDocumentosAlunos.FieldByName('im_documento'), bmRead);
            img2.Assign(imgPDF.Picture.Bitmap);
            try
               m.LoadFromStream(b);
               if b.Size > 0 then begin

                  ResizeFoto(img2, BASE, BASE);

                  // Define que o tamanho das imagens no ListView será o tamanho base
                  lvwDocumentos.LargeImages.Width:= BASE;
                  lvwDocumentos.LargeImages.Height:= BASE;

                  // Transforma de JPEG p/ bmp e redimenciona
                  img.Assign(img2);
                  img.Width:= BASE;
                  img.Height:= BASE;

                  //Adiciona no ImageList
                  ilDocumentos.Add(img,nil);

                  //Adiciona no listView
                  itemAux := lvwDocumentos.Items.Add;
                  itemAux.Caption := DM.getSituacao(qyDocumentosAlunos.FieldByName('cd_tipo').AsInteger, 1020);
                  itemAux.ImageIndex := itemIndex;
                  itemAux.Indent:= qyDocumentosAlunos.FieldByName('cd_tipo').AsInteger;

               end;
            finally
               // Libera a memória
               FreeAndNil(m);
               FreeAndNil(b);
               FreeAndNil(img);
               FreeAndNil(img2);
            end;
         end;
         Inc(itemIndex);
         qyDocumentosAlunos.next();
      end;
end;

procedure TFDigDocumentos.ResizeFoto(var oJPG: TJPEGImage; iMaxWidth, iMaxHeigth: Integer);
var
  oBmp: TBitmap;
  iW, iH: Integer;
  lP: Double;
begin
   try
     oBmp := TBitmap.Create();
     if ((oJPG.Width > iMaxWidth) or (oJPG.Height > iMaxHeigth)) then
     begin
       lP := (oJPG.Height / oJPG.Width);
       iW := iMaxWidth;
       iH := oJPG.Height - Round((oJPG.Width - iMaxWidth) * lP);
       if (iH > iMaxHeigth) then
       begin
         lP := (iH / iW);
         iW := Round(iW /lP);
         iH := iMaxHeigth;
       end;
       oBmp.Width := iW;
       oBmp.Height := iH;
       oBmp.Canvas.StretchDraw(Rect(0,0, oBmp.Width, oBmp.Height), oJPG);
       oJPG.Assign(oBmp);
       oJPG.CompressionQuality := 80;
       oJPG.Compress();
     end
     else begin
         oBmp.Assign(oJPG);
         oJPG.Assign(oBmp);
         oJPG.CompressionQuality := 80;
         oJPG.Compress();
     end;
   finally
      FreeAndNil(oBmp);
   end;
end;

procedure TFDigDocumentos.carregaTipos;
var
   iCont: integer;
   qyTiposDocs : TUMZQuery;
begin
   cbTipos.Items.Clear();

   Dm.CriarConsulta(qyTiposDocs);
   try
      qyTiposDocs.Close();
      qyTiposDocs.SQL.text:= 'SELECT cd_modulo,cd_situacao, ds_valor FROM  situacoes WHERE cd_modulo = 1020';
      qyTiposDocs.Open();

      if qyTiposDocs.RecordCount < 0 then
         exit;

      SetLength(aTipos, qyTiposDocs.RecordCount);
      iCont:=0;
      cbTipos.Items.Clear();
      while not qyTiposDocs.eof do begin
         cbTipos.Items.Add(qyTiposDocs.FieldByName('ds_valor').AsString);
         aTipos[iCont]:= qyTiposDocs.FieldByName('cd_situacao').AsInteger;
         Inc(iCont);
         qyTiposDocs.Next();
      end;
   finally
      FreeAndNil(qyTiposDocs);
   end;
end;

procedure TFDigDocumentos.DelphiTwain1AcquireCancel(Sender: TObject;
  const Index: Integer);
begin
   if DM.GetUnimestreINI.ReadString('Digitalizacao', 'ForcarFechamento', 'N') = 'S' then begin
      DelphiTwain1.Source[Origem].Enabled := False;
      DelphiTwain1.Source[Origem].Loaded := False;
   end;
end;

procedure TFDigDocumentos.DelphiTwain1AcquireError(Sender: TObject;
  const Index: Integer; ErrorCode, Additional: Integer);
begin
   Mensagem('Ocorreu um erro na transferência!!' + IntTostr(errorCode) + ' (' + IntToStr(Additional) + ')');
   if (Imagem <> nil) then begin
      FreeAndNil(Imagem);
   end;
end;

procedure TFDigDocumentos.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
   if Imagem = nil then
   begin
      Imagem := TJPEGImage.Create();
   end;

   Imagem.Assign(Image);
   ResizeFoto(Imagem, qyDocumentosnr_largura.AsInteger , qyDocumentosnr_altura.AsInteger);

   imDocs.Picture.Assign(Imagem);

   FreeAndNil(Imagem);

   // Alguns softwares de dispositivos de imagem necessitam disso
   if DM.GetUnimestreINI.ReadString('Digitalizacao', 'ForcarFechamento', 'N') = 'S' then begin
      DelphiTwain1.Source[Origem].Enabled := False;
      DelphiTwain1.Source[Origem].Loaded := False;
   end;

   Cancel := True;  
end;

procedure TFDigDocumentos.dgDocsAlunoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if qyDocsAluno.FieldByName('cd_documento').IsNull then
   begin
      dgDocsAluno.Canvas.Brush.Color := clRed;
   end;
   dgDocsAluno.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TFDigDocumentos.dsDocsAlunoDataChange(Sender: TObject; Field: TField);
begin
   Self.carregaDocumentos;
end;

procedure TFDigDocumentos.dsDocumentosDataChange(Sender: TObject;
  Field: TField);
begin
   carregaDocumentos;
end;

procedure TFDigDocumentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DelphiTwain1.UnloadLibrary();
   Action := caFree;
end;

procedure TFDigDocumentos.FormCreate(Sender: TObject);
const
   SMsgSemConexao =
      'Não foi possivel estabelecer conexão com a base de documentos do UNIMESTRE.';
begin
   if not DM.ConectaUnimestreDocs then
   begin
      Mensagem(SMsgSemConexao, 'Erro', MB_ICONERROR + MB_OK, Handle);
      Abort;
   end;
end;

procedure TFDigDocumentos.FormDestroy(Sender: TObject);
begin
   FDigDocumentos := nil;
end;

procedure TFDigDocumentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

procedure TFDigDocumentos.FormShow(Sender: TObject);
var
   LSCodigos: string;
   I: integer;
begin
   pgcOpcoes.ActivePageIndex := 0;
   Self.SincronizaDocumentos;
   LSCodigos := '';
   for I := Low(Self.FADocsNecessarios) to High(Self.FADocsNecessarios) do
   begin
      if LSCodigos <> '' then
         LSCodigos := LSCodigos + ',';
      LSCodigos := LSCodigos + Format('%d', [Self.FADocsNecessarios[I]]);
   end;
   if Length(FADocsNecessarios) > 0 then
      Self.qyDocsAluno.SQL.Text := Format(qyDocsAluno.SQL.Text, [LSCodigos])
   else
      Self.qyDocsAluno.SQL.Text := Format(qyDocsAluno.SQL.Text, ['0']);
   Self.qyDocsAluno.ParamByName('cd_pessoa').AsInteger := Self.iCodAluno;
   Self.qyDocsAluno.Open;
   qyDocumentos.Open();
   carregaTipos();
end;

procedure TFDigDocumentos.lvwDocumentosDblClick(Sender: TObject);
begin
   AbrirDocumento();
end;

procedure TFDigDocumentos.pcDocumentosChange(Sender: TObject);
begin
   if Self.FBAlterado then
   begin
      if Self.pcDocumentos.ActivePage = tsDocsAlunos then
      begin
         Self.qyDocsAluno.Close;
         Self.qyDocsAluno.Open;
         Self.qyDocsAluno.Locate('codigo', Self.qyDocumentos.FieldByName('codigo').AsInteger, []);
      end
      else
      begin
         Self.qyDocumentos.Close;
         Self.qyDocumentos.Open;
         Self.qyDocumentos.Locate('codigo', Self.qyDocsAluno.FieldByName('codigo').AsInteger, []);
      end;
      Self.FBAlterado := false;
   end
   else
   begin
      if Self.pcDocumentos.ActivePage = tsDocsAlunos then
      begin
         Self.dsDocsAlunoDataChange(nil, nil);
      end
      else
      begin
         Self.dsDocumentosDataChange(nil, nil);
      end;
   end;
end;

procedure TFDigDocumentos.VerificaBibliotecaTwain();
begin
   if not DelphiTwain1.LibraryLoaded then begin
      DelphiTwain1.LoadLibrary();
   end;
end;

procedure TFDigDocumentos.ExcluirDocumento();
var
   qyDoc, qyExcluirExtArquivo : TUMZQuery;
begin
   if lvwDocumentos.Selected = nil then begin
      exit;
   end;
   if MessageBox(Self.Handle, PChar('Deseja realmente excluir o documento selecionado?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = ID_YES then
   begin
      DM.CriarConsulta(qyDoc);
      DM.CriarConsulta(qyExcluirExtArquivo);
      try
         qyDoc.Connection := DM.dbDocs;
         qyExcluirExtArquivo.Connection := DM.dbDocs;
         try
            qyExcluirExtArquivo.SQL.Text := '' 
              + ' DELETE '
              + ' FROM '
              + '    documentos_alunos_ext '
              + ' WHERE '
              + '    cd_documento_aluno = '
              + ' ( '
              + '   SELECT '
              + '     da.cd_documento_aluno '
              + '   FROM '
              + '     documentos_alunos da '
              + '   WHERE '
              + '     da.cd_documento = :cd_documento '
              + '     AND da.cd_tipo = :cd_tipo '
              + '     AND da.cd_pessoa = :cd_pessoa '
              + ' ) ' ;

            qyDoc.SQL.Text :=
               'DELETE FROM '
               + ' documentos_alunos '
               + ' WHERE '
               + ' cd_documento = :cd_documento AND '
               + ' cd_pessoa = :cd_pessoa AND '
               + ' cd_tipo = :cd_tipo';

            if Self.pcDocumentos.ActivePage = tsDocsAlunos then
            begin
               qyDoc.ParamByName('cd_documento').AsInteger := Self.qyDocsAluno.FieldByName('codigo').AsInteger;
               qyExcluirExtArquivo.ParamByName('cd_documento').AsInteger := Self.qyDocsAluno.FieldByName('codigo').AsInteger;
            end
            else
            begin
               qyDoc.ParamByName('cd_documento').AsInteger := Self.qyDocumentos.FieldByName('codigo').AsInteger;
               qyExcluirExtArquivo.ParamByName('cd_documento').AsInteger := Self.qyDocsAluno.FieldByName('codigo').AsInteger;
            end;
            
            qyExcluirExtArquivo.ParamByName('cd_pessoa').AsInteger := Self.iCodAluno;
            qyExcluirExtArquivo.ParamByName('cd_tipo').AsInteger   := lvwDocumentos.Selected.Indent;

            qyDoc.ParamByName('cd_pessoa').AsInteger := Self.iCodAluno;
            qyDoc.ParamByName('cd_tipo').AsInteger   := lvwDocumentos.Selected.Indent;

            qyExcluirExtArquivo.ExecSQL();
            qyDoc.ExecSQL();
         except

         end;
      finally
         FreeAndNil(qyDoc);
         FreeAndNil(qyExcluirExtArquivo);
      end;
      Mensagem('Documento excluído com sucesso', '', MB_ICONINFORMATION + MB_OK);
      carregaDocumentos;
   end
   else
      MessageBox(Self.Handle, PChar('Operação de exclusão cancelada!'), 'Informação', MB_ICONINFORMATION);
end;

procedure TFDigDocumentos.AbrirDocumento();
var
   qyDoc : TUMZQuery;
   img2 : TJPEGImage;
   b: TStream;
begin
   Dm.CriarConsulta(qyDoc);
   try
      qyDoc.Connection := DM.dbDocs;
      // qyDoc.SessionName:='MaxiMestre';
      // qyDoc.DatabaseName:='UniDocs';
      try
         qyDoc.SQL.Text :=
            'SELECT im_documento FROM documentos_alunos WHERE cd_documento = :cd_documento AND cd_pessoa = :cd_pessoa AND cd_tipo = :cd_tipo';
         if Self.pcDocumentos.ActivePage = tsDocsAlunos then
            qyDoc.ParamByName('cd_documento').AsInteger := Self.qyDocsAluno.FieldByName('codigo').AsInteger
         else
            qyDoc.ParamByName('cd_documento').AsInteger := Self.qyDocumentoscodigo.AsInteger;
         qyDoc.ParamByName('cd_tipo').AsInteger := lvwDocumentos.Selected.Indent;
         qyDoc.ParamByName('cd_pessoa').AsInteger := Self.iCodAluno;
         qyDoc.Open();

         if (LeftStr(qyDoc.FieldByName('im_documento').AsString, 4) = 'ÿØÿà') then
         begin
            // Cria os buffers, blobs e imagens
            try
               img2 := TJPEGImage.Create();
               try
                  b := qyDoc.CreateBlobStream(qyDoc.FieldByName('im_documento'), bmRead);
                  try

                     if b.Size > 0 then
                        img2.Assign(qyDoc.FieldByName('im_documento'));

                     Application.CreateForm(TFExibeImagem, FExibeImagem);
                     fExibeImagem.ciDocumento.Picture.Assign(img2);
                     fExibeImagem.WindowState:= wsMaximized;
                     fExibeImagem.ShowModal();
                  finally
                     FreeAndNil(b);
                  end;
               finally
                  FreeAndNil(img2);
               end;
            finally
            end;
         end
         else
            Mensagem('Nenhuma imagem pode ser carregada', '', MB_ICONERROR + MB_OK);
      except

      end;
   finally
      FreeAndNil(qyDoc);
   end;
end;



procedure TFDigDocumentos.SpeedButton2Click(Sender: TObject);
var
   FileExt: string;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npIncluir, True ) then
   begin
      Mensagem('Você não tem a permissão necessária para efetuar essa operação.', '', MB_ICONWARNING + MB_OK);
      exit;
   end;

   pgcOpcoes.ActivePageIndex := 0;
   if AbrirImagem.Execute then
     begin
         FileExt := ExtractFileExt(AbrirImagem.FileName);
         FileExt := AnsiUpperCase(FileExt);

         if (FileExt = '.JPEG') or (FileExt = '.JPG') then
         Begin
            if Imagem <> nil then begin
               FreeAndNil(Imagem);
            end;
            try
            begin
               Imagem := TJPEGImage.Create();
               Imagem.LoadFromFile(AbrirImagem.FileName);
               ResizeFoto(
                  Imagem,
                  qyDocumentos.FieldByName('nr_largura').AsInteger,
                  qyDocumentos.FieldByName('nr_altura').AsInteger
               );

               imDocs.Picture.Assign(Imagem);
               FreeAndNil(Imagem);
            end;
            except
               mensagem('Extensão da imagem selecionada não é suportada pelo sistema, por favor utilize imagens da extensão .JPEG', 'Atenção!');
            end;
         end
         else if FileExt = '.PDF' then
         begin
            FPDFPath := AbrirImagem.FileName;
            pgcOpcoes.ActivePageIndex := 1;
         end;
     end;
end;

procedure TFDigDocumentos.btnDigitalizarClick(Sender: TObject);
var
  SourceIndex: smallint;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npIncluir, True ) then
   begin
      Mensagem('Você não tem a permissão necessária para efetuar essa operação.', '', MB_ICONWARNING + MB_OK);
      exit;
   end;
   
   if DelphiTwain1.SourceCount > 0 then
   begin
      SourceIndex := DelphiTwain1.SelectSource();
      Origem := SourceIndex;
   end
   else
   begin
      Mensagem('Nenhuma origem está instalada!', '', MB_OK + MB_ICONWARNING);
      Origem := -1;
   end;

  try
     if (Origem <> -1) then
     begin
        if Imagem <> nil then begin
           FreeAndNil(Imagem);
        end;

        Imagem := TJPEGImage.Create();
        VerificaBibliotecaTwain();
        //Now that we know the index of the source, we'll
        //get the object for this source
        with DelphiTwain1.Source[Origem] do begin

           //Load source and acquire image
           SetICapUnits(tuPixels);
           SetIXResolution(qyDocumentos.FieldByName('nr_largura').AsInteger);
           SetIYResolution(qyDocumentos.FieldByName('nr_altura').AsInteger);
           SetIPixelType(tbdRgb);

           Modal := true;
           Loaded := true;
           Enabled := true;
        end;
     end; {if (SourceIndex <> -1)}
  Except

  end;


end;

procedure TFDigDocumentos.tbVisualizarClick(Sender: TObject);
begin
   if TemItemSelecionado then
      AbrirDocumento()
   else
      Mensagem('Selecione uma imagem para efetuar essa operação.', '', MB_ICONERROR + MB_OK);
end;

function TFDigDocumentos.TemItemSelecionado: boolean;
begin
   Result := Self.lvwDocumentos.ItemIndex <> -1;
end;

procedure TFDigDocumentos.ToolButton1Click(Sender: TObject);
var
   indice: Integer;
begin
   if Self.TemItemSelecionado then
   begin
      indice:= lvwDocumentos.ItemIndex;
      aplicarRotacao(RT_ESQUERDA);
      lvwDocumentos.ItemIndex:=indice;
      Self.FBAlterado := true;
   end
   else
      Mensagem('Selecione uma imagem para efetuar essa operação.', '', MB_ICONERROR + MB_OK);
end;

procedure TFDigDocumentos.btnAbrirPDFClick(Sender: TObject);
var
   SEInfo: TShellExecuteInfo;
   arquivo : String;
   qyDoc : TUMZQuery;
begin

   Dm.CriarConsulta(qyDoc);
   try
      qyDoc.Connection := DM.dbDocs;

      try
         qyDoc.SQL.Text :=
            ' SELECT '
            +  ' im_documento '
            +  ' FROM documentos_alunos '
            +  ' WHERE cd_documento = :cd_documento AND '
            +   ' cd_pessoa = :cd_pessoa AND cd_tipo = :cd_tipo';
            
         if Self.pcDocumentos.ActivePage = tsDocsAlunos then
         begin
            qyDoc.ParamByName('cd_documento').AsInteger := Self.qyDocsAluno.FieldByName('codigo').AsInteger
         end
         else
         begin
            qyDoc.ParamByName('cd_documento').AsInteger := Self.qyDocumentoscodigo.AsInteger;
         end;
         
         qyDoc.ParamByName('cd_tipo').AsInteger := lvwDocumentos.Selected.Indent;
         qyDoc.ParamByName('cd_pessoa').AsInteger := Self.iCodAluno;
         qyDoc.Open();

         if (LeftStr(qyDoc.FieldByName('im_documento').AsString, 4) = '%PDF') then
         begin
            if sdArquivos.Execute then
            begin
               if (RightStr(sdArquivos.FileName, 4) = '.pdf') then
               begin
                  arquivo := sdArquivos.FileName;
               end else
               begin
                  arquivo := sdArquivos.FileName + '.pdf';
               end;


              (qyDoc.FieldByName('im_documento') as TBlobField).SaveToFile(arquivo);

               ZeroMemory(@SEInfo, SizeOf(SEInfo));

               with SEInfo do
               begin
                  cbSize := SizeOf(SEInfo);
                  fMask  := SEE_MASK_NOCLOSEPROCESS;
                  lpVerb := PChar('open');
                  lpFile := PChar(arquivo);
                  nShow  := SW_SHOWNORMAL;
               end;

               ShellExecuteEx(@SEInfo);
            end;
         end;
      finally

      end;
   except
        Mensagem(
         'Nenhum arquivo PDF selecionado.',
         '',
         MB_ICONERROR + MB_OK
        );
   end;
end;

procedure TFDigDocumentos.tbMudarTipoDocumentoClick(Sender: TObject);
var
   iRes: Integer;
   iCodDoc: LongInt;
   lugar: Pointer;
   cdDocumento: Integer;
   cdTipo: Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then
   begin
      Mensagem('Você não tem a permissão necessária para efetuar essa operação.', '', MB_ICONWARNING + MB_OK);
      exit;
   end;

   if (Self.TemItemSelecionado) then begin

      cdTipo := lvwDocumentos.Selected.Indent;
      if pcDocumentos.ActivePage = tsDocsAlunos then
         cdDocumento := qyDocsAluno.FieldByName('codigo').AsInteger
      else
         cdDocumento := qyDocumentos.FieldByName('codigo').AsInteger;

      frmAddDocumento := TfrmAddDocumento.Create(Self);
      frmAddDocumento.qyDoc.Connection := DM.dbDocs;
      frmAddDocumento.Panel3.Caption := 'SELECIONE O NOVO TIPO DE DOCUMENTO QUE DESEJA ENVIAR ESTE DOCUMENTO';
      iRes := frmAddDocumento.ShowModal();
      if iRes = mrCancel then begin
         FreeAndNil(frmAddDocumento);
         Exit;
      end
      else if iRes = mrOk then begin
         iCodDoc := frmAddDocumento.getCodDoc();
      end;
      FreeAndNil(frmAddDocumento);

      if (iCodDoc > 0) then begin
         qyBuscaDocumento.ParamByName('documento').AsInteger := iCodDoc;
         qyBuscaDocumento.ParamByName('pessoa').AsInteger := iCodAluno;
         qyBuscaDocumento.ParamByName('tipo').AsInteger := cdTipo;
         qyBuscaDocumento.Open();

         //Verifica se o aluno já possui um documento do tipo escolhido para mudar
         if not qyBuscaDocumento.IsEmpty then
         begin
            if Mensagem('O aluno já possui um documento desse tipo, deseja substituir o documento existente?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
            begin
               qyDeleteDocumentoAluno.ParamByName('documento').AsInteger := iCodDoc;
               qyDeleteDocumentoAluno.ParamByName('pessoa').AsInteger := iCodAluno;
               qyDeleteDocumentoAluno.ParamByName('tipo').AsInteger := cdTipo;
               qyDeleteDocumentoAluno.ExecSQL;

               qyAlteraDocumentoAluno.ParamByName('novo_documento').AsInteger := iCodDoc;
               qyAlteraDocumentoAluno.ParamByName('documento').AsInteger := cdDocumento;
               qyAlteraDocumentoAluno.ParamByName('pessoa').AsInteger := iCodAluno;
               qyAlteraDocumentoAluno.ParamByName('tipo').AsInteger := cdTipo;
               qyAlteraDocumentoAluno.ExecSQL;
            end;
         end else
         begin
            if Mensagem('Você deseja realmente trocar o tipo desse documento?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
            begin
               qyAlteraDocumentoAluno.ParamByName('novo_documento').AsInteger := iCodDoc;
               qyAlteraDocumentoAluno.ParamByName('documento').AsInteger := cdDocumento;
               qyAlteraDocumentoAluno.ParamByName('pessoa').AsInteger := iCodAluno;
               qyAlteraDocumentoAluno.ParamByName('tipo').AsInteger := cdTipo;
               qyAlteraDocumentoAluno.ExecSQL;
            end;
         end;

         qyBuscaDocumento.Close();
         if pcDocumentos.TabIndex = 0 then
         begin
            qyDocsAluno.Refresh;
         end;
         carregaDocumentos;
      end;

   end
   else
      Mensagem('Selecione uma imagem para efetuar essa operação.', '', MB_ICONERROR + MB_OK);
end;

procedure TFDigDocumentos.tbExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npExcluir, True ) then
   begin
      Mensagem('Você não tem a permissão necessária para efetuar essa operação.', '', MB_ICONWARNING + MB_OK);
      exit;
   end;

   if Self.TemItemSelecionado then
   begin
      ExcluirDocumento();
      atualizarDocumentacao();
      Self.FBAlterado := true;
      if (pcDocumentos.TabIndex = 0) and (lvwDocumentos.Items.Count = 0) then
      begin
         qyDocsAluno.Refresh;
      end;
   end
   else
      Mensagem('Selecione uma imagem para efetuar essa operação.', '', MB_ICONERROR + MB_OK);
end;

procedure TFDigDocumentos.tbRotacionarDireitaClick(Sender: TObject);
var
   indice: Integer;
begin
   if Self.TemItemSelecionado then
   begin
      indice:= lvwDocumentos.ItemIndex;
      aplicarRotacao(RT_DIREITA);
      lvwDocumentos.ItemIndex:=indice;
      Self.FBAlterado := true;
   end
   else
      Mensagem('Selecione uma imagem para efetuar essa operação.', '', MB_ICONERROR + MB_OK);
end;

function TFDigDocumentos.GetPDFPath: string;
begin
   Result := FPDFPath;
end;

procedure TFDigDocumentos.aplicarRotacao(direcao:integer);
var
   lbAuxiliar: TBitmap; // Aqui criamos um TBitmap auxiliar;
   jpeg: TJPEGImage;
   img2 : TBitmap;
   BackColor: TColor;
   m: TMemoryStream;
   Stream: TStream;
   qyDocAcoes : TUMZQuery;
//   b: TStream;
begin
   DM.CriarConsultaDOCs(qyDocAcoes);

   // Carrega Imagens da Base
   qyDocAcoes.Close();
   try
      if Self.pcDocumentos.ActivePage = tsDocsAlunos then
         qyDocAcoes.SQL.Text:= 'SELECT cd_documento_aluno, im_documento FROM documentos_alunos WHERE cd_documento = '+qyDocsAluno.FieldByName('codigo').AsString+' AND cd_pessoa = '+IntToStr(iCodAluno)+' AND cd_tipo = '+IntToStr(lvwDocumentos.Selected.Indent)
      else
         qyDocAcoes.SQL.Text:= 'SELECT cd_documento_aluno, im_documento FROM documentos_alunos WHERE cd_documento = '+qyDocumentoscodigo.AsString+' AND cd_pessoa = '+IntToStr(iCodAluno)+' AND cd_tipo = '+IntToStr(lvwDocumentos.Selected.Indent);
      // qyDocAcoes.RequestLive := True;
      qyDocAcoes.Open();

      if (LeftStr(qyDocAcoes.FieldByName('im_documento').AsString, 4) = 'ÿØÿà') then  begin
         // Cria os buffers, blobs e imagens
         m := TMemoryStream.Create();
         try
            jpeg := TJPEGImage.Create();
            try
               img2 := TBitmap.Create();
               try
                  Stream := qyDocAcoes.CreateBlobStream(qyDocAcoes.FieldByName('im_documento'), bmRead);
//                  b := qyDocAcoes.CreateBlobStream(qyDocAcoes.FieldByName('im_documento'), bmRead);
                  try
//                     m.LoadFromStream(b);
                     if Stream.Size > 0 then begin
//                        jpeg.LoadFromStream(m);
                        jpeg.Assign(qyDocAcoes.FieldByName('im_documento'));
                        img2.Assign(jpeg);
                        BackColor  := img2.TransparentColor;
                        lbAuxiliar := Rotacionar(img2, direcao, BackColor);
                        try
                           lbAuxiliar.TransparentColor := BackColor;
                           lbAuxiliar.Transparent := img2.Transparent;
                           img2.Assign(lbAuxiliar);
                           jpeg.Assign(img2);
                           qyDocAcoes.Edit();
                           Stream := qyDocAcoes.CreateBlobStream(qyDocAcoes.FieldByName('im_documento'), bmWrite);
//                           B := TBlobStream.Create(qyDocAcoes.FieldByName('im_documento') as TBlobField, bmWrite);
//                           jpeg.SaveToStream(B);
                           jpeg.SaveToStream(Stream);
                           TBlobField(qyDocAcoes.FieldByName('im_documento')).LoadFromStream(Stream);
                           qyDocAcoes.Post();
                           qyDocAcoes.Close();
                           // qyDocAcoes.RequestLive := False;
                           carregaDocumentos;
                        finally
                           FreeAndNil(lbAuxiliar);
                        end;
                     end;
                  finally
                     FreeAndNil(Stream);
                  end;
               finally
                  FreeAndNil(img2);
               end;
            finally
               FreeAndNil(jpeg);
            end;
         finally
            FreeAndNil(m);
         end;
      end;
   except

   end;

end;

initialization

finalization
   if Assigned(Imagem) then
      FreeAndNil(Imagem);

end.


