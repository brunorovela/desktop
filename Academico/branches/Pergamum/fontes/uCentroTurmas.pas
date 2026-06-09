unit uCentroTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, ZConnection, Grids, DBGrids, ImgList,
  ComCtrls, ToolWin, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmCentroTurmas = class(TForm)
    Panel3: TPanel;
    Bevel6: TBevel;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    qyTurmas: TUMZQuery;
    srcTurmas: TDataSource;
    DBGrid1: TDBGrid;
    qyTurmasdescricao: TStringField;
    qyTurmascodigo: TStringField;
    qyTurmasanosemestre: TSmallintField;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    Bevel3: TBevel;
    btnAddTurma: TToolButton;
    btnAddCurso: TToolButton;
    ToolButton5: TToolButton;
    btnDelTurma: TToolButton;
    btnFechar: TToolButton;
    qyTurmascd_centro: TLargeintField;
    qryDeleteApropriaTurma: TUMZQuery;
    qryUpdateMensTurma: TUMZQuery;
    qryReplaceApropiaTurma: TUMZQuery;
    qryUpdateMensCurso: TUMZQuery;
    qryDeleteApropriaCurso: TUMZQuery;
    qryReplaceApropriaCurso: TUMZQuery;
    qyTurmascd_coligada: TIntegerField;
    qyAux: TUMZQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDelTurmaClick(Sender: TObject);
    procedure btnAddTurmaClick(Sender: TObject);
    procedure btnAddCursoClick(Sender: TObject);
  private
    { Private declarations }

    procedure VincularTurma(CdTurma : String; CdAnoSemestre : Integer; CdCentro : Integer; CdColigada: Integer);
    procedure VincularCurso(CdCurso : String; CdAnoSemestre : Integer; CdCentro : Integer; CdColigada: Integer);
  public
    { Public declarations }
    class procedure AbrirTela(const cd_centro, cd_coligada_matriz: Integer);

  end;

implementation

{$R *.dfm}

uses uDM, uFSelecionarTurma, uFSelecionarCurso;

procedure TfrmCentroTurmas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCentroTurmas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caHide;
end;

procedure TfrmCentroTurmas.btnDelTurmaClick(Sender: TObject);
const
   SQL_DESVINCULAR_TURMA =
      ' UPDATE turmas SET cd_centro = NULL ' +
      ' WHERE codigo = :cd_turma AND anosemestre = :nr_anosemestre ';
   MSG_DESVINCULAR_TURMA =
      'Deseja desvincular a turma selecionada deste centro de custo?';
   MSG_DESVINCULAR_TURMAS =
      'Deseja desvincular as %d turmas selecionadas deste centro de custo?';
var
   sMsg : string;
   sChave : string;
   I, cd_coligada : Integer;
   qyDesvincularTurma : TUMZQuery;
