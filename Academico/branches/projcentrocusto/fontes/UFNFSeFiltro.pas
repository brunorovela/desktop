unit UFNFSeFiltro;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Spin, Buttons,
   uDM, DB, ZAbstractRODataset, UZDataset, CheckLst, General, ZAbstractDataset,
   xmldom, XMLIntf, msxmldom, XMLDoc, SOAPHTTPTrans, UNFSeDataMap, XSBuiltIns;
   
type
   TfNFSeFiltro = class(TFrame)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnFiltrar: TToolButton;
      btnSep2: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      ilImagens: TImageList;
      bvlSep2: TBevel;
      pnlResumo: TPanel;
      gbResumo: TGroupBox;
      ledTotalTitulos: TLabeledEdit;
      ledValorTotal: TLabeledEdit;
      ledValorBolsas: TLabeledEdit;
      ledValorPago: TLabeledEdit;
      bvlSep3: TBevel;
      pnlFiltros: TPanel;
      lblAnoSemestre: TLabel;
      lblDepto: TLabel;
      lblCurso: TLabel;
      lblTurma: TLabel;
      meAnoSemestre: TMaskEdit;
      udAnoSemestre: TUpDown;
      chkAnoSemestre: TCheckBox;
      cbDepto: TComboBox;
      cbCurso: TComboBox;
      cbTurma: TComboBox;
      chkParcela: TCheckBox;
      chkVencto: TCheckBox;
      chkPgto: TCheckBox;
      chkComp: TCheckBox;
      speParcelaIni: TSpinEdit;
      speParcelaFim: TSpinEdit;
      lblParcelaAte: TLabel;
      lblVenctoAte: TLabel;
      lblPgtoAte: TLabel;
      lblCompAte: TLabel;
      dtpVenctoIni: TDateTimePicker;
      dtpVenctoFim: TDateTimePicker;
      dtpPgtoIni: TDateTimePicker;
      dtpPgtoFim: TDateTimePicker;
      dtpCompIni: TDateTimePicker;
      dtpCompFim: TDateTimePicker;
      lblExcecoes: TLabel;
      lbAlunos: TListBox;
      sbAdicionaAluno: TSpeedButton;
      sbExcluiAluno: TSpeedButton;
      sbLimpaAlunos: TSpeedButton;
      lblTiposTitulo: TLabel;
      sbDesmTiposTitulo: TSpeedButton;
      sbSelTiposTitulo: TSpeedButton;
      qryDepto: TUMZReadOnlyQuery;
      qryCurso: TUMZReadOnlyQuery;
      qryTurma: TUMZReadOnlyQuery;
      qryTipoTitulo: TUMZReadOnlyQuery;
      qryTipoTituloCD_TIPO_TITULO: TIntegerField;
      qryTipoTituloDS_TIPO_TITULO: TStringField;
      clbTiposTitulo: TCheckListBox;
      qryDeptoCODIGO: TSmallintField;
      qryDeptoDESCRICAO: TStringField;
      qryCursoANOSEMESTRE: TSmallintField;
      qryCursoCODIGO: TStringField;
      qryCursoAPELIDO: TStringField;
      qryCursoDESCRICAO: TStringField;
      qryCursoDEPTO: TSmallintField;
      qryTurmaANOSEMESTRE: TSmallintField;
      qryTurmaCODIGO: TStringField;
      qryTurmaCURSO: TStringField;
      qryTurmaDESCRICAO: TStringField;
      procedure btnSalvarClick(Sender: TObject);
      procedure chkAnoSemestreClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure clbTiposTituloClickCheck(Sender: TObject);
      procedure OnChangeFilters(Sender: TObject);
      procedure meAnoSemestreChange(Sender: TObject);
      procedure sbAdicionaAlunoClick(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure sbLimpaAlunosClick(Sender: TObject);
      procedure sbExcluiAlunoClick(Sender: TObject);
      procedure lbAlunosDrawItem(Control: TWinControl; Index: Integer;
         Rect: TRect; State: TOwnerDrawState);
      procedure sbDesmTiposTituloClick(Sender: TObject);
      procedure sbSelTiposTituloClick(Sender: TObject);
      procedure chkCompClick(Sender: TObject);
      procedure chkPgtoClick(Sender: TObject);
      procedure chkVenctoClick(Sender: TObject);
      procedure chkParcelaClick(Sender: TObject);
      procedure cbTurmaSelect(Sender: TObject);
      procedure cbCursoSelect(Sender: TObject);
      procedure cbDeptoSelect(Sender: TObject);
      procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
   private
      procedure CarregaCursos;
      procedure CarregaTurmas;
      procedure MontaFiltros;
   public
      procedure CarregaDeptos;
      procedure CarregaTiposTitulo;
  end;

implementation

uses
   UFNFSeBuscaPessoa, UFNFSeWS;

const
   SDefaultComboItem = '(TODOS)';

{$R *.dfm}

procedure TfNFSeFiltro.btnCancelarClick(Sender: TObject);
begin
   Visible := False;
   fNFSeWS.ShowCad;
end;

procedure TfNFSeFiltro.btnFiltrarClick(Sender: TObject);
var
   TotalBruto, TotalBolsas, TotalPago: Currency;
begin
   MontaFiltros;
   fNFSeWS.qryTitulos.Open;
   
   TotalBruto := 0;
   TotalBolsas := 0;
   TotalPago := 0;

   while not fNFSeWS.qryTitulos.Eof do
   begin
      TotalBruto := TotalBruto + fNFSeWS.qryTitulosValorServicos.AsFloat;
      TotalBolsas := TotalBolsas + fNFSeWS.qryTitulosValorDeducoes.AsFloat;
      TotalPago := TotalPago + fNFSeWS.qryTitulosVALORPAGO.AsFloat;
      fNFSeWS.qryTitulos.Next;
   end;

   ledTotalTitulos.Text := Format('%d', [fNFSeWS.qryTitulos.RecordCount]);
   ledValorTotal.Text := Format('%n', [TotalBruto]);
   ledValorBolsas.Text := Format('%n', [TotalBolsas]);
   ledValorPago.Text := Format('%n', [TotalPago]);
   
   btnSalvar.Enabled := True;
end;

procedure TfNFSeFiltro.btnSalvarClick(Sender: TObject);
const
   SConfirma =
      'Confirma o envio da Nota Fiscal de Serviços Eletrônica para o ' + #13 +
      'sistema da prefeitura incluindo todos os títulos filtrados?';
   SInfo =
      'Este processo pode demorar muitos minutos, aguarde tela de ' +
      'confirmação ao final do processo para voltar a utilizar o sistema.';
   SFinally =
      'Processo finalizado com sucesso!';
begin
   if Mensagem(SConfirma, 'Questionamento', MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then
   begin
      Mensagem(SInfo, 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      btnCancelar.Enabled := False;
      Enabled := False;
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      try
         fNFSeWS.Send(True);
      except
         on E: Exception do
         begin
            Screen.Cursor := crDefault;
            Enabled := True;
            btnCancelar.Enabled := True;
            btnSalvar.Enabled := False;
            Application.ProcessMessages;
            Abort;
         end;
      end;
      Screen.Cursor := crDefault;
      Enabled := True;

      Mensagem(SFinally, 'Informação', MB_OK + MB_ICONINFORMATION, Handle);

      Application.ProcessMessages;
      Visible := False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := False;
      fNFSeWS.ShowCad;
   end;
end;

procedure TfNFSeFiltro.CarregaCursos;
const
   SFilAnoSem = 'ANOSEMESTRE = %s';
   SFilDepto = 'DEPTO = %d';
   SOp = ' AND ';
var
   Filtro: string;
begin
   cbCurso.Items.BeginUpdate;
   cbCurso.Clear;
   cbCurso.AddItem(SDefaultComboItem, nil);

   Filtro := Format(SFilAnoSem, [meAnoSemestre.Text]);
   if cbDepto.ItemIndex > 0 then
      Filtro := Filtro + SOp + Format(SFilDepto, [qryDeptoCODIGO.AsInteger]);

   qryCurso.Filter := Filtro;
   if not qryCurso.Active then
      qryCurso.Open;

   qryCurso.First;
   while not qryCurso.Eof do
   begin
      cbCurso.AddItem(qryCursoCODIGO.AsString, qryCurso.GetBookmark);
      qryCurso.Next;
   end;
   cbCurso.Items.EndUpdate;
end;

procedure TfNFSeFiltro.CarregaDeptos;
begin
   cbDepto.Items.BeginUpdate;
   cbDepto.Clear;
   cbDepto.AddItem(SDefaultComboItem, nil);
   qryDepto.Close;
   qryDepto.Open;
   while not qryDepto.Eof do
   begin
      cbDepto.AddItem(qryDeptoDESCRICAO.AsString, qryDepto.GetBookmark);
      qryDepto.Next;
   end;
   cbDepto.Items.EndUpdate;
end;

procedure TfNFSeFiltro.CarregaTiposTitulo;
begin
   clbTiposTitulo.Items.BeginUpdate;
   qryTipoTitulo.Close;
   qryTipoTitulo.Open;
   while not qryTipoTitulo.Eof do
   begin
      clbTiposTitulo.AddItem(
         qryTipoTituloDS_TIPO_TITULO.AsString,
         qryTipoTitulo.GetBookmark);
      qryTipoTitulo.Next;
   end;
   clbTiposTitulo.Items.EndUpdate;
end;

procedure TfNFSeFiltro.CarregaTurmas;
const
   SFilAnoSem = 'ANOSEMESTRE = %s';
   SFilCurso = 'CURSO = %s';
   SOp = ' AND ';
var
   Filtro: string;
begin
   cbTurma.Items.BeginUpdate;
   cbTurma.Clear;
   cbTurma.AddItem(SDefaultComboItem, nil);

   Filtro := Format(SFilAnoSem, [meAnoSemestre.Text]);
   if cbCurso.ItemIndex > 0 then
      Filtro := Filtro + SOp + Format(SFilCurso,
         [QuotedStr(qryCursoCODIGO.AsString)]);

   qryTurma.Filter := Filtro;
   if not qryTurma.Active then
      qryTurma.Open;

   qryTurma.First;
   while not qryTurma.Eof do
   begin
      cbTurma.AddItem(qryTurmaCODIGO.AsString, qryTurma.GetBookmark);
      qryTurma.Next;
   end;
   cbTurma.Items.EndUpdate;
end;

procedure TfNFSeFiltro.cbCursoSelect(Sender: TObject);
begin
   if cbCurso.ItemIndex > 0 then
   begin
      qryCurso.GotoBookmark(cbCurso.Items.Objects[cbCurso.ItemIndex]);
      CarregaTurmas;
      sbAdicionaAluno.Enabled := True;
   end;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.cbDeptoSelect(Sender: TObject);
begin
   if cbDepto.ItemIndex > 0 then
      qryDepto.GotoBookmark(cbDepto.Items.Objects[cbDepto.ItemIndex]);
   CarregaCursos;
   cbTurma.Clear;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.cbTurmaSelect(Sender: TObject);
begin
   if cbTurma.ItemIndex > 0 then
   begin
      qryTurma.GotoBookmark(cbTurma.Items.Objects[cbTurma.ItemIndex]);
      sbAdicionaAluno.Enabled := True;
   end;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.chkAnoSemestreClick(Sender: TObject);
begin
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.chkCompClick(Sender: TObject);
begin
   dtpCompIni.Enabled := chkComp.Enabled;
   dtpCompFim.Enabled := chkComp.Enabled;
   lblCompAte.Enabled := chkComp.Enabled;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.chkParcelaClick(Sender: TObject);
begin
   speParcelaIni.Enabled := chkParcela.Checked;
   speParcelaFim.Enabled := chkParcela.Checked;
   lblParcelaAte.Enabled := chkParcela.Checked;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.chkPgtoClick(Sender: TObject);
begin
   dtpPgtoIni.Enabled := chkPgto.Enabled;
   dtpPgtoFim.Enabled := chkPgto.Enabled;
   lblPgtoAte.Enabled := chkPgto.Enabled;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.chkVenctoClick(Sender: TObject);
begin
   dtpVenctoIni.Enabled := chkVencto.Checked;
   dtpVenctoFim.Enabled := chkVencto.Checked;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.clbTiposTituloClickCheck(Sender: TObject);
begin
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.lbAlunosDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
   lbAlunos.Canvas.TextOut(Rect.Left + 2, Rect.Top,
      lbAlunos.Items.ValueFromIndex[Index]);
end;

procedure TfNFSeFiltro.meAnoSemestreChange(Sender: TObject);
begin
   cbTurma.Clear;
   cbCurso.ItemIndex := -1;
   cbTurma.ItemIndex := -1;
   CarregaCursos;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.MontaFiltros;
const
   SFilAnoSemestre = 'M.ANOSEMESTRE = :NR_ANOSEMESTRE';
   SFilDepto = 'M.DEPTO = :CD_DEPTO';
   SFilCurso = 'M.CURSO = :CD_CURSO';
   SFilTurma = 'M.TURMA = :CD_TURMA';
   SFilParcela = 'M.PARCELA BETWEEN :NR_PARCELA_INI AND :NR_PARCELA_FIM';
   SFilVencto = 'M.DATAVENCIMENTO BETWEEN :DT_VENCTO_INI AND :DT_VENCTO_FIM';
   SFilPgto = 'M.DATAPAGAMENTO BETWEEN :DT_PGTO_INI AND :DT_PGTO_FIM';
   SFilComp = 'M.DT_COMPETENCIA BETWEEN :DT_COMP_INI AND :DT_COMP_FIM';
   SFilFixoComp = 'M.SITUACAO IN (0, 1, 2) AND M.TIPOPARCELA = 0';
   SFilFixoPgto = 'M.SITUACAO IN (0, 1)';
   SFilTipoTitulo = '(M.CD_TIPO_TITULO IN (%s) OR M.CD_TIPO_TITULO IS NULL)';
   SFilPessoas = '(M.CODIGOALUNO NOT IN (%s))';
   SOp = ' AND ';
var
   I: Integer;
   Filtro, Lista: string;
   Params: TParams;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      Params.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   Filtro := '(M.NR_NF IS NULL OR M.NR_NF = 0)';
   Params := TParams.Create;

   if chkAnoSemestre.Checked then
   begin
      Filtro := Filtro + SOp + SFilAnoSemestre;
      AddParam('NR_ANOSEMESTRE', meAnoSemestre.Text);
   end;

   if cbDepto.ItemIndex > 0 then
   begin
      Filtro := Filtro + SOp + SFilDepto;
      AddParam('CD_DEPTO', qryDeptoCODIGO.AsInteger);
   end;

   if cbCurso.ItemIndex > 0 then
   begin
      Filtro := Filtro + SOp + SFilCurso;
      AddParam('CD_CURSO', qryCursoCODIGO.AsString);
   end;

   if cbTurma.ItemIndex > 0 then
   begin
      Filtro := Filtro + SOp + SFilTurma;
      AddParam('CD_TURMA', qryTurmaCODIGO.AsString);
   end;

   if chkParcela.Checked then
   begin
      Filtro := Filtro + SOp + SFilParcela;
      AddParam('NR_PARCELA_INI', speParcelaIni.Value);
      AddParam('NR_PARCELA_FIM', speParcelaFim.Value);
   end;

   if chkVencto.Checked then
   begin
      Filtro := Filtro + SOp + SFilVencto;
      AddParam('DT_VENCTO_INI', dtpVenctoIni.DateTime);
      AddParam('DT_VENCTO_FIM', dtpVenctoFim.DateTime);
   end;

   if chkPgto.Checked then
   begin
      Filtro := Filtro + SOp + SFilPgto;
      AddParam('DT_PGTO_INI', dtpPgtoIni.DateTime);
      AddParam('DT_PGTO_FIM', dtpPgtoFim.DateTime);
   end;

   if chkComp.Checked then
   begin
      Filtro := Filtro + SOp + SFilComp;
      AddParam('DT_COMP_INI', dtpCompIni.DateTime);
      AddParam('DT_COMP_FIM', dtpCompFim.DateTime);
   end;

   if chkComp.Checked or chkVencto.Checked then
      Filtro := Filtro + SOp + SFilFixoComp
   else if chkPgto.Checked then
      Filtro := Filtro + SOp + SFilFixoPgto;

   Lista := '-1';
   for I := 0 to clbTiposTitulo.Count - 1 do
      if clbTiposTitulo.Checked[I] then
      begin
         qryTipoTitulo.GotoBookmark(clbTiposTitulo.Items.Objects[I]);
         Lista := Lista + ',' + qryTipoTituloCD_TIPO_TITULO.AsString;
      end;
   Filtro := Filtro + SOp + Format(SFilTipoTitulo, [Lista]);

   if lbAlunos.Count > 0 then
   begin
      Lista := '';
      for I := 0 to lbAlunos.Count - 1 do
      begin
         if Lista <> '' then
            Lista := Lista + ',';
         Lista := Lista + lbAlunos.Items.Names[I]
      end;
      Filtro := Filtro + SOp + Format(SFilPessoas, [Lista]);
   end;

   fNFSeWS.qryConsulta.Locate('CD_CONSULTA', 1, []);
   fNFSeWS.qryTitulos.Close;
   fNFSeWS.qryTitulos.SQL.Text :=
      Format(fNFSeWS.qryConsultaTX_CONSULTA.AsString, [Filtro]);
   for I := 0 to Params.Count - 1 do
      fNFSeWS.qryTitulos.ParamByName(Params.Items[I].Name).Value :=
         Params.Items[I].Value;

   Params.Free;
end;

procedure TfNFSeFiltro.OnChangeFilters(Sender: TObject);
begin
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.sbAdicionaAlunoClick(Sender: TObject);
begin
   if not btnSalvar.Enabled then
      btnFiltrar.Click;
   Application.CreateForm(TfNFSeBuscaPessoa, fNFSeBuscaPessoa);
   fNFSeBuscaPessoa.SetField(qfCodigo, 'CODIGOALUNO');
   fNFSeBuscaPessoa.SetField(qfNome, 'RazaoSocial');
   fNFSeBuscaPessoa.SetField(qfTurma, 'TURMA');
   fNFSeBuscaPessoa.SetField(qfCurso, 'CURSO');
   fNFSeBuscaPessoa.SetListBox(lbAlunos);
   fNFSeBuscaPessoa.SetDataSet(fNFSeWS.qryTitulos);
   fNFSeBuscaPessoa.ShowModal;
   fNFSeBuscaPessoa.Free;
   sbExcluiAluno.Enabled := lbAlunos.Count > 0;
   sbLimpaAlunos.Enabled := lbAlunos.Count > 0;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.sbDesmTiposTituloClick(Sender: TObject);
var
   I: Integer;
begin
   for I := 0 to clbTiposTitulo.Count - 1 do
      clbTiposTitulo.Checked[I] := False;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.sbExcluiAlunoClick(Sender: TObject);
begin
   lbAlunos.DeleteSelected;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.sbLimpaAlunosClick(Sender: TObject);
begin
   lbAlunos.Clear;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.sbSelTiposTituloClick(Sender: TObject);
var
   I: Integer;
begin
   for I := 0 to clbTiposTitulo.Count - 1 do
      clbTiposTitulo.Checked[I] := True;
   btnSalvar.Enabled := False;
end;

procedure TfNFSeFiltro.udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSemestre.Text := DM.incrementar_ano_semestre(meAnoSemestre.Text)
   else
      meAnoSemestre.Text := DM.decrementar_ano_semestre(meAnoSemestre.Text);
end;

end.

