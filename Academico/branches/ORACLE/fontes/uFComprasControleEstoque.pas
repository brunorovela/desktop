unit uFComprasControleEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset, UZDataset,
  ComCtrls, Buttons, ImgList, ToolWin, UMDateTimePicker, ZAbstractDataset,
  ZDbcIntfs, UZDbcFuncs;

type
  TfrmComprasControleEstoque = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    qyEstoque: TUMZReadOnlyQuery;
    edCodigo: TEdit;
    edNome: TEdit;
    rbPesquisaPorProduto: TRadioButton;
    rbPesquisaPorPessoa: TRadioButton;
    Label1: TLabel;
    sbPesquisa: TSpeedButton;
    dsEstoque: TDataSource;
    qyEstoqueDS_PRODUTO: TStringField;
    qyEstoqueDT_ENTRADA: TDateTimeField;
    qyEstoqueDS_ORIGEM: TStringField;
    qyEstoqueDS_DESTINO: TStringField;
    Button1: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    lbMsgTopo: TLabel;
    qyEstoqueTP_ENTRADA_SAIDA: TSmallintField;
    qyEstoqueCD_COMPRA: TIntegerField;
    qyEstoqueDS_ENTRADA: TStringField;
    qyEstoqueDS_SAIDA: TStringField;
    ilToolBar: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnRegistrarEntrada: TToolButton;
    btnRegistrarSaida: TToolButton;
    ToolButton4: TToolButton;
    btnCancelarMovimentacao: TToolButton;
    ToolButton5: TToolButton;
    btnFechar: TToolButton;
    ToolButton6: TToolButton;
    rbPesquisaPorKit: TCheckBox;
    qyEstoqueusuario: TStringField;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    qryComprasMensalidade: TUMZQuery;
    qryComprasMensalidadecd_mensalidade: TIntegerField;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    qyEstoquecd_kit: TIntegerField;
    qyEstoquecd_produto: TStringField;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    lbMsgRodape: TLabel;
    qyEstoquevl_compra: TFloatField;
    qyEstoquevl_venda: TFloatField;
    btnAlterarValorUnitario: TToolButton;
    ToolButton8: TToolButton;
    qyEstoqueNR_QUANTIDADE: TIntegerField;
    qyEstoqueDT_COMPRA: TDateTimeField;
    qyEstoqueTP_PESSOA: TIntegerField;
    qyEstoqueCD_PESSOA: TIntegerField;
    qyEstoqueNR_ANOSEMESTRE: TIntegerField;
    qyRegistraSaida: TUMZQuery;
    qyRegistraSaidacd_compra: TIntegerField;
    qyRegistraSaidacd_produto: TStringField;
    qyRegistraSaidatp_entrada_saida: TSmallintField;
    qyRegistraSaidacd_pessoa: TIntegerField;
    qyRegistraSaidatp_pessoa: TSmallintField;
    qyRegistraSaidanr_quantidade: TIntegerField;
    qyRegistraSaidadt_compra: TDateTimeField;
    qyRegistraSaidadt_entrada: TDateTimeField;
    qyRegistraSaidavl_compra: TFloatField;
    qyRegistraSaidacd_usuario: TIntegerField;
    qyRegistraSaidaNR_ANOSEMESTRE: TIntegerField;
    qyRegistraEntrada: TUMZQuery;
    qyRegistraEntradacd_compra: TIntegerField;
    qyRegistraEntradacd_produto: TStringField;
    qyRegistraEntradatp_entrada_saida: TSmallintField;
    qyRegistraEntradacd_pessoa: TIntegerField;
    qyRegistraEntradatp_pessoa: TSmallintField;
    qyRegistraEntradanr_quantidade: TIntegerField;
    qyRegistraEntradadt_compra: TDateTimeField;
    qyRegistraEntradadt_entrada: TDateTimeField;
    qyRegistraEntradavl_compra: TFloatField;
    qyRegistraEntradacd_usuario: TIntegerField;
    procedure btnAlterarValorUnitarioClick(Sender: TObject);

    procedure ToolButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarMovimentacaoClick(Sender: TObject);
    procedure btnRegistrarSaidaClick(Sender: TObject);
    procedure btnRegistrarEntradaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsEstoqueDataChange(Sender: TObject; Field: TField);
    procedure edCodigoEnter(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbPesquisaPorProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   fs : TFormatSettings;

    { Private declarations }
    procedure sbPesquisaPorProduto(Sender: TObject);
    procedure sbPesquisaPorPessoa(Sender: TObject);
      function Exclui: Boolean;
      function Estorna: Boolean;


    function GetQtdEstoqueData( const cd_produto: String; const data: TDateTime; const nr_dias_anteriores: Integer = 0 ): Integer;
    function GetTotalProdutosPessoa( const cd_pessoa: Integer; const data_inicial, data_final: TDateTime ): Integer;
  public
   procedure Filtrar();
   function RegistraSaida( cd_produto: String; nr_quantidade: Integer; vl_produto : Double  ) : Integer;
    { Public declarations }
  end;

var
  frmComprasControleEstoque: TfrmComprasControleEstoque;

implementation

uses
   uDM, uFComprasBuscaProdutos, uFComprasRegistroEntradas, uClassMovimento,
   uFComprasRegistroSaidas, General, ClassComprasEntradaSaida, uUsuario,
   ClassRegistros, ClassMensalidade, uFSelecionarPessoa, Main, uMensalidades,
   uEstorno, uRemessaClass, uTrocarProdutos;

{$R *.dfm}

procedure TfrmComprasControleEstoque.btnAlterarValorUnitarioClick(
  Sender: TObject);
CONST
   SQL_ATUALIZAR_VALOR =
      ' UPDATE comp_estoque '
      + ' SET '
      + ' vl_compra = :vl_compra '
      + ' WHERE '
      + ' cd_compra = :cd_compra '; 
var
   vl_compra_novo : String;
   qryAtualizarValorUnitario : TUMZQuery;
   sn_alterar : Boolean;
begin
   if (MessageBox(
      Handle,
      'Deseja realmente alterar o valor unitário?',
      'Confirmação',
       MB_ICONQUESTION or MB_YESNO) <> ID_YES) then begin Abort; end;

   vl_compra_novo := qyEstoquevl_compra.AsString;
   sn_alterar := InputQuery(
      'UNIMESTRE',
      'Digite o novo valor de compra:',
      vl_compra_novo
   );

   vl_compra_novo := trim(vl_compra_novo);
   if not (sn_alterar) then
      Abort;

   if (Length(vl_compra_novo)< 1) OR (StrToFloat(vl_compra_novo) < 1) then
      Abort;
             
   DM.CriarConsulta(qryAtualizarValorUnitario);
   with qryAtualizarValorUnitario do
   begin
      SQL.Clear();
      SQL.Add(SQL_ATUALIZAR_VALOR);
      ParamByName('vl_compra').AsFloat := StrToFloat(vl_compra_novo);
      ParamByName('cd_compra').AsInteger := qyEstoqueCD_COMPRA.AsInteger;
      ExecSQL();
   end;
                   
   Self.Filtrar();
end;

procedure TfrmComprasControleEstoque.btnCancelarMovimentacaoClick(
  Sender: TObject);
const
   SCaptionConfirm = 'Confirmação';
   SCaptionInfo = 'Informação';

   SQuestionCancelar = ''
      + 'Deseja realmente cancelar esta movimentação?';

   SQuestionCancelarComEstorno = ''
      + 'Deseja realmente cancelar esta movimentação e estornar todos os '
      + 'títulos vinculados?';

   SQuestionEstornar = ''
      + 'Este registro possui título financeiro vinculado. Ao confirmar o '
      + 'cancelamento, o sistema irá efetuar o estorno de todos os títulos '
      + 'baixados ou parcialmente baixados que estão vinculados com este '
      + 'registro. Deseja continuar?';

   SMsgNaoExecutado = ''
      + 'O cancelamento da movimentação não foi concluído.';

   SMsgConcluido = ''
      + 'Movimentação cancelada com sucesso.';

   SSQLVerificaMensalidade = ''
      + 'SELECT DISTINCT '
      + '	1 '
      + 'FROM '
      + '	comp_estoque_mensalidade '
      + 'WHERE '
      + '	CD_COMPRA = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Continua, Estornar: Boolean;
   S: AnsiString;
begin
   Continua := DM.UsuarioLogado.TemPermissao(0,
      'UMFinanceiro.Compras.ControleEstoque.CancelarMovimentacao', npAcesso,
      True);

   if not Continua then Exit;

   Estornar := False;

   Stmt := PrepareStatement(SSQLVerificaMensalidade);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Continua := MessageBox(Handle, SQuestionEstornar, SCaptionConfirm,
               MB_ICONQUESTION or MB_YESNO) = ID_YES;
            Estornar := Continua;
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Continua then
   begin
      MessageBox(Handle, SMsgNaoExecutado, SCaptionInfo,
         MB_ICONINFORMATION or MB_OK);
      Exit;
   end;

   S := SQuestionCancelar;

   if Estornar then S := SQuestionCancelarComEstorno;

   Continua := MessageBox(Handle, PChar(S), SCaptionConfirm,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = ID_YES;

   if not Continua then Exit;

   if Estornar then
   begin
      DM.db.StartTransaction;
      
      Continua := Estorna;

      if Continua then
      begin
         Continua := Exclui;
      end;
      
      if not Continua then
      begin
         DM.db.Rollback;
      end;

      if Continua then
      begin
         DM.db.Commit;
      end;
   end;

   if not Continua then
   begin
      MessageBox(Handle, SMsgNaoExecutado, SCaptionInfo,
         MB_ICONINFORMATION or MB_OK);
      Exit;
   end;

   ClasseComprasEntradaSaida.CancelarMovimentacao(qyEstoqueCD_COMPRA.AsInteger);
   MessageBox(Handle, SMsgConcluido, SCaptionInfo, MB_ICONINFORMATION or MB_OK);
   Filtrar;
end;

procedure TfrmComprasControleEstoque.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasControleEstoque.btnRegistrarEntradaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Entradas', npAcesso, True ) then Exit;   

   if frmComprasRegistroEntradas = nil then
      Application.CreateForm( TfrmComprasRegistroEntradas, frmComprasRegistroEntradas );

   if rbPesquisaPorProduto.Checked then
      frmComprasRegistroEntradas.cd_produto_carregado := edCodigo.Text
   else
      frmComprasRegistroEntradas.cd_produto_carregado := '';

   frmComprasRegistroEntradas.ShowModal();

   frmComprasRegistroEntradas := nil;
end;

procedure TfrmComprasControleEstoque.btnRegistrarSaidaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Saidas', npAcesso, True ) then Exit;

   if rbPesquisaPorProduto.Checked then
   begin
      if ( frmComprasBuscaProdutos = nil ) then
      begin
         Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );
      end;

      frmComprasBuscaProdutos.Filtrar( edCodigo.Text );

      if ( frmComprasBuscaProdutos.qyListaProdutos.RecordCount = 0 ) then
      begin
         Mensagem( 'O produto selecionado não possui em estoque.',
                              Application.Title, MB_OK + MB_ICONWARNING, Handle );
         frmComprasBuscaProdutos := nil;
         Exit;
      end;

      frmComprasBuscaProdutos := nil;
   end;

   if not PrincipalForm.ProcuraForm(frmComprasRegistroSaidas) then
      Application.CreateForm(TfrmComprasRegistroSaidas, frmComprasRegistroSaidas);

   if rbPesquisaPorKit.Checked then
   begin
      if not rbPesquisaPorProduto.Checked then
      begin
         frmComprasRegistroSaidas.PageControl1.ActivePageIndex := 1;
         frmComprasRegistroSaidas.PageControl1Change(nil);
         frmComprasRegistroSaidas.edCdPessoa.Text := edNome.Text;
         frmComprasRegistroSaidas.edCodkIT.Text := edCodigo.Text;
         frmComprasRegistroSaidas.edCodkITExit(nil);
      end
      else
      begin
         frmComprasRegistroSaidas.btnIncluirClick(nil);
         frmComprasRegistroSaidas.qyRegistraSaidacd_produto.AsString := edCodigo.Text;
         frmComprasRegistroSaidas.edCodigoProdutoExit(nil);
         frmComprasRegistroSaidas.qyRegistraSaidacd_pessoa.AsString := edNome.Text;
         frmComprasRegistroSaidas.DBEdit2Exit(nil);
      end;
         
   end;


   try
      if not rbPesquisaPorKit.Checked then
      begin
         if rbPesquisaPorProduto.Checked then
            frmComprasRegistroSaidas.cd_produto_carregado := edCodigo.Text
         else if rbPesquisaPorPessoa.Checked then
            frmComprasRegistroSaidas.cd_pessoa_carregado := StrToInt( edCodigo.Text );
      end;
   except
   end;

   frmComprasRegistroSaidas.ShowModal();

   frmComprasRegistroSaidas := nil;
end;

procedure TfrmComprasControleEstoque.Button1Click(Sender: TObject);
var
   msg: String;
begin
   if trim(edCodigo.Text) = '' then
   begin
      if ( rbPesquisaPorProduto.Checked ) then
         msg := 'Você precisa selecionar um Produto.'
      else if ( rbPesquisaPorPessoa.Checked ) then
         msg := 'Você precisa selecionar uma Pessoa.';

      Mensagem( msg, Application.Title, MB_OK + MB_ICONINFORMATION, Handle );

      Exit;      
   end;   

   Filtrar();
end;

procedure TfrmComprasControleEstoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if ( State <> [gdSelected..gdFocused] ) AND
      (
         ( qyEstoqueTP_ENTRADA_SAIDA.AsInteger = 3 ) OR
         ( qyEstoqueTP_ENTRADA_SAIDA.AsInteger = 4 )
      ) then
   begin
      Dbgrid1.Canvas.Font.Color:= clBlack;
      DBGrid1.Canvas.Brush.Color := $8AFFFF;
   end;

   DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.Columns[DataCol].Field, State);   
