{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadCriterios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, dbcgrids, Buttons, VirtualTrees,
  uCentroCusto, uBuscaCentro;

type

   TObjCentro = record
      objCentro: TCentroCusto;
      valor: Double;
   end;
   
   PCentro = ^TObjCentro;

  Tfrm_CadCriterios = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
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
    qyCriterios: TUMZQuery;
    srcCriterios: TDataSource;
    pmQtd: TPopupMenu;
    qyCriteriosds_apropriacao: TStringField;
    qyCriteriosds_observacao: TStringField;
    qyCriteriosvl_total: TFloatField;
    qyCentros: TUMZQuery;
    srcCentros: TDataSource;
    Panel5: TPanel;
    pnCentros: TPanel;
    Panel6: TPanel;
    qyPlanoCentro: TUMZQuery;
    qyPlanoCentrods_centro: TStringField;
    qyPlanoCentrods_observacao: TMemoField;
    qyPlanoCentrocd_classificacao: TStringField;
    qyCentrosdescCentro: TStringField;
    ScrollBox1: TScrollBox;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Bevel4: TBevel;
    qyCriteriossn_rateio_matriculas: TSmallintField;
    Bevel2: TBevel;
    dbckRateioMatriculas: TDBCheckBox;
    qyCriterioscd_apropriacao: TLargeintField;
    qyCriterioscd_coligada: TIntegerField;
    qyPlanoCentrocd_centro: TLargeintField;
    qyPlanoCentrocd_grupo: TLargeintField;
    qyPlanoCentrotp_centro: TSmallintField;
    vstCentros: TVirtualStringTree;
    Panel7: TPanel;
    Button1: TButton;
    Button2: TButton;
    qyCentroscd_apropriacao: TIntegerField;
    qyCentroscd_centro: TIntegerField;
    qyCentroscd_coligada: TLargeintField;
    qyCentrosvl_apropriacao: TFloatField;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    qyCriteriosds_sigla_lancamento: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure vstCentrosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vstCentrosNewText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; NewText: WideString);
    procedure vstCentrosGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure qyCriteriosBeforeInsert(DataSet: TDataSet);
    procedure qyCriteriosBeforeEdit(DataSet: TDataSet);
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
    procedure srcCriteriosStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure srcCriteriosDataChange(Sender: TObject; Field: TField);

    Procedure AtualizaCentros;
    procedure qyCriteriosAfterInsert(DataSet: TDataSet);
    procedure qyCentrosBeforeInsert(DataSet: TDataSet);
    procedure srcCentrosStateChange(Sender: TObject);
  private
    function calculaPorcentagensGridCentros(cd_centro_pai: Integer): Double;

    procedure calculaPorcentagemTotal();

    // Carrega na grid os centros de custo de uma apropriação específica
    procedure carregaCentrosApropriacao(arrCentros: TList);

    procedure salvaGrid();

    function calculaFilhos(node: PVirtualNode): Double;

    function getNumeroFilhos(cd_centro_pai: Integer): Integer;

    // Retorna todos centros de custos de um critério de apropriação
    function getCentrosApropriacao(cd_apropriacao: Integer): TList;

    // Retorna o nodo do centro pai e caso nao tem os cria
    function getPaiCentroNodo(objCentro: TCentroCusto): PVirtualNode;

    // Retorna o valor do centro de custo relacionado ao critério que for
    // passado como parâmetro
    function getValorCentroCriterio(cd_apropriacao, cd_centro: Integer): Double;

    {REGRAS PARA ADICIONAR O CENTRO AO CRITÉRIO}

    // Esta função aplica todas regras necessários referente a inserção
    // de um centro de custo
    function verificaRegrasInserirCentro(objCentro: TCentroCusto): Boolean;

    function verificaRegraPai(cd_centro: Integer): Boolean;
    function verificaRegraFilho(cd_centro: Integer): Boolean;

    function verificaInserido(cd_centro: Integer; banco: Boolean = false): Boolean;

    {REGRAS PARA ADICIONAR O CENTRO AO CRITÉRIO}

  public
    procedure adicionaCentro(objCentro: TCentroCusto);

  end;

