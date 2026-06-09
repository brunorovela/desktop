unit uGradesExtrasCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, DB, ZConnection, StdCtrls, Buttons, DBCtrls, Mask,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM, uUMNucleo,
  Dialogs, General;

type
  TFrmGradesExtraCad = class(TForm)
    Panel3: TPanel;
    Bevel4: TBevel;
    qyExtraAluno: TUMZQuery;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    dsExtraAluno: TDataSource;
    qyAtividades: TUMZQuery;
    dsAtividades: TDataSource;
    qyAtividadesds_ge_atividade: TStringField;
    qyAtividadesnr_horas: TFloatField;
    qyExtraAlunocd_curso: TStringField;
    qyExtraAlunonr_horas: TFloatField;
    qyExtraAlunods_local: TStringField;
    qyExtraAlunodt_inicio: TDateTimeField;
    qyExtraAlunodt_termino: TDateTimeField;
    qyExtraAlunodescAtividade: TStringField;
    qyPessoas: TUMZQuery;
    dsPessoas: TDataSource;
    qyExtraAlunoDesPessoa: TStringField;
    qyPessoascd_pessoa: TIntegerField;
    qyPessoasnm_pessoa: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    btnCurso: TSpeedButton;
    btnCodigoAluno: TSpeedButton;
    qyExtraAlunods_atividade: TStringField;
    qyAtividadescd_ge_atividade: TLargeintField;
    qyAtividadescd_ge_grupo: TLargeintField;
    qyExtraAlunocd_ge_aluno: TLargeintField;
    qyExtraAlunocd_pessoa: TLargeintField;
    qyExtraAlunonr_anosem: TIntegerField;
    qyExtraAlunocd_ge_atividade: TLargeintField;
    qyExtraAlunonr_etapa: TIntegerField;
    qyExtraAlunocd_situacao: TSmallintField;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    qyExtraAlunods_resumo: TMemoField;
    lblAnexar: TLabel;
    edAnexar: TEdit;
    sbAnexo: TSpeedButton;
    opnBuscaArquivo: TOpenDialog;
    qryArquivo: TUMZQuery;
    qryArquivocd_ge_aluno_anexo: TIntegerField;
    qryArquivocd_ge_aluno: TIntegerField;
    qryArquivomb_anexo: TMemoField;
    qryArquivonm_original: TStringField;
    qryArquivods_tamanho: TStringField;
    sbDownloadAnexo: TSpeedButton;
    svrArquivo: TSaveDialog;
    sbRemoverAnexo: TSpeedButton;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    qyExtraAlunonr_horas_original: TFloatField;
    lbMensagemHoras: TLabel;
    procedure copiarHorasDeferidas(Sender: TObject);
    procedure VerificarHorasDeferidas(Sender: TObject);
    procedure sbRemoverAnexoClick(Sender: TObject);
    procedure sbDownloadAnexoClick(Sender: TObject);
    procedure sbAnexoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCursoClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure qyExtraAlunoBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    sPath: String;
    bAnexar: Boolean;
    function getHorasDeferidaAluno(): TUMZQuery;
    procedure RemoverAnexo;
    function selecionarAnexo: TUMZQuery;
    procedure SalvarAnexo;
    function verificaHorasPorGrade() : Double;
  public
    { Public declarations }
  end;

var
  FrmGradesExtraCad: TFrmGradesExtraCad;

implementation

uses uFSelecionarPessoa, uFSelecionarCurso, IdCoderMIME;

{$R *.dfm}

procedure TFrmGradesExtraCad.btnCancelarClick(Sender: TObject);
begin
    qyExtraAluno.Cancel();
    Close();
end;

procedure TFrmGradesExtraCad.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
     qyExtraAlunocd_pessoa.AsInteger := resultado_filtro.cd_pessoa;
   end
   else Exit;
end;

procedure TFrmGradesExtraCad.btnConfirmarClick(Sender: TObject);
var
   iCdGradeExtraAluno : Integer;
begin
   qyExtraAlunocd_situacao.AsInteger := 1;
   qyExtraAluno.Post();

   // Verifica se foi anexado um novo arquivo
   if bAnexar then
   begin
      SalvarAnexo();
   end;

   // Remover o anexo
   if Length(edAnexar.Text) = 0 then
   begin
      RemoverAnexo();
   end;

   Close();
end;

procedure TFrmGradesExtraCad.SalvarAnexo();
var
   bfArquivo              : TBlobField;
   iCodigoGradeExtraAluno : Integer;
   Encoder                : TIdEncoderMime;
