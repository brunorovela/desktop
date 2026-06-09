unit uManutMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uItemCOmbo, StdCtrls, DBCtrls, ExtCtrls, Mask, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Db, Buttons, dbTables;

type
  Tfrm_mensa_baixar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    DBText3: TDBText;
    Label2: TLabel;
    DBText4: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    EditDataPagto: TDBEdit;
    EditValor: TDBEdit;
    lblAluno: TLabel;
    Label6: TLabel;
    cbContas: TComboBox;
    Label7: TLabel;
    Bevel2: TBevel;
    sbBloqueaConta: TSpeedButton;
    Label8: TLabel;
    EditDesconto: TDBEdit;
    Label9: TLabel;
    EditJuros: TDBEdit;
    sbBloquearDesconto: TSpeedButton;
    sbBloquearJuros: TSpeedButton;
    lbValorTotal: TLabel;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lbMoedaRecebimento: TLabel;
    lbValorRecebimento: TLabel;
    EditValorMoeda: TDBEdit;
    qyMoedas: TUMZQuery;
    qyMoedasds_moeda: TStringField;
    qyMoedasds_sigla: TStringField;
    CBMoeda: TDBLookupComboBox;
    dsMoedas: TDataSource;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    sbBloqueiaData: TSpeedButton;
    sbBloqueiaValor: TSpeedButton;
    qyMoedascd_moeda: TLargeintField;
    procedure cbContasDropDown(Sender: TObject);
    procedure sbBloqueiaValorClick(Sender: TObject);
    procedure sbBloqueiaDataClick(Sender: TObject);
    procedure CBMoedaCloseUp(Sender: TObject);
    procedure cbContasKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorMoedaExit(Sender: TObject);
    procedure EditValorMoedaKeyPress(Sender: TObject; var Key: Char);
    procedure CBMoedaKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure EditDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EditJurosKeyPress(Sender: TObject; var Key: Char);
    procedure EditJurosExit(Sender: TObject);
    procedure EditDescontoExit(Sender: TObject);
    procedure sbBloquearJurosClick(Sender: TObject);
    procedure sbBloquearDescontoClick(Sender: TObject);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDataPagtoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure EditDataPagtoExit(Sender: TObject);
    procedure sbBloqueaContaClick(Sender: TObject);
  private
    { Private declarations }

    cValorJuros : Currency;
    cValorDesconto : Currency;
    iMoedaBase : Integer;
    
    ListaContas : TStringList;
    Procedure ApresentarContas ( ContaPadrao : Integer ) ;
    Function ProcuraCodigo(codigo: Integer; ListaCodigos: array of Integer): Integer;

    Procedure CalculaValorPadrao;

  public
    lngCodigoAluno : Longint;
    intParcela : Integer;
    strTurma, strAluno : String;
    datVencimento : TDateTime;
    strNossoNumero : String;
    iCodigoMensalidade : Integer;

    iConta : Integer;
    { Public declarations }
  end;

var
  frm_mensa_baixar: Tfrm_mensa_baixar;

implementation

uses Main, uDinCh, uDM, Math, uClassMovimento, uUsuario;

{$R *.DFM}

procedure Tfrm_mensa_baixar.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then begin
     Key := #0; 
     SelectNext(Sender as TWinControl,true,true);
  end;
end;

procedure Tfrm_mensa_baixar.EditValorMoedaExit(Sender: TObject);
begin
   if DM.tblMensalidadescd_moeda_pgto.AsInteger <> iMoedaBase then begin

      DM.tblMensalidadesValorPago.AsCurrency :=
          DM.ConverteCambio(iMoedaBase, DM.tblMensalidadescd_moeda_pgto.AsInteger, DM.tblMensalidadesDataPagamento.AsDateTime, DM.tblMensalidadesvl_pago_moeda.AsCurrency, true);

   end else begin

      DM.tblMensalidadesValorPago.AsCurrency := DM.tblMensalidadesvl_pago_moeda.AsCurrency;

   end;
end;

procedure Tfrm_mensa_baixar.EditValorMoedaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then begin
     Key := #0;
     SelectNext(Sender as TWinControl,true,true);
  end;

