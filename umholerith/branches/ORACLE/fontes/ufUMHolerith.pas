unit ufUMHolerith;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, IniFiles, ZConnection,
   DB, FileCtrl, ZDbcIntfs, ZAbstractRODataset, UZDataset,
   UZStartConnection, ZAbstractDataset, UMComboBox;

type
   TfHolerith = class(TForm)
      FPnTitulo: TPanel;
      Bevel1: TBevel;
      FLbTipoFolha: TLabel;
      FCbTipoFolha: TUMComboBox;
      FLbDir: TLabel;
      FEdDir: TEdit;
      FBnDir: TSpeedButton;
      FBnExportar: TSpeedButton;
      FPbProgresso: TProgressBar;
      FLbExportar: TLabel;
      qryInsere: TUMZQuery;
      procedure FBnExportarClick(Sender: TObject);
      procedure FBnDirClick(Sender: TObject);
      procedure FCbTipoFolhaSelect(Sender: TObject);
      procedure FormCreate(Sender: TObject);

      strict private
         procedure carregaTiposFolha;
         procedure limpaFormulario;
         function getTituloApp: string;
         function getNumeroVersao: string;
         function getTotalArquivos: integer;

   end;

var
   fHolerith: TfHolerith;

implementation

uses uDM, uUMNucleo, uItemCombo, uUHolerithExportacao, uGeneral;

{$R *.dfm}

{ TfHolerith }

{ Acessa a base de dados para pegar os tipos de folha válidos. }
procedure TfHolerith.carregaTiposFolha;
const
   SQL_TIPOS_FOLHA =
      ' SELECT S.CD_SITUACAO CD_TIPO_FOLHA, S.DS_VALOR ' +
      ' FROM SITUACOES S INNER JOIN MODULOS M ON (S.CD_MODULO = M.CODIGO) ' +
      ' WHERE M.CATEGORIA = ''Holerith'' ' +
      ' ORDER BY s.cd_auxiliar, s.ds_valor ';
var
   qyTiposFolha : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyTiposFolha);

   qyTiposFolha.SQL.Text := SQL_TIPOS_FOLHA;
   qyTiposFolha.Open();

   FCbTipoFolha.Clear();

   while not qyTiposFolha.Eof do
   begin
      FCbTipoFolha.AddItem(
         qyTiposFolha.FieldByName('DS_VALOR').AsString,
         TItemCombo.Create(
            qyTiposFolha.FieldByName('CD_TIPO_FOLHA').AsString,
            qyTiposFolha.FieldByName('DS_VALOR').AsString
         )
      );

      qyTiposFolha.Next;
   end;

   FreeAndNil(qyTiposFolha);
end;

{ Reseta os componentes para iniciar nova importação. }
procedure TfHolerith.limpaFormulario;
begin
   Self.FCbTipoFolha.ItemIndex := -1;
   Self.FEdDir.Clear;
   Self.FPbProgresso.Position := 0;
   Self.FLbDir.Visible := False;
   Self.FEdDir.Visible := False;
   Self.FBnDir.Visible := False;
   Self.FBnExportar.Visible := False;
end;

procedure TfHolerith.FBnDirClick(Sender: TObject);
var
   sr: TSearchRec;
   sDir: string;
begin
   if SelectDirectory('Selecione o diretório desejado.', '', sDir) then
   begin
      try
         if FindFirst(sDir + '\*.pdf', faAnyFile, sr) = 0 then
         begin
            Self.FEdDir.Text := sDir;
            Self.FBnExportar.Visible := True;
            Self.FPbProgresso.Min := 0;
            Self.FPbProgresso.Max := Self.getTotalArquivos;
         end else
         begin
            MessageDlg('O diretório selecionado não possui documentos válidos.', mtInformation, [mbOk], -1);
            Self.FBnExportar.Visible := False;
            Self.FEdDir.Clear;
         end;
      finally
         FindClose(sr);
      end;
   end;
end;

procedure TfHolerith.FBnExportarClick(Sender: TObject);
var
   sr: TSearchRec;
   arquivoExportacao: THolerithExportacao;

   slErros: TStringList;
   sArqs: string;
   iFind, I: integer;
