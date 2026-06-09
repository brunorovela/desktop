unit uCorrecaoManualPorQuestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Buttons, uTProva;

type
  TfrmCorrecaoManualPorQuestao = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    pnTitulo: TPanel;
    toolPessoa: TToolBar;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    pnCorrecao: TPanel;
    Bevel6: TBevel;
    ilDisciplinas: TImageList;
    ToolButton4: TToolButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    edCodProva: TEdit;
    Label2: TLabel;
    edQtdCorrecoes: TEdit;
    Bevel8: TBevel;
    edNomeProva: TEdit;
    SpeedButton1: TSpeedButton;
    qyProva: TUMZQuery;
    qyProvacd_prova: TIntegerField;
    qyProvanr_prova: TSmallintField;
    qyProvads_prova: TStringField;
    qyProvanr_correcoes: TIntegerField;
    pnDadosAluno: TPanel;
    qyOperacoes: TUMZQuery;
    Panel5: TPanel;
    Bevel5: TBevel;
    edNumeroQuestao: TEdit;
    Label1: TLabel;
    pnQuestoes: TScrollBox;
    txtTurma: TEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    edNrParte: TEdit;
    updnNrParte: TUpDown;
    procedure updnNrParteChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure edNrParteChange(Sender: TObject);
    procedure updnNrParteMouseLeave(Sender: TObject);
    procedure updnNrParteMouseEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edNumeroQuestaoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodProvaKeyPress(Sender: TObject; var Key: Char);
    procedure AcertosTotalKeyPress(Sender: TObject; var Key: Char);
    procedure QuestoesSomatoriaKeyPress(Sender: TObject; var Key: Char);
    procedure QuestoesAltKeyPress(Sender: TObject; var Key: Char);
    procedure QuestoesDiscursivasKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    prova_selecionada : boolean;
    questao_selecionada : boolean;
    slEdits: TStringList;
    slNomes: TStringList;
    cPeso: Currency;

    provaSelecionada : TProva;

    procedure FiltraProva();
    procedure GeraCamposPessoas();
    procedure SalvaRespostas();
    procedure DestruirCampos();
    procedure FiltraQuestao();
  public
    { Public declarations }
  end;

var
  frmCorrecaoManualPorQuestao: TfrmCorrecaoManualPorQuestao;

implementation

uses Main, uDM, uCadProvasDisciplinas, uCadProvasTurmas, uCadProvasGabaritos,
  uCadProvasAlunos, uSelProvas, uDigitarQuestoes, uSelProva,
  uCorrecaoManual, uFSelecionarTurma;

{$R *.dfm}

procedure TfrmCorrecaoManualPorQuestao.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   Self.Caption := pnTitulo.Caption;

   edCodProva.SetFocus();

end;

procedure TfrmCorrecaoManualPorQuestao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCorrecaoManualPorQuestao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCorrecaoManualPorQuestao.btnSairClick(Sender: TObject);
begin
  Close;
end;



procedure TfrmCorrecaoManualPorQuestao.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then begin
     if StrToInt(edQtdCorrecoes.Text) < 9 then begin
       edQtdCorrecoes.Text := IntToStr(StrToInt(edQtdCorrecoes.Text)+1);
     end;
  end
  else if Button = btPrev then begin
     if StrToInt(edQtdCorrecoes.Text) > 1 then begin
       edQtdCorrecoes.Text := IntToStr(StrToInt(edQtdCorrecoes.Text)-1);
     end;
  end;

  if (Button = btNext) OR (Button = btPrev) then begin
    if (StrToInt(edQtdCorrecoes.Text) > qyProva.FieldByName('nr_correcoes').AsInteger) then begin
        edQtdCorrecoes.Text := IntToStr(StrToInt(edQtdCorrecoes.Text)-1);
    end;
    if edNumeroQuestao.Text <> '' then
       FiltraQuestao();
  end;

end;

