unit uReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Mask, Grids, DBGrids, Db, ZConnection, DBCtrls,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ucrpe32,
  checklst, Buttons, ToolWin, Menus, ZSqlUpdate, uUsuario, uMensagem;

type
   TMatriculaCurso = packed record
      Grade: Integer;
      AnoSemGrade: Integer;
      AnoSemIngresso: Integer;
      Ingresso: Integer;
      Situacao: Integer;
      Curso: string;
      Turno: string;
   end;

   PMatriculaCurso = ^TMatriculaCurso;

  TfrmReserva = class(TForm)
    qryReservar: TUMZQuery;
    tblPlanos: TUMZQuery;
    dtcPlanos: TDataSource;
    tblItensPagamento: TUMZQuery;
    Bevel1: TBevel;
    paCabecalho: TPanel;
    Bevel2: TBevel;
    ToolBar1: TToolBar;
    btnGerar: TToolButton;
    tbSeparador1: TToolButton;
    btnExcluir: TToolButton;
    tbSeparador2: TToolButton;
    btnRequerimentos: TToolButton;
    tbSeparador3: TToolButton;
    btnContratos: TToolButton;
    tbSeparador4: TToolButton;
    btnFechar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    xMatriculas: TUMZQuery;
    qryInsert: TUMZQuery;
    pmQtd: TPopupMenu;
    tblPlanoDesc: TUMZQuery;
    qryBloqDataVencto: TUMZQuery;
    qryBloqDataVenctonr_dia_vencimento: TLargeintField;
    qryMatriculaCurso: TUMZQuery;
    qryMatriculaCursoCD_MATRICULA_CURSO: TLargeintField;
    qryMatriculaCursoCD_PESSOA: TIntegerField;
    qryMatriculaCursoNR_MATRICULA: TStringField;
    qryMatriculaCursoCD_CURSO: TStringField;
    qryMatriculaCursoCD_GRADE: TLargeintField;
    qryMatriculaCursoNR_ANOSEM_GRADE: TLargeintField;
    qryMatriculaCursoNR_ANOSEM_INGRESSO: TLargeintField;
    qryMatriculaCursoCD_TURNO: TStringField;
    qryMatriculaCursoDT_INGRESSO: TDateTimeField;
    qryMatriculaCursoCD_INGRESSO: TLargeintField;
    qryMatriculaCursoCD_SITUACAO: TLargeintField;
    updMatriculaCurso: TZUpdateSQL;
    Panel1: TPanel;
    lstAlunos: TCheckListBox;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Panel2: TPanel;
    UpDown1: TUpDown;
    txtAnoSemestreDe: TMaskEdit;
    Label2: TLabel;
    btnTurmas: TSpeedButton;
    txtTurmaDe: TEdit;
    lbTurma: TLabel;
    lbTituloOrigem: TLabel;
    Label7: TLabel;
    Bevel5: TBevel;
    pnDestino: TPanel;
    Panel4: TPanel;
    Label9: TLabel;
    cbPlanos: TComboBox;
    Label8: TLabel;
    txtTurmaPara: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    txtAnoSemestrePara: TMaskEdit;
    UpDown2: TUpDown;
    Label4: TLabel;
    Label1: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    lst: TListBox;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    lbAlunos: TLabel;
    qryTiposTituloDesc: TUMZReadOnlyQuery;
    qryTiposTituloDescCD_DESCONTO_PESSOA: TIntegerField;
    qryTiposTituloDescCD_TIPO_TITULO: TSmallintField;
    qryTiposTituloDescCD_COLIGADA: TSmallintField;
    qryProximaTurma: TUMZQuery;
    qryProximaTurmacd_proxima_turma: TStringField;
    qryDadosProxTurma: TUMZQuery;
    qryDadosProxTurmaturno: TStringField;
    qryDadosProxTurmacurso: TStringField;
    qryDadosProxTurmacodigo: TStringField;
    qryDadosProxTurmaanosemestre: TIntegerField;
    qryDivisaoProgramada: TUMZReadOnlyQuery;
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure cbPlanosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaDeKeyPress(Sender: TObject; var Key: Char);
    procedure txtTurmaDeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure txtTurmaParaExit(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRequerimentosClick(Sender: TObject);
    procedure btnContratosClick(Sender: TObject);
    procedure Filtra;
    procedure ZerarArray;
    procedure txtTurmaParaKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure GerarMensalidades;
    procedure dtcPlanosDataChange(Sender: TObject; Field: TField);
    procedure btnTurmasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure txtAnoSemestreDeKeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
  private
    FMatriculaCurso: PMatriculaCurso;
    strCursoPara : String;

    ArrayValores : Array[0..100] of Currency;
    ArrayDescontos : Array[0..100] of Currency;
    ArrayDescontosExtra : Array[0..100] of Currency;
    ArrayDatas : Array[0..100] of TDateTime;
    ArrayParcelas : Array[0..100] of Integer;
    ArrayTipoParcela : Array[0..100] of Integer;
    ArrayPlanoContas : Array[0..100] of Integer;
    ArrayDescricaoTipo : Array[0..100] of String;
    ArrayValorExtra : Array[0..100] of Currency;
    ArrayNr_Credito :  ARRAY[0..100] of Currency;

    ArraySN_Credito :  ARRAY[0..100] of Char;
    ArrayValorCredito : Array[0..100] of Real;
    ArrayItemPlano : ARRAY[0..100] of Integer;

    ArrayDescontosPlano : Array[0..100] of Currency;
    ArrayDescontosExtraPlano : Array[0..100] of Currency;



    lngPlano : Longint; { VARIAVEL PARA DESIGNAR PLANO DE DESCONTO }

    slPlanos : TStringList;
    slAlunos : TStringList;

    snTelaExcluirReserva : Boolean;
    procedure DivisaoTitulo(iMensalidade: Integer);

    Procedure CalcularVencimento;

    function GeraMatriculaCurso(const Pessoa: Integer): Integer;

    procedure MostrarAlunos();
    procedure MostrarPlanos();
    procedure CarregarProximaTurma();

    { Private declarations }
  public
    { Public declarations }
    iAcaoDesconto : Integer;

    Procedure PrepararTelaReserva(ExcluirReserva : Boolean);
    
    function total_creditos : double;

  end;

var
  frmReserva: TfrmReserva;

implementation

uses
   uFSelecionarTurma, uDM, Main, uMatriculas, uProcessando, uClassMovimento,
   uFuncoesGerais, UZDbcFuncs, ZDbcIntfs, uUMNucleo;

{$R *.DFM}


procedure TfrmReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmReserva.FormCreate(Sender: TObject);
begin
   New(FMatriculaCurso);
end;

procedure TfrmReserva.FormDestroy(Sender: TObject);
begin
   Dispose(FMatriculaCurso);
end;

procedure TfrmReserva.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnGerarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil ); 
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmReserva.txtTurmaDeKeyPress(Sender: TObject; var Key: Char);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   if Key <> #13 then Exit;

   if txtTurmaDe.Text = '' then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

      if not resultado_filtro.filtrado then Exit;

      txtTurmaDe.Text := resultado_filtro.cd_turma;
      txtAnoSemestreDe.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;

   SelectNext( TWinControl( Sender ), True, True );
   Key := #0;
end;

procedure TfrmReserva.txtTurmaDeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmReserva.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReserva.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestreDe.text := DM.incrementar_ano_semestre(txtAnoSemestreDe.Text);
  end
  else
  begin
     txtAnoSemestreDe.text := DM.decrementar_ano_semestre(txtAnoSemestreDe.Text);
  end;

end;

procedure TfrmReserva.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestrePara.text := DM.incrementar_ano_semestre(txtAnoSemestrePara.Text);
  end
  else
  begin
     txtAnoSemestrePara.text := DM.decrementar_ano_semestre(txtAnoSemestrePara.Text);
  end;

  MostrarPlanos();

end;

procedure TfrmReserva.ZerarArray;
var
   i: integer;
begin
   for I := 0 to 100 do
   begin
      ArrayValores[i]:=0;
      ArrayDescontos[i]:=0;
      ArrayDescontosExtra[i]:=0;
      ArrayDatas[i]:=0;
      ArrayParcelas[i] := 0;
      ArrayTipoParcela[i] := 0;
      ArrayPlanoContas[i] := 0;
      ArrayDescricaoTipo[i] := '';
      ArrayValorExtra[i] := 0;
      ArrayNr_Credito[i] := 0;
      ArraySN_Credito[i] := #0;
      ArrayValorCredito[i] := 0;
      ArrayItemPlano[i] := 0;
      ArrayDescontosPlano[i] := 0;
      ArrayDescontosExtraPlano[i] := 0;

   end;
end;

procedure TfrmReserva.txtTurmaParaExit(Sender: TObject);
begin

  if txtTurmaPara.Text <> '' then
  begin
    DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );
    strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
  end;

  MostrarPlanos()
end;

procedure TfrmReserva.btnGerarClick(Sender: TObject);
const
   SSQLGrade =
      'SELECT G.CD_GRADE, G.NR_ANO_INICIAL FROM GRADES G JOIN TURMAS T ON ' +
      '(G.CD_GRADE = T.CD_GRADE) AND (G.CD_CURSO = T.CURSO) WHERE T.CODIGO = ? ' +
      'AND G.SN_ATIVO = ''S''';

   SSQLProcuraMatriculaCurso =
      'SELECT CD_MATRICULA_CURSO, CD_SITUACAO FROM MATRICULAS_CURSO WHERE CD_PESSOA = ? AND CD_CURSO = ?';

   SMsgSemGrade =
      'Não foi configurada a grade curricular para o curso selecionado. Não é possível prosseguir.';
Var
  qryGetTurma : TUMZQuery;
  lngAux: Longint;
  qryGetGrade : TUMZQuery;
  sMsg : String;
  i, i2, iCont : Integer;
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   NovaMatricula: Boolean;
   MatriculaCurso: Integer;
   avisoAluno, avisoGeral: String;
   parametros: TParamsIni;
