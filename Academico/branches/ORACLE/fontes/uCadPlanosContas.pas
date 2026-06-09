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
  ZAbstractDataset, ZDataset, UZDataset, dbcgrids, StrUtils, Buttons, UMComboBox;

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
    pnFiltros_plano_contas: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label10: TLabel;
    txtFiltro_classicacao: TMaskEdit;
    cmbFiltro_criterio: TUMComboBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cmbFiltro_grupoConta: TUMComboBox;
    Bevel11: TBevel;
    ckbFiltro_ativo: TCheckBox;
    btnFiltrar: TButton;
    btnLimpar: TSpeedButton;
    Bevel12: TBevel;
    Bevel13: TBevel;
    txtFiltro_cd_Contabilidade: TEdit;
    txtFiltro_cdConta: TEdit;
    txtFiltro_descricao: TEdit;
    ckbFiltro_analitica: TCheckBox;
    ckbFiltro_sintetica: TCheckBox;
    ckbFiltro_saida: TCheckBox;
    ckbFiltro_entrada: TCheckBox;
    qryGrupoContaPai: TUMZQuery;
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
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
    procedure setFiltrosCriteriosApropriacao();
    procedure setFiltrosGruposContas();
    function  setCondicaoTipoConta() : String;
    function  setCondicaoTipoMovimento() : String;
  private
    procedure AtualizaPlanoContasFilhas(Classificacao: String; CodigoGrupoContas: Integer);
    function IsNumeric(Const Classificacao: String ) : Boolean;
  public
    { Public declarations }
  end;

var
  frm_CadPlanoContas: Tfrm_CadPlanoContas;
  pos_fim : integer;

implementation

uses Main, uDM, uUsuario, uItemCombo;

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

   // Preeche as combo para realizar os filtros
   setFiltrosGruposContas();
   setFiltrosCriteriosApropriacao();

   btnFiltrarClick( nil );
end;

procedure Tfrm_CadPlanoContas.btnFiltrarClick(Sender: TObject);
var
   ds_sql : String;
