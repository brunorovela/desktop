unit uFSplashScreen;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, jpeg;

type
   TfSplashScreen = class(TForm)
   published
      pnTitulo: TPanel;
      imLogo: TImage;
      pnLogo: TPanel;
      pnInfo: TPanel;
   public
      procedure SetMensagem(const ASMensagem: string);
   end;

var
   fSplashScreen: TfSplashScreen;

implementation

{$R *.dfm}

{ TfSplashScreen }

procedure TfSplashScreen.SetMensagem(const ASMensagem: string);
begin
   pnInfo.Caption := ASMensagem;
end;

end.
