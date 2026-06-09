unit UFReportFilterPessoa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls,
   uFSelecionarPessoa;

type
   TfrmReportFilterPessoa = class(TfrmReportFilterList)
   private
      FTab: AbasFiltroPessoa;
   protected
      procedure AddItem; override;
      property Tab: AbasFiltroPessoa read FTab write FTab;
   end;

implementation

uses
   UReportClasses;

{$R *.dfm}

{ TfrmReportFilterPessoa }

procedure TfrmReportFilterPessoa.AddItem;
var
   Filtro: TResultadoFiltroPessoa;
   Item: TItem;
begin
   Filtro := TfrmSelecionarPessoa.Filtrar([], Tab);

   if Filtro.filtrado then
   begin
      Item := TItem.Create(Filtro.cd_pessoa, Filtro.nm_pessoa);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterPessoa);

finalization
   UnRegisterClass(TfrmReportFilterPessoa);

end.
