unit dBackupSelTabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uDM, DB, DBTables, StdCtrls, CheckLst, Buttons, uBackup, Registry, General;

type
  TfdBackupTabelas = class(TForm)
    pnAcao: TPanel;
    qyTabelas: TQuery;
    Panel2: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ckltxTabelas: TCheckListBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    lePath: TLabeledEdit;
    sdSalvar: TSaveDialog;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    sbProcurar: TSpeedButton;
    BitBtn1: TBitBtn;
    btConfirmar: TBitBtn;
    qyBases: TQuery;
    Panel1: TPanel;
    Label1: TLabel;
    cbBases: TComboBox;
    leHost: TLabeledEdit;
    lePort: TLabeledEdit;
    procedure FormDestroy(Sender: TObject);
    procedure cbBasesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelecaoCheckListBox(Sender: TObject; sn_condicao: boolean);
    procedure sbMarcarClick(Sender: TObject);
    procedure sbDesmarcarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure sbProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   fdBackupTabelas   : TfdBackupTabelas;

implementation

uses uBaseDados;

{$R *.dfm}

procedure TfdBackupTabelas.FormDestroy(Sender: TObject);
begin
   fdBackupTabelas := nil;
end;

procedure TfdBackupTabelas.FormShow(Sender: TObject);
var
//  aTabelas : array of Integer;
  i : integer;
  presente: TDateTime;
  ano, mes, dia, hora, min, sec, msec : Word;
  Registro : TRegistry;
  Raiz : String;
begin
  cbBases.Clear;
  sdSalvar.InitialDir := ExtractFilePath(Application.ExeName);

  Raiz := 'SOFTWARE\ODBC\ODBC.INI\' + DM.db.AliasName;

  Registro := TRegistry.Create;
  with Registro do begin

    RootKey := HKEY_LOCAL_MACHINE;

    // Somente abre se a chave existir
    if not (OpenKey (Raiz, False)) then begin
      RootKey := HKEY_CURRENT_USER;
      if not (OpenKey (Raiz, False)) then begin
        Mensagem('Não foi possível encontrar a chave do ODBC que contém o IP do servidor !', Application.Title, MB_OK + MB_ICONERROR);
        fdBackupTabelas.ModalResult := mrCancel;
        Close();
      end;
    end;

    // Envia as informações ao form, vendo se os valores existem, primeiramente...
    if not ValueExists('Server') then begin
      Mensagem('Não foi possível encontrar a chave do ODBC que contém o IP do servidor !', Application.Title, MB_OK + MB_ICONERROR);
      fdBackupTabelas.ModalResult := mrCancel;
      Close();
    end
    else begin
      leHost.Text := ODBCInfo('Server');
      leHost.Enabled := False;
      lePort.Text := ODBCInfo('Port');
      lePort.Enabled := False;
    end;

    // Fecha a chave e o objeto
    Registro.CloseKey;
    Registro.Free;

  end;

  if ds_acao = 'backup' then // Se for uma solicitação de backup
    begin

      lePath.Enabled := true;
      sbProcurar.Enabled := true;

      SetLength(aTabelas, 0);

      // Define a ação
      pnAcao.Caption := 'BACKUP';

    end

  else
    begin

      // Define a ação
      pnAcao.Caption := 'RESTAURAÇÃO';

      lePath.Text := '';
      lePath.Enabled := false;
      sbProcurar.Enabled := false;
      //leHost.Text := DM.variavel_parametro('backup_host_restaura');

    end;

      // Lista as tabelas da base dispóníveis para
      //  fazer backup
      qyBases.Close;
        qyBases.SQL.Clear;
        qyBases.SQL.Text := 'SHOW DATABASES';
      qyBases.Open;


      while not qyBases.Eof do begin

        if (
          qyBases.FieldByName('Database').AsString <> 'mysql') AND (
            (Copy(qyBases.FieldByName('Database').AsString,1,9)='unimestre') OR
            (Copy(qyBases.FieldByName('Database').AsString,1,2)='um')
          )
        then begin

          cbBases.Items.Add(qyBases.FieldByName('Database').AsString);

        end;

        qyBases.Next;
      end;

      cbBases.ItemIndex := 0;
      cbBasesChange(nil);

end;

procedure TfdBackupTabelas.SelecaoCheckListBox(Sender: TObject;
  sn_condicao: boolean);
var
  i : integer;
begin

  for i := 0 to (ckltxTabelas.Count - 1) do
    begin
      ckltxTabelas.Checked[i] := sn_condicao;
    end;

end;

procedure TfdBackupTabelas.sbMarcarClick(Sender: TObject);
begin
  SelecaoCheckListBox(Sender, true);
end;

procedure TfdBackupTabelas.sbDesmarcarClick(Sender: TObject);
begin
  SelecaoCheckListBox(Sender, false);
end;

procedure TfdBackupTabelas.btConfirmarClick(Sender: TObject);
var
  i, y, qtdeViews : integer;
