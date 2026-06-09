unit uXML;

interface

uses
   XMLDoc, XMLIntf, Classes, SysUtils, Variants, ActiveX;

const
   errAtributoNulo = 'O atributo [%s] não pode ser nulo no XML.';
   errCampoNulo = 'O campo [%s] não pode ser nulo no XML';
   errCadInscricaoDup = 'Cadastro de inscrição duplicado. Id: [%s]';
   errCadAtividadeDup = 'Cadastro de atividade duplicado. Id: [%s]';
   errCadEntradaDup = 'Cadastro de entrada duplicado. Chave: [%s]';
   errCadInscricaoAtividadeDup = 'Cadastro inscrição em atividade duplicado. Chave: [%s]';   
   errArqInexistente = 'O arquivo de XML não foi encontrado. Valor informado: [%s]';
   errComponentePaiNulo = 'O componente pai do XML não pode ser nulo.';
   SNULL = 'NULL';

type
   {Declarações prévias de classes}
   TUMTAMInscricao = class;
   TUMTAMAtividade = class;
   { Forma de acesso que o usuário está utilizando no momento. Pode estar
     efetuando uma entrada no evento ou a saída.
   }
   TUMTAMTipoAcesso = (taEntrada, taSaida, taSemPagar);

   { Esta classe é usada para gerar exceções ocorridas na leitura do arquivo XML
     do terminal de acesso.
   }
   EUMTAMXMLError = class(Exception)
   private
      constructor Create(ASMsg: string; const Args: array of const); overload;
      constructor Create(ASMsg: string); overload;
   end;

   { Esta classe armazena as informações referentes a uma entrada que está ligada
     à uma inscrição do evento.
   }
   TUMTAMEntrada = class(TObject)
   strict private
      FSCodigoInscricaoAtividade:string;
      FSCodInscricao: string;
      FSCodAtividade: string;
      FSDataEntrada: string;
      FSDataSaida: string;
      procedure setCodigoInscricaoAtividade(const AVCodigoInscricaoAtividade:OleVariant);
      procedure setCodInscricao(const AVCodInscricao: OleVariant);
      procedure setCodAtividade(const AVCodAtividade: OleVariant);
      procedure setDataEntrada(const AVDataEntrada: OleVariant);
      procedure setDataSaida(const AVDataSaida: OleVariant);
      function getDataEntrada: string;
      function getDataSaida: string;
      function getChave: string;
      function getCodigoAtividade:string;
   private
      constructor Create(const AVCodigoInscricaoAtividade, AVCodInscricao, AVCodAtividade, AVDataEntrada,
         AVDataSaida: OleVariant);
      destructor Destroy; override;
      function isAberto: boolean;
      property Chave: string read getChave;
      procedure fecha;
   public
      property CodInscricao: string read FSCodInscricao;
      property CodAtividade: string read getCodigoAtividade;
      property CodigoInscricaoAtividade: string read FSCodigoInscricaoAtividade;
      property DataEntrada: string read getDataEntrada;
      property DataSaida: string read getDataSaida;
   end;

   TUMTAMInscricoesAtividade = class(TObject)
   strict private
      FSCodigoInscricao: string;
      FSCodigoAtividade: string;
      FSCodigoInscricaoAtividade:string;
      procedure setCodigoInscricaoAtividade(const AVCodigoInscricaoAtividade:OleVariant);
      procedure setAtividade(const sCodigoAtividade: OleVariant);
      procedure setInscricao(const sCodigoInscricao: OleVariant);
      function getCodigoInscricaoAtividade:string;
      function getInscricao:string;
      function getAtividade:string;
      function getChave: string;

   private
      constructor Create(const AVCodigoInscricaoAtividade,sCodigoAtividade,sCodigoInscricao:OleVariant);
      destructor Destroy; override;
      property Chave: string read getChave;      
   public
      property CodigoInscricaoAtividade: string read getCodigoInscricaoAtividade;
      property CodigoInscricao: string read getInscricao;
      property CodigoAtividade: string read getAtividade;

   end;

   { Esta classe armazena informações referentes a uma inscrição no evento.
     Uma inscrição é composta por uma quantidade n de entradas.
   }
   TUMTAMInscricao = class(TObject)
   strict private
      FSCodInscricao: string;
      FSCodEvento: string;
      FSCodPessoa: string;
      FSNomePessoa: string;
      FSSnInscEvento: string;
      FSCodMensalidade: string;
      FSDataInscricao: string;
      FBPagouInscricao: boolean;
      FBNovaInscricao: boolean;
      FSlEntradas: TStringList;
      FSlInscricoesAtividades : TStringList;
      function getEntradaCount: integer;
      function getInscricoesAtividadesCount:integer;
      function getEntrada(const I: integer): TUMTAMEntrada;
      function getInscricaoAtividade(const I: integer): TUMTAMInscricoesAtividade;
      function getCodPessoa: string;
      function getNomePessoa: string;
      function getSnInscEvento: string;
      function getCodMensalidade: string;
      function getDataInscricao: string;
      function getNovaInscricao: string;
      function getPagouInscricao: string;
      procedure setCodInscricao(const AVCodInscricao: OleVariant);
      procedure setCodEvento(const AVCodEvento: OleVariant);
      procedure setCodPessoa(const AVCodPessoa: OleVariant);
      procedure setNomePessoa(const AVNomePessoa: OleVariant);
      procedure setSnInscEvento(const AVSnInscEvento: OleVariant);
      procedure setCodMensalidade(const AVCodMensalidade: OleVariant);
      procedure setDataInscricao(const AVDataInscricao: OleVariant);
      procedure setNovaInscricao(const AVNovaInscricao: OleVariant);
      procedure setPagouInscricao(const AVPagouInscricao: OleVariant);
   private
      constructor Create(const AVCodInscricao, AVNovaInscricao, AVCodEvento, AVCodPessoa,
         AVNomePessoa, AVSnInscEvento, AVCodMensalidade, AVDataInscricao,
         AVPagouInscricao: OleVariant);
      destructor Destroy; override;
      procedure fechaEntradas;
      function isPresencaRegistrada: boolean;
      property PagouInscricao: string read getPagouInscricao;
   public
      procedure addEntrada(AVCodigoAtividade,AVCodigoInscricaoAtividade:OleVariant); overload;
      procedure addEntrada(const AVCodigoInscricaoAtividade,AVCodInscricao,AVCodAtividade,AVDataEntrada,
         AVDataSaida: OleVariant); overload;
      procedure addInscricaoAtividade(const AVCodigoAtividade,AVCodigoInscricao,AVCodigoInscricaoAtividade:OleVariant);
      function getTipoAcesso(oInscricaoAtividade:TUMTAMInscricoesAtividade;oAtividade:TUMTAMAtividade): TUMTAMTipoAcesso;
      function isPagouInscricao: boolean;
      property CodInscricao: string read FSCodInscricao;
      function getInscricaoAtividadeByChave(const sChaveInscricaoAtividade:string): TUMTAMInscricoesAtividade;
      function getEntradaByChave(const sChaveEntrada:string): TUMTAMEntrada;
      property CodEvento: string read FSCodEvento;
      property CodPessoa: string read getCodPessoa;
      property NomePessoa: string read getNomePessoa;
      property SnInscEvento: string read getSnInscEvento;
      property CodMensalidade: string read getCodMensalidade;
      property DataInscricao: string read getDataInscricao;
      property EntradaCount: integer read getEntradaCount;
      property InscricoesAtividadesCount: integer read getInscricoesAtividadesCount;
      property Entrada[const i: integer]: TUMTAMEntrada read getEntrada;
      property InscricaoAtividade[const i: integer]: TUMTAMInscricoesAtividade read getInscricaoAtividade;
      property NovaInscricao: string read getNovaInscricao;
   end;

   TUMTAMEvento = class;

   {
      Esta classe possui as informações de uma atividade
   }
   TUMTAMAtividade = class (TObject)
   strict private
      FCodigoAtividade :string;
      FDescricaoAtividade :string;
      FUMEvento: TUMTAMEvento;
      FNomePalestrante:string;
      FDescricaoTema:string;
      FDataAtividade:string;
      FHoraInicio:string;
      FHoraFim:string;
      FNumeroHoras:string;
      FNumeroVagas:string;
      FAmbiente:string;
      FSnAtividadePadrao:string;
      FSnEscolheAtividade:string;
      function getCodigoAtividade:string;
      function getEvento:TUMTAMEvento;
      function getDescricaoAtividade:string;
      function getDataAtividade:string;
      function getHoraInicio:string;
      function getDescricaoTema:string;
      function getHoraFim:string;
      function getNumeroVagas:string;
      function getNumeroHoras:string;
      function getAmbiente:string;
      function getSnAtividadePadrao:string;
      function getSnEscolheAtividade:string;
      function setCodigoAtividade(sCodigoAtividade: OleVariant):string;
      procedure setEvento(const oEvento:TUMTAMEvento);
      procedure setDescricaoAtividade(const sDescricaoAtividade:OleVariant);
      procedure setDataAtividade(const sDataAtividade:OleVariant);
      procedure setHoraInicio(const sHoraInicio:OleVariant);
      procedure setDescricaoTema(const sDescricaoTema:OleVariant);      
      procedure setHoraFim(const sHoraFim:OleVariant);
      procedure setNumeroVagas(const sNumeroVagas:OleVariant);
      procedure setNumeroHoras(const sNumeroHoras:OleVariant);
      procedure setNomePalestrante(const sNomePalestrante:OleVariant);
      procedure setAmbiente(const sAmbiente:OleVariant);
      procedure setSnAtividadePadrao(const sSnAtividadePadrao:OleVariant);
      procedure setSnEscolheAtividade(const sSnEscolheAtividade:OleVariant);
   private
      constructor Create(const AVCodigoAtividade, AVDescricaoAtividade, AVNomePalestrante,
         AVDescricaoTema, AVDataAtividade, AVHoraInicio, AVHoraFim,
         AVAmbiente,AVSnAtividadePadrao,AVSnEscolheAtividade, AVNumeroVagas,AVNumeroHoras : OleVariant; oEvento:TUMTAMEvento);
      destructor Destroy; override;
   public
      property CodigoAtividade :string read getCodigoAtividade;
      property DescricaoAtividade :string read getDescricaoAtividade;
      property NomePalestrante:string read FNomePalestrante;
      property DescricaoTema:string read getDescricaoTema;
      property DataAtividade:string read getDataAtividade;
      property HoraInicio:string read getHoraInicio;
      property HoraFim:string read getHoraFim;
      property NumeroHoras:string read getNumeroHoras;
      property NumeroVagas:string read getNumeroVagas;
      property Ambiente:string read getAmbiente;
      property SnAtividadePadrao:string read getSnAtividadePadrao;
      property SnEscolheAtividade:string read getSnEscolheAtividade;
      property Evento:TUMTAMEvento read getEvento;

   end;//TUMTAMAtividade

   { Esta classe possui as informações de um evento.
     O evento é composto por uma quantidade n de inscrições.
   }
   TUMTAMEvento = class(TObject)
   strict private
      FSCodEvento: string;
      FSCodGestor: string;
      FSNomeEvento: string;
      FSDescEvento: string;
      FSDataEvento: string;
      FSNumeroVagas: string;
      FSValorInsc: string;
      FSDataVencto: string;
      FSDataIniInsc: string;
      FSDataFimInsc: string;
      FSSnBoleto: string;
      FSSnChecarFinan: string;
      FSSnChecarFinAcesso: string;
      FSSenha: string;
      FSDataCadastro: string;
      FSlInscricoes: TStringList;
      FSlAtividades: TStringList;
      FSSnLiberarInscricoes :string;
      function getInscricoesCount: integer;
      function getAtividadesCount: integer;
      function getInscricao(const I: integer): TUMTAMInscricao;
      function getAtividade(const I: integer): TUMTAMAtividade;      
      function getCodGestor: string;
      function getNomeEvento: string;
      function getDescEvento: string;
      function getDataEvento: string;
      function getNumeroVagas: string;
      function getValorInsc: string;
      function getDataVencto: string;
      function getDataIniInsc: string;
      function getDataFimInsc: string;
      function getSnBoleto: string;
      function getSnChecarFinan: string;
      function getSnChecarFinAcesso: string;
      function getDataCadastro: string;
      function getSnLiberarInscricoes:string;
      procedure setCodEvento(const AVCodEvento: OleVariant);
      procedure setCodGestor(const AVCodGestor: OleVariant);
      procedure setNomeEvento(const AVNomeEvento: OleVariant);
      procedure setDescEvento(const AVDescEvento: OleVariant);
      procedure setDataEvento(const AVDataEvento: OleVariant);
      procedure setNumeroVagas(const AVNumeroVagas: OleVariant);
      procedure setValorInsc(const AVValorInsc: OleVariant);
      procedure setDataVencto(const AVDataVencto: OleVariant);
      procedure setDataIniInsc(const AVDataIniInsc: OleVariant);
      procedure setDataFimInsc(const AVDataFimInsc: OleVariant);
      procedure setSnBoleto(const AVSnBoleto: OleVariant);
      procedure setSnChecarFinan(const AVSnChecarFinan: OleVariant);
      procedure setSnChecarFinAcesso(const AVSnChecarFinAcesso: OleVariant);
      procedure setSnLiberarInscricoes(const AVSnLiberarInscricoes:OleVariant);
      procedure setSenha(const AVSSenha: OleVariant);
      procedure setDataCadastro(const AVDataCadastro: OleVariant);
   private
      constructor Create(const AVCodEvento, AVCodGestor, AVNomeEvento,
         AVDescEvento, AVDataEvento, AVNumeroVagas, AVValorInsc, AVDataVencto,
         AVDataIniInsc, AVDataFimInsc, AVSnBoleto, AVSnChecarFinan, AVSSenha,
         AVDataCadastro, AVSnChecarFinAcesso ,AVSnLiberarInscricoes: OleVariant);
      destructor Destroy; override;
      property InscricoesCount: integer read getInscricoesCount;
      property Inscricao[const i: integer]:TUMTAMInscricao read getInscricao;
      property CodGestor: string read getCodGestor;
      property DescEvento: string read getDescEvento;
      property DataEvento: string read getDataEvento;
      property NumeroVagas: string read getNumeroVagas;
      property ValorInsc: string read getValorInsc;
      property DataVencto: string read getDataVencto;
      property DataIniInsc: string read getDataIniInsc;
      property DataFimInsc: string read getDataFimInsc;
      property SnBoleto: string read getSnBoleto;
      property SnChecarFinan: string read getSnChecarFinan;
      property DataCadastro: string read getDataCadastro;
   public
      function addAtividade(const AVCodigoAtividade, AVDescricaoAtividade, AVNomePalestrante,
         AVDescricaoTema, AVDataAtividade, AVHoraInicio, AVHoraFim,
         AVAmbiente,AVSnAtividadePadrao,AVSnEscolheAtividade, AVNumeroVagas,AVNumeroHoras : OleVariant; oEvento:TUMTAMEvento):TUMTAMAtividade;
      function addInscricao(const AVCodInscricao, AVNovaInscricao, AVCodEvento,
         AVCodPessoa, AVNomePessoa, AVSnInscEvento, AVCodMensalidade,
         AVDataInscricao, AVPagouInscricao: OleVariant): TUMTAMInscricao;
      function getInscricaoByPessoa(const ASCodPessoa: string): TUMTAMInscricao;
      function isPessoaExiste(const ASCodPessoa: string): boolean;
      function getTotalInscricoes: integer;
      function getTotalPresencas: integer;
      property CodEvento: string read FSCodEvento;
      property NomeEvento: string read getNomeEvento;
      property Senha: string read FSSenha;
      property SnChecarFinAcesso: string read getSnChecarFinAcesso;
      property Atividade[const i: integer]:TUMTAMAtividade read getAtividade;
      property AtividadesCount: integer read getAtividadesCount;
      property SnLiberarInscricoes: string read getSnLiberarInscricoes;      
      procedure fechaEntradas;
   end;

   { Esta classe é responsável por efetuar a leitura do conteúdo de um arquivo
     XML e armazenar as informações lidas em objetos.
   }
   TUMTerminalAcessoXML = class(TXMLDocument)
   strict private
      FUMEvento: TUMTAMEvento;
      FUMAtividade: TUMTAMAtividade;
      FSPathXML: string;
      procedure carregaEvento;
      procedure carregaInscricoes;
      procedure carregaAtividades;
      procedure carregaEntradas(AXMLNode: IXMLNode; AUMTAMInsricao: TUMTAMInscricao);
      procedure carregaInscricoesAtividades(AXMLNode: IXMLNode; AUMTAMInscricao :TUMTAMInscricao);
      function  carregaInscricaoAtividadeByCodigo(AXMLNodeInscricao: IXMLNode;AVSCodigoInscricaoAtividade:OleVariant):TUMTAMInscricoesAtividade;
      procedure salvaEvento;
      procedure salvaInscricoes;
      procedure salvaAtividades(AXMLNode: IXMLNode; AUMTAMEvento: TUMTAMEvento);
      procedure salvaInscricoesAtividades(AXMLNode: IXMLNode; AUMTAMInscricao: TUMTAMInscricao);
      procedure salvaEntradas(AXMLNode: IXMLNode; AUMTAMInscricao: TUMTAMInscricao);
   public
      constructor Create(AOwner: TComponent);
      destructor Destroy; override;
      procedure carregaXML(const ASPath: string);
      procedure salvaXML(const ASPath: string); overload;
      procedure salvaXML; overload;
      property UMEvento: TUMTAMEvento read FUMEvento;
      property UMAtividade: TUMTAMAtividade read FUMAtividade;
      procedure setAtividadeSel(oAtividadeSel : TUMTAMAtividade);
   end;

