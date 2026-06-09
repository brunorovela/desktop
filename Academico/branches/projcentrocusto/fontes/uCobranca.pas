unit uCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZConnection, Grids, DBGrids, DBCtrls, ToolWin, ComCtrls,
  ImgList, Buttons, StdCtrls, DBCGrids, Mask, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Menus, ZSqlUpdate, StrUtils, UMComboBox,
  RegExpr;

type
  TfrmCobranca = class(TForm)
    Panel3: TPanel;
    Bevel6: TBevel;
    qyCobranca: TUMZQuery;
    dtcCobranca: TDataSource;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    sbFechar: TToolButton;
    pgCobranca: TPageControl;
    Bevel1: TBevel;
    qyAux: TUMZQuery;
    qyContatos: TUMZQuery;
    dtcContatos: TDataSource;
    tsLista: TTabSheet;
    grd: TDBGrid;
    tsDadosDevedor: TTabSheet;
    tsTitulos: TTabSheet;
    tsHistorico: TTabSheet;
    Panel1: TPanel;
    Bevel2: TBevel;
    ckbDe: TCheckBox;
    ckbAte: TCheckBox;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    ckbPorAnoSemestre: TCheckBox;
    txtAnoSemestre: TMaskEdit;
    UpDownAnoSem: TUpDown;
    ckbResponsavel: TCheckBox;
    cbResponsavel: TComboBox;
    Label1: TLabel;
    sbAtualizarLista: TSpeedButton;
    cbSituacao: TComboBox;
    sbSelecionarColuna: TSpeedButton;
    ToolButton3: TToolButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    txtNome: TEdit;
    txtResponsavel: TEdit;
    txtCodigoEstudante: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    txtCPF: TEdit;
    Label6: TLabel;
    meEndereco: TMemo;
    Panel4: TPanel;
    Label7: TLabel;
    txtContato1: TEdit;
    txtContato2: TEdit;
    txtContato3: TEdit;
    txtContato4: TEdit;
    txtContato5: TEdit;
    txtContato6: TEdit;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    D: TLabel;
    Label9: TLabel;
    Panel6: TPanel;
    Label13: TLabel;
    Bevel5: TBevel;
    txtSPC: TEdit;
    txtJuridico: TEdit;
    txtSPCInclusao: TEdit;
    txtJurInclusao: TEdit;
    txtSPCRetirada: TEdit;
    txtJurRetirada: TEdit;
    Panel7: TPanel;
    grdMensalidades: TDBGrid;
    tblMensalidades: TUMZQuery;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorJuros: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesDescricaoSituacao: TStringField;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesBloquetoImpresso: TStringField;
    tblMensalidadesNomeAluno: TStringField;
    tblMensalidadesDepto: TSmallintField;
    tblMensalidadesValorJurosCalc: TFloatField;
    tblMensalidadesBloqueto: TStringField;
    tblMensalidadesocorrencia_remessa: TSmallintField;
    tblMensalidadesocorrencia_retorno: TSmallintField;
    tblMensalidadessn_credito_parcela: TStringField;
    tblMensalidadesnr_creditos: TFloatField;
    tblMensalidadestipoparcela: TSmallintField;
    tblMensalidadescurso: TStringField;
    tblMensalidadescd_coligada: TSmallintField;
    tblMensalidadesNomeResponsavel: TStringField;
    tblMensalidadesds_tipo_titulo: TStringField;
    tblMensalidadesdt_competencia: TDateTimeField;
    tblMensalidadesds_historico: TStringField;
    tblMensalidadesds_conta: TStringField;
    tblMensalidadesds_centro: TStringField;
    tblMensalidadesds_bolsa: TStringField;
    tblMensalidadesMoedaPgto: TStringField;
    tblMensalidadesvl_pago_moeda: TFloatField;
    tblMensalidadescd_tipo_titulo: TSmallintField;
    tblMensalidadesPercDescExtra: TCurrencyField;
    tblMensalidadesPercDescCond: TCurrencyField;
    Panel8: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    txtTituloNome: TEdit;
    txtTituloResponsa: TEdit;
    Bevel7: TBevel;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    txtHisNome: TEdit;
    txtHistResponsavel: TEdit;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Label14: TLabel;
    cbTelefone: TComboBox;
    Label17: TLabel;
    cbContato: TComboBox;
    ckbRetorno: TCheckBox;
    dtRetorno: TDateTimePicker;
    Label20: TLabel;
    meHistorico: TMemo;
    btnIncluir: TBitBtn;
    dtcMensalidades: TDataSource;
    pnBotoes: TPanel;
    Bevel10: TBevel;
    sbVencidos: TSpeedButton;
    sbPendentes: TSpeedButton;
    sbPagos: TSpeedButton;
    sbNegociados: TSpeedButton;
    sbCancelados: TSpeedButton;
    sbTodos: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    cbSituacaoFinal: TComboBox;
    ckbDepartamento: TCheckBox;
    ckbCurso: TCheckBox;
    ckbTurma: TCheckBox;
    txtDepartamento: TEdit;
    txtCurso: TEdit;
    txtTurma: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    btnCodigoCurso: TSpeedButton;
    btnCodigoTurma: TSpeedButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ckbAluno: TCheckBox;
    txtAluno: TEdit;
    btnCodigoAluno: TSpeedButton;
    tblMensalidadesValorDescontoCalc: TCurrencyField;
    tblMensalidadessn_liberar_juros: TSmallintField;
    tblMensalidadessn_liberar_descontos: TSmallintField;
    tblMensalidadesvl_credito: TFloatField;
    tblMensalidadesjuros_calc: TFloatField;
    tblMensalidadesdesconto_calc: TFloatField;
    tblMensalidadescd_resp_finan: TStringField;
    btnImprimir: TSpeedButton;
    btnNegociar: TSpeedButton;
    tblMensalidadescd_recibo: TIntegerField;
    pgOBS: TPageControl;
    tsGeral: TTabSheet;
    tsRestrita: TTabSheet;
    meObservacoes: TMemo;
    meRestritas: TMemo;
    ckbAlunoResponsavel: TCheckBox;
    tblMensalidadescodigoaluno: TIntegerField;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblMensalidadescd_mensalidade_origem: TIntegerField;
    tblMensalidadescd_centro_custo: TLargeintField;
    tblMensalidadescd_plano_conta: TLargeintField;
    tblMensalidadescd_caixa: TIntegerField;
    tblMensalidadescd_resp: TIntegerField;
    tblMensalidadescd_bolsa: TIntegerField;
    tblMensalidadesDS_SIGLA: TStringField;
    dsEmpresa: TDataSource;
    qyEmpresa: TUMZQuery;
    Bevel11: TBevel;
    pnEmpresa: TPanel;
    lblEmpresa: TLabel;
    lblNome: TLabel;
    lblEnderecoEmpresa: TLabel;
    dbeNome_Empresa: TDBEdit;
    lblcargo: TLabel;
    dbeCargo: TDBEdit;
    dbeEmail: TDBEdit;
    lblEmail: TLabel;
    dbetelefone: TDBEdit;
    lblTelefone: TLabel;
    dbeSite: TDBEdit;
    lblSite: TLabel;
    dbmEnderecoCompleto: TDBMemo;
    qyCobrancaCD_PESSOA: TIntegerField;
    qyCobrancaNM_PESSOA: TStringField;
    qyCobrancaCARGO: TStringField;
    qyCobrancaNM_RESP: TStringField;
    qyCobrancaNM_USUARIO: TStringField;
    qyCobrancaVL_BRUTO: TFloatField;
    qyCobrancaVL_DESC_FIXO: TFloatField;
    qyCobrancaVL_LIQUIDO: TFloatField;
    qyCobrancaVL_ATUALIZADO: TFloatField;
    qyCobrancaCD_COBRANCA: TLargeintField;
    qyCobrancaDT_REGISTRO: TDateTimeField;
    qyCobrancaCD_SITUACAO: TLargeintField;
    qyCobrancaSN_SPC: TSmallintField;
    qyCobrancaDT_SPC_INCLUSAO: TDateTimeField;
    qyCobrancaDT_SPC_RETIRADA: TDateTimeField;
    qyCobrancaSN_JURIDICO: TSmallintField;
    qyCobrancaDT_JURIDICO_INCLUSAO: TDateTimeField;
    qyCobrancaDT_JURIDICO_RETIRADA: TDateTimeField;
    qyCobrancaCD_RESPONSAVEL: TLargeintField;
    qyCobrancaDT_RETORNO: TDateTimeField;
    qyCobrancaDS_SITUACAO: TStringField;
    qyCobrancaDS_SIGLA: TStringField;
    qryDadosDevedor: TUMZReadOnlyQuery;
    qryDadosDevedorCD_PESSOA: TIntegerField;
    qryDadosDevedorNM_PESSOA: TStringField;
    qryDadosDevedorCD_RESP_FINAN: TIntegerField;
    qryDadosDevedorNM_RESP: TStringField;
    qryDadosDevedorDS_CPF: TStringField;
    qryDadosDevedorDS_ENDERECO: TStringField;
    qryDadosDevedorCD_EMPRESA: TIntegerField;
    qyEmpresaCD_EMPRESA: TIntegerField;
    qyEmpresaNM_EMPRESA: TStringField;
    qyEmpresaNM_RAZAO_SOCIAL: TStringField;
    qyEmpresaDS_ENDERECO: TStringField;
    qyEmpresaDS_COMPLEMENTO: TStringField;
    qyEmpresaDS_BAIRRO: TStringField;
    qyEmpresaDS_CIDADE: TStringField;
    qyEmpresaDS_ESTADO: TStringField;
    qyEmpresaDS_CEP: TStringField;
    qyEmpresaNM_CONTATO: TStringField;
    qyEmpresaDS_TELEFONE1: TStringField;
    qyEmpresaDS_TELEFONE2: TStringField;
    qyEmpresaDS_EMAIL: TStringField;
    qyEmpresaDS_SITE: TStringField;
    qyEmpresaCD_AREA_ATUACAO: TIntegerField;
    qyEmpresaDS_CNPJ: TStringField;
    qyEmpresaSN_CONVENIO: TSmallintField;
    qyEmpresaCD_PESSOA_EMPRESA: TIntegerField;
    qyEmpresaDS_ENDERECO_COMPLETO: TStringField;
    qryContatosDevedor: TUMZReadOnlyQuery;
    qryContatosDevedorDS_CONTATO: TStringField;
    qryContatosTel: TUMZReadOnlyQuery;
    qryContatosTelDS_CONTATO: TStringField;
    qyCobrancaULTIMOANOSEMESTRE: TSmallintField;
    qyCobrancaPRIMEIROANOSEMESTRE: TSmallintField;
    qyCobrancaULTIMOVENCIMENTO: TDateTimeField;
    qyCobrancaPRIMEIROVENCIMENTO: TDateTimeField;
    qyCobrancaQTDTITULOS: TLargeintField;
    btnVisualizar: TSpeedButton;
    btnProtesto: TSpeedButton;
    pmProtestos: TPopupMenu;
    qyCobrancaDS_SERASA: TStringField;
    qyCobrancasn_serasa: TSmallintField;
    rdbPorRetorno: TRadioButton;
    rbPorVencimento: TRadioButton;
    Label23: TLabel;
    qyContatosCD_COBRANCA_CONTATO: TLargeintField;
    qyContatosCD_COBRANCA: TLargeintField;
    qyContatosDT_REGISTRO: TDateTimeField;
    qyContatosDT_RETORNO: TDateTimeField;
    qyContatosDS_CONTATO: TMemoField;
    qyContatosCD_USUARIO: TLargeintField;
    qyContatosSN_RETORNO: TSmallintField;
    qyContatosNM_CONTATO: TStringField;
    qyContatosDS_TELEFONE: TStringField;
    qyContatosBB_ANEXO: TBlobField;
    qyContatosNOME: TStringField;
    qyContatosDS_RESUMO: TStringField;
    bbtnAnexar: TBitBtn;
    updContatos: TZUpdateSQL;
    bbtnDelAnexo: TBitBtn;
    qyCobrancasn_cartorio: TIntegerField;
    GroupBox1: TGroupBox;
    Label24: TLabel;
    cbInclusoDe: TCheckBox;
    dtInclusoDe: TDateTimePicker;
    cbInclusoAte: TCheckBox;
    dtInclusoAte: TDateTimePicker;
    comboIncluso: TUMComboBox;
    qyCobrancaDT_SERASA_INCLUSAO: TDateField;
    qyCobrancaDT_SERASA_RETIRADA: TDateField;
    qyCobrancaDT_CARTORIO_INCLUSAO: TDateField;
    qyCobrancaDT_CARTORIO_RETIRADA: TDateField;
    qyCobrancaSERASA: TSmallintField;
    ToolButton5: TToolButton;
    btnImprimirListaCobranca: TToolButton;
    qyCobrancacurso: TStringField;
    cbDePagamento: TCheckBox;
    dtpDePagamento: TDateTimePicker;
    cbAtePagamento: TCheckBox;
    dtpAtePagamento: TDateTimePicker;
    Label25: TLabel;
    procedure btnImprimirListaCobrancaClick(Sender: TObject);
    procedure qyCobrancaAfterOpen(DataSet: TDataSet);
    procedure comboInclusoCloseUp(Sender: TObject);
    procedure qyCobrancasn_cartorioGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyCobrancasn_serasaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dtcContatosDataChange(Sender: TObject; Field: TField);
    procedure dtcContatosStateChange(Sender: TObject);
    procedure bbtnDelAnexoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbtnAnexarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbPorVencimentoClick(Sender: TObject);
    procedure qyCobrancaCalcFields(DataSet: TDataSet);
    procedure pmProtestosPopup(Sender: TObject);
    procedure btnProtestoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure tsHistoricoShow(Sender: TObject);
    procedure tblMensalidadesAfterOpen(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNegociarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure qyCobrancasn_juridicoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyCobrancasn_spcGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbTodosClick(Sender: TObject);
    procedure sbCanceladosClick(Sender: TObject);
    procedure sbNegociadosClick(Sender: TObject);
    procedure sbPagosClick(Sender: TObject);
    procedure sbPendentesClick(Sender: TObject);
    procedure sbVencidosClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure ckbRetornoClick(Sender: TObject);
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure dtcCobrancaDataChange(Sender: TObject; Field: TField);
    procedure pgCobrancaChange(Sender: TObject);
    procedure sbAtualizarListaClick(Sender: TObject);
    procedure ckbAteClick(Sender: TObject);
    procedure ckbDeClick(Sender: TObject);
    procedure ckbResponsavelClick(Sender: TObject);
    procedure ckbPorAnoSemestreClick(Sender: TObject);
    procedure UpDownAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure sbFecharClick(Sender: TObject);
    procedure grdTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
  private
    { Private declarations }
    snNegociou: boolean;
    snHistorico: Boolean;
    iCodEmpresa : Integer;
    LSCampoOrdem: string;
    ListaResponsaveis : Array of Integer;
    ListaSituacoes : Array of Integer;
    iCobrancaAtual : Integer;
    FBTodos: boolean;
    FBApenasJuridico: boolean;
    sSituacoes : String;
    procedure Protestar(Sender: TObject);
    Procedure AtivarCampos();
    Procedure PreencherCombos();
    Procedure PreencherCobranca();
    Procedure PreencherDadosPessoais();
    Procedure PreencherTitulos();
    Procedure PreencherHistorico();

    function getMensalidadesProtesto(semProtestoJunto: Boolean): String;
    function SQLToCrystalExpressionReplaceExAlias(ARegExpr : TRegExpr): string;
    function SQLToCrystalExpressionReplaceColumnsToInt(ARegExpr : TRegExpr): string;
  public
    { Public declarations }
    Procedure Filtrar();
  end;

var
  frmCobranca: TfrmCobranca;

implementation

uses
   uDm, uCamposPlanilhas, Main, uFSelecionarCurso, uFSelecionarDepartamento, uFSelecionarTurma,
   uCobrancaAltera, uFSelecionarPessoa, uCobrancaHistorico, uUsuario, uNegociacao,
   uImpMens, uProtesto, UFObservacoes, UFDigitalizaDoc, ClassRegistros, uGeneral;

{$R *.dfm}

procedure TfrmCobranca.AtivarCampos;
begin
  // Ativar / Desativar campos

   if rdbPorRetorno.Checked or rbPorVencimento.Checked then
   begin
     ckbDe.Enabled   := True;
     ckbAte.Enabled  := True;
   end;

  dtpDataInicial.Enabled := (ckbDe.Checked AND ckbDe.Enabled);
  dtpDataFinal.Enabled   := (ckbAte.Checked AND ckbAte.Enabled);

  txtAnoSemestre.Enabled := ckbPorAnoSemestre.Checked;
  UpDownAnoSem.Enabled := ckbPorAnoSemestre.Checked;

  cbResponsavel.Enabled := ckbResponsavel.Checked;

  txtDepartamento.Enabled := ckbDepartamento.Checked;
  txtCurso.Enabled := ckbCurso.Checked;
  txtTurma.Enabled := ckbTurma.Checked;

  btnCodigoDepartamento.Enabled := ckbDepartamento.Checked;
  btnCodigoCurso.Enabled := ckbCurso.Checked;
  btnCodigoTurma.Enabled := ckbTurma.Checked;

  if( ckbAluno.Checked OR ckbAlunoResponsavel.Checked )then
  begin
     txtAluno.Enabled := true;
     btnCodigoAluno.Enabled := true;
  end
  else
  begin
     txtAluno.Enabled := false;
     btnCodigoAluno.Enabled := false;
  end;

  dtInclusoDe.Enabled := cbInclusoDe.Checked;
  dtInclusoAte.Enabled := cbInclusoAte.Checked;
  
end;

procedure TfrmCobranca.ckbRetornoClick(Sender: TObject);
begin
   dtRetorno.Enabled := ckbRetorno.Checked;
end;

procedure TfrmCobranca.comboInclusoCloseUp(Sender: TObject);
begin

   if (comboIncluso.ItemIndex > 0) then
   begin
      cbInclusoDe.Enabled := True;

      cbInclusoAte.Enabled := True;
   end;

   if (comboIncluso.ItemIndex < 1) then
   begin
      cbInclusoDe.Checked := False;
      cbInclusoDe.Enabled := False;

      cbInclusoAte.Checked := False;
      cbInclusoAte.Enabled := False;
   end;

end;

procedure TfrmCobranca.DBGrid1DblClick(Sender: TObject);

   function GetFileName(const Ext: string): string;
   begin
      Result := Format('%s%s%s.%s', [ExtractTempDirectory, PathDelim, CreateNewGuid, Ext]);
   end;

var
   FileExt, FileName: string;
begin
   if DBGrid1.SelectedIndex = 2 then
   begin
      fCobrancasHistorico := TfCobrancasHistorico.Create(
         qyContatosDS_RESUMO.AsString,
         qyCobrancaNM_PESSOA.AsString,
         qyContatosDT_REGISTRO.AsString,
         qyContatosDT_RETORNO.AsString, Self
      );
      try
         fCobrancasHistorico.ShowModal;
      finally
         fCobrancasHistorico.Free;
      end;
   end
   else if (DBGrid1.SelectedIndex = 6) and (not qyContatosBB_ANEXO.IsNull) then
   begin
      if AnsiLeftStr(qyContatosBB_ANEXO.AsString, 4) = '%PDF' then
      begin
         FileExt := 'pdf';
      end
      else
      begin
         FileExt := 'bmp';
      end;
      FileName := GetFileName(FileExt);
      qyContatosBB_ANEXO.SaveToFile(FileName);
      OpenURL(FileName);
   end;
end;

procedure TfrmCobranca.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Bitmap: TBitmap;
   X, Y: Integer;
   FixRect: TRect;
begin
   if (DataCol = 6) and (not qyContatosBB_ANEXO.IsNull) then
   begin
      Bitmap := TBitmap.Create;
      try
         ImageList1.GetBitmap(10, Bitmap);
         X := Rect.Left + (((Rect.Right - Rect.Left) - Bitmap.Width) div 2);
         Y := Rect.Top + (((Rect.Bottom - Rect.Top) - Bitmap.Height) div 2);
         FixRect := Rect;
         FixRect.Right := FixRect.Right + 1;
         FixRect.Bottom := FixRect.Bottom + 1;
         DBGrid1.Canvas.Font.Color := clLtGray;
         DBGrid1.Canvas.Brush.Color := clWhite;
         DBGrid1.Canvas.Pen.Style := psClear;
         DBGrid1.Canvas.Rectangle(FixRect);
         DBGrid1.Canvas.Draw(X, Y, Bitmap);
         DBGrid1.Canvas.Pen.Style := psSolid;
      finally
         Bitmap.Free;
      end;
   end
   else
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCobranca.btnIncluirClick(Sender: TObject);
const
   S_SQL_UPD_COB =
      'UPDATE FIN_COBRANCA SET CD_SITUACAO = :CD_SITUACAO, DT_RETORNO = :DT_RETORNO WHERE CD_COBRANCA = :CD_COBRANCA';
   S_SQL_UPD_COB_RESP =
      'UPDATE FIN_COBRANCA SET CD_SITUACAO = :CD_SITUACAO, DT_RETORNO = :DT_RETORNO, CD_RESPONSAVEL = :CD_RESPONSAVEL WHERE CD_COBRANCA = :CD_COBRANCA';
      
   SQLUpdateCobranca: array[Boolean] of string =
         (S_SQL_UPD_COB, S_SQL_UPD_COB_RESP);
var
   lugar : Pointer;
begin
   // Incluir registro de histórico;
   if DM.UsuarioLogado.TemPermissao(2053, npIncluir, false) or DM.UsuarioLogado.TemPermissao(2065, npIncluir, false) then
   begin


      // Somente deixar incluir um histórico de cobrança, se preencheu alguma informação

      btnIncluir.Enabled := false;

      qyAux.Close;
      qyAux.SQL.Text := ''+
       ' INSERT INTO FIN_COBRANCA_CONTATOS ' +
       '   (CD_COBRANCA, DT_REGISTRO, DT_RETORNO, DS_CONTATO, ' +
       '    CD_USUARIO, SN_RETORNO, NM_CONTATO, DS_TELEFONE) '  +
       ' VALUES (:CD_COBRANCA, NOW(), :DT_RETORNO, :DS_CONTATO, ' +
       '    :CD_USUARIO, :SN_RETORNO, :NM_CONTATO, :DS_TELEFONE)';

      qyAux.ParamByName('CD_COBRANCA').AsInteger := qyCobrancacd_cobranca.AsInteger;
      if ckbRetorno.Checked then
      begin
         qyAux.ParamByName('DT_RETORNO').AsDateTime := dtRetorno.DateTime;
         qyAux.ParamByName('SN_RETORNO').AsInteger := 1;
      end
      else
      begin
         qyAux.ParamByName('DT_RETORNO').Clear;
         qyAux.ParamByName('SN_RETORNO').AsInteger := 0;
      end;
      qyAux.ParamByName('DS_CONTATO').AsString := meHistorico.Lines.Text;
      qyAux.ParamByName('CD_USUARIO').AsInteger := DM.iCdPessoaLogado;
      qyAux.ParamByName('NM_CONTATO').AsString := cbContato.Text;
      qyAux.ParamByName('DS_TELEFONE').AsString := cbTelefone.Text;
      qyAux.ExecSQL;

      // Alterar a situação Atual
      qyAux.Close;
      qyAux.SQL.Text := SQLUpdateCobranca[qyCobrancacd_responsavel.AsString = ''];
      qyAux.ParamByName('CD_SITUACAO').AsInteger := ListaSituacoes[cbSituacaoFinal.ItemIndex + 1];
      if qyAux.Params.FindParam('CD_RESPONSAVEL') <> nil then
         qyAux.ParamByName('CD_RESPONSAVEL').AsInteger := DM.iCdPessoaLogado;
      if ckbRetorno.Checked then
         qyAux.ParamByName('DT_RETORNO').AsDateTime := dtRetorno.DateTime
      else
         qyAux.ParamByName('DT_RETORNO').Clear;
      qyAux.ParamByName('CD_COBRANCA').AsInteger := qyCobrancaCD_COBRANCA.AsInteger;
      qyAux.ExecSQL;

      // Inserir o Histórico nas observações

      if trim(meHistorico.Lines.Text) <> '' then
      begin
         TfObservacoes.RegisterObservation(
            qyCobrancaCD_PESSOA.AsInteger, okFinancial, meHistorico.Lines.Text);
      end;
      meHistorico.Clear;

      // Atualizar Cobranca
      lugar := qyCobranca.GetBookmark();
      qyCobranca.DisableControls();
      filtrar();
      try
         qyCobranca.GotoBookmark(lugar);
      except
      end;
      qyCobranca.EnableControls;
   
      cbTelefone.Text := '';
      cbContato.Text := '';
      ckbRetorno.Checked := false;
      meHistorico.Lines.Clear(); 

      PreencherHistorico();
      Application.ProcessMessages;
      btnIncluir.Enabled := True;

   end
   else
      DM.UsuarioLogado.TemPermissao(2053, npIncluir, true);

   snHistorico := true;
end;

procedure TfrmCobranca.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);
   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
