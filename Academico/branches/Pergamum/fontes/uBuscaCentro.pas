unit uBuscaCentro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, VirtualTrees, StdCtrls, UMComboBox, uCentroCusto, DB,
  ZAbstractRODataset, UZDataset, uDM, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
  ZAbstractDataset, General;

type

  TResultadoBuscaCentro = record
    objCentro: TCentroCusto;
  end;

  PCentro = ^TResultadoBuscaCentro;

  PTipoCentro = ( tcAnalitico = 1, tcSintetico = 2, tcTodos = 3 );

  TfrmBuscaCentro = class(TForm)
    tlOpcoes: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    ToolButton4: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    tsSimples: TTabSheet;
    tsCustomizada: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    vstCentros: TVirtualStringTree;
    edDescCentro: TEdit;
    edCodigoCentro: TEdit;
    cbTipo: TUMComboBox;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    cbAtivo: TUMComboBox;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edDescSimples: TEdit;
    edCentroSimples: TEdit;
    cbTipoCentroSimples: TUMComboBox;
    Button3: TButton;
    Button4: TButton;
    Panel4: TPanel;
    cbAtivoSimples: TUMComboBox;
    DBGrid1: TDBGrid;
    qryCentroSimples: TUMZQuery;
    dsCentroSimples: TDataSource;
    qryCentroSimplescd_centro: TLargeintField;
    qryCentroSimplescd_classificacao: TStringField;
    qryCentroSimplesds_centro: TStringField;
    qryCentroSimplestp_centro: TSmallintField;
    qryCentroSimplesds_grupo: TStringField;
    qryCentroSimplestipo_centro: TStringField;
    qryCentroSimplessn_ativo: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edCodigoCentroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoChange(Sender: TObject);
    procedure vstCentrosNodeDblClick(Sender: TBaseVirtualTree;
      const HitInfo: THitInfo);
    procedure FormShow(Sender: TObject);
    procedure vstCentrosGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    
  strict private
    FCentros: TList;
    FTelaCriterios: Boolean;
    FTipoCentroBusca: PTipoCentro;
    bCentroAtivo : Boolean;
    FRetorno: TResultadoBuscaCentro;

    constructor CreatePrivate();

    procedure limparFilros();

    // Carrega os objetos dos centros de custos
    procedure carregaCentros();
    
    // Carrega todos os centros na Grid
    procedure carregaTodosCentros(codigoCentro: Integer; nodoPai: PVirtualNode);

    // Filtra conforme o usuário deseja
    procedure filtrar();

    // Filtra pelos tipos do centro de custo
    procedure filtrarTipos();

    // Filtra pelos centros ativos ou não
    procedure filtrarAtivos();

    // Filtra pelo código do centro de custo
    procedure filtrarCodigo();

    // Filtra somente por descrição do centro de custo
    procedure filtrarDescricao(cd_centro: Integer = 0; node: PVirtualNode = nil);

    function possuiFilhosFiltrados(cd_centro: Integer): Boolean;

    function verificaRegraFiltro(objCentro: TCentroCusto): Boolean;
    function getMensagemTipoCentro(tipoCentro: PTipoCentro): String;

  private
    class var FInstancia: TfrmBuscaCentro;
    
  public
    constructor Create(); reintroduce;

    function ShowModal(telaCriterios: Boolean = False; tipoCentroBusca: PTipoCentro = tcTodos;bCentroAtivo : Boolean = False): TResultadoBuscaCentro; reintroduce;

    class function getInstancia: TFrmBuscaCentro;
  end;

var
  frmBuscaCentro: TfrmBuscaCentro;

const
   SQL_BUSCA_CENTROS_ATIVOS =
      ' SELECT '+
      ' 	* '+
      ' FROM '+
      ' 	fin_config_centro_custos '+
      ' WHERE '+
      '  cd_coligada_matriz = :cd_coligada_matriz ';


implementation

