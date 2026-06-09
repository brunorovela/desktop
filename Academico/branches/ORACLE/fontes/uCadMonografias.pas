unit uCadMonografias;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, DBCtrls, uMonografias, ComCtrls, Main,
   General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls,
   uItemCombo, DB, CommCtrl, UFTextEdit, ZSysUtils;

type
   EValidaCadMonografia = class(Exception);

   TformCadMonografias = class(TForm)
      btnCancel: TBitBtn;
      btnOk: TBitBtn;
      cbUnidadeCertificadora: TComboBox;
      DBCheckBox1: TDBCheckBox;
      dbeDataAprovacao: TDBEdit;
      dbeDataCertificado: TDBEdit;
      dbeDataEntrega: TDBEdit;
      dbeDataEnvioProfessor: TDBEdit;
      dbeDataImpressaoMonografia: TDBEdit;
      dbeDataInicio: TDBEdit;
      dbeDataPgtoOrientador: TDBEdit;
      dbeDataRecebimentoArtigo: TDBEdit;
      dbeDataRecebimentoATA: TDBEdit;
      dbeDataRecebimentoCertificado: TDBEdit;
      dbeDataRetornoProfessor: TDBEdit;
      dbeDataSolicitacaoCertificado: TDBEdit;
      dbeNotaConceito: TDBEdit;
      dbeTurma: TDBEdit;
      dbeValor: TDBEdit;
      dblFormaEnvio: TDBLookupComboBox;
      DBLookupComboBox1: TDBLookupComboBox;
      dblSituacao: TDBLookupComboBox;
      dblSituacaoResultado: TDBLookupComboBox;
      dbmObservacoes: TDBMemo;
      edlbFormatoCD: TLabeledEdit;
      edlbTaxa: TLabeledEdit;
      edtCurso: TEdit;
      edtOrientador: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label5: TLabel;
      lbAluno: TLabel;
      lbCurso: TLabel;
      lbIdeiaInicial: TLabel;
      lblDataAprovacao: TLabel;
      lblDataCertificado: TLabel;
      lblDataEntrega: TLabel;
      lblDataEnvioProfessor: TLabel;
      lblDataImpressaoMonografia: TLabel;
      lblDataInicio: TLabel;
      lblDataPgtoOrientador: TLabel;
      lblDataRecebimentoArtigo: TLabel;
      lblDataRecebimentoATA: TLabel;
      lblDataRecebimentoCertificado: TLabel;
      lblDataRetornoProfessor: TLabel;
      lblDataSolicitacaoCertificado: TLabel;
      lbNotaConceito: TLabel;
      lbObservacoes: TLabel;
      lbOrientador: TLabel;
      lbOrientadorAceitou: TLabel;
      lbSituacaoResultado: TLabel;
      lbTema: TLabel;
      lbTurma: TLabel;
      lbValorPago: TLabel;
      pnlComponentes: TPanel;
      qyUnidadeCertificadora: TUMZQuery;
      qyUnidadeCertificadoracd_bairro: TIntegerField;
      qyUnidadeCertificadoracd_instituicao: TIntegerField;
      qyUnidadeCertificadoracd_municipio_correio: TIntegerField;
      qyUnidadeCertificadorads_bairro: TStringField;
      qyUnidadeCertificadorads_cep: TStringField;
      qyUnidadeCertificadorads_cidade: TStringField;
      qyUnidadeCertificadorads_complemento: TStringField;
      qyUnidadeCertificadorads_credenciamento: TStringField;
      qyUnidadeCertificadorads_diretor: TStringField;
      qyUnidadeCertificadorads_email: TStringField;
      qyUnidadeCertificadorads_endereco: TStringField;
      qyUnidadeCertificadorads_estado: TStringField;
      qyUnidadeCertificadoraDS_OBSERVACAO: TMemoField;
      qyUnidadeCertificadorads_site: TStringField;
      qyUnidadeCertificadorads_telefone1: TStringField;
      qyUnidadeCertificadorads_telefone2: TStringField;
      qyUnidadeCertificadorads_tipo: TStringField;
      qyUnidadeCertificadoraim_logo: TBlobField;
      qyUnidadeCertificadoranm_fantasia: TStringField;
      qyUnidadeCertificadoranm_instituicao: TStringField;
      qyUnidadeCertificadorasn_convenio: TSmallintField;
      qyUnidadeCertificadorasn_cursos_profissionalizantes: TStringField;
      qyUnidadeCertificadorasn_educacao_infantil: TStringField;
      qyUnidadeCertificadorasn_ensino_especial: TStringField;
      qyUnidadeCertificadorasn_ensino_fundamental: TStringField;
      qyUnidadeCertificadorasn_ensino_medio: TStringField;
      qyUnidadeCertificadorasn_ensino_superior: TStringField;
      qyUnidadeCertificadorasn_unidade_certificadora: TSmallintField;
      sbCurso: TSpeedButton;
      sbDataAprovacao: TSpeedButton;
      sbDataCertificado: TSpeedButton;
      sbDataEntrega: TSpeedButton;
      sbDataEnvioProfessor: TSpeedButton;
      sbDataImpressaoMonografia: TSpeedButton;
      sbDataInicio: TSpeedButton;
      sbDataPgtoOrientador: TSpeedButton;
      sbDataRecebimentoArtigo: TSpeedButton;
      sbDataRecebimentoATA: TSpeedButton;
      sbDataRecebimentoCertificado: TSpeedButton;
      sbDataRetornoProfessor: TSpeedButton;
      sbDataSolicitacaoCertificado: TSpeedButton;
      sbtOrientador: TSpeedButton;
      sbTurma: TSpeedButton;
      tlbFormaEnvio: TLabel;
      txtAnoSemestre: TMaskEdit;
    pnlIdeiaInicial: TPanel;
    pnlTema: TPanel;
    lbx_alunos_monografia: TListBox;
    btnAddAluno: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnAddAlunoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
      procedure btnCancelClick(Sender: TObject);
      procedure btnOkClick(Sender: TObject);
      procedure dbeTurmaChange(Sender: TObject);
      procedure edlbFormatoCDChange(Sender: TObject);
      procedure edlbTaxaChange(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure sbAlunoClick(Sender: TObject);
      procedure sbCursoClick(Sender: TObject);
      procedure sbDataAprovacaoClick(Sender: TObject);
      procedure sbDataCertificadoClick(Sender: TObject);
      procedure sbDataEntregaClick(Sender: TObject);
      procedure sbDataEnvioProfessorClick(Sender: TObject);
      procedure sbDataImpressaoMonografiaClick(Sender: TObject);
      procedure sbDataInicioClick(Sender: TObject);
      procedure sbDataPgtoOrientadorClick(Sender: TObject);
      procedure sbDataRecebimentoArtigoClick(Sender: TObject);
      procedure sbDataRecebimentoATAClick(Sender: TObject);
      procedure sbDataRecebimentoCertificadoClick(Sender: TObject);
      procedure sbDataRetornoProfessorClick(Sender: TObject);
      procedure sbDataSolicitacaoCertificadoClick(Sender: TObject);
      procedure sbtOrientadorClick(Sender: TObject);
      procedure sbTurmaClick(Sender: TObject);
  private
      FCurrentField: TField;
      FFrameIdeia: TfrmTexEdit;
      FFrameTema: TfrmTexEdit;
      function getTamanhoTexto(const texto: String): Integer;
  public
      arr_pessoas_excluir : array of String;
      size_arr, indice: integer;
      procedure ChangeDate(const Date: TDate);
      procedure inserir_monografias();
      procedure alterar_monografias();
      procedure FormataCampos();
      procedure carrega_lista_alunos();
      function get_cd_monografia(cd_pessoa : integer ) : String;
      procedure zerar_array();
      function gerar_random() : String;
  end;

var
  formCadMonografias: TformCadMonografias;

implementation

uses
   uFSelecionarTurma, uFSelecionarCurso, uFSelecionarPessoa, uDM, ZConnection,
   uUsuario, UFMonthCalendar;
   
{$R *.dfm}

procedure TformCadMonografias.BitBtn1Click(Sender: TObject);
var
   nr_selecionado, i: Integer;
   item_lista,pessoa_excluir : String;
begin
   nr_selecionado := lbx_alunos_monografia.ItemIndex;

   // verifica se algum aluno foi selecionado para remoção
   if ( nr_selecionado < 0 ) then
   begin
      Mensagem(
         'Não há alunos selecionados para remoção!',
         'Atenção!',
         MB_ICONWARNING + MB_OK
      );
      Exit;
   end;

   // verifica se deve retirar a pessoa da lsta de pessoas da monografia
   if ( formMonografias.qyMonografias.State in [dsEdit] ) then
   begin
      // Pega a pessoa que será removida 
      pessoa_excluir :=  TItemCombo(lbx_alunos_monografia.Items.Objects[nr_selecionado]).getCodigo();

      // Atualiza o tamanho do array
      Setlength(
         arr_pessoas_excluir,
         size_arr
      );

      for i := 0 to lbx_alunos_monografia.Count - 1 do
      begin
         // Percorre a lista
         item_lista := TItemCombo(lbx_alunos_monografia.Items.Objects[i]).getCodigo();

         if pessoa_excluir = item_lista then
         begin
             // Adiciona na lista de pessoa que serão removidas dessa monografia
             arr_pessoas_excluir[indice] := get_cd_monografia(StrToInt(item_lista));
             inc(indice);
         end;
      end;
   end;

   // Retira a pessoa do componente
   lbx_alunos_monografia.Items.Delete(
        nr_selecionado
   );
end;

procedure TformCadMonografias.btnAddAlunoClick(Sender: TObject);
var
   qyCursos : TUMZQuery;
   resultado_filtro : TResultadoFiltroPessoa;
   i : integer;
   item_lista : String;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar(
      [],
      afpEstudante,
      formMonografias.qyMonografiasnr_anosemestre.AsInteger
   );

  item_lista := '';
  if not resultado_filtro.filtrado then Exit;
  
  // valida para não permitir inserir a mesma pessoa na lista
  for i := 0 to lbx_alunos_monografia.Count - 1 do
  begin
     item_lista := TItemCombo(lbx_alunos_monografia.Items.Objects[i]).getCodigo();

     if (resultado_filtro.cd_pessoa = StrToInt(item_lista) ) then
     begin
      Mensagem(
         'A pessoa selecionada já esta vinculada a esta monografia!',
         'Atenção!',
         MB_ICONWARNING + MB_OK
      );
      Abort;
      Exit;
     end;
  end;

  // Adiciona a pessoa na LISTBOX
  lbx_alunos_monografia.AddItem(
      resultado_filtro.nm_pessoa,
      TItemCombo.Create(
         IntToStr(resultado_filtro.cd_pessoa),
         resultado_filtro.nm_pessoa
      )
   );
   
  if  formMonografias.qyMonografias.State in [dsEdit] then begin
     inc(size_arr);
  end;

  formMonografias.qyMonografiascd_turma.AsString := resultado_filtro.cd_turma;
  formMonografias.qyMonografiasnr_anosemestre.AsInteger := resultado_filtro.nr_anosemestre;
  txtAnoSemestre.text := IntToStr(resultado_filtro.nr_anosemestre);

  //ja resgata o curso da pessoa
  Dm.CriarConsulta(qyCursos);
  qyCursos.Close();

  qyCursos.SQL.Clear;
  qyCursos.SQL.Add('SELECT c.codigo as cd_curso, c.descricao as descricao from cursos c');
  qyCursos.SQL.Add(' INNER JOIN turmas t ON(t.curso=c.codigo AND t.anosemestre=c.anosemestre)');
  qyCursos.SQL.Add(' WHERE t.anosemestre=:anosemestre AND');
  qyCursos.SQL.Add(' t.codigo=:cd_turma');
  qyCursos.ParamByName('anosemestre').AsInteger:= resultado_filtro.nr_anosemestre;
  qyCursos.ParamByName('cd_turma').asString:= resultado_filtro.cd_turma;

  qyCursos.Open();

  if(qyCursos.FieldByName('cd_curso').asString <> '') then
  begin
    formMonografias.qyMonografiascd_curso.asString := qyCursos.FieldByName('cd_curso').asString;
    edtCurso.Text := qyCursos.FieldByName('cd_curso').asString+'-'+qyCursos.FieldByName('descricao').asString;
  end;

  FreeAndNil(qyCursos);
end;

procedure TformCadMonografias.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   formMonografias.qyMonografias.Cancel();
   CloseModal;
end;

procedure TformCadMonografias.btnOkClick(Sender: TObject);
const
   SChavePerm = 'Academico.Secretaria.Monografias.EntregaRetroativa';
   SMsgConfirmData = 'Você está selecionando uma data de entrega retroativa.'#13'Deseja prosseguir?';
   SMsgSemPerm = 'Você não possui privilégios suficientes para selecionar uma data de entrega retroativa.';
   STitConfirm = 'Confirmação';
   STitInfo = 'Informação';
   MsgFlagsQuest = MB_ICONQUESTION or MB_YESNO;
   MsgFlagsSemPerm = MB_ICONINFORMATION or MB_OK;
var
  Hoje: TDate;
  ds_chave_monografia, item_lista,ds_state : String;
  i : Integer; 
begin
   Hoje := DM.DataAtual;

   if not formMonografias.qyMonografiasdt_entrega.IsNull then
   begin
      if Trunc(formMonografias.qyMonografiasdt_entrega.AsDateTime) < Trunc(Hoje) then
      begin
         if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, SChavePerm, npIncluir, False) then
         begin
            if MessageBox(Handle, SMsgConfirmData, STitConfirm, MsgFlagsQuest) = ID_NO then
            begin
               Exit;
            end;
         end
         else
         begin
            MessageBox(Handle, SMsgSemPerm, STitInfo, MsgFlagsSemPerm);
            dbeDataEntrega.SetFocus;
            Exit;
         end;
      end;
   end;

   try
      if( lbx_alunos_monografia.Count < 1 )then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar um Aluno');
      end;

      if(formMonografias.qyMonografiascd_orientador.AsInteger = 0)then
      begin
         formMonografias.qyMonografiascd_orientador.Clear;
      end;
      
      if(formMonografias.qyMonografiascd_area.AsInteger = 0)then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar uma Área');
      end;

      if(formMonografias.qyMonografiascd_turma.asString = '')then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar uma Turma');
      end; 

      if(formMonografias.qyMonografiascd_curso.asString = '')then
      begin
        raise EValidaCadMonografia.Create('Você deve Selecionar um Curso');
      end;
      if (formMonografias.qyMonografiasdt_inicio.IsNull) then
      begin
        dbeDataInicio.SetFocus;
        raise EValidaCadMonografia.Create('Você deve selecionar uma data inicial');
      end;

      if(formMonografias.qyMonografiasnr_anosemestre.AsInteger = 0)then
      begin
        raise EValidaCadMonografia.Create('Você deve informar um ano/semestre');
      end;

      formMonografias.qyMonografiascd_unidade_certificadora.AsInteger :=  StrToInt(TItemCombo(cbUnidadeCertificadora.Items.Objects[cbUnidadeCertificadora.ItemIndex]).getCodigo);

      formMonografias.qyMonografiasDS_TEMA_HTML.AsString := FFrameTema.AsHTML;
      formMonografias.qyMonografiasDS_IDEIA_INICIAL_HTML.AsString := FFrameIdeia.AsHTML;
      
      // Escapa os caracteres especiais que compões a formatação dos campos
      FormataCampos();
   Except
      on E:EValidaCadMonografia do
      begin
         Mensagem(E.Message);
         exit;
      end;
   end;

   ModalResult := mrOk;

   formMonografias.qyMonografiasnr_anosemestre.AsInteger := StrToInt(txtAnoSemestre.Text);

   if ( formMonografias.qyMonografias.State in [dsInsert] )  then
   begin

      // Seta a chave da monografia
      formMonografias.qyMonografiasds_chave_grupo.AsString := gerar_random();

      // Insere as monografias
      inserir_monografias();
   end;

   if ( formMonografias.qyMonografias.State in [dsEdit] )  then
   begin
      // Edita as monografias
      alterar_monografias();
      inserir_monografias();
   end;

   formMonografias.qyMonografias.Cancel;
   formMonografias.qyMonografias.Close();
   formMonografias.qyMonografias.Open();
   CloseModal;
