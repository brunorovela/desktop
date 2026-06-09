{
#TIT= Cadastro de Planos de Contas
#OBJ= Cadastrar planos de contas e alterar/excluir os já existentes
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadPlanosContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, dbcgrids, StrUtils, Buttons;

type
  Tfrm_CadPlanoContas = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
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
    qyPlanosContas: TUMZQuery;
    srcPlanosContas: TDataSource;
    pmQtd: TPopupMenu;
    qyPlanosContasds_conta: TStringField;
    qyPlanosContascd_classificacao: TStringField;
    qyPlanosContastp_conta: TSmallintField;
    qyPlanosContasds_tp_conta: TStringField;
    qyPlanosContasds_observacao: TMemoField;
    qyPlanosContastp_entrada_saida: TSmallintField;
    ScrollBox1: TScrollBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Bevel4: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    deClassificacao: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    drgTipoConta: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBMemo1: TDBMemo;
    Panel6: TPanel;
    Label4: TLabel;
    qyCriteriosApropriacao: TUMZQuery;
    qyCriteriosApropriacaods_apropriacao: TStringField;
    qyCriteriosApropriacaods_observacao: TStringField;
    qyCriteriosApropriacaovl_total: TFloatField;
    srcCriteriosApropriacao: TDataSource;
    qyPlanosContascd_coligada_matriz: TSmallintField;
    qyPlanosContassn_ativo: TSmallintField;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    qyPlanosContascd_conta_contabil: TStringField;
    qyPlanosContascd_conta: TLargeintField;
    qyPlanosContascd_apropriacao: TIntegerField;
    qyCriteriosApropriacaocd_apropriacao: TLargeintField;
    qyPlanosContascd_grupo_contas: TIntegerField;
    dblcTipoContas: TDBLookupComboBox;
    Label7: TLabel;
    qryBuscaTipoContas: TUMZQuery;
    dsTipoContas: TDataSource;
    sbLimpar: TSpeedButton;
    procedure qyPlanosContasAfterPost(DataSet: TDataSet);
    procedure sbLimparClick(Sender: TObject);
    procedure srcPlanosContasDataChange(Sender: TObject; Field: TField);
    procedure qyPlanosContasBeforePost(DataSet: TDataSet);
    procedure qyPlanosContasBeforeInsert(DataSet: TDataSet);
    procedure qyPlanosContasBeforeEdit(DataSet: TDataSet);
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
    procedure srcPlanosContasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyPlanosContasCalcFields(DataSet: TDataSet);
    procedure grdDblClick(Sender: TObject);
    procedure qyPlanosContasAfterInsert(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
  private
    procedure AtualizaPlanoContasFilhas(Classificacao: String; CodigoGrupoContas: Integer);
  public
    { Public declarations }
  end;

var
  frm_CadPlanoContas: Tfrm_CadPlanoContas;

implementation

uses Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadPlanoContas.FormShow(Sender: TObject);
begin

   qryBuscaTipoContas.Close;
   qryBuscaTipoContas.Open;

   // selecionar o plano de contas somente da unidade de ensino selecionada
   qyPlanosContas.Close();
   qyPlanosContas.ParamByName('Cd_Coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyPlanosContas.Open();

   qyCriteriosApropriacao.Open();

   { Definindo a máscara do campo Classificação }
   qyPlanosContas.FieldByName('cd_classificacao').EditMask := DM.variavel_parametro('mascara_plano_contas');

end;

procedure Tfrm_CadPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadPlanoContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Teclas de Atalho
  
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

procedure Tfrm_CadPlanoContas.btnSairClick(Sender: TObject);
begin
  // Fechar o formulário
  Close();
end;

procedure Tfrm_CadPlanoContas.btnExcluirClick(Sender: TObject);
Var
  sChave : String;
begin
   if not DM.UsuarioLogado.TemPermissao( 2022, npExcluir, True ) then Abort;

   if DM.ExisteRegistroColigadas( 'fin_apropria_te', 'cd_coligada', ['cd_conta'], [qyPlanosContas.FieldByName('cd_conta').AsString] ) OR
      DM.ExisteRegistroColigadas( 'fin_apropria_cp', 'cd_coligada', ['cd_conta'], [qyPlanosContas.FieldByName('cd_conta').AsString] ) then
   begin
      Mensagem( 'Não é possível excluir este registro.'+CHR(13)+'Há informações ligadas a ele. Você pode somente desativá-lo', Application.Title, MB_OK + MB_ICONWARNING );
      Exit;
   end;

   if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      sChave := qyPlanosContascd_conta.AsString + ';';
      sChave := sChave + qyPlanosContascd_coligada_matriz.AsString;

      DM.setLog(2022, 'Exclusao', sChave, DM.UsuarioLogado.ColigadaLogada);
      qyPlanosContas.Delete();
   end;
end;

procedure Tfrm_CadPlanoContas.btnFecharClick(Sender: TObject);
begin
   // Fechar o cadastro de Contas
   qyPlanosContas.Close();
   Close();
end;

procedure Tfrm_CadPlanoContas.btnInserirClick(Sender: TObject);
begin
   // Inclusão de Plano
   DBEdit1.SetFocus();
   qyPlanosContas.Insert();
end;

procedure Tfrm_CadPlanoContas.AtualizaPlanoContasFilhas(Classificacao: String; CodigoGrupoContas: Integer);
const
   SQL_ALTERA_PLANOS_CONTAS_FILHAS = ' UPDATE '+
      ' 	fin_config_plano_contas '+
      ' SET '+
      ' 	cd_grupo_contas = :cd_grupo_contas '+
      ' WHERE '+
      ' 	cd_classificacao >= :classificacao AND '+
      ' 	cd_classificacao LIKE CONCAT(SUBSTR(:classificacao FROM 1 FOR IF(INSTR(:classificacao, '' '') = 0, LENGTH(:classificacao), INSTR(:classificacao, '' '') - 1)), ''%'') ';
var
   qyAlteraPlanos: TUMZQuery;
begin
   DM.CriarConsulta(qyAlteraPlanos);
   
   qyAlteraPlanos.SQL.Text := SQL_ALTERA_PLANOS_CONTAS_FILHAS;

   qyAlteraPlanos.ParamByName('classificacao').AsString := Classificacao;

   if CodigoGrupoContas = 0 then
   begin
      qyAlteraPlanos.SQL.Text := StringReplace(qyAlteraPlanos.SQL.Text, ':cd_grupo_contas', 'NULL', [rfIgnoreCase, rfReplaceAll]);
   end
   else
   begin
      qyAlteraPlanos.ParamByName('cd_grupo_contas').AsInteger := CodigoGrupoContas;
   end;

   qyAlteraPlanos.ExecSQL;

   qyPlanosContas.Refresh;
end;

procedure Tfrm_CadPlanoContas.btnAlterarClick(Sender: TObject);
begin
   // Alteraração do Plano
   DBEdit1.SetFocus();
   qyPlanosContas.Edit();
end;

procedure Tfrm_CadPlanoContas.btnSalvarClick(Sender: TObject);
Var
  reg: Pointer;
begin
  // Salvar o plano
  reg := qyPlanosContas.GetBookmark;

  qyPlanosContas.Post();
  qyPlanosContas.Close();
  qyPlanosContas.Open();
  qyPlanosContas.GotoBookmark(reg);

end;

procedure Tfrm_CadPlanoContas.btnCancelarClick(Sender: TObject);
begin
   // cancelar alterações
   qyPlanosContas.Cancel();
end;

procedure Tfrm_CadPlanoContas.sbLimparClick(Sender: TObject);
begin
   qyPlanosContas.Edit;
   qyPlanosContascd_grupo_contas.Clear;
   qyPlanosContas.Post;
end;

procedure Tfrm_CadPlanoContas.srcPlanosContasDataChange(Sender: TObject;
  Field: TField);
const
   SQL_BUSCA_CONTAS = ' SELECT '+
      ' 	cd_classificacao, '+
      ' 	cd_conta '+
      ' FROM '+
      ' 	fin_config_plano_contas '+
      ' WHERE '+
      ' 	cd_grupo_contas IS NOT NULL '+
      ' 	AND cd_classificacao < :classificacao';
var
   comparacao, separador: String;
   classificacao: TStringList;
   qyBuscaPlanoContas: TUMZReadOnlyQuery;
   i: Integer;
begin
   dblcTipoContas.Enabled := True;

   DM.CriarConsulta(qyBuscaPlanoContas);

   qyBuscaPlanoContas.SQL.Text := SQL_BUSCA_CONTAS;

   qyBuscaPlanoContas.ParamByName('classificacao').AsString :=
      qyPlanosContascd_classificacao.AsString;

   qyBuscaPlanoContas.Open;

   comparacao := '';
   separador := '';

   classificacao := TStringList.Create;

   SplitString(qyPlanosContascd_classificacao.AsString, '.', classificacao);

//   while not qyBuscaPlanoContas.Eof do
//   begin
      for I := 0 to classificacao.Count - 1 do
      begin
         comparacao := comparacao + separador +  classificacao.Strings[i];

         separador := '.';



         if (qyBuscaPlanoContas.Locate('cd_classificacao', comparacao, [loCaseInsensitive])) and
            (qyPlanosContascd_classificacao.AsString <> qyBuscaPlanoContas.FieldByName('cd_classificacao').AsString) then
         begin
            dblcTipoContas.Enabled := False;
         end;
      end;

//      qyBuscaPlanoContas.Next;
//   end;
end;

procedure Tfrm_CadPlanoContas.srcPlanosContasStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyPlanosContas.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyPlanosContas.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyPlanosContas.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyPlanosContas.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyPlanosContas.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyPlanosContas.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadPlanoContas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyPlanosContas, pmQtd);
end;

procedure Tfrm_CadPlanoContas.qyPlanosContasCalcFields(DataSet: TDataSet);
begin

  case qyPlanosContas.FieldByName('tp_conta').AsInteger of
    1: qyPlanosContas.FieldByName('ds_tp_conta').AsString := 'Analítica';
    2: qyPlanosContas.FieldByName('ds_tp_conta').AsString := 'Sintética';
  end;

end;

procedure Tfrm_CadPlanoContas.grdDblClick(Sender: TObject);
var
  reg: Pointer;
begin
  if grd.SelectedIndex = 2 then
  begin

  if DM.ExisteRegistroColigadas( 'fin_apropria_te', 'cd_coligada', ['cd_conta'], [qyPlanosContas.FieldByName('cd_conta').AsString] ) OR
     DM.ExisteRegistroColigadas( 'fin_apropria_cp', 'cd_coligada', ['cd_conta'], [qyPlanosContas.FieldByName('cd_conta').AsString] ) OR
     DM.ExisteRegistroColigadas( 'fin_criterios_apropria_itens', 'cd_coligada', ['cd_apropriacao'], [qyPlanosContas.FieldByName('cd_apropriacao').AsString] ) then
  begin
    Mensagem( 'Não é possível alterar este registro.' + #13 + 'Há informações ligadas a ele.', Application.Title, MB_OK + MB_ICONWARNING );
    Exit;
  end;

    case qyPlanosContas.FieldByName('tp_conta').AsInteger of
      1: begin
        qyPlanosContas.Edit;
        qyPlanosContas.FieldByName('tp_conta').AsInteger := 2;
      end;
      2: begin
        qyPlanosContas.Edit;
        qyPlanosContas.FieldByName('tp_conta').AsInteger := 1;
      end;
    end;

    reg := qyPlanosContas.GetBookmark();
    qyPlanosContas.Post();
    qyPlanosContas.Close();
    qyPlanosContas.Open();
    qyPlanosContas.GotoBookmark(reg);

  end;

end;

procedure Tfrm_CadPlanoContas.qyPlanosContasAfterInsert(DataSet: TDataSet);
begin
  // Inclusão
  qyPlanosContas.FieldByName('cd_conta').AsInteger := DM.ProximoId2('cd_conta', 'cd_coligada_matriz', 'fin_config_plano_contas', DM.UsuarioLogado.ColigadaLogada);
end;

procedure Tfrm_CadPlanoContas.qyPlanosContasAfterPost(DataSet: TDataSet);
begin
   if qyPlanosContascd_grupo_contas.IsNull then
   begin
      AtualizaPlanoContasFilhas(qyPlanosContascd_classificacao.AsString, 0);
   end
   else
   begin
      AtualizaPlanoContasFilhas(qyPlanosContascd_classificacao.AsString, qyPlanosContascd_grupo_contas.AsInteger);
   end;
end;

procedure Tfrm_CadPlanoContas.grdTitleClick(Column: TColumn);
var
  campo: string;
begin
  // Clicou no título, alterar a ordem
  if Column.FieldName = 'ds_tp_conta' then begin
    campo := 'tp_conta';
  end
  else begin
    campo := Column.FieldName;
  end;

  qyPlanosContas.Close();
  qyPlanosContas.SQL.Text := 'SELECT * FROM fin_config_plano_contas ' +
    ' WHERE cd_coligada_matriz = :Cd_Coligada ORDER BY '+ campo;
  qyPlanosContas.ParamByName('Cd_Coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
  qyPlanosContas.Open();

end;

procedure Tfrm_CadPlanoContas.qyPlanosContasBeforeEdit(DataSet: TDataSet);
begin
   // Alteração 
   if not DM.UsuarioLogado.TemPermissao( 2022, npAlterar, True ) then Abort;
end;

procedure Tfrm_CadPlanoContas.qyPlanosContasBeforeInsert(DataSet: TDataSet);
begin
   // Inclusão
   if not DM.UsuarioLogado.TemPermissao( 2022, npIncluir, True ) then Abort;
end;

procedure Tfrm_CadPlanoContas.qyPlanosContasBeforePost(DataSet: TDataSet);
Var
  sChave : String;
begin
    // Salvar o título
    qyPlanosContascd_coligada_matriz.AsInteger := DM.UsuarioLogado.ColigadaLogada;

    sChave := qyPlanosContascd_conta.AsString + ';';
    sChave := sChave + qyPlanosContascd_coligada_matriz.AsString;

    if qyPlanosContas.State = dsInsert then begin
       DM.setLog(2022, 'Inclusao', sChave, DM.UsuarioLogado.ColigadaLogada);
    end
    else begin
       DM.setLog(2022, 'Alteracao', sChave, DM.UsuarioLogado.ColigadaLogada);
    end;
end;

end.