begin

   // Verifica se está inserindo um novo registro ou alterando um registro existente
   if qyExtraAlunocd_ge_aluno.AsInteger > 0 then
   begin
      // Edição de um registro
      iCodigoGradeExtraAluno := qyExtraAlunocd_ge_aluno.AsInteger;
   end else begin
      // Inserção de um registro 
      iCodigoGradeExtraAluno := DM.LastInsert;
   end;

   // Verifica se já existe um anexo para essa grade extra
   qryArquivo.Close;
   qryArquivo.ParamByName('cd_ge_aluno').AsInteger := iCodigoGradeExtraAluno;
   qryArquivo.Open;

   if qryArquivo.IsEmpty then
   begin
      // Se não existir anexo prepara para inserir o primeiro
      qryArquivo.Insert;
      qryArquivocd_ge_aluno.AsInteger := iCodigoGradeExtraAluno;
   end
   else
   begin
      // Se já houver anexo apenas altera o já existente
      qryArquivo.Edit;
   end;

   // Carrega o arquivo anexo e as informações necesssária para a base de dados
   bfArquivo := TBlobField(qryArquivo.FieldByName('mb_anexo'));
   bfArquivo.LoadFromFile(sPath);

   qryArquivods_tamanho.AsString := IntToStr(bfArquivo.BlobSize);
   qryArquivonm_original.AsString := edAnexar.Text;

   // Codifica o conteúdo do arquivo em BASE64
   Encoder := TIdEncoderMime.Create(nil);
   qryArquivomb_anexo.AsString := Encoder.Encode(bfArquivo.AsString);

   // Salva as informações
   qryArquivo.Post;

end;

procedure TFrmGradesExtraCad.RemoverAnexo();
var
   qryBaixarArquivo: TUMZQuery;
begin

   dm.CriarConsulta(qryBaixarArquivo);

   if qyExtraAlunocd_ge_aluno.AsInteger > 0 then
   begin
      qryBaixarArquivo.SQL.Text := 'DELETE FROM ge_alunos_anexo WHERE cd_ge_aluno = ' + qyExtraAlunocd_ge_aluno.AsString;
      qryBaixarArquivo.ExecSQL;
   end;
end;

procedure TFrmGradesExtraCad.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      qyExtraAlunocd_curso.AsString := resultado_filtro.cd_curso;
      qyExtraAlunonr_anosem.AsInteger := resultado_filtro.nr_anosemestre;
   end;
end;

procedure TFrmGradesExtraCad.copiarHorasDeferidas(Sender: TObject);
begin
   // Copia as horas originais para as horas deferidas (por default), mas somente se não tiver as horas deferidas 
   if (not qyExtraAlunonr_horas_original.IsNull) and (qyExtraAlunonr_horas.IsNull) then
   begin
      qyExtraAlunonr_horas.AsFloat := qyExtraAlunonr_horas_original.AsFloat;

      VerificarHorasDeferidas(Sender);
   end;
end;

procedure TFrmGradesExtraCad.VerificarHorasDeferidas(Sender: TObject);
var
   nrHorasPorAtividade, nrHorasPorCurso, nrHorasNaAtividade, nrHorasPorGrade, nrHoras : Double;
   nrHorasRequisitadasOriginais, nrHorasRequisitadas : Double;
   nrHorasDeferidasAtividade, nrHorasDeferidasCurso : Double;
   qyHorasAtividadeDeferidas : TUMZQuery;
   aviso : Boolean;
   mensagemHoras : String;
