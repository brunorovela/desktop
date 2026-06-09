unit uImportarDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Db, IBDatabase,
  IBCustomDataSet, IBQuery, ZConnection, Mask,
  ComCtrls;

type
  TfrmImportarDiario = class(TForm)
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnAbrirDisquete: TSpeedButton;
    Label1: TLabel;
    eProfessor: TEdit;
    GroupBox2: TGroupBox;
    btnProcurarProfessor: TSpeedButton;
    GroupBox3: TGroupBox;
    grTurmasDiario: TDBGrid;
    DBGrid2: TDBGrid;
    btnImportar: TSpeedButton;
    dsIBTurmas: TDataSource;
    tblTurmas: TUMZQuery;
    tblSISTEMA: TUMZQuery;
    tblProfessor: TUMZQuery;
    OpenDialog1: TOpenDialog;
    qProfessores: TUMZQuery;
    Label2: TLabel;
    eAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    dsTurmas: TDataSource;
    tblTurmasTURMA: TStringField;
    tblTurmasANOSEMESTRE: TSmallintField;
    tblTurmasDISCIPLINA: TIntegerField;
    tblTurmasBIMESTRE: TSmallintField;
    tblTurmasPROFESSOR: TIntegerField;
    tblTurmasCurso: TStringField;
    tblTurmasDATAENTREGA: TDateTimeField;
    tblTurmasCodigo: TSmallintField;
    tblTurmasOrdem: TSmallintField;
    tblTurmasCurso_1: TStringField;
    tblTurmasSigla: TStringField;
    tblTurmasDescricao: TStringField;
    lbMsg: TLabel;
    SpeedButton1: TSpeedButton;
    tblFicha: TUMZQuery;
    btnExcluirDiario: TSpeedButton;
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcurarProfessorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExcluirDiarioClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarDiario: TfrmImportarDiario;
  Professor : Integer;

implementation

uses uDM, Main;

{$R *.DFM}

procedure TfrmImportarDiario.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

procedure TfrmImportarDiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmImportarDiario.btnProcurarProfessorClick(Sender: TObject);
begin
  with qProfessores do
  Begin
     Close;
     SQL.Clear;
     SQL.Add( 'select DISTINCT Professor, Nome from Diario_Extrair_Turmas where AnoSemestre = :AnoSemestre' );
     SQL.Add( 'order by Nome' );
     ParamByName('AnoSemestre').AsInteger := StrToInt(eAnoSemestre.Text);
     Prepare;
     Open;
  End;

{//  if wwLookupProfessor.Execute then
  begin
     eProfessor.Text := qProfessores.FieldByName('Nome').AsString;
     Professor := qProfessores.FieldByName('Professor').AsInteger;

     tblTurmas.Close;
     tblTurmas.ParamByName('AnoSemestre').Value := StrToInt(eAnoSemestre.TexT);
     tblturmas.ParamByName('Professor').Value := Professor;
     tblTurmas.Open;

     IBtblTurmas.Close;

     btnImportar.Enabled := False;
     btnExcluirDiario.Enabled := True;
  end;
}//
end;

procedure TfrmImportarDiario.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   eAnoSemestre.Text := '20021';
   eProfessor.Text := '';
   tblTurmas.Close;
   btnImportar.Enabled := False;
end;

