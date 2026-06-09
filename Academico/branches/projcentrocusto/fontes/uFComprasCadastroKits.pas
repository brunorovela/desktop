unit uFComprasCadastroKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, ExtCtrls, ImgList,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, DB, Grids,
  DBGrids, UMEditMonetario, UMLookupComboBox;

type
  TformCadKits = class(TForm)
    ImageList1: TImageList;
    Panel3: TPanel;
    Panel4: TPanel;
    qyCodBarra: TUMZQuery;
    qyCodBarracd_kit: TIntegerField;
    dsCodBarra: TDataSource;
    dsKits: TDataSource;
    qyKits: TUMZQuery;
    qyKitscd_kit: TIntegerField;
    qyKitsnm_kit: TStringField;
    qyKitsme_observacao: TMemoField;
    ImageList2: TImageList;
    PageControl: TPageControl;
    tbKits: TTabSheet;
    PnCadastra: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    edCodigo: TDBEdit;
    edCodBarra: TDBEdit;
    edNome: TDBEdit;
    DBMemo1: TDBMemo;
    PnLista: TPanel;
    Panel2: TPanel;
    grdKits: TDBGrid;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    TbTurmas: TTabSheet;
    Panel5: TPanel;
    pnProdutos: TPanel;
    Panel7: TPanel;
    grdKitsProdutos: TDBGrid;
    qyKitsTurmas: TUMZQuery;
    dsKitsTurmas: TDataSource;
    qyKitsTurmascd_anosemestre: TSmallintField;
    qyKitsTurmasnr_etapa: TSmallintField;
    qyKitsTurmasdescricao: TStringField;
    qyKitsTurmascd_turma: TStringField;
    ImageList3: TImageList;
    qyKitsProdutos: TUMZQuery;
    qyKitsProdutosDS_PRODUTO: TStringField;
    qyKitsProdutosnr_quantidade: TSmallintField;
    dsKitsProdutos: TDataSource;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    qyKitsProdutoscd_produto: TStringField;
    Label4: TLabel;
    pnTurmas: TPanel;
    Panel6: TPanel;
    grdKitsTurmas: TDBGrid;
    ToolBar1: TToolBar;
    btnAddCurso: TToolButton;
    btnAddTurma: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    qyCodBarracd_codigo_barras: TStringField;
    edValor: TUMEditMonetario;
    Label5: TLabel;
    qyCategorias: TUMZReadOnlyQuery;
    qyCategoriascd_categoria: TIntegerField;
    qyCategoriasds_categoria: TStringField;
    qyKitsds_categoria: TStringField;
    cbCategoria: TUMLookupComboBox;
    qyKitscd_categoria: TIntegerField;
    qyCategoriascd_coligada: TSmallintField;
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure grdKitsProdutosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grdKitsProdutosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnAddTurmaClick(Sender: TObject);
    procedure btnAddCursoClick(Sender: TObject);
    procedure dsKitsDataChange(Sender: TObject; Field: TField);
    procedure edCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure dsKitsStateChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

    procedure abreQueryCodigoBarra();
    procedure abreQueryTurmas();
    procedure abreQueryProdutos();
    procedure setaValorKit();
    procedure realizaExpressaoRegular(Sender : TObject);
    procedure montaLog(acao: integer);
    procedure montaLogProdutos(acao:integer;cd_produto,quantidade: string);
    procedure montaLogTurmas(acao,cd_kit,nr_anosemestre: integer;cd_turma,nr_etapa:String);
    procedure gravalog(cd_kit,operacao:integer;observacao:String);

    function isCodigoBarraExiste( const cd_cod_barra: String ): Boolean;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  formCadKits: TformCadKits;

implementation

uses Main, uDM, General, uFSelecionarCurso, uFSelecionarTurma, uTableFields;

{$R *.dfm}

procedure TformCadKits.abreQueryCodigoBarra;
begin
   qyCodBarra.Close;
   qyCodBarra.ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
   qyCodBarra.Open;
end;

procedure TformCadKits.abreQueryProdutos;
begin
   qyKitsProdutos.Close;
   qyKitsProdutos.ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
   qyKitsProdutos.Open;
end;

