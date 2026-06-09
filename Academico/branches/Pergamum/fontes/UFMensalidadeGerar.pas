unit UFMensalidadeGerar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, UFMensGerarPessoa, UFMensGerarTurma, StrUtils,
   UFMensGerarCurso, UFMensGerarAnoSem, DB, DBClient, DBCtrls, DateUtils,
   ZAbstractRODataset, UZDataset, Mask, ComCtrls, Buttons, ZDbcIntfs, UZDbcFuncs,
   uClassMovimento, Midas, ZExprParser, UMComboBox, uListaColigadas, uColigada,
  UMDateTimePicker;

type
  TfMensalidadeGerar = class(TForm)
    pnlTitulo: TPanel;
    pnlGeral: TPanel;
    gbFiltros: TGroupBox;
    pnlSelecao: TPanel;
    pnlTipoSelecao: TPanel;
    lblSelecao: TLabel;
    cbSelecao: TComboBox;
    lblTurmaVincular: TLabel;
    cdsTurmas: TClientDataSet;
    cdsTurmasCD_TURMA: TStringField;
    cdsTurmasNR_ANOSEMESTRE: TIntegerField;
    cdsTurmasDS_TURMA: TStringField;
    dsTurmas: TDataSource;
    dblcTurmas: TDBLookupComboBox;
    chkSomenteAtivos: TCheckBox;
    chkAgruparResp: TCheckBox;
    gbInfo: TGroupBox;
    bvlSep2: TBevel;
    qryTiposTitulo: TUMZReadOnlyQuery;
    qryTiposTituloCD_TIPO_TITULO: TIntegerField;
    qryTiposTituloDS_TIPO_TITULO: TStringField;
    qryTiposTituloCD_CONTA: TLargeintField;
    qryTiposTituloVL_PADRAO: TFloatField;
    qryTiposTituloNR_PARCELA: TIntegerField;
    qryCentrosCusto: TUMZReadOnlyQuery;
    qryCentrosCustoCD_CENTRO: TLargeintField;
    qryCentrosCustoDS_CENTRO: TStringField;
    qryPlanosConta: TUMZReadOnlyQuery;
    qryPlanosContaCD_CONTA: TLargeintField;
    qryPlanosContaDS_CONTA: TStringField;
    cdsTitulo: TClientDataSet;
    cdsTituloVL_BRUTO: TCurrencyField;
    cdsTituloVL_EXTRA: TCurrencyField;
    cdsTituloVL_DESCONTO: TCurrencyField;
    cdsTituloVL_DESC_EXTRA: TCurrencyField;
    lblValorBruto: TLabel;
    dbeValorBruto: TDBEdit;
    dsTitulo: TDataSource;
    lblValorExtra: TLabel;
    dbeValorExtra: TDBEdit;
    lblValorDesc: TLabel;
    dbeValorDesc: TDBEdit;
    lblDescExtra: TLabel;
    dbeDescExtra: TDBEdit;
    lblTiposTitulo: TLabel;
    dblcTiposTitulo: TDBLookupComboBox;
    lblCentroCusto: TLabel;
    dblcCentroCustos: TDBLookupComboBox;
    dbeCentro: TDBEdit;
    lblPlanoContas: TLabel;
    dblcPlanos: TDBLookupComboBox;
    dbePlano: TDBEdit;
    lblHistorico: TLabel;
    dbeHistorico: TDBEdit;
    lblParcelaIni: TLabel;
    dbeParcelaIni: TDBEdit;
    lblParcelaFim: TLabel;
    dbeParcelaFim: TDBEdit;
    lblDataVencto: TLabel;
    rgOpcaoVencto: TRadioGroup;
    chkAjustar: TCheckBox;
    chkNaoDuplicar: TCheckBox;
    qrySelecao: TUMZReadOnlyQuery;
    qrySelecaoCODIGOALUNO: TIntegerField;
    qrySelecaoTURMA: TStringField;
    qrySelecaoCURSO: TStringField;
    qrySelecaoANOSEMESTRE: TSmallintField;
    qrySelecaoCD_DEPTO: TSmallintField;
    qrySelecaoSITUACAO: TSmallintField;
    cdsTituloCD_TIPO_TITULO: TIntegerField;
    cdsTituloCD_CENTRO: TIntegerField;
    cdsTituloCD_PLANO: TIntegerField;
    cdsTituloDS_TIPO_TITULO: TStringField;
    cdsTituloDS_CENTRO: TStringField;
    cdsTituloDS_PLANO: TStringField;
    cdsTituloNR_PARCELA_INI: TIntegerField;
    cdsTituloNR_PARCELA_FIM: TIntegerField;
    cdsTituloDS_HISTORICO: TStringField;
    cdsTituloDT_VENCTO: TDateTimeField;
    sbSelTurma: TSpeedButton;
    qryTurmasPessoa: TUMZReadOnlyQuery;
    qryTurmasPessoaTURMA: TStringField;
    qryTurmasPessoaANOSEMESTRE: TSmallintField;
    pnlTotalizacao: TPanel;
    lblTotalizacao: TLabel;
    aniProgresso: TAnimate;
    bvlSep3: TBevel;
    pnlBotoes: TPanel;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    cdsResponsaveis: TClientDataSet;
    cdsResponsaveisCD_RESP_FINAN: TIntegerField;
    cdsResponsaveisNR_ANOSEMESTRE: TIntegerField;
    cdsResponsaveisCD_TURMA: TStringField;
    cdsResponsaveisNR_PARCELA: TIntegerField;
    qrySelecaoCD_RESP_FINAN: TIntegerField;
    qrySelecaoCD_PESSOA: TIntegerField;
    qrySelecaoCD_RESPONSAVEL: TIntegerField;
    cdsResponsaveisCD_PESSOA: TIntegerField;
    cdsTurmasCD_CENTRO: TIntegerField;
    qryTurmasPessoaCD_CENTRO: TLargeintField;
    qryPessoa: TUMZReadOnlyQuery;
    qryPessoaCD_RESP_FINAN: TIntegerField;
    qryPessoaCD_PESSOA: TIntegerField;
    qryPessoaCD_RESPONSAVEL: TIntegerField;
    Panel1: TPanel;
    cbUnidadeEnsino: TUMComboBox;
    Label31: TLabel;
    qryCentrosCustoSN_ATIVO: TSmallintField;
    qryCentrosCustocd_coligada_matriz: TIntegerField;
    umdtVencto: TUMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure umdtVenctoChangeDate(Sender: TObject);
    procedure transformaPonto(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dblcTurmasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcTurmasCloseUp(Sender: TObject);
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryPessoaCalcFields(DataSet: TDataSet);
    procedure cdsTituloCD_TIPO_TITULOChange(Sender: TField);
    procedure dsTurmasDataChange(Sender: TObject; Field: TField);
    procedure qrySelecaoCalcFields(DataSet: TDataSet);
    procedure chkSomenteAtivosClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSelTurmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbSelecaoSelect(Sender: TObject);
  private
      FMensGerarPessoa: TfMensGerarPessoa;
      FMensGerarTurma: TfMensGerarTurma;
      FMensGerarCurso: TfMensGerarCurso;
      FMensGerarAnoSem: TfMensGerarAnoSem;

      cd_centro : Integer;

      function ValidaCampos: Boolean;
      function ValidaDescontos: Boolean;      
      procedure AjustaCreditos;
      procedure GeraTitulos;
      procedure GeraTituloPessoa;
      procedure SelecionaPessoas;
      procedure SelecionaTurmas;
      procedure CarregaUnidadeEnsino();
      procedure validaCentroCustoTurma();
    { Private declarations }
  public

      centro_custo_ativo: Boolean;
      custo_ativo_negado: Boolean;

    { Public declarations }
      procedure DoFiltro;
      procedure avisaCentroCustoInativo;
      procedure SelecionaPessoa(const Codigo: Integer);
  end;

var
  fMensalidadeGerar: TfMensalidadeGerar;

implementation

uses
   uDM, uFSelecionarTurma, General, uProcessando, uUsuario;

{$R *.dfm}

procedure TfMensalidadeGerar.AjustaCreditos;
begin
   if chkSomenteAtivos.Checked then
   begin
      qrySelecao.Filter := StringReplace(qrySelecao.Filter, 'SITUACAO = 1', '(SITUACAO = 1 OR SITUACAO = 10)', []);
   end
   else
      qrySelecao.Filter := qrySelecao.Filter + ' AND (SITUACAO = 1 OR SITUACAO = 10)';

   frmProcessando.Bar.Max := qrySelecao.RecordCount;
   frmProcessando.Bar.Position := 0;
   frmProcessando.Show;
   Application.ProcessMessages;
   
   qrySelecao.First;
   while not qrySelecao.Eof do
   begin
      frmProcessando.lblRegistros.Caption := Format('Ajustando créditos do aluno %d', [qrySelecaoCODIGOALUNO.AsInteger]);
      frmProcessando.Bar.StepIt;
      Application.ProcessMessages;
      
      DM.recalcular_creditos_financeiros(qrySelecaoCODIGOALUNO.AsInteger,
         qrySelecaoTURMA.AsString, qrySelecaoANOSEMESTRE.AsInteger);
      qrySelecao.Next;
   end;
end;

procedure TfMensalidadeGerar.avisaCentroCustoInativo;
   CONST
   SQL_CENTROS_CUSTO =  ''+
   'SELECT                       '+
   '  CD_CENTRO,                 '+
   '  DS_CENTRO,                 '+
   '  SN_ATIVO,                  '+
   '  cd_coligada_matriz         '+
   'FROM                         '+
   '  FIN_CONFIG_CENTRO_CUSTOS   '+
   'WHERE                        '+
   '  (TP_CENTRO = 1 AND         '+
   '  SN_ATIVO = 1 AND           '+
   '  CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ)';

   SQL_CONDICAO_INATIVO = '  OR (CD_CENTRO = :CD_CENTRO)';
begin

   if (centro_custo_ativo = False) then
   begin

      if (Mensagem(
            'O centro de custo desta turma está inativo, deseja registrar a receita neste centro de custo mesmo assim?',
            '',
            MB_YESNO + MB_ICONQUESTION,
            Handle
         ) = IDNO ) then
      begin

         qryCentrosCusto.SQL.Text := SQL_CENTROS_CUSTO;

         qryCentrosCusto.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
         qryCentrosCusto.Open;
         cdsTituloCD_CENTRO.Clear;
         custo_ativo_negado := True;
      end;

   end;
   
end;

procedure TfMensalidadeGerar.bbtnConfirmarClick(Sender: TObject);
const
   SMsgValidacao = 'Algumas informações não foram preenchidas ou estão incorretas.'#13'Não é possível gerar as parcelas.';
   SMsgColigadaSelecinada = 'Selecione uma coligada para continuar com o processo!';
begin

   if not ValidaCampos then
   begin
      MessageBox(Handle, SMsgValidacao, 'Atenção', MB_ICONINFORMATION or MB_OK);
      ModalResult := mrNone;
   end;

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      MessageBox(
         Handle,
         SMsgColigadaSelecinada,
         'Atenção',
         MB_ICONINFORMATION or MB_OK
      );
      ModalResult := mrNone;
   end;
end;

procedure TfMensalidadeGerar.CarregaUnidadeEnsino;
begin
   DM.CarregaColigadas(cbUnidadeEnsino);   
end;

procedure TfMensalidadeGerar.cbSelecaoSelect(Sender: TObject);
const
   SChavePermGeracaoMassa = 'UMFinanceiro.Recebimentos.Gerar.TitulosMassa';
   SMsgSemPermGerMassa = 'Usuário não possui privilégios suficientes para geração de títulos em massa.';
begin
   if (cbSelecao.ItemIndex = 0) or
      DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, SChavePermGeracaoMassa, npAcesso, False) then
   begin
      qrySelecao.Close;
      lblTotalizacao.Visible := False;
   
      case cbSelecao.ItemIndex of
         0:
            begin
               chkSomenteAtivos.Enabled := False;
               FMensGerarTurma.Parent := nil;
               FMensGerarCurso.Parent := nil;
               FMensGerarAnoSem.Parent := nil;
               FMensGerarPessoa.Parent := pnlSelecao;
               FMensGerarPessoa.Align := alClient;
            end;
         1:
            begin
               chkSomenteAtivos.Enabled := True;
               FMensGerarPessoa.Parent := nil;
               FMensGerarCurso.Parent := nil;
               FMensGerarAnoSem.Parent := nil;
               FMensGerarTurma.Parent := pnlSelecao;
               FMensGerarTurma.Align := alClient;
            end;
         2:
            begin
               chkSomenteAtivos.Enabled := True;
               FMensGerarPessoa.Parent := nil;
               FMensGerarTurma.Parent := nil;
               FMensGerarAnoSem.Parent := nil;
               FMensGerarCurso.Parent := pnlSelecao;
               FMensGerarCurso.Align := alClient;
            end;
         3:
            begin
               chkSomenteAtivos.Enabled := True;
               FMensGerarPessoa.Parent := nil;
               FMensGerarTurma.Parent := nil;
               FMensGerarCurso.Parent := nil;
               FMensGerarAnoSem.Parent := pnlSelecao;
               FMensGerarAnoSem.Align := alClient;
               DoFiltro;
            end;
      end;
   end
   else
   begin
      MessageDlg(SMsgSemPermGerMassa, mtInformation, [mbOK], -1);
      cbSelecao.ItemIndex := 0;
   end;
