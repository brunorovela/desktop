unit uPIntLeitora;

interface

uses
   Classes, Contnrs, SysUtils, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

const
   Erros: array[0..1] of string =
      ('Não foi possível definir o código da pessoa. [%s] não é um inteiro válido: %s',
       'Foi detectado um cartão duplicado para a pessoa [%d].');

type
   EUMPIntError = class(Exception);

   IUMPIntLeitoraGabarito = interface(IUnknown)
      ['{93D3ACFA-C824-49F0-926F-6FBAED32A322}']
      function GetModelo: string;
   end;

   TUMPIntLeitoraGabaritoLC2000 = class(TInterfacedObject, IUMPIntLeitoraGabarito)
   strict private
      FSlDados: TStringList;
      FIComprimentoPessoa: integer;
      FIComprimentoId: integer;
      procedure SetDados(const ASlDados: TStringList);
      function GetCodigoPessoaAsInt(const AIndice: integer): integer;
      function GetIdCartao(const AIndice: integer): integer;
      function GetRespostasCount(const AIndice: integer): integer;
      function GetResposta(const AIndice, AINumQuestao: integer): AnsiChar;
      function GetNumeroResposta(const AIndice, AINumQuestao: integer): integer;
      function GetGabaritosCount: integer;
   private
      constructor Create(const ASlDados: TStringList; const AIComprimentoPessoa,
         AIComprimentoId: integer);
      destructor Destroy; override;
      function GetModelo: string;
      property GabaritosCount: integer read GetGabaritosCount;
      property RespostasCount[const I: integer]: integer read GetRespostasCount;
      property Respostas[const I, N: integer]: AnsiChar read GetResposta;
      property IdCartao[const I: integer]: integer read GetIdCartao;
      property NumeroResposta[const I, N: integer]: integer read GetNumeroResposta;
      property CodigoPessoa[const I: integer]: integer read GetCodigoPessoaAsInt;
   protected
      function GetCodigoPessoaAsStr(const AIndice: integer): string;
   end;

   TUMPIntResposta = class(TObject)
   strict private
      FINumero: integer;
      FIResposta: integer;
      FCResposta: AnsiChar;
      procedure SetResposta(const ACResposta: AnsiChar); overload;
      procedure SetResposta(const AIResposta: integer); overload;
   private
      constructor Create(const AINumero, AIResposta: integer); overload;
      constructor Create(const AINumero: integer; ACResposta: AnsiChar); overload;
      destructor Destroy; override;
      property RespostaChar: AnsiChar read FCResposta;
   public
      property Numero: integer read FINumero;
      property Resposta: integer read FIResposta;
   end;

   TUMPIntProva = class(TObject)
   strict private
      FICodigoPessoa: integer;
      FOlRespostas: TObjectList;
      function GetRespostasCount: integer;
      function GetResposta(const AIndice: integer): TUMPIntResposta;
      function ProcuraResposta(const AINumero: integer; const ACValor: AnsiChar): boolean; overload;
      function ProcuraResposta(const AUMPIntResposta: TUMPIntResposta): boolean; overload;
   private
      constructor Create(const AICodigoPessoa: integer);
      destructor Destroy; override;
      procedure AdicionaResposta(const AINumero: integer; const ACValor: AnsiChar); overload;
      procedure AdicionaResposta(const AUMPIntResposta: TUMPIntResposta); overload;
   public
      property CodigoPessoa: integer read FICodigoPessoa;
      property RespostasCount: integer read GetRespostasCount;
      property Respostas[const I: integer]: TUMPIntResposta read GetResposta;
   end;

   TUMPIntImportacao = class(TObject)
   strict private
      FUMPIntLeitoraGabaritoLC2000: TUMPIntLeitoraGabaritoLC2000;
      FOlProvas: TObjectList;
   private
      procedure AdicionaProva(const AUMPIntProva: TUMPIntProva); overload;
      procedure AdicionaProva(const AICodigoPessoa: integer); overload;
      function ProcuraProva(const AICodigoPessoa: integer): TUMPIntProva;
      function GetProva(const AIndice: integer): TUMPIntProva;
      function GetProvasCount: integer;
   public
      constructor Create(const AIComprimentoPessoa, AIComprimentoId: integer;
         const ASModeloLeitora: string; const ASlDados: TStringList);
      destructor Destroy; override;
      function Processa: TStringList;
      property Provas[const I: integer]: TUMPIntProva read GetProva;
      property ProvasCount: integer read GetProvasCount;
   end;

implementation

{ TUMPIntLeitoraGabaritoLC2000 }

constructor TUMPIntLeitoraGabaritoLC2000.Create(const ASlDados: TStringList;
  const AIComprimentoPessoa, AIComprimentoId: integer);
begin
   FSlDados := TStringList.Create;
   FSlDados.AddStrings(ASlDados);
   FIComprimentoPessoa := AIComprimentoPessoa;
   FIComprimentoId := AIComprimentoId;
