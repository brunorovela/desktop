unit uFReajusteAulasHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, uListaExecucao, UMComboBox,
  ComCtrls, CommCtrl, Buttons, DateUtils, ImgList;

type
   TButtonOnFocusEvent = procedure(Sender: TObject; const HasFocus: Boolean) of Object;
   TBitBtn = class(Buttons.TBitBtn)
      private
         FOnFocusEvent: TButtonOnFocusEvent;

         procedure CMFocusChanged(var Message: TCMFocusChanged);
            message CM_FOCUSCHANGED;

      public
         Coluna, Linha: Integer;

      published
         property OnFocus: TButtonOnFocusEvent read FOnFocusEvent write FOnFocusEvent;
   end;

   TMonthCalendar = class(ComCtrls.TMonthCalendar)
      public
         MounthNum: Integer;
         DateBkp : TDate;
         constructor Create(AOwner: TComponent); override;
   end;

   TfrmReajusteAulasTurma = class(TForm)
      Panel3: TPanel;
      Panel1: TPanel;
      sgAulas: TStringGrid;
      pnResize: TPanel;
      Button1: TBitBtn;
      Button2: TBitBtn;
      cbSelecionarAcaoAula: TUMComboBox;
      cbSelecionarHorario: TUMComboBox;
      bbtnSelecaoData: TBitBtn;
      mcSelecaoData: TMonthCalendar;
      procedure mcSelecaoDataClick(Sender: TObject);

      procedure cbSelecionarHorarioChange(Sender: TObject);

      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure cbSelecionarAcaoAulaChange(Sender: TObject);
      procedure sgAulasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
         State: TGridDrawState);
      procedure FormShow(Sender: TObject);
      procedure Panel1Resize(Sender: TObject);
   const
      COLUNA_ACAO = 6;
      COLUNA_HORARIO = COLUNA_ACAO+1;
      COLUNA_DATA = COLUNA_HORARIO+1;

   strict private
      arrAcoesSelecao : TStringList;

      { Private declarations }
      procedure ZerarGrid();
      function CarregarGrid(ListaExecucao : TListaExecucao; const nr_anosemestre: Integer; cd_turma: String; const dataInicio: TDateTime = 0; condicaoExtra: String = ''; horarioAtivo : Boolean = true): Boolean;

      procedure OnFocusEvent(Sender : TObject; const HasFocus: Boolean);

   public
      { Public declarations }
      ListaHorariosDasDisciplinas: TStringList;

      class function ajustarAulasHoras(var ListaExecucao: TListaExecucao; ListaHorariosDasDisciplinas: TStringList; const nr_anosemestre: Integer; const cd_turma_base: String; const dataInicio: TDateTime = 0; condicaoExtra: String = ''; horarioAtivo : Boolean = true): Boolean;
   end;

implementation

uses uUCadastroHorariosTurma, uListaDisciplinas, UZDataset, uDM, DB, uItemCombo,
  Types, uGeneral, Contnrs;

{$R *.dfm}

{ TfrmReajusteAulasTurma }

class function TfrmReajusteAulasTurma.ajustarAulasHoras(
  var ListaExecucao: TListaExecucao; ListaHorariosDasDisciplinas: TStringList;
  const nr_anosemestre: Integer; const cd_turma_base: String;
  const dataInicio: TDateTime; condicaoExtra: String; horarioAtivo : Boolean): Boolean;
var
   frmReajusteAulasTurma: TfrmReajusteAulasTurma;
   I: Integer;
   acaoRegistro: TItemCombo;
   parametroLogs : TExecucaoAulaParametroLogs;
   cd_horario_turma: Integer;
   ExecucaoAtualizaAula : TExecucaoAula;
   ExecucaoInsereVinculoHorario : TExecucaoVinculoAula;
   qyTurmaHorario: TUMZReadOnlyQuery;
