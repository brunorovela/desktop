unit uBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons, uBackupSenha,
  FileCtrl, DB, DBTables, ZipMstr, General;

const
  BKP_DIARIO = 'diario';
  BKP_HORA   = 'hora';

type
  TfrmBackup = class(TForm)
    Panel1: TPanel;
    toolPessoa: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    GroupBox1: TGroupBox;
    lbAgendamento: TLabel;
    btAgendar: TBitBtn;
    Panel3: TPanel;
    mLog: TMemo;
    Panel4: TPanel;
    Bevel7: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    btIniciarRestaura: TBitBtn;
    qyUsuarioBackup: TQuery;
    qySenha: TQuery;
    odRestaurar: TOpenDialog;
    zm: TZipMaster;
    Panel5: TPanel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    btIniciar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btAgendarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//    flltxTabelas: TFileListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure tProgressoTimer(Sender: TObject);
    procedure pbProgressoMovimentacao(Tipo: integer);
    procedure ZerarCampos(Sender: TObject);
    procedure btIniciarRestauraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;
  tamanho : LongInt;
  sequencia : integer;
  ds_path_temp, ds_acao, ds_path_host,
  ds_host, ds_porta, ds_path, ds_senha, ds_usuario : string;
  aTabelas : array of string;

implementation

uses uDM, uBaseDados, dBackupSelTabs, dBackupProgresso, wBackupDescomp,
  uAgendarBackup;

{$R *.dfm}

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBackup.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmBackup.btIniciarClick(Sender: TObject);
begin

   // Define que o solicitação é de backup
   ds_acao := 'backup';

   // Chama o form para a seleção de quais tabelas
   //  será feito o backup
   fdBackupTabelas.ShowModal;

   if fdBackupTabelas.ModalResult = mrOk then
   begin

      fdBackupProgresso.show;

      Cursor := crSQLWait;
        fdBackupProgresso.backup(fdBackupTabelas.cbBases.Text, ds_host, ds_porta, ds_usuario, ds_senha, ds_path, ds_acao, aTabelas, true);
      Cursor := crDefault;

      fdBackupProgresso.close;

    end;
end;

procedure TfrmBackup.tProgressoTimer(Sender: TObject);
begin
  pbProgressoMovimentacao(0);
end;

procedure TfrmBackup.pbProgressoMovimentacao(Tipo: Integer);
begin
{
  case tipo of
    -1:
      pbProgresso.Position := 0;
    100:
      pbProgresso.Position := 100;
    else
      if pbProgresso.Position >= 100 then
        begin
          pbProgresso.Position := 0;
        end
      else
        begin
          pbProgresso.Position := pbProgresso.Position + 10;
        end;
    end;
}
end;

procedure TfrmBackup.ZerarCampos(Sender: TObject);
begin
  // Desabilita os botões iniciar
  btIniciar.Enabled := true;
  btIniciarRestaura.Enabled := true;
end;

procedure TfrmBackup.btIniciarRestauraClick(Sender: TObject);
var
//  str_comando, nm_usuario, nm_arquivo, TheFileDate : string;
//  arquivo_bat : SYSTEM.TEXT;
//  Fhandle,

  i, n: integer;
