unit uRepContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppPrnabl, ppClass, ppStrtch, ppRichTx, ppBands, ppCache, ppDB, ppDBBDE,
  Db, ZConnection, ppComm, ppProd, ppReport, ppCtrls, ppMemo, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmRepContrato = class(TForm)
    Report: TppReport;
    dtcContratos: TDataSource;
    ppContrato: TppBDEPipeline;
    ppReport1RichText1: TppRichText;
    Memo: TppMemo;
    Memo2: TppMemo;
    Memo3: TppMemo;
    Memo4: TppMemo;
    Memo5: TppMemo;
    Memo6: TppMemo;
    tblContratos: TUMZQuery;
    ReportImage1: TppImage;
    tblContratosCodigo: TIntegerField;
    tblContratosNome: TStringField;
    tblContratosDataNascimento: TDateTimeField;
    tblContratosCidadeNascimento: TStringField;
    tblContratosEstadoNascimento: TStringField;
    tblContratosEndereco: TStringField;
    tblContratosComplemento: TStringField;
    tblContratosCEP: TStringField;
    tblContratosBairro: TStringField;
    tblContratosCidade: TStringField;
    tblContratosEstado: TStringField;
    tblContratosTelefone1: TStringField;
    tblContratosSexo: TStringField;
    tblContratosNacionalidade: TStringField;
    tblContratosIdentidade: TStringField;
    tblContratosOrgaoExp: TStringField;
    tblContratosTurma: TStringField;
    tblContratosCPF: TStringField;
    tblContratosRM_CSM: TStringField;
    tblContratosNumeroMilitar: TStringField;
    tblContratosSerieMilitar: TStringField;
    tblContratosDataExpMilitar: TDateTimeField;
    tblContratosLocalExpMilitar: TStringField;
    tblContratosOrganizacaoMilitar: TStringField;
    tblContratosTipoDocumento: TStringField;
    tblContratosPai: TStringField;
    tblContratosMae: TStringField;
    tblContratosResponsavel: TStringField;
    tblContratosDataNascimentoResponsavel: TDateTimeField;
    tblContratosNaturalidadeResponsavel: TStringField;
    tblContratosUFNaturalidadeResponsavel: TStringField;
    tblContratosSexoResponsavel: TStringField;
    tblContratosPaiResponsavel: TStringField;
    tblContratosMaeResponsavel: TStringField;
    tblContratosEstadoCivilResponsavel: TStringField;
    tblContratosNomeConjuge: TStringField;
    tblContratosDataNascimentoConjuge: TDateTimeField;
    tblContratosCPF_Responsavel: TStringField;
    tblContratosRGResponsavel: TStringField;
    tblContratosEnderecoResponsavel: TStringField;
    tblContratosComplementoResponsavel: TStringField;
    tblContratosCidadeResponsavel: TStringField;
    tblContratosCEPResponsavel: TStringField;
    tblContratosUFResponsavel: TStringField;
    tblContratosTelefoneResponsavel: TStringField;
    tblContratosTelefone2: TStringField;
    tblContratosFuncionario: TStringField;
    tblContratosVersaoCracha: TIntegerField;
    tblContratosCodigoAlunoIndicado: TIntegerField;
    tblContratosEstadoCivil: TStringField;
    tblContratosDataRevisao: TDateTimeField;
    tblContratosNomeSemAcento: TStringField;
    tblContratosEmail: TStringField;
    tblContratosEscolaOrigem: TStringField;
    tblContratosSituacao: TSmallintField;
    tblContratosCodigoAluno: TIntegerField;
    tblContratosTurma_1: TStringField;
    tblContratosDataEmissao: TDateTimeField;
    tblContratosUsuario: TStringField;
    tblContratosPlanoPagamento: TIntegerField;
    tblContratosSituacao_1: TSmallintField;
    tblContratosImpresso: TBooleanField;
    tblContratosDataSaida: TDateTimeField;
    tblContratosPlanoDesconto: TIntegerField;
    tblContratosDiploma: TBooleanField;
    tblContratosCodigo_1: TIntegerField;
    tblContratosTurma_2: TStringField;
    tblContratosParcelas: TSmallintField;
    tblContratosValorCobrado: TFloatField;
    tblContratosValorContrato: TFloatField;
    tblContratosTaxaMaterial: TFloatField;
    tblContratosTaxaApostila: TFloatField;
    tblContratosDesconto: TFloatField;
    tblContratosMatricula: TFloatField;
    tblContratosApartir: TDateTimeField;
    tblContratosNumeroTaxasMaterial: TSmallintField;
    tblContratosAnoSemestre: TSmallintField;
    tblContratosCodigo_2: TStringField;
    tblContratosSerie: TSmallintField;
    tblContratosCurso: TStringField;
    tblContratosTurno: TStringField;
    tblContratosDescricao: TStringField;
    tblContratosContrato: TStringField;
    tblContratosVagas: TSmallintField;
    tblContratosHoraInicio: TDateTimeField;
    tblContratosHoraFim: TDateTimeField;
    tblContratosDataInicio: TDateTimeField;
    tblContratosDataFim: TDateTimeField;
    tblContratosIdadeConclusao: TSmallintField;
    tblContratosDataConclusao: TDateTimeField;
    tblContratosTeste: TStringField;
    tblContratosAnoSemestre_1: TSmallintField;
    procedure tblContratosCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepContrato: TfrmRepContrato;

