unit uEquivalencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Db, ZConnection, Grids, DBGrids, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, ToolWin,
  ImgList, Menus, Variants, ZDbcIntfs, UZDbcFuncs, uFSelecionarTurma;

type
  TfrmEquivalencias = class(TForm)
    Panel3: TPanel;
    tblMatriculas: TUMZQuery;
    tblMatriculasCodigoAluno: TIntegerField;
    tblMatriculasTurma: TStringField;
    tblMatriculasAnoSemestre: TSmallintField;
    tblMatriculasDataEmissao: TDateTimeField;
    tblMatriculasUsuario: TStringField;
    tblMatriculasPlanoPagamento: TIntegerField;
    tblMatriculasSituacao: TSmallintField;
    tblMatriculasDataSaida: TDateTimeField;
    tblMatriculasPlanoDesconto: TIntegerField;
    tblMatriculasNome: TStringField;
    tblMatriculasQualSituacao: TStringField;
    tblMatriculasTurmaDependencia: TStringField;
    tblMatriculasTurmaCalc: TStringField;
    tblMatriculasSituacaoEscolar: TSmallintField;
    tblMatriculasDataEntrada: TDateTimeField;
    tblMatriculasSituacaoEsc: TStringField;
    tblMatriculasCurso: TStringField;
    dtcMatriculas: TDataSource;
    grd: TDBGrid;
    tblEquiv: TUMZQuery;
    tblDiscEquiv: TUMZQuery;
    dsEquiv: TDataSource;
    dsDiscEquiv: TDataSource;
    tblEquivCodigoAluno: TIntegerField;
    tblEquivCurso: TStringField;
    tblEquivSerie: TSmallintField;
    tblEquivNota: TFloatField;
    tblEquivDescricao: TStringField;
    tblDiscEquivEq_Instituicao: TStringField;
    tblDiscEquivEq_Curso: TStringField;
    tblDiscEquivEq_AnoSemestre: TSmallintField;
    tblDiscEquivEq_Nota: TFloatField;
    qAtualizaNota: TUMZQuery;
    tblDiscEquivCodigoEquivalencias: TIntegerField;
    tblDiscEquivCodigoAluno: TIntegerField;
    tblDiscEquivCurso: TStringField;
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    grdDisc: TDBGrid;
    Panel5: TPanel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnRegistrarEquivalencia: TToolButton;
    btnLancarNota: TToolButton;
    btnEliminarEquivalencia: TToolButton;
    btnBuscarAluno: TToolButton;
    btnBuscarTurma: TToolButton;
    btnFechar: TToolButton;
    ImageList1: TImageList;
    Bevel7: TBevel;
    pmQtdMatriculas: TPopupMenu;
    pmQtdEquiv: TPopupMenu;
    pmQtdDiscEquiv: TPopupMenu;
    btnAlterar: TToolButton;
    tblDiscEquiveq_ch: TFloatField;
    tblMatriculascd_grade: TLargeintField;
    tblMatriculasnr_anosem_grade: TLargeintField;
    tblMatriculascd_curso: TStringField;
    tblDiscEquivcd_professor: TIntegerField;
    tblDiscEquivds_conceito: TStringField;
    tblEquivds_conceito: TStringField;
    pnMove: TPanel;
    pnDivisaoH: TPanel;
    tblEquivFrequencia: TFloatField;
    tblDiscEquivEq_Frequencia: TFloatField;
    tblEquivdisciplina: TIntegerField;
    tblDiscEquivdisciplina: TIntegerField;
    tblDiscEquiveq_equivalencia: TFloatField;
    btnObservacoes: TToolButton;
    qrySituacoes: TUMZQuery;
    qrySituacoescd_situacao: TIntegerField;
    qrySituacoesds_situacao: TStringField;
    tblDiscEquivcd_situacao: TIntegerField;
    tblDiscEquivdescSituacao: TStringField;
    tblDiscEquiveq_disciplina: TMemoField;
    procedure tblDiscEquiveq_disciplinaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure grdCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure tblMatriculasAfterOpen(DataSet: TDataSet);
    procedure pnDivisaoHMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnDivisaoHMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnDivisaoHMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnMoveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnMoveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnBuscarTurmaClick(Sender: TObject);
    procedure btnBuscarAlunoClick(Sender: TObject);
    procedure FiltraTurmas;
    procedure FiltraAlunos;
    procedure FormDestroy(Sender: TObject);
    procedure btnRegistrarEquivalenciaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEliminarEquivalenciaClick(Sender: TObject);
    procedure btnLancarNotaClick(Sender: TObject);
    Procedure AtualizaEquiv;
    procedure grdDiscDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTitleClick(Column: TColumn);
    procedure dtcMatriculasDataChange(Sender: TObject; Field: TField);
    procedure dsEquivDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmQtdMatriculasPopup(Sender: TObject);
    procedure pmQtdEquivPopup(Sender: TObject);
    procedure pmQtdDiscEquivPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  strict private
      resultado_filtro_turma : TResultadoFiltroTurma;

  private
    { Private declarations }
    FBloqueiaCreditosAlunosFIES: Boolean;
    mouseInicial: integer;
    podeRedimensionar: boolean;
    listagemRedimensionando: boolean;
    codCursoSelecionado: String;
    codGrade: integer;
  public
    lngCodigoAluno : Longint;
    procedure registrarFichaIndividual(sNota: string; sConceito: string; sFrequencia: string; sCargaHoraria: string = ''; sSituacao: string = '12');
    { Public declarations }
  end;

