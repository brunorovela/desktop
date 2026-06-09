unit uExibeImagem;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, CropImage;

type
   TfExibeImagem = class(TForm)
      ciDocumento: TCropImage;
   end;

var
   fExibeImagem: TfExibeImagem;

implementation

{$R *.dfm}

end.

