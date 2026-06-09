unit uCadMonografias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, uMonografias, ComCtrls, Main,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls,
   uItemCombo, DB;

type

  EValidaCadMonografia = class(Exception);

  TformCadMonografias = class(TForm)
    dbeCurso: TDBEdit;
    sbCurso: TSpeedButton;
    lbCurso: TLabel;
    dbeTurma: TDBEdit;
    sbTurma: TSpeedButton;
    lbTurma: TLabel;
    sbAluno: TSpeedButton;
    dbeAluno: TDBEdit;
    lbAluno: TLabel;
    dbmIdeiaInicial: TDBMemo;
    lbIdeiaInicial: TLabel;
    lbTema: TLabel;
    dbmTema: TDBMemo;
    lbOrientadorAceitou: TLabel;
    dbeNotaConceito: TDBEdit;
    lbNotaConceito: TLabel;
    lbSituacaoResultado: TLabel;
    lbObservacoes: TLabel;
    dbmObservacoes: TDBMemo;
    dbeValor: TDBEdit;
    lbValorPago: TLabel;
    tlbFormaEnvio: TLabel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    dtpDataInicio: TDateTimePicker;
    dbeDataInicio: TDBEdit;
    dbeDataEntrega: TDBEdit;
    dtpDataEntrega: TDateTimePicker;
    lbDataInicio: TLabel;
    lbDataEntrega: TLabel;
    edtCurso: TEdit;
    edtAluno: TEdit;
    dblSituacaoResultado: TDBLookupComboBox;
    lbOrientador: TLabel;
    DBEdit1: TDBEdit;
    edtOrientador: TEdit;
    sbtOrientador: TSpeedButton;
    dblSituacao: TDBLookupComboBox;
    dblFormaEnvio: TDBLookupComboBox;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    UpDownCursos: TUpDown;
    txtAnoSemestre: TMaskEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    dbeDataPagOrientador: TDBEdit;
    Label3: TLabel;
    dtPagOrientador: TDateTimePicker;
    DBCheckBox1: TDBCheckBox;
    mEData: TMaskEdit;
    mEDtEntrega: TMaskEdit;
    mEDatPag: TMaskEdit;
    edlbFormatoCD: TLabeledEdit;
    edlbTaxa: TLabeledEdit;
    dtEnvioProfessor: TDateTimePicker;
    dtRetornoProfessor: TDateTimePicker;
    dtImpressao: TDateTimePicker;
    Label4: TLabel;
    lbRetorno: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dtAprovacao: TDateTimePicker;
    dtCertificado: TDateTimePicker;
    meDtImpressaoMonografia: TMaskEdit;
    meDtaprovacao: TMaskEdit;
    meDtCertificado: TMaskEdit;
    meDtenviouProfessor: TMaskEdit;
    meDtRetornoProfessor: TMaskEdit;
    meDtSolicitacaoCertificado: TMaskEdit;
    meDtRecebimentoCertificado: TMaskEdit;
    meDtRecebimentoAta: TMaskEdit;
    meDtRecebimentoArtigo: TMaskEdit;
    dtSolicitacaoCertificado: TDateTimePicker;
    dtRecebimentoCertificado: TDateTimePicker;
    dtRecebimentoAta: TDateTimePicker;
    dtRecebimentoArtigo: TDateTimePicker;
    lblSolicitacaoCertificado: TLabel;
    lblRecebimentoCertificado: TLabel;
    lblRecebimentoAta: TLabel;
    lblRecebimentoArtigo: TLabel;
    Label5: TLabel;
    cbUnidadeCertificadora: TComboBox;
    qyUnidadeCertificadora: TUMZQuery;
    qyUnidadeCertificadoracd_instituicao: TIntegerField;
    qyUnidadeCertificadoranm_instituicao: TStringField;
    qyUnidadeCertificadorads_credenciamento: TStringField;
    qyUnidadeCertificadoranm_fantasia: TStringField;
    qyUnidadeCertificadorads_endereco: TStringField;
    qyUnidadeCertificadorads_complemento: TStringField;
    qyUnidadeCertificadorads_bairro: TStringField;
    qyUnidadeCertificadorads_cidade: TStringField;
    qyUnidadeCertificadorads_estado: TStringField;
    qyUnidadeCertificadorads_cep: TStringField;
    qyUnidadeCertificadorads_diretor: TStringField;
    qyUnidadeCertificadorads_tipo: TStringField;
    qyUnidadeCertificadorads_telefone1: TStringField;
    qyUnidadeCertificadorads_telefone2: TStringField;
    qyUnidadeCertificadorads_email: TStringField;
    qyUnidadeCertificadorads_site: TStringField;
    qyUnidadeCertificadorasn_educacao_infantil: TStringField;
    qyUnidadeCertificadorasn_ensino_fundamental: TStringField;
    qyUnidadeCertificadorasn_ensino_medio: TStringField;
    qyUnidadeCertificadorasn_ensino_superior: TStringField;
    qyUnidadeCertificadorasn_cursos_profissionalizantes: TStringField;
    qyUnidadeCertificadorasn_ensino_especial: TStringField;
    qyUnidadeCertificadorasn_unidade_certificadora: TSmallintField;
    qyUnidadeCertificadorasn_convenio: TSmallintField;
    qyUnidadeCertificadoraim_logo: TBlobField;
    qyUnidadeCertificadoracd_municipio_correio: TIntegerField;
    qyUnidadeCertificadoracd_bairro: TIntegerField;
    qyUnidadeCertificadoraDS_OBSERVACAO: TMemoField;
    procedure dbeTurmaChange(Sender: TObject);
    procedure dtRecebimentoArtigoChange(Sender: TObject);
    procedure dtRecebimentoAtaChange(Sender: TObject);
    procedure dtRecebimentoCertificadoChange(Sender: TObject);
    procedure dtSolicitacaoCertificadoChange(Sender: TObject);
    procedure dtEnvioProfessorChange(Sender: TObject);
    procedure edlbTaxaChange(Sender: TObject);
    procedure edlbFormatoCDChange(Sender: TObject);
    procedure dtImpressaoChange(Sender: TObject);
    procedure dtAprovacaoChange(Sender: TObject);
    procedure dtCertificadoChange(Sender: TObject);
    procedure dtRetornoProfessorChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtPagOrientadorChange(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure sbtOrientadorClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dtpDataEntregaChange(Sender: TObject);
    procedure sbAlunoClick(Sender: TObject);
    procedure sbCursoClick(Sender: TObject);
    procedure sbTurmaClick(Sender: TObject);
    procedure dtpDataInicioChange(Sender: TObject);
  private
    function getTamanhoTexto(const texto: String): Integer;  
  public
    { Public declarations }
  end;

var
  formCadMonografias: TformCadMonografias;

implementation

uses uFSelecionarTurma, uFSelecionarCurso, uFSelecionarPessoa, uDM, ZConnection, uUsuario;
{$R *.dfm}

procedure TformCadMonografias.btnCancelClick(Sender: TObject);
begin
    formMonografias.qyMonografias.Cancel();
    Close;
end;

procedure TformCadMonografias.btnOkClick(Sender: TObject);
const
   SChavePerm = 'Academico.Secretaria.Monografias.EntregaRetroativa';
   SMsgConfirmData = 'Você está selecionando uma data de entrega retroativa.'#13'Deseja prosseguir?';
   SMsgSemPerm = 'Você não possui privilégios suficientes para selecionar uma data de entrega retroativa.';
   STitConfirm = 'Confirmação';
   STitInfo = 'Informação';
   MsgFlagsQuest = MB_ICONQUESTION or MB_YESNO;
   MsgFlagsSemPerm = MB_ICONINFORMATION or MB_OK;
var
   Hoje: TDate;
begin
   Hoje := DM.DataAtual;

   if Trunc(dtpDataEntrega.Date) < Trunc(Hoje) then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, SChavePerm, npIncluir, False) then
      begin
         if MessageBox(Handle, SMsgConfirmData, STitConfirm, MsgFlagsQuest) = ID_NO then
         begin
            Exit;
         end;
      end
      else
      begin
         MessageBox(Handle, SMsgSemPerm, STitInfo, MsgFlagsSemPerm);
         mEDtEntrega.SetFocus;
         Exit;
      end;
   end;

   try
      if(formMonografias.qyMonografiascd_pessoa.AsInteger = 0)then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar um Aluno');
      end;

      if(formMonografias.qyMonografiascd_orientador.AsInteger = 0)then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar um Orientador');
      end;

      if(formMonografias.qyMonografiascd_area.AsInteger = 0)then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar uma Área');
      end;

      if(formMonografias.qyMonografiascd_turma.asString = '')then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar uma Turma');
      end; 

      if(formMonografias.qyMonografiascd_curso.asString = '')then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar um Curso');
      end;
      if(formMonografias.qyMonografiasdt_inicio.asString = '  /  /    ')then
      begin
        mEData.SetFocus;
        raise EValidaCadMonografia.Create('Você deve selecionar uma data inicial');
      end;
      
