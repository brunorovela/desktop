unit uMatriculas_Alterar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Db, ZConnection, Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, General;

type
  TFrmMatriculasAlterar = class(TForm)
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    EditDataMatricula: TDBEdit;
    Label1: TLabel;
    Bevel9: TBevel;
    Bevel7: TBevel;
    Panel1: TPanel;
    tblMatriculas: TUMZQuery;
    Label2: TLabel;
    DBText1: TDBText;
    dsMatriculas: TDataSource;
    tblMatriculasanosemestre: TSmallintField;
    tblMatriculasturma: TStringField;
    tblMatriculascodigoaluno: TIntegerField;
    tblMatriculascurso: TStringField;
    tblMatriculasdataemissao: TDateTimeField;
    tblMatriculasusuario: TStringField;
    tblMatriculasplanopagamento: TIntegerField;
    tblMatriculassituacao: TSmallintField;
    tblMatriculassituacaoescolar: TSmallintField;
    tblMatriculasimpresso: TStringField;
    tblMatriculasdatasaida: TDateTimeField;
    tblMatriculasdataentrada: TDateTimeField;
    tblMatriculasplanodesconto: TIntegerField;
    tblMatriculasdiploma: TStringField;
    tblMatriculascd_ingresso: TIntegerField;
    tblMatriculascd_instituicao_origem: TIntegerField;
    tblMatriculasturmadependencia: TStringField;
    DBText2: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    DBText3: TDBText;
    BitBtn2: TBitBtn;
    tblMatriculasdescInstituicao: TStringField;
    tblMatriculasdescIngresso: TStringField;
    tblMatriculasnr_aluno: TSmallintField;
    tblMatriculascd_matricula: TStringField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    tblMatriculasNR_DIA_PGTO: TLargeintField;
    tblMatriculasnm_pessoa: TStringField;
    qryNmPessoa: TUMZQuery;
    qryIngressos: TUMZReadOnlyQuery;
    dsIngressos: TDataSource;
    qryIngressoscd_ingresso: TIntegerField;
    qryIngressosds_ingresso: TStringField;
    procedure tblMatriculasAfterOpen(DataSet: TDataSet);
    procedure EditDataMatriculaExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure tblMatriculasCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FFecharModal : Boolean;
  public
    { Public declarations }

    CodigoPessoa : Integer;
    Turma : String;
    AnoSmemestre : Integer;
    Resultado : Boolean;

  end;

var
  FrmMatriculasAlterar: TFrmMatriculasAlterar;

implementation

uses uDM;

{$R *.DFM}

procedure TFrmMatriculasAlterar.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   Dm.tblInstituicoes.Close;
   Dm.tblInstituicoes.Open;

   DM.tblIngressos.Close;
   DM.tblIngressos.Open;

   tblMatriculas.Close;

   tblMatriculas.ParamByName('CodigoAluno').AsInteger := CodigoPessoa;
   tblMatriculas.ParamByName('Turma').AsString 	      := Turma;
   tblMatriculas.ParamByName('AnoSemestre').AsInteger := AnoSmemestre;

   tblMatriculas.Open;

   DBLookupComboBox1.SetFocus;

   tblMatriculas.Edit;

   FFecharModal := True;
end;


procedure TFrmMatriculasAlterar.tblMatriculasAfterOpen(DataSet: TDataSet);
begin
   qryIngressos.Close;
   qryIngressos.ParamByName('cd_ingresso').AsInteger :=
      tblMatriculascd_ingresso.AsInteger;
   qryIngressos.Open;
end;

procedure TFrmMatriculasAlterar.tblMatriculasCalcFields(DataSet: TDataSet);
begin
  qryNmPessoa.Close;
  qryNmPessoa.ParamByName('cd_pessoa').AsInteger := tblMatriculascodigoaluno.AsInteger;
  qryNmPessoa.Open;
  tblMatriculasnm_pessoa.AsString := qryNmPessoa.FieldByName('nm_pessoa').AsString;
end;

procedure TFrmMatriculasAlterar.BitBtn2Click(Sender: TObject);
begin
   FFecharModal := True;
   tblMatriculas.Cancel;
end;

procedure TFrmMatriculasAlterar.BitBtn3Click(Sender: TObject);
var
   DataAtual,dataCampo: TDate;
   sChave: String;
begin
   DataAtual := Now;
   FFecharModal := True;

   if (EditDataMatricula.Text <> '') then
   begin

      dataCampo := StrToDateTime(EditDataMatricula.Text);

      if (DataAtual < dataCampo) then
      begin
         Mensagem('Data de matrícula informada maior que a data de hoje!','Atenção', MB_OK + MB_ICONINFORMATION);
         FFecharModal := False;
         exit;
      end
      else
      begin
         sChave := tblMatriculascodigoaluno.asString + ';' + tblMatriculasturma.asString + ';' + tblMatriculasanosemestre.asString;
         DM.setLog(1018, 'Alterar', sChave, dm.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger), 'Alterado data de matrícula do aluno com o código: ' + tblMatriculascodigoaluno.asString);
         tblMatriculas.Post;

         self.Close;
      end;
   end;
end;

procedure TFrmMatriculasAlterar.EditDataMatriculaExit(Sender: TObject);
var
   dataAux : String;
begin
   if tblMatriculasdataemissao.AsString = '' then
   begin
      dataAux :=  tblMatriculasdataemissao.CurValue ;
      if (dataAux <> '') then
      begin
         Mensagem('Você não pode remover a data de matrícula!','Atenção', MB_OK + MB_ICONINFORMATION);
         tblMatriculasdataemissao.AsString := tblMatriculasdataemissao.CurValue;
         EditDataMatricula.SetFocus;
      end;
      exit;
   end;

   if tblMatriculasdataemissao.AsDateTime >  Now then
   begin
      Mensagem('Data de matrícula informada maior que a data de hoje!','Atenção', MB_OK + MB_ICONINFORMATION);
      tblMatriculasdataemissao.AsString := tblMatriculasdataemissao.CurValue;
      EditDataMatricula.SetFocus;
   end;
end;

procedure TFrmMatriculasAlterar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tblMatriculas.Close;
end;

procedure TFrmMatriculasAlterar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := FFecharModal;
end;

end.