procedure TformCadKits.abreQueryTurmas;
begin
   qyKitsTurmas.Close;
   qyKitsTurmas.ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
   qyKitsTurmas.Open;
end;

{ Adiciona o kit para todas as turmas de um curso }
procedure TformCadKits.btnAddCursoClick(Sender: TObject);
var
   qyInsereKitsTurmas: TUMZQuery;
   qryBuscaTurmas     : TUMZQuery;
   resultado_filtro : TResultadoFiltroCurso;
begin
   DM.CriarConsulta(qyInsereKitsTurmas);
   DM.CriarConsulta(qryBuscaTurmas);

   qyInsereKitsTurmas.SQL.Clear();
   qyInsereKitsTurmas.SQL.Add(' INSERT INTO comp_kits_turmas ( CD_KIT, CD_TURMA, CD_ANOSEMESTRE, NR_ETAPA )');
   qyInsereKitsTurmas.SQL.Add(' VALUES ( :CD_KIT, :CD_TURMA, :CD_ANOSEMESTRE, :NR_ETAPA )');


   qryBuscaTurmas.SQL.Add('   SELECT :CD_KIT as CD_KIT, CODIGO, serie as ETAPA FROM turmas');
   qryBuscaTurmas.SQL.Add('   WHERE curso = :CD_CURSO AND cd_coligada = :CD_COLIGADA AND anosemestre = :ANOSEMESTRE ');


   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1);

   if resultado_filtro.filtrado then
   Begin
      qryBuscaTurmas.ParamByName('CD_KIT').AsInteger := qyKitscd_kit.AsInteger;
      qryBuscaTurmas.ParamByName('CD_COLIGADA').AsInteger := resultado_filtro.cd_coligada;
      qryBuscaTurmas.ParamByName('CD_CURSO').AsString := resultado_filtro.cd_curso;
      qryBuscaTurmas.ParamByName('ANOSEMESTRE').AsInteger := resultado_filtro.nr_anosemestre;

      qryBuscaTurmas.open;

      while not qryBuscaTurmas.Eof do
      begin
         qyInsereKitsTurmas.ParamByName('CD_KIT').AsInteger         := qryBuscaTurmas.FieldByName('CD_KIT').AsInteger;
         qyInsereKitsTurmas.ParamByName('CD_TURMA').AsString        := qryBuscaTurmas.FieldByName('CODIGO').AsString;
         qyInsereKitsTurmas.ParamByName('CD_ANOSEMESTRE').AsInteger  := resultado_filtro.nr_anosemestre;
         qyInsereKitsTurmas.ParamByName('NR_ETAPA').AsString        := qryBuscaTurmas.FieldByName('ETAPA').AsString;

         montaLogTurmas(2,qryBuscaTurmas.FieldByName('CD_KIT').AsInteger,resultado_filtro.nr_anosemestre,qryBuscaTurmas.FieldByName('CODIGO').AsString,qryBuscaTurmas.FieldByName('ETAPA').AsString);

         try
            qyInsereKitsTurmas.ExecSQL;
         except on E: Exception do
         end;
         qryBuscaTurmas.Next;
      end;

      abreQueryTurmas;
   end;
end;

{ Adiciona o kit para uma turma }
procedure TformCadKits.btnAddTurmaClick(Sender: TObject);
var
   qyInsereKitsTurmas: TUMZQuery;
   resultado_filtro : TResultadoFiltroTurma;
begin
   DM.CriarConsulta(qyInsereKitsTurmas);

   qyInsereKitsTurmas.SQL.Clear();
   qyInsereKitsTurmas.SQL.Add(' INSERT INTO comp_kits_turmas ( CD_KIT, CD_TURMA, CD_ANOSEMESTRE, NR_ETAPA )');
   qyInsereKitsTurmas.SQL.Add(' VALUES ( :CD_KIT, :CD_TURMA, :CD_ANOSEMESTRE, :NR_ETAPA )');

   resultado_filtro := TfrmSelecionarTurma.Filtrar([], -1, -1);

   if resultado_filtro.filtrado then
   Begin
      qyInsereKitsTurmas.ParamByName('CD_KIT').AsInteger         := qyKitscd_kit.AsInteger;
      qyInsereKitsTurmas.ParamByName('CD_TURMA').AsString        := resultado_filtro.cd_turma;
      qyInsereKitsTurmas.ParamByName('CD_ANOSEMESTRE').AsInteger := resultado_filtro.nr_anosemestre;
      qyInsereKitsTurmas.ParamByName('NR_ETAPA').AsInteger        := resultado_filtro.nr_serie;

      montaLogTurmas(2,qyKitscd_kit.AsInteger,resultado_filtro.nr_anosemestre,resultado_filtro.cd_turma,inttostr(resultado_filtro.nr_serie));
      
      try
         qyInsereKitsTurmas.ExecSQL;
      except on E: Exception do
      end;
      
      abreQueryTurmas;
   end;