begin
  if not DM.UsuarioLogado.TemPermissao( 1011, npIncluir, True ) then Exit;

  dm.CriarConsulta(qryGetTurma);
  qryGetTurma.SQL.Text := '   '+
   ' SELECT                    '+
   '   cd_grade                '+
   ' FROM                      '+
   '   turmas                  '+
   ' WHERE                     '+
   '	codigo = :codigo         '+
	'  AND anosemestre = :anosemestre ';


  if (Trim(txtTurmaDe.Text) = '') then begin
      MessageDlg( 'Selecione a turma de origem.', mtInformation,  [mbOK], -1 );
      Exit
  end;

  if (Trim(txtTurmaPara.Text) = '') then begin
      MessageDlg( 'Selecione a turma de destino.', mtInformation,  [mbOK], -1  );
  end;

  if (txtAnoSemestreDe.Text = txtAnoSemestrePara.Text) then begin
      if MessageDlg( 'Atenção' + CHR(13) + CHR(13) +
      'Você selecionou o mesmo ano/semestre de origem e destino.' + CHR(13) +
      'Tem certeza que deseja gerar as reservas para o mesmo ano/semestre?' 
      ,  mtConfirmation, [mbYes, mbNo],  -1, mbNo) = mrNo then exit;
  end;

  sMsg := 'Confirmação: ' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Você está solicitando a reserva de vaga para os alunos ativos selecionados ' + CHR(13) + CHR(13);
  sMsg := sMsg + 'DA TURMA: ' + txtTurmaDe.Text + ' (' + txtAnoSemestreDe.Text + ')' + CHR(13);
  sMsg := sMsg + 'PARA A TURMA: ' + txtTurmaPara.Text + ' (' + txtAnoSemestrePara.Text + ')' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Deseja continuar? ';

  if MessageDlg( sMsg, mtConfirmation, [mbYes, mbNo],  -1, mbNo) = mrNo then Exit;

  // Fazer a confirmação quando não selecionou nenhuma parcela;

  { Filtrar a tabela de Departamentos e Cursos }
  DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );

  strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;

  iCont := 0 ;

  for i := 0 to lstAlunos.Count - 1 do begin
     if lstAlunos.Checked[i] then begin
        INC(iCont);
     end;
  end;

  if iCont <= 0 Then
  Begin
     Mensagem( 'Você precisa selecionar ao menos um aluno para efetuar a geração da reserva.', Application.Title,  MB_OK + MB_ICONWARNING);
     Exit;
  End;

  lngAux := 0;

  frmProcessando.Bar.Max := iCont;
  frmProcessando.Show;

  frmProcessando.lblRegistros.Caption := 'Registros: 1 de ' + IntToStr( iCont );
  frmProcessando.Bar.Position := 1;
  Application.ProcessMessages;

  xMatriculas.First;

  // Pegar os dados do curso e grade somente do primeiro registro

  if xMatriculas.FieldByName('CURSO').AsString <> strCursoPara then
   begin
      NovaMatricula := True;
      Stmt := PrepareStatement(SSQLGrade);
      Stmt.SetString(1, txtTurmaPara.Text);
      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
         begin
            FMatriculaCurso^.Grade := ResultSet.GetIntByName('CD_GRADE');
            FMatriculaCurso^.AnoSemGrade := ResultSet.GetIntByName('NR_ANO_INICIAL');
            FMatriculaCurso^.AnoSemIngresso := DM.GetAnoSemestreAtual;
         end
         else
         begin
            MessageBox(Handle, PChar(SMsgSemGrade), PChar('Atenção'), MB_ICONINFORMATION or MB_OK);
            Exit;
         end;
      finally
         ResultSet.Close;
      end;
   end
   else
      NovaMatricula := False;

  // fim dados do curso e grade

  avisoGeral := '';

  // Percorrer os alunos marcados na lista

  i2:= 1;

  for i := 0 to lstAlunos.Count - 1 do begin

     if lstAlunos.Checked[i] then begin
         avisoAluno := '';

         frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(i2) + ' de ' + IntToStr( iCont );
         frmProcessando.Bar.Position := i2;
         Application.ProcessMessages;

         INC(i2);

        // Posicionar no aluno que será rematriculado
        xMatriculas.GotoBookmark(slAlunos.Objects[i]);

        try
            if NovaMatricula then
            begin
               // Verifica se o aluno já possui matrícula no curso selecionado

               Stmt := PrepareStatement(SSQLProcuraMatriculaCurso);
               try
                  Stmt.SetResultSetConcurrency(rcUpdatable);
                  Stmt.SetInt(1, xMatriculas.FieldByName('CODIGOALUNO').AsInteger);
                  Stmt.SetString(2, strCursoPara);
                  ResultSet := Stmt.ExecuteQueryPrepared;
                  try
                     if ResultSet.Next then
                     begin
                        MatriculaCurso := ResultSet.GetInt(1);
                        if ResultSet.GetInt(2) <> 1 then
                        begin
                           ResultSet.UpdateInt(2, 1);
                           ResultSet.UpdateRow;
                        end;
                     end
                     else
                        MatriculaCurso := GeraMatriculaCurso(xMatriculas.FieldByName('CODIGOALUNO').AsInteger);
                  finally
                     ResultSet.Close;
                  end;
               finally
                  Stmt.Close;
               end;
            end
            else
               MatriculaCurso := xMatriculas.FieldByName('cd_matricula_curso').AsInteger;

            { Tentar registrar a matrícula }
            qryReservar.ParamByName('AnoSemestre').AsInteger    := StrToInt(txtAnoSemestrePara.Text);
            qryReservar.ParamByName('Turma').AsString           := txtTurmaPara.Text;
            qryReservar.ParamByName('CodigoAluno').AsInteger    := xMatriculas.FieldByName('codigoaluno').AsInteger;
            qryReservar.ParamByName('Curso').AsString           := strCursoPara;

            if DM.variavel_parametro('data_emissao_matricula_ativacao') = 'S' then
            begin
               qryReservar.ParamByName('DataEmissao').Clear
            end
            else
            begin
               qryReservar.ParamByName('DataEmissao').AsDateTime := DataHoje;
            end;

            qryReservar.ParamByName('Usuario').AsString         := DM.sLogin;
            qryReservar.ParamByName('PlanoPagamento').AsInteger := tblPlanos.FieldByName('cd_plano').AsInteger;
            qryreservar.ParamByName('cd_matricula_curso').AsInteger := MatriculaCurso;
            qryreservar.ParamByName('cd_ingresso').AsInteger := GetFormaIngresso(2);
            qryReservar.ParamByName('cd_pessoa_matriculou').AsInteger := DM.iCdPessoaLogado;
            qryReservar.ParamByName('sn_matricula_internet').AsInteger := 0;

            qryReservar.ExecSQL;

            qryBloqDataVencto.Close();
            qryBloqDataVencto.ParamByName('cd_pessoa').AsInteger :=  xMatriculas.FieldByName('codigoaluno').AsInteger;
            qryBloqDataVencto.Open();

            GerarMensalidades;

            qryGetTurma.Close;
            qryGetTurma.ParamByName('codigo').AsString           :=  txtTurmaPara.Text;
            qryGetTurma.ParamByName('anosemestre').AsInteger     := StrToInt(txtAnoSemestrePara.Text);
            qryGetTurma.open;
            avisoAluno :=
               DM.MatricularGrade(
                  xMatriculas.FieldByName('CodigoAluno').AsInteger,
                  txtTurmaPara.Text,
                  StrToInt(txtAnoSemestrePara.Text),
                  qryGetTurma.FieldByName('cd_grade').AsString
               );

            if (Length(avisoAluno) > 0) then
            begin
               avisoGeral := avisoGeral + avisoAluno;
            end;

            // Não existia o recalculo nesta tela, deste modo quando o aluno tinha alguma restrição,
            // o valor da mensalidade não seria mais cheio, havendo a necessidade de recalculo dos créditos
            DM.recalcular_creditos_financeiros(
               xMatriculas.FieldByName('codigoaluno').AsInteger,
               txtTurmaPara.Text,
               StrToInt(txtAnoSemestrePara.Text),
               false,
               false);

            DM.setLog(1011, 'Inclusao', xMatriculas.FieldByName('CodigoAluno').AsString + ';' +
                                        txtTurmaDe.Text + ';' +
                                        txtAnoSemestreDe.Text, DM.iColigadaMatriz, 'Reserva efetuada para ' + txtTurmaPara.Text + ' ' + txtAnoSemestrePara.Text);



        except
            { Não conseguiu registrar a matrícula para este aluno }

        end;


     end;


  End;

  if (Length(avisoGeral) > 0) then
  begin
     parametros.titulo := 'Atenção';
     parametros.opcoes := (BT_OK + MB_ICONWARNING);
     parametros.mensagens.msgPrincipal := avisoGeral;
     parametros.mensagens.msgTopo := 'É recomendável verificar algumas situações que ocorreram com os alunos descritos abaixo:';
     parametros.mensagens.msgRodape := '';
     parametros.dimensao.altura := 350;
     parametros.dimensao.largura := 600;

     TfrmMensagem.create(Self, parametros).ShowModal;
  end;

  DM.setLog(1011, 'Inclusao', txtTurmaDe.Text + ';' + txtAnoSemestreDe.Text, DM.iColigadaMatriz, 'Reserva efetuada para ' + txtTurmaPara.Text + ' ' + txtAnoSemestrePara.Text);

  frmProcessando.Close;

  Mensagem( 'Reservas efetuadas com sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION );

end;

procedure TfrmReserva.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   { Definir o Ano/Semestre Atual }
   txtAnoSemestreDe.text := IntToStr(ano_semestre);
   txtAnoSemestrePara.Text := IntToStr(ano_semestre);

   txtAnoSemestreDe.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   txtAnoSemestrePara.Visible := txtAnoSemestreDe.Visible;
   Label2.Visible := txtAnoSemestreDe.Visible;
   Label4.Visible := txtAnoSemestreDe.Visible;
   UpDown1.Visible := txtAnoSemestreDe.Visible;
   UpDown2.Visible := txtAnoSemestreDe.Visible;
end;

procedure TfrmReserva.btnRequerimentosClick(Sender: TObject);
var
   sAux: string;
begin
  if Mensagem( 'Deseja imprimir os requerimentos de matrícula da turma reservada?',
               Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;


  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS  C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('turma').AsString := txtTurmaPara.Text;
  DM.tblCursosTurma.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestrePara.Text);
  DM.tblCursosTurma.Open;

  if Dm.tblCursosTurmaDS_REQUERIMENTO.AsString = '' Then
  Begin
     Mensagem( 'Não existe requerimento definido para este curso.',
            Application.Title, MB_OK );
     Exit;
  End;

  sAux := ' {matriculas.anosemestre} = ' + txtAnoSemestrePara.Text + ' and ';
  sAux := sAux + ' {matriculas.turma} = "' + txtTurmaPara.Text + '"';

  PrincipalForm.ImprimeRpt(Self, Dm.tblCursosTurmaDS_REQUERIMENTO.AsString, -1, sAux, '', nil, nil, nil,nil, True, False, nil, True);

end;

procedure TfrmReserva.btnContratosClick(Sender: TObject);
var
   sAux: string;
begin
  if Mensagem( 'Deseja imprimir os contratos de matrícula da turma reservada?',
               Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Text :=
     ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
     '   FROM TURMAS T ' +
     '  INNER JOIN CURSOS_COLIGADAS  C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
     '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

  DM.tblCursosTurma.ParamByName('turma').AsString := txtTurmaPara.Text;
  DM.tblCursosTurma.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestrePara.Text);
  DM.tblCursosTurma.Open;

  if Dm.tblCursosTurmaDS_CONTRATO.AsString = '' Then
  Begin
     Mensagem( 'Não existe contrato definido para este curso.', Application.Title, MB_OK );
     Exit;
  End;

  sAux := ' {matriculas.anosemestre} = ' + txtAnoSemestrePara.Text + ' and ';
  sAux := sAux + ' {matriculas.turma} = ' + QuotedStr(txtTurmaPara.Text) + '';

  PrincipalForm.Rel.PrintOptions.Copies := 2;

  PrincipalForm.ImprimeRpt(Self, DM.tblCursosTurmaDS_CONTRATO.AsString, -1, sAux, '', nil, nil, nil,nil, True, False, nil, True);

end;

procedure TfrmReserva.Filtra;
begin

  tblPlanos.Close;
  tblPlanos.ParamByName('turma').AsString := txtTurmaPara.Text;
  tblPlanos.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestrePara.Text);
  tblPlanos.Open;

  FreeAndNil(slPlanos);

  slPlanos := TStringList.Create();

  cbPlanos.Clear();
  // Preencher a combo dos planos
  if not tblPlanos.EOF then begin
     tblPlanos.First();

     while not tblPlanos.EOF do begin
       slPlanos.AddObject(tblPlanos.FieldByName('cd_plano').AsString, TObject(tblPlanos.GetBookmark));
       cbPlanos.Items.Add(tblPlanos.FieldByName('ds_plano').AsString);
       tblPlanos.Next();
     end;

     // Selecionar o primeiro plano encontrado
     cbPlanos.ItemIndex := 0;
     tblPlanos.First();
  end;

  CalcularVencimento;
