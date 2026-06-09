unit uRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, DBTables, StdCtrls, Mask,
  Menus, Buttons, General, DBCtrls, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, uFSelecionarPessoa;

type
  Tfrm_Relatorios = class(TForm)
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
    qRelatoriosnm_relatorio: TStringField;
    qRelatorioscd_modulo: TIntegerField;
    qRelatoriosnm_arquivo: TStringField;
    qRelatoriosds_parametros: TStringField;
    qRelatoriosds_Formula: TStringField;
    qRelatoriosds_ConteudoFormula: TStringField;
    qRelatoriosds_Especial: TStringField;
    lblAnoSemestre: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    qRelatoriosds_grupo: TStringField;
    lblBimestre: TLabel;
    lblCodigoAluno: TLabel;
    btnCodigoAluno: TSpeedButton;
    txtMes: TMaskEdit;
    UpDown2: TUpDown;
    txtCodigoPessoa: TEdit;
    qRelatoriossn_disponivel: TStringField;
    qRelatoriosds_formula_grupo: TStringField;
    qRelatoriosnm_cabecalho: TStringField;
    qRelatoriossn_impressao_numero: TStringField;
    qRelatorioscd_relatorio: TIntegerField;
    sbImprimir: TSpeedButton;
    sbFechar: TSpeedButton;
    sbPropriedades: TSpeedButton;
    lbAtividade: TLabel;
    cbAtividade: TComboBox;
    lblData: TLabel;
    ckDtFiltrar: TCheckBox;
    lblDtInicial: TLabel;
    txtDtInicial: TDateTimePicker;
    lblDtFinal: TLabel;
    txtDtFinal: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoProfessorClick(Sender: TObject);
    procedure TreeClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbImprimirClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPropriedadesClick(Sender: TObject);
    Procedure FiltraAtividades;
  private
    { Private declarations }
  public
    { Public declarations }
    Modulo : Smallint;
  end;

var
  frm_Relatorios: Tfrm_Relatorios;
  cd_atividades: array[0..30] of integer;

implementation

uses uDM, Main, StdConvs;

{$R *.DFM}

procedure Tfrm_Relatorios.FormShow(Sender: TObject);
var
  i:Integer;
  str1: String;
  treeNode : TTreeNode;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  txtCodigoPessoa.Clear;

  { Montar o TreeView }

  txtAnoSemestre.text := IntToStr(ano_semestre);
  FiltraAtividades;

  { Adicionar os Relatório na Árvore }
  qRelatorios.Close;
  qRelatorios.ParamByName('modulo').ASInteger := modulo;
  qrelatorios.Open;

  Tree.Items.Clear;

  Tree.Items.Add( Tree.TopItem, qRelatoriosds_Grupo.AsString );

  i := Tree.Items.Count - 1;

  str1 := qRelatoriosds_grupo.AsString;

  while not qRelatorios.Eof do
  begin

    if qRelatoriosds_grupo.AsString <> str1 then
    begin
      Tree.Items.Add( Tree.TopItem, qRelatoriosds_grupo.AsString );
      str1 := qRelatoriosds_grupo.AsString;
      i := Tree.Items.Count - 1;
    end;

    treeNode := Tree.Items.AddChild( Tree.Items[i], qRelatoriosnm_relatorio.AsString );

    treeNode.ImageIndex := 1;
    
    qRelatorios.Next;
    
  end;

  Tree.FullCollapse;

end;


procedure Tfrm_Relatorios.UpDown1Click(Sender: TObject;
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


procedure Tfrm_Relatorios.btnCodigoProfessorClick(Sender: TObject);
var
   res: TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }

   res  := TfrmSelecionarPessoa.Filtrar([]);

   if res.filtrado then
   begin
      txtCodigoPessoa.Text := IntToStr(res.cd_pessoa);
   end
   else
   begin
      Exit;
   end;
end;

procedure Tfrm_Relatorios.TreeClick(Sender: TObject);
var
  xField : String;
