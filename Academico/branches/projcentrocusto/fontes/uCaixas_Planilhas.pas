unit uCaixas_Planilhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, DB, ZConnection, uDM, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, UMComboBox, uColigada, uListaColigadas;

type
  Tfrm_Caixas_Planilha = class(TForm)
    pnTitulo: TPanel;
    grd: TDBGrid;
    pnRodape: TPanel;
    sbAbrirCaixa: TSpeedButton;
    sbFechar: TSpeedButton;
    sbFecharCaixa: TSpeedButton;
    sbImprimirResumo: TSpeedButton;
    sbPlanilhaCaixa: TSpeedButton;
    qyCaixas: TUMZQuery;
    qyCaixasds_caixa: TStringField;
    qyCaixasnm_banco: TStringField;
    qyCaixasds_tipo: TStringField;
    qyCaixasdescSituacao: TStringField;
    srcCaixa: TDataSource;
    qyControle: TUMZQuery;
    qyCaixassn_ativa: TStringField;
    qyAux: TUMZQuery;
    qyCaixastp_conta: TSmallintField;
    btnTransferencia: TSpeedButton;
    btnAtualizarSaldo: TSpeedButton;
    qyCaixascd_coligada: TSmallintField;
    qyCaixasvl_saldo_inicio: TFloatField;
    qyCaixascd_caixa: TIntegerField;
    Panel1: TPanel;
    Panel2: TPanel;
    ckbInativas: TCheckBox;
    Label31: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    FBnFiltra: TSpeedButton;
    qryFiltro: TUMZQuery;
    qryFiltroDS_MOEDA: TStringField;
    qryFiltroDS_SIGLA: TStringField;
    qryFiltroCD_MOVIMENTO_TE: TLargeintField;
    qryFiltroCD_COLIGADA: TIntegerField;
    qryFiltroCD_CAIXA: TIntegerField;
    qryFiltroCD_ABERTURA_CAIXA: TIntegerField;
    qryFiltroDT_MOVIMENTO: TDateTimeField;
    qryFiltroCD_ACAO: TIntegerField;
    qryFiltroNR_DOCUMENTO: TStringField;
    qryFiltroDS_MOVIMENTO: TStringField;
    qryFiltroDT_LIBERACAO: TDateTimeField;
    qryFiltroCD_ORIGEM: TSmallintField;
    qryFiltroTP_ENTRADA_SAIDA: TSmallintField;
    qryFiltroVL_MOVIMENTO: TFloatField;
    qryFiltroCD_MOEDA: TLargeintField;
    qryFiltroVL_MOEDA: TFloatField;
    qryFiltroVL_SALDO: TFloatField;
    qryFiltroVL_DINHEIRO: TFloatField;
    qryFiltroVL_CHEQUE: TFloatField;
    qryFiltroCD_MENSALIDADE: TLargeintField;
    qryFiltroCD_USUARIO: TLargeintField;
    qryFiltroSN_COMPENSADO: TSmallintField;
    qryFiltroDT_COMPENSACAO: TDateTimeField;
    qryFiltroCD_FORMA_PGTO: TLargeintField;
    qryFiltroDT_REGISTRO: TDateTimeField;
    qryFiltroNR_CHEQUE: TIntegerField;
    qryFiltroVL_SALDO_COMPENSADO: TFloatField;
    qryFiltroCD_TITULO: TLargeintField;
    qryFiltroNR_ESTORNO: TLargeintField;
    qryFiltroCD_TRANSFERE: TLargeintField;
    qryFiltroCD_CHEQUE: TLargeintField;
    qryFiltroDS_OBSERVACAO: TMemoField;
    qryFiltroDS_OBSERVACAO_1: TMemoField;
    qryFiltroNM_FORNECEDOR: TStringField;
    qryFiltrodesOrigem: TStringField;
    qryFiltroValMovimento: TFloatField;
    qryFiltroValEntradasBanco: TFloatField;
    qryFiltroValSaidasBanco: TFloatField;
    qryFiltrodesES: TStringField;
    qryFiltrodesDinCh: TStringField;
    qryFiltrodesCh: TStringField;
    qryFiltrodesChSit: TStringField;
    qryFiltrodesChSitSigla: TStringField;
    qryFiltrodesChCaixa: TStringField;
    qryFiltroNM_USUARIO: TStringField;
    procedure FBnFiltraClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbInativasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyCaixasCalcFields(DataSet: TDataSet);
    procedure sbFecharClick(Sender: TObject);
    procedure sbAbrirCaixaClick(Sender: TObject);
    procedure srcCaixaDataChange(Sender: TObject; Field: TField);
    procedure sbFecharCaixaClick(Sender: TObject);
    procedure sbPlanilhaCaixaClick(Sender: TObject);
    procedure sbImprimirResumoClick(Sender: TObject);
    procedure btnTransferenciaClick(Sender: TObject);
    procedure btnAtualizarSaldoClick(Sender: TObject);
  strict private
      procedure CarregarControleCaixa();

  private
    { Private declarations }
    Function VerificarPermissaoUsuario() : Boolean;
    Procedure Filtrar();
    procedure CarregaUnidadeEnsino();
  public
    { Public declarations }
  end;

