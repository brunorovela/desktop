unit uFPlanosNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  ImgList, DB, uDm, DBTables, uFSelTipoTituloNegocia , Main ,uCamposPlanilhas,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, General, UMDateTimePicker,
  CheckLst;

type
  TfrmPlanoNegociacao = class(TForm)
    pnlPrincipal: TPanel;
    pnlDireita: TPanel;
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
    Label4: TLabel;
    dsNegociacao: TDataSource;
    bvlDados: TBevel;
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
    qryPlanosNegociacaovl_desconto_juros: TFloatField;
    qryPlanosNegociacaovl_multa: TFloatField;
    ImageList2: TImageList;
    dsPlanosNegociacaoTurmas: TDataSource;
    qryPlanosNegociacaoTurmas: TUMZQuery;
    qryPlanosNegociacaoTurmascd_plano_negociacao: TIntegerField;
    qryPlanosNegociacaoTurmascd_curso: TStringField;
    qryPlanosNegociacaoTurmascd_turma: TStringField;
    qryPlanosNegociacaoTurmasdescricao: TStringField;
    qryPlanosNegociacaoTurmasDS_CURSO: TStringField;
    qryPlanosNegociacaosn_usar_todas_turmas: TSmallintField;
    Panel1: TPanel;
    pnlEsquerda: TPanel;
    lblPlano: TLabel;
    lblInformacoesComplementares: TLabel;
    lblVlMinimoDivida: TLabel;
    lblMaximoDivida: TLabel;
    lblEntradaMinima: TLabel;
    percentual: TLabel;
    lblMinimoParcela: TLabel;
    lblQtdParcelas: TLabel;
    lblDiasVencimento: TLabel;
    lblDtVencimento: TLabel;
    lblTipoTitulo: TLabel;
    lblContaPadrao: TLabel;
    lblPercentAcresc: TLabel;
    percentual2: TLabel;
    lblMulta: TLabel;
    percentual3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeNomePlano: TDBEdit;
    dbeMinima: TDBEdit;
    dbeMaximo: TDBEdit;
    dbeVlEntradaMinima: TDBEdit;
    dbeMinimoParcela: TDBEdit;
    dbeQtdMaxima: TDBEdit;
    dbeDiasVenc: TDBEdit;
    dblcTipoNegociacao: TDBLookupComboBox;
    dblcContaPadrao: TDBLookupComboBox;
    dbePercenlCobrado: TDBEdit;
    pnlAcrescimo: TPanel;
    Label7: TLabel;
    rbNaoAcrescimo: TRadioButton;
    rbSimAcrescimo: TRadioButton;
    RadioButton4: TRadioButton;
    pnlTipoAcrescimo: TPanel;
    Label5: TLabel;
    rbSimples: TRadioButton;
    rbComposto: TRadioButton;
    dbmInformacaoComp: TDBMemo;
    dbePercentualDescontoJuros: TDBEdit;
    DBEdit1: TDBEdit;
    umdtLimite: TUMDateTimePicker;
    checkTodasTurmas: TDBCheckBox;
    pnlAtivoPlano: TPanel;
    lblAtivo: TLabel;
    rbNaoAtivo: TRadioButton;
    rbSimAtivo: TRadioButton;
    pnTurmas: TPanel;
    Panel11: TPanel;
    grdTurmas: TDBGrid;
    Panel10: TPanel;
    ToolBar1: TToolBar;
    btnAddCurso: TToolButton;
    btnAddTurma: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    Label6: TLabel;
    qryPlanosNegociacaonr_situacao_titulo: TSmallintField;
    Panel2: TPanel;
    cbSit1: TRadioButton;
    cbSit0: TRadioButton;
    procedure checkTodasTurmasClick(Sender: TObject);
    procedure ckUsarTodasTurmasClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnAddTurmaClick(Sender: TObject);
    procedure btnAddCursoClick(Sender: TObject);
    procedure umdtLimiteChangeDate(Sender: TObject);
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
    nr_anosemestre: Integer;
    bCarregando : Boolean;
    procedure carregaTela;
    procedure editarDados;
    procedure habilitaBarra(Acao : Integer);
    procedure inserirNovoPlano;


  public
    { Public declarations }
    procedure carregarTurmasNegociacao();
  end;

var
  frmPlanoNegociacao: TfrmPlanoNegociacao;

implementation