end;

procedure Tfrm_mensa_baixar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    VK_ESCAPE : begin
      DM.tblMensalidades.Cancel;
      Close;
    end;

  end;
end;

procedure Tfrm_mensa_baixar.EditDataPagtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl,true,true);
    Key := #0;
  end;
end;

procedure Tfrm_mensa_baixar.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  qyMoedas.Close();
  qyMoedas.Open();

  // Esconder as colunas de moeda se não tiver mais de 1 moeda na base

  if qyMoedas.RecordCount <= 1 then begin

     lbMoedaRecebimento.Visible := false;
     lbValorRecebimento.Visible := false;
     CBMoeda.Visible := False;
     EditValorMoeda.Visible := False;

     frm_mensa_baixar.Height := 373;

  end else begin

     lbMoedaRecebimento.Visible := true;
     lbValorRecebimento.Visible := true;
     CBMoeda.Visible := true;
     EditValorMoeda.Visible := true;

     frm_mensa_baixar.Height := 440;
       
  end;
  

  lblAluno.Caption := strAluno;

  DM.tblMensalidades.Close();
  DM.tblMensalidades.SQL.Clear();

  if iCodigoMensalidade = 0 then begin

      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( '(codigoaluno = :codigoaluno ) AND ');
      DM.tblMensalidades.SQL.Add( '(parcela = :parcela ) AND ');
      DM.tblMensalidades.SQL.Add( '(datavencimento = :datavencimento ) AND ');
      DM.tblMensalidades.SQL.Add( '(turma = :turma ) ');

      DM.tblMensalidades.ParamByName('codigoaluno').AsInteger := lngCodigoAluno;
      DM.tblMensalidades.ParamByName('parcela').AsInteger := intParcela;
      DM.tblMensalidades.ParamByName('datavencimento').AsString := FormatDateTime('yyyy-mm-dd', datVencimento);
      DM.tblMensalidades.ParamByName('turma').AsString := strTurma;



  end else begin

      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade) ');
      DM.tblMensalidades.ParamByName('CdMensalidade').asInteger := iCodigoMensalidade;

  end;
  DM.tblMensalidades.Open();


  cValorJuros := DM.tblMensalidadesValorJuros.AsCurrency;
  cValorDesconto := DM.tblMensalidadesValorDescontoCalc.AsCurrency;

  lbValorTotal.Caption := DM.tblMensalidadesValorTotalCalc.DisplayText;

  DM.tblMensalidades.Edit;

  // Guardar o Juros não Calculado

  Dm.tblMensalidadesvalorjuros_fixo.AsCurrency := Dm.tblMensalidadesValorJuros.AsCurrency;
  DM.tblMensalidadesvalordesconto_fixo.AsCurrency := Dm.tblMensalidadesValorDesconto.AsCurrency;

  DM.tblMensalidadesDataPagamento.AsString := DateToStr(DataHoje);
  DM.tblMensalidadescd_moeda_pgto.AsInteger := Dm.tblMensalidadescd_moeda.AsInteger;

  CalculaValorPadrao;

  if EditDataPagto.Enabled then
    EditDataPagto.SetFocus
  else
    EditValor.SetFocus;

  ApresentarContas(iConta);

  cbContas.Enabled      := False;
  EditDesconto.Enabled  := False;
  EditDataPagto.Enabled := False;
  EditJuros.Enabled     := False;

    // Pegar a Moeda Base
  if DM.variavel_parametro('financeiro_moeda_base') = ''  then begin
     iMoedaBase := 0;
  end else begin
     iMoedaBase := StrToInt(DM.variavel_parametro('financeiro_moeda_base'));
  end;


  // Verifica se Botão deve vir despressionado
  if DM.UsuarioLogado.TemPermissao( 2057, npAcesso, False ) then begin
    sbBloqueiaValor.Down:=false;
    EditValor.Enabled := not sbBloqueiaValor.Down;
    EditValor.SetFocus();
  end;

  // Verifica se Botão deve vir despressionado
  if DM.UsuarioLogado.TemPermissao( 2056, npAcesso, False ) then begin
    sbBloqueiaData.Down := false;
    EditDataPagto.Enabled := not sbBloqueiaData.Down;
    EditDataPagto.SetFocus();
  end;
  
  cbContas.Enabled := not sbBloqueaConta.Down;
  EditDataPagto.Enabled := not sbBloqueiaData.Down;
  EditValor.Enabled := not sbBloqueiaValor.Down;

  EditDataPagto.Text := FormatDateTime('dd/mm/yyyy', DM.DataAtual);
