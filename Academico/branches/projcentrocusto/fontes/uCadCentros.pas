unit uCadCentros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, uItemCombo, UMComboBox,
  UMLookupComboBox, StrUtils, VirtualTrees, Buttons, Tabs, CheckLst,
  uCentroCusto;

type

   TCentroCustoGrid = record
      objCentro: TCentroCusto;
   end;

   PCentro = ^TCentroCustoGrid;

  Tfrm_CadCentros = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
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
    qyCentrosCustos: TUMZQuery;
    srcCentrosCustos: TDataSource;
    qyCentrosCustoscd_classificacao: TStringField;
    qyCentrosCustostp_centro: TSmallintField;
    qyCentrosCustosds_centro: TStringField;
    qyCentrosCustosds_observacao: TMemoField;
    qyCentrosCustosds_tp_conta: TStringField;
    qyCentrosCustosnr_tipo_regra: TIntegerField;
    ScrollBox1: TScrollBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Bevel4: TBevel;
    qyCentrosCustoscd_coligada_matriz: TSmallintField;
    Panel7: TPanel;
    qyCentrosCustossn_ativo: TSmallintField;
    DBCheckBox1: TDBCheckBox;
    qyCentrosCustoscd_centro: TLargeintField;
    qyCentrosCustoscd_grupo: TLargeintField;
    Label3: TLabel;
    Label2: TLabel;
    qyCentrosCustoscd_centro_pai: TIntegerField;
    cbCentrosSinteticos: TUMComboBox;
    vstCentros: TVirtualStringTree;
    Label7: TLabel;
    edNomeCentro: TEdit;
    Label8: TLabel;
    cbAtivo: TComboBox;
    btnFiltrar: TBitBtn;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qyCentrosCustosds_sql: TMemoField;
    BitBtn1: TBitBtn;
    pgGeral: TPageControl;
    tsRegras: TTabSheet;
    tdbmem: TTabSheet;
    dbObservacoes: TDBMemo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label10: TLabel;
    qyCentrosCustoscd_contabilidade: TStringField;
    dbedContabilidade: TDBEdit;
    ScrollBox2: TScrollBox;
    rgRegras: TRadioGroup;
    pgRegras: TPageControl;
    tsUnidadeEnsino: TTabSheet;
    clbColigadas: TCheckListBox;
    tsAreas: TTabSheet;
    clbAreas: TCheckListBox;
    tsDepartamentos: TTabSheet;
    clbDepartamentos: TCheckListBox;
    tsCursos: TTabSheet;
    pnRegrasCursos: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    cbDepartamentos: TUMComboBox;
    edNomeCurso: TEdit;
    btnFiltrarCursos: TBitBtn;
    clbCursos: TCheckListBox;
    tsCondicaoSQL: TTabSheet;
    dbmmCondicaoSQL: TDBMemo;
    Panel11: TPanel;
    sbCheckAll: TSpeedButton;
    sbUncheckAll: TSpeedButton;
    qVerificar: TUMZQuery;
    edOrdemClassificacao: TEdit;
    lbClassificacao: TLabel;
    procedure edOrdemClassificacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edOrdemClassificacaoChange(Sender: TObject);
    procedure vstCentrosHeaderClick(Sender: TVTHeader;
      HitInfo: TVTHeaderHitInfo);
    procedure sbUncheckAllClick(Sender: TObject);
    procedure rgRegrasClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edNomeCentroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure clbDepartamentosClickCheck(Sender: TObject);
    procedure clbAreasClickCheck(Sender: TObject);
    procedure clbColigadasClickCheck(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure btnFiltrarCursosClick(Sender: TObject);
    procedure pgRegrasChange(Sender: TObject);
    procedure sbCheckAllClick(Sender: TObject);
//    procedure sbUniddesClick(Sender: TObject);
    procedure edNomeCentroChange(Sender: TObject);
    procedure vstCentrosNodeDblClick(Sender: TBaseVirtualTree;
      const HitInfo: THitInfo);
    procedure vstCentrosEnter(Sender: TObject);
    procedure vstCentrosChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure btnFiltrarClick(Sender: TObject);
    procedure vstCentrosGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure qyCentrosCustosAfterPost(DataSet: TDataSet);
    procedure cbCentrosSinteticosChange(Sender: TObject);
    procedure srcCentrosCustosDataChange(Sender: TObject; Field: TField);
    procedure qyCentrosCustosNewRecord(DataSet: TDataSet);
    procedure qyCentrosCustosBeforePost(DataSet: TDataSet);
    procedure qyCentrosCustosBeforeInsert(DataSet: TDataSet);
    procedure qyCentrosCustosBeforeEdit(DataSet: TDataSet);
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
    procedure srcCentrosCustosStateChange(Sender: TObject);
    procedure qyCentrosCustosAfterInsert(DataSet: TDataSet);
    procedure qyCentrosCustosCalcFields(DataSet: TDataSet);
    procedure grdDblClick(Sender: TObject);
  private

    unidadeEnsinoAlterada,
    areaAlterada,
    departamentoAlterado,
//    INSERINDO_CENTRO: Boolean;
    FORCA_ATUALIZACAO: Boolean;

    CodigoSelecionado: integer;

    listaCentros: TList;
    
    codigoAntigo: Integer;

    mascara_parametro: String;

    procedure carregaCentrosSinteticos(cd_centro: Integer = -1; espacos: String = '');
    procedure carregaCentrosGrid(
      cd_centro: Integer = 0;
      nodo: PVirtualNode = nil;
      filtro: Boolean = false;
      nr_filho : integer = 0
    );

    procedure carregaColigadas();
    procedure carregaAreas();

    // Filtro = Indica se é parar usar o campo filtro ou não.
    procedure carregaCursos(filtro: Boolean = False);
    procedure carregaDepartamentos();
    procedure carregaDepartamentosCombo();

    procedure atualizaRegrasUnidadeEnsino(cd_centro: Integer);
    procedure atualizaRegrasAreas(cd_centro: Integer);
    procedure atualizaRegrasDepartamentos(cd_centro: Integer);
    procedure atualizaRegrasCursos(cd_centro: Integer);

    procedure carregaCentrosObjetos();

    procedure limparRegistros(cd_centro: Integer; tabela: String);

    function verificaCodigoArray(codigo: String; arrCodigos: TStringList): Boolean;

    procedure verificaRegrasDisponiveis(cd_centro: Integer);

    // Verifica se é possível excluir o centro de custo, ou seja
    // verifica se o mesmo não possui filhos ou alguma conta vinculada
    function verificaExcluirCentroDisponivel(cd_centro: Integer): Boolean;

    function verificaCertezaAlteracao(Sender: TObject): Boolean;

    // realiza a identacao do nome de centro de custo
    // coloca um espaco
    function identaNomeCentro(ds_centro : String; qtd_identar : integer ): String;

    procedure verificaCentroPai(cd_centro:integer);

    procedure buscaNodoCentro(Sender: TBaseVirtualTree; Node: PVirtualNode; Data: Pointer; var Abort: Boolean);

    // Observação: A máscara que define como a classificação deve ser, está
    // Definida em um parâmetro 'mascara_plano_custos', todos valores usados
    // abaixo são apenas exemplos e máscaras diferentes.

    // Verifica se é o ultimo filho sintético de um centro de custo
    function isUltimoFilhoSintetico(cd_centro: Integer): Boolean;

    // Verifica se o centro que é passado por parâmetro, possui algum filho
    // que se encaixa no filtro realizado na tela.
    function possuiFilhosFiltrados(cd_centro_pai: Integer): Boolean;

    // Esta função tem por responsabilidade pegar a classificação e retirar os
    // carácteres da máscaras que não estão sendo usados. Ex:
    // 001.001.000, retorno: 001.001
    function getClassificacaoReduzida(cd_classificacao: String): String;

    // Preenche uma String com 0 a esquerda.
    function lPad(S: string; Ch: Char; Len: Integer): String;

    function verificaCursoSelecionado(): Boolean;

    procedure checkAll(Sender: TObject);
    procedure uncheckAll(Sender: TObject);

    procedure recarregaForm;

    // Retorna o valor referente ao grau parentesco de um centro de custo
    function getValorParentescoClassificacao(grau_parentesco: String; cd_centro_custo: Integer): Integer;

    // Retorna todos os códigos de centro de custo do centro de custo mandado por parâmetro
    // no formato string para ser usado em condições como: IN ()
    function getFilhos(cd_centro_custo_pai: Integer; filhos: String): String;

    function isOrdemClassiValida(ordem: Integer; valor: String): Boolean;
    function isCentroPai(): Boolean;

    // Procedure encarregada por atualizar toda a classificação dos centros de custos
    // quando um é alterado
    procedure atualizaClassificacao(cd_centro: Integer; ordemClassi: String);

    // Altera o nr_classificacao de um centro de custo em específico
    procedure alteraCentro(cd_centro: Integer; classificacao: String);

    procedure atualizaLabelClassificacao();
  public
    // Retorna o grau de parentesco do centro.
    // por ex: Se o centro de custo for 01.01.000, retorno: 2
    // Se o centro de custo for 1.2.3.4.000, retorno: 4
    function getGrauParentesco(cd_centro: Integer): Integer;

    // Retorna a próxima classificacão disponível para o centro pai escolhido.
    // Ex: Centro pai: 1.001.2, retorno: 1.001.2.001
    function getClassificacao(grau, cd_centro: Integer): String;

    function procuraNoFilho(cd_centro_procurar:Integer; NodeFilho:PVirtualNode) : Boolean;
  end;

var
   frm_CadCentros: Tfrm_CadCentros;
   coluna_ordenar : integer;
   direcao_sord : TSortDirection;
   identado : boolean;

const
   SQL_CENTROS_SINTETICOS = ' SELECT ' +
	'  fccc.ds_centro, ' +
	'  fccc.cd_centro, ' +
   '  fccc.cd_centro_pai, ' +
   '  if((SELECT count(*) as qtd from fin_config_centro_custos where cd_centro_pai = fccc.cd_centro) > 0, 1, 0) as possui_filhos, ' +
   ' fccc.nr_tipo_regra ' +
   ' FROM ' +
	'  fin_config_centro_custos fccc ' +
   ' WHERE ' +
	'  fccc.tp_centro = 2 ' +
	'  AND fccc.cd_coligada_matriz = :cd_coligada_matriz ' +
	'  AND fccc.cd_centro_pai = :cd_centro_pai ' +
   '  order by fccc.ds_centro, fccc.cd_centro_pai, fccc.cd_classificacao';

implementation

uses Main, uDM, uCentroTurmas, uUsuario, uIUMDataModule;

{$R *.dfm}

function Tfrm_CadCentros.verificaCodigoArray(codigo: String; arrCodigos: TStringList): Boolean;
var
   i: Integer;
begin
   Result := False;

   for i := 0 to arrCodigos.Count - 1 do
   begin
      if arrCodigos.Strings[i] = codigo then
      begin
         Result := True;
         Exit;
      end;
   end;
end;

function Tfrm_CadCentros.verificaCursoSelecionado(): Boolean;
var
   i: Integer;
begin
   Result := False;

   for I := 0 to clbCursos.Count - 1 do
   begin
      if clbCursos.Checked[i] then
      begin
         Result := True;
         Exit;
      end;
   end;
end;

procedure Tfrm_CadCentros.FormShow(Sender: TObject);
var
   data: PCentro;
begin
   identado := false; 
   carregaCentrosObjetos();
   carregaCentrosGrid(0);

   // Selecionar somente o centro informado
   qyCentrosCustos.Close();
   qyCentrosCustos.ParamByName('cd_coligada').AsInteger :=
      DM.UsuarioLogado.ColigadaLogada;
   qyCentrosCustos.ParamByName('cd_centro').AsInteger := 0;
   qyCentrosCustos.Open();

   cbCentrosSinteticos.AddItem('Raiz', TItemCombo.Create('0', 'Raiz'));
   carregaCentrosSinteticos(0);

   // Definindo a máscara do campo Classificação
   qyCentrosCustos.FieldByName('cd_classificacao').EditMask := DM.variavel_parametro('mascara_plano_custos');
   mascara_parametro := DM.variavel_parametro('mascara_plano_custos');
   // coluna_ordenar
   // identado := true;

end;

procedure Tfrm_CadCentros.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   i: Integer;
   objCentro: TCentroCusto;
   objCombo: TItemCombo;
begin
   for I := listaCentros.Count - 1 downto 0 do
   begin
      objCentro := TCentroCusto(listaCentros.Items[i]);
      FreeAndNil(objCentro);
      listaCentros.Items[i] := nil;
   end;
   
   FreeAndNil(listaCentros);

   for I := cbCentrosSinteticos.Items.Count - 1 downto 0 do
   begin
      objCombo := TItemCombo(cbCentrosSinteticos.Items.Objects[i]);
      cbCentrosSinteticos.Items.Objects[i] := nil;
      FreeAndNil(objCombo);
   end;

   Action := caFree;
end;

procedure Tfrm_CadCentros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Teclas de atalho
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

procedure Tfrm_CadCentros.FormResize(Sender: TObject);
begin
   if Panel4.Height < 600 then
   begin
      pgRegras.Align := alNone;
      pgRegras.Height := 260;
   end
   else
   begin
      pgRegras.Align := alClient;
   end;
end;

procedure Tfrm_CadCentros.btnSairClick(Sender: TObject);
begin
  // Fechar o formulário
  Close();
end;

procedure Tfrm_CadCentros.btnExcluirClick(Sender: TObject);
Var
   sChave : String;
   qryExcluirClassificacao: TUMZQuery;
   tempNode : PVirtualNode;
   NodeAtual : PVirtualNode;
const
   SQL_EXCLUI_CLASSIFICACAO = ' DELETE FROM fin_centro_custos_classifica WHERE cd_centro = :cd_centro AND cd_coligada_matriz = :cd_coligada_matriz ';      
begin
   // Excluir o centro
   if not DM.UsuarioLogado.TemPermissao( 2029, npExcluir, True ) then Abort;

   if not(verificaExcluirCentroDisponivel(qyCentrosCustoscd_centro.AsInteger)) then
   begin
      Mensagem(
         'Este centro de custo não pode ser apagado porque possui um centro filho ou possui uma turma vinculada a ele',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );

      Exit;
   end;

   if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin

      // será excluido. Tenta posicionar na grid
      // tenta pegar o codigo que está selecionado
      if vstCentros.FocusedNode <> nil then
      begin
      
         tempNode := vstCentros.NodeParent[vstCentros.FocusedNode];

         if tempNode <> nil then
         begin
            CodigoSelecionado := PCentro(vstCentros.GetNodeData(tempNode)^).objCentro.Centro;
         end;
         
      end;

      sChave := qyCentrosCustoscd_centro.AsString + ';';
      sChave := sChave + qyCentrosCustoscd_coligada_matriz.AsString;

      DM.CriarConsulta(qryExcluirClassificacao);

      qryExcluirClassificacao.SQL.Text := SQL_EXCLUI_CLASSIFICACAO;
      
      qryExcluirClassificacao.ParamByName('cd_centro').AsInteger :=
         qyCentrosCustoscd_centro.AsInteger;

      qryExcluirClassificacao.ParamByName('cd_coligada_matriz').AsInteger :=
         DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

      qryExcluirClassificacao.ExecSQL;

      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_areas');
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_coligadas');
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_cursos');
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_departamentos');

      qyCentrosCustos.Delete();

      // Gerar log de exclusao
      DM.setLog(2029, 'Exclusao', sChave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

      vstCentros.Clear;
      carregaCentrosObjetos;
      carregaCentrosGrid(0, nil);

      // tenta selecionar na grid
      // vamos percorrer a grade para tentar descobrir o codigo
      NodeAtual := vstCentros.TopNode;
      NodeAtual := vstCentros.GetFirstChild(NodeAtual);
      procuraNoFilho(CodigoSelecionado, NodeAtual);

   end;
end;

procedure Tfrm_CadCentros.btnFecharClick(Sender: TObject);
begin
   // Fechar o Formulários
   qyCentrosCustos.Close();
   Close();
end;

procedure Tfrm_CadCentros.btnFiltrarClick(Sender: TObject);
var
   tempPVirtualNode, NodeAtual, ProximoNode : PVirtualNode;
   codigo_teste : integer;
begin

   // tenta pegar o codigo que está selecionado
   if vstCentros.FocusedNode <> nil then
   begin
      CodigoSelecionado := PCentro(vstCentros.GetNodeData(vstCentros.FocusedNode)^).objCentro.Centro;
   end;

   // realiza o filtro
   vstCentros.Clear;
   carregaCentrosGrid(0, nil, True);

   // vamos percorrer a grade para tentar descobrir o codigo
   NodeAtual := vstCentros.TopNode;
   NodeAtual := vstCentros.GetFirstChild(NodeAtual);

   procuraNoFilho(CodigoSelecionado, NodeAtual);
end;

procedure Tfrm_CadCentros.btnFiltrarCursosClick(Sender: TObject);
begin
   carregaCursos(True);
end;

procedure Tfrm_CadCentros.btnInserirClick(Sender: TObject);
begin
   // Inclusao
   DBEdit1.SetFocus();
   qyCentrosCustos.Insert();
   FORCA_ATUALIZACAO := False;
end;

procedure Tfrm_CadCentros.alteraCentro(cd_centro: Integer;
  classificacao: String);
const
   SQL_UPDATE_CENTRO =
      ' UPDATE '+
      '  fin_config_centro_custos '+
      ' SET '+
      '  cd_classificacao = :cd_classificacao '+
      ' WHERE '+
      '  cd_centro = :cd_centro ';
var
   qryAlteraCentro: TUMZQuery;
begin
   DM.CriarConsulta(qryAlteraCentro);

   qryAlteraCentro.SQL.Text := SQL_UPDATE_CENTRO;
   qryAlteraCentro.ParamByName('cd_classificacao').AsString := classificacao;
   qryAlteraCentro.ParamByName('cd_centro').AsInteger := cd_centro;
   qryAlteraCentro.ExecSQL;
end;

procedure Tfrm_CadCentros.atualizaClassificacao(cd_centro: Integer; ordemClassi: String);
const
   SQL_ATUALIZA_CLASSIFICACAO =
      ' UPDATE '+
      ' 	fin_centro_custos_classifica '+
      ' SET '+
      ' 	nr_classificacao%s = :valor_classifica '+
      ' WHERE '+
      ' 	cd_centro IN (%s) ';
      
   SQL_BUSCA_CLASSIFICA_CENTROS =
      ' SELECT '+
      ' 	* '+
      ' FROM '+
      ' 	fin_centro_custos_classifica '+
      ' WHERE '+
      ' 	cd_centro IN (%s) ';
var
   centrosAlterar,
   classificacao,
   separador,
   classificacaoAtualizar,
   valorDigitado: String;

   qryAtualizaClassificacao: TUMZQuery;
   qryBuscaClassificacoes: TUMZReadOnlyQuery;
   slMascara: TStringList;

   i,
   j: Integer;
begin
   slMascara := TStringList.Create;

   if FORCA_ATUALIZACAO then
   begin
      i := getGrauParentesco(cd_centro);

      valorDigitado := IntToStr(getValorParentescoClassificacao(IntToStr(i - 1),cd_centro));
   end
   else
   begin
      valorDigitado := ordemClassi;
   end;

   // Resgata os filhos deste centro de custo
   centrosAlterar := getFilhos(cd_centro, IntToStr(cd_centro));

   DM.CriarConsulta(qryAtualizaClassificacao);
   DM.CriarConsulta(qryBuscaClassificacoes);

   // Altera as classficicações na tabela fin_centro_custos_classifica
   qryAtualizaClassificacao.SQL.Text := Format(SQL_ATUALIZA_CLASSIFICACAO, [
      IntToStr(edOrdemClassificacao.Tag),
      IntToStr(cd_centro)
   ]);
   qryAtualizaClassificacao.ParamByName('valor_classifica').AsString :=
      valorDigitado;
   qryAtualizaClassificacao.ExecSQL;

   // Busca classificação do centro pai para alterar as filhas a origem
   qryBuscaClassificacoes.SQL.Text := Format(SQL_BUSCA_CLASSIFICA_CENTROS, [IntToStr(cd_centro)]);
   qryBuscaClassificacoes.Open;

   if qryBuscaClassificacoes.RecordCount > 0 then
   begin
      separador := '';

      qryAtualizaClassificacao.SQL.Text := 'UPDATE fin_centro_custos_classifica SET ';

      for j := 1 to edOrdemClassificacao.Tag do
      begin
         qryAtualizaClassificacao.SQL.Text :=
            qryAtualizaClassificacao.SQL.Text +
            separador +
            'nr_classificacao' + IntToStr(j) +
            ' = ' + qryBuscaClassificacoes.FieldByName('nr_classificacao' + IntToStr(j)).AsString;

         separador := ', ';
      end;

       qryAtualizaClassificacao.SQL.Text :=
         qryAtualizaClassificacao.SQL.Text +
         ' WHERE cd_centro IN (' + centrosAlterar + ') ';

      qryAtualizaClassificacao.ExecSQL;
   end;

   /////////////////////////////////////////////////////////////////////////////

   // A PARTIR DAQUI, SÓ ALTERA A CLASSIFICAÇÃO PARA FIN_CONFIG_CENTRO_CUSTOS

   qryBuscaClassificacoes.Close;
   qryBuscaClassificacoes.SQL.Text := Format(SQL_BUSCA_CLASSIFICA_CENTROS, [centrosAlterar]);
   qryBuscaClassificacoes.Open;

   // isso daqui é para mudar a classificação na tabela fin_config_centro_custos
   slMascara := explode(DM.variavel_parametro('mascara_plano_custos'), '.');

   while not qryBuscaClassificacoes.Eof do
   begin
      for i := 0 to slMascara.Count - 1 do
      begin
         slMascara.Strings[i] := lPad(
            qryBuscaClassificacoes.FieldByName('nr_classificacao' + IntToStr(i+1)).AsString,
            '0',
            Length(slMascara.Strings[i])
         );
      end;

      separador := '';

      for i := 0 to slMascara.Count - 1 do
      begin
         classificacao := classificacao + separador + slMascara.Strings[i];
         separador := '.';
      end;

      alteraCentro(
         qryBuscaClassificacoes.FieldByName('cd_centro').AsInteger,
         classificacao
      );

      classificacao := '';

      qryBuscaClassificacoes.Next;
   end;
end;

procedure Tfrm_CadCentros.atualizaLabelClassificacao;
var
   i: Integer;
   slClassificacao: TStringList;
   mascara,
   separador: String;
begin

   slClassificacao := explode(lbClassificacao.Caption, '.');

   mascara := '';

   for i := 0 to slClassificacao.Count - 1 do
   begin

      if edOrdemClassificacao.Tag = (i + 1) then
      begin
         mascara := mascara + separador + edOrdemClassificacao.Text;
      end
      else
      begin
         mascara := mascara + separador + slClassificacao.Strings[i];
      end;

      separador := '.';
   end;

   lbClassificacao.Caption := mascara;
end;

procedure Tfrm_CadCentros.atualizaRegrasAreas(cd_centro: Integer);
var
   qryAtualizaRegras: TUMZQuery;
   i: Integer;
   registro, separador: String;
const
   SQL_EXCLUI_REGRAS = 'DELETE FROM fin_centro_areas WHERE cd_centro = :cd_centro';
   SQL_INSERE_REGRAS = 'INSERT INTO fin_centro_areas (cd_centro, cd_area) VALUES %s';
begin
   DM.CriarConsulta(qryAtualizaRegras);

   qryAtualizaRegras.SQL.Text := SQL_EXCLUI_REGRAS;
   qryAtualizaRegras.ParamByName('cd_centro').AsInteger := cd_centro;
   qryAtualizaRegras.ExecSQL;

   separador := '';
   registro := '';

   for I := 0 to clbAreas.Count - 1 do
   begin
      if clbAreas.Checked[i] then
      begin
         registro :=
            registro +
            separador +
            ' ( ' +
            qyCentrosCustoscd_centro.AsString +
            ' , ' +
            TItemCombo(clbAreas.Items.Objects[i]).codigo +
            ' ) ';

         separador := ' , ';
      end;
   end;

   if registro <> '' then
   begin
      qryAtualizaRegras.Params.Clear;
      qryAtualizaRegras.SQL.Text := Format(SQL_INSERE_REGRAS, [registro]);
      qryAtualizaRegras.ExecSQL;
   end;
end;

procedure Tfrm_CadCentros.atualizaRegrasCursos(cd_centro: Integer);
var
   qryAtualizaRegras: TUMZQuery;

   i: Integer;

   registro,
   separador: String;
const
   SQL_EXCLUI_REGRAS = 'DELETE FROM fin_centro_cursos WHERE cd_centro = :cd_centro';
   SQL_INSERE_REGRAS = 'INSERT INTO fin_centro_cursos (cd_centro, cd_departamento, cd_coligada, cd_curso) VALUES %s';
begin
   DM.CriarConsulta(qryAtualizaRegras);

   qryAtualizaRegras.SQL.Text := SQL_EXCLUI_REGRAS;
   qryAtualizaRegras.ParamByName('cd_centro').AsInteger := cd_centro;
   qryAtualizaRegras.ExecSQL;

   separador := '';
   registro := '';

   for I := 0 to clbCursos.Count - 1 do
   begin
      if clbCursos.Checked[i] then
      begin
         registro :=
            registro +
            separador +
            ' ( ' +
            qyCentrosCustoscd_centro.AsString +
            ', ' +
            TItemCombo(clbCursos.Items.Objects[i]).variavel +
            ', ' +
            TItemCombo(clbCursos.Items.Objects[i]).variavel2 +
            ', ' +
            QuotedStr(TItemCombo(clbCursos.Items.Objects[i]).codigo) +
            ' ) ';

         separador := ' , ';
      end;
   end;

   if registro <> '' then
   begin
      qryAtualizaRegras.Params.Clear;
      qryAtualizaRegras.SQL.Text := Format(SQL_INSERE_REGRAS, [registro]);
      qryAtualizaRegras.ExecSQL;
   end;
end;

procedure Tfrm_CadCentros.atualizaRegrasDepartamentos(cd_centro: Integer);
var
   qryAtualizaRegras: TUMZQuery;

   i: Integer;

   registro,
   separador: String;
const
   SQL_EXCLUI_REGRAS = 'DELETE FROM fin_centro_departamentos WHERE cd_centro = :cd_centro';
   SQL_INSERE_REGRAS = 'INSERT INTO fin_centro_departamentos (cd_centro, cd_departamento, cd_coligada) VALUES %s';
begin
   DM.CriarConsulta(qryAtualizaRegras);

   qryAtualizaRegras.SQL.Text := SQL_EXCLUI_REGRAS;
   qryAtualizaRegras.ParamByName('cd_centro').AsInteger := cd_centro;
   qryAtualizaRegras.ExecSQL;

   separador := '';
   registro := '';

   for I := 0 to clbDepartamentos.Count - 1 do
   begin
      if clbDepartamentos.Checked[i] then
      begin
         registro :=
            registro +
            separador +
            ' ( ' +
            qyCentrosCustoscd_centro.AsString +
            ', ' +
            TItemCombo(clbDepartamentos.Items.Objects[i]).codigo +
            ', ' +
            TItemCombo(clbDepartamentos.Items.Objects[i]).variavel +
            ' ) ';

         separador := ' , ';
      end;
   end;

   if registro <> '' then
   begin
      qryAtualizaRegras.Params.Clear;
      qryAtualizaRegras.SQL.Text := Format(SQL_INSERE_REGRAS, [registro]);
      qryAtualizaRegras.ExecSQL;
   end;
end;

procedure Tfrm_CadCentros.atualizaRegrasUnidadeEnsino(cd_centro: Integer);
var
   qryAtualizaRegras: TUMZQuery;
   i: Integer;
   registro, separador: String;
const
   SQL_EXCLUI_REGRAS = 'DELETE FROM fin_centro_coligadas WHERE cd_centro = :cd_centro';
   SQL_INSERE_REGRAS = 'INSERT INTO fin_centro_coligadas (cd_centro, cd_coligada) VALUES %s';
begin
   DM.CriarConsulta(qryAtualizaRegras);

   qryAtualizaRegras.SQL.Text := SQL_EXCLUI_REGRAS;
   qryAtualizaRegras.ParamByName('cd_centro').AsInteger := cd_centro;
   qryAtualizaRegras.ExecSQL;

   separador := '';
   registro := '';

   for I := 0 to clbColigadas.Count - 1 do
   begin
      if clbColigadas.Checked[i] then
      begin
         registro :=
            registro +
            separador +
            ' ( ' +
            qyCentrosCustoscd_centro.AsString +
            ' , ' +
            TItemCombo(clbColigadas.Items.Objects[i]).codigo +
            ' ) ';

         separador := ' , ';
      end;
   end;

   if registro <> '' then
   begin
      qryAtualizaRegras.Params.Clear;
      qryAtualizaRegras.SQL.Text := Format(SQL_INSERE_REGRAS, [registro]);
      qryAtualizaRegras.ExecSQL;
   end;
end;

procedure Tfrm_CadCentros.BitBtn1Click(Sender: TObject);
begin
   vstCentros.Clear;

   edNomeCentro.Text := '';
   cbAtivo.ItemIndex := 0;

   carregaCentrosGrid(0, nil);
end;

procedure Tfrm_CadCentros.BitBtn2Click(Sender: TObject);
begin
   vstCentros.FullExpand();
end;

procedure Tfrm_CadCentros.BitBtn3Click(Sender: TObject);
begin
   vstCentros.FullCollapse();
end;

procedure Tfrm_CadCentros.btnAlterarClick(Sender: TObject);
begin
   // Alteracao
   DBEdit1.SetFocus();
   qyCentrosCustos.Edit();

   codigoAntigo := StrToInt(edOrdemClassificacao.Text);
   FORCA_ATUALIZACAO := False;
end;

procedure Tfrm_CadCentros.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
  NodeAtual : PVirtualNode;
  ordemClassi: String;
  editando: Boolean;
begin
   // Salvar
   reg := qyCentrosCustos.FieldByName('cd_centro').AsInteger;

//   INSERINDO_CENTRO := qyCentrosCustos.State in [dsInsert];

   ordemClassi := edOrdemClassificacao.Text;
   editando := qyCentrosCustos.State in [dsEdit];

   if (qyCentrosCustos.State = dsEdit) and
      (isOrdemClassiValida(edOrdemClassificacao.Tag, edOrdemClassificacao.Text) = false) then
   begin
      Mensagem(
         'Ordem de classificação Inválida, já existe outro centro de custos cadastrado com a mesma classificação',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );
      
      Exit;
   end;

   qyCentrosCustos.Post();

   if ((IntToStr(codigoAntigo) <> ordemClassi)
      or (FORCA_ATUALIZACAO)) and (editando) then
   begin
      atualizaClassificacao(
         reg,
         ordemClassi
      );
   end;

   vstCentros.Clear;
   carregaCentrosObjetos;
   carregaCentrosGrid(0, nil);

   qyCentrosCustos.Close();
   qyCentrosCustos.Open();
   qyCentrosCustos.Locate('cd_centro', reg, []);

   cbCentrosSinteticos.Items.Clear;
   cbCentrosSinteticos.AddItem('Raiz', TItemCombo.Create('0', 'Raiz'));
   carregaCentrosSinteticos(0);

   // vamos percorrer a grade para tentar descobrir o codigo
   NodeAtual := vstCentros.TopNode;
   NodeAtual := vstCentros.GetFirstChild(NodeAtual);

   procuraNoFilho(CodigoSelecionado, NodeAtual);
end;

procedure Tfrm_CadCentros.carregaAreas;
var
   i: Integer;
   qryAreasCentros: TUMZReadOnlyQuery;
   qryAreas: TUMZReadOnlyQuery;
begin

   clbAreas.Items.Clear;

   DM.CriarConsulta(qryAreasCentros);
   DM.CriarConsulta(qryAreas);

   qryAreasCentros.SQL.Text := ' SELECT cd_area FROM fin_centro_areas WHERE cd_centro = :cd_centro ';
   qryAreasCentros.ParamByName('cd_centro').AsInteger :=
      qyCentrosCustoscd_centro.AsInteger;

   qryAreasCentros.Open;

   qryAreas.SQL.Text := ' SELECT cd_area, ds_area FROM cursos_areas_atuacao ';
   qryAreas.Open;

   i := 0;

   while not(qryAreas.Eof) do
   begin
      clbAreas.AddItem(
          qryAreas.FieldByName('ds_area').AsString,
          TItemCombo.Create(
            qryAreas.FieldByName('cd_area').AsString,
            qryAreas.FieldByName('ds_area').AsString
          )
      );

      if qryAreasCentros.Locate('cd_area', qryAreas.FieldByName('cd_area').AsInteger, []) then
      begin
         clbAreas.Checked[i] := True;
      end;

      Inc(I);

      qryAreas.Next;
   end;
end;

// realiza o carregamento da grade
// funcao recursiva
procedure Tfrm_CadCentros.carregaCentrosGrid(
   cd_centro: Integer = 0;
   nodo: PVirtualNode = nil;
   filtro: Boolean = false;
   nr_filho : integer = 0
);
var
   data: PCentro;
   pai: PVirtualNode;
   filtroAtivoAceito: Boolean;
   i: Integer;
   nr_filho_novo : integer;
   ds_nome_centro : string;
   a : integer;
   centro_pai_atual : integer;
   centro_atual : integer;
     soma1, soma2 :integer;
begin

   for I := 0 to listaCentros.Count - 1 do
   begin
      centro_pai_atual := TCentroCusto(listaCentros.Items[i]).CentroPai;
      centro_atual := TCentroCusto(listaCentros.Items[i]).centro;

      if centro_pai_atual = cd_centro then
      begin

         if filtro = true then
         begin
            // Seta ativo por padrão para o caso de não estiver filtrando por ativo sim/não.
            filtroAtivoAceito := True;

            if cbAtivo.ItemIndex = 1 then
            begin
               filtroAtivoAceito := true;
            end;

            if cbAtivo.ItemIndex = 2 then
            begin
               filtroAtivoAceito := False;
            end;

            // Se não possui filhos que se encaixam no filtro verifica-se se
            // o centro atual se encaixa, se não, não o lista na grid.
            if possuiFilhosFiltrados(centro_atual) = false then
            begin
               if Length(edNomeCentro.text) >= 1 then
               begin
                  if ( not (
                     Pos(
                        edNomeCentro.Text,
                        LowerCase(TCentroCusto(listaCentros.Items[i]).Descricao)
                     ) > 0 )
                     or
                     (
                        (cbAtivo.ItemIndex > 0)  and
                        (filtroAtivoAceito <> TCentroCusto(listaCentros.Items[i]).Ativo)
                     )
                  ) then
                  begin
                     Continue;
                  end;
               end
               else
               begin
                  if (
                         (cbAtivo.ItemIndex > 0)  and
                         (filtroAtivoAceito <> TCentroCusto(listaCentros.Items[i]).Ativo)
                     )
                  then
                  begin
                     Continue;
                  end;
               end;
            end;
         end;

         // corrige nome do filho
         TCentroCusto(listaCentros.Items[i]).Descricao := identaNomeCentro(
            TCentroCusto(listaCentros.Items[i]).Descricao,
            nr_filho
         );


         New(data);

         data.objCentro := TCentroCusto(listaCentros.Items[i]);

         if nodo = nil then
         begin
            pai := vstCentros.InsertNode(nil, amInsertAfter, data);
         end;

         if nodo <> nil then
         begin
            pai := vstCentros.InsertNode(nodo, amAddChildLast, data);
         end;

         nr_filho_novo := nr_filho + 1;

         carregaCentrosGrid(
            TCentroCusto(listaCentros.Items[i]).Centro,
            pai,
            filtro,
            nr_filho_novo
         );
      end;
   end;
end;


// apenas realiza a identação do nome do centro
function Tfrm_CadCentros.identaNomeCentro(
   ds_centro: String;
   qtd_identar: integer
): String;
var
   a : integer;
begin
   ds_centro := trim(ds_centro);

   for a := 0 to qtd_identar - 1 do
   begin
      ds_centro := '    ' + ds_centro;
   end;

   Result := ds_centro;

end;

procedure Tfrm_CadCentros.carregaCentrosObjetos;
var
   qryBuscaCentros: TUMZQuery;
   objCentro: TCentroCusto;
   i: Integer;
   ordenacao : string;
const
   SQL_BUSCA_CENTROS_ATIVOS =
      ' SELECT '+
      ' 	fccc.*, '+
      '  fcg.ds_grupo '+
      ' FROM '+
      ' 	fin_config_centro_custos AS fccc '+
      ' LEFT JOIN fin_centro_grupo AS fcg ON ( '+
      ' 	fcg.cd_grupo = fccc.cd_grupo '+
      ' ) '+
      ' WHERE '+
      '  fccc.cd_coligada_matriz = :cd_coligada_matriz ';
begin
   listaCentros := TList.Create;

   DM.CriarConsulta(qryBuscaCentros);

   qryBuscaCentros.Close();
   qryBuscaCentros.SQL.Text := SQL_BUSCA_CENTROS_ATIVOS;


   if direcao_sord = sdAscending then
   begin
      ordenacao := 'asc';
   end
   else
   begin
      ordenacao := 'desc';
   end;

   if coluna_ordenar = 1 then
   begin
         qryBuscaCentros.SQL.Text := qryBuscaCentros.SQL.Text +
         ' order by fccc.cd_centro ' + ordenacao;
   end;

   if coluna_ordenar = 2 then
   begin
         qryBuscaCentros.SQL.Text := qryBuscaCentros.SQL.Text +
         ' order by fccc.cd_classificacao  ' + ordenacao;
   end;

   if coluna_ordenar = 3 then
   begin
         qryBuscaCentros.SQL.Text := qryBuscaCentros.SQL.Text +
         ' order by fccc.ds_centro  ' + ordenacao;
   end;

   if coluna_ordenar = 4 then
   begin
         qryBuscaCentros.SQL.Text := qryBuscaCentros.SQL.Text +
         ' order by fcg.ds_grupo  ' + ordenacao;
   end;

   qryBuscaCentros.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryBuscaCentros.Open();

   while not(qryBuscaCentros.Eof) do
   begin
      objCentro := TCentroCusto.Create(qryBuscaCentros.FieldByName('cd_centro').AsInteger, false);
      objCentro.Centro := qryBuscaCentros.FieldByName('cd_centro').AsInteger;
      objCentro.ColigadaMatriz := DM.UsuarioLogado.GetColigadaLogada.Codigo;
      objCentro.CentroPai := qryBuscaCentros.FieldByName('cd_centro_pai').AsInteger;
      objCentro.Ativo := qryBuscaCentros.FieldByName('sn_ativo').AsInteger = 1;
      objCentro.TipoCentro := qryBuscaCentros.FieldByName('tp_centro').AsInteger;
      objCentro.Grupo := qryBuscaCentros.FieldByName('cd_grupo').AsInteger;
      objCentro.Classificacao := qryBuscaCentros.FieldByName('cd_classificacao').AsString;
      objCentro.Descricao := qryBuscaCentros.FieldByName('ds_centro').AsString;
      objCentro.Observacao := qryBuscaCentros.FieldByName('ds_observacao').AsString;
      objCentro.SQL := qryBuscaCentros.FieldByName('ds_sql').AsString;
      objCentro.TipoRegra := qryBuscaCentros.FieldByName('nr_tipo_regra').AsInteger;
      objCentro.FGrupoExtenso := qryBuscaCentros.FieldByName('ds_grupo').AsString;
      objCentro.grupoExtensoSetado := True;

      listaCentros.Add(objCentro);
      
      qryBuscaCentros.Next;
   end;

   FreeAndNil(qryBuscaCentros);
end;

// carrega as informações da combo "selecione o nivel pai"
procedure Tfrm_CadCentros.carregaCentrosSinteticos(cd_centro: Integer; espacos: String);
var
   qryBuscaCentros: TUMZQuery;
   sinal: String;
begin
   DM.CriarConsulta(qryBuscaCentros);

   qryBuscaCentros.SQL.Text := SQL_CENTROS_SINTETICOS;

   qryBuscaCentros.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   qryBuscaCentros.ParamByName('cd_centro_pai').AsInteger :=
      cd_centro;

   qryBuscaCentros.Open;

   while not qryBuscaCentros.Eof do
   begin

      sinal := '-';

      if qryBuscaCentros.FieldByName('possui_filhos').AsInteger = 1 then
      begin
         sinal := '+';
      end;

      cbCentrosSinteticos.AddItem(
         espacos + sinal + qryBuscaCentros.FieldByName('ds_centro').AsString,
         TItemCombo.Create(
            qryBuscaCentros.FieldByName('cd_centro').AsString,
            qryBuscaCentros.FieldByName('ds_centro').AsString,
            qryBuscaCentros.FieldByName('cd_centro_pai').AsString
         )
      );

      carregaCentrosSinteticos(
         qryBuscaCentros.FieldByName('cd_centro').AsInteger,
         espacos + '   '
      );

      qryBuscaCentros.Next;
   end;

   FreeAndNil(qryBuscaCentros);
end;

procedure Tfrm_CadCentros.carregaColigadas;
var
   i: Integer;
   qryColigadasCentros: TUMZQuery;
begin

   clbColigadas.Items.Clear;

   DM.CriarConsulta(qryColigadasCentros);

   qryColigadasCentros.SQL.Text := ' SELECT cd_coligada FROM fin_centro_coligadas WHERE cd_centro = :cd_centro ';
   qryColigadasCentros.ParamByName('cd_centro').AsInteger :=
      qyCentrosCustoscd_centro.AsInteger;

   qryColigadasCentros.Open;

   for I := 0 to DM.GetUsuarioLogado.GetColigadasFilhas.Count - 1 do
   begin
      clbColigadas.AddItem(
         DM.GetUsuarioLogado.GetColigadasFilhas.Items[i].Nome,
         TItemCombo.Create(
            IntToStr(DM.GetUsuarioLogado.GetColigadasFilhas.Items[i].Codigo),
            DM.GetUsuarioLogado.GetColigadasFilhas.Items[i].Nome
         )
      );

      if qryColigadasCentros.Locate('cd_coligada', DM.GetUsuarioLogado.GetColigadasFilhas.Items[i].Codigo, []) then
      begin
         clbColigadas.Checked[i] := True;
      end;
   end;
end;

procedure Tfrm_CadCentros.carregaCursos(filtro: Boolean = False);
var
   qryCursos,
   qryCursosSelecionados: TUMZReadOnlyQuery;

   I: Integer;

   cursosSelecionados: TStringList;

   departamentosSelecionados,
   areasSelecionadas,
   separador: String;
const
   SQL_CURSOS =
      ' SELECT ' +
      ' 	cc.CD_CURSO, ' +
      ' 	cm.DS_CURSO, ' +
      '  cc.cd_coligada, ' +
      '  cm.cd_area, ' +
      '  cc.cd_depto ' +
      ' FROM ' +
      ' 	cursos_mestre cm ' +
      ' 	INNER JOIN cursos_coligadas cc ON ( ' +
      ' 		cm.CD_CURSO = cc.CD_CURSO ' +
      ' 	) ' +
      ' WHERE ' +
      '  cm.CD_AREA IN (%s) AND cm.sn_ativo = ''S'' ';

   SQL_CURSOS_SELECIONADOS = ' SELECT cd_coligada, cd_departamento, cd_curso FROM fin_centro_cursos WHERE cd_centro = :cd_centro ';

begin
   cursosSelecionados := TStringList.Create;

   for I := 0 to clbCursos.Count - 1 do
   begin
      if clbCursos.Checked[i] then
      begin
         cursosSelecionados.Add(TItemCombo(clbCursos.Items.Objects[i]).codigo);
      end;
   end;

   clbCursos.Items.Clear;

   DM.CriarConsulta(qryCursos);
   DM.CriarConsulta(qryCursosSelecionados);

   qryCursos.SQL.Text := SQL_CURSOS;
   qryCursosSelecionados.SQL.Text := SQL_CURSOS_SELECIONADOS;

   qryCursosSelecionados.ParamByName('cd_centro').AsInteger :=
      qyCentrosCustoscd_centro.AsInteger;

   qryCursosSelecionados.Open;

   separador := '';
   departamentosSelecionados := '';
   areasSelecionadas := '';

   for I := 0 to clbDepartamentos.Count - 1 do
   begin
      if clbDepartamentos.Checked[i] then
      begin
         departamentosSelecionados :=
            departamentosSelecionados +
            separador +
            TItemCombo(clbDepartamentos.Items.Objects[i]).codigo;

         separador := ', ';
      end;
   end;

   separador := '';

   for I := 0 to clbAreas.Count - 1 do
   begin
      if clbAreas.Checked[i] then
      begin
         areasSelecionadas :=
            areasSelecionadas +
            separador +
            TItemCombo(clbAreas.Items.Objects[i]).codigo;

         separador := ', ';
      end;
   end;

   if (departamentosSelecionados = '') or (areasSelecionadas = '') then
   begin
      Exit;
   end;

   qryCursos.SQL.Text := Format(SQL_CURSOS, [areasSelecionadas]);

   // Caso não tenha nenhum departamento filtrado, usa como filtro
   // todos departamentos selecionados na aba anterior
   if cbDepartamentos.ItemIndex = 0 then
   begin
      qryCursos.SQL.Add(Format(' AND cc.CD_DEPTO IN (%s)', [departamentosSelecionados]));
   end;

   if cbDepartamentos.ItemIndex > 0 then
   begin
      qryCursos.SQL.Add(' AND cc.cd_depto = :cd_depto ');
      qryCursos.ParamByName('cd_depto').AsString :=
         TItemCombo(cbDepartamentos.Items.Objects[cbDepartamentos.ItemIndex]).codigo;
   end;

   // Se for um filtro e tiver sido inserido algum valor no campo do
   // nome do centro, adiciona esta condição ao SQL
   if filtro and (edNomeCurso.Text <> '') then
   begin
      qryCursos.SQL.Add(Format(' AND cm.DS_CURSO LIKE ''%s'' ', ['%' + edNomeCurso.Text + '%']));
   end;

   qryCursos.Open;

   I := 0;

   while not qryCursos.Eof do
   begin

      clbCursos.AddItem(
         qryCursos.FieldByName('ds_curso').AsString,
         TItemCombo.Create(
            qryCursos.FieldByName('cd_curso').AsString,
            qryCursos.FieldByName('ds_curso').AsString,
            qryCursos.FieldByName('cd_depto').AsString,
            qryCursos.FieldByName('cd_coligada').AsString
         )
      );

      clbCursos.Checked[i] := (qryCursosSelecionados.Locate(
         'cd_coligada;cd_departamento;cd_curso',
         VarArrayOf([
            qryCursos.FieldByName('cd_coligada').AsInteger,
            qryCursos.FieldByName('cd_depto').AsInteger,
            qryCursos.FieldByName('cd_curso').AsString
         ]),
         []) or verificaCodigoArray(qryCursos.FieldByName('cd_curso').AsString, cursosSelecionados));

      Inc(I);

      qryCursos.Next;
   end;
end;

procedure Tfrm_CadCentros.carregaDepartamentos;
var
   qryDepartamentos,
   qryDepartamentosSelecionados: TUMZReadOnlyQuery;

   coligadasSelecionadas,
   separador : String;

   arrSelecionados: TStringList;

   i: Integer;

const
   SQL_DEPARTAMENTOS = ' SELECT ' +
      '   codigo, ' +
      '   descricao, ' +
      '   cd_coligada ' +
      ' FROM ' +
      '   departamentos ' +
      ' WHERE ' +
      '   1=1 ';

   SQL_DEPARTAMENTOS_SELECIONADOS = ' SELECT ' +
      '   cd_centro, ' +
      '   cd_coligada, ' +
      '   cd_departamento ' +
      ' FROM ' +
      '   fin_centro_departamentos ' +
      ' WHERE ' +
      '   cd_centro = :cd_centro ';
begin

   arrSelecionados := TStringList.Create;

   for I := 0 to clbDepartamentos.Count - 1 do
   begin
      if clbDepartamentos.Checked[i] then
      begin
         arrSelecionados.Add(TItemCombo(clbDepartamentos.Items.Objects[i]).codigo);   
      end;
   end;

   clbDepartamentos.Items.Clear;

   DM.CriarConsulta(qryDepartamentos);
   DM.CriarConsulta(qryDepartamentosSelecionados);

   for I := 0 to clbColigadas.Count - 1 do
   begin
      if clbColigadas.Checked[i] then
      begin
         coligadasSelecionadas :=
            coligadasSelecionadas +
            separador +
            TItemCombo(clbColigadas.Items.Objects[i]).codigo;

         separador := ', ';
      end;
   end;

   qryDepartamentos.SQL.Text := SQL_DEPARTAMENTOS;

   if coligadasSelecionadas <> '' then
   begin
      qryDepartamentos.SQL.Add(Format(' AND cd_coligada IN (%s) ', [coligadasSelecionadas]));
   end;

   qryDepartamentos.Open;

   coligadasSelecionadas := '';
   separador := '';

   qryDepartamentosSelecionados.SQL.Text := SQL_DEPARTAMENTOS_SELECIONADOS;

   qryDepartamentosSelecionados.ParamByName('cd_centro').AsInteger :=
      qyCentrosCustoscd_centro.AsInteger;

   qryDepartamentosSelecionados.Open;

   i := 0;

   while not(qryDepartamentos.Eof) do
   begin

      clbDepartamentos.AddItem(
         qryDepartamentos.FieldByName('descricao').AsString,
         TItemCombo.Create(
            qryDepartamentos.FieldByName('codigo').AsString,
            qryDepartamentos.FieldByName('descricao').AsString,
            qryDepartamentos.FieldByName('cd_coligada').AsString
         )
      );

      if qryDepartamentosSelecionados.Locate('cd_departamento', qryDepartamentos.FieldByName('codigo').AsString, []) or
         (verificaCodigoArray(qryDepartamentos.FieldByName('codigo').AsString, arrSelecionados)) then
      begin
         clbDepartamentos.Checked[i] := True;
      end;
      
      Inc(i);
      
      qryDepartamentos.Next;
   end;
end;

procedure Tfrm_CadCentros.carregaDepartamentosCombo;
var
   i: integer;
begin

   cbDepartamentos.Items.Clear;

   cbDepartamentos.AddItem('Todos', nil);

   for I := 0 to clbDepartamentos.Count - 1 do
   begin
      if clbDepartamentos.Checked[i] then
      begin
         cbDepartamentos.AddItem(
            TItemCombo(clbDepartamentos.Items.Objects[i]).descricao,
            clbDepartamentos.Items.Objects[i]
         );
      end;
   end;

   cbDepartamentos.ItemIndex := 0;
end;

procedure Tfrm_CadCentros.cbCentrosSinteticosChange(Sender: TObject);
var
   grauParentesco: Integer;
begin
   if not(qyCentrosCustos.State in [dsBrowse]) then
   begin
      qyCentrosCustoscd_centro_pai.AsInteger := StrToInt(TItemCombo(cbCentrosSinteticos.Items.Objects[cbCentrosSinteticos.ItemIndex]).getCodigo);

//      if qyCentrosCustos.State in [dsInsert] then
//      begin
         grauParentesco := getGrauParentesco(
            StrToInt(TItemCombo(cbCentrosSinteticos.Items.Objects[cbCentrosSinteticos.ItemIndex]).getCodigo)
         );
         
         qyCentrosCustoscd_classificacao.AsString := getClassificacao(
            grauParentesco,
            StrToInt(TItemCombo(cbCentrosSinteticos.Items.Objects[cbCentrosSinteticos.ItemIndex]).codigo)
         );
//      end;

      FORCA_ATUALIZACAO := True;

      verificaRegrasDisponiveis(qyCentrosCustoscd_centro.AsInteger);

      // se a conta pai selecionada tiver REGRAS,
      // entao a conta filha nao pode ser sintetica..
      // apenas analitica

      DBRadioGroup1.Controls[0].Enabled := True;
      DBRadioGroup1.Controls[1].Enabled := True;

      verificaCentroPai(
         StrToInt(TItemCombo(cbCentrosSinteticos.Items.Objects[cbCentrosSinteticos.ItemIndex]).getCodigo)
      );

   end;
end;


// verifica se o centro pai pode habilitar centros sinteticos ou analiticos apenas
procedure Tfrm_CadCentros.verificaCentroPai(cd_centro: integer);
begin
   DM.CriarConsulta( qVerificar );

   qVerificar.SQL.Clear();
   qVerificar.SQL.Add(
      'SELECT nr_tipo_regra FROM fin_config_centro_custos WHERE cd_centro = '
      +  inttostr( cd_centro )
      + ' limit 1'
   );
   qVerificar.Open();
   qVerificar.First();

   if not qVerificar.Eof then
   begin

      DBRadioGroup1.Controls[0].Enabled := True;
      DBRadioGroup1.Controls[1].Enabled := True;

      if qVerificar.FieldByName('nr_tipo_regra').AsInteger = 2 then
      begin
         DBRadioGroup1.Controls[0].Enabled := true;
         DBRadioGroup1.Controls[1].Enabled := false;
         DBRadioGroup1.itemindex := 0;
      end;

      if qVerificar.FieldByName('nr_tipo_regra').AsInteger = 3 then
      begin
         DBRadioGroup1.Controls[0].Enabled := true;
         DBRadioGroup1.Controls[1].Enabled := false;
         DBRadioGroup1.itemindex := 0;
      end;
      
   end;

   qVerificar.close();

end;


procedure Tfrm_CadCentros.checkAll(Sender: TObject);
var
   i: Integer;
begin
   for I := 0 to TCheckListBox(Sender).Count - 1 do
   begin
      TCheckListBox(Sender).Checked[i] := True;
   end;
end;

procedure Tfrm_CadCentros.clbAreasClickCheck(Sender: TObject);
begin
   areaAlterada := True;

   if not(clbAreas.Checked[clbAreas.ItemIndex]) then
   begin
      if verificaCertezaAlteracao(Sender) then
      begin
         areaAlterada := False;         
      end;
   end;
end;

procedure Tfrm_CadCentros.clbColigadasClickCheck(Sender: TObject);
begin
   unidadeEnsinoAlterada := True;
end;

procedure Tfrm_CadCentros.clbDepartamentosClickCheck(Sender: TObject);
begin
   departamentoAlterado := True;

   if not(clbDepartamentos.Checked[clbDepartamentos.ItemIndex]) then
   begin
      if verificaCertezaAlteracao(Sender) then
      begin
         departamentoAlterado := False;
      end;
   end;
end;

// radio do analitico e sintetico
procedure Tfrm_CadCentros.DBRadioGroup1Change(Sender: TObject);
begin
   verificaRegrasDisponiveis(qyCentrosCustoscd_centro.AsInteger);
end;

procedure Tfrm_CadCentros.edNomeCentroChange(Sender: TObject);
begin
   edNomeCentro.Text := LowerCase(edNomeCentro.Text);
   edNomeCentro.SelStart := Length(edNomeCentro.Text);
end;

procedure Tfrm_CadCentros.edNomeCentroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_RETURN then
   begin
      btnFiltrar.Click;      
   end;
end;

procedure Tfrm_CadCentros.edOrdemClassificacaoChange(Sender: TObject);
begin
   atualizaLabelClassificacao;
end;

procedure Tfrm_CadCentros.edOrdemClassificacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8, '0'..'9']) then
   begin
      Key := #0;
   end;