var
  frm_CadCriterios: Tfrm_CadCriterios;

implementation

uses Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadCriterios.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   qyCriterios.Close;
   qyCriterios.ParamByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qyCriterios.Open;
end;

function Tfrm_CadCriterios.getCentrosApropriacao(
  cd_apropriacao: Integer): TList;
var
   qryBuscaCentros: TUMZReadOnlyQuery;

const
   SQL_BUSCA_CENTROS =
      ' SELECT ' +
      ' 	cd_centro ' +
      ' FROM ' +
      ' 	fin_criterios_apropria_itens ' +
      ' WHERE ' +
      ' 	cd_apropriacao = :cd_apropriacao ' ;

begin
   Result := TList.Create;

   DM.CriarConsulta(qryBuscaCentros);

   qryBuscaCentros.SQL.Text := SQL_BUSCA_CENTROS;
   qryBuscaCentros.ParamByName('cd_apropriacao').AsInteger := cd_apropriacao;
   qryBuscaCentros.Open;

   while not qryBuscaCentros.Eof do
   begin
      Result.Add(TCentroCusto.Create(qryBuscaCentros.FieldByName('cd_centro').AsInteger));

      qryBuscaCentros.Next;
   end;
end;

function Tfrm_CadCriterios.getNumeroFilhos(cd_centro_pai: Integer): Integer;
var
   node: PVirtualNode;

   data: PCentro;

   filhos: Integer;
begin

   Result := 0;
   filhos := 0;

   node := vstCentros.GetFirst();

   while node <> nil do
   begin

      data := PCentro(vstCentros.GetNodeData(node)^);

      if data.objCentro.CentroPai = cd_centro_pai then
      begin
      
         if filhos = 0 then
         begin
            Result := Result + 1;
         end;

      end;

      node := vstCentros.GetNext(node);

   end;
end;

function Tfrm_CadCriterios.getPaiCentroNodo(objCentro: TCentroCusto): PVirtualNode;
var
   i: Integer;
   node: PVirtualNode;
   data: PCentro;
begin
   node := vstCentros.GetFirst();

   while node <> nil do
   begin
      if TCentroCusto(PCentro(vstCentros.GetNodeData(node)^).objCentro).Centro = objCentro.Centro then
      begin
         Result := node;
         Exit;
      end;

      node := vstCentros.GetNext(node);
   end;

   node := nil;

   if objCentro.CentroPai = 0 then
   begin
      New(data);

      data.objCentro := objCentro;
      data.valor := 0;
      data.objCentro.InserirBanco := False;

      node := vstCentros.InsertNode(nil, amInsertAfter, data);
   end;

   if objCentro.CentroPai <> 0 then
   begin
      New(data);

      data.objCentro := objCentro;
      data.valor := 0;
      data.objCentro.InserirBanco := False;

      node := getPaiCentroNodo(TCentroCusto.Create(objCentro.CentroPai));
      node := vstCentros.InsertNode(node, amAddChildLast, data);
   end;

   Result := Node;
end;

function Tfrm_CadCriterios.getValorCentroCriterio(cd_apropriacao, cd_centro: Integer): Double;
var
   qryValorCentro: TUMZReadOnlyQuery;

const
   SQL_VALOR_CENTRO =
      ' SELECT vl_apropriacao FROM fin_criterios_apropria_itens ' +
      ' WHERE cd_centro = :cd_centro AND cd_apropriacao = :cd_apropriacao ';

begin
   DM.CriarConsulta(qryValorCentro);

   qryValorCentro.SQL.Text := SQL_VALOR_CENTRO;
   qryValorCentro.ParamByName('cd_apropriacao').AsInteger := cd_apropriacao;
   qryValorCentro.ParamByName('cd_centro').AsInteger := cd_centro;
   qryValorCentro.Open;

   Result := qryValorCentro.FieldByName('vl_apropriacao').AsFloat;
end;

