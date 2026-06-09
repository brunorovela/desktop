unit uInserirFiltros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, Buttons, ComCtrls, Mask, CheckLst, Contnrs,
  uColigada, Menus,DBTables, ToolWin, DBCtrls, VirtualTrees ;

type
  TfrmInserirFiltros = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    gridInserirFiltros: TDBGrid;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    qryFiltros: TUMZQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    chkHabilitarAnoSemestre: TCheckBox;
    btnFiltroUnidade: TSpeedButton;
    btnFiltroTurma: TSpeedButton;
    btnCurso: TSpeedButton;
    btnFiltrar: TBitBtn;
    btnLimparFiltros: TBitBtn;
    btnFechar: TBitBtn;
    btnIncluir: TBitBtn;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    ckbSituacoes: TCheckListBox;
    lblSituacao: TLabel;
    dtsFiltros: TDataSource;
    qryFiltroscoligada: TStringField;
    qryFiltrosDEPARTAMENTO: TStringField;
    qryFiltrosCURSO: TStringField;
    qryFiltrosTURMA: TStringField;
    qryFiltrosQTD_ALUNOS: TLargeintField;
    qryFiltrosANOSEMESTRE: TSmallintField;
    qryFiltrosCD_COLIGADA: TIntegerField;
    qryFiltrosCD_DEPARTAMENTO: TIntegerField;
    qryFiltrosCD_CURSO: TStringField;
    btnLimparUnidade: TSpeedButton;
    btnLimparTurma: TSpeedButton;
    btnLimparDepartamento: TSpeedButton;
    btnLimparCurso: TSpeedButton;
    txtUnidade: TEdit;
    txtTurma: TEdit;
    txtDepartamento: TEdit;
    txtCurso: TEdit;
    qryFiltrosCD_SITUACAO: TIntegerField;
    SpeedButton1: TSpeedButton;
    qryCand_filtros: TUMZQuery;
    qryFiltrosds_situacao: TStringField;
    sbCheckAll: TSpeedButton;
    sbUncheckAll: TSpeedButton;
    procedure sbUncheckAllClick(Sender: TObject);
    procedure sbCheckAllClick(Sender: TObject);
    procedure gridInserirFiltrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure gridInserirFiltrosKeyPress(Sender: TObject; var Key: Char);

    procedure btnLimparDepartamentoClick(Sender: TObject);
    procedure btnLimparCursoClick(Sender: TObject);
    procedure BtnLimparUnidadeClick(Sender: TObject);
    procedure btnLimparTurmaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnFiltroUnidadeClick(Sender: TObject);
    procedure btnFiltroTurmaClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure chkHabilitarAnoSemestreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);

  private
     coligada_filtrada : TColigada;
  public
    { Public declarations }
  end;

var
  frmInserirFiltros  : TfrmInserirFiltros;
  objTree: TVirtualStringTree;

implementation

uses
   uDM, General ,uItemCombo, uUsuario, uIUMDataModule, uFSelecionarColigada, uFSelecionarGrupo,
   uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarDepartamento,
   uFSelecionarPessoa, uCarregaCursosFiltro, uImportarDados;

{$R *.dfm}

procedure TfrmInserirFiltros.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   // Tela de filtro de curso Padrão Unimestre
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(txtAnoSemestre.Text));

   // Seta o valor do Filtro no campo curso
   txtCurso.Text := resultado_filtro.ds_curso;
end;



procedure TfrmInserirFiltros.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmInserirFiltros.btnFiltrarClick(Sender: TObject);
var
   filtro_anosemestre, filtro_curso,
   filtro_turma, filtro_unidade,
   filtro_departamento, ds_condicoes_sql,
   filtro_situacao : String;
   i, cd_situacao: integer;
   primeiro_checado : boolean;