//      if(TItemCombo(cbUnidadeCertificadora.Items.Objects[cbUnidadeCertificadora.ItemIndex]).getCodigo <> '0')then
//      begin
         formMonografias.qyMonografiascd_unidade_certificadora.AsInteger :=  StrToInt(TItemCombo(cbUnidadeCertificadora.Items.Objects[cbUnidadeCertificadora.ItemIndex]).getCodigo);
//      end;
   Except
      on E:EValidaCadMonografia do
      begin
         Mensagem(E.Message);
         exit;
      end;
   end;

   formMonografias.qyMonografiasnr_anosemestre.AsInteger := StrToInt(txtAnoSemestre.Text);

   try
      formMonografias.qyMonografias.Post();
   finally
      formMonografias.qyMonografias.Close();
      formMonografias.qyMonografias.Open();

      Close();

   end;

end;

procedure TformCadMonografias.dtCertificadoChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_certificado.AsDateTime := dtCertificado.Date;
      meDtCertificado.Text :=    DateToStr(dtCertificado.date);
   end
   else
   begin
      if(meDtCertificado.Text <> '  /  /    ') then
      begin
         formMonografias.qyMonografiasdt_certificado.AsString := meDtCertificado.Text;
      end;
   end;
end;

procedure TformCadMonografias.dtEnvioProfessorChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_envio_professor.AsDateTime := dtEnvioProfessor.Date;
      meDtenviouProfessor.Text :=    DateToStr(dtEnvioProfessor.date);
   end
   else
   begin
      if(meDtenviouProfessor.Text <> '  /  /    ') then
      begin
        formMonografias.qyMonografiasdt_envio_professor.AsDateTime := StrToDate(meDtenviouProfessor.Text);
      end;
   end;