end;

procedure TfrmComprasControleEstoque.dsEstoqueDataChange(Sender: TObject;
  Field: TField);
begin
   btnCancelarMovimentacao.Enabled := qyEstoqueTP_ENTRADA_SAIDA.AsInteger = 2;
end;

procedure TfrmComprasControleEstoque.edCodigoEnter(Sender: TObject);
begin
   if ( rbPesquisaPorProduto.Checked ) then
      edCodigo.SelectAll();
end;

procedure TfrmComprasControleEstoque.edCodigoExit(Sender: TObject);
begin
   if not ( rbPesquisaPorProduto.Checked ) then Exit;

   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );

   frmComprasBuscaProdutos.Filtrar( edCodigo.Text );

   if frmComprasBuscaProdutos.qyListaProdutos.RecordCount <> 1 then
   begin
      edCodigo.Text := '';
      edNome.Text := '';
      Exit;
   end;   

   edCodigo.Text := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edNome.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;

   frmComprasBuscaProdutos := nil;
end;

function TfrmComprasControleEstoque.Estorna: Boolean;
const
   SEtornoHistoricoFmt = 'ESTORNO %s';

   SCaptionAtencao = 'Atenção';
   SCaptionConfirmacao = 'Confirmação';

   SMsgPossuiCartao = ''
      + 'Não é possível realizar o estorno da mensalidade vinculada com este '
      + 'registro de saída do estoque, pois ela está vinculada a uma operação '
      + 'de baixa por cartão. Para estornar a mensalidade, utilize a opção de '
      + 'cancelar movimentação, na Planilha de Cartões.';

   SMsgPossuiRetorno = ''
      + 'O título vinculado com este registro de saída do estoque foi baixado '
      + 'através de um arquivos de retorno. O estorno deve ser efetuado pela '
      + 'tela de Retorno do Banco. A baixa encontra-se no código de retorno %d.';

   SQuestionPossuiNF = ''
      + 'Este registro de saída do estoque está vinculado com um título que '
      + 'possui uma nota fiscal gerada. Deseja continuar?';

   SMsgPossuiCantina = ''
      + 'Este registro de saída do estoque está vinculado com um título gerado '
      + 'pelo módulo da cantina. Para realizar o estorno dessa movimentação '
      + 'acesse o módulo da cantina.';

   SQuestionPossuiRecibo = ''
      + 'Você está tentando estornar um registro de saída do estoque vinculado '
      + 'com uma mensalidade que já possui recibo impresso. Tem certeza que '
      + 'deseja prosseguir?';

   SQuestionPossuiCheque = ''
      + 'Este registro de saída do estoque está vinculado com uma mensalidade '
      + 'que possui um cheque enviado para depósito. Deseja cancelar o '
      + 'processo de estorno e colocar o cheque novamento em caixa?';

   SMsgPossuiParciais = ''
      + 'Este registro de saída do estoque está vinculado a uma mensalidade '
      + 'que possui um ou mais títulos parciais pagos. Para concluir esta '
      + 'operação é necessário primeiro estornar os títulos parciais.';

   SMsgContaInativa = ''
      + 'Não é possível estornar uma mensalidade vinculada com este registro '
      + 'de saída, pois ela está relacionada com uma conta inativa.';

   SMsgCaixaFechado = ''
      + 'Não é possível estornar uma mensalidade vinculada com este registro '
      + 'de saída, pois ela está relacionada com um caixa fechado.';

   SQuestionCaixaDiferente = ''
      + 'Este registro de saída está vinculado com uma mensalidade que foi '
      + 'baixada num caixa que está fechado. Confirmar o estorno dessa parcela '
      + 'resultará em um novo lançamento de débito no caixa atualmente aberto. '
      + 'Deseja continuar?';

   SQuestionExcluirCheques = ''
      + 'Este registro de saída do estoque possui um ou mais títulos '
      + 'vinculados que foram baixados com cheque. Deseja excluir esses '
      + 'títulos do controle de cheque?';

   SSQLVerificaCartao = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      fin_cartao_mensalidades c '
      + 'WHERE '
      + '      EXISTS ( '
      + '            SELECT '
      + '                  e.CD_MENSALIDADE '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '                        JOIN mensalidades m ON '
      + '                              (e.CD_MENSALIDADE = m.cd_mensalidade) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  c.cd_mensalidade = e.CD_MENSALIDADE AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLVerificaRetorno = ''
      + 'SELECT '
      + '      MIN(t.cd_retorno) '
      + 'FROM '
      + '      retorno_itens_titulos t '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  i.cd_retorno '
      + '            FROM '
      + '                  retorno_itens i '
      + '            WHERE '
      + '                  t.cd_retorno = i.cd_retorno AND '
      + '                  t.nr_sequencia = i.nr_sequencia AND '
      + '                  i.cd_situacao = 10 '
      + '      ) '
      + '      AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade m '
      + '                        JOIN mensalidades e ON '
      + '                              (m.CD_MENSALIDADE = e.cd_mensalidade) '
      + '            WHERE '
      + '                  e.situacao IN (0, 1) AND '
      + '                  t.cd_mensalidade = m.CD_MENSALIDADE AND '
      + '                  m.CD_COMPRA = ? '
      + '      ) ';

   SSQLVerificaNF = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      fin_nfe_produto_enviadas n '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN comp_estoque_mensalidade em ON '
      + '                              (m.cd_mensalidade = em.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  n.nr_nota = m.nr_nf AND '
      + '                  em.CD_COMPRA = ? '
      + '      ) ';

   SSQLVerificaCantina = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      comp_estoque_mensalidade e '
      + 'WHERE '
      + '      e.CD_COMPRA = ? AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '            WHERE '
      + '                  e.CD_MENSALIDADE = m.cd_mensalidade AND '
      + '                  m.situacao IN (0, 1) '
      + '      ) '
      + '      AND '
      + '      ( '
      + '            EXISTS '
      + '            ( '
      + '                  SELECT '
      + '                        m.cd_mensalidade '
      + '                  FROM '
      + '                        ctn_movimentacao_financeiro m '
      + '                  WHERE '
      + '                        e.CD_MENSALIDADE = m.cd_mensalidade '
      + '            ) '
      + '            OR '
      + '            EXISTS '
      + '            ( '
      + '                  SELECT '
      + '                        v.cd_mensalidade '
      + '                  FROM '
      + '                        ctn_vendas_financeiro v '
      + '                  WHERE '
      + '                        e.CD_MENSALIDADE = v.cd_mensalidade '
      + '            ) '
      + '      ) ';

   SSQLVerificaRecibo = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      COALESCE(m.cd_recibo, 0) > 0 AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_MENSALIDADE '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  m.cd_mensalidade = e.CD_MENSALIDADE AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLUpdateRecibos = ''
      + 'UPDATE '
      + '      recibos r '
      + 'SET '
      + '      r.sn_estorno = 1, '
      + '      r.cd_turma = NULL, '
      + '      r.nr_parcela = NULL, '
      + '      r.dt_vencimento = NULL, '
      + '      r.nr_impressoes = 0 '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  r.cd_recibo = m.cd_recibo AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLVerificaCheques = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      fin_cheques c '
      + 'WHERE '
      + '      c.cd_situacao = 1 AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  cm.cd_mensalidade '
      + '            FROM '
      + '                  fin_cheques_mensalidades cm '
      + '                        JOIN mensalidades m ON '
      + '                              (cm.cd_mensalidade = m.cd_mensalidade) '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  c.cd_cheque = cm.cd_cheque AND '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.situacao IN (0, 1) '
      + '   ) ';

   SSQLUpdateCheques = ''
      + 'UPDATE '
      + '      fin_cheques c '
      + 'SET '
      + '      c.cd_situacao = 0 '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  cm.cd_mensalidade '
      + '            FROM '
      + '                  fin_cheques_mensalidades cm '
      + '                        JOIN mensalidades m ON '
      + '                              (cm.cd_mensalidade = m.cd_mensalidade) '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  c.cd_cheque = cm.cd_cheque AND '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.situacao IN (0, 1) '
      + '      ) ';

   SSQLSelectDataPgto = ''
      + 'SELECT DISTINCT '
      + '      m.datapagamento '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      m.datapagamento IS NOT NULL AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  m.cd_mensalidade = e.CD_MENSALIDADE AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLVerificaParciais = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      comp_estoque_mensalidade e '
      + 'WHERE '
      + '      e.CD_COMPRA = ? AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN mensalidades p ON '
      + '                              (m.cd_mensalidade < p.cd_mensalidade) AND '
      + '                              (COALESCE(m.cd_mensalidade_origem, m.cd_mensalidade) = p.cd_mensalidade_origem) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  e.CD_MENSALIDADE = m.cd_mensalidade AND '
      + '                  p.situacao IN (0, 1) '
      + '      ) ';

   SSQLSelectTesouraria = ''
      + 'SELECT '
      + '      t.cd_movimento_te CD_MOVIMENTO_TE, '
      + '      t.cd_caixa CD_CAIXA, '
      + '      t.cd_abertura_caixa CD_ABERTURA_CAIXA, '
      + '      t.vl_dinheiro VL_DINHEIRO, '
      + '      t.vl_cheque VL_CHEQUE, '
      + '      t.vl_movimento VL_MOVIMENTO, '
      + '      t.ds_movimento DS_MOVIMENTO, '
      + '      t.tp_entrada_saida TP_ENTRADA_SAIDA, '
      + '      t.nr_documento NR_DOCUMENTO, '
      + '      t.dt_movimento DT_MOVIMENTO, '
      + '      t.cd_coligada CD_COLIGADA, '
      + '      t.cd_forma_pgto CD_FORMA_PGTO, '
      + '      m.turma CD_TURMA, '
      + '      m.anosemestre NR_ANOSEMESTRE, '
      + '      m.cd_mensalidade CD_MENSALIDADE, '
      + '      m.datapagamento DT_PAGAMENTO, '
      + '      COALESCE(m.cd_mensalidade_origem, m.cd_mensalidade) CD_MENSALIDADE_ORIGEM '
      + 'FROM '
      + '      fin_mov_tesouraria t '
      + '            JOIN mensalidades m ON '
      + '                  (t.cd_mensalidade = m.cd_mensalidade) '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      t.nr_estorno = 0 AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_MENSALIDADE '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  t.cd_mensalidade = e.CD_MENSALIDADE AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLDeleteTesouraria = ''
      + 'DELETE '
      + '	t '
      + 'FROM '
      + '	fin_mov_tesouraria t '
      + 'WHERE '
      + '	t.cd_movimento_te = ? ';   

   SSQLSelectProximoEstorno = ''
      + 'SELECT '
      + '	COALESCE(MAX(nr_estorno)) + 1 nr_estorno '
      + 'FROM '
      + '	fin_mov_tesouraria ';

   SSQLUpdateTesouraria = ''
      + 'UPDATE '
      + '	fin_mov_tesouraria '
      + 'SET '
      + '	nr_estorno = ?, '
      + '	dt_compensacao = NULL, '
      + '	sn_compensado = 0 '
      + 'WHERE '
      + '	cd_movimento_te = ? AND '
      + '	cd_coligada = ? ';

   SSQLDeleteApropriacao = ''
      + 'DELETE '
      + '	a '
      + 'FROM '
      + '	fin_apropria_te a '
      + 'WHERE '
      + '	cd_movimento_te = ? AND '
      + '	cd_coligada = ? ';

   SSQLUpdateMensalidade = ''
      + 'UPDATE '
      + '      mensalidades m '
      + 'SET '
      + '      m.datapagamento = NULL, '
      + '      m.situacao = 2, '
      + '      m.valorpago = 0, '
      + '      m.dt_credito = NULL, '
      + '      m.indicecorrecao = 0, '
      + '      m.valorjuros = valorjuros_fixo, '
      + '      m.valordesconto = valordesconto_fixo, '
      + '      m.ds_deposito = NULL '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      EXISTS ( '
      + '            SELECT '
      + '                  e.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  m.cd_mensalidade = e.CD_MENSALIDADE AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLSelectMensalidades = ''
      + 'SELECT DISTINCT '
      + '      m.cd_mensalidade '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.cd_mensalidade = e.CD_MENSALIDADE '
      + '      ) ';

   SSQLDeleteParciais = ''
      + 'DELETE '
      + '      m '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.cd_mensalidade_origem = e.CD_MENSALIDADE AND '
      + '                  m.cd_mensalidade > e.CD_MENSALIDADE '
      + '      ) ';

   SSQLSelectNossoNumero = ''
      + 'SELECT DISTINCT '
      + '      m.cd_caixa, '
      + '      m.nossonumero '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.cd_mensalidade = e.CD_MENSALIDADE '
      + '      ) ';

   SSQLSelectStatus = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      rem_status s '
      + '            JOIN mensalidades m ON '
      + '                  (s.nr_nossonumero = m.nossonumero) '
      + 'WHERE '
      + '      m.situacao IN (0, 1) AND '
      + '      s.nr_nossonumero = ? ';

   SSQLVerificaCheque = ''
      + 'SELECT DISTINCT '
      + '      1 '
      + 'FROM '
      + '      fin_cheques c '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_MENSALIDADE '
      + '            FROM '
      + '                  fin_cheques_mensalidades h '
      + '                        JOIN mensalidades m ON '
      + '                              (h.cd_mensalidade = m.cd_mensalidade) '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  c.cd_cheque = h.cd_cheque AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLDeleteCheques = ''
      + 'DELETE '
      + '      c '
      + 'FROM '
      + '      fin_cheques c '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN fin_cheques_mensalidades h ON '
      + '                              (m.cd_mensalidade = h.cd_mensalidade) '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  c.cd_cheque = h.cd_cheque AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLDeleteChequesMens = ''
      + 'DELETE '
      + '      c '
      + 'FROM '
      + '      fin_cheques_mensalidades c '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  m.situacao IN (0, 1) AND '
      + '                  c.cd_mensalidade = m.cd_mensalidade AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';
var
   Stmt, StmtUpd, StmtSelect: IZPreparedStatement;
   Rs, RsSelect: IZResultSet;
   TipoConta: Word;
   I, UserChoice, AnoSemestre, CaixaId, AberturaId, AberturaCorrenteId, LayoutId: Integer;
   S, TurmaId, NossoNumero: AnsiString;
   Movimento: TMovimento;
   Remessa: TRemessa;
   StatusNN: TStatusNN;
   SituacaoNN: TSituacaoNN;
begin
   Result := DM.UsuarioLogado.TemPermissao(2015, npAcesso, True);
   
   if not Result then Exit;

   // Verifica se o registro de compra está vinculado com títulos
   // financeiros que foram pagos usando cartão de crédito ou débito
   
   Stmt := PrepareStatement(SSQLVerificaCartao);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := False;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      MessageBox(Handle, SMsgPossuiCartao, SCaptionAtencao,
         MB_ICONWARNING or MB_OK);
      Exit;
   end;

   // Verifica se o registro de compra está vinculado com títulos financeiros
   // cujo baixa foi registrada a partir da leitura de arquivos de retorno

   Stmt := PrepareStatement(SSQLVerificaRetorno);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.IsNull(1);
            if not Result then I := Rs.GetInt(1);
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      S := Format(SMsgPossuiRetorno, [I]);
      MessageBox(Handle, PChar(S), SCaptionAtencao, MB_ICONWARNING or MB_OK);
      Exit;
   end;

   // Verifica se o registro de compra está vinculado com títulos
   // financeiros que possuem vínculo com nota fiscal de produto emitida

   Stmt := PrepareStatement(SSQLVerificaNF);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
         
            // Se encontrar alguma nota fiscal de produto emitida para um ou
            // mais títulos financeiros vinculados ao registro de compra,
            // então verifica se o usuário possui permissão para efetuar o
            // estorno mesmo que o título possui nota fiscal de produto emitida

            Result := DM.UsuarioLogado.TemPermissao(0,
               'UMFinanceiro.PermiteEstornarComNF', npAcesso, True);

            if Result then
            begin
            
               // Se o usuário possui permissão, questiona se ele realmente
               // deseja estornar o título mesmo com nota fiscal emitida

               Result := MessageBox(Handle, SQuestionPossuiNF,
                  SCaptionConfirmacao, MB_ICONQUESTION or MB_YESNO) = ID_YES;
            end;
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      Exit;
   end;

   // Verifica se o registro de compra está vinculado com títulos
   // financeiros emitidos a partir do módulo da cantina online

   Stmt := PrepareStatement(SSQLVerificaCantina);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := False;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      MessageBox(Handle, SMsgPossuiCantina, SCaptionAtencao,
         MB_ICONWARNING or MB_OK);
      Exit;
   end;

   // Verifica se o registro de compra está relacionado com
   // títulos financeiros que possuem recibo emitido

   Stmt := PrepareStatement(SSQLVerificaRecibo);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := False;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      // Se o registro de compra está vinculado com títulos
      // financeiros que possuem recibo impresso, então questiona
      // o usuário se deseja prosseguir com a operação de estorno

      Result := MessageBox(Handle, SQuestionPossuiRecibo, SCaptionConfirmacao,
         MB_ICONWARNING or MB_YESNO) = ID_YES;

      if not Result then
      begin
         Exit;
      end;

      // Atualiza os recibos dos títulos financeiros que serão estornados

      Stmt := PrepareStatement(SSQLUpdateRecibos);
      try
         Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
         Stmt := nil;
      end;

   end;

   // Verifica se o registro de compra está relacionado com títulos
   // financeiros vinculados com registros de cheque na situação "Depósito"

   Stmt := PrepareStatement(SSQLVerificaCheques);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := False;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin

      // Se o registro de compra está relacionado com títulos financeiros
      // que possuem vínculo com cheques depositados, então questiona o
      // usuário se deseja prosseguir com o estorno e colocar os chques
      // novamente na situação "Em Caixa"

      UserChoice := MessageBox(Handle, SQuestionPossuiCheque,
         SCaptionConfirmacao, MB_ICONWARNING or MB_YESNO);

      if UserChoice = ID_YES then
      begin
         // Coloca os cheques na situação "Em Caixa"
         
         Stmt := PrepareStatement(SSQLUpdateCheques);
         try
            Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
            Stmt := nil;
         end;

         Exit;
      end;
   end;

   // Seleciona as datas de pagamento dos títulos financeiros relacionados
   // com o registro de compra que está sendo estornado pelo usuário e
   // verifica se alguma das datas de pagamento está bloqueada

   Stmt := PrepareStatement(SSQLSelectDataPgto);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         while Rs.Next do
         begin
            if DM.EstaBloqueado(Rs.GetTimestamp(1), True) then
            begin
               Result := False;
               Break;
            end;
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      Exit;
   end;

   // Verifica se o registro de compra está vinculado com títulos
   // financeiros que possuem registro de pagamento parcial

   Stmt := PrepareStatement(SSQLVerificaParciais);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := False;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      MessageBox(Handle, SMsgPossuiParciais, SCaptionAtencao,
         MB_ICONWARNING or MB_OK);
      Exit;
   end;

   // Seleciona todas as movimentações da tesouraria que estão vinculadas com
   // os títulos financeiros relacionados com o registro de compra selecionado

   Stmt := PrepareStatement(SSQLSelectTesouraria);
   try
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         // Para cada movimentação de tesouraria encontrada...

         while Rs.Next do
         begin
            Movimento := TMovimento.create;
            try
               CaixaId := Rs.GetIntByName('CD_CAIXA');
               AberturaId := Rs.GetIntByName('CD_ABERTURA_CAIXA');
               AnoSemestre := Rs.GetIntByName('NR_ANOSEMESTRE');
               TurmaId := Rs.GetStringByName('CD_TURMA');

               Movimento.Coligada := DM.getColigadaByTurma(TurmaId, AnoSemestre);

               // ...verifica se a conta da movimentação está ativa...

               Result := Movimento.VerificaContaAtiva(CaixaId, TipoConta,
                  AberturaCorrenteId);

               if not Result then
               begin
                  MessageBox(Handle, SMsgContaInativa, SCaptionAtencao,
                     MB_ICONWARNING or MB_OK);
                  Break;
               end;

               // ...verifica se o caixa vinculado à movimentação está aberto...

               Result := (TipoConta <> 3) or (AberturaCorrenteId <> 0);

               if not Result then
               begin
                  MessageBox(Handle, SMsgCaixaFechado, SCaptionAtencao,
                     MB_ICONWARNING or MB_OK);
                  Break;
               end;

               // ...verifica se o caixa vinculado à movimentação está fechado
               // mas possui um caixa diferente que está aberto no momento...

               if (TipoConta = 3) and (AberturaId <> AberturaCorrenteId) then
               begin

                  // Pergunta ao usuário se deseja realmente realizar o estorno

                  UserChoice := MessageBox(Handle, SQuestionCaixaDiferente,
                     SCaptionConfirmacao, MB_ICONQUESTION or MB_YESNO);

                  if UserChoice <> ID_YES then
                  begin
                     Result := False;
                     Break;
                  end;
               end;
            finally
               FreeAndNil(Movimento);
            end;
         end;

         if Result then
         begin

            Rs.BeforeFirst;

            if Rs.Next then
            begin
            
               // Verifica se o parâmetro de autenticação do estorno está ligado

               S := DM.variavel_parametro('financeiro_autenticacao_estorno');
               S := Trim(S);

               if S <> '' then
               begin
                  // Efetua a autenticação do estorno
                  TfrmMensalidades.AutenticarMensalidade(S);
               end;
               
            end;

            // Percorre novamente os registros de movimentação...
            
            Rs.BeforeFirst;

            // ...e para cada registro...
            
            while Rs.Next do
            begin
               Movimento := TMovimento.create;
               try
                  // ...registra uma movimentação de estorno...
                  
                  S := Format(SEtornoHistoricoFmt, [Rs.GetStringByName('DS_MOVIMENTO')]);
                  Movimento.Historico := S;
                  Movimento.Mensalidade := Rs.GetIntByName('CD_MENSALIDADE');
                  Movimento.Coligada := Rs.GetIntByName('CD_COLIGADA');
                  Movimento.FormaDePagamento := Rs.GetIntByName('CD_FORMA_PGTO');
                  Movimento.NumeroDocumento := Rs.GetStringByName('NR_DOCUMENTO');
                  Movimento.DataMovimento := Rs.GetTimestampByName('DT_MOVIMENTO');
                  Movimento.ValorMovimento := Rs.GetDoubleByName('VL_MOVIMENTO');
                  Movimento.ValorEmDinheiro := Rs.GetDoubleByName('VL_DINHEIRO');
                  Movimento.ValorEmCheque := Rs.GetDoubleByName('VL_CHEQUE');
                  Movimento.CodAcao := 6;
                  Movimento.Origem := 1;
                  Movimento.DataLiberacao := Date;
                  Movimento.EntradaSaida := 1;
                  if Rs.GetIntByName('TP_ENTRADA_SAIDA') = 1 then
                  begin
                     Movimento.EntradaSaida := 2;
                  end;
                  Movimento.RegistrarMovimentacaoTe(Rs.GetIntByName('CD_CAIXA'));

                  I := 1;
                  
                  RsSelect := ExecuteQuery(SSQLSelectProximoEstorno);
                  try
                     if RsSelect.Next then
                        I := RsSelect.GetIntByName('nr_estorno');
                  finally
                     RsSelect.Close;
                     RsSelect := nil;
                  end;

                  // ...atualiza o número de estorno da movimentação...
                  
                  StmtUpd := PrepareStatement(SSQLUpdateTesouraria);
                  try
                     StmtUpd.SetInt(1, I);
                     StmtUpd.SetInt(2, Movimento.CodigoMovimento);
                     StmtUpd.SetInt(3, Rs.GetIntByName('CD_COLIGADA'));
                     StmtUpd.ExecutePrepared;
                  finally
                     StmtUpd.Close;
                     StmtUpd := nil;
                  end;

                  // ...excluí a apropriação da tesouraria...

                  StmtUpd := PrepareStatement(SSQLDeleteApropriacao);
                  try
                     StmtUpd.SetInt(1, Rs.GetIntByName('CD_MOVIMENTO_TE'));
                     StmtUpd.SetInt(2, Rs.GetIntByName('CD_COLIGADA'));
                     StmtUpd.ExecutePrepared;
                  finally
                     StmtUpd.Close;
                     StmtUpd := nil;
                  end;

                  // ...solicita ao usuário informar o motivo do estorno...

                  if not Assigned(frmEstorno) then
                     Application.CreateForm(TfrmEstorno, frmEstorno);

                  if frmEstorno.motivoEstorno = '' then
                     frmEstorno.ShowModal;

                  // ...e registra o estorno
                  
                  Movimento.registraEstorno(
                     Rs.GetIntByName('CD_MOVIMENTO_TE'),
                     Rs.GetIntByName('CD_CAIXA'),
                     Rs.GetIntByName('CD_MENSALIDADE'),
                     Rs.GetIntByName('CD_COLIGADA'),
                     DM.iCdPessoaLogado,
                     Rs.GetTimestampByName('DT_PAGAMENTO'),
                     frmEstorno.motivoEstorno, 0
                  );
                  
               finally
                  FreeAndNil(Movimento);
               end;
            end;

            Rs.BeforeFirst;

            while Rs.Next do
            begin
               StmtUpd := PrepareStatement(SSQLDeleteTesouraria);
               try
                  StmtUpd.SetInt(1, Rs.GetIntByName('CD_MOVIMENTO_TE'));
                  StmtUpd.ExecutePrepared;
               finally
                  StmtUpd.Close;
                  StmtUpd := nil;
               end;
            end;

            if Assigned(frmEstorno) then
            begin
               frmEstorno.motivoEstorno := '';
               frmEstorno.meMotivo.Text := '';
            end;
            
         end;

      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if not Result then
   begin
      Exit;
   end;

   // Recupera todos os títulos financeiros vinculados com o registro de compra

   Stmt := PrepareStatement(SSQLSelectMensalidades);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         while Rs.Next do
         begin

            // Para cada título encontrado efetua o estorno
            // das ações de movimento de desconto condicional
            DM.estornarAcoesMovimentoDescCondicional(Rs.GetInt(1));
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   // Exclui todas as parcelas parciais pagas e vinculadas com os títulos
   // financeiros relacionados com o registro de compra selecionado
    
   Stmt := PrepareStatement(SSQLDeleteParciais);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   // Verifica se o processo de remessa novo está habilitado
   
   S := DM.variavel_parametro('sn_processo_remessa_novo');
   S := Trim(S);

   if S = '1' then
   begin
      Remessa := TRemessa.Create;
      try

         // Recupera todos os nossos números dos títulos financeiros
         // vinculados com o registro de compra selecionado pelo usuário

         Stmt := PrepareStatement(SSQLSelectNossoNumero);
         try
            Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
            Rs := Stmt.ExecuteQueryPrepared;
            try

               // Percorre cada um dos registros encontrados

               while Rs.Next do
               begin
                  CaixaId := Rs.GetIntByName('cd_caixa');
                  NossoNumero := Rs.GetStringByName('nossonumero');
                  
                  SituacaoNN := snnNone;
                  StatusNN := Remessa.getStatusNossoNumero(NossoNumero);

                  if StatusNN <> nil then
                  begin
                     SituacaoNN := StatusNN.getTpSituacao;
                  end;

                  // Se o nosso número está na situação
                  // "Exportado" ou "Registrado"...

                  if SituacaoNN in [snnExportado, snnRegistrado] then
                  begin
                     StmtSelect := PrepareStatement(SSQLSelectStatus);
                     try
                        StmtSelect.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
                        RsSelect := StmtSelect.ExecuteQueryPrepared;
                        try
                           if not RsSelect.Next then
                           begin

                              // ...ignora os pedido de baixa não enviado
                              
                              LayoutId := Remessa.getLayoutConta(CaixaId);
                              Remessa.ignorarPedidoBaixaNaoEnviado(NossoNumero, LayoutId);
                           end;
                        finally
                           RsSelect.Close;
                           RsSelect := nil;
                        end;
                     finally
                        StmtSelect.Close;
                        StmtSelect := nil;
                     end;
                  end;                  
               end;
            finally
               Rs.Close;
               Rs := nil;
            end;
         finally
            Stmt.Close;
            Stmt := nil;
         end;
      finally
         FreeAndNil(Remessa);
      end;
   end;

   // Verifica se o registro de compra está relacionado com títulos
   // financeiros que foram pagos com cheques registrados no sistema

   Stmt := PrepareStatement(SSQLVerificaCheque);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin

            // Pergunta ao usuário se deseja excluir
            // os títulos do controle de cheques

            UserChoice := MessageBox(Handle, SQuestionExcluirCheques,
               SCaptionConfirmacao, MB_ICONQUESTION or MB_YESNO);

            if UserChoice = ID_YES then
            begin

               // Exclui os cheques relacionados com o título

               StmtUpd := PrepareStatement(SSQLDeleteCheques);
               try
                  StmtUpd.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
                  StmtUpd.ExecutePrepared;
               finally
                  StmtUpd.Close;
                  StmtUpd := nil;
               end;

               StmtUpd := PrepareStatement(SSQLDeleteChequesMens);
               try
                  StmtUpd.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
                  StmtUpd.ExecutePrepared;
               finally
                  StmtUpd.Close;
                  StmtUpd := nil;
               end;
            end;
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   // Atualiza a situação da mensalidade

   Stmt := PrepareStatement(SSQLUpdateMensalidade);
   try
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

end;

function TfrmComprasControleEstoque.Exclui: Boolean;
const
   SCaptionWarning = 'Atenção';
   SCaptionConfirm = 'Confirmação';
   
   SMsgNFGerada = ''
      + 'Este registro de saída do estoque está vinculado com um ou mais '
      + 'títulos que possuem nota fiscal de produto emitida. Não é possível '
      + 'concluir a operação.';

   SMsgParcelaNegociada = ''
      + 'Este registro de compra está vinculado com um ou mais títulos '
      + 'financeiros provenientes de negociação. Não é possível concluir a '
      + 'operação.';

   SMsgRemessaRegistrada = ''
      + 'Este registro de saída está vinculado com um título financeiro cujo '
      + 'nosso número foi exportado para envio na remessa ou já está '
      + 'registrado no banco. Nesse caso, sugerimos utilizar a opção de '
      + 'cancelamento do título através da Planilha de Recebimentos. Quando a '
      + 'situação do nosso número for resolvida, então o título poderá ser '
      + 'excluído.';

   SMsgBloquetoGerado = ''
      + 'Este registro de saída está vinculado com um título financeiro que '
      + 'já possui boleto impresso. Deseja realmente confirmar o cancelamento?';

   SMsgParcialComValor = ''
      + 'Este registro de saída está vinculado com um título financeiro '
      + 'parcial com valor bruto. Não é possível concluir a operação.';

   SMsgParcial = ''
      + 'Este registro de saída está vinculado com um título financeiro '
      + 'parcial. Deseja realmente concluir a operação de cancelamento?';

   SLogFmt = '%.10d;%d;%s;%d;%s;';
   SDateFmt = 'dd/mm/yyyy';
   SObsLog = 'Parcela Excluída (NN = %s)';

   SSQLSelectMensalidades = ''
      + 'SELECT DISTINCT '
      + '      m.cd_mensalidade, '
      + '      m.cd_mensalidade_origem, '
      + '      m.sn_nfe_gerada, '
      + '      m.datavencimento, '
      + '      m.dt_competencia, '
      + '      m.tipoparcela, '
      + '      m.nossonumero, '
      + '      m.bloqueto, '
      + '      m.valorbruto, '
      + '      m.codigoaluno, '
      + '      m.anosemestre, '
      + '      m.turma, '
      + '      m.parcela '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      m.situacao NOT IN (0, 1) AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_COMPRA '
      + '            FROM '
      + '                  comp_estoque_mensalidade e '
      + '            WHERE '
      + '                  m.cd_mensalidade = e.CD_MENSALIDADE AND '
      + '                  e.CD_COMPRA = ? '
      + '      ) ';

   SSQLDeleteMovCR = ''
      + 'DELETE '
      + '      f '
      + 'FROM '
      + '      fin_mov_cr f '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.situacao NOT IN (0, 1) AND '
      + '                  f.cd_mensalidade = m.cd_mensalidade AND '
      + '                  m.cd_mensalidade = COALESCE(m.cd_mensalidade_origem, m.cd_mensalidade) '
      + '      ) ';

   SSQLDeleteNegociacao = ''
      + 'DELETE '
      + '      f '
      + 'FROM '
      + '      fin_negocia_parc_nova f '
      + 'WHERE '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  e.CD_MENSALIDADE '
      + '            FROM '
      + '                  mensalidades m '
      + '                        JOIN comp_estoque_mensalidade e ON '
      + '                              (m.cd_mensalidade = e.CD_MENSALIDADE) '
      + '            WHERE '
      + '                  e.CD_COMPRA = ? AND '
      + '                  m.situacao NOT IN (0, 1) AND '
      + '                  f.cd_mensalidade = m.cd_mensalidade AND '
      + '                  m.cd_mensalidade = COALESCE(m.cd_mensalidade_origem, m.cd_mensalidade) '
      + '      ) ';

   SSQLUpdateAcumulado = ''
      + 'UPDATE '
      + '      comp_acumulados a '
      + 'SET '
      + '      a.SN_PAGO = 0 '
      + 'WHERE '
      + '      a.CD_COMPRA = ? ';

   SSQLDeleteMensalidadesCompra = ''
      + 'DELETE '
      + '      e '
      + 'FROM '
      + '      comp_estoque_mensalidade e '
      + 'WHERE '
      + '      e.CD_COMPRA = ? AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  m.cd_mensalidade '
      + '            FROM '
      + '                  mensalidades m '
      + '            WHERE '
      + '                  e.CD_MENSALIDADE = m.cd_mensalidade AND '
      + '                  m.situacao NOT IN (0, 1) '
      + '      ) ';

   SSQLDeleteMensalidade = ''
      + 'DELETE '
      + '      m '
      + 'FROM '
      + '      mensalidades m '
      + 'WHERE '
      + '      m.cd_mensalidade = ? ';
var
   Stmt, StmtUpd: IZPreparedStatement;
   Rs: IZResultSet;
   S, Obs, BloquearComptencia, RemessaNovo: AnsiString;
   Remessa: TRemessa;
   StatusNN: TStatusNN;
   SituacaoNN: TSituacaoNN;
   Parcial, IgnorarBloqueto, IgnorarParciais: Boolean;
   ColigadaId: Integer;
begin
   Result := DM.UsuarioLogado.TemPermissao(2013, npExcluir, True);

   if not Result then Exit;

   BloquearComptencia := DM.variavel_parametro('financeiro_bloquear_competencia');
   BloquearComptencia := Trim(BloquearComptencia);

   RemessaNovo := DM.variavel_parametro('sn_processo_remessa_novo');
   RemessaNovo := Trim(RemessaNovo);

   IgnorarBloqueto := False;
   IgnorarParciais := False;

   Stmt := PrepareStatement(SSQLSelectMensalidades);
   try
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Stmt.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         while Rs.Next do
         begin
            if Rs.GetIntByName('sn_nfe_gerada') = 1 then
            begin
               MessageBox(Handle, SMsgNFGerada, SCaptionWarning,
                  MB_ICONWARNING or MB_OK);
               Result := False;
               Break;
            end;

            if DM.EstaBloqueado(Rs.GetTimestampByName('datavencimento'), True) then
            begin
               Result := False;
               Break;
            end;

            if DM.EstaBloqueado(Rs.GetTimestampByName('dt_competencia'), True) then
            begin
               Result := False;
               Break;
            end;

            if (Rs.GetIntByName('tipoparcela') = 4) and (BloquearComptencia = 'S') then
            begin
               MessageBox(Handle, SMsgParcelaNegociada, SCaptionWarning,
                  MB_ICONWARNING or MB_OK);
               Result := False;
               Break;
            end;

            if RemessaNovo = '1' then
            begin
               Remessa := TRemessa.Create;
               try
                  StatusNN := Remessa.getStatusNossoNumero(Rs.GetStringByName('nossonumero'));
                  try
                     SituacaoNN := snnNone;

                     if StatusNN <> nil then
                        SituacaoNN := StatusNN.getTpSituacao;
                  finally
                     FreeAndNil(StatusNN);
                  end;
               finally
                  FreeAndNil(Remessa);
               end;

               if SituacaoNN in [snnRegistrado, snnExportado] then
               begin
                  MessageBox(Handle, SMsgRemessaRegistrada, SCaptionWarning,
                     MB_ICONWARNING or MB_OK);
                  Result := False;
                  Break;
               end;
            end;

            if not IgnorarBloqueto then
            begin
               if Rs.GetStringByName('bloqueto') = 'S' then
               begin
                  Result := MessageBox(Handle, SMsgBloquetoGerado, SCaptionConfirm,
                     MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = ID_YES;
                  if not Result then Break;
                  IgnorarBloqueto := True;
               end;
            end;

            if not IgnorarParciais then
            begin
               Parcial :=
                  (not Rs.IsNullByName('cd_mensalidade_origem')) and
                  (
                     Rs.GetIntByName('cd_mensalidade_origem') <>
                     Rs.GetIntByName('cd_mensalidade')
                  );

               if Parcial then
               begin
                  if Rs.GetDoubleByName('valorbruto') > 0 then
                  begin
                     MessageBox(Handle, SMsgParcialComValor, SCaptionWarning,
                        MB_ICONWARNING or MB_OK);
                     Result := False;
                     Break;
                  end;

                  if Rs.GetDoubleByName('valorbruto') <= 0 then
                  begin
                     Result := MessageBox(Handle, SMsgParcial, SCaptionConfirm,
                        MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = ID_YES;
                     if not Result then Break;
                     IgnorarParciais := True;
                  end;               
               end;
            end;

            S := Format(SLogFmt, [
               Rs.GetIntByName('codigoaluno'),
               Rs.GetIntByName('anosemestre'),
               Rs.GetStringByName('turma'),
               Rs.GetIntByName('parcela'),
               FormatDateTime(SDateFmt, Rs.GetTimestampByName('datavencimento'))
            ]);

            ColigadaId := DM.getColigadaByTurma(Rs.GetStringByName('turma'),
               Rs.GetIntByName('anosemestre'));

            Obs := Format(SObsLog, [Rs.GetStringByName('nossonumero')]);

            DM.setLog(2013, 'Exclusao', S, ColigadaId, Obs);
         end;

         if Result then
         begin
            StmtUpd := PrepareStatement(SSQLDeleteMovCR);
            try
               StmtUpd.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
               StmtUpd.ExecutePrepared;
            finally
               StmtUpd.Close;
               StmtUpd := nil;
            end;

            StmtUpd := PrepareStatement(SSQLDeleteNegociacao);
            try
               StmtUpd.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
               StmtUpd.ExecutePrepared;
            finally
               StmtUpd.Close;
               StmtUpd := nil;
            end;

            StmtUpd := PrepareStatement(SSQLUpdateAcumulado);
            try
               StmtUpd.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
               StmtUpd.ExecutePrepared;
            finally
               StmtUpd.Close;
               StmtUpd := nil;
            end;

            StmtUpd := PrepareStatement(SSQLDeleteMensalidadesCompra);
            try
               StmtUpd.SetInt(1, qyEstoqueCD_COMPRA.AsInteger);
               StmtUpd.ExecutePrepared;
            finally
               StmtUpd.Close;
               StmtUpd := nil;
            end;

            Rs.BeforeFirst;

            while Rs.Next do
            begin
               StmtUpd := PrepareStatement(SSQLDeleteMensalidade);
               try
                  StmtUpd.SetInt(1, Rs.GetIntByName('cd_mensalidade'));
                  StmtUpd.ExecutePrepared;
               finally
                  StmtUpd.Close;
                  StmtUpd := nil;
               end;
            end;
            
         end;
         
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

end;

procedure TfrmComprasControleEstoque.Filtrar;
const
   SQL_ESTOQUE =
      ' SELECT ce.CD_COMPRA, cp.DS_PRODUTO, ce.DT_ENTRADA, ce.DT_COMPRA ,ce.NR_QUANTIDADE, ce.TP_ENTRADA_SAIDA, ' +
      '        CASE WHEN ce.TP_ENTRADA_SAIDA = 1 OR ce.TP_ENTRADA_SAIDA = 3 THEN CONCAT(ce.NR_QUANTIDADE, '''') ELSE '''' END AS DS_ENTRADA, ' +
      '        CASE WHEN ce.TP_ENTRADA_SAIDA != 1 AND ce.TP_ENTRADA_SAIDA != 3 THEN CONCAT(ce.NR_QUANTIDADE, '''') ELSE '''' END AS DS_SAIDA, ' +

      '        CASE WHEN ce.TP_ENTRADA_SAIDA = 1 OR ce.TP_ENTRADA_SAIDA = 3 THEN ' +
      '           CONCAT(CASE WHEN ce.TP_PESSOA = 1 THEN p.nm_pessoa ' +
      '                WHEN ce.TP_PESSOA = 2 THEN CONCAT(''Fornecedor '', e.nm_empresa) ' +
      '                WHEN ce.TP_PESSOA = 3 THEN "[Entrada registrada pela troca de produtos]" ' +  
      '           ELSE ' +
      '              ''[Não informado]'' ' +
      '           END, [substituir]) ' +
      '        ELSE ' +
      '           ''Almoxarifado'' ' +
      '        END AS DS_ORIGEM, ' +

      '        CASE WHEN ce.TP_ENTRADA_SAIDA = 1 OR ce.TP_ENTRADA_SAIDA = 3 THEN ' + 
      '           ''Almoxarifado'' ' +
      '        ELSE ' + 
      '           CASE WHEN ce.TP_PESSOA = 1 THEN p.nm_pessoa ' +
      '                WHEN ce.TP_PESSOA = 2 THEN e.nm_empresa ' +
      '           ELSE ' +
      '              ''[Não informado]'' ' +
      '           END ' +
      '        END AS DS_DESTINO, ' +
      '        usu.nm_pessoa as usuario, '+
      '        ce.cd_produto, '+
      '       ce.cd_kit, '+
      '       ce.vl_compra, '+  
      '       cp.VL_PRODUTO vl_venda, ' +
      '       ce.TP_PESSOA, ce.cd_pessoa, ce.nr_anosemestre ' +
      ' FROM COMP_ESTOQUE ce ' +
      '      INNER JOIN comp_produtos cp ON ( cp.CD_PRODUTO = ce.CD_PRODUTO ) ' +
      '      LEFT JOIN pessoas p ON ( ce.TP_PESSOA = 1 AND p.cd_pessoa = ce.CD_PESSOA ) ' +
      '      LEFT JOIN pessoas usu ON ( usu.cd_pessoa = ce.cd_usuario  ) '+
      '      LEFT JOIN empresas e ON ( ce.TP_PESSOA = 2 AND e.cd_empresa = ce.CD_PESSOA ) ' +
      ' WHERE 1=1 ';
   SQL_ESTOQUE_WHERE_PESSOA =
      ' AND ce.CD_PESSOA = :CD_PESSOA ';
   SQL_ESTOQUE_WHERE_PRODUTO =
      ' AND ce.CD_PRODUTO = :CD_PRODUTO ';
   SQL_ESTOQUE_WHERE_KIT =
      ' AND CP.CD_PRODUTO IN (select CONCAT(cd_produto) from comp_kits_itens where cd_kit = :cd_kit) ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO =
      ' AND ce.DT_ENTRADA >= DATE_FORMAT( :DT_ENTRADA_INICIO, ''%Y-%m-%d 00:00:00'' ) ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO_ORACLE =
      ' AND UNIMESTRE_DATAS.COMPARAR(ce.DT_ENTRADA, :DT_ENTRADA_INICIO, ''MAIOR_IGUAL'', ''YYYY-MM-DD'' ) = 1 ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM =
      ' AND ce.DT_ENTRADA <= DATE_FORMAT( :DT_ENTRADA_FIM, ''%Y-%m-%d 23:59:59'' ) ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM_ORACLE =
      ' AND UNIMESTRE_DATAS.COMPARAR(ce.DT_ENTRADA, :DT_ENTRADA_FIM, ''MENOR_IGUAL'', ''YYYY-MM-DD'' ) = 1 ';
   SQL_ESTOQUE_ORDEM =
      ' ORDER BY ce.DT_ENTRADA ' ;
begin
   qyEstoque.Close();

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qyEstoque.SQL.Text := ReplaceStr(SQL_ESTOQUE, '[substituir]', 'CASE WHEN ce.TP_ENTRADA_SAIDA = 3 THEN '' (Estorno)'' ELSE '''' END')
   else
      qyEstoque.SQL.Text := ReplaceStr(SQL_ESTOQUE, '[substituir]', 'CAST( CASE WHEN ce.TP_ENTRADA_SAIDA = 3 THEN '' (Estorno)'' ELSE '''' END AS char )');

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
   begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO_ORACLE );
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM_ORACLE );
   end else begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO );
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM );
   end;

   qyEstoque.ParamByName('DT_ENTRADA_INICIO').AsDateTime := umdtInicial.Date;
   qyEstoque.ParamByName('DT_ENTRADA_FIM').AsDateTime := umdtFinal.Date;

   if rbPesquisaPorProduto.Checked then
   begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_PRODUTO );
      qyEstoque.ParamByName('CD_PRODUTO').AsString := edCodigo.Text;
   end else if rbPesquisaPorPessoa.Checked then
   begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_PESSOA );
      qyEstoque.ParamByName('CD_PESSOA').AsString := edCodigo.Text;
   end;

   if rbPesquisaPorKit.Checked then
   begin
      if not (rbPesquisaPorProduto.Checked) then
      begin
         qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_KIT );
         qyEstoque.ParamByName('cd_kit').AsString := edCodigo.Text;
      end;

      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_PESSOA );
      qyEstoque.ParamByName('CD_PESSOA').AsString := edNome.Text;
   end;

   qyEstoque.SQL.Add(SQL_ESTOQUE_ORDEM);

   qyEstoque.Open();

   if rbPesquisaPorProduto.Checked then
   begin                                                     
      lbMsgTopo.Caption := 'Saldo inicial em ' + FormatDateTime('dd/mm/yyyy', umdtInicial.getdate) + ': ' +
                           IntToStr(GetQtdEstoqueData( edCodigo.Text, umdtInicial.getdate, 1 ));
      lbMsgRodape.Caption := 'Saldo final em ' + FormatDateTime('dd/mm/yyyy', umdtFinal.getDate) + ': ' +
                             IntToStr(GetQtdEstoqueData( edCodigo.Text, umdtFinal.getDate ));
   end else if rbPesquisaPorPessoa.Checked then
   begin
      lbMsgTopo.Caption := '';
      lbMsgRodape.Caption := 'Quantidade total de Produtos: ' +
                             IntToStr(GetTotalProdutosPessoa( StrToInt(edCodigo.Text), umdtInicial.getDate, umdtFinal.getDate ));
   end;
