unit uFSelecionarCentro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZAbstractRODataset, UZDataset, Buttons,
  uDM, uItemCombo, uExceptions, General;

type
  TResultadoCentros = record
    codigo: Integer;
    descricao: String;
    valor: Double;
  end;

  TfrmSelecionarCentro = class(TForm)
    pnFundo: TPanel;
    edValor: TEdit;
    lbValor: TLabel;
    cbCentro: TComboBox;
    lbCentroCusto: TLabel;
    qryCentroCusto: TUMZReadOnlyQuery;
    btnFechar: TSpeedButton;
    btSelecionar: TBitBtn;
    lbPercentual: TLabel;
    edPercentual: TEdit;
    procedure edPercentualChange(Sender: TObject);
    procedure edValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    class var FInstancia: TfrmSelecionarCentro;
    Resultado: TResultadoCentros;
    ValorTotal: Double;
  strict private
    constructor createPrivate();
  public
    constructor create(); reintroduce; 
    class function getInstancia(): TfrmSelecionarCentro;
    class function Filtrar(valorTotal: Double; cd_centro: Integer = -1; valor: Double = 0): TResultadoCentros;
  end;

var
  frmSelecionarCentro: TfrmSelecionarCentro;

implementation

{$R *.dfm}

procedure TfrmSelecionarCentro.btSelecionarClick(Sender: TObject);
begin

   if cbCentro.ItemIndex = -1 then
   begin
      Mensagem('Selecione um centro de custo.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      Exit;
   end;

   Resultado.codigo := StrToInt(TItemCombo(cbCentro.Items.Objects[cbCentro.ItemIndex]).codigo);
   Resultado.descricao := TItemCombo(cbCentro.Items.Objects[cbCentro.ItemIndex]).descricao;
   Resultado.valor := StrToFloat(edValor.Text);

   Self.Close;
end;

procedure TfrmSelecionarCentro.btnFecharClick(Sender: TObject);
begin
   Resultado.codigo := -1;
   Resultado.descricao := '';
   Resultado.valor := 0;

   Self.Close;
end;

constructor TfrmSelecionarCentro.create;
begin
   raise TExceptionConstructor.Create(fecConstrucaoInvalida);
end;

constructor TfrmSelecionarCentro.createPrivate;
begin
   inherited Create(nil);
end;

procedure TfrmSelecionarCentro.edPercentualChange(Sender: TObject);
begin
   edValor.Enabled := (edPercentual.Text = '');
   edValor.Text := FloatToStr((StrToFloatDef(edPercentual.Text, 0) * Self.getInstancia.ValorTotal) / 100);
end;

procedure TfrmSelecionarCentro.edValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      btSelecionar.Click;
   end;
end;

procedure TfrmSelecionarCentro.edValorKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key in ['0'..'9']) or (key = ',') or (key = #8) then
   begin
      Exit;
   end;

   Key := #0;
end;

class function TfrmSelecionarCentro.Filtrar(valorTotal: Double; cd_centro: Integer;
  valor: Double): TResultadoCentros;
begin
   Self.getInstancia.Resultado.codigo := cd_centro;
   Self.getInstancia.Resultado.valor := valor;
   self.getInstancia.ValorTotal := valorTotal;

   Self.getInstancia.ShowModal();

   Result := Self.getInstancia.Resultado;

   Self.getInstancia.Resultado.codigo := -1;
   Self.getInstancia.Resultado.descricao := '';
   Self.getInstancia.Resultado.valor := 0;
   Self.getInstancia.edPercentual.Text := '';
end;

procedure TfrmSelecionarCentro.FormShow(Sender: TObject);
var
   item: TItemCombo;
   pos, index: Integer;
begin

   pos := 0;
   index := -1;

   qryCentroCusto.Close;
   qryCentroCusto.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryCentroCusto.Open;

   cbCentro.Items.Clear;

   while not qryCentroCusto.Eof do
   begin
      item := TItemCombo.Create(
         qryCentroCusto.FieldByName('cd_centro').AsString,
         qryCentroCusto.FieldByName('ds_centro').AsString
      );

      if item.codigo = IntToStr(Resultado.codigo) then
      begin
         index := pos;    
      end;

      cbCentro.Items.AddObject(item.descricao, item);

      qryCentroCusto.Next;
      
      Inc(pos);
   end;

   cbCentro.ItemIndex := index;

   edValor.Text := FloatToStr(Resultado.valor);

   if edValor.Text = '0' then
   begin
      edPercentual.Text := '';
   end
   else
   begin
      edPercentual.Text := FloatToStr( (StrToFloatDef(edValor.Text, 0) * 100) / Self.getInstancia.ValorTotal );
   end;
   
   if Resultado.valor = 0 then
   begin
      edValor.Text := '';
   end;

   edPercentual.SetFocus;
end;

class function TfrmSelecionarCentro.getInstancia: TfrmSelecionarCentro;
begin
   if FInstancia = nil then
   begin
      FInstancia := TfrmSelecionarCentro.CreatePrivate();
   end;

   Result := FInstancia;
end;

end.
