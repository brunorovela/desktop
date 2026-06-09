unit UFSplash;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls;

type
   TfSplash = class(TForm)
      pnlBorda: TPanel;
      pnlImagem: TPanel;
      imgLogo: TImage;
      pnlTopo: TPanel;
      aniCarregnd: TAnimate;
      lblTexto: TLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   end;

var
   fSplash: TfSplash;

implementation

{$R *.dfm}

procedure TfSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfSplash.FormCreate(Sender: TObject);
begin
   aniCarregnd.ResName := 'LOADING';
end;

end.
