unit uRemoveDiscMassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, Buttons, DBCtrls, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, Grids, DBGrids,
  ImgList, uDM, uFSelecionarTurma, uUsuario, General;

type
  TfrmRemoveDiscMassa = class(TForm)
    pnTitulo: TPanel;
    Panel1: TPanel;
    lbDisciplina: TLabel;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbgAlunos: TDBGrid;
    qyAlunos: TUMZQuery;
    dsAlunos: TDataSource;
    dsDisciplinas: TDataSource;
    qyDisciplinas: TUMZQuery;
    qyDisciplinasdisciplina: TStringField;
    qyDisciplinascd_disciplina: TIntegerField;
    qyDisciplinascd_turma: TStringField;
    qyDisciplinasnr_anosemestre: TSmallintField;
    qyAlunosnm_pessoa: TStringField;
    qyAlunoscd_pessoa: TIntegerField;
    cbDisciplinas: TComboBox;
    bbMarcarTodos: TBitBtn;
    bbDesmarcarTodos: TBitBtn;
    qyDisciplinascd_curso: TStringField;
    qyDisciplinascd_grade: TLargeintField;
    ilDisciplinas: TImageList;
    lbTurma: TLabel;
    sbTurma: TSpeedButton;
    edTurma: TEdit;
    qyAlunossn_permite_selecionar: TBooleanField;
    qyAlunosselecao: TLargeintField;
    qyAlunossn_aluno_fies: TBooleanField;
    qyAlunossn_final: TIntegerField;
    procedure qyAlunosCalcFields(DataSet: TDataSet);
    procedure sbTurmaClick(Sender: TObject);
    procedure bbDesmarcarTodosClick(Sender: TObject);
    procedure bbMarcarTodosClick(Sender: TObject);
    procedure dbgAlunosCellClick(Column: TColumn);
    procedure dbgAlunosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbDisciplinasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    slAlunos: TStringList;
    function getIndiceImagem(nro: Integer): Integer;
    procedure FiltrarDisciplinas;
    procedure FiltrarAlunos;
  public
    { Public declarations }
    iAnoSemestre : Integer;
    procedure setTurma(sTurma: String);
    function getAlunosSelecionados: TStringList;
    function getTurmaSelecionada: String;    
    function getDisciplinaSelecionada: Integer;
    function getDescDisciplinaSelecionada: String;
    function getCurso: String;
  end;

var
  frmRemoveDiscMassa: TfrmRemoveDiscMassa;

implementation

{$R *.dfm}

procedure TfrmRemoveDiscMassa.bbDesmarcarTodosClick(Sender: TObject);
var
   lugar: Pointer;
begin
   lugar := qyAlunos.GetBookmark;

   qyAlunos.First();
   While not qyAlunos.Eof do
   begin
      slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '0';
      qyAlunos.Next;
   end;
   dbgAlunos.Repaint();
   qyAlunos.GotoBookmark(lugar);
end;

procedure TfrmRemoveDiscMassa.bbMarcarTodosClick(Sender: TObject);
var
   lugar: Pointer;
begin
   lugar := qyAlunos.GetBookmark;

   qyAlunos.First();
   While not qyAlunos.Eof do
   begin
      if qyAlunossn_permite_selecionar.AsBoolean and
         not qyAlunossn_aluno_fies.AsBoolean then
      begin
         slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '1';
      end;
      
      qyAlunos.Next;
   end;
   dbgAlunos.Repaint();
   qyAlunos.GotoBookmark(lugar);
end;

procedure TfrmRemoveDiscMassa.cbDisciplinasChange(Sender: TObject);
begin
   FiltrarAlunos;
end;

procedure TfrmRemoveDiscMassa.FormShow(Sender: TObject);
begin
   cbDisciplinas.Perform(CB_SETDROPPEDWIDTH, 400, 0);

   slAlunos := TStringList.Create;

   FiltrarDisciplinas;

   FiltrarAlunos;
end;

