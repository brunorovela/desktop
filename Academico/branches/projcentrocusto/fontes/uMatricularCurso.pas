unit uMatricularCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZConnection, StdCtrls, Mask, DBCtrls, Buttons, uDM,
  ComCtrls, ToolWin, ImgList, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ZSqlUpdate,
  UMLookupComboBox, uItemCombo;

type
  TFrmMatricularCurso = class(TForm)
    Panel3: TPanel;
    qyMatriculaCurso: TUMZQuery;
    qyMatriculaCursocd_pessoa: TIntegerField;
    qyMatriculaCursonr_matricula: TStringField;
    qyMatriculaCursocd_curso: TStringField;
    qyMatriculaCursocd_turno: TStringField;
    qyMatriculaCursodt_ingresso: TDateTimeField;
    qyMatriculaCursodt_conclusao: TDateTimeField;
    qyMatriculaCursodt_colacao: TDateTimeField;
    qyMatriculaCursodt_exp_diploma: TDateTimeField;
    qyMatriculaCursodt_saida: TDateTimeField;
    qyMatriculaCursods_obs: TStringField;
    Label1: TLabel;
    dbCurso: TDBEdit;
    dsMatriculaCurso: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    lbDataSaida: TLabel;
    DbDataSaida: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    btnCurso: TSpeedButton;
    DBComboBox1: TDBComboBox;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    qyMatriculaCursodescIngressos: TStringField;
    Label8: TLabel;
    DBLookupComboBox1: TUMLookupComboBox;
    Label9: TLabel;
    ImageList2: TImageList;
    ImageList1: TImageList;
    ToolBar4: TToolBar;
    btnConfirmar: TToolButton;
    ToolButton8: TToolButton;
    btnCancelar: TToolButton;
    qySituacoes: TUMZQuery;
    qyMatriculaCursods_situacao: TStringField;
    lbSituacao: TLabel;
    dbSituacao: TUMLookupComboBox;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    qyMatriculaCursonr_anosem_ingresso: TLargeintField;
    qyMatriculaCursocd_ingresso: TLargeintField;
    qyMatriculaCursocd_instituicao: TLargeintField;
    qyMatriculaCursocd_situacao: TLargeintField;
    qyMatriculaCursonr_anosem_conclusao: TLargeintField;
    qyMatriculaCursoCD_MATRICULA_CURSO: TLargeintField;
    DBLookupComboBox3: TUMLookupComboBox;
    dtcCursosColigadas: TDataSource;
    qyCursosColigadas: TUMZQuery;
    qyCursosColigadasds_grade: TStringField;
    btnConcurso: TSpeedButton;
    qyIncricoes: TUMZQuery;
    qyIncricoesqtd_inscricoes: TLargeintField;
    qySituacaoMatricula: TUMZQuery;
    qySituacaoMatriculaqtd_cursando: TLargeintField;
    qyMatriculaCursocd_grade: TLargeintField;
    qyCursosColigadasCD_GRADE: TLargeintField;
    qusMatriculasCurso: TZUpdateSQL;
    DBComboBox2: TDBComboBox;
    qryIngressos: TUMZReadOnlyQuery;
    qryIngressoscd_ingresso: TIntegerField;
    qryIngressosds_ingresso: TStringField;
    dsIngressos: TDataSource;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    qyMatriculaCursoNR_MEDIA_CURSO: TFloatField;
    qyMatriculaCursoNR_CERT_FOLHA: TLargeintField;
    qyMatriculaCursoNR_CERT_REGISTRO: TLargeintField;
    qyMatriculaCursoCD_CERT_LIVRO: TLargeintField;
    qyMatriculaCursoSN_GERADO_MANUAL: TSmallintField;
    qyCertificadoLivro: TUMZQuery;
    dsCertLivro: TDataSource;
    qyCertificadoLivrocd_cert_livro: TLargeintField;
    qyCertificadoLivronm_livro: TStringField;
    cbCertificado: TComboBox;
    btnGeraNroMatricula: TSpeedButton;
    procedure btnGeraNroMatriculaClick(Sender: TObject);
    procedure cbCertificadoChange(Sender: TObject);
    procedure cbCertificadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbCertificadoClick(Sender: TObject);
    procedure cbCertificadoMouseLeave(Sender: TObject);
    procedure cbCertificadoMouseEnter(Sender: TObject);
    procedure dsMatriculaCursoStateChange(Sender: TObject);
    procedure DBComboBox2Change(Sender: TObject);
    procedure DBComboBox2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure qyMatriculaCursoAfterOpen(DataSet: TDataSet);
    procedure btnConcursoClick(Sender: TObject);
    procedure qyMatriculaCursoNewRecord(DataSet: TDataSet);
    procedure qyMatriculaCursoBeforeOpen(DataSet: TDataSet);
    procedure dbCursoKeyPress(Sender: TObject; var Key: Char);
    procedure qyMatriculaCursoBeforePost(DataSet: TDataSet);
    procedure btnCursoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    comboIndex : Integer;
    iRetorno : Integer;
    iAluno : Integer;
    procedure setaGradeCurso( cd_curso: String; cd_coligada: Integer );
    function retornaCodigoInstituicaoSelecionado(ds_instituicao : String ): String;
  public
    { Public declarations }
    iAnoSemAtual : Integer;
    iIngressoPadrao : Integer;    
    Procedure SelecionarMatricula(CodMatricula : Integer);
    Procedure EditarMatricula(CodMatricula : Integer);
    Function IncluirMatricula(CodAluno : Integer; AnoSem : Integer) : Integer;
    Function ObterUltimoCodigo(CodAluno : Integer) : Integer;
  end;

