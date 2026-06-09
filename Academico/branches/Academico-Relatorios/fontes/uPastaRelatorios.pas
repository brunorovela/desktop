unit uPastaRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    Memo3: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function ExtractWindowsDirectory(): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  iniWMestre : TIniFile;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   Close();
end;

procedure TForm1.FormShow(Sender: TObject);
Var
   strReports, strWindows, strUnimestre : String;
begin

    strWindows := ExtractWindowsDirectory();
    iniWMestre := TIniFile.Create(strWindows + '\WMESTRE.INI' );

    strReports := iniWMestre.ReadString( 'Configuracoes', 'Relatorios', ExtractFilePath(Application.ExeName) + '..\relatorios\');
    Memo1.Lines.Text := strReports;


    Memo2.Lines.Text :=  strWindows;

    strUnimestre := ExtractFilePath(Application.ExeName);
    Memo3.Lines.Text :=  strUnimestre;

   
end;

function TForm1.ExtractWindowsDirectory(): string;
var
   Buffer: array[0..144] of Char;
begin
   GetWindowsDirectory(Buffer,144);
   Result := (StrPas(Buffer));
end;

end.
