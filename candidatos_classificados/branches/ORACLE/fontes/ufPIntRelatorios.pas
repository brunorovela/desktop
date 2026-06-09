unit ufPIntRelatorios;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, DBCtrls, Buttons,
   uDM, DB, ZAbstractRODataset, ZDataset, UZDataset, ZAbstractDataset, General,
   Main, UCrpe32;

type
   TfPIntRelatorios = class(TForm)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnImprimir: TToolButton;
      btnConfigurar: TToolButton;
      btnSep2: TToolButton;
      btnPDF: TToolButton;
      btnSep3: TToolButton;
      btnSair: TToolButton;
      btnSep4: TToolButton;
      ilImagens: TImageList;
      bvlSep2: TBevel;
      pnlGeral: TPanel;
      pnlRelatorios: TPanel;
      splSep: TSplitter;
      pnlRelTitulo: TPanel;
      bvlSep3: TBevel;
      tvRelatorios: TTreeView;
      pnlFiltros: TPanel;
      pnlFiltrosTit: TPanel;
      bvlSep5: TBevel;
      gbProva: TGroupBox;
      lblProvaTit: TLabel;
      lblProvaCod: TLabel;
      lblProvaAnoSem: TLabel;
      lblProvaData: TLabel;
      dbtProvaCod: TDBText;
      dbtProvaAnoSem: TDBText;
      dbtProvaTit: TDBText;
      dbtProvaData: TDBText;
      sbSelProva: TSpeedButton;
      lblEnsalamento: TLabel;
      cbEnsalamento: TComboBox;
      lblSalas: TLabel;
      lbSalas: TListBox;
    sbAdSala: TSpeedButton;
    sbExSala: TSpeedButton;
    sbLimpaSala: TSpeedButton;
      qryRelatorios: TUMZReadOnlyQuery;
      qryRelatoriosNM_RELATORIO: TStringField;
      qryRelatoriosCD_MODULO: TIntegerField;
      qryRelatoriosCD_CABECALHO: TIntegerField;
      qryRelatoriosDS_GRUPO: TStringField;
      qryRelatoriosNM_ARQUIVO: TStringField;
      qryRelatoriosDS_PARAMETROS: TStringField;
      qryRelatoriosDS_FORMULA: TMemoField;
      qryRelatoriosDS_SQL_EXP: TMemoField;
      qryRelatoriosDS_ESPECIAL: TMemoField;
      qryRelatoriosDS_ORDEM: TStringField;
      qryRelatoriosSN_DISPONIVEL: TStringField;
      qryRelatoriosDS_FORMULA_GRUPO: TStringField;
      qryRelatoriosDS_SQL: TMemoField;
      qryRelatoriosDS_SQL_ORDEM: TStringField;
      qryRelatoriosSN_IMPRESSAO_NUMERO: TStringField;
      qryRelatoriosDS_VARIAVEIS: TStringField;
      qryProvas: TUMZQuery;
      dsProvas: TDataSource;
      qryProvasCD_PROVA: TLargeintField;
      qryProvasDS_PROVA: TStringField;
      qryProvasNR_ANOSEMESTRE: TIntegerField;
      qryProvasDT_PROVA: TDateTimeField;
      qryProvasSN_FINALIZADA: TIntegerField;
      qryRegrasEnsalamento: TUMZQuery;
      qryRegrasEnsalamentoCD_REGRA_ENSALAMENTO: TLargeintField;
      qryRegrasEnsalamentoCD_PROVA: TLargeintField;
      qryRegrasEnsalamentoNM_REGRA: TStringField;
      qryRegrasEnsalamentoDT_REGRA: TDateTimeField;
      qryRegrasEnsalamentoNR_ANOSEMESTRE: TSmallintField;
      qryRegrasEnsalamentoCD_LOGICA: TSmallintField;
      qryRegrasEnsalamentoCD_ORDENACAO: TSmallintField;
      sdlgPdf: TSaveDialog;
      lbAlunos: TListBox;
    sbAdPessoa: TSpeedButton;
    sbExPessoa: TSpeedButton;
    sbLimpaPessoa: TSpeedButton;
      lblAlunos: TLabel;
      rgGeracao: TRadioGroup;
    qryRelatoriosCD_RELATORIO: TLargeintField;
    procedure lbAlunosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbAlunosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sbAdPessoaClick(Sender: TObject);
    procedure sbLimpaSalaClick(Sender: TObject);
    procedure sbExSalaClick(Sender: TObject);
    procedure sbAdSalaClick(Sender: TObject);
    procedure lbSalasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSalasDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure rgGeracaoClick(Sender: TObject);
      procedure sbLimpaPessoaClick(Sender: TObject);
      procedure sbExPessoaClick(Sender: TObject);
      procedure lbAlunosDrawItem(Control: TWinControl; Index: Integer;
         Rect: TRect; State: TOwnerDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnSairClick(Sender: TObject);
      procedure btnConfigurarClick(Sender: TObject);
      procedure btnPDFClick(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
      procedure tvRelatoriosMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure FormCreate(Sender: TObject);
      procedure lbSalasDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
         State: TOwnerDrawState);
      procedure cbEnsalamentoSelect(Sender: TObject);
      procedure dsProvasDataChange(Sender: TObject; Field: TField);
      procedure sbSelProvaClick(Sender: TObject);
   private
      FBPdf: boolean;
      procedure CarregaRelatorios;
      function Imprime(const AICodCabecalho: integer; const ASNomeArquivo,
         ASFormulaGrupo, ASFormulaSelecao: string;
         const ASlOrdenacao: TStringList): boolean;
   end;

var
  fPIntRelatorios: TfPIntRelatorios;

implementation

{$R *.dfm}

uses
   uFPIntBuscaProva, uFPintBuscaSalas, uFPIntBuscaPessoas;

{ TfPIntRelatorios }

procedure TfPIntRelatorios.btnConfigurarClick(Sender: TObject);
begin
   PrincipalForm.GetRelatorio.Printer.Prompt;
   PrincipalForm.GetRelatorio.Printer.SetCurrent;
end;

procedure TfPIntRelatorios.btnImprimirClick(Sender: TObject);
const
   REL_FORMULA_SALAS =
      '{pint_ensalamento.cd_sala} in [%s] and {pint_ensalamento.cd_regra_ensalamento} = %d';

   REL_FORMULA_ALUNOS =
      '{pint_ensalamento.cd_pessoa} in [%s] and {pint_ensalamento.cd_regra_ensalamento} = %d';

   REL_FORMULA_ENSALAMENTO =
      '{pint_ensalamento.cd_regra_ensalamento} = %d';
   REL_FORMULA_PROVA =
      '{pint_provas.cd_prova} = %d';
var
   I, J, LICodCabecalho, LIRegraEnsalamento: integer;
   LSlStrings, LSlOrdenacao, LSlSQLs: TStringList;
   LSFormulaSelecao, LSFormulaGrupo, LSNomeArquivo, LSOrdenacao, LSEspecial: string;
   qyExecuteDSSql: TUMZQuery;
begin
   LICodCabecalho := qryRelatoriosCD_CABECALHO.AsInteger;
   LSFormulaGrupo := qryRelatoriosDS_FORMULA_GRUPO.AsString;
   LSNomeArquivo := qryRelatoriosNM_ARQUIVO.AsString + '.rpt';
   LSEspecial := qryRelatoriosDS_ESPECIAL.AsString;

   if Trim(LSEspecial) <> '' then
      LSFormulaSelecao := LSEspecial + ' and '
   else
      LSFormulaSelecao := '';

   LSlOrdenacao := TStringList.Create;
   try
      LSOrdenacao := qryRelatoriosDS_ORDEM.AsString;
      if Trim(LSOrdenacao) <> '' then
         SplitString(LSOrdenacao, ';', LSlOrdenacao);
   finally
      FreeAndNil(LSlOrdenacao);
   end;

   LIRegraEnsalamento := qryRegrasEnsalamentoCD_REGRA_ENSALAMENTO.AsInteger;

   case rgGeracao.ItemIndex of
      0:
         if cbEnsalamento.ItemIndex = 0 then begin
            LSFormulaSelecao :=
            LSFormulaSelecao + Format(REL_FORMULA_PROVA, [qryProvasCD_PROVA.AsInteger]);
         end
         else
         begin
            LSFormulaSelecao :=
            LSFormulaSelecao + Format(REL_FORMULA_ENSALAMENTO, [LIRegraEnsalamento]);
         end;
      1:
         if lbSalas.Count > 0 then
         begin
            LSlStrings := TStringList.Create;
            for I := 0 to lbSalas.Count - 1 do
               LSlStrings.Add(lbSalas.Items.Names[I]);
            try
               LSFormulaSelecao :=
                  LSFormulaSelecao +
                  Format(REL_FORMULA_SALAS, [ConcatStrings(LSlStrings, ','), LIRegraEnsalamento]);
            finally
               FreeAndNil(LSlStrings);
            end;
         end;
      2:
         if lbAlunos.Count > 0 then
         begin
            LSlStrings := TStringList.Create;
            for I := 0 to lbAlunos.Count - 1 do
               LSlStrings.Add(lbAlunos.Items.Names[I]);
            try
               LSFormulaSelecao :=
                  LSFormulaSelecao +
                  Format(REL_FORMULA_ALUNOS, [ConcatStrings(LSlStrings, ','), LIRegraEnsalamento]);
            finally
               FreeAndNil(LSlStrings);
            end;
         end;
   end;

   if Trim(qryRelatoriosDS_SQL.AsString) <> '' then
   begin
      DM.CriarConsulta(qyExecuteDSSql);

      LSlSQLs := TStringList.Create;
      try
         SplitString(qryRelatoriosDS_SQL.AsString, ';', LSlSQLs);
         for I := 0 to LSlSQLs.Count - 1 do
         begin
            qyExecuteDSSql.SQL.Text := LSlSQLs.Strings[I];

            for J := 0 to qryProvas.Fields.Count - 1 do
            begin
               if (qyExecuteDSSql.Params.FindParam(qryProvas.Fields[J].FieldName) = nil) then
               begin
                  Continue;
               end;

               qyExecuteDSSql.ParamByName(qryProvas.Fields[J].FieldName).AsString :=
                    qryProvas.FieldByName(qryProvas.Fields[J].FieldName).AsString;
            end;

            qyExecuteDSSql.ExecSQL;
         end;
      finally
         FreeAndNil(LSlSQLs);
      end;

      FreeAndNil(qyExecuteDSSql);
   end;

   Imprime(
      LICodCabecalho, LSNomeArquivo, LSFormulaGrupo, LSFormulaSelecao,
      LSlOrdenacao);
end;

procedure TfPIntRelatorios.btnPDFClick(Sender: TObject);
begin
   FBPdf := true;
   btnImprimirClick(nil);
end;

procedure TfPIntRelatorios.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPIntRelatorios.CarregaRelatorios;
begin
   qryRelatorios.Close;
   qryRelatorios.Open;
   while not qryRelatorios.Eof do
   begin
      with  tvRelatorios.Items.AddChildObject(
               tvRelatorios.TopItem,
               qryRelatoriosNM_RELATORIO.AsString,
               qryRelatorios.GetBookmark) do
      begin
         ImageIndex := 4;
         SelectedIndex := 4;
      end;
      qryRelatorios.Next;
   end;
end;

procedure TfPIntRelatorios.cbEnsalamentoSelect(Sender: TObject);
begin
   rgGeracao.ItemIndex := -1;
   if cbEnsalamento.ItemIndex > 0 then
   begin
      qryRegrasEnsalamento.GotoBookmark(
      Pointer(cbEnsalamento.Items.Objects[cbEnsalamento.ItemIndex]));
      rgGeracao.Enabled := true;
   end
   else
   begin
      rgGeracao.Enabled := false;
   end;
end;

procedure TfPIntRelatorios.dsProvasDataChange(Sender: TObject; Field: TField);
begin
   qryRegrasEnsalamento.Close;
   qryRegrasEnsalamento.ParamByName('CD_PROVA').AsInteger := qryProvasCD_PROVA.AsInteger;
   qryRegrasEnsalamento.Open;
   cbEnsalamento.Clear;
   cbEnsalamento.AddItem('(SELECIONE)', nil);
   if not qryRegrasEnsalamento.IsEmpty then
   begin
      while not qryRegrasEnsalamento.Eof do
      begin
         cbEnsalamento.AddItem(
            qryRegrasEnsalamentoNM_REGRA.AsString,
            qryRegrasEnsalamento.GetBookmark);
         qryRegrasEnsalamento.Next;
      end;
      cbEnsalamento.ItemIndex := 0;
      cbEnsalamento.Enabled := true;
      cbEnsalamentoSelect(nil);
   end;
end;

procedure TfPIntRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryProvas.Close;
   qryRelatorios.Close;
   qryRegrasEnsalamento.Close;
   Action := caFree;
end;

procedure TfPIntRelatorios.FormCreate(Sender: TObject);
begin
   CarregaRelatorios;
//   qryProvas.Open;
end;

procedure TfPIntRelatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F7:
         if btnImprimir.Enabled then
            btnImprimirClick(nil);
      VK_F8: btnConfigurarClick(nil);
      VK_F9:
         if btnPDF.Enabled then
            btnPDFClick(nil);
   end;
end;

function TfPIntRelatorios.Imprime(const AICodCabecalho: integer;
  const ASNomeArquivo, ASFormulaGrupo, ASFormulaSelecao: string;
  const ASlOrdenacao: TStringList): boolean;
const
   S_MSG_RELEXPORTADO = 'O relatório foi exportado com sucesso para %s';
   S_MSG_ERRO = 'Não foi possível exportar o relatório: ' + #13 + '%s';
begin
   Result :=
      PrincipalForm.ImprimeRpt(ASNomeArquivo, AICodCabecalho, ASFormulaSelecao,
         ASFormulaGrupo, nil, ASlOrdenacao, nil, nil, true, false, FBPdf);
   if Result and FBPdf then
      if sdlgPdf.Execute then
      begin
         PrincipalForm.Rel.ExportOptions.FileName := sdlgPdf.FileName;
         PrincipalForm.Rel.ExportOptions.FileType := AdobeAcrobatPDF;
         PrincipalForm.Rel.ExportOptions.Destination := toFile;
         if PrincipalForm.Rel.Export then
            Mensagem(Format(S_MSG_RELEXPORTADO, [sdlgPdf.FileName]), 'Informação', MB_ICONINFORMATION, Handle)
         else
            Mensagem(Format(S_MSG_ERRO, [PrincipalForm.Rel.LastErrorString]), 'Erro', MB_ICONERROR, Handle);
      end;
   FBPdf := false;
end;

procedure TfPIntRelatorios.lbAlunosDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   if lbAlunos.Items.IndexOf(fPIntBuscaPessoas.qryPessoascd_pessoa.AsString) = -1 then
   begin
      lbAlunos.Items.Values[fPIntBuscaPessoas.qryPessoascd_pessoa.AsString] :=
         fPIntBuscaPessoas.qryPessoasnm_pessoa.AsString;
      rgGeracaoClick(nil);
   end;
end;

procedure TfPIntRelatorios.lbAlunosDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (fPIntBuscaPessoas <> nil) and fPIntBuscaPessoas.Visible then
     Accept := Source = fPIntBuscaPessoas.dbgPessoas
  else
     Accept := false;
end;

procedure TfPIntRelatorios.lbAlunosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   lbAlunos.Canvas.TextOut(Rect.Left + 2, Rect.Top, lbAlunos.Items.ValueFromIndex[Index]);
end;

procedure TfPIntRelatorios.lbSalasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   if lbSalas.Items.IndexOf(fPintBuscaSalas.qrySalascd_sala.AsString) = -1 then
   begin
      lbSalas.Items.Values[fPintBuscaSalas.qrySalascd_sala.AsString] :=
         fPintBuscaSalas.qrySalasds_sala.AsString;
      rgGeracaoClick(nil);
   end;
end;

procedure TfPIntRelatorios.lbSalasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (fPintBuscaSalas <> nil) and fPintBuscaSalas.Visible then
     Accept := Source = fPintBuscaSalas.dbgSalas
   else
     Accept := false;
end;

procedure TfPIntRelatorios.lbSalasDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
   lbSalas.Canvas.TextOut(Rect.Left + 2, Rect.Top, lbSalas.Items.ValueFromIndex[Index]);
end;

procedure TfPIntRelatorios.rgGeracaoClick(Sender: TObject);
begin
   btnImprimir.Enabled :=
      (rgGeracao.ItemIndex = 0) or
      ((rgGeracao.ItemIndex = 1) and (lbSalas.Count > 0)) or
      ((rgGeracao.ItemIndex = 2) and (lbAlunos.Count > 0));
   btnPDF.Enabled := btnImprimir.Enabled;
   sbAdSala.Enabled := rgGeracao.ItemIndex = 1;
   sbExSala.Enabled := (rgGeracao.ItemIndex = 1) and (lbSalas.Count > 0);
   sbLimpaSala.Enabled := (rgGeracao.ItemIndex = 1) and (lbSalas.Count > 0);
   sbAdPessoa.Enabled := rgGeracao.ItemIndex = 2;
   sbExPessoa.Enabled := (rgGeracao.ItemIndex = 2) and (lbAlunos.Count > 0);
   sbLimpaPessoa.Enabled := (rgGeracao.ItemIndex = 2) and (lbAlunos.Count > 0);
end;

procedure TfPIntRelatorios.sbAdPessoaClick(Sender: TObject);
begin
   if Screen.Width >= (Width + 605) then
   begin
      if (Left + Width + 605) > Screen.Width then
         Left := Screen.Width - Width - 605;
   end
   else
      Left := 0;
   TfPIntBuscaPessoas.GetPessoas(
      qryRegrasEnsalamentocd_regra_ensalamento.AsInteger,
      qryProvasds_prova.AsString);
end;

procedure TfPIntRelatorios.sbAdSalaClick(Sender: TObject);
begin
   if Screen.Width >= (Width + 500) then
   begin
      if (Left + Width + 500) > Screen.Width then
         Left := Screen.Width - Width - 500;
   end
   else
      Left := 0;
   TfPintBuscaSalas.GetSalas(
      qryRegrasEnsalamentoCD_REGRA_ENSALAMENTO.AsInteger,
      qryProvasDS_PROVA.AsString);
end;

procedure TfPIntRelatorios.sbExPessoaClick(Sender: TObject);
begin
   lbAlunos.DeleteSelected;
   rgGeracaoClick(nil);
end;

procedure TfPIntRelatorios.sbExSalaClick(Sender: TObject);
begin
   lbSalas.DeleteSelected;
   rgGeracaoClick(nil);
end;

procedure TfPIntRelatorios.sbLimpaPessoaClick(Sender: TObject);
begin
   lbAlunos.Clear;
   rgGeracaoClick(nil);
end;

procedure TfPIntRelatorios.sbLimpaSalaClick(Sender: TObject);
begin
   lbSalas.DeleteSelected;
   rgGeracaoClick(nil);
end;

procedure TfPIntRelatorios.sbSelProvaClick(Sender: TObject);
var
   LICodProva: integer;
begin
   LICodProva := TfPIntBuscaProvas.GetProva(Self);
   if LICodProva <> -1 then
   begin
      if not qryProvas.Active then
         qryProvas.Open
      else if qryProvasCD_PROVA.AsInteger <> LICodProva then
         lbSalas.Clear;
      qryProvas.Locate('CD_PROVA', LICodProva, []);
   end;

   rgGeracao.Enabled := true;
end;

procedure TfPIntRelatorios.tvRelatoriosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if tvRelatorios.GetNodeAt(X, Y) <> nil then
      if tvRelatorios.GetNodeAt(X, Y).Data <> nil then
         qryRelatorios.GotoBookmark(TBookmark(tvRelatorios.GetNodeAt(X, Y).Data));
end;

end.
