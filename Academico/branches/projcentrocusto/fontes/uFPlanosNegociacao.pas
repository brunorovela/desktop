unit uFPlanosNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  ImgList, DB, uDm, DBTables, uFSelTipoTituloNegocia , Main ,uCamposPlanilhas,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, General ;

type
  TfrmPlanoNegociacao = class(TForm)
    pnlPrincipal: TPanel;
    pnlDireita: TPanel;
    pnlEsquerda: TPanel;
    pnlTop: TPanel;
    ImagemBarra: TImageList;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnOlho: TToolButton;
    ToolButton11: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    pnlDados: TPanel;
    pnlHabilitaModulo: TPanel;
    dbgNegocicao: TDBGrid;
    lblHabilitarUso: TLabel;
    rbSimAtivoGeral: TRadioButton;
    rbNaoAtivoGeral: TRadioButton;
    btnTipoDeTitulos: TButton;
    dbeNomePlano: TDBEdit;
    lblPlano: TLabel;
    lblInformacoesComplementares: TLabel;
    lblVlMinimoDivida: TLabel;
    dbeMinima: TDBEdit;
    dbeMaximo: TDBEdit;
    lblMaximoDivida: TLabel;
    lblEntradaMinima: TLabel;
    percentual: TLabel;
    dbeVlEntradaMinima: TDBEdit;
    lblMinimoParcela: TLabel;
    dbeMinimoParcela: TDBEdit;
    lblQtdParcelas: TLabel;
    dbeQtdMaxima: TDBEdit;
    lblDiasVencimento: TLabel;
    dbeDiasVenc: TDBEdit;
    lblDtVencimento: TLabel;
    lblTipoTitulo: TLabel;
    lblContaPadrao: TLabel;
    dblcTipoNegociacao: TDBLookupComboBox;
    dblcContaPadrao: TDBLookupComboBox;
    lblPercentAcresc: TLabel;
    dbePercenlCobrado: TDBEdit;
    Label4: TLabel;
    percentual2: TLabel;
    lblMulta: TLabel;
    percentual3: TLabel;
    dsNegociacao: TDataSource;
    pnlAtivoPlano: TPanel;
    rbNaoAtivo: TRadioButton;
    rbSimAtivo: TRadioButton;
    lblAtivo: TLabel;
    pnlAcrescimo: TPanel;
    Label7: TLabel;
    rbNaoAcrescimo: TRadioButton;
    rbSimAcrescimo: TRadioButton;
    RadioButton4: TRadioButton;
    pnlTipoAcrescimo: TPanel;
    rbSimples: TRadioButton;
    Label5: TLabel;
    rbComposto: TRadioButton;
    dtpDtLimite: TDateTimePicker;
    bvlDados: TBevel;
    dbmInformacaoComp: TDBMemo;
    qryPlanosNegociacao: TUMZQuery;
    qryPlanosNegociacaocd_plano_negociacao: TLargeintField;
    qryPlanosNegociacaovl_entrada_minima: TFloatField;
    qryPlanosNegociacaosn_ativo: TSmallintField;
    qryPlanosNegociacaonr_max_parcelas: TLargeintField;
    qryPlanosNegociacaovl_min_parcela: TFloatField;
    qryPlanosNegociacaosn_acrescimo: TSmallintField;
    qryPlanosNegociacaovl_juros: TFloatField;
    qryPlanosNegociacaotp_juros: TStringField;
    qryPlanosNegociacaovl_max_divida: TFloatField;
    qryPlanosNegociacaovl_min_divida: TFloatField;
    qryPlanosNegociacaonr_dia_vencimento: TSmallintField;
    qryPlanosNegociacaotp_titulo_emitido: TLargeintField;
    qryPlanosNegociacaods_desc_negocia: TStringField;
    qryPlanosNegociacaocd_caixa: TIntegerField;
    qryPlanosNegociacaodt_fim_plano: TDateTimeField;
    qryPlanosNegociacaods_negociacao: TMemoField;
    qryContas: TUMZQuery;
    qryContasds_caixa: TStringField;
    qryContascd_caixa: TIntegerField;
    qryTiposTitulos: TUMZQuery;
    qryAtivo: TUMZQuery;
    qryAtivocd_parametro: TIntegerField;
    qryAtivods_valor: TMemoField;
    qryPlanosNegociacaodesc_sn_ativo: TStringField;
    qryPlanosNegociacaodesc_sn_acrescimo: TStringField;
    qryPlanosNegociacaods_titulo_emitido: TStringField;
    qryPlanosNegociacaods_caixa: TStringField;
    qryTiposTituloscd_tipo_titulo: TIntegerField;
    qryTiposTitulosds_tipo_titulo: TStringField;
    Label1: TLabel;
    dbePercentualDescontoJuros: TDBEdit;
    Label2: TLabel;
    qryPlanosNegociacaovl_desconto_juros: TFloatField;
    qryPlanosNegociacaovl_multa: TFloatField;
    DBEdit1: TDBEdit;
    procedure transformaPonto(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure qryPlanosNegociacaoCalcFields(DataSet: TDataSet);
    procedure qryPlanosNegociacaoBeforeInsert(DataSet: TDataSet);
    procedure qryPlanosNegociacaoBeforeEdit(DataSet: TDataSet);
    procedure qryPlanosNegociacaoBeforeCancel(DataSet: TDataSet);
    procedure qryPlanosNegociacaoAfterPost(DataSet: TDataSet);
    procedure qryPlanosNegociacao2CalcFields(DataSet: TDataSet);
    procedure btnOlhoClick(Sender: TObject);
    procedure btnTipoDeTitulosClick(Sender: TObject);
    procedure qryPlanosNegociacao2BeforeCancel(DataSet: TDataSet);
    procedure qryPlanosNegociacao2AfterPost(DataSet: TDataSet);
    procedure dsNegociacaoDataChange(Sender: TObject; Field: TField);
    procedure rbNaoAtivoGeralClick(Sender: TObject);
    procedure rbSimAtivoGeralClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure qryPlanosNegociacao2BeforeInsert(DataSet: TDataSet);
    procedure qryPlanosNegociacao2BeforeEdit(DataSet: TDataSet);
    procedure dtpDtLimiteChange(Sender: TObject);
    procedure rbCompostoClick(Sender: TObject);
    procedure rbSimplesClick(Sender: TObject);
    procedure rbNaoAcrescimoClick(Sender: TObject);
    procedure rbSimAcrescimoClick(Sender: TObject);
    procedure rbNaoAtivoClick(Sender: TObject);
    procedure rbSimAtivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  strict private
    procedure CarregarSQLsColigadasFilhas();

  private
    { Private declarations }

    bCarregando : Boolean;
    procedure carregaTela;
    procedure editarDados;
    procedure habilitaBarra(Acao : Integer);
    procedure inserirNovoPlano;

  public
    { Public declarations }
  end;

var
  frmPlanoNegociacao: TfrmPlanoNegociacao;

implementation

uses uUsuario;

{$R *.dfm}
procedure TfrmPlanoNegociacao.editarDados;
begin
   if qryPlanosNegociacao.State =  dsBrowse then
   begin
      qryAtivo.Edit;
      qryPlanosNegociacao.Edit;
   end;
end;


procedure TfrmPlanoNegociacao.btnCancelarClick(Sender: TObject);
begin
   qryPlanosNegociacao.Cancel;

   carregaTela;

end;

procedure TfrmPlanoNegociacao.btnExcluirClick(Sender: TObject);
begin
   if  DM.UsuarioLogado.TemPermissao( 2080, npExcluir, True ) then
   begin
      if Mensagem('Você realmente deseja excluir','Confirmação',MB_YESNO+MB_ICONQUESTION) = mrYes then
      begin
         qryPlanosNegociacao.Delete;
      end;
   end;
end;

procedure TfrmPlanoNegociacao.btnFecharClick(Sender: TObject);
begin
//
   Close;
end;

procedure TfrmPlanoNegociacao.btnIncluirClick(Sender: TObject);
begin
   if  DM.UsuarioLogado.TemPermissao( 2080, npIncluir, True ) then
   begin
      dbeNomePlano.SetFocus;
      qryPlanosNegociacao.Insert;
      dtpDtLimite.DateTime := Now;
      qryPlanosNegociacaodt_fim_plano.AsDateTime := Now;
   end;
end;

procedure TfrmPlanoNegociacao.btnOlhoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(dbgNegocicao, 'planilha_negociacao');
end;

procedure TfrmPlanoNegociacao.btnSalvarClick(Sender: TObject);
begin
   if (qryPlanosNegociacao.State = dsEdit) then
   begin
      qryAtivo.Post;
      qryPlanosNegociacao.Post;
   end
   else
   begin
      inserirNovoPlano;
   end;
end;

procedure TfrmPlanoNegociacao.btnTipoDeTitulosClick(Sender: TObject);
begin
  if not PrincipalForm.ProcuraForm(TForm(frmSelTipoTituloNegocia) ) then
     Application.CreateForm(TfrmSelTipoTituloNegocia, frmSelTipoTituloNegocia)
  else
     frmSelTipoTituloNegocia.Show;
end;

procedure TfrmPlanoNegociacao.carregaTela;
begin
   //Carregando dados para a tela
   if (qryPlanosNegociacao.State = dsBrowse) then
   begin
      bCarregando := True;
      if qryAtivods_valor.AsString = '1' then
      begin
         rbSimAtivoGeral.Checked := true;
      end
      else
      begin
         rbNaoAtivoGeral.Checked := true;
      end;

      if qryPlanosNegociacaosn_ativo.AsInteger = 1 then
      begin
         rbSimAtivo.Checked := true;
      end
      else
      begin
         rbNaoAtivo.Checked := True;
      end;

      if qryPlanosNegociacaosn_acrescimo.AsInteger = 1 then
      begin
         rbSimAcrescimo.Checked := True;
      end
      else
      begin
         rbNaoAcrescimo.Checked := True;
      end;

      if qryPlanosNegociacaotp_juros.AsString = 'S' then
      begin
         rbSimples.Checked := true;
      end
      else
      begin
         rbComposto.Checked := True;
      end;

      if(qryPlanosNegociacaodt_fim_plano.AsString <> '') then
      begin
         dtpDtLimite.DateTime := qryPlanosNegociacaodt_fim_plano.AsDateTime;
      end
      else
      begin
         dtpDtLimite.DateTime := Now;
      end;
      bCarregando := false;

   end;
end;

procedure TfrmPlanoNegociacao.transformaPonto(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfrmPlanoNegociacao.dsNegociacaoDataChange(Sender: TObject;
  Field: TField);
begin
   carregaTela;
end;

procedure TfrmPlanoNegociacao.dtpDtLimiteChange(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaodt_fim_plano.AsDateTime := dtpDtLimite.DateTime;
   end;
end;

procedure TfrmPlanoNegociacao.CarregarSQLsColigadasFilhas;
const
   SQL_FILTRAR_CONTAS =
      ' SELECT ds_caixa, cd_caixa ' +
      ' FROM fin_cadastro_contas ' +
      ' WHERE cd_coligada IN ( %s ) OR sn_todas_coligadas = 1 ' +
      ' ORDER BY ds_caixa ';
begin
   qryContas.Close();
   qryContas.SQL.Text := Format( SQL_FILTRAR_CONTAS, [ DM.UsuarioLogado.GetColigadasFilhaSelecionada() ] );
   qryTiposTitulos.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
end;

procedure TfrmPlanoNegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmPlanoNegociacao.FormCreate(Sender: TObject);
begin
   CarregarSQLsColigadasFilhas();
end;

procedure TfrmPlanoNegociacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
     VK_F2  :
     begin
       if(btnIncluir.Enabled = true)then
       begin
          btnIncluirClick(nil);
       end;
       Exit;
     end;
     VK_F3  :
     begin
        if(btnAlterar.Enabled = true)then
        begin
           btnAlterarClick(nil);
        end;
        exit;
     end;
     VK_F5  :
     begin
        if(btnSalvar.Enabled = true)then
        begin
           btnSalvarClick(nil);
        end;
        Exit;
     end;
     VK_F9  :
     begin
        if(btnExcluir.Enabled = true) then
        begin
           btnExcluirClick(nil);
        end;
        Exit;
     end;

     VK_F6  :
     begin
        if(btnCancelar.Enabled =true)then
        begin
           btnCancelarClick(nil);
        end;
        Exit;
     end;
     VK_F12 :
     begin
        if(btnFechar.Enabled = true)then
        begin
           btnFecharClick(nil);
        end;
        Exit;
     end;
  end;
end;

procedure TfrmPlanoNegociacao.FormShow(Sender: TObject);
begin
   qryAtivo.Close;
   qryAtivo.Open;
   bCarregando := true;
   qryPlanosNegociacao.Close;
   qryPlanosNegociacao.Open;
   carregaTela;
   habilitaBarra(1);
   btnTipoDeTitulos.SetFocus;
   DM.MontarPlanilha(dbgNegocicao, 'planilha_negociacao');
end;


procedure TfrmPlanoNegociacao.habilitaBarra(Acao: Integer);
begin
   case Acao of
   // acao de alteracao /insercao
      0:
         begin
            btnIncluir.Enabled := False;
            btnAlterar.Enabled := False;
            btnExcluir.Enabled := False;
            btnOlho.Enabled := false;
            btnSalvar.Enabled := true;
            btnCancelar.Enabled := true;
            Exit;
         end;
   //acao de salvar / cancelar
      1:
         begin
            btnIncluir.Enabled := true;
            btnAlterar.Enabled := true;
            btnExcluir.Enabled := true;
            btnOlho.Enabled := true;
            btnCancelar.Enabled := false;
            btnSalvar.Enabled := false;
            Exit;
         end;
   end;
end;

procedure TfrmPlanoNegociacao.inserirNovoPlano;
var
   qryInsere : TUMZQuery;
begin

   dm.CriarConsulta(qryInsere);

   qryInsere.SQL.Text := '   '+
   'INSERT INTO fin_planos_negociacao ( '+
   '    vl_entrada_minima,              '+
   '    sn_ativo,                       '+
   '    nr_max_parcelas,                '+
   '    vl_min_parcela,                 '+
   '    sn_acrescimo,                   '+
   '    vl_juros,                       '+
   '    tp_juros,                       '+
   '    vl_max_divida,                  '+
   '    vl_min_divida,                  '+
   '    nr_dia_vencimento,              '+
   '    tp_titulo_emitido,              '+
   '    ds_desc_negocia,                '+
   '    vl_multa,                       '+
   '    cd_caixa,                       '+
   '    ds_negociacao,                  '+
   '    dt_fim_plano                    '+
   '  )                                 '+
   '  VALUES                            '+
   ' (                                  '+
   '    :vl_entrada_minima,             '+
   '    :sn_ativo,                      '+
   '    :nr_max_parcelas,               '+
   '    :vl_min_parcela,                '+
   '    :sn_acrescimo,                  '+
   '    :vl_juros,                      '+
   '    :tp_juros,                      '+
   '    :vl_max_divida,                 '+
   '    :vl_min_divida,                 '+
   '    :nr_dia_vencimento,             '+
   '    :tp_titulo_emitido,             '+
   '    :ds_desc_negocia,               '+
   '    :vl_multa,                      '+
   '    :cd_caixa,                      '+
   '    :ds_negociacao,                 '+
   '    :dt_fim_plano                   '+
   ' )';
   qryInsere.ParamByName('sn_ativo').AsInteger           := qryPlanosNegociacaosn_ativo.AsInteger;
   qryInsere.ParamByName('vl_entrada_minima').AsFloat    := qryPlanosNegociacaovl_entrada_minima.AsFloat;
   qryInsere.ParamByName('nr_max_parcelas').AsInteger    := qryPlanosNegociacaonr_max_parcelas.AsInteger;
   qryInsere.ParamByName('vl_min_parcela').AsInteger     := qryPlanosNegociacaovl_min_parcela.AsInteger;
   qryInsere.ParamByName('sn_acrescimo').AsInteger       := qryPlanosNegociacaosn_acrescimo.AsInteger;
   qryInsere.ParamByName('vl_juros').AsInteger           := qryPlanosNegociacaovl_juros.AsInteger;
   qryInsere.ParamByName('tp_juros').AsString            := qryPlanosNegociacaotp_juros.AsString;
   qryInsere.ParamByName('vl_max_divida').AsInteger      := qryPlanosNegociacaovl_max_divida.AsInteger;
   qryInsere.ParamByName('vl_min_divida').AsInteger      := qryPlanosNegociacaovl_min_divida.AsInteger;
   qryInsere.ParamByName('nr_dia_vencimento').AsInteger  := qryPlanosNegociacaonr_dia_vencimento.AsInteger;
   qryInsere.ParamByName('tp_titulo_emitido').AsInteger  := qryPlanosNegociacaotp_titulo_emitido.AsInteger;
   qryInsere.ParamByName('ds_desc_negocia').AsString     := qryPlanosNegociacaods_desc_negocia.AsString;
   qryInsere.ParamByName('vl_multa').AsFloat             := qryPlanosNegociacaovl_multa.AsFloat;
   qryInsere.ParamByName('cd_caixa').AsInteger           := qryPlanosNegociacaocd_caixa.AsInteger;
   qryInsere.ParamByName('dt_fim_plano').AsString        := FormatDateTime( 'yyyy-mm-dd hh:nn:ss' ,qryPlanosNegociacaodt_fim_plano.AsDateTime);
   qryInsere.ParamByName('ds_negociacao').AsString       := qryPlanosNegociacaods_negociacao.AsString;
   qryInsere.ExecSQL;
   qryPlanosNegociacaoAfterPost(nil);
   qryPlanosNegociacao.Close;
   qryPlanosNegociacao.Open;


end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacao2AfterPost(DataSet: TDataSet);
begin
   qryPlanosNegociacao.Close;
   qryPlanosNegociacao.open;
   habilitaBarra(1);
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacao2BeforeCancel(
  DataSet: TDataSet);
begin
   habilitaBarra(1);
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacao2BeforeEdit(DataSet: TDataSet);
begin
   habilitaBarra(0);
   if(qryAtivo.State = dsBrowse)then
   begin
      qryAtivo.Edit;
   end;
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacao2BeforeInsert(
  DataSet: TDataSet);
begin
   habilitaBarra(0);

end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacao2CalcFields(DataSet: TDataSet);
begin
   if qryPlanosNegociacaosn_ativo.AsInteger = 1 then
   begin
      qryPlanosNegociacaodesc_sn_ativo.AsString := 'Sim'
   end
   else
   begin
      qryPlanosNegociacaodesc_sn_ativo.AsString := 'Não';
   end;

   if qryPlanosNegociacaosn_acrescimo.AsInteger = 1 then
   begin
      qryPlanosNegociacaodesc_sn_acrescimo.AsString := 'Sim'
   end
   else
   begin
      qryPlanosNegociacaodesc_sn_acrescimo.AsString := 'Não';
   end;   
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacaoAfterPost(DataSet: TDataSet);
begin
   qryPlanosNegociacao.Close;
   qryPlanosNegociacao.open;
   habilitaBarra(1);
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacaoBeforeCancel(
  DataSet: TDataSet);
begin
   habilitaBarra(1);
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacaoBeforeEdit(DataSet: TDataSet);
begin
   habilitaBarra(0);
   if(qryAtivo.State = dsBrowse)then
   begin
      qryAtivo.Edit;
   end;
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacaoBeforeInsert(
  DataSet: TDataSet);
begin
   habilitaBarra(0);
end;

procedure TfrmPlanoNegociacao.qryPlanosNegociacaoCalcFields(DataSet: TDataSet);
begin
   if qryPlanosNegociacaosn_ativo.AsInteger = 1 then
   begin
      qryPlanosNegociacaodesc_sn_ativo.AsString := 'Sim'
   end
   else
   begin
      qryPlanosNegociacaodesc_sn_ativo.AsString := 'Não';
   end;

   if qryPlanosNegociacaosn_acrescimo.AsInteger = 1 then
   begin
      qryPlanosNegociacaodesc_sn_acrescimo.AsString := 'Sim'
   end
   else
   begin
      qryPlanosNegociacaodesc_sn_acrescimo.AsString := 'Não';
   end;
end;

procedure TfrmPlanoNegociacao.rbCompostoClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaotp_juros.AsString := 'C';
   end;
end;

procedure TfrmPlanoNegociacao.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao( 2080, npAlterar, True ) then
   begin
      qryPlanosNegociacao.Edit;
      qryAtivo.Edit;
   end;
end;

procedure TfrmPlanoNegociacao.rbNaoAcrescimoClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaosn_acrescimo.AsInteger := 0;
   end;
end;

procedure TfrmPlanoNegociacao.rbNaoAtivoClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaosn_ativo.AsInteger :=  0;
   end;
end;

procedure TfrmPlanoNegociacao.rbNaoAtivoGeralClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryAtivods_valor.AsString := '0';
   end;
end;

procedure TfrmPlanoNegociacao.rbSimAcrescimoClick(Sender: TObject);
begin

   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaosn_acrescimo.AsInteger := 1;
   end;
end;

procedure TfrmPlanoNegociacao.rbSimAtivoClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaosn_ativo.AsInteger :=  1;
   end;
end;

procedure TfrmPlanoNegociacao.rbSimAtivoGeralClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryAtivods_valor.AsString := '1';
   end;
end;

procedure TfrmPlanoNegociacao.rbSimplesClick(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaotp_juros.AsString := 'S';
   end;
end;

end.
