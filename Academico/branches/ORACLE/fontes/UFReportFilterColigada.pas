unit UFReportFilterColigada;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterColigada = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, uFSelecionarColigada, uColigada;

{$R *.dfm}

{ TfrmReportFilterColigada }

procedure TfrmReportFilterColigada.AddItem;
var
   Coligada: TColigada;
   Item: TItem;
begin
   if TfrmSelecionarColigada.GetInstancia.ShowModal then
   begin
      Coligada := TfrmSelecionarColigada.getResultado;

      if Coligada <> nil then
      begin
         Item := TItem.Create(Coligada.Codigo, Coligada.Nome);
         Add(Item);
      end;
   end;
end;

initialization
   RegisterClass(TfrmReportFilterColigada);

finalization
   UnRegisterClass(TfrmReportFilterColigada);

end.
