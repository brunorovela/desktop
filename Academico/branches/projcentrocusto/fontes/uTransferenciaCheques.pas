unit uTransferenciaCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Db, ZConnection, Buttons, uColigada;

type
  TfTransferenciaCheques = class(TForm)
    Panel1: TPanel;
    cbContas: TComboBox;
    Label6: TLabel;
    Label4: TLabel;
    dtTransferencia: TDateTimePicker;
    cbSituacao: TComboBox;
    Label1: TLabel;
    ckbAtivaDebito: TCheckBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edValorTotal: TEdit;
    lbMsg: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure carregaSituacao;
    procedure carregaContas(ContaPadrao : Integer);
    function ProcuraCodigo(codigo: Integer; ListaCodigos: array of Integer): Integer;
  public
    ListaContas, ListaSituacao : Array of Integer;
    iCodCaixa, iCodSituacao, iCodColigada: Integer;
    bAtivarDebito: Boolean;
    { Public declarations }
  end;

var
  fTransferenciaCheques: TfTransferenciaCheques;

implementation

uses
   UDM, uClassMovimento, General, ZAbstractRODataset, ZAbstractDataset,
   ZDataset, UZDataset, uUsuario;

{$R *.dfm}

{ TfTransferenciaCheques }

procedure TfTransferenciaCheques.btnCancelarClick(Sender: TObject);
begin
   ModalResult:= mrCancel;
end;

procedure TfTransferenciaCheques.btnConfirmarClick(Sender: TObject);
begin
   if cbContas.ItemIndex = -1  then begin
      Mensagem('Selecione a conta para onde o cheque será enviado!',Application.Title, MB_OK + MB_ICONWARNING);
      cbContas.SetFocus();
      exit;
   end;

   if cbSituacao.ItemIndex = -1  then begin
      Mensagem('Selecione a situação que o cheque deverá assumir!',Application.Title, MB_OK + MB_ICONWARNING);
      cbSituacao.SetFocus();
      exit;
   end;

   // Verificar o bloqueio financeiro de data.
   if Dm.EstaBloqueado(dtTransferencia.DateTime, true) then begin
      dtTransferencia.SetFocus();
      Exit;
   end;

   bAtivarDebito  := ckbAtivaDebito.checked;
   iCodSituacao   := ListaSituacao[cbSituacao.ItemIndex];
   iCodCaixa      := ListaContas[cbContas.ItemIndex];
   iCodColigada   := TColigada(cbContas.Items.Objects[cbContas.ItemIndex]).Codigo;   
   
   ModalResult:=mrOk;
end;

procedure TfTransferenciaCheques.carregaContas(ContaPadrao : Integer);
var
   qyContas : TUMZQuery;
   Movimento : TMovimento;
   tp_Conta: word;  cd_Abertura : Integer;
begin

   Dm.CriarConsulta(qyContas);

   Movimento := TMovimento.create;

   qyContas.SQL.Clear;
   qyContas.SQL.Text := '' +
     ' SELECT cc.cd_caixa, cc.ds_caixa, cc.tp_conta, u.sn_padrao, cc.cd_coligada  ' +
     ' FROM fin_cadastro_contas cc                          ' +
     '  LEFT JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa AND u.cd_usuario = ' + IntToStr(DM.iCdPessoaLogado) + ' ) ' +
     ' WHERE cc.sn_ativa = ''S''           ' +
     Format('   AND cc.cd_coligada IN (%s) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]) +
     '   AND (cc.sn_transf_aberta = 1 OR u.cd_usuario is not null ) ' +
     ' ORDER by cc.ds_caixa              ';

   qyContas.Open();

   cbContas.Items.Clear;

   setlength( ListaContas, 0 );

   while not qyContas.Eof do
   begin
      Movimento.Coligada := qyContas.FieldByNAme('cd_coligada').AsInteger;

      { Somente inserir as contas que poderão ser utilizadas para a Baixa }
      if Movimento.VerificaContaAtiva(qyContas.FieldByNAme('cd_caixa').AsInteger, tp_Conta, cd_Abertura) then
      begin

         if (tp_Conta <> 3) OR (cd_Abertura > 0) then
         begin
            cbContas.Items.AddObject(
               qyContas.FieldByName('ds_caixa').AsString,
               TColigada.Create(qyContas.FieldByName('cd_coligada').AsInteger)
            );
            SetLength(listaContas, length(listacontas) + 1);
            ListaContas[length(listacontas) - 1] := qyContas.FieldByName('cd_caixa').AsInteger;
         end;

      end;

      if qyContas.FieldByName('sn_padrao').AsInteger = 1 then begin
         ContaPadrao := qyContas.FieldByNAme('cd_caixa').AsInteger;
      end;

      qyContas.Next;

   end;
   
   { Verificar qual a conta padrão será utilizada }

   cbContas.ItemIndex :=  ProcuraCodigo(ContaPadrao, ListaContas);

   Movimento.Free;
end;

procedure TfTransferenciaCheques.carregaSituacao();
var
   qySituacao : TUMZQuery;
begin
   Dm.CriarConsulta(qySituacao);

   qySituacao.SQL.Clear;
   qySituacao.SQL.Text := '' +
     ' SELECT cd_situacao, ds_valor               ' +
     ' FROM                                       ' + 
     '      situacoes                             ' +
     ' WHERE cd_modulo = 2050                     ' +
     ' ORDER by ds_valor              ';

   qySituacao.Open();

   cbSituacao.Items.Clear;

   setlength( ListaSituacao, 0 );

   while not qySituacao.Eof do
   begin

      cbSituacao.Items.Add(qySituacao.FieldByName('ds_valor').AsString);
      SetLength(ListaSituacao, length(ListaSituacao) + 1);
      ListaSituacao[length(ListaSituacao) - 1] := qySituacao.FieldByName('cd_situacao').AsInteger;

      qySituacao.Next;

   end;

   { Verificar qual a conta padrão será utilizada }
end;

procedure TfTransferenciaCheques.FormShow(Sender: TObject);
begin
   carregaContas(1);
   carregaSituacao();
   dtTransferencia.DateTime:= Now();

   ckbAtivaDebito.Visible := DM.variavel_parametro('financeiro_tipo_titulo_cheque_devolvido') <> '';

   ckbAtivaDebito.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Tesouraria.ControleCheques.Transferir', npAcesso, false);

end;

function TfTransferenciaCheques.ProcuraCodigo(codigo: Integer;
  ListaCodigos: array of Integer): Integer;
var
   n : word;
begin
   result := -1;

   For n := 0 to Length(ListaCodigos) - 1 do
   begin
       if ListaCodigos[n] = Codigo then
       begin
          result := n;
          exit;
       end
   end;

end;

end.
