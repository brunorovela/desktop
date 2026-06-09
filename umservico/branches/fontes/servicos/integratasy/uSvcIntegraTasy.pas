{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}

unit uSvcIntegraTasy;

interface

uses
   uSvcClasses, IniFiles, uDMConexao, SysUtils, uIntegraBase, Classes;

const
   INTEGRA_TASY_PESSOAS = 1;

type
   TUMSvcIntegraTasy = class(TUMServiceDefault)
   private
      FConnUnimestre: TUMConexao;
      FConnTasy: TUMConexao;
      function GetConexaoUnimestre: TUMConexao;
      function GetConexaoTasy: TUMConexao;
      function processaIntegracaoTasyPessoa: boolean;
   public
      constructor Create;
      procedure onLoadServico; override;
      function processa: IUMServiceAppRet; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
      property ConnUnimestre: TUMConexao read GetConexaoUnimestre;
      property ConnTasy: TUMConexao read GetConexaoTasy;
   end;

implementation

uses
   uSvcIntegraTasyPessoa;

{ TUMSvcIntegraTasy }

constructor TUMSvcIntegraTasy.Create;
begin
   inherited;
end;

function TUMSvcIntegraTasy.GetConexaoTasy: TUMConexao;
begin
   Result := Self.FConnTasy;
end;

function TUMSvcIntegraTasy.GetConexaoUnimestre: TUMConexao;
begin
   Result := Self.FConnUnimestre;
end;

procedure TUMSvcIntegraTasy.onLoadServico;
begin
   Self.FConnUnimestre := TUMConexao.Create;
   Self.FConnTasy := TUMConexao.Create;

   Self.FConnUnimestre.Conectar(Config, 'Conexao', false);
   if not (Self.FConnUnimestre.getConexao.Connected) then begin
      Self.Log.log('Não foi possível efetuar conexão com o UNIMESTRE: Abortando!');
      Exit;
   end;

   Self.FConnTasy.Conectar(Config, 'Conexao.Tasy', false);
   if not (Self.FConnTasy.getConexao.Connected) then begin
      Self.Log.log('Não foi possível efetuar conexão com o TASY: Abortando!');
   end;
end;

procedure TUMSvcIntegraTasy.onUnloadServico;
begin
   if Self.FConnUnimestre.getConexao.Connected then Self.FConnUnimestre.getConexao.Disconnect;
   if Self.FConnTasy.getConexao.Connected then Self.FConnTasy.getConexao.Disconnect;
   Self.FConnUnimestre.Free;
   Self.FConnTasy.Free;     
end;

function TUMSvcIntegraTasy.processa: IUMServiceAppRet;
begin
   try
      if not (Self.FConnUnimestre.getConexao.Connected) then Self.FConnUnimestre.Conectar(Config, 'Conexao', false);
   except
      on E: Exception do
         Log.log('[ERRO] Conexão Unimestre : ' + E.Message);
   end;
   try
      if not (Self.FConnTasy.getConexao.Connected) then Self.FConnTasy.Conectar(Config, 'Conexao.Tasy', false);
   except
      on E: Exception do
         Log.log('[ERRO] Conexão Tasy : ' + E.Message);
   end;

   if not Self.FConnUnimestre.IsConectado then begin
      Self.Log.log('Não foi possível efetuar conexão com o UNIMESTRE: ' + Self.FConnUnimestre.LastErro);
      Result := srError;
   end;

   if not Self.FConnTasy.IsConectado then begin
      Self.Log.log('Não foi possível efetuar conexão com o TASY: ' + Self.FConnTasy.LastErro);
      Result := srError;
   end;

   if Result = srError then Exit;
   

//   if not (Self.FConnUnimestre.IsConectado and Self.FConnTasy.IsConectado) then begin
//      Self.Log.log('Não foi possível integrar: SEM CONEXAO COM UMA DAS PARTES');
//      Result := srError;
//      Exit;
//   end;

   if Self.Config.ReadString('Servicos.Integrar', 'Pessoa', '0') = '1' then begin
      Self.processaIntegracaoTasyPessoa;
      Self.Log.log('Integrando pessoas ...');
   end;

   Result := srSuccess;
end;

function TUMSvcIntegraTasy.processaIntegracaoTasyPessoa: boolean;
var
   oObject: TUMSvcIntegraTasyPessoa;
   oIntegraBase: TUMIntegraBase;
begin
   oIntegraBase := TUMIntegraBase.Create(Self.FConnUnimestre, Self.Config.ReadString('Configuracoes', 'NrRegistroIteracao', '500'));
   oIntegraBase.setLogger(Self.Log);
   oObject := TUMSvcIntegraTasyPessoa.Create(Self);
   Result := oIntegraBase.IntegraPendentes(INTEGRA_TASY_PESSOAS, oObject);
   if not Result then Self.Log.log('[ERRO] ao tentar integrar Pessoas...');
end;

procedure TUMSvcIntegraTasy.stopProcessamento;
begin
   inherited;
end;

initialization
   RegisterClass(TUMSvcIntegraTasy);

finalization
   RegisterClass(TUMSvcIntegraTasy);

end.
