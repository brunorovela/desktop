object SvcUnimestreCatracas: TSvcUnimestreCatracas
  OldCreateOrder = False
  DisplayName = 'Unimestre Catracas'
  AfterInstall = ServiceAfterInstall
  AfterUninstall = ServiceAfterUninstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