var
  frm_Caixas_Planilha: Tfrm_Caixas_Planilha;

implementation

uses
   uTesouraria_Planilha, Main, uCaixas_Abertura, uTesouraria_gerar, uUsuario,
   uClassMovimento, uResumo, uTesouraria_transfere, uTesouraria_atualiza, uBuscaCaixaPlanilha,
   uBuscarVariosCaixas, uListarMovimentosCaixas;

{$R *.dfm}

procedure Tfrm_Caixas_Planilha.FBnFiltraClick(Sender: TObject);
var
   aux, sSQL: string;
   qtdParams, i: Integer;
   qryFiltro2: TUMZquery;
begin

   if not PrincipalForm.ProcuraForm( TForm(uFrmListarMovimentosCaixas) ) then
   begin
      Application.CreateForm(TuFrmListarMovimentosCaixas, uFrmListarMovimentosCaixas );
   end;

   uFrmListarMovimentosCaixas.executaBusca(
      TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
   );
end;

procedure Tfrm_Caixas_Planilha.Filtrar;
Var
   qyAtualizarSaldos, qyMvto : TUMZQuery;
   iDias : Integer;
   n : Integer;
   dData : TDateTime;
begin
   CarregarControleCaixa();

   qyCaixas.Close();

   qyCaixas.SQL.Text := Format(
      ' SELECT c.*, t.ds_tipo FROM ' +
      '   fin_cadastro_contas c, ' +
      '   fin_cadastro_contas_tipos t ' +
      ' WHERE   ' +
      '   t.cd_tipo = c.tp_conta AND ' +
      '   ( c.cd_coligada = %d ) ',
      [TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo]
   );

   if not ckbInativas.Checked then
   begin
      qyCaixas.SQL.Add(' AND c.sn_ativa = ''S'' ');
   end;

   qyCaixas.SQL.Add(' ORDER BY c.sn_ativa DESC, c.ds_caixa  ');

   qyCaixas.Open;
end;

procedure Tfrm_Caixas_Planilha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_Caixas_Planilha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F7 : if sbImprimirResumo.Enabled then sbImprimirResumoClick( nil );
      VK_F12 : sbFecharClick( nil );   
   end;
end;

procedure Tfrm_Caixas_Planilha.FormShow(Sender: TObject);
begin
   CarregaUnidadeEnsino;
   
   if cbUnidadeEnsino.ItemIndex > 0 then
      Filtrar();
end;

procedure Tfrm_Caixas_Planilha.grdDblClick(Sender: TObject);
begin
   if sbPlanilhaCaixa.Enabled then
   begin
      sbPlanilhaCaixaClick(nil);
   end;
end;

