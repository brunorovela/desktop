unit uNFSeXsd;

interface

uses
   Contnrs;

type
   { Condição de status do RPS
     1 - Normal
     2 - Cancelado
   }
   TUMTSStatusRps = 1..2;

   { Código de natureza da operação.
     1 - Tributação no município
     2 - Tributação fora do município
     3 - Isenção
     4 - Imune
     5 - Exigibilidade suspensa por decisão judicial
     6 - Exigibilidade suspensa por procedimento administrativo
   }
   TUMTSNaturezaOperacao = 1..6;

   { Código de identificação do regime especial de tributação.
     1 - Microempresa municipal
     2 - Estimativa
     3 - Sociedade de profissionais
     4 - Cooperativa
     5 - Microempresário Individual (MEI)
     6 - Microempresário e Empresa de Pequeno Porte (ME EPP)
   }
   TUMTSRegimeEspecialTributacao = 1..6;

   { Identificação de Sim/Não
     1 - Sim
     2 - Não
   }
   TUMTSSimNao = 1..2;

   { Quantidade de RPS do lote
   }
   TUMTSQuantidadeRps = Byte;

   { Número do RPS
   }
   TUMTSNumeroRps = Cardinal;

   { Número de série do RPS
   }
   TUMTSSerieRps = string[5];

   { Código de tipo do RPS
     1 - RPS
     2 - Nota Fiscal Conjugada (Mista)
     3 - Cupom
   }
   TUMTSTipoRps = 1..3;

   { Valor monetário.
     Formato: 0.00 (ponto separando casa decimal).
     Ex.: 1.234,56 = 1234.56
          1.000,00 = 1000.00
          1.000,00 = 1000
   }
   TUMTSValor = Currency;

   { Código de item da lista de serviço 
   }
   TUMTSItemListaServico = string[5];

   { Código CNAE
   }
   TUMTSCodigoCnae = Cardinal;

   { Código de tributação
   }
   TUMTSCodigoTributacao = string[20];

   { Alíquota. Valor percentual. Formato: 0.0000.
     Ex.: 1% = 0.01
     25,5% = 0.255
     100% = 1.0000 ou 1
   }
   TUMTSAliquota = Currency;

   { Discriminação do conteúdo da NFS-e
   }
   TUMTSDiscriminacao = string;

   { Código de identificação do município conforme tabela do IBGE
   }
   TUMTSCodigoMunicipioIbge = string;

   { Número de inscrição municipal
   }
   TUMTSInscricaoMunicipal = string[15];

   { Razão Social do contribuinte
   }
   TUMTSRazaoSocial = string[115];

   { Nome fantasia
   }
   TUMTSNomeFantasia = string[60];

   { Número CNPJ
   }
   TUMTSCnpj = string[14];

   { Endereço
   }
   TUMTSEndereco = string[125];

   { Número do endereço
   }
   TUMTSNumeroEndereco = string[10];

   { Complemento de endereço
   }
   TUMTSComplementoEndereco = string[60];

   { Bairro
   }
   TUMTSBairro = string[60];

   { Sigla da unidade federativa
   }
   TUMTSUf = string[2];

   { Número do CEP
   }
   TUMTSCep = Word;

   { E-mail
   }
   TUMTSEmail = string[80];

   { Telefone
   }
   TUMTSTelefone = string[11];

   { Número de CPF
   }
   TUMTSCpf = string[11];

   { Código de obra
   }
   TUMTSCodigoObra = string[15];

   { Código ART
   }
   TUMTSArt = string[15];

   { Número do Lote de RPS
   }
   TUMTSNumeroLote = Cardinal;

   { Atributo de identificação da tag a ser assinada no documento XML
   }
   TUMTSIdTag = string[255];

   { Dados de identificação do Rps
   }
   TUMTCIdentificacaoRps = class(TObject)
   strict private
      FNumeroRps: TUMTSNumeroRps;
      FSerieRps: TUMTSSerieRps;
      FTipoRps: TUMTSTipoRps;
   public
      constructor Create(const ANumeroRps: TUMTSNumeroRps;
         const ASerieRps: TUMTSSerieRps; const ATipoRps: TUMTSTipoRps);
      property NumeroRps: TUMTSNumeroRps read FNumeroRps;
      property SerieRps: TUMTSSerieRps read FSerieRps;
      property TipoRps: TUMTSTipoRps read FTipoRps;
   end;

   { Representa um conjunto de valores que compõe o documento fiscal
   }
   TUMTCValores = class(TObject)
   strict private
      FValorServicos: TUMTSValor;
      FValorDeducoes: TUMTSValor;
      FValorPis: TUMTSValor;
      FValorCofins: TUMTSValor;
      FValorInss: TUMTSValor;
      FValorIr: TUMTSValor;
      FValorCsll: TUMTSValor;
      FIssRetido: TUMTSSimNao;
      FValorIss: TUMTSValor;
      FValorIssRetido: TUMTSValor;
      FOutrasRetencoes: TUMTSValor;
      FBaseCalculo: TUMTSValor;
      FAliquota: TUMTSAliquota;
      FValorLiquidoNfse: TUMTSValor;
      FDescontoIncondicionado: TUMTSValor;
      FDescontoCondicionado: TUMTSValor;
   public
      constructor Create(const AValorServicos: TUMTSValor;
         const AIssRetido: TUMTSSimNao);
      property ValorServicos: TUMTSValor read FValorServicos;
      property ValorDeducoes: TUMTSValor
         read FValorDeducoes
         write FValorDeducoes;
      property ValorPis: TUMTSValor read FValorPis write FValorPis;
      property ValorCofins: TUMTSValor read FValorCofins write FValorCofins;
      property ValorInss: TUMTSValor read FValorInss write FValorInss;
      property ValorIr: TUMTSValor read FValorIr write FValorIr;
      property ValorCsll: TUMTSValor read FValorCsll write FValorCSll;
      property IssRetido: TUMTSSimNao read FIssRetido;
      property ValorIss: TUMTSValor read FValorIss write FValorIss;
      property ValorIssRetido: TUMTSValor
         read FValorIssRetido
         write FValorIssRetido;
      property OutrasRetencoes: TUMTSValor
         read FOutrasRetencoes
         write FOutrasRetencoes;
      property BaseCalculo: TUMTSValor read FBaseCalculo write FBaseCalculo;
      property Aliquota: TUMTSAliquota read FAliquota write FAliquota;
      property ValorLiquidoNfse: TUMTSValor
         read FValorLiquidoNfse
         write FValorLiquidoNfse;
      property DescontoIncondicionado: TUMTSValor
         read FDescontoIncondicionado
         write FDescontoIncondicionado;
      property DescontoCondicionado: TUMTSValor
         read FDescontoCondicionado
         write FDescontoCondicionado;
   end;

   { Representa dados que compõe o serviço prestado
   }
   TUMTCDadosServico = class(TObject)
   strict private
      FValores: TUMTCValores;
      FItemListaServico: TUMTSItemListaServico;
      FCodigoCnae: TUMTSCodigoCnae;
      FCodigoTributacaoMunicipio: TUMTSCodigoTributacao;
      FDiscriminacao: TUMTSDiscriminacao;
      FCodigoMunicipio: TUMTSCodigoMunicipioIbge;
   public
      constructor Create(const AValores: TUMTCValores;
         const AItemListaServico: TUMTSItemListaServico;
         const ADiscriminacao: TUMTSDiscriminacao;
         const ACodigoMunicipioIbge: TUMTSCodigoMunicipioIbge);
      destructor Destroy; override;
      property Valores: TUMTCValores read FValores;
      property ItemListaServico: TUMTSItemListaServico read FItemListaServico;
      property CodigoCnae: TUMTSCodigoCnae read FCodigoCnae write FCodigoCnae;
      property CodigoTributacaoMunicipio: TUMTSCodigoTributacao
         read FCodigoTributacaoMunicipio
         write FCodigoTributacaoMunicipio;
      property Discriminacao: TUMTSDiscriminacao read FDiscriminacao;
      property CodigoMunicipio: TUMTSCodigoMunicipioIbge read FCodigoMunicipio;
   end;

   { Representa dados para identificação do prestador de serviço
   }
   TUMTCIdentificacaoPrestador = class(TObject)
   strict private
      FCnpj: TUMTSCnpj;
      FInscricaoMunicipal: TUMTSInscricaoMunicipal;
   public
      constructor Create(const ACnpj: TUMTSCnpj);
      property Cnpj: TUMTSCnpj read FCnpj;
      property InscricaoMunicipal: TUMTSInscricaoMunicipal
         read FInscricaoMunicipal
         write FInscricaoMunicipal;
   end;

   { Número de CPF ou CNPJ 
   }
   TUMTCCpfCnpj = class(TObject)
   strict private
      FCpf: TUMTSCpf;
      FCnpj: TUMTSCnpj;
   public
      constructor Create(const ACpf: TUMTSCpf; const ACnpj: TUMTSCnpj);
      property Cpf: TUMTSCpf read FCpf;
      property Cnpj: TUMTSCnpj read FCnpj;
   end;

   { Representa dados para identificação do tomador de serviço
   }
   TUMTCIdentificacaoTomador = class(TObject)
   strict private
      FCpfCnpj: TUMTCCpfCnpj;
      FInscricaoMunicipal: TUMTSInscricaoMunicipal;
   public
      constructor Create;
      destructor Destroy; override;
      property CpfCnpj: TUMTCCpfCnpj read FCpfCnpj write FCpfCnpj;
      property InscricaoMunicipal: TUMTSInscricaoMunicipal
         read FInscricaoMunicipal
         write FInscricaoMunicipal;
   end;

   { Representação completa do endereço
   }
   TUMTCEndereco = class(TObject)
   strict private
      FEndereco: TUMTSEndereco;
      FNumero: TUMTSNumeroEndereco;
      FComplemento: TUMTSComplementoEndereco;
      FBairro: TUMTSBairro;
      FCodigoMunicipio: TUMTSCodigoMunicipioIbge;
      FUf: TUMTSUf;
      FCep: TUMTSCep;
   public
      constructor Create;
      property Endereco: TUMTSEndereco read FEndereco write FEndereco;
      property Numero: TUMTSNumeroEndereco read FNumero write FNumero;
      property Complemento: TUMTSComplementoEndereco
         read FComplemento
         write FComplemento;
      property Bairro: TUMTSBairro read FBairro write FBairro;
      property CodigoMunicipio: TUMTSCodigoMunicipioIbge
         read FCodigoMunicipio
         write FCodigoMunicipio;
      property Uf: TUMTSUf read FUf write FUf;
      property Cep: TUMTSCep read FCep write FCep;
   end;

   { Representa forma de contato com a pessoa (física/jurídica)
   }
   TUMTCContato = class(TObject)
   strict private
      FTelefone: TUMTSTelefone;
      FEmail: TUMTSEmail;
   public
      constructor Create;
      property Telefone: TUMTSTelefone read FTelefone write FTelefone;
      property Email: TUMTSEmail read FEmail write FEmail;
   end;

   { Representa dados do tomador de serviço
   }
   TUMTCDadosTomador = class(TObject)
   strict private
      FIdentificacaoTomador: TUMTCIdentificacaoTomador;
      FRazaoSocial: TUMTSRazaoSocial;
      FEndereco: TUMTCEndereco;
      FContato: TUMTCContato;
   public
      constructor Create;
      destructor Destroy; override;
      property IdentificacaoTomador: TUMTCIdentificacaoTomador
         read FIdentificacaoTomador
         write FIdentificacaoTomador;
      property RazaoSocial: TUMTSRazaoSocial
         read FRazaoSocial
         write FRazaoSocial;
      property Endereco: TUMTCEndereco read FEndereco write FEndereco;
      property Contato: TUMTCContato read FContato write FContato;
   end;

   { Representa dados para identificação de intermediário do serviço
   }
   TUMTCIdentificacaoIntermediarioServico = class(TObject)
   strict private
      FRazaoSocial: TUMTSRazaoSocial;
      FCpfCnpj: TUMTCCpfCnpj;
      FInscricaoMunicipal: TUMTSInscricaoMunicipal;
   public
      constructor Create(const ARazaoSocial: TUMTSRazaoSocial;
         const ACpfCnpj: TUMTCCpfCnpj);
      destructor Destroy; override;
      property RazaoSocial: TUMTSRazaoSocial read FRazaoSocial;
      property CpfCnpj: TUMTCCpfCnpj read FCpfCnpj;
      property InscricaoMunicipal: TUMTSInscricaoMunicipal
         read FInscricaoMunicipal
         write FInscricaoMunicipal;
   end;

   { Representa dados para identificação de construção civil
   }
   TUMTCDadosConstrucaoCivil = class(TObject)
   strict private
      FCodigoObra: TUMTSCodigoObra;
      FArt: TUMTSArt;
   public
      constructor Create(const ACodigoObra: TUMTSCodigoObra;
         const AArt: TUMTSArt);
      property CodigoObra: TUMTSCodigoObra read FCodigoObra;
      property Art: TUMTSArt read FArt;
   end;

   { Representa dados informativos do Recibo Provisório de Serviço (RPS)
   }
   TUMTCInfRps = class(TObject)
   strict private
      FIdentificacaoRps: TUMTCIdentificacaoRps;
      FDataEmissao: TDateTime;
      FNaturezaOperacao: TUMTSNaturezaOperacao;
      FRegimeEspecialTributacao: TUMTSRegimeEspecialTributacao;
      FOptanteSimplesNacional: TUMTSSimNao;
      FIncentivadorCultural: TUMTSSimNao;
      FStatus: TUMTSStatusRps;
      FRpsSubstituido: TUMTCIdentificacaoRps;
      FServico: TUMTCDadosServico;
      FPrestador: TUMTCIdentificacaoPrestador;
      FTomador: TUMTCDadosTomador;
      FIntermediarioServico: TUMTCIdentificacaoIntermediarioServico;
      FContrucaoCivil: TUMTCDadosConstrucaoCivil;
      FId: TUMTSIdTag;
   public
      constructor Create(const AIdentificacaoRps: TUMTCIdentificacaoRps;
         const ADataEmissao: TDateTime;
         const ANaturezaOperacao: TUMTSNaturezaOperacao;
         const AOptanteSimplesNacional, AIncentivadorCultural: TUMTSSimNao;
         const AStatus: TUMTSStatusRps; const AServico: TUMTCDadosServico;
         const APrestador: TUMTCIdentificacaoPrestador; const AId: TUMTSIdTag);
      destructor Destroy; override;
      property IdentificacaoRps: TUMTCIdentificacaoRps read FIdentificacaoRps;
      property DataEmissao: TDateTime read FDataEmissao;
      property NaturezaOperacao: TUMTSNaturezaOperacao read FNaturezaOperacao;
      property RegimeEspecialTributacao: TUMTSRegimeEspecialTributacao
         read FRegimeEspecialTributacao
         write FRegimeEspecialTributacao;
      property OptanteSimplesNacional: TUMTSSimNao read FOptanteSimplesNacional;
      property IncentivadorCultural: TUMTSSimNao read FIncentivadorCultural;
      property Status: TUMTSStatusRps read FStatus;
      property RpsSubstituido: TUMTCIdentificacaoRps
         read FRpsSubstituido
         write FRpsSubstituido;
      property Servico: TUMTCDadosServico read FServico;
      property Prestador: TUMTCIdentificacaoPrestador read FPrestador;
      property Tomador: TUMTCDadosTomador read FTomador write FTomador;
      property IntermediarioServico: TUMTCIdentificacaoIntermediarioServico
         read FIntermediarioServico
         write FIntermediarioServico;
      property ContrucaoCivil: TUMTCDadosConstrucaoCivil
         read FContrucaoCivil
         write FContrucaoCivil;
      property Id: TUMTSIdTag read FId;
   end;

   { Representa a estrutura do Recibo Provisório de Serviço (RPS) assinada
   }
   TUMTCRps = class(TObject)
   strict private
      FInfRps: TUMTCInfRps;
   public
      constructor Create(const AInfRps: TUMTCInfRps);
      destructor Destroy; override;
      property InfRps: TUMTCInfRps read FInfRps;
   end;

   TUMTCLoteRps = class(TObject)
   strict private
      FNumeroLote: TUMTSNumeroLote;
      FCnpj: TUMTSCnpj;
      FInscricaoMunicipal: TUMTSInscricaoMunicipal;
      FId: TUMTSIdTag;
      FListaRps: TObjectList;
      function GetQuantidadeRps: TUMTSQuantidadeRps;
      function GetRps(const AIndice: TUMTSQuantidadeRps): TUMTCRps;
   public
      constructor Create(const ANumeroLote: TUMTSNumeroLote;
         const ACnpj: string; const AInscricaoMunicipal: string;
         const AId: string);
      destructor Destroy; override;
      procedure AdicionaRps(ARps: TUMTCRps);
      property NumeroLote: TUMTSNumeroLote read FNumeroLote;
      property Cnpj: TUMTSCnpj read FCnpj;
      property InscricaoMunicipal: TUMTSInscricaoMunicipal
         read FInscricaoMunicipal;
      property QuantidadeRps: TUMTSQuantidadeRps read GetQuantidadeRps;
      property Rps[const I: TUMTSQuantidadeRps]: TUMTCRps read GetRps;
      property Id: TUMTSIdTag read FId;
   end;