uses
   uCadCriterios;

{$R *.dfm}

{ TfrmBuscaCentro }

procedure TfrmBuscaCentro.btnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmBuscaCentro.btnInserirClick(Sender: TObject);
begin

   if PageControl1.ActivePage = tsSimples then
   begin
      frm_CadCriterios.adicionaCentro(TCentroCusto.Create(qryCentroSimplescd_centro.AsInteger));
   end;

   if PageControl1.ActivePage = tsCustomizada then
   begin

      if Assigned(vstCentros.FocusedNode) then
      begin
         frm_CadCriterios.adicionaCentro(PCentro(vstCentros.GetNodeData(vstCentros.FocusedNode)^).objCentro);
         Self.SetFocus;
      end;
      
   end;
end;

procedure TfrmBuscaCentro.Button1Click(Sender: TObject);
begin
   filtrar;
end;

procedure TfrmBuscaCentro.Button2Click(Sender: TObject);
begin
   limparFilros;
end;

procedure TfrmBuscaCentro.Button3Click(Sender: TObject);
begin
   qryCentroSimples.Filter := ' 1=1 ';

   if edCentroSimples.Text <> '' then
   begin
      qryCentroSimples.Filter :=
         qryCentroSimples.Filter +
         ' AND cd_centro = ' +
         edCentroSimples.Text;
   end;

   if edDescSimples.Text <> '' then
   begin
      qryCentroSimples.Filter :=
         qryCentroSimples.Filter +
         ' AND ds_centro LIKE ' +
         QuotedStr('*'+edDescSimples.Text+'*');
   end;

   if cbTipoCentroSimples.ItemIndex > 0 then
   begin
      qryCentroSimples.Filter :=
         qryCentroSimples.Filter +
         ' AND tp_centro = ' +
         IntToStr(cbTipoCentroSimples.ItemIndex);
   end;

   if ( bCentroAtivo ) OR ( cbAtivoSimples.ItemIndex = 1 ) then
   begin
      qryCentroSimples.Filter :=
         qryCentroSimples.Filter +
         ' AND sn_ativo = 1';
   end;

   if cbAtivoSimples.ItemIndex = 2 then
   begin
      qryCentroSimples.Filter :=
         qryCentroSimples.Filter +
         ' AND sn_ativo = 0';
   end;

   qryCentroSimples.Filtered := True;
end;

procedure TfrmBuscaCentro.Button4Click(Sender: TObject);
begin
   edCentroSimples.Text := '';
   edDescSimples.Text := '';

   if FTipoCentroBusca = tcAnalitico then
   begin
      cbTipoCentroSimples.ItemIndex := 0;
   end;
   
   if not bCentroAtivo then
   begin
      cbAtivoSimples.ItemIndex := 0;
   end;
end;

procedure TfrmBuscaCentro.carregaCentros;
var
   qryBuscaCentros: TUMZReadOnlyQuery;
   objCentro: TCentroCusto;
begin

   if FCentros = nil then
   begin
      FCentros := TList.Create;
   end;

   FCentros.Clear;

   DM.CriarConsulta(qryBuscaCentros);

   qryBuscaCentros.SQL.Text := SQL_BUSCA_CENTROS_ATIVOS;
   qryBuscaCentros.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryBuscaCentros.open;

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

      FCentros.Add(objCentro);
      
      qryBuscaCentros.Next;
   end;
end;

procedure TfrmBuscaCentro.carregaTodosCentros(codigoCentro: Integer; nodoPai: PVirtualNode);
var
   i: Integer;
   data: PCentro;
   node: PVirtualNode;
begin

   for I := 0 to FCentros.count - 1 do
   begin

      if TCentroCusto(FCentros.Items[i]).CentroPai = codigoCentro then
      begin
         New(data);

         data.objCentro := FCentros.Items[i];

         if codigoCentro = 0 then
         begin
            node := vstCentros.InsertNode(nil, amInsertAfter, data);
         end;

         if codigoCentro <> 0 then
         begin
            node := vstCentros.InsertNode(nodoPai, amAddChildLast, data);
         end;

         carregaTodosCentros(TCentroCusto(FCentros.Items[i]).Centro, node);
      end;

   end;
