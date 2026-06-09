unit uNFSeMap;

interface

uses
   SysUtils, ZConnection, Variants, uNFSeXsd, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
   { Esta classe, extendida da classe base de exceções da Object Pascal, é
     utilizada para gerar exceções decorrentes durante o processo de leitura dos
     dados do banco de dados para os objetos internos.
   }
   EUMNfseDataMapError = class(Exception);

   { Esta interface assina os méotodos necessários para executar a leitura dos
     dados da base de dados para objetos internos.
   }
   IUMNfseDataMap = interface(IUnknown)
      ['{51B86F1A-2A58-4120-8025-3801440EE2D1}']
      function GetLoteRps(const AINumeroLote: Cardinal): TUMTCLoteRps;
   end;

   { Esta classe básica implementa a interface para importação dos dados para
     geração da NFS-e.
   }
   TUMNfseDataMapBase = class(TInterfacedObject, IUMNfseDataMap)
   strict protected
      FDataSetLote: TUMZQuery;
      FDataSetVars: TUMZQuery;
      function ProcuraVar(const ASNome: string): boolean;
      function GetValorVar(const ASNome: string;
         const ABRequerida: boolean): OleVariant;
      property DataSetLote: TUMZQuery read FDataSetLote;
      property DataSetVars: TUMZQuery read FDataSetVars;
   public
      constructor Create(const ADataSetLote, ADataSetVars: TUMZQuery);
      destructor Destroy; override;
      function GetLoteRps(const AINumeroLote: Cardinal): TUMTCLoteRps; virtual;
   end;

   { Esta classe implementa o padrão adotado pela prefeitura de Curitiba para
     geração da NFS-e. Efetua a leitura dos dados armazenados no banco de dados
     e armazena-os em objetos.
   }
   TUMNfseDataMapCuritiba = class(TUMNfseDataMapBase)
   public
      function GetLoteRps(const AINumeroLote: Cardinal): TUMTCLoteRps; virtual;
   end;

implementation

uses DB;

{ TUMNfseDataMapBase }

{ Construtor. Recebe a referência para os DataSet's que armazenam as informações
  das variáveis para geração da NFS-e e as informações do lote RPS a ser criado.
}
constructor TUMNfseDataMapBase.Create(const ADataSetLote, ADataSetVars: TUMZQuery);
begin
   FDataSetLote := ADataSetLote;
   FDataSetVars := ADataSetVars;
end;

destructor TUMNfseDataMapBase.Destroy;
begin
   inherited;
end;

{ Este método deve implementar a importação dos dados que estão armazenados nos
  Result Set's para os objetos internos.
}
function TUMNfseDataMapBase.GetLoteRps(
  const AINumeroLote: Cardinal): TUMTCLoteRps;
begin
end;

{ Retorna o valor da variável. Se o segundo parâmetro estiver ligado e a
  variável não for encontrada, dispara uma nova exceção.
}
function TUMNfseDataMapBase.GetValorVar(const ASNome: string;
  const ABRequerida: boolean): OleVariant;
begin
   if not ProcuraVar(ASNome) then
      if ABRequerida then
         raise EUMNfseDataMapError.CreateFmt('A variável [%s] não foi configurada', [ASNome])
      else
         Result := Null
   else
      Result := FDataSetVars.FieldByName('valor').AsVariant;
end;

{ Procura a variável informada no Result Set.
}
function TUMNfseDataMapBase.ProcuraVar(const ASNome: string): boolean;
begin
   Result := FDataSetVars.Locate('variavel', ASNome, [loCaseInsensitive]);
end;

{ TUMNfseDataMapCuritiba }

{ Efetua a leitura dos dados do banco para gerar o lote RPS com base no padrão
  da prefeitura de Curitiba.
}
function TUMNfseDataMapCuritiba.GetLoteRps(
  const AINumeroLote: Cardinal): TUMTCLoteRps;
