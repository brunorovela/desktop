unit uAgendarBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin, ImgList, General,
  DateUtils, uPrincipal;

const
  BKP_DIA  = 0; {Índice backup diário}
  BKP_HORA = 1; {Índice backup por hora}
  STR_BKP_DIA  = 'dia';
  STR_BKP_HORA = 'hora';

type
  TfrmAgendarBackup = class(TForm)
    leDataUltimoBackup: TLabeledEdit;
    leHoraBackup: TLabeledEdit;
    leBaseBackupear: TLabeledEdit;
    lePastaSalvar: TLabeledEdit;
    sdSalvar: TSaveDialog;
    tbAgendamento: TToolBar;
    tbSalvar: TToolButton;
    tbCancelar: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ilBotoes: TImageList;
    rdGrPeriodo: TRadioGroup;
    leQtdDias: TLabeledEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdGrPeriodoClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bck_data, bck_hora, bck_intervalo, bck_pasta, bck_base, bck_tipo, bck_ult_hora : string;
  end;

var
  frmAgendarBackup: TfrmAgendarBackup;
  tipoBackup: Integer;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmAgendarBackup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAgendarBackup.FormDestroy(Sender: TObject);
begin
   frmAgendarBackup := nil;
end;

procedure TfrmAgendarBackup.FormShow(Sender: TObject);
begin

  bck_data := DM.variavel_parametro('backup_data');
  bck_hora := DM.variavel_parametro('backup_hora');
  //bck_qtd_dias := DM.variavel_parametro('backup_qtd_dias');
  bck_intervalo := DM.variavel_parametro('backup_intervalo');
  bck_pasta := DM.variavel_parametro('backup_caminho_restaura');
  bck_base := DM.variavel_parametro('backup_base');
  bck_tipo := DM.variavel_parametro('backup_tipo');
  bck_ult_hora := DM.variavel_parametro('backup_ultima_hora');

  if bck_intervalo = '' then
    bck_intervalo := '1';

  if bck_pasta = '' then
    bck_pasta := ExtractFilePath(Application.ExeName);

  if bck_base = '' then
    bck_base := 'unimestre';

  if rdGrPeriodo.ItemIndex = BKP_DIA then
    leDataUltimoBackup.Text := bck_data
  else if rdGrPeriodo.ItemIndex = BKP_HORA then
    leDataUltimoBackup.Text := bck_data+' '+bck_ult_hora
  else
    leDataUltimoBackup.Text := bck_data;

  if bck_tipo = 'hora' then
  begin
    rdGrPeriodo.ItemIndex := BKP_HORA;
  end
  else if bck_tipo = 'dia' then
  begin
    rdGrPeriodo.ItemIndex := BKP_DIA;
  end;

  //leDataUltimoBackup.Text := bck_data;
  leHoraBackup.Text := bck_hora;
  leQtdDias.Text := bck_intervalo;
  lePastaSalvar.Text := bck_pasta;
  leBaseBackupear.Text := bck_base;

  sdSalvar.InitialDir := bck_pasta;
  sdSalvar.FileName := bck_pasta;

end;

procedure TfrmAgendarBackup.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
  qtd_dias : integer;
begin
  qtd_dias := StrToInt(leQtdDias.Text);

  if Button = btNext then
    inc(qtd_dias)
  else if button = btPrev then
    dec(qtd_dias);

  leQtdDias.Text := IntToStr(qtd_dias);
end;

procedure TfrmAgendarBackup.tbSalvarClick(Sender: TObject);
var
  msgErro, bkpTipo: String;
begin
  if tipoBackup = BKP_DIA then
  begin
    msgErro := 'A quantidade de dias deve ser numérica !';
    bkpTipo := 'dia';
  end
  else if tipoBackup = BKP_HORA then
  begin
    msgErro := 'A quantidade de horas deve ser numérica !';
    bkpTipo := 'hora';
  end;

  try
    StrToInt(leQtdDias.Text);
  except
    Mensagem(msgErro, Application.Title, MB_OK+MB_ICONERROR);
    leQtdDias.SetFocus;
    leQtdDias.SelectAll;
    Exit;
  end;

  //DM.set_variavel_parametro('backup_qtd_dias',leQtdDias.Text);
  DM.set_variavel_parametro('backup_intervalo',leQtdDias.Text);
  DM.set_variavel_parametro('backup_hora',leHoraBackup.Text);
  DM.set_variavel_parametro('backup_caminho_restaura',lePastaSalvar.Text);
  DM.set_variavel_parametro('backup_base',leBaseBackupear.Text);
  DM.set_variavel_parametro('backup_tipo',bkpTipo);

  if (leHoraBackup.Text <> '') AND (leQtdDias.Text <> '') {AND (VerificaInicializacao(Application.ExeName+' backup', 'Uni-Mestre - Backup Automático') = false)} then begin
    if Mensagem('O Backup será executado neste computador ?', Application.Title, MB_YESNO+MB_ICONQUESTION) = ID_YES then begin
      RegistraInicializacao(Application.ExeName+' backup', 'UNIMESTRE - Backup Automático');
      uPrincipal.toTrayOnClose := True;
    end
    {
    else begin
      Mensagem('Por segurança, no computador em que o backup será executado, coloque este módulo para ser aberto já na inicialização do Windows, colocando ao final a palavra backup.'+chr(13)+'EX.: c:\unimestre\programas\UniMestre_Parametros.exe backup'+chr(13)+'Se desejar, vá no computador que irá executar o backup, abra este módulo, entre nesta mesma tela e, ao aparecer a mensagem anterior, clique em Sim.', Application.Title, MB_OK+MB_ICONINFORMATION);
    end;
    }
  end;

  Close();
end;

{Evento será executado sempre que o usuário mudar a forma de fazer backup}
procedure TfrmAgendarBackup.rdGrPeriodoClick(Sender: TObject);
begin
  {Escolheu backup diário}
  if rdGrPeriodo.ItemIndex = BKP_DIA then
  begin
    leQtdDias.EditLabel.Caption := 'Intervalo de Dias';
    leDataUltimoBackup.EditLabel.Caption := 'Data do último backup';
    leDataUltimoBackup.Text := bck_data;
    tipoBackup := BKP_DIA
  end
  {Escolheu backup por hora}
  else if rdGrPeriodo.ItemIndex = BKP_HORA then
  begin
    leQtdDias.EditLabel.Caption := 'Intervalo de Horas';
    leDataUltimoBackup.EditLabel.Caption := 'Data/Hora do último backup';
    leDataUltimoBackup.Text := bck_data+' '+bck_ult_hora;
    tipoBackup := BKP_HORA
  end;
end;

procedure TfrmAgendarBackup.tbCancelarClick(Sender: TObject);
begin
  Close();
end;

end.
