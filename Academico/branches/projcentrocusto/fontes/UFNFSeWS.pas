unit UFNFSeWS;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFNFSeCad, UFNFSeFiltro, uDM, DB, xmldom, XMLIntf,
   msxmldom, XMLDoc, SOAPHTTPTrans, XSBuiltIns, UFProcessing, General,
   ZAbstractRODataset, UZDataset, ZAbstractDataset;

type
   TService = 1..6;

   TfNFSeWS = class(TForm)
      qryWebServices: TUMZQuery;
      qryInsereMsg: TUMZQuery;
      qryInsereConsulta: TUMZQuery;
      qryVariaveis: TUMZQuery;
      qryWebServicesCD_SERVICO: TSmallintField;
      qryWebServicesNM_SERVICO: TStringField;
      qryWebServicesDS_REQUEST_URL: TStringField;
      qryVariaveisNM_VARIAVEL: TStringField;
      HTTPReqResp: THTTPReqResp;
      XMLSendReq: TXMLDocument;
      XMLSendResp: TXMLDocument;
      qryInsereLote: TUMZQuery;
      qryAtuTitulos: TUMZQuery;
      qryTitulos: TUMZQuery;
      qryTitulosCODIGOALUNO: TIntegerField;
      qryTitulosTURMA: TStringField;
      qryTitulosCURSO: TStringField;
      qryTitulosCD_MENSALIDADE: TIntegerField;
      qryTitulosCD_TIPO_TITULO: TSmallintField;
      qryTitulosValorDeducoes: TFloatField;
      qryTitulosVALORPAGO: TFloatField;
      qryTitulosRazaoSocial: TStringField;
      qryTitulosDiscriminacao: TStringField;
      qryTitulosValorServicos: TFloatField;
      qryTitulosValorLiquidoNfse: TFloatField;
      qryTitulosDescontoIncondicionado: TFloatField;
      qryTitulosDescontoCondicionado: TFloatField;
      qryTitulosNumero: TStringField;
      qryTitulosComplemento: TStringField;
      qryTitulosBairro: TStringField;
      qryTitulosUf: TStringField;
      qryTitulosCep: TStringField;
      qryTitulosCnpj: TStringField;
      qryTitulosCpf: TStringField;
      qryTitulosTipoPessoa: TStringField;
      qryTitulosTelefone: TStringField;
      qryTitulosEmail: TStringField;
      XMLQueryReq: TXMLDocument;
      XMLQueryResp: TXMLDocument;
      qryConsulta: TUMZQuery;
      qryConsultaCD_CONSULTA: TSmallintField;
      qryConsultaNM_CONSULTA: TStringField;
      qryConsultaTX_CONSULTA: TMemoField;
    qryTitulosEndereco: TStringField;
    qryTitulosCodigoMunicipio: TLargeintField;
    qryVariaveisDS_VALOR: TStringField;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
   private
      FNFSeCad: TfNFSeCad;
      FNFSeFiltro: TfNFSeFiltro;
      function GetVariableValue(const Name: string): string;
      function GetURL(const Service: TService): string;
      function GetSoapAction(const Service: TService): string;
      procedure InsertLoteOnDataBase(const NewLote: Boolean);
   public
      procedure ShowCad;
      procedure ShowFilter;
      procedure Send(const NewLote: Boolean);
      procedure Query;
      property NFSeCad: TfNFSeCad read FNFSeCad;
      property VariableValue[const Name: string]: string read GetVariableValue;
      property URL[const Service: TService]: string read GetURL;
      property SoapAction[const Service: TService]: string read GetSoapAction;
   end;

var
   fNFSeWS: TfNFSeWS;

implementation

uses
   UNFSeDataMap;

{$R *.dfm}

procedure TfNFSeWS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FNFSeCad.Free;
   FNFSeFiltro.Free;
   Action := caFree;
end;

procedure TfNFSeWS.FormCreate(Sender: TObject);
begin
   qryWebServices.Open;
   
   if FNFSeCad = nil then
      FNFSeCad := TfNFSeCad.Create(Self);
   
   if FNFSeFiltro = nil then
   begin
      FNFSeFiltro := TfNFSeFiltro.Create(Self.Owner);
      FNFSeFiltro.CarregaDeptos;
      FNFSeFiltro.CarregaTiposTitulo;
      FNFSeFiltro.meAnoSemestre.Text := Format('%d', [DM.GetAnoSemestreAtual]);
      qryConsulta.Open;
      qryVariaveis.Open;
   end;

   FNFSeCad.dtpEnvioIni.Date := Now;
   FNFSeCad.dtpEnvioFim.Date := Now;

   ShowCad;
