unit uFrame_Prof_Ativ_07;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  Tfrm_Professores_Ativ_07 = class(TFrame)
    Label1: TLabel;
    dbAtividade: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label10: TLabel;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uProfessor, uDM;

{$R *.DFM}

procedure Tfrm_Professores_Ativ_07.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

