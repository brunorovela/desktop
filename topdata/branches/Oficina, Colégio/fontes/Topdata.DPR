program Topdata;

uses
  Forms,
  FormEasyInnerOffLine in 'UI\EasyInnerOffLine\FormEasyInnerOffLine.pas' {FrmEasyInnerOffLine},
  Constantes in 'Constantes\Constantes.pas',
  EasyInnerDLL in 'COM\EasyInnerDLL.pas',
  Bilhete in 'Entity\Bilhete.pas',
  UnitEasyInnerOnLine in 'UI\EasyInnerOnLine\UnitEasyInnerOnLine.pas' {FormEasyInnerOnLine},
  FormEasyInnerTesteBio in 'UI\EasyInnerTesteBio\FormEasyInnerTesteBio.pas' {FrmEasyInnerTesteBio},
  uniSobre in 'ExemplosSDK\uniSobre.pas' {frmSobre},
  CHILDWIN in 'ExemplosSDK\CHILDWIN.PAS' {MDIChild},
  MAIN in 'ExemplosSDK\MAIN.PAS' {frmExemplosSDK},
  Inner in 'Entity\Inner.pas',
  Utils in 'Entity\Utils.pas',
  UDM in 'DB\UDM.pas' {DM: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Unimestre Topdata';
  Application.CreateForm(TfrmExemplosSDK, frmExemplosSDK);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.


