unit uFrame_Prof_Ativ_04;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  Tfrm_Professores_Ativ_04 = class(TFrame)
    Label1: TLabel;
    dbAtividade: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
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

procedure Tfrm_Professores_Ativ_04.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

