unit uFCorrecaoTurmasHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZAbstractRODataset, UZDataset, Grids, DBGrids,
  uListaExecucao, uHorario, UMComboBox, uAExecucao, ImgList, Buttons;

type
   TAlteracaoHorariosTurma = class(AExecucao)
      strict private
         FHorarioAtual: THorario;
         FHorarioNovo: THorario;
         FTurma: String;

      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

         procedure LogarExecucao();

      public
         constructor Create(const horarioAtual, novoHorario: THorario; const cd_turma: String);

   end;

   TExcluirHorario = class(AExecucao) 
      strict private
         FHorarioAtual: THorario;

      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

         procedure LogarExecucao();

      public
         constructor Create(const horarioAtual: THorario);

   end;

  TfrmCorrecaoTurmasHorarios = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    pnResize: TPanel;
    Button1: TBitBtn;
    Button2: TBitBtn;
    sgTurmasHorarios: TStringGrid;
    cbHorarios: TUMComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbHorariosChange(Sender: TObject);
    procedure sgTurmasHorariosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
  private
    { Private declarations }
    horario: THorario;
    procedure CarregarTurmasHorarios();
    procedure CarregarComboHorarios();

  public
    { Public declarations }
    class function corrigirTurmasHorarios(const horario: THorario): Boolean;
  end;

implementation

uses uDM, uGeneral, uItemCombo;

{$R *.dfm}

procedure TfrmCorrecaoTurmasHorarios.CarregarComboHorarios;
const
   SQL_CARREGAR_HORARIOS =
      ' SELECT ds_categoria, ds_horario, hr_inicio, hr_fim, codigo ' +
      ' FROM horarios WHERE sn_ativo = 1 AND codigo != :cd_horario ' +
      ' ORDER BY ds_categoria, ds_horario ';
var
   qyListaHorarios: TUMZReadOnlyQuery;
   LHorario : THorario;
begin
   DM.CriarConsulta(qyListaHorarios);
   qyListaHorarios.SQL.Text :=  SQL_CARREGAR_HORARIOS;
   qyListaHorarios.ParamByName('cd_horario').AsInteger := horario.Codigo;
   qyListaHorarios.Open();

   cbHorarios.Clear();

   cbHorarios.OnChange := nil;

   while not qyListaHorarios.Eof do
   begin
      LHorario := THorario.Create(
         qyListaHorarios.FieldByName('codigo').AsInteger,
         qyListaHorarios.FieldByName('ds_horario').AsString,
         qyListaHorarios.FieldByName('hr_inicio').AsString
      );
      LHorario.SetCategoria(qyListaHorarios.FieldByName('ds_categoria').AsString);
      LHorario.SetHoraFim(qyListaHorarios.FieldByName('hr_fim').AsString);

      cbHorarios.AddItem(Format(
         '%s - %s: Início: %s / Fim: %s',
         [LHorario.Categoria, LHorario.Descricao, LHorario.HoraInicio, LHorario.HoraFim]
      ), LHorario);

      qyListaHorarios.Next();
   end;

   cbHorarios.OnChange := cbHorariosChange;
end;

procedure TfrmCorrecaoTurmasHorarios.CarregarTurmasHorarios;
const
   SQL_CARREGAR_TURMAS_HORARIOS =
      ' SELECT thc.nr_dia_semana, thc.cd_turma_base, h.ds_horario ' +
      ' FROM turmas_horarios_config thc ' +
      '      INNER JOIN diario_aulas da ON ( ' +
      '         da.anosemestre = thc.nr_anosemestre AND da.turma = thc.cd_turma_base ' +
      '      ) ' +
      '      INNER JOIN horarios h ON ( h.codigo = thc.cd_horario ) ' +
      ' WHERE thc.sn_ativo = 1 AND thc.cd_horario = :cd_horario AND ' +
      '       da.`data` >= CONCAT( YEAR(NOW()), ''-01-01'' ) ' +
      ' GROUP BY thc.cd_turma_base, thc.cd_horario ';
var
   qyCarregarTurmasHorarios : TUMZReadOnlyQuery;
   I : Integer;
