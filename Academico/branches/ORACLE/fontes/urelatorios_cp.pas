unit urelatorios_cp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, ZConnection, StdCtrls, Mask, DateUtils,
  Menus, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, DBGrids, UMComboBox, uFSelecionarPessoa, UMDateTimePicker, Contnrs,
  Variants, uItemCombo;

type
  Tfrm_relatorios_cp = class(TForm)
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
    lblFornecedor: TLabel;
    btnCodigoAluno: TSpeedButton;
    txtTurma: TEdit;
    txtCurso: TEdit;
    txtFornecedor: TEdit;
    popTurmas: TPopupMenu;
    lbDepartamento: TLabel;
    txtDepartamento: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    lblPlanoConta: TLabel;
    lblCentroCusto: TLabel;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    txtPlanoConta: TEdit;
    txtCentroCusto: TEdit;
    sbPropriedades: TSpeedButton;
    btnFechar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPlanoContas: TSpeedButton;
    btnCentroCusto: TSpeedButton;
    lblContaCaixa: TLabel;
    txtContaCaixa: TEdit;
    btnContaCaixa: TSpeedButton;
    lblData: TLabel;
    ckDtFiltrar: TCheckBox;
    lbFormaPgto: TLabel;
    txtFormaPgto: TEdit;
    btnFormaPgto: TSpeedButton;
    sbPreencherVariaveis: TSpeedButton;
    cbUnidadeEnsino: TUMComboBox;
    Label1: TLabel;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    procedure cbUnidadeEnsinoCloseUp(Sender: TObject);
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPreencherVariaveisClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFormaPgtoClick(Sender: TObject);
    procedure btnContaCaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure MyClick(Sender:TObject);
    procedure TreeClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPropriedadesClick(Sender: TObject);
    procedure btnPlanoContasClick(Sender: TObject);
    procedure btnCentroCustoClick(Sender: TObject);
  strict private
    stGrupos: TObjectList;

    procedure CarregarColigadas();
    function isGrupoPai(selecionado: String): Boolean;
  private
    { Private declarations }
    {Function troca_acendo(valor : string) : string;}
  public
    { Public declarations }
    Modulo: Smallint;
    CamposAdicionaisRelatorio: TStringList;
    
    bDeptoObrigar, bCursoObrigar, bTurmaObrigar, bPessoaObrigar : boolean;

    Function validarCampos : Boolean;
  end;

var
  frm_relatorios_cp: Tfrm_relatorios_cp;

implementation

uses
   uDM, uFSelecionarTurma, Main, uFSelecionarDepartamento, uFSelecionarCurso, Math,
   MaskUtils, uSelConta, uSelCentro, uSelCaixa, uSelFormaPgto,
   uRelatorios_adicional, uColigada, uListaColigadas;

{$R *.DFM}

procedure Tfrm_relatorios_cp.FormShow(Sender: TObject);
var
  i:Integer;
  str1: String;
  treeNode : TTreeNode;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  umdtInicial.Date := DataHoje;
  umdtFinal.Date := DataHoje;

  stGrupos := TObjectList.Create;

  lblAnoSemestre.Visible := DM.UsaAnosemestre;
  txtAnoSemestre.Visible := DM.UsaAnosemestre;
  UpDown1.Visible := DM.UsaAnosemestre;

  txtDepartamento.Clear;
  txtCurso.Clear;
  txtTurma.Clear;
  txtFornecedor.Clear;
  txtPlanoConta.Clear;
  txtCentroCusto.Clear;

  CarregarColigadas();

  txtAnoSemestre.text := IntToStr(ano_semestre);

  { Adicionar os Relatório na Árvore }
  qRelatorios.SQL.Clear;
  qRelatorios.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
  if Modulo = 3 then
  begin
     qRelatorios.ParamByName('DS_CHAVE').AsString := 'Impressao.Gerencial';
     qRelatorios.ParamByName('CD_MODULO1').AsInteger := 3;
     qRelatorios.ParamByName('CD_MODULO2').AsInteger := 5;
  end
  else if Modulo = 4 then
  begin
     qRelatorios.ParamByName('DS_CHAVE').AsString := 'Impressao.CP';
     qRelatorios.ParamByName('CD_MODULO1').AsInteger := 4;
     qRelatorios.ParamByName('CD_MODULO2').AsInteger := 4;
  end;