end;

procedure TfMensalidadeGerar.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure TfMensalidadeGerar.cdsTituloCD_TIPO_TITULOChange(Sender: TField);
begin
   if qryTiposTituloCD_CONTA.IsNull then
      cdsTituloCD_PLANO.Clear
   else
      if qryPlanosConta.Locate('CD_CONTA', qryTiposTituloCD_CONTA.AsInteger, []) then
         cdsTituloCD_PLANO.AsInteger := qryTiposTituloCD_CONTA.AsInteger
      else
         cdsTituloCD_PLANO.Clear;

   if not(qryTiposTituloNR_PARCELA.IsNull) and (qryTiposTituloNR_PARCELA.AsInteger > 0) then
   begin
      cdsTituloNR_PARCELA_INI.AsInteger := qryTiposTituloNR_PARCELA.AsInteger;
      cdsTituloNR_PARCELA_FIM.AsInteger := qryTiposTituloNR_PARCELA.AsInteger;
   end
   else
   begin
      cdsTituloNR_PARCELA_INI.Clear;
      cdsTituloNR_PARCELA_FIM.Clear;
   end;

   if qryTiposTituloVL_PADRAO.IsNull then
   begin
      cdsTituloVL_BRUTO.Clear;
   end
   else
   begin
      cdsTituloVL_BRUTO.AsCurrency := qryTiposTituloVL_PADRAO.AsCurrency;
   end;

   cdsTituloDS_HISTORICO.AsString := qryTiposTituloDS_TIPO_TITULO.AsString;
