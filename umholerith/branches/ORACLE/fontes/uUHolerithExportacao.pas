unit uUHolerithExportacao;

interface

uses SysUtils, Classes, uUHolerithExportacaoIdentificadores, uRegExpr, uPessoa,
   UZDataset, Contnrs;

type
   THolerithExportacaoIdentificadoresPessoa = (ipPessoa, ipCpf, ipExterno);

   TLeituraArquivoHolerith = class(TRegExpr)
      strict private
         indexAno, indexMes, indexPessoa : Integer;
         tipoIdentificador : THolerithExportacaoIdentificadoresPessoa;
         chaveSistemaExterno : String;
      public
         constructor Create(const expressao, configuracaoCampos: String);

         property Identificador: THolerithExportacaoIdentificadoresPessoa read tipoIdentificador;
         property PosicaoAno: Integer read indexAno;
         property PosicaoMes: Integer read indexMes;
         property PosicaoPessoa: Integer read indexPessoa;
         property SistemaExterno: String read chaveSistemaExterno;
   end;

   TListRegExpr = class(TObjectList)
      public
         procedure loadFromListConfigs(listaConfigs: TStringList);
         function GetRegExprAccept(const nome: String): TLeituraArquivoHolerith;
   end;

   THolerithExportacao = class(TObject)
      private
         pastaHolerith: String;
         listaRegs : TListRegExpr;
         qyInserir : TUMZQuery;

         procedure SalvarHolerith(const ano, mes: Integer; const pessoa : TPessoa; const arquivo: TSearchRec);

      public
         constructor Create(const pastaHolerith: String; const cd_tipo_folha: Integer; const configuracaoLeitura: String);

         procedure Importar(const arquivo: TSearchRec);
   end;

implementation

uses uGeneral, uLoginManager, DB;

{ THolerithExportacao }

constructor THolerithExportacao.Create(const pastaHolerith: String;
  const cd_tipo_folha: Integer; const configuracaoLeitura: String);
const
   SQL_INSERIR_HOLERITH =
      ' INSERT INTO FIN_HOLERITH(CD_TIPO_FOLHA, CD_PESSOA, NR_MES, NR_ANO, ME_HOLERITH) ' +
      ' VALUES (:CD_TIPO_FOLHA, :CD_PESSOA, :NR_MES, :NR_ANO, :ME_HOLERITH) ';
var
   arrConfiguracaoLeitura: TStringList;
