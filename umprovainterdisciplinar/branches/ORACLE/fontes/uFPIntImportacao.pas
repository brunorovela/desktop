unit uFPIntImportacao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, ZConnection, DBCtrls, StdCtrls,
   Buttons, uPIntLeitora, Spin, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
   TfPIntImportacao = class(TForm)
      ilImagens: TImageList;
      tlbAcoes: TToolBar;
      btnSep1: TToolButton;
      btnImportar: TToolButton;
      btnSep2: TToolButton;
      btnSair: TToolButton;
      btnSep3: TToolButton;
      bvlSep3: TBevel;
      OpenDialog: TOpenDialog;
      lbArquivos: TListBox;
      lblArquivos: TLabel;
      btnLimpaArquivos: TSpeedButton;
      btnExcluiArquivo: TSpeedButton;
      gbConfig: TGroupBox;
      speTamPessoa: TSpinEdit;
      speTamId: TSpinEdit;
      lblTamPessoa: TLabel;
      lblTamId: TLabel;
      cbModelo: TComboBox;
      lblModelo: TLabel;
      btnAdicionaArquivo: TSpeedButton;
      qryQuestoesPessoa: TUMZQuery;
      qryAlternativasPessoa: TUMZQuery;
      qryUpdAlternativaQuestao: TUMZQuery;
      prbImportacao: TProgressBar;
      lblImportando: TLabel;
      pnlProva: TPanel;
      bvlSep1: TBevel;
      pnlTituloProva: TPanel;
      bvlSep2: TBevel;
      dsProvas: TDataSource;
      qryProvas: TUMZQuery;
      lblCodProva: TLabel;
      dbtCodProva: TDBText;
      dbtAnoSemProva: TDBText;
      lblAnoSemProva: TLabel;
      lblDescProva: TLabel;
      dbtDescProva: TDBText;
      dbtDataProva: TDBText;
      lblDataProva: TLabel;
      btnSelProva: TSpeedButton;
      bvlSep4: TBevel;
      pnlOpcoes: TPanel;
      pnlTituloOpcoes: TPanel;
      bvlSep5: TBevel;
      pnlTitulo: TPanel;
      qryLimpaAlternativas: TUMZQuery;
    qryProvascd_prova: TLargeintField;
    qryProvasds_prova: TStringField;
    qryProvasnr_anosemestre: TIntegerField;
    qryProvasdt_prova: TDateTimeField;
    qryProvassn_finalizada: TIntegerField;
    qryProvassn_atribuir_nota_automatico: TSmallintField;
    pnErros: TPanel;
    Label1: TLabel;
    memoErros: TMemo;
    lbNumErros: TLabel;
      procedure btnSelProvaClick(Sender: TObject);
      procedure btnSelecionaProvaClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnSairClick(Sender: TObject);
      procedure btnAdicionaArquivoClick(Sender: TObject);
      procedure btnImportarClick(Sender: TObject);
      procedure btnLimpaArquivosClick(Sender: TObject);
      procedure btnExcluiArquivoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   strict private
      FUMPIntImportacao: TUMPIntImportacao;
      procedure SalvaPreferencias;
      procedure ImportaRespostas; overload;
      procedure ImportaRespostas(const AUMPIntProva: TUMPIntProva); overload;
      procedure LimpaAlternativas(const AICodProva,AICodPessoa: integer);
      procedure AtribuirNotasProvaInterdisciplinar(const AICodProva, AICodPessoa: integer);
      procedure atualizaErros(erros:TStringList);
   end;

var
  fPIntImportacao: TfPIntImportacao;

implementation

uses
   uFPIntBuscaProva;

{$R *.dfm}

procedure TfPIntImportacao.AtribuirNotasProvaInterdisciplinar(const AICodProva, AICodPessoa: integer);
const
   SQL_ATRIBUIR_NOTAS =
      ' CALL PINT_ATRIBUIR_NOTAS_PROVA( :cd_prova, :cd_pessoa, :cd_pessoa_logada ) ';
var
   qyAtribuirNotasProvaInterdisciplinar: TUMZQuery;
begin
   DM.CriarConsulta( qyAtribuirNotasProvaInterdisciplinar );

   qyAtribuirNotasProvaInterdisciplinar.SQL.Text := SQL_ATRIBUIR_NOTAS;
   qyAtribuirNotasProvaInterdisciplinar.ParamByName('cd_prova').AsInteger := AICodProva;
   qyAtribuirNotasProvaInterdisciplinar.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
   qyAtribuirNotasProvaInterdisciplinar.ParamByName('cd_pessoa_logada').AsInteger := DM.iCdPessoaLogado;

   try
      try
         qyAtribuirNotasProvaInterdisciplinar.ExecSQL;
      except
      end;
   finally
      FreeAndNil( qyAtribuirNotasProvaInterdisciplinar );
   end;
