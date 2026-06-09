unit uImpBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmImpBoletos = class(TForm)
    Panel3: TPanel;
    Bevel6: TBevel;
    Label1: TLabel;
    rbIndividual: TRadioButton;
    rbGrupoPessoa: TRadioButton;
    rbGrupoResp: TRadioButton;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure rbGrupoRespClick(Sender: TObject);
    procedure rbGrupoPessoaClick(Sender: TObject);
    procedure rbIndividualClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flgOpcao : Integer;
  end;

var
  frmImpBoletos: TfrmImpBoletos;

implementation

{$R *.dfm}

procedure TfrmImpBoletos.btnCancelarClick(Sender: TObject);
begin
   // Não deve continuar a impressão dos boletos
   flgOpcao := 0;
   Close();
end;

procedure TfrmImpBoletos.btnConfirmarClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmImpBoletos.FormShow(Sender: TObject);
begin
   // Definir como padrão o grupo individual
   flgOpcao := 1;
   rbIndividual.Checked := True;
end;

procedure TfrmImpBoletos.rbGrupoPessoaClick(Sender: TObject);
begin
   // Definir o grupo de Pessoa
   flgOpcao := 2;
end;

procedure TfrmImpBoletos.rbGrupoRespClick(Sender: TObject);
begin
   // Definir o grupo de Responsável
   flgOpcao := 3;
end;

procedure TfrmImpBoletos.rbIndividualClick(Sender: TObject);
begin
   // Definir o grupo Individual
   flgOpcao := 1;
end;

end.

