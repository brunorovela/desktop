unit uFrame_Prof_Ativ_11;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  Tfrm_Professores_Ativ_11 = class(TFrame)
    Label1: TLabel;
    dbAtividade: TDBLookupComboBox;
    dbTitulo: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uProfessor, uDM;

{$R *.DFM}

procedure Tfrm_Professores_Ativ_11.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

