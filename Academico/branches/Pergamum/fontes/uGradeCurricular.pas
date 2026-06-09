unit uGradeCurricular;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, TB97, DBNav97,
  Grids, DBGrids, wwidlg, Wwfltdlg, Wwdatsrc, Wwquery, ComCtrls, wwdblook,
  Wwdbdlg, Wwdbigrd, Wwdbgrid, TB97Tlbr, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmGradeCurricular = class(TForm)
    dkBottom: TDock97;
    quGrade: TwwQuery;
    dsGrade: TwwDataSource;
    fdGeral: TwwFilterDialog;
    paCabecalho: TPanel;
    pcGeral: TPageControl;
    tsFolha: TTabSheet;
    tsGrade: TTabSheet;
    dsSeries: TwwDataSource;
    quSeries: TwwQuery;
    quDisciplinas: TwwQuery;
    dkTop: TDock97;
    quGradeCurso: TStringField;
    quGradeDisciplina: TSmallintField;
    quGradeSerie: TSmallintField;
    quGradeNumeroAulas: TFloatField;
    dsDisciplinas: TwwDataSource;
    dsCursos: TwwDataSource;
    quCursos: TwwQuery;
    dsGradeGrid: TwwDataSource;
    quGradeGrid: TwwQuery;
    quGradeGridCurso: TStringField;
    quGradeGridDisciplina: TSmallintField;
    quGradeGridSerie: TSmallintField;
    quGradeGridNumeroAulas: TFloatField;
    quGradeGridDescCurso: TStringField;
    quGradeGridDescDisci: TStringField;
    quSeriesCodigo: TSmallintField;
    quSeriesDescricao: TStringField;
    tbNavigator: TToolbar97;
    btnCancelar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnSair: TSpeedButton;
    btnExcluir: TSpeedButton;
    Toolbar971: TToolbar97;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    ToolbarSep972: TToolbarSep97;
    DBNavigator971: TDBNavigator97;
    quGradeValor: TFloatField;
    quGradeCodigoGrade: TIntegerField;
    qryMax: TUMZQuery;
    qryMaxMaxCodigoGrade: TIntegerField;
    quGradeAnoSemestre: TSmallintField;
    quGradeGridAnoSemestre: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure quGradePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgGeralDblClick(Sender: TObject);
    procedure dgGeralKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quGradeAfterPost(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure quGradeAfterInsert(DataSet: TDataSet);
    procedure quGradeNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGradeCurricular: TfrmGradeCurricular;

implementation

Uses uDM, uCursos, uTurmas;

{$R *.DFM}

procedure TfrmGradeCurricular.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGradeCurricular.sbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGradeCurricular.quGradePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmGradeCurricular.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Passando os campos com Enter para todos os controles que}
  {nao sao tdbgrid e tdbMemo}
  if  ((ActiveControl.ClassType <> TDbGrid)
  and  (ActiveControl.ClassType <> TDbMemo)
  and  (Key = vk_Return))
  or   (Key = 34) then
      begin
        SelectNext (ActiveControl,True,True);
        Key := 0;
      end
  else if Key = 33 then
      SelectNext (ActiveControl,False,True)
  else if  (Key = vk_F2)
       and (BtnIncluir.Enabled) then
      {Incluir}
      BtnIncluirClick(Nil)
  else if  (Key = vk_F3)
       and (BtnAlterar.Enabled) then
      {Alterar}
      BtnAlterarClick(Nil)
  else if  (Key = vk_F4)
       and (BtnSalvar.Enabled) then
      {Salvar}
      BtnSalvarClick(Nil)
  else if  (Key = vk_F5)
       and (BtnExcluir.Enabled) then
      {Excluir}
      BtnExcluirClick(Nil)
  else if  (Key = vk_F6)
       and (BtnCancelar.Enabled) then
      {Cancelar}
      BtnCancelarClick(Nil)
  else if  (Key = vk_F7)
       and (BtnImprimir.Enabled) then
      {Imprimir}