procedure Tfrm_CadCriterios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadCriterios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 :
         if not(vstCentros.Focused) then
         begin
            btnInserirClick( nil );
         end;
      VK_F3 : btnAlterarClick( nil );
      VK_F5 : btnSalvarClick( nil );
      VK_F9 : btnExcluirClick( nil );
      VK_F6 : btnCancelarClick( nil );
      VK_F12 : btnSairClick( nil );
   end;
end;

procedure Tfrm_CadCriterios.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_CadCriterios.btnExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 2030, npExcluir, True ) then Abort;

  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     DM.qyAux1.Close;
     DM.qyAux1.SQL.Clear;
     DM.qyAux1.SQL.Add('DELETE FROM fin_criterios_apropria_itens WHERE cd_apropriacao = :cd_apropriacao AND cd_coligada = :cd_coligada');
     DM.qyAux1.ParamByName('cd_apropriacao').AsInteger := qyCriterios.FieldByName('cd_apropriacao').AsInteger;
     DM.qyAux1.ParamByName('cd_coligada').AsInteger := qyCriterios.FieldByName('cd_coligada').AsInteger;
     DM.qyAux1.ExecSQL;

     DM.gerar_log_acesso(2103, 'N', 'N', 'N', 'S');
     qyCriterios.Delete;
  end;
end;

procedure Tfrm_CadCriterios.btnFecharClick(Sender: TObject);
begin
   qyCriterios.Close;
   qyCriterios.Open;
   Close;
end;

procedure Tfrm_CadCriterios.btnInserirClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   qyCriterios.Insert;
end;

function Tfrm_CadCriterios.calculaFilhos(node: PVirtualNode): Double;
var
   numeroFilhos,
   i: Integer;

   valores: TStringList;

   total: Double;

   data,
   dataFilho: PCentro;

begin

   data := PCentro(vstCentros.GetNodeData(node)^);

   valores := TStringList.Create;

   numeroFilhos := getNumeroFilhos(data.objCentro.Centro);

   total := 0;

   for I := 0 to numeroFilhos do
   begin

      if i = (numeroFilhos - 1) then
      begin
         valores.Add(FloatToStr(RoundFloat(data.valor - total, 2)));
      end;

      if i < (numeroFilhos -1) then
      begin
         valores.Add(FloatToStr(RoundFloat(data.valor/numeroFilhos, 2)));

         total := total + RoundFloat(data.valor/numeroFilhos, 2);
      end;

   end;

   node := vstCentros.GetFirst();

   i := 0;

   while node <> nil do
   begin

      dataFilho := PCentro(vstCentros.GetNodeData(node)^);

      if (dataFilho.objCentro.CentroPai = data.objCentro.Centro) then
      begin

         dataFilho.valor := StrToFloat(valores.Strings[i]);

         if getNumeroFilhos(dataFilho.objCentro.Centro) > 0 then
         begin
            calculaFilhos(node);               
         end;

         Inc(i);

      end;

      node := vstCentros.GetNext(node);

   end;
end;

procedure Tfrm_CadCriterios.calculaPorcentagemTotal;
var
   node: PVirtualNode;

   data: PCentro;

   total: Double;
begin

   total := 0;

   node := vstCentros.GetFirst();

   while node <> nil do
   begin

      data := PCentro(vstCentros.GetNodeData(node)^);

      if data.objCentro.CentroPai = 0 then
      begin

         total := total + data.valor;         

      end;

      node := vstCentros.GetNext(node);

   end;

   qyCriteriosvl_total.AsFloat := total;
end;

function Tfrm_CadCriterios.calculaPorcentagensGridCentros(cd_centro_pai: Integer): Double;
var
   node: PVirtualNode;
   data: PCentro;
begin

   node := vstCentros.GetFirst();

   Result := 0;

   while node <> nil do
   begin

      data := PCentro(vstCentros.GetNodeData(node)^);

      if data.objCentro.CentroPai = cd_centro_pai then
      begin
      
         if (data.objCentro.TipoCentro = 2) and (getNumeroFilhos(data.objCentro.Centro) > 0) then
         begin
            data.valor := calculaPorcentagensGridCentros(data.objCentro.Centro);
         end;

         Result := Result + data.valor;
      end;

      node := vstCentros.GetNext(node);
   end;
