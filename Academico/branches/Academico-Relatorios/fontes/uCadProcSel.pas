{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadProcSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
  Tfrm_CadProcSel = class(TForm)
    Bevel7: TBevel;
    Panel3: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    qyAreas: TUMZQuery;
    srcAreas: TDataSource;
    pmQtd: TPopupMenu;
    Bevel2: TBevel;
    pgAreas: TPageControl;
    Bevel1: TBevel;
    Bevel3: TBevel;
    tsAreas: TTabSheet;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    qyDisc: TUMZQuery;
    srcDisc: TDataSource;
    qyDiscInsert: TUMZQuery;
    srcDiscInsert: TDataSource;
    tsProcessos: TTabSheet;
    srcProcSel: TDataSource;
    qyProcSel: TUMZQuery;
    qyProcSelcd_proc_sel: TIntegerField;
    qyProcSelds_proc_sel: TStringField;
    qyProcSelsn_aberto: TStringField;
    qyProcSelnr_anosemestre: TSmallintField;
    qyProcSelcd_turma: TStringField;
    qyProcSelcd_plano_pgto: TIntegerField;
    qyProcSelds_plano_pgto: TStringField;
    qyProcSelInsert: TUMZQuery;
    qyProcSelInsertcd_proc_sel: TIntegerField;
    qyProcSelInsertds_proc_sel: TStringField;
    qyProcSelInsertsn_aberto: TStringField;
    qyProcSelInsertnr_anosemestre: TSmallintField;
    qyProcSelInsertcd_turma: TStringField;
    qyProcSelInsertcd_plano_pgto: TIntegerField;
    Panel1: TPanel;
    DBGrid3: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    dbeAnosemestre: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    qyDiscds_sigla: TStringField;
    qyDiscds_disc: TStringField;
    qyDiscds_titulacao_minima: TMemoField;
    qyDiscsn_matutino: TStringField;
    qyDiscsn_vespertino: TStringField;
    qyDiscsn_noturno: TStringField;
    tsDisciplinas: TTabSheet;
    Panel9: TPanel;
    DBGrid2: TDBGrid;
    pnTituloDisciplinas: TPanel;
    Panel11: TPanel;
    srcProcSelInsert: TDataSource;
    qyAreascd_area: TStringField;
    qyAreasds_area: TStringField;
    qyAreasds_tema: TStringField;
    srcAreasInsert: TDataSource;
    qyAreasInsert: TUMZQuery;
    qyAreascd_proc_sel: TIntegerField;
    qyDisccd_proc_sel: TIntegerField;
    qyDisccd_disc: TIntegerField;
    qyDisccd_curso: TStringField;
    qyDiscInsertcd_proc_sel: TIntegerField;
    qyDiscInsertcd_disc: TIntegerField;
    qyDiscInsertcd_curso: TStringField;
    qyDiscInsertds_titulacao_minima: TMemoField;
    qyDiscInsertsn_matutino: TStringField;
    qyDiscInsertsn_vespertino: TStringField;
    qyDiscInsertsn_noturno: TStringField;
    qyAreasInsertcd_proc_sel: TIntegerField;
    qyAreasInsertcd_area: TStringField;
    qyAreasInsertds_tema: TStringField;
    DBText1: TDBText;
    Label3: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    DBText2: TDBText;
    DBRadioGroup1: TDBRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnSair: TToolButton;
    ToolButton3: TToolButton;
    Label4: TLabel;
    dbmTitulacao: TDBMemo;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    dbAreaDescricao: TDBMemo;
    procedure DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure qyAreasInsertNewRecord(DataSet: TDataSet);
    procedure qyAreasInsertAfterPost(DataSet: TDataSet);
    procedure srcAreasInsertStateChange(Sender: TObject);
    procedure DBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure qyProcSelInsertNewRecord(DataSet: TDataSet);
    procedure qyProcSelInsertAfterPost(DataSet: TDataSet);
    procedure srcProcSelInsertStateChange(Sender: TObject);
    procedure srcProcSelDataChange(Sender: TObject; Field: TField);
    procedure qyDiscInsertNewRecord(DataSet: TDataSet);
    procedure srcDiscInsertStateChange(Sender: TObject);
    procedure qyDiscInsertAfterPost(DataSet: TDataSet);
    procedure srcDiscDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qyDiscNewRecord(DataSet: TDataSet);
    procedure srcAreasDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyAreasAfterInsert(DataSet: TDataSet);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadProcSel: Tfrm_CadProcSel;
  fechando : boolean;

implementation

uses Main, uDM, uFSelecionarDisciplina, uFSelecionarTurma, uSelPlanoPgto, uTableFields;

{$R *.dfm}

procedure Tfrm_CadProcSel.FormShow(Sender: TObject);
var
  n: LongInt;
begin
   fechando := False;

  { Todas em maiúsculas }
//  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPress;
  end ;

   qyProcSel.Close;
   qyProcSel.Open;

   pgAreas.ActivePage := tsProcessos;

end;

procedure Tfrm_CadProcSel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if frmSelPlanoPgto <> nil then
   begin
      frmSelPlanoPgto.Free;
      frmSelPlanoPgto := nil;
   end;

   Action := caFree;
end;

procedure Tfrm_CadProcSel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadProcSel.btnSairClick(Sender: TObject);
begin
  fechando := true;
  Close;
end;

procedure Tfrm_CadProcSel.btnExcluirClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsProcessos then begin
    if Mensagem( 'Deseja realmente excluir este Processo Seletivo?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
       with DM.qyAux do begin
          Close();
          SQL.Text := 'DELETE FROM proc_sel_prof_disc WHERE cd_proc_sel = :cd_proc_sel';
          ParamByName('cd_proc_sel').AsInteger := qyProcSel.FieldByName('cd_proc_sel').AsInteger;
          ExecSQL();

          Close();
          SQL.Text := 'DELETE FROM proc_sel_prof_areas WHERE cd_proc_sel = :cd_proc_sel';
          ParamByName('cd_proc_sel').AsInteger := qyProcSel.FieldByName('cd_proc_sel').AsInteger;
          ExecSQL();
       end;
       qyProcSelInsert.Delete();
       qyProcSel.Close();
       qyProcSel.Open();
    end;
  end
  else if pgAreas.ActivePage = tsAreas then begin
    if Mensagem( 'Deseja realmente excluir esta Área de Concentração do Processo Seletivo?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
       qyAreasInsert.Delete();
       qyAreas.Close();
       qyAreas.Open();
    end;
  end
  else begin
    if Mensagem( 'Deseja realmente retirar esta disciplina do Processo Seletivo?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
       qyDiscInsert.Delete;
       qyDisc.Close();
       qyDisc.Open();
    end;
  end;
end;

procedure Tfrm_CadProcSel.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure Tfrm_CadProcSel.btnInserirClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsProcessos then begin
    dbeAnosemestre.SetFocus();
    qyProcSelInsert.Insert();
  end
  else if pgAreas.ActivePage = tsAreas then begin

    Application.CreateForm( TfrmTableFields, frmTableFields );
    frmTableFields.Left := 350;
    frmTableFields.Width := 250;
    frmTableFields.Tag := 2; // Isso vai indicar que está aberto a janela de Grade
    frmTableFields.ConstroiTreeProcSelAreas();
    frmTableFields.Show;

  end
  else begin

    Application.CreateForm( TfrmTableFields, frmTableFields );
    frmTableFields.Left := 350;
    frmTableFields.Width := 250;
    frmTableFields.Tag := 2; // Isso vai indicar que está aberto a janela de Grade
    frmTableFields.ConstroiTreeProcSelDisc( qyAreas.FieldByName('cd_area').AsString );
    frmTableFields.Show;

  end;
end;

procedure Tfrm_CadProcSel.btnAlterarClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsProcessos then begin
    qyProcSelInsert.Edit();
  end
  else if pgAreas.ActivePage = tsAreas then begin
    dbAreaDescricao.SetFocus();
    qyAreasInsert.Edit();
  end
  else begin
    qyDiscInsert.Edit();
  end;
end;

procedure Tfrm_CadProcSel.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
  sReg : string;
begin
  if pgAreas.ActivePage = tsProcessos then begin
    reg := qyProcSel.FieldByName('cd_proc_sel').AsInteger;
    qyProcSelInsert.Post;
    qyProcSelInsert.Close;
    qyProcSelInsert.Open;
    qyProcSel.Close;
    qyProcSel.Open;
    qyProcSel.Locate('cd_proc_sel', reg, []);
  end
  else if pgAreas.ActivePage = tsAreas then begin
    sReg := qyAreasInsert.FieldByName('cd_area').AsString;
    qyAreasInsert.Post;
    qyAreasInsert.Close;
    qyAreasInsert.Open;
    qyAreas.Close;
    qyAreas.Open;
    qyAreas.Locate('cd_area', sReg, []);
  end
  else begin
    reg := qyDisc.FieldByName('cd_disc').AsInteger;
    qyDiscInsert.Post;
    qyDiscInsert.Close;
    qyDiscInsert.Open;
    qyDisc.Close;
    qyDisc.Open;
    qyDisc.Locate('cd_disc', reg, []);
  end;
end;

procedure Tfrm_CadProcSel.btnCancelarClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsProcessos then begin
    qyProcSelInsert.Cancel();
  end
  else if pgAreas.ActivePage = tsAreas then begin
    qyAreasInsert.Cancel;
  end
  else begin
    qyDiscInsert.Cancel;
  end;
end;

procedure Tfrm_CadProcSel.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyAreas, pmQtd);
end;

procedure Tfrm_CadProcSel.qyAreasAfterInsert(DataSet: TDataSet);
begin
  qyAreas.FieldByName('codigo').AsInteger := DM.ProximoId('codigo', 'tabela');
end;

procedure Tfrm_CadProcSel.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_CadProcSel.DBGrid1DblClick(Sender: TObject);
begin
  pgAreas.ActivePage := tsDisciplinas;
end;

procedure Tfrm_CadProcSel.srcAreasDataChange(Sender: TObject;
  Field: TField);
begin
  if fechando then
    exit;

  pnTituloDisciplinas.Caption := 'Disciplinas da Área de Concentração: ' + qyAreas.FieldByName('cd_area').AsString;
  qyDisc.Close();
  qyDisc.Open();

  qyAreasInsert.Close();
  qyAreasInsert.Open();
end;

procedure Tfrm_CadProcSel.qyDiscNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('cd_area').AsString := qyAreas.FieldByName('cd_area').AsString;
end;

procedure Tfrm_CadProcSel.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   if not (qyProcSelInsert.State in [dsInsert,dsEdit]) then
   begin
      qyProcSelInsert.Edit();
   end;

   qyProcSelInsert.FieldByName('cd_turma').AsString := resultado_filtro.cd_turma;
   qyProcSelInsert.FieldByName('nr_anosemestre').AsInteger := resultado_filtro.nr_anosemestre;
end;

procedure Tfrm_CadProcSel.srcDiscDataChange(Sender: TObject;
  Field: TField);
begin
  if fechando then
    exit;

  qyDiscInsert.Close();
  qyDiscInsert.Open();
end;

procedure Tfrm_CadProcSel.qyDiscInsertAfterPost(DataSet: TDataSet);
begin
  qyDisc.Close();
  qyDisc.Open();
end;

procedure Tfrm_CadProcSel.srcDiscInsertStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyDiscInsert.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyDiscInsert.State in [dsInsert, dsEdit];
end;

procedure Tfrm_CadProcSel.qyDiscInsertNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('cd_proc_sel').AsString := qyAreas.FieldByName('cd_proc_sel').AsString;
end;

procedure Tfrm_CadProcSel.srcProcSelDataChange(Sender: TObject; Field: TField);
begin
  qyProcSelInsert.Close();
  qyProcSelInsert.Open();

  qyAreas.Close();
  qyAreas.Open();
end;

procedure Tfrm_CadProcSel.srcProcSelInsertStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyProcSelInsert.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyProcSelInsert.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyProcSelInsert.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyProcSelInsert.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyProcSelInsert.State in [dsInsert, dsEdit];
end;

procedure Tfrm_CadProcSel.qyProcSelInsertAfterPost(DataSet: TDataSet);
begin
  qyProcSel.Close();
  qyProcSel.Open();
end;

procedure Tfrm_CadProcSel.qyProcSelInsertNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('cd_proc_sel').AsInteger := DM.ProximoId('cd_proc_sel', 'proc_sel_prof');
end;

procedure Tfrm_CadProcSel.DBGrid3DblClick(Sender: TObject);
begin
  pgAreas.ActivePage := tsAreas;
end;

procedure Tfrm_CadProcSel.SpeedButton2Click(Sender: TObject);
begin
   if frmSelPlanoPgto = nil then
      Application.CreateForm(TfrmSelPlanoPgto, frmSelPlanoPgto);

   frmSelPlanoPgto.txtAnoSemestre.Text := IntToStr(ano_semestre);
   frmSelPlanoPgto.ShowModal();
   if frmSelPlanoPgto.flgSearch then
   begin
      if not (qyProcSelInsert.State in [dsInsert,dsEdit]) then
      begin
         qyProcSelInsert.Edit();
      end;

      qyProcSelInsert.FieldByName('cd_plano_pgto').AsInteger := frmSelPlanoPgto.qryPlanoPgto.FieldByName('codigo').AsInteger;
      qyProcSelInsert.FieldByName('nr_anosemestre').AsInteger := frmSelPlanoPgto.qryPlanoPgto.FieldByName('anosemestre').AsInteger;
   end;
end;

procedure Tfrm_CadProcSel.DBGrid1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure Tfrm_CadProcSel.DBGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  sArea : string;
begin

  { Quando arrastar da  Grade }
  if Source is TTreeView then
  begin
    frmTableFields.Close();

    MyTreeNode := frmTableFields.Tree.Selected;
    sArea := Trim(Copy(MyTreeNode.Text, 1, Pos(' - ', MyTreeNode.Text)));

    dbAreaDescricao.SetFocus();
    qyAreasInsert.Insert();
    qyAreasInsert.FieldByName('cd_area').AsString := sArea;
    qyAreasInsert.Post();
    qyAreas.Close();
    qyAreas.Open();
    qyAreas.Locate('cd_area', sArea, []);
    qyAreasInsert.Edit();
  end;

end;

procedure Tfrm_CadProcSel.srcAreasInsertStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyAreasInsert.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyAreasInsert.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyAreasInsert.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyAreasInsert.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyAreasInsert.State in [dsInsert, dsEdit];
end;

procedure Tfrm_CadProcSel.qyAreasInsertAfterPost(DataSet: TDataSet);
begin
  qyAreas.Close();
  qyAreas.Open();
end;

procedure Tfrm_CadProcSel.qyAreasInsertNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('cd_proc_sel').AsInteger := qyProcSel.FieldByName('cd_proc_sel').AsInteger;
end;

procedure Tfrm_CadProcSel.DBGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure Tfrm_CadProcSel.DBGrid2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  sCurso : string;
  sDisc : string;
  sAux : string;
begin

  { Quando arrastar da  Grade }
  if Source is TTreeView then
  begin
    frmTableFields.Close();

    MyTreeNode := frmTableFields.Tree.Selected;
    sAux := MyTreeNode.Text;

    sCurso := Trim(Copy(MyTreeNode.Text, 1, Pos(' - ', MyTreeNode.Text)));
    sAux := Trim(Copy(MyTreeNode.Text, Pos(' - ', MyTreeNode.Text)+3));

    sDisc := Trim(Copy(sAux, 1, Pos(' - ', sAux)));

    dbmTitulacao.SetFocus();
    with qyDiscInsert do begin
      Insert();
      FieldByName('cd_curso').AsString := sCurso;
      FieldByName('cd_disc').AsString := sDisc;
      FieldByName('sn_matutino').AsString := 'N';
      FieldByName('sn_vespertino').AsString := 'N';
      FieldByName('sn_noturno').AsString := 'N';
      Post();
    end;
    qyDisc.Close();
    qyDisc.Open();
    qyDisc.Locate('cd_curso; cd_disc', VarArrayOf([sCurso, sDisc]), []);
    qyDiscInsert.Edit();
  end;

end;

end.