implementation

uses xmldom;

{ TUMTAMEntrada }

{ Construtor.
  Recebe os atributos referentes a entrada.
}
constructor TUMTAMEntrada.Create(const AVCodigoInscricaoAtividade,AVCodInscricao, AVCodAtividade,
  AVDataEntrada, AVDataSaida: OleVariant);
begin
   try
      Self.setCodigoInscricaoAtividade(AVCodigoInscricaoAtividade);
      Self.setCodInscricao(AVCodInscricao);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.setCodAtividade(AVCodAtividade);
   Self.setDataEntrada(AVDataEntrada);
   Self.setDataSaida(AVDataSaida);
end;

{ Destrutor. }
destructor TUMTAMEntrada.Destroy;
begin
   inherited;
end;

{ Fecha a entrada defininda a data de saída para hoje.
}
procedure TUMTAMEntrada.fecha;
begin
   if Trim(Self.FSDataSaida) = '' then
   begin
      Self.FSDataSaida := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
   end;
end;

{ Retorna o valor da data de entrada. Se o parâmetro é True e o atributo é vazio,
  retorna uma string com valor NULL.
}
function TUMTAMEntrada.getChave: string;
begin
   Result := Self.FSCodInscricao + Self.FSCodAtividade;
end;

function TUMTAMEntrada.getCodigoAtividade: string;
begin
   Result := Self.FSCodAtividade;
