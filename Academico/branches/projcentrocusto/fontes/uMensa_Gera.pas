unit uMensa_Gera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, Buttons, DB, ZConnection,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, DateUtils,
  UMComboBox, uListaColigadas, uColigada;

type
  Tfrm_mensa_gerar = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    txtCodigoAluno: TEdit;
    Label3: TLabel;
    txtTurma: TEdit;
    txtCurso: TEdit;
    Label4: TLabel;
    UpDownCursos: TUpDown;
    txtAnoSemestre: TMaskEdit;
    Label5: TLabel;
    cbResponsavel: TCheckBox;
    btnCodigoAluno: TSpeedButton;
    btnTurma: TSpeedButton;
    btnCurso: TSpeedButton;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    lbParcelaInicial: TLabel;
    lbParcelaFinal: TLabel;
    lbDataVencimento: TLabel;
    lbValorBruto: TLabel;
    lbValorDesconto: TLabel;
    lbDescontoExtra: TLabel;
    lbValorExtra: TLabel;
    txtParcelaInicial: TEdit;
    txtParcelaFinal: TEdit;
    txtValorBruto: TEdit;
    txtValorDesconto: TEdit;
    txtDescontoExtra: TEdit;
    txtValorExtra: TEdit;
    txtDataVencimento: TDateTimePicker;
    qySelecao: TUMZQuery;
    txtTurmaFixa: TEdit;
    cbFixarTurma: TCheckBox;
    btnTurmaFixa: TSpeedButton;
    qyInsert: TUMZQuery;
    cbAlunosCursando: TCheckBox;
    qyAux: TUMZQuery;
    ckNaoDuplicar: TCheckBox;
    ckCreditos: TCheckBox;
    Label7: TLabel;
    txtHistorico: TEdit;
    cbTipoTitulos: TComboBox;
    cbPlanoContas: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbCentroCusto: TComboBox;
    gbResponsavel: TGroupBox;
    gbInfosTitulo: TGroupBox;
    rgVencto: TRadioGroup;
    Panel1: TPanel;
    Label31: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure txtCodigoAlunoChange(Sender: TObject);
    procedure cbTipoTitulosKeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoTitulosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbResponsavelKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure btnCursoClick(Sender: TObject);
    procedure btnTurmaClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
    procedure txtParcelaInicialKeyPress(Sender: TObject; var Key: Char);
    procedure txtParcelaFinalKeyPress(Sender: TObject; var Key: Char);
    procedure txtValorBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure txtValorBrutoExit(Sender: TObject);
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure btConfirmarClick(Sender: TObject);
    procedure btnTurmaFixaClick(Sender: TObject);
    procedure cbResponsavelClick(Sender: TObject);
    procedure cbFixarTurmaClick(Sender: TObject);
    procedure txtDataVencimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    valor_teste : Currency;

    lstTipos : Array of Integer;
    lstTiposValor : Array of Currency;
    lstTiposContas : Array of Integer;
    lstTiposParcelas : Array of String;
    lstPlanoContas : Array of Integer;
    lstCentroCustos : array of Integer;

    function confirma_selecao : boolean;
    Procedure MontaCombos;

    Function PosicaoArray(Objeto : array of Integer; Valor : Integer) : Integer;
    Procedure SelecionarCentroPadrao;
  public
    iAnoSemestreFixo : Integer;
    flgConfirmado : Boolean;
    { Public declarations }
    procedure AtualizaDataVencimento(AICodigoAluno:Integer);
    procedure CarregaUnidadeEnsino();
    function getDataVencimentoAluno(const AICodigoAluno:Integer) : TDateTime;
  end;

var
  frm_mensa_gerar: Tfrm_mensa_gerar;

implementation

uses
   uDM, uFSelecionarCurso, uUsuario, uFSelecionarTurma, uFSelecionarPessoa, Main, uProcessando,
   uClassMovimento, uMensalidades;

{$R *.dfm}

procedure Tfrm_mensa_gerar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_mensa_gerar.FormCreate(Sender: TObject);
begin
   txtAnoSemestre.text := IntToStr(ano_semestre);
   txtDataVencimento.Date := DataHoje;
end;

procedure Tfrm_mensa_gerar.FormShow(Sender: TObject);
begin
  MontaCombos();
  SelecionarCentroPadrao();
  AtualizaDataVencimento(0);
  flgConfirmado := false;
end;

{Retorna o dia de vencimento da mensalidad do aluno}
function Tfrm_mensa_gerar.getDataVencimentoAluno(
  const AICodigoAluno: Integer): TDateTime;
