unit uCadEquiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, Db, ZConnection,
  Menus, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMComboBox, uItemCombo;

type
  Tipo = (Alteracao, Inclusao);
  TfrmCadEquiv = class(TForm)
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    eCurso: TEdit;
    eDisciplina: TEdit;
    eAnoSemestre: TMaskEdit;
    eCH: TEdit;
    eNota: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    tblGrade: TUMZQuery;
    dsGrade: TDataSource;
    qRegistraEquiv: TUMZQuery;
    qRegistraDisc: TUMZQuery;
    qVerificaEquiv: TUMZQuery;
    tblGradeSerie: TSmallintField;
    pmQtd: TPopupMenu;
    eInstituicao: TEdit;
    eProfessor: TEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    eConceito: TEdit;
    Label9: TLabel;
    ckbHistorico: TCheckBox;
    eFrequencia: TEdit;
    Label10: TLabel;
    tblGradeDisciplina: TIntegerField;
    eConteudoEquivalente: TEdit;
    Label11: TLabel;
    tblGradeDescricao: TStringField;
    tblGradecurso: TStringField;
    Label31: TLabel;
    dbSituacao: TUMComboBox;
    procedure ckbHistoricoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eFrequenciaKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure dsGradeDataChange(Sender: TObject; Field: TField);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure eInstituicaoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      FBloqueiaCreditosAlunosFIES: Boolean;
      procedure carregaComboSituacao();
    { Private declarations }
  public
    { Public declarations }
    Estado : Tipo;
    CodigoEquiv : Integer;
    cd_situacao : String;
  end;

var
  frmCadEquiv: TfrmCadEquiv;


implementation

uses uEquivalencias, uDM, uFSelecionarPessoa, Variants, uUsuario, uUMNucleo;

{$R *.DFM}

procedure TfrmCadEquiv.BitBtn1Click(Sender: TObject);
const
   FORMATO_LOG =
      'Código do aluno: :codigoaluno, ' +
      'Disciplina: :disciplina, ' +
      'Curso: :curso, ' +
      'Eq_Instituicao: :eq_instituicao, ' +
      'Eq_Curso: :eq_curso, ' +
      'Eq_Disciplina: :eq_disciplina, ' +
      'Eq_AnoSemestre: :eq_anosemestre, ' +
      'Eq_CH: :eq_ch, ' +
      'Eq_Nota: :eq_nota, ' +
      'Professor: :cd_professor, ' +
      'Conceito: :ds_conceito, ' +
      'Eq_frequencia: :eq_frequencia, ' +
      'Eq_equivalencia: :eq_equivalencia ' +
      'Situacao: :cd_situacao';
var
   log, operacao, chave,cdSituacao: String;
begin
   if Estado = Inclusao then begin
     qRegistraDisc.Close();
     qRegistraDisc.SQL.Clear;
     qRegistraDisc.SQL.Text :=
        ' Insert Into EquivalenciasDisciplinas (CodigoAluno, Disciplina, Curso, Eq_Instituicao, ' +
        ' Eq_Curso, Eq_Disciplina, Eq_AnoSemestre, Eq_CH, Eq_Nota, cd_professor, ds_conceito, eq_frequencia, eq_equivalencia, cd_situacao) ' +
        ' VALUES (:CodigoAluno, :Disciplina, :Curso, :Eq_Instituicao, ' +
        ' :Eq_Curso, :Eq_Disciplina, :Eq_AnoSemestre, :Eq_CH, :Eq_Nota, :cd_professor, :ds_conceito, :eq_frequencia, :eq_equivalencia, :cd_situacao) ';
     operacao := 'Inclusao';   
   end
   else begin
     qRegistraDisc.Close();
     qRegistraDisc.SQL.Clear;
     qRegistraDisc.SQL.Text :=
        ' UPDATE EquivalenciasDisciplinas SET ' +
        ' CodigoAluno = :CodigoAluno, Disciplina = :Disciplina, Curso = :Curso, ' +
        ' Eq_Instituicao = :Eq_Instituicao, Eq_Curso = :Eq_Curso, Eq_Disciplina = :Eq_Disciplina, ' +
        ' Eq_AnoSemestre = :Eq_AnoSemestre, Eq_CH = :Eq_CH, Eq_Nota = :Eq_Nota, ' +
        ' cd_professor = :cd_professor, ds_conceito = :ds_conceito, Eq_Frequencia = :Eq_Frequencia, '+
        ' eq_equivalencia = :eq_equivalencia, '+
        ' cd_situacao = :cd_situacao '+
        ' WHERE codigoequivalencias = ' + IntToStr(CodigoEquiv);
      operacao := 'Alteracao';
   end;
   
   if Trim(eDisciplina.Text) = '' Then Begin
      Mensagem('Digite o nome da Disciplina de eqüivalência.');
      eDisciplina.SetFocus;
      Abort;
   End;
   if Trim(eAnoSemestre.Text) = '' Then Begin
      Mensagem('Digite o ano e semestre que cursou a Disciplina.');
      eAnoSemestre.SetFocus;
      Abort;
   End;
