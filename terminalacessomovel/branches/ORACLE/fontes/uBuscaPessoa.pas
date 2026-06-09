unit uBuscaPessoa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList, Grids, DBGrids, DB,
   UZDataset, ZDataset, uDM, Mask;

type
   TfBuscaPessoas = class(TForm)
   published
      meAnoSem: TMaskEdit;
      pnTitulo: TPanel;
      bvSep1: TBevel;
      pnFiltros: TPanel;
      ledCodigo: TLabeledEdit;
      ledNome: TLabeledEdit;
      ledCPF: TLabeledEdit;
      ckAnoSem: TCheckBox;
      udAnoSem: TUpDown;
      lbCurso: TLabel;
      lbTurma: TLabel;
      cbCursos: TComboBox;
      cbTurmas: TComboBox;
      rgTipoPessoa: TRadioGroup;
      ilImagens: TImageList;
      bvSep2: TBevel;
      tbPesquisa: TToolBar;
      bnSep1: TToolButton;
      bnBusca: TToolButton;
      bnSep2: TToolButton;
      bnLimpar: TToolButton;
      bnSep3: TToolButton;
      bvSep3: TBevel;
      tbAcoes: TToolBar;
      bnSep4: TToolButton;
      bnConfirma: TToolButton;
      bnSep5: TToolButton;
      bnCancelar: TToolButton;
      bnSep6: TToolButton;
      bvSep4: TBevel;
      dgPessoas: TDBGrid;
      dsPessoas: TDataSource;
      qyPessoas: TUMZReadOnlyQuery;
      procedure alteraCurso(Sender: TObject);
      procedure alteraAnoSemestre(Sender: TObject);
      procedure incDecAnoSem(Sender: TObject; Button: TUDBtnType);
      procedure habilitaAnoSem(Sender: TObject);
      procedure selecionaFiltro(Sender: TObject);
      procedure filtra(Sender: TObject);
      procedure confirma(Sender: TObject);
      procedure cancela(Sender: TObject);
      procedure limpa(Sender: TObject);
      procedure informaCodigoPessoa(Sender: TObject; var Key: Char);
      procedure informaCPF(Sender: TObject; var Key: Char);
      procedure selecionaRegistro(Sender: TObject);
      procedure inicializaFormulario(Sender: TObject);
   strict private
      FICodEvento: integer;
      procedure filtraPessoa;
      procedure filtraEstudantes;
      procedure filtraProfessores;
      procedure setAnoSemestre;
      procedure carregaCursos;
      procedure carregaTurmas(const ASCodCurso: string);
      function incAnoSemestre(const ASAnoSem: string): string;
      function decAnoSemestre(const ASAnoSem: string): string;
   private
      constructor Create(AOwner: TComponent; const AICodEvento: integer);
   public
      class function getPessoa(AOwner: TComponent; const AICodEvento: integer; const ASNomeEvento: string): string;
   end;

var
   fBuscaPessoas: TfBuscaPessoas;

implementation

{$R *.dfm}

{ TfBuscaPessoas }

procedure TfBuscaPessoas.alteraAnoSemestre(Sender: TObject);
begin
   Self.carregaCursos;
   Self.carregaTurmas(Self.cbCursos.Text);
   Self.filtra(nil);
end;

procedure TfBuscaPessoas.alteraCurso(Sender: TObject);
begin
   Self.carregaTurmas(Self.cbCursos.Text);
end;