begin
   lbMensagemHoras.Width := 450;
   lbMensagemHoras.Height := 26;
   lbMensagemHoras.Caption := 'ATENÇÃO: As horas (deferidas) ultrapassaram a quantidade de horas máxima permitida. Foi ajustado para para que sejam deferidas apenas as horas restantes.';
   lbMensagemHoras.Visible := False;
   aviso := False;
   btnConfirmar.Enabled := True;

   
   // Total de horas digitada pelo usuário
   if (not qyExtraAlunonr_horas.IsNull) and (qyExtraAlunonr_horas.AsFloat > 0) then
   begin
      nrHorasRequisitadasOriginais := qyExtraAlunonr_horas.AsFloat;
      nrHorasRequisitadas := qyExtraAlunonr_horas.AsFloat;
   end else begin
      lbMensagemHoras.Caption := 'ATENÇÃO: Deve-se informar a quantidade de horas (deferidas).';
      lbMensagemHoras.Visible := True;
      btnConfirmar.Enabled := False;
      Exit;
   end;

   // Retorna os número de horas que devem ser checados
   // 1 - Número de horas por atividade, 2 - Número de horas por curso, 3 - Número de horas da atividade   
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Text := 'SELECT ' +
                        '  nr_horas_atividade, '+
                        '  nr_horas_curso, '+
                        '  nr_horas '+
                        'FROM '+
                        '  ge_atividades '+
                        'WHERE '+
                        '  cd_ge_atividade = :cd_ge_atividade '+
                        'ORDER BY '+
                        '  ds_ge_atividade';

   DM.qyAux.ParamByName('cd_ge_atividade').AsInteger := qyExtraAlunocd_ge_atividade.AsInteger;

   DM.qyAux.Open;

   if not DM.qyAux.Eof then
   begin
      nrHorasPorAtividade := DM.qyAux.FieldByName('nr_horas_atividade').AsFloat;
      nrHorasPorCurso := DM.qyAux.FieldByName('nr_horas_curso').AsFloat;
      nrHorasNaAtividade := DM.qyAux.FieldByName('nr_horas').AsFloat;
   end else begin
      nrHorasPorAtividade := -1;
      nrHorasPorCurso := -1;
      nrHorasNaAtividade := -1;
   end;

   // Retorna o total de horas restantes (desconsiderando a atividade que se está editando)
   qyHorasAtividadeDeferidas := getHorasDeferidaAluno();
   nrHorasDeferidasAtividade := qyHorasAtividadeDeferidas.FieldByName('nr_horas_acumuladas_aluno').AsFloat;
   nrHorasDeferidasCurso := qyHorasAtividadeDeferidas.FieldByName('nr_horas_aluno_curso').AsFloat;
   qyHorasAtividadeDeferidas.Close;   

   {1ª VALIDAÇÃO - Número de Horas por Atividade
      O Número de Horas por Atividade é o valor máximo permitido ser digitado na atividade selecionada,
      independente do valor total de horas acumuladas do aluno na atividade ou no curso, é o valor de horas
      do cadastro que está sendo realizado em questão.

      VERIFICAÇÃO: Se o número de horas digitado pelo usuário ultrapassa o valor de número de horas por atividade.}

   if ( nrHorasPorAtividade > 0 ) then
   begin
      //Se ultrapassou o limite de horas por atividade modifica as horas para as horas máximas.
      if ( nrHorasRequisitadas > nrHorasPorAtividade) then
      begin
         lbMensagemHoras.Caption := 'ATENÇÃO: As horas requisitadas ('+FloatToStr(nrHorasRequisitadasOriginais)+') ultrapassaram a quantidade de horas que é possível digitar para essa atividade ('+FloatToStr(nrHorasPorAtividade)+'). Foi ajustado para que sejam deferidas apenas as horas restantes.';
         aviso := True;

         nrHorasRequisitadas := nrHorasPorAtividade;
      end;
   end;

   {2ª VALIDAÇÃO - Número de Horas por Curso
      O Número de Horas por Curso é o valor máximo permitido de horas deferidas o aluno nesse tipo de atividade
      independente do anosemestre mas levando em consideração o curso selecionado.

      VERIFICAÇÃO: Se o número de horas acumuladas do aluno nessa atividade, ultrapassa o valor de número de horas por curso.
      Caso o exista algum registro na tabela ge_cursos de horas para a grade do aluno  e esta deva ser validado iremos usar este}

   nrHorasPorGrade := self.verificaHorasPorGrade();

   if(nrHorasPorGrade = -1) then
   begin
      mensagemHoras := 'ATENÇÃO: As horas requisitadas ('+FloatToStr(nrHorasRequisitadasOriginais)+') ultrapassaram a quantidade de horas limite do curso para essa atividade ('+FloatToStr(nrHorasPorCurso)+'). Foi ajustado para que sejam deferidas apenas as horas restantes.';
      nrHoras := nrHorasPorCurso;
   end else begin
      mensagemHoras := 'ATENÇÃO: As horas requisitadas ('+FloatToStr(nrHorasRequisitadasOriginais)+') ultrapassaram a quantidade de horas limite da grade para essa atividade ('+FloatToStr(nrHorasPorGrade)+'). Foi ajustado para que sejam deferidas apenas as horas restantes.';
      nrHoras := nrHorasPorGrade;
   end;

   // Verifica se existe limitação de quantidade de horas por curso
   if ( nrHoras > 0 ) then
   begin

      if (nrHorasDeferidasCurso + nrHorasRequisitadas) > nrHoras then
      begin
         lbMensagemHoras.Caption := mensagemHoras;
         aviso := True;

         nrHorasRequisitadas := nrHoras - nrHorasDeferidasCurso;
      end;

   end;

   {3ª VALIDAÇÃO - Número de Horas da Atividade
      O Número de Horas da Atividade é o valor máximo permitido de horas deferidas o aluno nesse tipo de atividade
      independente do anosemestre ou curso, apenas levando em consideração o total de horas acumuladas pelo aluno nessa atividade.

      VERIFICAÇÃO: Se o número de horas acumuladas do aluno nessa atividade, ultrapassa o valor de número de horas da atividade.}

   // Verifica se existe limitação de quantidade de horas na atividade
   if ( nrHorasNaAtividade > 0 ) then
   begin

      if (nrHorasDeferidasAtividade + nrHorasRequisitadas) > nrHorasNaAtividade then
      begin
         lbMensagemHoras.Caption := 'ATENÇÃO: As horas requisitadas ('+FloatToStr(nrHorasRequisitadasOriginais)+') ultrapassaram a quantidade de horas limite na atividade ('+FloatToStr(nrHorasNaAtividade)+'). Foi ajustado para que sejam deferidas apenas as horas restantes.';
         aviso := True;

         nrHorasRequisitadas := nrHorasNaAtividade - nrHorasDeferidasAtividade;
      end;
   end;

   // Tratamento para não apresentar valores negativas
   if nrHorasRequisitadas <= 0 then
   begin
      // Não é possível deferir essa atividade
      lbMensagemHoras.Caption := 'Não é possível deferir essa atividade. A quantidade máxima de horas do curso/atividade já foi alcançada.';
      lbMensagemHoras.Visible := True;
      btnConfirmar.Enabled := False;
   end else if aviso then
   begin
      // Apresenta mensagem de ajuste de horas deferidas
      lbMensagemHoras.Visible := True;
      qyExtraAlunonr_horas.AsFloat := nrHorasRequisitadas;
   end;