end;

procedure TformCadMonografias.dbeTurmaChange(Sender: TObject);
var
   qryTurma: TUMZQuery;
   i: integer;
begin

   DM.CriarConsulta(qryTurma);

   if qyUnidadeCertificadora.Active then
   begin
      qryTurma.Close;
      qryTurma.SQL.Text := 'SELECT cd_unidade_certificadora FROM turmas WHERE codigo = '+QuotedStr(formMonografias.qyMonografiascd_turma.AsString);
      qryTurma.Open;
      qyUnidadeCertificadora.Locate('cd_instituicao', qryTurma.FieldByName('cd_unidade_certificadora').AsInteger, []);
      for i := 0 to cbUnidadeCertificadora.Items.Count - 1 do
      begin
         if TItemCombo(cbUnidadeCertificadora.Items.Objects[i]).getCodigo = qyUnidadeCertificadoracd_instituicao.AsString then
         begin
           cbUnidadeCertificadora.ItemIndex := i;
         end;
      end;
   end;
end;

procedure TformCadMonografias.dtAprovacaoChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_aprovacao.AsDateTime := dtAprovacao.Date;
      meDtaprovacao.Text :=    DateToStr(dtAprovacao.date);
   end
   else
   begin
      if(meDtaprovacao.Text <> '  /  /    ') then
      begin
        formMonografias.qyMonografiasdt_aprovacao.AsDateTime := StrToDate(meDtaprovacao.Text);
      end;
   end;
end;

procedure TformCadMonografias.dtImpressaoChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_impressao_monografia.AsDateTime := dtImpressao.Date;
      meDtImpressaoMonografia.Text :=    DateToStr(dtImpressao.date);
   end
   else
   begin
      if(meDtaprovacao.Text <> '  /  /    ') then
      begin
         formMonografias.qyMonografiasdt_impressao_monografia.AsDateTime := StrToDate(meDtImpressaoMonografia.Text);
      end;
   end;
end;

