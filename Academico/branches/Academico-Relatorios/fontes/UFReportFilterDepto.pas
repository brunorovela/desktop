unit UFReportFilterDepto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterDepto = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent, uFSelecionarDepartamento;

{$R *.dfm}

{ TfrmReportFilterDepto }

procedure TfrmReportFilterDepto.AddItem;
var
   FrameColigada: TfrmReportFilterList;
   ColigadaId, I, L, H: Integer;
   Item: TItem;
   Filtro: TResultadoFiltroDepartamento;
begin
   ColigadaId := -1;

   FrameColigada := TfrmReportFilterList(
      TReportFilterFactory.Instance.Find('Coligada'));

   if (FrameColigada <> nil) and (FrameColigada.Count = 1) then
   begin
      ColigadaId := StrToIntDef(FrameColigada.First.ID, -1);
   end;

   if ColigadaId <> -1 then
   begin
      Filtro := TfrmSelecionarDepartamento.Filtrar(
         [bfdSelecaoMultipla, bfdColigada], ColigadaId);
   end;

   if ColigadaId = -1 then
   begin
      Filtro := TfrmSelecionarDepartamento.Filtrar([bfdSelecaoMultipla]);
   end;

   if Filtro.filtrado then
   begin
      L := Low(Filtro.arrDepartamentos);
      H := High(Filtro.arrDepartamentos);

      for I := L to H do
      begin
         Item := TItem.Create(
            Filtro.arrDepartamentos[I].cd_departamento,
            Filtro.arrDepartamentos[I].ds_departamento);
         Add(Item);
      end;
      
   end;
end;

initialization
   RegisterClass(TfrmReportFilterDepto);

finalization
   UnRegisterClass(TfrmReportFilterDepto);

end.
