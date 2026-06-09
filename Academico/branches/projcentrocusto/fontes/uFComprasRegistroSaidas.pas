unit uFComprasRegistroSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, ImgList, ComCtrls,
  ToolWin, DB, ZAbstractRODataset, UZDataset, ZAbstractDataset, UMEditMonetario;

type
  TfrmComprasRegistroSaidas = class(TForm)
    ImageList2: TImageList;
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
    dsRegistraSaida: TDataSource;
    Timer1: TTimer;
    PageControl1: TPageControl;
    tbProdutos: TTabSheet;
    tbKits: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    edNomeProduto: TEdit;
    edPrecoUnitario: TUMEditMonetario;
    edQuantidade: TDBEdit;
    edValorTotal: TUMEditMonetario;
    DBEdit5: TDBEdit;
    edQtdAtualEstoque: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edQuantkit: TEdit;
    edNomeKit: TEdit;
    edPrecoUnitarioKit: TUMEditMonetario;
    edValorTotalKit: TUMEditMonetario;
    Panel4: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    btnIncluirKit: TToolButton;
    ToolButton6: TToolButton;
    btnsalvarKit: TToolButton;
    btnCancelarKit: TToolButton;
    ToolButton9: TToolButton;
    btnFecharKit: TToolButton;
    edQuantidadeKit: TEdit;
    qyRegistraSaidaKits: TUMZQuery;
    qyRegistraSaidaKitsCD_COMPRA: TIntegerField;
    qyRegistraSaidaKitsCD_PRODUTO: TStringField;
    qyRegistraSaidaKitsCD_MENSALIDADE: TIntegerField;
    qyRegistraSaidaKitsTP_ENTRADA_SAIDA: TSmallintField;
    qyRegistraSaidaKitsCD_PESSOA: TIntegerField;
    qyRegistraSaidaKitsTP_PESSOA: TSmallintField;
    qyRegistraSaidaKitsNR_QUANTIDADE: TIntegerField;
    qyRegistraSaidaKitsDT_COMPRA: TDateTimeField;
    qyRegistraSaidaKitsDT_ENTRADA: TDateTimeField;
    qyRegistraSaidaKitsVL_COMPRA: TFloatField;
    ToolButton12: TToolButton;
    pnSelecionaEntrada: TPanel;
    rgTipoEntrada: TRadioGroup;
    pnCod: TPanel;
    Label16: TLabel;
    SpeedButton7: TSpeedButton;
    PnCodBarra: TPanel;
    Label17: TLabel;
    SpeedButton8: TSpeedButton;
    edCodigoProduto: TDBEdit;
    edCodBarras: TEdit;
    Panel5: TPanel;
    rgTipoEntradaKit: TRadioGroup;
    pnCodKit: TPanel;
    Label8: TLabel;
    pnCodBarraKit: TPanel;
    Label18: TLabel;
    edCodkIT: TEdit;
    SpeedButton4: TSpeedButton;
    edCodBarraKit: TEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qyRegistraSaidaKitsCD_KIT: TIntegerField;
    Panel6: TPanel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit2: TDBEdit;
    edNomeComprador: TEdit;
    Panel7: TPanel;
    edCdPessoa: TEdit;
    Label2: TLabel;
    edNmPessoa: TEdit;
    SpeedButton3: TSpeedButton;
    msgSemPermKit: TLabel;
    msgSemPermPro: TLabel;
    procedure PageControl1Change(Sender: TObject);
    procedure rgTipoEntradaKitClick(Sender: TObject);
    procedure rgTipoEntradaClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure edCdPessoaChange(Sender: TObject);
    procedure btnsalvarKitClick(Sender: TObject);
    procedure btnFecharKitClick(Sender: TObject);
    procedure btnCancelarKitClick(Sender: TObject);
    procedure edCdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure edCdPessoaExit(Sender: TObject);
    procedure edCodkITKeyPress(Sender: TObject; var Key: Char);
    procedure edQuantidadeKitChange(Sender: TObject);
    procedure edCodBarraKitExit(Sender: TObject);
    procedure edCodBarraKitKeyPress(Sender: TObject; var Key: Char);
    procedure edCodkITExit(Sender: TObject);
    procedure edCodkITEnter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure edCodBarrasExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyRegistraSaidaBeforeInert(DataSet: TDataSet);
    procedure DBEdit2Exit(Sender: TObject);
    procedure qyRegistraSaidaAfterPost(DataSet: TDataSet);
    procedure edCodigoProdutoEnter(Sender: TObject);
    procedure edQuantidadeChange(Sender: TObject);
    procedure dsRegistraSaidaStateChange(Sender: TObject);
    procedure edCodigoProdutoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyRegistraSaidaBeforePost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
    sn_imprimir : Boolean;
    tipoSaida: Integer;
    tipoPessoa : Integer;


    function GetVlUnitario( cd_produto: String ): Double;
    

    function LastInsertId(): Integer;

    { Condicoes de Campos }
    procedure SomenteNumeros(Sender: TObject; var Key: Char);
    procedure filtraProduto();
    procedure filtraKit();
    procedure filtraKitAoSairDoCampo( isCodBarra: Boolean);
    procedure filtraAoSairDoCampo( isCodBarra: Boolean);
    procedure podeRetirar(const cd_pessoa : Integer; const tipo : integer);
    function financeiroPendente(cd_pessoa : Integer): Boolean;
    function validaTurmaRetirada(isKit: Boolean): Boolean;
    function excedeuNumeroMaxRetirada(isKit : Boolean; quantidade : Integer): Boolean;
    function setaValorKit() : string;
    function verificaExcedenteKit() : Boolean;
    
  public
    { Public declarations }
    cd_produto_carregado: String;
    cd_pessoa_carregado: Integer;

    procedure AbreQueryRegistraEstoque();

  end;

var
  frmComprasRegistroSaidas: TfrmComprasRegistroSaidas;

implementation

uses uFComprasBuscaProdutos, uDM, General, uFComprasBuscaKits ,
  ClassComprasEntradaSaida, ClassPessoas, uUsuario, uFSelecionarPessoa, uFComprasControleEstoque,Main;

{$R *.dfm}

procedure TfrmComprasRegistroSaidas.AbreQueryRegistraEstoque;
const
   SQL_REGISTRA_ESTOQUE =
      ' SELECT * FROM comp_estoque WHERE 1=0 ';
begin
   qyRegistraSaida.Close();
   qyRegistraSaida.SQL.Text := SQL_REGISTRA_ESTOQUE;
   qyRegistraSaida.Open();
end;

