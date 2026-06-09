unit uExportacaoCenso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, Grids, DBGrids, ImgList, ToolWin, DBCtrls,
  Buttons, UMComboBox, Menus;

type
  TfExportacaoCenso = class(TForm)
    paCabecalho: TPanel;
    pnProcesso: TPanel;
    lbAnoCenso: TLabel;
    txtAno: TMaskEdit;
    UpDown: TUpDown;
    qyProcesso: TUMZQuery;
    qyCriarProcesso: TUMZQuery;
    dbgMatriculas: TDBGrid;
    ilToolBar: TImageList;
    tbAcoes: TToolBar;
    btFechar: TToolButton;
    btIncluir: TToolButton;
    tbSeparator2: TToolButton;
    qyMatriculas: TUMZQuery;
    qyMatriculasnr_ano: TIntegerField;
    qyMatriculascd_curso: TStringField;
    qyMatriculasnr_anosemestre: TIntegerField;
    qyMatriculasnm_pessoa: TStringField;
    dsMatriculas: TDataSource;
    qyMatriculassn_bloqueado: TSmallintField;
    qyMatriculasds_curso: TStringField;
    qyMatriculasds_status: TStringField;
    qyMatriculassn_enviar: TSmallintField;
    tbSeparator1: TToolButton;
    tbSeparator3: TToolButton;
    ckBloquearMatricula: TCheckBox;
    qyAtualizarMatricula: TUMZQuery;
    qyMatriculascd_matricula: TIntegerField;
    qyMatriculasds_situacao: TStringField;
    qyMatriculascd_situacao: TIntegerField;
    cbSituacaoMec: TUMComboBox;
    qySituacoesMec: TUMZQuery;
    qySituacoesMeccd_situacao: TIntegerField;
    qySituacoesMecds_situacao: TStringField;
    dtpDataSaida: TDateTimePicker;
    qyMatriculasdt_saida: TDateTimeField;
    qyMatriculascd_pessoa: TIntegerField;
    qyMatriculascd_curso_origem: TStringField;
    qyMatriculasds_curso_origem: TStringField;
    btAtualizarAno: TToolButton;
    tbSeparator4: TToolButton;
    btConfiguracoesAno: TToolButton;
    btBloquearAno: TToolButton;
    qyInserirLog: TUMZQuery;
    qyMatriculascd_processo: TIntegerField;
    qyMatriculascd_turma_matricula: TStringField;
    qyMatriculascd_situacao_mec: TIntegerField;
    qyMatriculascd_status: TIntegerField;
    pmLogs: TPopupMenu;
    qyLogs: TUMZQuery;
    edFiltroCurso: TEdit;
    lbFiltroCurso: TLabel;
    sbFiltroCurso: TSpeedButton;
    lbFiltroSituacao: TLabel;
    cbFiltroSituacao: TComboBox;
    qySituacaoCenso: TUMZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    cbFiltroEnviados: TComboBox;
    lbFiltroAluno: TLabel;
    btRemoverReincluir: TToolButton;
    qyMatriculassn_bloqueado_col: TStringField;
    btExportarAno: TToolButton;
    sdExportarCenso: TSaveDialog;
    edFiltroColigada: TEdit;
    lbFiltroColigada: TLabel;
    sbFiltroColigada: TSpeedButton;
    Bevel1: TBevel;
    qyCriarExportacao: TUMZQuery;
    lbDepartamento: TLabel;
    edDepartamento: TEdit;
    sbFiltroDepartamento: TSpeedButton;
    procedure edDepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFiltroDepartamentoClick(Sender: TObject);
    procedure sbFiltroColigadaClick(Sender: TObject);
    procedure btExportarAnoClick(Sender: TObject);
    procedure btRemoverReincluirClick(Sender: TObject);
    procedure cbFiltroEnviadosChange(Sender: TObject);
    procedure cbFiltroSituacaoChange(Sender: TObject);
    procedure sbFiltroCursoClick(Sender: TObject);
    procedure edFiltroCursoKeyPress(Sender: TObject; var Key: Char);
    procedure edFiltroCursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgMatriculasTitleClick(Column: TColumn);
    procedure pmLogsPopup(Sender: TObject);
    procedure dbgMatriculasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btIncluirClick(Sender: TObject);
    procedure dtpDataSaidaChange(Sender: TObject);
    procedure cbSituacaoMecChange(Sender: TObject);
    procedure ckBloquearMatriculaClick(Sender: TObject);
    procedure ckEnviarMatriculaClick(Sender: TObject);
    procedure dbgMatriculasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsMatriculasDataChange(Sender: TObject; Field: TField);
    procedure btConfiguracoesAnoClick(Sender: TObject);
    procedure btBloquearAnoClick(Sender: TObject);
    procedure btAtualizarAnoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
  private
    permissaoProcessoIncluir, permissaoProcessoAlterar,
    permissaoMatriculaIncluir, permissaoMatriculaAlterar: Boolean;

    cdSituacaoMec, cdColigada, snEnviar: Integer;
    cdCurso, sOrdem, sNomeArquivo: String;
    procedure InserirControleExportacao(sNomeArquivo: String);

    procedure CarregaComboSituacoesMEC;
    procedure CarregaComboFiltroSituacoesMEC;
    procedure FiltrarProcesso;
    procedure AtualizarAno;
    procedure AtualizaBotoesAcao;
    procedure Filtrar;
    procedure CriarNovoProcesso(ano: Integer);
    function ProcessoExiste(ano: Integer): Boolean;
    { Private declarations }
  public
    procedure inserirLog(pessoa: Integer; chave, descricao, resumo: String);
    { Public declarations }
  end;

var
  fExportacaoCenso: TfExportacaoCenso;

implementation

uses
   uExportacaoCensoConfiguracoes, uItemCombo, uFSelecionarPessoa, uFSelecionarCurso,
   uFSelecionarColigada, uSelDepartamento, uDM, uUsuario, uColigada, General, uFSplash;

{$R *.dfm}

procedure TfExportacaoCenso.UpDownClick(Sender: TObject; Button: TUDBtnType);
begin

   // Verifica se o usuário está aumentando ou diminuindo o ANO do processo 
   if Button = btNext then
   begin
      txtAno.Text := IntToStr(StrToInt(txtAno.Text)+1);
   end else begin
      txtAno.Text := IntToStr(StrToInt(txtAno.Text)-1);
   end;

   // Verifica se foi filtrada uma coligada
   if  (cdColigada > 0) then
   begin

      // Verifica se já existe um processo do ANO atual
      if not ProcessoExiste(StrToInt(txtAno.Text)) then
      begin
         // Caso não existir cria um processo do ANO atual
         CriarNovoProcesso(StrToInt(txtAno.Text));
      end;

      // Filtrar o processo do ANO selecionado
      FiltrarProcesso;

      // Filtra as matriculas do ANO selecionado
      Filtrar;

   end;

end;

procedure TfExportacaoCenso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfExportacaoCenso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {Configura as teclas de atalho}
   case key of
      VK_F2 : if btIncluir.Enabled then btIncluirClick( nil );
      VK_F3 : if ckBloquearMatricula.Enabled then ckBloquearMatriculaClick( nil );
      VK_F9 : if btRemoverReincluir.Enabled then btRemoverReincluirClick( nil );
      VK_F12 : if btFechar.Enabled then btFecharClick( nil );
   end;
end;

procedure TfExportacaoCenso.FormShow(Sender: TObject);
begin
   // Grava as permissões em variáveis internas para não necessitar ficar executando SQLs sempre para buscar as permissões
   permissaoProcessoIncluir := DM.UsuarioLogado.TemPermissao( 1200, npIncluir, False );
   permissaoProcessoAlterar := DM.UsuarioLogado.TemPermissao( 1200, npAlterar, False );
   permissaoMatriculaIncluir :=  DM.UsuarioLogado.TemPermissao( 1201, npIncluir, False );
   permissaoMatriculaAlterar :=  DM.UsuarioLogado.TemPermissao( 1201, npAlterar, False );

   cdColigada := -1;
   sOrdem := 'nm_pessoa ASC';

   // Seta o ANO atual para o censo
   txtAno.Text := FormatDateTime('yyyy', DM.DataAtual);

   // Carrega todas as situações do mec da base de dados
   CarregaComboSituacoesMEC;

   // Carrega todas as situações do mec da base de dados para a combo de filtro
   CarregaComboFiltroSituacoesMEC;

   // Define como padrão a situação de filtrar Enviados
   snEnviar := 1;

   // Atualiza os botões de ação da tela (se habilitados ou desabilitados)
   AtualizaBotoesAcao;

   // Filtra as matriculas do ANO selecionado
   Filtrar;
end;

function TfExportacaoCenso.ProcessoExiste( ano : Integer ): Boolean;
begin

   qyProcesso.Close;
   qyProcesso.ParamByName('nr_ano').AsInteger := ano;
   qyProcesso.ParamByName('cd_coligada').AsInteger := cdColigada;
   qyProcesso.Open;

   if not qyProcesso.Eof then
   begin
      Result := True;
   end else begin
      Result := False;
   end;