end;

procedure TfrmComprasControleEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmComprasControleEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F3: if btnRegistrarEntrada.Enabled then btnRegistrarEntradaClick( nil );
      VK_F4: if btnRegistrarSaida.Enabled then btnRegistrarSaidaClick( nil );
      VK_F5: if btnCancelarMovimentacao.Enabled then btnCancelarMovimentacaoClick( nil );
      VK_F12: btnFecharClick( nil );
   end;
end;

procedure TfrmComprasControleEstoque.FormShow(Sender: TObject);
begin
   GetLocaleFormatSettings(GetUserDefaultLCID, fs);
   fs.DateSeparator := '-';
   fs.TimeSeparator := ':';
   fs.ShortDateFormat := 'yyyy-mm-dd';
   fs.ShortTimeFormat := 'hh:nn:ss';

   umdtInicial.Date := Now;
   umdtFinal.Date := Now;

   rbPesquisaPorProduto.Checked := True;
   rbPesquisaPorKit.Checked := false;

   btnAlterarValorUnitario.Enabled := DM.UsuarioLogado.TemPermissao(0,
               'UMFinanceiro.ProdutoAlterarValorUnitario', npAcesso, false);

end;

function TfrmComprasControleEstoque.GetQtdEstoqueData(const cd_produto: String;
  const data: TDateTime; const nr_dias_anteriores: Integer = 0): Integer;