begin
   frmReajusteAulasTurma := TfrmReajusteAulasTurma.Create(nil);
   frmReajusteAulasTurma.ZerarGrid();

   frmReajusteAulasTurma.ListaHorariosDasDisciplinas := ListaHorariosDasDisciplinas;

   if NOT(frmReajusteAulasTurma.CarregarGrid(ListaExecucao, nr_anosemestre, cd_turma_base, dataInicio,condicaoExtra,horarioAtivo)) then
   begin
      // Retorna a confirmação para a aplicação das aulas caso não trouxe registro de aulas a serem corrigidas
      Result := True;
   end else begin
      // ou se na tela foi pressionado o botão de pressionar, com os dados corrigidos
      Result := (frmReajusteAulasTurma.ShowModal() = mrYes);

      if Result then
      begin
         for I := 1 to frmReajusteAulasTurma.sgAulas.RowCount - 1 do
         begin
            acaoRegistro := TItemCombo(frmReajusteAulasTurma.sgAulas.Objects[0, I]);
            parametroLogs                 := TExecucaoAulaParametroLogs.Create;
            parametroLogs.nro_aula        := frmReajusteAulasTurma.sgAulas.Cells[0, I];
            parametroLogs.ds_disciplina   := frmReajusteAulasTurma.sgAulas.Cells[1, I];
            parametroLogs.nr_etapa        := frmReajusteAulasTurma.sgAulas.Cells[2, I];
            parametroLogs.nm_professor    := frmReajusteAulasTurma.sgAulas.Cells[3, I];
            parametroLogs.data            := frmReajusteAulasTurma.sgAulas.Cells[4, I];
            parametroLogs.horario_antigo  := frmReajusteAulasTurma.sgAulas.Cells[5, I];
            parametroLogs.horario_novo    := frmReajusteAulasTurma.sgAulas.Cells[COLUNA_HORARIO, I];
            parametroLogs.nr_anosemestre  := IntToStr(nr_anosemestre);
            parametroLogs.cd_turma        := cd_turma_base;

            case StrToIntDef(acaoRegistro.getDescricao(), 0) of
               {Excluir a Aula Gerada}
               1: begin
                  // Como utilizamos a chave primária da tabela diario_aulas...
                  // Primeiro excluimos a diario_aulas_alunos
                  ListaExecucao.Add(TExecucaoAula.Create(teaDeleteAulasAlunos, parametroLogs, StrToInt(acaoRegistro.getCodigo())));
                  // E em seguida a aula efetivamente (diario_aulas)
                  ListaExecucao.Add(TExecucaoAula.Create(teaDelete, parametroLogs, StrToInt(acaoRegistro.getCodigo())));
               end;
               {Modificar a Data}
               2: begin
                  cd_horario_turma := TItemCombo(frmReajusteAulasTurma.sgAulas.Objects[1,I]).getVariavel();
                  
                  DM.CriarConsulta(qyTurmaHorario);
                  qyTurmaHorario.SQL.Text :=
                  'select cd_turmas_horarios from turmas_horarios_config ' +
                  ' where cd_horario = ' + IntToStr(cd_horario_turma) +
                  ' and nr_anosemestre = ' + IntToStr(nr_anosemestre) +
                  ' and cd_turma = "' +  cd_turma_base + '"' +
                  ' and sn_ativo = 1 ';

                  qyTurmaHorario.Open;

                  ExecucaoAtualizaAula := TExecucaoAula.Create(teaUpdate, parametroLogs, StrToInt(acaoRegistro.getCodigo()), acaoRegistro.getVariavel(), cd_horario_turma);
                  ListaExecucao.Add(ExecucaoAtualizaAula);

                  ExecucaoInsereVinculoHorario := TExecucaoVinculoAula.Create(StrToInt(acaoRegistro.getCodigo()), qyTurmaHorario.FieldByName('cd_turmas_horarios').AsInteger);
                  ExecucaoInsereVinculoHorario.SetDependencia(ExecucaoAtualizaAula);

                  ListaExecucao.Add(ExecucaoInsereVinculoHorario);
               end;
               {Manter a aula como atividade extra - Fora de Horário}
               3: begin
                  ListaExecucao.Add(TExecucaoAula.Create(teaUpdateExtra, parametroLogs, StrToInt(acaoRegistro.getCodigo())));
               end;
            end;
         end;
      end;
   end;
end;

function TfrmReajusteAulasTurma.CarregarGrid(ListaExecucao: TListaExecucao;
   const nr_anosemestre: Integer; cd_turma: String;
   const dataInicio: TDateTime; condicaoExtra: String; horarioAtivo : Boolean): Boolean;
