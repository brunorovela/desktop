unit uTratamentoExcecaoAdm;

interface

uses
   uITratamentoExcecao, SysUtils;

type
   {ATENÇÃO: Adicionar algum novo tratamento de exceção nesta Unit, somente se
   á exceção for utilizada em TODOS os módulos do sistema.}
   TTratamentoExcecaoAdm = class(TInterfacedObject, ITratamentoExcecao)
      private
         Function TrataExcecao(Sender: TObject; E: Exception): IExcecao;
   end;

implementation

{ TTratamentoExecaoPadrao }

function TTratamentoExcecaoAdm.TrataExcecao(Sender: TObject;
  E: Exception): IExcecao;
const
   SModel =
      'Class Name: %s'#13#10'Message: %s';
begin
   if Pos('Duplicate entry', E.Message) > 0 then
   begin
     Result.Aviso := True;
     Result.Mensagem := 'Cadastro Duplicado! O sistema detectou informações duplicadas neste cadastro.';
   end
   else if Pos('Cannot delete or update a parent row', E.Message) > 0 then
   begin
      Result.Aviso := True;
      Result.Mensagem := 'Não é possível excluir o registro selecionado, ele está sendo usado em outro módulo do sistema.';
   end
   else if Pos('SQL Error: MySQL server has gone away', E.Message) > 0 then
   begin
      Result.Aviso := True;
      Result.Mensagem := 'Sua estação de trabalho perdeu conexão com o Servidor'+
         ' Unimestre. O sistema será fechado';
      Result.Termina := True;
   end
   else
   begin
      Result.Aviso := False;
      Result.Mensagem := Format(SModel, [E.ClassName, E.Message]);
   end;
end;

end.
