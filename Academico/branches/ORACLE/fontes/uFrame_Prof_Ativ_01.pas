unit uFrame_Prof_Ativ_01;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask;

type
  Tfrm_Professores_Ativ_01 = class(TFrame)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    dbAtividade: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uProfessor, uDM;

{$R *.DFM}

procedure Tfrm_Professores_Ativ_01.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

