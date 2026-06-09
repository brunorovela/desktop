unit uPlanosCopiar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls, ZConnection, UZDataset,
  UMComboBox, uUMNucleo, UMAjuda, UMDateTimePicker;

type
  TfrmPlanosCopiar = class(TForm)
    Bevel2: TBevel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    lbNomePlano: TLabel;
    Panel1: TPanel;
    Bevel4: TBevel;
    Label2: TLabel;
    edAnosemestre: TMaskEdit;
    UpDown1: TUpDown;
    Label4: TLabel;
    rgParcelas: TRadioGroup;
    UMAjuda1: TUMAjuda;
    ckbCopiarTurmas: TCheckBox;
    umdtApartirDe: TUMDateTimePicker;
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
  private
    function GetCalcularParcelas: Boolean;
    function GetCopiarTurmas: Boolean;
    function GetAnoSemestre: Integer;
    function getPlanoZerado: Boolean;
    function getCopiarItens: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property nr_anosemestre: Integer read GetAnoSemestre;
    property sn_copiar_turmas: Boolean read GetCopiarTurmas;
    property sn_calcular_parcelas: Boolean read GetCalcularParcelas;
    property sn_copiar_itens: Boolean read getCopiarItens;
    property sn_plano_zerado: Boolean read getPlanoZerado;
  end;

var
  frmPlanosCopiar: TfrmPlanosCopiar;

implementation

uses uPlanos, uDM, uItemCombo, General;

{$R *.DFM}

procedure TfrmPlanosCopiar.FormShow(Sender: TObject);
begin
   if not TUMNucleo.GetParametroUsaAnosemestre then
   begin
      edAnosemestre.Visible := False;
      Label2.Visible := False;
      UpDown1.Visible := False;
   end;

end;

function TfrmPlanosCopiar.GetAnoSemestre: Integer;
begin
   Result := StrToInt( edAnosemestre.Text );
end;

function TfrmPlanosCopiar.GetCalcularParcelas: Boolean;
begin
   Result := (rgParcelas.itemindex = 0);
end;

function TfrmPlanosCopiar.getCopiarItens: Boolean;
begin
   Result := (rgParcelas.ItemIndex = 1);
end;

function TfrmPlanosCopiar.GetCopiarTurmas: Boolean;
begin
   Result := ckbCopiarTurmas.Checked;
end;

function TfrmPlanosCopiar.getPlanoZerado: Boolean;
begin
   Result := (rgParcelas.ItemIndex = 2);
end;

procedure TfrmPlanosCopiar.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     edAnosemestre.text := DM.incrementar_ano_semestre(edAnosemestre.Text);
  end
  else
  begin
     edAnosemestre.text := DM.decrementar_ano_semestre(edAnosemestre.Text);
  end;
end;

end.