begin
   // Informa que a Row atual, sempre estará selecionada!
   if ( qyTurmas.RecordCount > 0 ) then
   begin
      DBGrid1.SelectedRows.CurrentRowSelected := True;
   end;

   if DBGrid1.SelectedRows.Count > 0 then
   begin
      DM.CriarConsulta( qyDesvincularTurma );
      qyDesvincularTurma.SQL.Text := SQL_DESVINCULAR_TURMA;

      if ( DBGrid1.SelectedRows.Count = 1  ) then
      begin
         if ( Mensagem(MSG_DESVINCULAR_TURMA, 'Confirmação', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes ) then
         begin
            Exit;
         end;
      end else begin
         if ( Mensagem(Format( MSG_DESVINCULAR_TURMAS, [DBGrid1.SelectedRows.Count] ), 'Confirmação', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes ) then
         begin
            Exit;
         end;
      end;

      for I := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
         qyTurmas.GotoBookmark(Pointer(DBGrid1.SelectedRows.Items[I]));

         // Desvincular a turma do centro de custo;
         qyDesvincularTurma.ParamByName('cd_turma').AsString := qyTurmascodigo.AsString;
         qyDesvincularTurma.ParamByName('nr_anosemestre').AsInteger := qyTurmasanosemestre.AsInteger;

         sMsg := 'Desvinculou a turma "' + qyTurmascodigo.AsString + ' - ';
         sMsg := sMsg + Copy(qyTurmasanosemestre.AsString, 1, 4) + '/';
         sMsg := sMsg + Copy(qyTurmasanosemestre.AsString, 5, 1) + '" (Segundo campo cd_coligada_matriz)';

         sChave := qyTurmas.FieldByName('cd_centro').AsString + ';';
         sChave := sChave + qyTurmas.FieldByName('cd_coligada').AsString;
         cd_coligada := qyTurmas.FieldByName('cd_coligada').AsInteger;

         qyDesvincularTurma.ExecSQL;
         DM.setLog(2029, 'Exclusao', sChave, cd_coligada, sMsg);
      end; 

      FreeAndNil(qyDesvincularTurma);

      qyTurmas.Close();
      qyTurmas.Open();
   end;
end;

procedure TfrmCentroTurmas.VincularTurma(CdTurma: String; CdAnoSemestre,
  CdCentro: Integer; CdColigada: Integer);
Var
  sMsg, sChave : String;
begin
   // Vincular a Turma no Centro de Custo;

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add(
   'UPDATE                             ' +
   '   turmas t                        ' +
   'SET                                ' +
   '   t.cd_centro = :CdCentro         ' +
   'WHERE                              ' +
   '   t.codigo = :CdTurma AND         ' +
   '   t.cd_coligada = :CdColigada AND ' +
   '   t.anosemestre = :CdAnoSem       ');

   qyAux.ParamByName('CdTurma').AsString := CdTurma;
   qyAux.ParamByName('CdAnoSem').AsInteger := CdAnoSemestre;
   qyAux.ParamByName('CdCentro').AsInteger := CdCentro;
   qyAux.ParamByName('CdColigada').AsInteger := CdColigada;   
   qyAux.ExecSQL();

   sMsg := 'Vinculou a turma "' + Cdturma + ' - ';
   sMsg := sMsg + Copy(IntToStr(CdAnoSemestre), 1, 4) + '/';
   sMsg := sMsg + Copy(IntToStr(CdAnoSemestre), 5, 1) + '"';

   sChave := qyTurmas.ParamByName('cd_centro').AsString + ';';
   sChave := sChave + IntToStr(CdColigada);

   DM.setLog(2029, 'Inclusao', sChave, CdColigada, sMsg);

   qyTurmas.Close();
   qyTurmas.Open();

   // Arrumar os Centros Já Existentes
   qryUpdateMensTurma.ParamByName('CD_TURMA').AsString := CdTurma;
   qryUpdateMensTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := CdAnoSemestre;
   qryUpdateMensTurma.ExecSQL;

   qryDeleteApropriaTurma.ParamByName('CD_TURMA').AsString := CdTurma;
   qryDeleteApropriaTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := CdAnoSemestre;
   qryDeleteApropriaTurma.ExecSQL;
   
   qryReplaceApropiaTurma.ParamByName('CD_TURMA').AsString := CdTurma;
   qryReplaceApropiaTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := CdAnoSemestre;
   qryReplaceApropiaTurma.ExecSQL;
end;

procedure TfrmCentroTurmas.btnAddTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   // Adicionar somente uma turma
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      VincularTurma(resultado_filtro.cd_turma,
                    resultado_filtro.nr_anosemestre,
                    qyTurmas.ParamByName('cd_centro').AsInteger,
                    resultado_filtro.cd_coligada );
   end;
end;

procedure TfrmCentroTurmas.VincularCurso(CdCurso: String; CdAnoSemestre,
  CdCentro: Integer ; CdColigada: Integer);
Var
  sMsg, sChave : String;
begin
   // Vincular o Curso no Centro de Custo;

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add(
   'UPDATE                                ' +
   '   turmas t                           ' +
   'SET                                   ' +
   '   t.cd_centro = :CdCentro            ' +
   'WHERE                                 ' +
   '   t.curso = :CdCurso AND             ' +
   '   t.cd_coligada = :CdColigada AND    ' +
   '   t.anosemestre = :CdAnoSem          ');

   qyAux.ParamByName('CdCurso').AsString := CdCurso;
   qyAux.ParamByName('CdAnoSem').AsInteger := CdAnoSemestre;
   qyAux.ParamByName('CdCentro').AsInteger := CdCentro;
   qyAux.ParamByName('CdColigada').AsInteger := CdColigada;   
   qyAux.ExecSQL();

   sMsg := 'Vinculou o Curso "' + CdCurso + ' - ';
   sMsg := sMsg + Copy(IntToStr(CdAnoSemestre), 1, 4) + '/';
   sMsg := sMsg + Copy(IntToStr(CdAnoSemestre), 5, 1) + '"';

   sChave := qyTurmas.ParamByName('cd_centro').AsString + ';';
   sChave := sChave + IntToStr(CdColigada);

   DM.setLog(2029, 'Inclusao', sChave, CdColigada, sMsg);

   qyTurmas.Close();
   qyTurmas.Open();

   // Arrumar os Centros Já Existentes
   qryUpdateMensCurso.ParamByName('CD_CURSO').AsString := CdCurso;
   qryUpdateMensCurso.ParamByName('NR_ANOSEMESTRE').AsInteger := CdAnoSemestre;
   qryUpdateMensCurso.ExecSQL;
   
   qryDeleteApropriaCurso.ParamByName('CD_CURSO').AsString := CdCurso;
   qryDeleteApropriaCurso.ParamByName('NR_ANOSEMESTRE').AsInteger := CdAnoSemestre;
   qryDeleteApropriaCurso.ExecSQL;
   
   qryReplaceApropriaCurso.ParamByName('CD_CURSO').AsString := CdCurso;
   qryReplaceApropriaCurso.ParamByName('NR_ANOSEMESTRE').AsInteger := CdAnoSemestre;
   qryReplaceApropriaCurso.ExecSQL;
end;

class procedure TfrmCentroTurmas.AbrirTela(const cd_centro,
  cd_coligada_matriz: Integer);
var
   formulario: TfrmCentroTurmas;
begin
   Application.CreateForm( TfrmCentroTurmas, formulario );

   formulario.qyTurmas.SQL.Text := Format('SELECT '+
         'cm.ds_curso AS descricao, '+
	      't.codigo, t.anosemestre, t.cd_centro, t.cd_coligada '+
      'FROM '+
      	'turmas t '+
	      'INNER JOIN cursos_mestre cm ON ( cm.cd_curso = t.curso ) '+
         'INNER JOIN coligadas c ON ( c.cd_coligada = t.cd_coligada ) '+
      'WHERE '+
      	't.cd_centro = :cd_centro AND '+
         'c.cd_coligada IN (%s)'+
      'ORDER BY '+
      	'cm.DS_CURSO, '+
         't.codigo, '+
         't.anosemestre', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);

   formulario.qyTurmas.ParamByName('cd_centro').AsInteger := cd_centro;
   formulario.qyTurmas.Open;
   formulario.ShowModal();
end;

procedure TfrmCentroTurmas.btnAddCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      VincularCurso(resultado_filtro.cd_curso, resultado_filtro.nr_anosemestre,
                    qyTurmas.ParamByName('cd_centro').AsInteger, resultado_filtro.cd_coligada );

   end;

end;

end.

