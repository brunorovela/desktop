unit uTratamentoExcecaoExportacao;

interface

uses
   uITratamentoExcecao, SysUtils, uDM, DBCtrls;

type
   TTratamentoExcecaoExportacao = class(TInterfacedObject, ITratamentoExcecao)
      private
         Function TrataExcecao(Sender: TObject; E: Exception): IExcecao;
   end;

implementation

uses uTratamentoExcecaoPadrao;

{ TTratamentoExecaoPadrao }

function TTratamentoExcecaoExportacao.TrataExcecao(Sender: TObject;
  E: Exception): IExcecao;
const
   SModel =
      'Class Name: %s'#13'Message: %s';
begin
   Result.Aviso := False;
   Result.Mensagem := Format(SModel, [E.ClassName, E.Message]);
end;

end.
