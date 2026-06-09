unit ufPIntGeracao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, DBCtrls, Buttons, DB,
   ZAbstractRODataset, ZDataset, UZDataset, uDM, ZAbstractDataset;

type
   TfPIntGeracao = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      ilImagens: TImageList;
      tlbAcoes: TToolBar;
      btnSep1: TToolButton;
      btnSair: TToolButton;
      btnSep2: TToolButton;
      bvlSep3: TBevel;
      pnlProva: TPanel;
      pnlProvaTit: TPanel;
      bvlSep4: TBevel;
      gbProva: TGroupBox;
      lblProvaCod: TLabel;
      lblProvaAnoSem: TLabel;
      lblProvaData: TLabel;
      lblProvaTitulo: TLabel;
      dbtProvaCod: TDBText;
      dbtProvaAnoSem: TDBText;
      dbtProvaTitulo: TDBText;
      dbtProvaData: TDBText;
      pnlGeracao: TPanel;
      pnlGeracaoTit: TPanel;
      bvlSep5: TBevel;
      rgOpcoesGeracao: TRadioGroup;
      gbEnsalamento: TGroupBox;
      cbRegraEnsala: TComboBox;
      lblSalas: TLabel;
      lbSalas: TListBox;
      sbAdSala: TSpeedButton;
      sbExSala: TSpeedButton;
      sbLimpaSala: TSpeedButton;
      lblAlunos: TLabel;
      lbAlunos: TListBox;
      sbAdAluno: TSpeedButton;
      sbExAluno: TSpeedButton;
      sbLimpaAluno: TSpeedButton;
      sbSelecionarProva: TSpeedButton;
    sbSelecionarQuestoes1: TSpeedButton;
      bvlSep6: TBevel;
      sbGerarProvas: TSpeedButton;
      lblStatus: TLabel;
      qryEnsalamento: TUMZReadOnlyQuery;
      qryNumQuestoes: TUMZReadOnlyQuery;
      dsProvas: TDataSource;
      qryProvas: TUMZQuery;
      qryProvasCD_PROVA: TLargeintField;
      qryProvasDS_PROVA: TStringField;
      qryProvasNR_ANOSEMESTRE: TIntegerField;
      qryProvasDT_PROVA: TDateTimeField;
      qryProvasSN_CREDITO: TSmallintField;
      qryProvasNOME: TStringField;
    qryProvasULTIMA_GERACAO_PRIMEIRA: TStringField;
      qryEnsalamentoCD_REGRA_ENSALAMENTO: TLargeintField;
      qryEnsalamentoNM_REGRA: TStringField;
      qryEnsalamentoDT_REGRA: TDateTimeField;
      qryEnsalamentoNR_ANOSEMESTRE: TSmallintField;
    qryNumQuestoesNR_QUESTOES_DISCIPLINAS: TIntegerField;
    qryNumQuestoesCD_TURMA: TStringField;
    qryNumQuestoesCD_DISCIPLINA: TLargeintField;
    qryNumQuestoesDESCRICAO: TStringField;
    qryNumQuestoesNR_CREDITOS: TLargeintField;
    qryNumQuestoesNR_QUESTOES: TLargeintField;
    sbSelecionarQuestoes2: TSpeedButton;
    lblProvaGeracao: TLabel;
    dbtProvaGeracao1: TDBText;
    dbtProvaGeracao2: TDBText;
    qryProvasDT_ULTIMA_GERACAO_PRIMEIRA: TDateTimeField;
    qryProvasDT_ULTIMA_GERACAO_SEGUNDA: TDateTimeField;
    qryProvasULTIMA_GERACAO_SEGUNDA: TStringField;
    qryNumQuestoesSemCredito: TUMZReadOnlyQuery;
    qryProvasNR_MINIMO_COORDENADOR: TSmallintField;
    qryProvasNR_MAXIMO_COORDENADOR: TSmallintField;
    qryNumQuestoesSemCreditocd_turma: TStringField;
    qryNumQuestoesSemCreditocd_disciplina: TIntegerField;
    qryNumQuestoesSemCreditods_disciplina: TStringField;
    qryNumQuestoesSemCreditototal_prova: TLargeintField;
    qryNumQuestoesSemCreditototal_not_prova: TLargeintField;
    qryNumQuestoesSemCreditototal: TLargeintField;
    qryNumQuestoesSemCreditoaprovadas_coordenador: TLargeintField;
    qryNumQuestoesSemCreditonao_aprovadas_coordenador: TLargeintField;
    qryNumQuestoesSemCreditocd_pessoa: TIntegerField;
    qryNumQuestoesSemCreditonm_pessoa: TStringField;
    qryNumQuestoesSemCreditonr_creditos_academicos: TLargeintField;
    qryEnsalamentoSN_SEGUNDA_CHAMADA: TSmallintField;
    qryProvasCD_USUARIO_GERACAO_PRIMEIRA: TIntegerField;
    qryProvasCD_USUARIO_GERACAO_SEGUNDA: TIntegerField;
    qryProvasNOME_SEGUNDA: TStringField;
    dbtProvaNmPessoa: TDBText;
    dbtProvaNmPessoaSegunda: TDBText;
    lbSeparador1: TLabel;
    lbSeparador2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarQuestoes2Click(Sender: TObject);
    procedure lbAlunosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbAlunosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbSalasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSalasDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure sbGerarProvasClick(Sender: TObject);
      procedure sbLimpaAlunoClick(Sender: TObject);
      procedure sbExAlunoClick(Sender: TObject);
      procedure sbAdAlunoClick(Sender: TObject);
      procedure sbLimpaSalaClick(Sender: TObject);
      procedure sbExSalaClick(Sender: TObject);
      procedure sbAdSalaClick(Sender: TObject);
      procedure lbAlunosDrawItem(Control: TWinControl; Index: Integer;
         Rect: TRect; State: TOwnerDrawState);
      procedure lbSalasDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
         State: TOwnerDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnSairClick(Sender: TObject);
      procedure sbSelecionarQuestoes1Click(Sender: TObject);
      procedure rgOpcoesGeracaoClick(Sender: TObject);
      procedure cbRegraEnsalaSelect(Sender: TObject);
      procedure dsProvasDataChange(Sender: TObject; Field: TField);
      procedure sbSelecionarProvaClick(Sender: TObject);
      procedure qryProvasCalcFields(DataSet: TDataSet);
   private
      function IsLiberarPendencias( sn_credito : integer ) :  boolean;
   end;