end;

procedure TfrmReserva.txtTurmaParaKeyPress(Sender: TObject; var Key: Char);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   if Key <> #13 then Exit;

   if txtTurmaPara.Text = '' then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

      if not resultado_filtro.filtrado then Exit;

      txtTurmaPara.Text := resultado_filtro.cd_turma;
      txtAnoSemestrePara.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end
   else
   begin
      DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );
      strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
   end;

   SelectNext( TWinControl( Sender ), True, True );
   Key := #0;
   MostrarPlanos();
end;


procedure TfrmReserva.btnExcluirClick(Sender: TObject);
var
  sMsg : String;
  i, i2 : Integer;
  iCont : Integer;
begin

  if not DM.UsuarioLogado.TemPermissao( 1011, npExcluir, True ) then Exit;

  sMsg := 'Atenção:' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Você está tentando excluir as reservas de vaga dos alunos selecionados ' + CHR(13);
  sMsg := sMsg + 'da Turma: ' + txtTurmaDe.Text + ' (' + txtAnoSemestreDe.Text +  ')' + CHR(13);
  sMsg := sMsg + 'Todas as mensalidades geradas para esta reserva serão excluídas.' + CHR(13) + CHR(13);
  sMsg := sMsg + 'Deseja realmente continuar? ';


  if MessageDlg( sMsg, mtConfirmation, [mbYes, mbNo], -1, mbNo) <> mrYes then Exit;

  iCont := 0 ;

  for i := 0 to lstAlunos.Count - 1 do begin
     if lstAlunos.Checked[i] then begin
        INC(iCont);
     end;
  end;

  if iCont <= 0 Then
  Begin
     Mensagem( 'Você precisa selecionar ao menos um aluno para excluir a reserva.', Application.Title,  MB_OK + MB_ICONWARNING);
     Exit;
  End;

  frmProcessando.Bar.Max := iCont;
  frmProcessando.Show;

  i2 := 1;

  for i := 0 to lstAlunos.Count - 1 do begin

     if lstAlunos.Checked[i] then begin

         frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(i2) + ' de ' + IntToStr( iCont );
         frmProcessando.Bar.Position := i2;
         Application.ProcessMessages;

         INC(i2);
     

        // Posicionar no aluno que será rematriculado
        xMatriculas.GotoBookmark(slAlunos.Objects[i]);

        // Excluindo mensalidades na situação de reserva;
        with Dm.qAux1 do begin
            close();
            SQL.Clear;
            SQl.Text := 'DELETE cr.* FROM mensalidades as me ' +
                        ' INNER JOIN fin_mov_cr as cr ON (me.cd_mensalidade = cr.cd_mensalidade) '+
                        ' WHERE me.codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                        '   AND me.turma = "' + txtTurmaDe.Text + '" ' +  
                        '   AND me.anosemestre = ' + txtAnoSemestreDe.Text +
                        '   AND me.situacao = 10 ';
            ExecSQL();
        end;

        with Dm.qAux1 do begin
            close();
            SQL.Clear;
            SQl.Text := ' DELETE FROM mensalidades ' +
                        '  WHERE codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                        '    AND turma = "' + txtTurmaDe.Text + '" ' +
                        '    AND anosemestre = ' + txtAnoSemestreDe.Text +
                        '    AND situacao = 10 ';
            ExecSQL();
        end;


        // Excluir fichaindividual em reserva
        with Dm.qAux1 do begin
            close();
            SQL.Clear;
            SQl.Text := ' DELETE FROM fichaindividual ' +
                        '  WHERE codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                        '    AND turmamatricula = "' + txtTurmaDe.Text + '" ' +
                        '    AND anosemestre = ' + txtAnoSemestreDe.Text +
                        '    AND situacao = 10 ';
            ExecSQL();
        end;

        // Excluir fichaindividual em reserva
        with Dm.qAux1 do begin
            close();
            SQL.Clear;
            SQl.Text := ' DELETE FROM matriculas ' +
                        '  WHERE codigoaluno = ' + xMatriculas.FieldByName('codigoaluno').AsString +
                        '    AND turma = "' + txtTurmaDe.Text + '" ' +
                        '    AND anosemestre = ' + txtAnoSemestreDe.Text +
                        '    AND situacao = 10 ';
            ExecSQL();
        end;

        DM.setLog(1011, 'Exclusao', xMatriculas.FieldByName('CodigoAluno').AsString + ';' +
                                        txtTurmaDe.Text + ';' +
                                        txtAnoSemestreDe.Text, DM.iColigadaMatriz, 'Reserva excluida');

     end;

  end;

  frmProcessando.Close;  

  Mensagem( 'As reservas de matrículas foram excluídas com sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION );
  MostrarAlunos();

end;

function TfrmReserva.GeraMatriculaCurso(const Pessoa: Integer): Integer;
begin
   qryMatriculaCurso.Close;
   qryMatriculaCurso.ParamByName('CD_PESSOA').AsInteger := Pessoa;
   qryMatriculaCurso.Open;
   qryMatriculaCurso.Insert;
   qryMatriculaCursoCD_PESSOA.AsInteger := Pessoa;
   qryMatriculaCursoNR_MATRICULA.AsString := DM.NovoCodMatricula(Pessoa,
      FMatriculaCurso^.Curso, FMatriculaCurso^.AnoSemIngresso,
      FMatriculaCurso^.AnoSemIngresso);
   qryMatriculaCursoCD_CURSO.AsString := FMatriculaCurso^.Curso;
   qryMatriculaCursoCD_GRADE.AsInteger := FMatriculaCurso^.Grade;
   qryMatriculaCursoNR_ANOSEM_GRADE.AsInteger := FMatriculaCurso^.AnoSemGrade;
   qryMatriculaCursoNR_ANOSEM_INGRESSO.AsInteger := FMatriculaCurso^.AnoSemIngresso;
   qryMatriculaCursoCD_TURNO.AsString := FMatriculaCurso^.Turno;
   qryMatriculaCursoCD_SITUACAO.AsInteger := 1;
   qryMatriculaCurso.Post;
   qryMatriculaCurso.Refresh;
   qryMatriculaCurso.Last;
   Result := qryMatriculaCursoCD_MATRICULA_CURSO.AsInteger;
end;

procedure TfrmReserva.GerarMensalidades;
var
   n : Integer;
   dDescCondicional, dDescExtra : Currency;
   iCodMensa : Integer;
   chaves : string;
   Movimento : TMovimento;
   ano, mes, dia : Word;
   Vencto: TDateTime;
   ValorDesconto, Indice : Currency;
   ArrayCodMensalidade: TStringList;
begin

   // Cria novamente o array de codigo de mensalidades
   ArrayCodMensalidade := TStringList.Create;

  { Gerar Mensalidades somente para o aluno selecionado }

  { Verificar se o aluno possue descontos }

  tblPlanoDesc.Close;
  tblPlanoDesc.SQL.Clear;
  tblPlanoDesc.SQL.Text :=
         ' SELECT pd.cd_desconto_pessoa, pd.cd_responsavel, pd.nr_parc_inicio, pd.nr_parc_fim, pd.vl_percentual, d.cd_tipo_desconto as tp_desconto, p.nm_pessoa, d.*, de.descricao From pessoas_descontos pd ' +
         ' INNER JOIN pessoas p ON (pd.cd_pessoa = p.cd_pessoa) ' +
         ' INNER JOIN planosdesconto d ON (pd.cd_desconto = d.codigo) ' +
         ' INNER JOIN departamentos de ON (pd.cd_depto = de.codigo) ' +
         ' WHERE pd.cd_pessoa = :cd_pessoa AND pd.cd_depto = :cd_depto AND COALESCE(pd.cd_curso, :cd_curso) LIKE :cd_curso '+
         ' AND dt_inicio <= :data1 AND dt_fim >= :data2 ' +
         ' ORDER BY pd.CD_DESCONTO_PESSOA DESC ';


  tblPlanoDesc.ParamByName('cd_pessoa').AsInteger := xMatriculas.FieldByName('CodigoAluno').AsInteger;
  tblPlanoDesc.ParamByName('cd_depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
  tblPlanoDesc.ParamByName('cd_curso').AsString := DM.tblDeptoCursoTurmaCurso.AsString;
  tblPlanoDesc.ParamByName('data1').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual);
  tblPlanoDesc.ParamByName('data2').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual);

  tblPlanoDesc.Open();

  qryTiposTituloDesc.Close();
  qryTiposTituloDesc.ParamByName('CD_DESCONTO_PESSOA').AsInteger :=  tblPlanoDesc.FieldByName('cd_desconto_pessoa').AsInteger;
  qryTiposTituloDesc.Open();


  // Percorrer o array de mensalidades e gerar toda as parcelas
  for n := 0 to lst.Count - 1 {tblPlanosParcelas.AsInteger} do
  begin

      // verificar se o aluno te programação de descontos.
      // Por enqaunto está programado para pegar um único desconto

      dDescCondicional := ArrayDescontosPlano[n];
      dDescExtra       := ArrayDescontosExtraPlano[n];

      if (not tblPlanoDesc.Eof)
      and (ArrayParcelas[n] >= tblPlanoDesc.FieldByName('nr_parc_inicio').AsInteger)
      and (ArrayParcelas[n] <= tblPlanoDesc.FieldByName('nr_parc_fim').AsInteger)
      and (tblPlanoDesc.FieldByName('cd_responsavel').AsInteger <= 0 )
      AND (qryTiposTituloDesc.Locate('CD_TIPO_TITULO', ArrayTipoParcela[n], [])) then
      begin

         iAcaoDesconto := tblPlanoDesc.FieldByName('cd_acao_movimento').AsInteger;

         // Verifica se o desconto é valor REAL ou um PERCENTUAL
         if not tblPlanoDesc.FieldByName('VL_PERCENTUAL').IsNull then
         begin
            // Caso PERCENTUAL então cálcula o valor do desconto que será aplicado
            ValorDesconto := ( ArrayValores[n] - ArrayDescontosExtraPlano[n]) *
               tblPlanoDesc.FieldByName('VL_PERCENTUAL').AsCurrency / 100;
         end
         else
         begin
            // Caso REAL somente atribui armazena o valor do desconto
            ValorDesconto :=tblPlanoDesc.FieldByName('VL_DESCONTO').AsCurrency;
         end;

         // Verifica se o desconto é FIXO ou CONDICIONAL:

         // CONDICIONAL - coluna VALORDESCONTO na tabela de MENSALIDADES
         if tblPlanoDesc.FieldByName('SN_CONDICIONAL').AsInteger = 1 then
         begin

            // Grava o código da ação de movimento para desconto condicional
            // CLAU cdsParcelasCD_DESC_CONDICIONAL.AsInteger := fMatricularDescontoProg.qryDescontoProgCD_ACAO_MOVIMENTO.AsInteger;

            // Verifica o tipo de desconto a ser utilizado:
            // 0 - Soma
            // 1 - Proporcional
            // 2 - Sobrepor
            case tblPlanoDesc.FieldByName('TP_DESCONTO').AsInteger of

               0:
                  // Aplica o desconto condicional programado utilizando a
                  // forma de aplicação do tipo soma, ou seja, mantém o
                  // desconto condicional pré-definido no plano de pagamento
                  // e adiciona o desconto condicional programado para esta
                  // pessoa

                     dDescCondicional :=
                        ArrayDescontosPlano[n] + ValorDesconto;
               1:
                  // Aplica o desconto condicional de forma proporcional ao
                  // desconto condicional aplicado à parcela conforme o plano
                  // de pagamento selecionado

                  begin
                     Indice :=
                        ArrayDescontosPlano[n] /
                        ArrayValores[n];

                     ValorDesconto :=
                        (ArrayValores[n] - ValorDesconto) *
                           Indice + ValorDesconto;

                     dDescCondicional := ValorDesconto;
                  end;

               2:
                  // Aplica o desconto condicional programado na forma de
                  // sobreposição ao desconto condicional cadastrado no
                  // plano de pagamento selecionado no processo de
                  // matrícula da pessoa

                  dDescCondicional := ValorDesconto;
            end;

            // Verifica se os descontos ultrapassam o valor da parcela
            if (ArrayValores[n] +
                ArrayValorExtra[n] -
                ArrayDescontosExtraPlano[n]) < ValorDesconto then
            begin
               // Se os descontos ultrapassarem o valor da parcela ajusta
               // para que o desconto condicional somente complete o valor da parcela 
               dDescCondicional :=
                  (ArrayValores[n] + ArrayValorExtra[n] - ArrayDescontosExtraPlano[n]);
            end;
         end
         else
         begin // Desconto fixo
            // Grava o código da ação de movimento para desconto fixo
            // CLAU cdsParcelasCD_ACAO_MOVIMENTO.AsInteger := fMatricularDescontoProg.qryDescontoProgCD_ACAO_MOVIMENTO.AsInteger;

            // O desconto fixo sempre é somado ao desconto que já existe
            dDescExtra :=
               ArrayDescontosExtraPlano[n] +
               ValorDesconto;

            // Verifica o tipo de desconto a ser utilizado, esses tipos de desconto
            // influenciam somente no desconto condicional (e não no fixo):
            // 0 - Soma (Não modifica o desconto condicional)
            // 1 - Proporcional (Reajusta o valor do desconto condicional de forma proporcional)
            // 2 - Sobrepor (Zera o desconto condicional)
            case tblPlanoDesc.FieldByName('TP_DESCONTO').AsInteger of
               0: ; // Não modifica o desconto condicional
               1:
                  // Reajusta o valor do desconto condicional (proporcionalmente)
                  begin
                     Indice :=
                        ArrayDescontosPlano[n] /
                        ArrayValores[n];

                     ValorDesconto := (
                        ArrayValores[n] -
                        dDescExtra) * Indice;

                     dDescCondicional := ValorDesconto;
                  end; 
               2:
                  // Remove o desconto condicional
                  dDescCondicional := 0;
            end;

            //////////////////////////////////////////
            // TRATAMENTO PARA QUANDO OS DESCONTOS
            // ULTRAPASSAM O VALOR DA PARCELA
            //////////////////////////////////////////

            // Verifica se o valor de desconto FIXO é maior que o valor total da parcela
            if (ArrayValores[n] + ArrayValorExtra[n] ) < dDescExtra then
            begin
               // Se desconto FIXO é maior que valor da parcela, altera o valor de desconto FIXO para ser igual o valor da parcela
               dDescExtra :=
                  ArrayValores[n] + ArrayValorExtra[n];
               // Zera o desconto CONDICIONAL   
               dDescCondicional := 0;
            end
            else

            // Verifica se o valor de desconto CONDICIONAL é maior do que ainda
            // se precisa pagar na parcela (valor da PARCELA - desconto FIXO)
            if ((ArrayValores[n] + ArrayValorExtra[n] ) - dDescExtra) <
               dDescCondicional then
            begin
               // Se for maior então ajusta o desconto CONDICIONAL para cobrir
               // o restante que falta pagar 
               dDescCondicional :=
                  ((ArrayValores[n] + ArrayValorExtra[n] ) - dDescExtra);
            end;

         end;
      end;

      // FIM LOGICA DA PROGRAMAÇÃO DE DESCONTOS

      if qryBloqDataVenctonr_dia_vencimento.AsInteger > 0 then begin

         DecodeDate(ArrayDatas[n], ano, mes, dia);

         Vencto := DataValida(ano, mes, qryBloqDataVenctonr_dia_vencimento.AsInteger );

      end
      else
         Vencto := ArrayDatas[n];

      iCodMensa := Dm.GerarMensalidade(

         xMatriculas.FieldByName('CodigoAluno').AsInteger,
         ArrayParcelas[n],
         txtTurmaPara.Text,
         RoundFloat( ArrayValores[n], 2 ),
         0,
         StrToInt(txtAnoSemestrePara.Text),
         Vencto,
         Vencto,
         10, // parcelas reservadas
         DM.tblDeptoCursoTurmaCurso.AsString,
         DM.tblDeptoCursoTurmaDepto.AsInteger,
         0,
         -1,
         dDescCondicional,
         ArrayNr_Credito[n],
         ArrayDescricaoTipo[n],
         ArrayTipoParcela[n],
         ArrayPlanoContas[n],
         DM.tblDeptoCursoTurmacd_centro.AsInteger,
         dDescExtra,
         ArrayValorExtra[n],
         ArraySN_Credito[n],
          ArrayValorCredito[n],
         ArrayItemPlano[n], 10, 0, 0, Dm.tblDeptoCursoTurmacd_coligada.AsInteger
      );

      // Adiciona o código da mensalidade
      ArrayCodMensalidade.Add(IntToStr(iCodMensa));

      // Gerar Movimentação do desconto extra

      if dDescExtra > 0 then begin

          Movimento := TMovimento.create;
          try
             movimento.TipoDeAcao      := BaixarporDesconto;
             movimento.CodigoTitulo    := iCodMensa;
             if iAcaoDesconto = 0 then begin
                iAcaoDesconto := DM.BuscarCodigoAcaoPadrao( 11 );
             end;
             movimento.CodAcao         := iAcaoDesconto;
             movimento.ValorMovimento  := dDescExtra;
             movimento.RegistrarMovimentacaoCR( 0 );
          finally
             FreeAndNil(Movimento);
          end;

      end;

  end;

   for n := 0 to ArrayCodMensalidade.Count-1 do
   begin
      iCodMensa := StrToInt(ArrayCodMensalidade[n]);
      DivisaoTitulo(iCodMensa);
   end;