var
   I: Cardinal;
   LSCnpj, LSCodigoMunicipio, LSInscMunicipal, LSItemListaServico, LSSerieRps: string;
   LINaturezaOperacao, LIOptanteSimplesNacional, LIIncentivadorCultural: Byte;

   { Pega as informações do tomador do serviço
   }
   function GetDadosTomador: TUMTCDadosTomador;
   begin
      Result := TUMTCDadosTomador.Create;
      
      if (FDataSetLote.FieldByName('Cnpj').AsString <> '') or
         (FDataSetLote.FieldByName('Cpf').AsString <> '') then
      begin
         Result.IdentificacaoTomador := TUMTCIdentificacaoTomador.Create;
         Result.IdentificacaoTomador.CpfCnpj := TUMTCCpfCnpj.Create(
            FDataSetLote.FieldByName('Cpf').AsString,
            FDataSetLote.FieldByName('Cnpj').AsString);
      end;
      // Informações do endereço do tomador
      Result.Endereco := TUMTCEndereco.Create;
      Result.Endereco.Endereco := FDataSetLote.FieldByName('Endereco').AsString;
      Result.Endereco.Numero := FDataSetLote.FieldByName('Numero').AsString;
      Result.Endereco.Complemento := FDataSetLote.FieldByName('Complemento').AsString;
      Result.Endereco.Bairro := FDataSetLote.FieldByName('Bairro').AsString;
      if not FDataSetLote.FieldByName('CodigoMunicipio').IsNull then
         Result.Endereco.CodigoMunicipio := FDataSetLote.FieldByName('CodigoMunicipio').AsVariant;
      Result.Endereco.Uf := FDataSetLote.FieldByName('Uf').AsString;
      Result.Endereco.Cep := InternalStrToInt(FDataSetLote.FieldByName('Cep').AsString);
      // Informações do contato do tomador
      Result.Contato := TUMTCContato.Create;
      Result.Contato.Telefone := FDataSetLote.FieldByName('Telefone').AsString;
      Result.Contato.Email := FDataSetLote.FieldByName('Email').AsString;
      if Result.IdentificacaoTomador.CpfCnpj.Cpf <> '' then
         Result.RazaoSocial := FDataSetLote.FieldByName('nm_pessoa').AsString;
   end;

   { Pega õs dados do serviço com seus respectivos valores.
   }
   function GetDadosServico: TUMTCDadosServico;
   var
      LValores: TUMTCValores;
   begin

      LValores := TUMTCValores.Create(
         FDataSetLote.FieldByName('ValorServicos').AsCurrency, 2);
      try
         LValores.ValorDeducoes :=
            FDataSetLote.FieldByName('descontoextra').AsCurrency;
         if ProcuraVar('VALORALIQUOTA') then
            LValores.Aliquota := StrToFloat(GetValorVar('VALORALIQUOTA', false));
         Result := TUMTCDadosServico.Create(LValores, LSItemListaServico,
            FDataSetLote.FieldByName('Discriminacao').AsString, LSCodigoMunicipio);
         if ProcuraVar('CODIGOCNAE') then
            Result.CodigoCnae := GetValorVar('CODIGOCNAE', false);
      finally
         LValores := nil;
      end;
   end;

   { Pega as informações do Rps.
   }
   function GetInfRps: TUMTCInfRps;
   var
      LIdentificacaoRps: TUMTCIdentificacaoRps;
      LIdentificacaoPrestador: TUMTCIdentificacaoPrestador;
   begin
      LIdentificacaoRps := TUMTCIdentificacaoRps.Create(I, LSSerieRps, 1);
      try
         LIdentificacaoPrestador := TUMTCIdentificacaoPrestador.Create(SoNumeros(LSCnpj));
         try
            LIdentificacaoPrestador.InscricaoMunicipal := LSInscMunicipal;

            Result := TUMTCInfRps.Create(LIdentificacaoRps, Now, LINaturezaOperacao,
               LIOptanteSimplesNacional, LIIncentivadorCultural, 1, GetDadosServico,
               LIdentificacaoPrestador, Format('rps:%d', [I]));
         finally
            LIdentificacaoPrestador := nil;
         end;
      finally
         LIdentificacaoRps := nil;
      end;
      Result.Tomador := GetDadosTomador;
   end;

begin
   try
      LSCnpj := SoNumeros(GetValorVar('CNPJ', true));
      LSInscMunicipal := GetValorVar('INSCRICAOMUNICIPAL', true);
      LSItemListaServico := GetValorVar('ITEMLISTASERVICO', true);
      LSCodigoMunicipio := GetValorVar('CODIGOMUNICIPIO', true);
      LSSerieRps := GetValorVar('SERIE', true);
      LINaturezaOperacao := GetValorVar('NATUREZAOPERACAO', true);
      LIOptanteSimplesNacional := GetValorVar('OPTANTESIMPLESNACIONAL', true);
      LIIncentivadorCultural := GetValorVar('INCENTIVADORCULTURAL', true);
   except
      on EUMNfseDataMapError do raise;      
   end;

   Result := TUMTCLoteRps.Create(AINumeroLote, LSCnpj, LSInscMunicipal,
      Format('lote:%d', [AINumeroLote]));

   try
      I := GetValorVar('ULTIMORPS', true);
   except
      on EUMNfseDataMapError do raise;
   end;
   FDataSetLote.First;
   while not FDataSetLote.Eof do
   begin
      Inc(I);
      Result.AdicionaRps(TUMTCRps.Create(GetInfRps));
      FDataSetLote.Next;
   end;
   DM.db.ExecuteDirect(
      Format('UPDATE fin_nfse_rps_variaveis SET ds_valor = "%d" WHERE nm_variavel = "UltimoRPS"', [I]));
end;

end.

