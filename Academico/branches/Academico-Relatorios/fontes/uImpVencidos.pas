unit uImpVencidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ucrpe32,
  ClassRegistros, ExtCtrls, UMDateTimePicker;

type
  TfrmImpVencidos = class(TForm)
    GroupBox2: TGroupBox;
    btnImprimir: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    EditAnoDe: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditAnoAte: TMaskEdit;
    Label5: TLabel;
    EditCodigoAluno: TEdit;
    Label6: TLabel;
    EditTurma: TEdit;
    chkEspecial: TCheckBox;
    umdtAte: TUMDateTimePicker;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpVencidos: TfrmImpVencidos;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmImpVencidos.btnImprimirClick(Sender: TObject);
var
  flgAND : Boolean;
  NomeRel : string;
  SFormula : string;
  slFormula: TStringList;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin

  flgAND := False;
  SFormula := '';

  if chkEspecial.Checked then
    NomeRel := 'repVencidos2'
  else
    NomeRel := 'repVencidos';

  if EditCodigoAluno.Text <> '' then
  begin
    if flgAND then SFormula :=  SFormula + ' AND ' ;
    SFormula := SFormula + '{Mensalidades.CodigoAluno} = ' + EditCodigoAluno.Text;
    flgAND := True;
  end;

  if EditTurma.Text <> '' then
  begin
    if flgAND then SFormula := SFormula + ' AND ';
    SFormula := SFormula + '{Mensalidades.Turma} = "' + EditTurma.Text + '"';
    flgAND := True;
  end;

  if flgAND then SFormula := SFormula + ' AND ';
  SFormula := SFormula + '{Mensalidades.DataVencimento} <= ' + 'Date(' + FormatDateTime('yyyy,mm,dd', umdtAte.Date) + ')' ;
  flgAND := True;

  if EditAnoDe.Text <> '    / ' then
  begin
    if flgAND then SFormula := SFormula + ' AND ';
    SFormula := SFormula + '{Mensalidades.AnoSemestre} >= ' + Copy( EditAnoDe.Text, 1, 4 ) + Copy( EditAnoDe.Text, 6, 1 );
    flgAND := True;
  end;

  if EditAnoAte.Text <> '    / ' then
  begin
    if flgAND then SFormula := SFormula + ' AND ';
    SFormula := SFormula + '{Mensalidades.AnoSemestre} <= ' + Copy( EditAnoAte.Text, 1, 4 ) + Copy( EditAnoAte.Text, 6, 1 );
    flgAND := True;
  end;

  SFormula := SFormula + ' AND ';
  SFormula := SFormula + '{Mensalidades.Situacao} = 2';

  if chkEspecial.Checked then
  begin
    SFormula := SFormula + ' AND ';
    SFormula := SFormula + '{Mensalidades.CodigoAluno}={ConsultaEspecial.CodigoAluno}';
  end;

  { Imprimir o Relatório }
  slFormula := TStringList.Create();

  slFormula.Add('NomeFantasia='+Dm.variavel_parametro('cliente_nome_fantasia'));
  slFormula.Add('RazaoSocial='+Dm.variavel_parametro('cliente_razao_social'));
  slFormula.Add('Endereco='+Dm.variavel_parametro('cliente_endereco'));
  slFormula.Add('Endereco2='+Dm.variavel_parametro('cliente_telefone') + ' - ' + Dm.variavel_parametro('cliente_cida') + ' - ' + Dm.variavel_parametro('cliente_estado'));

  infoRelatorio := PrincipalForm.GetInfoRpt(NomeRel);
  sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

  PodeExportar := True;
  if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
   PodeExportar := False;

  PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, SFormula, '', slFormula, nil, nil, nil, True, False, nil, PodeExportar);

end;

procedure TfrmImpVencidos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpVencidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick(nil);
  end;
end;

procedure TfrmImpVencidos.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

//  datDe.Date := DataHoje;
  umdtAte.Date := DataHoje;
end;

end.

