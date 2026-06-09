unit UFDigitalizaDoc;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, CropImage, Buttons, StdCtrls, DelphiTwain, jpeg, ComCtrls,
   ShellAPI;

type
   TfDigitalizaDoc = class(TForm)
      pnlImagem: TPanel;
      pnlOpcoes: TPanel;
      bvlSep1: TBevel;
      sbSelArquivo: TSpeedButton;
      sbDigitalizar: TSpeedButton;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      dtwDigitalizar: TDelphiTwain;
      odlgArquivo: TOpenDialog;
      pgcOpcoes: TPageControl;
      tbsImagem: TTabSheet;
      tbsPDF: TTabSheet;
      cimImagem: TCropImage;
      sbPDF: TSpeedButton;
      imgPDF: TImage;
    procedure FormCreate(Sender: TObject);
      procedure sbPDFClick(Sender: TObject);
      procedure dtwDigitalizarTwainAcquire(Sender: TObject; const Index: Integer;
         Image: TBitmap; var Cancel: Boolean);
      procedure dtwDigitalizarAcquireError(Sender: TObject; const Index: Integer;
         ErrorCode, Additional: Integer);
      procedure dtwDigitalizarAcquireCancel(Sender: TObject;
         const Index: Integer);
      procedure sbDigitalizarClick(Sender: TObject);
      procedure sbSelArquivoClick(Sender: TObject);
   private
      FPDFPath: string;
      function GetPDFPath: string;
   public
      property PDFPath: string read GetPDFPath;
      var extensao: String;
   end;

var
   fDigitalizaDoc: TfDigitalizaDoc;

implementation

{$R *.dfm}

procedure TfDigitalizaDoc.dtwDigitalizarAcquireCancel(Sender: TObject;
  const Index: Integer);
begin
   dtwDigitalizar.Source[dtwDigitalizar.SourcesLoaded].Enabled := False;
   dtwDigitalizar.Source[dtwDigitalizar.SourcesLoaded].Loaded := False;
end;

procedure TfDigitalizaDoc.dtwDigitalizarAcquireError(Sender: TObject;
  const Index: Integer; ErrorCode, Additional: Integer);
const
   SMsgError = 'Erro na digitalização do documento.';
begin
   MessageDlg(SMsgError, mtError, [mbOK], -1);
end;

procedure TfDigitalizaDoc.dtwDigitalizarTwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
   cimImagem.Picture.Assign(Image);
   dtwDigitalizar.Source[dtwDigitalizar.SourcesLoaded].Enabled := False;
   dtwDigitalizar.Source[dtwDigitalizar.SourcesLoaded].Loaded := False;
   Cancel := True;
end;

procedure TfDigitalizaDoc.FormCreate(Sender: TObject);
begin
   while not dtwDigitalizar.LoadLibrary do;
   while not dtwDigitalizar.LoadSourceManager do;
end;

function TfDigitalizaDoc.GetPDFPath: string;
begin
   Result := FPDFPath;
end;

procedure TfDigitalizaDoc.sbDigitalizarClick(Sender: TObject);
const
   SMsgLibUnloaded = 'Não foi possível inicializar a biblioteca para digitalização de imagens';
   SMsgSourceNotFound = 'Não foi encontrado dispositivo para digitalização';
var
   I: Integer;
begin
   while not dtwDigitalizar.LoadLibrary do;
   while not dtwDigitalizar.LoadSourceManager do;

   if dtwDigitalizar.SourceCount > 0 then
   begin
      I := dtwDigitalizar.SelectSource;

      if I > -1 then
      begin
         if dtwDigitalizar.LibraryLoaded then
         begin
            dtwDigitalizar.Source[I].SetICapUnits(tuPixels);
            dtwDigitalizar.Source[I].SetIPixelType(tbdRgb);
            dtwDigitalizar.Source[I].Modal := True;
            dtwDigitalizar.Source[I].Loaded := True;
            dtwDigitalizar.Source[I].Enabled := True;
            extensao:= '.JPG';
         end
         else
         begin
            MessageDlg(SMsgLibUnloaded, mtError, [mbOK], -1);
         end;
      end;
   end
   else
      MessageDlg(SMsgSourceNotFound, mtInformation, [mbOK], -1);
end;

procedure TfDigitalizaDoc.sbPDFClick(Sender: TObject);
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

procedure TfDigitalizaDoc.sbSelArquivoClick(Sender: TObject);
var
   FileExt: string;
   JPEGImg: TJPEGImage;
   Bitmap: TBitmap;
begin
   if odlgArquivo.Execute then
   begin
      FileExt := ExtractFileExt(odlgArquivo.FileName);
      FileExt := AnsiUpperCase(FileExt);
      sbPDF.Enabled := False;
      extensao:= FileExt;
      if (FileExt = '.JPEG') or (FileExt = '.JPG') then
      begin
         JPEGImg := TJPEGImage.Create;
         try
            JPEGImg.LoadFromFile(odlgArquivo.FileName);
            cimImagem.Picture.Assign(JPEGImg);
         finally
            JPEGImg.Free;
         end;
         pgcOpcoes.ActivePageIndex := 0;
      end
      else if FileExt = '.BMP' then
      begin
         Bitmap := TBitmap.Create;
         try
            Bitmap.LoadFromFile(odlgArquivo.FileName);
            cimImagem.Picture.Assign(Bitmap);
         finally
            Bitmap.Free;
         end;
         pgcOpcoes.ActivePageIndex := 0;
      end
      else if FileExt = '.PDF' then
      begin
         FPDFPath := odlgArquivo.FileName;
         sbPDF.Enabled := True;
         pgcOpcoes.ActivePageIndex := 1;
      end;
   end;
end;

end.
