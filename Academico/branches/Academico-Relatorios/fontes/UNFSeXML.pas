unit UNFSeXML;

interface

uses
   Classes, SysUtils, XMLDoc, Variants, ComObj, CAPICOM_TLB, MSXML2_TLB,
   UNFSeTypes;

resourcestring
   SFileNotFound = 'O arquivo [%s] não foi encontrado.';
   SSelectError = 'Erro na seleção do certificado: %s';
   STagSigNotFound = 'A tag Signature não foi encontrada.';
   SInvalidKey = 'A chave é inválida.';
   SSigFail = 'Falha durante a assinatura do XML.';
   SMsxml5Require = 'A instalação do MSXML5 é requerido para esta ação.';

type
   { Esta classe estende a classe de erros padrão da Object Pascal. A finalidade
     desta classe é disparar erros durante o processo de scrita ou assinatura
     do documento XML da Nota Fiscal de Serviços Eletrônica. 
   }
   EUMNFSeException = class(Exception);
   
   { Esta interface define os métodos necessários para implementar uma classe
     que efetua conversão dos dados de um lote RPS da Nota Fiscal de Serviços
     Eletrônica para um arquivo XML compatível com o sistema da prefeitura.
   }
   IUMNFSeXML = interface(IUnknown)
      ['{85ACAAEF-C07C-41D9-948C-AE82167E96F3}']
      function GetCleanXML(const XMLPath: string): string;
      function LoadXML(const XMLPath: string): Boolean;
      function SaveXML(const XMLPath: string): Boolean;
      function SignXML: Boolean;
      function WriteXML(const XMLPath: string): Boolean;
   end;

   { Esta classe implementa a classe base para geração de documentos XML
     assinados para Nota Fiscal de Serviços Eletrônica. O método WriteXML,
     responsável por escrever o conteúdo do documento XML, não é implementado,
     pois o formato do documento XML pode variar de prefeitura para prefeitura.
   }
   TUMNFSeXMLBase = class(TInterfacedObject, IUMNFSeXML)
   private
      FXMLDocument: TXMLDocument;
      FXMLDOMDoc: IXMLDOMDocument3;
      FXMLDSig: IXMLDigitalSignatureEx;
      FLoteRps: TUMTcLoteRps;
      FSchemaLocation: string;
      function GetXMLDocument: TXMLDocument;
      function GetXMLDomDoc: IXMLDOMDocument3;
      function GetXMLDSig: IXMLDigitalSignatureEx;
      function GetLoteRps: TUMTcLoteRps;
      function GetSchemaLocation: string;
   protected
      property XMLDocument: TXMLDocument read GetXMLDocument;
      property XMLDomDoc: IXMLDOMDocument3 read GetXMLDomDoc;
      property XMLDSig: IXMLDigitalSignatureEx read GetXMLDSig;
      property LoteRps: TUMTcLoteRps read GetLoteRps;
      property SchemaLocation: string read GetSchemaLocation;
   public
      constructor Create(const LoteRps: TUMTcLoteRps;
         const SchemaLocation: string);
      destructor Destroy; override;
      function GetCleanXML(const XMLPath: string): string;
      function LoadXML(const XMLPath: string): Boolean;
      function SaveXML(const XMLPath: string): Boolean;
      function SignXML: Boolean;
      function WriteXML(const XMLPath: string): Boolean; virtual; abstract;
   end;

   { Esta classe é uma extensão da classe base para geração de documentos XML
     assinados para Nota Fiscal de Serviços Eletrônica específico para o
     município de Curitba-PR. O formato do documento XML de Curitiba possui
     algumas pequenas diferenças com relação ao padrão utilizado pela ABRASF.
   }
   TUMNFSeXMLCuritiba = class(TUMNFSeXMLBase)
   public
      function WriteXML(const XMLPath: string): Boolean;
   end;

   { Esta classe é uma extensão da classe base para geração de documentos XML
     digitalmente assinados para a Nota Fiscal de Serviços Eletrônica com
     especificidades para o município de Rio do Sul-SC.
   }
   TUMNFSeXMLRioSul = class(TUMNFSeXMLBase)
   public
      function WriteXML(const XMLPath: string): Boolean;
   end;

