unit uImpAlunosAfrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, ucrpe32,
  UMDateTimePicker;

type
  TfrmImpAlunosAfrica = class(TForm)
    Panel1: TPanel;
    grpReimp: TRadioGroup;
    btnFechar: TButton;
    btnImprimir: TButton;
    cmb: TComboBox;
    Label1: TLabel;
    lstAnoSemestre: TListBox;
    lstCursos: TListBox;
    lstRequerimento: TListBox;
    lstTurma: TListBox;
    dat: TUMDateTimePicker;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpAlunosAfrica: TfrmImpAlunosAfrica;

implementation

uses uDM, uAlunoAfrica, Main;

{$R *.DFM}



procedure TfrmImpAlunosAfrica.btnImprimirClick(Sender: TObject);
Var NomeRel : string;
    SFormula : String;
begin
  case grpReimp.ItemIndex of

    0 : begin

      if lstCursos.Items[cmb.ItemIndex] = '' then
      begin
        Mensagem( 'Este curso não possui contrato formulado.', Application.Title,
                  MB_OK + MB_ICONSTOP );
        Exit;
      end;

      NomeRel := lstCursos.Items[cmb.ItemIndex];
      SFormula := '';

      SFormula := SFormula + '{Matriculas.CodigoAluno} = ' + fAlunosAfrica.tblPessoacd_Pessoa.AsString;
      SFormula := Sformula + 'and {Matriculas.AnoSemestre} = ' + lstAnoSemestre.Items[cmb.ItemIndex];
      SFormula := Sformula + 'and';
      SFormula := Sformula + '{Matriculas.Turma} = "' + lstTurma.Items[cmb.ItemIndex] + '"';

      PrincipalForm.Rel.Printer.Prompt();

      PrincipalForm.ImprimeRpt(Self, NomeRel,-1,SFormula, '', nil, nil, nil, nil, true, False, nil, True);
      Exit;

    end;

    1 : begin

      if lstRequerimento.Items[cmb.ItemIndex] = '' then
      begin
        Mensagem( 'Este curso não possui requerimento formulado.', Application.Title,
                  MB_OK + MB_ICONSTOP );
        Exit;
      end;

      NomeRel := lstRequerimento.Items[cmb.ItemIndex];
      SFormula := '';

      SFormula := SFormula + '{Matriculas.AnoSemestre} = ' + lstAnoSemestre.Items[cmb.ItemIndex] + ' and ';

      SFormula := Sformula + '{Matriculas.Turma} = "' + lstTurma.Items[cmb.ItemIndex] + '" and ';

      SFormula := Sformula + '{Matriculas.CodigoAluno} = ' + fAlunosAfrica.tblPessoacd_Pessoa.AsString;

      PrincipalForm.Rel.Printer.Prompt();

      PrincipalForm.ImprimeRpt(Self, NomeRel,-1,SFormula, '', nil, nil, nil, nil, true, False, nil, True);

    end;
  end;
end;


procedure TfrmImpAlunosAfrica.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  fAlunosAfrica.tblMatriculasEtapa.Last;
  dat.Date := fAlunosAfrica.tblMatriculasEtapaDataEmissao.AsDateTime;
  cmb.Items.Clear;
  lstAnoSemestre.Items.Clear;
  lstTurma.Items.Clear;

  lstCursos.Items.Clear;
  lstRequerimento.Items.Clear;

  while not fAlunosAfrica.tblMatriculasEtapa.Bof do
  begin
    cmb.Items.Add( fAlunosAfrica.tblMatriculasEtapaTurma.AsString + ' - ' + fAlunosAfrica.tblMatriculasEtapaAnoSemestre.DisplayText );

    DM.tblCursosTurma.Close;
    DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS AS C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

    DM.tblCursosTurma.ParamByName('Turma').AsString := fAlunosAfrica.tblMatriculasEtapaTurma.AsString;
    DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := fAlunosAfrica.tblMatriculasEtapaAnoSemestre.AsInteger;
    DM.tblCursosTurma.Open;

    if (DM.tblCursosTurmaDS_CONTRATO.AsString <> '') or (DM.tblCursosTurmaDS_REQUERIMENTO.AsString <> '') then
    Begin
      lstCursos.Items.Add( DM.tblCursosTurmaDS_CONTRATO.AsString );
      lstRequerimento.Items.Add( DM.tblCursosTurmaDS_REQUERIMENTO.AsString );
    End
    else
    Begin
      lstCursos.Items.Add( '' );
      lstRequerimento.Items.Add( '' );
    End;

    lstAnoSemestre.Items.Add( fAlunosAfrica.tblMatriculasEtapaAnoSemestre.AsString );
    lstTurma.Items.Add( fAlunosAfrica.tblMatriculasEtapaturma.AsString );

    fAlunosAfrica.tblMatriculasEtapa.Prior;
  end;
  cmb.ItemIndex := 0;
end;

procedure TfrmImpAlunosAfrica.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmImpAlunosAfrica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;



end.