procedure Tfrm_Caixas_Planilha.qyCaixasCalcFields(DataSet: TDataSet);
begin

   if qyCaixas.FieldByName('sn_ativa').AsString = 'N' then
      qyCaixas.FieldByNAme('descSituacao').AsString := 'DESATIVADA'
   else
     begin
       if qyCaixas.FieldByName('tp_conta').AsInteger = 3 then // Conta Caixa
       begin
          qyControle.Locate('cd_conta_banco', qyCaixas.FieldByNAme('cd_caixa').AsString , []);

          if qyControle.FieldByName('cd_conta_banco').AsString = qyCaixas.FieldByNAme('cd_caixa').AsString then
            qyCaixas.FieldByNAme('descSituacao').AsString := 'ABERTO'
          else
            qyCaixas.FieldByNAme('descSituacao').AsString := 'FECHADO';
       end
       else
       begin
          qyCaixas.FieldByNAme('descSituacao').AsString := 'ATIVA';
       end;
     end;
end;

procedure Tfrm_Caixas_Planilha.sbFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Caixas_Planilha.sbAbrirCaixaClick(Sender: TObject);
Var
   qySaldoAnterior : TUMZQuery;

   saldoInicial : Currency;
   iCaixaSelecionado: integer;
   MvAbertura : TMovimento;
begin

   if not DM.UsuarioLogado.TemPermissao( 2008, npAcesso, True ) then Abort;

   if not VerificarPermissaoUsuario() then Exit;   

   Dm.CriarConsulta(qySaldoAnterior);

   { Buscar o Saldo Anterior - Último Fechamento }
   qySaldoAnterior.Close;
   qySaldoAnterior.SQL.Clear;
   qySaldoAnterior.SQL.Add('Select * from fin_controle_caixa WHERE cd_conta_banco = :cd_conta AND cd_coligada = :cd_coligada');
   qySaldoAnterior.SQL.Add('ORDER BY cd_abertura_caixa DESC');

   qySaldoAnterior.ParamByName('cd_conta').AsInteger := qyCaixas.FieldByName('cd_caixa').AsInteger;
   qySaldoAnterior.ParamByName('cd_coligada').AsInteger := qyCaixas.FieldByName('cd_coligada').AsInteger;

   qySaldoAnterior.Open;

   { Se naum houve lançamento nesta conta, pegar o saldo inicial }
   if qySaldoAnterior.IsEmpty then
      saldoInicial := qyCaixas.FieldbyName('vl_saldo_inicio').AsFloat
      { senão pegar o saldo do último fechamento }
   else
      saldoInicial := qySaldoAnterior.FieldByName('vl_saldo_fechamento').AsFloat;

   { Abrir tela confirmando abertura }
   Application.CreateForm(Tfrm_Caixas_Abertura, frm_Caixas_Abertura);

   frm_Caixas_Abertura.tOp := Abertura;
   frm_caixas_abertura.sConta := qyCaixasds_caixa.AsString;
   frm_Caixas_Abertura.dData := Dm.DataAtual();
   frm_Caixas_Abertura.cSaldo := saldoInicial;
   iCaixaSelecionado := qyCaixascd_caixa.Value;

   if frm_Caixas_Abertura.ShowModal = mrOk then
   begin
      qyControle.Close();
      qyControle.Open();
      qyCaixas.Locate('cd_caixa',iCaixaSelecionado,[]);
      if (qyCaixasdescSituacao.AsString = 'ABERTO') then
      begin
         Mensagem('AÇÃO CANCELADA!' + CHR(13) + CHR(13) + 'Caixa já foi Aberto a poucos instantes por outro Usuário', 'UNIMESTRE', MB_OK + MB_ICONINFORMATION);
         exit;
      end;

      { Abrir o caixa }
      qyAux.Close;
      qyAux.SQL.Clear;
      qyAux.SQL.Add('INSERT INTO fin_controle_caixa (cd_coligada, cd_abertura_caixa, dt_abertura, ');
      qyAux.SQL.Add('cd_conta_banco, vl_saldo_abertura, ds_situacao, cd_usuario) ');
      qyAux.SQL.Add('VALUES (:cd_coligada, :cd_abertura_caixa, now(), :cd_conta_banco, :vl_saldo_abertura, :ds_situacao, :cd_usuario) ');

      qyAux.ParamByName('cd_coligada').AsInteger := qyCaixascd_coligada.AsInteger;
      qyAux.ParamByName('cd_abertura_caixa').AsInteger := Dm.ProximoId('cd_abertura_caixa','fin_controle_caixa');
      qyAux.ParamByName('cd_conta_banco').AsInteger := qyCaixascd_caixa.AsInteger;

      { Verificar qual será o valor inicial }

      qyAux.ParamByName('vl_saldo_abertura').AsFloat := saldoInicial;

      qyAux.ParamByName('ds_situacao').AsString := 'A'; // ABERTO
      qyAux.ParamByName('cd_usuario').AsInteger := DM.iCdPessoaLogado;

      qyAux.ExecSQL;

      { Registrar o movimento na tesouraria }

      begin

         MvAbertura := TMovimento.create();

         MvAbertura.CodAcao := 5; // Ajuste de Saldo
         MvAbertura.Historico := 'Saldo Inicial de abertura';
         MvAbertura.NumeroDocumento := '';
         MvAbertura.ValorEmCheque := 0;
         MvAbertura.ValorEmCheque := 0;
         MvAbertura.ValorMovimento := 0;
         MvAbertura.DataLiberacao := Dm.DataAtual;
         MvAbertura.DataMovimento := Dm.DataAtual;
         MvAbertura.Coligada := qyCaixascd_coligada.AsInteger;
         MvAbertura.RegistrarMovimentacaoTe(qyCaixas.FieldByNAme('cd_caixa').AsInteger);

      end;

      { Fim do registro do movimento na tesouraria }


      qyControle.Close;
      qyControle.Open;

      qyCaixas.Close;
      qyCaixas.Open;
      qySaldoAnterior.Close;
      qySaldoAnterior.Free;
   end;

