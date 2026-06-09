unit UFAgendamento;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, StdCtrls, Spin, Buttons, Grids,
   DBGrids, DB, DBClient, DBCtrls, UMNavigator, UMySQLDump, FileCtrl, UDM,
   Midas, uUsuario, ZAbstractRODataset, UZDataset, UMAjuda;

type
   TfAgendamento = class(TForm)
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      tlbFerrmnts: TToolBar;
      btnSep1: TToolButton;
      btnAlterar: TToolButton;
      btnSep2: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      btnFechar: TToolButton;
      btnSep4: TToolButton;
      ilFerrmnts: TImageList;
      chkHabitad: TCheckBox;
      rgFrequencia: TRadioGroup;
      lblIntervalo: TLabel;
      speIntervalo: TSpinEdit;
      lblHoraInicio: TLabel;
      dtpHoraInicio: TDateTimePicker;
      lblDiretorio: TLabel;
      edtDiretorio: TEdit;
      sbDiretorio: TSpeedButton;
      lblBancos: TLabel;
      dbgBancos: TDBGrid;
      dsBancos: TDataSource;
      cdsBancos: TClientDataSet;
      cdsBancosDatabase: TStringField;
      dbnBancos: TUMNavigator;
      sbHabilitar: TSpeedButton;
    rgTipoBackup: TRadioGroup;
    LbIgnorada: TLabel;
    DsTabelasIgnoradas: TStringGrid;
    UMAjuda1: TUMAjuda;
    ckbBackupMongo: TCheckBox;
    procedure ckbBackupMongoClick(Sender: TObject);
    procedure rgTipoBackupClick(Sender: TObject);
      procedure sbHabilitarClick(Sender: TObject);
      procedure chkHostBackupClick(Sender: TObject);
      procedure speIntervaloExit(Sender: TObject);
      procedure speIntervaloKeyPress(Sender: TObject; var Key: Char);
      procedure cdsBancosAfterDelete(DataSet: TDataSet);
      procedure FormDestroy(Sender: TObject);
      procedure sbDiretorioClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure edtDiretorioChange(Sender: TObject);
      procedure dtpHoraInicioChange(Sender: TObject);
      procedure speIntervaloChange(Sender: TObject);
      procedure rgFrequenciaClick(Sender: TObject);
      procedure chkHabitadClick(Sender: TObject);
      procedure dsBancosStateChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
   private
      procedure ChangeState(const Editing: Boolean);
      procedure LoadSchedule;
      procedure SaveSchedule;
      procedure listaTabelasIgnoradas;
   end;

var
  fAgendamento: TfAgendamento;

implementation

{$R *.dfm}