end;

procedure TfrmReserva.DivisaoTitulo(iMensalidade: Integer);
var
   qyDadosMensalidade, qyUpdateMensalidade, qyMovimentacaoDivisao : TUMZQuery;
   percResponsavel, percAluno, descontoExtra, valorDesconto, valorBruto, valorExtra, valorJuros,
   valorCredito, valorTotalAPagarResponsavel, valorSaida, valorTotalAPagarAluno,
   valorDescontoAcumulado, valorDescontoExcedente : Double;
   dividirDescontoFixo, dividirDescontoCondicional : Boolean;
   obsDescontoProgramadoCondicional, mensalidadeDataBaixa, chaves : String;
   cd_mensalidade_resp, cd_mensalidade_aluno, i : Integer;
   Movimento : TMovimento;
   movimentacaoResp : TStringList;
   snCreditoParcela : Char;
begin

   DM.CriarConsulta(qyDadosMensalidade);
   DM.CriarConsulta(qyUpdateMensalidade);
   DM.CriarConsulta(qyMovimentacaoDivisao);

   // SQL que verifica se o aluno possui alguma divisão de título programada
   qryDivisaoProgramada.SQL.Text := ' SELECT  ' +
                                    '    pd.* ' +
                                    ' FROM    ' +
                                    '    pessoas_descontos pd ' +
                                    '    INNER JOIN fin_tp_titulos_pessoas_desc tptp ON (tptp.cd_desconto_pessoa = pd.cd_desconto_pessoa) ' +
                                    ' WHERE ' +
                                    '    pd.tp_desconto = 2 AND ' +
                                    '    pd.cd_pessoa = :CD_PESSOA AND ' +
                                    '    pd.cd_depto = :CD_DEPTO AND ' +
                                    '    pd.nr_parc_inicio <= :NR_PARCELA AND ' +
                                    '    pd.nr_parc_fim >= :NR_PARCELA AND ' +
                                    '    tptp.cd_tipo_titulo = :CD_TIPO_TITULO AND ' +
                                    '    CASE WHEN :CD_COLIGADA > 0 THEN tptp.cd_coligada = :CD_COLIGADA ELSE 1=1 END AND ' +
                                    '    CURDATE() BETWEEN pd.dt_inicio AND pd.dt_fim ' +
                                    ' ORDER BY ' +
                                    '    pd.cd_desconto_pessoa DESC ' +
                                    ' LIMIT 1 ';

   qyDadosMensalidade.Close;
   qyDadosMensalidade.SQL.Text := 'SELECT * FROM mensalidades WHERE cd_mensalidade = ' + IntToStr(iMensalidade);
   qyDadosMensalidade.Open;

   if qyDadosMensalidade.FieldByName('sn_credito_parcela').AsString = 'S' then
   begin
      snCreditoParcela := 'S';
   end else begin
      snCreditoParcela := 'N';
   end;

   { Verificar se o aluno possui divisão de título }
   qryDivisaoProgramada.Close;
   qryDivisaoProgramada.ParamByName('CD_PESSOA').AsInteger := xMatriculas.FieldByName('CodigoAluno').AsInteger;
   qryDivisaoProgramada.ParamByName('CD_DEPTO').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
   qryDivisaoProgramada.ParamByName('NR_PARCELA').AsInteger := qyDadosMensalidade.FieldByName('parcela').AsInteger;
   qryDivisaoProgramada.ParamByName('CD_TIPO_TITULO').AsInteger := qyDadosMensalidade.FieldByName('cd_tipo_titulo').AsInteger;
   qryDivisaoProgramada.ParamByName('CD_COLIGADA').AsInteger := Dm.tblDeptoCursoTurmacd_coligada.AsInteger;
   qryDivisaoProgramada.Open;

   while not qryDivisaoProgramada.Eof do
   begin

      // Verifica se existe a divisão de títulos e também a mensalidade
      if (qryDivisaoProgramada.FieldByName('cd_desconto_pessoa').AsInteger > 0) and (iMensalidade > 0) then
      begin

         // Verifica a situação da mensalidade, se a mesma já estiver baixada não há porque dividir
         // Caso a situação da mensalidade seja 6 = Baixa por desconto, não é necessário dividir a parcela
         if (qyDadosMensalidade.FieldByName('situacao').AsInteger = 6) then
         begin
            Exit;
         end;

         // Se existir a divisão de títulos, primeiramente verifica se ela é de 100%
         if (qryDivisaoProgramada.FieldByName('vl_percentual').AsFloat >= 100) then
         begin
            // Transfere o título para o novo responsável
            qyUpdateMensalidade.Close;
            qyUpdateMensalidade.SQL.Text := 'UPDATE mensalidades SET cd_resp = ' + qryDivisaoProgramada.FieldByName('cd_responsavel').AsString + ' WHERE cd_mensalidade = ' + IntToStr(iMensalidade);
            qyUpdateMensalidade.ExecSQL;
            Exit;
         end;

         // Cálcula o percentual a pagar do título pelo Responsável
         percResponsavel := qryDivisaoProgramada.FieldByName('vl_percentual').AsFloat / 100;
         // Cálcula o percentual a pagar do título pelo Aluno
         percAluno := 1 - percResponsavel;

         {**********************************************
          * Geração da Mensalidade do Responsável
          **********************************************}
             
         dividirDescontoFixo := (UpperCase(DM.variavel_parametro('divisao_titulos.dividir_desconto_fixo')) = 'S');
         if (dividirDescontoFixo = true) then
         begin
             descontoExtra := RoundFloat(qyDadosMensalidade.FieldByName('DescontoExtra').AsFloat * percResponsavel, 2);
         end else begin
             descontoExtra := 0;
         end;

         dividirDescontoCondicional := (UpperCase(DM.variavel_parametro('divisao_titulos.dividir_desconto_condicional')) = 'S');
         if (dividirDescontoCondicional = true) then
         begin
            valorDesconto := RoundFloat(qyDadosMensalidade.FieldByName('ValorDesconto').AsFloat * percResponsavel, 2);
            obsDescontoProgramadoCondicional := qyDadosMensalidade.FieldByName('ds_obs_desc').AsString;
         end else begin
            valorDesconto := 0;
            obsDescontoProgramadoCondicional := '';
         end;

         valorBruto := RoundFloat((qyDadosMensalidade.FieldByName('ValorBruto').AsFloat * percResponsavel), 2);
         valorExtra := RoundFloat((qyDadosMensalidade.FieldByName('ValorExtra').AsFloat * percResponsavel), 2);
         valorJuros := RoundFloat((qyDadosMensalidade.FieldByName('ValorJuros').AsFloat * percResponsavel), 2);
         valorCredito := qyDadosMensalidade.FieldByName('vl_credito').AsFloat * percResponsavel;
         valorTotalAPagarResponsavel := (valorBruto+valorExtra);

         // Cria a parcela do responsável
         cd_mensalidade_resp := DM.GerarMensalidade(
            xMatriculas.FieldByName('CodigoAluno').AsInteger,
            qyDadosMensalidade.FieldByName('parcela').AsInteger,
            txtTurmaPara.Text, valorBruto, valorJuros, StrToInt(txtAnoSemestrePara.Text),
            qyDadosMensalidade.FieldByName('datavencimento').AsDateTime,
            qyDadosMensalidade.FieldByName('dt_competencia').AsDateTime,
            10,
            DM.tblDeptoCursoTurmaCurso.AsString,
            DM.tblDeptoCursoTurmaDepto.AsInteger,
            0,
            -1,
            valorDesconto,
            qyDadosMensalidade.FieldByName('nr_creditos').AsFloat,
            qyDadosMensalidade.FieldByName('ds_historico').AsString,
            qyDadosMensalidade.FieldByName('cd_tipo_titulo').AsInteger,
            qyDadosMensalidade.FieldByName('cd_plano_conta').AsInteger,
            qyDadosMensalidade.FieldByName('cd_centro_custo').AsInteger,
            descontoExtra, valorExtra,
            snCreditoParcela,
            valorCredito,
            qyDadosMensalidade.FieldByName('cd_item_plano').AsInteger, 10, 0, 0,
            Dm.tblDeptoCursoTurmacd_coligada.AsInteger, 0, 100,
            0, obsDescontoProgramadoCondicional
         );

         // Atualizando os campos cd_resp e vl_percentual_divisao da mensalidade do responsável
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := 'UPDATE mensalidades SET vl_percentual_divisao = ' + FloatToStr(percResponsavel*100) + ', cd_resp = ' + qryDivisaoProgramada.FieldByName('cd_responsavel').AsString + ' WHERE cd_mensalidade = ' + IntToStr(cd_mensalidade_resp);
         qyUpdateMensalidade.ExecSQL;

         // Se irá dividir o desconto fixo entre o responsável então gera as movimentações financeiras, caso contrário não
         if (dividirDescontoFixo = true) then
         begin
            qyMovimentacaoDivisao.Close;
            qyMovimentacaoDivisao.SQL.Text := ' SELECT ' +
                                              '    cr.cd_mensalidade, cr.cd_acao, cr.vl_saida, ds_observacao ' +
                                              ' FROM ' +
                                              '    fin_mov_cr cr ' +
                                              '    INNER JOIN fin_acoes_movimento am ON (cr.cd_acao = am.cd_acao) ' +
                                              ' WHERE ' +
                                              '    am.cd_tipo_acao = 3 AND ' +
                                              '    am.cd_origem = 1 AND ' +
                                              '    cr.cd_mensalidade = ' + IntToStr(iMensalidade);
            qyMovimentacaoDivisao.Open;

            // Cria as ações de movimento para a mensalidade do responsável
            while not qyMovimentacaoDivisao.Eof do
            begin
               // Cálcula o valor de saída
               valorSaida := RoundFloat(qyMovimentacaoDivisao.FieldByName('vl_saida').AsFloat * percResponsavel, 2);
               // Gera a movimentação de desconto do responsável
               Movimento := TMovimento.create;
               try
                  movimento.TipoDeAcao      := BaixarporDesconto;
                  movimento.CodigoTitulo    := cd_mensalidade_resp;
                  movimento.CodAcao         := qyMovimentacaoDivisao.FieldByName('cd_acao').AsInteger;
                  movimento.ValorMovimento  := valorSaida;
                  movimento.RegistrarMovimentacaoCR( 0 );
               finally
                  FreeAndNil(Movimento);
               end;

               qyMovimentacaoDivisao.Next;
            end;

         end;

         {**********************************************
          * Geração da Mensalidade do Aluno
          **********************************************}

         if (dividirDescontoFixo = true) then
         begin
             descontoExtra := qyDadosMensalidade.FieldByName('DescontoExtra').AsFloat - RoundFloat(qyDadosMensalidade.FieldByName('DescontoExtra').AsFloat * percResponsavel, 2);
         end else begin
             descontoExtra := qyDadosMensalidade.FieldByName('DescontoExtra').AsFloat;
         end;

         if (dividirDescontoCondicional = true) then
         begin
            valorDesconto := qyDadosMensalidade.FieldByName('ValorDesconto').AsFloat - RoundFloat(qyDadosMensalidade.FieldByName('ValorDesconto').AsFloat * percResponsavel, 2);
         end else begin
            valorDesconto := qyDadosMensalidade.FieldByName('ValorDesconto').AsFloat;
         end;

         valorBruto := qyDadosMensalidade.FieldByName('ValorBruto').AsFloat - RoundFloat(qyDadosMensalidade.FieldByName('ValorBruto').AsFloat * percResponsavel, 2);
         valorExtra := qyDadosMensalidade.FieldByName('ValorExtra').AsFloat - RoundFloat(qyDadosMensalidade.FieldByName('ValorExtra').AsFloat * percResponsavel, 2);
         valorJuros := qyDadosMensalidade.FieldByName('ValorJuros').AsFloat - RoundFloat(qyDadosMensalidade.FieldByName('ValorJuros').AsFloat * percResponsavel, 2);
         valorCredito := qyDadosMensalidade.FieldByName('vl_credito').AsFloat * percAluno;
         valorTotalAPagarAluno := (valorBruto + valorExtra);

         // Cria a parcela do aluno
         cd_mensalidade_aluno := DM.GerarMensalidade(
            xMatriculas.FieldByName('CodigoAluno').AsInteger,
            qyDadosMensalidade.FieldByName('parcela').AsInteger,
            txtTurmaPara.Text, valorBruto, valorJuros, StrToInt(txtAnoSemestrePara.Text),
            qyDadosMensalidade.FieldByName('datavencimento').AsDateTime,
            qyDadosMensalidade.FieldByName('dt_competencia').AsDateTime,
            10,
            DM.tblDeptoCursoTurmaCurso.AsString,
            DM.tblDeptoCursoTurmaDepto.AsInteger,
            0,
            -1,
            valorDesconto,
            qyDadosMensalidade.FieldByName('nr_creditos').AsFloat,
            qyDadosMensalidade.FieldByName('ds_historico').AsString,
            qyDadosMensalidade.FieldByName('cd_tipo_titulo').AsInteger,
            qyDadosMensalidade.FieldByName('cd_plano_conta').AsInteger,
            qyDadosMensalidade.FieldByName('cd_centro_custo').AsInteger,
            descontoExtra, valorExtra,
            snCreditoParcela,
            valorCredito,
            qyDadosMensalidade.FieldByName('cd_item_plano').AsInteger, 10, 0, 0,
            Dm.tblDeptoCursoTurmacd_coligada.AsInteger, 0, 100,
            0, obsDescontoProgramadoCondicional
         );

         // Atualizando os campos vl_percentual_divisao da mensalidade do responsável
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := 'UPDATE mensalidades SET vl_percentual_divisao = ' + FloatToStr(percAluno*100) + ' WHERE cd_mensalidade = ' + IntToStr(cd_mensalidade_aluno);
         qyUpdateMensalidade.ExecSQL;

         // Recupera as movimentações financeiras da mensalidade original
         qyMovimentacaoDivisao.Close;
         qyMovimentacaoDivisao.SQL.Text := ' SELECT ' +
                                           '    cr.cd_mensalidade, cr.cd_acao, cr.vl_saida, ds_observacao ' +
                                           ' FROM ' +
                                           '    fin_mov_cr cr ' +
                                           '    INNER JOIN fin_acoes_movimento am ON (cr.cd_acao = am.cd_acao) ' +
                                           ' WHERE ' +
                                           '    am.cd_tipo_acao = 3 AND ' +
                                           '    am.cd_origem = 1 AND ' +
                                           '    cr.cd_mensalidade = ' + IntToStr(iMensalidade);
         qyMovimentacaoDivisao.Open;

         // Cria as ações de movimento para a mensalidade do responsável
         valorDescontoAcumulado := 0;
         valorDescontoExcedente := 0;
         movimentacaoResp := TStringList.Create;

         // Cria as ações de movimento para a mensalidade do responsável
         while not qyMovimentacaoDivisao.Eof do
         begin

            // Se irá dividir o desconto fixo entre o responsável então efetua o cálculo para divisão
            if (dividirDescontoFixo = true) then
            begin
               valorSaida := qyMovimentacaoDivisao.FieldByName('vl_saida').AsFloat - RoundFloat(qyMovimentacaoDivisao.FieldByName('vl_saida').AsFloat * percResponsavel, 2);
            end else begin
               valorSaida := qyMovimentacaoDivisao.FieldByName('vl_saida').AsFloat;

               // Soma o valor de desconto fixo ao acumulado
               valorDescontoAcumulado := valorDescontoAcumulado + valorSaida;

               // Verifica se o valor acumulado de desconto fixo é maior que o valor total a ser pago
               if (valorDescontoAcumulado > valorTotalAPagarAluno) then
               begin
                  // Cálcula o valor sobresalente (que sobrou) de desconto o qual será repassado para o responsavel
                  valorDescontoExcedente := valorDescontoAcumulado - valorTotalAPagarAluno;
                  // Cálcula o novo valor de saída a ser jogado na movimentação do aluno
                  valorSaida := valorSaida - valorDescontoExcedente;
               end;
            end;

            Movimento := TMovimento.create;
            try
               movimento.TipoDeAcao      := BaixarporDesconto;
               movimento.CodigoTitulo    := cd_mensalidade_aluno;
               movimento.CodAcao         := qyMovimentacaoDivisao.FieldByName('cd_acao').AsInteger;
               movimento.ValorMovimento  := valorSaida;
               movimento.RegistrarMovimentacaoCR( 0 );
            finally
               FreeAndNil(Movimento);
            end;

            // Se o valor de desconto já ultrapassou a parcela do aluno então não aplica mais os descontos
            if (valorDescontoExcedente > 0) then
            begin
               movimentacaoResp.Values['cd_acao'] := qyMovimentacaoDivisao.FieldByName('cd_acao').AsString;
               movimentacaoResp.Values['ds_observacao'] := qyMovimentacaoDivisao.FieldByName('ds_observacao').AsString;
               break;
            end;

            qyMovimentacaoDivisao.Next;
         end;

         {**********************************************
          * Aplicar desconto Excedente do aluno para o Responsável
          **********************************************}
         if ((dividirDescontoFixo = false) and (valorDescontoExcedente > 0)) then
         begin

            valorDescontoAcumulado := valorDescontoExcedente;
            if (valorDescontoAcumulado > valorTotalAPagarResponsavel) then
            begin
               // Cálcula o novo valor de saída a ser jogado na movimentação do aluno
               valorSaida := valorTotalAPagarResponsavel;

               // Gera a movimentação financeira do desconto excedente
               Movimento := TMovimento.create;
               try
                  movimento.TipoDeAcao      := BaixarporDesconto;
                  movimento.CodigoTitulo    := cd_mensalidade_resp;
                  movimento.CodAcao         := StrToInt(movimentacaoResp.Values['cd_acao']);
                  movimento.ValorMovimento  := valorSaida;
                  movimento.Observacao      := movimentacaoResp.Values['ds_observacao'] + ' (Desconto excedente do aluno)';
                  movimento.RegistrarMovimentacaoCR( 0 );
               finally
                  FreeAndNil(Movimento);
               end;

            end else begin

               // Gera a movimentação financeira do desconto excedente
               Movimento := TMovimento.create;
               try
                  movimento.TipoDeAcao      := BaixarporDesconto;
                  movimento.CodigoTitulo    := cd_mensalidade_resp;
                  movimento.CodAcao         := StrToInt(movimentacaoResp.Values['cd_acao']);
                  movimento.ValorMovimento  := valorDescontoExcedente;
                  movimento.Observacao      := movimentacaoResp.Values['ds_observacao'] + ' (Desconto excedente do aluno)';
                  movimento.RegistrarMovimentacaoCR( 0 );
               finally
                  FreeAndNil(Movimento);
               end;               

            end;
            
            valorDescontoExcedente := 0;
            while not qyMovimentacaoDivisao.Eof do
            begin
               // Soma o valor de desconto fixo ao acumulado
               valorDescontoAcumulado := valorDescontoAcumulado + qyMovimentacaoDivisao.FieldByName('vl_saida').AsFloat;
               // Define o valor de saida
               valorSaida := qyMovimentacaoDivisao.FieldByName('vl_saida').AsFloat;

               // Verifica se o valor acumulado de desconto fixo é maior que o valor total a ser pago
               if (valorDescontoAcumulado > valorTotalAPagarResponsavel) then
               begin
                  // Cálcula o valor sobresalente (que sobrou) de desconto
                  valorDescontoExcedente := valorDescontoAcumulado - valorTotalAPagarResponsavel;
                  // Cálcula o novo valor de saída a ser jogado na movimentação do responsável
                  valorSaida := valorSaida - valorDescontoExcedente;
               end;

               // Gera a movimentação financeira do desconto excedente
               Movimento := TMovimento.create;
               try
                  movimento.TipoDeAcao      := BaixarporDesconto;
                  movimento.CodigoTitulo    := cd_mensalidade_resp;
                  movimento.CodAcao         := qyMovimentacaoDivisao.FieldByName('cd_acao').AsInteger;
                  movimento.ValorMovimento  := valorSaida;
                  movimento.Observacao      := qyMovimentacaoDivisao.FieldByName('ds_observacao').AsString + ' (Desconto excedente do aluno)';
                  movimento.RegistrarMovimentacaoCR( 0 );
               finally
                  FreeAndNil(Movimento);
               end;

               // Se o valor de desconto já ultrapassou a parcela do responsável então não aplica mais os descontos
               if (valorDescontoExcedente > 0) then
               begin
                  break;
               end;

               qyMovimentacaoDivisao.Next;               
            end;

            // Atualiza o campo de desconto extra do responsável (com os descontos excedentes)
            qyUpdateMensalidade.Close;
            qyUpdateMensalidade.SQL.Text := 'UPDATE mensalidades SET descontoextra = ' + FloatToStr(descontoextra+valorDescontoAcumulado) + ' WHERE cd_mensalidade = ' + IntToStr(cd_mensalidade_resp);
            qyUpdateMensalidade.ExecSQL;

         end;

         // Corrige o desconto condicional/extra da mensalidade do aluno
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := ' UPDATE mensalidades SET ' +
                                         '   valordesconto = CASE WHEN valordesconto > (valorbruto+valorextra-descontoextra) THEN (valorbruto+valorextra-descontoextra) ELSE valordesconto END, ' +
                                         '   descontoextra = CASE WHEN descontoextra > (valorbruto+valorextra) THEN (valorbruto+valorextra) ELSE descontoextra END ' +
                                         ' WHERE cd_mensalidade = ' + IntToStr(cd_mensalidade_aluno);
         qyUpdateMensalidade.ExecSQL;

         // Corrige o desconto condicional/extra da mensalidade do responsável
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := ' UPDATE mensalidades SET ' +
                                         '   valordesconto = CASE WHEN valordesconto > (valorbruto+valorextra-descontoextra) THEN (valorbruto+valorextra-descontoextra) ELSE valordesconto END, ' +
                                         '   descontoextra = CASE WHEN descontoextra > (valorbruto+valorextra) THEN (valorbruto+valorextra) ELSE descontoextra END ' +
                                         ' WHERE cd_mensalidade = ' + IntToStr(cd_mensalidade_resp);
         qyUpdateMensalidade.ExecSQL;

         // Verificar se existe a baixa por desconto na mensalidade do Aluno
         if ( cd_mensalidade_aluno > 0 ) then
         begin
            // Verifica a situação da mensalidade, se a mesma já estiver baixada não há porque dividir
            mensalidadeDataBaixa := UpperCase(DM.variavel_parametro('mensalidades_data_baixa'));
            if Length(mensalidadeDataBaixa) = 0 then
            begin
               mensalidadeDataBaixa := '[BAIXA]';
            end;

            // Atualizar a baixa por desconto
            qyUpdateMensalidade.SQL.Text := ' UPDATE '+
                                            '    mensalidades '+
                                            ' SET '+
                                            '    situacao = 6, '+
                                            '    valordesconto = 0, '+
                                            '    datapagamento = CASE WHEN ((curdate() < datavencimento) OR ("'+mensalidadeDataBaixa+'" LIKE "[VENCIMENTO]")) AND ("'+mensalidadeDataBaixa+'" LIKE "[BAIXA]") THEN datavencimento ELSE curdate() END, '+
                                            '    valortotal = CASE WHEN (valorbruto + valorextra + valorjuros - descontoextra - valordesconto) < 0 THEN 0 ELSE (valorbruto + valorextra + valorjuros - descontoextra - valordesconto) END '+
                                            ' WHERE '+
                                            '    (descontoextra >= (valorbruto+valorextra)) '+
                                            '    AND cd_mensalidade = ' + IntToStr(cd_mensalidade_aluno);

            qyUpdateMensalidade.ExecSQL;
         end;

         // Verificar se existe a baixa por desconto na mensalidade do Responsável
         if ( cd_mensalidade_resp > 0 ) then
         begin
            // Verifica a situação da mensalidade, se a mesma já estiver baixada não há porque dividir
            mensalidadeDataBaixa := UpperCase(DM.variavel_parametro('mensalidades_data_baixa'));
            if Length(mensalidadeDataBaixa) = 0 then
            begin
               mensalidadeDataBaixa := '[BAIXA]';
            end;

            // Atualizar a baixa por desconto
            qyUpdateMensalidade.SQL.Text := ' UPDATE '+
                                            '    mensalidades '+
                                            ' SET '+
                                            '    situacao = 6, '+
                                            '    valordesconto = 0, '+
                                            '    datapagamento = CASE WHEN ((curdate() < datavencimento) OR ("'+mensalidadeDataBaixa+'" LIKE "[VENCIMENTO]")) AND ("'+mensalidadeDataBaixa+'" LIKE "[BAIXA]") THEN datavencimento ELSE curdate() END, '+
                                            '    valortotal = CASE WHEN (valorbruto + valorextra + valorjuros - descontoextra - valordesconto) < 0 THEN 0 ELSE (valorbruto + valorextra + valorjuros - descontoextra - valordesconto) END '+
                                            ' WHERE '+
                                            '    (descontoextra >= (valorbruto+valorextra)) '+
                                            '    AND cd_mensalidade = ' + IntToStr(cd_mensalidade_resp);

            qyUpdateMensalidade.ExecSQL;
         end;

         {**********************************************
          * Gerar log da divisão de título
          **********************************************}    
         chaves := FillString(xMatriculas.FieldByName('CodigoAluno').AsString, alRight, '0', 10, true ) + ';' +
                   txtAnoSemestrePara.Text + ';' + txtTurmaPara.Text + ';' +
                   qyDadosMensalidade.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qyDadosMensalidade.FieldByName('datavencimento').AsDateTime) + ';';

         DM.setLog(2, 'Alteracao', chaves, Dm.getColigadaByTurma(qyDadosMensalidade.FieldByName('turma').AsString, qyDadosMensalidade.FieldByName('anosemestre').AsInteger), 'Parcela Dividida. (NN = ' + qyDadosMensalidade.FieldByName('nossonumero').AsString +  ')');

         {**********************************************
          * Apaga a mensalidade original
          **********************************************}

         // Apaga as movimentações financeiras da mensalidade original
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := ' DELETE FROM fin_mov_cr WHERE cd_mensalidade = ' + IntToStr(iMensalidade);
         qyUpdateMensalidade.ExecSQL;
         
         // Apaga a mensalidade original
         qyUpdateMensalidade.Close;
         qyUpdateMensalidade.SQL.Text := ' DELETE FROM mensalidades WHERE cd_mensalidade = ' + IntToStr(iMensalidade);
         qyUpdateMensalidade.ExecSQL;

      end;

      qryDivisaoProgramada.Next;
   end;