procedure TfrmRemoveDiscMassa.FiltrarDisciplinas;
begin
   qyDisciplinas.Close;
   qyDisciplinas.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
   qyDisciplinas.ParamByName('cd_turma').AsString := edTurma.Text;
   qyDisciplinas.Open;

   // preenche a combo box de disciplinas
   cbDisciplinas.Clear;
   while not qyDisciplinas.Eof do
   begin
      cbDisciplinas.AddItem(qyDisciplinas.FieldByName('ds_disciplina').AsString, qyDisciplinas.GetBookmark);
      qyDisciplinas.Next;
   end;
   cbDisciplinas.ItemIndex := 0;
end;

procedure TfrmRemoveDiscMassa.dbgAlunosCellClick(Column: TColumn);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente marcar esse aluno?';
var
   PG: TPoint;
   GC: TGridCoord;
begin
   PG := dbgAlunos.ScreenToClient(Mouse.CursorPos);
   GC := dbgAlunos.MouseCoord( PG.X, PG.Y ) ;

   if (GC.X = 1) and qyAlunossn_permite_selecionar.AsBoolean then
   begin
      if slAlunos.Values [ qyAlunoscd_pessoa.AsString ] = '1' then begin
         slAlunos.Values [ qyAlunoscd_pessoa.AsString ] := '0';
      end
      else begin
         if (qyAlunossn_aluno_fies.AsBoolean) and
            (MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo) then
         begin
            Exit;
         end;
         if ( qyAlunossn_final.AsInteger = 1 ) AND
           (NOT DM.UsuarioLogado.TemPermissao(1033, npEspecial, True))
         then
         begin
            Exit;
         end;

         slAlunos.Values [ qyAlunoscd_pessoa.AsString ] := '1';
      end;
      dbgAlunos.Repaint();
   end;
end;

procedure TfrmRemoveDiscMassa.dbgAlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   oBitmap: TBitmap;
   DrawRect: TRect;
   bmpX, bmpY: Integer;
   fixRect : TRect;
begin
   fixRect := Rect;
   if (Column.FieldName = 'selecao') and not qyAlunossn_permite_selecionar.AsBoolean then
   begin
      oBitmap := TBitmap.Create;
      try
         bmpX := (Rect.Left + (((Rect.Right - Rect.Left) - oBitmap.Width) div 2));
         bmpY := (Rect.Top + (((Rect.Bottom - Rect.Top) - oBitmap.Height) div 2));
         dbgAlunos.Canvas.Brush.Color := clWhite;
         dbgAlunos.Canvas.Pen.Style := psClear;
         fixRect.Right := fixRect.Right + 1;
         fixRect.Bottom := fixRect.Bottom + 1;
         dbgAlunos.Canvas.Rectangle(fixRect);
         dbgAlunos.Canvas.Draw(bmpX, bmpY, oBitmap);
      finally
         oBitmap.Free;
      end;
      fixRect := Rect;
   end else if (Column.FieldName = 'selecao') and qyAlunossn_permite_selecionar.AsBoolean then
   begin
      dbgAlunos.Canvas.FillRect(Rect);
      if (gdFocused in State) then begin
         DrawRect.Left := Rect.Left + 1;
      end
      else begin
         DrawRect.Left := Rect.Left + 2;
      end;

      DrawRect.Right := Rect.Right - 2;
      DrawRect.Top := Rect.Top + 2;
      DrawRect.Bottom := Rect.Bottom - 2;
      DrawFrameControl(dbgAlunos.Canvas.Handle,
         DrawRect,
         DFC_BUTTON,
         ISChecked[ slAlunos.Values[ qyAlunoscd_pessoa.AsString ] = '1' ]
      );
   end;
end;

