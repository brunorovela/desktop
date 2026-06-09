unit uCursosMoodle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, Buttons,
  ImgList, uDM, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset ,General,
  UZSortedGrid, ZSqlUpdate;

type
  TfrmCursosMoodle = class(TForm)
    pTitulo: TPanel;
    pAbasCursosMoodle: TPanel;
    tsCursosMoodle: TTabSheet;
    tsVincularTurmasDisc: TTabSheet;
    pcCursosMoodle: TPageControl;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BtnLimparFiltros: TBitBtn;
    BtnFiltrarCursosMoodle: TBitBtn;
    ImageListBotoes: TImageList;
    qyMoodleCursos: TUMZQuery;
    dtcUnim_moodle_cursos: TDataSource;
    gridCursosMoodle: TZSortedGrid;
    Panel2: TPanel;
    lblCursoMoodleSelecionado: TLabel;
    lbl_ds_descricao: TLabel;
    lbl_ds_sigla: TLabel;
    lblSiglaCursoSelecionado: TLabel;
    Panel4: TPanel;
    toolCursosMoodle: TToolBar;
    btIncluirCursoMoodle: TToolButton;
    btAlterarCursoMoodle: TToolButton;
    btExcluirCursoMoodle: TToolButton;
    btFecharCursosMoodle: TToolButton;
    ImageList2: TImageList;
    toolTurmasDiscMoodle: TToolBar;
    btnIncluirTurmasDiscMoodle: TToolButton;
    btnExcluirTurmasDiscMoodle: TToolButton;
    ToolButton7: TToolButton;
    btnFechar: TToolButton;
    gridTurmasDiscMoodle: TZSortedGrid;
    qyMoodleTurmasDisc: TUMZQuery;
    dtcMoodleTurmasDisc: TDataSource;
    qyMoodleTurmasDisccd_curso_disciplina: TLargeintField;
    qyMoodleTurmasDisccd_moodle_curso: TLargeintField;
    qyMoodleTurmasDiscnr_anosemestre: TIntegerField;
    qyMoodleTurmasDisccd_curso: TStringField;
    qyMoodleTurmasDiscid_disciplina: TLargeintField;
    qyMoodleTurmasDisccd_turma: TStringField;
    qyMoodleTurmasDiscdescricao: TStringField;
    qyMoodleCursosCD_MOODLE_CURSO: TLargeintField;
    qyMoodleCursosDS_DESCRICAO: TStringField;
    qyMoodleCursosDS_SIGLA: TStringField;
    lbleDescricao: TLabeledEdit;
    lbleSigla: TLabeledEdit;
    qryCursoKonviva: TUMZQuery;
    qryCursoKonvivaCD_KONVIVA_CURSO: TStringField;
    qryCursoKonvivaCD_MOODLE_CURSO: TLargeintField;
    qryCursoKonvivaDT_ALTERACAO: TDateTimeField;
    updCursoKonviva: TZUpdateSQL;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirTurmasDiscMoodleClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirTurmasDiscMoodleClick(Sender: TObject);
    procedure BtnFiltrarCursosMoodleClick(Sender: TObject);
    procedure pcCursosMoodleChange(Sender: TObject);
    procedure btExcluirCursoMoodleClick(Sender: TObject);
    procedure btIncluirCursoMoodleClick(Sender: TObject);
    procedure btAlterarCursoMoodleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure btFecharCursosMoodleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCursosMoodle: TfrmCursosMoodle;

implementation

uses
 uIncluirCursosMoodle, uIncluirTurmasDisciplinasMoodle, uUsuario;
{$R *.dfm}

procedure TfrmCursosMoodle.BtnFiltrarCursosMoodleClick(Sender: TObject);
const
   S_SQL_OP = ' AND ';
   S_SQL_CURSOS = 'SELECT CD_MOODLE_CURSO, DS_DESCRICAO, DS_SIGLA FROM UNIM_MOODLE_CURSOS';
   S_SQL_CURSOS_FILTRO = S_SQL_CURSOS + ' WHERE %s';
   S_SQL_FILTRO_DESC = 'DS_DESCRICAO LIKE :DS_DESCRICAO';
   S_SQL_FILTRO_SIGLA = 'DS_SIGLA LIKE :DS_SIGLA';
   S_SQL_FILTRO_LIKE = '%%%s%%';
