unit uMedias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Query1: TUMZQuery;
    Query1AnoSemestre: TSmallintField;
    Query1Turma: TStringField;
    Query1CodigoGrade: TStringField;
    Query1CodigoAluno: TIntegerField;
    Query1Curso: TStringField;
    Query1Disciplina: TSmallintField;
    Query1Grau: TSmallintField;
    Query1Serie: TSmallintField;
    Query1Nota1: TFloatField;
    Query1Falta1: TSmallintField;
    Query1Exame1: TFloatField;
    Query1Nota2: TFloatField;
    Query1Falta2: TSmallintField;
    Query1Exame2: TFloatField;
    Query1Nota3: TFloatField;
    Query1Falta3: TSmallintField;
    Query1Exame3: TFloatField;
    Query1Nota4: TFloatField;
    Query1Falta4: TSmallintField;
    Query1Exame4: TFloatField;
    Query1NotaExame: TFloatField;
    Query1FloatField2aEpoca: TFloatField;
    Query1MediaFinal: TFloatField;
    Query1Frequencia: TSmallintField;
    Query1TotalFaltas: TSmallintField;
    Query1Situacao: TSmallintField;
    Query1Usuario: TIntegerField;
    Query1CodigoEscola: TSmallintField;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function RoundFloat (AFloat : Double; ADigits : byte) : Double;
  
var
  Form1: TForm1;

implementation

{$R *.DFM}

function RoundFloat (AFloat : Double; ADigits : byte) : Double;
var
  TempStr : string;
  FloatResult : Double;
begin
  if ADigits <= 15 then
  begin
    TempStr := FloatToStrF( AFloat, ffFixed, 20, ADigits);
    FloatResult := StrToFloat (TempStr);

    Result := FloatResult;
  end
  else
    Result := AFloat;
end;

function RoundUp( AFloat: Double ): Double;
var
  xAux: Double;
  xNum: String;
  xInt: Integer;
begin
  xAux := RoundFloat(AFloat,2);
  xNum := FloatToStr(xAux);
  xInt := StrToInt(xNum[Length(xNum)]);

  if xInt >= 5 then
    Result := RoundFloat(Int(AFloat)+Frac(AFloat)+StrToFloat('0,0'+IntToStr(10-xInt)),2)
  else
    Result := AFloat;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  Query1.Open;

  while not Query1.Eof do
  begin
    Query1.Edit;
    Query1MediaFinal.ASFloat := RoundUp(Query1MediaFinal.AsFloat);
    Query1.Post;
    Query1.Next;
  end;
  ShowMessage('OK');
  Query1.Close;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Edit2.Text := FloatToStr(RoundUp(StrToFloat(Edit1.Text)));
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
end;

end.

