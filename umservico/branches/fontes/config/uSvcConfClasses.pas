unit uSvcConfClasses;

interface

uses
   Classes, IniFiles, SysUtils, uCFuncString;

const
   C_IC_SERVICOS_INTEGRACAO = 'Servicos.Integrar';
   C_IS_CONFIGURACOES = 'Configuracoes';
   C_IV_INTERVALO = 'Intervalo';
   C_IV_INTERVALO_ENTRE_EXECUCOES = 'IntervaloEntreExecucoes';
   C_IV_NUM_REGISTRO_INTEGRACAO = 'NrRegistroIteracao';
   C_IS_RECADOS = 'Email.SMTP';
   C_IV_SMTP_SERVIDOR = 'Servidor';
   C_IV_SMTP_USUARIO = 'Usuario';
   C_IV_SMTP_SENHA = 'Senha';
   C_IV_SMTP_REMETENTE = 'Remetente';
   C_IV_SMTP_NOME = 'Nome';
   C_IV_SMTP_DOMINIO = 'Dominio';
   C_IV_SMTP_ORGANIZACAO = 'Organizacao';
   C_IV_SMTP_INTERVALO = 'Intervalo';
   C_IV_SMTP_LIMITE = 'Limite';
   C_IV_SMTP_PORTA = 'Porta';
   CONN_SERVIDOR = 'Servidor';
   CONN_PORTA = 'Porta';
   CONN_BANCO = 'Banco';
   CONN_PROTOCOLO = 'Protocolo';
   CONN_USUARIO = 'Usuario';
   CONN_SENHA = 'Senha';