var
   S, SQL, Filters: AnsiString;
   I: Integer;
   Params: TParams;
begin
   S := lbleDescricao.Text + lbleSigla.Text;

   if Trim(S) <> EmptyStr then
   begin
      SQL := S_SQL_CURSOS_FILTRO;

      Params := TParams.Create;
      try

         Filters := EmptyStr;

         if Trim(lbleDescricao.Text) <> EmptyStr then
         begin
            Filters := S_SQL_FILTRO_DESC;
            Params.CreateParam(ftUnknown, 'DS_DESCRICAO', ptUnknown).AsString :=
               Format(S_SQL_FILTRO_LIKE, [Trim(lbleDescricao.Text)]);
         end;

         if Trim(lbleSigla.Text) <> EmptyStr then
         begin
            if Filters <> EmptyStr then
               Filters := Filters + S_SQL_OP;
            Filters := Filters + S_SQL_FILTRO_SIGLA;
            
            Params.CreateParam(ftUnknown, 'DS_SIGLA', ptUnknown).AsString :=
               Format(S_SQL_FILTRO_LIKE, [lbleSigla.Text]);
         end;

         qyMoodleCursos.Close;
         qyMoodleCursos.SQL.Text := Format(S_SQL_CURSOS_FILTRO, [Filters]);

         for I := 0 to Params.Count - 1 do
            qyMoodleCursos.ParamByName(Params.Items[I].Name).Value := Params.Items[I].Value;

         qyMoodleCursos.Open;
         qyMoodleCursos.First;

      finally
         FreeAndNil(Params);
      end;      
   end
   else
   begin
      qyMoodleCursos.Close;
      qyMoodleCursos.SQL.Text := S_SQL_CURSOS;
      qyMoodleCursos.Open;
   end;
   
end;

procedure TfrmCursosMoodle.btnIncluirTurmasDiscMoodleClick(Sender: TObject);
var
   frm : TfrmIncluirTurmasDisciplinaMoodle;
begin
   frm := TfrmIncluirTurmasDisciplinaMoodle.Create( frmCursosMoodle );
   if  frm.showModal = mrOK then
   begin
       qyMoodleTurmasDisc.Refresh;
   end;
end;

procedure TfrmCursosMoodle.BtnLimparFiltrosClick(Sender: TObject);
begin
   lbleDescricao.Clear;
   lbleSigla.Clear;
end;

procedure TfrmCursosMoodle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   qyMoodleCursos.Close();
   qyMoodleCursos.Free();
end;

procedure TfrmCursosMoodle.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ( pcCursosMoodle.ActivePage = tsCursosMoodle ) then
  begin
     case Key of
         VK_F2: begin
            btIncluirCursoMoodleClick(nil);
         end;
         VK_F3: begin
            btAlterarCursoMoodleClick(nil);
         end;
         VK_F9: begin
            btExcluirCursoMoodleClick(nil);
         end;
         VK_F12: begin
            Close();
         end;
     end;
  end;

  if ( pcCursosMoodle.ActivePage = tsVincularTurmasDisc ) then
  begin
     case Key of
         VK_F2: begin
            btnIncluirTurmasDiscMoodleClick(nil);
         end;
         VK_F9: begin
            btnExcluirTurmasDiscMoodleClick(nil);
         end;
         VK_F12: begin
            Close();
         end;
     end;
  end;
end;

procedure TfrmCursosMoodle.FormShow(Sender: TObject);

