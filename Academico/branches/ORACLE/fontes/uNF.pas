unit uNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, ToolWin, ImgList, StdCtrls,
  Buttons, Mask, DB, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, CheckLst,
  ClassRegistros, UMDateTimePicker;


type
  TFrmNF = class(TForm)
    paCabecalho: TPanel;
    Bevel1: TBevel;
    pcNotas: TPageControl;
    tsNotasEmitidas: TTabSheet;
    tsNovaNota: TTabSheet;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    grdNotas: TDBGrid;
    grdItens: TDBGrid;
    ImageList2: TImageList;
    toolPessoa: TToolBar;
    ToolButton2: TToolButton;
    btnNova: TToolButton;
    ToolBar1: TToolBar;
    btnFiltrar: TToolButton;
    ToolButton4: TToolButton;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ckbDepartamento: TCheckBox;
    ckbCurso: TCheckBox;
    ckbTurma: TCheckBox;
    ckbPessoa: TCheckBox;
    ckbVencimento: TCheckBox;
    ckbPagamento: TCheckBox;
    ckbParcela: TCheckBox;
    txtDepartamento: TEdit;
    txtCurso: TEdit;
    txtTurma: TEdit;
    txtPessoa: TEdit;
    txtParcelaInicio: TEdit;
    Label1: TLabel;
    txtParcelaFim: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnDepartamento: TSpeedButton;
    btnCurso: TSpeedButton;
    btnTurma: TSpeedButton;
    btnPessoa: TSpeedButton;
    GroupBox2: TGroupBox;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtNumeroNotas: TEdit;
    txtTotalTitulos: TEdit;
    txtTotalBruto: TEdit;
    txtTotalBolsas: TEdit;
    txtTotalPago: TEdit;
    btnFechar: TToolButton;
    ToolButton1: TToolButton;
    btnGerarNota: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    ckbAnoSemestre: TCheckBox;
    qyNotas: TUMZQuery;
    qyItens: TUMZQuery;
    dsNotas: TDataSource;
    dsItens: TDataSource;
    qyFiltroTitulos: TUMZQuery;
    qyNotasdt_nf: TDateTimeField;
    qyNotasvl_bruto: TFloatField;
    qyNotasvl_bolsas: TFloatField;
    qyNotasvl_pago: TFloatField;
    qyItensparcela: TSmallintField;
    qyItensdatavencimento: TDateTimeField;
    qyItensdt_competencia: TDateTimeField;
    qyItensturma: TStringField;
    qyItensdataemissao: TDateTimeField;
    qyItensnossonumero: TStringField;
    qyItensvalorbruto: TFloatField;
    qyItenscd_tipo_titulo: TSmallintField;
    qyItensvalordesconto: TFloatField;
    qyItensdescontoextra: TFloatField;
    qyItensvalorextra: TFloatField;
    qyItensvalortotal: TFloatField;
    qyItensvalorjuros: TFloatField;
    qyItensvalorjuros_fixo: TFloatField;
    qyItensvalorpago: TFloatField;
    qyItensdatapagamento: TDateTimeField;
    qyItensdt_credito: TDateTimeField;
    qyItenssituacao: TSmallintField;
    qyItensusuario: TStringField;
    qyItensbloqueto: TStringField;
    qyItensanosemestre: TSmallintField;
    qyItensdatabasecorrecao: TDateTimeField;
    qyItensindicecorrecao: TFloatField;
    qyItenscurso: TStringField;
    qyItensdepto: TSmallintField;
    qyItenstipoparcela: TSmallintField;
    qyItensocorrencia_remessa: TSmallintField;
    qyItensocorrencia_retorno: TSmallintField;
    qyItenssn_credito_parcela: TStringField;
    qyItensnr_creditos: TFloatField;
    qyItenscd_coligada: TSmallintField;
    qyItensds_historico: TStringField;
    qyItensvl_pago_moeda: TFloatField;
    qyItenscd_resp: TIntegerField;
    qyItenscd_bolsa: TIntegerField;
    qyItensvl_credito: TFloatField;
    qyItensNomeAluno: TStringField;
    qyItensNomeResponsavel: TStringField;
    qyItensds_tipo_titulo: TStringField;
    qyItensds_conta: TStringField;
    qyItensds_centro: TStringField;
    qyItensds_bolsa: TStringField;
    qyItensds_sigla: TStringField;
    qyItensMoedaPgto: TStringField;
    sbSelecionarColuna: TSpeedButton;
    ToolButton6: TToolButton;
    Panel5: TPanel;
    ToolButton7: TToolButton;
    ckbData: TCheckBox;
    Label9: TLabel;
    ckbNF: TCheckBox;
    txtNFInicio: TEdit;
    txtNFFim: TEdit;
    Label10: TLabel;
    btnPlay: TSpeedButton;
    btnImprimir: TToolButton;
    popImprimir: TPopupMenu;
    NotaSelecionada1: TMenuItem;
    odasasnotasfiltradas1: TMenuItem;
    btnCancelar: TToolButton;
    qyNotassn_cancelada: TSmallintField;
    cklbTitulos: TCheckListBox;
    Label11: TLabel;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    sbSelecionaColuna1: TSpeedButton;
    qyNotasgrupo_curso: TStringField;
    qyNotasgrupo_turma: TStringField;
    qyNotasfiltro_depto: TSmallintField;
    qyNotasfiltro_curso: TStringField;
    qyNotasfiltro_turma: TStringField;
    qyNotasfiltro_vencimento_inicio: TDateTimeField;
    qyNotasfiltro_vencimento_fim: TDateTimeField;
    qyNotasfiltro_pagamento_inicio: TDateTimeField;
    qyNotasfiltro_pagamento_fim: TDateTimeField;
    qyNotasfiltro_tipo_titulo: TStringField;
    Panel6: TPanel;
    Panel7: TPanel;
    rgAgrupar: TRadioGroup;
    RadioGroup1: TRadioGroup;
    qyItenscd_resp_finan: TStringField;
    ckCompetencia: TCheckBox;
    Label12: TLabel;
    qyNotasnr_nf: TLargeintField;
    qyNotasgrupo_titulo: TLargeintField;
    qyNotasgrupo_pessoa: TLargeintField;
    qyNotasfiltro_anosemestre: TLargeintField;
    qyNotasfiltro_pessoa: TLargeintField;
    qyNotasfiltro_parcela_fim: TLargeintField;
    qyNotasfiltro_parcela_inicio: TLargeintField;
    qyItenscd_mensalidade: TIntegerField;
    qyItenscodigoaluno: TIntegerField;
    qyItenscd_usuario: TLargeintField;
    qyItenscd_mensalidade_origem: TIntegerField;
    qyItenscd_centro_custo: TLargeintField;
    qyItenscd_plano_conta: TLargeintField;
    qyItenscd_boleto: TLargeintField;
    qyItenscd_caixa: TIntegerField;
    qyItenscd_moeda: TLargeintField;
    qyItenscd_moeda_pgto: TLargeintField;
    qyItenscd_recibo: TIntegerField;
    qyItensNR_NF: TLargeintField;
    umdtInicio: TUMDateTimePicker;
    umdtFim: TUMDateTimePicker;
    umdtVencimentoInicio: TUMDateTimePicker;
    umdtVencimentoFim: TUMDateTimePicker;
    umdtPagamentoInicio: TUMDateTimePicker;
    umdtPagamentoFim: TUMDateTimePicker;
    umdtCompetenciaInicio: TUMDateTimePicker;
    umdtCompetenciaFim: TUMDateTimePicker;
    umdtEmissao: TUMDateTimePicker;
    procedure ckCompetenciaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbSelecionaColuna1Click(Sender: TObject);
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qyNotassn_canceladaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure NotaSelecionada1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure ckbNFClick(Sender: TObject);
    procedure ckbDataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure btnGerarNotaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure pcNotasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnFiltrarClick(Sender: TObject);
    procedure ckbPagamentoClick(Sender: TObject);
    procedure ckbVencimentoClick(Sender: TObject);
    procedure ckbParcelaClick(Sender: TObject);
    procedure ckbPessoaClick(Sender: TObject);
    procedure ckbTurmaClick(Sender: TObject);
    procedure ckbCursoClick(Sender: TObject);
    procedure ckbDepartamentoClick(Sender: TObject);
    procedure ckbAnoSemestreClick(Sender: TObject);
    procedure pcNotasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovaClick(Sender: TObject);
    procedure dsNotasDataChange(Sender: TObject; Field: TField);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnPessoaClick(Sender: TObject);
    procedure btnTurmaClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure btnDepartamentoClick(Sender: TObject);
  private
    { Private declarations }
    iDepartamento,
    iPessoa : Integer;
    slTitulos : TStringList;
    FParams: TParams;
    Procedure FiltrarNotas();
    Procedure AtualizarChecks();
    Function FiltrarTitulos() : String;
    Procedure PreencheTitulos();
  public
    { Public declarations }
  end;

