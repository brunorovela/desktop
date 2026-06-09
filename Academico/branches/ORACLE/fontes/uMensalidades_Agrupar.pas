unit uMensalidades_Agrupar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection;

type
  Tfrm_Mensalidades_agrupar = class(TForm)
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtCodigo_Resp: TEdit;
    Query1: TUMZQuery;
    btnCodigoAluno: TSpeedButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Mensalidades_agrupar: Tfrm_Mensalidades_agrupar;

implementation

uses uSel_Pessoas;

{$R *.dfm}

procedure Tfrm_Mensalidades_agrupar.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
end;

end.

