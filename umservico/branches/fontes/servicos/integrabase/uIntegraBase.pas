unit uIntegraBase;

interface

uses
   SysUtils, Variants, Classes, uDMConexao, ZAbstractRODataset, UZDataset,
   uCFuncString, uCFuncConv, uSvcClasses, uCFuncArquivos;

type
   TUMIntegraBase = class;

   {**
      Esta enumeração lista os tipos de retornos válidos para a execução de uma
      rotina de integração. As tipos de retornos possíveis são:
      irrFailed: Falha no processo de integração do registros. Este tipo de
         retorno não pára a execução do processo de integração
      irrError: Erro no processo de integração do registro. Este tipo de retorno
         força a paralização do processo de integração.
      irrSuccess: Registro integrado com sucesso.
   }
   TIntegraRegistroRet = (irrFailed = -1, irrError = 0, irrSuccess = 1);

   {**
      Esta interface deverá ser implementada por toda classe responsável por
      efetuar a uma integração. Possui o cabeçalho do método que deverá ser
      implementado para efetuar a integração de um registro.
   }
   IUMIntegraRegistros = interface
      ['{F1F2F501-340F-4F15-BC28-E7F5D428FDB1}']
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

   {**
      Esta classe é responsável por efetuar a consulta dos registros na base de
      dados que deverão ser integrados, bem como a atualização desses registros
      após o processo de integração. 
   }
   TUMIntegraBase = class(TObject)
   strict private
      FQyAtualiza: TUMZQuery;
      FUMFileLogger: TUMFileLogger;
      FQyRegistros: TUMZReadOnlyQuery;
   public
      constructor Create(AUMConn: TUMConexao; const ASNumReg: string);
      destructor Destroy; override;
      procedure setLogger(AUMFileLogger: TUMFileLogger);
      function IntegraPendentes(
         const AICodParceiro: Integer;
         AUMIntegraRegistros: IUMIntegraRegistros): boolean;
   end;


implementation

const
   SQL_GET_REGISTROS =
      'SELECT '+
         'cd_integracao,'+
         'cd_parceiro,'+
         'ds_acao,'+
         'ds_chave,'+
         'dt_registro,'+
         'me_extra '+
      'FROM '+
         'nu_integracao '+
      'WHERE '+
         'sn_integrado = 0 AND '+
         'cd_parceiro = :cd_parceiro '+
      'ORDER BY '+
         'dt_registro ASC '+
      'LIMIT '+
         ':limite';

   SQL_GET_REGISTROS_ORACLE =
      'SELECT '+
         'cd_integracao,'+
         'cd_parceiro,'+
         'ds_acao,'+
         'ds_chave,'+
         'dt_registro,'+
         'me_extra '+
      'FROM '+
         'nu_integracao '+
      'WHERE '+
         'sn_integrado = 0 AND '+
         'cd_parceiro = :cd_parceiro AND '+
         'ROWNUM <= :limite '+
      'ORDER BY '+
         'dt_registro ASC ';

   SQL_ATU_REGISTROS =
      'UPDATE nu_integracao '+
      'SET '+
         'sn_integrado = :sn_integrado,'+
         'ds_erro = :ds_erro '+
      'WHERE '+
         'cd_integracao = :cd_integracao';

{ TUMIntegraBase }

constructor TUMIntegraBase.Create(AUMConn: TUMConexao; const ASNumReg: string);
var
   INumReg: integer;
begin
   inherited Create;   
   Self.FQyRegistros := AUMConn.newROQuery;
   Self.FQyAtualiza := AUMConn.newQuery;
   Self.FQyRegistros.ParamCheck := True;
   Self.FQyAtualiza.ParamCheck := True;

   if ( AUMConn.Conn.Protocol = DB_PROTOCOL_ORACLE ) then
      Self.FQyRegistros.SQL.Text := SQL_GET_REGISTROS_ORACLE
   else
      Self.FQyRegistros.SQL.Text := SQL_GET_REGISTROS;

   Self.FQyAtualiza.SQL.Text := SQL_ATU_REGISTROS;
   try
      INumReg := StrToInt(ASNumReg);
   except
      on E: EConvertError do INumReg := 100;
   end;
   FQyRegistros.ParamByName('limite').AsInteger := INumReg;
end;

destructor TUMIntegraBase.Destroy;
begin
   Self.FQyRegistros.Free;
   Self.FQyAtualiza.Free;
   Self.FUMFileLogger.Free;
   inherited Destroy;
end;

function TUMIntegraBase.IntegraPendentes(
         const AICodParceiro: Integer;
         AUMIntegraRegistros: IUMIntegraRegistros): boolean;
var
   LIRRRetorno: TIntegraRegistroRet;
   LSErro: string;
begin
   Result := True;
   Self.FQyRegistros.ParamByName('cd_parceiro').AsInteger := AICodParceiro;
   try
      Self.FQyRegistros.Open;
   except
      on E: Exception do
      begin
         Self.FUMFileLogger.log('Erro: ' + E.Message);
         Result := False;
         Exit;
      end;
   end;
   while not Self.FQyRegistros.IsEmpty do
   begin
      while not Self.FQyRegistros.Eof do
      begin
         LSErro := '';
         LIRRRetorno :=
         AUMIntegraRegistros.IntegraRegistro(
            Self,
            Self.FQyRegistros.FieldByName('cd_integracao').AsInteger,
            Self.FQyRegistros.FieldByName('cd_parceiro').AsInteger,
            Self.FQyRegistros.FieldByName('ds_acao').AsString[1],
            Self.FQyRegistros.FieldByName('ds_chave').AsString,
            Self.FQyRegistros.FieldByName('me_extra').AsString, LSErro,
            Self.FQyRegistros.FieldByName('dt_registro').AsDateTime);

         Self.FQyAtualiza.ParamByName('cd_integracao').AsInteger :=
            Self.FQyRegistros.FieldByName('cd_integracao').AsInteger;
            
         case LIRRRetorno of
            irrFailed:
            begin
               Self.FQyAtualiza.ParamByName('sn_integrado').AsInteger := 2;
               Self.FQyAtualiza.ParamByName('ds_erro').AsString := LSErro;
            end;
            irrSuccess:
            begin
               Self.FQyAtualiza.ParamByName('sn_integrado').AsInteger := 1;
               Self.FQyAtualiza.ParamByName('ds_erro').Clear;
            end;
            else
            begin
               Self.FQyRegistros.Close;
               Self.FQyAtualiza.Close;
               Result := False;
               Exit;
            end;
         end;
         try
            Self.FQyAtualiza.ExecSQL;
         except
            on E: Exception do
            begin
               Self.FUMFileLogger.log('Erro: ' + E.Message);
               Result := False;
               Exit;
            end;
         end;
         Self.FQyAtualiza.Close;
         Self.FQyRegistros.Next;
      end;
      Self.FQyRegistros.Close;
      try
         Self.FQyRegistros.Open;
      except
         on E: Exception do
         begin
            Self.FUMFileLogger.log('Erro: ' + E.Message);
            Result := False;
            Exit;
         end;
      end;
   end;
end;

procedure TUMIntegraBase.setLogger(AUMFileLogger: TUMFileLogger);
begin
   Self.FUMFileLogger := AUMFileLogger;
end;

end.
