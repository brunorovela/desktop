unit uDig;

interface

uses
   General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, ToolWin, ImgList, ExtCtrls, ExtDlgs, DBTables,
  DelphiTwain, StdCtrls, Buttons, DB, ZConnection, Jpeg, uMatriculas, ClassRegistros;

type
  TfrmDig = class(TForm)
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    pnTitulo: TPanel;
    pnDados: TPanel;
    Bevel6: TBevel;
    DelphiTwain1: TDelphiTwain;
    AbrirImagem: TOpenPictureDialog;
    pnListaImagens: TPanel;
    tbListaImagens: TTabControl;
    pnImagem: TPanel;
    imView: TImage;
    pnBotoes: TPanel;
    Bevel1: TBevel;
    ImageList1: TImageList;
    toolDoc: TToolBar;
    btnOrigem: TToolButton;
    btnImportar: TToolButton;
    btnDigitalizar: TToolButton;
    btnImpDoc: TToolButton;
    btnFecharDoc: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    txtDestinoLargura: TEdit;
    txtDestinoAltura: TEdit;
    Label1: TLabel;
    txtOrigem: TEdit;
    SpeedButton1: TSpeedButton;
    sbDigitalizar: TSpeedButton;
    btnLimpar: TToolButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    txtOrigemLargura: TEdit;
    txtOrigemAltura: TEdit;
    qyDocumentos: TUMZQuery;
    qyDocAcoes: TUMZQuery;
    procedure txtDestinoAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure DelphiTwain1AcquireError(Sender: TObject; const Index: Integer;
      ErrorCode, Additional: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnFecharDocClick(Sender: TObject);
    procedure tbListaImagensChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparClick(Sender: TObject);
    procedure btnOrigemClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbDigitalizarClick(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure DelphiTwain1TwainAcquire(Sender: TObject;
      const Index: Integer; Image: TBitmap; var Cancel: Boolean);
    procedure btnImpDocClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure MostrarOrigem(Source : smallint);
    procedure BuscarAtributos();

    procedure ResizeFoto(var oJPG: TJPEGImage; iMaxWidth: Integer; iMaxHeigth: Integer);

    procedure CarregaImagens();
    procedure MostraImagem(Index: Integer);
    procedure SalvaNoBancoDados();

    procedure VerificaBibliotecaTwain();

  public
      function AdquirirImagem( width, heigth, dpi: word; titulo: string) : Boolean;
    { Public declarations }
  end;

var
  frmDig: TfrmDig;
  Imagem: TJPEGImage;
  Origem: smallint;

implementation

uses uDM, Main, StrUtils;

{$R *.dfm}

{ TfrmDig }

function TfrmDig.AdquirirImagem( width, heigth, dpi: word; titulo: string) : Boolean;
begin


   DelphiTwain1.LibraryLoaded := True;
   DelphiTwain1.SourceManagerLoaded := True;

   if not ((DelphiTwain1.LibraryLoaded) and (DelphiTwain1.SourceManagerLoaded)) then
   begin
    Mensagem('Não foi possível carregar a biblioteca Twain ou alguma origem.', '', MB_ICONERROR + MB_OK);
    Result := False;
    Exit;
   end;


   if Length(trim(titulo)) > 50 then
      pnTitulo.Caption := 'Digitalizar: ' + Copy(trim(titulo),1,50) + '...'
   else
      pnTitulo.Caption := 'Digitalizar: ' + trim(titulo) + '...';

   // Selecionar a última origem de digitalização utilizada
   try
     Origem := StrToInt(Dm.variavel_parametro('digitalizacao_origem'));
     //origem := 0;
    // sbDigitalizar.Enabled := true;
   except
     Origem := -1;
   end;


   sbDigitalizar.Enabled := False;
   btnDigitalizar.Enabled := False;

   txtDestinoLargura.Text := IntToStr(width);
   txtDestinoAltura.Text := IntToStr(heigth);

   MostrarOrigem(Origem);

   CarregaImagens();

   if ShowModal = mrOk then
   begin
      Result := True;
      Exit;
   end;

   Result := False;

end;

procedure TfrmDig.btnFecharDocClick(Sender: TObject);
begin
   DelphiTwain1.UnloadLibrary();
   Self.ModalResult := mrOk;
   Self.Close;
end;

 procedure TfrmDig.BuscarAtributos;
begin
   txtOrigemLargura.Text := IntToStr( Imagem.Width );
   txtOrigemAltura.Text := IntToStr( Imagem.Height );

   txtDestinoAltura.text := txtOrigemAltura.Text;
   txtDestinoLargura.text := txtOrigemLargura.Text;
end;



procedure TfrmDig.CarregaImagens;
begin

   imView.Picture := nil;
   qyDocumentos.Close();
   qyDocumentos.SQL.Clear();
   with qyDocumentos.SQL do
   begin
      Add('SELECT');
      Add('    dd.im_doc1, dd.im_doc2, dd.im_doc3, dd.im_doc4, d.documento');
      Add('FROM');
      Add('    documentos_digitalizados dd');
      Add('    INNER JOIN documentos d ON (dd.cd_documento = d.codigo)');
      Add('WHERE');
      Add('    dd.cd_pessoa = :cdpessoa');
      Add('AND');
      Add('    dd.cd_documento = :cddocumento');
   end;
   qyDocumentos.Params.ParamByName('cddocumento').Value := frmMatriculas.tblDocCodigo.AsInteger;
   qyDocumentos.Params.ParamByName('cdpessoa').Value := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
   qyDocumentos.Open();

   with qyDocumentos do
   begin
      if ((FieldByName('im_doc1').AsString <> '') or (FieldByName('im_doc2').AsString <> '') or (FieldByName('im_doc3').AsString <> '') or (FieldByName('im_doc4').AsString <> '')) then
      begin
         frmMatriculas.setApresentou('S');
      end
      else
      begin
         frmMatriculas.setApresentou('N');
      end;
   end;


   MostraImagem(tbListaImagens.TabIndex);

end;

procedure TfrmDig.MostraImagem(Index: Integer);
var
   b: TStream;
   m: TMemoryStream;
   img: TJPEGImage;
   sCampo: string;
begin
   sCampo :='im_doc' + IntToStr(tbListaImagens.TabIndex + 1);
   if (LeftStr(qyDocumentos.FieldByName(sCampo).AsString, 4) = 'ÿØÿà') then
   begin
      m := TMemoryStream.Create();
      img := TJPEGImage.Create();
      b := qyDocumentos.CreateBlobStream(qyDocumentos.FieldByName(sCampo), bmRead);
      try
         m.LoadFromStream(b);
         if b.Size > 0 then
         begin
            img.Assign(qyDocumentos.FieldByName(sCampo));
            imView.Picture.Assign(img);
            txtOrigemLargura.Text := Format('%d', [img.Width]);
            txtOrigemAltura.Text := Format('%d', [img.Height]);
         end;
      finally
         m.Free();
         b.Free();
         img.Free();
      end;
   end
   else
   begin
      imView.Picture := nil;
   end; //#1
end;

procedure TfrmDig.MostrarOrigem(Source : smallint);
begin
   VerificaBibliotecaTwain();

  if DelphiTwain1.SourceCount > 0 then
  begin
    if Source <> -1 then
    begin
      txtOrigem.Text := DelphiTwain1.Source[Source].ProductName;
      sbDigitalizar.Enabled := True;
      btnDigitalizar.Enabled := True;
    end
    else
    begin
      txtOrigem.Text := 'Nenhuma origem selecionada';
      sbDigitalizar.Enabled := False;
      btnDigitalizar.Enabled := False;
    end;
  end
  else
  begin
      txtOrigem.Text := 'Nenhuma origem disponível';
      sbDigitalizar.Enabled := False;
      btnDigitalizar.Enabled := False;      
  end;
end;



procedure TfrmDig.ResizeFoto(var oJPG: TJPEGImage; iMaxWidth,
  iMaxHeigth: Integer);
var
  oBmp: TBitmap;
  iW, iH: Integer;
  lP: Double;
begin

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
    oJPG.CompressionQuality := 100;
    oJPG.Compress();
 
    FreeAndNil(oBmp);
 
  end
  else begin
      oBmp.Assign(oJPG);
      oJPG.Assign(oBmp);
      oJPG.CompressionQuality := 100;
      oJPG.Compress();
      FreeAndNil(oBmp);
  end;

end;

procedure TfrmDig.tbListaImagensChange(Sender: TObject);
begin
   MostraImagem(tbListaImagens.TabIndex);
end;

procedure TfrmDig.txtDestinoAlturaKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9', #8, #13]) then
   begin
      Key := #0;
   end;
end;

procedure TfrmDig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DelphiTwain1.UnloadLibrary();

   if (Imagem <> nil) then begin
      FreeAndNil(Imagem);
   end;
   qyDocumentos.Close();
   FreeAndNil(qyDocumentos);
end;

procedure TfrmDig.btnLimparClick(Sender: TObject);
begin

   if Mensagem('Você tem certeza que deseja remover esta Imagem?', '', MB_YESNO + MB_ICONQUESTION) = IDYES then
   begin
      with qyDocAcoes.SQL do
      begin
         Clear();
         Add('UPDATE documentos_digitalizados SET im_doc' + IntToStr(tbListaImagens.TabIndex+1) + '= NULL where cd_pessoa = :cdpessoa AND cd_documento = :cddocumento');
      end;
      qyDocAcoes.Params.ParamByName('cddocumento').Value := frmMatriculas.tblDocCodigo.AsInteger;
      qyDocAcoes.Params.ParamByName('cdpessoa').Value := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
      qyDocAcoes.ExecSQL;

      CarregaImagens();

   end;
end;

procedure TfrmDig.btnOrigemClick(Sender: TObject);
var
  SourceIndex: smallint;
begin

  VerificaBibliotecaTwain();

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
  MostrarOrigem(Origem);
end;


procedure TfrmDig.SpeedButton1Click(Sender: TObject);
begin
  if AbrirImagem.Execute then
  begin
      if Imagem <> nil then begin
         FreeAndNil(Imagem);
      end;
      Imagem := TJPEGImage.Create();
      Imagem.LoadFromFile(AbrirImagem.FileName);
      ResizeFoto(Imagem, StrToInt(txtDestinoLargura.Text), StrToInt(txtDestinoAltura.Text));

      imView.Picture.Assign(Imagem);
      SalvaNoBancoDados();
      FreeAndNil(Imagem);
  end;
end;

procedure TfrmDig.SalvaNoBancoDados;
var
   sCampo: string;
   Stream: TStream;
begin
   sCampo :='im_doc' + IntToStr(tbListaImagens.TabIndex + 1);

   qyDocAcoes.Close();
   if not (Imagem.Empty) then
   begin
      with qyDocAcoes.SQL do
      begin
         Clear();
         Add('SELECT');
         Add('   cd_pessoa, cd_documento, ' + sCampo);
         Add('FROM');
         Add('    documentos_digitalizados');
         Add('WHERE');
         Add('    cd_pessoa = :cdpessoa');
         Add('AND');
         Add('    cd_documento = :cddocumento');
      end;
      // qyDocAcoes.RequestLive := True;
      qyDocAcoes.Params.ParamByName('cddocumento').Value := frmMatriculas.tblDocCodigo.AsInteger;
      qyDocAcoes.Params.ParamByName('cdpessoa').Value := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
      qyDocAcoes.Open();

      if qyDocAcoes.IsEmpty then
      begin
         qyDocAcoes.Insert();
         qyDocAcoes.FieldByName('cd_documento').Value := frmMatriculas.tblDocCodigo.AsInteger;
         qyDocAcoes.FieldByName('cd_pessoa').Value := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
      end
      else
      begin
         qyDocAcoes.Edit();
      end;

      Stream := qyDocAcoes.CreateBlobStream(qyDocAcoes.FieldByName(sCampo), bmWrite);
      Imagem.SaveToStream(Stream);
      TBlobField(qyDocAcoes.FieldByName(sCampo)).LoadFromStream(Stream);

      qyDocAcoes.Post();

      qyDocAcoes.Close();
      // qyDocAcoes.RequestLive := False;

      CarregaImagens();
   end;

end;

procedure TfrmDig.sbDigitalizarClick(Sender: TObject);
begin
  // SourceIndex := DelphiTwain1.SelectSource();
  if Imagem <> nil then begin
   FreeAndNil(Imagem);
  end;
  Imagem := TJPEGImage.Create();

  VerificaBibliotecaTwain();

  if (Origem <> -1) then
  begin
     //Now that we know the index of the source, we'll
     //get the object for this source
     with DelphiTwain1.Source[Origem] do begin

        //Load source and acquire image

        SetICapUnits(tuPixels);
        SetIXResolution(StrToInt(txtDestinoLargura.Text));
        SetIYResolution(StrToInt(txtDestinoAltura.Text));
        SetIPixelType(tbdRgb);

        Modal := True;
        Loaded := True;
        Enabled := True;
     end;
  end; {if (SourceIndex <> -1)}
end;

procedure TfrmDig.btnDigitalizarClick(Sender: TObject);
begin
   Self.sbDigitalizarClick(nil);
end;

procedure TfrmDig.btnImportarClick(Sender: TObject);
begin
   SpeedButton1Click(nil);
end;

procedure TfrmDig.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
   if Imagem = nil then
   begin
      Imagem := TJPEGImage.Create();
   end;
//   Image.Width
   Imagem.Assign(Image);
   ResizeFoto(Imagem, StrToInt(txtDestinoLargura.Text), StrToInt(txtDestinoAltura.Text));

   SalvaNoBancoDados();

   imView.Picture.Assign(Imagem);

   FreeAndNil(Imagem);

   Cancel := True;
end;

procedure TfrmDig.btnImpDocClick(Sender: TObject);
var
   sSFormula: string;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   sSFormula := '{dd.cd_pessoa}=' + frmMatriculas.tblMatriculasCodigoAluno.AsString;
   sSFormula := sSFormula + ' AND {dd.cd_documento}=' + frmMatriculas.tblDocCodigo.AsString;

   infoRelatorio := PrincipalForm.GetInfoRpt('relDocDigital');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sSFormula, '', nil, nil, nil, nil, True, False, nil, PodeExportar);
end;

procedure TfrmDig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F4:
      btnOrigemClick(nil);
    VK_F5:
      btnImportarClick(nil);
    VK_F6:
      btnDigitalizarClick(nil);
    VK_F7:
      btnLimparClick(nil);
    VK_F10:
      btnImpDocClick(nil);
    VK_F12:
      btnFecharDocClick(nil);
  end;

end;

procedure TfrmDig.VerificaBibliotecaTwain();
begin
   if not DelphiTwain1.LibraryLoaded then begin
      DelphiTwain1.LoadLibrary();
   end;
end;

procedure TfrmDig.FormShow(Sender: TObject);
begin
   VerificaBibliotecaTwain();
end;

procedure TfrmDig.DelphiTwain1AcquireError(Sender: TObject;
  const Index: Integer; ErrorCode, Additional: Integer);
begin
   Mensagem('Ocorreu um erro na transferência!!' + IntTostr(errorCode) + ' (' + IntToStr(Additional) + ')');
   if (Imagem <> nil) then begin
      FreeAndNil(Imagem);
   end;
end;

end.