type
   TUMTipoIntervalo = (tiMinuto, tiHora, tiDia);

   TUMServicos = (svcBiblioshop, svcTasy, svcBorges, svcRecados);

   IUMSvcArquivoIni = interface(IUnknown)
      ['{066B841A-9749-434A-8AB3-30EA4E9BE6AA}']
      procedure Salva;
      procedure CarregaConfiguracao;
      procedure SetIntervalo(const AIntervalo: integer);
      procedure SetTipoIntervalo(const ATipoIntervalo: TUMTipoIntervalo);
      procedure SetIntervaloEntreExecucoes(const AIntervaloEntreExecucoes: boolean);
      function GetIntervalo: integer;
      function GetTipoIntervalo: TUMTipoIntervalo;
      function UsaIntervaloEntreExecucoes: boolean;
      property Intervalo: integer read GetIntervalo write SetIntervalo;
      property TipoIntervalo: TUMTipoIntervalo read GetTipoIntervalo write SetTipoIntervalo;
      property IntervaloEntreExecucoes: boolean read UsaIntervaloEntreExecucoes write SetIntervaloEntreExecucoes;
   end;

   TUMSvcArquivoIniBase = class(TInterfacedObject, IUMSvcArquivoIni)
   protected
      FIniFile: TIniFile;
      FCaminhoIni: string;
      FIntervalo: integer;
      FIntervaloEntreExecucoes: boolean;
      FUMTipoIntervalo: TUMTipoIntervalo;
      procedure CarregaConfiguracao;
      procedure SetIntervalo(const AIntervalo: integer);
      procedure SetTipoIntervalo(const ATipoIntervalo: TUMTipoIntervalo);
      procedure SetIntervaloEntreExecucoes(const AIntervaloEntreExecucoes: boolean);
      function GetIntervalo: integer;
      function GetTipoIntervalo: TUMTipoIntervalo;
      function UsaIntervaloEntreExecucoes: boolean;
   public
      constructor Create(const ACaminhoIni: string);
      destructor Destroy; override;
      procedure Salva;
      property Intervalo: integer read GetIntervalo write SetIntervalo;
      property TipoIntervalo: TUMTipoIntervalo read GetTipoIntervalo write SetTipoIntervalo;
      property IntervaloEntreExecucoes: boolean read UsaIntervaloEntreExecucoes write SetIntervaloEntreExecucoes;
   end;

   TUMSvcIntegracaoIni = class(TUMSvcArquivoIniBase)
   strict protected
      FServicos: TStringList;
      FNumRegistrosIteracao: integer;
      procedure CarregaConfiguracao;
      function GetNumRegistrosIteracao: integer;
      procedure SetNumRegistrosIteracao(const ANumRegistrosIteracao: integer);
   public
      constructor Create(const ACaminhoIni: string);
      destructor Destroy; override;
      procedure Salva;
      function GetStatusServico(const AServico: string): boolean;
      procedure SetStatusServico(const ALigado: boolean; const AServico: string);
      property NumRegistrosIteracao: integer read GetNumRegistrosIteracao write SetNumRegistrosIteracao;
   end;

   TUMSvcBiblioshopIni = class(TUMSvcIntegracaoIni)
   strict private
      function GetDadosConexaoUnimestre: TStringList;
      function GetDadosConexaoBiblioShop: TStringList;
      procedure SetDadosConexaoUnimestre(const ASlDadosConn: TStringList);
      procedure SetDadosConexaoBiblioShop(const ASlDadosConn: TStringList);
   public
      property DadosConexaoUnimestre: TStringList read GetDadosConexaoUnimestre write SetDadosConexaoUnimestre;
      property DadosConexaoBiblioShop: TStringList read GetDadosConexaoBiblioShop write SetDadosConexaoBiblioShop;
      property IniFile: TIniFile read FIniFile;
   end;

   TUMSvcTasyIni = class(TUMSvcIntegracaoIni)
   strict private
      function GetDadosConexaoUnimestre: TStringList;
      function GetDadosConexaoTasy: TStringList;
      procedure SetDadosConexaoUnimestre(const ASlDadosConn: TStringList);
      procedure SetDadosConexaoTasy(const ASlDadosConn: TStringList);
   public
      property DadosConexaoUnimestre: TStringList read GetDadosConexaoUnimestre write SetDadosConexaoUnimestre;
      property DadosConexaoTasy: TStringList read GetDadosConexaoTasy write SetDadosConexaoTasy;
      property IniFile: TIniFile read FIniFile;
   end;

   TUMSvcBorgesMendoncaIni = class(TUMSvcIntegracaoIni)
   strict private
      function GetDadosConexaoBorges: TStringList;
      function GetDadosConexaoCOC: TStringList;
      function GetDadosConexaoDecisao: TStringList;
      procedure SetDadosConexaoBorges(const ASlDadosConn: TStringList);
      procedure SetDadosConexaoCOC(const ASlDadosConn: TStringList);
      procedure SetDadosConexaoDecisao(const ASlDadosConn: TStringList);
   public
      property DadosConexaoBorges: TStringList read GetDadosConexaoBorges write SetDadosConexaoBorges;
      property DadosConexaoCOC: TStringList read GetDadosConexaoCOC write SetDadosConexaoCOC;
      property DadosConexaoDecisao: TStringList read GetDadosConexaoDecisao write SetDadosConexaoDecisao;
      property IniFile: TIniFile read FIniFile;
   end;

   TUMSvcRecadosIni = class(TUMSvcArquivoIniBase)
   strict private
      procedure SetDadosConexao(const ASlDadosConn: TStringList);
      function GetDadosConexao: TStringList;
   public
      property DadosConexao: TStringList read GetDadosConexao write SetDadosConexao;
      property IniFile: TIniFile read FIniFile;
   end;

   TUMSvcConfiguracoes = class(TObject)
   strict private
      FCaminhoServicos: string;
      FUMSvcBiblioshopIni: TUMSvcBiblioshopIni;
      FUMSvcTasyIni: TUMSvcTasyIni;
      FUMSvcBorgesMendoncaIni: TUMSvcBorgesMendoncaIni;
      FUMSvcRecadosIni: TUMSvcRecadosIni;
      procedure CarregaConfiguracoes;
   public
      constructor Create(const ACaminhoServicos: string);
      destructor Destroy; override;
      property UMSvcBiblioshopIni: TUMSvcBiblioshopIni read FUMSvcBiblioshopIni;
      property UMSvcTasyIni: TUMSvcTasyIni read FUMSvcTasyIni;
      property UMSvcBorgesMendoncaIni: TUMSvcBorgesMendoncaIni read FUMSvcBorgesMendoncaIni;
      property UMSvcRecadosIni: TUMSvcRecadosIni read FUMSvcRecadosIni;
   end;

