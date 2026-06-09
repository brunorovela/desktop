const
   SEventDeviceNotConnectedFmt = '[%d] Could not connect socket to %s:%d';
   SEventDeviceErrorConnetingFmt = '[%d] Could not connect socket to %s:%d'#13'%s';
   SEventDeviceConnectedFmt = '[%d] Successfully connected to %s:%d';
   SEventDeviceConnectingFmt = '[%d] Connecting to %s:%d';
   SEventDeviceDisconnectedFmt = '[%d] Disconnected from %s:%d';
   SEventDeviceErrorFmt = '[%d] %s error from %s:%d';
   SEventPackageErrorSendingFmt = '[%d] Error sending package: %s'#13'%s';
   SEventPackageSentFmt = '[%d] Package sent: %s';
   SEventPackageReceivedFmt = '[%d] Package received: %s';

   SJsonEventRequestFmt = ''
      + '{'#13
      + #9'"evento": %s,'#13
      + #9'"matricula": "%s",'#13
      + #9'"data_hora": "%s",'#13
      + #9'"direcao": %s,'#13
      + #9'"acesso": %s,'#13
      + #9'"leitora": %s'#13
      + '}';
