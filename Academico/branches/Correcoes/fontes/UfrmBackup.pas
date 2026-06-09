unit UfrmBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, UMComboBox, Mask, Grids, DBGrids, Buttons,
  ComCtrls, ToolWin, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, ImgList, uDM, General, uUsuario, UMDateTimePicker;

type
  TfrmBackup = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    qryBackups: TUMZQuery;
    dsBackups: TDataSource;
    qryBackupscd_backup: TIntegerField;
    qryBackupssn_completo: TSmallintField;
    qryBackupsnr_tamanho_backup: TFloatField;
    qryBackupsds_ip_computador: TStringField;
    qryBackupsds_databases: TStringField;
    qryBackupsds_mysqldump: TMemoField;
    dbDatabase: TDBEdit;
    Label3: TLabel;
    dbTamanhoBkp: TDBEdit;
    Label4: TLabel;
    dbIP: TDBEdit;
    udtpData: TUMDateTimePicker;
    ilBotoes: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    qryBackupsdt_data_inicio: TDateField;
    qryBackupsdt_data_fim: TDateField;
    qryBackupsnr_hora_inicio: TTimeField;
    qryBackupsnr_hora_fim: TTimeField;
    Label6: TLabel;
    udtpDataFim: TUMDateTimePicker;
    Label7: TLabel;
    qryBackupssn_modulo_administracao: TSmallintField;
    edHoraInicio: TMaskEdit;
    edHoraFim: TMaskEdit;
    procedure edHoraFimKeyPress(Sender: TObject; var Key: Char);
    procedure edHoraInicioKeyPress(Sender: TObject; var Key: Char);
    procedure edHoraFimExit(Sender: TObject);
    procedure edHoraInicioExit(Sender: TObject);
    procedure qryBackupsnr_hora_fimSetText(Sender: TField; const Text: string);
    procedure qryBackupsnr_hora_fimGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbTamanhoBkpKeyPress(Sender: TObject; var Key: Char);
    procedure qryBackupssn_completoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure udtpDataFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryBackupsds_mysqldumpGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure udtpDataExit(Sender: TObject);
    procedure qryBackupsAfterOpen(DataSet: TDataSet);
    procedure OnDateTimeFieldSetText(Sender: TField; const Text: string);
    procedure OnTimeFieldGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dsBackupsDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure dsBackupsStateChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

procedure TfrmBackup.btnAlterarClick(Sender: TObject);
begin

   if DM.UsuarioLogado.TemPermissao( 0, 'Academico.BackupsRealizados', npAlterar, True )then
   begin
      qryBackups.Edit;
   end;

end;

procedure TfrmBackup.btnCancelarClick(Sender: TObject);
begin
   qryBackups.Cancel;
end;

procedure TfrmBackup.btnExcluirClick(Sender: TObject);
begin

   if qryBackupssn_modulo_administracao.AsInteger = 1 then
   begin
      Mensagem('Este registro foi gerado automáticamente pelo módulo de administração e não deve ser editado!', 'Aviso', MB_OK);
      Exit;
   end;

   if DM.UsuarioLogado.TemPermissao( 0, 'Academico.BackupsRealizados', npExcluir, True )then
   begin

      if qryBackups.RecordCount = 0 then
      begin
         Exit;
      end;

      if Mensagem('Tem certeza que deseja este registro?', 'Aviso', MB_YESNO + MB_ICONWARNING) = mrYes then
      begin
         qryBackups.Delete;
      end;

   end;
end;

procedure TfrmBackup.btnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmBackup.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao( 0, 'Academico.BackupsRealizados', npIncluir, True )then
   begin
      qryBackups.Insert;

      udtpData.setDate(Date());
      udtpDataFim.setDate(Date());
   end;

   edHoraInicio.Text := '00:00';
   edHoraFim.Text := '00:00';
end;

