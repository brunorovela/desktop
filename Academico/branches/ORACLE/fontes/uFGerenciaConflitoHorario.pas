unit uFGerenciaConflitoHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, uDM, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uUCadastroHorariosTurma, Contnrs,
  UMDateTimePicker, General, uListaExecucao;

type
  TformGerenciaConflitoHorario = class(TForm)
    Panel3: TPanel;
    pnBotoes: TPanel;
    Button1: TBitBtn;
    Button2: TBitBtn;
    Panel1: TPanel;
    qryHorariosNovos: TUMZQuery;
    qryHorariosConflito: TUMZQuery;
    dsHorariosConflito: TDataSource;
    Label1: TLabel;
    qryHorariosConflitods_dia_semana: TStringField;
    qryHorariosConflitods_disciplina: TStringField;
    qryHorariosConflitods_horario: TStringField;
    qryHorariosConflitodt_inicial: TStringField;
    qryHorariosConflitodt_final: TStringField;
    qryHorariosConflitocd_horario: TIntegerField;
    qryHorariosConflitonr_dia_semana: TIntegerField;
    sgdHorariosNovos: TStringGrid;
    qryHorariosConflitocd_turmas_horarios: TIntegerField;
    qryUpdateConflitoInicio: TUMZQuery;
    qryUpdateConflitoFim: TUMZQuery;
    dbHorariosConflito: TDBGrid;
    maskDataInicio: TUMDateTimePicker;
    maskDataFim: TUMDateTimePicker;
    Label2: TLabel;
    qryHorariosConflitocd_disciplina: TIntegerField;
    qryHorariosConflitodt_inicial_original: TDateField;
    qryHorariosConflitodt_final_original: TDateField;
    procedure maskDataFimChangeDate(Sender: TObject);
    procedure maskDataInicioChangeDate(Sender: TObject);
    procedure dbHorariosConflitoCellClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure sgdHorariosNovosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dbHorariosConflitoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sgdHorariosNovosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
  private
    horariosConflitam: TStringList;
    ASelList: TStringList;
    rowAtual: Integer;
    HorariosTurma : THorariosTurmaGrid;
    dataInicioNovoHorario : TDate;
    ListaExecucao: TListaExecucao;
    nr_anosemestre: Integer;
    cd_turma_base: String;
    ListaHorariosDasDisciplinas: TStringList;
    listaHorariosNaoExcluidos:TStringList;
    mostrarConflitoAula: Boolean;
    sqlRestauraDatasOriginais: TStringList;
    procedure carregaHorariosConflitantes();
    procedure carregaHorariosNovos();
    procedure salvaDatasOriginais();
    function carregaHorariosBase(cd_horario: Integer): String;
    procedure ligaCombos();
    function verificaAulasVinculadas(cd_turma_horario: Integer): Boolean;
    procedure carregaCampoDataInicial();
    procedure carregaCampoDataFinal();

    { Private declarations }
  public
    procedure setHorariosConflitam(horario : TStringList);
    procedure setHorariosTurma(horarios : THorariosTurmaGrid);
    procedure setDataInicioNovoHorario(dataNovoHorario: TDate);
    function getHorariosConflitam : TStringList;
    procedure setDadosReajusteAulas(var listaExecucao: TListaExecucao;anosemestre: Integer;cd_turma: String;ListaHorariosDisciplinas: TStringList);
    function getListaHorariosNaoExcluidos():TStringList;
    function getMostrarConflitoAula():Boolean;
    function getSqlRestauraDatasOriginais(): TStringList;

    { Public declarations }
  end;

var
  formGerenciaConflitoHorario: TformGerenciaConflitoHorario;

implementation

uses uDisciplina, uFReajusteAulasHorarios;

{$R *.dfm}