//   if Trim(eProfessor.Text) = '' Then Begin
//      Mensagem('Digite o código do professor.');
//      eProfessor.SetFocus;
//      Abort;
//   End;
//   if Trim(eCH.Text) = '' Then Begin
//      Mensagem('Digite a carga horária da disciplina de eqüivalência.');
//      eCH.SetFocus;
//      Abort;
//   End;
   if ((Trim(enota.Text) = '') and (eConceito.Text = '')) Then Begin
      Mensagem('Digite a nota ou conceito que obteve na Disciplina de eqüivalência.');
      eNota.SetFocus;
      Abort;
   End;

   if (Trim(eFrequencia.Text) = '') Then Begin
      Mensagem('Digite o percentual de frequência que obteve na Disciplina de equivalência.');
      eFrequencia.SetFocus;
      Abort;
   End;

   if ((StrToInt(eFrequencia.Text) < 0) or (StrToInt(eFrequencia.Text) > 100)) Then Begin
      Mensagem('O percentual de frequência deve estar entre 0 e 100.');
      eFrequencia.SetFocus;
      Abort;
   End;

   if (eConteudoEquivalente.Text = '') then
      qRegistraDisc.ParamByName('eq_equivalencia').Clear
   else
   begin
      if ((StrToInt(eConteudoEquivalente.Text) < 0) or (StrToInt(eConteudoEquivalente.Text) > 100)) Then Begin
         Mensagem('O percentual do conteúdo de equivalência deve estar entre 0 e 100.');
         eConteudoEquivalente.SetFocus;
         Abort;
      End;
      qRegistraDisc.ParamByName('eq_equivalencia').Value := Trim(eConteudoEquivalente.Text);
   end;

   if ((dbSituacao.ItemIndex = 0) OR (dbSituacao.ItemIndex = -1)) Then Begin
      Mensagem('Você deve selecionar uma situação para a equivalência.');
      dbSituacao.SetFocus;
      Abort;
   End;

   qVerificaEquiv.close;
   qVerificaEquiv.ParamByName('CodigoAluno').Value := frmEquivalencias.tblMatriculasCodigoAluno.Value;
   qVerificaEquiv.ParamByName('Disciplina').Value := tblGradeDisciplina.Value;

   // CLAUDIONOR - Considerar o curso da grade e não da matricula
   // qVerificaEquiv.ParamByName('Curso').Value := frmEquivalencias.tblMatriculasCurso.Value;
   qVerificaEquiv.ParamByName('Curso').Value := tblGradecurso.AsString;
   qVerificaEquiv.Open;

   if qVerificaEquiv.Eof Then   { Não foi registrado equivalência com essa disciplina }
   Begin
       { Registrar Equivalência na tabela de Equivalencias }
       qRegistraEquiv.ParamByName('CodigoAluno').Value := frmEquivalencias.tblMatriculasCodigoAluno.Value;

       // CLAUDIONOR - Considerar o curso da grade e não da matricula
       // qRegistraEquiv.ParamByName('Curso').Value := frmEquivalencias.tblMatriculasCurso.Value;
       qRegistraEquiv.ParamByName('Curso').Value := tblGradecurso.AsString;
       qRegistraEquiv.ParamByName('Disciplina').Value := tblGradeDisciplina.Value;
       qRegistraEquiv.ParamByName('Serie').Value := tblGradeSerie.Value;
       qRegistraEquiv.ExecSql;
   End;

   { Registrar Equivalencias na tabela de EquivalenciasDisciplinas }

   { Verificar o Tipo de Ação }

   log := FORMATO_LOG;

   qRegistraDisc.ParamByName('CodigoAluno').Value := frmEquivalencias.tblMatriculasCodigoAluno.Value;
   log := StringReplace(log, ':codigoaluno', IntToStr(frmEquivalencias.tblMatriculasCodigoAluno.Value), [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Curso').Value := tblGradecurso.AsString;
   log := StringReplace(log, ':Curso', tblGradecurso.AsString, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Disciplina').Value := tblGradeDisciplina.Value;
   log := StringReplace(log, ':Disciplina', IntToStr(tblGradeDisciplina.Value), [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Eq_Instituicao').Value := eInstituicao.Text;
   log := StringReplace(log, ':Eq_Instituicao', eInstituicao.Text, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Eq_Curso').Value := eCurso.Text;
   log := StringReplace(log, ':Eq_Curso', eCurso.Text, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Eq_Disciplina').Value := eDisciplina.Text;
   log := StringReplace(log, ':Eq_Disciplina', eDisciplina.Text, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Eq_AnoSemestre').Value := StrToInt(eAnoSemestre.Text);
   log := StringReplace(log, ':Eq_AnoSemestre', eAnoSemestre.Text, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Eq_CH').AsString := eCH.Text;
   log := StringReplace(log, ':Eq_CH', eCH.Text, [rfReplaceAll, rfIgnoreCase]);

   if (eNota.Text <> '') then begin
      qRegistraDisc.ParamByName('Eq_Nota').AsFloat := RC_StrToFloat(eNota.Text);
   end
   else begin
     qRegistraDisc.ParamByName('Eq_Nota').Clear();
     qRegistraDisc.ParamByName('Eq_Nota').DataType := ftFloat;
   end;
   log := StringReplace(log, ':Eq_Nota', qRegistraDisc.ParamByName('Eq_Nota').AsString, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('cd_professor').AsString := eProfessor.Text;
   log := StringReplace(log, ':cd_professor', eProfessor.Text, [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('ds_conceito').Value := Trim(eConceito.Text);
   log := StringReplace(log, ':ds_conceito', Trim(eConceito.Text), [rfReplaceAll, rfIgnoreCase]);

   qRegistraDisc.ParamByName('Eq_Frequencia').Value := Trim(eFrequencia.Text);
   log := StringReplace(log, ':Eq_Frequencia', Trim(eFrequencia.Text), [rfReplaceAll, rfIgnoreCase]);

   cdSituacao := TItemCombo(dbSituacao.Items.Objects[dbSituacao.ItemIndex]).getCodigo;
   qRegistraDisc.ParamByName('cd_situacao').Value := cdSituacao;
   log := StringReplace(log, ':cd_situacao', cdSituacao, [rfReplaceAll, rfIgnoreCase]);

   
   qRegistraDisc.ExecSql;

   chave := '';

   if operacao = 'Alteracao' then
   begin
      chave := IntToStr(CodigoEquiv);
   end;

   DM.setLog(1000001, operacao, chave, 0, log);

   //verifica se é pra registrar tambem a nota na equivalencia
   if (ckbHistorico.Checked) then begin
      //localiza o registro lá
      frmEquivalencias.AtualizaEquiv();

      if (frmEquivalencias.tblEquiv.Locate('CodigoAluno;Curso;Disciplina',
         VarArrayOf([frmEquivalencias.tblMatriculasCodigoAluno.Value, tblGradecurso.AsString,
         tblGradeDisciplina.Value]), [])) then begin
         //achou, registra nota e conceito e frequencia na ficha
         frmEquivalencias.registrarFichaIndividual(Trim(eNota.Text), Trim(eConceito.Text), Trim(eFrequencia.Text), Trim(eCH.Text), cdSituacao);

      end;
   end;

   Close;
end;

procedure TfrmCadEquiv.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadEquiv.carregaComboSituacao();
const
   SQL_BUSCA_SITUACAO =
      ' SELECT '+
      '     cd_situacao, '+
      '     ds_situacao '+
      '  FROM '+
      '     situacao ' +
      '  Where '+
      '     sn_equivalencia = 1';
var
   qryBuscaSituacoes: TUMZReadOnlyQuery;
   i :integer;
begin
   dbSituacao.Items.Clear;

   DM.CriarConsulta(qryBuscaSituacoes);

   qryBuscaSituacoes.SQL.Text := SQL_BUSCA_SITUACAO;
   qryBuscaSituacoes.Open;

   dbSituacao.AddItem(
      'Selecione',
      TItemCombo.Create(
         '0',
         'Selecione'
      )
   );


   
   while not qryBuscaSituacoes.Eof do
   begin
      dbSituacao.AddItem(
         qryBuscaSituacoes.FieldByName('ds_situacao').AsString,
         TItemCombo.Create(
            qryBuscaSituacoes.FieldByName('cd_situacao').AsString,
            qryBuscaSituacoes.FieldByName('ds_situacao').AsString
         )
      );

      if(qryBuscaSituacoes.RecordCount = 1) then
      begin
         dbSituacao.ItemIndex := 1;
         dbSituacao.Enabled := false;
      end;

      qryBuscaSituacoes.Next;
   end;

   if(dbSituacao.ItemIndex = -1) then
   begin
      dbSituacao.ItemIndex := 0;
   end;

   if(cd_situacao > '0') then
   begin
      i := 0;
      while i < dbSituacao.Items.Count  do
      begin
         if TItemCombo(dbSituacao.Items.Objects[i]).getCodigo = cd_situacao then
         begin
            dbSituacao.ItemIndex := i;
            break;   
         end;
         inc(i);
      end;
   end;
end;

procedure TfrmCadEquiv.ckbHistoricoClick(Sender: TObject);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Registrar histórico da disciplina implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível registrar disciplinas no histórico escolar do aluno.';
begin
   Application.ProcessMessages;
   
   if ckbHistorico.Checked and FBloqueiaCreditosAlunosFIES and
      DM.IsAlunoFIES(frmEquivalencias.tblMatriculasCodigoAluno.AsInteger) then
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

      DM.tblFichaIndividual.ParamByName('codigoaluno').AsInteger := frmEquivalencias.tblMatriculasCodigoAluno.AsInteger;
      DM.tblFichaIndividual.ParamByName('curso').AsString := tblGradecurso.AsString;
      DM.tblFichaIndividual.ParamByName('disciplina').AsInteger := tblGradeDisciplina.Value;
      DM.tblFichaIndividual.ParamByName('anosemestre').AsInteger := frmEquivalencias.tblMatriculasAnoSemestre.AsInteger;
      DM.tblFichaIndividual.ParamByName('situacao').AsInteger := 1;
      DM.tblFichaIndividual.Open;

      // recalcular o valor dos créditos financeiros do aluno SOMENTE SE O ALUNO ESTIVER CURSANDO A DISCIPLINA NO ANOSEMESTRE ATUAL
      if not DM.tblFichaIndividual.Eof then
      begin

         if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
         begin
            if MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
            begin
               ckbHistorico.Checked := False;
            end
            else
               FBloqueiaCreditosAlunosFIES := False;
         end
         else
         begin
            MessageDlg(SMsgBloqueio, mtInformation, [mbOK], -1);
            ckbHistorico.Checked := False;
         end;

      end;

   end;
end;

procedure TfrmCadEquiv.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblGrade, pmQtd);

end;

procedure TfrmCadEquiv.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if not resultado_filtro.filtrado then Exit;
   eProfessor.Text := IntToStr(resultado_filtro.cd_pessoa);
end;

procedure TfrmCadEquiv.FormCreate(Sender: TObject);
begin
   FBloqueiaCreditosAlunosFIES :=
      DM.variavel_parametro('BLOQUEAR.AJUSTE.CREDITO.FIES') = 'S';
   cd_situacao := '0';
end;

procedure TfrmCadEquiv.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   DM.tblInstituicoes.Close();
   DM.tblInstituicoes.Open();

   eAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   Label4.Visible := eAnoSemestre.Visible;
   carregaComboSituacao();
end;

procedure TfrmCadEquiv.eFrequenciaKeyPress(Sender: TObject; var Key: Char);
begin

    if not ((key in ['0'..'9']) or (key = #8)) then
    begin
       key := #0;
    end;

end;

procedure TfrmCadEquiv.eInstituicaoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   end
end;

procedure TfrmCadEquiv.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   end
end;

procedure TfrmCadEquiv.DBGrid2CellClick(Column: TColumn);
begin
   eInstituicao.SetFocus();
end;

procedure TfrmCadEquiv.dsGradeDataChange(Sender: TObject; Field: TField);
begin
   eDisciplina.Text := tblGradeDescricao.AsString;
   if eAnoSemestre.Text = '' then begin
      eAnoSemestre.Text := '00000';
   end;

end;

procedure TfrmCadEquiv.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   end
end;

end.

