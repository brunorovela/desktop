unit UFTrocaTurmaTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, UZDataset, Grids, DBGrids, UZSortedGrid,
  StdCtrls, DBCtrls;

type
   TSelectTurmaEvent = procedure(const TurmaId: AnsiString) of object;

   TfrmTrocaTurmaTurmas = class(TForm)
      qryTurmas: TUMZReadOnlyQuery;
      qryTurmasCD_TURMA: TStringField;
      qryTurmasCD_DISCIPLINA: TIntegerField;
      qryTurmasCD_CURSO: TStringField;
      qryTurmasNR_ANOSEMESTRE: TSmallintField;
      dsTurmas: TDataSource;
      dbllTurmas: TDBLookupListBox;
      qryTurmasSN_OPTATIVA: TSmallintField;
      procedure dbllTurmasClick(Sender: TObject);
      procedure FormDeactivate(Sender: TObject);
   private
      FSelectedTurma: AnsiString;
      FSelectTurma: TSelectTurmaEvent;
      class var FInstance: TfrmTrocaTurmaTurmas;
      class function GetInstance: TfrmTrocaTurmaTurmas; static;
      class property Instance: TfrmTrocaTurmaTurmas read GetInstance;
      property SelectedTurma: AnsiString read FSelectedTurma write FSelectedTurma;
      property SelectTurma: TSelectTurmaEvent read FSelectTurma write FSelectTurma;
   public
      procedure CreateParams(var Params: TCreateParams); override;
      class procedure ShowTurmas(const Left, Top: Integer;
         OnSelectTurma: TSelectTurmaEvent; const AnoSemestre: Word;
         const DisciplinaId: Cardinal; const CursoId,
         TurmaAnteriorId, TurmaNovaId: AnsiString; const Optativa: Boolean); overload;
   end;

var
   frmTrocaTurmaTurmas: TfrmTrocaTurmaTurmas;

implementation

{$R *.dfm}

{ TfrmTrocaTurmaTurmas }

procedure TfrmTrocaTurmaTurmas.CreateParams(var Params: TCreateParams);
begin
   inherited CreateParams(Params);
   Params.Style := Params.Style or WS_THICKFRAME or WS_BORDER;
end;

procedure TfrmTrocaTurmaTurmas.dbllTurmasClick(Sender: TObject);
begin
   if Assigned(SelectTurma) then
      SelectTurma(qryTurmasCD_TURMA.AsString);
   Hide;
end;

procedure TfrmTrocaTurmaTurmas.FormDeactivate(Sender: TObject);
begin
   Hide;
end;

class function TfrmTrocaTurmaTurmas.GetInstance: TfrmTrocaTurmaTurmas;
begin
   if TfrmTrocaTurmaTurmas.FInstance = nil then
      TfrmTrocaTurmaTurmas.FInstance := TfrmTrocaTurmaTurmas.Create(Application);
   Result := TfrmTrocaTurmaTurmas.FInstance;
end;


class procedure TfrmTrocaTurmaTurmas.ShowTurmas(const Left, Top: Integer;
  OnSelectTurma: TSelectTurmaEvent; const AnoSemestre: Word;
  const DisciplinaId: Cardinal; const CursoId, TurmaAnteriorId,
  TurmaNovaId: AnsiString; const Optativa: Boolean);
var
   Right, Bottom: Integer;
begin
   TfrmTrocaTurmaTurmas.Instance.Left := Left;
   TfrmTrocaTurmaTurmas.Instance.Top := Top;
   Right := TfrmTrocaTurmaTurmas.Instance.Left + TfrmTrocaTurmaTurmas.Instance.Width;
   Bottom := TfrmTrocaTurmaTurmas.Instance.Top + TfrmTrocaTurmaTurmas.Instance.Height;

   if Right > Screen.Width then
      TfrmTrocaTurmaTurmas.Instance.Left :=
         Screen.Width - TfrmTrocaTurmaTurmas.Instance.Width;

   if Bottom > Screen.Height then
      TfrmTrocaTurmaTurmas.Instance.Top :=
         Screen.Height - TfrmTrocaTurmaTurmas.Instance.Height;

   TfrmTrocaTurmaTurmas.Instance.SelectTurma := OnSelectTurma;
   TfrmTrocaTurmaTurmas.Instance.SelectedTurma := TurmaNovaId;

   if TfrmTrocaTurmaTurmas.Instance.qryTurmas.Active then
      TfrmTrocaTurmaTurmas.Instance.qryTurmas.Close;

   TfrmTrocaTurmaTurmas.Instance.qryTurmas.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   TfrmTrocaTurmaTurmas.Instance.qryTurmas.ParamByName('CD_CURSO').AsString := CursoId;
   TfrmTrocaTurmaTurmas.Instance.qryTurmas.ParamByName('CD_DISCIPLINA').AsInteger := DisciplinaId;
   TfrmTrocaTurmaTurmas.Instance.qryTurmas.ParamByName('CD_TURMA').AsString := TurmaAnteriorId;
   TfrmTrocaTurmaTurmas.Instance.qryTurmas.Open;

   TfrmTrocaTurmaTurmas.Instance.qryTurmas.Filtered := False;

   if Optativa then
   begin
     TfrmTrocaTurmaTurmas.Instance.qryTurmas.Filter:='SN_OPTATIVA = 1';
     TfrmTrocaTurmaTurmas.Instance.qryTurmas.Filtered:=True;
   end;      
   
   TfrmTrocaTurmaTurmas.Instance.qryTurmas.Locate('CD_TURMA', TurmaNovaId, []);
   TfrmTrocaTurmaTurmas.Instance.Show;
end;

end.
