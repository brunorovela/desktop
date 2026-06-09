unit uTrocarProfessorTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, General;

type
  TfrmTrocarProfessorTurma = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ckManterProfessorAI: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    lbTurma: TLabel;
    Label4: TLabel;
    lbDisciplina: TLabel;
    lbProfessorSubstituido: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbProfessorSubstituto: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    ckatribuircronogramas: TCheckBox;
    Bevel2: TBevel;
    ckTransferirAulas: TCheckBox;
    ckTransferirProvas: TCheckBox;
    Label3: TLabel;
    cbEtapa: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);    
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetTurma(turma: String);
    procedure SetDisciplina(disciplina: String);
    procedure SetTotalEtapas(totalEtapas: Integer);
    procedure SetProfessorSubstituito(professor: String);
    procedure SetProfessorSubstituto(professor: String);
    function GetTrocarProfessor(): Boolean;
  end;                           

var
  frmTrocarProfessorTurma: TfrmTrocarProfessorTurma;
  trocarProfessor: boolean;

implementation

{$R *.dfm}

procedure TfrmTrocarProfessorTurma.Button1Click(Sender: TObject);
begin
   // Mensagem de confirmação
   if Mensagem( 'Deseja trocar o professor '+frmTrocarProfessorTurma.lbProfessorSubstituido.Caption+','+chr(13)+'da turma '+frmTrocarProfessorTurma.lbTurma.Caption+', disciplina '+frmTrocarProfessorTurma.lbDisciplina.Caption+chr(13)+'pelo professor '+frmTrocarProfessorTurma.lbProfessorSubstituto.Caption+' ?',
       Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then
   begin
      Close;
   end;

   trocarProfessor := true;
   ckManterProfessorAI.Checked;
   ckTransferirAulas.Checked;
   ckTransferirProvas.Checked;
   Close;   
end;

procedure TfrmTrocarProfessorTurma.Button2Click(Sender: TObject);
begin
   trocarProfessor := false;
   Close;
end;

procedure TfrmTrocarProfessorTurma.SetTurma(turma: String);
begin
   frmTrocarProfessorTurma.lbTurma.Caption := turma;
end;

procedure TfrmTrocarProfessorTurma.SetDisciplina(disciplina: String);
begin
   frmTrocarProfessorTurma.lbDisciplina.Caption := disciplina;
end;

procedure TfrmTrocarProfessorTurma.SetTotalEtapas(totalEtapas: Integer);
var
   i: Integer;
begin
   frmTrocarProfessorTurma.cbEtapa.Items.Clear;
   // Cria uma combo com todas etapas disponíveis
   for i := 1 to totalEtapas do
   begin
      frmTrocarProfessorTurma.cbEtapa.Items.Add('Etapa ' + IntToStr(i));
   end;
   // Seleciona a primeira etapa como padrão
   frmTrocarProfessorTurma.cbEtapa.ItemIndex := 0;
end;

procedure TfrmTrocarProfessorTurma.SetProfessorSubstituito(professor: String);
begin
   frmTrocarProfessorTurma.lbProfessorSubstituido.Caption := professor;
end;

procedure TfrmTrocarProfessorTurma.SetProfessorSubstituto(professor: String);
begin
   frmTrocarProfessorTurma.lbProfessorSubstituto.Caption := professor;
end;

function TfrmTrocarProfessorTurma.GetTrocarProfessor(): Boolean;
begin
   Result := trocarProfessor;
end;

end.