var
  frmEquivalencias: TfrmEquivalencias;
  sInstituicao,
  sCurso : String;
  

implementation

uses uCadEquiv, uNotaDiscEquiv, uFSelecionarPessoa, uDM, uUsuario, Main,
  UFRegistraEliminEqui, UFHistoricoEliminEqui;

{$R *.DFM}

procedure TfrmEquivalencias.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

procedure TfrmEquivalencias.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmEquivalencias.btnBuscarTurmaClick(Sender: TObject);
begin
  resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);

  if not resultado_filtro_turma.filtrado then Exit;

  FiltraTurmas;

  sInstituicao := '';
  sCurso := '';
  
end;

procedure TfrmEquivalencias.btnBuscarAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if not resultado_filtro.filtrado then Exit;
  lngCodigoAluno := resultado_filtro.cd_pessoa;
  FiltraAlunos;

  sInstituicao := '';
  sCurso := '';
end;

procedure TfrmEquivalencias.FiltraAlunos;
begin
  tblMatriculas.Close;
  tblMatriculas.SQL.Clear;
  tblMatriculas.SQL.Text :=
    ' select Matriculas.*, Pessoas.nm_pessoa as nome, matriculas_curso.cd_grade, matriculas_curso.nr_anosem_grade,matriculas_curso.cd_curso  ' +
    ' FROM Matriculas INNER JOIN Pessoas ON (Matriculas.CodigoAluno = Pessoas.cd_pessoa) ' +
    ' INNER JOIN matriculas_curso ON (Matriculas.cd_matricula_curso = matriculas_curso.cd_matricula_curso) ' +
    ' WHERE Matriculas.CodigoAluno = :Codigo ' +
    ' ORDER BY Matriculas.anosemestre DESC ';
  tblMatriculas.ParamByName('Codigo').AsInteger := lngCodigoAluno;
  tblMatriculas.Open;
end;