var
  FrmMatricularCurso: TFrmMatricularCurso;
  comboBloqueada: Boolean;

implementation

uses uFSelecionarCurso, uSelConcurso, uCursoColigada;

{$R *.dfm}

{ TFrmMatricularCurso }

procedure TFrmMatricularCurso.btnCancelarClick(Sender: TObject);
begin
   iRetorno := -1;
   qyMatriculaCurso.Cancel();
   Close();
end;

procedure TFrmMatricularCurso.btnConcursoClick(Sender: TObject);
begin

   // Cria a tela de busca por concurso
   fSelConcurso := TSelConcurso.Create( self );

   fSelConcurso.qyConcursos.Close();

   // Seta a pessoa e coligada na query de concursos
   fSelConcurso.qyConcursos.ParamByName('cd_pessoa').AsInteger := iAluno;

   fSelConcurso.qyConcursos.SQL.Add(' AND cuc.cd_coligada in ('+DM.GetColigadas()+')');

   fSelConcurso.qyConcursos.Open();

   // Cria a tela de busca por concurso   
   fSelConcurso.ShowModal();

   // Se foi selecionado um concurso   
   if fSelConcurso.flgSearch then
   begin
     qyMatriculaCursocd_curso.AsString := fSelConcurso.qyConcursos.FieldByName('cd_curso').AsString;
     qyMatriculaCursonr_anosem_ingresso.AsInteger := fSelConcurso.qyConcursos.FieldByName('nr_anosemestre').AsInteger;
     qyMatriculaCursocd_grade.AsInteger := fSelConcurso.qyConcursos.FieldByName('cd_grade').AsInteger;
     if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
     else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSemAtual );

     qyCursosColigadas.Close();
     qyCursosColigadas.ParamByName('CD_CURSO').AsString := qyMatriculaCursocd_curso.AsString;
     qyCursosColigadas.Open();

     setaGradeCurso( qyMatriculaCursocd_curso.AsString, fSelConcurso.qyConcursos.FieldByName('cd_coligada').AsInteger );
   end;

end;

procedure TFrmMatricularCurso.btnConfirmarClick(Sender: TObject);
begin
   if qyMatriculaCurso.State in [dsInsert, dsEdit] then
   begin
      qyMatriculaCursocd_instituicao.AsString := retornaCodigoInstituicaoSelecionado(DBComboBox2.Items[DBComboBox2.ItemIndex]);

      if qyMatriculaCursoSN_GERADO_MANUAL.asString = '' then
      begin
         qyMatriculaCursoSN_GERADO_MANUAL.AsInteger := 1;  
      end;

      if cbCertificado.ItemIndex > -1 then
      begin
         qyMatriculaCursoCD_CERT_LIVRO.AsInteger := StrToInt(TItemCombo(cbCertificado.Items.Objects[cbCertificado.ItemIndex]).getCodigo());
      end;

      qyMatriculaCurso.Post();
   end;
   iRetorno := ObterUltimoCodigo(iAluno);

   qyMatriculaCurso.Close();
   qyMatriculaCurso.ParamByName('CD_MATRICULA_CURSO').AsInteger := iRetorno;
   qyMatriculaCurso.Open();
   Close();