procedure TfrmBackup.btnSalvarClick(Sender: TObject);
begin

   qryBackupsdt_data_inicio.AsDateTime := udtpData.Date;
   qryBackupsdt_data_fim.AsDateTime := udtpDataFim.Date;

   qryBackupsnr_hora_fim.AsString := edHoraFim.Text;
   qryBackupsnr_hora_inicio.AsString  := edHoraInicio.Text;

   qryBackupssn_modulo_administracao.AsInteger := 0;

   qryBackups.Post;
end;


procedure TfrmBackup.dbTamanhoBkpKeyPress(Sender: TObject; var Key: Char);
begin

   if(Key in['.']) then
   begin
      Key :=  ',';
      Exit;
   end;

   if not (Key in [#8, '0'..'9', DecimalSeparator]) then
   begin
      key:=#0;
   end;
   
end;

procedure TfrmBackup.dsBackupsDataChange(Sender: TObject; Field: TField);
var
   horas: TStringList;
begin

   if ((dsBackups.State = dsBrowse) and (qryBackups.recordCount > 0)) then
   begin
      udtpData.setDate(qryBackupsdt_data_inicio.AsDateTime);
      udtpDataFim.setDate(qryBackupsdt_data_fim.AsDateTime);

      edHoraInicio.Text := '00:00';

      if qryBackupsnr_hora_inicio.AsString <> '' then
      begin
         horas := TStringList.Create;

         SplitString(qryBackupsnr_hora_inicio.AsString, ':', horas);

         edHoraInicio.Text := horas[0]+':'+horas[1];
      end;


      if qryBackupsnr_hora_fim.AsString <> '' then
      begin
         
         horas := TStringList.Create;
         SplitString(qryBackupsnr_hora_fim.AsString, ':', horas);

         edHoraFim.Text := horas[0]+':'+horas[1];
      end;

      if qryBackupssn_completo.AsInteger = 1 then
      begin
         DBCheckBox1.Checked := True;
      end
      else
      begin
         DBCheckBox1.Checked := False;
      end;


   end;
   
end;

procedure TfrmBackup.dsBackupsStateChange(Sender: TObject);
var
   editando: Boolean;
begin

   if ((qryBackups.State = dsEdit) and (qryBackupssn_modulo_administracao.AsInteger = 1)) then
   begin
      qryBackups.Cancel;
      Mensagem('Este registro foi gerado automáticamente pelo módulo de administração e não deve ser editado!', 'Aviso', MB_OK);
      Exit;
   end;

   editando := qryBackups.State in [dsInsert, dsEdit];

   btnSalvar.Enabled    := editando;
   btnCancelar.Enabled  := editando;

   btnInserir.Enabled := not(editando);
   btnExcluir.Enabled := not(editando);
   btnAlterar.Enabled := not(editando);

end;

procedure TfrmBackup.edHoraFimExit(Sender: TObject);
begin
   if (edHoraFim.Text <> '') then
   begin
      try
         StrToTime(edHoraFim.Text);
      except
         Mensagem('Por favor informe uma hora válida!', 'Aviso', MB_OK);
         edHoraInicio.Clear;
      end;
   end;
end;


procedure TfrmBackup.edHoraFimKeyPress(Sender: TObject; var Key: Char);
begin
   if ((qryBackups.RecordCount > 0) and not(qryBackups.State in[dsInsert, dsEdit])) then
   begin
      qryBackups.Edit;
   end;
end;

procedure TfrmBackup.edHoraInicioExit(Sender: TObject);
begin
   if (edHoraInicio.Text <> '') then
   begin
      try
         StrToTime(edHoraInicio.Text);
      except
         Mensagem('Por favor informe uma hora válida!', 'Aviso', MB_OK);
         edHoraInicio.Clear;
      end;
   end;
end;

procedure TfrmBackup.edHoraInicioKeyPress(Sender: TObject; var Key: Char);
begin

   if ((qryBackups.RecordCount > 0) and not(qryBackups.State in[dsInsert, dsEdit])) then
   begin
      qryBackups.Edit;
   end;
   
end;

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2 : btnInserirClick( nil );
      VK_F3 : btnAlterarClick( nil );
      VK_F5 : btnSalvarClick( nil );
      VK_F9 : btnExcluirClick( nil );
      VK_F6 : btnCancelarClick( nil );
      VK_F12 : btnFecharClick( nil );
   end;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin

   udtpData.setDate(Date());
   udtpDataFim.setDate(Date());

   qryBackups.Open;
end;

procedure TfrmBackup.OnDateTimeFieldSetText(Sender: TField; const Text: string);
var
   sStr: string;
begin
   sStr := Trim (Text);
   if (sStr = '. ') or (sStr = ': ') then //blank mask
      Sender.AsString := ''
   else
      Sender.AsString := Text;
end;

procedure TfrmBackup.OnTimeFieldGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if Sender.IsNull then
      Text := ''
   else
      Text := FormatDateTime ('hh:nn', Sender.AsDateTime);
end;

procedure TfrmBackup.qryBackupsAfterOpen(DataSet: TDataSet);
var
   horas: TStringList;
begin

   if qryBackupsdt_data_inicio.AsString <> '' then
   begin
      udtpData.setDate(qryBackupsdt_data_inicio.AsDateTime);
   end
   else
   begin
      udtpData.setDate(Date());
   end;

   if qryBackupsdt_data_fim.AsString <> '' then
   begin
      udtpDataFim.setDate(qryBackupsdt_data_fim.AsDateTime);
   end
   else
   begin
      udtpDataFim.setDate(Date());
   end;


   edHoraFim.Text := qryBackupsnr_hora_fim.AsString;
   edHoraInicio.Text := qryBackupsnr_hora_inicio.AsString;

   edHoraInicio.Text := '00:00';

   if qryBackupsnr_hora_inicio.AsString <> '' then
   begin
      horas := TStringList.Create;
      SplitString(qryBackupsnr_hora_inicio.AsString, ':', horas);

      edHoraInicio.Text := horas[0]+':'+horas[1];
   end;

   edHoraFim.Text := '00:00';

   if qryBackupsnr_hora_fim.AsString <> '' then
   begin
      horas := TStringList.Create;
      SplitString(qryBackupsnr_hora_fim.AsString, ':', horas);

      edHoraFim.Text := horas[0]+':'+horas[1];
   end;
   
end;

procedure TfrmBackup.qryBackupsds_mysqldumpGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text := Copy(qryBackupsds_mysqldump.AsString, 1, 200);
end;

procedure TfrmBackup.qryBackupsnr_hora_fimGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.IsNull then
      Text := ''
   else
      Text := FormatDateTime ('hh:nn', Sender.AsDateTime);
end;

procedure TfrmBackup.qryBackupsnr_hora_fimSetText(Sender: TField;
  const Text: string);
var
   sStr: string;
begin
   sStr := Trim (Text);
   if (sStr = '. ') or (sStr = ': ') then //blank mask
      Sender.AsString := ''
   else
      Sender.AsString := Text;
end;

procedure TfrmBackup.qryBackupssn_completoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.Value = 1 then
      Text := 'Sim'
   else
      Text := 'Não';
end;

procedure TfrmBackup.udtpDataExit(Sender: TObject);
begin

   if (qryBackups.RecordCount = 0) then
   begin
      Exit;
   end;

   if (not (qryBackups.State in [dsInsert, dsEdit])) then
   begin
      qryBackups.Edit;
   end;

   if ((qryBackups.State in [dsInsert, dsEdit]) AND (qryBackupsdt_data_inicio.AsDateTime <> udtpData.getDate)) then
   begin
      qryBackupsdt_data_inicio.AsDateTime := udtpData.getDate;
   end;

end;

procedure TfrmBackup.udtpDataFimExit(Sender: TObject);
begin
   if (qryBackups.RecordCount = 0) then
   begin
      Exit;
   end;

   if (not (qryBackups.State in [dsInsert, dsEdit])) then
   begin
      qryBackups.Edit;
   end;

   if ((qryBackups.State in [dsInsert, dsEdit]) AND (qryBackupsdt_data_fim.AsDateTime <> udtpDataFim.getDate)) then
   begin
      qryBackupsdt_data_fim.AsDateTime := udtpDataFim.getDate;
   end;
end;

end.