var
   qryGetDataVencimento : TUMZQuery;
begin

   DM.CriarConsulta(qryGetDataVencimento);

   try
      try
         with qryGetDataVencimento do
         begin

            //Verifica se a conexão é Oracle ou MySQL
            if Connection.Protocol = 'oracle' then //Oracle
            begin
               SQL.Text := ' SELECT '+
                           '     TO_DATE(CONCAT(TO_CHAR(SYSDATE + INTERVAL ''1'' MONTH, ''YYYY-MM-''),nr_dia_vencimento),''YYYY-MM-DD HH24-MI-SS'') as dt_vencimento_aluno  '+
                           ' FROM '+
                           '    pessoas p '+
                           ' WHERE '+
                           '    p.cd_pessoa = :pCDPessoa ';
            end else begin
               SQL.Text := ' SELECT '+
                           '     STR_TO_DATE(CONCAT(DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH) ,"%Y-%m-"),nr_dia_vencimento),"%Y-%m-%d %H-%i-%s") as dt_vencimento_aluno  '+
                           ' FROM '+
                           '    pessoas as p '+
                           ' WHERE '+
                           '    p.cd_pessoa = :pCDPessoa ';
            end;

            ParamByName('pCDPessoa').AsInteger := AICodigoAluno;
            Open;
            if not EOF then
            begin
               Result:= FieldByName('dt_vencimento_aluno').AsDateTime;
               exit;
            end;

         end;
      except on E: EDatabaseError do
         begin
            Result :=Now;
            exit;
         end;
      end;
   finally
      qryGetDataVencimento.Free;
   end;
   Result:=Now;
end;

procedure Tfrm_mensa_gerar.MontaCombos;
Var
   iCont : Integer;
begin
   // Verifica se o parametro que indica se a instituição utiliza anosemestre
   if not DM.UsaAnosemestre then
   begin
      // Caso não utilize anosemestre esconde o componente do anosemestre (apenas torna ele invisivel)
      txtAnoSemestre.visible := false;
      UpDownCursos.visible := false;
      Label5.visible := false;

      // Caso não utilize anosemestre, seta ele como padrão 1
      txtAnoSemestre.Text := '1';

      // Realinha os demais componentes agora sem a caixa de anosemestre
      btnCodigoAluno.Left := 225;
      txtCodigoAluno.Width := 214;
   end;

   // Montar Combo dos Tipos de Títulos
   qyAux.Close();
   qyAux.SQL.Text :=
      ' SELECT cd_tipo_titulo, ds_tipo_titulo, cd_conta, vl_padrao, nr_parcela from fin_config_tipos_titulo ' +
      ' WHERE ct_tipo_titulo = 1 AND cd_coligada_matriz = :cd_coligada_matriz ORDER BY ds_tipo_titulo ';
   qyAux.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyAux.Open();

   SetLength(lstTipos, qyAux.RecordCount);
   SetLength(lstTiposValor, qyAux.RecordCount);
   SetLength(lstTiposContas, qyAux.RecordCount);
   SetLength(lstTiposParcelas, qyAux.RecordCount);

   qyAux.First;
   cbTipoTitulos.Clear;
   iCont := 0;

   while not qyAux.Eof do
   begin
      cbTipoTitulos.Items.Add(qyAux.FieldByName('ds_tipo_titulo').AsString);
      lstTipos[iCont] := qyAux.FieldByName('cd_tipo_titulo').AsInteger;
      lstTiposValor[iCont] := qyAux.FieldByName('vl_padrao').AsCurrency;
      lstTiposContas[iCont] := qyAux.FieldByName('cd_conta').AsInteger;
      lstTiposParcelas[iCont] := qyAux.FieldByName('nr_parcela').AsString;
      qyAux.Next;
      Inc(iCont);
   end;

   // Montar Combo do Plano de Contas
   qyAux.Close();
   qyAux.SQL.Text :=
      ' SELECT cd_conta, ds_conta FROM fin_config_plano_contas ' +
      ' WHERE tp_conta = 1 AND tp_entrada_saida IN (0,1) AND sn_ativo = 1 ' +
      ' AND cd_coligada_matriz = :cd_coligada_matriz ORDER BY ds_conta';
   qyAux.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyAux.Open();

   SetLength(lstPlanoContas, qyAux.RecordCount);

   qyAux.First;
   cbPlanoContas.Clear;
   iCont := 0;

   while not qyAux.Eof do
   begin
      cbPlanoContas.Items.Add(qyAux.FieldByName('ds_conta').AsString);
      lstPlanoContas[iCont] := qyAux.FieldByName('cd_conta').AsInteger;
      qyAux.Next;
      Inc(iCont);
   end;

   // Montar Combo do Centro de Custos
   qyAux.Close();
   qyAux.SQL.Text :=
      ' SELECT cd_centro, ds_centro from fin_config_centro_custos  ' +
      ' WHERE  tp_centro = 1 AND sn_ativo = 1 AND '  +
      ' cd_coligada_matriz = :cd_coligada_matriz ORDER BY ds_centro ';
   qyAux.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyAux.Open();

   SetLength(lstCentroCustos, qyAux.RecordCount);

   qyAux.First;
   cbCentroCusto.Clear;
   iCont := 0;

   while not qyAux.Eof do
   begin
      cbCentroCusto.Items.Add(qyAux.FieldByName('ds_centro').AsString);
      lstCentroCustos[iCont] := qyAux.FieldByName('cd_centro').AsInteger;
      qyAux.Next;
      Inc(iCont);
   end;

   cbTipoTitulos.ItemIndex := -1;
   cbPlanoContas.ItemIndex := -1;
   cbCentroCusto.ItemIndex := -1;