end;

procedure TfPIntImportacao.atualizaErros(erros: TStringList);
var
   i:integer;
begin
   pnErros.Visible := false;
   memoErros.Lines.Clear;
   fPIntImportacao.Height := (fPIntImportacao.Height - pnErros.Height);

   if((erros <> nil) AND (erros.Count > 0)) then
   begin
      fPIntImportacao.Height := (fPIntImportacao.Height + pnErros.Height);
      pnErros.Visible := true;
      tlbAcoes.Top := 687;

      for i := 0 to erros.Count - 1 do
      begin
         memoErros.Lines.Add(erros.ValueFromIndex[i]);
      end;

      lbNumErros.Caption := inttostr(i);
   end;
end;

procedure TfPIntImportacao.btnAdicionaArquivoClick(Sender: TObject);
var
   I: integer;
begin
   if OpenDialog.Execute then
      for I := 0 to OpenDialog.Files.Count - 1 do
         if lbArquivos.Items.IndexOf(OpenDialog.Files.Strings[I]) = -1 then
            lbArquivos.Items.Add(OpenDialog.Files.Strings[I]);
   btnImportar.Enabled := OpenDialog.Files.Count > 0;
   btnExcluiArquivo.Enabled := OpenDialog.Files.Count > 0;
   btnLimpaArquivos.Enabled := OpenDialog.Files.Count > 0;
end;

procedure TfPIntImportacao.btnExcluiArquivoClick(Sender: TObject);
begin
   lbArquivos.DeleteSelected;
   btnImportar.Enabled := OpenDialog.Files.Count > 0;
end;

procedure TfPIntImportacao.btnLimpaArquivosClick(Sender: TObject);
begin
   lbArquivos.Clear;
   btnImportar.Enabled := true;
end;

procedure TfPIntImportacao.btnImportarClick(Sender: TObject);
const
   MSG_QUEST_IMPORTA =
      'Tem certeza que deseja executar a importação dos dados da leitora.' + #13 +
      'As informações enviadas para a prova anteriormente serão substituídas!' + #13 + #13 +
      'Deseja realmente continuar?';
   MSG_QUEST_ERRO =
      'Existem códigos de alunos com erros, deseja prosseguir com a importação?';
var
   I: integer;
   LSlDados, LSlDadosAux: TStringList;
   resultProcesso : TStringList;
