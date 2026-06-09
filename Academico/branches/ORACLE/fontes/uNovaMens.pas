unit uNovaMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, Db, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, ZConnection,
  Buttons, uLoginManager, UMAjuda;

type

  Tfrm_mensa_alterar = class(TForm)
    TabControl1: TTabControl;
    lbCodigoAluno: TLabel;
    dbNomeAluno: TDBText;
    lbParcelaInicial: TLabel;
    lbDataVencimento: TLabel;
    lbValorBruto: TLabel;
    lbValorDesconto: TLabel;
    lbValorExtra: TLabel;
    lbTurma: TLabel;
    lbAnoLetivo: TLabel;
    lbDataPagto: TLabel;
    lbValorJuros: TLabel;
    lbValorTotal: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    lbNossoNumero: TLabel;
    dbCodigoAluno: TDBEdit;
    dbParcelaInicial: TDBEdit;
    dbVencimento: TDBEdit;
    dbValorBruto: TDBEdit;
    dbValorDesconto: TDBEdit;
    dbValorExtra: TDBEdit;
    dbTurma: TDBEdit;
    dbAnoLetivo: TDBEdit;
    dbPagamento: TDBEdit;
    dbValorJuros: TDBEdit;
    dbValorTotal: TDBEdit;
    dbNossoNumero: TDBEdit;
    lbParcelaFinal: TLabel;
    edParcelaFinal: TEdit;
    upDnParcelaInicial: TUpDown;
    upDnParcelaFinal: TUpDown;
    Label1: TLabel;
    Label2: TLabel;
    tblMatriculas: TUMZQuery;
    tblPlanos: TUMZQuery;
    tblDescontos: TUMZQuery;
    tblMatriculasturma: TStringField;
    tblMatriculasdescPlano: TStringField;
    tblMatriculasdescDesconto: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lbCreditos: TLabel;
    qyAux: TUMZQuery;
    lbTipoTitulo: TLabel;
    dbTipoTitulo: TDBLookupComboBox;
    Label3: TLabel;
    dbCompetencia: TDBEdit;
    chkCompetencia: TCheckBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lbPlanoContas: TLabel;
    lbCentroCusto: TLabel;
    lbHistorico: TLabel;
    dbPlanoContas: TDBLookupComboBox;
    dbCentroCusto: TDBLookupComboBox;
    dbHistorico: TDBEdit;
    qyPlanoContas: TUMZQuery;
    qyCentroCustos: TUMZQuery;
    qyPlanoContasds_conta: TStringField;
    qyCentroCustosds_centro: TStringField;
    dsPlanoContas: TDataSource;
    dsCentroCustos: TDataSource;
    dbCreditos: TDBCheckBox;
    qyPlanoContascd_conta: TLargeintField;
    tblMatriculascodigoaluno: TIntegerField;
    tblMatriculasanosemestre: TSmallintField;
    tblMatriculasplanopagamento: TIntegerField;
    tblMatriculasplanodesconto: TIntegerField;
    qyCentroCustoscd_centro: TLargeintField;
    chkApenasDiasUteis: TCheckBox;
    sbCadeado: TSpeedButton;
    tblPlanosCD_PLANO: TIntegerField;
    tblPlanosCD_COLIGADA: TIntegerField;
    tblPlanosDS_PLANO: TStringField;
    tblPlanosNR_ANOSEMESTRE: TSmallintField;
    tblPlanosVL_CONTRATO: TFloatField;
    tblPlanosVL_DESCONTO: TFloatField;
    tblPlanosVL_MATRICULA: TFloatField;
    tblPlanosdesc_completa: TStringField;
    tblPlanosplanoMatricula: TIntegerField;
    tblPlanosVL_COBRADO: TFloatField;
    umInfoCondicional: TUMAjuda;
    ckb_recalcular_descontos_vlr_bruto: TCheckBox;
    tblDescontosCODIGO: TIntegerField;
    tblDescontosDESCRICAOPLANO: TStringField;
    tblDescontosPERCENTUALDESCONTO: TFloatField;
    tblDescontosVALORDESCONTO: TFloatField;
    tblDescontosSN_CONDICIONAL: TSmallintField;
    procedure dbValorBrutoExit(Sender: TObject);
    procedure dbValorTotalEnter(Sender: TObject);
    procedure dbValorJurosEnter(Sender: TObject);
    procedure dbValorExtraEnter(Sender: TObject);
    procedure dbValorBrutoEnter(Sender: TObject);
    procedure dbCompetenciaChange(Sender: TObject);
    procedure dbVencimentoChange(Sender: TObject);
    procedure dbCreditosKeyPress(Sender: TObject; var Key: Char);
    procedure chkCompetenciaClick(Sender: TObject);
    procedure dbCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodigoAlunoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbValorBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure upDnParcelaInicialClick(Sender: TObject; Button: TUDBtnType);
    procedure upDnParcelaFinalClick(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tblPlanosCalcFields(DataSet: TDataSet);
    procedure edParcelaFinalExit(Sender: TObject);
    procedure dbParcelaInicialExit(Sender: TObject);
  private
    { Private declarations }

    iCodColigada     : Integer;
    chaveCodigoAluno : Integer;
    chaveTurma       : String;
    chaveAnoSemestre : Integer;
    chaveParcela     : Integer;
    chaveVencimento  : TDateTime;
    chaveCompetencia : TDateTime;
    dt_pgto          : TDateTime;
    situacao         : integer;
    nossonumero      : string;
    vlr_bruto, vlr_desconto, vlr_desconto_extra,
    vlr_extra, vlr_juros, vlr_total, vlr_pago: Currency;
    Tipo_titulo  : Integer;
    plano_contas : Integer;
    centro_custos: Integer;
    chaveHistorico : String;
    sn_credito_parcela: String;

    alterouDataVencimento,
    aplicouCentro: Boolean;

    alterouDataCompetencia: Boolean;
    vlr_bruto_original, DescontoNovo, DescontoOriginal: Currency;

    Procedure AtualizaMovimentoCR(CdMensalidadeOrigem : Integer; NovoValorEntrada : Currency; NovoValorDesconto : Currency);

    procedure alteraPlano(turma: String; anoSemestre: Integer);

    {Altera o valor o Sender para que na edição dos valores monetários da
    tela nao gere um erro caso passe de 1000}
    procedure AlteraValorEdicao(Sender: TObject);
    procedure vlr_bruto_alterado();
    procedure recalcularDescontos();

  public
    { Public declarations }     
  end;

var
  frm_mensa_alterar: Tfrm_mensa_alterar;

implementation

uses uMensalidades, uDM, Main, Math, uIUMDataModule,uUsuario;

{$R *.DFM}

procedure Tfrm_mensa_alterar.dbCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext( TWinControl( Sender ), True, True );
    Key := #0;
  end;
end;

procedure Tfrm_mensa_alterar.dbCompetenciaChange(Sender: TObject);
begin
   alterouDataCompetencia := True;
end;

procedure Tfrm_mensa_alterar.dbCreditosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin
    btnConfirmar.SetFocus();
    Key := #0;
  end;

end;

procedure Tfrm_mensa_alterar.dbCodigoAlunoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
  end;
end;

procedure Tfrm_mensa_alterar.chkCompetenciaClick(Sender: TObject);
begin
    if chkCompetencia.Checked then begin
       if Mensagem('Alterar a data de competência pode interferir em relatórios de previsões ja impressos. Tem certeza que deseja continuar?', 'Atenção', MB_YESNOCANCEL + MB_ICONWARNING) <> mrYes then begin
          chkCompetencia.Checked := False;
          dbCompetencia.Enabled := False;
          Label3.Enabled := False;
       end
       else begin
          chkCompetencia.Checked := True;
          dbCompetencia.Enabled := True;
          Label3.Enabled := True;
       end;
    end
    else begin
          chkCompetencia.Checked := False;
          dbCompetencia.Enabled := False;
          Label3.Enabled := False;
          DM.tblMensalidadesdt_competencia.AsDateTime := chaveCompetencia;
    end;
end;

procedure Tfrm_mensa_alterar.btnCancelarClick(Sender: TObject);
begin
  DM.tblMensalidades.Cancel;
  Close;
end;

procedure Tfrm_mensa_alterar.btnConfirmarClick(Sender: TObject);
const
  sMensagemAlteracaoDia = 'Você deseja alterar somente o dia da data de %s, mantendo o mês e ano originais das parcelas?';
var
  log: string;
  { Guardar todos os dados digitados }

  intCodigoAluno    : Integer;
  strTurma          : String;
  IntAnoSemestre    : Integer;
  intParcelaInicial : Integer;
  intParcelaFinal   : Integer;
  datVencimento     : TDateTime;
  datPagamento      : TDateTime;
  datCompetencia    : TDateTime;
  intSituacao       : Integer;
  strNossoNumero    : String;
  curValorBruto     : Currency;
  curValorDesconto  : Currency;
  curDescontoExtra  : Currency;
  curValorExtra     : Currency;
  curValorJuros     : Currency;
  curValorTotal     : Currency;
  curValorPago      : Currency;
  intTipoTitulo     : Integer;
  strHistorico      : string;
  intPlanoContas    : Integer;
  intCentroCustos   : Integer;
  bCreditoParcela   : String;
  i                 : Integer;
  msg               : string;
  alterarDiaVenc    : boolean;
  alterarDiaComp    : boolean;
  alterarSomenteDia : boolean;

  datNovoVencimento  : TDateTime;
  datNovaCompetencia : TDateTime;

  anoVenc, mesVenc, diaVenc : word;
  anoComp, mesComp, diaComp : word;
  anoAux,  mesAux,  diaAux  : word;

  mesVencAntigo, mesVencNovo: word;
  mesCompAntigo, mesCompNovo: word;

  anoVencAntigo, anoVencNovo: word;
  anoCompAntigo, anoCompNovo: word;

  diaVencFixo, diaCompFixo : word;

  iPar_Ini : Word;

begin

   //caso assinalado ajusta a data para dia util
   if chkApenasDiasUteis.Checked = true then
   begin
      DecodeDate(DM.tblMensalidadesDataVencimento.AsDateTime, anoVenc, mesVenc, diaVenc);
      DM.tblMensalidadesDataVencimento.AsDateTime := DiaUtil(anoVenc, mesVenc, diaVenc, Self.iCodColigada);
   end;

  { Ler os valor digitados e guardar nas variáveis }

  intCodigoAluno   := DM.tblMensalidadesCodigoAluno.AsInteger;
  strTurma         := DM.tblMensalidadesTurma.AsString;
  IntAnoSemestre   := DM.tblMensalidadesAnoSemestre.AsInteger;
  intParcelaInicial:= DM.tblMensalidadesParcela.AsInteger;
  intParcelaFinal  := StrToInt(edParcelaFinal.Text);
  datVencimento    := DM.tblMensalidadesDataVencimento.AsDateTime;
  datCompetencia   := Dm.tblMensalidadesdt_competencia.AsDateTime;
  datPagamento     := DM.tblMensalidadesDataPagamento.AsDateTime;
  intSituacao      := DM.tblMensalidadesSituacao.AsInteger;
  strNossoNumero   := DM.tblMensalidadesNossoNumero.AsString;
  curValorBruto    := DM.tblMensalidadesValorBruto.AsCurrency;
  curValorDesconto := DM.tblMensalidadesValorDesconto.AsCurrency;
  curDescontoExtra := DM.tblMensalidadesDescontoExtra.AsCurrency;
  curValorExtra    := DM.tblMensalidadesValorExtra.AsCurrency;
  curValorJuros    := DM.tblMensalidadesValorJuros.AsCurrency;
  curValorTotal    := DM.tblMensalidadesValorTotal.AsCurrency;
  curValorPago     := Dm.tblMensalidadesValorPago.AsCurrency;
  intTipoTitulo    := DM.tblMensalidadescd_tipo_titulo.AsInteger;
  intPlanoContas   := DM.tblMensalidadescd_plano_conta.AsInteger;
  intCentroCustos  := Dm.tblMensalidadescd_centro_custo.AsInteger;
  strHistorico     := DM.tblMensalidadesds_historico.AsString;
  bCreditoParcela  := DM.tblMensalidadessn_credito_parcela.AsString;


  DescontoOriginal := DM.tblMensalidadesValorDesconto.AsCurrency;

  // testar Bloqueio

  if DM.EstaBloqueado(datVencimento, true) then Exit;
  if DM.EstaBloqueado(datCompetencia, true) then Exit;

  // Gerando a mensagem que vai no log da alteração

  // Alterar o total de créditos
  if (DM.tblMensalidadessn_credito_parcela.AsString = 'S') then begin
     if DM.tblMensalidadesvl_credito.AsCurrency > 0 then
        DM.tblMensalidadesnr_creditos.AsCurrency := RoundFloat(Dm.tblMensalidadesValorBruto.AsCurrency / DM.tblMensalidadesvl_credito.AsCurrency, 3)
     else
        DM.tblMensalidadesnr_creditos.AsString := '';
  end else begin
     DM.tblMensalidadesnr_creditos.AsString := '';
  end;

  CASE TabControl1.TabIndex of
     0 : Begin // Parcela Selecionada
            // Montra o log com as informações capturadas da mensalidade aberta antes da alteração
            log := '';
            if chaveCodigoAluno <> intCodigoAluno then
               log := log + 'Código do aluno: ['+IntToStr(chaveCodigoAluno)+'] => ['+IntToStr(intCodigoAluno)+'].'+chr(13);

            if chaveTurma <> strTurma then
               log := log + 'Código da turma: ['+chaveTurma+'] => ['+strTurma+'].'+chr(13);

            if chaveAnoSemestre <> IntAnoSemestre then
               log := log + 'Ano/semestre: ['+IntToStr(chaveAnoSemestre)+'] => ['+IntToStr(IntAnoSemestre)+'].'+chr(13);

            if chaveParcela <> intParcelaInicial then
               log := log + 'Parcela: ['+IntToStr(chaveParcela)+'] => ['+IntToStr(intParcelaInicial)+'].'+chr(13);

            if chaveVencimento <> datVencimento then
               log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',chaveVencimento)+'] => ['+FormatDateTime('dd/mm/yyyy',datVencimento)+'].'+chr(13);

            if chaveCompetencia <> datCompetencia then
               log := log + 'Competência: ['+FormatDateTime('dd/mm/yyyy',chaveCompetencia)+'] => ['+FormatDateTime('dd/mm/yyyy',datCompetencia)+'].'+chr(13);

            if dt_pgto <> datPagamento then
               log := log + 'Data de pagamento: ['+FormatDateTime('dd/mm/yyyy',dt_pgto)+'] => ['+FormatDateTime('dd/mm/yyyy',datPagamento)+'].'+chr(13);

            if chaveCodigoAluno <> intCodigoAluno then
               log := log + 'Código do aluno: ['+IntToStr(chaveCodigoAluno)+'] => ['+IntToStr(intCodigoAluno)+'].'+chr(13);

            if chaveTurma <> strTurma then
               log := log + 'Código da turma: ['+chaveTurma+'] => ['+strTurma+'].'+chr(13);

            if chaveAnoSemestre <> IntAnoSemestre then
               log := log + 'Ano/semestre: ['+IntToStr(chaveAnoSemestre)+'] => ['+IntToStr(IntAnoSemestre)+'].'+chr(13);

            if chaveParcela <> intParcelaInicial then
               log := log + 'Parcela: ['+IntToStr(chaveParcela)+'] => ['+IntToStr(intParcelaInicial)+'].'+chr(13);

            if chaveVencimento <> datVencimento then
               log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',chaveVencimento)+'] => ['+FormatDateTime('dd/mm/yyyy',datVencimento)+'].'+chr(13);

            if chaveCompetencia <> datCompetencia then
               log := log + 'Competência: ['+FormatDateTime('dd/mm/yyyy',chaveCompetencia)+'] => ['+FormatDateTime('dd/mm/yyyy',datCompetencia)+'].'+chr(13);

            if dt_pgto <> datPagamento then
               log := log + 'Data de pagamento: ['+FormatDateTime('dd/mm/yyyy',dt_pgto)+'] => ['+FormatDateTime('dd/mm/yyyy',datPagamento)+'].'+chr(13);

            if situacao <> intSituacao then
               log := log + 'Situação: ['+IntToStr(situacao)+'] => ['+IntToStr(intSituacao)+'].'+chr(13);

            if nossonumero <> strNossoNumero then
               log := log + 'Nosso número: ['+nossonumero+'] => ['+strNossoNumero+'].'+chr(13);

            if vlr_bruto <> curValorBruto then
               log := log + 'Valor Bruto: ['+FloatToStr(vlr_bruto)+'] => ['+FloatToStr(curValorBruto)+'].'+chr(13);

            if vlr_desconto <> curValorDesconto then
              log := log + 'Valor Desconto: ['+FloatToStr(vlr_desconto)+'] => ['+FloatToStr(curValorDesconto)+'].'+chr(13);

            if vlr_desconto_extra <> curDescontoExtra then
              log := log + 'Desconto Extra: ['+FloatToStr(vlr_desconto_extra)+'] => ['+FloatToStr(curDescontoExtra)+'].'+chr(13);

            if vlr_extra <> curValorExtra then
              log := log + 'Valor Extra: ['+FloatToStr(vlr_extra)+'] => ['+FloatToStr(curValorExtra)+'].'+chr(13);

            if vlr_juros <> curValorJuros then
              log := log + 'Valor Juros: ['+FloatToStr(vlr_juros)+'] => ['+FloatToStr(curValorJuros)+'].'+chr(13);

            if vlr_total <> curValorTotal then
              log := log + 'Valor Total: ['+FloatToStr(vlr_total)+'] => ['+FloatToStr(curValorTotal)+'].'+chr(13);

            if vlr_pago <> curValorPago then
              log := log + 'Valor Pago: ['+FloatToStr(vlr_pago)+'] => ['+FloatToStr(curValorPago)+'].'+chr(13);

            if Tipo_Titulo <> intTipoTitulo then
              log := log + 'Tipo de Tít.: ['+IntToStr(Tipo_titulo)+'] => ['+IntToStr(intTipoTitulo)+'].'+chr(13);

            if plano_contas <> intPlanoContas then
              log := log + 'Plano de Contas.: ['+IntToStr(plano_contas)+'] => ['+IntToStr(intPlanoContas)+'].'+chr(13);

            if centro_custos <> intCentroCustos then
              log := log + 'Tipo de Tít.: ['+IntToStr(centro_custos)+'] => ['+IntToStr(intCentroCustos)+'].'+chr(13);
              
            if sn_credito_parcela <> bCreditoParcela then
            begin
               log := log + 'Corrigir por Cr.: [' + sn_credito_parcela + '] => [' + DM.tblMensalidadessn_credito_parcela.AsString + ']';
            end;

            if DM.tblMensalidades.State in [dsInsert] then
               DM.tblMensalidadesDataEmissao.AsDateTime := DataHoje;

            if DM.tblMensalidadesUsuario.AsString <> 'RETORNO' then
                DM.tblMensalidadesUsuario.AsString := DM.sLogin;

            Dm.tblMensalidadescd_usuario.AsInteger := DM.iCdPessoaLogado;

            frmMensalidades.xCodigoAluno := DM.tblMensalidadesCodigoAluno.AsInteger;
            frmMensalidades.xParcela     := DM.tblMEnsalidadesParcela.AsInteger;
            frmMensalidades.xDataVEncimento := DM.tblMEnsalidadesDataVencimento.AsDateTime;
            frmMensalidades.xTurma       := DM.tblMensalidadesTurma.AsString;

            { Emitir remessa para o banco com a alteração }
            { Claudionor: 07/05/2015
              Foi alterado a lógica para incluir na remessa apenas se o boleto for reimpresso;
              Se apenas alterar informações e não reeimprimir um boleto, não faz sentido enviar novamente para a remessa. 

            if DM.tblMensalidadesDataVencimento.Value <> chaveVencimento then begin
               DM.FazAcaoRemessa(arProrrogar, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
            end;

            DM.FazAcaoRemessa(arAltMensalidade, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
            }

            DM.tblMensalidades.Post;

            AtualizaMovimentoCR(
               DM.tblMensalidadescd_mensalidade_origem.AsInteger,
               curValorBruto + curValorExtra,
               curDescontoExtra
            );

            DescontoNovo := DM.tblMensalidadesValorDesconto.AsCurrency;

            Self.recalcularDescontos();

            { Verificar os Planos }

            try
               tblMatriculas.Post;
            except
               tblMatriculas.Cancel;
            end;

            close;

            DM.gerar_log( 10, 'Alterado parcela '+DM.tblMensalidades.FieldByName('Parcela').AsString+'.'+chr(13)+log, DM.iCdPessoaLogado, DM.tblMensalidadescd_mensalidade.AsString );

            Exit;

         End; // Fim da Parcela Selecionada

     1 : Begin  // ALUNO
                           
            try
               tblMatriculas.Post;
            except
               tblMatriculas.Cancel;
            end;

            Dm.tblMensalidades.Cancel;

            Dm.qAux1.Close;
            Dm.qAux1.SQL.Clear;
            Dm.qAux1.SQL.Add(' select * from mensalidades where ');
            Dm.qAux1.SQL.Add(' codigoaluno = :codigoaluno and ');
            Dm.qAux1.SQL.Add(' turma = :turma and anosemestre = :anosemestre and ');
            Dm.qAux1.SQL.Add(' parcela >= :parcelainicial and parcela <= :parcelafinal');
            Dm.qAux1.SQL.Add(' AND cd_tipo_titulo = :tipo_titulo ');            
            Dm.qAux1.SQL.Add(' order by parcela ');

            Dm.qAux1.ParamByName('codigoaluno')   .AsInteger := chaveCodigoAluno;
            DM.qAux1.ParamByName('turma')         .AsString  := chaveTurma;
            DM.qAux1.ParamByName('anosemestre')   .AsInteger := chaveAnoSemestre;
            Dm.qAux1.ParamByName('parcelainicial').AsInteger := intParcelaInicial;
            DM.qAux1.ParamByName('parcelafinal')  .AsInteger := intParcelaFinal;
            DM.qAux1.ParamByName('tipo_titulo')   .AsInteger := Tipo_Titulo;
            // Dm.qAux1.RequestLive := True;

            DM.qAux1.Open;

            DM.qAux1.First;

            datNovoVencimento := datVencimento;
            datNovaCompetencia := datCompetencia;

            // Inicia as variáveis de ano / mes / dia do vencimento e competencia
            // Verifica se o usuário deseja alterar somente o dia dos títulos
            if not Dm.qAux1.Eof then
            begin
               DecodeDate(Dm.qAux1.FieldByName('DataVencimento').AsDateTime, anoVencAntigo, mesVencAntigo, diaAux);
               DecodeDate(datNovoVencimento, anoVenc, mesVenc, diaVenc);
               anoVencNovo := anoVenc;
               mesVencNovo := mesVenc;
               diaVencFixo := diaVenc;

               DecodeDate(Dm.qAux1.FieldByName('dt_competencia').AsDateTime, anoCompAntigo, mesCompAntigo, diaAux);
               DecodeDate(datNovaCompetencia, anoComp, mesComp, diaComp);
               anoCompNovo := anoComp;
               mesCompNovo := mesComp;
               diaCompFixo := diaComp;

               // Verifica se houve alteração na data de vencimento e se foi alterado apenas o dia da mesma
               alterarDiaVenc := false;
               if (datVencimento <> chaveVencimento) and (mesVencAntigo = mesVencNovo) and (anoVencAntigo = anoVencNovo) then
               begin
                  alterarDiaVenc := true;
               end;

               // Verifica se houve alteração na data de vencimento e se foi alterado apenas o dia da mesma
               alterarDiaComp := false;
               if (datCompetencia <> chaveCompetencia) and (mesCompAntigo = mesCompNovo) and (anoCompAntigo = anoCompNovo) then
               begin
                  alterarDiaComp := true;
               end;

               // Verifica se a mensagem deve ser apresentada com a data de vencimento, competência ou ambas
               if alterarDiaVenc and alterarDiaComp then
               begin
                  msg := Format(sMensagemAlteracaoDia, ['vencimento e competência'] );
               end else if alterarDiaVenc then
               begin
                  msg := Format(sMensagemAlteracaoDia, ['vencimento'] );
               end else if alterarDiaComp then
               begin
                  msg := Format(sMensagemAlteracaoDia, ['competência'] );
               end;

               // Verifica se o usuário deseja efetuar a alteração somente do dia da data de vencimento ou competência
               alterarSomenteDia := false;
               if alterarDiaVenc or alterarDiaComp then
               begin
                  if Mensagem(msg, 'Atenção', MB_YESNOCANCEL + MB_ICONWARNING) = mrYes then begin
                     alterarSomenteDia := true;
                  end;
               end;
                      
            end;

            while not Dm.qAux1.Eof do Begin
               if (DM.qAux1.FieldByName('situacao').AsInteger in [2, 10]) and
                  (DM.qAux1.FieldByName('tipoparcela').AsInteger <> 1) and
                  (DM.qAux1.FieldByName('sn_nfe_gerada').AsInteger = 0) then
               Begin

               if(vlr_desconto <> curValorDesconto) then
               begin
                  //Se o valor de desconto for maior que o bruto menos o desconto extra não altera
                  if(curValorDesconto > (DM.qAux1.FieldByName('valorbruto').AsCurrency - DM.qAux1.FieldByName('descontoextra').AsCurrency) ) then
                  begin
                     Dm.qAux1.Next;
                     continue;
                  end;
               end;

                   DM.qAux1.Edit;

                   // Ir configurando o log conforme foi alterado

                   log := '';

                   if chaveTurma <> strTurma then begin
                      log := log + 'Código da turma: ['+DM.qAux1.FieldByName('Turma').AsString+'] => ['+strTurma+'].'+chr(13);
                      DM.qAux1.FieldByName('Turma').AsString           :=  strTurma;
                   end;
                      
                   if chaveAnoSemestre <> IntAnoSemestre then begin
                      log := log + 'Ano/semestre: ['+IntToStr(DM.qAux1.FieldByName('anosemestre').AsInteger)+'] => ['+IntToStr(IntAnoSemestre)+'].'+chr(13);
                      DM.qAux1.FieldByName('anosemestre').AsInteger    :=  IntAnoSemestre;
                   end;

                   if vlr_bruto <> curValorBruto then begin
                      log := log + 'Valor Bruto: ['+FloatToStr(DM.qAux1.FieldByName('valorbruto').AsCurrency)+'] => ['+FloatToStr(curValorBruto)+'].'+chr(13);
                      DM.qAux1.FieldByName('valorbruto').AsCurrency    :=  curValorBruto;
                   end;

                   if vlr_desconto <> curValorDesconto then begin
                      log := log + 'Valor Desconto: ['+FloatToStr(DM.qAux1.FieldByName('valordesconto').AsCurrency)+'] => ['+FloatToStr(curValorDesconto)+'].'+chr(13);
                      DM.qAux1.FieldByName('valordesconto').AsCurrency :=  curValorDesconto;
                   end;

                   if vlr_desconto_extra <> curDescontoExtra then begin
                      log := log + 'Desconto Extra: ['+FloatToStr(DM.qAux1.FieldByName('descontoextra').AsCurrency)+'] => ['+FloatToStr(curDescontoExtra)+'].'+chr(13);
                      DM.qAux1.FieldByName('descontoextra').AsCurrency :=  curDescontoExtra;
                   end;

                   if vlr_extra <> curValorExtra then begin
                      log := log + 'Valor Extra: ['+FloatToStr(DM.qAux1.FieldByName('valorextra').AsCurrency)+'] => ['+FloatToStr(curValorExtra)+'].'+chr(13);
                      DM.qAux1.FieldByName('valorextra').AsCurrency    :=  curValorExtra;
                   end;

                   if vlr_juros <> curValorJuros then begin
                      log := log + 'Valor Juros: ['+FloatToStr(DM.qAux1.FieldByName('valorjuros').AsCurrency)+'] => ['+FloatToStr(curValorJuros)+'].'+chr(13);
                      DM.qAux1.FieldByName('valorjuros').AsCurrency    :=  curValorJuros;
                   end;

                   if vlr_total <> curValorTotal then begin
                      log := log + 'Valor Total: ['+FloatToStr(DM.qAux1.FieldByName('valortotal').AsCurrency)+'] => ['+FloatToStr(curValorTotal)+'].'+chr(13);
                      DM.qAux1.FieldByName('valortotal').AsCurrency    :=  curValorTotal;
                   end;

                   if Tipo_Titulo <> intTipoTitulo then begin
                      log := log + 'Tipo de Tít.: ['+IntToStr(DM.qAux1.FieldByName('cd_tipo_titulo').AsInteger)+'] => ['+IntToStr(intTipoTitulo)+'].'+chr(13);
                      DM.qAux1.FieldByName('cd_tipo_titulo').AsInteger := intTipoTitulo;
                   end;

                   if plano_contas <> intPlanoContas then begin
                      log := log + 'Plano de Contas.: ['+IntToStr(DM.qAux1.FieldByName('cd_plano_conta').AsInteger)+'] => ['+IntToStr(intPlanoContas)+'].'+chr(13);
                      DM.qAux1.FieldByName('cd_plano_conta').AsInteger := intPlanoContas;
                   end;

                   if centro_custos <> intCentroCustos then begin
                      log := log + 'Tipo de Tít.: ['+IntToStr(DM.qAux1.FieldByName('cd_centro_custo').AsInteger)+'] => ['+IntToStr(intCentroCustos)+'].'+chr(13);
                      DM.qAux1.FieldByName('cd_centro_custo').AsInteger := intCentroCustos;
                   end;

                   if chavehistorico <> strHistorico then
                      DM.qAux1.FieldByName('ds_historico').AsString := strHistorico;

                   // Verifica se o usuário modificou a data de vencimento
                   // Só efetua alterações se ele alterou as informações da mesma
                   if datVencimento <> chaveVencimento then
                   begin
                   
                      // Se o usuário manteve o mês/ano de vencimento (só alterou o dia de vencimento das parcelas)
                      if (mesVencAntigo = mesVencNovo) and (anoVencAntigo = anoVencNovo) and (alterarSomenteDia) then
                      begin
                         // Pega a data de vencimento da parcela que está sendo varrida
                         DecodeDate( Dm.qAux1.FieldByName('DataVencimento').AsDateTime, anoVenc, mesVenc, diaAux );
                         // Verifica se a nova data (mudando somente o dia) é válida
                         datNovoVencimento := DataValida(anoVenc, mesVenc, diaVencFixo);

                         // Atualiza a data de vencimento no banco e efetua ação de remessa
                         log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',Dm.qAux1.FieldByName('DataVencimento').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',datNovoVencimento)+'].'+chr(13);
                         Dm.qAux1.FieldByName('DataVencimento').AsString := DateToStr(datNovoVencimento);
                         // DM.FazAcaoRemessa(arProrrogar, Dm.qAux1.FieldByName('cd_mensalidade').AsInteger);

                      // Se o usuário alterou o mês/ano do vencimento (deve alterar a sequencia mês / dia das parcelas)
                      end else begin

                         // Atualiza a data de vencimento no banco e efetua ação de remessa
                         log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',Dm.qAux1.FieldByName('DataVencimento').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',datNovoVencimento)+'].'+chr(13);
                         Dm.qAux1.FieldByName('DataVencimento').AsString := DateToStr(datNovoVencimento);
                         // DM.FazAcaoRemessa(arProrrogar, Dm.qAux1.FieldByName('cd_mensalidade').AsInteger);

                         // Incrementa um mês na data do novo vencimento, para dar sequencia para a próxima parcela
                         INC(mesVenc);
                         // Verifica se deve incrementar o ano
                         if mesVenc > 12 then Begin
                             mesVenc := 1;
                             INC(anoVenc);
                         end;

                         // Seta a nova data de vencimento (com a sequencia incrementada de mês/ano)
                         datNovoVencimento := DataValida(anoVenc, mesVenc, diaVenc);
                      end;

                   end;

                   // Verifica se o usuário modificou a data de competência
                   // Só efetua alterações se ele alterou as informações da mesma
                   if datCompetencia <> chaveCompetencia then
                   begin

                      // Se o usuário manteve o mês/ano de competencia (só alterou o dia de competencia das parcelas)
                      if (mesCompAntigo = mesCompNovo) and (anoCompAntigo = anoCompNovo) and (alterarSomenteDia) then
                      begin

                         // Pega a data de competencia da parcela que está sendo varrida
                         DecodeDate( Dm.qAux1.FieldByName('dt_competencia').AsDateTime, anoComp, mesComp, diaAux );
                         // Verifica se a nova data (mudando somente o dia) é válida
                         datNovaCompetencia := DataValida(anoComp, mesComp, diaCompFixo);

                         // Atualiza a data de competencia no banco
                         log := log + 'Competência: ['+FormatDateTime('dd/mm/yyyy',Dm.qAux1.FieldByName('dt_competencia').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',datNovaCompetencia)+'].'+chr(13);
                         Dm.qAux1.FieldByName('dt_competencia').AsString := DateToStr(datNovaCompetencia);

                      // Se o usuário alterou o mês/ano da competencia (deve alterar a sequencia mês / dia das parcelas)
                      end else begin

                         // Atualiza a data de competencia no banco
                         log := log + 'Competência: ['+FormatDateTime('dd/mm/yyyy',Dm.qAux1.FieldByName('dt_competencia').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',datNovaCompetencia)+'].'+chr(13);
                         Dm.qAux1.FieldByName('dt_competencia').AsString := DateToStr(datNovaCompetencia);

                         // Incrementa um mês na data do novo vencimento, para dar sequencia para a próxima parcela
                         INC(mesComp);
                         // Verifica se deve incrementar o ano
                         if mesComp > 12 then Begin
                             mesComp := 1;
                             INC(anoComp);
                         end;

                         // Seta a nova data de competencia (com a sequencia incrementada de mês/ano)
                         datNovaCompetencia := DataValida(anoComp, mesComp, diaComp);

                      end;

                   end;

                   try
                      DM.gerar_log( 10, 'Alterado parcela '+IntToStr(DM.qAux1.FieldByName('parcela').AsInteger)+'.'+chr(13)+log, DM.iCdPessoaLogado, DM.qAux1.FieldByName('cd_mensalidade').AsString );
                      Dm.qAux1.Post;

                      // DM.FazAcaoRemessa(arAltMensalidade, DM.qAux1.FieldByName('cd_mensalidade').AsInteger);
                      AtualizaMovimentoCR(
                         Dm.qAux1.FieldByName('cd_mensalidade_origem').AsInteger,
                         curValorBruto + curValorExtra,
                         curDescontoExtra
                      );

                      DescontoNovo := DM.qAux1.FieldByName('valordesconto').AsCurrency;

                      Self.recalcularDescontos();
                   except
                      Dm.qAux1.Cancel;
                   end;

               end;

               Dm.qAux1.Next;
            End;

            Dm.qAux1.Close;
            // Dm.qAux1.RequestLive := False;

         End;
     2 : Begin // Por Turma

               if aplicouCentro and
                  (Mensagem('você deseja alterar o plano de pagamento para toda a turma?', 'Aviso', MB_YESNO + MB_ICONWARNING) =  mrYes) then
               begin
                  alteraPlano(chaveTurma, chaveAnoSemestre);
               end;

               DM.tblMatriculas.Cancel;
               DM.tblMensalidades.Cancel;

               Dm.qAux1.Close;
               Dm.qAux1.SQL.Clear;
               Dm.qAux1.SQL.Add(' select * from mensalidades where ');
               Dm.qAux1.SQL.Add(' turma = :turma and anosemestre = :anosemestre and ');
               Dm.qAux1.SQL.Add(' parcela >= :parcelainicial and parcela <= :parcelafinal ');
               Dm.qAux1.SQL.Add(' AND cd_tipo_titulo = :tipo_titulo ');