begin
   ds_sql := ''
   + ' SELECT '
   + '   * '
   + ' FROM '
   + '   fin_config_plano_contas fcpn'
   + ' WHERE '
   + '   fcpn.cd_coligada_matriz = ' + IntToStr(DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

   { Codigo da conta }
   if ( Trim(txtFiltro_cdConta.text) <> '' ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.cd_conta = '
         + txtFiltro_cdConta.text;
   end;

   { Descricao }
   if ( Trim(txtFiltro_descricao.text) <> '' ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.ds_conta LIKE "%'
         + txtFiltro_descricao.Text
         + '%"';
   end;

   { Tipo de conTa}
   ds_sql := ds_sql + setCondicaoTipoConta();

   { Tipo de Movimento}
   ds_sql := ds_sql + setCondicaoTipoMovimento();

   { Classificacao}
   if ( Trim(txtFiltro_classicacao.Text) <> '' ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.cd_classificacao LIKE "%'
         + txtFiltro_classicacao.Text
         + '%"';
   end;

   { Criterio}
   if ( cmbFiltro_criterio.ItemIndex > 0 ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.cd_apropriacao = '
         + TItemCombo(
            cmbFiltro_criterio.Items.Objects[cmbFiltro_criterio.ItemIndex]
         ).getCodigo();
   end;

   { Grupo da Conta }
   if ( cmbFiltro_grupoConta.ItemIndex > 0 ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.cd_grupo_contas = '
         + TItemCombo(
              cmbFiltro_grupoConta.Items.Objects[cmbFiltro_grupoConta.ItemIndex]
           ).getCodigo();
   end;

   { Codigo da Contabilidade }
   if ( Trim(txtFiltro_cd_Contabilidade.Text) <> '' ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.cd_conta_contabil = '
         + txtFiltro_cd_Contabilidade.Text;
   end;

   { Ativo }
   if ( ckbFiltro_ativo.Checked ) then
   begin
      ds_sql := ds_sql
         + ' AND fcpn.sn_ativo = 1';
   end else
   begin
      ds_sql := ds_sql
         + ' AND fcpn.sn_ativo = 0';
   end;

   { Ordena }
   ds_sql := ds_sql + ' ORDER BY cd_classificacao, cd_conta ';
   
   qyPlanosContas.Close();
   qyPlanosContas.SQL.Clear();

   qyPlanosContas.SQL.Add( ds_sql );

   qyPlanosContas.Open();
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

procedure Tfrm_CadPlanoContas.btnLimparClick(Sender: TObject);
begin
   { Limpando campos de filtro }
   txtFiltro_cdConta.Clear;
   txtFiltro_cd_Contabilidade.Clear;
   txtFiltro_descricao.Clear;
   txtFiltro_classicacao.Clear;

   cmbFiltro_criterio.ItemIndex := 0;
   cmbFiltro_grupoConta.ItemIndex := 0;

   ckbFiltro_ativo.Checked := false;
   ckbFiltro_analitica.Checked := false;
   ckbFiltro_sintetica.Checked := false;
   ckbFiltro_entrada.Checked := false;
   ckbFiltro_saida.Checked := false;
end;

procedure Tfrm_CadPlanoContas.AtualizaPlanoContasFilhas(Classificacao: String; CodigoGrupoContas: Integer);
const
   SQL_ALTERA_PLANOS_CONTAS_FILHAS = ' UPDATE '+
      ' 	fin_config_plano_contas '+
      ' SET '+
      ' 	cd_grupo_contas = :cd_grupo_contas '+
      ' WHERE '+
      ' 	cd_classificacao >= :classificacao AND '+
      ' 	cd_classificacao LIKE (:classificacao_contas_filhas)' ;
var
   qyAlteraPlanos: TUMZQuery;
   classifica : TStringList;
   i : integer;
   classificacao_contas_filhas, cd_classificacao : String;
begin

   cd_classificacao :=  StringReplace(
     qyPlanosContascd_classificacao.AsString,
      '.',
      '',
      [rfIgnoreCase,rfReplaceAll]
   );

   // Se não tem classificação, não continua
   if ( Length(Trim(cd_classificacao)) = 0) then
   begin
      Exit;
   end;

   // Monta um lista com os numeros da classificação separado pelo ponto
   classifica := TStringList.Create;
   classificacao_contas_filhas := '';
   classifica.Delimiter := '.';
   classifica.DelimitedText := Classificacao;

   // Varre a lista para montar a string que será usada no WHERE
   for i := 0 to classifica.Count - 1 do
   begin
      if ( Length(Trim(classifica[i])) > 0 ) then
      begin
         classificacao_contas_filhas :=
               classificacao_contas_filhas
               + classifica[i]
               + '.';
      end;
   end;

   classifica.Free;
   
   DM.CriarConsulta(qyAlteraPlanos);
   
   qyAlteraPlanos.SQL.Text := SQL_ALTERA_PLANOS_CONTAS_FILHAS;
       
   qyAlteraPlanos.ParamByName('classificacao').AsString := Classificacao;
   qyAlteraPlanos.ParamByName('classificacao_contas_filhas').AsString := classificacao_contas_filhas + '%';
       
   if CodigoGrupoContas = 0 then
   begin
      qyAlteraPlanos.SQL.Text := StringReplace(
         qyAlteraPlanos.SQL.Text,
         ':cd_grupo_contas',
         'NULL',
         [rfIgnoreCase,rfReplaceAll]
      );
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

function Tfrm_CadPlanoContas.IsNumeric(Const Classificacao : String) : Boolean; 
var 
  i: integer; 
begin 
   Result := TryStrToInt(Classificacao, i); 
end;

procedure Tfrm_CadPlanoContas.btnSalvarClick(Sender: TObject);
CONST
  SQL_GRUPO_CONTAS_PAI =
   ' SELECT '
   + '    f.cd_grupo_contas cd_grupo_contas_pai '
   + ' FROM '
   + '    fin_config_plano_contas f  '
   + ' WHERE '
   + '    f.cd_coligada_matriz = :cd_coligada AND '
   + '    f.cd_classificacao LIKE :cd_classificao_pai '
   + ' ORDER BY f.cd_classificacao, f.cd_conta '
   + ' LIMIT 1 ';
Var
   reg: Pointer;
   cd_classificacao : String;
   i: integer;
   classifica : TStringList;
begin
   // Salvar o plano
   reg := qyPlanosContas.GetBookmark;
   pos_fim:= 0;

   // Se não tem grupo de conta informado, pega o grupo do plano PAI
   if ( qyPlanosContascd_grupo_contas.IsNull ) then
   begin
      // Monta um lista com os numeros da classificação separado pelo ponto
      classifica := TStringList.Create;
      cd_classificacao := '';
      classifica.Delimiter := '.';
      classifica.DelimitedText := trim(qyPlanosContascd_classificacao.AsString);

      // Varre a lista buscando a ultima posição com numero da classificação
      for i := 0 to classifica.Count - 1 do
      begin
         if ( IsNumeric( classifica[i]) ) then
            pos_fim := i;
      end;

      // Monta o código PAI da classificação                  
      for i := 0 to classifica.Count - 1 do
      begin
         if ( i < pos_fim ) then
            cd_classificacao := cd_classificacao + classifica[i] + '.';
      end;

      // Retira o último ponto
      cd_classificacao := Copy(
         cd_classificacao,
         1,
         Length(cd_classificacao)-1
      );

      // Limpa a lista da memória
      classifica.free;

      { Se não achou uma classificação PAI, então informa o usuário
      de que será necessário preencher o campo }
      if ( Length(cd_classificacao) < 1 ) then
      begin
         Mensagem(
            'Este plano não possuí um plano pai para herdar o grupo de conta. Favor informe um grupo de conta!',
            Application.Title,
            MB_OK + MB_ICONWARNING
         );
         dblcTipoContas.SetFocus();
         Exit;
      end;

      // Executa Query para pegar o grupo de conta do Plano PAI 
      qryGrupoContaPai.Close();
      qryGrupoContaPai.SQL.Text := SQL_GRUPO_CONTAS_PAI;
      qryGrupoContaPai.ParamByName('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
      qryGrupoContaPai.ParamByName('cd_classificao_pai').AsString := cd_classificacao + '%';
      qryGrupoContaPai.Open();

      { Alerta o usuário que o campo não foi preenchido e
         qual será a ação do sistema } 
      if Mensagem(
         'O campo "Grupo da Conta" não foi preenchido. Iremos preenchê-lo com grupo de conta do plano Pai. Deseja prosseguir?',
         Application.Title,
         MB_YESNO + MB_ICONQUESTION
      ) <> ID_YES then
      begin
         Exit;
      end;

      qyPlanosContascd_grupo_contas.AsInteger :=
            qryGrupoContaPai.FieldByName('cd_grupo_contas_pai').AsInteger;
   end;

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

function Tfrm_CadPlanoContas.setCondicaoTipoConta: String;
Var
   ds_tpConta : String;
begin
   // Inicializa a Variavel
   ds_tpConta := '';

   if ( ckbFiltro_analitica.Checked ) AND( ckbFiltro_sintetica.Checked ) then
   begin
      ds_tpConta := ' AND fcpn.tp_conta IN(1,2) ';
      result := ds_tpConta;
      Exit;
   end;

   if ( ckbFiltro_analitica.Checked ) then
   begin
      ds_tpConta := ' AND fcpn.tp_conta = 1 ';
      result := ds_tpConta;
      Exit;
   end;

   if ( ckbFiltro_sintetica.Checked ) then
   begin
      ds_tpConta := ' AND fcpn.tp_conta = 2 ';
      result := ds_tpConta;
      Exit;
   end;                 
   result := ds_tpConta;
end;

function Tfrm_CadPlanoContas.setCondicaoTipoMovimento: String;
Var
   ds_tpMovimento : String;
begin
   // Inicializa a Variavel
   ds_tpMovimento := '';

   if ( ckbFiltro_entrada.Checked ) AND( ckbFiltro_saida.Checked ) then
   begin
      ds_tpMovimento := ' AND fcpn.tp_entrada_saida IN(1,2,0) ';
      result := ds_tpMovimento;
      Exit;
   end;

   if ( ckbFiltro_entrada.Checked ) then
   begin
      ds_tpMovimento := ' AND fcpn.tp_entrada_saida = 1 ';
      result := ds_tpMovimento;
      Exit;
   end;

   if ( ckbFiltro_saida.Checked ) then
   begin
      ds_tpMovimento := ' AND fcpn.tp_entrada_saida = 2 ';
      result := ds_tpMovimento;
      Exit;
   end;

   result := ds_tpMovimento;
end;

procedure Tfrm_CadPlanoContas.setFiltrosCriteriosApropriacao;
begin
   cmbFiltro_criterio.AddItem('', nil);
   while not qyCriteriosApropriacao.Eof do
   begin
      cmbFiltro_criterio.AddItem( qyCriteriosApropriacao.FieldByName('ds_apropriacao').AsString,
         TItemCombo.Create(
            qyCriteriosApropriacao.FieldByName('cd_apropriacao').AsString,
            qyCriteriosApropriacao.FieldByName('ds_apropriacao').AsString
         )
      );
      qyCriteriosApropriacao.Next;
   end;
end;

procedure Tfrm_CadPlanoContas.setFiltrosGruposContas;
begin
   cmbFiltro_grupoConta.AddItem('', nil);
   while not qryBuscaTipoContas.Eof do
   begin
      cmbFiltro_grupoConta.AddItem( qryBuscaTipoContas.FieldByName('ds_valor').AsString,
         TItemCombo.Create(
            qryBuscaTipoContas.FieldByName('cd_auxiliar').AsString,
            qryBuscaTipoContas.FieldByName('ds_valor').AsString
         )
      );

      qryBuscaTipoContas.Next;
   end;
end;

procedure Tfrm_CadPlanoContas.srcPlanosContasDataChange(Sender: TObject;
  Field: TField);
const
   SQL_BUSCA_CONTAS = ' SELECT '+
      ' 	cd_classificacao, '+
      ' 	cd_conta, '+
      '  cd_grupo_contas '+
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

   for I := 0 to classificacao.Count - 1 do
   begin
      comparacao := comparacao + separador +  classificacao.Strings[i];
      separador := '.';
      
      if (qyBuscaPlanoContas.Locate('cd_classificacao', comparacao, [loCaseInsensitive])) and
         (qyPlanosContascd_classificacao.AsString <> qyBuscaPlanoContas.FieldByName('cd_classificacao').AsString) then
      begin
         if qyPlanosContas.State in [dsInsert] then
         begin
            srcPlanosContas.OnDataChange := nil;
            qyPlanosContascd_grupo_contas.AsInteger := qyBuscaPlanoContas.FieldByName('cd_grupo_contas').AsInteger;
            srcPlanosContas.OnDataChange := srcPlanosContasDataChange;
         end;
         
         dblcTipoContas.Enabled := False;
      end;
   end;
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

