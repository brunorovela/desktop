object UMService: TUMService
  OldCreateOrder = True
  OnCreate = ServiceCreate
  DisplayName = 'UMServico'
  ErrorSeverity = esIgnore
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 264
  Width = 329
end
