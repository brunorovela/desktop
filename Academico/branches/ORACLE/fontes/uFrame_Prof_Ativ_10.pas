unit uFrame_Prof_Ativ_10;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask;

type
  Tfrm_Professores_Ativ_10 = class(TFrame)
    dbLocal: TDBEdit;
    Label8: TLabel;
    dbAutoria: TDBEdit;
    Label2: TLabel;
    dbAtividade: TDBLookupComboBox;
    Label1: TLabel;
    Label3: TLabel;
    dbTitulo: TDBEdit;
    Label5: TLabel;
    dbAnais: TDBEdit;
    Label4: TLabel;
    dbFolhas: TDBEdit;
    dbAno: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    dbEventos: TDBEdit;
    Label10: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uProfessor, uDM;

{$R *.DFM}

procedure Tfrm_Professores_Ativ_10.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

