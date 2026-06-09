unit UFAdmissaoCursos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, DBCtrls, StdCtrls, ExtCtrls,
   CheckLst, DBClient, Provider, ZAbstractDataset, ZSqlUpdate, Buttons, Grids,
  DBGrids, UDBGrids, UZSortedGrid;

type
   TfrmAdmissaoCursos = class(TForm)
      bbtnConfirmar: TBitBtn;
      btnRemover: TButton;
      btnRemoverTodos: TButton;
      btnSelecionar: TButton;
      btnSelecionarTodos: TButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      dbgCursoCampo: TZSortedGrid;
      dbgCursos: TZSortedGrid;
      dsCursoCampo: TDataSource;
      dsCursos: TDataSource;
      lblDisponivel: TLabel;
      lblSelecionado: TLabel;
      pnlCursos: TPanel;
      pnlEsquerda: TPanel;
      pnlFiltros: TPanel;
      pnlGeral: TPanel;
      pnlOpcoes: TPanel;
      pnlSelecionado: TPanel;
      qryCampo: TUMZReadOnlyQuery;
      qryCampoSN_CENTRO_CUSTO: TSmallintField;
      qryCampoSN_HORAS: TSmallintField;
      qryCursoCampo: TUMZQuery;
      qryCursoCampoCD_ADMISSAO_CAMPO: TSmallintField;
      qryCursoCampoCD_ADMISSAO_HISTORICO: TLargeintField;
      qryCursoCampoCD_CENTRO: TLargeintField;
      qryCursoCampoCD_COLIGADA_MATRIZ: TIntegerField;
      qryCursoCampoCD_CURSO: TStringField;
      qryCursoCampoDS_CENTRO: TStringField;
      qryCursoCampoNM_CURSO: TStringField;
      qryCursoCampoSN_CENTRO_CUSTO: TSmallintField;
      qryCursoCampoSN_CURSOS: TSmallintField;
      qryCursoCampoSN_HORAS: TSmallintField;
      qryCursoCampoVL_HORAS: TFloatField;
      qryCursos: TUMZReadOnlyQuery;
      qryCursosCD_CURSO_MESTRE: TStringField;
      qryCursosNM_CURSO: TStringField;
      qryCursosSN_LECIONA: TLargeintField;
      rbCursosProfessor: TRadioButton;
      rbCursosTodos: TRadioButton;
      splSep1: TSplitter;
      updCursoCampo: TZUpdateSQL;
      procedure btnRemoverClick(Sender: TObject);
      procedure btnRemoverTodosClick(Sender: TObject);
      procedure btnSelecionarClick(Sender: TObject);
      procedure btnSelecionarTodosClick(Sender: TObject);
      procedure dbgCursoCampoEditButtonClick(Sender: TObject);
      procedure rbCursosProfessorClick(Sender: TObject);
      procedure rbCursosTodosClick(Sender: TObject);
   private
      FHistoricoID: UINT;
      FCampoID: UINT;
      FPessoaID: UINT;
   public
      procedure Load(const HistoricoID, CampoID, PessoaID: UINT);
   end;

var
   frmAdmissaoCursos: TfrmAdmissaoCursos;

implementation

{$R *.dfm}

uses
   uSelCentro;

{ TfrmAdmissaoCursos }

procedure TfrmAdmissaoCursos.btnRemoverClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente remover os vínculos selecionados?';
var
   I, UserChoice: Integer;
begin
   UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin
      qryCursos.DisableControls;
      qryCursoCampo.DisableControls;

      for I := 0 to dbgCursoCampo.SelectedRows.Count - 1 do
      begin
         qryCursoCampo.GotoBookmark(TBookmark(dbgCursoCampo.SelectedRows[I]));
         qryCursoCampo.Delete;
      end;

      qryCursos.EnableControls;
      qryCursos.Refresh;

      qryCursoCampo.EnableControls;
      qryCursoCampo.Refresh;
   end;
end;

procedure TfrmAdmissaoCursos.btnRemoverTodosClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente remover todos os vínculos?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin
      qryCursos.DisableControls;
      qryCursoCampo.DisableControls;

      while not qryCursoCampo.IsEmpty do
         qryCursoCampo.Delete;

      qryCursos.EnableControls;
      qryCursos.Refresh;

      qryCursoCampo.EnableControls;
      qryCursoCampo.Refresh;
   end;
end;

procedure TfrmAdmissaoCursos.btnSelecionarClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente vincular todos os cursos selecionados ao professor?';
var
   I, UserChoice: Integer;
