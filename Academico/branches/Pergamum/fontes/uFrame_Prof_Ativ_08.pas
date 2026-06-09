unit uFrame_Prof_Ativ_08;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  Tfrm_Professores_Ativ_08 = class(TFrame)
    dbAtividade: TDBLookupComboBox;
    Label1: TLabel;
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
    dbInstituicao: TDBLookupComboBox;
    Label7: TLabel;
    dbTipoDoc: TDBComboBox;
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

procedure Tfrm_Professores_Ativ_08.FrameEnter(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculasFrame(TFrame(Sender));

end;

end.