end;

procedure TfrmBuscaCentro.cbTipoChange(Sender: TObject);
begin
   Filtrar;
end;

constructor TfrmBuscaCentro.Create;
begin
   raise Exception.Create('Para instanciar a classe utilize o método getInstancia!');
end;

constructor TfrmBuscaCentro.CreatePrivate;
begin
   inherited Create(nil);
end;

procedure TfrmBuscaCentro.DBGrid1DblClick(Sender: TObject);
begin

   if FTelaCriterios = True then
   begin
      btnInserirClick(Self);
   end
   else
   begin
      if (Self.FTipoCentroBusca = tcTodos) or
         (VarToStr(Self.FTipoCentroBusca) = qryCentroSimplestp_centro.AsString) then
      begin
         FRetorno.objCentro := TCentroCusto.Create(qryCentroSimplescd_centro.AsInteger);
         Close;
      end
      else
      begin
         Mensagem(
            'Selecione o tipo de centro ' + Self.getMensagemTipoCentro(Self.FTipoCentroBusca),
            'Aviso',
            MB_OK + MB_ICONWARNING
         );

         Exit;
      end;
   end;
end;

procedure TfrmBuscaCentro.edCodigoCentroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(Key in ['0'..'9', #8]) then
   begin
      key := #0;         
   end;
end;

procedure TfrmBuscaCentro.filtrarCodigo;
var
   i: Integer;
   data: PCentro;
begin
   for I := 0 to FCentros.Count - 1 do
   begin
      if TCentroCusto(FCentros.Items[i]).Centro = StrToInt(edCodigoCentro.Text) then
      begin
         New(data);
         data.objCentro := TCentroCusto(FCentros.Items[i]);
         vstCentros.InsertNode(nil, amInsertAfter, data);
         Exit;
      end;
   end;
end;

procedure TfrmBuscaCentro.filtrar;
begin

   vstCentros.Clear;

   if cbTipo.ItemIndex > 0 then
   begin
      filtrarTipos;
      Exit;
   end;

   if cbAtivo.ItemIndex > 0 then
   begin
      filtrarAtivos;
      Exit;
   end;

   if (cbTipo.ItemIndex = 0)
      and (edCodigoCentro.Text <> '') then
   begin
      filtrarCodigo;
      Exit;
   end;

   if (edCodigoCentro.Text = '') and
      (cbTipo.ItemIndex = 0) and
      (edDescCentro.Text <> '') then
   begin
      vstCentros.Clear;
      filtrarDescricao();
      Exit;
   end;

   carregaTodosCentros(0, nil);

end;

procedure TfrmBuscaCentro.filtrarAtivos;
var
   node: PVirtualNode;
   data: PCentro;
   i: Integer;
begin

   for I := 0 to FCentros.Count - 1 do
   begin
      if TCentroCusto(FCentros.Items[i]).Ativo = (cbAtivo.ItemIndex = 1) then
      begin
         if verificaRegraFiltro(TCentroCusto(FCentros.Items[i])) then
         begin
            New(data);

            data.objCentro := TCentroCusto(FCentros.Items[i]);

            vstCentros.InsertNode(nil, amInsertAfter, data);
         end;
      end;
   end;
end;

procedure TfrmBuscaCentro.filtrarDescricao(cd_centro: Integer = 0; node: PVirtualNode = nil);
var
   i: Integer;
   data: PCentro;
   pai: PVirtualNode;
begin

   pai := nil;

   for I := 0 to FCentros.Count - 1 do
   begin

      if TCentroCusto(FCentros.Items[i]).CentroPai = cd_centro then
      begin

         if possuiFilhosFiltrados(TCentroCusto(FCentros.Items[i]).Centro) or
            (Pos(edDescCentro.Text, TCentroCusto(FCentros.Items[i]).Descricao) > 0) then
         begin

            New(Data);

            data.objCentro := TCentroCusto(FCentros.Items[i]);

            if node = nil then
            begin
               pai := vstCentros.InsertNode(nil, amInsertAfter, data);
            end;

            if node <> nil then
            begin
               pai := vstCentros.InsertNode(node, amAddChildLast, data);
            end;

         end;

         filtrarDescricao(TCentroCusto(FCentros.Items[i]).Centro, pai);

      end;

   end;

end;

procedure TfrmBuscaCentro.filtrarTipos;
var
   node: PVirtualNode;
   data: PCentro;
   i: Integer;
begin
   for I := 0 to FCentros.Count - 1 do
   begin
      if TCentroCusto(FCentros.Items[i]).TipoCentro = cbTipo.ItemIndex then
      begin
         if verificaRegraFiltro(TCentroCusto(FCentros.Items[i])) then
         begin
            New(data);
            data.objCentro := TCentroCusto(FCentros.Items[i]);
            vstCentros.InsertNode(nil, amInsertAfter, data);
         end;
      end;
   end;
end;

procedure TfrmBuscaCentro.FormClose(Sender: TObject; var Action: TCloseAction);
var
   i: Integer;
begin
   if Assigned(FCentros) then
   begin
      for I := FCentros.Count - 1 downto 0 do
      begin
         FCentros.Delete(I);
      end;
   end;
   
   FreeAndNil(FCentros);
end;

procedure TfrmBuscaCentro.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) and
      (PageControl1.ActivePage = tsCustomizada) then
   begin
      Filtrar;
      Key := #0;
   end;

   if (key = #13) and
      (PageControl1.ActivePage = tsSimples) then
   begin
      Button3Click(nil);
      Key := #0;
   end;
end;

procedure TfrmBuscaCentro.FormShow(Sender: TObject);
begin
   PageControl1.ActivePage := tsSimples;

   vstCentros.Clear;
   cbTipo.ItemIndex := 0;
   cbAtivo.ItemIndex := 1;
   FRetorno.objCentro := nil;
   tlOpcoes.Visible := FTelaCriterios;

   edDescSimples.Text := '';
   edCentroSimples.Text := '';
   cbTipoCentroSimples.ItemIndex := 0;

   cbAtivoSimples.ItemIndex := 0;
   cbAtivoSimples.Enabled := true;

   if bCentroAtivo then
   begin
      cbAtivoSimples.ItemIndex := 1;
      cbAtivoSimples.Enabled := false;
   end;
   
   qryCentroSimples.Close;
   qryCentroSimples.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryCentroSimples.Open;

   Button3Click( nil );
end;

class function TfrmBuscaCentro.getInstancia: TFrmBuscaCentro;
begin
   if FInstancia = nil then
   begin
      FInstancia := TfrmBuscaCentro.CreatePrivate();
   end;

   Result := FInstancia;
end;

function TfrmBuscaCentro.getMensagemTipoCentro(tipoCentro: PTipoCentro): String;
begin
   if tipoCentro = tcAnalitico then
   begin
      Result := 'Analítico';
      Exit;
   end;

   if tipoCentro = tcSintetico then
   begin
      Result := 'Sintético';
      Exit;
   end;
end;

procedure TfrmBuscaCentro.limparFilros;
begin
   edDescCentro.Text := '';
   edCodigoCentro.Text := '';
   cbTipo.ItemIndex := 0;

   if not bCentroAtivo then
   begin
      cbAtivo.ItemIndex := 0;
   end;
end;

procedure TfrmBuscaCentro.PageControl1Change(Sender: TObject);
begin
   if PageControl1.ActivePage = tsCustomizada then
   begin
      cbAtivo.ItemIndex := 0;
      cbAtivo.Enabled := true;
      carregaCentros;
      filtrarAtivos;

      if bCentroAtivo then
      begin
         cbAtivo.ItemIndex := 1;
         cbAtivo.Enabled := false;
      end;
      Button1Click(nil);
   end;
end;

function TfrmBuscaCentro.possuiFilhosFiltrados(cd_centro: Integer): Boolean;
var
   i: Integer;
begin

   Result := False;

   for I := 0 to FCentros.Count - 1 do
   begin
      if TCentroCusto(FCentros.Items[i]).CentroPai = cd_centro then
      begin

         if Pos(edDescCentro.Text, TCentroCusto(FCentros.Items[i]).Descricao) > 0 then
         begin
            Result := True;
            Exit;
         end;

         if possuiFilhosFiltrados(TCentroCusto(FCentros.Items[i]).Centro) then
         begin
            Result := True;
            Exit;
         end;

      end;
   end;

end;

function TfrmBuscaCentro.ShowModal(telaCriterios: Boolean = False; tipoCentroBusca: PTipoCentro = tcTodos; bCentroAtivo : Boolean = False): TResultadoBuscaCentro;
begin
   Self.FTelaCriterios := telaCriterios;
   Self.FTipoCentroBusca := tipoCentroBusca;
   Self.bCentroAtivo := bCentroAtivo;

   inherited ShowModal;

   Result := FRetorno;
end;

function TfrmBuscaCentro.verificaRegraFiltro(objCentro: TCentroCusto): Boolean;
var
   descricaoCampo, descricaoAtual: String;

begin
   Result := True;

   if edCodigoCentro.Text <> '' then
   begin
      if StrToInt(edCodigoCentro.Text) <> objCentro.Centro then
      begin
         Result := False;
         Exit;
      end;
   end;

   if edDescCentro.Text <> '' then
   begin

      descricaoCampo := AnsiUpperCase(edDescCentro.Text);
      descricaoAtual := AnsiUpperCase(objCentro.Descricao);

      if Pos(descricaoCampo, descricaoAtual) = 0 then
      begin
         Result := False;
         Exit;
      end;
   end;

   if cbAtivo.ItemIndex > 0 then
   begin
      if objCentro.Ativo <> (cbAtivo.ItemIndex = 1) then
      begin
         Result := False;
         Exit;
      end;
   end;
end;

procedure TfrmBuscaCentro.vstCentrosGetText(Sender: TBaseVirtualTree;
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

procedure TfrmBuscaCentro.vstCentrosNodeDblClick(Sender: TBaseVirtualTree;
  const HitInfo: THitInfo);
var
   tp_centro_selecionado : Integer;
begin
   tp_centro_selecionado := 0;
   if Self.FTelaCriterios then
   begin

      if Assigned(vstCentros.FocusedNode) then
      begin
         frm_CadCriterios.adicionaCentro(PCentro(Sender.GetNodeData(vstCentros.FocusedNode)^).objCentro);
         Self.SetFocus;
      end;

   end;

   if not(Self.FTelaCriterios) then
   begin
      tp_centro_selecionado := PCentro(
            Sender.GetNodeData(
               vstCentros.FocusedNode
            )^
         ).objCentro.TipoCentro;
         
      if ( Self.FTipoCentroBusca = tcTodos ) OR
         ( VarToStr(Self.FTipoCentroBusca) = IntToStr(tp_centro_selecionado) )
      then
      begin
         FRetorno.objCentro := PCentro(Sender.GetNodeData(vstCentros.FocusedNode)^).objCentro;
         Self.Close;
      end
      else
      begin
         Mensagem(
            'Selecione o tipo de centro '
            + Self.getMensagemTipoCentro(Self.FTipoCentroBusca),
            'Aviso',
            MB_OK + MB_ICONWARNING
         );
         Exit;
      end;
   end;

end;

end.
