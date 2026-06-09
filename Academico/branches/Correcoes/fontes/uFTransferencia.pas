unit uFTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask, ToolWin, ImgList, DB,
  ZConnection, uTransferencia, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, uUMNucleo, uMatriculas;

type
   TfTransferencia = class(TForm)
    qyPlanosPgtoParc: TUMZQuery;
    qyTurnos: TUMZQuery;
    qyGruposAtividadesAluno: TUMZQuery;
    qyInativarAluno: TUMZQuery;
    procedure FormShow(Sender: TObject);
    procedure SelecionaFormaFin(Sender: TObject);
   published
      rgOpcoesFin: TRadioGroup;
      edDCurso: TEdit;
      edDTurma: TEdit;
      lbDTCurso: TLabel;
      lbDTTurma: TLabel;
      pnTitulo: TPanel;
      bvSep1: TBevel;
      pnMatricula: TPanel;
      pnMatriculaTitulo: TPanel;
      gbOrigem: TGroupBox;
      lbOTTurma: TLabel;
      lbOTurma: TLabel;
      lbOTGrade: TLabel;
      lbOGrade: TLabel;
      lbOTAnoSem: TLabel;
      lbOAnoSem: TLabel;
      lbOTTurno: TLabel;
      lbOTurno: TLabel;
      lbOTFormaIngresso: TLabel;
      lbOFormaIngresso: TLabel;
      gbDestino: TGroupBox;
      lbOTCurso: TLabel;
      lbOCurso: TLabel;
      bnSelTurma: TSpeedButton;
      bnSelCurso: TSpeedButton;
      lbDTGrade: TLabel;
      cbDGrade: TComboBox;
      lbDTTurno: TLabel;
      cbDTurno: TComboBox;
      lbDTAnoSem: TLabel;
      meAnoSem: TMaskEdit;
      udDAnoSem: TUpDown;
      lbDTFormaIngresso: TLabel;
      cbDFormaIngresso: TComboBox;
      tbAcoes: TToolBar;
      lbAluno: TLabel;
      bvSep2: TBevel;
      pnFinanceiro: TPanel;
      pnFinanceiroTitulo: TPanel;
      bvSep3: TBevel;
      gbPlanoPagtoOrigem: TGroupBox;
      gbPlanoPagtoDestino: TGroupBox;
      lbOTDesc: TLabel;
      lbODesc: TLabel;
      loOTParcelas: TLabel;
      lbOParcelas: TLabel;
      lbOTValor: TLabel;
      lbOValor: TLabel;
      lbOTValorContrato: TLabel;
      lbOValorContrato: TLabel;
      lbDTDesc: TLabel;
      cbPlanoPagto: TComboBox;
      lbDTParcelas: TLabel;
      lbDParcelas: TLabel;
      lbDTValor: TLabel;
      lbDValor: TLabel;
      lbDTValorContrato: TLabel;
      lbDValorContrato: TLabel;
      bnSep1: TToolButton;
      bnConfirmar: TToolButton;
      bnSep2: TToolButton;
      bnFechar: TToolButton;
      bnSep3: TToolButton;
      ilImagens: TImageList;
      qyFormasIngresso: TUMZQuery;
      qyGrades: TUMZQuery;
      qyPlanosPagto: TUMZQuery;
      procedure SelecionaPlano(Sender: TObject);
      procedure ProcessaTransferencia(Sender: TObject);
      procedure SelecionaFormaIngresso(Sender: TObject);
      procedure SelecionaCurso(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure IncDecAnoSemestre(Sender: TObject; Button: TUDBtnType);
      procedure SelecionaTurma(Sender: TObject);
      procedure SelecionaGrade(Sender: TObject);
      procedure SelecionaTurno(Sender: TObject);
      procedure ProcessaTeclasAtalho(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure Fecha(Sender: TObject);
   public
      class procedure ExecutaTransferencia(const AICodMatriculaCurso, AICodAluno,
         AIAnoSem, AIAnoSemIngresso, AICodIngresso, AIPlanoPagto: integer;
         const ASCodCurso, ASCodTurma, ASNomeAluno: string; AOwner: TComponent);
   private
      constructor Create(const AICodMatriculaCurso, AICodAluno, AIAnoSem,
         AIAnoSemIngresso, AICodIngresso, AIPlanoPagto: integer;
         const ASCodCurso, ASCodTurma, ASNomeAluno: string; AOwner: TComponent);
      destructor Destroy; override;
   strict private
      FICodPlanoPagamento: integer;
      FUMTranferenciaCurso: TUMTransferenciaCurso;
      procedure FiltraPlanosPagto;
      procedure CarregaGrades;
      procedure CarregaFormasIngresso(const AICodIngresso: Integer);
      procedure CarregaPlanosPgto;
      procedure carregaTurnos(anosemestre: Integer);
      function VerificaCampos: boolean;
   end;

var
  fTransferencia: TfTransferencia;

implementation

uses
   uFSelecionarCurso, uFSelecionarTurma, uDM;

{$R *.dfm}

procedure TfTransferencia.CarregaFormasIngresso(const AICodIngresso: Integer);
var
   I: integer;
begin
   Self.qyFormasIngresso.Open;
   try
      while not Self.qyFormasIngresso.Eof do
      begin
         Self.cbDFormaIngresso.AddItem(
            Self.qyFormasIngresso.FieldByName('ds_ingresso').AsString,
            TUMFormaIngresso.Create(
               Self.qyFormasIngresso.FieldByName('cd_ingresso').AsInteger,
               Self.qyFormasIngresso.FieldByName('cd_padrao').AsInteger,
               Self.qyFormasIngresso.FieldByName('ds_ingresso').AsString
            )
         );
         Self.qyFormasIngresso.Next;
      end;
   finally
      Self.qyFormasIngresso.Close;
   end;
   for I := 0 to Self.cbDFormaIngresso.Items.Count - 1 do
      if TUMFormaIngresso(Self.cbDFormaIngresso.Items.Objects[I]).Codigo = AICodIngresso then
      begin
         Self.cbDFormaIngresso.ItemIndex := I;
         Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.FormaIngresso.CopyFrom(
            TUMFormaIngresso(Self.cbDFormaIngresso.Items.Objects[Self.cbDFormaIngresso.ItemIndex]));
         Break;
      end;
end;

procedure TfTransferencia.CarregaGrades;

   procedure ResetaComboGrades;
   var
      i: integer;
   begin
      for i := 0 to Self.cbDGrade.Items.Count - 1 do
         TUMGradeCurricular(Self.cbDGrade.Items.Objects[i]).Free;
      Self.cbDGrade.Clear;
   end;

begin
   ResetaComboGrades;
   
   Self.qyGrades.ParamByName('curso').AsString := Self.edDCurso.Text;
   Self.qyGrades.Open;
   try
      if not Self.qyGrades.IsEmpty then
         while not Self.qyGrades.Eof do
         begin
            Self.cbDGrade.AddItem(
               Self.qyGrades.FieldByName('cd_grade').AsString,
               TUMGradeCurricular.Create(
                  Self.qyGrades.FieldByName('cd_grade').AsInteger,
                  Self.qyGrades.FieldByName('cd_curso').AsString
               )
            );   
            Self.qyGrades.Next;
         end;
   finally
      Self.qyGrades.Close;
   end;
end;

procedure TfTransferencia.CarregaPlanosPgto;

   procedure ResetaComboPlanosPagto;
   var
      i: integer;
   begin
      for i := 0 to Self.cbPlanoPagto.Items.Count - 1 do
         TUMPlanoPagamento(Self.cbPlanoPagto.Items.Objects[i]).Free;
      Self.cbPlanoPagto.Clear;
   end;

begin
   ResetaComboPlanosPagto;
   if Self.rgOpcoesFin.ItemIndex = 2 then
   begin
      Self.qyPlanosPgtoParc.ParamByName('codigo').AsInteger :=
         Self.FICodPlanoPagamento;
      Self.qyPlanosPgtoParc.Open;
      try
         while not Self.qyPlanosPgtoParc.Eof do
         begin
            Self.cbPlanoPagto.Items.AddObject(
               Self.qyPlanosPgtoParc.FieldByName('descricao').AsString,
               TUMPlanoPagamento.Create(
                  Self.qyPlanosPgtoParc.FieldByName('codigo').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('cd_coligada').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('anosemestre').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('parcelas').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('numerotaxasmaterial').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('nr_dias_parczero').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('nr_max_disciplinas').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('cd_tipo_plano').AsInteger,
                  Self.qyPlanosPgtoParc.FieldByName('descricao').AsString,
                  Self.qyPlanosPgtoParc.FieldByName('turma').AsString,
                  Self.qyPlanosPgtoParc.FieldByName('curso').AsString,
                  Self.qyPlanosPgtoParc.FieldByName('paragrafo3').AsString,
                  Self.qyPlanosPgtoParc.FieldByName('valorcobrado').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('valorcontrato').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('taxamaterial').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('taxaapostila').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('desconto').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('matricula').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('nr_creditos_base').AsCurrency,
                  Self.qyPlanosPgtoParc.FieldByName('apartir').AsDateTime,
                  Self.qyPlanosPgtoParc.FieldByName('sn_dias_uteis').AsString = 'S',
                  Self.qyPlanosPgtoParc.FieldByName('sn_creditos').AsString = 'S')
            );
            Self.qyPlanosPgtoParc.Next;
         end;
      finally
         Self.qyPlanosPgtoParc.Close;
      end;
   end
   else
   begin
      Self.qyPlanosPagto.Open;
      try
         while not Self.qyPlanosPagto.Eof do
         begin
            Self.cbPlanoPagto.Items.AddObject(
               Self.qyPlanosPagto.FieldByName('descricao').AsString,
               TUMPlanoPagamento.Create(
                  Self.qyPlanosPagto.FieldByName('codigo').AsInteger,
                  Self.qyPlanosPagto.FieldByName('cd_coligada').AsInteger,
                  Self.qyPlanosPagto.FieldByName('anosemestre').AsInteger,
                  Self.qyPlanosPagto.FieldByName('parcelas').AsInteger,
                  Self.qyPlanosPagto.FieldByName('numerotaxasmaterial').AsInteger,
                  Self.qyPlanosPagto.FieldByName('nr_dias_parczero').AsInteger,
                  Self.qyPlanosPagto.FieldByName('nr_max_disciplinas').AsInteger,
                  Self.qyPlanosPagto.FieldByName('cd_tipo_plano').AsInteger,
                  Self.qyPlanosPagto.FieldByName('descricao').AsString,
                  Self.qyPlanosPagto.FieldByName('turma').AsString,
                  Self.qyPlanosPagto.FieldByName('curso').AsString,
                  Self.qyPlanosPagto.FieldByName('paragrafo3').AsString,
                  Self.qyPlanosPagto.FieldByName('valorcobrado').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('valorcontrato').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('taxamaterial').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('taxaapostila').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('desconto').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('matricula').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('nr_creditos_base').AsCurrency,
                  Self.qyPlanosPagto.FieldByName('apartir').AsDateTime,
                  Self.qyPlanosPagto.FieldByName('sn_dias_uteis').AsString = 'S',
                  Self.qyPlanosPagto.FieldByName('sn_creditos').AsString = 'S')
            );
            Self.qyPlanosPagto.Next;
         end;
      finally
         Self.qyPlanosPagto.Close;
      end;
   end;
   if Self.cbPlanoPagto.Items.Count = 1 then
   begin
      Self.cbPlanoPagto.ItemIndex := 0;
      Self.SelecionaPlano(nil);
   end;
end;

procedure TfTransferencia.carregaTurnos(anosemestre: Integer);
   procedure resetaComboTurnos;
   var
      i: integer;
   begin
      for i := 0 to Self.cbDTurno.Items.Count - 1 do
         TUMTurno(Self.cbDTurno.Items.Objects[i]).Free;
      Self.cbDTurno.Clear;
   end;

begin
   resetaComboTurnos;
   
   Self.qyTurnos.ParamByName('turma').AsString := edDTurma.Text;
   Self.qyTurnos.ParamByName('anosemestre').AsInteger := anosemestre;
   self.qyTurnos.Open;
   try
      if not self.qyTurnos.IsEmpty then
         while not self.qyTurnos.Eof do
         begin
            Self.cbDturno.AddItem(
               self.qyTurnos.FieldByName('descricao').AsString,
               TUMTurno.Create(
                  self.qyTurnos.FieldByName('codigo').AsString[1],
                  self.qyTurnos.FieldByName('descricao').AsString
               )
            );   
            self.qyTurnos.Next;
         end;
   finally
      self.qyTurnos.Close;
   end;
end;

constructor TfTransferencia.Create(const AICodMatriculaCurso, AICodAluno,
  AIAnoSem, AIAnoSemIngresso, AICodIngresso, AIPlanoPagto: integer;
  const ASCodCurso, ASCodTurma, ASNomeAluno: string; AOwner: TComponent);
begin
   inherited Create(AOwner);
   Self.FICodPlanoPagamento := AIPlanoPagto;
   Self.lbAluno.Caption := Format('%d - %s', [AICodAluno, ASNomeAluno]);
   Self.meAnoSem.Text := Format('%d', [AIAnoSemIngresso]);
   Self.FUMTranferenciaCurso := TUMTransferenciaCurso.Create;
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.CodAluno := AICodAluno;
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.AnoSemestre := AIAnoSem;
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.CodAluno := AICodAluno;
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.AnoSemIngresso := AIAnoSemIngresso;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodAluno := AICodAluno;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.AnoSemestre := AIAnoSem;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodTurma := ASCodTurma;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodCurso := ASCodCurso;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CarregaPlanoPagamento;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.Codigo := AICodMatriculaCurso;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.CodAluno := AICodAluno;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.AnoSemIngresso := AIAnoSemIngresso;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.CodCurso := ASCodCurso;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.CarregaTurno;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.CarregaFormaIngresso;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.CarregaGradeCurricular;
   Self.lbOCurso.Caption :=
      Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.CodCurso;
   Self.lbOTurma.Caption :=
      Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodTurma;
   Self.lbOGrade.Caption :=
      Format('%d - %d',
         [Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.GradeCurricular.Codigo,
          Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.GradeCurricular.AnoSemestre]);
   Self.lbOTurno.Caption :=
      Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.Turno.Descricao;
   Self.lbOAnoSem.Caption :=
      Format('%d', [AIAnoSemIngresso]);
   Self.lbOFormaIngresso.Caption :=
      Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.FormaIngresso.Descricao;
   Self.lbODesc.Caption :=
      Self.FUMTranferenciaCurso.MatriculaTurmaAtual.PlanoPagamento.Descricao;
   Self.lbOParcelas.Caption :=
      Format('%d', [Self.FUMTranferenciaCurso.MatriculaTurmaAtual.PlanoPagamento.Parcelas]);
   Self.lbOValor.Caption :=
      Format('%n', [Self.FUMTranferenciaCurso.MatriculaTurmaAtual.PlanoPagamento.ValorCobrado]);
   Self.lbOValorContrato.Caption :=
      Format('%n', [Self.FUMTranferenciaCurso.MatriculaTurmaAtual.PlanoPagamento.ValorContrato]);
   Self.CarregaFormasIngresso(AICodIngresso);
end;

destructor TfTransferencia.Destroy;
var
   LIndice: integer;
begin
   for LIndice := 0 to Self.cbDGrade.Items.Count - 1 do
   begin
      TUMGradeCurricular(Self.cbDGrade.Items.Objects[LIndice]).Free;
   end;
   for LIndice := 0 to Self.cbDTurno.Items.Count - 1 do
   begin
      TUMTurno(Self.cbDTurno.Items.Objects[LIndice]).Free;
   end;
   for LIndice := 0 to Self.cbDFormaIngresso.Items.Count - 1 do
   begin
      TUMFormaIngresso(Self.cbDFormaIngresso.Items.Objects[LIndice]).Free;
   end;
   for LIndice := 0 to Self.cbPlanoPagto.Items.Count - 1 do
   begin
      TUMPlanoPagamento(Self.cbPlanoPagto.Items.Objects[LIndice]).Free;
   end;
   Self.cbDGrade.Clear;
   Self.cbDTurno.Clear;
   Self.cbDFormaIngresso.Clear;
   Self.cbPlanoPagto.Clear;
   FreeAndNil(Self.FUMTranferenciaCurso);
   inherited;
end;

class procedure TfTransferencia.ExecutaTransferencia(const AICodMatriculaCurso,
  AICodAluno, AIAnoSem, AIAnoSemIngresso, AICodIngresso, AIPlanoPagto: integer;
  const ASCodCurso, ASCodTurma, ASNomeAluno: string; AOwner: TComponent);
begin
   if not Assigned(fTransferencia) then
      fTransferencia :=
         TfTransferencia.Create(AICodMatriculaCurso, AICodAluno, AIAnoSem,
            AIAnoSemIngresso, AICodIngresso, AIPlanoPagto, ASCodCurso,
            ASCodTurma, ASNomeAluno, AOwner);
   try
      fTransferencia.ShowModal;
   finally
      FreeAndNil(fTransferencia);
   end;
end;

procedure TfTransferencia.Fecha(Sender: TObject);
begin
   Self.Close;
end;

procedure TfTransferencia.FiltraPlanosPagto;

   procedure ResetComboPlanosPgto;
   var
      i: integer;
   begin
      for i := 0 to Self.cbPlanoPagto.Items.Count - 1 do
         TUMPlanoPagamento(Self.cbPlanoPagto.Items.Objects[i]).Free;
      Self.cbPlanoPagto.Clear;
   end;

begin
   ResetComboPlanosPgto;
   Self.qyPlanosPagto.ParamByName('turma').AsString := Self.edDTurma.Text;
   Self.qyPlanosPagto.ParamByName('anosemestre').AsInteger :=
      Self.FUMTranferenciaCurso.MatriculaTurmaNovo.AnoSemestre;
   Self.qyPlanosPgtoParc.ParamByName('turma').AsString := Self.edDTurma.Text;
   Self.qyPlanosPgtoParc.ParamByName('anosemestre').AsInteger := Self.FUMTranferenciaCurso.MatriculaTurmaNovo.AnoSemestre;
   Self.CarregaPlanosPgto;
end;

procedure TfTransferencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfTransferencia.FormShow(Sender: TObject);
begin
   meAnoSem.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   lbDTAnoSem.Visible := meAnoSem.Visible;
   udDAnoSem.Visible := meAnoSem.Visible;
end;

procedure TfTransferencia.IncDecAnoSemestre(Sender: TObject;
  Button: TUDBtnType);
begin
   case Button of
      btNext:
      begin
         Self.meAnoSem.Text := DM.incrementar_ano_semestre(Self.meAnoSem.Text);
      end;
      btPrev:
         Self.meAnoSem.Text := DM.decrementar_ano_semestre(Self.meAnoSem.Text);
   end;
   Self.FUMTranferenciaCurso.MatriculaTurmaAtual.MatriculaCurso.AnoSemIngresso :=
      StrToInt(Self.meAnoSem.Text);
end;

procedure TfTransferencia.ProcessaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if Self.bnConfirmar.Enabled then
            Self.ProcessaTransferencia(nil);
      VK_F12: Self.Close;
   end;
end;

procedure TfTransferencia.ProcessaTransferencia(Sender: TObject);
const
   IntToMetodoFinanceiro: array[0..2] of TUMFinanceiroTipoAjuste =
      (ftaManterValores, ftaGerarNovo, ftaAjustarCreditos);
   MSG_CAMPOS_NAO_PREENCHIDOS =
      'Faltam informações da nova matrícula para executar o processo de transferência. Verifique os campos!';
   MSG_CONFIRMA_TRANSFERENCIA =
      'Tem certeza que deseja executar a transferência entre cursos ?';
   MSG_TRANSFERENCIA_COM_SUCESSO =
      'A transferência foi executada com sucesso!';
   MSG_SUCESSO_NOVO_FINANCEIRO =
      'Foi mantido o financeiro da turma antiga e criado o da nova turma, ' + #13 +
      'não esqueça de entrar na Planilha de Recebimentos e ajustar a situação das parcelas desta pessoa.';

   SQL_GRUPOS_ATIVIDADES_ALUNO = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo, '+
                                 '  dgp.cd_pessoa, '+
                                 '  d.descricao nm_disciplina, '+
                                 '  p.nm_pessoa '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 '	INNER JOIN diario_grupos_pessoas dgp ON ( '+
                                 '		dgp.cd_grupo =  dg.cd_grupo AND '+
                                 '    dgp.dt_saida IS NULL '+
                                 '	) '+
                                 '  INNER JOIN disciplinas d ON ( '+
                                 '		dg.cd_disciplina = d.codigo AND '+
                                 '		dg.cd_curso = d.curso '+
                                 '	) '+
                                 '  INNER JOIN pessoas p ON (p.cd_pessoa = dgp.cd_pessoa) '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.sn_ativo = 1 AND '+
                                 '	dgp.cd_pessoa = :cd_pessoa';
var
   LBSucesso: boolean;
   chaves, observacao: String;   
begin
   LBSucesso := true;
   if Self.VerificaCampos then
   begin
      if Mensagem(MSG_CONFIRMA_TRANSFERENCIA, 'Confirmação', MB_YESNO, Self.Handle) = IDYES then
      begin
         Self.bnConfirmar.Enabled := false;
         try
            Self.FUMTranferenciaCurso.ProcessaTransferencia(IntToMetodoFinanceiro[rgOpcoesFin.ItemIndex]);
         except
            on E: EUMTransferenciaError do
            begin
               Mensagem(E.Message, 'Erro!', MB_ICONERROR, Self.Handle);
               LBSucesso := false;
               self.Close;
            end;
         end;
         if LBSucesso then
         begin
            Self.gbDestino.Font.Color := clGreen;
            Self.gbDestino.Enabled := false;
            Self.gbDestino.Caption := 'MATRICULA EFETUADA COM SUCESSO';
            case Self.rgOpcoesFin.ItemIndex of
               1:
                  Self.gbPlanoPagtoDestino.Caption := 'PARCELAS GERADAS COM SUCESSO';
               2:
                  Self.gbPlanoPagtoDestino.Caption := 'FINANCEIRO AJUSTADO';
            end;
            if Self.rgOpcoesFin.ItemIndex in[1, 2] then
               Self.gbPlanoPagtoDestino.Font.Color := clGreen;
            Self.gbPlanoPagtoDestino.Enabled := false;
            Self.rgOpcoesFin.Enabled := false;
            Mensagem(MSG_TRANSFERENCIA_COM_SUCESSO, 'Sucesso', MB_ICONINFORMATION, Self.Handle);
            if Self.rgOpcoesFin.ItemIndex = 1 then
               Mensagem(MSG_SUCESSO_NOVO_FINANCEIRO, 'Sucesso', MB_ICONINFORMATION, Self.Handle);

            // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
            qyGruposAtividadesAluno.SQL.Text := SQL_GRUPOS_ATIVIDADES_ALUNO;

            qyGruposAtividadesAluno.Close;
            qyGruposAtividadesAluno.ParamByName('nr_anosemestre').AsInteger := Self.FUMTranferenciaCurso.MatriculaTurmaAtual.AnoSemestre;
            qyGruposAtividadesAluno.ParamByName('cd_curso').AsString := Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodCurso;
            qyGruposAtividadesAluno.ParamByName('cd_turma').AsString := Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodTurma;
            qyGruposAtividadesAluno.ParamByName('cd_pessoa').AsInteger := Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodAluno;
            qyGruposAtividadesAluno.Open;

            // Aluno vinculado a grupos de atividades (nessa matrícula)
            if not qyGruposAtividadesAluno.Eof then
            begin
               // Avisa o usuário que ele está transferindo o aluno, que o mesmo que possui vinculos em disciplinas com grupos de atividades
               Mensagem('Você transferiu um aluno que possui disciplinas com grupos de atividades, o aluno foi inativado nesses grupos.', 'Informação', MB_OK + MB_ICONINFORMATION );

               // Varre os grupos de atividade que o aluno será desativado
               while not qyGruposAtividadesAluno.Eof do
               begin
                  // Inativa o aluno no grupo de atividade que ele estiver relacionado
                  qyInativarAluno.Close;
                  qyInativarAluno.ParamByName('cd_pessoa').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsInteger;
                  qyInativarAluno.ParamByName('cd_grupo').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger;

                  // Verifica se foi informada uma data de saída do aluno
                  if not DM.tblMatriculasDataSaida.IsNull then
                  begin
                     qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.tblMatriculasDataSaida.AsDateTime;
                  end else begin
                     qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;
                  end;

                  qyInativarAluno.ExecSQL;

                  // Guardar log de inativação do aluno no grupo (tabela: log_geral)
                  // Chave: CD_PESSOA;CD_GRUPO
                  chaves := FillString(qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString, alRight, '0', 10, true ) + ';' + qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString;

                  observacao := 'Transferência de curso do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'", portanto o estudante foi inativado no grupo '+
                                qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                                'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', qyInativarAluno.ParamByName('dt_saida').AsDateTime);

                  DM.setLog(
                     1108,
                     'Alteracao',
                     chaves,
                     dm.getColigadaByTurma(Self.FUMTranferenciaCurso.MatriculaTurmaAtual.CodTurma, Self.FUMTranferenciaCurso.MatriculaTurmaAtual.AnoSemestre),
                     observacao
                  );
         
                  qyGruposAtividadesAluno.Next;
               end;

            end;
         end;
      end;
   end
   else
      Mensagem(MSG_CAMPOS_NAO_PREENCHIDOS, 'Atenção', MB_ICONWARNING + MB_OK, Self.Handle);
end;

procedure TfTransferencia.SelecionaCurso(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin

   resultado_filtro := TfrmSelecionarCurso.Filtrar([bfcAnosemestre], -1, -1, Self.FUMTranferenciaCurso.MatriculaTurmaAtual.AnoSemestre);

   if resultado_filtro.filtrado then
   begin
      Self.edDTurma.Clear;
      Self.edDCurso.Text := resultado_filtro.cd_curso;
      Self.FUMTranferenciaCurso.MatriculaTurmaNovo.CodCurso := Self.edDCurso.Text;
      Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.CodCurso := Self.edDCurso.Text;
      Self.CarregaGrades;
   end;
end;

procedure TfTransferencia.SelecionaFormaFin(Sender: TObject);
begin
   Self.lbDParcelas.Caption := 'NÚMERO DE PARCELAS';
   Self.lbDValor.Caption := 'VALOR DA PARCELA';
   Self.lbDValorContrato.Caption := 'VALOR DO CONTRATO';
   if Self.rgOpcoesFin.ItemIndex = 0 then
   begin
      Self.cbPlanoPagto.ItemIndex := -1;
      Self.cbPlanoPagto.Enabled := false;
   end
   else
   begin
      Self.cbPlanoPagto.Enabled := true;
      Self.FiltraPlanosPagto;
   end;
end;

procedure TfTransferencia.SelecionaFormaIngresso(Sender: TObject);
begin
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.FormaIngresso.CopyFrom(
      TUMFormaIngresso(Self.cbDFormaIngresso.Items.Objects[Self.cbDFormaIngresso.ItemIndex]));
end;

procedure TfTransferencia.SelecionaGrade(Sender: TObject);
begin
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.GradeCurricular.CopyFrom(
      TUMGradeCurricular(Self.cbDGrade.Items.Objects[Self.cbDGrade.ItemIndex]));
end;

procedure TfTransferencia.SelecionaPlano(Sender: TObject);
begin
   with TUMPlanoPagamento(Self.cbPlanoPagto.Items.Objects[Self.cbPlanoPagto.ItemIndex]) do
   begin
      Self.lbDParcelas.Caption := Format('%d', [Parcelas]);
      Self.lbDValor.Caption := Format('%n', [ValorCobrado]);
      Self.lbDValorContrato.Caption := Format('%n', [ValorContrato]);
   end;
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.PlanoPagamento.CopyFrom(
      TUMPlanoPagamento(Self.cbPlanoPagto.Items.Objects[Self.cbPlanoPagto.ItemIndex]));
end;

procedure TfTransferencia.SelecionaTurma(Sender: TObject);
CONST
   SQL_PLANOS_TURMAS = ''+
   'SELECT                                      '+
	'  count(*) AS qtd                           '+
   'FROM                                        '+
	'  fin_planos_turmas fpt                     '+
   '  INNER JOIN fin_planos fp ON (fpt.CD_PLANO = fp.CD_PLANO) '+
   'WHERE                                       '+
	'  fpt.CD_CURSO = :cd_curso                  '+
   '  AND fpt.CD_TURMA = :cd_turma              '+
   '  AND fp.NR_ANOSEMESTRE = :nr_anosemestre  '+
   '  AND SN_CREDITOS = 1                       ';
var
   resultado_filtro : TResultadoFiltroTurma;
   qyVerificaCreditoPlano: TUMZQuery;
   qtdTurmaAnteriorCreditos: Integer;
begin

   if edDCurso.Text <> '' then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre, bftCurso], Self.FUMTranferenciaCurso.MatriculaTurmaAtual.AnoSemestre, -1, -1, edDCurso.Text);
   end
   else
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre], Self.FUMTranferenciaCurso.MatriculaTurmaAtual.AnoSemestre);
   end;

   if resultado_filtro.filtrado then
   begin
      Self.edDTurma.Text := resultado_filtro.cd_turma;
      
      if resultado_filtro.cd_curso <> Self.edDCurso.Text then
      begin
         Self.edDCurso.Text := resultado_filtro.cd_curso;
         
         Self.FUMTranferenciaCurso.MatriculaTurmaNovo.CodCurso := Self.edDCurso.Text;
         Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.CodCurso := Self.edDCurso.Text;

      end;

      Self.carregaTurnos(resultado_filtro.nr_anosemestre);
      
      Self.FUMTranferenciaCurso.MatriculaTurmaNovo.CodTurma := Self.edDTurma.Text;
      Self.FUMTranferenciaCurso.MatriculaTurmaNovo.CodColigada := resultado_filtro.cd_coligada;
      
      Self.rgOpcoesFin.Enabled := true;
      
      if rgOpcoesFin.ItemIndex > 0 then
         Self.FiltraPlanosPagto;

      dm.CriarConsulta(qyVerificaCreditoPlano);

      qyVerificaCreditoPlano.SQL.Text := SQL_PLANOS_TURMAS;

      qyVerificaCreditoPlano.ParamByName('cd_curso').AsString := frmMatriculas.tblMatriculascd_curso.AsString;
      qyVerificaCreditoPlano.ParamByName('cd_turma').AsString := frmMatriculas.tblMatriculasTurma.AsString;
      qyVerificaCreditoPlano.ParamByName('nr_anosemestre').asInteger := frmMatriculas.tblMatriculasAnoSemestre.asInteger;

      qyVerificaCreditoPlano.Open;

      //Verifica se a turma/curso anterior utiliza creditos financeiros.
      qtdTurmaAnteriorCreditos := qyVerificaCreditoPlano.FieldByName('qtd').AsInteger;

      qyVerificaCreditoPlano.Close;

      qyVerificaCreditoPlano.SQL.Text := SQL_PLANOS_TURMAS;

      qyVerificaCreditoPlano.ParamByName('cd_curso').AsString := edDCurso.Text;
      qyVerificaCreditoPlano.ParamByName('cd_turma').AsString := edDTurma.Text;
      qyVerificaCreditoPlano.ParamByName('nr_anosemestre').asInteger := resultado_filtro.nr_anosemestre;
      qyVerificaCreditoPlano.Open;

      //Habilita a opção de ajustar financeiro se for de um plano de crédito
      //para outro plano de crédito, desabilita caso seja outra situação.
      if ((qtdTurmaAnteriorCreditos > 0) AND (qyVerificaCreditoPlano.FieldByName('qtd').AsInteger > 0)) then
      begin
         rgOpcoesFin.Controls[2].Enabled := True;
      end
      else
      begin
         rgOpcoesFin.Controls[2].Enabled := False;
      end;

   end;
end;

procedure TfTransferencia.SelecionaTurno(Sender: TObject);
begin
   Self.FUMTranferenciaCurso.MatriculaTurmaNovo.MatriculaCurso.Turno.CopyFrom(
      TUMTurno(Self.cbDTurno.Items.Objects[Self.cbDTurno.ItemIndex]));
end;

function TfTransferencia.VerificaCampos: boolean;
begin
   Result :=
      (Trim(Self.edDCurso.Text) <> '') and
      (Trim(Self.edDTurma.Text) <> '') and
      (Self.cbDGrade.ItemIndex <> -1) and
      (Self.cbDTurno.ItemIndex <> -1) and
      (Trim(Self.meAnoSem.Text) <> '') and
      (Self.cbDFormaIngresso.ItemIndex <> -1) and
      ((Self.cbPlanoPagto.ItemIndex <> -1) or (Self.rgOpcoesFin.ItemIndex = 0));
end;

end.

