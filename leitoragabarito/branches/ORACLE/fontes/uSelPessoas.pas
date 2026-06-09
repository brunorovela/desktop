unit uSelPessoas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, General,
  Spin, ComCtrls, Mask, DBCtrls;

type

  TipoPessoa = (Pessoa, Aluno, Professor);

  Tfrm_SelPessoa = class(TForm)
    Panel1: TPanel;
    dtcAlunos: TDataSource;
    qryPessoa: TQuery;
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
    pmQtd: TPopupMenu;
    tsObservacoes: TTabSheet;
    Bevel5: TBevel;
    Label13: TLabel;
    edBuscar: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    grdObs: TDBGrid;
    dbmObs: TDBMemo;
    lbObs: TLabel;
    rbFinanceiras: TRadioButton;
    rbEspeciais: TRadioButton;
    rbSecretaria: TRadioButton;
    rbPedagogicas: TRadioButton;
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
    procedure pmQtdPopup(Sender: TObject);
    procedure edBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure rbFinanceirasClick(Sender: TObject);
    procedure rbEspeciaisClick(Sender: TObject);
    procedure rbSecretariaClick(Sender: TObject);
    procedure rbPedagogicasClick(Sender: TObject);
    procedure grdObsDblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Filtra;
  public
    { Public declarations }
    flgSearch : Boolean;
    Tipo_Pessoa : TipoPessoa;   
  end;

var
  frm_SelPessoa: Tfrm_SelPessoa;

implementation

uses uDM, Main, uSenha;

{$R *.DFM}

procedure Tfrm_SelPessoa.grdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    flgSearch := True;
    Close;
  end;
end;


procedure Tfrm_SelPessoa.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelPessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
    VK_ESCAPE : Close;
  end;
end;


procedure Tfrm_SelPessoa.grdPessoaDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_SelPessoa.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
  edBuscar.CharCase := ecNormal;

  dbmObs.DataField :=  '';

  { Verificar se o usuário pode acessar as observações }
  // Observações Secretaria
  if not PasswordDlg.Autorizar( 1017, taAcessar, False ) then rbSecretaria.Enabled := false;
  // Observações Pedagógicas
  if not PasswordDlg.Autorizar( 1021, taAcessar, False ) then rbPedagogicas.Enabled := false;
  // Observações Financeiras
  if not PasswordDlg.Autorizar( 2019, taAcessar, False ) then rbFinanceiras.Enabled := false;
  // Observações Financeiras Especiais
  if not PasswordDlg.Autorizar( 2024, taAcessar, False ) then rbEspeciais.Enabled := false;

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

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

end;