const
   SQL_GET_AULAS_INCORRETAS =
      ' SELECT da.cd_diario_aula, da.nro_aula, thc.nr_anosemestre, thc.cd_turma_base,  ' +
      '        p.nm_pessoa, d.descricao, da.bimestre, h.ds_horario, ' +
      '        DATE_FORMAT(da.`data`, ''%d/%m/%Y'') AS `data`, ' +
      '        DATE_ADD(da.`data`,INTERVAL 1 DAY) AS nova_data, ' +
      '        thc.cd_disciplina, thc.nr_dia_semana, thc.cd_turmas_horarios ' +
      ' FROM turmas_horarios_config thc ' +
      '	    INNER JOIN diario_aulas_turmas_horarios dath ON ( '+
		'         thc.cd_turmas_horarios = dath.cd_turma_horario '+
	   '      )          '+
      '      INNER JOIN diario_aulas da ON ( ' +
      '         dath.cd_diario_aula = da.cd_diario_aula ' +
      '      ) ' +
      '      INNER JOIN turmas t ON ( ' +
      '         t.codigo = thc.cd_turma_base AND t.anosemestre = thc.nr_anosemestre ' +
      '      ) ' +
      '      INNER JOIN disciplinas d ON ( ' +
      '         d.codigo = thc.cd_disciplina AND d.curso = t.curso ' +
      '      ) ' +
      '      INNER JOIN horarios h ON ( h.codigo = thc.cd_horario ) ' +
      '      LEFT JOIN pessoas p ON ( p.cd_pessoa = da.cd_professor ) ' +
      ' WHERE thc.nr_anosemestre = :nr_anosemestre AND thc.cd_turma = :cd_turma ';
   SQL_GET_AULAS_INCORRETAS_ORDEM =
      ' ) GROUP BY da.cd_diario_aula ORDER BY d.descricao, da.nro_aula ';
var
   I : Integer;
   ExecucaoHorarioTurma : TExecucaoHorarioTurma;
   qyGetListaAulas : TUMZReadOnlyQuery;
