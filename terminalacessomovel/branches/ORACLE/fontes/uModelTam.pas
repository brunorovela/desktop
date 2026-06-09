unit uModelTam;


interface

uses
SysUtils;

type
{
TIPOS DE ENTRADA/SAIDA/ENTRADA SEM PAGAR
}
   TUMTipoEntrada = (taEntrada, taSaida, taSemPagar);

{
   Pré declaração do tipo inscrição
}
   TUMInscricao = class;
   TUMAtividade = class;

{
DEFINIÇÃO DO TIPO ##EVENTO##
ESTE SERÁ RESPONSÁVEL POR MANTER
E MANIPULAR
AS INFORMAÇÕES DE UM EVENTO
}
   TUMEvento = class(TObject)
   strict private
      FCodigoEvento: Integer;
      FDescricaoEvento: String;
      FDataEvento: TDateTime;
      FSenhaAcesso: String;
      FSnCheckarFinanceiroAcesso:Boolean;
      FSnLiberarInscricoes:Boolean;
      FLocal: string;
      FDataFim: TDateTime;
      FCodAtividade: integer;
   private
      destructor Destroy; override;
   public
      {Acesso ao construtor}
      constructor Create(  const iCodigoEvento:Integer;
                           const sDescricaoEvento:String;
                           const dtDataEvento: TDateTime;
                           const sSenhaAcesso:String;
                           const bSnCheckarFinanceiroAcesso:Boolean;
                           const bSnLiberarInscricoes:Boolean;
                           const iCodAtividade: integer;
                           const sLocal: string;
                           const dtFim: TDateTime
                        );
      {Propriedades}
      property CodAtividade: integer read FCodAtividade;
      property DataFim: TDateTime read FDataFim;
      property Local: string read FLocal;
      property CodigoEvento: Integer read FCodigoEvento;
      property DescricaoEvento: string read FDescricaoEvento;
      property DataEvento: TDateTime read FDataEvento;
      property SenhaAcesso: String read FSenhaAcesso;
      property SnCheckarFinanceiroAcesso: Boolean read FSnCheckarFinanceiroAcesso;
      property SnLiberarInscricoes: Boolean read FSnLiberarInscricoes;
      {Set and Geters}
      procedure setCodigoEvento(const iCodigoEvento: Integer);
      procedure setDescricaoEvento(const sDescricaoEvento: String);
      procedure setDataEvento(const dtDataEvento: TDateTime);
      procedure setSenhaAcesso(const sSenhaAcesso:String);
      class function addInscricao
                                 (
                                    const oEvento:TUMEvento;
                                    const bNovaInscricao:Boolean;
                                    const sNomePessoa:String;
                                    const snPagouInscricao:Boolean;
                                    const iCDPessoa:Integer;
                                    const bSnInscritoEvento:Boolean
                                 ):TUMInscricao;
                                 
      class procedure fecharEntradas(const oEvento:TUMEvento;const oAtividade: TUMAtividade);
      class procedure fechaEntrada(const iCDInscricaoAtividade:Integer);

      function getCodigoEvento: Integer;
      function getDescricaoEvento: String;
      function getDataEvento: TDateTime;
      function getSenhaAcesso:String;

   end;

{
DEFINIÇÃO DO TIPO ##ATIVIDADE##
ESTE SERÁ RESPONSÁVEL POR MANTER
E MANIPULAR
AS INFORMAÇÕES DE UMA ATIVIDADE
}
   TUMAtividade = class(TObject)
   strict private
      FCodigoAtividade: Integer;
      FDescricaoAtividade: String;
      FDataAtividade: TDateTime;
      FHoraInicio : TDateTime;
      FHoraFim : TDateTime;
   private
      destructor Destroy; override;
   public
      {Acesso ao construtor}
      constructor Create(const iCodigoAtividade:Integer;const sDescricaoAtividade:String;
         const dtAtividade: TDateTime;const hrInicio:TDateTime;const hrFim:TDateTime);
      {Propriedades}
      property CodigoAtividade: Integer read FCodigoAtividade;
      property DescricaoAtividade: string read FDescricaoAtividade;
      property DataAtividade: TDateTime read FDataAtividade;
      property HoraInicio: TDateTime read FHoraInicio;
      property HoraFim: TDateTime read FHoraFim;
      {Set and Geters}
      procedure setCodigoAtividade(const iCodigoAtividade: Integer);
      procedure setDescricaoAtividade(const sDescricaoAtividade: String);
      procedure setDataAtividade(const dtAtividade: TDateTime);
      procedure setHoraInicio(const horaInicio:TDateTime);
      procedure setHoraFim(const horaFim:TDateTime);
      function getCodigoAtividade: Integer;
      function getDescricaoAtividade: String;
      function getDataAtividade: TDateTime;
      function getHoraInicioAtividade: TDateTime;
      function getHoraFimAtividade:TDateTime;
   end;