end;


procedure Tfrm_mensa_baixar.EditValorExit(Sender: TObject);
begin
   
   if qyMoedas.RecordCount <= 1 then Exit;
   
   if DM.tblMensalidadescd_moeda_pgto.AsInteger <> iMoedaBase then begin

      DM.tblMensalidadesvl_pago_moeda.AsCurrency :=
        DM.ConverteCambio(iMoedaBase, DM.tblMensalidadescd_moeda_pgto.AsInteger, DM.tblMensalidadesDataPagamento.AsDateTime, DM.tblMensalidadesValorPago.AsCurrency);

   end else begin

      DM.tblMensalidadesvl_pago_moeda.AsCurrency :=  DM.tblMensalidadesValorPago.AsCurrency;

   end;
   
end;

procedure Tfrm_mensa_baixar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   cCh: TCheque;
   i: Integer;
   iNumCheque: LongInt;
begin
//    try
    if ModalResult = mrCancel then
    begin
      if DM.tblMensalidades.State in [dsInsert, dsEdit] then DM.tblMensalidades.Cancel;
      CanClose := True;
      Exit;
    end;

    // DM.tblMensalidadesValorPago.Value := StrToFloat(EditValor.Text);

    frmDinCh.dblValor := DM.tblMensalidadesValorPago.Value;
    frmDinCh.AlunoAtual := DM.tblMensalidadesCodigoAluno.AsInteger;

    if cbContas.ItemIndex < 0 then
    begin
       Mensagem( 'Selecione uma conta para baixar a mensalidade.', Application.Title, MB_OK + MB_ICONSTOP );
       CanClose := False;
       Exit;
    end;

    if frmDinCh.ShowModal = mrCancel then
    begin
      DM.tblMensalidades.Cancel;
      CanClose := True;
      self.ModalResult := mrCancel;
      Exit;
    end;

    //cheques
    if frmDinCh.dblCh > 0 then begin
      //insere em fin_cheques todos os cheques e em fin_cheques_mensalidades
      for i := 0 to frmDinCh.slCheques.Count - 1 do begin

         if (frmDinCh.slCheques.Objects[i] is TCheque) then begin
            cCh := TCheque(frmDinCh.slCheques.Objects[i]);

            //insere os cheques
            with DM.qyAux1 do begin
               SQL.Clear();
               Params.Clear();
               SQL.Add('INSERT INTO fin_cheques ' +
               '(cd_cheque, ds_cheque, ds_conta, ds_banco, ds_agencia, ' +
               'dt_compensacao, cd_situacao, nr_valor, cd_caixa, dt_emissao) VALUES ' +
               '(NULL, :ds_cheque, :ds_conta, :ds_banco, :ds_agencia, ' +
               ':dt_compensacao, :cd_situacao, :nr_valor, :cd_caixa, now())');
               ParamByName('ds_cheque').AsString := cCh.getNumero();
               ParamByName('ds_conta').AsString := cCh.getContaCorrente();
               ParamByName('ds_banco').AsString := cCh.getBanco();
               ParamByName('ds_agencia').AsString := cCh.getAgencia();
               ParamByName('cd_situacao').AsInteger := 0;
               ParamByName('nr_valor').AsFloat := cCh.getValor();
               ParamByName('cd_caixa').AsInteger :=  StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getCodigo());
               if (cCh.getData() <> 0) then begin
                  ParamByName('dt_compensacao').AsDate := cCh.getData();
               end
               else begin
                  ParamByName('dt_compensacao').AsString := '';
               end;
               try
                  ExecSQL();
               except
                  // Irá entrar no Except quando o cheque já foi registrado,
                  // se já foi registrado... não faz nada!
               end;
            end;

            //insere os cheques relacionados com a mensalidade
            iNumCheque := 0;
            with DM.qyAux1 do begin
               SQL.Clear();
               Params.Clear();
               SQL.Add('SELECT cd_cheque FROM fin_cheques WHERE ds_cheque = :ds_cheque AND  ' +
               'ds_conta = :ds_conta AND ds_banco = :ds_banco AND ds_agencia = :ds_agencia');
               ParamByName('ds_cheque').AsString := cCh.getNumero();
               ParamByName('ds_conta').AsString := cCh.getContaCorrente();
               ParamByName('ds_banco').AsString := cCh.getBanco();
               ParamByName('ds_agencia').AsString := cCh.getAgencia();
               Open();

               if not IsEmpty then begin
                  iNumCheque := FieldByName('cd_cheque').AsInteger;
               end;
               Close();

               //adiciona os relacionamentos
               SQL.Clear();
               Params.Clear();
               SQL.Add('INSERT INTO fin_cheques_mensalidades VALUES ' +
               '(0, :cd_cheque, :cd_mensalidade)');
               ParamByName('cd_cheque').AsInteger := iNumCheque;
               ParamByName('cd_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade.AsInteger;
               ExecSQL();
               SQL.Clear();
               Params.Clear();
            end;

         end; //se é TChque
      end; //for em cheques
    end; //fim usa cheque

    // Guardar o Número do Depósito
    if (frmDinCh.ckbDeposito.Checked) AND (Trim(frmDinCh.edNumeroTalao.Text) <> '') then begin

       DM.tblMensalidadesds_deposito.AsString := frmDinCh.edNumeroTalao.Text;       

    end;

    // Baixar Mensalidade
    // Tem que retornar se baixou ou não a Mensalidade
    
    DM.BaixarMensalidade(StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getCodigo()), '', StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getVariavel()), (not sbBloquearJuros.Down));

    CanClose := True;
    
