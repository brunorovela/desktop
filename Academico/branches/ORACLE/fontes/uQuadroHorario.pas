unit uQuadroHorario;

interface

uses
  Forms, Windows, Db, Wwdatsrc, ZConnection, Wwquery, StdCtrls, Mask, TB97Tlbr,
  Sysutils, Grids, Buttons, Wwdbigrd, Wwdbgrid, Controls, ExtCtrls, TB97,
  TB97Tlwn, Classes, Graphics, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, dbctrls;

type
  TDadosQH = Class(TObject)
  public
    Disciplina :Integer;
    Sigla      :String;
    Descricao  :String;
    NrAulas    :Integer;
  end;

  //goLstQH é um StringList com a chave código professor
  //que para cada um existe vários String's List's cada qual com a turma como chave
  //e o respectivo objeto TDadosQH que possui as informações necessárias
  //para manter todo o Quadro de Horário

  {Objecto que controla a selecao das turmas}
  TDadosSelec = Class(TObject)
  public
    LinAtual :Integer;
    Colatual :Integer;
    LinSelec :Integer;
    ColSelec :Integer;
    CorSelec :TColor;
  end;

  TfrmQuadroHorario = class(TForm)
    dkTop: TDock97;
    dkBottom: TDock97;
    tbGeral: TToolbar97;
    btnSalvar: TSpeedButton;
    quProfessores: TwwQuery;
    dsProfessores: TwwDataSource;
    panel7: TPanel;
    quTurmas: TwwQuery;
    dsTurmas: TwwDataSource;
    twTurmas: TToolWindow97;
    Panel3: TPanel;
    quTurmasCodigo: TStringField;
    btnGerarQuadro: TSpeedButton;
    btnSair: TSpeedButton;
    quTurmasDescricao: TStringField;
    quQH: TwwQuery;
    dsQuadroHorario: TwwDataSource;
    btnAtualizar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnImprimir: TSpeedButton;
    Panel6: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    meAnoSemestre: TMaskEdit;
    Label2: TLabel;
    cboTurno: TComboBox;
    Panel2: TPanel;
    panel76: TPanel;
    Panel4: TPanel;
    paNomeProfessor: TPanel;
    dgTurmas: TwwDBGrid;
    Splitter1: TSplitter;
    quTurmasAnoSemestre: TSmallintField;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sgQuadroHorarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgQuadroHorarioSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure dgTurmasDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGerarQuadroClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    goDadosSelec  :TDadosSelec;
    goLstQH       :TStringList;
    function  MoveTurma(piColIni,piLinIni,piColFim,piLinFim :Integer):Boolean;
    function  AdicionaTurma(psTurma :String):Boolean;
    function  ExtraiDisciplinaCelula(psString :String):Integer;
    procedure AtualizaDadosProfessor;
    procedure FreeObjetos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuadroHorario: TfrmQuadroHorario;

implementation

uses uDM, uVerificaQH, Main;

{$R *.DFM}

procedure TfrmQuadroHorario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmQuadroHorario.FormCreate(Sender: TObject);
var
  liCol,
  liX,liY,
  liDia :Integer;
  wAno, wMes, wDia : Word;
begin

  DecodeDate(DataHoje,wAno,wMes,wDia);

  if wMes >= 7 then
    meAnoSemestre.text := FormatDateTime('yyyy',DataHoje)+'2'
  else
    meAnoSemestre.text := FormatDateTime('yyyy',DataHoje)+'1';


  cboTurno.ItemIndex := 0;
  goDadosSelec := TDadosSelec.Create;
  goDadosSelec.LinAtual := 1;
  goDadosSelec.ColAtual := 2;
  goDadosSelec.CorSelec := 0;