end;

procedure TformCadMonografias.carrega_lista_alunos;
CONST
   DS_CONSULTA = ''+
      'SELECT'
      + '    p.cd_pessoa, '
      + '    p.nm_pessoa '
      + ' FROM'
      + '    monografias m '
      + ' INNER JOIN pessoas p ON ( m.cd_pessoa = p.cd_pessoa ) '
      + ' WHERE '
      + '   ( m.ds_chave_grupo = :ds_chave_grupo OR '
      + '    m.cd_monografia = :cd_monografia '
      + '   )';

var
   qry_lista_alunos : TUMZQuery;
begin
   Dm.CriarConsulta(qry_lista_alunos);

   qry_lista_alunos.SQL.Add( DS_CONSULTA );

   qry_lista_alunos.ParamByName('ds_chave_grupo').AsString := formMonografias.qyMonografiasds_chave_grupo.AsString;
   qry_lista_alunos.ParamByName('cd_monografia').AsInteger := formMonografias.qyMonografiascd_monografia.AsInteger;

   qry_lista_alunos.Open();

   qry_lista_alunos.First;
   
   while not qry_lista_alunos.Eof do
   begin
     // Adiciona a pessoa na LISTBOX
     lbx_alunos_monografia.AddItem(
         qry_lista_alunos.FieldByName('nm_pessoa').AsString,
         TItemCombo.Create(
           qry_lista_alunos.FieldByName('cd_pessoa').AsString,
           qry_lista_alunos.FieldByName('nm_pessoa').AsString
         )
      );
      qry_lista_alunos.Next;
   end;

   qry_lista_alunos.Close();
   FreeAndNil(qry_lista_alunos);