end;

procedure TformCadKits.btnAlterarClick(Sender: TObject);
begin
   edCodBarra.SetFocus;
   qyCodBarra.Edit;
   qyKits.Edit;
end;

procedure TformCadKits.btnCancelarClick(Sender: TObject);
begin
   qyKits.Cancel;
   qyCodBarra.Cancel;
end;

procedure TformCadKits.btnExcluirClick(Sender: TObject);
var
   qyDeletaKit : TUMZQuery;
begin
   if (Mensagem( 'Deseja realmente excluir o Kit? Todos os seus dependentes também serão apagados.', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle ) = MrNo) then
   begin
      exit;
   end;

   { Tenta excluir um kit e todos os seus dependentes }
   try
      qyCodBarra.Edit;
      qyCodBarra.FieldByName('cd_kit').AsInteger := qyKitscd_kit.AsInteger;
      qyCodBarra.Delete();

      Dm.CriarConsulta(qyDeletaKit);
      qyDeletaKit.SQL.Add('DELETE from comp_kits_turmas where cd_kit = :cd_kit');
      qyDeletaKit.ParamByName('cd_kit').AsInteger := qyKitscd_kit.AsInteger;

      qyDeletaKit.ExecSQL;
      qyDeletaKit.Close;
      qyDeletaKit.SQL.Clear;

      qyDeletaKit.SQL.Add('DELETE from comp_kits_itens where cd_kit = :cd_kit');
      qyDeletaKit.ParamByName('cd_kit').AsInteger := qyKitscd_kit.AsInteger;
      qyDeletaKit.ExecSQL;

      FreeAndNil(qyDeletaKit);

      montaLog(1);
      qyKits.Delete;
   Except on E:Exception do
   begin
      Mensagem('Não foi possivel excluir o kit. Verifique se existem cadastros que dependem deste kit.')
   end;

   end;
end;

procedure TformCadKits.btnIncluirClick(Sender: TObject);
begin
   edCodBarra.SetFocus;
   qyCodBarra.Insert;
   qyKits.Insert;
   edValor.Text := '';
end;

procedure TformCadKits.btnSairClick(Sender: TObject);
begin
   close;
end;

