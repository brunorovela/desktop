unit uCadProvasCadAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Spin, ComCtrls, Mask, DBCtrls, uPessoa;

type

  TipoPessoa = (Pessoa, Aluno, Professor);

  TfrmCadProvasCadAlunos = class(TForm)
    Panel1: TPanel;
    dtcAlunos: TDataSource;
    qryPessoa: TUMZQuery;
    btnFechar: TSpeedButton;
    pmQtd: TPopupMenu;
    sbSalvar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    cbAnoSemestre: TCheckBox;
    txtAnoSemestre: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    txtAca_Codigo: TEdit;
    txtAca_Nome: TEdit;
    txtAca_Turma: TEdit;
    grd: TDBGrid;
    cbAlunosCursando: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure cbAnoSemestreClick(Sender: TObject);
    procedure grdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdPessoaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtAca_CodigoEnter(Sender: TObject);
    procedure txtAca_NomeEnter(Sender: TObject);
    procedure txtAca_TurmaEnter(Sender: TObject);
    procedure txtAca_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txtAca_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure txtAca_TurmaKeyPress(Sender: TObject; var Key: Char);
    procedure txtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbAnoSemClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure edBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure grdObsDblClick(Sender: TObject);

  private
    { Private declarations }
    Procedure Filtra;
    Procedure Salvar;
    Procedure Fechar;
  public
    { Public declarations }
    flgSearch : Boolean;
    Tipo_Pessoa : TipoPessoa;
    cd_prova : integer;
  end;

var
  frmCadProvasCadAlunos: TfrmCadProvasCadAlunos;

implementation

uses uDM, Main, uCadProvas, uTProva, uGeneral;

{$R *.DFM}

procedure TfrmCadProvasCadAlunos.grdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    flgSearch := True;
    Close;
  end;
end;


procedure TfrmCadProvasCadAlunos.btnFecharClick(Sender: TObject);
begin
  Fechar();
end;

procedure TfrmCadProvasCadAlunos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
    VK_ESCAPE : Close;
  end;
end;


procedure TfrmCadProvasCadAlunos.grdPessoaDblClick(Sender: TObject);
begin
  Salvar();
end;

procedure TfrmCadProvasCadAlunos.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));


  txtAnoSemestre.text := IntToStr(ano_semestre);

end;

procedure TfrmCadProvasCadAlunos.Filtra;
var
  sAuxDisc, sAuxCurso : string;
