unit uFSelDisciplinaProfessor;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Buttons, StdCtrls, DB, ZConnection, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
   TfSelDisciplinaProfessor = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure Seleciona(Sender: TObject);
   published
      pnTitulo: TPanel;
      bvSep1: TBevel;
      pnFiltro: TPanel;
      lbAnoSem: TLabel;
      lbTurmaT: TLabel;
      edTurma: TEdit;
      bnSelTurma: TSpeedButton;
      bvSep2: TBevel;
      qyGrade: TUMZQuery;
      dsGrade: TDataSource;
      pnGeral: TPanel;
      dgGrade: TDBGrid;
      bnOK: TBitBtn;
      bnCancel: TBitBtn;
      lbGrade: TLabel;
      procedure FiltraTurma(Sender: TObject; var Key: Char);
      procedure SelecionaTurma(Sender: TObject);
   strict private
      procedure Atualiza;
   private
      constructor Create(AOwner: TComponent; const ASCodTurma,
         ASAnoSemestre: string);
   public
      class function SelecionaDisciplina(AOwner: TComponent; var ASCodTurma,
         ASSigla, ASDescricao, ASCurso: string; var AICodDisciplina, AICodProfessor: integer;
         const ASAnoSemestre: string): boolean;
   end;

var
   fSelDisciplinaProfessor: TfSelDisciplinaProfessor;

implementation

uses
   uFSelecionarTurma;

{$R *.dfm}

procedure TfSelDisciplinaProfessor.Atualiza;
begin
   Self.qyGrade.Close;
   Self.qyGrade.ParamByName('anosemestre').AsString :=
      StringReplace(Self.lbAnoSem.Caption, '/', '', []);
   Self.qyGrade.ParamByName('turma').AsString := Self.edTurma.Text;
   Self.qyGrade.Open;
   Self.lbGrade.Caption := 'Grade: ' + Self.qyGrade.FieldByName('cd_grade').AsString;
   Self.dgGrade.SetFocus;
end;

constructor TfSelDisciplinaProfessor.Create(AOwner: TComponent;
  const ASCodTurma, ASAnoSemestre: string);
begin
   inherited Create(AOwner);
   Self.lbAnoSem.Caption :=
      Copy(ASAnoSemestre, 1, 4) + '/' + Copy(ASAnoSemestre, 5, 1);
   Self.edTurma.Text := ASCodTurma;
end;

procedure TfSelDisciplinaProfessor.FiltraTurma(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      Self.Atualiza;
   end;
end;

procedure TfSelDisciplinaProfessor.FormShow(Sender: TObject);
begin
   Self.Atualiza;
end;

procedure TfSelDisciplinaProfessor.Seleciona(Sender: TObject);
begin
   Self.ModalResult := mrOk;
   Self.CloseModal;
end;

class function TfSelDisciplinaProfessor.SelecionaDisciplina(AOwner: TComponent;
  var ASCodTurma, ASSigla, ASDescricao, ASCurso: string; var AICodDisciplina, AICodProfessor: integer;
  const ASAnoSemestre: string): boolean;
begin
   if not Assigned(fSelDisciplinaProfessor) then
      fSelDisciplinaProfessor :=
         TfSelDisciplinaProfessor.Create(AOwner, ASCodTurma, ASAnoSemestre);
   try
      case fSelDisciplinaProfessor.ShowModal of
         mrOk:
         begin
            ASCodTurma := fSelDisciplinaProfessor.edTurma.Text;
            ASSigla := fSelDisciplinaProfessor.qyGrade.FieldByName('sigla').AsString;
            ASDescricao := fSelDisciplinaProfessor.qyGrade.FieldByName('descricao').AsString;
            ASCurso := fSelDisciplinaProfessor.qyGrade.FieldByName('curso').AsString;
            AICodDisciplina := fSelDisciplinaProfessor.qyGrade.FieldByName('disciplina').AsInteger;
            AICodProfessor := fSelDisciplinaProfessor.qyGrade.FieldByName('cd_pessoa').AsInteger;
            Result := true;
         end;
         mrCancel:
            Result := false;
      end;
   finally
      FreeAndNil(fSelDisciplinaProfessor);
   end;
end;

procedure TfSelDisciplinaProfessor.SelecionaTurma(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre]);

   if resultado_filtro.filtrado then
   begin
      Self.edTurma.Text := resultado_filtro.cd_turma;
      Self.lbAnoSem.Caption :=
         Copy(IntToStr( resultado_filtro.nr_anosemestre ), 1, 4) + '/' +
         Copy(IntToStr( resultado_filtro.nr_anosemestre ), 5, 1);
      Self.lbGrade.Caption := 'Grade: ' + IntToStr( resultado_filtro.cd_grade );
      Self.lbGrade.Hint := IntToStr( resultado_filtro.cd_grade );
      Self.Atualiza;
   end;
end;

end.

