unit uCatracaDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMan, ComCtrls;

type
  TFCatracaDesktop = class(TForm)
    PFundoGeral: TPanel;
    PGeralButton: TPanel;
    BIniciar: TButton;
    PSubGeralFundo: TPanel;
    PSecFundoButton: TPanel;
    MLogs: TMemo;
    PGeralTop: TPanel;
    XPManifest1: TXPManifest;
    btnParar: TButton;
    TStatus: TStatusBar;
    TTimerBanco: TTimer;
    TTimerStatusBanco: TTimer;
    chGerarLogs: TCheckBox;
    PFundoGeralLogs: TPanel;
    BtnLimparLogs: TButton;
    chReiniciarAutomaticamente: TCheckBox;
    lbTempoReinicializar: TLabel;
    edTempoReiniciar: TEdit;
    cbIntervaloReiniciar: TComboBox;
    TTimerReiniciar: TTimer;
    procedure TTimerReiniciarTimer(Sender: TObject);
    procedure chReiniciarAutomaticamenteClick(Sender: TObject);
    procedure BtnLimparLogsClick(Sender: TObject);
    procedure TTimerBancoTimer(Sender: TObject);
    procedure TTimerStatusBancoTimer(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure BIniciarClick(Sender: TObject);
  private
    FPackages: array of HMODULE;
    procedure LoadPackages;
    procedure IniciarCatracas;
    procedure PararCatracas;
    procedure IniciarReiniciarAutomatico;
    procedure DesativarReiniciarAutomatico;
  public
    procedure GerarLogs(aLog: String);
  end;

var
  FCatracaDesktop: TFCatracaDesktop;

implementation

uses
  UDMCatracas, UHenry7x, UHenry8x, UMCatracasClasses;

{$I consts.inc}

{$R *.dfm}

procedure TFCatracaDesktop.GerarLogs(aLog: String);
var
  xTexto: String;
begin
  xTexto := Format('%s - %s', [FormatDateTime('DD/MM/YYYY HH:MM:SS', NOW()), aLog]);

  MLogs.Lines.Add(xTexto);
end;

procedure TFCatracaDesktop.IniciarCatracas;
var
  ClassRef: TPersistentClass;
begin
  try
    Application.CreateForm(TDMCatracas, DMCatracas);

    if not DMCatracas.conn.Connected then
    begin
       GerarLogs(
          Format('Não foi possível se conectar na base de dados. Host: %s Porta: %s',
                 [DMCatracas.conn.HostName, IntToStr(DMCatracas.conn.Port)])
       );
       Exit;
    end;

    LoadPackages;

    ClassRef := GetClass('TTurnstileManager');

    if ClassRef <> nil then
      TTurnstileManagerClass(ClassRef).Instance.Start(DMCatracas.conn.DbcConnection, MLogs, chGerarLogs.Checked);
    except
       on E: Exception do
          GerarLogs('Ocorreu um erro ao tentar iniciar o serviço: ' + E.Message);
    end;
end;

procedure TFCatracaDesktop.PararCatracas;
var
  ClassRef: TPersistentClass;
begin
  ClassRef := GetClass('TTurnstileManager');

  if ClassRef <> nil then
    TTurnstileManagerClass(ClassRef).Instance.Stop;
end;

procedure TFCatracaDesktop.BIniciarClick(Sender: TObject);
begin
  BIniciar.Enabled := False;
  btnParar.Enabled := True;

  // desabilita os componentes de controle da tela
  chGerarLogs.Enabled := False;
  
  IniciarCatracas;
  IniciarReiniciarAutomatico;
  GerarLogs('Monitoramento iniciado');
end;

procedure TFCatracaDesktop.btnPararClick(Sender: TObject);
begin
  BIniciar.Enabled := True;
  btnParar.Enabled := False;

  // habilita os componentes de controle da tela
  chGerarLogs.Enabled := True;

  PararCatracas;
  DesativarReiniciarAutomatico;
  GerarLogs('Monitoramento encerrado');
end;

procedure TFCatracaDesktop.BtnLimparLogsClick(Sender: TObject);
begin
  MLogs.Lines.Clear;
end;

procedure TFCatracaDesktop.chReiniciarAutomaticamenteClick(Sender: TObject);
begin
  edTempoReiniciar.Enabled := chReiniciarAutomaticamente.Checked;
  cbIntervaloReiniciar.Enabled := chReiniciarAutomaticamente.Checked;
end;

procedure TFCatracaDesktop.IniciarReiniciarAutomatico;
var
  xTempoReiniciar: Integer;
begin
  chReiniciarAutomaticamente.Enabled := False;
  edTempoReiniciar.Enabled := False;
  cbIntervaloReiniciar.Enabled := False;

  if (chReiniciarAutomaticamente.Checked) then
  begin
    if (Trim(edTempoReiniciar.Text) = EmptyStr) then
    begin
      GerarLogs('Tempo para reinicializar não informado.');
      Exit;
    end;

    xTempoReiniciar := StrToIntDef(Trim(edTempoReiniciar.Text), 0);
    if (xTempoReiniciar <= 0) then
    begin
      GerarLogs('Tempo para reinicializar informado é inválido.');
      Exit;
    end;

    // converte o valor informado para millisegundos para o TTimer
    // segundos
    if (cbIntervaloReiniciar.ItemIndex = 0) then
    begin
      xTempoReiniciar := xTempoReiniciar * 1000;
    end;

    // minutos
    if (cbIntervaloReiniciar.ItemIndex = 1) then
    begin
      xTempoReiniciar := ((xTempoReiniciar * 60) * 1000);
    end;

    // horas
    if (cbIntervaloReiniciar.ItemIndex = 2) then
    begin
      xTempoReiniciar := (((xTempoReiniciar * 60) * 60) * 1000);
    end;

    TTimerReiniciar.Interval := xTempoReiniciar;
    TTimerReiniciar.Enabled := True;
    GerarLogs('Reinicialização automática ativada. ' + IntToStr(xTempoReiniciar) + ' millisegundos.');
  end;
end;

procedure TFCatracaDesktop.DesativarReiniciarAutomatico;
begin
  TTimerReiniciar.Enabled := False;

  // controle reinicializar automatica
  chReiniciarAutomaticamente.Enabled := True;
  edTempoReiniciar.Enabled := chReiniciarAutomaticamente.Checked;
  cbIntervaloReiniciar.Enabled := chReiniciarAutomaticamente.Checked;
end;

procedure TFCatracaDesktop.LoadPackages;
var
   SR: TSearchRec;
   I: Integer;
   xArquivo, xErros: String;
begin
  if (Length(FPackages) > 0) then
    Exit;

   I := 0;
   if FindFirst('catracas\*.bpl', faAnyFile and not faDirectory, SR) = 0 then
   begin
      xErros := '';
      repeat
         try
           xArquivo := 'catracas\' + SR.Name;

           if (FileExists(xArquivo) = False) then
           begin
             GerarLogs('Não foi possível encontrar o arquivo: ' + xArquivo);
             Continue;
           end;

           Inc(I);
           SetLength(FPackages, I);
           FPackages[I - 1] := LoadPackage(xArquivo);
         except
            on E: Exception do
            begin
              GerarLogs('Erro ao carregar o pacote: ' + xArquivo + ' - ' + E.Message);
            end;
         end;
      until FindNext(SR) <> 0;
      SysUtils.FindClose(SR);
   end;
end;

procedure TFCatracaDesktop.TTimerBancoTimer(Sender: TObject);
var
  xProcesso: String;
begin
  try
     xProcesso := 'Verificando conexão...';

    if (not DMCatracas.conn.Connected) then
    begin
      xProcesso := 'Forçando conexão...';
      DMCatracas.conn.Connect;
      Sleep(600);
    end;

    if (not DMCatracas.conn.Connected) then
    begin
      GerarLogs('Ocorreu um erro ao tentar atualizar a conexão com o banco de dados...');
    end;

    xProcesso := 'Carregar horário...';

    // Executa para não perder a conexão com o banco de dados.
    DMCatracas.DataAtual;

    xProcesso := 'Verificar debug...';
  except
    on E: Exception do
    begin
      GerarLogs('Erro ao verificar conexão com banco de dados: ' + xProcesso + ': ' + E.Message);
    end;
  end;
end;

procedure TFCatracaDesktop.TTimerReiniciarTimer(Sender: TObject);
begin
  GerarLogs('Reiniciando monitoramento...');
  PararCatracas;
  Sleep(500);
  IniciarCatracas;
  Application.ProcessMessages;
end;

procedure TFCatracaDesktop.TTimerStatusBancoTimer(Sender: TObject);
var
  xBancoStatus: String;
begin
  xBancoStatus := 'Conectado';

  if (not DMCatracas.conn.Connected) then
    xBancoStatus := 'Desconectado';

  xBancoStatus := 'Banco de dados: ' + xBancoStatus;

  if (xBancoStatus <> TStatus.Panels[0].Text)  then
  begin
    TStatus.Panels[0].Text := xBancoStatus;
  end;
end;

end.