{ TformGerenciaConflitoHorario }
procedure TformGerenciaConflitoHorario.Button1Click(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TformGerenciaConflitoHorario.Button2Click(Sender: TObject);
var
   i: integer;
   mostrarTelaAulas : Boolean;
   dataInicioAulas: TDateTime;
   condicaoExtra: String;
begin
   qryHorariosConflito.First;
   mostrarTelaAulas := false;
   dataInicioAulas := Dm.DataAtual;
   condicaoExtra := '';

   //Percorre a primeira vez pra ver se tem de abrir a tela de ajuste
   //Temos de fazer assim para adicionar o SQL na ordem correta para o comit...
   while not qryHorariosConflito.Eof do
   begin
      if (ASelList.Values[qryHorariosConflitocd_turmas_horarios.AsString] = '1') then
      begin

         //Se tem aula vinculada mostra a tela de ajuste de aulas
         if(verificaAulasVinculadas(qryHorariosConflitocd_turmas_horarios.AsInteger)) then
         begin
            if(qryHorariosConflitodt_inicial.AsString <> 'Primeiro horário da turma') then
            begin
               if(qryHorariosConflitodt_inicial.AsDateTime < dataInicioAulas) then
               begin
                  dataInicioAulas := qryHorariosConflitodt_inicial.AsDateTime;
               end;
            end;
            mostrarTelaAulas := true;

            //Condição extra no sql que mostra as aulas para mostrar as em conflito
            condicaoExtra := condicaoExtra + Format('OR ( thc.cd_disciplina = %d AND DAYOFWEEK(da.`data`) = %d )', [qryHorariosConflitocd_disciplina.AsInteger, qryHorariosConflitonr_dia_semana.AsInteger] );
         end;
      end;
      qryHorariosConflito.Next;
   end;



   if(mostrarTelaAulas) then
   begin
      Mensagem('Existem aulas vinculadas ao horário que será excluido, favor realizar o ajuste nas mesmas.', 'Verificação de Aulas', MB_OK + MB_ICONWARNING, Handle);
      TfrmReajusteAulasTurma.ajustarAulasHoras(self.ListaExecucao, self.ListaHorariosDasDisciplinas, self.nr_anosemestre,self.cd_turma_base, dataInicioAulas, condicaoExtra, false);
      self.mostrarConflitoAula := false;
   end;


   qryHorariosConflito.First;
   while not qryHorariosConflito.Eof do
   begin
      if (ASelList.Values[qryHorariosConflitocd_turmas_horarios.AsString] = '1') then
      begin
         ListaExecucao.Add(TExecucaoHorarioAula.Create(qryHorariosConflitocd_turmas_horarios.AsInteger));
      end else begin
         //Popula uma lista de horarios não excluidos para verificar o conflito novamente
         listaHorariosNaoExcluidos.Values[qryHorariosConflitocd_turmas_horarios.AsString] := '1';
      end;
      qryHorariosConflito.Next;
   end;

   ModalResult := mrOk;
   CloseModal;
end;

procedure TformGerenciaConflitoHorario.carregaCampoDataFinal;
var
   posicaoTop:integer;
begin
   //Posicao do campo,padrão da grid + 18 cada linha
   posicaoTop := 233;
   posicaoTop := posicaoTop + (18 * qryHorariosConflito.RecNo);

   maskDataFim.Visible := true;
   maskDataFim.Top := posicaoTop;
   maskDataFim.Date := dm.DataAtual;

   if (qryHorariosConflitodt_final.AsString <> 'Horário atual da turma') then
   begin
      maskDataFim.Date := qryHorariosConflitodt_final.AsDateTime;
   end;
end;

procedure TformGerenciaConflitoHorario.carregaCampoDataInicial;
var
   posicaoTop:integer;
begin
   //Posicao do campo,padrão da grid + 18 cada linha
   posicaoTop := 233;
   posicaoTop := posicaoTop + (18 * qryHorariosConflito.RecNo);

   maskDataInicio.Visible := true;
   maskDataInicio.Top := posicaoTop;
   maskDataInicio.Date := dm.DataAtual;

   if (qryHorariosConflitodt_inicial.AsString <> 'Primeiro horário da turma') then
   begin
      maskDataInicio.Date := qryHorariosConflitodt_inicial.AsDateTime;
   end;
end;

function TformGerenciaConflitoHorario.carregaHorariosBase(cd_horario: Integer): String;
const
   SQL_HORARIOS = 'SELECT ds_horario FROM horarios WHERE codigo = :cd_horario';
var
   qryHorarios : TUMZQuery;
   descricaoHorario : String;
begin
   Dm.CriarConsulta(qryHorarios);
   qryHorarios.SQL.Add(SQL_HORARIOS);
   qryHorarios.ParamByName('cd_horario').AsInteger := cd_horario;
   qryHorarios.Open;

   descricaoHorario := qryHorarios.FieldByName('ds_horario').AsString;

   FreeAndNil(qryHorarios);

   result := descricaoHorario;
end;

procedure TformGerenciaConflitoHorario.carregaHorariosConflitantes();
var
   strHorariosChave : String;
   modificador : String;
   i: integer;
begin
   qryHorariosConflito.Close;

   modificador := '';
   strHorariosChave := '';
   
   for I := 0 to getHorariosConflitam().Count - 1 do
   begin
      strHorariosChave := strHorariosChave + modificador + getHorariosConflitam.Strings[I];
      modificador := ',';
   end;

   qryHorariosConflito.SQL.Text := StringReplace(qryHorariosConflito.SQL.Text,':horarios',strHorariosChave,[rfReplaceAll]);

   qryHorariosConflito.Open;

   while Not qryHorariosConflito.Eof do
   begin
      ASelList.Values[ qryHorariosConflitocd_turmas_horarios.AsString ] := '0';
      qryHorariosConflito.Next();
   end;

   qryHorariosConflito.First;
end;

procedure TformGerenciaConflitoHorario.carregaHorariosNovos;
var
   i, posicao : integer;
   diaSemana, dsHorario :String;
   horariosNovos : TStringList;
   horarioAtual : TStringList;
begin

   sgdHorariosNovos.Cells[1, 0] := 'Disciplina';
   sgdHorariosNovos.Cells[2, 0] := 'Dia Semana';
   sgdHorariosNovos.Cells[3, 0] := 'Horário';
   sgdHorariosNovos.Cells[4, 0] := 'Data Inicio';

   sgdHorariosNovos.ColWidths[0] := 12;
   sgdHorariosNovos.ColWidths[1] := 230;
   sgdHorariosNovos.ColWidths[2] := 70;
   sgdHorariosNovos.ColWidths[3] := 150;
   sgdHorariosNovos.ColWidths[4] := 70;

   //Esconde essas ultimas colunas, usadas para fazer o locate (amarelo) entre os horarios
   sgdHorariosNovos.ColWidths[5] := -1;
   sgdHorariosNovos.ColWidths[6] := -1;

   horariosNovos := HorariosTurma.GetListaDisciplinasHorarios();

   posicao := 0;
   for I := 0 to horariosNovos.Count - 1 do
   begin
      dsHorario := '';
      horarioAtual := explode(horariosNovos.Strings[i],'|');

      //Se não existir um correspondente na tabela de conflitos não adiciona agrid
      if (qryHorariosConflito.Locate( 'cd_horario;nr_dia_semana',VarArrayOf( [ horarioAtual.Strings[0],horarioAtual.Strings[1]] ),[loCaseInsensitive]) = false) then
      begin
         continue;
      end;

      if(sgdHorariosNovos.RowCount = (posicao+1)) then
      begin
         sgdHorariosNovos.RowCount := sgdHorariosNovos.RowCount + 1;
      end;

      case strtoint(horarioAtual.Strings[1]) of
         1: diaSemana := 'Domingo';
         2: diaSemana := 'Segunda';
         3: diaSemana := 'Terça';
         4: diaSemana := 'Quarta';
         5: diaSemana := 'Quinta';
         6: diaSemana := 'Sexta';
         7: diaSemana := 'Sábado';
      end;

      dsHorario := horarioAtual.Strings[0] + ' - ' +  carregaHorariosBase(strtoint(horarioAtual.Strings[0]));
      //montagem do campo "horario" conforme sql
      sgdHorariosNovos.Cells[1, posicao+1] := horarioAtual.Strings[2];
      sgdHorariosNovos.Cells[2, posicao+1] := diaSemana;
      sgdHorariosNovos.Cells[3, posicao+1] := dsHorario;
      sgdHorariosNovos.Cells[4, posicao+1] := DateToStr(self.dataInicioNovoHorario);
      sgdHorariosNovos.Cells[5, posicao+1] := horarioAtual.Strings[0];
      sgdHorariosNovos.Cells[6, posicao+1] := horarioAtual.Strings[1];
      
      inc(posicao);
   end;

   qryHorariosConflito.First;
end;

procedure TformGerenciaConflitoHorario.dbHorariosConflitoCellClick(
  Column: TColumn);
var
   PG: TPoint;
   GC: TGridCoord;
   indiceHorario : String;
   valorCheck : String;
   posicaoTop : Integer;
begin
   PG := dbHorariosConflito.ScreenToClient(Mouse.CursorPos);
   GC := dbHorariosConflito.MouseCoord( PG.X, PG.Y ) ;

   //6 coluna - Check de exclusão
   if GC.X = 6 then begin
      indiceHorario := qryHorariosConflitocd_turmas_horarios.AsString;

      valorCheck := '1';
      if ASelList.Values [ indiceHorario ] = '1' then begin
         valorCheck := '0';
      end;

      ASelList.Values [ indiceHorario ] := valorCheck;
      dbHorariosConflito.Repaint();
   end;


   //Posiciona campo de data de inicio para o usuário poder editar
   if GC.X = 4 then begin
      carregaCampoDataInicial();
   end;

   if GC.X = 5 then begin
      carregaCampoDataFinal();
   end;
end;

procedure TformGerenciaConflitoHorario.dbHorariosConflitoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);  
var
  DrawRect: TRect;
  cor: Integer;