end;

procedure TfMensalidadeGerar.chkSomenteAtivosClick(Sender: TObject);
begin
   DoFiltro;
end;

procedure TfMensalidadeGerar.dblcTurmasCloseUp(Sender: TObject);
begin
   validaCentroCustoTurma;
end;

procedure TfMensalidadeGerar.dblcTurmasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((key = vk_down) OR (key = vk_up)) then
   begin
      validaCentroCustoTurma;
   end;
end;

procedure TfMensalidadeGerar.DoFiltro;
begin
   lblTotalizacao.Font.Color := clWindowText;
   lblTotalizacao.Caption := 'Selecionando pessoas. Aguarde...';
   lblTotalizacao.Visible := True;
   aniProgresso.Visible := True;
   aniProgresso.Active := True;
   Application.ProcessMessages;
   SelecionaPessoas;
   lblTotalizacao.Font.Color := clRed;
   if cbSelecao.ItemIndex = 0 then
   begin
      lblTotalizacao.Caption := Format('Serão gerados títulos para %d pessoa(s)',
         [qryPessoa.RecordCount]);
   end
   else
   begin
      lblTotalizacao.Caption := Format('Serão gerados títulos para %d pessoa(s)',
         [qrySelecao.RecordCount]);
   end;
   aniProgresso.Active := False;
   aniProgresso.Visible := False;
   Application.ProcessMessages;
end;

procedure TfMensalidadeGerar.dsTurmasDataChange(Sender: TObject; Field: TField);
CONST
   SQL_CENTROS_CUSTO =  ''+
   'SELECT                       '+
   '  CD_CENTRO,                 '+
   '  DS_CENTRO,                 '+
   '  SN_ATIVO,                  '+
   '  cd_coligada_matriz         '+
   'FROM                         '+
   '  FIN_CONFIG_CENTRO_CUSTOS   '+
   'WHERE                        '+
   '  (TP_CENTRO = 1 AND         '+
   '  SN_ATIVO = 1 AND           '+
   '  CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ)';

   SQL_CONDICAO_INATIVO = '  OR (CD_CENTRO = :CD_CENTRO';
var
   sn_ativo: Boolean;
begin
   if cdsTurmasCD_CENTRO.IsNull then
      cdsTituloCD_CENTRO.Clear
   else
   begin

      if custo_ativo_negado = True then
      begin
         qryCentrosCusto.SQL.Text := SQL_CENTROS_CUSTO;
      end
      else
      begin
          qryCentrosCusto.SQL.Text := SQL_CENTROS_CUSTO + SQL_CONDICAO_INATIVO;
          qryCentrosCusto.SQL.Add(' AND CD_COLIGADA_MATRIZ = ' + IntToStr(DM.UsuarioLogado.ColigadaLogada) + ' )');
          qryCentrosCusto.ParamByName('CD_CENTRO').AsInteger := cdsTurmasCD_CENTRO.AsInteger;
      end;

      qryCentrosCusto.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
      qryCentrosCusto.Open;

      if qryCentrosCusto.Locate('CD_CENTRO', cdsTurmasCD_CENTRO.AsInteger, []) then
      begin
         cdsTituloCD_CENTRO.AsInteger := cdsTurmasCD_CENTRO.AsInteger;

         if (qryCentrosCusto.FieldByName('sn_ativo').AsInteger = 0) then
         begin
            centro_custo_ativo := False;
         end
         else
         begin
            centro_custo_ativo := True;
         end;
         
      end
      else
      begin
         centro_custo_ativo := True;
         cdsTituloCD_CENTRO.Clear;
      end;
   end;
end;

procedure TfMensalidadeGerar.FormActivate(Sender: TObject);
begin
   validaCentroCustoTurma;
   Self.OnActivate := nil;
end;

procedure TfMensalidadeGerar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   cdsTurmas.Close;
   cdsTitulo.Close;
   cdsResponsaveis.Close;
end;

procedure TfMensalidadeGerar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   ChavePerm = 'UMFinanceiro.Recebimentos.Planilha.VenctoRetroativo';
   SMsgConfirmData = 'Você está selecionando uma data de vencimento inferior a data de hoje.'#13'Deseja prosseguir?';
   SMsgSemPerm = 'Você não possui privilégios para gerar títulos com data de vencimento inferior à data de hoje.';
   SCapAtencao = 'Atenção';
   SCapQuest = 'Confirmação';
   SCapInfo = 'Informação';
   SMsgQuest = 'Deseja realmente gerar os títulos para as pessoas selecionadas no filtro?';
   SMsgValidacao = 'Algumas informações não foram preenchidas ou estão incorretas.'#13'Não é possível gerar as parcelas.';
   SMsgSelecao = 'Não foram selecionadas pessoas para geração das parcelas.'#13'Não é possível continuar.';
   SMsgSucesso = 'Os títulos foram gerados com sucesso.' + #13 + 'Deseja continuar gerando títulos?';
var
   Hoje: TDate;
begin
   if ModalResult = mrOk then
   begin
      Hoje := DM.DataAtual;

      if TDate(cdsTituloDT_VENCTO.AsDateTime) < Trunc(Hoje) then
      begin
         if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, ChavePerm, npAcesso, False) then
         begin
            if MessageBox(Handle, SMsgConfirmData, SCapQuest,
                  MB_ICONQUESTION or MB_YESNO) = ID_NO then
            begin
               CanClose := False;
               umdtVencto.SetFocus;
               Exit;
            end;
         end
         else
         begin
            CanClose := False;
            MessageBox(Handle, SMsgSemPerm, SCapInfo,
               MB_ICONINFORMATION or MB_OK);
            Exit;
         end;
      end;

      if MessageBox(Handle, PChar(SMsgQuest), PChar(SCapQuest),
         MB_ICONQUESTION or MB_YESNO) = ID_YES then
      begin
         if ((cbSelecao.ItemIndex = 0) and qryPessoa.Active and (not qryPessoa.IsEmpty)) or
            (qrySelecao.Active and (not qrySelecao.IsEmpty)) then
         begin
            if ValidaCampos then
            begin
               if ValidaDescontos then
               begin
                  try
                     try
                        if cbSelecao.ItemIndex = 0 then
                           GeraTituloPessoa
                        else
                        begin
                           GeraTitulos;
                           if chkAjustar.Checked then
                              AjustaCreditos;
                        end;
                     except
                        on E: Exception do raise;
                     end;

                     CanClose := Mensagem(SMsgSucesso, SCapInfo, MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON2, Handle) = mrNo;
                  finally
                     frmProcessando.Close;
                  end;
               end else begin
                  CanClose := False;
               end;
            end
            else
            begin
               MessageBox(Handle, PChar(SMsgValidacao), PChar(SCapAtencao),
                  MB_ICONWARNING or MB_OK);
               CanClose := False;
            end;
         end
         else
         begin
            MessageBox(Handle, PChar(SMsgSelecao), PChar(SCapAtencao),
               MB_ICONWARNING or MB_OK);
            CanClose := False;
         end;
      end;
   end;
