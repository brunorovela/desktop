unit uBuscaDisciplina;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, Buttons, ToolWin, Grids, DBGrids,
   DB, ZConnection, uDM, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset;

const
   FILTRO_CURSO = 'CURSO';
   FILTRO_TURMA = 'TURMA';
   FILTRO_DISCI = 'DISCIPLINA';
   FILTRO_ANOSEM = 'ANOSEMESTRE';
   FILTRO_NOMEDISC = 'DESCDISC';

type
   TfBuscaDisciplina = class(TForm)
    FQyDisciplinasdisciplina: TIntegerField;
    FQyDisciplinasanosemestre: TSmallintField;
    FQyDisciplinasserie: TSmallintField;
    FQyDisciplinasturma: TStringField;
   public
      class function getFiltroDisciplina(AOwner: TComponent; var ASlFiltros: TStringList): boolean;
   strict private
      FSAnoSemestre: string;
      FSCurso: string;
      FSTurma: string;
      FSNomeDisc: string;
      FIDisciplina: integer;
      procedure filtra;
      function getAnoSemestreAtual: string;
   private
      property Curso: string read FSCurso;
      property Turma: string read FSTurma;
      property NomeDisc: string read FSNomeDisc;
      property Disciplina: integer read FIDisciplina;
      property AnoSemestre: string read FSAnoSemestre;
   published
      FPnTitulo: TPanel;
      FBvSep1: TBevel;
      FPnFiltros: TPanel;
      FLbAnoSem: TLabel;
      FLbCurso: TLabel;
      FLbTurma: TLabel;
      FMeAnoSem: TMaskEdit;
      FUdAnoSem: TUpDown;
      FEdCurso: TEdit;
      FEdTurma: TEdit;
      FBnCurso: TSpeedButton;
      FBnTurma: TSpeedButton;
      FBvSep2: TBevel;
      FPnOpcoes: TPanel;
      FBnSelecionar: TSpeedButton;
      FBnSair: TSpeedButton;
      FDgDisciplinas: TDBGrid;
      FQyDisciplinas: TUMZQuery;
      FDsDisciplinas: TDataSource;
      FQyDisciplinascurso: TStringField;
      FQyDisciplinasdescricao: TStringField;
      procedure inicializaFormulario(Sender: TObject);
      procedure incDecAnoSemestre(Sender: TObject; Button: TUDBtnType);
      procedure buscaCurso(Sender: TObject);
      procedure buscaTurma(Sender: TObject);
      procedure selecionaDisciplina(Sender: TObject);
      procedure fecha(Sender: TObject);
      procedure fechaJanela(Sender: TObject; var Action: TCloseAction);
      procedure processaTeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure selecionaCurso(Sender: TObject; var Key: Char);
      procedure selecionaTurma(Sender: TObject; var Key: Char);
      procedure confirmaSelecao(Sender: TObject; var Key: Char);
   end;

var
   fBuscaDisciplina: TfBuscaDisciplina;

implementation

uses
   uFSelecionarCurso, uFSelecionarTurma;

{$R *.dfm}

{ TfBuscaDisciplina }

{ Busca curso. }
procedure TfBuscaDisciplina.buscaCurso(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(Self.FMeAnoSem.Text));

   if resultado_filtro.filtrado then
   begin
      Self.FEdCurso.Text := resultado_filtro.cd_curso;
      Self.FMeAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
   Self.filtra;
end;

{ Busca turma. }
procedure TfBuscaDisciplina.buscaTurma(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(Self.FMeAnoSem.Text), -1, -1, Self.FEdCurso.Text);

   if resultado_filtro.filtrado then
   begin
      Self.FMeAnoSem.Text := IntToStr(resultado_filtro.nr_anosemestre);
      Self.FEdCurso.Text := resultado_filtro.cd_curso;
      Self.FEdTurma.Text := resultado_filtro.cd_turma;
   end;
   Self.filtra;
end;