implementation

uses XMLIntf;

{ TUMNFSeXMLBase }

{ O construtor inicializa os objetos responsáveis pela manipulação de documentos
  XML. Para utilizar os objetos dos tipos IXMLDigitalSignature e IXMLDocument3 é
  necessário declarar as unidades CAPICOM_TLB e MSXML2_TLB na cláusula uses da
  unidade. Essas unidades foram importadas das bibliotecas de vínculo dinâmico
  (DLL) msxml5 (versão 5.20.1087.0) e capicom.dll (versão 2.1.0.2). A DLL
  capicom.dll deverá estar previamente registrada no computador cliente. O
  registro da DLL dá-se com a execução do comando REGSVR32 [DLLFILENAME], onde
  [DLLFILENAME] é o nome da DLL que deseja-se registrar, neste caso CAPICOM.DLL
}
constructor TUMNFSeXMLBase.Create(const LoteRps: TUMTcLoteRps;
  const SchemaLocation: string);
begin
   FXMLDSig := CoMXDigitalSignature50.Create as IXMLDigitalSignatureEx;
   if not Assigned(XMLDSig) then
      raise EUMNFSeException.Create(SMsxml5Require);

   FXMLDOMDoc := CoDOMDocument50.Create as IXMLDOMDocument3;
   if not Assigned(XMLDomDoc) then
      raise EUMNFSeException.Create(SMsxml5Require);

   XMLDomDoc.async := False;
   XMLDomDoc.validateOnParse := False;
   XMLDomDoc.preserveWhiteSpace := True;
   XMLDomDoc.resolveExternals := False;

   FXMLDocument := TXMLDocument.Create(nil);
   XMLDocument.Active := True;
   XMLDocument.Version := '1.0';
   XMLDocument.NodeIndentStr := #9;
   XMLDocument.ParseOptions := [poPreserveWhiteSpace];
   XMLDocument.Options := [doNodeAutoIndent];

   FLoteRps := LoteRps;
   FSchemaLocation := SchemaLocation;
end;

destructor TUMNFSeXMLBase.Destroy;
begin
   if Assigned(FLoteRps) then
      FLoteRps.Free;
   FXMLDocument.Active := False;
   FXMLDocument.Free;
   FXMLDOMDoc := nil;
   FXMLDSig := nil;
   inherited;
end;

{ Recebe o endereço do arquivo XML no sistema operacional e carrega seu conteúdo
  para um objeto TStringList. A rotina percorre todas as linhas do arquivo,
  removendo as linhas vazias e os atributos xmlns que estão vazios. O resultado
  do método é o conteúdo do arquivo XML enxuto.
}
function TUMNFSeXMLBase.GetCleanXML(const XMLPath: string): string;
var
   I: Integer;
   Line: string;
   XMLContent: TStringList;
begin
   XMLContent := TStringList.Create;
   try
      XMLContent.LoadFromFile(XMLPath);
      for I := 0 to XMLContent.Count - 1 do
      begin
         Line := Trim(XMLContent.Strings[I]);
         if Line <> '' then
            XMLContent.Strings[I] := StringReplace(Line, ' xmlns=""', '',
               [rfReplaceAll])
         else
            XMLContent.Delete(I);
      end;
      Result := XMLContent.Text;
   finally
      XMLContent.Free;
   end;
end;

function TUMNFSeXMLBase.GetLoteRps: TUMTcLoteRps;
begin
   Result := FLoteRps;                        
end;

function TUMNFSeXMLBase.GetSchemaLocation: string;
begin
   Result := FSchemaLocation;
end;

function TUMNFSeXMLBase.GetXMLDocument: TXMLDocument;
begin
   Result := FXMLDocument;
end;

