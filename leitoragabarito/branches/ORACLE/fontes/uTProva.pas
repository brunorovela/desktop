unit uTProva;

interface

uses
   UZDataset, uPessoa, Classes, SysUtils, Variants, uGeneral, uLkJSON;

type
   ExceptionInclusaoProvaAlunoBuilder = class(Exception);

   TProva = class;

   TArrayIntegerCodigosDisciplinas = array of Integer;

   TAlunoProvaIncluir = class(TObject)
      private
         pessoa: TPessoa;
         nr_anosemestre: Integer;
         cd_turma: String;

      public
         constructor Create(pessoa: TPessoa; nr_anosmestre: Integer; cd_turma: String);

   end;

   TListaPessoas = array of TPessoa;

   TProvaAluno = class(TObject)
      strict private
         prova : TProva;
         pessoa : TPessoa;

      public
         constructor Create(prova : TProva; pessoa: TPessoa);

         function HasProva(): Boolean;
   end;

   TInclusaoProvaAlunoBuilder = class
      strict private
         prova : TProva;
         listaAlunosIncluir : array of TAlunoProvaIncluir;

         function GetUltimoCodigoProvaAluno(): Integer;

         procedure CarregarListaCodigosDisciplinas(var listaDisciplinas : TArrayIntegerCodigosDisciplinas);

      private
         procedure SetProva(prova: TProva);

         constructor Create();

      public
         procedure AddAluno(provaAlunoIncluir: TAlunoProvaIncluir);

         procedure Executar();
   end;

   TProva = class(TObject)
      strict private
         cd_prova: Integer;
         sn_nota_compartilhada: boolean;
         nr_qtd_partes_gabarito: Integer;

         parametro_gabaritos_sorteio_ordenado : Boolean;

         procedure CarregarDoBanco();

      public
         constructor Create(cd_prova : Integer);

         function isQuantidadePartesValida(nr_parte: Integer): Boolean;
         function createBuilderInclusaoProvaAluno(): TInclusaoProvaAlunoBuilder;
         function GetGabarito(): Integer;
         function GetListaGabaritosInputQuery(): TListInputQueryCheck;
         function GetPartesInputQuery(): TListInputQueryCheck;
         function GetQuantidadeQuestoes(const nr_parte: Integer): Integer;
         function GetQuantidadeAlunos(const cd_turma: String = ''; const nr_anosemestre: Integer = -1): Integer;

         property Codigo: Integer read cd_prova;
         property QuantidadePartesGabarito: Integer read nr_qtd_partes_gabarito;
         property NotaCompartilhada: Boolean read sn_nota_compartilhada;

   end;

implementation

uses uDM, Windows, ZDbcIntfs, Contnrs;

{ TProva }

procedure TProva.CarregarDoBanco;
const
   SQL_CARREGAR_BANCO =
      ' SELECT sn_nota_compartilhada, nr_qtd_partes_gabarito ' +
      ' FROM leitora_provas ' +
      ' WHERE cd_prova = :cd_prova ';
var
   qyCarregarBanco : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyCarregarBanco);

   qyCarregarBanco.SQL.Text := SQL_CARREGAR_BANCO;
   qyCarregarBanco.ParamByName('cd_prova').AsInteger := Self.cd_prova;
   qyCarregarBanco.Open();

   if qyCarregarBanco.RecordCount <> 1 then
   begin
      FreeAndNil(qyCarregarBanco);
      raise Exception.Create('Prova não encontrada');
   end;

   Self.sn_nota_compartilhada := (qyCarregarBanco.FieldByName('sn_nota_compartilhada').AsInteger = 1);
   Self.nr_qtd_partes_gabarito := qyCarregarBanco.FieldByName('nr_qtd_partes_gabarito').AsInteger;

   FreeAndNil(qyCarregarBanco);
end;

constructor TProva.Create(cd_prova: Integer);
begin
   Self.cd_prova := cd_prova;
   Self.CarregarDoBanco();

   Self.parametro_gabaritos_sorteio_ordenado := (DM.variavel_parametro('lg_gabaritos_sorteio_ordenado') = 'S');