end;

procedure Tfrm_CadCentros.btnCancelarClick(Sender: TObject);
var
   NodeAtual : PVirtualNode;
begin
   // Cancelar

   qyCentrosCustos.Cancel();

   // vamos percorrer a grade para tentar descobrir o codigo
   NodeAtual := vstCentros.TopNode;
   NodeAtual := vstCentros.GetFirstChild(NodeAtual);

   procuraNoFilho(0, NodeAtual);
end;

procedure Tfrm_CadCentros.sbCheckAllClick(Sender: TObject);
begin
   if pgRegras.ActivePage = tsUnidadeEnsino then
   begin
      checkAll(clbColigadas);
   end
   else if pgRegras.ActivePage = tsAreas then
   begin

      if verificaCursoSelecionado and (Mensagem(
         'Você está desmarcando uma opção que pode interferir na aba de cursos. Ao confirmar esta ação, os cursos já selecionados para esta área serão desvinculados. Deseja continuar?',
         'Aviso', MB_ICONEXCLAMATION + MB_YESNO, Handle) = mrNo) then
      begin
         Exit;
      end;

      checkAll(clbAreas);
   end
   else if pgRegras.ActivePage = tsDepartamentos then
   begin
   
      if verificaCursoSelecionado and (Mensagem(
         'Você está desmarcando uma opção que pode interferir na aba de cursos. ' +
         'Ao confirmar esta ação, os cursos já selecionados para esta área serão desvinculados. Deseja continuar?',
         'Aviso', MB_ICONEXCLAMATION + MB_YESNO, Handle) = mrNo) then
      begin
         Exit;
      end;
      
      checkAll(clbDepartamentos);
   end
   else if pgRegras.ActivePage = tsCursos then
   begin
      checkAll(clbCursos);
   end;
