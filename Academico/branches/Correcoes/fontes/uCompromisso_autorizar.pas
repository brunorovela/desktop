unit uCompromisso_autorizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZConnection, StdCtrls, DBCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Grids, DBGrids;

type
  Tfrm_compromisso_autorizar = class(TForm)
    pnTitulo: TPanel;
    dsCompromisso: TDataSource;
    btnAutorizar: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnNaoAutorizar: TBitBtn;
    btnFechar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    GroupBox2: TGroupBox;
    me_autoriza: TMemo;
    qyAcao: TUMZQuery;
    qyAutoriza: TUMZQuery;
    Label7: TLabel;
    cbAutoriza: TComboBox;
    me_resposta: TMemo;
    Label9: TLabel;
    sbNovo: TSpeedButton;
    Label10: TLabel;
    DBText8: TDBText;
    Label11: TLabel;
    lbOrcamento: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    dsApropriacoes: TDataSource;
    qyApropriacoes: TUMZQuery;
    qyApropriacoesds_conta: TStringField;
    qyApropriacoesds_centro: TStringField;
    qyApropriacoesvl_movimento: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure cbAutorizaChange(Sender: TObject);
    procedure btnNaoAutorizarClick(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsCompromissoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    ListaAutoriza : Array of integer;
    Procedure SalvarResposta();
    procedure atualizarApropriacoes() ;
    Function GetOrcamento(Contas: String; Data: TDateTime; Centros: String = ''): Currency;
  public
    procedure autorizaPagamento();
    { Public declarations }
  end;

var
  frm_compromisso_autorizar: Tfrm_compromisso_autorizar;
  MostrarOrcamento : Boolean;

implementation

uses uContasPagar_Planilha, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_compromisso_autorizar.autorizaPagamento;
var
   i : Integer;
begin
  qyAcao.Close();
  qyAcao.SQL.Text :=
     ' INSERT INTO fin_contas_pagar_autoriza (cd_titulo, cd_coligada, cd_autoriza_situ, cd_autoriza_usuario, dt_autoriza, me_autoriza) ' +
     ' VALUES (:cd_titulo, :cd_coligada, :cd_autoriza_situ, :cd_usuario, now(), :me_autoriza)     ';

  qyAcao.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
  qyAcao.ParamByName('cd_coligada').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsInteger;
  qyAcao.ParamByName('cd_autoriza_situ').AsInteger :=  1;
  qyAcao.ParamByName('cd_usuario').AsInteger :=  DM.iCdPessoaLogado;
  qyAcao.ParamByName('me_autoriza').AsString := me_autoriza.Lines.Text;

  qyAcao.ExecSQL();

  i:= DM.LastInsert();

  qyAcao.Close();
  qyAcao.SQL.Text :=
     ' UPDATE fin_contas_pagar      ' +
     '    SET cd_autoriza = :cd_autoriza     ' +
     '  WHERE cd_titulo = :cd_titulo ' +
     '    AND cd_coligada = :cd_coligada ';

  qyAcao.ParamByName('cd_autoriza').AsInteger :=  i;

  qyAcao.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
  qyAcao.ParamByName('cd_coligada').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsInteger;

  qyAcao.ExecSQL();
end;

procedure Tfrm_compromisso_autorizar.btnAnteriorClick(Sender: TObject);
begin
  SalvarResposta();

  frm_Compromisso_Planilha.qryContasPagar.Prior();

    atualizarApropriacoes();

  if frm_Compromisso_Planilha.qryContasPagar.Bof then begin
    Mensagem('Você está no primeiro compromisso da lista.', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION, Handle);
  end;
end;

procedure Tfrm_compromisso_autorizar.btnProximoClick(Sender: TObject);
begin
  SalvarResposta();

  frm_Compromisso_Planilha.qryContasPagar.Next();

  atualizarApropriacoes();

  if frm_Compromisso_Planilha.qryContasPagar.Eof then begin
    Mensagem('Você está no último compromisso da lista.', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION, Handle);
  end;

end;

procedure Tfrm_compromisso_autorizar.cbAutorizaChange(Sender: TObject);
begin

   if (cbAutoriza.ItemIndex <= 0) AND (ListaAutoriza[0] = 0) then begin
      // Verificar se escolheu a primeira opção da Combo e não está autorizado ainda
      me_autoriza.Lines.Clear;
      me_resposta.Lines.Clear;

      btnAutorizar.Enabled := true;
      btnNaoAutorizar.Enabled := true;
      me_autoriza.Enabled := true;
      me_resposta.Enabled := false;

      if (not DM.UsuarioLogado.TemPermissao( 2046, npIncluir, false ) ) OR (frm_compromisso_planilha.qryContasPagarcd_situacao.AsInteger = 2) then begin
         btnAutorizar.Enabled := false;
         btnNaoAutorizar.Enabled := false;
         me_autoriza.Enabled := false;
      end;

   end else begin
      // Selecionar a autorização selecionada

      qyAutoriza.Locate('cd_autoriza', ListaAutoriza[cbAutoriza.ItemIndex], []);
      me_autoriza.Lines.Text := qyAutoriza.FieldByName('me_autoriza').AsString;
      me_resposta.Lines.Text := qyAutoriza.FieldByName('me_resposta').AsString;

      btnAutorizar.Enabled := false;
      btnNaoAutorizar.Enabled := false;
      me_autoriza.Enabled := false;  
                                
      if (frm_Compromisso_Planilha.qryContasPagarcd_autoriza_situ.AsInteger = 1) OR (trim(me_resposta.Lines.Text) <> '') then begin

         me_resposta.Enabled := false;

      end else begin

         me_resposta.Enabled := DM.UsuarioLogado.TemPermissao( 2046, npAlterar, false );

      end;

   end;

end;

procedure Tfrm_compromisso_autorizar.btnAutorizarClick(Sender: TObject);
begin
  // Autorizar o Pagamento selecionado
  autorizaPagamento();
  dsCompromissoDataChange(dsCompromisso, nil);

end;

procedure Tfrm_compromisso_autorizar.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_compromisso_autorizar.btnNaoAutorizarClick(Sender: TObject);
Var
   i : Integer;
begin
  // Autorizar o Pagamento selecionado

  qyAcao.Close();
  qyAcao.SQL.Text :=
     ' INSERT INTO fin_contas_pagar_autoriza (cd_titulo, cd_coligada, cd_autoriza_situ, cd_autoriza_usuario, dt_autoriza, me_autoriza) ' +
     ' VALUES (:cd_titulo, :cd_coligada, :cd_autoriza_situ, :cd_usuario, now(), :me_autoriza)     ';

  qyAcao.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
  qyAcao.ParamByName('cd_coligada').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsInteger;
  qyAcao.ParamByName('cd_autoriza_situ').AsInteger :=  2;
  qyAcao.ParamByName('cd_usuario').AsInteger :=  DM.iCdPessoaLogado;
  qyAcao.ParamByName('me_autoriza').AsString := me_autoriza.Lines.Text;

  qyAcao.ExecSQL();

  i:= DM.LastInsert();

  qyAcao.Close();
  qyAcao.SQL.Text :=
     ' UPDATE fin_contas_pagar      ' +
     '    SET cd_autoriza = :cd_autoriza     ' +
     '  WHERE cd_titulo = :cd_titulo ' +
     '    AND cd_coligada = :cd_coligada ';

  qyAcao.ParamByName('cd_autoriza').AsInteger :=  i;

  qyAcao.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
  qyAcao.ParamByName('cd_coligada').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsInteger;

  qyAcao.ExecSQL();

  dsCompromissoDataChange(dsCompromisso, nil);


end;

procedure Tfrm_compromisso_autorizar.dsCompromissoDataChange(Sender: TObject;
  Field: TField);
  Var sAux : String;
  i : Integer;
  vlSaldo: Currency;
begin
   // Abrir a Tabela de Autorização

   qyAutoriza.Close();
   qyAutoriza.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
   qyAutoriza.ParamByName('cd_coligada').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsInteger;
   qyAutoriza.Open();

   cbAutoriza.Clear();

   qyAutoriza.FetchAll();

   if ( (frm_Compromisso_Planilha.qryContasPagarcd_autoriza_situ.AsInteger = 1) )
      AND (not DM.UsuarioLogado.TemPermissao(2046, npEspecial, false) )
   then begin
      // Se o pagamento já esta autorizado, então não permitir mais inserir conteudos...

      SetLength(ListaAutoriza, qyAutoriza.RecordCount );

      sbNovo.Enabled := false;

      i := 0;

   end else begin

      sbNovo.Enabled := true;

      SetLength(ListaAutoriza, qyAutoriza.RecordCount + 1);

      ListaAutoriza[0] := 0;

      cbAutoriza.Items.Add('Registrar autorização para pagamento de compromisso');

      i := 1;

   end;

   while not qyAutoriza.Eof do begin

      sAux := '';

      if qyAutoriza.FieldByName('cd_autoriza_situ').AsInteger = 0 then begin

         sAux := 'Pendente';

      end else if qyAutoriza.FieldByName('cd_autoriza_situ').AsInteger = 1 then begin

         sAux := 'Pgto Autorizado por ' + qyAutoriza.FieldByName('nm_usuario_autoriza').AsString + ' em ' + FormatDateTime('dd/mm/yyyy hh:nn', qyAutoriza.FieldByName('dt_autoriza').AsDateTime);

      end else begin

        sAux := 'Pgto Negado por ' + qyAutoriza.FieldByName('nm_usuario_autoriza').AsString + ' em ' + FormatDateTime('dd/mm/yyyy hh:nn', qyAutoriza.FieldByName('dt_autoriza').AsDateTime);

      end;

      cbAutoriza.Items.Add(sAux);
      
      ListaAutoriza[i] := qyAutoriza.FieldByName('cd_autoriza').AsInteger;

      Inc(i);

      qyAutoriza.Next;

   end;

   Dec(i);

   cbAutoriza.ItemIndex := i;

   cbAutorizaChange(cbAutoriza);

   if MostrarOrcamento then
   begin

      vlSaldo := GetOrcamento(frm_Compromisso_Planilha.qryContasPagarContasCod.AsString, frm_Compromisso_Planilha.qryContasPagardt_provavel_pgto.AsDateTime, frm_Compromisso_Planilha.qryContasPagarCentrosCod.AsString);

      if VlSaldo <= 0  then
      begin

         lbOrcamento.Caption := FloatToStrF(vlSaldo, ffNumber, 12, 2) + ' (INSUFICIENTE)';
         lbOrcamento.Font.Color := clRed;

      end
{    Essa programação estava com BUG - pega informações desatualizadas do frm_compromissos_planilha
     e também confundia visualmente o usuário - por isso foi retirada

     else if (((VlSaldo - frm_Compromisso_Planilha.qyContasPagarvl_pendente.AsCurrency) < 0)     // Passou do saldo
               AND ( frm_Compromisso_Planilha.qyContasPagarcd_autoriza_situ.AsInteger <> 1 )                   // Situacao pendente de autorização
               AND ( frm_Compromisso_Planilha.qyContasPagarcd_situacao.AsInteger = 1 ) )                        // Pendente de Pagamento
      then
      begin

         lbOrcamento.Caption := FloatToStrF(vlSaldo, ffNumber, 12, 2) + ' (INSUFICIENTE)';
         lbOrcamento.Font.Color := clRed;

      end
}
      else
      begin

         lbOrcamento.Caption := FloatToStrF(vlSaldo, ffNumber, 12, 2) ;
         lbOrcamento.Font.Color := clGreen;

      end;

   end
   else
   begin

      lbOrcamento.Caption := 'conta não orçada';
      lbOrcamento.Font.Color := clBlack;

   end;


end;

procedure Tfrm_compromisso_autorizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   posicao : Integer;
begin

  SalvarResposta();

  posicao := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
  frm_Compromisso_Planilha.qryContasPagar.Close();
  frm_Compromisso_Planilha.qryContasPagar.Open();
  frm_Compromisso_Planilha.qryContasPagar.Locate('cd_titulo', posicao, []);

   Action := caFree;
end;

procedure Tfrm_compromisso_autorizar.atualizarApropriacoes() ;
begin
   qyApropriacoes.Close();
   if (frm_Compromisso_Planilha.qryContasPagarcd_titulo_principal.AsInteger <> 0) and (frm_Compromisso_Planilha.qryContasPagarcd_titulo_principal.AsInteger <> null) then
   begin
      qyApropriacoes.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo_principal.AsInteger;
   end else begin
      qyApropriacoes.ParamByName('cd_titulo').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsInteger;
   end;
   qyApropriacoes.ParamByName('cd_coligada').AsInteger := frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsInteger;
   qyApropriacoes.Open();
end;

procedure Tfrm_compromisso_autorizar.FormShow(Sender: TObject);
Var
   qyOrcamento : TUMZQuery;
begin

   atualizarApropriacoes();

   // Verificar se está utilizando algum orçamento para o ano;
   DM.CriarConsulta(qyOrcamento);
   qyOrcamento.SQL.Text :=
     ' SELECT Count(*) AS QTD FROM fin_orcamentos ';

   try
      qyOrcamento.Open();

      if qyOrcamento.FieldByName('QTD').AsInteger > 0 then
      begin
         MostrarOrcamento := true;
      end else begin
         MostrarOrcamento := false;
      end;
   Except
       MostrarOrcamento := false;
   end;

   dsCompromissoDataChange(nil, nil);

   FreeAndNil(qyOrcamento);
   
end;

function Tfrm_compromisso_autorizar.GetOrcamento(Contas: String;
  Data: TDateTime; Centros: String = ''): Currency;
Var
   qyOrcamento : TUMZQuery;
   vlOrcado : Currency;
   vlRealizado : Currency;
   dia, mes, ano : Word;
   sContas        : String;
begin
  if trim(Contas) <> '' then begin

      // Buscar o saldo do Orçamento para o ano, para a conta e centro de custo informado
      DecodeDate(Data, ano, mes, dia);

      DM.CriarConsulta( qyOrcamento );

      // Pegar o código das contas envolvidas
      qyOrcamento.SQL.Text :=
        ' SELECT GROUP_CONCAT(DISTINCT pc_todos.cd_conta) AS CONTAS ' +
        '   FROM fin_plano_contas pc ' +
        '  INNER JOIN fin_plano_contas pc_todos ON (pc.ds_conta = pc_todos.ds_conta AND pc.cd_coligada = pc_todos.cd_coligada) ' +
        '  WHERE pc.cd_conta IN (' + Contas + ') ';
      qyOrcamento.Open();

      if not qyOrcamento.Eof then begin
         sContas := qyOrcamento.FieldByName('CONTAS').AsString;
      end else begin
         sContas := '-1';
      end;

      // Pegar o Valor do Orçamento do ano para a Conta
      qyOrcamento.SQL.Text :=
        ' SELECT SUM(orc.vl_orcamento) as vl_orcamento ' +
        '   FROM fin_orcamentos_valores orc ' +
        '  WHERE orc.nr_ano = ' + IntToStr(ano) +
        '    AND orc.nr_mes = 0      ' +
        '    AND orc.cd_conta IN (' + sContas + ' ) ';

      if trim(centros) <> '' then
      begin

         qyOrcamento.SQL.Add(
           ' AND orc.cd_orcamento IN ( SELECT cen.cd_orcamento FROM fin_orcamentos_centros cen WHERE cen.cd_centro IN (' + Centros +') ) '
         );

      end;

      qyOrcamento.Open();

      vlOrcado := qyOrcamento.FieldByName('vl_orcamento').AsCurrency;


      // Pegar o valor realizado para o ano

      qyOrcamento.Close();
      qyOrcamento.SQL.Text :=
        ' SELECT ROUND(SUM(CASE WHEN te.tp_entrada_saida = 1 THEN IFNULL(ap.vl_movimento,te.vl_movimento) ELSE IFNULL(ap.vl_movimento,te.vl_movimento) END),2) as vl_realizado ' +
        '   FROM fin_mov_tesouraria te ' +
        '  INNER JOIN fin_apropria_te ap ON (te.cd_movimento_te = ap.cd_movimento_te) ';
      if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
         qyOrcamento.SQL.Add('  WHERE TO_CHAR(te.dt_movimento, ''YYYY'') = ' + IntToStr(ano))
      else
         qyOrcamento.SQL.Add('  WHERE Year(te.dt_movimento) = ' + IntToStr(ano));

      qyOrcamento.SQL.Add('    AND ap.cd_conta IN (' + sContas + ' ) ');

      if (Centros <> '') then
      begin

         qyOrcamento.SQL.Add(
           ' AND ap.cd_centro IN (' + Centros + ' ) '
         );

      end;

      qyOrcamento.Open();

      vlRealizado := qyOrcamento.FieldByName('vl_realizado').AsCurrency;

      // Buscar o valor já autorizado que ainda não foi pago

      qyOrcamento.Close();

      qyOrcamento.SQL.Text :=
        ' SELECT SUM( (apr.vl_movimento / cpg.vl_total_despesa) * cpg.vl_despesa) as vl_autorizado ' +
        '   FROM fin_contas_pagar cpg ' +
        '  INNER JOIN fin_apropria_cp apr ON (cpg.cd_titulo_principal = apr.cd_titulo and cpg.cd_coligada = apr.cd_coligada) ' +
        '  INNER JOIN fin_contas_pagar_autoriza aut ON (aut.cd_autoriza = cpg.cd_autoriza) '+
        '  WHERE cpg.cd_autoriza > 0 AND cpg.cd_situacao = 1 AND aut.cd_autoriza_situ = 1 ' +
        '    AND apr.cd_conta IN (' + sContas + ' )';

      if (Centros <> '') then
      begin

         qyOrcamento.SQL.Add(
           ' AND apr.cd_centro IN (' + Centros + ' ) '
         );

      end;

      qyOrcamento.Open();

      vlRealizado := vlRealizado + qyOrcamento.FieldByName('vl_autorizado').AsCurrency;

      FreeAndNil(qyOrcamento);
  
      result := vlOrcado - vlRealizado;
  
  end else begin

     result := 0;

  end;

end;


procedure Tfrm_compromisso_autorizar.SalvarResposta;
begin

   if cbAutoriza.ItemIndex > 0 then begin

     if trim(me_resposta.Lines.Text) <> '' then begin

        qyAcao.Close();
        qyAcao.SQL.Text :=
           ' UPDATE fin_contas_pagar_autoriza      ' +
           '    SET me_resposta = :me_resposta     ' +
           '  WHERE cd_autoriza = :cd_autoriza     ';

        qyAcao.ParamByName('cd_autoriza').AsInteger :=  ListaAutoriza[cbAutoriza.ItemIndex];

        qyAcao.ParamByName('me_resposta').AsString := me_resposta.Lines.Text;

        qyAcao.ExecSQL();

     end;

   end;

end;

procedure Tfrm_compromisso_autorizar.sbNovoClick(Sender: TObject);
begin
   cbAutoriza.ItemIndex := 0;
   cbAutorizaChange(cbAutoriza);
end;

end.