begin
   if(rowAtual <> 0) then
   begin
      if(StrToInt(sgdHorariosNovos.Cells[5,rowAtual]) = qryHorariosConflitocd_horario.Value) AND
        (StrToInt(sgdHorariosNovos.Cells[6,rowAtual]) = qryHorariosConflitonr_dia_semana.Value) then
      begin
         dbHorariosConflito.Canvas.Font.Color := clBlack;
         dbHorariosConflito.Canvas.Brush.Color := clYellow;
         dbHorariosConflito.Canvas.FillRect(Rect);
         dbHorariosConflito.DefaultDrawDataCell(Rect, dbHorariosConflito.columns[datacol].field, State);
      end;
   end;

   if (Column.FieldName = 'SELECAO') then
   begin
      dbHorariosConflito.Canvas.FillRect(Rect);
      
      if (gdFocused in State) then
      begin
         DrawRect.Left := Rect.Left + 1;
      end
      else
      begin
         DrawRect.Left := Rect.Left + 2;
      end;

      DrawRect.Right := Rect.Right - 2;
      DrawRect.Top := Rect.Top + 2;
      DrawRect.Bottom := Rect.Bottom - 2;

      DrawFrameControl(
         dbHorariosConflito.Canvas.Handle,
         DrawRect,
         DFC_BUTTON,
         ISChecked[ASelList.Values[ qryHorariosConflitocd_turmas_horarios.AsString ] = '1' ]
      );
   end;
