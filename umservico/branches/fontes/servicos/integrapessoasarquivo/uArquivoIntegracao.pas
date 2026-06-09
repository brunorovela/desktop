unit uArquivoIntegracao;

interface

uses
   uSvcClasses, Classes, uIntegracao, IniFiles, uDMConexao, SysUtils, uUteis,
   uCFuncString, uPessoaIntegra, UZDataset, uValidacaoArquivo, Windows;

const

   SQL_BUSCA_CODIGO = 'SELECT cd_municipio FROM municipios WHERE ds_municipio = :ds_municipio';
   
   SQL_ATUALIZA_HIERARQUIAS_GRUPO =
      'INSERT INTO NU_GRUPOS_HIERARQUIA (CD_GRUPO, CD_GRUPO_LIBERADO) ' +
      'SELECT A.CD_GRUPO, G.CD_GRUPO ' +
      'FROM NU_GRUPOS A, NU_GRUPOS G ' +
      'WHERE A.CD_GRUPO = 9 AND G.DS_NOME_GRUPO LIKE ''% %s'' AND NOT EXISTS ' +
      '(SELECT H.CD_GRUPO_ALTERNAR ' +
      'FROM NU_GRUPOS_HIERARQUIA H ' +
      'WHERE A.CD_GRUPO = H.CD_GRUPO AND G.CD_GRUPO = H.CD_GRUPO_LIBERADO)';

   SQL_ATUALIZA_GRUPOS_BIBLIOTECA =
      'INSERT INTO BIB_GRUPOS (CD_GRUPO, NR_ORDEM_IMPORTANCIA, NR_EMPRESTIMOS_SIMULTANEOS, SN_FINANCEIRO_REMOTO) ' +
      'SELECT G.CD_GRUPO, 999, 999, 0 FROM NU_GRUPOS G ' +
      'WHERE NOT EXISTS (SELECT B.CD_BIB_GRUPO FROM BIB_GRUPOS B WHERE G.CD_GRUPO = B.CD_GRUPO)';

   SQL_ATUALIZA_MODALIDADES_GRUPO =
      'INSERT INTO BIB_MODALIDADES_MOVIMENTO_GRP (CD_MODALIDADE, CD_BIB_GRUPO) ' +
      'SELECT M.CD_MODALIDADE, G.CD_BIB_GRUPO FROM ' +
      'BIB_GRUPOS G, BIB_MODALIDADES_MOVIMENTO M WHERE NOT EXISTS ' +
      '(SELECT MG.CD_MODALIDADE_GRUPO FROM BIB_MODALIDADES_MOVIMENTO_GRP MG ' +
      'WHERE G.CD_BIB_GRUPO = MG.CD_BIB_GRUPO AND M.CD_MODALIDADE = MG.CD_MODALIDADE)';

type

   TArquivoIntegracao = class(TIntegracao)

      strict private

         FArquivo: TextFile;
         FConfig: TIniFile;

         { Realiza a conexão com o banco de dados }
         function ConectaBanco(): Boolean;

         { Busca o código do municipio na base destino conforme descrição da cidade }
         function GetCodigoMunicipio(Descricao: String): Integer;

         { Carrega as informações dos arquivos e cria as pessoas }
         procedure CarregaDados();

         { Remove as aspas duplas de cada campo }
         procedure LimpaCampos(var Campos: TStringList);

         { Atualiza todos os grupos da biblioteca }
         procedure AtualizaGruposBiblioteca();

         procedure MoveArquivo(Caminho, Destino, Arquivo: String);

         { Getters and Setters }
         
         function GetConfig: TIniFile;
         procedure SetConfig(const Value: TIniFile);

      public

         constructor Create(const FCaminho: String; FConfig: TIniFile);

         property Config: TIniFile read GetConfig write SetConfig;

   end;


implementation

{ TArquivoIntegracao }

procedure TArquivoIntegracao.AtualizaGruposBiblioteca;
var
   qryAtualizaGruposBiblioteca: TUMZQuery;
begin
   qryAtualizaGruposBiblioteca := Self.GetConexao.newQuery;

   qryAtualizaGruposBiblioteca.SQL.Text := SQL_ATUALIZA_HIERARQUIAS_GRUPO;

   qryAtualizaGruposBiblioteca.ExecSQL;

   qryAtualizaGruposBiblioteca.SQL.Text := SQL_ATUALIZA_GRUPOS_BIBLIOTECA;

   qryAtualizaGruposBiblioteca.ExecSQL;

   qryAtualizaGruposBiblioteca.SQL.Text := SQL_ATUALIZA_MODALIDADES_GRUPO;

   qryAtualizaGruposBiblioteca.ExecSQL;
end;

procedure TArquivoIntegracao.CarregaDados;
var
   Linha: String;
   i: Integer;
   PessoasInformacoes: TDadosPessoa;
   InformacoesSeparadas: TStringList;
   Pessoa: TPessoaIntegra;