end;

procedure TFrmMatricularCurso.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
   CursoColigada : TCursoColigada;
begin

   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, qyMatriculaCursonr_anosem_ingresso.AsInteger);

   if resultado_filtro.filtrado then
   begin
      CursoColigada := TCursoColigada.Create( resultado_filtro.cd_curso, resultado_filtro.cd_coligada, True );

      qyMatriculaCursocd_curso.AsString := resultado_filtro.cd_curso;
      qyMatriculaCursonr_anosem_ingresso.AsInteger := resultado_filtro.nr_anosemestre;

      if CursoColigada.Grade > -1 then
         qyMatriculaCursocd_grade.AsInteger := CursoColigada.Grade;

      FreeAndNil( CursoColigada );

      qyCursosColigadas.Close();
      qyCursosColigadas.ParamByName('CD_CURSO').AsString := qyMatriculaCursocd_curso.AsString;
      qyCursosColigadas.Open();

      setaGradeCurso( qyMatriculaCursocd_curso.AsString, resultado_filtro.cd_coligada );
  end;

end;

procedure TFrmMatricularCurso.cbCertificadoChange(Sender: TObject);
begin
   if comboBloqueada then
   begin
      cbCertificado.Enabled := False;
   end;
end;

procedure TFrmMatricularCurso.cbCertificadoClick(Sender: TObject);
begin
   if comboBloqueada then
   begin
      cbCertificado.Enabled := False;
   end;
end;

procedure TFrmMatricularCurso.cbCertificadoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if comboBloqueada then
   begin
      cbCertificado.Enabled := False;
   end;
end;

procedure TFrmMatricularCurso.cbCertificadoMouseEnter(Sender: TObject);
begin

   if comboBloqueada then
   begin
      cbCertificado.Enabled := False;
   end;
   
end;

procedure TFrmMatricularCurso.cbCertificadoMouseLeave(Sender: TObject);
begin
   if comboBloqueada then
   begin
      cbCertificado.Enabled := True;
   end;
end;

procedure TFrmMatricularCurso.DBComboBox2Change(Sender: TObject);
begin
   comboIndex :=  DBComboBox2.ItemIndex;
end;

procedure TFrmMatricularCurso.DBComboBox2DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   //Redesenha a combo para destacar as escolas irregulares
   dm.tblInstituicoes.Locate('nm_instituicao',DBComboBox2.Items[Index],[]);
   if (dm.tblInstituicoessn_irregular.AsString = '1') then
   begin
      DBComboBox2.Canvas.Brush.Color := clRed;
   end;
   
   DBComboBox2.Canvas.FillRect(Rect);
   DBComboBox2.Canvas.TextOut(Rect.Left,Rect.Top,DBComboBox2.Items[Index]);

   if( State = [odComboBoxEdit]) then
   begin
      DBComboBox2.ItemIndex := comboIndex;
      DBComboBox2.OnDrawItem := nil;
   end;
end;

procedure TFrmMatricularCurso.dbCursoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      Key := #0;
      SelectNext(Sender as TWinControl, True, True);
   end;
end;

procedure TFrmMatricularCurso.dsMatriculaCursoStateChange(Sender: TObject);
begin
   if ((qyMatriculaCursoSN_GERADO_MANUAL.asInteger = 0) and (qyMatriculaCurso.State = dsbrowse)) then
   begin

      if (qyMatriculaCursoNR_CERT_FOLHA.AsString <> '') then
      begin
         DBEdit1.ReadOnly := True;
      end;

      if (qyMatriculaCursoNR_CERT_REGISTRO.AsString <> '') then
      begin
         DBEdit10.ReadOnly := True;
      end;

      if (qyMatriculaCursoCD_CERT_LIVRO.AsString <> '') then
      begin
         comboBloqueada := True;
      end
      else
      begin
         comboBloqueada := False;
      end;
      
   end;
end;

procedure TFrmMatricularCurso.EditarMatricula(CodMatricula: Integer);
begin
   SelecionarMatricula(CodMatricula);
   qyMatriculaCurso.Edit();
   Self.ShowModal();
end;

procedure TFrmMatricularCurso.FormShow(Sender: TObject);
var
   posCombo, padding : integer;
   exibeConcurso : string;