procedure TfrmEquivalencias.FiltraTurmas;
begin
  tblMatriculas.Close;
  tblMatriculas.SQL.Clear;
  tblMatriculas.SQL.Text :=
    ' SELECT Matriculas.*, Pessoas.nm_pessoa as Nome, matriculas_curso.cd_grade, matriculas_curso.nr_anosem_grade, matriculas_curso.cd_curso ' +
    ' FROM Matriculas ' +
    ' INNER JOIN Pessoas ON  (Matriculas.CodigoAluno = Pessoas.cd_pessoa) ' +
    ' INNER JOIN matriculas_curso ON (Matriculas.cd_matricula_curso = matriculas_curso.cd_matricula_curso) '+
    '  WHERE (Matriculas.Turma = :Turma) and (AnoSemestre = :AnoSemestre) ' +
    ' ORDER BY Pessoas.nm_pessoa ';

  tblMatriculas.ParamByName('Turma').AsString := resultado_filtro_turma.cd_turma;
  tblMatriculas.ParamByName('AnoSemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;
  
  tblMatriculas.Open;

end;


procedure TfrmEquivalencias.FormDestroy(Sender: TObject);
begin
  frmEquivalencias := nil;
end;

procedure TfrmEquivalencias.btnRegistrarEquivalenciaClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 1010, npIncluir, True ) then Exit;

  try
    Application.CreateForm(TfrmCadEquiv, frmCadEquiv);
    frmCadEquiv.Estado := Inclusao;

    // Montar a grade que será apresentada para seleção da disciplina equivalente.
    // A grade será montada de acordo com a matrícula do curso do aluno

    if(DM.db.Protocol = DB_PROTOCOL_MYSQL)then
    begin
       frmCadEquiv.tblGrade.Close();
       frmCadEquiv.tblGrade.SQL.Text :=
            '    SELECT                                     '+
            '       G.CD_CURSO AS CURSO,                    '+
            '       GD.CD_DISCIPLINA AS DISCIPLINA,         '+
            '	     GD.NR_SERIE AS SERIE,                   '+
            '       GD.NR_AULAS AS NUMEROAULAS,             '+
            '       GD.VL_VALOR AS VALOR,                   '+
            '       CAST(CONCAT(                            '+
            '   	  G.CD_CURSO,                             '+
            '		  LPAD(GD.NR_SERIE, 2, 0),                '+
            ' 		  LPAD(GD.CD_DISCIPLINA, 10, 0)) AS char) AS CODIGO,'+
            '       GD.SN_COMPARTILHADA,                    '+
            '	     GD.NR_CREDITOS_ACADEMICOS,              '+
            '    	  GD.CD_GRADE,                            '+
            '       GD.CD_DISCIPLINA_CATEGORIA AS CD_DISC_CATEGORIA, '+
            '       GD.NR_CARGA_HORARIA_PRATICA AS NR_CH_PRATICA,    '+
            '       GD.NR_CARGA_HORARIA_TEORICA AS NR_CH_TEORICA,    '+
            '       d.descricao,                                     '+
            '       cm.ds_curso                                      '+
            '    FROM                                                '+
            '       GRADES G                                         '+
            '       INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CURSO = G.CD_CURSO )'+
            '   	  INNER JOIN Disciplinas d ON (d.codigo = gd.CD_DISCIPLINA AND GD.cd_curso = d.Curso )        '+
            '   	  INNER JOIN cursos_mestre cm ON (cm.cd_curso = d.curso)                                      '+
            '    WHERE                                                                                          '+
            '        g.cd_grade = :cd_grade  AND                                                                '+
            '        g.cd_curso = :cd_curso                                                                     '+
            '    ORDER BY GD.NR_SERIE, d.Ordem                                                                     ';
    end
    else
    begin
       frmCadEquiv.tblGrade.Close();
       frmCadEquiv.tblGrade.SQL.Text :=
            ' SELECT                             '+
            '   G .CD_CURSO AS CURSO,            '+
            '   GD.CD_DISCIPLINA AS DISCIPLINA,  '+
            '   GD.NR_SERIE AS SERIE,            '+
            '   GD.NR_AULAS AS NUMEROAULAS,      '+
            '   GD.VL_VALOR AS VALOR,            '+
            '   CAST(                            '+
            '     G .CD_CURSO||                  '+
            '     LPAD(GD.NR_SERIE, 2, 0)||      '+
            '     LPAD(GD.CD_DISCIPLINA, 10, 0)  '+
            '     AS VARCHAR(255)                '+
            '   )AS CODIGO,                      '+
            '   GD.SN_COMPARTILHADA,             '+
            '   GD.NR_CREDITOS_ACADEMICOS,       '+
            '   GD.CD_GRADE,                     '+  
            '   GD.CD_DISCIPLINA_CATEGORIA AS CD_DISC_CATEGORIA,'+
            '   GD.NR_CARGA_HORARIA_PRATICA AS NR_CH_PRATICA,   '+
            '   GD.NR_CARGA_HORARIA_TEORICA AS NR_CH_TEORICA,   '+
            '   D.DESCRICAO,                                    '+
            '   CM.DS_CURSO                                     '+
            ' FROM                                              '+
            '   GRADES G                                        '+
            '   INNER JOIN GRADES_DISCIPLINAS GD ON(            '+
            '     GD.CD_GRADE = G .CD_GRADE                     '+
            '     AND GD.CD_CURSO = G .CD_CURSO                 '+
            '   )                                               '+
            '   INNER JOIN Disciplinas D ON(                    '+
            '     D .codigo = gd.CD_DISCIPLINA                  '+
            '     AND GD.cd_curso = D .Curso                    '+
            '   )                                               '+
            '   INNER JOIN cursos_mestre cm ON (                '+
            '     cm.cd_curso = d.curso                         '+
            '   )                                               '+
            ' WHERE                                             '+
            '   G .cd_grade = :cd_grade                         '+
            '   AND G .cd_curso = :cd_curso                     '+
            ' ORDER BY                                          '+
            '   GD.NR_SERIE,                                    '+
            '   D .Ordem                                        ';
    end;
    FrmCadEquiv.tblGrade.ParamByNAme('cd_grade').AsInteger := codGrade;
    frmCadEquiv.tblGrade.ParamByName('cd_curso').AsString := codCursoSelecionado;
    FrmCadEquiv.tblGrade.Open;

    // Carregar como padrão a mesma instituição e curso no próximo lançamento
    if sInstituicao <> '' then begin
       frmCadEquiv.eInstituicao.Text := sInstituicao;
    end;
    if sCurso <> '' then begin
       frmCadEquiv.eCurso.Text := sCurso;
    end;

    FrmCadEquiv.ShowModal;

    // Guardar a última instituição cadastrada
    sInstituicao := frmCadEquiv.eInstituicao.Text;
    sCurso := frmCadEquiv.eCurso.Text;
    
    FrmCadEquiv.tblGrade.Close();
  finally
    FreeAndNil( frmCadEquiv );
  end;
  AtualizaEquiv
end;

procedure TfrmEquivalencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmEquivalencias.FormCreate(Sender: TObject);
begin
   FBloqueiaCreditosAlunosFIES :=
      DM.variavel_parametro('BLOQUEAR.AJUSTE.CREDITO.FIES') = 'S';
end;

procedure TfrmEquivalencias.btnEliminarEquivalenciaClick(Sender: TObject);
const
   MsgFlags = MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2;
   STituloExclusao = 'Confirmação';
   SConfirmaExclusao = 'Deseja realmente eliminar a equivalência selecionada.'#13'Ao confirmar esta operação, quaisquer informações lançadas no histórico anterior do estudante serão removidas.'#13#13'Deseja prosseguir?';
   SSemDadosEquiv = 'Não foi possível recuperar as informações da equivalência.'#13'O processo será cancelado.';
var
   QuantEqui: integer;
