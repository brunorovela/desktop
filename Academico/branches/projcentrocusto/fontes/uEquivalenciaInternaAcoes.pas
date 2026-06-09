unit uEquivalenciaInternaAcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls, ToolWin, ImgList,
  CheckLst, uDM, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, DB, ZConnection;

type
  TDuplaString = array[1..2] of string;
  TDuploInteger = array[1..2] of Integer;
  TDuploBoolean = array[1..2] of Boolean;
  TfEquivInternaAcoes = class(TForm)
    Panel3: TPanel;
    pnParte1: TPanel;
    Panel4: TPanel;
    clbDisciplinas1: TCheckListBox;
    Panel5: TPanel;
    ImageList2: TImageList;
    toolPessoa: TToolBar;
    sbSalvar: TToolButton;
    ToolButton1: TToolButton;
    sbCancelar: TToolButton;
    ToolButton3: TToolButton;
    ultimoseparador: TBevel;
    edCurso1: TEdit;
    lblCurso1: TLabel;
    sbBuscaCurso1: TSpeedButton;
    lblGrade1: TLabel;
    btnFiltrar1: TBitBtn;
    lblDisciplinas1: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    sbBuscaCurso2: TSpeedButton;
    Label2: TLabel;
    lblDisciplinas2: TLabel;
    clbDisciplinas2: TCheckListBox;
    edCurso2: TEdit;
    btnFiltrar2: TBitBtn;
    cbOposto: TCheckBox;
    Panel2: TPanel;
    cbGrade1: TComboBox;
    cbGrade2: TComboBox;
    qyComboGrade: TUMZQuery;
    qyListaDisc: TUMZQuery;
    qyCarregaEquiv: TUMZQuery;
    qyAux: TUMZQuery;
    btnSalvarFechar: TToolButton;
    ToolButton4: TToolButton;
    lblOrientacao: TLabel;
    qyVerificaEqui: TUMZQuery;
    procedure clbDisciplinas2DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure clbDisciplinas1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCurso2Exit(Sender: TObject);
    procedure mskAnoSem2Exit(Sender: TObject);
    procedure btnFiltrar2Click(Sender: TObject);
    procedure cbGrade2Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure clbDisciplinas2ClickCheck(Sender: TObject);
    procedure clbDisciplinas1ClickCheck(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrar1Click(Sender: TObject);
    procedure cbGrade1Change(Sender: TObject);
    procedure edCurso1Exit(Sender: TObject);
    procedure sbBuscaCurso2Click(Sender: TObject);
    procedure sbBuscaCurso1Click(Sender: TObject);
    procedure SetHorizontalScrollBar(lb : TCheckListBox) ;
  private
      ACodigoEquivalenciaGrupo: Integer;
      ACodigoGrupo: TDuploInteger;
      ACurso: TDuplaString;
      AGrade: TDuploInteger;
      AChanged: TDuploBoolean;
      ACheckAlterado: Boolean;

      { Private declarations }

      procedure DisabledUnchecked(CheckListBox: TCheckListBox);
      procedure EnableAll(CheckListBox: TCheckListBox);
      procedure carregaComboGrades(cbCombo: TComboBox; iLado: Integer = 1);
      procedure carregaDisciplinas(cbCheckList: TCheckListBox; iLado: Integer = 1);
      procedure doFiltrar(iLado: Integer = 1);
      procedure valueChanged(iLado: Integer = 1);
      procedure carregaGrupo(iLado: Integer = 1);
      procedure enableGrupo(bEnable: Boolean; iLado: Integer = 1);

      function buscaNovoGrupo(): Integer;
      procedure insereItensNoGrupo(iGrupo: Integer; cbCheckList: TCheckListBox; Acao: String);
      procedure limpaItensNoGrupo(iGrupo: Integer; cbCheckList: TCheckListBox);
      procedure insereRelacionamentos(iGrupo1: Integer; iGrupo2: Integer);

      function countChecked(clbCheck: TCheckListBox): Integer;

      procedure DesmarcaLista(Lista : TCheckListBox);
      function verificaDuplicidade(cbCheckList1,cbCheckList2: TCheckListBox): boolean;

  public

      function showEquivalenciaAcoes(iCodEquivalenciaGrupo: Integer = 0; iCodigoGrupo1: Integer = 0; iCodigoGrupo2: Integer = 0): Integer;
    { Public declarations }
  end;

var
  fEquivInternaAcoes: TfEquivInternaAcoes;

implementation

uses
   uFSelecionarCurso, Main;

{$R *.dfm}

procedure TfEquivInternaAcoes.btnFiltrar1Click(Sender: TObject);
begin
   clbDisciplinas1.Items.BeginUpdate;
   valueChanged(1);
   clbDisciplinas1.Items.EndUpdate;
end;

procedure TfEquivInternaAcoes.btnFiltrar2Click(Sender: TObject);
begin
   valueChanged(2);
end;

function TfEquivInternaAcoes.buscaNovoGrupo: Integer;
begin
   with qyAux do begin
      Close();
      SQL.Text := 'SELECT (COALESCE(MAX(cd_grupo), 0)+1) AS proximo FROM disciplinas_equiv_interna dei';
      Open();
      Result := FieldByName('proximo').AsInteger;
      Close();
   end;
end;

procedure TfEquivInternaAcoes.carregaComboGrades(cbCombo: TComboBox; iLado: Integer);
begin
   if (AChanged[iLado]) then
   begin

      cbCombo.Clear();

      if Trim(ACurso[iLado]) <> '' then
      begin

         qyComboGrade.Close();
         qyComboGrade.ParamByName('CD_CURSO').AsString := ACurso[iLado];
         qyComboGrade.Open();

         if not (qyComboGrade.IsEmpty) then begin
            while not qyComboGrade.Eof do begin
               cbCombo.Items.Add(qyComboGrade.FieldByName('cd_grade').AsString);
               qyComboGrade.Next();
            end;
         end;
         qyComboGrade.Close();
      end;

      if (AGrade[iLado] > 0) then
      begin
         cbCombo.ItemIndex := cbCombo.Items.IndexOf(IntToStr(AGrade[iLado]));
      end;

      AChanged[iLado] := False;

   end;
end;

procedure TfEquivInternaAcoes.carregaDisciplinas(cbCheckList: TCheckListBox; iLado: Integer);
var
   sItem: string;
   slItem: TStringList;
begin

   if ((Trim(ACurso[iLado]) <> '') and (AGrade[iLado] > 0)) then
   begin

      cbCheckList.Items.Clear();
      qyListaDisc.Close();
//      qyListaDisc.ParamByName('anosem').AsInteger := AAnoSem[iLado];
      qyListaDisc.ParamByName('curso').AsString := ACurso[iLado];
      qyListaDisc.ParamByName('grade').AsInteger := AGrade[iLado];
      qyListaDisc.Open();

      if not (qyListaDisc.IsEmpty) then
      begin

         while not qyListaDisc.Eof do
         begin

            slItem := TStringList.Create();

            slItem.Values['disciplina'] := qyListaDisc.FieldByName('disciplina').AsString;
            slItem.Values['cd_grade'] := qyListaDisc.FieldByName('cd_grade').AsString;
            slItem.Values['curso'] := qyListaDisc.FieldByName('curso').AsString;

            sItem := qyListaDisc.FieldByName('descricao').AsString + ' (' +
            qyListaDisc.FieldByName('disciplina').AsString + ')';


            cbCheckList.Items.AddObject(sItem, slItem);

            qyListaDisc.Next();

         end;
      end;
      qyListaDisc.Close();
   end;
end;

procedure TfEquivInternaAcoes.carregaGrupo(iLado: Integer);
var
   mskAnoSem: TMaskEdit;
   edCurso: TEdit;
   cbGrade: TComboBox;
   sAux: string;
   clbDisc: TCheckListBox;
begin
   if (iLado = 1) then begin
      edCurso := edCurso1;
      cbGrade := cbGrade1;
      clbDisc := clbDisciplinas1;
   end
   else begin
      edCurso := edCurso2;
      cbGrade := cbGrade2;
      clbDisc := clbDisciplinas2;
   end;
   with qyCarregaEquiv do begin
      if (ACodigoGrupo[iLado] > 0) then begin
         Close();
         ParamByName('grupo').AsInteger := ACodigoGrupo[iLado];
         Open();
         if not IsEmpty then begin
            edCurso.Text := FieldByName('cd_curso').AsString;
            AGrade[iLado] := FieldByName('cd_grade').AsInteger;
            valueChanged(iLado);
         end;
         Close();
      end;
   end;
end;

procedure TfEquivInternaAcoes.cbGrade1Change(Sender: TObject);
begin
   valueChanged(1);

end;

procedure TfEquivInternaAcoes.cbGrade2Change(Sender: TObject);
begin
   valueChanged(2);

end;

procedure TfEquivInternaAcoes.clbDisciplinas1ClickCheck(Sender: TObject);
begin
   ACheckAlterado := True;
   if countChecked(clbDisciplinas2) > 1 then
   begin
      if countChecked(clbDisciplinas1) > 1 then
      begin
         clbDisciplinas1.Checked[clbDisciplinas1.ItemIndex] := False;
         DisabledUnchecked(clbDisciplinas1);
      end
      else
      begin
         EnableAll(clbDisciplinas1);
         EnableAll(clbDisciplinas2);
      end;
   end
   else if countChecked(clbDisciplinas1) < 2 then
      EnableAll(clbDisciplinas2);

   clbDisciplinas1.Refresh;
   clbDisciplinas2.Refresh;
end;

procedure TfEquivInternaAcoes.clbDisciplinas1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   SetHorizontalScrollBar(clbDisciplinas1);
end;

procedure TfEquivInternaAcoes.clbDisciplinas2ClickCheck(Sender: TObject);
begin
   ACheckAlterado := True;
   if countChecked(clbDisciplinas1) > 1 then
   begin
      if countChecked(clbDisciplinas2) > 1 then
      begin
         clbDisciplinas2.Checked[clbDisciplinas2.ItemIndex] := False;
         DisabledUnchecked(clbDisciplinas2);
      end
      else
      begin
         EnableAll(clbDisciplinas1);
         EnableAll(clbDisciplinas2);
      end;
   end
   else if countChecked(clbDisciplinas2) < 2 then
      EnableAll(clbDisciplinas1);
   
   clbDisciplinas1.Refresh;
   clbDisciplinas2.Refresh;
end;

procedure TfEquivInternaAcoes.clbDisciplinas2DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   SetHorizontalScrollBar(clbDisciplinas2);
end;

function TfEquivInternaAcoes.countChecked(clbCheck: TCheckListBox): Integer;
var
  i: Integer;
begin
   Result := 0;
   for i := 0 to clbCheck.Items.Count - 1 do begin
      if (clbCheck.Checked[i]) then begin
         Inc(Result);
      end;
   end;

end;

procedure TfEquivInternaAcoes.DesmarcaLista(Lista: TCheckListBox);
var
  i: Integer;
begin

   for i := 0 to Lista.Items.Count - 1 do begin
      Lista.Checked[i] := false
   end;

end;

procedure TfEquivInternaAcoes.DisabledUnchecked(CheckListBox: TCheckListBox);
var
   I: Integer;
begin
   for I := 0 to CheckListBox.Count - 1 do
      if not CheckListBox.Checked[I] then
      begin
         CheckListBox.ItemEnabled[I] := False;
      end;
end;

procedure TfEquivInternaAcoes.enableGrupo(bEnable: Boolean; iLado: Integer);
var
   edCurso: TEdit;
   cbGrade: TComboBox;
   clbDisc: TCheckListBox;
begin

   if (iLado = 1) then begin
      edCurso := edCurso1;
      cbGrade := cbGrade1;
      clbDisc := clbDisciplinas1;
   end
   else begin
      edCurso := edCurso2;
      cbGrade := cbGrade2;
      clbDisc := clbDisciplinas2;
   end;
   edCurso.Enabled := bEnable;
   cbGrade.Enabled := bEnable;
end;

procedure TfEquivInternaAcoes.doFiltrar(iLado: Integer);
begin
   if (AChanged[iLado]) then begin
      if (iLado = 1) then begin
         carregaComboGrades(cbGrade1, iLado);
         carregaDisciplinas(clbDisciplinas1, iLado);
      end
      else begin
         carregaComboGrades(cbGrade2, iLado);
         carregaDisciplinas(clbDisciplinas2, iLado);
      end;
   end;
end;

procedure TfEquivInternaAcoes.edCurso1Exit(Sender: TObject);
begin
   valueChanged(1);
end;

procedure TfEquivInternaAcoes.edCurso2Exit(Sender: TObject);
begin
   valueChanged(2);
end;

procedure TfEquivInternaAcoes.EnableAll(CheckListBox: TCheckListBox);
var
   I: Integer;
begin
   for I := 0 to CheckListBox.Count - 1 do
      if not CheckListBox.ItemEnabled[I] then
      begin
         CheckListBox.ItemEnabled[I] := True;
      end;
end;

procedure TfEquivInternaAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;           

procedure TfEquivInternaAcoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := True;
   if (ACheckAlterado) then begin
      if Mensagem('Você alterou as turmas/disciplinas abaixo, mas não salvou as alterações. Você tem certeza que deseja seguir?', '', MB_YESNO) = ID_NO then begin
         CanClose := False;
      end;
   end;
end;

procedure TfEquivInternaAcoes.SetHorizontalScrollBar(lb : TCheckListBox) ;
var
  j, MaxWidth: integer;
begin
  MaxWidth := 0;
  for j := 0 to lb.Items.Count - 1 do
  if MaxWidth < lb.Canvas.TextWidth(lb.Items.Strings[j]) then
    MaxWidth := lb.Canvas.TextWidth(lb.Items.Strings[j]) ;

  SendMessage(lb.Handle,
              LB_SETHORIZONTALEXTENT,
              MaxWidth + 30, 0) ;
end;

procedure TfEquivInternaAcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F6 : sbCancelarClick( nil );
   end;
end;

procedure TfEquivInternaAcoes.insereItensNoGrupo(iGrupo: Integer;
  cbCheckList: TCheckListBox; Acao: String);
var
  i: Integer;
  slAtual: TStringList;
begin
   for i := 0 to (cbCheckList.Items.Count - 1) do begin
      if (cbCheckList.Checked[i]) then begin
         slAtual := cbCheckList.Items.Objects[i] as TStringList;
         with qyAux do begin
            Close();

            SQL.Text := ''+
            'INSERT INTO disciplinas_equiv_interna '+
            '(cd_equivalencia, cd_grade, cd_curso, cd_disciplina, cd_grupo) '+
            'VALUES ' +
            '(NULL, :grade, :curso, :disciplina, :grupo)';

            ParamByName('grade').AsInteger := StrToInt(slAtual.Values['cd_grade']);
            ParamByName('disciplina').AsInteger := StrToInt(slAtual.Values['disciplina']);
            ParamByName('curso').AsString := slAtual.Values['curso'];
            ParamByName('grupo').AsInteger := iGrupo;
            
            ExecSQL();
            
            DM.setLog(
               1000000,
               Acao,
               slAtual.Values['cd_grade'] + ';' +
               slAtual.Values['disciplina'] + ';' +
               slAtual.Values['curso'] + ';' +
               IntToStr(iGrupo),
               0,
               'Curso: ' + slAtual.Values['curso'] + ', ' +
               'Disciplina: ' + cbCheckList.Items.Strings[i] + ', ' +
               'Grade: ' + slAtual.Values['cd_grade'] + ', ' +
               'Grupo de Equiv.: ' + IntToStr(iGrupo)
            );
         end;
      end;
   end;
end;

procedure TfEquivInternaAcoes.insereRelacionamentos(iGrupo1, iGrupo2: Integer);
begin
   with qyAux do begin
      Close();
      SQL.Text := ''+
      'INSERT INTO disciplinas_equiv_grupos '+
      '(cd_equivalencia_grupo, cd_grupo1, cd_grupo2) '+
      'VALUES ' +
      '(NULL, :grupoa, :grupob)';
      ParamByName('grupoa').AsInteger := iGrupo1;
      ParamByName('grupob').AsInteger := iGrupo2;
      ExecSQL();
   end;
end;

procedure TfEquivInternaAcoes.limpaItensNoGrupo(iGrupo: Integer;
  cbCheckList: TCheckListBox);
begin
//
   with qyAux do begin
      Close();
      SQL.Text := 'DELETE FROM disciplinas_equiv_interna WHERE cd_grupo = :cd_grupo';
      ParamByName('cd_grupo').AsInteger := iGrupo;
      ExecSQL();
   end;
end;

procedure TfEquivInternaAcoes.mskAnoSem2Exit(Sender: TObject);
begin
   valueChanged(2);
end;

procedure TfEquivInternaAcoes.sbBuscaCurso1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
     edCurso1.Text := resultado_filtro.cd_curso;
     valueChanged(1);
   end;
end;

procedure TfEquivInternaAcoes.sbBuscaCurso2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      edCurso2.Text := resultado_filtro.cd_curso;
      valueChanged(2);
   end;
end;

procedure TfEquivInternaAcoes.sbCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   Close();
end;

procedure TfEquivInternaAcoes.sbSalvarClick(Sender: TObject);
var
   iCodGrupo1: Integer;
   iCodGrupo2: Integer;
begin
   //salva aqui!!!
   if (ACheckAlterado) then begin
      if ((countChecked(clbDisciplinas1) <= 0) or (countChecked(clbDisciplinas2) <= 0)) then begin
         Mensagem('Você precisa selecionar disciplinas nos dois lados para registrar uma equivalência');
         Exit;
      end;
      if (ACodigoEquivalenciaGrupo = 0) then begin
         //se for inserir
         if (verificaDuplicidade(clbDisciplinas1, clbDisciplinas2)) then
         begin
            Mensagem('A equivalência entre as disciplinas selecionadas já foi registrada no sistema.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle);
            exit;
         end;
         iCodGrupo1 := buscaNovoGrupo();
         iCodGrupo2 := buscaNovoGrupo()+1;
         insereItensNoGrupo(iCodGrupo1, clbDisciplinas1, 'Inclusao');
         insereItensNoGrupo(iCodGrupo2, clbDisciplinas2, 'Inclusao');
         insereRelacionamentos(iCodGrupo1, iCodGrupo2);
         if (cbOposto.Checked) then begin
            if (verificaDuplicidade(clbDisciplinas2, clbDisciplinas1)) then
            begin
               Mensagem('A equivalência entre as disciplinas selecionadas já foi registrada no sistema.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle);
               exit;
            end;
            insereRelacionamentos(iCodGrupo2, iCodGrupo1);
         end;
         if TToolButton(Sender).Tag = 1 then begin
         // Quando é uma inclusão, manter na tela para incluir outras equivalencias.
         // Limpar as Checks
            EnableAll(clbDisciplinas1);
            EnableAll(clbDisciplinas2);
            clbDisciplinas1.Refresh;
            clbDisciplinas2.Refresh;
            DesmarcaLista(clbDisciplinas1);
            DesmarcaLista(clbDisciplinas2);
            ACheckAlterado := false;
            Exit;
            
         end;
      end
      else begin
         //é alterar
         limpaItensNoGrupo(ACodigoGrupo[1], clbDisciplinas1);
         insereItensNoGrupo(ACodigoGrupo[1], clbDisciplinas1, 'Alteracao');
         limpaItensNoGrupo(ACodigoGrupo[2], clbDisciplinas2);
         insereItensNoGrupo(ACodigoGrupo[2], clbDisciplinas2, 'Alteracao');
         insereRelacionamentos(iCodGrupo1, iCodGrupo2);
         if (cbOposto.Checked) then begin
            insereRelacionamentos(iCodGrupo2, iCodGrupo1);
         end;         
      end;
   end;
   ACheckAlterado := False;
   ModalResult := mrOk;
   Close();
end;

function TfEquivInternaAcoes.showEquivalenciaAcoes(iCodEquivalenciaGrupo,
  iCodigoGrupo1, iCodigoGrupo2: Integer): Integer;
begin
   clbDisciplinas1.Items.BeginUpdate;
   clbDisciplinas2.Items.BeginUpdate;
   Self.ACodigoEquivalenciaGrupo := iCodEquivalenciaGrupo;
   Self.ACodigoGrupo[1] := iCodigoGrupo1;
   Self.ACodigoGrupo[2] := iCodigoGrupo2;

   carregaGrupo(1);
   carregaGrupo(2);

   //se for diferente, carrega as coisas
   if (iCodigoGrupo1 > 0) then begin
      enableGrupo(False, 1);
   end;
   if (iCodigoGrupo2 > 0) then begin
      enableGrupo(False, 2);
   end;
   ACheckAlterado := False;
   clbDisciplinas1.Items.EndUpdate;
   clbDisciplinas2.Items.EndUpdate;
   SetHorizontalScrollBar(clbDisciplinas1);
   SetHorizontalScrollBar(clbDisciplinas2);
   Result := Self.ShowModal();
end;

procedure TfEquivInternaAcoes.valueChanged(iLado: Integer);
var
   edCurso: TEdit;
   cbGrade: TComboBox;
   sAux: string;
   clbDisc: TCheckListBox;
   bRecarregaGrade, bRecarregaLista: Boolean;
begin

   bRecarregaGrade := False;
   bRecarregaLista := False;

   if (iLado = 1) then begin
      edCurso := edCurso1;
      cbGrade := cbGrade1;
      clbDisc := clbDisciplinas1;
   end
   else begin
      edCurso := edCurso2;
      cbGrade := cbGrade2;
      clbDisc := clbDisciplinas2;
   end;

   if (Trim(cbGrade.Text) = '') then begin sAux := '0' end
   else begin sAux := cbGrade.Text; end;


   if ((StrToInt(sAux) <> AGrade[iLado]) and (sAux <> '0')) then begin
      AChanged[iLado] := True;
      bRecarregaLista := True;
      AGrade[iLado] := StrToInt(sAux);
   end;

   if (Trim(edCurso.Text) <> ACurso[iLado]) then begin
      AChanged[iLado] := True;
      bRecarregaLista := True;
      bRecarregaGrade := True;
      ACurso[iLado] := Trim(edCurso.Text);
   end;

   if (bRecarregaGrade) then begin
      carregaComboGrades(cbGrade, iLado);
   end;
   if (bRecarregaLista) then begin
      carregaDisciplinas(clbDisc, iLado);
   end;

   SetHorizontalScrollBar(clbDisciplinas1);
   SetHorizontalScrollBar(clbDisciplinas2);
end;

function TfEquivInternaAcoes.verificaDuplicidade(cbCheckList1,
  cbCheckList2: TCheckListBox): boolean;
var
  i: Integer;
  slAtual: TStringList;
begin
   qyVerificaEqui.Close;
   for i := 0 to (cbCheckList1.Items.Count - 1) do begin
      if (cbCheckList1.Checked[i]) then begin
         slAtual := cbCheckList1.Items.Objects[i] as TStringList;
         qyVerificaEqui.ParamByName('grad1').AsInteger := StrToInt(slAtual.Values['cd_grade']);
         qyVerificaEqui.ParamByName('disc1').AsInteger := StrToInt(slAtual.Values['disciplina']);
         qyVerificaEqui.ParamByName('curso1').AsString := slAtual.Values['curso'];
      end;
   end;

   for i := 0 to (cbCheckList2.Items.Count - 1) do begin
      if (cbCheckList2.Checked[i]) then begin
         slAtual := cbCheckList2.Items.Objects[i] as TStringList;
         qyVerificaEqui.ParamByName('grad2').AsInteger := StrToInt(slAtual.Values['cd_grade']);
         qyVerificaEqui.ParamByName('disc2').AsInteger := StrToInt(slAtual.Values['disciplina']);
         qyVerificaEqui.ParamByName('curso2').AsString := slAtual.Values['curso'];
      end;
   end;

   qyVerificaEqui.Open;

   result := (qyVerificaEqui.FieldByName('cont').AsInteger > 0);
end;

end.
