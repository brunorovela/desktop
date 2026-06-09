unit uGerarRemessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Buttons, ExtCtrls, ImgList, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Mask, DB, ZConnection, uDM, uRepBloquetos, UMDateTimePicker;

type
  TfGerarRemessa = class(TForm)
    ImageList2: TImageList;
    Bevel3: TBevel;
    paCabecalho: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    Label4: TLabel;
    Label2: TLabel;
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
    Label10: TLabel;
    cbListaAcao: TComboBox;
    ckbParcela: TCheckBox;
    ckbData: TCheckBox;
    de: TUpDown;
    mskAnoSem: TMaskEdit;
    qyGerarRemessa: TUMZQuery;
    ckbPendentes: TCheckBox;
    txtCurso: TEdit;
    Label5: TLabel;
    sbBuscaCurso: TSpeedButton;
    ckbAnoSem: TCheckBox;
    ckbIncluirProtestos: TCheckBox;
    txtTipoTitulo: TEdit;
    btnTipoTitulo: TSpeedButton;
    lbtipoTitulo: TLabel;
    ckbReservas: TCheckBox;
    Label3: TLabel;
    Label8: TLabel;
    ckbGeracao: TCheckBox;
    umdtVencInicial: TUMDateTimePicker;
    umdtVencFinal: TUMDateTimePicker;
    umdtGeraInicial: TUMDateTimePicker;
    umdtGeraFinal: TUMDateTimePicker;
    procedure umdtVencInicialChangeDate(Sender: TObject);
    procedure ckbGeracaoClick(Sender: TObject);
    procedure btnTipoTituloClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure ckbAnoSemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChecaLimpa(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    procedure deClick(Sender: TObject; Button: TUDBtnType);
    procedure SoNumeros(Sender: TObject; var Key: Char);
    procedure ckbParcelaClick(Sender: TObject);
    procedure ckbDataClick(Sender: TObject);
    procedure sbBuscaAlunoClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    iCodLayout  : Integer;
    bRemessaDDA : Boolean;
    { Public declarations }
    procedure GeraRemessa(iAnoSem: Integer; iAcaoRemessa: Integer; iParcInicial: Integer = 0; iParcFinal: Integer = 0);
  end;

var
  fGerarRemessa: TfGerarRemessa;

implementation

{$R *.dfm}

uses
   uFSelecionarPessoa, uFSelecionarTurma, Main, uFSelecionarCurso, uSelTipoTitulo;

procedure TfGerarRemessa.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(mskAnoSem.Text));

  if not resultado_filtro.filtrado then Exit;

  txtTurma.Text := resultado_filtro.cd_turma;
  mskAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
end;

procedure TfGerarRemessa.sbBuscaAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      txtAluno.Text := IntToStr( resultado_filtro.cd_pessoa );
      try
         txtTurma.Text := resultado_filtro.cd_turma;
         mskAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
      except
      end;
   end
   else Exit;
end;

procedure TfGerarRemessa.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
     txtCurso.Text := resultado_filtro.cd_curso;
     mskAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
end;

procedure TfGerarRemessa.ckbAnoSemClick(Sender: TObject);
begin
   mskAnoSem.Enabled := ckbAnoSem.Checked;
end;

procedure TfGerarRemessa.ckbDataClick(Sender: TObject);
begin
   umdtVencInicial.Enabled := ckbData.Checked;
   umdtVencFinal.Enabled := ckbData.Checked;
   lblDataAte.Enabled := ckbData.Checked;
end;

procedure TfGerarRemessa.ckbGeracaoClick(Sender: TObject);
begin
   umdtGeraInicial.Enabled := ckbGeracao.Checked;
   umdtGeraFinal.Enabled := ckbGeracao.Checked;
   Label8.Enabled := ckbGeracao.Checked;
end;

procedure TfGerarRemessa.ckbParcelaClick(Sender: TObject);
begin

   txtParcInicial.Enabled := ckbParcela.Checked;
   txtParcFinal.Enabled := ckbParcela.Checked;
   lblParcAte.Enabled := ckbParcela.Checked;
   ckbReservas.Enabled := ckbPendentes.Checked;
   if(ckbPendentes.Checked = false) then
      ckbReservas.Checked := false
end;

procedure TfGerarRemessa.SoNumeros(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8]) then begin
      Key := #0;
   end;
end;