implementation

uses Main;

{$R *.DFM}

procedure TfrmRepContrato.tblContratosCalcFields(DataSet: TDataSet);
begin
  Memo.Lines.Clear;
  Memo2.Lines.Clear;
  Memo3.Lines.Clear;
  Memo4.Lines.Clear;
  Memo5.Lines.Clear;
  Memo6.Lines.Clear;
  if ( Length( tblContratosComplemento.AsString ) > 0 ) and
     ( not Maior21( tblContratosDataNascimento.AsDateTime, DataHoje ) ) then
  begin
    Memo.Lines.Add(
    'Pelo presente instrumento particular, de um lado ' +
    tblContratosNome.AsString + ', ' +
    tblContratosEstadoCivil.AsString + ', ' +
    'CPF ' + tblContratosCPF.AsString + ', ' +
    tblContratosEndereco.AsString + ', ' +
    tblContratosComplemento.AsString + ', ' +
    tblContratosBairro.AsString + ', ' +
    tblContratosCidade.AsString + ', ' +
    tblContratosEstado.AsString + ', ' +
    tblContratosCEP.AsString +
  ', doravante denominado CONTRATANTE, que, enquanto menor de 21 anos, será represen' +
  'tado por: ' + tblContratosResponsavel.AsString + ' , CPF ' +
  tblContratosCPF_Responsavel.AsString + ' e SOCIEDADE EDUCACIONAL BLUMENAUENSE LTDA., ' +
  'entidade jurídica de direito privado, mantenedora do Colégio Blumenauense, com sede' +
  ' na Alameda Duque de Caxias, nº 21, Centro, em Blumenau-SC, inscrita' +
  ' no Cadastro Geral de Contribuintes do Ministério da Fazenda sob o nº 853332724/0001-95,' +
  ' de ora em diante denominado simplesmente ESCOLA, firmam entre si o "Contrato de' +
  ' Prestação de Serviços Educacionais", o qual reger-se-á pelas cláusulas e condições' +
  ' a seguir estipuladas.' );
  end;

  if ( Length( tblContratosComplemento.AsString ) = 0 ) and
     ( not Maior21( tblContratosDataNascimento.AsDateTime, DataHoje ) ) then
  begin
    Memo.Lines.Add(
    'Pelo presente instrumento particular, de um lado ' +
    tblContratosNome.AsString + ', ' +
    tblContratosEstadoCivil.AsString + ', ' +
    'CPF ' + tblContratosCPF.AsString + ', ' +
    tblContratosEndereco.AsString + ', ' +
    tblContratosBairro.AsString + ', ' +
    tblContratosCidade.AsString + ', ' +
    tblContratosEstado.AsString + ', ' +
    tblContratosCEP.AsString +
  ', doravante denominado CONTRATANTE, que, enquanto menor de 21 anos, será represen' +
  'tado por: ' + tblContratosResponsavel.AsString + ' , CPF ' +
  tblContratosCPF_Responsavel.AsString + ' e SOCIEDADE EDUCACIONAL BLUMENAUENSE LTDA., ' +
  'entidade jurídica de direito privado, mantenedora do Colégio Blumenauense, com sede' +
  ' na Alameda Duque de Caxias, nº 21, Centro, em Blumenau-SC, inscrita' +
  ' no Cadastro Geralde Contribuintes do Ministério da Fazenda sob o nº 853332724/0001-95,' +
  ' de ora em diante denominado simplesmente ESCOLA, firmam entre si o "Contrato de' +
  ' Prestação de Serviços Educacionais", o qual reger-se-á pelas cláusulas e condições' +
  ' a seguir estipuladas.' );
  end;

  if ( Length( tblContratosComplemento.AsString ) > 0 ) and
     ( Maior21( tblContratosDataNascimento.AsDateTime, DataHoje ) ) then
  begin
    Memo.Lines.Add(
    'Pelo presente instrumento particular, de um lado ' +
    tblContratosNome.AsString + ', ' +
    tblContratosEstadoCivil.AsString + ', ' +
    'CPF ' + tblContratosCPF.AsString + ', ' +
    tblContratosEndereco.AsString + ', ' +
    tblContratosComplemento.AsString + ', ' +
    tblContratosBairro.AsString + ', ' +
    tblContratosCidade.AsString + ', ' +
    tblContratosEstado.AsString + ', ' +
    tblContratosCEP.AsString +
  ', doravante denominado CONTRATANTE,  e SOCIEDADE EDUCACIONAL BLUMENAUENSE LTDA., ' +
  'entidade jurídica de direito privado, mantenedora do Colégio Blumenauense, com sede' +
  ' na Alameda Duque de Caxias, nº 21, Centro, em Blumenau-SC, inscrita' +
  ' no Cadastro Geral de Contribuintes do Ministério da Fazenda sob o nº 853332724/0001-95,' +
  ' de ora em diante denominado simplesmente ESCOLA, firmam entre si o "Contrato de' +
  ' Prestação de Serviços Educacionais", o qual reger-se-á pelas cláusulas e condições' +
  ' a seguir estipuladas.' );
  end;

  if ( Length( tblContratosComplemento.AsString ) = 0 ) and
     ( Maior21( tblContratosDataNascimento.AsDateTime, DataHoje ) ) then
  begin
    Memo.Lines.Add(
    'Pelo presente instrumento particular, de um lado ' +
    tblContratosNome.AsString + ', ' +
    tblContratosEstadoCivil.AsString + ', ' +
    'CPF ' + tblContratosCPF.AsString + ', ' +
    tblContratosEndereco.AsString + ', ' +
    tblContratosBairro.AsString + ', ' +
    tblContratosCidade.AsString + ', ' +
    tblContratosEstado.AsString + ', ' +
    tblContratosCEP.AsString +
  ', doravante denominado CONTRATANTE e SOCIEDADE EDUCACIONAL BLUMENAUENSE LTDA., ' +
  'entidade jurídica de direito privado, mantenedora do Colégio Blumenauense, com sede' +
  ' na Alameda Duque de Caxias, nº 21, Centro, em Blumenau-SC, inscrita' +
  ' no Cadastro Geral de Contribuintes do Ministério da Fazenda sob o nº 853332724/0001-95,' +
  ' de ora em diante denominado simplesmente ESCOLA, firmam entre si o "Contrato de' +
  ' Prestação de Serviços Educacionais", o qual reger-se-á pelas cláusulas e condições' +
  ' a seguir estipuladas.' );
  end;

  Memo2.Lines.Add(
   'Cláusula 1ª) A ESCOLA se obriga a ministrar ao aluno, de ' +
   tblContratosDataInicio.DisplayText + ' a ' + tblContratosDataFim.DisplayText +
   ', ensino ' + tblContratosContrato.AsString +  ' através de aulas e demais ' +
   'atividades escolares, devendo o plano de estudos, programas e currículos ' +
   'estarem em conformidade com o disposto na legislação em vigor e de acordo com seu ' +
   'Plano Escolar.' );

  Memo3.Lines.Add(
   'Cláusula 5ª) Como contraprestação aos serviços educacionais prestados pela ' +
   'ESCOLA, o CONTRATANTE pagará o valor de ' +
   Format( 'R$ %8.2n', [tblContratosParcelas.Value * tblContratosValorContrato.Value] ) +
   ' à vista ou em ' + tblContratosParcelas.AsString + ' parcelas de ' +
   Format( 'R$ %8.2n', [tblContratosValorContrato.Value] ) + '.' );

  if tblContratosDesconto.Value <> 0 then
    Memo6.Lines.Add(
     'Parágrafo 3º - A Escola concederá, a título de bonificação, um desconto de ' +
     Format( 'R$ %8.2n', [tblContratosDesconto.Value] ) + ' sobre cada parcela ' +
     'paga até seu vencimento.' );

  Memo4.Lines.Add( 'Blumenau, ' +
   FormatDateTime( 'dd', DataHoje ) + ' de ' +
   FormatDateTime( 'mmmm', DataHoje ) + ' de ' +
   FormatDateTime( 'yyyy', DataHoje ) + '.' );

  if tblContratosTaxaApostila.Value = 0 then
    Memo5.Lines.Add( 'Parágrafo 3º - O material didático de uso individual será pago em ' +
      tblContratosNumeroTaxasMaterial.AsString + ' parcela(s) de ' +
      Format( 'R$ %8.2n', [tblContratosTaxaMaterial.Value] ) + '.' )
  else
    Memo5.Lines.Add( 'Parágrafo 3º - O material didático de uso individual do aluno ' +
      'será pago em ' + tblContratosParcelas.AsString + ' parcela(s) de ' +
      Format( 'R$ %8.2n', [tblContratosTaxaApostila.Value] ) + '.' )

end;

procedure TfrmRepContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

end.