//               Dm.qAux1.SQL.Add(' tipoparcela = 0 ');
               Dm.qAux1.SQL.Add(' order by parcela ');

               DM.qAux1.ParamByName('turma')         .AsString  := chaveTurma;
               DM.qAux1.ParamByName('anosemestre')   .AsInteger := chaveAnoSemestre;
               Dm.qAux1.ParamByName('parcelainicial').AsInteger := intParcelaInicial;
               DM.qAux1.ParamByName('parcelafinal')  .AsInteger := intParcelaFinal;
               // Alterar somente mensalidades do mesmo tipo de título
               DM.qAux1.ParamByName('tipo_titulo')   .AsInteger := Tipo_Titulo;

               // Dm.qAux1.RequestLive := True;

               DM.qAux1.Open;

               DM.qAux1.First;

               datNovoVencimento := datVencimento;

               while not Dm.qAux1.Eof do
               Begin
                   if (DM.qAux1.FieldByName('situacao').AsInteger in [2, 10]) and
                      (DM.qAux1.FieldByName('tipoparcela').AsInteger <> 1) and
                      (DM.qAux1.FieldByName('sn_nfe_gerada').AsInteger = 0) then
                   Begin

                      DM.qAux1.Edit;
                      log := '';

                       if vlr_bruto <> curValorBruto then begin
                          log := log + 'Valor Bruto: ['+FloatToStr(DM.qAux1.FieldByName('valorbruto').AsCurrency)+'] => ['+FloatToStr(curValorBruto)+'].'+chr(13);
                          DM.qAux1.FieldByName('valorbruto').AsCurrency    :=  curValorBruto;
                       end;

                       if vlr_desconto <> curValorDesconto then begin
                          log := log + 'Valor Desconto: ['+FloatToStr(DM.qAux1.FieldByName('valordesconto').AsCurrency)+'] => ['+FloatToStr(curValorDesconto)+'].'+chr(13);
                          DM.qAux1.FieldByName('valordesconto').AsCurrency :=  curValorDesconto;
                       end;

                       if vlr_desconto_extra <> curDescontoExtra then begin
                          log := log + 'Desconto Extra: ['+FloatToStr(DM.qAux1.FieldByName('descontoextra').AsCurrency)+'] => ['+FloatToStr(curDescontoExtra)+'].'+chr(13);
                          DM.qAux1.FieldByName('descontoextra').AsCurrency :=  curDescontoExtra;
                       end;

                       if vlr_extra <> curValorExtra then begin
                          log := log + 'Valor Extra: ['+FloatToStr(DM.qAux1.FieldByName('valorextra').AsCurrency)+'] => ['+FloatToStr(curValorExtra)+'].'+chr(13);
                          DM.qAux1.FieldByName('valorextra').AsCurrency    :=  curValorExtra;
                       end;

                       if vlr_juros <> curValorJuros then begin
                          log := log + 'Valor Juros: ['+FloatToStr(DM.qAux1.FieldByName('valorjuros').AsCurrency)+'] => ['+FloatToStr(curValorJuros)+'].'+chr(13);
                          DM.qAux1.FieldByName('valorjuros').AsCurrency    :=  curValorJuros;
                       end;

                       if vlr_total <> curValorTotal then begin
                          log := log + 'Valor Total: ['+FloatToStr(DM.qAux1.FieldByName('valortotal').AsCurrency)+'] => ['+FloatToStr(curValorTotal)+'].'+chr(13);
                          DM.qAux1.FieldByName('valortotal').AsCurrency    :=  curValorTotal;
                       end;

                       if Tipo_Titulo <> intTipoTitulo then begin
                          log := log + 'Tipo de Tít.: ['+IntToStr(DM.qAux1.FieldByName('cd_tipo_titulo').AsInteger)+'] => ['+IntToStr(intTipoTitulo)+'].'+chr(13);
                          DM.qAux1.FieldByName('cd_tipo_titulo').AsInteger := intTipoTitulo;
                       end;

                       if plano_contas <> intPlanoContas then begin
                          log := log + 'Plano de Contas.: ['+IntToStr(DM.qAux1.FieldByName('cd_plano_conta').AsInteger)+'] => ['+IntToStr(intPlanoContas)+'].'+chr(13);
                          DM.qAux1.FieldByName('cd_plano_conta').AsInteger := intPlanoContas;
                       end;

                       if centro_custos <> intCentroCustos then begin
                          log := log + 'Tipo de Tít.: ['+IntToStr(DM.qAux1.FieldByName('cd_centro_custo').AsInteger)+'] => ['+IntToStr(intCentroCustos)+'].'+chr(13);
                          DM.qAux1.FieldByName('cd_centro_custo').AsInteger := intCentroCustos;
                       end;

                       if chavehistorico <> strHistorico then
                          DM.qAux1.FieldByName('ds_historico').AsString := strHistorico;

                       if (datVencimento <> chaveVencimento) and (intParcelaInicial = intParcelaFinal) then
                       Begin
                           log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',Dm.qAux1.FieldByName('DataVencimento').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',datVencimento)+'].'+chr(13);
                           Dm.qAux1.FieldByName('DataVencimento').AsString := DateToStr(datVencimento);
                           // DM.FazAcaoRemessa(arProrrogar, Dm.qAux1.FieldByName('cd_mensalidade').AsInteger);
                       End;

                       if (datCompetencia <> chaveCompetencia) and (intParcelaInicial = intParcelaFinal) then
                       Begin

                          log := log + 'Competência: ['+FormatDateTime('dd/mm/yyyy',Dm.qAux1.FieldByName('dt_competencia').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',datCompetencia)+'].'+chr(13);
                          Dm.qAux1.FieldByName('dt_competencia').AsString := DateToStr(datCompetencia);

                       End;


                      try
                         DM.gerar_log( 10, 'Alterado parcela '+IntToStr(DM.qAux1.FieldByName('parcela').AsInteger)+'.'+chr(13)+log, DM.iCdPessoaLogado, DM.qAux1.FieldByName('cd_mensalidade').AsString );
                         Dm.qAux1.Post;
                         // DM.FazAcaoRemessa(arAltMensalidade, DM.qAux1.FieldByName('cd_mensalidade').AsInteger);
                         AtualizaMovimentoCR(
                            Dm.qAux1.FieldByName('cd_mensalidade_origem').AsInteger,
                            curValorBruto + curValorExtra,
                            curDescontoExtra
                         );

                         DescontoNovo := DM.qAux1.FieldByName('valordesconto').AsCurrency;

                         Self.recalcularDescontos();
                      except
                         Dm.qAux1.Cancel;
                      end;

                   end;
                   Dm.qAux1.Next;

               End;

         End;
  End;


  Close;