procedure TfGerarRemessa.umdtVencInicialChangeDate(Sender: TObject);
begin
   if (umdtVencInicial.getDate > umdtVencFinal.getDate) then
   begin
      umdtVencFinal.setDate(umdtVencInicial.getDate);
   end;
end;

procedure TfGerarRemessa.deClick(Sender: TObject; Button: TUDBtnType);
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

procedure TfGerarRemessa.btnTipoTituloClick(Sender: TObject);
var
  sFiltro,sOp : string;
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

procedure TfGerarRemessa.btSalvarClick(Sender: TObject);
var
   iAnoSem: Integer;
   iParcInicial: Integer;
   iParcFinal: Integer;
   bFiltroMinimo : Boolean;
begin
   //faz as verificacoes

   bFiltroMinimo := False;
   iParcInicial := -1;
   iParcFinal := -1;

   //anosemestre

   if (ckbAnoSem.Checked) AND (DM.UsaAnosemestre) then begin
     if (not (Length(mskAnoSem.Text) > 4)) then begin
        Mensagem('O Ano/Semestre precisa ser preenchido!!');
        mskAnoSem.SetFocus();
        Exit;
     end else begin
        iAnoSem := StrToInt(mskAnoSem.Text);
     end;
   end;


   if (Length(txtTurma.Text) >= 1) OR (Length(txtAluno.Text) >= 1) then begin
      bFiltroMinimo := True;
   end;

   //Data de vencimento
   if (ckbData.Checked) then begin
      if (umdtVencInicial.Date > umdtVencFinal.Date) then begin
         Mensagem('A Data de vencimento Inicial deve ser menor que a data Final!!');
         umdtVencInicial.SetFocus();
         Exit;
      end;
      bFiltroMinimo := true;
   end;

   //Data de geração de títulos
   if (ckbGeracao.Checked) then begin
      if (umdtGeraInicial.Date > umdtGeraFinal.Date) then begin
         Mensagem('A Data de geração de títulos inicial deve ser menor que a data Final!!');
         umdtGeraInicial.SetFocus;
         Exit;
      end;
      bFiltroMinimo := true;
   end;

   if (ckbParcela.Checked) then begin
      try
         iParcInicial := StrToInt(txtParcInicial.Text);
         iParcFinal := StrToInt(txtParcFinal.Text);
      except
         Mensagem('A parcela inicial e a parcela final devem ser numéricas!!');
         txtParcInicial.SetFocus();
         Exit;
      end;

      if (iParcInicial > iParcFinal) then begin
         Mensagem('A parcela inicial deve ser menor que a parcela final!!');
         txtParcInicial.SetFocus();
         Exit;
      end;
   end;

   //codigo da acao
   if not (cbListaAcao.ItemIndex > -1) then begin
         Mensagem('A ação de remessa deve ser selecionada!!');
         cbListaAcao.SetFocus();
         Exit;
   end;

   if not bFiltroMinimo then begin
     Mensagem('Você deve filtrar pelo menos uma data de vencimento!!');
     exit;
   end;

   //está tudo verificado, pode incluir!!
   if ( bRemessaDDA = true ) then
   begin
     if( cbListaAcao.ItemIndex = 0 ) then
       GeraRemessa(iAnoSem, 100, iParcInicial, iParcFinal)
     else
       GeraRemessa(iAnoSem, 101, iParcInicial, iParcFinal);
   end
   else
   begin
     GeraRemessa(iAnoSem, cbListaAcao.ItemIndex, iParcInicial, iParcFinal);
   end;

   Self.Close();
end;

procedure TfGerarRemessa.GeraRemessa(iAnoSem: Integer; iAcaoRemessa: Integer;
         iParcInicial: Integer = 0; iParcFinal: Integer = 0);