begin

  if leHost.Text = '' then
    begin
      MessageDlg('Complete o campo host.', mtInformation, [mbOk], 0);
      leHost.SetFocus;
      ModalResult := mrNone;
      abort;
    end;

  if ds_acao = 'backup' then
    begin

      if lePath.Text = '' then
        begin
          MessageDlg('Complete o campo caminho.', mtInformation, [mbOk], 0);
          lePath.SetFocus;
          ModalResult := mrNone;
          abort;
        end;

      y := 1; // Esta variável indica o índice do array

      for i := 0 to (ckltxTabelas.Count - 1) do
        begin
          if ckltxTabelas.Checked[i] = true then
            begin
              SetLength( aTabelas, y );
              aTabelas[y-1] := Trim(Copy(ckltxTabelas.Items.Strings[i],Pos('-',ckltxTabelas.Items.Strings[i])+1));
              inc(y);
            end;
        end;

      qyTabelas.Close;

      if Length(aTabelas) < 1 then
        begin
          MessageDLG('Selecione pelo menos uma tabela para backupear.', mtError, [mbOK], 0);
          ModalResult := mrNone;
          abort;
        end;

      ds_host := leHost.Text;
      ds_path := lePath.Text;
      ds_porta := lePort.Text;
      ds_senha := DM.variavel_parametro('backup_senha');
      ds_usuario := DM.variavel_parametro('backup_usuario');

    end
  else // Se a solicitação for restauração
    begin

      SetLength( aTabelas, 0 );

      y := 1; // Esta variável indica o índice do array

      for i := 0 to (ckltxTabelas.Count - 1) do
        begin
          if ckltxTabelas.Checked[i] = true then
            begin
              SetLength( aTabelas, y );
              aTabelas[y-1] := ckltxTabelas.Items.Strings[i];
              inc(y);
            end;
        end;

      if Length(aTabelas) < 1 then
        begin
          MessageDLG('Selecione pelo menos uma tabela para restaurar.', mtError, [mbOK], 0);
          ModalResult := mrNone;
          abort;
        end;

      ds_senha := DM.variavel_parametro('backup_senha');
      ds_usuario := DM.variavel_parametro('backup_usuario');
      ds_host := leHost.Text;
      ds_porta := lePort.Text;

    end;


end;

procedure TfdBackupTabelas.sbProcurarClick(Sender: TObject);
begin

  if sdSalvar.Execute = true then
    begin
       lePath.Text := sdSalvar.FileName;
    end;

end;

procedure TfdBackupTabelas.BitBtn1Click(Sender: TObject);
begin
  qyTabelas.Close;
end;

procedure TfdBackupTabelas.cbBasesChange(Sender: TObject);
var
  i            : integer;
  presente     : TDateTime;
  ano          : Word;
  mes          : Word;
  dia          : Word;
  hora         : Word;
  min          : Word;
  sec          : Word;
  msec         : Word;

begin

   if ds_acao = 'backup' then
   begin

      //Inicia variáveis
      i           := 0;
      presente    := 0;
      ano         := 0;
      mes         := 0;
      dia         := 0;
      hora        := 0;
      min         := 0;
      sec         := 0;
      msec        := 0;

      ckltxTabelas.Clear;
      //Inicia variáveis

      //Busca todas as tabelas na base de dados selecionada
      qyTabelas.Close;
      qyTabelas.SQL.Text := 'SELECT TABLE_NAME AS `Name`, TABLE_TYPE AS `Type`'+
      ' FROM `information_schema`.TABLES WHERE TABLE_SCHEMA = '''+cbBases.Items[cbBases.ItemIndex]+''';';
      qyTabelas.Open;
      ckltxTabelas.Items.Clear;
      //Busca todas as tabelas na base de dados selecionada

      //Adiciona o checkbox na lista
      while not qyTabelas.Eof do
      begin
         ckltxTabelas.Items.Add(qyTabelas.Fields[0].AsString);
         inc(i);
         qyTabelas.Next;
      end;
      //Adiciona o checkbox na lista

      // Marcar todas as tabelas para backupear
      sbMarcar.Click;

      // Montando nome do arquivo

      // Extraindo data e hora
      presente := now;

      DecodeDate(presente, ano, mes, dia);
      DecodeTime(presente, hora, min, sec, msec);

      sdSalvar.FileName := 'bck_' + cbBases.Items[cbBases.ItemIndex] + '_';
      sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(dia), '0', 'E', 2);
      sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(mes), '0', 'E', 2);
      sdSalvar.FileName := sdSalvar.FileName + copy(frmBaseDados.completar_string(IntToStr(ano), '0', 'E', 4), 3, 2);
      sdSalvar.FileName := sdSalvar.FileName + '_';
      sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(hora), '0', 'E', 2);
      sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(min), '0', 'E', 2);
      sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(sec), '0', 'E', 2);

      lePath.Text := sdSalvar.InitialDir + '\' + sdSalvar.FileName + '.' + sdSalvar.DefaultExt;
      //leHost.Text := DM.variavel_parametro('backup_host');

   end
   else
   begin
      // Habilita o CheckListBox com as tabelas disponíveis para backup
      ckltxTabelas.Items.Clear;
      ckltxTabelas.Enabled := true;

      for i := low(aTabelas) to High(aTabelas) do
      begin
         ckltxTabelas.Items.Add(aTabelas[i]);
      end;

      // Marcar todas as tabelas para backupear
      sbMarcar.Click;

    end;

end;

end.