{   except
      Mensagem( 'Valor inválido ao baixar a mensalidade.', Application.Title, MB_OK + MB_ICONSTOP );
      if DM.tblMensalidades.State in [dsInsert, dsEdit] then DM.tblMensalidades.Cancel;
      EditValor.SetFocus;
      EditValor.SelectAll;
      CanClose := False;
      raise;
   end;}
end;

procedure Tfrm_mensa_baixar.FormDestroy(Sender: TObject);
begin
  frm_mensa_baixar := nil;
end;

procedure Tfrm_mensa_baixar.EditDataPagtoExit(Sender: TObject);
begin
//  DM.tblMensalidadesValorJuros.AsCurrency := cValorJuros;
//  DM.tblMensalidadesValorPago.Value := DM.tblMensalidadesValorTotalCalc.Value;
   CalculaValorPadrao;
end;

procedure Tfrm_mensa_baixar.ApresentarContas(ContaPadrao: Integer);
var
   qyContas : TUMZQuery;
   Movimento : TMovimento;
   tp_Conta: word;  cd_Abertura : Integer;
   i : Integer;
begin

   Dm.CriarConsulta(qyContas);

   Movimento := TMovimento.create;

//   Movimento.Coligada := Dm.iColigadaSelecionada;

  // Apresentar SOMENTE as contas da coligada selecionada no Financeiro, ou se tiver o sn_todas_coligadas = 1

   qyContas.SQL.Clear;
   qyContas.SQL.Text := '' +
     ' SELECT cc.cd_coligada, cc.cd_caixa, cc.ds_caixa, cc.tp_conta, u.sn_padrao  ' +
     ' FROM fin_cadastro_contas cc                          ' +
     ' INNER JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa) AND (cc.CD_COLIGADA = u.cd_coligada) ' +
     ' WHERE cc.sn_ativa = ''S''           ' +
     Format( '   AND (cc.cd_coligada IN (%s) OR cc.sn_todas_coligadas = 1) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] ) +
     '   AND u.cd_usuario = ' + intToStr(DM.iCdPessoaLogado) + 
     ' ORDER by cc.ds_caixa              ';

   qyContas.Open();

   cbContas.Items.Clear;

   FreeAndNil(ListaContas);
   ListaContas := TStringList.Create();

   i:=0;
   ContaPadrao := -1;
   while not qyContas.Eof do
   begin
         { Somente inserir as contas que poderão ser utilizadas para a Baixa }
         Movimento.Coligada := qyContas.FieldByNAme('cd_coligada').AsInteger;
         if Movimento.VerificaContaAtiva(qyContas.FieldByNAme('cd_caixa').AsInteger, tp_Conta, cd_Abertura) then
         begin

             if (tp_Conta <> 3) OR (cd_Abertura > 0) then
             begin

                // Guardar a Conta no Array;
                ListaContas.AddObject(
                   qyContas.FieldByName('cd_caixa').AsString,
                   TItemCombo.Create(
                        qyContas.FieldByName('cd_caixa').AsString,
                        qyContas.FieldByName('ds_caixa').AsString,
                        qyContas.FieldByName('cd_coligada').AsString
                   )
                );
                if qyContas.FieldByName('sn_padrao').AsInteger = 1 then begin
                  ContaPadrao := i;
                end;

                INC(i);

             end;

         end;      


         qyContas.Next;

   end;

   // Monstar a Combo

   for i := 0 to ListaContas.Count - 1 do
      cbContas.AddItem(TItemCombo(ListaContas.Objects[i]).getDescricao(), ListaContas.Objects[i]);

   { Verificar qual a conta padrão será utilizada }

   cbContas.ItemIndex :=  ContaPadrao;

   Movimento.Free;

end;


function Tfrm_mensa_baixar.ProcuraCodigo(codigo: Integer;
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


procedure Tfrm_mensa_baixar.sbBloqueaContaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 2042, npAcesso, False ) then begin
       sbBloqueaConta.Down := True;
       Exit;
   end;

   cbContas.Enabled := not sbBloqueaConta.Down;

   if not cbContas.Enabled then
      ApresentarContas(IConta);

end;

procedure Tfrm_mensa_baixar.CalculaValorPadrao;
Var
   VencimentoTolerado : TDateTime;
   ChecaVencimento : TDateTime;
begin

  // Verificar se o vencimento não cai em um feriado ou final de semana
  VencimentoTolerado := dm.tblMensalidadesDataVencimento.AsDateTime;
  ChecaVencimento := 0;

  while ChecaVencimento <> VencimentoTolerado do begin

     ChecaVencimento := VencimentoTolerado;

     if DM.EhFeriado(VencimentoTolerado, 2) then begin

        VencimentoTolerado := VencimentoTolerado + 1;

     end;

     Case DayOfWeek( VencimentoTolerado ) of
       1 : VencimentoTolerado := VencimentoTolerado + 1;
       7 : VencimentoTolerado := VencimentoTolerado + 2;
     end;

  end;

   DM.tblMensalidadesValorJuros.AsCurrency := cValorJuros;
   DM.tblMensalidadesValorDesconto.AsCurrency := DM.tblMensalidadesValorDescontoCalc.AsCurrency;
   //DM.tblMensalidadesValorDesconto.AsCurrency := cValorDesconto;

   DM.tblMensalidadesValorPago.AsCurrency := DM.tblMensalidadesValorTotalCalc.AsCurrency;
   Dm.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesValorJurosCalc.AsCurrency;


   {
   if (FormatDateTime('yyyymmdd', Dm.tblMensalidadesDataPagamento.AsDateTime) >
      FormatDateTime('yyyymmdd', VencimentoTolerado )) AND (Dm.tblMensalidadessn_liberar_descontos.Value <> 1)
   then begin
       Dm.tblMensalidadesValorDesconto.AsCurrency := 0
   end;
   }
   Dm.tblMensalidadesValorDesconto.AsCurrency := Dm.tblMensalidadesValorDescontoCalc.AsCurrency 
end;

procedure Tfrm_mensa_baixar.cbContasDropDown(Sender: TObject);
var
   I, MaxWidth, OneWidth: Integer;
begin
   with (Sender as TCustomComboBox) do
   begin
      MaxWidth := Width;
      for I := 0 to Items.Count - 1 do
      begin
         OneWidth := Canvas.TextWidth(Items[I]);
         if OneWidth > MaxWidth then
            MaxWidth := OneWidth;
      end;
      if Items.Count > (Sender AS TComboBox).DropDownCount then
         SendMessage(Handle, CB_SETDROPPEDWIDTH, MaxWidth + 24, 0)
      else
         SendMessage(Handle, CB_SETDROPPEDWIDTH, MaxWidth + 8, 0)
   end;
end;

procedure Tfrm_mensa_baixar.cbContasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl,true,true);
    Key := #0;
  end;