const
   S_SQL_INSERT_DADOS =
      'INSERT INTO REM_DADOS (CD_LAYOUT, CD_OCORRENCIA, CD_MENSALIDADE, DT_ACAO, SN_ENVIADO) ' +
      'SELECT ' +
         'O.CD_LAYOUT,' +
         'O.CD_OCORRENCIA,' +
         'M.CD_MENSALIDADE,' +
         'NOW(),' +
         '0 ' +
      'FROM ' +
         'MENSALIDADES M ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(O.CD_ACAO = :CD_ACAO) AND ' +
               '(O.CD_LAYOUT = :CD_LAYOUT) ' +
               'JOIN REM_LAYOUTS L ON ' +
                  '(L.CD_LAYOUT = O.CD_LAYOUT) AND ' +
                  '(M.CD_CAIXA = L.CD_CAIXA OR L.CD_CAIXA IS NULL) ' +
               'JOIN pessoas as R ON '+
							    '(R.CD_PESSOA = M.CD_RESP AND (L.SN_FIES = 2 OR L.SN_FIES = R.sn_nao_bloquear_financeiro )) '+
               'LEFT JOIN REM_DADOS D ON ' +
                  '(O.CD_LAYOUT = D.CD_LAYOUT) AND ' +
                  '(O.CD_OCORRENCIA = D.CD_OCORRENCIA) AND ' +
                  '(M.CD_MENSALIDADE = D.CD_MENSALIDADE) AND ' +
                  '(D.SN_ENVIADO = 0) ' +
               'LEFT JOIN pessoas_debito_automatico pda ON ( pda.cd_pessoa = m.codigoaluno AND pda.sn_autoriza_debito = 1 )  ' +
      'WHERE ' +
         ' M.CD_COLIGADA IN ( %s ) AND pda.cd_pessoa IS NULL AND'+
         ' D.CD_LAYOUT IS NULL AND ' +
         '(M.NOSSONUMERO IS NOT NULL OR L.CD_CAIXA IS NULL) %s';

  S_SQL_GET_DADOS =
      'SELECT ' +
         'O.CD_LAYOUT,' +
         'O.CD_OCORRENCIA,' +
         'l.cd_caixa_nn,'+
         'm.depto,'+
         'M.CD_MENSALIDADE ' +
      'FROM ' +
         'MENSALIDADES M ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(O.CD_ACAO = :CD_ACAO) AND ' +
               '(O.CD_LAYOUT = :CD_LAYOUT) ' +
               'JOIN REM_LAYOUTS L ON ' +
                  '(L.CD_LAYOUT = O.CD_LAYOUT) AND ' +
                  '(M.CD_CAIXA = L.CD_CAIXA OR L.CD_CAIXA IS NULL) ' +
               'JOIN pessoas as R ON '+
							    '(R.CD_PESSOA = M.CD_RESP AND (L.SN_FIES = 2 OR L.SN_FIES = R.sn_nao_bloquear_financeiro )) '+
               'LEFT JOIN REM_DADOS D ON ' +
                  '(O.CD_LAYOUT = D.CD_LAYOUT) AND ' +
                  '(O.CD_OCORRENCIA = D.CD_OCORRENCIA) AND ' +
                  '(M.CD_MENSALIDADE = D.CD_MENSALIDADE) AND ' +
                  '(D.SN_ENVIADO = 0) ' +
               'LEFT JOIN pessoas_debito_automatico pda ON ( pda.cd_pessoa = m.codigoaluno AND pda.sn_autoriza_debito = 1 )  ' +
      'WHERE ' +
         ' M.CD_COLIGADA IN ( %s ) AND pda.cd_pessoa IS NULL AND'+
         ' D.CD_LAYOUT IS NULL AND ' +
         '(M.NOSSONUMERO IS NOT NULL OR L.CD_CAIXA IS NULL) %s';


   S_SQL_INSERT_DADOS_DDA =
      'INSERT INTO REM_DADOS (CD_LAYOUT, CD_OCORRENCIA, CD_MENSALIDADE, DT_ACAO, SN_ENVIADO) ' +
      'SELECT ' +
         'O.CD_LAYOUT,' +
         'O.CD_OCORRENCIA,' +
         'M.CD_MENSALIDADE,' +
         'NOW(),' +
         '0 ' +
      'FROM ' +
         'MENSALIDADES M ' +
            'INNER JOIN pessoas_debito_automatico pda ON ( pda.cd_pessoa = m.codigoaluno AND pda.sn_autoriza_debito = 1 )  ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(O.CD_ACAO = :CD_ACAO) AND ' +
               '(O.CD_LAYOUT = :CD_LAYOUT) ' +
               'JOIN REM_LAYOUTS L ON ' +
                  '(L.CD_LAYOUT = O.CD_LAYOUT) AND ' +
                  '(M.CD_CAIXA = L.CD_CAIXA OR L.CD_CAIXA IS NULL) ' +
               'JOIN pessoas as R ON '+
							    '(R.CD_PESSOA = M.CD_RESP AND (L.SN_FIES = 2 OR L.SN_FIES = R.sn_nao_bloquear_financeiro )) '+
               'LEFT JOIN REM_DADOS D ON ' +
                  '(O.CD_LAYOUT = D.CD_LAYOUT) AND ' +
                  '(O.CD_OCORRENCIA = D.CD_OCORRENCIA) AND ' +
                  '(M.CD_MENSALIDADE = D.CD_MENSALIDADE) AND ' +
                  '(D.SN_ENVIADO = 0) ' +
      'WHERE ' +
         'M.CD_COLIGADA IN ( %s ) AND D.CD_LAYOUT IS NULL AND ' +
         '(M.NOSSONUMERO IS NOT NULL OR L.CD_CAIXA IS NULL) %s';

   S_SQL_GET_DADOS_DDA =
      'SELECT ' +
         'O.CD_LAYOUT,' +
         'O.CD_OCORRENCIA,' +
         'l.cd_caixa_nn,'+
         'm.depto,'+
         'M.CD_MENSALIDADE ' +
      'FROM ' +
         'MENSALIDADES M ' +
            'INNER JOIN pessoas_debito_automatico pda ON ( pda.cd_pessoa = m.codigoaluno AND pda.sn_autoriza_debito = 1 )  ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(O.CD_ACAO = :CD_ACAO) AND ' +
               '(O.CD_LAYOUT = :CD_LAYOUT) ' +
               'JOIN REM_LAYOUTS L ON ' +
                  '(L.CD_LAYOUT = O.CD_LAYOUT) AND ' +
                  '(M.CD_CAIXA = L.CD_CAIXA OR L.CD_CAIXA IS NULL) ' +
               'JOIN pessoas as R ON '+
							    '(R.CD_PESSOA = M.CD_RESP AND (L.SN_FIES = 2 OR L.SN_FIES = R.sn_nao_bloquear_financeiro )) '+                  
               'LEFT JOIN REM_DADOS D ON ' +
                  '(O.CD_LAYOUT = D.CD_LAYOUT) AND ' +
                  '(O.CD_OCORRENCIA = D.CD_OCORRENCIA) AND ' +
                  '(M.CD_MENSALIDADE = D.CD_MENSALIDADE) AND ' +
                  '(D.SN_ENVIADO = 0) ' +
      'WHERE ' +
         'M.CD_COLIGADA IN ( %s ) AND D.CD_LAYOUT IS NULL AND ' +
         '(M.NOSSONUMERO IS NOT NULL OR L.CD_CAIXA IS NULL) %s';

   S_SQL_UPDATE_MENSA =
     'UPDATE                              ' +
     '  mensalidades                      ' +
     'SET                                 ' +
     '  nossonumero = :nossonumero        ' +
     'WHERE                               ' +
     '  cd_mensalidade = :cd_mensalidade  ' +
     '' ;

   S_SQL_DADOS_ORIGEM  =
   '  SELECT                                            '+
   '    cd_origem                                       '+
   '  FROM                                              '+
   '    rem_layouts                                     '+
   '  WHERE                                             '+
   '    cd_layout = :cd_layout                          ';

   S_OP = ' AND ';
   S_FIL_ANOSEMESTRE = 'M.ANOSEMESTRE = :NR_ANOSEMESTRE';
   S_FIL_TURMA = 'M.TURMA = :CD_TURMA';
   S_FIL_CURSO = 'M.CURSO = :CD_CURSO';
   S_FIL_NAO_PROTESTO = 'M.SITUACAO <> 9';
   S_FIL_SITUACOES = 'M.SITUACAO IN (%s)';
   S_FIL_ALUNO = 'M.CODIGOALUNO = :CD_PESSOA';
   S_FIL_DTVENCTO_ENTRE = 'M.DATAVENCIMENTO BETWEEN :DT_VENCTO_MENOR AND :DT_VENCTO_MAIOR';
   S_FIL_PARCELA_ENTRE = 'M.PARCELA BETWEEN :NR_PARCELA_MENOR AND :NR_PARCELA_MAIOR';
   S_FIL_DTGERACAO_ENTRE = 'M.DATAEMISSAO BETWEEN :NR_GERACAO_MENOR AND :NR_GERACAO_MAIOR';
