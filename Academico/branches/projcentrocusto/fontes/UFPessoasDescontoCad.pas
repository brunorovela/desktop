unit UFPessoasDescontoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
  StdCtrls, Buttons, Mask, DBCtrls, ComCtrls, Grids, DBGrids, CheckLst, DBClient,
  Provider;

type
  TfPessoasDescontoCad = class(TForm)
    qryPessoaDesconto: TUMZQuery;
    qryPessoaDescontoCD_DESCONTO_PESSOA: TLargeintField;
    qryPessoaDescontoCD_PESSOA: TLargeintField;
    qryPessoaDescontoCD_DESCONTO: TLargeintField;
    qryPessoaDescontoVL_ANOSEM_INICIO: TIntegerField;
    qryPessoaDescontoVL_ANOSEM_FIM: TIntegerField;
    qryPessoaDescontoCD_DEPTO: TIntegerField;
    qryPessoaDescontoSN_PRIMEIRA_PARCELA: TStringField;
    qryPessoaDescontoCD_PESSOA_INDICADA: TLargeintField;
    qryPessoaDescontoDT_INICIO: TDateTimeField;
    qryPessoaDescontoDT_FIM: TDateTimeField;
    qryPessoaDescontoVL_PERCENTUAL: TFloatField;
    qryPessoaDescontoNR_PARC_INICIO: TSmallintField;
    qryPessoaDescontoNR_PARC_FIM: TIntegerField;
    qryPessoaDescontoDS_HISTORICO: TStringField;
    qryPessoaDescontoTX_OBSERVACOES: TMemoField;
    qryPessoaDescontoCD_RESPONSAVEL: TIntegerField;
    qryPessoaDescontoTP_DESCONTO: TSmallintField;
    pnlTitulo: TPanel;
    bvlSep1: TBevel;
    pnlBotoes: TPanel;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    bvlSep2: TBevel;
    pnlDados: TScrollBox;
    qryBeneficiado: TUMZReadOnlyQuery;
    dsPessoaDesconto: TDataSource;
    qryBeneficiadoCD_PESSOA: TIntegerField;
    qryBeneficiadoNM_PESSOA: TStringField;
    qryIndicado: TUMZReadOnlyQuery;
    qryIndicadoCD_PESSOA: TIntegerField;
    qryIndicadoNM_PESSOA: TStringField;
    lblNomeBeneficiado: TLabel;
    dbeNomeBeneficiado: TDBEdit;
    dsBeneficiado: TDataSource;
    sbSelBeneficiado: TSpeedButton;
    lblNomeIndicado: TLabel;
    dbeNomeIndicado: TDBEdit;
    dsIndicado: TDataSource;
    sbSelIndicado: TSpeedButton;
    dbrgTipoDesconto: TDBRadioGroup;
    pgcTipoDesconto: TPageControl;
    tbsDesconto: TTabSheet;
    tbsDivisao: TTabSheet;
    qryPlanosDesconto: TUMZReadOnlyQuery;
    qryPlanosDescontoCODIGO: TIntegerField;
    qryPlanosDescontoDESCRICAOPLANO: TStringField;
    qryPlanosDescontoPERCENTUALDESCONTO: TFloatField;
    qryPlanosDescontoVALORDESCONTO: TFloatField;
    qryPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField;
    qryPlanosDescontoSN_CONDICIONAL: TSmallintField;
    qryPlanosDescontoCD_TIPO_DESCONTO: TSmallintField;
    qryPlanosDescontoSN_PRIMEIRA_PARCELA: TStringField;
    qryPessoaDescontoDS_PLANO_DESCONTO: TStringField;
    lblDescPlano: TLabel;
    dblcDescPlano: TDBLookupComboBox;
    qryResponsavelDivisao: TUMZReadOnlyQuery;
    qryResponsavelDivisaoCD_PESSOA: TIntegerField;
    qryResponsavelDivisaoNM_PESSOA: TStringField;
    lblNomeResponsavel: TLabel;
    dbeNomeResponsavel: TDBEdit;
    dsResponsavelDivisao: TDataSource;
    sbSelResponsavel: TSpeedButton;
    qryDepartamentos: TUMZReadOnlyQuery;
    qryDepartamentosCODIGO: TSmallintField;
    qryDepartamentosDESCRICAO: TStringField;
    qryDepartamentosRAZAOSOCIAL: TStringField;
    qryDepartamentosCD_COLIGADA: TIntegerField;
    qryDepartamentosCD_INSTITUICAO: TIntegerField;
    qryPessoaDescontoDS_DEPARTAMENTO: TStringField;
    lblDescDepto: TLabel;
    dblcDescDepto: TDBLookupComboBox;
    lblPercDesconto: TLabel;
    dbePercDesconto: TDBEdit;
    lblHistorico: TLabel;
    dbeHistorico: TDBEdit;
    lblDataInicio: TLabel;
    lblDataFinal: TLabel;
    lblParcInicio: TLabel;
    dbeParcInicio: TDBEdit;
    lblParcFinal: TLabel;
    dbeParcelaFinal: TDBEdit;
    qryTiposTitulo: TUMZReadOnlyQuery;
    qryTposTituloDesc: TUMZQuery;
    qryTposTituloDescCD_DESCONTO_PESSOA: TIntegerField;
    qryTposTituloDescCD_TIPO_TITULO: TSmallintField;
    qryTposTituloDescCD_COLIGADA: TSmallintField;
    lblTiposTitulo: TLabel;
    lblObservacoes: TLabel;
    dbmObservacoes: TDBMemo;
    dsPlanosDesconto: TDataSource;
    dbeDataInicio: TDBEdit;
    dbeDataFinal: TDBEdit;
    qryTiposTituloCD_TIPO_TITULO: TIntegerField;
    qryTiposTituloDS_TIPO_TITULO: TStringField;
    dbgTposTituloDesc: TDBGrid;
    sbExcTipoTitulo: TSpeedButton;
    sbAdcTipoTitulo: TSpeedButton;
    sbLimpaTiposTitulo: TSpeedButton;
    cdsTposTituloDesc: TClientDataSet;
    cdsTposTituloDescCD_DESCONTO_PESSOA: TIntegerField;
    cdsTposTituloDescCD_TIPO_TITULO: TIntegerField;
    cdsTposTituloDescCD_COLIGADA: TIntegerField;
    dspTposTituloDesc: TDataSetProvider;
    dsTiposTituloDesc: TDataSource;
    qryTposTituloDescDS_TIPO_TITULO: TStringField;
    cdsTposTituloDescDS_TIPO_TITULO: TStringField;
    qryVerificaConflito: TUMZReadOnlyQuery;
    qryVerificaConflitoCD_DESCONTO_PESSOA: TLargeintField;
    dblcDescCurso: TDBLookupComboBox;
    Label1: TLabel;
    qryCursos: TUMZReadOnlyQuery;
    qryCursosCD_CURSO: TStringField;
    qryCursosDS_CURSO: TStringField;
    qryPessoaDescontoDS_CURSO: TStringField;
    qryPessoaDescontoCD_CURSO: TStringField;
    sbLimpaCurso: TSpeedButton;
    qryDepartamentosCD_CAIXA: TIntegerField;
    procedure dbePercDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure sbLimpaCursoClick(Sender: TObject);
    procedure dsPessoaDescontoDataChange(Sender: TObject; Field: TField);
    procedure dsPessoaDescontoStateChange(Sender: TObject);
    procedure cdsTposTituloDescAfterPost(DataSet: TDataSet);
    procedure qryPessoaDescontoTP_DESCONTOChange(Sender: TField);
    procedure qryPessoaDescontoCD_RESPONSAVELChange(Sender: TField);
    procedure qryPessoaDescontoNR_PARC_FIMChange(Sender: TField);
    procedure qryPessoaDescontoNR_PARC_INICIOChange(Sender: TField);
    procedure qryPessoaDescontoDT_FIMChange(Sender: TField);
    procedure qryPessoaDescontoDT_INICIOChange(Sender: TField);
    procedure qryPessoaDescontoCD_DEPTOChange(Sender: TField);
    procedure qryPessoaDescontoCD_DESCONTOChange(Sender: TField);
    procedure qryPessoaDescontoCD_PESSOAChange(Sender: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cdsTposTituloDescBeforePost(DataSet: TDataSet);
    procedure qryPessoaDescontoAfterPost(DataSet: TDataSet);
    procedure sbLimpaTiposTituloClick(Sender: TObject);
    procedure sbExcTipoTituloClick(Sender: TObject);
    procedure sbAdcTipoTituloClick(Sender: TObject);
    procedure cdsTposTituloDescNewRecord(DataSet: TDataSet);
    procedure dbrgTipoDescontoChange(Sender: TObject);
    procedure qryPessoaDescontoNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbSelResponsavelClick(Sender: TObject);
    procedure sbSelIndicadoClick(Sender: TObject);
    procedure sbSelBeneficiadoClick(Sender: TObject);
  strict private
      procedure CarregarDepartamentos();

  private
    procedure CarregarCursos;
    { Private declarations }
      function ValidaCampos: Boolean;
      function VerificaIntegridade: Boolean;
  public
    { Public declarations }
  end;

var
  fPessoasDescontoCad: TfPessoasDescontoCad;

implementation

uses
   uFSelecionarPessoa, uDM;

{$R *.dfm}

procedure TfPessoasDescontoCad.CarregarDepartamentos;
const
   SQL_DEPARTAMENTOS =
      ' SELECT D.CODIGO, D.DESCRICAO, D.RAZAOSOCIAL, D.CD_CAIXA, ' +
      '        D.CD_COLIGADA, D.CD_INSTITUICAO ' +
      ' FROM DEPARTAMENTOS D ' +
      ' WHERE D.cd_coligada IN ( %s ) ';
begin
   qryDepartamentos.Close();
   qryDepartamentos.SQL.Text := Format( SQL_DEPARTAMENTOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qryDepartamentos.Open;
end;

procedure TfPessoasDescontoCad.CarregarCursos;
const
   SQL_CURSOS = ' SELECT ' +
                '    cm.cd_curso, cm.ds_curso ' +
                ' FROM ' +
                '    cursos_mestre cm ' +
                '    INNER JOIN cursos_coligadas cc ON ( cm.cd_curso = cc.cd_curso ) ' +
                ' WHERE ' +
                '    cc.cd_depto = %d AND ' +
                '    cc.cd_coligada IN ( %s ) ' +
                ' GROUP BY ' +
                '    cm.cd_curso, ' +
                '    cm.ds_curso ';
begin
   qryCursos.Close();
   qryCursos.SQL.Text := Format( SQL_CURSOS, [qryPessoaDescontoCD_DEPTO.AsInteger, DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qryCursos.Open;
end;

procedure TfPessoasDescontoCad.cdsTposTituloDescAfterPost(DataSet: TDataSet);
begin
   if dbgTposTituloDesc.Color = clInfoBk then
   begin
      dbgTposTituloDesc.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.cdsTposTituloDescBeforePost(DataSet: TDataSet);
begin
   cdsTposTituloDescCD_DESCONTO_PESSOA.AsInteger := qryPessoaDescontoCD_DESCONTO_PESSOA.AsInteger;
end;

procedure TfPessoasDescontoCad.cdsTposTituloDescNewRecord(DataSet: TDataSet);
begin
   cdsTposTituloDescCD_COLIGADA.AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
end;

procedure TfPessoasDescontoCad.dbePercDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfPessoasDescontoCad.dbrgTipoDescontoChange(Sender: TObject);
begin
   pgcTipoDesconto.ActivePageIndex := dbrgTipoDesconto.ItemIndex;
end;

procedure TfPessoasDescontoCad.dsPessoaDescontoDataChange(Sender: TObject;
  Field: TField);
begin
   CarregarCursos();
end;

procedure TfPessoasDescontoCad.dsPessoaDescontoStateChange(Sender: TObject);
begin
   if ((qryPessoaDesconto.State = dsEdit) or (qryPessoaDesconto.State = dsInsert)) then
   begin
      dbmObservacoes.ReadOnly:=false;
   end
   else
   begin
      dbmObservacoes.ReadOnly := true;
   end;
end;

procedure TfPessoasDescontoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if ModalResult = mrOk then
   begin
      qryPessoaDesconto.Post;
   end
   else
   begin
      qryPessoaDesconto.Cancel;
   end;
   Action := caFree;
end;

procedure TfPessoasDescontoCad.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   SMsgCamposObrig = 'Informações obrigatórias para o cadastro da programação de desconto não foram preenchidas.'#13'Prencha os campos destacados para prosseguir.';
   SMsgDadosNSalvos = 'Informações inseridas ou alteradas não foram salvas.'#13'Deseja realmente cancelar a edição do registro?';
begin
   if ModalResult = mrOk then
   begin
      if not ValidaCampos then
      begin
         CanClose := False;
         MessageDlg(SMsgCamposObrig, mtWarning, [mbOK], -1);
      end;
   end
   else
   if ModalResult = mrCancel then
      if qryPessoaDesconto.UpdatesPending then
      begin
         if MessageDlg(SMsgDadosNSalvos, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
         begin
            CanClose := False;
         end;
      end;
end;

procedure TfPessoasDescontoCad.FormCreate(Sender: TObject);
begin
   if qryTiposTitulo.Active then
   begin
      qryTiposTitulo.Close;
   end;
   qryTiposTitulo.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qryTiposTitulo.Open;

   CarregarDepartamentos();

   CarregarCursos();

   qryPlanosDesconto.Open;

   qryBeneficiado.Open;
   qryIndicado.Open;
   qryResponsavelDivisao.Open;
end;

procedure TfPessoasDescontoCad.FormShow(Sender: TObject);
begin
   qryTposTituloDesc.Open;
   cdsTposTituloDesc.Open;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoAfterPost(DataSet: TDataSet);
begin
   cdsTposTituloDesc.DisableControls;
   cdsTposTituloDesc.First;
   
   while not cdsTposTituloDesc.Eof do
   begin
      if cdsTposTituloDescCD_DESCONTO_PESSOA.AsInteger <>
         qryPessoaDescontoCD_DESCONTO_PESSOA.AsInteger then
      begin
         cdsTposTituloDesc.Edit;
         cdsTposTituloDescCD_DESCONTO_PESSOA.AsInteger :=
            qryPessoaDescontoCD_DESCONTO_PESSOA.AsInteger;
      end;
      cdsTposTituloDesc.Next;
   end;

   if cdsTposTituloDesc.State = dsEdit then
   begin
      cdsTposTituloDesc.Post;
   end;

   cdsTposTituloDesc.ApplyUpdates(0);
   cdsTposTituloDesc.EnableControls;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoCD_DEPTOChange(Sender: TField);
begin
   if (not qryPessoaDescontoCD_DEPTO.IsNull) and
      (dblcDescDepto.Color = clInfoBk) then
   begin
      dblcDescDepto.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoCD_DESCONTOChange(Sender: TField);
begin
   if ((not qryPessoaDescontoCD_DESCONTO.IsNull) or
       (qryPessoaDescontoTP_DESCONTO.AsInteger = 2)) and
      (dblcDescPlano.Color = clInfoBk) then
   begin
      dblcDescPlano.Color := clWindow;
   end;

   if not qryPlanosDescontoPERCENTUALDESCONTO.IsNull then
   begin
      qryPessoaDescontoVL_PERCENTUAL.AsFloat :=
         qryPlanosDescontoPERCENTUALDESCONTO.AsFloat;
   end
   else
   begin
      qryPessoaDescontoVL_PERCENTUAL.Clear;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoCD_PESSOAChange(Sender: TField);
begin
   if (not qryPessoaDescontoCD_PESSOA.IsNull) and
      (dbeNomeBeneficiado.Color = clInfoBk) then
   begin
      dbeNomeBeneficiado.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoCD_RESPONSAVELChange(
  Sender: TField);
begin
   if ((not qryPessoaDescontoCD_RESPONSAVEL.IsNull) or
       (qryPessoaDescontoTP_DESCONTO.AsInteger = 2)) and
      (dbeNomeResponsavel.Color = clInfoBk) then
   begin
      dbeNomeResponsavel.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoDT_FIMChange(Sender: TField);
begin
   if (not qryPessoaDescontoDT_FIM.IsNull) and
      (dbeDataFinal.Color = clInfoBk) then
   begin
      dbeDataFinal.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoDT_INICIOChange(Sender: TField);
begin
   if (not qryPessoaDescontoDT_INICIO.IsNull) and
      (dbeDataInicio.Color = clInfoBk) then
   begin
      dbeDataInicio.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoNewRecord(DataSet: TDataSet);
begin
   qryPessoaDescontoTP_DESCONTO.AsInteger := 1;
   pgcTipoDesconto.ActivePageIndex := 0;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoNR_PARC_FIMChange(Sender: TField);
begin
   if (not qryPessoaDescontoNR_PARC_FIM.IsNull) and
      (dbeParcelaFinal.Color = clInfoBk) then
   begin
      dbeParcelaFinal.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoNR_PARC_INICIOChange(
  Sender: TField);
begin
   if (not qryPessoaDescontoNR_PARC_INICIO.IsNull) and
      (dbeParcInicio.Color = clInfoBk) then
   begin
      dbeParcInicio.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.qryPessoaDescontoTP_DESCONTOChange(Sender: TField);
begin
   if ((not qryPessoaDescontoCD_RESPONSAVEL.IsNull) or
       (qryPessoaDescontoTP_DESCONTO.AsInteger = 2)) and
      (dbeNomeResponsavel.Color = clInfoBk) then
   begin
      dbeNomeResponsavel.Color := clWindow;
   end;

   if ((not qryPessoaDescontoCD_DESCONTO.IsNull) or
       (qryPessoaDescontoTP_DESCONTO.AsInteger = 2)) and
      (dblcDescPlano.Color = clInfoBk) then
   begin
      dblcDescDepto.Color := clWindow;
   end;
end;

procedure TfPessoasDescontoCad.sbAdcTipoTituloClick(Sender: TObject);
begin
   cdsTposTituloDesc.Append;
   dbgTposTituloDesc.SetFocus;
end;

procedure TfPessoasDescontoCad.sbExcTipoTituloClick(Sender: TObject);
begin
   cdsTposTituloDesc.Delete;
end;

procedure TfPessoasDescontoCad.sbLimpaCursoClick(Sender: TObject);
begin
   qryPessoaDescontoCD_CURSO.Clear;
end;

procedure TfPessoasDescontoCad.sbLimpaTiposTituloClick(Sender: TObject);
begin
   cdsTposTituloDesc.DisableControls;
   while not cdsTposTituloDesc.IsEmpty do
      cdsTposTituloDesc.Delete;
   cdsTposTituloDesc.EnableControls;
end;

procedure TfPessoasDescontoCad.sbSelBeneficiadoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      qryPessoaDescontoCD_PESSOA.AsInteger := resultado_filtro.cd_pessoa;
      qryBeneficiado.Refresh;
      CarregarCursos();
   end;
end;

procedure TfPessoasDescontoCad.sbSelIndicadoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      qryPessoaDescontoCD_PESSOA_INDICADA.AsInteger := resultado_filtro.cd_pessoa;
      qryIndicado.Refresh;
   end;
end;

procedure TfPessoasDescontoCad.sbSelResponsavelClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpRespFinanceiro);

   if resultado_filtro.filtrado then
   begin
      qryPessoaDescontoCD_RESPONSAVEL.AsInteger := resultado_filtro.cd_pessoa;
      qryResponsavelDivisao.Refresh;
   end;
end;

function TfPessoasDescontoCad.ValidaCampos: Boolean;
begin
   Result := True;

   if qryPessoaDescontoCD_PESSOA.IsNull then
   begin
      Result := False;
      dbeNomeBeneficiado.Color := clInfoBk;
   end;

   if (qryPessoaDescontoTP_DESCONTO.AsInteger = 1) and
      qryPessoaDescontoCD_DESCONTO.IsNull then
   begin
      Result := False;
      dblcDescPlano.Color := clInfoBk;
   end;

   if (qryPessoaDescontoTP_DESCONTO.AsInteger = 2) and
      qryPessoaDescontoCD_RESPONSAVEL.IsNull then
   begin
      Result := False;
      dbeNomeResponsavel.Color := clInfoBk;
   end;

   if qryPessoaDescontoCD_DEPTO.IsNull then
   begin
      Result := False;
      dblcDescDepto.Color := clInfoBk;
   end;
   
   if qryPessoaDescontoDT_INICIO.IsNull then
   begin
      Result := False;
      dbeDataInicio.Color := clInfoBk;
   end;

   if qryPessoaDescontoDT_FIM.IsNull then
   begin
      Result := False;
      dbeDataFinal.Color := clInfoBk;
   end;

   if qryPessoaDescontoNR_PARC_INICIO.IsNull then
   begin
      Result := False;
      dbeParcInicio.Color := clInfoBk;
   end;

   if qryPessoaDescontoNR_PARC_FIM.IsNull then
   begin
      Result := False;
      dbeParcelaFinal.Color := clInfoBk;
   end;

   if cdsTposTituloDesc.IsEmpty then
   begin
      Result := False;
      dbgTposTituloDesc.Color := clInfoBk;
   end;
end;

function TfPessoasDescontoCad.VerificaIntegridade: Boolean;
const
   SMsgPeriodoInvalido = 'A data limite para a aplicação do desconto é inferior à data de início.'#13'Não é possível salvar as modificações.';
   SMsgDataInferior = 'A data limite para a aplicação do desconto é inferior à data de hoje.'#13'Deseja salvar as modificações mesmo assim?';
   SMsgConflitoData = 'Este aluno já possui um desconto programado cujo período de validade possui confito com o período informado.'#13'Não é possível salvar as modificações.';
var
   Hoje: TDateTime;
begin
   Hoje := DM.DataAtual;
   Result := True;

   if qryPessoaDescontoDT_INICIO.AsDateTime > qryPessoaDescontoDT_FIM.AsDateTime then
   begin
      Result := False;
      MessageDlg(SMsgPeriodoInvalido, mtInformation, [mbOK], -1);
   end;

   if Result and (qryPessoaDescontoDT_FIM.AsDateTime < Hoje) then
   begin
      Result := MessageDlg(SMsgDataInferior, mtConfirmation, [mbYes, mbNo], -1) = mrYes;
   end;

   if qryVerificaConflito.Active then
   begin
      qryVerificaConflito.Close;
   end;

   if Result then
   begin
      qryVerificaConflito.ParamByName('CD_PESSOA').AsInteger :=
         qryPessoaDescontoCD_PESSOA.AsInteger;
      qryVerificaConflito.ParamByName('CD_DESCONTO_PESSOA').AsInteger :=
         qryPessoaDescontoCD_DESCONTO_PESSOA.AsInteger;
      qryVerificaConflito.ParamByName('DT_INICIO').AsDate :=
         qryPessoaDescontoDT_INICIO.AsDateTime;
      qryVerificaConflito.ParamByName('DT_FIM').AsDate :=
         qryPessoaDescontoDT_FIM.AsDateTime;
      qryVerificaConflito.Open;

      if not qryVerificaConflito.IsEmpty then
      begin
         Result := False;
         MessageDlg(SMsgConflitoData, mtInformation, [mbOK], -1);
      end;
      qryVerificaConflito.Close;
   end;
end;

end.