//  sgQuadroHorario.ColCount := (giNrAulas*giNrDiasSemana)+1;
//  sgQuadroHorario.ColWidths[0] := 70;
//  sgQuadroHorario.Cells[0,0]   := 'Professor';
  liCol  := 1;
  liDia  := 1;
  liX    := 1;
  liY    := 1;

  //Definindo as cores e os dias da semana -----
{  while liCol <> (sgQuadroHorario.ColCount) do
    begin
      sgQuadroHorario.Cells[liCol,0] := IntToStr(liY)+'ª ('+gaDiasSemana[liDia]+')';
      if liY = giNrAulas then
         begin
           Inc(liDia);
           liY := 0;
         end;
      if liX <= giNrAulas then
         sgQuadroHorario.ColorCol[liCol] := clYellow
      else if (liX > giNrAulas) and (liX <= (giNrAulas*2)) then
         sgQuadroHorario.ColorCol[liCol] := clAqua
      else
         begin
           Dec(liCol);
           Dec(liY);
           liX := 0;
         end;
      Inc(liCol);
      Inc(liX);
      Inc(liY);
    end;
  sgQuadroHorario.FixAlignRow[0] := alCenter;}
end;

procedure TfrmQuadroHorario.sgQuadroHorarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  liPosTurma   :Integer;
  liDisciplina :Integer;
  lsTurma      :String;