function TUMNFSeXMLBase.GetXMLDomDoc: IXMLDOMDocument3;
begin
   Result := FXMLDOMDoc;
end;

function TUMNFSeXMLBase.GetXMLDSig: IXMLDigitalSignatureEx;
begin
   Result := FXMLDSig;
end;

{ Recebe o caminho do sistema operacional onde o documento XML está armazenado
  e carrega seu conteúdo para o objeto do tipo IXMLDomDocument3. 
}
function TUMNFSeXMLBase.LoadXML(const XMLPath: string): Boolean;
begin
   Result := FileExists(XMLPath);
   if Result then
      XMLDomDoc.loadXML(GetCleanXML(XMLPath))
   else
      raise EUMNFSeException.CreateFmt(SFileNotFound, [XMLPath]);
end;

{ Este método recebe o endereço no sistema operacional onde o documento XML
  deverá ser salvo. Efetua-se a leitura dos objetos para escrever seu conteúdo
  no objeto do tipo TXMLDocument. Após escrever todo o conteúdo do XML, o método
  executa a assinatura utilizando um certificado digital previamente instalado
  no computador cliente. Após assinado, o documento é salvo no sistema de
  arquivos do sistema operacional.
}
function TUMNFSeXMLBase.SaveXML(const XMLPath: string): Boolean;
begin
   if WriteXML(XMLPath) then
   begin
      if LoadXML(XMLPath) then
      begin
         if SignXML then
         begin
            with TStringList.Create do
            begin
               try
                  Text := XMLDomDoc.xml;
                  SaveToFile(XMLPath);
               finally
                  Free;
               end;
            end;
         end
         else
            Result := False;
      end
      else
         Result := False;
   end
   else
      Result := False;
end;

{ Este método é responsável por efetuar a assinatura digital do documento XML.
  Primariamente verifica se o computador cliente possui certificados previamente
  instalados, solicitando ao usuário selecionar um certificado para efetuar a
  assinatura. Após selecionado o certificado, o método efetua o processo de
  assinatura propriamente dito.
}
function TUMNFSeXMLBase.SignXML: Boolean;
const
   DSigns = 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';
   STitle = 'Certificado%s disponíve%s';
   SDisplay = 'Selecione o Certificado Digital para uso';
   SCert: array [Boolean] of string = ('s', '');
   SDisp: array [Boolean] of string = ('is', 'l');
var
   H, I: Cardinal;
   Sett, Cert, Certs, Store: OleVariant;
   S1, S2, Provider, Container: string;
   ProviderType: CAPICOM_PROV_TYPE;
   Key, KeyOut: IXMLDSigKey;
   Sigs, X509: IXMLDOMNodeList;
   Sig: IXMLDOMNode;