end;

function TUMTAMEntrada.getDataEntrada: string;
begin
   Result := Self.FSDataEntrada;
end;

function TUMTAMEntrada.getDataSaida: string;
begin
   Result := Self.FSDataSaida;
end;

function TUMTAMEntrada.isAberto: boolean;
begin
   Result := Trim(Self.DataSaida) = '';
end;

{ Recebe o código de inscrição ao qual a entrada está associada. Se o valor
  informado for nulo gera uma nova exceção.
}
procedure TUMTAMEntrada.setCodAtividade(const AVCodAtividade: OleVariant);
begin
   if AVCodAtividade = Null then
   begin
      raise EUMTAMXMLError.Create(errAtributoNulo, ['cd_atividade']);
   end
   else
   begin
      Self.FSCodAtividade := AVCodAtividade;
   end;
end;

procedure TUMTAMEntrada.setCodigoInscricaoAtividade(
  const AVCodigoInscricaoAtividade: OleVariant);
begin
   if AVCodigoInscricaoAtividade = Null then
   begin
      raise EUMTAMXMLError.Create(errAtributoNulo, ['cd_inscricao_atividade']);
   end else
   begin
      Self.FSCodigoInscricaoAtividade := AVCodigoInscricaoAtividade;
   end;
end;

procedure TUMTAMEntrada.setCodInscricao(const AVCodInscricao: OleVariant);
begin
   if AVCodInscricao = Null then
   begin
      raise EUMTAMXMLError.Create(errAtributoNulo, ['cd_inscricao']);
   end else
   begin
      Self.FSCodInscricao := AVCodInscricao;
   end;
end;

{ Recebe o valor de data de entrada. Em caso de valor nulo define o atributo
  como vazio.
}
procedure TUMTAMEntrada.setDataEntrada(const AVDataEntrada: OleVariant);
begin
   if AVDataEntrada <> Null then
   begin
      Self.FSDataEntrada := AVDataEntrada;
   end;
end;

{ Recebe o valor da data de saída da entrada. Em caso de valor nulo define o
  atributo como vazio.
}
procedure TUMTAMEntrada.setDataSaida(const AVDataSaida: OleVariant);
begin
   if AVDataSaida <> Null then
   begin
      Self.FSDataSaida := AVDataSaida;
   end;
end;

{ EUMTAMXMLError }

{ Construtor.
  Recebe uma mensagem com seus argumentos para substituição.
}
constructor EUMTAMXMLError.Create(ASMsg: string; const Args: array of const);
var
   Msg: string;
begin
   Msg := ASMsg;
   inherited CreateResFmt(@Msg, Args);
end;

{ Construtor.
  Gera uma nova exceção. Recebe uma mensagem.
}
constructor EUMTAMXMLError.Create(ASMsg: string);
begin
   inherited Create(ASMsg);
end;

{ TUMTAMInscricao }

{ Adiciona uma nova entrada à inscrição.
  Recebe os atributos de uma nova entrada e adiciona à lista de entradas
  da inscrição.
}
procedure TUMTAMInscricao.addEntrada(const AVCodigoInscricaoAtividade ,AVCodInscricao, AVCodAtividade,
  AVDataEntrada, AVDataSaida: OleVariant);
var
   oEntrada: TUMTAMEntrada;
begin
   try
      oEntrada := TUMTAMEntrada.Create(AVCodigoInscricaoAtividade,AVCodInscricao,AVCodAtividade, AVDataEntrada, AVDataSaida);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.FSlEntradas.AddObject(AVCodInscricao+AVCodAtividade, oEntrada);
end;




procedure TUMTAMInscricao.addInscricaoAtividade(const AVCodigoAtividade,
  AVCodigoInscricao, AVCodigoInscricaoAtividade:OleVariant);
var
   oInscricaoAtividade : TUMTAMInscricoesAtividade;
begin

   try
      oInscricaoAtividade:= TUMTAMInscricoesAtividade.Create(AVCodigoInscricaoAtividade,AVCodigoAtividade,AVCodigoInscricao);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.FSlInscricoesAtividades.AddObject(AVCodigoInscricao+AVCodigoAtividade,oInscricaoAtividade);
end;

procedure TUMTAMInscricao.addEntrada(AVCodigoAtividade,AVCodigoInscricaoAtividade:OleVariant);
var
   oEntrada: TUMTAMEntrada;
   sData: string;
begin
   try
      sData:=FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
      oEntrada := TUMTAMEntrada.Create(AVCodigoInscricaoAtividade,Self.FSCodInscricao,AVCodigoAtividade, sData, '');
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.FSlEntradas.AddObject(Self.FSCodInscricao + AVCodigoAtividade, oEntrada);
end;

{ Construtor.
  Cria um novo objeto de inscrição do evento.
  Recebe os atributos referentes à uma inscrição.
}

constructor TUMTAMInscricao.Create(const AVCodInscricao, AVNovaInscricao, AVCodEvento,
  AVCodPessoa, AVNomePessoa, AVSnInscEvento, AVCodMensalidade,
  AVDataInscricao, AVPagouInscricao: OleVariant);
begin
   try
      Self.setCodInscricao(AVCodInscricao);
      Self.setCodEvento(AVCodEvento);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.setCodPessoa(AVCodPessoa);
   Self.setNovaInscricao(AVNovaInscricao);
   Self.setNomePessoa(AVNomePessoa);
   Self.setSnInscEvento(AVSnInscEvento);
   Self.setCodMensalidade(AVCodMensalidade);
   Self.setDataInscricao(AVDataInscricao);
   Self.setPagouInscricao(AVPagouInscricao);
   Self.FSlEntradas := TStringList.Create;
   Self.FSlInscricoesAtividades := TStringList.Create;
end;

{ Destrutor.
  Destrói a lista de entradas.
}
destructor TUMTAMInscricao.Destroy;
var
   i: integer;
begin
   for i := 0 to Self.getEntradaCount - 1 do
   begin
      TUMTAMEntrada(Self.FSlEntradas.Objects[i]).Free;
   end;
   Self.FSlEntradas.Free;
   inherited;
end;

{ Fecha todas as entradas da inscrição que estão abertas.
}
procedure TUMTAMInscricao.fechaEntradas;
var
   i: integer;
begin
   for i := 0 to Self.EntradaCount - 1 do
   begin
      Self.Entrada[i].fecha;      
   end;
end;

function TUMTAMInscricao.getCodMensalidade: string;
begin
   Result := Self.FSCodMensalidade;
end;

function TUMTAMInscricao.getCodPessoa: string;
begin
   Result := Self.FSCodPessoa;
end;

function TUMTAMInscricao.getDataInscricao: string;
begin
   Result := Self.FSDataInscricao;
end;

{ Retorna um objeto de entrada na posição I da lista de entradas.
}
function TUMTAMInscricao.getEntrada(const I: integer): TUMTAMEntrada;
begin
   Result := TUMTAMEntrada(Self.FSlEntradas.Objects[i]);
end;

function TUMTAMInscricao.getEntradaByChave(
  const sChaveEntrada: string): TUMTAMEntrada;
var
   iIndice:integer;
begin
   Self.FSlEntradas.Sort;

   if Self.FSlEntradas.Find(sChaveEntrada, iIndice) then
   begin
      Result := Self.Entrada[iIndice];
   end else
   begin
      Result := nil;
   end;
   
end;

{ Retorna a quantidade total de entradas da inscrição.
}
function TUMTAMInscricao.getEntradaCount: integer;
begin
   Result := Self.FSlEntradas.Count;
end;

function TUMTAMInscricao.getInscricaoAtividade(
  const I: integer): TUMTAMInscricoesAtividade;
begin
   Result := TUMTAMInscricoesAtividade(Self.FSlInscricoesAtividades.Objects[i]);
end;

function TUMTAMInscricao.getInscricaoAtividadeByChave(
  const sChaveInscricaoAtividade:string): TUMTAMInscricoesAtividade;
var
   iIndice:Integer;
begin
   Self.FSlInscricoesAtividades.Sort;

   if Self.FSlInscricoesAtividades.Find(sChaveInscricaoAtividade, iIndice) then
   begin
      Result := Self.InscricaoAtividade[iIndice];
   end else
   begin
      Result := nil;
   end;
end;

function TUMTAMInscricao.getInscricoesAtividadesCount: integer;
begin
   Result := Self.FSlInscricoesAtividades.Count;
