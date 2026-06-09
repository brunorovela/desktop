unit uImpMatriculas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Ucrpe32, Spin, ComCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmImpMatriculas = class(TForm)
    btnImprimir: TButton;
    btnFechar: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    radDiplomasTurma: TRadioButton;
    chkVerso: TCheckBox;
    radDesistencia: TRadioButton;
    radTransferencia: TRadioButton;
    radAtestado: TRadioButton;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    txtTurma: TEdit;
    radDiplomasAluno: TRadioButton;
    chkDataAtual: TCheckBox;
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure chkVersoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpMatriculas: TfrmImpMatriculas;

implementation

uses Main, uMatriculas, uDM;

{$R *.DFM}


procedure TfrmImpMatriculas.btnFecharClick(Sender: TObject);
begin
  Close;
end;




procedure TfrmImpMatriculas.btnImprimirClick(Sender: TObject);
var
  strAux : String;
  SFormula : String;
  NomeRel : String;
  Formula : ARRAY of String;
  Valores : ARRAY of String;

begin

  SFormula := '';

  if (radDiplomasTurma.Checked) or (radDiplomasAluno.Checked) then
  begin
    if not chkVerso.Checked then
        NomeRel := 'repDiploma.rpt'
    else
        NomeRel := 'repVersoDiploma.rpt';
  end;

  if radDesistencia.Checked then
  Begin

     NomeRel := 'repDesistencia.rpt';
     { Cabeçalho do Relatório }
     SetLength(Formula, 4);
     SetLength(Valores, 4);

     Formula[0] := 'NomeFantasia';  Valores[0] := Dm.variavel_parametro('cliente_nome_fantasia');
     Formula[1] := 'RazaoSocial';   Valores[1] := Dm.variavel_parametro('cliente_razao_social');
     Formula[2] := 'Endereco';      Valores[2] := Dm.variavel_parametro('cliente_endereco');
     Formula[3] := 'Endereco2';     Valores[3] := Dm.variavel_parametro('cliente_telefone') + ' - ' + Dm.variavel_parametro('cliente_cidade') + ' - ' + Dm.variavel_parametro('cliente_estado');

  End;

  if radTransferencia.Checked then NomeRel := 'repTransferencia.rpt';
  if radAtestado.Checked then
  Begin
     NomeRel := 'repAtestadoMatricula.rpt';
     { Cabeçalho do Relatório }
     SetLength(Formula, 4);
     SetLength(Valores, 4);

     Formula[0] := 'NomeFantasia';  Valores[0] := Dm.variavel_parametro('cliente_nome_fantasia');
     Formula[1] := 'RazaoSocial';   Valores[1] := Dm.variavel_parametro('cliente_razao_social');
     Formula[2] := 'Endereco';      Valores[2] := Dm.variavel_parametro('cliente_endereco');
     Formula[3] := 'Endereco2';     Valores[3] := Dm.variavel_parametro('cliente_telefone') + ' - ' + Dm.variavel_parametro('cliente_cidade') + ' - ' + Dm.variavel_parametro('cliente_estado');
  End;
    
  if radDiplomasTurma.Checked then
  begin
     SFormula := SFormula + '{Matriculas.Turma} = "' + txtTurma.Text + '" and ';
     SFormula := SFormula + '{Matriculas.AnoSemestre} = ' + txtAnoSemestre.Text + ' and ';
     SFormula := SFormula + '{Matriculas.Diploma} = True';
  end;

  if (radDiplomasAluno.Checked) or (radAtestado.Checked) then
  begin
     SFormula := SFormula + '{Matriculas.CodigoAluno} = ' + frmMatriculas.tblMatriculasCodigoAluno.AsString + ' and';
     SFormula := SFormula + '{Matriculas.Turma} = "' + frmMatriculas.tblMatriculasTurma.AsString + '" and';
     SFormula := SFormula + '{Matriculas.AnoSemestre} = ' + frmMatriculas.tblMatriculasAnoSemestre.AsString;
  end;

  if (chkDataAtual.Checked) and (not chkVerso.Checked) then
  begin
     SetLength(Formula, Length(Formula) + 1);
     SetLength(Valores, Length(Formula) + 1);
     Formula[Length(Formula)-1] := 'DataHoje';  Valores[Length(Formula)-1] := 'Blumenau, ' + FormatDateTime( 'dd', DataHoje ) + ' de ' + FormatDateTime( 'mmmm', DataHoje ) + ' de ' + FormatDateTime( 'yyyy', DataHoje ) + '.'
  end;

  { Imprimir o Relatório }

  PrincipalForm.PrintRpt(NomeRel,'', SFormula, '', '','',Formula, Valores, [],True);

end;

procedure TfrmImpMatriculas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmImpMatriculas.UpDown1Click(Sender: TObject;
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

end;

procedure TfrmImpMatriculas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  txtAnoSemestre.text := IntToStr(ano_semestre);

end;

procedure TfrmImpMatriculas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;




procedure TfrmImpMatriculas.chkVersoClick(Sender: TObject);
begin
  if not chkVerso.Checked then
    chkDataAtual.Checked := False;
end;

end.