var
  fPIntGeracao: TfPIntGeracao;

implementation

{$R *.dfm}

uses
   uFPintBuscaProva, uFPIntBuscaPessoas, uFPintBuscaSalas, General;

{$I consts.inc}

procedure TfPIntGeracao.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPIntGeracao.cbRegraEnsalaSelect(Sender: TObject);
begin
   if cbRegraEnsala.ItemIndex > 0 then
   begin
      rgOpcoesGeracao.ItemIndex  := -1;
      rgOpcoesGeracao.Enabled    := true;

      qryEnsalamento.GotoBookmark(
         Pointer(cbRegraEnsala.Items.Objects[cbRegraEnsala.ItemIndex]));
   end;
end;

procedure TfPIntGeracao.dsProvasDataChange(Sender: TObject; Field: TField);

   procedure CarregaRegrasEnsalamento;
   begin

      cbRegraEnsala.Clear;
      qryEnsalamento.Close;
      qryEnsalamento.ParamByName('CD_PROVA').AsInteger := qryProvasCD_PROVA.AsInteger;
      qryEnsalamento.Open;

      if not qryEnsalamento.IsEmpty then
      begin

         cbRegraEnsala.Items.BeginUpdate;
         cbRegraEnsala.AddItem('(SELECIONE)', nil);

         while not qryEnsalamento.Eof do
         begin

            if qryProvasDT_ULTIMA_GERACAO_SEGUNDA.IsNull then
            begin

               if qryEnsalamentoSN_SEGUNDA_CHAMADA.asinteger = 0 then
               begin

                  cbRegraEnsala.AddItem (
                  qryEnsalamentoNM_REGRA.AsString,
                  qryEnsalamento.GetBookmark
                  );

               end;

            end
            else
            begin

               cbRegraEnsala.AddItem (
               qryEnsalamentoNM_REGRA.AsString,
               qryEnsalamento.GetBookmark
               );

            end;

            qryEnsalamento.Next;
         end;

         cbRegraEnsala.Items.EndUpdate;
         cbRegraEnsala.ItemIndex := 0;
         cbRegraEnsalaSelect(nil);

      end;
      
   end;