end;

procedure Tfrm_mensa_baixar.CBMoedaCloseUp(Sender: TObject);
begin
   if DM.tblMensalidadescd_moeda_pgto.AsInteger <> iMoedaBase then begin

      DM.tblMensalidadesvl_pago_moeda.AsCurrency :=
        DM.ConverteCambio(iMoedaBase, DM.tblMensalidadescd_moeda_pgto.AsInteger, DM.tblMensalidadesDataPagamento.AsDateTime, DM.tblMensalidadesValorPago.AsCurrency);
   
   end;
end;

procedure Tfrm_mensa_baixar.CBMoedaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then begin
     Key := #0;
     SelectNext(Sender as TWinControl,true,true);
  end;

end;

procedure Tfrm_mensa_baixar.sbBloquearDescontoClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2043, npAcesso, False ) then begin
      sbBloquearDesconto.Down := True;
      Exit;
   end;

   EditDesconto.Enabled := not sbBloquearDesconto.Down;

   if not EditDesconto.Enabled then
      CalculaValorPadrao
   else
      EditDesconto.SetFocus;

end;

procedure Tfrm_mensa_baixar.sbBloquearJurosClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2044, npAcesso, False ) then begin
      sbBloquearJuros.Down := True;
      Exit;
   end;

   EditJuros.Enabled := not sbBloquearJuros.Down;

   if not EditJuros.Enabled then
      CalculaValorPadrao
   else
      EditJuros.SetFocus;

