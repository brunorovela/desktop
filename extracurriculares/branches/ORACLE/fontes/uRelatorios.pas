unit uRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, DBTables, StdCtrls, Mask,
  Menus, Buttons, General, DBCtrls, UCrpe32, UCrpeClasses, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, uFSelecionarPessoa;

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
    lblAnoSemestre: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    lbMes: TLabel;
    lblCodigoAluno: TLabel;
    btnCodigoAluno: TSpeedButton;
    UpDown2: TUpDown;
    txtCodigoPessoa: TEdit;
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
    UpDown3: TUpDown;
    lbMesAte: TLabel;
    txtMesInicio: TEdit;
    txtMesFim: TEdit;
    qRelatorios: TUMZQuery;
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
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
  cd_atividades: array[0..100] of integer;

implementation

uses uDM, Main, StdConvs;

{$R *.DFM}

procedure Tfrm_Relatorios.FormShow(Sender: TObject);
var
  i:Integer;
  str1: String;
  treeNode : TTreeNode;
  dia, mes, ano : Word;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  txtCodigoPessoa.Clear;

  { Montar o TreeView }

  txtAnoSemestre.text := IntToStr(ano_semestre);

  txtDtInicial.Date := Date;
  txtDtFinal.Date := Date;

  DecodeDate(DataHoje, ano, mes, dia);

  txtMesInicio.Text := IntToStr(mes);
  txtMesFim.Text := IntToStr(mes);

  FiltraAtividades;

  { Adicionar os Relatório na Árvore }
  qRelatorios.Close;
  qRelatorios.ParamByName('modulo').ASInteger := modulo;
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

  FiltraAtividades();

end;


procedure Tfrm_Relatorios.btnCodigoProfessorClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
  { Pesquisar Aluno }

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.filtrado then
   Begin
      txtCodigoPessoa.Text := IntToStr(resultado.cd_pessoa);
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
      txtMesInicio.Enabled := False;
      txtMesFim.Enabled := False;
      lbMes.Enabled := False;
      lbMesAte.Enabled := False;
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


  xField := lowercase(qRelatorios.FieldByName('ds_parametros').AsString);

  { Verificar os Parametros que tem que ficar ligados }

  txtAnoSemestre.Enabled := Pos('anosemestre', xField) > 0;
  lblAnoSemestre.Enabled := txtAnoSemestre.Enabled;

  txtMesInicio.Enabled := Pos('nr_mes', xField) > 0;
  lbMes.Enabled := txtMesInicio.Enabled;

  txtMesFim.Enabled := Pos('nr_mes', xField) > 0;
  lbMesAte.Enabled := txtMesFim.Enabled;

  cbAtividade.Enabled := Pos('atividade', xField) > 0;
  lbAtividade.Enabled := cbAtividade.Enabled;

  txtCodigoPessoa.Enabled := (Pos('pessoa', xField) > 0);
  lblCodigoAluno.Enabled := txtCodigoPessoa.Enabled;
  btnCodigoAluno.Enabled := (Pos('pessoa', xField) > 0);

  ckDtFiltrar.Enabled := (Pos('dt_', xField) > 0);
  lblData.Enabled := ckDtFiltrar.Enabled;

  txtDtInicial.Enabled := (Pos('dt_', xField) > 0);
  lblDtInicial.Enabled := txtDtInicial.Enabled;

  txtDtFinal.Enabled := (Pos('dt_', xField) > 0);
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
  intMes := StrToInt(txtMesInicio.Text);

  if Button = btNext then
  begin
    Inc( intMes );
  end
  else
  begin
    Dec( intMes );
  end;

  txtMesInicio.Text := IntToStr( intMes );
end;


procedure Tfrm_Relatorios.btnCodigoAlunoClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   { Pesquisar Pessoa }

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.filtrado then
   Begin
      txtCodigoPessoa.Text := IntToStr(resultado.cd_pessoa);
      txtAnoSemestre.Text := IntToStr(resultado.nr_anosemestre);
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
  sArqRelatorio: string;
  sParametros: string;
  sFSelecao: string;
  sFGrupo: string;
  sFiltroShow: string;
  sAux: string;
  pAtual : string;
  slFormulas: TstringList;
  slOrdem: TStringList;
  bAux: Boolean;
  iNum: LongInt;
  sFiltro : String;
  sOp : String;
  pCampo : String;
  pAtual_Aux : String;
  i: Integer;
  wMes, wAno, wDia : Word;

  sSQL : String;

  slSQL : TStringList;

