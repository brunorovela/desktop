unit uFuncoesGerais;

interface

uses
  Db, ZConnection, Classes, Sysutils, Controls, uDM, uImportarLayouts, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Windows, uCadProvas,
  ZDbcIntfs, uLkJSON;
//  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Dialogs, Menus, DBCtrls, StdCtrls, Mask;

// Procedure para importar o gabarito do Arquivo
procedure ImportarGabarito(sNomeArquivo: String; iCodProvaLeitora : Integer; iCodProvaDiario : Integer; iSNSimulado : Integer; Sobreescrever : Boolean);

// Procedure para importar o arquivo com os resultados
procedure ImportarResultados(sNomeArquivo: String; iCodProvaLeitora : Integer; iCodProvaDiario : Integer; iSNSimulado : Integer; iAnoSem : Integer; Sobreescrever : Boolean);

//faz a inserção das questões discursivas na tabela leitora_provas_gabaritos_resp
procedure insereQuestoesDiscursivas(iCodProvaDiario, iCodProvaGabarito, iCodProvaDisciplina, iQuestao: integer);

// Retorna o código do último campo autoincrement criado
function LastInsert: Integer;

//Retorna se a variavel passa para função é ou não um inteiro
function isInteger(sVariavel: String): Boolean;

implementation

uses uTProva, uGeneral, Dialogs;

procedure ImportarGabarito(sNomeArquivo: String; iCodProvaLeitora : Integer; iCodProvaDiario : Integer; iSNSimulado : Integer; Sobreescrever : Boolean);
var
   tfArquivo: TextFile;      // Variavel com o ponteiro para o Arquivo Aberto
   sLinha: String;           // Guarda uma linha do arquivo como string
   iCodProva,
   iCodDisciplina: Integer;
   qAux : TUMZQuery;
   iQuestao: Integer;
   sSomatorio,
   sAlternativa: String;
   sCodProvaGabarito: String;
   iAux : integer;
   bNovoGabarito,
   bIsSomatoria: boolean;
   prova: TProva;
   listaGabaritos, listaPartesProva : TListInputQueryCheck;
   IParteProva, IGabaritosSelecionados: Integer;
   nomesGabaritos : String;
