unit uCompromisso_Preparados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ZConnection, ImgList, ComCtrls,
  ToolWin, StdCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMDateTimePicker;

type
  Tfrm_Compromisso_Preparados = class(TForm)
    pnTitulo: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnAutorizarPagamento: TToolButton;
    btnBaixarCompromisso: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    srcPreparacao: TDataSource;
    qyContas: TUMZQuery;
    qyContasds_caixa: TStringField;
    qryItens: TUMZReadOnlyQuery;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    ToolButton3: TToolButton;
    pnDatas: TPanel;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    Bevel1: TBevel;
    rbEfetuados: TRadioButton;
    rbNaoAutorizados: TRadioButton;
    rbAutorizados: TRadioButton;
    rbPendentes: TRadioButton;
    Bevel2: TBevel;
    srcItens: TDataSource;
    qryItensvl_baixa: TFloatField;
    qryItensvl_multa: TFloatField;
    qryItensvl_juros: TFloatField;
    qryItensvl_desconto: TFloatField;
    qryItenssn_baixado: TStringField;
    qryItensds_despesa: TStringField;
    qryItensdt_vencimento: TDateTimeField;
    qryItensnm_pessoa: TStringField;
    btnBloquearPagamento: TToolButton;
    qyAux: TUMZQuery;
    DBGrid1: TDBGrid;
    btnEstornar: TToolButton;
    qryItensdescSituacao: TStringField;
    qryItenscd_coligada: TIntegerField;
    qryItenscd_situacao: TIntegerField;
    qryItenssn_previsao: TStringField;
    qryItensvl_saidas: TFloatField;
    qyExcluiItem: TUMZQuery;
    qryItenscd_preparacao: TLargeintField;
    qryItenscd_titulo: TLargeintField;
    qryPreparacao: TUMZReadOnlyQuery;
    qryPreparacaoCD_PREPARACAO: TLargeintField;
    qryPreparacaoDS_PREPARACAO: TStringField;
    qryPreparacaoCD_CAIXA: TIntegerField;
    qryPreparacaoCD_COLIGADA: TIntegerField;
    qryPreparacaoDT_PREPARACAO: TDateTimeField;
    qryPreparacaoDT_PAGAMENTO: TDateTimeField;
    qryPreparacaoSN_PGTO_AUTORIZADO: TStringField;
    qryPreparacaoSN_PGTO_EFETIVADO: TStringField;
    qryPreparacaoCD_MOVIMENTO_TE: TLargeintField;
    qryPreparacaoNR_CHEQUE: TLargeintField;
    qryPreparacaodsCaixa: TStringField;
    qryPreparacaovalTotal: TFloatField;
    qryPreparacaovalSaldo: TFloatField;
    qyContascd_caixa: TIntegerField;
    qryPreparacaoCD_USUARIO_PREPAROU: TIntegerField;
    qryPreparacaoCD_USUARIO_APROVOU: TLargeintField;
    qryPreparacaoCD_USUARIO_BAIXOU: TLargeintField;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    procedure umdtInicialChangeDate(Sender: TObject);
    procedure qryPreparacaoAfterOpen(DataSet: TDataSet);
    procedure qryItensCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEstornarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbPendentesClick(Sender: TObject);
    procedure rbAutorizadosClick(Sender: TObject);
    procedure rbNaoAutorizadosClick(Sender: TObject);
    procedure rbEfetuadosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAutorizarPagamentoClick(Sender: TObject);
    procedure btnBloquearPagamentoClick(Sender: TObject);
    procedure srcPreparacaoDataChange(Sender: TObject; Field: TField);
    procedure btnBaixarCompromissoClick(Sender: TObject);
    procedure qryPreparacaoCalcFields(DataSet: TDataSet);
  private
    Procedure filtra;
    function VerificaTitulosBaixados: boolean;

  public
    { Public declarations }
  end;

var
  frm_Compromisso_Preparados: Tfrm_Compromisso_Preparados;

CONST
  iModuloPadrao = 2041; 

implementation

uses Math, uDM, uCompromisso_baixar_preparacao, uClassMovimento, uUsuario;

{$R *.dfm}

{ Tfrm_compromisso_preparados }

