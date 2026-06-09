unit uRepReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, ppCache, ppDB, ppDBBDE, ppComm, ppProd, ppClass, ppReport,
  ppCtrls, ppPrnabl, ppStrtch, ppMemo, ppBands, ppRichTx;

type
  TfrmRepReq = class(TForm)
    Report: TppReport;
    ppAlunos: TppBDEPipeline;
    dtcAlunos: TDataSource;
    ppReport1Memo1: TppMemo;
    ppReport1Label1: TppLabel;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1DBText1: TppDBText;
    ppReport1Label4: TppLabel;
    ppReport1DBText2: TppDBText;
    ppReport1DBText3: TppDBText;
    ppReport1Label5: TppLabel;
    ppReport1Label6: TppLabel;
    ppReport1DBText4: TppDBText;
    ppReport1Label7: TppLabel;
    ppReport1DBText5: TppDBText;
    ppReport1Label8: TppLabel;
    ppReport1DBText6: TppDBText;
    ppReport1Label9: TppLabel;
    ppReport1DBText7: TppDBText;
    ppReport1DBText8: TppDBText;
    ppReport1Label11: TppLabel;
    ppReport1DBText9: TppDBText;
    ppReport1Label12: TppLabel;
    ppReport1DBText10: TppDBText;
    ppReport1Label13: TppLabel;
    ppReport1DBText11: TppDBText;
    ppReport1Label14: TppLabel;
    ppReport1DBText12: TppDBText;
    ppReport1Label15: TppLabel;
    ppReport1DBText13: TppDBText;
    ppReport1Label16: TppLabel;
    ppReport1DBText14: TppDBText;
    ppReport1Label17: TppLabel;
    ppReport1DBText15: TppDBText;
    ppReport1Label18: TppLabel;
    ppReport1DBText16: TppDBText;
    ppReport1Label19: TppLabel;
    ppReport1DBText17: TppDBText;
    ppReport1Label20: TppLabel;
    ppReport1DBText18: TppDBText;
    ppReport1Label21: TppLabel;
    ppReport1Label22: TppLabel;
    Memo: TppMemo;
    ReportRichText1: TppRichText;
    ReportLabel1: TppLabel;
    ReportLabel2: TppLabel;
    ReportDBText1: TppDBText;
    ReportLine1: TppLine;
    ReportLabel3: TppLabel;
    ReportLine2: TppLine;
    ReportLabel4: TppLabel;
    ReportLabel5: TppLabel;
    ReportLine3: TppLine;
    ReportLabel6: TppLabel;
    ReportLabel7: TppLabel;
    ReportDBText2: TppDBText;
    tblAlunos: TUMZQuery;
    tblAlunosCodigo: TIntegerField;
    tblAlunosNome: TStringField;
    tblAlunosDataNascimento: TDateTimeField;
    tblAlunosCidadeNascimento: TStringField;
    tblAlunosEstadoNascimento: TStringField;
    tblAlunosEndereco: TStringField;
    tblAlunosComplemento: TStringField;
    tblAlunosCEP: TStringField;
    tblAlunosBairro: TStringField;
    tblAlunosCidade: TStringField;
    tblAlunosEstado: TStringField;
    tblAlunosTelefone1: TStringField;
    tblAlunosSexo: TStringField;
    tblAlunosNacionalidade: TStringField;
    tblAlunosIdentidade: TStringField;
    tblAlunosOrgaoExp: TStringField;
    tblAlunosTurma: TStringField;
    tblAlunosCPF: TStringField;
    tblAlunosRM_CSM: TStringField;
    tblAlunosNumeroMilitar: TStringField;
    tblAlunosSerieMilitar: TStringField;
    tblAlunosDataExpMilitar: TDateTimeField;
    tblAlunosLocalExpMilitar: TStringField;
    tblAlunosOrganizacaoMilitar: TStringField;
    tblAlunosTipoDocumento: TStringField;
    tblAlunosPai: TStringField;
    tblAlunosMae: TStringField;
    tblAlunosResponsavel: TStringField;
    tblAlunosDataNascimentoResponsavel: TDateTimeField;
    tblAlunosNaturalidadeResponsavel: TStringField;
    tblAlunosUFNaturalidadeResponsavel: TStringField;
    tblAlunosSexoResponsavel: TStringField;
    tblAlunosPaiResponsavel: TStringField;
    tblAlunosMaeResponsavel: TStringField;
    tblAlunosEstadoCivilResponsavel: TStringField;
    tblAlunosNomeConjuge: TStringField;
    tblAlunosDataNascimentoConjuge: TDateTimeField;
    tblAlunosCPF_Responsavel: TStringField;
    tblAlunosRGResponsavel: TStringField;
    tblAlunosEnderecoResponsavel: TStringField;
    tblAlunosComplementoResponsavel: TStringField;
    tblAlunosCidadeResponsavel: TStringField;
    tblAlunosCEPResponsavel: TStringField;
    tblAlunosUFResponsavel: TStringField;
    tblAlunosTelefoneResponsavel: TStringField;
    tblAlunosTelefone2: TStringField;
    tblAlunosFuncionario: TStringField;
    tblAlunosVersaoCracha: TIntegerField;
    tblAlunosCodigoAlunoIndicado: TIntegerField;
    tblAlunosEstadoCivil: TStringField;
    tblAlunosDataRevisao: TDateTimeField;
    tblAlunosNomeSemAcento: TStringField;
    tblAlunosEmail: TStringField;
    tblAlunosEscolaOrigem: TStringField;
    tblAlunosSituacao: TSmallintField;
    tblAlunosCodigoAluno: TIntegerField;
    tblAlunosTurma_1: TStringField;
    tblAlunosDataEmissao: TDateTimeField;
    tblAlunosUsuario: TStringField;
    tblAlunosPlanoPagamento: TIntegerField;
    tblAlunosSituacao_1: TSmallintField;
    tblAlunosImpresso: TBooleanField;
    tblAlunosDataSaida: TDateTimeField;
    tblAlunosPlanoDesconto: TIntegerField;
    tblAlunosDiploma: TBooleanField;
    tblAlunosCodigo_1: TStringField;
    tblAlunosSerie: TSmallintField;
    tblAlunosCurso: TStringField;
    tblAlunosTurno: TStringField;
    tblAlunosDescricao: TStringField;
    tblAlunosContrato: TStringField;
    tblAlunosVagas: TSmallintField;
    tblAlunosHoraInicio: TDateTimeField;
    tblAlunosHoraFim: TDateTimeField;
    tblAlunosDataInicio: TDateTimeField;
    tblAlunosDataFim: TDateTimeField;
    tblAlunosIdadeConclusao: TSmallintField;
    tblAlunosDataConclusao: TDateTimeField;
    tblAlunosAnoSemestre: TSmallintField;
    tblAlunosAnoSemestre_1: TSmallintField;
    tblAlunosTeste: TStringField;
    procedure tblAlunosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    strDataEmissao : String;
    { Public declarations }
  end;

var
  frmRepReq: TfrmRepReq;

implementation

uses Main;

{$R *.DFM}

procedure TfrmRepReq.tblAlunosCalcFields(DataSet: TDataSet);
begin
  Memo.Lines.Clear;
  Memo.Lines.Add(
    tblAlunosNome.AsString + ', acima identificado, vem mui respeitosamente ' +
    'requerer matrícula na Turma ' + tblAlunosCodigo_1.AsString + ' - ' +
    tblAlunosDescricao.AsString + ', ' +
    'Turno ' + tblAlunosTurno.AsString + ', no ' + tblAlunosContrato.AsString + '.' );

  Memo.Lines.Add( ' ' );
  Memo.Lines.Add( 'Nestes Termos, ' );
  Memo.Lines.Add( 'Pede Deferimento.' );
  Memo.Lines.Add( 'Blumenau, ' + strDataEmissao + '.' );

end;

end.