end;

procedure Tfrm_CadCentros.sbUncheckAllClick(Sender: TObject);
begin
   if pgRegras.ActivePage = tsUnidadeEnsino then
   begin
      uncheckAll(clbColigadas);
   end
   else if pgRegras.ActivePage = tsAreas then
   begin
      uncheckAll(clbAreas);
   end
   else if pgRegras.ActivePage = tsDepartamentos then
   begin
      uncheckAll(clbDepartamentos);
   end
   else if pgRegras.ActivePage = tsCursos then
   begin
      uncheckAll(clbCursos);
   end;
end;

procedure Tfrm_CadCentros.srcCentrosCustosDataChange(Sender: TObject;
  Field: TField);
var
   i: Integer;
   lClassificacao,
   slClassificacao: TStringList;
begin

   edOrdemClassificacao.Text := '';

   if (qyCentrosCustoscd_centro.AsInteger > 0) and (qyCentrosCustos.State in [dsEdit, dsBrowse]) then
   begin
      i := getGrauParentesco(qyCentrosCustoscd_centro.AsInteger);

      edOrdemClassificacao.Text := IntToStr(getValorParentescoClassificacao(IntToStr(i - 1),qyCentrosCustoscd_centro.AsInteger));
      edOrdemClassificacao.Tag := i - 1;

      slClassificacao := explode(mascara_parametro, '.');

      for i := 0 to slClassificacao.Count - 1 do
      begin
         if (i + 1) = edOrdemClassificacao.Tag then
         begin
            edOrdemClassificacao.MaxLength := Length(slClassificacao.Strings[i]);
         end;
      end;
   end;

   DBRadioGroup1.Controls[0].Enabled := not(isCentroPai());

   lbClassificacao.Caption := qyCentrosCustoscd_classificacao.AsString;

   unidadeEnsinoAlterada := False;
   areaAlterada := False;
   departamentoAlterado := False;

   if qyCentrosCustoscd_centro_pai.IsNull then
   begin
      cbCentrosSinteticos.ItemIndex := -1;
   end;

   if not(qyCentrosCustosnr_tipo_regra.IsNull) then
   begin
      TRadioButton(rgRegras.Controls[qyCentrosCustosnr_tipo_regra.AsInteger-1]).Checked := True;
   end;

   pgRegras.ActivePageIndex := 0;

   if qyCentrosCustos.State in [dsBrowse] then
   begin
      carregaColigadas;
      carregaAreas;
      carregaDepartamentos;
      carregaDepartamentosCombo;
      carregaCursos();
   end;

   dbmmCondicaoSQL.Enabled := DM.UsuarioLogado.hasPapel('ADMIN');

   verificaRegrasDisponiveis(qyCentrosCustoscd_centro.AsInteger);

   i := 0;

   while i < cbCentrosSinteticos.Items.Count do
   begin
      if TItemCombo(cbCentrosSinteticos.Items.Objects[i]).getCodigo = qyCentrosCustoscd_centro_pai.AsString then
      begin
         cbCentrosSinteticos.ItemIndex := i;                
      end;

      i := i + 1;
   end;