end;

procedure Tfrm_mensa_alterar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM.tblMensalidadesCodigoAluno.AsString = '' then
  begin
    DM.tblMensalidades.Cancel;
    CanClose := True;
  end
  else
  begin
    if DM.tblMensalidades.State in [dsInsert, dsEdit] then
    begin
      if Mensagem( 'Deseja salvar os dados ?', Application.Title,
                   MB_YESNO + MB_ICONSTOP ) = ID_YES then
      begin
        CanClose := True;
      end
      else
      begin
        DM.tblMensalidades.Cancel;
        CanClose := True;
      end;
    end;
  end;

end;

procedure Tfrm_mensa_alterar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6 : btnCancelarClick( nil );
    VK_F7 : btnConfirmarClick( nil );
  end;
end;

procedure Tfrm_mensa_alterar.dbValorBrutoEnter(Sender: TObject);
begin
   AlteraValorEdicao(Sender);
end;

procedure Tfrm_mensa_alterar.dbValorBrutoExit(Sender: TObject);
begin
   vlr_bruto_alterado();
end;

procedure Tfrm_mensa_alterar.dbValorBrutoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin
    SelectNext( TWinControl( Sender ), True, True );
    Key := #0;
  end;
end;

procedure Tfrm_mensa_alterar.dbValorExtraEnter(Sender: TObject);
begin
   AlteraValorEdicao(Sender);