//  qRelatorios.SQL.Clear;
//  qRelatorios.SQL.Add(' Select * from Relatorios where ' );
//  qRelatorios.SQL.Add(' sn_disponivel = ''S'' and (');
//  op := '';
//
//  if PasswordDlg.Autorizar( 2048, taAcessar, False ) then
//  Begin
//     qRelatorios.SQL.Add(' cd_modulo = 4 ');
//     op := ' OR ';
//  End;
//
//  if PasswordDlg.Autorizar( 2025, taAcessar, False ) then
//  Begin
//     qRelatorios.SQL.Add( op + ' cd_modulo = 5 ');
//  End;
//

  qRelatorios.Open;

  stGrupos.Add(
    TItemCombo.Create('1', qRelatorios.FieldByName('ds_grupo').AsString)
  );

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

      stGrupos.Add(
        TItemCombo.Create('1', qRelatorios.FieldByName('ds_grupo').AsString)
      );
    end;

    treeNode := Tree.Items.AddChild( Tree.Items[i], qRelatorios.FieldByName('nm_relatorio').AsString );

    treeNode.ImageIndex := 1;

    qRelatorios.Next;

  end;

  Tree.FullCollapse;


end;


function Tfrm_relatorios_cp.isGrupoPai(selecionado: String): Boolean;
var
  i: Integer;