begin
  {Ctrl + C}
{  if  (Shift = [ssCtrl])
  and (Key = 67)
  and (sgQuadroHorario.Cells[goDadosSelec.ColAtual,goDadosSelec.linAtual] <> '') then
      begin
        // Se for pressionado Ctrl + C
        // goDadosSelec Guarda as coordenadas no grid
        // trocando a celula de cor
        if goDadosSelec.CorSelec <> 0 then
           sgQuadroHorario.ColorCell[goDadosSelec.ColSelec,goDadosSelec.LinSelec] := goDadosSelec.CorSelec;
        goDadosSelec.CorSelec := sgQuadroHorario.ColorCell[goDadosSelec.ColAtual,goDadosSelec.LinAtual];
        goDadosSelec.ColSelec := goDadosSelec.ColAtual;
        goDadosSelec.LinSelec := goDadosSelec.LinAtual;
        sgQuadroHorario.ColorCell[goDadosSelec.ColAtual,goDadosSelec.LinAtual] := clRed;
      end
  {Ctrl + V}
{  else if (Shift = [ssCtrl])
      and (Key = 86)
      and (goDadosSelec.CorSelec <> 0)
      and (MoveTurma(goDadosSelec.ColSelec,goDadosSelec.LinSelec,goDadosSelec.ColAtual,goDadosSelec.LinAtual)) then
          begin
            //Processo de colagem da turma em outra celula
            //A Rotina Move Turma é resposável pelo controle de aulas Turma/Professor
            //A Cor antes da selação da célula é retornada
            sgQuadroHorario.ColorCell[goDadosSelec.ColSelec,goDadosSelec.LinSelec] := goDadosSelec.CorSelec;
            goDadosSelec.CorSelec := 0;
          end
  else if (Key = vk_Escape)
      and (goDadosSelec.CorSelec <> 0) then
      begin
        // Caso Esc seja pressionado com o focu no grid
        // A célula selecionada volta a cor atual
        sgQuadroHorario.ColorCell[goDadosSelec.ColSelec,goDadosSelec.LinSelec] := goDadosSelec.CorSelec;
        goDadosSelec.CorSelec := 0;
      end
  else if (Key = vk_Delete)
      and (sgQuadroHorario.Cells[goDadosSelec.ColAtual,goDadosSelec.LinAtual] <> '')
      and (Mensagem('Confirma exclusão da Turma ?',Application.Title,Mb_YesNo) = id_Yes) then
      begin
        // Caso a célula seja excluída é feito o controle de aulas Turmas/Professores
        // OBs: O código da disciplina é extraído da célula
        lsTurma      := sgQuadroHorario.Cells[goDadosSelec.ColAtual,goDadosSelec.LinAtual];
        liDisciplina := ExtraiDisciplinaCelula(lsTurma);
        lsTurma      := Copy(lsTurma,1,Pos('(',lsTurma)-1);
        liPosTurma   := TStringList(goLstQH.Objects[goDadosSelec.linAtual-1]).IndexOf(lsTurma);
        if liPosTurma <> -1 then
           while ((TStringList(goLstQH.Objects[goDadosSelec.linAtual-1]).Count-1) >= liPosTurma)
             and  (TStringList(goLstQH.Objects[goDadosSelec.linAtual-1]).Strings[liPosTurma] = lsTurma) do
             begin
               if TDadosQH(TStringList(goLstQH.Objects[goDadosSelec.linAtual-1]).Objects[liPosTurma]).Disciplina = liDisciplina then
                  begin
                    Inc(TDadosQH(TStringList(goLstQH.Objects[goDadosSelec.linAtual-1]).Objects[liPosTurma]).NrAulas);
                    sgQuadroHorario.Cells[goDadosSelec.ColAtual,goDadosSelec.LinAtual] := '';
                    if  (goDadosSelec.ColAtual = goDadosSelec.ColSelec)
                    and (goDadosSelec.LinAtual = goDadosSelec.linSelec)
                    and (goDadosSelec.CorSelec <> 0) then
                        sgQuadroHorario.ColorCell[goDadosSelec.ColSelec,goDadosSelec.LinSelec] := goDadosSelec.CorSelec;
                    goDadosSelec.CorSelec := 0;
                    AtualizaDadosProfessor;
                  end;
               Inc(liPosTurma);
             end;
      end;}
end;

procedure TfrmQuadroHorario.sgQuadroHorarioSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
  //Cada movimento dentro do grid é registrado pelo objeto goDadosSelec
  //e processa uma atualização do Quadro de Disponibilidades do Professor
  goDadosSelec.LinAtual := Row;
  goDadosSelec.ColAtual := Col;
  AtualizaDadosProfessor;
end;

procedure TfrmQuadroHorario.FreeObjetos;
var
  liX,
  liY :Integer;
begin
  // Tira os objetos da memória
  if goLstQH <> Nil then
     begin
       for liX := (goLstQH.count-1) downto 0 do
         begin
           for liY := (TStringList(goLstQH.Objects[liX]).Count-1) downto 0 do
             TDadosQH(TStringList(goLstQH.Objects[liX]).Objects[liY]).Free;
           TStringList(goLstQH.Objects[liX]).Free;
         end;
       goLstQH.Free;
    end;
end;

procedure TfrmQuadroHorario.dgTurmasDblClick(Sender: TObject);
begin
  //Caso a adição da Turma não seja concluída um mensagem aparecerá
  //Caso contrário o Quadro de Disponbilidades do professor será atualizado
  if not AdicionaTurma(quTurmas.FieldByName('Codigo').AsString) then
     Mensagem('Turma já adicionada para todos os professores...', Application.Title, MB_OK + MB_ICONSTOP )
  else AtualizaDadosProfessor;
end;

function TfrmQuadroHorario.MoveTurma(piColIni,piLinIni,piColFim,piLinFim :Integer):Boolean;
//Rotina responsável pela troca de lugar das Turmas
var
  lsTurma :String;
begin
  Result := True;
  if piLinIni <> piLinFim then
     begin
       Result := False;
       //A troca de Turmas deve ser feita na horizontal
       Mensagem('Linha de destino diferente da origem... Verifique...', Application.Title, MB_OK + MB_ICONSTOP );
     end
  else
     begin
{       lsTurma := sgQuadroHorario.Cells[piColIni,piLinIni];
       if sgQuadroHorario.Cells[piColFim,piLinFim] = '' then
          begin
            sgQuadroHorario.Cells[piColIni,piLinIni] := '';
            sgQuadroHorario.Cells[piColFim,piLinFim] := lsTurma;
          end
       else
          begin
            sgQuadroHorario.Cells[piColIni,piLinIni] := sgQuadroHorario.Cells[piColFim,piLinFim];
            sgQuadroHorario.Cells[piColFim,piLinFim] := lsTurma;
          end;}
     end;
end;

function TfrmQuadroHorario.AdicionaTurma(psTurma :String):Boolean;
//Rotina responsável pela adição de novas turmas dentro das possibilidades de cada
//professor
var
  liCol,
  liLin,
  liPosTurma :Integer;
begin
  Result := False;
  liLin  := 1;
  liCol  := 1;
{  while (liLin <= sgQuadroHorario.RowCount-1)
    and (not Result) do
    begin
      liPosTurma := TStringList(goLstQH.Objects[liLin-1]).IndexOf(psTurma);
      if liPosTurma <> -1 then
         while ((TStringList(goLstQH.Objects[liLin-1]).Count-1) >= liPosTurma)
           and (TStringList(goLstQH.Objects[liLin-1]).Strings[liPosTurma] = psTurma) do
           begin
             if  (TDadosQH(TStringList(goLstQH.Objects[liLin-1]).Objects[liPosTurma]).NrAulas > 0)
             and (sgQuadroHorario.Cells[liCol,liLin] = '') then
                begin
                  Dec(TDadosQH(TStringList(goLstQH.Objects[liLin-1]).Objects[liPosTurma]).NrAulas);
                  sgQuadroHorario.Cells[liCol,liLin] := psTurma+'('+IntToStr(TDadosQH(TStringList(goLstQH.Objects[liLin-1]).Objects[liPosTurma]).Disciplina)+')';
                  if goDadosSelec.CorSelec <> 0 then
                     begin
                       sgQuadroHorario.ColorCell[goDadosSelec.ColSelec,goDadosSelec.LinSelec] := goDadosSelec.CorSelec;
                       goDadosSelec.CorSelec := 0;
                     end;
                  sgQuadroHorario.EditCell[liCol,liLin];
                  Result := True;
                end;
             Inc(liPosTurma);
           end
      else
         liCol := sgQuadroHorario.ColCount;

      if liCol = sgQuadroHorario.ColCount then
         begin
           liCol := 0;
           Inc(liLin);
         end;
      Inc(liCol);
    end;}

end;

procedure TfrmQuadroHorario.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmQuadroHorario.btnGerarQuadroClick(Sender: TObject);
//Rotina responsável pela geração do Quadro de Horário, basicamente procurando
//células com espaço que satisfaçam com as regras do professor
var
  lbTemTurma :Boolean;
begin
  if Mensagem('Confirma geração do QH ?',Application.Title,
               Mb_YesNo+MB_ICONQUESTION) = id_Yes then
     begin
       quTurmas.First;
       while not quTurmas.EOF do
         begin
           lbTemTurma := True;
           while lbTemTurma do
             lbTemTurma := AdicionaTurma(quTurmas.FieldByName('Codigo').AsString);
           quTurmas.Next;
         end;
       AtualizaDadosProfessor;
     end;
end;

procedure TfrmQuadroHorario.btnAtualizarClick(Sender: TObject);
var
  liLin,
  liPosTurma,
  liCol,
  liProfessor  :Integer;
  lbErro       :Boolean;
  loDadosQH    :TDadosQH;
  loLstTurmas  :TStringList;
  quGrade,quTP :TwwQuery;
begin
{  if StrToInt(meAnoSemestre.Text) = 0 then
     begin
       Mensagem('Digite o Ano/Semestre...', Application.Title, MB_OK + MB_ICONSTOP );
       meAnoSemestre.SetFocus;
     end
  else
     begin
       //Limpeza do Grid QuadroHorario
       for liLin := 1 to (sgQuadroHorario.RowCount-1) do
         for liCol := 0 to (sgQuadroHorario.ColCount-1) do
           sgQuadroHorario.Cells[liCol,liLin] := '';
       sgQuadroHorario.RowCount := 2;

       //Limpeza do Grid de Professores
       for liLin := 1 to (sgProfessores.RowCount-1) do
          for liCol := 0 to (sgProfessores.ColCount-1) do
            sgProfessores.Cells[liCol,liLin] := '';
       sgQuadroHorario.RowCount := 2;

       btnGerarQuadro.Enabled  := False;
       btnSalvar.Enabled       := False;
       btnExcluir.Enabled      := False;
       btnImprimir.Enabled     := False;
       sgQuadroHorario.Enabled := False;
       sgProfessores.Enabled   := False;
       dgTurmas.Enabled        := False;

       //-----
       //Criação do form de critica que só será mostrado
       //se algum erro existir caso contrário o mesmo será tirado da memória
       Application.CreateForm(TfrmVerificaQH,frmVerificaQH);
       lbErro := False;
       quTurmas.Close;
       quTurmas.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
       quTurmas.ParamByName('Turno').AsString        := Copy(cboTurno.Text,1,1);
       quTurmas.Open;

       if not quTurmas.Eof then
       begin
         //Verifica Grade
         quGrade := TwwQuery.Create(Self);
         quGrade.DatabaseName := DM.db.DatabaseName;
         quGrade.SessionName :=  DM.Session1.SessionName;
         quGrade.SQL.Add('Select Distinct T.AnoSemestre,T.Codigo,GC.Disciplina,D.Sigla,GC.NumeroAulas');
         quGrade.SQL.Add('From Turmas T,TurmasProfessores TP,GradeCurricular GC,Disciplinas D');
         quGrade.SQL.Add('Where  T.AnoSemestre =:AnoSemestre');
         quGrade.SQL.Add('and    T.Turno =:Turno');
         quGrade.SQL.Add('and    GC.Curso = T.Curso');
         quGrade.SQL.Add('and    GC.Serie = T.Serie');
         quGrade.SQL.Add('and    D.Codigo = GC.Disciplina');
         quGrade.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
         quGrade.ParamByName('Turno').AsString        := Copy(cboTurno.Text,1,1);
         quGrade.Open;

         //Verifica Turmas Professores
         quTP := TwwQuery.Create(Self);
         quTP.DatabaseName := DM.db.DatabaseName;
         quTP.SessionName := DM.Session1.SessionName;
         quTP.SQL.Add('Select T.AnoSemestre,T.Codigo,Tp.Disciplina,Sum(TP.NumeroAulas) As TotalAulas');
         quTP.SQL.Add('From Turmas T,TurmasProfessores TP');
         quTP.SQL.Add('Where  T.AnoSemestre =:AnoSemestre');
         quTP.SQL.Add('and    T.Turno =:Turno');
         quTp.SQL.Add('and    TP.AnoSemestre = T.AnoSemestre');
         quTP.SQL.Add('and    TP.Turma = T.Codigo');
         quTP.SQL.Add('Group By T.AnoSemestre,T.Codigo,Tp.Disciplina');
         quTP.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
         quTP.ParamByName('Turno').AsString        := Copy(cboTurno.Text,1,1);
         quTP.Open;

         //Primeiramente são varridas todas as turmas que satisfaçam a condição de Ano/Semestre/Turno
         //Procurando a sua grade curricular
         while not quTurmas.EOF do
         begin
           if not quGrade.Locate('AnoSemestre;Codigo',
                  VarArrayOf([quTurmas.FieldByName('AnoSemestre').AsInteger,
                              quTurmas.FieldByName('Codigo').AsString]),
                              [loCaseInsensitive]) then
           begin
             lbErro := True;
             frmVerificaQH.lbStatusTurmas.Items.Add('Turma '+quTurmas.FieldByName('Codigo').AsString+' não encontrada da Grade Curricular!');
           end;
           quTurmas.Next;
         end;

         if not lbErro then
         begin
           quGrade.First;
           while not quGrade.Eof do
           begin
             frmVerificaQH.lbStatusTurmas.Items.Add('Turma '+quGrade.FieldByName('Codigo').AsString+
                                                  ' Disciplina '+quGrade.FieldByName('Sigla').AsString+' Ok!');
             if not quTP.Locate('AnoSemestre;Codigo;Disciplina',VarArrayOf([quGrade.FieldByName('AnoSemestre').AsInteger,
                                quGrade.FieldByName('Codigo').AsString,quGrade.FieldByName('Disciplina').AsInteger]),[loCaseInsensitive]) then
             begin
               lbErro := True;
               frmVerificaQH.lbStatusTurmas.Items[frmVerificaQH.lbStatusTurmas.Items.Count-1] := quGrade.FieldByName('Codigo').AsString+
                 ' Disciplina '+quGrade.FieldByName('Sigla').AsString+
                 ' não encontrada na tabela de turmas professores!';
             end
             else
             if quGrade.FieldByName('NumeroAulas').AsInteger <> quTP.FieldByName('TotalAulas').AsInteger then
             begin
               lbErro := True;
               frmVerificaQH.lbStatusTurmas.Items[frmVerificaQH.lbStatusTurmas.Items.Count-1] := quGrade.FieldByName('Codigo').AsString+
                 ' Disciplina '+quGrade.FieldByName('Sigla').AsString+
                 ' com '+quGrade.FieldByName('NumeroAulas').AsString+' na grade diferente de '+quTP.FieldByName('TotalAulas').AsString +' aulas em Turmas Professores!';
             end;
             quGrade.Next;
           end;
         end;
         quGrade.Close;
         quGrade.Free;
         quTP.Close;
         quTP.Free;
       end
     else
     begin
       frmVerificaQH.lbStatusTurmas.Items.Add('Nenhuma Turma encotrada para o período selecionado!');
       lbErro := True;
     end;

     if lbErro then
        frmVerificaQH.ShowModal
     else
        begin
          quQH.Close;
          quProfessores.Close;
          quQH.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
          quQH.ParamByName('Turno').AsString        := Copy(cboTurno.Text,1,1);
          quProfessores.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
          quProfessores.ParamByName('Turno').AsString        := Copy(cboTurno.Text,1,1);
          quQH.Open;
          quProfessores.Open;

          //Se nenhum professor ou turma não forem encontrados para o Ano/Semestre/Turno
          //O mesmo é considerado um erro
          if (quProfessores.RecordCount > 0) and (quTurmas.RecordCount > 0) then
          begin
            //---------
            FreeObjetos;
            goLstQH      := TStringList.Create;
            liProFessor  := 0;
            liLin        := 1;

            //Carga da tabela Turmas Professores
            while Not quProfessores.Eof do
            begin
              if liProfessor <> quProfessores.FieldByName('Codigo').AsInteger then
              begin
                liProfessor  := quProfessores.FieldByName('Codigo').AsInteger;
                loLstTurmas  := TStringList.Create;
                goLstQH.AddObject(IntToStr(liProfessor),loLstTurmas);
                sgQuadroHorario.Cells[0,liLin] := Copy(quProfessores.FieldByName('Apelido').AsString,1,10);
                sgQuadroHorario.RowCount := liLin+1;
                Inc(liLin);
              end;
              loDadosQH            := TDadosQH.Create;
              loDadosQH.Disciplina := quProfessores.FieldByName('Disciplina').AsInteger;
              loDadosQH.Sigla      := quProfessores.FieldByName('Sigla').AsString;
              loDadosQH.Descricao  := quProfessores.FieldByName('Descricao').AsString;
              loDadosQH.NrAulas    := quProfessores.FieldByName('NumeroAulas').AsInteger;
              loLstTurmas.AddObject(quProfessores.FieldByName('Turma').AsString,loDadosQH);
              quProfessores.Next;
            end;

           //Carga da tabela do Quadro de Horários
           while not quQH.Eof do
           begin
             liLin := goLstQH.IndexOf(quQH.FieldByName('Professor').AsString);
             if liLin <> -1 then
             begin
               if quQH.FieldByName('DiaSemana').AsInteger = 1 then
                  liCol := quQH.FieldByName('NumeroAula').AsInteger
               else
               begin
                 liCol := ((quQH.FieldByName('DiaSemana').AsInteger*giNrAulas)-(giNrAulas))+
                            quQH.FieldByName('NumeroAula').AsInteger;
               end;
               liPosTurma := TStringList(golstQH.Objects[liLin]).IndexOf(quQH.FieldByName('Turma').AsString);
               if liPosTurma <> -1 then
                  while ((TStringList(goLstQH.Objects[liLin]).Count-1) >= liPosTurma) and
                         (TStringList(goLstQH.Objects[liLin]).Strings[liPosTurma] = quQH.FieldByName('Turma').AsString) do
                  begin
                    if TDadosQH(TStringList(goLstQH.Objects[liLin]).Objects[liPosTurma]).Disciplina = quQH.FieldByName('Disciplina').AsInteger then
                    begin
                      Dec(TDadosQH(TStringList(golstQH.Objects[liLin]).Objects[liPosTurma]).NrAulas);
                      sgQuadroHorario.Cells[liCol,liLin+1] := quQH.FieldByName('Turma').AsString+'('+quQH.FieldByName('Disciplina').AsString+')';
                    end;
                    Inc(liPosTurma);
                  end;
             end;
             quQH.Next;
           end;
          //O Quadro de Disponibilidades do Professores é atualizado
          //E os devidos botões são habilitdados
          AtualizaDadosProfessor;
          btnGerarQuadro.Enabled  := True;
          btnSalvar.Enabled       := True;
          btnExcluir.Enabled      := True;
          btnImprimir.Enabled     := True;
          sgQuadroHorario.Enabled := True;
          sgProfessores.Enabled   := True;
          dgTurmas.Enabled        := True;
        end
        else
           Mensagem('Faltam dados de Turma ou Professores... Verifique Ano/Semestre - Turno...', Application.Title, MB_OK + MB_ICONSTOP );
      end;
   end;}
end;

procedure TfrmQuadroHorario.FormDestroy(Sender: TObject);
begin
  FreeObjetos;
  goDadosSelec.Free;
  frmQuadroHorario := nil;
end;

procedure TfrmQuadroHorario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Passando os campos com Enter para todos os controles que}
  {nao sao tdbgrid e tdbMemo}
  if  ((ActiveControl.ClassType <> TWWDbGrid)
  and  (ActiveControl.ClassType <> TDbMemo)
  and  (Key = vk_Return))
  or   (Key = 34) then
      begin
        SelectNext (ActiveControl,True,True);
        Key := 0;
      end
  else if Key = 33 then
      SelectNext (ActiveControl,False,True)
  else if  (Key = vk_F2)
       and (BtnAtualizar.Enabled) then
      {Atualizar}
      BtnAtualizarClick(Nil)
  else if  (Key = vk_F3)
       and (BtnGerarQuadro.Enabled) then
      {Gerar Quadro Horario}
      BtnGerarQuadroClick(Nil)
  else if  (Key = vk_F4)
       and (BtnSalvar.Enabled) then
      {Salvar}
