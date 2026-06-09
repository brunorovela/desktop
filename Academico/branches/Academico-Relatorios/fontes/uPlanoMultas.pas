unit uPlanoMultas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, DBCGrids;

type
  TfPlanoMultas = class(TForm)
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
    qyPlanos: TUMZQuery;
    dsPlanos: TDataSource;
    qyTiposTitulos: TUMZQuery;
    qyTiposTituloscd_tipo_titulo: TSmallintField;
    qyTiposTitulosds_tipo_titulo: TStringField;
    Panel4: TPanel;
    Panel5: TPanel;
    grd: TDBGrid;
    qyPlanosvl_multa: TFloatField;
    qyPlanosdescTipoTitulo: TStringField;
    qyPlanosnr_anosem: TLargeintField;
    qyPlanoscd_tipo_titulo: TLargeintField;
    qyPlanosnr_dia_vencimento: TLargeintField;
    qyPlanosID_MULTA: TLargeintField;
    pnFiltroAnosemestre: TPanel;
    ckbAnoSem: TCheckBox;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    Bevel2: TBevel;
    pnCadastroAnosemestre: TPanel;
    dbAnoSem: TDBEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    btnCopiar: TToolButton;
    ToolButton5: TToolButton;
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure btnCopiarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbAnoSemClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dsPlanosStateChange(Sender: TObject);
    procedure qyPlanosNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Filtrar();

  public
    { Public declarations }
  end;

var
  fPlanoMultas: TfPlanoMultas;

implementation

uses uDM, Main, uSelAnoSemestre;

{$R *.DFM}

{ TfPlanosDisciplinas }

procedure TfPlanoMultas.btnAlterarClick(Sender: TObject);
begin
   dbAnoSem.SetFocus();
   qyPlanos.Edit();
end;

procedure TfPlanoMultas.btnCancelarClick(Sender: TObject);
begin
   qyPlanos.Cancel();
end;

procedure TfPlanoMultas.btnExcluirClick(Sender: TObject);
begin
   if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      qyPlanos.Delete();
   end;
end;

procedure TfPlanoMultas.btnInserirClick(Sender: TObject);
begin
   if DM.UsaAnosemestre then
      dbAnoSem.SetFocus()
   else
      DBLookupComboBox1.SetFocus;   

   qyPlanos.Insert();
end;

procedure TfPlanoMultas.btnSalvarClick(Sender: TObject);
begin
   qyPlanos.Post();
   Filtrar();
end;

procedure TfPlanoMultas.ckbAnoSemClick(Sender: TObject);
begin
   txtAnoSemestre.Enabled := ckbAnoSem.Checked;
   UpDown1.Enabled := ckbAnoSem.Checked;
end;

procedure TfPlanoMultas.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['.'] then
  begin
    Key := ',';
  end;
end;

procedure TfPlanoMultas.dsPlanosStateChange(Sender: TObject);
begin

   btnInserir.Enabled  := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled  := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled  := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled   := (qyPlanos.State in [dsInsert, dsEdit]);
   btnCancelar.Enabled := (qyPlanos.State in [dsInsert, dsEdit]);
   btnFechar.Enabled   := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled     := not (qyPlanos.State in [dsInsert, dsEdit]);

end;

procedure TfPlanoMultas.Filtrar;
begin

   qyPlanos.Close();
   qyPlanos.SQL.Text :=
     ' SELECT * FROM fin_plano_multas  ';
     
   if ckbAnoSem.Checked then begin

     qyPlanos.SQL.Add(' WHERE nr_anosem = ' + txtAnoSemestre.Text);

   end;

   qyPlanos.SQL.Add(' ORDER BY nr_anosem DESC, cd_tipo_titulo, nr_dia_vencimento ');
     
   qyPlanos.Open();

end;

procedure TfPlanoMultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfPlanoMultas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfPlanoMultas.FormShow(Sender: TObject);
begin

   qyTiposTitulos.SQL.Text := ' SELECT cd_tipo_titulo, ds_tipo_titulo FROM fin_config_tipos_titulo ';
   qyTiposTitulos.SQL.Add(' WHERE ct_tipo_titulo = 1 AND sn_ativo = 1 AND cd_coligada_matriz = :cd_coligada_matriz ORDER BY ds_tipo_titulo ');
   qyTiposTitulos.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   pnFiltroAnosemestre.Visible := DM.UsaAnosemestre;
   pnCadastroAnosemestre.Visible := pnFiltroAnosemestre.Visible;

   txtAnoSemestre.text := IntToStr(ano_semestre);

   Filtrar();
end;

procedure TfPlanoMultas.qyPlanosNewRecord(DataSet: TDataSet);
begin
   if txtAnoSemestre.Visible then
      qyPlanosnr_anosem.AsString := txtAnoSemestre.Text
   else
      qyPlanosnr_anosem.AsString := '1';
end;

procedure TfPlanoMultas.btnCopiarClick(Sender: TObject);
CONST
   SQLReplicaPlanoMulta = 'INSERT INTO fin_plano_multas ( '+
	                       '   nr_anosem,                  '+
	                       '   cd_tipo_titulo,             '+
	                       '   nr_dia_vencimento,          '+
                          ' vl_multa                      '+
                          ' ) SELECT                      '+
	                       '      :AnoSemDestino,          '+
	                       '      f2.cd_tipo_titulo,       '+
	                       '      f2.nr_dia_vencimento,    '+
	                       '      f2.vl_multa              '+
                          '   FROM                        '+
	                       '      fin_plano_multas f2      '+
                          '   WHERE                       '+
	                       '      f2.nr_anosem = :AnoSemAtual ';
var
   qyCopiar: TUMZQuery;
begin

   if not PrincipalForm.ProcuraForm(uFrmSelAnosemestre) then
   begin
      Application.CreateForm(TuFrmSelAnosemestre, uFrmSelAnosemestre);
   end;

   uFrmSelAnosemestre.ShowModal;

   if uFrmSelAnosemestre.ModalResult = mrOk then
   begin
      DM.CriarConsulta(qyCopiar);
      qyCopiar.SQL.Text := SQLReplicaPlanoMulta;

      qyCopiar.ParamByName('AnoSemDestino').AsInteger :=
         StrToInt(uFrmSelAnosemestre.edAnosemestre.Text);

      qyCopiar.ParamByName('AnoSemAtual').AsInteger :=
         StrToInt(txtAnoSemestre.Text);

      qyCopiar.ExecSQL;

      ckbAnoSem.Checked := True;
      txtAnoSemestre.Text := uFrmSelAnosemestre.edAnosemestre.Text;
      Filtrar;
   end;
end;

procedure TfPlanoMultas.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfPlanoMultas.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then begin
    txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  Filtrar();

end;

end.

