unit uFMensagemDinamica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ButtonGroup, StdCtrls;

type
   TButtonCustomizado = class(TButton)
      public
         valor: Variant;
   end;

  TfMensagemDinamica = class(TForm)
    pnGeral: TPanel;
    pnBotoes: TPanel;
    pnMensagem: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Sair(Sender: TObject);
    procedure submit(Sender: TObject);
  public
    { Public declarations }
    flgSearch : Boolean;
    valor : Variant;

    procedure setMensagem(const msg: String);
    procedure setTitulo(titulo: String = '');
    procedure carregaBotoes(var Botoes: array of Variant; mostra_cancelar: Boolean = True);
  end;

var
  fMensagemDinamica: TfMensagemDinamica;

implementation

{$R *.dfm}

procedure TfMensagemDinamica.carregaBotoes(var Botoes: array of Variant; mostra_cancelar: Boolean);
var
   i, ordem, LarguraPanel, total: Integer;
   botaoDinamico: TButton;
   aux: Double;
begin
   aux := (High(Botoes)+1)/3;
   total := StrToInt(FloatToStr(aux));

   if mostra_cancelar then
      Inc(total);
   

   LarguraPanel := 350;

   I := 0;
   ordem := 0;
   while I < High(Botoes) do
   begin
      botaoDinamico := TButtonCustomizado.Create(nil);

      // Propriedades de cada botão
      TButtonCustomizado(botaoDinamico).Parent := pnBotoes;
      TButtonCustomizado(botaoDinamico).Left := (LarguraPanel - (65*total) + (67*ordem));
      TButtonCustomizado(botaoDinamico).Top := 6;
      TButtonCustomizado(botaoDinamico).Width := 130;
      TButtonCustomizado(botaoDinamico).Height := 25;
      TButtonCustomizado(botaoDinamico).Caption := VarToStr(Botoes[I]);
      TButtonCustomizado(botaoDinamico).Name := 'btnSubmit'+inttostr(ordem);
      TButtonCustomizado(botaoDinamico).valor := Botoes[I+1];
      TButtonCustomizado(botaoDinamico).Enabled := (Botoes[I+2] = True);
      TButtonCustomizado(botaoDinamico).TabOrder := ordem;
      TButtonCustomizado(botaoDinamico).OnClick := submit;
         
      Inc(ordem);
      total := total-1;
      I := I+3;
   end;

   if not mostra_cancelar then
      Exit;
   
   botaoDinamico := TButtonCustomizado.Create(nil);

   TButtonCustomizado(botaoDinamico).Parent := pnBotoes;
   TButtonCustomizado(botaoDinamico).Left := (LarguraPanel - (65*total) + (67*ordem));
   TButtonCustomizado(botaoDinamico).Top := 6;
   TButtonCustomizado(botaoDinamico).Width := 130;
   TButtonCustomizado(botaoDinamico).Height := 25;
   TButtonCustomizado(botaoDinamico).Caption := 'Cancelar';
   TButtonCustomizado(botaoDinamico).Name := 'btnCancelar';
   TButtonCustomizado(botaoDinamico).TabOrder := ordem;
   TButtonCustomizado(botaoDinamico).OnClick := sair;
end;

procedure TfMensagemDinamica.FormShow(Sender: TObject);
begin
   flgSearch := False;
   valor := 0;
end;

procedure TfMensagemDinamica.Sair(Sender: TObject);
begin
   Close;
end;

procedure TfMensagemDinamica.setMensagem(const msg: String);
begin
   pnMensagem.Caption := msg;
end;

procedure TfMensagemDinamica.setTitulo(titulo: String);
begin
   if (titulo = '') then
      titulo := Application.Title;

   fMensagemDinamica.Caption := titulo;
end;

procedure TfMensagemDinamica.submit(Sender: TObject);
begin
   valor := TButtonCustomizado(Sender).valor;
   flgSearch := true;
   Close();
end;

end.
