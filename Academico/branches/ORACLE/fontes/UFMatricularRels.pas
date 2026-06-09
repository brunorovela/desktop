unit UFMatricularRels;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ExtCtrls, Tabs, UCrpe32, ToolWin, Buttons, ImgList,
   UCrpeClasses;

type
   TfMatricularRels = class(TForm)
      pnlRelatorio: TPanel;
      tsRelatorios: TTabSet;
      tlbOpcoes: TToolBar;
      bvlSep1: TBevel;
      btnSep1: TToolButton;
      btnImprimir: TToolButton;
      btnImprimirTodos: TToolButton;
      btnSep2: TToolButton;
      btnConfigImp: TToolButton;
      btnSep3: TToolButton;
      ilIcones: TImageList;
      bvlSep2: TBevel;
      Crpe: TCrpe;
      stbInfos: TStatusBar;
      prbImpressao: TProgressBar;
      btnFechar: TToolButton;
      btnSep4: TToolButton;
    procedure btnConfigImpClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure stbInfosDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
         const Rect: TRect);
      procedure btnImprimirTodosClick(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
      procedure OnCloseReport(WindowHandle: HWND; var Cancel: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure tsRelatoriosChange(Sender: TObject; NewTab: Integer;
         var AllowChange: Boolean);
   private
      function GetCopias: Integer;
      procedure SetCopias(const Value: Integer);
   public
      procedure AddRelatorio(Relatorio: TCrpe);
      property Copias: Integer read GetCopias write SetCopias;
   end;

var
   fMatricularRels: TfMatricularRels;

implementation

{$R *.dfm}

{ TfMatricularRels }

procedure TfMatricularRels.AddRelatorio(Relatorio: TCrpe);
begin
   Relatorio.WindowEvents := True;
   Relatorio.wOnCloseWindow := OnCloseReport;
   tsRelatorios.Tabs.AddObject('', Relatorio);
end;

procedure TfMatricularRels.btnConfigImpClick(Sender: TObject);
begin
   TCrpe(tsRelatorios.Tabs.Objects[tsRelatorios.TabIndex]).Printer.Prompt;
//   TCrpe(tsRelatorios.Tabs.Objects[tsRelatorios.TabIndex]).Printer.SetCurrent;
end;

procedure TfMatricularRels.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfMatricularRels.btnImprimirClick(Sender: TObject);
begin
   prbImpressao.Position := 0;
   prbImpressao.Max := 1;
   prbImpressao.Visible := True;
   prbImpressao.StepIt;
   TCrpe(tsRelatorios.Tabs.Objects[tsRelatorios.TabIndex]).Print;
   Application.ProcessMessages;
   prbImpressao.Position := 0;
end;

procedure TfMatricularRels.btnImprimirTodosClick(Sender: TObject);
var
   I: Integer;
begin
   prbImpressao.Position := 0;
   prbImpressao.Max := tsRelatorios.Tabs.Count;
   Application.ProcessMessages;
   
   for I := 0 to tsRelatorios.Tabs.Count - 1 do
   begin
      TCrpe(tsRelatorios.Tabs.Objects[I]).Print;
      prbImpressao.StepIt;
      Application.ProcessMessages;
   end;

   prbImpressao.Position := 0;
   Application.ProcessMessages;
end;

procedure TfMatricularRels.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfMatricularRels.FormCreate(Sender: TObject);
begin
   prbImpressao.Parent := stbInfos;
end;

procedure TfMatricularRels.FormDestroy(Sender: TObject);
begin
   fMatricularRels := nil;
end;

procedure TfMatricularRels.FormShow(Sender: TObject);
var
   I: Integer;
begin
   stbInfos.Panels[0].Text := Format('%d relatório(s)', [tsRelatorios.Tabs.Count]);

   for I := 0 to tsRelatorios.Tabs.Count - 1 do
   begin
      tsRelatorios.Tabs.Strings[I] := TCrpe(tsRelatorios.Tabs.Objects[I]).ReportTitle;
   end;

   if tsRelatorios.Tabs.Count > 0 then
   begin
     tsRelatorios.TabIndex := 0;
   end;
end;

function TfMatricularRels.GetCopias: Integer;
begin
   Result := Crpe.PrintOptions.Copies;
end;

procedure TfMatricularRels.OnCloseReport(WindowHandle: HWND;
  var Cancel: Boolean);
begin
   tsRelatorios.Tabs.Delete(tsRelatorios.TabIndex);
   tsRelatorios.TabIndex := tsRelatorios.TabIndex;
end;

procedure TfMatricularRels.SetCopias(const Value: Integer);
begin
   Crpe.PrintOptions.Copies := Value;
   stbInfos.Panels[1].Text := Format('%d cópia(s)', [Value]);
end;

procedure TfMatricularRels.stbInfosDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   if Panel.Index = 2 then
   begin
      prbImpressao.Top := Rect.Top;
      prbImpressao.Left := Rect.Left;
      prbImpressao.Width := Rect.Right - Rect.Left;
      prbImpressao.Height := Rect.Bottom - Rect.Top;
   end;
end;

procedure TfMatricularRels.tsRelatoriosChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   if tsRelatorios.TabIndex > -1 then
   begin
      TCrpe(tsRelatorios.Tabs.Objects[tsRelatorios.TabIndex]).HideWindow;
   end;

   Windows.SetParent(
      TCrpe(tsRelatorios.Tabs.Objects[NewTab]).ReportWindowHandle,
      pnlRelatorio.Handle
   );
   TCrpe(tsRelatorios.Tabs.Objects[NewTab]).ShowWindow;
   TCrpe(tsRelatorios.Tabs.Objects[NewTab]).WindowState := wsMaximized;
end;

end.
