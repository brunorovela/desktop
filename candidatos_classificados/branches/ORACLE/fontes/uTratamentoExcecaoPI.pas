unit uTratamentoExcecaoPI;

interface

uses
   uITratamentoExcecao, SysUtils, DBCtrls;

type
   {ATENÇÃO: Adicionar algum novo tratamento de exceção nesta Unit, somente se
   á exceção for utilizada em TODOS os módulos do sistema.}
   TTratamentoExcecaoPI = class(TInterfacedObject, ITratamentoExcecao)
      private
         Function TrataExcecao(Sender: TObject; E: Exception): IExcecao;
   end;

implementation

{ TTratamentoExecaoPadrao }

function TTratamentoExcecaoPI.TrataExcecao(Sender: TObject;
  E: Exception): IExcecao;
const
   SModel =
      'Class Name: %s'#13#10'Message: %s';
begin
   if Pos('Lost Conn', E.Message) > 0 then
   begin
      Result.Mensagem := 'O sistema perdeu a conexão com o banco '+
         'de dados e irá ser fechado';
      Result.Aviso := True;
      Result.Termina := True;
   end
   else if Pos('Duplicate entry', E.Message) > 0 then
   begin
      Result.Aviso := True;
      Result.Mensagem := 'Cadastro Duplicado! O sistema detectou informações duplicadas neste cadastro.';
   end
   else if Pos('is not a valid date and time', E.Message) > 0 then begin
      if Sender is TDBEdit then
      begin
         TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).Clear;
      end;
   end
   else if Pos('Invalid input value', E.Message) > 0 then begin
      if Sender is TDBEdit then
      begin
         TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).Clear;
      end;
   end
   else if Pos('Non-blob', E.Message) > 0 then begin
      //erro do BDE, não achamos o problema então ignoramos o erro pois nao fazia diferença nos campos MEMO
   end
   else begin
      Result.Aviso := False;
      Result.Mensagem := Format(SModel, [E.ClassName, E.Message]);      
   end;
end;

end.
