unit uTesouraria_atualiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ZStoredProcedure, UMDateTimePicker;

type
  Tfrm_Tesouraria_atualiza = class(TForm)
    pnTitulo: TPanel;
    bv1: TBevel;
    Label3: TLabel;
    edContaDe: TEdit;
    Label4: TLabel;
    edValor: TEdit;
    Bevel1: TBevel;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Label5: TLabel;
    qrySelectSaldo: TUMZReadOnlyQuery;
    qrySelectSaldoSALDO: TFloatField;
    umdtAjuste: TUMDateTimePicker;
    procedure dtAjusteChange(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure edValorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    ListaContas : Array of integer;

    Function PegarSaldo() : Currency;
  public
    { Public declarations }


    iContaDe : Integer;
    iColigadaSelecionada : Integer;
  end;

var
  frm_Tesouraria_atualiza: Tfrm_Tesouraria_atualiza;

  CONST
       COD_ACAO_PADRAO = 8;


implementation

uses uDM, uClassMovimento, Main;

{$R *.dfm}

procedure Tfrm_Tesouraria_atualiza.edValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if (key = ',') then
   begin
      if Pos(',', TEdit(Sender).Text) > 0 then
         key := #0;
   end
   else
   if not (key in ['0'..'9',#8,'-']) then
      key := #0;

end;

procedure Tfrm_Tesouraria_atualiza.edValorExit(Sender: TObject);
var
  valor : Currency;
  txt : String;
begin
       try
          valor := StrToCurr(TEdit(Sender).Text);
          txt := FloatToStrF(valor, ffFixed, 12, 2);
       except
             txt := '0,00';
       end;

       TEdit(Sender).Text := txt;

end;

procedure Tfrm_Tesouraria_atualiza.FormShow(Sender: TObject);
var
   qyAux : TUMZQuery;
   n : word;
begin
   // A variável iContaDe deve estar setada

   if iContaDe = 0 then
   begin
      Mensagem('Nenhuma conta foi selecionada para atualizar o saldo.', 'Atenção', MB_OK + MB_ICONWARNING);
      Close;
      exit;
   end;

   Dm.CriarConsulta(qyAux);

   // Resgatar nome da conta atual

   qyAux.SQL.Clear;
   qyAux.SQL.Add(
   'SELECT                                 ' +
   '  cd_caixa, ds_caixa                   ' +
   'FROM                                   ' +
   '  fin_cadastro_contas                  ' +
   'WHERE                                  ' +
   '  cd_caixa =  ' + IntToStr(iContaDe)   +
   ' AND cd_coligada = ' + IntToStr(iColigadaSelecionada) ) ;

   qyAux.Open;

   edContaDe.Text := qyAux.FieldByName('ds_caixa').AsString;

   umdtAjuste.Date := DM.DataAtual;

end;

function Tfrm_Tesouraria_atualiza.PegarSaldo: Currency;
begin
   qrySelectSaldo.ParamByName('CD_CAIXA').AsInteger := iContaDe;
   qrySelectSaldo.ParamByName('CD_COLIGADA').AsInteger := iColigadaSelecionada;
   qrySelectSaldo.ParamByName('DT_BASE').AsDate := umdtAjuste.Date + 1;
   qrySelectSaldo.Open;
   Result := qrySelectSaldoSALDO.AsFloat;
   qrySelectSaldo.Close;
end;

procedure Tfrm_Tesouraria_atualiza.btnConfirmarClick(Sender: TObject);
Var
   qyAcao : TUMZQuery;
   SaldoAtual : Currency;
   tpEntradaSaida : Word;
   mvAjusteSaldo : TMovimento;
begin
      btnConfirmar.Enabled:=false;
      Dm.CriarConsulta(qyAcao);

      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
      ' SELECT                              ' +
      '   *                                 ' +
      ' FROM                                ' +
      '    fin_acoes_movimento              ' +
      ' WHERE                               ' +
      '    cd_acao_automatica = ' + IntToStr(COD_ACAO_PADRAO) );

      qyAcao.Open;

      if qyAcao.Eof then begin
         Mensagem('Não é possível atualizar o saldo. Nenhuma ação padrão programada.', 'Atenção', MB_OK + MB_ICONWARNING);
         exit;
      end;

      // Gerar um movimento de saida de uma conta

      SaldoAtual := PegarSaldo();

      if  SaldoAtual > StrToCurr(edValor.Text) then begin
         tpEntradaSaida := 2; // Saida, pois o saldo vai diminur
         SaldoAtual := SaldoAtual - StrToCurr(edValor.Text);
      end
      else begin
         tpEntradaSaida := 1; // Entrada, pois o valor do saldo vai aumentar
         SaldoAtual := StrToCurr(edValor.Text) - SaldoAtual;
      end;

      mvAjusteSaldo := TMovimento.create();

      mvAjusteSaldo.CodAcao := qyAcao.FieldByName('cd_acao').AsInteger;
      mvAjusteSaldo.ValorMovimento := SaldoAtual;
      mvAjusteSaldo.ValorEmCheque := 0;
      mvAjusteSaldo.ValorEmDinheiro := SaldoAtual;
      mvAjusteSaldo.Historico := UpperCase(qyAcao.FieldByNAme('ds_acao').AsString);

      mvAjusteSaldo.DataLiberacao := Date;
      mvAjusteSaldo.Origem := 3;  // Tesouraria
      mvAjusteSaldo.EntradaSaida := tpEntradaSaida;
      mvAjusteSaldo.DataMovimento := umdtAjuste.Date;
      mvAjusteSaldo.RegistrarMovimentacaoTe(iContaDe);

      FreeAndNil(mvAjusteSaldo);

      Mensagem('Saldo ajustado com sucesso.', 'UNI-MESTRE', MB_OK + MB_ICONEXCLAMATION);

      Close();

end;

procedure Tfrm_Tesouraria_atualiza.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Tesouraria_atualiza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Tesouraria_atualiza.dtAjusteChange(Sender: TObject);
begin
   FloatToStrF(PegarSaldo, ffFixed, 7, 2);
end;

end.

