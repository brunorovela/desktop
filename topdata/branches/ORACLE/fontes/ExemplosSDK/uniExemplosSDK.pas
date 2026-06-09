unit uniExemplosSDK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmExemplosSDK = class(TForm)
    MainMenu1: TMainMenu;
    OffLine1: TMenuItem;
    InnerOnLine1: TMenuItem;
    InnerBio1: TMenuItem;
    Sobre1: TMenuItem;
    procedure OffLine1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExemplosSDK: TfrmExemplosSDK;

implementation

uses FormEasyInnerOffLine;

{$R *.dfm}

procedure TfrmExemplosSDK.OffLine1Click(Sender: TObject);
begin
  FrmEasyInnerOffLine.ShowModal;
end;

end.