end;

procedure Tfrm_CadCriterios.btnAlterarClick(Sender: TObject);
begin
   qyCriterios.Edit;
end;

procedure Tfrm_CadCriterios.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
  total : Currency;
  LSAnoSemestre: string;
begin

   if DBEdit4.Text = 'ESP' then
   begin
      Mensagem(
         'A sigla ESP é reservada pelo sistema para definir lançamentos específicos',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );
      Exit;
   end;

//   if qyCriteriosvl_total.AsFloat > 100 then
//   begin
//      Mensagem(
//         'A porcentagem final do critério de aproprição não pode ser maior que 100%',
//         'Aviso',
//         MB_ICONWARNING + MB_OK,
//         Handle
//      );
//      Exit;
//   end;

   if qyCentros.State = dsEdit then
   begin
      qyCentros.Post;
   end;

   reg := qyCriterios.FieldByName('cd_apropriacao').AsInteger;
   { Gerando LOG de acesso }
   if qyCriterios.State in [dsInsert] then
      DM.gerar_log_acesso(2103, 'N', 'S', 'N', 'N')
   else
      DM.gerar_log_acesso(2103, 'N', 'N', 'S', 'N');

   AtualizaCentros;

   if dbckRateioMatriculas.Checked then
   begin
      DM.DefineRateioApropriacaoPorMatriculas(
         qyCriterioscd_apropriacao.AsInteger, DM.GetAnoSemestreAtual);
   end;

   salvaGrid;
   qyCriterios.Post;
   qyCriterios.Close;
   qyCriterios.Open;
   qyCriterios.Locate('cd_apropriacao', reg, []);
end;

procedure Tfrm_CadCriterios.Button1Click(Sender: TObject);
begin
   qyCriterios.Edit;

   TfrmBuscaCentro.getInstancia.ShowModal(True);
end;

procedure Tfrm_CadCriterios.Button2Click(Sender: TObject);
var
   node: PVirtualNode;
begin

   node := vstCentros.GetFirst();

   while node <> nil do
   begin

      if vsSelected in node.States then
      begin
         vstCentros.DeleteNode(node);
      end;

      node := vstCentros.GetNext(node);

   end;

   calculaPorcentagensGridCentros(0);
   vstCentros.SetFocus;
   calculaPorcentagemTotal;
end;

procedure Tfrm_CadCriterios.carregaCentrosApropriacao(arrCentros: TList);
var
   i: Integer;
   node: PVirtualNode;
   data: PCentro;
begin
   for i := 0 to arrCentros.Count - 1 do
   begin

      New(data);

      data.objCentro := TCentroCusto(arrCentros.Items[i]);
      data.objCentro.InserirBanco := True;

      data.valor := getValorCentroCriterio(
         qyCriterioscd_apropriacao.AsInteger,
         data.objCentro.Centro
      );

      node := nil;

      if TCentroCusto(arrCentros.Items[i]).CentroPai <> 0 then
      begin

         node := getPaiCentroNodo(TCentroCusto.Create(TCentroCusto(arrCentros.Items[i]).CentroPai));

      end;
      
      vstCentros.InsertNode(node, amAddChildLast, data);
   end;
end;

procedure Tfrm_CadCriterios.btnCancelarClick(Sender: TObject);
begin
   qyCriterios.Cancel;
end;

procedure Tfrm_CadCriterios.srcCriteriosStateChange(Sender: TObject);
begin
    pnCentros.Visible := not (qyCriterios.State in [dsInsert]);

    btnInserir.Enabled := (not (qyCriterios.State in [dsInsert, dsEdit]));
    btnAlterar.Enabled := (not (qyCriterios.State in [dsInsert, dsEdit]));
    btnExcluir.Enabled := (not (qyCriterios.State in [dsInsert, dsEdit]));
    btnSalvar.Enabled := (qyCriterios.State in [dsInsert, dsEdit]);
    btnCancelar.Enabled := qyCriterios.State in [dsInsert, dsEdit];
    btnFechar.Enabled := (not (qyCriterios.State in [dsInsert, dsEdit]));

    grd.Enabled := (not (qyCriterios.State in [dsInsert, dsEdit]));
