unit uDiario_Prazos_Novo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls,
  ImgList, ToolWin, DB, DBTables, xmldom, Xmlxform, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset;

type
  TfDiario_Prazos_Novo = class(TForm)
    Panel3: TPanel;
    pnPrazos: TPanel;
    btnFiltrar2: TBitBtn;
    grdPrazos: TDBGrid;
    Panel4: TPanel;
    toolPessoa: TToolBar;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    dsPrazos: TDataSource;
    dsTipoPrazo: TDataSource;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    txtAnoSemestreFiltro: TMaskEdit;
    UpDown2: TUpDown;
    Label1: TLabel;
    Label2: TLabel;
    DBEditNmPrazo: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    vincularCursosTurmasDisc: TButton;
    pnCadastro: TScrollBox;
    Label12: TLabel;
    txtPCurso: TEdit;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    txtPTurma: TEdit;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    txtPDisciplina: TEdit;
    SpeedButton3: TSpeedButton;
    dsTipoPrazosFiltro: TDataSource;
    comboBoxTipoPrazosFiltrar: TComboBox;
    BitBtn1: TBitBtn;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Panel7: TPanel;
    qyExcluirPrazo: TUMZQuery;
    qyTipoPrazos: TUMZReadOnlyQuery;
    qyPrazos: TUMZQuery;
    qyTipoPrazosFiltro: TUMZReadOnlyQuery;
    qyPrazosTurmasFiltro: TUMZReadOnlyQuery;
    qyTipoPrazosDS_TIPO_PRAZO: TStringField;
    qyPrazosNM_PRAZO: TStringField;
    qyPrazosDS_TIPO_PRAZO: TStringField;
    qyTipoPrazosFiltroDS_TIPO_PRAZO: TStringField;
    qyPrazosDT_INICIO_ETAPA: TDateTimeField;
    qyPrazosDT_FIM_ETAPA: TDateTimeField;
    qyPrazosDT_INICIO_FREQUENCIA: TDateTimeField;
    qyPrazosDT_FIM_FREQUENCIA: TDateTimeField;
    qyPrazosDT_INICIO_NOTAS: TDateTimeField;
    qyPrazosDT_FIM_NOTAS: TDateTimeField;
    qyPrazosDT_LIBERACAO: TDateTimeField;
    qyPrazosCD_PRAZO: TIntegerField;
    qyPrazosNR_ANOSEMESTRE: TIntegerField;
    qyPrazosCD_TIPO_PRAZO: TIntegerField;
    qyTipoPrazosCD_TIPO_PRAZO: TIntegerField;
    qyTipoPrazosFiltroCD_TIPO_PRAZO: TIntegerField;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    qyPrazosDT_LIBERACAO_RE: TDateTimeField;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    qyPrazosDT_LIBERACAO_NP: TDateTimeField;
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure dsPrazosDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtAnoSemestreChange(Sender: TObject);
    procedure AplicarFiltrar(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure checaLimpar(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure dsPrazosStateChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure grdPrazosDblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure UpDown0Click(Sender: TObject; Button: TUDBtnType);
    procedure qyPrazosBeforePost(DataSet: TDataSet);
    procedure vincularCursosTurmasDiscClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPrazosTitleClick(Column: TColumn);
    procedure dsPrazosTurmasDataChange(Sender: TObject; Field: TField);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    colunaOrdenacao : string;
    procedure habilitarPrazos(habilitar: boolean; labelHabilitado: array of TLabel; campoHabilitado: array of TDBEdit);
  public
    { Public declarations }

    procedure InserirPrazo();
    procedure Filtrar();
  end;

var
  fDiario_Prazos_Novo: TfDiario_Prazos_Novo;

implementation

uses
   Main, uDM, uVincularCursosTurmasDisc, uFSelecionarTurma, uFSelecionarCurso,
   uFSelecionarDisciplina, General, uUsuario;

{$R *.dfm}

procedure TfDiario_Prazos_Novo.btnAlterarClick(Sender: TObject);
var
   CdPrazo : Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1024, npAlterar, True ) then Exit;

   txtPCurso.SetFocus;
   //Coloca a qyPrazos em modo de edição e seta o focus no componente de interface
   qyPrazos.Edit;
   
   {Verifica se existem turmas vinculadas a regra do prazo
    que está sendo editada, caso existam, não permite a edição
    do Ano/Semestre e Tipo de Prazo da regra}
   CdPrazo := qyPrazos.FieldByName('CD_PRAZO').AsInteger;
   f_vincular_cursos_turmas_disc.Filtrar(CdPrazo);

   if not f_vincular_cursos_turmas_disc.qyPrazosTurmas.IsEmpty then
   begin
      txtAnoSemestre.Enabled := false;
      UpDown1.Enabled := false;
      DBLookupComboBox2.Enabled := false;
   end;
   
   DBEditNmPrazo.SetFocus;
end;

procedure TfDiario_Prazos_Novo.btnCancelarClick(Sender: TObject);
begin
   //Cancela modo de edição ou Inserção
   qyPrazos.Cancel();
end;

procedure TfDiario_Prazos_Novo.btnExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1024, npExcluir, True ) then Exit;

  if Mensagem('Você tem certeza que deseja excluir o registro selecionado?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin
      // Se não tiver nenhum selecionado, seleciona automaticamente o primeiro registro da Grid
      grdPrazos.SelectedRows.CurrentRowSelected := True;

      // Deleta todos os registros de turmas/disciplinas do prazo selecionado
      qyExcluirPrazo.ParamByName('cd_prazo').AsInteger := qyPrazos.FieldByName('cd_prazo').AsInteger;
      qyExcluirPrazo.ExecSQL;

      // Deleta o registro selecionado
      grdPrazos.SelectedRows.Delete;

      // Atualiza os dados da grid
      Filtrar;
  end;
end;

procedure TfDiario_Prazos_Novo.btnFecharClick(Sender: TObject);
begin
   qyPrazos.Close;
   qyTipoPrazos.Close;
   Close;
end;

procedure TfDiario_Prazos_Novo.btnInserirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1024, npIncluir, True ) then Exit;

   txtPCurso.SetFocus;
   //Coloca a qyPrazos em modo de inserção e seta o focus no componente de interface
   qyPrazos.Insert;
   DBEditNmPrazo.SetFocus;