end;

procedure Tfrm_CadCentros.srcCentrosCustosStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qyCentrosCustos.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyCentrosCustos.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyCentrosCustos.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyCentrosCustos.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyCentrosCustos.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyCentrosCustos.State in [dsInsert, dsEdit]);
    cbCentrosSinteticos.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);

    // Permite aterar as regras do centro de custo somente se estiver em modo
    // de inserção ou alteração.
    rgRegras.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    clbColigadas.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    clbAreas.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    clbDepartamentos.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    cbDepartamentos.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    edNomeCurso.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    btnFiltrarCursos.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    clbCursos.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    dbmmCondicaoSQL.Enabled := (qyCentrosCustos.State in [dsInsert, dsEdit]);
    edOrdemClassificacao.Enabled := (qyCentrosCustos.State in [dsEdit]);

    if qyCentrosCustos.State in [dsInsert] then
    begin
      rgRegras.Controls[0].Enabled := True;
      rgRegras.Controls[1].Enabled := True;
      rgRegras.Controls[2].Enabled := True;
      rgRegras.ItemIndex := -1;
    end;
end;

procedure Tfrm_CadCentros.uncheckAll(Sender: TObject);
var
   i: Integer;
begin
   for I := 0 to TCheckListBox(Sender).Count - 1 do
   begin
      TCheckListBox(Sender).Checked[i] := False;
   end;
