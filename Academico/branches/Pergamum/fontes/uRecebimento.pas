unit uRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons, DBCtrls, Mask, ComCtrls;

type
  TfrmRecebimento = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Bevel4: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    ListBox1: TListBox;
    txtCh: TEdit;
    Label14: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    txtCheque_Banco: TEdit;
    txtCheque_Agencia: TEdit;
    txtCheque_CC: TEdit;
    txtCheque_Data: TMaskEdit;
    Label15: TLabel;
    Label13: TLabel;
    txtCheque_nro: TEdit;
    Label9: TLabel;
    Label12: TLabel;
    Panel5: TPanel;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label16: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label8: TLabel;
    cbContas: TComboBox;
    sbBloqueaConta: TSpeedButton;
    EditDataPagto: TDBEdit;
    Label6: TLabel;
    Label10: TLabel;
    EditDesconto: TDBEdit;
    sbBloquearDesconto: TSpeedButton;
    sbBloquearJuros: TSpeedButton;
    EditJuros: TDBEdit;
    Label7: TLabel;
    EditValor: TDBEdit;
    Label11: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecebimento: TfrmRecebimento;

implementation

{$R *.dfm}

end.