end;

procedure Tfrm_Caixas_Planilha.srcCaixaDataChange(Sender: TObject;
  Field: TField);
begin
   sbAbrirCaixa.Enabled := qyCaixasdescSituacao.AsString = 'FECHADO';
   sbFecharCaixa.Enabled := qyCaixasdescSituacao.AsString = 'ABERTO';
   sbPlanilhaCaixa.Enabled := (qyCaixasdescSituacao.AsString = 'ATIVA') OR (qyCaixasdescSituacao.AsString = 'ABERTO');
   btnTransferencia.Enabled := sbPlanilhaCaixa.Enabled;
   btnAtualizarSaldo.Enabled := sbPlanilhaCaixa.Enabled;
   sbImprimirResumo.Enabled := NOT qyCaixas.IsEmpty;

end;

Function Tfrm_Caixas_Planilha.VerificarPermissaoUsuario : Boolean;
begin

   qyAux.Close();
   qyAux.SQL.Text := ''+
    ' SELECT cd_usuario FROM fin_contas_usuarios ' +
    ' WHERE cd_caixa = :cd_caixa AND cd_coligada = :cd_coligada AND cd_usuario = :cd_usuario ';
   qyAux.ParamByName('cd_caixa').AsInteger := qyCaixascd_caixa.AsInteger;
   qyAux.ParamByName('cd_coligada').AsInteger := qyCaixascd_coligada.AsInteger;
   qyAux.ParamByName('cd_usuario').AsInteger := DM.iCdPessoaLogado;
   qyAux.Open();

   if qyAux.IsEmpty then begin

      Mensagem('Atenção' + CHR(13) + CHR(13) + 'Usuário não tem permissão para acessar esta conta.', 'UNIMESTRE', MB_OK + MB_ICONINFORMATION);

      result := false;

   end else begin

      result := true;

   end;      

end;

procedure Tfrm_Caixas_Planilha.sbFecharCaixaClick(Sender: TObject);
{ F E C H A M E N T O   D O   C A I X A }
var
  atual : Currency;

  qyTotais : TUMZQuery;
  mvAjusteSaldo : TMovimento;

