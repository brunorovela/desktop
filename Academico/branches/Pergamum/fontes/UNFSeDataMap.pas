unit UNFSeDataMap;

interface

uses
   DB, XMLIntf, Variants, SysUtils, XMLDoc, xmldom, General, CAPICOM_TLB,
   ComObj, ActiveX;

const
   SSelectError = 'Erro na seleção do certificado: %s';
   STagSigNotFound = 'A tag Signature não foi encontrada.';
   SInvalidKey = 'A chave é inválida.';
   SSigFail = 'Falha durante a assinatura do XML.';
   SMsxml5Require = 'A instalação do MSXML5 é requerido para esta ação.';

type
   TUMDataMap = class(TObject)
   private
      FCert: OleVariant;
      FXMLDoc: XMLIntf.IXMLDocument;
      FNumber: Cardinal;
      FLastRps: Cardinal;
      FNFSeDS: TDataSet;
      FVariablesDS: TDataSet;
      procedure SelectCertificate;
      function GenerateDigestValue(const XMLNode: IXMLNode): WideString;
      function GenerateSignatureValue(const XMLNode: IXMLNode): WideString;
      function GenerateX509Certificate(const XMLNode: IXMLNode): WideString;
      function FindVariable(const Name: string): Boolean;
      function GetVariableValue(const Name: string; const AllowNull: Boolean): OleVariant;
   public
      constructor Create(const NFSeDS, VariablesDS: TDataSet;
         const Number: Cardinal);
      destructor Destroy; override;
      procedure Parse;
      function SignXML: Boolean;
      property XMLDocument: XMLIntf.IXMLDocument read FXMLDoc;
   end;

implementation

{ TUMDataMap }

constructor TUMDataMap.Create(const NFSeDS, VariablesDS: TDataSet;
   const Number: Cardinal);
begin
   FXMLDoc := NewXMLDocument;
   FXMLDoc.ParseOptions := [poPreserveWhiteSpace];
   FXMLDoc.Options := [doNodeAutoIndent];
   FXMLDoc.NodeIndentStr := #9;
   FXMLDoc.Encoding := 'utf-8';

   FNFSeDS := NFSeDS;
   FVariablesDS := VariablesDS;
   FNumber := Number;
   try
      FLastRps := GetVariableValue('UltimoRPS', False);
   except
      on E: Exception do raise;
   end;
end;

destructor TUMDataMap.Destroy;
begin
   inherited;
end;

function TUMDataMap.FindVariable(const Name: string): Boolean;
begin
   Result := FVariablesDS.Locate('NM_VARIAVEL', Name, []);
end;

function TUMDataMap.GenerateDigestValue(const XMLNode: IXMLNode): WideString;
const
   SError = 'Ocorreu uma falha na tentativa de gerar Digest Value: %s';
var
   {
   Base64Len: Integer;
   MdLength: Cardinal;
   MdCtx: EVP_MD_CTX;
   Base64, MemOut: pBIO;
   InBuf: array of PAnsiChar;
   OutBuf: array [0..1023] of Char;
   MdValue: array [0..EVP_MAX_MD_SIZE] of Byte;
   }
   HashedData: IHashedData;
begin

   try
      HashedData := CoHashedData.Create;
      HashedData.Algorithm := CAPICOM_HASH_ALGORITHM_SHA1;
      HashedData.Hash(XMLNode.XML);
      Result := HashedData.Value;
   except
      on E: Exception do
         raise Exception.CreateFmt(SError, [E.Message]);
   end;
   {
   Base64 := BIO_new(BIO_f_base64);
   MemOut := BIO_new(BIO_s_mem);
   try
      Base64 := BIO_push(Base64, MemOut);
      try
         // Computa o conteúdo do buffer de entrada
         
         SetLength(InBuf, Length(XMLNode.XML));
         StrPCopy(PChar(InBuf), XMLNode.XML);

         // Calcula o valor do digest
         
         EVP_DigestInit(@MdCtx, EVP_sha1);
         EVP_DigestUpdate(@MdCtx, @InBuf, StrLen(PChar(InBuf)));
         EVP_DigestFinal(@MdCtx, @MdValue, MdLength);

         // Escreve no buffer de saída
         
         BIO_write(Base64, @MdValue, MdLength);
         BIO_flush(Base64);
         Base64Len := BIO_read(MemOut, @OutBuf, 1024);
         OutBuf[Base64Len - 1] := #0;
         Result := StrPas(@OutBuf);
      except
         on E: Exception do
            raise Exception.CreateFmt(SError, [E.Message]);
      end;
   finally
      BIO_free(Base64);
      BIO_free(MemOut);
   end;
   }