{
DEFINIÇÃO DO TIPO ##INSCRICÕES##
ESTE SERÁ RESPONSÁVEL POR MANTER E
MANIPULAR
AS INFORMAÇÕES DE UMA INSCRIÇÃO
}
   TUMInscricao = class(TObject)
   strict private
      FCodigoInscricao:Integer;
      FCodigoEvento:Integer;
      FCodigoPessoa:Integer;
      FNomePessoa:String;
      FSnInscricaoEvento:Boolean;
      FCodigoMensalidade:Integer;
      FDataInscricao:TDateTime;
      FSnPagouInscricao:Boolean;
   private
      destructor Destroy; override;
   public
      constructor Create(
                        const iCodigoInscricao:Integer;
                        const iCodigoEvento:Integer;
                        const iCodigoPessoa:Integer;
                        const sNmPessoa:String;
                        const bSnInscricaoEvento:Boolean;
                        const iCodigoMensalidade:Integer;
                        const dtInscricao:TDateTime;
                        const bSnPagouInscricao:Boolean                                                                           
                           );
      property CodigoInscricao: Integer read FCodigoInscricao;
      property CodigoEvento: Integer read FCodigoEvento;
      property CodigoPessoa: Integer read FCodigoPessoa;
      property CodigoMensalidade: Integer read FCodigoMensalidade;
      property DataInscricao: TDateTime read FDataInscricao;
      property SnPagouInscricao: Boolean read FSnPagouInscricao;
      property SnInscricaoEvento: Boolean read FSnInscricaoEvento;
      property NomePessoa:String read FNomePessoa;
      function getCodigoInscricao:Integer;
      function getCodigoEvento:Integer;
      function getCodigoPessoa:Integer;
      function getCodigoMensalidade:Integer;
      function getNomePessoa:String;
      function getSnInscricaoEvento:Boolean;
      function getSnPagouInscricao:Boolean;
      function getDataInscricao:TDateTime;
      class function getInscricao(iCodigoEvento, iCodigoPessoa: Integer):TUMInscricao;
      class function getTotalInscricoes(oEvento:TUMEvento):Integer;
      class function getTotalPresentes(oEvento:TUMEvento):Integer;      
      procedure setCodigoInscricao(const iCodigoInscricao:Integer);
      procedure setCodigoPessoa(const iCodigoPessoa:Integer);
      procedure setCodigoEvento(const iCodigoEvento:Integer);
      procedure setCodigoMensalidade(const iCodigoMensalidade:Integer);
      procedure setNomePessoa(const sNomePessoa:String);
      procedure setDataInscricao(const dtInscricao:TDateTime);
      procedure setSnPagouInscricao(const snPagouInscricao:Boolean);
      procedure setSnInscricaoEvento(const snInscricaoEvento:Boolean);
      
   end;
{
DEFINIÃO DO TIPO "INSCRICOES_ATIVIDADES"
ESTE SERÁ RESPONSÁVEL POR MANTER AS
INSCRIÇÕES NAS ATIVIDADES DO INSCRITO
}


   TUMInscricoesAtividades = class(TObject)
   strict private
      FCodigoInscricaoAtividade:Integer;
      FCodigoAtividade:Integer;
      FCodigoInscricao:Integer;
   private

   public
      constructor Create(
                        const codigoAtividade:Integer;
                        const codigoInscricao:Integer;
                        const codigoInscricaoAtividade:Integer
                        );
      property CodigoInscricaoAtividade: Integer read FCodigoInscricaoAtividade;
      property CodigoAtividade:Integer read FCodigoAtividade;
      property CodigoInscricao:Integer read FCodigoInscricao;
      function getCodigoInscricaoAtividade:Integer;
      function getCodigoAtividade:Integer;
      function getCodigoInscricao:Integer;
      class function getInscricaoAtividade(oInscricao:TUMInscricao;oAtividade:TUMAtividade):TUMInscricoesAtividades;
      class function getTipoAcesso(oInscricao:TUMInscricao;oInscricaoAtividade:TUMInscricoesAtividades):TUMTipoEntrada;
      class procedure addEntradaAtividade(oInscricaoAtividade: TUMInscricoesAtividades;oAtividade:TUMAtividade);
      class procedure addInscricaoAtividade(oInscricao:TUMInscricao;oAtividade:TUMAtividade);
      procedure setCodigoInscricaoAtividade(
                                             const iCodigoInscricaoAtividade:Integer;
                                             const iCodigoAtividade:Integer;
                                             const iCodigoInscricao:Integer
                                           );

      procedure setCodigoAtividade(const iCodigoAtividade:Integer);
      procedure setCodigoInscricao(const iCodigoInscricao:Integer);
      
   end;

   TUMEntrada = class(TObject)
   strict private
      FCodigoEntrada:Integer;
      FDataEntrda:TDateTime;
      FDataSaida:TDateTime;
      FInscricaoAtividade:TUMInscricoesAtividades;
   private
      constructor Create(
                           const iCodigoEntrada:Integer;
                           const dtEntrada:TDateTime;
                           const dtSaida:TDateTime;
                           const oInscricaoAtividade:TUMInscricoesAtividades
                        );
   public
      property CodigoEntrada: Integer read FCodigoEntrada;
      property DataEntrada:TDateTime read FDataEntrda;
      property DataSaida:TDateTime read FDataSaida;
      property InscricaoAtividade:TUMInscricoesAtividades read FInscricaoAtividade;
   end;

