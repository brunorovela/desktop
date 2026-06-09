unit uObservacoesProfessor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, Db;

type
  Tfrm_Professores_Obs = class(TForm)
    mem: TDBMemo;
    btnFechar: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Professores_Obs: Tfrm_Professores_Obs;

implementation

uses uProfessores, uDM;

{$R *.DFM}


procedure Tfrm_Professores_Obs.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Professores_Obs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Professores_Obs.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var
  chave : string;
begin

  if frmProfessores.tblObsProfessor.State in [dsEdit, dsInsert] then
  begin
    if mem.Lines.Count > 0 then
    begin
      frmProfessores.tblObsProfessor.Post;
      chave := IntToStr(frmProfessores.tblObsProfessor.FieldByName('cd_pessoa').AsInteger);
      DM.setLog(30005, 'Alteracao', chave, DM.UsuarioLogado.ColigadaLogada, 'Alteração Observação do professor ' + IntToStr(frmProfessores.tblObsProfessor.FieldByName('cd_pessoa').AsInteger));
      frmProfessores.tblObsProfessor.Close;
      frmProfessores.tblObsProfessor.Open;
    end
    else
       frmProfessores.tblObsProfessor.Cancel
  end;

  CanClose := True;
end;


end.