begin
   DM.CriarConsulta(qyCarregarTurmasHorarios);
   qyCarregarTurmasHorarios.SQL.Text := SQL_CARREGAR_TURMAS_HORARIOS;
   qyCarregarTurmasHorarios.ParamByName('cd_horario').AsInteger := horario.Codigo;
   qyCarregarTurmasHorarios.Open();

   sgTurmasHorarios.RowCount := qyCarregarTurmasHorarios.RecordCount + 1;
   sgTurmasHorarios.Tag := qyCarregarTurmasHorarios.RecordCount;

   if sgTurmasHorarios.RowCount = 1 then
   begin
      sgTurmasHorarios.RowCount := 2;
      sgTurmasHorarios.FixedRows := 1;
   end;

   while not qyCarregarTurmasHorarios.Eof do
   begin
      I := qyCarregarTurmasHorarios.RecNo;
      sgTurmasHorarios.Cells[0,I] := qyCarregarTurmasHorarios.FieldByName('cd_turma_base').AsString;
      sgTurmasHorarios.Cells[1,I] := TGeneral.GetDescricaoDiaSemana(
         qyCarregarTurmasHorarios.FieldByName('nr_dia_semana').AsInteger
      );
      sgTurmasHorarios.Cells[2,I] := qyCarregarTurmasHorarios.FieldByName('ds_horario').AsString;

      sgTurmasHorarios.Cells[3,I] := '';
      sgTurmasHorarios.Objects[3, I] := TItemCombo.Create('-1', '');

      qyCarregarTurmasHorarios.Next();
   end;

   FreeAndNil(qyCarregarTurmasHorarios);
end;

procedure TfrmCorrecaoTurmasHorarios.cbHorariosChange(Sender: TObject);
begin
   TItemCombo(sgTurmasHorarios.Objects[3, sgTurmasHorarios.Row]).setCodigo(IntToStr(cbHorarios.ItemIndex));
   sgTurmasHorarios.Cells[3, sgTurmasHorarios.Row] := cbHorarios.Items[cbHorarios.ItemIndex];
end;

class function TfrmCorrecaoTurmasHorarios.corrigirTurmasHorarios(
  const horario: THorario): Boolean;
var
   frmCorrecaoTurmasHorarios: TfrmCorrecaoTurmasHorarios;
   I : Integer;
   ListaExecucao : TListaExecucao;
begin
   frmCorrecaoTurmasHorarios := TfrmCorrecaoTurmasHorarios.Create(nil);
   frmCorrecaoTurmasHorarios.horario := horario;

   ListaExecucao := nil;
   Result := False;

   if frmCorrecaoTurmasHorarios.ShowModal() = mrYes then
   begin
      ListaExecucao := TListaExecucao.Create;

      for I := 1 to frmCorrecaoTurmasHorarios.sgTurmasHorarios.RowCount - 1 do
      begin
         ListaExecucao.Add(TAlteracaoHorariosTurma.Create(
            horario,
            THorario(frmCorrecaoTurmasHorarios.cbHorarios.Items.Objects[StrToInt(TItemCombo(frmCorrecaoTurmasHorarios.sgTurmasHorarios.Objects[3,I]).getCodigo())]),
            frmCorrecaoTurmasHorarios.sgTurmasHorarios.Cells[0,I]
         ));
      end;

      ListaExecucao.Add(TExcluirHorario.Create(horario));

      Result := ListaExecucao.ExecuteAll();
   end;
end;

procedure TfrmCorrecaoTurmasHorarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   I : Integer;
begin
   if Self.ModalResult = mrYes then
   begin
      for I := 1 to sgTurmasHorarios.RowCount - 1 do
      begin
         if TItemCombo(sgTurmasHorarios.Objects[3, I]).getCodigo() = '-1' then
         begin
            TGeneral.Mensagem('É necessário selecionar uma aula em cada registro da tabela.', '', MB_OK + MB_ICONINFORMATION, Handle);
            sgTurmasHorarios.Row := I;
            cbHorarios.SetFocus;
            CanClose := False;
            Break;
         end;
      end;
   end;
end;

