const
   BooleanToString: array[Boolean] of AnsiString = ('false', 'true');

	SDateTimeToISOFmt = 'yyyy-mm-dd hh:nn:ss';

   SEventInitializingDevFmt = '[%d] Initializing new device %s:%d';
   SEventDevInitializedFmt = '[%d] Device initialized successfully %s:%d';
   SEventDevNotInitializedFmt = '[%d] Could not initialize device %s:%d';
   SEventKernelErrorFmt = '[%s:%d] An error was raised by kernel: [%d] %s';
   SEventThreadErrorFmt = '[%s:%d] An error was raised by thread: [%d] %s';

   SEventRequestFmt = ''
      + '{'#13
      + '#9"source": "%s:%d",'#13
      + '#9"request": {'#13
      + '#9#9"matricula": "%s",'#13
      + '#9#9"data_hora": "%s",'#13
      + '#9#9"funcao": %d,'#13
      + '#9#9"flag": %d,'#13
      + '#9#9"numero_relogio": %d,'#13
      + '#9#9"tipo": {'#13
      + '#9#9#9"saida": %s,'#13
      + '#9#9#9"master_liberou": %s,'#13
      + '#9#9#9"fonte_entrada": %d,'#13
      + '#9#9#9"funcao_liberou": %s,'#13
      + '#9#9#9"acesso_negado": %s,'#13
      + '#9#9#9"tipo_negado": %d'#13
      + '#9#9},'#13
      + '#9#9"id_controlador": %d,'#13
      + '#9#9"id_sensor": %d'#13
      + '#9}'#13
      + '}';

   SEventResponseFmt = ''
      + '{'#13
      + '#9"source": "%s:%d",'#13
      + '#9"response": {'#13
      + '#9#9"acesso": %d,'#13
      + '#9#9"mensagem": "%s",'#13
      + '#9#9"tempo": %d,'#13
      + '#9#9"id_controlador": %d,'#13
      + '#9#9"tempo_rele1": %d,'#13
      + '#9#9"tempo_rele2": %d,'#13
      + '#9#9"tempo_rele3": %d'#13
      + '#9}'#13
      + '}';

   SRequestFmt = ''
      + '{'#13
      + '#9"matricula": "%s",'#13
      + '#9"data_hora": "%s",'#13
      + '#9"funcao": %d,'#13
      + '#9"flag": %d,'#13
      + '#9"numero_relogio": %d,'#13
      + '#9"tipo": {'#13
      + '#9#9"saida": %s,'#13
      + '#9#9"master_liberou": %s,'#13
      + '#9#9"fonte_entrada": %d,'#13
      + '#9#9"funcao_liberou": %s,'#13
      + '#9#9"acesso_negado": %s,'#13
      + '#9#9"tipo_negado": %d'#13
      + '#9},'#13
      + '#9"id_controlador": %d,'#13
      + '#9"id_sensor": %d'#13
      + '}';

   SResponseFmt = ''
      + '{'#13
      + '#9"acesso": %d,'#13
      + '#9"mensagem": "%s",'#13
      + '#9"tempo": %d,'#13
      + '#9"id_controlador": %d,'#13
      + '#9"tempo_rele1": %d,'#13
      + '#9"tempo_rele2": %d,'#13
      + '#9"tempo_rele3": %d'#13
      + '}';