end;

procedure TfrmCobranca.btnCodigoDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

   if resultado_filtro.filtrado Then
   Begin
       txtDepartamento.Text := IntToStr( resultado_filtro.cd_departamento );
   End;
end;

procedure TfrmCobranca.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);
   
   if not resultado_filtro.filtrado then Exit;
  txtTurma.Text := resultado_filtro.cd_turma;
  txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );

end;

procedure TfrmCobranca.btnImprimirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2002, npAcesso, true) then
   begin
      try
         Application.CreateForm(TfrmImpMens, frmImpMens);
         frmImpMens.RecMensalidade.CodigoAluno := tblMensalidadesCodigoAluno.AsInteger;
         frmImpMens.RecMensalidade.CodigoCaixa := tblMensalidadescd_caixa.AsInteger;
         frmImpMens.RecMensalidade.CodigoDepto := tblMensalidadesDepto.AsInteger;
         frmImpMens.RecMensalidade.AnoSemestre := tblMensalidadesAnoSemestre.AsInteger;
         frmImpMens.RecMensalidade.CodigoRecibo := tblMensalidadescd_recibo.AsInteger;
         frmImpMens.RecMensalidade.CodigoColigada := tblMensalidadescd_coligada.AsInteger;
         frmImpMens.RecMensalidade.CodigoSituacao := tblMensalidadesSituacao.AsInteger;
         frmImpMens.RecMensalidade.CodigoMensalidade := tblMensalidadescd_mensalidade.AsInteger;
         frmImpMens.RecMensalidade.CodTurma := tblMensalidadesTurma.AsString;
         frmImpMens.RecMensalidade.NossoNumero := tblMensalidadesNossoNumero.AsString;
         frmImpMens.RecMensalidade.DtVencto := tblMensalidadesDataVencimento.AsDateTime;
         frmImpMens.ShowModal;
      finally
         frmImpMens.Free;
      end;
      Self.Filtrar;
   end;