end;

function TUMTAMInscricao.getNomePessoa: string;
begin
   Result := Self.FSNomePessoa;
end;

function TUMTAMInscricao.getNovaInscricao: string;
begin
   if Self.FBNovaInscricao then
   begin
      Result := 'true';
   end else
   begin
      Result := 'false';
   end;
end;

function TUMTAMInscricao.getPagouInscricao: string;
begin
   if Self.FBPagouInscricao then
   begin
      Result := '1';
   end else
   begin
      Result := '0';
   end;
end;

function TUMTAMInscricao.getSnInscEvento: string;
begin
   Result := Self.FSSnInscEvento;
end;

{ Define o código de evento da inscrição. Se o valor informado é nulo, gera
  uma nova exceção.
}
procedure TUMTAMInscricao.setCodEvento(const AVCodEvento: OleVariant);
begin
   if AVCodEvento = Null then
   begin
      raise EUMTAMXMLError.Create(errCampoNulo, ['CD_EVENTO']);
   end else
   begin
      Self.FSCodEvento := AVCodEvento;
   end;
end;

{ Define o código de chave primária da inscrição. Se o valor informado é nulo,
  gera uma nova exceção.
}
procedure TUMTAMInscricao.setCodInscricao(const AVCodInscricao: OleVariant);
begin
   if AVCodInscricao = Null then
   begin
      raise EUMTAMXMLError.Create(errCampoNulo, ['CD_INSCRICAO']);
   end else
   begin
      Self.FSCodInscricao := AVCodInscricao;
   end;
end;

{ Define o valor do código de mensalidade vinculado à inscrição. Se o valor
  informado é nulo, define o valor como uma string vazia.
}
procedure TUMTAMInscricao.setCodMensalidade(
  const AVCodMensalidade: OleVariant);
begin
   if AVCodMensalidade <> Null then
   begin
      Self.FSCodMensalidade := AVCodMensalidade;
   end;
end;

{ Define o código de pessoa vínculado à inscrição. Se o valor informado é nulo,
  define o valor do atributo como string vazia.
}
procedure TUMTAMInscricao.setCodPessoa(const AVCodPessoa: OleVariant);
begin
   if AVCodPessoa <> Null then
   begin
      Self.FSCodPessoa := AVCodPessoa;
   end;
end;

{ Define a data de inscrição. Em caso de valor nulo, define o valor do atributo
  como string vazia.
}
procedure TUMTAMInscricao.setDataInscricao(
  const AVDataInscricao: OleVariant);
begin
   if AVDataInscricao <> Null then
   begin
      Self.FSDataInscricao := AVDataInscricao;
   end;
end;

{ Define o nome de pessoa ligada à inscrição. Se o valor informado é nulo,
  define o atributo como string vazia.
}
procedure TUMTAMInscricao.setNomePessoa(const AVNomePessoa: OleVariant);
begin
   if AVNomePessoa <> Null then
   begin
      Self.FSNomePessoa := AVNomePessoa;
   end;
end;

procedure TUMTAMInscricao.setNovaInscricao(const AVNovaInscricao: OleVariant);
begin
   if AVNovaInscricao <> Null then
   begin
      Self.FBNovaInscricao := Trim(AVNovaInscricao) = 'true';
   end;
end;

procedure TUMTAMInscricao.setPagouInscricao(const AVPagouInscricao: OleVariant);
begin
   if AVPagouInscricao <> Null then
   begin
      Self.FBPagouInscricao := UpperCase(Trim(AVPagouInscricao)) = '1';
   end;
end;

{ Define o valor para o atributo FSSnInscEvento. Se o valor informado é nulo,
  define o valor do atributo como string vazia.
}
procedure TUMTAMInscricao.setSnInscEvento(const AVSnInscEvento: OleVariant);
begin
   if AVSnInscEvento <> Null then
   begin
      Self.FSSnInscEvento := AVSnInscEvento;
   end;
end;

{ Percorre todas as entradas para a inscrição do aluno. Se encontrar uma entrada
  não fechada retorna informando que o tipo é taSaida. Caso contrário é taEntrada.
}
function TUMTAMInscricao.getTipoAcesso(oInscricaoAtividade:TUMTAMInscricoesAtividade;oAtividade:TUMTAMAtividade): TUMTAMTipoAcesso;
var
   iIndice: Integer;
begin

   for iIndice := 0 to Self.EntradaCount - 1 do
   begin
      //Procura as entradas desse inscrito  e desta atividade
      if (Self.Entrada[iIndice].Chave = oInscricaoAtividade.Chave ) then
      begin
         //ve se está aberta, se tiver fecha e da como saida
         if (Self.Entrada[iIndice].isAberto) then
         begin
            Self.Entrada[iIndice].fecha;
            Result := taSaida;
            Exit;
         end;
      end;
   end;


   if Self.FBPagouInscricao or Self.FBNovaInscricao then
   begin
      Self.addEntrada(oAtividade.CodigoAtividade,oInscricaoAtividade.CodigoInscricaoAtividade);
      Result := taEntrada;
   end else
   begin
      Result := taSemPagar;
   end;
end;

function TUMTAMInscricao.isPagouInscricao: boolean;
begin
   Result := Self.FBPagouInscricao;
end;

{ Verifica se o inscrito já possui alguma entrada registrada.
}
function TUMTAMInscricao.isPresencaRegistrada: boolean;
begin
   Result := (Self.FSlEntradas.Count > 0);
end;

{ TUMTAMEvento }

{ Adiciona uma inscrição ao evento.
  Recebe os atributos da inscrição e adiciona um novo objeto de inscriçao à
  lista de inscrições do evento.
}
function TUMTAMEvento.addAtividade(const AVCodigoAtividade,
  AVDescricaoAtividade, AVNomePalestrante, AVDescricaoTema, AVDataAtividade,
  AVHoraInicio, AVHoraFim, AVAmbiente, AVSnAtividadePadrao,
  AVSnEscolheAtividade, AVNumeroVagas, AVNumeroHoras: OleVariant;
  oEvento: TUMTAMEvento): TUMTAMAtividade;
begin
   try
      Result:= TUMTAMAtividade.Create(AVCodigoAtividade,AVDescricaoAtividade,AVNomePalestrante,
      AVDescricaoTema,AVDataAtividade,AVHoraInicio,AVHoraFim,AVAmbiente,AVSnAtividadePadrao,
      AVSnEscolheAtividade,AVNumeroVagas,AVNumeroHoras,oEvento);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.FSlAtividades.AddObject(AVCodigoAtividade, Result);
end;

function TUMTAMEvento.addInscricao(const AVCodInscricao, AVNovaInscricao, AVCodEvento,
   AVCodPessoa, AVNomePessoa, AVSnInscEvento, AVCodMensalidade, AVDataInscricao,
   AVPagouInscricao: OleVariant): TUMTAMInscricao;
begin
   try
      Result := TUMTAMInscricao.Create(AVCodInscricao, AVNovaInscricao, AVCodEvento,
         AVCodPessoa, AVNomePessoa, AVSnInscEvento, AVCodMensalidade, AVDataInscricao,
         AVPagouInscricao);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.FSlInscricoes.AddObject(AVCodPessoa, Result);
end;

{ Construtor.
  Cria um novo objeto de evento. Define os valores dos atributos do objeto.
}
constructor TUMTAMEvento.Create(const AVCodEvento, AVCodGestor, AVNomeEvento,
  AVDescEvento, AVDataEvento, AVNumeroVagas, AVValorInsc, AVDataVencto,
  AVDataIniInsc, AVDataFimInsc, AVSnBoleto, AVSnChecarFinan, AVSSenha,
  AVDataCadastro, AVSnChecarFinAcesso,AVSnLiberarInscricoes: OleVariant);
begin
   try
      Self.setCodEvento(AVCodEvento);
      Self.setSenha(AVSSenha);
   except
      on E: EUMTAMXMLError do raise;
   end;
   Self.setCodGestor(AVCodGestor);
   Self.setNomeEvento(AVNomeEvento);
   Self.setDescEvento(AVDescEvento);
   Self.setDataEvento(AVDataEvento);
   Self.setNumeroVagas(AVNumeroVagas);
   Self.setValorInsc(AVValorInsc);
   Self.setDataVencto(AVDataVencto);
   Self.setDataIniInsc(AVDataIniInsc);
   Self.setDataFimInsc(AVDataFimInsc);
   Self.setSnBoleto(AVSnBoleto);
   Self.setSnChecarFinan(AVSnChecarFinan);
   Self.setSnChecarFinAcesso(AVSnChecarFinAcesso);
   Self.setDataCadastro(AVDataCadastro);
   Self.setSnLiberarInscricoes(AVSnLiberarInscricoes);
   Self.FSlInscricoes := TStringList.Create;
   Self.FSlAtividades := TStringList.Create;

end;

{ Destrutor. }
destructor TUMTAMEvento.Destroy;
var
   i: integer;
begin
   for i := 0 to Self.getInscricoesCount - 1 do
   begin
      TUMTAMInscricao(Self.FSlInscricoes.Objects[i]).Free;
   end;
   for i := 0 to Self.getAtividadesCount - 1 do
   begin
      TUMTAMAtividade(Self.FSlAtividades.Objects[i]).Free;
   end;
   Self.FSlInscricoes.Free;
   Self.FSlAtividades.Free;
   inherited;