end;

function TProva.createBuilderInclusaoProvaAluno: TInclusaoProvaAlunoBuilder;
begin
   Result := TInclusaoProvaAlunoBuilder.Create();
   Result.SetProva(Self);
end;

function TProva.GetGabarito: Integer;
var
   iNumero, iNum : integer;
   iSegundos : integer;

   qyProvasGabaritos : TUMZReadOnlyQuery;
begin
   Result := -1;

   DM.CriarConsulta(qyProvasGabaritos);

   if Self.parametro_gabaritos_sorteio_ordenado then
   begin
      DM.iGabaritoAtual := DM.iGabaritoAtual + 1;

      qyProvasGabaritos.Close();
      qyProvasGabaritos.SQL.Text := 'SELECT * FROM leitora_provas_gabaritos WHERE cd_prova = :cd_prova ORDER BY cd_prova_gabarito';
      qyProvasGabaritos.ParamByName('cd_prova').AsInteger := Self.cd_prova;
      qyProvasGabaritos.Open();

      if DM.iGabaritoAtual > qyProvasGabaritos.RecordCount then
      begin
         DM.iGabaritoAtual := 1;
      end;

      iNumero := 1;
      while not qyProvasGabaritos.Eof do
      begin
         if iNumero = DM.iGabaritoAtual then
         begin
            Result := qyProvasGabaritos.FieldByName('cd_prova_gabarito').AsInteger;
            qyProvasGabaritos.Last();
         end;

         iNumero := iNumero + 1;
         qyProvasGabaritos.Next();
      end;
   end else begin
      iSegundos := Random(StrToInt(FormatDateTime('s', Time)))+1;

      qyProvasGabaritos.Close();
      qyProvasGabaritos.SQL.Text := 'SELECT * FROM leitora_provas_gabaritos WHERE cd_prova = :cd_prova';
      qyProvasGabaritos.ParamByName('cd_prova').AsInteger := Self.cd_prova;
      qyProvasGabaritos.Open();

      iNum := 1;
      for iNumero := 1 to iSegundos do
      begin
         Result := qyProvasGabaritos.FieldByName('cd_prova_gabarito').AsInteger;

         if iNum < qyProvasGabaritos.RecordCount then
         begin
            qyProvasGabaritos.Next();
            iNum := iNum + 1;
         end else begin
            qyProvasGabaritos.First();
            iNum := 1;
         end;
      end;
   end;
end;

function TProva.GetListaGabaritosInputQuery: TListInputQueryCheck;
const
   SQL_GET_LISTA_GABARITOS_INPUT_QUERY =
      ' SELECT cd_prova_gabarito, ds_nome_gabarito ' +
      ' FROM leitora_provas_gabaritos lpg WHERE lpg.cd_prova = :cd_prova ' +
      ' ORDER BY ds_nome_gabarito ';
var
   qyGetListaGabaritosInputQuery: TUMZReadOnlyQuery;
begin
   Result := TListInputQueryCheck.Create();

   DM.CriarConsulta(qyGetListaGabaritosInputQuery);

   qyGetListaGabaritosInputQuery.SQL.Text := SQL_GET_LISTA_GABARITOS_INPUT_QUERY;
   qyGetListaGabaritosInputQuery.ParamByName('cd_prova').AsInteger := Self.cd_prova;

   qyGetListaGabaritosInputQuery.Open();
   while not qyGetListaGabaritosInputQuery.Eof do
   begin
      Result.Add(TInputQueryCheck.Create(
         qyGetListaGabaritosInputQuery.FieldByName('cd_prova_gabarito').AsInteger,
         qyGetListaGabaritosInputQuery.FieldByName('ds_nome_gabarito').AsString
      ));
      qyGetListaGabaritosInputQuery.Next();
   end;
end;

function TProva.GetPartesInputQuery(): TListInputQueryCheck;
var
   IParte: Word;
begin
   Result := TListInputQueryCheck.Create();

   for IParte := 1 to Self.QuantidadePartesGabarito do
   begin
      Result.Add(TInputQueryCheck.Create( IParte, 'Parte ' + IntToStr(IParte) ));
   end;