begin
   if DM.UsuarioLogado.TemPermissao(1010, npExcluir, True) then
   begin
      if not tblDiscEquiv.IsEmpty then
      begin
         if MessageBox(Handle, SConfirmaExclusao, STituloExclusao, MsgFlags) = ID_YES then
         begin
            Application.CreateForm(TfRegistraEliminEqui, fRegistraEliminEqui);
            try
               fRegistraEliminEqui.Equivalencia :=
                  tblDiscEquivCodigoEquivalencias.AsInteger;
                  
               if fRegistraEliminEqui.CarregaEquivalencia then
               begin
                QuantEqui := tblDiscEquiv.RecordCount;
                fRegistraEliminEqui.SetEquiDisciplina(tblEquivdisciplina.AsInteger);
                fRegistraEliminEqui.SetTurmaMatricula(tblMatriculasTurma.AsString);
                fRegistraEliminEqui.SetAnoSemestre(tblDiscEquivEq_AnoSemestre.AsInteger);
                fRegistraEliminEqui.SetCurso(tblMatriculasCurso.AsString);
                fRegistraEliminEqui.ShowModal;

                AtualizaEquiv;
                { Checa se mudou o nº de equivalencias, ou seja se foi excluida uma na outra tela }
                if (QuantEqui <> tblDiscEquiv.RecordCount) then
                begin
                  if fHistoricoEliminEqui = nil then
                  begin
                     Application.CreateForm(TfHistoricoEliminEqui, fHistoricoEliminEqui);
                  end;
                  btnObservacoes.Marked :=
                     fHistoricoEliminEqui.ProcuraHistorico(tblMatriculasCodigoAluno.AsInteger);
                end;

               end
               else
               begin
                  MessageDlg(SSemDadosEquiv, mtError, [mbOK], -1);
               end;
            finally
               fRegistraEliminEqui := nil;
            end;
         end;
      end;
   end;
end;

procedure TfrmEquivalencias.btnLancarNotaClick(Sender: TObject);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Registrar histórico da disciplina implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível registrar disciplinas no histórico escolar do aluno.';
begin
  if not DM.UsuarioLogado.TemPermissao( 1010, npIncluir, True ) then Exit;

  // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
   // cadastrados no programa bolsa FIES está habilitada.
   // Se estiver habilitado, verifica se o usuário possui permissão para
   // alterar os créditos mesmo com o bloqueio habilitado.

   if DM.IsAlunoFIES(tblMatriculasCODIGOALUNO.AsInteger) and
      FBloqueiaCreditosAlunosFIES then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
      begin
         if MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
         begin
            Exit;
         end;
      end
      else
      begin
         MessageDlg(SMsgBloqueio, mtInformation, [mbOK], -1);
         Exit;
      end;
   end;

 try
   Application.CreateForm(TfrmNotaDiscEquiv, frmNotaDiscEquiv);
   frmNotaDiscEquiv.lbAluno.Caption := tblMatriculasNome.Value;
   frmNotaDiscEquiv.lbDisc.Caption := tblEquivDescricao.Value;
   if not (tblEquivNota.IsNull) then begin
      frmNotaDiscEquiv.eNota.Text := FloatToStr(tblEquivNota.Value);
   end;
   frmNotaDiscEquiv.eConceito.Text := tblEquivds_conceito.AsString;
   frmNotaDiscEquiv.eFrequencia.Text := tblEquivFrequencia.AsString;
   frmNotaDiscEquiv.lbTurmaMatricula.Caption := 'TURMA DE MATRÍCULA: ' +
      tblMatriculasTurma.AsString + ' (' + Copy(tblMatriculasAnoSemestre.AsString,1,4) + '/' + Copy(tblMatriculasAnoSemestre.AsString,5,1) + ')';

   if frmNotaDiscEquiv.ShowModal = mrOk Then
   Begin
      registrarFichaIndividual((frmNotaDiscEquiv.eNota.Text), Trim(frmNotaDiscEquiv.eConceito.Text), Trim(frmNotaDiscEquiv.eFrequencia.Text));
   End;
 finally
   frmNotaDiscEquiv.Free;
 end;
 AtualizaEquiv;
end;

procedure TfrmEquivalencias.btnObservacoesClick(Sender: TObject);
begin
   if btnObservacoes.Marked then
   begin
      fHistoricoEliminEqui.qryLogEquivalencias.Refresh;
      fHistoricoEliminEqui.ShowModal;
   end;
end;

Procedure TfrmEquivalencias.AtualizaEquiv;
Begin
   tblEquiv.Close();
   tblEquiv.Open();
End;

procedure TfrmEquivalencias.grdCellClick(Column: TColumn);
begin
   codGrade := tblMatriculascd_grade.AsInteger;
   codCursoSelecionado := tblMatriculascd_curso.AsString;
end;

procedure TfrmEquivalencias.grdDiscDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if (tblDiscEquivDisciplina.Value = tblEquivDisciplina.Value) AND
       (not tblDiscEquiv.Eof) then
    Begin
        grdDisc.Canvas.Font.Color := clBlack;
        grdDisc.Canvas.Brush.Color := clYellow;
        grdDisc.Canvas.FillRect(Rect);
        grdDisc.DefaultDrawDataCell(Rect, grdDisc.columns[datacol].field, State);
    end;