begin
   UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin
      qryCursos.DisableControls;
      qryCursoCampo.DisableControls;

      for I := 0 to dbgCursos.SelectedRows.Count - 1 do
      begin
         qryCursos.GotoBookmark(TBookmark(dbgCursos.SelectedRows[I]));

         qryCursoCampo.Insert;
         qryCursoCampoCD_ADMISSAO_HISTORICO.AsLargeInt := FHistoricoID;
         qryCursoCampoCD_ADMISSAO_CAMPO.AsInteger := FCampoID;
         qryCursoCampoCD_CURSO.AsString := qryCursosCD_CURSO_MESTRE.AsString;
      end;

      if qryCursoCampo.State = dsInsert then
         qryCursoCampo.Post;

      qryCursos.Refresh;
      qryCursos.EnableControls;

      qryCursoCampo.Refresh;
      qryCursoCampo.EnableControls;
   end;
end;

procedure TfrmAdmissaoCursos.btnSelecionarTodosClick(Sender: TObject);
const
   SMsgConfirmacao = 'Deseja realmente vincular todos os cursos ao professor?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageDlg(SMsgConfirmacao, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin
      qryCursos.DisableControls;
      qryCursoCampo.DisableControls;

      qryCursos.First;

      while not qryCursos.Eof do
      begin
         qryCursoCampo.Insert;
         qryCursoCampoCD_ADMISSAO_HISTORICO.AsLargeInt := FHistoricoID;
         qryCursoCampoCD_ADMISSAO_CAMPO.AsInteger := FCampoID;
         qryCursoCampoCD_CURSO.AsString := qryCursosCD_CURSO_MESTRE.AsString;
         qryCursos.Next;
      end;

      if qryCursoCampo.State = dsInsert then
         qryCursoCampo.Post;

      qryCursos.Refresh;
      qryCursos.EnableControls;

      qryCursoCampo.Refresh;
      qryCursoCampo.EnableControls;
   end;
end;

procedure TfrmAdmissaoCursos.dbgCursoCampoEditButtonClick(Sender: TObject);
begin
   if dbgCursoCampo.SelectedField.FieldName = 'DS_CENTRO' then
   begin
      frm_SelCentro.ShowModal;
      if frm_SelCentro.flgSearch then
      begin
         qryCursoCampo.Edit;
         qryCursoCampoCD_CENTRO.AsLargeInt := frm_SelCentro.qyCentrosCD_CENTRO.AsLargeInt;
         qryCursoCampoCD_COLIGADA_MATRIZ.AsInteger := frm_SelCentro.qyCentrosCD_COLIGADA_MATRIZ.AsInteger;
         qryCursoCampo.Post;
         qryCursoCampo.Refresh;
      end;
   end;
end;

procedure TfrmAdmissaoCursos.Load(const HistoricoID, CampoID, PessoaID: UINT);
begin
   FHistoricoID := HistoricoID;
   FCampoID := CampoID;
   FPessoaID := PessoaID;

   qryCampo.Close;
   qryCampo.ParamByName('CD_ADMISSAO_CAMPO').AsInteger := CampoID;
   qryCampo.Open;

   dbgCursoCampo.Columns[1].Visible := qryCampoSN_HORAS.AsInteger = 1;
   dbgCursoCampo.Columns[2].Visible := qryCampoSN_CENTRO_CUSTO.AsInteger = 1;
   qryCampo.Close;

   qryCursos.Close;
   qryCursos.ParamByName('CD_ADMISSAO_HISTORICO').AsInteger := HistoricoID;
   qryCursos.ParamByName('CD_ADMISSAO_CAMPO').AsInteger := CampoID;
   qryCursos.ParamByName('CD_PESSOA').AsInteger := PessoaID;
   qryCursos.Open;

   qryCursoCampo.Close;
   qryCursoCampo.ParamByName('CD_ADMISSAO_HISTORICO').AsInteger := HistoricoID;
   qryCursoCampo.ParamByName('CD_ADMISSAO_CAMPO').AsInteger := CampoID;
   qryCursoCampo.ParamByName('CD_PESSOA').AsInteger := PessoaID;
   qryCursoCampo.Open;
end;

procedure TfrmAdmissaoCursos.rbCursosProfessorClick(Sender: TObject);
begin
   qryCursos.Filtered := rbCursosProfessor.Checked;
end;

procedure TfrmAdmissaoCursos.rbCursosTodosClick(Sender: TObject);
begin
   qryCursos.Filtered := rbCursosProfessor.Checked;
end;

end.