begin
   while not(Eof(Self.FArquivo)) do
   begin
      PessoasInformacoes.Grupos           := TStringList.Create;
      PessoasInformacoes.Contatos         := TStringList.Create;
      PessoasInformacoes.Dados            := TStringList.Create;

      PessoasInformacoes.ChaveGrupo       :=
         Self.FConfig.ReadString('Arquivos', 'ChaveGrupo', '');

      PessoasInformacoes.ChaveNovoCodigo  :=
         Self.FConfig.ReadString('Arquivos', 'ChaveNovoCodigo', '');

      Readln(Self.FArquivo, Linha);

      InformacoesSeparadas := TFuncString.splitString(Linha, ';');

      LimpaCampos(InformacoesSeparadas);

      { Informações relacionadas aos dados pessoais da pessoa }
      with PessoasInformacoes.Dados do
      begin
         Values['nm_pessoa']              := InformacoesSeparadas.Strings[1];
         Values['ds_senha']               := InformacoesSeparadas.Strings[2];
         Values['cd_municipio']           := IntToStr(GetCodigoMunicipio(InformacoesSeparadas.Strings[5]));
         Values['ds_logradouro']          := InformacoesSeparadas.Strings[6];
         Values['ds_bairro']              := InformacoesSeparadas.Strings[7];
         Values['ds_estado']              := InformacoesSeparadas.Strings[8];
         Values['ds_sexo']                := InformacoesSeparadas.Strings[11];
         Values['dt_nascimento']          := InformacoesSeparadas.Strings[12];
         Values['ds_identidade']          := InformacoesSeparadas.Strings[13];
         Values['ds_cpf']                 := InformacoesSeparadas.Strings[14];
      end;

      { Informações relacionadas aos contatos da pessoa }
      with PessoasInformacoes.Contatos do
      begin
         Values['4'] := InformacoesSeparadas.Strings[15];
         Values['3'] := InformacoesSeparadas.Strings[9];
         Values['7'] := InformacoesSeparadas.Strings[10];
      end;

//      PessoasInformacoes.Grupos.Add('Estudantes');

      PessoasInformacoes.Grupos.Add('Estudantes');

      Pessoa := TPessoaIntegra.Create(PessoasInformacoes);

      Self.Pessoas.Add(Pessoa);
   end;
end;

function TArquivoIntegracao.ConectaBanco: Boolean;
begin
   Self.SetConexao(TUMConexao.Create(nil));
   
   Self.GetConexao.Conectar(Self.FConfig, 'Arquivos', False);

   if not(Self.GetConexao.IsConectado(False, True)) then
   begin
      raise Exception.Create(Format(MSG_CONEXAO_INVALIDA, [Self.FConfig.ReadString('Arquivos', 'Banco', '127.0.0.1')]));
   end;
end;

constructor TArquivoIntegracao.Create(const FCaminho: String;
  FConfig: TIniFile);
begin
   Self.Config    := FConfig;
   Self.Pessoas   := TList.Create;

   Self.ConectaBanco();

   AssignFile(Self.FArquivo, FCaminho);
   Reset(Self.FArquivo);

   Self.CarregaDados();

   Self.IniciaProcessoIntegracao( TValidacaoArquivo.Create(Self.GetConexao) );

   Self.AtualizaGruposBiblioteca();

   Close(Self.FArquivo);

   MoveArquivo(
      ExtractFileDir(FCaminho),
      ExtractFileDir(FCaminho)+'\Arquivos Integrados',
      ExtractFileName(FCaminho)
   );
end;

function TArquivoIntegracao.GetCodigoMunicipio(Descricao: String): Integer;
var
   qryBuscaCodigoMunicipio: TUMZQuery;
begin
   qryBuscaCodigoMunicipio := Self.GetConexao.newQuery;

   qryBuscaCodigoMunicipio.SQL.Text := SQL_BUSCA_CODIGO;

   qryBuscaCodigoMunicipio.ParamByName('ds_municipio').AsString :=
      Descricao;

   qryBuscaCodigoMunicipio.Open;

   if qryBuscaCodigoMunicipio.IsEmpty then
   begin
      Result := 0;
      Exit;
   end;

   Result := qryBuscaCodigoMunicipio.FieldByName('cd_municipio').AsInteger;
end;

function TArquivoIntegracao.GetConfig: TIniFile;
begin
   Result := Self.FConfig;
end;

procedure TArquivoIntegracao.LimpaCampos(var Campos: TStringList);
var
   i: Integer;
begin
   for i := 0 to Campos.Count - 1 do
   begin
      Campos.Strings[i] := StringReplace(Campos.Strings[i], '"', '', [rfReplaceAll, rfIgnoreCase]);
   end;
end;

procedure TArquivoIntegracao.MoveArquivo(Caminho, Destino, Arquivo: String);
begin
   MoveFile(PChar(Caminho+'\'+Arquivo), PChar(Destino+'\'+Arquivo));
end;

procedure TArquivoIntegracao.SetConfig(const Value: TIniFile);
begin
   Self.FConfig := Value;
end;

end.
