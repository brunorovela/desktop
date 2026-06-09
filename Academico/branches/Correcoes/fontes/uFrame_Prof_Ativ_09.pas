unit uFrame_Prof_Ativ_09;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  Tfrm_Professores_Ativ_09 = class(TFrame)
    Label1: TLabel;
    dbAtividade: TDBLookupComboBox;
    dbTitulo: TDBEdit;
    Label3: TLabel;
    dbAutoria: TDBEdit;
    Label2: TLabel;
    dbLocal: TDBEdit;
    Label8: TLabel;
    dbAno: TDBEdit;
    Label6: TLabel;
    dbFolhas: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
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

procedure Tfrm_Professores_Ativ_09.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