end;

function TProva.GetQuantidadeAlunos(const cd_turma: String;
  const nr_anosemestre: Integer): Integer;
const
   SQL_QTD_ALUNOS_PROVA =
      ' SELECT COUNT(a.cd_prova_aluno) AS qtde ' +
      ' FROM leitora_provas_gabaritos g ' +
      '      INNER JOIN leitora_provas_alunos a ON (a.cd_prova_gabarito = g.cd_prova_gabarito) ' +
      ' WHERE g.cd_prova = :cd_prova ';
var
   qyQtdAlunosProva : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyQtdAlunosProva);

   qyQtdAlunosProva.SQL.Text := SQL_QTD_ALUNOS_PROVA;
   qyQtdAlunosProva.ParamByName('cd_prova').AsInteger := Self.cd_prova;

   if cd_turma <> '' then
   begin
      qyQtdAlunosProva.SQL.Add('AND a.cd_turma = :cd_turma');
      qyQtdAlunosProva.ParamByName('cd_turma').AsString := cd_turma;
   end;

   if nr_anosemestre <> -1 then
   begin
      qyQtdAlunosProva.SQL.Add('AND a.nr_anosemestre = :nr_anosemestre');
      qyQtdAlunosProva.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   end;

   qyQtdAlunosProva.Open();
   Result := qyQtdAlunosProva.FieldByName('qtde').AsInteger;

   FreeAndNil(qyQtdAlunosProva);
end;

function TProva.GetQuantidadeQuestoes(const nr_parte: Integer): Integer;
const
   SQL_GET_QUANTIDADE_QUESTOES =
      ' SELECT COUNT(pgr.nr_questao) AS qtd_questoes ' +
      ' FROM leitora_provas_gabaritos_resp pgr ' +
      '      INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_gabarito = pgr.cd_prova_gabarito) ' +
      ' WHERE pg.cd_prova = :cd_prova AND pgr.nr_parte = :nr_parte ';
var
   qyGetQuantidadeQuestoes: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetQuantidadeQuestoes);

   qyGetQuantidadeQuestoes.SQL.Text := SQL_GET_QUANTIDADE_QUESTOES;
   qyGetQuantidadeQuestoes.ParamByName('cd_prova').AsInteger := Self.cd_prova;
   qyGetQuantidadeQuestoes.ParamByName('nr_parte').AsInteger := nr_parte;
   qyGetQuantidadeQuestoes.Open();

   Result := qyGetQuantidadeQuestoes.FieldByName('qtd_questoes').AsInteger;

   FreeAndNil(qyGetQuantidadeQuestoes);
end;

function TProva.isQuantidadePartesValida(nr_parte: Integer): Boolean;
const
   SQL_VERIFICAR_QTD_PARTES_VALIDA =
      ' SELECT COALESCE(MAX(lpgr.nr_parte), 0) AS quantidade ' +
      ' FROM leitora_provas_gabaritos lpg ' +
      '      INNER JOIN leitora_provas_gabaritos_resp lpgr ON (lpgr.cd_prova_gabarito = lpg.cd_prova_gabarito) ' +
      ' WHERE lpg.cd_prova = :cd_prova ';
var
   qyVerificarQtdPartesValida : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyVerificarQtdPartesValida);

   qyVerificarQtdPartesValida.SQL.Text := SQL_VERIFICAR_QTD_PARTES_VALIDA;
   qyVerificarQtdPartesValida.ParamByName('cd_prova').AsInteger := Self.cd_prova;

   qyVerificarQtdPartesValida.Open();

   Result := False;
   if nr_parte >= qyVerificarQtdPartesValida.FieldByName('quantidade').AsInteger then
   begin
      Result := True;
   end;

   FreeAndNil(qyVerificarQtdPartesValida);
end;

{ TInclusaoProvaAlunoBuilder }

procedure TInclusaoProvaAlunoBuilder.AddAluno(provaAlunoIncluir: TAlunoProvaIncluir);
var
   arraySize : Integer;
