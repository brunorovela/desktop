unit UFHistoricoEliminEqui;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, UZDataset, Grids, DBGrids,
  ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, ImgList;

type
  TfHistoricoEliminEqui = class(TForm)
    pnlTitulo: TPanel;
    bvlSep1: TBevel;
    qryLogEquivalencias: TUMZReadOnlyQuery;
    qryLogEquivalenciasCD_EQUIVALENCIA_LOG: TLargeintField;
    qryLogEquivalenciasCD_USUARIO: TIntegerField;
    qryLogEquivalenciasDT_LOG: TDateTimeField;
    qryLogEquivalenciasCD_SITUACAO: TIntegerField;
    qryLogEquivalenciasCD_ALUNO: TIntegerField;
    qryLogEquivalenciasCD_DISCIPLINA: TIntegerField;
    qryLogEquivalenciasCD_CURSO: TStringField;
    qryLogEquivalenciasCD_PROFESSOR_EQ: TLargeintField;
    qryLogEquivalenciasNM_INSTITUICAO_EQ: TStringField;
    qryLogEquivalenciasNM_CURSO_EQ: TStringField;
    qryLogEquivalenciasNR_ANOSEMESTRE_EQ: TIntegerField;
    qryLogEquivalenciasVL_CARGA_HORARIA_EQ: TFloatField;
    qryLogEquivalenciasVL_NOTA_EQ: TFloatField;
    qryLogEquivalenciasVL_FREQUENCIA_EQ: TFloatField;
    qryLogEquivalenciasVL_CONTEUDO_EQ: TFloatField;
    qryLogEquivalenciasDS_CONCEITO_EQ: TStringField;
    qryLogEquivalenciasTP_ACAO: TStringField;
    qryLogEquivalenciasTX_MOTIVO: TMemoField;
    pnlListagem: TPanel;
    dsLogEquivalencias: TDataSource;
    dbgLogEquivalencias: TDBGrid;
    qryLogEquivalenciasNM_USUARIO: TStringField;
    qryLogEquivalenciasNM_PROFESSOR: TStringField;
    qryLogEquivalenciasDS_SITUACAO: TStringField;
    qryLogEquivalenciasDS_DISCIPLINA: TStringField;
    tlbOpcoes: TToolBar;
    btnSep1: TToolButton;
    btnFechar: TToolButton;
    btnSep2: TToolButton;
    bvlSep2: TBevel;
    bvlSep3: TBevel;
    pnlDados: TPanel;
    lblCurso: TLabel;
    dbeCurso: TDBEdit;
    lblDisciplina: TLabel;
    dbeDisciplina: TDBEdit;
    gbEquivalencia: TGroupBox;
    lblInstituicaoEq: TLabel;
    dbeInstituicaoEq: TDBEdit;
    lblAnoSemestreEq: TLabel;
    dbeAnoSemestreEq: TDBEdit;
    lblCursoEq: TLabel;
    dbeCursoEq: TDBEdit;
    lblDisciplinaEq: TLabel;
    dbeDisciplinaEq: TDBEdit;
    lblProfessorEq: TLabel;
    dbeProfessorEq: TDBEdit;
    lblSituacao: TLabel;
    dbeSituacao: TDBEdit;
    lblMotivo: TLabel;
    dbmMotivo: TDBMemo;
    ilOpcoes: TImageList;
    qryLogEquivalenciasnm_disciplina_eq: TMemoField;
    procedure qryLogEquivalenciasnm_disciplina_eqGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
      function ProcuraHistorico(const Aluno: Integer): Boolean;
  end;

var
  fHistoricoEliminEqui: TfHistoricoEliminEqui;

implementation

{$R *.dfm}

{ TfHistoricoEliminEqui }

procedure TfHistoricoEliminEqui.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfHistoricoEliminEqui.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfHistoricoEliminEqui.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
   begin
      btnFechar.Click;
   end;
end;

function TfHistoricoEliminEqui.ProcuraHistorico(const Aluno: Integer): Boolean;
begin
   if qryLogEquivalencias.Active then
   begin
      qryLogEquivalencias.Close;
   end;

   qryLogEquivalencias.ParamByName('CD_ALUNO').AsInteger := Aluno;
   qryLogEquivalencias.Open;

   Result := not qryLogEquivalencias.IsEmpty;
end;

procedure TfHistoricoEliminEqui.qryLogEquivalenciasnm_disciplina_eqGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy(qryLogEquivalenciasnm_disciplina_eq.AsString, 1, 1000);
end;

end.