implementation

uses ZDataset, UZDataset, DB, uDM,General;

{ Construtor inicializa o evento
 TUMEventos }
class function TUMEvento.addInscricao(const oEvento:TUMEvento;
                                    const bNovaInscricao:Boolean;
                                    const sNomePessoa:String;
                                    const snPagouInscricao:Boolean;
                                    const iCDPessoa:Integer;
                                    const bSnInscritoEvento:Boolean): TUMInscricao;
var
   oNovaInscricao: TUMInscricao;
   qryAddInscricao: TUMZQuery;
begin

   oNovaInscricao := nil;

   qryAddInscricao := DM.newQuery;

   try
      with qryAddInscricao do
      begin
         SQL.Text := 'INSERT INTO TAM_INSCRICOES '+
                     ' (CD_EVENTO,CD_PESSOA,NM_PESSOA,SN_INSCRICAO_EVENTO,DT_INSCRICAO,CD_GRUPO,SN_COMUNIDADE) '+
                     ' VALUES '+
                     ' (:pCDEvento,:pCDPessoa,:pNMPessoa,:pSNInscritoEvento,:pDTInscricao,(SELECT cd_grupo FROM nu_grupos WHERE ds_nome_grupo = "Comunidade"),1) ';

         ParamByName('pCDEvento').asInteger := oEvento.CodigoEvento;
         ParamByName('pCDPessoa').asInteger := iCDPessoa;
         ParamByName('pNMPessoa').AsString := sNomePessoa;
         ParamByName('pSNInscritoEvento').AsBoolean := bSnInscritoEvento;
         ParamByName('pDTInscricao').AsString :=  FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
         
         try
            ExecSQL;   
         except on E: Exception do
            begin
               Mensagem(E.Message);
               Result:=nil;
               exit;
            end;
         end;

         oNovaInscricao := TUMInscricao.getInscricao(oEvento.CodigoEvento,iCDPessoa);
         Result := oNovaInscricao;
      end;
   finally
      qryAddInscricao.Free;
   end;
   
end;

constructor TUMEvento.Create(
      const iCodigoEvento: Integer;
      const sDescricaoEvento: String;
      const dtDataEvento: TDateTime;
      const sSenhaAcesso:String;
      const bSnCheckarFinanceiroAcesso:Boolean;
      const bSnLiberarInscricoes:Boolean;
      const iCodAtividade: integer;
      const sLocal: string;
      const dtFim: TDateTime
      );
begin
   Self.FCodigoEvento    := iCodigoEvento;
   Self.FDescricaoEvento := sDescricaoEvento;
   Self.FDataEvento      := dtDataEvento;
   Self.FSenhaAcesso := sSenhaAcesso;
   Self.FSnCheckarFinanceiroAcesso :=  bSnCheckarFinanceiroAcesso;
   Self.FSnLiberarInscricoes := bSnLiberarInscricoes;
   Self.FCodAtividade := iCodAtividade;
   Self.FLocal := sLocal;
   Self.FDataFim := dtFim;
end;

{ Destrutor da classe de Evento }
destructor TUMEvento.Destroy;
begin
  inherited;
