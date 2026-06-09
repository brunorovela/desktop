unit uTesouraria_transfere;

interface

uses
  Windows, DateUtils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uUsuario,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMDateTimePicker;

type
  Tfrm_Tesouraria_Transfere = class(TForm)
    pnTitulo: TPanel;
    bv1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edContaDe: TEdit;
    Label4: TLabel;
    edValor: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label6: TLabel;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    cbContaPara: TComboBox;
    Label5: TLabel;
    edHistoricoDe: TEdit;
    Label7: TLabel;
    edHistoricoPara: TEdit;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    umdtAjuste: TUMDateTimePicker;
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbContaParaChange(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure edValorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    saldoTotal: Double;
    ListaContas : Array of integer;
    ListaColigadas : Array of Integer;
  public
    { Public declarations }

    iContaDe   : Integer;
    iColigada  : Integer;
  end;

var
  frm_Tesouraria_Transfere: Tfrm_Tesouraria_Transfere;
CONST
       COD_ACAO_PADRAO = 7;


implementation

uses uDM, uClassMovimento;

{$R *.dfm}

procedure Tfrm_Tesouraria_Transfere.edValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if (key = ',') then
   begin
      if Pos(',', TEdit(Sender).Text) > 0 then
         key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;

end;

procedure Tfrm_Tesouraria_Transfere.edValorExit(Sender: TObject);
var
  valor : Currency;
  txt : String;
begin
       try
          valor := StrToFloat(TEdit(Sender).Text);
          txt := FloatToStrF(valor, ffFixed, 12, 2);
       except
             txt := '0,00';
       end;

       TEdit(Sender).Text := txt;

end;

procedure Tfrm_Tesouraria_Transfere.FormShow(Sender: TObject);
var
   qyAux : TUMZQuery;
   n : word;
   qyMovimentos, qyCalculaSaldo: TUMZQuery;
   vl_movimento, SaldoAcumulado : Double;
   tp_entrada_saida, cd_coligada, cd_coligada_conta, tp_conta, cd_mov_te: Integer;
   dt_movimento: TDate;
   cd_abertura_caixa : integer;
   xContaResultado: Integer;
begin
   // A variável iContaDe deve estar setada

   if iContaDe = 0 then
   begin
      Mensagem('Nenhuma conta foi selecionada para efetuar a transferencia.', 'Atenção', MB_OK + MB_ICONWARNING);
      Close;
      exit;
   end;

   Dm.CriarConsulta(qyAux);

   // Resgatar nome da conta atual

   qyAux.SQL.Clear;
   qyAux.SQL.Add(
   'SELECT ' +
   '  cd_caixa, ds_caixa, sn_conta_resultado ' +
   'FROM ' +
   '  fin_cadastro_contas ' +
   'WHERE ' +
   'cd_caixa = ' + IntToStr(iContaDe) +
   ' AND cd_coligada = ' + IntToStr(Self.iColigada));

   qyAux.Open;

   edContaDe.Text := qyAux.FieldByName('ds_caixa').AsString;
   xContaResultado := qyAux.FieldByName('sn_conta_resultado').AsInteger;

   // Montar o Combo das Contas para Transferencia
   qyAux.SQL.Clear;
   qyAux.SQL.Add(
   'SELECT                                 ' +
   '  f.cd_caixa, f.cd_coligada, CONCAT(f.ds_caixa, CONCAT('' - '', c.nm_coligada)) ds_caixa   ' +
   'FROM                                   ' +
   '  fin_cadastro_contas f INNER JOIN coligadas c ON (f.cd_coligada = c.cd_coligada)  ' +
   '  INNER JOIN coligadas as co ON (co.cd_coligada = c.cd_coligada ) ' +
   '  LEFT JOIN fin_contas_usuarios u ON (f.cd_caixa = u.cd_caixa AND u.cd_usuario = ' + IntToStr(DM.iCdPessoaLogado) + ' ) ' +
   'WHERE                                  ' +
   '  f.sn_ativa = ''S''  AND                ' +
   '  f.cd_caixa <> ' + IntToStr(iContaDe)     +
   '  AND (f.sn_transf_aberta = 1 OR u.cd_usuario is not null ) ' +
   '  AND co.cd_coligada_matriz = ' + IntToStr(DM.UsuarioLogado.GetColigadaLogada.Codigo) +
   '  AND f.sn_conta_resultado = ' + IntToStr(xContaResultado) +
   ' ORDER BY                              ' +
   '  c.nm_coligada, f.ds_caixa                      ');

   qyAux.Open;

   if qyAux.Eof then
   begin
      Mensagem('Nenhuma conta disponível para efetuar a transferencia.', 'Atenção', MB_OK + MB_ICONWARNING);
      Close;
      exit;
   end;

   qyAux.FetchAll;
   SetLength(ListaContas, qyAux.RecordCount);
   SetLength(ListaColigadas, qyAux.RecordCount);

   cbContaPara.Items.Clear;

   n := 0;

   while not qyAux.EOF do begin

       cbContaPara.Items.Add(qyAux.FieldByName('ds_caixa').AsString);

       ListaContas[n] := qyAux.FieldByName('cd_caixa').AsInteger;
       ListaColigadas[n] := qyAux.FieldByName('cd_coligada').AsInteger;
       qyAux.Next;
       INC(n);

   end;

   // Colocar a primeira conta como padrão
   if cbContaPara.Items.Count > 1 then
      cbContaPara.ItemIndex := -1
   else
      cbContaPara.ItemIndex := 0;

   edHistoricoDe.Text := 'TRANSFERÊNCIA DA CONTA ' + edContaDe.Text;
   edHistoricoPara.Text := 'TRANSFERÊNCIA PARA A CONTA ' + cbContaPara.Text;

   umdtAjuste.Date := DM.DataAtual;


   //Pega o saldo.
   dm.CriarConsulta(qyCalculaSaldo);
   dm.CriarConsulta(qyMovimentos);


   qyMovimentos.SQL.Text := ' '+
   'SELECT                                   '+
   '  fcc.tp_conta, fcc.cd_coligada          '+
   'FROM                                     '+
   '  fin_cadastro_contas fcc                '+
   'WHERE                                    '+
   '  fcc.cd_caixa = :cd_caixa               ';

   qyMovimentos.ParamByName('cd_caixa').AsInteger := iContaDe;
   qyMovimentos.Open;

   tp_conta := qyMovimentos.FieldByName('tp_conta').asInteger;
   cd_coligada_conta :=  qyMovimentos.FieldByName('cd_coligada').asInteger;

   //Se for conta caixa
   if tp_conta = 3 then
   begin
      // Pegar o saldo de abertura, da última sbertura - será a abertura que está ocorrendo a transferencia
      qyCalculaSaldo.Close();
      qyCalculaSaldo.SQL.Text :=
      'SELECT '+
	   '  vl_saldo_abertura, '+
	   '  dt_abertura,  '+
	   '  cd_abertura_caixa  '+
      'FROM '+
	   '  fin_controle_caixa co '+
      'WHERE '+
      '  cd_conta_banco = ' + IntToStr(iContaDe) +
      ' ORDER BY cd_abertura_caixa DESC LIMIT 1 ' ;
     qyCalculaSaldo.Open();

     SaldoAcumulado := qyCalculaSaldo.FieldByName('vl_saldo_abertura').AsFloat;
     cd_abertura_caixa :=  qyCalculaSaldo.FieldByName('cd_abertura_caixa').AsInteger;

     // pergar os movimentos do caixa aberto.
      qyMovimentos.Close;
      qyMovimentos.SQL.Text := ' '+
      'SELECT                                   '+
      '  SUM(IF(fmt.tp_entrada_saida = 1, fmt.vl_movimento, -fmt.vl_movimento)) as resultado '+
      'FROM fin_mov_tesouraria as fmt           '+
     'WHERE                                     '+
      '  fmt.cd_abertura_caixa = :cd_abertura_caixa      '+
      '  AND fmt.cd_caixa = :cd_caixa           ';


      qyMovimentos.ParamByName('cd_caixa').AsInteger := iContaDe;
      qyMovimentos.ParamByName('cd_abertura_caixa').AsInteger := cd_abertura_caixa;
      qyMovimentos.Open;

      SaldoAcumulado := SaldoAcumulado + qyMovimentos.FieldByName('resultado').AsFloat;
   end
   else
   begin
     // Se não for conta caixa. Pegar o saldo da conta direto da Get_saldo, com data de amanhã

      qyCalculaSaldo.Close();
      qyCalculaSaldo.SQL.Text := ''+
      'SELECT '+
      '  GET_SALDO(:CD_CAIXA, :CD_COLIGADA, :DT_BASE, NULL) AS SALDO '+
      'FROM '+
      '  DUAL';

      qyCalculaSaldo.ParamByName('CD_CAIXA').AsInteger := iContaDe;
      qyCalculaSaldo.ParamByName('CD_COLIGADA').AsInteger := cd_coligada_conta;
      // Saldo inicial de amanhã
      qyCalculaSaldo.ParamByName('DT_BASE').AsDate := incDay(Date);
      qyCalculaSaldo.Open;
      
      SaldoAcumulado := qyCalculaSaldo.FieldByName('SALDO').AsFloat;
      qyCalculaSaldo.Close;
   end;

   saldoTotal := SaldoAcumulado;
   edVAlor.SetFocus();

end;

procedure Tfrm_Tesouraria_Transfere.btnConfirmarClick(Sender: TObject);
Var
   mvEntrada : TMovimento;
   mvSaida : Tmovimento;

   iTpconta : Word; iCdCaixaAbertura : Integer;
   iSaida : Integer;
begin
   btnConfirmar.Enabled:=false;
   if (roundfloat(StrToFloat(edValor.Text),2) > roundfloat(saldoTotal,2)) then
   begin
      //Se não possui permissão bloqueia
      if not(DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'UMFinanceiro.MovimentacoesValoresSuperioresCaixas', npAcesso, False )) then
      begin
         Mensagem('O valor informado é superior ao saldo da conta (Saldo de atual de: ' + FormatFloat('###,###,#0.00',saldoTotal) + ')', 'Atenção', MB_OK + MB_ICONWARNING);
         exit;
      end
      else
      begin

         if not(DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'UMFinanceiro.MovimentacoesValoresSuperioresCaixas', npEspecial, False )) then
         begin

            //Se não possui permissão especial (31) pergunta se deseja continuar
            if MensagemCustomizavel( 'O valor informado é superior ao saldo da conta (Saldo de atual de R$ ' +
                  FormatFloat('###,###,#0.00',saldoTotal) + '), deseja continuar?',
               mtInformation,
               mbOKCancel,
               ['Sim', 'Não'],
               120,
               mbCancel
            ) <> mrOk then
            begin
               exit;
            end;

         end;
      end;
   end;


   if cbContaPara.ItemIndex < 0 then begin
      Mensagem('Selecione uma conta para efetuar a Transferência.', 'Atenção', MB_OK + MB_ICONWARNING);
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      exit;
   end;

   if DM.EstaBloqueado(umdtAjuste.Date, false) then begin
      // Mensagem('Não é possível efetuar Transferência com data inferior a ' + DateToStr(Dm.DataBloqueioFinanceiro(dtAjuste.Date) + '.' , 'Atenção', MB_OK + MB_ICONWARNING);
      Mensagem('Não é possível efetuar a transferência com essa data. O período está bloqueado até: ' + DateToStr(Dm.DataBloqueioFinanceiro(umdtAjuste.Date)) + '.' , 'Atenção', MB_OK + MB_ICONWARNING);
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      exit;
   end;


   // Gerar um movimento de saida de uma conta

   mvEntrada := TMovimento.Create;

   mvEntrada.Coligada := Self.iColigada;

   { Verificar se a conta está ativa }
   if not mvEntrada.VerificaContaAtiva(iContaDe, iTpConta, iCdCaixaAbertura) then
   begin
      { A Conta não está ativa }
      Mensagem('Não é possível efetuar lançamento em contas inativas.', 'Atenção', MB_OK + MB_ICONWARNING);
      mvEntrada.Free;
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      exit;
   end;

   if (iTpConta = 3) AND (iCdCaixaAbertura = 0) then
   begin
      { A conta caixa está fechada }
      Mensagem('Não é possível efetuar lançamento com o caixa fechado.', 'Atenção', MB_OK + MB_ICONWARNING);
      mvEntrada.Free;
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      exit;
   end;

   mvSaida := TMovimento.Create;

   { Verificar se a conta está ativa }
   if not mvSaida.VerificaContaAtiva(ListaContas[cbContaPara.ItemIndex], iTpConta, iCdCaixaAbertura, ListaColigadas[cbContaPara.ItemIndex] ) then
   begin
      { A Conta não está ativa }
      Mensagem('Não é possível efetuar lançamento em contas inativas.', 'Atenção', MB_OK + MB_ICONWARNING);
      mvEntrada.Free;
      mvSaida.Free;
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      exit;
   end;

   if (iTpConta = 3) AND (iCdCaixaAbertura = 0) then
   begin
      { A conta caixa está fechada }
      Mensagem('Não é possível efetuar lançamento com o caixa fechado.', 'Atenção', MB_OK + MB_ICONWARNING);
      mvEntrada.Free;
      mvSaida.Free;
      btnConfirmar.Enabled := true;
      btnCancelar.Enabled := true;
      exit;
   end;

   mvEntrada.CodAcao := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
   mvEntrada.ValorMovimento := StrToCurr(edValor.Text);
   mvEntrada.ValorEmCheque := 0;
   mvEntrada.ValorEmDinheiro := StrToCurr(edValor.Text);
   mvEntrada.Historico := edHistoricoPara.Text;

   mvEntrada.DataLiberacao := Date;
   mvEntrada.Origem := 3;  // Tesouraria
   mvEntrada.EntradaSaida := 2; // Saida
   mvEntrada.DataMovimento := umdtAjuste.Date;

   iSaida := mvEntrada.RegistrarMovimentacaoTe(iContaDe);

   // Gerar um movimento de entrada de outra conta

   mvSaida.CodAcao := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
   mvSaida.ValorMovimento := StrToCurr(edValor.Text);
   mvSaida.ValorEmCheque := 0;
   mvSaida.ValorEmDinheiro := StrToCurr(edValor.Text);
   mvSaida.Historico := edHistoricoDe.Text;

   mvSaida.DataLiberacao := Date;
   mvSaida.Origem := 3;  // Tesouraria
   mvSaida.EntradaSaida := 1; // Entrada
   mvSaida.DataMovimento := umdtAjuste.Date;
   mvSaida.Coligada := ListaColigadas[cbContaPara.ItemIndex];
   mvSaida.CodigoSaida := iSaida;
   mvSaida.RegistrarMovimentacaoTe(ListaContas[cbContaPara.ItemIndex]);

   Mensagem('Transferência Efetuada com sucesso.', 'UNI-MESTRE', MB_OK + MB_ICONEXCLAMATION);

   mvEntrada.Free;
   mvSaida.Free;

   Close;

end;

procedure Tfrm_Tesouraria_Transfere.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Tesouraria_Transfere.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Tesouraria_Transfere.cbContaParaChange(Sender: TObject);
begin
   edHistoricoPara.Text := 'TRANSFERÊNCIA PARA A CONTA ' + cbContaPara.Text; 
end;

procedure Tfrm_Tesouraria_Transfere.SpeedButton1Click(Sender: TObject);
begin
   edHistoricoPara.Text := edHistoricoDe.Text;
end;

end.

