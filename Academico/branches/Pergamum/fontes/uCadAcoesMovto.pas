{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadAcoesMovto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Buttons;

type
  Tfrm_CadAcoesMovto = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel6: TBevel;
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
    qyAcoesMovto: TUMZQuery;
    srcAcoesMovto: TDataSource;
    pmQtd: TPopupMenu;
    qyAcoesMovtoativo: TStringField;
    ScrollBox1: TScrollBox;
    qyAcoesMovtods_acao: TStringField;
    qyAcoesMovtosn_ativo: TStringField;
    qyAcoesMovtocd_origem: TSmallintField;
    qyAcoesMovtotp_entrada_saida: TSmallintField;
    qyAcoesTe: TUMZQuery;
    qyAcoesTeds_acao: TStringField;
    qyAcoesTetp_entrada_saida: TSmallintField;
    srcAcoesTe: TDataSource;
    qyAcoesMovtocd_acao: TLargeintField;
    qyAcoesMovtocd_tipo_acao: TSmallintField;
    qyAcoesMovtocd_movimento_caixa: TLargeintField;
    qyAcoesMovtocd_movimento_estorno: TLargeintField;
    qyAcoesMovtocd_acao_automatica: TIntegerField;
    qyAcoesTecd_acao: TLargeintField;
    qyContas: TUMZQuery;
    qyAcoesMovtocd_plano_conta: TLargeintField;
    qyAcoesMovtodesc_conta: TStringField;
    qyAcoesMovtovl_perc_desconto: TFloatField;
    qyAcoesMovtosn_altera_desconto: TSmallintField;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    qyAcoesMovtods_tipo_acao: TStringField;
    qyAcoesMovtocd_historico_baixa: TLargeintField;
    qyAcoesMovtods_historico_baixa: TStringField;
    pnCadastroPrincipal: TPanel;
    Label4: TLabel;
    dbCodigo: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Bevel1: TBevel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    drgOrigem: TDBRadioGroup;
    SpeedButton2: TSpeedButton;
    pnPercentualDescontos: TPanel;
    dbPercDesconto: TDBEdit;
    Label6: TLabel;
    DBCheckBox2: TDBCheckBox;
    procedure srcAcoesMovtoDataChange(Sender: TObject; Field: TField);
    procedure qyAcoesMovtoBeforePost(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qyAcoesMovtoBeforeEdit(DataSet: TDataSet);
    procedure qyAcoesMovtoBeforeInsert(DataSet: TDataSet);
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
    procedure srcAcoesMovtoStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyAcoesMovtoCalcFields(DataSet: TDataSet);
    procedure qyAcoesMovtoAfterInsert(DataSet: TDataSet);
    procedure dbCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodigoExit(Sender: TObject);
  private
    ordem: String;

    procedure Filtra();
  public
    { Public declarations }
  end;

var
  frm_CadAcoesMovto: Tfrm_CadAcoesMovto;
  movtos_te: array of integer;

implementation

uses Main, uDM, uUsuario, uSelConta;

{$R *.dfm}

procedure Tfrm_CadAcoesMovto.FormShow(Sender: TObject);
var
  n: integer;
begin
   qyContas.Close();
   qyContas.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyContas.Open(); 

   ordem := 'ds_acao';

   Filtra;

   DM.qyTiposAcoes.Close;
   DM.qyTiposAcoes.Open;
end;

procedure Tfrm_CadAcoesMovto.grdTitleClick(Column: TColumn);
var
   n: Integer;
begin
   if grd.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
   begin
      exit;
   end;

   For n:= 0 to grd.Columns.Count - 1 do
   begin
      grd.Columns[n].Title.Font.Style := [];
   end;

   Column.Title.Font.Style := [fsUnderline];

   if ordem = Column.FieldName then
   begin
     ordem := Column.FieldName + ' DESC ';
   end
   // Caso o usuário tenha clicado uma segunda vez, remove as duas ordenações
   // e mantem a ordenação de quando se abre a tela
   else if ordem = Column.FieldName + ' DESC ' then
   begin
      ordem := ' ds_acao ';
      Column.Title.Font.Style := []
   end
   else
   begin
     ordem := Column.FieldName;
   end;

   Filtra;
end;

procedure Tfrm_CadAcoesMovto.Filtra;
const
   SQL_FILTRA = 
      ' SELECT ' +
      ' 	fam.*, ' +
      ' 	(CASE fam.cd_origem ' +
      '     WHEN 1 THEN CONCAT(fat.ds_tipo_acao, '' CR'') ' +
      '     WHEN 2 THEN CONCAT(fat.ds_tipo_acao, '' CP'') ' +
      ' 	END) AS ds_tipo_acao ' +
      ' FROM ' +
      ' 	fin_acoes_movimento fam ' +
      ' INNER JOIN fin_acoes_tipos fat ON( ' +
      ' 	fat.cd_tipo_acao = fam.cd_tipo_acao ' +
      ' ) ' +
      ' WHERE ' +
      ' 	fam.cd_tipo_acao IN (2, 3) ' +
      ' 	AND fam.cd_acao_automatica IS NULL ' ;
begin

   qyAcoesMovto.Close;
   qyAcoesMovto.SQL.Text := SQL_FILTRA;
   qyAcoesMovto.SQL.Add(' ORDER BY  ' + ordem);
   qyAcoesMovto.Open;

end;

procedure Tfrm_CadAcoesMovto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadAcoesMovto.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_CadAcoesMovto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadAcoesMovto.btnExcluirClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 2031, npExcluir, True ) then Abort;

  if (DM.ExisteRegistro('fin_mov_tesouraria',['cd_acao'],[qyAcoesMovto.FieldByName('cd_acao').AsString])) OR (DM.ExisteRegistro('fin_mov_cp',['cd_acao'],[qyAcoesMovto.FieldByName('cd_acao').AsString])) then
  begin
    Mensagem( 'Não é possível excluir este registro.'+CHR(13)+'Há informações ligadas a ele.', Application.Title, MB_OK + MB_ICONWARNING );
    Exit;
  end;

  IF qyAcoesMovto.FieldByName('cd_acao_automatica').AsInteger > 0  then
  begin
    Mensagem( 'Não é possível excluir uma ação de movimento automática.', Application.Title, MB_OK + MB_ICONWARNING );
    Exit;
  end;

  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     DM.gerar_log_acesso(2105, 'N', 'N', 'N', 'S');
     qyAcoesMovto.Delete;
  end;
end;

procedure Tfrm_CadAcoesMovto.btnFecharClick(Sender: TObject);
begin
   qyAcoesMovto.Close;
   Close;
end;

procedure Tfrm_CadAcoesMovto.btnInserirClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   qyAcoesMovto.Insert;
end;

procedure Tfrm_CadAcoesMovto.btnAlterarClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   qyAcoesMovto.Edit;
end;

procedure Tfrm_CadAcoesMovto.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qyAcoesMovto.FieldByName('cd_acao').AsInteger;

  { Gerando LOG de acesso }
  if qyAcoesMovto.State in [dsInsert] then
   DM.gerar_log_acesso(2105, 'N', 'S', 'N', 'N')
  else
   DM.gerar_log_acesso(2105, 'N', 'N', 'S', 'N');

  qyAcoesMovto.Post;
  Filtra;

  qyAcoesMovto.Locate('cd_acao', reg, []);
end;

procedure Tfrm_CadAcoesMovto.btnCancelarClick(Sender: TObject);
begin
   qyAcoesMovto.Cancel;
end;

procedure Tfrm_CadAcoesMovto.srcAcoesMovtoDataChange(Sender: TObject;
  Field: TField);
begin
   if DM.qyTiposAcoescd_tipo_acao.AsInteger <> 3 then
   begin
      pnPercentualDescontos.Visible := False;
   end
   else
   begin
      pnPercentualDescontos.Visible := True;
   end;
end;

procedure Tfrm_CadAcoesMovto.srcAcoesMovtoStateChange(Sender: TObject);
begin

    if qyAcoesMovto.State in [dsInsert] then
    begin
      drgOrigem.ReadOnly := False;
    end
    else
    if (DM.ExisteRegistro('fin_mov_tesouraria',['cd_acao'],[qyAcoesMovto.FieldByName('cd_acao').AsString])) OR (DM.ExisteRegistro('fin_mov_cp',['cd_acao'],[qyAcoesMovto.FieldByName('cd_acao').AsString])) then
    begin
      drgOrigem.ReadOnly := True;
    end
    else
    begin
      drgOrigem.ReadOnly := False;
    end;

    btnInserir.Enabled := not (qyAcoesMovto.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyAcoesMovto.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyAcoesMovto.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled  := qyAcoesMovto.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyAcoesMovto.State in [dsInsert, dsEdit];
    btnFechar.Enabled   := not (qyAcoesMovto.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadAcoesMovto.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyAcoesMovto, pmQtd);
end;

procedure Tfrm_CadAcoesMovto.qyAcoesMovtoCalcFields(DataSet: TDataSet);
begin

  {
  #SE= O campo sn_ativo da tabela for igual a S
  }
  if DM.isTrue(qyAcoesMovto.FieldByName('sn_ativo').AsString) then
    {
    #ENTAO= Atribua o valor X ao campo ativa
    }
    if qyAcoesMovtocd_acao_automatica.AsInteger > 0 then
       qyAcoesMovto.FieldByName('ativo').AsString := 'Aut'
    else
       qyAcoesMovto.FieldByName('ativo').AsString := 'X';

end;

procedure Tfrm_CadAcoesMovto.SpeedButton2Click(Sender: TObject);
begin
  // Seleção de Plano de Contas
  if not (qyAcoesMovto.State in [dsInsert, dsEdit]) then begin
     qyAcoesMovto.Edit;
  end;

  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyAcoesMovtocd_plano_conta.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

Procedure Tfrm_CadAcoesMovto.qyAcoesMovtoAfterInsert(DataSet: TDataSet);
begin
   qyAcoesMovto.FieldByName('cd_acao').AsInteger := DM.ProximoId('cd_acao', 'fin_acoes_movimento');

   // Deverá sempre ser só 2
   qyAcoesMovtotp_entrada_saida.AsInteger := 2;
   qyAcoesMovtosn_ativo.AsString := 'S';
end;

procedure Tfrm_CadAcoesMovto.dbCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
       SelectNext(Sender as TWincontrol, True, True);
       Key := #0;
   end;
end;

procedure Tfrm_CadAcoesMovto.dbCodigoExit(Sender: TObject);
var
  intCod : Integer;
begin

   { Somente alterar o código quando tiver inserindo }
   if not (qyAcoesMovto.State = dsInsert) then
      Exit;

   { Ignorar a inclusão se o código ficou em branco }
   if qyAcoesMovto.FieldByName('cd_acao').AsString = '' then
   begin
      qyAcoesMovto.Cancel;
      Exit;
   end;

   { Guardar o código para pesquisa posterior }

   intCod := qyAcoesMovto.FieldByName('cd_acao').AsInteger;

   Dm.qyAux2.Close;
   DM.qyAux2.SQL.Clear;
   DM.qyAux2.SQL.Add('SELECT * From fin_acoes_movimento WHERE cd_acao = :cd_acao');
   Dm.qyAux2.ParamByName('cd_acao').AsInteger := intCod;
   DM.qyAux2.Open;

   if not DM.qyAux2.Eof then
   begin
       qyAcoesMovto.Cancel();
       qyAcoesMovto.Locate('cd_acao', intCod, []);
   end;

   btnAlterarClick(nil); 

end;

procedure Tfrm_CadAcoesMovto.qyAcoesMovtoBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2031, npIncluir, True ) then Abort;

   pnPercentualDescontos.Visible := False;
end;

procedure Tfrm_CadAcoesMovto.qyAcoesMovtoBeforePost(DataSet: TDataSet);
begin
   if not(pnPercentualDescontos.Visible) then
   begin
      qyAcoesMovtovl_perc_desconto.Clear;
      qyAcoesMovtosn_altera_desconto.Clear;
   end;
end;

procedure Tfrm_CadAcoesMovto.qyAcoesMovtoBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2031, npAlterar, True ) then Abort;
end;

end.