end;

procedure TfDiario_Prazos_Novo.btnSalvarClick(Sender: TObject);
begin
   //Salva as alterações do modo de edição ou inserção
   qyPrazos.Post;

   //Atualiza a lista de prazos
   Filtrar;
end;

procedure TfDiario_Prazos_Novo.vincularCursosTurmasDiscClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1024, npEspecial, True ) then Exit;

   // Abre a janela para vincular cursos, turmas e disciplinas
   f_vincular_cursos_turmas_disc.ShowModal();
end;

procedure TfDiario_Prazos_Novo.dsPrazosDataChange(Sender: TObject;
  Field: TField);
begin
   //Atualiza o ano/semestre manualmente no painel de edição
   if qyPrazos.FieldByName('NR_ANOSEMESTRE').AsString <> '' then
      txtAnoSemestre.Text := qyPrazos.FieldByName('NR_ANOSEMESTRE').AsString;

   // Ao alterar a comboBox de tipo de prazo verifica se o tipo de prazo selecionado é -3 (resultado final)
   if (qyTipoPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger = -3) then
   begin
      //Caso seja resultado final (-3) desativa as caixas das datas exceto a data liberação
      habilitarPrazos(false, [Label15], [DBEdit7]);
   end else if (qyTipoPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger = -1) then
   begin
      //Caso seja exame final (-1) desativa as caixas das datas exceto a nota
      habilitarPrazos(false, [Label10, Label11, Label15], [DBEdit5, DBEdit6, DBEdit7]);
   end else if (qyTipoPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger = -2) then
   begin
      //Caso seja segunda época (-2) desativa as caixas das datas exceto a nota
      habilitarPrazos(false, [Label10, Label11, Label15], [DBEdit5, DBEdit6, DBEdit7]);
   end else
   begin
      //Caso seja outro ativa as caixas das datas
      habilitarPrazos(true, [], []);
   end;
end;