end;

destructor TUMPIntLeitoraGabaritoLC2000.Destroy;
begin
   FreeAndNil(FSlDados);
   inherited;
end;

function TUMPIntLeitoraGabaritoLC2000.GetCodigoPessoaAsInt(
  const AIndice: integer): integer;
var
   LSCodPessoa: string;
begin
   LSCodPessoa := GetCodigoPessoaAsStr(AIndice);
   try
      Result := StrToInt(LSCodPessoa);
   except
      on E: EConvertError do
         raise EUMPIntError.CreateFmt(Erros[0], [LSCodPessoa, E.Message]);
   end;
end;

function TUMPIntLeitoraGabaritoLC2000.GetCodigoPessoaAsStr(
  const AIndice: integer): string;
begin
   Result := Copy(FSlDados.Strings[AIndice], 1, FIComprimentoPessoa);
end;

function TUMPIntLeitoraGabaritoLC2000.GetGabaritosCount: integer;
begin
   Result := FSlDados.Count;
end;

function TUMPIntLeitoraGabaritoLC2000.GetIdCartao(
  const AIndice: integer): integer;
begin
   Result :=
      BinToDec(
         Copy(FSlDados.Strings[AIndice],
         FIComprimentoPessoa + 1,
         FIComprimentoId));
end;

function TUMPIntLeitoraGabaritoLC2000.GetModelo: string;
begin
   Result := 'LC2000';
end;

function TUMPIntLeitoraGabaritoLC2000.GetNumeroResposta(const AIndice,
  AINumQuestao: integer): integer;
var
   LIIdCartao: integer;
begin
   LIIdCartao := GetIdCartao(AIndice) - 1;
   if LIIdCartao = 0 then
      Result := AINumQuestao
   else
      Result := LIIdCartao * GetRespostasCount(AIndice) + AINumQuestao;
end;

function TUMPIntLeitoraGabaritoLC2000.GetResposta(const AIndice,
  AINumQuestao: integer): AnsiChar;
begin
   Result :=
      Copy(
         FSlDados.Strings[AIndice],
         FIComprimentoPessoa + FIComprimentoId + 1,
         GetRespostasCount(AIndice))[AINumQuestao];
end;

function TUMPIntLeitoraGabaritoLC2000.GetRespostasCount(
  const AIndice: integer): integer;
var
   LInicio: integer;
begin
   LInicio := FIComprimentoPessoa + FIComprimentoId + 1;
   Result :=
      Length(
         Copy(
            FSlDados.Strings[AIndice], LInicio,
            Length(FSlDados.Strings[AIndice]) - LInicio + 1)
      );
end;

procedure TUMPIntLeitoraGabaritoLC2000.SetDados(const ASlDados: TStringList);
begin
   FSlDados.Clear;
   FSlDados.AddStrings(ASlDados);
end;

{ TUMPIntProva }

procedure TUMPIntProva.AdicionaResposta(const AINumero: integer;
  const ACValor: AnsiChar);
begin
   if not ProcuraResposta(AINumero, ACValor) then
      FOlRespostas.Add(TUMPIntResposta.Create(AINumero, ACValor))
   else
      raise EUMPIntError.CreateFmt(Erros[1], [FICodigoPessoa]);
end;

procedure TUMPIntProva.AdicionaResposta(const AUMPIntResposta: TUMPIntResposta);
begin
   FOlRespostas.Add(AUMPIntResposta);
end;

constructor TUMPIntProva.Create(const AICodigoPessoa: integer);
begin
   FICodigoPessoa := AICodigoPessoa;
   FOlRespostas := TObjectList.Create;
end;

destructor TUMPIntProva.Destroy;
var
   I: integer;
begin
   for I := FOlRespostas.Count - 1 downto 0 do
      TUMPIntResposta(FOlRespostas.Extract(FOlRespostas.Items[I])).Free;
   inherited;
end;

function TUMPIntProva.GetResposta(const AIndice: integer): TUMPIntResposta;
begin
   Result := TUMPIntResposta(FOlRespostas.Items[AIndice]);
end;

function TUMPIntProva.GetRespostasCount: integer;
begin
   Result := FOlRespostas.Count;
end;

function TUMPIntProva.ProcuraResposta(const AINumero: integer;
  const ACValor: AnsiChar): boolean;
var
   I: integer;
   LUMPIntResposta: TUMPIntResposta;
begin
   Result := false;
   for I := 0 to FOlRespostas.Count - 1 do
   begin
      LUMPIntResposta := TUMPIntResposta(FOlRespostas.Items[I]);
      try
         if (LUMPIntResposta.RespostaChar = ACValor) and
            (LUMPIntResposta.Numero = AINumero) then
         begin
            Result := true;
            Break;
         end;
      finally
         LUMPIntResposta := nil;
      end;
   end;
