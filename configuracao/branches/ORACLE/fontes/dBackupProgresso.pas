unit dBackupProgresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Gauges, ExtCtrls, uBackup, Buttons, FileCtrl, DB,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ZipMstr19;

type
  tabelas = array of string;
  TfdBackupProgresso = class(TForm)
    Panel1: TPanel;
    lbProgresso: TLabel;
    ggProgresso: TGauge;
    lbProcedimento: TLabel;
    qyUsuarioBackup: TUMZQuery;
    qySenha: TUMZQuery;
    zm: TZipMaster19;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure backup(base, ds_host, porta, ds_usuario, ds_senha, ds_path, ds_acao:string; aTabelas:array of string; visual : boolean);
  end;

var
  fdBackupProgresso: TfdBackupProgresso;
  nm_usuario : string;

implementation

uses uDM, uBaseDados, Math, dBackupSelTabs, unBackupAgendado;

{$R *.dfm}

procedure TfdBackupProgresso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Action := caFree;
end;

procedure TfdBackupProgresso.FormDestroy(Sender: TObject);
begin
   fdBackupProgresso := nil;
end;

procedure TfdBackupProgresso.FormShow(Sender: TObject);
begin

  // Iniciando o processo
  lbProcedimento.Caption := 'Inciando processo!';

  // Definindo as posições do progresso
  if ds_acao = 'backup' then
    begin
      ggProgresso.MaxValue := (Length(aTabelas)+1);
    end
  else
    begin
      ggProgresso.MaxValue := (Length(aTabelas));
    end;

  ggProgresso.Progress := 0;

  // Guardando usuário
  nm_usuario := DM.tblUsuariosNome.FieldByName('nome').AsString;

  DM.db.Disconnect;
  DM.db.Connect;
end;

procedure TfdBackupProgresso.backup(base, ds_host, porta, ds_usuario, ds_senha, ds_path, ds_acao:string; aTabelas:array of string; visual : boolean);
var
  Fhandle            : integer;
  i                  : integer;
  n                  : integer;
  y                  : integer;
  FilePath           : string;
  str_comando        : string;
  nm_arquivo         : string;
  TheFileDate        : string;
  arquivoBackupado   : string;
  arquivo_bat        : TextFile;
