unit urelatorios_financeiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, ZConnection, StdCtrls, Mask, DateUtils,
  Menus, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, UMComboBox;

type
  Tfrm_relatorios_financeiros = class(TForm)
    Bevel4: TBevel;
    Panel3: TPanel;
    pnDados: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    Bevel6: TBevel;
    pnDigitacao: TPanel;
    Bevel7: TBevel;
    Tree: TTreeView;
    ImageList1: TImageList;
    qRelatorios: TUMZQuery;
    lblAnoSemestre: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    lblTurma: TLabel;
    lblCurso: TLabel;
    btnCodigoCurso: TSpeedButton;
    btnCodigoTurma: TSpeedButton;
    lblCodigoAluno: TLabel;
    btnCodigoAluno: TSpeedButton;
    txtTurma: TEdit;
    txtCurso: TEdit;
    txtCodigoAluno: TEdit;
    popTurmas: TPopupMenu;
    lbDepartamento: TLabel;
    txtDepartamento: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    lblParcelaInicial: TLabel;
    lblParcelaFinal: TLabel;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    txtParcelaInicial: TEdit;
    txtParcelaFinal: TEdit;
    txtDataInicial: TDateTimePicker;
    txtDataFinal: TDateTimePicker;
    sbPropriedades: TSpeedButton;
    btnFechar: TSpeedButton;
    btnImprimir: TSpeedButton;
    ckDtFiltrar: TCheckBox;
    lblData: TLabel;
    lblContaCaixa: TLabel;
    txtContaCaixa: TEdit;
    btnContaCaixa: TSpeedButton;
    lblGenerico: TLabel;
    txtGenerico: TEdit;
    lbDataBase: TLabel;
    txtDataBase: TDateTimePicker;
    lbtipoTitulo: TLabel;
    txtTipoTitulo: TEdit;
    btnTipoTitulo: TSpeedButton;
    sbPreencherVariaveis: TSpeedButton;
    Label1: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure cbUnidadeEnsinoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPreencherVariaveisClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTipoTituloKeyPress(Sender: TObject; var Key: Char);
    procedure btnTipoTituloClick(Sender: TObject);
    procedure txtDataFinalChange(Sender: TObject);
    procedure btnContaCaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure MyClick(Sender:TObject);
    procedure TreeClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPropriedadesClick(Sender: TObject);
  strict private
    procedure CarregarColigadas();

  private
    { Private declarations }
    Procedure Imprimir_DOS(arquivo : string; sql : string; filtro : string; ordem : string; grupo : string = '');
    Function troca_acendo(valor : string) : string;
  public
    { Public declarations }
    CamposAdicionaisRelatorio: TStringList;

    bDeptoObrigar, bCursoObrigar, bTurmaObrigar, bPessoaObrigar : boolean;

    Function validarCampos : Boolean;
    Function GerarBoleto : Boolean;
  end;

var
  frm_relatorios_financeiros: Tfrm_relatorios_financeiros;

implementation

uses
   uDM, uFSelecionarTurma, uFSelecionarPessoa, Main, uFSelecionarCurso, StrUtils, uDepartamento,
   uFSelecionarDisciplina, uRepBloquetos, Math, MaskUtils, uSelCaixa, uSelTipoTitulo,
   uRelatorios_adicional, uFSelecionarDepartamento, uListaColigadas, uColigada, uImpressaoDOS;

{$R *.DFM}

procedure Tfrm_relatorios_financeiros.FormShow(Sender: TObject);
var
  i:Integer;
  str1: String;
  treeNode : TTreeNode;
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   txtDataInicial.Date := DataHoje;
   txtDataFinal.Date := DataHoje;
   txtDataBase.Date := DataHoje;

   lblAnoSemestre.Visible := DM.UsaAnosemestre;
   txtAnoSemestre.Visible := DM.UsaAnosemestre;
   UpDown1.Visible := DM.UsaAnosemestre;

   txtDepartamento.Clear;
   txtCurso.Clear;
   txtTurma.Clear;
   txtCodigoAluno.Clear;
   txtParcelaInicial.Clear;
   txtParcelaFinal.Clear;
   txtTipoTitulo.Clear;

   CarregarColigadas();

   { Montar o TreeView }
   txtAnoSemestre.text := IntToStr(ano_semestre);

   { Adicionar os Relatório na Árvore }
   qRelatorios.Close;
   qRelatorios.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
//  qRelatorios.SQL.Clear;
//  qRelatorios.SQL.Add(' Select * from Relatorios where ' );
//  qRelatorios.SQL.Add(' sn_disponivel = ''S'' and (');
//  op := '';
//
//  if PasswordDlg.Autorizar( 2011, taAcessar, False ) then
//  Begin
//     qRelatorios.SQL.Add(' cd_modulo = 2 ');
//     op := ' OR ';
//  End;
//
//  if PasswordDlg.Autorizar( 2025, taAcessar, False ) then
//  Begin
//     qRelatorios.SQL.Add( op + ' cd_modulo = 3 ');
//  End;
//
//  qRelatorios.SQL.Add(') Order By ds_grupo, nm_relatorio ');

   qrelatorios.Open;

   Tree.Items.Clear;

   Tree.Items.Add( Tree.TopItem, qRelatorios.FieldByName('ds_Grupo').AsString );

   i := Tree.Items.Count - 1;

   str1 := qRelatorios.FieldByName('ds_grupo').AsString;

   while not qRelatorios.Eof do
   begin

      if qRelatorios.FieldByName('ds_grupo').AsString <> str1 then
      begin
         Tree.Items.Add( Tree.TopItem, qRelatorios.FieldByName('ds_grupo').AsString );
         str1 := qRelatorios.FieldByName('ds_grupo').AsString;
         i := Tree.Items.Count - 1;
      end;

      treeNode := Tree.Items.AddChild( Tree.Items[i], qRelatorios.FieldByName('nm_relatorio').AsString );

      treeNode.ImageIndex := 1;

      qRelatorios.Next;

   end;

   Tree.FullCollapse;

   Application.CreateForm( TfrmRepBloquetos, frmRepBloquetos );
end;


procedure Tfrm_relatorios_financeiros.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  { Incremento do AnoSemestre }

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

end;


function Tfrm_relatorios_financeiros.validarCampos: Boolean;
var
   sMsgValida : String;
   bValidou : boolean;