var

   I: integer;
   LSFiltro, LSSituacoes: string;
   LParams: TParams;
   qryGetDadosOrigem, qryGetMensNossoNumero, qryUpdateMensa,qryGetCdCaixaNN : TUMZQuery;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   Application.CreateForm( TfrmRepBloquetos, frmRepBloquetos );


   dm.CriarConsulta(qryGetMensNossoNumero);
   DM.CriarConsulta(qryUpdateMensa);
   Dm.CriarConsulta(qryGetCdCaixaNN);
   dm.CriarConsulta(qryGetDadosOrigem);

   qryGetDadosOrigem.SQL.Text := ''+
   '   SELECT                     '+
   '     cd_origem                '+
   '   FROM                       '+
   '     rem_layouts              '+
   '   WHERE                      '+
   '     cd_layout = :cd_layout   ';
   qryGetDadosOrigem.ParamByName('cd_layout').AsInteger := iCodLayout;
   qryGetDadosOrigem.Open;



   dm.CriarConsulta(qryGetMensNossoNumero);
   qryGetMensNossoNumero.sql.Text := S_SQL_GET_DADOS;

   LParams := TParams.Create;
   try
      if ckbAnoSem.Checked and DM.UsaAnosemestre then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_ANOSEMESTRE;
         AddParam('NR_ANOSEMESTRE', iAnoSem);
      end;

      if txtTurma.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_TURMA;
         AddParam('CD_TURMA', txtTurma.Text);
      end;

      if txtCurso.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_CURSO;
         AddParam('CD_CURSO', txtCurso.Text);
      end;

      if ckbIncluirProtestos.Checked then
      begin
         if ckbPendentes.Checked then
            if ckbReservas.Checked then
              LSSituacoes := '10,9, 2'
            else
              LSSituacoes := '9, 2'
         else
            LSSituacoes := '9';
         LSFiltro := LSFiltro + S_OP + Format(S_FIL_SITUACOES, [LSSituacoes]);
      end
      else
      begin
         LSFiltro := LSFiltro + S_OP +S_FIL_NAO_PROTESTO;
         if ckbPendentes.Checked then
         begin
            if ckbReservas.Checked then
               LSSituacoes := '10,2'
            else
               LSSituacoes := '2';
            LSFiltro := LSFiltro + S_OP + Format(S_FIL_SITUACOES, [LSSituacoes]);
         end;
      end;

      if txtAluno.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_ALUNO;
         AddParam('CD_PESSOA', txtAluno.Text);
      end;

      if ckbData.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_DTVENCTO_ENTRE;

         AddParam('DT_VENCTO_MENOR', formatdatetime('yyyy-mm-dd 00:00:00', umdtVencInicial.Date));
         AddParam('DT_VENCTO_MAIOR', formatdatetime('yyyy-mm-dd 00:00:00', umdtVencFinal.Date));
      end;

      if ckbGeracao.Checked then
      begin
        LSFiltro := LSFiltro + S_OP + S_FIL_DTGERACAO_ENTRE;

        AddParam('NR_GERACAO_MENOR', formatdatetime('yyyy-mm-dd 00:00:00', umdtGeraInicial.Date));
        AddParam('NR_GERACAO_MAIOR', formatdatetime('yyyy-mm-dd 00:00:00', umdtGeraFinal.Date));
      end;

      if iParcInicial <> -1 then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_PARCELA_ENTRE;
         AddParam('NR_PARCELA_MENOR', iParcInicial);
         AddParam('NR_PARCELA_MAIOR', iParcFinal);
      end;

      if ( txtTipoTitulo.Text <> '' ) then
      begin
         LSFiltro := LSFiltro + S_OP + 'M.CD_TIPO_TITULO IN ('+txtTipoTitulo.Text+')';
      end;


      if ( qryGetDadosOrigem.FieldByName('cd_origem').AsInteger <> 3 ) then
      begin
        qryGetMensNossoNumero.SQL.Text := Format(S_SQL_GET_DADOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltro]);
        qyGerarRemessa.SQL.Text        := Format(S_SQL_INSERT_DADOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltro]);
      end
      else
      begin
        qryGetMensNossoNumero.SQL.Text := Format(S_SQL_GET_DADOS_DDA, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltro]);
        qyGerarRemessa.SQL.Text := Format(S_SQL_INSERT_DADOS_DDA, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltro]);
      end;

      for I := 0 to LParams.Count - 1 do
      begin
         qyGerarRemessa.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
         qryGetMensNossoNumero.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      end;
   finally
      LParams.Free;
      LParams := nil;
   end;

   qryGetCdCaixaNN.SQL.Text := ' SELECT         '+
                               '  cd_caixa_nn   '+
                               ' FROM           '+
                               ' 	rem_layouts   '+
                               ' WHERE          '+
                               '	cd_layout = :cd_layout ';
   qryGetCdCaixaNN.ParamByName('CD_LAYOUT').AsInteger := iCodLayout;
   qryGetCdCaixaNN.Open;

   qryGetMensNossoNumero.ParamByName('CD_ACAO').AsInteger := iAcaoRemessa;
   qryGetMensNossoNumero.ParamByName('CD_LAYOUT').AsInteger := iCodLayout;

   if qryGetCdCaixaNN.FieldByName('cd_caixa_nn').AsInteger <> 0 then
   begin
     qryGetMensNossoNumero.Open;
     qryGetMensNossoNumero.First;

     {Seta as variáveis que recebem o resultado da mensagem de cancelar débito automático}
     frmRepBloquetos.DDASimParaTodos := False;
     frmRepBloquetos.DDANaoParaTodos := False;
     frmRepBloquetos.mensagemExibidaDDA := False;

     while not qryGetMensNossoNumero.Eof do
     begin
        frmRepBloquetos.PrepararBloquetosParaImpressao('m.cd_mensalidade ='+qryGetMensNossoNumero.FieldByName('cd_mensalidade').AsString, false, qryGetCdCaixaNN.FieldByName('cd_caixa_nn').AsString,false );
        qryGetMensNossoNumero.Next;
     end;

     {Seta as variáveis que recebem o resultado da mensagem de cancelar débito automático}
     frmRepBloquetos.DDASimParaTodos := False;
     frmRepBloquetos.DDANaoParaTodos := False;
   end;

   qyGerarRemessa.ParamByName('CD_ACAO').AsInteger := iAcaoRemessa;
   qyGerarRemessa.ParamByName('CD_LAYOUT').AsInteger := iCodLayout;
   qyGerarRemessa.ExecSQL;

   if(qyGerarRemessa.RowsAffected >= 1) then
      Mensagem('Remessa Gerada com sucesso!!')
   else
   begin
      Mensagem('Não serão gerados registros de remessa para o filtro aplicado. Reveja os filtros antes de prosseguir');
      Abort;
   end;
   FreeAndNil(qryGetDadosOrigem);