begin

  if not qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]) Then
  Begin
      { Não existe o relatório, desabilitar tudo }
      lblAnoSemestre.Enabled := False;
      txtAnoSemestre.Enabled := False;
      txtMes.Enabled := False;
      lblBimestre.Enabled := False;
      txtCodigoPessoa.Enabled := False;
      lblCodigoAluno.Enabled := False;
      btnCodigoAluno.Enabled := False;
      cbAtividade.Enabled := False;
      lbAtividade.Enabled := False;
      lblData.Enabled := False;
      ckDtFiltrar.Enabled := False;
      lblDtInicial.Enabled := False;
      lblDtFinal.Enabled := False;
      txtDtInicial.Enabled := False;
      txtDtFinal.Enabled := False;

      sbImprimir.Enabled := False;
      Exit;
  End;

  sbImprimir.Enabled := True;


  xField := lowercase(qRelatoriosds_parametros.AsString);

  { Verificar os Parametros que tem que ficar ligados }

  txtAnoSemestre.Enabled := Pos('.nr_anosemestre', xField) > 0;
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;

  txtMes.Enabled := Pos('.nr_mes', xField) > 0;
  lblBimestre.Enabled := txtMes.Enabled;

  cbAtividade.Enabled := Pos('.cd_atividade', xField) > 0;
  lbAtividade.Enabled := cbAtividade.Enabled;

  txtCodigoPessoa.Enabled := (Pos('.cd_pessoa', xField) > 0);
  lblCodigoAluno.Enabled := txtCodigoPessoa.Enabled;
  btnCodigoAluno.Enabled := (Pos('.cd_pessoa', xField) > 0);

  ckDtFiltrar.Enabled := (Pos('.dt_', xField) > 0);
  lblData.Enabled := ckDtFiltrar.Enabled;

  txtDtInicial.Enabled := (Pos('.dt_', xField) > 0);
  lblDtInicial.Enabled := txtDtInicial.Enabled;

  txtDtFinal.Enabled := (Pos('.dt_', xField) > 0);
  lblDtFinal.Enabled := txtDtFinal.Enabled;

end;


procedure Tfrm_Relatorios.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Relatorios.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
var
  intMes : Integer;
begin
  { Incremento do Mês }
  intMes := StrToInt(txtMes.Text);

  if Button = btNext then
  begin
    Inc( intMes );
  end
  else
  begin
    Dec( intMes );
  end;

  txtMes.Text := IntToStr( intMes );
end;


procedure Tfrm_Relatorios.btnCodigoAlunoClick(Sender: TObject);
var
   res: TResultadoFiltroPessoa;
begin
  { Pesquisar Pessoa }

   res := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if res.filtrado then
   begin
      txtCodigoPessoa.Text := IntToStr(res.cd_pessoa);
      
      try
         txtAnoSemestre.Text := IntToStr(res.nr_anosemestre);
      except
      end;
   end
   else
   begin
      Exit;
   end;
end;

procedure Tfrm_Relatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{ Teclas de atalho }
begin

  case Key of
      VK_F7 : sbImprimirClick( nil );
      VK_F12: sbFecharClick( nil );
  end;

end;

procedure Tfrm_Relatorios.sbImprimirClick(Sender: TObject);
var
  str: String;
  SFormula : String;
  NomeRel : String;
  Formula : ARRAY of String;
  Valores : ARRAY of String;
  xField : String;

  Parametros : String;
  pAtual, pAtual_Aux, pCampo : String;

  resposta : boolean;
  nro_impresso : Integer;
  nro_str : String;
  filtro_show : string;

  strFor : String;

  op : String;

begin