begin
   if TProvaAluno.Create(Self.prova, provaAlunoIncluir.pessoa).HasProva() then
   begin
      raise ExceptionInclusaoProvaAlunoBuilder.Create('O(A) aluno(a) ' + provaAlunoIncluir.pessoa.Nome + ' já está vinculado(a) a essa prova.');
   end;

   arraySize := Length(Self.listaAlunosIncluir);
   SetLength(Self.listaAlunosIncluir, arraySize+1);
   Self.listaAlunosIncluir[arraySize] := provaAlunoIncluir;
end;

procedure TInclusaoProvaAlunoBuilder.CarregarListaCodigosDisciplinas(
  var listaDisciplinas: TArrayIntegerCodigosDisciplinas);
const
   SQL_CARREGAR_LISTA_CODIGOS_DISCIPLINAS =
      'SELECT cd_prova_disciplina FROM leitora_provas_disciplinas WHERE cd_prova = :cd_prova';
var
   qyCarregarListaCodigosDisciplinas: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyCarregarListaCodigosDisciplinas);

   qyCarregarListaCodigosDisciplinas.SQL.Text := SQL_CARREGAR_LISTA_CODIGOS_DISCIPLINAS;
   qyCarregarListaCodigosDisciplinas.ParamByName('cd_prova').AsInteger := Self.prova.Codigo;
   qyCarregarListaCodigosDisciplinas.Open();

   SetLength(listaDisciplinas, qyCarregarListaCodigosDisciplinas.RecordCount);

   while not qyCarregarListaCodigosDisciplinas.Eof do
   begin
      listaDisciplinas[qyCarregarListaCodigosDisciplinas.RecNo-1] :=
         qyCarregarListaCodigosDisciplinas.FieldByName('cd_prova_disciplina').AsInteger;

      qyCarregarListaCodigosDisciplinas.Next();
   end;
end;

constructor TInclusaoProvaAlunoBuilder.Create;
begin
   SetLength(Self.listaAlunosIncluir, 0);
end;

procedure TInclusaoProvaAlunoBuilder.Executar;
const
   SQL_INSERIR_PROVAS_ALUNOS =
      'INSERT INTO leitora_provas_alunos (' +
      '   cd_prova_aluno, cd_pessoa, cd_prova_gabarito, cd_turma, nr_anosemestre ' +
      ') VALUES ';
   SQL_INSERIR_PROVAS_ALUNOS_CARTOES =
      'INSERT INTO leitora_provas_alunos_cartoes (' +
      '   cd_prova_aluno, cd_equivalente, nr_questao_inicial, nr_questao_final, nr_parte ' +
      ') VALUES ';
   SQL_INSERIR_PROVAS_ALUNOS_DISCIPLINAS =
      'INSERT INTO leitora_provas_alunos_dis (' +
      '   cd_prova_aluno, cd_prova_disciplina ' +
      ') VALUES ';

var
   IAluno, IDisciplina, IParteProva, ultimoCodigoProvaAluno, qtdQuestoesParte : Integer;
   questaoInicial, questaoFinal : Integer;

   listaDisciplinasProva : TArrayIntegerCodigosDisciplinas;

   colaSqlAluno, colaSqlCartao, colaSqlDisciplina : String;
   sqlAlunos, sqlCartoes, sqlDisciplinas: String;

   paramsAlunos, paramsCartoes, paramsDisciplinas : array of Variant;

   procedure AddValorAluno(value: Variant);
   var
      arraySize: Integer;
   begin
      arraySize := Length(paramsAlunos);
      SetLength(paramsAlunos, arraySize + 1);
      paramsAlunos[arraySize] := value;
   end;

   procedure AddValorCartao(value: Variant);
   var
      arraySize: Integer;
   begin
      arraySize := Length(paramsCartoes);
      SetLength(paramsCartoes, arraySize + 1);
      paramsCartoes[arraySize] := value;
   end;

   procedure AddValorDisciplina(value: Variant);
   var
      arraySize: Integer;
   begin
      arraySize := Length(paramsDisciplinas);
      SetLength(paramsDisciplinas, arraySize + 1);
      paramsDisciplinas[arraySize] := value;
   end;

   procedure ExecutarStatement(sql: String; parametros: array of Variant);
   var
      Statement : IZPreparedStatement;
      I : Integer;
   begin
      Statement := DM.db.DbcConnection.PrepareStatement(sql);

      for I := 0 to Length(parametros) - 1 do
      begin
         if VarIsStr(parametros[I]) then
         begin
            Statement.SetString(I+1, parametros[I]);
         end else begin
            Statement.SetInt(I+1, parametros[I]);
         end;
      end;

      Statement.ExecuteUpdatePrepared;
   end;