end;

function TUMPIntProva.ProcuraResposta(
  const AUMPIntResposta: TUMPIntResposta): boolean;
var
   I: integer;
   LUMPIntResposta: TUMPIntResposta;
begin
   Result := false;
   for I := 0 to FOlRespostas.Count - 1 do
   begin
      LUMPIntResposta := TUMPIntResposta(FOlRespostas.Items[I]);
      try
         if (LUMPIntResposta.Resposta = AUMPIntResposta.Resposta) and
            (LUMPIntResposta.Numero = AUMPIntResposta.Numero) then
         begin
            Result := true;
            Break;
         end;
      finally
         LUMPIntResposta := nil;
      end;
   end;
end;

{ TUMPIntImportacao }

procedure TUMPIntImportacao.AdicionaProva(const AICodigoPessoa: integer);
begin
   FOlProvas.Add(TUMPIntProva.Create(AICodigoPessoa));
end;

procedure TUMPIntImportacao.AdicionaProva(const AUMPIntProva: TUMPIntProva);
begin
   FOlProvas.Add(AUMPIntProva);
end;

constructor TUMPIntImportacao.Create(const AIComprimentoPessoa,
  AIComprimentoId: integer; const ASModeloLeitora: string;
  const ASlDados: TStringList);
begin
   FUMPIntLeitoraGabaritoLC2000 :=
      TUMPIntLeitoraGabaritoLC2000.Create(
         ASlDados, AIComprimentoPessoa, AIComprimentoId);
   FOlProvas := TObjectList.Create;
end;

destructor TUMPIntImportacao.Destroy;
var
   I: integer;
begin
   for I := FOlProvas.Count - 1 downto 0 do
      TUMPIntProva(FOlProvas.Extract(FOlProvas.Items[I])).Free;
   FreeAndNil(FOlProvas);
   inherited;
end;

function TUMPIntImportacao.GetProva(const AIndice: integer): TUMPIntProva;
begin
   Result := TUMPIntProva(FOlProvas.Items[AIndice]);
end;

function TUMPIntImportacao.GetProvasCount: integer;
begin
   Result := FOlProvas.Count;
end;

function TUMPIntImportacao.Processa: TStringList;
var
   I, J: integer;
   LUMPIntProva: TUMPIntProva;
   listaGabaritosErrados : TStringList;
begin
   listaGabaritosErrados := TStringList.Create;
   for I := 0 to FUMPIntLeitoraGabaritoLC2000.GabaritosCount - 1 do
   begin
   try
      LUMPIntProva := ProcuraProva(FUMPIntLeitoraGabaritoLC2000.CodigoPessoa[I]);
   except
      listaGabaritosErrados.Add(FUMPIntLeitoraGabaritoLC2000.GetCodigoPessoaAsStr(I));
      continue;
   end;
      if not Assigned(LUMPIntProva) then
      begin
         LUMPIntProva :=
            TUMPIntProva.Create(FUMPIntLeitoraGabaritoLC2000.CodigoPessoa[I]);
         AdicionaProva(LUMPIntProva);
      end;
      for J := 1 to FUMPIntLeitoraGabaritoLC2000.RespostasCount[I] do
         try
            LUMPIntProva.AdicionaResposta(
               FUMPIntLeitoraGabaritoLC2000.NumeroResposta[I, J],
               FUMPIntLeitoraGabaritoLC2000.Respostas[I, J]);
         except
            on E: EUMPIntError do raise;
         end;
   end;

   result := listaGabaritosErrados;
end;

function TUMPIntImportacao.ProcuraProva(
  const AICodigoPessoa: integer): TUMPIntProva;
var
   I: integer;
begin
   Result := nil;
   for I := 0 to FOlProvas.Count - 1 do
      if TUMPIntProva(FOlProvas.Items[I]).CodigoPessoa = AICodigoPessoa then
      begin
         Result := TUMPIntProva(FOlProvas.Items[I]);
         Break;
      end;
end;

{ TUMPIntResposta }

constructor TUMPIntResposta.Create(const AINumero, AIResposta: integer);
begin
   FINumero := AINumero;
   FIResposta := AIResposta;
   SetResposta(AIResposta);
end;

constructor TUMPIntResposta.Create(const AINumero: integer;
  ACResposta: AnsiChar);
begin
   FINumero := AINumero;
   FCResposta := ACResposta;
   SetResposta(ACResposta);
end;

destructor TUMPIntResposta.Destroy;
begin
   inherited;
end;

procedure TUMPIntResposta.SetResposta(const AIResposta: integer);
begin
   FCResposta := Chr(AIResposta + 64);
end;

procedure TUMPIntResposta.SetResposta(const ACResposta: AnsiChar);
var
   LSResposta: string;
begin
   LSResposta := AnsiUpperCase(ACResposta);
   FIResposta := Ord(LSResposta[1]) - 64;
end;

end.