end;

function TUMDataMap.GenerateSignatureValue(const XMLNode: IXMLNode): WideString;
var
   Signer, SignedData, Attribute: OleVariant;
begin
   Signer := CoSigner.Create;
   Signer.Certificate := FCert;
   Signer.Options := CAPICOM_CERTIFICATE_INCLUDE_END_ENTITY_ONLY;

   SignedData := CoSignedData.Create;
   SignedData.Content := XMLNode.XML;

   Attribute := CoAttribute.Create;
   Attribute.Name := CAPICOM_AUTHENTICATED_ATTRIBUTE_SIGNING_TIME;
   Attribute.Value := Now;
   Signer.AuthenticatedAttributes.Add(Attribute);

   {
   Attribute := nil;
   Attribute := CoAttribute.Create;
   Attribute.Name := CAPICOM_AUTHENTICATED_ATTRIBUTE_DOCUMENT_NAME;
   Attribute.Value := ExtractFilePath(XMLNode.OwnerDocument.FileName);
   Signer.AuthenticatedAttributes.Add(Attribute);
   }

   Result := SignedData.Sign(Signer, True, CAPICOM_ENCODE_BASE64);
end;

function TUMDataMap.GenerateX509Certificate(
  const XMLNode: IXMLNode): WideString;
var
   Signer: ISigner2;
   SignedData: ISignedData;
   Attribute: IAttribute;
begin
   Signer := CoSigner.Create;
   Signer.Certificate := IInterface(FCert) as ICertificate2;

   SignedData := CoSignedData.Create;
   SignedData.Content := XMLNode.XML;

   Attribute := CoAttribute.Create;
   Attribute.Name := CAPICOM_AUTHENTICATED_ATTRIBUTE_SIGNING_TIME;
   Attribute.Value := Now;
   Signer.AuthenticatedAttributes.Add(Attribute);
   
   Result := SignedData.Sign(Signer, True, CAPICOM_ENCODE_BASE64);
end;

function TUMDataMap.GetVariableValue(const Name: string;
  const AllowNull: Boolean): OleVariant;
const
   SVarNull = 'A variável [%s] não foi configurada.';
begin
   if FindVariable(Name) then
   begin
      if Trim(FVariablesDS.FieldByName('DS_VALOR').AsString) = '' then
      begin
         if AllowNull then
            Result := Null
         else
         begin
            raise Exception.CreateFmt(SVarNull, [Name]);
         end;
      end
      else
         Result := FVariablesDS.FieldByName('DS_VALOR').AsVariant;
   end
   else
   begin
      if AllowNull then
         Result := Null
      else
      begin
         raise Exception.CreateFmt(SVarNull, [Name]);
      end;
   end;
end;

procedure TUMDataMap.SelectCertificate;
const
   STitle = 'Certificado%s disponíve%s';
   SDisplay = 'Selecione o Certificado Digital para uso';
   SCert: array [Boolean] of string = ('s', '');
   SDisp: array [Boolean] of string = ('is', 'l');
var
   I: Cardinal;
   S1, S2: string;
   Sett, Store, Certs: OleVariant;
begin
   Sett := CoSettings.Create;
   Sett.EnablePromptForCertificateUI := True;

   Store := CoStore.Create;
   Store.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_EXISTING_ONLY);

   Certs := Store.Certificates;

   // Remove da lista os certificados que não são do tipo Signature

   for I := Store.Certificates.Count downto 1 do
   begin
      FCert := IInterface(Certs.Item[I]) as ICertificate2;
      if not FCert.HasPrivateKey then
      begin
         Certs.Remove(I);
      end;
   end;

   try
      FCert := Null;
      S1 := SCert[Certs.Count = 0];
      S2 := SDisp[Certs.Count = 0];
      Certs := Certs.Select(Format(STitle, [S1, S2]), SDisplay, False);
      FCert := IInterface(Certs.Item[1]) as ICertificate2;
   except
      on E: EOleException do
         if E.ErrorCode = $80880902 then // Usuário abortou a seleção
            Abort
         else
            raise Exception.CreateFmt(SSelectError, [E.Message]);
   end;
