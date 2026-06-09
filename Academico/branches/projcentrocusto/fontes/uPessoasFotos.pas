unit uPessoasFotos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, ToolWin, ImgList, ExtDlgs, jpeg,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ZConnection,
  DBTables;

type
  TFrmPessoasFotos = class(TForm)
    paCabecalho: TPanel;
    Bevel1: TBevel;
    rbUnicaPessoa: TRadioButton;
    rbVariasPessoas: TRadioButton;
    pnFoto: TPanel;
    imFoto: TImage;
    lbFoto: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edNomeArquivo: TEdit;
    btnPasta: TSpeedButton;
    Label4: TLabel;
    ImageList2: TImageList;
    Bevel3: TBevel;
    toolPessoa: TToolBar;
    btAtribuirAluno: TToolButton;
    ToolButton1: TToolButton;
    btCancelar: TToolButton;
    lsImagens: TListBox;
    Label5: TLabel;
    btAtribuirTodas: TToolButton;
    ToolButton3: TToolButton;
    AbrirFoto: TSavePictureDialog;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btAtribuirTodasClick(Sender: TObject);
    procedure btAtribuirAlunoClick(Sender: TObject);
    procedure lsImagensClick(Sender: TObject);
    procedure btnPastaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }

    Function VincularFoto(NomeArquivo : String; CodigoAluno : Integer) : Boolean;
    Function SoNumero( Valor : String ) : String;
    Procedure LimparLista;
    procedure ResizeFoto(var oJPG: TJPEGImage; iMaxWidth,iMaxHeigth: Integer);
  public
    { Public declarations }
  end;

var
  FrmPessoasFotos: TFrmPessoasFotos;

implementation

uses uFSelecionarPessoa, DB, uDM, Main;

{$R *.dfm}