procedure TfDiario_Prazos_Novo.dsPrazosStateChange(Sender: TObject);
begin
   btnInserir.Enabled               := qyPrazos.State in [dsBrowse];
   btnAlterar.Enabled               := qyPrazos.State in [dsBrowse];
   btnExcluir.Enabled               := qyPrazos.State in [dsBrowse];
   btnSalvar.Enabled                := qyPrazos.State in [dsInsert,dsEdit];
   btnCancelar.Enabled              := qyPrazos.State in [dsInsert,dsEdit];
   btnFechar.Enabled                := qyPrazos.State in [dsBrowse];
   pnCadastro.Enabled               := qyPrazos.State in [dsInsert,dsEdit];
   vincularCursosTurmasDisc.Enabled := qyPrazos.State in [dsInsert,dsEdit];
   pnPrazos.Enabled                 := qyPrazos.State in [dsBrowse];

   // Muda a cor do filtro de ano/semestre e para não confundir o usuário
   if qyPrazos.State in [dsInsert,dsEdit] then
   begin
      txtAnoSemestre.Color := clWindow; // Ativado
   end else begin
      txtAnoSemestre.Color := clMenu; // Desativado
   end;

   // Ao alterar a comboBox de tipo de prazo verifica se o tipo de prazo selecionado é -3 (resultado final)
   if (qyTipoPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger = -3) then
   begin
      //Caso seja resultado final (-3) desativa as caixas das datas exceto a data liberação
      habilitarPrazos(false, [Label15], [DBEdit7]);
   end else if (qyTipoPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger = -1) then
   begin
      //Caso seja exame final (-1) desativa as caixas das datas exceto a nota
      habilitarPrazos(false, [Label10, Label11, Label15], [DBEdit5, DBEdit6, DBEdit7]);
   end else if (qyTipoPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger = -2) then
   begin
      //Caso seja segunda época (-2) desativa as caixas das datas exceto a nota
      habilitarPrazos(false, [Label10, Label11, Label15], [DBEdit5, DBEdit6, DBEdit7]);
   end else
   begin
      //Caso seja outro ativa as caixas das datas
      habilitarPrazos(true, [], []);
   end;

   {Ativa os campos de seleção de Ano/Semestre e Tipo de Prazo
   Esses podem ter sido desativados no controle de verificação de edição
   de um prazo, quando há turmas vinculadas ao mesmo}
   txtAnoSemestre.Enabled := true;
   UpDown1.Enabled := true;
   DBLookupComboBox2.Enabled := true;
    
end;

procedure TfDiario_Prazos_Novo.dsPrazosTurmasDataChange(Sender: TObject;
  Field: TField);
begin
   Filtrar;
   if not qyPrazosNR_ANOSEMESTRE.IsNull then
   begin
      txtAnoSemestre.Text := qyPrazosNR_ANOSEMESTRE.AsString;
   end;      
end;

procedure TfDiario_Prazos_Novo.AplicarFiltrar(Sender: TObject);
begin
   Filtrar;
end;

procedure TfDiario_Prazos_Novo.Filtrar;
var
   strCdPrazos : string;