procedure TfrmComprasRegistroSaidas.btnCancelarClick(Sender: TObject);
begin
   qyRegistraSaida.Cancel();
   edCodBarras.Text := '';

   if cd_pessoa_carregado > 0 then
   begin
      btnIncluirClick( nil );
      DBEdit2.Text := IntToStr(cd_pessoa_carregado);
      qyRegistraSaidacd_pessoa.AsInteger := cd_pessoa_carregado;
      edNomeProduto.SetFocus;
      if (msgSemPermPro.Visible) then
      begin
         btnSalvar.Enabled := false;
      end;
   end else begin
      msgSemPermPro.Visible := false;
   end;
end;

procedure TfrmComprasRegistroSaidas.btnIncluirClick(Sender: TObject);
begin
   if not ( qyRegistraSaida.State IN [dsInsert] ) then
      qyRegistraSaida.Insert();
end;


procedure TfrmComprasRegistroSaidas.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasRegistroSaidas.btnSalvarClick(Sender: TObject);
var
   cd_ultima_compra : Integer;
   possuiTurma: Boolean;
   isPendente:Boolean;
   excedeuNrMax:Boolean;
begin
   edNomeProduto.SetFocus;
   edQuantidade.SetFocus;

   if qyRegistraSaidacd_pessoa.IsNull then
   begin
      Mensagem( 'Informe uma Pessoa.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      DBEdit2.SetFocus;
      Exit;
   end;

   if qyRegistraSaidacd_produto.IsNull then
   begin
      Mensagem( 'Informe um Produto.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edNomeProduto.SetFocus;
      Exit;
   end;

   if not ( qyRegistraSaidanr_quantidade.AsInteger >= 1 ) then
   begin
      Mensagem( 'Informe uma quantia válida.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edQuantidade.SetFocus;
      Exit;
   end;

   possuiTurma := (validaTurmaRetirada(false));
   isPendente := financeiroPendente(qyRegistraSaidacd_pessoa.AsInteger);
   excedeuNrMax := excedeuNumeroMaxRetirada(false, qyRegistraSaidanr_quantidade.AsInteger);
   if ((possuiTurma) and (isPendente) and (excedeuNrMax)) then
   begin
      try
         try
            qyRegistraSaida.Post();
            cd_ultima_compra := LastInsertId();

            // ATENÇÃO: A Programação continua no Evento AfterPost do componente qyRegistraSaida,
            //          onde é acumulado os valores, ou gerada a mensalidade

            if sn_imprimir AND
               (Mensagem('Deseja imprimir o cupom?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = mrYes) then
               ClasseComprasEntradaSaida.ImprimirCupomDOS( cd_ultima_compra );
         finally
            AbreQueryRegistraEstoque();

            if ( cd_pessoa_carregado > 0 ) then
            begin
               btnIncluirClick( nil );
               DBEdit2.Text := IntToStr(cd_pessoa_carregado);
               qyRegistraSaidacd_pessoa.AsInteger := cd_pessoa_carregado;
               edNomeProduto.SetFocus();
            end else begin
               DBEdit2.SetFocus();
            end;
         end;
         Mensagem('Saída efetuada com Sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
         edCodBarras.Text := '';
      except
         Mensagem( 'Erro ao registrar a saída, verifique se os campos foram preenchidos com informações válidas.', Application.Title, MB_OK + MB_ICONERROR, Handle );
      end;
      exit;
   end;
   
   if not (possuiTurma) then
   begin
      Mensagem('Não sera possivel efetuar a retirada deste produto pois a pessoa ' + edNomeComprador.Text + ' não faz parte de nenhuma das turmas permitidas neste produto.');
   end;

   if not (isPendente) then
   begin
      btnCancelarClick(nil);
   end;

end;

procedure TfrmComprasRegistroSaidas.DBEdit2Exit(Sender: TObject);
begin
   if ( DBEdit2.Text <> IntToStr( cd_pessoa_carregado ) ) then
      cd_pessoa_carregado := 0;

   if ( DBEdit2.Text <> '' ) then
   begin
      edNomeComprador.Text := ClassePessoas.GetNome( StrToInt( DBEdit2.Text ) );
      qyRegistraSaidatp_pessoa.AsInteger := 1;

      if ( Trim(edNomeComprador.Text) = '' ) then
      begin
         Mensagem( 'Código inexistente.' );
         DBEdit2.SetFocus();
         DBEdit2.SelectAll();
      end;
      podeRetirar(qyRegistraSaidacd_pessoa.AsInteger,1);
   end else begin
      edNomeComprador.Text := '';
   end;
end;

procedure TfrmComprasRegistroSaidas.edCodkITEnter(Sender: TObject);
begin
    edCodkIT.SelectAll();
end;

procedure TfrmComprasRegistroSaidas.edCodkITExit(Sender: TObject);
begin
   if (Trim(edCodkIT.Text) = '') then
   begin
      edCodkIT.Text := '';
      Exit;
   end;

   filtraKitAoSairDoCampo(false);
end;

procedure TfrmComprasRegistroSaidas.edCodkITKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodkITExit(nil);
   end;
end;

procedure TfrmComprasRegistroSaidas.edCdPessoaChange(Sender: TObject);
begin
   btnIncluirKit.Enabled := false;
   btnsalvarKit.Enabled := true;
   btnCancelarKit.Enabled := true;
   btnFecharKit.Enabled := false;
end;

procedure TfrmComprasRegistroSaidas.edCdPessoaExit(Sender: TObject);
begin
   if ( edCdPessoa.Text <> '' ) then
   begin
      edNmPessoa.Text := ClassePessoas.GetNome( StrToInt( edCdPessoa.Text ) );
      tipoPessoa := 1;
      if ( Trim(edNmPessoa.Text) = '' ) then
      begin
         Mensagem( 'Código inexistente.' );
         edNmPessoa.SetFocus();
         edNmPessoa.SelectAll();
      end;
      if(pnCodKit.Visible) then
      begin
         edCodkIT.SetFocus;
      end
      else
      begin
         edCodBarraKit.SetFocus;
      end;

      podeRetirar(strtoint(edCdPessoa.Text),2);
   end else begin
      edNmPessoa.Text := '';
   end;
end;

procedure TfrmComprasRegistroSaidas.edCdPessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCdPessoaExit(nil);
   end;
end;

procedure TfrmComprasRegistroSaidas.edCodBarraKitExit(Sender: TObject);
begin
   if (Trim(edCodBarraKit.Text) = '') then
   begin
      Exit;
   end;

   filtraKitAoSairDoCampo(true);
   edQuantidadeKit.SetFocus;
end;

procedure TfrmComprasRegistroSaidas.edCodBarraKitKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodBarraKitExit(nil);
   end;
end;

procedure TfrmComprasRegistroSaidas.edCodBarrasExit(Sender: TObject);
begin
   if (Trim(edCodBarras.Text) = '') then
   begin
      Exit;
   end;

   filtraAoSairDoCampo(true);

   edQuantidade.SetFocus;

end;

procedure TfrmComprasRegistroSaidas.edCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodBarrasExit(nil);
   end;

   
end;

procedure TfrmComprasRegistroSaidas.edCodigoProdutoEnter(Sender: TObject);
begin
   edCodigoProduto.SelectAll();
end;

procedure TfrmComprasRegistroSaidas.edCodigoProdutoExit(Sender: TObject);
begin
   if (Trim(qyRegistraSaidacd_produto.AsString) = '') then
   begin
      edNomeProduto.Text := '';
      Exit;
   end;

   filtraAoSairDoCampo(false);
end;

procedure TfrmComprasRegistroSaidas.dsRegistraSaidaStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not( qyRegistraSaida.State IN [dsInsert] );

   btnCancelar.Enabled := qyRegistraSaida.State IN [dsInsert];
   btnSalvar.Enabled := qyRegistraSaida.State IN [dsInsert];

   if not ( qyRegistraSaida.State IN [ dsInsert ] ) then
   begin
      if not ( cd_pessoa_carregado > 0 ) then
         edNomeComprador.Text := '';
      
      edNomeProduto.Text := '';
      edQtdAtualEstoque.Text := '';
      edPrecoUnitario.setValorDouble('0.00');
      edValorTotal.setValorDouble('0.00');
   end;
end;

procedure TfrmComprasRegistroSaidas.edQuantidadeChange(Sender: TObject);
var
   nr_quantidade: Integer;
begin
   if not ( qyRegistraSaida.State IN [ dsInsert ] ) then Exit;
   

   edQuantidade.OnChange := nil;

   qyRegistraSaidanr_quantidade.AsString := IntToStr(StrToIntDef(edQuantidade.Text, 1));

   try
      if ( qyRegistraSaidanr_quantidade.AsInteger <= 0 ) then
         nr_quantidade := 1
      else
         nr_quantidade := StrToInt(edQuantidade.Text);

      if ( edQtdAtualEstoque.Text = '' ) then
      begin
         Mensagem( 'Você precisa selecionar um produto.' );
         qyRegistraSaidanr_quantidade.AsInteger := 0;
         edNomeProduto.SetFocus();
         edQuantidade.OnChange := edQuantidadeChange;
         Exit;
      end;

      if ( nr_quantidade > 0 ) then
      begin
         if nr_quantidade > StrToInt( edQtdAtualEstoque.Text ) then
         begin
            qyRegistraSaidanr_quantidade.AsInteger := 1;
            edQuantidade.SelectAll;
            Mensagem(
               'Você não pode ultrapassar o limite de estoque do produto.',
               Application.Title, MB_OK + MB_ICONWARNING, Handle);
            edValorTotal.setValorDouble( FloatToStr( edPrecoUnitario.getValorDouble * 1 ) );

            { Temos que voltar a ação padrão do Click }
            edQuantidade.OnChange := edQuantidadeChange;

            Exit;
         end;
      end else begin
         qyRegistraSaidanr_quantidade.AsInteger := 1;
         edQuantidade.SelectAll;
      end;

      edValorTotal.setValorDouble( FloatToStr( edPrecoUnitario.getValorDouble * nr_quantidade ) );

      { Temos que voltar a ação padrão do Click }
      edQuantidade.OnChange := edQuantidadeChange;
   except
      { Temos que voltar a ação padrão do Click }
      edQuantidade.OnChange := edQuantidadeChange;
   end;
end;

procedure TfrmComprasRegistroSaidas.edQuantidadeKitChange(Sender: TObject);
var
   nr_quantidade: Integer;
begin

   if ( edQuantkit.Text = '' ) then
   begin
      Mensagem( 'Você precisa selecionar um kit.' );
      edCodkIT.SetFocus();
      Exit;
   end;


   if (( StrToInt(edQuantkit.Text) = 0 ) and (not btnIncluirKit.Enabled))then
   begin
      Mensagem( 'Este kit não esta disponivel para retirada.' );
      btnsalvarKit.Enabled := false;
      Exit;
   end
   else
   begin
      btnsalvarKit.Enabled := true;
   end;

   if (edQuantidadeKit.Text = '') then
   begin
      edQuantidadeKit.Text := '1';
   end;

   if (StrToInt( edQuantidadeKit.Text ) > StrToInt( edQuantkit.Text )) then
   begin
      edQuantidadeKit.Text := '1' ;
      edQuantidadeKit.SelectAll;
      Mensagem(
         'Você não pode ultrapassar o limite de estoque do kit.',
         Application.Title, MB_OK + MB_ICONWARNING, Handle);

      edValorTotalKit.setValorDouble( FloatToStr( edPrecoUnitarioKit.getValorDouble * 1 ) );

      Exit;
   end;

   edValorTotalKit.setValorDouble( FloatToStr( edPrecoUnitarioKit.getValorDouble * strToInt(edQuantidadeKit.Text) ) );

end;

function TfrmComprasRegistroSaidas.excedeuNumeroMaxRetirada(isKit : Boolean; quantidade : Integer): Boolean;
const
   SQL_VERIFICA_EXCEDENTE =
      'SELECT cp.DS_PRODUTO as produto, cp.NR_LIMITE, sum(ce.nr_quantidade) as quant, '+
      ' MIN(ce.DT_COMPRA) as dt_compra ,(cp.NR_LIMITE < SUM(ce.nr_quantidade)) as soma '+
      'FROM comp_estoque ce '+
      'INNER JOIN comp_produtos cp on (ce.cd_produto = cp.cd_produto) '+
      'WHERE ce.tp_entrada_saida = 2 and ce.cd_produto = :CD_PRODUTO  AND ce.CD_PESSOA = :CD_PESSOA '+
      'GROUP BY ce.cd_produto';
   MsgExcedeuLimite =
      'Este aluno já excedeu de retiradas para o produto ';
   MsgExcederaLimite =
      'Esta retirada ira exceder o limite para o aluno do produto ';
   MsgControleEstoque =
      '. Deseja efetuar a devolução do mesmo? ';
   MsqEfetuarRetirada =
      '. Deseja efetuar a retirada mesmo assim? ';
   MsgNrRetiradas =
      '. Este produto tem limite de retirada(s) ';
var
   qyVerifica : TUMZQuery;
   codPessoa,codProduto : String;
   respMsg : Boolean;
begin
   dm.CriarConsulta(qyVerifica);
   qyVerifica.SQL.Add(SQL_VERIFICA_EXCEDENTE);
   if (isKit) then
   begin
      codPessoa := edCdPessoa.Text;
      codProduto := qyRegistraSaidaKitsCD_PRODUTO.AsString;
   end
   else
   begin
      codPessoa := qyRegistraSaidacd_pessoa.AsString;
      codProduto := qyRegistraSaidacd_produto.AsString;
   end;
   
   qyVerifica.ParamByName('CD_PRODUTO').AsString := codProduto;
   qyVerifica.ParamByName('CD_PESSOA').AsString := codPessoa;
   qyVerifica.Open;

   result := true;
   if (DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Saidas.Retirar.Limite', npEspecial, false )) then
   begin
      if (((qyVerifica.FieldByName('soma').AsInteger > 0) or
      ((qyVerifica.FieldByName('quant').AsInteger + quantidade) > qyVerifica.FieldByName('nr_limite').AsInteger)) and
      (qyVerifica.FieldByName('nr_limite').AsString <> ''))  then
      begin
         result := false;
         if(qyVerifica.FieldByName('soma').AsInteger > 0) then
            respMsg := (Mensagem(MsgExcedeuLimite + qyVerifica.FieldByName('produto').asString + MsqEfetuarRetirada , Application.Title, MB_YESNO, Handle)  = mrYes)
         else
         begin
            if(qyVerifica.FieldByName('quant').AsInteger > 0) then
            begin
               respMsg := (Mensagem(MsgExcederaLimite + qyVerifica.FieldByName('produto').asString + MsqEfetuarRetirada , Application.Title, MB_YESNO, Handle)  = mrYes);
            end
            else
               respMsg := (Mensagem(MsgExcederaLimite + qyVerifica.FieldByName('produto').asString + MsgNrRetiradas + qyVerifica.FieldByName('NR_LIMITE').asstring + MsqEfetuarRetirada , Application.Title,MB_YESNO, Handle)  = mrYes);
         end;
         result := respMsg;
      end;
   end
   else
   begin
   if (((qyVerifica.FieldByName('soma').AsInteger > 0) or
      ((qyVerifica.FieldByName('quant').AsInteger + quantidade) > qyVerifica.FieldByName('nr_limite').AsInteger)) and
      (qyVerifica.FieldByName('nr_limite').AsString <> ''))  then
      begin
         if (qyVerifica.FieldByName('quant').AsInteger = 0)  then
         begin
            Mensagem(MsgExcederaLimite + qyVerifica.FieldByName('produto').asString + MsgNrRetiradas + qyVerifica.FieldByName('NR_LIMITE').asString , Application.Title, MB_OK, Handle);
         end
         else
         begin
            if (qyVerifica.FieldByName('soma').AsInteger > 0) then
               respMsg := (Mensagem(MsgExcedeuLimite + qyVerifica.FieldByName('produto').asString + MsgControleEstoque , Application.Title, MB_YESNO, Handle)  = mrYes)
            else
               respMsg := (Mensagem(MsgExcederaLimite + qyVerifica.FieldByName('produto').asString + MsgControleEstoque , Application.Title, MB_YESNO, Handle)  = mrYes);
         end;

         { Direciona para o controle de esoque e fecha esta tela}
         if (respMsg) then
         begin
            if not PrincipalForm.ProcuraForm(frmComprasControleEstoque) then
                  Application.CreateForm(TfrmComprasControleEstoque, frmComprasControleEstoque);

            frmComprasControleEstoque.rbPesquisaPorKit.Checked := true;
            if (isKit) then
            begin
               frmComprasControleEstoque.edCodigo.Text := qyRegistraSaidaKitsCD_KIT.AsString;
               frmComprasControleEstoque.edNome.Text := qyRegistraSaidaKitsCD_PESSOA.AsString;
               frmComprasControleEstoque.rbPesquisaPorProduto.Checked := false;
            end
            else
            begin
               frmComprasControleEstoque.edCodigo.Text := codProduto;
               frmComprasControleEstoque.rbPesquisaPorProduto.Checked := true;
               frmComprasControleEstoque.edNome.Text := qyRegistraSaidacd_pessoa.AsString;
            end;

            frmComprasControleEstoque.dtpDataInicial.DateTime := qyVerifica.FieldByName('dt_compra').AsDateTime;
            frmComprasControleEstoque.Filtrar();
            frmComprasControleEstoque.Show();

            if (iskit) then
              frmComprasRegistroSaidas.qyRegistraSaidaKits.Cancel
            else
              frmComprasRegistroSaidas.qyRegistraSaida.Cancel;

            frmComprasRegistroSaidas.Close;
         end;

         result := false;
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.filtraAoSairDoCampo(isCodBarra : Boolean);
begin
   if (frmComprasBuscaProdutos = nil) then
   begin
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);
   end;

   if (isCodBarra) then
   begin
      frmComprasBuscaProdutos.Filtrar( '', True , edCodBarras.Text );
   end
   else
   begin
      frmComprasBuscaProdutos.Filtrar( qyRegistraSaidacd_produto.AsString, True );
   end;

   edNomeProduto.Text := '';
   edQtdAtualEstoque.Text := '';
   edPrecoUnitario.setValorDouble('0.00');
   edValorTotal.setValorDouble('0.00');

   if frmComprasBuscaProdutos.qyListaProdutos.RecordCount <> 1 then
   begin
      Mensagem( 'Código inexistente.' );
      Exit;
   end else if frmComprasBuscaProdutos.qyListaProdutosQTD_PRODUTOS.AsInteger <= 0 then
   begin
      qyRegistraSaidacd_produto.AsString := '';
      edCodBarras.Text := '';
      Mensagem( 'O produto selecionado não possui estoque, você não poderá selecioná-lo.',
                              Application.Title, MB_OK + MB_ICONWARNING, Handle );
      Exit;
   end;

   filtraProduto;
end;

procedure TfrmComprasRegistroSaidas.filtraKit;
begin

   edCodkIT.Text := frmComprasBuscaKits.qyKitscd_kit.AsString;

   edNomeKit.Text := frmComprasBuscaKits.qyKitsnm_kit.AsString;

   edQuantkit.Text := inttostr(frmComprasBuscaKits.getnrMaxKits);

   edPrecoUnitarioKit.setValorDouble( setaValorKit );

   edCodkIT.Text := frmComprasBuscaKits.qyKitscd_kit.AsString;

   edCodBarraKit.Text := frmComprasBuscaKits.qyKitscd_coidigo_barras.AsString;

   edQuantidadeKitChange(nil);
end;

procedure TfrmComprasRegistroSaidas.filtraKitAoSairDoCampo(isCodBarra: Boolean);
begin
   if (frmComprasBuscaKits = nil) then
   begin
      Application.CreateForm(tfrmComprasBuscaKits, frmComprasBuscaKits);
   end;

   if (isCodBarra) then
   begin
      frmComprasBuscaKits.Filtrar( '', edCodBarraKit.Text );
   end
   else
   begin
      frmComprasBuscaKits.Filtrar( edCodkIT.Text, '' );
   end;

   edNomeKit.Text := '';
   edQuantkit.Text := '';
   edPrecoUnitarioKit.setValorDouble('0.00');
   edValorTotalKit.setValorDouble('0.00');
   
   if (frmComprasBuscaKits.qyKits.RecordCount = 0) then
   begin
      Mensagem( 'Código inexistente.' );
      edNomeKit.SetFocus();
      edCodkIT.SelectAll();
      Exit;
   end
   else if not (frmComprasBuscaKits.isQuanEstoque) then
   begin
      edCodkIT.Text := '';
      edCodBarraKit.Text := '';
      Mensagem( 'O kit selecionado não possui produtos suficientes em estoque. ',
                              Application.Title, MB_OK + MB_ICONWARNING, Handle );
      edCodkIT.SetFocus();
      edCodkIT.SelectAll();
      Exit;
   end;

   filtraKit;
end;

procedure TfrmComprasRegistroSaidas.filtraProduto;
begin
   btnIncluirClick( nil );

   qyRegistraSaidacd_produto.AsString := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;

   edNomeProduto.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;

   edQtdAtualEstoque.Text := frmComprasBuscaProdutos.qyListaProdutosQTD_PRODUTOS.AsString;
   edPrecoUnitario.setValorDouble( FloatToStr( GetVlUnitario( qyRegistraSaidacd_produto.AsString ) ) );

   sn_imprimir := (frmComprasBuscaProdutos.qyListaProdutosSN_IMPRIMIR_CUPOM.AsInteger = 1) AND
                  (edPrecoUnitario.getValorDouble = 0);

   edCodBarras.Text := frmComprasBuscaProdutos.qyListaProdutoscodBarras.AsString;

   edQuantidade.OnChange(nil);
end;

function TfrmComprasRegistroSaidas.financeiroPendente(cd_pessoa : Integer): Boolean;
const
   SQL_PENDENCIAS =
      'SELECT '+
         'COUNT(*) AS RESULTADO '+
      'FROM '+
         'MENSALIDADES M '+
            'LEFT JOIN PESSOAS P ON '+
               '(M.CD_RESP = P.CD_PESSOA) AND '+
               '(P.SN_NAO_BLOQUEAR_FINANCEIRO = 1) '+
      'WHERE '+
         'P.CD_PESSOA IS NULL AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         '%s';

   SQL_FILTRO_FIXO = 'M.SITUACAO IN (2, 10) AND M.DATAVENCIMENTO <= :DT_VENCTO';
var
   LSFiltro: string;
   qyPendFinanceiro : TUMZQuery;
begin
   dm.CriarConsulta(qyPendFinanceiro);
   LSFiltro := SQL_FILTRO_FIXO;
   
   qyPendFinanceiro.Close;
   qyPendFinanceiro.SQL.Text := Format(SQL_PENDENCIAS, [LSFiltro]);
   qyPendFinanceiro.ParamByName('CD_ALUNO').AsInteger := cd_pessoa;
   if qyPendFinanceiro.Params.FindParam('DT_VENCTO') <> nil then
      qyPendFinanceiro.ParamByName('DT_VENCTO').AsDateTime := now;
   qyPendFinanceiro.Open;

   if (qyPendFinanceiro.FieldByName('RESULTADO').AsInteger > 0) then
   begin
      result := (MessageDlg('Este aluno possui pendências financeiras, deseja continuar o processo?', mtWarning, [mbYes, mbNo], -1) = mrYes);
   end;

end;

procedure TfrmComprasRegistroSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmComprasBuscaProdutos := nil;
   frmComprasBuscaKits := nil;
   cd_pessoa_carregado := 0;
   Action := caFree;
end;

procedure TfrmComprasRegistroSaidas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := not (qyRegistraSaida.State IN [dsInsert]);

   if not CanClose then
   begin
      CanClose := cd_pessoa_carregado > 0;

      if CanClose then
         qyRegistraSaida.Cancel;      
   end;

   if not CanClose then
   begin
      Mensagem( 'Você precisa Salvar ou Cancelar o registro de Saída.', Application.Title, MB_OK + MB_ICONINFORMATION, 0 );
   end;
end;

procedure TfrmComprasRegistroSaidas.FormCreate(Sender: TObject);
begin
   AbreQueryRegistraEstoque();
   cd_produto_carregado := '';
   cd_pessoa_carregado := 0;
   tipoSaida := 0;
   sn_imprimir := False;

   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );   

   if frmComprasBuscaKits = nil then
      Application.CreateForm( tfrmComprasBuscaKits, frmComprasBuscaKits );

   edQuantidade.OnKeyPress := SomenteNumeros;


   rgTipoEntrada.ItemIndex := strtoint(DM.variavel_parametro('saida_produtos_codigo_barras'));
   pnCod.Visible := true;
   PnCodBarra.Visible := false;
   if (rgTipoEntrada.ItemIndex = 1) then
   begin
      pnCod.Visible := false;
      PnCodBarra.Visible := true;
   end;

end;

procedure TfrmComprasRegistroSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            btnIncluirClick( nil )
         end else begin
            edCdPessoaChange( nil );
         end;
      VK_F5:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            if (not msgSemPermPro.Visible) then btnSalvarClick( nil );
         end else begin
            if (not msgSemPermKit.Visible) then btnsalvarKitClick( nil );
         end;
      VK_F6:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            btnCancelarClick( nil );
         end else begin
            btnCancelarKitClick( nil );
         end;
      VK_F12:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            btnSairClick( nil );
         end else begin
            btnFecharKitClick( nil );
         end;
      VK_RETURN: begin
         if (PageControl1.ActivePageIndex = 0) then
         begin
            if ( DBEdit2.Focused ) then
            begin
               if trim(DBEdit2.Text) = '' then
               begin
                  Mensagem( 'Informe uma Pessoa.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
               end else begin
                  DBEdit2Exit(nil);
                  if(pnCod.Visible) then
                  begin
                     edCodigoProduto.SetFocus;
                  end
                  else
                  begin
                     edCodBarras.SetFocus;
                  end;
               end;
            end
            else if ( edCodigoProduto.Focused ) then
            begin
               if trim(edCodigoProduto.Text) = '' then
               begin
                  Mensagem( 'Informe um Produto.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
               end else begin
                  edQuantidade.SetFocus;
               end;
            end
            else if ( edQuantidade.Focused ) then
            begin
               if trim(edQuantidade.Text) = '' then //not ( qyRegistraSaidanr_quantidade.AsInteger >= 1 )
               begin
                  Mensagem( 'Informe uma quantia válida.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
               end else begin
                  btnSalvarClick( nil );
               end;
            end;
         end;
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.FormShow(Sender: TObject);
begin
   if ( cd_produto_carregado <> '' ) OR ( cd_pessoa_carregado > 0 ) then
   begin
      btnIncluirClick(nil);

      if ( cd_pessoa_carregado > 0 ) then
      begin
         DBEdit2.SetFocus();
         DBEdit2.Text := IntToStr(cd_pessoa_carregado);
      end;      

      if ( cd_produto_carregado <> '' ) then
      begin
         edNomeProduto.SetFocus();
         edCodigoProduto.Text := cd_produto_carregado;
      end;

      edNomeProduto.SetFocus;

      cd_produto_carregado := '';
   end;
end;

function TfrmComprasRegistroSaidas.GetVlUnitario(cd_produto: String): Double;
const
   SQL_VL_UNITARIO =
      ' SELECT VL_PRODUTO ' +
      ' FROM COMP_PRODUTOS WHERE CD_PRODUTO = :CD_PRODUTO ';
var
   qyVlUnitario: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyVlUnitario);

   qyVlUnitario.Close();

   qyVlUnitario.SQL.Text := SQL_VL_UNITARIO;
   qyVlUnitario.ParamByName('CD_PRODUTO').AsString := cd_produto;

   qyVlUnitario.Open();

   Result := qyVlUnitario.FieldByName('VL_PRODUTO').AsFloat;

   FreeAndNil(qyVlUnitario);
end;

function TfrmComprasRegistroSaidas.LastInsertId: Integer;
const
   SQL_LAST_INSERT_ID = ' SELECT MAX(cd_compra) AS ultimo FROM comp_estoque ';
var
   qyLastInsertId: TUMZQuery;
begin
   DM.CriarConsulta(qyLastInsertId);
   qyLastInsertId.SQL.Text := SQL_LAST_INSERT_ID;
   qyLastInsertId.Open();

   Result := qyLastInsertId.FieldByName('ultimo').AsInteger;

   FreeAndNil(qyLastInsertId);
end;

procedure TfrmComprasRegistroSaidas.PageControl1Change(Sender: TObject);
begin
   if (PageControl1.ActivePage = tbKits) then
   begin
      rgTipoEntradaKit.ItemIndex := strtoint(DM.variavel_parametro('saida_produtos_codigo_barras'));
   end;
end;

procedure TfrmComprasRegistroSaidas.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := true;
   if (PageControl1.ActivePage = tbProdutos) then
   begin
      if (qyRegistraSaida.State in [dsEdit,dsInsert]) then
      begin
         AllowChange := false;
         exit;
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.podeRetirar(const cd_pessoa: Integer; const tipo : integer);
const
   SQL_PODE_RETIRAR =
      'SELECT sn_pode_retirar_material FROM pessoas WHERE cd_pessoa = :cd_pessoa';
var
   qyAux : TUMZQuery;
begin
   DM.CriarConsulta(qyAux);
   with qyAux do
   begin
      SQL.Add(SQL_PODE_RETIRAR);
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      Open;

      if (FieldByName('sn_pode_retirar_material').AsInteger = 1) then
      begin
         if (tipo = 1) then
         begin
            msgSemPermPro.Visible := true;
            btnSalvar.Enabled := false;
         end else begin
            msgSemPermKit.Visible := true;
            btnsalvarKit.Enabled := false;
         end;
      end;
   end;

   FreeAndNil(qyAux);
end;

procedure TfrmComprasRegistroSaidas.qyRegistraSaidaAfterPost(DataSet: TDataSet);
var
   cd_compra: Integer;
begin
   cd_compra := DM.LastInsert();

   ClasseComprasEntradaSaida.GerarTitulo(cd_compra);
end;

procedure TfrmComprasRegistroSaidas.qyRegistraSaidaBeforeInert(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Saidas', npIncluir, True ) then Abort();
end;

procedure TfrmComprasRegistroSaidas.qyRegistraSaidaBeforePost(
  DataSet: TDataSet);
begin
   qyRegistraSaidavl_compra.AsFloat := edValorTotal.getValorDouble();
   qyRegistraSaidatp_entrada_saida.AsInteger := 2;

   if ( qyRegistraSaidatp_pessoa.IsNull ) then
      qyRegistraSaidatp_pessoa.AsInteger := 0;
end;

procedure TfrmComprasRegistroSaidas.rgTipoEntradaClick(Sender: TObject);
begin
   if (rgTipoEntrada.ItemIndex = 1) then
   begin
      pnCod.Visible := false;
      PnCodBarra.Visible := true;
   end
   else
   begin
      pnCod.Visible := true;
      PnCodBarra.Visible := false;
   end;

   btnCancelarClick(nil);
end;

procedure TfrmComprasRegistroSaidas.rgTipoEntradaKitClick(Sender: TObject);
begin
   if (rgTipoEntradaKit.ItemIndex = 1) then
   begin
      pnCodKit.Visible := false;
      pnCodBarraKit.Visible := true;
   end
   else
   begin
      pnCodKit.Visible := true;
      pnCodBarraKit.Visible := false;
   end;
end;

function TfrmComprasRegistroSaidas.setaValorKit : String;
const
   SQL_BUSCA_VALOR =
      'SELECT sum((ck.nr_quantidade * cp.VL_PRODUTO)) as ValorKit ' +
      'FROM comp_kits_itens ck '+
      'LEFT JOIN comp_produtos cp on (cp.CD_PRODUTO = ck.cd_produto) ' +
      'where cd_kit = :cd_kit';
var
   qyValorKit : TUMZQuery;
begin
   dm.CriarConsulta(qyValorKit);
   qyValorKit.Close;
   qyValorKit.SQL.Add(SQL_BUSCA_VALOR);
   qyValorKit.ParamByName('cd_kit').AsString := frmComprasBuscaKits.qyKitscd_kit.AsString;
   qyValorKit.Open;
   result := qyValorKit.FieldByName('ValorKit').AsString;
   FreeAndNil(qyValorKit);
end;

procedure TfrmComprasRegistroSaidas.SomenteNumeros(Sender: TObject;
  var Key: Char);
begin
   if not ( Key IN ['0'..'9', Chr(8), Chr(9)] ) then Key := #0;
end;

procedure TfrmComprasRegistroSaidas.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   if ( DBEdit2.Text <> IntToStr( cd_pessoa_carregado ) ) then
      cd_pessoa_carregado := 0;

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   btnIncluirClick( nil );

   if not resultado.filtrado then
   begin
      qyRegistraSaidatp_pessoa.AsInteger := 0;
      qyRegistraSaidacd_pessoa.Clear();
      edNomeComprador.Text := '';
      Exit;
   end;

   qyRegistraSaidacd_pessoa.AsInteger := resultado.cd_pessoa;
   edNomeComprador.Text := resultado.nm_pessoa;

   if resultado.Aba = afpFornecedor then
   begin
      qyRegistraSaidatp_pessoa.AsInteger := 2;
   end else begin
      qyRegistraSaidatp_pessoa.AsInteger := 1;
   end;

   podeRetirar(qyRegistraSaidacd_pessoa.AsInteger, 1);
end;

procedure TfrmComprasRegistroSaidas.SpeedButton3Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.Aba = afpFornecedor then
   begin
      tipoPessoa := 2;
   end else begin
      tipoPessoa := 1;
   end;
   //btnIncluirClick( nil );

   if not resultado.filtrado then
   begin
      edNmPessoa.Text := '';
      Exit;
   end;

   edCdPessoa.Text := inttostr(resultado.cd_pessoa);
   edNmPessoa.Text := resultado.nm_pessoa;
   podeRetirar(strtoint(edCdPessoa.Text), 2);
end;

procedure TfrmComprasRegistroSaidas.SpeedButton4Click(Sender: TObject);
begin
   if ( frmComprasBuscaKits = nil ) then
   begin
      Application.CreateForm(tfrmComprasBuscaKits, frmComprasBuscaKits);
   end;

   frmComprasBuscaKits.ShowModal();
   if not frmComprasBuscaKits.flgSearch then
   begin
      Exit;
   end;

   filtraKit;

end;

procedure TfrmComprasRegistroSaidas.SpeedButton5Click(Sender: TObject);
begin
   if ( frmComprasBuscaProdutos = nil ) then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   frmComprasBuscaProdutos.PermitiSemEstoque := False;
   frmComprasBuscaProdutos.ShowModal();
   if not frmComprasBuscaProdutos.flgSearch then
   begin
      Exit;
   end;
   filtraProduto;

end;

procedure TfrmComprasRegistroSaidas.Timer1Timer(Sender: TObject);
begin
   if qyRegistraSaida.State IN [ dsInsert ] then
   begin
      qyRegistraSaidadt_entrada.AsDateTime := Now;
      qyRegistraSaidadt_compra.AsDateTime := Now;
   end;
end;

function TfrmComprasRegistroSaidas.validaTurmaRetirada(isKit: Boolean): Boolean;
const
   SQL_VERIFICA_TURMA =
      'SELECT COUNT(f.codigoaluno) as cont, ck.cd_turma as turma '+
      'FROM comp_kits_turmas CK '+
      'INNER JOIN turmas T on (T.codigo = CK.cd_turma and T.anosemestre = ck.cd_anosemestre) '+
      'INNER JOIN fichaindividual F on (f.turma = T.codigo and f.anosemestre = t.anosemestre) '+
      'WHERE f.situacao = 1 '+
      'AND F.codigoaluno = :cd_aluno '+
      'AND ck.cd_kit = :cod ' +
      'GROUP BY codigoaluno ';
   SQL_VERIFICA_POSSUI_KIT =
      'SELECT count(*) as valor from comp_kits_turmas where cd_kit = :cod';
   SQL_VERIFICA_TURMA_PRODUTO =
      'SELECT COUNT(f.codigoaluno) as cont, ck.cd_turma as turma '+
      'FROM  comp_produtos_turmas CK '+
      'INNER JOIN turmas T on (T.codigo = CK.cd_turma and T.anosemestre = ck.cd_anosemestre) '+
      'INNER JOIN fichaindividual F on (f.turma = T.codigo and f.anosemestre = t.anosemestre) '+
      'WHERE f.situacao = 1 '+
      'AND F.codigoaluno = :cd_aluno '+
      'AND ck.cd_produto = :cod ' +
      'GROUP BY codigoaluno ';
   SQL_VERIFICA_POSSUI_PRODUTO =
      'SELECT count(*) as valor from comp_produtos_turmas where cd_produto = :cod';
var
   qyVerificaTurma: TUMZQuery;
   codTipo,codPessoa : String;
begin

   dm.CriarConsulta(qyVerificaTurma);
   if (isKit) then
   begin
      qyVerificaTurma.SQL.Add(SQL_VERIFICA_POSSUI_KIT);
      codTipo := edCodkIT.Text;
      codPessoa := edCdPessoa.Text;
   end
   else
   begin
      qyVerificaTurma.SQL.Add(SQL_VERIFICA_POSSUI_PRODUTO);
      codTipo := qyRegistraSaidacd_produto.AsString;
      codPessoa := qyRegistraSaidacd_pessoa.AsString;
   end;
   
   qyVerificaTurma.ParamByName('cod').AsString := codTipo;
   qyVerificaTurma.Open;

   { Se o kit/produto não possui turmas cadastradas }
   if (qyVerificaTurma.FieldByName('valor').AsInteger = 0) then
   begin
      result := true;
      exit;
   end;

   qyVerificaTurma.Close;
   qyVerificaTurma.SQL.Clear;
   if (isKit) then
   begin
      qyVerificaTurma.SQL.Add(SQL_VERIFICA_TURMA);
   end
   else
   begin
     qyVerificaTurma.SQL.Add(SQL_VERIFICA_TURMA_PRODUTO);
   end;
   qyVerificaTurma.ParamByName('cd_aluno').AsString := codPessoa;
   qyVerificaTurma.ParamByName('cod').AsString := codTipo;
   qyVerificaTurma.Open;

   { Se a pessoa esta cursando uma das turmas }
   if (qyVerificaTurma.FieldByName('cont').AsInteger > 0 ) then
   begin
      result := true;
      exit;
   end;


   result := false;
end;

function TfrmComprasRegistroSaidas.verificaExcedenteKit: Boolean;
const
    SQL_BUSCA_ITEM_KIT =
      'select ci.cd_produto, ci.nr_quantidade, (ci.nr_quantidade * cp.VL_PRODUTO) as valor from comp_kits_itens ci '+
      'LEFT JOIN comp_produtos cp on (cp.cd_produto = ci.cd_produto) where cd_kit = :cd_kit';
var
   qryKitsProdutos : TUMZQuery;
   nrMaxExcedido: Boolean;
begin
   dm.CriarConsulta(qryKitsProdutos);
   qryKitsProdutos.SQL.Add(SQL_BUSCA_ITEM_KIT);
   qryKitsProdutos.ParamByName('cd_kit').AsString := edCodkIT.Text;
   qryKitsProdutos.open;

   while not qryKitsProdutos.Eof do
   begin
      qyRegistraSaidaKits.Close;
      qyRegistraSaidaKits.Open;

      qyRegistraSaidaKits.Insert;

      qyRegistraSaidaKitscd_produto.AsString := qryKitsProdutos.FieldByName('cd_produto').AsString;
      qyRegistraSaidaKitscd_pessoa.AsString := edCdPessoa.Text;
      qyRegistraSaidaKitstp_pessoa.AsInteger := tipoPessoa;
      qyRegistraSaidaKitstp_entrada_saida.AsInteger := 2;
      qyRegistraSaidaKitsnr_quantidade.AsInteger := (qryKitsProdutos.FieldByName('nr_quantidade').AsInteger * StrToInt(edQuantidadekit.Text));
      qyRegistraSaidaKitsdt_entrada.AsDateTime := Now;
      qyRegistraSaidaKitsdt_compra.AsDateTime := Now;
      qyRegistraSaidaKitsvl_compra.AsFloat := (qryKitsProdutos.FieldByName('valor').AsFloat * StrToInt(edQuantidadekit.Text));
      qyRegistraSaidaKitsCD_KIT.AsString :=  edCodkIT.Text;

      { Se não excedeu o maximo de retiradas para cada produto }
      nrMaxExcedido := excedeuNumeroMaxRetirada(true, qyRegistraSaidaKitsnr_quantidade.AsInteger);
      if  not (nrMaxExcedido) then
      begin
         break;
      end;

      qryKitsProdutos.Next;
   end;
   result := (nrMaxExcedido);
end;

procedure TfrmComprasRegistroSaidas.btnFecharKitClick(Sender: TObject);
begin
   qyRegistraSaida.Close;
   close();
end;

procedure TfrmComprasRegistroSaidas.btnsalvarKitClick(Sender: TObject);
const
    SQL_BUSCA_ITEM_KIT =
      'select ci.cd_produto, ci.nr_quantidade, (ci.nr_quantidade * cp.VL_PRODUTO) as valor from comp_kits_itens ci '+
      'LEFT JOIN comp_produtos cp on (cp.cd_produto = ci.cd_produto) where cd_kit = :cd_kit';
var
   qryKitsProdutos : TUMZQuery;
   possuiTurma: Boolean;
   isPendente:Boolean;

   comprasEntradaSaida : TClasseComprasEntradaSaida;
begin
   if (edCdPessoa.Text = '') then
   begin
      Mensagem( 'Informe uma Pessoa.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edCdPessoa.SetFocus;
      Exit;
   end;

   if (edCodkIT.Text = '') then
   begin
      Mensagem( 'Informe um Kit.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edCodkIT.SetFocus;
      Exit;
   end;

   if ( strtoint(edQuantidadeKit.Text) < 1 ) then
   begin
      Mensagem( 'Informe uma quantia válida.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edQuantidade.SetFocus;
      Exit;
   end;

   possuiTurma := (validaTurmaRetirada(true));
   isPendente := financeiroPendente(StrToInt(edCdPessoa.text));
   if ((possuiTurma) and (isPendente) and (verificaExcedenteKit)) then
   begin
      dm.CriarConsulta(qryKitsProdutos);
      qryKitsProdutos.SQL.Add(SQL_BUSCA_ITEM_KIT);
      qryKitsProdutos.ParamByName('cd_kit').AsString := edCodkIT.Text;
      qryKitsProdutos.open;

      try
         while not qryKitsProdutos.Eof do
         begin
            qyRegistraSaidaKits.Close;
            qyRegistraSaidaKits.Open;
            qyRegistraSaidaKits.Insert;

            qyRegistraSaidaKitscd_produto.AsString := qryKitsProdutos.FieldByName('cd_produto').AsString;
            qyRegistraSaidaKitscd_pessoa.AsString := edCdPessoa.Text;
            qyRegistraSaidaKitstp_pessoa.AsInteger := tipoPessoa;
            qyRegistraSaidaKitstp_entrada_saida.AsInteger := 2;
            qyRegistraSaidaKitsnr_quantidade.AsInteger := (qryKitsProdutos.FieldByName('nr_quantidade').AsInteger * StrToInt(edQuantidadekit.Text));
            qyRegistraSaidaKitsdt_entrada.AsDateTime := Now;
            qyRegistraSaidaKitsdt_compra.AsDateTime := Now;
            qyRegistraSaidaKitsvl_compra.AsFloat := (qryKitsProdutos.FieldByName('valor').AsFloat * StrToInt(edQuantidadekit.Text));
            qyRegistraSaidaKitsCD_KIT.AsString :=  edCodkIT.Text;
            qyRegistraSaidaKits.Post;
            qryKitsProdutos.Next;

            comprasEntradaSaida.AdicionaAcumulado(
               qyRegistraSaidaKitsCD_COMPRA.AsInteger,
               qyRegistraSaidaKitscd_pessoa.AsInteger,
               qryKitsProdutos.ParamByName('cd_kit').AsInteger
            );
         end;

         comprasEntradaSaida.GerarTitulosAcumulados(
               strtoint(edCdPessoa.Text),
               '',
               qryKitsProdutos.ParamByName('cd_kit').AsInteger
         );

      except
         Mensagem('Não foi possivel efetuar a retirada deste kit.');
         exit;
      end;

      Mensagem('Kit retirado com sucesso.');
      btnCancelarKitClick(nil);
      exit;
   end;

   if not (possuiTurma) then
   begin
      Mensagem('Não sera possivel efetuar a retirada deste kit pois a pessoa ' + edNmPessoa.Text + ' não faz parte de nenhuma das turmas permitidas deste kit.');
   end;

   if not (isPendente) then
   begin
      btnCancelarKitClick(nil);
   end;

end;

procedure TfrmComprasRegistroSaidas.btnCancelarKitClick(Sender: TObject);
begin

   btnIncluirKit.Enabled := true;

   edCdPessoa.Text := '';
   edNmPessoa.Text := '';
   edCodkIT.Text := '';
   edNomeKit.Text := '';
   edCodBarraKit.Text := '';
   edPrecoUnitarioKit.Text := '0,00';
   edQuantidadeKit.Text := '';
   edValorTotalKit.Text := '';
   edQuantkit.Text := '0,00';

   FreeAndNil(frmComprasBuscaKits);
   Application.CreateForm( tfrmComprasBuscaKits, frmComprasBuscaKits );

   btnIncluirKit.Enabled := true;
   btnsalvarKit.Enabled := false;
   btnCancelarKit.Enabled := false;
   btnFecharKit.Enabled := true;
   msgSemPermKit.Visible := false;

   edCdPessoa.SetFocus;
end;

end.