procedure TFrmPessoasFotos.btAtribuirAlunoClick(Sender: TObject);
var
   iCodigoAluno : Integer;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   if lsImagens.ItemIndex < 0 then
   begin
      Mensagem('Selecione uma imagem para atribuir.', 'UNI-MESTRE', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      iCodigoAluno := resultado_filtro.cd_pessoa;

      if VincularFoto(lsImagens.Items.Strings[lsImagens.ItemIndex], iCodigoAluno) then
      begin
         Mensagem('Foto atribuida com sucesso!', 'UNI-MESTRE', MB_OK + MB_ICONINFORMATION);
         LimparLista;
      end
      else begin
         Mensagem('Não foi possível atribuir a imagem selecionada.', 'UNI-MESTRE', MB_OK + MB_ICONWARNING);
      end;
   end
   else Exit;
end;

procedure TFrmPessoasFotos.btAtribuirTodasClick(Sender: TObject);
var
   sCodigoAluno : String;
   n : Integer;
begin
   if Mensagem('Tem certeza que deseja atribuir todas as fotos da pasta com os respectivos alunos, pelo código indicado no nome do arquivo?', 'Atenção' , MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then begin
     Exit;
   end;

   n := 0;

   while n <= lsImagens.Count - 1 do begin

      lsImagens.ItemIndex := n;

      sCodigoAluno := lsImagens.Items.Strings[n];

      sCodigoAluno := SoNumero(sCodigoAluno);

      if Length(sCodigoAluno) > 0 then begin

         if VincularFoto(lsImagens.Items.Strings[lsImagens.ItemIndex], StrToInt(sCodigoAluno)) then
            LimparLista
         else
            INC(n);

      end
      else begin

        INC(n);

      end;

      Application.ProcessMessages();

   end;

   if lsImagens.Count <= 0 then begin

      Mensagem('Fotos atribuidas com sucesso!', 'UNI-MESTRE', MB_OK + MB_ICONINFORMATION);

   end
   else begin

     Mensagem('Não foi possível relacionar algumas fotos com o código do aluno. Renomeie os arquivos ou utilize o botão Atribuir ao Aluno.', 'UNI-MESTRE', MB_OK + MB_ICONWARNING);

   end;


end;

procedure TFrmPessoasFotos.btCancelarClick(Sender: TObject);
begin
   Close();
end;

procedure TFrmPessoasFotos.btnPastaClick(Sender: TObject);
Var
  SearchRec : TSearchRec;
  intControl : integer;
begin
   if not AbrirFoto.Execute then exit;

   lsImagens.Items.Clear();

   // Selecionar uma única foto
   if rbUnicaPessoa.Checked then begin

      lsImagens.Items.Add(ExtractFileName(AbrirFoto.FileName));

   end
   // Selecionar todas as fotos da Pasta
   else begin

      intControl := FindFirst( '*.jpg', faAnyFile, SearchRec );

      if intControl = 0 then begin
         while (intControl = 0) do begin
              lsImagens.Items.Add( SearchRec.Name );
              intControl := FindNext( SearchRec );
         end;
         FindClose( SearchRec );
      end;

   end;

   if (lsImagens.Items.Count > 0) then begin
      btAtribuirAluno.Enabled := true;
      btAtribuirTodas.Enabled := true;
      lsImagens.ItemIndex := 0;
      lsImagensClick(nil);
   end
   else begin

      imFoto.visible := false;
      lbFoto.Visible := True;

   end;

   edNomeArquivo.Text := AbrirFoto.FileName;

end;

procedure TFrmPessoasFotos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPessoasFotos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F12 : btCancelarClick( nil );   
   end;
end;

procedure TFrmPessoasFotos.LimparLista;
Var
   iAtual : Integer;
begin

   iAtual := lsImagens.ItemIndex;
   lsImagens.Items.Delete(iAtual);

   if iAtual >= lsImagens.Count  then
      lsImagens.ItemIndex := -1
   else
      lsImagens.ItemIndex := iAtual;

   lsImagensClick(nil);
end;

procedure TFrmPessoasFotos.lsImagensClick(Sender: TObject);
begin

  try
     imFoto.visible := True;
     lbFoto.Visible := False;

     imFoto.Picture.LoadFromFile(ExtractFilePath(AbrirFoto.FileName) + lsImagens.Items.Strings[lsImagens.ItemIndex]);
  except
    imFoto.visible := false;
    lbFoto.Visible := True;
  end;

end;

procedure TFrmPessoasFotos.ResizeFoto(var oJPG: TJPEGImage; iMaxWidth,
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
    oJPG.CompressionQuality := 80;
    oJPG.Compress();

    FreeAndNil(oBmp);

  end
  else begin
      oBmp.Assign(oJPG);
      oJPG.Assign(oBmp);
      oJPG.CompressionQuality := 80;
      oJPG.Compress();
      FreeAndNil(oBmp);
  end;

end;


function TFrmPessoasFotos.SoNumero(Valor: String): String;
Var
   NovoValor : String;
   n : Integer;
begin

   NovoValor := '';

   for n := 0 to Length(Valor) - 1 do begin

      if Valor[n] in ['0'..'9'] then begin

         NovoValor := NovoValor + Valor[n];

      end;

   end;

   Result := NovoValor;  

end;

function TFrmPessoasFotos.VincularFoto(NomeArquivo: String;
  CodigoAluno: Integer) : Boolean;
Var
   BS : TStream;
   Imagem : TJPEGImage;
   qyPessoa : TUMZQuery;

begin
   // Vincular o Arquivo ao Código do Aluno

   Dm.CriarConsulta( qyPessoa );

   qyPessoa.Close();
   // qyPessoa.RequestLive := True;

   qyPessoa.SQL.Text :=
     ' SELECT cd_pessoa, im_pessoa, sn_foto FROM pessoas ' +
     ' WHERE cd_pessoa = ' + IntToStr( CodigoAluno );

   qyPessoa.Open();
   qyPessoa.FetchAll();

   if qyPessoa.RecordCount > 0 then begin

      try

         qyPessoa.Edit;

         { Cria um componente BLOBStream baseado no campo da base de dados (qyPessoasFoto)
           em modo de gravação (Note: BMWRITE)  }
         BS := qyPessoa.CreateBlobStream(qyPessoa.FieldByName('im_pessoa'), bmWrite);
//         BS := TBlobStream.Create((qyPessoa.FieldByName('im_pessoa') as TBlobField), BMWRITE);
         { Cria um componente JPEG }
         Imagem := TJPEGImage.Create;
         { Abre a imagem do OpenPictureDialog para o componente JPEG criado anteriormente }
         Imagem.LoadFromFile(ExtractFilePath(AbrirFoto.FileName) + NomeArquivo);

         ResizeFoto(Imagem, 500, 500);
         { Corrigindo largura e/ou altura da imagem }

         Imagem.SaveToStream(BS);

         { Libera da memória os componentes que foram criados }
         FreeAndNil(BS);
         FreeAndNil(Imagem);

         { Salva as alterações feitas }
         qyPessoa.FieldByName('sn_foto').AsString := 'S';
         qyPessoa.Post();

         Result := True;

         FreeAndNil(Imagem);
         FreeAndNil(BS);


      except

         Result := False;
      end;

   end
   else begin

      Result := False;
   end;

   FreeAndNil(qyPessoa);

end;



end.

