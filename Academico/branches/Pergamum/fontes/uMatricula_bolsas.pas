unit uMatricula_bolsas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZConnection, Buttons, ZAbstractRODataset, uDM,
  ZAbstractDataset, ZDataset, UZDataset;

type
  bolsas = record
    CdBolsa : Integer;
    DsBolsa : String;
    SnGratu : Byte;
    VlSuger : Currency;
    VlPerce : Currency;
  end;
  TFrmMatricula_bolsa = class(TForm)
    qyBolsas: TUMZQuery;
    Label1: TLabel;
    cbBolsas: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edValorBolsa: TEdit;
    edPercentual: TEdit;
    lbResp: TLabel;
    edCodigoResp: TEdit;
    edNomeResp: TEdit;
    sbResp: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure sbRespClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbBolsasKeyPress(Sender: TObject; var Key: Char);
    procedure cbBolsasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    aBolsas : Array of bolsas;
  public
     flgOk : Boolean;
     iCodResp : Integer;
     iBolsa : Integer;
     sNomeResp : String;

    { Public declarations }
  end;

var
  FrmMatricula_bolsa: TFrmMatricula_bolsa;

implementation

uses uFSelecionarPessoa;

{$R *.dfm}

procedure TFrmMatricula_bolsa.BitBtn2Click(Sender: TObject);
begin
   flgOk := True;
end;

procedure TFrmMatricula_bolsa.cbBolsasChange(Sender: TObject);
begin
   edValorBolsa.Text := FloatToStrF(aBolsas[cbBolsas.ItemIndex].VlSuger, ffFixed, 7, 2);
   edPercentual.Text := FloatToStrF(aBolsas[cbBolsas.ItemIndex].VlPerce, ffFixed, 7, 2);
   iBolsa := aBolsas[cbBolsas.ItemIndex].CdBolsa;

   if aBolsas[cbBolsas.ItemIndex].SnGratu = 1 then begin

      edCodigoResp.Text := '';
      edCodigoResp.Enabled := False;
      lbResp.Enabled := False;
      sbResp.Enabled := False;
      edNomeResp.Enabled := False;
      edNomeResp.Text := '(gratuidade)';

   end else begin

      edCodigoResp.Enabled := True;
      lbResp.Enabled := True;
      sbResp.Enabled := True;
      edNomeResp.Enabled := True;
      
      if edNomeResp.Text = '(gratuidade)' then
         edNomeResp.Text := '';

   end;

end;

procedure TFrmMatricula_bolsa.cbBolsasKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  end;
end;

procedure TFrmMatricula_bolsa.FormShow(Sender: TObject);
Var
   i : Integer;
begin
   // Preencher as bolsas

   qyBolsas.Close();
   qyBolsas.SQL.Text :=
     ' SELECT * FROM fin_bolsas_tipos ORDER BY ds_bolsa ';
   qyBolsas.Open();

   cbBolsas.Items.Clear();
   SetLength(aBolsas, qyBolsas.RecordCount);

   i := 0;

   while not qyBolsas.Eof do begin
      cbBolsas.Items.Add(qyBolsas.FieldByName('ds_bolsa').AsString);

      aBolsas[i].CdBolsa := qyBolsas.FieldByName('cd_bolsa').AsInteger;
      aBolsas[i].DsBolsa := qyBolsas.FieldByName('ds_bolsa').AsString;
      aBolsas[i].SnGratu := qyBolsas.FieldByName('sn_gratuidade').AsInteger;
      aBolsas[i].VlSuger := qyBolsas.FieldByName('vl_fixo_sugerido').AsCurrency;
      aBolsas[i].VlPerce := qyBolsas.FieldByName('vl_perc_sugerido').AsCurrency;

      Inc(i);

      qyBolsas.Next();
   end;

   cbBolsas.SetFocus();

   flgOk := false;

end;

procedure TFrmMatricula_bolsa.sbRespClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa);

  if resultado_filtro.filtrado then
  Begin
     edCodigoResp.Text := IntToStr(resultado_filtro.cd_pessoa);
     iCodResp := resultado_filtro.cd_pessoa;
     sNomeResp := resultado_filtro.nm_pessoa;

     edNomeResp.Text := sNomeResp;

  End
  else Exit;

end;

end.