begin
   sbSelecionarQuestoes1.Enabled := true;
   gbEnsalamento.Enabled := not qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.IsNull;
   rgOpcoesGeracao.Enabled := false;
   lbSalas.Enabled := false;
   lbAlunos.Enabled := false;
   sbAdSala.Enabled := false;
   sbExSala.Enabled := false;
   sbLimpaSala.Enabled := false;
   sbAdAluno.Enabled := false;
   sbExAluno.Enabled := false;
   sbLimpaAluno.Enabled := false;
   sbGerarProvas.Enabled := false;
   CarregaRegrasEnsalamento;

end;

procedure TfPIntGeracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfPIntGeracao.FormCreate(Sender: TObject);
begin
   lbSeparador1.Visible := false;
   lbSeparador2.Visible := false;
end;

function TfPIntGeracao.IsLiberarPendencias( sn_credito : integer ) : boolean;
var
   LSTurmasDisc: string;
   iErros : integer;
begin
   if ( sn_credito = 1 ) then
   begin
      { testa baseado no credito }
      qryNumQuestoes.Close;
      qryNumQuestoes.ParamByName('CD_PROVA').AsInteger := qryProvasCD_PROVA.AsInteger;
      qryNumQuestoes.Open;
      Result := qryNumQuestoes.IsEmpty;

      if not Result then
      begin
        LSTurmasDisc := '';
        while not qryNumQuestoes.Eof do
        begin
           LSTurmasDisc :=
              LSTurmasDisc +
              Format(S_MASC_TURMADISC,
                 [qryNumQuestoesCD_TURMA.AsString,
                  qryNumQuestoesDESCRICAO.AsString]) + CR;
           if qryNumQuestoes.RecNo > 9 then Break;
           qryNumQuestoes.Next;
        end;
        if qryNumQuestoes.RecordCount > 10 then
           LSTurmasDisc := LSTurmasDisc + S_OUTRAS_DISC + CR;
        qryNumQuestoes.Close;
        Result := Mensagem(Format(S_QUEST_LIBERAR, [LSTurmasDisc]), 'Atenção!', MSG_ICONS_QUEST, Handle) = ID_YES;
      end;
   end
   else
   begin
     { testa se tem a quantidade correta cadastrada para cada coordenador }
     qryNumQuestoesSemCredito.close;
     qryNumQuestoesSemCredito.ParamByName('param_cd_prova').asinteger :=  qryProvasCD_PROVA.AsInteger;
     qryNumQuestoesSemCredito.Open;

     Result := qryNumQuestoesSemCredito.IsEmpty;

     iErros := 0;

     if not Result then
     begin

        while not qryNumQuestoesSemCredito.Eof do
        begin

          if qryNumQuestoesSemCreditoAPROVADAS_COORDENADOR.AsInteger < qryProvasNR_MINIMO_COORDENADOR.AsInteger then
          begin
                        LSTurmasDisc :=
              LSTurmasDisc +
              Format(S_MASC_TURMADISC,
                 [qryNumQuestoesSemCreditoCD_TURMA.asString,
                  qryNumQuestoesSemCreditoDS_DISCIPLINA.AsString]) + CR;

              iErros := iErros + 1;

              if iErros > 9 then
              begin
                Break;
              end;

          end;

          qryNumQuestoesSemCredito.Next;

        end;

        if iErros > 9 then
        begin
           LSTurmasDisc := LSTurmasDisc + S_OUTRAS_DISC + CR;
        end;

        qryNumQuestoesSemCredito.Close;

        if iErros >= 1 then
        begin
          Result := Mensagem(Format(S_QUEST_LIBERAR, [LSTurmasDisc]), 'Atenção!', MSG_ICONS_QUEST, Handle) = ID_YES;
        end
        else
        begin
           Result := true;
        end;

     end;

   end;