procedure TfrmCorrecaoTurmasHorarios.FormShow(Sender: TObject);
begin
   sgTurmasHorarios.ColWidths[3] := 300;
   sgTurmasHorarios.Cells[0, 0] := 'Turma';
   sgTurmasHorarios.Cells[1, 0] := 'Dia da Semana';
   sgTurmasHorarios.Cells[2, 0] := 'Horário Atual';
   sgTurmasHorarios.Cells[3, 0] := 'Novo Horário';

                       
   CarregarComboHorarios();
   CarregarTurmasHorarios();
end;

procedure TfrmCorrecaoTurmasHorarios.Panel1Resize(Sender: TObject);
begin
   pnResize.Left := Trunc(Panel1.Width / 2) - Trunc(pnResize.Width/2);
end;

procedure TfrmCorrecaoTurmasHorarios.sgTurmasHorariosDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
   if sgTurmasHorarios.Tag = 0 then
      Exit;

   case ACol of
      3: begin
         if (gdSelected in State) then
         begin
            cbHorarios.Left := Rect.Left + sgTurmasHorarios.Left;
            cbHorarios.Top := Rect.Top + sgTurmasHorarios.Top;

            cbHorarios.Width := Rect.Right - Rect.Left - 1;
            cbHorarios.Height := Rect.Bottom - Rect.Top - 1;

            cbHorarios.ItemIndex := StrToIntDef(TItemCombo(sgTurmasHorarios.Objects[3, ARow]).getCodigo(), -1);

            cbHorarios.Visible := True;
         end else begin
            cbHorarios.Visible := False;
         end;
      end;
   end;
end;

{ TAlteracaoHorariosTurma }

constructor TAlteracaoHorariosTurma.Create(const horarioAtual, novoHorario: THorario; const cd_turma: String);
begin
   Self.FOnAfterSQLExecute := LogarExecucao;
   Self.FHorarioAtual := horarioAtual;
   Self.FHorarioNovo := novoHorario;
   Self.FTurma := cd_turma;
end;

function TAlteracaoHorariosTurma.GetSQL: String;
begin
   Result := ' UPDATE turmas_horarios_config thc ' +
             '        INNER JOIN diario_aulas da ON ( ' +
             '           da.anosemestre = thc.nr_anosemestre AND ' +
             '           da.turma = thc.cd_turma_base ' +
             '        ) ' +
             ' SET thc.cd_horario = :cd_horario_novo ' +
             ' WHERE thc.sn_ativo = 1 AND thc.cd_horario = :cd_horario_antigo AND ' +
             '       da.`data` >= CONCAT( YEAR(NOW()), ''-01-01'' ) AND ' +
             '       thc.cd_turma = :cd_turma ';
end;

procedure TAlteracaoHorariosTurma.LogarExecucao;
begin
   DM.setLog(
      1025, 'Alteração', IntToStr(FHorarioAtual.Codigo) + ';' + FTurma, 0,
      Format(
         'Alteração do horário da turma "%s" de %d para %d',
         [FTurma, FHorarioAtual.Codigo, FHorarioNovo.Codigo]
      ));
end;

procedure TAlteracaoHorariosTurma.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('cd_horario_novo').AsInteger := FHorarioNovo.Codigo;
   Parametros.ParamByName('cd_horario_antigo').AsInteger := FHorarioAtual.Codigo;
   Parametros.ParamByName('cd_turma').AsString := FTurma;
end;

{ TExcluirHorario }

constructor TExcluirHorario.Create(const horarioAtual: THorario);
begin
   Self.FOnAfterSQLExecute := LogarExecucao;
   Self.FHorarioAtual := horarioAtual;
end;

function TExcluirHorario.GetSQL: String;
begin
   Result := 'UPDATE horarios SET sn_ativo = 0, dt_exclusao = NOW() WHERE codigo = :cd_horario';
end;

procedure TExcluirHorario.LogarExecucao;
begin
   DM.setLog(
      1025, 'Exclusão', IntToStr(FHorarioAtual.Codigo), 0,
      Format(
         'Exclusão do horário %d',
         [FHorarioAtual.Codigo]
      ));
end;

procedure TExcluirHorario.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('cd_horario').AsInteger := FHorarioAtual.Codigo;
end;

end.
