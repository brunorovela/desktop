unit uGrade_Horarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus;

type
  Tfrm_Grade_Horarios = class(TForm)
    Bevel1: TBevel;
    btnFechar: TButton;
    pmQtd: TPopupMenu;
    grd: TDBGrid;
    srcHorarios: TDataSource;
    qyHorarios: TUMZQuery;
    qyHorariosdia_semana: TSmallintField;
    qyHorariossemana: TStringField;
    qyHorariosHR_INICIO: TDateTimeField;
    qyHorariosHR_FIM: TDateTimeField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure qyHorariosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_Grade_Horarios: Tfrm_Grade_Horarios;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Grade_Horarios.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Grade_Horarios.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Grade_Horarios.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Grade_Horarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Grade_Horarios.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Grade_Horarios.qyHorariosCalcFields(DataSet: TDataSet);
begin
   case qyHorarios.FieldByName('dia_semana').AsInteger of
      1: qyHorarios.FieldByName('semana').AsString := 'Domingo';
      2: qyHorarios.FieldByName('semana').AsString := 'Segunda';
      3: qyHorarios.FieldByName('semana').AsString := 'Terça';
      4: qyHorarios.FieldByName('semana').AsString := 'Quarta';
      5: qyHorarios.FieldByName('semana').AsString := 'Quinta';
      6: qyHorarios.FieldByName('semana').AsString := 'Sexta';
      7: qyHorarios.FieldByName('semana').AsString := 'Sábado';
   end;
end;

end.