//    SetLength(Valores, 1);

    qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

    xField := qRelatoriosnm_arquivo.AsString;

    if Trim(xField) = '' Then Exit;

    SFormula := '';
    op := '';

    Parametros :=  LowerCase(qRelatoriosds_parametros.AsString); //Matriculas.AnoSemestre;Matriculas.Turma;

    while Length(Trim(Parametros)) > 1 do Begin

	  pAtual := Copy(Parametros, 1, Pos(';', Parametros) - 1);
    pCampo := Copy(pAtual, Pos('.', pAtual) + 1, Length(pAtual));
	  Parametros := Copy(PArametros, Pos(';', Parametros)+1, Length(parametros));

	  { Verificar qual é o parâmetro }

	  if Pos('.anosemestre', pAtual) > 0 Then
	  Begin
	      SFormula := SFormula + op + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;

        filtro_show := filtro_show + '"ANO/SEMESTRE = ' + txtAnoSemestre.Text + '" + CHR(13) + ';

	      op := ' and ';
	  End;

	  if  Pos('.nr_mes', pAtual) > 0 Then
	  Begin
	      SFormula := SFormula + op + '{' + pAtual +'} = ' + txtMes.Text ;

        filtro_show := filtro_show + '"MÊS = ' + txtMes.Text + '" + CHR(13) + ';

	      op := ' and ';
	  End;

	  if (Pos('.cd_atividade', pAtual) > 0) Then
	  Begin
	      if cbAtividade.ItemIndex >= 0 Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = ' + IntToStr(cd_atividades[cbAtividade.ItemIndex]);

           filtro_show := filtro_show + '"ATIVIDADE = ' + IntToStr(cd_atividades[cbAtividade.ItemIndex]) + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;

	  if (Pos('.cd_pessoa', pAtual) > 0) Then
	  Begin
	      if txtCodigoPessoa.Text <> '' Then
	      Begin
           SFormula := SFormula + op + '{' + pAtual +'} = ' + txtCodigoPessoa.Text;

           filtro_show := filtro_show + '"PESSOA = ' + txtCodigoPessoa.Text + '" + CHR(13) + ';

           op := ' and ';
	      End;
	  End;

	  if (Pos('data', pAtual) > 0) or (Pos('dt_', pAtual) > 0)Then
	  Begin
        if ckDtFiltrar.Checked = true then
          begin
       	   SFormula := SFormula + op + ' ( ';

           op := '';

           while length(pAtual) > 0 do
           begin

           if Pos(' or ',pAtual) > 0 then
           Begin
              pAtual_Aux := Copy(pAtual, Pos(' or ', pAtual) + 4, length(pAtual));
              pAtual := Copy(pAtual, 1, Pos(' or ',pAtual) - 1);
           End
           else
              pAtual_Aux := '';

           SFormula := SFormula + op + '(ToText({' + pAtual +'}, "yyyyMMdd") >= "' + FormatDateTime( 'yyyymmdd', txtDtInicial.Date ) + '"';
           op := ' and ';

    	     SFormula := SFormula + op + 'ToText({' + pAtual +'}, "yyyyMMdd") <= "' + FormatDateTime( 'yyyymmdd', txtDtFinal.Date ) + '")';

           pAtual := pAtual_Aux;

           op := ' or ';

        end;

        SFormula := SFormula +  ' ) ';

        filtro_show := filtro_show + '"DATA  = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDtFinal.Date ) + '" + CHR(13) + ';

        op := ' and ';
       end;
    end;


    End;

    { Fórmulas }
    strFor := qRelatoriosds_Formula.AsString;
    
    while Pos(';', strFor) > 0 do
    Begin
       SetLength(Formula, Length(formula) + 1);

       Formula[Length(formula)-1] := Copy(strFor, 1, pos(';',strFor) - 1 );

       strFor := Copy( strFor, pos(';',strFor) + 1, length(strFor)) ;
    End;

    { Valores da Fórmulas }

    strFor := qRelatoriosds_ConteudoFormula.AsString;

    while Pos(';', strFor) > 0 do
    Begin
       SetLength(Valores, Length(Valores) + 1);
       Valores[Length(Valores)-1] := Copy(strFor, 1, pos(';',strFor) - 1 );

       strFor := Copy( strFor, pos(';',strFor) + 1, length(strFor)) ;
    End;


    if Trim(qRelatoriosds_Especial.AsString) <> '' Then
       SFormula := SFormula + op + qRelatoriosds_Especial.AsString;

   { Imprimir o Relatório }

   resposta := PrincipalForm.PrintRpt(xField + '.rpt', qRelatoriosnm_cabecalho.AsString ,SFormula, qRelatoriosds_formula_grupo.AsString , qRelatoriosnm_relatorio.AsString,'',Formula, Valores, [],True);

   if (Dm.isTrue(qRelatoriossn_impressao_numero.AsString)) and (resposta)
      and (txtCodigoPessoa.Text <> '')
   then
   Begin
      { Criar um novo Número de Impressao }
      try
         nro_impresso :=  StrToInt(DM.variavel_parametro('relatorio_impressao_numero'));
      except
         nro_impresso := 10000;
      end;

      nro_str := IntToStr(nro_impresso);
      //nro_str := Copy(nro_str, 1, length(nro_str) - 1);
      nro_str := Copy(nro_str, 1, length(nro_str));

      nro_impresso := StrToInt(nro_str);
      INC(nro_impresso);

      nro_str := IntToStr(nro_impresso) + DV44(nro_str);

      DM.set_variavel_parametro('relatorio_impressao_numero', nro_str);

   End;

   Exit;


end;

procedure Tfrm_Relatorios.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Relatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Relatorios.sbPropriedadesClick(Sender: TObject);
begin
    //Mostra a Janela de configuracao da impressora
    PrincipalForm.Report.Printer.Prompt();

end;

Procedure Tfrm_Relatorios.FiltraAtividades;
var
  i: integer;
begin

  DM.qyAtividades.Close;
  DM.qyAtividades.ParamByName('nr_anosemestre').AsString := txtAnoSemestre.Text;
  DM.qyAtividades.Open;

  cbAtividade.Items.Clear;
  i := 0;
  while not DM.qyAtividades.Eof do
  begin

    cbAtividade.Items.Add(DM.qyAtividades.FieldByName('ds_atividade').AsString);
    cd_atividades[i] := DM.qyAtividades.FieldByName('cd_atividade').AsInteger;

  DM.qyAtividades.Next;
  i := i + 1;
  end;

end;

end.
