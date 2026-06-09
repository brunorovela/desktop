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
var
   ds_tabela : String;
   pos_ini, pos_fim : Integer;
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

      // Iremos pegar o nome da tabela a partir do Exception gerada(E.Message)
      ds_tabela := '';
      pos_ini := 0;
      pos_fim := 0;

      pos_ini := Pos('/', E.Message)+1;
      if ( pos_ini < 2 ) then
      begin
         pos_ini := Pos('`.`', E.Message)+3;
      end;

      pos_fim := Pos('`, CONSTRAINT', E.Message);

      ds_tabela := Copy(E.Message, pos_ini, (pos_fim-pos_ini));
                                                                    
      Result.Aviso := True;
      Result.Mensagem := 'Não é possível excluir o registro selecionado, ele está sendo usado em outro módulo do sistema.';

      // Só adiciona este trecho se tem a tabela que o erro ocorreu
      if ( length(ds_tabela) > 0 ) then
      begin
         Result.Mensagem := Result.Mensagem + #13 + 'Tabela(s) envolvida(s):' + #13;
         Result.Mensagem := Result.Mensagem + ds_tabela;
      end;
      
   end
   else
   begin
      Result.Aviso := False;
      Result.Mensagem := Format(SModel, [E.ClassName, E.Message]);
   End;
end;

end.