begin
   Label2.Visible := DM.UsaAnosemestre;
   DBEdit2.Visible := DM.UsaAnosemestre;
   
   DM.tblInstituicoes.Close();
   DM.tblInstituicoes.Open();
   dbCurso.SetFocus();
   DbDataSaida.Enabled := not (qyMatriculaCurso.State = dsInsert);
   lbDataSaida.Enabled := not (qyMatriculaCurso.State = dsInsert);

   lbSituacao.Enabled := not (qyMatriculaCurso.State = dsInsert);
   dbSituacao.Enabled := not (qyMatriculaCurso.State = dsInsert);

   qyCursosColigadas.Close();
   qyCursosColigadas.ParamByName('CD_CURSO').AsString := qyMatriculaCursocd_curso.AsString;
   qyCursosColigadas.Open();

   // Verifica se tem inscrições da pessoa em concursos
   qyIncricoes.Close();
   qyIncricoes.ParamByName('cd_pessoa').AsInteger := iAluno;
   qyIncricoes.Open();

   if (qyIncricoes.FieldByName('qtd_inscricoes').AsInteger > 0) then
   begin

      { Caso aluno possua inscrições
        Apresenta o botão para buscar por concursos }
      btnConcurso.Visible := true;

      // Verifica se o parametro para exibir como padrão a busca de concurso está ativado
      exibeConcurso := DM.variavel_parametro('matricula_curso_exibe_concurso');      

      // Verifica se possui situação de cursando
      qySituacaoMatricula.Close();
      qySituacaoMatricula.ParamByName('cd_pessoa').AsInteger := iAluno;
      qySituacaoMatricula.Open();

      { Se não houverem situações de cursando e
        o parametro está ativado apresenta a busca de concurso }
      if (qySituacaoMatricula.FieldByName('qtd_cursando').AsInteger = 0) and (exibeConcurso = 'S') then
      begin
         btnConcursoClick( Sender );
      end;

   end else begin

      padding := 4;

      { Caso aluno não possua inscrições
        Esconde o botão para buscar por concursos }
      btnConcurso.Visible := false;

      { Ajusta largura dos campos e posicionamento
        para ocupar o espaço antes ocupado pelo botão de busca de curso }
      Label1.Left := Label1.Left - btnConcurso.Width - padding;
      dbCurso.Left := dbCurso.Left - btnConcurso.Width - padding;

      btnCurso.Left := btnCurso.Left - btnConcurso.Width - padding;      

      Label2.Left := Label2.Left - btnConcurso.Width - padding;
      DBEdit2.Left := DBEdit2.Left - btnConcurso.Width - padding;

      DBEdit2.Width := DBEdit2.Width + (btnConcurso.Width + padding);

   end;

   qyCertificadoLivro.Open;

   cbCertificado.clear;
   qyCertificadoLivro.First;

   while not qyCertificadoLivro.Eof do
   begin

      if qyMatriculaCursoCD_CERT_LIVRO.AsString <> '' then
      begin

         if qyMatriculaCursoCD_CERT_LIVRO.AsInteger = qyCertificadoLivrocd_cert_livro.AsInteger then
         begin

            cbCertificado.addItem(
               qyCertificadoLivronm_livro.asString,
               TItemCombo.create(
                  qyCertificadoLivrocd_cert_livro.asString, ''
               )
            );

            cbCertificado.ItemIndex := 0;
         end;

      end
      else
      begin

         cbCertificado.addItem(
            qyCertificadoLivronm_livro.asString,
            TItemCombo.create(
               qyCertificadoLivrocd_cert_livro.asString, ''
            )
         );
         
      end;

      qyCertificadoLivro.Next;
   end;

   if ((qyMatriculaCursonr_matricula.asString <> '') OR (qyMatriculaCurso.State = dsEdit)) then
   begin
      DBEdit3.Hint := '';
   end;
   
end;

Function TFrmMatricularCurso.IncluirMatricula(CodAluno : Integer; AnoSem : Integer) : Integer;
begin
  iAluno := CodAluno;
  iRetorno := -1;
  SelecionarMatricula(-1);
  qyMatriculaCurso.Insert();
  qyMatriculaCurso.FieldByName('cd_pessoa').AsInteger := iAluno;
  qyMatriculaCurso.FieldByName('dt_ingresso').AsString := FormatDateTime('dd/mm/yyyy', DM.DataAtual);
  qyMatriculaCurso.FieldByName('nr_anosem_ingresso').AsInteger := AnoSem;
  qyMatriculaCurso.FieldByName('cd_situacao').AsInteger := 1; // ATIVO;
  Self.ShowModal();
  Result := iRetorno;