begin
   // Iniciliza As variaveis
   primeiro_checado:= false;
   
   filtro_unidade       := txtUnidade.Text;
   filtro_anosemestre   := txtAnosemestre.Text;
   filtro_departamento  := txtDepartamento.Text;
   filtro_curso         := txtCurso.Text;
   filtro_turma         := txtTurma.Text;
    
   // For que verifica as situações que o usuário marcou p/ o filtro
   for i := 0 to ckbSituacoes.Items.Count-1 do
   begin
      if ( ckbSituacoes.Checked[i] ) then
      begin
         if (primeiro_checado = false) then
         begin
            primeiro_checado := true;
         end
         else
         begin
            filtro_situacao := filtro_situacao + ',';
         end;
         cd_situacao := StrToInt(TItemCombo(ckbSituacoes.Items.Objects[i]).getCodigo());

         // Concatena para ser utilizado no SQL de Filtro ABAIXO
         filtro_situacao := ( filtro_situacao + IntToStr(cd_situacao) );
      end;
   end;

   with qryFiltros do
   Begin
      Close();
      SQL.Clear();

      // SQL RESPONSAVEL PELO FILTRO
      SQL.Add( ''                           +
      ' SELECT '                            +
        ' c.cd_coligada cd_coligada, '      +
        ' c.nm_COLIGADA coligada, '         +
        ' d.codigo cd_departamento, '       +
        ' d.razaosocial departamento, '     +
        ' cm.CD_CURSO cd_curso, '           +
        ' cm.DS_CURSO curso, '              +
        ' m.situacao cd_situacao, '           +   
        ' CONCAT(st.ds_situacao," - ", st.ds_sigla_situacao ) ds_situacao, ' +
        ' m.turma turma, '                  +
        ' m.anosemestre anosemestre,'       +
        ' COUNT(m.codigoaluno) qtd_alunos'  +
      ' FROM '                              +
      ' matriculas m '                      +
      ' INNER JOIN turmas t ON ( '          +
        ' t.anosemestre = m.anosemestre '   +
        ' AND t.codigo = m.turma '          +
        ' AND t.curso = m.curso '           +
      ') '                                  +
      ' INNER JOIN cursos_coligadas cc ON ( '     +
      '   cc.CD_CURSO = m.curso '                 +
      '   AND cc.CD_COLIGADA = t.cd_coligada '    +
      ') '                                        +
      ' INNER JOIN coligadas c ON ('              +
      '   c.CD_COLIGADA = CC.cd_coligada '        +
      ') '                                        +
      '  INNER JOIN situacao st ON ( m.situacao = st.cd_situacao ) ' +
      '  INNER JOIN departamentos d ON (d.codigo = cc.CD_DEPTO) '    +
      '  INNER JOIN cursos_mestre cm ON (cm.CD_CURSO = m.curso) ' );

      ds_condicoes_sql := ' WHERE ';

      // filtro Unidade(Coligada)
      if ( Trim( filtro_unidade ) <> '' ) then
      begin
        SQL.Add( ds_condicoes_sql );
        SQL.Add( ' c.nm_COLIGADA LIKE "%' + filtro_unidade   +'%" ' );
        ds_condicoes_sql := ' AND ';
      end;

      // filtro Ano Semestre
      if ( Trim( filtro_anosemestre ) <> '') AND ( txtAnoSemestre.Enabled = True ) then
      begin
        SQL.Add( ds_condicoes_sql );
        SQL.Add( ' m.anosemestre = ' + filtro_anosemestre );
        ds_condicoes_sql := ' AND ';
      end;

      // filtro Curso
      if ( Trim(filtro_curso) <> '' ) then
      begin
        SQL.Add( ds_condicoes_sql );

        SQL.Add(
            ' cm.ds_curso LIKE "%'
            + filtro_curso
            +'%" '
        );

        ds_condicoes_sql := ' AND ';
      end;

      // filtro Turma
      if ( Trim( filtro_turma ) <> '' ) then
      begin
        SQL.Add( ds_condicoes_sql );

        SQL.Add(
            ' m.turma LIKE "%'
            + filtro_turma
            +'%" '
        );
        
        ds_condicoes_sql := ' AND ';
      end;

       // filtro departamento
      if ( filtro_departamento <> '' ) then
      begin
        SQL.Add( ds_condicoes_sql );

        SQL.Add(
             ' d.descricao = "'
             + filtro_departamento
             + '"'
        );

        ds_condicoes_sql := ' AND ';
      end;

      // filtro situacao
      if ( filtro_situacao <> '' ) then
      begin
        SQL.Add( ds_condicoes_sql );

        SQL.Add(
          ' m.situacao IN ( '
          + filtro_situacao
          + ' )'
        );

        ds_condicoes_sql := ' AND ';
      end;

      SQL.Add(
         ' GROUP BY '
         + '  m.turma,'
         + '  m.situacao '
         + ' ,m.anosemestre'
      );
      Open(); 
   end;
end;

procedure TfrmInserirFiltros.btnFiltroTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar(
      [],
      -1,
      -1,
      -1,
      '' 
   );
   // Seta o resultado da filtro no CAMPO
   txtTurma.Text := resultado_filtro.cd_turma;
end;