uses uUsuario, uFSelecionarCurso, uFSelecionarTurma, uFParcelasIgnorar;

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
      umdtLimite.Date := Now;
      qryPlanosNegociacaodt_fim_plano.AsDateTime := Now;

      checkTodasTurmas.Checked := True;
      cbSit0.Checked := true;
   end;
end;

procedure TfrmPlanoNegociacao.btnOlhoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(dbgNegocicao, 'planilha_negociacao');
end;

procedure TfrmPlanoNegociacao.btnSalvarClick(Sender: TObject);
begin
   dbeNomePlano.SetFocus;

   if qryPlanosNegociacaonr_dia_vencimento.AsInteger = 0  then
   begin
      Mensagem('Você deve informar um número de dias de vencimento maior que zero para o plano.','Alerta',MB_OK+MB_ICONWARNING);
      exit;
   end;

   if (qryPlanosNegociacaodt_fim_plano.AsDateTime < dm.DataAtual) then
   begin
      Mensagem('Você deve informar um limite de vencimento maior que a data atual para o plano.','Alerta',MB_OK+MB_ICONWARNING);
      exit;
   end;

   if checkTodasTurmas.State = cbUnchecked then
   begin
      qryPlanosNegociacaosn_usar_todas_turmas.AsInteger := 0;
   end;

   if checkTodasTurmas.State = cbChecked then
   begin
      qryPlanosNegociacaosn_usar_todas_turmas.AsInteger := 1;
   end;

   if (qryPlanosNegociacao.State = dsEdit) then
   begin
      qryAtivo.Post;

      qryPlanosNegociacaonr_situacao_titulo.AsInteger := 0;
      if (cbSit1.Checked) then
      begin
         qryPlanosNegociacaonr_situacao_titulo.AsInteger := 1;
      end;

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

procedure TfrmPlanoNegociacao.carregarTurmasNegociacao;
CONST
   SQL_BUSCA_TURMAS_NEGOCIACAO = ''+
      'SELECT                                '+
	   '  fpnt.*,                             '+
      '  t.descricao,                        '+
	   '  cm.DS_CURSO                         '+
      'FROM                                  '+
	   '  fin_planos_negociacao_turmas fpnt   '+
      '  INNER JOIN turmas t ON (fpnt.cd_turma = t.codigo) '+
      '  INNER JOIN cursos_mestre cm ON (cm.CD_CURSO = fpnt.cd_curso) '+
      'WHERE '+
      '  CD_PLANO_NEGOCIACAO = :CD_NEGOCIACAO '+
      'GROUP BY fpnt.cd_turma                 '+
      'ORDER BY fpnt.cd_turma                 ';
begin
   qryPlanosNegociacaoTurmas.SQL.Text := SQL_BUSCA_TURMAS_NEGOCIACAO;

   qryPlanosNegociacaoTurmas.ParamByName('CD_NEGOCIACAO').AsInteger := qryPlanosNegociacaocd_plano_negociacao.AsInteger;

   qryPlanosNegociacaoTurmas.Open;
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

      umdtLimite.Date := Now;
      if(qryPlanosNegociacaodt_fim_plano.AsString <> '') then
      begin
         umdtLimite.Date := qryPlanosNegociacaodt_fim_plano.AsDateTime;
      end;
      
      cbSit0.Checked := (qryPlanosNegociacaonr_situacao_titulo.AsInteger = 0);
      cbSit1.Checked := (qryPlanosNegociacaonr_situacao_titulo.AsInteger = 1);

      bCarregando := false;
   end;
end;

procedure TfrmPlanoNegociacao.ckUsarTodasTurmasClick(Sender: TObject);
begin

   if not (qryPlanosNegociacao.State IN [dsEdit, dsInsert]) and (qryPlanosNegociacao.State = dsBrowse) then
   begin
      btnAlterarClick(Self);
   end;
   
end;

procedure TfrmPlanoNegociacao.checkTodasTurmasClick(Sender: TObject);
begin
   if checkTodasTurmas.State = cbGrayed then
   begin
      checkTodasTurmas.State := cbUnchecked;
   end;

   // Habilitar/desabilitar botões da barra
   pnTurmas.Enabled := not checkTodasTurmas.Checked;
   grdTurmas.Enabled := not checkTodasTurmas.Checked;
   btnAddCurso.Enabled := not checkTodasTurmas.Checked;
   btnAddTurma.Enabled := not checkTodasTurmas.Checked;
   ToolButton5.Enabled := not checkTodasTurmas.Checked;
   ToolButton1.Enabled := not checkTodasTurmas.Checked;
end;