begin
   {Filtrar os prazos de acordo com o filtro aplicado}

   //Prepara o SQL
   qyPrazos.SQL.Text := '  SELECT ';
   qyPrazos.SQL.Add('         dp.* ');
   qyPrazos.SQL.Add('      FROM ');
   qyPrazos.SQL.Add('         dia_prazos dp ');
   qyPrazos.SQL.Add('      LEFT JOIN dia_prazos_turmas dpt ON(dpt.CD_PRAZO = dp.CD_PRAZO AND dpt.NR_ANOSEMESTRE = dp.NR_ANOSEMESTRE) ');
   qyPrazos.SQL.Add('      LEFT JOIN turmas t ON(t.codigo = dpt.CD_TURMA and t.anosemestre = dpt.NR_ANOSEMESTRE) ');
   qyPrazos.SQL.Add('      WHERE ');
   qyPrazos.SQL.Add('         dp.nr_anosemestre = :nr_anosemestre ');
   qyPrazos.SQL.Add('         AND (t.cd_coligada IN ( '+DM.UsuarioLogado.GetColigadasFilhaSelecionada+' ) OR t.cd_coligada is NULL) ');


   //Adiciona o anosemestre
   qyPrazos.ParamByName('nr_anosemestre').AsString := txtAnoSemestreFiltro.Text;

   //Verifica se usuário selecionou o tipo de prazo para ser filtrado e adiciona caso usuário tenha selecionado
   if comboBoxTipoPrazosFiltrar.ItemIndex > 0 then
   begin
      qyTipoPrazosFiltro.GotoBookmark(Pointer(comboBoxTipoPrazosFiltrar.Items.Objects[comboBoxTipoPrazosFiltrar.ItemIndex]));
      qyPrazos.SQL.Add(' AND dp.cd_tipo_prazo = '+qyTipoPrazosFiltro.FieldByName('cd_tipo_prazo').AsString);
   end;

   //Verifica se deve filtrar por Curso / Turma / Disciplina
   if (Length(txtPCurso.Text) > 0) or (Length(txtPTurma.Text) > 0) or (Length(txtPDisciplina.Text) > 0) then
   begin
      //Prepara SQL para ver os códigos dos prazos filtrados por curso, turma, disciplina
      qyPrazosTurmasFiltro.SQL.Clear;
      qyPrazosTurmasFiltro.SQL.Text := 'SELECT DISTINCT cd_prazo as cd_prazo FROM dia_prazos_turmas WHERE ';
      qyPrazosTurmasFiltro.SQL.Add(' nr_anosemestre = ' + txtAnoSemestreFiltro.Text);

      if (Length(txtPCurso.Text) > 0) then
      begin
         qyPrazosTurmasFiltro.SQL.Add(' AND cd_curso LIKE ' + QuotedStr(txtPCurso.Text));
      end;

      if (Length(txtPTurma.Text) > 0) then
      begin
         qyPrazosTurmasFiltro.SQL.Add(' AND cd_turma LIKE ' + QuotedStr(txtPTurma.Text));
      end;
      
      if (Length(txtPDisciplina.Text) > 0) then
      begin
         qyPrazosTurmasFiltro.SQL.Add(' AND cd_disciplina LIKE ' + QuotedStr(txtPDisciplina.Text));
      end;

      qyPrazosTurmasFiltro.SQL.Add(' GROUP BY cd_prazo ');

      strCdPrazos := '';

      { Monta com vários OR os códigos de prazos que se encaixam no filtro de
        turma / curso / disciplina, pois o BDE não está permitindo utilizar a
        sintaxe IN nesse select }
      qyPrazosTurmasFiltro.Open;
      
      while not qyPrazosTurmasFiltro.Eof do
      begin
         if Length(strCdPrazos) = 0 then
            strCdPrazos := ' dp.cd_prazo = ' + qyPrazosTurmasFiltro.FieldByName('cd_prazo').AsString
         else
            strCdPrazos := strCdPrazos + ' OR dp.cd_prazo = ' + qyPrazosTurmasFiltro.FieldByName('cd_prazo').AsString;

         qyPrazosTurmasFiltro.Next;
      end;

      qyPrazosTurmasFiltro.Close;

      if Length(strCdPrazos) > 0 then
         qyPrazos.SQL.Add(' AND ( '+strCdPrazos+' ) ')
      else
         qyPrazos.SQL.Add(' AND ( dp.cd_prazo = -1 ) ');

   end;

   qyPrazos.SQL.Add('      GROUP BY dp.cd_prazo');

   //Filtra a ordenação pelas colunas selecionadas na grid
   if (Length(colunaOrdenacao) > 0) then
   begin
      qyPrazos.SQL.Add(' ORDER BY '+colunaOrdenacao);
   end else begin
      qyPrazos.SQL.Add(' ORDER BY cd_prazo DESC');
   end;

   // Atualiza a grid de prazo
   qyPrazos.Close;
   qyPrazos.Open;
end;

procedure TfDiario_Prazos_Novo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfDiario_Prazos_Novo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {Configura as teclas de atalho}
   case key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btnInserir.Enabled then btnInserirClick( nil );
      VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
      VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
      VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
      VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
   end;
end;