procedure TformCadMonografias.dtPagOrientadorChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      dbeDataPagOrientador.Text := DateToStr(dtPagOrientador.Date);
      formMonografias.qyMonografiasdt_pag_orientador.AsDateTime := dtPagOrientador.Date;
      mEDatPag.Text:= DateToStr(dtPagOrientador.Date);
   end
   else
   begin
      if(mEDatPag.Text <> '  /  /    ') then
      begin 
         dbeDataPagOrientador.Text := mEDatPag.Text;
         formMonografias.qyMonografiasdt_pag_orientador.AsDateTime := StrToDate(mEDatPag.Text);
         mEDatPag.Text:= mEDatPag.Text;
      end;
   end;
end;

procedure TformCadMonografias.dtpDataEntregaChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      dbeDataEntrega.Text := DateToStr(dtpDataEntrega.Date);
      formMonografias.qyMonografiasdt_entrega.AsDateTime := dtpDataEntrega.Date;
      mEDtEntrega.Text:= DateToStr(dtpDataEntrega.Date);
   end
   else
   begin
      if(mEDtEntrega.Text <> '  /  /    ') then
      begin
         dbeDataEntrega.Text := mEDtEntrega.Text;
         formMonografias.qyMonografiasdt_entrega.AsDateTime := StrToDate(mEDtEntrega.Text);
         mEDtEntrega.Text:= mEDtEntrega.Text;
      end;
   end;
end;

procedure TformCadMonografias.dtpDataInicioChange(Sender: TObject);
begin
  if Sender is TDateTimePicker then
   begin
      dbeDataInicio.Text := DateToStr(dtpDataInicio.Date);
      formMonografias.qyMonografiasdt_inicio.AsDateTime := dtpDataInicio.Date;
      mEData.Text:= DateToStr(dtpDataInicio.Date);
   end
   else
   begin
      if(mEData.Text <> '  /  /    ') then
      begin
         dbeDataInicio.Text := mEData.Text;
         formMonografias.qyMonografiasdt_inicio.AsDateTime := StrToDate(mEData.Text);
         mEData.Text:= mEData.Text;
      end;
   end;
end;

procedure TformCadMonografias.dtRecebimentoArtigoChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_recebimento_artigo.AsDateTime := dtRecebimentoArtigo.Date;
      meDtRecebimentoArtigo.Text :=    DateToStr(dtRecebimentoArtigo.date);
   end
   else
   begin
       if(meDtRecebimentoArtigo.Text <> '  /  /    ') then
      begin
         formMonografias.qyMonografiasdt_recebimento_artigo.AsString := meDtRecebimentoArtigo.Text;
      end;
   end;
end;

procedure TformCadMonografias.dtRecebimentoAtaChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_recebimento_ata.AsDateTime := dtRecebimentoAta.Date;
      meDtRecebimentoAta.Text :=    DateToStr(dtRecebimentoAta.date);
   end
   else
   begin
      if(meDtRecebimentoAta.Text <> '  /  /    ') then
      begin
         formMonografias.qyMonografiasdt_recebimento_ata.AsString := meDtRecebimentoAta.Text;
      end;
   end;
end;

procedure TformCadMonografias.dtRecebimentoCertificadoChange(Sender: TObject);
begin
   begin
      if Sender is TDateTimePicker then
      begin
         formMonografias.qyMonografiasdt_recebimento_certificado.AsDateTime := dtRecebimentoCertificado.Date;
         meDtRecebimentoCertificado.Text :=    DateToStr(dtRecebimentoCertificado.date);
      end
      else
      begin
         if(meDtRecebimentoCertificado.Text <> '  /  /    ') then
         begin
            formMonografias.qyMonografiasdt_recebimento_certificado.AsString := meDtRecebimentoCertificado.Text;
         end;
      end;
   end;
end;

procedure TformCadMonografias.dtRetornoProfessorChange(Sender: TObject);
begin
    if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_retorno_professor.AsDateTime := dtRetornoProfessor.Date;
      meDtRetornoProfessor.Text :=    DateToStr(dtRetornoProfessor.date);
   end
   else
   begin
      if(meDtRetornoProfessor.Text <> '  /  /    ') then
      begin
         formMonografias.qyMonografiasdt_retorno_professor.AsDateTime := StrToDate(meDtRetornoProfessor.Text);
      end;
   end;
end;

