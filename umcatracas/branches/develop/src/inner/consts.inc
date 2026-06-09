const
   SJsonInfoFmt = ''
      + '{'#13
      + #9'"origem": %d,'#13
      + #9'"complemento": %d,'#13
      + #9'"cartao": "%s",'#13
      + #9'"data": {'#13
      + #9#9'"dia": %d,'#13
      + #9#9'"mes": %d,'#13
      + #9#9'"ano": %d,'#13
      + #9#9'"hora": %d,'#13
      + #9#9'"minuto": %d,'#13
      + #9#9'"segundo": %d'#13
      + #9'}'#13
      + '}';

   SEventCardReadFmt = '[%d] Card read: %s';
   SEventAccessDeniedFmt = '[%d] Access denied for %s';
   SEventErrOpeningPortFmt = 'Error trying to open port %d: %d';
   SEventErrSettingCardPatternFmt = 'Error setting card pattern %d: %d';
   SEventErrSettingConnectionTypeFmt = 'Error setting connection type %d: %d';
   SEventTryingConnFmt = 'Trying to connect inner %d';
   SEventSuccessConnFmt = 'Inner %d successfully connected';
   SEventReleaseFmt = '[%d] Release: %s';
   SEventTimeoutFmt = '[%d] Timeout';
   SEventTurnedFmt = '[%d] Turned: %s';
