unit uDocumentosPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, uDM, Qrctrls, Db, ZConnection, uFuncao, StdCtrls, Mask,
  DBCtrls;

type
  TfrmDocumentosPendentes = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    tblAluno: TUMZQuery;
    tblCursos: TUMZQuery;
    dsAlunos: TDataSource;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    tblMatriculas: TUMZQuery;
    tblDocumentos: TUMZQuery;
    tblDocumentosDocumento: TStringField;
    tblDocumentosCod_Documento: TIntegerField;
    tblDocumentosCurso: TStringField;
    tblAlunoCodigoAluno: TIntegerField;
    tblAlunoCurso: TStringField;
    tblAlunoAnoSemestre: TSmallintField;
    tblAlunoSituacao: TSmallintField;
    tblAlunoTurma: TStringField;
    tblAlunoAluno: TStringField;
    tblCursosAnoSemestre: TSmallintField;
    tblCursosCodigo: TStringField;
    tblCursosApelido: TStringField;
    tblCursosDescricao: TStringField;
    tblCursosGrau: TSmallintField;
    tblCursosParecerAutorizacao: TStringField;
    tblCursosDataCEE: TDateTimeField;
    tblCursosCargaHorariaTotal: TFloatField;
    tblCursosDiasLetivos: TFloatField;
    tblCursosSemanasLetivas: TFloatField;
    tblCursosDiasSemanasLetivas: TStringField;
    tblCursosHorarioLetivo: TStringField;
    tblCursosDuracaoHoraAula: TFloatField;
    tblCursosDiasLetivosSemanais: TFloatField;
    tblCursosNumerodeSeries: TSmallintField;
    tblCursosObservacoes: TMemoField;
    tblCursosContrato: TStringField;
    tblCursosDepto: TSmallintField;
    tblCursosQtadeBimestres: TSmallintField;
    tblCursosMedia_Direto: TFloatField;
    tblCursosMedia_Exame: TFloatField;
    tblCursosGradePadrao: TBooleanField;
    tblCursosSemanasLetivasV: TFloatField;
    tblCursosSemanasLetivasN: TFloatField;
    tblCursosFrequenciaGlobal: TBooleanField;
    tblCursosPesoProvaInstitucional: TFloatField;
    tblObsBoletim: TUMZQuery;
    tblCursosParecerReconhecimento: TStringField;
    tblAlunoSexo: TStringField;
    tblAlunoSerie: TSmallintField;
    DetailBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    ChildBand1: TQRChildBand;
    lbDoc: TQRLabel;
    qrDoc: TQRMemo;
    qrOBS: TQRMemo;
    lbOBS: TQRLabel;
    procedure Bim1Print(sender: TObject; var Value: String);
    procedure SituacaoPrint(sender: TObject; var Value: String);
    { Função: PreparaImpressão
      Recebe : AnoSemestre, Curso, Turma, CodigoAluno;
      Procedimento : Prepara Tabela para impressão do Boletim
      Retorna : True para prosseguir impressão
                False quando não estiver preparado
    }
    Function PreparaImpressao (Curso : String;
                               Turma : String;
                               AnoSemestre : Integer;
                               CodigoAluno : Integer;
                               Situacao : integer) : Boolean;
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);

  private
    { Private declarations }
  public
    { Public declarations }
    PodeImprimir : Boolean;
    ObsTurma : String;
  end;

var
  frmDocumentosPendentes: TfrmDocumentosPendentes;
  Cont : smallint;

implementation

{$R *.DFM}

Function TfrmDocumentosPendentes.PreparaImpressao (Curso : String; Turma : String; AnoSemestre : Integer; CodigoAluno : Integer; Situacao : integer) : Boolean;
Var
   filtro, op : string;
Begin
   //
   With tblAluno do Begin
       filtro := '';
       op := ' WHERE ';
       Close;
       Sql.Clear;
       Sql.Add('Select T.Serie, M.*, A.Nome As Aluno, A.Sexo From Matriculas M, Alunos A, Turmas T');

       filtro := filtro + op + 'M.CodigoAluno = A.Codigo AND M.AnoSemestre = :AnoSemestre';
       op := ' AND ';
       filtro := filtro + op + 'T.Codigo = M.Turma AND T.AnoSemestre = M.AnoSemestre';

       if Curso <> '' Then
          filtro := filtro + op + 'M.Curso = :Curso';
       if Turma <> '' Then
          filtro := filtro + op + 'M.Turma = :Turma';
       if CodigoAluno <> 0 Then
          filtro := filtro + op + 'M.CodigoAluno = :CodigoAluno';

       { Filtro da situação - Desistente, Transferido, .... }

       filtro := filtro + op + 'M.Situacao not IN (3,5,6,7) ';

       Sql.Add(filtro);
       Sql.Add('Order By A.Nome, A.Codigo ');

       ParamByNAme('AnoSemestre').Value := AnoSemestre;
       if Curso <> '' Then
          ParamByName('Curso').AsString := Curso;
       if Turma <> '' Then
          ParamByName('Turma').AsString := Turma;
       if CodigoAluno <> 0 Then
          ParamByName('CodigoAluno').AsInteger := CodigoAluno;

       Open;

       if RecordCount > 0 Then Begin
          tblCursos.Open;
          tblMatriculas.Close;
          tblMatriculas.Open;
          tblDocumentos.Open;
          Dm.tblParametros.Open;
          result := true;
       End
       Else Begin
          result := False;
          Close;
       End
   End;