end;

function TFrmGradesExtraCad.getHorasDeferidaAluno() : TUMZQuery;
begin
   // Pega as horas deferidas da atividade do aluno
   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Text := 'SELECT ' +
                        '  COALESCE(SUM(CASE WHEN al.cd_ge_aluno <> :cd_ge_aluno THEN al.nr_horas ELSE 0 END), "0") AS nr_horas_acumuladas_aluno, '+
                        '  COALESCE(SUM(CASE WHEN al.cd_ge_aluno <> :cd_ge_aluno AND al.cd_curso = :cd_curso THEN al.nr_horas ELSE 0 END), "0") AS nr_horas_aluno_curso '+
                        'FROM '+
                        '  ge_atividades ga '+
                        '  LEFT JOIN ge_alunos al ON ( '+
                        '     al.cd_ge_atividade = ga.cd_ge_atividade AND '+
                        '     al.cd_situacao = 1 AND '+
                        '     al.cd_pessoa = :cd_pessoa '+
                        '  ) '+
                        'WHERE '+
                        '  ga.cd_ge_atividade = :cd_atividade '+
                        'GROUP BY '+
                        '  ga.cd_ge_atividade';

   DM.qyAux.ParamByName('cd_atividade').AsInteger := qyExtraAlunocd_ge_atividade.AsInteger;
   DM.qyAux.ParamByName('cd_pessoa').AsInteger := qyExtraAlunocd_pessoa.AsInteger;
   DM.qyAux.ParamByName('cd_ge_aluno').AsInteger := qyExtraAlunocd_ge_aluno.AsInteger;
   DM.qyAux.ParamByName('cd_curso').AsString := qyExtraAlunocd_curso.AsString;

   DM.qyAux.Open;

   Result := DM.qyAux;
end;

procedure TFrmGradesExtraCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmGradesExtraCad.FormShow(Sender: TObject);
var
   qryBaixarArquivo : TUMZQuery;
begin
   DBEdit1.SetFocus();
   DBEdit3.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   Label4.Visible := DBEdit3.Visible;

   // Seleciona o anexo pertencente a grade extra do aluno
   qryBaixarArquivo := selecionarAnexo();

   // Verifica se existe anexo para exibir os botões de Download e Remover o anexo
   if qryBaixarArquivo.IsEmpty then
   begin
      sbRemoverAnexo.Visible := False;
      sbDownloadAnexo.Visible := False;

      edAnexar.Text := '';
   end else begin
      sbRemoverAnexo.Visible := True;
      sbDownloadAnexo.Visible := True;

      edAnexar.Text := qryBaixarArquivo.FieldByName('nm_original').AsString;
   end;

end;

procedure TFrmGradesExtraCad.qyExtraAlunoBeforeOpen(DataSet: TDataSet);
begin
   qyAtividades.Close();
   qyAtividades.Open();

   qyPessoas.Close();
   qyPessoas.Open();
