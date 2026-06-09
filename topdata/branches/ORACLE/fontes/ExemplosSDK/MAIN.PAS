unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList,ShellAPI;

type
  TfrmExemplosSDK = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    StatusBar: TStatusBar;
    InnerOnLine1: TMenuItem;
    InnerBio1: TMenuItem;
    Ajuda: TMenuItem;
    InnerOffLine1: TMenuItem;
    InnerOnLine2: TMenuItem;
    InnerBio2: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre: TMenuItem;
    procedure FormShow(Sender: TObject);

    procedure InnerOffLine1Click(Sender: TObject);
    procedure InnerOnLine2Click(Sender: TObject);
    procedure InnerBio2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ajuda1Click(Sender: TObject);
    procedure SobreClick(Sender: TObject);
  private
    { Private declarations }
//   procedure CreateMDIChild(const Name: string);
   procedure AbrirTelaEasyInnerOnline();
   procedure CarregarConfiguracoesIni();
  public
    { Public declarations }
  end;

var
  frmExemplosSDK: TfrmExemplosSDK;

implementation

{$R *.dfm}

uses CHILDWIN, FormEasyInnerOffLine, UnitEasyInnerOnLine,
  FormEasyInnerTesteBio, uniSobre, IniFiles;

{procedure TfrmExemplosSDK.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  Child := TMDIChild.Create(Application);
  Child.Caption := Name;

  if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;}

procedure TfrmExemplosSDK.InnerOffLine1Click(Sender: TObject);
begin
 if (frmExemplosSDK.MDIChildCount = 0) then
  begin
    Application.CreateForm(TFrmEasyInnerOffLine, FrmEasyInnerOffLine);
    FrmEasyInnerOffLine.Show;
  end;
end;

procedure TfrmExemplosSDK.InnerOnLine2Click(Sender: TObject);
begin
  AbrirTelaEasyInnerOnline();
end;

procedure TfrmExemplosSDK.AbrirTelaEasyInnerOnline;
begin
  if (frmExemplosSDK.MDIChildCount = 0) then
  begin
    Application.CreateForm(TFormEasyInnerOnLine, FormEasyInnerOnLine);
   FormEasyInnerOnLine.Show;
  end;
end;

procedure TfrmExemplosSDK.InnerBio2Click(Sender: TObject);
begin
  if (frmExemplosSDK.MDIChildCount = 0) then
  begin
    Application.CreateForm(TFrmEasyInnerTesteBio, FrmEasyInnerTesteBio);
    FrmEasyInnerTesteBio.Show;
  end;
end;

procedure TfrmExemplosSDK.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
  i:integer;
begin
  for i:=1 to MDIChildCount do
    MDIChildren[i-1].Close;
end;

procedure TfrmExemplosSDK.FormShow(Sender: TObject);
begin
  CarregarConfiguracoesIni();
end;

procedure TfrmExemplosSDK.Ajuda1Click(Sender: TObject);
var
 HelpFile : String;
// H : HWND;
begin
  if (frmExemplosSDK.MDIChildCount = 0) then
  begin                                                                         
     HelpFile := GetCurrentDir + '\SDK_EasyInner_-_Manual_de_Desenvolvimento.chm';
     ShellExecute(0, 'open', PChar(HelpFile), nil, nil, SW_SHOWDEFAULT);
  end;
end;

procedure TfrmExemplosSDK.CarregarConfiguracoesIni;
var
   xIniPath: TFileName;
   xConnIni: TIniFile;
   xIniciarTelaAuto: Boolean;
begin
   xIniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);
   xConnIni := TIniFile.Create(xIniPath);

   xIniciarTelaAuto := xConnIni.ReadBool('Catraca.Prefs', 'IniciarAutomatico', True);

   if xIniciarTelaAuto then
     AbrirTelaEasyInnerOnline();
end;

procedure TfrmExemplosSDK.SobreClick(Sender: TObject);
begin
  if (frmExemplosSDK.MDIChildCount = 0) then
  begin
    Application.CreateForm(TfrmSobre, frmSobre);
    frmSobre.Show;
  end;
end;

end.
