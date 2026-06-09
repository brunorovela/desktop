unit uTratamentoExcecaoExtraCurricular;

interface

uses
   uITratamentoExcecao, SysUtils;

type
   TTratamentoExcecaoExtraCurricular = class(TInterfacedObject, ITratamentoExcecao)
      private
         Function TrataExcecao(Sender: TObject; E: Exception): IExcecao;
   end;

implementation

{ TTratamentoExecaoPadrao }

function TTratamentoExcecaoExtraCurricular.TrataExcecao(Sender: TObject;
  E: Exception): IExcecao;
const
   SModel =
      'Class Name: %s'#13#10'Message: %s';
begin
   Result.Aviso := False;
   Result.Mensagem := Format(SModel, [E.ClassName, E.Message]);
end;

end.