end;

function TUMDataMap.SignXML: Boolean;
var
   I: Integer;
   Node: IXMLNode;
   NodeList: IXMLNodeList;
   DigestValue, SignValue, X509Cert: WideString;

   function GetChildNodes(const ParentNode: IXMLNode; const Name: WideString): IXMLNodeList;
   var
      I: Integer;
   begin
      Result := nil;
      for I := 0 to ParentNode.ChildNodes.Count - 1 do
         if ParentNode.ChildNodes[I].NodeName = Name then
         begin
            Result := ParentNode.ChildNodes[I].ChildNodes;
            Break;
         end
         else
         begin
            Result := GetChildNodes(ParentNode.ChildNodes[I], Name);
            if Result <> nil then
               Break;
         end;
   end;

   function GetNodeByTagName(const Node: IXMLNode; const Name: WideString): IXMLNode;
   var
      I: Integer;
   begin
      Result := nil;
      for I := 0 to Node.ChildNodes.Count - 1 do
         if Node.ChildNodes[I].NodeName = Name then
         begin
            Result := Node.ChildNodes[I];
            Break;
         end;
   end;

   function FindChildNode(const Node: IXMLNode; const Name: WideString): IXMLNode;
   var
      I: Integer;
   begin
      if Node.NodeName = Name then
         Result := Node
      else
      begin
         for I := 0 to Node.ChildNodes.Count - 1 do
            if Node.ChildNodes[I].NodeName = Name then
            begin
               Result := Node.ChildNodes[I];
               Break;
            end
            else
            begin
               Result := FindChildNode(Node.ChildNodes[I], Name);
               if Result <> nil then
                  Break;
            end;
      end;
   end;

   procedure SetNodeValue(const ParentNode: IXMLNode; const NodeName, Value: string);
   var
      ChildNode: IXMLNode;
   begin
      ChildNode := FindChildNode(ParentNode, NodeName);
      ChildNode.NodeValue := Value;
   end;
   
begin
   // Seleciona o certificado digital que será utilizado para assinatura
   SelectCertificate;

   Node := FindChildNode(FXMLDoc.DocumentElement, 'LoteRps');
   
   DigestValue := GenerateDigestValue(Node);
   SignValue := GenerateSignatureValue(Node);
   X509Cert := GenerateX509Certificate(Node);

   Node := FindChildNode(FXMLDoc.DocumentElement, 'EnviarLoteRpsEnvio');
   SetNodeValue(Node, 'DigestValue', DigestValue);
   SetNodeValue(Node, 'SignatureValue', SignValue);
   SetNodeValue(Node, 'X509Certificate', X509Cert);
   
   // Pega as tags Rps filhas da tag ListaRps
   NodeList := GetChildNodes(FXMLDoc.DocumentElement, 'ListaRps');

   // Gera a assinatura para cada Rps encontrado
   
   for I := 0 to NodeList.Count - 1 do
   begin
      Node := GetNodeByTagName(NodeList.Get(I), 'InfRps');
      
      DigestValue := GenerateDigestValue(Node);
      SignValue := GenerateSignatureValue(Node);
      X509Cert := GenerateX509Certificate(Node);
      
      SetNodeValue(NodeList.Get(I), 'DigestValue', DigestValue);
      SetNodeValue(NodeList.Get(I), 'SignatureValue', SignValue);
      SetNodeValue(NodeList.Get(I), 'X509Certificate', X509Cert);
   end;

end;