begin
   bValidou := false;
   result   := false;
   
   sMsgValida := 'O relatório que está sendo impresso utiliza um recurso especial que obriga o preenchimento do(s) seguinte(s) campo(s):'+#13;
   if bDeptoObrigar AND (trim(txtDepartamento.Text) = '')  then begin
      sMsgValida :=  sMsgValida + '-Departamento';
      bValidou   := true;
   end;

   if bCursoObrigar AND (trim(txtCurso.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 +'-Curso';
      bValidou   := true;
   end;

   if bTurmaObrigar AND (trim(txtTurma.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Turma';
      bValidou   := true;
   end;

   if bPessoaObrigar AND (trim(txtCodigoAluno.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Código Aluno';
      bValidou   := true;
   end;

   if bValidou then
   begin
      result := true;
      Mensagem(sMsgValida,'Preenchimento de campos',MB_OK+MB_ICONEXCLAMATION);
   end;   
end;

procedure Tfrm_relatorios_financeiros.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
   curso: String;
   anosemestre: Integer;
begin

   curso := txtCurso.Text;
   anosemestre := StrToInt(txtAnoSemestre.Text);

   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([],
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo,
         StrToIntDef(txtDepartamento.Text, -2)
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([],
         -2,
         StrToIntDef(txtDepartamento.Text, -2)
      );
   end;

   if ( resultado_filtro.filtrado )  and
      ( ( curso <> resultado_filtro.cd_curso ) OR
      ( anosemestre <> resultado_filtro.nr_anosemestre) ) then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      txtDepartamento.Text := IntToStr(resultado_filtro.cd_departamento);
      txtTurma.Text := '';
      DM.LocalizaColigada( cbUnidadeEnsino, resultado_filtro.cd_coligada );
   end;
end;

procedure Tfrm_relatorios_financeiros.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro: TResultadoFiltroTurma;
   curso: String;
begin

   if txtCurso.Text = '' then
   begin
      curso := '-2';
   end
   else
   begin
      curso := txtCurso.Text;
   end;

   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestre.Text),
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo,
         StrToIntDef(txtDepartamento.Text, -2),
         curso
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestre.Text),
         -2,
         StrToIntDef(txtDepartamento.Text, -2),
         curso
      );
   end;

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;

   if txtCurso.Enabled then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
   end;

   if txtDepartamento.Enabled then
   begin
      txtDepartamento.Text := IntToStr(resultado_filtro.cd_departamento);
   end;

   DM.LocalizaColigada(cbUnidadeEnsino, resultado_filtro.cd_coligada);

   txtAnoSemestre.Text := IntToStr(resultado_filtro.nr_anosemestre);
end;

procedure Tfrm_relatorios_financeiros.txtCodigoAlunoExit(Sender: TObject);
  { Ao digitar o Código do Aluno, Mostrar as Turmas }
var
   qyListaMatriculas : TUMZReadOnlyQuery;
Begin
   if txtCodigoAluno.Text = '' then Exit;

   while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

   DM.CriarConsulta(qyListaMatriculas);

   qyListaMatriculas.SQL.Add( 'SELECT cd_pessoa, nm_pessoa , Matriculas.AnoSemestre, ' +
      'Matriculas.Curso, Matriculas.Turma FROM Pessoas LEFT JOIN ' +
      ' Matriculas ON ( Pessoas.cd_pessoa = Matriculas.CodigoAluno ) ' +
      ' WHERE Pessoas.cd_pessoa = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' );
   qyListaMatriculas.SQL.Add( ' order by Matriculas.AnoSemestre' );
   qyListaMatriculas.ParamByName('Codigo').AsInteger := StrToInt( txtCodigoAluno.Text );
   qyListaMatriculas.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   qyListaMatriculas.Open;

   while not qyListaMatriculas.Eof do
   begin
      popTurmas.Items.Add(
         NewItem( qyListaMatriculas.FieldByName('Turma').AsString, 0, False, True, MyClick, 0, '' ) );

      qyListaMatriculas.Next;
   end;

   if popTurmas.Items.Count = 1 then
      txtTurma.Text := qyListaMatriculas.FieldByNAme('Turma').AsString;

   FreeAndNil(qyListaMatriculas);
end;

procedure Tfrm_relatorios_financeiros.txtDataFinalChange(Sender: TObject);
begin
  txtDataBase.Date := txtDataFinal.Date;
end;

procedure Tfrm_relatorios_financeiros.txtTipoTituloKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',',',#8]) then begin
     Key := #0;
   end;
end;

procedure Tfrm_relatorios_financeiros.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;


procedure Tfrm_relatorios_financeiros.TreeClick(Sender: TObject);
var
  xField : String;
  xFormula : String;
begin

  if not qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]) Then
  Begin
      { Não existe o relatório, desabilitar tudo }
      lblAnoSemestre.Enabled := False;
      txtAnoSemestre.Enabled := False;
      UpDown1.Enabled := False;
      lbDepartamento.Enabled := False;
      txtDepartamento.Enabled := False;
      btnCodigoDepartamento.Enabled := False; 
      txtCurso.Enabled := False;
      lblCurso.Enabled := False;
      btnCodigoCurso.Enabled := False;
      txtTurma.Enabled := False;
      lblTurma.Enabled := False;
      btnCodigoTurma.Enabled := False;
      txtCodigoAluno.Enabled := False;
      lblCodigoAluno.Enabled := False;
      btnCodigoAluno.Enabled := False;
      txtParcelaInicial.Enabled := False;
      lblParcelaInicial.Enabled := False;
      txtParcelaFinal.Enabled := False;
      lblParcelaFinal.Enabled := False;
      lblDataInicial.Enabled := False;
      lblDataFinal.Enabled := False;
      txtDataInicial.Enabled := False;
      txtDataFinal.Enabled := False;
      lblGenerico.Enabled := False;
      txtGenerico.Enabled := False;
      lbDataBase.Enabled := False;
      txtDataBase.Enabled := False;

      cbUnidadeEnsino.Enabled := false;
      Label1.Enabled := false;  

      btnImprimir.Enabled := False;
      Exit;
  End;

  btnImprimir.Enabled := True;

  if ((qRelatorios.FieldByName('ds_variaveis').IsNull) or (qRelatorios.FieldByName('ds_variaveis').AsString = '')) then
  begin
    sbPreencherVariaveis.Visible := False;
  end else begin
    CamposAdicionaisRelatorio.Clear;
    sbPreencherVariaveis.Visible := True;
  end;

  xField := lowercase(qRelatorios.FieldByName('ds_parametros').AsString);
  xFormula :=  lowercase(qRelatorios.FieldByName('ds_formula').AsString);

  { Verificar os Parametros que tem que ficar ligados }

  txtAnoSemestre.Enabled := (Pos('anosemestre', xField) > 0) OR (Pos('anosemestre', lowercase(xFormula)) >0 ) OR (Pos('[nr_anosem]', lowercase(xFormula)) >0 );
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;
  UpDown1.Enabled := txtAnoSemestre.Enabled;
  
  txtDepartamento.Enabled := (Pos('depto', xField) > 0) OR (Pos('[cd_depto]', xFormula) > 0);
  lbDepartamento.Enabled := txtDepartamento.Enabled;
  btnCodigoDepartamento.Enabled := txtDepartamento.Enabled;
  bDeptoObrigar := Pos('?.depto', xField) > 0;

  txtCurso.Enabled := (Pos('curso', xField) > 0) OR (Pos('[cd_curso]', xFormula) > 0);
  lblCurso.Enabled := txtCurso.Enabled;
  btnCodigoCurso.Enabled := txtCurso.Enabled;
  bCursoObrigar := Pos('?.curso', xField) > 0;

  txtTurma.Enabled := ( Pos('turma', xField) > 0 ) OR (Pos('[cd_turma]', xFormula) > 0);  
  lblTurma.Enabled := txtTurma.Enabled;
  btnCodigoTurma.Enabled := txtTurma.Enabled;
  bTurmaObrigar := Pos('?.turma', xField) > 0;

  txtCodigoAluno.Enabled := (Pos('codigoaluno', xField) > 0) or (Pos('cd_pessoa', xField) > 0) OR (Pos('[cd_pessoa]', xFormula) > 0);
  lblCodigoAluno.Enabled := txtCodigoAluno.Enabled;
  btnCodigoAluno.Enabled := txtCodigoAluno.Enabled;
  bPessoaObrigar := (Pos('?.codigoaluno', xField) > 0) or (Pos('?.cd_pessoa', xField) > 0);

  txtParcelaInicial.Enabled := (Pos('parcela', xField) > 0) OR (Pos('[nr_parcela_inicio]', xFormula) > 0) OR (Pos('[nr_parcela_fim]', xFormula) > 0);
  lblParcelaInicial.Enabled := txtParcelaInicial.Enabled;
  txtParcelaFinal.Enabled := txtParcelaInicial.Enabled;
  lblParcelaFinal.Enabled := txtParcelaInicial.Enabled;


  txtGenerico.Enabled := (Pos('generic', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) OR (Pos('generic', lowercase(xFormula)) > 0) OR (Pos('[ds_observacao]', xFormula) > 0);
  lblGenerico.Enabled := txtGenerico.Enabled;

  if lblGenerico.Enabled then begin

     if (Pos('generic', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) then begin

        lblGenerico.Caption := Copy(qRelatorios.FieldByName('ds_parametros').AsString, Pos('[', qRelatorios.FieldByName('ds_parametros').AsString) + 1, Pos(']', qRelatorios.FieldByName('ds_parametros').AsString)-Pos('[', qRelatorios.FieldByName('ds_parametros').AsString)-1);

     end else begin

        lblGenerico.Caption := Copy(qRelatorios.FieldByName('ds_formula').AsString, Pos('[', qRelatorios.FieldByName('ds_formula').AsString) + 1, Pos(']', qRelatorios.FieldByName('ds_formula').AsString)-Pos('[', qRelatorios.FieldByName('ds_formula').AsString)-1);

     end;

  end else begin

     lblGenerico.Caption := 'Observações:';

  end;

  cbUnidadeEnsino.Enabled := Pos('.cd_coligada', xField) > 0;
  Label1.Enabled := cbUnidadeEnsino.Enabled;

  txtDataBase.Enabled := (Pos('periodo_base', xField) > 0) OR (Pos('periodo_base', lowercase(xFormula)) >0 );
  lbDataBase.Enabled := txtDataBase.Enabled;

  txtDataInicial.Enabled := (Pos('data', xField) > 0) or (Pos('dt_', xField) > 0) OR (Pos('data', lowercase(xFormula)) >0 ) OR (Pos('dt_', lowercase(xFormula)) >0 );
  lblDataInicial.Enabled := txtDataInicial.Enabled;
  txtDataFinal.Enabled := txtDataInicial.Enabled;
  lblDataFinal.Enabled := txtDataInicial.Enabled;
  ckDtFiltrar.Enabled := txtDataInicial.Enabled;
  ckDtFiltrar.Checked := txtDataInicial.Enabled;
  
  txtContaCaixa.Enabled := (Pos('cd_caixa', xField) > 0) or (Pos('cd_conta_banco', xField) > 0) or (Pos('[cd_caixa]', xFormula) > 0);
  lblContaCaixa.Enabled := txtContaCaixa.Enabled;
  btnContaCaixa.Enabled := txtContaCaixa.Enabled;
  
  txtTipoTitulo.Enabled := ( Pos('cd_tipo_titulo', xField) > 0)  or (Pos('[cd_tipo_titulo]', xFormula) > 0);
  lbtipoTitulo.Enabled := txtTipoTitulo.Enabled;
  btnTipoTitulo.Enabled := txtTipoTitulo.Enabled;

end;


procedure Tfrm_relatorios_financeiros.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_relatorios_financeiros.btnImprimirClick(Sender: TObject);
var
  sArqRelatorio: string;
  sFSelecao: string;
  sFGrupo: string;
  slFormulas: TStringList;
  slOrdem: TStringList;
  pAtual: string;
  pAtual_Aux: string;
  pCampo: string;
  sFiltroShow: string;
  sFiltro: string;
  sAux: string;
  sParametros, S: string;
  wDia, wMes, wAno : Word;
  i: Integer;
  bAux: Boolean;
  iNum: LongInt;
  sSQL : String;
  slSQL : TStringList;
  slSQLExp, SLParametros: TStringList;
  qyDelete : TUMZQuery;
  PodeExportar: Boolean;
  departamento : TDepartamento;
begin

   // Campos passados para o relatório para serem utilizados como comand quando
   // não preenchidos fazem no crystall abrir novamente a tela de preenchimento
   // de filtros. Deste modo foi feita a obrigatoriedade de preenchimento no delphi
   if (validarCampos) then
   begin
      exit;
   end;

   //encotra o registro na arvore
   qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

   //define arquivo
   sArqRelatorio := qRelatorios.FieldByName('nm_arquivo').AsString;
   if (Trim(sArqRelatorio) = '') then begin
      Mensagem('O Relatório não foi selecionado ou é inválido!', '', mrOk);
      Exit;
   end;

   if qRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 1 then
      PodeExportar := True
   else if qRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 0 then
      PodeExportar := False;
   

   sArqRelatorio := sArqRelatorio + '.rpt';

   // Adiciona os parâmetros dinâmicos para filtrar no relatório

   SLParametros := TStringList.Create;

   if txtAnoSemestre.Enabled then
   begin
      SLParametros.Values['.anosemestre'] := txtAnoSemestre.Text;
   end;

   if txtDepartamento.Enabled and (txtDepartamento.Text <> '') then
   begin
      SLParametros.Values['.depto'] := txtDepartamento.Text;
   end;

   if txtCurso.Enabled and (txtCurso.Text <> '') then
   begin
      SLParametros.Values['.curso'] := txtCurso.Text;
   end;

   if txtTurma.Enabled and (txtTurma.Text <> '') then
   begin
      SLParametros.Values['.turma'] := txtTurma.Text;
   end;

   if txtCodigoAluno.Enabled and (txtCodigoAluno.Text <> '') then
   begin
      SLParametros.Values['.cd_pessoa'] := txtCodigoAluno.Text;
   end;

   if txtParcelaInicial.Enabled and (txtParcelaInicial.Text <> '') then
   begin
      SLParametros.Values['.parcelaInicio'] := txtParcelaInicial.Text;
      SLParametros.Values['.parcela'] := txtParcelaInicial.Text;
   end;

   if txtParcelaFinal.Enabled and (txtParcelaFinal.Text <> '') then
   begin
      SLParametros.Values['.parcelaFim'] := txtParcelaFinal.Text;
   end;

   if txtContaCaixa.Enabled and (txtContaCaixa.Text <> '') then
   begin
      SLParametros.Values['.cd_caixa'] := txtContaCaixa.Text;
   end;

   if txtTipoTitulo.Enabled and (txtTipoTitulo.Text <> '') then
   begin
      SLParametros.Values['.cd_tipo_titulo'] := txtTipoTitulo.Text;
   end;

   if ckDtFiltrar.Checked then
   begin
      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(txtDataInicial.Date),
         MonthOf(txtDataInicial.Date),
         DayOf(txtDataInicial.Date),
         HourOf(txtDataInicial.DateTime),
         MinuteOf(txtDataInicial.DateTime),
         SecondOf(txtDataInicial.DateTime)
      ]);
      SLParametros.Values['.dataInicio'] := S;

      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(txtDataFinal.Date),
         MonthOf(txtDataFinal.Date),
         DayOf(txtDataFinal.Date),
         HourOf(txtDataFinal.DateTime),
         MinuteOf(txtDataFinal.DateTime),
         SecondOf(txtDataFinal.DateTime)
      ]);
      SLParametros.Values['.dataFim'] := S;
   end;

   if txtDataBase.Enabled then
   begin
      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(txtDataBase.Date),
         MonthOf(txtDataBase.Date),
         DayOf(txtDataBase.Date),
         HourOf(txtDataBase.DateTime),
         MinuteOf(txtDataBase.DateTime),
         SecondOf(txtDataBase.DateTime)
      ]);
      SLParametros.Values['.periodo_base'] := S;
   end;

   if txtGenerico.Enabled and (txtGenerico.Text <> '') then
   begin
      SLParametros.Values['.generic'] := txtGenerico.Text;
   end;

   //paremetros
   sParametros := LowerCase(qRelatorios.FieldByName('ds_parametros').AsString); //Matriculas.AnoSemestre;Matriculas.Turma;

  // sFiltro é utilizado para SQL

   while (Length(Trim(sParametros)) > 1) do begin

      pAtual := Copy(sParametros, 1, Pos(';', sParametros) - 1);
      pCampo := Copy(pAtual, Pos('.', pAtual) + 1, Length(pAtual));
      sParametros := Copy(sParametros, Pos(';', sParametros)+1, Length(sParametros));

      // Verificar qual é o parâmetro
      if (Pos('anosemestre', pCampo) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;
         sFiltro := sFiltro + sAux + pAtual + ' = ' + txtAnoSemestre.Text;
         sFiltroShow := sFiltroShow + '"ANO/SEMESTRE = ' + Copy(txtAnoSemestre.Text,1,4) + '/' + Copy(txtAnoSemestre.Text,5,1) + '" + CHR(13) + ';
         sAux := ' and ';
      end;

      if (Pos('curso', pCampo) > 0) then begin
         if txtCurso.Text <> '' then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + txtCurso.Text + '"' ;
            sFiltro := sFiltro + sAux + pAtual + ' = ''' + txtCurso.Text + '''' ;
            sFiltroShow := sFiltroShow + '"CURSO = ' + txtCurso.Text + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if (Pos('depto', pCampo) > 0) then begin
         if (txtDepartamento.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtDepartamento.Text  ;
            sFiltro := sFiltro + sAux + pAtual + ' = ' + txtDepartamento.Text;
            
            // Pegar o Nome do Depto
            departamento := TDepartamento.Create( StrToInt(txtDepartamento.Text), true );
            sFiltroShow := sFiltroShow + '"DEPARTAMENTO = ' + departamento.Nome + '" + CHR(13) + ';
            FreeAndNil(departamento);

            sAux := ' and ';
         end;
      end;

      if (Pos('turma', pCampo) > 0) then begin
         if (txtTurma.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + txtTurma.text +  '"' ;
            sFiltro := sFiltro + sAux + pAtual + ' = ''' + txtTurma.text +  '''' ;
            sFiltroShow := sFiltroShow + '"TURMA = ' + txtTurma.Text + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if ((Pos('codigoaluno', pCampo) > 0) or (Pos('cd_pessoa', pCampo) > 0)) then begin
         if (txtCodigoAluno.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtCodigoAluno.Text;
            sFiltro := sFiltro + sAux + pAtual + ' = ' + txtCodigoAluno.Text;
            sFiltroShow := sFiltroShow + '"ALUNO = ' + txtCodigoAluno.Text + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if (Pos('cd_caixa', pCampo) > 0) OR (Pos('cd_conta_banco', pCampo) > 0) then begin
         if (txtContaCaixa.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtContaCaixa.text;
            sFiltro := sFiltro + sAux + pAtual + ' = ' + txtContaCaixa.text;
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"CONTA/CAIXA = ' + txtContaCaixa.Text + '" + CHR(13) + ';
         end;
      end;

      if (Pos('cd_tipo_titulo', pCampo) > 0)  then begin
         if (txtTipoTitulo.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + txtTipoTitulo.text + ']';
            sFiltro := sFiltro + sAux + pAtual + ' in (' + txtTipoTitulo.text + ') ' ;
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"TIPO DE TITULO = ' + txtTipoTitulo.Text + '" + CHR(13) + ';
         end;
      end;

      if (Pos('generic', pAtual) > 0 ) then begin
      if (txtGenerico.Text <> '') then begin
         sFSelecao := sFSelecao + sAux + '{' + Copy(pAtual, Pos(']', pAtual)+1, length(pAtual)) + '} LIKE "*' + txtGenerico.Text + '*"';
         sFiltroShow := sFiltroShow + '"' + UpperCase(Copy(pAtual, Pos('[', pAtual)+1, Pos(']', pAtual)-Pos('[',pAtual)-1)) + ' contendo ' + txtGenerico.Text + '" + CHR(13) + ';
         sAux := ' and ';
         sFiltro := sFiltro + sAux + Copy(pAtual, Pos(']', pAtual)+1, length(pAtual)) + ' like "%' + txtGenerico.Text + '%"';
      end;
      end;

      if (Pos('parcela', pCampo) > 0) then begin
         if (txtParcelaInicial.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} >= ' + txtParcelaInicial.text  ;
            sFiltro := sFiltro + sAux + pAtual + ' >= ' + txtParcelaInicial.text;
            sAux := ' and ';
         end;

         if (txtParcelaFinal.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} <= ' + txtParcelaFinal.text;
            sFiltro := sFiltro + sAux + pAtual + ' <= ' + txtParcelaFinal.text;
            sAux := ' and ';
         end;

         if ((txtParcelaInicial.Text <> '') or (txtParcelaFinal.Text <> '')) then begin
            sFiltroShow := sFiltroShow + '"PARCELA = DE ' + txtParcelaInicial.Text + ' ATE ' + txtParcelaFinal.Text + '" + CHR(13) + ';
         end;
      end;

      if (Pos('periodo_base', pCampo) > 0)then begin

          DecodeDate(txtDataBase.Date, wAno, wMes, wDia);

          sFSelecao := sFSelecao + sAux + '( {' + pAtual +'} = ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + ' )';
          sFiltro := sFiltro + sAux + '( ' + pAtual + ' = ''' + FormatDateTime( 'yyyy-mm-dd', txtDataBase.Date ) + ''' ) ';
      
      end;

      if ((Pos('data', pCampo) > 0) or (Pos('dt_', pCampo) > 0))then begin
      if ckDtFiltrar.Checked then begin

        sFSelecao := sFSelecao + sAux + ' ( ';
        sFiltro := sFiltro + sAux + ' ( ';

        sAux := ' ';

        while (Length(pAtual) > 0) do begin

           if Pos(' or ',pAtual) > 0 then begin
              pAtual_Aux := Copy(pAtual, Pos(' or ', pAtual) + 4, Length(pAtual));
              pAtual := Copy(pAtual, 1, Pos(' or ',pAtual) - 1);
           end
           else begin
              pAtual_Aux := '';
           end;

           DecodeDate(txtDataInicial.Date, wAno, wMes, wDia);

           sFSelecao := sFSelecao + sAux + '( {' + pAtual +'} >= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + '';
           sFiltro := sFiltro + sAux + '( ' + pAtual + ' >= ''' + FormatDateTime( 'yyyy-mm-dd', txtDataInicial.Date ) + '''';
           sAux := ' and ';

           DecodeDate(txtDataFinal.Date, wAno, wMes, wDia);

           sFSelecao := sFSelecao + sAux + '{' + pAtual +'} <= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + ' )';
           sFiltro := sFiltro + sAux + pAtual + ' <= ''' + FormatDateTime( 'yyyy-mm-dd', txtDataFinal.Date ) + ''')';
           pAtual := pAtual_Aux;
           sAux := ' or ';

        end;

        sFSelecao := sFSelecao +  ' ) ';
        sFiltro := sFiltro +  ' ) ';

        if (Pos('datavencimento', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"VENCIMENTO = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDataInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDataFinal.Date ) + '" + CHR(13) + ';
        if (Pos('datapagamento', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA PGTO = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDataInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDataFinal.Date ) + '" + CHR(13) + ';
        if (Pos('cheque_data', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA CHEQUE = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDataInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDataFinal.Date ) + '" + CHR(13) + ';
        if (Pos('dataabertura', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA DE ABERTURA = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDataInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDataFinal.Date ) + '" + CHR(13) + ';
        if (Pos('dt_', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDataInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDataFinal.Date ) + '" + CHR(13) + ';

        sAux := ' and ';

      end;
      end;

      if (Pos('cd_coligada', pCampo) > 0) then
      begin
         if (cbUnidadeEnsino.ItemIndex = -1) or (cbUnidadeEnsino.ItemIndex = 0)  then
         begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + DM.GetColigadas() + ']'  ;
            sFiltro := sFiltro + sAux + pAtual + ' in (' + Dm.GetColigadas() + ')' ;
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"U.E. = ' + DM.sColigadaSelecionada + '" + CHR(13) + ';
         end
         else
         begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
            sFiltro := sFiltro + sAux + pAtual + ' = ' + IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"U.E. = ' + DM.sColigadaSelecionada + '" + CHR(13) + ';
         end;
      end;

   end; // Fim do While dos Parâmetros

   //especial
   if Trim(qRelatorios.FieldByName('ds_Especial').AsString) <> '' then begin
      sFSelecao := sFSelecao + sAux + qRelatorios.FieldByName('ds_Especial').AsString;
// Feito pelo CLAU      sFiltro := sFiltro + sAux + qRelatorios.FieldByName('ds_Especial').AsString;
   end;

   //formulas
   slFormulas := TStringList.Create();

   sAux := qRelatorios.FieldByName('ds_Formula').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slFormulas);

      for i := 0 to (slFormulas.Count - 1) do begin

         sAux := slFormulas.ValueFromIndex[i];

         //processa formulas
         if (sAux = '[periodo_base]') then begin
            DecodeDate(txtDataBase.Date, wAno, wMes, wDia);
            slFormulas.ValueFromIndex[i] := 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
         end
         else if (sAux = '[data_inicio]') then begin
            DecodeDate(txtDataInicial.Date, wAno, wMes, wDia);
            slFormulas.ValueFromIndex[i] := 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
         end
         else if (sAux = '[data_fim]') then begin
           DecodeDate(txtDataFinal.Date, wAno, wMes, wDia);
           slFormulas.ValueFromIndex[i] :=  'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
         end
         else if (Pos('generic[', lowercase(sAux)) > 0) then begin
           slFormulas.ValueFromIndex[i] := '"' + txtGenerico.Text + '"' ;
         end
         else if (sAux = '[nm_coligada]') then begin
              slFormulas.ValueFromIndex[i] := '"' + DM.sColigadaSelecionada + '"';
         end
         else if (sAux = '[nm_coligada_razao]') then begin
            slFormulas.ValueFromIndex[i] := '"' + DM.sColigadaSelecionadaRazao + '"';
         end
         else if (sAux = '[anosemestre]') then begin
            slFormulas.ValueFromIndex[i] := txtAnoSemestre.Text;
         end
         else if (sAux = '[cd_coligada]') then begin
            if cbUnidadeEnsino.ItemIndex = -1 then
            begin
               Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONINFORMATION, Handle);
               cbUnidadeEnsino.SetFocus();
               Exit;
            end;
            slFormulas.ValueFromIndex[i] := '"' +
               IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo) +
               '"';
         end
         else if (sAux = '[nr_anosem]') then begin
            slFormulas.ValueFromIndex[i] := txtAnoSemestre.Text;
         end
         else if (sAux = '[cd_depto]') then begin
            if txtDepartamento.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtDepartamento.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
         end
         else if (sAux = '[cd_curso]') then begin
            slFormulas.ValueFromIndex[i] := '"' + txtCurso.Text + '"';
         end
         else if (sAux = '[cd_turma]') then begin
            slFormulas.ValueFromIndex[i] := '"' + txtTurma.Text + '"';
         end
         else if (sAux = '[cd_pessoa]') then begin
            if txtCodigoAluno.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtCodigoAluno.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
         end
         else if (sAux = '[ds_observacao]') then begin
            slFormulas.ValueFromIndex[i] :=  '"' + txtGenerico.Text + '"' ;
         end
         else if (sAux = '[nr_parcela_inicio]') then begin
            if txtParcelaInicial.Text <> '' then             
               slFormulas.ValueFromIndex[i] := trim(txtParcelaInicial.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
         end
         else if (sAux = '[nr_parcela_fim]') then begin
            if txtParcelaFinal.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtParcelaFinal.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
         end
         else if (sAux = '[cd_caixa]') then begin
            if txtContaCaixa.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtContaCaixa.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';

         end
         else if (sAux = '[cd_tipo_titulo]') then begin
            slFormulas.ValueFromIndex[i] :=  '"' + txtTipoTitulo.Text + '"' ;
         end;
      end;
   end; //formula

   //SQL Expression
   slSQLExp := TStringList.Create();

   sAux := qRelatorios.FieldByName('ds_sql_exp').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slSQLExp);

      for i := 0 to (slSQLExp.Count - 1) do begin

         sAux := slSQLExp.ValueFromIndex[i];

         //processa formulas
          if (Pos('[data_inicio]', sAux) > 0 ) then begin
             sAux := ReplaceStr(sAux, '[data_inicio]', ''''+ FormatDateTime('yyyy-mm-dd', txtDataInicial.Date) + '''');
          end;
          if (Pos('[data_fim]', sAux) > 0 ) then begin
             sAux := ReplaceStr(sAux, '[data_fim]', ''''+ FormatDateTime('yyyy-mm-dd', txtDataFinal.Date) + '''');
          end;
          if (Pos('[cd_coligada]', sAux) >0 ) then
          begin
             if cbUnidadeEnsino.ItemIndex = -1 then
             begin
                Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONINFORMATION, Handle);
                cbUnidadeEnsino.SetFocus();
                Exit;
             end;

             sAux := ReplaceStr(sAux,'[cd_coligada]', IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo));
          end;
          if (Pos('[cd_caixa]', sAux) >0 ) then begin
             sAux := ReplaceStr(sAux,'[cd_caixa]', txtContaCaixa.Text);
          end;

          if (Pos('[cd_tipo_titulo]', sAux) >0 ) then begin
             sAux := ReplaceStr(sAux,'[cd_tipo_titulo]', txtTipoTitulo.Text);
          end;


          slSQLExp.ValueFromIndex[i] := sAux;

      end;

   end; //SQL EXP

   //formula grupo
   sAux := qRelatorios.FieldByName('ds_formula_grupo').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      sFGrupo := sAux;
   end;

   slOrdem := TStringList.Create();

   //ordem
   sAux := qRelatorios.FieldByName('ds_ordem').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slOrdem);
   end;

   //formulas padrao
   slFormulas.Add('nm_titulo="' + qRelatorios.FieldByName('nm_relatorio').AsString + '"');
   if (Length(sFiltroShow) > 0) then begin
      sFiltroShow := LeftStr(sFiltroShow, Length(sFiltroShow) - 3);
      slFormulas.Add('ds_filtro=' + sFiltroShow);
   end;

   //Adiciona os campos adicionais do relatório
   for i := 0 to CamposAdicionaisRelatorio.Count - 1 do
   begin
      slFormulas.Add(CamposAdicionaisRelatorio[i]);
   end;

   // Imprimir se for bloqueto

   if (Pos('boleto', LowerCase(qRelatorios.FieldByName('nm_relatorio').AsString)) > 0) OR (Pos('bloqueto', LowerCase(qRelatorios.FieldByName('nm_relatorio').AsString)) > 0) then begin

      if not GerarBoleto() then Exit;

      if PrincipalForm.ImprimeRpt(Self, sArqRelatorio, qRelatorios.FieldByName('cd_cabecalho').AsInteger, sFSelecao, sFGrupo,
         slFormulas, slOrdem, nil, nil,True, False, SLParametros, PodeExportar) then
      begin
         // Bloqueto Impresso
         frmRepBloquetos.qryUpdate.Close;
         frmRepBloquetos.qryUpdate.SQL.Text := 'update mensalidades set bloqueto = ''S'', ocorrencia_remessa = 1, ocorrencia_retorno = 0 ';
         frmRepBloquetos.qryUpdate.SQL.Add('where ');

         frmRepBloquetos.qryUpdate.SQL.Add( sFiltro );
         frmRepBloquetos.qryUpdate.ExecSQL;
      end;
   end
   //relatorio DOS
   else if (Pos('.dos', LowerCase(sArqRelatorio)) > 0) then begin

      if (Trim(qRelatorios.FieldByName('ds_Especial').AsString) <> '') then begin
         if (Length(sFiltro) > 0) then begin
            sFiltro := sFiltro + ' and ';
         end;
         sFiltro := sFiltro + qRelatorios.FieldByName('ds_Especial').AsString;
      end;
      //retira todas as chaves
      for i := 1 to Length(sFiltro) do begin
         if (sFiltro[i] = '{') or (sFiltro[i] = '}') then begin
            sFiltro[i] := ' ';
         end;
      end;
      Imprimir_DOS(strReports + '\' + qRelatorios.FieldByName('nm_arquivo').AsString, qRelatorios.FieldByName('ds_sql').AsString, sFiltro, qRelatorios.FieldByName('ds_sql_ordem').AsString, qRelatorios.FieldByName('ds_formula_grupo').AsString );
   end
   else begin
      //imprime principal
      // Executar o SQL

      if Length(qRelatorios.FieldByName('ds_sql').AsString) > 0 then begin

         sSQL := qRelatorios.FieldByName('ds_sql').AsString;

         sSQL := StringReplace(sSQL, '[data_inicio]', '''' + FormatDateTime('yyyy-mm-dd', txtDataInicial.Date) + '''', [rfReplaceAll] );
         sSQL := StringReplace(sSQL, '[data_fim]', '''' + FormatDateTime('yyyy-mm-dd', txtDataFinal.Date) + '''', [rfReplaceAll] );

         if Pos('where', lowercase(qRelatorios.FieldByName('ds_sql').AsString)) > 0 then
            sSQL := sSQL + ' AND ' + sFiltro + qRelatorios.FieldByName('ds_sql_ordem').AsString
         else
            sSQL := sSQL + ' WHERE ' + sFiltro + qRelatorios.FieldByName('ds_sql_ordem').AsString;

         slSQL := TStringList.Create;

         SplitString(sSQL, ';', slSQL);

         // Executar o SQL
         with DM.qAux2 do begin
            For i:= 0 to slSQL.Count -1 do begin
                Close;
                SQL.Clear;
                SQL.Add( slSQL.Strings[i] );
                ExecSQL;
             end;
         end;

      end;

      //Imprimir o Relatório

      if (Dm.isTrue(qRelatorios.FieldByName('sn_impressao_numero').AsString)) then begin
         // Criar um novo Número de Impressao

         try
            iNum :=  StrToInt(DM.variavel_parametro('relatorio_impressao_numero'));
         except
            iNum := 1;
         end;

         sAux := IntToStr(iNum);

         Inc(iNum);

         sAux := sAux + DV44(sAux);

         DM.set_variavel_parametro('relatorio_impressao_numero', IntToStr(iNum));

         DM.qAux1.Close;
         Dm.qAux1.SQL.Clear;
         Dm.qAux1.SQL.Add('INSERT INTO relatorios_impressos (nr_impresso, cd_relatorio, cd_pessoa, cd_usuario, anosemestre, turma, dt_relatorio)');
         Dm.qAux1.SQL.Add('VALUES (:numero, :relatorio, :pessoa, :cd_usuario, :anosemestre, :turma, :data_hora)');
         Dm.qAux1.ParamByName('numero').AsInteger     := StrToInt(sAux);
         DM.qAux1.ParamByName('relatorio').AsInteger  := qRelatorios.FieldByName('cd_relatorio').AsInteger;
         DM.qAux1.ParamByName('pessoa').AsString      := txtCodigoAluno.Text;
         DM.qAux1.ParamByName('cd_usuario').AsInteger := DM.iCdPessoaLogado;
         DM.qAux1.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
         DM.qAux1.ParamByName('turma').AsString       := txtTurma.Text;
         DM.qAux1.ParamByName('data_hora').AsString   := FormatDateTime('yyyy-mm-dd hh:MM:ss', DM.DataAtual());
         DM.qAux1.ExecSQL;

         { Inserir na tabela de Impressoes }
      End;

      bAux := PrincipalForm.ImprimeRpt(
      Self,
      sArqRelatorio,
      qRelatorios.FieldByName('cd_cabecalho').AsInteger,
      sFSelecao,
      SFGrupo,
      slFormulas,
      slOrdem,
      nil,
      slSQLExp,
      True,
      False,
      SLParametros);

      if (not bAux) AND (Dm.isTrue(qRelatorios.FieldByName('sn_impressao_numero').AsString)) then
      begin

         Dm.CriarConsulta(qyDelete);

         qyDelete.SQL.Clear;
         qyDelete.SQL.Add('DELETE FROM relatorios_impressos WHERE nr_impresso = :numero AND cd_relatorio = :relatorio AND cd_pessoa = :pessoa AND ');
         qyDelete.SQL.Add('cd_usuario =  :cd_usuario AND anosemestre = :anosemestre AND turma = :turma ');
         qyDelete.ParamByName('numero').AsInteger     := StrToInt(sAux);
         qyDelete.ParamByName('relatorio').AsInteger  := qRelatorios.FieldByName('cd_relatorio').AsInteger;
         qyDelete.ParamByName('pessoa').AsString      := txtCodigoAluno.Text;
         qyDelete.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
         qyDelete.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
         qyDelete.ParamByName('turma').AsString       := txtTurma.Text;
         qyDelete.ExecSQL;

         FreeAndNil(qyDelete);

      end;

   end;
end;

procedure Tfrm_relatorios_financeiros.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante, StrToInt(txtAnoSemestre.Text));

   if resultado_filtro.filtrado then
   begin
     txtCodigoAluno.Text := IntToStr( resultado_filtro.cd_pessoa );
     try
       txtTurma.Text := resultado_filtro.cd_turma;
       txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
     except
     End;

//     frm_Sel_Pessoa.qryPessoa.Close;                                                               
   end
   else Exit;
end;

procedure Tfrm_relatorios_financeiros.btnCodigoDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
   iDepartamente: Integer;
begin

   iDepartamente := StrToIntDef(txtDepartamento.Text, -1);

   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([],
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);
   end;

   if ( resultado_filtro.filtrado ) and
      ( iDepartamente <> resultado_filtro.cd_departamento ) Then
   begin
      txtDepartamento.Text := IntToStr( resultado_filtro.cd_departamento );
      txtCurso.Text := '';
      txtTurma.Text := '';
      DM.LocalizaColigada( cbUnidadeEnsino, resultado_filtro.cd_coligada ); 
   end;
end;

function Tfrm_relatorios_financeiros.GerarBoleto : boolean;
var
   sFiltroAux : String;
   bAgrupado : Boolean;
   sConta : String;
   slFormulas: TStringList;
   bEmpresa : Boolean;
   bResponsavel : Boolean;
   bFiltroVazio : Boolean;
   sMensagemVazio : String;
   sMensagemOp : String;   
begin
   { Selecionar os bloquetos }

   bFiltroVazio := True;

   sFiltroAux := ' 1 = 1 ';

   sMensagemVazio := 'Atenção' + CHR(13) + CHR(13) + 
                     'Você está emitindo boletos para todos os estudantes';

   sMensagemOp := ' de: ' + CHR(13) + CHR(13);     
   

   if txtAnoSemestre.Enabled then begin
      sFiltroAux := sFiltroAux + ' and (m.anosemestre = ' + txtAnoSemestre.Text + ') ';
      sMensagemVazio := sMensagemVazio + sMensagemOp + 'Ano/Semestre = ' + txtAnoSemestre.EditText;
      sMensagemOp := CHR(13);
   End;

   if txtCurso.Enabled then begin
      if txtCurso.Text <> '' then begin
         sFiltroAux := sFiltroAux + ' and (m.curso = "' + txtCurso.Text + '")';
         sMensagemVazio := sMensagemVazio + sMensagemOp + 'Curso: ' + txtCurso.Text + CHR(13);
         sMensagemOp := CHR(13);
      end;
   end;

   if txtDepartamento.Enabled then begin
      if txtDepartamento.Text <> '' then begin
         sFiltroAux := sFiltroAux + ' and (m.depto = ' + txtDepartamento.Text + ') ';
         sMensagemVazio := sMensagemVazio + sMensagemOp + 'Departamento: ' + txtDepartamento.Text + CHR(13);
         sMensagemOp := CHR(13);         
      end;
   end;

   if txtTurma.Enabled then begin
      if txtTurma.Text <> '' then begin
         sFiltroAux := sFiltroAux + ' and (m.turma = "' + txtTurma.Text + '") ';
         sMensagemVazio := sMensagemVazio + sMensagemOp + 'Turma: ' + txtTurma.Text + CHR(13);
         sMensagemOp := CHR(13);         
      end;
   end;

   if txtParcelaInicial.Enabled then begin
      if txtParcelaInicial.Text <> '' then begin
         sFiltroAux := sFiltroAux + ' and (m.parcela >= ' + txtParcelaInicial.Text + ')';
      end;

      if txtParcelaFinal.Text <> '' then begin
         sFiltroAux := sFiltroAux + ' and (m.parcela <= ' + txtParcelaFinal.Text + ') ' ;
      end;
   end;

   if (txtDataInicial.Enabled) AND (ckDtFiltrar.Checked) Then Begin
      sFiltroAux := sFiltroAux + ' and (m.datavencimento >= "' + FormatDateTime( 'yyyy-mm-dd', txtDataInicial.Date ) + '") ';
      sFiltroAux := sFiltroAux + ' and (m.datavencimento <= "' + FormatDateTime( 'yyyy-mm-dd', txtDataFinal.Date ) + '") ';
   end;

   // Incluir condições do "ds_sql" no filtro
   if TRIM(qRelatorios.FieldByName('ds_sql').AsString) <> '' then begin
     sFiltroAux := sFiltroAux + ' AND ' +  TRIM(qRelatorios.FieldByName('ds_sql').AsString);
   end;
   

   slFormulas := TStringList.Create();
   SplitString(qRelatorios.FieldByName('ds_formula').AsString, ';', slFormulas);

   bEmpresa := (slFormulas.IndexOfName('empresa') >= 0) AND (slFormulas.IndexOfName('iContaImpressao') >= 0);
   bResponsavel := (slFormulas.IndexOfName('responsavel') >= 0) AND (slFormulas.IndexOfName('iContaImpressao') >= 0);

   if txtCodigoAluno.Enabled then begin

      if txtCodigoAluno.Text <> '' then begin

         bFiltroVazio := False; // Se filtrar um aluno, não precisa emitir mensagem depois      

         if bEmpresa or bResponsavel then begin
            sFiltroAux := sFiltroAux + ' and (m.cd_resp = ' + txtCodigoAluno.Text + ') ';
         end else begin
            sFiltroAux := sFiltroAux + ' and (m.codigoaluno = ' + txtCodigoAluno.Text + ') ';
         end;
         
      end;
   end;

   // Verificar se está filtrando por coligada

   if (Pos('cd_coligada', LowerCase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) then
   begin
      if cbUnidadeEnsino.ItemIndex = -1 then
      begin
         Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONINFORMATION, Handle);
         cbUnidadeEnsino.SetFocus();
         Exit;
      end;

      sFiltroAux := sFiltroAux + ' and (m.cd_coligada = ' + IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo) + ') ';
   end;


   if (bEmpresa) AND (txtCodigoAluno.Text = '') then
   begin
      Mensagem('Atenção' + CHR(13) + CHR(13) + 'Você precisa selecionar uma pessoa para imprimir este boleto.', 'UNIMESTRE', MB_OK + MB_ICONWARNING );

      Abort;
   end;

   if bFiltroVazio then
   begin
      if Mensagem(sMensagemVazio + CHR(13) + CHR(13) + 'Tem certeza que deseja continuar?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON3, Handle) <> mrYes then  begin
         Abort;
      end;
   end;

   bAgrupado := DM.isTrue(DM.variavel_parametro('financeiro_boletos_agrupados'));

   // Pegar a Conta para ImpressÃo de Boletos;  Variáveis iContaImpressao=5;iContaColigada=1;

   if DM.variavel_parametro('financeiro_boleto_escolha_aluno') = 'S' then
   begin
      if slFormulas.IndexOfName('iContaImpressao') >= 0 then
      begin
         sConta := slFormulas.Values['iContaImpressao'];
         sConta := sConta + '=' + slFormulas.Values['iContaColigada'];

         if sConta = '=' then
            sConta := '';
      end
   end else begin
      sConta := '';
   end;

   if  not (DM.variavel_parametro('agrupar_mensalidades_proximo_mes') = 'S') then  
   begin
      if bEmpresa OR bResponsavel then
      begin
         sConta := slFormulas.Values['iContaImpressao'];
         sConta := sConta + '=' + slFormulas.Values['iContaColigada'];
         if not frmRepBloquetos.PrepararBloquetosParaEmpresa(sFiltroAux, bAgrupado, sConta)  then
         begin
            result := false;
            exit;
         end;
      end else begin
         if not frmRepBloquetos.PrepararBloquetosParaImpressao(sFiltroAux, bAgrupado, sConta)  then
         begin
            result := false;
            exit;
         end;
      end;
   end
   else
   begin
      if bEmpresa OR bResponsavel then begin
         sConta := slFormulas.Values['iContaImpressao'];
         sConta := sConta + '=' + slFormulas.Values['iContaColigada'];
         if not frmRepBloquetos.PrepararBloquetosParaAluno(sFiltroAux, bAgrupado, sConta)  then begin
            result := false;
            exit;
         end;
      end else
      begin
         if not frmRepBloquetos.PrepararBloquetosParaImpressao(sFiltroAux, bAgrupado, sConta)  then begin
            result := false;
            exit;
         end;
      end;
   end;

   result := true;
   
   { Ao abrir a seleção, a tabela bloquetos já é populada }

   frmRepBloquetos.tblBloquetos.First();

   while not frmRepBloquetos.tblBloquetos.Eof do begin
      DM.FazAcaoRemessa(arImpBoleto, frmRepBloquetos.tblBloquetos.FieldByName('cd_mensalidade').AsInteger, true);
      frmRepBloquetos.tblBloquetos.Next();
   end;

end;

procedure Tfrm_relatorios_financeiros.Imprimir_DOS(arquivo, sql, filtro,
  ordem: string; grupo: string = '');
Var
   ImpressoraDOS  : TImpressaoDOS;
   layout         : TextFile;
   linha          : ARRAY of string;
   aux, texto     : string;
   texto_aux      : string;
   colunas, i, z  : integer;
   col, tam       : integer;

begin
   // Rotina para impressao de relatórios DOS;
   // arquivo : nome do arquivo que contém o layout do arquivo para impressão;
   // sql : comando sql : select... from;
   // filtro : filtro da cláusula where;
   // ordem : campos do order by;

   // Este modelo está imprimindo 1 registro por página

   { Preparar a query com os dados para detalhes }
   DM.qAux1.Close;
   DM.qAux1.SQL.Clear;
   DM.qAux1.SQL.Add(sql);

   if filtro <> '' then
      DM.qAux1.SQL.Add('where ' + filtro);

   if grupo <> '' then
      DM.qAux1.SQL.Add('Group by ' + grupo);

   if ordem <> '' then
      Dm.qAux1.SQL.Add('order by ' + ordem);

   DM.qAux1.SQL.Text;

   Dm.qAux1.Open;

   AssignFile( layout, arquivo );
   reset( layout );

   readln(layout, aux);

   { A primeira linha do arquivo tem que possuir o parâmetro de quantidade de linhas }

   if COPY(aux, 1,3) <> 'LIN' then
   Begin
       Mensagem('Arquivo de Layout não corresponde ao padrão utilizado');
   End;

   { alterar o array linhas para o definido no layout }
   SetLength(linha, StrToInt(copy(aux, 5,3)) + 1);

   readln(layout, aux);

   { A segunda linha do arquivo tem que possuir o parâmetro de quantidade de colunas }

   if COPY(aux, 1,3) <> 'COL' then
   Begin
       Mensagem('Arquivo de Layout não corresponde ao padrão utilizado');
   End;

   { definir o número de colunas do relatorio }
   colunas := StrToInt(Copy(aux, 5, 3));

   DM.qAux1.First;

   while not Dm.qAux1.EOF do
   Begin

      CloseFile(layout);
      Reset(layout);
      readln(layout,aux);
      readln(layout,aux);

      { ZERAR O ARRAY DE LINHAS }

      For i := 1 to Length(linha)-1 do
      Begin
          linha[i] := '';
      End;

      For i := 1 to Length(linha)-1 do
      Begin
         For z := 1 to colunas do
         Begin
             linha[i] := linha[i] + ' ';
         End;
      End;

      { Ler o Layout }
      while not EOF(layout) do
      Begin

         readln(layout, aux);

         i := StrToInt(Copy(aux,2,2));
         tam := StrToInt(Copy(aux,9,3));
         col := StrToInt(Copy(aux,5,3));

         { Verificar a iformação que será impressa }
         if Copy(aux,13,3) = 'TEX' then
         Begin
            texto := copy(aux,36,tam);
         End
         else if Copy(aux,13,3) = 'STR' then
         Begin
            texto := Copy(Dm.qAux1.FieldByName( Trim(Copy(aux, 36, 25)) ).AsString, 1, tam);
            if Trim(Copy(aux, 17, 18)) <> '' then
                texto := FormatMaskText(Trim(Copy(aux, 17, 18))+ ';0', texto);
         End
         else if Copy(aux,13,3) = 'INT' then
         Begin
            texto := Copy(Dm.qAux1.FieldByName( Trim(Copy(aux, 36, 25)) ).AsString, 1, tam);
            if Trim(Copy(aux, 17, 18)) <> '' then
                texto := FormatMaskText(Trim(Copy(aux, 17, 18)) + ';0', texto);
         End
         else if Copy(aux,13,3) = 'DAT' then
         Begin
            texto := Copy(Dm.qAux1.FieldByName( Trim(Copy(aux, 36, 25)) ).AsString, 1, tam);
            if Trim(Copy(aux, 17, 18)) <> '' then
                texto := UPPERCASE(FormatDateTime(Trim(Copy(aux, 17, 18)), StrToDate(texto)));
         End
         else if Copy(aux,13,3) = 'NUM' then
         Begin
            texto := Copy(Dm.qAux1.FieldByName( Trim(Copy(aux, 36, 25)) ).AsString, 1, tam);
            if Trim(Copy(aux, 17, 18)) <> '' then
                texto := Format(Trim(Copy(aux, 17, 18)), [StrToFloat(texto)]);
         End;

         while Length(texto) < tam do
            texto := texto + ' ';

         texto_aux := linha[i];

         For z := col to (length(texto) + col)-1 do
         begin
           try
              texto_aux[z] := texto[z - col + 1];
           except
           end;
         end;

         linha[i] := texto_aux;

      End;

      if (Length(linha) > 0) then
      begin
         ImpressoraDOS.Create(DM.variavel_parametro('impressao_matricial_porta'));

         try
            for z := 1 to Length(linha)-1 do
            begin
               linha[z] :=  troca_acendo(linha[z]);
               ImpressoraDOS.Imprimir(linha[z]);
            end;
         except
            on E:EInOutError do
            begin
               Mensagem('Impressora desconectada ou não configurada, não foi possível realizar a impressão.' + #13+#13 + 'Porta de impressão: ' + ImpressoraDOS.GetPorta(), '', MB_ICONEXCLAMATION + MB_OK, Handle);
            end;
         end;

         ImpressoraDOS.Finalizar();
      end;

      DM.qAux1.Next;

   End;

   CloseFile(layout);

   Mensagem('A impressão chegou ao fim.');

end;

function Tfrm_relatorios_financeiros.troca_acendo(valor: string): string;
var
  i : integer;
  nova : string;
  p  :integer;
CONST
  com_acento = 'áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙçÇâêîôûÂÊÎÔÛüÜïÏãÃõÕ';
  sem_acento = 'aeiouAEIOUaeiouAEIOUcCaeiouAEIOUuUiIaAoO';
  car_acento = '''''''''''''''''''''``````````''''^^^^^^^^^^""""~~~~';
begin
  nova := '';
  For i:= 1 to Length(valor) do
  begin
      p :=  pos(valor[i], com_acento);
      if  p > 0 then
      Begin
         nova := nova + sem_acento[p] + chr(8) + car_acento[p];
      End
      else
         nova := nova + valor[i];
  end;

  result := nova;

end;

procedure Tfrm_relatorios_financeiros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CamposAdicionaisRelatorio.Free;
  FreeAndNil(frmRepBloquetos);
  Action := caFree;
end;

procedure Tfrm_relatorios_financeiros.FormCreate(Sender: TObject);
begin
   CamposAdicionaisRelatorio := TStringList.Create();
end;

procedure Tfrm_relatorios_financeiros.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_F7 : btnImprimirClick( nil );
      VK_F12 : btnFecharClick( nil );
      VK_F10: begin
         if(sbPreencherVariaveis.Visible)then
         begin
            sbPreencherVariaveisClick( nil );
         end;
      end;   
   end;
end;

procedure Tfrm_relatorios_financeiros.sbPreencherVariaveisClick(
  Sender: TObject);
begin
   { Apresentar a tela de campos adicionais }
   Application.CreateForm(Tfrm_relatorios_adicional, frm_relatorios_adicional);

   qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

   frm_relatorios_adicional.tela := 'financeiro_contas_receber';
   frm_relatorios_adicional.carregar_campos(qRelatorios.FieldByName('cd_relatorio').AsInteger);

   FreeAndNil(frm_relatorios_adicional);
end;

procedure Tfrm_relatorios_financeiros.sbPropriedadesClick(Sender: TObject);
begin
    //Mostra a Janela de configuracao da impressora

    PrincipalForm.getRelatorio().Printer.Prompt();
    PrincipalForm.GetRelatorio().Printer.SetCurrent();
end;

procedure Tfrm_relatorios_financeiros.btnTipoTituloClick(Sender: TObject);
Var
   sFiltro : String;
   sOp : String;
   n : Integer;
begin

   Application.CreateForm(TfrmSelTipoTitulo, frmSelTipoTitulo);
   frmSelTipoTitulo.slTitulos := TStringList.Create();

   sFiltro := '';
   sOp := '';

   if frmSelTipoTitulo.ShowModal() = mrOk then begin

     for n := 0 to frmSelTipoTitulo.cklbTitulos.Count - 1 do begin
        if frmSelTipoTitulo.cklbTitulos.Checked[n] then begin
           sFiltro := sFiltro + sOp + frmSelTipoTitulo.slTitulos.Strings[n];
           sOp := ', ';
        end;
     end;

     txtTipoTitulo.Text := sFiltro;
     
   end;

   FreeAndNil(frmSelTipoTitulo.slTitulos);
   
   FreeAndNil(frmSelTipoTitulo);      
end;

procedure Tfrm_relatorios_financeiros.CarregarColigadas;
begin
   DM.CarregaColigadas(cbUnidadeEnsino, true);
end;

procedure Tfrm_relatorios_financeiros.cbUnidadeEnsinoChange(Sender: TObject);
begin
   txtDepartamento.Text := '';
   txtCurso.Text := '';
   txtTurma.Text := '';
end;

procedure Tfrm_relatorios_financeiros.cbUnidadeEnsinoCloseUp(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure Tfrm_relatorios_financeiros.btnContaCaixaClick(Sender: TObject);
begin
  frm_SelCaixa.ShowModal;

  if frm_SelCaixa.flgSearch then
  begin

    txtContaCaixa.Text := frm_SelCaixa.qyCaixa.FieldByName('cd_caixa').AsString;

  end;


end;

end.