end;

procedure TfrmReserva.MostrarAlunos;
begin

   // Tem que ter uma turma de origem selecionada
   if TRIM(txtTurmaDe.Text) = '' then exit;


   if snTelaExcluirReserva then begin

      xMatriculas.SQL.Text :=
      ' SELECT ma.cd_matricula_curso, ma.codigoaluno, pe.nm_pessoa, si.ds_situacao, ma.curso from matriculas as ma ' +
      '  INNER JOIN pessoas as pe ON (pe.cd_pessoa = ma.codigoaluno) ' +
      '  INNER JOIN situacao as si ON (si.cd_situacao= ma.situacao) ' +
      '  WHERE situacao = 10 ' +
      '    AND ma.turma = :turma ' +
      '    AND ma.anosemestre = :anosemestre ' +
      '  ORDER BY pe.nm_pessoa ';

   end else begin

      xMatriculas.SQL.Text :=
      ' SELECT ma.cd_matricula_curso, ma.codigoaluno, pe.nm_pessoa, si.ds_situacao, ma.curso from matriculas as ma ' +
      '  INNER JOIN pessoas as pe ON (pe.cd_pessoa = ma.codigoaluno) ' +
      '  INNER JOIN situacao as si ON (si.cd_situacao= ma.situacao) ' +
      '  WHERE situacao not in (3,4,5,6,7,8,10) ' +
      '    AND ma.turma = :turma ' +
      '    AND ma.anosemestre = :anosemestre ' +
      '  ORDER BY pe.nm_pessoa ';   


   end;
   
   xMatriculas.Close;
   xMatriculas.ParamByName('turma').AsString := txtTurmaDe.Text;
   xMatriculas.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestreDe.Text);
   xMatriculas.Open;

   slAlunos := TStringList.Create();

   // Percorrer as matriculas DE e listar na listbox
   xMatriculas.First();
   lstAlunos.Clear();
   while not xMatriculas.EOF do begin
        slAlunos.AddObject(xMatriculas.FieldByName('codigoaluno').AsString, TObject(xMatriculas.GetBookmark));
        lstAlunos.Items.Add(FillString( Copy(xMatriculas.FieldByName('nm_pessoa').AsString, 1, 35), alLeft, ' ', 35, false) + ' - ' + xMatriculas.FieldByName('ds_situacao').AsString );

        xMatriculas.Next();
   end;

   sbMarcarClick(nil);
    
