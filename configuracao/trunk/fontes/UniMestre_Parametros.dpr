program UniMestre_Parametros;
uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uSplash in 'uSplash.pas' {frmSplash},
  uSenha in 'uSenha.pas' {frmSenha},
  uDataHoje in 'uDataHoje.pas' {frmDataHoje},
  uParametros in 'uParametros.pas' {frmParametros},
  General in 'General.pas',
  uOnline in 'uOnline.pas' {frmOnline},
  uBaseDados in 'uBaseDados.pas' {frmBaseDados},
  uBackup in 'uBackup.pas' {frmBackup},
  uBackupSenha in 'uBackupSenha.pas' {frmBackupSenha},
  ucCategorias in 'ucCategorias.pas' {fcCategorias},
  uCenso in 'uCenso.pas' {frmCenso},
  dBackupSelTabs in 'dBackupSelTabs.pas' {fdBackupTabelas},
  dBackupProgresso in 'dBackupProgresso.pas' {fdBackupProgresso},
  wBackupDescomp in 'wBackupDescomp.pas' {fwBackupDescomp},
  uSenhas in 'uSenhas.pas' {frmSenhas},
  uSel_Pessoas in 'uSel_Pessoas.pas' {frm_Sel_Pessoa},
  uSelTurmas in 'uSelTurmas.pas' {frmSelTurmas},
  uSelCursos in 'uSelCursos.pas' {frmSelCursos},
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  uAgendarBackup in 'uAgendarBackup.pas' {frmAgendarBackup},
  unBAckupAgendado in 'unBAckupAgendado.pas' {frmBackupAgendado};

{$R *.res}
{$R ZipMsgUS.RES}

begin
  Application.Initialize;
  Application.Title := 'UNIMESTRE - Configurações e Manutenção';

  Application.CreateForm(TDM, DM);
  if ParamStr(1) = 'backup' then begin
    Application.CreateForm(TfrmBackupAgendado, frmBackupAgendado);
  end
  else begin
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.CreateForm(TfrmSenha, frmSenha);
    Application.CreateForm(TfrmDataHoje, frmDataHoje);
    Application.CreateForm(TfrmBackupSenha, frmBackupSenha);
    Application.CreateForm(TfcCategorias, fcCategorias);
    Application.CreateForm(TfdBackupTabelas, fdBackupTabelas);
    Application.CreateForm(TfdBackupProgresso, fdBackupProgresso);
    Application.CreateForm(TfwBackupDescomp, fwBackupDescomp);
    Application.CreateForm(Tfrm_Sel_Pessoa, frm_Sel_Pessoa);
    Application.CreateForm(TfrmSelTurmas, frmSelTurmas);
    Application.CreateForm(TfrmSelCursos, frmSelCursos);
    Application.CreateForm(TfrmAgendarBackup, frmAgendarBackup);
  end;
  
  Application.Run;
end.