procedure TfrmInserirFiltros.btnFiltroUnidadeClick(Sender: TObject);
begin
   // Filtro da Unidade
   if TfrmSelecionarColigada.ShowModal( '', '' ) then
   begin
      coligada_filtrada := TfrmSelecionarColigada.getResultado();
      txtUnidade.Text   := coligada_filtrada.Nome;
   end;
end;

procedure TfrmInserirFiltros.btnIncluirClick(Sender: TObject);
var
   i,cd_situacao    : integer;
   qryInsertFiltros : TUMZQuery;
   primeiro_checado : boolean;
   condicao_insert, sn_utiliza_virgula  : String;
begin
   // Inicializa as variaveis
   btnIncluir.Enabled := False;
   i := 0;
   cd_situacao := 0;
   primeiro_checado := false;
   condicao_insert := '';
   // cria consulta
   DM.CriarConsulta(qryInsertFiltros);
   
   // Adiciona a virgula depois de cada valor, exceto o último
   condicao_insert := StringReplace(
      condicao_insert,
      '][',
      '],[',
      [rfReplaceAll]
   );

   // SQL Responsavel por inserir os filtros na tabela CAND_FILTROS
   qryInsertFiltros.SQL.Text := '' +
   'INSERT INTO cand_filtros ( '   +
      '  cd_filtro, '           +
      '  cd_coligada, '        +
      '	cd_departamento,    ' +
      '	nr_anosemestre ,    ' +
      '	cd_curso ,          ' +
      '	cd_turma ,          ' +
      '	ds_situacoes ,      ' +
      '	nr_total_alunos  )  ' +
   ' VALUES ( ' +
      '  NULL, ' +
      '  :cd_coligada, '       +
      '	:cd_departamento,   ' +
      '	:nr_anosemestre ,   ' +
      '	:cd_curso ,         ' +
      '	:cd_turma ,         ' +
      '	:ds_situacoes ,     ' +
      '	:nr_total_alunos  ) ' ;


   if ( gridInserirFiltros.SelectedRows.Count > 0 ) then
   begin
      with dtsFiltros.DataSet, gridInserirFiltros do
      begin
         for i := 0 to gridInserirFiltros.SelectedRows.Count - 1 do
         begin
         qryCand_filtros.Close;
         qryCand_filtros.Open;
            GotoBookmark(Pointer(SelectedRows.Items[i]));
            if NOT qryCand_filtros.Locate(
               'cd_coligada;nr_anosemestre;cd_curso;cd_turma;nr_total_alunos',
               VarArrayOf( [
                  qryFiltrosCD_COLIGADA.AsString,
                  qryFiltrosANOSEMESTRE.AsString,
                  qryFiltrosCD_CURSO.AsString,
                  qryFiltrosTURMA.AsString,
                  qryFiltrosQTD_ALUNOS.AsString
               ]),
               [loPartialKey, loCaseinsensitive]
            ) then
            Begin
               qryInsertFiltros.ParamByName('cd_coligada').AsString     := qryFiltrosCD_COLIGADA.AsString;
               qryInsertFiltros.ParamByName('cd_departamento').AsString := qryFiltrosCD_DEPARTAMENTO.AsString;
               qryInsertFiltros.ParamByName('nr_anosemestre').AsString  := qryFiltrosANOSEMESTRE.AsString;
               qryInsertFiltros.ParamByName('cd_curso').AsString        := qryFiltrosCD_CURSO.AsString;
               qryInsertFiltros.ParamByName('cd_turma').AsString        := qryFiltrosTURMA.AsString;
               qryInsertFiltros.ParamByName('ds_situacoes').AsString    := qryFiltrosCD_SITUACAO.AsString;
               qryInsertFiltros.ParamByName('nr_total_alunos').AsString := qryFiltrosQTD_ALUNOS.AsString;
               qryInsertFiltros.ExecSQL();
            end;
         end;
      end;
   end;
   if ( gridInserirFiltros.SelectedRows.Count = 0 ) then
   begin
      Mensagem('Nenhuma item selecionado para inserção!');
      Exit;
   end;

   Mensagem('Filtros inseridos com sucesso!');
   btnIncluir.Enabled := True;

   // Atualiza a o Componente VSTCURSOS (VirtualStringTree)
   uImportarDados.frmImportarDados.vstCursos.Clear;
   criarRegistro( uImportarDados.frmImportarDados.vstCursos );
end;

procedure TfrmInserirFiltros.btnLimparCursoClick(Sender: TObject);
begin
   txtCurso.Clear();
end;

procedure TfrmInserirFiltros.btnLimparDepartamentoClick(Sender: TObject);
begin
   txtDepartamento.Clear();