begin
   Self.pastaHolerith := pastaHolerith;
   Self.listaRegs := TListRegExpr.Create();

   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyInserir);
   qyInserir.SQL.Text := SQL_INSERIR_HOLERITH;
   qyInserir.ParamByName('CD_TIPO_FOLHA').AsInteger := cd_tipo_folha;

   arrConfiguracaoLeitura := TStringList.Create();

   try
      TGeneral.SplitString(
         StringReplace(configuracaoLeitura, #13#10, #13, [rfReplaceAll]),
         #13, arrConfiguracaoLeitura);

      if (Trim(configuracaoLeitura) = '') OR (arrConfiguracaoLeitura.Count < 2) then
      begin
         arrConfiguracaoLeitura.Clear;
         arrConfiguracaoLeitura.Add('([0-9]*)-(0[1-9]|1[0-2])-([0-9]{4}).pdf');
         arrConfiguracaoLeitura.Add('ANO=3;MES=2;PESSOA=1:CPF');
      end;

      Self.listaRegs.loadFromListConfigs(arrConfiguracaoLeitura);
   finally
      FreeAndNil(arrConfiguracaoLeitura);
   end;
end;

procedure THolerithExportacao.Importar(const arquivo: TSearchRec);
var
   requisicaoPessoa : IRequerPessoa;
   pessoa : TPessoa;
   ano, mes : Integer;

   regExpr : TLeituraArquivoHolerith;
begin
   regExpr := Self.listaRegs.GetRegExprAccept(arquivo.Name);

   if regExpr = nil then
      raise Exception.Create('Formato do nome do arquivo inválido.');

   case regExpr.Identificador of
      ipPessoa:
         requisicaoPessoa := TIdentificadorPessoa.Create(StrToInt(regExpr.Match[regExpr.PosicaoPessoa]));
      ipCpf:
         requisicaoPessoa := TIdentificadorCPF.Create(regExpr.Match[regExpr.PosicaoPessoa]);
      ipExterno:
         requisicaoPessoa := TIdentificadorExterno.Create(StrToInt(regExpr.Match[regExpr.PosicaoPessoa]), regExpr.SistemaExterno);
   end;

   pessoa := requisicaoPessoa.GetPessoa();
   ano := StrToInt(regExpr.Match[regExpr.PosicaoAno]);
   mes := StrToInt(regExpr.Match[regExpr.PosicaoMes]);

   Self.SalvarHolerith(ano, mes, pessoa, arquivo);
end;

procedure THolerithExportacao.SalvarHolerith(const ano, mes: Integer;
  const pessoa: TPessoa; const arquivo: TSearchRec);
begin
   qyInserir.ParamByName('CD_PESSOA').AsInteger := pessoa.Codigo;
   qyInserir.ParamByName('NR_ANO').AsInteger := ano;
   qyInserir.ParamByName('NR_MES').AsInteger := mes;
   qyInserir.ParamByName('ME_HOLERITH').LoadFromFile(Self.pastaHolerith + arquivo.Name, ftBlob);

   qyInserir.ExecSQL();
end;

{ TListRegExpr }

function TListRegExpr.GetRegExprAccept(
  const nome: String): TLeituraArquivoHolerith;
var
   I : Integer;
begin
   Result := nil;

   for I := 0 to Self.Count - 1 do
   begin
      if TLeituraArquivoHolerith(Self.Items[I]).Exec(nome) then
      begin
         Result := TLeituraArquivoHolerith(Self.Items[I]);
         Break;
      end;
   end;
end;

procedure TListRegExpr.loadFromListConfigs(listaConfigs: TStringList);
var
   I: Integer;
begin
   if listaConfigs.Count MOD 2 <> 0 then
   begin
      raise Exception.Create('A configuração no parâmetro de leitura dos arquivos está incorreta.');
   end;

   I := 0;

   while I < listaConfigs.Count do
   begin
      Self.Add(TLeituraArquivoHolerith.Create(listaConfigs[I], listaConfigs[I+1]));
      Inc(I, 2);
   end;      
end;

{ TLeituraArquivoHolerith }

constructor TLeituraArquivoHolerith.Create(const expressao,
  configuracaoCampos: String);
var
   arrConfiguracaoCampos, arrConfiguracaoPessoa : TStringList;
begin
   inherited Create;

   arrConfiguracaoCampos := TStringList.Create();
   arrConfiguracaoPessoa := TStringList.Create();   
   Self.ModifierI := True;
   Self.Expression := '^' + expressao + '$';

   TGeneral.SplitString(configuracaoCampos, ';', arrConfiguracaoCampos);

   Self.indexAno := StrToInt(arrConfiguracaoCampos.Values['ANO']);
   Self.indexMes := StrToInt(arrConfiguracaoCampos.Values['MES']);

   TGeneral.SplitString(arrConfiguracaoCampos.Values['PESSOA'], ':', arrConfiguracaoPessoa);

   if arrConfiguracaoPessoa.Count < 2 then
   begin
      raise Exception.Create('Configuração inválida para o campo "PESSOA". O mesmo deve estar no formato: "X:TIPO[:PARAMETRO1]');
   end;

   Self.indexPessoa := StrToInt(arrConfiguracaoPessoa[0]);

   if arrConfiguracaoPessoa[1] = 'CODIGO' then
   begin
      Self.tipoIdentificador := ipPessoa;
   end else if arrConfiguracaoPessoa[1] = 'CPF' then
   begin
      Self.tipoIdentificador := ipCpf;
   end else if arrConfiguracaoPessoa[1] = 'EXTERNO' then
   begin
      Self.tipoIdentificador := ipExterno;

      if arrConfiguracaoPessoa.Count <> 3 then
      begin
         raise Exception.Create('Configuração inválida para o campo "PESSOA" usando o tipo Externo. Para o tipo externo é necessário um terceiro parâmetro sendo ele a chave do Sistema externo. Exemplo: "PESSOA=X:EXTERNO:CONTABIL1".');
      end;

      Self.chaveSistemaExterno := arrConfiguracaoPessoa[2];
   end else begin
      raise Exception.Create('Configuração inválida para o campo "PESSOA". O segundo valor dos paraâmetros deve estar entre: CODIGO, CPF ou EXTERNO');
   end;

   FreeAndNil(arrConfiguracaoCampos);
   FreeAndNil(arrConfiguracaoPessoa);
end;

end.