const
   SQL_BUSCA_QTD_ESTOQUE_DATA =
      ' SELECT GET_COMPRAS_QTD_ESTOQUE_LIMIT( :CD_PRODUTO, :DATA, :NR_DIAS_ANTERIORES ) AS registros FROM DUAL ';
var
   qyBuscaQtdEstoqueData: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyBuscaQtdEstoqueData);

   qyBuscaQtdEstoqueData.Close();
   qyBuscaQtdEstoqueData.SQL.Text := SQL_BUSCA_QTD_ESTOQUE_DATA;
   qyBuscaQtdEstoqueData.ParamByName('CD_PRODUTO').AsString := cd_produto;
   qyBuscaQtdEstoqueData.ParamByName('DATA').AsString := DateTimeToStr(data, fs);
   qyBuscaQtdEstoqueData.ParamByName('NR_DIAS_ANTERIORES').AsInteger := nr_dias_anteriores;
   qyBuscaQtdEstoqueData.Open();

   Result := qyBuscaQtdEstoqueData.FieldByName('registros').AsInteger;

   FreeAndNil(qyBuscaQtdEstoqueData);
end;

function TfrmComprasControleEstoque.GetTotalProdutosPessoa(
  const cd_pessoa: Integer; const data_inicial, data_final: TDateTime): Integer;