end;

procedure TUMTAMEvento.fechaEntradas;
var
   iIndice: integer;
begin
   // Percorre as inscrições e fecha todas as entradas
   for iIndice := 0 to Self.InscricoesCount - 1 do
   begin
      self.Inscricao[iIndice].fechaEntradas;
   end;
end;


function TUMTAMEvento.getCodGestor: string;
begin
   Result := Self.FSCodGestor;
end;

function TUMTAMEvento.getDataCadastro: string;
begin
   Result := Self.FSDataCadastro;
end;

function TUMTAMEvento.getDataEvento: string;
begin
   Result := Self.FSDataEvento;
end;

function TUMTAMEvento.getDataFimInsc: string;
begin
   Result := Self.FSDataFimInsc;
end;

function TUMTAMEvento.getDataIniInsc: string;
begin
   Result := Self.FSDataIniInsc;
end;

function TUMTAMEvento.getDataVencto: string;
begin
   Result := Self.FSDataVencto;
end;

function TUMTAMEvento.getDescEvento: string;
begin
   Result := Self.FSDescEvento;
end;



{ Retorna um objeto de inscrição com base no código recebido como parâmetro.
}
function TUMTAMEvento.getInscricaoByPessoa(
  const ASCodPessoa: string): TUMTAMInscricao;
var
   iIndice: integer;
begin
   Self.FSlInscricoes.Sort;
   if Self.FSlInscricoes.Find(ASCodPessoa, iIndice) then
   begin
      Result := Self.Inscricao[iIndice];
   end else
   begin
      Result := nil;
   end;
end;

{ Verifica se existe alguma inscrição cujo código de pessoa é igual ao recebido
  como parâmetro.
}
function TUMTAMEvento.isPessoaExiste(const ASCodPessoa: string): boolean;
var
   iIndice: Integer;
begin
   FSlInscricoes.Sort;
   Result := Self.FSlInscricoes.Find(ASCodPessoa, iIndice);
end;

{ Retorna o objeto de inscrição na posição I da lista de inscrições do evento.
}
function TUMTAMEvento.getInscricao(const I: integer): TUMTAMInscricao;
begin
   Result := TUMTAMInscricao(Self.FSlInscricoes.Objects[i]);
end;



{Retorna o objeto de atividade na posição I da lista de atividades do evento.}
function TUMTAMEvento.getAtividade(const I: integer): TUMTAMAtividade;
begin
   Result := TUMTAMAtividade(Self.FSlAtividades.Objects[i]);
end;


{ Retorna a quantidade de atividades associadas ao evento.
}
function TUMTAMEvento.getAtividadesCount: integer;
begin
   Result := Self.FSlAtividades.Count;
end;

{ Retorna a quantidade de inscrições associadas ao evento.
}
function TUMTAMEvento.getInscricoesCount: integer;
begin
   Result := Self.FSlInscricoes.Count;
end;

function TUMTAMEvento.getNomeEvento: string;
begin
   Result := Self.FSNomeEvento;
end;

function TUMTAMEvento.getNumeroVagas: string;
begin
   Result := Self.FSNumeroVagas;
end;

function TUMTAMEvento.getSnBoleto: string;
begin
   Result := Self.FSSnBoleto;
end;

function TUMTAMEvento.getSnChecarFinAcesso: string;
begin
   Result := Self.FSSnChecarFinAcesso;
end;

function TUMTAMEvento.getSnChecarFinan: string;
begin
   Result := Self.FSSnChecarFinan;
end;

function TUMTAMEvento.getSnLiberarInscricoes: string;
begin
   Result := Self.FSSnLiberarInscricoes;
end;

function TUMTAMEvento.getTotalInscricoes: integer;
begin
   Result := Self.FSlInscricoes.Count;
end;

{ Pega o total de presenças registradas no evento atual.
}
function TUMTAMEvento.getTotalPresencas: integer;
var
   i: integer;
begin
   Result := 0;
   for i := 0 to Self.FSlInscricoes.Count - 1 do
   begin
      if TUMTAMInscricao(Self.FSlInscricoes.Objects[i]).isPresencaRegistrada then
      begin
         Inc(Result);
      end;
   end;
end;

function TUMTAMEvento.getValorInsc: string;
begin
   Result := Self.FSValorInsc;
end;

{ Define o código de chave primária do evento. Se o valor informado for nulo,
  uma nova exceção será gerada.
}
procedure TUMTAMEvento.setCodEvento(const AVCodEvento: OleVariant);
begin
   if AVCodEvento = Null then
   begin
      raise EUMTAMXMLError.Create(errCampoNulo, ['CD_EVENTO']);
   end else
   begin
      Self.FSCodEvento := AVCodEvento;
   end;
end;

{ Define o código do gestor ligado ao evento. Se o valor informado é nulo,
  o valor do atributo será defnido como string vazia.
}
procedure TUMTAMEvento.setCodGestor(const AVCodGestor: OleVariant);
begin
   if AVCodGestor <> Null then
   begin
      Self.FSCodGestor := AVCodGestor;
   end;
end;

{ Define a data de cadastro do evento. Para valores nulos assume o padrão como
  string vazia.
}
procedure TUMTAMEvento.setDataCadastro(const AVDataCadastro: OleVariant);
begin
   if AVDataCadastro <> Null then
   begin
      Self.FSDataCadastro := AVDataCadastro;
   end;
end;

{ Define a data do evento. Se o valor informado é nulo, define o valor do
  atributo como string vazia.
}
procedure TUMTAMEvento.setDataEvento(const AVDataEvento: OleVariant);
begin
   if AVDataEvento <> Null then
   begin
      Self.FSDataEvento := AVDataEvento;
   end;
end;

{ Define a data fim de inscrição no evento. Se o valor informado é nulo,
  assume o valor do atributo como string vazia.
}
procedure TUMTAMEvento.setDataFimInsc(const AVDataFimInsc: OleVariant);
begin
   if AVDataFimInsc <> Null then
   begin
      Self.FSDataFimInsc := AVDataFimInsc;
   end;
end;

{ Define a data de início de inscrição no evento. Se o valor informado é nulo,
  assume o valor do atributo como string vazia.
}
procedure TUMTAMEvento.setDataIniInsc(const AVDataIniInsc: OleVariant);
begin
   if AVDataIniInsc <> Null then
   begin
      Self.FSDataIniInsc := AVDataIniInsc;
   end;
end;

{ Define a data de vencimento do evento. Se o valor informado é nulo,
  o atributo assume uma string vazia.
}
procedure TUMTAMEvento.setDataVencto(const AVDataVencto: OleVariant);
begin
   if AVDataVencto <> Null then
   begin
      Self.FSDataVencto := AVDataVencto;
   end;
end;

{ Guarda a descriçaõ sobre o evento. Se o valor informado é nulo, o atributo
  assume uma string vazia.
}
procedure TUMTAMEvento.setDescEvento(const AVDescEvento: OleVariant);
begin
   if AVDescEvento <> Null then
   begin
      Self.FSDescEvento := AVDescEvento;
   end;
end;

{ Define o nome do evento. Se valor informado é nulo, o atributo assume uma
  string vazia.
}
procedure TUMTAMEvento.setNomeEvento(const AVNomeEvento: OleVariant);
begin
   if AVNomeEvento <> Null then
   begin
      Self.FSNomeEvento := AVNomeEvento;
   end;
end;

{ Define a quantidade de vagas disponíveis no evento. Se o valor informado é
  nulo, o atributo assume uma string vazia.
}
procedure TUMTAMEvento.setNumeroVagas(const AVNumeroVagas: OleVariant);
begin
   if AVNumeroVagas <> Null then
   begin
      Self.FSNumeroVagas := AVNumeroVagas;
   end;
end;

procedure TUMTAMEvento.setSenha(const AVSSenha: OleVariant);
begin
   if AVSSenha = Null then
   begin
      raise EUMTAMXMLError.Create(errCampoNulo, ['DS_SENHA']);
   end else
   begin
      Self.FSSenha := AVSSenha;
   end;
end;

{ Define o valor do atributo FSSnBoleto. Se o valor informado é nulo, o atributo
  assume uma string vazia.
}
procedure TUMTAMEvento.setSnBoleto(const AVSnBoleto: OleVariant);
begin
   if AVSnBoleto <> Null then
   begin
      Self.FSSnBoleto := AVSnBoleto;
   end;
end;

procedure TUMTAMEvento.setSnChecarFinAcesso(
  const AVSnChecarFinAcesso: OleVariant);
begin
   if AVSnChecarFinAcesso <> Null then
   begin
      Self.FSSnChecarFinAcesso := AVSnChecarFinAcesso;
   end;
end;

{ Define o valor do atributo FSSnChecarFinan. Se o valor informado é nulo,
  o atributo assume uma string vazia.
}
procedure TUMTAMEvento.setSnChecarFinan(const AVSnChecarFinan: OleVariant);
begin
   if AVSnChecarFinan <> Null then
   begin
      Self.FSSnChecarFinan := AVSnChecarFinan;
   end;
end;