procedure TfBuscaPessoas.cancela(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
end;

procedure TfBuscaPessoas.carregaCursos;
const
   SQL_GET_CURSOS =
      'SELECT '+
         'codigo '+
      'FROM '+
         'cursos '+
      'WHERE '+
         'anosemestre = :nr_anosemestre';
var
   qyCursos: TUMZReadOnlyQuery;
begin
   Self.cbCursos.Clear;
   qyCursos := DM.newROQuery;
   try
      qyCursos.ParamCheck := True;
      qyCursos.SQL.Text := SQL_GET_CURSOS;
      qyCursos.ParamByName('nr_anosemestre').AsString := Self.meAnoSem.Text;
      qyCursos.Open;
      while not qyCursos.Eof do
      begin
         Self.cbCursos.Items.Add(qyCursos.FieldByName('codigo').AsString);
         qyCursos.Next;
      end;
   finally
      qyCursos.Close;
      FreeAndNil(qyCursos);
   end;
end;

procedure TfBuscaPessoas.carregaTurmas(const ASCodCurso: string);
const
   SQL_GET_TURMAS =
      'SELECT '+
         'codigo '+
      'FROM '+
         'turmas '+
      'WHERE '+
         'anosemestre = :nr_anosemestre';

   SQL_GET_TURMAS_CURSO = SQL_GET_TURMAS + ' AND curso = :cd_curso';
var
   qyTurmas: TUMZReadOnlyQuery;
begin
   Self.cbTurmas.Clear;
   qyTurmas := DM.newROQuery;
   try
      qyTurmas.ParamCheck := True;
      if ASCodCurso = '' then
         qyTurmas.SQL.Text := SQL_GET_TURMAS
      else
         qyTurmas.SQL.Text := SQL_GET_TURMAS_CURSO;
      qyTurmas.Open;
      while not qyTurmas.Eof do
      begin
         Self.cbTurmas.Items.Add(qyTurmas.FieldByName('codigo').AsString);
         qyTurmas.Next;
      end;
   finally
      qyTurmas.Close;
      FreeAndNil(qyTurmas);
   end;
end;

procedure TfBuscaPessoas.confirma(Sender: TObject);
begin
   Self.ModalResult := mrOk;
end;

constructor TfBuscaPessoas.Create(AOwner: TComponent;
  const AICodEvento: integer);
begin
   inherited Create(AOwner);
   Self.FICodEvento := AICodEvento;
end;

function TfBuscaPessoas.decAnoSemestre(const ASAnoSem: string): string;
var
   iAno, iSemestre: integer;
begin
   iAno := StrToInt(Copy(ASAnoSem, 1, 4));
   iSemestre := StrToInt(Copy(ASAnoSem, 5, 1));
   Dec(iSemestre);
   if iSemestre <= 0 then
   begin
      Dec(iAno);
      iSemestre := 2;
   end;
   Result := IntToStr(iAno) + IntToStr(ISemestre);
end;

procedure TfBuscaPessoas.filtra(Sender: TObject);
begin
   Self.dgPessoas.Columns.Items[3].Visible := Self.rgTipoPessoa.ItemIndex > 0;
   Self.dgPessoas.Columns.Items[4].Visible := Self.rgTipoPessoa.ItemIndex > 0;
   case Self.rgTipoPessoa.ItemIndex of
      0: Self.filtraPessoa;
      1: Self.filtraEstudantes;
      2: Self.filtraProfessores;   
   end;
end;

procedure TfBuscaPessoas.filtraEstudantes;
const
   SQL_GET_ESTUDANTE =
      'SELECT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'p.ds_cpf,'+
         'm.turma,'+
         'm.anosemestre '+
      'FROM '+
         'pessoas p '+
            'JOIN matriculas m ON(p.cd_pessoa = m.codigoaluno) '+
            'JOIN view_eventos_carga v USING(cd_pessoa) '+
               'JOIN tam_inscricoes i ON(v.cd_inscricao = i.cd_inscricao) '+
      'WHERE '+
         'i.CD_EVENTO = :cd_evento';

   SQL_GET_ESTUDANTE_CODIGO = ' AND p.cd_pessoa = :cd_pessoa';

   SQL_GET_ESTUDANTE_NOME = ' AND p.nm_pessoa = :nm_pessoa';

   SQL_GET_ESTUDANTE_CPF = ' AND p.ds_cpf = :ds_cpf';

   SQL_GET_ESTUDANTE_ANOSEM = ' AND m.anosemestre = :nr_anosemestre';

   SQL_GET_ESTUDANTE_CURSO = ' AND m.curso = :cd_curso';

   SQL_GET_ESTUDANTE_TURMA = ' AND m.turma = :cd_turma';

   SQL_ORDER = ' ORDER BY p.nm_pessoa, m.anosemestre DESC';

   SQL_GROUP = ' GROUP BY p.cd_pessoa';
begin
   Self.qyPessoas.Close;
   Self.qyPessoas.SQL.Text := SQL_GET_ESTUDANTE;
   if Trim(Self.ledCodigo.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_ESTUDANTE_CODIGO);
   if Trim(Self.ledNome.Text) <> '' then
      Self.qyPessoas.SQL.Add(StringReplace(SQL_GET_ESTUDANTE_NOME, ':nm_pessoa', '"%' + Self.ledNome.Text + '%"', []));
   if Trim(Self.ledCPF.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_ESTUDANTE_CPF);
   if ckAnoSem.Checked then
      Self.qyPessoas.SQL.Add(SQL_GET_ESTUDANTE_ANOSEM);
   if Trim(Self.cbCursos.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_ESTUDANTE_CURSO);
   if Trim(Self.cbTurmas.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_ESTUDANTE_TURMA);
   if Self.qyPessoas.Params.FindParam('cd_pessoa') <> nil then
      Self.qyPessoas.ParamByName('cd_pessoa').AsString := Self.ledCodigo.Text;
   if Self.qyPessoas.Params.FindParam('ds_cpf') <> nil then
      Self.qyPessoas.ParamByName('ds_cpf').AsString := Self.ledCPF.Text;
   if Self.qyPessoas.Params.FindParam('nr_anosemestre') <> nil then
      Self.qyPessoas.ParamByName('nr_anosemestre').AsString := Self.meAnoSem.Text;
   if Self.qyPessoas.Params.FindParam('cd_curso') <> nil then
      Self.qyPessoas.ParamByName('cd_curso').AsString := Self.cbCursos.Text;
   if Self.qyPessoas.Params.FindParam('cd_turma') <> nil then
      Self.qyPessoas.ParamByName('cd_turma').AsString := Self.cbTurmas.Text;
   Self.qyPessoas.SQL.Add(SQL_GROUP);
   Self.qyPessoas.SQL.Add(SQL_ORDER);
   Self.qyPessoas.ParamByName('cd_evento').AsInteger := Self.FICodEvento;
   Self.qyPessoas.Open;
end;

procedure TfBuscaPessoas.filtraPessoa;
const
   SQL_GET_PESSOA =
      'SELECT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'p.ds_cpf,'+
         '"" turma,'+
         '"" anosemestre '+
      'FROM '+
         'pessoas p '+
            'JOIN view_eventos_carga v USING(cd_pessoa) '+
               'JOIN tam_inscricoes i ON(v.cd_inscricao = i.cd_inscricao) '+
      'WHERE '+
         'i.CD_EVENTO = :cd_evento';

   SQL_GET_PESSOA_CODIGO = ' AND p.cd_pessoa = :cd_pessoa';

   SQL_GET_PESSOA_NOME = ' AND p.nm_pessoa LIKE :nm_pessoa';

   SQL_GET_PESSOA_CPF = ' AND p.ds_cpf = :ds_cpf';

   SQL_ORDER = ' ORDER BY p.nm_pessoa';
begin
   Self.qyPessoas.Close;
   Self.qyPessoas.SQL.Text := SQL_GET_PESSOA;
   if Trim(Self.ledCodigo.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_PESSOA_CODIGO);
   if Trim(Self.ledNome.Text) <> '' then
      Self.qyPessoas.SQL.Add(StringReplace(SQL_GET_PESSOA_NOME, ':nm_pessoa', '"%' + Self.ledNome.Text + '%"', []));
   if Trim(Self.ledCPF.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_PESSOA_CPF);
   if Self.qyPessoas.Params.FindParam('cd_pessoa') <> nil then
      Self.qyPessoas.ParamByName('cd_pessoa').AsString := Self.ledCodigo.Text;
   if Self.qyPessoas.Params.FindParam('ds_cpf') <> nil then
      Self.qyPessoas.ParamByName('ds_cpf').AsString := Self.ledCPF.Text;
   Self.qyPessoas.SQL.Add(SQL_ORDER);
   Self.qyPessoas.ParamByName('cd_evento').AsInteger := Self.FICodEvento;
   Self.qyPessoas.Open;
end;

procedure TfBuscaPessoas.filtraProfessores;
const
   SQL_GET_PROFESSOR =
      'SELECT DISTINCTROW '+
         'tp.anosemestre,'+
         'p.nm_pessoa,'+
         'p.cd_pessoa,'+
         'p.ds_cpf,'+
         'tp.turma '+
      'FROM '+
         'turmasprofessores tp '+
            'JOIN pessoas p ON(tp.professor = p.cd_pessoa) '+
               'JOIN view_eventos_carga v USING(cd_pessoa) '+
                  'JOIN tam_inscricoes i ON(v.cd_inscricao = i.cd_inscricao) '+
            'JOIN turmas t ON(tp.turma = t.codigo AND tp.anosemestre = t.anosemestre AND tp.curso = t.curso) '+
            'JOIN professores pf ON(tp.professor = pf.cd_pessoa) '+
      'WHERE '+
         'pf.sn_professor = "S" AND '+
         'i.CD_EVENTO = :cd_evento';

   SQL_GET_PROFESSOR_CODIGO = ' AND p.cd_pessoa = :cd_pessoa';

   SQL_GET_PROFESSOR_NOME = ' AND p.nm_pessoa = :nm_pessoa';

   SQL_GET_PROFESSOR_CPF = ' AND p.ds_cpf = :ds_cpf';

   SQL_GET_PROFESSOR_ANOSEM = ' AND tp.anosemestre = :nr_anosemestre';

   SQL_GET_PROFESSOR_CURSO = ' AND tp.curso = :cd_curso';

   SQL_GET_PROFESSOR_TURMA = ' AND tp.turma = :cd_turma';

   SQL_ORDER = ' ORDER BY p.nm_pessoa, tp.anosemestre DESC';

   SQL_GROUP = ' GROUP BY p.cd_pessoa';
begin
   Self.qyPessoas.Close;
   Self.qyPessoas.SQL.Text := SQL_GET_PROFESSOR;
   if Trim(Self.ledCodigo.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_PROFESSOR_CODIGO);
   if Trim(Self.ledNome.Text) <> '' then
      Self.qyPessoas.SQL.Add(StringReplace(SQL_GET_PROFESSOR_NOME, ':nm_pessoa', '"%' + Self.ledNome.Text + '%"', []));
   if Trim(Self.ledCPF.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_PROFESSOR_CPF);
   if ckAnoSem.Checked then
      Self.qyPessoas.SQL.Add(SQL_GET_PROFESSOR_ANOSEM);
   if Trim(Self.cbCursos.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_PROFESSOR_CURSO);
   if Trim(Self.cbTurmas.Text) <> '' then
      Self.qyPessoas.SQL.Add(SQL_GET_PROFESSOR_TURMA);
   if Self.qyPessoas.Params.FindParam('cd_pessoa') <> nil then
      Self.qyPessoas.ParamByName('cd_pessoa').AsString := Self.ledCodigo.Text;
   if Self.qyPessoas.Params.FindParam('ds_cpf') <> nil then
      Self.qyPessoas.ParamByName('ds_cpf').AsString := Self.ledCPF.Text;
   if Self.qyPessoas.Params.FindParam('nr_anosemestre') <> nil then
      Self.qyPessoas.ParamByName('nr_anosemestre').AsString := Self.meAnoSem.Text;
   if Self.qyPessoas.Params.FindParam('cd_curso') <> nil then
      Self.qyPessoas.ParamByName('cd_curso').AsString := Self.cbCursos.Text;
   if Self.qyPessoas.Params.FindParam('cd_turma') <> nil then
      Self.qyPessoas.ParamByName('cd_turma').AsString := Self.cbTurmas.Text;
   Self.qyPessoas.SQL.Add(SQL_GROUP);
   Self.qyPessoas.SQL.Add(SQL_ORDER);
   Self.qyPessoas.ParamByName('cd_evento').AsInteger := Self.FICodEvento;
   Self.qyPessoas.Open;
end;

class function TfBuscaPessoas.getPessoa(AOwner: TComponent; const AICodEvento: integer; const ASNomeEvento: string): string;
const
   TITULO_PADRAO = 'Buscar pessoas inscritas no evento __EVENTO__';
begin
   if not Assigned(fBuscaPessoas) then
      fBuscaPessoas := TfBuscaPessoas.Create(AOwner, AICodEvento);
   fBuscaPessoas.pnTitulo.Caption := StringReplace(TITULO_PADRAO, '__EVENTO__', ASNomeEvento, []);
   try
      case fBuscaPessoas.ShowModal of
         mrCancel: Result := '';
         mrOk: Result := fBuscaPessoas.qyPessoas.FieldByName('cd_pessoa').AsString;
      end;
   finally
      fBuscaPessoas.Free;
      fBuscaPessoas := nil;
   end;
end;

procedure TfBuscaPessoas.habilitaAnoSem(Sender: TObject);
begin
   Self.meAnoSem.Enabled := Self.ckAnoSem.Checked;
   Self.udAnoSem.Enabled := Self.ckAnoSem.Checked;
end;

function TfBuscaPessoas.incAnoSemestre(const ASAnoSem: string): string;
var
   iAno, iSemestre: integer;
begin
   iAno := StrToInt(Copy(ASAnoSem, 1, 4));
   iSemestre := StrToInt(Copy(ASAnoSem, 5, 1));
   Inc(iSemestre);
   if iSemestre >= 3 then
   begin
      Inc(iAno);
      iSemestre := 1;
   end;
   Result := IntToStr(iAno) + IntToStr(ISemestre);
end;

procedure TfBuscaPessoas.incDecAnoSem(Sender: TObject; Button: TUDBtnType);
begin
   case Button of
      btNext: Self.meAnoSem.Text := Self.incAnoSemestre(Self.meAnoSem.Text);
      btPrev: Self.meAnoSem.Text := Self.decAnoSemestre(Self.meAnoSem.Text);
   end;
   if Self.ckAnoSem.Checked then
      Self.filtra(nil);
end;

procedure TfBuscaPessoas.informaCodigoPessoa(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Self.ledNome.SetFocus
   else if not (Key in[#48..#57, #8]) then
      Key := #0;
end;

procedure TfBuscaPessoas.informaCPF(Sender: TObject; var Key: Char);
begin
   if not (Key in[#48..#57, #8]) then Key := #0;
end;

procedure TfBuscaPessoas.inicializaFormulario(Sender: TObject);
begin
   Self.setAnoSemestre;
end;

procedure TfBuscaPessoas.limpa(Sender: TObject);
begin
   Self.qyPessoas.Close;
//   Self.dgPessoas.Columns.Clear;
end;

procedure TfBuscaPessoas.selecionaFiltro(Sender: TObject);
begin
   Self.ckAnoSem.Enabled := Self.rgTipoPessoa.ItemIndex > 0;
   Self.meAnoSem.Enabled := (Self.rgTipoPessoa.ItemIndex > 0) and Self.ckAnoSem.Checked;
   Self.udAnoSem.Enabled := (Self.rgTipoPessoa.ItemIndex > 0) and Self.ckAnoSem.Checked;
   Self.cbCursos.Enabled := Self.rgTipoPessoa.ItemIndex > 0;
   Self.cbTurmas.Enabled := Self.rgTipoPessoa.ItemIndex > 0;
   Self.filtra(nil);
end;

procedure TfBuscaPessoas.selecionaRegistro(Sender: TObject);
begin
   Self.ModalResult := mrOk;
end;

procedure TfBuscaPessoas.setAnoSemestre;
var
   wAno, wMes, wDia: Word;
begin
   DecodeDate(Now, wAno, wMes, wDia);
   if wMes > 6 then
      Self.meAnoSem.Text := IntToStr(wAno) + '2'
   else
      Self.meAnoSem.Text := IntToStr(wAno) + '1';
end;

end.
