unit uProvasDuplicar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, Grids, ComCtrls, ToolWin, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, DateUtils;

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

   TfrmDuplicarAvaliacoes = class(TForm)
      Panel1: TPanel;
      ToolBar6: TToolBar;
      tbSalvar: TToolButton;
      ToolButton15: TToolButton;
      tbCancelar: TToolButton;
      sgProvas: TStringGrid;
      Panel2: TPanel;
      edEtapaSelecionada: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      edEtapaNova: TEdit;
      udEtapa: TUpDown;
      ilToobar: TImageList;
      btnSelecaoData: TBitBtn;
      mcSelecaoData: TMonthCalendar;
      qyProvas: TUMZQuery;
      qyProvasanosemestre: TSmallintField;
      qyProvasturma: TStringField;
      qyProvasnro_nota: TSmallintField;
      qyProvasassunto: TStringField;
      qyProvasdata: TDateTimeField;
      qyProvascd_prova: TIntegerField;
      qyProvasdisciplina: TStringField;
      qyProvasnm_professor: TStringField;
      qyProvasds_avaliacao_tipo: TStringField;
      qyInserirProva: TUMZQuery;
      IntegerField1: TIntegerField;
      SmallintField1: TSmallintField;
      StringField1: TStringField;
      StringField2: TStringField;
      SmallintField2: TSmallintField;
      StringField3: TStringField;
      StringField4: TStringField;
      StringField5: TStringField;
      DateTimeField1: TDateTimeField;
      qyGetDadosProva: TUMZQuery;
      qyGetDadosProvanro_nota: TSmallintField;
      qyGetDadosProvadata: TDateTimeField;
      qyGetDadosProvavl_peso: TFloatField;
      qyGetDadosProvaassunto: TStringField;
      qyGetDadosProvacd_tipo: TIntegerField;
      qyGetDadosProvaanosemestre: TSmallintField;
      qyGetDadosProvaturma: TStringField;
      qyGetDadosProvadisciplina: TIntegerField;
      qyGetDadosProvabimestre: TSmallintField;
      qyGetDadosProvacd_professor: TIntegerField;
    qyGetDadosProvacd_avaliacao_tipo: TIntegerField;
    procedure mcSelecaoDataClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure tbSalvarClick(Sender: TObject);
      procedure udEtapaClick(Sender: TObject; Button: TUDBtnType);
      procedure tbCancelarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure sgProvasDrawCell(Sender: TObject; ACol, ARow: Integer;
         Rect: TRect; State: TGridDrawState);
      procedure FormShow(Sender: TObject);

   const
      COL_ANOSEM = 0;
      COL_TURMA = 1;
      COL_DISC = 2;
      COL_NUM = 3;
      COL_PROF = 4;
      COL_TIPO = 5;
      COL_ASSUNTO = 6;
      COL_DATA = 7;
   strict private
      { Private declarations }
      procedure InicializarGridProvas();
      procedure criarProvas();
      function CarregarGrid(): Boolean;

      procedure OnFocusEvent(Sender : TObject; const HasFocus: Boolean);
   public
      { Public declarations }
      procedure addProvas(arrProvas : TStringList);
      procedure setEtapaSelecionada(nrEtapa : String);
   end;

var
  frmDuplicarAvaliacoes: TfrmDuplicarAvaliacoes;

implementation

uses uItemCombo, uGeneral, uDM, uDMDIARIO, ClassTurmas;

{$R *.dfm}

procedure TfrmDuplicarAvaliacoes.addProvas(arrProvas: TStringList);
begin
   arrProvas.Delimiter := ',';
   qyProvas.SQL.Text := StringReplace(qyProvas.SQL.Text, ':cd_provas', arrProvas.DelimitedText, [rfReplaceAll]);
end;

function TfrmDuplicarAvaliacoes.CarregarGrid(): Boolean;
var
   I : Integer;
