unit uSel_Pessoas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Spin, ComCtrls, Mask;

type

  TipoPessoa = (Pessoa, Aluno, Professor);

  Tfrm_Sel_Pessoa = class(TForm)
    Panel1: TPanel;
    dtcAlunos: TDataSource;
    qryPessoa: TUMZQuery;
    btnFechar: TSpeedButton;
    Pagina: TPageControl;
    tsPessoa: TTabSheet;
    tsAluno: TTabSheet;
    tsProfessor: TTabSheet;
    Bevel1: TBevel;
    grdPessoa: TDBGrid;
    Label2: TLabel;
    txtPes_Codigo: TEdit;
    txtPes_Nome: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    txtPes_CPF: TEdit;
    Label4: TLabel;
    txtAca_Codigo: TEdit;
    Label5: TLabel;
    txtAca_Nome: TEdit;
    Label6: TLabel;
    txtAca_Turma: TEdit;
    Label7: TLabel;
    txtProf_Codigo: TEdit;
    Label8: TLabel;
    txtProf_Nome: TEdit;
    Label9: TLabel;
    txtProf_Turma: TEdit;
    tsAvancada: TTabSheet;
    lbTurma: TLabel;
    txtTurma: TEdit;
    lbCurso: TLabel;
    txtCurso: TEdit;
    cbAnoSem: TCheckBox;
    txtAnoSemestreCursos: TMaskEdit;
    UpDownCursos: TUpDown;
    Label10: TLabel;
    txtCodigo: TEdit;
    txtNome: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    txtCPF: TEdit;
    grdAcademico: TDBGrid;
    Bevel2: TBevel;
    grdProfessor: TDBGrid;
    Bevel3: TBevel;
    grdAvancada: TDBGrid;
    Bevel4: TBevel;
    rgTipo: TRadioGroup;
    procedure FormDestroy(Sender: TObject);
    procedure grdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdPessoaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure txtPes_CodigoEnter(Sender: TObject);
    procedure txtPes_NomeEnter(Sender: TObject);
    procedure txtPes_CPFEnter(Sender: TObject);
    procedure txtAca_CodigoEnter(Sender: TObject);
    procedure txtAca_NomeEnter(Sender: TObject);
    procedure txtAca_TurmaEnter(Sender: TObject);
    procedure txtProf_CodigoEnter(Sender: TObject);
    procedure txtProf_NomeEnter(Sender: TObject);
    procedure txtProf_TurmaEnter(Sender: TObject);
    procedure txtProf_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txtProf_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure txtProf_TurmaKeyPress(Sender: TObject; var Key: Char);
    procedure txtAca_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txtAca_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure txtAca_TurmaKeyPress(Sender: TObject; var Key: Char);
    procedure txtPes_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txtPes_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure txtPes_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure txtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
    procedure rgTipoClick(Sender: TObject);
    procedure cbAnoSemClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Filtra;
  public
    { Public declarations }
    flgSearch : Boolean;
    Tipo_Pessoa : TipoPessoa;   
  end;

var
  frm_Sel_Pessoa: Tfrm_Sel_Pessoa;

implementation

uses uDM, uPrincipal;

{$R *.DFM}

procedure Tfrm_Sel_Pessoa.grdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    flgSearch := True;
    Close;
  end;
end;


procedure Tfrm_Sel_Pessoa.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Sel_Pessoa.FormDestroy(Sender: TObject);
begin
   frm_Sel_Pessoa := nil;
end;

procedure Tfrm_Sel_Pessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
    VK_ESCAPE : Close;
  end;
end;


procedure Tfrm_Sel_Pessoa.grdPessoaDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Sel_Pessoa.FormShow(Sender: TObject);
begin
  txtAnoSemestreCursos.text := FormatDateTime('yyyy',DataHoje)+'1';

  case Tipo_Pessoa of
     Pessoa : Begin
		 Pagina.ActivePage := tsPessoa;
		 txtPes_Codigo.SetFocus;
	      end;
     Aluno : Begin
		 Pagina.ActivePage := tsAluno;
		 txtAca_Codigo.SetFocus;
	      end;
     Professor : Begin
		    Pagina.ActivePage := tsProfessor;
		    txtProf_Codigo.SetFocus;
		 End;
  End;

end;