end;

procedure TformCadMonografias.ChangeDate(const Date: TDate);
begin
   FCurrentField.AsDateTime := Date;
end;

procedure TformCadMonografias.dbeTurmaChange(Sender: TObject);
var
   qryTurma: TUMZQuery;
   i: integer;
begin

   DM.CriarConsulta(qryTurma);

   if qyUnidadeCertificadora.Active then
   begin

      if formMonografias.qyMonografiascd_turma.AsString = ''  then
      begin
         Abort;
         Exit;
      end;

      qryTurma.Close;
      qryTurma.SQL.Text := 'SELECT cd_unidade_certificadora FROM turmas WHERE codigo = '+QuotedStr(formMonografias.qyMonografiascd_turma.AsString);
      qryTurma.Open;
      qyUnidadeCertificadora.Locate('cd_instituicao', qryTurma.FieldByName('cd_unidade_certificadora').AsInteger, []);
      for i := 0 to cbUnidadeCertificadora.Items.Count - 1 do
      begin
         if TItemCombo(cbUnidadeCertificadora.Items.Objects[i]).getCodigo = qyUnidadeCertificadoracd_instituicao.AsString then
         begin
           cbUnidadeCertificadora.ItemIndex := i;
         end;
      end;
   end;
end;

procedure TformCadMonografias.edlbFormatoCDChange(Sender: TObject);
begin
   formMonografias.qyMonografiasds_formato_cd.AsString:= edlbFormatoCD.Text;