procedure TUMTAMEvento.setSnLiberarInscricoes(
  const AVSnLiberarInscricoes: OleVariant);
begin
   if AVSnLiberarInscricoes <> Null then
   begin
      Self.FSSnLiberarInscricoes := AVSnLiberarInscricoes;
   end;
end;

{ Define o valor da inscrição no evento. Se o valor informado é nulo, o atributo
  assume uma string vazia.
}
procedure TUMTAMEvento.setValorInsc(const AVValorInsc: OleVariant);
begin
   if AVValorInsc <> Null then
   begin
      Self.FSValorInsc := AVValorInsc;
   end;
end;

{ TUMTerminalAcessoXML }

{ Carrega as entradas ligadas a inscrição. Recebe como parâmetro um XML Nodo e
  percorre-o à procura de entradas. Cada entrada encontrada é adicionada no
  objeto de inscrição recebido como parâmetro.
}
procedure TUMTerminalAcessoXML.carregaEntradas(AXMLNode: IXMLNode;
   AUMTAMInsricao: TUMTAMInscricao);
var
   i, j: integer;
   XMLNodeEntrada: IXMLNode;
   oInscricaoAtividade:TUMTAMInscricoesAtividade;
begin
   // Percorre o nodo procurando todos os filhos cujo nome seja "entradas".
   XMLNodeEntrada := AXMLNode.ChildNodes.FindNode('entradas');

   if XMLNodeEntrada <> nil then
   begin
      for i := 0 to XMLNodeEntrada.ChildNodes.Count - 1 do
      begin
         // Percorre todas as entradas já adicionadas à inscrição.
         for j := 0 to AUMTAMInsricao.EntradaCount - 1 do
         begin
            // Compara as chaves da entrada encontrada no XML e da entrada já cadastrada no objeto de inscrição.
            // Se os valores são iguais significa que duplicidade de informações no XML.
            if AUMTAMInsricao.Entrada[j].Chave = XMLNodeEntrada.ChildNodes.Get(i).Attributes['cd_inscricao_atividade'] + AXMLNode.ChildNodes.FindNode('entradas').ChildNodes.Get(i).Attributes['dt_entrada'] then
            begin
               // Gera uma nova exceção.
               raise EUMTAMXMLError.Create(errCadEntradaDup, [AUMTAMInsricao.Entrada[j].chave]);
            end;
         end;

         oInscricaoAtividade := Self.carregaInscricaoAtividadeByCodigo(AXMLNode,XMLNodeEntrada.ChildNodes.Get(i).Attributes['cd_inscricao_atividade']);
         if oInscricaoAtividade <> nil then
         begin
            // Adiciona uma entrada à inscrição.
            try
               AUMTAMInsricao.addEntrada(
                  oInscricaoAtividade.CodigoInscricaoAtividade,
                  oInscricaoAtividade.CodigoInscricao,
                  oInscricaoAtividade.CodigoAtividade,
                  XMLNodeEntrada.ChildNodes.Get(i).ChildValues['dt_entrada'],
                  XMLNodeEntrada.ChildNodes.Get(i).ChildValues['dt_saida']);
            except
               on E: EUMTAMXMLError do raise;
            end;
         end;
      end;
   end;
end;

{Procura uma inscrição atividade pelo cd_inscricao_atividade no XML e retorna esta}
function TUMTerminalAcessoXML.carregaInscricaoAtividadeByCodigo(AXMLNodeInscricao: IXMLNode;
  AVSCodigoInscricaoAtividade:OleVariant): TUMTAMInscricoesAtividade;
var
   XMLNodeInscricoesAtividades : IXMLNode;
   i:Integer;
begin
   //procura o local no xml onde estão as inscrições atividades
   XMLNodeInscricoesAtividades := AXMLNodeInscricao.ChildNodes.FindNode('inscricoes_atividades');

   if XMLNodeInscricoesAtividades <> nil then
   begin
      for i := 0 to XMLNodeInscricoesAtividades.ChildNodes.Count - 1 do
      begin
         try
            if(XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_inscricao_atividade']=AVSCodigoInscricaoAtividade)then
            begin
               Result:= TUMTAMInscricoesAtividade.Create(
                                       XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_inscricao_atividade'],
                                       XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_atividade'],
                                       XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_inscricao']
                                    );
               exit;
            end;

         except
            on E: EUMTAMXMLError do raise;
         end;
      end;
   end;
   Result := nil;
end;

{ Cria um objeto de evento.
}
procedure TUMTerminalAcessoXML.carregaEvento;
begin
   try
      Self.FUMEvento := TUMTAMEvento.Create(
         Self.DocumentElement.ChildValues['cd_evento'],
         Self.DocumentElement.ChildValues['cd_gestor'],
         Self.DocumentElement.ChildValues['ds_evento'],
         Self.DocumentElement.ChildValues['me_evento'],
         Self.DocumentElement.ChildValues['dt_evento'],
         Self.DocumentElement.ChildValues['nr_vagas'],
         Self.DocumentElement.ChildValues['vl_inscricao'],
         Self.DocumentElement.ChildValues['dt_vencimento'],
         Self.DocumentElement.ChildValues['dt_inicio_inscricao'],
         Self.DocumentElement.ChildValues['dt_fim_inscricao'],
         Self.DocumentElement.ChildValues['sn_boleto'],
         Self.DocumentElement.ChildValues['sn_checar_fin_inscricao'],
         Self.DocumentElement.ChildValues['ds_senha'],
         Self.DocumentElement.ChildValues['dt_cadastro'],
         Self.DocumentElement.ChildValues['sn_checar_fin_acesso'],
         Self.DocumentElement.ChildValues['sn_liberar_inscricoes']);
   except
      on EUMTAMXMLError do raise;
   end;
end;

{Carrega as informações das atividades do XML}
procedure TUMTerminalAcessoXML.carregaAtividades;
var
   i, j: integer;
   XMLNodeAtividades :  IXMLNode;
begin
   // Percorre o nodo procurando todos os filhos cujo nome seja "atividades".
   XMLNodeAtividades := Self.DocumentElement.ChildNodes.FindNode('atividades');
   if XMLNodeAtividades <> nil then
   begin
      for i := 0 to XMLNodeAtividades.ChildNodes.Count - 1 do
      begin
         // Percorre todas as atividades já adicionadas à inscrição.
         for j := 0 to Self.FUMEvento.AtividadesCount - 1 do
         begin
            // Compara as chaves da atividade encontrada no XML e da atividade já cadastrada no objeto de inscrição.
            // Se os código da atividade no XML e da atividade no objeto evento são iguais ...
            if Self.FUMEvento.Atividade[j].CodigoAtividade = XMLNodeAtividades.ChildNodes.Get(i).Attributes['id'] then
            begin
               // ... significa que há duplicidade de informações e gera nova exceção.
               raise EUMTAMXMLError.Create(errCadAtividadeDup, [Self.FUMEvento.Atividade[j].CodigoAtividade]);
            end;//if
         end;

         // Adiciona uma atividade ao evento.
         try
               Self.FUMEvento.addAtividade(
               XMLNodeAtividades.ChildNodes.Get(i).Attributes['id'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['ds_atividade'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['nm_palestrante'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['ds_tema'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['dt_atividade'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['hr_inicio'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['hr_fim'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['me_ambiente'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['sn_atividade_padrao'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['sn_escolhe'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['nr_vagas'],
               XMLNodeAtividades.ChildNodes.Get(i).ChildValues['nr_horas'],
               Self.FUMEvento
            );
         except
            on EUMTAMXMLError do raise;
         end;
      end;
   end;
end;


{ Carrega todas as inscrições vinculadas ao evento.
}
procedure TUMTerminalAcessoXML.carregaInscricoes;
var
   i, j: integer;
   oInscricao: TUMTAMInscricao;
begin
   // Percorre os elementos do XML
   for i := 0 to Self.DocumentElement.ChildNodes.Count - 1 do
   begin
      // Se o elemento é uma inscrição ...
      if Self.DocumentElement.ChildNodes.Get(i).NodeName = 'inscricao' then
      begin
         // Procura por inscrições previamente cadastradas no objeto de evento
         for j := 0 to Self.FUMEvento.InscricoesCount - 1 do
         begin
            // Se os código da inscrição no XML e da inscrição no objeto evento são iguais ...
            if Self.FUMEvento.Inscricao[j].CodInscricao = Self.DocumentElement.ChildNodes.Get(i).Attributes['id'] then
            begin
               // ... significa que há duplicidade de informações e gera nova exceção.
               raise EUMTAMXMLError.Create(errCadInscricaoDup, [Self.FUMEvento.Inscricao[j].CodInscricao]);
            end;            
         end;
         try
            // Adiciona uma inscrição ao evento.
            oInscricao :=
               Self.FUMEvento.addInscricao(
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['cd_inscricao'],
                  Self.DocumentElement.ChildNodes.Get(i).Attributes['nova_inscricao'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['cd_evento'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['cd_pessoa'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['nm_pessoa'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['sn_inscricao_evento'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['cd_mensalidade'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['dt_inscricao'],
                  Self.DocumentElement.ChildNodes.Get(i).ChildValues['sn_pagou_inscricao']
               );
         except
            on EUMTAMXMLError do raise;
         end;
         try
            Self.carregaInscricoesAtividades(Self.DocumentElement.ChildNodes.Get(i),oInscricao);
            // Carrega as entrada da inscrição
            Self.carregaEntradas(Self.DocumentElement.ChildNodes.Get(i), oInscricao);
         except
            on E: EUMTAMXMLError do raise;
         end;
      end;
   end;
end;

procedure TUMTerminalAcessoXML.carregaInscricoesAtividades(AXMLNode: IXMLNode;
  AUMTAMInscricao: TUMTAMInscricao);
var
   i, j: integer;
   XMLNodeInscricoesAtividades: IXMLNode;
begin
   // Percorre o nodo procurando todos os filhos cujo nome seja "entradas".
   XMLNodeInscricoesAtividades := AXMLNode.ChildNodes.FindNode('inscricoes_atividades');
   if XMLNodeInscricoesAtividades <> nil then
   begin
      for i := 0 to XMLNodeInscricoesAtividades.ChildNodes.Count - 1 do
      begin
         // Percorre todas as entradas já adicionadas à inscrição.
         for j := 0 to AUMTAMInscricao.InscricoesAtividadesCount - 1 do
         begin
            // Compara as inscrições em atividades encontradas no XML e da entrada já cadastrada no objeto de inscricao.
            // Se os valores são iguais significa que duplicidade de informações no XML.
            if AUMTAMInscricao.InscricaoAtividade[j].Chave =
            XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_inscricao'] +
            XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_atividade'] then
            begin
               // Gera uma nova exceção.
               raise EUMTAMXMLError.Create(errCadInscricaoAtividadeDup, [AUMTAMInscricao.InscricaoAtividade[j].chave]);
            end;
         end;
         // Adiciona uma inscrição em uma atividade para esta inscrição.
         try
            AUMTAMInscricao.addInscricaoAtividade(
            XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_atividade'],
            XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_inscricao'],
            XMLNodeInscricoesAtividades.ChildNodes.Get(i).Attributes['cd_inscricao_atividade']
            );
         except
            on E: EUMTAMXMLError do raise;
         end;
      end;
   end;
end;

{ Carrega o conteúdo do documento XML recebido como parâmetro.
}
procedure TUMTerminalAcessoXML.carregaXML(const ASPath: string);
begin
   if FileExists(ASPath) then
   begin
      Self.FSPathXML := ASPath;
      Self.LoadFromFile(ASPath);
      Self.Active := True;
      try
         Self.carregaEvento;
         Self.carregaAtividades;
         Self.carregaInscricoes;
      except
         on E: EUMTAMXMLError do raise;
      end;
   end else
   begin
      // Se o arquivo não foi encontrado, gera nova exceção.
      raise EUMTAMXMLError.Create(errArqInexistente, [ASPath]);
   end;
end;

{ Construtor. }
constructor TUMTerminalAcessoXML.Create(AOwner: TComponent);
begin
   if AOwner = nil then
   begin
      raise EUMTAMXMLError.Create(errComponentePaiNulo);
   end else
   begin
      inherited Create(AOwner);
      Self.NodeIndentStr := #9;
      Self.Options := Self.Options + [doNodeAutoIndent];
      Self.ParseOptions := Self.ParseOptions + [poResolveExternals];
   end;
end;

{ Destrutor.
  Destrói o objeto de evento.
}
destructor TUMTerminalAcessoXML.Destroy;
begin
   Self.FUMEvento.Free;
   inherited;
end;

{ Salva as entradas da lista de entrada associada a inscrição recebida como
  parâmetro no documento XML.
}
procedure TUMTerminalAcessoXML.salvaAtividades(AXMLNode: IXMLNode; AUMTAMEvento: TUMTAMEvento);
var
   i:Integer;
   XMLNodeAtividades:IXMLNode;
begin
   XMLNodeAtividades := AXMLNode.AddChild('atividades');

   for i := 0 to AUMTAMEvento.AtividadesCount - 1 do
   begin
      with XMLNodeAtividades.AddChild('atividade') do
      begin
         Attributes['id'] := AUMTAMEvento.Atividade[i].CodigoAtividade;
         AddChild('ds_atividade').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].DescricaoAtividade));
         AddChild('nm_palestrante').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].NomePalestrante));
         AddChild('ds_tema').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].DescricaoTema));
         AddChild('dt_atividade').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].DataAtividade));
         AddChild('hr_inicio').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].HoraInicio));
         AddChild('hr_fim').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].HoraFim));
         AddChild('me_ambiente').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].Ambiente));
         AddChild('sn_atividade_padrao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].SnAtividadePadrao));
         AddChild('sn_escolhe').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].SnEscolheAtividade));
         AddChild('nr_vagas').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].NumeroVagas));
         AddChild('nr_horas').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMEvento.Atividade[i].NumeroHoras));
      end;
   end;
      