begin
   try
      arquivoExportacao := THolerithExportacao.Create(
         Self.FEdDir.Text + '\',
         StrToInt(TItemCombo(FCbTipoFolha.Items.Objects[FCbTipoFolha.ItemIndex]).getCodigo()),
         TUMNucleo.GetParametro('holerith_regex_leitura_arquivo')
      );
   except
      on E: Exception do
      begin
         TGeneral.Mensagem(E.Message, '', MB_ICONERROR + MB_OK, Handle);
         Self.limpaFormulario();
         Exit;
      end;
   end;

   slErros := TStringList.Create;

   try
      // Percorre todos os PDF do diretório selecionado.
      iFind := FindFirst(Self.FEdDir.Text + '\*.pdf', faAnyFile, sr);
      try
         while iFind = 0 do
         begin
            try
               arquivoExportacao.Importar(sr);
            except
               on E: Exception do
               begin
                  if Pos('duplicate entry', LowerCase(E.Message)) > 0 then
                  begin
                     slErros.Add('[Holerith já incluso] ' + sr.Name)
                  end else begin
                     slErros.Add('Erro de sistema: ' + LowerCase(E.Message) + ' - Arquivo: ' + sr.Name);
                  end;

               end;
            end;

            Self.FPbProgresso.Position := Self.FPbProgresso.Position + 1;
            iFind := FindNext(sr);
         end;
      finally
         FindClose(sr);
      end;
      // Mostra os arquivos que não puderam ser importados
      if slErros.Count > 0 then
      begin
         for i := 0 to slErros.Count - 1 do
         begin
            sArqs := sArqs + #13 + slErros.Strings[i];
         end;

         MessageDlg('Os seguintes arquivos não puderam ser importados: '#13 + sArqs, mtWarning, [mbOk], -1);
      end;
   finally
      slErros.Free;  
   end;
   MessageDlg('Importação finalizada!', mtInformation, [mbOk], -1);
   Self.limpaFormulario;
end;

procedure TfHolerith.FCbTipoFolhaSelect(Sender: TObject);
begin
   FLbDir.Visible := FCbTipoFolha.ItemIndex <> -1;
   FEdDir.Visible := FLbDir.Visible;
   FBnDir.Visible := FLbDir.Visible;
end;


procedure TfHolerith.FormCreate(Sender: TObject);
begin
   Self.Caption := Self.getTituloApp;
   Self.carregaTiposFolha;
end;

function TfHolerith.getNumeroVersao: string;
var
   dwInfoSize, dwVerSize, dwWnd: DWORD;
   FI: PVSFixedFileInfo;
   ptVerBuff: Pointer;
   sFileName, sVersion: string;
begin
   sFileName := Application.ExeName;
   dwInfoSize := GetFileVersionInfoSize(PChar(sFileName), dwWnd);
   if dwInfoSize = 0 then
   begin
      Result := 'UMHolerith';
   end
   else
   begin
      GetMem(ptVerBuff, dwInfoSize);
      try
         if GetFileVersionInfo(PChar(sFileName), dwWnd, dwInfoSize, ptVerBuff) then
         begin
            if VerQueryValue(ptVerBuff, '\', Pointer(FI),dwVerSize) then
            begin
               sVersion :=
                  Format(  '%d.%d.%d.%d',
                           [HiWord(FI.dwFileVersionMS),
                           LoWord(FI.dwFileVersionMS),
                           HiWord(FI.dwFileVersionLS),
                           LoWord(FI.dwFileVersionLS)]);
            end;            
         end;
      finally
         FreeMem(ptVerBuff);
      end;
      Result := sVersion;
   end;
end;

function TfHolerith.getTituloApp: string;
begin
   Result := Application.Title + ' - ' + TUMNucleo.GetParametro('cliente_nome_fantasia') + ' - (' + Self.getNumeroVersao + ')';
end;

function TfHolerith.getTotalArquivos: integer;
var
   sr: TSearchRec;
   iFind: integer;
begin
   Result := 0;
   try
      iFind := FindFirst(Self.FEdDir.Text + '\*.pdf', faAnyFile, sr);
      while iFind = 0 do
      begin
         Inc(Result);
         iFind := FindNext(sr);
      end;
   finally
      FindClose(sr);
   end;
end;

end.