end;

procedure TfPIntGeracao.lbAlunosDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   if lbAlunos.Items.IndexOf(fPIntBuscaPessoas.qryPessoascd_pessoa.AsString) = -1 then
   begin
      lbAlunos.Items.Values[fPIntBuscaPessoas.qryPessoascd_pessoa.AsString] :=
         fPIntBuscaPessoas.qryPessoasnm_pessoa.AsString;
      rgOpcoesGeracaoClick(nil);
   end;
end;

procedure TfPIntGeracao.lbAlunosDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   if (fPintBuscaPessoas <> nil) and fPintBuscaPessoas.Visible then
      Accept := Source = fPIntBuscaPessoas.dbgPessoas
   else
     Accept := false;
end;

procedure TfPIntGeracao.lbAlunosDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
   lbAlunos.Canvas.TextOut(Rect.Left + 2, Rect.Top, lbAlunos.Items.ValueFromIndex[Index]);
end;

procedure TfPIntGeracao.lbSalasDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
   if lbSalas.Items.IndexOf(fPintBuscaSalas.qrySalasds_sala.AsString) = -1 then
   begin
      lbSalas.Items.Values[fPintBuscaSalas.qrySalascd_sala.AsString] :=
         fPintBuscaSalas.qrySalasds_sala.AsString;
      rgOpcoesGeracaoClick(nil);
   end;
end;

procedure TfPIntGeracao.lbSalasDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   if (fPintBuscaSalas <> nil) and fPintBuscaSalas.Visible then
      Accept := Source = fPintBuscaSalas.dbgSalas
   else
     Accept := false;
end;

procedure TfPIntGeracao.lbSalasDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
   lbSalas.Canvas.TextOut(Rect.Left + 2, Rect.Top, lbSalas.Items.ValueFromIndex[Index]);
end;

procedure TfPIntGeracao.qryProvasCalcFields(DataSet: TDataSet);
begin

   lbSeparador1.Visible := false;
   lbSeparador2.Visible := false;


   if qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.IsNull then
   begin

      qryProvasULTIMA_GERACAO_PRIMEIRA.AsString := 'A prova ainda não foi gerada';
      dbtProvaGeracao1.Font.Color := clRed;

      sbSelecionarQuestoes2.Enabled := False;

         lbSeparador1.Visible := false;
         lbSeparador2.Visible := false;


   end
   else
   begin

      qryProvasULTIMA_GERACAO_PRIMEIRA.AsString :=
         Format(S_MASC_GERACAO, [qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.AsString, qryProvasNOME.AsString]);
      dbtProvaGeracao1.Font.Color := clGreen;

      sbSelecionarQuestoes2.Enabled := true;

      lbSeparador1.Visible := true;
      lbSeparador2.Visible := false;


   end;

   if qryProvasDT_ULTIMA_GERACAO_SEGUNDA.IsNull then
   begin
      qryProvasULTIMA_GERACAO_SEGUNDA.AsString := 'A prova ainda não foi gerada';
      dbtProvaGeracao2.Font.Color := clRed;

      lbSeparador2.Visible := false;


   end
   else
   begin
      qryProvasULTIMA_GERACAO_SEGUNDA.AsString :=
         Format(S_MASC_GERACAO, [qryProvasDT_ULTIMA_GERACAO_SEGUNDA.AsString, qryProvasNOME.AsString]);
      dbtProvaGeracao2.Font.Color := clGreen;

      lbSeparador1.Visible := true;
      lbSeparador2.Visible := true;


   end;


end;

