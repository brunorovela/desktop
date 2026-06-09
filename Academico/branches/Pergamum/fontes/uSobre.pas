unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    btFechar: TButton;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel3: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image7: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Image4: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Image3: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Image5: TImage;
    Label19: TLabel;
    Image6: TImage;
    lbInstituicao: TLabel;
    lbVersao: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label14Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
    class procedure executaArquivo(sArquivo: string);
   
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses Main, uDM, uGeneral;

{$R *.dfm}

procedure TfrmSobre.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

class procedure TfrmSobre.executaArquivo(sArquivo: string);
var
   buffer: string;
begin
   buffer := sArquivo;
   ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  lbInstituicao.Caption := DM.sColigadaSelecionada;
  lbVersao.Caption := TGeneral.getVersaoSistema();
end;

procedure TfrmSobre.FormDestroy(Sender: TObject);
begin
   frmSobre := nil;
end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
   if key = VK_F12 then
   begin
      frmSobre.Close;
   end;
end;

procedure TfrmSobre.Label14Click(Sender: TObject);
begin
   self.executaArquivo('mailto:suporte@unimestre.com');
end;

procedure TfrmSobre.Label17Click(Sender: TObject);
begin
   self.executaArquivo('http://manual.unimestre.com');
end;

procedure TfrmSobre.Label6Click(Sender: TObject);
begin
   self.executaArquivo('http://www.unimestre.com');
end;

procedure TfrmSobre.Label9Click(Sender: TObject);
begin
   self.executaArquivo('http://www.unimestre.com');
end;

end.

