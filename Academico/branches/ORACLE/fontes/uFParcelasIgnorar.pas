unit uFParcelasIgnorar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, General, UMEditNumerico;

type
  TformParcelasIgnorar = class(TForm)
    pnlTop: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    btnAdd: TBitBtn;
    sbParcelas: TScrollBox;
    Panel3: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edNovaParcela: TUMEditNumerico;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure removeItem(Sender: TObject);
  private
    listParcelas : TStringList;
    parcelasResultado : String;
    procedure adicionaParcela(parcela:String);
    { Private declarations }
  public
    procedure carregaParcelas(strParcelas:String);
    function getParcelasResultado():String;
    { Public declarations }
  end;

var
  formParcelasIgnorar: TformParcelasIgnorar;

implementation

{$R *.dfm}

procedure TformParcelasIgnorar.adicionaParcela(parcela:String);
var
   lbParcela : TLabel;
   btParcela : TBitBtn;
begin
   listParcelas.Values[parcela] := parcela;

   lbParcela := TLabel.Create( sbParcelas );
   with lbParcela do
   begin
      Visible     := true;
      Parent      := sbParcelas;
      Caption     := parcela;
      Width       := 99;
      Name        := 'lbParcela' + parcela;
      Left        := 10;
      Top         := ((listParcelas.Count * 5) + (listParcelas.Count * 7) + (listParcelas.Count * 2));
   end;

   btParcela := TBitBtn.Create( sbParcelas );
   with btParcela do
   begin
      Visible     := true;
      Parent      := sbParcelas;
      Caption     := '-';
      Width       := 26;
      Name        := 'btParcela' + parcela;
      Height      := 12;
      Left        := 147;
      Top         := ((listParcelas.Count * 5) + (listParcelas.Count * 7) + (listParcelas.Count * 2));
      OnClick     := removeItem;
      Tag         := strtoint(parcela);
   end;
end;

procedure TformParcelasIgnorar.btnAddClick(Sender: TObject);
var

   parcelaAtual : String;
begin

   if((edNovaParcela.Text = '') OR (listParcelas.Values[edNovaParcela.Text] <> '' )) then
   begin
      ShowMessage('Informe um número de parcela valido.');
      exit;
   end;

   parcelaAtual := edNovaParcela.Text;
   self.adicionaParcela(parcelaAtual);
end;

procedure TformParcelasIgnorar.btnCancelClick(Sender: TObject);
begin
   self.ModalResult := mrCancel;
   self.CloseModal;
end;

procedure TformParcelasIgnorar.btnOkClick(Sender: TObject);
begin
   self.ModalResult := mrOk;
   self.CloseModal;
end;

procedure TformParcelasIgnorar.carregaParcelas(strParcelas:String);
var
   slParcelas : TStringList;
   i: integer;
   parcelaAtual,sBase,retornoSplit: String;
   fimStrAtual: Integer;
begin
   if(strParcelas = '') then
   begin
      exit;
   end;

   sBase := strParcelas;
   repeat
      fimStrAtual := Pos(';', sBase);

      if (sBase = '') then
      begin
         break;
      end;

      retornoSplit := sBase;
      if fimStrAtual <> 0 then begin
        retornoSplit := (Copy(sBase, 1, fimStrAtual - 1));
      end;

      Self.adicionaParcela(retornoSplit);
      sBase := Copy(sBase, fimStrAtual + Length(';'), Length(sBase) - fimStrAtual);
   until fimStrAtual = 0;
end;

procedure TformParcelasIgnorar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   retorno : string;
   i: integer;
begin
   retorno := '';
   for I := 0 to listParcelas.Count - 1 do
   begin
      retorno := retorno + listParcelas.ValueFromIndex[i] + ';';
   end;

   parcelasResultado := retorno; 
end;

procedure TformParcelasIgnorar.FormCreate(Sender: TObject);
begin
   listParcelas := TStringList.Create;
end;

function TformParcelasIgnorar.getParcelasResultado: String;
begin
   result := self.parcelasResultado;
end;

procedure TformParcelasIgnorar.removeItem(Sender: TObject);
var
   I, posicaoAtual:Integer;
   lbParcela : TLabel;
   btParcela : TBitBtn;
   parcela : String;
   indexParcela : Integer;
begin
   parcela := inttostr(TBitBtn(Sender).tag);

   btParcela := sbParcelas.FindComponent('btParcela'+ parcela) as TBitBtn;
   lbParcela := sbParcelas.FindComponent('lbParcela'+ parcela) as TLabel;
   posicaoAtual := btParcela.Top;

   btParcela.Destroy;
   lbParcela.Destroy;

   for I := 0 to listParcelas.Count - 1 do
   begin

      if(parcela = listParcelas.ValueFromIndex[i]) then
      begin
         indexParcela := i;
         continue;
      end;

      btParcela := sbParcelas.FindComponent('btParcela'+ listParcelas.ValueFromIndex[i]) as TBitBtn;
      lbParcela := sbParcelas.FindComponent('lbParcela'+ listParcelas.ValueFromIndex[i]) as TLabel;

      if (btParcela.Top > posicaoAtual) then
      begin
         btParcela.Top := btParcela.Top - 14;
         lbParcela.Top := lbParcela.Top - 14;
      end;
   end;

   listParcelas.Delete(indexParcela);
end;


end.