end;

procedure TfNFSeWS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         begin
            if FNFSeCad.Visible then
               if FNFSeCad.btnIncluir.Enabled then
                  FNFSeCad.btnIncluir.Click;
         end;
      VK_F5:
         begin
            if (FNFSeFiltro <> nil) and FNFSeFiltro.Visible then
               if FNFSeFiltro.btnSalvar.Enabled then
                  FNFSeFiltro.btnSalvar.Click;
         end;
      VK_F6:
         begin
            if (FNFSeFiltro <> nil) and FNFSeFiltro.Visible then
               if FNFSeFiltro.btnCancelar.Enabled then
                  FNFSeFiltro.btnCancelar.Click;
         end;
      VK_F7:
         begin
            if FNFSeCad.Visible then
               if FNFSeCad.btnTitulos.Enabled then
                  FNFSeCad.btnTitulos.Click;
         end;
      VK_F8:
         begin
            if FNFSeCad.Visible then
               if FNFSeCad.btnWebServices.Enabled then
                  FNFSeCad.btnWebServices.Click;
         end;
      VK_F9:
         begin
            if NFSeCad.Visible then
               if FNFSeCad.btnExcluir.Enabled then
                  FNFSeCad.btnExcluir.Click;
         end;
      VK_F12:
         begin
            if FNFSeCad.Visible then
               Close;
         end;
   end;
end;

function TfNFSeWS.GetSoapAction(const Service: TService): string;
begin
   Result := GetURL(Service);
   Result := StringReplace(Result, '?wsdl', '', []);
end;

function TfNFSeWS.GetURL(const Service: TService): string;
begin
   qryWebServices.Locate('CD_SERVICO', Service, []);
   Result := qryWebServicesDS_REQUEST_URL.AsString;
end;

function TfNFSeWS.GetVariableValue(const Name: string): string;
begin
   qryVariaveis.Locate('NM_VARIAVEL', Name, []);
   Result := qryVariaveisDS_VALOR.AsString;
end;

procedure TfNFSeWS.InsertLoteOnDataBase(const NewLote: Boolean);
const
   SSQLInsertLote =
      'INSERT INTO FIN_NFSE_WS_LOTE ' +
         '(CD_LOTE, NR_LOTE, NR_PROTOCOLO, DT_RECEBIMENTO, DT_ENVIO, DT_CRIACAO) '+
      'VALUES '+
         '(:CD_LOTE, :NR_LOTE, :NR_PROTOCOLO, :DT_RECEBIMENTO, NOW(), NOW())';
   
   SSQLInsertLote2 =
      'INSERT INTO FIN_NFSE_WS_LOTE ' +
         '(CD_LOTE, DT_ENVIO, DT_CRIACAO) '+
      'VALUES '+
         '(:CD_LOTE, NOW(), NOW())';

   function FindNode(const Node: IXMLNode; const Name: string): IXMLNode;
   var
      I: Integer;
   begin
      if Node.NodeName = Name then
         Result := Node
      else
         for I := 0 to Node.ChildNodes.Count - 1 do
         begin
            Result := FindNode(Node.ChildNodes[I], Name);
            if Result <> nil then
               Break;
         end;
   end;

   function XMLTimeToStr(const Value: OleVariant): string;
   var
      DateTime: TDateTime;
   begin
      DateTime := XMLTimeToDateTime(Value);
      Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', DateTime);
   end;

var
   I, CodigoLote: Integer;
   DataRecto, DateTimeNow: string;
   MsgNodes: IXMLNodeList;
   NodeNumLote, NodeProt, NodeDataRec, NodeListaMsg, NodeCod, NodeMsg,
   NodeCorr: IXMLNode;
