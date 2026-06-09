const
   CR = #13;
   S_MASC_GERACAO = '%s (%s)';
   S_TITULO_INFO = 'Informação';
   S_TITULO_QUEST = 'Muita atenção!';
   S_FINALIZADO_QUESTOES = 'A seleção das questões foi finalizada.';
   S_SP_QUESTOES_SCREDITO = 'CALL SPX_PINT_SEL_QUESTOES_SCREDITO(%u, %d, %d)';
   S_SP_QUESTOES_CCREDITO = 'CALL SPX_PINT_SEL_QUESTOES_CCREDITO(%u, %d, %d)';

   S_QUEST_1 = 'A execução deste processo resulta na invalidação das questões selecionadas para a prova de primeira chamada.' + CR + CR + 'Deseja prosseguir?';
   S_QUEST_2 = 'Tem certeza que deseja efetuar a re-seleção das questões para a prova de primeira chamada?' + CR + 'Esta ação não poderá ser revertida.' + CR + CR + 'Deseja prosseguir?';
   S_QUEST_3 = 'Este processo efetuará a seleção das questões que serão utilizadas na prova de primeira chamada.' + CR + CR + 'Deseja prosseguir?';

   S_QUEST_1_segunda = 'A execução deste processo resulta na invalidação das questões selecionadas para a prova de segunda chamada.' + CR + CR + 'Deseja prosseguir?';
   S_QUEST_2_segunda = 'Tem certeza que deseja efetuar a re-seleção das questões para a prova de segunda chamada?' + CR + 'Esta ação não poderá ser revertida.' + CR + CR + 'Deseja prosseguir?';
   S_QUEST_3_segunda = 'Este processo efetuará a seleção das questões que serão utilizadas na prova de segunda chamada.' + CR + CR + 'Deseja prosseguir?';

   MSG_ICONS_QUEST = MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2;
   MSG_ICONS_INFO = MB_ICONINFORMATION + MB_OK;
   S_MASC_TURMADISC = '%s/%s';
   S_QUEST_LIBERAR = 'Foram detectadas pendências no cadastro de questões para as seguintes turmas/disciplinas:' + CR + CR + '%s' + CR + 'Deseja criar as provas mesmo assim?';
   S_SELECIONANDO_QUESTOES = 'Selecionando questões. Aguarde...';
   S_SP_PROVAS_TODOS = 'CALL SPX_PINT_RECRIA_PROVAS(%u, %d)';
   S_SP_PROVAS_SALA = 'CALL SPX_PINT_RECRIA_PROVAS_SALA(%u, %s, %d )';
   S_SP_PROVAS_ALUNO = 'CALL SPX_PINT_RECRIA_PROVA_ALUNO(%s, %u, %d )';
   S_QUEST_RECRIAR = 'Tem certeza que deseja recriar as provas?' + CR + 'Quaisquer informações de resolução da prova entre os alunos filtrados serão perdidas.' + CR + CR + 'Tem certeza que deseja continuar?';
   S_FINALIZADO_PROVAS = 'A recriação das provas foi finalizado!';
   S_RECRIANDO_PROVAS = 'Recriando provas. Aguarde...';
   S_OUTRAS_DISC = '...e outras.';
