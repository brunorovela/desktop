unit uDefineSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfDefineSQL = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Panel3: TPanel;
    pnLinhas: TPanel;
    Bevel2: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    meSQL: TMemo;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    procedure meSQLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure meSQLKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
      procedure setConteudo(sConteudo: string);
      function getConteudo(): string;
      class function NovaJanela(sConteudo: string = ''): TfDefineSQL;
      function ShowJanela(): Integer;
    { Public declarations }
  end;

var
  fDefineSQL: TfDefineSQL;

implementation

{$R *.dfm}

{ TfDefineSQL }

function TfDefineSQL.getConteudo: string;
begin
   Result := meSQL.Text;
end;

procedure TfDefineSQL.setConteudo(sConteudo: string);
begin
   meSQL.Text := sConteudo;
end;

procedure TfDefineSQL.meSQLKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #9 then begin
      TMemo(Sender).SelText := '  ';
      Key := #0;
   end;
end;

function TfDefineSQL.ShowJanela: Integer;
begin
   Result := Self.ShowModal();
end;

class function TfDefineSQL.NovaJanela(sConteudo: string): TfDefineSQL;
begin
   Result := TfDefineSQL.Create(Application);
   Result.setConteudo(sConteudo);
end;

procedure TfDefineSQL.meSQLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   i, iConta: Integer;
   sTexto: string;
begin
   iConta := 0;
   sTexto := TMemo(Sender).Text;
   for i := 1 to Length(sTexto) do begin
      if sTexto[i] = #13 then begin
         Inc(iConta);
      end;
   end;
   pnLinhas.Caption := '   ' + IntToStr(iConta+1) + ' linha(s) ';
end;

end.