//      BtnImprimirClick(Nil)
  else if  (Key = vk_F8)
       and (BtnPesquisar.Enabled) then
      {Pesquisar}
      BtnPesquisarClick(Nil)
  else if Key = vk_F12 then
      BtnSairClick(Nil);
end;

procedure TfrmGradeCurricular.dgGeralDblClick(Sender: TObject);
begin
  {Caso seja dado dois click's no grid}
  {o dataset e colocado em estado de edicao e a pagina é setada para}
  {folha de dados}
  with quGradeGrid do begin
     quGrade.Locate('Curso;Disciplina;Serie',
       VarArrayOf([FieldByName('Curso').AsString,FieldByName('Disciplina').AsInteger,
                   FieldByName('Serie').AsInteger]),[loCaseInsensitive]);
  end;
  pcGeral.ActivePage := tsFolha;
//  quGrade.Edit;
end;

procedure TfrmGradeCurricular.dgGeralKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {O mesmo procedimento descrito acima funciona para a tecla [Enter]}
  {pressionada sob o registro no grid}
  if key = vk_Return then
     dgGeralDblClick(Nil);
end;

procedure TfrmGradeCurricular.quGradeAfterPost(DataSet: TDataSet);
begin
  quGrade.Close;
  quGrade.Open;
  quGradeGrid.Close;
  quGradeGrid.Open;
end;

procedure TfrmGradeCurricular.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGradeCurricular.btnPesquisarClick(Sender: TObject);
begin
  {Caso a opcao de filtro seja setada a pagina grade automaticamente}
  {é setado para melhor visualização do filtro}

  if pcGeral.ActivePage <> tsGrade then
     pcGeral.ActivePage := tsGrade;
  fdGeral.Execute;
end;

procedure TfrmGradeCurricular.btnIncluirClick(Sender: TObject);
begin
  quGrade.Insert;
end;

procedure TfrmGradeCurricular.btnAlterarClick(Sender: TObject);
begin
  quGrade.Edit;
end;

procedure TfrmGradeCurricular.btnExcluirClick(Sender: TObject);
begin
  {Trocando a mensssagem em ingles dos controles do Delphi}
  {Por uma mensagem em português}
  if Mensagem('Confirma exclusão do Registro ?',Application.Title,Mb_YesNo) = id_Yes then
     quGrade.Delete;

  quGrade.DisableControls;
  quGrade.Close;
  quGrade.Open;
  quGrade.EnableControls;

end;

procedure TfrmGradeCurricular.btnCancelarClick(Sender: TObject);
begin
  quGrade.Cancel;
end;

procedure TfrmGradeCurricular.quGradeAfterInsert(DataSet: TDataSet);
begin
  if pcGeral.ActivePage <> tsFolha then pcGeral.ActivePage := tsFolha;
  quGradeCurso.AsString := frmCursos.quCursosCodigo.AsString;
  quGradeAnoSemestre.Value := frmCursos.quCursosAnoSemestre.Value;
  
end;

procedure TfrmGradeCurricular.quGradeNewRecord(DataSet: TDataSet);
begin
  qryMax.Close;
  qryMax.SQL.Clear;
  qryMax.SQL.Add( 'select Max(CodigoGrade) as MaxCodigoGrade from GradeCurricular' );
  qryMax.Prepare;
  qryMax.Open;

  quGradeCodigoGrade.AsInteger := qryMaxMaxCodigoGrade.AsInteger + 1;
end;

{$O-}
procedure TfrmGradeCurricular.btnSalvarClick(Sender: TObject);
var
  strCurso : String;
  intDisciplina : Integer;
  intSerie : Integer;
begin
  strCurso := quGradeCurso.AsString;
  intDisciplina := quGradeDisciplina.AsInteger;
  intSerie := quGradeSerie.AsInteger;
  quGrade.Post;
  quGrade.DisableControls;
  quGrade.Close;
  quGrade.Open;
  quGrade.Locate( 'Curso;Disciplina;Serie', VarArrayOf( [strCurso,intDisciplina,intSerie] ),
                  [loPartialKey] );
  quGrade.EnableControls;
end;
{$O+}


end.