begin
   Result := False;

   qyProvas.Close;
   qyProvas.Open;

   // Se trouxe registro, então retorna True, informando que a tela pode ser aberta
   Result := (qyProvas.RecordCount > 0);

   sgProvas.RowCount := qyProvas.RecordCount + 1;
   for I := qyProvas.RecNo to qyProvas.RecordCount do
   begin
      sgProvas.Cells[COL_ANOSEM, I] := qyProvas.FieldByName('anosemestre').AsString;
      sgProvas.Cells[COL_TURMA, I] := qyProvas.FieldByName('turma').AsString;
      sgProvas.Cells[COL_DISC, I] := qyProvas.FieldByName('disciplina').AsString;
      sgProvas.Cells[COL_NUM, I] := qyProvas.FieldByName('nro_nota').AsString;
      sgProvas.Cells[COL_PROF, I] := qyProvas.FieldByName('nm_professor').AsString;
      sgProvas.Cells[COL_TIPO, I] := qyProvas.FieldByName('ds_avaliacao_tipo').AsString;
      sgProvas.Cells[COL_ASSUNTO, I] := qyProvas.FieldByName('assunto').AsString;
      sgProvas.Cells[COL_DATA, I] := qyProvas.FieldByName('data').AsString;

      sgProvas.Objects[0, I] := TItemCombo.Create(
         qyProvas.FieldByName('cd_prova').AsString,
         qyProvas.FieldByName('assunto').AsString,
         qyProvas.FieldByName('data').AsDateTime
      );

      Application.ProcessMessages;

      qyProvas.Next();
   end;
   
end;

