unit uCobrancaHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
   TfCobrancasHistorico = class(TForm)
    lbUsuario: TLabel;
    FmmHistorico: TMemo;
    FlbHistorico: TLabel;
    FdtRegistro: TLabel;
    FlbDtRetorno: TLabel;
   strict private
   { Private declarations }
      procedure testaCamposVazios(descricao:string; var campo:TLabel);
   public
   { Public declarations }
      constructor Create(dsHistorico: string; dsUsuario: string; dtRegistro: string; dtRetorno: string;pai:TComponent);
   end;

var
  fCobrancasHistorico: TfCobrancasHistorico;

implementation

{$R *.dfm}

{ TfCobrancasHistorico }

constructor TfCobrancasHistorico.Create(dsHistorico: string; dsUsuario: string; dtRegistro: string; dtRetorno: string; pai: TComponent);
begin
   inherited Create(pai);
   fmmHistorico.Text := dsHistorico;

   testaCamposVazios(dsUsuario,lbUsuario);
   testaCamposVazios(dtRegistro,FdtRegistro);
   testaCamposVazios(dtRetorno,FlbDtRetorno);

end;

{
 Função que irá atribuir o valor correto para o campo caso ele tenha sido digitado ou não
}
procedure TfCobrancasHistorico.testaCamposVazios(descricao: string;
  var campo: TLabel);
begin
   //se a descrição for vazia coloca um traço
   if descricao = '' then
   begin
      campo.Caption := campo.Caption + ' -- ';
   end
   else
   begin
      campo.Caption := campo.Caption + descricao;
   end;

end;

end.