procedure TfBuscaDisciplina.confirmaSelecao(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Self.selecionaDisciplina(nil);
   end;
end;

{ Efetua a busca SQL com os filtros do usuário. }
procedure TfBuscaDisciplina.fecha(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.CloseModal;
end;

procedure TfBuscaDisciplina.fechaJanela(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfBuscaDisciplina.filtra;
const
   SQL_ORIGINAL =
   'SELECT '+
      'gc.anosemestre, gc.curso, gc.disciplina, gc.serie, d.sigla, d.descricao, t.grau, gc.cd_grade, t.codigo turma '+
   'FROM '+
      'gradecurricular gc JOIN turmas t '+
         'ON(gc.anosemestre = t.anosemestre AND '+
             'gc.curso = t.curso AND '+
             'gc.serie = t.serie AND '+
             'gc.turno = t.turno AND '+
             'gc.cd_grade = t.cd_grade) '+
         'JOIN disciplinas d '+
            'ON(gc.disciplina = d.codigo AND '+
                'gc.curso = d.curso) '+
         'WHERE :filtros '+
         'ORDER BY d.ordem, d.descricao';
var
   sFiltros: string;
begin
   { Restaura o SQL original }
   Self.FQyDisciplinas.SQL.Text := SQL_ORIGINAL;
   { Utiliza filtro por ano/semestre }
   if Trim(Self.FMeAnoSem.Text) <> '' then
   begin
      sFiltros := 't.anosemestre = :anosemestre ';
   end;
   { Utiliza filtro por curso }
   if Trim(Self.FEdCurso.Text) <> '' then
   begin
      if sFiltros <> '' then
         AppendStr(sFiltros, 'AND t.curso = :curso ')
      else
         sFiltros := 'AND t.curso = :curso ';
   end;
   { Utiliza filtro por turma }
   if Trim(Self.FEdTurma.Text) <> '' then
   begin
      if sFiltros <> '' then
         AppendStr(sFiltros, 'AND t.codigo = :turma ')
      else
         sFiltros := 'AND t.codigo = :turma ';
   end;
   { Joga os filtros para o SQL }
   Self.FQyDisciplinas.SQL.Text :=
      StringReplace(Self.FQyDisciplinas.SQL.Text, ':filtros', sFiltros, [rfReplaceAll, rfIgnoreCase]);
   { Substituí os filtros }
   if Self.FQyDisciplinas.Params.FindParam('anosemestre') <> nil then
   begin
      Self.FQyDisciplinas.ParamByName('anosemestre').AsString := Self.FMeAnoSem.Text;
   end;
   if Self.FQyDisciplinas.Params.FindParam('curso') <> nil then
   begin
      Self.FQyDisciplinas.ParamByName('curso').AsString := Self.FEdCurso.Text;
   end;
   if Self.FQyDisciplinas.Params.FindParam('turma') <> nil then
   begin
      Self.FQyDisciplinas.ParamByName('turma').AsString := Self.FEdTurma.Text;
   end;
   Self.FQyDisciplinas.Open;
end;

function TfBuscaDisciplina.getAnoSemestreAtual: string;
var
   wAno, wMes, wDia: Word;
begin
   DecodeDate(Now, wAno, wMes, wDia);
   Result := IntToStr(wAno);
   if wMes < 7 then
      AppendStr(Result, '1')
   else
      AppendStr(Result, '2');
end;

class function TfBuscaDisciplina.getFiltroDisciplina(AOwner: TComponent;
  var ASlFiltros: TStringList): boolean;
begin
   fBuscaDisciplina := TfBuscaDisciplina.Create(AOwner);
   try
      case fBuscaDisciplina.ShowModal of
         mrOk:
         begin
            ASlFiltros.Values[FILTRO_CURSO] := fBuscaDisciplina.Curso;
            ASlFiltros.Values[FILTRO_TURMA] := fBuscaDisciplina.Turma;
            ASlFiltros.Values[FILTRO_DISCI] := IntToStr(fBuscaDisciplina.Disciplina);
            ASlFiltros.Values[FILTRO_ANOSEM] := fBuscaDisciplina.AnoSemestre;
            ASlFiltros.Values[FILTRO_NOMEDISC] := fBuscaDisciplina.NomeDisc;
            Result := True;
         end;
         mrCancel:
            Result := False;
      end;
   finally
      fBuscaDisciplina.Free;
   end;
end;

{ Incrementa/Decrementa o ano/semestre }
procedure TfBuscaDisciplina.incDecAnoSemestre(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
      Self.FMeAnoSem.Text := DM.incrementar_ano_semestre(Self.FMeAnoSem.Text)
   else
      Self.FMeAnoSem.Text := DM.decrementar_ano_semestre(Self.FMeAnoSem.Text);
   Self.filtra;
end;

procedure TfBuscaDisciplina.inicializaFormulario(Sender: TObject);
begin
   Self.FMeAnoSem.Text := Self.getAnoSemestreAtual;
   Self.filtra; 
end;

procedure TfBuscaDisciplina.processaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Self.fecha(nil);
end;

procedure TfBuscaDisciplina.selecionaCurso(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Self.filtra;
   end;
end;

procedure TfBuscaDisciplina.selecionaDisciplina(Sender: TObject);
begin
   Self.FQyDisciplinas.GotoBookmark(Pointer(Self.FDgDisciplinas.SelectedIndex));
   Self.FSAnoSemestre := Self.FQyDisciplinas.FieldByName('anosemestre').AsString;
   Self.FSCurso := Self.FQyDisciplinas.FieldByName('curso').AsString;
   Self.FSTurma := Self.FQyDisciplinas.FieldByName('turma').AsString;
   Self.FSNomeDisc := Self.FQyDisciplinas.FieldByName('descricao').AsString;
   Self.FIDisciplina := Self.FQyDisciplinas.FieldByName('disciplina').AsInteger;
   Self.ModalResult := mrOk;
   Self.CloseModal;
end;

procedure TfBuscaDisciplina.selecionaTurma(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Self.filtra;
   end;
end;

end.