procedure TfAgendamento.btnAlterarClick(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.btnCancelarClick(Sender: TObject);
begin
   if cdsBancos.State in [dsInsert, dsEdit] then
      cdsBancos.Cancel;
   LoadSchedule;
   ChangeState(False);
end;

procedure TfAgendamento.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfAgendamento.btnSalvarClick(Sender: TObject);
begin
   if cdsBancos.State in [dsInsert, dsEdit] then
      cdsBancos.Post;
   ChangeState(False);
   SaveSchedule;
end;

procedure TfAgendamento.cdsBancosAfterDelete(DataSet: TDataSet);
begin
   ChangeState(True);
end;

procedure TfAgendamento.ChangeState(const Editing: Boolean);
begin
   if DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Agendamento', npAlterar, True) then
   begin
      btnAlterar.Enabled := not Editing;
      btnSalvar.Enabled := Editing;
      btnCancelar.Enabled := Editing;
      btnFechar.Enabled := not Editing;
      sbHabilitar.Enabled := (not Editing) and (not DM.tiAgenda.Visible) and
         chkHabitad.Checked;
   end;
end;

procedure TfAgendamento.chkHabitadClick(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.chkHostBackupClick(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.ckbBackupMongoClick(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.dsBancosStateChange(Sender: TObject);
begin
   if cdsBancos.State in [dsInsert, dsEdit] then
      ChangeState(True);
end;

procedure TfAgendamento.dtpHoraInicioChange(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.edtDiretorioChange(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsBancos.Close;
   Action := caFree;
end;

procedure TfAgendamento.FormCreate(Sender: TObject);
begin
   DM.Agendado := 1;
   DM.Completo := 0;
   cdsBancos.CreateDataSet;
   cdsBancos.Open;
   LoadSchedule;
   ChangeState(False);
end;

procedure TfAgendamento.FormDestroy(Sender: TObject);
begin
   fAgendamento := nil;
end;

procedure TfAgendamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F3:
         if btnAlterar.Enabled then
            btnAlterar.Click;
      VK_F5:
         if btnSalvar.Enabled then
            btnSalvar.Click;
      VK_F6:
         if btnCancelar.Enabled then
            btnCancelar.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfAgendamento.listaTabelasIgnoradas;
var
   listaTabelas : String;
   i,j : Integer;
   Intaux: Integer;
   ultimaPos : Integer;
   listaAux: TStringList;
begin
   ultimaPos := 1;
   listaAux := TStringList.Create;
   listaAux.Clear;
   { Limpa a stringgrid }
   Intaux := DsTabelasIgnoradas.RowCount;
   for j := 1 to Intaux do
   begin
      if j > 2 then
         DsTabelasIgnoradas.RowCount := DsTabelasIgnoradas.RowCount -1;
   end;
   DsTabelasIgnoradas.FixedRows := 1;

   DM.qryTabelasIgnoradas.close;
   DM.qryTabelasIgnoradas.open;
   listaTabelas :=  DM.qryTabelasIgnoradasDS_VALOR.AsString;

   { Vare o parametro e coloca cada tabela na Stringlist }
   for i := 0 to Length(listaTabelas) do
   begin
      if listaTabelas[i] = ';' then
      begin
         listaAux.Add(Copy(listaTabelas,ultimaPos,(i - ultimaPos)));
         ultimaPos := i +1;
      end;
   end;
   listaAux.Add(Copy(listaTabelas,ultimaPos,(i - ultimaPos)));
   
   { Ordena e passa para a StringGrid }
   listaAux.Sort;
   j := 0;
   DsTabelasIgnoradas.Cells[0,0] := 'Tabela(s)';
   for i := 1 to listaAux.Count do
   begin
      DsTabelasIgnoradas.Cells[0,i] := listaAux[j];
      DsTabelasIgnoradas.RowCount := DsTabelasIgnoradas.RowCount +1 ;
      inc(j);
   end;
   DsTabelasIgnoradas.RowCount := DsTabelasIgnoradas.RowCount -1;

end;

procedure TfAgendamento.LoadSchedule;
var
   I: Integer;
begin
   chkHabitad.Checked := TScheduleManager.GetInstance.Enabled;
   rgFrequencia.ItemIndex := Ord(TScheduleManager.GetInstance.Frequency);
   rgTipoBackup.ItemIndex := DM.Completo;
   speIntervalo.Value := TScheduleManager.GetInstance.Interval;
   if TScheduleManager.GetInstance.StartTime = 0 then
      dtpHoraInicio.Time := Time
   else
      dtpHoraInicio.Time := TScheduleManager.GetInstance.StartTime;
   edtDiretorio.Text := DM.BackupDirectory;
   ckbBackupMongo.Checked := TScheduleManager.GetInstance.Sn_mongo;
   
   cdsBancos.EmptyDataSet;
   for I := 0 to TScheduleManager.GetInstance.Databases.Count - 1 do
   begin
      cdsBancos.Append;
      cdsBancosDatabase.Value := TScheduleManager.GetInstance.Databases.Names[I]
   end;
   if cdsBancos.State = dsInsert then
      cdsBancos.Post;

   if DM.Completo = 1 then
   begin
      LbIgnorada.Visible := true;
      DsTabelasIgnoradas.Visible := true;
      sbHabilitar.Top := 550;
      fAgendamento.Height := 650;
      listaTabelasIgnoradas;
   end
   else
   begin
      LbIgnorada.Visible := false;
      DsTabelasIgnoradas.Visible := false;
      sbHabilitar.Top := 430;
      fAgendamento.Height := 528;
   end;
end;

procedure TfAgendamento.rgFrequenciaClick(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.rgTipoBackupClick(Sender: TObject);
begin
   if DM.Completo <> rgTipoBackup.ItemIndex then
   begin
      DM.Completo := rgTipoBackup.ItemIndex;

      if rgTipoBackup.ItemIndex = 0 then
      begin
         DM.completo_selecionado := True;
      end;

      DM.qryConfig.Close;
      DM.qryConfig.ParamByName('completo').AsInteger := DM.Completo;
      DM.qryConfig.Open;

      { Modifica as informações na instância  }
      TScheduleManager.GetInstance.Interval := DM.qryConfigNR_INTERVALO.AsInteger;
      if DM.qryConfigSN_ATIVO.AsInteger = 1 then
         TScheduleManager.GetInstance.Enabled := True
      else
        TScheduleManager.GetInstance.Enabled := false;
      TScheduleManager.GetInstance.Frequency := DM.qryConfigNR_TIPO.AsVariant;
      TScheduleManager.GetInstance.StartTime := DM.qryConfigHR_BACKUP.AsDateTime;
      TScheduleManager.GetInstance.Databases.Clear;
      TScheduleManager.GetInstance.AssignDatabases(DM.qryConfigDS_BASES.AsString);

      if (DM.qryConfigSN_BACKUP_MONGO.AsInteger = 1) then
      begin
         TScheduleManager.GetInstance.Sn_mongo := True;
      end;
      if (DM.qryConfigSN_BACKUP_MONGO.AsInteger = 0)  then
      begin
        TScheduleManager.GetInstance.Sn_mongo := False;
      end;

      LoadSchedule;
   end;
end;

procedure TfAgendamento.SaveSchedule;
var
   Databases: AnsiString;
begin
   TScheduleManager.GetInstance.Enabled := chkHabitad.Checked;
   TScheduleManager.GetInstance.Frequency := TScheduleFrequency(rgFrequencia.ItemIndex);
   TScheduleManager.GetInstance.Interval := speIntervalo.Value;
   TScheduleManager.GetInstance.StartTime := dtpHoraInicio.Time;
   TScheduleManager.GetInstance.SaveDir := edtDiretorio.Text;
   TScheduleManager.GetInstance.Sn_mongo := ckbBackupMongo.Checked;

   Databases := EmptyStr;
   cdsBancos.First;
   while not cdsBancos.Eof do
   begin
      if Databases <> EmptyStr then
         Databases := Databases + #59;
      Databases := Databases + cdsBancosDatabase.AsString;
      cdsBancos.Next;
   end;
   TScheduleManager.GetInstance.AssignDatabases(Databases);

   DM.qryConfig.Edit;
   DM.qryConfigSN_ATIVO.AsInteger := Ord(chkHabitad.Checked);
   DM.qryConfigNR_TIPO.AsInteger := rgFrequencia.ItemIndex;
   DM.qryConfigNR_INTERVALO.AsInteger := speIntervalo.Value;
   DM.qryConfigHR_BACKUP.AsDateTime := dtpHoraInicio.Time;
   DM.qryConfigDS_CAMINHO_BKP.AsString := edtDiretorio.Text;
   DM.qryConfigDS_BASES.AsString := Databases;
   DM.qryConfigSN_ALTERADO.AsInteger := 1;

   if (ckbBackupMongo.Checked) then
   begin
      DM.qryConfigSN_BACKUP_MONGO.AsInteger := 1;
   end;
   
   if not(ckbBackupMongo.Checked) then
   begin
      DM.qryConfigSN_BACKUP_MONGO.AsInteger := 0;
   end;

   DM.qryConfig.SQL.Text;
   DM.qryConfig.FieldByName('SN_BACKUP_MONGO').AsInteger;

   DM.qryConfig.ParamByName('completo').AsInteger := rgTipoBackup.ItemIndex;
   DM.qryConfig.Post;
end;

procedure TfAgendamento.sbDiretorioClick(Sender: TObject);
const
   SCaption = 'Selecione o diretório para armazenamento de backup';
var
   Directory: AnsiString;
begin
   if SelectDirectory(SCaption, EmptyStr, Directory) then
      edtDiretorio.Text := Directory;
end;

procedure TfAgendamento.sbHabilitarClick(Sender: TObject);
begin
   DM.EnableScheduler;
   sbHabilitar.Enabled := False;
end;

procedure TfAgendamento.speIntervaloChange(Sender: TObject);
begin
   ChangeState(True);
end;

procedure TfAgendamento.speIntervaloExit(Sender: TObject);
begin
   if speIntervalo.Text = EmptyStr then
      speIntervalo.Value := 1;
end;

procedure TfAgendamento.speIntervaloKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#48..#57, #8]) then
      Key := #0;
end;

end.