end;

procedure TfrmReserva.MostrarPlanos;
begin
   if txtTurmaPara.Text = '' then exit;

   

   Filtra();
end;

procedure TfrmReserva.CarregarProximaTurma;
var
   anosemestre: Integer;
begin
   anosemestre := StrToInt(txtAnoSemestreDe.Text);

   // Busca qual a próxima turma
   qryProximaTurma.Close;
   qryProximaTurma.ParamByName('turma').AsString := txtTurmaDe.Text;
   qryProximaTurma.ParamByName('anosemestre').AsInteger := anosemestre;
   qryProximaTurma.Open;

   // Verifica se encontrou próxima turma configurada
   if qryProximaTurma.FieldByName('cd_proxima_turma').AsString <> '' then
   begin

      // Incrementa o anosemestre da matricula para o próximo anosemestre
      if DM.UsaAnosemestre then
      begin
         if ano_semestre_incremento = 1 then
         begin
            if (anosemestre mod 2) = 0 then
            begin
               Inc(anosemestre, 9);
            end
            else
               Inc(anosemestre);
         end
         else
            Inc(anosemestre, 10);
      end;

      // Busca dados/informações da próxima turma (para rematrícula)
      qryDadosProxTurma.Close;
      qryDadosProxTurma.ParamByName('turma').AsString := qryProximaTurma.FieldByName('cd_proxima_turma').AsString;
      qryDadosProxTurma.ParamByName('anosemestre').AsInteger := anosemestre;
      qryDadosProxTurma.Open;

      // Preenche a próxima turma nos campos de Turma Destino
      txtTurmaPara.Text := qryDadosProxTurma.FieldByName('codigo').AsString;
      txtAnoSemestrePara.Text := qryDadosProxTurma.FieldByName('anosemestre').AsString;

      // Carrega informações próxima turma
      if txtTurmaPara.Text <> '' then
      begin
         DM.DeptoCursoTurma( qryDadosProxTurma.FieldByName('anosemestre').AsInteger, qryDadosProxTurma.FieldByName('codigo').AsString );
         strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
         FMatriculaCurso^.Curso := strCursoPara;
         FMatriculaCurso^.Turno := qryDadosProxTurma.FieldByName('turno').AsString;
      end;

      // Mostra os planos de pagamento da próxima turma
      MostrarPlanos();
      
   end;