procedure Tfrm_Compromisso_Preparados.filtra;
const
   SQL_FILTRAR_PREPARACAO =
      ' SELECT CD_PREPARACAO, DS_PREPARACAO, CD_CAIXA, CD_COLIGADA, DT_PREPARACAO, ' +
      '        DT_PAGAMENTO, SN_PGTO_AUTORIZADO, SN_PGTO_EFETIVADO, CD_USUARIO_PREPAROU, ' +
      '        CD_USUARIO_APROVOU, CD_USUARIO_BAIXOU, CD_MOVIMENTO_TE, NR_CHEQUE ' +
      ' FROM FIN_CP_PREPARACAO ' +
      ' WHERE CD_COLIGADA IN ( %s ) AND DT_PAGAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL ' +
      ' ORDER BY DT_PAGAMENTO ';
   SqlFilter: array[boolean, boolean, boolean, boolean] of string =
      (
         (
            (
               (
                  '',
                  'SN_PGTO_EFETIVADO = ''S'''
               ),
               (
                  'SN_PGTO_AUTORIZADO = ''N'' AND SN_PGTO_EFETIVADO = ''N''',
                  ''
               )
            ),
            (
               (
                  'SN_PGTO_AUTORIZADO = ''S'' AND SN_PGTO_EFETIVADO = ''N''',
                  ''
               ),
               (
                  '',
                  ''
               )
            )
         ),
         (
            (
               (
                  'SN_PGTO_EFETIVADO = ''N''',
                  ''
               ),
               (
                  '',
                  ''
               )
            ),
            (
               (
                  '',
                  ''
               ),
            (
               '',
               ''
            )
         )
      )
   );
var
   LSFiltro: string;
begin
   qryPreparacao.Close;
   qryPreparacao.SQL.Text := Format( SQL_FILTRAR_PREPARACAO, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );

   qryPreparacao.ParamByName('DT_INICIAL').AsDateTime := umdtInicial.Date;
   qryPreparacao.ParamByName('DT_FINAL').AsDateTime := umdtFinal.Date;

   LSFiltro :=
      SqlFilter[rbPendentes.Checked, rbAutorizados.Checked,
         rbNaoAutorizados.Checked, rbEfetuados.Checked];

   qryPreparacao.Filter := LSFiltro;
   qryPreparacao.Filtered := true;
   qryPreparacao.Open;
end;

procedure Tfrm_Compromisso_Preparados.qryItensCalcFields(DataSet: TDataSet);
begin
   if Self.qryItens.FieldByName('sn_previsao').AsString = 'S' then
   begin
      Self.qryItensdescSituacao.AsString := 'Previsão';
   end
   else if Self.qryItens.FieldByName('cd_situacao').AsInteger = 1 then
   begin
      if Self.qryItens.FieldByName('vl_saidas').AsCurrency > 0 then
         Self.qryItensdescSituacao.AsString := 'Parcial'
      else
         Self.qryItensdescSituacao.AsString := 'Em Aberto'
   end
   else if Self.qryItens.FieldByName('cd_situacao').AsInteger = 2 then
   begin
      Self.qryItensdescSituacao.AsString := 'OK';
   end;
end;

procedure Tfrm_Compromisso_Preparados.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_Compromisso_Preparados.FormShow(Sender: TObject);
begin
   umdtInicial.Date := Date;
   umdtFinal.Date := Date;
   filtra;
end;

procedure Tfrm_Compromisso_Preparados.rbPendentesClick(Sender: TObject);
begin
   filtra;
end;

procedure Tfrm_Compromisso_Preparados.rbAutorizadosClick(Sender: TObject);
begin
   filtra
end;

procedure Tfrm_Compromisso_Preparados.rbNaoAutorizadosClick(
  Sender: TObject);
begin
   filtra
end;

procedure Tfrm_Compromisso_Preparados.rbEfetuadosClick(Sender: TObject);
begin
    filtra
end;

procedure Tfrm_Compromisso_Preparados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Compromisso_Preparados.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = VK_F12 then
      btnFecharClick( nil );
end;

procedure Tfrm_Compromisso_Preparados.btnAutorizarPagamentoClick(
  Sender: TObject);
var
   posicao : Pointer;