procedure TfDiario_Prazos_Novo.FormShow(Sender: TObject);
begin
   //Seta ano/semestre atual para o filtro e cadastro
   if DM.UsaAnosemestre then
   begin
      txtAnoSemestre.text := IntToStr(DM.GetAnoSemestreAtual);
      txtAnoSemestreFiltro.Text := IntToStr(DM.GetAnoSemestreAtual);
   end
   else
   begin
      txtAnoSemestre.text := IntToStr(ANOSEMESTRE_PADRAO);
      txtAnoSemestreFiltro.Text := IntToStr(ANOSEMESTRE_PADRAO);
   end;

   Label5.Visible := DM.UsaAnosemestre;
   label1.Visible := DM.UsaAnosemestre;
   txtAnoSemestre.Visible := DM.UsaAnosemestre;
   txtAnoSemestreFiltro.Visible := DM.UsaAnosemestre;
   UpDown1.Visible := DM.UsaAnosemestre;
   UpDown2.Visible := DM.UsaAnosemestre;
   DM.BloquearComponenteAnosemestre(grdPrazos, 'NR_ANOSEMESTRE');

   qyPrazos.Close;

   qyPrazos.SQL.Text := ' SELECT ';
   qyPrazos.SQL.Add('   dp.* ');
   qyPrazos.SQL.Add(' FROM ');
   qyPrazos.SQL.Add('   dia_prazos dp ');
   qyPrazos.SQL.Add(' LEFT JOIN dia_prazos_turmas dpt ON(dpt.CD_PRAZO = dp.CD_PRAZO AND dpt.NR_ANOSEMESTRE = dp.NR_ANOSEMESTRE) ');
   qyPrazos.SQL.Add(' LEFT JOIN turmas t ON(t.codigo = dpt.CD_TURMA and t.anosemestre = dpt.NR_ANOSEMESTRE) ');
   qyPrazos.SQL.Add(' WHERE ');
   qyPrazos.SQL.Add('   dp.nr_anosemestre = :nr_anosemestre ');
   qyPrazos.SQL.Add('   AND (t.cd_coligada IN ( '+DM.UsuarioLogado.GetColigadasFilhaSelecionada+' )  OR t.cd_coligada is NULL) ');
   qyPrazos.SQL.Add(' GROUP BY dp.cd_prazo');
   qyPrazos.SQL.Add(' ORDER BY ');
   qyPrazos.SQL.Add('   dp.cd_prazo DESC ');

   qyPrazos.ParamByName('nr_anosemestre').AsInteger := DM.GetAnoSemestreAtual;

   qyPrazos.Open;

   //preenche a combobox de filtro com os tipos de prazos
   qyTipoPrazosFiltro.Open;
   comboBoxTipoPrazosFiltrar.AddItem('Todos', nil);
   qyTipoPrazosFiltro.Close;
   qyTipoPrazosFiltro.Open;
   while not qyTipoPrazosFiltro.Eof do
   begin
      comboBoxTipoPrazosFiltrar.AddItem(qyTipoPrazosFiltro.FieldByName('DS_TIPO_PRAZO').AsString, qyTipoPrazosFiltro.GetBookmark);
      qyTipoPrazosFiltro.Next;
   end;
   comboBoxTipoPrazosFiltrar.ItemIndex := 0;

   // Cria a tela de vinculação de cursos/turmas/disciplinas aos prazos
   f_vincular_cursos_turmas_disc := Tf_vincular_cursos_turmas_disc.Create( self );

end;

procedure TfDiario_Prazos_Novo.grdPrazosDblClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1024, npEspecial, True ) then Exit;

   // Abre a janela para vincular cursos, turmas e disciplinas
   f_vincular_cursos_turmas_disc := Tf_vincular_cursos_turmas_disc.Create( self );
   f_vincular_cursos_turmas_disc.ShowModal();
end;

procedure TfDiario_Prazos_Novo.grdPrazosTitleClick(Column: TColumn);
begin
   { grava a ordenação das colunas }
   if (column.Field.FieldKind = fkData) then
   begin
      if (Pos(column.FieldName, colunaOrdenacao) > 0) then
      begin
         if (Pos('ASC', colunaOrdenacao) > 0) then
         begin
            colunaOrdenacao := column.FieldName + ' DESC';
         end else begin
            colunaOrdenacao := '';
         end;
      end else begin
         colunaOrdenacao := column.FieldName + ' ASC';
      end;

      //Arrumar o order do SQL e arrumar os negritos das colunas
      Filtrar;
   end;
   
end;