begin
   Sett := CoSettings.Create;
   Sett.EnablePromptForCertificateUI := True;
   
   Store := CoStore.Create;
   Store.Open(CAPICOM_CURRENT_USER_STORE, 'My',
      CAPICOM_STORE_OPEN_EXISTING_ONLY);

   Certs := Store.Certificates;

   // Remove da lista os certificados que não são do tipo Signature

   for I := Store.Certificates.Count downto 1 do
   begin
      Cert := IInterface(Certs.Item[I]) as ICertificate2;
      if Cert.HasPrivateKey then
      begin
         Provider := Cert.PrivateKey.ProviderName;
         Container := Cert.ProvateKey.ContainerName;
      end
      else
         Certs.Remove(I);
   end;

   try
      Cert := Null;
      S1 := SCert[Certs.Count = 0];
      S2 := SDisp[Certs.Count = 0];
      Certs := Certs.Select(Format(STitle, [S1, S2]), SDisplay, False);
      Cert := IInterface(Certs.Item[1]) as ICertificate2;
   except
      on E: EOleException do
         if E.ErrorCode = $80880902 then // Usuário abortou a seleção
            Abort
         else
            raise EUMNFSeException.CreateFmt(SSelectError, [E.Message]);
   end;

   if not VarIsNull(Cert) then
   begin

      // Procura e encontra os nodos <ds:Signature>
      
      XMLDomDoc.setProperty('SelectionNamespaces', DSigns);
      Sigs := XMLDomDoc.selectNodes('.//ds:Signature');

      if Sigs.length = 0 then
         raise EUMNFSeException.Create(STagSigNotFound);

      // É necessário ter a primeira assinatura

      XMLDSig.signature := Sigs.item[0];
      XMLDSig.store := Store;
      ProviderType := Cert.PrivateKey.ProviderType;
      Provider := Cert.PrivateKey.ProviderName;
      Container := Cert.PrivateKey.ContainerName;

      // Assina cada tag Signature encontrada
      
      for I := 0 to Sigs.length - 1 do
      begin

         // Pega o próximo nodo <ds:Signature>
         
         XMLDSig.signature := Sigs.item[I];
         Key := XMLDSig.createKeyFromCSP(ProviderType, Provider, Container, 0);

         if not Assigned(Key) then
            raise EUMNFSeException.Create(SInvalidKey);

         KeyOut := XMLDSig.sign(Key, CERTIFICATES or PURGE);

         // Deixa no KeyInfo somente um X509Data

         X509 := XMLDomDoc.selectNodes('//ds:X509Data[position() > 1]');
         if X509.length > 0 then
            for H := X509.length downto 0 do
            begin
               Sig := X509.item[H].parentNode;
               X509.item[H].text := '';
               Sig.removeChild(X509.item[H]);
            end;
      end;
   end;

   if not Assigned(KeyOut) then
      raise EUMNFSeException.Create(SSigFail);
      
   Result := True;
end;

{ TUMNFSeXMLCuritiba }

function TUMNFSeXMLCuritiba.WriteXML(const XMLPath: string): Boolean;

   function GetFormattedDateTime(const DateTime: TDateTime): string;
   begin
      Result := FormatDateTime('yyyy-mm-ddThh:nn:ss', DateTime);
   end;

   function GetFormattedDouble(const Value: TUMTsValor): string;
   begin
      Result :=
         StringReplace(FloatToStrF(Value, ffGeneral, 15, 2), ',', '.',
            [rfReplaceAll]);
   end;
   
var
   I: TUMTsQuantidadeRps;
   InfRps: TUMTcInfRps;
   NodeListaRps, NodeRps, NodeInfRps: IXMLNode;
   ClassRef: TClass;