procedure Tfrm_SelPessoa.Filtra;
begin

   qryPessoa.Close;
   
   grdPessoa.DataSource := nil;
   grdAcademico.DataSource := nil;
   grdProfessor.DataSource := nil;
   grdAvancada.DataSource := nil;

 	 grdAvancada.Columns[2].Title.Caption := 'CPF';
 	 grdAvancada.Columns[3].Title.Caption := 'Turma';
 	 grdAvancada.Columns[2].Width := 84;
 	 grdAvancada.Columns[3].Width := 77;
 	 grdAvancada.Columns[2].Alignment := taLeftJustify;

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
      else if rgTipo.ItemIndex = 2 then
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

      End
      else
      if rgTipo.ItemIndex = 3 Then
      Begin

         qryPessoa.SQL.Clear;
         qryPessoa.SQL.Add('SELECT ');
         qryPessoa.SQL.Add('	DISTINCT(aluno.cd_pessoa), ');
         qryPessoa.SQL.Add('	aluno.nm_pessoa, ');
         qryPessoa.SQL.Add('	respfinan.cd_pessoa AS cd_respfinan, ');
         qryPessoa.SQL.Add('	respfinan.nm_pessoa AS nm_respfinan ');
         qryPessoa.SQL.Add('FROM ');
         qryPessoa.SQL.Add('	pessoas aluno, ');
         qryPessoa.SQL.Add('	pessoas respfinan, ');
         qryPessoa.SQL.Add('	fichaindividual fi ');
         qryPessoa.SQL.Add('WHERE ');
         qryPessoa.SQL.Add('	aluno.cd_resp_finan = respfinan.cd_pessoa AND ');
         qryPessoa.SQL.Add('	fi.codigoaluno = aluno.cd_pessoa ');

      	 if txtCodigo.Text <> '' Then
      	    qryPessoa.SQL.Add('AND respfinan.cd_pessoa = ' + IntToStr(StrToInt(txtCodigo.Text)) + ' ' );

      	 if txtNome.Text <> '' Then
      	    qryPessoa.SQL.Add('AND respfinan.nm_sem_acento LIKE ''%' + SemAcento( txtNome.Text ) + '%'' ' );

      	 if txtCPF.Text <> '' Then
      	    qryPessoa.SQL.Add('AND respfinan.ds_cpf = ''' + txtCPF.Text + ''' ' );

      	 if cbAnoSem.Checked Then
      	    qryPessoa.sql.Add('AND fi.anosemestre = ' + txtAnoSemestreCursos.Text + ' ');

      	 if txtTurma.Text <> '' Then
      	    qryPessoa.sql.Add('AND fi.turma = ''' + txtTurma.Text + ''' ');

      	 if txtCurso.Text <> '' Then
      	    qryPessoa.sql.Add('AND fi.curso = ''' + txtCurso.Text + ''' ');

      	 qryPessoa.SQL.Add('Order by aluno.nm_pessoa, fi.anosemestre DESC ');

      	 grdAvancada.Columns[2].Title.Caption := 'Cod. Resp.';
      	 grdAvancada.Columns[3].Title.Caption := 'Nome do responsável';

      	 grdAvancada.Columns[2].Width := 65;
      	 grdAvancada.Columns[3].Width := 150;

      	 grdAvancada.Columns[2].Alignment := taCenter;

      	 grdAvancada.Columns[2].FieldName := 'cd_respfinan';
      	 grdAvancada.Columns[3].FieldName := 'nm_respfinan';

      	 grdAvancada.Columns[2].Visible := True;
      	 grdAvancada.Columns[3].Visible := True;
      	 grdAvancada.Columns[4].Visible := False;

      	 qryPessoa.Open;

      End;
   End
   else if Pagina.ActivePageIndex = 4 Then
   Begin

     if (edBuscar.Text <> '') AND ((rbFinanceiras.Checked) OR (rbEspeciais.Checked) OR (rbSecretaria.Checked) OR (rbPedagogicas.Checked)) then
     begin
      qryPessoa.SQL.Clear;
      qryPessoa.SQL.Add('SELECT ');
      qryPessoa.SQL.Add(' p.cd_pessoa, ');
      qryPessoa.SQL.Add(' p.nm_pessoa, ');

      if (rbFinanceiras.Checked) then
        qryPessoa.SQL.Add(' of.observacoes');
      if (rbEspeciais.Checked) then
        qryPessoa.SQL.Add(' of.observacoes_especiais AS observacoes');
      if (rbSecretaria.Checked) then
        qryPessoa.SQL.Add(' os.observacoes');
      if (rbPedagogicas.Checked) then
        qryPessoa.SQL.Add(' os.obs_pedagogicas AS observacoes');

      qryPessoa.SQL.Add('FROM ');
      qryPessoa.SQL.Add(' pessoas p, ');

      if (rbFinanceiras.Checked) OR (rbEspeciais.Checked) then
        qryPessoa.SQL.Add(' observacoesfinanceiras of');
      if (rbSecretaria.Checked) OR (rbPedagogicas.Checked) then
        qryPessoa.SQL.Add(' observacoessecretaria os');

      qryPessoa.SQL.Add('WHERE ');
      if (rbFinanceiras.Checked) OR (rbEspeciais.Checked) then
        qryPessoa.SQL.Add(' of.codigoaluno = p.cd_pessoa ');
      if (rbSecretaria.Checked) OR (rbPedagogicas.Checked) then
        qryPessoa.SQL.Add(' os.codigoaluno = p.cd_pessoa ');

      if (rbFinanceiras.Checked) then
        qryPessoa.SQL.Add(' AND of.observacoes LIKE :observacoes');
      if (rbEspeciais.Checked) then
        qryPessoa.SQL.Add(' AND of.observacoes_especiais LIKE :observacoes');
      if (rbSecretaria.Checked) then
        qryPessoa.SQL.Add(' AND os.observacoes LIKE :observacoes');
      if (rbPedagogicas.Checked) then
        qryPessoa.SQL.Add(' AND os.obs_pedagogicas LIKE :observacoes');

      qryPessoa.ParamByName('observacoes').AsString := '%' + edBuscar.Text + '%';

      qryPessoa.Open;

      grdObs.DataSource := dtcAlunos;
      dbmObs.DataSource := dtcAlunos;
      dbmObs.DataField := 'observacoes';

      if (rbFinanceiras.Checked) then
        lbObs.Caption := 'Observações Financeiras';
      if (rbEspeciais.Checked) then
        lbObs.Caption := 'Observações Especiais';
      if (rbSecretaria.Checked) then
        lbObs.Caption := 'Observações da Secretaria';
      if (rbPedagogicas.Checked) then
        lbObs.Caption := 'Observações Pedagógicas';

     End;

   End;

   if qryPessoa.Eof Then
   Begin
      Messagedlg( 'Dados não encontrados.', mtInformation, [mbOk], 0);
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

procedure Tfrm_SelPessoa.UpDownCursosClick(Sender: TObject;
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


procedure Tfrm_SelPessoa.txtPes_CodigoEnter(Sender: TObject);
begin
   txtPes_Nome.Clear;
   txtPes_CPF.Clear;
end;

procedure Tfrm_SelPessoa.txtPes_NomeEnter(Sender: TObject);
begin
   txtPes_Codigo.Clear;
   txtPes_CPF.Clear;
end;

procedure Tfrm_SelPessoa.txtPes_CPFEnter(Sender: TObject);
begin
   txtPes_Nome.Clear;
   txtPes_Codigo.Clear;
end;

procedure Tfrm_SelPessoa.txtAca_CodigoEnter(Sender: TObject);
begin
   txtAca_Nome.Clear;
   txtAca_Turma.Clear;
end;

procedure Tfrm_SelPessoa.txtAca_NomeEnter(Sender: TObject);
begin
   txtAca_Codigo.Clear;
   txtAca_Turma.Clear;
end;

procedure Tfrm_SelPessoa.txtAca_TurmaEnter(Sender: TObject);
begin
   txtAca_Nome.Clear;
   txtAca_Codigo.Clear;
end;

procedure Tfrm_SelPessoa.txtProf_CodigoEnter(Sender: TObject);
begin
   txtProf_Nome.Clear;
   txtProf_Turma.Clear;
end;

procedure Tfrm_SelPessoa.txtProf_NomeEnter(Sender: TObject);
begin
   txtProf_Codigo.Clear;
   txtProf_Turma.Clear;
end;

procedure Tfrm_SelPessoa.txtProf_TurmaEnter(Sender: TObject);
begin
   txtProf_Nome.Clear;
   txtProf_Codigo.Clear;
end;

procedure Tfrm_SelPessoa.txtProf_CodigoKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtProf_NomeKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtProf_TurmaKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtAca_CodigoKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtAca_NomeKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtAca_TurmaKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtPes_CodigoKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtPes_NomeKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtPes_CPFKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtCodigoKeyPress(Sender: TObject;
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

procedure Tfrm_SelPessoa.txtCursoKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_SelPessoa.rgTipoClick(Sender: TObject);
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

       { #SE= Se a opção selecionada for Responsável }
       if rgTipo.ItemIndex = 3 then
       { #ENTAO= Altera as opções da grade grdAvancada}
       begin
          
       { #FIMSE= Fim}
       end;

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

procedure Tfrm_SelPessoa.cbAnoSemClick(Sender: TObject);
begin
   FILTRA;
end;

procedure Tfrm_SelPessoa.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryPessoa, pmQtd);

end;

procedure Tfrm_SelPessoa.edBuscarKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_SelPessoa.rbFinanceirasClick(Sender: TObject);
begin
  edBuscar.SetFocus;
  if edBuscar.Text <> '' then
    filtra;
end;

procedure Tfrm_SelPessoa.rbEspeciaisClick(Sender: TObject);
begin
  edBuscar.SetFocus;
  if edBuscar.Text <> '' then
    filtra;
end;

procedure Tfrm_SelPessoa.rbSecretariaClick(Sender: TObject);
begin
  edBuscar.SetFocus;
  if edBuscar.Text <> '' then
    filtra;
end;

procedure Tfrm_SelPessoa.rbPedagogicasClick(Sender: TObject);
begin
  edBuscar.SetFocus;
  if edBuscar.Text <> '' then
    filtra;
end;

procedure Tfrm_SelPessoa.grdObsDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.