end;

procedure TfrmEquivalencias.grdTitleClick(Column: TColumn);
var
  strAux : String;
  n : Integer;
begin
  strAux := '';
  if tblMatriculas.Params.Count = 1 then
    FiltraAlunos
  else
    FiltraTurmas;
  case Column.Index of
    0 : strAux := 'ORDER BY Matriculas.CodigoAluno';
    1 : strAux := 'ORDER BY Pessoas.nm_pessoa';
    2 : strAux := 'ORDER BY Matriculas.Turma';
    4 : strAux := 'ORDER BY Matriculas.DataEmissao';
    9 : strAux := 'ORDER BY Matriculas.Situacao';
  end;


  for n := 0 to Column.Grid.FieldCount - 1 do
    if grd.Columns[n].Title.Font.Style = [fsUnderline] then
      grd.Columns[n].Title.Font.Style := [];

  grd.Columns[Column.Index].Title.Font.Style := [fsUnderline];

  tblMatriculas.Close;
  tblMatriculas.SQL.Add( strAux );
  tblMatriculas.Open;


end;

procedure TfrmEquivalencias.dtcMatriculasDataChange(Sender: TObject;
  Field: TField);
begin
   tblEquiv.Close();
   tblEquiv.Open();
end;

procedure TfrmEquivalencias.dsEquivDataChange(Sender: TObject;
  Field: TField);
begin
   tblDiscEquiv.Close;
   tblDiscEquiv.Open;
   tblDiscEquiv.Locate('disciplina', tblEquivdisciplina.AsInteger, []);
end;

procedure TfrmEquivalencias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F8 : btnBuscarAlunoClick( nil );
    VK_F11 : btnBuscarTurmaClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmEquivalencias.pmQtdMatriculasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblMatriculas, pmQtdMatriculas);

end;

{ Quando pressiona com o mouse.
}
procedure TfrmEquivalencias.pnDivisaoHMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Self.pnMoveMouseDown(Sender, Button, Shift, X, Y);
end;

{ Efetua o redimensionamento, evitando que exceda os limites da janela.
}
procedure TfrmEquivalencias.pnDivisaoHMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   //Evita que redimensione além dos limites da janela
   if (Self.grd.Height >= Self.Height - 18) and (Self.mouseInicial < Y) then begin
      Self.grd.Height := Self.Height - 18;
      Self.podeRedimensionar := false;
      Exit;
   end
   else
      Self.podeRedimensionar := true;
   //efetua o redimensionamento
   if Self.listagemRedimensionando and Self.podeRedimensionar then begin
      if Self.mouseInicial = 0 then
         Self.mouseInicial := Y + 1;
      Self.grd.Height := Self.grd.Height - (Self.mouseInicial - Y);
      Self.pnDivisaoH.Top := Self.grd.Height + Self.Bevel1.Height + Self.Panel3.Height;
   end;
end;

{ Quando pressiona com o mouse.
  Apenas indica que está redimensionando as colunas.
}
procedure TfrmEquivalencias.pnMoveMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Self.listagemRedimensionando := true;
   Self.podeRedimensionar := true;
end;

{ Efetua o redimensionamento evitando que ultrapasse os limites da janela.
}
procedure TfrmEquivalencias.pnMoveMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   //Evita que redimensione além dos limites da janela
   if (Self.Panel1.Width >= Self.Width - 18) and (Self.mouseInicial < X) then begin
      Self.Panel1.Width := Self.Width - 18;
      Self.podeRedimensionar := false;
      Exit;
   end
   else
      Self.podeRedimensionar := true;
   //efetua o redimensionamento
   if Self.listagemRedimensionando and Self.podeRedimensionar then begin
      if Self.mouseInicial = 0 then
         Self.mouseInicial := X + 1;
      Self.Panel1.Width := Self.Panel1.Width - (Self.mouseInicial - X);
      Self.pnMove.Left := Self.Panel1.Width;
   end;
end;

{ Tirou o dedão do mouse.
  Não pode redimensionar.
}
procedure TfrmEquivalencias.pnMoveMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Self.listagemRedimensionando := false;
   Self.mouseInicial := 0;
end;