end;

procedure TfGerarRemessa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfGerarRemessa.btCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfGerarRemessa.ChecaLimpa(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
   end;
end;

procedure TfGerarRemessa.FormShow(Sender: TObject);
var
   qryOrigem : TUMZQuery;
begin
   mskAnoSem.Text := IntToStr( ano_semestre );
   mskAnoSem.Visible := DM.UsaAnosemestre;
   ckbAnoSem.Visible := mskAnoSem.Visible;
   de.Visible := mskAnoSem.Visible;


   dm.CriarConsulta( qryOrigem );
   qryOrigem.sql.Text := '     '+
   ' SELECT                    '+
   '    cd_origem              '+
   ' FROM                      '+
   '    rem_layouts            '+
   ' WHERE                     '+
   '    cd_layout = :cd_layout ';
   qryOrigem.ParamByName('cd_layout').AsInteger := iCodLayout;
   qryOrigem.Open;

   if qryOrigem.FieldByName('cd_origem').AsInteger = 3 then
   begin
      cbListaAcao.Clear;
      cbListaAcao.AddItem('Débito Automático'      ,nil);
      cbListaAcao.AddItem('Cancelamento de Débito' ,nil);
      bRemessaDDA := true;
   end
   else
   begin
      bRemessaDDA := false;
      cbListaAcao.Clear;
      cbListaAcao.AddItem('Baixa de mensalidade'        ,nil);
      cbListaAcao.AddItem('Cancelamento de mensalidade' ,nil);
      cbListaAcao.AddItem('Desconto de mensalidade'     ,nil);
      cbListaAcao.AddItem('Protesto de mensalidade'     ,nil);
      cbListaAcao.AddItem('Estorno de mensalidade'      ,nil);
      cbListaAcao.AddItem('Alteração de mensalidade'    ,nil);
      cbListaAcao.AddItem('Negociação de mensalidade'   ,nil);
      cbListaAcao.AddItem('Prorrogação de mensalidade'  ,nil);
      cbListaAcao.AddItem('Impressão de Boleto de mensalidade' ,nil);
      cbListaAcao.AddItem('Inserção de mensalidade'     ,nil);
   end;


   ckbData.Checked := False;
   umdtVencInicial.Date := DM.DataAtual();
   umdtVencFinal.Date := umdtVencInicial.Date;

   ckbParcela.Checked := False;
   ckbParcelaClick(nil);
   ckbDataClick(nil);


   FreeAndNil(qryOrigem);
end;

end.