implementation

{ TUMTCIdentificacaoRps }

constructor TUMTCIdentificacaoRps.Create(const ANumeroRps: TUMTSNumeroRps;
  const ASerieRps: TUMTSSerieRps; const ATipoRps: TUMTSTipoRps);
begin
   FNumeroRps := ANumeroRps;
   FSerieRps := ASerieRps;
   FTipoRps := ATipoRps;
end;

{ TUMTCValores }

constructor TUMTCValores.Create(const AValorServicos: TUMTSValor;
  const AIssRetido: TUMTSSimNao);
begin
   FValorServicos := AValorServicos;
   FIssRetido := AIssRetido;
end;

{ TUMTCDadosServico }

constructor TUMTCDadosServico.Create(const AValores: TUMTCValores;
  const AItemListaServico: TUMTSItemListaServico;
  const ADiscriminacao: TUMTSDiscriminacao;
  const ACodigoMunicipioIbge: TUMTSCodigoMunicipioIbge);
begin
   FValores := AValores;
   FItemListaServico := AItemListaServico;
   FDiscriminacao := ADiscriminacao;
   FCodigoMunicipio := ACodigoMunicipioIbge;
end;

destructor TUMTCDadosServico.Destroy;
begin
   if Assigned(FValores) then
      FValores.Free;
   inherited;
