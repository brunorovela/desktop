unit uFAplicarCreditoMensalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uMensalidade, StdCtrls, Buttons, Grids, Contnrs,
  UMEditMonetario;

type
  TfrmAplicarCreditoMensalidade = class(TForm)
      paCabecalho: TPanel;
      Panel4: TPanel;
      sgCreditosDisponiveis: TStringGrid;
      lbValorTotalCreditoDisponivel: TLabel;
      Label2: TLabel;
      edValorCredito: TUMEditMonetario;
      lbInformativoValorMaximo: TLabel;
      Panel1: TPanel;
      pnResize: TPanel;
      Button1: TBitBtn;
      Button2: TBitBtn;
      procedure Button2Click(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Panel1Resize(Sender: TObject);
      procedure sgCreditosDisponiveisDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      private
         { Private declarations }
         objMensalidade: TMensalidade;
         listaCreditos : TObjectList;
         valorTotalCreditoDisponivel: Currency;

      public
         { Public declarations }
         property Mensalidade: TMensalidade read objMensalidade write objMensalidade;
  end;

implementation

uses uCredito, uGeneral;

{$R *.dfm}

procedure TfrmAplicarCreditoMensalidade.Button2Click(Sender: TObject);
begin
   if (edValorCredito.getValorDouble() <= 0) then
   begin
      TGeneral.Mensagem('Valor inválido. Digite um valor superior a 0 (zero).', '', MB_OK + MB_ICONEXCLAMATION, Handle);
      Self.ModalResult := mrNone;
      Exit;
   end
   else if (edValorCredito.getValorDouble() > valorTotalCreditoDisponivel) then
   begin
      TGeneral.Mensagem('Valor inválido. O limite de crédito disponível para uso é de ' +
         FloatToStr(valorTotalCreditoDisponivel, TGeneral.GetFormatSettings()) + '.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
      Self.ModalResult := mrNone;
      Exit;
   end
   else if (edValorCredito.getValorDouble() > Self.objMensalidade.GetValorTotal()) then
   begin
      TGeneral.Mensagem('Valor inválido. Informe um valor inferior ou igual ao valor da mensalidade. Valor: ' +
      FloatToStr(Self.objMensalidade.GetValorTotal(), TGeneral.GetFormatSettings()) + '.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
      Self.ModalResult := mrNone;
      Exit;
   end;

   Self.objMensalidade.AplicarDescontoCredito(Self.listaCreditos, edValorCredito.getValorDouble());
end;

procedure TfrmAplicarCreditoMensalidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAplicarCreditoMensalidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   case Self.ModalResult of
      mrYes: begin
         TGeneral.Mensagem('Ação realizada com sucesso.', '', MB_OK + MB_ICONINFORMATION, Handle);
      end;
      mrNone: begin
         CanClose := False;
      end
      else begin
         TGeneral.Mensagem('Ação cancelada, nenhuma ação foi efetuada.', '', MB_OK + MB_ICONINFORMATION, Handle);
      end;
   end;
end;

procedure TfrmAplicarCreditoMensalidade.FormCreate(Sender: TObject);
begin
   Self.objMensalidade := nil;
   Self.listaCreditos := nil;
end;

procedure TfrmAplicarCreditoMensalidade.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
   begin
      Self.Close();
   end;
end;

procedure TfrmAplicarCreditoMensalidade.FormShow(Sender: TObject);
var
   I : Integer;
   valorCreditoUsado, valorCreditoDisponivel: Double;
begin
   Self.listaCreditos := TCredito.GetCreditosDisponiveisPessoa(Self.objMensalidade.Aluno);
   sgCreditosDisponiveis.RowCount := 0;
   sgCreditosDisponiveis.RowCount := Self.listaCreditos.Count + 1;

   if sgCreditosDisponiveis.RowCount = 1 then
      sgCreditosDisponiveis.RowCount := 2;

   sgCreditosDisponiveis.FixedRows := 1;
   sgCreditosDisponiveis.Cells[0, 0] := 'Cód. Título';
   sgCreditosDisponiveis.Cells[1, 0] := 'Valor do Crédito';
   sgCreditosDisponiveis.Cells[2, 0] := 'Valor já utilizado';
   sgCreditosDisponiveis.Cells[3, 0] := 'Valor disponível';

   sgCreditosDisponiveis.Cells[0, 1] := EmptyStr;
   sgCreditosDisponiveis.Cells[1, 1] := EmptyStr;
   sgCreditosDisponiveis.Cells[2, 1] := EmptyStr;
   sgCreditosDisponiveis.Cells[3, 1] := EmptyStr;

   sgCreditosDisponiveis.ColWidths[0] := 100;
   sgCreditosDisponiveis.ColWidths[1] := 110;
   sgCreditosDisponiveis.ColWidths[2] := 120;
   sgCreditosDisponiveis.ColWidths[3] := 130;

   valorTotalCreditoDisponivel := 0;

   for I := 0 to Self.listaCreditos.Count - 1 do
   begin
      valorCreditoUsado := TCredito(Self.listaCreditos.Items[I]).GetValorCreditoUsado();
      valorCreditoDisponivel := TCredito(Self.listaCreditos.Items[I]).GetValorCreditoDisponivel();

      // Código do título
      sgCreditosDisponiveis.Cells[0, I+1] := IntToStr(TCredito(Self.listaCreditos.Items[I]).Mensalidade.Codigo);

      // Valor do crédito
      sgCreditosDisponiveis.Cells[1, I+1] := FloatToStrF(TCredito(Self.listaCreditos.Items[I]).ValorCredito, ffNumber, 18, 2, TGeneral.GetFormatSettings());

      // Valor do crédito utilizado
      sgCreditosDisponiveis.Cells[2, I+1] := FloatToStrF(valorCreditoUsado, ffNumber, 18, 2, TGeneral.GetFormatSettings());

      // Valor do crédito disponível
      sgCreditosDisponiveis.Cells[3, I+1] := FloatToStrF(valorCreditoDisponivel, ffNumber, 18, 2, TGeneral.GetFormatSettings());

      valorTotalCreditoDisponivel := valorTotalCreditoDisponivel + valorCreditoDisponivel;
   end;

   lbValorTotalCreditoDisponivel.Caption := Format( lbValorTotalCreditoDisponivel.Caption,
      [valorTotalCreditoDisponivel], TGeneral.GetFormatSettings() );

   lbInformativoValorMaximo.Caption := Format( lbInformativoValorMaximo.Caption,
      [Self.objMensalidade.GetValorTotal()], TGeneral.GetFormatSettings() );
end;

procedure TfrmAplicarCreditoMensalidade.Panel1Resize(Sender: TObject);
begin
   pnResize.Left := Trunc(TPanel(Sender).Width / 2) - Trunc(pnResize.Width/2);
end;

procedure TfrmAplicarCreditoMensalidade.sgCreditosDisponiveisDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   s : string;
   LDelta : integer;
begin
   if (ARow>0) then
   begin
      s := sgCreditosDisponiveis.Cells[ACol, ARow];
      LDelta := sgCreditosDisponiveis.ColWidths[ACol] - Canvas.TextWidth(s);
      sgCreditosDisponiveis.Canvas.TextRect(Rect, Rect.Left+LDelta, Rect.Top+2, s);
   end else begin
      sgCreditosDisponiveis.Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, sgCreditosDisponiveis.Cells[ACol, ARow]);
   end;
end;

end.