begin

   if not DM.UsuarioLogado.TemPermissao( 2008, npAlterar, True ) then Abort;

   if not VerificarPermissaoUsuario() then Exit;

   DM.CriarConsulta(qyTotais);

   // Pegar o saldo do último Lançamento do caixa
   qyControle.Locate('cd_conta_banco', qyCaixas.FieldByNAme('cd_caixa').AsString , []);
   qyTotais.Close;
   qyTotais.SQL.Clear;
   qyTotais.SQL.Text :=
     ' SELECT GET_SALDO(cd_caixa, cd_coligada, :DT_BASE, cd_movimento_te) AS SALDO' +
     ' FROM fin_mov_tesouraria  ' +
     ' WHERE cd_abertura_caixa = ' + qyControle.FieldByName('cd_abertura_caixa').AsString +
     ' ORDER BY cd_movimento_te DESC';
   qyTotais.ParamByName('DT_BASE').AsDateTime := DM.DataAtual;
   qyTotais.Open();

   atual := qyTotais.FieldByName('SALDO').AsFloat;

   { Abrir tela confirmando Fechamento }
   Application.CreateForm(Tfrm_Caixas_Abertura, frm_Caixas_Abertura);

   frm_Caixas_Abertura.tOp := Fechamento;
   frm_caixas_abertura.sConta := qyCaixasds_caixa.AsString;
   frm_Caixas_Abertura.dData := Dm.DataAtual();
   frm_Caixas_Abertura.cSaldo := atual;

   if frm_Caixas_Abertura.ShowModal = mrOk then
   begin


      { Fechar o Caixa e Atribuir o Valor de Fechamento }
      qyAux.Close;
      qyAux.SQL.Clear;
      qyAux.SQL.Add('UPDATE fin_controle_caixa SET vl_saldo_fechamento = :vl_saldo_fechamento,');
      qyAux.SQL.Add('dt_fechamento = now(), ds_situacao = :ds_situacao');
      qyAux.SQL.Add('WHERE cd_coligada = :cd_coligada AND cd_conta_banco = :cd_conta_banco AND ds_situacao = ''A''' );

      qyAux.ParamByName('cd_conta_banco').AsInteger := qyCaixas.FieldByName('cd_caixa').AsInteger;
      qyAux.ParamByName('cd_coligada').AsInteger := qyCaixas.FieldByName('cd_coligada').AsInteger;

      { Verificar qual será o valor Final }
      qyAux.ParamByName('vl_saldo_fechamento').AsFloat := atual;

      qyAux.ParamByName('ds_situacao').AsString := 'F'; // FECHADO

      qyAux.ExecSQL;

      qyControle.Close;
      qyControle.Open;

      qyCaixas.Close;
      qyCaixas.Open;

      qyTotais.Free;

   end;

end;

procedure Tfrm_Caixas_Planilha.sbPlanilhaCaixaClick(Sender: TObject);
var
   intCodAbertura : integer;
begin

  if not VerificarPermissaoUsuario() then Exit;

  if qyCaixas.FieldByName('sn_ativa').AsString = 'N' then
      Exit
  else
     begin
       if qyCaixastp_conta.AsInteger = 3 then // Conta Caixa
       begin

         if not DM.UsuarioLogado.TemPermissao( 2009, npAcesso, True ) then Exit;

         qyControle.Locate('cd_conta_banco', qyCaixas.FieldByNAme('cd_caixa').AsString , []);

         if qyControle.FieldByName('cd_conta_banco').AsString = qyCaixas.FieldByNAme('cd_caixa').AsString then
            intCodAbertura := qyControle.FieldByName('cd_abertura_caixa').AsInteger
         else
           exit;
       end
       else begin

          if not DM.UsuarioLogado.TemPermissao( 2035, npAcesso, True ) then Exit;

          intCodAbertura := 0;

       end;
     end;

   if not PrincipalForm.ProcuraForm( TForm(frm_Tesouraria_Planilha) ) then
   Begin
      Application.CreateForm( Tfrm_Tesouraria_Planilha, frm_Tesouraria_Planilha );
      frm_Tesouraria_Planilha.bEstornar:= qyCaixastp_conta.AsInteger <> 3;
   end else begin
      frm_Tesouraria_Planilha.bEstornar:= qyCaixastp_conta.AsInteger <> 3;
      frm_Tesouraria_Planilha.Show;
   end;

   frm_Tesouraria_Planilha.cd_coligada_caixa := qyCaixascd_coligada.AsInteger;
   frm_tesouraria_planilha.pnTitulo.Caption  := 'PLANILHA DE CAIXA - '+qyCaixasds_caixa.AsString;

   if qyCaixastp_conta.AsInteger = 3 then begin
      frm_Tesouraria_Planilha.sbReceber.Caption := 'Receber';
      frm_Tesouraria_Planilha.sbPagar.Caption := 'Pagar';
   end else begin
      frm_Tesouraria_Planilha.sbReceber.Caption := 'Crédito';
      frm_Tesouraria_Planilha.sbPagar.Caption := 'Débito';
   end;

   frm_Tesouraria_Planilha.qryTesouraria.Close;
   frm_Tesouraria_Planilha.intCodAbertura := intCodAbertura;
   frm_Tesouraria_Planilha.intCodCaixa := qyCaixascd_caixa.AsInteger;
   frm_Tesouraria_Planilha.lbCaixa.Caption := 'Caixa aberto em: ' + FormatDateTime('dd/mm/yyyy hh:mm',qyControle.FieldByName('dt_abertura').AsDateTime);
   frm_Tesouraria_Planilha.Filtra;