end;

procedure TUMTerminalAcessoXML.salvaInscricoesAtividades(AXMLNode: IXMLNode; AUMTAMInscricao: TUMTAMInscricao);
var
   i: integer;
   XMLNodeIncricaoAtividade: IXMLNode;
begin
   XMLNodeIncricaoAtividade := AXMLNode.AddChild('inscricoes_atividades');

   for I := 0 to AUMTAMInscricao.InscricoesAtividadesCount -1 do
   begin
      with XMLNodeIncricaoAtividade.AddChild('inscricao_atividade') do
      begin
         Attributes['cd_inscricao_atividade'] := AUMTAMInscricao.InscricaoAtividade[i].CodigoInscricaoAtividade;
         Attributes['cd_inscricao']:=AUMTAMInscricao.InscricaoAtividade[i].CodigoInscricao;
         Attributes['cd_atividade']:=AUMTAMInscricao.InscricaoAtividade[i].CodigoAtividade;
      end;
   end;
      
end;

procedure TUMTerminalAcessoXML.salvaEntradas(AXMLNode: IXMLNode;
   AUMTAMInscricao: TUMTAMInscricao);
var
   i: integer;
   XMLNodeEntradas: IXMLNode;
begin
   XMLNodeEntradas := AXMLNode.AddChild('entradas');
   for i := 0 to AUMTAMInscricao.EntradaCount - 1 do
   begin
      with XMLNodeEntradas.AddChild('entrada') do
      begin
         Attributes['cd_inscricao_atividade'] := AUMTAMInscricao.Entrada[i].CodigoInscricaoAtividade;
         AddChild('dt_entrada').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMInscricao.Entrada[i].DataEntrada));
         AddChild('dt_saida').DOMNode.appendChild(Self.DOMDocument.createCDATASection(AUMTAMInscricao.Entrada[i].DataSaida));
      end;
   end;      
end;

{ Salva as informações do evento no documento XML.
}
procedure TUMTerminalAcessoXML.salvaEvento;
begin
   Self.DocumentElement.AddChild('cd_evento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.CodEvento));
   Self.DocumentElement.AddChild('cd_gestor').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.CodGestor));
   Self.DocumentElement.AddChild('ds_evento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.NomeEvento));
   Self.DocumentElement.AddChild('me_evento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.DescEvento));
   Self.DocumentElement.AddChild('dt_evento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.DataEvento));
   Self.DocumentElement.AddChild('nr_vagas').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.NumeroVagas));
   Self.DocumentElement.AddChild('vl_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.ValorInsc));
   Self.DocumentElement.AddChild('dt_vencimento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.DataVencto));
   Self.DocumentElement.AddChild('dt_inicio_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.DataIniInsc));
   Self.DocumentElement.AddChild('dt_fim_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.DataFimInsc));
   Self.DocumentElement.AddChild('sn_boleto').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.SnBoleto));
   Self.DocumentElement.AddChild('sn_checar_fin_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.SnChecarFinan));
   Self.DocumentElement.AddChild('ds_senha').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Senha));
   Self.DocumentElement.AddChild('dt_cadastro').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.DataCadastro));
   Self.DocumentElement.AddChild('sn_checar_fin_acesso').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.SnChecarFinAcesso));
end;

{ Salva todas as entradas de inscrição associadas ao evento no documento XMl.
}
procedure TUMTerminalAcessoXML.salvaInscricoes;
var
   i: integer;
   XMLNodeIncricao: IXMLNode;