procedure TfrmDuplicarAvaliacoes.tbCancelarClick(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.Close();
end;

procedure TfrmDuplicarAvaliacoes.FormCreate(Sender: TObject);
begin
   btnSelecaoData.OnFocus := OnFocusEvent;
end;

procedure TfrmDuplicarAvaliacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F5 : if tbSalvar.Enabled then tbSalvarClick( nil );
      VK_F6 : if tbCancelar.Enabled then tbCancelarClick( nil );
   end;
end;

procedure TfrmDuplicarAvaliacoes.OnFocusEvent(Sender: TObject;
  const HasFocus: Boolean);
var
   DiaSemanaSelecionado : Word;
begin
   mcSelecaoData.Top := TBitBtn(Sender).Top + TBitBtn(Sender).Height;
   mcSelecaoData.Left := TBitBtn(Sender).Left-69; // Diminui 69 para alinhar o componente de calendário a direita

   if HasFocus then
   begin
      mcSelecaoData.Date := StrToDate('01/01/' + IntToStr(YearOf(StrToDate(TBitBtn(Sender).Caption))));
      mcSelecaoData.Date := StrToDate(TBitBtn(Sender).Caption);
      mcSelecaoData.DateBkp := mcSelecaoData.Date;
   end
   else if mcSelecaoData.Visible then
   begin
      TItemCombo(sgProvas.Objects[0,sgProvas.Row]).setVariavel(mcSelecaoData.Date);

      btnSelecaoData.Caption := FormatDateTime('dd/mm/yyyy', TItemCombo(sgProvas.Objects[0,sgProvas.Row]).getVariavel());
      sgProvas.Cells[COL_DATA, btnSelecaoData.Linha] := btnSelecaoData.Caption;
   end;

   mcSelecaoData.Visible := HasFocus;
end;

procedure TfrmDuplicarAvaliacoes.FormShow(Sender: TObject);
begin
   Self.InicializarGridProvas;
   Self.CarregarGrid();
end;

procedure TfrmDuplicarAvaliacoes.InicializarGridProvas;
begin
   // Define os titulos das colunas iniciais
   sgProvas.Cells[COL_ANOSEM,  0] := 'Ano/Sem';
   sgProvas.Cells[COL_TURMA,   0] := 'Turma';
   sgProvas.Cells[COL_DISC,    0] := 'Disciplina';
   sgProvas.Cells[COL_NUM,     0] := 'Num.';
   sgProvas.Cells[COL_PROF,    0] := 'Professor';
   sgProvas.Cells[COL_TIPO,    0] := 'Tipo';
   sgProvas.Cells[COL_ASSUNTO, 0] := 'Assunto';
   sgProvas.Cells[COL_DATA,    0] := 'Data';

   // Define os tamanhos iniciais
   sgProvas.ColWidths[COL_ANOSEM] := 50;
   sgProvas.ColWidths[COL_TURMA] := 150;
   sgProvas.ColWidths[COL_DISC] := 190;
   sgProvas.ColWidths[COL_NUM] := 30;
   sgProvas.ColWidths[COL_PROF] := 170;
   sgProvas.ColWidths[COL_TIPO] := 60;
   sgProvas.ColWidths[COL_ASSUNTO] := 180;
   sgProvas.ColWidths[COL_DATA] := 93;

   // Incrementa um número para a etapa nova
   edEtapaNova.Text := IntToStr(StrToInt(edEtapaSelecionada.Text)+1); 
end;

procedure TfrmDuplicarAvaliacoes.mcSelecaoDataClick(Sender: TObject);
begin
   btnSelecaoData.Caption := TGeneral.DateToString(mcSelecaoData.Date);

   if (MonthOf(mcSelecaoData.Date) = MonthOf(mcSelecaoData.DateBkp)) AND
      (YearOf(mcSelecaoData.Date) = YearOf(mcSelecaoData.DateBkp)) then
   begin
      sgProvas.SetFocus();
   end;

   mcSelecaoData.DateBkp := mcSelecaoData.Date;
end;

procedure TfrmDuplicarAvaliacoes.setEtapaSelecionada(nrEtapa: String);
begin
   edEtapaSelecionada.Text := nrEtapa;
end;

procedure TfrmDuplicarAvaliacoes.sgProvasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
   if NOT(ARow > 0) then
      Exit;

   case ACol of
      { Coluna de Seleção de Nova data para a Aula }
      COL_DATA: begin
         if (gdSelected in State) then
         begin
            btnSelecaoData.Left := Rect.Left + sgProvas.Left + 1;
            btnSelecaoData.Top := Rect.Top + sgProvas.Top;

            btnSelecaoData.Width := Rect.Right - Rect.Left - 1;
            btnSelecaoData.Height := Rect.Bottom - Rect.Top;

            try
               btnSelecaoData.Caption := FormatDateTime('dd/mm/yyyy', TItemCombo(sgProvas.Objects[0, ARow]).getVariavel());
            except
               btnSelecaoData.Caption := FormatDateTime('dd/mm/yyyy', Now());
            end;

            btnSelecaoData.Coluna := ACol;
            btnSelecaoData.Linha := ARow;

            btnSelecaoData.Visible := True;
            btnSelecaoData.Enabled := True;
         end else begin
            btnSelecaoData.Visible := False;
         end;
      end;
   end;
end;

procedure TfrmDuplicarAvaliacoes.tbSalvarClick(Sender: TObject);
begin
   // Verifica se a etapa Destino é diferente da etapa Origem
   if edEtapaSelecionada.Text <> edEtapaNova.Text then
   begin
      criarProvas;
      Self.ModalResult := mrOk;
      TGeneral.Mensagem('As provas foram duplicadas para a etapa selecionada com sucesso.', 'Atenção', MB_OK, Handle);
      Self.Close();
   end else begin
      TGeneral.Mensagem('É necessário que a etapa de origem seja diferente da etapa de destino.', 'Atenção', MB_OK + MB_ICONEXCLAMATION, Handle);
   end;
end;

procedure TfrmDuplicarAvaliacoes.criarProvas();
var
   I: Integer;
   logDesc: String;
   iDisciplinaFrente    : Integer;
   bProvaDisciplinaFrente : boolean;
   arrNroProvas         : TStringList;
   iNrProva : Integer;
   avl_param_frente_media : String; 
begin

   qyProvas.First;

   sgProvas.RowCount := qyProvas.RecordCount + 1;
   for I := qyProvas.RecNo to qyProvas.RecordCount do
   begin
      qyInserirProva.ParamByName('bimestre').AsInteger := StrToInt(edEtapaNova.Text);
      qyInserirProva.ParamByName('data').AsDateTime := TItemCombo(sgProvas.Objects[0,I]).getVariavel();

      qyInserirProva.ParamByName('cd_prova').AsInteger := qyProvas.FieldByName('cd_prova').AsInteger;
      qyInserirProva.ExecSQL;

      // Recupera dados da prova inserida para geração dos logs de inserção de provas e verificação de disicplinas frente
      qyGetDadosProva.Close;
      qyGetDadosProva.ParamByName('cd_prova').AsInteger := DM.LastInsert;
      qyGetDadosProva.Open;

      if (not qyGetDadosProva.Eof) and (qyGetDadosProva.FieldByName('anosemestre').AsInteger > 0) then
      begin

         { PROGRAMAÇÂO DE DISCIPLINAS COM FRENTES }

         // Verifica se possui disciplina frente e duplica a prova para ela se houver necessidade

         // Retorna a disciplina frente
         iDisciplinaFrente := DM.getDisciplinaFrente(
            qyGetDadosProvadisciplina.AsInteger,
            qyGetDadosProvaanosemestre.AsInteger,
            qyGetDadosProvaturma.AsString
         );

         // Se a disciplina frente existe
         if iDisciplinaFrente > 0 then
         begin

            // Verifica se deve copiar as provas por tipo (Como no Decisivo), ou copiar todas as provas para a mãe
            avl_param_frente_media := UpperCase(ClasseTurmas.GetParametroAvaliacao(
               qyGetDadosProvaanosemestre.AsInteger,
               qyGetDadosProvaturma.AsString,
               qyGetDadosProvadisciplina.AsString,
               'sn_disc_frente_media'
            ));

            if avl_param_frente_media = '0' then
            begin

               // Verifica se na disciplina frente já possui uma prova criada com o mesmo tipo
               bProvaDisciplinaFrente := Dm.existeProvaDisciplinaFrente(
                  qyGetDadosProvaanosemestre.AsInteger,
                  qyGetDadosProvaturma.AsString,
                  iDisciplinaFrente,
                  qyGetDadosProvabimestre.AsInteger,
                  qyGetDadosProvacd_avaliacao_tipo.AsInteger
               );

               // Se não existe a prova ainda na disciplina pai duplica a mesma para ela
               if not bProvaDisciplinaFrente then
               begin

                  Dm.DeptoCursoTurma(qyGetDadosProvaanosemestre.AsInteger,qyGetDadosProvaturma.AsString);

                  // Duplica a prova para a disciplina frente
                  Dm.DuplicarProvaDisciplinaFrente(
                     qyGetDadosProvaanosemestre.AsInteger,
                     DM.tblDeptoCursoTurmaCurso.AsString,
                     qyGetDadosProvaturma.AsString,
                     qyGetDadosProvadisciplina.AsInteger,
                     iDisciplinaFrente,
                     qyGetDadosProvabimestre.AsInteger,
                     qyGetDadosProvanro_nota.AsInteger,
                     false,
                     qyGetDadosProvacd_tipo.AsInteger
                  );
               end;
            end else begin
                if avl_param_frente_media <> '2' then
                begin
                  Dm.DuplicarProvaDisciplinaFrente(
                    qyGetDadosProvaanosemestre.AsInteger,
                    DM.tblDeptoCursoTurmaCurso.AsString,
                    qyGetDadosProvaturma.AsString,
                    qyGetDadosProvadisciplina.AsInteger,
                    iDisciplinaFrente,
                     qyGetDadosProvabimestre.AsInteger,
                    qyGetDadosProvanro_nota.AsInteger,
                    true,
                    qyGetDadosProvacd_tipo.AsInteger
                  );
                end;

            end;

         end;

         // Inserir log de inserção de provas
         logDesc := '';
         logDesc := logDesc + 'Nro. Prova: '+qyGetDadosProva.FieldByName('nro_nota').AsString+', ';
         logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', qyGetDadosProva.FieldByName('data').AsDateTime)+', ';
         logDesc := logDesc + 'Peso: '+qyGetDadosProva.FieldByName('vl_peso').AsString+', ';
         logDesc := logDesc + 'Assunto: '+qyGetDadosProva.FieldByName('assunto').AsString+', ';

         if qyGetDadosProva.FieldByName('cd_tipo').AsInteger = 1 then
         begin
            logDesc := logDesc + 'Compõe nota substituível: Sim, ';
         end
         else if qyGetDadosProva.FieldByName('cd_tipo').AsInteger = 2 then
         begin
            logDesc := logDesc + 'Compõe nota substituível: Não, ';
         end
         else if qyGetDadosProva.FieldByName('cd_tipo').AsInteger = 3 then
         begin
            logDesc := logDesc + 'Prova de suficiência: Sim, ';
         end
         else if qyGetDadosProva.FieldByName('cd_tipo').AsInteger = 4 then
         begin
            logDesc := logDesc + 'Recuperação Etapa: Sim, ';
         end;

         logDesc := logDesc + 'Anosemestre: '+qyGetDadosProva.FieldByName('anosemestre').AsString+', ';
         logDesc := logDesc + 'Turma: '+qyGetDadosProva.FieldByName('turma').AsString+', ';
         logDesc := logDesc + 'Disciplina: '+qyGetDadosProva.FieldByName('disciplina').AsString+', ';
         logDesc := logDesc + 'Etapa: '+qyGetDadosProva.FieldByName('bimestre').AsString;
         logDesc := logDesc + CHR(13) + '[Acadêmico - Duplicação aulas entre etapas]';

         { Insere log de inserção de provas }
         DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_PROVA, logDesc, qyGetDadosProva.FieldByName('cd_professor').AsInteger );
      end;

      qyProvas.Next();
   end;

end;

procedure TfrmDuplicarAvaliacoes.udEtapaClick(Sender: TObject;
  Button: TUDBtnType);
var
   i: Integer;
begin
   if edEtapaNova.Text = '' then begin
      edEtapaNova.Text := '1';
   end
   else begin
      i := StrToIntDef(edEtapaNova.Text, 1);

      if Button = btNext then begin
         Inc(i);
      end
      else begin
         if (i > 1) then begin
            Dec(i);
         end;
      end;
      if (IntToStr(i) <> edEtapaNova.Text) then begin
         edEtapaNova.Text := IntToStr(i);
      end;
   end;
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