end;



function Tfrm_CadCentros.verificaCertezaAlteracao(Sender: TObject): Boolean;
begin
   if Mensagem(
      'Você está desmarcando uma opção que pode interferir na aba de cursos. Ao confirmar esta ação, os cursos já selecionados para esta área serão desvinculados. Deseja continuar?',
      'Aviso', MB_ICONEXCLAMATION + MB_YESNO, Handle) = mrNo then
   begin
      TCheckListBox(Sender).Checked[TCheckListBox(Sender).ItemIndex] :=
         not(TCheckListBox(Sender).Checked[TCheckListBox(Sender).ItemIndex]);

      Result := False;
      Exit;   
   end;

   Result := True;
end;

function Tfrm_CadCentros.verificaExcluirCentroDisponivel(cd_centro: Integer): Boolean;
var
   qryVerificaExclusao,
   qryVerificaTurmasVinculadas: TUMZReadOnlyQuery;

const
   SQL_VERIFICA =
      ' SELECT ' +
	   '   COUNT(cd_centro) as qtd ' +
      ' FROM ' +
	   '   fin_config_centro_custos ' +
      ' WHERE ' +
	   '   cd_centro_pai = :cd_centro_pai ';

   SQL_VERIFICA_TURMAS_VINCULADAS =
      ' SELECT '+
      ' 	count(codigo) AS qtd '+
      ' FROM '+
      ' 	turmas '+
      ' WHERE '+
      ' 	cd_centro = :cd_centro ';


