unit HistAluno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZConnection, Db, Mask, DBCtrls, StdCtrls, ExtCtrls, ComCtrls, uDM,
  Grids, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ZSqlUpdate;

type
  TfmObsHistorico = class(TForm)
    dsHist: TDataSource;
    quHist: TUMZQuery;
    usHist: TZUpdateSQL;
    qualuno: TUMZQuery;
    DataSource1: TDataSource;
    qucurso: TUMZQuery;
    DataSource2: TDataSource;
    qualunonome: TStringField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    pcHistorico: TPageControl;
    tshist: TTabSheet;
    tsSerie: TTabSheet;
    DBMemo1: TDBMemo;
    grSerie: TDBGrid;
    dsSerie: TDataSource;
    quSerie: TUMZQuery;
    buEscola: TButton;
    usSerie: TZUpdateSQL;
    dsEscola: TDataSource;
    quEscola: TUMZQuery;
    quEscolacodigo: TSmallintField;
    quEscolanome: TStringField;
    quEscolacidade: TStringField;
    quSerienmescola: TStringField;
    qusit: TUMZQuery;
    dssit: TDataSource;
    quSeriedssit: TStringField;
    Panel2: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText1: TDBText;
    eeAluno: TEdit;
    eeCurso: TEdit;
    quHistCodigoAluno: TIntegerField;
    quHistCurso: TStringField;
    quHistObservacoes: TMemoField;
    qucursodescricao: TStringField;
    quSeriecodigoaluno: TIntegerField;
    quSeriecurso: TStringField;
    quSerieanosemestre: TIntegerField;
    quSeriegrau: TSmallintField;
    quSerieserie: TSmallintField;
    quSeriesituacao: TSmallintField;
    quSeriecodigoescola: TSmallintField;
    procedure eealunoExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure quHistBeforePost(DataSet: TDataSet);
    procedure eealunoChange(Sender: TObject);
    procedure eecursoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eecursoEllipsisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eealunoEllipsisClick(Sender: TObject);
    procedure eealunoKeyPress(Sender: TObject; var Key: Char);
    procedure eecursoKeyPress(Sender: TObject; var Key: Char);
    procedure quSerieBeforePost(DataSet: TDataSet);
    procedure buEscolaClick(Sender: TObject);
    procedure quSerieCalcFields(DataSet: TDataSet);
  private
    wpcol  : tstringlist; //colunas a ser passadas
    procedure Inicia;
    procedure apertoubotao;
    function fnsituacao( sit : smallint) : string;
  public
    { Public declarations }
  end;

var
  fmObsHistorico: TfmObsHistorico;

implementation
uses tabbusca, uEscolas;
{$R *.DFM}

procedure TfmObsHistorico.eealunoExit(Sender: TObject);
begin
  if (eealuno.Text <> '') and  (qualuno.active = false) then begin
     qualuno.ParamByName('CODIGO').asinteger := strtoint(eealuno.Text);
     qualuno.active := True;
     if qualuno.FieldByName('NOME').asstring  = '' then  begin
        Mensagem('Aluno não encontrado!');
        qualuno.close;
        eealuno.Text := '';
        abort;
     end;
     Inicia;
  end;
end;

procedure TfmObsHistorico.Button3Click(Sender: TObject);
begin
TRY
  if quHist.active then begin
     if quHist.state in [dsinsert,dsedit] then
        quHist.Post;
     quHist.close;
  end;
  if quserie.Active then begin
     if quserie.state in [dsinsert,dsedit] then
        quserie.Post;
     if quserie.UpdatesPending then
        quserie.ApplyUpdates;
  end;
FINALLY
  ApertouBotao;
END;
end;

procedure TfmObsHistorico.Button2Click(Sender: TObject);
begin
TRY
  if quHist.active then begin
     quHist.Delete;
     quHist.close;
  end;
  if quserie.Active then begin
     if quserie.state in [dsinsert,dsedit] then
        quserie.Post;
     if quserie.UpdatesPending then
        quserie.ApplyUpdates;
  end;
FINALLY
  ApertouBotao;
END;
end;

procedure TfmObsHistorico.Button4Click(Sender: TObject);
begin
try
  if quHist.active then begin
     if quHist.state in [dsinsert,dsedit] then
        quHist.Cancel;
     quHist.close;
  end;
  if quserie.Active then begin
     if quserie.state in [dsinsert,dsedit] then
        quserie.Post;
     if quserie.UpdatesPending then
        quserie.CancelUpdates;
  end;
finally
  ApertouBotao;
end;
end;

procedure TfmObsHistorico.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfmObsHistorico.quHistBeforePost(DataSet: TDataSet);
begin
  if (eecurso.Text = '') or (eealuno.Text = '') then begin
     Mensagem('O Aluno e o curso devem ser preenchidos!');
     abort;
  end;
  if (quhist.FieldByName('CODIGOALUNO').asstring = '') or
     (quhist.FieldByName('CURSO').asstring       = '')  then begin
     quhist.FieldByName('CODIGOALUNO').asinteger := strtoint(eealuno.text);
     quhist.FieldByName('CURSO').asstring       := eecurso.text;
  end;
end;

procedure TfmObsHistorico.eealunoChange(Sender: TObject);
begin
  if quhist.active then
     abort;
end;

