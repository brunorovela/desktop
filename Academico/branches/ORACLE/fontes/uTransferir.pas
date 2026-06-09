unit uTransferir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmTransferir = class(TForm)
    Panel1: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    DBText3: TDBText;
    Label2: TLabel;
    DBText4: TDBText;
    Label3: TLabel;
    DBText5: TDBText;
    Label4: TLabel;
    Bevel1: TBevel;
    EditDataVencimento: TDBEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure EditDataVencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferir: TfrmTransferir;

implementation

uses uMensalidades, uDM;

{$R *.DFM}


procedure TfrmTransferir.EditDataVencimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfrmTransferir.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  with frmMensalidades do
  begin
    DM.tblMensalidades.Close;
    DM.tblMensalidades.SQL.Clear;
    DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
    DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade) ' );
    DM.tblMensalidades.ParamByName('CdMensalidade').asInteger :=  tblMensalidadescd_mensalidade.AsInteger;
    DM.tblMensalidades.Open;
    DM.tblMensalidades.Edit;
  end;
end;



procedure TfrmTransferir.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrCancel then
  begin
      DM.tblMensalidades.Cancel;
      CanClose := True;
      Exit;
  end;

  // Conferir Bloqueio de Alterações por data
  if DM.EstaBloqueado(StrToDate(EditDataVencimento.Text), True) then begin
     CanClose := False;
     Exit;
  end;

  if (Mensagem( 'Deseja realmente prorrogar a parcela ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES) and
     ( ModalResult = mrOk ) then
  begin
    DM.tblMensalidades.Post;
    CanClose := True;
  end
  else
    CanClose := False;
end;

end.

