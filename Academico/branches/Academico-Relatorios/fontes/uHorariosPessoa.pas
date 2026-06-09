unit uHorariosPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ImgList, ComCtrls, ToolWin, DB, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_Horarios_Pessoa = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbPessoa: TLabel;
    lbTurma: TLabel;
    lbSala: TLabel;
    sgHorarios: TStringGrid;
    toolPessoa: TToolBar;
    ToolButton4: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    qyHorarios: TUMZQuery;
    qyHorariosdescricao: TStringField;
    qyHorariossigla: TStringField;
    qyHorarioscd_horario: TIntegerField;
    qyHorariosdia_semana: TIntegerField;
    qyHorariosds_sala: TStringField;
    qySala: TUMZQuery;
    qyHorariosturma: TStringField;
    Panel4: TPanel;
    Panel5: TPanel;
    lbDisciplinasSemHorario: TListBox;
    procedure sgHorariosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure montaGrade(const ASFiltro: String);
    procedure carregaGrade;
  public
    { Public declarations }
    procedure setInfPessoa(codigoaluno, anosemestre: Integer; turma, nome: String);
  end;

var
  frm_Horarios_Pessoa: Tfrm_Horarios_Pessoa;
  
  // Informações para pegar os Horários
  iCodPessoa, iAnoSemestre, nroRegistros : Integer; sTurma, sNome: String;

  // Arrays utilizados no StringGrid
  cd_horario: array[1..200] of integer;

implementation

uses uDM;

{$R *.dfm}

procedure Tfrm_Horarios_Pessoa.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Horarios_Pessoa.carregaGrade;
var
   i, c : Integer;
   horarios, aux: string;
   mostraSemHorario: boolean;
begin
   mostraSemHorario := false;
   
   for i := 1 to qyHorarios.RecordCount do
   begin
      horarios := horarios + IntToStr(qyHorarioscd_horario.AsInteger);
      if not(i = qyHorarios.RecordCount) then
         horarios := horarios+', ';
      qyHorarios.Next;      
   end;

   if(StrLen(PChar(horarios)) <> 0) then
      montaGrade('codigo IN ('+horarios+')')
   else begin
      montaGrade('');
      ShowMessage('Nenhum horário encontrado para este aluno(a).');
   end;

   for i := 1 to sgHorarios.RowCount do
   begin
      sgHorarios.Cells[2,i] := '';
      sgHorarios.Cells[3,i] := '';
      sgHorarios.Cells[4,i] := '';
      sgHorarios.Cells[5,i] := '';
      sgHorarios.Cells[6,i] := '';
      sgHorarios.Cells[7,i] := '';
      sgHorarios.Cells[8,i] := '';
   end;

   for i := 1 to nroRegistros do
   begin
      qyHorarios.First;
      for c := 1 to qyHorarios.RecordCount do
      begin
         if(cd_horario[i] = qyHorarioscd_horario.AsInteger)then
         begin
            aux := '';
            if (qyHorariosturma.AsString <> sTurma) then
               aux := ' ('+qyHorariosturma.AsString+')';
            if(sgHorarios.Cells[qyHorariosdia_semana.AsInteger+1, i] = '')then
               sgHorarios.Cells[qyHorariosdia_semana.AsInteger+1, i] := qyHorariosdescricao.AsString+aux
            else
               sgHorarios.Cells[qyHorariosdia_semana.AsInteger+1, i] := sgHorarios.Cells[qyHorariosdia_semana.AsInteger+1, i]+' / '+qyHorariosdescricao.AsString+aux;
         end;
         qyHorarios.Next;
      end;
   end;

   qyHorarios.First;
   for c := 1 to qyHorarios.RecordCount do
   begin
      if((qyHorarioscd_horario.AsInteger = 0) OR (qyHorariosdia_semana.AsInteger = 0)) then
      begin
         lbDisciplinasSemHorario.Items.Add(qyHorariosdescricao.AsString+' ('+qyHorariosturma.AsString+')');
         mostraSemHorario := true;
      end;
      if Pos(qyHorariosturma.AsString, sTurma) = 0 then
      begin
         sTurma := sTurma + ' / ' + qyHorariosturma.AsString;
         lbTurma.Caption := sTurma;
      end;
      qyHorarios.Next;
   end;

   if not(mostraSemHorario)then
   begin
      Panel5.Height := 0;
      lbDisciplinasSemHorario.Height := 0;
      Panel5.Visible := False;
      lbDisciplinasSemHorario.Visible := False;
      sgHorarios.Align := alClient;
   end;
end;

procedure Tfrm_Horarios_Pessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F12: Self.btnFecharClick( nil );
   end;
end;