//      BtnSalvarClick(Nil)
  else if  (Key = vk_F5)
       and (BtnExcluir.Enabled) then
      BtnExcluirClick(Nil)
  else if Key = vk_F12 then
      BtnSairClick(Nil);
end;

procedure TfrmQuadroHorario.btnSalvarClick(Sender: TObject);
var
  liLin,
  liCol,
  liDiaSemana,
  liNumeroAula :Integer;
  quGeral   :TWWQuery;
begin
  //Para salvar o Quadro de horário
  //primeiramente são excluídos todos os registros pertinentes ao antigo
  //evitando problemas
  //em seguida todos os novos dados são incluídos
{  quGeral := TWWQuery.Create(Self);
  quGeral.DatabaseName := DM.db.Name;
  quGeral.SessionName := DM.Session1.SessionName;
  try
    DM.db.StartTransaction;
    quGeral.Sql.Add('Delete * From QuadroHorario');
    quGeral.Sql.Add('Where AnoSemestre =:AnoSemestre');
    quGeral.Sql.Add('And   Turno       =:Turno');
    quGeral.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
    quGeral.ParamByName('Turno').AsString := Copy(CboTurno.Text,1,1);
    quGeral.ExecSQL;
    quGeral.Close;
    for liLin := 1 to (sgQuadroHorario.RowCount-1) do
      begin
        quGeral.Sql.Clear;
        quGeral.Sql.Add('Insert InTo QuadroHorario');
        quGeral.Sql.Add('(AnoSemestre,Turno,Professor,DiaSemana,NumeroAula,Turma,Disciplina)');
        quGeral.Sql.Add('Values(:AnoSemestre,:Turno,:Professor,:DiaSemana,:NumeroAula,:Turma,:Disciplina)');
        liDiaSemana  := 1;
        liNumeroAula := 1;
        for liCol := 1 to (sgQuadroHorario.ColCount-1) do
          begin
            if sgQuadroHorario.Cells[liCol,liLin] <> '' then
               begin
                 quGeral.ParamByName('AnoSemestre').AsString := meAnoSemestre.Text;
                 quGeral.ParamByName('Turno').AsString       := Copy(CboTurno.Text,1,1);
                 quGeral.ParamByName('Professor').AsString   := goLstQH.Strings[liLin-1];
                 quGeral.ParamByName('DiaSemana').AsInteger  := liDiaSemana;
                 quGeral.ParamByName('NumeroAula').AsInteger := liNumeroAula;
                 quGeral.ParamByName('Turma').AsString       := Copy(sgQuadroHorario.Cells[liCol,liLin],1,Pos('(',sgQuadroHorario.Cells[liCol,liLin])-1);
                 quGeral.ParamByName('Disciplina').AsInteger := ExtraiDisciplinaCelula(sgQuadroHorario.Cells[liCol,liLin]);
                 quGeral.ExecSQL;
               end;
            if liNumeroAula = giNrAulas then
               begin
                 liNumeroAula := 1;
                 Inc(liDiaSemana);
               end
            else
               Inc(liNumeroAula);
          end;
      end;
    DM.db.Commit;
  except
    DM.db.Rollback;
    Mensagem('Problemas na atualização do Quadro de Horário... Verifique...', Application.Title, MB_OK + MB_ICONSTOP );
  end;
  quGeral.Close;
  quGeral.Free;}
