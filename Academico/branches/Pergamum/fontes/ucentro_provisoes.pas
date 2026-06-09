unit ucentro_provisoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Variants, Menus;

type
  Tfrm_centro_provisoes = class(TForm)
    Panel3: TPanel;
    Bevel7: TBevel;
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
    tblProvisoes: TUMZQuery;
    dsProvisoes: TDataSource;
    tblCentros: TUMZQuery;
    srcCentros: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel5: TBevel;
    pnFiltroAnosemestre: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    grd: TDBGrid;
    Panel6: TPanel;
    tblContas: TUMZQuery;
    tblProvisoesdescConta: TStringField;
    Panel1: TPanel;
    qyCombo: TUMZQuery;
    pmQtdTurmas: TPopupMenu;
    pmQtdProvisoes: TPopupMenu;
    tblCentrosds_centro: TStringField;
    tblCentroscd_classificacao: TStringField;
    tblContasds_conta: TStringField;
    tblContasds_observacao: TMemoField;
    tblContascd_classificacao: TStringField;
    tblProvisoesvl_previsao: TFloatField;
    Bevel3: TBevel;
    Panel4: TPanel;
    Bevel4: TBevel;
    DBText1: TDBText;
    Panel7: TPanel;
    Label8: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDownCursos: TUpDown;
    Panel8: TPanel;
    lbAnosemestre: TLabel;
    txtAnoSemestre2: TMaskEdit;
    UpDown1: TUpDown;
    tblContascd_conta: TLargeintField;
    tblContascd_apropriacao: TIntegerField;
    tblContastp_conta: TSmallintField;
    tblContastp_entrada_saida: TIntegerField;
    tblCentroscd_centro: TLargeintField;
    tblProvisoescd_centro: TLargeintField;
    tblProvisoesnr_anosemestre: TIntegerField;
    tblProvisoescd_conta: TLargeintField;
    pnCadastroAnosemestre: TPanel;
    Label2: TLabel;
    fdAnoSem: TDBEdit;
    Panel9: TPanel;
    Label3: TLabel;
    fdConta: TDBEdit;
    fdDescricao: TDBLookupComboBox;
    Label4: TLabel;
    fdPrevisto: TDBEdit;
    Label1: TLabel;
    procedure srcCentrosDataChange(Sender: TObject; Field: TField);
    procedure tblProvisoesBeforeEdit(DataSet: TDataSet);
    procedure tblProvisoesBeforeInsert(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsProvisoesStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblProvisoesNewRecord(DataSet: TDataSet);
    procedure fdPrevistoKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure cbCursoExit(Sender: TObject);
    procedure cbTurmaExit(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure cbCursoChange(Sender: TObject);
    procedure cbAnoSemestreClick(Sender: TObject);
    procedure pmQtdTurmasPopup(Sender: TObject);
    procedure pmQtdProvisoesPopup(Sender: TObject);
    procedure fdAnoSemKeyPress(Sender: TObject; var Key: Char);
    procedure fdContaKeyPress(Sender: TObject; var Key: Char);
    procedure fdDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure filtrar;

  public
    { Public declarations }
  end;

var
  frm_centro_provisoes: Tfrm_centro_provisoes;

implementation

uses Main, uDM, Math, uUsuario;

{$R *.DFM}

procedure Tfrm_centro_provisoes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_centro_provisoes.btnExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 2023, npExcluir, True ) then Abort;

  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     tblProvisoes.Delete;
  end;
end;

procedure Tfrm_centro_provisoes.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_centro_provisoes.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_centro_provisoes.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure Tfrm_centro_provisoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_centro_provisoes.btnInserirClick(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 1;
   fdConta.SetFocus;

   tblProvisoes.Insert;
end;

procedure Tfrm_centro_provisoes.btnAlterarClick(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 1;
   fdConta.SetFocus;

   tblProvisoes.Edit;
end;

procedure Tfrm_centro_provisoes.btnSalvarClick(Sender: TObject);
Var
   cd_centro, cd_conta, nr_anosemestre : integer;
begin

   cd_centro := tblProvisoescd_centro.AsInteger;
   cd_conta := tblProvisoescd_conta.AsInteger;
   nr_anosemestre := tblProvisoesnr_anosemestre.AsInteger;

   tblProvisoes.Post;

   filtrar;
   
   tblProvisoes.Locate('nr_anosemestre;cd_centro;cd_conta', VarArrayOf([nr_anosemestre, cd_centro, cd_conta]), []);
end;

procedure Tfrm_centro_provisoes.btnCancelarClick(Sender: TObject);
begin
   tblProvisoes.Cancel;
end;

procedure Tfrm_centro_provisoes.dsProvisoesStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblProvisoes.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblProvisoes.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblProvisoes.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_centro_provisoes.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   PageControl1.ActivePageIndex := 0;

   DM.TodasMaiusculas(TForm(Sender));

   tblContas.Close;
   tblContas.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   tblContas.Open;

   tblCentros.Close;
   tblCentros.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   tblCentros.Open;

   filtrar;
end;

procedure Tfrm_centro_provisoes.tblProvisoesNewRecord(DataSet: TDataSet);
begin
   tblProvisoesnr_anosemestre.AsInteger := StrToInt(txtAnoSemestre.Text);
   tblProvisoescd_centro.AsInteger := tblCentroscd_centro.AsInteger;

   PageControl1.ActivePageIndex := 1;
   fdConta.SetFocus;
end;

procedure Tfrm_centro_provisoes.fdPrevistoKeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   IF KEY = #13 tHEN
   Begin
       if tblProvisoes.State in [dsInsert, dsEdit] then begin
          btnSalvar.Click;
       end;  
       Key := #0;
   End;

end;

procedure Tfrm_centro_provisoes.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   IF (tblProvisoes.State in [dsInsert, dsEdit])
      and (PageControl1.ActivePageIndex = 1) 
   then
      AllowChange := False
   else
      AllowChange := True;
end;

procedure Tfrm_centro_provisoes.FormCreate(Sender: TObject);
begin
   txtAnoSemestre.text := IntToStr(ano_semestre);
   txtAnoSemestre2.text := txtAnoSemestre.text;

   pnFiltroAnosemestre.Visible := DM.UsaAnosemestre;
   lbAnosemestre.Visible := pnFiltroAnosemestre.Visible;
   txtAnoSemestre2.Visible := pnFiltroAnosemestre.Visible;
   UpDown1.Visible := pnFiltroAnosemestre.Visible;
   pnCadastroAnosemestre.Visible := pnFiltroAnosemestre.Visible;
end;

procedure Tfrm_centro_provisoes.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  txtAnoSemestre2.Text := txtAnoSemestre.Text;

  filtrar;

end;

procedure Tfrm_centro_provisoes.filtrar;
begin
   tblProvisoes.Close;
   
   tblProvisoes.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   tblProvisoes.ParamByName('codigo').AsInteger := tblCentroscd_centro.AsInteger;

   tblProvisoes.Open;
end;

procedure Tfrm_centro_provisoes.cbCursoExit(Sender: TObject);
begin
   filtrar;
end;

procedure Tfrm_centro_provisoes.cbTurmaExit(Sender: TObject);
begin
   filtrar
end;

procedure Tfrm_centro_provisoes.cbTurmaChange(Sender: TObject);
begin
   filtrar;
end;

procedure Tfrm_centro_provisoes.cbCursoChange(Sender: TObject);
begin
   filtrar
end;

procedure Tfrm_centro_provisoes.cbAnoSemestreClick(Sender: TObject);
begin
   filtrar;
end;

procedure Tfrm_centro_provisoes.pmQtdTurmasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblCentros, pmQtdTurmas);

end;

procedure Tfrm_centro_provisoes.srcCentrosDataChange(Sender: TObject; Field: TField);
begin
   filtrar;
end;

procedure Tfrm_centro_provisoes.pmQtdProvisoesPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblProvisoes, pmQtdProvisoes);

end;

procedure Tfrm_centro_provisoes.fdAnoSemKeyPress(Sender: TObject;
  var Key: Char);
begin

   if Key = #13 then begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   end;
   
end;

procedure Tfrm_centro_provisoes.fdContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   end;

end;

procedure Tfrm_centro_provisoes.fdDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   end;

end;

procedure Tfrm_centro_provisoes.tblProvisoesBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2023, npIncluir, True ) then Abort;
end;

procedure Tfrm_centro_provisoes.tblProvisoesBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2023, npAlterar, True ) then Abort;
end;

end.