const
   SQL_TOTAL_PRODUTOS_PESSOA =
      ' SELECT GET_COMP_QTD_PRODUTOS_PESSOA( :CD_PESSOA, :DT_INICIO, :DT_FIM ) AS registros FROM DUAL ';
var
   qyTotalProdutosPessoa: TUMZQuery;
begin
   DM.CriarConsulta(qyTotalProdutosPessoa);

   qyTotalProdutosPessoa.Close();
   qyTotalProdutosPessoa.SQL.Text := SQL_TOTAL_PRODUTOS_PESSOA;
   qyTotalProdutosPessoa.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyTotalProdutosPessoa.ParamByName('DT_INICIO').AsDateTime := data_inicial;
   qyTotalProdutosPessoa.ParamByName('DT_FIM').AsDateTime := data_final;
   qyTotalProdutosPessoa.Open();

   Result := qyTotalProdutosPessoa.FieldByName('registros').AsInteger;

   FreeAndNil(qyTotalProdutosPessoa);
end;

procedure TfrmComprasControleEstoque.rbPesquisaPorProdutoClick(Sender: TObject);
begin
   rbPesquisaPorProduto.Checked := TRadioButton(Sender).Name = rbPesquisaPorProduto.Name;
   rbPesquisaPorPessoa.Checked := TRadioButton(Sender).Name = rbPesquisaPorPessoa.Name;

   if ( rbPesquisaPorProduto.Checked ) then
   begin
      sbPesquisa.OnClick := sbPesquisaPorProduto;
   end else if ( rbPesquisaPorPessoa.Checked ) then
   begin
      sbPesquisa.OnClick := sbPesquisaPorPessoa;
   end;
                                                
   lbMsgTopo.Caption := '';
   lbMsgRodape.Caption := '';
   edCodigo.Text := '';
   edNome.Text := '';
