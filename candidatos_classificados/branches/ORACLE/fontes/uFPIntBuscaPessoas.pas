unit uFPIntBuscaPessoas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ComCtrls, Mask, DBCtrls, Buttons, ImgList,
   ToolWin, Grids, DBGrids, DB, ZConnection, uDM, Menus, ZAbstractRODataset,
   ZAbstractDataset, ZDataset, UZDataset, ufPIntGeracao, ufPIntRelatorios;

type
   TfPIntBuscaPessoas = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      pnlFiltros: TPanel;
      lblAnoSem: TLabel;
      lblCurso: TLabel;
      lblTurma: TLabel;
      lblCodigo: TLabel;
      lblNome: TLabel;
      meAnoSem: TMaskEdit;
      udAnoSem: TUpDown;
      edtCodigo: TEdit;
      edtNome: TEdit;
      btnFiltrar: TBitBtn;
      bvlSep3: TBevel;
      ilImagens: TImageList;
      tlbAcoes: TToolBar;
      btnSep1: TToolButton;
      btnSelecionar: TToolButton;
      btnSep2: TToolButton;
      btnSair: TToolButton;
      btnSep3: TToolButton;
      bvlSep4: TBevel;
      dbgPessoas: TDBGrid;
      dsPessoas: TDataSource;
      qryCursos: TUMZQuery;
      qryTurmas: TUMZQuery;
      qryPessoas: TUMZQuery;
      cbCursos: TComboBox;
      cbTurmas: TComboBox;
      qryCursosanosemestre: TSmallintField;
      qryCursoscodigo: TStringField;
      qryCursosapelido: TStringField;
      qryCursosdescricao: TStringField;
      qryTurmascd_turma: TStringField;
      qryTurmascd_curso: TStringField;
      qryTurmascd_disciplina: TLargeintField;
      qryTurmasnr_anosemestre: TIntegerField;
      qryTurmascodigo: TSmallintField;
      qryPessoascd_pessoa: TIntegerField;
      qryPessoasnm_pessoa: TStringField;
      qryPessoascd_turma: TStringField;
      qryPessoascd_curso: TStringField;
      qryPessoasdescricao: TStringField;
      procedure dbgPessoasColEnter(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure qryPessoasAfterOpen(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnSairClick(Sender: TObject);
      procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
      procedure cbTurmasKeyPress(Sender: TObject; var Key: Char);
      procedure cbCursosKeyPress(Sender: TObject; var Key: Char);
      procedure meAnoSemKeyPress(Sender: TObject; var Key: Char);
      procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure cbTurmasSelect(Sender: TObject);
      procedure cbCursosSelect(Sender: TObject);
      procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
      procedure btnFiltrarClick(Sender: TObject);
   strict private
      FIRegraEnsalamento: integer;
      procedure CarregaCursos;
      procedure CarregaTurmas;
      procedure Filtra;
   private
      property RegraEnsalamento: integer read FIRegraEnsalamento write FIRegraEnsalamento;
   public
      class procedure GetPessoas(const AIRegraEnsalamento: integer;
         const ASTituloProva: string);
   end;

var
  fPIntBuscaPessoas: TfPIntBuscaPessoas;

implementation

{$R *.dfm}

const
   SQL_OP_AND =
      ' AND ';

   SQL_GROUP_PESSOAS =
      'GROUP BY p.cd_pessoa';

   SQL_ORDER_PESSOAS =
      'ORDER BY p.nm_pessoa';

   SQL_WHERE_CURSO =
      'pt.cd_curso = :cd_curso';

   SQL_WHERE_TURMA =
      'pt.cd_turma = :cd_turma';

   SQL_WHERE_CODIGO =
      'p.cd_pessoa = :cd_pessoa';

   SQL_WHERE_NOME =
      'p.nm_pessoa LIKE :nm_pessoa';

   SQL_SELECT_PESSOAS =
      'SELECT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'pt.cd_turma,'+
         'pt.cd_curso,'+
         'd.descricao '+
      'FROM '+
         'pint_provas_turmas pt '+
            'JOIN fichaindividual fi ON '+
               '(pt.cd_turma = fi.turma) AND '+
               '(pt.cd_curso = fi.curso) AND '+
               '(pt.cd_disciplina = fi.disciplina) AND '+
               '(pt.nr_anosemestre = fi.anosemestre) '+
               'JOIN disciplinas d ON '+
                  '(fi.disciplina = d.codigo) AND '+
                  '(fi.curso = d.curso) '+
               'JOIN pessoas p ON '+
                  '(fi.codigoaluno = p.cd_pessoa) '+
               'JOIN situacao s ON '+
                  '(fi.situacao = s.cd_situacao) '+
                  'JOIN nu_modulos_matriculas_sit mms ON ( '+
                     's.cd_situacao_pai = mms.cd_situacao AND mms.cd_modulo = (SELECT cd_modulo FROM nu_modulos WHERE ds_chave = ''ProvaInterdisciplinar'' ) ) '+
            'JOIN pint_regras_ensalamento re ON '+
               '(pt.cd_prova = re.cd_prova) '+
               'JOIN pint_ensalamento e ON '+
                  '(re.cd_regra_ensalamento = e.cd_regra_ensalamento) AND '+
                  '(fi.codigoaluno = e.cd_pessoa) '+
      'WHERE '+
         'mms.sn_aceita = 1 AND '+
         'e.cd_regra_ensalamento = :cd_regra_ensalamento AND '+
         'pt.nr_anosemestre = :nr_anosemestre';

{ TfPIntBuscaPessoas }

procedure TfPIntBuscaPessoas.btnFiltrarClick(Sender: TObject);
begin
   Filtra;
end;

procedure TfPIntBuscaPessoas.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPIntBuscaPessoas.CarregaCursos;
begin
   qryCursos.Close;
   qryCursos.ParamByName('cd_regra_ensalamento').AsInteger := FIRegraEnsalamento;
   qryCursos.ParamByName('nr_anosemestre').AsString := meAnoSem.Text;
   qryCursos.Open;
   cbCursos.Clear;
   if not qryCursos.IsEmpty then
   begin
      cbCursos.AddItem('(TODOS)', nil);
      while not qryCursos.Eof do
      begin
         cbCursos.AddItem(qryCursos.FieldByName('apelido').AsString, qryCursos.GetBookmark);
         qryCursos.Next;
      end;
   end;
end;

procedure TfPIntBuscaPessoas.CarregaTurmas;
begin
   qryTurmas.Close;
   qryTurmas.ParamByName('cd_regra_ensalamento').AsInteger := FIRegraEnsalamento;
   qryTurmas.ParamByName('nr_anosemestre').AsString := meAnoSem.Text;
   qryTurmas.ParamByName('cd_curso').AsString := qryCursoscodigo.AsString;
   qryTurmas.Open;
   cbTurmas.Clear;
   if not qryTurmas.IsEmpty then
   begin
      cbTurmas.AddItem('(TODAS)', nil);
      while not qryTurmas.Eof do
      begin
         cbTurmas.AddItem(qryTurmascd_turma.AsString, qryTurmas.GetBookmark);
         qryTurmas.Next;
      end;
   end;
end;

procedure TfPIntBuscaPessoas.cbCursosKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      cbTurmas.SetFocus;
end;

procedure TfPIntBuscaPessoas.cbCursosSelect(Sender: TObject);
begin
   if cbCursos.ItemIndex > 0 then
      qryCursos.GotoBookmark(Pointer(cbCursos.Items.Objects[cbCursos.ItemIndex]));
   CarregaTurmas;
   cbTurmas.SetFocus;
   Filtra;
end;

procedure TfPIntBuscaPessoas.cbTurmasKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      edtCodigo.SetFocus;
end;

procedure TfPIntBuscaPessoas.cbTurmasSelect(Sender: TObject);
begin
   if cbTurmas.ItemIndex > 0 then
      qryTurmas.GotoBookmark(Pointer(cbTurmas.Items.Objects[cbTurmas.ItemIndex]));
   edtCodigo.SetFocus;
   Filtra;
end;

procedure TfPIntBuscaPessoas.dbgPessoasColEnter(Sender: TObject);
begin
   dbgPessoas.BeginDrag(true);
end;

procedure TfPIntBuscaPessoas.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      edtNome.SetFocus
   else if not (Key in['0'..'9', #8, ^V]) then
      Key := #0;
end;

procedure TfPIntBuscaPessoas.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Filtra;
end;

procedure TfPIntBuscaPessoas.Filtra;
begin
   qryPessoas.Close;
   qryPessoas.SQL.Text := SQL_SELECT_PESSOAS;
   qryPessoas.ParamByName('cd_regra_ensalamento').AsInteger := FIRegraEnsalamento;
   qryPessoas.ParamByName('nr_anosemestre').AsString := meAnoSem.Text;

   if cbCursos.ItemIndex > 0 then
   begin
      qryCursos.GotoBookmark(Pointer(cbCursos.Items.Objects[cbCursos.ItemIndex]));
      qryPessoas.SQL.Add(SQL_OP_AND + SQL_WHERE_CURSO);
      qryPessoas.ParamByName('cd_curso').AsString := qryCursoscodigo.AsString;
   end;

   if cbTurmas.ItemIndex > 0 then
   begin
      qryTurmas.GotoBookmark(Pointer(cbTurmas.Items.Objects[cbTurmas.ItemIndex]));
      qryPessoas.SQL.Add(SQL_OP_AND + SQL_WHERE_TURMA);
      qryPessoas.ParamByName('cd_turma').AsString := qryTurmascd_turma.AsString;
   end;

   if edtCodigo.Text <> '' then
   begin
      qryPessoas.SQL.Add(SQL_OP_AND + SQL_WHERE_CODIGO);
      qryPessoas.ParamByName('cd_pessoa').AsString := edtCodigo.Text;
   end;

   if Trim(edtNome.Text) <> '' then
   begin
      qryPessoas.SQL.Add(SQL_OP_AND + SQL_WHERE_NOME);
      qryPessoas.ParamByName('nm_pessoa').AsString := '%' + edtNome.Text + '%';
   end;

   qryPessoas.SQL.Add(SQL_GROUP_PESSOAS);
   qryPessoas.SQL.Add(SQL_ORDER_PESSOAS);
   qryPessoas.Open;
end;

procedure TfPIntBuscaPessoas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM.Set_Parametro_usuario(meAnoSem, Name);
end;

procedure TfPIntBuscaPessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F12:
         btnSairClick(nil);
   end;
end;

procedure TfPIntBuscaPessoas.FormShow(Sender: TObject);
begin
   CarregaCursos;
end;

class procedure TfPIntBuscaPessoas.GetPessoas(const AIRegraEnsalamento: integer;
  const ASTituloProva: string);
begin
   if not Assigned(fPIntBuscaPessoas) then
      Application.CreateForm(TfPIntBuscaPessoas, fPIntBuscaPessoas);
   fPIntBuscaPessoas.RegraEnsalamento := AIRegraEnsalamento;
   fPIntBuscaPessoas.Caption := ASTituloProva;


   try
      fPIntGeracao.SetFocus;

      fPIntBuscaPessoas.Top := fPIntGeracao.Top;
      fPIntBuscaPessoas.Left := fPIntGeracao.Left + fPIntGeracao.Width
   except
   
      fPIntBuscaPessoas.Top := fPIntRelatorios.Top;
      fPIntBuscaPessoas.Left := fPIntRelatorios.Left + fPIntRelatorios.Width;
   end;
   fPIntBuscaPessoas.Show;
end;

procedure TfPIntBuscaPessoas.meAnoSemKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      CarregaCursos;
      cbCursos.SetFocus;
   end;
end;

procedure TfPIntBuscaPessoas.qryPessoasAfterOpen(DataSet: TDataSet);
begin
   btnSelecionar.Enabled := not qryPessoas.IsEmpty;
   dbgPessoas.Hint := Format('%d registros encontrados.', [qryPessoas.RecordCount]);
end;

procedure TfPIntBuscaPessoas.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSem.Text := DM.incrementar_ano_semestre(meAnoSem.Text)
   else
      meAnoSem.Text := DM.decrementar_ano_semestre(meAnoSem.Text);
   CarregaCursos;
   Filtra;
end;

end.

