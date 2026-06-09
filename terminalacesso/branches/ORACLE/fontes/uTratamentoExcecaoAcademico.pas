unit uTratamentoExcecaoAcademico;

interface

uses
   uITratamentoExcecao, SysUtils, uDM, DBCtrls;

type
   TTratamentoExcecaoAcademico = class(TInterfacedObject, ITratamentoExcecao)
      private
         Function TrataExcecao(Sender: TObject; E: Exception): IExcecao;
   end;

implementation

uses uTratamentoExcecaoPadrao;

{ TTratamentoExecaoPadrao }

function TTratamentoExcecaoAcademico.TrataExcecao(Sender: TObject;
  E: Exception): IExcecao;
const
   SModel =
      'Class Name: %s'#13#10'Message: %s';
begin

   Result.Termina := False;
   Result.snErroBanco := false;

   if (Pos('SQL Error', E.Message) > 0) and (DM.db.Ping = False) then
   begin
      Result.Aviso := True;
      Result.Mensagem := 'Falha na conexão: o UNIMESTRE não está mais conseguindo se conectar ao banco de dados. O sistema será fechado.';
      Result.snErroBanco := true;
   end
   else if Pos('Duplicate entry', E.Message) > 0 then
   begin
      Result.Aviso := True;
      Result.Mensagem := 'Cadastro Duplicado! O sistema detectou informações duplicadas neste cadastro.';
   end
   else if Pos('is not a valid date and time', E.Message) > 0 then
   begin
      if Sender is TDBEdit then
      begin
         TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).Clear;
      end;
   end
   else if Pos('Invalid input value', E.Message) > 0 then
   begin
      if Sender is TDBEdit then
      begin
         TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).Clear;
      end;
   end
   else if Pos('Non-blob', E.Message) > 0 then begin
      //erro do BDE, não achamos o problema então ignoramos o erro pois nao fazia diferença nos campos MEMO
   end
   else if ( Sender.ClassName = 'TUMGrid' ) AND (Pos('cannot be modified', E.Message) > 0) then begin
      // Não temos como tratar esse erro, então somente ignoramos
   end
   else if Pos('Cannot delete or update a parent row', E.Message) > 0 then
   begin
      Result.Aviso := True;
      Result.Mensagem := 'Não é possível excluir o registro selecionado, ele está sendo usado em outro módulo do sistema.';
   end
   else
   begin
      Result.Aviso := False;
      Result.Mensagem := Format(SModel, [E.ClassName, E.Message]);
   End;
end;

end.

