unit uImpNegociacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Ucrpe32, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ClassRegistros;

type
  TfrmImpNegociacoes = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    datDe: TDateTimePicker;
    chkNegociadas: TCheckBox;
    btnImprimir: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    txtAno: TEdit;
    Label3: TLabel;
    txtSemestre: TEdit;
    chkPagas: TCheckBox;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnImprimirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpNegociacoes: TfrmImpNegociacoes;

implementation

uses Main, uDM;

{$R *.DFM}





procedure TfrmImpNegociacoes.btnImprimirClick(Sender: TObject);
Var
   NomeRel, SFormula : String;
   slFormula: TStringList;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
  NomeRel := '.rpt';
  SFormula := '';

  SFormula := SFormula + '{Mensalidades.AnoSemestre} <= ' + txtAno.Text + txtSemestre.Text;
  SFormula := SFormula + ' and {Mensalidades.DataPagamento} >= Date(' + FormatDateTime( 'yyyy,mm,dd', datDe.Date ) + ') and ';

  if ( chkPagas.Checked ) and ( chkNegociadas.Checked ) then
    SFormula := SFormula + '{Mensalidades.Situacao} <= 3'
  else if ( chkPagas.Checked ) then
    SFormula := SFormula + '{Mensalidades.Situacao} <= 1'
  else if ( chkNegociadas.Checked ) then
    SFormula := SFormula + '{Mensalidades.Situacao} = 3';

  { Imprimir Relatório }
  slFormula := TStringList.Create();

  slFormula.Add('cliente_nome_fantasia='+Dm.variavel_parametro('cliente_nome_fantasia'));
  slFormula.Add('cliente_razao_social='+Dm.variavel_parametro('cliente_razao_social'));


  infoRelatorio := PrincipalForm.GetInfoRpt('repNegociacoes');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';
   sNomeRelatorio := sNomeRelatorio+NomeRel;
   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

  PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, SFormula, '', slFormula, nil, nil, nil, True, False, nil, PodeExportar);
end;

procedure TfrmImpNegociacoes.btnImprimirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmImpNegociacoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpNegociacoes.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
end;

end.

