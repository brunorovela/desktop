{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadProcSelAreas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
  Tfrm_CadProcSelAreas = class(TForm)
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
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyAreas: TUMZQuery;
    srcAreas: TDataSource;
    pmQtd: TPopupMenu;
    qyAreascd_area: TStringField;
    qyAreasds_area: TStringField;
    Bevel2: TBevel;
    pgAreas: TPageControl;
    tsDisciplinas: TTabSheet;
    Panel9: TPanel;
    DBGrid2: TDBGrid;
    pnTituloDisciplinas: TPanel;
    Panel11: TPanel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    tsAreas: TTabSheet;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    dbAreaCodigo: TDBEdit;
    Label2: TLabel;
    dbAreaDescricao: TDBEdit;
    qyDisc: TUMZQuery;
    srcDisc: TDataSource;
    qyDisccd_curso: TStringField;
    qyDiscsigla: TStringField;
    qyDiscdescricao: TStringField;
    qyDisccd_area: TStringField;
    qyDisccd_disc: TIntegerField;
    Label4: TLabel;
    dbDisc: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    lbDisciplina: TLabel;
    lbCurso: TLabel;
    qyDiscInsert: TUMZQuery;
    srcDiscInsert: TDataSource;
    qyDiscInsertcd_area: TStringField;
    qyDiscInsertcd_disc: TIntegerField;
    qyDiscInsertcd_curso: TStringField;
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
    procedure srcAreasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadProcSelAreas: Tfrm_CadProcSelAreas;

implementation

uses Main, uDM, uFSelecionarDisciplina;

{$R *.dfm}

procedure Tfrm_CadProcSelAreas.FormShow(Sender: TObject);
var
  n: LongInt;
begin
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

   qyAreas.Close;
   qyAreas.Open;

   lbDisciplina.Caption := '';
   lbCurso.Caption := '';
   pgAreas.ActivePage := tsAreas;
end;

procedure Tfrm_CadProcSelAreas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadProcSelAreas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_CadProcSelAreas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadProcSelAreas.btnExcluirClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsAreas then begin
    if Mensagem( 'Deseja realmente excluir esta Área de Concentração?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
       with DM.qyAux do begin
          Close();
          SQL.Text := 'DELETE FROM proc_sel_areas_disc WHERE cd_area = :cd_area';
          ParamByName('cd_area').AsString := qyAreas.FieldByName('cd_area').AsString;
          ExecSQL();
       end;
       qyAreas.Delete();
    end;
  end
  else begin
    if Mensagem( 'Deseja realmente retirar esta disciplina da Área de Concentração?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
       qyDiscInsert.Delete;
       qyDisc.Close();
       qyDisc.Open();
    end;
  end;
end;

procedure Tfrm_CadProcSelAreas.btnFecharClick(Sender: TObject);
begin
   qyAreas.Close;
   qyAreas.Open;
   Close;
end;

procedure Tfrm_CadProcSelAreas.btnInserirClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsAreas then begin
    dbAreaCodigo.SetFocus;
    qyAreas.Insert();
  end
  else begin
    dbDisc.SetFocus;
    qyDiscInsert.Insert();
  end;
end;

procedure Tfrm_CadProcSelAreas.btnAlterarClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsAreas then begin
    dbAreaCodigo.SetFocus;
    qyAreas.Edit();
  end
  else begin
    dbDisc.SetFocus;
    qyDiscInsert.Edit();
  end;
end;

procedure Tfrm_CadProcSelAreas.btnSalvarClick(Sender: TObject);
Var
  reg1: string;
  reg2 : integer;
begin
  if pgAreas.ActivePage = tsAreas then begin
    reg1 := qyAreas.FieldByName('cd_area').AsString;
    qyAreas.Post;
    qyAreas.Close;
    qyAreas.Open;
    qyAreas.Locate('cd_area', reg1, []);
  end
  else begin
    reg2 := qyDisc.FieldByName('cd_disc').AsInteger;
    qyDiscInsert.Post;
    qyDiscInsert.Close;
    qyDiscInsert.Open;
    qyDisc.Close;
    qyDisc.Open;
    qyDisc.Locate('cd_disc', reg2, []);
  end;
end;

procedure Tfrm_CadProcSelAreas.btnCancelarClick(Sender: TObject);
begin
  if pgAreas.ActivePage = tsAreas then begin
    qyAreas.Cancel;
  end
  else begin
    qyDiscInsert.Cancel;
  end;
end;

procedure Tfrm_CadProcSelAreas.srcAreasStateChange(Sender: TObject);
begin
  if pgAreas.ActivePage = tsAreas then begin
    btnInserir.Enabled := not (qyAreas.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyAreas.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyAreas.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyAreas.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyAreas.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyAreas.State in [dsInsert, dsEdit]);
  end;
end;

procedure Tfrm_CadProcSelAreas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyAreas, pmQtd);
end;

procedure Tfrm_CadProcSelAreas.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_CadProcSelAreas.DBGrid1DblClick(Sender: TObject);
begin
  pgAreas.ActivePage := tsDisciplinas;
end;

procedure Tfrm_CadProcSelAreas.srcAreasDataChange(Sender: TObject;
  Field: TField);
begin
  pnTituloDisciplinas.Caption := 'Disciplinas da Área de Concentração: ' + qyAreas.FieldByName('cd_area').AsString;
  qyDisc.Close();
  qyDisc.Open();
end;

procedure Tfrm_CadProcSelAreas.qyDiscNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('cd_area').AsString := qyAreas.FieldByName('cd_area').AsString;
end;

procedure Tfrm_CadProcSelAreas.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([]);
   
   if not resultado_filtro.filtrado then Exit;

   if not (qyDiscInsert.State in [dsInsert,dsEdit]) then
   begin
      qyDiscInsert.Edit();
   end;

   qyDiscInsert.FieldByName('cd_disc').AsInteger := resultado_filtro.cd_disciplina;
   qyDiscInsert.FieldByName('cd_curso').AsString := resultado_filtro.cd_curso;

   lbDisciplina.Caption := resultado_filtro.ds_disciplina;
   lbCurso.Caption := resultado_filtro.cd_curso;
end;

procedure Tfrm_CadProcSelAreas.srcDiscDataChange(Sender: TObject;
  Field: TField);
begin
  lbDisciplina.Caption := qyDisc.FieldByName('descricao').AsString;
  lbCurso.Caption := qyDisc.FieldByName('cd_curso').AsString;
  qyDiscInsert.Close();
  qyDiscInsert.Open();
end;

procedure Tfrm_CadProcSelAreas.qyDiscInsertAfterPost(DataSet: TDataSet);
begin
  qyDisc.Close();
  qyDisc.Open();
end;

procedure Tfrm_CadProcSelAreas.srcDiscInsertStateChange(Sender: TObject);
begin
  if pgAreas.ActivePage = tsDisciplinas then begin
    btnInserir.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyDiscInsert.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyDiscInsert.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyDiscInsert.State in [dsInsert, dsEdit]);
  end;
end;

procedure Tfrm_CadProcSelAreas.qyDiscInsertNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('cd_area').AsString := qyAreas.FieldByName('cd_area').AsString;
  lbDisciplina.Caption := '';
  lbCurso.Caption := '';
end;

end.