end;

procedure Tfrm_Caixas_Planilha.sbImprimirResumoClick(Sender: TObject);
begin

    if not DM.UsuarioLogado.TemPermissao( 2010, npAcesso, True ) then Exit;

    if not VerificarPermissaoUsuario() then Exit;

    Application.CreateForm(TfrmResumo, frmResumo);

    frmResumo.CaixaDepto := qyCaixascd_caixa.AsInteger;
    frmResumo.TipoCaixa := qyCaixastp_conta.AsInteger;
    frmResumo.Coligada := qyCaixascd_coligada.AsInteger;
    frmResumo.ShowModal;

    FreeAndNil(frmResumo);
end;

procedure Tfrm_Caixas_Planilha.btnTransferenciaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 2036, npAcesso, True ) then Abort;

   if not VerificarPermissaoUsuario() then Exit;
   
   Application.CreateForm(Tfrm_Tesouraria_Transfere, frm_Tesouraria_Transfere);

   frm_Tesouraria_Transfere.iContaDe   := qyCaixas.FieldByName('cd_caixa').AsInteger;
   frm_Tesouraria_Transfere.iColigada  := qyCaixascd_coligada.AsInteger;

   frm_Tesouraria_Transfere.ShowModal;

end;

procedure Tfrm_Caixas_Planilha.CarregarControleCaixa;
const
   SQL_CARREGAR_CONTORLE_CAIXA =
      ' SELECT * ' +
      ' FROM fin_controle_caixa ' +
      ' WHERE ds_situacao= ''A'' AND cd_coligada IN ( %s ) ' +
      ' ORDER BY cd_conta_banco ';
begin
   qyControle.Close;
   qyControle.SQL.Text := Format( SQL_CARREGAR_CONTORLE_CAIXA, [ DM.UsuarioLogado.GetColigadasFilhaSelecionada() ] );
   qyControle.Open();
end;

procedure Tfrm_Caixas_Planilha.CarregaUnidadeEnsino;
begin
   DM.CarregaColigadas(cbUnidadeEnsino);
end;

procedure Tfrm_Caixas_Planilha.cbUnidadeEnsinoChange(Sender: TObject);
begin
   if cbUnidadeEnsino.ItemIndex > 0 then
      Filtrar();
end;

procedure Tfrm_Caixas_Planilha.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);

   if cbUnidadeEnsino.ItemIndex > 0 then
      Filtrar();
end;

procedure Tfrm_Caixas_Planilha.ckbInativasClick(Sender: TObject);
begin
   if cbUnidadeEnsino.ItemIndex > 0 then Filtrar();
end;

procedure Tfrm_Caixas_Planilha.btnAtualizarSaldoClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 2037, npAcesso, True ) then Abort;

   if not VerificarPermissaoUsuario() then Exit;

   Application.CreateForm(Tfrm_Tesouraria_atualiza, frm_Tesouraria_atualiza);

   frm_Tesouraria_atualiza.iContaDe := qyCaixascd_caixa.AsInteger;
   frm_Tesouraria_atualiza.iColigadaSelecionada := qyCaixascd_coligada.AsInteger;

   frm_Tesouraria_atualiza.ShowModal;
end;

end.

