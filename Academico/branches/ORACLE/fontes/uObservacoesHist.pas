unit uObservacoesHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, DB, Comctrls;

type
  TfrmObservacoesHist = class(TForm)
    mem: TDBMemo;
    btnFechar: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObservacoesHist: TfrmObservacoesHist;

implementation

uses uDM, Main, uHistoricos;

{$R *.DFM}


procedure TfrmObservacoesHist.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmObservacoesHist.btnAssinarClick(Sender: TObject);
begin
  mem.Lines.Add( DM.tblUsuariosNomeNome.AsString + ' - ' +
                 FormatDateTime( 'dd/mm/yyyy', DataHoje ) );
end;

procedure TfrmObservacoesHist.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM.tblObservacoesHist.State in [dsEdit, dsInsert] then
  begin
    if mem.Lines.Count > 0 then
    begin

      if TTabSheet(frmHistoricos.PageControl1.ActivePage).PageIndex = 0 then
        DM.tblObservacoesHistGrau.AsInteger := 1
      else
        DM.tblObservacoesHistGrau.AsInteger := 2;

      DM.tblObservacoesHist.Post;
    end
    else
    begin
      if DM.tblObservacoesHist.State = dsInsert then
          DM.tblObservacoesHist.Cancel
        else
          DM.tblObservacoesHist.Delete;
    end;
  end;

  CanClose := True;

end;

procedure TfrmObservacoesHist.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnAssinarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

end.

