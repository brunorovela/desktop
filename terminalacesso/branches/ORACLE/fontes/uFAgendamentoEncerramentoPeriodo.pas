unit uFAgendamentoEncerramentoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, Buttons, Grids,
  DBGrids, ComCtrls, ToolWin, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, DBCtrls, Mask, uUsuario;

const
   ACAO_IMPORTACAO_AGENDAMENTO = 'Importacao.Agendamentos';
   PARAMETRO_RODAR_SERVICO = 'ta_rodar_servico_agendado';

type
  TfrmAgendamentoEncerramentoPeriodo = class(TForm)
    pnTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    spIniciar: TSpeedButton;
    spParar: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qyAgendamento: TUMZQuery;
    qyAgendamentohr_execucao: TTimeField;
    qyAgendamentosn_executar_importacao: TSmallintField;
    qyAgendamentosn_encerrar_periodo: TSmallintField;
    dsAgendamento: TDataSource;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    qyAgendamentods_executar_importacao: TStringField;
    qyAgendamentods_encerrar_periodo: TStringField;
    dtpHoraExecucao: TDateTimePicker;
    qyAgendamentocd_agendamento: TIntegerField;
    procedure dtpHoraExecucaoChange(Sender: TObject);
    procedure qyAgendamentoBeforePost(DataSet: TDataSet);
    procedure dsAgendamentoDataChange(Sender: TObject; Field: TField);
    procedure qyAgendamentoBeforeDelete(DataSet: TDataSet);
    procedure qyAgendamentoBeforeEdit(DataSet: TDataSet);
    procedure qyAgendamentoBeforeInsert(DataSet: TDataSet);
    procedure spIniciarClick(Sender: TObject);
    procedure qyAgendamentoCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dsAgendamentoStateChange(Sender: TObject);
  strict private
    { Private declarations }
    procedure IniciarPararServico(iniciar: Boolean);

    function HorarioComPendencia(const cd_agendamento: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmAgendamentoEncerramentoPeriodo: TfrmAgendamentoEncerramentoPeriodo;

implementation

uses uDM, General;

{$R *.dfm}

procedure TfrmAgendamentoEncerramentoPeriodo.btnAlterarClick(Sender: TObject);
begin
   dtpHoraExecucao.SetFocus;
   qyAgendamento.Edit();
end;

procedure TfrmAgendamentoEncerramentoPeriodo.btnCancelarClick(Sender: TObject);
begin
   qyAgendamento.Cancel();
   DBGrid1.SetFocus;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.btnExcluirClick(Sender: TObject);
begin
   qyAgendamento.Delete();
end;

procedure TfrmAgendamentoEncerramentoPeriodo.btnIncluirClick(Sender: TObject);
begin
   dtpHoraExecucao.SetFocus;
   qyAgendamento.Insert();
end;

procedure TfrmAgendamentoEncerramentoPeriodo.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmAgendamentoEncerramentoPeriodo.btnSalvarClick(Sender: TObject);
begin
   qyAgendamento.Post();
   DBGrid1.SetFocus;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.dsAgendamentoDataChange(Sender: TObject; Field: TField);
begin
   dtpHoraExecucao.Time := qyAgendamentohr_execucao.AsDateTime;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.dsAgendamentoStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not( qyAgendamento.State IN [ dsInsert, dsEdit ] );
   btnAlterar.Enabled := not( qyAgendamento.State IN [ dsInsert, dsEdit ] );
   btnExcluir.Enabled := not( qyAgendamento.State IN [ dsInsert, dsEdit ] );

   btnCancelar.Enabled := qyAgendamento.State IN [ dsInsert, dsEdit ];
   btnSalvar.Enabled := qyAgendamento.State IN [ dsInsert, dsEdit ];
end;

procedure TfrmAgendamentoEncerramentoPeriodo.dtpHoraExecucaoChange(Sender: TObject);
begin
   if not ( qyAgendamento.State IN [ dsInsert, dsEdit ] ) then
   begin
      if qyAgendamento.IsEmpty then
         qyAgendamento.Insert
      else
         qyAgendamento.Edit;      
   end;                                                          

   qyAgendamentohr_execucao.AsDateTime := dtpHoraExecucao.Time;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F2    : if btnIncluir.Enabled then btnIncluirClick( nil );
      VK_F3    : if btnAlterar.Enabled then btnAlterarClick( nil );
      VK_F5    : if btnSalvar.Enabled then btnSalvarClick( nil );
      VK_F6    : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F9    : if btnExcluir.Enabled then btnExcluirClick( nil );
      VK_F12   : btnSairClick( nil );

   end;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.FormShow(Sender: TObject);
begin
   qyAgendamento.Open;
   spIniciar.Down := ( StrToIntDef(DM.variavel_parametro(PARAMETRO_RODAR_SERVICO), 0) = 1 );
   spParar.Down := not spIniciar.Down;
end;

function TfrmAgendamentoEncerramentoPeriodo.HorarioComPendencia(const cd_agendamento: Integer): Boolean;
const
   SQL_VERIFICA_HORARIO_COM_PENDENCIA =
      ' SELECT COUNT(*) AS registros FROM ta_importacao_logs WHERE cd_agendamento = :cd_agendamento ';
var
   qyVerificaHorarioComPendencia: TUMZReadOnlyQuery;
begin
   Result := True;
   DM.CriarConsulta(qyVerificaHorarioComPendencia);

   qyVerificaHorarioComPendencia.SQL.Text := SQL_VERIFICA_HORARIO_COM_PENDENCIA;
   qyVerificaHorarioComPendencia.ParamByName('cd_agendamento').AsInteger := cd_agendamento;

   try
      try
         qyVerificaHorarioComPendencia.Open();

         if qyVerificaHorarioComPendencia.FieldByName('registros').AsInteger = 0 then
            Result := False;
      except
      end;
   finally
      FreeAndNil(qyVerificaHorarioComPendencia);
   end;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.IniciarPararServico(iniciar: Boolean);
var
   acao: String;
begin
   acao := '0';
   if iniciar then
      acao := '1';

   DM.set_variavel_parametro( PARAMETRO_RODAR_SERVICO, acao );
end;

procedure TfrmAgendamentoEncerramentoPeriodo.qyAgendamentoBeforeDelete(DataSet: TDataSet);
const
   MSG_ERRO_PENDENCIA =
      'Não foi possível excluir este registro pois existem informações vinculadas a ele. ' + Chr(13) +
      'Desmarque as opções de execução para que o horário não seja usado novamente.';
begin
   { Se não tem permissão OU tem permissão, mas a pessoa respondeu que não quer excluir, executamos um Abort }
   if not DM.GetUsuarioLogado.TemPermissao( 0, 'TerminalAcesso.'+ACAO_IMPORTACAO_AGENDAMENTO, npAlterar, True ) OR
      ( Mensagem( 'Deseja excluir este Registro?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle ) <> mrYes ) then Abort();

   { Caso contrário fazemos uma verificação se este registro possui pendências, se existir também ocorre o Abort }
   if HorarioComPendencia( Self.qyAgendamentocd_agendamento.AsInteger ) then
   begin
      Mensagem( MSG_ERRO_PENDENCIA );

      Abort();
   end;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.qyAgendamentoBeforeEdit(DataSet: TDataSet);
begin
   if not dm.GetUsuarioLogado.TemPermissao( 0, 'TerminalAcesso.'+ACAO_IMPORTACAO_AGENDAMENTO, npAlterar, True ) then Abort();
end;

procedure TfrmAgendamentoEncerramentoPeriodo.qyAgendamentoBeforeInsert(DataSet: TDataSet);
begin
   if not dm.GetUsuarioLogado.TemPermissao( 0, 'TerminalAcesso.'+ACAO_IMPORTACAO_AGENDAMENTO, npIncluir, True ) then Abort();
end;

procedure TfrmAgendamentoEncerramentoPeriodo.qyAgendamentoBeforePost(DataSet: TDataSet);
begin
   qyAgendamentohr_execucao.AsDateTime := dtpHoraExecucao.Time;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.qyAgendamentoCalcFields(DataSet: TDataSet);
const
   SIM = 'Sim';
   NAO = 'Não';
begin
   if qyAgendamentosn_executar_importacao.AsInteger = 1 then
      qyAgendamentods_executar_importacao.AsString := SIM
   else
      qyAgendamentods_executar_importacao.AsString := NAO;

   if qyAgendamentosn_encerrar_periodo.AsInteger = 1 then
      qyAgendamentods_encerrar_periodo.AsString := SIM
   else
      qyAgendamentods_encerrar_periodo.AsString := NAO;
end;

procedure TfrmAgendamentoEncerramentoPeriodo.spIniciarClick(Sender: TObject);
var
   temPermissaoEspecial: Boolean;
begin
   if not TSpeedButton(Sender).Down then
   begin
      TSpeedButton(Sender).Down := not TSpeedButton(Sender).Down;
      Exit;
   end;

   temPermissaoEspecial := dm.GetUsuarioLogado.TemPermissao( 0, 'TerminalAcesso.'+ACAO_IMPORTACAO_AGENDAMENTO, npEspecial, False );
   if not temPermissaoEspecial then
   begin
      TSpeedButton(Sender).Down := False;

      if TSpeedButton(Sender).Name = spIniciar.Name then
         spParar.Down := True
      else
         spIniciar.Down := True;

      // Fazemos isso para que primeiramente os botões voltem as suas posições iniciais (acima),
      // E depois sim, avisamos de que o usuário nao possui a permissão especial
      dm.GetUsuarioLogado.TemPermissao( 0, 'TerminalAcesso.'+ACAO_IMPORTACAO_AGENDAMENTO, npEspecial, True );
      Exit;
   end;

   // Se o botão que chamou esta função é o Iniciar (spIniciar), então mudamos o parâmetro para que inicie o serviço
   // Caso contrário, o paramos.
   IniciarPararServico( TSpeedButton(Sender).Name = spIniciar.Name );
end;

end.
