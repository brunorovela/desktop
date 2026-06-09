unit uFrame_Prof_Ativ_06;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask;

type
  Tfrm_Professores_Ativ_06 = class(TFrame)
    Label1: TLabel;
    dbAtividade: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label10: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uProfessor, uDM;

{$R *.DFM}

procedure Tfrm_Professores_Ativ_06.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