procedure TfrmImportarDiario.SpeedButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmImportarDiario.btnExcluirDiarioClick(Sender: TObject);
begin
   if MessageDlg('Tem certeza que deseja excluir as informações do diário para' + #13 +
                 'a Turma selecionada desse professor?', mtConfirmation, [mbYes, mbNo],0)
      <> mrYes Then Abort;

   { Limpar Tabela de Diario_Aulas }

   tblSistema.SQL.Text := 'Delete From Diario_Aulas Where';
   tblSistema.SQL.Add('Turma = :TURMA AND AnoSemestre = :ANOSEMESTRE');
   tblSistema.SQL.Add('AND Disciplina = :DISCIPLINA AND Bimestre = :BIMESTRE');
   tblSistema.ParamByName('TURMA').Value := tblTurmasTURMA.Value;
   tblSistema.ParamByName('ANOSEMESTRE').Value := tblTurmasANOSEMESTRE.Value;
   tblSistema.ParamByName('DISCIPLINA').Value := tblTurmasDISCIPLINA.Value;
   tblSISTEMA.ParamByNAme('BIMESTRE').Value := tblTurmasBIMESTRE.Value;
   tblSISTEMA.ExecSQL;

   { Limpar Tabela de Diario_Provas }

   tblSistema.SQL.Text := 'Delete From Diario_Provas Where';
   tblSistema.SQL.Add('Turma = :TURMA AND AnoSemestre = :ANOSEMESTRE');
   tblSistema.SQL.Add('AND Disciplina = :DISCIPLINA AND Bimestre = :BIMESTRE');
   tblSistema.ParamByName('TURMA').Value := tblTurmasTURMA.Value;
   tblSistema.ParamByName('ANOSEMESTRE').Value := tblTurmasANOSEMESTRE.Value;
   tblSistema.ParamByName('DISCIPLINA').Value := tblTurmasDISCIPLINA.Value;
   tblSISTEMA.ParamByNAme('BIMESTRE').Value := tblTurmasBIMESTRE.Value;
   tblSISTEMA.ExecSQL;

   { Limpar Tabela de Diario_Provas }

   tblSistema.SQL.Text := 'Delete From Diario_Matriculas Where';
   tblSistema.SQL.Add('Turma = :TURMA AND AnoSemestre = :ANOSEMESTRE');
   tblSistema.SQL.Add('AND Disciplina = :DISCIPLINA AND Bimestre = :BIMESTRE');
   tblSistema.ParamByName('TURMA').Value := tblTurmasTURMA.Value;
   tblSistema.ParamByName('ANOSEMESTRE').Value := tblTurmasANOSEMESTRE.Value;
   tblSistema.ParamByName('DISCIPLINA').Value := tblTurmasDISCIPLINA.Value;
   tblSISTEMA.ParamByNAme('BIMESTRE').Value := tblTurmasBIMESTRE.Value;
   tblSISTEMA.ExecSQL;

   { Limpar Tabela de Diario_Turmas }

   tblSISTEMA.Close;
   tblSistema.SQL.Text := 'Delete From Diario_Turmas Where';
   tblSistema.SQL.Add('Turma = :TURMA AND AnoSemestre = :ANOSEMESTRE');
   tblSistema.SQL.Add('AND Disciplina = :DISCIPLINA AND Bimestre = :BIMESTRE');
   tblSistema.ParamByName('TURMA').Value := tblTurmasTURMA.Value;
   tblSistema.ParamByName('ANOSEMESTRE').Value := tblTurmasANOSEMESTRE.Value;
   tblSistema.ParamByName('DISCIPLINA').Value := tblTurmasDISCIPLINA.Value;
   tblSISTEMA.ParamByNAme('BIMESTRE').Value := tblTurmasBIMESTRE.Value;
   tblSISTEMA.ExecSQL;

   tblTurmas.Close;
   tblTurmas.Open;
end;

procedure TfrmImportarDiario.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
begin

  intAno := StrToInt(Copy(eAnoSemestre.Text,1,4));
  intSemestre := StrToInt(Copy(eAnoSemestre.Text,5,1));

  if Button = btNext then
  begin
    Inc( intSemestre );
    if intSemestre = 3 then
    begin
      Inc( intAno );
      intSemestre := 1;
    end;
  end
  else
  begin
    Dec( intSemestre );
    if intSemestre = 0 then
    begin
      Dec( intAno );
      intSemestre := 2;
    end;
  end;

  eAnoSemestre.Text := IntToStr( intAno ) + IntToStr( intSemestre );
  tblTurmas.Close;
  tblTurmas.ParamByName('AnoSemestre').Value := StrToInt(eAnoSemestre.TexT);
  tblturmas.ParamByName('Professor').Value := Professor;
  tblTurmas.Open; 
end;

end.

