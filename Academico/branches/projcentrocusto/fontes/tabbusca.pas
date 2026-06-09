unit tabbusca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Grids, DBGrids, ExtCtrls, Menus,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfmtabbusca = class(TForm)
    Panel1: TPanel;
    grseleciona: TDBGrid;
    buAceitar: TButton;
    buFechar: TButton;
    dsSelecao: TDataSource;
    quSelecao: TUMZQuery;
    pmQtd: TPopupMenu;
    procedure buAceitarClick(Sender: TObject);
    procedure buFecharClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
     wpprimeiro,
     wpsegundo : string;
     function  Mostra(comando1 : string ;
                      comando2 : string ;
                      comando3 : string ;
                      colunas  : tstringlist;
                      basedados: string;
                      largura  : integer): smallint;

  end;

var
  fmtabbusca: Tfmtabbusca;

implementation

uses uDM;

{$R *.DFM}

function  Tfmtabbusca.Mostra(comando1 : string ;
                             comando2 : string ;
                             comando3 : string ;
                             colunas  : tstringlist;
                             basedados: string;
                             largura  : integer) : smallint;
var
  i : integer;
begin
  with quSelecao do begin
    Close;
//    DatabaseName := basedados;
    sql.clear;
    sql.text := comando1;
    if comando2 <> '' then
       sql.add(comando2);
    if comando2 <> '' then
       sql.add(comando3);
    open;
  end;
  if colunas.count > 0 then begin
     i := 0;
     repeat
      grseleciona.Columns.Items[i].Title.Caption := colunas.Strings[i];
      inc(i);
     until colunas.count <= i ;
  end;
  fmtabbusca.Width := largura;
  fmtabbusca.ShowModal;
end;

procedure Tfmtabbusca.buAceitarClick(Sender: TObject);
begin
  wpprimeiro := quselecao.Fields[0].asstring;
  wpsegundo  := quselecao.Fields[1].asstring;
  close;
end;

procedure Tfmtabbusca.buFecharClick(Sender: TObject);
begin
  wpprimeiro := '';
  wpsegundo  := '';
  close;
end;

procedure Tfmtabbusca.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(quSelecao, pmQtd);
end;

end.