end;

function Tfrm_mensa_gerar.PosicaoArray(Objeto: array of Integer;
  Valor: Integer): Integer;
var
   n : Integer;
begin
   result := -1;
   for n := 0 to Length(Objeto) - 1 do begin
      if Objeto[n] = Valor then begin
          Result := n;
          Exit;
      end;

   end;
end;

procedure Tfrm_mensa_gerar.SelecionarCentroPadrao;
begin
   qyAux.Close();
   qyAux.SQL.Text :=
     ' SELECT codigo, anosemestre, cd_centro, cd_coligada FROM turmas ' +
     ' WHERE codigo = :CdTurma AND anosemestre = :AnoSemestre ';

   if cbFixarTurma.Checked then begin
     qyAux.ParamByName('CdTurma').AsString := txtTurmaFixa.Text;
     qyAux.ParamByName('AnoSemestre').AsInteger := iAnoSemestreFixo;
   end else begin
     qyAux.ParamByName('CdTurma').AsString := txtTurma.Text;
     qyAux.ParamByName('AnoSemestre').AsString := txtAnoSemestre.Text;
   end;

   qyAux.Open();

   if not qyAux.EOF then begin
      cbCentroCusto.ItemIndex := PosicaoArray(lstCentroCustos, qyAux.FieldByName('cd_centro').AsInteger);
   end;
end;

procedure Tfrm_mensa_gerar.UpDownCursosClick(Sender: TObject;
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

procedure Tfrm_mensa_gerar.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);
   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
end;

procedure Tfrm_mensa_gerar.btnTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }

   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;
   txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
   txtCurso.Text := resultado_filtro.cd_curso;

   SelecionarCentroPadrao();
end;

procedure Tfrm_mensa_gerar.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      AtualizaDataVencimento(resultado_filtro.cd_pessoa);
      txtCodigoAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
      try
         txtTurma.Text := resultado_filtro.cd_turma;
         txtAnoSemestre.Text := IntToStr(resultado_filtro.nr_anosemestre);
         txtCurso.Text := resultado_filtro.cd_curso;
         SelecionarCentroPadrao();
      except
      end;
  end
  else Exit;
end;

procedure Tfrm_mensa_gerar.txtCodigoAlunoChange(Sender: TObject);
begin
   if( TEdit(Sender).Text <> '') then
   Self.AtualizaDataVencimento(StrToInt(TEdit(Sender).Text));
end;