begin
   // Cria a tag raiz do documento XML e configura seus atributos

   XMLDocument.AddChild('EnviarLoteRpsEnvio');
   with XMLDocument.DocumentElement do
   begin
      Attributes['xmlns'] := SchemaLocation;
      Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
      Attributes['xsi:schemaLocation'] := SchemaLocation;
   end;

   // Adiciona o nodo LoteRps. O XML da Nota Fiscal de Serviços
   // Eletrônico só pode conter apenas um nodo LoteRps.

   with XMLDocument.DocumentElement.AddChild('LoteRps') do
   begin
      Attributes['Id'] := LoteRps.Id;
      AddChild('NumeroLote').NodeValue := LoteRps.NumeroLote;
      AddChild('Cnpj').NodeValue := LoteRps.Cnpj;
      AddChild('InscricaoMunicipal').NodeValue := LoteRps.InscricaoMunicipal;
      AddChild('QuantidadeRps').NodeValue := LoteRps.QuantidadeRps;
      NodeListaRps := AddChild('ListaRps');
   end;

   // Percorre a lista de RPS para adicioná-los no documento XML
   
   for I := 0 to LoteRps.QuantidadeRps - 1 do
   begin
      // Guarda referência para o objeto que contém as informações do RPS
      InfRps := LoteRps.ListaRps.Items[I].Rps;

      NodeRps := NodeListaRps.AddChild('Rps');
      NodeInfRps := NodeRps.AddChild('InfRps');
      NodeInfRps.Attributes['Id'] := InfRps.Id;

      // Escreve as informações de identificação do RPS

      with NodeInfRps.AddChild('IdentificacaoRps'), InfRps do
      begin
         with IdentificacaoRps do
         begin
            AddChild('Numero').NodeValue := Numero;
            AddChild('Serie').NodeValue := Serie;
            AddChild('Tipo').NodeValue := Tipo;
         end;
         AddChild('DataEmissao').NodeValue := GetFormattedDateTime(DataEmissao);
         AddChild('NaturezaOperacao').NodeValue := NaturezaOperacao;
         if RegimeEspecialTributacao <> 0 then
            AddChild('RegimeEspecialTributacao').NodeValue :=
               RegimeEspecialTributacao;
         AddChild('OptanteSimplesNacional').NodeValue := OptanteSimplesNacional;
         AddChild('IncentivadorCultural').NodeValue := IncentivadorCultural;
         AddChild('Status').NodeValue := Status;
      end;

      // Verifica se foi definido um Rps substituto
      // e escreve suas informações no documento XML

      if Assigned(InfRps.RpsSubstituido) then
         with NodeInfRps.AddChild('RpsSubstituido'), InfRps.RpsSubstituido do
         begin
            AddChild('Numero').NodeValue := Numero;
            AddChild('Serie').NodeValue := Serie;
            AddChild('Tipo').NodeValue := Tipo;
         end;

      with NodeInfRps.AddChild('Servico') do
      begin
         // Escreve os valores do serviço
         
         with AddChild('Valores'), InfRps.Servico.Valores do
         begin
            AddChild('ValorServicos').NodeValue :=
               GetFormattedDouble(ValorServicos);
            if ValorDeducoes <> 0 then
               AddChild('ValorDeducoes').NodeValue :=
                  GetFormattedDouble(ValorDeducoes);
            if ValorPis <> 0 then
               AddChild('ValorPis').NodeValue := GetFormattedDouble(ValorPis);
            if ValorCofins <> 0 then
               AddChild('ValorCofins').NodeValue :=
                  GetFormattedDouble(ValorCofins);
            if ValorInss <> 0 then
               AddChild('ValorInss').NodeValue := GetFormattedDouble(ValorInss);
            if ValorIr <> 0 then
               AddChild('ValorIr').NodeValue := GetFormattedDouble(ValorIr);
            if ValorCsll <> 0 then
               AddChild('ValorCsll').NodeValue := GetFormattedDouble(ValorCsll);
            AddChild('IssRetido').NodeValue := IssRetido;
            if ValorIss <> 0 then
               AddChild('ValorIss').NodeValue := GetFormattedDouble(ValorIss);
            if ValorIssRetido <> 0 then
               AddChild('ValorIssRetido').NodeValue :=
                  GetFormattedDouble(ValorIssRetido);
            if OutrasRetencoes <> 0 then
               AddChild('OutrasRetencoes').NodeValue :=
                  GetFormattedDouble(OutrasRetencoes);
            if BaseCalculo <> 0 then
               AddChild('BaseCalculo').NodeValue :=
                  GetFormattedDouble(BaseCalculo);
            if Aliquota <> 0 then
               AddChild('Aliquota').NodeValue := GetFormattedDouble(Aliquota);
            if ValorLiquidoNfse <> 0 then
               AddChild('ValorLiquidoNfse').NodeValue :=
                  GetFormattedDouble(ValorLiquidoNfse);
            if DescontoIncondicionado <> 0 then
               AddChild('DescontoIncondicionado').NodeValue :=
                  GetFormattedDouble(DescontoIncondicionado);
            if DescontoCondicionado <> 0 then
               AddChild('DescontoCondicionado').NodeValue :=
                  GetFormattedDouble(DescontoCondicionado);
         end;

         // Escreve as informações do serviço

         with InfRps.Servico do
         begin
            AddChild('ItemListaServico').NodeValue := ItemListaServico;
            if CodigoCnae <> 0 then
               AddChild('CodigoCnae').NodeValue := CodigoCnae;
            if CodigoTributacaoMunicipio <> '' then
               AddChild('CodigoTributacaoMunicipio').NodeValue :=
                  CodigoTributacaoMunicipio;
            AddChild('Discriminacao').DOMNode.appendChild(
               XMLDocument.DOMDocument.createCDATASection(Discriminacao));
            AddChild('CodigoMunicipio').NodeValue := CodigoMunicipio;
         end;

         // Adiciona as informações do prestador do serviço no documento XML

         with NodeInfRps.AddChild('Prestador'), InfRps.Prestador do
         begin
            AddChild('Cnpj').NodeValue := Cnpj;
            if InscricaoMunicipal <> '' then
               AddChild('InscricaoMunicipal').NodeValue := InscricaoMunicipal;
         end;

         // Verifica se foi definido um tomador do serviço
         // e escreve suas informações no documento XML

         if Assigned(InfRps.Tomador) then
         begin
            with NodeInfRps.AddChild('Tomador'), InfRps.Tomador do
            begin
               // Verifica se as informações de identificação do tomador
               // foram configuradas e escreve-as no documento XML

               if Assigned(IdentificacaoTomador) then
               begin
                  with AddChild('IdentificacaoTomador'), IdentificacaoTomador do
                  begin
                     // Verifica se foram definidos o Cpf e Cnpj
                     // do tomador e escrever as informações

                     if Assigned(CpfCnpj) then
                     begin
                        with AddChild('CpfCnpj'), CpfCnpj do
                        begin
                           if Cpf <> '' then
                              AddChild('Cpf').NodeValue := Cpf;
                           if Cnpj <> '' then
                              AddChild('Cnpj').NodeValue := Cnpj;
                        end;
                     end;

                     if InscricaoMunicipal <> '' then
                        AddChild('InscricaoMunicipal').NodeValue :=
                           InscricaoMunicipal;                                                                            
                  end;
               end;

               // Informa a razão social do tomador do serviço
               
               if RazaoSocial <> '' then
                  AddChild('RazaoSocial').DOMNode.appendChild(
                     XMLDocument.DOMDocument.createCDATASection(RazaoSocial));

               // Verifica se foiu definido o endereço do tomador do serviço
               // e escreve as informações no documento XML

               if Assigned(Endereco) then
               begin
                  with AddChild('Endereco'), Endereco do
                  begin
                     if Endereco <> '' then
                        AddChild('Endereco').DOMNode.appendChild(
                           XMLDocument.DOMDocument.createCDATASection(
                              Endereco));
                     if Numero <> '' then
                        AddChild('Numero').NodeValue := Numero;
                     if Complemento <> '' then
                        AddChild('Complemento').DOMNode.appendChild(
                           XMLDocument.DOMDocument.createCDATASection(
                              Complemento));
                     if Bairro <> '' then
                        AddChild('Bairro').DOMNode.appendChild(
                           XMLDocument.DOMDocument.createCDATASection(Bairro));
                     if CodigoMunicipio <> 0 then
                        AddChild('CodigoMunicipio').NodeValue :=
                           CodigoMunicipio;
                     if Uf <> '' then
                        AddChild('Uf').NodeValue := Uf;
                     if Cep <> 0 then
                        AddChild('Cep').NodeValue := Cep;
                  end;
               end;

               // Verifica se foram definidas as informações de contato com o
               // tomador do serviço e escreve-as no documento XML

               if Assigned(Contato) then
               begin
                  with AddChild('Contato'), Contato do
                  begin
                     if Telefone <> '' then
                        AddChild('Telefone').NodeValue := Telefone;
                     if Email <> '' then
                        AddChild('Email').NodeValue := Email;
                  end;
               end;
            end;
         end;
      end;

      // Verifica se foi definido o intermediário do serviço
      // e escreve suas informações no documento XML

      if Assigned(InfRps.IntermediarioServico) then
      begin
         with NodeInfRps.AddChild('IntermediarioServico'),
            InfRps.IntermediarioServico do
         begin
            AddChild('RazaoSocial').DOMNode.appendChild(
               XMLDocument.DOMDocument.createCDATASection(RazaoSocial));
            with AddChild('CpfCnpj'), CpfCnpj do
            begin
               if Cpf <> '' then
                  AddChild('Cpf').NodeValue := Cpf;
               if Cnpj <> '' then
                  AddChild('Cnpj').NodeValue := Cnpj;
            end;
            if InscricaoMunicipal <> '' then
               AddChild('InscricaoMunicipal').NodeValue := InscricaoMunicipal;
         end;
      end;

      // Verifica se foi definido como Contrução Civil
      // e adiciona as informações no documento XML

      if Assigned(InfRps.ConstrucaoCivil) then
         with NodeInfRps.AddChild('ConstrucaoCivil'), InfRps.ConstrucaoCivil do
         begin
            AddChild('CodigoObra').NodeValue := CodigoObra;
            AddChild('Art').NodeValue := Art;
         end;

      // Insere as tags de assinatura do Rps

      with NodeRps.AddChild('Signature') do
      begin
         Attributes['xmlns'] := 'http://www.w3.org/2000/09/xmldsig#';
         Attributes['Id'] := Format('Ass_%s', [InfRps.Id]);
         with AddChild('SignedInfo') do
         begin
            AddChild('CanonicalizationMethod').Attributes['Algorithm'] :=
               'http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments';
            AddChild('SignatureMethod').Attributes['Algorithm'] :=
               'http://www.w3.org/2000/09/xmldsig#rsa-sha1';
            with AddChild('Reference') do
            begin
               Attributes['URI'] := '#' + InfRps.Id;
               AddChild('Transforms').AddChild('Transform').
                  Attributes['Algorithm'] :=
                     'http://www.w3.org/2000/09/xmldsig#enveloped-signature';
               AddChild('DigestMethod').Attributes['Algorithm'] :=
                  'http://www.w3.org/2000/09/xmldsig#sha1';
               AddChild('DigestValue');
            end;
         end;
         AddChild('SignatureValue');
         AddChild('KeyInfo').AddChild('X509Data').AddChild('X509Certificate');
      end;
   end;

   // Insere as tags de assinatura do lote Rps

   with XMLDocument.DocumentElement.AddChild('Signature') do
   begin
      Attributes['xmlns'] := 'http://www.w3.org/2000/09/xmldsig#';
      Attributes['Id'] := Format('Ass_%s', [LoteRps.Id]);
      with AddChild('SignedInfo') do
      begin
         AddChild('CanonicalizationMethod').Attributes['Algorithm'] :=
            'http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments';
         AddChild('SignatureMethod').Attributes['Algorithm'] :=
            'http://www.w3.org/2000/09/xmldsig#rsa-sha1';
         with AddChild('Reference') do
         begin
            Attributes['URI'] := '#' + LoteRps.Id;
            AddChild('Transforms').AddChild('Transform').Attributes['Algorithm']
               := 'http://www.w3.org/2000/09/xmldsig#enveloped-signature';
            AddChild('DigestMethod').Attributes['Algorithm'] :=
               'http://www.w3.org/2000/09/xmldsig#sha1';
            AddChild('DigestValue');
         end;
      end;
      AddChild('SignatureValue');
      AddChild('KeyInfo').AddChild('X509Data').AddChild('X509Certificate');
   end;

   // Exclui o documento previamente salvo (se houver), salva o documento novo,
   // limpa o documento Xml e recarrega o documento para o objeto
   
   if FileExists(XMLPath) then
      DeleteFile(XMLPath);
   XMLDocument.SaveToFile(XMLPath);
   XMLDocument.DocumentElement.ChildNodes.Clear;
   XMLDocument.LoadFromFile(XMLPath);

   Result := True;
end;

{ TUMNFSeXMLRioSul }

function TUMNFSeXMLRioSul.WriteXML(const XMLPath: string): Boolean;
begin
   //
end;

end.