implementation

{ TUMSvcArquivoIniBase }

procedure TUMSvcArquivoIniBase.CarregaConfiguracao;
var
   LIntervalo, LTipoIntervalo: string;
begin
   LIntervalo := Self.FIniFile.ReadString(C_IS_CONFIGURACOES, C_IV_INTERVALO, '5m');
   Self.SetIntervalo(StrToInt(TFuncString.soNumeros(LIntervalo)));
   LTipoIntervalo := TFuncString.soLetras(LIntervalo);
   case Ord(LTipoIntervalo[1]) of
      Ord('m'): Self.SetTipoIntervalo(tiMinuto);
      Ord('h'): Self.SetTipoIntervalo(tiHora);
      Ord('d'): Self.SetTipoIntervalo(tiDia);   
   end;
   Self.SetIntervaloEntreExecucoes(Self.FIniFile.ReadString(C_IS_CONFIGURACOES, C_IV_INTERVALO_ENTRE_EXECUCOES, 'N') = 'S');
end;

constructor TUMSvcArquivoIniBase.Create(const ACaminhoIni: string);
begin
   Self.FIniFile := TIniFile.Create(ACaminhoIni);
   Self.CarregaConfiguracao;
end;

destructor TUMSvcArquivoIniBase.Destroy;
begin
   FreeAndNil(Self.FIniFile);
   inherited;
end;

function TUMSvcArquivoIniBase.GetIntervalo: integer;
begin
   Result := Self.FIntervalo;
end;

function TUMSvcArquivoIniBase.GetTipoIntervalo: TUMTipoIntervalo;
begin
   Result := Self.FUMTipoIntervalo;
end;

procedure TUMSvcArquivoIniBase.Salva;
const
   TipoIntervaloToStr: array[TUMTipoIntervalo] of Char = ('m', 'h', 'd');
   BoolToStr: array[boolean] of Char = ('N', 'S');
begin
   Self.FIniFile.WriteString(C_IS_CONFIGURACOES, C_IV_INTERVALO, IntToStr(Self.Intervalo) + TipoIntervaloToStr[Self.FUMTipoIntervalo]);
   Self.FIniFile.WriteString(C_IS_CONFIGURACOES, C_IV_INTERVALO_ENTRE_EXECUCOES, BoolToStr[Self.FIntervaloEntreExecucoes]);
   Self.FIniFile.UpdateFile;
end;

procedure TUMSvcArquivoIniBase.SetIntervalo(const AIntervalo: integer);
begin
   Self.FIntervalo := AIntervalo;
end;

procedure TUMSvcArquivoIniBase.SetIntervaloEntreExecucoes(
  const AIntervaloEntreExecucoes: boolean);
begin
   Self.FIntervaloEntreExecucoes := AIntervaloEntreExecucoes;
end;

procedure TUMSvcArquivoIniBase.SetTipoIntervalo(
  const ATipoIntervalo: TUMTipoIntervalo);
begin
   Self.FUMTipoIntervalo := ATipoIntervalo;
end;

function TUMSvcArquivoIniBase.UsaIntervaloEntreExecucoes: boolean;
begin
   Result := Self.FIntervaloEntreExecucoes;
end;

{ TUMSvcIntegracaoIni }

procedure TUMSvcIntegracaoIni.CarregaConfiguracao;
begin
   inherited CarregaConfiguracao;
   Self.SetNumRegistrosIteracao(Self.FIniFile.ReadInteger(C_IS_CONFIGURACOES, C_IV_NUM_REGISTRO_INTEGRACAO, 100));
   Self.FIniFile.ReadSectionValues(C_IC_SERVICOS_INTEGRACAO, Self.FServicos);
   Self.FServicos.Count;
end;

constructor TUMSvcIntegracaoIni.Create(const ACaminhoIni: string);
begin
   inherited Create(ACaminhoIni);
   Self.FServicos := TStringList.Create;
   Self.CarregaConfiguracao;