begin
   bIsSomatoria := false;
   IParteProva := 1;
   if FrmImportarLayouts.slItensLayout.Count <= 0 then
   begin
      Mensagem('Não é possível importar o Gabarito, layout indefinido.', 'Atenção', MB_OK + MB_ICONERROR);
      Exit;
   end;

   qAux := TUMZQuery.Create(DM);
   qAux.Connection := DM.db;

   if iCodProvaLeitora > 0 then
   begin
      // Pegar o Código da Prova na Disciplina
      qAux.Close();
      qAux.SQL.Text :=
       ' SELECT cd_prova_disciplina FROM leitora_provas_disciplinas ' +
       ' WHERE cd_prova = ' + IntToStr( iCodProvaLeitora );
      qAux.Open();

      iCodDisciplina := qAux.FieldByName('cd_prova_disciplina').AsInteger;
   end;

   // Verificar se a prova já foi importada
   qAux.Close();

   if (iCodProvaDiario > 0) then
   begin
      // Se for relacionado a uma prova do diário
      qAux.Close();
      qAux.SQL.Text :=
        ' SELECT cd_prova from leitora_provas WHERE ' +
        '   cd_chave = '  + IntToStr(iCodProvaDiario)  +
        '   AND sn_simulado = ' + IntToStr(iSNSimulado);
      qAux.Open();

      if not qAux.Eof then
      begin
         iCodProvaLeitora := qAux.FieldByName('cd_prova').AsInteger;

         if Sobreescrever then
         begin
            // Deletar o Diario Provas somente quando for relacionado com uma prova do diário
            qAux.Close();
            qAux.SQL.Text :=
              ' DELETE FROM leitora_provas  WHERE cd_prova = ' + IntToStr(iCodProvaLeitora) +
              '   AND sn_simulado = ' + IntToStr(iSNSimulado);
            qAux.ExecSQL();
         end;
      end;
   end;

   // Se a prova na leitora já existe

   if (iCodProvaLeitora > 0) AND (Sobreescrever) then
   begin
      qAux.Close();
      qAux.SQL.Text :=
        'SELECT cd_prova_gabarito FROM leitora_provas_gabaritos  WHERE cd_prova = ' + IntToStr(iCodProvaLeitora);
      qAux.Open;

      while not qAux.Eof do
      begin
         frmCadProvas.ExcluirProvaGabarito( qAux.FieldByName('cd_prova_gabarito').AsInteger );
         qAux.Next;
      end;
   end;

   // INSERIR A PROVA
   if (iCodProvaDiario > 0) AND ((iCodProvaLeitora = 0) OR (Sobreescrever)) then
   begin
      qAux.Close();
      qAux.SQL.Text :=
        ' INSERT INTO leitora_provas (                                                 '+
        '    nr_prova, ds_prova, nr_correcoes, nr_anosemestre, cd_chave, sn_simulado   '+
        ' )                                                                            ';

      if iSNSimulado = 0 then
      begin
         // Quando não for Simulado deve selecionar a prova em diario_provas
         qAux.Close();
         qAux.SQL.Add(
           ' SELECT nro_nota, assunto, 1, anosemestre, cd_prova, 0 ' +
           ' FROM diario_provas WHERE cd_prova = ' + IntToStr(iCodProvaDiario)
         );
      end else begin
         // Quando for Simulado deve selecionar a prova em diario_provas_simulado
         qAux.Close();
         qAux.SQL.Add(
           ' SELECT nro_nota, assunto, 1, anosemestre, cd_prova, 1 ' +
           ' FROM diario_provas_simulado WHERE cd_prova = ' + IntToStr(iCodProvaDiario)
         );
      end;

      qAux.ExecSQL();

      // Selecionar o Código da Prova na Leitora - Ultimo Código - AutoIncrement
      iCodProvaLeitora :=  LastInsert();

      // Alterar o cd_prova_leitora na tabela diario_provas
      qAux.Close();
      if iSNSimulado = 1 then
      begin
         qAux.SQL.Text := 'UPDATE diario_provas_simulado SET cd_prova_leitora = ' + IntToStr(iCodProvaLeitora) +
            ' WHERE cd_prova = ' + IntToStr(iCodProvaDiario);
         qAux.ExecSQL();
      end else begin
         qAux.SQL.Text := 'UPDATE diario_provas SET cd_prova_leitora = ' + IntToStr(iCodProvaLeitora) +
            ' WHERE cd_prova = ' + IntToStr(iCodProvaDiario);
         qAux.ExecSQL();
      end;

      // Se for uma prova do diário, incluir as disciplinas automaticamente
      qAux.Close();
      qAux.SQL.Text :=
        ' INSERT INTO leitora_provas_disciplinas (                          ' +
        '    cd_prova, cd_curso, cd_disciplina                              ' + 
        ' )                                                                 ';

      if iSNSimulado = 0 then
      begin
         qAux.Close();
         qAux.SQL.Add(
           ' SELECT ' + IntToStr(iCodProvaLeitora) + ', dt.curso, dt.disciplina  ' +
           ' FROM diario_provas dp INNER JOIN diario_turmas dt                   ' +
           '   ON (dp.anosemestre = dt.anosemestre AND dp.bimestre = dt.bimestre ' +
           '   AND dp.turma = dt.turma AND dp.disciplina = dt.disciplina )       ' +
           ' WHERE cd_prova = ' + IntToStr(iCodProvaDiario)
         );
      end else begin
         qAux.Close();
         qAux.SQL.Add(
           ' SELECT ' + IntToStr(iCodProvaLeitora) + ', dt.curso, dt.disciplina  ' +
           ' FROM diario_provas_simulado dp INNER JOIN diario_turmas dt                   ' +
           '   ON (dp.anosemestre = dt.anosemestre AND dp.bimestre = dt.bimestre ' +
           '   AND dp.turma = dt.turma AND dp.disciplina = dt.disciplina )       ' +
           ' WHERE cd_prova = ' + IntToStr(iCodProvaDiario)
         );
      end;

      qAux.ExecSQL();
      iCodDisciplina := LastInsert();
   end;


   // INICIAR A LEITURA DO ARQUIVO DE GABARITO
   AssignFile ( tfArquivo, sNomeArquivo );
   Reset ( tfArquivo );

   // Ler a primeira linha do arquivo
   ReadLn ( tfArquivo, sLinha );
   iAux := 0;

   prova := TProva.Create(iCodProvaLeitora); 

   {*
    *
    * LER O NOME DO GABARITO E TENTA ACHA-LO NA BASE DE DADOS, CASO CONTRÁRIO, CRIA UM NOVO 
    *
    *}
   if StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Nome-Gabarito']) = 0 then
   begin
      sCodProvaGabarito := 'Gabarito A';
   end else begin
      sCodProvaGabarito :=  'Gabarito ' + Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Nome-Gabarito']), StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Nome-Gabarito']));
   end;

   if (prova.QuantidadePartesGabarito = 1) OR
      (prova.GetListaGabaritosInputQuery().Count = 0) OR
      (TGeneral.Mensagem('Deseja criar um novo gabarito ou extender a leitura atual em outro gabarito existente?',
         mtInformation, mbOKCancel, ['Criar novo Gabarito', 'Extender gabarito existente (Selecionar parte)'],120,mbOK) = mrOk) then
   begin
      listaGabaritos := TListInputQueryCheck.Create();

      // Verificar se já existe um gabarito com o mesmo nome para esta prova
      qAux.Close();
      qAux.SQL.Text := 'SELECT cd_prova_gabarito FROM leitora_provas_gabaritos WHERE cd_prova = ' + IntToStr(iCodProvaLeitora) + ' AND ds_nome_gabarito = "' + sCodProvaGabarito + '" ';
      qAux.Open();

      // O gabarito já existe, ler a próxima linha do arquivo e voltar ao loop;
      if not qAux.Eof then
      begin
         listaGabaritos.Add(TInputQueryCheck.Create(
            qAux.FieldByName('cd_prova_gabarito').AsInteger,
            sCodProvaGabarito
         ));
         bNovoGabarito := false;
   //         ReadLn ( tfArquivo, sLinha );
   //         Continue;
      end else begin
         qAux.Close();
         qAux.SQL.Text :=
           'INSERT INTO leitora_provas_gabaritos (cd_prova, ds_nome_gabarito)  ' +
           'VALUES (' + IntToStr(iCodProvaLeitora) + ', "' + sCodProvaGabarito + '" )';
         qAux.ExecSQL();

         listaGabaritos.Add(TInputQueryCheck.Create(
            LastInsert(),
            sCodProvaGabarito
         ));

         bNovoGabarito := true;
      end;

      listaGabaritos.SelecionarTodos();
   end else begin
      listaGabaritos := prova.GetListaGabaritosInputQuery();

      while ( listaGabaritos.Quantidade[True] = 0 ) AND
            ( TGeneral.InputQueryListCheck('Gabaritos da Prova', 'Selecione quais gabaritos existentes o novo gabarito ' + sCodProvaGabarito + ' irá extender:', listaGabaritos) ) do
      begin
         if ( listaGabaritos.Quantidade[True] = 0 ) then
         begin
            Mensagem( 'É necessário selecionar pelo menos um gabarito.', '', MB_OK + MB_ICONEXCLAMATION );
         end else begin
            bNovoGabarito := False;
         end;
      end;

      if listaGabaritos.Quantidade[True] = 0 then
      begin
         Abort;
      end;

      nomesGabaritos := '';
      for IGabaritosSelecionados := 0 to listaGabaritos.GetObjetosSelecionados().Count - 1 do
      begin
         if nomesGabaritos <> '' then
         begin
            nomesGabaritos := nomesGabaritos + ', ';
         end;

         nomesGabaritos := nomesGabaritos + StringReplace(
            TInputQueryCheck(listaGabaritos.GetObjetosSelecionados().Items[IGabaritosSelecionados]).Descricao,
            'Gabarito ', '', [rfIgnoreCase]);
      end;

      listaPartesProva := prova.GetPartesInputQuery();

      while ( listaPartesProva.Quantidade[True] = 0 ) AND
            ( TGeneral.InputQueryListCheck('Partes do Gabarito',
                  'Selecione em qual parte do(s) gabarito(s) ' + nomesGabaritos +
                  ' você deseja vincular o novo ' + sCodProvaGabarito + '.', listaPartesProva, True) ) do
      begin
         if ( listaPartesProva.Quantidade[True] = 0 ) then
         begin
            Mensagem( 'É necessário selecionar uma parte.', '', MB_OK + MB_ICONEXCLAMATION );
         end
         else if ( listaPartesProva.Quantidade[True] = 1 ) then
         begin
            IParteProva := TInputQueryCheck(listaPartesProva.GetObjetosSelecionados().Items[0]).Codigo;
         end;
      end;

      if listaPartesProva.Quantidade[True] = 0 then
      begin
         Abort;
      end;
   end;

   while (iAux = 0) do
   begin
      // Ao final do arquivo deve ser processada a última linha e depois sair
      if Eof(tfArquivo) then
      begin
         iAux := 1;         
      end;

      // Percorrer o arquivo e importar as respostas...
      qAux.Close();
      qAux.SQL.Text :=
       ' REPLACE INTO leitora_provas_gabaritos_resp ( ' +
       '   cd_prova_gabarito, nr_alternativas, nr_questao, ds_resposta, cd_prova_disciplina, vl_peso, nr_parte) ' +
       ' VALUES (:cd_prova_gabarito, :nr_alternativas, :nr_questao, :ds_resposta, :cd_prova_disciplina, :vl_peso, :nr_parte) ';
      qAux.ParamByName('cd_prova_disciplina').AsInteger := iCodDisciplina;
      qAux.ParamByName('nr_parte').AsInteger := IParteProva;

      // Manter na linha somente as respostas
      sLinha := Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Inicio-Questao']));
      iQuestao := 0;

      while Trim(sLinha) <> '' do
      begin
         INC(iQuestao);

         // Ler uma questão como se fosse somatória
         sSomatorio := Trim(Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Questao-Somatorio']), StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao-Somatorio'])));
         bIsSomatoria := true;
         if(not isInteger(sSomatorio))then
         begin
            sSomatorio := '';
            bIsSomatoria := false;
         end;

         // Ler uma questão como se fosse multipla escolha - UMA LETRA
         sAlternativa := Trim(Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Questao-Alternativa']), 1));
         qAux.ParamByName('nr_questao').AsInteger := iQuestao;
         qAux.ParamByName('nr_alternativas').AsInteger := 5;

         if sSomatorio <> '' then
         begin
            // Se for Somatório
            qAux.ParamByName('ds_resposta').AsString := sSomatorio;
            qAux.ParamByName('vl_peso').AsString := Trim(FrmImportarLayouts.slItensLayout.Values['Peso-Questao-Somatorias']);
         end
         else if sAlternativa <> '' then
         begin
            // Se for Alternativa
            qAux.ParamByName('ds_resposta').AsString := sAlternativa;
            qAux.ParamByName('vl_peso').AsString := Trim(FrmImportarLayouts.slItensLayout.Values['Peso-Questao-Alternativa']);
         end else begin
            // Nada foi selecionado
            qAux.ParamByName('ds_resposta').AsString := '';
            qAux.ParamByName('vl_peso').AsInteger := 0;
         end;

         for IGabaritosSelecionados := 0 to listaGabaritos.GetObjetosSelecionados().Count - 1 do
         begin
            qAux.ParamByName('cd_prova_gabarito').AsInteger :=
               TInputQueryCheck(listaGabaritos.GetObjetosSelecionados().Items[IGabaritosSelecionados]).Codigo;

            qAux.ExecSQL();
         end;

         // Copiar as demais questões
         if not( bIsSomatoria ) OR
            (Trim(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao-Considera-Somatoria']) = '0') then
         begin
            sLinha := Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao']) +
                                   StrToInt(FrmImportarLayouts.slItensLayout.Values['Espaco-Entre-Questao']) +1);
         end else begin
            sLinha := Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao']) +
                                   StrToInt(FrmImportarLayouts.slItensLayout.Values['Espaco-Entre-Questao']) +
                                   StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao-Somatorio']));
         end;  
      end;

      if bNovoGabarito then
      begin
         //terminou a leitura das questões objetivas
         //inciar inserção das questões discursivas
         for IGabaritosSelecionados := 0 to listaGabaritos.GetObjetosSelecionados().Count - 1 do
         begin
            insereQuestoesDiscursivas( iCodProvaDiario,
               TInputQueryCheck(listaGabaritos.GetObjetosSelecionados().Items[IGabaritosSelecionados]).Codigo,
               iCodDisciplina, iQuestao);
         end;
      end;

      // Ler a próxima linha de gabarito
      ReadLn ( tfArquivo, sLinha );
   end;

   CloseFile ( tfArquivo );
   // Fim da Importação do Gabarito
end;


procedure insereQuestoesDiscursivas(iCodProvaDiario, iCodProvaGabarito, iCodProvaDisciplina, iQuestao: integer);
var
   iNrDiscursivas, iSnDgtDicursivaProf: integer;
   rPesoQuestao: Real;
   qyInsereQuestoes, qyAtuDiarioProva: TUMZQuery;
begin
   //layout não configurado para suportar inserção de questões discursivas
   if FrmImportarLayouts.slItensLayout.Values['Qtd-Questoes-Discursiva'] = '' then
      Exit;
   //número de questões discursivas da prova
   iNrDiscursivas := StrToInt(FrmImportarLayouts.slItensLayout.Values['Qtd-Questoes-Discursiva']);
   //não há questões disrcursivas
   if iNrDiscursivas = 0 then Exit;

   //peso das questões discursivas
   rPesoQuestao := StrToFloat(FrmImportarLayouts.slItensLayout.Values['Peso-Questao-Discursiva']);
   //flag para informar se o professor digita ou não a discursiva
   iSnDgtDicursivaProf := StrToInt(FrmImportarLayouts.slItensLayout.Values['Digita-Discursiva-Professor']);

   //inicializa a query
   qyInsereQuestoes := TUMZQuery.Create(DM);
   qyInsereQuestoes.Connection := DM.db;
   qyInsereQuestoes.Close;
   qyInsereQuestoes.SQL.Text := 'REPLACE INTO leitora_provas_gabaritos_resp '+
   '(cd_prova_gabarito, nr_alternativas, nr_questao, ds_resposta, cd_prova_disciplina, vl_peso, sn_discursiva) '+
   'VALUES(:cd_prova_gabarito, 0, :nr_questao, :ds_resposta, :cd_prova_disciplina, :vl_peso, :sn_discursiva)';

   //insere iNrDiscursivas questões discursivas
   while iNrDiscursivas > 0 do begin
      Inc(iQuestao);
      qyInsereQuestoes.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
      qyInsereQuestoes.ParamByName('nr_questao').AsInteger := iQuestao;
      qyInsereQuestoes.ParamByName('ds_resposta').AsString := '';
      qyInsereQuestoes.ParamByName('cd_prova_disciplina').AsInteger := iCodProvaDisciplina;
      qyInsereQuestoes.ParamByName('vl_peso').AsFloat := rPesoQuestao;
      qyInsereQuestoes.ParamByName('sn_discursiva').AsInteger := 1;
      qyInsereQuestoes.ExecSQL;
      Dec(iNrDiscursivas);
   end;
   //liberando memória :-)
   qyInsereQuestoes.Close;
   qyInsereQuestoes.Free;

   qyAtuDiarioProva := TUMZQuery.Create(DM);
   qyAtuDiarioProva.Connection := DM.db;
   qyAtuDiarioProva.Close;
   qyAtuDiarioProva.SQL.Text :=
   'UPDATE DIARIO_PROVAS SET SN_DISCURSIVA_LEITORA = :sn_discursiva_professor WHERE CD_PROVA = :CD_PROVA';
   qyAtuDiarioProva.ParamByName('sn_discursiva_professor').AsInteger := iSnDgtDicursivaProf;
   qyAtuDiarioProva.ParamByName('cd_prova').AsInteger := iCodProvaDiario;
   qyAtuDiarioProva.ExecSQL;

   //liberando memória -)
   qyAtuDiarioProva.Close;
   qyAtuDiarioProva.Free;
end;

function LastInsert: Integer;
var
   iRet: Integer;
begin
   iRet := -1;
   with DM.qyLastInsert do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('SELECT LAST_INSERT_ID() as conta');
      try
         Open();
         if not IsEmpty then begin
            iRet := FieldByName('conta').AsInteger;
         end;
      except
         iRet := -1;
      end;
      Close();
   end;
   Result := iRet;
end;


procedure ImportarResultados(sNomeArquivo: String; iCodProvaLeitora : Integer; iCodProvaDiario : Integer; iSNSimulado : Integer; iAnoSem : Integer; Sobreescrever : Boolean);
const
   SQL_UPDATE_PONTUACAO =
      '  UPDATE '+
      '      leitora_provas AS l '+
      '  INNER JOIN leitora_provas_gabaritos AS gb ON (l.cd_prova = gb.cd_prova) '+
      '  INNER JOIN leitora_provas_gabaritos_resp lpgr ON ( '+
      '     lpgr.cd_prova_gabarito = gb.cd_prova_gabarito '+
      '  ) '+
      '  INNER JOIN leitora_provas_alunos AS la ON ( '+
      '     lpgr.cd_prova_gabarito = la.cd_prova_gabarito '+
      '  ) '+
      '  INNER JOIN leitora_provas_alunos_resp AS lr ON ( '+
      '     la.cd_prova_aluno = lr.cd_prova_aluno '+
      '     AND lr.nr_correcao = 1 '+
      '  ) '+
      '  SET '+
      '     lr.db_pontuacao = lr.ds_resposta %s '+
      '  WHERE '+
      '     lpgr.sn_discursiva = 1 '+
      '     AND l.cd_prova = :cd_prova ';
var
   tfArquivo: TextFile;    // Ponteiro para leitura do arquivo de importação

   qAux,
   qyAtualizaPontuacao: TUMZQuery;

   iCodProvaAluno,
   iCodProvaDisciplina,
   iCodIdentificacao,
   iAnoSemestre,
   iDiarioNumeroNota,
   iDiarioBimestre,
   iDiarioDisciplina,
   iQuestao,
   iCodProvaGabarito: Integer;

   sDivisaoPontuacao,
   sCodProvaGabarito,
   sLinha,              // Uma linha do arquivo de pontuação
   sSomatorio,
   sAlternativa,
   sTurmaPrincipal,
   sCodTurma: String;

   bIsSomatoria: Boolean;

   iAux: Word;
   JSON: TlkJSONobject;
   S, Chave: AnsiString;
begin
   bIsSomatoria := false;
   iAnoSemestre := iAnoSem;

   qAux := TUMZQuery.Create(DM);
   qyAtualizaPontuacao := TUMZQuery.Create(DM);

   qAux.Connection := DM.db;
   qyAtualizaPontuacao.Connection := DM.db;

   if iCodProvaDiario > 0 then
   begin
      // Se for uma prova do diário, buscar o anosemestre e a turma
      qAux.Close();

      if iSNSimulado = 1 then
      begin
         qAux.SQL.Text :=
            ' SELECT turma, anosemestre, nro_nota, bimestre, disciplina FROM diario_provas_simulado WHERE cd_prova = ' + IntToStr(iCodProvaDiario);
      end
      else
      begin
         qAux.SQL.Text :=
            ' SELECT turma, anosemestre, nro_nota, bimestre, disciplina FROM diario_provas WHERE cd_prova = ' + IntToStr(iCodProvaDiario);
      end;

      qAux.Open();

      if not qAux.Eof then
      begin
         sTurmaPrincipal := qAux.FieldByName('turma').AsString;
         iAnoSemestre := qAux.FieldByName('anosemestre').AsInteger;
         iDiarioNumeroNota := qAux.FieldByName('nro_nota').AsInteger;
         iDiarioBimestre := qAux.FieldByName('bimestre').AsInteger;
         iDiarioDisciplina := qAux.FieldByName('disciplina').AsInteger;
      end;
   end;

   AssignFile(tfArquivo, sNomeArquivo);
   Reset(tfArquivo);

   ReadLn(tfArquivo, sLinha);

   iAux := 0;

   // While para a Leitura do Arquivo
   while iAux = 0 do
   begin

      if Eof(tfArquivo) then
      begin
         iAux := 1;
      end;

      try
         iCodIdentificacao := StrToInt(Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Cod-Identificacao']), StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Cod-Identificacao'])));
      except
         ReadLn ( tfArquivo, sLinha );
         Continue;
      end;

      if StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Nome-Gabarito']) = 0 then
      begin
         sCodProvaGabarito := 'Gabarito A';
      end
      else
      begin
         sCodProvaGabarito :=  'Gabarito ' + Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Nome-Gabarito']), StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Nome-Gabarito']));
      end;

      // Pegar o Código do Gabarito
      
      qAux.Close();
      qAux.SQL.Text :=
        ' SELECT cd_prova_gabarito FROM leitora_provas_gabaritos ' +
        ' WHERE cd_prova = ' + IntToStr(iCodProvaLeitora) + ' AND ds_nome_gabarito = "' + sCodProvaGabarito + '" ';
      qAux.Open();

      if qAux.Eof then
      begin
         ReadLn ( tfArquivo, sLinha );
         Continue;
      end;

      iCodProvaGabarito := qAux.FieldByName('cd_prova_gabarito').AsInteger;

      // Verificar se está importando uma matrícula, se for, relacionar com as turmas

      if FrmImportarLayouts.slItensLayout.Values['Origem-Identificacao'] = 'MATRICULA' then
      begin
         // Retorna a turma do aluno se for diferente da turma que está sendo importada
         qAux.Close();
         
         if sTurmaPrincipal <> '' then
         begin
            qAux.SQL.Text :=
              ' SELECT m.turma FROM matriculas m   ' +
              ' INNER JOIN turmas t ON (t.anosemestre = m.anosemestre AND t.codigo = m.turma)  ' +
              ' INNER JOIN turmas t2 ON (t2.anosemestre = m.anosemestre AND t2.curso = t.curso AND t2.serie = t.serie AND t2.codigo <> t.codigo) ' +
              ' WHERE m.anosemestre = :nr_anosemestre AND t2.codigo = :cd_turma AND m.codigoaluno = :cd_pessoa AND m.situacao not IN (3,4,5,6,7,8) ';
            qAux.ParamByName('cd_pessoa').AsInteger := iCodIdentificacao;
            qAux.ParamByName('cd_turma').AsString := sTurmaPrincipal;
            qAux.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
            qAux.Open();

         end
         else
         begin
            qAux.SQL.Text :=
               ' SELECT m.turma FROM matriculas m ' +
               ' WHERE m.anosemestre = :nr_anosemestre AND m.codigoaluno = :cd_pessoa AND m.situacao not IN (3,4,5,6,7,8) ';
            qAux.ParamByName('cd_pessoa').AsInteger := iCodIdentificacao;
            qAux.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
            qAux.Open();
         end;

         if not qAux.IsEmpty AND (qAux.FieldByName('turma').AsString <> '') then
         begin
            sCodTurma := qAux.FieldByName('turma').AsString;
         end
         else
         begin
            sCodTurma := sTurmaPrincipal;
         end;

         // Relacionar o Gabarito com a Prova do Diário das Turmas B...
         // Buscando a turma do aluno // Relacionar a tabela Diario Provas com essa turma;

         if iCodProvaDiario > 0 then begin

            qAux.Close();
            if iSNSimulado = 1 then begin

               qAux.SQL.Text := 'UPDATE diario_provas_simulado SET cd_prova_leitora = ' + IntToStr(iCodProvaLeitora) +
                ' WHERE turma = "' + sCodTurma + '" AND anosemestre = ' + IntToStr(iAnoSemestre) +
                ' AND nro_nota = ' + IntToStr(iDiarioNumeroNota) +
                ' AND bimestre = ' + IntToStr(iDiarioBimestre) +
                ' AND disciplina = ' + IntToStr(iDiarioDisciplina);
               qAux.ExecSQL();

            end else begin

               qAux.SQL.Text := 'UPDATE diario_provas SET cd_prova_leitora = ' + IntToStr(iCodProvaLeitora) +
                ' WHERE turma = "' + sCodTurma + '" AND anosemestre = ' + IntToStr(iAnoSemestre) +
                ' AND nro_nota = ' + IntToStr(iDiarioNumeroNota) +
                ' AND bimestre = ' + IntToStr(iDiarioBimestre) +
                ' AND disciplina = ' + IntToStr(iDiarioDisciplina);
               qAux.ExecSQL();

            end;

         end;

      end
      else
      if FrmImportarLayouts.slItensLayout.Values['Origem-Identificacao'] = 'CONCURSO' then
      begin

         // Buscar o código do aluno, baseando-se pelo código da Inscrição
         qAux.Close();
         qAux.SQL.Text :=
           ' SELECT cd_pessoa FROM con_inscricoes WHERE cd_inscricao = ' + IntToStr(iCodIdentificacao);
         qAux.Open();

         // Se não achar a inscrição
         if qAux.IsEmpty then begin

            ReadLn ( tfArquivo, sLinha );
            Continue;

         end;

         // A partir de agora o código de identificacao passa a ser o código do aluno
         iCodIdentificacao := qAux.FieldByName('cd_pessoa').AsInteger;
         sTurmaPrincipal := 'CONCURSO';
         sCodTurma := 'CONCURSO';
      
      end;

      qAux.Close();
      qAux.SQL.Text :=
        ' SELECT cd_prova_aluno FROM leitora_provas_alunos ' +
        ' WHERE cd_prova_gabarito = :cd_prova_gabarito AND cd_pessoa = :cd_pessoa LIMIT 1 ';
      qAux.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
      qAux.ParamByName('cd_pessoa').AsInteger := iCodIdentificacao;
      qAux.Open();

      if qAux.Eof then begin

         // Ligar o aluno com a Prova correta...  (Gabarito correto)

         qAux.Close();
         qAux.SQL.Text :=
           ' INSERT INTO leitora_provas_alunos (cd_pessoa, cd_prova_gabarito, cd_turma, nr_anosemestre) ' +
           ' VALUES (:cd_pessoa, :cd_prova_gabarito, :cd_turma, :nr_anosemestre) ';
         qAux.ParamByName('cd_pessoa').AsInteger := iCodIdentificacao;
         qAux.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
         qAux.ParamByName('cd_turma').AsString := sCodTurma;
         qAux.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
         qAux.ExecSQL();

         JSON := TlkJSONobject.Create(False);
         try
            JSON.Add('cd_pessoa', iCodIdentificacao);
            JSON.Add('cd_prova_gabarito', iCodProvaGabarito);
            JSON.Add('cd_turma', sCodTurma);
            JSON.Add('nr_anosemestre', iAnoSemestre);

            S := UTF8Decode(TlkJSON.GenerateText(JSON));
         finally
            FreeAndNil(JSON);
         end;

         JSON := TlkJSONobject.Create(False);
         try
            JSON.Add('unidade', 'uFuncoesGerais');
            JSON.Add('funcao', 'ImportarResultados');

            Chave := UTF8Decode(TlkJSON.GenerateText(JSON));
         finally
            FreeAndNil(JSON);
         end;

         DM.Log(7001, Chave, S, tlInclusao);

      end;

      // Verificar se o aluno foi inserido corretamente 

      qAux.Close();
      qAux.SQL.Text :=
        ' SELECT cd_prova_aluno FROM leitora_provas_alunos ' +
        ' WHERE cd_prova_gabarito = :cd_prova_gabarito AND cd_pessoa = :cd_pessoa LIMIT 1 ';
      qAux.ParamByName('cd_prova_gabarito').AsInteger := iCodProvaGabarito;
      qAux.ParamByName('cd_pessoa').AsInteger := iCodIdentificacao;
      qAux.Open();

      // Se não gravou o aluno, passar para a próxima linha do gabarito
      if qAux.Eof then begin
         ReadLn ( tfArquivo, sLinha );
         Continue;
      end;

      iCodProvaAluno := qAux.FieldByName('cd_prova_aluno').AsInteger;

      // Gravar na disciplina
      qAux.Close();
      qAux.SQL.Text :=
      ' REPLACE INTO leitora_provas_alunos_dis (cd_prova_aluno, cd_prova_disciplina) ' +
      ' SELECT :cd_prova_aluno, cd_prova_disciplina FROM leitora_provas_disciplinas                       ' +
      ' WHERE cd_prova = :cd_prova ';
      qAux.ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
      qAux.ParamByName('cd_prova').AsInteger := iCodProvaLeitora;
      qAux.ExecSQL();

      // NÃO VOU APAGAR AS RESPOSTAS ATUAIS, pois está perdendo os dados digitados manualmente

      if Sobreescrever then
      begin
         qAux.Close();
         qAux.SQL.Text :=
            'DELETE FROM leitora_provas_alunos_resp WHERE cd_prova_aluno = :cd_prova_aluno';
         qAux.ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
         qAux.ExecSQL();
      end;


      // Montar e gravar as respostas de cada aluno
      qAux.Close();
      qAux.SQL.Text := 'REPLACE INTO leitora_provas_alunos_resp (cd_prova_aluno, nr_questao, ds_resposta) VALUES(:cd_prova_aluno, :nr_questao, :ds_resposta)';
      qAux.ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;

      sLinha := Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Inicio-Questao']));

      iQuestao := 0;

      // Percorre a linha do gabarito a procura das respostas

      while Trim(sLinha) <> '' do
      begin
         iQuestao := iQuestao + 1;

         // Ler uma questão como se fosse somatória
         sSomatorio := Trim(Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Questao-Somatorio']), StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao-Somatorio'])));
         bIsSomatoria := true;
         
         if(not isInteger(sSomatorio))then
         begin
            sSomatorio := '';
            bIsSomatoria := false;
         end;

         // Ler uma questão como se fosse multipla escolha - UMA LETRA
         sAlternativa := Trim(Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Posicao-Questao-Alternativa']), 1));

         qAux.ParamByName('nr_questao').AsInteger := iQuestao;

         if sSomatorio <> '' then
         begin
            qAux.ParamByName('ds_resposta').AsString := sSomatorio;
         end
         else
         if sAlternativa <> '' then
         begin
            qAux.ParamByName('ds_resposta').AsString := sAlternativa;
         end
         else
         begin
            if Sobreescrever then
            begin
               qAux.ParamByName('ds_resposta').AsString := '';
            end
            else
            begin
               sLinha := Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao']) + StrToInt(FrmImportarLayouts.slItensLayout.Values['Espaco-Entre-Questao']) +1);
               continue;
            end;
         end;

         // Gravar o resultado de 1 questão
         qAux.ExecSQL();

         // Copiar as demais questões
         if not( bIsSomatoria ) OR
            (Trim(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao-Considera-Somatoria']) = '0') then
         begin
            sLinha := Copy(sLinha,
               StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao']) +
               StrToInt(FrmImportarLayouts.slItensLayout.Values['Espaco-Entre-Questao']) +1);
         end
         else
         begin
            sLinha := Copy(sLinha, StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao']) +
               StrToInt(FrmImportarLayouts.slItensLayout.Values['Espaco-Entre-Questao']) +
               StrToInt(FrmImportarLayouts.slItensLayout.Values['Tamanho-Questao-Somatorio']));
         end;
      end;

      ReadLn ( tfArquivo, sLinha );
   end;

   CloseFile( tfArquivo );

   if iCodProvaLeitora > 0 then
   begin
      sDivisaoPontuacao := FrmImportarLayouts.slItensLayout.Values['Divisao-Calculo-Discursivas'];

      qyAtualizaPontuacao.Close;

      if sDivisaoPontuacao <> '' then
      begin
         qyAtualizaPontuacao.SQL.Text := Format(SQL_UPDATE_PONTUACAO, [' / ' + sDivisaoPontuacao]);
      end;

      if sDivisaoPontuacao = '' then
      begin
         qyAtualizaPontuacao.SQL.Text := Format(SQL_UPDATE_PONTUACAO, ['']);
      end;

      qyAtualizaPontuacao.ParamByName('cd_prova').AsInteger := iCodProvaLeitora;
      qyAtualizaPontuacao.ExecSQL;
   end;

   if iCodProvaDiario > 0 then
   begin
      qAux.Close();

      if iSNSimulado = 1 then
      begin
         qAux.SQL.Text := 'UPDATE diario_provas_simulado SET sn_bloqueado = 1 WHERE cd_prova = :cd_prova';
      end
      else
      begin
         qAux.SQL.Text := 'UPDATE diario_provas SET sn_bloqueado = 1 WHERE cd_prova = :cd_prova';
      end;

      qAux.ParamByName('cd_prova').AsInteger := iCodProvaDiario;
      qAux.ExecSQL();
   end;
end;

function isInteger(sVariavel: String): Boolean;
var
   I: Integer;
begin
   Result := TryStrToInt(sVariavel, I);
end;



end.
