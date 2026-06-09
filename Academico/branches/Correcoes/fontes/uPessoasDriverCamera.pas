unit uPessoasDriverCamera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, DirectShow9, DSUtils, Buttons;

type
   TfWebcamDriver = class(TForm)
      cbDriverList: TComboBox;
      filterGraph: TFilterGraph;
      filter: TFilter;
      sampGrabber: TSampleGrabber;
      bbtnSelect: TBitBtn;
    procedure cbDriverListSelect(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FCapEnum: TSysDevEnum;
   public
      class function SelectDriver(const VideoWindow: TVideoWindow): Boolean;
      class procedure Deactivate;
      class procedure CaptureAndStop(Bitmap: Graphics.TBitmap);
   end;

var
   fWebcamDriver: TfWebcamDriver;

implementation

{$R *.dfm}

class procedure TfWebcamDriver.CaptureAndStop(Bitmap: Graphics.TBitmap);
begin
   if fWebcamDriver <> nil then
   begin
      fWebcamDriver.sampGrabber.GetBitmap(Bitmap);
      fWebcamDriver.filterGraph.Stop;
   end;
end;

procedure TfWebcamDriver.cbDriverListSelect(Sender: TObject);
begin
   bbtnSelect.Enabled := True;
end;

class procedure TfWebcamDriver.Deactivate;
begin
   if (fWebcamDriver <> nil) and fWebcamDriver.filterGraph.Active then
      fWebcamDriver.filterGraph.Active := False;
end;

procedure TfWebcamDriver.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

class function TfWebcamDriver.SelectDriver(
  const VideoWindow: TVideoWindow): Boolean;
var
   I: Integer;
begin
   try
      if fWebcamDriver = nil then
         Application.CreateForm(TfWebcamDriver, fWebcamDriver)
      else
         fWebcamDriver.FCapEnum.Free;
      
      fWebcamDriver.FCapEnum :=
         TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);

      if fWebcamDriver.FCapEnum.CountFilters = 1 then
      begin
         TfWebcamDriver.Deactivate;
         fWebcamDriver.filterGraph.ClearGraph;
         fWebcamDriver.filter.BaseFilter.Moniker :=
            fWebcamDriver.FCapEnum.GetMoniker(0);
         fWebcamDriver.filterGraph.Active := True;
         (fWebcamDriver.filterGraph as ICaptureGraphBuilder2).RenderStream(
            @PIN_CATEGORY_PREVIEW, nil, fWebcamDriver.filter as IBaseFilter,
            fWebcamDriver.sampGrabber as IBaseFilter,
            VideoWindow as IBaseFilter);
         fWebcamDriver.filterGraph.Play;
         Result := True;
      end
      else
      begin
         fWebcamDriver.cbDriverList.Clear;
         for I := 0 to fWebcamDriver.FCapEnum.CountFilters - 1 do
            fWebcamDriver.cbDriverList.Items.Add(
               fWebcamDriver.FCapEnum.Filters[I].FriendlyName);
         
         if fWebcamDriver.ShowModal = mrOk then
         begin
            TfWebcamDriver.Deactivate;
            fWebcamDriver.filterGraph.ClearGraph;
            fWebcamDriver.filter.BaseFilter.Moniker :=
               fWebcamDriver.FCapEnum.GetMoniker(
                  fWebcamDriver.cbDriverList.ItemIndex);
            fWebcamDriver.filterGraph.Active := True;

            (fWebcamDriver.filterGraph as ICaptureGraphBuilder2).RenderStream(
               @PIN_CATEGORY_PREVIEW, nil, fWebcamDriver.filter as IBaseFilter,
               fWebcamDriver.sampGrabber as IBaseFilter,
               VideoWindow as IBaseFilter);
               
            fWebcamDriver.filterGraph.Play;
            Result := True;
         end
         else
            Result := False;
      end;
   except
      on E: Exception do raise;
   end;
end;

end.