procedure TfrmEquivalencias.registrarFichaIndividual(sNota: string; sConceito: string; sFrequencia: string; sCargaHoraria: string;sSituacao: string);
var
i: integer;
sAnoSemestre : String;
recalcularCreditosFinanceiros : Boolean;
begin      
      // Verificar se o aluno está CURSANDO a disciplina que está se registrando a equivalencia
      DM.tblFichaIndividual.Close;
      DM.tblFichaIndividual.SQL.Clear;
      DM.tblFichaIndividual.SQL.Add( 'SELECT * FROM fichaindividual WHERE ' );
      DM.tblFichaIndividual.SQL.Add( 'codigoaluno = :codigoaluno AND ' );
      DM.tblFichaIndividual.SQL.Add( 'curso = :curso AND ' );
      DM.tblFichaIndividual.SQL.Add( 'disciplina = :disciplina AND ' );
      DM.tblFichaIndividual.SQL.Add( 'anosemestre = :anosemestre AND ' );
      DM.tblFichaIndividual.SQL.Add( 'situacao = :situacao' );

      DM.tblFichaIndividual.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      DM.tblFichaIndividual.ParamByName('curso').AsString := tblEquivCurso.AsString;
      DM.tblFichaIndividual.ParamByName('disciplina').AsInteger := tblEquivDisciplina.AsInteger;
      DM.tblFichaIndividual.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      DM.tblFichaIndividual.ParamByName('situacao').AsInteger := 1;
      DM.tblFichaIndividual.Open;

      // recalcular o valor dos créditos financeiros do aluno SOMENTE SE O ALUNO ESTIVER CURSANDO A DISCIPLINA NO ANOSEMESTRE ATUAL
      if not DM.tblFichaIndividual.Eof then
      begin
         recalcularCreditosFinanceiros := True;
      end else begin
         recalcularCreditosFinanceiros := False;
      end;

      // Pegar o anosemestre da tela de Registro de Equivalencia (caso esteja lançando no registro)
      // Ou da tabela, caso esteja usando o botão Lançar Nota
      
      if frmCadEquiv = nil then
         sAnoSemestre := tblDiscEquivEq_AnoSemestre.AsString
      else
         sAnoSemestre := frmCadEquiv.eAnoSemestre.Text; 

      qAtualizaNota.SQL.Clear;
      qAtualizaNota.SQL.Add('Update Equivalencias SET Nota = :Nota, ds_conceito = :conceito, frequencia = :frequencia ');
      qAtualizaNota.SQL.Add('WHERE CodigoAluno = :CodigoAluno');
      qAtualizaNota.SQL.Add('AND Disciplina = :Disciplina');
      qAtualizaNota.SQL.Add('AND Curso = :CURSO');

      qAtualizaNota.ParamByName('CodigoAluno').Value := tblEquivCodigoAluno.Value;
      qAtualizaNota.ParambyName('Disciplina').Value := tblEquivDisciplina.Value;
      qAtualizaNota.ParamByName('Curso').Value := tblEquivCurso.Value;
      if (sNota = '') then begin
         qAtualizaNota.ParamByName('Nota').Clear();
         qAtualizaNota.ParamByName('Nota').DataType := ftFloat;
      end
      else begin
         qAtualizaNota.ParamByName('Nota').Value := RC_STrToFloat(sNota);
      end;
      qAtualizaNota.ParamByName('conceito').Value := sConceito;
      qAtualizaNota.ParamByName('frequencia').Value := sFrequencia;
      qAtualizaNota.ExecSQL;

      { Atualizar a FichaIndividual }

      // Verificar se o aluno tem a disciplina lançada no anosemestre que será registrado
                                            
      DM.tblFichaIndividual.Close;
      DM.tblFichaIndividual.SQL.Clear;
      DM.tblFichaIndividual.SQL.Add( 'select * from FichaIndividual where' );
      DM.tblFichaIndividual.SQL.Add( 'codigoaluno = :CodigoAluno and' );
      DM.tblFichaIndividual.SQL.Add( 'curso = :curso and' );
      DM.tblFichaIndividual.SQL.Add( 'disciplina = :disciplina and ' );
      DM.tblFichaIndividual.SQL.Add( ' anosemestre = :anosemestre ');

      DM.tblFichaIndividual.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      DM.tblFichaIndividual.ParamByName('curso').AsString := tblEquivCurso.AsString;
      DM.tblFichaIndividual.ParamByName('disciplina').AsInteger := tblEquivDisciplina.AsInteger;
      DM.tblFichaIndividual.ParamByName('anosemestre').AsString := sAnoSemestre;

      DM.tblFichaIndividual.Open;

      if not Dm.tblFichaIndividual.Eof then begin

         if DM.isSituacaoValida([0,12], DM.tblFichaIndividualSituacao.AsInteger) then
         Begin
             Mensagem('O aluno ja tem uma Aprovação nesta disciplina. Não será possível registrar esta equivalência.', 'Informação', MB_OK + MB_ICONINFORMATION);
             Exit;
         End;

         DM.tblFichaIndividual.Edit;

      end else begin
         // O aluno não tinha a disciplina no anosemestre que irá registrar. Verificar se tem a disciplina em outro ano/semestre

          DM.tblFichaIndividual.Close;
          DM.tblFichaIndividual.SQL.Clear;
          DM.tblFichaIndividual.SQL.Add( 'select * from FichaIndividual where' );
          DM.tblFichaIndividual.SQL.Add( 'codigoaluno = :CodigoAluno and' );
          DM.tblFichaIndividual.SQL.Add( 'curso = :curso and' );
          DM.tblFichaIndividual.SQL.Add( 'disciplina = :disciplina ' );

          DM.tblFichaIndividual.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
          DM.tblFichaIndividual.ParamByName('curso').AsString := tblEquivCurso.AsString;
          DM.tblFichaIndividual.ParamByName('disciplina').AsInteger := tblEquivDisciplina.AsInteger;
          DM.tblFichaIndividual.Open;


          if DM.tblFichaIndividual.Eof then begin
             // Não tem esta disciplina, incluir o registro

             DM.tblFichaIndividual.Insert
          end  else begin
             { Verificar se a disciplina feita na instituição - está como aprovada }
             if DM.isSituacaoValida([0,12], DM.tblFichaIndividualSituacao.AsInteger) then begin
                Mensagem('O aluno ja tem uma Aprovação nesta disciplina.', 'Informação', MB_OK + MB_ICONINFORMATION);
                Exit;
             End;

             DM.tblFichaIndividual.Edit;
          end;

      end;

      if DM.tblFichaIndividual.State = dsEdit then begin
         // Registrar o log da mudança

         DM.setLog(1010, 'Alteracao', DM.tblFichaIndividualCodigoAluno.AsString + ';' +
                                      DM.tblFichaIndividualAnoSemestre.AsString + ';' +
                                      DM.tblFichaIndividualTurma.AsString + ';' +
                                      DM.tblFichaIndividualdisciplina.AsString,
                   dm.getColigadaByTurma(DM.tblFichaIndividualTurma.AsString, DM.tblFichaIndividualAnoSemestre.AsInteger), 'Registrado equivalência sobre esta disciplina'
         );


      end;


      // Abrir o parametro de avaliaçào para a turma matrícula:

      DM.tblAvaliacao.Close;
      DM.tblAvaliacao.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      DM.tblAvaliacao.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      DM.tblAvaliacao.Open;

      DM.DeptoCursoTurma(tblMatriculasAnoSemestre.AsInteger, tblMatriculasTurma.AsString);

      // CLAUDIONOR Esta tabela estava sendo aberta
      // DM.tblGrade.Close;
      // Dm.tblGrade.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      // Dm.tblGrade.ParamByName('Curso').AsString        := tblEquivCurso.AsString;
      // Dm.tblGrade.ParamByName('Serie').AsInteger       := tblEquivSerie.AsInteger;
      // Dm.tblGrade.ParamByName('Turno').AsString        := DM.tblDeptoCursoTurmaTurno.AsString;
      // Dm.tblGrade.ParamByName('Disciplina').AsInteger  := tblEquivDisciplina.AsInteger;
      // DM.tblGrade.Open;

      DM.tblFichaIndividualCodigoAluno.AsInteger := tblMatriculasCodigoAluno.AsInteger;
      DM.tblFichaIndividualTurma.AsString := 'HISTORICO';

      // O registro da equivalencia fica vinculada a uma turma matrícula do aluno.
      Dm.tblFichaIndividualTurmaMatricula.AsString := tblMatriculasTurma.AsString;

      if tblDiscEquiv.Locate('Disciplina', tblEquivDisciplina.AsInteger, [loCaseInsensitive]) then begin
         DM.tblFichaIndividualAnoSemestre.AsInteger := tblDiscEquivEq_AnoSemestre.AsInteger;
      end
      else begin
         DM.tblFichaIndividualAnoSemestre.AsInteger := tblMatriculasAnoSemestre.AsInteger;
      end;

      DM.tblFichaIndividualGrau.AsInteger := DM.tblDeptoCursoTurmaGrau.AsInteger;
      DM.tblFichaIndividualSerie.AsInteger := tblEquivSerie.AsInteger;

      DM.tblFichaIndividualMediaFinal.Value := RC_StrToFloat(sNota);
      DM.tblFichaIndividualfrequencia.Value := RC_StrToFloat(sFrequencia);
      if (sCargaHoraria <> '') then begin
         DM.tblFichaIndividualcarga_horaria.Value := RC_StrToFloat(sCargaHoraria);
      end;
      
      For i := 1 to 10 do
      Begin
         DM.tblFichaIndividual.FieldByName('nota' + InttoStr(i)).AsString := '';
         DM.tblFichaIndividual.FieldByName('falta' + InttoStr(i)).AsString := '';
      End;

      DM.tblFichaIndividualTotalFaltas.AsString:= '';

      DM.tblFichaIndividualAproveitamento.AsString := 'S';

      { Mudar Situação para Aproveitamento }
      DM.tblFichaIndividualSituacao.AsString := sSituacao;

      DM.tblFichaIndividualCodigoGrade.AsString := '';

      DM.tblFichaIndividualDisciplina.AsInteger := tblEquivDisciplina.AsInteger;

      DM.tblFichaIndividualCurso.AsString := tblEquivCurso.AsString;
      DM.tblFichaIndividualds_media.AsString := sConceito;
      DM.tblFichaIndividual.Post;

      // Chamar a função para recalcular os créditos financeiros
      if recalcularCreditosFinanceiros then
      begin
         DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger);
      end;