end;

procedure TFrmGradesExtraCad.sbAnexoClick(Sender: TObject);
var
   listaPath : TStringList;
begin
   if opnBuscaArquivo.Execute then
   begin
      if opnBuscaArquivo.FileName <> '' then
      begin
         sPath := opnBuscaArquivo.FileName;

         listaPath := TStringList.Create;
         listaPath.Delimiter := '\';
         listaPath.DelimitedText := sPath;

         edAnexar.Text := listaPath.Strings[listaPath.Count -1];

         bAnexar := true;
         sbRemoverAnexo.Visible := True;
      end;
   end;
end;

procedure TFrmGradesExtraCad.sbDownloadAnexoClick(Sender: TObject);
var
   qryBaixarArquivo : TUMZQuery;
   Decoder          : TIdDecoderMime;
   mbAnexo          : String;
begin
   qryBaixarArquivo := selecionarAnexo();

   if (not qryBaixarArquivo.IsEmpty) then
   begin
      // Sugere o nome original do arquivo para salvar
      svrArquivo.FileName :=  qryBaixarArquivo.FieldByName('nm_original').AsString;

      if svrArquivo.Execute() then
      begin
         // Decodifica a string em BASE64 e incluí a mesma na janela de download (save)
         Decoder := TIdDecoderMime.Create(nil);
         mbAnexo := Decoder.DecodeString(qryBaixarArquivo.FieldByName('mb_anexo').AsString);
         qryBaixarArquivo.FieldByName('mb_anexo').AsString := mbAnexo;

         (qryBaixarArquivo.FieldByName('mb_anexo') as TBlobField).SaveToFile(svrArquivo.FileName);
      end;
   end;

end;

procedure TFrmGradesExtraCad.sbRemoverAnexoClick(Sender: TObject);
var
   retorno : Integer;
begin
   retorno := Mensagem('Você está removendo o arquivo anexado à esta atividade, deseja continuar?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle);

   if retorno = mrYes then
   begin
      edAnexar.Text := '';
      sbRemoverAnexo.Visible := False;
      sbDownloadAnexo.Visible := False;   
   end;
end;

function TFrmGradesExtraCad.selecionarAnexo: TUMZQuery;
var
   qryBaixarArquivo : TUMZQuery;
begin
   dm.CriarConsulta(qryBaixarArquivo);

   if qyExtraAlunocd_ge_aluno.AsInteger > 0 then
   begin
      qryBaixarArquivo.SQL.Text := ' SELECT                                     '+
                                   '   cd_ge_aluno_anexo, mb_anexo, nm_original '+
                                   ' FROM                                       '+
                                   '   ge_alunos_anexo                          '+
                                   ' WHERE                                      '+
                                   '   cd_ge_aluno = ' + qyExtraAlunocd_ge_aluno.AsString;
      qryBaixarArquivo.Open;
   end;

   Result := qryBaixarArquivo;
end;

function TFrmGradesExtraCad.verificaHorasPorGrade: Double;
const
   sql_busca_horas_grade =
   'SELECT '+
   '   max(gc.nr_horas) as maxHoras '+
   '   FROM matriculas_curso mc   '+
   '   INNER JOIN ge_cursos gc ON ( '+
   '      mc.cd_curso = gc.cd_curso AND '+
   '      mc.cd_grade = gc.cd_grade '+
   '   ) WHERE                        '+
   '   gc.sn_validar_horas_grade = 1 AND '+
   '   mc.cd_curso = :curso AND           '+
   '   mc.cd_pessoa = :pessoa AND         '+
   '   gc.cd_ge_atividade = :cd_atividade AND '+
   '   gc.nr_anosem = :anosemestre ';
var
   qyBuscaHorasGrade : TUMZQuery;
begin
   dm.CriarConsulta(qyBuscaHorasGrade);
   qyBuscaHorasGrade.SQL.Text := sql_busca_horas_grade;

   With qyBuscaHorasGrade do
   begin
      ParamByName('curso').AsString := qyExtraAlunocd_curso.AsString;
      ParamByName('pessoa').AsString := qyExtraAlunocd_pessoa.AsString;
      ParamByName('cd_atividade').AsString := qyExtraAlunocd_ge_atividade.AsString;
      ParamByName('anosemestre').AsString := qyExtraAlunonr_anosem.AsString;

      Open;

      if(FieldByName('maxHoras').IsNull) then
      begin
         result := -1;
      end else begin
         result := FieldByName('maxHoras').AsInteger;
      end;
   end;

   FreeAndNil(qyBuscaHorasGrade);
end;

end.