end;

destructor TUMSvcIntegracaoIni.Destroy;
begin
   FreeAndNil(Self.FServicos);
   inherited;
end;

function TUMSvcIntegracaoIni.GetNumRegistrosIteracao: integer;
begin
   Result := Self.FNumRegistrosIteracao;
end;

function TUMSvcIntegracaoIni.GetStatusServico(const AServico: string): boolean;
const
   CharToBool: array['0'..'1'] of boolean = (false, true);
begin
   Result := CharToBool[Self.FServicos.Values[AServico][1]];
end;

procedure TUMSvcIntegracaoIni.Salva;
var
   i: integer;
begin
   for i := 0 to Self.FServicos.Count - 1 do
   begin
      Self.FIniFile.WriteString(C_IC_SERVICOS_INTEGRACAO, Self.FServicos.Names[i], Self.FServicos.ValueFromIndex[i]);
   end;
   Self.FIniFile.WriteInteger(C_IS_CONFIGURACOES, C_IV_NUM_REGISTRO_INTEGRACAO, Self.FNumRegistrosIteracao);
   inherited Salva;
end;

procedure TUMSvcIntegracaoIni.SetNumRegistrosIteracao(
  const ANumRegistrosIteracao: integer);
begin
   Self.FNumRegistrosIteracao := ANumRegistrosIteracao;
end;

procedure TUMSvcIntegracaoIni.SetStatusServico(const ALigado: boolean;
  const AServico: string);
const
   BoolToStr: array[boolean] of Char = ('0', '1');
begin
   Self.FServicos.Values[AServico] := BoolToStr[ALigado];
end;

{ TUMSvcRecadosIni }

function TUMSvcRecadosIni.GetDadosConexao: TStringList;
const
   C_IS_CONEXAO = 'Conexao';
begin
   Result := TStringList.Create;
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', '201.22.86.3');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'mysql-5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'unimestre');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3306');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

procedure TUMSvcRecadosIni.SetDadosConexao(const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

{ TUMSvcConfiguracoes }

procedure TUMSvcConfiguracoes.CarregaConfiguracoes;
begin
   if FileExists(Self.FCaminhoServicos + 'UMSvcIntegraBiblioShop.ini') then
      Self.FUMSvcBiblioshopIni := TUMSvcBiblioshopIni.Create(Self.FCaminhoServicos + 'UMSvcIntegraBiblioShop.ini');
   if FileExists(Self.FCaminhoServicos + 'UMSvcIntegraTasy.ini') then
      Self.FUMSvcTasyIni := TUMSvcTasyIni.Create(Self.FCaminhoServicos + 'UMSvcIntegraTasy.ini');
   if FileExists(Self.FCaminhoServicos + 'UMSvcIntegraBorgesMendonca.ini') then
      Self.FUMSvcBorgesMendoncaIni := TUMSvcBorgesMendoncaIni.Create(Self.FCaminhoServicos + 'UMSvcIntegraBorgesMendonca.ini');
   if FileExists(Self.FCaminhoServicos + 'UMSvcRecados.ini') then
      Self.FUMSvcRecadosIni := TUMSvcRecadosIni.Create(Self.FCaminhoServicos + 'UMSvcRecados.ini');
end;

constructor TUMSvcConfiguracoes.Create(const ACaminhoServicos: string);
begin
   Self.FCaminhoServicos := ACaminhoServicos;
   Self.CarregaConfiguracoes;
end;

destructor TUMSvcConfiguracoes.Destroy;
begin
   if Assigned(Self.FUMSvcBiblioshopIni) then
      FreeAndNil(Self.FUMSvcBiblioshopIni);
   if Assigned(Self.FUMSvcTasyIni) then
      FreeAndNil(Self.FUMSvcTasyIni);
   if Assigned(Self.FUMSvcBorgesMendoncaIni) then
      FreeAndNil(Self.FUMSvcBorgesMendoncaIni);
   if Assigned(Self.FUMSvcRecadosIni) then
      FreeAndNil(Self.FUMSvcRecadosIni);
   inherited;
end;

{ TUMSvcBiblioshopIni }

function TUMSvcBiblioshopIni.GetDadosConexaoBiblioShop: TStringList;
const
   C_IS_CONEXAO = 'Conexao.Biblioshop';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', 'localhost');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'firebird-1.5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', '');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3050');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'SYSDBA');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '945BE90CCC0041E70148'), ctDecode);