var
  FrmNF: TFrmNF;

implementation

uses uFSelecionarDepartamento, uFSelecionarCurso, uFSelecionarTurma, uFSelecionarPessoa, uDM, uUsuario,
  uCamposPlanilhas, Main;

{$R *.dfm}

procedure TFrmNF.btnDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

   if resultado_filtro.filtrado Then
   begin
       txtDepartamento.Text := resultado_filtro.ds_departamento;
       iDepartamento := resultado_filtro.cd_departamento;
   end;
end;

procedure TFrmNF.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TFrmNF.btnFiltrarClick(Sender: TObject);
begin
   FiltrarTitulos();
end;

procedure TFrmNF.btnGerarNotaClick(Sender: TObject);
const
   S_JOIN_MATRICULA_MYSQL = 'JOIN (SELECT CD_MATRICULA_CURSO, CODIGOALUNO, ANOSEMESTRE FROM MATRICULAS GROUP BY CODIGOALUNO, ANOSEMESTRE) MA ON (M.CODIGOALUNO = MA.CODIGOALUNO AND M.ANOSEMESTRE = MA.ANOSEMESTRE)';
   S_JOIN_MATRICULAS_CURSO = 'JOIN MATRICULAS_CURSO MC ON (MA.CD_MATRICULA_CURSO = MC.CD_MATRICULA_CURSO) ';
   S_SQL_UPD_BYTIT = 'UPDATE MENSALIDADES M SET NR_NF = :NR_NF WHERE %s AND M.CD_MENSALIDADE = :CD_MENSALIDADE';
   S_SQL_UPD_BYPES = 'UPDATE MENSALIDADES M SET NR_NF = :NR_NF WHERE %s AND M.CODIGOALUNO = :CD_PESSOA';
   S_SQL_UPD_BYTURMA = 'UPDATE MENSALIDADES M SET NR_NF = :NR_NF WHERE %s AND M.TURMA = :CD_TURMA';
   S_SQL_UPD_BYNOTA = 'UPDATE MENSALIDADES M SET NR_NF = :NR_NF WHERE %s';
   S_SQL_UPD_BYGRADE_MYSQL = 'UPDATE MENSALIDADES M ' + S_JOIN_MATRICULA_MYSQL + S_JOIN_MATRICULAS_CURSO + ' SET M.NR_NF = :NR_NF WHERE %s AND MC.CD_CURSO = :CD_CURSO';
   S_SQL_UPD_BYGRADE_ORACLE =
      'UPDATE MENSALIDADES M SET NR_NF = :NR_NF WHERE EXISTS (SELECT ' +
      'MC.CD_MATRICULA_CURSO FROM (SELECT CAST(FIRST_OCCURRENCE(' +
      'CD_MATRICULA_CURSO) AS NUMBER(19)) CD_MATRICULA_CURSO, CODIGOALUNO, ' +
      'ANOSEMESTRE FROM MATRICULAS GROUP BY CODIGOALUNO, ANOSEMESTRE) MA, ' +
      'MATRICULAS_CURSO MC WHERE M.CODIGOALUNO = MA.CODIGOALUNO AND ' +
      'M.ANOSEMESTRE = MA.ANOSEMESTRE AND MA.CD_MATRICULA_CURSO = ' +
      'MC.CD_MATRICULA_CURSO AND %s AND MC.CD_CURSO = :CD_CURSO)';
   SQLUpdateOracle: array[0..4] of string =
      (S_SQL_UPD_BYTIT, S_SQL_UPD_BYPES, S_SQL_UPD_BYGRADE_ORACLE,
       S_SQL_UPD_BYTURMA, S_SQL_UPD_BYNOTA);
   SQLUpdateMySQL: array[0..4] of string =
      (S_SQL_UPD_BYTIT, S_SQL_UPD_BYPES, S_SQL_UPD_BYGRADE_MYSQL,
       S_SQL_UPD_BYTURMA, S_SQL_UPD_BYNOTA);

   function GetSQLByProtocol(const ItemIndex: integer): string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := SQLUpdateOracle[ItemIndex]
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := SQLUpdateMySQL[ItemIndex];
   end;
var
  sMsg : String;
  qNota : TUMZQuery;
  qUpdate : TUMZQuery;
  sUpdate : String;
  iNroNota : Integer;
  sTitulos, sOp : String;
  i : Integer;