end;

procedure TfrmEquivalencias.tblDiscEquiveq_disciplinaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text := Copy(tblDiscEquiveq_disciplina.AsString, 1, 1000);
end;

procedure TfrmEquivalencias.tblMatriculasAfterOpen(DataSet: TDataSet);
begin
   if fHistoricoEliminEqui = nil then
   begin
      Application.CreateForm(TfHistoricoEliminEqui, fHistoricoEliminEqui);
   end;

   btnObservacoes.Marked :=
      fHistoricoEliminEqui.ProcuraHistorico(tblMatriculasCodigoAluno.AsInteger);

   codCursoSelecionado := tblMatriculascd_curso.AsString;
   codGrade := tblMatriculascd_grade.AsInteger;
end;

procedure TfrmEquivalencias.ToolButton2Click(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1010, npIncluir, True ) then Exit;

 try
   Application.CreateForm(TfrmNotaDiscEquiv, frmNotaDiscEquiv);
   frmNotaDiscEquiv.lbAluno.Caption := tblMatriculasNome.Value;
   frmNotaDiscEquiv.lbDisc.Caption := tblDiscEquivCurso.AsString + ' - ' +  tblDiscEquivEq_Disciplina.AsString;
   frmNotaDiscEquiv.eNota.OnKeyPress := nil;
   frmNotaDiscEquiv.eNota.Text := tblDiscEquivds_conceito.AsString;
   frmNotaDiscEquiv.lbTurmaMatricula.Caption := 'TURMA DE MATRÍCULA: ' +
      tblMatriculasTurma.AsString + ' (' + Copy(tblMatriculasAnoSemestre.AsString,1,4) + '/' + Copy(tblMatriculasAnoSemestre.AsString,5,1) + ')';

   frmNotaDiscEquiv.Label2.Caption := 'Conceito';

   if frmNotaDiscEquiv.ShowModal = mrOk Then
   Begin
      tblDiscEquiv.Edit;
      tblDiscEquivds_conceito.AsString := frmNotaDiscEquiv.eNota.Text;
      tblDiscEquiv.Post();
   End;
 finally
    frmNotaDiscEquiv.Free;
 end;
