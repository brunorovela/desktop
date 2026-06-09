unit uBloquearFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, ZConnection, uZDataset,
  ZAbstractRODataset, ZAbstractDataset, uColigadaMatriz, uListaColigadas,
  UMDateTimePicker;

type
  TfrmBloquearFinanceiro = class(TForm)
    Panel2: TPanel;
    cbUnidadesMatriz: TComboBox;
    Label1: TLabel;
    lbData: TLabel;
    Label3: TLabel;
    cbOpcoes: TComboBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    cbBloqueto: TComboBox;
    lbBoleto: TLabel;
    qryBloqueiaFin: TUMZQuery;
    umdtBloqueio: TUMDateTimePicker;
    umdtBoleto: TUMDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbOpcoesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbUnidadesMatrizChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PreencheUnidade;
    procedure AtualizarDadosTela;
    Procedure BloquearData;
  public
    { Public declarations }
  end;

var
  frmBloquearFinanceiro: TfrmBloquearFinanceiro;

implementation

Uses UDM, uItemCombo;

{$R *.dfm}

{ TfrmBloquearFinanceiro }

procedure TfrmBloquearFinanceiro.AtualizarDadosTela;
Var
   qyAux : TUMZQuery;
begin
   DM.CriarConsulta(qyAux);

   // Buscar as Selecionada
   qyAux.SQL.Text := ''+
      ' SELECT * FROM coligadas_matriz WHERE cd_coligada =  ' +
         IntToStr(TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo);
   qyAux.Open();

   // Definir a opção padrão - Já cadastrada
   cbOpcoes.ItemIndex := qyAux.FieldByName('sn_bloquear_financeiro').AsInteger;

   // Definir a data cadastrada
   if qyAux.FieldByName('dt_bloqueio_financeiro').IsNull then begin
      umdtBloqueio.Date := Dm.DataAtual();
   end else begin
      umdtBloqueio.Date := qyAux.FieldByName('dt_bloqueio_financeiro').AsDateTime;
   end;



   cbBloqueto.ItemIndex := qyAux.FieldByName('sn_bloquear_boleto').AsInteger;

   // Definir a data cadastrada
   if qyAux.FieldByName('dt_bloqueio_boleto').IsNull then begin
      umdtBoleto.Date := Dm.DataAtual();
   end else begin
      umdtBoleto.Date := qyAux.FieldByName('dt_bloqueio_boleto').AsDateTime;
   end;

   FreeAndNil(qyAux);

   BloquearData();

end;

procedure TfrmBloquearFinanceiro.BloquearData;
begin

  lbData.Enabled     := (cbOpcoes.ItemIndex = 1);
  umdtBloqueio.Enabled := (cbOpcoes.ItemIndex = 1);

  lbBoleto.Enabled     := (cbBloqueto.ItemIndex = 1);
  umdtBoleto.Enabled     := (cbBloqueto.ItemIndex = 1);


end;

procedure TfrmBloquearFinanceiro.btnCancelarClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmBloquearFinanceiro.btnConfirmarClick(Sender: TObject);
var
   sMsgLog : String;
begin
   // Confirmação alterações das opções de Bloqueio;
   qryBloqueiaFin.ParamByName('SN_BLOQUEAR_FINANCEIRO').AsInteger := cbOpcoes.ItemIndex;
   qryBloqueiaFin.ParamByName('DT_BLOQUEIO_FINANCEIRO').AsDate := umdtBloqueio.Date;
   qryBloqueiaFin.ParamByName('SN_BLOQUEAR_BOLETO').AsInteger := cbBloqueto.ItemIndex;
   qryBloqueiaFin.ParamByName('DT_BLOQUEIO_BOLETO').AsDate := umdtBoleto.Date;
   qryBloqueiaFin.ParamByName('CD_COLIGADA').AsInteger :=
      TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo;
   qryBloqueiaFin.ExecSQL;

   // Guardar Log da Alteração
   sMsgLog := 'Bloqueio Financeiro --> Data: ' +  FormatDateTime('dd/mm/yyyy', umdtBloqueio.Date);

   if cbOpcoes.ItemIndex = 0 then begin
      sMsgLog := sMsgLog + ' Situação: LIBERADO';
   end else begin
      sMsgLog := sMsgLog + ' Situação: BLOQUEADO';
   end;

   sMsgLog := sMsgLog + CHR(13);

   sMsgLog := sMsgLog + 'Bloqueio Boleto --> Data: ' +  FormatDateTime('dd/mm/yyyy', umdtBoleto.Date);

   if cbBloqueto.ItemIndex = 0 then begin
      sMsgLog := sMsgLog + ' Situação: LIBERADO';
   end else begin
      sMsgLog := sMsgLog + ' Situação: BLOQUEADO';
   end;

   DM.setLog(2, 'alteracao', '', TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo, sMsgLog);

   Close();
end;

procedure TfrmBloquearFinanceiro.cbOpcoesChange(Sender: TObject);
begin
  BloquearData();
end;

procedure TfrmBloquearFinanceiro.cbUnidadesMatrizChange(Sender: TObject);
begin
   AtualizarDadosTela();
end;

procedure TfrmBloquearFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmBloquearFinanceiro.FormShow(Sender: TObject);
begin
   PreencheUnidade();
   AtualizarDadosTela();
end;

procedure TfrmBloquearFinanceiro.PreencheUnidade;
var
   listaColigada: TListaColigadas;
   i, selecionada: Integer;
begin
   listaColigada := DM.GetUsuarioLogado.ListaColigadasPai;

   for i := 0 to listaColigada.Count - 1 do
   begin

      if TColigadaMatriz(listaColigada[i]).Codigo = DM.GetUsuarioLogado.GetColigadaLogada.Codigo then
         selecionada := i;

      cbUnidadesMatriz.AddItem(
         TColigadaMatriz(listaColigada[i]).Nome,
         listaColigada[i]
      );
   end;

   cbUnidadesMatriz.ItemIndex := selecionada;
end;

end.