begin
   btIncluirCursoMoodle.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CursosMoodle', npIncluir, false);
   btAlterarCursoMoodle.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CursosMoodle', npAlterar, false);
   btExcluirCursoMoodle.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CursosMoodle', npExcluir, false);

   btnIncluirTurmasDiscMoodle.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CursosMoodle', npIncluir, false);
   btnExcluirTurmasDiscMoodle.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.CursosMoodle', npExcluir, false);

   pcCursosMoodle.ActivePage := tsCursosMoodle;
   qyMoodleCursos.Close();
   qyMoodleCursos.Open();
   qyMoodleCursos.First();
   qryCursoKonviva.Open;
end;

procedure TfrmCursosMoodle.pcCursosMoodleChange(Sender: TObject);
var
   sAux, descricaoCursoSel, siglaCursoSel : String;
begin
   qyMoodleTurmasDisc.Close();
   qyMoodleTurmasDisc.Open();

   if ( not qyMoodleCursoscd_moodle_curso.IsNull )then
   begin
      if pcCursosMoodle.ActivePage = tsVincularTurmasDisc then
      begin
         descricaoCursoSel := qyMoodleCursosds_descricao.AsString;
         siglaCursoSel := qyMoodleCursosds_sigla.AsString;
         lbl_ds_descricao.Caption := descricaoCursoSel;
         lbl_ds_sigla.Caption := siglaCursoSel;
      
         with qyMoodleTurmasDisc do
         begin
            Close();
            SQL.Clear();
            SQL.Add(' SELECT ucd.*, d.descricao FROM unim_moodle_cursos_disciplinas ucd ' +
            ' INNER JOIN disciplinas d ON ( d.id_disciplina = ucd.id_disciplina )');
            sAux := ' WHERE ';

            SQL.Add(sAux);
            SQL.Add(' cd_moodle_curso = ( '+ qyMoodleCursoscd_moodle_curso.AsString + ') ' );
            OPEN();
         end;
      end;
   end
   else
   begin
      showMessage('Acesso Negado - É necessário selecionar um curso.');
      qyMoodleCursos.Refresh;
      pcCursosMoodle.ActivePage := tsCursosMoodle;
   end;
end;

procedure TfrmCursosMoodle.btAlterarCursoMoodleClick(Sender: TObject);
const
   S_LOG = '{"cd_moodle_curso": "%s", "ds_descricao_anterior": "%s", "ds_sigla_anterior": "%s", "ds_descricao": "%s", "ds_sigla": "%s"}';
   S_OPERACAO = 'Alteração';
   S_CHAVE = 'AlterarCursosMoodle';
var
   S: AnsiString;
begin
   Application.CreateForm(TfrmIncluirCursosMoodle, frmIncluirCursosMoodle);

   frmIncluirCursosMoodle.lbleDescricao.Text := qyMoodleCursosDS_DESCRICAO.AsString;
   frmIncluirCursosMoodle.lbleSigla.Text := qyMoodleCursosDS_SIGLA.AsString;
   frmIncluirCursosMoodle.chkKonviva.Enabled := False;
   frmIncluirCursosMoodle.chkKonviva.Checked := not qyMoodleCursosCD_MOODLE_CURSO.IsNull;
   frmIncluirCursosMoodle.lbleCodigoKonviva.Enabled := False;
   frmIncluirCursosMoodle.lbleCodigoKonviva.Text := qryCursoKonvivaCD_KONVIVA_CURSO.AsString;

   if frmIncluirCursosMoodle.ShowModal = mrOk then
   begin
      S := Format(S_LOG, [
         qyMoodleCursosCD_MOODLE_CURSO.AsString,
         qyMoodleCursosDS_DESCRICAO.AsString,
         qyMoodleCursosDS_SIGLA.AsString,
         frmIncluirCursosMoodle.lbleDescricao.Text,
         frmIncluirCursosMoodle.lbleSigla.Text]);

      DM.setLog(53, S_OPERACAO, S_CHAVE, 0, S);

      qyMoodleCursos.Edit;
      qyMoodleCursosDS_DESCRICAO.AsString := frmIncluirCursosMoodle.lbleDescricao.Text;
      qyMoodleCursosDS_SIGLA.AsString := frmIncluirCursosMoodle.lbleSigla.Text;
      qyMoodleCursos.Post;
   end;