end;

procedure TfrmEquivalencias.pmQtdEquivPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblEquiv, pmQtdEquiv);

end;

procedure TfrmEquivalencias.pmQtdDiscEquivPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDiscEquiv, pmQtdDiscEquiv);

end;

procedure TfrmEquivalencias.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
  qrySituacoes.Open;
end;

procedure TfrmEquivalencias.btnAlterarClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 1010, npAlterar, True ) then Exit;

  if tblDiscEquiv.IsEmpty then Exit;

  try
    Application.CreateForm(TfrmCadEquiv, frmCadEquiv);
    frmCadEquiv.Estado := Alteracao;

    frmCadEquiv.CodigoEquiv := tblDiscEquivCodigoEquivalencias.AsInteger;

    frmCadEquiv.tblGrade.SQL.Text :=
       ' SELECT DISTINCT cursos_mestre.ds_curso, GradeCurricular.Disciplina, GradeCurricular.Serie, Disciplinas.Descricao, GradeCurricular.CURSO ' +
       ' FROM GradeCurricular, Disciplinas, cursos_mestre ' +
       ' WHERE GradeCurricular.Disciplina = Disciplinas.Codigo AND ' +
       ' GradeCurricular.Curso = Disciplinas.Curso AND GradeCurricular.Curso = :CURSO ' +
       ' AND cursos_mestre.CD_CURSO = Disciplinas.curso AND '+
       ' GradeCurricular.Disciplina = :DISCIPLINA AND GradeCurricular.Serie = :SERIE ' +
       ' ORDER BY Serie ';
    FrmCadEquiv.tblGrade.ParamByNAme('CURSO').AsString := tblMatriculasCurso.AsString;
    frmCadEquiv.tblGrade.ParamByName('DISCIPLINA').AsString := tblEquivDisciplina.AsString;
    frmCadEquiv.tblGrade.ParamByName('SERIE').AsString := tblEquivSerie.AsString;
    FrmCadEquiv.tblGrade.Open;

    frmCadEquiv.eInstituicao.Text := tblDiscEquivEq_Instituicao.AsString;
    frmCadEquiv.eCurso.Text := tblDiscEquivEq_Curso.AsString;
    frmCadEquiv.eDisciplina.Text := tblDiscEquivEq_Disciplina.AsString;
    frmCadEquiv.eAnoSemestre.Text := tblDiscEquivEq_AnoSemestre.AsString;
    frmCadEquiv.eCH.Text := tblDiscEquivEq_CH.AsString;
    frmCadEquiv.eNota.Text := tblDiscEquivEq_Nota.AsString;
    frmCadEquiv.eFrequencia.Text := tblDiscEquivEq_Frequencia.AsString;
    frmCadEquiv.eConteudoEquivalente.Text := tblDiscEquiveq_equivalencia.AsString;
    frmCadEquiv.eConceito.Text := tblDiscEquivds_conceito.AsString;

    if(tblDiscEquivcd_situacao.AsString > '0') then
    begin
      frmCadEquiv.cd_situacao := tblDiscEquivcd_situacao.AsString;
    end;

    FrmCadEquiv.ShowModal;
    FrmCadEquiv.tblGrade.Close;
  finally
    FrmCadEquiv.Free;
  end;
  AtualizaEquiv

end;

{ Tirou o dedão do mouse.
  Não pode redimensionar.
}
procedure TfrmEquivalencias.pnDivisaoHMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Self.pnMoveMouseUp(Sender, Button, Shift, X, Y);
end;

end.