end;

{Fecha uma entrada na atividade}
class procedure TUMEvento.fechaEntrada(const iCDInscricaoAtividade:Integer);
var
   qryFechaAtividade:TUMZQuery;
begin
   qryFechaAtividade :=  DM.newQuery;
   try
      with qryFechaAtividade do
      begin
            SQL.Text:= 'UPDATE TAM_ENTRADAS SET DT_SAIDA = :pDTSaida WHERE cd_inscricao_atividade=:pCDInscricaoAtividade';
            ParamByName('pDTSaida').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
            ParamByName('pCDInscricaoAtividade').AsInteger := iCDInscricaoAtividade;
            ExecSQL;      
      end;
   finally
      qryFechaAtividade.Free;
   end;   
end;


{Fecha todas as entradas de um evento selecionado}
class procedure TUMEvento.fecharEntradas(const oEvento: TUMEvento;const oAtividade: TUMAtividade);
var
   qryFechaEntradas: TUMZQuery;
begin
   qryFechaEntradas := DM.newQuery();

   try
      //Com esta query faça
      with qryFechaEntradas do
      begin
         SQL.Text := ' '+
         'UPDATE '+
         '  TAM_ENTRADAS as te '+
         '  INNER JOIN tam_inscricoes_atividades as tia ON(tia.cd_inscricao_atividade=te.cd_inscricao_atividade) '+
         '  INNER JOIN tam_inscricoes as ti ON(tia.cd_inscricao= tia.cd_inscricao) '+
         'SET '+
         '  te.DT_SAIDA = :pDTSaida '+
         'WHERE '+
         '  ti.CD_EVENTO = :pCDEvento AND '+
         '  tia.cd_atividade = :pCDAtividade AND '+
         '  ((YEAR(te.DT_SAIDA) IS NULL) OR (YEAR(te.DT_SAIDA)=0))  ';
         ParamByName('pDTSaida').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
         ParamByName('pCDEvento').AsInteger := oEvento.CodigoEvento;
         ParamByName('pCDAtividade').AsInteger := oAtividade.CodigoAtividade;
         ExecSQL;

      end;
   finally
      qryFechaEntradas.Free;
   end;

end;