begin

  ds_acao := 'restauracao';

  MessageDlg('Selecione o arquivo de backup (.zip).' + chr(13) +
             'Em seguida o sistema informará quais tabelas estão disponíveis para restauração.', mtInformation, [mbOK], 0);

  If (odRestaurar.Execute = true) AND (odRestaurar.FileName <> '') then
    begin
      try

        Cursor := crSQLWait;

        // Caminho completo do arquivo que
        ds_path := odRestaurar.FileName;

        // Leitura das DLLs
        zm.DLLDirectory := ExtractFilePath(ParamStr(0)) + 'dlls';

        // Definição de qual arquivo.zip será descompactado
        zm.ZipFileName := ds_path;

        // Nome do arquivo
        zm.FSpecArgs.Add('*.*');

        if DirectoryExists(ExtractFilePath(ParamStr(0)) + 'temp') <> true then
          begin
            CreateDir(ExtractFilePath(ParamStr(0)) + 'temp');
          end;

        with TFileListBox.Create(frmBackup) do
          begin
            Visible := false;
            Parent := frmBackup;
            Refresh;
            Mask := '*.sql';
            Directory := ExtractFilePath(ParamStr(0)) + 'temp';
            n := ComponentIndex;
          end;

        for i := 0 to TFileListBox(Components[n]).Count - 1 do
          begin // for i := 0 to flltxTabelas.Count
            DeleteFile(ExtractFilePath(ParamStr(0)) + 'temp\' + TFileListBox(Components[n]).Items[i]);
          end;// for i := 0 to flltxTabelas.Count

        frmBackup.Components[n].Destroy;

        // Diretório onde serão descompactados todos os arquivos
        zm.ExtrBaseDir := ExtractFilePath(ParamStr(0)) + 'temp';

        // Se o arquivo .sql já existir, apage-os
        zm.ExtrOptions := zm.ExtrOptions + [ExtrOverwrite];

        // Lendo a DLL de descompactação
        zm.Active  := True;

        Cursor := crHourGlass;

        fwBackupDescomp.Show;

        // Descompactação
        zm.Extract;

        fwBackupDescomp.Close;

        Cursor := crDefault;

        // Liberando a DLL de descompactação
        zm.Active := False;

        SetLength(aTabelas, 0);

        with TFileListBox.Create(frmBackup) do
          begin
            Visible := false;
            Parent := frmBackup;
            Refresh;
            Mask := '*.sql';
            Directory := ExtractFilePath(ParamStr(0)) + 'temp';
            n := ComponentIndex;
          end;

        for i := 0 to TFileListBox(Components[n]).Count - 1 do
          begin // for i := 0 to flltxTabelas.Count
            SetLength(aTabelas, i + 1);
            aTabelas[i] := Copy(TFileListBox(Components[n]).Items[i], 1, (length(TFileListBox(Components[n]).Items[i]) - 4));
          end; // for i := 0 to flltxTabelas.Count

        frmBackup.Components[n].Destroy;

        if Length(aTabelas) >= 1 then
          begin

            // chama o form para a seleção das tabelas

            Cursor := crDefault;

            if not Assigned(fdBackupTabelas) then
            begin
               Application.CreateForm(TfdBackupTabelas, fdBackupTabelas);
            end;

            fdBackupTabelas.ShowModal;

            if fdBackupTabelas.ModalResult = mrOk then
              begin
                fdBackupProgresso.show;

                Cursor := crSQLWait;
                  fdBackupProgresso.backup(fdBackupTabelas.cbBases.Text, ds_host, ds_porta, ds_usuario, ds_senha, ds_path, ds_acao, aTabelas, true);
                Cursor := crDefault;

                fdBackupProgresso.Close;
              end;

          end
        else // Length(aTabelas) > 1
          begin
            beep;
            MessageDlg('Não existe arquivos válidos para a restauração!', mtError, [mbOK], 0);
            Cursor := crDefault;
          end; // Length(aTabelas) > 1

      except
        beep;
        MessageDlg('Não foi possível descompactar o arquivo!', mtError, [mbOK], 0);
        Cursor := crDefault;
      end;
    end;
end;

procedure TfrmBackup.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  if Cursor = crSQLWait then Exit;
  CanClose := True;
end;

procedure TfrmBackup.FormDestroy(Sender: TObject);
begin
   frmBackup := nil;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
var
  bck_data, bck_hora, bck_intervalo, bck_tipo : string;
begin
  bck_data := DM.variavel_parametro('backup_data');
  bck_hora := DM.variavel_parametro('backup_hora');
  //bck_qtd_dias := DM.variavel_parametro('backup_qtd_dias');
  bck_intervalo := DM.variavel_parametro('backup_intervalo');
  bck_tipo := DM.variavel_parametro('backup_tipo');

  if (bck_hora = '') OR (bck_intervalo = '') then
    lbAgendamento.Caption := 'Não há backup agendado. Para agendar clique ao lado no botão Agendar...'
  else
  begin
    if bck_tipo = BKP_DIARIO then
      lbAgendamento.Caption := 'O backup está agendado para ser executado às '+bck_hora+', a cada '+bck_intervalo+' dia(s). O último backup foi executado em: '+bck_data
    else if bck_tipo = BKP_HORA then
      lbAgendamento.Caption := 'O backup está agendado para ser executado às '+bck_hora+', a cada '+bck_intervalo+' hora(s). O último backup foi executado em: '+bck_data+' há '+bck_intervalo+' hora'
    else
      lbAgendamento.Caption := 'O backup está agendado para ser executado às '+bck_hora+', a cada '+bck_intervalo+' dia(s). O último backup foi executado em: '+bck_data;
  end;

end;

procedure TfrmBackup.BitBtn1Click(Sender: TObject);
begin
  if Mensagem( 'Deseja cancelar o backup automático da base de dados ?'+chr(13)+'OBS.: Você poderá agendar novamente o backup quando quiser.', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
     DM.set_variavel_parametro('backup_hora','');
     CancelaInicializacao(Application.ExeName+' backup', 'UNIMESTRE - Backup Automático');
     Mensagem( 'O backup automático foi cancelado !', Application.Title, MB_OK + MB_ICONINFORMATION );
  end;
end;

procedure TfrmBackup.btAgendarClick(Sender: TObject);
begin
   if not Assigned(frmAgendarBackup) then
   begin
      Application.CreateForm(TfrmAgendarBackup, frmAgendarBackup);
   end;
   frmAgendarBackup.ShowModal;
end;

end.