end;

function TfrmComprasControleEstoque.RegistraSaida(cd_produto:String;
  nr_quantidade: Integer; vl_produto: Double) : Integer;
begin
      qyRegistraSaida.close();
      qyRegistraSaida.Open();
      qyRegistraSaida.Insert();

      // Registra saída
      qyRegistraSaidatp_entrada_saida.AsInteger := 2;
      qyRegistraSaidacd_usuario.AsInteger  := DM.UsuarioLogado.Pessoa.Codigo;
      qyRegistraSaidadt_entrada.AsDateTime := Now;
      qyRegistraSaidadt_compra.AsDateTime  := Now;
      qyRegistraSaidavl_compra.AsFloat   := vl_produto;
      qyRegistraSaidatp_pessoa.AsInteger := qyEstoqueTP_PESSOA.AsInteger;
      qyRegistraSaidacd_pessoa.AsInteger := qyEstoqueCD_PESSOA.AsInteger;
      qyRegistraSaidacd_produto.AsString := cd_produto;
      qyRegistraSaidanr_quantidade.AsInteger := nr_quantidade;
      qyRegistraSaida.Post();
      result := DM.LastInsert();
end;

procedure TfrmComprasControleEstoque.sbPesquisaPorPessoa(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if not resultado.filtrado then Exit;

   edCodigo.Text := IntToStr(resultado.cd_pessoa);
   edNome.Text := resultado.nm_pessoa;

   Filtrar();
end;

procedure TfrmComprasControleEstoque.sbPesquisaPorProduto(Sender: TObject);
begin
   { Pesquisa por Produto }
   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );

   frmComprasBuscaProdutos.PermitiSemEstoque := True;
   frmComprasBuscaProdutos.ShowModal();
   if not frmComprasBuscaProdutos.flgSearch then Exit;

   edCodigo.Text := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edNome.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;

   frmComprasBuscaProdutos := nil;

   Filtrar();