begin
  //Inicialização das variáveis
  Fhandle            := 0;
  i                  := 0;
  n                  := 0;
  y                  := 0;
  str_comando        := '';
  nm_arquivo         := '';
  TheFileDate        := '';
  arquivoBackupado   := '';
  AssignFile(arquivo_bat, '');
  //Inicialização das variáveis
  
  ggProgresso.MaxValue := Length(aTabelas);

  if ds_acao = 'backup' then // ds_acao = 'backup'
    begin

      try
        // Status do backup
        lbProcedimento.Caption := 'Lendo arquivos dll...';
        if not visual then begin
          frmBackupAgendado.trayUniMestreBackup.BalloonHint := lbProcedimento.Caption;
          frmBackupAgendado.trayUniMestreBackup.ShowBalloonHint;
        end;

        // Leitura das DLLs
        zm.DLLDirectory := ExtractFilePath(ParamStr(0)) + 'dlls';

        zm.ZipFileName := ds_path;

        if visual then begin
          frmBackup.mLog.Lines.Clear;

          // Cabeçalho do arquivo de log
          frmBackup.mLog.Lines.Add(frmBaseDados.completar_string('', '#', 'D', 150));
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('# UNIMESTRE - CONFIGURAÇÕES E MANUTENÇÃO' + frmBaseDados.completar_string('', ' ', 'D', 89) + DateToStr(date) + ' ' + TimeToStr(time) + ' #');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 57) + frmBaseDados.completar_string('  BACKUP', ' ', 'D', 10) + ' BASE DE DADOS UNIMESTRE' + frmBaseDados.completar_string('', ' ', 'E', 57) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', '-', 'D', 148) + '#');
        end;

        // Verifica a existência do diretório temporário
        if not DirectoryExists( ExtractFilePath(ParamStr(0)) + 'temp' ) then
          begin
            // Status do backup
            lbProcedimento.Caption := 'Criando pasta temporária...';
            if not visual then begin
              frmBackupAgendado.trayUniMestreBackup.BalloonHint := lbProcedimento.Caption;
              frmBackupAgendado.trayUniMestreBackup.ShowBalloonHint;
            end;

            // Caso não exista, crie um sub diretório temp na pasta do executável
            CreateDir( ExtractFilePath(ParamStr(0)) + 'temp' );

            if visual then begin
              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' Pasta temporária inexistente! Criação executada!', ' ', 'D', 148) + '#');
            end;
          end;

        if visual then begin
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' Host: ' + ds_host, ' ', 'D', 148) + '#');

          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' Criação do(s) arquivo(s) temporário(s): ', ' ', 'D', 148) + '#');

          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  INÍCIO: ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');
        end;

        // For no array que indica quais tabelas serão backupeadas
        for i := low(aTabelas) to high(aTabelas) do
          begin

            // Gerando arquivos temporários .sql
            lbProcedimento.Caption := 'Gerando tabela "' + aTabelas[i] + '"...';
            if not visual then begin
              frmBackupAgendado.trayUniMestreBackup.BalloonHint := lbProcedimento.Caption;
              frmBackupAgendado.trayUniMestreBackup.ShowBalloonHint;
            end;

            zm.FSpecArgs.Add(ExtractFilePath(ParamStr(0)) + 'temp\' + aTabelas[i] + '.sql');

            // Path temporário para a criação do arquivo .SQL
            ds_path_temp := ExtractFilePath(ParamStr(0)) + 'temp\' + aTabelas[i] + '.sql';

            // Comando para fazer a compactação utilizando o software mysqldump
            // "\\96.0.0.69\discos\backup\mysqldump" unimestre tabela -h 96.0.0.68 --add-drop-table -a -c -r "\\96.0.0.69\discos\backup\temp\b040128_154850.sql" -u academico --password=UniMestreProSurf
            str_comando := '"' + DM.GetShortFileName(ExtractFilePath(ParamStr(0))) + 'mysqldump" --extended-insert --max_allowed_packet=10M -C -K --hex-blob --protocol=tcp --triggers -R '+base+' ' + aTabelas[i] + ' -h ' + ds_host + ' -P ' + porta +
                        ' --add-drop-table -a -r "' + DM.GetShortFileName(ExtractFilePath(ParamStr(0))) +
                        'temp\' + ExtractFileName(ds_path_temp) + '" -u ' + ds_usuario;


            // Verifica a digitação de senha
            if ds_senha <> '' then
              begin
                str_comando := str_comando + ' --password=' + ds_senha;
              end;

            // cria um arquivo .bat com todos os parâmetros para
            //   a execução do mysqldump

            AssignFile(arquivo_bat, ExtractFilePath(ParamStr(0)) + 'backup.bat' );
            Rewrite(arquivo_bat);

            for y := 0 to (Ceil(Length(str_comando) / 120) -1) do
              begin
                Write(arquivo_bat, Copy(str_comando, (1 + (y * 120)), 120));  // Grava a linha de comando
              end;

            CloseFile(arquivo_bat); // Fecha o arquivo

            if visual then begin
              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('   Tabela "' + aTabelas[i] + '"', ' ', 'D', 148) + '#');

              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('     INÍCIO: ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');
            end;

            // Executa o arquivo .bat e aguarda a finalização do mesmo
            DM.Executa(ExtractFilePath(ParamStr(0)) + 'backup.bat' );

            if visual then begin
              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('     FIM:    ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');
            end;

            arquivoBackupado := ExtractFilePath(ParamStr(0)) + 'temp\' + ExtractFileName(ds_path_temp);
            //identifica se fez backup de uma tabela ou de uma view
                                                                   

            // Se o arquivo não existir
            if not FileExists( arquivoBackupado ) then // not FileExists
              begin

                if visual then begin
                  // Arquivo de Log
                  frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' ERRO! Arquivo temporário não foi gerado corretamente.', ' ', 'D', 148) + '#');

                  qyUsuarioBackup.Close;
                  qyUsuarioBackup.ParamByName('usuario').AsString := DM.variavel_parametro('backup_usuario');

                  if ds_host <> 'localhost' then
                    begin
                      qyUsuarioBackup.ParamByName('host').AsString := '%';
                    end
                  else
                    begin
                      qyUsuarioBackup.ParamByName('host').AsString := ds_host;
                    end;

                  qyUsuarioBackup.Open;

                  if qyUsuarioBackup.Eof then // Não existe o usuário para o host
                    begin
                      frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('    Certifique-se da existência do usuário "' + ds_usuario +
                                               '" para o host "' + ds_host + '".', ' ', 'D', 148) + '#');
                    end
                  else // Existe o usuário
                    begin
                      qySenha.Open; // Retorna a senha do usuário de backup

                      if qySenha.FieldByName('ds_valor').AsString <> qyUsuarioBackup.FieldByName('password').AsString then
                        begin
                          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('    Senha incorreta do usuário "' + ds_usuario +
                                                   '" para o host "' + ds_host + '".', ' ', 'D', 148) + '#');
                        end
                      else
                        begin
                          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('    ERRO desconhecido!', ' ', 'D', 148) + '#');
                        end;
                    end;

                qySenha.Close;
                qyUsuarioBackup.Close;

                beep;
                MessageDlg('Erro ao gerar o arquivo temporário de backup!' + chr(13) + 'O processo não foi concluído com sucesso!', mtError, [mbOK], 0);
              end;
              exit;
            end; // not FileExists

            ggProgresso.Progress := (i + 1);
          end;

        if visual then begin
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  FIM:    ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');
        end;

        // Apaga o arquivo backup.bat
        DeleteFile(ExtractFilePath(ParamStr(0)) + 'backup.bat' );

        lbProcedimento.Caption := 'Compactando arquivos...';
        if not visual then begin
          frmBackupAgendado.trayUniMestreBackup.BalloonHint := lbProcedimento.Caption;
          frmBackupAgendado.trayUniMestreBackup.ShowBalloonHint;
        end;

        if visual then begin
          // Gerando arquivos temporários .sql

          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' Compactando arquivos: ', ' ', 'D', 148) + '#');

          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  INÍCIO: ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');
        end;

        // Lê o arquivo DLL
        zm.Active := True;

        zm.AddOptions := [AddMove];     // Mover os arquivos

        // Compactação de fato dos arquivos
        zm.Add;

        // Libera o arquivo DLL
        zm.Active := False;

        if zm.SuccessCnt < 1 then // Não adicionou nenhum arquivo
          begin
            if visual then begin
              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');

              frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' Erro ao compactar o arquivo.', ' ', 'D', 148) + '#');

              frmBackup.mLog.Lines.Add(frmBaseDados.completar_string('', '#', 'D', 150));
              frmBackup.mLog.Lines.Add(chr(13));
              frmBackup.mLog.Lines.Add(' USUÁRIO:   ' + nm_usuario);
              frmBackup.mLog.Lines.Add(' CONCLUSÃO: ' + DateToStr(date) + ' ' + TimeToStr(time));
            end;

            // Posicionando o cursor na tabela de usuários
            DM.tblUsuariosNome.Close;
              DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
            DM.tblUsuariosNome.Open;

            if visual then begin
              MessageDlg('Erro ao compactar o arquivo!', mtError, [mbOK], 0);
            end;

          end;

        if visual then begin
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  FIM:    ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');
        end;

        ggProgresso.Progress := ggProgresso.Progress + 1;

         // Compactação dos arquivos temporários
        lbProcedimento.Caption := 'Finalizado!';
        if not visual then begin
          frmBackupAgendado.trayUniMestreBackup.BalloonHint := lbProcedimento.Caption;
          frmBackupAgendado.trayUniMestreBackup.ShowBalloonHint;
        end;

        if visual then begin
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' Arquivo gerado em:', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  ' + ds_path, ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  ' + FloatToStrF( (DM.TamArquivo( ds_path )/1048476), ffNumber, 6, 3) + ' Mb', ' ', 'D', 148) + '#');
          frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');

          frmBackup.mLog.Lines.Add(frmBaseDados.completar_string('', '#', 'D', 150));
          frmBackup.mLog.Lines.Add(chr(13));
          frmBackup.mLog.Lines.Add(' USUÁRIO:   ' + nm_usuario);
          frmBackup.mLog.Lines.Add(' CONCLUSÃO: ' + DateToStr(date) + ' ' + TimeToStr(time));
        end;

        if visual then begin
          // Nome do arquivo de log para o backup
          nm_arquivo := 'log_' + copy(ExtractFileName(ds_path), 1, (Length(ExtractFileName(ds_path)) - 3)) + 'uni';

          // Salvando o arquivo
          frmBackup.mLog.Lines.SaveToFile(nm_arquivo);
        end;

        // Posicionando o cursor na tabela de usuários
        DM.tblUsuariosNome.Close;
        DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
        DM.tblUsuariosNome.Open;

        Application.ProcessMessages;

        if visual then begin
          beep;
          MessageDlg('Backup finalizado com sucesso!', mtInformation, [mbOK], 0);
        end;

        with DM.qyAux do begin
          Close();
          SQL.Text := 'UPDATE parametros SET ds_valor = DATE_FORMAT(now(),''%d/%m/%Y'') WHERE ds_variavel = :parametro';
          ParamByName('parametro').AsString := 'backup_data';
          ExecSQL();
        end;

      except
        if visual then begin
          beep;
        end;

        // Posicionando o cursor na tabela de usuários
        DM.tblUsuariosNome.Close;
          DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
        DM.tblUsuariosNome.Open;

        if visual then begin
          MessageDlg('Não foi possível concluir o backup corretamente!' + chr(13) + 'Verifique os parâmetros digitados!', mtError, [mbOk], 0);
        end;

      end;

    end
  else // ds_acao <> 'backup', logo ds_acao = restauracao
    begin

      try
        lbProcedimento.Caption := 'Iniciando o processo de restauração...';

        frmBackup.mLog.Lines.Clear;

        // Cabeçalho do arquivo de log
        frmBackup.mLog.Lines.Add(frmBaseDados.completar_string('', '#', 'D', 150));
        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
        frmBackup.mLog.Lines.Add('# UNIMESTRE - CONFIGURAÇÕES E MANUTENÇÃO' + frmBaseDados.completar_string('', ' ', 'D', 89) + DateToStr(date) + ' ' + TimeToStr(time) + ' #');
        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 57) + frmBaseDados.completar_string(' RESTAURAR', ' ', 'D', 10) + ' BASE DE DADOS UNIMESTRE' + frmBaseDados.completar_string('', ' ', 'E', 57) + '#');
        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', '-', 'D', 148) + '#');

        // Descobrindo a data e a hora de gravação do arquivo de backup
        FHandle := FileOpen(ds_path, 0);
        TheFileDate := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
        FileClose(FHandle);

        if MessageDlg('CUIDADO! Continuar o processo de restauração perderá todos' + chr(13) +
                      'os dados digitados depois de ' + TheFileDate + '!' + chr(13) +
                      'ATENÇÃO: Esta é sua última chance de cancelar a operação!' + chr(13) +
                      'Confirma a restauração do backup?', mtConfirmation, [mbNo, mbYes], 0) = mryes then
          begin // Confirmação da restauração

            frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  INÍCIO: ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');

            // Verificando a possibilidade de ERRO!
            qyUsuarioBackup.Close;
              qyUsuarioBackup.ParamByName('usuario').AsString := DM.variavel_parametro('backup_usuario');

            if ds_host <> 'localhost' then
              begin
                qyUsuarioBackup.ParamByName('host').AsString := '%';
              end
            else
              begin
                qyUsuarioBackup.ParamByName('host').AsString := ds_host;
              end;

            qyUsuarioBackup.Open;

            if qyUsuarioBackup.Eof then // Não existe o usuário para o host
              begin
                frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('    ERRO na restauração do BACKUP!', ' ', 'D', 148) + '#');
                frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('      Certifique-se da existência do usuário "' + ds_usuario +
                                         '" para o host "' + ds_host + '".', ' ', 'D', 148) + '#');
              end
            else // Existe o usuário
              begin
                qySenha.Open; // Retorna a senha do usuário de backup

                if qySenha.FieldByName('ds_valor').AsString <> qyUsuarioBackup.FieldByName('password').AsString then
                  begin
                    frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('    ERRO na restauração do BACKUP!', ' ', 'D', 148) + '#');
                    frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('      Senha incorreta do usuário "' + ds_usuario +
                                             '" para o host: "' + ds_host + '".', ' ', 'D', 148) + '#');
                  end
                else // Senha correta, verifique os privilégios
                  begin
                    if ((qyUsuarioBackup.FieldByName('Select_priv').AsString <> 'Y') or
                        (qyUsuarioBackup.FieldByName('Insert_priv').AsString <> 'Y') or
                        (qyUsuarioBackup.FieldByName('Update_priv').AsString <> 'Y') or
                        (qyUsuarioBackup.FieldByName('Delete_priv').AsString <> 'Y') or
                        (qyUsuarioBackup.FieldByName('Create_priv').AsString <> 'Y') or
                        (qyUsuarioBackup.FieldByName('Drop_priv').AsString <> 'Y')) then
                      begin
                        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('    ERRO na restauração do BACKUP!', ' ', 'D', 148) + '#');
                        frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('      O usuário "' + ds_usuario +
                                                 '" para o host "' + ds_host + '" não possui os privilégios necessários!', ' ', 'D', 148) + '#');
                      end;

                    end;
                  end;

                  qySenha.Close;
                  qyUsuarioBackup.Close;

            // For no array que indica quais tabelas serão backupeadas
            for i := low(aTabelas) to high(aTabelas) do
              begin

                // Gerando arquivos temporários .sql
                lbProcedimento.Caption := 'Restaurando tabela "' + aTabelas[i] + '"...';

                frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
                frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('   Tabela "' + aTabelas[i] + '"', ' ', 'D', 148) + '#');

                frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('     INÍCIO: ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');

                // Path temporário para a criação do arquivo .SQL
                ds_path_temp := ExtractFilePath(ParamStr(0)) + 'temp\' + aTabelas[i] + '.sql';

                // Comando para fazer a descompactação utilizando o software mysql
                // mysql unimestre -h localhost -e "source b040114_164630.sql" -u academico --password=UniMestreProSurf

                FilePath := StringReplace(DM.GetShortFileName(ExtractFilePath(ParamStr(0))), '\', '/', [rfReplaceAll]) + 'temp/' + aTabelas[i] + '.sql';
                str_comando := '"' + DM.GetShortFileName(ExtractFilePath(ParamStr(0))) + 'mysql" '+base+' -h ' + ds_host + ' -P ' + porta +
                               ' --execute="SET GLOBAL log_bin_trust_function_creators = 1; source ' + FilePath + ';" -u ' + ds_usuario;

                // Verifica a digitação de senha
                if ds_senha <> '' then
                  begin
                    str_comando := str_comando + ' --password=' + ds_senha;
                  end;

                // cria um arquivo .bat com todos os parâmetros para
                //   a execução do mysqlimport
                AssignFile(arquivo_bat, ExtractFilePath(ParamStr(0)) + 'restaura.bat' );
                Rewrite(arquivo_bat);

                for y := 0 to (Ceil(Length(str_comando) / 120) -1) do
                  begin
                    Write(arquivo_bat, Copy(str_comando, (1 + (y * 120)), 120));
                    // Grava a linha de comando
                  end;

                // writeln(arquivo_bat, str_comando);  // Grava a linha de comando

                CloseFile(arquivo_bat); // Fecha o arquivo

                // Executa o arquivo .bat e aguarda a finalização do mesmo
                DM.Executa(ExtractFilePath(ParamStr(0)) + 'restaura.bat' );

                frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('     FIM:    ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');

                ggProgresso.Progress := (i + 1);
              end;

            // Apaga o arquivo backup.bat
            DeleteFile(ExtractFilePath(ParamStr(0)) + 'restaura.bat' );

            frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
            frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('  FIM:    ' + DateToStr(date) + ' ' + TimeToStr(time), ' ', 'D', 148) + '#');

            frmBackup.mLog.Lines.Add(frmBaseDados.completar_string('', '#', 'D', 150));
            frmBackup.mLog.Lines.Add(chr(13));
            frmBackup.mLog.Lines.Add(' USUÁRIO:   ' + nm_usuario);
            frmBackup.mLog.Lines.Add(' CONCLUSÃO: ' + DateToStr(date) + ' ' + TimeToStr(time));

          end // Confirmação da restauração
        else
          begin // Confirmação da restauração

            frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');
            frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string(' RESTAURAÇÃO CANCELADA!', ' ', 'D', 148) + '#');
            frmBackup.mLog.Lines.Add('#' + frmBaseDados.completar_string('', ' ', 'D', 148) + '#');

            frmBackup.mLog.Lines.Add(frmBaseDados.completar_string('', '#', 'D', 150));
            frmBackup.mLog.Lines.Add(chr(13));
            frmBackup.mLog.Lines.Add(' USUÁRIO:   ' + nm_usuario);
            frmBackup.mLog.Lines.Add(' CONCLUSÃO: ' + DateToStr(date) + ' ' + TimeToStr(time));

            with TFileListBox.Create(fdBackupProgresso) do
              begin
                Visible := false;
                Parent := fdBackupProgresso;
                Refresh;
                Mask := '*.sql';
                Directory := ExtractFilePath(ParamStr(0)) + 'temp';
                n := ComponentIndex;
              end;

            for i := 0 to TFileListBox(Components[n]).Count - 1 do
              begin // for i := 0 to flltxTabelas.Count
                DeleteFile(ExtractFilePath(ParamStr(0)) + 'temp\' + TFileListBox(Components[n]).Items[i]);
              end; // for i := 0 to flltxTabelas.Count

            fdBackupProgresso.Components[n].Destroy;

            MessageDlg('Restauração cancelada!', mtInformation, [mbOk], 0);
            exit;
          end; // Confirmação da restauração

      except
        beep;
        MessageDlg('Não foi possível concluír o restauração do backup!' + chr(13) +
                   'Verifique os parâmetros digitados!', mtError, [mbOk], 0);

        with TFileListBox.Create(fdBackupProgresso) do
          begin
            Visible := false;
            Parent := fdBackupProgresso;
            Refresh;
            Mask := '*.sql';
            Directory := ExtractFilePath(ParamStr(0)) + 'temp';
            n := ComponentIndex;
          end;

        for i := 0 to TFileListBox(Components[n]).Count - 1 do
          begin // for i := 0 to flltxTabelas.Count
            DeleteFile(ExtractFilePath(ParamStr(0)) + 'temp\' + TFileListBox(Components[n]).Items[i]);
          end; // for i := 0 to flltxTabelas.Count

        fdBackupProgresso.Components[n].Destroy;


        // Posicionando o cursor na tabela de usuários
        DM.tblUsuariosNome.Close;
          DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
        DM.tblUsuariosNome.Open;

        exit;
      end;

        // Status
        lbProcedimento.Caption := 'Finalizando...';

        with TFileListBox.Create(fdBackupProgresso) do
          begin
            visible := false;
            Parent := fdBackupProgresso;
            Refresh;
            Mask := '*.sql';
            Directory := ExtractFilePath(ParamStr(0)) + 'temp';
            n := ComponentIndex;
          end;

        for i := 0 to TFileListBox(Components[n]).Count - 1 do
          begin // for i := 0 to flltxTabelas.Count
            DeleteFile(ExtractFilePath(ParamStr(0)) + 'temp\' + TFileListBox(Components[n]).Items[i]);
          end; // for i := 0 to flltxTabelas.Count

        fdBackupProgresso.Components[n].Destroy;

        // Nome do arquivo de log para o backup
        nm_arquivo := 'restaura_' + copy(ExtractFileName(ds_path), 2, (Length(ExtractFileName(ds_path)) - 4)) + 'uni';

        // Salvando o arquivo
        frmBackup.mLog.Lines.SaveToFile(nm_arquivo);

        Application.ProcessMessages;

        // Posicionando o cursor na tabela de usuários
        DM.tblUsuariosNome.Close;
          DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
        DM.tblUsuariosNome.Open;

        // Status
        lbProcedimento.Caption := 'Finalizado!!!';

        beep;
        MessageDlg('Restauração finalizada com sucesso!', mtInformation, [mbOK], 0);

    end;

end;

end.
