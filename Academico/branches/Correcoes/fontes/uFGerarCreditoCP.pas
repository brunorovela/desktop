unit uFGerarCreditoCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UMEditMonetario, uCompromissos, uCreditoCP;

type
   TfrmGerarCreditoCP = class(TForm)
      paCabecalho: TPanel;
      edMensalidade: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      mmMotivo: TMemo;
      Panel1: TPanel;
      pnResize: TPanel;
      Button1: TBitBtn;
      Button2: TBitBtn;
      Panel2: TPanel;
      lbAviso1: TLabel;
      lbAviso2: TLabel;
      lbInformativoValorMaximo: TLabel;
      edValorCredito: TUMEditMonetario;
      procedure edValorCreditoExit(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure Panel2Resize(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Panel1Resize(Sender: TObject);

      strict private
         { Private declarations }
         objCompromisso: TCompromisso;
         objCredito: TCreditoCP;

      public
         { Public declarations }
         property Compromisso: TCompromisso read objCompromisso write objCompromisso;
   end;

implementation

uses
   uLoginManager, UZDataset, uGeneral, uUsuario, DB, uExceptions, uUMNucleo;

{$R *.dfm}

{ TfrmGerarCreditoMensalidade }

procedure TfrmGerarCreditoCP.Button2Click(Sender: TObject);
var
   inserir : Boolean;
begin
   if (edValorCredito.getValorDouble() > objCompromisso.ValorPago) OR
      (edValorCredito.getValorDouble() = 0) then
   begin
      TGeneral.Mensagem('Valor inválido. Não é possível gerar um crédito com valor superior ao valor pago na mensalidade ou valor igual a 0 (zero).', '', MB_OK + MB_ICONEXCLAMATION, Handle);
      Self.ModalResult := mrNone;
      Exit;
   end;

   inserir := (objCredito = nil);
   if inserir then
   begin
      objCredito := TCreditoCP.Create();
      objCredito.Compromisso := objCompromisso;
   end else begin
      { Caso não seja uma inclusão, então devemos testar se o novo valor digitado, está dentro do valor permitido }
      if edValorCredito.getValorDouble() < objCredito.GetValorCreditoCPUsado() then
      begin
         TGeneral.Mensagem('Valor inválido. Não é possível alterar um crédito com valor inferior ao valor de crédito já utilizado em outras mensalidades.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
         Self.ModalResult := mrNone;
         Exit;
      end;
   end;

   objCredito.ValorCreditoCP := edValorCredito.getValorDouble();
   objCredito.Motivo := mmMotivo.Lines.Text;
   objCredito.Usuario := TLoginManager.GetInstancia().GetDM().GetUsuarioLogado().Pessoa;

   if inserir then
   begin
      TCreditoCP.Inserir(objCredito);
   end else begin
      TCreditoCP.Alterar(objCredito);
   end;
end;

procedure TfrmGerarCreditoCP.edValorCreditoExit(Sender: TObject);
begin
   if (edValorCredito.getValorDouble() > objCompromisso.ValorPago) OR
      (edValorCredito.getValorDouble() = 0) OR
      (
         (objCredito <> nil) AND
         (edValorCredito.getValorDouble() < objCredito.GetValorCreditoCPUsado())
      ) then
   begin
      edValorCredito.Color := clRed;
   end else begin
      edValorCredito.Color := clWindow;
   end;
end;

procedure TfrmGerarCreditoCP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmGerarCreditoCP.FormCloseQuery(Sender: TObject;
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

procedure TfrmGerarCreditoCP.FormCreate(Sender: TObject);
begin
   Self.objCompromisso := nil;
   Self.objCredito := nil;
end;

procedure TfrmGerarCreditoCP.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
   begin
      Self.Close();
   end;
end;

procedure TfrmGerarCreditoCP.FormShow(Sender: TObject);
var
   mensalidade: TCompromisso;
   valorMinimo: Double;
begin
   if (objCompromisso = nil) OR NOT(objCompromisso is TCompromisso) then
   begin
      TGeneral.Mensagem('Mensalidade inválida. Opercação cancelada.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
      Self.Close();
      Exit;
   end;

   edMensalidade.Text := IntToStr(objCompromisso.Codigo);
   valorMinimo := 0;

   try
      Self.objCredito := TCreditoCP.GetCreditoCPFromCompromisso(objCompromisso);

      edValorCredito.setValor(objCredito.ValorCreditoCP);
      mmMotivo.Lines.Text := objCredito.Motivo;

      valorMinimo := Self.objCredito.GetValorCreditoCPUsado();
   except
      on E:TExceptionDatabase do
      begin
         edValorCredito.setValor(objCompromisso.ValorPago);
         mmMotivo.Lines.Clear();
      end;
   end;

   if valorMinimo > 0 then
   begin
      lbInformativoValorMaximo.Caption := Format(
         '(valor mínimo: %m / valor máximo: %m)',
         [valorMinimo, objCompromisso.ValorPago],
         TGeneral.GetFormatSettings()
      );
   end else begin
      lbInformativoValorMaximo.Caption := Format(
         '(valor máximo: %m)',
         [objCompromisso.ValorPago],
         TGeneral.GetFormatSettings()
      );
   end;

   edValorCredito.SetFocus();
end;

procedure TfrmGerarCreditoCP.Panel1Resize(Sender: TObject);
begin
   pnResize.Left := Trunc(TPanel(Sender).Width / 2) - Trunc(pnResize.Width/2);
end;

procedure TfrmGerarCreditoCP.Panel2Resize(Sender: TObject);
begin
   lbAviso1.Left := Trunc(TPanel(Sender).Width / 2) - Trunc(lbAviso1.Width/2);
   lbAviso2.Left := Trunc(TPanel(Sender).Width / 2) - Trunc(lbAviso2.Width/2);
end;

end.
