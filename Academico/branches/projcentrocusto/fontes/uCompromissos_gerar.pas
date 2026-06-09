unit uCompromissos_gerar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, uDM, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls,
  Grids, DBGrids, ComCtrls, Main, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset;

type

  TEstado = (Inserindo, Alterando);

  Tfrm_Compromisso_Gerar = class(TForm)
    qyCompromisso: TUMZQuery;
    pnTitulo: TPanel;
    qyCompromissocd_titulo: TLargeintField;
    qyCompromissocd_pessoa: TIntegerField;
    qyCompromissods_despesa: TStringField;
    qyCompromissonr_documento: TStringField;
    qyCompromissodt_emissao_nota: TDateTimeField;
    qyCompromissodt_lancamento: TDateTimeField;
    qyCompromissodt_competencia: TDateTimeField;
    qyCompromissodt_vencimento: TDateTimeField;
    qyCompromissodt_provavel_pgto: TDateTimeField;
    qyCompromissovl_despesa: TFloatField;
    qyCompromissocd_situacao: TSmallintField;
    qyCompromissosn_previsao: TStringField;
    qyCompromissocd_tipo_titulo: TSmallintField;
    qyCompromissotp_entrada_saida: TSmallintField;
    scrCompromisso: TDataSource;
    qyCompromissonr_parcela: TSmallintField;
    qyCompromissodescTipoTitulo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbFornecedor: TDBEdit;
    lbNomeFornecedor: TLabel;
    Bevel7: TBevel;
    Label3: TLabel;
    sbFornecedor: TSpeedButton;
    qyApropriacao: TUMZQuery;
    srcApropriacao: TDataSource;
    qyApropriacaocd_titulo: TIntegerField;
    qyApropriacaocd_conta: TIntegerField;
    qyApropriacaocd_centro: TIntegerField;
    qyApropriacaovl_movimento: TFloatField;
    qyPlano_Contas: TUMZQuery;
    qyCentro_Custos: TUMZQuery;
    qyApropriacaodescPlanoConta: TStringField;
    qyApropriacaodescCentroCusto: TStringField;
    Label4: TLabel;
    dbConta: TDBEdit;
    Label5: TLabel;
    dbDescConta: TDBLookupComboBox;
    Label6: TLabel;
    dbHistorico: TDBEdit;
    Label7: TLabel;
    dbTipoTitulo: TDBLookupComboBox;
    Label8: TLabel;
    dbDocumento: TDBEdit;
    Label9: TLabel;
    dbParcela: TDBEdit;
    Label10: TLabel;
    dbDataEmissao: TDBEdit;
    Label12: TLabel;
    dbDataCompetencia: TDBEdit;
    Label13: TLabel;
    dbDataVencimento: TDBEdit;
    Label14: TLabel;
    dbDataProvavel: TDBEdit;
    pgApropriacao: TPageControl;
    tsComApropriacao: TTabSheet;
    tsSemApropriacao: TTabSheet;
    grdApropria: TDBGrid;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    dbCodCentro: TDBEdit;
    Label20: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label21: TLabel;
    Label22: TLabel;
    dbValor: TDBEdit;
    dbPrevisao: TDBCheckBox;
    Bevel1: TBevel;
    btnAdicionar: TBitBtn;
    qyCompromissocd_coligada: TSmallintField;
    qyApropriacaocd_coligada: TSmallintField;
    Label11: TLabel;
    qyFormas: TUMZQuery;
    qyCompromissodescFormaPgto: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    qyCentro_Custoscd_centro: TLargeintField;
    qyCentro_Custosds_centro: TStringField;
    qyCentro_Custosds_observacao: TMemoField;
    qyCentro_Custoscd_classificacao: TStringField;
    qyCentro_Custostp_centro: TSmallintField;
    qyCentro_Custoscd_grupo: TLargeintField;
    qyCentro_Custoscd_coligada: TSmallintField;
    qyCentro_CustosdesClassificacaoDesc: TStringField;
    Label15: TLabel;
    cbApropria: TComboBox;
    sbAdicionarApropriacao: TSpeedButton;
    sbRemoverApropriacao: TSpeedButton;
    qyCompromissocd_caixa: TLargeintField;
    qyCompromissodescCaixa: TStringField;
    Label16: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    sbConta: TSpeedButton;
    qyContas: TUMZQuery;
    tsObservacao: TTabSheet;
    dbmObservacao: TDBMemo;
    qyCompromissods_observacao: TMemoField;
    qyMaxParcela: TUMZQuery;
    qyCompromissoCD_FORMA_PGTO: TLargeintField;
    qyCompromissoNR_CHEQUE: TLargeintField;
    qyCompromissoCD_TITULO_ORIGEM: TLargeintField;
    qyCompromissoCD_AUTORIZA: TLargeintField;
    qyCompromissoCD_TITULO_PRINCIPAL: TLargeintField;
    qyMaxParcelaPARCELA: TLargeintField;

    procedure sbContaClick(Sender: TObject);
    procedure dbDescContaEnter(Sender: TObject);
    procedure dbContaClick(Sender: TObject);
    procedure dbDescContaExit(Sender: TObject);
    procedure qyCompromissodt_competenciaChange(Sender: TField);
    procedure DBLookupComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure qyApropriacaoAfterPost(DataSet: TDataSet);
    procedure cbApropriaChange(Sender: TObject);
    procedure sbRemoverApropriacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyCentro_CustosCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure sbFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure qyCompromissoBeforePost(DataSet: TDataSet);
    procedure qyApropriacaoBeforePost(DataSet: TDataSet);
    procedure qyApropriacaoAfterInsert(DataSet: TDataSet);
    procedure sbAdicionarApropriacaoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qyCompromissoAfterOpen(DataSet: TDataSet);
    procedure dbFornecedorExit(Sender: TObject);
    procedure qyCompromissoAfterInsert(DataSet: TDataSet);
    procedure qyApropriacaoNewRecord(DataSet: TDataSet);
    procedure qyCompromissovl_despesaChange(Sender: TField);
    procedure qyCompromissodt_vencimentoChange(Sender: TField);
    procedure pgApropriacaoEnter(Sender: TObject);
    procedure qyCompromissoAfterPost(DataSet: TDataSet);
    procedure grdApropriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbTipoTituloExit(Sender: TObject);
    procedure dbDocumentoExit(Sender: TObject);
    procedure dbParcelaExit(Sender: TObject);
    procedure pgApropriacaoChange(Sender: TObject);
  private
    { Private declarations }

    iParcelaPrincipal : Integer;

    ListaApropria : Array of integer;

    bPrimeira : Boolean;

    iParcela : Integer;

    Function BuscaNome(cd_pessoa: integer): string;

    procedure filtra;

    Function RetornaCriterioApropria ( PlanoContas : Integer ) : Integer;

    Procedure AtualizaApropriacao(CdApropria : Integer);

    Procedure MontaCriteriosApropria;

    Procedure IncluirCamposPadroes;
  public
    { Public declarations }
    iTituloPai    : Integer;
    EhFatura      : Boolean;
    sLstCodFatura : String;
    tipoEstado    : TEstado;
    cd_coligada   : Integer;

  end;