begin
   if Mensagem(MSG_QUEST_IMPORTA, 'Atenção', MB_ICONQUESTION + MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
   begin
   LSlDados := TStringList.Create;
   try
      LSlDadosAux := TStringList.Create;
      try
         for I := 0 to OpenDialog.Files.Count - 1 do
         begin
            LSlDadosAux.LoadFromFile(OpenDialog.Files.Strings[I]);
            LSlDados.AddStrings(LSlDadosAux);
         end;
      finally
         FreeAndNil(LSlDadosAux);
      end;
      try
         FUMPIntImportacao :=
            TUMPIntImportacao.Create(
               speTamPessoa.Value, speTamId.Value, cbModelo.Text, LSlDados);
         resultProcesso := FUMPIntImportacao.Processa;
         atualizaErros(resultProcesso);
         if (resultProcesso.Count > 0) then
         begin
            if (Mensagem(MSG_QUEST_ERRO, 'Atenção', MB_ICONQUESTION + MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = ID_NO) then
            begin
               exit;
            end;
         end;
         ImportaRespostas;
      except
         on E: EUMPIntError do raise;
      end;
   finally
      FreeAndNil(LSlDados);
   end;
   end;
end;

procedure TfPIntImportacao.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPIntImportacao.btnSelecionaProvaClick(Sender: TObject);
begin
   qryProvas.Locate('cd_prova', TfPIntBuscaProvas.GetProva(Self), []);
end;

procedure TfPIntImportacao.btnSelProvaClick(Sender: TObject);
var
   LICodProva: integer;
begin
   LICodProva := TfPIntBuscaProvas.GetProva(Self);
   if LICodProva <> -1 then
   begin
      if not qryProvas.Active then
         qryProvas.Open;
      btnAdicionaArquivo.Enabled := qryProvas.Locate('cd_prova', LICodProva, []);
   end;
end;

procedure TfPIntImportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SalvaPreferencias;
   if Assigned(FUMPIntImportacao) then
      FreeAndNil(FUMPIntImportacao);
   qryProvas.Close;
   Action := caFree;
end;

procedure TfPIntImportacao.FormCreate(Sender: TObject);
begin
   try
      speTamPessoa.Value := StrToInt(DM.Get_Parametro_usuario_valor(speTamPessoa.Name, Name));
   except
      on E: EConvertError do
         speTamPessoa.Value := 0;
   end;
   try
      speTamId.Value := StrToInt(DM.Get_Parametro_usuario_valor(speTamId.Name, Name));
   except
      on E: EConvertError do
         speTamId.Value := 0;
   end;
//   qryProvas.Open;
   atualizaErros(nil);
end;

procedure TfPIntImportacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         btnImportarClick(nil);
      VK_F12:
         btnSairClick(nil);
   end;
end;

procedure TfPIntImportacao.ImportaRespostas;
const
   MSG_FINALIZADO = 'A importação dos dados da leitora foi finalizado.';
var
   I: integer;
begin
   prbImportacao.Max := FUMPIntImportacao.ProvasCount;
   prbImportacao.Position := 0;
   lblImportando.Visible := true;
   prbImportacao.Visible := true;
   Application.ProcessMessages;
   for I := 0 to FUMPIntImportacao.ProvasCount - 1 do
   begin
      LimpaAlternativas(qryProvascd_prova.AsInteger, FUMPIntImportacao.Provas[I].CodigoPessoa);
      ImportaRespostas(FUMPIntImportacao.Provas[I]);
      prbImportacao.StepIt;

      // Se a opção Atribuir notas automáticas estiver habilitada, então atribuimos automaticamente.
      if qryProvassn_atribuir_nota_automatico.AsInteger = 1 then
         AtribuirNotasProvaInterdisciplinar( qryProvascd_prova.AsInteger,
                                             FUMPIntImportacao.Provas[I].CodigoPessoa);
   end;

   Mensagem(MSG_FINALIZADO, 'Informação', MB_ICONINFORMATION);
   lblImportando.Visible := false;
   prbImportacao.Visible := false;
end;

procedure TfPIntImportacao.ImportaRespostas(const AUMPIntProva: TUMPIntProva);
var
   I: integer;
begin
   qryQuestoesPessoa.ParamByName('cd_prova').AsInteger :=
      qryProvas.FieldByName('cd_prova').AsInteger;
   qryQuestoesPessoa.ParamByName('cd_pessoa').AsInteger :=
      AUMPIntProva.CodigoPessoa;
   qryQuestoesPessoa.Open;
   try
      qryAlternativasPessoa.ParamByName('cd_prova').AsInteger :=
         qryProvas.FieldByName('cd_prova').AsInteger;
      qryAlternativasPessoa.ParamByName('cd_pessoa').AsInteger :=
         AUMPIntProva.CodigoPessoa;
      qryAlternativasPessoa.Open;
      try
         for I := 0 to AUMPIntProva.RespostasCount - 1 do
         begin
            if qryQuestoesPessoa.Locate('nr_ordem_questao', AUMPIntProva.Respostas[I].Numero, []) then
               if qryAlternativasPessoa.Locate('cd_prova_pessoa_questao;nr_ordem_alternativa', VarArrayOf([qryQuestoesPessoa.FieldByName('cd_prova_pessoa_questao').AsInteger, AUMPIntProva.Respostas[I].Resposta]), []) then
               begin
                  qryUpdAlternativaQuestao.ParamByName('cd_prova_pessoa_questao').AsInteger :=
                     qryQuestoesPessoa.FieldByName('cd_prova_pessoa_questao').AsInteger;
                  qryUpdAlternativaQuestao.ParamByName('cd_alternativa').AsInteger :=
                     qryAlternativasPessoa.FieldByName('cd_alternativa').AsInteger;
                  qryUpdAlternativaQuestao.ExecSQL;
               end;
         end;
      finally
         qryAlternativasPessoa.Close;
      end;
   finally
      qryQuestoesPessoa.Close;
   end;
end;

procedure TfPIntImportacao.LimpaAlternativas(const AICodProva,
  AICodPessoa: integer);
begin
   qryLimpaAlternativas.ParamByName('cd_prova').AsInteger := AICodProva;
   qryLimpaAlternativas.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
   qryLimpaAlternativas.ExecSQL;
end;

procedure TfPIntImportacao.SalvaPreferencias;
begin
   DM.Set_Parametro_usuario(speTamPessoa, Name);
   DM.Set_Parametro_usuario(speTamId, Name);
end;

end.