end;

procedure TfrmReserva.CalcularVencimento;
var
  i : Byte;
  wDay, wMonth, wYear : Word;
  MyDay : TDateTime;
  cIndDesconto : Double;
  ParcelaZero : Boolean;
  nPar : Integer;
  dCreditosRestantes : double;
  dtBloqueio : TDateTime;
begin

   zerarArray();

   dtBloqueio := DM.DataBloqueioFinanceiro(ArrayDatas[i]);

  { Calcula os valores e vencimentos nos arrays }

  tblItensPagamento.Close();
  tblItensPagamento.Open();
  tblItensPagamento.First();

  lngPlano := 0;
  lst.Clear;

  i := 0;

  // Usar como data base inicial o A PARTIR DE....
  try
     DecodeDate( tblPlanos.FieldByName('DT_APARTIR').AsDateTime, wYear, wMonth, wDay );
  except
     // Se não tiver tiver A PARTIR DE Selecionar a data de Hoje
     DecodeDate( DataHoje, wYear, wMonth, wDay );
  End;

  dCreditosRestantes := total_creditos * tblPlanos.FieldByName('NR_PARCELAS').AsInteger;
  nPar := tblPlanos.FieldByName('NR_PARCELAS').AsInteger;
  
  while not tblItensPagamento.Eof do
  begin

      // Resgatar o índice de desconto para calcular proporcional
      if tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency > 0 then
         cIndDesconto := tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency / tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency
      else
         cIndDesconto := 0;

      MyDay := DataValida( tblItensPagamento.FieldByName('NR_ANO').AsInteger, tblItensPagamento.FieldByName('NR_MES').AsInteger, tblItensPagamento.FieldByName('NR_DIA').AsInteger);

      if tblItensPagamento.FieldByName('SN_CREDITO_PARCELA').AsString[1] IN ['S', 'F'] then
      Begin  // Programação com Créditos

         ArrayValorCredito[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsCurrency;
         ArraySN_Credito[i] := tblItensPagamento.FieldByName('SN_CREDITO_PARCELA').AsString[1];

         if tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger <> 0 then begin

            if tblItensPagamento.FieldByName('SN_CREDITO_PARCELA').AsString = 'S' then begin

               if total_creditos < tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger then begin
                  ArrayNr_Credito[i] := tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;
                  ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;
               End else Begin
                  ArrayNr_Credito[i] := total_creditos;
                  ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * total_creditos;
               End;

               dCreditosRestantes := dCreditosRestantes -  total_creditos;

            end else begin

               ArrayNr_Credito[i] := tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;
               ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;

               dCreditosRestantes := dCreditosRestantes -  tblItensPagamento.FieldByName('NR_CREDITOS_MINIMOS').AsInteger;

            end

         end else begin

            ArrayNr_Credito[i] := dCreditosRestantes / nPar;
            ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency / tblPlanos.FieldByName('NR_CREDITOS_BASE').AsInteger * ArrayNr_Credito[i];

            dCreditosRestantes := dCreditosRestantes - ArrayNr_Credito[i];

         end;

         nPar := nPar - 1;

         // O desconto é calculado proporcionalmente ao novo valor bruto, conforme créditos
         ArrayDescontos[i] := ArrayValores[i] * cIndDesconto;

         ArrayDescontosPlano[i] := (tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency / tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency) * ArrayValores[i];
         ArrayDescontosExtra[i] := (tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency / tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency) * ArrayValores[i];
         ArrayDescontosExtraPlano[i] := tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency;
         ArrayValorExtra[i] := tblItensPagamento.FieldByName('VL_EXTRA').AsCurrency;

      End
      else  { Programação Sem Créditos }
      Begin
         ArrayValorCredito[i] := 0;
         ArraySN_Credito[i] := 'N';
         ArrayNr_Credito[i] := 0;
         ArrayValores[i] := tblItensPagamento.FieldByName('VL_BRUTO').AsCurrency;
         ArrayDescontos[i] := tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency;
         ArrayDescontosPlano[i] := tblItensPagamento.FieldByName('VL_DESCONTO').AsCurrency;
         ArrayDescontosExtra[i] := tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency;
         ArrayDescontosExtraPlano[i] := tblItensPagamento.FieldByName('VL_DESCONTO_EXTRA').AsCurrency;
         ArrayValorExtra[i] := tblItensPagamento.FieldByName('VL_EXTRA').AsCurrency;
      End;

      // Verificar data de vencimento
      ParcelaZero := False; 
      if tblItensPagamento.FieldByName('NR_DIA').AsInteger = 0 then begin
        ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;
        ArrayDatas[i] := DataHoje + tblPlanos.FieldByName('NR_DIAS_PARCELA_ZERO').AsInteger;
        ParcelaZero := True;

         if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
         begin
            ArrayDatas[i] := dtBloqueio + 1;
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end
         else
         begin
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end;

      end
      else
      if MyDay < DataHoje then Begin

        { O vencimento ficará menor q a data de hoje, verificar se deve ser criada a parcela }
        if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[VENCIMENTO=PLANO]' then begin
           { Mandar data do Plano, mesmo em Atraso }
           ArrayDatas[i] := MyDay;

           ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;

            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format( 'PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime( 'dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format( '%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        end
        else
        if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[PERDOAR]' then Begin
             { Perdoar a Mensalidade }
             ArrayDatas[i] := DataHoje;
             ArrayParcelas[i] := - tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;
             
            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger] ) + ' - ISENTADA - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        end
        else
        if DM.variavel_parametro('financeiro_parcelas_anteriores') = '[NAO_GERAR]' then Begin { NÃO GERAR AS PARCELAS }
              ArrayDatas[i] := DataHoje;
              ArrayParcelas[i] := -99;

            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ELIMINADA - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        End
        else
        begin //  '[VENCIMENTO=HOJE]'
           { Colocar data de Hoje, para não deixar em Atraso }
           ArrayDatas[i] := DataHoje;

           ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;

            if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
            begin
               ArrayDatas[i] := dtBloqueio + 1;
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end
            else
            begin
               lst.Items.Add(
                  Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger] ) + ' - ' +
                  FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
                  Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
               );
            end;
        end


      End
      else
      begin
         { Data do Plano }
         ArrayDatas[i] := MyDay;

         ArrayParcelas[i] := tblItensPagamento.FieldByName('NR_PARCELA').AsInteger;

         if ((dtBloqueio <> 0) and (ArrayDatas[i] <= dtBloqueio)) then
         begin
            ArrayDatas[i] := dtBloqueio + 1;
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger]) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i]) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end
         else
         begin
            lst.Items.Add(
               Format('PARCELA %.2d', [tblItensPagamento.FieldByName('NR_PARCELA').AsInteger] ) + ' - ' +
               FormatDateTime('dd/mm/yyyy', ArrayDatas[i] ) + ' - ' +
               Format('%8.2n', [ArrayValores[i] - ArrayDescontos[i] + ArrayValorExtra[i] - ArrayDescontosExtra[i]])
            );
         end;
      end;

      ArrayItemPlano[i] := tblItensPagamento.FieldByName('CD_PLANO_ITEM').AsInteger;
      ArrayTipoParcela[i] := tblItensPagamento.FieldByName('CD_TIPO_PARCELA').AsInteger;
      ArrayPlanoContas[i] := tblItensPagamento.FieldByName('CD_CONTA').AsInteger;
      ArrayDescricaoTipo[i] := tblItensPagamento.FieldByName('DS_TIPO_TITULO').AsString;

      tblItensPagamento.Next;

      Inc( i );

      if not ParcelaZero then begin

            wMonth := wMonth + 1;
            if wMonth = 13 then
            begin
              wMonth := 1;
              wYear := wYear + 1;
            end;
            MyDay := DataValida( wYear, wMonth, wDay );

      end;

  end;
