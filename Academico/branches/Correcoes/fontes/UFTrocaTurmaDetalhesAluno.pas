unit UFTrocaTurmaDetalhesAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, UZDataset, Provider, DBClient, ToolWin,
  ComCtrls, ImgList, ExtCtrls, Grids, DBGrids, UDBGrids, DBCGrids, DBCtrls,
  StdCtrls, Buttons;

type
  TfrmTrocaTurmaDetalhesAluno = class(TForm)
    qryFichaIndividual: TUMZReadOnlyQuery;
    dsFichaIndividual: TDataSource;
    dspFichaIndividual: TDataSetProvider;
    tlbAcoes: TToolBar;
    ilAcoes: TImageList;
    btnSalvar: TToolButton;
    bvlSep1: TBevel;
    dbgFichaIndividual: TSortedDBGrid;
    cdsFichaIndividual: TClientDataSet;
    qryFichaIndividualNR_ANOSEMESTRE: TSmallintField;
    qryFichaIndividualCD_TURMA: TStringField;
    qryFichaIndividualCD_PESSOA: TIntegerField;
    qryFichaIndividualCD_DISCIPLINA: TIntegerField;
    qryFichaIndividualNR_SERIE: TSmallintField;
    qryFichaIndividualCD_TURMA_MATRICULA: TStringField;
    qryFichaIndividualDS_DISCIPLINA: TStringField;
    qryFichaIndividualDS_SIGLA: TStringField;
    qryFichaIndividualCD_CURSO: TStringField;
    cdsFichaIndividualNR_ANOSEMESTRE: TSmallintField;
    cdsFichaIndividualCD_TURMA: TStringField;
    cdsFichaIndividualCD_PESSOA: TIntegerField;
    cdsFichaIndividualCD_DISCIPLINA: TIntegerField;
    cdsFichaIndividualNR_SERIE: TSmallintField;
    cdsFichaIndividualCD_TURMA_MATRICULA: TStringField;
    cdsFichaIndividualDS_DISCIPLINA: TStringField;
    cdsFichaIndividualDS_SIGLA: TStringField;
    cdsFichaIndividualCD_CURSO: TStringField;
    cdsFichaIndividualDS_ACAO: TStringField;
    cdsFichaIndividualCD_TURMA_NOVA: TStringField;
    Label1: TLabel;
    qryFichaIndividualCD_SITUACAO: TSmallintField;
    cdsFichaIndividualCD_SITUACAO: TSmallintField;
    qryFichaIndividualSN_OPTATIVA: TSmallintField;
    cdsFichaIndividualSN_OPTATIVA: TSmallintField;
    procedure dbgFichaIndividualCellClick(Column: TColumn);
    procedure dbgFichaIndividualEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure cdsFichaIndividualDS_ACAOChange(Sender: TField);
  private
    { Private declarations }
      procedure OnSelectTurma(const TurmaId: AnsiString);
  public
    { Public declarations }
      class function ShowFichaIndividual(const AnoSemestre: Word;
         const CursoId, TurmaId, TurmaDestId: AnsiString;
         const PessoaId: Cardinal): TModalResult;
      class procedure PreparaFichaIndividual(const AnoSemestre: Word;
         const CursoId, TurmaId, TurmaDestId: AnsiString);
  end;

var
  frmTrocaTurmaDetalhesAluno: TfrmTrocaTurmaDetalhesAluno;

implementation

uses
   UFTrocaTurmaTurmas;

{$R *.dfm}

{ TfrmTrocaTurmaDetalhesAluno }

procedure TfrmTrocaTurmaDetalhesAluno.btnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   Close;
end;

procedure TfrmTrocaTurmaDetalhesAluno.cdsFichaIndividualDS_ACAOChange(
  Sender: TField);
const
   STransferir = 'Matricular em uma nova turma';
begin
   dbgFichaIndividual.Columns[3].ReadOnly := cdsFichaIndividualDS_ACAO.AsString <> STransferir;

   if cdsFichaIndividualDS_ACAO.AsString <> STransferir then
   begin
      cdsFichaIndividualCD_TURMA_NOVA.Clear;
   end;
end;

procedure TfrmTrocaTurmaDetalhesAluno.dbgFichaIndividualCellClick(
  Column: TColumn);
var
   GridOptions: TDBGridOptions;
   Editable: Boolean;