end;

function TFrmMatricularCurso.ObterUltimoCodigo(CodAluno: Integer): Integer;
Var
  qAux : TUMZQuery;
begin
  iAluno := CodAluno;
  DM.CriarConsulta(qAux);
  qAux.SQL.Text :=
     ' SELECT cd_matricula_curso FROM matriculas_curso ' +
     ' WHERE cd_pessoa = ' + IntToStr( CodAluno ) +
     ' ORDER BY cd_matricula_curso DESC';
  qAux.Open();
  if qAux.IsEmpty then
     Result := -1
  else
     Result := qAux.FieldByName('cd_matricula_curso').AsInteger;
  qAux.Close;
     
  FreeAndNil(qAux);
end;

procedure TFrmMatricularCurso.qyMatriculaCursoAfterOpen(DataSet: TDataSet);
begin
   dm.tblInstituicoes.Close;
   dm.tblInstituicoes.Open;
   while not dm.tblInstituicoes.Eof do
   begin
      DBComboBox2.Items.Add(DM.tblInstituicoesnm_instituicao.AsString);
      if (dm.tblInstituicoescd_instituicao.AsString = qyMatriculaCursocd_instituicao.AsString) then
      begin
         comboIndex := DBComboBox2.Items.Count -1;
      end;
      dm.tblInstituicoes.Next;
   end;

   qryIngressos.Close;
   qryIngressos.ParamByName('cd_ingresso').AsInteger :=
      qyMatriculaCursocd_ingresso.AsInteger;
   qryIngressos.Open;

   qyCertificadoLivro.Open;

   qyCertificadoLivro.Locate('cd_cert_livro', qyMatriculaCursoCD_CERT_LIVRO.AsInteger, []);

   iAluno := qyMatriculaCursocd_pessoa.AsInteger;
end;

procedure TFrmMatricularCurso.qyMatriculaCursoBeforeOpen(DataSet: TDataSet);
begin
   qySituacoes.Close();
   qySituacoes.Open();
end;

procedure TFrmMatricularCurso.qyMatriculaCursoBeforePost(DataSet: TDataSet);
const
   MENSAGEM_SEMINFOS =
      'Atenção!' + #13 + #13 +
      'Não foi possível localizar a grade currícular, pois as seguintes informações não foram informadas: ' + #13 + #13 + '%s' + #13 + #13 +
      'Se você continuar poderá ter dificuldades para emitir relatórios e gerenciar a matrícula do estudante.' + #13 + #13 +
      'Deseja revisar as informações de grade para esse aluno?';
   MENSAGEM_NENCONTROU =
      'Atenção:' + #13 + #13 +
      'A grade informada não existe no cadastro deste curso.' + #13 +
      'Se você continuar poderá ter dificuldades para emitir relatórios e gerenciar a matrícula do estudante.' + #13 + #13 +
      'Deseja revisar as informações de grade para esse aluno?';
Var
   qValida : TUMZQuery;
   LSMensagem, LSAux: string;
begin

   if qyMatriculaCursodt_ingresso.AsDateTime >  Now then
   begin
      Mensagem('Data de matrícula informada maior que a data de hoje!','Atenção', MB_OK + MB_ICONINFORMATION);
      qyMatriculaCursodt_ingresso.AsString := qyMatriculaCursodt_ingresso.CurValue;
      DBEdit4.SetFocus;
      Abort;
   end;

   if ((qyMatriculaCursonr_matricula.AsString = '') AND (qyMatriculaCurso.State = dsInsert)) then
   begin
      if (qyMatriculaCursocd_ingresso.AsInteger <> 3) then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
      else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iAluno,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSemAtual );
   end;

   // Validar as informações de grade

   Dm.CriarConsulta(qValida);
   qValida.SQL.Text :=
     ' SELECT CD_GRADE ' +
     ' FROM GRADES G ' +
     ' WHERE G.CD_CURSO = :CD_CURSO ' +
     '       AND G.CD_GRADE = :CD_GRADE ';

   qValida.ParamByName('CD_CURSO').AsString := qyMatriculaCursocd_curso.AsString;
   qValida.ParamByName('CD_GRADE').AsString := qyMatriculaCursocd_grade.AsString;

   qValida.Open;
   if qValida.IsEmpty then
   begin
      LSAux := '';
      if qyMatriculaCursocd_curso.AsString = '' then
      begin
         LSAux := '- Curso';         
      end;
      if qyMatriculaCursocd_grade.AsString = '' then
      begin
         if LSAux <> '' then
            LSAux := LSAux + #13;
         LSAux := LSAux + '- Código da Grade';
      end;
      if qyMatriculaCursocd_turno.AsString = '' then
      begin
         if LSAux <> '' then
            LSAux := LSAux + #13;
         LSAux := LSAux + '- Turno';
      end;
      if LSAux <> '' then
      begin
         LSMensagem := Format(MENSAGEM_SEMINFOS, [LSAux]);
      end
      else
      begin
         LSMensagem := MENSAGEM_NENCONTROU;
      end;
      if Mensagem(LSMensagem, 'UNIMESTRE', MB_YESNO + MB_DEFBUTTON1 + MB_ICONWARNING) = mrYes then
      begin
         FreeAndNil(qValida);
         Abort;
         Exit;
      end
      else
      begin
         FreeAndNil(qValida);
         Exit;
      end;
   end;
   FreeAndNil(qValida);