end;

procedure TfrmCobranca.btnImprimirListaCobrancaClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
   regExpr: TRegExpr;
   condicaoRelatorio, consultaCondicao: String;
   alias: TStringList;
   cd_pessoa_selecionado: Integer;
begin

   cd_pessoa_selecionado := qyCobrancaCD_PESSOA.AsInteger;

   sbAtualizarListaClick(Sender);

   condicaoRelatorio := '';

   regExpr := TRegExpr.Create();
   try
      regExpr.Expression := 'WHERE\s*(.*)\s*GROUP';
      regExpr.ModifierG := True;

      try
         regExpr.Exec(qyCobranca.SQLList.Values[DM.db.Protocol]);

         consultaCondicao := Trim(regExpr.Match[1]);
         
         if consultaCondicao <> '' then
         begin
            consultaCondicao := Concat('(SI.CD_SITUACAO IS NULL OR SI.CD_MODULO = 2053) AND ', consultaCondicao);
         end;

         if Pos('LEFT JOIN MENSALIDADES ME ON', qyCobranca.SQLList.Values[DM.db.Protocol]) = 0 then
         begin
            consultaCondicao := Concat('ME.CD_MENSALIDADE IS NOT NULL AND ', consultaCondicao);
         end;

         condicaoRelatorio := TGeneral.ParseStringParams(consultaCondicao, qyCobranca.Params);

         // Em alguns casos a comparação não consegue substituir a situação
         if(Pos(':CD_SITUACAO',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_SITUACAO', qyCobrancaCD_SITUACAO.AsString ,[rfReplaceAll]);
         end;

         if(Pos(':NR_ANOSEMESTRE',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':NR_ANOSEMESTRE', txtAnoSemestre.Text,[rfReplaceAll]);
         end;

         if(Pos(':CD_PESSOA',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_PESSOA', txtAluno.Text,[rfReplaceAll]);
         end;

         if(Pos(':CD_TURMA',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_TURMA', QuotedStr(txtTurma.Text),[rfReplaceAll]);
         end;

         if(Pos(':CD_CURSO',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_CURSO', QuotedStr(txtCurso.Text),[rfReplaceAll]);
         end;

         if(Pos(':CD_DEPTO',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_DEPTO', txtDepartamento.Text,[rfReplaceAll]);
         end;

         if(Pos(':CD_RESPONSAVEL',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_RESPONSAVEL', IntToStr(ListaResponsaveis[cbResponsavel.ItemIndex]),[rfReplaceAll]);
         end;

         condicaoRelatorio := TGeneral.SQLToCrystalExpression(condicaoRelatorio, SQLToCrystalExpressionReplaceExAlias, SQLToCrystalExpressionReplaceColumnsToInt);

         // IF no
         condicaoRelatorio := StringReplace(condicaoRelatorio, ' if(', ' iif(', [rfReplaceAll, rfIgnoreCase]);

         regExpr.LastError;
      except
      end;
   finally
      regExpr.Free;
   end;

   infoRelatorio := PrincipalForm.GetInfoRpt('repPlanilhaCobranca');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
   begin
      PodeExportar := False;
   end;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, condicaoRelatorio, '', nil, nil, nil, nil, True, False, nil, PodeExportar);

   qyCobranca.Locate('cd_pessoa', cd_pessoa_selecionado, [loCaseInsensitive]);
end;

procedure TfrmCobranca.btnNegociarClick(Sender: TObject);
var
   cobrancaAtual: Pointer;
   frmNegocia   : TfrmNegociacao;
const
   MSG_NEGOCIACAO_FINALIZADA =
      'Negociação finalizada com sucesso!'+ #13 +
      'Não se esqueça de informar o histórico desta ação e ajustar a situação de cobrança.';
begin
   if (not tblMensalidades.IsEmpty) and DM.UsuarioLogado.TemPermissao(2017, npAcesso, true) and (not DM.EstaBloqueado(DataHoje, true)) then
   begin
      Application.CreateForm(TfrmNegociacao, frmNegocia);
      frmNegocia.NomeAluno := tblMensalidadesNomeAluno.AsString;
      frmNegocia.CodigoAluno := tblMensalidadesCodigoAluno.AsInteger;
      frmNegocia.carregaTela;
      if frmNegocia.ShowModal = mrOk then
      begin
         Mensagem(MSG_NEGOCIACAO_FINALIZADA, 'Atenção!', MB_ICONWARNING + MB_OK, Self.Handle);
         Self.pgCobranca.SelectNextPage(true);

         cobrancaAtual:= qyCobranca.GetBookmark();
         
        snNegociou := true;
         try
            qyCobranca.GotoBookmark(cobrancaAtual);
         except
            qyCobranca.First();
         end;
         PreencherTitulos;

      end;
   end;
end;

procedure TfrmCobranca.btnProtestoClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   { Alterar Situação de Matrículas }

   if not DM.UsuarioLogado.TemPermissao( 2018, npIncluir, True ) then Exit;
  
   PosX := btnProtesto.Left + PrincipalForm.Left + 20;
   PosY := pnBotoes.Top + PrincipalForm.Top + 95;

   pmProtestos.Popup(PosX, PosY);
end;

procedure TfrmCobranca.btnVisualizarClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 2018, npAcesso, True ) then Exit;

  {
  if tblMensalidadescd_mensalidade.AsInteger = 0 then begin
    exit;
  end;
  }

  Application.CreateForm( TfrmEmProtesto, frmEmProtesto );

  frmEmProtesto.iAlunoSelecionado := tblMensalidadesCodigoAluno.AsInteger;

  // Não permitir visualizar todos os protestos pela planilha de cobrança
  frmEmProtesto.sbTodos.Visible := false;

  frmEmProtesto.ShowModal;
  
  frmEmProtesto.sbTodos.Visible := true;

  PreencherTitulos();

end;

procedure TfrmCobranca.ckbAteClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.ckbDeClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.ckbPorAnoSemestreClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.ckbResponsavelClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.dtcCobrancaDataChange(Sender: TObject; Field: TField);
begin

   if pgCobranca.ActivePage = tsDadosDevedor then begin

      PreencherDadosPessoais();

   end else if pgCobranca.ActivePage = tsHistorico then begin

      PreencherHistorico();

   end;

end;

procedure TfrmCobranca.dtcContatosDataChange(Sender: TObject; Field: TField);
begin
   bbtnAnexar.Enabled := (qyContatos.State = dsBrowse) and qyContatosBB_ANEXO.IsNull;
   bbtnDelAnexo.Enabled := (qyContatos.State = dsBrowse) and (not qyContatosBB_ANEXO.IsNull);
end;

procedure TfrmCobranca.dtcContatosStateChange(Sender: TObject);
begin
   bbtnAnexar.Enabled := (qyContatos.State = dsBrowse) and qyContatosBB_ANEXO.IsNull;
   bbtnDelAnexo.Enabled := (qyContatos.State = dsBrowse) and (not qyContatosBB_ANEXO.IsNull);
end;

procedure TfrmCobranca.Filtrar;
const
   { INICIO - ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
   S_SQL_FROM_TABELAS = '' +
         'PESSOAS P '+
            'JOIN FIN_COBRANCA CO ON '+
               '(P.CD_PESSOA = CO.CD_PESSOA) '+
               'JOIN SITUACOES SI ON '+
                  '(CO.CD_SITUACAO = SI.CD_SITUACAO) AND '+
                  '(SI.CD_MODULO = 2053) '+
            'LEFT JOIN MENSALIDADES ME ON '+
               '(P.CD_PESSOA = ME.CODIGOALUNO) '+
            'LEFT JOIN TURMAS T ON (ME.turma = T.codigo and me.anosemestre = t.anosemestre) ';
   S_SQL_FROM_TABELAS_MENSALIDADE = '' +
         ' MENSALIDADES ME '+
         ' LEFT JOIN TURMAS T ON (ME.turma = T.codigo and me.anosemestre = t.anosemestre) '+
         ' INNER JOIN FIN_COBRANCA CO ON (CO.CD_PESSOA = ME.CODIGOALUNO) '+
         ' INNER JOIN SITUACOES SI ON (CO.CD_SITUACAO = SI.CD_SITUACAO) AND (SI.CD_MODULO = 2053) '+
         ' INNER JOIN PESSOAS P ON (P.CD_PESSOA = CO.CD_PESSOA) ';
   { FIM - ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
   S_SQL_MYSQL =
      'SELECT '+
         'P.CD_PESSOA,'+
         'P.DS_CARGO as CARGO,'+
         'P.NM_PESSOA,'+
         'R.NM_PESSOA NM_RESP,'+
         'COALESCE(UP.NM_PESSOA, US.NOME) NM_USUARIO,'+
         'SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0)) VL_BRUTO,'+
         'SUM(COALESCE(ME.DESCONTOEXTRA, 0)) VL_DESC_FIXO,'+
         'SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0)) VL_LIQUIDO,'+
         'SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0) + COALESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) - COALESCE(GET_DESCONTOS(ME.CD_MENSALIDADE, NULL), 0)) VL_ATUALIZADO,'+
         'CO.CD_COBRANCA,'+
         'CO.DT_REGISTRO,'+
         'CO.CD_SITUACAO,'+
         'CO.SN_SPC,'+
         'CO.SN_CARTORIO,'+
		   'CO.DT_CARTORIO_INCLUSAO,'+
         'CO.DT_CARTORIO_RETIRADA,'+
         'CO.SN_SERASA,'+
         'CO.DT_SERASA_INCLUSAO,'+
         'CO.DT_SERASA_RETIRADA,'+
         'CO.SN_SERASA SERASA,'+
         'CO.DT_SPC_INCLUSAO,'+
         'CO.DT_SPC_RETIRADA,'+
         'CO.SN_JURIDICO,'+
         'CO.DT_JURIDICO_INCLUSAO,'+
         'CO.DT_JURIDICO_RETIRADA,'+
         'CO.CD_RESPONSAVEL,'+
         'CO.DT_RETORNO,'+
         'SI.DS_VALOR DS_SITUACAO,'+
         'SI.DS_SIGLA,'+
         'MAX(ME.ANOSEMESTRE) ULTIMOANOSEMESTRE,'+
         'MIN(ME.ANOSEMESTRE) PRIMEIROANOSEMESTRE,'+
         'MAX(DATAVENCIMENTO) ULTIMOVENCIMENTO,'+
         'MIN(DATAVENCIMENTO) PRIMEIROVENCIMENTO,'+
         'COUNT(*) QTDTITULOS, '+
         'T.CURSO ' +
      'FROM '+
         ' [$ordem_tabelas$] '+ { ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
            'LEFT JOIN PESSOAS RM ON (RM.CD_PESSOA = ME.CD_RESP) '+
            'LEFT JOIN PESSOAS R ON '+
               '(P.CD_RESP_FINAN = R.CD_PESSOA) '+
               'LEFT JOIN PESSOAS UP ON '+
                  '(CO.CD_RESPONSAVEL = UP.CD_PESSOA) '+
                  'LEFT JOIN USUARIOS US ON '+
                     '(US.CODIGO = UP.CD_PESSOA) '+
      'WHERE '+
         ' ( ME.SITUACAO IN (2 $situacao_ligacao$) ) AND ' +
         ' ( ME.CODIGOALUNO IS NULL OR ME.CD_COLIGADA IN ( %s ) ) ' +
         ' AND ( if(RM.CD_PESSOA IS NOT NULL, RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1, 1 = 1) ) ' +
         ' %s '+
         ' [$planilha_cobranca_filtros_extras$] ' +
      'GROUP BY '+
         'P.CD_PESSOA';

   S_SQL_ORACLE =
      'SELECT '+
         'P.CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(P.DS_CARGO) CARGO,'+
         'FIRST_OCCURRENCE(R.NM_PESSOA) NM_RESP,'+
         'COALESCE(FIRST_OCCURRENCE(UP.NM_PESSOA), FIRST_OCCURRENCE(US.NOME)) NM_USUARIO,'+
         'SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0)) VL_BRUTO,'+
         'SUM(COALESCE(ME.DESCONTOEXTRA, 0)) VL_DESC_FIXO,'+
         'SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0)) VL_LIQUIDO,'+
         'SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0) + COALESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) - COALESCE(GET_DESCONTOS(ME.CD_MENSALIDADE, NULL), 0)) VL_ATUALIZADO,'+
         'CAST(FIRST_OCCURRENCE(CO.CD_COBRANCA) AS NUMBER(19)) CD_COBRANCA,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_REGISTRO) AS TIMESTAMP(2)) DT_REGISTRO,'+
         'CAST(FIRST_OCCURRENCE(CO.CD_SITUACAO) AS NUMBER(19)) CD_SITUACAO,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_SPC) AS NUMBER(4)) SN_SPC,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_SERASA) AS NUMBER(4)) AS SN_SERASA,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_SERASA) AS NUMBER(4)) AS SERASA,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_SPC_INCLUSAO) AS TIMESTAMP(2)) DT_SPC_INCLUSAO,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_SPC_RETIRADA) AS TIMESTAMP(2)) DT_SPC_RETIRADA,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_JURIDICO) AS NUMBER(4)) SN_JURIDICO,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_INCLUSAO) AS TIMESTAMP(2)) DT_JURIDICO_INCLUSAO,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_RETIRADA) AS TIMESTAMP(2)) DT_JURIDICO_RETIRADA,'+
         'CAST(FIRST_OCCURRENCE(CO.CD_RESPONSAVEL) AS NUMBER(19)) CD_RESPONSAVEL,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_RETORNO) AS TIMESTAMP(2)) DT_RETORNO,'+
         'FIRST_OCCURRENCE(SI.DS_VALOR) DS_SITUACAO,'+
         'FIRST_OCCURRENCE(SI.DS_SIGLA) DS_SIGLA,'+
         'CAST(MAX(ANOSEMESTRE) AS NUMBER(5)) ULTIMOANOSEMESTRE,'+
         'CAST(MIN(ANOSEMESTRE) AS NUMBER(5)) PRIMEIROANOSEMESTRE,'+
         'MAX(DATAVENCIMENTO) ULTIMOVENCIMENTO,'+
         'MIN(DATAVENCIMENTO) PRIMEIROVENCIMENTO,'+
         'CAST(COUNT(*) AS NUMBER(19)) QTDTITULOS '+
      'FROM '+
         ' [$ordem_tabelas$] '+ { ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
            'LEFT JOIN PESSOAS RM ON (RM.CD_PESSOA = ME.CD_RESP) '+
            'LEFT JOIN PESSOAS R ON '+
               '(P.CD_RESP_FINAN = R.CD_PESSOA) '+
               'LEFT JOIN USUARIOS US ON '+
                  '(US.CODIGO = CO.CD_RESPONSAVEL) '+
                  'LEFT JOIN PESSOAS UP ON '+
                     '(US.CD_PESSOA = UP.CD_PESSOA) '+
      'WHERE '+
         ' ( ME.SITUACAO IN (2 $situacao_ligacao$)) AND ' +
         ' ( ME.CODIGOALUNO IS NULL OR ME.CD_COLIGADA IN ( %s ) ) ' +
         ' AND ( CASE WHEN RM.CD_PESSOA IS NOT NULL THEN RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
         ' %s '+
         ' [$planilha_cobranca_filtros_extras$] ' +
      'GROUP BY '+
         'P.CD_PESSOA';

   S_FILTRO_DTVENCTO_INFERIOR = 'DATE_FORMAT(ME.DATAVENCIMENTO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_VENCTO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTVENCTO_SUPERIOR = 'DATE_FORMAT(ME.DATAVENCIMENTO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_VENCTO_SUPERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTRETORNO_INFERIOR = 'DATE_FORMAT(CO.DT_RETORNO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_RETORNO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTRETORNO_SUPERIOR = 'DATE_FORMAT(CO.DT_RETORNO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_RETORNO_SUPERIOR, ''%Y-%m-%d'')';

   S_FILTRO_DTPAGAMENTO_INFERIOR = 'DATE_FORMAT(ME.DATAPAGAMENTO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_PAGAMENTO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTPAGAMENTO_SUPERIOR = 'DATE_FORMAT(ME.DATAPAGAMENTO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_PAGAMENTO_SUPERIOR, ''%Y-%m-%d'')';
   
   S_FILTRO_DTVENCTO_PASSADO = 'ME.DATAVENCIMENTO <= NOW()';
   S_FILTRO_ANOSEMESTRE = 'ME.ANOSEMESTRE = :NR_ANOSEMESTRE';
   S_FILTRO_RESPONSAVEL = 'CO.CD_RESPONSAVEL = :CD_RESPONSAVEL';
   S_FILTRO_DEPTO = 'ME.DEPTO = :CD_DEPTO';
   S_FILTRO_CURSO = 'ME.CURSO = :CD_CURSO';
   S_FILTRO_TURMA = 'ME.TURMA = :CD_TURMA';
   S_FILTRO_ALUNORESP = '(P.CD_PESSOA = :CD_PESSOA OR P.CD_RESP_FINAN = :CD_PESSOA)';
   S_FILTRO_ALUNO = 'P.CD_PESSOA = :CD_PESSOA';
   S_FILTRO_RESP = 'P.CD_RESP_FINAN = :CD_PESSOA';
   S_FILTRO_COBRANCA = 'CO.CD_COBRANCA = :CD_COBRANCA';
   S_FILTRO_SITUACAO = 'CO.CD_SITUACAO = :CD_SITUACAO';
   S_FILTRO_SITCOB = '(' + S_FILTRO_SITUACAO + ' OR ' + S_FILTRO_COBRANCA + ')';
   S_FILTRO_JURIDICO = 'CO.SN_JURIDICO = 1';
   S_FILTRO_SPC = 'CO.SN_SPC = 1';
   S_FILTRO_SERASA = 'CO.SN_SERASA = 1';
   S_FILTRO_CARTORIO = 'CO.SN_CARTORIO = 1';
   S_FILTRO_DTINCLUSAO_SERASA = 'DATE_FORMAT(CO.DT_SERASA_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_SERASA, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_SERASA_LIMITE = 'DATE_FORMAT(CO.DT_SERASA_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_SERASAATE, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_SPC = 'DATE_FORMAT(CO.DT_SPC_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_SPC, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_SPC_LIMITE = 'DATE_FORMAT(CO.DT_SPC_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_SPCATE, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_JURIDICO = 'DATE_FORMAT(CO.DT_JURIDICO_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_JURIDICO, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_JURIDICO_LIMITE = 'DATE_FORMAT(CO.DT_JURIDICO_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_JURIDICOATE, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_CARTORIO = 'DATE_FORMAT(CO.DT_CARTORIO_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_CARTORIO, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_CARTORIO_LIMITE = 'DATE_FORMAT(CO.DT_CARTORIO_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_CARTORIOATE, ''%Y-%m-%d'')';
   S_OP = ' AND ';
var
   I: integer;
   LSFiltro: string;
   LParams: TParams;
   IsFiltroMensalidade: Boolean;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

   function GetSQLByProtocol( FiltroMensalidade: Boolean ): string;
   var
      situacoes: String;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_MYSQL;

      // Incluí os filtros extras configurados na tabela parametros que são definidos pelo cliente, o padrão é '' (string vazia)
      Result := StringReplace( Result, '[$planilha_cobranca_filtros_extras$]', DM.variavel_parametro('planilha_cobranca_filtros_extras'), [rfReplaceAll, rfIgnoreCase] );

      if FiltroMensalidade then
      begin
         Result := StringReplace(
            Result,
            '[$ordem_tabelas$]',
            S_SQL_FROM_TABELAS_MENSALIDADE,
            [rfReplaceAll, rfIgnoreCase]
         );
      end   
      else
      begin
         Result := StringReplace(
            Result,
            '[$ordem_tabelas$]',
            S_SQL_FROM_TABELAS,
            [rfReplaceAll, rfIgnoreCase]
         );
      end;         
   end;
begin
   PreencherCobranca;
   IsFiltroMensalidade := False;

   LParams := TParams.Create;
   try
      // Filtrar data de vencimento
      if rbPorVencimento.Checked then
      begin
         if ckbDe.Checked then
         begin
            IsFiltroMensalidade := True;
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_INFERIOR;
            AddParam('DT_VENCTO_INFERIOR', dtpDataInicial.DateTime);
         end;
         if ckbAte.Checked then
         begin
            IsFiltroMensalidade := True;
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_SUPERIOR;
            AddParam('DT_VENCTO_SUPERIOR', dtpDataFinal.DateTime);
         end;
      end
      else if rdbPorRetorno.Checked then
      begin
         if ckbDe.Checked then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTRETORNO_INFERIOR;
            AddParam('DT_RETORNO_INFERIOR', dtpDataInicial.DateTime);
         end;
         if ckbAte.Checked then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTRETORNO_SUPERIOR;
            AddParam('DT_RETORNO_SUPERIOR', dtpDataFinal.DateTime);
         end;
      end;

      if cbDePagamento.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_DTPAGAMENTO_INFERIOR;
         AddParam('DT_PAGAMENTO_INFERIOR', dtpDePagamento.DateTime);
      end;
      
      if cbAtePagamento.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_DTPAGAMENTO_SUPERIOR;
         AddParam('DT_PAGAMENTO_SUPERIOR', dtpAtePagamento.DateTime);
      end;

      // Filtrar ano/semestre
      if ckbPorAnoSemestre.Checked then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ANOSEMESTRE;
         AddParam('NR_ANOSEMESTRE', txtAnoSemestre.Text);
      end;

      // Filtrar responsável
      if ckbResponsavel.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_RESPONSAVEL;
         AddParam('CD_RESPONSAVEL', ListaResponsaveis[cbResponsavel.ItemIndex]);
      end;

      // Filtrar departamento
      if ckbDepartamento.Checked and (txtDepartamento.Text <> '') then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_DEPTO;
         AddParam('CD_DEPTO', txtDepartamento.Text);
      end;

      // Filtrar curso
      if ckbCurso.Checked and (txtCurso.Text <> '') then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_CURSO;
         AddParam('CD_CURSO', txtCurso.Text);
      end;

      // Filtrar turma
      if ckbTurma.Checked and (txtTurma.Text <> '') then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_TURMA;
         AddParam('CD_TURMA', txtTurma.Text);
      end;

      // Filtrar aluno ou reponsável financeiro
      if ckbAluno.Checked and ckbAlunoResponsavel.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ALUNORESP;
         AddParam('CD_PESSOA', txtAluno.Text);
      end
      else if ckbAluno.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ALUNO;
         AddParam('CD_PESSOA', txtAluno.Text);
      end
      else if ckbAlunoResponsavel.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_RESP;
         AddParam('CD_PESSOA', txtAluno.Text);
      end;

      //Filtra por inclusão (SPC/SERASA/JURÍDICO/CARTÓRIO)
      if comboIncluso.ItemIndex > 0 then
      begin

        //SPC
        if comboIncluso.ItemIndex = 1 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_SPC;

           //Data de inclusão DE SPC
           if (cbInclusoDe.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SPC;
              AddParam('DT_SPC', dtInclusoDe.DateTime);
           end;

           //Data de inclusão ATÉ SPC
           if (cbInclusoAte.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SPC_LIMITE;
              AddParam('DT_SPCATE', dtInclusoAte.DateTime);
           end;
        end;

        //Jurídico
        if comboIncluso.ItemIndex = 2 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_JURIDICO;

           //Data de inclusão DE JURÍDICO
           if (cbInclusoDe.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_JURIDICO;
              AddParam('DT_JURIDICO', dtInclusoDe.DateTime);
           end;

           //Data de inclusão ATÉ JURÍDICO
           if (cbInclusoAte.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_JURIDICO_LIMITE;
              AddParam('DT_JURIDICOATE', dtInclusoAte.DateTime);
           end;
        end;

        //SERASA
        if comboIncluso.ItemIndex = 3 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_SERASA;

           //Data de inclusão DE SERASA
           if (cbInclusoDe.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SERASA;
              AddParam('DT_SERASA', dtInclusoDe.DateTime);
           end;

           //Data de inclusão ATÉ SERASA
           if (cbInclusoAte.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SERASA_LIMITE;
              AddParam('DT_SERASAATE', dtInclusoAte.DateTime);
           end;
        end;

        //Cartório
        if comboIncluso.ItemIndex = 4 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_CARTORIO;

           //Data de inclusão DE Cartório
           if (cbInclusoDe.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_CARTORIO;
              AddParam('DT_CARTORIO', dtInclusoDe.DateTime);
           end;

           //Data de inclusão ATÉ Cartório
           if (cbInclusoAte.Checked) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_CARTORIO_LIMITE;
              AddParam('DT_CARTORIOATE', dtInclusoAte.DateTime);
           end;
        end;

      end;

      // Filtrar situação e cobrança
      if cbSituacao.ItemIndex > 0 then
      begin
         if iCobrancaAtual > 0 then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_SITCOB;
            AddParam('CD_COBRANCA', iCobrancaAtual);
         end
         else
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_SITUACAO;
         end;

         AddParam('CD_SITUACAO', ListaSituacoes[cbSituacao.ItemIndex]);
      end;

      // Filtrar jurídico
      if (not FBTodos) and FBApenasJuridico then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_JURIDICO;
      end;

      qyCobranca.Close;
      qyCobranca.SQLList.Values[DM.db.Protocol] :=
         Format(GetSQLByProtocol( IsFiltroMensalidade ), [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltro]);

      qyCobranca.SQLList.Values[DM.db.Protocol] :=
         StringReplace(
            qyCobranca.SQLList.Values[DM.db.Protocol],
            '$situacao_ligacao$',
            getMensalidadesProtesto(cbAtePagamento.Checked or cbDePagamento.Checked),
            [rfReplaceAll, rfIgnoreCase]
         );

      for I := 0 to LParams.Count - 1 do
      begin
         qyCobranca.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      end;
      
   finally
      LParams.Free;
   end;

   qyCobranca.Open;
end;

procedure TfrmCobranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCobranca.FormCreate(Sender: TObject);
begin
   Self.FBTodos := DM.UsuarioLogado.TemPermissao(2053, npAcesso, false);
   Self.FBApenasJuridico := DM.UsuarioLogado.TemPermissao(2065, npAcesso, false);
   pgCobranca.ActivePage := tsLista;

   sbVencidos.Down := true;

   // montar os campos na planilha
   DM.MontarPlanilha(grd, 'planilha_cobranca_campos');

   // Montar a planilha de recebimentos
   DM.MontarPlanilha(grdMensalidades, 'planilha_mensalidades_campos');

   LSCampoOrdem := 'NM_PESSOA';

   grd.Columns.Items[1].Title.Font.Style := [fsUnderline];

   Dm.tblSituacoesFinanceiras.Close();
   DM.tblSituacoesFinanceiras.Open();

   sSituacoes := '2';

   while not DM.tblSituacoesFinanceiras.Eof do begin

     if DM.tblSituacoesFinanceirassn_protesto.AsInteger = 1 then begin

        sSituacoes := sSituacoes + ', ' + DM.tblSituacoesFinanceirascd_situacao.AsString;

     end;

     DM.tblSituacoesFinanceiras.Next();

  end;

end;

procedure TfrmCobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   case Key of
      VK_F7: begin
         if pgCobranca.ActivePage = tsLista then
         begin
            if btnImprimirListaCobranca.Enabled then Self.btnImprimirListaCobrancaClick(nil);
         end
         else if pgCobranca.ActivePage = tsTitulos then
         begin
            if btnImprimir.Enabled then Self.btnImprimirClick(nil);
         end;
      end;
      VK_F8 : begin
         resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

         if resultado_filtro.filtrado then
         begin
            txtAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
            ckbAluno.Checked := true;
            sbAtualizarListaClick(nil);
         end;
      end;
   end;
end;

procedure TfrmCobranca.FormShow(Sender: TObject);
begin
   snNegociou := false;
   snHistorico := false;
   dtpDataInicial.Date := DataHoje;
   dtpDataFinal.Date := DataHoje;

   dtInclusoDe.Date := DataHoje;
   dtInclusoAte.Date := DataHoje;

   dtpDePagamento.Date := DataHoje;
   dtpAtePagamento.Date := DataHoje;

   txtAnoSemestre.text := IntToStr(ano_semestre);
   txtAnoSemestre.Visible := DM.UsaAnosemestre;
   UpDownAnoSem.Visible := txtAnoSemestre.Visible;
   ckbPorAnoSemestre.Visible := txtAnoSemestre.Visible;

   rbPorVencimento.Checked := True;

   PreencherCombos();
   AtivarCampos();
end;

function TfrmCobranca.getMensalidadesProtesto(semProtestoJunto: Boolean): String;
const
   SQL_FILTRO_SITUACOES_PROTESTO =
      ' SELECT ' +
      '     GROUP_CONCAT(cd_situacao) AS situacoes ' +
      '  FROM ' +
      '     situacoes_financeiras ';
var
   qryBuscaSituacoesProtesto: TUMZReadOnlyQuery;
begin
   Result := '';

   DM.CriarConsulta(qryBuscaSituacoesProtesto);
   qryBuscaSituacoesProtesto.SQL.Text := SQL_FILTRO_SITUACOES_PROTESTO;

   if not semProtestoJunto then
   begin
      qryBuscaSituacoesProtesto.SQL.Add(' WHERE sn_protesto = 1 ');
   end;

   qryBuscaSituacoesProtesto.Open;

   if qryBuscaSituacoesProtesto.FieldByName('situacoes').AsString <> '' then
   begin
      Result := ', ' + qryBuscaSituacoesProtesto.FieldByName('situacoes').AsString;
   end;
end;

procedure TfrmCobranca.grdDblClick(Sender: TObject);
begin
   pgCobranca.ActivePage := tsDadosDevedor;
   PreencherDadosPessoais();
end;

procedure TfrmCobranca.grdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   cor : TColor;
   fixRect : TRect;
begin

   if not qyCobranca.IsEmpty() then begin
      fixRect := Rect;
      // Pinta coluna de acordo com situação
         if grd.SelectedRows.CurrentRowSelected then
         begin
            grd.Canvas.Brush.Color:= clBtnShadow;
            grd.Canvas.Font.Color:= clWindowText;
         end else begin
               if (qyCobrancads_sigla.AsString <> '') then
               begin
                  cor := HexColorToDec(qyCobrancads_sigla.AsString);
               end else begin
                  cor := $00000000;
               end;
               grd.Canvas.Font.Color:= clWindowText;
               if( qyCobrancasn_serasa.AsInteger = 1 )then
               begin
                  cor := clYellow;
               end;



            grd.Canvas.Brush.Color:= cor;

         end;
         grd.Canvas.FillRect(Rect);
      //Fecha pintura

      grd.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
   end;
end;


procedure TfrmCobranca.grdTitleClick(Column: TColumn);
var
   I: integer;
begin
   if pgCobranca.ActivePage = tsLista then
   begin
      if LSCampoOrdem = Column.FieldName then
      begin
         if qyCobranca.SortType = stAscending then
            qyCobranca.SortType := stDescending
         else
            qyCobranca.SortType := stAscending;
      end
      else
      begin
         for I := 0 to grd.Columns.Count - 1 do
               grd.Columns.Items[I].Title.Font.Style := [];
         qyCobranca.SortedFields := Column.FieldName;
         qyCobranca.SortType := stAscending;
         Column.Title.Font.Style := [fsUnderline];
         LSCampoOrdem := Column.FieldName;
      end;
   end;
end;

procedure TfrmCobranca.pgCobrancaChange(Sender: TObject);
Var
   lugar : Pointer;
begin
   if ((pgCobranca.ActivePage = tsLista) and
      ((snNegociou = True) or (snHistorico = True))) then
   begin
      // Guardar a posição atual
      lugar := qyCobranca.GetBookmark();
      qyCobranca.DisableControls();
      Self.Filtrar;
      try
         qyCobranca.GotoBookmark(lugar);
      except
      end;
      qyCobranca.EnableControls;
      snNegociou := false;
      snHistorico := false;
   end;

   if pgCobranca.ActivePage = tsDadosDevedor then begin

      PreencherDadosPessoais();

   end else if pgCobranca.ActivePage = tsTitulos then begin

      PreencherTitulos();

   end else if pgCobranca.ActivePage = tsHistorico then begin

      if ( qyCobranca.RecNo > 0 ) then
         PreencherHistorico()
      else begin
         Mensagem( 'Você deve selecionar um registro na guia "LISTA COBRANÇA".', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
         pgCobranca.ActivePage := tsLista;
      end;

   end;

end;

procedure TfrmCobranca.pmProtestosPopup(Sender: TObject);
var
  Item: TMenuItem;
begin

  pmProtestos.Items.Clear;

  Dm.tblSituacoesFinanceiras.Close();
  DM.tblSituacoesFinanceiras.Open();

  while not DM.tblSituacoesFinanceiras.Eof do begin

     if DM.tblSituacoesFinanceirassn_protesto.AsInteger = 1 then begin

        Item := TMenuItem.Create(self);
        
        Item.Caption := DM.tblSituacoesFinanceirasds_situacao.AsString;
        Item.Tag := DM.tblSituacoesFinanceirascd_situacao.AsInteger;
        Item.OnClick := Protestar;

        pmProtestos.Items.Add(Item);

     end;

     DM.tblSituacoesFinanceiras.Next();

  end;
end;

procedure TfrmCobranca.PreencherCobranca;
const
   S_SQL_MYSQL =
      'INSERT IGNORE INTO FIN_COBRANCA (CD_PESSOA, DT_REGISTRO, CD_SITUACAO)' +
      'SELECT ' +
         'P.CD_PESSOA, NOW(), 0 ' +
      'FROM ' +
         'PESSOAS P ' +
            'LEFT JOIN MENSALIDADES ME ON (P.CD_PESSOA = ME.CODIGOALUNO) AND (ME.SITUACAO IN (%s)) ' +
               'LEFT JOIN FIN_COBRANCA CO ON (P.CD_PESSOA = CO.CD_PESSOA)' +
            'LEFT JOIN PESSOAS RM ON (ME.CD_RESP = RM.CD_PESSOA) ' +
      'WHERE ' +
         '( CASE WHEN RM.CD_PESSOA IS NOT NULL THEN RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
         '%s ' +
      'GROUP BY ' +
         'P.CD_PESSOA ' +
      'HAVING ' +
         '(SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0))) > 0 ';

   S_SQL_ORACLE =
      'MERGE INTO FIN_COBRANCA C USING ' +
      '(' +
         'SELECT '+
            'P.CD_PESSOA,' +
            'NOW() DT_REGISTRO,' +
            '0 CD_SITUACAO ' +
         'FROM '+
            'PESSOAS P ' +
               'LEFT JOIN MENSALIDADES ME ON (P.CD_PESSOA = ME.CODIGOALUNO) AND (ME.SITUACAO IN (%s)) ' +
               'LEFT JOIN FIN_COBRANCA CO ON (P.CD_PESSOA = CO.CD_PESSOA)' +
               'LEFT JOIN PESSOAS RM ON (ME.CD_RESP = RM.CD_PESSOA) ' +
         'WHERE ' +
            '( CASE WHEN RM.CD_PESSOA IS NOT NULL THEN RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
            '%s ' +
         'GROUP BY ' +
            'P.CD_PESSOA ' +
         'HAVING ' +
            '(SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0))) > 0 ' +
      ') UP ON ' +
         '(C.CD_PESSOA = UP.CD_PESSOA) ' +
      'WHEN NOT MATCHED THEN '+
         'INSERT (C.CD_PESSOA, C.DT_REGISTRO, C.CD_SITUACAO) ' +
         'VALUES (UP.CD_PESSOA, UP.DT_REGISTRO, UP.CD_SITUACAO)';

   S_FILTRO_DTVENCTO_INFERIOR = 'ME.DATAVENCIMENTO >= :DT_VENCTO_INFERIOR';
   S_FILTRO_DTVENCTO_SUPERIOR = 'ME.DATAVENCIMENTO <= :DT_VENCTO_SUPERIOR';
   S_FILTRO_DTRETORNO_INFERIOR = 'CO.DT_RETORNO >= :DT_RETORNO_INFERIOR';
   S_FILTRO_DTRETORNO_SUPERIOR = 'CO.DT_RETORNO <= :DT_RETORNO_SUPERIOR';
   S_FILTRO_ANOSEMESTRE = 'ME.ANOSEMESTRE = :NR_ANOSEMESTRE';
   S_FILTRO_ALUNO = 'P.CD_PESSOA = :CD_PESSOA';
   S_OP = ' AND ';
var
   I: integer;
   LSFiltro: string;
   LParams: TParams;

   function GetSQLByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_MYSQL;
   end;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   LParams := TParams.Create;
   try
      // Filtrar data de vencimento
      if rbPorVencimento.Checked then
      begin
         if ckbDe.Checked then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_INFERIOR;
            AddParam('DT_VENCTO_INFERIOR', dtpDataInicial.DateTime);
         end;
         if ckbAte.Checked then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_SUPERIOR;
            AddParam('DT_VENCTO_SUPERIOR', dtpDataFinal.DateTime);
         end;
      end
      else if rdbPorRetorno.Checked then
      begin
         if ckbDe.Checked then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTRETORNO_INFERIOR;
            AddParam('DT_RETORNO_INFERIOR', dtpDataInicial.DateTime);
         end;
         if ckbAte.Checked then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTRETORNO_SUPERIOR;
            AddParam('DT_RETORNO_SUPERIOR', dtpDataFinal.DateTime);
         end;
      end;     

      // Filtrar ano/semestre
      if ckbPorAnoSemestre.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ANOSEMESTRE;
         AddParam('NR_ANOSEMESTRE', txtAnoSemestre.Text);
      end;

      // Filtrar aluno
      if ckbAluno.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ALUNO;
         AddParam('CD_PESSOA', txtAluno.Text);
      end;

      qyAux.SQL.Text := Format(GetSQLByProtocol, [sSituacoes, LSFiltro]);
      for I := 0 to LParams.Count - 1 do
         qyAux.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      qyAux.ExecSQL;
   finally
      LParams.Free;
   end;
end;


procedure TfrmCobranca.PreencherCombos;
begin
   // Selecionar os usuários que tem permissão para acessar o módulo de cobrança
   
   qyAux.Close();
   qyAux.SQL.Text :=
      'SELECT DISTINCT ' +
         'US.CD_PESSOA CODIGO,' +
         'US.NM_PESSOA NM_USUARIO ' +
      'FROM ' +
         'PESSOAS US ' +
            'JOIN NU_GRUPOS_PESSOAS NP ON ' +
               '(US.CD_PESSOA = NP.CD_PESSOA) ' +
               'JOIN NU_GRUPOS_PERMISSOES NGP ON ' +
                  '(NP.CD_GRUPO = NGP.CD_GRUPO) ' +
                  'JOIN NU_MODULOS_ACOES NMA ON ' +
                     '(NGP.CD_ACAO = NMA.CD_ACAO) ' +
      'WHERE ' +
         '(US.SN_BLOQUEADO != 1 OR COALESCE(NGP.NR_PERMISSAO, 0) != 0) AND ' +
         'NMA.DS_CHAVE = ''2053'' ' +
      'ORDER BY ' +
         'US.NM_PESSOA';
   qyAux.Open();

   qyAux.FetchAll();
   SetLength(ListaResponsaveis, qyAux.RecordCount);

   cbResponsavel.Clear();
   while not qyAux.Eof do begin

      cbResponsavel.Items.Add(qyAux.FieldByName('nm_usuario').AsString);
      ListaResponsaveis[cbResponsavel.Items.Count - 1] := qyAux.FieldByName('codigo').AsInteger;

      if qyAux.FieldByName('codigo').AsInteger = DM.iCdPessoaLogado then begin
         cbResponsavel.ItemIndex := cbResponsavel.Items.Count - 1;
      end;      

      qyAux.Next();

   end;

   qyAux.Close();

   // Carregar as situações

   qyAux.SQL.Text := '' +
     ' SELECT * FROM situacoes  WHERE cd_modulo = 2053 ' +
     ' ORDER BY ds_valor ';

   qyAux.Open();
   qyAux.FetchAll();

   SetLength(ListaSituacoes, qyAux.RecordCount + 1);

   cbSituacao.Clear();
   cbSituacaoFinal.Clear();
   cbSituacao.Items.Add('(Todas as Situações)');
   ListaSituacoes[0] := -1;

   while not qyAux.Eof do begin

      cbSituacao.Items.Add(qyAux.FieldByName('ds_valor').AsString);
      cbSituacaoFinal.Items.Add(qyAux.FieldByName('ds_valor').AsString);
      ListaSituacoes[cbSituacao.Items.Count-1] := qyAux.FieldByName('cd_situacao').AsInteger;;

      qyAux.Next();
   end;

   qyAux.Close();

   cbSituacao.ItemIndex := 0;

end;

procedure TfrmCobranca.PreencherDadosPessoais;
Var
   i, cd_resp_fin : Integer;
   campoTexto : TComponent;
begin

   if qyCobranca.IsEmpty() then begin

      // Nenhuma pessoa selecionada, zerar campos;

      txtNome.Text            := '';
      txtResponsavel.Text     := '';
      txtCodigoEstudante.Text := '';
      txtCPF.Text             := '';
      meEndereco.Lines.Clear();
      txtContato1.Text        := '';
      txtContato2.Text        := '';
      txtContato3.Text        := '';
      txtContato4.Text        := '';
      txtContato5.Text        := '';
      txtContato6.Text        := '';

      txtSPC.Text             := '';
      txtSPCInclusao.Text     := '';
      txtSPCRetirada.Text     := '';
      txtJuridico.Text        := '';
      txtJurInclusao.Text     := '';
      txtJurRetirada.Text     := '';

      meObservacoes.Lines.Clear();
      meRestritas.Lines.Clear();

      exit;

   end
   else
   begin
      qryDadosDevedor.Close;
      qryDadosDevedor.ParamByName('CD_PESSOA').AsInteger := qyCobrancaCD_PESSOA.AsInteger;
      qryDadosDevedor.Open;

      cd_resp_fin             := qryDadosDevedorCD_RESP_FINAN.AsInteger;
      txtNome.Text            := qryDadosDevedorNM_PESSOA.AsString;
      txtResponsavel.Text     := qryDadosDevedorNM_RESP.AsString;
      txtCodigoEstudante.Text := qryDadosDevedorCD_PESSOA.AsString;
      txtCPF.Text             := qryDadosDevedorDS_CPF.AsString;
      meEndereco.Lines.Text   := qryDadosDevedorDS_ENDERECO.AsString;
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
         'UMFinanceiro.Obs.Financeiro', npAcesso, False) then
         meObservacoes.Lines.Text :=
            TfObservacoes.GetAllObservations(
               qryDadosDevedorCD_PESSOA.AsInteger, okFinancial)
      else
         meObservacoes.Clear;
      iCodEmpresa             := qryDadosDevedorCD_EMPRESA.AsInteger;
      pgOBS.ActivePageIndex := 0;

      if iCodEmpresa <= 0 then
         iCodEmpresa := -1;
      qyEmpresa.Close;
      qyEmpresa.ParamByName('cd_empresa').AsInteger := iCodEmpresa;
      qyEmpresa.Open;

      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
         'UMFinanceiro.Obs.Fin.Restrita', npAcesso, False) then
      begin
         tsRestrita.Visible := true;
         meRestritas.Lines.Text :=
            TfObservacoes.GetAllObservations(
               qryDadosDevedorCD_PESSOA.AsInteger, okRestrict);
      end
      else
      begin
         tsRestrita.Visible := false;
         meRestritas.Clear;
      end;                       

      txtSPC.Text := qyCobrancasn_spc.DisplayText;
      
      if (qyCobrancadt_spc_inclusao.IsNull) then
         txtSPCInclusao.Text := ''
      else
         txtSPCInclusao.Text := FormatDateTime('dd/mm/yyyy', qyCobrancadt_spc_inclusao.AsDateTime);

      if qyCobrancadt_spc_retirada.IsNull then
         txtSPCRetirada.Text := ''
      else
         txtSPCRetirada.Text := FormatDateTime('dd/mm/yyyy', qyCobrancadt_spc_retirada.AsDateTime);

      txtJuridico.Text := qyCobrancasn_juridico.DisplayText;

      if qyCobrancadt_juridico_inclusao.IsNull then
         txtJurInclusao.Text := ''
      else
         txtJurInclusao.Text := FormatDateTime('dd/mm/yyyy', qyCobrancadt_juridico_inclusao.AsDateTime);

      if qyCobrancadt_juridico_retirada.IsNull then
         txtJurRetirada.Text := ''
      else
         txtJurRetirada.Text := FormatDateTime('dd/mm/yyyy', qyCobrancadt_juridico_retirada.AsDateTime);

      txtContato1.Text := '';
      txtContato2.Text := '';
      txtContato3.Text := '';
      txtContato4.Text := '';
      txtContato5.Text := '';
      txtContato6.Text := '';

      // Selecionar os Contatos;

      qryContatosDevedor.Close;
      qryContatosDevedor.ParamByName('CD_PESSOA').AsInteger := qyCobrancaCD_PESSOA.AsInteger;
      qryContatosDevedor.Open;
      
      i := 1;
      qryContatosDevedor.First();
      while not qryContatosDevedor.Eof do begin

        // for n := 0 to Panel2.ControlCount - 1 do begin
           campoTexto := FindComponent('txtContato' + IntToStr(i));
           if (campoTexto <> nil) and (campoTexto is TEdit) then
               TEdit(campoTexto).Text := qryContatosDevedor.FieldByName('ds_contato').AsString;

        // end;

         qryContatosDevedor.Next();
         INC(i);

      end;

      qryContatosDevedor.Close();

      pgOBS.ActivePage := tsDadosDevedor;

   end;

end;

procedure TfrmCobranca.PreencherHistorico();
var n : Integer;
begin
   txtHisNome.Text :=     qyCobrancanm_pessoa.AsString;
   txtHistResponsavel.Text := qyCobrancanm_resp.AsString;

   if qyCobrancaDT_RETORNO.AsString = '' then begin
     // Se não tiver data de retorno registrada ainda para a cobrança
     dtRetorno.Date := DataHoje;
     ckbRetorno.Checked := false;
   end else begin
     // Se já tiver data de retorno selecionada na cobrança, manter a mesma selecionada
     dtRetorno.Date := qyCobrancaDT_RETORNO.AsDateTime;
     ckbRetorno.Checked := true;
   end;

   // Atualizar o histórico de Contatos;
   qyContatos.DisableControls();
   qyContatos.Close();
   qyContatos.Open();

   if qyCobranca.IsEmpty() then begin
      qyContatos.EnableControls();
      Exit;   
   end;

   iCobrancaAtual := qyCobrancacd_cobranca.AsInteger;


   // Preencher os Contatos e Telefones;

   cbTelefone.Clear();
   cbContato.Clear();
   cbTelefone.Text := '';
   cbContato.Text := '';


   while not qyContatos.Eof do begin

      if (cbTelefone.Items.IndexOf(qyContatosds_telefone.AsString) = -1) AND
         (trim(qyContatosds_telefone.AsString) <> '')
      then begin

          cbTelefone.Items.Add(qyContatosds_telefone.AsString);

      end;

      if (cbContato.Items.IndexOf(qyContatosnm_contato.AsString) = -1) AND
         (trim(qyContatosnm_contato.AsString) <> '')
      then begin

          cbContato.Items.Add(qyContatosnm_contato.AsString);

      end;
      
      qyContatos.Next();
   end;

   // Acrescentar como Contatos o responsável e o Aluno
   if (cbContato.Items.IndexOf(qyCobrancanm_pessoa.AsString) = -1) AND
      (trim(qyCobrancanm_pessoa.AsString) <> '')
   then begin
       cbContato.Items.Add(qyCobrancanm_pessoa.AsString);
   end;
   if (cbContato.Items.IndexOf(qyCobrancanm_resp.AsString) = -1) AND
      (trim(qyCobrancanm_resp.AsString) <> '')
   then begin
       cbContato.Items.Add(qyCobrancanm_resp.AsString);
   end;

   // Acrescentar Telefones do cadastro
    qryContatosTel.Close;
    qryContatosTel.ParamByName('CD_PESSOA').AsInteger := qyCobrancaCD_PESSOA.AsInteger;
    qryContatosTel.Open;

    while not qryContatosTel.Eof do begin

       if (cbTelefone.Items.IndexOf(qryContatosTelDS_CONTATO.AsString) = -1)
       then begin
           cbTelefone.Items.Add(qryContatosTelDS_CONTATO.AsString);
       end;

       qryContatosTel.Next;

    end;  

   dtRetorno.Enabled := ckbRetorno.Checked;

   qyContatos.EnableControls();

   // Setar a situação atual;

   for n := 1 to Length( ListaSituacoes ) - 1 do begin

      if ListaSituacoes[n] = qyCobrancacd_situacao.AsInteger then begin

         cbSituacaoFinal.ItemIndex := n - 1 ;

      end;

   end;

   qyContatos.First;


end;

procedure TfrmCobranca.PreencherTitulos;
const
   S_SQL_MENSALIDADES =
      'SELECT '+
         'ME.CD_MENSALIDADE, ME.CODIGOALUNO, ME.PARCELA, ME.DATAVENCIMENTO,' +
         'ME.DT_COMPETENCIA, ME.TURMA, ME.CD_BOLSA, ME.DATAEMISSAO,' +
         'ME.NOSSONUMERO, ME.CD_DESC_CONDICIONAL, ME.VALORBRUTO,' +
         'ME.CD_TIPO_TITULO, ME.VALORDESCONTO, ME.DS_OBS_DESC,' +
         'ME.DESCONTOEXTRA, ME.VALOREXTRA, ME.VALORTOTAL, ME.VALORJUROS,' +
         'ME.VALORJUROS_FIXO, ME.VALORPAGO, ME.VL_FATURAMENTO,' +
         'ME.DATAPAGAMENTO, ME.DT_CREDITO, ME.SITUACAO, ME.USUARIO,' +
         'ME.CD_USUARIO, ME.BLOQUETO, ME.ANOSEMESTRE, ME.DATABASECORRECAO,' +
         'ME.INDICECORRECAO, ME.CURSO, ME.DEPTO, ME.TIPOPARCELA,' +
         'ME.OCORRENCIA_REMESSA, ME.OCORRENCIA_RETORNO,' +
         'ME.SN_CREDITO_PARCELA, ME.NR_CREDITOS, ME.CD_MENSALIDADE_ORIGEM,' +
         'ME.CD_COLIGADA, ME.CD_CENTRO_CUSTO, ME.CD_PLANO_CONTA,' +
         'ME.DS_HISTORICO, ME.SN_LIBERAR_JUROS, ME.SN_LIBERAR_DESCONTOS,' +
         'ME.CD_BOLETO, ME.CD_CAIXA, ME.CD_MOEDA, ME.CD_MOEDA_PGTO,' +
         'ME.VL_PAGO_MOEDA, ME.CD_RESP, ME.CD_ITEM_PLANO, ME.VL_CREDITO,' +
         'ME.CD_RECIBO, ME.NR_NF, ME.CODIGOCARTA, ME.CD_CHEQUE_DEVOLVIDO,' +
         'ME.DS_DEPOSITO, ' +
         'LEFT(ME.DS_OBS_DESC, 150) DS_OBS, PE.NM_PESSOA NOMEALUNO,' +
         'CAST(COALESCE(ME.CD_RESP, PE.CD_RESP_FINAN) AS CHAR(10)) CD_RESP_FINAN,' +
         'RESP.NM_PESSOA NOMERESPONSAVEL, TT.DS_TIPO_TITULO, PC.DS_CONTA,' +
         'CC.DS_CENTRO, BT.DS_BOLSA, MO.DS_SIGLA, MP.DS_SIGLA MOEDAPGTO,' +
         'SF.SN_PROTESTO, AM.DS_ACAO,' +
         'GET_ACRESCIMOS(ME.CD_MENSALIDADE, NOW()) JUROS_CALC,' +
         'GET_DESCONTOS(ME.CD_MENSALIDADE, NOW()) DESCONTO_CALC '+
      'FROM '+
         'MENSALIDADES ME ' +
            'JOIN FIN_MOEDAS MO ON ' +
               '(ME.CD_MOEDA = MO.CD_MOEDA) ' +
            'JOIN SITUACOES_FINANCEIRAS SF ON ' +
               '(ME.SITUACAO = SF.CD_SITUACAO) ' +
            'JOIN PESSOAS PE ON ' +
               '(ME.CODIGOALUNO = PE.CD_PESSOA) ' +
            'LEFT JOIN PESSOAS RESP ON ' +
               '(COALESCE(ME.CD_RESP, PE.CD_RESP_FINAN) = RESP.CD_PESSOA) ' +
            'LEFT JOIN FIN_TIPOS_TITULO TT ON ' +
               '(ME.CD_TIPO_TITULO = TT.CD_TIPO_TITULO) AND ' +
               '(ME.CD_COLIGADA = TT.CD_COLIGADA) ' +
            'LEFT JOIN FIN_PLANO_CONTAS PC ON ' +
               '(ME.CD_PLANO_CONTA = PC.CD_CONTA) AND ' +
               '(ME.CD_COLIGADA = PC.CD_COLIGADA) ' +
            'LEFT JOIN FIN_CENTRO_CUSTOS CC ON ' +
               '(ME.CD_CENTRO_CUSTO = CC.CD_CENTRO) AND ' +
               '(ME.CD_COLIGADA = CC.CD_COLIGADA) ' +
            'LEFT JOIN FIN_BOLSAS_TIPOS BT ON ' +
               '(ME.CD_BOLSA = BT.CD_BOLSA) ' +
            'LEFT JOIN FIN_MOEDAS MP ON ' +
               '(ME.CD_MOEDA_PGTO = MP.CD_MOEDA) ' +
            'LEFT JOIN FIN_ACOES_MOVIMENTO AM ON ' +
               '(ME.CD_DESC_CONDICIONAL = AM.CD_ACAO) AND ' +
               '(AM.CD_TIPO_ACAO = 3) AND ' +
               '(AM.CD_ORIGEM = 1) ' +
      'WHERE ' +
         'ME.CODIGOALUNO = :CD_PESSOA '+
         ' AND ( CASE WHEN RESP.CD_PESSOA IS NOT NULL THEN RESP.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
         ' %s ' +

      'ORDER BY ' +
         'ME.DATAVENCIMENTO,' +
         'ME.PARCELA';

   S_OP = ' AND ';
   S_FILTRO_PENDENTES = '(ME.SITUACAO = 2 OR SF.SN_PROTESTO = 1)';
   S_FILTRO_VENCIDOS = S_FILTRO_PENDENTES + S_OP + 'ME.DATAVENCIMENTO <= :DT_VENCTO';
   S_FILTRO_PAGOS = 'ME.SITUACAO IN (0, 1)';
   S_FILTRO_NEGOCIADOS = 'ME.SITUACAO = 3';
   S_FILTRO_CANCELADOS = 'ME.SITUACAO IN (4, 5, 6, 7, 8, 9)';
var
   LSFiltro : String;
begin
   txtTituloNome.Text := qyCobrancaNM_PESSOA.AsString;
   txtTituloResponsa.Text := qyCobrancaNM_RESP.AsString;
   if not qyCobranca.IsEmpty then
   begin
      tblMensalidades.Close;
      if sbVencidos.Down then
      begin
         LSFiltro := S_FILTRO_VENCIDOS
      end
      else if sbPendentes.Down then
      begin
         LSFiltro := S_FILTRO_PENDENTES
      end
      else if sbPagos.Down then
      begin
         LSFiltro := S_FILTRO_PAGOS
      end
      else if sbNegociados.Down then
      begin
         LSFiltro := S_FILTRO_NEGOCIADOS
      end
      else if sbCancelados.Down then
      begin
         LSFiltro := S_FILTRO_CANCELADOS;
      end;
      if LSFiltro <> '' then LSFiltro := S_OP + LSFiltro;
      tblMensalidades.SQL.Text := Format(S_SQL_MENSALIDADES, [LSFiltro]);
      tblMensalidades.ParamByName('CD_PESSOA').AsInteger := qyCobrancaCD_PESSOA.AsInteger;
      if tblMensalidades.Params.FindParam('DT_VENCTO') <> nil then
         tblMensalidades.ParamByName('DT_VENCTO').AsDateTime := DM.DataAtual;
      tblMensalidades.Open;
   end;
end;

procedure TfrmCobranca.Protestar(Sender: TObject);
begin

  if tblMensalidadesSituacao.AsInteger <> 2 then
  begin
    Mensagem( 'Selecione uma mensalidade pendente para utilizar este recurso.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

  if Mensagem('Deseja colocar a mensalidade na lista de mensalidades protestadas?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
  <> mrYes Then Exit;


  Application.CreateForm( TfrmEmProtesto, frmEmProtesto );

  with frmEmProtesto do
  begin

    tblEmProtesto.Close;
    tblEmProtesto.SQL.Clear;
    tblEmProtesto.SQL.Add( 'select * from EmProtesto where' );
    tblEmProtesto.SQL.Add( 'DataEmissao = :DataEmissao' );
    tblEmProtesto.ParamByName('DataEmissao').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
    tblEmProtesto.Open;

    tblEmProtesto.Append;
    tblEmProtestoCodigoAluno.AsInteger := tblMensalidadesCodigoAluno.AsInteger;
    tblEmProtestoTurma.AsString := tblMensalidadesTurma.AsString;
    tblEmProtestoParcela.AsInteger := tblMensalidadesParcela.AsInteger;
    tblEmProtestoDataVencimento.AsString := DateToStr(tblMensalidadesDataVencimento.AsDateTime);
    tblEmProtestoUsuario.AsString := DM.sLogin;
    tblEmProtestoGerado.AsString := 'N';
    tblEmProtestoValor.Value := tblMensalidadesValorTotalCalc.Value;
    tblEmProtestoNossoNumero.AsString := tblMensalidadesNossoNumero.AsString;
    tblEmProtestocd_mensalidade.AsString := tblMensalidadescd_mensalidade.AsString;
    tblEmProtesto.Post;

    DM.tblMensalidades.Close;
    DM.tblMensalidades.SQL.Clear;
    DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
    DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade)' );
    DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
    DM.tblMensalidades.Open;

    DM.tblMensalidades.Edit;

    Dm.tblMensalidadesSituacao.AsInteger := TMenuItem(Sender).Tag; { EM PROTESTO - conforme situação }
    Dm.tblMensalidadesValorTotal.Value := tblMensalidadesValorTotalCalc.Value;
    Dm.tblMensalidades.Post;

    DM.FazAcaoRemessa(arProtestar, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);

    PreencherTitulos();

    Mensagem('Para visualizar as mensalidades protestadas use o botão Visualizar Prot.', 'Informação', MB_OK + MB_ICONINFORMATION)
      
  end;
end;

procedure TfrmCobranca.qyCobrancaAfterOpen(DataSet: TDataSet);
begin
   if (qyCobranca.RecordCount = 0) then
   begin
      grd.ReadOnly := True;
      grd.Enabled := False;
   end
   else
   begin
      grd.ReadOnly := False;
      grd.Enabled := True;
   end;
end;

procedure TfrmCobranca.qyCobrancaCalcFields(DataSet: TDataSet);
begin
   if qyCobranca.FieldByName('SN_SERASA').AsInteger = 1 then
   begin
      qyCobrancaDS_SERASA.AsString := 'SIM';
   end
   else
   begin
      qyCobrancaDS_SERASA.AsString := 'NÃO';   
   end;


end;

procedure TfrmCobranca.qyCobrancasn_cartorioGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';          
end;

procedure TfrmCobranca.qyCobrancasn_juridicoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
end;

procedure TfrmCobranca.qyCobrancasn_serasaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
end;

procedure TfrmCobranca.qyCobrancasn_spcGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
   
end;

procedure TfrmCobranca.rbPorVencimentoClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.sbSelecionarColunaClick(Sender: TObject);
begin
   // Selecionar outros campos

   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grd, 'planilha_cobranca_campos');

end;

procedure TfrmCobranca.sbTodosClick(Sender: TObject);
begin
   if sbTodos.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbVencidosClick(Sender: TObject);
begin
   if sbVencidos.Down then PreencherTitulos();
end;

function TfrmCobranca.SQLToCrystalExpressionReplaceColumnsToInt(
  ARegExpr: TRegExpr): string;
var
   campo: String;
   valor: Integer;
   listaCampos: TStringList;
begin
   campo := ARegExpr.Match[1];

   listaCampos := TStringList.Create();
   listaCampos.Add('{pessoas_mensalidades_pendentes.anosemestre}');
   listaCampos.Add('{pessoas_mensalidades_pendentes.cd_pessoa}');
   listaCampos.Add('{pessoas_mensalidades_pendentes.cd_resp_finan}');

   if listaCampos.IndexOf(ARegExpr.Match[1]) <> -1 then
   begin
      if (Trim(ARegExpr.Match[3]) <> '') AND TryStrToInt(ARegExpr.Match[3], valor) then
      begin
         Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], Trim(ARegExpr.Match[3]));
      end else begin
         Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], '0');
      end;
   end else begin
      Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], QuotedStr(ARegExpr.Match[3]));
   end;
end;

function TfrmCobranca.SQLToCrystalExpressionReplaceExAlias(
  ARegExpr: TRegExpr): string;
var
   alias : TStringList;
begin
   alias := TStringList.Create();
   alias.Values['CO'] := 'fin_cobranca';
   alias.Values['ME'] := 'pessoas_mensalidades_pendentes';
   alias.Values['P'] := 'pessoas_mensalidades_pendentes';
   alias.Values['R'] := 'resp';
   alias.Values['UP'] := 'resp_cob';
   alias.Values['SI'] := 'situacoes';
   alias.Values['US'] := 'usuarios';
   alias.Values['RM'] := 'resp_mensalidades';

   Result := Concat('{', alias.Values[UpperCase(ARegExpr.Match[1])], '.', LowerCase(ARegExpr.Match[2]), '}');
end;

procedure TfrmCobranca.bbtnAnexarClick(Sender: TObject);
var
   Stream: TStream;
begin
   Application.CreateForm(TfDigitalizaDoc, fDigitalizaDoc);
   if fDigitalizaDoc.ShowModal = mrOk then
   begin
      if not (qyContatos.State in dsEditModes) then
      begin
         qyContatos.Edit;
      end;
      
      Stream := qyContatos.CreateBlobStream(qyContatosBB_ANEXO, bmWrite);
      try
         if fDigitalizaDoc.pgcOpcoes.ActivePageIndex = 0 then
         begin
            fDigitalizaDoc.cimImagem.GetRegion.SaveToStream(Stream);
            qyContatosBB_ANEXO.LoadFromStream(Stream);
         end
         else if fDigitalizaDoc.pgcOpcoes.ActivePageIndex = 1 then
         begin
            qyContatosBB_ANEXO.LoadFromFile(fDigitalizaDoc.PDFPath);
         end;
      finally
         Stream.Free;
      end;
      
      qyContatos.Post;
   end;
   fDigitalizaDoc.Free;
end;

procedure TfrmCobranca.bbtnDelAnexoClick(Sender: TObject);
const
   SConfirmaExclusao = 'Deseja realmente remover o anexo do histórico?';
begin
   if MessageDlg(SConfirmaExclusao, mtConfirmation, [mbYes, mbNo], -1) = mrYes then
   begin
      if not (qyContatos.State in dsEditModes) then
      begin
         qyContatos.Edit;
      end;
      qyContatosBB_ANEXO.Clear;
      qyContatos.Post;
   end;
end;

procedure TfrmCobranca.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
   aba_filtro : AbasFiltroPessoa;
begin

   if ( ckbAluno.Checked ) AND ( ckbAlunoResponsavel.Checked ) then
      aba_filtro := afpPessoa
   else if ( ckbAluno.Checked ) then
      aba_filtro := afpEstudante
   else if ( ckbAlunoResponsavel.Checked ) then
      aba_filtro := afpRespFinanceiro;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], aba_filtro);

   if resultado_filtro.filtrado then
   begin
      if ( resultado_filtro.Aba = afpRespFinanceiro ) then
         txtAluno.Text := IntToStr(resultado_filtro.cd_responsavel)
      else
         txtAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
   end;
end;

procedure TfrmCobranca.tblMensalidadesAfterOpen(DataSet: TDataSet);
begin
   btnImprimir.Enabled := not tblMensalidades.IsEmpty;
end;

procedure TfrmCobranca.tblMensalidadesCalcFields(DataSet: TDataSet);
var
  fDesconto, fJuros: double;

begin

  // Calcular o % do desconto extra
  if tblMensalidadesValorBruto.AsCurrency > 0 then begin
     tblMensalidadesPercDescExtra.AsCurrency := (tblMensalidadesDescontoExtra.AsCurrency / tblMensalidadesValorBruto.AsCurrency * 100);
  end else begin
     tblMensalidadesPercDescExtra.AsString := '';
  end;

  // Calcular o % do desconto condicional
  if tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency> 0 then begin
     tblMensalidadesPercDescCond.AsCurrency := (tblMensalidadesValorDesconto.AsCurrency / (tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency) * 100);
  end else begin
     tblMensalidadesPercDescCond.AsString := '';
  end;

  // Verificar se o Boleto já foi impresso
  if Dm.isTrue(tblMensalidadesBloqueto.AsString) then begin
     tblMensalidadesBloquetoImpresso.AsString := 'X'
  end else begin
     tblMensalidadesBloquetoImpresso.AsString := '';
  end;

  // Apresentar a Situação em TEXTO
  case tblMensalidadesSituacao.AsInteger of
    2 :    Begin
              if ( tblMensalidadesDataVencimento.AsDateTime < (DataHoje) ) then
                 tblMensalidadesDescricaoSituacao.AsString := 'VENC'
              else
                 tblMensalidadesDescricaoSituacao.AsString := Dm.lst_situacao_fin_sigla[2];
           end;
    else   begin
              tblMensalidadesDescricaoSituacao.AsString := Dm.lst_situacao_fin_sigla[tblMensalidadesSituacao.AsInteger];
           end;
  end;

  // CALCULAR O VALORTOTAL

  // Parcelas VENCIDAS
  if ( ( tblMensalidadesSituacao.Value in [ 2, 10 ] ) OR ( DM.lst_situacao_fin_prot[tblMensalidadesSituacao.AsInteger] =1 ) ) then begin

    // PARCELA ZERO NÃO SERÁ CORRIGIDA
    if tblMensalidadesParcela.AsInteger <> 0 then begin

       // Pegar desconto para data de hoje
       fDesconto:= tblMensalidadesdesconto_calc.AsCurrency;

       fJuros:= tblMensalidadesValorJuros.Value + tblMensalidadesjuros_calc.AsCurrency;

       tblMensalidadesValorDescontoCalc.Value := fDesconto;

       // Novo Cálculo, incluindo o Juros pendente
       tblMensalidadesValorTotalCalc.Value := RoundFloat(
             ( tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesDescontoExtra.Value - fDesconto + fJuros) ,2);

       // Novo Juros
       tblMensalidadesValorJurosCalc.Value := RoundFloat(
               tblMensalidadesValorTotalCalc.Value - (
               tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value - fDesconto ), 2 );

    end else begin
       // Parcela ZERO - Não cobrar multa
   	   tblMensalidadesValorTotalCalc.Value := RoundFloat(tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesValorDesconto.Value -
               tblMensalidadesDescontoExtra.Value +
               tblMensalidadesValorJuros.Value, 2 );
	     tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value , 2 );
       tblMensalidadesValorDescontoCalc.Value := RoundFloat( tblMensalidadesValorDesconto.Value , 2 );
    End;
    Exit;

  end else begin

     if (tblMensalidadesSituacao.AsInteger in [0,1,3] ) Then begin
      	  tblMensalidadesValorTotalCalc.Value := RoundFloat( tblMensalidadesValorTotal.Value, 2 )
     end else begin
          tblMensalidadesValorTotalCalc.Value := RoundFloat(tblMensalidadesValorBruto.Value +
                  tblMensalidadesValorExtra.Value -
                  tblMensalidadesValorDesconto.Value -
                  tblMensalidadesDescontoExtra.Value +
                  tblMensalidadesValorJuros.Value, 2 );
     end;

     tblMensalidadesValorDescontoCalc.Value := tblMensalidadesdesconto_calc.AsCurrency;
     tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value, 2 );

  end;

end;


procedure TfrmCobranca.ToolButton2Click(Sender: TObject);
begin
   if ((DM.UsuarioLogado.TemPermissao(2053, npAlterar, false)) or (DM.UsuarioLogado.TemPermissao(2065, npAlterar, false))) AND
      (qyCobranca.RecordCount <> 0) then
   begin
      Application.CreateForm(TfrmCobrancaAltera, frmCobrancaAltera);
      frmCobrancaAltera.iCobranca := qyCobrancacd_cobranca.AsInteger;
      frmCobrancaAltera.ShowModal;
   end
   else
      DM.UsuarioLogado.TemPermissao(2053, npAlterar, true);
end;

procedure TfrmCobranca.tsHistoricoShow(Sender: TObject);
var
   LBPermIncluir: boolean;
begin
   LBPermIncluir :=
      DM.UsuarioLogado.TemPermissao(2053, npIncluir, false) or DM.UsuarioLogado.TemPermissao(2065, npIncluir, false);
   txtHisNome.ReadOnly := not LBPermIncluir;
   txtHistResponsavel.ReadOnly := not LBPermIncluir;
   cbTelefone.Enabled := LBPermIncluir;
   cbContato.Enabled := LBPermIncluir;
   ckbRetorno.Enabled := LBPermIncluir;
   dtRetorno.Enabled := LBPermIncluir;
   meHistorico.ReadOnly := not LBPermIncluir;
   cbSituacaoFinal.Enabled := LBPermIncluir;
end;

procedure TfrmCobranca.sbAtualizarListaClick(Sender: TObject);
begin
   iCobrancaAtual := 0;
   Filtrar();
end;

procedure TfrmCobranca.sbCanceladosClick(Sender: TObject);
begin
   if sbCancelados.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmCobranca.sbNegociadosClick(Sender: TObject);
begin
   if sbNegociados.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbPagosClick(Sender: TObject);
begin
   if sbPagos.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbPendentesClick(Sender: TObject);
begin
   if sbPendentes.Down then PreencherTitulos();
end;

procedure TfrmCobranca.UpDownAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
  { Incremento do AnoSemestre }

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

end;

end.
