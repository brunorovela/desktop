unit uHorarioCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, TB97,
  Grids, DBGrids, TB97Tlbr;

type
  TfrmHorarioCursos = class(TForm)
    tbNavigator: TToolbar97;
    Dock971: TDock97;
    sbSair: TSpeedButton;
    sbImprime: TSpeedButton;
    sbPesquisa: TSpeedButton;
    Panel2: TPanel;
    quHorarioCursos: TUMZQuery;
    dsHorarioCursos: TDataSource;
    Panel3: TPanel;
    dgHorarioCursos: TDBGrid;
    paDados: TPanel;
    dbeDescricao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeCodigo: TDBEdit;
    Label1: TLabel;
    dblCurso: TDBLookupComboBox;
    dsCursos: TDataSource;
    quCursos: TUMZQuery;
    quHorarioCursosCurso: TStringField;
    quHorarioCursosCodigo: TStringField;
    quHorarioCursosDescricao: TStringField;
    quCursosCodigo: TStringField;
    quCursosDescricao: TStringField;
    Navigator: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure quHorarioCursosAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure quHorarioCursosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure quHorarioCursosBeforeDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsHorarioCursosStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHorarioCursos: TfrmHorarioCursos;

implementation

Uses uDM,General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

{$R *.DFM}

procedure TfrmHorarioCursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmHorarioCursos.sbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHorarioCursos.quHorarioCursosAfterPost(DataSet: TDataSet);
begin
  quHorarioCursos.Close;
  quHorarioCursos.Open;
end;

procedure TfrmHorarioCursos.FormCreate(Sender: TObject);begin
  quCursos.Open;
  quHorarioCursos.Open;
  dsHorarioCursos.OnStateChange := dsHorarioCursosStateChange;
end;

procedure TfrmHorarioCursos.quHorarioCursosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmHorarioCursos.quHorarioCursosBeforeDelete(DataSet: TDataSet);
begin
  {Trocando a mensssagem em ingles dos controles do Delphi}
  {Por uma mensagem em português}
  if Mensagem('Confirma exclusão do Registro ?',Application.Title,Mb_YesNo) = id_No then
     Abort;
end;

procedure TfrmHorarioCursos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Passando os campos com Enter para todos os controles que}
  {nao sao tdbgrid}
  if  (ActiveControl.ClassType <> TDbGrid)
  and (key = vk_Return) then
      SelectNext (ActiveControl,True,True);
end;

procedure TfrmHorarioCursos.dsHorarioCursosStateChange(Sender: TObject);
begin
  {Habilitando e Desabilitando as chaves de acordo com o}
  {estado do Dataset}
  dblCurso.Enabled  := (quHorarioCursos.State in [dsInsert]);
  dbeCodigo.Enabled := (quHorarioCursos.State in [dsInsert]);
  if dblCurso.Enabled then
     dblCurso.SetFocus
  else if quHorarioCursos.State = dsBrowse then
     dbeDescricao.SetFocus;
end;


end.