procedure TfDiario_Prazos_Novo.habilitarPrazos(habilitar: boolean;
  labelHabilitado: array of TLabel; campoHabilitado: array of TDBEdit);
var
   i : integer;  
begin
   {habilita ou desabilita as datas para serem digitadas de acordo com a opção
    selecionada na combo de tipo de prazo }

   { Prazo da etapa }
   Label6.Enabled := habilitar;
   DBEdit1.Enabled := habilitar;

   Label7.Enabled := habilitar;
   DBEdit2.Enabled := habilitar;

   { Prazo da frequencia }
   Label8.Enabled := habilitar;
   DBEdit3.Enabled := habilitar;

   Label9.Enabled := habilitar;
   DBEdit4.Enabled := habilitar;

   { Prazo das notas }
   Label10.Enabled := habilitar;
   DBEdit5.Enabled := habilitar;

   Label11.Enabled := habilitar;
   DBEdit6.Enabled := habilitar;

   { Prazo da liberacao RE}
   Label16.Enabled := habilitar;
   DBEdit8.Enabled := habilitar;

   { Prazo da liberacao }
   Label15.Enabled := habilitar;
   DBEdit7.Enabled := habilitar;

   { Prazo da liberacao NP }
   Label17.Enabled := habilitar;
   DBEdit9.Enabled := habilitar;

   {Mantém habilitados somente o campo e label passados por parametro}
   if not habilitar then
   begin
      for i := Low(labelHabilitado) to High(labelHabilitado) do
      begin
         TLabel(labelHabilitado[i]).Enabled := true;
      end;
      
      for i := Low(campoHabilitado) to High(campoHabilitado) do
      begin
         TDBEdit(campoHabilitado[i]).Enabled := true;
      end;
   end;
end;

procedure TfDiario_Prazos_Novo.InserirPrazo();
begin
   // Se nenhuma disciplina esta em mais de um tipo de prazo, insere o prazo
   qyPrazos.Post;

   // Atualiza a grid de prazo
   Filtrar;
end;

procedure TfDiario_Prazos_Novo.qyPrazosBeforePost(DataSet: TDataSet);
var
   strMensagem: String;
   strMensagemCompara: String;
begin
   qyPrazosNR_ANOSEMESTRE.AsString := txtAnoSemestre.Text;

   strMensagem := '';
   strMensagemCompara := '';

   if qyPrazosDT_FIM_ETAPA.AsDateTime < qyPrazosDT_INICIO_ETAPA.AsDateTime then
   begin
      strMensagem := strMensagem + '- Período da Etapa ' + #13;
   end;

   if qyPrazosDT_FIM_FREQUENCIA.AsDateTime < qyPrazosDT_INICIO_FREQUENCIA.AsDateTime then
   begin
      strMensagem := strMensagem + '- Prazo de Envio de Aulas e Frequência ' + #13;
   end;

   if qyPrazosDT_FIM_NOTAS.AsDateTime < qyPrazosDT_INICIO_NOTAS.AsDateTime then
   begin
      strMensagem := strMensagem + '- Prazo de Envio de Avaliações e Notas ' + #13;   
   end;

   if ( qyPrazosDT_LIBERACAO.AsDateTime < qyPrazosDT_LIBERACAO_RE.AsDateTime   ) then
   begin
      strMensagemCompara := strMensagemCompara + 'O prazo de liberação dos resultados não pode ser menor que o prazo de liberação da RE';
   end;

   if ( qyPrazosDT_LIBERACAO_RE.AsDateTime < qyPrazosDT_LIBERACAO_NP.AsDateTime  ) then
   begin
      strMensagemCompara := strMensagemCompara + 'O prazo de liberação da RE não pode ser menor que o prazo de liberação da nota do professor';
   end;

   if strMensagem <> '' then
   begin
      Mensagem('As seguintes datas finais são inferiores as suas respectivas datas de início: '+ #13 + strMensagem, Application.Title, MB_OK + MB_ICONSTOP, Handle);
      Abort;
   end;

   if (strMensagemCompara <> '') then
   begin
      Mensagem(strMensagemCompara, Application.Title, MB_OK + MB_ICONSTOP, Handle);
      Abort;
   end;
end;

procedure TfDiario_Prazos_Novo.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(txtAnoSemestreFiltro.Text));

  if resultado_filtro.filtrado then
  Begin
     txtAnoSemestreFiltro.Text := IntToStr( resultado_filtro.nr_anosemestre );

     txtPCurso.Text := resultado_filtro.cd_curso;
     txtPTurma.Text := '';
     txtPDisciplina.Text := '';
  end;