begin
   Result := True;

   DM.CriarConsulta(qryVerificaExclusao);
   DM.CriarConsulta(qryVerificaTurmasVinculadas);

   qryVerificaTurmasVinculadas.SQL.Text :=
      SQL_VERIFICA_TURMAS_VINCULADAS;

   qryVerificaTurmasVinculadas.ParamByName('cd_centro').AsInteger :=
      cd_centro;

   qryVerificaTurmasVinculadas.Open;

   qryVerificaExclusao.SQL.Text := SQL_VERIFICA;
   qryVerificaExclusao.ParamByName('cd_centro_pai').AsInteger := cd_centro;
   qryVerificaExclusao.Open;

   if qryVerificaTurmasVinculadas.FieldByName('qtd').AsInteger > 0 then
   begin
      Result := False;
   end;

   if qryVerificaExclusao.FieldByName('qtd').AsInteger > 0 then
   begin
      Result := False;
   end;
end;

procedure Tfrm_CadCentros.verificaRegrasDisponiveis(cd_centro: Integer);
begin
   { Atualiza o RadioGroup das regras do centro de custo }
   rgRegras.Controls[0].Enabled := True;
   rgRegras.Controls[1].Enabled := True;
   rgRegras.Controls[2].Enabled := True;

   if DBRadioGroup1.Value = '2' then
   begin
      rgRegras.Controls[1].Enabled := False;

      if not(isUltimoFilhoSintetico(cd_centro)) then
      begin
         rgRegras.Controls[2].Enabled := False;
      end;
   end;

   if DBRadioGroup1.Value = '1' then
   begin
      rgRegras.Controls[2].Enabled := False;
   end;
end;

procedure Tfrm_CadCentros.vstCentrosChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
   if Assigned(Sender.GetNodeData(Node)) then
   begin
      qyCentrosCustos.Close;
      qyCentrosCustos.ParamByName('cd_centro').AsInteger :=
         PCentro(Sender.GetNodeData(Node)^).objCentro.Centro;
      qyCentrosCustos.Open;

      CodigoSelecionado :=  PCentro(Sender.GetNodeData(Node)^).objCentro.Centro;
   end;
end;



procedure Tfrm_CadCentros.vstCentrosEnter(Sender: TObject);
begin
   if not (qyCentrosCustos.State in [dsBrowse]) then
   begin
      qyCentrosCustos.Cancel;
   end;
end;

procedure Tfrm_CadCentros.vstCentrosGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
   data: PCentro;  
begin
   data := PCentro(Sender.GetNodeData(Node)^);

   case Column of
      0: CellText := '';
      1: CellText := IntToStr(data.objCentro.Centro);
      2: CellText := data.objCentro.Classificacao;
      3: CellText := data.objCentro.Descricao;
      4: CellText := data.objCentro.getTipoExtenso;
      5: CellText := data.objCentro.getGrupoExtenso;
   end;
end;

procedure Tfrm_CadCentros.vstCentrosHeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin

  if HitInfo.Button = mbLeft then
  begin
    with Sender, Treeview do
    begin
      if SortColumn > NoColumn then
        Columns[SortColumn].Options := Columns[SortColumn].Options + [coParentColor];

      // Do not sort the last column, it contains nothing to sort.
      if HitInfo.Column = 2 then
        SortColumn := NoColumn
      else
      begin
        if (SortColumn = NoColumn) or (SortColumn <> HitInfo.Column) then
        begin
          SortColumn := HitInfo.Column;
          SortDirection := sdAscending;
        end
        else
          if SortDirection = sdAscending then
            SortDirection := sdDescending
          else
            SortDirection := sdAscending;

        if SortColumn <> NoColumn then
        begin
          Columns[SortColumn].Color := $F7F7F7;
        end;

        SortTree(SortColumn, SortDirection, true);
        coluna_ordenar :=  HitInfo.Column;
        direcao_sord := SortDirection;

        recarregaForm;

      end;
    end;
  end;
end;




procedure Tfrm_CadCentros.vstCentrosNodeDblClick(Sender: TBaseVirtualTree;
  const HitInfo: THitInfo);
var
   frmCentroTurmas : TfrmCentroTurmas;
begin
   // Registrar as turmas pertencentes a esse centro de custo
   if Assigned(vstCentros.FocusedNode) then
   begin
      TfrmCentroTurmas.AbrirTela(
         PCentro(Sender.GetNodeData(vstCentros.FocusedNode)^).objCentro.Centro,
         DM.GetUsuarioLogado.GetColigadaLogada.Codigo
      );
   end;
end;

procedure Tfrm_CadCentros.pgRegrasChange(Sender: TObject);
var
   i: Integer;
   
   unidadeSelecionada,
   selecionouArea,
   selecionouDepartamento: Boolean;
begin

   // Verifica se o usuário selecionou a aba de Áreas
   if pgRegras.ActivePageIndex = 1 then
   begin

      unidadeSelecionada := False;

      for I := 0 to clbColigadas.Count - 1 do
      begin
         if clbColigadas.Checked[i] then
         begin
            unidadeSelecionada := True;
         end;
      end;

      // Caso não exista nenhuma coligada selecionada na aba de Unidade Ensino
      // não permite o usuário selecionar áreas. 
      if not (unidadeSelecionada) then
      begin
         Mensagem(
            'Você deve selecionar ao menos uma coligada para poder prosseguir.',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );
         pgRegras.ActivePageIndex := 0;
      end;

   end;

   // Verificar se o usuário selecionou a aba Departamentos
   if pgRegras.ActivePageIndex = 2 then
   begin

      unidadeSelecionada := False;

      for I := 0 to clbColigadas.Count - 1 do
      begin
         if clbColigadas.Checked[i] then
         begin
            unidadeSelecionada := True;
         end;
      end;

      // Caso não exista nenhuma coligada selecionada na aba de Unidade Ensino
      // não permite o usuário selecionar áreas. 
      if not (unidadeSelecionada) then
      begin
         Mensagem(
            'Você deve selecionar ao menos uma coligada para poder prosseguir.',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );
         pgRegras.ActivePageIndex := 0;
         Exit;
      end;
      
      if unidadeEnsinoAlterada then
      begin
         carregaDepartamentos;
      end;
   end;

   if pgRegras.ActivePageIndex = 3 then
   begin
      selecionouArea := False;
      selecionouDepartamento := False;

      for I := 0 to clbAreas.Count - 1 do
      begin
         if clbAreas.Checked[i] then
         begin
            selecionouArea := True;
         end;
      end;

      for I := 0 to clbDepartamentos.Count - 1 do
      begin
         if clbDepartamentos.Checked[i] then
         begin
            selecionouDepartamento := True;
         end;
      end;

      if not(selecionouArea) or not(selecionouDepartamento) then
      begin
         Mensagem(
            'Você deve selecionar pelo menos um departamento e uma área.',
            'Aviso',
            MB_OK + MB_ICONWARNING,
            Handle
         );

         if not(selecionouArea) then
         begin
            pgRegras.ActivePageIndex := 1;
         end
         else
         begin
            pgRegras.ActivePageIndex := 2;
         end;

         Exit;
      end;

      carregaDepartamentosCombo;

      if areaAlterada or departamentoAlterado then
      begin
         carregaCursos();
      end;

      cbDepartamentos.ItemIndex := 0;
   end;