begin
   Result := False;
   DM.CriarConsulta(qyGetListaAulas);

   qyGetListaAulas.SQL.Text := SQL_GET_AULAS_INCORRETAS;

   // Se nenhuma data de limite foi passada, então pegar APARTIR de hoje
   if dataInicio = 0 then
   begin
      qyGetListaAulas.SQL.Add( 'AND DATE_FORMAT( da.`data`, ''%Y-%m-%d'' ) > DATE_FORMAT( NOW(), ''%Y-%m-%d'' )' );
   end else begin
      // Caso contrário, usa como limite inicial de aulas, a data passada
      qyGetListaAulas.SQL.Add( 'AND DATE_FORMAT( da.`data`, ''%Y-%m-%d'' ) >= DATE_FORMAT( :dt_inicio, ''%Y-%m-%d'' )' );
      qyGetListaAulas.ParamByName('dt_inicio').AsDateTime := dataInicio;
   end;

   if(horarioAtivo) then
   begin
      qyGetListaAulas.SQL.Add('AND thc.sn_ativo = 1');
   end;

   qyGetListaAulas.SQL.Add(' AND ( 0=1');

   qyGetListaAulas.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyGetListaAulas.ParamByName('cd_turma').AsString := cd_turma;

   for I := 0 to ListaExecucao.Count() - 1 do
   begin
      if ( ListaExecucao.Item[I] is TExecucaoHorarioTurma ) then
      begin
         ExecucaoHorarioTurma := TExecucaoHorarioTurma(ListaExecucao.Item[I]);
         if ExecucaoHorarioTurma.TipoExecucao = teDelete then
         begin
            qyGetListaAulas.SQL.Add(Format('OR ( thc.cd_disciplina = %d AND DAYOFWEEK(da.`data`) = %d AND h.codigo = %d )', [ExecucaoHorarioTurma.Disciplina.Codigo, ExecucaoHorarioTurma.DiaSemana, ExecucaoHorarioTurma.Horario] ) );
         end;
      end;
   end;

   if(condicaoExtra <> '') then
   begin
      qyGetListaAulas.SQL.Add(condicaoExtra);
   end;

   qyGetListaAulas.SQL.Add(SQL_GET_AULAS_INCORRETAS_ORDEM);
   qyGetListaAulas.Open();

   // Se trouxe registro, então retorna True, informando que a tela pode ser aberta
   if(qyGetListaAulas.RecordCount <= 0) then
   begin
      Result := false;
      exit;
   end;

   Result := true;
   sgAulas.RowCount := qyGetListaAulas.RecordCount + 1;
   for I := qyGetListaAulas.RecNo to qyGetListaAulas.RecordCount do
   begin
      sgAulas.Cells[0, I]               := qyGetListaAulas.FieldByName('nro_aula').AsString;
{      sgAulas.Cells[1, I]               := qyGetListaAulas.FieldByName('nr_anosemestre').AsString;
      sgAulas.Cells[2, I]               := qyGetListaAulas.FieldByName('cd_turma_base').AsString;}
      sgAulas.Cells[1, I]               := qyGetListaAulas.FieldByName('descricao').AsString;
      sgAulas.Cells[2, I]               := qyGetListaAulas.FieldByName('bimestre').AsString;
      sgAulas.Cells[3, I]               := qyGetListaAulas.FieldByName('nm_pessoa').AsString;
      sgAulas.Cells[4, I]               := qyGetListaAulas.FieldByName('data').AsString;

      sgAulas.Cells[5, I]               :=
         TGeneral.GetDescricaoDiaSemana(qyGetListaAulas.FieldByName('nr_dia_semana').AsInteger) + ' - ' +
         qyGetListaAulas.FieldByName('ds_horario').AsString;

      sgAulas.Cells[COLUNA_HORARIO, I]  := '';
      sgAulas.Cells[COLUNA_DATA, I]     := '';
      sgAulas.Cells[COLUNA_ACAO, I]     := '';

      sgAulas.Objects[0, I] := TItemCombo.Create(
         qyGetListaAulas.FieldByName('cd_diario_aula').AsString,
         '0',
         qyGetListaAulas.FieldByName('nova_data').AsDateTime
      );

      sgAulas.Objects[1, I] := TItemCombo.Create(
         qyGetListaAulas.FieldByName('cd_disciplina').AsString,
         '-1',
         qyGetListaAulas.FieldByName('cd_turmas_horarios').AsInteger
      );

      sgAulas.Objects[2, I] := TItemCombo.Create(
         '',
         '',
         qyGetListaAulas.FieldByName('data').AsDateTime
      );

      Application.ProcessMessages;

      qyGetListaAulas.Next();
   end;

   FreeAndNil(qyGetListaAulas);
end;

procedure TfrmReajusteAulasTurma.cbSelecionarAcaoAulaChange(Sender: TObject);
const
   MSG_DISCIPLINA_SEM_HORARIO =
      'Não existe nenhum horário configurado para esta disciplina.' + #13 +
      'Você deve usar a opção de "atividade extra" ou então configurar um horário para esta disciplina.';