procedure TfmObsHistorico.eecursoExit(Sender: TObject);
begin
  if (eecurso.Text <> '') and  (qucurso.active = False) then begin
     qucurso.ParamByName('CODIGO').asstring := eecurso.Text;
     qucurso.active := True;
     if qucurso.FieldByName('DESCRICAO').asstring  = '' then  begin
        Mensagem('Curso não encontrado!');
        qucurso.close;
        eecurso.Text := '';
        abort;
     end;
     Inicia;
  end;
end;
procedure TfmObsHistorico.Inicia;
begin
  if (eecurso.Text <> '') and (eealuno.Text <> '') and (not quhist.active)then begin
     try
       quhist.parambyname('CDALUNO').asInteger := strtoint(eealuno.Text);
       quhist.parambyname('CURSO').asstring   := eecurso.Text;
       quhist.open;
     except
       raise;
     end;
     eecurso.ReadOnly := True;
     eealuno.ReadOnly := True;
     quserie.Close;
     quserie.parambyname('CODIGOALUNO').asinteger := strtoint(eealuno.Text);
     quserie.Open;
     quSit.Close;
     quSit.Open;
  end;
end;

procedure TfmObsHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if quHist.active then begin
     Mensagem('A operação ainda está pendente finalize-a!');
     abort;
  end;
  if quAluno.Active then quAluno.close;
  if quCurso.Active then quCurso.close;
  if quSerie.Active then quSerie.close;
  wpcol.Free;
  wpcol := nil;
  fmtabbusca.free;
  fmtabbusca := nil;
end;
procedure TfmObsHistorico.apertoubotao;
begin
 if quAluno.Active then quAluno.close;
 eecurso.ReadOnly := False;
 eealuno.ReadOnly := False;
 eealuno.text := '';
 quserie.close;
end;
procedure TfmObsHistorico.eecursoEllipsisClick(Sender: TObject);
begin
  wpcol.clear;
  wpcol.Add('Ano/Semestre');
  wpcol.Add('Código');
  wpcol.Add('Descrição');
  if eecurso.text <> '' then
     fmtabbusca.mostra('SELECT ANOSEMESTRE,CODIGO,DESCRICAO  FROM CURSOS ',
                        'WHERE DESCRICAO LIKE '''+eecurso.text+'''',
                        '',
                         wpcol,DM.db.database,464)
  else
     fmtabbusca.mostra('SELECT ANOSEMESTRE,CODIGO,DESCRICAO  FROM CURSOS ',
                        '','',wpcol,DM.db.database,464);
  if (fmtabbusca.wpprimeiro <> '') then begin
     eecurso.text       := fmtabbusca.wpprimeiro;
  end;
end;

procedure TfmObsHistorico.FormShow(Sender: TObject);
begin

  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  if fmtabbusca = nil then
     Application.CreateForm( Tfmtabbusca, fmtabbusca );
  wpcol := tstringlist.create;
  quescola.close;
  quescola.open;
end;

procedure TfmObsHistorico.eealunoEllipsisClick(Sender: TObject);
begin
  wpcol.clear;
  wpcol.Add('Código');
  wpcol.Add('Nome');
  wpcol.Add('Nascto');
  if eealuno.text <> '' then
     fmtabbusca.mostra('SELECT CODIGO,NOME,DATANASCIMENTO FROM ALUNOS ',
                        'WHERE NOME LIKE '''+eealuno.text+'''',
                        'ORDER BY NOME',
                         wpcol,DM.DB.database,488)
  else
     fmtabbusca.mostra('SELECT CODIGO,NOME,DATANASCIMENTO  FROM ALUNOS ',
                        'ORDER BY NOME','',
                        wpcol,DM.DB.database,488);
  if (fmtabbusca.wpprimeiro <> '') then
      eealuno.text := fmtabbusca.wpprimeiro;
end;

procedure TfmObsHistorico.eealunoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    eealunoEllipsisClick(nil);
end;

procedure TfmObsHistorico.eecursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     eecursoEllipsisClick(nil);
end;

procedure TfmObsHistorico.quSerieBeforePost(DataSet: TDataSet);
begin
  if quserie.FieldByName('ANOSEMESTRE').asstring = '' then abort;
  if quserie.FieldByName('GRAU').asstring = '' then abort;
  if quserie.FieldByName('SERIE').asstring = '' then abort;
  if quserie.FieldByName('SITUACAO').asstring = '' then abort;
  if quserie.FieldByName('CODIGOESCOLA').asstring = '' then abort;
  quserie.FieldByName('CODIGOALUNO').asinteger := strtoint(eealuno.text);
  quserie.FieldByName('CURSO').asstring        := eecurso.text;
end;

procedure TfmObsHistorico.buEscolaClick(Sender: TObject);
begin
  try
    if frmEscolas = nil then
       Application.CreateForm( TfrmEscolas, frmEscolas);
    frmEscolas.showmodal;
  finally
    frmEscolas.free;
    frmEscolas := nil;
  end;
  quescola.close;
  quescola.open;
end;

procedure TfmObsHistorico.quSerieCalcFields(DataSet: TDataSet);
begin
  quSeriedssit.AsString :=  fnsituacao(quSeriesituacao.asinteger);
end;
function TfmObsHistorico.fnsituacao( sit : smallint) : string;
begin

  result := DM.lst_situacao_desc[ sit ];

end;


end.