begin
   if NewLote then
      CodigoLote := NFSeCad.NexCode
   else
      CodigoLote := FNFSeCad.qryLoteRpsCD_LOTE.AsInteger;

   // Procura os nodos NumeroLote, Protocolo e DataRecebimento no XML
   // de reposta à chamada ao serviço EnviarLoteRps no Web Service

   NodeNumLote := FindNode(XMLSendResp.DocumentElement, 'NumeroLote');
   NodeProt := FindNode(XMLSendResp.DocumentElement, 'Protocolo');
   NodeDataRec := FindNode(XMLSendResp.DocumentElement, 'DataRecebimento');

   if NewLote then
   begin
      // Se os nodos foram encontrados, significa que o lote foi recebido pelo
      // servidor e registra as informações no banco de dados

      if (NodeNumLote = nil) and (NodeProt = nil) and (NodeDataRec = nil) then
      begin
         qryInsereLote.SQL.Text := SSQLInsertLote2;
      end
      else
      begin
         DataRecto := XMLTimeToStr(NodeDataRec.NodeValue);
         qryInsereLote.SQL.Text := SSQLInsertLote;
         qryInsereLote.ParamByName('NR_LOTE').AsInteger := NodeNumLote.NodeValue;
         qryInsereLote.ParamByName('NR_PROTOCOLO').AsString := NodeProt.NodeValue;
         qryInsereLote.ParamByName('DT_RECEBIMENTO').AsString := DataRecto;
      end;
      qryInsereLote.ParamByName('CD_LOTE').AsInteger := CodigoLote;
      qryInsereLote.ExecSQL;
   end
   else
   begin
      if (NodeNumLote <> nil) and (NodeProt <> nil) and (NodeDataRec <> nil) then
      begin
         DataRecto := DateToStr(XMLTimeToDateTime(NodeDataRec.NodeValue));
         FNFSeCad.qryLoteRps.Edit;
         FNFSeCad.qryLoteRpsNR_LOTE.AsInteger := NodeNumLote.NodeValue;
         FNFSeCad.qryLoteRpsNR_PROTOCOLO.AsString := NodeProt.NodeValue;
         FNFSeCad.qryLoteRpsDT_RECEBIMENTO.AsString := DataRecto;
         FNFSeCad.qryLoteRps.Post;
      end;
   end;

   // Registra no banco de dados a consulta efetuada no Web Service

   DateTimeNow := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
   qryInsereConsulta.ParamByName('CD_LOTE').AsInteger := CodigoLote;
   qryInsereConsulta.ParamByName('CD_SERVICO').AsInteger := 1;
   qryInsereConsulta.ParamByName('DT_CONSULTA').AsString := DateTimeNow;
   qryInsereConsulta.ExecSQL;

   // Insere no banco de dados as mensagens de retorno à consulta no Web Service

   NodeListaMsg := FindNode(XMLSendResp.DocumentElement, 'ListaMensagemRetorno');
   if NodeListaMsg <> nil then
   begin
      qryInsereMsg.ParamByName('CD_LOTE').AsInteger := CodigoLote;
      qryInsereMsg.ParamByName('CD_SERVICO').AsInteger := 1;
      qryInsereMsg.ParamByName('DT_CONSULTA').AsString := DateTimeNow;

      MsgNodes := NodeListaMsg.ChildNodes;
      for I := 0 to MsgNodes.Count - 1 do
      begin
         NodeCod := MsgNodes[I].ChildNodes.FindNode('Codigo');
         NodeMsg := MsgNodes[I].ChildNodes.FindNode('Mensagem');
         NodeCorr := MsgNodes[I].ChildNodes.FindNode('Correcao');
         qryInsereMsg.ParamByName('DS_CODIGO').AsString := NodeCod.NodeValue;
         qryInsereMsg.ParamByName('DS_MENSAGEM').AsString := NodeMsg.NodeValue;
         qryInsereMsg.ParamByName('DS_CORRECAO').AsString := NodeCorr.NodeValue;
         qryInsereMsg.ExecSQL;
      end;
   end;
end;

procedure TfNFSeWS.Query;

   function FindNode(const Node: IXMLNode; const Name: string): IXMLNode;
   var
      I: Integer;
   begin
      if Node.NodeName = Name then
         Result := Node
      else
         for I := 0 to Node.ChildNodes.Count - 1 do
         begin
            Result := FindNode(Node.ChildNodes[I], Name);
            if Result <> nil then
               Break;
         end;
   end;

   procedure ShowWaitForm;
   begin
      if fProcessing = nil then
         Application.CreateForm(TfProcessing, fProcessing);
      fProcessing.Show;
      Application.ProcessMessages;
   end;

   procedure CloseWaitForm;
   begin
      fProcessing.FCanClose := True;
      fProcessing.Close;
      fProcessing.Free;
      fProcessing := nil;
   end;

var
   I: Integer;
   DateTimeNow: string;
   ReqStream, RespStream: TStringStream;
   MsgNodeList: IXMLNodeList;
   NodeReq, NodePrest, NodeProt, NodeCnpj, NodeNumLote, NodeSitu, NodeMsgList,
   NodeCod, NodeMsg, NodeCorr: IXMLNode;