begin
   for i := 0 to Self.FUMEvento.InscricoesCount - 1 do
   begin
      XMLNodeIncricao := Self.DocumentElement.AddChild('inscricao');
      XMLNodeIncricao.Attributes['id'] := Self.FUMEvento.Inscricao[i].CodInscricao;
      XMLNodeIncricao.Attributes['nova_inscricao'] := Self.FUMEvento.Inscricao[i].NovaInscricao;
      XMLNodeIncricao.AddChild('cd_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].CodInscricao));
      XMLNodeIncricao.AddChild('cd_evento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].CodEvento));
      XMLNodeIncricao.AddChild('cd_pessoa').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].CodPessoa));
      XMLNodeIncricao.AddChild('nm_pessoa').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].NomePessoa));
      XMLNodeIncricao.AddChild('sn_inscricao_evento').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].SnInscEvento));
      XMLNodeIncricao.AddChild('cd_mensalidade').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].CodMensalidade));
      XMLNodeIncricao.AddChild('dt_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].DataInscricao));
      XMLNodeIncricao.AddChild('sn_pagou_inscricao').DOMNode.appendChild(Self.DOMDocument.createCDATASection(Self.FUMEvento.Inscricao[i].PagouInscricao));
      Self.salvaInscricoesAtividades(XMLNodeIncricao, Self.FUMEvento.Inscricao[i]);
      Self.salvaEntradas(XMLNodeIncricao, Self.FUMEvento.Inscricao[i]);

   end;
end;



{ Salva o conteúdo XML para arquivo. Utiliza o arquivo definido no atributo
  FSPathXML.
}
procedure TUMTerminalAcessoXML.salvaXML;
begin
   Self.DocumentElement.GetChildNodes.Clear;
   Self.salvaEvento;
   Self.salvaAtividades(Self.DocumentElement,Self.FUMEvento);
   Self.salvaInscricoes;
   if FileExists(Self.FSPathXML) then
   begin
      DeleteFile(Self.FSPathXML);
   end;
   Self.SaveToFile(Self.FSPathXML);
end;

procedure TUMTerminalAcessoXML.setAtividadeSel(oAtividadeSel: TUMTAMAtividade);
begin
   Self.FUMAtividade := oAtividadeSel;
end;

{ Salva o conteúdo XML para o arquivo informado no parâmetro.
}
procedure TUMTerminalAcessoXML.salvaXML(const ASPath: string);
begin
   Self.FSPathXML := ASPath;
   Self.salvaXML;
end;

{ TUMTAMAtividade }

constructor TUMTAMAtividade.Create(const AVCodigoAtividade,
  AVDescricaoAtividade, AVNomePalestrante, AVDescricaoTema,
  AVDataAtividade, AVHoraInicio, AVHoraFim, AVAmbiente, AVSnAtividadePadrao,
  AVSnEscolheAtividade, AVNumeroVagas, AVNumeroHoras: OleVariant;
  oEvento: TUMTAMEvento);
begin
   Self.setCodigoAtividade(AVCodigoAtividade);
   Self.setDescricaoAtividade(AVDescricaoAtividade);
   Self.setNomePalestrante(AVNomePalestrante);
   Self.setEvento(oEvento);
   Self.setDataAtividade(AVDataAtividade);
   Self.setHoraInicio(AVHoraInicio);
   Self.setHoraFim(AVHoraFim);
   Self.setDescricaoTema(AVDescricaoTema);
   Self.setNumeroVagas(AVNumeroVagas);
   Self.setNumeroHoras(AVNumeroHoras);
   Self.setSnAtividadePadrao(AVSnAtividadePadrao);
   Self.setSnEscolheAtividade(AVSnEscolheAtividade);
   Self.setAmbiente(AVAmbiente);
end;

destructor TUMTAMAtividade.Destroy;
begin

  inherited;
end;

function TUMTAMAtividade.getAmbiente: string;
begin
   Result:= Self.FAmbiente;
end;

function TUMTAMAtividade.getCodigoAtividade: string;
begin
   Result:= Self.FCodigoAtividade;
end;

function TUMTAMAtividade.getDataAtividade: string;
begin
   Result:= Self.FDataAtividade;
end;

function TUMTAMAtividade.getDescricaoAtividade: string;
begin
   Result:= Self.FDescricaoAtividade;
end;

function TUMTAMAtividade.getDescricaoTema: string;
begin
   Result:= Self.FDescricaoTema;
end;

function TUMTAMAtividade.getEvento: TUMTAMEvento;
begin
   Result:=Self.FUMEvento;
end;

function TUMTAMAtividade.getHoraFim: string;
begin
   Result:=Self.FHoraFim;
end;

function TUMTAMAtividade.getHoraInicio: string;
begin
   Result:=Self.FHoraInicio;
end;

function TUMTAMAtividade.getNumeroHoras: string;
begin
   Result:=Self.FNumeroHoras;
end;

function TUMTAMAtividade.getNumeroVagas: string;
begin
   Result:=Self.FNumeroVagas;
end;

function TUMTAMAtividade.getSnAtividadePadrao: string;
begin
   Result:=Self.FSnAtividadePadrao;
end;

function TUMTAMAtividade.getSnEscolheAtividade: string;
begin
   Result:=Self.FSnEscolheAtividade;
end;

procedure TUMTAMAtividade.setAmbiente(const sAmbiente: OleVariant);
begin
   if sAmbiente <> null then
   begin
      Self.FAmbiente := sAmbiente;
   end;
end;

function TUMTAMAtividade.setCodigoAtividade(sCodigoAtividade: OleVariant): string;
begin
   if sCodigoAtividade <> null then
   begin
      Self.FCodigoAtividade := sCodigoAtividade;
   end;
end;

procedure TUMTAMAtividade.setDataAtividade(const sDataAtividade: OleVariant);
begin
   if sDataAtividade <> null then
   begin
      Self.FDataAtividade := sDataAtividade;
   end;
end;

procedure TUMTAMAtividade.setDescricaoAtividade(
  const sDescricaoAtividade: OleVariant);
begin
   if sDescricaoAtividade <> null then
   begin
      Self.FDescricaoAtividade := sDescricaoAtividade;
   end;
end;

procedure TUMTAMAtividade.setDescricaoTema(const sDescricaoTema: OleVariant);
begin
   if sDescricaoTema <> null then
   begin
      Self.FDescricaoTema := sDescricaoTema;
   end;
end;

procedure TUMTAMAtividade.setEvento(const oEvento: TUMTAMEvento);
begin
   if oEvento <> nil then
   begin
      Self.FUMEvento := oEvento;
   end;
end;

procedure TUMTAMAtividade.setHoraFim(const sHoraFim: OleVariant);
begin
   if sHoraFim <> Null then
   begin
      Self.FHoraFim := sHoraFim;
   end;
end;

procedure TUMTAMAtividade.setHoraInicio(const sHoraInicio: OleVariant);
begin
   if sHoraInicio <> Null then
   begin
      Self.FHoraInicio := sHoraInicio;
   end;
end;

procedure TUMTAMAtividade.setNomePalestrante(
  const sNomePalestrante: OleVariant);
begin
   if sNomePalestrante <> Null then
   begin
      Self.FNumeroHoras := sNomePalestrante;
   end;
end;

procedure TUMTAMAtividade.setNumeroHoras(const sNumeroHoras: OleVariant);
begin
   if sNumeroHoras <> Null then
   begin
      Self.FNumeroHoras := sNumeroHoras;
   end;
end;

procedure TUMTAMAtividade.setNumeroVagas(const sNumeroVagas: OleVariant);
begin
   if sNumeroVagas <> Null then
   begin
      Self.FNumeroVagas := sNumeroVagas;
   end;
end;

procedure TUMTAMAtividade.setSnAtividadePadrao(
  const sSnAtividadePadrao: OleVariant);
begin
   if sSnAtividadePadrao <> Null then
   begin
      Self.FSnAtividadePadrao := sSnAtividadePadrao;
   end;
end;

procedure TUMTAMAtividade.setSnEscolheAtividade(
  const sSnEscolheAtividade: OleVariant);
begin
   if sSnEscolheAtividade <> Null then
   begin
      Self.FSnEscolheAtividade := SnEscolheAtividade;
   end;
end;

{ TUMTAMInscricoesAtividades }

constructor TUMTAMInscricoesAtividade.Create(const AVCodigoInscricaoAtividade,sCodigoAtividade,sCodigoInscricao:OleVariant);
begin
   Self.setCodigoInscricaoAtividade(AVCodigoInscricaoAtividade);
   Self.setAtividade(sCodigoAtividade);
   Self.setInscricao(sCodigoInscricao);
end;

destructor TUMTAMInscricoesAtividade.Destroy;
begin
  inherited;
end;

function TUMTAMInscricoesAtividade.getAtividade: string;
begin
   Result:= Self.FSCodigoAtividade;
end;

function TUMTAMInscricoesAtividade.getChave: string;
begin
   Result := Self.FSCodigoInscricao + Self.FSCodigoAtividade;
end;

function TUMTAMInscricoesAtividade.getCodigoInscricaoAtividade: string;
begin
   Result:= Self.FSCodigoInscricaoAtividade;
end;

function TUMTAMInscricoesAtividade.getInscricao: string;
begin
   Result:= Self.FSCodigoInscricao;
end;

procedure TUMTAMInscricoesAtividade.setAtividade(
  const sCodigoAtividade: OleVariant);
begin
   if(sCodigoAtividade <> null)then
   begin
      Self.FSCodigoAtividade :=  sCodigoAtividade;
   end;
end;

procedure TUMTAMInscricoesAtividade.setCodigoInscricaoAtividade(
  const AVCodigoInscricaoAtividade: OleVariant);
begin
   if(AVCodigoInscricaoAtividade <> Null)then
   begin
      Self.FSCodigoInscricaoAtividade := AVCodigoInscricaoAtividade;
   end;
end;

procedure TUMTAMInscricoesAtividade.setInscricao(
  const sCodigoInscricao: OleVariant);
begin
   if(sCodigoInscricao <> null)then
   begin
      Self.FSCodigoInscricao :=  sCodigoInscricao;
   end;
end;

initialization
   CoInitialize(nil);

finalization
   CoUninitialize;   

end.