procedure TformCadMonografias.dtSolicitacaoCertificadoChange(Sender: TObject);
begin
   if Sender is TDateTimePicker then
   begin
      formMonografias.qyMonografiasdt_solicitacao_certificado.AsDateTime := dtSolicitacaoCertificado.Date;
      meDtSolicitacaoCertificado.Text :=    DateToStr(dtSolicitacaoCertificado.date);
   end
   else
   begin
      if(meDtSolicitacaoCertificado.Text <> '  /  /    ') then
      begin
         formMonografias.qyMonografiasdt_solicitacao_certificado.AsString := meDtSolicitacaoCertificado.Text;
      end;
   end;
end;

procedure TformCadMonografias.edlbFormatoCDChange(Sender: TObject);
begin
   formMonografias.qyMonografiasds_formato_cd.AsString:= edlbFormatoCD.Text;
end;

procedure TformCadMonografias.edlbTaxaChange(Sender: TObject);
begin
   formMonografias.qyMonografiasds_taxa.AsString := edlbTaxa.Text;
end;

procedure TformCadMonografias.FormShow(Sender: TObject);
var
   i, maiorRegistro, registroAtual: integer;
begin
   if not(DM.UsaAnosemestre) then
   begin
      txtAnoSemestre.Visible := false;
      Label2.Visible := False;
      UpDownCursos.Visible := false;
   end;  
   if formMonografias.qyMonografias.State in [dsInsert] then
   begin
      if txtAnoSemestre.text = '' then begin
         txtAnoSemestre.text := IntToStr(ano_semestre);
      end;

      if (formMonografias.qyMonografiasdt_inicio.AsString<>'') then
      begin
         mEData.Text := formMonografias.qyMonografiasdt_inicio.AsString;
      end;
      dtEnvioProfessor.Date:=now();
      dtRetornoProfessor.Date:=now();
      dtpDataInicio.Date:=Now();
      dtpDataEntrega.Date:=Now();
      dtCertificado.Date:=Now();
      dtAprovacao.Date:=Now();
      dtImpressao.Date:=Now();
      dtPagOrientador.Date:=Now();
      dtSolicitacaoCertificado.Date:=Now();
      dtRecebimentoCertificado.Date:=Now();
      dtRecebimentoAta.Date:=Now();
      dtRecebimentoArtigo.Date:=Now();
   end
   else  if formMonografias.qyMonografias.State in [dsEdit] then
   begin
      //pega as datas da monografia
      if not(  formMonografias.qyMonografiasdt_envio_professor.IsNull) then
      begin
         dtEnvioProfessor.Date     :=    formMonografias.qyMonografiasdt_envio_professor.AsDateTime;
         meDtenviouProfessor.Text  :=    DateToStr(dtEnvioProfessor.date);
      end
      else
         dtEnvioProfessor.date:= now();

      if not(  formMonografias.qyMonografiasdt_retorno_professor.IsNull)  then
      begin
         dtRetornoProfessor.Date   :=    formMonografias.qyMonografiasdt_retorno_professor.AsDateTime;
         meDtRetornoProfessor.Text :=    DateToStr(dtRetornoProfessor.date);
      end
      else
         dtRetornoProfessor.date:= now();


      if not(  formMonografias.qyMonografiasdt_certificado.IsNull)  then
      begin
         dtCertificado.date        :=    formMonografias.qyMonografiasdt_certificado.AsDateTime;
         meDtCertificado.Text      :=    DateToStr(dtCertificado.date);
      end
      else
         dtCertificado.date:= now();

      if not(  formMonografias.qyMonografiasdt_aprovacao.IsNull)  then
      begin
         dtAprovacao.date          :=    formMonografias.qyMonografiasdt_aprovacao.AsDateTime;
         meDtaprovacao.Text        :=    DateToStr(dtAprovacao.date)
      end
      else
         dtAprovacao.date:= now();

      if not(  formMonografias.qyMonografiasdt_impressao_monografia.IsNull)  then
      begin
         dtImpressao.date          :=    formMonografias.qyMonografiasdt_impressao_monografia.AsDateTime;
         meDtImpressaoMonografia.Text :=    DateToStr(dtImpressao.date);
      end
      else
         dtImpressao.date:= now();

         if not(  formMonografias.qyMonografiasdt_solicitacao_certificado.IsNull)  then
      begin
         dtSolicitacaoCertificado.date   :=    formMonografias.qyMonografiasdt_solicitacao_certificado.AsDateTime;
         meDtSolicitacaoCertificado.Text :=    DateToStr(dtSolicitacaoCertificado.date);
      end
      else
         dtSolicitacaoCertificado.date:= now();

         if not(  formMonografias.qyMonografiasdt_recebimento_certificado.IsNull)  then
      begin
         dtRecebimentoCertificado.date   :=    formMonografias.qyMonografiasdt_recebimento_certificado.AsDateTime;
         meDtRecebimentoCertificado.Text :=    DateToStr(dtRecebimentoCertificado.date);
      end
      else
         dtRecebimentoCertificado.date:= now();

         if not(  formMonografias.qyMonografiasdt_recebimento_ata.IsNull)  then
      begin
         dtRecebimentoAta.date   :=    formMonografias.qyMonografiasdt_recebimento_ata.AsDateTime;
         meDtRecebimentoAta.Text :=    DateToStr(dtRecebimentoAta.date);
      end
      else
         dtRecebimentoAta.date:= now();

         if not(  formMonografias.qyMonografiasdt_recebimento_artigo.IsNull)  then
      begin
         dtRecebimentoArtigo.date   :=    formMonografias.qyMonografiasdt_recebimento_artigo.AsDateTime;
         meDtRecebimentoArtigo.Text :=    DateToStr(dtRecebimentoArtigo.date);
      end
      else
         dtRecebimentoArtigo.date:= now();

      txtAnoSemestre.text := IntToStr(formMonografias.qyMonografiasnr_anosemestre.AsInteger);

      //prencher texto de curso, aluno e area
      edtAluno.Text := IntToStr(formMonografias.qyMonografiascd_pessoa.asInteger)+'-'+formMonografias.qryPessoasnm_pessoa.asString;
      edtOrientador.Text := IntToStr(formMonografias.qyMonografiascd_orientador.asInteger)+'-'+formMonografias.qryOrientadornm_pessoa.AsString;
      edtCurso.Text := formMonografias.qyMonografiascd_curso.asString+'-'+formMonografias.qyMonografiasds_curso_codigo.AsString;
      mEData.Text :=   formMonografias.qyMonografiasdt_inicio.AsString;
      mEDtEntrega.Text := formMonografias.qyMonografiasdt_entrega.AsString;
      mEDatPag.Text := formMonografias.qyMonografiasdt_pag_orientador.AsString;
      edlbFormatoCD.Text:= formMonografias.qyMonografiasds_formato_cd.AsString;
      edlbTaxa.Text := formMonografias.qyMonografiasds_taxa.AsString;


      if formMonografias.qyMonografiasdt_inicio.AsString = '' then
         dtpDataInicio.Date   := Now()
      else
         dtpDataInicio.Date   := formMonografias.qyMonografiasdt_inicio.AsDateTime;

      if formMonografias.qyMonografiasdt_entrega.AsString = '' then
         dtpDataEntrega.Date  := Now()
      else
         dtpDataEntrega.Date  := formMonografias.qyMonografiasdt_entrega.AsDateTime;


      if formMonografias.qyMonografiasdt_pag_orientador.AsString = '' then
         dtPagOrientador.Date := now()
      else
         dtPagOrientador.Date := formMonografias.qyMonografiasdt_pag_orientador.AsDateTime;
   end;

   formMonografias.qyMonografiasnr_anosemestre.AsInteger  := StrToInt(txtAnoSemestre.Text);

   qyUnidadeCertificadora.Open;

   maiorRegistro := 400;

   cbUnidadeCertificadora.Clear;
   cbUnidadeCertificadora.AddItem( 'Selecione', TItemCombo.Create('0', 'Selecione'));

   cbUnidadeCertificadora.ItemIndex := 0;

   i := 1;

   while not qyUnidadeCertificadora.Eof do
   begin
      cbUnidadeCertificadora.AddItem( qyUnidadeCertificadora.FieldByName('nm_instituicao').AsString, TItemCombo.Create( qyUnidadeCertificadora.FieldByName('cd_instituicao').AsString, qyUnidadeCertificadora.FieldByName('nm_instituicao').AsString ) );

      registroAtual := getTamanhoTexto( qyUnidadeCertificadora.FieldByName('nm_instituicao').AsString );

      if registroAtual > maiorRegistro then
         maiorRegistro := registroAtual;

      if qyUnidadeCertificadora.FieldByName('cd_instituicao').AsInteger = formMonografias.qyMonografiascd_unidade_certificadora.AsInteger then
         cbUnidadeCertificadora.ItemIndex := i;

      inc(i);
      qyUnidadeCertificadora.Next;
   end;

   if maiorRegistro > 700 then
      cbUnidadeCertificadora.Perform(CB_SETDROPPEDWIDTH, 700, 0)
   else
      cbUnidadeCertificadora.Perform(CB_SETDROPPEDWIDTH, maiorRegistro, 0);   

   DBLookupComboBox1.SetFocus;