end;

{ TUMTCIdentificacaoPrestador }

constructor TUMTCIdentificacaoPrestador.Create(const ACnpj: TUMTSCnpj);
begin
   FCnpj := ACnpj;
end;

{ TUMTCCpfCnpj }

constructor TUMTCCpfCnpj.Create(const ACpf: TUMTSCpf; const ACnpj: TUMTSCnpj);
begin
   FCpf := ACpf;
   FCnpj := ACnpj;
end;

{ TUMTCIdentificacaoTomador }

constructor TUMTCIdentificacaoTomador.Create;
begin
end;

destructor TUMTCIdentificacaoTomador.Destroy;
begin
   if Assigned(FCpfCnpj) then
      FCpfCnpj.Free;
   inherited;
end;

{ TUMTCDadosTomador }

constructor TUMTCDadosTomador.Create;
begin
end;

destructor TUMTCDadosTomador.Destroy;
begin
   if Assigned(FIdentificacaoTomador) then
      FIdentificacaoTomador.Free;
   if Assigned(FEndereco) then
      FEndereco.Free;
   if Assigned(FContato) then
      FContato.Free;
   inherited;
end;

{ TUMTCIdentificacaoIntermediarioServico }

constructor TUMTCIdentificacaoIntermediarioServico.Create(
  const ARazaoSocial: TUMTSRazaoSocial; const ACpfCnpj: TUMTCCpfCnpj);
