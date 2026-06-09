unit uImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, ComCtrls, StdCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmImport = class(TForm)
    Button1: TButton;
    Bar: TProgressBar;
    tblMens: TZTable;
    tblMensalidades: TZTable;
    tblMensalidadesCodigoAluno: TIntegerField;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesAnoLetivo: TSmallintField;
    tblMensalidadesSemestre: TSmallintField;
    tblMensalidadesBloqueto: TBooleanField;
    tblMensCodigoAluno: TIntegerField;
    tblMensNossoNumero: TStringField;
    tblMensDataVencimento: TDateTimeField;
    tblMensValorBruto: TFloatField;
    tblMensValorGratuidade: TFloatField;
    tblMensValorBase: TFloatField;
    tblMensValorDescontoPercetual: TFloatField;
    tblMensPercentualDesconto: TFloatField;
    tblMensValorExtra: TFloatField;
    tblMensValorLiquido: TFloatField;
    tblMensValorAcrescimo: TFloatField;
    tblMensValorDescontoBaixa: TFloatField;
    tblMensTipoBaixa: TIntegerField;
    tblMensValorPago: TFloatField;
    tblMensObservacao: TStringField;
    tblMensTurma: TStringField;
    tblMensalidadesValorExtra: TFloatField;
    tblMatriculas: TZTable;
    Button2: TButton;
    Button3: TButton;
    Bar2: TProgressBar;
    Bar3: TProgressBar;
    qryMens: TUMZQuery;
    tblMatriculasCodigoAluno: TIntegerField;
    tblMatriculasTurma: TStringField;
    tblMatriculasPeriodo: TSmallintField;
    tblMatriculasSequencia: TSmallintField;
    tblMatriculasDataEmissao: TDateTimeField;
    tblMatriculasUsuario: TStringField;
    tblMatriculasPlanoPagamento: TIntegerField;
    tblMatriculasSituacao: TSmallintField;
    tblMatriculasImpresso: TBooleanField;
    tblAlunos: TZTable;
    tblAlunosImp: TZTable;
    tblAlunosImpCodigo: TIntegerField;
    tblAlunosImpNome: TStringField;
    tblAlunosImpDataNascimento: TDateTimeField;
    tblAlunosImpCidadeNascimento: TStringField;
    tblAlunosImpEstadoNascimento: TStringField;
    tblAlunosImpEndereco: TStringField;
    tblAlunosImpComplemento: TStringField;
    tblAlunosImpCEP: TStringField;
    tblAlunosImpBairro: TStringField;
    tblAlunosImpCidade: TStringField;
    tblAlunosImpEstado: TStringField;
    tblAlunosImpTelefone: TStringField;
    tblAlunosImpSexo: TStringField;
    tblAlunosImpNacionalidade: TStringField;
    tblAlunosImpRG: TStringField;
    tblAlunosImpOrgaoEmissor: TStringField;
    tblAlunosImpTurma: TStringField;
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
    tblAlunosCPF_Responsavel: TStringField;
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
    tblAlunosImp2: TZTable;
    tblAlunosImp2Codigo: TIntegerField;
    tblAlunosImp2CPF: TStringField;
    tblAlunosImp2RM_CSM: TStringField;
    tblAlunosImp2NumeroMilitar: TIntegerField;
    tblAlunosImp2SerieMilitar: TStringField;
    tblAlunosImp2DataMilitar: TDateTimeField;
    tblAlunosImp2LocalMilitar: TStringField;
    tblAlunosImp2OrgMilitar: TStringField;
    tblAlunosImp2TipoDocumento: TStringField;
    tblAlunosImp2Pai: TStringField;
    tblAlunosImp2Mae: TStringField;
    tblAlunosImp2Responsavel: TStringField;
    tblAlunosImp2CPF_Responsavel: TStringField;
    tblAlunosImp2Funcionario: TStringField;
    tblAlunosImp2Cracha: TIntegerField;
    dtcAlunosImp: TDataSource;
    qryMensCodigoAluno: TIntegerField;
    qryMensTurma: TStringField;
    qryMensAnoLetivo: TSmallintField;
    qryMensSemestre: TSmallintField;
    tblMensErro: TZTable;
    tblMensErroCodigoAluno: TIntegerField;
    tblMensErroNossoNumero: TStringField;
    tblMensErroDataVencimento: TDateTimeField;
    tblMensErroValorBruto: TFloatField;
    tblMensErroValorGratuidade: TFloatField;
    tblMensErroValorBase: TFloatField;
    tblMensErroValorDescontoPercetual: TFloatField;
    tblMensErroPercentualDesconto: TFloatField;
    tblMensErroValorExtra: TFloatField;
    tblMensErroValorLiquido: TFloatField;
    tblMensErroValorAcrescimo: TFloatField;
    tblMensErroValorDescontoBaixa: TFloatField;
    tblMensErroTipoBaixa: TIntegerField;
    tblMensErroValorPago: TFloatField;
    tblMensErroObservacao: TStringField;
    tblMensErroTurma: TStringField;
    tblMensErroAnoLetivo: TIntegerField;
    tblMensErroSequencia: TIntegerField;
    tblMensDataPagamento: TDateTimeField;
    Bar4: TProgressBar;
    tblDebitos: TZTable;
    tblDebitosCodigo: TFloatField;
    tblDebitosALUNO: TStringField;
    tblDebitosFONE: TStringField;
    tblDebitosTURMA: TStringField;
    tblDebitosTURMA1: TStringField;
    tblDebitosPeriodoSequencia: TStringField;
    tblDebitosADTAR: TStringField;
    tblDebitosCDPC: TFloatField;
    tblDebitosVencimento: TDateTimeField;
    tblDebitosValorParcela: TFloatField;
    tblDebitosParcelas: TFloatField;
    btnPlanilha: TButton;
    tblDebErros: TZTable;
    tblDebErrosCodigo: TFloatField;
    tblDebErrosALUNO: TStringField;
    tblDebErrosFONE: TStringField;
    tblDebErrosTURMA: TStringField;
    tblDebErrosTURMA1: TStringField;
    tblDebErrosPeriodoSequencia: TStringField;
    tblDebErrosADTAR: TStringField;
    tblDebErrosCDPC: TFloatField;
    tblDebErrosVencimento: TDateTimeField;
    tblDebErrosValorParcela: TFloatField;
    tblDebErrosParcelas: TFloatField;
    tblMensParcela: TStringField;
    tblMensAnoLetivo: TIntegerField;
    tblMensSequencia: TIntegerField;
    tblMensErroParcela: TStringField;
    tblMensalidadesAnoSemestre: TSmallintField;
    Button4: TButton;
    Bar5: TProgressBar;
    Button5: TButton;
    Bar6: TProgressBar;
    tblInf: TUMZQuery;
    tblInfCONTRATO: TFloatField;
    tblInfALUNO: TStringField;
    tblInfTURMA: TIntegerField;
    tblInfCURSO: TStringField;
    tblInfPARCELA: TStringField;
    tblInfVENCIMENTO: TDateTimeField;
    tblInfVALOR: TFloatField;
    tblInfSITUACAO: TStringField;
    qryInsAlunos: TUMZQuery;
    qryInsMatriculas: TUMZQuery;
    qryUpdate: TUMZQuery;
    tblInfVALOR_PGTO: TFloatField;
    tblInfDATA_PGTO: TDateTimeField;
    Label1: TLabel;
    Button6: TButton;
    Bar7: TProgressBar;
    xFicha: TUMZQuery;
    Button7: TButton;
    Bar8: TProgressBar;
    Label2: TLabel;
    Button8: TButton;
    Bar9: TProgressBar;
    Label3: TLabel;
    Button9: TButton;
    Button10: TButton;
    Bar10: TProgressBar;
    txtCurso: TEdit;
    txtAnoSemestre: TEdit;
    chk: TCheckBox;
    txtTurma: TEdit;
    Button11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MensalidadeErro;
    procedure DebitosErro;
    procedure btnPlanilhaClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    lngAno, lngSemestre, lngErros : Longint;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

uses uDM, Main;

{$R *.DFM}

procedure TfrmImport.Button1Click(Sender: TObject);
var
  n : Longint;