end;

procedure TformGerenciaConflitoHorario.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ASelList);
end;

procedure TformGerenciaConflitoHorario.FormShow(Sender: TObject);
begin
   rowAtual := 0;
   self.mostrarConflitoAula := true;

   ASelList := TStringList.Create();
   listaHorariosNaoExcluidos := TStringList.Create;

   carregaHorariosConflitantes();
   carregaHorariosNovos();
   ligaCombos();
   salvaDatasOriginais();
end;

function TformGerenciaConflitoHorario.getHorariosConflitam: TStringList;
begin
   result := self.horariosConflitam;
end;

function TformGerenciaConflitoHorario.getListaHorariosNaoExcluidos: TStringList;
begin
   result := self.listaHorariosNaoExcluidos;
end;

function TformGerenciaConflitoHorario.getMostrarConflitoAula: Boolean;
begin
   result := self.mostrarConflitoAula;
end;

function TformGerenciaConflitoHorario.getSqlRestauraDatasOriginais: TStringList;
begin
   result := Self.sqlRestauraDatasOriginais;
end;

procedure TformGerenciaConflitoHorario.ligaCombos;
begin
   qryHorariosConflito.Locate( 'cd_horario;nr_dia_semana',
      VarArrayOf( [sgdHorariosNovos.Cells[5,rowAtual],sgdHorariosNovos.Cells[6,rowAtual]] ),
      [loCaseInsensitive]
   );