End;

procedure TfrmDocumentosPendentes.Bim1Print(sender: TObject;
  var Value: String);
begin
   Value := formatanota(StrToFloat(Value));
end;

procedure TfrmDocumentosPendentes.SituacaoPrint(sender: TObject;
  var Value: String);
begin
   Value := fnsituacao(StrToInt(Value));
end;

procedure TfrmDocumentosPendentes.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  ImpDoc : Boolean;
  ImpObs : Boolean;
begin
   tblObsBoletim.Close;
   tblObsBoletim.Open;
   qrOBS.Lines.Text := ObsTurma;
   if not tblObsBoletim.Eof Then
      qrOBS.Lines.Text := tblObsBoletim.FieldByName('OBS').AsString; 

   ImpDoc := False;

   if tblDocumentos.EOF Then
      ImpDoc := False
   Else
      Begin
          qrDoc.Lines.Clear;
          tblDocumentos.First;
          while not tblDocumentos.Eof do
          Begin
               if (tblDocumentos.FieldByName('Cod_Documento').AsInteger <> 8) // Hist. 2ºGrau
               or  (tblAluno.FieldByName('Serie').AsInteger <> 1) Then
               Begin
                  if (tblAluno.FieldByName('Sexo').AsString  <> 'F') // Sexo Feminino e Certificado Militar
                  or (Pos('Militar', tblDocumentos.FieldByName('Documento').AsString) = 0) Then
                  Begin
                     qrDoc.Lines.Add(tblDocumentos.FieldByName('Documento').Value );
                     ImpDoc := True;
                  End;
               End;
               tblDocumentos.Next;
          End;
      End;

   if Trim(qrOBS.Lines.Text) <> '' Then
      ImpObs := True
   Else
      ImpObs := False;

   if ImpOBS or ImpDoc Then // tem Observação ou Documetno
   Begin
      if not ImpOBS Then
         Begin
             lbObs.Caption := '';
             qrObs.Lines.Text := '';
             lbOBS.Width := 0;
         End
      Else
         Begin
            lbObs.Caption := 'OBSERVAÇÃO:';
            lbOBS.Width := 313;
         End;
       if not ImpDoc Then
         Begin
             lbDoc.Caption := '';
             qrDoc.Lines.Text := '';
         End
       Else
          Begin
             lbDoc.Caption := 'FAVOR PROVIDENCIAR OS SEGUINTES DOCUMENTOS:';
          End;
       PrintBand := True;
   End
   Else
      PrintBand := False;

end;

procedure TfrmDocumentosPendentes.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PodeImprimir := True;

   tblDocumentos.Close;
   tblDocumentos.ParamByName('CodigoAluno').AsInteger := tblAluno.FieldByName('CodigoAluno').AsInteger;
   tblDocumentos.ParamByName('Curso').AsString := tblAluno.FieldByName('Curso').AsString;
   tblDocumentos.Open;

   { Particular para o Universitário  - A pedido da Elke }
   if tblDocumentos.Locate('Cod_Documento',13,[]) Then // Requerimento de Matrícula
      PodeImprimir := False;
   if tblDocumentos.Locate('Cod_Documento',7,[]) Then  // Historico 2º Grau
      PodeImprimir := False;
   if tblAluno.FieldByName('Serie').Value > 1 Then
      if tblDocumentos.Locate('Cod_Documento',8,[]) Then  // Historico 1º Grau
         PodeImprimir := False;

end;

procedure TfrmDocumentosPendentes.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := PodeImprimir;
  Cont := 0;
end;

procedure TfrmDocumentosPendentes.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := PodeImprimir;

  Cont := Cont + 1;
end;

procedure TfrmDocumentosPendentes.QRDBText3Print(sender: TObject;
  var Value: String);
begin
 if tblCursosParecerAutorizacao.AsString = '' Then
    Value := ''
 Else
    Value := 'AUTORIZADO PELO ' +tblCursosParecerAutorizacao.AsString;

end;

procedure TfrmDocumentosPendentes.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 if tblCursosParecerReconhecimento.AsString = '' Then
    Value := ''
 Else
    Value := 'RECONHECIDO PELO ' +tblCursosParecerReconhecimento.AsString;

end;

end.