end;

procedure Tfrm_mensa_alterar.dbValorJurosEnter(Sender: TObject);
begin
   AlteraValorEdicao(Sender);
end;

procedure Tfrm_mensa_alterar.dbValorTotalEnter(Sender: TObject);
begin
   AlteraValorEdicao(Sender);
end;

procedure Tfrm_mensa_alterar.dbVencimentoChange(Sender: TObject);
begin
   alterouDataVencimento := True;
end;

procedure Tfrm_mensa_alterar.FormShow(Sender: TObject);
CONST
   SqlPlanos =
   'SELECT DISTINCT                         '+
	      ' fp.CD_PLANO,                     '+
	      ' fp.CD_COLIGADA,                  '+
         ' fp.DS_PLANO,                     '+
	      ' fp.NR_ANOSEMESTRE,               '+
	      ' fp.VL_CONTRATO,                  '+
	      ' fp.VL_DESCONTO,                  '+
	      ' fp.VL_MATRICULA,                 '+
   '       fp.VL_COBRADO                    '+
   ' FROM                                   '+
	      ' fin_planos_turmas fpt            '+
   ' INNER JOIN matriculas m ON (           '+
	      ' m.codigoaluno = :codigoaluno     '+
	      ' AND m.anosemestre = :anosemestre '+
         ' AND m.turma = :turma             '+
   ' )                                      '+
   ' INNER	JOIN fin_planos fp ON           '+
   ' (                                      '+
	   ' fpt.CD_PLANO = fp.CD_PLANO          '+
	   ' OR m.planopagamento = fp.CD_PLANO   '+
   ' )                                      '+
   ' WHERE                                  '+
	   ' fp.NR_ANOSEMESTRE = :anosemestre    '+
	   ' AND fp.CD_COLIGADA = :cd_coligada   '+
	   ' AND fpt.cd_turma = :turma;          ';