begin

    sFSelecao := '';

    //localiza relatorio na query
    qRelatorios.Locate('nm_relatorio', Tree.Selected.Text, [loCaseInsensitive]);

    //define o arquivo de relatorio
    sArqRelatorio := qRelatorios.FieldByName('nm_arquivo').AsString;
    if (Trim(sArqRelatorio) = '') then begin
       Mensagem('O Relatório não foi selecionado ou é inválido!', '', mrOk);
      Exit;
    end;

    sArqRelatorio := sArqRelatorio + '.rpt';

    //define parametros
    sParametros :=  LowerCase(qRelatorios.FieldByName('ds_parametros').AsString);

   // sFiltro é utilizado para SQL
   if Pos('where', lowercase(qRelatorios.FieldByName('ds_sql').AsString)) > 0 then
       sOp := ' and '
   else
       sOp := ' where ';

   sAux := ' ';
   while (Length(Trim(sParametros)) > 1) do begin


      pAtual := Copy(sParametros, 1, Pos(';', sParametros) - 1);
      pCampo := Copy(pAtual, Pos('.', pAtual) + 1, Length(pAtual));
      sParametros := Copy(sParametros, Pos(';', sParametros)+1, Length(sParametros));

	  { Verificar qual é o parâmetro }

      if (Pos('anosemestre', pAtual) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtAnoSemestre.Text ;
         sFiltroShow := sFiltroShow + '"ANO/SEMESTRE = ' + txtAnoSemestre.Text + '" + CHR(13) + ';
         sAux := ' and ';

         sFiltro := sFiltro + sOp + pAtual + ' = ' + txtAnoSemestre.Text;
         sOp := ' and ';
      end;

      if (Pos('nr_mes', pAtual) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} >= ' + txtMesInicio.Text ;
         sFiltroShow := sFiltroShow + '"MES >= ' + txtMesInicio.Text + '" + CHR(13) + ';
         sAux := ' and ';

         sFiltro := sFiltro + sOp + pAtual + ' >= ' + txtMesInicio.Text;
         sOp := ' and ';
      end;

      if (Pos('nr_mes', pAtual) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} <= ' + txtMesFim.Text ;
         sFiltroShow := sFiltroShow + '"MES <= ' + txtMesFim.Text + '" + CHR(13) + ';
         sAux := ' and ';

         sFiltro := sFiltro + sOp + pAtual + ' <= ' + txtMesFim.Text;
         sOp := ' and ';
      end;


	  if (Pos('atividade', pAtual) > 0) Then
	  Begin
	      if cbAtividade.ItemIndex >= 0 Then
	      Begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + IntToStr(cd_atividades[cbAtividade.ItemIndex]);
            sFiltroShow := sFiltroShow + '"ATIVIDADE = ' + IntToStr(cd_atividades[cbAtividade.ItemIndex]) + '" + CHR(13) + ';
            sAux := ' and ';

            sFiltro := sFiltro + sOp + pAtual + ' = ' + IntToStr(cd_atividades[cbAtividade.ItemIndex]);
            sOp := ' and ';
	      End;
	  End;

	  if (Pos('pessoa', pAtual) > 0) Then
	  Begin
	      if txtCodigoPessoa.Text <> '' Then
	      Begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + txtCodigoPessoa.Text;
            sFiltroShow := sFiltroShow + '"PESSOA = ' + txtCodigoPessoa.Text + '" + CHR(13) + ';
            sAux := ' and ';

            sFiltro := sFiltro + sOp + pAtual + ' = ' + txtCodigoPessoa.Text;
            sOp := ' and ';
	      End;
	  End;

     if (((Pos('data', pCampo) > 0) or (Pos('dt_', pCampo) > 0)) and ckDtFiltrar.Checked)then begin

        sFSelecao := sFSelecao + sAux + ' ( ';
        sFiltro := sFiltro + sOp + ' ( ';

        sAux := ' ';

        while (Length(pAtual) > 0) do begin

           if Pos(' or ',pAtual) > 0 then begin
              pAtual_Aux := Copy(pAtual, Pos(' or ', pAtual) + 4, Length(pAtual));
              pAtual := Copy(pAtual, 1, Pos(' or ',pAtual) - 1);
           end
           else begin
              pAtual_Aux := '';
           end;

           sFSelecao := sFSelecao + sAux + '(ToText({' + pAtual +'}, "yyyyMMdd") >= "' + FormatDateTime( 'yyyymmdd', txtDtInicial.Date ) + '"';
           sFiltro := sFiltro + sAux + '( ' + pAtual + ' >= ''' + FormatDateTime( 'yyyy-mm-dd', txtDtInicial.Date ) + '''';
           sAux := ' and ';

           sFSelecao := sFSelecao + sAux + 'ToText({' + pAtual +'}, "yyyyMMdd") <= "' + FormatDateTime( 'yyyymmdd', txtDtFinal.Date ) + '")';
           sFiltro := sFiltro + sAux + pAtual + ' <= ''' + FormatDateTime( 'yyyy-mm-dd', txtDtFinal.Date ) + ''')';
           pAtual := pAtual_Aux;
           sAux := ' or ';

        end;

        sFSelecao := sFSelecao +  ' ) ';
        sFiltro := sFiltro +  ' ) ';

        sFiltroShow := sFiltroShow + '"DATA = DE ' + FormatDateTime( 'dd/mm/yyyy', txtDtInicial.Date ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', txtDtFinal.Date ) + '" + CHR(13) + ';

        sAux := ' and ';

     end;

   End;

   //especial
   if Trim(qRelatorios.FieldByName('ds_Especial').AsString) <> '' then begin
      sFSelecao := sFSelecao + sAux + qRelatorios.FieldByName('ds_Especial').AsString;
   end;

   slFormulas := TStringList.Create();

   sAux := qRelatorios.FieldByName('ds_Formula').AsString;


   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slFormulas);

         for i := 0 to (slFormulas.Count - 1) do begin

            sAux := slFormulas.ValueFromIndex[i];

            //processa formulas
            if (sAux = '[data_inicio]') then begin
               DecodeDate(txtDtInicial.Date, wAno, wMes, wDia);
               slFormulas.ValueFromIndex[i] := 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
            end
            else if (sAux = '[data_fim]') then begin
               DecodeDate(txtDtFinal.Date, wAno, wMes, wDia);
               slFormulas.ValueFromIndex[i] :=  'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')';
            end;
         end;
   end;
   if Length(qRelatorios.FieldByName('ds_sql').AsString) > 0 then begin

      sSQL := qRelatorios.FieldByName('ds_sql').AsString;

      sSQL := StringReplace(sSQL, '[data_inicio]', '''' + FormatDateTime('yyyy-mm-dd', txtDtInicial.Date) + '''', [rfReplaceAll] );
      sSQL := StringReplace(sSQL, '[data_fim]', '''' + FormatDateTime('yyyy-mm-dd', txtDtFinal.Date) + '''', [rfReplaceAll] );

      sSQL := sSQL + ' ' + sFiltro + qRelatorios.FieldByName('ds_sql_ordem').AsString;

      slSQL := TStringList.Create;

      SplitString(sSQL, ';', slSQL);

      // Executar o SQL
      with DM.qyAux2 do begin
          For i:= 0 to slSQL.Count -1 do begin
             Close;
             SQL.Clear;
             SQL.Add( slSQL.Strings[i] );
             ExecSQL;
          end;
      end;


      sFSelecao := '';

   end;


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
      sFiltroShow := Copy(sFiltroShow, 1, Length(sFiltroShow) - 3);
      slFormulas.Add('ds_filtro=' + sFiltroShow);
   end;

   //Imprimir o Relatório
   bAux := PrincipalForm.ImprimeRpt(sArqRelatorio, qRelatorios.FieldByName('cd_cabecalho').AsInteger, sFSelecao, SFGrupo, slFormulas, slOrdem, nil, True);

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

procedure Tfrm_Relatorios.UpDown3Click(Sender: TObject; Button: TUDBtnType);
var
  intMes : Integer;
begin
  { Incremento do Mês }
  intMes := StrToInt(txtMesFim.Text);

  if Button = btNext then
  begin
    Inc( intMes );
  end
  else
  begin
    Dec( intMes );
  end;

  txtMesFim.Text := IntToStr( intMes );
end;

end.