begin
  Result := False;

  for I := 0 to stGrupos.count -1 do
  begin
    if TItemCombo(stGrupos.Items[i]).descricao = selecionado then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure Tfrm_relatorios_cp.UpDown1Click(Sender: TObject;
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


function Tfrm_relatorios_cp.validarCampos: Boolean;
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

   if bPessoaObrigar AND (trim(txtFornecedor.Text) = '') then begin
      sMsgValida :=  sMsgValida + #13 + '-Código Fornecedor';
      bValidou   := true;
   end;

   if bValidou then
   begin
      result := true;
      Mensagem(sMsgValida,'Preenchimento de campos',MB_OK+MB_ICONEXCLAMATION);
   end;
end;

procedure Tfrm_relatorios_cp.btnCodigoCursoClick(Sender: TObject);
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

procedure Tfrm_relatorios_cp.btnCodigoTurmaClick(Sender: TObject);
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

procedure Tfrm_relatorios_cp.MyClick(Sender:TObject);
begin
  txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;


procedure Tfrm_relatorios_cp.TreeClick(Sender: TObject);
var
  xField : String;
  xFormula : String;
  atual, anterior, ds_grupo : String;
  isPai: boolean;
begin
  isPai := isGrupoPai(Tree.Selected.Text);

  if not isPai then
  begin
    ds_grupo := Tree.Selected.Parent.Text;
  end;

  //Verifica se esta vendo um relatório com o mesmo nome da pasta/nó pai da Treeview;
  try

     if Tree.Selected.Parent.Text = Tree.Selected.Text then
     begin
        ds_grupo := Tree.Selected.Text;
     end;

  except
     //Não possui registro pai para acessar, ignora acess violation.
     ds_grupo := '';
  end;

  if not qRelatorios.Locate('ds_grupo;nm_relatorio',VarArrayOf([ds_grupo, Tree.Selected.Text]), [loCaseInsensitive]) Then
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
      txtFornecedor.Enabled := False;
      lblFornecedor.Enabled := False;
      btnCodigoAluno.Enabled := False;
      txtPlanoConta.Enabled := False;
      lblPlanoConta.Enabled := False;
      txtCentroCusto.Enabled := False;
      lblCentroCusto.Enabled := False;
      umdtInicial.Enabled := False;
      umdtFinal.Enabled := False;
      Label1.Enabled := false;
      cbUnidadeEnsino.Enabled := false;

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

  txtAnoSemestre.Enabled := (Pos('anosemestre', xField) > 0) OR (Pos('[nr_anosem]', lowercase(xFormula)) >0 );;
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;
  UpDown1.Enabled := txtAnoSemestre.Enabled;
  
  txtDepartamento.Enabled := (Pos('depto', xField) > 0) OR (Pos('[cd_depto]', xFormula) > 0);
  lbDepartamento.Enabled := txtDepartamento.Enabled;
  btnCodigoDepartamento.Enabled := txtDepartamento.Enabled;
  bDeptoObrigar := Pos('?.depto', xField) > 0;

  txtCurso.Enabled := (Pos('curso', xField) > 0)  OR (Pos('[cd_curso]', xFormula) > 0);
  lblCurso.Enabled := txtCurso.Enabled;
  btnCodigoCurso.Enabled := txtCurso.Enabled;
  bCursoObrigar := Pos('?.curso', xField) > 0;

  txtTurma.Enabled := ( Pos('turma', xField) > 0  ) OR (Pos('[cd_turma]', xFormula) > 0);  
  lblTurma.Enabled := txtTurma.Enabled;
  btnCodigoTurma.Enabled := Pos('turma', xField) > 0;
  bTurmaObrigar := Pos('?.turma', xField) > 0;

  txtFornecedor.Enabled := (Pos('codigoaluno', xField) > 0) or (Pos('cd_pessoa', xField) > 0)  OR (Pos('[cd_pessoa]', xFormula) > 0);
  lblFornecedor.Enabled := txtFornecedor.Enabled;
  btnCodigoAluno.Enabled := txtFornecedor.Enabled;
  bPessoaObrigar := (Pos('?.codigoaluno', xField) > 0) or (Pos('?.cd_pessoa', xField) > 0);

  txtPlanoConta.Enabled := (Pos('cd_conta', xField) > 0) OR (Pos('conta', xFormula) > 0)  OR (Pos('[cd_conta]', xFormula) > 0);
  lblPlanoConta.Enabled := txtPlanoConta.Enabled;
  btnPlanoContas.Enabled := txtPlanoConta.Enabled;

  txtCentroCusto.Enabled := (Pos('centro', xField) > 0) OR (Pos('centro', xFormula) > 0)  OR (Pos('[cd_centro]', xFormula) > 0);
  lblCentroCusto.Enabled := txtCentroCusto.Enabled;
  btnCentroCusto.Enabled := txtCentroCusto.Enabled;

  txtContaCaixa.Enabled := (Pos('cd_caixa', xField) > 0) or (Pos('cd_conta_banco', xField) > 0)  OR (Pos('[cd_caixa]', xFormula) > 0);
  lblContaCaixa.Enabled := txtContaCaixa.Enabled;
  btnContaCaixa.Enabled := txtContaCaixa.Enabled;

  txtFormaPgto.Enabled := (Pos('cd_forma_pgto', xField) > 0)  OR (Pos('[cd_forma_pgto]', xFormula) > 0);
  lbFormaPgto.Enabled := txtFormaPgto.Enabled;
  btnFormaPgto.Enabled := txtFormaPgto.Enabled;

  cbUnidadeEnsino.Enabled := Pos('.cd_coligada', xField) > 0;
  Label1.Enabled := cbUnidadeEnsino.Enabled;

  umdtInicial.Enabled := (Pos('data', xField) > 0) or (Pos('dt_', xField) > 0) or (Pos('dt_', xformula) > 0) or (Pos('data', xFormula) > 0);
  lblDataInicial.Enabled := umdtInicial.Enabled;
  ckDtFiltrar.Enabled := umdtInicial.Enabled;
  ckDtFiltrar.Checked := umdtInicial.Enabled;
  umdtFinal.Enabled := umdtInicial.Enabled;
  lblDataFinal.Enabled := umdtInicial.Enabled;

end;


procedure Tfrm_relatorios_cp.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_relatorios_cp.btnImprimirClick(Sender: TObject);
const
   SQL_BUSCA_DESCRICAO_DEPTO =
      ' SELECT '+
	   '   GROUP_CONCAT(descricao) AS descricao '+
      ' FROM '+
	   '    departamentos '+
      ' WHERE '+
	   '    codigo IN (%s) ';
var
  sArqRelatorio: string;
  sFSelecao: string;
  sFGrupo: string;
  slFormulas: TStringList;
  slSQLExp : TStringList;
  slOrdem, SLParametros: TStringList;
  pAtual: string;
  pAtual_Aux: string;
  pCampo: string;
  sFiltroShow: string;
  sFiltro: string;
  sAux: string;
  sParametros, S: string;
  wDia, wMes, wAno : Word;
  i, iNum: Integer;
  bAux: boolean;
  qyDelete : TUMZQuery;
  PodeExportar : Boolean;

  qryBuscaDescricaoDepartamentos: TUMZReadOnlyQuery;
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

   //paremetros
   sParametros := LowerCase(qRelatorios.FieldByName('ds_parametros').AsString); //Matriculas.AnoSemestre;Matriculas.Turma;

   sFiltroShow := '';

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

   if txtFornecedor.Enabled and (txtFornecedor.Text <> '') then
   begin
      SLParametros.Values['.cd_pessoa'] := txtFornecedor.Text;
   end;

   if txtPlanoConta.Enabled and (txtPlanoConta.Text <> '') then
   begin
      SLParametros.Values['.cd_conta'] := txtPlanoConta.Text;
   end;

   if txtCentroCusto.Enabled and (txtCentroCusto.Text <> '') then
   begin
      SLParametros.Values['.centro'] := txtCentroCusto.Text;
   end;

   if txtContaCaixa.Enabled and (txtContaCaixa.Text <> '') then
   begin
      SLParametros.Values['.cd_caixa'] := txtContaCaixa.Text;
   end;

   if txtFormaPgto.Enabled and (txtFormaPgto.Text <> '') then
   begin
      SLParametros.Values['.cd_forma_pgto'] := txtFormaPgto.Text;
   end;

   if ckDtFiltrar.Checked then
   begin
      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(umdtInicial.Date),
         MonthOf(umdtInicial.Date),
         DayOf(umdtInicial.Date),
         HourOf(umdtInicial.Date),
         MinuteOf(umdtInicial.Date),
         SecondOf(umdtInicial.Date)
      ]);
      SLParametros.Values['.dataInicio'] := S;
      SLParametros.Values['dataInicio'] := S;

      S := Format('%d,%d,%d %d:%d:%d', [
         YearOf(umdtFinal.Date),
         MonthOf(umdtFinal.Date),
         DayOf(umdtFinal.Date),
         HourOf(umdtFinal.Date),
         MinuteOf(umdtFinal.Date),
         SecondOf(umdtFinal.Date)
      ]);
      SLParametros.Values['.dataFim'] := S;
      SLParametros.Values['dataFim'] := S;
   end;

   while (Length(Trim(sParametros)) > 1) do begin

      pAtual := Copy(sParametros, 1, Pos(';', sParametros) - 1);
      pCampo := Copy(pAtual, Pos('.', pAtual) + 1, Length(pAtual));
      sParametros := Copy(sParametros, Pos(';', sParametros)+1, Length(sParametros));

      // Verificar qual é o parâmetro
      if (Pos('anosemestre', pCampo) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;
         sFiltro := sFiltro + sAux + pAtual + ' = ' + txtAnoSemestre.Text;
         sFiltroShow := sFiltroShow + '"ANO/SEMESTRE = ' + txtAnoSemestre.Text + '" + CHR(13) + ';
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

      if (Pos('.depto', pAtual) > 0) then
      begin
         if (txtDepartamento.Text <> '') then
         begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + txtDepartamento.Text+']'  ;

            // Pegar o Nome do Depto
            DM.CriarConsulta(qryBuscaDescricaoDepartamentos);
            
            qryBuscaDescricaoDepartamentos.SQL.Text := Format(SQL_BUSCA_DESCRICAO_DEPTO, [txtDepartamento.Text]);
            qryBuscaDescricaoDepartamentos.Open;
            
            sFiltroShow := sFiltroShow + '"DEPARTAMENTO = ' + qryBuscaDescricaoDepartamentos.FieldByName('descricao').AsString + '" + CHR(13) + ';
            FreeAndNil(qryBuscaDescricaoDepartamentos);
            // Pegar o Nome do Depto

            sFiltro := sFiltro + sAux + pAtual + ' IN (' + txtDepartamento.Text+')';
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
         if (txtFornecedor.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtFornecedor.Text;
            sFiltro := sFiltro + sAux + pAtual + ' = ' + txtFornecedor.Text;
            sFiltroShow := sFiltroShow + '"FORNECEDOR = ' + txtFornecedor.Text + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if (Pos('cd_conta', pCampo) > 0) OR ((Pos('conta', pCampo) > 0)) then begin
         if (txtPlanoConta.Text <> '') then begin
            if Pos('class', pCampo) > 0 then begin
                sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + txtPlanoConta.text + '"'; ;
                sFiltro := sFiltro + sAux + pAtual + ' = "' + txtPlanoConta.text + '"';
            end else begin
                sFSelecao := sFSelecao + sAux + '{' + pAtual +'} IN [' + txtPlanoConta.text +']' ;
                sFiltro := sFiltro + sAux + pAtual + ' IN (' + txtPlanoConta.text + ')';
            end;
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"CONTA = ' + txtPlanoConta.Text + '" + CHR(13) + ';
         end;
      end;

      if (Pos('cd_centro', pCampo) > 0) OR ((Pos('centro', pCampo) > 0)) then begin
         if (txtCentroCusto.Text <> '') then begin
            if Pos('class', pCampo) > 0 then begin
               sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + txtCentroCusto.text + '"';
               sFiltro := sFiltro + sAux + pAtual + ' = "' + txtCentroCusto.text + '"';
            end else begin
               sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtCentroCusto.text;
               sFiltro := sFiltro + sAux + pAtual + ' = ' + txtCentroCusto.text;
            end;
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"CENTRO DE CUSTO = ' + txtCentroCusto.Text + '" + CHR(13) + ';
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

      if (Pos('cd_forma_pgto', pCampo) > 0) then begin
         if (txtFormaPgto.Text <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtFormaPgto.text;
            sFiltro := sFiltro + sAux + pAtual + ' = ' + txtFormaPgto.text;
            sAux := ' and ';
            sFiltroShow := sFiltroShow + '"FORMA DE PAGTO = ' + txtFormaPgto.Text + '" + CHR(13) + ';
         end;
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

           DecodeDate(umdtInicial.Date, wAno, wMes, wDia);

           sFSelecao := sFSelecao + sAux + '( {' + pAtual +'} >= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + '';

           sFiltro := sFiltro + sAux + '( ' + pAtual + ' >= ''' + FormatDateTime( 'yyyy-mm-dd', umdtInicial.Date ) + '''';
           sAux := ' and ';

           DecodeDate(umdtFinal.Date, wAno, wMes, wDia);

           sFSelecao := sFSelecao + sAux + '{' + pAtual +'} <= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ' + ' )';

           sFiltro := sFiltro + sAux + pAtual + ' <= ''' + FormatDateTime( 'yyyy-mm-dd', umdtFinal.Date ) + ''')';
           pAtual := pAtual_Aux;
           sAux := ' or ';

        end;

        sFSelecao := sFSelecao +  ' ) ';
        sFiltro := sFiltro +  ' ) ';

        if (Pos('vencimento', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"VENCIMENTO = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';
        if (Pos('pagamento', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA PGTO = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';
        if (Pos('cheque_data', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA CHEQUE = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';
        if (Pos('abertura', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA DE ABERTURA = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';
        if (Pos('provavel', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"PROVÁVEL PGTO = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';
        if (Pos('emissao', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"EMISSÃO DA NOTA = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';
        if (Pos('dt_', pCampo) > 0) then
              sFiltroShow := sFiltroShow + '"DATA = DE ' + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date ) + '" + CHR(13) + ';

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
            sFiltroShow := sFiltroShow + '"U.E. = ' + cbUnidadeEnsino.Text + '" + CHR(13) + ';
         end;
      end;


   end; // Fim do While dos Parâmetros

   sFiltroShow := sFiltroShow + '" "';

   //especial
   if Trim(qRelatorios.FieldByName('ds_Especial').AsString) <> '' then begin
      sFSelecao := sFSelecao + sAux + qRelatorios.FieldByName('ds_Especial').AsString;
   end;

   //formulas
   slFormulas := TStringList.Create();

   sAux := qRelatorios.FieldByName('ds_Formula').AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slFormulas);

      for i := 0 to (slFormulas.Count - 1) do begin

         sAux := slFormulas.ValueFromIndex[i];

         //processa formulas
          if (sAux = '[centro]') then begin
             slFormulas.ValueFromIndex[i] := '"' + txtCentroCusto.Text + '"';
          end;
          if (sAux = '[conta]') then begin
             slFormulas.ValueFromIndex[i] := '"' + txtPlanoConta.Text + '"';
          end;
          if (sAux = '[data_inicio]') then begin
             DecodeDate(umdtInicial.Date, wAno, wMes, wDia);
             slFormulas.ValueFromIndex[i] := 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
          end
          else if (sAux = '[data_fim]') then begin
            DecodeDate(umdtFinal.Date, wAno, wMes, wDia);
            slFormulas.ValueFromIndex[i] :=  'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
          end
          else if (sAux = '[nm_coligada]') then begin
              slFormulas.ValueFromIndex[i] := '"' + DM.sColigadaSelecionada + '"';
          end
          else if (sAux = '[nm_coligada_razao]') then begin
              slFormulas.ValueFromIndex[i] := '"' + DM.sColigadaSelecionadaRazao + '"';
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
          else if (sAux = '[cd_centro]') then begin
            if txtCentroCusto.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtCentroCusto.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
          end
          else if (sAux = '[cd_conta]') then begin
            if txtPlanoConta.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtPlanoConta.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
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
            if txtFornecedor.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtFornecedor.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
          end
          else if (sAux = '[cd_forma_pgto]') then begin
            if txtFormaPgto.Text <> '' then
               slFormulas.ValueFromIndex[i] := trim(txtFormaPgto.Text)
            else
               slFormulas.Strings[i] := '_SEM_PARAMETRO_="_SEM_PARAMETRO_"';
          end
          else if ( sAux = '[usuario]' ) then
          begin
            slFormulas.ValueFromIndex[i] := IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo);
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
          if (Pos('[centro]', sAux) >0 ) then begin
             sAux := ReplaceStr(sAux,'[centro]', '''' + txtCentroCusto.Text + '''');
          end;
          if (Pos('[conta]', sAux) >0 ) then begin
             sAux := ReplaceStr(sAux,'[conta]', '''' + txtPlanoConta.Text + '''');
          end;
          if (Pos('[data_inicio]', sAux) > 0 ) then begin
             sAux := ReplaceStr(sAux, '[data_inicio]', ''''+ FormatDateTime('yyyy-mm-dd', umdtInicial.Date) + '''');
          end;
          if (Pos('[data_fim]', sAux) > 0 ) then begin
             sAux := ReplaceStr(sAux, '[data_fim]', ''''+ FormatDateTime('yyyy-mm-dd', umdtFinal.Date) + '''');
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
          if (Pos('[cd_caixa]', sAux) > 0 ) then
          begin
             sAux := ReplaceStr(sAux,'[cd_caixa]', txtContaCaixa.Text);
          end;

          if (Pos('[usuario]', sAux) > 0 ) then
          begin
            sAux := ReplaceStr(
                  sAux,
                  '[usuario]',
                  IntToStr( DM.GetUsuarioLogado.Pessoa.Codigo)
             );
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
      slFormulas.Add('ds_filtro=' + sFiltroShow);
   end;

   //Adiciona os campos adicionais do relatório
   for i := 0 to CamposAdicionaisRelatorio.Count - 1 do
   begin
      slFormulas.Add(CamposAdicionaisRelatorio[i]);
   end;

   sAux := '0';

   if (Dm.isTrue(qRelatorios.FieldByName('sn_impressao_numero').AsString))  then begin

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
         if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
            Dm.qAux1.SQL.Add('VALUES (:numero, :relatorio, :pessoa, :cd_usuario, :anosemestre, :turma, TO_DATE(:data_hora, ''YYYY-MM-DD HH24:MI:SS''))')
         else
            Dm.qAux1.SQL.Add('VALUES (:numero, :relatorio, :pessoa, :cd_usuario, :anosemestre, :turma, :data_hora)');
         
         Dm.qAux1.ParamByName('numero').AsInteger     := StrToInt(sAux);
         DM.qAux1.ParamByName('relatorio').AsInteger  := qRelatorios.FieldByName('cd_relatorio').AsInteger;
         DM.qAux1.ParamByName('pessoa').AsString      := txtFornecedor.Text;
         DM.qAux1.ParamByName('cd_usuario').AsInteger  := dm.iCdPessoaLogado;
         DM.qAux1.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
         DM.qAux1.ParamByName('turma').AsString       := txtTurma.Text;
         DM.qAux1.ParamByName('data_hora').AsString   := FormatDateTime('yyyy-mm-dd hh:MM:ss', DM.DataAtual());
         DM.qAux1.ExecSQL;

   End;

   if qRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 1 then
      PodeExportar := True
   else if qRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 0 then
      PodeExportar := False;

   bAux := PrincipalForm.ImprimeRpt(Self, sArqRelatorio + '.rpt', qRelatorios.FieldByName('cd_cabecalho').AsInteger, sFSelecao,
      sFGrupo, slFormulas, slOrdem, nil, slSQLExp, True, False, SLParametros, PodeExportar);

   if (not bAux) AND (Dm.isTrue(qRelatorios.FieldByName('sn_impressao_numero').AsString)) then
   begin

      Dm.CriarConsulta(qyDelete);
      qyDelete.SQL.Clear;
      qyDelete.SQL.Add('DELETE FROM relatorios_impressos WHERE nr_impresso = :numero AND cd_relatorio = :relatorio AND cd_pessoa = :pessoa AND ');
      qyDelete.SQL.Add('cd_usuario =  :cd_usuario AND anosemestre = :anosemestre AND turma = :turma ');

      qyDelete.ParamByName('numero').AsInteger     := StrToInt(sAux);
      qyDelete.ParamByName('relatorio').AsInteger  := qRelatorios.FieldByName('cd_relatorio').AsInteger;
      qyDelete.ParamByName('pessoa').AsString      := txtFornecedor.Text;
      qyDelete.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
      qyDelete.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
      qyDelete.ParamByName('turma').AsString       := txtTurma.Text;
      qyDelete.ExecSQL;

      FreeAndNil(qyDelete);

   end;

end;

procedure Tfrm_relatorios_cp.btnCodigoAlunoClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
  { Pesquisar Aluno }

   resultado := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

   if resultado.filtrado then
   Begin
      txtFornecedor.Text := IntToStr(resultado.cd_pessoa);
   End
   else
   begin
      Exit;
   end;
end;

procedure Tfrm_relatorios_cp.btnCodigoDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;

   separador: String;

   i: Integer;
begin
   if (cbUnidadeEnsino.Enabled) and (cbUnidadeEnsino.ItemIndex > 0) then
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([bfdSelecaoMultipla],
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
      );
   end
   else
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([bfdSelecaoMultipla]);
   end;

   separador := '';

   if (resultado_filtro.filtrado) Then
   begin
      txtDepartamento.Text := '';

      for i := 0 to Length(resultado_filtro.arrDepartamentos) - 1 do
      begin
         txtDepartamento.Text := txtDepartamento.Text +
                                 separador +
                                 IntToStr(resultado_filtro.arrDepartamentos[i].cd_departamento);

         separador := ', ';                                    
      end;

      txtCurso.Text := '';
      txtTurma.Text := '';

      if Length(resultado_filtro.arrDepartamentos) = 1 then
      begin
         DM.LocalizaColigada(cbUnidadeEnsino, resultado_filtro.arrDepartamentos[0].cd_coligada);
      end;
   end;
end;

procedure Tfrm_relatorios_cp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CamposAdicionaisRelatorio.Free;
  Action := caFree;
end;

procedure Tfrm_relatorios_cp.FormCreate(Sender: TObject);
begin
   CamposAdicionaisRelatorio := TStringList.Create();
end;

procedure Tfrm_relatorios_cp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure Tfrm_relatorios_cp.sbPreencherVariaveisClick(Sender: TObject);
begin
   { Apresentar a tela de campos adicionais }
   Application.CreateForm(Tfrm_relatorios_adicional, frm_relatorios_adicional);

   qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

   frm_relatorios_adicional.tela := 'financeiro_conta_pg-gerenciais';
   frm_relatorios_adicional.carregar_campos(qRelatorios.FieldByName('cd_relatorio').AsInteger);

   FreeAndNil(frm_relatorios_adicional);
end;

procedure Tfrm_relatorios_cp.sbPropriedadesClick(Sender: TObject);
begin
    //Mostra a Janela de configuracao da impressora
    PrincipalForm.getRelatorio().Printer.Prompt();
    PrincipalForm.GetRelatorio().Printer.SetCurrent();
end;

procedure Tfrm_relatorios_cp.btnPlanoContasClick(Sender: TObject);
Var
   sFiltro,
   sOp : String;
   i : Integer;
begin
  // Seleção de Plano de Contas


  // Verificar se deve apresentar o MultSelect ou não.
  // Se o retorno for o cd_conta então terá o multiselect. Se o retorno for o cd_classificação não terá 
  if (Pos('conta_classificacao', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) OR
     (Pos('conta_classificacao', lowercase(qRelatorios.FieldByName('ds_formula').AsString)) > 0) OR
     (Pos('[conta]', lowercase(qRelatorios.FieldByName('ds_formula').AsString)) > 0)
     then begin

      frm_SelConta.grd.Options := frm_SelConta.grd.Options - [dgMultiSelect];

  end else begin

      frm_SelConta.grd.Options := frm_SelConta.grd.Options + [dgMultiSelect];

  end;

  frm_SelConta.buscaTudo := True;
  frm_SelConta.ShowModal;

   sFiltro := '';
   sOp := '';

  if frm_SelConta.flgSearch then begin

       if (Pos('conta_classificacao', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) OR
          (Pos('conta_classificacao', lowercase(qRelatorios.FieldByName('ds_formula').AsString)) > 0) OR
          (Pos('[conta]', lowercase(qRelatorios.FieldByName('ds_formula').AsString)) > 0)
          then begin

          sFiltro := frm_SelConta.qyPlanosContascd_classificacao.AsString;

       end else begin

         for i := 0 to frm_SelConta.grd.SelectedRows.Count - 1 do begin
            frm_SelConta.grd.DataSource.DataSet.GotoBookmark(Pointer(frm_SelConta.grd.SelectedRows.Items[i]));

            sFiltro := sFiltro + sOp + frm_SelConta.qyPlanosContascd_conta.AsString;
            sOp := ', ';

         end;

       end;

     txtPlanoConta.Text := sFiltro;

  end;
end;


procedure Tfrm_relatorios_cp.CarregarColigadas;
begin
   DM.CarregaColigadas(cbUnidadeEnsino, true);
end;

procedure Tfrm_relatorios_cp.cbUnidadeEnsinoChange(Sender: TObject);
begin
   txtDepartamento.Text := '';
   txtCurso.Text := '';
   txtTurma.Text := '';
end;

procedure Tfrm_relatorios_cp.cbUnidadeEnsinoCloseUp(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure Tfrm_relatorios_cp.btnCentroCustoClick(Sender: TObject);
begin
   frm_SelCentro.ShowModal;

   if frm_SelCentro.flgSearch then begin
      if (Pos('centro_classificacao', lowercase(qRelatorios.FieldByName('ds_parametros').AsString)) > 0) OR
         (Pos('centro_classificacao', lowercase(qRelatorios.FieldByName('ds_formula').AsString)) > 0) OR
         (Pos('[centro]', lowercase(qRelatorios.FieldByName('ds_formula').AsString)) > 0)
          then begin
         txtCentroCusto.Text := frm_SelCentro.qyCentroscd_classificacao.AsString;
      end else begin
         txtCentroCusto.Text := frm_SelCentro.qyCentroscd_centro.AsString;
      end;
   end;
end;

procedure Tfrm_relatorios_cp.btnContaCaixaClick(Sender: TObject);
begin
   frm_SelCaixa.ShowModal;

   if frm_SelCaixa.flgSearch then
   begin
      txtContaCaixa.Text := frm_SelCaixa.qyCaixa.FieldByName('cd_caixa').AsString;
   end;
end;

procedure Tfrm_relatorios_cp.btnFormaPgtoClick(Sender: TObject);
begin

  if ( TForm(frmSelFormaPgto) = nil ) then
    Application.CreateForm( TfrmSelFormaPgto, frmSelFormaPgto );
                                                                
  frmSelFormaPgto.ShowModal;

   if frmSelFormaPgto.flgSearch then
   begin
      txtFormaPgto.Text := frmSelFormaPgto.qyFormaPgto.FieldByName('cd_forma_pgto').AsString;
   end;

end;

end.