end;

function TformCadMonografias.getTamanhoTexto(const texto: String): Integer;
var
  aCanvas: TCanvas;
begin
  aCanvas := TCanvas.Create;
  aCanvas.Handle := GetWindowDC(GetDesktopWindow);
  Result := aCanvas.TextWidth(texto);
  aCanvas.Free;
end;

procedure TformCadMonografias.sbAlunoClick(Sender: TObject);
var
   qyCursos : TUMZQuery;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante, formMonografias.qyMonografiasnr_anosemestre.AsInteger);

   if not resultado_filtro.filtrado then Exit;

  if(resultado_filtro.nr_anosemestre > 0) then
  begin
    formMonografias.qyMonografiasnr_anosemestre.AsInteger := resultado_filtro.nr_anosemestre;
    txtAnoSemestre.text :=  intToStr(formMonografias.qyMonografiasnr_anosemestre.AsInteger);
  end;
  
  formMonografias.qyMonografiascd_pessoa.AsInteger := resultado_filtro.cd_pessoa;
  edtAluno.Text := IntToStr(resultado_filtro.cd_pessoa) + ' - ' + resultado_filtro.nm_pessoa;

  formMonografias.qyMonografiascd_turma.AsString := resultado_filtro.cd_turma;

  //ja resgata o curso da pessoa
  Dm.CriarConsulta(qyCursos);
  qyCursos.Close();


  qyCursos.SQL.Clear;
  qyCursos.SQL.Add('SELECT c.codigo as cd_curso, c.descricao as descricao from cursos c');
  qyCursos.SQL.Add(' INNER JOIN turmas t ON(t.curso=c.codigo AND t.anosemestre=c.anosemestre)');
  qyCursos.SQL.Add(' WHERE t.anosemestre=:anosemestre AND');
  qyCursos.SQL.Add(' t.codigo=:cd_turma');
  qyCursos.ParamByName('anosemestre').AsInteger:= formMonografias.qyMonografiasnr_anosemestre.AsInteger;
  qyCursos.ParamByName('cd_turma').asString:= formMonografias.qyMonografiascd_turma.asString;

  qyCursos.Open();

  if(qyCursos.FieldByName('cd_curso').asString <> '') then
  begin
    formMonografias.qyMonografiascd_curso.asString := qyCursos.FieldByName('cd_curso').asString;
    edtCurso.Text := qyCursos.FieldByName('cd_curso').asString+'-'+qyCursos.FieldByName('descricao').asString;
  end;

  FreeAndNil(qyCursos);
  end;