procedure TfPIntGeracao.rgOpcoesGeracaoClick(Sender: TObject);
begin
   lbSalas.Enabled := rgOpcoesGeracao.ItemIndex = 1;
   lbAlunos.Enabled := rgOpcoesGeracao.ItemIndex = 2;
   sbAdSala.Enabled := rgOpcoesGeracao.ItemIndex = 1;
   sbExSala.Enabled := (rgOpcoesGeracao.ItemIndex = 1) and (lbSalas.Count > 0);
   sbLimpaSala.Enabled := (rgOpcoesGeracao.ItemIndex = 1) and (lbSalas.Count > 0);
   sbAdAluno.Enabled := rgOpcoesGeracao.ItemIndex = 2;
   sbExAluno.Enabled := (rgOpcoesGeracao.ItemIndex = 2) and (lbAlunos.Count > 0);
   sbLimpaAluno.Enabled := (rgOpcoesGeracao.ItemIndex = 2) and (lbAlunos.Count > 0);
   sbGerarProvas.Enabled :=
      (rgOpcoesGeracao.ItemIndex = 0) or
      ((rgOpcoesGeracao.ItemIndex = 1) and (lbSalas.Count > 0)) or
      ((rgOpcoesGeracao.ItemIndex = 2) and (lbAlunos.Count > 0));
end;

procedure TfPIntGeracao.sbAdAlunoClick(Sender: TObject);
begin
   if Screen.Width >= (Width + 605) then
   begin
      if (Left + Width + 605) > Screen.Width then
         Left := Screen.Width - Width - 605;
   end
   else
      Left := 0;
   TfPIntBuscaPessoas.GetPessoas(
      qryEnsalamentoCD_REGRA_ENSALAMENTO.AsInteger,
      qryProvasds_prova.AsString);
end;

procedure TfPIntGeracao.sbAdSalaClick(Sender: TObject);
begin
   if Screen.Width >= (Width + 500) then
   begin
      if (Left + Width + 500) > Screen.Width then
         Left := Screen.Width - Width - 500;
   end
   else
      Left := 0;      
   TfPintBuscaSalas.GetSalas(
      qryEnsalamentoCD_REGRA_ENSALAMENTO.AsInteger,
      qryProvasDS_PROVA.AsString);
end;

procedure TfPIntGeracao.sbExAlunoClick(Sender: TObject);
begin
   lbAlunos.DeleteSelected;
   rgOpcoesGeracaoClick(nil);
end;

procedure TfPIntGeracao.sbExSalaClick(Sender: TObject);
begin
   lbSalas.DeleteSelected;
   rgOpcoesGeracaoClick(nil);
end;

procedure TfPIntGeracao.sbGerarProvasClick(Sender: TObject);
var
   I: integer;
   snSnSegundaChamada : integer;