end;

function Tfrm_CadCriterios.verificaInserido(cd_centro: Integer; banco: Boolean): Boolean;
var
   data: PCentro;
   node: PVirtualNode;
begin

   Result := False;

   node := vstCentros.GetFirst();

   while node <> nil do
   begin

      data := PCentro(vstCentros.GetNodeData(node)^);

      if data.objCentro.Centro = cd_centro then
      begin

         if banco then
         begin
            Result := data.objCentro.InserirBanco;
         end;

         if not(banco) then
         begin
            Result := True;
         end;

         Exit;
         
      end;

      node := vstCentros.GetNext(node);

   end;

end;

function Tfrm_CadCriterios.verificaRegraFilho(cd_centro: Integer): Boolean;
var
   qryBuscaInfoCentro: TUMZReadOnlyQuery;

   objetoInserido: Boolean;
   
const

   SQL_BUSCA_INFO_CENTRO =
      ' SELECT '+
      ' 	cd_centro '+
      ' FROM '+
      ' 	fin_config_centro_custos '+
      ' WHERE '+
      ' 	cd_centro_pai = :cd_centro ';

begin

   Result := True;

   DM.CriarConsulta(qryBuscaInfoCentro);

   qryBuscaInfoCentro.SQL.Text := SQL_BUSCA_INFO_CENTRO;
   qryBuscaInfoCentro.ParamByName('cd_centro').AsInteger := cd_centro;

   qryBuscaInfoCentro.Open;

   while not(qryBuscaInfoCentro.Eof) do
   begin

      objetoInserido := verificaInserido(qryBuscaInfoCentro.FieldByName('cd_centro').AsInteger, true);

      if objetoInserido then
      begin
         Result := False;
         Exit;
      end;

      if not(objetoInserido) then
      begin
         Result := verificaRegraFilho(qryBuscaInfoCentro.FieldByName('cd_centro').AsInteger);

         if not(Result) then
         begin
            Exit;
         end;

      end;

      qryBuscaInfoCentro.Next;
   end;
end;

function Tfrm_CadCriterios.verificaRegraPai(cd_centro: Integer): Boolean;
var
   qryBuscaInfoCentro: TUMZReadOnlyQuery;

   objetoInserido: Boolean;

const
   SQL_BUSCA_INFO_CENTRO =
      ' SELECT '+
      '  cd_centro, '+
      ' 	cd_centro_pai '+
      ' FROM '+
      ' 	fin_config_centro_custos '+
      ' WHERE '+
      ' 	cd_centro = :cd_centro ';

begin

   Result := True;

   DM.CriarConsulta(qryBuscaInfoCentro);

   qryBuscaInfoCentro.SQL.Text := SQL_BUSCA_INFO_CENTRO;

   qryBuscaInfoCentro.ParamByName('cd_centro').AsInteger := cd_centro;
   qryBuscaInfoCentro.Open;

   if qryBuscaInfoCentro.RecordCount > 0 then
   begin

      objetoInserido := verificaInserido(qryBuscaInfoCentro.FieldByName('cd_centro').AsInteger, true);

      if objetoInserido then
      begin

         Result := False;
         Exit;
         
      end;

      if not(objetoInserido) then
      begin

         Result := verificaRegraPai(qryBuscaInfoCentro.FieldByName('cd_centro_pai').AsInteger);

         if not(Result) then
         begin
            Exit;
         end;

      end;

   end;
end;

function Tfrm_CadCriterios.verificaRegrasInserirCentro(
  objCentro: TCentroCusto): Boolean;