procedure Tfrm_Horarios_Pessoa.FormShow(Sender: TObject);
begin
   lbPessoa.Caption := IntToStr(iCodPessoa)+' - '+sNome;
   lbTurma.Caption  := sTurma;

   with qySala do
   begin
      Close;
      ParamByName('anosemestre').AsInteger := iAnoSemestre;
      ParamByName('turma').AsString := sTurma;
      ParamByName('codigoaluno').AsInteger := iCodPessoa;
      try
         Open;
         if((FieldByName('ds_sala').IsNull) or (FieldByName('ds_sala').AsString = '')) then
         begin
            lbSala.Font.Color := clRed;
            lbSala.Caption := 'Não informado';
         end else begin
            lbSala.Font.Color := clBlack;
            lbSala.Caption := FieldByName('ds_sala').AsString;
         end;
      except
         on e:exception do
            ShowMessage('Erro no SQL da Busca de Sala');
      end;
      Close;
      Free;
   end;

   with qyHorarios do
   begin
      Close;
      ParamByName('anosemestre').AsInteger := iAnoSemestre;
      ParamByName('codigoaluno').AsInteger := iCodPessoa;
      ParamByName('turma').AsString        := sTurma;
      try
         Open;
         carregaGrade();
      except
         on e:exception do
            ShowMessage('Erro no SQL dos Horários');
      end;
      Close;
      Free;
   end;
end;

procedure Tfrm_Horarios_Pessoa.montaGrade(const ASFiltro: String);
var
   i: integer;
begin
  nroRegistros := 0;
  sgHorarios.ColWidths[0] := 160; 

  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  if ASFiltro = '' then
     DM.qAux1.SQL.Add('SELECT * FROM horarios ORDER BY ds_horario')
  else
     DM.qAux1.SQL.Add(Format('SELECT * FROM horarios %s ORDER BY ds_horario', ['WHERE ' + ASFiltro]));
  DM.qAux1.Open;

  sgHorarios.RowCount := DM.qAux1.RecordCount + 1;

  for i := 1 to sgHorarios.RowCount do
  begin
    sgHorarios.Cells[2,i] := '';
    sgHorarios.Cells[3,i] := '';
    sgHorarios.Cells[4,i] := '';
    sgHorarios.Cells[5,i] := '';
    sgHorarios.Cells[6,i] := '';
    sgHorarios.Cells[7,i] := '';
    sgHorarios.Cells[8,i] := '';
  end;

  sgHorarios.Cells[2,0] := ' Domingo';
  sgHorarios.Cells[3,0] := ' Segunda';
  sgHorarios.Cells[4,0] := ' Terça';
  sgHorarios.Cells[5,0] := ' Quarta';
  sgHorarios.Cells[6,0] := ' Quinta';
  sgHorarios.Cells[7,0] := ' Sexta';
  sgHorarios.Cells[8,0] := ' Sábado';

  for i := 1 to DM.qAux1.RecordCount do begin

    cd_horario[i] := DM.qAux1.FieldByName('codigo').AsInteger;
    sgHorarios.Cells[0,i] := ' '+DM.qAux1.FieldByName('ds_horario').AsString;
    sgHorarios.Cells[1,i] := ' '+FormatDateTime('hh:MM',DM.qAux1.FieldByName('hr_inicio').AsDateTime);
    nroRegistros := nroRegistros+1;
    DM.qAux1.Next;

  end;
end;

procedure Tfrm_Horarios_Pessoa.setInfPessoa(codigoaluno, anosemestre: Integer;
  turma, nome: String);
begin
   iCodPessoa     := codigoaluno;
   iAnoSemestre   := anosemestre;
   sTurma         := turma;
   sNome          := nome;
end;

procedure Tfrm_Horarios_Pessoa.sgHorariosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S: string;
  drawrect :TRect;
begin
   if(ARow <> 0)then
   begin
      S:= (Sender as TStringgrid).Cells[aCol, aRow ];
      If Length(S) > 0 then
      begin
         drawrect := rect;
         DrawText((Sender as TStringgrid).canvas.handle,
         Pchar(S), Length(S), drawrect,
         dt_calcrect or dt_wordbreak or dt_left );
         if((drawrect.bottom - drawrect.top) > (Sender as TStringgrid).RowHeights[arow])then
            (Sender as TStringgrid).RowHeights[arow] := (drawrect.bottom - drawrect.top)
         else begin
            drawrect.Right := rect.right;
            (Sender As TStringgrid).canvas.fillrect( drawrect );
            DrawText((Sender as TStringgrid).canvas.handle, Pchar(S), Length(S),
                     drawrect, dt_wordbreak or dt_left);
         end;
      end;
   end;
end;

end.