end;

procedure Tfrm_mensa_baixar.sbBloqueiaDataClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2056, npAcesso, False ) then begin
      sbBloqueiaData.Down:=True;
      Exit;
   end;

   EditDataPagto.Enabled := not sbBloqueiaData.Down;

   if EditDataPagto.Enabled then
      EditDataPagto.SetFocus;

end;

procedure Tfrm_mensa_baixar.sbBloqueiaValorClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2057, npAcesso, False ) then begin
      sbBloqueiaValor.Down:=True;
      Exit;
   end;

   EditValor.Enabled := not sbBloqueiaValor.Down;

   if EditValor.Enabled then
      EditValor.SetFocus;
end;

procedure Tfrm_mensa_baixar.EditDescontoExit(Sender: TObject);
begin
    DM.tblMensalidadesValorPago.AsCurrency :=
         DM.tblMensalidadesValorBruto.AsCurrency +
         Dm.tblMensalidadesValorExtra.AsCurrency  -
         Dm.tblMensalidadesDescontoExtra.AsCurrency -
         DM.tblMensalidadesValorDesconto.AsCurrency +
         DM.tblMensalidadesValorJuros.AsCurrency;
end;

procedure Tfrm_mensa_baixar.EditJurosExit(Sender: TObject);
begin
    DM.tblMensalidadesValorPago.AsCurrency :=
         DM.tblMensalidadesValorBruto.AsCurrency +
         Dm.tblMensalidadesValorExtra.AsCurrency  -
         Dm.tblMensalidadesDescontoExtra.AsCurrency -
         DM.tblMensalidadesValorDesconto.AsCurrency +
         DM.tblMensalidadesValorJuros.AsCurrency;
end;

procedure Tfrm_mensa_baixar.EditJurosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then begin
     SelectNext(Sender as TWinControl,true,true);
     Key := #0;
  end;

end;

procedure Tfrm_mensa_baixar.EditDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then begin
     SelectNext(Sender as TWinControl,true,true);
     Key := #0;
  end;

end;