end;

procedure TfExportacaoCenso.sbFiltroColigadaClick(Sender: TObject);
var
   coligada_filtrada: TColigada;
begin
   if TfrmSelecionarColigada.ShowModal() then
   begin
      coligada_filtrada := TfrmSelecionarColigada.getResultado();
      cdColigada := coligada_filtrada.Codigo;
      edFiltroColigada.Text := coligada_filtrada.Nome;

      // Verifica se já existe um processo do ANO atual
      if not ProcessoExiste(StrToInt(txtAno.Text)) then
      begin
         // Caso não existir cria um processo do ANO atual
         CriarNovoProcesso(StrToInt(txtAno.Text));
      end;

      // Filtra os dados do processo criado
      FiltrarProcesso;

      // Carrega os registros em tela (se houver)
      Filtrar;
   end;
end;

procedure TfExportacaoCenso.sbFiltroCursoClick(Sender: TObject);
var
   resultado_filtro: TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      cdCurso := resultado_filtro.cd_curso;
      edFiltroCurso.Text := resultado_filtro.ds_curso;
      Filtrar;
   end;
end;

procedure TfExportacaoCenso.sbFiltroDepartamentoClick(Sender: TObject);
Var
   sFiltro: String;
   sOp: String;
   i: Integer;
begin
   // Cria o formulário para selecionar um ou mais departamentos
   Application.CreateForm(TfrmSelDepartamento, frmSelDepartamento);
   frmSelDepartamento.slDepartamentos := TStringList.Create();
   frmSelDepartamento.sDeptosSelecionados := edDepartamento.Text;

   sFiltro := '';
   sOp := '';

   if frmSelDepartamento.ShowModal() = mrOk then
   begin

      // Varre os departamentos para verificar quais foram selecionados pelo usuário
      // Monta uma string com os codigos dos departamentos selecionados separados por vírgula
      for i := 0 to frmSelDepartamento.cklbDepartamentos.Count - 1 do begin
         if frmSelDepartamento.cklbDepartamentos.Checked[i] then
         begin
            sFiltro := sFiltro + sOp + frmSelDepartamento.slDepartamentos.Strings[i];
            sOp := ', ';
         end;
      end;

      edDepartamento.Text := sFiltro;

   end;

   // Verifica se foi filtrada uma coligada
   if  (cdColigada > 0) then
   begin

      // Filtrar o processo do ANO selecionado
      FiltrarProcesso;

      // Filtra as matriculas do ANO selecionado
      Filtrar;

   end;

   FreeAndNil(frmSelDepartamento.slDepartamentos);
   FreeAndNil(frmSelDepartamento);
end;

procedure TfExportacaoCenso.btExportarAnoClick(Sender: TObject);
var
   qyVerificaLayoutAtivo, qyAtualizaUltimaExportacao: TUMZQuery;
   sDiretorioExecutavelExportacao: String;