procedure TfrmPlanoNegociacao.transformaPonto(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfrmPlanoNegociacao.umdtLimiteChangeDate(Sender: TObject);
begin
   if not(bCarregando) then
   begin
      editarDados;
      qryPlanosNegociacaodt_fim_plano.AsDateTime := umdtLimite.getDate;
   end;
end;

procedure TfrmPlanoNegociacao.dsNegociacaoDataChange(Sender: TObject;
  Field: TField);
begin
   carregaTela;
   carregarTurmasNegociacao;   
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

   carregarTurmasNegociacao;

   nr_anosemestre := dm.GetAnoSemestreAtual;
   
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

procedure TfrmPlanoNegociacao.btnAddCursoClick(Sender: TObject);
var
   qyInsertPlanosTurma: TUMZQuery;
   qryBuscaTurmas     : TUMZQuery;
   filtro_curso: String;
   P: Pointer;
   resultado_filtro : TResultadoFiltroCurso;
   cd_negociacao: Integer;
begin
   DM.CriarConsulta(qyInsertPlanosTurma);
   DM.CriarConsulta(qryBuscaTurmas);

   qyInsertPlanosTurma.SQL.Clear();
   qyInsertPlanosTurma.SQL.Add('INSERT INTO FIN_PLANOS_NEGOCIACAO_TURMAS ( CD_PLANO_NEGOCIACAO, CD_CURSO, CD_TURMA )');
   qyInsertPlanosTurma.SQL.Add('VALUES ( :CD_PLANO_NEGOCIACAO, :CD_CURSO, :CD_TURMA  )');


   qryBuscaTurmas.SQL.Add('   SELECT :CD_PLANO_NEGOCIACAO as CD_PLANO_NEGOCIACAO, CURSO, CODIGO FROM turmas');
   qryBuscaTurmas.SQL.Add('   WHERE curso = :CD_CURSO AND cd_coligada = :CD_COLIGADA AND anosemestre = :NR_ANOSEMESTRE');

   filtro_curso := '';

   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([bfcAnosemestre], -1, -1, nr_anosemestre);

   if resultado_filtro.filtrado then
   Begin
      filtro_curso := resultado_filtro.cd_curso;

      qryBuscaTurmas.ParamByName('CD_PLANO_NEGOCIACAO').AsInteger := qryPlanosNegociacaocd_plano_negociacao.AsInteger;
      qryBuscaTurmas.ParamByName('CD_COLIGADA').AsInteger := resultado_filtro.cd_coligada;
      qryBuscaTurmas.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
      qryBuscaTurmas.ParamByName('CD_CURSO').AsString := filtro_curso;

      qryBuscaTurmas.open;

      while not qryBuscaTurmas.Eof do
      begin
         qyInsertPlanosTurma.ParamByName('CD_PLANO_NEGOCIACAO').AsInteger := qryPlanosNegociacaocd_plano_negociacao.AsInteger;
         qyInsertPlanosTurma.ParamByName('CD_CURSO').AsString  := qryBuscaTurmas.FieldByName('CURSO').AsString;
         qyInsertPlanosTurma.ParamByName('CD_TURMA').AsString  := qryBuscaTurmas.FieldByName('CODIGO').AsString;
         try
            qyInsertPlanosTurma.ExecSQL;
         except on E: Exception do
         end;
         qryBuscaTurmas.Next;      
      end;
      

   cd_negociacao := qryPlanosNegociacaocd_plano_negociacao.AsInteger;

   qryPlanosNegociacao.Refresh;

   qryPlanosNegociacao.Locate('cd_plano_negociacao', cd_negociacao, []);

   carregarTurmasNegociacao;
   
   end;
end;

procedure TfrmPlanoNegociacao.btnAddTurmaClick(Sender: TObject);
var
   qyInsertPlanosTurma: TUMZQuery;
   filtro_curso, filtro_turma: String;
   P: Pointer;
   resultado_filtro : TResultadoFiltroTurma;
   cd_negociacao: Integer;
begin
   DM.CriarConsulta(qyInsertPlanosTurma);
   qyInsertPlanosTurma.SQL.Clear();
   qyInsertPlanosTurma.SQL.Add('INSERT INTO FIN_PLANOS_NEGOCIACAO_TURMAS ( CD_PLANO_NEGOCIACAO, CD_CURSO, CD_TURMA )');
   qyInsertPlanosTurma.SQL.Add('   SELECT :cd_plano_negociacao , curso, codigo FROM turmas');
   qyInsertPlanosTurma.SQL.Add('   WHERE curso = :CD_CURSO AND codigo = :CD_TURMA AND cd_coligada = :CD_COLIGADA AND anosemestre = :NR_ANOSEMESTRE');

   filtro_curso := '';
   filtro_turma := '';

   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre], nr_anosemestre, -1);

   { Pesquisar Cursos }

   if resultado_filtro.filtrado then
   Begin
      filtro_curso := resultado_filtro.cd_curso;
      filtro_turma := resultado_filtro.cd_turma;

      qyInsertPlanosTurma.ParamByName('cd_plano_negociacao').AsInteger := qryPlanosNegociacaocd_plano_negociacao.AsInteger;
      qyInsertPlanosTurma.ParamByName('CD_COLIGADA').AsInteger := resultado_filtro.cd_coligada;
      qyInsertPlanosTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
      qyInsertPlanosTurma.ParamByName('CD_CURSO').AsString := filtro_curso;
      qyInsertPlanosTurma.ParamByName('CD_TURMA').AsString := filtro_turma;
      
      try
         qyInsertPlanosTurma.ExecSQL;
         if (qyInsertPlanosTurma.RowsAffected <> 1) then
         begin
            Mensagem('Não foi possível vincular a turma devido a mesma não pertencer a coligada do plano.', '', MB_OK+MB_ICONEXCLAMATION, Handle);
         end;
      except on E: Exception do
         if Pos('Duplicate entry', E.Message) > 0 then
         begin
            Mensagem('Esta turma já esta vinculada ao plano de pagamento selecionado','', MB_OK+MB_ICONEXCLAMATION, Handle)
         end;
      end;
     
   cd_negociacao := qryPlanosNegociacaocd_plano_negociacao.AsInteger;

   qryPlanosNegociacao.Refresh;

   qryPlanosNegociacao.Locate('cd_plano_negociacao', cd_negociacao, []);

   carregarTurmasNegociacao;
   
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

