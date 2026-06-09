unit uReajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Buttons, ExtCtrls, ImgList, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Mask, DB, ZConnection, uDM;

type
  TfReajusteMensa = class(TForm)
    ImageList2: TImageList;
    Bevel3: TBevel;
    paCabecalho: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    dtVencInicial: TDateTimePicker;
    dtVencFinal: TDateTimePicker;
    toolPessoa: TToolBar;
    btSalvar: TToolButton;
    ToolButton1: TToolButton;
    btCancelar: TToolButton;
    lblDataAte: TLabel;
    sbBuscaAluno: TSpeedButton;
    txtAluno: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    txtParcInicial: TEdit;
    lblParcAte: TLabel;
    txtParcFinal: TEdit;
    txtTurma: TEdit;
    Label1: TLabel;
    sbBuscaTurma: TSpeedButton;
    ckbParcela: TCheckBox;
    ckbData: TCheckBox;
    lbAnosemestre: TLabel;
    udAnoSem: TUpDown;
    mskAnoSem: TMaskEdit;
    qyAjustar: TUMZQuery;
    Label5: TLabel;
    txtDepto: TEdit;
    sbBuscaDepto: TSpeedButton;
    txtCurso: TEdit;
    Label8: TLabel;
    sbBuscaCurso: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    txtPercentual: TEdit;
    Label11: TLabel;
    txtValor: TEdit;
    Label12: TLabel;
    ckbValorBruto: TCheckBox;
    ckbDescontoExtra: TCheckBox;
    ckbValorDesconto: TCheckBox;
    ckbValorExtra: TCheckBox;
    lblAlunos: TLabel;
    Label14: TLabel;
    lblTitulos: TLabel;
    sbFiltrar: TToolButton;
    ToolButton2: TToolButton;
    procedure txtValorExit(Sender: TObject);
    procedure txtPercentualExit(Sender: TObject);
    procedure txtCursoEnter(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure sbBuscaDeptoClick(Sender: TObject);
    procedure dtVencInicialChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChecaLimpa(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure SoNumeros(Sender: TObject; var Key: Char);
    procedure SoValores(Sender: TObject; var Key: Char);
    procedure ckbParcelaClick(Sender: TObject);
    procedure ckbDataClick(Sender: TObject);
    procedure sbBuscaAlunoClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
  private
    { Private declarations }

    Function Filtrar : String;
    Procedure ApresentarQtd(Alunos : Integer; Titulos : Integer);
  public
    { Public declarations }
  end;

var
  fReajusteMensa: TfReajusteMensa;

implementation

{$R *.dfm}

uses
   uFSelecionarPessoa, uFSelecionarTurma, Main, uFSelecionarDepartamento, uFSelecionarCurso;

procedure TfReajusteMensa.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(mskAnoSem.Text));

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;
   mskAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
end;

procedure TfReajusteMensa.sbFiltrarClick(Sender: TObject);
begin
   Filtrar;
end;

procedure TfReajusteMensa.sbBuscaAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      txtAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
      try
         txtTurma.Text := resultado_filtro.cd_turma;
         mskAnoSem.Text := IntToStr(resultado_filtro.nr_anosemestre);
      except
      End;
   end
   else Exit;
end;

procedure TfReajusteMensa.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(mskAnoSem.Text));
   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      mskAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
end;

procedure TfReajusteMensa.sbBuscaDeptoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   { Pesquisar Departamentos }
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      txtDepto.Text := IntToStr(resultado_filtro.cd_departamento);
   end;
end;

procedure TfReajusteMensa.ckbDataClick(Sender: TObject);
begin
   dtVencInicial.Enabled := ckbData.Checked;
   dtVencFinal.Enabled := ckbData.Checked;
   lblDataAte.Enabled := ckbData.Checked;
end;

procedure TfReajusteMensa.ckbParcelaClick(Sender: TObject);
begin
   txtParcInicial.Enabled := ckbParcela.Checked;
   txtParcFinal.Enabled := ckbParcela.Checked;
   lblParcAte.Enabled := ckbParcela.Checked;
end;

procedure TfReajusteMensa.SoNumeros(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8]) then begin
      Key := #0;
   end;
end;