begin
   ShowWaitForm;

   // Procura o node raiz da requisição
   NodeReq :=
      FindNode(XMLQueryReq.DocumentElement, 'e:ConsultarSituacaoLoteRpsEnvio');

   // Verifica se encontrou o nodo raiz e preenche-o com as informações do
   // prestador do serviço e do lote Rps para consultar a situação
   
   if NodeReq <> nil then
   begin
      if NodeReq.Attributes['xmlns'] <> VariableValue['Namespace'] then
         NodeReq.Attributes['xmlns'] := VariableValue['Namespace'];
      NodePrest := FindNode(NodeReq, 'Prestador');
      NodeProt := FindNode(NodeReq, 'Protocolo');
      if NodePrest <> nil then
      begin
         NodeCnpj := FindNode(NodePrest, 'Cnpj');
         if NodeCnpj <> nil then
            NodeCnpj.NodeValue := VariableValue['Cnpj'];
      end;
      if NodeProt <> nil then
         NodeProt.NodeValue := NFSeCad.qryLoteRpsNR_PROTOCOLO.AsString;
   end;

   // Efetua a chamada ao Web Service e obtém o retorno

   ReqStream := TStringStream.Create(XMLQueryReq.XML.Text);
   RespStream := TStringStream.Create('');
   try
      HTTPReqResp.URL := URL[2];
      HTTPReqResp.SoapAction := SoapAction[2];
      try
         HTTPReqResp.Execute(ReqStream, RespStream);
      except
         on E: ESOAPHTTPException do
         begin
            if AnsiPos('O tempo limite da operação foi atingido', E.Message) > 0 then
            begin
               Mensagem('O servidor da prefeitura não respondeu a requisição ' +
                  'em tempo hábil.' + #13 + 'O lote RPS não foi enviado.',
                  'Erro', MB_ICONERROR + MB_OK, Handle);
            end;
            CloseWaitForm;
            raise;
         end;
      end;
      XMLQueryResp.LoadFromStream(RespStream);
   finally
      ReqStream.Free;
      RespStream.Free;
   end;

   // Registra uma nova consulta ao sistema de Web Service

   DateTimeNow := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
   qryInsereConsulta.ParamByName('CD_LOTE').AsInteger :=
      FNFSeCad.qryLoteRpsCD_LOTE.AsInteger;
   qryInsereConsulta.ParamByName('CD_SERVICO').AsInteger := 2;
   qryInsereConsulta.ParamByName('DT_CONSULTA').AsString := DateTimeNow;

   // Efetua a leitura do retorno da consulta

   NodeNumLote := FindNode(XMLQueryResp.DocumentElement, 'NumeroLote');
   NodeSitu := FindNode(XMLQueryResp.DocumentElement, 'Situacao');

   if (NodeNumLote <> nil) and (NodeSitu <> nil) then
   begin
      if FNFSeCad.qryLoteRps.Locate('NR_LOTE', NodeNumLote.NodeValue, []) then
      begin
         FNFSeCad.qryLoteRps.Edit;
         FNFSeCad.qryLoteRpsCD_SITUACAO.AsInteger := NodeSitu.NodeValue;
         FNFSeCad.qryLoteRps.Post;
      end;
   end
   else
   begin
      NodeMsgList :=
         FindNode(XMLQueryResp.DocumentElement, 'ListaMensagemRetorno');
      if NodeMsgList <> nil then
      begin
         qryInsereMsg.ParamByName('CD_LOTE').AsInteger :=
            FNFSeCad.qryLoteRpsCD_LOTE.AsInteger;
         qryInsereMsg.ParamByName('CD_SERVICO').AsInteger := 2;
         qryInsereMsg.ParamByName('DT_CONSULTA').AsString := DateTimeNow;
         MsgNodeList := NodeMsgList.ChildNodes;

         for I := 0 to MsgNodeList.Count - 1 do
         begin
            NodeCod := MsgNodeList.Get(I).ChildNodes.FindNode('Codigo');
            NodeMsg := MsgNodeList.Get(I).ChildNodes.FindNode('Mensagem');
            NodeCorr := MsgNodeList.Get(I).ChildNodes.FindNode('Correcao');
            qryInsereMsg.ParamByName('DS_CODIGO').AsString := NodeCod.NodeValue;
            qryInsereMsg.ParamByName('DS_MENSAGEM').AsString := NodeMsg.NodeValue;
            qryInsereMsg.ParamByName('DS_CORRECAO').AsString := NodeCorr.NodeValue;
            qryInsereMsg.ExecSQL;
         end;
      end;
   end;

   CloseWaitForm;

   FNFSeCad.qryLoteRps.Close;
   FNFSeCad.qryLoteRps.Open;
end;