end;

procedure TformGerenciaConflitoHorario.maskDataFimChangeDate(Sender: TObject);
var
   turmaHorarioAtual: String;
begin
   turmaHorarioAtual :=  qryHorariosConflitocd_turmas_horarios.AsString;

   if((qryHorariosConflitodt_inicial.AsString <> 'Primeiro horário da turma') AND
      (maskDataFim.getDate < StrToDate(DateTimeToStr(qryHorariosConflitodt_inicial.AsDateTime)))) then
   begin
      Mensagem('O horário de inicio não pode ser maior que o horário final.', 'Verificação de Horário', MB_OK + MB_ICONWARNING, Handle);

      maskDataFim.Date := dm.DataAtual;
      if (qryHorariosConflitodt_final.AsString <> 'Horário atual da turma') then
      begin
         maskDataFim.Date := qryHorariosConflitodt_final.AsDateTime;
      end;

      exit;
   end;

   qryUpdateConflitoFim.Close;
   qryUpdateConflitoFim.ParamByName('dt_fim').AsDate := maskDataFim.getDate;
   qryUpdateConflitoFim.ParamByName('turmahorario').AsString := turmaHorarioAtual;
   qryUpdateConflitoFim.ExecSQL;

   qryHorariosConflito.Refresh;
   qryHorariosConflito.Locate('cd_turmas_horarios', turmaHorarioAtual, [loCaseInsensitive]);

   carregaCampoDataFinal();
end;

procedure TformGerenciaConflitoHorario.maskDataInicioChangeDate(
  Sender: TObject);
var
   turmaHorarioAtual: String;
begin
   turmaHorarioAtual :=  qryHorariosConflitocd_turmas_horarios.AsString;

   if((qryHorariosConflitodt_final.AsString <> 'Horário atual da turma') AND
      (maskDataInicio.getDate > StrToDate(DateTimeToStr(qryHorariosConflitodt_final.AsDateTime)))) then
   begin
      Mensagem('O horário de inicio não pode ser maior que o horário final.', 'Verificação de Horário', MB_OK + MB_ICONWARNING, Handle);

      maskDataInicio.Date := dm.DataAtual;
      if (qryHorariosConflitodt_inicial.AsString <> 'Primeiro horário da turma') then
      begin
         maskDataInicio.Date := qryHorariosConflitodt_inicial.AsDateTime;
      end;

      exit;
   end;
 
   qryUpdateConflitoInicio.Close;
   qryUpdateConflitoInicio.ParamByName('dt_inicio').AsDate := maskDataInicio.getDate;
   qryUpdateConflitoInicio.ParamByName('turmahorario').AsString := turmaHorarioAtual;
   qryUpdateConflitoInicio.ExecSQL;

   qryHorariosConflito.Refresh;
   qryHorariosConflito.Locate('cd_turmas_horarios', turmaHorarioAtual, [loCaseInsensitive]);

   carregaCampoDataInicial();
end;

procedure TformGerenciaConflitoHorario.salvaDatasOriginais;
const
   SQL_DATA =
   'UPDATE turmas_horarios_config SET dt_inicial = :dt_inicio, dt_final = :dt_fim WHERE cd_turmas_horarios = :turmahorario;';
var
   sqlAtual : String;
   sqlFinal : TStringList;