begin

   if not DM.UsuarioLogado.TemPermissao( 2046, npAcesso, True ) then Exit;
 

   if Mensagem('Tem certeza que deseja autorizar o pagamento selecionado?',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
   <> mrYes then Exit;

   qyAux.Close;
   qyAux.SQL.Clear;
   qyAux.SQL.Add('UPDATE fin_cp_preparacao             ');
   qyAux.SQL.Add('  SET sn_pgto_autorizado = ''S'',    ');
   qyAux.SQL.Add('      cd_usuario_aprovou = ' + IntToStr(DM.iCdPessoaLogado) );
   qyAux.SQL.Add('WHERE cd_preparacao =  ' + qryPreparacaocd_preparacao.AsString );

   qyAux.ExecSQL;


   posicao := qryPreparacao.GetBookmark;
   filtra;
   qryPreparacao.GotoBookmark(posicao);
   
end;

procedure Tfrm_Compromisso_Preparados.btnBloquearPagamentoClick(
  Sender: TObject);
var
   posicao : Pointer;
begin

   if not DM.UsuarioLogado.TemPermissao( 2046, npAcesso, True ) then Exit;

   if Mensagem('Tem certeza que deseja cancelar a autorização para o pagamento selecionado?',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
   <> mrYes then Exit;

   qyAux.Close;
   qyAux.SQL.Clear;
   qyAux.SQL.Add('UPDATE fin_cp_preparacao             ');
   qyAux.SQL.Add('  SET sn_pgto_autorizado = ''N'',    ');
   qyAux.SQL.Add('      cd_usuario_aprovou = ' + IntToStr(DM.iCdPessoaLogado) );
   qyAux.SQL.Add('WHERE cd_preparacao =  ' + qryPreparacaocd_preparacao.AsString );

   qyAux.ExecSQL;


   posicao := qryPreparacao.GetBookmark;
   filtra;
   qryPreparacao.GotoBookmark(posicao);
   
end;

procedure Tfrm_Compromisso_Preparados.srcPreparacaoDataChange(
  Sender: TObject; Field: TField);
begin
   btnAutorizarPagamento.Enabled := qryPreparacao.FieldByName('sn_pgto_autorizado').AsString = 'N';
   
   btnBloquearPagamento.Enabled  := (qryPreparacao.FieldByName('sn_pgto_autorizado').AsString = 'S') AND
                                    (qryPreparacao.FieldByName('sn_pgto_efetivado').AsString = 'N');

   btnBaixarCompromisso.Enabled := (qryPreparacao.FieldByName('sn_pgto_efetivado').AsString = 'N') AND
                                   (qryPreparacao.FieldByName('sn_pgto_autorizado').AsString = 'S');

   btnEstornar.Enabled := (qryPreparacao.FieldByName('sn_pgto_efetivado').AsString = 'S') AND
                          (qryPreparacao.FieldByName('sn_pgto_autorizado').AsString = 'S');
   qryItens.Close;
   qryItens.ParamByName('CD_PREPARACAO').AsInteger := qryPreparacaoCD_PREPARACAO.AsInteger;
   qryItens.Open;
end;

procedure Tfrm_Compromisso_Preparados.umdtInicialChangeDate(Sender: TObject);
begin
   filtra();
end;

function Tfrm_Compromisso_Preparados.VerificaTitulosBaixados: boolean;
const

   MSG_UM_TITULO =
      'Há um compromisso vinculado a essa preparação que já foi baixado.' + #13 +
      'Deseja excluir este compromisso da preparação, ajustar o valor total e baixar os demais compromissos?';
   MSG_VARIOS_TITULOS =
      'Há %d compromissos vinculados a essa preparação que já foram baixados.' + #13 +
      'Deseja excluir esses compromissos da preparação, ajustar o valor total e baixar os demais compromissos?';
var
   LIContador: integer;
begin
   Result := true;
   LIContador := 0;
   Self.qryItens.First;
   while not Self.qryItens.Eof do
   begin
      if Self.qryItens.FieldByName('cd_situacao').AsInteger = 2 then Inc(LIContador);
      Self.qryItens.Next;
   end;
   if LIContador > 0 then
   begin
      if LIContador = 1 then
         Result := Mensagem(MSG_UM_TITULO, 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES
      else
         Result := Mensagem(MSG_VARIOS_TITULOS, 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES;
      if Result then
      begin
         Self.qryItens.First;
         while not Self.qryItens.Eof do
         begin
            if Self.qryItens.FieldByName('cd_situacao').AsInteger = 2 then
            begin
               Self.qyExcluiItem.ParamByName('cd_preparacao').AsInteger := Self.qryItenscd_preparacao.AsInteger;
               Self.qyExcluiItem.ParamByName('cd_titulo').AsInteger := Self.qryItenscd_titulo.AsInteger;
               Self.qyExcluiItem.ExecSQL;
            end;
            Self.qryItens.Next;
         end;
         Self.qryPreparacao.Close;
         Self.qryPreparacao.Open;
         Self.qryItens.Close;
         Self.qryItens.Open;
      end;     
   end;
end;

procedure Tfrm_Compromisso_Preparados.btnEstornarClick(Sender: TObject);
   function GetColigadaByMovTE(const cd_mov_te: Integer): Integer;
   var
      qyGetColigadaByMovTE: TUMZReadOnlyQuery;
   begin
      DM.CriarConsulta(qyGetColigadaByMovTE);
      qyGetColigadaByMovTE.SQL.Text := 'SELECT cd_coligada FROM fin_mov_tesouraria WHERE cd_movimento_te = :cd_movimento_te';
      qyGetColigadaByMovTE.ParamByName('cd_movimento_te').AsInteger := cd_mov_te;
      qyGetColigadaByMovTE.Open();

      Result := qyGetColigadaByMovTE.FieldByName('cd_coligada').AsInteger;

      FreeAndNil(qyGetColigadaByMovTE);
   end;
Var
   dblDinheiro, dblCheque : Currency;
   iCodCaixa, iCodAbertura, iCodAberturaAtual : integer;
   iTpConta :word;
   Movimento : TMovimento;
   ds_historico : String;
   qyAltera : TUMZQuery;
   i : Integer;
   sChave : String;
   iMovEstornado, cd_coligada : Integer;
begin
   // Estorno de Compromisso
   if not DM.UsuarioLogado.TemPermissao( 2049, npAcesso, True ) then Exit;

   if not (qryPreparacaosn_pgto_efetivado.AsString = 'S') then
   Begin
      Mensagem( 'Só é possível estornar uma preparação efetivada.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
   End;

   // Bloqueio de Data;
   if DM.EstaBloqueado(qryPreparacaodt_pagamento.AsDateTime, true) then Exit;

   // Verificar se a baixa foi pela preparação
   if Mensagem( 'Confirma o estorno de todos os títulos baixados pela preparação?', Application.Title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO then Exit;

   // Selecionar a última movimentação do título
   iMovEstornado := qryPreparacaocd_movimento_te.AsInteger;

   // Verificar em qual caixa foi baixada a parcela
   cd_coligada := GetColigadaByMovTE(iMovEstornado);

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add('SELECT * FROM fin_mov_tesouraria WHERE cd_movimento_te = :CdMovTe AND cd_coligada = :cd_coligada AND nr_estorno = 0' );
   qyAux.SQL.Add('ORDER BY cd_movimento_te DESC ');
   qyAux.SQL.Add('LIMIT 1');
   qyAux.ParamByName('CdMovTe').AsInteger := iMovEstornado;
   qyAux.ParamByName('cd_coligada').AsInteger := cd_coligada;
   qyAux.Open();

   // Titulo entrou no caixa?  -- Isso nunca deverá acontecer
   if qyAux.Eof then
   begin
      Mensagem( 'Não é possível encontrar o lançamento do título no caixa.', Application.Title, MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      Exit;
   end;

   // Códigos dos caixas que a parcela foi baixada
   iCodCaixa := qyAux.FieldByName('cd_caixa').AsInteger;
   iCodAbertura := qyAux.FieldByName('cd_abertura_caixa').AsInteger;

   movimento := TMovimento.Create;

   Movimento.Coligada := cd_coligada;

   if not Movimento.VerificaContaAtiva(iCodCaixa, iTpConta, iCodAberturaAtual ) then
   begin
      Mensagem( 'Não é possível estornar o título. A conta não está mais ativa.', Application.Title, MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      Exit;
   end;

   movimento.free;

   if (iTpConta = 3) AND (iCodAberturaAtual = 0) then
   begin
      Mensagem( 'Não é possível estornar p título. O caixa está fechado.', Application.Title, MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      Exit;
   end;

   if (iTpConta = 3) AND (iCodAberturaAtual <> iCodAbertura) then
   begin
      if Mensagem( 'Atenção: O caixa que o título foi baixado ja foi fechado. Se você estornar essa parcela, será feito um lançamento de débito no caixa aberto atualmente. Deseja continuar.', Application.Title, MB_YESNOCANCEL + MB_ICONSTOP ) <> mrYES then
      begin
         Screen.Cursor := crDefault;
         Exit;
      end;
   end;

   Screen.Cursor := crHourGlass;

   dblDinheiro := qyAux.FieldByName('vl_dinheiro').AsCurrency;
   dblCheque   := qyAux.FieldByName('vl_cheque').AsCurrency;
   ds_historico := qyAux.FieldByNAme('ds_movimento').AsString;

   movimento := TMovimento.Create;

   movimento.Historico := 'ESTORNO ' + qyAux.FieldByName('ds_movimento').AsString;

   Movimento.ValorMovimento := qyAux.FieldByName('vl_movimento').AsCurrency;

   Movimento.ValorEmDinheiro := qyAux.FieldByName('vl_dinheiro').AsCurrency;
   Movimento.ValorEmCheque   := qyAux.FieldByName('vl_cheque').AsCurrency;
   Movimento.Mensalidade     := qyAux.FieldByName('cd_mensalidade').AsInteger;

   Movimento.EntradaSaida    := 1;
   Movimento.CodAcao := 6; // Acão Padrão
   Movimento.NumeroDocumento := qyAux.FieldByName('nr_documento').AsString;
   Movimento.DataLiberacao := Date;
   Movimento.Origem := 2; // Contas a Receber;
   Movimento.DataMovimento := qyAux.FieldByName('dt_movimento').AsDateTime;

   Movimento.Coligada := qyAux.FieldByName('cd_coligada').AsInteger;
   Movimento.FormaDePagamento := qyAux.FieldByName('cd_forma_pgto').AsInteger;

   Movimento.RegistrarMovimentacaoTe( iCodCaixa );

   // Arrumar o estorno
   DM.CriarConsulta(qyAltera);
   qyAltera.SQL.Text :=
      ' SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria ';
   qyAltera.Open();

   i := qyAltera.FieldByName('ultimo').AsInteger + 1;

   qyAltera.Close();

   qyAltera.SQL.Text :=
      ' UPDATE fin_mov_tesouraria      ' +
      ' SET nr_estorno = ' + IntToStr(i) +
      ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
      ' WHERE cd_movimento_te in (' + IntToStr(qyAux.FieldByName('cd_movimento_te').AsInteger) + ', ' + IntToStr(Movimento.CodigoMovimento) + ') AND cd_coligada = ' + IntToStr(cd_coligada);
   qyAltera.ExecSQL();

   FreeAndNil(qyAltera);

   Movimento.free;

   // Eliminar as apropriações nos centros de custos da tesouraria
   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add(
         ' DELETE FROM fin_apropria_te '  +
         '  WHERE cd_movimento_te = :CdMovimento ' +
         '  AND cd_coligada = :CdColigada '
        );
   qyAux.ParamByName('CdMovimento').AsInteger := iMovEstornado;
   qyAux.ParamByName('CdColigada').AsInteger := qryPreparacaocd_coligada.AsInteger;
   qyAux.ExecSQL();

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add( 'UPDATE fin_contas_pagar cp ' );
   qyAux.SQL.Add( 'INNER JOIN fin_mov_cp m ON (cp.cd_titulo = m.cd_titulo and m.cd_coligada = cp.cd_coligada) ');
   qyAux.SQL.Add( 'SET cp.cd_situacao = :Situacao, cp.dt_pagamento = NULL ' );
   qyAux.SQL.Add( 'WHERE (m.cd_movimento_te = :Movimento) AND (m.cd_coligada = :cd_coligada)' );
   qyAux.ParamByName('Movimento').AsInteger := iMovEstornado;
   qyAux.ParamByName('cd_coligada').AsInteger := qryPreparacaocd_coligada.AsInteger;
   qyAux.ParamByName('Situacao').AsInteger := 1;
   qyAux.ExecSQL();

  // Eliminar a ultima movimentação de saida...
  qyAux.Close;
  qyAux.SQL.Clear;
  qyAux.SQL.Add(
      ' DELETE FROM fin_mov_cp '  +
      '  WHERE cd_movimento_te = :CdMovimento ' +
      '  AND cd_coligada = :CdColigada '
     );
  qyAux.ParamByName('CdColigada').AsInteger := qryPreparacaocd_coligada.AsInteger;
  qyAux.ParamByName('CdMovimento').AsInteger := iMovEstornado;
  qyAux.ExecSQL();

  // Colocar a Preparação como não efetivada;

  // Eliminar a ultima movimentação de saida...
  qyAux.Close;
  qyAux.SQL.Clear;
  qyAux.SQL.Add(
      ' UPDATE fin_cp_preparacao '  +
      '    SET sn_pgto_efetivado = "N", ' +
      '        cd_movimento_te = NULL        ' +
      ' WHERE cd_preparacao = :CdPrepara ' +  
      '  AND cd_coligada = :CdColigada '
     );
  qyAux.ParamByName('CdColigada').AsInteger := qryPreparacaocd_coligada.AsInteger;
  qyAux.ParamByName('CdPrepara').AsInteger := qryPreparacaocd_preparacao.AsInteger;
  qyAux.ExecSQL();

  // Registrar o Log do Estorno

  Screen.Cursor := crDefault;

  Mensagem( 'Pagamento estornado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

  Filtra();

end;

procedure Tfrm_Compromisso_Preparados.btnBaixarCompromissoClick(
  Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 2038, npAcesso, True ) then Exit;

   if Self.VerificaTitulosBaixados then
   begin
      Application.CreateForm(Tfrm_compromisso_baixar_preparacao, frm_compromisso_baixar_preparacao);
      frm_compromisso_baixar_preparacao.ShowModal;
      filtra();
   end;
end;

procedure Tfrm_Compromisso_Preparados.qryPreparacaoAfterOpen(DataSet: TDataSet);
begin
   qryItens.Close;
   qryItens.ParamByName('CD_PREPARACAO').AsInteger := qryPreparacaoCD_PREPARACAO.AsInteger;
   qryItens.Open;
end;

procedure Tfrm_Compromisso_Preparados.qryPreparacaoCalcFields(
  DataSet: TDataSet);
var
   qySaldo : TUMZQuery;
   movimento : Tmovimento;
begin
   // Buscar o Saldo Atual e a Soma de Itens
   DM.CriarConsulta(qySaldo);

   qySaldo.SQL.Clear;
   qySaldo.SQL.Add(' SELECT                      ');
   qySaldo.SQL.Add('   SUM(vl_baixa) baixa, SUM(vl_multa) multa, SUM(vl_juros) juros, SUM(vl_desconto) desconto ');
   qySaldo.SQL.Add(' FROM fin_cp_preparacao_itens ');
   qySaldo.SQL.Add(' WHERE cd_preparacao = :CdPreparacao ');

   qySaldo.ParamByName('CdPreparacao').AsInteger := qryPreparacaocd_preparacao.AsInteger;

   qySaldo.Open;

   qryPreparacaovalTotal.AsFloat := qySaldo.FieldByNAme('baixa').AsFloat +
                                      qySaldo.FieldByNAme('multa').AsFloat +
                                      qySaldo.FieldByNAme('juros').AsFloat -
                                      qySaldo.FieldByNAme('desconto').AsFloat;

   // Pegar o novo saldo
   movimento := Tmovimento.Create;
   Movimento.Coligada := qryPreparacaoCD_COLIGADA.AsInteger;
   qryPreparacaovalSaldo.AsCurrency := movimento.NovoSaldo(qryPreparacaocd_caixa.AsInteger,False);
   movimento.Free;
end;

end.

