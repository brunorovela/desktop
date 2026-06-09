unit uCadAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Mask, Buttons, DB, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TformCadAluno = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadAluno: TformCadAluno;

implementation

uses uDMDIARIO, uDM;

{$R *.DFM}

procedure TformCadAluno.BitBtn1Click(Sender: TObject);
begin
  try
     DMDiario.qAlunos.Post;
     DmDiario.qAlunos.ApplyUpdates;
     DMDiario.qAlunos.CommitUpdates;
  except
      Mensagem('Não é possível inserir esse aluno.');
      DMDiario.qAlunos.Cancel;
  End;
  Close;
end;

procedure TformCadAluno.BitBtn2Click(Sender: TObject);
begin
  DMDiario.qAlunos.Cancel;
  Close;
end;

procedure TformCadAluno.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

end;

end.

