unit UFMonthCalendar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, CommCtrl;

type
   TSelectDateEvent = procedure(const Date: TDate) of object;
   
   TfrmMonthCalendar = class(TForm)
      calCalendar: TMonthCalendar;
      procedure FormDeactivate(Sender: TObject);
   private
      FSelectedDate: TDate;
      FSelectDate: TSelectDateEvent;
      class var FInstance: TfrmMonthCalendar;
      class function GetInstance: TfrmMonthCalendar; static;
      class property Instance: TfrmMonthCalendar read GetInstance;
      property Calendar: TMonthCalendar read calCalendar;
      property SelectedDate: TDate read FSelectedDate write FSelectedDate;
      property SelectDate: TSelectDateEvent read FSelectDate write FSelectDate;
   public
      class procedure ShowCalendar(Control: TControl; OnSelectDate: TSelectDateEvent); overload;
      class procedure ShowCalendar(Control: TControl; OnSelectDate: TSelectDateEvent; const Date: TDate); overload;
      class procedure ShowCalendar(const Left, Top: Integer; OnSelectDate: TSelectDateEvent); overload;
      class procedure ShowCalendar(const Left, Top: Integer; OnSelectDate: TSelectDateEvent; const Date: TDate); overload;
      procedure CreateParams(var Params: TCreateParams); override;
      procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;
   end;

implementation

{$R *.dfm}

{ TfrmMonthCalendar }

procedure TfrmMonthCalendar.CreateParams(var Params: TCreateParams);
begin
   inherited CreateParams(Params);
   Params.Style := Params.Style or WS_THICKFRAME or WS_BORDER;
end;

procedure TfrmMonthCalendar.FormDeactivate(Sender: TObject);
begin
   Hide;
end;

class function TfrmMonthCalendar.GetInstance: TfrmMonthCalendar;
begin
   if TfrmMonthCalendar.FInstance = nil then
      TfrmMonthCalendar.FInstance := TfrmMonthCalendar.Create(Application);
   Result := TfrmMonthCalendar.FInstance;
end;

class procedure TfrmMonthCalendar.ShowCalendar(Control: TControl;
  OnSelectDate: TSelectDateEvent);
begin
   TfrmMonthCalendar.Instance.ShowCalendar(Control, OnSelectDate, Date);
end;

class procedure TfrmMonthCalendar.ShowCalendar(Control: TControl;
  OnSelectDate: TSelectDateEvent; const Date: TDate);
var
   Left, Top: Integer;
begin
   Left := Control.ClientOrigin.X;
   Top := Control.ClientOrigin.Y + Control.Height;
   TfrmMonthCalendar.ShowCalendar(Left, Top, OnSelectDate, Date);
end;

procedure TfrmMonthCalendar.WMNotify(var Message: TWMNotify);
var
   SelChange: PNMSelChange;
begin
   if Message.NMHdr^.code = MCN_SELECT then
   begin
      SelChange := PNMSelChange(Message.NMHdr);
      SelectedDate := EncodeDate(
         SelChange^.stSelStart.wYear,
         SelChange^.stSelStart.wMonth,
         SelChange^.stSelStart.wDay);
      if Assigned(SelectDate) then
         SelectDate(SelectedDate);
      Hide;
   end
   else
      inherited;
end;

class procedure TfrmMonthCalendar.ShowCalendar(const Left, Top: Integer;
  OnSelectDate: TSelectDateEvent);
begin
   TfrmMonthCalendar.ShowCalendar(Left, Top, OnSelectDate, Date);
end;

class procedure TfrmMonthCalendar.ShowCalendar(const Left, Top: Integer;
  OnSelectDate: TSelectDateEvent; const Date: TDate);
var
   Right, Bottom: Integer;
begin
   TfrmMonthCalendar.Instance.Left := Left;
   TfrmMonthCalendar.Instance.Top := Top;
   Right := TfrmMonthCalendar.Instance.Left + TfrmMonthCalendar.Instance.Width;
   Bottom := TfrmMonthCalendar.Instance.Top + TfrmMonthCalendar.Instance.Height;

   if Right > Screen.Width then
      TfrmMonthCalendar.Instance.Left :=
         Screen.Width - TfrmMonthCalendar.Instance.Width;

   if Bottom > Screen.Height then
      TfrmMonthCalendar.Instance.Top :=
         Screen.Height - TfrmMonthCalendar.Instance.Height;

   TfrmMonthCalendar.Instance.SelectDate := OnSelectDate;
   TfrmMonthCalendar.Instance.Calendar.Date := Date;
   TfrmMonthCalendar.Instance.Show;
end;

end.