begin

   Mensagem('Utilize o módulo Exportação para realizar a exportação do Censo Superior.', 'Exportação do Censo Superior!', MB_OK + MB_ICONEXCLAMATION, Handle);
   Exit;

   // Verifica se o ano/coligada (processo) NÃO possui algum layout definido para exportação
   if not (qyProcesso.FieldByName('cd_layout').AsInteger > 0) then
   begin
      Mensagem('Não foi configurado o layout para exportação em '+qyProcesso.FieldByName('nr_ano').AsString+'. Selecione um layout para exportação no botão de "Configurações".', 'Layout não selecionado!', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   // Verifica se existe algum registro que será exportado
   if qyMatriculas.RecordCount = 0 then
   begin
      Mensagem('Nenhum registro encontrado para exportar. Você deve primeiramente atualizar os registros que serão exportados atraavés do botão de "Atualizar '+qyProcesso.FieldByName('nr_ano').AsString+'".', 'Nenhum registro encontrado!', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   dm.CriarConsulta(qyVerificaLayoutAtivo);

   qyVerificaLayoutAtivo.SQL.Text := ''+
      'SELECT              '+
      '  el.cd_layout      '+
      'FROM                '+
      '  expo_layouts el   '+
      'WHERE               '+
      '  el.sn_ativo = 1   '+
      '  AND el.cd_layout = :cd_layout '+
      'ORDER BY            '+
      '  ds_layout ASC     ';

   qyVerificaLayoutAtivo.ParamByName('cd_layout').AsInteger := qyProcesso.FieldByName('cd_layout').AsInteger;
   qyVerificaLayoutAtivo.Open;

   //O layout selecionado não esta ativo!
   if qyVerificaLayoutAtivo.RecordCount < 1 then
   begin
      Mensagem('O layout selecionado não se encontra ativo, por favor ative o mesmo ou selecione outro layout.', 'Layout inativo!', MB_OK + MB_ICONEXCLAMATION, Handle);
      Exit;
   end;

   // Inicia o processo de exportação solicitando o local onde será salvo o arquivo para o usuário 
   if sNomeArquivo = '' then
   begin
      sdExportarCenso.InitialDir := ExtractFileDir(Application.ExeName);
   end else begin
      sdExportarCenso.InitialDir := ExtractFileDir(sNomeArquivo);
      sdExportarCenso.FileName := ExtractFileName(sNomeArquivo);
   end;

   if not (sdExportarCenso.Execute(Self.Handle)) then
   begin
      Exit;
   end;
   sNomeArquivo := sdExportarCenso.FileName;

   sDiretorioExecutavelExportacao := ExtractFilePath(Application.ExeName);

   // Verifica se o executável do módulo existe no computador
   if FileExists(sDiretorioExecutavelExportacao + 'Exportacao.exe') then
   begin

      // Chama o executável do módulo de exportação por linha de comando, repassando por parametro o usuário/senha de conexão, layout da exportação utilizado e o arquivo de saída para geração
      ExecAndWait(sDiretorioExecutavelExportacao + 'Exportacao.exe', '-u '+ DM.UsuarioLogado.Pessoa.Login +' -p '+ DM.UsuarioLogado.Pessoa.Senha +' -l '+qyProcesso.FieldByName('cd_layout').AsString+' -o "'+sNomeArquivo+'"', SW_SHOW);

      // Atualiza data úlitma exportação
      Dm.CriarConsulta(qyAtualizaUltimaExportacao);
      qyAtualizaUltimaExportacao.Close;
      qyAtualizaUltimaExportacao.SQL.Text := 'UPDATE cen_processos SET dt_ultima_exportacao = :dt_ultima_exportacao WHERE cd_processo = :cd_processo';
      qyAtualizaUltimaExportacao.ParamByName('dt_ultima_exportacao').AsDateTime := DM.DataAtual;
      qyAtualizaUltimaExportacao.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
      qyAtualizaUltimaExportacao.ExecSQL;

      // Insere na tabela de cen_exportacoes o registro da exportação que foi gerado, com as informações da exportação
      InserirControleExportacao(sNomeArquivo);

      // Se o ANO exportado estiver desbloqueado, realiza o bloqueio automático do mesmo
      if (qyProcesso.FieldByName('sn_bloqueado').AsInteger = 0) and permissaoProcessoAlterar then
      begin
      
         // Questiona o usuário se o mesmo deseja desbloquear o processo
         if Mensagem('O processo de exportação foi concluído!'#13'Você deseja bloquear esse processo?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
         begin
            btBloquearAnoClick(Sender);
         end;

      end else begin
         // Informa que o procesos de exportação foi concluído com sucesso
         Mensagem('Processo de exportação concluído!', 'Exportação para Censo', MB_OK + MB_ICONINFORMATION, Handle);
      end;

   end else begin
      Mensagem('Não foi encontrado o executável do módulo de Exportação de Dados, ele deve estar na mesma pasta do executável do Unimestre.', 'Módulo não encontrado!', MB_OK + MB_ICONEXCLAMATION, Handle);
   end;

end;

procedure TfExportacaoCenso.InserirControleExportacao(sNomeArquivo : String);
var
   arquivo: TextFile;
   qyUltimaExportacao: TUMZQuery;
   linhaArquivo, conteudoArquivo: String;
begin
   // Cria consulta para recuperar ultima exportação
   Dm.CriarConsulta(qyUltimaExportacao);

   // Inicia o conteúdo como vazio
   conteudoArquivo := '';

   // Ler o conteúdo do arquivo gerado para gravar no controle de exportações
   AssignFile(arquivo, sNomeArquivo);

   // Abre o arquivo para leitura
   Reset(arquivo);

   // Resgata o conteúdo do arquivo
   while not Eof(arquivo) do
   begin
      // Leitura das linhas do arquivo
      ReadLn(arquivo, linhaArquivo);
      // Monta o conteúdo do arquivo gerado
      conteudoArquivo := conteudoArquivo + linhaArquivo + #13;
   end;

   // Fechar o arquivo após leitura
   CloseFile(arquivo);

   // Descobrir qual o número da última exportação para esse processo que foi gerada
   qyUltimaExportacao.Close;
   qyUltimaExportacao.SQL.Text := 'SELECT MAX(nr_exportacao) nr_exportacao FROM cen_exportacoes WHERE cd_processo = :cd_processo';
   qyUltimaExportacao.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
   qyUltimaExportacao.Open;

   // Inserir a exportação na tabela de cen_exportacoes
   qyCriarExportacao.Close;
   qyCriarExportacao.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
   qyCriarExportacao.ParamByName('nr_exportacao').AsInteger := qyUltimaExportacao.FieldByName('nr_exportacao').AsInteger+1;
   qyCriarExportacao.ParamByName('nm_arquivo').AsString := ExtractFileName(sNomeArquivo);
   qyCriarExportacao.ParamByName('nm_usuario').AsString := DM.UsuarioLogado.Pessoa.Login;
   qyCriarExportacao.ParamByName('ds_conteudo_exportado').AsMemo := conteudoArquivo;
   qyCriarExportacao.ParamByName('dt_exportacao').AsDateTime := Dm.DataAtual;
   qyCriarExportacao.ExecSQL;
end;

procedure TfExportacaoCenso.CriarNovoProcesso( ano : Integer );
var
   ds_log, ds_resumo_log: String;
begin

   // Cria um novo processo com base no ANO selecionado
   qyCriarProcesso.Close;
   qyCriarProcesso.ParamByName('nr_ano').AsInteger := ano;
   qyCriarProcesso.ParamByName('cd_coligada').AsInteger := cdColigada;
   qyCriarProcesso.ExecSQL;

   // Insere o log de criação de um novo processo
   ds_log := 'Criado novo processo de exportação do censo de '+IntToStr(ano)+'.'+#13+
             ' cd_processo: '+IntToStr(Dm.LastInsert)+#13+
             ' cd_layout: null (default)'+#13+
             ' nr_ano: '+IntToStr(ano)+#13+
             ' cd_coligada: '+IntToStr(cdColigada)+#13+             
             ' sn_bloqueado: 0 (default)'+#13+
             ' dt_ultima_exportacao: null (default)'+#13+
             ' dt_ultima_atualizacao: null (default)'+#13+
             ' dt_ultimo_bloqueio: null (default)';
   ds_resumo_log := 'Criado novo processo de exportação do censo de '+IntToStr(ano)+'.';

   inserirLog(DM.iCdPessoaLogado, IntToStr(Dm.LastInsert)+';'+IntToStr(ano), ds_log, ds_resumo_log);

end;

procedure TfExportacaoCenso.dbgMatriculasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   cor, i: Integer;
begin

   // Habilita os campos de edição apenas para processos não bloqueados e que possuir permissão
   if not qyProcesso.Eof and (qyProcesso.FieldByName('sn_bloqueado').AsInteger = 0) and permissaoMatriculaAlterar then
   begin

      // Faz aparecer a combo para seleção da situação do MEC na grade quando é clicado sobre a coluna
      if (Column.FieldName = 'ds_situacao') AND (gdSelected IN State) then
      begin
         cbSituacaoMec.Left := Rect.Left + dbgMatriculas.Left;
         cbSituacaoMec.Top := Rect.Top + dbgMatriculas.Top;

         cbSituacaoMec.Width := Rect.Right - Rect.Left + 5;
         cbSituacaoMec.Height := Rect.Bottom - Rect.Top + 5;

         cbSituacaoMec.ItemIndex := 0;
         for i := 0 to cbSituacaoMec.Items.Count - 1 do
         begin
            if ( cbSituacaoMec.Items.Objects[i] as TItemCombo ).getCodigo() = qyMatriculas.FieldByName('cd_situacao').AsString then
            begin
               cbSituacaoMec.ItemIndex := i;
               Break;
            end;
         end;

         cbSituacaoMec.Visible := True;
      end
      else
      begin
         cbSituacaoMec.Visible := False;
      end;

      // Faz aparecer o componente de data para seleção quando é clicado sobre a coluna
      if (Column.FieldName = 'dt_saida') AND (gdSelected IN State) then
      begin
         dtpDataSaida.Left := Rect.Left + dbgMatriculas.Left;
         dtpDataSaida.Top := Rect.Top + dbgMatriculas.Top;

         dtpDataSaida.Width := Rect.Right - Rect.Left + 5;
         dtpDataSaida.Height := Rect.Bottom - Rect.Top + 5;

         if qyMatriculas.FieldByName('dt_saida').IsNull then
         begin
            dtpDataSaida.Checked := False;
         end else begin
            dtpDataSaida.Checked := True;
            dtpDataSaida.DateTime := qyMatriculas.FieldByName('dt_saida').AsDateTime;      
         end;

         dtpDataSaida.Visible := True;
      end
      else
      begin
         dtpDataSaida.Visible := False;
      end;

   end;
   
   // Define a cor da linha a ser apresentada

   // A cor para os demais registros é branca (default)
   cor := clWhite;

   if (qyMatriculas.RecordCount > 0) and (qyMatriculas.FieldByName('sn_bloqueado').AsInteger = 1) then
   begin
      // Quando o registro está bloqueado apresentada é amarelada
      cor := clWebLemonChiffon;
   end;

   dbgMatriculas.Canvas.Brush.Color := cor;

   // Define a cor azul para os registros que estão sendo selecionados
   if gdFocused in State then
   begin
      dbgMatriculas.Canvas.Brush.Color:= clMenuHighlight;
   end;

   dbgMatriculas.Canvas.FillRect(Rect);
   dbgMatriculas.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfExportacaoCenso.dbgMatriculasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_DELETE: begin
         { Bloqueia ação de Ctrl + Del padrão do componente DBGrid }
         Key := 0;
      end;
   end;
end;

procedure TfExportacaoCenso.dbgMatriculasTitleClick(Column: TColumn);
var
   n: Integer;
begin

   if dbgMatriculas.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData then Exit;

   for n:= 0 to dbgMatriculas.Columns.Count - 1 do
   begin
      dbgMatriculas.Columns[n].Title.Font.Style := [];
   end;

   if sOrdem = Column.FieldName then
   begin
      sOrdem := Column.FieldName + ' DESC ';
   end else begin
      sOrdem := Column.FieldName;
   end;

   Column.Title.Font.Style := [fsUnderline];

   Filtrar;
   
end;

procedure TfExportacaoCenso.dsMatriculasDataChange(Sender: TObject;
  Field: TField);
begin

   // Remove os eventos de onclick para não serem disparados
   ckBloquearMatricula.OnClick := nil;

   if qyMatriculas.FieldByName('sn_bloqueado').AsInteger = 1 then
   begin
      ckBloquearMatricula.Checked := True;
   end else begin
      ckBloquearMatricula.Checked := False;
   end;

   if qyMatriculas.FieldByName('sn_enviar').AsInteger = 1 then
   begin
      btRemoverReincluir.Caption := 'F9 Remover censo';
      btRemoverReincluir.ImageIndex := 2;
   end else begin
      btRemoverReincluir.Caption := 'F9 Reincluir censo';
      btRemoverReincluir.ImageIndex := 9;      
   end;

   // Recoloca os eventos de onclick após definir o valor padrão das checkbox
   ckBloquearMatricula.OnClick := ckBloquearMatriculaClick;

end;

procedure TfExportacaoCenso.dtpDataSaidaChange(Sender: TObject);
var
   ds_chave, ds_log, ds_resumo_log, dtSaidaAnterior: String;
   linhaSelecionada: Pointer;
const
   SQL_UPDATE_DT_SAIDA = 'UPDATE cen_matriculas SET dt_saida = :dt_saida, cd_status = CASE WHEN cd_status = 1 THEN :cd_status ELSE cd_status END WHERE cd_matricula = :cd_matricula';
begin
   if not permissaoMatriculaAlterar then Exit;

   try
      // Grava a data de saida anterior para os logs
      dtSaidaAnterior := qyMatriculas.FieldByName('dt_saida').AsString;

      // Verifica se a data selecionada pelo usuário é diferente da data já cadastra, somente nesse caso edita
      if (dtpDataSaida.checked and (dtpDataSaida.DateTime <> qyMatriculas.FieldByName('dt_saida').AsDateTime)) then
      begin
         qyAtualizarMatricula.Close;
         qyAtualizarMatricula.SQL.Text := SQL_UPDATE_DT_SAIDA;
         qyAtualizarMatricula.ParamByName('dt_saida').AsDateTime := dtpDataSaida.DateTime;
         qyAtualizarMatricula.ParamByName('cd_status').AsInteger := 2;
         qyAtualizarMatricula.ParamByName('cd_matricula').AsInteger := qyMatriculas.FieldByName('cd_matricula').AsInteger;
         qyAtualizarMatricula.ExecSQL;
      end else if not dtpDataSaida.checked and not qyMatriculas.FieldByName('dt_saida').IsNull then
      begin
         qyAtualizarMatricula.Close;
         qyAtualizarMatricula.SQL.Text := SQL_UPDATE_DT_SAIDA;
         qyAtualizarMatricula.ParamByName('dt_saida').Clear;
         qyAtualizarMatricula.ParamByName('cd_status').AsInteger := 2;
         qyAtualizarMatricula.ParamByName('cd_matricula').AsInteger := qyMatriculas.FieldByName('cd_matricula').AsInteger;
         qyAtualizarMatricula.ExecSQL;
      end;
   except
      on E: Exception do
      begin
         Mensagem('Não foi possível salvar a alteração da data de saída para esse registro.');
         Exit;
      end;
   end;

   try
      linhaSelecionada := qyMatriculas.GetBookmark;
      Filtrar;
      qyMatriculas.GotoBookmark(linhaSelecionada);
   except
   end;

   // Inclui log de alteração da situação do MEC do aluno
   ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+qyMatriculas.FieldByName('nr_ano').AsString+';'+qyMatriculas.FieldByName('cd_pessoa').AsString+';'+qyMatriculas.FieldByName('cd_curso').AsString;
   ds_log := 'Usuário modificou a data de saída para o registro de matricula "'+ds_chave+'".'+#13+
             ' cd_matricula: '+qyMatriculas.FieldByName('cd_matricula').AsString+#13+
             ' nr_ano: '+qyMatriculas.FieldByName('nr_ano').AsString+#13+
             ' cd_pessoa: '+qyMatriculas.FieldByName('cd_pessoa').AsString+#13+
             ' cd_curso: '+qyMatriculas.FieldByName('cd_curso').AsString+#13+
             ' cd_processo: '+qyMatriculas.FieldByName('cd_processo').AsString+#13+
             ' cd_turma_matricula: '+qyMatriculas.FieldByName('cd_turma_matricula').AsString+#13+
             ' nr_anosemestre: '+qyMatriculas.FieldByName('nr_anosemestre').AsString+#13+
             ' cd_curso_origem: '+qyMatriculas.FieldByName('cd_curso_origem').AsString+#13+
             ' cd_situacao_mec: '+qyMatriculas.FieldByName('cd_situacao_mec').AsString+#13+
             ' dt_saida: [nova: '+qyMatriculas.FieldByName('dt_saida').AsString+', anterior: '+dtSaidaAnterior+']'+#13+
             ' sn_bloqueado: '+qyMatriculas.FieldByName('sn_bloqueado').AsString+#13+
             ' sn_enviar: '+qyMatriculas.FieldByName('sn_enviar').AsString+#13+
             ' cd_status: '+qyMatriculas.FieldByName('cd_status').AsString;
   ds_resumo_log := 'Alterada data de saída do aluno. | Data de saída: ['+dtSaidaAnterior+'] => ['+qyMatriculas.FieldByName('dt_saida').AsString+'].';

   inserirLog(DM.iCdPessoaLogado, ds_chave, ds_log, ds_resumo_log);

end;

procedure TfExportacaoCenso.edDepartamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfExportacaoCenso.edFiltroCursoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      cdCurso := '';
      TEdit(Sender).Text := '';
      Filtrar;
   end;
end;

procedure TfExportacaoCenso.edFiltroCursoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      Filtrar;
  End;
end;

procedure TfExportacaoCenso.FiltrarProcesso();
begin

   // Busca o processo do ANO selecionado
   qyProcesso.Close;
   qyProcesso.ParamByName('nr_ano').AsInteger := StrToInt(txtAno.Text);
   qyProcesso.Open;

   // Atualiza as Labels da toolbar de ações
   AtualizaBotoesAcao;

end;

procedure TfExportacaoCenso.Filtrar();
const
   SQL_FILTRAR_MATRICULAS = 'SELECT '+
                            '   cem.cd_matricula, '+
                            '   cem.nr_ano, '+
                            '   cem.cd_curso, '+
                            '   cm.ds_curso, '+
                            '   cem.cd_curso_origem, '+
                            '   cmo.ds_curso ds_curso_origem, '+
                            '   cem.nr_anosemestre, '+
                            '   p.cd_pessoa, '+
                            '   p.nm_pessoa, '+
                            '   cem.sn_bloqueado, '+
                            '   cms.ds_status, '+
                            '   cem.sn_enviar, '+
                            '   sm.cd_situacao, '+
                            '   sm.ds_situacao, '+
                            '   cem.dt_saida, '+
                            '   cem.cd_processo, '+
                            '   cem.cd_turma_matricula, '+
                            '   cem.cd_situacao_mec, '+
                            '   cem.cd_status, '+
                            '   CASE WHEN cem.sn_bloqueado = 1 THEN "X" ELSE "" END sn_bloqueado_col '+
                            ' FROM '+
                            '   cen_matriculas cem '+
                            '   INNER JOIN cen_processos cep ON (cep.cd_processo = cem.cd_processo) '+
                            '   INNER JOIN pessoas p ON (p.cd_pessoa = cem.cd_pessoa) '+
                            '   INNER JOIN cursos_mestre cm ON (cm.cd_curso = cem.cd_curso) '+
                            '   INNER JOIN cen_matriculas_status cms ON (cms.cd_status = cem.cd_status) '+
                            '   INNER JOIN cen_situacoes_mec sm ON (cem.cd_situacao_mec = sm.cd_situacao) '+
                            '   INNER JOIN cursos_coligadas cc ON (cc.cd_curso = cem.cd_curso) '+
                            '   LEFT JOIN cursos_mestre cmo ON (cmo.cd_curso = cem.cd_curso_origem) '+
                            ' WHERE '+
                            '   cem.nr_ano = :nr_ano AND '+
                            '   cep.cd_coligada = :cd_coligada ';
begin

   // Busca as matriculas do processo com base no ANO selecionado
   qyMatriculas.Close;
   qyMatriculas.SQL.Text := SQL_FILTRAR_MATRICULAS;

   // Verifica se foi filtrado um ou mais departamentos
   if Length(edDepartamento.Text) > 0 then
   begin
      qyMatriculas.SQL.Text := qyMatriculas.SQL.Text + ' AND cc.cd_depto IN ( "' + StringReplace( edDepartamento.Text, ', ', '", "', [rfReplaceAll, rfIgnoreCase]) +'" ) ';
   end;

   // Verifica se foi filtrado um curso pelo usuário
   if Length(edFiltroCurso.Text) > 0 then
   begin
      qyMatriculas.SQL.Text := qyMatriculas.SQL.Text + ' AND cem.cd_curso = :cd_curso ';
      qyMatriculas.ParamByName('cd_curso').AsString := cdCurso;
   end;

   // Verifica se foi filtrado uma situação do MEC específica pelo usuário
   if cdSituacaoMec > 0 then
   begin
      qyMatriculas.SQL.Text := qyMatriculas.SQL.Text + ' AND cem.cd_situacao_mec = :cd_situacao ';
      qyMatriculas.ParamByName('cd_situacao').AsInteger := cdSituacaoMec;
   end;

   // Verifica se foi filtrado as matriculas que devem ser enviados / não enviadas
   qyMatriculas.SQL.Text := qyMatriculas.SQL.Text + ' AND cem.sn_enviar = :sn_enviar ';
   qyMatriculas.ParamByName('sn_enviar').AsInteger := snEnviar;

   // Concatena a ordenação baseada na coluna selecionada pelo usuário
   qyMatriculas.SQL.Text := qyMatriculas.SQL.Text + ' ORDER BY ' + sOrdem;
   qyMatriculas.ParamByName('nr_ano').AsInteger := StrToInt(txtAno.Text);
   qyMatriculas.ParamByName('cd_coligada').AsInteger := cdColigada;
   qyMatriculas.Open;

end;

procedure TfExportacaoCenso.AtualizaBotoesAcao();
var
   snBloqueado: Boolean;
begin

   // Verifica se o processo está bloqueado
   snBloqueado := not qyProcesso.Eof and (qyProcesso.FieldByName('sn_bloqueado').AsInteger = 1);

   btAtualizarAno.Caption := 'Atualizar '+txtAno.Text;
   btExportarAno.Caption := 'Exportar '+txtAno.Text;

   if snBloqueado then
   begin
      btBloquearAno.Caption := 'Desbloquear '+txtAno.Text;
      btBloquearAno.ImageIndex := 8;
   end else begin
      btBloquearAno.Caption := 'Bloquear '+txtAno.Text;
      btBloquearAno.ImageIndex := 4;
   end;

   // Habilita ou Desabilita os menus de acordo com o bloqueio do processo desse ANO e permissões
   btAtualizarAno.Enabled := not snBloqueado and permissaoProcessoIncluir and (cdColigada > 0);
   btBloquearAno.Enabled := permissaoProcessoAlterar and (cdColigada > 0);
   btConfiguracoesAno.Enabled := permissaoProcessoAlterar and (cdColigada > 0);
   btExportarAno.Enabled := (cdColigada > 0);
   btIncluir.Enabled := not snBloqueado and permissaoMatriculaIncluir and (cdColigada > 0);
   btRemoverReincluir.Enabled := not snBloqueado and permissaoMatriculaAlterar and (cdColigada > 0);
   ckBloquearMatricula.Enabled := permissaoMatriculaAlterar and (cdColigada > 0);

end;

procedure TfExportacaoCenso.btAtualizarAnoClick(Sender: TObject);
begin
   AtualizarAno();
end;

procedure TfExportacaoCenso.btBloquearAnoClick(Sender: TObject);
var
   ds_log, ds_resumo_log: String;
   qyAtualizarAno: TUMZQuery;
begin
   if not permissaoProcessoAlterar then Exit;

   DM.CriarConsulta(qyAtualizarAno);

   // Verifica se o processo está bloqueado, nesse caso exibe mensagem de confirmação para desbloquear
   if qyProcesso.FieldByName('sn_bloqueado').AsInteger = 1 then
   begin
      // Questiona o usuário se o mesmo deseja desbloquear o processo
      if Mensagem('Ao desbloquear o processo desse ano, os registros contidos nele poderão sofrer alterações.'#13'Você tem certeza que deseja desbloquear o processo selecionado?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_NO then
      begin
         Exit;
      end;

      // Desbloqueia o processo
      qyAtualizarAno.Close;
      qyAtualizarAno.SQL.Text := 'UPDATE cen_processos SET sn_bloqueado = 0 WHERE cd_processo = :cd_processo';
      qyAtualizarAno.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
      qyAtualizarAno.ExecSQL;

      // Filtrar o processo do ANO selecionado
      FiltrarProcesso;

      // Insere o log de desbloqueio de um processo
      ds_log := 'Processo de '+qyProcesso.FieldByName('nr_ano').AsString+' foi desbloqueado.'+#13+
                ' cd_processo: '+qyProcesso.FieldByName('cd_processo').AsString+#13+
                ' cd_layout: '+qyProcesso.FieldByName('cd_layout').AsString+#13+
                ' nr_ano: '+qyProcesso.FieldByName('nr_ano').AsString+#13+
                ' cd_coligada: '+qyProcesso.FieldByName('cd_coligada').AsString+#13+                
                ' sn_bloqueado: '+qyProcesso.FieldByName('sn_bloqueado').AsString+#13+
                ' dt_ultima_exportacao: '+qyProcesso.FieldByName('dt_ultima_exportacao').AsString+#13+
                ' dt_ultima_atualizacao: '+qyProcesso.FieldByName('dt_ultima_atualizacao').AsString+#13+
                ' dt_ultimo_bloqueio: '+qyProcesso.FieldByName('dt_ultimo_bloqueio').AsString;
      ds_resumo_log := 'Desbloqueado processo de '+qyProcesso.FieldByName('nr_ano').AsString+'. | Bloqueio: [Sim] => [Não].';

      inserirLog(DM.iCdPessoaLogado, qyProcesso.FieldByName('cd_processo').AsString+';'+qyProcesso.FieldByName('nr_ano').AsString, ds_log, ds_resumo_log);

      // Mensagem de sucesso sobre bloqueio do processo
      Mensagem('Processo de '+txtAno.Text+' foi desbloqueado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION);

   end else begin

      // Bloqueia o processo e atualiza a data do último bloqueio do processo
      qyAtualizarAno.Close;
      qyAtualizarAno.SQL.Text := 'UPDATE cen_processos SET sn_bloqueado = 1, dt_ultimo_bloqueio = :dt_ultimo_bloqueio WHERE cd_processo = :cd_processo';
      qyAtualizarAno.ParamByName('dt_ultimo_bloqueio').AsDateTime := DM.DataAtual;
      qyAtualizarAno.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
      qyAtualizarAno.ExecSQL;

      // Filtrar o processo do ANO selecionado
      FiltrarProcesso;

      // Insere o log de bloqueio de um processo
      ds_log := 'Processo de '+qyProcesso.FieldByName('nr_ano').AsString+' foi bloqueado.'+#13+
                ' cd_processo: '+qyProcesso.FieldByName('cd_processo').AsString+#13+
                ' cd_layout: '+qyProcesso.FieldByName('cd_layout').AsString+#13+
                ' nr_ano: '+qyProcesso.FieldByName('nr_ano').AsString+#13+
                ' cd_coligada: '+qyProcesso.FieldByName('cd_coligada').AsString+#13+                
                ' sn_bloqueado: '+qyProcesso.FieldByName('sn_bloqueado').AsString+#13+
                ' dt_ultima_exportacao: '+qyProcesso.FieldByName('dt_ultima_exportacao').AsString+#13+
                ' dt_ultima_atualizacao: '+qyProcesso.FieldByName('dt_ultima_atualizacao').AsString+#13+
                ' dt_ultimo_bloqueio: '+qyProcesso.FieldByName('dt_ultimo_bloqueio').AsString;
      ds_resumo_log := 'Bloqueado processo de '+qyProcesso.FieldByName('nr_ano').AsString+'. | Bloqueio: [Não] => [Sim].';

      inserirLog(DM.iCdPessoaLogado, qyProcesso.FieldByName('cd_processo').AsString+';'+qyProcesso.FieldByName('nr_ano').AsString, ds_log, ds_resumo_log);

      // Mensagem de sucesso sobre bloqueio do processo
      Mensagem('Processo de '+txtAno.Text+' foi bloqueado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION);

   end;

end;

procedure TfExportacaoCenso.btConfiguracoesAnoClick(Sender: TObject);
begin
   if not permissaoProcessoAlterar then Exit;

   // Abre a janela configurações do processo de censo do ano selecionado
   fExportacaoCensoConfiguracoes := TfExportacaoCensoConfiguracoes.Create( self );
   fExportacaoCensoConfiguracoes.ShowModal();

   // Após acessar as configurações do processo, atualiza o mesmo na tela de exportação
   FiltrarProcesso;   
end;

procedure TfExportacaoCenso.btFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfExportacaoCenso.btIncluirClick(Sender: TObject);
var
   ds_chave, ds_log, ds_resumo_log: String;
   cd_matricula: Integer;
   resultadoFiltro: TResultadoFiltroPessoa;
   qyBuscaCurso: TUMZQuery;
const
   SQL_INSERIR_ALUNO = 'INSERT INTO cen_matriculas (nr_ano, cd_pessoa, cd_curso, cd_processo, cd_turma_matricula, nr_anosemestre, cd_situacao_mec, cd_status) '+
                       '   VALUES (:nr_ano, :cd_pessoa, :cd_curso, :cd_processo, :cd_turma_matricula, :nr_anosemestre, :cd_situacao_mec, :cd_status)';
begin
   if not permissaoMatriculaIncluir then Exit;

   resultadoFiltro := TfrmSelecionarPessoa.Filtrar([bapPessoa, bapProfessor,
      bapAvancada, bapObservacoes, bapFuncionario, bapOrientador, bapOrientadorAtivo,
      bapFornecedor], afpEstudante);

   // Se filtrou um aluno deve inserir no banco
   if resultadoFiltro.filtrado then
   begin
      Dm.CriarConsulta(qyBuscaCurso);

      // Busca o curso da turma selecionada
      qyBuscaCurso.Close;
      qyBuscaCurso.SQL.Text := 'SELECT curso FROM turmas WHERE codigo = :cd_turma AND anosemestre = :nr_anosemestre';
      qyBuscaCurso.ParamByName('cd_turma').AsString := resultadoFiltro.cd_turma;
      qyBuscaCurso.ParamByName('nr_anosemestre').AsInteger := resultadoFiltro.nr_anosemestre;
      qyBuscaCurso.Open;

      // Verifica se o aluno que será inserido já existe nesse ano do processo
      if not qyMatriculas.Locate('nr_ano;cd_pessoa;cd_curso',
               VarArrayOf([qyProcesso.FieldByName('nr_ano').AsInteger, resultadoFiltro.cd_pessoa, qyBuscaCurso.FieldByName('curso').AsString]), []) then
      begin

         qyAtualizarMatricula.Close;
         qyAtualizarMatricula.SQL.Text := SQL_INSERIR_ALUNO;
         qyAtualizarMatricula.ParamByName('nr_ano').AsInteger := qyProcesso.FieldByName('nr_ano').AsInteger;
         qyAtualizarMatricula.ParamByName('cd_pessoa').AsInteger := resultadoFiltro.cd_pessoa;
         qyAtualizarMatricula.ParamByName('cd_curso').AsString := qyBuscaCurso.FieldByName('curso').AsString;
         qyAtualizarMatricula.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
         qyAtualizarMatricula.ParamByName('cd_turma_matricula').AsString := resultadoFiltro.cd_turma;
         qyAtualizarMatricula.ParamByName('nr_anosemestre').AsInteger := resultadoFiltro.nr_anosemestre;
         qyAtualizarMatricula.ParamByName('cd_situacao_mec').AsInteger := 2;
         qyAtualizarMatricula.ParamByName('cd_status').AsInteger := 3;
         qyAtualizarMatricula.ExecSQL;

         cd_matricula := Dm.LastInsert;

         Filtrar;

         qyMatriculas.Locate('cd_matricula', cd_matricula, []);

         // Insere o log de inclusão manual de matrícula
         ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+qyMatriculas.FieldByName('nr_ano').AsString+';'+qyMatriculas.FieldByName('cd_pessoa').AsString+';'+qyMatriculas.FieldByName('cd_curso').AsString;
         ds_log := 'Registro de matrícula "'+ds_chave+'" foi incluída manualmente pelo usuário.'+#13+
                   ' cd_matricula: '+qyMatriculas.FieldByName('cd_matricula').AsString+#13+
                   ' nr_ano: '+qyMatriculas.FieldByName('nr_ano').AsString+#13+
                   ' cd_pessoa: '+qyMatriculas.FieldByName('cd_pessoa').AsString+#13+
                   ' cd_curso: '+qyMatriculas.FieldByName('cd_curso').AsString+#13+
                   ' cd_processo: '+qyMatriculas.FieldByName('cd_processo').AsString+#13+
                   ' cd_turma_matricula: '+qyMatriculas.FieldByName('cd_turma_matricula').AsString+#13+
                   ' nr_anosemestre: '+qyMatriculas.FieldByName('nr_anosemestre').AsString+#13+
                   ' cd_curso_origem: '+qyMatriculas.FieldByName('cd_curso_origem').AsString+#13+
                   ' cd_situacao_mec: '+qyMatriculas.FieldByName('cd_situacao_mec').AsString+#13+
                   ' dt_saida: '+qyMatriculas.FieldByName('dt_saida').AsString+#13+
                   ' sn_bloqueado: '+qyMatriculas.FieldByName('sn_bloqueado').AsString+#13+
                   ' sn_enviar: '+qyMatriculas.FieldByName('sn_enviar').AsString+#13+
                   ' cd_status: '+qyMatriculas.FieldByName('cd_status').AsString;
         ds_resumo_log := 'Matrícula inserida manualmente.';                   

         inserirLog(DM.iCdPessoaLogado, ds_chave, ds_log, ds_resumo_log);
      end else begin
         Mensagem('Não é possível inserir essa pessoa, pois a mesma já se encontra incluida para esse processo.', 'Atenção', MB_OK);
         Exit;
      end;

   end else begin
      Exit;
   end;
end;

procedure TfExportacaoCenso.btRemoverReincluirClick(Sender: TObject);
var
   ds_chave, ds_log, ds_resumo_log: String;
   linhaSelecionada: Pointer;
const
   SQL_UPDATE_ENVIO = 'UPDATE cen_matriculas SET sn_enviar = :sn_enviar WHERE cd_matricula = :cd_matricula';
begin
   if not permissaoMatriculaAlterar then Exit;

   // Prepara a query para atualizar o campo de envio dessa matricula para censo
   qyAtualizarMatricula.Close;
   qyAtualizarMatricula.SQL.Text := SQL_UPDATE_ENVIO;

   // Verifica com base a na situação atual se deve setar o campo com envio ou não
   if qyMatriculas.FieldByName('sn_enviar').AsInteger = 1 then
   begin
      qyAtualizarMatricula.ParamByName('sn_enviar').AsInteger := 0;
      ds_resumo_log := 'Definido para não enviar registro desse aluno. | Envio: [Sim] => [Não].';
   end else begin
      qyAtualizarMatricula.ParamByName('sn_enviar').AsInteger := 1;
      ds_resumo_log := 'Definido para enviar registro desse aluno. | Envio: [Não] => [Sim].';
   end;

   qyAtualizarMatricula.ParamByName('cd_matricula').AsInteger := qyMatriculas.FieldByName('cd_matricula').AsInteger;

   qyAtualizarMatricula.ExecSQL;

   // Insere o log de habilitar o envio/não envio do registro de  matrícula
   ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+qyMatriculas.FieldByName('nr_ano').AsString+';'+qyMatriculas.FieldByName('cd_pessoa').AsString+';'+qyMatriculas.FieldByName('cd_curso').AsString;
   ds_log := 'Registrada opção de [sn_enviar='+qyMatriculas.FieldByName('sn_enviar').AsString+'] para o registro de matricula "'+ds_chave+'".'+#13+
             ' cd_matricula: '+qyMatriculas.FieldByName('cd_matricula').AsString+#13+
             ' nr_ano: '+qyMatriculas.FieldByName('nr_ano').AsString+#13+
             ' cd_pessoa: '+qyMatriculas.FieldByName('cd_pessoa').AsString+#13+
             ' cd_curso: '+qyMatriculas.FieldByName('cd_curso').AsString+#13+
             ' cd_processo: '+qyMatriculas.FieldByName('cd_processo').AsString+#13+
             ' cd_turma_matricula: '+qyMatriculas.FieldByName('cd_turma_matricula').AsString+#13+
             ' nr_anosemestre: '+qyMatriculas.FieldByName('nr_anosemestre').AsString+#13+
             ' cd_curso_origem: '+qyMatriculas.FieldByName('cd_curso_origem').AsString+#13+
             ' cd_situacao_mec: '+qyMatriculas.FieldByName('cd_situacao_mec').AsString+#13+
             ' dt_saida: '+qyMatriculas.FieldByName('dt_saida').AsString+#13+
             ' sn_bloqueado: '+qyMatriculas.FieldByName('sn_bloqueado').AsString+#13+
             ' sn_enviar: '+qyMatriculas.FieldByName('sn_enviar').AsString+#13+
             ' cd_status: '+qyMatriculas.FieldByName('cd_status').AsString;

   inserirLog(DM.iCdPessoaLogado, ds_chave, ds_log, ds_resumo_log);

   try
      linhaSelecionada := qyMatriculas.GetBookmark;
      Filtrar;
      if qyMatriculas.BookmarkValid(linhaSelecionada) then
      begin
         qyMatriculas.GotoBookmark(linhaSelecionada);
      end else begin
         qyMatriculas.Last;
      end;
   except
   end;   
end;

procedure TfExportacaoCenso.cbFiltroEnviadosChange(Sender: TObject);
begin
   snEnviar := cbFiltroEnviados.ItemIndex;

   Filtrar;
end;

procedure TfExportacaoCenso.cbFiltroSituacaoChange(Sender: TObject);
begin
   cdSituacaoMec := StrToInt(TItemCombo(cbFiltroSituacao.Items.Objects[cbFiltroSituacao.ItemIndex]).getCodigo);

   Filtrar;
end;

procedure TfExportacaoCenso.cbSituacaoMecChange(Sender: TObject);
var
   ds_chave, ds_log, ds_resumo_log, dsSituacaoAnterior: String;
   cdSituacaoSelecionada, cdSituacaoAnterior: Integer;
   linhaSelecionada: Pointer;
const
   SQL_UPDATE_SITUACAO = 'UPDATE cen_matriculas SET cd_situacao_mec = :cd_situacao_mec, cd_status = CASE WHEN cd_status = 1 THEN :cd_status ELSE cd_status END WHERE cd_matricula = :cd_matricula';
begin

   if not permissaoMatriculaAlterar then Exit;

   try
      // Busca a situação selecionada pelo usuário
      cdSituacaoSelecionada := StrToInt((cbSituacaoMec.Items.Objects[cbSituacaoMec.ItemIndex] AS TItemCombo).getCodigo());

      // Grava a situação anterior para informar no log
      cdSituacaoAnterior := qyMatriculas.FieldByName('cd_situacao').AsInteger;
      dsSituacaoAnterior := qyMatriculas.FieldByName('ds_situacao').AsString;

      // Verifica se a situação selecionada é diferente da situação já cadastra, somente nesse caso edita
      if cdSituacaoSelecionada <> cdSituacaoAnterior then
      begin
         qyAtualizarMatricula.Close;
         qyAtualizarMatricula.SQL.Text := SQL_UPDATE_SITUACAO;
         qyAtualizarMatricula.ParamByName('cd_situacao_mec').AsInteger := cdSituacaoSelecionada;
         qyAtualizarMatricula.ParamByName('cd_status').AsInteger := 2;
         qyAtualizarMatricula.ParamByName('cd_matricula').AsInteger := qyMatriculas.FieldByName('cd_matricula').AsInteger;
         qyAtualizarMatricula.ExecSQL;
      end;
   except
      on E: Exception do
      begin
         Mensagem('Não foi possível salvar a alteração da situação do MEC para esse registro.');
         Exit;
      end;
   end;

   try
      linhaSelecionada := qyMatriculas.GetBookmark;
      Filtrar;
      qyMatriculas.GotoBookmark(linhaSelecionada);
   except
   end;

   // Inclui log de alteração somente se a situação do MEC do aluno foi alterada
   if cdSituacaoSelecionada <> cdSituacaoAnterior then
   begin
      // Inclui log de alteração da situação do MEC do aluno
      ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+qyMatriculas.FieldByName('nr_ano').AsString+';'+qyMatriculas.FieldByName('cd_pessoa').AsString+';'+qyMatriculas.FieldByName('cd_curso').AsString;
      ds_log := 'Usuário modificou a situação do MEC manualmente para o registro de matricula "'+ds_chave+'".'+#13+
                ' cd_matricula: '+qyMatriculas.FieldByName('cd_matricula').AsString+#13+
                ' nr_ano: '+qyMatriculas.FieldByName('nr_ano').AsString+#13+
                ' cd_pessoa: '+qyMatriculas.FieldByName('cd_pessoa').AsString+#13+
                ' cd_curso: '+qyMatriculas.FieldByName('cd_curso').AsString+#13+
                ' cd_processo: '+qyMatriculas.FieldByName('cd_processo').AsString+#13+
                ' cd_turma_matricula: '+qyMatriculas.FieldByName('cd_turma_matricula').AsString+#13+
                ' nr_anosemestre: '+qyMatriculas.FieldByName('nr_anosemestre').AsString+#13+
                ' cd_curso_origem: '+qyMatriculas.FieldByName('cd_curso_origem').AsString+#13+
                ' cd_situacao_mec: [nova: '+qyMatriculas.FieldByName('cd_situacao_mec').AsString+', anterior: '+IntToStr(cdSituacaoAnterior)+']'+#13+
                ' dt_saida: '+qyMatriculas.FieldByName('dt_saida').AsString+#13+
                ' sn_bloqueado: '+qyMatriculas.FieldByName('sn_bloqueado').AsString+#13+
                ' sn_enviar: '+qyMatriculas.FieldByName('sn_enviar').AsString+#13+
                ' cd_status: '+qyMatriculas.FieldByName('cd_status').AsString;
      ds_resumo_log := 'Alterada situação do MEC do aluno. | Situação: ['+dsSituacaoAnterior+'] => ['+qyMatriculas.FieldByName('ds_situacao').AsString+'].';

      inserirLog(DM.iCdPessoaLogado, ds_chave, ds_log, ds_resumo_log);
   end;

end;

procedure TfExportacaoCenso.ckBloquearMatriculaClick(Sender: TObject);
var
   ds_chave, ds_log, ds_resumo_log: String;
   linhaSelecionada: Pointer;
const
   SQL_UPDATE_BLOQUEIO = 'UPDATE cen_matriculas SET sn_bloqueado = :sn_bloqueado WHERE cd_matricula = :cd_matricula';
begin
   if not permissaoMatriculaAlterar then Exit;

   // Prepara a query para atualizar o campo de bloqueado dessa matricula para censo
   qyAtualizarMatricula.Close;
   qyAtualizarMatricula.SQL.Text := SQL_UPDATE_BLOQUEIO;

   // Verifica com base a na situação atual se deve setar o campo com bloqueado ou não
   if qyMatriculas.FieldByName('sn_bloqueado').AsInteger = 1 then
   begin
      qyAtualizarMatricula.ParamByName('sn_bloqueado').AsInteger := 0;
      ds_resumo_log := 'Desbloqueado registro desse aluno. | Bloqueio: [Sim] => [Não].';
   end else begin
      qyAtualizarMatricula.ParamByName('sn_bloqueado').AsInteger := 1;
      ds_resumo_log := 'Bloqueado registro desse aluno. | Bloqueio: [Não] => [Sim].';
   end;

   qyAtualizarMatricula.ParamByName('cd_matricula').AsInteger := qyMatriculas.FieldByName('cd_matricula').AsInteger;

   qyAtualizarMatricula.ExecSQL;

   // Insere o log de habilitar o bloqueio/desbloqueio do registro de  matrícula
   ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+qyMatriculas.FieldByName('nr_ano').AsString+';'+qyMatriculas.FieldByName('cd_pessoa').AsString+';'+qyMatriculas.FieldByName('cd_curso').AsString;
   ds_log := 'Registrada opção de [sn_bloqueado='+qyMatriculas.FieldByName('sn_bloqueado').AsString+'] para o registro de matricula "'+ds_chave+'".'+#13+
             ' cd_matricula: '+qyMatriculas.FieldByName('cd_matricula').AsString+#13+
             ' nr_ano: '+qyMatriculas.FieldByName('nr_ano').AsString+#13+
             ' cd_pessoa: '+qyMatriculas.FieldByName('cd_pessoa').AsString+#13+
             ' cd_curso: '+qyMatriculas.FieldByName('cd_curso').AsString+#13+
             ' cd_processo: '+qyMatriculas.FieldByName('cd_processo').AsString+#13+
             ' cd_turma_matricula: '+qyMatriculas.FieldByName('cd_turma_matricula').AsString+#13+
             ' nr_anosemestre: '+qyMatriculas.FieldByName('nr_anosemestre').AsString+#13+
             ' cd_curso_origem: '+qyMatriculas.FieldByName('cd_curso_origem').AsString+#13+
             ' cd_situacao_mec: '+qyMatriculas.FieldByName('cd_situacao_mec').AsString+#13+
             ' dt_saida: '+qyMatriculas.FieldByName('dt_saida').AsString+#13+
             ' sn_bloqueado: '+qyMatriculas.FieldByName('sn_bloqueado').AsString+#13+
             ' sn_enviar: '+qyMatriculas.FieldByName('sn_enviar').AsString+#13+
             ' cd_status: '+qyMatriculas.FieldByName('cd_status').AsString;

   inserirLog(DM.iCdPessoaLogado, ds_chave, ds_log, ds_resumo_log);

   try
      linhaSelecionada := qyMatriculas.GetBookmark;
      Filtrar;
      qyMatriculas.GotoBookmark(linhaSelecionada);
   except
   end;   
end;

procedure TfExportacaoCenso.ckEnviarMatriculaClick(Sender: TObject);
var
   ds_chave, ds_log, ds_resumo_log: String;
   linhaSelecionada: Pointer;
const
   SQL_UPDATE_ENVIO = 'UPDATE cen_matriculas SET sn_enviar = :sn_enviar WHERE cd_matricula = :cd_matricula';
begin
   if not permissaoMatriculaAlterar then Exit;

   // Prepara a query para atualizar o campo de envio dessa matricula para censo
   qyAtualizarMatricula.Close;
   qyAtualizarMatricula.SQL.Text := SQL_UPDATE_ENVIO;

   // Verifica com base a na situação atual se deve setar o campo com envio ou não
   if qyMatriculas.FieldByName('sn_enviar').AsInteger = 1 then
   begin
      qyAtualizarMatricula.ParamByName('sn_enviar').AsInteger := 0;
      ds_resumo_log := 'Definido para não enviar registro desse aluno. | Envio: [Sim] => [Não].';
   end else begin
      qyAtualizarMatricula.ParamByName('sn_enviar').AsInteger := 1;
      ds_resumo_log := 'Definido para enviar registro desse aluno. | Envio: [Não] => [Sim].';
   end;

   qyAtualizarMatricula.ParamByName('cd_matricula').AsInteger := qyMatriculas.FieldByName('cd_matricula').AsInteger;

   qyAtualizarMatricula.ExecSQL;

   try
      linhaSelecionada := qyMatriculas.GetBookmark;
      Filtrar;
      qyMatriculas.GotoBookmark(linhaSelecionada);
   except
   end;

   // Insere o log de habilitar o envio/não envio do registro de  matrícula
   ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+qyMatriculas.FieldByName('nr_ano').AsString+';'+qyMatriculas.FieldByName('cd_pessoa').AsString+';'+qyMatriculas.FieldByName('cd_curso').AsString;
   ds_log := 'Registrada opção de [sn_enviar='+qyMatriculas.FieldByName('sn_enviar').AsString+'] para o registro de matricula "'+ds_chave+'".'+#13+
             ' cd_matricula: '+qyMatriculas.FieldByName('cd_matricula').AsString+#13+
             ' nr_ano: '+qyMatriculas.FieldByName('nr_ano').AsString+#13+
             ' cd_pessoa: '+qyMatriculas.FieldByName('cd_pessoa').AsString+#13+
             ' cd_curso: '+qyMatriculas.FieldByName('cd_curso').AsString+#13+
             ' cd_processo: '+qyMatriculas.FieldByName('cd_processo').AsString+#13+
             ' cd_turma_matricula: '+qyMatriculas.FieldByName('cd_turma_matricula').AsString+#13+
             ' nr_anosemestre: '+qyMatriculas.FieldByName('nr_anosemestre').AsString+#13+
             ' cd_curso_origem: '+qyMatriculas.FieldByName('cd_curso_origem').AsString+#13+
             ' cd_situacao_mec: '+qyMatriculas.FieldByName('cd_situacao_mec').AsString+#13+
             ' dt_saida: '+qyMatriculas.FieldByName('dt_saida').AsString+#13+
             ' sn_bloqueado: '+qyMatriculas.FieldByName('sn_bloqueado').AsString+#13+
             ' sn_enviar: '+qyMatriculas.FieldByName('sn_enviar').AsString+#13+
             ' cd_status: '+qyMatriculas.FieldByName('cd_status').AsString;

   inserirLog(DM.iCdPessoaLogado, ds_chave, ds_log, ds_resumo_log);
end;

procedure TfExportacaoCenso.AtualizarAno();
var
   ds_log, ds_resumo_log, ds_depto_log: String;
   qyAtualizarAno: TUMZQuery;
begin

   if not permissaoProcessoIncluir then Exit;

   // Verifica se o processo está bloqueado, nesse caso não permite atualizar o mesmo
   if qyProcesso.FieldByName('sn_bloqueado').AsInteger = 1 then
   begin
      Mensagem('Não é possível atualizar o processo desse ano, pois o mesmo está bloqueado.'#13'Para atualizar é necessário desbloquear o processo.', 'Atenção', MB_OK);
      Exit;
   end;

   // Verifica se existe registro para o ANO selecionado, se existir deve confirmar a ação do usuário primeiro
   if not qyMatriculas.Eof then
   begin
      // Questiona o usuário se o mesmo deseja apagar e reincluir os registros para o ano selecionado
      if Mensagem('Ao atualizar esse ano do censo, TODOS os registros não bloqueados desse ano serão apagados e incluídos novamente.'#13'Você tem certeza que deseja atualizar o processo selecionado?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_NO then
      begin
         Exit;
      end;
   end;

   try
      // Abre uma tela splash informando carregamento das matriculas do censo
      TfSplash.GetInstancia().ShowSplashScreen('Verificando matriculas do Censo', 'Aguarde, verificando matrículas que serão exportadas para o censo...');

      DM.CriarConsulta(qyAtualizarAno);

      // Remove todas as matriculas desse processo que não estiverem bloqueadas
      qyAtualizarAno.Close;
      qyAtualizarAno.SQL.Text := 'DELETE FROM cen_matriculas WHERE sn_bloqueado = 0 AND cd_processo = :cd_processo';
      qyAtualizarAno.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
      qyAtualizarAno.ExecSQL;

      // Chamar os procedimentos para atualizar informações do CENSO
      DM.callProcedure(
         'CALL PROC_ATUALIZAR_MATRICULAS_CENSO('+
            qyProcesso.FieldByName('nr_ano').AsString+', '+
            qyProcesso.FieldByName('cd_processo').AsString+', '+
            IntToStr(cdColigada)+', '+
            QuotedStr(edDepartamento.Text)+
         ')'
      );

      // Atualiza a data da última atualização do processo
      qyAtualizarAno.Close;
      qyAtualizarAno.SQL.Text := 'UPDATE cen_processos SET dt_ultima_atualizacao = :dt_ultima_atualizacao WHERE cd_processo = :cd_processo';
      qyAtualizarAno.ParamByName('dt_ultima_atualizacao').AsDateTime := DM.DataAtual;
      qyAtualizarAno.ParamByName('cd_processo').AsInteger := qyProcesso.FieldByName('cd_processo').AsInteger;
      qyAtualizarAno.ExecSQL;

      // Verifica quais os departamentos que foram gerados para incluir no log
      if Length(edDepartamento.Text) > 0 then
      begin
         ds_depto_log := edDepartamento.Text;
      end else begin
         ds_depto_log := 'Todos';
      end;

      // Insere o log de atualização de um processo
      ds_log := 'Atualização do processo de '+qyProcesso.FieldByName('nr_ano').AsString+', durante atualização todas matriculas não bloqueadas são removidas.'+#13+
                ' cd_processo: '+qyProcesso.FieldByName('cd_processo').AsString+#13+
                ' cd_layout: '+qyProcesso.FieldByName('cd_layout').AsString+#13+
                ' nr_ano: '+qyProcesso.FieldByName('nr_ano').AsString+#13+
                ' cd_coligada: '+qyProcesso.FieldByName('cd_coligada').AsString+#13+
                ' departamentos selecionados: '+ds_depto_log+#13+
                ' sn_bloqueado: '+qyProcesso.FieldByName('sn_bloqueado').AsString+#13+
                ' dt_ultima_exportacao: '+qyProcesso.FieldByName('dt_ultima_exportacao').AsString+#13+
                ' dt_ultima_atualizacao: '+qyProcesso.FieldByName('dt_ultima_atualizacao').AsString+#13+
                ' dt_ultimo_bloqueio: '+qyProcesso.FieldByName('dt_ultimo_bloqueio').AsString;
      ds_resumo_log := 'Atualizado processo de '+qyProcesso.FieldByName('nr_ano').AsString+'.';

      inserirLog(DM.iCdPessoaLogado, qyProcesso.FieldByName('cd_processo').AsString+';'+qyProcesso.FieldByName('nr_ano').AsString, ds_log, ds_resumo_log);
   finally
      // Fecha a tela de carregamento das matriculas do censo (mesmo se houver erros)
      TfSplash.GetInstancia().CloseSplashScreen();
   end;

   // Mensagem de sucesso sobre a atualização do processo
   Mensagem('Processo de '+txtAno.Text+' foi atualizado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION);

   // Atualiza os registros da tela
   Filtrar;

end;

procedure TfExportacaoCenso.CarregaComboSituacoesMEC;
begin
   qySituacoesMec.Close;
   qySituacoesMec.Open;
   qySituacoesMec.First;

   while not qySituacoesMec.Eof do
   begin
      cbSituacaoMec.AddItem( qySituacoesMec.FieldByName('ds_situacao').AsString, TItemCombo.Create(
         qySituacoesMec.FieldByName('cd_situacao').AsString, qySituacoesMec.FieldByName('ds_situacao').AsString
      ) );

      qySituacoesMec.Next;
   end;

   qySituacoesMec.First;
end;

procedure TfExportacaoCenso.CarregaComboFiltroSituacoesMEC;
begin
   qySituacaoCenso.Close;
   qySituacaoCenso.Open;
   qySituacaoCenso.First;

   // Adiciona um item como "todas situações selecionadas"
   cbFiltroSituacao.AddItem(
      'Todas',
      TItemCombo.Create(
         '0',
         'Todas'
      )
   );

   // Seleciona a primeira opção (todas situações)
   cbFiltroSituacao.ItemIndex := 0;

   // Adiciona as situações do censo na combo de filtro
   while not qySituacaoCenso.Eof do
   begin

      cbFiltroSituacao.AddItem(
         qySituacaoCenso.FieldByName('ds_situacao').AsString,
         TItemCombo.Create(
            qySituacaoCenso.FieldByName('cd_situacao').AsString,
            qySituacaoCenso.FieldByName('ds_situacao').AsString
         )
      );

      qySituacaoCenso.Next;
   end;

   qySituacaoCenso.First;
end;

procedure TfExportacaoCenso.inserirLog(pessoa: Integer; chave, descricao, resumo: String);
begin
   qyInserirLog.Close;

   qyInserirLog.ParamByName('cd_pessoa').AsInteger := pessoa;
   qyInserirLog.ParamByName('ds_chave').AsString := chave;
   qyInserirLog.ParamByName('ds_log').AsString := descricao;
   qyInserirLog.ParamByName('ds_log_resumo').AsString := resumo;
   qyInserirLog.ParamByName('dt_log').AsDateTime := Dm.DataAtual;

   qyInserirLog.ExecSQL;
end;

procedure TfExportacaoCenso.pmLogsPopup(Sender: TObject);
var
   item: TMenuItem;
   ds_chave: String;
begin

   pmLogs.Items.Clear;
   item := TMenuItem.Create(self);

   ds_chave := qyMatriculas.FieldByName('cd_matricula').AsString+';'+
               qyMatriculas.FieldByName('nr_ano').AsString+';'+
               qyMatriculas.FieldByName('cd_pessoa').AsString+';'+
               qyMatriculas.FieldByName('cd_curso').AsString;

   qyLogs.Close;
   qyLogs.ParamByName('ds_chave').AsString := ds_chave;
   qyLogs.Open;

   if qyLogs.Eof then
   begin
      item.Caption := 'Nenhuma alteração foi registrada.';
      pmLogs.Items.Add(item);
   end else begin
      item.Caption := 'Alterações registradas: ';
      pmLogs.Items.Add(item);
      item := TMenuItem.Create(self);
      item.Caption := '-';
      pmLogs.Items.Add(item);
   end;

   while not qyLogs.Eof do
   begin

    item := TMenuItem.Create(self);
    item.Caption := qyLogs.FieldByName('dt_log').AsString + ' - ' + qyLogs.FieldByName('ds_login').AsString + ': ' + qyLogs.FieldByName('ds_log_resumo').AsString;

    pmLogs.Items.Add(item);
    qyLogs.Next;

   end;

end;

end.