procedure TfrmCorrecaoManualPorQuestao.edCodProvaKeyPress(Sender: TObject; var Key: Char);
begin
   edNumeroQuestao.Text := '';
   questao_selecionada := False;
   DestruirCampos();

   prova_selecionada := False;
   if ( Key = #13 ) then begin
      FiltraProva();
   end;
end;

procedure TfrmCorrecaoManualPorQuestao.FiltraProva();
begin
   edNomeProva.Text := '';
                                   
   if ( edCodProva.Text = '' ) then begin
      Exit;
   end;

   try
      with qyProva do begin
         Close();
         ParamByName('cd_prova').AsInteger := StrToInt(edCodProva.Text);
         Open();

         if (StrToInt(edQtdCorrecoes.Text) > FieldByName('nr_correcoes').AsInteger) then begin
            Mensagem('A prova não tem tantas correções !', Application.Title, MB_OK + MB_ICONERROR);
            edQtdCorrecoes.Text := '1';
         end;
      end;
   except
      Mensagem('O código de prova deve ser númerico !', Application.Title, MB_OK + MB_ICONERROR);
      Exit;
   end;

   if ( qyProva.Eof ) then
   begin
      Mensagem('Prova inexistente !', Application.Title, MB_OK + MB_ICONERROR);
      Exit;
   end else begin
      provaSelecionada := TProva.Create(qyProvacd_prova.AsInteger);
   end;

   edNomeProva.Text := qyProva.FieldByName('nr_prova').AsString + ' - ' + qyProva.FieldByName('ds_prova').AsString;
   edNumeroQuestao.SetFocus();

   prova_selecionada := true;

end;

procedure TfrmCorrecaoManualPorQuestao.edNrParteChange(Sender: TObject);
begin
   if provaSelecionada <> nil then
   begin
      if StrToIntDef(edNumeroQuestao.Text, 0) > 0 then
      begin
         FiltraQuestao();
      end;
   end;
end;

procedure TfrmCorrecaoManualPorQuestao.edNumeroQuestaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   questao_selecionada := False;

   if ( Key = #27 ) then begin
      edNumeroQuestao.Text := '';
   end;

   if ( (Key <> #13) OR (edNumeroQuestao.Text = '') ) then begin
      Exit;
   end;

   FiltraQuestao();
end;

procedure TfrmCorrecaoManualPorQuestao.GeraCamposPessoas();
var
   i          : integer;
   left_ant   : integer;
   top_ant    : integer;
   iTabOrder  : integer;
begin

   if ( not prova_selecionada ) then begin
      Mensagem('Selecione uma prova !', Application.Title, MB_OK + MB_ICONERROR);
      edCodProva.SelectAll();
      Exit;
   end;

   if ( not questao_selecionada ) then begin
      Mensagem('Selecione uma questão !', Application.Title, MB_OK + MB_ICONERROR);
      edNumeroQuestao.SelectAll();
      Exit;
   end;

   left_ant := 8;
   top_ant  := 8;

   DestruirCampos();

   with qyOperacoes do begin
      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '  p.cd_pessoa, ' +
         '	IF(LENGTH(p.nm_pessoa) > 35, ' +
	      '    LEFT(p.nm_pessoa, LENGTH(LEFT(p.nm_pessoa,35)) - LOCATE(" ", REVERSE(LEFT(p.nm_pessoa,35)))+1) ' +
	      '    , p.nm_pessoa ' +
         '  ) as nm_pessoa, ' +
         '	g.ds_nome_gabarito, ' +
         '	gr.nr_questao, ' +
         '	gr.ds_resposta AS ds_resposta_gabarito, ' +
         '	gr.sn_discursiva, ' +
         '	gr.vl_peso, ' +
         '	a.cd_prova_aluno, ' +
         '	ar.cd_prova_aluno_resposta, ' +
         '	ar.ds_resposta AS ds_resposta_aluno, ' +
         '	ar.db_pontuacao, ' +
         '  gr.nr_parte ' +
         'FROM ' +
         '	leitora_provas_gabaritos_resp gr ' +
         '	INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = gr.cd_prova_gabarito) ' +
         '	INNER JOIN leitora_provas_alunos a ON (a.cd_prova_gabarito = g.cd_prova_gabarito) ' +
         '	INNER JOIN pessoas p ON (p.cd_pessoa = a.cd_pessoa) ' +
         '	LEFT JOIN leitora_provas_alunos_resp ar ON (ar.cd_prova_aluno = a.cd_prova_aluno AND ar.nr_questao = gr.nr_questao AND ar.nr_parte = gr.nr_parte) ' +
         'WHERE ' +
         '	g.cd_prova = :cd_prova AND ' +
         '	gr.nr_questao = :nr_questao AND ' +
         '  gr.nr_parte = :nr_parte ';
      if Trim(txtTurma.Text) <> '' then begin
         SQL.Add(' AND a.cd_turma = "' + txtTurma.Text + '"');
      end;
      SQL.Add('ORDER BY p.nm_pessoa ');
      ParamByName('cd_prova').AsInteger := qyProva.FieldByName('cd_prova').AsInteger;
      ParamByName('nr_questao').AsInteger := StrToInt(edNumeroQuestao.Text);
      ParamByName('nr_parte').AsInteger := StrToInt(edNrParte.Text);
      Open();
      if not Eof then begin
         cPeso := FieldByName('vl_peso').AsCurrency;
      end;
      iTabOrder := 0;
      slEdits := TStringList.Create();
      slNomes := TStringList.Create();
      while not Eof do begin
         if FieldByName('cd_prova_aluno_resposta').AsString = '' then begin
            with DM.qyAux3 do begin
               Close();
               SQL.Text := ' ' +
                  'INSERT INTO leitora_provas_alunos_resp( ' +
                  '  cd_prova_aluno, ' +
                  '  nr_questao, ' +
                  '  ds_resposta, ' +
                  '  cd_situacao, ' +
                  '  nr_correcao, ' +
                  '  nr_parte ' +
                  ') VALUES( ' +
                  '  :cd_prova_aluno, ' +
                  '  :nr_questao, ' +
                  '  '''', ' +
                  '  -1, ' +
                  '  1, ' +
                  '  :nr_parte ' +
                  ')';
               ParamByName('cd_prova_aluno').AsInteger := qyOperacoes.FieldByName('cd_prova_aluno').AsInteger;
               ParamByName('nr_questao').AsInteger := qyOperacoes.FieldByName('nr_questao').AsInteger;
               ParamByName('nr_parte').AsInteger := qyOperacoes.FieldByName('nr_parte').AsInteger;
               ExecSQL();
            end;
         end;

         if ( top_ant+22 > pnQuestoes.Height ) then begin
            left_ant := left_ant + 415;

            with TBevel.Create(frmCorrecaoManualPorQuestao) do begin
              Parent := pnQuestoes;
              Name := 'BevelDivisao'+IntToStr(left_ant);
              Left := left_ant-10;
              Top := 8;
              Width := 1;
              Height := top_ant-22;
              Style := bsRaised;
            end;
            top_ant  := 8;
         end;

         with TLabel.Create(frmCorrecaoManualPorQuestao) do begin
            Parent  := pnQuestoes;
            Name    := 'lbAluno_'+qyOperacoes.FieldByName('cd_prova_aluno').AsString;
            Caption := qyOperacoes.FieldByName('cd_pessoa').AsString + ' - ' + qyOperacoes.FieldByName('nm_pessoa').AsString+' (peso: '+qyOperacoes.FieldByName('vl_peso').AsString+')';
            Left    := left_ant;
            Top     := top_ant;
            Visible := True;
         end;

         with TEdit.Create(frmCorrecaoManualPorQuestao) do begin
            Parent  := pnQuestoes;
            TabOrder := iTabOrder;
            Name    := 'edAluno_'+qyOperacoes.FieldByName('cd_prova_aluno').AsString;
            Tag     := qyOperacoes.FieldByName('sn_discursiva').AsInteger;
            if Tag = 1 then begin
               Text    := qyOperacoes.FieldByName('db_pontuacao').AsString;
            end
            else begin
               Text    := qyOperacoes.FieldByName('ds_resposta_aluno').AsString;
            end;

            //Left    := left_ant + TEdit(frmCorrecaoManual.FindComponent('lbAluno_'+qyOperacoes.FieldByName('cd_pessoa').AsString)).Width + 5;
            Left := left_ant + 350;
            Top     := top_ant-2;
            Width   := 40;
            Visible := True;

            if (qyOperacoes.FieldByName('sn_discursiva').AsInteger = 1) then begin
               OnKeyPress := QuestoesDiscursivasKeyPress;
            end
            else begin
               if ( DM.VerificaeNumero(qyOperacoes.FieldByName('ds_resposta_gabarito').AsString) ) then begin
                  OnKeyPress := QuestoesSomatoriaKeyPress;
               end
               else begin
                  OnKeyPress := QuestoesAltKeyPress;
               end;
            end;

         end;
         slEdits.Add(IntToStr(iTabOrder)+'='+'edAluno_'+qyOperacoes.FieldByName('cd_prova_aluno').AsString);
         slNomes.Add(IntToStr(iTabOrder)+'='+qyOperacoes.FieldByName('cd_pessoa').AsString + ' - ' + qyOperacoes.FieldByName('nm_pessoa').AsString);

         top_ant  := top_ant + 25;
         iTabOrder := iTabOrder + 1;

         Next();
      end;
   end;

   for i := 0 to frmCorrecaoManualPorQuestao.ComponentCount-1 do begin
      if frmCorrecaoManualPorQuestao.Components[i] is TEdit then begin
         if (Pos('edAluno_', TEdit(frmCorrecaoManualPorQuestao.Components[i]).Name) > 0) AND (TEdit(frmCorrecaoManualPorQuestao.Components[i]).TabOrder = 0) then begin
            TEdit(frmCorrecaoManualPorQuestao.Components[i]).SetFocus();
         end;
      end;
   end;

end;

procedure TfrmCorrecaoManualPorQuestao.AcertosTotalKeyPress(Sender: TObject; var Key: Char);
begin
   // Total de acertos

   if ( Key <> #13 ) then begin
      Exit;
   end;

   SalvaRespostas();
end;

procedure TfrmCorrecaoManualPorQuestao.QuestoesSomatoriaKeyPress(Sender: TObject; var Key: Char);
var
   proximo_campo : string;
   novo_conteudo : string;
   i             : integer;
begin
   // Questão somatória

   if ( Key <> #13 ) then begin
      Exit;
   end;

   novo_conteudo := TEdit(Sender).Text;
   for i := Length(TEdit(Sender).Text) downto 1 do begin
       if (Pos('.', TEdit(Sender).Text) > 0) OR (Pos(',', TEdit(Sender).Text) > 0) then begin
          if ( (Copy(TEdit(Sender).Text, i, 1) = '0') OR (Copy(TEdit(Sender).Text, i, 1) = '.') OR (Copy(TEdit(Sender).Text, i, 1) = ',') ) then begin
             novo_conteudo := Copy(TEdit(Sender).Text, 1, i-1);
          end
          else begin
             break;
          end;
       end;
   end;
   TEdit(Sender).Text := novo_conteudo;
   
  try
     proximo_campo := slEdits.Values[IntToStr(TEdit(Sender).TabOrder+1)];
     TEdit(frmCorrecaoManualPorQuestao.FindComponent(proximo_campo)).SetFocus();
     TEdit(frmCorrecaoManualPorQuestao.FindComponent(proximo_campo)).SelectAll();
  except
     SalvaRespostas();
  end;
end;

procedure TfrmCorrecaoManualPorQuestao.QuestoesAltKeyPress(Sender: TObject; var Key: Char);
const
   letras : array[1..9] of char = ('A','B','C','D','E','F','G','H','I');
var
   proximo_campo : string;
begin
   // Questão múltipla escolha

   try

     if Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9'] then begin
        TEdit(Sender).Text := letras[StrToInt(Key)];
        Key := #0;
     end
     else if ( Key in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'] ) then begin
        TEdit(Sender).Text := UpperCase(Key);
        Key := #0;
     end;

     try
        proximo_campo := slEdits.Values[IntToStr(TEdit(Sender).TabOrder+1)];
        TEdit(frmCorrecaoManualPorQuestao.FindComponent(proximo_campo)).SetFocus();
        TEdit(frmCorrecaoManualPorQuestao.FindComponent(proximo_campo)).SelectAll();
     except
        SalvaRespostas();
     end;

   except
   end;
end;

procedure TfrmCorrecaoManualPorQuestao.QuestoesDiscursivasKeyPress(Sender: TObject;
  var Key: Char);
var
   proximo_campo : string;
begin
   // Questão discursiva

   if Key = #13 then begin
     try
        proximo_campo := slEdits.Values[IntToStr(TEdit(Sender).TabOrder+1)];
        TEdit(frmCorrecaoManualPorQuestao.FindComponent(proximo_campo)).SetFocus();
        TEdit(frmCorrecaoManualPorQuestao.FindComponent(proximo_campo)).SelectAll();
     except
        SalvaRespostas();
     end;
   end;
end;

procedure TfrmCorrecaoManualPorQuestao.SalvaRespostas();
var
   i : integer;
   edQuestao : TEdit;
   sMsg : string;
begin

   for i := 0 to frmCorrecaoManualPorQuestao.ComponentCount-1 do begin
     if ( Pos('edAluno_', frmCorrecaoManualPorQuestao.Components[i].Name) > 0 ) then begin
        edQuestao := TEdit(frmCorrecaoManualPorQuestao.Components[i]);

        with qyOperacoes do begin
           Close();
           if edQuestao.Tag = 1 then begin
              if edQuestao.Text = '' then begin
                 edQuestao.Text := '0';
              end;
              if StrToCurr(ReplaceStr(edQuestao.Text, ',', ',')) > cPeso then begin
                 sMsg := sMsg + ' - '+Copy(slNomes.Values[IntToStr(edQuestao.TabOrder)], Pos('_', slNomes.Values[IntToStr(edQuestao.TabOrder)])+1)+chr(13);
              end;

              if sMsg = '' then begin
                 SQL.Text := 'UPDATE leitora_provas_alunos_resp SET db_pontuacao = :db_pontuacao WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_correcao = :nr_correcao AND nr_parte = :nr_parte';
                 ParamByName('db_pontuacao').AsCurrency :=  StrToCurr(ReplaceStr(edQuestao.Text, ',', ','));
              end;
           end
           else begin
              if sMsg = '' then begin
                 SQL.Text := 'UPDATE leitora_provas_alunos_resp SET ds_resposta = :ds_resposta WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_correcao = :nr_correcao AND nr_parte = :nr_parte';
                 ParamByName('ds_resposta').AsString :=  ReplaceStr(edQuestao.Text, ',', '.');
              end;
           end;

           if sMsg = '' then begin
              //SQL.Text := 'UPDATE leitora_provas_alunos_resp SET ds_resposta = :ds_resposta WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_correcao = :nr_correcao';
              //ParamByName('ds_resposta').AsString :=  ReplaceStr(edQuestao.Text, ',', '.');
              ParamByName('cd_prova_aluno').AsInteger := StrToInt(Copy(TEdit(frmCorrecaoManualPorQuestao.Components[i]).Name, Pos('_', TEdit(frmCorrecaoManualPorQuestao.Components[i]).Name)+1));
              ParamByName('nr_questao').AsInteger := StrToInt(edNumeroQuestao.Text);
              ParamByName('nr_correcao').AsInteger := StrToInt(edQtdCorrecoes.Text);
              ParamByName('nr_parte').AsInteger := StrToInt(edNrParte.Text);
              ExecSQL();
           end;
        end;
     end;
   end;

   if sMsg <> '' then begin
      Mensagem('Os seguintes alunos estão com a pontuação acima do peso da questão:'+chr(13)+sMsg, Application.Title, MB_OK+MB_ICONEXCLAMATION);
      TEdit( FindComponent(slEdits.Values['0']) ).SetFocus();
      TEdit( FindComponent(slEdits.Values['0']) ).SelectAll();
   end
   else begin
      edNumeroQuestao.SetFocus();
      questao_selecionada := False;
      DestruirCampos();
   end;

end;

procedure TfrmCorrecaoManualPorQuestao.DestruirCampos();
var
   i : integer;
   destruir : array of string;
begin
   for i := 0 to frmCorrecaoManualPorQuestao.ComponentCount-1 do begin
      try
         if ( (Pos('lbAluno_', frmCorrecaoManualPorQuestao.Components[i].Name) > 0) OR (Pos('edAluno_', frmCorrecaoManualPorQuestao.Components[i].Name) > 0) OR (Pos('BevelDivisao', frmCorrecaoManualPorQuestao.Components[i].Name) > 0) ) then begin
            SetLength(destruir, Length(destruir)+1);
            destruir[Length(destruir)-1] := frmCorrecaoManualPorQuestao.Components[i].Name;
         end;
      except
      end;
   end;

   if ( Length(destruir) = 0 ) then begin
      Exit;
   end;

   for i := 0 to Length(destruir)-1 do begin
      if ( (Pos('lbAluno_', destruir[i]) > 0) ) then begin
         with TLabel( frmCorrecaoManualPorQuestao.FindComponent(destruir[i]) ) do begin
            Destroy;
         end;
         //FreeAndNil(lbQuestao);
      end;
      if ( (Pos('edAluno_', destruir[i]) > 0) ) then begin
         with TEdit( frmCorrecaoManualPorQuestao.FindComponent(destruir[i]) ) do begin
            Destroy;
         end;
         //FreeAndNil(edQuestao);
      end;
      if ( (Pos('BevelDivisao', destruir[i]) > 0) ) then begin
         with TEdit( frmCorrecaoManualPorQuestao.FindComponent(destruir[i]) ) do begin
            Destroy;
         end;
         //FreeAndNil(edQuestao);
      end;
   end;

   Application.ProcessMessages;
end;

procedure TfrmCorrecaoManualPorQuestao.FiltraQuestao();
begin
   questao_selecionada := False;

   if (not prova_selecionada) then begin
      Mensagem('Selecione uma prova !', Application.Title, MB_OK + MB_ICONERROR);
      edCodProva.SelectAll();
      Exit;
   end;

   with DM.qyAux do begin
      Close();
      SQL.Text := 'SELECT * FROM leitora_provas_gabaritos_resp gr INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = gr.cd_prova_gabarito) WHERE g.cd_prova = :cd_prova AND gr.nr_questao = :nr_questao AND gr.nr_parte = :nr_parte';
      ParamByName('cd_prova').AsInteger := StrToInt(edCodProva.Text);
      ParamByName('nr_parte').AsInteger := StrToInt(edNrParte.Text);

      try
        ParamByName('cd_prova').AsInteger := qyProva.FieldByName('cd_prova').AsInteger;
        ParamByName('nr_questao').AsInteger := StrToInt(edNumeroQuestao.Text);
      except
         Mensagem('O número da questão deve ser numérico !', Application.Title, MB_OK + MB_ICONERROR);
         edNumeroQuestao.SelectAll();
         Exit;
      end;

      Open();
   end;

   if ( DM.qyAux.Eof ) then begin
      Mensagem('Questão inexistente ou não faz parte desta prova !', Application.Title, MB_OK + MB_ICONERROR);
      edNumeroQuestao.SelectAll();
      Exit;
   end;

   questao_selecionada := True;

   GeraCamposPessoas();
end;

procedure TfrmCorrecaoManualPorQuestao.SpeedButton1Click(Sender: TObject);
begin

   frmSelProva.ShowModal;
   if frmSelProva.flgSearch then begin
      edNumeroQuestao.Text := '';
      questao_selecionada := False;
      DestruirCampos();

      prova_selecionada := False;

      edCodProva.Text := IntToStr(frmSelProva.qyProva.FieldByName('cd_prova').AsInteger);
      FiltraProva();
   end;

end;

procedure TfrmCorrecaoManualPorQuestao.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro_turma : TResultadoFiltroTurma;
begin
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro_turma.filtrado then
   begin
      txtTurma.Text := resultado_filtro_turma.cd_turma;
   end;
end;

procedure TfrmCorrecaoManualPorQuestao.updnNrParteChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
var
   IParte: Integer;
begin
   if updnNrParte.Tag <> 1 then Exit;

   AllowChange := provaSelecionada <> nil;
   if AllowChange then
   begin
      IParte := StrToInt(edNrParte.Text);
      if (Direction = updUp) AND (IParte < provaSelecionada.QuantidadePartesGabarito) then
      begin
         Inc(IParte);
      end else if (Direction = updDown) AND (IParte > 1) then
      begin
         Dec(IParte);
      end;
      edNrParte.Text := IntToStr(IParte);
   end else begin
      Mensagem('Você deve selecionar uma prova.');
   end;
end;

procedure TfrmCorrecaoManualPorQuestao.updnNrParteMouseEnter(Sender: TObject);
begin
   updnNrParte.Tag := 1;
end;

procedure TfrmCorrecaoManualPorQuestao.updnNrParteMouseLeave(Sender: TObject);
begin
   updnNrParte.Tag := 0;
end;

procedure TfrmCorrecaoManualPorQuestao.btnFecharClick(Sender: TObject);
begin
   Close();
end;

end.