end;

procedure TfrmQuadroHorario.btnExcluirClick(Sender: TObject);
var
  quGeral :TwwQuery;
begin
  if Mensagem('Confirma exclusão do Quadro de Horário ?',Application.Title,Mb_YesNo) = id_Yes then
     begin
       quGeral := TWWQuery.Create(Self);
       quGeral.DatabaseName := DM.db.Name;
       quGeral.SessionName := DM.Session1.SessionName;
       try
         DM.db.StartTransaction;
         quGeral.Sql.Add('Delete * From QuadroHorario');
         quGeral.Sql.Add('Where AnoSemestre =:AnoSemestre');
         quGeral.Sql.Add('And   Turno       =:Turno');
         quGeral.ParamByName('AnoSemestre').AsInteger := StrToInt(meAnoSemestre.Text);
         quGeral.ParamByName('Turno').AsString := Copy(cboTurno.Text,1,1);
         quGeral.ExecSQL;
         quGeral.Close;
         DM.db.Commit;
       except
         DM.db.Rollback;
         Mensagem('Problemas na exclusão do Quadro de Horário... Verifique...', Application.Title, MB_OK + MB_ICONSTOP );
       end;
       quGeral.Free;
       btnAtualizarClick(Nil);
     end;
end;

function TfrmQuadroHorario.ExtraiDisciplinaCelula(psString :String):Integer;
begin
  try
    Result := StrToInt(Copy(psString,Pos('(',psString)+1,(Pos(')',psString)-Pos('(',psString))-1));
  except
    Result := 0;
  end;