begin

  with qryPessoa do begin
    Close();

    SQL.Text := ' ' +
      'SELECT ' +
      '  p.cd_pessoa, ' +
      '  p.nm_pessoa, ' +
      '  m.turma, ' +
      '  m.anosemestre ' +
      'FROM ' +
      '  pessoas p ' +
      '    INNER JOIN matriculas m ON (m.codigoaluno = p.cd_pessoa) ';

    if cbAlunosCursando.Checked then begin
      sAuxDisc := '';
      sAuxCurso := '';
      with frmCadProvas.qyDisciplinas do begin
        First;
        while not Eof do begin
          sAuxDisc := sAuxDisc + ',' + FieldByName('cd_disciplina').AsString;
          sAuxCurso := sAuxCurso + ',''' + FieldByName('cd_curso').AsString+'''';

          Next;
        end;
      end;

      sAuxDisc := Copy(sAuxDisc,2);
      sAuxCurso := Copy(sAuxCurso,2);

      SQL.Add('     INNER JOIN fichaindividual fi ON (fi.anosemestre = m.anosemestre AND fi.turmamatricula = m.turma AND fi.codigoaluno = m.codigoaluno AND fi.situacao not in (3, 4, 5, 6, 7, 8) AND fi.disciplina in ('+sAuxDisc+') AND fi.curso in ('+sAuxCurso+'))');
    end;

    SQL.Text := SQL.Text +
      'WHERE ' +
      '  1 = 1 ';

    if cbAnoSemestre.Checked then begin
      SQL.Add('AND m.anosemestre = :nr_anosemestre');
      ParamByName('nr_anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
    end;

    if txtAca_Codigo.Text <> '' then begin
      SQL.Add('AND p.cd_pessoa = :cd_pessoa');
      ParamByName('cd_pessoa').AsInteger := StrToInt(txtAca_Codigo.Text);
    end;

    if txtAca_Nome.Text <> '' then begin
      SQL.Add('AND p.nm_pessoa LIKE :nm_pessoa');
      ParamByName('nm_pessoa').AsString := '%'+txtAca_Nome.Text+'%';
    end;

    if txtAca_Turma.Text <> '' then begin
      SQL.Add('AND f.turma = :cd_turma');
      ParamByName('cd_turma').AsString := txtAca_Turma.Text;
    end;

    SQL.Add('ORDER BY p.nm_pessoa');
    Open();

  end;

  if qryPessoa.Eof then begin
    Messagedlg( 'Dados não encontrados.', mtInformation, [mbOk], 0);
    flgSearch := false
  end
  else begin
    grd.SetFocus;
  end;

end;

procedure TfrmCadProvasCadAlunos.txtAca_CodigoEnter(Sender: TObject);
begin
   txtAca_Nome.Clear;
   txtAca_Turma.Clear;
end;

procedure TfrmCadProvasCadAlunos.txtAca_NomeEnter(Sender: TObject);
begin
   txtAca_Codigo.Clear;
   txtAca_Turma.Clear;
end;

procedure TfrmCadProvasCadAlunos.txtAca_TurmaEnter(Sender: TObject);
begin
   txtAca_Nome.Clear;
   txtAca_Codigo.Clear;
end;

procedure TfrmCadProvasCadAlunos.txtAca_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	      txtAca_Nome.SetFocus
      else
	      filtra;
  End;
end;

procedure TfrmCadProvasCadAlunos.txtAca_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtAca_Turma.SetFocus
      else
	 filtra;
  End;

end;

procedure TfrmCadProvasCadAlunos.txtAca_TurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtAca_Codigo.SetFocus
      else
	 filtra;
  End;

end;

procedure TfrmCadProvasCadAlunos.txtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 SelectNext(Sender as TWinControl, True, True)
      else
	 filtra;
  End;
end;

procedure TfrmCadProvasCadAlunos.cbAnoSemClick(Sender: TObject);
begin
   FILTRA;
end;

procedure TfrmCadProvasCadAlunos.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryPessoa, pmQtd);

end;

procedure TfrmCadProvasCadAlunos.edBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	      TEdit(Sender).SetFocus
      else
	 filtra;
  End;
end;

procedure TfrmCadProvasCadAlunos.grdObsDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmCadProvasCadAlunos.cbAnoSemestreClick(Sender: TObject);
begin
  Filtra();
end;

procedure TfrmCadProvasCadAlunos.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
     Filtra();
  end
  else if Button = btPrev then
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
     Filtra();
  end;

  txtAnoSemestre.SetFocus;


end;

procedure TfrmCadProvasCadAlunos.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
    	  txtAca_Codigo.SetFocus
      else
	      filtra;
  End;
end;

procedure TfrmCadProvasCadAlunos.sbSalvarClick(Sender: TObject);
begin
  Salvar();
end;

procedure TfrmCadProvasCadAlunos.SpeedButton1Click(Sender: TObject);
begin
  Salvar();
  Fechar();
end;

procedure TfrmCadProvasCadAlunos.Fechar();
begin
  flgSearch := False;
  Close;
end;

procedure TfrmCadProvasCadAlunos.Salvar();
var
   I : Integer;

   prova : TProva;
   builder : TInclusaoProvaAlunoBuilder;

   usaEfeitoVisual : Boolean;
begin

   if grd.SelectedRows.Count < 1 then
   begin
      TGeneral.Mensagem( 'Selecione pelo menos um aluno.', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;

   usaEfeitoVisual := DM.db.SQLHourGlass;
   DM.db.SQLHourGlass := False;

   prova := TProva.Create(cd_prova);
   builder := prova.createBuilderInclusaoProvaAluno();

   for I := 0 to grd.SelectedRows.Count - 1 do
   begin
      grd.DataSource.DataSet.GotoBookmark(Pointer(grd.SelectedRows.Items[I]));

      try
         builder.AddAluno(TAlunoProvaIncluir.Create(
            TPessoa.Create(qryPessoa.FieldByName('cd_pessoa').AsInteger),
            qryPessoa.FieldByName('anosemestre').AsInteger,
            qryPessoa.FieldByName('turma').AsString
         ));
      except
         on E: ExceptionInclusaoProvaAlunoBuilder do
         begin
            TGeneral.Mensagem(E.Message, '', MB_ICONERROR + MB_OK, Handle);
         end;
      end;
   end;

   try
      builder.Executar();

      TGeneral.Mensagem('Alunos inseridos com sucesso.');

      frmCadProvas.qyTurmas.Close();
      frmCadProvas.qyTurmas.Open();
   except
      on E: ExceptionInclusaoProvaAlunoBuilder do
      begin
         TGeneral.Mensagem(E.Message);
      end;
   end;

   DM.db.SQLHourGlass := usaEfeitoVisual;
end;

end.