begin
  Screen.Cursor := crHourGlass;
  tblMensErro.Open;
  tblMens.Open;
  tblMensalidades.Open;
  Bar.Max := tblMens.RecordCount;
  lngErros := 0;
  n := 1;
  lngAno := StrToInt( InputBox( Application.Title, 'Digite o Ano Letivo.', '1998' ) );
  lngSemestre := StrToInt( InputBox( Application.Title, 'Digite o Semestre.', '1' ) );
  Bar.Position := n;
  while not tblMens.Eof do
  begin
    tblMensalidades.Insert;
    tblMensalidadesCodigoAluno.Value := tblMensCodigoAluno.Value;
    tblMensalidadesParcela.AsString := Copy( tblMensParcela.Value, 1, 2 );
    tblMensalidadesDataVencimento.AsString := tblMensDataVencimento.AsString;
    tblMensalidadesDataPagamento.AsString := tblMensDataPagamento.AsString;
    tblMensalidadesTurma.AsString := tblMensTurma.AsString;
    if tblMensValorPago.Value = 0 then
    begin
      if tblMensValorBruto.Value = tblMensValorGratuidade.Value then
        tblMensalidadesSituacao.Value := 0
      else
        tblMensalidadesSituacao.Value := 2;
    end
    else
      tblMensalidadesSituacao.Value := 0;
    tblMensalidadesValorBruto.Value := tblMensValorBruto.Value;
    tblMensalidadesValorTotal.Value := tblMensValorLiquido.Value;
    tblMensalidadesValorExtra.Value := tblMensValorExtra.Value;
    tblMensalidadesValorExtra.Value := tblMensalidadesValorExtra.Value +
      tblMensValorAcrescimo.Value;
    tblMensalidadesValorDesconto.Value := tblMensValorGratuidade.Value;
    tblMensalidadesDescontoExtra.Value := tblMensValorDescontoPercetual.Value +
      tblMensValorDescontoBaixa.Value;
    tblMensalidadesValorPago.Value := tblMensValorPago.Value;
    tblMensalidadesAnoLetivo.Value := lngAno;
    tblMensalidadesSemestre.Value := lngSemestre;
    tblMensalidadesAnoSemestre.AsString := tblMensalidadesAnoLetivo.AsString +
      tblMensalidadesSemestre.AsString;
//    tblMensalidadesNossoNumero.AsString := '82' +
//      Copy( Format( '%.6d', [tblMensalidadesCodigoAluno.AsInteger] ), 1, 5 ) +
//     Format( '%.1d', [tblMensalidadesSemestre.AsInteger] ) +
//      Format( '%.2d', [tblMensalidadesParcela.AsInteger] );
    tblMensalidadesNossoNumero.AsString := DM.NovoNumero(1);

    try
    tblMensalidades.Post;