procedure TformCadKits.btnSalvarClick(Sender: TObject);
begin
   edNome.SetFocus;
   
   if (edNome.Text = '') then
   begin
      Mensagem( 'O nome deve ser preenchido.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      Exit;
   end;

   if (edCodBarra.Text = '') then
   begin
      Mensagem( 'O código de barras deve ser preenchido.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      edCodBarra.SetFocus;
      Exit;
   end;

   if (cbCategoria.Text = '') then
   begin
      Mensagem( 'O tipo de titulo deve ser preenchido.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      cbCategoria.SetFocus;
      Exit;
   end;

   if (isCodigoBarraExiste( qyCodBarracd_codigo_barras.AsString )) then
   begin
      Mensagem( 'O código de barras preenchido já existe.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      edCodBarra.SetFocus;
      Exit;
   end;

   montaLog(0);

   qyKits.Post;

   if ( qyCodBarra.State IN [dsInsert,dsEdit] ) then
   begin
      qyCodBarra.FieldByName('cd_kit').AsString := qyKitscd_kit.AsString;
      qyCodBarra.Post();
   end;

end;

procedure TformCadKits.dsKitsDataChange(Sender: TObject; Field: TField);
begin
   if (qyKits.State = dsBrowse) then
   begin
      abreQueryTurmas;
      abreQueryProdutos;
      setaValorKit;
      
      { Tratamento para que não interfira no POST do código de barras}
      if not (qyCodBarra.State in [dsInsert,dsEdit]) then
      begin
         abreQueryCodigoBarra;
      end;
   end;
end;

procedure TformCadKits.dsKitsStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not (qyKits.State IN [ dsInsert, dsEdit ]);
   btnAlterar.Enabled := not (qyKits.State IN [ dsInsert, dsEdit ]);
   btnExcluir.Enabled := not (qyKits.State IN [ dsInsert, dsEdit ]);

   btnCancelar.Enabled := qyKits.State IN [ dsInsert, dsEdit ];
   btnSalvar.Enabled := qyKits.State IN [ dsInsert, dsEdit ];
end;

procedure TformCadKits.edCodBarraKeyPress(Sender: TObject; var Key: Char);
begin
   if not (qyKits.State in [dsEdit,dsInsert]) then
   begin
      qyKits.Edit;
      qyCodBarra.Edit;
   end;

   { Tratamento para quando for um leitor e der o enter pular pro proximo campo }
   if ( Key = #13 ) then
   begin
      edNome.SetFocus;
   end;
end;

procedure TformCadKits.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TformCadKits.FormShow(Sender: TObject);
begin
   qyKits.Close;
   qyKits.Open;
end;


procedure TformCadKits.montaLog(acao: integer);
const
   SQL_MAX_KIT =
      'SELECT max(cd_kit) as cont from comp_kits';
var
   qyMaxKit : TUMZQuery;
   observacao : string;
   cd_kit,operacao : integer;
begin
   DM.CriarConsulta( qyMaxKit );

   cd_kit := qyKitscd_kit.AsInteger;
   if ((qyKits.State = dsInsert) or (acao = 1)) then
   begin
      if(acao <> 1) then
      begin
         qyMaxKit.SQL.Text := SQL_MAX_KIT;
         qyMaxKit.Open;
         cd_kit := (qyMaxKit.FieldByName('cont').AsInteger+1);

         operacao := 2;
         observacao := 'Cadastro de kit, dados:';
      end else begin
         operacao := 4;
         observacao := ' Exclusão do kit : ' + inttostr(cd_kit);
      end;

      observacao :=  observacao +
                     ' Código: ' + inttostr(cd_kit) +
                     ' , Descrição: ' + qyKitsnm_kit.AsString +
                     ' , Categoria: ' + qyKitsds_categoria.AsString +
                     ' , Observação: ' + qyKitsme_observacao.AsString;
                     
      if ( qyCodBarra.State IN [dsInsert] ) then
      begin
         observacao :=  observacao + ' ,Cód. de barra : ' + qyCodBarracd_codigo_barras.AsString;
      end;

   end else if (acao = 0) then
   begin
      operacao := 3;
      observacao := 'Edição de kits, dados alterados:';

      if (qyKitsnm_kit.AsString <> qyKitsnm_kit.OldValue) then
      begin
         observacao := observacao + ' Descrição do kit, de ' + qyKitsnm_kit.OldValue + ' para ' +  qyKitsnm_kit.AsString + ' ; ';
      end;

      observacao := observacao + ' Categoria, de ' + qyCategoriasds_categoria.OldValue + ' para ' +   qyCategoriasds_categoria.AsString + ' ; ';

      if (qyKitsme_observacao.AsString <> qyKitsme_observacao.OldValue) then
      begin
         observacao := observacao + ' Observação, de ' + qyKitsme_observacao.OldValue + ' para ' +  qyKitsme_observacao.AsString + ' ; ';
      end;

      if ( qyCodBarra.State = dsInsert ) then
      begin
         observacao := observacao + ' Cód. de barra incluido, valor: ' +  qyCodBarracd_codigo_barras.AsString  + ' ; ';
      end else if ( qyCodBarra.State = dsEdit ) AND (qyCodBarracd_codigo_barras.OldValue <> qyCodBarracd_codigo_barras.AsString) then
      begin
         observacao := observacao + ' Cód. de barra, de ' + VarToStr(qyCodBarracd_codigo_barras.OldValue) + ' para ' + qyCodBarracd_codigo_barras.AsString  + ' ; ';
      end; 
   end;

   gravaLog(cd_kit,operacao,observacao);

   FreeAndNil(qyMaxKit);
end;

procedure TformCadKits.montaLogProdutos(acao:integer;cd_produto,quantidade: string);
var
   observacao : string;
   operacao:integer;
begin

   if(acao = 2) then
   begin
      operacao := 2;
      observacao := 'Inclusão de produto num kit, dados:';
   end else if (acao = 1) then
   begin
      operacao := 4;
      observacao := 'Exclusão de produto de um kit, dados:' ;
   end else begin
      operacao := 3;
      observacao := 'Alteração da quantidade de um Produto num kit, dados:';
   end;

   observacao :=  observacao +
                  ' Código do Kit: ' + inttostr(qyKitscd_kit.AsInteger) +
                  ' , Código do Produto: ' + cd_produto;

   if (strtoint(quantidade) > 0) then
   begin
      observacao := observacao + ' , Quantidade: ' + quantidade;
   end;

   gravalog(qyKitscd_kit.AsInteger,operacao,observacao);
end;

procedure TformCadKits.gravalog(cd_kit, operacao: integer; observacao: String);
const
   SQL_GRAVA_LOG =
      'INSERT INTO log_geral (cd_usuario,dt_log,cd_modulo,cd_chave,cd_operacao,cd_coligada,ds_observacoes) '+
      'VALUES (:usuario,NOW(),1150,:chave,:operacao,:coligada,:observacao) ';
var
   qyGravaLog : TUMZQuery;
begin
   DM.CriarConsulta( qyGravaLog );

   qyGravaLog.SQL.Text := SQL_GRAVA_LOG;
   qyGravaLog.ParamByName('usuario').AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
   qyGravaLog.ParamByName('operacao').AsInteger := operacao;
   qyGravaLog.ParamByName('coligada').AsString := qyCategoriascd_coligada.AsString;
   qyGravaLog.ParamByName('chave').AsInteger :=  cd_kit;
   qyGravaLog.ParamByName('observacao').AsString := observacao;

   qyGravaLog.ExecSQL;

   FreeAndNil(qyGravaLog);
end;

procedure TformCadKits.grdKitsProdutosDragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
   SQL_INSERE_PRODUTO =
      'INSERT INTO comp_kits_itens (cd_kit, cd_produto, nr_quantidade) ' +
      'VALUES (:cd_kit, :cd_produto, :quant)';
   SQL_SELECT_PRODUTO =
      'SELECT count(*) as qtd FROM comp_kits_itens ' +
      'WHERE cd_kit = :cd_kit AND cd_produto = :cd_produto';
   SQL_UPDATE_PRODUTO =
      'UPDATE comp_kits_itens ' +
      'SET nr_quantidade = (nr_quantidade + :quant) ' +
      'WHERE cd_kit = :cd_kit ' +
      'AND cd_produto = :cd_produto';
var
  MyTreeNode : TTreeNode;
  xProduto, xQuantidade : String;
  qyProduto : TUMZQuery;
  isCancelado : Boolean;
  quantBanco : Integer;
  acao : integer;
begin
   // Se o drag and drop estiver recebendo um treeview, então tenta inserir o produto
   if Source is TTreeView then
   begin
      MyTreeNode := frmTableFields.Tree.Selected;

      xProduto := MyTreeNode.Text;
      xProduto := copy(xProduto,1,(Pos('-', xProduto)- 2));

      isCancelado := InputQueryEvento('UNIMESTRE', 'Informe a quantidade do produto neste kit:',xQuantidade,realizaExpressaoRegular);

      { Se não foi clicado no cancelar ...}
      if (isCancelado) then
      begin
         DM.CriarConsulta(qyProduto);
         with qyProduto do
         begin
            { Caso ja exista este produto neste kit apenas soma a quantidade existente com a digitada no input }
            sql.Add(SQL_SELECT_PRODUTO);
            ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
            ParamByName('cd_produto').AsString := xProduto;
            Open;

            quantBanco := FieldByName('qtd').AsInteger;

            qyProduto.Close;
            qyProduto.SQL.Clear;
            if (quantBanco = 0 ) then
            begin
               SQL.Add(SQL_INSERE_PRODUTO);
               acao := 2;
            end
            else
            begin
               SQL.Add(SQL_UPDATE_PRODUTO);
               acao := 0;
            end;

            ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
            ParamByName('cd_produto').AsString := xProduto;
            ParamByName('quant').AsString := xQuantidade;
            ExecSQL;
            Free;

            //Log
            montaLogProdutos(acao,xProduto,xQuantidade);
         end;
         abreQueryProdutos;
         setaValorKit;
      end;
   end;
end;

procedure TformCadKits.grdKitsProdutosDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := (Source is TTreeView);
end;

{ Não permite a inserção de código de barras duplicados }
function TformCadKits.isCodigoBarraExiste(const cd_cod_barra: String): Boolean;
const
   SQL_COD_BARRA_EXISTE =
      ' SELECT COUNT(*) AS registros FROM COMP_CODIGO_BARRAS WHERE CD_CODIGO_BARRAS = :cd_cod_barra and (cd_kit <> :kit or cd_kit is null) ';
var
   qyIsCodigoBarraExiste: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsCodigoBarraExiste);

   qyIsCodigoBarraExiste.Close();

   qyIsCodigoBarraExiste.SQL.Text := SQL_COD_BARRA_EXISTE;
   qyIsCodigoBarraExiste.ParamByName('cd_cod_barra').AsString := cd_cod_barra;
   qyIsCodigoBarraExiste.ParamByName('kit').AsString := qyKitscd_kit.AsString;

   qyIsCodigoBarraExiste.Open();

   Result := ( qyIsCodigoBarraExiste.FieldByName('registros').AsInteger > 0 );

   FreeAndNil(qyIsCodigoBarraExiste);
end;

procedure TformCadKits.montaLogTurmas(acao,cd_kit, nr_anosemestre: integer; cd_turma,
  nr_etapa: String);
var
   observacao : string;
   operacao:integer;
begin
   if(acao = 2) then
   begin
      operacao := 2;
      observacao := 'Inclusão de turma num kit, dados:';
   end else begin
      operacao := 4;
      observacao := 'Exclusão de turma de um kit, dados:' ;
   end;

   observacao :=  observacao +
                  ' Código do Kit: ' + inttostr(cd_kit) +
                  ' , Código da Turma: ' + cd_turma +
                  ' , Ano semestre ' + inttostr(nr_anosemestre) +
                  ' , Etapa da turma: ' + nr_etapa;

   gravalog(qyKitscd_kit.AsInteger,operacao,observacao);
end;

{ Permite apenas caracteres numéricos no input de quantidade }
procedure TformCadKits.realizaExpressaoRegular(Sender: TObject);
var
   stringAux: string;
   Edit: TEdit;
   charAux : Char;
begin
   Edit := TEdit(Sender);

   if length(Edit.Text) = 0 then
   begin
      exit;
   end;
   
   stringAux := copy(Edit.Text,length(Edit.Text),1);
   charAux := stringAux[1];

   if Edit.Enabled then
   begin
      if Edit.Focused() then
      begin
         if charAux in ['1','2','3','4','5','6','7','8','9','0'] then
            exit
         else
         begin
            stringAux := Edit.Text;
            delete(stringAux,length(stringAux),1);
            Edit.Text := stringAux;
            Edit.SetFocus;
            Edit.Selstart := Length(Edit.text);
            exit;
         end;
      end;
   end;
end;

{ Calcula o valor total atual do kit }
procedure TformCadKits.setaValorKit;
const
   SQL_BUSCA_VALOR =
      'SELECT sum((ck.nr_quantidade * cp.VL_PRODUTO)) as ValorKit ' +
      'FROM comp_kits_itens ck '+
      'LEFT JOIN comp_produtos cp on (cp.CD_PRODUTO = ck.cd_produto) ' +
      'where cd_kit = :cd_kit';
var
   qyValorKit : TUMZQuery;
begin
   dm.CriarConsulta(qyValorKit);
   qyValorKit.Close;
   qyValorKit.SQL.Add(SQL_BUSCA_VALOR);
   qyValorKit.ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
   qyValorKit.Open;
   edValor.setValorString(qyValorKit.FieldByName('ValorKit').AsString);
   FreeAndNil(qyValorKit);
end;

{ Seleciona todos os elementos da grid }
procedure TformCadKits.ToolButton10Click(Sender: TObject);
begin
   grdKitsProdutos.SelectedRows.Clear;

   with qyKitsProdutos do
   begin
      DisableControls;
      First;
      try
          while not EOF do
          begin
            grdKitsProdutos.SelectedRows.CurrentRowSelected := true;
            Next;
          end;
      finally
         EnableControls;
      end;
   end;
end;

procedure TformCadKits.ToolButton12Click(Sender: TObject);
var
   qyDeleteKitsProdutos: TUMZQuery;
   i: Integer;
begin
   DM.CriarConsulta(qyDeleteKitsProdutos);

   qyDeleteKitsProdutos.SQL.Clear();
   qyDeleteKitsProdutos.SQL.Add('DELETE FROM COMP_KITS_itens ');
   qyDeleteKitsProdutos.SQL.Add('WHERE CD_KIT = :CD_KIT AND CD_PRODUTO = :CD_PRODUTO');

   for I := 0 to grdKitsProdutos.SelectedRows.Count - 1 do
   begin
      qyKitsProdutos.GotoBookmark(pointer(grdKitsProdutos.SelectedRows.Items[I]));

      montaLogProdutos(1,qyKitsProdutoscd_produto.AsString,'0');

      qyDeleteKitsProdutos.ParamByName('CD_KIT').AsString := qyKitscd_kit.AsString;
      qyDeleteKitsProdutos.ParamByName('CD_PRODUTO').AsString := qyKitsProdutoscd_produto.AsString;
      qyDeleteKitsProdutos.ExecSQL;
   end;

   abreQueryProdutos;
   setaValorKit

end;

procedure TformCadKits.ToolButton5Click(Sender: TObject);
begin
   grdKitsTurmas.SelectedRows.Clear;

   with qyKitsTurmas do
   begin
      DisableControls;
      First;
      try
          while not EOF do
          begin
            grdKitsTurmas.SelectedRows.CurrentRowSelected := true;
            Next;
          end;
      finally
         EnableControls;
      end;
   end;
end;

procedure TformCadKits.ToolButton6Click(Sender: TObject);
var
   qyDeleteKitsTurmas: TUMZQuery;
   i: Integer;
begin
   DM.CriarConsulta(qyDeleteKitsTurmas);

   qyDeleteKitsTurmas.SQL.Clear();
   qyDeleteKitsTurmas.SQL.Add('DELETE FROM COMP_KITS_TURMAS ');
   qyDeleteKitsTurmas.SQL.Add('WHERE CD_KIT = :CD_KIT AND CD_TURMA = :CD_TURMA AND CD_ANOSEMESTRE = :CD_ANOSEMESTRE');

   for I := 0 to grdKitsTurmas.SelectedRows.Count - 1 do
   begin
      qyKitsTurmas.GotoBookmark(pointer(grdKitsTurmas.SelectedRows.Items[I]));

      qyDeleteKitsTurmas.ParamByName('CD_KIT').AsString := qyKitscd_kit.AsString;
      qyDeleteKitsTurmas.ParamByName('CD_TURMA').AsString := qyKitsTurmascd_turma.AsString;
      qyDeleteKitsTurmas.ParamByName('CD_ANOSEMESTRE').AsString := qyKitsTurmascd_anosemestre.AsString;

      montaLogTurmas(4,qyKitscd_kit.AsInteger,qyKitsTurmascd_anosemestre.AsInteger,qyKitsTurmascd_turma.AsString,qyKitsTurmasnr_etapa.AsString);

      qyDeleteKitsTurmas.ExecSQL;
   end;

   abreQueryTurmas;
end;

{ Constroi a árvore de produtos }
procedure TformCadKits.ToolButton8Click(Sender: TObject);
begin
   Application.CreateForm( TfrmTableFields, frmTableFields );
   frmTableFields.ConstroiTreeProdutos();
   frmTableFields.Show;
end;

end.