{## Get and Seters Evento ##}
function TUMEvento.getCodigoEvento: Integer;
begin
   Result:= Self.FCodigoEvento;
   exit;
end;

function TUMEvento.getDataEvento: TDateTime;
begin
   Result:= Self.FDataEvento;
   exit;
end;

function TUMEvento.getDescricaoEvento: String;
begin
   Result:= Self.FDescricaoEvento;
   exit;
end;

function TUMEvento.getSenhaAcesso: String;
begin
   Result:= Self.FSenhaAcesso;
   exit;
end;

procedure TUMEvento.setCodigoEvento(const iCodigoEvento: Integer);
begin
   Self.FCodigoEvento := iCodigoEvento;
end;

procedure TUMEvento.setDataEvento(const dtDataEvento: TDateTime);
begin
   Self.FDataEvento := dtDataEvento;
end;

procedure TUMEvento.setDescricaoEvento(
  const sDescricaoEvento: String);
begin
   Self.FDescricaoEvento := sDescricaoEvento;
end;
procedure TUMEvento.setSenhaAcesso(const sSenhaAcesso: String);
begin
   Self.FSenhaAcesso := sSenhaAcesso;
end;

{## Final Get and Seters Evento ##}



{ Construtor inicializa uma TUMAtividade }
constructor TUMAtividade.Create(const iCodigoAtividade: Integer;
  const sDescricaoAtividade: String; const dtAtividade, hrInicio,
  hrFim: TDateTime );
begin
   Self.FCodigoAtividade := iCodigoAtividade;
   Self.FDescricaoAtividade := sDescricaoAtividade;
   Self.FDataAtividade := dtAtividade;
   Self.FHoraInicio := hrInicio;
   Self.FHoraFim := hrFim;
end;

{Destrutor}
destructor TUMAtividade.Destroy;
begin
  inherited;
end;

{Geters and Seters das Atividades}
function TUMAtividade.getCodigoAtividade: Integer;
begin
   Result := Self.FCodigoAtividade;
end;

function TUMAtividade.getDataAtividade: TDateTime;
begin
   Result := Self.FDataAtividade;
   exit;
end;

function TUMAtividade.getDescricaoAtividade: String;
begin
   Result:= Self.FDescricaoAtividade;
   exit;
end;

function TUMAtividade.getHoraFimAtividade: TDateTime;
begin
   Result:= Self.FHoraFim;
   exit;
end;

function TUMAtividade.getHoraInicioAtividade: TDateTime;
begin
   Result:= Self.FHoraInicio;
   exit;
end;

procedure TUMAtividade.setCodigoAtividade(const iCodigoAtividade: Integer);
begin
   Self.FCodigoAtividade := iCodigoAtividade;
end;

procedure TUMAtividade.setDataAtividade(const dtAtividade: TDateTime);
begin
   Self.FDataAtividade := dtAtividade;
end;

procedure TUMAtividade.setDescricaoAtividade(const sDescricaoAtividade: String);
begin
   Self.FDescricaoAtividade := sDescricaoAtividade;
end;

procedure TUMAtividade.setHoraFim(const horaFim: TDateTime);
begin
   Self.FHoraFim := horaFim;
end;

procedure TUMAtividade.setHoraInicio(const horaInicio: TDateTime);
begin
   Self.FHoraInicio := horaInicio
end;
{Final Geter and Seters}



{Construtor de uma TUMInscricao }

constructor TUMInscricao.Create(const iCodigoInscricao, iCodigoEvento,
  iCodigoPessoa: Integer; const sNmPessoa: String;
  const bSnInscricaoEvento: Boolean; const iCodigoMensalidade: Integer;
  const dtInscricao: TDateTime; const bSnPagouInscricao: Boolean);
begin
   Self.FCodigoInscricao := iCodigoInscricao;
   Self.FCodigoEvento := iCodigoEvento;
   Self.FCodigoPessoa := iCodigoPessoa;
   Self.FCodigoMensalidade := iCodigoMensalidade;
   Self.FNomePessoa := sNmPessoa;
   Self.FSnInscricaoEvento := bSnInscricaoEvento;
   Self.FDataInscricao := dtInscricao;
   Self.FSnPagouInscricao := bSnPagouInscricao;
end;

{Destrutor}
destructor TUMInscricao.Destroy;
begin
  inherited;
end;

class function TUMInscricao.getInscricao(iCodigoEvento, iCodigoPessoa: Integer): TUMInscricao;
var
   oInscricao:TUMInscricao;
   bPagouInscricao:Boolean;
   tblInscricaoAux:TUMZQuery;
begin
   oInscricao:=nil;
   tblInscricaoAux := DM.newQuery();

   with tblInscricaoAux do
   begin
      //Fecha a query
      Close;
      
      SQL.Text := 'SELECT '+
                  '  IF(NOT m.cd_mensalidade IS NULL, IF(m.situacao IN(0, 1, 3, 4, 5, 6, 7), "SIM", "NÃO"), "NÃO") as pagou,'+
                  '  ti.*,'+
                  '  IF ( ti.CD_PESSOA <> "" and ti.NM_PESSOA = "", p.nm_pessoa, ti.NM_PESSOA ) as ds_nm_pessoa '+
                  'FROM '+
                  '  TAM_INSCRICOES as ti'+
                  '  LEFT JOIN pessoas as p ON ( ti.CD_PESSOA = p.cd_pessoa ) '+
                  '  LEFT JOIN mensalidades as m ON(ti.CD_MENSALIDADE = m.cd_mensalidade)  '+
                  'WHERE '+
                  '  ti.cd_evento=:pCDEvento AND '+
                  '  ti.cd_pessoa=:pCDPessoa';
                  
      ParamByName('pCDEvento').AsInteger := iCodigoEvento;
      ParamByName('pCDPessoa').AsInteger := iCodigoPessoa;
      //abre query
      Open;
      //primeiro registro
      First;

      //enquanto houverem registros
      while not EOF do
      begin
         //Valor na base SIM NÃO??
         if(FieldByName('pagou').AsString = 'SIM') then
            bPagouInscricao:=true
         else
            bPagouInscricao:=false;

         //Cria uma inscrição
         oInscricao := TUMInscricao.Create
         (
            FieldByName('CD_INSCRICAO').asInteger,
            FieldByName('CD_EVENTO').asInteger,
            FieldByName('CD_PESSOA').asInteger,
            FieldByName('ds_nm_pessoa').AsString,
            Boolean(FieldByName('SN_INSCRICAO_EVENTO').AsInteger),
            FieldByName('CD_MENSALIDADE').AsInteger,
            FieldByName('DT_INSCRICAO').AsDateTime,
            bPagouInscricao
         );


         //proximo registro
         Next;

      end;//while

      //Fecha a query
      Close;

   end;//with query
   if(Assigned(oInscricao))then
   begin
      //Retorna uma inscrição
      Result:=oInscricao;
   end
   else
   begin
      Result:=nil;
   end;

   exit;
end;//function

function TUMInscricao.getCodigoEvento: Integer;
begin
   Result:=FCodigoEvento;
   exit;
end;

function TUMInscricao.getCodigoInscricao: Integer;
begin
   Result:=FCodigoInscricao;
   exit;
end;

function TUMInscricao.getCodigoMensalidade: Integer;
begin
   Result:=FCodigoMensalidade;
   exit;
end;

function TUMInscricao.getCodigoPessoa: Integer;
begin
   Result:=FCodigoPessoa;
   exit;
end;

function TUMInscricao.getDataInscricao: TDateTime;
begin
   Result:=FDataInscricao;
   exit;
end;

function TUMInscricao.getNomePessoa: String;
begin
  Result:=FNomePessoa;
  exit;
end;

function TUMInscricao.getSnInscricaoEvento: Boolean;
begin
  Result:=FSnInscricaoEvento;
  exit;
end;

function TUMInscricao.getSnPagouInscricao: Boolean;
begin
  Result:=FSnPagouInscricao;
  exit;
end;

{Total de inscrições da base de dados}
class function TUMInscricao.getTotalInscricoes(oEvento: TUMEvento): Integer;
var
   tblTotalInscricoes : TUMZQuery;
   iNrInscricoes: Integer;
begin
   iNrInscricoes := 0;

   //Cria query
   tblTotalInscricoes := DM.newQuery;

   try


      //com a query faça
      with tblTotalInscricoes do
      begin
         SQL.Text := 'SELECT '+
                     '  count(ti.CD_INSCRICAO) as nr_inscricoes '+
                     'FROM '+
                     '  TAM_INSCRICOES as ti '+
                     'WHERE '+
                     '  ti.CD_EVENTO=:pCDEvento';

         ParamByName('pCDEvento').AsInteger := oEvento.CodigoEvento;
         
         //Abre a query
         Open;
         //Primeiro registro
         First;

         //Enquanto houverem registros
         while not EOF do
         begin

            //pega o numero de inscricoes no evento
            iNrInscricoes := FieldByName('nr_inscricoes').AsInteger;
         
            //Continua looping
            Next;
         end;

         //Fecha query
         Close;
         

      end;

   finally
       //libera memória da query
       tblTotalInscricoes.Free;
       Result:= iNrInscricoes;
   end;
end;

{Total de entradas no evento}
class function TUMInscricao.getTotalPresentes(oEvento: TUMEvento): Integer;
var
   tblTotalPresentes : TUMZQuery;
   iNrPresentes: Integer;
begin
   //nova query
   tblTotalPresentes := DM.newQuery;
   iNrPresentes :=0;
   try

      with tblTotalPresentes do
      begin
         SQL.Text := ''+
         'SELECT  '+
         '   count(entradasPessoas.cd_pessoa) as nr_presentes '+
         'FROM  '+
         '    (SELECT '+
              '   cd_pessoa '+
              'FROM  '+
              '   tam_entradas as te '+
              '   INNER JOIN tam_inscricoes_atividades as tia ON (tia.cd_inscricao_atividade=te.cd_inscricao_atividade) '+
              '   INNER JOIN tam_inscricoes as ti ON(tia.cd_inscricao = ti.cd_inscricao) '+
              '   INNER JOIN tam_eventos as ev ON (ti.CD_EVENTO = ev.CD_EVENTO AND ev.CD_EVENTO=ti.CD_EVENTO) '+
              'WHERE '+
              '   ev.CD_EVENTO = :pCDEvento '+
              'GROUP BY '+
              '   ti.CD_PESSOA '+
              ') as entradasPessoas ';

         ParamByName('pCDEvento').AsInteger := oEvento.CodigoEvento;

         Open;

         First;

         if not EOF then
         begin
            iNrPresentes := FieldByName('nr_presentes').AsInteger;
         end;
      end;
   //retorno e liberação da query da memória
   finally
      Result:=iNrPresentes;
      tblTotalPresentes.Free;   
   end;

end;

procedure TUMInscricao.setCodigoEvento(const iCodigoEvento: Integer);
begin
   Self.FCodigoEvento := iCodigoEvento;
end;

procedure TUMInscricao.setCodigoInscricao(const iCodigoInscricao: Integer);
begin
   Self.FCodigoInscricao := iCodigoInscricao;
end;

procedure TUMInscricao.setCodigoMensalidade(const iCodigoMensalidade: Integer);
begin
   Self.FCodigoMensalidade := iCodigoMensalidade;
end;

procedure TUMInscricao.setCodigoPessoa(const iCodigoPessoa: Integer);
begin
   Self.FCodigoPessoa := iCodigoPessoa;
end;

procedure TUMInscricao.setDataInscricao(const dtInscricao: TDateTime);
begin
   Self.FDataInscricao := dtInscricao;
end;

procedure TUMInscricao.setNomePessoa(const sNomePessoa: String);
begin
   Self.FNomePessoa := sNomePessoa;
end;

procedure TUMInscricao.setSnInscricaoEvento(const snInscricaoEvento: Boolean);
begin
   Self.FSnInscricaoEvento := snInscricaoEvento;
end;

procedure TUMInscricao.setSnPagouInscricao(const snPagouInscricao: Boolean);
begin
   Self.FSnPagouInscricao :=snPagouInscricao;
end;



{ Cria uma instancia de TUMInscricoesAtividades }


constructor TUMInscricoesAtividades.Create(const codigoAtividade,
  codigoInscricao, codigoInscricaoAtividade: Integer);
begin
   Self.FCodigoInscricaoAtividade := codigoInscricaoAtividade;
   Self.FCodigoAtividade := codigoAtividade;
   Self.FCodigoInscricao := codigoInscricao;
end;

class procedure TUMInscricoesAtividades.addInscricaoAtividade(
  oInscricao: TUMInscricao; oAtividade: TUMAtividade);
var
   qryInscricaoAtividade:TUMZQuery;
begin
   qryInscricaoAtividade:= DM.newQuery;

   try
      try
         with qryInscricaoAtividade do
         begin
            SQL.Text := ' REPLACE INTO tam_inscricoes_atividades '+
                        ' (cd_atividade,cd_inscricao) '+
                        ' VALUES '+
                        ' (:pCDAtividade,:pCDInscricao) ';
                        
            ParamByName('pCDAtividade').asInteger := oAtividade.CodigoAtividade;
            ParamByName('pCDInscricao').asInteger := oInscricao.CodigoInscricao;

            ExecSQL;
         end;
      except on E: Exception do
         Mensagem(E.Message);
      end;
   finally
      qryInscricaoAtividade.Free;
   end;
end;

function TUMInscricoesAtividades.getCodigoAtividade: Integer;
begin
  Result:=  Self.FCodigoAtividade;
  exit;
end;

function TUMInscricoesAtividades.getCodigoInscricao: Integer;
begin
  Result:=  Self.FCodigoInscricao;
  exit;
end;

function TUMInscricoesAtividades.getCodigoInscricaoAtividade: Integer;
begin
  Result:=  Self.FCodigoInscricaoAtividade;
  exit;
end;

class function TUMInscricoesAtividades.getInscricaoAtividade(
  oInscricao: TUMInscricao; oAtividade: TUMAtividade): TUMInscricoesAtividades;
var
   qryInscricaoAtividade:TUMZQuery;
   oInscricaoAtividade:TUMInscricoesAtividades;
begin
   //Nova query para adicionar a entrada na atividade
   qryInscricaoAtividade:= DM.newQuery;
   oInscricaoAtividade := nil;
   try
      with qryInscricaoAtividade do
      begin
         SQL.Text :=               'SELECT '+
                                   '   * '+
                                   'FROM '+
                                   '   tam_inscricoes_atividades AS tia '+
                                   'WHERE '+
                                   '   tia.cd_atividade=:pCDAtividade and tia.cd_inscricao=:pCDInscricao ';
         ParamByName('pCDAtividade').AsInteger := oAtividade.CodigoAtividade;
         ParamByName('pCDInscricao').AsInteger := oInscricao.CodigoInscricao;

         //abre a query
         Open;

         First;

         //enquanto houverem registros
         while not EOF do
         begin
            oInscricaoAtividade := TUMInscricoesAtividades.Create(
                                                                  FieldByName('cd_atividade').asInteger,
                                                                  FieldByName('cd_inscricao').asInteger,
                                                                  FieldByName('cd_inscricao_atividade').AsInteger
                                                                  );
            Next;
         end;

      end;
   finally
      Result:=oInscricaoAtividade;
      qryInscricaoAtividade.Free;
   end;
end;

{Adiciona uma nova entrada para uma atividade}
class procedure TUMInscricoesAtividades.addEntradaAtividade(
  oInscricaoAtividade: TUMInscricoesAtividades; oAtividade: TUMAtividade);
var
   qrNovaEntradaAtividade :TUMZQuery;
begin

   qrNovaEntradaAtividade :=  DM.newQuery;
   try
      with qrNovaEntradaAtividade do
      begin
      
         SQL.Text := 'REPLACE INTO tam_entradas (cd_inscricao_atividade,dt_entrada,dt_saida) '+
                     ' VALUES(:pCdInscricaoAtividade,:pDTEntrada,"") ';
         ParamByName('pCdInscricaoAtividade').AsInteger := oInscricaoAtividade.getCodigoInscricaoAtividade;
         ParamByName('pDTEntrada').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
         ExecSQL;

      end;
   finally
      qrNovaEntradaAtividade.Free;
   end;
end;

{Retorna a tentativa de acesso do participante , entrada,saida ou entrada sem pagar}
class function TUMInscricoesAtividades.getTipoAcesso(oInscricao: TUMInscricao;
  oInscricaoAtividade: TUMInscricoesAtividades): TUMTipoEntrada;
const
   SQL_FINANCEIRO =
      'SELECT resp.sn_nao_bloquear_financeiro FROM pessoas p ' +
      'INNER JOIN mensalidades m ON (m.codigoaluno = p.cd_pessoa) ' +
      'LEFT JOIN pessoas resp ON (m.cd_resp = resp.cd_pessoa) ' +
      'WHERE p.cd_pessoa = :pessoa '+
      'AND m.cd_mensalidade = :mensalidade';
var
   qrEntradaAtividade,qyIgnorarFinanceiro: TUMZQuery;
   dtEntrada:String;
   dtSaida:String;
   snNaoBloquearFinanceiro:String;
begin
   qrEntradaAtividade  := DM.newQuery;
   qyIgnorarFinanceiro := DM.newQuery;

   with qrEntradaAtividade do
   begin
      SQL.Text:='SELECT * FROM TAM_ENTRADAS as te WHERE te.cd_inscricao_atividade=:pCDInscricaoAtividade';
      ParamByName('pCDInscricaoAtividade').AsInteger :=  oInscricaoAtividade.CodigoInscricaoAtividade;
      Open;

      First;
      //enquanto tiverem registros
      while not EOF do
      begin

         dtEntrada := FieldByName('DT_ENTRADA').AsString;
         dtSaida   := FieldByName('DT_SAIDA').AsString;

         if(Trim(dtSaida) = '')then
         begin
            Result := taSaida;
            TUMEvento.fechaEntrada(oInscricaoAtividade.CodigoInscricaoAtividade);
            Exit;
         end;
         
         Next;
      end;

      Close;
   end;

   qyIgnorarFinanceiro.SQL.Add(SQL_FINANCEIRO);
   qyIgnorarFinanceiro.ParamByName('pessoa').AsInteger := oInscricao.CodigoPessoa;
   qyIgnorarFinanceiro.ParamByName('mensalidade').AsInteger := oInscricao.getCodigoMensalidade;
   qyIgnorarFinanceiro.Open;
   snNaoBloquearFinanceiro := qyIgnorarFinanceiro.FieldByName('sn_nao_bloquear_financeiro').AsString;
   qyIgnorarFinanceiro.Close;


   Result := taSemPagar;
   if(oInscricao.SnPagouInscricao) OR (snNaoBloquearFinanceiro = '1') then
   begin
     Result := taEntrada;
   end;
end;

procedure TUMInscricoesAtividades.setCodigoAtividade(
  const iCodigoAtividade: Integer);
begin
   Self.FCodigoAtividade := iCodigoAtividade;
end;

procedure TUMInscricoesAtividades.setCodigoInscricao(
  const iCodigoInscricao: Integer);
begin
   Self.FCodigoInscricao := iCodigoInscricao;
end;

procedure TUMInscricoesAtividades.setCodigoInscricaoAtividade(
  const iCodigoInscricaoAtividade, iCodigoAtividade, iCodigoInscricao: Integer);
begin
   Self.FCodigoInscricaoAtividade:= iCodigoInscricaoAtividade;
end;

{ Cria uma entrada TUMEntrada }

constructor TUMEntrada.Create(const iCodigoEntrada: Integer; const dtEntrada,
  dtSaida: TDateTime; const oInscricaoAtividade: TUMInscricoesAtividades);
begin

end;

end.