procedure Tfrm_Sel_Pessoa.Filtra;
begin

   qryPessoa.Close;
   
   grdPessoa.DataSource := nil;
   grdAcademico.DataSource := nil;
   grdProfessor.DataSource := nil;
   grdAvancada.DataSource := nil;

   if Pagina.ActivePageIndex = 0 Then
   Begin
      
      grdPessoa.DataSource := dtcAlunos;

      qryPessoa.SQL.Text := 'Select cd_pessoa, nm_Pessoa, ds_cpf from pessoas';
      if txtPes_Codigo.Text <> '' Then
	 qryPessoa.Sql.Add('WHERE cd_pessoa = ' + IntToStr(StrToInt(txtPes_Codigo.Text)) )
      else
	 if txtPes_Nome.Text <> '' Then
	    qryPessoa.SQL.Add('WHERE nm_sem_acento like ''%' + SemAcento( txtPes_Nome.Text ) + '%''' )
	 else
	    qryPessoa.sql.Add('WHERE ds_cpf = ''' + txtPes_cpf.Text + '''');

      qryPessoa.SQL.Add('Order by nm_pessoa');

      qryPessoa.Open;
      qryPessoa.FieldByName('ds_cpf').EditMask := '000\.000\.000\-00;0; ';

   End
   else if Pagina.ActivePageIndex = 1 Then
   Begin

      grdAcademico.DataSource := dtcAlunos;

      if DM.variavel_parametro('pessoas_busca_matriculas') = 'ULTIMA' then
      Begin
         qryPessoa.SQL.Text := 'Select p.cd_pessoa, p.ds_CPF, p.nm_Pessoa, Max(m.turma) turma, Max(m.anosemestre) anosemestre ';
         qryPessoa.SQL.Add('from pessoas p, Matriculas m');
         qryPessoa.SQL.Add('where p.cd_pessoa = m.codigoaluno');
      End
      Else
      Begin
         qryPessoa.SQL.Text := 'Select p.cd_pessoa, p.ds_CPF, p.nm_Pessoa, m.turma, m.anosemestre ';
         qryPessoa.SQL.Add('from pessoas p, Matriculas m');
         qryPessoa.SQL.Add('where p.cd_pessoa = m.codigoaluno');
      End;

      if txtAca_Codigo.Text <> '' Then
      	 qryPessoa.Sql.Add('AND p.cd_pessoa = ' + IntToStr(StrToInt(txtAca_Codigo.Text )) )
      else
      if txtAca_Nome.Text <> '' Then
     	    qryPessoa.SQL.Add('AND p.nm_sem_acento like ''%' + SemAcento( txtAca_Nome.Text ) + '%''' )
      else
	       qryPessoa.sql.Add('AND m.turma = ''' + txtAca_Turma.Text + '''');

      if DM.variavel_parametro('pessoas_busca_matriculas') = 'ULTIMA' then
      Begin
          qryPessoa.SQL.Add(' Group By p.cd_pessoa');
      End;         

      qryPessoa.SQL.Add('Order by nm_pessoa, m.AnoSemestre DESC ');
      qryPessoa.Open;
      qryPessoa.FieldByName('ds_cpf').EditMask := '000\.000\.000-00;0; ';
      TIntegerField(qryPessoa.FieldByName('anosemestre')).DisplayFormat := '0000/0';
      
   End
   else if Pagina.ActivePageIndex = 2 Then
   Begin

      grdProfessor.DataSource := dtcAlunos;

      qryPessoa.SQL.Text := 'Select p.cd_pessoa, p.ds_cpf, p.nm_Pessoa, tm.turma, tm.anosemestre ';
      qryPessoa.SQL.Add('from pessoas p, TurmasProfessores tm');
      qryPessoa.SQL.Add('where p.cd_pessoa = tm.professor');

      if txtProf_Codigo.Text <> '' Then
	 qryPessoa.Sql.Add('AND p.cd_pessoa = ' + IntToStr(StrToInt(txtProf_Codigo.Text)) )
      else
	 if txtProf_Nome.Text <> '' Then
	    qryPessoa.SQL.Add('and p.nm_sem_acento like ''%' + SemAcento( txtProf_Nome.Text ) + '%''' )
	 else
	    qryPessoa.sql.Add('and tm.turma = ''' + txtProf_Turma.Text + '''');

      qryPessoa.SQL.Add('Order by nm_pessoa, tm.AnoSemestre DESC ');
      qryPessoa.Open;
      qryPessoa.FieldByName('ds_cpf').EditMask := '000\.000\.000-00;0; ';
      TIntegerField(qryPessoa.FieldByName('anosemestre')).DisplayFormat := '0000/0';

   End
   else if Pagina.ActivePageIndex = 3 Then
   Begin
      grdAvancada.DataSource := dtcAlunos;

      if (txtCodigo.Text = '') and (txtNome.Text = '') and (txtCPF.Text = '') and
	 (((txtCurso.Text = '') and (txtTurma.Text = '')) or (rgTipo.ItemIndex = 0))
	 and (not cbAnoSem.Checked)
      Then
      Begin
	 qryPessoa.Close;
         flgSearch := false;
	 Exit;
      End;

      if rgTipo.ItemIndex = 0 Then
      Begin
	 qryPessoa.SQL.Text := 'Select cd_pessoa, nm_Pessoa, ds_cpf from pessoas';
	 if txtCodigo.Text <> '' Then
	    qryPessoa.Sql.Add('WHERE cd_pessoa = ' + IntToStr(StrToInt(txtCodigo.Text)) );

	 if txtNome.Text <> '' Then
	    qryPessoa.SQL.Add('WHERE nm_sem_acento like ''%' + SemAcento( txtNome.Text ) + '%''' );
	    
	 if txtCPF.text <> '' Then
	    qryPessoa.sql.Add('WHERE ds_cpf = ''' + txtCPF.text + '''');

	 qryPessoa.SQL.Add('Order by nm_pessoa');

	 grdAvancada.Columns[3].FieldName := '';
	 grdAvancada.Columns[4].FieldName := '';
	 grdAvancada.Columns[3].Visible := False;
	 grdAvancada.Columns[4].Visible := False;

	 qryPessoa.Open;

	 qryPessoa.FieldByName('ds_cpf').EditMask := '000\.000\.000-00;0; ';
      End
      else
      if rgTipo.ItemIndex = 1 Then
      Begin
	 qryPessoa.SQL.Text := 'Select p.cd_pessoa, p.nm_Pessoa, ds_cpf , m.turma, m.anosemestre ';
	 qryPessoa.SQL.Add('from pessoas p, Matriculas m');
	 qryPessoa.SQL.Add('where p.cd_pessoa = m.codigoaluno');

	 if txtCodigo.Text <> '' Then
	    qryPessoa.Sql.Add('AND p.cd_pessoa = ' + IntToStr(StrToInt(txtCodigo.Text)) );

	 if txtNome.Text <> '' Then
	    qryPessoa.SQL.Add('AND p.nm_sem_acento like ''%' + SemAcento( txtNome.Text ) + '%''' );

	 if txtCPF.Text <> '' Then
	    qryPessoa.sql.Add('WHERE ds_cpf = ''' + txtCPF.Text + '''');

	 if cbAnoSem.Checked Then
	    qryPessoa.sql.Add('AND m.anosemestre = ' + txtAnoSemestreCursos.Text + '');

	 if txtTurma.Text <> '' Then
	    qryPessoa.sql.Add('AND m.turma = ''' + txtTurma.Text + '''');

	 if txtCurso.Text <> '' Then
	    qryPessoa.sql.Add('AND m.Curso = ''' + txtCurso.Text + '''');

	 qryPessoa.SQL.Add('Order by nm_pessoa, m.AnoSemestre DESC ');

	 grdAvancada.Columns[3].FieldName := 'Turma';
	 grdAvancada.Columns[4].FieldName := 'AnoSemestre';
	 grdAvancada.Columns[3].Visible := True;
	 grdAvancada.Columns[4].Visible := True;

	 qryPessoa.Open;

	 qryPessoa.FieldByName('ds_cpf').EditMask := '000\.000\.000-00;0; ';
	 TIntegerField(qryPessoa.FieldByName('anosemestre')).DisplayFormat := '0000/0';

      End
      else
      Begin
	 qryPessoa.SQL.Text := 'Select p.cd_pessoa, p.nm_Pessoa, ds_cpf , tm.turma, tm.anosemestre ';
	 qryPessoa.SQL.Add('from pessoas p, TurmasProfessores tm');
	 qryPessoa.SQL.Add('where p.cd_pessoa = tm.professor');

	 if txtCodigo.Text <> '' Then
	    qryPessoa.Sql.Add('AND p.cd_pessoa = ' + IntToStr(StrToInt(txtCodigo.Text)) );

	 if txtNome.Text <> '' Then
	    qryPessoa.SQL.Add('AND p.nm_sem_acento like ''%' + SemAcento( txtNome.Text ) + '%''' );

	 if txtCPF.Text <> '' Then
	    qryPessoa.sql.Add('WHERE ds_cpf = ''' + txtCPF.Text + '''');

	 if cbAnoSem.Checked Then
	    qryPessoa.sql.Add('AND tm.anosemestre = ' + txtAnoSemestreCursos.Text + '');

	 if txtTurma.Text <> '' Then
	    qryPessoa.sql.Add('AND tm.turma = ''' + txtTurma.Text + '''');

	 if txtCurso.Text <> '' Then
	    qryPessoa.sql.Add('AND tm.Curso = ''' + txtCurso.Text + '''');

	 qryPessoa.SQL.Add('Order by nm_pessoa, tm.AnoSemestre DESC ');

	 grdAvancada.Columns[3].FieldName := 'Turma';
	 grdAvancada.Columns[4].FieldName := 'AnoSemestre';
	 grdAvancada.Columns[3].Visible := True;
	 grdAvancada.Columns[4].Visible := True;

	 qryPessoa.Open;

	 qryPessoa.FieldByName('ds_cpf').EditMask := '000\.000\.000-00;0; ';
	 TIntegerField(qryPessoa.FieldByName('anosemestre')).DisplayFormat := '0000/0';

      End;

   End;

   if qryPessoa.Eof Then
   Begin
      Mensagem( 'Dados não encontrados.', Application.Title, MB_OK + MB_ICONINFORMATION );
      flgSearch := false
   End
   else
      case Pagina.ActivePageIndex of
	0 : grdPessoa.SetFocus;
	1 : grdAcademico.SetFocus;
	2 : grdProfessor.SetFocus;
	3 : grdAvancada.Setfocus;
      End;

end;

procedure Tfrm_Sel_Pessoa.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestreCursos.text := DM.incrementar_ano_semestre(txtAnoSemestreCursos.Text);
  end
  else
  begin
     txtAnoSemestreCursos.text := DM.decrementar_ano_semestre(txtAnoSemestreCursos.Text);  
  end;

end;


procedure Tfrm_Sel_Pessoa.txtPes_CodigoEnter(Sender: TObject);
begin
   txtPes_Nome.Clear;
   txtPes_CPF.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtPes_NomeEnter(Sender: TObject);
begin
   txtPes_Codigo.Clear;
   txtPes_CPF.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtPes_CPFEnter(Sender: TObject);
begin
   txtPes_Nome.Clear;
   txtPes_Codigo.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtAca_CodigoEnter(Sender: TObject);
begin
   txtAca_Nome.Clear;
   txtAca_Turma.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtAca_NomeEnter(Sender: TObject);
begin
   txtAca_Codigo.Clear;
   txtAca_Turma.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtAca_TurmaEnter(Sender: TObject);
begin
   txtAca_Nome.Clear;
   txtAca_Codigo.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtProf_CodigoEnter(Sender: TObject);
begin
   txtProf_Nome.Clear;
   txtProf_Turma.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtProf_NomeEnter(Sender: TObject);
begin
   txtProf_Codigo.Clear;
   txtProf_Turma.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtProf_TurmaEnter(Sender: TObject);
begin
   txtProf_Nome.Clear;
   txtProf_Codigo.Clear;
end;

procedure Tfrm_Sel_Pessoa.txtProf_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtProf_Nome.SetFocus
      else
         filtra;
  End;
end;

procedure Tfrm_Sel_Pessoa.txtProf_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtProf_Turma.SetFocus
      else
         filtra;
  End;
end;

procedure Tfrm_Sel_Pessoa.txtProf_TurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtProf_Codigo.SetFocus
      else
	 filtra;
  End;
end;

procedure Tfrm_Sel_Pessoa.txtAca_CodigoKeyPress(Sender: TObject;
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

procedure Tfrm_Sel_Pessoa.txtAca_NomeKeyPress(Sender: TObject;
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

procedure Tfrm_Sel_Pessoa.txtAca_TurmaKeyPress(Sender: TObject;
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

procedure Tfrm_Sel_Pessoa.txtPes_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtPes_Nome.SetFocus
      else
	 filtra;
  End;
end;

procedure Tfrm_Sel_Pessoa.txtPes_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtPes_CPF.SetFocus
      else
	 filtra;
  End;
end;

procedure Tfrm_Sel_Pessoa.txtPes_CPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtPes_Codigo.SetFocus
      else
	 filtra;
  End;

end;

procedure Tfrm_Sel_Pessoa.txtCodigoKeyPress(Sender: TObject;
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

procedure Tfrm_Sel_Pessoa.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
	 txtCodigo.SetFocus
      else
	 filtra;
  End;
end;

procedure Tfrm_Sel_Pessoa.rgTipoClick(Sender: TObject);
begin
   if rgTipo.ItemIndex > 0 Then
   Begin
       cbAnoSem.Enabled := True;
       txtAnoSemestreCursos.Enabled := True;
       UpDownCursos.Enabled := TRue;

       lbCurso.Enabled := True;
       txtCurso.Enabled := True;

       lbTurma.Enabled := True;
       txtTurma.Enabled := True;

   End
   else
   Begin
       cbAnoSem.Enabled := False;
       txtAnoSemestreCursos.Enabled := False;
       UpDownCursos.Enabled := False;

       lbCurso.Enabled := False;
       txtCurso.Enabled := False;

       lbTurma.Enabled := False;
       txtTurma.Enabled := False;

   End;


   Filtra;
end;

procedure Tfrm_Sel_Pessoa.cbAnoSemClick(Sender: TObject);
begin
   FILTRA;
end;

end.