begin
   // Atualizar o filtro;
   if not DM.UsuarioLogado.TemPermissao( 2055, npIncluir, True ) then Exit;

   sUpdate := FiltrarTitulos();

   // Gerar a sequencia de tipos de títulos para gravar na tabela fin_nf
   sTitulos := '';
   sOp := '';
   for i := 0 to cklbTitulos.Count - 1 do begin
      if cklbTitulos.Checked[i] then begin
         sTitulos := sTitulos + sOp + slTitulos.Strings[i];
         sOp := ',';
      end;
   end;

   if qyFiltroTitulos.IsEmpty then begin

      sMsg := 'O filtro não trouxe resultados. Nenhuma nota será gerada. ';
      Mensagem(sMsg, 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);
      exit;

   end;

   sMsg := 'Você está prestes a gerar ' + txtNumeroNotas.Text + ' nota(s), referente a ' + txtTotalTitulos.Text + ' titulo(s), conforme filtro.';
   sMsg := sMsg + CHR(13) + CHR(13) + 'Tem certeza que deseja continuar ?';

   if Mensagem(sMsg, 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then Exit;

   DM.CriarConsulta(qNota);
   DM.CriarConsulta(qUpdate);

   // buscar o último número de nota fiscal

   qNota.SQL.Text := ' SELECT COALESCE(MAX(NR_NF),0) NUMERO FROM FIN_NF ';
   qNota.Open();

   if qNota.FieldByName('NUMERO').AsInteger > 0 then begin

      iNroNota := qNota.FieldByName('NUMERO').AsInteger + 1;

   end else begin

      iNroNota := StrToInt(Dm.variavel_parametro('financeiro_nf_numero_inicial'));
   
   end;

   qNota.SQL.Text := 'INSERT INTO fin_nf (nr_nf, dt_nf, vl_bruto, vl_bolsas, vl_pago, ' +
    ' grupo_curso, grupo_titulo, grupo_pessoa, grupo_turma, ' +
    ' filtro_anosemestre, filtro_depto, filtro_curso, filtro_turma, filtro_pessoa, filtro_parcela_inicio, filtro_parcela_fim, filtro_vencimento_inicio, filtro_vencimento_fim, filtro_pagamento_inicio, filtro_pagamento_fim, filtro_tipo_titulo ) '+
    ' VALUES (:nr_nf, :dt_nf, :vl_bruto, :vl_bolsas, :vl_pago, ' +
    ' :grupo_curso, :grupo_titulo, :grupo_pessoa, :grupo_turma, ' +
    ' :filtro_anosemestre, :filtro_depto, :filtro_curso, :filtro_turma, :filtro_pessoa, :filtro_parcela_inicio, :filtro_parcela_fim, :filtro_vencimento_inicio, :filtro_vencimento_fim, :filtro_pagamento_inicio, :filtro_pagamento_fim, :filtro_tipo_titulo) ';

   // Percorrer a query do filtro para inserir as novas notas fiscais

   while not qyFiltroTitulos.Eof do begin

      qNota.ParamByName('nr_nf').AsInteger := iNroNota;
      qNota.ParamByName('dt_nf').AsDateTime := umdtEmissao.Date;
      qNota.ParamByName('vl_bruto').AsFloat := qyFiltroTitulos.FieldByName('vl_bruto').AsFloat;
      qNota.ParamByName('vl_bolsas').AsFloat := qyFiltroTitulos.FieldByName('vl_bolsa').AsFloat;
      qNota.ParamByName('vl_pago').AsFloat := qyFiltroTitulos.FieldByName('vl_pago').AsFloat;

      qNota.ParamByName('grupo_curso').AsString := '';
      qNota.ParamByName('grupo_titulo').AsString := '';
      qNota.ParamByName('grupo_pessoa').AsString := '';
      qNota.ParamByName('grupo_turma').AsString := ' ';

      case rgAgrupar.ItemIndex of
        0 : qNota.ParamByName('grupo_titulo').AsString := qyFiltroTitulos.FieldByName('cd_mensalidade').AsString;
        1 : qNota.ParamByName('grupo_pessoa').AsString := qyFiltroTitulos.FieldByName('codigoaluno').AsString;
        2 : qNota.ParamByName('grupo_curso').AsString := qyFiltroTitulos.FieldByName('cd_curso').AsString;
        3 : qNota.ParamByName('grupo_turma').AsString := qyFiltroTitulos.FieldByName('turma').AsString;
      end;

      if ckbAnoSemestre.Checked then
         qNota.ParamByName('filtro_anosemestre').AsString := txtAnoSemestre.Text
      else
         qNota.ParamByName('filtro_anosemestre').AsString := '0';
         
      qNota.ParamByName('filtro_depto').AsString := IntTostr(iDepartamento);
      qNota.ParamByName('filtro_curso').AsString := txtCurso.Text;
      qNota.ParamByName('filtro_turma').AsString := txtTurma.Text;
      qNota.ParamByName('filtro_pessoa').AsString := IntToStr(iPessoa);
      qNota.ParamByName('filtro_parcela_inicio').AsString := txtParcelaInicio.Text;
      qNota.ParamByName('filtro_parcela_fim').AsString := txtParcelaFim.Text;

      if ckbVencimento.Checked then begin
         qNota.ParamByName('filtro_vencimento_inicio').AsDateTime := umdtVencimentoInicio.Date;
         qNota.ParamByName('filtro_vencimento_fim').AsDateTime := umdtVencimentoFim.Date;
      end else begin
         qNota.ParamByName('filtro_vencimento_inicio').Clear;
         qNota.ParamByName('filtro_vencimento_fim').Clear;
      end;

      if ckbPagamento.Checked then begin
         qNota.ParamByName('filtro_pagamento_inicio').AsDateTime := umdtPagamentoInicio.Date;
         qNota.ParamByName('filtro_pagamento_fim').AsDateTime := umdtPagamentoFim.Date;
      end else begin
         qNota.ParamByName('filtro_pagamento_inicio').Clear;
         qNota.ParamByName('filtro_pagamento_fim').Clear;
      end;

      qNota.ParamByName('filtro_tipo_titulo').AsString := sTitulos;
      qNota.ExecSQL();

      // Atualizar na tabela de mensalidades;
      qUpdate.SQL.Text := Format(GetSQLByProtocol(rgAgrupar.ItemIndex), [sUpdate]);
      qUpdate.ParamByName('NR_NF').AsInteger := iNroNota;
      case rgAgrupar.ItemIndex of
         0: qUpdate.ParamByName('CD_MENSALIDADE').AsInteger := qyFiltroTitulos.FieldByName('CD_MENSALIDADE').AsInteger;
         1: qUpdate.ParamByName('CD_PESSOA').AsInteger := qyFiltroTitulos.FieldByName('CODIGOALUNO').AsInteger;
         2: qUpdate.ParamByName('CD_CURSO').AsString := qyFiltroTitulos.FieldByName('CD_CURSO').AsString;
         3: qUpdate.ParamByName('CD_TURMA').AsString := qyFiltroTitulos.FieldByName('TURMA').AsString;
      end;
      for i := 0 to FParams.Count - 1 do
         qUpdate.ParamByName(FParams.Items[I].Name).Value := FParams.Items[I].Value;
      qUpdate.ExecSQL;
      INC(iNroNota);
      qyFiltroTitulos.Next();
   
   end;

   sMsg := 'Notas Geradas com sucesso! ';
   Mensagem(sMsg, 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);

   FreeAndNil(qNota);
   FreeAndNil(qUpdate);

end;

procedure TFrmNF.btnNovaClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao( 2055, npIncluir, True ) then
      pcNotas.ActivePage := tsNovaNota;
end;

procedure TFrmNF.AtualizarChecks;
begin
   txtAnoSemestre.Enabled := ckbAnoSemestre.Checked;
   UpDown1.Enabled := ckbAnoSemestre.Checked;

   txtDepartamento.Enabled := ckbDepartamento.Checked;
   btnDepartamento.Enabled := ckbDepartamento.Checked;
   if not ckbDepartamento.Checked then begin
      txtDepartamento.Text := '';
   end;

   txtCurso.Enabled := ckbCurso.Checked;
   btnCurso.Enabled := ckbCurso.Checked;
   if not ckbCurso.Checked then begin
      txtCurso.Text := '';
   end;

   txtTurma.Enabled := ckbTurma.Checked;
   btnTurma.Enabled := ckbTurma.Checked;
   if not ckbTurma.Checked then begin
      txtTurma.Text := '';
   end;

   txtPessoa.Enabled := ckbPessoa.Checked;
   btnPessoa.Enabled := ckbPessoa.Checked;
   if not ckbPessoa.Checked then begin
      txtPessoa.Text := '';
   end;

   txtParcelaInicio.Enabled := ckbParcela.Checked;
   txtParcelaFim.Enabled := ckbParcela.Checked;
   if not ckbParcela.Checked then begin
      txtParcelaInicio.Text := '';
      txtParcelaFim.Text := '';
   end;

   umdtVencimentoInicio.Enabled := ckbVencimento.Checked;
   umdtVencimentoFim.Enabled := ckbVencimento.Checked;

   umdtPagamentoInicio.Enabled := ckbPagamento.Checked;
   umdtPagamentoFim.Enabled := ckbPagamento.Checked;

   umdtCompetenciaInicio.Enabled := ckCompetencia.Checked;
   umdtCompetenciaFim.Enabled := ckCompetencia.Checked;

   umdtInicio.Enabled := ckbData.Checked;
   umdtFim.Enabled := ckbData.Checked;

   txtNFInicio.Enabled := ckbNF.Checked;
   txtNFFim.Enabled := ckbNF.Checked;

   if not ckbNF.Checked then begin
      txtNFInicio.Text := '';
      txtNFFim.Text := '';
   end;      

end;

procedure TFrmNF.btnCancelarClick(Sender: TObject);
Var
   qCanc : TUMZQuery;
begin
  if not DM.UsuarioLogado.TemPermissao( 2055, npExcluir, True ) then Exit;

  if Mensagem('Este procedimento irá cancelar a emissão da nota, desvinculando todos os títulos anexados a ela.' + CHR(13) + CHR(13)+ 'Tem certeza que deseja continuar?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then Exit;

  Dm.CriarConsulta(qCanc);
  qCanc.SQL.Text := ' UPDATE fin_nf SET sn_cancelada = 1 WHERE nr_nf = ' + qyNotasnr_nf.AsString;
  qCanc.ExecSQL();

  qCanc.SQL.Text := ' UPDATE mensalidades SET nr_nf = null WHERE nr_nf = ' + qyNotasnr_nf.AsString;
  qCanc.ExecSQL();

  FreeAndNil(qCanc);

  FiltrarNotas();

end;

procedure TFrmNF.btnCursoClick(Sender: TObject);
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

procedure TFrmNF.btnTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;
   txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
end;

procedure TFrmNF.ckbAnoSemestreClick(Sender: TObject);
begin                                                                  ;
   AtualizarChecks();
end;

procedure TFrmNF.ckbCursoClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbDataClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbDepartamentoClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbNFClick(Sender: TObject);
begin
  AtualizarChecks();
end;

procedure TFrmNF.ckbPagamentoClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbParcelaClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbPessoaClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbTurmaClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckbVencimentoClick(Sender: TObject);
begin
   AtualizarChecks();
end;

procedure TFrmNF.ckCompetenciaClick(Sender: TObject);
begin
   AtualizarChecks;
end;

procedure TFrmNF.dsNotasDataChange(Sender: TObject; Field: TField);
begin
   // Ativar a tabela de Itens

   if not qyNotas.IsEmpty then begin

      qyItens.Close();
      qyItens.SQL.Text :=
       ' SELECT Mensalidades.*, Pessoas.nm_pessoa as NomeAluno, CAST(COALESCE(Mensalidades.cd_resp, Pessoas.cd_resp_finan) AS CHAR(10)) cd_resp_finan, Resp.nm_pessoa as NomeResponsavel, fin_tipos_titulo.ds_tipo_titulo, '  +
       ' fin_plano_contas.ds_conta, fin_centro_custos.ds_centro, fin_bolsas_tipos.ds_bolsa, fin_moedas.ds_sigla, moedas_pgto.ds_sigla MoedaPgto ' +
       ' FROM Mensalidades ' +
       ' INNER JOIN fin_moedas ON (Mensalidades.cd_moeda = fin_moedas.cd_moeda) ' +
       ' INNER JOIN Pessoas ON (Mensalidades.CodigoAluno = Pessoas.cd_pessoa ) LEFT JOIN pessoas Resp ON (COALESCE(Mensalidades.cd_resp, Pessoas.cd_resp_finan) = Resp.cd_pessoa) ' +
       ' LEFT JOIN fin_tipos_titulo ON (Mensalidades.cd_tipo_titulo = fin_tipos_titulo.cd_tipo_titulo AND Mensalidades.cd_coligada = fin_tipos_titulo.cd_coligada) ' +
       ' LEFT JOIN fin_plano_contas ON (Mensalidades.cd_plano_conta = fin_plano_contas.cd_conta AND Mensalidades.cd_coligada = fin_plano_contas.cd_coligada) ' +
       ' LEFT JOIN fin_centro_custos ON (Mensalidades.cd_centro_custo = fin_centro_custos.cd_centro AND Mensalidades.cd_coligada = fin_centro_custos.cd_coligada) ' +
       ' LEFT JOIN fin_bolsas_tipos ON (Mensalidades.cd_bolsa = fin_bolsas_tipos.cd_bolsa) ' +
       ' LEFT JOIN fin_moedas moedas_pgto ON (Mensalidades.cd_moeda_pgto = moedas_pgto.cd_moeda) '+
       ' WHERE Mensalidades.nr_nf = ' + qyNotas.FieldByName('nr_nf').AsString;
      qyItens.Open();
      
   end else begin
      qyItens.Close();
   end;

end;

procedure TFrmNF.FiltrarNotas();
const
   S_SQL_CONSULTA =
      'SELECT '+
         'NR_NF,' +
         'DT_NF,' +
         'VL_BRUTO,' +
         'VL_BOLSAS,' +
         'VL_PAGO,' +
         'SN_CANCELADA,' +
         'GRUPO_CURSO,' +
         'GRUPO_TITULO,' +
         'GRUPO_PESSOA,' +
         'GRUPO_TURMA,' +
         'FILTRO_ANOSEMESTRE,' +
         'FILTRO_DEPTO,' +
         'FILTRO_CURSO,' +
         'FILTRO_TURMA,' +
         'FILTRO_PESSOA,' +
         'FILTRO_PARCELA_INICIO,' +
         'FILTRO_PARCELA_FIM,' +
         'FILTRO_VENCIMENTO_INICIO,' +
         'FILTRO_VENCIMENTO_FIM,' +
         'FILTRO_PAGAMENTO_INICIO,' +
         'FILTRO_PAGAMENTO_FIM,' +
         'FILTRO_TIPO_TITULO ' +
      'FROM ' +
         'FIN_NF ' +
      '%s ' +
      'ORDER BY ' +
         'NR_NF DESC';
   S_OP = ' AND ';
   S_WHERE = ' WHERE ';
   S_FIL_DTNF_ENTRE = 'DT_NF BETWEEN :DT_NF_MENOR AND :DT_NF_MAIOR';
   S_FIL_NRNF_MAIORQUE = 'NR_NF >= :NR_NF_MENOR';
   S_FIL_NRNF_MENORQUE = 'NR_NF <= :NR_NF_MAIOR';
   S_FIL_NRNF_ENTRE = 'NR_NF BETWEEN :NR_NF_MENOR AND :NR_NF_MAIOR';
var
   LParams: TParams;
   LSFiltro: string;
   I: integer;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   LParams := TParams.Create;
   try
      if ckbData.Checked then
      begin
         LSFiltro := S_FIL_DTNF_ENTRE;
         AddParam('DT_NF_MENOR', umdtInicio.Date);
         AddParam('DT_NF_MAIOR', umdtFim.Date);
      end;

      if ckbNF.Checked then
      begin
         if (LSFiltro <> '') and ((txtNFInicio.Text <> '') or (txtNFFim.Text <> '')) then
            LSFiltro := LSFiltro + S_OP;

         if txtNFInicio.Text <> '' then
         begin
            if txtNFFim.Text <> '' then
            begin
               LSFiltro := LSFiltro + S_FIL_NRNF_ENTRE;
               AddParam('NR_NF_MAIOR', txtNFFim.Text);
            end
            else
               LSFiltro := LSFiltro + S_FIL_NRNF_MAIORQUE;
            AddParam('NR_NF_MENOR', txtNFInicio.Text);
         end
         else if txtNFFim.Text <> '' then
         begin
            LSFiltro := LSFiltro + S_FIL_NRNF_MENORQUE;
            AddParam('NR_NF_MAIOR', txtNFFim.Text);
         end;
      end;

      if LSFiltro <> '' then LSFiltro := S_WHERE + LSFiltro;
      qyNotas.Close;
      qyNotas.SQL.Text := Format(S_SQL_CONSULTA, [LSFiltro]);
      for I := 0 to LParams.Count - 1 do
         qyNotas.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
   finally
      LParams.Free;
      LParams := nil;
   end;
   qyNotas.Open;
end;

function TFrmNF.FiltrarTitulos: string;
const
   S_WHERE = ' WHERE %s ';
   S_SELECT = 'SELECT ';
   S_PROJECAO = 'SUM(M.VALORBRUTO) VL_BRUTO, SUM(M.DESCONTOEXTRA) VL_BOLSA, SUM(M.VALORPAGO) VL_PAGO, COUNT(*) QTD ';
   S_FROM = ' FROM MENSALIDADES M ';
   S_JOIN_MATRICULA_MYSQL = 'JOIN (SELECT CD_MATRICULA_CURSO, CODIGOALUNO, ANOSEMESTRE FROM MATRICULAS GROUP BY CODIGOALUNO, ANOSEMESTRE) MA ON (M.CODIGOALUNO = MA.CODIGOALUNO AND M.ANOSEMESTRE = MA.ANOSEMESTRE)';
   S_JOIN_MATRICULA_ORACLE = 'JOIN (SELECT CAST(FIRST_OCCURRENCE(CD_MATRICULA_CURSO) AS NUMBER(19)) CD_MATRICULA_CURSO, CODIGOALUNO, ANOSEMESTRE FROM MATRICULAS GROUP BY CODIGOALUNO, ANOSEMESTRE) MA ON (M.CODIGOALUNO = MA.CODIGOALUNO AND M.ANOSEMESTRE = MA.ANOSEMESTRE)';
   S_JOIN_MATRICULAS_CURSO = 'JOIN MATRICULAS_CURSO MC ON (MA.CD_MATRICULA_CURSO = MC.CD_MATRICULA_CURSO) ';
   S_PROJECAO_GRP_GRD_MYSQL = 'M.CD_MENSALIDADE, M.CODIGOALUNO, MC.CD_CURSO, M.TURMA,';
   S_PROJECAO_GRP_GRD_ORACLE = 'CAST(FIRST_OCCURRENCE(M.CD_MENSALIDADE) AS NUMBER(9)) CD_MENSALIDADE, CAST(FIRST_OCCURRENCE(M.CODIGOALUNO) AS NUMBER(9)) CODIGOALUNO, FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO, FIRST_OCCURRENCE(M.TURMA) TURMA,';
   S_PROJECAO_GRP_MYSQL = 'M.CD_MENSALIDADE, M.CODIGOALUNO, M.CURSO CD_CURSO, M.TURMA,';
   S_PROJECAO_GRP_ORACLE = 'CAST(FIRST_OCCURRENCE(M.CD_MENSALIDADE) AS NUMBER(9)) CD_MENSALIDADE, CAST(FIRST_OCCURRENCE(M.CODIGOALUNO) AS NUMBER(9)) CODIGOALUNO, FIRST_OCCURRENCE(M.CURSO) CD_CURSO, FIRST_OCCURRENCE(M.TURMA) TURMA,';
   S_GROUP_TITULO = 'GROUP BY M.CD_MENSALIDADE ';
   S_GROUP_PESSOA = 'GROUP BY M.CODIGOALUNO ';
   S_GROUP_GRADE = 'GROUP BY MC.CD_CURSO ';
   S_GROUP_TURMA = 'GROUP BY M.TURMA';
   S_SQL_TOTAL = S_SELECT + S_PROJECAO + S_FROM + S_WHERE;
   S_SQL_TOTAL_GRP_MYSQL = S_SELECT + S_PROJECAO + S_FROM + S_JOIN_MATRICULA_MYSQL + S_JOIN_MATRICULAS_CURSO + S_WHERE;
   S_SQL_TOTAL_GRP_ORACLE = S_SELECT + S_PROJECAO + S_FROM + S_JOIN_MATRICULA_ORACLE + S_JOIN_MATRICULAS_CURSO + S_WHERE;
   S_SQL_TITULOS_GRP_TIT_MYSQL = S_SELECT + S_PROJECAO_GRP_MYSQL + S_PROJECAO + S_FROM + S_WHERE + S_GROUP_TITULO;
   S_SQL_TITULOS_GRP_TIT_ORACLE = S_SELECT + S_PROJECAO_GRP_ORACLE + S_PROJECAO + S_FROM + S_WHERE + S_GROUP_TITULO;
   S_SQL_TITULOS_GRP_PES_MYSQL = S_SELECT + S_PROJECAO_GRP_MYSQL + S_PROJECAO + S_FROM + S_WHERE + S_GROUP_PESSOA;
   S_SQL_TITULOS_GRP_PES_ORACLE = S_SELECT + S_PROJECAO_GRP_ORACLE + S_PROJECAO + S_FROM + S_WHERE + S_GROUP_PESSOA;
   S_SQL_TITULOS_GRP_GRD_MYSQL = S_SELECT + S_PROJECAO_GRP_GRD_MYSQL + S_PROJECAO + S_FROM + S_JOIN_MATRICULA_MYSQL + S_JOIN_MATRICULAS_CURSO + S_WHERE + S_GROUP_GRADE;
   S_SQL_TITULOS_GRP_GRD_ORACLE = S_SELECT + S_PROJECAO_GRP_GRD_ORACLE + S_PROJECAO + S_FROM + S_JOIN_MATRICULA_ORACLE + S_JOIN_MATRICULAS_CURSO + S_WHERE + S_GROUP_GRADE;
   S_SQL_TITULOS_GRP_TURMA_MYSQL = S_SELECT + S_PROJECAO_GRP_MYSQL + S_PROJECAO + S_FROM + S_WHERE + S_GROUP_TURMA;
   S_SQL_TITULOS_GRP_TURMA_ORACLE = S_SELECT + S_PROJECAO_GRP_ORACLE + S_PROJECAO + S_FROM + S_WHERE + S_GROUP_TURMA;
   S_SQL_TITULOS_GRP_NOTA = S_SELECT + S_PROJECAO + S_FROM + S_WHERE;
   S_EMPTY = '';
   S_OP_OR = ' OR ';
   S_OP_AND = ' AND ';
   S_FIL_PADRAO = '(M.NR_NF IS NULL OR M.NR_NF = 0) AND (M.SITUACAO NOT IN (4, 5, 6, 7, 8, 10))';
   S_FIL_ANOSEM = 'M.ANOSEMESTRE = :NR_ANOSEMESTRE';
   S_FIL_DEPTO = 'M.DEPTO = :CD_DEPTO';
   S_FIL_CURSO = 'M.CURSO = :CD_CURSO';
   S_FIL_TURMA = 'M.TURMA = :CD_TURMA';
   S_FIL_ALUNO = 'M.CODIGOALUNO = :CODIGOALUNO';
   S_FIL_PARCELA_MAIORQUE = 'M.PARCELA >= :NR_PARCELA_MENOR';
   S_FIL_PARCELA_MENORQUE = 'M.PARCELA <= :NR_PARCELA_MAIOR';
   S_FIL_PARCELA_ENTRE = 'M.PARCELA BETWEEN :NR_PARCELA_MENOR AND :NR_PARCELA_MAIOR';
   S_FIL_DTVENCTO = 'M.DATAVENCIMENTO BETWEEN :DT_VENCTO_MENOR AND :DT_VENCTO_MAIOR AND (M.TIPOPARCELA = 0%s)';
   S_FIL_DTPAGTO = 'M.DATAPAGAMENTO BETWEEN :DT_PGTO_MENOR AND :DT_PGTO_MAIOR';
   S_FIL_SITUACAO = 'M.SITUACAO IN (0, 1)';
   S_FIL_DTCOMP = 'M.DT_COMPETENCIA BETWEEN :DT_COMP_MENOR AND :DT_COMP_MAIOR';
   S_FIL_TIPOTIT = '(M.CD_TIPO_TITULO IN (-1%s)%s)';
   S_FIL_TIPOTIT_INDEF = 'M.CD_TIPO_TITULO IS NULL OR M.CD_TIPO_TITULO = 0';

   SQLTotalMySQL: array[boolean] of string = (S_SQL_TOTAL, S_SQL_TOTAL_GRP_MYSQL);
   SQLTotalOracle: array[boolean] of string = (S_SQL_TOTAL, S_SQL_TOTAL_GRP_ORACLE);

   SQLTitulosMySQL: array[0..4] of string =
      (S_SQL_TITULOS_GRP_TIT_MYSQL, S_SQL_TITULOS_GRP_PES_MYSQL,
       S_SQL_TITULOS_GRP_GRD_MYSQL, S_SQL_TITULOS_GRP_TURMA_MYSQL,
       S_SQL_TITULOS_GRP_NOTA);
   SQLTitulosOracle: array[0..4] of string =
      (S_SQL_TITULOS_GRP_TIT_ORACLE, S_SQL_TITULOS_GRP_PES_ORACLE,
       S_SQL_TITULOS_GRP_GRD_ORACLE, S_SQL_TITULOS_GRP_TURMA_ORACLE,
       S_SQL_TITULOS_GRP_NOTA);
var
   LSFiltro, LSTiposTit, LSTiposTitInd: string;
   I: integer;

   procedure AddParam(const ParamName: string;
      const Value: Variant);
   var
      LParam: TParam;
   begin
      if FParams.FindParam(ParamName) = nil then
      begin
         LParam := FParams.CreateParam(ftUnknown, ParamName, ptUnknown);
         LParam.Value := Value;
         FParams.AddParam(LParam);
      end;
   end;

   function GetSQLTotalByProtocol(const UseGroup: boolean): string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := SQLTotalOracle[UseGroup]
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := SQLTotalMySQL[UseGroup];
   end;

   function GetSQLTitlesByProtocol(const ItemIndex: integer): string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := SQLTitulosOracle[ItemIndex]
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := SQLTitulosMySQL[ItemIndex];
   end;

begin
   { Selecionar filtros
   }
   FParams.Clear;
   LSFiltro := S_FIL_PADRAO;
   
   if ckbAnoSemestre.Checked then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_ANOSEM;
      AddParam('NR_ANOSEMESTRE', txtAnoSemestre.Text);
   end;

   if ckbDepartamento.Checked and (txtDepartamento.Text <> '') then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_DEPTO;
      AddParam('CD_DEPTO', iDepartamento);
   end;

   if ckbCurso.Checked and (txtCurso.Text <> '') then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_CURSO;
      AddParam('CD_CURSO', txtCurso.Text);
   end;

   if ckbTurma.Checked and (txtTurma.Text <> '') then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_TURMA;
      AddParam('CD_TURMA', txtTurma.Text);
   end;

   if ckbPessoa.Checked then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_ALUNO;
      AddParam('CD_PESSOA', iPessoa);
   end;

   if ckbParcela.Checked then
   begin
      if txtParcelaInicio.Text <> '' then
      begin
         if txtParcelaFim.Text <> '' then
         begin
            LSFiltro := LSFiltro + S_OP_AND + S_FIL_PARCELA_ENTRE;
            AddParam('NR_PARCELA_MAIOR', txtParcelaFim.Text);
         end
         else
            LSFiltro := LSFiltro + S_OP_AND + S_FIL_PARCELA_MAIORQUE;
         AddParam('NR_PARCELA_MENOR', txtParcelaFim.Text);
      end
      else if txtParcelaFim.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP_AND + S_FIL_PARCELA_MENORQUE;
         AddParam('NR_PARCELA_MAIOR', txtParcelaFim.Text);
      end;
   end;

   if ckbVencimento.Checked then
   begin
      AddParam('DT_VENCTO_MENOR', umdtVencimentoInicio.Date);
      AddParam('DT_VENCTO_MAIOR', umdtVencimentoFim.Date);
      if ckbPagamento.Checked then
      begin
         LSFiltro := LSFiltro + S_OP_AND + Format(S_FIL_DTVENCTO, [S_OP_OR + S_FIL_DTPAGTO]);
         AddParam('DT_PGTO_MENOR', umdtPagamentoInicio.Date);
         AddParam('DT_PGTO_MAIOR', umdtPagamentoFim.Date);
      end
      else
         LSFiltro := LSFiltro + S_OP_AND + Format(S_FIL_DTVENCTO, [S_EMPTY]);
   end;

   if ckbPagamento.Checked then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_DTPAGTO + S_OP_AND + S_FIL_SITUACAO;
      AddParam('DT_PGTO_MENOR', umdtPagamentoInicio.Date);
      AddParam('DT_PGTO_MAIOR', umdtPagamentoFim.Date);
   end;

   if ckCompetencia.Checked then
   begin
      LSFiltro := LSFiltro + S_OP_AND + S_FIL_DTCOMP;
      AddParam('DT_COMP_MENOR', umdtCompetenciaInicio.Date);
      AddParam('DT_COMP_MAIOR', umdtCompetenciaFim.Date);
   end;

   for I := 1 to cklbTitulos.Count - 1 do
      if cklbTitulos.Checked[I] then
         if LSTiposTit = '' then
            LSTiposTit := ', ' + slTitulos.Strings[I]
         else
            LSTiposTit := LSTiposTit + ', ' + slTitulos.Strings[I];

   if cklbTitulos.Checked[0] then
      LSTiposTitInd := S_OP_OR + S_FIL_TIPOTIT_INDEF;

   LSFiltro := LSFiltro + S_OP_AND + Format(S_FIL_TIPOTIT, [LSTiposTit, LSTiposTitInd]);

   qyFiltroTitulos.Close;
   qyFiltroTitulos.SQL.Text := Format(GetSQLTotalByProtocol(rgAgrupar.ItemIndex = 2), [LSFiltro]);
   for I := 0 to FParams.Count - 1 do
      qyFiltroTitulos.ParamByName(FParams.Items[I].Name).Value := FParams.Items[I].Value;
   qyFiltroTitulos.Open;

   txtTotalTitulos.Text := qyFiltroTitulos.FieldByName('QTD').AsString;
   txtTotalBruto.Text := FloatToStrF(qyFiltroTitulos.FieldByName('VL_BRUTO').AsFloat, ffNumber, 12, 2);
   txtTotalBolsas.Text := FloatToStrF(qyFiltroTitulos.FieldByName('VL_BOLSA').AsFloat, ffNumber, 12, 2);
   txtTotalPago.Text := FloatToStrF(qyFiltroTitulos.FieldByName('VL_PAGO').AsFloat, ffNumber, 12, 2);

   qyFiltroTitulos.Close;
   qyFiltroTitulos.SQL.Text := Format(GetSQLTitlesByProtocol(rgAgrupar.ItemIndex), [LSFiltro]);
   for I := 0 to FParams.Count - 1 do
      qyFiltroTitulos.ParamByName(FParams.Items[I].Name).Value := FParams.Items[I].Value;
   qyFiltroTitulos.Open;
   txtNumeroNotas.Text := IntToStr(qyFiltroTitulos.RecordCount);
   
   Result := LSFiltro;
end;

procedure TFrmNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FParams.Free;
   Action := caFree;
end;

procedure TFrmNF.FormCreate(Sender: TObject);
begin
   FParams := TParams.Create;
   DM.MontarPlanilha(grdNotas, 'planilha_nf2_campos');
   DM.MontarPlanilha(grdItens, 'planilha_nf_campos');

   slTitulos := TStringList.Create();
end;

procedure TFrmNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F2 : begin
                  if pcNotas.ActivePage = tsNotasEmitidas then
                     btnNovaClick( nil )
                  else if pcNotas.ActivePage = tsNovaNota then
                     btnGerarNotaClick( nil );
      end;
              
      VK_F6 : begin
                  if pcNotas.ActivePage = tsNotasEmitidas then
                     btnCancelarClick( nil );
      end;

      VK_F7 : begin
                  if pcNotas.ActivePage = tsNotasEmitidas then
                     btnImprimirClick( nil );
      end;

      VK_F12 : btnFecharClick( nil );
   end;

end;

procedure TFrmNF.FormShow(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2055, npIncluir, false ) then
      pcNotas.ActivePage := tsNotasEmitidas
   else
      pcNotas.ActivePage := tsNovaNota;

   AtualizarChecks();

   PreencheTitulos();

   ckbData.Checked := true;
   umdtInicio.Date := Date;
   umdtFim.Date := Date;

   umdtVencimentoInicio.Date := Date;
   umdtVencimentoFim.Date := Date;
   umdtPagamentoInicio.Date := Date;
   umdtPagamentoFim.Date := Date;
   umdtCompetenciaInicio.Date := Date;
   umdtCompetenciaFim.Date := Date;

   umdtEmissao.Date := Date;
end;

procedure TFrmNF.NotaSelecionada1Click(Sender: TObject);
var
  sFiltro : string;
  sFiltroShow : String;
  slFormulas: TStringList;
  sOp : String;
  sNomeRelatorio: String;
  PodeExportar: Boolean;
  infoRelatorio: ClasseRegistros;
begin
   sFiltro := '';
   sFiltroShow := '';
   sOp := '';

   if TPopupMenu( Sender ).Tag = 1 then begin


      if ckbData.Checked then begin
          sFiltro := sFiltro + sOp + 'ToText({fin_nf.dt_nf}, "yyyyMMdd") >= "' + FormatDateTime('yyyymmdd', umdtInicio.Date) + '" ';
          sOp := ' AND ';
          sFiltro := sFiltro + sOp + 'ToText({fin_nf.dt_nf}, "yyyyMMdd") <= "' + FormatDateTime('yyyymmdd', umdtFim.Date) + '" ';

          sFiltroShow := sFiltroShow + '"DATA = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicio.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFim.Date ) + '" + CHR(13) + ';
      end;

      if ckbNF.Checked then begin
         if txtNFInicio.Text <> '' then begin
             sFiltro := sFiltro + sOp + '{fin_nf.nr_nf} >= ' + txtNFInicio.Text;
             sOp := ' AND ';

         end;
         if txtNFFim.Text <> '' then begin
            sFiltro := sFiltro + sOp + '{fin_nf.nr_nf} <= ' + txtNFFim.Text;
            sOp := ' AND ';
         end;

         sFiltroShow := sFiltroShow + '"Nº NF = DE ' + txtNFInicio.Text + ' ATE ' + txtNFFim.Text + '" + CHR(13) + ';
      end;
   end else begin

      sFiltro := sFiltro + sOp + '{fin_nf.nr_nf} = ' + qyNotasnr_nf.AsString;
      sFiltroShow := sFiltroShow + '"Nº NF = ' + qyNotasnr_nf.AsString + '" + CHR(13) + ';
      
   end;

   sFiltroShow := sFiltroShow + '" "';

   slFormulas := TStringList.Create();
   slFormulas.Add('ds_filtro=' + sFiltroShow);

   infoRelatorio := PrincipalForm.GetInfoRpt('nf_nome_relatorio');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFiltro, '', slFormulas, nil, nil, nil, True, False, nil, PodeExportar);

end;

procedure TFrmNF.pcNotasChange(Sender: TObject);
begin
   if pcNotas.ActivePage = tsNotasEmitidas then begin

      FiltrarNotas();

   end;
end;

procedure TFrmNF.pcNotasChanging(Sender: TObject; var AllowChange: Boolean);
begin
   if not DM.UsuarioLogado.TemPermissao( 2055, npIncluir, True ) then
      AllowChange := False;
end;

procedure TFrmNF.PreencheTitulos;
Var
   qyTipos : TUMZQuery;
begin
   DM.CriarConsulta(qyTipos);
   qyTipos.SQL.Text :=
     ' SELECT                               ' +
     '   cd_tipo_titulo,                    ' +
     '    ds_tipo_titulo                    ' +
     ' FROM                                 ' +
     '    fin_tipos_titulo                  ' +
     ' WHERE                                ' +
     '    ct_tipo_titulo = 1                ' +
     ' ORDER BY                             ' +
     '    ds_tipo_titulo                    ';
   qyTipos.Open();

   cklbTitulos.Clear();
   slTitulos.Clear();

   cklbTitulos.Items.Add('<< Titulos sem tipo definido >>');
   slTitulos.Add('-1');

   while not qyTipos.Eof do begin
        cklbTitulos.Items.Add(qyTipos.FieldByName('ds_tipo_titulo').AsString);
        slTitulos.Add(qyTipos.FieldByName('cd_tipo_titulo').AsString);

        qyTipos.Next();
   end;

   FreeAndNil(qyTipos);

end;

procedure TFrmNF.qyNotassn_canceladaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if Sender.Value = 1 then begin
      Text := 'X';
   end else begin
      Text := '';
   end;
end;

procedure TFrmNF.sbDesmarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (cklbTitulos.Items.Count-1) do
    cklbTitulos.Checked[i] := false;
end;

procedure TFrmNF.sbMarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (cklbTitulos.Items.Count-1) do
    cklbTitulos.Checked[i] := true;

end;

procedure TFrmNF.sbSelecionaColuna1Click(Sender: TObject);
begin
   // Selecionar as colunas
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grdNotas, 'planilha_nf2_campos');
end;

procedure TFrmNF.sbSelecionarColunaClick(Sender: TObject);
begin
   // Selecionar as colunas
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grdItens, 'planilha_nf_campos');
end;

procedure TFrmNF.ToolButton5Click(Sender: TObject);
begin
   close();
end;

procedure TFrmNF.btnImprimirClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   { Alterar Situação de Matrículas }

   PosX := btnImprimir.Left + PrincipalForm.Left + 10;
   PosY := toolPessoa.Top + PrincipalForm.Top + 120;

   popImprimir.Popup(PosX, PosY);
end;

procedure TFrmNF.btnPessoaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      txtPessoa.Text := resultado_filtro.nm_pessoa;
      iPessoa := resultado_filtro.cd_pessoa;
      try
         if ckbAnoSemestre.Checked then
            txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
         if ckbTurma.Checked then
            txtTurma.Text := resultado_filtro.cd_turma;
      except
      End;
   end
   else Exit;
end;

procedure TFrmNF.btnPlayClick(Sender: TObject);
begin
   FiltrarNotas();
end;

procedure TFrmNF.UpDown1Click(Sender: TObject; Button: TUDBtnType);
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

