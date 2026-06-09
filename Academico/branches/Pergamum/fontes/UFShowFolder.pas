unit UFShowFolder;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DBCtrls, ExtCtrls, Buttons, ExtDlgs, jpeg, DB, UFComlCampanhas,
   Menus;

type
   TfShowFolder = class(TForm)
      opdFolder: TOpenPictureDialog;
      imFolder: TImage;
      pmOpcoes: TPopupMenu;
      miSelecionar: TMenuItem;
      miApagar: TMenuItem;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure pmOpcoesPopup(Sender: TObject);
      procedure miApagarClick(Sender: TObject);
      procedure miSelecionarClick(Sender: TObject);
   private
      FCloseAction: TCloseAction;
      function GetCloseAction: TCloseAction;
      procedure SetCloseAction(const Value: TCloseAction);
   public
      property CloseAction: TCloseAction read GetCloseAction write
         SetCloseAction;
   end;

var
   fShowFolder: TfShowFolder;

implementation

{$R *.dfm}

procedure TfShowFolder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := FCloseAction;
end;

procedure TfShowFolder.FormCreate(Sender: TObject);
begin
   FCloseAction := caHide;
end;

function TfShowFolder.GetCloseAction: TCloseAction;
begin
   Result := FCloseAction;
end;

procedure TfShowFolder.miApagarClick(Sender: TObject);
begin
   fComlCampanhas.qryCampanhas.Edit;
   fComlCampanhas.qryCampanhasBB_FOLDER.Clear;
end;

procedure TfShowFolder.miSelecionarClick(Sender: TObject);
var
   Stream: TStream;
   JPEGImage: TJPEGImage;
begin
   if opdFolder.Execute then
   begin
      JPEGImage := TJPEGImage.Create;
      try
         fComlCampanhas.qryCampanhas.Edit;
         Stream := fComlCampanhas.qryCampanhas.CreateBlobStream(
            fComlCampanhas.qryCampanhasBB_FOLDER, bmWrite);
         try
            JPEGImage.LoadFromFile(opdFolder.FileName);
            JPEGImage.SaveToStream(Stream);
            fComlCampanhas.qryCampanhasBB_FOLDER.LoadFromStream(Stream);
         finally
            Stream.Free;
         end;
      finally
         JPEGImage.Free;
      end;
   end;
end;

procedure TfShowFolder.pmOpcoesPopup(Sender: TObject);
begin
   miApagar.Enabled := imFolder.Picture.Graphic <> nil;
end;

procedure TfShowFolder.SetCloseAction(const Value: TCloseAction);
begin
   FCloseAction := Value;
end;

end.