end;

function Tfrm_CadCentros.possuiFilhosFiltrados(cd_centro_pai: Integer): Boolean;
var
   filtroAtivoAceito: Boolean;
   i: Integer;
   cd_centro_atual : integer;
   cd_centro_pai_atual : integer;
   soma1, soma2 :integer;
begin
   Result := False;

   for I := 0 to listaCentros.Count - 1 do
   begin

      cd_centro_pai_atual :=  TCentroCusto(listaCentros.Items[i]).CentroPai;
      cd_centro_atual :=  TCentroCusto(listaCentros.Items[i]).Centro;

      if cd_centro_pai_atual = cd_centro_pai then
      begin
         filtroAtivoAceito := True;

         if cbAtivo.ItemIndex = 1 then
         begin
            filtroAtivoAceito := true;
         end;

         if cbAtivo.ItemIndex = 2 then
         begin
            filtroAtivoAceito := false;
         end;

         if possuiFilhosFiltrados(cd_centro_atual) = true then
         begin
            Result := True;
            Exit;
         end;
         

         // é busca com texto?
         if Length(edNomeCentro.Text) >= 1 then
         begin
            if ( Pos(edNomeCentro.Text, LowerCase(TCentroCusto(listaCentros.Items[i]).Descricao)) > 0 ) or
               (
                  (cbAtivo.ItemIndex > 0)  and
                  (filtroAtivoAceito = TCentroCusto(listaCentros.Items[i]).Ativo)
               )
            then
            begin
               Result := True;
               Exit;
            end;
         end
         else
         begin
            if  (
                  (cbAtivo.ItemIndex > 0)  and
                  (filtroAtivoAceito = TCentroCusto(listaCentros.Items[i]).Ativo)
               )  then
            begin
               Result := True;
               Exit;
            end;
         end;
      end;
   end;
end;

procedure Tfrm_CadCentros.qyCentrosCustosAfterInsert(DataSet: TDataSet);
begin
  // Inclusão
  qyCentrosCustos.FieldByName('cd_centro').AsInteger := DM.ProximoId2('cd_centro', 'cd_coligada_matriz', 'fin_config_centro_custos', DM.UsuarioLogado.ColigadaLogada);
end;

procedure Tfrm_CadCentros.qyCentrosCustosAfterPost(DataSet: TDataSet);
var
   arrClassificacao: TStringList;
   i: Integer;
   campos: String;
   qryClassificacao: TUMZQuery;
   node: PVirtualNode;
const
   SQL_INSERE_CLASSIFICACAO = 'REPLACE INTO fin_centro_custos_classifica SET cd_centro = :cd_centro, cd_coligada_matriz = :cd_coligada_matriz%s';
begin
//   if INSERINDO_CENTRO then
//   begin
      arrClassificacao := General.explode(qyCentrosCustoscd_classificacao.AsString, '.');

      for I := 0 to arrClassificacao.Count - 1 do
      begin
         campos := campos + ', nr_classificacao' + IntToStr(I + 1) + ' = ' + arrClassificacao.Strings[i];
      end;

      DM.CriarConsulta(qryClassificacao);

      qryClassificacao.SQL.Text := Format(SQL_INSERE_CLASSIFICACAO, [campos]);
      qryClassificacao.ParamByName('cd_centro').AsInteger := qyCentrosCustoscd_centro.AsInteger;
      qryClassificacao.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
      qryClassificacao.ExecSQL;
//   end;

   if qyCentrosCustosnr_tipo_regra.AsInteger = 1 then
   begin
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_areas');
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_coligadas');
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_cursos');
      limparRegistros(qyCentrosCustoscd_centro.AsInteger, 'fin_centro_departamentos');      
   end;
end;

procedure Tfrm_CadCentros.qyCentrosCustosCalcFields(DataSet: TDataSet);
begin

  case qyCentrosCustos.FieldByName('tp_centro').AsInteger of
    1: qyCentrosCustos.FieldByName('ds_tp_centro').AsString := 'Analítica';
    2: qyCentrosCustos.FieldByName('ds_tp_centro').AsString := 'Sintética';
  end;

end;

procedure Tfrm_CadCentros.qyCentrosCustosNewRecord(DataSet: TDataSet);
begin
   qyCentrosCustoscd_coligada_matriz.AsInteger := DM.UsuarioLogado.ColigadaLogada;
end;

procedure Tfrm_CadCentros.recarregaForm;
begin

   vstCentros.Clear;
   carregaCentrosObjetos();
   carregaCentrosGrid(0);

   // Selecionar somente o centro informado
   qyCentrosCustos.Close();
   qyCentrosCustos.ParamByName('cd_coligada').AsInteger :=
      DM.UsuarioLogado.ColigadaLogada;
   qyCentrosCustos.ParamByName('cd_centro').AsInteger := 0;
   qyCentrosCustos.Open();

   cbCentrosSinteticos.AddItem('Raiz', TItemCombo.Create('0', 'Raiz'));
   carregaCentrosSinteticos(0);

   // Definindo a máscara do campo Classificação
   qyCentrosCustos.FieldByName('cd_classificacao').EditMask := DM.variavel_parametro('mascara_plano_custos');
   vstCentros.FullExpand();
end;

procedure Tfrm_CadCentros.rgRegrasClick(Sender: TObject);
begin
   if not(qyCentrosCustos.State in [dsBrowse]) then
   begin
      qyCentrosCustosnr_tipo_regra.AsInteger := rgRegras.ItemIndex + 1;
   end;

   if rgRegras.ItemIndex = 0 then
   begin
      pgRegras.Visible := False;
   end
   else
   begin
      pgRegras.Visible := True;
   end;

end;

procedure Tfrm_CadCentros.buscaNodoCentro(Sender: TBaseVirtualTree; Node: PVirtualNode;
   Data: Pointer; var Abort: Boolean);
var
   NodeData: PCentro;
begin
   NodeData := PCentro(Sender.GetNodeData(Node)^);
   Abort := (String(data) = IntToStr(NodeData.objCentro.Centro));
end;


function Tfrm_CadCentros.getClassificacao(grau, cd_centro: Integer): String;
var
   qryBuscaClassificacoes,
   qryBuscaMaximo: TUMZQuery;
   mascara, separador, condicaoMaximo: String;
   arrClassificacao: TStringList;
   i: Integer;
const
   SQL_BUSCA_MAX = ' SELECT MAX(%s) AS qtd FROM fin_centro_custos_classifica %s';
   SQL_BUSCA_CLASSIFICA = ' SELECT * FROM fin_centro_custos_classifica WHERE cd_centro = :cd_centro AND cd_coligada_matriz = :cd_coligada_matriz ';
begin

   mascara := DM.variavel_parametro('mascara_plano_custos');
   mascara := StringReplace(mascara, '9', '0', [rfReplaceAll, rfIgnoreCase]);

   arrClassificacao := General.explode(mascara, '.');

   if grau > arrClassificacao.Count then
   begin
      Mensagem(
         'Esta conta não pode ultrapassar o limíte de níveis definidos na máscara',
         'Aviso',
         MB_OK + MB_ICONWARNING,
         Handle
      );

      cbCentrosSinteticos.ItemIndex := -1;

      Result := '';
      Exit;
   end;

   DM.CriarConsulta(qryBuscaClassificacoes);
   DM.CriarConsulta(qryBuscaMaximo);

   qryBuscaClassificacoes.SQL.Text := SQL_BUSCA_CLASSIFICA;
   qryBuscaClassificacoes.ParamByName('cd_centro').AsInteger := cd_centro;
   qryBuscaClassificacoes.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryBuscaClassificacoes.Open;

   separador := ' AND ';
   condicaoMaximo := '';

   for I := 0 to arrClassificacao.Count - 1 do
   begin

      // Se não for o grau novo que será criado, mantem valores do centro de custo pai
      if (i + 1) < grau then
      begin
         // Função lpad usada para manter o número de casas definidas na máscara
         arrClassificacao.Strings[i] := lPad(qryBuscaClassificacoes.FieldByName('nr_classificacao' + IntToStr(i+1)).AsString, '0', Length(arrClassificacao.Strings[i]));
      end;

      if (qryBuscaClassificacoes.RecordCount > 0) and ((i + 1) < grau) then
      begin
         condicaoMaximo :=
            condicaoMaximo +
            separador +
            'nr_classificacao' +
            IntToStr(i+1) +
            ' = ' +
            qryBuscaClassificacoes.FieldByName('nr_classificacao' + IntToStr(i+1)).AsString;
      end;

      // Caso encontre o novo grau de classificacao de centro de custo que sera
      // gerado, deve busca o máximo até aqui e acrescentar um
      if (i + 1) = grau then
      begin

         qryBuscaMaximo.SQL.Text := Format(SQL_BUSCA_MAX, ['nr_classificacao' + IntToStr(grau), ' WHERE cd_coligada_matriz = :cd_coligada_matriz ' + condicaoMaximo]);
         
         qryBuscaMaximo.ParamByName('cd_coligada_matriz').AsInteger :=
            DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
            
         qryBuscaMaximo.Open;

         if Length(IntToStr(qryBuscaMaximo.FieldByName('qtd').AsInteger + 1)) > Length(arrClassificacao.Strings[i]) then
         begin
            Mensagem(
               'Não existem mais mascaras válidas pois chegou no limite máximo para a classificação das contas',
               'Aviso',
               MB_OK + MB_ICONWARNING,
               Handle
            );

            cbCentrosSinteticos.ItemIndex := -1;

            Exit;
         end;

         arrClassificacao.Strings[i] := lPad(
            IntToStr(qryBuscaMaximo.FieldByName('qtd').AsInteger + 1),
            '0',
            Length(arrClassificacao.Strings[i])
         );
      end;

   end;

   separador := '';

   for I := 0 to arrClassificacao.Count - 1 do
   begin
      Result := Result + separador + arrClassificacao.Strings[i];
      separador := '.';
   end;
end;

function Tfrm_CadCentros.getClassificacaoReduzida(
  cd_classificacao: String): String;
var
   arrClassificacao: TStringList;
   i, j: Integer;
   parteValida: Boolean;
   separador: String;
begin

   arrClassificacao := General.explode(cd_classificacao, '.');

   separador := '';

   for I := 0 to arrClassificacao.Count - 1 do
   begin
      parteValida := False;

      for j := 1 to Length(arrClassificacao.Strings[i]) do
      begin
         if arrClassificacao.Strings[i][j] in ['1'..'9'] then
         begin
            parteValida := True;
            Break;
         end;
      end;

      if parteValida then
      begin
         Result := Result + separador + arrClassificacao.Strings[i];
         separador := '.';
      end;

      if not parteValida then
      begin
         Exit;
      end;
   end;