var
  frm_Compromisso_Gerar: Tfrm_Compromisso_Gerar;
  ChaveAlteracao : String;

CONST
  COD_ACAO_PADRAO = 6; 

implementation

uses uClassMovimento, Math, uSelConta, uFSelecionarPessoa;

{$R *.dfm}

procedure Tfrm_Compromisso_Gerar.sbFornecedorClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
  // Pesquisar por fornecedor
  
  resultado := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

  if resultado.filtrado then
  begin
    qyCompromisso.FieldByName('cd_pessoa').AsInteger := resultado.cd_pessoa;
    lbNomeFornecedor.Caption := resultado.nm_pessoa;

    Filtra();
  end;
end;

procedure Tfrm_Compromisso_Gerar.FormShow(Sender: TObject);
begin
   // Ao abrir o formulário

   if not EhFatura then begin
     // Não está gerando uma fatura
     
      if tipoEstado = Inserindo then begin

         with DM.qyAux do begin
           // Excluir qq apropriação "PERDIDA" na base de dados
           Close();
           SQL.Text := ' DELETE from fin_apropria_cp where cd_titulo = :CdTitulo AND cd_coligada = :CdColigada ';
           ParamByName('CdTitulo').AsInteger := qyCompromissocd_titulo.AsInteger;
           ParamByName('CdColigada').AsInteger := qyCompromissocd_coligada.AsInteger;
           ExecSQL();
         end;

      end

   end;
   { Pegar o nome do Fornecedor }
   if qyCompromissocd_pessoa.AsInteger > 0 then Begin
       lbNomeFornecedor.Caption := BuscaNome(qyCompromisso.FieldByName('cd_pessoa').AsInteger);
   end;

   if qyApropriacao.RecordCount > 1 then
      pgApropriacao.ActivePage := tsComApropriacao
   else
      pgApropriacao.ActivePage := tsSemApropriacao;

   { Selecionando na base os tipos de título }
   DM.qyTiposTitulo.Close;
   DM.qyTiposTitulo.SQL.Clear;
   DM.qyTiposTitulo.SQL.Add('SELECT                      ');
   DM.qyTiposTitulo.SQL.Add('   *                        ');
   DM.qyTiposTitulo.SQL.Add('FROM                        ');
   DM.qyTiposTitulo.SQL.Add('   fin_config_tipos_titulo  ');
   DM.qyTiposTitulo.SQL.Add('WHERE                       ');
   DM.qyTiposTitulo.SQL.Add('   ct_tipo_titulo = 2       ');  // 2 = Contas a Pagar
   DM.qyTiposTitulo.SQL.Add(' AND cd_coligada_matriz = ' + IntToStr(DM.GetUsuarioLogado.GetColigadaLogada.Codigo) );
   DM.qyTiposTitulo.Open();

   {
   if not qyApropriacao.RequestLive then begin

      pgApropriacao.Enabled := False;
      sbAdicionarApropriacao.Enabled := False;
      sbRemoverApropriacao.Enabled := False;
      cbApropria.Enabled := False;

   end
   else begin

       MontaCriteriosApropria();

   end;
   }
   MontaCriteriosApropria();
   btnAdicionar.Visible := not EhFatura;
   Filtra();
end;

function Tfrm_Compromisso_Gerar.BuscaNome(cd_pessoa: integer): string;
Var
   qAux : TUMZQuery;
Begin
  // Pesquisar o nome do fornecedor
  DM.CriarConsulta(qAux);

  {qAux.Close();
  qAux.SQL.Clear;
  qAux.SQL.Add(' SELECT pe.nm_pessoa, pc.cd_conta FROM pessoas pe LEFT JOIN fin_plano_contas_fornecedor pc ');
  qAux.SQL.Add(' ON (pe.cd_pessoa = pc.cd_pessoa AND pc.cd_coligada = ' + IntToStr() + ')');
  qAux.SQL.Add(' WHERE pe.cd_pessoa = :cd_pessoa ');
  qAux.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
  qAux.Open();}

  Result := qAux.FieldByName('nm_pessoa').AsString;

  if qyApropriacao.RecordCount <= 0 then begin

     if not qAux.FieldByName('cd_conta').IsNull then begin

        if not (qyApropriacao.State in [dsInsert, dsEdit]) then begin

           qyApropriacao.Insert;

        end;

        qyApropriacaocd_conta.AsInteger := qAux.FieldByName('cd_conta').AsInteger;
        
     end;

  end;

  FreeAndNil(qAux);

End;