begin
   FRazaoSocial := ARazaoSocial;
   FCpfCnpj := ACpfCnpj;
end;

destructor TUMTCIdentificacaoIntermediarioServico.Destroy;
begin
   if Assigned(FCpfCnpj) then
      FCpfCnpj.Free;
   inherited;
end;

{ TUMTCDadosConstrucaoCivil }

constructor TUMTCDadosConstrucaoCivil.Create(const ACodigoObra: TUMTSCodigoObra;
  const AArt: TUMTSArt);
begin
   FCodigoObra := ACodigoObra;
   FArt := AArt;
end;

{ TUMTCInfRps }

constructor TUMTCInfRps.Create(const AIdentificacaoRps: TUMTCIdentificacaoRps;
  const ADataEmissao: TDateTime; const ANaturezaOperacao: TUMTSNaturezaOperacao;
  const AOptanteSimplesNacional, AIncentivadorCultural: TUMTSSimNao;
  const AStatus: TUMTSStatusRps; const AServico: TUMTCDadosServico;
  const APrestador: TUMTCIdentificacaoPrestador; const AId: TUMTSIdTag);
begin
   FIdentificacaoRps := AIdentificacaoRps;
   FDataEmissao := ADataEmissao;
   FNaturezaOperacao := ANaturezaOperacao;
   FOptanteSimplesNacional := AOptanteSimplesNacional;
   FIncentivadorCultural := AIncentivadorCultural;
   FStatus := AStatus;
   FServico := AServico;
   FPrestador := APrestador;
   FId := AId;