end;

procedure TfrmInserirFiltros.btnLimparFiltrosClick(Sender: TObject);
var
   i : integer;
begin
   i := 0;

   txtUnidade.Clear;
   txtTurma.Clear;
   txtCurso.Clear;
   txtDepartamento.Clear;

   for i := 0 to ckbSituacoes.Items.Count - 1 do
   begin
      ckbSituacoes.Checked[i] := FALSE;
   end;
end;

procedure TfrmInserirFiltros.btnLimparTurmaClick(Sender: TObject);
begin
   txtTurma.Clear();
end;

procedure TfrmInserirFiltros.BtnLimparUnidadeClick(Sender: TObject);
begin
   txtUnidade.Clear();
end;


procedure TfrmInserirFiltros.chkHabilitarAnoSemestreClick(Sender: TObject);
begin
   if ( chkHabilitarAnoSemestre.Checked = True ) then
   begin
      txtAnoSemestre.Enabled := True;
      UpDown2.Enabled := True;
   end
   else
   begin
      txtAnoSemestre.Enabled := False;
      UpDown2.Enabled := False;
   end;
end;



procedure TfrmInserirFiltros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
   case Key of
      VK_F2: begin
         btnIncluirClick(nil);
      end;
      VK_F8: begin
         btnFiltrarClick(nil);
      end;
      VK_F12 : begin
         Close();
      end;
  end;
end;

procedure TfrmInserirFiltros.FormShow(Sender: TObject);
var
   qyListaSituacoes : TUMZQuery;
   i : integer;
begin
   txtAnoSemestre.Text := IntToStr(DM.GetAnoSemestreAtual);
   txtUnidade.Clear;
   txtTurma.Clear;
   txtCurso.Clear;
   txtDepartamento.Clear;
   chkHabilitarAnoSemestre.Checked := True;
   txtAnoSemestre.Enabled := True;
   UpDown2.Enabled := True;
   i := 0;

   //Cria a consulta
   DM.CriarConsulta(qyListaSituacoes);
   qyListaSituacoes.Close();

   // atribui o SQL que será executado
   qyListaSituacoes.SQL.Add(
      'SELECT '
      +   ' cd_situacao, '
      +   ' ds_situacao, '
      +   ' ds_sigla_situacao '
      + ' FROM '
      +  ' situacao '
      + ' WHERE '
      +  ' cd_situacao >= 0 '
      +' ORDER BY ds_situacao '
   );
   qyListaSituacoes.Open();

   // Neste WHILE, são listadas as situações que usuário usará p/ os filtros
   while NOT ( qyListaSituacoes.Eof ) do
   begin
      i := ckbSituacoes.Items.AddObject(
               qyListaSituacoes.FieldByName( 'ds_situacao' ).AsString  +
               ' - ' +
               qyListaSituacoes.FieldByName( 'ds_sigla_situacao' ).AsString,
               TItemCombo.Create(
                  qyListaSituacoes.FieldByName( 'cd_situacao' ).AsString,
                  qyListaSituacoes.FieldByName( 'ds_situacao' ).AsString
               )
           );
      ckbSituacoes.Checked[i] := False;

      qyListaSituacoes.Next();
   end;
end;

procedure TfrmInserirFiltros.gridInserirFiltrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   {
      DESABILITA O CTRL + DEL DA GRID -> ESTA COMBINAÇÃO APAGA O REGISTRO
      SELECIONADO NA GRID
   }
   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;
end;

procedure TfrmInserirFiltros.gridInserirFiltrosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #1 then
   begin
      // seleciona todo mundo
      qryFiltros.First;
      while not qryFiltros.Eof do
      begin
         gridInserirFiltros.SelectedRows.CurrentRowSelected := True;
         qryFiltros.Next;
      end;
   end;
end;

procedure TfrmInserirFiltros.sbCheckAllClick(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to ckbSituacoes.Count - 1 do
   begin
      ckbSituacoes.Checked[i] := True;
   end;
end;

procedure TfrmInserirFiltros.sbUncheckAllClick(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to ckbSituacoes.Count - 1 do
   begin
      ckbSituacoes.Checked[i] := False;
   end;
end;

procedure TfrmInserirFiltros.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   // Adicionar todos os cursos ao departamento selcionado

   // Seta como ano/semestre dos departamentos o ano/semestre da regra de prazo que está cadastrado
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

   txtDepartamento.Text := resultado_filtro.ds_departamento ;
end;

procedure TfrmInserirFiltros.UpDown2Click(Sender: TObject; Button: TUDBtnType);
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

end.
