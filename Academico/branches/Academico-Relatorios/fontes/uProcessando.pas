unit uProcessando;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmProcessando = class(TForm)
    Panel1: TPanel;
    Bar: TProgressBar;
    lblRegistros: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcessando: TfrmProcessando;

implementation

{$R *.DFM}

end.