end;

function Tfrm_CadCentros.getFilhos(cd_centro_custo_pai: Integer;
  filhos: String): String;
const
   SQL_GET_FILHOS =
      ' SELECT '+
      '  cd_centro '+
      ' FROM '+
      ' 	fin_config_centro_custos '+
      ' WHERE '+
      ' 	cd_centro_pai = :cd_centro_pai ';
var
   qryBuscaFilhos: TUMZReadOnlyQuery;      
begin
   Result := filhos;

   DM.CriarConsulta(qryBuscaFilhos);

   qryBuscaFilhos.SQL.Text := SQL_GET_FILHOS;
   qryBuscaFilhos.ParamByName('cd_centro_pai').AsInteger :=
      cd_centro_custo_pai;
   qryBuscaFilhos.Open;

   while not qryBuscaFilhos.Eof do
   begin
      Result := Result + ', ' + qryBuscaFilhos.FieldByName('cd_centro').AsString;
      Result := getFilhos(qryBuscaFilhos.FieldByName('cd_centro').AsInteger, Result);
      qryBuscaFilhos.Next;
   end;
end;

function Tfrm_CadCentros.getGrauParentesco(cd_centro: Integer): Integer;
var
   qryBuscaCentros: TUMZQuery;
   cd_centro_pai: Integer;
const
   SQL_BUSCA_CENTRO = 'SELECT cd_centro, cd_centro_pai FROM fin_config_centro_custos WHERE cd_centro = :cd_centro';
begin

   Result := 1;

   if cd_centro = 0 then
   begin
      Exit;
   end;

   DM.CriarConsulta(qryBuscaCentros);

   qryBuscaCentros.SQL.Text := SQL_BUSCA_CENTRO;

   qryBuscaCentros.ParamByName('cd_centro').AsInteger := cd_centro;

   qryBuscaCentros.Open;

   cd_centro_pai := 0;

   while True do
   begin
      Result := Result + 1;

      cd_centro_pai := qryBuscaCentros.FieldByName('cd_centro_pai').AsInteger;

      qryBuscaCentros.Close;
      qryBuscaCentros.ParamByName('cd_centro').AsInteger := cd_centro_pai;
      qryBuscaCentros.Open;

      if qryBuscaCentros.IsEmpty then
      begin
         Exit;
      end;
   end;
end;

function Tfrm_CadCentros.getValorParentescoClassificacao(grau_parentesco: String;
  cd_centro_custo: Integer): Integer;
const
   SQL_BUSCA_CLASSIFICACAO =
      ' SELECT '+
      ' 	nr_classificacao%s numero_classifica'+
      ' FROM '+
      ' 	fin_centro_custos_classifica  '+
      ' WHERE '+
      ' 	cd_centro = :cd_centro_custo ';
var
   qryBuscaClassifica: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qryBuscaClassifica);

   qryBuscaClassifica.SQL.Text := Format(SQL_BUSCA_CLASSIFICACAO, [grau_parentesco]);
   qryBuscaClassifica.ParamByName('cd_centro_custo').AsInteger := cd_centro_custo;
   qryBuscaClassifica.Open;

   Result := qryBuscaClassifica.FieldByName('numero_classifica').AsInteger;
end;

procedure Tfrm_CadCentros.grdDblClick(Sender: TObject);
var
   frmCentroTurmas : TfrmCentroTurmas;
begin
   // Registrar as turmas pertencentes a esse centro de custo
   TfrmCentroTurmas.AbrirTela(
      qyCentrosCustos.FieldByName('cd_centro').AsInteger,
      qyCentrosCustos.FieldByName('cd_coligada_matriz').AsInteger );
end;



function Tfrm_CadCentros.isCentroPai: Boolean;
const
   SQL_IS_CENTRO_PAI =
      ' SELECT '+
      ' 	count(*) AS qtd '+
      ' FROM '+
      ' 	fin_config_centro_custos '+
      ' WHERE '+
      ' 	cd_centro_pai = :cd_centro_pai ';
var
   qryIsCentroPai: TUMZReadOnlyQuery;      
begin
   DM.CriarConsulta(qryIsCentroPai);

   qryIsCentroPai.SQL.Text := SQL_IS_CENTRO_PAI;
   qryIsCentroPai.ParamByName('cd_centro_pai').AsInteger :=
      qyCentrosCustoscd_centro.AsInteger;
   qryIsCentroPai.Open;

   Result := qryIsCentroPai.FieldByName('qtd').AsInteger > 0;
end;

function Tfrm_CadCentros.isOrdemClassiValida(ordem: Integer;
  valor: String): Boolean;
const
   SQL_IS_ORDEM_VALIDA =
      ' SELECT ' +
      ' 	COUNT(*) AS qtd ' +
      ' FROM ' +
      ' 	fin_centro_custos_classifica ' +
      ' WHERE ' +
      ' 	nr_classificacao%s = :valor_classificacao AND cd_centro IN ' +
      '  (SELECT cd_centro FROM fin_config_centro_custos WHERE cd_centro_pai = :cd_centro_pai AND cd_centro <> :cd_centro) ';
var
   qryIsOrdemValida: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qryIsOrdemValida);
   
   qryIsOrdemValida.SQL.Text := Format(SQL_IS_ORDEM_VALIDA, [IntToStr(ordem)]);
   qryIsOrdemValida.ParamByName('valor_classificacao').AsString :=
      valor;
   qryIsOrdemValida.ParamByName('cd_centro_pai').AsInteger :=
      qyCentrosCustoscd_centro_pai.AsInteger;
   qryIsOrdemValida.ParamByName('cd_centro').AsInteger :=
      qyCentrosCustoscd_centro.AsInteger;
   qryIsOrdemValida.Open;

   Result := qryIsOrdemValida.FieldByName('qtd').AsInteger = 0;
end;

function Tfrm_CadCentros.isUltimoFilhoSintetico(cd_centro: Integer): Boolean;
var
   qryVerificaFilhoSintetico: TUMZQuery;
const
   SQL_ULTIMO_FILHO_SINTETICO = ' SELECT ' +
      '  count(*) AS qtd ' +
      ' FROM ' +
	   '   fin_config_centro_custos ' +
      ' WHERE ' +
	   '   tp_centro = 2 ' +
      '   AND cd_centro_pai = :cd_centro_pai';
begin
   Result := True;

   DM.CriarConsulta(qryVerificaFilhoSintetico);

   qryVerificaFilhoSintetico.SQL.Text := SQL_ULTIMO_FILHO_SINTETICO;
   qryVerificaFilhoSintetico.ParamByName('cd_centro_pai').AsInteger := cd_centro;
   qryVerificaFilhoSintetico.Open;

   if qryVerificaFilhoSintetico.FieldByName('qtd').AsInteger > 0 then
   begin
      Result := False;
   end;
end;

procedure Tfrm_CadCentros.limparRegistros(cd_centro: Integer; tabela: String);
var
   qryLimpaRegistros: TUMZQuery;

const
   SQL_LIMPAR_REGRAS = ' DELETE FROM %s WHERE cd_centro = :cd_centro ';

begin
   DM.CriarConsulta(qryLimpaRegistros);

   qryLimpaRegistros.SQL.Text := Format(SQL_LIMPAR_REGRAS, [tabela]);
   qryLimpaRegistros.ParamByName('cd_centro').AsInteger := cd_centro;
   qryLimpaRegistros.ExecSQL;
end;

function Tfrm_CadCentros.lPad(S: string; Ch: Char; Len: Integer): string;
var
   RestLen: Integer;
begin
   Result  := S;
   RestLen := Len - Length(s);

   if RestLen < 1 then Exit;
   
   Result := StringOfChar(Ch, RestLen) + S;
end;

procedure Tfrm_CadCentros.qyCentrosCustosBeforeEdit(DataSet: TDataSet);
begin
   // Alteração
   if not DM.UsuarioLogado.TemPermissao( 2029, npAlterar, True ) then Abort;
end;

procedure Tfrm_CadCentros.qyCentrosCustosBeforeInsert(DataSet: TDataSet);
begin

   // Inclusão
   if not DM.UsuarioLogado.TemPermissao( 2029, npIncluir, True ) then Abort;

   clbColigadas.Items.Clear;
   clbAreas.Items.Clear;
   clbDepartamentos.Items.Clear;
   clbCursos.Items.Clear;

end;

procedure Tfrm_CadCentros.qyCentrosCustosBeforePost(DataSet: TDataSet);
var
   sChave : string;
begin

   if qyCentrosCustoscd_centro_pai.IsNull then
   begin
      Mensagem(
         'Selecione um centro de custo pai.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      Abort;
   end;

   if (edOrdemClassificacao.Text = '') and
      (qyCentrosCustos.State in [dsEdit]) then
   begin
      Mensagem(
         'Ordem de classificação não deve estar em branco.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      edOrdemClassificacao.SetFocus;

      Abort;
   end;

   if qyCentrosCustosnr_tipo_regra.IsNull then
   begin
      Mensagem(
         'Selecione uma forma de regra.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      Abort;
   end;

   if qyCentrosCustosds_centro.AsString = '' then
   begin
      Mensagem(
         'Digite uma descrição para o centro de custo.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      Abort;
   end;

   if qyCentrosCustostp_centro.IsNull then
   begin
      Mensagem(
         'Selecione um tipo de centro.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      Abort;
   end;

   atualizaRegrasUnidadeEnsino(qyCentrosCustoscd_centro.AsInteger);
   atualizaRegrasAreas(qyCentrosCustoscd_centro.AsInteger);
   atualizaRegrasDepartamentos(qyCentrosCustoscd_centro.AsInteger);
   atualizaRegrasCursos(qyCentrosCustoscd_centro.AsInteger);

   // Salvar
   sChave := qyCentrosCustoscd_centro.AsString + ';';
   sChave := sChave + qyCentrosCustoscd_coligada_matriz.AsString;

   // Gerando LOG
   if qyCentrosCustos.State in [dsInsert] then begin
      DM.setLog(2029, 'Inclusao', sChave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo);
   end
   else begin
      DM.setLog(2029, 'Alteracao', sChave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo);
   end
end;

function Tfrm_CadCentros.procuraNoFilho(cd_centro_procurar:Integer; NodeFilho:PVirtualNode) : Boolean;
var
   NodeVerificar : PVirtualNode;
   ProximoNode : PVirtualNode;
   codigo_teste : integer;
begin

   // se tem o filho, chama recursivo
   if NodeFilho <> nil then
   begin
      NodeVerificar := vstCentros.GetFirstChild(NodeFilho);
      if NodeVerificar <> nil then
      begin
         Result := procuraNoFilho(cd_centro_procurar, NodeVerificar);

         if Result = true then
         begin
            exit;
         end;
      end;
   end;

   // vamos percorrer a grade para tentar descobrir o codigo
   while (Assigned(NodeFilho)) and (NodeFilho <> nil) do
   begin
      codigo_teste := PCentro(vstCentros.GetNodeData(NodeFilho)^).objCentro.Centro;

      if codigo_teste = cd_centro_procurar then
      begin
         vstCentros.SetFocus;
         vstCentros.FocusedNode := NodeFilho;
         Result := true;
         exit;
      end;

      // continua o laço
      // ProximoNode := vstCentros.GetNextVisible(NodeFilho, True);
      ProximoNode := vstCentros.GetNext(NodeFilho, true);
      NodeFilho := ProximoNode;
   end;

   Result := false;
   exit;

end;

end.
