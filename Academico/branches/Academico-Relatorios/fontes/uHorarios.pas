unit uHorarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, TB97, 
  Grids, DBGrids, wwidlg, Wwfltdlg, Wwdatsrc, Wwquery, ComCtrls, TB97Tlbr,
  wwDialog;

type
  TfrmHorarios = class(TForm)
    tbNavigator: TToolbar97;
    dkBottom: TDock97;
    quHorarios: TwwQuery;
    dsHorarios: TwwDataSource;
    fdGeral: TwwFilterDialog;
    paCabecalho: TPanel;
    pcGeral: TPageControl;
    tsFolha: TTabSheet;
    tsGrade: TTabSheet;
    dgGeral: TDBGrid;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnSair: TSpeedButton;
    ToolbarSep971: TToolbarSep97;
    dkTop: TDock97;
    Label2: TLabel;
    Label3: TLabel;
    dbeDescricao: TDBEdit;
    dbeCodigo: TDBEdit;
    quHorariosCodigo: TStringField;
    quHorariosDescricao: TStringField;
    Navigator: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure quHorariosPostError(DataSet: TDataSet; E: EDatabaseError;  var Action: TDataAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure quHorariosBeforePost(DataSet: TDataSet);
    procedure dgGeralDblClick(Sender: TObject);
    procedure dgGeralKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure quHorariosAfterPost(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsHorariosStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHorarios: TfrmHorarios;

implementation

Uses uDM,General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

{$R *.DFM}

procedure TfrmHorarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmHorarios.sbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHorarios.FormCreate(Sender: TObject);
begin
  quHorarios.Open;
  dsHorarios.OnStateChange := dsHorariosStateChange;
end;

procedure TfrmHorarios.quHorariosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmHorarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Passando os campos com Enter para todos os controles que}
  {nao sao tdbgrid e tdbMemo}
  if  ((ActiveControl.ClassType <> TDbGrid)
  and  (ActiveControl.ClassType <> TDbMemo)
  and  (Key = vk_Return))
  or   (Key = 34) then
      begin
        SelectNext (ActiveControl,True,True);
        Key := 0;
      end
  else if Key = 33 then
      SelectNext (ActiveControl,False,True)
  else if  (Key = vk_F2)
       and (BtnIncluir.Enabled) then
      {Incluir}
      BtnIncluirClick(Nil)
  else if  (Key = vk_F3)
       and (BtnAlterar.Enabled) then
      {Alterar}
      BtnAlterarClick(Nil)
  else if  (Key = vk_F4)
       and (BtnSalvar.Enabled) then
      {Salvar}
      BtnSalvarClick(Nil)
  else if  (Key = vk_F5)
       and (BtnExcluir.Enabled) then
      {Excluir}
      BtnExcluirClick(Nil)
  else if  (Key = vk_F6)
       and (BtnCancelar.Enabled) then
      {Cancelar}
      BtnCancelarClick(Nil)
  else if  (Key = vk_F7)
       and (BtnImprimir.Enabled) then
      {Imprimir}
//      BtnImprimirClick(Nil)
  else if  (Key = vk_F8)
       and (BtnPesquisar.Enabled) then
      {Pesquisar}
      BtnPesquisarClick(Nil)
  else if Key = vk_F12 then
      BtnSairClick(Nil);
end;

procedure TfrmHorarios.quHorariosBeforePost(DataSet: TDataSet);
var
  lsMensagem :String;
begin
  {Consistencia dos campos antes de gravar}

  lsMensagem := '';

  if quHorarios.FieldByName('Codigo').AsInteger = 0 then
     begin
       lsMensagem := 'O Código não deve ser nulo...';
       dbeCodigo.SetFocus;
     end;

  {Se alguma mensagem de erro ocorrer o procedimento é abortado}
  if lsMensagem <> '' then
     begin
       Mensagem(lsMensagem, Application.Title, MB_OK + MB_ICONSTOP );
       Abort;
     end;
end;

procedure TfrmHorarios.dgGeralDblClick(Sender: TObject);
begin
  {Caso seja dado dois click's no grid}
  {o dataset e colocado em estado de edicao e a pagina é setada para}
  {folha de dados}
  pcGeral.ActivePage := tsFolha;
  quHorarios.Edit;
end;

procedure TfrmHorarios.dgGeralKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {O mesmo procedimento descrito acima funciona para a tecla [Enter]}
  {pressionada sob o registro no grid}
  if key = vk_Return then
     dgGeralDblClick(Nil);
end;

procedure TfrmHorarios.quHorariosAfterPost(DataSet: TDataSet);
begin
  quHorarios.Close;
  quHorarios.Open;
end;

procedure TfrmHorarios.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHorarios.btnPesquisarClick(Sender: TObject);
begin
  {Caso a opcao de filtro seja setada a pagina grade automaticamente}
  {é setado para melhor visualização do filtro}

  if pcGeral.ActivePage <> tsGrade then
     pcGeral.ActivePage := tsGrade;
  fdGeral.Execute;
end;

procedure TfrmHorarios.btnIncluirClick(Sender: TObject);
begin
  quHorarios.Insert;
end;

procedure TfrmHorarios.btnAlterarClick(Sender: TObject);
begin
  quHorarios.Edit;
end;

procedure TfrmHorarios.btnSalvarClick(Sender: TObject);
begin
  quHorarios.Post;
end;

procedure TfrmHorarios.btnExcluirClick(Sender: TObject);
begin
  {Trocando a mensssagem em ingles dos controles do Delphi}
  {Por uma mensagem em português}
  if Mensagem('Confirma exclusão do Registro ?',Application.Title,Mb_YesNo) = id_Yes then
     quHorarios.Delete;
end;

procedure TfrmHorarios.btnCancelarClick(Sender: TObject);
begin
  quHorarios.Cancel;
end;

procedure TfrmHorarios.FormShow(Sender: TObject);
begin
  dsHorariosStateChange(dsHorarios);
end;

procedure TfrmHorarios.dsHorariosStateChange(Sender: TObject);
begin
  {Habilitando e Desabilitando os botoes}
  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnImprimir.Enabled    := TDataSource( Sender ).State in [dsBrowse];
  btnPesquisar.Enabled   := TDataSource( Sender ).State in [dsBrowse];

  {Se houve evento de change no datasource entao a pagina atual é tsFolha}
  if pcGeral.ActivePage <> tsFolha then
     pcGeral.ActivePage := tsFolha;

  {Habilitando e Desabilitando as chaves de acordo com o}
  {estado do Dataset}

  dbeCodigo.Enabled := (quHorarios.State in [dsInsert]);

  if dbeCodigo.Enabled then
     dbeCodigo.SetFocus
  else
     dbeDescricao.SetFocus;

end;


end.