end;

procedure TfDiario_Prazos_Novo.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }

   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre], StrToInt(txtAnoSemestreFiltro.Text));

   if not resultado_filtro.filtrado then Exit;

   txtPCurso.Text := resultado_filtro.cd_curso;
   txtPTurma.Text := resultado_filtro.cd_turma;
end;

procedure TfDiario_Prazos_Novo.SpeedButton3Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], '', StrToInt(txtAnoSemestreFiltro.Text));

   if not resultado_filtro.filtrado then Exit;


   txtPDisciplina.Text := IntToStr( resultado_filtro.cd_disciplina );
   txtPCurso.Text := resultado_filtro.cd_curso;
end;

procedure TfDiario_Prazos_Novo.txtAnoSemestreChange(Sender: TObject);
begin
  txtAnoSemestreFiltro.Text := txtAnoSemestre.text;
end;

procedure TfDiario_Prazos_Novo.checaLimpar(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_DELETE) or (Key = VK_BACK) then begin
      TEdit(Sender).Text := '';
      if (Pos('Curso', TEDit(Sender).Name) > 0) then begin
         txtPCurso.Text := '';
         txtPTurma.Text := '';
         txtPDisciplina.Text := '';
      end;
      if (Pos('Turma', TEDit(Sender).Name) > 0) then begin
         txtPTurma.Text := '';
      end;
      if (Pos('Disciplina', TEDit(Sender).Name) > 0) then begin
         txtPDisciplina.Text := '';
      end;
   end;
end;

procedure TfDiario_Prazos_Novo.DBEdit7Exit(Sender: TObject);
begin
   if ((DBEdit8.Enabled) and (qyPrazos.State in [dsInsert,dsEdit])) then
   begin
      if ( qyPrazosDT_LIBERACAO.AsDateTime < qyPrazosDT_LIBERACAO_RE.AsDateTime ) then
      begin
         Mensagem('O prazo de liberação dos resultados não pode ser menor que o prazo de liberação da RE.', Application.Title, MB_OK, Handle );
         DBEdit7.SetFocus;
         exit;
      end;
   end;
end;

procedure TfDiario_Prazos_Novo.DBEdit8Exit(Sender: TObject);
begin
   if ( qyPrazosDT_LIBERACAO_RE.AsString = '') then
   begin
      exit;
   end;

   if (qyPrazos.State in [dsInsert,dsEdit]) then
   begin
      if ( qyPrazosDT_LIBERACAO_RE.AsDateTime < qyPrazosDT_LIBERACAO_NP.AsDateTime  ) then
      begin
         Mensagem('O prazo de liberação da RE não pode ser menor que o prazo de liberação da nota do professor.', Application.Title, MB_OK, Handle );
         DBEdit8.SetFocus;
         exit;
      end;

      qyPrazosDT_LIBERACAO.AsString := qyPrazosDT_LIBERACAO_RE.AsString;
   end;
end;

procedure TfDiario_Prazos_Novo.DBEdit9Exit(Sender: TObject);
begin
   if ( qyPrazosDT_LIBERACAO_NP.AsString = '') then
   begin
      exit;
   end;

   if (qyPrazos.State in [dsInsert,dsEdit]) then
   begin
      if (DBEdit8.Enabled) then
      begin
         qyPrazosDT_LIBERACAO_RE.AsString := qyPrazosDT_LIBERACAO_NP.AsString;
      end;

      qyPrazosDT_LIBERACAO.AsString := qyPrazosDT_LIBERACAO_NP.AsString;
   end;
end;

procedure TfDiario_Prazos_Novo.UpDown0Click(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

end;

procedure TfDiario_Prazos_Novo.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestreFiltro.text := DM.incrementar_ano_semestre(txtAnoSemestreFiltro.Text);
  end
  else
  begin
    txtAnoSemestreFiltro.text := DM.decrementar_ano_semestre(txtAnoSemestreFiltro.Text);
  end;
end;

end.