begin
   if ( cbSelecionarAcaoAula.ItemIndex IN [2] ) AND
      ( ListaHorariosDasDisciplinas.IndexOf(TItemCombo(sgAulas.Objects[1, sgAulas.Row]).getCodigo()) = -1 ) then
   begin
      cbSelecionarAcaoAula.OnChange := nil;
      cbSelecionarAcaoAula.ItemIndex := cbSelecionarAcaoAula.Tag;
      cbSelecionarAcaoAula.OnChange := cbSelecionarAcaoAulaChange;

      TGeneral.Mensagem(MSG_DISCIPLINA_SEM_HORARIO, 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      Abort();
   end;

   TItemCombo(sgAulas.Objects[0,sgAulas.Row]).setDescricao(IntToStr(cbSelecionarAcaoAula.ItemIndex));
   cbSelecionarAcaoAula.Tag := cbSelecionarAcaoAula.ItemIndex;

   if cbSelecionarAcaoAula.ItemIndex = 0 then
   begin
      sgAulas.Cells[COLUNA_ACAO,sgAulas.Row] := '';
   end else begin
      sgAulas.Cells[COLUNA_ACAO,sgAulas.Row] := arrAcoesSelecao[cbSelecionarAcaoAula.ItemIndex];
   end;

   if cbSelecionarAcaoAula.ItemIndex IN [2] then
   begin
      sgAulas.Cells[COLUNA_DATA,sgAulas.Row] := TItemCombo(sgAulas.Objects[0,sgAulas.Row]).getVariavel();
   end else begin
      sgAulas.Cells[COLUNA_DATA,sgAulas.Row] := '';
   end;

   sgAulas.SetFocus;
end;

procedure TfrmReajusteAulasTurma.cbSelecionarHorarioChange(Sender: TObject);
var
   DiaSemanaSelecionado : Word;
begin
   DiaSemanaSelecionado := TItemCombo(cbSelecionarHorario.Items.Objects[cbSelecionarHorario.ItemIndex]).getVariavel2();
   
   TItemCombo(sgAulas.Objects[1,sgAulas.Row]).setDescricao(IntToStr(cbSelecionarHorario.ItemIndex));
   TItemCombo(sgAulas.Objects[1,sgAulas.Row]).setVariavel(StrToInt(TItemCombo(cbSelecionarHorario.Items.Objects[cbSelecionarHorario.ItemIndex]).getCodigo()));
   TItemCombo(sgAulas.Objects[0,sgAulas.Row]).setVariavel(TGeneral.GetNextDateOfDayWeek(TItemCombo(sgAulas.Objects[2,sgAulas.Row]).getVariavel(), DiaSemanaSelecionado));

   sgAulas.Cells[COLUNA_HORARIO,sgAulas.Row] := TItemCombo(cbSelecionarHorario.Items.Objects[cbSelecionarHorario.ItemIndex]).getDescricao();

   sgAulas.SetFocus;
end;

procedure TfrmReajusteAulasTurma.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   I: Integer;
begin
   CanClose := True;

   if Self.ModalResult = mrCancel then
   begin
      Exit;
   end;

   for I := 1 to sgAulas.RowCount - 1 do
   begin
      if StrToIntDef(TItemCombo(sgAulas.Objects[0, I]).getDescricao(), 0) = 0 then
      begin
         TGeneral.Mensagem('É necessário selecionar uma ação de execução em todas as aulas.', 'Atenção', MB_OK + MB_ICONEXCLAMATION, Handle);
         CanClose := False;
         Break;
      end;
   end;
end;

procedure TfrmReajusteAulasTurma.FormCreate(Sender: TObject);
begin
   arrAcoesSelecao := TStringList.Create();
   arrAcoesSelecao.Add('Selecione');
   arrAcoesSelecao.Add('Excluir a aula gerada');
   arrAcoesSelecao.Add('Modificar a data');
   arrAcoesSelecao.Add('Manter a aula como atividade extra - Fora de horário');

   cbSelecionarAcaoAula.Items.Assign(arrAcoesSelecao);
   bbtnSelecaoData.OnFocus := OnFocusEvent;
end;

procedure TfrmReajusteAulasTurma.FormShow(Sender: TObject);
begin
   Panel1Resize(nil);
end;

procedure TfrmReajusteAulasTurma.mcSelecaoDataClick(Sender: TObject);
const
   MSG_SELECIONE_DATA_CORRETA =
      'Você deve selecionar a data no dia da semana correspondente ao horário selecionado.';
var
   DiaSemanaSelecionado : Word;
begin
   DiaSemanaSelecionado := TItemCombo(cbSelecionarHorario.Items.Objects[cbSelecionarHorario.ItemIndex]).getVariavel2();

   if DiaSemanaSelecionado <> DayOfWeek(mcSelecaoData.Date) then
   begin
      if (
         (YearOf(mcSelecaoData.Date) > YearOf(mcSelecaoData.DateBkp)) OR
         (MonthOf(mcSelecaoData.Date) > MonthOf(mcSelecaoData.DateBkp))
      ) then
      begin
         mcSelecaoData.Date := TGeneral.GetProximoDiaNoDiaDaSemana(mcSelecaoData.Date, DiaSemanaSelecionado, cddIncremento);
      end else if (
         (YearOf(mcSelecaoData.Date) < YearOf(mcSelecaoData.DateBkp)) OR
         (MonthOf(mcSelecaoData.Date) < MonthOf(mcSelecaoData.DateBkp))
      ) then
      begin
         mcSelecaoData.Date := TGeneral.GetProximoDiaNoDiaDaSemana(mcSelecaoData.Date, DiaSemanaSelecionado, cddDecremento);
      end else begin
         mcSelecaoData.Date := mcSelecaoData.DateBkp;
         TGeneral.Mensagem(MSG_SELECIONE_DATA_CORRETA, 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      end;
   end else begin
      sgAulas.SetFocus();
   end;
end;

procedure TfrmReajusteAulasTurma.OnFocusEvent(Sender: TObject;
  const HasFocus: Boolean);
var
   DiaSemanaSelecionado : Word;
begin
   if HasFocus AND (cbSelecionarHorario.ItemIndex = -1) then
   begin
      TGeneral.Mensagem('É necessário selecionar um novo horário para a aula.', 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      cbSelecionarHorario.SetFocus();
      Exit;
   end;                                    

   if TBitBtn(Sender).Top + TBitBtn(Sender).Height + mcSelecaoData.Height + 35 > Self.Height then
   begin
      mcSelecaoData.Top := TBitBtn(Sender).Top - mcSelecaoData.Height;
   end else begin
      mcSelecaoData.Top := TBitBtn(Sender).Top + TBitBtn(Sender).Height;
   end;

   mcSelecaoData.Left := TBitBtn(Sender).Left;

   if HasFocus then
   begin
      mcSelecaoData.Date := StrToDate('01/01/' + IntToStr(YearOf(StrToDate(TBitBtn(Sender).Caption))));
      mcSelecaoData.Date := StrToDate(TBitBtn(Sender).Caption);
      mcSelecaoData.DateBkp := mcSelecaoData.Date;
   end
   else if mcSelecaoData.Visible then
   begin
      TItemCombo(sgAulas.Objects[0,sgAulas.Row]).setVariavel(mcSelecaoData.Date);

      bbtnSelecaoData.Caption := FormatDateTime('dd/mm/yyyy', TItemCombo(sgAulas.Objects[0,sgAulas.Row]).getVariavel());
      sgAulas.Cells[COLUNA_DATA, bbtnSelecaoData.Linha] := bbtnSelecaoData.Caption;
   end;

   mcSelecaoData.Visible := HasFocus;
end;

procedure TfrmReajusteAulasTurma.Panel1Resize(Sender: TObject);
begin
   pnResize.Left := Trunc(Panel1.Width / 2) - Trunc(pnResize.Width/2);
end;

procedure TfrmReajusteAulasTurma.sgAulasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
   if NOT(ARow > 0) then
      Exit;

   case ACol of
      { Coluna de Seleção de horários possíveis a serem selecionados pelo usuário }
      COLUNA_HORARIO: begin
         if (gdSelected in State) AND
            (StrToIntDef(TItemCombo(sgAulas.Objects[0, ARow]).getDescricao(), 0) in [2]) then
         begin
            cbSelecionarHorario.Left := Rect.Left + sgAulas.Left;
            cbSelecionarHorario.Top := Rect.Top + sgAulas.Top;

            cbSelecionarHorario.Width := Rect.Right - Rect.Left - 1;
            cbSelecionarHorario.Height := Rect.Bottom - Rect.Top - 1;

            cbSelecionarHorario.Clear();

            cbSelecionarHorario.Items.Assign(TStrings(ListaHorariosDasDisciplinas.Objects[
               ListaHorariosDasDisciplinas.IndexOf(TItemCombo(sgAulas.Objects[1, ARow]).getCodigo())
            ]));

            cbSelecionarHorario.ItemIndex := StrToIntDef(TItemCombo(sgAulas.Objects[1, ARow]).getDescricao(), -1);

            cbSelecionarHorario.Visible := True;
         end else begin
            cbSelecionarHorario.Visible := False;
         end;
      end;
      { Coluna de Seleção de Nova data para a Aula }
      COLUNA_DATA: begin
         if (gdSelected in State) AND
            (StrToIntDef(TItemCombo(sgAulas.Objects[0, ARow]).getDescricao(), 0) in [2]) then
         begin
            bbtnSelecaoData.Left := Rect.Left + sgAulas.Left + 1;
            bbtnSelecaoData.Top := Rect.Top + sgAulas.Top;

            bbtnSelecaoData.Width := Rect.Right - Rect.Left - 1;
            bbtnSelecaoData.Height := Rect.Bottom - Rect.Top;

            try
               bbtnSelecaoData.Caption := FormatDateTime('dd/mm/yyyy', TItemCombo(sgAulas.Objects[0, ARow]).getVariavel());
            except
               bbtnSelecaoData.Caption := FormatDateTime('dd/mm/yyyy', Now());
            end;

            bbtnSelecaoData.Coluna := ACol;
            bbtnSelecaoData.Linha := ARow;

            bbtnSelecaoData.Visible := True;
            bbtnSelecaoData.Enabled := StrToIntDef(TItemCombo(sgAulas.Objects[0, ARow]).getDescricao(), 0) in [2];
         end else begin
            bbtnSelecaoData.Visible := False;
         end;

         if (StrToIntDef(TItemCombo(sgAulas.Objects[0, ARow]).getDescricao(), 0) in [2]) then
         begin
            sgAulas.Canvas.Font.Color := clBlue;
            sgAulas.Canvas.FillRect(Rect);
            sgAulas.Canvas.TextOut(Rect.Left+2,Rect.Top+2,sgAulas.Cells[ACol, ARow]);
         end;
      end;
      { Coluna de Seleção de ação a ser aplicada na aula }
      COLUNA_ACAO: begin
         if (gdSelected in State) then
         begin
            cbSelecionarAcaoAula.Left := Rect.Left + sgAulas.Left;
            cbSelecionarAcaoAula.Top := Rect.Top + sgAulas.Top;

            cbSelecionarAcaoAula.Width := Rect.Right - Rect.Left - 1;
            cbSelecionarAcaoAula.Height := Rect.Bottom - Rect.Top - 1;

            cbSelecionarAcaoAula.ItemIndex := StrToIntDef(TItemCombo(sgAulas.Objects[0, ARow]).getDescricao(), 0);
            cbSelecionarAcaoAula.Tag := cbSelecionarAcaoAula.ItemIndex;

            cbSelecionarAcaoAula.Visible := True;
         end else begin
            cbSelecionarAcaoAula.Visible := False;
         end;
      end;
   end;
end;

procedure TfrmReajusteAulasTurma.ZerarGrid;
var
   I, Total: Integer;
begin
   sgAulas.Cells[0, 0] := 'Num.';
{   sgAulas.Cells[1, 0] := 'Ano/Semestre';
   sgAulas.Cells[2, 0] := 'Turma';}
   sgAulas.Cells[1, 0] := 'Disciplina';
   sgAulas.Cells[2, 0] := 'Etapa';
   sgAulas.Cells[3, 0] := 'Professor';
   sgAulas.Cells[4, 0] := 'Data';
   sgAulas.Cells[5, 0] := 'Horário';
   sgAulas.Cells[COLUNA_HORARIO, 0] := 'Novo Horário';
   sgAulas.Cells[COLUNA_DATA, 0] := 'Nova Data';
   sgAulas.Cells[COLUNA_ACAO, 0] := 'Ação';

   sgAulas.ColWidths[0] := 37;
{   sgAulas.ColWidths[1] := 80;
   sgAulas.ColWidths[2] := 100;}
   sgAulas.ColWidths[1] := 100;
   sgAulas.ColWidths[2] := 37;  
   sgAulas.ColWidths[3] := 180;
   sgAulas.ColWidths[4] := 70;
   sgAulas.ColWidths[5] := 120;
   sgAulas.ColWidths[COLUNA_HORARIO] := 120;
   sgAulas.ColWidths[COLUNA_DATA] := 93;
   sgAulas.ColWidths[COLUNA_ACAO] := 100;

   Total := 0;
   for I := 0 to sgAulas.ColCount do
   begin
      Inc(Total, sgAulas.ColWidths[I]);
   end;

   Self.Width := Total + 50;
end;

{ TBitBtn }

procedure TBitBtn.CMFocusChanged(var Message: TCMFocusChanged);
begin
   inherited;

   if Assigned(OnFocus) then
      OnFocus(Self, Focused);
end;

{ TMonthCalendar }

constructor TMonthCalendar.Create(AOwner: TComponent);
begin
  inherited;
   MounthNum := 1;
end;

end.