procedure TUMDataMap.Parse;
var
   QtdRps: Integer;
   SoapEnvNode, SoapBodyNode: IXMLNode;
   EnviarLoteRpsEnvio, LoteRps, ListaRps, Rps, InfRps, IdentificacaoRps,
   Servico, Valores, Prestador, Tomador, IdentificacaoTomador, CpfCnpj,
   Endereco, Contato, QuantidadeRps: IDOMElement;

   { Cria as tags de envelope do documento XML. }

   procedure CreateEnvelope;
   const
      SNSXSI = 'http://www.w3.org/2001/XMLSchema-instance';
      SNSXSD = 'http://www.w3.org/2001/XMLSchema';
      SNSSOAP = 'http://schemas.xmlsoap.org/soap/envelope/';
   begin
      SoapEnvNode := FXMLDoc.AddChild('soap:Envelope');
      SoapEnvNode.Attributes['xmlns:xsi'] := SNSXSI;
      SoapEnvNode.Attributes['xmlns:xsd'] := SNSXSD;
      SoapEnvNode.Attributes['xmlns:soap'] := SNSSOAP;
      SoapBodyNode := SoapEnvNode.AddChild('Body');
   end;

   { Busca o valor do campo no data set da NFSe. }

   function GetFieldValue(const Name: string; const AllowNull: OleVariant): OleVariant;
   const
      SFieldNull = 'O valor do campo [%s] não pode ser nulo.';
   begin
      Result := FNFSeDS.FieldByName(Name).AsVariant;
      if VarIsNull(Result) then
      begin
         if not AllowNull then
         begin
            raise Exception.CreateFmt(SFieldNull, [Name]);
         end;
      end
      else
      begin
         case FNFSeDS.FieldByName(Name).DataType of
            ftCurrency, ftFloat:
               begin
                  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
               end;
            ftDateTime:
               begin
                  Result := FormatDateTime('yyyy-mm-dd', Result) + 'T';
                  Result := Result + FormatDateTime('hh:nn:ss', Result);
               end;
            else
               begin
                  if Trim(Result) = '' then
                  begin
                     Result := Null;
                     if not AllowNull then
                     begin
                        raise Exception.CreateFmt(SFieldNull, [Name]);
                     end;
                  end;
               end;
         end;
      end;
   end;

   { Adiciona um novo elemento ao elemento passado como parâmetro. }

   procedure AppendElement(const ParentElement: IDOMElement;
      const Name: string; const Value: OleVariant);
   var
      NewElement: IDOMElement;
   begin
      NewElement := FXMLDoc.DOMDocument.createElement(Name);
      if not VarIsNull(Value) then
         NewElement.appendChild(FXMLDoc.DOMDocument.createTextNode(Value));
      ParentElement.appendChild(NewElement);
   end;

   { Adiciona um novo elemento com conteúdo CDATA. }

   procedure AppendCDATAElement(const ParentElement: IDOMElement;
      const Name: string; const Value: string);
   var
      NewElement: IDOMElement;
   begin
      NewElement := FXMLDoc.DOMDocument.createElement(Name);
      NewElement.appendChild(FXMLDoc.DOMDocument.createCDATASection(Value));
      ParentElement.appendChild(NewElement);
   end;

   { Busca o valor da variável e adiciona no elemento. }

   procedure AppendVarElement(const ParentElement: IDOMElement;
      const Name: string; const AllowNull: Boolean);
   var
      Value: OleVariant;
   begin
      try
         Value := GetVariableValue(Name, AllowNull);
      except
         on E: Exception do raise;
      end;
      if not VarIsNull(Value) then
         AppendElement(ParentElement, Name, Value);
   end;

   { Cria um elemento com um valor do tipo Date Time em formato XS. } 

   procedure AppendDateTimeElement(const ParentElement: IDOMElement;
      const Name: string; const Value: TDateTime);
   var
      Str: string;
   begin
      Str := FormatDateTime('yyyy-mm-dd', Value) + 'T';
      Str := Str + FormatDateTime('hh:nn:ss', Value);
      AppendElement(ParentElement, Name, Str);
   end;

   { Adiciona ao elemento pai um elemento com valor resgatado do Data Set da
     NFSe. }

   procedure AppendFieldElement(const ParentElement: IDOMElement;
      const Name: string; const AllowNull, UseCDATA: Boolean);
   var
      Value: OleVariant;
   begin
      try
         Value := GetFieldValue(Name, AllowNull);
      except
         on E: Exception do raise;
      end;
      if not VarIsNull(Value) then
      begin
         if UseCDATA then
            AppendCDATAElement(ParentElement, Name, Value)
         else
            AppendElement(ParentElement, Name, Value);
      end;
   end;

   { Cria um novo elemento. }

   function NewDOMElement(const Name: string): IDOMElement;
   begin
      Result := FXMLDoc.DOMDocument.createElement(Name);
   end;

   { Cria as tags de assinatura do documento XML. }
   
   procedure CreateSignTags(const Element: IDOMElement; const Id: string);
   const
      Namespace = 'http://www.w3.org/2000/09/xmldsig#';
   var
      Sign, SignInfo, CanonMethod, SignMethod, Ref, Transforms, Transform,
      Transform2, DigestMethod, DigestValue, SignValue, KeyInfo, X509Data,
      X509Cert: IDOMElement;

      function GetOwnerDocument: IDOMDocument;
      begin
         Result := Element.ownerDocument;
      end;

   begin
      Sign := GetOwnerDocument.createElement('Signature');
      Sign.setAttribute('xmlns', Namespace);
      SignInfo := GetOwnerDocument.createElementNS(Namespace, 'SignedInfo');
      CanonMethod := GetOwnerDocument.createElementNS(Namespace, 'CanonicalizationMethod');
      CanonMethod.setAttribute('Algorithm', 'http://www.w3.org/TR/2001/REC-xml-c14n-20010315');
      SignInfo.appendChild(CanonMethod);
      SignMethod := GetOwnerDocument.createElementNS(Namespace, 'SignatureMethod');
      SignMethod.setAttribute('Algorithm', 'http://www.w3.org/2000/09/xmldsig#rsa-sha1');
      SignInfo.appendChild(SignMethod);
      Ref := GetOwnerDocument.createElementNS(Namespace, 'Reference');
      Ref.setAttribute('URI', '#' + Id);
      Transforms := GetOwnerDocument.createElementNS(Namespace, 'Transforms');
      Transform := GetOwnerDocument.createElementNS(Namespace, 'Transform');
      Transform.setAttribute('Algorithm', 'http://www.w3.org/2000/09/xmldsig#enveloped-signature');
      Transform2 := GetOwnerDocument.createElementNS(Namespace, 'Transform');
      Transform2.setAttribute('Algorithm', 'http://www.w3.org/TR/2001/REC-xml-c14n-20010315');
      Transforms.appendChild(Transform);
      Transforms.appendChild(Transform2);
      DigestMethod := GetOwnerDocument.createElementNS(Namespace, 'DigestMethod');
      DigestMethod.setAttribute('Algorithm', 'http://www.w3.org/2000/09/xmldsig#sha1');
      DigestValue := GetOwnerDocument.createElementNS(Namespace, 'DigestValue');
      Ref.appendChild(Transforms);
      Ref.appendChild(DigestMethod);
      Ref.appendChild(DigestValue);
      SignInfo.appendChild(Ref);
      SignValue := GetOwnerDocument.createElementNS(Namespace, 'SignatureValue');
      KeyInfo := GetOwnerDocument.createElementNS(Namespace, 'KeyInfo');
      X509Data := GetOwnerDocument.createElementNS(Namespace, 'X509Data');
      X509Cert := GetOwnerDocument.createElementNS(Namespace, 'X509Certificate');
      X509Data.appendChild(X509Cert);
      KeyInfo.appendChild(X509Data);
      Sign.appendChild(SignInfo);
      Sign.appendChild(SignValue);
      Sign.appendChild(KeyInfo);
      Element.appendChild(Sign);
   end;
   