procedure TfReajusteMensa.SoValores(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if (key = ',') then
   begin
      if Pos(',', TEdit(Sender).Text) > 0 then
         key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;

end;

procedure TfReajusteMensa.txtCursoEnter(Sender: TObject);
begin
   btSalvar.Enabled := False;
end;

procedure TfReajusteMensa.txtPercentualExit(Sender: TObject);
begin
   if Length(Trim(txtPercentual.Text)) > 0  then begin

      try
         txtPercentual.Text := FloatToStrF(StrToCurr(txtPercentual.Text), ffNumber, 13, 2);
         txtValor.Text := '';
      except
         txtPercentual.Text := '';
      end;

   end;

end;

procedure TfReajusteMensa.txtValorExit(Sender: TObject);
begin
   if Length(Trim(txtValor.Text)) > 0  then begin

      try
         txtValor.Text := FloatToStrF(StrToCurr(txtValor.Text), ffNumber, 13, 2);
         txtPercentual.Text := '';
      except
         txtValor.Text := '';
      end;

   end;
end;

procedure TfReajusteMensa.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     mskAnoSem.text := DM.incrementar_ano_semestre(mskAnoSem.Text);
  end
  else
  begin
    mskAnoSem.text := DM.decrementar_ano_semestre(mskAnoSem.Text);
  end;
end;

procedure TfReajusteMensa.btSalvarClick(Sender: TObject);
Var
  sFiltro : String;
  sValor : String;
  sValorAux : String;
  sSet, sOp : String;
  sTexto : String;
begin
   //faz as verificacoes

   sFiltro := Filtrar;

   if sFiltro= '' then Exit;

   sSet := '';
   sOp := '';

   if Length(Trim(txtPercentual.Text)) > 0  then begin

      sValor := FloatToStrF(StrToCurr(txtPercentual.Text), ffNumber, 13, 2);
      sValorAux := sValor + ' %';

      sValor := ReplaceStr(sValor, ',','.');

      if ckbValorBruto.Checked then begin
         sSet := ' valorbruto = valorbruto + ( valorbruto * ' + sValor + ' / 100 ) ';
         sOp := ',  '
      end;

      if ckbDescontoExtra.Checked then begin
         sSet := sSet + sOp + ' descontoextra = descontoextra + ( descontoextra * ' + sValor + ' / 100 ) ';
         sOp := ',  '
      end;

      if ckbValorDesconto.Checked then begin
         sSet := sSet + sOp + ' valordesconto = valordesconto + ( valordesconto * ' + sValor + ' / 100 ) ';
         sOp := ',  '
      end;

      if ckbValorExtra.Checked then begin
         sSet := sSet + sOp + ' valorextra = valorextra + ( valorextra * ' + sValor + ' / 100 ) ';
         sOp := ',  '
      end;


   end
   else
   if Length(Trim(txtValor.Text)) > 0 then  begin

      sValor := FloatToStrF(StrToCurr(txtValor.Text), ffNumber, 13, 2);
      sValorAux := sValor;

      sValor := ReplaceStr(sValor, ',','.');

      if ckbValorBruto.Checked then begin
         sSet := ' valorbruto = valorbruto + ( ' + sValor + ' ) ';
         sOp := ',  '
      end;

      if ckbDescontoExtra.Checked then begin
         sSet := sSet + sOp + ' descontoextra = descontoextra + ( ' + sValor + ' ) ';
         sOp := ',  '
      end;

      if ckbValorDesconto.Checked then begin
         sSet := sSet + sOp + ' valordesconto = valordesconto + ( ' + sValor + ' ) ';
         sOp := ',  '
      end;

      if ckbValorExtra.Checked then begin
         sSet := sSet + sOp + ' valorextra = valorextra + ( valorextra + ' + sValor + ' ) ';
         sOp := ',  '
      end;


   end
   else begin
      Mensagem('Você precisa definir um valor para o reajuste.', 'Atenção', MB_OK + MB_ICONQUESTION);
      txtPercentual.SetFocus();
      Exit;
   end;

   if Mensagem(
      'Este procedimento irá reajustar em ' + sValorAux +
      ' os valores das mensalidades filtradas. Tem certeza que deseja continuar?',
      'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
      Exit;

   if Mensagem(
      'Após confirmar este reajuste, você não poderá mais desfazê-lo. Deseja continuar mesmo assim? ',
      'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
      Exit;

   qyAjustar.SQL.Text := ' UPDATE mensalidades SET ' + sSet + '  ' + sFiltro;

   qyAjustar.ExecSQL();

   // aplicando ajuste no fin_mov_cr
   qyAjustar.close();
   qyAjustar.SQl.Clear();
   qyAjustar.SQL.Text :=
                          'UPDATE mensalidades as me   '+
                          'INNER JOIN fin_mov_cr as cr ON (me.cd_mensalidade = cr.cd_mensalidade and cr.nr_sequencia = 1)'+
                          'SET cr.vl_entrada = round(IFNULL(me.valorbruto,0) + IFNULL(me.valorextra, 0), 2)'+
                          'WHERE cr.cd_mensalidade IN (select cd_mensalidade from mensalidades '+sFiltro+')';
   qyAjustar.ExecSQL();

   sOp := '';
   sTexto := '';

   sTexto := 'Reajuste de Mensalidades' + CHR(13) + 'Filtro: ' + sFiltro + CHR(13) + 'Valor: ' + sValorAux + CHR(13);

   sOp := 'Aplicado no ';
   if ckbValorBruto.Checked then begin
      sTexto := sTexto + sOp + 'valor bruto';
      sOp := ', ';
   end;

   if ckbValorExtra.Checked then begin
      sTexto := sTexto + sOp + 'valor extra';
      sOp := ', ';
   end;

   if ckbValorDesconto.Checked then begin
      sTexto := sTexto + sOp + 'valor desconto';
      sOp := ', ';
   end;

   if ckbDescontoExtra.Checked then begin
      sTexto := sTexto + sOp + 'desconto fixo';
      sOp := ', ';
   end;

   DM.setLog(2051, 'Alteracao',  '', DM.UsuarioLogado.ColigadaLogada, sTexto);

   Mensagem('Mensalidade reajustada com sucesso!!');
   Self.Close();
end;

Function TfReajusteMensa.Filtrar : String;
var
   iAnoSem: Integer;
   iParcInicial: Integer;
   iParcFinal: Integer;
   sFiltro : String;
   iAlunos, iTitulos : Integer;
   dtBloqueio : TDateTime;
begin
   //faz as verificacoes
   iParcInicial := -1;
   iParcFinal := -1;

   //anosemestre

   if DM.UsaAnosemestre then
   begin
      if not (Length(mskAnoSem.Text) > 4) then
      begin
         ApresentarQtd(0, 0);
         Result := '';
         btSalvar.Enabled := False;
         Mensagem('O Ano/Semestre precisa ser preenchido!!');
         mskAnoSem.SetFocus();
         Exit;
      end;
      
      try
         iAnoSem := StrToInt(mskAnoSem.Text);
      except
         ApresentarQtd(0, 0);
         Result := '';
         btSalvar.Enabled := False;
         Mensagem('O Ano/Semestre precisa ser preenchido corretamente!!');
         mskAnoSem.SetFocus();
         Exit;
      end;
   end;

   //data
   if (ckbData.Checked) then begin
      if (dtVencInicial.Date > dtVencFinal.Date) then begin
         ApresentarQtd(0, 0);
         Result := '';
         btSalvar.Enabled := False;
         Mensagem('A Data Inicial deve ser menor que a data Final!!');
         dtVencInicial.SetFocus();
         Exit;
      end;
   end;

   if (ckbParcela.Checked) then begin
      try
         iParcInicial := StrToInt(txtParcInicial.Text);
         iParcFinal := StrToInt(txtParcFinal.Text);
      except
         ApresentarQtd(0, 0);
         Result := '';
         btSalvar.Enabled := False;
         Mensagem('A parcela inicial e a parcela final devem ser numéricas!!');
         txtParcInicial.SetFocus();
         Exit;
      end;

      if (iParcInicial > iParcFinal) then begin
         ApresentarQtd(0, 0);
         Result := '';
         btSalvar.Enabled := False;
         Mensagem('A parcela inicial deve ser menor que a parcela final!!');
         txtParcInicial.SetFocus();
         Exit;
      end;
   end;

   // Iniciar o Filtro

    sFiltro := ' WHERE anosemestre = ' + mskAnoSem.Text;

    if Length(Trim(txtDepto.Text)) > 0 then begin
       sFiltro := sFiltro + ' AND depto = ' + txtDepto.Text;
    end;

    if Length(Trim(txtCurso.Text)) > 0 then begin
       sFiltro := sFiltro + ' AND curso = ' + QuotedStr(txtCurso.Text) + ' ';
    end;

    if Length(Trim(txtTurma.Text)) > 0 then begin
       sFiltro := sFiltro + ' AND turma = ' + QuotedStr(txtTurma.Text) + ' ';
    end;

    if Length(Trim(txtAluno.Text)) > 0 then begin
       sFiltro := sFiltro + ' AND codigoaluno = ' + QuotedStr(txtAluno.Text) + ' ';
    end;

    if (iParcInicial <> -1) AND (iParcFinal <> -1) then begin
       sFiltro := sFiltro + ' AND (parcela >= ' + IntToStr(iParcInicial) ;
       sFiltro := sFiltro + ' AND parcela <= ' + IntToStr(iParcFinal) + ')' ;
    end;

    if (ckbData.Checked) then begin
         sFiltro := sFiltro + ' AND (datavencimento >=' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtVencInicial.Date)) + '';
         sFiltro := sFiltro + ' AND datavencimento <=' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtVencFinal.Date)) + ' )';
    end;

    // Conferir Bloqueio de Alterações por data
    dtBloqueio := DM.DataBloqueioFinanceiro(0);

    if dtBloqueio <> 0 then begin
      sFiltro := sFiltro + ' AND (datavencimento > ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtBloqueio)) + ' )';
    end;


    sFiltro := sFiltro + ' AND situacao in (2, 10) ';
    sFiltro := sFiltro + Format( ' AND cd_coligada IN (%s) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );

    qyAjustar.Close();
    qyAjustar.SQL.Text :=
     ' SELECT COUNT(*) QTD FROM mensalidades ';
    qyAjustar.SQL.Add( sFiltro );
    qyAjustar.Open();

    iTitulos := qyAjustar.FieldByName('QTD').AsInteger;

    qyAjustar.Close();
    qyAjustar.SQL.Text :=
     ' SELECT codigoaluno FROM mensalidades ';
    qyAjustar.SQL.Add( sFiltro );
    qyAjustar.SQL.Add( 'GROUP BY codigoaluno ');
    qyAjustar.Open();
    qyAjustar.FetchAll();

    iAlunos := qyAjustar.RecordCount;

    ApresentarQtd(iAlunos, iTitulos);

    btSalvar.Enabled := True;

    result := sFiltro;

end;

procedure TfReajusteMensa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfReajusteMensa.ApresentarQtd(Alunos, Titulos: Integer);
begin
   if Alunos <= 0 then begin
      lblAlunos.Caption := 'Nenhum título';
      lblTitulos.Visible := False;
   end
   else begin
      lblTitulos.Visible := True;

      if Alunos = 1 then
         lblAlunos.Caption := 'Um aluno'
      else
         lblAlunos.Caption := IntToStr(Alunos) + ' alunos';

      if Titulos = 1 then
         lblTitulos.Caption := 'Um Título'
      else
         lblTitulos.Caption := IntToStr(Titulos) + ' títulos';
   end
        


end;

procedure TfReajusteMensa.btCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfReajusteMensa.ChecaLimpa(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfReajusteMensa.FormShow(Sender: TObject);
begin
   ckbData.Checked := False;
   dtVencInicial.DateTime := DM.DataAtual();
   dtVencFinal.DateTime := dtVencInicial.DateTime;

   mskAnoSem.Text := IntToStr(ano_semestre);
   mskAnoSem.Visible := DM.UsaAnosemestre;
   lbAnosemestre.Visible := mskAnoSem.Visible;
   udAnoSem.Visible := mskAnoSem.Visible;

   ckbParcela.Checked := False;
   ckbParcelaClick(nil);
   ckbDataClick(nil);

   Filtrar;
   btSalvar.Enabled := False;
end;

procedure TfReajusteMensa.dtVencInicialChange(Sender: TObject);
begin
   if (dtVencInicial.Date > dtVencFinal.Date) then begin
      dtVencFinal.Date := dtVencInicial.Date;
   end;

   btSalvar.Enabled := False;
end;

end.