end;

procedure TformCadMonografias.edlbTaxaChange(Sender: TObject);
begin
   formMonografias.qyMonografiasds_taxa.AsString := edlbTaxa.Text;
end;

procedure TformCadMonografias.FormCreate(Sender: TObject);
begin
   FFrameIdeia := TfrmTexEdit.Create(Self);
   FFrameIdeia.Name := EmptyStr;
   FFrameIdeia.Parent := pnlIdeiaInicial;
   FFrameIdeia.dbreEditor.DataSource := formMonografias.dsMonografia;
   FFrameIdeia.dbreEditor.DataField := 'ds_ideia_inicial';

   FFrameTema := TfrmTexEdit.Create(Self);
   FFrameTema.Name := EmptyStr;
   FFrameTema.Parent := pnlTema;
   FFrameTema.dbreEditor.DataSource := formMonografias.dsMonografia;
   FFrameTema.dbreEditor.DataField := 'ds_tema';
end;

procedure TformCadMonografias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F5 :  btnOkClick( nil );
      VK_F12 : btnCancelClick( nil );
   end;
end;

procedure TformCadMonografias.FormShow(Sender: TObject);
var
   i, maiorRegistro, registroAtual: integer;
begin
   if not(DM.UsaAnosemestre) then
   begin
      txtAnoSemestre.Visible := false;
      Label2.Visible := False;
   end;  
   if formMonografias.qyMonografias.State in [dsInsert] then
   begin
      if not (strToInt(txtAnoSemestre.text) > 0) then begin
         txtAnoSemestre.text := formMonografias.txtAnoSemestre.Text;
      end;
   end
   else  if formMonografias.qyMonografias.State in [dsEdit] then
   begin
      //pega as datas da monografia

      txtAnoSemestre.text := IntToStr(formMonografias.qyMonografiasnr_anosemestre.AsInteger);

      // prencher texto de curso, aluno e area
      if ( formMonografias.qyMonografiascd_orientador.asInteger > 0 ) then
      begin
         edtOrientador.Text :=
            IntToStr(formMonografias.qyMonografiascd_orientador.asInteger)
            + '-'
            + formMonografias.qryOrientadornm_pessoa.AsString;
      end;

      edtCurso.Text := formMonografias.qyMonografiascd_curso.asString+'-'+formMonografias.qyMonografiasds_curso_codigo.AsString;
      edlbFormatoCD.Text:= formMonografias.qyMonografiasds_formato_cd.AsString;
      edlbTaxa.Text := formMonografias.qyMonografiasds_taxa.AsString;
      carrega_lista_alunos();
   end;

   formMonografias.qyMonografiasnr_anosemestre.AsInteger  := StrToInt(txtAnoSemestre.Text);

   qyUnidadeCertificadora.Open;

   maiorRegistro := 400;

   cbUnidadeCertificadora.Clear;
   cbUnidadeCertificadora.AddItem( 'Selecione', TItemCombo.Create('0', 'Selecione'));

   cbUnidadeCertificadora.ItemIndex := 0;

   i := 1;

   while not qyUnidadeCertificadora.Eof do
   begin
      cbUnidadeCertificadora.AddItem( qyUnidadeCertificadora.FieldByName('nm_instituicao').AsString, TItemCombo.Create( qyUnidadeCertificadora.FieldByName('cd_instituicao').AsString, qyUnidadeCertificadora.FieldByName('nm_instituicao').AsString ) );

      registroAtual := getTamanhoTexto( qyUnidadeCertificadora.FieldByName('nm_instituicao').AsString );

      if registroAtual > maiorRegistro then
         maiorRegistro := registroAtual;

      if qyUnidadeCertificadora.FieldByName('cd_instituicao').AsInteger = formMonografias.qyMonografiascd_unidade_certificadora.AsInteger then
         cbUnidadeCertificadora.ItemIndex := i;

      inc(i);
      qyUnidadeCertificadora.Next;
   end;

   if maiorRegistro > 700 then
      cbUnidadeCertificadora.Perform(CB_SETDROPPEDWIDTH, 700, 0)
   else
      cbUnidadeCertificadora.Perform(CB_SETDROPPEDWIDTH, maiorRegistro, 0);   

   DBLookupComboBox1.SetFocus;

   size_arr := lbx_alunos_monografia.Count;
   indice := 0;
end;

function TformCadMonografias.gerar_random: String;
var
    nr_random1, nr_random2, nr_random3 : Integer;
    ds_chave_monografia:  string;
begin
      nr_random1  := Random(9);
      nr_random2  := Random(9);
      nr_random3  := Random(9);

      ds_chave_monografia := FormatDateTime('YYYY.mm.dd.HH.mm.ss', Now());

      // Monta a chave das monografias com a data e um número aleatório formado por 3 digitos
      result := ds_chave_monografia
                            + '.'
                            + IntToStr(nr_random1)
                            + IntToStr(nr_random2)
                            + IntToStr(nr_random3);
end;

function TformCadMonografias.getTamanhoTexto(const texto: String): Integer;
var
  aCanvas: TCanvas;
begin
  aCanvas := TCanvas.Create;
  aCanvas.Handle := GetWindowDC(GetDesktopWindow);
  Result := aCanvas.TextWidth(texto);
  aCanvas.Free;
end;

function TformCadMonografias.get_cd_monografia(cd_pessoa : integer ): String;
var
   qrycodigoMonografia : Tumzquery;
begin
   DM.CriarConsulta(qrycodigoMonografia);

   qrycodigoMonografia.SQL.Text := ''
   + 'SELECT cd_monografia from monografias where cd_pessoa = :cd_pessoa '
   + ' AND ds_chave_grupo = :ds_chave_grupo' ;

   qrycodigoMonografia.ParamByName('cd_pessoa').AsInteger :=  cd_pessoa;
   qrycodigoMonografia.ParamByName('ds_chave_grupo').AsString := formMonografias.qyMonografiasds_chave_grupo.AsString;

   qrycodigoMonografia.Open();
   result := qrycodigoMonografia.FieldByName('cd_monografia').AsString;
end;

