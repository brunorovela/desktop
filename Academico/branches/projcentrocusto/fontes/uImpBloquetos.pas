unit uImpBloquetos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Mask;

type
  TfrmImpBloquetos = class(TForm)
    Panel1: TPanel;
    btnImprimir: TButton;
    btnFechar: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtTurma: TEdit;
    txtCodigoInicio: TEdit;
    txtCodigoFim: TEdit;
    datDe: TDateTimePicker;
    datAte: TDateTimePicker;
    radTodos: TRadioButton;
    radManual: TRadioButton;
    radTodosBloquetos: TRadioButton;
    chk: TCheckBox;
    Label6: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    cbVisualizar: TCheckBox;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpBloquetos: TfrmImpBloquetos;

implementation

uses uRepBloquetos, Main, uCalculoBonus, uDM;

{$R *.DFM}

procedure TfrmImpBloquetos.btnImprimirClick(Sender: TObject);
Var
flag : boolean;
strvalor : string;
begin

   if True Then

    with frmRepBloquetos do
    begin
      tblBloquetos.Filtered := True;

      tblBloquetos.Close;
      tblBloquetos.SQL.Clear;
      tblBloquetos.SQL.Add( 'select Mensalidades.*, Alunos.ds_cpf cpf, resp.ds_cpf cpf_responsavel, Alunos.nm_pessoa nome, resp.nm_pessoa as responsavel, Departamentos.*,');
      tblBloquetos.SQL.Add( 'caixas.nr_banco banco, caixas.nm_banco, caixas.nr_agencia agencia,');
      tblBloquetos.SQL.Add( 'caixas.nr_conta_corrente contacorrente, caixas.ds_mensagem_bloqueto, caixas.nr_uso_banco, Alunos.sn_bloqueto_empresa, Alunos.cd_empresa');
      tblBloquetos.SQL.Add( 'from ( Mensalidades INNER JOIN Pessoas Alunos ON');
      tblBloquetos.SQL.Add( 'Mensalidades.CodigoAluno = Alunos.cd_pessoa) INNER JOIN');
      tblBloquetos.SQL.Add( 'Departamentos ON (Mensalidades.Depto = Departamentos.Codigo)');
      tblBloquetos.SQL.Add( 'INNER JOIN pessoas resp ON (Alunos.cd_resp_finan = resp.cd_pessoa)');
      tblBloquetos.SQL.Add( 'INNER JOIN caixadepto ON (Departamentos.codigo = caixadepto.Depto)');
      tblBloquetos.SQL.Add( 'INNER JOIN caixas ON (caixadepto.codcaixadepto = caixas.codcaixadepto)');
      tblBloquetos.SQL.Add( 'where (caixas.disponivel = ''S'') and');

      if radTodos.Checked then
      begin

	   tblBloquetos.SQL.Add( '(Mensalidades.Turma = :Turma) and ' );
	   tblBloquetos.SQL.Add( '(Parcela <> :Parcela) and ' );
	   tblBloquetos.SQL.Add( '(Bloqueto = :Bloqueto) and ' );
	   tblBloquetos.SQL.Add( '(DataVencimento >= :DataInicial) and ' );
	   tblBloquetos.SQL.Add( '(DataVencimento <= :DataFinal) and ' );
	   tblBloquetos.SQL.Add( '(Mensalidades.Situacao = :Situacao1 or ' );
	   tblBloquetos.SQL.Add( ' Mensalidades.Situacao = :Situacao2) ' );
	   tblBloquetos.SQL.Add( ' Order By Alunos.cd_pessoa, Mensalidades.Parcela');
	   
	   tblBloquetos.ParamByName('Bloqueto').AsString := 'N';
	   tblBloquetos.ParamByName('Parcela').AsInteger := 0;
	   tblBloquetos.ParamByName('Situacao1').AsInteger := 2;
	   tblBloquetos.ParamByName('Situacao2').AsInteger := 10;
	   tblBloquetos.ParamByName('Turma').AsString := txtTurma.Text;
	   tblBloquetos.ParamByName('DataInicial').AsString := FormatDateTime('yyyy-mm-dd',datDe.Date);
	   tblBloquetos.ParamByName('DataFinal').AsString := FormatDateTime('yyyy-mm-dd',datAte.Date);
      end;

      if radManual.Checked then
      begin

	tblBloquetos.SQL.Add( ' (CodigoAluno >= :CodigoInicial and ' );
	tblBloquetos.SQL.Add( ' CodigoAluno <= :CodigoFinal) and ' );
	tblBloquetos.SQL.Add( '(Mensalidades.Turma = :Turma) and ' );
	tblBloquetos.SQL.Add( '(Parcela <> :Parcela) and ' );
	tblBloquetos.SQL.Add( '(Bloqueto = :Bloqueto) and ' );
	tblBloquetos.SQL.Add( '(DataVencimento >= :DataInicial) and ' );
	tblBloquetos.SQL.Add( '(DataVencimento <= :DataFinal) and ' );
	tblBloquetos.SQL.Add( '(Mensalidades.Situacao = :Situacao1 or ' );
	tblBloquetos.SQL.Add( ' Mensalidades.Situacao = :Situacao2) ' );
	tblBloquetos.ParamByName('Parcela').AsInteger := 0;
	tblBloquetos.ParamByName('Bloqueto').AsString := 'N';
	tblBloquetos.ParamByName('Situacao1').AsInteger := 2;
	tblBloquetos.ParamByName('Situacao2').AsInteger := 10;
	tblBloquetos.ParamByName('CodigoInicial').AsInteger := StrToInt( txtCodigoInicio.Text );
	tblBloquetos.ParamByName('CodigoFinal').AsInteger := StrToInt( txtCodigoFim.Text );
	tblBloquetos.ParamByName('Turma').AsString := txtTurma.Text;
	tblBloquetos.ParamByName('DataInicial').AsString := FormatDateTime('yyyy-mm-dd',datDe.Date);
	tblBloquetos.ParamByName('DataFinal').ASString := FormatDateTime('yyyy-mm-dd', datAte.Date);
      end;

      if radTodosBloquetos.Checked then
      begin

	tblBloquetos.SQL.Add( '(Parcela <> :Parcela) and ' );
	tblBloquetos.SQL.Add( '(Bloqueto = :Bloqueto) and ' );
	tblBloquetos.SQL.Add( '(DataVencimento >= :DataInicial) and ' );
	tblBloquetos.SQL.Add( '(DataVencimento <= :DataFinal) and ' );
	tblBloquetos.SQL.Add( '(Mensalidades.Situacao = :Situacao1 or ' );
	tblBloquetos.SQL.Add( ' Mensalidades.Situacao = :Situacao2) ' );
	tblBloquetos.ParamByName('Parcela').AsInteger := 0;
	tblBloquetos.ParamByName('Bloqueto').AsString := 'N';
	tblBloquetos.ParamByName('Situacao1').AsInteger := 2;
	tblBloquetos.ParamByName('Situacao2').AsInteger := 10;
	tblBloquetos.ParamByName('DataInicial').AsString := FormatDateTime('yyyy-mm-dd',datDe.Date);
	tblBloquetos.ParamByName('DataFinal').AsString := FormatDateTime('yyyy-mm-dd',datAte.Date);

      end;

      tblBloquetos.Prepare;
      tblBloquetos.Open;

      if chk.Checked then
	flgBonus := True
      else
	flgBonus := False;

       if ( cbVisualizar.Checked )  then
{//	   frmRepBloquetos.ppReport.Device := dvScreen }//
       Else
{//	   frmRepBloquetos.ppReport.Device := dvPrinter;

      ppReport.Reset;

      ppReport.Print; }//
      end;
   
end;

procedure TfrmImpBloquetos.FormShow(Sender: TObject);
var
  wYear, wMonth, wDay : Word;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Screen.Cursor := crHourGlass;
  Application.CreateForm( TfrmRepBloquetos, frmRepBloquetos );
  Screen.Cursor := crDefault;
  DecodeDate( DataHoje, wYear, wMonth, wDay );
  datDe.Date := EncodeDate( wYear, wMonth, 1 );
  datAte.Date := EncodeDate( wYear, wMonth, DaysPerMonth[wMonth] );
end;

procedure TfrmImpBloquetos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpBloquetos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = Ord( 'P' ) ) and ( Shift = [ssCtrl] ) then
  begin
{//    if frmRepBloquetos.ppReport.Device = dvScreen then
      frmRepBloquetos.ppReport.Device := dvPrinter
    else
      frmRepBloquetos.ppReport.Device := dvScreen;
}//      
  end;

end;


procedure TfrmImpBloquetos.UpDown1Click(Sender: TObject;
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

end.

