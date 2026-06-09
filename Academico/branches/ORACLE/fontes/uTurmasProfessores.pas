unit uTurmasProfessores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, TB97, 
  Grids, DBGrids, wwidlg, Wwfltdlg, Wwdatsrc, Wwquery, ComCtrls, Wwdbigrd,
  Wwdbgrid, wwdblook, Wwdbdlg, TB97Tlbr, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmTurmasProfessores = class(TForm)
    dkBottom: TDock97;
    paCabecalho: TPanel;
    dkTop: TDock97;
    Toolbar971: TToolbar97;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    ToolbarSep972: TToolbarSep97;
    tbNavigator: TToolbar97;
    btnCancelar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnSair: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    grd: TDBGrid;
    Navigator: TDBNavigator;
    procedure sbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure quTurmasProfessoresPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quTurmasProfessoresBeforePost(DataSet: TDataSet);
    procedure quTurmasProfessoresAfterPost(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure CopiarGrade;
    procedure dsProfessoresDataChange(Sender: TObject; Field: TField);
    procedure grd1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTurmasProfessores: TfrmTurmasProfessores;

implementation

Uses uDM, Main;

{$R *.DFM}

procedure TfrmTurmasProfessores.sbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTurmasProfessores.FormCreate(Sender: TObject);
var
  wAno, wMes, wDia : Word;
begin

  DecodeDate(DataHoje,wAno,wMes,wDia);
  if wMes >= 7 then
    txtAnoSemestre.text := FormatDateTime('yyyy',DataHoje)+'2'
  else
    txtAnoSemestre.text := FormatDateTime('yyyy',DataHoje)+'1';

  tblCursos.Open;
  tblGrade.Open;
  quTurmas.Open;
  quDisciplinas.Open;
  quProfessores.Open;
  quTurmasProfessores.Open;
  dsProfessoresDataChange(nil,nil);
end;

procedure TfrmTurmasProfessores.quTurmasProfessoresPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmTurmasProfessores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Passando os campos com Enter para todos os controles que}
  {nao sao tdbgrid e tdbMemo}
  if  ((ActiveControl.ClassType <> TDbGrid)
  and  (ActiveControl.ClassType <> TDbMemo)
  and  (Key = vk_Return)) then
      begin
        SelectNext (ActiveControl,True,True);
        Key := 0;
      end
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

procedure TfrmTurmasProfessores.quTurmasProfessoresBeforePost(DataSet: TDataSet);
var
  lsMensagem :String;
begin
  {Consistencia dos campos antes de gravar}

  lsMensagem := '';

end;

procedure TfrmTurmasProfessores.quTurmasProfessoresAfterPost(DataSet: TDataSet);
begin
  quTurmasProfessores.Close;
  quTurmasProfessores.Open;
end;

procedure TfrmTurmasProfessores.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTurmasProfessores.btnIncluirClick(Sender: TObject);
begin
  quTurmasProfessores.Insert;
end;

procedure TfrmTurmasProfessores.btnAlterarClick(Sender: TObject);
begin
  quTurmasProfessores.Edit;
end;

procedure TfrmTurmasProfessores.dsProfessoresDataChange(Sender: TObject;
  Field: TField);
end;

procedure TfrmTurmasProfessores.grd1Exit(Sender: TObject);
begin
  grd.SetFocus;
end;




end.