procedure TformCadMonografias.inserir_monografias;
CONST
   DS_INSERIR = ''+
        'INSERT INTO monografias ( '
      + '   cd_pessoa,'
      + '   cd_area,'
      + '   cd_turma,'
      + '   cd_curso,'
      + '   nr_anosemestre,'
      + '   cd_orientador,'
      + '   cd_aceitou,'
      + '   cd_situacao,'
      + '   cd_forma_entrega,'
      + '   vl_pago,'
      + '   ds_tema,'
      + '   ds_ideia_inicial,'
      + '   ds_observacao,'
      + '   dt_inicio,'
      + '   dt_entrega,'
      + '   dt_pag_orientador,'
      + '   ds_nota_conceito,'
      + '   sn_indicacao,'
      + '   dt_envio_professor,'
      + '   dt_retorno_professor,'
      + '   dt_certificado,'
      + '   dt_aprovacao,'
      + '   dt_impressao_monografia,'
      + '   ds_taxa,'
      + '   ds_formato_cd,'
      + '   dt_solicitacao_certificado,'
      + '   dt_recebimento_certificado,'
      + '   dt_recebimento_ata,'
      + '   dt_recebimento_artigo,'
      + '   cd_unidade_certificadora,'
      + '   DS_TEMA_HTML,'
      + '   DS_IDEIA_INICIAL_HTML,'
      + '   ds_chave_grupo'
      + ' )'
      + ' VALUES '
      + ' ( '
      + '   :cd_pessoa,'
      + '   :cd_area,'
      + '   :cd_turma,'
      + '   :cd_curso,'
      + '   :nr_anosemestre,'
      + '   :cd_orientador,'
      + '   :cd_aceitou,'
      + '   :cd_situacao,'
      + '   :cd_forma_entrega,'
      + '   :vl_pago,'
      + '   :ds_tema,'
      + '   :ds_ideia_inicial,'
      + '   :ds_observacao,'
      + '   :dt_inicio,'
      + '   :dt_entrega,'
      + '   :dt_pag_orientador,'
      + '   :ds_nota_conceito,'
      + '   :sn_indicacao,'
      + '   :dt_envio_professor,'
      + '   :dt_retorno_professor,'
      + '   :dt_certificado,'
      + '   :dt_aprovacao,'
      + '   :dt_impressao_monografia,'
      + '   :ds_taxa,'
      + '   :ds_formato_cd,'
      + '   :dt_solicitacao_certificado,'
      + '   :dt_recebimento_certificado,'
      + '   :dt_recebimento_ata,'
      + '   :dt_recebimento_artigo,'
      + '   :cd_unidade_certificadora,'
      + '   :DS_TEMA_HTML,'
      + '   :DS_IDEIA_INICIAL_HTML,'
      + '   :ds_chave_grupo'
      + ') ';
var
   qryInserirMonografias : TUMZQuery;
   i : Integer;
   item_lista,  ds_separador, sn_indicacao: String;
   ds_valores : WideString;