procedure TfrmRemoveDiscMassa.FiltrarAlunos;
begin
   // Caso exista disciplinas
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   qyAlunos.Close;
   qyAlunos.ParamByName('cd_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
   qyAlunos.ParamByName('cd_turma').AsString := edTurma.Text;
   qyAlunos.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
   qyAlunos.Open;

   qyAlunos.First;
   while not qyAlunos.Eof do
   begin
      slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '0';
      qyAlunos.Next;
   end;

end;

function TfrmRemoveDiscMassa.getAlunosSelecionados() : TStringList;
var
   slAlunosSelecionados : TStringList;
begin
   // Prepara o TStringList de retorno
   slAlunosSelecionados := TStringList.Create;

   // Varre a lista de alunos
   qyAlunos.First;
   while not qyAlunos.Eof do
   begin
      // Adiciona o aluno selecionado a lista de retorno
      if slAlunos.Values[ qyAlunoscd_pessoa.AsString ] = '1' then
      begin
         slAlunosSelecionados.Add(qyAlunoscd_pessoa.AsString);
      end;
      qyAlunos.Next;
   end;

   Result := slAlunosSelecionados;
end;

function TfrmRemoveDiscMassa.getTurmaSelecionada() : String;
begin
   Result := edTurma.Text;
end;

procedure TfrmRemoveDiscMassa.qyAlunosCalcFields(DataSet: TDataSet);
begin
   // Define inicialmente como usuário podendo selecionar aluno
   qyAlunossn_permite_selecionar.AsBoolean := True;

   // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
   // cadastrados no programa bolsa FIES está habilitada.
   // Se estiver habilitado, verifica se o usuário possui permissão para
   // alterar os créditos mesmo com o bloqueio habilitado.
   qyAlunossn_aluno_fies.AsBoolean := False;
   
   if DM.IsAlunoFIES(qyAlunos.FieldByName('cd_pessoa').AsInteger) and
      (DM.variavel_parametro('BLOQUEAR.AJUSTE.CREDITO.FIES') = 'S') then
   begin
      qyAlunossn_aluno_fies.AsBoolean := True;
      if not DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
      begin
         qyAlunossn_permite_selecionar.AsBoolean := False;
      end;
   end;
end;

function TfrmRemoveDiscMassa.getDisciplinaSelecionada() : Integer;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
end;

function TfrmRemoveDiscMassa.getDescDisciplinaSelecionada() : String;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('ds_disciplina').AsString;
end;

function TfrmRemoveDiscMassa.getCurso() : String;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('cd_curso').AsString;
end;

Function TfrmRemoveDiscMassa.getIndiceImagem(nro: Integer): Integer;
begin
    if (nro and 32) = 32 then
      Result := 9
   else if (nro and 1) = 1 then
      Result := 4
   else if (nro and 2) = 2 then
      Result := 5
   else if (nro and 8) = 8 then
      Result := 6
   else if (nro and 4) = 4 then
      Result := 7
   else if (nro and 64) = 64 then
      Result := 7
   else if (nro and 16) = 16 then
      Result := 8
   else
      Result := 3;
end;

procedure TfrmRemoveDiscMassa.sbTurmaClick(Sender: TObject);
var
   filtro_resultado : TResultadoFiltroTurma;
begin
   filtro_resultado := TfrmSelecionarTurma.Filtrar([bftAnosemestre], iAnoSemestre);

   if filtro_resultado.filtrado then
   begin
      if filtro_resultado.nr_anosemestre <> iAnoSemestre then
      begin
         Mensagem( 'O ano/semestre deve ser o mesmo da turma matrícula selecionada na planilha de matrículas.' , 'Atenção', MB_OK + MB_ICONWARNING );
         Exit;
      end;

      if filtro_resultado.nr_serie = -100 then
      begin
         Mensagem( 'Não é permitido o cadastro de uma disciplina optativa para vários alunos.'+#13+'Essa ação deve ser realizada por aluno.' , 'Atenção', MB_OK + MB_ICONWARNING );
         Exit;
      end;

      edTurma.Text := filtro_resultado.cd_turma;
      
      FiltrarDisciplinas;
      FiltrarAlunos;
  end;
end;

procedure TfrmRemoveDiscMassa.setTurma(sTurma: String);
begin
   edTurma.Text := sTurma;
end;

end.