procedure Tfrm_mensa_baixar.btnOkClick(Sender: TObject);
var
   Juros : Currency;
   Descontos : Currency;
begin

   // Verificar Bloqueio da Data
   if DM.EstaBloqueado(Dm.tblMensalidadesDataPagamento.AsDateTime, true) then Exit;


   // Vefificar se está baixando com data SUPERIOR a hoje;

   if Dm.tblMensalidadesDataPagamento.AsDateTime > DataHoje then begin

      Mensagem('Atenção' + CHR(13) + CHR(13) + 'Você está tentando baixar uma mensalidade com data superior a hoje. Este procedimento está bloqueado pois pode causar inconsistência nos saldos de caixa.', 'UNIMESTRE', MB_OK + MB_ICONWARNING );

      Juros := DM.tblMensalidadesValorJurosCalc.AsCurrency;
      Descontos := DM.tblMensalidadesValorDesconto.AsCurrency;
      Dm.tblMensalidadesDataPagamento.AsDateTime := DataHoje;
      DM.tblMensalidadesValorJurosCalc.AsCurrency := Juros;
      DM.tblMensalidadesValorDesconto.AsCurrency := Descontos;

      EditDataPagto.SetFocus;
      EditDataPagto.SelectAll;

      Exit;
   
   end;

   Dm.qAux1.Close;
   Dm.qAux1.SQL.Clear;
   Dm.qAux1.SQL.Add(' SELECT d.cd_caixa ');
   Dm.qAux1.SQL.Add(' FROM departamentos d ');
   Dm.qAux1.SQL.Add(' WHERE d.codigo = :depto ');
   Dm.qAux1.ParamByName('depto').AsInteger := Dm.tblMensalidadesDepto.AsInteger;
   Dm.qAux1.Open;

   try
      DM.tblControle.Close;
      DM.tblControle.ParamByName('Situacao').asString := 'A';
      DM.tblControle.ParamByName('codcaixadepto').AsInteger := StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getCodigo());
      Dm.tblControle.Open;
   except
      Mensagem('Para efetuar a baixa deste título é necessário antes ter selecionado uma conta válida!',  'Atenção', MB_OK + MB_ICONEXCLAMATION );
      exit;
   end;

   if not DM.tblControle.Eof then begin
      if StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getCodigo()) = Dm.qAux1.FieldByName('cd_caixa').AsInteger then begin

        if (FormatDateTime('yyymmdd',DM.tblControledt_abertura.AsDateTime) <> FormatDateTime('yyyymmdd', DataHoje))
        then Begin
            if Mensagem( 'Você está baixando uma mensalidade no caixa que foi aberto em ' + FormatDateTime('dd/mm/yyyy',DM.tblControledt_abertura.AsDateTime)+ '.' + chr(13) + 'Continuar?' , 'Confirmação', MB_YESNO + MB_ICONQUESTION )
            <> mrYes then Exit;
        end;
      end;
   end
   else
   begin

      // Vefificar se é uma conta Caixa
      Dm.qAux1.Close;
      Dm.qAux1.SQL.Clear;
      Dm.qAux1.SQL.Add(' SELECT cd_caixa, tp_conta ');
      Dm.qAux1.SQL.Add(' FROM fin_cadastro_contas ');
      Dm.qAux1.SQL.Add(' WHERE cd_caixa = :CdCaixa ');
      Dm.qAux1.ParamByName('CdCAixa').AsInteger := StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getCodigo());;
//      Dm.qAux1.ParamByName('CdColigada').AsInteger := StrToInt(TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getVariavel());; 
      Dm.qAux1.Open();

      if Dm.qAux1.FieldByName('tp_conta').AsInteger = 3 then begin

         Mensagem('Não é possível baixar a mensalidade. O caixa está fechado.', 'Atenção', MB_OK);
         Exit;

      end
      else begin
         if Dm.qAux1.FieldByName('tp_conta').AsInteger = 1 then begin // Conta Corrente

            Dm.tblMensalidadesUsuario.AsString := 'RETORNO';

         end;

      end;

   end;

   Self.ModalResult := mrOK;
   
end;

end.