procedure TfNFSeWS.Send(const NewLote: Boolean);

   procedure ShowWaitForm;
   begin
      if fProcessing = nil then
         Application.CreateForm(TfProcessing, fProcessing);
      fProcessing.Show;
      Application.ProcessMessages;
   end;

   procedure CloseWaitForm;
   begin
      fProcessing.FCanClose := True;
      fProcessing.Close;
      fProcessing.Free;
      fProcessing := nil;
   end;

const
   SSQLUpdateTitulos =
      'UPDATE MENSALIDADES SET NR_NF = :NR_NF WHERE CD_MENSALIDADE IN (%s)';
var
   List: string;
   CodigoLote: Integer;
   DataMap: TUMDataMap;
   ReqStream, RespStream, XMLStream: TStringStream;
begin
   // Monta o documento XML com base no dados filtrados pelo usuário e efetua a
   // assinatura digital do documento. Copia o conteúdo do XML.

   if NewLote then
      CodigoLote := FNFSeCad.NexCode
   else
      CodigoLote := FNFSeCad.qryLoteRpsCD_LOTE.AsInteger;

   try
      DataMap := TUMDataMap.Create(qryTitulos, qryVariaveis, CodigoLote);
      try
         ShowWaitForm;
         try
            DataMap.Parse;
         except
            on E: Exception do
            begin
               CloseWaitForm;
               raise;
            end;
         end;
         CloseWaitForm;
         DataMap.SignXML;
      except
         on E: Exception do raise;
      end;
      XMLStream := TStringStream.Create(DataMap.XMLDocument.XML.Text);
      try
         XMLSendReq.LoadFromStream(XMLStream);
      finally
         XMLStream.Free;
      end;
   finally
      DataMap.Free;                                                
   end;

   // Copia o conteúdo do XML para um Stream e envia através do Web Service
   // Pega o retorno do servidor e armazena no XML de resposta

   ShowWaitForm;

   HTTPReqResp.URL := URL[1];
   HTTPReqResp.SoapAction := SoapAction[1];
   HTTPReqResp.ConnectTimeout := 0;
   ReqStream := TStringStream.Create(XMLSendReq.XML.Text);
   RespStream := TStringStream.Create('');
   try
      try
         HTTPReqResp.Execute(ReqStream, RespStream);
      except
         on E: ESOAPHTTPException do
         begin
            if AnsiPos('O tempo limite da operação foi atingido', E.Message) > 0 then
            begin
               Mensagem('O servidor da prefeitura não respondeu a requisição ' +
                  'em tempo hábil.' + #13 + 'O lote RPS não foi enviado.',
                  'Erro', MB_ICONERROR + MB_OK, Handle);
            end;
            CloseWaitForm;
            raise;
         end;
      end;
      XMLSendResp.LoadFromStream(RespStream);
   finally
      ReqStream.Free;
      RespStream.Free;
   end;

   // Insere as informações de consulta e retorno
   // do Web Service no Banco de dados

   try
      InsertLoteOnDataBase(NewLote);
   except
      on E: Exception do
      begin
         CloseWaitForm;
         raise;
      end;
   end;

   // Atualiza o número da NF dos títulos no banco de dados
   if NewLote then
   begin
      List := '';
      qryTitulos.First;
      while not qryTitulos.Eof do
      begin
         if List <> '' then
            List := List + ',';
         List := List + qryTitulosCD_MENSALIDADE.AsString;
         qryTitulos.Next;
      end;
      qryAtuTitulos.SQL.Text := Format(SSQLUpdateTitulos, [List]);
      qryAtuTitulos.ParamByName('NR_NF').AsInteger := CodigoLote;
      qryAtuTitulos.ExecSQL;
   end;
   CloseWaitForm;
end;

procedure TfNFSeWS.ShowCad;
begin
   FNFSeCad.qryLoteRps.Close;
   FNFSeCad.qryLoteRps.Open;
   FNFSeCad.Visible := True;
   FNFSeCad.Parent := Self as TWinControl;
end;

procedure TfNFSeWS.ShowFilter;
begin
   FNFSeFiltro.dtpVenctoIni.Date := Now;
   FNFSeFiltro.dtpVenctoFim.Date := Now;
   FNFSeFiltro.dtpPgtoIni.Date := Now;
   FNFSeFiltro.dtpPgtoFim.Date := Now;
   FNFSeFiltro.dtpCompIni.Date := Now;
   FNFSeFiltro.dtpCompFim.Date := Now;
   FNFSeFiltro.btnSalvar.Enabled := False;
   FNFSeFiltro.Parent := Self as TWinControl;
   FNFSeFiltro.Visible := True;
end;

end.