//    tblMensalidades.Refresh;
    except MensalidadeErro;
    end;
    Inc( n );
    Bar.Position := n;
    Application.ProcessMessages;
    tblMens.Next;
  end;
  tblMens.Close;
  tblMensalidades.Close;
  tblMensErro.Close;
  Screen.Cursor := crDefault;
  if lngErros > 0 then
    Mensagem( 'Havia(m) ' + IntToStr( lngErros ) + ' mensalidade(s) repetidas.',
      Application.Title, MB_ICONINFORMATION + MB_OK );
  Mensagem( 'Importação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );

end;





procedure TfrmImport.Button2Click(Sender: TObject);
var
  n : Longint;
begin
  Screen.Cursor := crHourGlass;
  tblMatriculas.Open;
  qryMens.Open;
  Bar2.Max := qryMens.RecordCount;
  n := 1;
  Bar2.Position := n;
  while not qryMens.Eof do
  begin
    tblMatriculas.Insert;
    tblMatriculasCodigoAluno.Value := qryMensCodigoAluno.Value;
    tblMatriculasTurma.Value := qryMensTurma.Value;
    tblMatriculasPeriodo.Value := qryMensAnoLetivo.Value;
    tblMatriculasSequencia.Value := qryMensSemestre.Value;
    tblMatriculasDataEmissao.Value := DataHoje;
    tblMatriculasUsuario.AsString := DM.tblUsuariosNomeNome.AsString;
    if ( qryMensAnoLetivo.Value >= 1998 ) and
       ( qryMensSemestre.Value >=1 ) then
      tblMatriculasSituacao.Value := 0
    else
      tblMatriculasSituacao.Value := 2;

    tblMatriculas.Post;
    tblMatriculas.Refresh;
    Inc( n );
    Bar2.Position := n;
    Application.ProcessMessages;
    qryMens.Next;
  end;
  qryMens.Close;
  tblMatriculas.Close;
  Screen.Cursor := crDefault;
  Mensagem( 'Importação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );

end;

procedure TfrmImport.Button3Click(Sender: TObject);
var
  n : Longint;
begin
  Screen.Cursor := crHourGlass;
  tblAlunos.Open;
  tblAlunosImp2.Open;
  tblAlunosImp.Open;
  Bar3.Max := tblAlunosImp.RecordCount;
  n := 1;
  Bar3.Position := 0;
  while not tblAlunosImp.Eof do
  begin
    tblAlunos.Insert;
    tblAlunosCodigo.Value :=     tblAlunosImpCodigo.Value;
    tblAlunosNome.Value :=    tblAlunosImpNome.Value;
    tblAlunosDataNascimento.Value :=    tblAlunosImpDataNascimento.Value;
    tblAlunosCidadeNascimento.Value :=    tblAlunosImpCidadeNascimento.Value;
    tblAlunosEstadoNascimento.Value :=    tblAlunosImpEstadoNascimento.Value;
    tblAlunosEndereco.Value :=     tblAlunosImpEndereco.Value;
    tblAlunosComplemento.Value :=    tblAlunosImpComplemento.Value;
    tblAlunosCEP.Value :=    tblAlunosImpCEP.Value;
    tblAlunosBairro.Value :=    tblAlunosImpBairro.Value;
    tblAlunosCidade.Value :=    tblAlunosImpCidade.Value;
    tblAlunosEstado.Value :=    tblAlunosImpEstado.Value;
    tblAlunosTelefone1.Value :=     tblAlunosImpTelefone.Value;
    tblAlunosSexo.Value :=    tblAlunosImpSexo.Value;
    tblAlunosNacionalidade.Value :=    tblAlunosImpNacionalidade.Value;
    tblAlunosIdentidade.Value :=    tblAlunosImpRG.Value;
    tblAlunosOrgaoExp.Value :=    tblAlunosImpOrgaoEmissor.Value;
    tblAlunosTurma.Value :=    tblAlunosImpTurma.Value;
    tblAlunosCPF.Value :=    tblAlunosImp2CPF.Value;
    tblAlunosRM_CSM.Value :=    tblAlunosImp2RM_CSM.Value;
    tblAlunosNumeroMilitar.AsString :=    tblAlunosImp2NumeroMilitar.AsString;
    tblAlunosSerieMilitar.Value :=    tblAlunosImp2SerieMilitar.Value;
    tblAlunosDataExpMilitar.AsString :=    tblAlunosImp2DataMilitar.AsString;
    tblAlunosLocalExpMilitar.Value :=    tblAlunosImp2LocalMilitar.Value;
    tblAlunosOrganizacaoMilitar.Value :=    tblAlunosImp2OrgMilitar.Value;
    tblAlunosTipoDocumento.Value :=    tblAlunosImp2TipoDocumento.Value;
    tblAlunosPai.Value :=    tblAlunosImp2Pai.Value;
    tblAlunosMae.Value :=    tblAlunosImp2Mae.Value;
    tblAlunosResponsavel.Value :=    tblAlunosImp2Responsavel.Value;
    tblAlunosCPF_Responsavel.Value :=    tblAlunosImp2CPF_Responsavel.Value;
{    tblAlunosEnderecoResponsavel.Value :=
    tblAlunosComplementoResponsavel.Value :=
    tblAlunosCidadeResponsavel.Value :=
    tblAlunosCEPResponsavel.Value :=
    tblAlunosUFResponsavel.Value :=
    tblAlunosTelefoneResponsavel.Value :=
    tblAlunosTelefone2.Value :=}
    tblAlunosFuncionario.Value :=    tblAlunosImp2Funcionario.Value;
    tblAlunosVersaoCracha.Value :=    tblAlunosImp2Cracha.Value;
{    tblAlunosCodigoAlunoIndicado.Value :=
    tblAlunosEstadoCivil.Value :=}
    try
    tblAlunos.Post;
    except tblAlunos.Cancel;
    end;
    Inc( n );
    Bar3.Position := n;
    Application.ProcessMessages;
    tblAlunosImp.Next;
  end;
  tblAlunos.Close;
  tblAlunosImp.Close;
  tblAlunosImp2.Close;
  Screen.Cursor := crDefault;
  Mensagem( 'Importação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );


end;

procedure TfrmImport.MensalidadeErro;
begin
  Inc( lngErros );
  tblMensErro.Insert;
  tblMensErroCodigoAluno.Value := tblMensCodigoAluno.Value;
  tblMensErroParcela.Value := tblMensParcela.Value;
  tblMensErroDataVencimento.Value := tblMensDataVencimento.Value;
  tblMensErroTurma.AsString := tblMensTurma.AsString;
  tblMensErroValorBruto.Value := tblMensValorBruto.Value;
  tblMensErroValorLiquido.Value := tblMensValorLiquido.Value;
  tblMensErroValorExtra.Value := tblMensValorExtra.Value;
  tblMensErroValorGratuidade.Value := tblMensValorGratuidade.Value;
  tblMensErroValorAcrescimo.Value := tblMensValorAcrescimo.Value;
  tblMensErroValorPago.Value := tblMensValorPago.Value;
  tblMensErroAnoLetivo.Value := lngAno;
  tblMensErroSequencia.Value := lngSemestre;
  tblMensErro.Post;
  tblMensalidades.Cancel;
end;


procedure TfrmImport.btnPlanilhaClick(Sender: TObject);
var
  n, i, x : Longint;
  MyDate : TDateTime;
  wYear, wMonth, wDay, Dia : Word;
begin
  Screen.Cursor := crHourGlass;
  tblDebErros.Open;
  tblMensalidades.Open;
  tblDebitos.Open;
  Bar4.Max := tblDebitos.RecordCount;
  lngErros := 0;
  n := 1;
  Bar4.Position := n;

  while not tblDebitos.Eof do
  begin

    MyDate := tblDebitosVencimento.AsDateTime;
    DecodeDate( tblDebitosVencimento.AsDateTime, wYear, wMonth, Dia );
    case DayOfWeek( MyDate ) of
      1 : MyDate := MyDate + 1;
      7 : MyDate := MyDate + 2;
    end;
    DecodeDate( MyDate, wYear, wMonth, wDay );

    x := tblDebitosParcelas.AsInteger;

    if x = 0 then x := 1;

    for i := 1 to x do
    begin

      tblMensalidades.Insert;
      tblMensalidadesCodigoAluno.Value := tblDebitosCodigo.AsInteger;
      tblMensalidadesParcela.Value := i;
      tblMensalidadesDataVencimento.AsDateTime := MyDate;
      DecodeDate( MyDate, wYear, wMonth, wDay );
      MyDate := EncodeDate( wYear, wMonth, Dia );

      if wMonth = 12 then
      begin
        wMonth := 1;
        wYear := wYear + 1;
      end
      else
        Inc( wMonth );
      MyDate := EncodeDate( wYear, wMonth, Dia );
      tblMensalidadesDataPagamento.AsString := '';
      tblMensalidadesTurma.AsString := tblDebitosTurma.AsString;
      tblMensalidadesValorPago.AsString := '';
      tblMensalidadesSituacao.Value := 2;

      if tblDebitosValorParcela.Value = 0 then
        tblMensalidadesValorBruto.Value := 30 { TAXA DE APOSTILA }
      else
        tblMensalidadesValorBruto.Value := tblDebitosValorParcela.Value;

      tblMensalidadesValorTotal.Value := tblMensalidadesValorBruto.Value;
      tblMensalidadesValorExtra.AsString := '';
      tblMensalidadesValorDesconto.AsString := '';
      tblMensalidadesDescontoExtra.AsString := '';
      tblMensalidadesAnoLetivo.AsString := '19' +
        Copy( tblDebitosPeriodoSequencia.AsString, 1, 2 );
      tblMensalidadesSemestre.AsString :=
        Copy( tblDebitosPeriodoSequencia.AsString, 4, 1 );
      tblMensalidadesAnoSemestre.AsString := tblMensalidadesAnoLetivo.AsString +
        tblMensalidadesSemestre.AsString;
//      tblMensalidadesNossoNumero.AsString := '82' +
//        Copy( Format( '%.6d', [tblMensalidadesCodigoAluno.AsInteger] ), 1, 5 ) +
//        Format( '%.1d', [tblMensalidadesSemestre.AsInteger] ) +
//        Format( '%.2d', [tblMensalidadesParcela.AsInteger] );
      tblMensalidadesNossoNumero.AsString := DM.NovoNumero(1);

      try
      tblMensalidades.Post;
      except
        begin
          tblMensalidades.Cancel;
          DebitosErro;
        end;
      end;
    end;
    Inc( n );
    Bar4.Position := n;
    Application.ProcessMessages;
    tblDebitos.Next;
    end;
  tblMensalidades.Close;
  tblDebitos.Close;
  tblDebErros.Close;
  Screen.Cursor := crDefault;
  if n > 0 then
    Mensagem( 'Havia(m) ' + IntToStr( lngErros ) + ' mensalidade(s) repetidas.',
      Application.Title, MB_ICONINFORMATION + MB_OK );
  Mensagem( 'Importação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );


end;

procedure TfrmImport.DebitosErro;
begin
    Inc( lngErros );
    tblDebErros.Insert;
    tblDebErrosCodigo.Value :=     tblDebitosCodigo.Value;
    tblDebErrosALUNO.Value :=     tblDebitosALUNO.Value;
    tblDebErrosFONE.Value :=     tblDebitosFONE.Value;
    tblDebErrosTURMA.Value :=     tblDebitosTURMA.Value;
    tblDebErrosTURMA1.Value :=     tblDebitosTURMA1.Value;
    tblDebErrosPeriodoSequencia.Value :=     tblDebitosPeriodoSequencia.Value;
    tblDebErrosADTAR.Value :=     tblDebitosADTAR.Value;
    tblDebErrosCDPC.Value :=     tblDebitosCDPC.Value;
    tblDebErrosVencimento.Value :=     tblDebitosVencimento.Value;
    tblDebErrosValorParcela.Value :=    tblDebitosValorParcela.Value;
    tblDebErrosParcelas.Value :=     tblDebitosParcelas.Value;
    tblDebErros.Post;
end;



procedure TfrmImport.Button4Click(Sender: TObject);
var
  n, i, x : Longint;
  MyDate : TDateTime;
  wYear, wMonth, wDay, Dia : Word;
  strPeriodo, strSequencia, strTurma : String;
begin
  Screen.Cursor := crHourGlass;
  tblDebErros.Open;
  tblMatriculas.Open;
  tblDebitos.Open;
  Bar5.Max := tblDebitos.RecordCount;
  lngErros := 0;
  n := 1;
  Bar5.Position := n;

  while not tblDebitos.Eof do
  begin

    strPeriodo := '19' + Copy( tblDebitosPeriodoSequencia.AsString, 1, 2 );
    strSequencia := Copy( tblDebitosPeriodoSequencia.AsString, 4, 1 );
    strTurma := tblDebitosTurma.AsString;
    if tblMatriculas.FindKey( [tblDebitosCodigo.AsInteger, strTurma,
                               strPeriodo, strSequencia] ) then
    begin
      tblMatriculas.Edit;
      if tblDebitosADTAR.AsString = 'A' then
        tblMatriculasSituacao.AsInteger := 0;
      if tblDebitosADTAR.AsString = 'R' then
        tblMatriculasSituacao.AsInteger := 9;
      tblMatriculas.Post;
    end
    else
    begin
      DebitosErro;
    end;


    Inc( n );
    Bar5.Position := n;
    Application.ProcessMessages;
    tblDebitos.Next;
  end;
  tblMensalidades.Close;
  tblDebitos.Close;
  tblDebErros.Close;
  Screen.Cursor := crDefault;
  if lngErros > 0 then
    Mensagem( 'Havia(m) ' + IntToStr( n ) + ' matriculas a serem importadas.',
      Application.Title, MB_ICONINFORMATION + MB_OK );
  Mensagem( 'Importação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );

end;

procedure TfrmImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrmImport.Button5Click(Sender: TObject);
var
  n, i, x, lngCodigoAluno : Longint;
  MyDate : TDateTime;
  wYear, wMonth, wDay, Dia : Word;
  strPeriodo, strSequencia, strTurma : String;
  strTurmaInf, strTurmaEsc : String;
  dblContrato : Double; {CODIGO DO ALUNO NO SISTEMA DA UNINFORMARE}
begin

  // IMPORTACAO COMECADA NO DIA 13/09/1999

  Screen.Cursor := crHourGlass;

  try

  strTurmaInf := InputBox( 'Digite a turma Informare', 'Digite a Turma', strTurmaInf );

  strTurmaEsc := InputBox( 'Digite a turma Universitário', 'Digite a Turma', strTurmaEsc );

  tblInf.Close;
  tblInf.ParamByName('TURMA').AsInteger := StrToInt(strTurmaInf);
  tblInf.Prepare;
  tblInf.Open;

  Bar5.Max := tblInf.RecordCount;
  n := 1;
  Bar5.Position := n;

  dblContrato := 0;
  lngCodigoAluno := 0;
  DM.db.StartTransaction;
  while not tblInf.Eof do
  begin

{      if DM.tblAlunos.RecordCount > 0 then
        lngCodigoAluno := DM.tblAlunosCodigo.AsInteger
      else
      begin
        lngCodigoAluno := DM.NovoAluno;
        // ************ INCLUI O ALUNO **************
        qryInsAlunos.ParamByName('CONTRATO').AsFloat := tblInfContrato.AsFloat;
        qryInsAlunos.ParamByName('NovoCodigo').AsInteger := lngCodigoAluno;
        qryInsAlunos.ParamByName('SemAcento').AsString :=
          SemAcento( AnsiUpperCase(tblInfALUNO.AsString) );
        qryInsAlunos.ExecSQL;
        // ******************************************
      end;}

      //************* INCLUIR MATRICULAS **************
{      qryInsMatriculas.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
      qryInsMatriculas.ParamByName('Turma').AsString := strTurmaEsc;
      qryInsMatriculas.PAramByName('Anosemestre').AsInteger := 19992;
      qryInsMatriculas.ParamByName('DataEmissao').asDateTime := DataHoje;
      qryInsMatriculas.PAramByName('Usuario').AsString := 'RAFAEL';
      qryInsMatriculas.ParamByName('PlanoPagamento').AsInteger := 0;
      qryInsMatriculas.PAramByName('Situacao').AsInteger := 1; {EM CURSO}
 {     qryInsMatriculas.ExecSQL;
      //***********************************************

      // ********** INCLUIR FICHA INDIVIDUAL ***********
      DM.MatricularGrade( lngCodigoAluno, strTurmaEsc, 19992 );
      //************************************************}

    if tblInfCONTRATO.AsFloat <> dblContrato then
    begin
      DM.tblAlunos.Close;
      DM.tblAlunos.SQL.Clear;
      DM.tblAlunos.SQL.Add( 'select * from Pessoas where' );
      DM.tblAlunos.SQL.Add( 'nm_sem_Acento = :Nome' );
      DM.tblAlunos.ParamByName('Nome').AsString := SemAcento(AnsiUpperCase(Trim(tblInfALUNO.AsString)));
      DM.tblAlunos.Prepare;
      DM.tblAlunos.Open;
      dblContrato := tblInfCONTRATO.AsFloat;
    end;

      if RoundFloat(tblInfVALOR_PGTO.AsFloat,2) > 0.00 then
      begin
	qryUpdate.ParamByName('CodigoAluno').AsInteger := DM.tblAlunoscd_pessoa.AsInteger;
        qryUpdate.ParamByName('Parcela').AsInteger := StrToInt( Copy( tblInfPARCELA.AsString, 1, 2));
        qryUpdate.ParamByName('DataVencimento').AsDateTime := tblInfVENCIMENTO.AsDateTime;
        qryUpdate.ParamByName('Turma').AsString := strTurmaEsc;
        qryUpdate.ParamByName('ValorPago').asFloat :=
          RoundFloat(tblInfVALOR_PGTO.AsFloat,2);
        qryUpdate.ParamByName('DataPagamento').AsDateTime := tblInfDATA_PGTO.AsDateTime;
        qryUpdate.ExecSQL;
      end;

{    DM.tblDeptoCursoTurma.Close;
    DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := 19992;
    DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := strTurmaEsc;
    DM.tblDeptoCursoTurma.Prepare;
    DM.tblDeptoCursoTurma.Open;

    DM.GerarMensalidade(
      lngCodigoAluno,
      StrToInt( Copy( tblInfPARCELA.AsString, 1, 2)),
      strTurmaEsc,
      RoundFloat( tblInfVALOR.AsFloat, 2 ),
      19992,
      tblInfVENCIMENTO.AsDateTime,
      2,
      DM.tblDeptoCursoTurmaCurso.AsString,
      DM.tblDeptoCursoTurmaDepto.AsInteger );}

    Inc( n );
    Bar5.Position := n;
    Application.ProcessMessages;
    tblInf.Next;

    Label1.Caption := tblInfContrato.AsString + ' / ' +
                      DM.tblAlunoscd_pessoa.AsString + ' / ' +
                      Format( '%8.2n', [tblInfValor_Pgto.AsFloat] );


  end;

  DM.db.Commit;
  except
    DM.db.Rollback;
    Mensagem( 'Ocorreu um erro inesperado durante a importação.', Application.Title,
              MB_OK + MB_ICONSTOP );
    Screen.Cursor := crDefault;
    Exit;
  end;

  Screen.Cursor := crDefault;

  Mensagem( 'Foram importadas ' + IntToStr( n ) + ' registros referentes a Uninformare.',
      Application.Title, MB_ICONINFORMATION + MB_OK );
  Mensagem( 'Importação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );

end;


procedure TfrmImport.Button6Click(Sender: TObject);
var
  xReg, xMat, xInsMat, xAlunos, xInsAlunos, xGrade: TUMZQuery;
  n, x, xCodAluno : Longint;
  xNota: Double;
  flg: Boolean;
  xOldTurma : String;
begin
  DM.CreateQuery(xReg);
  DM.CreateQuery(xGrade);
  DM.CreateQuery(xAlunos);
  DM.CreateQuery(xInsAlunos);
  DM.CreateQuery(xMat);
  DM.CreateQuery(xInsMat);

  n := 1;
  DM.db.StartTransaction;
  try
    try
      xReg.SQL.Add( 'select * from Notas' +
        Copy(txtCurso.Text, 1, 3 ) + Copy(txtAnoSemestre.Text, 3, 3 ));// where Cod = 71528');
      xReg.SQL.Add( 'where CUR = :CUR' );
      xReg.ParamByName('CUR').AsString := txtCurso.Text;
      if txtTurma.Text <> '' then
      begin
        xReg.SQL.Add( 'and TURMA = :TURMA' );
        xReg.ParamByName('TURMA').AsString := txtTurma.Text;
      end;
      xReg.SQL.Add( 'order by TURMA, COD, DISC');
      xReg.Open;

      xGrade.SQL.Add( 'SELECT GradeCurricular.Codigo, GradeCurricular.Disciplina');
      xGrade.SQL.Add( 'FROM GradeCurricular INNER JOIN');
      xGrade.SQL.Add( '(Turmas INNER JOIN Cursos ON Turmas.Curso = Cursos.Codigo) ON');
      xGrade.SQL.Add( '(GradeCurricular.Serie = Turmas.Serie) AND');
      xGrade.SQL.Add( '(GradeCurricular.Curso = Cursos.Codigo) AND');
      xGrade.SQL.Add( '(GradeCurricular.AnoSemestre = Cursos.AnoSemestre) AND');
      xGrade.SQL.Add( '(GradeCurricular.Turno = Turmas.Turno)');

      xGrade.SQL.Add( 'where' );
      xGrade.SQL.Add( 'Turmas.AnoSemestre = :AnoSemestre and' );
      xGrade.SQL.Add( 'Turmas.Curso = :Curso and' );
      xGrade.SQL.Add( 'Turmas.Codigo = :Turma and' );
      xGrade.SQL.Add( 'Cursos.GradePadrao = True and' );
      xGrade.SQL.Add( 'GradeCurricular.Disciplina = :Disciplina');

      xAlunos.SQL.Add( 'select Codigo from Alunos' );
      xAlunos.SQL.Add( 'where Codigo = :Codigo' );

      xInsAlunos.SQL.Add( 'insert into Alunos (Codigo, Nome, NomeSemAcento)' );
      xInsAlunos.SQL.Add( 'values (:Codigo, :Nome, :NomeSemAcento)' );

      xMat.SQL.Add( 'select CodigoAluno, Turma, AnoSemestre from Matriculas' );
      xMat.SQL.Add( 'where AnoSemestre = :AnoSemestre and Turma = :Turma and' );
      xMat.SQL.Add( 'CodigoAluno = :CodigoAluno' );

      xInsMat.SQL.Add( 'insert into Matriculas (AnoSemestre, CodigoAluno, Turma,' );
      xInsMat.SQL.Add( 'Curso, DataEmissao, Usuario, Situacao) VALUES ');
      xInsMat.SQL.Add( '(:AnoSemestre, :CodigoAluno, :Turma,' );
      xInsMat.SQL.Add( ':Curso, :DataEmissao, :Usuario, :Situacao)' );

      Bar7.Max := xReg.RecordCount;

      xCodAluno := 0;
      xOldTurma := xReg.FieldByName('TURMA').AsString;
      while not xReg.Eof do
      begin

        if chk.Checked then
        begin
          if xOldTurma <> xReg.FieldByName('TURMA').AsString then
          begin
            DM.db.Commit;
            DM.db.StartTransaction;
          end;
        end;

        for x := 0 to xFicha.ParamCount - 1 do
        begin
          xFicha.Params[x].Clear;
        end;

        if xCodAluno <> xReg.FieldByName('COD').AsInteger then
        begin
          xAlunos.Close;
          xAlunos.ParamByName('Codigo').AsInteger := xReg.FieldByName('COD').AsInteger;
          if not xAlunos.Prepared then xAlunos.Prepare;
          xAlunos.Open;

          if xAlunos.IsEmpty then
          begin
            xInsAlunos.ParamByName('Codigo').AsInteger := xReg.FieldByName('COD').AsInteger;
            xInsAlunos.ParamByName('Nome').AsString := Corrige(xReg.FieldByName('NOME').AsString);
            xInsAlunos.ParamByName('NomeSemAcento').AsString := SemAcento(xInsAlunos.ParamByName('Nome').AsString);
            xInsAlunos.ExecSQL;
          end;

          xMat.Close;
          xMat.ParamByName('CodigoAluno').ASInteger := xReg.FieldByName('COD').AsInteger;
          xMat.ParamByName('Turma').AsString := xReg.FieldByName('TURMA').AsString;
          xMat.ParamByName('AnoSemestre').Asinteger := StrToInt(
              xReg.FieldByName('ANO').AsString + xReg.FieldByName('S').AsString );
          if not xMat.Prepared then xMat.Prepare;
          xMat.Open;

          if xMat.IsEmpty then
          begin
            xInsMat.ParamByName('AnoSemestre').AsInteger := xMat.ParamByName('AnoSemestre').AsInteger;
            xInsMat.ParamByName('Turma').AsString := xMat.ParamByName('Turma').AsString;
            xInsMat.ParamByName('CodigoAluno').AsINteger := xMat.ParamByName('CodigoAluno').AsInteger;
            xInsMat.ParamByname('Curso').AsString := xReg.FieldByName('CUR').AsString;
            xInsMat.ParamByName('DataEmissao').AsDateTime := Date;
            xInsMat.paramByName('Usuario').AsString := 'IMPORTACAO';
            xInsMat.ParamByName('Situacao').AsInteger := 20;
            xInsMat.ExecSQL;
          end;

          xCodAluno := xReg.FieldByName('COD').AsInteger;
        end;


        xFicha.ParamByName('AnoSemestre').AsInteger := StrToInt(
                  xReg.FieldByName('ANO').AsString + xReg.FieldByName('S').AsString );
        xFicha.ParamByName('Turma').AsString := xReg.FieldByName('TURMA').AsString;
        xFicha.ParamByName('Disciplina').AsInteger := xReg.FieldByName('DISC').AsInteger;

        xGrade.Close;
        xGrade.ParamByName('AnoSemestre').AsInteger := xFicha.ParamByName('AnoSemestre').AsInteger;
        xGrade.ParamByName('Curso').AsString := xReg.FieldByName('CUR').AsString;
        xGrade.ParamByName('Turma').AsString := xReg.FieldByName('TURMA').AsString;
        xGrade.ParamByName('Disciplina').AsInteger := xReg.FieldByName('DISC').AsInteger; //
        if not xGrade.Prepared then xGrade.Prepare;
        xGrade.Open;
//        xGrade.Locate('Disciplina', xReg.FieldByName('DISC').AsInteger, [loCaseInsensitive] );

        if xGrade.IsEmpty then flg := True else flg := False;

        xFicha.ParamByName('CodigoGrade' ).ASString := xGrade.FieldByName('Codigo').AsString;

        xFicha.ParamByName('CodigoAluno' ).AsInteger := xReg.FieldByName('COD').AsInteger;
        xFicha.ParamByName('Curso' ).AsString := xReg.FieldByName('CUR').AsString;
        xFicha.ParamByName('Grau').AsInteger := 2;
        xFicha.ParamByName('Serie').AsInteger := StrToInt(Copy(xReg.FieldByName('TURMA').AsString,1,1));

        try
          if xReg.FieldByName('M1B').AsString <> '' then
            xFicha.ParamByName('Nota1').AsFloat :=
              StrToFloat(xReg.FieldByName('M1B').AsString );
        except
          if xReg.FieldByName('M1B').AsString = 'UM' then
            xFicha.ParamByName('Nota1').AsString := '1';
          if xReg.FieldByName('M1B').AsString = 'DEZ' then
            xFicha.ParamByName('Nota1').AsString := '10';
          if xReg.FieldByName('M1B').AsString = 'DISP' then
            xFicha.ParamByName('Nota1').AsString := '-1';
          if xReg.FieldByName('M1B').AsString = '****' then
            xFicha.ParamByName('Nota1').AsString := '-2';
          if xReg.FieldByName('M1B').AsString = 'ZERO' then
            xFicha.ParamByName('Nota1').AsString := '0';
        end;

        try
          if xReg.FieldByName('M2B').AsString <> '' then
            xFicha.ParamByName('Nota2').AsFloat :=
              StrToFloat(xReg.FieldByName('M2B').AsString );
        except
          if xReg.FieldByName('M2B').AsString = 'UM' then
            xFicha.ParamByName('Nota2').AsString := '1';
          if xReg.FieldByName('M2B').AsString = 'DEZ' then
            xFicha.ParamByName('Nota2').AsString := '10';
          if xReg.FieldByName('M2B').AsString = 'DISP' then
            xFicha.ParamByName('Nota2').AsString := '-1';
          if xReg.FieldByName('M2B').AsString = '****' then
            xFicha.ParamByName('Nota2').AsString := '-2';
          if xReg.FieldByName('M2B').AsString = 'ZERO' then
            xFicha.ParamByName('Nota2').AsString := '0';
        end;

        try
          if xReg.FieldByName('M3B').AsString <> '' then
            xFicha.ParamByName('Nota3').AsFloat :=
              StrToFloat(xReg.FieldByName('M3B').AsString );
        except
          if xReg.FieldByName('M3B').AsString = 'UM' then
            xFicha.ParamByName('Nota3').AsString := '1';
          if xReg.FieldByName('M3B').AsString = 'DEZ' then
            xFicha.ParamByName('Nota3').AsString := '10';
          if xReg.FieldByName('M3B').AsString = 'DISP' then
            xFicha.ParamByName('Nota3').AsString := '-1';
          if xReg.FieldByName('M3B').AsString = '****' then
            xFicha.ParamByName('Nota3').AsString := '-2';
          if xReg.FieldByName('M3B').AsString = 'ZERO' then
            xFicha.ParamByName('Nota3').AsString := '0';
        end;

        try
          if xReg.FieldByName('M4B').AsString <> '' then
            xFicha.ParamByName('Nota4').AsFloat :=
              StrToFloat(xReg.FieldByName('M4B').AsString );
        except
          if xReg.FieldByName('M4B').AsString = 'UM' then
            xFicha.ParamByName('Nota4').AsString := '1';
          if xReg.FieldByName('M4B').AsString = 'DEZ' then
            xFicha.ParamByName('Nota4').AsString := '10';
          if xReg.FieldByName('M4B').AsString = 'DISP' then
            xFicha.ParamByName('Nota4').AsString := '-1';
          if xReg.FieldByName('M4B').AsString = '****' then
            xFicha.ParamByName('Nota4').AsString := '-2';
          if xReg.FieldByName('M4B').AsString = 'ZERO' then
            xFicha.ParamByName('Nota4').AsString := '0';
        end;

        try
          if xReg.FieldByName('MEDF').AsString <> '' then
            xFicha.ParamByName('MediaFinal').AsFloat :=
              StrToFloat(xReg.FieldByName('MEDF').AsString );
        except
          if xReg.FieldByName('MEDF').AsString = 'UM' then
            xFicha.ParamByName('MediaFinal').AsString := '1';
          if xReg.FieldByName('MEDF').AsString = 'DEZ' then
            xFicha.ParamByName('MediaFinal').AsString := '10';
          if xReg.FieldByName('MEDF').AsString = 'DISP' then
            xFicha.ParamByName('MediaFinal').AsString := '-1';
          if xReg.FieldByName('MEDF').AsString = '****' then
            xFicha.ParamByName('MediaFinal').AsString := '-2';
          if xReg.FieldByName('MEDF').AsString = 'ZERO' then
            xFicha.ParamByName('MediaFinal').AsString := '0';
        end;

        try
          if xReg.FieldByName('EXFI').AsString <> '' then
            xFicha.ParamByName('NotaExame').AsFloat :=
              StrToFloat(xReg.FieldByName('EXFI').AsString );
        except
          if xReg.FieldByName('EXFI').AsString = 'UM' then
            xFicha.ParamByName('NotaExame').AsString := '1';
          if xReg.FieldByName('EXFI').AsString = 'DEZ' then
            xFicha.ParamByName('NotaExame').AsString := '10';
          if xReg.FieldByName('EXFI').AsString = 'DISP' then
            xFicha.ParamByName('NotaExame').AsString := '-1';
          if xReg.FieldByName('EXFI').AsString = '****' then
            xFicha.ParamByName('NotaExame').AsString := '-2';
          if xReg.FieldByName('EXFI').AsString = 'ZERO' then
            xFicha.ParamByName('NotaExame').AsString := '0';
        end;

        try
          if xReg.FieldByName('2EP').AsString <> '' then
            xFicha.ParamByName('SegEpoca').AsFloat :=
              StrToFloat(xReg.FieldByName('2EP').AsString );
        except
          if xReg.FieldByName('2EP').AsString = 'UM' then
            xFicha.ParamByName('SegEpoca').AsString := '1';
          if xReg.FieldByName('2EP').AsString = 'DEZ' then
            xFicha.ParamByName('SegEpoca').AsString := '10';
          if xReg.FieldByName('2EP').AsString = 'DISP' then
            xFicha.ParamByName('SegEpoca').AsString := '-1';
          if xReg.FieldByName('2EP').AsString = '****' then
            xFicha.ParamByName('SegEpoca').AsString := '-2';
          if xReg.FieldByName('2EP').AsString = 'ZERO' then
            xFicha.ParamByName('SegEpoca').AsString := '0';
        end;


        xFicha.ParamByName('Falta1').AsInteger := RC_StrToInt(xReg.FieldByName('F1').AsString);

        if xReg.FieldByName('Exp1').AsString <> '' then
          xFicha.ParamByName('Exame1').AsFloat := RC_StrToFloat(xReg.FieldByName('Exp1').AsString);

        xFicha.ParamByName('Falta2').AsInteger := RC_StrToInt(xReg.FieldByName('F2').AsString);

        if xReg.FieldByName('Exp2').AsString <> '' then
          xFicha.ParamByName('Exame2').AsFloat := RC_StrToFloat(xReg.FieldByName('Exp2').AsString);

        xFicha.ParamByName('Falta3').AsInteger := RC_StrToInt(xReg.FieldByName('F3').AsString);

        if xReg.FieldByName('Exp3').AsString <> '' then
          xFicha.ParamByName('Exame3').AsFloat := RC_StrToFloat(xReg.FieldByName('Exp3').AsString);

        xFicha.ParamByName('Falta4').AsInteger := RC_StrToInt(xReg.FieldByName('F4').AsString);

        if xReg.FieldByName('Exp4').AsString <> '' then
          xFicha.ParamByName('Exame4').AsFloat := RC_StrToFloat(xReg.FieldByName('Exp4').AsString);

        xFicha.ParamByName('Frequencia').AsInteger := xReg.FieldByName('FRE').AsInteger;
        xFicha.ParamByName('TotalFaltas').AsInteger := xFicha.ParamByName('Falta1').AsInteger +
                                                       xFicha.ParamByName('Falta2').AsInteger +
                                                       xFicha.ParamByName('Falta3').AsInteger +
                                                       xFicha.ParamByName('Falta4').AsInteger;

        if xReg.FieldByName('SITU').AsString = 'APRO' then
          xFicha.ParamByName('Situacao').AsInteger := 0;

        if xReg.FieldByName('SITU').AsString = 'REPR' then
          xFicha.ParamByName('Situacao').AsInteger := 9;

        if xReg.FieldByName('SITU').AsString = '' then
          xFicha.ParamByName('Situacao').AsInteger := 99;

        xFicha.ParamByName('Usuario').AsInteger := 0;
        xFicha.ParamByName('CodigoEscola').AsInteger := 1;

        Label2.Caption := xReg.FieldByName('COD').AsString + ' - ' +
                          xReg.FieldByName('DISC').ASString + ' - ' +
                          xReg.FieldByName('TURMA').AsString;

        if not flg then xFicha.ExecSQL;

        Inc(n);
        Bar7.Position := n;
        Application.ProcessMessages;
        xReg.Next;

      end;
      if DM.db.InTransaction then DM.db.Commit;

    except on E:Exception do
      begin
        ShowMessage( 'Deu pobrema!!!' + #13 +
                     E.Message);
        DM.db.Rollback;
      end;

    end;

  finally
    xGrade.Free;
    xReg.Free;
    xAlunos.Free;
    xInsAlunos.Free;
    xMat.Free;
    xInsMat.Free;
  end;

end;



procedure TfrmImport.Button7Click(Sender: TObject);
var
  xMat, xIns, xGrade, xHist, xInsHist: TUMZQuery;
  n, xCodAluno, xSerie : Longint;
begin

  DM.CreateQuery(xMat);
  DM.CreateQuery(xGrade);
  DM.CreateQuery(xIns);
  DM.CreateQuery(xHist);
  DM.CreateQuery(xInsHist);

  n := 1;
  try
    try

{      xGrade.SQL.Add( 'SELECT GradeCurricular.Disciplina, GradeCurricular.Serie,');
      xGrade.SQL.Add( 'GradeCurricular.AnoSemestre, GradeCurricular.Curso');
      xGrade.SQL.Add( 'FROM GradeCurricular INNER JOIN');
      xGrade.SQL.Add( '(Turmas INNER JOIN Cursos ON Turmas.Curso = Cursos.Codigo) ON');
      xGrade.SQL.Add( '(GradeCurricular.Curso = Cursos.Codigo) AND');
      xGrade.SQL.Add( '(GradeCurricular.AnoSemestre = Cursos.AnoSemestre) AND');
      xGrade.SQL.Add( '(GradeCurricular.Turno = Turmas.Turno)');

      xGrade.SQL.Add( 'where' );
      xGrade.SQL.Add( 'Turmas.AnoSemestre = :AnoSemestre and' );
      xGrade.SQL.Add( 'Turmas.Curso = :Curso and' );
      xGrade.SQL.Add( 'Turmas.Codigo = :Turma and' );
      xGrade.SQL.Add( 'Cursos.GradePadrao = True' );}

      xHist.SQL.Add( 'select CodigoAluno from HistoricosNotas where' );
      xHist.SQL.Add( 'CodigoAluno = :CodigoAluno' );

      xIns.SQL.Add( 'insert into HistoricosNotas (CodigoAluno, Curso, Turno, Grau, Serie,' );
      xIns.SQL.Add( 'Disciplina, AnoSemestreGrade)');
      xIns.SQL.Add( 'SELECT :CodigoAluno, GradeCurricular.Curso, GradeCurricular.Turno,' );
      xIns.SQL.Add( '2, GradeCurricular.Serie, GradeCurricular.Disciplina,');
      xIns.SQL.Add( 'GradeCurricular.AnoSemestre');
      xIns.SQL.Add( 'FROM GradeCurricular INNER JOIN');
      xIns.SQL.Add( '(Turmas INNER JOIN Cursos ON Turmas.Curso = Cursos.Codigo) ON');
      xIns.SQL.Add( '(GradeCurricular.Curso = Cursos.Codigo) AND');
      xIns.SQL.Add( '(GradeCurricular.AnoSemestre = Cursos.AnoSemestre) AND');
      xIns.SQL.Add( '(GradeCurricular.Turno = Turmas.Turno)');

      xInsHist.SQL.Add( 'insert into Historicos (CodigoAluno, Curso, Serie)' );
      xInsHist.SQL.Add( 'values' );
      xInsHist.SQL.Add( '(:CodigoAluno, :Curso, :Serie)' );

      xIns.SQL.Add( 'where' );
      xIns.SQL.Add( 'Turmas.AnoSemestre = :AnoSemestre and' );
      xIns.SQL.Add( 'Turmas.Curso = :Curso and' );
      xIns.SQL.Add( 'Turmas.Codigo = :Turma and' );
      xIns.SQL.Add( 'Cursos.GradePadrao = True' );

      xMat.SQL.Add( 'select AnoSemestre, CodigoAluno, Turma, Curso from Matriculas where' );
      xMat.SQL.Add( 'Curso = :Curso and AnoSemestre >= 19971 and AnoSemestre <= 19991' );
      xMat.SQL.Add( 'order by AnoSemestre, CodigoAluno, Turma' );
      xMat.ParamByName('Curso').AsString := 'REG02';
      xMat.Open;
      Bar8.Max := xMat.RecordCount;

      while not xMat.Eof do
      begin
        DM.db.StartTransaction;

        xHist.Close;
        xHist.ParamByName('CodigoAluno').AsInteger := xMat.FieldByName('CodigoAluno').ASInteger;
        if not xHist.Prepared then xHist.Prepare;
        xHist.Open;

        if xHist.IsEmpty then
        begin
          xIns.ParamByName('CodigoAluno').AsInteger := xMat.FieldByName('CodigoAluno').ASInteger;
          xIns.ParamBYName('Turma').AsString := xMat.FieldByName('Turma').AsString;
          xIns.ParamBYName('AnoSemestre').ASInteger := xMat.FieldByName('AnoSemestre').AsInteger;
          xIns.ParamByName('Curso').AsString := xMat.FieldByName('Curso').AsString;
          xIns.ExecSQL;

          for xSerie := 1 to 3 do
          begin
            xInsHist.Close;
            xInsHist.ParamByName('CodigoAluno').AsInteger := xMat.FieldByName('CodigoAluno').ASInteger;
            xInsHist.ParamByName('Curso').AsString := xMat.FieldByName('Curso').AsString;
            xInsHist.ParamByName('Serie').AsInteger := xSerie;
            xInsHist.ExecSQL;
          end;
        end;

        xMat.Next;
        Label3.Caption := xMat.FieldByName('CodigoAluno').AsString + ' - ' +
                          xMat.FieldByName('Turma').AsString;        
        Inc(n);
        Bar8.Position := n;
        Application.ProcessMessages;
        DM.db.Commit;

      end;


      except on E:Exception do
        begin
          ShowMessage( 'Deu pobrema!!!' + #13 + E.Message);
          DM.db.Rollback;

        end;
      end;
    finally
      xMat.Free;
      xGrade.Free;
      xIns.Free;
      xHist.Free;
      xInsHist.Free;
    end;
end;

procedure TfrmImport.Button8Click(Sender: TObject);
var
  xUpd, xMat, xUpdHist, xFicha: TUMZQuery;
  n, xCodAluno, xSerie : Longint;
begin

  DM.CreateQuery(xMat);
  DM.CreateQuery(xUpd);
  DM.CreateQuery(xUpdHist);
  DM.CreateQuery(xFicha);

  n := 1;
  try
    try
      xUpd.SQL.Add( 'update HistoricosNotas set MediaFinal = :MediaFinal,' );
      xUpd.SQL.Add( 'Frequencia = :Frequencia, Situacao = :Situacao,' );
      xUpd.SQL.Add( 'AnoSemestreConclusao = :Conclusao, AnoSemestreMatricula = :Matricula' );
      xUpd.SQL.add( 'where CodigoAluno = :CodigoAluno and' );
      xUpd.SQL.Add( 'Curso = :Curso and' );
      xUpd.SQL.Add( 'Serie = :Serie and Disciplina = :Disciplina' );

      xUpdHist.SQL.Add( 'update Historicos set Situacao = :Situacao' );
      xUpdHist.SQL.Add( 'where CodigoAluno = :CodigoAluno and Curso = :Curso and ' );
      xUpdHist.SQL.Add( 'Serie = :Serie' );

      xFicha.SQL.Add( 'select Disciplina, MediaFinal, Frequencia, Situacao, Serie from FichaIndividual' );
      xFicha.SQL.Add( 'where CodigoAluno = :CodigoAluno and ' );
      xFicha.SQL.Add( 'AnoSemestre = :AnoSemestre and' );
      xFicha.SQL.Add( 'Turma = :Turma' );
      xFicha.SQL.Add( 'order by CodigoGrade' );

      xMat.SQL.Add( 'select AnoSemestre, CodigoAluno, Turma, Curso, Situacao' );
      xMat.SQL.Add( 'from Matriculas where' );
      xMat.SQL.Add( 'Curso = :Curso and AnoSemestre >= 19971 and AnoSemestre <= 19991' );
      xMat.SQL.Add( 'order by AnoSemestre, CodigoAluno, Turma' );
      xMat.ParamByName('Curso').AsString := 'REG02';
      xMat.Open;
      Bar9.Max := xMat.RecordCount;

      DM.db.StartTransaction;
      while not xMat.Eof do
      begin

        xFicha.Close;
        xFicha.ParamByName('CodigoAluno').AsInteger := xMat.FieldByName('CodigoAluno').ASInteger;
        xFicha.ParamByName('Turma').AsString := xMat.FieldByName('Turma').AsString;
        xFicha.ParamByname('AnoSemestre').AsInteger := xMat.FieldByName('AnoSemestre').AsInteger;
        if not xFicha.Prepared then xFicha.prepare;
        xFicha.Open;

        xUpdHist.ParamByName('CodigoAluno').AsInteger := xMat.FieldByName('CodigoAluno').ASInteger;
        xUpdHist.ParamByName('Serie').ASInteger := xFicha.FieldByName('Serie').asInteger;
        xUpdHist.ParamByName('Curso').asString := xMat.FieldByName('Curso').AsString;
        xUpdHist.ParamByName('Situacao').ASInteger := xMat.FieldByName('Situacao').AsInteger;
        xUpdHist.ExecSQL;

        while not xFicha.EOF do
        begin

          xUpd.Close;
          xUpd.ParamByName('CodigoAluno').AsInteger := xMat.FieldByName('CodigoAluno').ASInteger;
          xUpd.ParamByName('Serie').Asinteger := xFicha.FieldByName('Serie').AsInteger;
          xUpd.ParamByName('Curso').AsString := xMat.FieldByName('Curso').AsString;
          xUpd.ParamByName('Disciplina').AsInteger := xFicha.FieldByName('Disciplina').ASinteger;
          xUpd.ParamByName('MediaFinal').asFloat := xFicha.FieldByName('MediaFinal').AsFloat;
          xUpd.ParamByName('Frequencia').ASinteger := xFicha.FieldByName('Frequencia').AsInteger;
          xUpd.ParamByName('Situacao').AsInteger := xFicha.FieldByName('Situacao').AsInteger;
          xUpd.ParamByName('Matricula').Asinteger := xMat.FieldByName('AnoSemestre').AsInteger;

          if xFicha.FieldByName('Situacao').AsInteger = 0 then
            xUpd.ParamByName('Conclusao').ASINteger := xMat.FieldByName('AnoSemestre').AsInteger
          else
            xUpd.ParamByName('Conclusao').ASINteger := 0;

          xUpd.ExecSQL;

          xFicha.Next;

        end;

        xMat.Next;
        Inc(n);
        Bar9.Position := n;
        Application.ProcessMessages;
      end;

      DM.db.Commit;


      except on E:Exception do
        begin
          ShowMessage( 'Deu pobrema!!!' + #13 + E.Message);
          DM.db.Rollback;

        end;
      end;
    finally
      xUpd.Free;
      xMat.Free;
      xFicha.Free;
      xUpdHist.Free;
    end;
end;


procedure TfrmImport.Button9Click(Sender: TObject);
var
  xRead, xDel, xAlunos, xIns: TUMZQuery;
begin
  // a pedido da Elke - 27/07/2000
  DM.CreateQuery(xRead);
  DM.CreateQuery(xIns);
  DM.CreateQuery(xAlunos);
  DM.CreateQuery(xDel);
  try

    xAlunos.SQL.Add( 'select * from Documentacao where AnoSemestre = :AnoSemestre' );
    xAlunos.ParamByName('AnoSemestre').AsInteger := 20001;

    xRead.SQL.add( 'select * from Documentacao where AnoSemestre = :AnoSemestre and' );
    xRead.SQL.Add( 'CodigoAluno = :CodigoAluno' );

    xDel.SQL.add( 'delete from Documentacao where AnoSemestre = :AnoSemestre and' );
    xDel.SQL.Add( 'CodigoAluno = :CodigoAluno' );

    xIns.SQL.Add( 'insert into Documentacao (AnoSemestre, CodigoAluno, CN, CI, AtFreq,');
    xIns.SQL.add( 'CompRes, CPF, CompSM, Hist1g, Hist2g, FotoDip, Foto3x4, DispEF,' );
    xIns.SQL.Add( 'ContMat, ReqMat)' );
    xIns.SQL.Add( 'SELECT :NovoAno,' );
    xIns.SQL.Add( 'Documentacao.CodigoAluno, Documentacao.CN,' );
    xIns.SQL.Add( 'Documentacao.CI, Documentacao.AtFreq,' );
    xIns.SQL.Add( 'Documentacao.CompRes, Documentacao.CPF,' );
    xIns.SQL.Add( 'Documentacao.CompSM, Documentacao.Hist1g,' );
    xIns.SQL.Add( 'Documentacao.Hist2g, Documentacao.FotoDip,' );
    xIns.SQL.Add( 'Documentacao.Foto3x4, Documentacao.DispEF,' );
    xIns.SQL.Add( 'Documentacao.ContMat, Documentacao.ReqMat' );
    xIns.SQL.Add( 'FROM Documentacao' );
    xIns.SQL.Add( 'where AnoSemestre = :AnoSemestre and CodigoAluno = :CodigoAluno' );

    xAlunos.Open;

    DM.db.StartTransaction;

    try
      while not xAlunos.Eof do
      begin

        xRead.Close;
        xRead.ParamByName('CodigoAluno').Asinteger := xAlunos.FieldByName('CodigoAluno').AsInteger;
        xRead.ParamByName('AnoSemestre').AsInteger := 20002;
        if not xRead.Prepared then xRead.Prepare;
        xRead.Open;

        if not xRead.IsEmpty then
        begin
          xDel.ParamByName('CodigoAluno').ASinteger := xAlunos.FieldByName('CodigoAluno').AsInteger;
          xDel.ParamByname('AnoSemestre').Asinteger := 20002;
          xDel.ExecSQL;
        end;

        xIns.PAramByName('CodigoAluno').Asinteger := xAlunos.FieldByName('CodigoAluno').AsInteger;
        xIns.ParamByName('NovoAno').AsInteger := 20002;
        xIns.ParamByName('AnoSemestre').AsInteger := 20001;
        xIns.ExecSQL;

        xAlunos.Next;
      end;

      DM.db.Commit;
    except
      DM.db.Rollback;
      ShowMessage('Deu pau!!!');
      Exit;
    end;

    ShowMessage('OK');

  finally
    xRead.Free;
    xIns.Free;
    xAlunos.Free;
    xDel.Free;
  end;

end;

procedure TfrmImport.Button10Click(Sender: TObject);
var
  tbl: TUMZQuery;
  n: Integer;
begin

  DM.CreateQuery(tbl);

  try

    tbl.Close;
    tbl.SQL.Clear;
    tbl.SQL.Add( 'select Codigoaluno, Turma, AnoSemestre from FichaIndividual' );
    tbl.SQL.Add( 'where Curso = :Curso and AnoSemestre = :AnoSemestre');
    if txtTurma.Text <> '' then
    begin
      tbl.SQL.Add( 'and Turma = :Turma' );
      tbl.ParamByName('Turma').asString := txtturma.Text;
    end;
    tbl.SQL.Add( 'group by CodigoAluno, Turma, AnoSemestre' );
    tbl.ParamByName('Curso').AsString := txtCurso.Text;
    tbl.ParamByName('AnoSemestre').Asinteger := StrToInt(txtAnoSemestre.Text);
    tbl.Open;

    Bar10.Max := tbl.RecordCount;

    Application.ProcessMessages;

    n := 1;
    while not tbl.Eof do
    begin

        DM.SetaSituacaoFinal(  tbl.FieldByName('CodigoAluno').AsInteger,
                               tbl.FieldByName('Turma').asString,
                               tbl.FieldByName('AnoSemestre').AsInteger );

        tbl.Next;
        Inc(n);
        Bar10.Position := n;
        Application.ProcessMessages;
    end;
  finally
    tbl.Free;
  end;

end;




procedure TfrmImport.Button11Click(Sender: TObject);
var
  xQry, xUpd: TUMZQuery;
begin

  DM.db.StartTransaction;

  DM.CreateQuery(xQry);
  DM.CreateQuery(xUpd);

  try
    xQry.SQL.Add( 'select NossoNumero from Mensalidades where' );
    xQry.SQL.add( 'Depto = :Depto and DataEmissao >= :Data and ValorPago = 0');
    xQry.SQL.add( 'order by NossoNumero' );
    xQry.ParamByName('Data').AsDateTime := EncodeDate(2001,6,4);
    xQry.ParamByName('Depto').AsInteger := 4;
    xQry.Open;

    xUpd.SQL.Add( 'update Mensalidades set NossoNumero = :NovoNumero where' );
    xUpd.SQL.Add( 'NossoNumero = :NossoNumero' );

    while not xQry.Eof do
    begin
      xUpd.ParamByName('NossoNumero').AsString := xQry.FieldByName('NossoNumero').AsString;
      xUpd.ParamByName('NovoNumero').AsString := DM.NovoNumero(4);
      xUpd.ExecSQL;
      xQry.Next;
    end;

    DM.db.Commit;

    ShowMessage( 'Geração efetuada com sucesso');



  except on E:Exception do
    begin
      DM.db.Rollback;
      Mensagem('Erro: ' + E.Message, 'Erro', MB_OK );
    end;

  end;

  xUpd.Free;
  xQry.Free;

end;

procedure TfrmImport.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

end;

end.