end;

procedure TfMensalidadeGerar.FormCreate(Sender: TObject);
var
   S: string;
begin
   FMensGerarPessoa := TfMensGerarPessoa.Create(Self);
   FMensGerarTurma := TfMensGerarTurma.Create(Self);
   FMensGerarCurso := TfMensGerarCurso.Create(Self);
   FMensGerarAnoSem := TfMensGerarAnoSem.Create(Self);

   S := Format('%d', [DM.GetAnoSemestreAtual]);

   FMensGerarTurma.meTurmaAnoSem.Text := S;
   FMensGerarCurso.meCursoAnoSem.Text := S;
   FMensGerarAnoSem.meAnoSem.Text := S;

   cbSelecao.ItemIndex := 0;
   cbSelecaoSelect(cbSelecao);

   qryTiposTitulo.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qryCentrosCusto.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;

   qryCentrosCusto.Filter := 'CD_COLIGADA_MATRIZ = ' + IntToStr(DM.UsuarioLogado.GetColigadaLogada.Codigo);
   qryCentrosCusto.Filtered := true;

   qryPlanosConta.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;

   qryTiposTitulo.Open;
   qryCentrosCusto.Open;
   qryPlanosConta.Open;

   cdsTitulo.CreateDataSet;
   cdsTitulo.Open;
   cdsTitulo.Insert;
   cdsTituloDT_VENCTO.AsDateTime := Date;

   umdtVencto.setDate(Date);

   cdsTurmas.CreateDataSet;
   cdsTurmas.Open;

   cdsResponsaveis.CreateDataSet;
   cdsResponsaveis.Open;

   aniProgresso.ResName := 'LOADING';
end;

procedure TfMensalidadeGerar.FormShow(Sender: TObject);
var
   codAcao: Integer;
begin
   cd_centro := -1;
   codAcao := DM.BuscarCodigoAcaoPadrao(11);

   if codAcao = -1 then
   begin
      lblDescExtra.Enabled := False;
      dbeDescExtra.Enabled := False;
   end else begin
      lblDescExtra.Enabled := True;
      dbeDescExtra.Enabled := True;
   end;

   CarregaUnidadeEnsino;

end;

procedure TfMensalidadeGerar.GeraTituloPessoa;
const
   SSQLAtuDataPgto = 'UPDATE MENSALIDADES SET DATAPAGAMENTO = ?, VALORDESCONTO = 0 WHERE CD_MENSALIDADE = ?';
   SSQLFindParcela =
      'SELECT CODIGOALUNO ' +
      'FROM MENSALIDADES ' +
      'WHERE CODIGOALUNO = ? AND ANOSEMESTRE = ? AND TURMA = ? AND PARCELA = ?';

   SSQLSearchNN = 'SELECT NOSSONUMERO FROM MENSALIDADES WHERE CD_MENSALIDADE = ?';
var
   Depto, Codigo, I, cd_coligada, J: Integer;
   MensDataBaixa, Curso, Chave, NossoNumero, Obs: string;
   Vencto, VenctoOriginal: TDateTime;
   Hoje: TDate;
   Ano, Mes, Dia, DiaAux: Word;
   PodeIncluir: Boolean;
   Stmt, Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   Movimento: TMovimento;