procedure Tfrm_Compromisso_Gerar.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
   // Pular de Campo com ENTER
   if key = #13 then begin
      if dbFornecedor.Text = '' then begin
         sbFornecedor.Click;
      end else begin
         SelectNext(Sender As TWinControl, True, True );
      end;
      key := #0;
   end;
end;

procedure Tfrm_Compromisso_Gerar.btnConfirmarClick(Sender: TObject);
var
  qFatura : TUMZQuery;
  qyContasPagar : TUMZQuery;
begin
    // Confirmar

    if qyCompromissocd_situacao.AsInteger = 2 then begin
       Mensagem('Não é possível alterar informações de um título baixado.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
       qyCompromisso.Cancel;
       Close();
       Exit;
    end;
    
    qyCompromisso.Post;
    {DM.CriarConsulta(qyContasPagar);
    qyContasPagar.SQL.Text :=
      ' UPDATE fin_contas_pagar set ' +
      '   cd_titulo_principal = ' + IntToStr(iTituloPai) +
      ' WHERE cd_coligada = ' + IntToStr(DM.iColigadaSelecionada) +
      ' AND cd_titulo = ' + intToStr(iTituloPai) ;
    qyContasPagar.ExecSQL();}

    FreeAndNil(qyContasPagar);


    // Atualizar os itens da fatura
    if EhFatura then begin

       {DM.CriarConsulta(qFatura);

       qFatura.SQL.Text :=
         ' UPDATE fin_contas_pagar set ' +
         '   cd_titulo_origem = ' + qyCompromissocd_titulo.AsString +
         ' WHERE cd_coligada = ' + IntToStr(DM.iColigadaSelecionada) +
         ' AND cd_titulo in ' + sLstCodFatura ;
       qFatura.ExecSQL();

       FreeAndNil(qFatura);}
       
    end;

    close;
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissoBeforePost(
  DataSet: TDataSet);
Var
   sChave : String;
begin

   if qyCompromisso.State = dsInsert then Exit;

   if qyApropriacao.State in [dsInsert, dsEdit] then
   begin
      qyApropriacao.Post();
   end;

   qyApropriacao.Close();
   qyApropriacao.Open();

   Dm.qyAux1.Close;
   Dm.qyAux1.SQL.Clear;
   Dm.qyAux1.SQL.Add('SELECT SUM(vl_movimento) soma from fin_apropria_cp where cd_titulo = :cd_titulo AND cd_coligada = :cd_coligada');
   Dm.qyAux1.ParamByName('cd_titulo').AsInteger := qyCompromisso.FieldByName('cd_titulo').AsInteger;
   Dm.qyAux1.ParamByName('cd_coligada').AsInteger := qyCompromisso.FieldByName('cd_coligada').AsInteger;
   Dm.qyAux1.Open;

   if qyCompromisso.FieldByName('vl_despesa').AsFloat <= 0 then
   Begin
      Mensagem('Não é possível gerar um compromisso sem valor.', 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
   End;

   if RoundTO(DM.qyAux1.FieldByName('soma').AsFloat + 0.01, 1 ) < RoundTo(qyCompromisso.FieldByName('vl_despesa').AsFloat, 1) then
   Begin
      Mensagem('Os valores não foram totalmente apropriados nos centros de custos.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      Abort;
   End;

   if DM.qyAux1.FieldByName('soma').AsFloat > qyCompromisso.FieldByName('vl_despesa').AsFloat + 0.01 then
   Begin
      Mensagem('Foram apropriados valores maiores nos centros de custos.', 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
   End;

   // Gerar os Logs
   sChave := qyCompromissocd_titulo.AsString + ';' + qyCompromissocd_coligada.AsString;

   {if EhFatura then begin
       DM.setLog(2033, 'Inclusao', sChave, Dm.iColigadaSelecionada, 'Gerou fatura com os títulos "' +  sLstCodFatura + '"');
   end
   else begin
     if tipoEstado = Inserindo then begin
        DM.setLog(2033, 'Inclusao', sChave, Dm.iColigadaSelecionada);
     end
     else begin
        DM.setLog(2033, 'Alteracao', sChave, Dm.iColigadaSelecionada);
     end;
   end;}

   // Após qualquer alteração a Autorização deverá voltar para pendente.

   if ChaveAlteracao <> (
       qyCompromissocd_pessoa.AsString +
       qyCompromissods_despesa.AsString +
       qyCompromissovl_despesa.AsString +
       qyCompromissodt_competencia.AsString +
       qyCompromissodt_vencimento.AsString +
       qyCompromissocd_caixa.AsString +
       qyCompromissocd_forma_pgto.AsString +
       qyApropriacaocd_conta.AsString +
       qyApropriacaocd_centro.AsString)
   then begin
      qyCompromisso.FieldByName('cd_autoriza').AsInteger := 0;
   end;   

end;

procedure Tfrm_Compromisso_Gerar.qyApropriacaoBeforePost(DataSet: TDataSet);
begin
   // Verificar se é possível apropriar os títulos
   
   if (qyApropriacaocd_conta.AsInteger = 0) then begin
   
      Mensagem('Selecione uma conta para atribuir o título.',  'Atenção', MB_OK + MB_ICONWARNING);
      Abort();

   end;

   if (qyApropriacaocd_centro.AsInteger = 0) then begin
   
      Mensagem('Selecione um centro de custo para atribuir o título.', 'Atenção', MB_OK + MB_ICONWARNING);
      Abort();

   end;

end;

procedure Tfrm_Compromisso_Gerar.qyApropriacaoAfterInsert( DataSet: TDataSet);
begin
   // Ao inserir uma apropriação
   
   if qyCompromisso.FieldByName('vl_despesa').AsCurrency > 0 then
   begin

      Dm.qyAux1.Close();
      Dm.qyAux1.SQL.Clear();
      Dm.qyAux1.SQL.Add('SELECT SUM(vl_movimento) soma from fin_apropria_cp where cd_titulo = :cd_titulo AND cd_coligada = :cd_coligada ');
      Dm.qyAux1.ParamByName('cd_titulo').AsInteger := qyCompromisso.FieldByName('cd_titulo').AsInteger;
      Dm.qyAux1.ParamByName('cd_coligada').AsInteger := qyCompromisso.FieldByName('cd_coligada').AsInteger;
      Dm.qyAux1.Open();

      if DM.qyAux1.FieldByName('soma').AsFloat >= qyApropriacao.FieldByName('vl_movimento').AsFloat then
         Exit
      else
         qyApropriacao.FieldByName('vl_movimento').AsFloat := qyCompromisso.FieldByName('vl_despesa').AsCurrency - DM.qyAux1.FieldByName('soma').AsFloat;
   end;

end;

procedure Tfrm_Compromisso_Gerar.sbAdicionarApropriacaoClick( Sender: TObject);
begin
    // Adicionar Apropriação

    qyApropriacao.Insert();
    grdApropria.SetFocus();
    
end;

procedure Tfrm_Compromisso_Gerar.sbContaClick(Sender: TObject);
begin
  // Seleção de Plano de Contas
  if not (qyApropriacao.State in [dsInsert, dsEdit]) then begin
     qyApropriacao.Edit;
  end;
  
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyApropriacaocd_conta.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;
        
        if (tipoEstado = Inserindo) AND ((qyApropriacaocd_conta.AsInteger <> dbDescConta.Tag) OR (qyCompromissods_despesa.AsString = ''))
        then begin
          qyCompromissods_despesa.AsString := qyApropriacaodescPlanoConta.AsString;
        end;
  end;

end;

procedure Tfrm_Compromisso_Gerar.btnCancelarClick(Sender: TObject);
begin
   // Cancelar o compromisso
   
   qyApropriacao.Cancel();

   if tipoEstado = Inserindo then
   begin
       // Eliminar as apropriações
       while not qyApropriacao.Eof do begin
          qyApropriacao.Delete();
       end;

       qyApropriacao.Close();
       qyApropriacao.Open();

       qyCompromisso.Cancel();

       qyCompromisso.Delete();
   end else begin

      qyCompromisso.Cancel();


   end;



   close();
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissoAfterOpen(DataSet: TDataSet);
begin
   {// Abrir os Planos de Contas
   qyPlano_Contas.Close();
   qyPlano_Contas.ParamByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
   qyPlano_Contas.Open();

   // Abrir os centros de custos
   qyCentro_Custos.Close();
   qyCentro_Custos.ParamByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
   qyCentro_Custos.Open();

   // Abrir as formas de pagamento
   qyFormas.Close();
   qyFormas.ParamByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
   qyFormas.Open();

   // Abrir as contas
   qyContas.Close();
   qyContas.ParamByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
   qyContas.ParamByName('cd_usuario').AsInteger :=  DM.iCdPessoaLogado;
   qyContas.Open();

   // Abrir as apropriações
   qyApropriacao.Close();
   qyApropriacao.Open();

   ChaveAlteracao :=
       qyCompromissocd_pessoa.AsString +
       qyCompromissods_despesa.AsString +
       qyCompromissovl_despesa.AsString +
       qyCompromissodt_competencia.AsString +
       qyCompromissodt_vencimento.AsString +
       qyCompromissocd_caixa.AsString +
       qyCompromissocd_forma_pgto.AsString +
       qyApropriacaocd_conta.AsString +
       qyApropriacaocd_centro.AsString;}
end;

procedure Tfrm_Compromisso_Gerar.dbFornecedorExit(Sender: TObject);
begin
{    // Buscar o nome do fornecedor

    lbNomeFornecedor.Caption := BuscaNome(qyCompromisso.FieldByName('cd_pessoa').AsInteger);

    Filtra();}
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissoAfterInsert( DataSet: TDataSet);
begin
{  // Inserir novo compromisso

  qyCompromisso.FieldByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
  qyCompromisso.FieldByName('cd_situacao').AsInteger := 1;
  qyCompromisso.FieldByName('nr_parcela').AsInteger := 1;
  qyCompromisso.FieldByName('sn_previsao').AsString := 'N';
  qyCompromisso.FieldByName('dt_lancamento').AsDateTime := DataHoje;
  qyCompromisso.FieldByName('dt_competencia').AsDateTime := DataHoje;
  qyCompromisso.FieldByName('dt_emissao_nota').AsDateTime := DataHoje;
  IncluirCamposPadroes;}
end;

procedure Tfrm_Compromisso_Gerar.qyApropriacaoNewRecord(DataSet: TDataSet);
begin
   // Ao inserir nova apropriação
   
   qyApropriacao.FieldByName('cd_titulo').AsInteger := qyCompromisso.FieldByName('cd_titulo').AsInteger;
   qyApropriacao.FieldByName('cd_coligada').AsInteger := qyCompromisso.FieldByName('cd_coligada').AsInteger;
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissovl_despesaChange(
  Sender: TField);
begin
   // Ao alterar o valor do título, deve gravar o valor de apropriação qdo tiver somente 1 centro de custo
   
   if qyApropriacao.RecordCount <= 1 then
   begin
      if not ( qyApropriacao.State in [dsEdit, dsInsert]) then
         qyApropriacao.Edit();
      qyApropriacao.FieldByName('vl_movimento').AsCurrency := qyCompromisso.FieldByName('vl_despesa').AsCurrency;
   end;
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissodt_competenciaChange(
  Sender: TField);
begin
   qyCompromisso.FieldByName('dt_vencimento').AsDateTime := qyCompromisso.FieldByName('dt_competencia').AsDateTime;
   qyCompromisso.FieldByName('dt_provavel_pgto').AsDateTime := qyCompromisso.FieldByName('dt_competencia').AsDateTime;
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissodt_vencimentoChange(Sender: TField);
begin
   // Alterar o provavel pagamento = vencimento
   qyCompromisso.FieldByName('dt_provavel_pgto').AsDateTime := qyCompromisso.FieldByName('dt_vencimento').AsDateTime;
end;

procedure Tfrm_Compromisso_Gerar.pgApropriacaoEnter(Sender: TObject);
begin
   if pgApropriacao.ActivePage = tsSemApropriacao then
      dbCodCentro.SetFocus()
   else if pgApropriacao.ActivePage = tsComApropriacao then
      grdApropria.SetFocus()
   else if pgApropriacao.ActivePage = tsObservacao then
      dbmObservacao.SetFocus;
end;

procedure Tfrm_Compromisso_Gerar.qyCompromissoAfterPost(DataSet: TDataSet);
var
   Movimentacao : TMovimento;
   sChave : String;
begin

   if qyCompromisso.State = dsInsert then Exit;
   

   // Conseguiu chegar até aqui, então a geração do título foi bem sucedida

   // Inserir ou atualizar as movimentações do contas a pagar

   sChave := qyCompromissocd_titulo.AsString + ';' + qyCompromissocd_coligada.AsString;

   if tipoEstado = Inserindo then
   begin
       Movimentacao := TMovimento.Create;

       Movimentacao.TipoDeAcao := GerarTitulos;
       Movimentacao.CodigoTitulo := qyCompromisso.FieldByName('cd_titulo').AsInteger;
       Movimentacao.Coligada := qyCompromisso.FieldByName('cd_coligada').AsInteger;
       Movimentacao.CodAcao := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
       Movimentacao.ValorMovimento := qyCompromisso.FieldByName('vl_despesa').AsCurrency;
       Movimentacao.ValorMulta := 0;
       Movimentacao.ValorJuros := 0;
       Movimentacao.ValorDesconto := 0;
       Movimentacao.Observacao := '';

       Movimentacao.RegistrarMovimentacaoCP(0);

       // Registrar log da Inclusão

       // DM.setLog(2033, 'Inclusao', sChave, DM.iColigadaSelecionada);

   end

   else

   if tipoEstado = Alterando then
   begin

       Movimentacao := TMovimento.Create;

       Movimentacao.TipoDeAcao := AlterarTitulos;
       Movimentacao.CodigoTitulo := qyCompromisso.FieldByName('cd_titulo').AsInteger;
       Movimentacao.Coligada := qyCompromisso.FieldByName('cd_coligada').AsInteger;
       Movimentacao.CodAcao := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
       Movimentacao.ValorMovimento := qyCompromisso.FieldByName('vl_despesa').AsCurrency;
       Movimentacao.ValorMulta := 0;
       Movimentacao.ValorJuros := 0;
       Movimentacao.ValorDesconto := 0;
       Movimentacao.Observacao := '';

       Movimentacao.RegistrarMovimentacaoCP(0);

       // Registrar log da Alteração

       // DM.setLog(2033, 'Alteração', sChave, DM.iColigadaSelecionada);

   end;

end;

procedure Tfrm_Compromisso_Gerar.grdApropriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   // Excluir uma apropriação
   
   if Key = VK_DELETE then
   begin
       if Mensagem('Excluir apropriação para o centro de custo selecionado?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes
       then Begin
          qyApropriacao.Delete();
       end;
   end;

end;

procedure Tfrm_Compromisso_Gerar.IncluirCamposPadroes;
Var
   lstColigadas : TStringList;
   lstCampos : TStringList;
   sColigada : String;
   sAux : String;
   n : Integer;
begin

    {// 1>cd_forma_pgto=0,cd_caixa=0;2>cd_forma_pgto=0,cd_caixa=0
    sAux := Dm.variavel_parametro('compromissos_novo_padrao');
    if sAux = '' then Exit;

    lstColigadas := TStringList.Create();
    lstCampos    := TStringList.Create();

    SplitString(sAux, ';', lstColigadas);

    sAux := '';

    for n := 0 to lstColigadas.Count - 1 do begin

        // lstColigadas.Strings[n] = 1>cd_forma_pgto=0,cd_caixa=0
        // Descobrir qual é a coligada que devemos pegar os valores

        if IntToStr(Dm.iColigadaSelecionada) = Copy(lstColigadas.Strings[n], 1, Pos('>', lstColigadas.Strings[n]) -1) then begin

           sAux := Copy(lstColigadas[n], Pos('>', lstColigadas.Strings[n]) +1, length(lstColigadas[n]) );

        end;

    end;

    // sAux = cd_forma_pgto=0,cd_caixa=0  (para a coligada selecionada)

    SplitString(sAux, ',', lstCampos);

    for n := 0 to lstCampos.Count - 1 do begin

        qyCompromisso.FieldByName(lstCampos.Names[n]).AsString := lstCampos.ValueFromIndex[n];

        
    end;

    FreeAndNil(lstColigadas);
    FreeAndNil(lstCampos);}   

end;

procedure Tfrm_Compromisso_Gerar.filtra;
begin

    // Verificar se foram preenchidos os campos chaves
    if ( qyCompromisso.FieldByName('cd_pessoa').AsString = '') OR
       ( qyCompromisso.FieldByName('cd_tipo_titulo').AsString = '') OR
       ( qyCompromisso.FieldByName('nr_documento').AsString = '')
//       OR  ( qyCompromisso.FieldByName('nr_parcela').AsString = '')
    then
    begin
       // se os campos chaves não foram preenchidos, então não liberar a digitação do restante

       dbConta.Enabled           := false;
       dbDescConta.Enabled       := false;
       sbConta.Enabled       := false;
       dbHistorico.Enabled       := false;
       dbValor.Enabled           := false;
       dbDataCompetencia.Enabled := false;
       dbDataVencimento.Enabled  := false;
       dbDataProvavel.Enabled    := false;
       dbPrevisao.Enabled        := false;
       btnConfirmar.Enabled      := false;
       btnAdicionar.Enabled      := false;

    end
    else
    begin
       // Verificar se essa nota já foi lançada no contas a pagar }
{       dm.qyAux2.Close();
       dm.qyAux2.SQL.Clear();
       dm.qyAux2.SQL.Add('SELECT cd_titulo from fin_contas_pagar');
       dm.qyAux2.SQL.Add('WHERE cd_pessoa = :cd_pessoa');
       dm.qyAux2.SQL.Add('AND cd_tipo_titulo = :cd_tipo_titulo');
       dm.qyAux2.SQL.Add('AND nr_documento = :nr_documento');
       dm.qyAux2.SQL.Add('AND nr_parcela = :nr_parcela');
       dm.qyAux2.SQL.Add('AND cd_coligada = :cd_coligada');


       Dm.qyAux2.ParamByName('cd_pessoa').AsInteger := qyCompromisso.FieldByNAme('cd_pessoa').AsInteger;
       Dm.qyAux2.ParamByName('cd_tipo_titulo').AsInteger := qyCompromisso.FieldByNAme('cd_tipo_titulo').AsInteger;
       Dm.qyAux2.ParamByName('nr_documento').AsString := qyCompromisso.FieldByNAme('nr_documento').AsString;
       Dm.qyAux2.ParamByName('nr_parcela').AsInteger := qyCompromisso.FieldByNAme('nr_parcela').AsInteger;
       Dm.qyAux2.ParamByName('cd_coligada').AsInteger := qyCompromisso.FieldByNAme('cd_coligada').AsInteger;

       Dm.qyAux2.Open();

       if not DM.qyAux2.Eof then
       begin
            // Encontrou alguma informação, liberar para alteração 
            qyCompromisso.close();
            qyCompromisso.ParamByName('cd_titulo').AsInteger := Dm.qyAux2.FieldByName('cd_titulo').AsInteger;
            qyCompromisso.ParamByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
            qyCompromisso.open();

            qyCompromisso.Edit();
       end;
}

       // Nenhuma informação encontrada - Pode inserir

       dbConta.Enabled           := True;
       dbDescConta.Enabled       := True;
       sbconta.Enabled       := True;
       dbHistorico.Enabled       := True;
       dbValor.Enabled           := True;
       dbDataCompetencia.Enabled := True;
       dbDataVencimento.Enabled  := True;
       dbDataProvavel.Enabled    := True;
       dbPrevisao.Enabled        := True;
       btnConfirmar.Enabled      := True;
       btnAdicionar.Enabled      := True;

    end;
    
end;

procedure Tfrm_Compromisso_Gerar.dbTipoTituloExit(Sender: TObject);
begin
   filtra();
end;

procedure Tfrm_Compromisso_Gerar.dbContaClick(Sender: TObject);
begin
    if tipoEstado = Inserindo then begin
       qyCompromissods_despesa.AsString := qyApropriacaodescPlanoConta.AsString;
    end;
end;

procedure Tfrm_Compromisso_Gerar.dbDescContaEnter(Sender: TObject);
begin
   dbDescConta.Tag := qyApropriacaocd_conta.AsInteger;
end;

procedure Tfrm_Compromisso_Gerar.dbDescContaExit(Sender: TObject);
begin
    if (tipoEstado = Inserindo) AND ((qyApropriacaocd_conta.AsInteger <> dbDescConta.Tag) OR (qyCompromissods_despesa.AsString = ''))
    then begin
       qyCompromissods_despesa.AsString := qyApropriacaodescPlanoConta.AsString;
    end;
end;

procedure Tfrm_Compromisso_Gerar.dbDocumentoExit(Sender: TObject);
begin
   filtra();
end;

procedure Tfrm_Compromisso_Gerar.dbParcelaExit(Sender: TObject);
begin
   filtra();
end;

function Tfrm_Compromisso_Gerar.RetornaCriterioApropria(PlanoContas: Integer): Integer;
var
   n : Integer;
begin
    {// Retorna o código da apropriação padrao

    DM.qyAux1.Close();
    DM.qyAux1.SQL.Clear();

    DM.qyAux1.SQL.Add(' SELECT * from fin_plano_contas ');
    DM.qyAux1.SQL.Add(' WHERE cd_conta = ' + IntToStr(PlanoContas) );
    Dm.qyAux1.SQL.Add(' AND cd_coligada = ' + IntToStr(DM.iColigadaSelecionada) );

    Dm.qyAux1.Open();

    if DM.qyAux1.Eof then begin
       result := -1; // Não tem o Plano de Contas
       cbApropria.ItemIndex := -1;
    end
    else begin
       result := DM.qyAux1.FieldByName('cd_apropriacao').AsInteger;

       For n := 0 to Length(ListaApropria)-1 do begin
          if  ListaApropria[n] = result then begin
             cbApropria.ItemIndex := n;
          end;
       end;

    end;}

end;

procedure Tfrm_Compromisso_Gerar.AtualizaApropriacao(CdApropria : Integer);
var
   qyInsere : TUMZQuery;
   CdPlano : Integer;
   Perc : double;
begin
   {CdPlano := qyApropriacaocd_conta.AsInteger;

   DM.CriarConsulta(qyInsere);

   if CdApropria < 0 then Exit;

   qyInsere.SQL.Clear();
   qyInsere.SQL.Add(' SELECT ca.vl_total, ci.cd_centro, ci.vl_apropriacao, ca.sn_rateio_matriculas ');
   qyInsere.SQL.Add(' FROM fin_criterios_apropria ca, fin_criterios_apropria_itens ci');
   qyInsere.SQL.Add(' WHERE ca.cd_apropriacao = ci.cd_apropriacao AND ' );
   qyInsere.SQL.Add('   ca.cd_coligada = ci.cd_coligada AND ');
   qyInsere.SQL.Add('    ca.cd_apropriacao = ' + IntToStr(CdApropria) );
   qyInsere.SQL.Add('  AND ca.cd_coligada = ' + IntToStr(DM.iColigadaSelecionada) );

   qyInsere.Open();

   if qyInsere.FieldByName('sn_rateio_matriculas').AsInteger = 1 then
   begin
      DM.DefineRateioApropriacaoPorMatriculas(CdApropria, DM.GetAnoSemestreAtual);
   end;

   // Apagar as Apropriações Atuais
   qyApropriacao.Cancel();

   While not qyApropriacao.Eof do begin
     qyApropriacao.Delete();
   end;

   qyApropriacao.Close();
   qyApropriacao.Open();

   qyInsere.First();

   While not qyInsere.Eof do begin

      if qyInsere.FieldByName('vl_apropriacao').AsCurrency > 0 then
      begin
        qyApropriacao.Insert();

        qyApropriacaocd_titulo.AsInteger  := qyCompromissocd_titulo.AsInteger;
        qyApropriacaocd_coligada.AsInteger:= qyCompromissocd_coligada.AsInteger;
        qyApropriacaocd_conta.AsInteger   := CdPlano;
        qyApropriacaocd_centro.AsInteger  := qyInsere.FieldByName('cd_centro').AsInteger;

        Perc := qyInsere.FieldByName('vl_apropriacao').AsFloat / qyInsere.FieldByName('vl_total').AsFloat;

        // qyApropriacaovl_movimento.AsFloat := StrToFloat(FLoatToStrF(qyCompromissovl_despesa.AsCurrency * Perc, ffFixed, 12, 15));
        qyApropriacaovl_movimento.AsFloat := qyCompromissovl_despesa.AsCurrency * Perc;

        qyApropriacao.Post();

      end;

      qyInsere.Next();

   end;
   
   qyApropriacao.Close();
   qyApropriacao.Open();}


end;

procedure Tfrm_Compromisso_Gerar.pgApropriacaoChange(Sender: TObject);
var
  CdCriterio : Integer;
begin

   if pgApropriacao.ActivePageIndex = 0 then
   begin


   end
   else
   begin
      CdCriterio := RetornaCriterioApropria(qyApropriacaocd_conta.AsInteger);
      if CdCriterio > 0 then begin
         AtualizaApropriacao(CdCriterio);
      end;
   end;
end;

procedure Tfrm_Compromisso_Gerar.btnAdicionarClick(Sender: TObject);
Var
  // Adicionar nova parcela
  
  iCdFornecedor : Integer;
  iTpTitulo : Integer;
  sNroDocumento : string;
  iParcela : Integer;
  dDataEmissao : TDateTime;
  iCodConta : Integer;
  sHistorico : String;
  cValorMovimento : Currency;
  dRegistro : TDateTime;
  dCompetencia : TDateTime;
  dVencimento : TDateTime;
  dProvavelPgto : TDateTime;
  iCodCentro : Integer;
  i : Integer;
  iFormaPgto      : Integer;
  iContaPgto      : Integer;

  aCodPlano, aCodCentro , aCodparcela : Array of Integer;
  aValoresApropria : Array of Currency;

  wDia, wMes, wAno : word;

  iTitulo : Integer;

begin

   {iCdFornecedor     := qyCompromissocd_pessoa.AsInteger;
   iTpTitulo         := qyCompromissocd_tipo_titulo.AsInteger;
   sNroDocumento     := qyCompromissonr_documento.AsString;
   dDataEmissao      := qyCompromissodt_emissao_nota.AsDateTime;

   sHistorico        := qyCompromissods_despesa.AsString;
   cValorMovimento   := qyCompromissovl_despesa.AsCurrency;
   dRegistro         := qyCompromissodt_lancamento.AsDateTime;
   dCompetencia      := qyCompromissodt_competencia.AsDateTime;
   dVencimento       := qyCompromissodt_vencimento.AsDateTime;
   dProvavelPgto     := qyCompromissodt_provavel_pgto.AsDateTime;
   iFormaPgto        := qyCompromissocd_forma_pgto.AsInteger;
   iContaPgto        := qyCompromissocd_caixa.AsInteger;


   qyCompromisso.Post;
   

   qyApropriacao.Close;
   qyApropriacao.Open;
   qyApropriacao.FetchAll;

   iParcela :=  qyCompromissonr_parcela.AsInteger; 
   SetLength(aCodPlano, qyApropriacao.RecordCount);
   SetLength(aCodCentro, qyApropriacao.RecordCount);
   SetLength(aValoresApropria, qyApropriacao.RecordCount);

   qyApropriacao.First;

   i := 0;

   while not qyApropriacao.Eof do begin

      aCodPlano[i] := qyApropriacaocd_conta.AsInteger;
      aCodCentro[i] :=  qyApropriacaocd_centro.AsInteger;
      aValoresApropria[i] := qyApropriacaovl_movimento.AsCurrency;

      INC(i);

      qyApropriacao.Next;
   end;

   // A proxima parcela deve ter vencimento no próximo mês
   DecodeDate(dVencimento, wano, wmes, wdia);

   wmes := wmes + 1;

   if wMes > 12 then begin
      wmes := 1;
      wano := wano  + 1;
   end;

   dVencimento := DataValida(wano, wmes, wdia);

   // A proxima parcela deve ter competencia no próximo mês
   DecodeDate(dCompetencia, wano, wmes, wdia);

   wmes := wmes + 1;

   if wMes > 12 then begin
      wmes := 1;
      wano := wano  + 1;
   end;

   dCompetencia := DataValida(wano, wmes, wdia);




   qyCompromisso.Insert();
   qyCompromissocd_titulo_principal.AsInteger := iTituloPai;
   qyCompromisso.FieldByName('cd_coligada').AsInteger := qyCompromisso.ParamByName('cd_coligada').AsInteger;
   qyCompromisso.Post();

   iTitulo := Dm.LastInsert;

   if bPrimeira and (tipoEstado <> Alterando) then
   begin

      iTituloPai := iTitulo-1 ;
   end;
   if bPrimeira then
   begin
      bPrimeira := false ;
      frm_Compromisso_Gerar.qyMaxParcela.Close;
      frm_Compromisso_Gerar.qyMaxParcela.ParamByName('cd_titulo_principal').AsInteger := iTituloPai;
      frm_Compromisso_Gerar.qyMaxParcela.Open;
      iParcela := qyMaxParcelaparcela.AsInteger;
      if iparcela = 0  then
         iParcela := 1
   end;
   qyCompromisso.close;
   if tipoEstado <> Alterando then
      inc(iParcela);

   qyCompromisso.ParamByName('cd_titulo').AsInteger := iTitulo;
   qyCompromisso.ParamByName('cd_coligada').AsInteger := DM.iColigadaSelecionada;
   qyCompromisso.open;

   qyCompromisso.Edit;

   qyCompromissocd_pessoa.AsInteger := iCdFornecedor; 
   qyCompromissocd_tipo_titulo.AsInteger := iTpTitulo;
   qyCompromissonr_documento.AsString := sNroDocumento;
   qyCompromissonr_parcela.AsInteger := iParcela;
   qyCompromissodt_emissao_nota.AsDateTime := dDataEmissao;
   qyCompromissods_despesa.AsString := sHistorico;
   qyCompromissovl_despesa.AsCurrency := cValorMovimento;
   qyCompromissodt_lancamento.AsDateTime := dRegistro;
   qyCompromissodt_competencia.AsDateTime := dCompetencia;
   qyCompromissodt_vencimento.AsDateTime := dVencimento;
   qyCompromissodt_provavel_pgto.AsDateTime := dVencimento;
   qyCompromissocd_forma_pgto.AsInteger := iFormaPgto;
   qyCompromissocd_caixa.AsInteger := iContaPgto;
   qyCompromissocd_titulo_principal.AsInteger := iTituloPai;

   qyApropriacao.Cancel();

   for i := 0 to Length(aCodPlano)-1 do begin

      qyApropriacao.Insert();

      qyApropriacaocd_conta.AsInteger := aCodPlano[i];
      qyApropriacaocd_centro.AsInteger := aCodCentro[i];
      qyApropriacaovl_movimento.AsCurrency := aValoresApropria[i];

      try
         qyApropriacao.Post();
      except
      end;

   end;

   qyApropriacao.Close();
   qyApropriacao.Open();

   tipoEstado := Inserindo;

   dbDocumento.SetFocus();}

end;

procedure Tfrm_Compromisso_Gerar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qyFormas.Close();
    qyPlano_Contas.Close();
    qyCentro_Custos.Close();
    qyApropriacao.Close();

    if (tipoEstado = Inserindo) AND (qyCompromisso.State in [dsInsert, dsEdit]) then
    begin
       qyCompromisso.Cancel();

       qyCompromisso.Delete();
    end;
    
    qyCompromisso.Close();
end;

procedure Tfrm_Compromisso_Gerar.qyCentro_CustosCalcFields(DataSet: TDataSet);
Var
   sAux : String;
begin

   if qyCentro_Custoscd_classificacao.AsString <> '' then
      sAux := qyCentro_Custoscd_classificacao.DisplayText + '  '
   else
      sAux := '';

   sAux := sAux + qyCentro_Custosds_centro.AsString;

   qyCentro_Custos.FieldByName('desClassificacaoDesc').AsString := sAux;

end;

procedure Tfrm_Compromisso_Gerar.FormCreate(Sender: TObject);
begin
  // atribuir a formatação da máscara do centro de custo
  
  qyCentro_Custoscd_classificacao.EditMask := DM.variavel_parametro('mascara_plano_custos');

  qyContas.ParamByName('cd_usuario').AsInteger := DM.iCdPessoaLogado;
  bPrimeira := true;
  iTituloPai := qyCompromissocd_titulo_principal.AsInteger;

end;

procedure Tfrm_Compromisso_Gerar.sbRemoverApropriacaoClick(Sender: TObject);
begin
   if Mensagem('Excluir apropriação para o centro de custo selecionado?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes
   then Begin
        qyApropriacao.Delete();
   end;
end;

procedure Tfrm_Compromisso_Gerar.MontaCriteriosApropria;
var
  qyCriterios : TUMZQuery;
  n : Integer;
begin
   {// Critérios de Apropriação

   DM.CriarConsulta(qyCriterios);

   qyCriterios.Close();
   qyCriterios.SQL.Text :=
     ' SELECT * FROM fin_criterios_apropria ' +
     ' WHERE cd_coligada = ' + IntToStr(DM.iColigadaSelecionada) +
     ' ORDER BY ds_apropriacao ';
   qyCriterios.Open();

   qyCriterios.FetchAll();

   SetLength(ListaApropria, qyCriterios.RecordCount);

   cbApropria.Items.Clear();

   n := 0;

   while not qyCriterios.Eof do begin

      cbApropria.Items.Add(qyCriterios.FieldByName('ds_apropriacao').AsString);

      ListaApropria[n] := qyCriterios.FieldByName('cd_apropriacao').AsInteger;

      INC(n);

      qyCriterios.Next();

   end;}

end;

procedure Tfrm_Compromisso_Gerar.cbApropriaChange(Sender: TObject);
begin
    // Atualizar a apropriação
    
    AtualizaApropriacao(ListaApropria[cbApropria.ItemIndex]);
end;

procedure Tfrm_Compromisso_Gerar.qyApropriacaoAfterPost(DataSet: TDataSet);
begin
   // Atualizar a Apropriacao
   
   qyApropriacao.Close();
   qyApropriacao.Open();
end;

procedure Tfrm_Compromisso_Gerar.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
   // Pular de Campo com Enter
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure Tfrm_Compromisso_Gerar.DBLookupComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
   // Pular de Campo com Enter
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

end.