var
  I: Integer;
  qyPlanoMatricula: TUMZQuery;

begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   { Campos Chaves para Efetuar as Alterações }

   chaveCodigoAluno     := DM.tblMensalidadesCodigoAluno.AsInteger;
   chaveTurma           := DM.tblMensalidadesTurma.AsString;
   chaveAnoSemestre     := DM.tblMensalidadesAnoSemestre.AsInteger;
   chaveParcela         := DM.tblMensalidadesParcela.AsInteger;
   chaveVencimento      := DM.tblMensalidadesDataVencimento.AsDateTime;
   chaveCompetencia     := DM.tblMensalidadesdt_competencia.AsDateTime;
   sn_credito_parcela   := DM.tblMensalidadessn_credito_parcela.AsString;

   alterouDataVencimento := False;
   alterouDataCompetencia := False;

   chkCompetencia.Checked := False;
   dbCompetencia.Enabled := False;

   // Fecha e abre a query DM.qyTitulosReceita
   DM.tblMensalidadesBeforeOpen(nil);

   // Implementado em 07/12/2004 por Jonathan para os logs de alterações
   dt_pgto             := DM.tblMensalidades.FieldByName('DataPagamento').AsDateTime;
   situacao            := DM.tblMensalidades.FieldByName('situacao').AsInteger;
   nossonumero         := DM.tblMensalidades.FieldByName('NossoNumero').AsString;
   vlr_bruto           := DM.tblMensalidades.FieldByName('ValorBruto').AsCurrency;
   vlr_desconto        := DM.tblMensalidades.FieldByName('ValorDesconto').AsCurrency;
   vlr_desconto_extra  := DM.tblMensalidades.FieldByName('DescontoExtra').AsCurrency;
   vlr_extra           := DM.tblMensalidades.FieldByName('ValorExtra').AsCurrency;
   vlr_juros           := DM.tblMensalidades.FieldByName('ValorJuros').AsCurrency;
   vlr_total           := DM.tblMensalidades.FieldByName('ValorTotal').AsCurrency;
   vlr_pago            := DM.tblMensalidades.FieldByName('ValorPago').AsCurrency;
   Tipo_Titulo         := DM.tblMensalidades.FieldByName('cd_tipo_titulo').AsInteger;
   plano_contas        := DM.tblMensalidades.FieldByName('cd_plano_conta').AsInteger;
   centro_custos       := DM.tblMensalidades.FieldByName('cd_centro_custo').AsInteger;
   chaveHistorico      := DM.tblMensalidades.FieldByName('ds_historico').AsString;
   vlr_bruto_original  := DM.tblMensalidades.FieldByName('ValorBruto').AsCurrency;

   ckb_recalcular_descontos_vlr_bruto.Checked := false;
   ckb_recalcular_descontos_vlr_bruto.Enabled := false;

   TabControl1.Tabs.Clear;

   TabControl1.Tabs.Add('PARCELA SELECIONADA');

   TabControl1.Tabs.Add('ALUNO');

   if (DM.UsuarioLogado.TemPermissao( 2200, npAlterar, false )) then
   begin
         TabControl1.Tabs.Add('TURMA');
   end;

   TabControl1.TabIndex := 0;

   TabControl1Change(TabControl1);

   if DM.tblMensalidadesParcela.AsString <> '' then
      edParcelaFinal.Text := DM.tblMensalidadesParcela.AsString
   else
      edParcelaFinal.Text := '1';

   upDnParcelaFinal.Position := StrToInt(edParcelaFinal.Text);

   dbParcelaInicial.SetFocus;

   { Verificar os planos de Pagamento }

   tblPlanos.Close;

   tblPlanos.SQL.Text := Format(
      SqlPlanos,
      [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]
   );

   tblPlanos.ParamByName('codigoaluno').AsInteger := uMensalidades.frmMensalidades.tblMensalidadescodigoaluno.AsInteger;
   tblPlanos.ParamByName('anosemestre').AsInteger := DM.tblMensalidadesAnoSemestre.AsInteger;
   tblPlanos.ParamByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.ColigadaLogada;
   tblPlanos.ParamByName('turma').asString := DM.tblMensalidadesTurma.AsString;
   tblPlanos.Open;

   tblDescontos.Close;
   tblDescontos.Open;

   tblMatriculas.Close;
   tblMatriculas.ParamByName('codigoaluno').AsInteger := DM.tblMensalidadesCodigoAluno.AsInteger;
   tblMatriculas.ParamByName('turma').AsString := DM.tblMensalidadesTurma.AsString;
   tblMatriculas.ParamByName('anosemestre').AsString := DM.tblMensalidadesAnoSemestre.AsString;
   tblMatriculas.Open;

   Self.iCodColigada := DM.getColigadaTurma(tblMatriculasturma.AsString);

   tblMatriculas.Edit;

   qyPlanoContas.Close();
   qyPlanoContas.ParamByName('cd_coligada').AsInteger := DM.getColigadaByTurma(DM.tblMensalidadesTurma.AsString, Dm.tblMensalidadesAnoSemestre.AsInteger);
   qyPlanoContas.Open();

   qyCentroCustos.Close();
   qyCentroCustos.ParamByName('cd_coligada').AsInteger := DM.getColigadaByTurma(DM.tblMensalidadesTurma.AsString, Dm.tblMensalidadesAnoSemestre.AsInteger);
   qyCentroCustos.Open();

   // Se a Nota fiscal foi emitida, não poderá sofrer alterações:

   sbCadeado.Visible := false;
   if Dm.tblMensalidadessn_nfe_gerada.AsInteger = 1 then
   begin
      chkCompetencia.Enabled := false;
      dbValorBruto.Enabled := false;
      dbTipoTitulo.Enabled := false;
      sbCadeado.Hint := 'Não é possível alterar o valor bruto pois a NF já foi emitida.';
      sbCadeado.Visible := true;
   end else begin
      if (DM.tblMensalidadestipoparcela.AsInteger in [1,4]) AND (DM.variavel_parametro('financeiro_bloquear_competencia') = 'S') then
      begin
         dbValorBruto.Enabled := false;
         sbCadeado.Visible := true;
         sbCadeado.Hint := 'Não é possível alterar o valor bruto de parcelas parciais ou negociadas.';
      end else begin
         sbCadeado.Visible := false;
         dbValorBruto.Enabled := true;
         dbValorBruto.Hint := '';
      end;
      chkCompetencia.Enabled := true;
      dbTipoTitulo.Enabled := true;
   end;

   dm.CriarConsulta(qyPlanoMatricula);
   qyPlanoMatricula.SQL.Text :=
   ' SELECT                                     '+
	'     fp.cd_plano                            '+
   ' FROM                                       '+
	'     fin_planos fp                          '+
   ' INNER JOIN matriculas m ON (               '+
	'     m.planopagamento = fp.CD_PLANO         '+
	'     AND m.codigoaluno = :codigoaluno       '+
   '     AND m.turma = :turma                   '+
   '     AND fp.cd_coligada = :coligada         '+
   '     AND fp.nr_anosemestre = :anosemestre); ';

   qyPlanoMatricula.ParamByName('codigoaluno').AsInteger := uMensalidades.frmMensalidades.tblMensalidadescodigoaluno.AsInteger;
   qyPlanoMatricula.ParamByName('anosemestre').AsInteger := DM.tblMensalidadesAnoSemestre.AsInteger;
   qyPlanoMatricula.ParamByName('coligada').AsInteger := DM.GetUsuarioLogado.ColigadaLogada;
   qyPlanoMatricula.ParamByName('turma').asString := DM.tblMensalidadesTurma.AsString;
   qyPlanoMatricula.Open;

   tblPlanos.Locate('cd_plano', qyPlanoMatricula.FieldByName('cd_plano').AsInteger, []);

   //Se esta alterando
   if (frm_mensa_alterar.Caption = 'Alterar Títulos...') then
   begin
      //Se possui permissão de alterar plano de pagamento e desconto.
      if not (DM.UsuarioLogado.TemPermissao( 2118, npAlterar, false )) then
      begin

         DBLookupComboBox1.Enabled := False;
         DBLookupComboBox2.Enabled := False;

         SpeedButton1.Visible := False;
         SpeedButton2.Visible := False;

      end;

   end;
   