begin
   GridOptions := dbgFichaIndividual.Options;

   Exclude(GridOptions, dgEditing);

   Editable :=
      (
         (cdsFichaIndividualDS_ACAO.AsString = 'Matricular em uma nova turma') and
         (Column.FieldName = 'CD_TURMA_NOVA')
      ) or
      (
         Column.FieldName = 'DS_ACAO'
      );
   
   if Editable then
      Include(GridOptions, dgEditing);

   dbgFichaIndividual.Options := GridOptions;
end;

procedure TfrmTrocaTurmaDetalhesAluno.dbgFichaIndividualEditButtonClick(
  Sender: TObject);
var
   CursorPoint: TPoint;
begin
   if dbgFichaIndividual.SelectedField.FieldName = 'CD_TURMA_NOVA' then
   begin
      CursorPoint := Mouse.CursorPos;
   
      TfrmTrocaTurmaTurmas.ShowTurmas(
         CursorPoint.X,
         CursorPoint.Y,
         OnSelectTurma,
         cdsFichaIndividualNR_ANOSEMESTRE.AsInteger,
         cdsFichaIndividualCD_DISCIPLINA.AsInteger,
         cdsFichaIndividualCD_CURSO.AsString,
         cdsFichaIndividualCD_TURMA.AsString,
         cdsFichaIndividualCD_TURMA_NOVA.AsString,
         (cdsFichaIndividualSN_OPTATIVA.AsInteger=1)
         );
   end;
end;

procedure TfrmTrocaTurmaDetalhesAluno.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F12 then
   begin
      ModalResult := mrOk;
      CloseModal;
   end;
end;

procedure TfrmTrocaTurmaDetalhesAluno.OnSelectTurma(const TurmaId: AnsiString);
begin
   cdsFichaIndividual.Edit;
   cdsFichaIndividualCD_TURMA_NOVA.AsString := TurmaId;
   cdsFichaIndividual.Post;
end;

class procedure TfrmTrocaTurmaDetalhesAluno.PreparaFichaIndividual(
  const AnoSemestre: Word; const CursoId, TurmaId, TurmaDestId: AnsiString);
const
   SFilterAlunoFmt = 'CD_PESSOA = %d';
begin
   if frmTrocaTurmaDetalhesAluno = nil then
      Application.CreateForm(TfrmTrocaTurmaDetalhesAluno, frmTrocaTurmaDetalhesAluno);

   with frmTrocaTurmaDetalhesAluno do
   begin

      if cdsFichaIndividual.Active then
      begin
         if (AnoSemestre <> cdsFichaIndividual.Params.ParamByName('NR_ANOSEMESTRE').AsInteger) or
            (CursoId <> cdsFichaIndividual.Params.ParamByName('CD_CURSO').AsString) or
            (TurmaId <> cdsFichaIndividual.Params.ParamByName('CD_TURMA').AsString) or
            (TurmaDestId <> cdsFichaIndividual.Params.ParamByName('CD_TURMA_DESTINO').AsString) then
         begin
            cdsFichaIndividual.Close;
         end;         
      end;

      if not cdsFichaIndividual.Active then
      begin
         cdsFichaIndividual.Params.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
         cdsFichaIndividual.Params.ParamByName('CD_CURSO').AsString := CursoId;
         cdsFichaIndividual.Params.ParamByName('CD_TURMA').AsString := TurmaId;
         cdsFichaIndividual.Params.ParamByName('CD_TURMA_DESTINO').AsString := TurmaDestId;
         cdsFichaIndividual.Open;

         while not cdsFichaIndividual.Eof do
         begin
            cdsFichaIndividual.Edit;
            cdsFichaIndividualDS_ACAO.AsString := 'Manter na turma atual';
            cdsFichaIndividual.Next;
         end;

         if cdsFichaIndividual.State = dsEdit then
         begin
            cdsFichaIndividual.Post;
         end;
      end;
   end;
end;

class function TfrmTrocaTurmaDetalhesAluno.ShowFichaIndividual(
  const AnoSemestre: Word; const CursoId, TurmaId, TurmaDestId: AnsiString;
  const PessoaId: Cardinal): TModalResult;
const
   SFilterAlunoFmt = 'CD_PESSOA = %d';
begin
   PreparaFichaIndividual(
      AnoSemestre, CursoId, TurmaId, TurmaDestId);

   frmTrocaTurmaDetalhesAluno.cdsFichaIndividual.Filter := Format(SFilterAlunoFmt, [PessoaId]);

   Result := frmTrocaTurmaDetalhesAluno.ShowModal;
end;

end.
