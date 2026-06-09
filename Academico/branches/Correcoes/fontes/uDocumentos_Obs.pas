unit uDocumentos_Obs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Buttons ;

type
  Tfrm_Documentos_Obs = class(TForm)
    Bevel1: TBevel;
    lbDoc: TLabel;
    eDoc: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Documentos_Obs: Tfrm_Documentos_Obs;

implementation

uses uDM;

{$R *.DFM}

procedure Tfrm_Documentos_Obs.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   eDoc.SetFocus;
end;

end.