procedure TfrmPlanoNegociacao.ToolButton1Click(Sender: TObject);
var
   qyDeletePlanosTurmas: TUMZQuery;
   i: Integer;
   P: Pointer;
   cd_negociacao: Integer;
begin
   DM.CriarConsulta(qyDeletePlanosTurmas);

   qyDeletePlanosTurmas.SQL.Clear();
   qyDeletePlanosTurmas.SQL.Add('DELETE FROM FIN_PLANOS_NEGOCIACAO_TURMAS');
   qyDeletePlanosTurmas.SQL.Add('WHERE cd_plano_negociacao = :cd_plano_negociacao AND CD_CURSO = :CD_CURSO AND CD_TURMA = :CD_TURMA');

   for I := 0 to grdTurmas.SelectedRows.Count - 1 do
   begin
      qryPlanosNegociacaoTurmas.GotoBookmark(pointer(grdTurmas.SelectedRows.Items[I]));

      qyDeletePlanosTurmas.ParamByName('cd_plano_negociacao').AsInteger := qryPlanosNegociacaoTurmas.FieldByName('cd_plano_negociacao').AsInteger;
      qyDeletePlanosTurmas.ParamByName('CD_CURSO').AsString := qryPlanosNegociacaoTurmas.FieldByName('CD_CURSO').AsString;
      qyDeletePlanosTurmas.ParamByName('CD_TURMA').AsString := qryPlanosNegociacaoTurmas.FieldByName('CD_TURMA').AsString;

      qyDeletePlanosTurmas.ExecSQL;
   end;

   cd_negociacao := qryPlanosNegociacaocd_plano_negociacao.AsInteger;

   qryPlanosNegociacao.Refresh;

   qryPlanosNegociacao.Locate('cd_plano_negociacao', cd_negociacao, []);

   carregarTurmasNegociacao;

end;

procedure TfrmPlanoNegociacao.ToolButton5Click(Sender: TObject);
begin
   //Limpa linhas selecinadas da grid de vinculados
   grdTurmas.SelectedRows.Clear;

   //Utilizada o "DataSet" (conjunto de dados da grid)
   with qryPlanosNegociacaoTurmas do
   begin
      //Desativa os controles
      DisableControls;

      //Seleciona o primeiro registro
      First;

      try
         //Enquanto tiver registros
          while not EOF do
          begin
            //Seleciona o registro atual (que está varrendo)
            grdTurmas.SelectedRows.CurrentRowSelected := true;
            //Passa para o próximo
            Next;
          end;
      finally
         //Ativa os controles
         EnableControls;
      end;
   end;
end;


end.