procedure Tfrm_mensa_gerar.txtCodigoAlunoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_mensa_gerar.txtTurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end else if (key <> #8) then begin
      Key := #0;
   end else begin
      txtCurso.Text := '';
   end;

end;

procedure Tfrm_mensa_gerar.txtCursoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end else if (key <> #8) then begin
      Key := #0;
   end else begin
      txtCurso.Text := '';
   end;
end;

procedure Tfrm_mensa_gerar.txtParcelaInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_mensa_gerar.txtParcelaFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_mensa_gerar.txtValorBrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
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

procedure Tfrm_mensa_gerar.txtValorBrutoExit(Sender: TObject);
begin
   if Trim(TEdit(Sender).Text) <> '' then
   Begin
      try
         valor_teste := StrToCurr(TEdit(Sender).Text);
         TEdit(Sender).Text := FloatToStrF(valor_teste, ffFixed, 10, 2);
      except
         Mensagem('O valor informado é inválido. Por favor, confira-o.', 'Atenção', MB_OK + MB_ICONWARNING);
         TEdit(Sender).SetFocus;
      end;
   end;
end;

procedure Tfrm_mensa_gerar.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
end;

function Tfrm_mensa_gerar.confirma_selecao: boolean;
const
   SSemPermissaoGeracaoMassa = 'Você não possui privilégios para realizar a geração de títulos financeiros em massa.';
var
   TemPermissaoGerarMassa: Boolean;
begin

   TemPermissaoGerarMassa :=
      DM.UsuarioLogado.TemPermissao(
         DM.iCdPessoaLogado,
         'UMFinanceiro.Recebimentos.Gerar.TitulosMassa',
         npAcesso,
         False
      );

   { Gerar mensalidades para Alunos }
   if (not cbResponsavel.Checked) AND (txtCodigoAluno.Text <> '') AND (txtTurma.Text = '') AND (txtCurso.Text = '') AND (cbFixarTurma.Checked) then begin

      qySelecao.SQL.Clear;
      qySelecao.SQL.Add('SELECT p.cd_pessoa codigo, p.nm_pessoa ');
      qySelecao.SQL.Add('FROM pessoas p');
      qySelecao.SQL.Add('WHERE p.cd_pessoa = ' + Trim(txtCodigoAluno.Text));

      qySelecao.Open;

      if not qySelecao.Eof then
      begin
          if Mensagem('Será gerada mensalidade para a ' + qySelecao.FieldByName('nm_pessoa').AsString + '. Confirma? ',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
          = mrYes then
             result := True
          else
             result := false;
      end
      else
      begin
          Mensagem('Nenhuma mensalidade será gerada para a seleção acima, confira. ',  'Atenção', MB_OK + MB_ICONWARNING);
          result := False;
      end;

   end
   else if (not cbResponsavel.Checked) then Begin
      qySelecao.SQL.Clear;
      qySelecao.SQL.Add('SELECT ma.codigoaluno codigo, ma.turma, ma.curso, ma.anosemestre, cu.cd_depto depto');
      qySelecao.SQL.Add('FROM matriculas ma');
      qySelecao.SQL.Add('INNER JOIN turmas t ON (ma.anosemestre = t.anosemestre and ma.turma = t.codigo)');      
      qySelecao.SQL.Add('INNER JOIN cursos_coligadas cu ON (ma.curso = cu.cd_curso AND t.cd_coligada = cu.cd_coligada)');
      qySelecao.SQL.Add('WHERE ma.curso = cu.cd_curso ' );
      qySelecao.SQL.Add('AND ma.anosemestre = ' + txtAnoSemestre.Text );

      if trim(txtCurso.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.curso = ''' + Trim(txtCurso.Text) + '''' );

      if trim(txtTurma.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.turma = ''' + Trim(txtTurma.Text) + '''' );

      if trim(txtCodigoaluno.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.codigoaluno = ' + Trim(txtCodigoAluno.Text));

      if cbAlunosCursando.Checked then
         qySelecao.SQL.Add(' AND ma.situacao = 1');

      qySelecao.SQL.Add(' ORDER BY ma.curso, ma.turma, ma.codigoaluno ' );
      qySelecao.Open;

      if not qySelecao.Eof then
      begin
         if (qySelecao.RecordCount > 1) and (not TemPermissaoGerarMassa) then
         begin
            Result := False;
            MessageDlg(SSemPermissaoGeracaoMassa, mtInformation, [mbOK], -1);
         end
         else
         begin
          if Mensagem('Será gerada mensalidade para ' + IntToStr(qySelecao.RecordCount) + ' aluno(s) . Confirma? ',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
          = mrYes then
             result := True
          else
             result := false;
         end;
      end
      else
      begin
          Mensagem('Nenhuma mensalidade será gerada para a seleção acima, confira. ',  'Atenção', MB_OK + MB_ICONWARNING);
          result := False;
      end;

   end
else // Mensalidade por Responsável Financeiro
   Begin
      // Essa função está alterada para a Barão
      qySelecao.SQL.Clear;
      qySelecao.SQL.Add('SELECT p.cd_resp_finan codigo, ma.anosemestre, ma.turma ');
      qySelecao.SQL.Add('FROM matriculas ma INNER JOIN pessoas p ON (ma.codigoaluno = p.cd_pessoa) ');
      qySelecao.SQL.Add('INNER JOIN turmas t ON (t.codigo = ma.turma and t.anosemestre = ma.anosemestre and t.cd_situacao = 99) ');
      qySelecao.SQL.Add('WHERE ma.anosemestre = ' + txtAnoSemestre.Text );

      if trim(txtCurso.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.curso = ''' + Trim(txtCurso.Text) + '''' );

      if trim(txtTurma.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.turma = ''' + Trim(txtTurma.Text) + '''' );

      if trim(txtCodigoaluno.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.codigoaluno = ' + Trim(txtCodigoAluno.Text));

      if cbAlunosCursando.Checked then
         qySelecao.SQL.Add(' AND ma.situacao = 1');

      qySelecao.SQL.Add(' GROUP BY p.cd_resp_finan ');         

      qySelecao.Open;

      if not qySelecao.Eof then
      begin
         if (qySelecao.RecordCount > 1) and (not TemPermissaoGerarMassa) then
         begin
            Result := False;
            MessageDlg(SSemPermissaoGeracaoMassa, mtInformation, [mbOK], -1);
         end
         else
         begin
          if Mensagem('Será gerada mensalidade para ' + IntToStr(qySelecao.RecordCount) + ' Responsáveis . Confirma? ',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
          = mrYes then
             result := True
          else
             result := false;
         end;
      end
      else
      begin
          Mensagem('Nenhuma mensalidade será gerada para a seleção acima, confira. ',  'Atenção', MB_OK + MB_ICONWARNING);
          result := False;
      end;

   end;

end;

procedure Tfrm_mensa_gerar.btnTurmaFixaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;
   txtTurmaFixa.Text := resultado_filtro.cd_turma;
   iAnoSemestreFixo := resultado_filtro.nr_anosemestre;

   SelecionarCentroPadrao();
end;

procedure Tfrm_mensa_gerar.CarregaUnidadeEnsino;
begin
   DM.CarregaColigadas(cbUnidadeEnsino);
end;

procedure Tfrm_mensa_gerar.cbResponsavelClick(Sender: TObject);
begin
   cbFixarTurma.Checked := cbResponsavel.Checked;

   cbFixarTurma.enabled := not cbResponsavel.Checked;
end;

procedure Tfrm_mensa_gerar.cbResponsavelKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      Key := #0;
      SelectNext(Sender As TWinControl, True, True);
   end;

end;

procedure Tfrm_mensa_gerar.cbTipoTitulosChange(Sender: TObject);
begin
    txtHistorico.Text := cbTipoTitulos.Text;
    cbPlanoContas.ItemIndex := PosicaoArray(lstPlanoContas, lstTiposContas[cbTipoTitulos.ItemIndex]);

    if lstTiposValor[cbTipoTitulos.ItemIndex] > 0 then begin

       txtValorBruto.Text := FloatToStrF(lstTiposValor[cbTipoTitulos.ItemIndex], ffFixed, 7, 2);

       txtParcelaInicial.Text := lstTiposParcelas[cbTipoTitulos.ItemIndex];
       txtParcelaFinal.Text := lstTiposParcelas[cbTipoTitulos.ItemIndex];

    end;
end;

procedure Tfrm_mensa_gerar.cbTipoTitulosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender as TWinControl, true, true);
      key := #0;
   end;
end;

procedure Tfrm_mensa_gerar.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure Tfrm_mensa_gerar.cbFixarTurmaClick(Sender: TObject);
begin

   btnTurmaFixa.Enabled := cbFixarTurma.checked;

   SelecionarCentroPadrao();

end;

// Atualiza da do vencimento pela data do aluno
procedure Tfrm_mensa_gerar.AtualizaDataVencimento(AICodigoAluno:Integer);
var
   sParametroAgruparMensalidades  : String;
begin
   sParametroAgruparMensalidades := DM.variavel_parametro('agrupar_mensalidades_proximo_mes');
   if(sParametroAgruparMensalidades = 'S')then
   begin
         //permissão para alterar a data de vencimento da mensalidade
         if not DM.UsuarioLogado.TemPermissao(1107, npAlterar, False) then
         begin
            txtDataVencimento.Enabled := false;
            rgVencto.Enabled := false;
            rgVencto.ItemIndex := 0;
         end;
         if AICodigoAluno <> 0 then
         begin
            txtDataVencimento.Date := Self.getDataVencimentoAluno(AICodigoAluno);
         end;
   end;
end;



procedure Tfrm_mensa_gerar.btCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure Tfrm_mensa_gerar.btConfirmarClick(Sender: TObject);
var
   intParcelaInicial,
   intParcelaFinal, cd_coligada : Integer;
   dtDataVencimento,
   dtNovoVencimento : TDateTime;
   curValorBruto,
   curValorExtra,
   curValorDesconto,
   curDescontoExtra : Currency;
   ano, mes, dia, dia_fixo : word;
   iPar : Integer;
   movimento : Tmovimento;
   qyVerifica, qyRespon : TUMZQuery;
   bPodeInserir: Boolean;
   chaves : String;
   qCaixaDepto : TUMZQuery;
   iDepto, iAnoSem, iPlanoContas, iCentroCusto, iCodMensa : Integer;
   sCurso, sTurma : String;
   sCredito : char;
begin
   { Testar as Entradas }

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Selecione uma Unidade de Ensino', 'Aviso');
   end;

   try
      intParcelaInicial := StrToInt(txtParcelaInicial.Text)
   except
      Mensagem('Informe a parcela inicial.', 'Atenção', MB_OK + MB_ICONWARNING);
      txtParcelaInicial.SetFocus;
      exit;
   end;

   try
      intParcelaFinal := StrToInt(txtParcelaFinal.Text)
   except
      txtParcelaFinal.Text :=  txtParcelaInicial.Text;
      intParcelaFinal := intParcelaInicial
   end;

   try
      dtDataVencimento := txtDataVencimento.Date;
   except
      Mensagem('Informe a data de vencimento.', 'Atenção', MB_OK + MB_ICONWARNING);
      txtDataVencimento.SetFocus;
      exit;
   end;

   // Conferir Bloqueio de Alterações por data
   if DM.EstaBloqueado(dtDataVencimento, True) then begin
      txtDataVencimento.SetFocus();
      Exit;
   end;


   try
      curValorBruto := StrToCurr(txtValorBruto.Text);
   except
      Mensagem('Informe o valor bruto.', 'Atenção', MB_OK + MB_ICONWARNING);
      txtValorBruto.SetFocus;
      exit;
   end;

   try
      curValorExtra := StrToCurr(txtValorExtra.Text);
   except
      txtValorExtra.Text := FloatToStrF(0, ffFixed, 10, 2);
      curValorExtra := StrToCurr(txtValorExtra.Text);
   end;

   try
      curValorDesconto := StrToCurr(txtValorDesconto.Text);
   except
      txtValorDesconto.Text := FloatToStrF(0, ffFixed, 10, 2);
      curValorDesconto := StrToCurr(txtValorDesconto.Text);
   end;

   try
      curDescontoExtra := StrToCurr(txtDescontoExtra.Text);
   except
      txtDescontoExtra.Text := FloatToStrF(0, ffFixed, 10, 2);
      curDescontoExtra := StrToCurr(txtDescontoExtra.Text);
   end;

   { A parcela inicial deve ser menor que a inicial }
   if intParcelaInicial > intParcelaFinal then
   begin
      Mensagem('A parcela inicial deve ser menor ou igual a final.', 'Atenção', MB_OK + MB_ICONWARNING);
      txtParcelaInicial.Text;
      exit;
   end;

   { Verificar se existe a Turma fixa }
   if cbFixarTurma.Checked then
   begin
      Dm.DeptoCursoTurma(iAnoSemestreFixo,txtTurmaFixa.Text);

      if Dm.tblDeptoCursoTurma.Eof then
      Begin
          Mensagem('A Turma selecionada para criar as mensalidades não está cadastrada.' + chr(13) + 'Primeiro Cadastre a turma e depois gere a mensalidade.', 'Atenção', MB_OK + MB_ICONWARNING);
          Exit;
      End

   end;

   if cbTipoTitulos.ItemIndex < 0 then begin
      Mensagem('Você deve selecionar um tipo de título.', 'Atenção', MB_OK + MB_ICONWARNING);
      cbTipoTitulos.SetFocus();
      Exit;
   end;

   if cbCentroCusto.ItemIndex < 0 then begin
      Mensagem('Você deve selecionar um centro de custo.', 'Atenção', MB_OK + MB_ICONWARNING);
      cbCentroCusto.SetFocus();
      Exit;
   end;

   if not confirma_selecao then
      exit;

   { A seleção foi confirmada, então podemos começar a gerar as mensalidades }

   { Gerar a Mensalidade }

   qySelecao.First;

   DM.CriarConsulta(qyVerifica);

   frmProcessando.Bar.Max := qySelecao.RecordCount * (intParcelaFinal + 1 - intParcelaInicial);
   frmProcessando.Show;
   Application.ProcessMessages;

   try

   decodedate(dtDataVencimento, ano, mes, dia_fixo);


   while not qySelecao.EOF do begin

      dtNovoVencimento := dtDataVencimento;

      if rgVencto.ItemIndex = 1 then
      begin
         DecodeDate(dtNovoVencimento, ano, mes, dia);
         dtNovoVencimento := DiaUtil(ano, mes, dia, TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
      end
      else if rgVencto.ItemIndex = 2 then
      begin
         case DayOfWeek(dtNovoVencimento) of
            1: dtNovoVencimento := IncDay(dtNovoVencimento, 1);
            7: dtNovoVencimento := IncDay(dtNovoVencimento, 2);
         end;
      end;

      For iPar := IntParcelaInicial To IntParcelaFinal do
      begin
          bPodeInserir := True;
          
          frmProcessando.lblRegistros.Caption := 'Gerando mensalidade ' + IntToStr(iPar) + ' do código ' + qySelecao.FieldByName('codigo').AsString ;
          frmProcessando.Bar.Position := frmProcessando.Bar.Position + 1;
          Application.ProcessMessages;

          // Descobrir se a pessoa ja tem uma mensalidade na mesma turma com o mesmo número de parcela

          if ckNaoDuplicar.Checked then begin

             qyVerifica.Close();
             qyVerifica.SQL.Text :=
               ' SELECT codigoaluno FROM mensalidades WHERE ' +
               ' codigoaluno = ' + qySelecao.FieldByName('codigo').AsString +
               ' AND anosemestre = ' + qySelecao.FieldByName('anosemestre').AsString +
               ' AND turma = ' + QuotedStr(qySelecao.FieldByName('turma').AsString) +
               ' AND parcela = ' + IntToStr(iPar);
             qyVerifica.Open();

             bPodeInserir := qyVerifica.Eof;

          end;

          if bPodeInserir then begin

             if cbFixarTurma.Checked then begin
                sTurma :=  txtTurmaFixa.Text;
                sCurso :=  Dm.tblDeptoCursoTurmaCurso.AsString;
                iDepto :=  Dm.tblDeptoCursoTurmaDepto.AsInteger;
                iAnoSem := iAnoSemestreFixo;
             end else begin
                sTurma :=  qySelecao.FieldByName('turma').AsString;
                sCurso :=  qySelecao.FieldByName('curso').AsString;
                iDepto :=  qySelecao.FieldByName('depto').AsInteger;
                iAnoSem := StrToInt(txtAnoSemestre.Text);
             end;

             if cbPlanoContas.ItemIndex < 0 then
                iPlanoContas := 0
             else
                iPlanoContas := lstPlanoContas[cbPlanoContas.ItemIndex];

             if cbCentroCusto.ItemIndex < 0 then
                iCentroCusto := 0
             else
                iCentroCusto := lstCentroCustos[cbCentroCusto.ItemIndex];

             if ckCreditos.Checked then
                sCredito := 'S'
             else
                sCredito := 'N';

             // Buscar o responsavel financeiro correto para a geração manual de títulos
             DM.CriarConsulta(qyRespon);
             qyRespon.Close(); 
             qyRespon.SQL.Text := 'SELECT COALESCE(cd_resp_finan, cd_pessoa) as cd_resp_finan FROM pessoas WHERE cd_pessoa = '+qySelecao.FieldByName('codigo').AsString;
             qyRespon.Open();


             iCodMensa := Dm.GerarMensalidade(
                qySelecao.FieldByName('codigo').AsInteger,
                iPar,
                sTurma,
                curValorBruto,
                0,
                iAnoSem,
                dtNovoVencimento,
                dtNovoVencimento,
                2, // Pendente
                sCurso,
                iDepto,
                0,
                -1,
                curValorDesconto,
                0,
                txtHistorico.Text,
                lstTipos[cbTipoTitulos.ItemIndex],
                iPlanoContas,
                iCentroCusto,
                curDescontoExtra,
                curValorExtra,
                sCredito,
                0,
                0,
                10,
                0,
                qyRespon.FieldByName('cd_resp_finan').AsInteger
             );     

             // Log

             chaves := FillString(qySelecao.FieldByName('codigo').AsString, alRight, '0', 10, true ) + ';' +
                   txtAnoSemestre.Text + ';' + 
                   IntToStr(iPar) + ';' +
                   FormatDateTime('yyyy-mm-dd',dtNovoVencimento) + ';';


             cd_coligada := DM.getColigadaByTurma(sTurma, iAnoSem);

             DM.setLog(2013, 'inclusao', chaves, cd_coligada, 'Parcela gerada manualmente (NN = ' + qyInsert.ParamByName('NossoNumero').AsString +  ')');


             if curDescontoExtra > 0 then begin

                Movimento := TMovimento.create;
                movimento.TipoDeAcao      := BaixarporDesconto;
                movimento.CodigoTitulo    := iCodMensa;
                Movimento.Coligada        := cd_coligada;
                movimento.CodAcao         := DM.BuscarCodigoAcaoPadrao( 11 );  // Desconto Extra;
                movimento.ValorMovimento  := curDescontoExtra;

                movimento.RegistrarMovimentacaoCR( 0 );

             end;

             // Fim da Geração de Movimentação
             
          end;

          DecodeDate( dtNovoVencimento, ano, mes, dia );

          INC(mes);
          if mes > 12 then
          Begin
             mes := 1;
             INC(ano);
          End;

          dtNovoVencimento := DataValida(ano, mes, dia_fixo);
          if rgVencto.ItemIndex = 1 then
          begin
             DecodeDate(dtNovoVencimento, ano, mes, dia);
             dtNovoVencimento := DiaUtil(ano, mes, dia, TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
          end
          else if rgVencto.ItemIndex = 2 then
          begin
             case DayOfWeek(dtNovoVencimento) of
                1: dtNovoVencimento := IncDay(dtNovoVencimento, 1);
                7: dtNovoVencimento := IncDay(dtNovoVencimento, 2);
             end;
          end;
      end;

      qySelecao.Next;

   end;

   // Mensalidades Geradas

   if ckCreditos.Checked then begin

      qySelecao.SQL.Clear;
      qySelecao.SQL.Add('SELECT DISTINCT ma.codigoaluno codigo, ma.turma, ma.anosemestre, ma.curso');
      qySelecao.SQL.Add('FROM matriculas ma ');
      qySelecao.SQL.Add('WHERE ma.anosemestre = ' + txtAnoSemestre.Text );

      if trim(txtCurso.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.curso = ' + QuotedStr(Trim(txtCurso.Text)) + '' );

      if trim(txtTurma.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.turma = ' + QuotedStr(Trim(txtTurma.Text)) + '' );

      if trim(txtCodigoaluno.Text) <> '' then
         qySelecao.SQL.Add(' AND ma.codigoaluno = ' + Trim(txtCodigoAluno.Text));

      if cbAlunosCursando.Checked then
         qySelecao.SQL.Add(' AND ma.situacao IN (1,10)');

      qySelecao.SQL.Add(' ORDER BY ma.curso, ma.turma, ma.codigoaluno ' );

      qySelecao.Open();

      frmProcessando.Bar.Max := qySelecao.RecordCount;
      frmProcessando.Show;
      Application.ProcessMessages;


      while not qySelecao.Eof do begin

         frmProcessando.lblRegistros.Caption := 'Ajustando valor de créditos do código ' + qySelecao.FieldByName('codigo').AsString ;
         frmProcessando.Bar.Position := frmProcessando.Bar.Position + 1;
         Application.ProcessMessages;
         

         if txtCodigoAluno.Text = '' then begin
            DM.recalcular_creditos_financeiros(qySelecao.FieldByName('codigo').AsInteger,
                qySelecao.FieldByName('turma').AsString,
                qySelecao.FieldByName('anosemestre').AsInteger, false );
         end else begin
            DM.recalcular_creditos_financeiros(qySelecao.FieldByName('codigo').AsInteger,
                qySelecao.FieldByName('turma').AsString,
                qySelecao.FieldByName('anosemestre').AsInteger );
         end;

         qySelecao.Next();

      end;

   end;

   finally
      frmProcessando.Close;
      FreeAndNil( movimento );
      FreeAndNil( qyVerifica );
   end;

//   Não utilizar o modal result, pois essa tela deve ficar aberta após a geração
//   ModalResult := mrOk;

//   frmMensalidades.FiltrarGerar := true;

   frmMensalidades.Filtra();

   Application.ProcessMessages();

   Mensagem('Títulos gerados com sucesso!' + CHR(13) + CHR(13) + 'Você continuará na tela de geração. Se não houver mais nenhuma taxa para ser gerada, apenas feche-a.', 'UNIMESTRE', MB_OK + MB_ICONINFORMATION, Handle);


end;

procedure Tfrm_mensa_gerar.txtDataVencimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
end;

end.