begin
   CreateEnvelope;

   // EnviarLoteRpsEnvio

   EnviarLoteRpsEnvio := NewDOMElement('EnviarLoteRpsEnvio');
   try
      EnviarLoteRpsEnvio.setAttribute('xmlns',
         GetVariableValue('Namespace', False));
   except
      on E: Exception do raise;
   end;

   LoteRps := NewDOMElement('LoteRps');
   LoteRps.setAttribute('Id', Format('lote:%d', [FNumber]));

   EnviarLoteRpsEnvio.appendChild(LoteRps);

   AppendElement(LoteRps, 'NumeroLote', FNumber);
   AppendVarElement(LoteRps, 'Cnpj', False);
   AppendVarElement(LoteRps, 'InscricaoMunicipal', False);
   QuantidadeRps := LoteRps.ownerDocument.createElement('QuantidadeRps');
   LoteRps.appendChild(QuantidadeRps);

   // ListaRps

   ListaRps := NewDOMElement('ListaRps');
   LoteRps.appendChild(ListaRps);

   QtdRps := 0;

   FNFSeDS.First;
   while not FNFSeDS.Eof do
   begin
      Inc(QtdRps);
      Inc(FLastRps);
      // Rps
      
      Rps := NewDOMElement('Rps');

      InfRps := NewDOMElement('InfRps');

      with InfRps do
      begin
         setAttribute('Id', Format('rps:%d', [FLastRps]));

         // IdentificacaoRps
         
         IdentificacaoRps := NewDOMElement('IdentificacaoRps');
         AppendElement(IdentificacaoRps, 'Numero', FLastRps);
         AppendVarElement(IdentificacaoRps, 'Serie', False);
         AppendElement(IdentificacaoRps, 'Tipo', 1);
         appendChild(IdentificacaoRps);

         AppendDateTimeElement(InfRps, 'DataEmissao', Now);
         AppendVarElement(InfRps, 'NaturezaOperacao', False);
         AppendVarElement(InfRps, 'OptanteSimplesNacional', False);
         AppendVarElement(InfRps, 'IncentivadorCultural', False);
         AppendElement(InfRps, 'Status', 1);

         // Servico

         Servico := NewDOMElement('Servico');

         // Valores
         
         Valores := NewDOMElement('Valores');
         try
            AppendFieldElement(Valores, 'ValorServicos', False, False);
         except
            on E: Exception do raise;
         end;
         AppendFieldElement(Valores, 'ValorDeducoes', True, False);
         AppendElement(Valores, 'IssRetido', 2);
         Servico.appendChild(Valores);

         AppendVarElement(Servico, 'ItemListaServico', False);
         AppendVarElement(Servico, 'CodigoCnae', True);
         AppendVarElement(Servico, 'CodigoTributacaoMunicipio', True);
         try
            AppendFieldElement(Servico, 'Discriminacao', False, True);
         except
            on E: Exception do raise;
         end;
         AppendVarElement(Servico, 'CodigoMunicipio', False);
         appendChild(Servico);

         // Prestador

         Prestador := NewDOMElement('Prestador');
         AppendVarElement(Prestador, 'Cnpj', False);
         AppendVarElement(Prestador, 'InscricaoMunicipal', True);
         appendChild(Prestador);

         // Tomador

         Tomador := NewDOMElement('Tomador');


         if (not VarIsNull(GetFieldValue('Cpf', True))) or
            (not VarIsNull(GetFieldValue('Cnpj', True))) then
         begin
            // IdentificacaoTomador

            IdentificacaoTomador := NewDOMElement('IdentificacaoTomador');

            // CpfCnpj

            CpfCnpj := NewDOMElement('CpfCnpj');
            try
               if GetFieldValue('TipoPessoa', False) = 'F' then
               begin
                  AppendFieldElement(CpfCnpj, 'Cpf', False, False);
               end
               else if GetFieldValue('TipoPessoa', False) = 'J' then
               begin
                  AppendFieldElement(CpfCnpj, 'Cnpj', False, False);
               end;
            except
               on E: Exception do raise;
            end;
            
            IdentificacaoTomador.appendChild(CpfCnpj);
            Tomador.appendChild(IdentificacaoTomador);
         end;

         // Razão Social

         AppendFieldElement(Tomador, 'RazaoSocial', True, True);

         // Endereço

         Endereco := NewDOMElement('Endereco');
         AppendFieldElement(Endereco, 'Endereco', True, True);
         AppendFieldElement(Endereco, 'Numero', True, False);
         AppendFieldElement(Endereco, 'Complemento', True, True);
         AppendFieldElement(Endereco, 'Bairro', True, True);
         AppendFieldElement(Endereco, 'CodigoMunicipio', True, False);
         AppendFieldElement(Endereco, 'Uf', True, False);
         AppendFieldElement(Endereco, 'Cep', True, False);
         if Endereco.hasChildNodes then
            Tomador.appendChild(Endereco);

         // Contato

         Contato := NewDOMElement('Contato');
         AppendFieldElement(Contato, 'Telefone', True, False);
         AppendFieldElement(Contato, 'Email', True, False);
         if Contato.hasChildNodes then
            Tomador.appendChild(Contato);

         appendChild(Tomador);
      end;

      Rps.appendChild(InfRps);
      CreateSignTags(Rps, Format('rps:%d', [FLastRps]));
      ListaRps.appendChild(Rps);
      FNFSeDS.Next;
   end;
   QuantidadeRps.appendChild(QuantidadeRps.ownerDocument.createTextNode(Format('%d', [QtdRps])));
   CreateSignTags(EnviarLoteRpsEnvio, Format('lote:%d', [FNumber]));
   SoapBodyNode.DOMNode.appendChild(EnviarLoteRpsEnvio);
end;

initialization
   CoInitialize(nil);

finalization
   CoUninitialize;

end.