var
   JSON: TlkJSONobject;
   JSONList: TlkJSONlist;
   S, Chave: AnsiString;
begin
   if Length(Self.listaAlunosIncluir) = 0 then
   begin
      raise ExceptionInclusaoProvaAlunoBuilder.Create('Nenhum aluno adicionado.');
   end;

   ultimoCodigoProvaAluno := Self.GetUltimoCodigoProvaAluno();
   Self.CarregarListaCodigosDisciplinas(listaDisciplinasProva);

   sqlAlunos := SQL_INSERIR_PROVAS_ALUNOS;
   sqlCartoes := SQL_INSERIR_PROVAS_ALUNOS_CARTOES;
   sqlDisciplinas := SQL_INSERIR_PROVAS_ALUNOS_DISCIPLINAS;

   JSONList := TlkJSONlist.Create;

   for IAluno := 0 to Length(Self.listaAlunosIncluir)-1 do
   begin
      Inc(ultimoCodigoProvaAluno);

      // cd_prova_aluno, cd_pessoa, cd_prova_gabarito, cd_turma, nr_anosemestre
      sqlAlunos := sqlAlunos + colaSqlAluno + '(?, ?, ?, ?, ?)';
      colaSqlAluno := ', ';

      AddValorAluno(ultimoCodigoProvaAluno); // cd_prova_aluno
      AddValorAluno(Self.listaAlunosIncluir[IAluno].pessoa.Codigo); // cd_pessoa
      AddValorAluno(Self.prova.GetGabarito()); // cd_prova_gabarito
      AddValorAluno(Self.listaAlunosIncluir[IAluno].cd_turma); // cd_turma
      AddValorAluno(Self.listaAlunosIncluir[IAluno].nr_anosemestre); // nr_anosemestre

      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('cd_prova_aluno', ultimoCodigoProvaAluno);
         JSON.Add('cd_pessoa', listaAlunosIncluir[IAluno].pessoa.Codigo);
         JSON.Add('cd_prova_gabarito', prova.GetGabarito);
         JSON.Add('cd_turma', listaAlunosIncluir[IAluno].cd_turma);
         JSON.Add('nr_anosemestre', listaAlunosIncluir[IAluno].nr_anosemestre);

         JSONList.Add(JSON);
      finally
         JSON := nil;
      end;

      for IParteProva := 1 to Self.prova.QuantidadePartesGabarito do
      begin
         qtdQuestoesParte := Self.prova.GetQuantidadeQuestoes(IParteProva);
         questaoInicial := 1;

         while qtdQuestoesParte > 0 do
         begin
            if qtdQuestoesParte > DM.iClocksResposQuanti then
            begin
               questaoFinal := DM.iClocksResposQuanti + questaoInicial - 1;
            end else begin
               questaoFinal := questaoInicial - 1 + qtdQuestoesParte;
            end;

            // cd_prova_aluno, cd_equivalente, nr_questao_inicial, nr_questao_final, nr_parte
            sqlCartoes := sqlCartoes + colaSqlCartao + '(?, ?, ?, ?, ?)';
            colaSqlCartao := ', ';

            AddValorCartao(ultimoCodigoProvaAluno); // cd_prova_aluno
            AddValorCartao(DM.getCodigoEquivalente()); // cd_equivalente
            AddValorCartao(questaoInicial); // nr_questao_inicial
            AddValorCartao(questaoFinal); // nr_questao_final
            AddValorCartao(IParteProva); // nr_parte

            qtdQuestoesParte := qtdQuestoesParte - (questaoFinal - questaoInicial + 1);
            questaoInicial := questaoFinal + 1;
         end;
      end;

      for IDisciplina := 0 to Length(listaDisciplinasProva) - 1 do
      begin
         // cd_prova_aluno, cd_prova_disciplina
         sqlDisciplinas := sqlDisciplinas + colaSqlDisciplina + '(?, ?)';
         colaSqlDisciplina := ', ';

         AddValorDisciplina(ultimoCodigoProvaAluno); // cd_prova_aluno
         AddValorDisciplina(listaDisciplinasProva[IDisciplina]); // cd_prova_disciplina
      end;
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('registros', JSONList);

      S := UTF8Decode(TlkJSON.GenerateText(JSON));
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('classe', ClassName);
      JSON.Add('metodo', 'Executar');

      Chave := UTF8Decode(TlkJSON.GenerateText(JSON));
   finally
      FreeAndNil(JSON);
   end;

   DM.Log(7001, Chave, S, tlInclusao);

   if (Length(paramsAlunos) > 0) then
      ExecutarStatement(sqlAlunos, paramsAlunos);
   if (Length(paramsCartoes) > 0) then
      ExecutarStatement(sqlCartoes, paramsCartoes);
   if (Length(paramsDisciplinas) > 0) then
      ExecutarStatement(sqlDisciplinas, paramsDisciplinas);