end;

procedure TfrmQuadroHorario.AtualizaDadosProfessor;
//Rotina responsável pela atualização do Quadro de Disponibilidades do Professor
var
  liLin,liCol,
  liDisciplina :Integer;
  lsTurma      :String;
begin
  //Limpeza do grid de professores
{  paNomeProfessor.Caption := sgQuadroHorario.Cells[0,goDadosSelec.LinAtual];
  sgProfessores.ColWidths[1] := 200;
  for liLin := 1 to (sgProfessores.RowCount-1) do
    for liCol := 0 to (sgProfessores.ColCount-1) do
      sgProfessores.Cells[liCol,liLin] := '';
  sgProfessores.RowCount := TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Count+1;
  liDisciplina := ExtraiDisciplinaCelula(sgQuadroHorario.Cells[goDadosSelec.ColAtual,goDadosSelec.LinAtual]);
  lsTurma      := sgQuadroHorario.Cells[goDadosSelec.ColAtual,goDadosSelec.LinAtual];
  lsTurma      := Copy(lsTurma,1,Pos('(',lsTurma)-1);
  for liLin := 0 to (TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Count-1) do
    begin
      if  (lsTurma =  TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Strings[liLin])
      and (liDisciplina = TDadosQH(TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Objects[liLin]).Disciplina) then
         sgProfessores.Row := liLin+1;
      sgProfessores.Cells[0,liLin+1]  := TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Strings[liLin];
      sgProfessores.Cells[1,liLin+1]  := TDadosQH(TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Objects[liLin]).Descricao;
      sgProfessores.Cells[2,liLin+1]  := IntToStr(TDadosQH(TStringList(goLstQH.Objects[goDadosSelec.LinAtual-1]).Objects[liLin]).NrAulas);
    end;}
end;



end.