begin
   snSnSegundaChamada := 0;

   if Mensagem(S_QUEST_RECRIAR, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES then
   begin

      snSnSegundaChamada := qryEnsalamentoSN_SEGUNDA_CHAMADA.AsInteger;

      lblStatus.Caption := S_RECRIANDO_PROVAS;
      lblStatus.Visible := true;
      Application.ProcessMessages;

      case rgOpcoesGeracao.ItemIndex of
         0:
            DM.db.ExecuteDirect(Format(S_SP_PROVAS_TODOS, [qryEnsalamentoCD_REGRA_ENSALAMENTO.AsLargeInt, snSnSegundaChamada ]));
         1:
            for I := 0 to lbSalas.Count - 1 do
               DM.db.ExecuteDirect(Format(S_SP_PROVAS_SALA, [qryEnsalamentoCD_REGRA_ENSALAMENTO.AsLargeInt, lbSalas.Items.Names[I], snSnSegundaChamada ]));
         2:
            for I := 0 to lbAlunos.Count - 1 do
               DM.db.ExecuteDirect(Format(S_SP_PROVAS_ALUNO, [lbAlunos.Items.Names[I], qryProvasCD_PROVA.AsLargeInt, snSnSegundaChamada ]));
      end;

      lblStatus.Visible := false;
      Application.ProcessMessages;
      Mensagem(S_FINALIZADO_PROVAS, S_TITULO_INFO, MSG_ICONS_INFO, Handle);

   end;
end;

procedure TfPIntGeracao.sbLimpaAlunoClick(Sender: TObject);
begin
   lbAlunos.Clear;
   rgOpcoesGeracaoClick(nil);
end;

procedure TfPIntGeracao.sbLimpaSalaClick(Sender: TObject);
begin
   lbSalas.Clear;
   rgOpcoesGeracaoClick(nil);
end;

procedure TfPIntGeracao.sbSelecionarProvaClick(Sender: TObject);
var
   LICodProva: integer;
begin
   LICodProva := TfPIntBuscaProvas.GetProva(Self);
   if LICodProva <> -1 then
   begin
      if not qryProvas.Active then qryProvas.Open
      else if qryProvasCD_PROVA.AsInteger <> LICodProva then
      begin
         lbSalas.Clear;
         lbAlunos.Clear;
      end;
      qryProvas.Locate('CD_PROVA', LICodProva, []);
   end;
end;

procedure TfPIntGeracao.sbSelecionarQuestoes1Click(Sender: TObject);
var
   LICodProva: Int64;
   LBExecutar: boolean;
   LSStoredProc: string;
begin
   if IsLiberarPendencias( qryProvasSN_CREDITO.AsInteger ) then
   begin

      LBExecutar :=
         (qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.IsNull and
          (Mensagem(S_QUEST_3, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES))
          or
         ((not qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.IsNull) and
         ((Mensagem(S_QUEST_1, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES) and
          (Mensagem(S_QUEST_2, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES)));

      if LBExecutar then
      begin
         LICodProva := qryProvasCD_PROVA.AsLargeInt;
         lblStatus.Caption := S_SELECIONANDO_QUESTOES;
         lblStatus.Visible := true;
         Application.ProcessMessages;

         if qryProvasSN_CREDITO.AsInteger = 1 then
         begin
            LSStoredProc := S_SP_QUESTOES_CCREDITO
         end
         else
         begin
            LSStoredProc := S_SP_QUESTOES_SCREDITO;
         end;

         DM.db.ExecuteDirect(
            Format(LSStoredProc,
            [qryProvasCD_PROVA.AsLargeInt,
             DM.tblUsuariosNomecodigo.AsInteger, 0]));


         Application.ProcessMessages;
         Mensagem(S_FINALIZADO_QUESTOES, S_TITULO_INFO, MSG_ICONS_INFO, Handle);
         lblStatus.Visible := false;
         Application.ProcessMessages;
         qryProvas.Refresh;

         qryProvas.Locate('CD_PROVA', LICodProva, []);
      end;
   end;
end;

procedure TfPIntGeracao.sbSelecionarQuestoes2Click(Sender: TObject);
var
   LICodProva: Int64;
   LBExecutar: boolean;
   LSStoredProc: string;
begin
   if IsLiberarPendencias( qryProvasSN_CREDITO.AsInteger ) then
   begin

      LBExecutar :=
         (qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.IsNull and
          (Mensagem(S_QUEST_3_segunda, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES))
          or
         ((not qryProvasDT_ULTIMA_GERACAO_PRIMEIRA.IsNull) and
         ((Mensagem(S_QUEST_1_segunda, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES) and
          (Mensagem(S_QUEST_2_segunda, S_TITULO_QUEST, MSG_ICONS_QUEST, Handle) = ID_YES)));

      if LBExecutar then
      begin
         LICodProva := qryProvasCD_PROVA.AsLargeInt;
         lblStatus.Caption := S_SELECIONANDO_QUESTOES;
         lblStatus.Visible := true;
         Application.ProcessMessages;

         if qryProvasSN_CREDITO.AsInteger = 1 then
         begin
            LSStoredProc := S_SP_QUESTOES_CCREDITO
         end
         else
         begin
            LSStoredProc := S_SP_QUESTOES_SCREDITO;
         end;

         DM.db.ExecuteDirect(
            Format(LSStoredProc,
            [qryProvasCD_PROVA.AsLargeInt,
             DM.tblUsuariosNomecodigo.AsInteger, 1]));


         Application.ProcessMessages;
         Mensagem(S_FINALIZADO_QUESTOES, S_TITULO_INFO, MSG_ICONS_INFO, Handle);
         lblStatus.Visible := false;
         Application.ProcessMessages;
         qryProvas.Refresh;

         qryProvas.Locate('CD_PROVA', LICodProva, []);
      end;
   end;
end;

end.