begin
   sqlFinal := TStringList.Create;
   while Not qryHorariosConflito.Eof do
   begin
      sqlAtual := SQL_DATA;
      
      if(qryHorariosConflitodt_inicial_original.AsString <> '') then
      begin
         sqlAtual := StringReplace(sqlAtual,':dt_inicio','''' + FormatDateTime('yyyy-mm-dd', qryHorariosConflitodt_inicial_original.AsDateTime) + '''',[rfReplaceAll]);
      end else begin
         sqlAtual := StringReplace(sqlAtual,':dt_inicio','null',[rfReplaceAll]);
      end;

      if(qryHorariosConflitodt_final_original.AsString <> '') then
      begin
         sqlAtual := StringReplace(sqlAtual,':dt_fim','''' + FormatDateTime('yyyy-mm-dd', qryHorariosConflitodt_final_original.AsDateTime) + '''',[rfReplaceAll]);
      end else begin
         sqlAtual := StringReplace(sqlAtual,':dt_fim','null',[rfReplaceAll]);
      end;

      sqlAtual := StringReplace(sqlAtual,':turmahorario',qryHorariosConflitocd_turmas_horarios.AsString,[rfReplaceAll]);

      sqlFinal.Values[qryHorariosConflitocd_turmas_horarios.AsString] := sqlAtual;

      qryHorariosConflito.Next;
   end;

   qryHorariosConflito.First;
   self.sqlRestauraDatasOriginais := sqlFinal;
end;

procedure TformGerenciaConflitoHorario.setDadosReajusteAulas(
  var listaExecucao: TListaExecucao; anosemestre: Integer; cd_turma: String;
  ListaHorariosDisciplinas: TStringList);
begin
   self.ListaExecucao := listaExecucao;
   self.nr_anosemestre := anosemestre;
   self.cd_turma_base := cd_turma;
   self.ListaHorariosDasDisciplinas := ListaHorariosDisciplinas;
end;

procedure TformGerenciaConflitoHorario.setDataInicioNovoHorario(
  dataNovoHorario: TDate);
begin
   self.dataInicioNovoHorario := dataNovoHorario;
end;

procedure TformGerenciaConflitoHorario.setHorariosConflitam(
  horario: TStringList);
begin
   self.horariosConflitam := horario;
end;

procedure TformGerenciaConflitoHorario.setHorariosTurma(
  horarios: THorariosTurmaGrid);
begin
   self.HorariosTurma := horarios;
end;

procedure TformGerenciaConflitoHorario.sgdHorariosNovosDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   Texto : String;
begin
  if(rowAtual = 0) OR (ARow = 0) then
   begin
      exit;
   end;

   sgdHorariosNovos.Canvas.FillRect(Rect);
   Texto := sgdHorariosNovos.Cells[ACol, ARow];
   sgdHorariosNovos.Canvas.Font.Color := clBlack;
   sgdHorariosNovos.Canvas.Brush.Color := clWhite;

   if(ARow = rowAtual) then
   begin
      sgdHorariosNovos.Canvas.Font.Color := clBlack;
      sgdHorariosNovos.Canvas.Brush.Color := clYellow;
   end;
   
   sgdHorariosNovos.Canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 2, Texto);
end;

procedure TformGerenciaConflitoHorario.sgdHorariosNovosSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
 i:integer;
begin
    if (rowAtual <> ARow) then
    begin
      rowAtual := ARow;

      self.ligaCombos();
    end;
end;

function TformGerenciaConflitoHorario.verificaAulasVinculadas(
  cd_turma_horario: Integer): Boolean;
const
   SQL_VERIFICA_VINCULO =
      'SELECT cd_diario_aula_turma_horario FROM diario_aulas_turmas_horarios WHERE cd_turma_horario = :codigo';
var
   qryVerificaVinculo : TUMZQuery;
begin
   dM.CriarConsulta(qryVerificaVinculo);

   qryVerificaVinculo.SQL.Add(SQL_VERIFICA_VINCULO);
   qryVerificaVinculo.ParamByName('codigo').AsInteger := cd_turma_horario;
   qryVerificaVinculo.Open;
   
   result := not(qryVerificaVinculo.IsEmpty);

   FreeAndNil(qryVerificaVinculo);
end;

end.
