unit uIntegracaoPergamum;

interface

uses InvokeRegistry, SOAPHTTPClient, XMLDoc, Classes, Contnrs, XMLSchema, Forms;

const
   WS_PERGAMO_SERVICE = 'ws_integracao_wsdl';
   WS_PERGAMO_PORT = 'ws_integracao_wsdlPort';

type
   IPergamoWSDL = interface(IInvokable)['{51CBC158-6C70-487C-924B-F984AF31E5B3}']
      function ws_consulta_emp_deb(const cod_pessoa, chave: WideString): WideString; stdcall;
   end;

   TIntegracaoPergamo = class(TObject)
      private
         chave: String;
         SoapCliente: THTTPRIO;

         function XMlToObjectList(const content: WideString;
            const nameRootNode, nameChildNode: String): TObjectList;

      public
         constructor Create(chave, baseUrl, wsdlFile: String);

         // Implementação das funções que serão chamadas no webservice
         function GetPendenciasPessoa(const cod_pessoa: Integer): TObjectList;
         function TemPendenciaPessoa(const cod_pessoa: Integer): Boolean;

         class function GetInstance(chave, baseUrl, wsdlFile: String): TIntegracaoPergamo;
   end;

implementation

uses SysUtils, XMLIntf;


{ TIntegracaoPergamo }

constructor TIntegracaoPergamo.Create(chave, baseUrl, wsdlFile: String);
begin
   Self.chave := chave;

   Self.SoapCliente := THTTPRIO.Create(nil);
   Self.SoapCliente.WSDLLocation := baseUrl + wsdlFile;
   Self.SoapCliente.Service := WS_PERGAMO_SERVICE;
   Self.SoapCliente.Port := WS_PERGAMO_PORT;

   {Self.SoapCliente.HTTPWebNode.Proxy := 'proxy.unimestre.com:3128';}

   InvRegistry.RegisterInterface(TypeInfo(IPergamoWSDL), baseUrl, 'utf-8');
   InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IPergamoWSDL), baseUrl + '%operationName%');
end;

class function TIntegracaoPergamo.GetInstance(chave, baseUrl, wsdlFile: String): TIntegracaoPergamo;
begin
   // Não foi possível usar o padrão singleton, pois,
   // no delphi quando estamos chamando o WS pela segunda vez,
   // está acontecendo erro quando é utilizada a mesma instância. Com isso,
   // deixamos ele criar sempre que o WS for chamado.
   Result := TIntegracaoPergamo.Create(
      chave,
      baseUrl,
      wsdlFile
   );
end;

function TIntegracaoPergamo.GetPendenciasPessoa(
  const cod_pessoa: Integer): TObjectList;
begin
   Result := Self.XMlToObjectList(
      (Self.SoapCliente as IPergamoWSDL).ws_consulta_emp_deb(IntToStr(cod_pessoa), Self.chave),
      'consulta_deb', 'dados_debito'
   );
end;

function TIntegracaoPergamo.TemPendenciaPessoa(
  const cod_pessoa: Integer): Boolean;
var
   pendencias : TObjectList;
begin
   pendencias := Self.GetPendenciasPessoa(cod_pessoa);
   Result := True;

   if (pendencias.Count = 1) AND (TStringList(pendencias.Items[0]).Names[0] = 'erro') then
   begin
      Result := False;
   end;

   //regras
end;

function TIntegracaoPergamo.XMlToObjectList(
  const content: WideString; const nameRootNode, nameChildNode: String): TObjectList;
var
   xml: TXMLDocument;
   xmlContent : TStringStream;
   rootNode, childNode: IXMLNode;
   IChild, IChildField: Integer;
   valuesList: TStringList;
begin
   xmlContent := TStringStream.Create(UTF8Encode(content));
   Result := TObjectList.Create();

   xml := TXMLDocument.Create(Application);
   xml.LoadFromStream(xmlContent);
   xml.Active := True;

   rootNode := xml.DocumentElement;

   if (rootNode.NodeName <> nameRootNode) then
   begin
      if (rootNode.NodeName <> nameChildNode) then
      begin
         raise Exception.Create('Nodo root não compatível.');
      end;

      childNode := rootNode;
      if childNode.NodeName <> nameChildNode then
      begin
         raise Exception.Create('Nodo child não compatível');
      end;

      valuesList := TStringList.Create();
      for IChildField := 0 to childNode.ChildNodes.Count - 1 do
      begin
         valuesList.Values[childNode.ChildNodes[IChildField].NodeName] := UTF8Decode(childNode.ChildNodes[IChildField].NodeValue);
      end;

      Result.Add(valuesList);
      Exit;
   end;

   for IChild := 0 to rootNode.ChildNodes.Count - 1 do
   begin
      childNode := rootNode.ChildNodes.Get(IChild);
      if childNode.NodeName <> nameChildNode then
      begin
         raise Exception.Create('Nodo child não compatível');
      end;

      valuesList := TStringList.Create();
      for IChildField := 0 to childNode.ChildNodes.Count - 1 do
      begin
         valuesList.Values[childNode.ChildNodes[IChildField].NodeName] := UTF8Decode(childNode.ChildNodes[IChildField].NodeValue);
      end;

      Result.Add(valuesList);
   end;
end;

end.