procedure TformCadMonografias.sbCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, formMonografias.qyMonografiasnr_anosemestre.AsInteger);

   if not resultado_filtro.filtrado then Exit;

   formMonografias.qyMonografiascd_curso.AsString := resultado_filtro.cd_curso;
   edtCurso.Text := resultado_filtro.cd_curso + ' - ' + resultado_filtro.ds_curso;
end;

procedure TformCadMonografias.sbTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], formMonografias.qyMonografiasnr_anosemestre.AsInteger);

   if not resultado_filtro.filtrado then Exit;

   formMonografias.qyMonografiascd_turma.AsString := resultado_filtro.cd_turma;
end;


procedure TformCadMonografias.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  formMonografias.qyMonografiasnr_anosemestre.AsInteger  := StrToInt(txtAnoSemestre.Text);
end;

procedure TformCadMonografias.sbtOrientadorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([bapOrientadorAtivo], afpOrientador,
      formMonografias.qyMonografiasnr_anosemestre.AsInteger);

   if not resultado_filtro.filtrado then Exit;

   formMonografias.qyMonografiascd_orientador.AsInteger := resultado_filtro.cd_pessoa;
   edtOrientador.Text := IntToStr(resultado_filtro.cd_pessoa) + ' - ' + resultado_filtro.nm_pessoa;
end;

end.