end;

procedure TfrmComprasControleEstoque.ToolButton2Click(Sender: TObject);
const
   sql_verifica_valor = 'SELECT vl_produto FROM comp_produtos WHERE cd_produto = :produto';
   sql_atualiza_compra =
      'UPDATE comp_estoque SET '
     + '    vl_compra  = :vl_compra, '
     + '    nr_quantidade  = :nr_quantidade, '
     + '    dt_compra = NOW() '
     + ' WHERE cd_compra = :compra';
var
   cd_produto_novo, msgNovoProduto: String;
   qryExecutar: TUMZQuery;
   vlTotalProdutoAntigo, vlProdutoAntigo, diferencaValor, vlProdutoNovo: Double;
   nr_quantidade, cd_compra: Integer;
begin
   if not DM.UsuarioLogado.TemPermissao(
      0,
      'UMFinanceiro.Compras.Registro.Saidas',
      npEspecial,
      True
   ) then Exit;

   Application.CreateForm(Tfrm_trocar_produto, frm_trocar_produto);

   frm_trocar_produto.txt_nr_quantidade.Text := qyEstoqueNR_QUANTIDADE.AsString;
   frm_trocar_produto.nr_quantidade_max := qyEstoqueNR_QUANTIDADE.AsInteger;

   if frm_trocar_produto.ShowModal = mrOk then
   begin
      vlProdutoNovo := 0;
      diferencaValor := 0;
      vlTotalProdutoAntigo := 0;
      vlProdutoAntigo := 0;
      cd_produto_novo := frm_trocar_produto.txt_cd_produto.Text;
      nr_quantidade := StrToInt(frm_trocar_produto.txt_nr_quantidade.Text);

      //Pega o valor do antigo
      dm.CriarConsulta(qryExecutar);
      qryExecutar.SQL.Add(sql_verifica_valor);
      qryExecutar.ParamByName('produto').AsString := qyEstoquecd_produto.AsString;
      qryExecutar.Open;

      vlProdutoAntigo := qryExecutar.FieldByName('vl_produto').AsFloat;
      vlTotalProdutoAntigo := (vlProdutoAntigo * qyEstoqueNR_QUANTIDADE.AsInteger);

      //valor novo
      dm.CriarConsulta(qryExecutar);
      qryExecutar.SQL.Add(sql_verifica_valor);
      qryExecutar.ParamByName('produto').AsString := cd_produto_novo;
      qryExecutar.Open;
   
      if(qryExecutar.IsEmpty) then
      begin
         Mensagem( 'Código de produto inválido', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
         qryExecutar.Close;
         Exit;
      end;

      vlProdutoNovo := (qryExecutar.FieldByName('vl_produto').AsFloat * nr_quantidade);
      if( vlProdutoNovo <> vlTotalProdutoAntigo ) then
      begin
         msgNovoProduto :=
            'O valor total é de R$'
            + FloatToStrF(vlProdutoNovo, ffFixed, 9, 2 );

         diferencaValor := vlTotalProdutoAntigo - vlProdutoNovo;

         if (diferencaValor < 0) then
            diferencaValor := (diferencaValor * (-1));

         msgNovoProduto :=
            msgNovoProduto
            + '. Gerando uma diferença de R$'
            + FloatToStrF(diferencaValor, ffFixed, 9, 2 )
            + ' do produto atual.';

         if ( Mensagem(
            msgNovoProduto + Chr(13)
            + 'Necessário ajustar a parcela na Planilha de Recebimentos. Deseja continuar?',
            Application.Title, MB_YESNO + MB_ICONQUESTION, Handle ) = mrNo
         ) then
         begin
            Exit;
         end;
      end;

      // Registra saída...
      cd_compra := RegistraSaida(
         cd_produto_novo,
         nr_quantidade,
         vlProdutoNovo
      );

      // Registra uma entrada...
      qyRegistraEntrada.Close();
      qyRegistraEntrada.Open();
      qyRegistraEntrada.Insert();
      qyRegistraEntradaCD_PRODUTO.AsString := qyEstoquecd_produto.AsString;
      qyRegistraEntradaTP_ENTRADA_SAIDA.AsInteger := 1;
      qyRegistraEntradaCD_PESSOA.AsString := qyEstoqueCD_PESSOA.AsString;
      qyRegistraEntradaTP_PESSOA.AsInteger := 3;
      qyRegistraEntradaNR_QUANTIDADE.AsInteger := nr_quantidade;
      qyRegistraEntradaDT_ENTRADA.AsDateTime := now;
      qyRegistraEntradaVL_COMPRA.AsFloat := vlProdutoAntigo;
      qyRegistraEntradaCD_USUARIO.AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
      qyRegistraEntrada.Post();

      qryExecutar.Close;

      Mensagem(
         'Produto alterado com sucesso!',
         Application.Title,
         MB_OK + MB_ICONINFORMATION,
         Handle
      );

      FreeAndNil(qryExecutar);
      qyEstoque.Refresh;
   end;
end;

end.