end;

procedure TfrmCursosMoodle.btExcluirCursoMoodleClick(Sender: TObject);
var
   qryExcluir_CursoMoodle, qryVerificaTurmasVinculadas : TUMZQuery;
   i, qtdTurmasVinculadas : integer;
   msgExclusao : String;
begin
   msgExclusao := 'Deseja realmente excluir este(s) registro(s)?';

   if Mensagem(msgExclusao,Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then Exit;

   dm.CriarConsulta(qryExcluir_CursoMoodle);

   dm.CriarConsulta(qryVerificaTurmasVinculadas);
   {
      Verifica se o numero de linhas selecionados na grid é maior que zero.
      Se sim, irá excluir as informações selecionadas
   }
   if (not qyMoodleCursoscd_moodle_curso.IsNull ) then
   begin
      with qryExcluir_CursoMoodle do
       SQL.Text := ''            +
        'DELETE FROM '           +
        ' unim_moodle_cursos '   +
        ' WHERE '                +
        ' cd_moodle_curso  = :cd_moodle_curso ' ;

      begin
         qryVerificaTurmasVinculadas.SQL.Text:= ''                  +
         ' SELECT '                                                 +
         '    COUNT(cd_curso_disciplina) as qtdTurmasVinculadas'    +
         ' FROM '                                                   +
         '    unim_moodle_cursos_disciplinas '                      +
         ' WHERE '                                                  +
         '    cd_moodle_curso = :cd_moodle_curso ';

         qryVerificaTurmasVinculadas.ParamByName('cd_moodle_curso').AsInteger:= qyMoodleCursoscd_moodle_curso.AsInteger;
         qryVerificaTurmasVinculadas.Open();
         qtdTurmasVinculadas:= qryVerificaTurmasVinculadas.FieldByName('qtdTurmasVinculadas').AsInteger;

         {
            Verifica se o curso possui turmas vinculadas.
            Se sim não permite a exclusão.
         }
         if qtdTurmasVinculadas > 0 then
         begin
            ShowMessage('Não é permitido excluir um curso que possui turma(s) vinculada(s) a ele.');
            Exit;
         end;

         // Efetua a exclusão do registro de curso do Konviva, se existir

         if not qryCursoKonviva.IsEmpty then
         begin
            qryCursoKonviva.Delete;
         end;

         //Registra Log
         DM.setLog(
            53,
            'Exclusão',
            'ExcluirCursosMoodle',
            0,
            '{' +
               '"cd_moodle_curso": "' + qyMoodleCursoscd_moodle_curso.AsString + '",' +
               '"ds_descricao": "' + qyMoodleCursosds_descricao.AsString + '",' +
               '"ds_sigla":"' + qyMoodleCursosds_sigla.AsString + '"' +
            '}');
         qryExcluir_CursoMoodle.ParamByName('cd_moodle_curso').AsInteger:= qyMoodleCursoscd_moodle_curso.AsInteger;
         qryExcluir_CursoMoodle.ExecSQL();
      end;
      qryExcluir_CursoMoodle.Close();
      qryExcluir_CursoMoodle.Free();
      qryVerificaTurmasVinculadas.Free();
      qyMoodleCursos.Refresh;
      qyMoodleCursos.First();
   end;
end;


procedure TfrmCursosMoodle.btFecharCursosMoodleClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmCursosMoodle.btIncluirCursoMoodleClick(Sender: TObject);
const
   S_LOG = '{"ds_descricao": "%s", "ds_sigla": "%s"}';
   S_OPERACAO = 'Inclusão';
   S_CHAVE = 'InserirCursosMoodle';
var
   S: AnsiString;
begin
   Application.CreateForm(TfrmIncluirCursosMoodle, frmIncluirCursosMoodle);

   frmIncluirCursosMoodle.chkKonviva.Enabled := True;
   frmIncluirCursosMoodle.lbleDescricao.Clear;
   frmIncluirCursosMoodle.lbleSigla.Clear;
   frmIncluirCursosMoodle.lbleCodigoKonviva.Clear;
   frmIncluirCursosMoodle.chkKonviva.Checked := False;
   frmIncluirCursosMoodle.lbleCodigoKonviva.Enabled := False;

   if frmIncluirCursosMoodle.ShowModal = mrOk then
   begin
      qyMoodleCursos.Insert;
      qyMoodleCursosDS_DESCRICAO.AsString := frmIncluirCursosMoodle.lbleDescricao.Text;
      qyMoodleCursosDS_SIGLA.AsString := frmIncluirCursosMoodle.lbleSigla.Text;
      qyMoodleCursos.Post;

      if frmIncluirCursosMoodle.chkKonviva.Checked then
      begin
         qryCursoKonviva.Insert;
         qryCursoKonvivaCD_KONVIVA_CURSO.AsString := frmIncluirCursosMoodle.lbleCodigoKonviva.Text;
         qryCursoKonvivaCD_MOODLE_CURSO.AsLargeInt := qyMoodleCursosCD_MOODLE_CURSO.AsLargeInt;
         qryCursoKonviva.Post;
      end;

      S := Format(S_LOG, [
         frmIncluirCursosMoodle.lbleDescricao.Text,
         frmIncluirCursosMoodle.lbleSigla.Text]);

      DM.setLog(53, S_OPERACAO, S_CHAVE, 0, S);
   end;
   
end;

procedure TfrmCursosMoodle.btnExcluirTurmasDiscMoodleClick(Sender: TObject);
var
   i : integer;
   msgExclusao : String;
   qryDeletarTurmasVinculadas : TUMZQuery;
begin
   msgExclusao := 'Ao excluir uma turma/disciplina, todos os alunos ' +
   'relacionados não poderão realizar atividades no MOODLE. Porém as notas ' +
   'já integradas não serão excluídas pelo sistema. Deseja continuar?';

   if Mensagem(msgExclusao,Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then Exit;

   dm.CriarConsulta(qryDeletarTurmasVinculadas);
   if (gridTurmasDiscMoodle.SelectedRows.Count > 0 ) then
   begin
      with qryDeletarTurmasVinculadas do
       SQL.Text := ''                        +
        'DELETE FROM '                       +
        ' unim_moodle_cursos_disciplinas '   +
        ' WHERE '                            +
        ' cd_curso_disciplina  = :cd_curso_disciplina ' ;

      begin
         for i := 0 to gridTurmasDiscMoodle.SelectedRows.Count - 1 do

         with dtcMoodleTurmasDisc.Dataset, gridTurmasDiscMoodle do
         begin
            GoToBookmark(Pointer(SelectedRows.Items[i]));
            qryDeletarTurmasVinculadas.ParamByName('cd_curso_disciplina').AsInteger:= qyMoodleTurmasDisccd_curso_disciplina.AsInteger;
            DM.setLog(
               53,
               'Exclusão',
               'ExcluirVinculoTurmasDisciplinasMoodle',
               0,
               '{' +
                  '"cd_curso_disciplina": "' + qyMoodleTurmasDisccd_curso_disciplina.AsString + '",' +
                  '"cd_moodle_curso": "' + qyMoodleTurmasDisccd_moodle_curso.AsString + '",' +
                  '"nr_anosemestre": "' + qyMoodleTurmasDiscnr_anosemestre.AsString + '",' +
                  '"cd_turma": "' + qyMoodleTurmasDisccd_turma.AsString +'",' +
                  '"cd_curso": "' + qyMoodleTurmasDisccd_curso.AsString +'",' +
                  '"id_disciplina":"' + qyMoodleTurmasDiscid_disciplina.AsString + '"' +
               '}');
            qryDeletarTurmasVinculadas.ExecSQL();
         end;
      end;
      qryDeletarTurmasVinculadas.Close();
      qryDeletarTurmasVinculadas.Free();
      qyMoodleTurmasDisc.Refresh();
   end;
end;

procedure TfrmCursosMoodle.btnFecharClick(Sender: TObject);
begin
   Close();
end;

end.