end;

procedure TFrmMatricularCurso.qyMatriculaCursoNewRecord(DataSet: TDataSet);
begin
   qyMatriculaCursocd_grade.AsInteger := 1;
   qyMatriculaCursocd_ingresso.AsInteger := iIngressoPadrao;
end;

function TFrmMatricularCurso.retornaCodigoInstituicaoSelecionado(ds_instituicao : String ): String;
const
   Sql_Busca =
   'SELECT cd_instituicao FROM instituicoes_ensino WHERE nm_instituicao = :ds_instituicao LIMIT 1';
var
   qryAux : TUMZQuery;
begin
   DM.CriarConsulta(qryAux);
   qryAux.SQL.Text := Sql_Busca;
   qryAux.ParamByName('ds_instituicao').AsString := ds_instituicao;
   qryAux.Open;

   result := qryAux.FieldByName('cd_instituicao').AsString;
end;

procedure TFrmMatricularCurso.SelecionarMatricula(CodMatricula: Integer);
begin
  // Selecionar a matrícula existente
  qyMatriculaCurso.Close();
  qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := CodMatricula;
  qyMatriculaCurso.Open();
  if CodMatricula <> -1 then begin
     iAluno := qyMatriculaCurso.FieldByName('cd_pessoa').AsInteger;
  end;
end;

procedure TFrmMatricularCurso.setaGradeCurso(cd_curso: String; cd_coligada: Integer);
const
   SQL_GRADE = ' SELECT G.CD_GRADE                                           ' +
               ' FROM CURSOS_COLIGADAS CC                                    ' +
               '      INNER JOIN GRADES G ON (                               ' +
               '         G.CD_CURSO = CC.CD_CURSO AND                        ' +
               '         G.CD_GRADE = CC.CD_GRADE )                          ' +
               ' WHERE CC.CD_CURSO = :CD_CURSO AND                           ' +
               '       CC.CD_COLIGADA = :CD_COLIGADA                         '; 
var
   qyGrade : TUMZQuery;
begin
   if ( trim(cd_curso) = '' ) then
      Exit;
   
   DM.CriarConsulta( qyGrade );

   with qyGrade do
   begin
      SQL.Add( SQL_GRADE );
      ParamByName('CD_CURSO').AsString := cd_curso;
      ParamByName('CD_COLIGADA').AsInteger := cd_coligada;

      Open();

      if (RecordCount = 1) then
         qyMatriculaCursocd_grade.AsInteger := FieldByName('CD_GRADE').AsInteger;
   end;
end;

procedure TFrmMatricularCurso.btnGeraNroMatriculaClick(Sender: TObject);
begin

   if (DBEdit3.Text = '') then
   begin

      if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
      begin
         qyMatriculaCursonr_matricula.AsString :=
            DM.NovoCodMatricula(
               iAluno,
               qyMatriculaCursocd_curso.AsString,
               qyMatriculaCursonr_anosem_ingresso.AsInteger,
               qyMatriculaCursonr_anosem_ingresso.AsInteger
            );
      end
      else
      begin
         qyMatriculaCursonr_matricula.AsString :=
            DM.NovoCodMatricula(
               iAluno,
               qyMatriculaCursocd_curso.AsString,
               qyMatriculaCursonr_anosem_ingresso.AsInteger,
               iAnoSemAtual
            );
      end;

   end;
   
end;

end.