end;


procedure TfrmReserva.cbPlanosChange(Sender: TObject);
begin
   tblPlanos.GotoBookmark(slPlanos.Objects[cbPlanos.ItemIndex]);
   CalcularVencimento();                                      
end;

procedure TfrmReserva.dtcPlanosDataChange(Sender: TObject; Field: TField);
begin
//  if Field = nil then CalcularVencimento;
end;

procedure TfrmReserva.btnTurmasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }

   resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestreDe.Text)
      );

   if not resultado_filtro.filtrado then Exit;
  
   txtTurmaDe.Text := resultado_filtro.cd_turma;
   txtAnoSemestreDe.Text := IntToStr( resultado_filtro.nr_anosemestre );

   MostrarAlunos();

   CarregarProximaTurma();
end;

procedure TfrmReserva.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(txtAnoSemestrePara.Text)
      );

   if not resultado_filtro.filtrado then Exit;

   txtTurmaPara.Text := resultado_filtro.cd_turma;
   txtAnoSemestrePara.Text := IntToStr( resultado_filtro.nr_anosemestre );

   if txtTurmaPara.Text <> '' then
   begin
      DM.DeptoCursoTurma( StrToInt(txtAnoSemestrePara.Text), txtTurmaPara.Text );
      strCursoPara := DM.tblDeptoCursoTurmaCurso.AsString;
      FMatriculaCurso^.Curso := strCursoPara;
      FMatriculaCurso^.Turno := resultado_filtro.vl_turno;
   end;

   MostrarPlanos();

end;

function TfrmReserva.total_creditos: double;
var
  qSel : TUMZQuery;
begin
 // Total de Créditos

  DM.CriarConsulta(qSel);

  qSel.Close();
  qSel.SQL.Text := ' SELECT SUM(g.NR_AULAS) QtdCreditos ';
  qSel.SQL.Add(' FROM  turmas t INNER JOIN grades_disciplinas as g ON (  g.cd_curso = t.curso AND g.cd_grade = t.cd_grade AND t.serie = g.nr_serie) ');
  qSel.SQL.Add(' WHERE t.codigo = ' + QuotedStr(txtTurmaPara.Text) + ' AND t.anosemestre = ' + txtAnoSemestrePara.Text);
  qSel.Open();

  result := qSel.FieldByName('QtdCreditos').AsCurrency;

  FreeAndNil(qSel);

end;

procedure TfrmReserva.txtAnoSemestreDeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 Then
   Begin
    SelectNext( TWinControl( Sender ), True, True );
    Key := #0;
   End;
end;

procedure TfrmReserva.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblPlanos, pmQtd);

end;

procedure TfrmReserva.PrepararTelaReserva(ExcluirReserva: Boolean);
begin
    if ExcluirReserva then begin
       // Tela para exclusão de reserva;
       pnDestino.Visible := false;
       lbTituloOrigem.Caption := 'EXCLUIR RESERVAS';
       lbTurma.Caption := 'Selecione a turma para excluir as reservas:';
       lbAlunos.Caption := 'Apenas os alunos marcados terão suas reservas excluidas.';

       btnGerar.Visible     := false;
       tbSeparador1.Visible := false;
       btnExcluir.Visible   := true;
       tbSeparador2.Visible := true;
       btnRequerimentos.Visible := false;
       tbSeparador3.Visible := false;
       btnContratos.Visible := false;
       tbSeparador4.Visible := false;

       SnTelaExcluirReserva := true;

    end else begin
       // Tela para geração da reserva;

       pnDestino.Visible := true;
       lbTituloOrigem.Caption := 'ORIGEM:';
       lbTurma.Caption := 'Selecione a turma de origem:';
       lbAlunos.Caption := 'Apenas os alunos marcados serão pré-rematriculados.';

       btnGerar.Visible     := true;
       tbSeparador1.Visible := true; 
       btnExcluir.Visible   := false;
       tbSeparador2.Visible := false;
       btnRequerimentos.Visible := true;
       tbSeparador3.Visible := true;
       btnContratos.Visible := true;
       tbSeparador4.Visible := true;

       SnTelaExcluirReserva := false;

    end;
end;

procedure TfrmReserva.sbDesmarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (lstAlunos.Items.Count-1) do
    lstAlunos.Checked[i] := false;
end;

procedure TfrmReserva.sbMarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (lstAlunos.Items.Count-1) do
    lstAlunos.Checked[i] := true;

end;

end.