end;

function TUMSvcBiblioshopIni.GetDadosConexaoUnimestre: TStringList;
const
   C_IS_CONEXAO = 'Conexao';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', 'localhost');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'mysql-5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'unimestre');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3306');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

procedure TUMSvcBiblioshopIni.SetDadosConexaoBiblioShop(
  const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao.Biblioshop';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

procedure TUMSvcBiblioshopIni.SetDadosConexaoUnimestre(
  const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

{ TUMSvcBorgesMendoncaIni }

function TUMSvcBorgesMendoncaIni.GetDadosConexaoBorges: TStringList;
const
   C_IS_CONEXAO = 'Conexao.Borges';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', 'localhost');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'mysql-5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'unimestre');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3306');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

function TUMSvcBorgesMendoncaIni.GetDadosConexaoCOC: TStringList;
const
   C_IS_CONEXAO = 'Conexao.COC';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', '201.22.86.3');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'mysql-5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'unimestre');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3306');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

function TUMSvcBorgesMendoncaIni.GetDadosConexaoDecisao: TStringList;
const
   C_IS_CONEXAO = 'Conexao.Decisao';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', 'localhost');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'mysql-5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'unimestre');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3307');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

procedure TUMSvcBorgesMendoncaIni.SetDadosConexaoBorges(
  const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao.Borges';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

procedure TUMSvcBorgesMendoncaIni.SetDadosConexaoCOC(
  const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao.COC';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

procedure TUMSvcBorgesMendoncaIni.SetDadosConexaoDecisao(
  const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao.Decisao';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

{ TUMSvcTasyIni }

function TUMSvcTasyIni.GetDadosConexaoTasy: TStringList;
const
   C_IS_CONEXAO = 'Conexao.Tasy';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', 'localhost');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'oracle');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'tasy');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '1521');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

function TUMSvcTasyIni.GetDadosConexaoUnimestre: TStringList;
const
   C_IS_CONEXAO = 'Conexao';
begin
   Result := TStringList.Create;
   Result.Values[CONN_SERVIDOR] := FIniFile.ReadString(C_IS_CONEXAO, 'Servidor', 'localhost');
   Result.Values[CONN_PROTOCOLO] := FIniFile.ReadString(C_IS_CONEXAO, 'Protocol', 'mysql-5');
   Result.Values[CONN_BANCO] := FIniFile.ReadString(C_IS_CONEXAO, 'Banco', 'unimestre');
   Result.Values[CONN_PORTA] := FIniFile.ReadString(C_IS_CONEXAO, 'Porta', '3306');
   Result.Values[CONN_USUARIO] := FIniFile.ReadString(C_IS_CONEXAO, 'Usuario', 'backup');
   Result.Values[CONN_SENHA] :=
      TFuncString.crypt(
         FIniFile.ReadString(C_IS_CONEXAO, 'Senha', '6B995D97A63E9647F557'), ctDecode);
end;

procedure TUMSvcTasyIni.SetDadosConexaoTasy(const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao.Tasy';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

procedure TUMSvcTasyIni.SetDadosConexaoUnimestre(
  const ASlDadosConn: TStringList);
const
   C_IS_CONEXAO = 'Conexao';
begin
   FIniFile.WriteString(C_IS_CONEXAO, 'Servidor', ASlDadosConn.Values[CONN_SERVIDOR]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Protocol', ASlDadosConn.Values[CONN_PROTOCOLO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Banco', ASlDadosConn.Values[CONN_BANCO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Porta', ASlDadosConn.Values[CONN_PORTA]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Usuario', ASlDadosConn.Values[CONN_USUARIO]);
   FIniFile.WriteString(C_IS_CONEXAO, 'Senha',
      TFuncString.crypt(ASlDadosConn.Values[CONN_SENHA], ctEncode));
end;

end.