end;


procedure Tfrm_mensa_alterar.recalcularDescontos();
var
   iParcelaInicial, iParcelaFinal: Integer;
   cValorDesconto, cValorDescontoAplicado,
   cIndicePercFixo, cIndicePercCondicional , cValorMovimentacoes: Currency;
   qyMensalidadesAplicar, qyAplicaoDesconto, qyAcao: TUMZQuery;
   MensDataBaixa, sChaveLog: string;
begin

   if not ( ckb_recalcular_descontos_vlr_bruto.Checked ) then
   begin
      Exit;
   end;

   cValorDesconto := DM.tblMensalidadesValorDesconto.AsCurrency;

   // Cria as querys necessárias para o procedimento
   DM.CriarConsulta(qyAcao);
   DM.CriarConsulta(qyAplicaoDesconto);

      qyAplicaoDesconto.Close;
      qyAplicaoDesconto.SQL.Clear;
      qyAplicaoDesconto.SQL.Add('UPDATE mensalidades ' );
      qyAplicaoDesconto.SQL.Add('SET descontoextra = :vl_novo_desconto_fixo ');

      qyAplicaoDesconto.SQL.Add(', valordesconto = :vl_novo_desconto_condicional ');

      qyAplicaoDesconto.SQL.Add(' WHERE cd_mensalidade = :cod_mensalidade ' );

      // Busca os valores das ações de movimento da mensalidade
      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
         ' SELECT ' +
         ' SUM(m.vl_saida) - COALESCE((SELECT SUM(COALESCE(descontoextra, 0)) FROM mensalidades WHERE cd_mensalidade_origem = :cd_mensalidade AND cd_mensalidade < :cd_nova_mensalidade), 0) vl_saida '+
         ' FROM ' +
         '   fin_mov_cr m '+
         '   INNER JOIN fin_acoes_movimento a ON (m.cd_acao = a.cd_acao) ' +
         ' WHERE ' +
         '    m.cd_mensalidade = :cd_mensalidade AND a.cd_tipo_acao = 3 ' +
         ' GROUP BY m.cd_mensalidade '
      );

      qyAcao.ParamByName('cd_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade_origem.AsInteger;
      qyAcao.ParamByName('cd_nova_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade.AsInteger;
      qyAcao.Open;

      // Descobrir o valor atual dos descontos na movimentação
      qyAplicaoDesconto.ParamByName('cod_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade_origem.AsInteger;
      qyAplicaoDesconto.ParamByName('vl_novo_desconto_fixo').AsFloat := RoundFloat(qyAcao.FieldByName('vl_saida').AsCurrency, 2);

      cIndicePercFixo := 0;
      cIndicePercCondicional := 0;

      if ckb_recalcular_descontos_vlr_bruto.Checked then
      begin
         cIndicePercFixo :=
            RoundFloat(
               100 *
               (  DM.tblMensalidadesDescontoExtra.AsCurrency / vlr_bruto_original )
            , 2); // Indice de desconto Fixo

         qyAplicaoDesconto.ParamByName('vl_novo_desconto_fixo').AsFloat :=
            RoundFloat(
               (cIndicePercFixo / 100) * DM.tblMensalidadesValorBruto.AsCurrency
            , 2);

         cIndicePercCondicional :=
            RoundFloat(
                100 *
               ( DM.tblMensalidadesValorDesconto.AsCurrency / vlr_bruto_original )
           ,2); // Indice de desconto Condicional

         qyAplicaoDesconto.ParamByName('vl_novo_desconto_condicional').AsFloat :=
            RoundFloat(
               (cIndicePercCondicional/100) * DM.tblMensalidadesValorBruto.AsCurrency
            , 2);

         // Recalcular o desconto Fixo das ações de movimento da parcela
         DM.recalcularDescFixoAcoesMovimento(
            DM.tblMensalidadescd_mensalidade.AsInteger,
            DM.tblMensalidadesDescontoExtra.AsCurrency,
            qyAplicaoDesconto.ParamByName('vl_novo_desconto_fixo').AsCurrency
         );

         // Recalcular o desconto condicional das ações de movimento da parcela
         DM.recalcularDescCondicionalAcoesMovimento(
            DM.tblMensalidadescd_mensalidade.AsInteger,
            DM.tblMensalidadesValorDesconto.AsCurrency,
            qyAplicaoDesconto.ParamByName('vl_novo_desconto_condicional').AsCurrency
         );

      end;

      // Aplica o desconto confirmado
      qyAplicaoDesconto.ExecSQL;

end;

procedure Tfrm_mensa_alterar.FormPaint(Sender: TObject);
begin
   PapelParede(Sender);
end;

procedure Tfrm_mensa_alterar.TabControl1Change(Sender: TObject);
begin
   vlr_bruto_alterado();
   case TabControl1.TabIndex of
      0 : Begin  // Parcela Selecionada

              lbCodigoAluno     .Enabled := True;
              dbNomeAluno       .Enabled := True;
              dbCodigoAluno     .Enabled := True;
              lbTurma           .Enabled := True;
              dbTurma           .Enabled := True;
              lbAnoLetivo       .Enabled := True;
              dbAnoLetivo       .Enabled := True;
              lbParcelaInicial  .Enabled := True;
              lbParcelaInicial  .Caption := 'Parcela:';
              dbParcelaInicial  .Enabled := True;
              upDnParcelaInicial.Enabled := True;
              lbParcelaFinal    .Enabled := False;
              edParcelaFinal    .Enabled := False;
              upDnParcelaFinal  .Enabled := False;
              lbDataVencimento  .Enabled := True;
              dbVencimento      .Enabled := True;
              lbDataVencimento  .Caption := 'Data Vencimento';
              lbDataPagto       .Enabled := True;

              lbNossoNumero     .Enabled := True;
              dbNossoNumero     .Enabled := True;
              lbValorBruto      .Enabled := True;
              dbValorBruto      .Enabled := True;
              lbValorDesconto   .Enabled := True;
              lbValorExtra      .Enabled := True;
              dbValorExtra      .Enabled := True;
              lbValorJuros      .Enabled := True;
              dbValorJuros      .Enabled := True;
              lbValorTotal      .Enabled := True;

              dbCreditos        .Enabled := True;
              lbCreditos        .Enabled := True;
              chkCompetencia    .Enabled := True;

              if (chkCompetencia.Checked) then begin
                 dbCompetencia.Enabled    := True;
                 Label3.Enabled           := True;
              End
              else begin
                 dbCompetencia.Enabled    := False;
                 Label3.Enabled           := False;
              end;              
          End;

      1 : Begin  // Alteração por Aluno

              dbNomeAluno       .Enabled := True; 
              lbCodigoAluno     .Enabled := True;
              dbCodigoAluno     .Enabled := True;
              lbTurma           .Enabled := True;
              dbTurma           .Enabled := True;
              lbAnoLetivo       .Enabled := True;
              dbAnoLetivo       .Enabled := True;
              lbParcelaInicial  .Enabled := True;
              lbParcelaInicial  .Caption := 'Parcela Inicial:';
              dbParcelaInicial  .Enabled := True;
              upDnParcelaInicial.Enabled := True;
              lbParcelaFinal    .Enabled := True;
              edParcelaFinal    .Enabled := True;
              upDnParcelaFinal  .Enabled := True;
              lbDataVencimento  .Enabled := True;
              dbVencimento      .Enabled := True;
              lbDataVencimento  .Caption := 'Vencimento Inicial';
              lbDataPagto       .Enabled := False;

              lbNossoNumero     .Enabled := False;
              dbNossoNumero     .Enabled := False;
              lbValorBruto      .Enabled := True;
              dbValorBruto      .Enabled := True;
              lbValorDesconto   .Enabled := True;
              lbValorExtra      .Enabled := True;
              dbValorExtra      .Enabled := True;
              lbValorJuros      .Enabled := True;
              dbValorJuros      .Enabled := True;
              lbValorTotal      .Enabled := True;
              dbCreditos        .Enabled := False;
              lbCreditos        .Enabled := False;
              chkCompetencia    .Enabled := True;

              if (chkCompetencia.Checked) then begin
                 dbCompetencia.Enabled    := True;
                 Label3.Enabled           := True;
              End
              else begin
                 dbCompetencia.Enabled    := False;
                 Label3.Enabled           := False;
              end;

          End;
      2 : Begin  // Alteração por Turma

              dbNomeAluno       .Enabled := False;
              lbCodigoAluno     .Enabled := False;
              dbCodigoAluno     .Enabled := False;
              lbTurma           .Enabled := True;
              dbTurma           .Enabled := True;
              lbAnoLetivo       .Enabled := True;
              dbAnoLetivo       .Enabled := True;
              lbParcelaInicial  .Enabled := True;
              lbParcelaInicial  .Caption := 'Parcela Inicial:';
              dbParcelaInicial  .Enabled := True;
              upDnParcelaInicial.Enabled := True;
              lbParcelaFinal    .Enabled := True;
              edParcelaFinal    .Enabled := True;
              upDnParcelaFinal  .Enabled := True;
              lbDataVencimento  .Enabled := True;
              dbVencimento      .Enabled := True;
              lbDataVencimento  .Caption := 'Vencimento Inicial';
              lbDataPagto       .Enabled := False;

              lbNossoNumero     .Enabled := False;
              dbNossoNumero     .Enabled := False;
              lbValorBruto      .Enabled := True;
              dbValorBruto      .Enabled := True;
              lbValorDesconto   .Enabled := True;
              lbValorExtra      .Enabled := True;
              dbValorExtra      .Enabled := True;
              lbValorJuros      .Enabled := True;
              dbValorJuros      .Enabled := True;
              lbValorTotal      .Enabled := True;
              dbCreditos        .Enabled := False;
              lbCreditos        .Enabled := False;


              if (DM.tblMensalidadesParcela.AsInteger <> StrToInt(edParcelaFinal.Text)) then begin
                 dbVencimento.Enabled       := False;
                 lbDataVencimento.Enabled   := False;
                 chkApenasDiasUteis.Enabled := False;

                 dbCompetencia.Enabled    := False;
                 Label3.Enabled           := False;
                 chkCompetencia.Enabled   := False;
              End
              else begin
                 dbVencimento.Enabled       := True;
                 lbDataVencimento.Enabled   := True;
                 chkApenasDiasUteis.Enabled := True;

                 chkCompetencia.Enabled     := True;
                 if chkCompetencia.checked then
                 begin
                    dbCompetencia.Enabled    := True;
                    Label3.Enabled           := True;
                 end;
              end;

          End;
      3 : Begin  // Alteração por Curso


          End;
   End;
end;

procedure Tfrm_mensa_alterar.upDnParcelaInicialClick(Sender: TObject;
  Button: TUDBtnType);
begin

    if (Button = btPrev) and (DM.tblMensalidadesParcela.AsInteger >=1) then
    Begin
       DM.tblMensalidadesParcela.AsInteger := DM.tblMensalidadesParcela.AsInteger - 1
    End;
    if (Button = btNext) and (DM.tblMensalidadesParcela.AsInteger <= 32767) then
    Begin
       DM.tblMensalidadesParcela.AsInteger := DM.tblMensalidadesParcela.AsInteger + 1
    End;
    
//    upDnParcelaInicial.Position :=  DM.tblMensalidadesParcela.AsInteger;

    { Parcela Final tem que ser maior ou igual parcela Inicial}
    if StrToInt(edParcelaFinal.Text) < DM.tblMensalidadesParcela.AsInteger then
    Begin
        edParcelaFinal.Text := DM.tblMensalidadesParcela.AsString;
    End;

    TabControl1Change(TabControl1);

end;

procedure Tfrm_mensa_alterar.vlr_bruto_alterado;
begin
   ckb_recalcular_descontos_vlr_bruto.Checked := false;
   if ( vlr_bruto_original <> DM.tblMensalidades.FieldByName('ValorBruto').AsCurrency ) AND
      ( TabControl1.TabIndex = 0 )
   then
   begin
      ckb_recalcular_descontos_vlr_bruto.Enabled := true;
      Exit;
   end;

   ckb_recalcular_descontos_vlr_bruto.Enabled := false;
end;

procedure Tfrm_mensa_alterar.upDnParcelaFinalClick(Sender: TObject;
  Button: TUDBtnType);
begin

    if (Button = btPrev) and (StrToInt(edParcelaFinal.Text) >= 1 ) then
    Begin
       edParcelaFinal.Text := IntToStr(StrToInt(edParcelaFinal.Text) -  1);
    End;
    if (Button = btNext) and (StrToInt(edParcelaFinal.Text) <= 32767 ) then
    Begin
       edParcelaFinal.Text := IntToStr(StrToInt(edParcelaFinal.Text) +  1);
    End;

    //    upDnParcelaFinal.Position := StrToInt(edParcelaFinal.Text);

    { Parcela Final tem que ser maior ou igual parcela Inicial}
    if StrToInt(edParcelaFinal.Text) < DM.tblMensalidadesParcela.AsInteger then
    Begin
        DM.tblMensalidadesParcela.AsInteger := StrToInt(edParcelaFinal.Text);
    End;

    TabControl1Change(TabControl1);

end;

procedure Tfrm_mensa_alterar.SpeedButton1Click(Sender: TObject);
begin
   DM.tblMensalidadesValorBruto.AsCurrency := tblPlanosVL_COBRADO.AsCurrency;
   DM.tblMensalidadesValorDesconto.AsCurrency := tblPlanosVL_DESCONTO.AsCurrency;
   DM.tblMensalidadesValorTotal.AsCurrency := DM.tblMensalidadesValorTotalCalc.AsCurrency;
   aplicouCentro := True;
end;

procedure Tfrm_mensa_alterar.SpeedButton2Click(Sender: TObject);
var
   desconto : Currency;
begin
   Mensagem('Este procedimento apenas irá vincular o plano de desconto na matrícula do estudante para fins de impressão de contrato. '+ CHR(13) +
               'Nenhuma alteração será aplicada sobre as parcelas.' +CHR(13) +
               'Para aplicação dos desconto nas parcelas, utilize a opção Desconto da planilha de recebimentos.', 'Atenção', MB_OK + MB_ICONWARNING);
{
   Este recurso foi desabilitado devido a utilização centralizada de aplicação de descontos pela tela de descontos
   
   desconto := 0;
   desconto := desconto + (Dm.tblMensalidadesValorBruto.AsCurrency * tblDescontospercentualdesconto.AsCurrency / 100);
   desconto := desconto + tblDescontosvalordesconto.AsCurrency;
   DM.tblMensalidadesDescontoExtra.AsCurrency := desconto;
}
end;

procedure Tfrm_mensa_alterar.tblPlanosCalcFields(DataSet: TDataSet);
begin
   tblPlanosdesc_completa.AsString := tblPlanosDS_PLANO.AsString;

end;

procedure Tfrm_mensa_alterar.edParcelaFinalExit(Sender: TObject);
begin
    { Parcela Final tem que ser maior ou igual parcela Inicial}
    if StrToInt(edParcelaFinal.Text) < DM.tblMensalidadesParcela.AsInteger then
    Begin
        DM.tblMensalidadesParcela.AsInteger := StrToInt(edParcelaFinal.Text);
    End;

    TabControl1Change(TabControl1);
end;

procedure Tfrm_mensa_alterar.dbParcelaInicialExit(Sender: TObject);
begin
    if StrToInt(edParcelaFinal.Text) < DM.tblMensalidadesParcela.AsInteger then
    Begin
        edParcelaFinal.Text := DM.tblMensalidadesParcela.AsString;
    End;
end;

procedure Tfrm_mensa_alterar.alteraPlano(turma: String; anoSemestre: Integer);
const
   SQL_ALTERA_TURMA =
      '  UPDATE '+
      '     matriculas '+
      '  SET '+
      '     planopagamento = :plano_pagamento '+
      '  WHERE '+
      '     anosemestre = :anosemestre '+
      '     AND turma = :turma ';
var
   qyAltera: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyAltera);

   qyAltera.SQL.Text := SQL_ALTERA_TURMA;

   qyAltera.ParamByName('anosemestre').AsInteger :=
      DM.tblMensalidadesAnoSemestre.AsInteger;
   qyAltera.ParamByName('turma').AsString :=
      DM.tblMensalidadesTurma.AsString;
   qyAltera.ParamByName('plano_pagamento').AsInteger :=
      tblMatriculasplanopagamento.AsInteger;

   qyAltera.ExecSQL;
end;

procedure Tfrm_mensa_alterar.AlteraValorEdicao(Sender: TObject);
begin
   TDBEdit(Sender).Text := StringReplace(TDBEdit(Sender).Text, '.', '', [rfIgnoreCase, rfReplaceAll]);
end;

procedure Tfrm_mensa_alterar.AtualizaMovimentoCR(CdMensalidadeOrigem : Integer; NovoValorEntrada : Currency; NovoValorDesconto : Currency);
begin
  // Atualiza os lançamentos de Entrada;


  with qyAux do begin
      Close();
      SQL.Clear();
      //Verifica se a conexão é Oracle ou MySQL
      if Connection.Protocol = 'oracle' then //Oracle
      begin

         SQL.Add(
            'MERGE INTO fin_mov_cr f USING '+
            '   (SELECT '+
            '         f.CD_MENSALIDADE, '+
            '         f.CD_COLIGADA, '+
            '         f.NR_SEQUENCIA '+
            '      FROM '+
            '         fin_mov_cr f, '+
            '         fin_acoes_movimento A '+
            '      WHERE '+
            '         f.cd_acao = A.cd_acao '+
            '         AND f.cd_mensalidade = :CdMensalidade '+
            '         AND A .cd_tipo_acao = 4 '+
            '         AND f.nr_sequencia = 1) f2 ON (f.CD_MENSALIDADE = f2.CD_MENSALIDADE AND f.CD_COLIGADA = f2.CD_COLIGADA AND f.NR_SEQUENCIA = f2.NR_SEQUENCIA) '+
            '      WHEN MATCHED THEN '+
            '         UPDATE SET f.vl_entrada = :NovoValor ');
            
      end else begin
      
         SQL.Add(
           ' UPDATE fin_mov_cr f, fin_acoes_movimento a ' +
           ' SET f.vl_entrada = :NovoValor              ' +
           ' WHERE f.cd_acao = a.cd_acao AND            ' +
           '       f.cd_mensalidade = :CdMensalidade AND' +
           '       a.cd_tipo_acao = 4  AND f.nr_sequencia = 1 '
         );

      end;

      // Ação Tipo = 4 => Geração de Títulos;

      ParamByName('CdMensalidade').AsInteger := CdMensalidadeOrigem;
      ParamByName('NovoValor').AsFloat    := NovoValorEntrada;

      ExecSQL();

  end;

end;

end.