begin
   DM.CriarConsulta(qryInserirMonografias);
   ds_separador := ',';
   ds_valores   := '';

   // Define a consulta de inserção
   qryInserirMonografias.SQL.Add(
      DS_INSERIR
   );
 
   for i := 0 to lbx_alunos_monografia.Count - 1 do
   begin

      item_lista := TItemCombo(lbx_alunos_monografia.Items.Objects[i]).getCodigo();
      formMonografias.qyMonografiascd_pessoa.AsInteger := StrToInt( item_lista );

      if (get_cd_monografia( StrToInt(item_lista) ) <> '' ) then
      begin
         continue;
      end;
          
      sn_indicacao := '1';
      if ( formMonografias.qyMonografiassn_indicacao.AsInteger <> 1) then
      begin
         sn_indicacao := '0';
      end;

      qryInserirMonografias.ParamByName('cd_pessoa').AsInteger := formMonografias.qyMonografiascd_pessoa.AsInteger ;
      qryInserirMonografias.ParamByName('cd_area').AsInteger :=  formMonografias.qyMonografiascd_area.AsInteger;
      qryInserirMonografias.ParamByName('cd_turma').AsString := formMonografias.qyMonografiascd_turma.AsString;
      qryInserirMonografias.ParamByName('cd_curso').AsString :=  formMonografias.qyMonografiascd_curso.AsString ;
      qryInserirMonografias.ParamByName('nr_anosemestre').AsString := formMonografias.qyMonografiasnr_anosemestre.AsString;
      qryInserirMonografias.ParamByName('cd_orientador').AsString := formMonografias.qyMonografiascd_orientador.AsString;
      qryInserirMonografias.ParamByName('cd_aceitou').AsString := formMonografias.qyMonografiascd_aceitou.AsString;
      qryInserirMonografias.ParamByName('cd_situacao').AsString := formMonografias.qyMonografiascd_situacao.AsString ;
      qryInserirMonografias.ParamByName('cd_forma_entrega').AsString := formMonografias.qyMonografiascd_forma_entrega.AsString;
      qryInserirMonografias.ParamByName('vl_pago').AsString := formMonografias.qyMonografiasvl_pago.AsString;
      qryInserirMonografias.ParamByName('ds_tema').AsString := (formMonografias.qyMonografiasds_tema.AsString);
      qryInserirMonografias.ParamByName('ds_ideia_inicial').AsString := (formMonografias.qyMonografiasds_ideia_inicial.AsString );
      qryInserirMonografias.ParamByName('ds_observacao').AsString := (formMonografias.qyMonografiasds_observacao.AsString) ;
      qryInserirMonografias.ParamByName('ds_nota_conceito').AsString := formMonografias.qyMonografiasds_nota_conceito.AsString;
      qryInserirMonografias.ParamByName('sn_indicacao').AsString := sn_indicacao;
      qryInserirMonografias.ParamByName('ds_taxa').AsString := formMonografias.qyMonografiasds_taxa.AsString;
      qryInserirMonografias.ParamByName('ds_formato_cd').AsString := formMonografias.qyMonografiasds_formato_cd.AsString;
      qryInserirMonografias.ParamByName('cd_unidade_certificadora').AsString := formMonografias.qyMonografiascd_unidade_certificadora.AsString;
      qryInserirMonografias.ParamByName('DS_TEMA_HTML').AsString := formMonografias.qyMonografiasDS_TEMA_HTML.AsString;
      qryInserirMonografias.ParamByName('DS_IDEIA_INICIAL_HTML').AsString := formMonografias.qyMonografiasDS_IDEIA_INICIAL_HTML.AsString;
      qryInserirMonografias.ParamByName('ds_chave_grupo').AsString := formMonografias.qyMonografiasds_chave_grupo.AsString;

      // Abaixo, verificações das datas, se não foram preenchidas, salva como NULL
      if ( formMonografias.qyMonografiasdt_inicio.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_inicio').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_inicio.AsDateTime)
      else
        formMonografias.qyMonografiasdt_inicio.Clear;

      if ( formMonografias.qyMonografiasdt_entrega.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_entrega').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_entrega.AsDateTime)
      else
         formMonografias.qyMonografiasdt_entrega.Clear;

      if ( formMonografias.qyMonografiasdt_pag_orientador.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_pag_orientador').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_pag_orientador.AsDateTime)
      else
         formMonografias.qyMonografiasdt_pag_orientador.Clear;

      if ( formMonografias.qyMonografiasdt_envio_professor.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_envio_professor').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_envio_professor.AsDateTime)
      else
         formMonografias.qyMonografiasdt_envio_professor.Clear;

      if ( formMonografias.qyMonografiasdt_retorno_professor.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_retorno_professor').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_retorno_professor.AsDateTime)
      else
         formMonografias.qyMonografiasdt_retorno_professor.Clear;

      if ( formMonografias.qyMonografiasdt_certificado.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_certificado').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_certificado.AsDateTime)
      else
         formMonografias.qyMonografiasdt_certificado.Clear;

      if ( formMonografias.qyMonografiasdt_aprovacao.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_aprovacao').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_aprovacao.AsDateTime)
      else
         formMonografias.qyMonografiasdt_aprovacao.Clear;

      if ( formMonografias.qyMonografiasdt_impressao_monografia.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_impressao_monografia').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_impressao_monografia.AsDateTime)
      else
         formMonografias.qyMonografiasdt_impressao_monografia.Clear;

      if ( formMonografias.qyMonografiasdt_solicitacao_certificado.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_solicitacao_certificado').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_solicitacao_certificado.AsDateTime)
      else
         formMonografias.qyMonografiasdt_solicitacao_certificado.Clear;

      if ( formMonografias.qyMonografiasdt_recebimento_certificado.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_recebimento_certificado').AsString :=     FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_recebimento_certificado.AsDateTime)
      else
         formMonografias.qyMonografiasdt_recebimento_certificado.Clear;

      if ( formMonografias.qyMonografiasdt_recebimento_ata.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_recebimento_ata').AsString :=    FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_recebimento_ata.AsDateTime)
      else
         formMonografias.qyMonografiasdt_recebimento_ata.Clear;

      if ( formMonografias.qyMonografiasdt_recebimento_artigo.AsString <> '' ) then
         qryInserirMonografias.ParamByName('dt_recebimento_artigo').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_recebimento_artigo.AsDateTime)
      else
         formMonografias.qyMonografiasdt_recebimento_artigo.Clear;


      qryInserirMonografias.ExecSQL();
   end;


//   FreeAndNil(qryInserirMonografias);
end;

procedure TformCadMonografias.alterar_monografias;
const
   DS_ALTERAR = ''
      + ' UPDATE '
      + '   monografias '
      + ' SET '
      + '  cd_area = :cd_area,'
      + '  cd_turma = :cd_turma,'
      + '  cd_curso = :cd_curso,'
      + '  nr_anosemestre = :nr_anosemestre,'
      + '  cd_orientador = :cd_orientador,'
      + '  cd_aceitou = :cd_aceitou,'
      + '  cd_situacao = :cd_situacao,'
      + '  cd_forma_entrega = :cd_forma_entrega,'
      + '  vl_pago = :vl_pago,'
      + '  ds_tema = :ds_tema,'
      + '  ds_ideia_inicial = :ds_ideia_inicial,'
      + '  ds_observacao = :ds_observacao,'
      + '  dt_inicio = :dt_inicio,'
      + '  dt_entrega = :dt_entrega,'
      + '  dt_pag_orientador = :dt_pag_orientador,'
      + '  ds_nota_conceito = :ds_nota_conceito,'
      + '  sn_indicacao = :sn_indicacao,'
      + '  dt_envio_professor = :dt_envio_professor,'
      + '  dt_retorno_professor = :dt_retorno_professor,'
      + '  dt_certificado = :dt_certificado,'
      + '  dt_aprovacao = :dt_aprovacao,'
      + '  dt_impressao_monografia = :dt_impressao_monografia,'
      + '  ds_taxa = :ds_taxa,'
      + '  ds_formato_cd = :ds_formato_cd,'
      + '  dt_solicitacao_certificado = :dt_solicitacao_certificado,'
      + '  dt_recebimento_certificado = :dt_recebimento_certificado,'
      + '  dt_recebimento_ata = :dt_recebimento_ata,'
      + '  dt_recebimento_artigo = :dt_recebimento_artigo,'
      + '  cd_unidade_certificadora = :cd_unidade_certificadora,'
      + '  DS_TEMA_HTML = :DS_TEMA_HTML,'
      + '  DS_IDEIA_INICIAL_HTML = :DS_IDEIA_INICIAL_HTML';

  DS_EXCLUIR = '' +
    ' DELETE FROM '
    + ' monografias'
    + ' WHERE '
    + ' cd_monografia = :cd_monografia';    
var
   qryAlterarMonografias : TUMZQuery;
   i : integer;
   sn_indicacao : String;
begin
   DM.CriarConsulta(qryAlterarMonografias);
   
   // Define a consulta de inserção
   qryAlterarMonografias.SQL.Add(
      DS_ALTERAR
   );

   sn_indicacao := '1';
   if ( formMonografias.qyMonografiassn_indicacao.AsInteger <> 1) then
   begin
      sn_indicacao := '0';
   end;

   // SETA OS CAMPOS PARA O UPDATE !
     qryAlterarMonografias.ParamByName('cd_area').AsInteger := formMonografias.qyMonografiascd_area.AsInteger;
   qryAlterarMonografias.ParamByName('cd_turma').AsString :=  formMonografias.qyMonografiascd_turma.AsString;
   qryAlterarMonografias.ParamByName('cd_curso').AsString :=  formMonografias.qyMonografiascd_curso.AsString;
   qryAlterarMonografias.ParamByName('nr_anosemestre').AsInteger := formMonografias.qyMonografiasnr_anosemestre.AsInteger;
   qryAlterarMonografias.ParamByName('cd_orientador').AsInteger := formMonografias.qyMonografiascd_orientador.AsInteger;
   qryAlterarMonografias.ParamByName('cd_aceitou').AsInteger := formMonografias.qyMonografiascd_aceitou.AsInteger ;
   qryAlterarMonografias.ParamByName('cd_situacao').AsInteger := formMonografias.qyMonografiascd_situacao.AsInteger ;
   qryAlterarMonografias.ParamByName('cd_forma_entrega').AsInteger := formMonografias.qyMonografiascd_forma_entrega.AsInteger;
   qryAlterarMonografias.ParamByName('vl_pago').AsFloat := formMonografias.qyMonografiasvl_pago.AsFloat;
   qryAlterarMonografias.ParamByName('ds_tema').AsString :=  (formMonografias.qyMonografiasds_tema.AsString);
   qryAlterarMonografias.ParamByName('ds_ideia_inicial').AsString := (formMonografias.qyMonografiasds_ideia_inicial.AsString);
   qryAlterarMonografias.ParamByName('ds_observacao').AsString := formMonografias.qyMonografiasds_observacao.AsString;
   qryAlterarMonografias.ParamByName('ds_nota_conceito').AsString := formMonografias.qyMonografiasds_nota_conceito.AsString;
   qryAlterarMonografias.ParamByName('sn_indicacao').AsFloat := formMonografias.qyMonografiassn_indicacao.AsFloat ;
   qryAlterarMonografias.ParamByName('ds_taxa').AsString := formMonografias.qyMonografiasds_taxa.AsString;
   qryAlterarMonografias.ParamByName('ds_formato_cd').AsString := formMonografias.qyMonografiasds_formato_cd.AsString ;
   qryAlterarMonografias.ParamByName('cd_unidade_certificadora').AsString :=  formMonografias.qyMonografiascd_unidade_certificadora.AsString;
   qryAlterarMonografias.ParamByName('DS_TEMA_HTML').AsString := formMonografias.qyMonografiasDS_TEMA_HTML.AsString;
   qryAlterarMonografias.ParamByName('DS_IDEIA_INICIAL_HTML').AsString := formMonografias.qyMonografiasDS_IDEIA_INICIAL_HTML.AsString;
      // Abaixo, verificações das datas, se não foram preenchidas, salva como NULL
      if ( formMonografias.qyMonografiasdt_inicio.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_inicio').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_inicio.AsDateTime)
      else
        formMonografias.qyMonografiasdt_inicio.Clear;

      if ( formMonografias.qyMonografiasdt_entrega.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_entrega').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_entrega.AsDateTime)
      else
         formMonografias.qyMonografiasdt_entrega.Clear;

      if ( formMonografias.qyMonografiasdt_pag_orientador.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_pag_orientador').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_pag_orientador.AsDateTime)
      else
         formMonografias.qyMonografiasdt_pag_orientador.Clear;

      if ( formMonografias.qyMonografiasdt_envio_professor.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_envio_professor').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_envio_professor.AsDateTime)
      else
         formMonografias.qyMonografiasdt_envio_professor.Clear;

      if ( formMonografias.qyMonografiasdt_retorno_professor.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_retorno_professor').AsString := FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_retorno_professor.AsDateTime)
      else
         formMonografias.qyMonografiasdt_retorno_professor.Clear;

      if ( formMonografias.qyMonografiasdt_certificado.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_certificado').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_certificado.AsDateTime)
      else
         formMonografias.qyMonografiasdt_certificado.Clear;

      if ( formMonografias.qyMonografiasdt_aprovacao.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_aprovacao').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_aprovacao.AsDateTime)
      else
         formMonografias.qyMonografiasdt_aprovacao.Clear;

      if ( formMonografias.qyMonografiasdt_impressao_monografia.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_impressao_monografia').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_impressao_monografia.AsDateTime)
      else
         formMonografias.qyMonografiasdt_impressao_monografia.Clear;

      if ( formMonografias.qyMonografiasdt_solicitacao_certificado.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_solicitacao_certificado').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_solicitacao_certificado.AsDateTime)
      else
         formMonografias.qyMonografiasdt_solicitacao_certificado.Clear;

      if ( formMonografias.qyMonografiasdt_recebimento_certificado.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_recebimento_certificado').AsString :=     FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_recebimento_certificado.AsDateTime)
      else
         formMonografias.qyMonografiasdt_recebimento_certificado.Clear;

      if ( formMonografias.qyMonografiasdt_recebimento_ata.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_recebimento_ata').AsString :=    FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_recebimento_ata.AsDateTime)
      else
         formMonografias.qyMonografiasdt_recebimento_ata.Clear;

      if ( formMonografias.qyMonografiasdt_recebimento_artigo.AsString <> '' ) then
         qryAlterarMonografias.ParamByName('dt_recebimento_artigo').AsString :=   FormatDateTime('yyyy-mm-dd',formMonografias.qyMonografiasdt_recebimento_artigo.AsDateTime)
      else
         formMonografias.qyMonografiasdt_recebimento_artigo.Clear;


   // CONDICAO para ALTERAR;
   // CONDICAO para ALTERAR;
   if ( formMonografias.qyMonografiasds_chave_grupo.AsString <> '' ) then
   begin
      // qryAlterarMonografias.ParamByName('ds_chave_grupo').AsString := QuotedStr(formMonografias.qyMonografiasDS_IDEIA_INICIAL_HTML.AsString);
      qryAlterarMonografias.SQL.Add(' WHERE ds_chave_grupo = :ds_chave_grupo');
      qryAlterarMonografias.ParamByName('ds_chave_grupo').AsString := formMonografias.qyMonografiasds_chave_grupo.AsString;
   end else
   begin
      qryAlterarMonografias.SQL.Add(
           ' , ds_chave_grupo = :ds_chave_grupo '
         + ' WHERE cd_monografia = :cd_monografia'
      );

      // Monta a chave das monografias com a data e um número aleatório formado por 3 digitos
      formMonografias.qyMonografiasds_chave_grupo.AsString := gerar_random();

      qryAlterarMonografias.ParamByName('ds_chave_grupo').AsString := formMonografias.qyMonografiasds_chave_grupo.AsString;
      qryAlterarMonografias.ParamByName('cd_monografia').asInteger := formMonografias.qyMonografiascd_monografia.asInteger;
   end;


   // Executa o UPDATE
   qryAlterarMonografias.ExecSQL();
   
   qryAlterarMonografias.Close;
   qryAlterarMonografias.SQL.Clear;

   if ( length(arr_pessoas_excluir) > 0 ) then
   begin   
      for i:= 0 to length(arr_pessoas_excluir)-1 do
      begin
         qryAlterarMonografias.SQL.TEXT := DS_EXCLUIR;

         if ( arr_pessoas_excluir[i] = '' ) then
         begin
            continue;
         end; 

         qryAlterarMonografias.ParamByName('cd_monografia').AsInteger := StrToInt(arr_pessoas_excluir[i]);

         qryAlterarMonografias.ExecSQL();
      end;
   end;
   zerar_array();
   qryAlterarMonografias.Close;
   qryAlterarMonografias.SQL.Clear;

//   FreeAndNil(qryAlterarMonografias);
end;

procedure TformCadMonografias.FormataCampos();
var
  strStream: TStringStream;
begin
//   formMonografias.qyMonografiasds_tema.AsString :=  EncodeCString(formMonografias.qyMonografiasds_tema.AsString);
//   formMonografias.qyMonografiasds_ideia_inicial.AsString  :=  EncodeCString(formMonografias.qyMonografiasds_ideia_inicial.AsString);
end;

procedure TformCadMonografias.sbAlunoClick(Sender: TObject);
var
   qyCursos : TUMZQuery;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante, formMonografias.qyMonografiasnr_anosemestre.AsInteger);

   if not resultado_filtro.filtrado then Exit;

  if(resultado_filtro.nr_anosemestre > 0) then
  begin
    formMonografias.qyMonografiasnr_anosemestre.AsInteger := resultado_filtro.nr_anosemestre;
    txtAnoSemestre.text :=  intToStr(formMonografias.qyMonografiasnr_anosemestre.AsInteger);
  end;
  
  formMonografias.qyMonografiascd_pessoa.AsInteger := resultado_filtro.cd_pessoa;
//  edtAluno.Text := IntToStr(resultado_filtro.cd_pessoa) + ' - ' + resultado_filtro.nm_pessoa;

  formMonografias.qyMonografiascd_turma.AsString := resultado_filtro.cd_turma;

  //ja resgata o curso da pessoa
  Dm.CriarConsulta(qyCursos);
  qyCursos.Close();


  qyCursos.SQL.Clear;
  qyCursos.SQL.Add('SELECT c.codigo as cd_curso, c.descricao as descricao from cursos c');
  qyCursos.SQL.Add(' INNER JOIN turmas t ON(t.curso=c.codigo AND t.anosemestre=c.anosemestre)');
  qyCursos.SQL.Add(' WHERE t.anosemestre=:anosemestre AND');
  qyCursos.SQL.Add(' t.codigo=:cd_turma');
  qyCursos.ParamByName('anosemestre').AsInteger:= formMonografias.qyMonografiasnr_anosemestre.AsInteger;
  qyCursos.ParamByName('cd_turma').asString:= formMonografias.qyMonografiascd_turma.asString;

  qyCursos.Open();

  if(qyCursos.FieldByName('cd_curso').asString <> '') then
  begin
    formMonografias.qyMonografiascd_curso.asString := qyCursos.FieldByName('cd_curso').asString;
    edtCurso.Text := qyCursos.FieldByName('cd_curso').asString+'-'+qyCursos.FieldByName('descricao').asString;
  end;

  FreeAndNil(qyCursos);
end;

procedure TformCadMonografias.sbCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
   nr_anosemestre : integer;
begin
   nr_anosemestre := -1;

   if ( formMonografias.qyMonografiasnr_anosemestre.AsInteger > 0 )  then
   begin   
      nr_anosemestre := formMonografias.qyMonografiasnr_anosemestre.AsInteger;
   end;

   resultado_filtro := TfrmSelecionarCurso.Filtrar(
      [],
      -1,
      -1,
      nr_anosemestre
   );

   if not resultado_filtro.filtrado then Exit;

   formMonografias.qyMonografiascd_curso.AsString := resultado_filtro.cd_curso;
   edtCurso.Text := resultado_filtro.cd_curso + ' - ' + resultado_filtro.ds_curso;

   formMonografias.qyMonografiasnr_anosemestre.AsInteger := resultado_filtro.nr_anosemestre;
   txtAnoSemestre.Text := IntToStr(resultado_filtro.nr_anosemestre);

   formMonografias.qyMonografiascd_turma.AsString := '';

end;

procedure TformCadMonografias.sbTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   nr_anosemestre :  integer;
begin
   nr_anosemestre := -1;

   if ( formMonografias.qyMonografiasnr_anosemestre.AsInteger > 0 )  then
   begin   
      nr_anosemestre := formMonografias.qyMonografiasnr_anosemestre.AsInteger;
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar(
      [],
      nr_anosemestre,
      -1,
      -1,
      formMonografias.qyMonografiascd_curso.AsString
   );

   if not resultado_filtro.filtrado then Exit;

   formMonografias.qyMonografiascd_turma.AsString := resultado_filtro.cd_turma;

   // Atualiza para o anosemestre da turma
   formMonografias.qyMonografiasnr_anosemestre.AsInteger := resultado_filtro.nr_anosemestre;
   txtAnoSemestre.Text := formMonografias.qyMonografiasnr_anosemestre.AsString;

   if ( formMonografias.qyMonografiascd_curso.AsString <> resultado_filtro.cd_curso ) then
   begin
      formMonografias.qyMonografiascd_curso.AsString := resultado_filtro.cd_curso;
      edtCurso.Text := resultado_filtro.cd_curso + ' - ' + resultado_filtro.ds_curso;
   end;
end;

procedure TformCadMonografias.sbDataAprovacaoClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_aprovacao;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataCertificadoClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_certificado;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataEntregaClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_entrega;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataEnvioProfessorClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_envio_professor;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataImpressaoMonografiaClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_impressao_monografia;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataInicioClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_inicio;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataPgtoOrientadorClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_pag_orientador;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataRecebimentoArtigoClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_recebimento_artigo;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataRecebimentoATAClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_recebimento_ata;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataRecebimentoCertificadoClick(
  Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_recebimento_certificado;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataRetornoProfessorClick(Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_retorno_professor;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.sbDataSolicitacaoCertificadoClick(
  Sender: TObject);
begin
   FCurrentField := formMonografias.qyMonografiasdt_solicitacao_certificado;

   if FCurrentField.IsNull then
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate)
   else
      TfrmMonthCalendar.ShowCalendar(TControl(Sender), ChangeDate, FCurrentField.AsDateTime);
end;

procedure TformCadMonografias.zerar_array;
var
   i : integer;
begin

   if Length(arr_pessoas_excluir) < 1 then begin
      Exit;
   end;
    
   for i := 0 to Length(arr_pessoas_excluir)-1 do
   begin
      arr_pessoas_excluir[i] := '';
   end;
end;

procedure TformCadMonografias.sbtOrientadorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([bapOrientadorAtivo], afpOrientador,
      formMonografias.qyMonografiasnr_anosemestre.AsInteger);

   if not resultado_filtro.filtrado then Exit;

   formMonografias.qyMonografiascd_orientador.AsInteger := resultado_filtro.cd_pessoa;
   edtOrientador.Text := IntToStr(resultado_filtro.cd_pessoa) + ' - ' + resultado_filtro.nm_pessoa;
end;

end.