end;

destructor TUMTCInfRps.Destroy;
begin
   if Assigned(FIdentificacaoRps) then
      FIdentificacaoRps.Free;
   if Assigned(FRpsSubstituido) then
      FRpsSubstituido.Free;
   if Assigned(FServico) then
      FServico.Free;
   if Assigned(FPrestador) then
      FPrestador.Free;
   if Assigned(FTomador) then
      FTomador.Free;
   if Assigned(FIntermediarioServico) then
      FIntermediarioServico.Free;
   if Assigned(FContrucaoCivil) then
      FContrucaoCivil.Free;
   inherited;
end;

{ TUMTCRps }

constructor TUMTCRps.Create(const AInfRps: TUMTCInfRps);
begin
   FInfRps := AInfRps;
end;

destructor TUMTCRps.Destroy;
begin
   if Assigned(FInfRps) then
      FInfRps.Free;
   inherited;
end;

{ TUMTCLoteRps }

procedure TUMTCLoteRps.AdicionaRps(ARps: TUMTCRps);
begin
   FListaRps.Add(ARps);
end;

constructor TUMTCLoteRps.Create(const ANumeroLote: TUMTSNumeroLote;
   const ACnpj: string; const AInscricaoMunicipal: string; const AId: string);
begin
   FNumeroLote := ANumeroLote;
   FCnpj := ACnpj;
   FInscricaoMunicipal := AInscricaoMunicipal;
   FId := AId;
   FListaRps := TObjectList.Create;
end;

destructor TUMTCLoteRps.Destroy;
var
   I: integer;
begin
   for I := FListaRps.Count - 1 downto 0 do
      TUMTCRps(FListaRps.Extract(FListaRps.Items[I])).Free;
   inherited;
end;

function TUMTCLoteRps.GetQuantidadeRps: TUMTSQuantidadeRps;
begin
   Result := FListaRps.Count;
end;

function TUMTCLoteRps.GetRps(const AIndice: TUMTSQuantidadeRps): TUMTCRps;
begin
   Result := TUMTCRps(FListaRps.Items[AIndice]);
end;

{ TUMTCEndereco }

constructor TUMTCEndereco.Create;
begin
end;

{ TUMTCContato }

constructor TUMTCContato.Create;
begin
end;

end.