begin
   DM.DeptoCursoTurma(
      cdsTurmasNR_ANOSEMESTRE.AsInteger,
      cdsTurmasCD_TURMA.AsString
   );
   Depto := DM.tblDeptoCursoTurmaDepto.AsInteger;
   Curso := DM.tblDeptoCursoTurmaCurso.AsString;
   cd_coligada := DM.getColigadaByTurma(cdsTurmasCD_TURMA.AsString, cdsTurmasNR_ANOSEMESTRE.AsInteger);

   frmProcessando.Bar.Max :=
      cdsTituloNR_PARCELA_FIM.AsInteger - cdsTituloNR_PARCELA_FIM.AsInteger + 1;
   frmProcessando.Bar.Position := 0;
   frmProcessando.Show;
   Application.ProcessMessages;

   Vencto := cdsTituloDT_VENCTO.AsDateTime;
   VenctoOriginal := Vencto;

   if rgOpcaoVencto.ItemIndex = 1 then
   begin
      DecodeDate(Vencto, Ano, Mes, Dia);
      Vencto := DiaUtil(
                  Ano,
                  Mes,
                  Dia,
                  TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
                );
   end
   else
   if rgOpcaoVencto.ItemIndex = 2 then
   begin
      case DayOfWeek(Vencto) of
         1:
            begin
               Vencto := IncDay(Vencto);
            end;
         7:
            begin
               Vencto := IncDay(Vencto, 2);
            end;
      end;
   end;

   for I := cdsTituloNR_PARCELA_INI.AsInteger to cdsTituloNR_PARCELA_FIM.AsInteger do
   begin
      frmProcessando.lblRegistros.Caption := Format('Gerando parcela %d', [I]);
      frmProcessando.Bar.StepIt;

      Application.ProcessMessages;

      if chkNaoDuplicar.Checked then
      begin
         Statement := PrepareStatement(SSQLFindParcela);
         try
            Statement.SetInt(1, qryPessoaCD_PESSOA.AsInteger);
            Statement.SetInt(2, cdsTurmasNR_ANOSEMESTRE.AsInteger);
            Statement.SetString(3, cdsTurmasCD_TURMA.AsString);
            Statement.SetInt(4, I);
            ResultSet := Statement.ExecuteQueryPrepared;
            try
               PodeIncluir := not ResultSet.Next;
            finally
               ResultSet.Close;
            end;
         finally
            Statement.Close;
         end;
      end
      else
         PodeIncluir := True;

      if PodeIncluir then
      begin
         Codigo := DM.GerarMensalidade(
            qryPessoaCD_PESSOA.AsInteger, I, cdsTurmasCD_TURMA.AsString,
            cdsTituloVL_BRUTO.AsCurrency, 0, cdsTurmasNR_ANOSEMESTRE.AsInteger,
            Vencto, Vencto, 2, Curso, Depto, 0, -1,
            cdsTituloVL_DESCONTO.AsCurrency, 0, cdsTituloDS_HISTORICO.AsString,
            cdsTituloCD_TIPO_TITULO.AsInteger, cdsTituloCD_PLANO.AsInteger,
            cdsTituloCD_CENTRO.AsInteger, cdsTituloVL_DESC_EXTRA.AsCurrency,
            cdsTituloVL_EXTRA.AsCurrency, 'N', 0, 0, 10, 0,
            qryPessoaCD_RESPONSAVEL.AsInteger
         );

         Chave := Format('%s;%d;%d;%s;', [
            StringOfChar(#48, 10 - Length(qryPessoaCD_PESSOA.AsString)),
            cdsTurmasNR_ANOSEMESTRE.AsInteger, I,
            FormatDateTime('yyyy-mm-dd', Vencto)
         ]);

         Statement := PrepareStatement(SSQLSearchNN);
         try
            Statement.SetInt(1, Codigo);
            ResultSet := Statement.ExecuteQueryPrepared;
            try
               if ResultSet.Next then
                  NossoNumero := ResultSet.GetString(1)
               else
                  NossoNumero := '[Não encontrado]';
            finally
               ResultSet.Close;
            end;
         finally
            Statement.Close;
         end;

         Obs := Format('Parcela gerada manualmente (NN = %s)', [NossoNumero]);

         DM.setLog(2013, 'inclusao', Chave, cd_coligada, Obs);

         if cdsTituloVL_DESC_EXTRA.AsCurrency > 0 then
         begin
            Movimento := TMovimento.create;
            try
               Movimento.TipoDeAcao := BaixarporDesconto;
               Movimento.CodigoTitulo := Codigo;
               Movimento.Coligada := cd_coligada;
               Movimento.CodAcao := DM.BuscarCodigoAcaoPadrao(11);
               Movimento.ValorMovimento := cdsTituloVL_DESC_EXTRA.AsCurrency;
               Movimento.RegistrarMovimentacaoCR(0);
            finally
               Movimento.Free;
            end;
         end;

         if cdsTituloVL_DESC_EXTRA.AsCurrency >=
            (cdsTituloVL_BRUTO.AsCurrency+cdsTituloVL_EXTRA.AsCurrency) then
         begin
            Stmt := PrepareStatement(SSQLAtuDataPgto);
            try
               if ((Hoje < cdsTituloDT_VENCTO.AsDateTime) or
                  (MensDataBaixa = '[VENCIMENTO]')) and
                  (MensDataBaixa <> '[BAIXA]') then
               begin
                  Stmt.SetDate(1, TDate(cdsTituloDT_VENCTO.AsDateTime));
               end
               else
               begin
                  Stmt.SetDate(1, TDate(Hoje));
               end;
               Stmt.SetInt(2, Codigo);
               Stmt.ExecutePrepared;
            finally
               Stmt.Close;
            end;
         end;
         
         // Sempre fará o cálculo com base na parcela original
         // e incrementará a quantidade de meses não mais mês a mês
         Vencto := VenctoOriginal;
         j:= i+1-cdsTituloNR_PARCELA_INI.AsInteger;
         Vencto := IncMonth(Vencto, j);

         if rgOpcaoVencto.ItemIndex = 1 then
         begin
            {
               Abaixo utilizamos a variável DiaAux, pois,
               na verdade não queremos mudar o dia do vencimento(Variável Dia).

               Cada vez que a lógica está calculando o DiaUtil, ele estava mudando a data de vencimento.
            }
            DecodeDate(Vencto, Ano, Mes, DiaAux);
            Vencto := DiaUtil(Ano, Mes, Dia, TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
         end
         else
         if rgOpcaoVencto.ItemIndex = 2 then
         begin
            case DayOfWeek(Vencto) of
               1:
                  begin
                     Vencto := IncDay(Vencto);
                  end;
               7:
                  begin
                     Vencto := IncDay(Vencto, 2);
                  end;
            end;
         end;         
      end;
   end;
end;

procedure TfMensalidadeGerar.GeraTitulos;
const
   SSQLAtuDataPgto = 'UPDATE MENSALIDADES SET DATAPAGAMENTO = ?, VALORDESCONTO = 0 WHERE CD_MENSALIDADE = ?';
   SSQLFindParcela =
      'SELECT CODIGOALUNO ' +
      'FROM MENSALIDADES ' +
      'WHERE CODIGOALUNO = ? AND ANOSEMESTRE = ? AND TURMA = ? AND PARCELA = ?';

   SSQLSearchNN = 'SELECT NOSSONUMERO FROM MENSALIDADES WHERE CD_MENSALIDADE = ?';
var
   Credito: Char;

   MensDataBaixa,
   Chave,
   Obs,
   NossoNumero,
   Turma: string;

   Ano,
   Mes,
   Dia,
   DiaAux: Word;

   I,
   Codigo,
   Depto,
   cd_coligada,
   anosemestre: Integer;

   PodeIncluir: Boolean;

   Stmt,
   Statement: IZPreparedStatement;

   ResultSet: IZResultSet;

   Movimento: TMovimento;

   Vencto: TDateTime;
   
   Hoje: TDate;
begin
   if chkAjustar.Checked then
      Credito := 'S'
   else
      Credito := 'N';

   if cbSelecao.ItemIndex = 1 then
   begin
      anosemestre := cdsTurmasNR_ANOSEMESTRE.AsInteger;
   end;

   if cbSelecao.ItemIndex = 2 then
   begin
      anosemestre := qrySelecaoANOSEMESTRE.AsInteger;
   end;

   DM.DeptoCursoTurma(cdsTurmasNR_ANOSEMESTRE.AsInteger,
      cdsTurmasCD_TURMA.AsString);
   Depto := DM.tblDeptoCursoTurmaDepto.AsInteger;
   cd_coligada := DM.getColigadaByTurma(cdsTurmasCD_TURMA.AsString, cdsTurmasNR_ANOSEMESTRE.AsInteger);

   frmProcessando.Bar.Max := qrySelecao.RecordCount *
      (cdsTituloNR_PARCELA_FIM.AsInteger - cdsTituloNR_PARCELA_INI.AsInteger + 1);
   frmProcessando.Bar.Position := 0;
   frmProcessando.Show;
   Application.ProcessMessages;

   qrySelecao.First;

   while not qrySelecao.Eof do
   begin
      // Calcula a data de vencimento da parcela com nas opções selecionadas

      Vencto := cdsTituloDT_VENCTO.AsDateTime;

      if rgOpcaoVencto.ItemIndex = 1 then
      begin
         DecodeDate(Vencto, Ano, Mes, Dia);
         Vencto := DiaUtil(Ano, Mes, Dia, TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
      end
      else if rgOpcaoVencto.ItemIndex = 2 then
      begin
         case DayOfWeek(Vencto) of
            1: // se caiu no domingo joga para segunda
               Vencto := IncDay(Vencto);
               
            7: // se caiu no sábado joga para segunda
               Vencto := IncDay(Vencto, 2);
         end;
      end;
      for I := cdsTituloNR_PARCELA_INI.AsInteger to cdsTituloNR_PARCELA_FIM.AsInteger do
      begin

         frmProcessando.lblRegistros.Caption := Format('Gerando parcela %d para aluno %d', [I, qrySelecaoCODIGOALUNO.AsInteger]);
         frmProcessando.Bar.StepIt;
         Application.ProcessMessages;

         // Verifica se permite duplicar parcelas
         // Se não permite duplicação de parcela, verifica se o número de
         // parcela já foi gerado para a pessoa selecionada
         
         if chkNaoDuplicar.Checked then
         begin
            Statement := PrepareStatement(SSQLFindParcela);
            try
               Statement.SetInt(1, qrySelecaoCODIGOALUNO.AsInteger);
               Statement.SetInt(2, qrySelecaoANOSEMESTRE.AsInteger);
               Statement.SetString(3, qrySelecaoTURMA.AsString);
               Statement.SetInt(4, I);
               ResultSet := Statement.ExecuteQueryPrepared;
               try
                  PodeIncluir := not ResultSet.Next;
               finally
                  ResultSet.Close;
               end;
            finally
               Statement.Close;
            end;
            end
         else
            PodeIncluir := True;

         // Verifica se pode duplicar o título por responsável financeiro
         // ou se o título ainda não foi gerado 

         PodeIncluir := PodeIncluir and ((not chkAgruparResp.Checked) or
            (not cdsResponsaveis.Locate(
               'CD_RESP_FINAN;NR_ANOSEMESTRE;CD_TURMA;NR_PARCELA',
               VarArrayOf([
                  qrySelecaoCD_RESPONSAVEL.AsInteger,
                  qrySelecaoANOSEMESTRE.AsInteger,
                  qrySelecaoTURMA.AsString, I]), [])));

         if (cbSelecao.ItemIndex = 0) and PodeIncluir then
         begin
            PodeIncluir := not cdsResponsaveis.Locate('CD_PESSOA;NR_PARCELA',
               VarArrayOf([qrySelecaoCD_PESSOA.AsInteger, I]), []);
         end;

         // Verifica se pode incluir a nova parcela
         
         if PodeIncluir then
         begin

            if (cbSelecao.ItemIndex in [2, 3]) and cdsTurmasCD_TURMA.IsNull and
               cdsTurmasNR_ANOSEMESTRE.IsNull then
            begin
               Turma := qrySelecaoTURMA.AsString;
               DM.DeptoCursoTurma(qrySelecaoANOSEMESTRE.AsInteger, Turma);
               Depto := DM.tblDeptoCursoTurmaDepto.AsInteger;
            end
            else
            begin
               Turma := cdsTurmasCD_TURMA.AsString;
            end;

            // Gera a nova parcela de mensalidade no banco de dados
            
            Codigo := DM.GerarMensalidade(
               qrySelecaoCODIGOALUNO.AsInteger, I, Turma,
               cdsTituloVL_BRUTO.AsCurrency, 0, anosemestre,
               Vencto, Vencto, 2, qrySelecaoCURSO.AsString, Depto, 0, -1,
               cdsTituloVL_DESCONTO.AsCurrency, 0,
               cdsTituloDS_HISTORICO.AsString, cdsTituloCD_TIPO_TITULO.AsInteger,
               cdsTituloCD_PLANO.AsInteger, cdsTituloCD_CENTRO.AsInteger,
               cdsTituloVL_DESC_EXTRA.AsCurrency, cdsTituloVL_EXTRA.AsCurrency,
               Credito, 0, 0, 10, 0, qrySelecaoCD_RESPONSAVEL.AsInteger);

            // Armazena as informações para verificar a duplicidade de parcelas
            // pelo responsável financeiro

            cdsResponsaveis.Append;
            cdsResponsaveisCD_RESP_FINAN.AsInteger :=
               qrySelecaoCD_RESPONSAVEL.AsInteger;
            cdsResponsaveisNR_ANOSEMESTRE.AsInteger :=
               qrySelecaoANOSEMESTRE.AsInteger;
            cdsResponsaveisCD_TURMA.AsString := qrySelecaoTURMA.AsString;
            cdsResponsaveisNR_PARCELA.AsInteger := I;
            cdsResponsaveisCD_PESSOA.AsInteger := qrySelecaoCODIGOALUNO.AsInteger;
            cdsResponsaveis.Post;

            // Monta a chave do log

            Chave := Format('%s;%d;%d;%s;', [
               StringOfChar(#48, 10 - Length(qrySelecaoCODIGOALUNO.AsString)),
               qrySelecaoANOSEMESTRE.AsInteger, I,
               FormatDateTime('yyyy-mm-dd', Vencto)
            ]);

            // Recupera o nosso número da parcela

            Statement := PrepareStatement(SSQLSearchNN);
            try
               Statement.SetInt(1, Codigo);
               ResultSet := Statement.ExecuteQueryPrepared;
               try
                  if ResultSet.Next then
                     NossoNumero := ResultSet.GetString(1)
                  else
                     NossoNumero := '[Não encontrado]';
               finally
                  ResultSet.Close;
               end;
            finally
               Statement.Close;
            end;

            // Grava log da operação realizada

            Obs := Format('Parcela gerada manualmente (NN = %s)', [NossoNumero]);

            DM.setLog(2013, 'inclusao', Chave, cd_coligada, Obs);

            // Realiza movimentação de desconto extra

            if cdsTituloVL_DESC_EXTRA.AsCurrency > 0 then
            begin
               Movimento := TMovimento.create;
               try
                  Movimento.TipoDeAcao := BaixarporDesconto;
                  Movimento.CodigoTitulo := Codigo;
                  Movimento.Coligada := cd_coligada;
                  Movimento.CodAcao := DM.BuscarCodigoAcaoPadrao(11);
                  Movimento.ValorMovimento := cdsTituloVL_DESC_EXTRA.AsCurrency;
                  Movimento.RegistrarMovimentacaoCR(0);
               finally
                  Movimento.Free;
               end;
            end;

            if cdsTituloVL_DESC_EXTRA.AsCurrency >=
               (cdsTituloVL_BRUTO.AsCurrency+cdsTituloVL_EXTRA.AsCurrency) then
            begin
               Stmt := PrepareStatement(SSQLAtuDataPgto);
               try
                  if ((Hoje < cdsTituloDT_VENCTO.AsDateTime) or
                     (MensDataBaixa = '[VENCIMENTO]')) and
                     (MensDataBaixa <> '[BAIXA]') then
                  begin
                     Stmt.SetDate(1, TDate(cdsTituloDT_VENCTO.AsDateTime));
                  end
                  else
                  begin
                     Stmt.SetDate(1, TDate(Hoje));
                  end;
                  Stmt.SetInt(2, Codigo);
                  Stmt.ExecutePrepared;
               finally
                  Stmt.Close;
               end;
            end;
         end;

         Vencto := IncMonth(Vencto);

         if rgOpcaoVencto.ItemIndex = 1 then
         begin
            {
               Abaixo utilizamos a variável DiaAux, pois,
               na verdade não queremos mudar o dia do vencimento(Variável Dia).

               Cada vez que a lógica está calculando o DiaUtil, ele estava mudando a data de vencimento.
            }
            DecodeDate(Vencto, Ano, Mes, DiaAux);
            Vencto := DiaUtil(Ano, Mes, Dia, TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
         end
         else if rgOpcaoVencto.ItemIndex = 2 then
         begin
            case DayOfWeek(Vencto) of
               1: // se caiu no domingo joga para segunda
                  Vencto := IncDay(Vencto);
               7: // se caiu no sábado joga para segunda
                  Vencto := IncDay(Vencto, 2);
            end;
         end;
      end;
      qrySelecao.Next;
   end;
end;

procedure TfMensalidadeGerar.qryPessoaCalcFields(DataSet: TDataSet);
begin
   if qryPessoaCD_RESP_FINAN.IsNull then
      qryPessoaCD_RESPONSAVEL.AsInteger := qryPessoaCD_PESSOA.AsInteger
   else
      qryPessoaCD_RESPONSAVEL.AsInteger := qryPessoaCD_RESP_FINAN.AsInteger;
end;

procedure TfMensalidadeGerar.qrySelecaoCalcFields(DataSet: TDataSet);
begin
   if qrySelecaoCD_RESP_FINAN.IsNull then
      qrySelecaoCD_RESPONSAVEL.AsInteger := qrySelecaoCD_PESSOA.AsInteger
   else
      qrySelecaoCD_RESPONSAVEL.AsInteger := qrySelecaoCD_RESP_FINAN.AsInteger;
end;

procedure TfMensalidadeGerar.sbSelTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   cd_centro := -1;
   if resultado_filtro.filtrado then
   begin
      cd_centro := resultado_filtro.cd_centro;

      if not cdsTurmas.Locate('CD_TURMA;NR_ANOSEMESTRE',
         VarArrayOf([
            resultado_filtro.cd_turma,
            resultado_filtro.nr_anosemestre]), []) then
      begin
         cdsTurmas.Append;
         cdsTurmasCD_TURMA.AsString := resultado_filtro.cd_turma;
         cdsTurmasNR_ANOSEMESTRE.AsInteger :=
            resultado_filtro.nr_anosemestre;
         cdsTurmasDS_TURMA.AsString := Format('%s - %s/%s', [
            resultado_filtro.cd_turma,
            LeftStr(
               IntToStr( resultado_filtro.nr_anosemestre ),
               Length(IntToStr( resultado_filtro.nr_anosemestre )) - 1
            ),
            RightStr(IntToStr( resultado_filtro.nr_anosemestre ), 1)
         ]);
         if resultado_filtro.cd_centro <> -1 then
         begin
            cdsTurmasCD_CENTRO.AsInteger := resultado_filtro.cd_centro;
         end;
         cdsTurmas.Post;
         cdsTurmas.Last;
         dblcTurmas.KeyValue := cdsTurmasDS_TURMA.AsString;

         validaCentroCustoTurma;
      end;
   end;
end;

procedure TfMensalidadeGerar.SelecionaPessoa(const Codigo: Integer);
begin
   FMensGerarPessoa.edtCodigoPessoa.Text := Format('%d', [Codigo]);
   FMensGerarPessoa.LocatePerson(Format('%d', [Codigo]));
   SelecionaPessoas;
end;

procedure TfMensalidadeGerar.SelecionaPessoas;
var
   LFilter, LAnoSem: string;
begin
   case cbSelecao.ItemIndex of
      0:
         begin
            qryPessoa.Close;
            qryPessoa.ParamByName('CD_PESSOA').AsString := FMensGerarPessoa.edtCodigoPessoa.Text;
            qryPessoa.Open;
         end;
      1:
         begin
            LAnoSem := FMensGerarTurma.meTurmaAnoSem.Text;
            LFilter := Format('TURMA = %s',
               [QuotedStr(FMensGerarTurma.edtTurma.Text)]);
         end;
      2:
         begin
            LAnoSem := FMensGerarCurso.meCursoAnoSem.Text;
            LFilter := Format('CURSO = %s',
               [QuotedStr(FMensGerarCurso.edtCurso.Text)]);
         end;
      3:
         begin
            LAnoSem := FMensGerarAnoSem.meAnoSem.Text;
            LFilter := '';
         end;
   end;
   
   if chkSomenteAtivos.Checked then
   begin
      if LFilter <> '' then
         LFilter := LFilter + ' AND ';
      LFilter := LFilter + 'SITUACAO = 1';
   end;

   if cbSelecao.ItemIndex > 0 then
   begin
      qrySelecao.Close;
      try
         qrySelecao.Filter := LFilter;
      except
         on E: TZParseError do
         begin
            qrySelecao.Filtered := False;
            qrySelecao.Filter := '';
         end;
      end;
      qrySelecao.ParamByName('NR_ANOSEMESTRE').AsString := LAnoSem;
      qrySelecao.Open;
   end;

   SelecionaTurmas;
end;

procedure TfMensalidadeGerar.SelecionaTurmas;
begin
   cdsTurmas.EmptyDataSet;
   
   case cbSelecao.ItemIndex of
      0:
         begin
            qryTurmasPessoa.Close;
            qryTurmasPessoa.ParamByName('CD_PESSOA').AsString :=
               FMensGerarPessoa.edtCodigoPessoa.Text;
            qryTurmasPessoa.Open;
            while not qryTurmasPessoa.Eof do
            begin
               cdsTurmas.Append;
               cdsTurmasCD_TURMA.AsString := qryTurmasPessoaTURMA.AsString;
               cdsTurmasNR_ANOSEMESTRE.AsInteger :=
                  qryTurmasPessoaANOSEMESTRE.AsInteger;
               cdsTurmasDS_TURMA.AsString := Format('%s - %s/%s', [
                  qryTurmasPessoaTURMA.AsString,
                  LeftStr(
                     qryTurmasPessoaANOSEMESTRE.AsString,
                     Length(qryTurmasPessoaANOSEMESTRE.AsString) - 1
                  ),
                  RightStr(qryTurmasPessoaANOSEMESTRE.AsString, 1)
               ]);
               
               if not qryTurmasPessoaCD_CENTRO.IsNull then
               begin
                  cdsTurmasCD_CENTRO.AsInteger := qryTurmasPessoaCD_CENTRO.AsInteger;
               end;
               cdsTurmas.Post;
               qryTurmasPessoa.Next;
            end;
         end;
      1:
         begin
            cdsTurmas.Append;
            cdsTurmasCD_TURMA.AsString := FMensGerarTurma.edtTurma.Text;
            cdsTurmasNR_ANOSEMESTRE.AsString :=
               FMensGerarTurma.meTurmaAnoSem.Text;
            cdsTurmasDS_TURMA.AsString := Format('%s - %s/%s', [
               FMensGerarTurma.edtTurma.Text,
               LeftStr(
                  FMensGerarTurma.meTurmaAnoSem.Text,
                  Length(FMensGerarTurma.meTurmaAnoSem.Text) - 1
               ),
               RightStr(FMensGerarTurma.meTurmaAnoSem.Text, 1)
            ]);
            if cd_centro <> -1 then
            begin
               cdsTurmasCD_CENTRO.AsInteger := cd_centro;
            end;
            cdsTurmas.Post;
         end;
      2, 3:
         begin
            cdsTurmas.Append;
            cdsTurmasCD_TURMA.Clear;
            cdsTurmasNR_ANOSEMESTRE.Clear;
            cdsTurmasDS_TURMA.AsString := 'Turma de matrícula do aluno';
            cdsTurmas.Post;
         end;
   end;
   cdsTurmas.First;
   dblcTurmas.KeyValue := cdsTurmasDS_TURMA.AsString;
end;

procedure TfMensalidadeGerar.transformaPonto(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfMensalidadeGerar.umdtVenctoChangeDate(Sender: TObject);
begin
   cdsTituloDT_VENCTO.AsDateTime := umdtVencto.getDate;
end;

function TfMensalidadeGerar.ValidaCampos: Boolean;
begin
   Result := True;

   if dblcTiposTitulo.KeyValue = Null then
   begin
      Result := False;
      dbeCentro.Color := clInfoBk;
      dblcTiposTitulo.Color := clInfoBk;
   end
   else
   begin
      dbeCentro.Color := clWindow;
      dblcTiposTitulo.Color := clWindow;
   end;

   if dblcPlanos.KeyValue = Null then
   begin
      Result := False;
      dbePlano.Color := clInfoBk;
      dblcPlanos.Color := clInfoBk;
   end
   else
   begin
      dbePlano.Color := clWindow;
      dblcPlanos.Color := clWindow;
   end;

   if dblcCentroCustos.KeyValue = Null then
   begin
      Result := False;
      dblcCentroCustos.Color := clInfoBk;
   end
   else
      dblcCentroCustos.Color := clWindow;

   if cdsTituloVL_BRUTO.IsNull then
   begin
      Result := False;
      dbeValorBruto.Color := clInfoBk;
   end
   else
      dbeValorBruto.Color := clWindow;

   if cdsTituloNR_PARCELA_INI.IsNull then
   begin
      Result := false;
      dbeParcelaIni.Color := clInfoBk
   end
   else
      dbeParcelaIni.Color := clWindow;

   if (cdsTituloNR_PARCELA_FIM.IsNull) or
      (cdsTituloNR_PARCELA_FIM.AsInteger < cdsTituloNR_PARCELA_INI.AsInteger) then
   begin
      Result := False;
      dbeParcelaFim.Color := clInfoBk
   end
   else
      dbeParcelaFim.Color := clWindow;

   if (cbSelecao.ItemIndex = 0) and cdsTurmasCD_TURMA.IsNull then
   begin
      Result := False;
      dblcTurmas.Color := clInfoBk
   end
   else
      dblcTurmas.Color := clWindow;

   if DM.EstaBloqueado(cdsTituloDT_VENCTO.AsDateTime, True) then
   begin
      Result := False;
      umdtVencto.Color := clInfoBk;
   end
   else
      umdtVencto.Color := clWindow;

end;

procedure TfMensalidadeGerar.validaCentroCustoTurma;
CONST
   SQL_CENTROS_CUSTO =  ''+
   'SELECT                       '+
   '  CD_CENTRO,                 '+
   '  DS_CENTRO,                 '+
   '  SN_ATIVO,                   '+
   '  cd_coligada_matriz         '+
   'FROM                         '+
   '  FIN_CONFIG_CENTRO_CUSTOS   '+
   'WHERE                        '+
   '  (TP_CENTRO = 1 AND         '+
   '  SN_ATIVO = 1 AND           '+
   '  CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ)';

   SQL_CONDICAO_INATIVO = '  OR (CD_CENTRO = :CD_CENTRO)';

begin
   centro_custo_ativo := True;
   custo_ativo_negado := False;

   if cdsTurmasCD_CENTRO.IsNull then
      cdsTituloCD_CENTRO.Clear
   else
   begin

      qryCentrosCusto.SQL.Text := SQL_CENTROS_CUSTO + SQL_CONDICAO_INATIVO;
      qryCentrosCusto.ParamByName('CD_CENTRO').AsInteger := cdsTurmasCD_CENTRO.AsInteger;
      qryCentrosCusto.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;

      qryCentrosCusto.Open;

      if qryCentrosCusto.Locate('CD_CENTRO', cdsTurmasCD_CENTRO.AsInteger, []) then
      begin
         cdsTituloCD_CENTRO.AsInteger := cdsTurmasCD_CENTRO.AsInteger;

         if (qryCentrosCusto.FieldByName('sn_ativo').AsInteger = 0) then
         begin
            centro_custo_ativo := False;
         end
         else
         begin
            centro_custo_ativo := True;
         end;
         
      end
      else
      begin
         centro_custo_ativo := True;
         cdsTituloCD_CENTRO.Clear;
      end;
   end;

   if (centro_custo_ativo = False) then
   begin

      if (Mensagem(
            'O centro de custo desta turma está inativo, deseja registrar a receita neste centro de custo mesmo assim?',
            '',
            MB_YESNO + MB_ICONQUESTION,
            Handle
         ) = IDNO ) then
      begin

         qryCentrosCusto.SQL.Text := SQL_CENTROS_CUSTO;

         qryCentrosCusto.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
         qryCentrosCusto.Open;
         cdsTituloCD_CENTRO.Clear;
         custo_ativo_negado := True;
      end;
   end;
end;

function TfMensalidadeGerar.ValidaDescontos: Boolean;
const
   SMsgConfirmBaixaDesc = 'Identificamos que o valor da(s) parcela(s) é igual ao valor do(s) desconto(s). Será realizada uma baixa por desconto nas parcelas geradas.'#13'Deseja prosseguir?';
   SMsgDescontosMaioresMensa = 'Os valores informados de descontos são maiores que os valores das parcelas.'#13'Não é possível gerar as parcelas.';
   SMsgDescontosInvalidos = 'Os valores de desconto informado são inválidos, pois não é possível gerar uma baixa por desconto em uma parcela que possui desconto condicional informado.'#13'Não é possível gerar as parcelas.';
   SCapQuest = 'Confirmação';
   SCapAtencao = 'Atenção';
begin
   Result := True;

   // Se os descontos são maiores que o valor da mensalidade não permite a criação da mesma
   if (cdsTituloVL_DESC_EXTRA.AsFloat+cdsTituloVL_DESCONTO.AsFloat) > (cdsTituloVL_EXTRA.AsFloat+cdsTituloVL_BRUTO.AsFloat) then
   begin
      Result := False;
      dbeValorBruto.Color := clInfoBk;
      dbeValorExtra.Color := clInfoBk;
      dbeValorDesc.Color := clInfoBk;
      dbeDescExtra.Color := clInfoBk;

      MessageBox(Handle, PChar(SMsgDescontosMaioresMensa), PChar(SCapAtencao), MB_ICONWARNING or MB_OK);

   // Se os descontos são igual ao valor da mensalidade mas não é uma baixa por desconto (pois somente completa por causa do desconto condicional)
   // Exemplo: Mensalidade R$ 500,00, Desconto Fixo: R$ 480,00 e Condicional: R$ 20,00
   end else if ((cdsTituloVL_DESC_EXTRA.AsFloat+cdsTituloVL_DESCONTO.AsFloat) = (cdsTituloVL_EXTRA.AsFloat+cdsTituloVL_BRUTO.AsFloat)) and (cdsTituloVL_DESCONTO.AsFloat > 0) then
   begin
      Result := False;
      dbeValorBruto.Color := clInfoBk;
      dbeValorExtra.Color := clInfoBk;
      dbeValorDesc.Color := clInfoBk;
      dbeDescExtra.Color := clInfoBk;

      MessageBox(Handle, PChar(SMsgDescontosInvalidos), PChar(SCapAtencao), MB_ICONWARNING or MB_OK);

   end else begin
      if (cdsTituloVL_DESC_EXTRA.AsFloat = (cdsTituloVL_EXTRA.AsFloat+cdsTituloVL_BRUTO.AsFloat)) and
         (MessageBox(Handle, SMsgConfirmBaixaDesc, SCapQuest, MB_ICONQUESTION or MB_YESNO) = ID_NO) then
      begin
         Result := False;
      end;

      dbeValorBruto.Color := clWindow;
      dbeValorExtra.Color := clWindow;
      dbeValorDesc.Color := clWindow;
      dbeDescExtra.Color := clWindow;
   end;
     
end;

end.