begin

   Result := True;

   if not(verificaRegraPai(objCentro.CentroPai)) then
   begin
      Mensagem(
         'Este centro de custo possui um centro de custo de nível hierarquico superior, ja inserido.',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );

      Result := False;

      Exit;
   end;

   if not(verificaRegraFilho(objCentro.Centro)) then
   begin
      Mensagem(
         'Este centro de custo possui um centro de custo de nível hierarquico inferior, ja inserido.',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );

      Result := False;

      Exit;
   end;
   
end;

procedure Tfrm_CadCriterios.vstCentrosClick(Sender: TObject);
begin
   qyCriterios.Edit;
end;

procedure Tfrm_CadCriterios.vstCentrosGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
   data: PCentro;
begin
   data := PCentro(Sender.GetNodeData(Node)^);

   case Column of
      0: CellText := '';
      1: CellText := data.objCentro.Descricao;
      2: CellText := data.objCentro.Classificacao;
      3: CellText := FloatToStr(data.valor);
   end;
end;

procedure Tfrm_CadCriterios.vstCentrosNewText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; NewText: WideString);
var
   porcentagem: Double;
   data: PCentro;
begin

   if Column <> 3 then
   begin
      Exit;
   end; 

   data := PCentro(vstCentros.GetNodeData(node)^);

   try
      porcentagem := RoundFloat(StrToFloat(NewText), 2);
   except
      Mensagem(
         'Valor inválido, digite um valor número',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
      Exit;
   end;

//   if (porcentagem < 0) or (porcentagem > 100) then
//   begin
//      Mensagem(
//         'O valor digitado deve ser entre 0 e 100',
//         'Aviso',
//         MB_ICONEXCLAMATION + MB_OK,
//         Handle
//      );
//      Exit;
//   end;

   data.valor := porcentagem;

   calculaFilhos(node);

   calculaPorcentagensGridCentros(0);

   calculaPorcentagemTotal;
end;

procedure Tfrm_CadCriterios.pmQtdPopup(Sender: TObject);
begin
   DM.quantidade_registros(qyCriterios, pmQtd);
end;

procedure Tfrm_CadCriterios.srcCriteriosDataChange(Sender: TObject;
  Field: TField);
begin

   if not(qyCriterios.State in [dsEdit, dsInsert]) then
   begin
      vstCentros.Clear;
      carregaCentrosApropriacao(getCentrosApropriacao(qyCriterios.FieldByName('cd_apropriacao').AsInteger));
      calculaPorcentagensGridCentros(0);
   end;

   if not (qyCriterios.State = dsEdit) then
   Begin
      qyCentros.Close;
      qyCentros.ParamByName('cd_apropriacao').AsInteger := qyCriterios.FieldByName('cd_apropriacao').AsInteger;
      qyCentros.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
      qyCentros.Open;
   End;
end;

procedure Tfrm_CadCriterios.adicionaCentro(objCentro: TCentroCusto);
var
   selecionado: TList;
begin
   if (objCentro <> nil) then
   begin

      selecionado := TList.Create;

      if verificaInserido(objCentro.Centro) then
      begin
         Mensagem(
            'Este centro de custo já está inserido.',
            'Aviso',
            MB_ICONEXCLAMATION + MB_OK,
            0
         );

         TfrmBuscaCentro.getInstancia.SetFocus;

         Exit;
      end;

      if verificaRegrasInserirCentro(objCentro) then
      begin

         objCentro.InserirBanco := True;

         selecionado.Add(objCentro);

         carregaCentrosApropriacao(selecionado);

      end;

   end;
end;

Procedure Tfrm_CadCriterios.AtualizaCentros;
begin

   { Criando a ligação com os Centros de Custos }
   DM.qyAux2.Close;
   DM.qyAux2.SQL.Clear;
   DM.qyAux2.SQL.Add('INSERT IGNORE INTO fin_criterios_apropria_itens (cd_apropriacao, cd_centro, cd_coligada, vl_apropriacao) ');
   DM.qyAux2.SQL.Add('SELECT :cd_apropriacao, pcc.cd_centro, :cd_coligada, 0 ');
   DM.qyAux2.SQL.Add('FROM                                                                                             ');
   DM.qyAux2.SQL.Add('	fin_centro_custos pcc                                                                         ');
   DM.qyAux2.SQL.Add('	LEFT JOIN fin_criterios_apropria_itens a ON (a.cd_coligada = pcc.cd_coligada AND a.cd_centro = pcc.cd_centro AND a.cd_apropriacao = :cd_apropriacao)');
   DM.qyAux2.SQL.Add('WHERE                                                                                            ');
   DM.qyAux2.SQL.Add('	pcc.tp_centro = 1 AND a.cd_apropriacao is null  AND pcc.cd_coligada = :cd_coligada              ');
   DM.qyAux2.ParamByName('cd_apropriacao').AsInteger := qyCriterios.FieldByName('cd_apropriacao').AsInteger;
   DM.qyAux2.ParamByName('cd_coligada').AsInteger := qyCriterios.FieldByName('cd_coligada').AsInteger;
   DM.qyAux2.ExecSQL();
   
   qyCentros.Close;
   qyCentros.ParamByName('cd_apropriacao').AsInteger := qyCriterios.FieldByName('cd_apropriacao').AsInteger;
   qyCentros.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyCentros.Open;
   { / Criando a ligação com os Centros de Custos }

end;

procedure Tfrm_CadCriterios.qyCriteriosAfterInsert(DataSet: TDataSet);
begin

  qyCriterios.FieldByName('cd_apropriacao').AsInteger := DM.ProximoId('cd_apropriacao','fin_criterios_apropria');
  qyCriterios.FieldByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

end;

procedure Tfrm_CadCriterios.qyCentrosBeforeInsert(DataSet: TDataSet);
begin
//   Abort;
end;

procedure Tfrm_CadCriterios.salvaGrid;
var
   node: PVirtualNode;
   
   data: PCentro;

   qryCentros: TUMZQuery;

   centros,
   separador: String;
const
   SQL_DELETE_CENTROS =
      ' DELETE '+
      ' FROM '+
      '  fin_criterios_apropria_itens '+
      ' WHERE '+
      '  cd_apropriacao = :cd_apropriacao ';

   SQL_INSERE_CENTROS =
      ' INSERT INTO fin_criterios_apropria_itens ( '+
      ' 	cd_apropriacao, '+
      ' 	cd_centro, '+
      ' 	cd_coligada, '+
      ' 	vl_apropriacao '+
      ' ) '+
      ' VALUES '+
      '  %s ';

begin

   DM.CriarConsulta(qryCentros);

   qryCentros.SQL.Text := SQL_DELETE_CENTROS;
   qryCentros.ParamByName('cd_apropriacao').AsInteger :=
      qyCriterioscd_apropriacao.AsInteger;

   qryCentros.ExecSQL;

   node := vstCentros.GetFirst();

   Centros := '';

   while node <> nil do
   begin

      data := PCentro(vstCentros.GetNodeData(node)^);

      if data.objCentro.InserirBanco then
      begin
         Centros :=
            Centros +
            separador +
            ' ( '+
            qyCriterioscd_apropriacao.AsString +
            ' , '+
            IntToStr(data.objCentro.Centro)+
            ' , '+
            IntToStr(data.objCentro.ColigadaMatriz)+
            ' , '+
            StringReplace(QuotedStr(FloatToStr(data.valor)), ',', '.', [rfReplaceAll, rfIgnoreCase])+
            ' ) ';

         separador := ', ';   
      end;

      node := vstCentros.GetNext(node);

   end;

   if centros <> '' then
   begin
      qryCentros.SQL.Text := Format(SQL_INSERE_CENTROS, [Centros]);
      qryCentros.ExecSQL;
   end;
end;

procedure Tfrm_CadCriterios.srcCentrosStateChange(Sender: TObject);
begin
   if qyCentros.State = dsEdit then
      qyCriterios.Edit;
end;

procedure Tfrm_CadCriterios.qyCriteriosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2030, npAlterar, True ) then Abort;
end;

procedure Tfrm_CadCriterios.qyCriteriosBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2030, npIncluir, True ) then Abort;
   
   vstCentros.Clear;
end;

end.