end;

function TInclusaoProvaAlunoBuilder.GetUltimoCodigoProvaAluno: Integer;
const
   SQL_GET_ULTIMO_CODIGO_PROVA_ALUNO =
      'SELECT MAX(cd_prova_aluno) AS cd_prova_aluno FROM leitora_provas_alunos';
var
   qyGetUltimoCodigoProvaAluno : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetUltimoCodigoProvaAluno);

   qyGetUltimoCodigoProvaAluno.SQL.Text := SQL_GET_ULTIMO_CODIGO_PROVA_ALUNO;
   qyGetUltimoCodigoProvaAluno.Open();

   Result := 1;
   if qyGetUltimoCodigoProvaAluno.RecordCount > 0 then
   begin
      Result := qyGetUltimoCodigoProvaAluno.FieldByName('cd_prova_aluno').AsInteger;
   end;

   FreeAndNil(qyGetUltimoCodigoProvaAluno);
end;

procedure TInclusaoProvaAlunoBuilder.SetProva(prova: TProva);
begin
   Self.prova := prova;
end;

{ TProvaAluno }

constructor TProvaAluno.Create(prova: TProva; pessoa: TPessoa);
begin
   Self.prova := prova;
   Self.pessoa := pessoa;
end;

function TProvaAluno.HasProva: Boolean;
const
   SQL_HAS_PROVA =
      ' SELECT COUNT(*) AS qtd ' +
      ' FROM leitora_provas_alunos lpa ' +
      '      INNER JOIN leitora_provas_gabaritos lpg ON (lpg.cd_prova_gabarito = lpa.cd_prova_gabarito) ' +
      ' WHERE lpg.cd_prova = :cd_prova AND lpa.cd_pessoa = :cd_pessoa ';
var
   qyHasProva : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyHasProva);

   qyHasProva.SQL.Text := SQL_HAS_PROVA;
   qyHasProva.ParamByName('cd_prova').AsInteger := Self.prova.Codigo;
   qyHasProva.ParamByName('cd_pessoa').AsInteger := Self.pessoa.Codigo;
   qyHasProva.Open();

   Result := qyHasProva.FieldByName('qtd').AsInteger > 0;

   FreeAndNil(qyHasProva);
end;

{ TAlunoProvaIncluir }

constructor TAlunoProvaIncluir.Create(pessoa: TPessoa; nr_anosmestre: Integer; cd_turma: String);
begin
   Self.pessoa := pessoa;
   Self.nr_anosemestre := nr_anosmestre;
   Self.cd_turma := cd_turma;
end;

end.
