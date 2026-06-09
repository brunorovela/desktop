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

unit uSvcIntegraBiblioshop;

interface

uses
   SysUtils, Variants, Classes, uSvcClasses, uDMConexao, uIntegraBase, IniFiles;

const
   INTEGRA_BIBLIOSHOP_PESSOAS = 2;

type
   TUMSvcIntegraBiblioshop = class(TUMServiceDefault)
   private
      { Private declarations }
      FConnUnimestre: TUMConexao;
      FConnBiblioshop: TUMConexao;
      function GetConexaoBiblioshop: TUMConexao;
      function GetConexaoUnimestre: TUMConexao;
      function processaIntegracaoBiblioshopPessoa(): Boolean;
   public
      { Public declarations }
      constructor Create();
      procedure onLoadServico(); override;
      function processa(): IUMServiceAppRet; override;
      procedure onUnloadServico(); override;
      procedure stopProcessamento(); override;
      property ConnUnimestre: TUMConexao read GetConexaoUnimestre;
      property ConnBiblioshop: TUMConexao read GetConexaoBiblioshop;
   end;

implementation

uses
   uSvcIntegraBiblioshopPessoa;

constructor TUMSvcIntegraBiblioshop.Create;
begin
   inherited;
end;

procedure TUMSvcIntegraBiblioshop.onLoadServico;
begin
   FConnUnimestre := TUMConexao.Create();
   FConnBiblioshop := TUMConexao.Create();

   FConnUnimestre.Conectar(Config, 'Conexao', false);

   if not FConnUnimestre.getConexao.Connected then begin
      Log.log('Não foi possível efetuar conexão com o UNIMESTRE: ' + FConnUnimestre.LastErro);
      Exit;
   end;

   FConnBiblioshop.Conectar(Config, 'Conexao.Biblioshop', false);
   if not FConnBiblioshop.getConexao.Connected then begin
      Log.log('Não foi possível efetuar conexão com o BIBLIOSHOP: ' + FConnBiblioshop.LastErro);
      Exit;
   end;

end;

function TUMSvcIntegraBiblioshop.processa: IUMServiceAppRet;
begin
   if not FConnUnimestre.Conn.Connected then FConnUnimestre.Conectar(Config, 'Conexao', false);
   if not FConnBiblioshop.Conn.Connected then FConnBiblioshop.Conectar(Config, 'Conexao.Biblioshop', false);

   if ((not FConnUnimestre.IsConectado()) or (not FConnBiblioshop.IsConectado())) then begin
      Log.log('Não foi possível integrar: SEM CONEXAO COM UMA DAS PARTES');
      Result := srError;
      Exit;
   end;
   if Config.ReadString('Servicos.Integrar', 'Pessoas', '0') = '1' then
      processaIntegracaoBiblioshopPessoa;
   Result := srSuccess;
end;

procedure TUMSvcIntegraBiblioshop.onUnloadServico;
begin
   if FConnUnimestre.Conn.Connected then FConnUnimestre.Conn.Disconnect;
   if FConnBiblioshop.Conn.Connected then FConnBiblioshop.Conn.Disconnect;
   FConnUnimestre.Free;
   FConnBiblioshop.Free;
end;

procedure TUMSvcIntegraBiblioshop.stopProcessamento;
begin
end;

function TUMSvcIntegraBiblioshop.processaIntegracaoBiblioshopPessoa: Boolean;
var
   oIntegraPessoa: TUMSvcIntegraBiblioshopPessoa;
   oIntegraBase: TUMIntegraBase;
begin
   oIntegraBase := TUMIntegraBase.Create(FConnUnimestre, Config.ReadString('Configuracoes', 'NrRegistroIteracao', '500'));

   oIntegraBase.setLogger(Log);

   oIntegraPessoa := TUMSvcIntegraBiblioshopPessoa.Create(Self);
   Result := oIntegraBase.IntegraPendentes(INTEGRA_BIBLIOSHOP_PESSOAS, oIntegraPessoa);
end;

function TUMSvcIntegraBiblioshop.GetConexaoUnimestre: TUMConexao;
begin
   Result := FConnUnimestre;
end;

function TUMSvcIntegraBiblioshop.GetConexaoBiblioshop: TUMConexao;
begin
   Result := FConnBiblioshop;
end;

initialization
   RegisterClass(TUMSvcIntegraBiblioshop);

finalization
   UnRegisterClass(TUMSvcIntegraBiblioshop);

end.
