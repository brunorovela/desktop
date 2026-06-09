unit uImportarDados;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Menus, DB, DBTables, ImgList, ComCtrls, ToolWin, DBCtrls,
   StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, Buttons, CheckLst,
   ZAbstractRODataset,ZAbstractDataset, UZDataset, uDM,Contnrs,
   VirtualTrees, uCarregaCursosFiltro, UCrpeClasses, UCrpe32, uFSelecionarPessoa;

type
  TfrmImportarDados = class(TForm)
    Panel3: TPanel;
    pcImportarDados: TPageControl;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    sbProcurar: TSpeedButton;
    Label14: TLabel;
    lblPorcentagem: TLabel;
    txtBuscar: TEdit;
    cbPropositoImportacao: TComboBox;
    prgLeituraArquivo: TProgressBar;
    tsSelecionarArquivo: TTabSheet;
    Panel1: TPanel;
    Label16: TLabel;
    lblQtdRegistros: TLabel;
    Panel4: TPanel;
    gridRegistrosEncontrados: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    dtPessoasImportadas: TDataSource;
    qryPessoasImportadas: TUMZQuery;
    sbLerArquivos: TSpeedButton;
    txtOutros: TEdit;
    lblOutros: TLabel;
    qryPessoasImportadasCD_PESSOA_UNIMESTRE: TIntegerField;
    qryPessoasImportadasDS_NOME: TStringField;
    qryPessoasImportadasDS_CURSO: TStringField;
    qryPessoasImportadasDS_PROPOSITO: TStringField;
    qryPessoasImportadasNR_CLASSIFICACAO: TIntegerField;
    tsGruposAlunos: TTabSheet;
    odArquivoTXT: TOpenDialog;
    ilBotoes: TImageList;
    btnAvancarPasso01: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnRemover: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    btnAvancarPasso02: TSpeedButton;
    SpeedButton12: TSpeedButton;
    btnRetornarPasso01: TSpeedButton;
    panel: TPanel;
    vstCursos: TVirtualStringTree;
    btnAddFiltros: TButton;
    Panel9: TPanel;
    Label10: TLabel;
    lblQtdGeral: TLabel;
    tsMetodosComparacao: TTabSheet;
    Panel10: TPanel;
    Label12: TLabel;
    Label15: TLabel;
    pa: TPanel;
    pcMetodosBusca: TPageControl;
    tsMetodo1: TTabSheet;
    tsMetodo2: TTabSheet;
    tsMetodo3: TTabSheet;
    tsMetodo4: TTabSheet;
    Panel11: TPanel;
    Label11: TLabel;
    ckbMetodo1: TCheckBox;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Label19: TLabel;
    gridMetodo1: TDBGrid;
    qryExemplos: TUMZQuery;
    Panel12: TPanel;
    btnAvancarPasso03: TSpeedButton;
    btnRetornarPasso02: TSpeedButton;
    qryExemplosDS_NOME: TStringField;
    qryExemplosDS_COMPARAR: TStringField;
    qryExemplosSN_OK: TSmallintField;
    qryExemplosDS_MODO: TStringField;
    qryExemplosVL_PERCENTUAL: TIntegerField;
    qryExemplosCD_EXEMPLO: TLargeintField;
    dtsExemplos: TDataSource;
    Panel17: TPanel;
    Label18: TLabel;
    ckbMetodo2: TCheckBox;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Label23: TLabel;
    gridMetodo2: TDBGrid;
    Panel22: TPanel;
    Label22: TLabel;
    ckbMetodo3: TCheckBox;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label24: TLabel;
    gridMetodo3: TDBGrid;
    Panel16: TPanel;
    Label20: TLabel;
    ckbMetodo4: TCheckBox;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Label21: TLabel;
    gridMetodo4: TDBGrid;
    tsConfirmarResultados: TTabSheet;
    Panel32: TPanel;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    txtNomeUnimestre: TEdit;
    Label28: TLabel;
    cbMetodo: TComboBox;
    btnFiltrar: TBitBtn;
    btnLimparFiltros: TBitBtn;
    Panel33: TPanel;
    Panel34: TPanel;
    Label29: TLabel;
    gridPasso4: TDBGrid;
    Panel36: TPanel;
    Label30: TLabel;
    lblTotalRegistrosEncontrados: TLabel;
    Label31: TLabel;
    lblTotalRegistrosFiltro: TLabel;
    lblTotalRegistrosMarcados: TLabel;
    Label32: TLabel;
    Panel35: TPanel;
    btnAvancarPassoFinal: TSpeedButton;
    btnVoltarPasso03: TSpeedButton;
    qryFiltrarResultados: TUMZQuery;
    dtsFiltrarResultados: TDataSource;
    Panel37: TPanel;
    qryPessoasImportadasCD_IMPORTADA: TIntegerField;
    qryQtdEncontrados: TUMZQuery;
    qryFiltrarResultadosNOME_UNIMESTRE: TStringField;
    qryFiltrarResultadosNOME_IMPORTADA: TStringField;
    qryFiltrarResultadosMETODO_BUSCA: TStringField;
    qryFiltrarResultadosCODIGO: TIntegerField;
    qryMarcados: TUMZQuery;
    tsPassoFinal: TTabSheet;
    Panel21: TPanel;
    Label33: TLabel;
    GroupBox2: TGroupBox;
    Label34: TLabel;
    txtNomeFinal: TEdit;
    btnFiltrarFinal: TBitBtn;
    btnLimparFiltroFinal: TBitBtn;
    Panel26: TPanel;
    gridPassoFinal: TDBGrid;
    Panel30: TPanel;
    Label36: TLabel;
    lblQtdTotalFiltro: TLabel;
    SpeedButton1: TSpeedButton;
    Label35: TLabel;
    txtCursoFinal: TEdit;
    qryFiltroFinal: TUMZQuery;
    dtsFiltroFinal: TDataSource;
    qryQtdFiltroFinal: TUMZQuery;
    toolPassoFinal: TToolBar;
    btnImprimir: TToolButton;
    separador3: TToolButton;
    btnCopiarSelecionados: TToolButton;
    separador2: TToolButton;
    btFechar: TToolButton;
    ImageList2: TImageList;
    qryFiltroFinalCD_PESSOA: TIntegerField;
    qryFiltroFinalDS_NOME: TStringField;
    qryFiltroFinalDS_CURSO: TStringField;
    qryFiltroFinalDS_TURMA: TStringField;
    qryFiltroFinalDS_PROPOSITO_IMPORTACAO: TStringField;
    qryFiltroFinalDS_EMAIL: TStringField;
    qryFiltroFinalDS_FONE: TStringField;
    qryFiltroFinalDS_CLASSIFICACAO: TIntegerField;
    Crpe1: TCrpe;
    Panel31: TPanel;
    Label25: TLabel;
    lblQtdPessoas: TLabel;
    qryQtdCursosFiltros: TUMZQuery;
    btnLimparCurso: TSpeedButton;
    btnCurso: TSpeedButton;
    separador1: TToolButton;
    separador4: TToolButton;
    qryFiltrarResultadosENCONTRADO: TIntegerField;
    Label17: TLabel;
    qryMetodo1: TUMZQuery;
    qryMetodo2: TUMZQuery;
    qryMetodo3: TUMZQuery;
    qryMetodo4: TUMZQuery;
    sbSelecionarColuna: TSpeedButton;
    qryFiltroFinalNR_ANOSEMESTRE: TIntegerField;
    qryFiltroFinaldt_nascimento: TDateTimeField;
    qryFiltroFinalDS_CELULAR: TStringField;
    qryFiltroFinalDS_CPF: TStringField;
    qryFiltroFinalDS_IDENTIDADE: TStringField;
    qryFiltroFinalNM_PAI: TStringField;
    qryFiltroFinalNM_MAE: TStringField;
    qryFiltroFinalDS_CELULAR_PAI: TStringField;
    qryFiltroFinalDS_CELULAR_MAE: TStringField;
    qryFiltroFinalDS_CELULAR_RESP_ACAD: TStringField;
    qryFiltroFinalTURMA_ANTERIOR: TStringField;
    qryFiltroFinalANOSEMESTRE_ANTERIOR: TIntegerField;
    procedure gridPassoFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridPasso4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridMetodo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridMetodo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridMetodo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridMetodo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridRegistrosEncontradosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure tsSelecionarArquivoShow(Sender: TObject);
    procedure separador1Click(Sender: TObject);
    procedure gridPassoFinalTitleClick(Column: TColumn);
    procedure gridPasso4TitleClick(Column: TColumn);
    procedure btnLimparCursoClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure vstCursosExpanding(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var Allowed: Boolean);
    procedure btnRetornarPasso02Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbMetodo4Click(Sender: TObject);
    procedure ckbMetodo3Click(Sender: TObject);
    procedure ckbMetodo2Click(Sender: TObject);
    procedure ckbMetodo1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAvancarPassoFinalClick(Sender: TObject);
    procedure pcImportarDadosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btFecharClick(Sender: TObject);
    procedure tsPassoFinalShow(Sender: TObject);
    procedure btnCopiarSelecionadosClick(Sender: TObject);
    procedure btnFiltrarFinalClick(Sender: TObject);
    procedure btnLimparFiltroFinalClick(Sender: TObject);
    procedure btnVoltarPasso03Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gridPasso4CellClick(Column: TColumn);
    procedure gridPasso4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnLimparFiltrosClick(Sender: TObject);
    procedure tsConfirmarResultadosShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnAvancarPasso03Click(Sender: TObject);
    procedure qryExemplosSN_OKGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tsMetodosComparacaoShow(Sender: TObject);
    procedure pcMetodosBuscaChange(Sender: TObject);
    procedure pcImportarDadosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRemoverClick(Sender: TObject);
    procedure vstCursosGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure tsGruposAlunosShow(Sender: TObject);
    procedure btnAddFiltrosClick(Sender: TObject);
    procedure btnRetornarPasso01Click(Sender: TObject);
    procedure btnAvancarPasso01Click(Sender: TObject);
    procedure gridRegistrosEncontradosTitleClick(Column: TColumn);
    procedure cbPropositoImportacaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbLerArquivosClick(Sender: TObject);
    procedure sbProcurarClick(Sender: TObject);
    procedure btnAvancarPasso02Click(Sender: TObject);
    procedure atualizarTotaisMarcados();
    procedure atualizaQtdGridPassoFinal();
    procedure CalculaEstimativa();
    procedure atualizaEstimativa(sn_checado : Boolean; total_tempo : Double);
    function selecionaPai(
      cd_curso_pai_node : string;
      NodePai : PVirtualNode
    ) : Boolean;
  private


      ASelList: TStringList;
      procedure leArquivo( ds_arquivo : string );
      function  Explode(Texto, Separador : String) : TStrings;
      procedure bloqueia_CTRL_DEL( Key: Word; Shift: TShiftState );
  public

      totalImportados, totalGeralPasso02 : Integer;

      totalMinutos, totalMinutos4 ,total_metodo1, total_metodo2,
      total_metodo3, total_metodo4, totalPessoas : Double;


      // Variavel que verifica se passou pro passo 4
      sn_acessouPasso2, sn_acessouPasso4 : Boolean;
  end;

type
  TPessoasImportadas = class(TObject)
   
  private
  public
    nr_classificado : integer;
    ds_nome: String;
    ds_curso : String;
   constructor Create(
      ds_nome1 : String;
      ds_curso1 : string;
      nr_classificado1 : integer
   );
  end;


var
  frmImportarDados: TfrmImportarDados;
  sOrdem : String;
  qtdGeral : Integer;

implementation

uses
   uInserirFiltros, uCamposPlanilhas , uFSelecionarCurso, uProcessaBuscaMetodos, Main,
  ClassRegistros, Clipbrd, StrUtils;

{$R *.dfm}


procedure TfrmImportarDados.bloqueia_CTRL_DEL(Key: Word; Shift: TShiftState);
begin
   {
      DESABILITA O CTRL + DEL DA GRID -> ESTA COMBINAÇÃO APAGA O REGISTRO
      SELECIONADO NA GRID
   }
   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;
end;

procedure TfrmImportarDados.btFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmImportarDados.btnAddFiltrosClick(Sender: TObject);
var
   frm : TfrmInserirFiltros;
begin
   // Chama a tela p/ Adicionar os filtros
   frm := TfrmInserirFiltros.Create( frmInserirFiltros );
   if ( frm.showModal = mrOK) then
   begin
   end;
end;

procedure TfrmImportarDados.btnRemoverClick(Sender: TObject);
const
   SQL_EXCLUI_CURSO = '' +
   ' DELETE FROM ' +
   '   cand_filtros ' +
   ' WHERE ';
var
  qryExcluirCursoSelecionado : TUMZQuery;

  tempNode : PVirtualNode;
  cd_nodeSelecionado : String;
  cd_filtro_node : Integer;
  sn_filho : Boolean;
  cd_curso_pai_node : string;
begin
  // Se NAOO tiver um NODE selecionado informa o usuario que necessário selecionar um registro
   if ( vstCursos.FocusedNode = nil ) then
   begin
      Mensagem( 'É necessário selecionar um registro!' );
      Exit;
   end;

   if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      // Inicia a Variavel sem valor
      cd_nodeSelecionado := '';
      sn_filho := False;

      DM.CriarConsulta( qryExcluirCursoSelecionado );

      // Pega o curso Selecionado p/ apaga-lo na CAND_FILTROS
      cd_nodeSelecionado := PFiltrosGrid(vstCursos.GetNodeData(vstCursos.FocusedNode)^).objFiltro.cd_curso;

      qryExcluirCursoSelecionado.Close();
      qryExcluirCursoSelecionado.SQL.Clear();
      qryExcluirCursoSelecionado.SQL.Text := (
         SQL_EXCLUI_CURSO
         + ' cd_curso = "'
         + cd_nodeSelecionado + '"'
      );
      
      // Verifica se o NODE possui um NODE_PAI
      tempNode := vstCursos.NodeParent[vstCursos.FocusedNode];

      // Se for diferente de NIL é pq o usuário selecionou um TURMA p/ ser EXCLUÍDA
      if ( tempNode <> nil ) then
      begin
         cd_curso_pai_node := PFiltrosGrid(vstCursos.GetNodeData(tempNode)^).objFiltro.cd_curso;

         cd_filtro_node := 0;
         // Pega o cd_filtro da tabela CAND_FILTROS para apagar somente a turma selecionada
         cd_filtro_node := PFiltrosGrid(vstCursos.GetNodeData(vstCursos.FocusedNode)^).objFiltro.cd_filtro;

         qryExcluirCursoSelecionado.Close();
         qryExcluirCursoSelecionado.SQL.Clear();
         qryExcluirCursoSelecionado.SQL.Text := (
            SQL_EXCLUI_CURSO
            + ' cd_filtro = '
            + IntToStr( cd_filtro_node )
         );
         sn_filho := True;
      end;

      // Executa a Exclusão
      qryExcluirCursoSelecionado.ExecSQL();
      qryExcluirCursoSelecionado.Free;

      // Atualiza a o Componente VSTCURSOS (VirtualStringTree)
      vstCursos.Clear;
      criarRegistro( vstCursos );

       vstCursos.SetFocus;
       selecionaPai(
          cd_curso_pai_node,
          vstCursos.GetFirstChild(vstCursos.TopNode)
       );
   end;
end;

procedure TfrmImportarDados.cbPropositoImportacaoChange(Sender: TObject);
begin
   if ( cbPropositoImportacao.ItemIndex = 3 ) then
   begin
      lblOutros.Visible := true;
      txtOutros.Visible := true;
   end;

   if ( cbPropositoImportacao.ItemIndex <> 3 ) then
   begin
      lblOutros.Visible := false;
      txtOutros.Visible := false;
   end;
end;

// Atualiza a estimativa de tempo ao clicar no checkBOX
procedure TfrmImportarDados.ckbMetodo1Click(Sender: TObject);
begin
    atualizaEstimativa(
      ckbMetodo1.Checked,
      total_metodo1
   );
end;

// Atualiza a estimativa de tempo ao clicar no checkBOX
procedure TfrmImportarDados.ckbMetodo2Click(Sender: TObject);
begin
   atualizaEstimativa(
      ckbMetodo2.Checked,
      total_metodo2
   );
end;

// Atualiza a estimativa de tempo ao clicar no checkBOX
procedure TfrmImportarDados.ckbMetodo3Click(Sender: TObject);
begin
   atualizaEstimativa(
      ckbMetodo3.Checked,
      total_metodo3
   );
end;

// Atualiza a estimativa de tempo ao clicar no checkBOX
procedure TfrmImportarDados.ckbMetodo4Click(Sender: TObject);
begin
   atualizaEstimativa(
      ckbMetodo4.Checked,
      total_metodo4
   );
end;

function TfrmImportarDados.Explode(Texto, Separador: String): TStrings;
var
    strItem       : String;
    ListaAuxUTILS : TStrings; 
    NumCaracteres, 
    TamanhoSeparador,
    I : Integer; 
Begin 
    ListaAuxUTILS    := TStringList.Create; 
    strItem          := ''; 
    NumCaracteres    := Length(Texto); 
    TamanhoSeparador := Length(Separador); 
    I                := 1; 
    While I <= NumCaracteres Do 
      Begin 
        If ( Copy(Texto,I,TamanhoSeparador) = Separador ) OR ( I = NumCaracteres ) Then 
          Begin 
            if (I = NumCaracteres) then strItem := strItem + Texto[I]; 
            ListaAuxUTILS.Add(trim(strItem));
            strItem := '';
            I := I + (TamanhoSeparador-1); 
          end 
        Else 
            strItem := strItem + Texto[I]; 

        I := I + 1; 
      End;
    Explode := ListaAuxUTILS;
end;

procedure TfrmImportarDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmImportarDados.FormCreate(Sender: TObject);
begin
   // Seta as opções para a combo de proposito da importacao
   cbPropositoImportacao.AddItem( 'Vestibular',nil );
   cbPropositoImportacao.AddItem( 'Concurso Público',nil );
   cbPropositoImportacao.AddItem( 'Processo seletivo ',nil );
   cbPropositoImportacao.AddItem( 'Outros',nil );

    // Seta as opções para a combo de Metodos
   cbMetodo.AddItem( 'Todos os Encontrados',nil );
   cbMetodo.AddItem( 'Método 1 - Nomes Exatos',nil );
   cbMetodo.AddItem( 'Método 2 - Primeiro Nome e Último Nome Iguais',nil );
   cbMetodo.AddItem( 'Método 3 - Consoantes dos Nomes Iguais',nil );
   cbMetodo.AddItem( 'Método 4 - Soundex',nil );
   cbMetodo.AddItem( 'Manual',nil );
   cbMetodo.AddItem( 'Não encontrados',nil );

   // Ativa a Aba do passo 1 -- Torna ela padrão ao abrir a tela
   pcImportarDados.ActivePage := tsSelecionarArquivo;
   qryPessoasImportadas.Close();
end;

procedure TfrmImportarDados.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ASelList);
end;

procedure TfrmImportarDados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F7: begin
        btnImprimirClick(nil);
      end;
      VK_F12 : begin
         Close();
      end;
  end;
end;

procedure TfrmImportarDados.gridMetodo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridMetodo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridMetodo3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridMetodo4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridPasso4CellClick(Column: TColumn);
var
   PG: TPoint;
   GC: TGridCoord;
   indiceRegistros : String;
   valorCheck,msg, ds_condicao_sql : String;
   qryDesmarcarEncontrados : TUMZQuery;
   resultado_filtro : TResultadoFiltroPessoa;
   codigoPessoa : integer;
   
  AbaSelecionada: AbasFiltroPessoa;
begin
   // Pega as coordenadas do click na GRid
   PG := gridPasso4.ScreenToClient(Mouse.CursorPos);
   GC := gridPasso4.MouseCoord( PG.X, PG.Y );

   msg := 'Deseja informar ao sistema que o candidato foi selecionado incorretamente?';

   DM.CriarConsulta(qryDesmarcarEncontrados);
   qryDesmarcarEncontrados.SQL.Text := ''
      +' UPDATE pessoas_importadas pi'
      +' SET pi.sn_encontrado = :sn_encontrado,'
      +' pi.cd_pessoa_unimestre = "",'
      +' pi.ds_metodo = ""'
      +' WHERE               '
      +'	pi.cd_importada = :codigo' ;

   // If para saber se as checks da GRid estao marcados

   if GC.X = 1 then begin
    indiceRegistros := qryFiltrarResultadosCODIGO.AsString;
      if ASelList.Values[indiceRegistros] = '1' then
      begin

         if (Mensagem(msg,Application.Title, MB_YESNO + MB_ICONQUESTION )<> ID_YES) then
         begin
            Exit;
         end;

         ASelList.Values [ indiceRegistros ] := '';

         qryDesmarcarEncontrados.ParamByName('sn_encontrado').AsInteger := 0;
         qryDesmarcarEncontrados.ParamByName('codigo').AsString := qryFiltrarResultadosCODIGO.AsString;
         if ( StrToInt(lblTotalRegistrosMarcados.Caption) <> 0 ) then
         begin
            lblTotalRegistrosMarcados.Caption := IntToStr(StrToInt(lblTotalRegistrosMarcados.Caption)-1);
         end;

      end
      else begin
         // Informamos quem é essa pessoa no unimestre
         // Se o usuario informar MANUALMENTE que o candidato existe no unimestre,
         // Abre uma janela para procura-lo MANUALMENTE e identifica-lo atraves do cd_pessoa
         resultado_filtro := TfrmSelecionarPessoa.Filtrar([],afpPessoa, 0 );
         codigoPessoa := resultado_filtro.cd_pessoa;

         qryDesmarcarEncontrados.SQL.Text := ''
         +' UPDATE pessoas_importadas pi'
         +' SET pi.sn_encontrado = :sn_encontrado,'
         +' pi.cd_pessoa_unimestre = :cd_pessoa_unimestre,'
         +' pi.ds_metodo = "Manual"'
         +' WHERE               '
         +'	pi.cd_importada = :codigo' ;

         ASelList.Values [ indiceRegistros ] := '1';
         qryDesmarcarEncontrados.ParamByName('sn_encontrado').AsInteger := 1;
         qryDesmarcarEncontrados.ParamByName('cd_pessoa_unimestre').AsInteger := codigoPessoa;
         qryDesmarcarEncontrados.ParamByName('codigo').AsString := qryFiltrarResultadosCODIGO.AsString;
         lblTotalRegistrosMarcados.Caption := IntToStr(StrToInt(lblTotalRegistrosMarcados.Caption)+1);
      end;
      
      qryQtdEncontrados.Close();
      qryQtdEncontrados.Open();

      qryDesmarcarEncontrados.ExecSQL();
      gridPasso4.Repaint();
      
   end;
end;

procedure TfrmImportarDados.gridPasso4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawRect: TRect;
begin
 if (Column.FieldName = 'SELECAO') then
   begin
      gridPasso4.Canvas.FillRect(Rect);

      if (gdFocused in State) then
      begin
         DrawRect.Left := Rect.Left + 1;
      end
      else
      begin
         DrawRect.Left := Rect.Left + 2;
      end;

      DrawRect.Right := Rect.Right - 2;
      DrawRect.Top := Rect.Top + 2;
      DrawRect.Bottom := Rect.Bottom - 2;

      DrawFrameControl(
         gridPasso4.Canvas.Handle,
         DrawRect,
         DFC_BUTTON,
         ISChecked[ASelList.Values[qryFiltrarResultadosCODIGO.AsString ] = '1' ]
      );
   end;

end;

procedure TfrmImportarDados.gridPasso4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridPasso4TitleClick(Column: TColumn);
var
 nr_posicao : integer;
 ds_qryFiltrarResultados, sAux : String;

begin
   // Nesse procedimento ocorre a ordenação da GRID através do clique na COLUNA
   if ( Column.FieldName <> 'SELECAO' ) then
   begin
      qryFiltrarResultados.Close();
      ds_qryFiltrarResultados := qryFiltrarResultados.SQL.TEXT;

      nr_posicao := pos(
         'ORDER BY',
         ds_qryFiltrarResultados
      );
      
      if nr_posicao > 0 then
      begin
         ds_qryFiltrarResultados := copy(
            ds_qryFiltrarResultados,
            1,
            nr_posicao-1
         );
      end;

      qryFiltrarResultados.SQL.Clear();

      if ( sOrdem = Column.FieldName )  then
      begin
          sOrdem := Column.FieldName + ' DESC ' ;
      end
      else
      begin
          sOrdem := Column.FieldName;
      end;

      sAux := StringReplace(
         ds_qryFiltrarResultados,
         sAux,
         '',
         [rfReplaceAll]
      );

      qryFiltrarResultados.SQL.Add(
         ds_qryFiltrarResultados
         + ' ORDER BY '
         + sOrdem
      );

      qryFiltrarResultados.ParamByName('sn_encontrado').AsInteger := 1;

      if ( cbMetodo.ItemIndex = 5 ) then
      begin
         qryFiltrarResultados.ParamByName('sn_encontrado').AsInteger := 0;
      end;

      qryFiltrarResultados.Open();
   end;
end;

procedure TfrmImportarDados.gridPassoFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridPassoFinalTitleClick(Column: TColumn);
var
   ds_qryFiltroFinal, sAux: String;
   nr_posicao : integer;

begin
   // Nesse procedimento ocorre a ordenação da GRID através do clique na COLUNA
   qryFiltroFinal.Close();

   ds_qryFiltroFinal := qryFiltroFinal.SQL.TEXT;

   nr_posicao := pos('ORDER BY',ds_qryFiltroFinal);
   if nr_posicao > 0 then
    begin
      ds_qryFiltroFinal := copy(ds_qryFiltroFinal, 1 , nr_posicao-1);
    end;
    qryFiltroFinal.SQL.Clear();

   if ( sOrdem = Column.FieldName )  then
   begin
       sOrdem := Column.FieldName + ' DESC ' ;
   end
   else
   begin
       sOrdem := Column.FieldName;
   end;

   sAux := StringReplace(ds_qryFiltroFinal, sAux, '', [rfReplaceAll]);

   qryFiltroFinal.SQL.Add(
      ds_qryFiltroFinal
      + ' ORDER BY '
      + sOrdem
   );

   qryFiltroFinal.Open();
end;

procedure TfrmImportarDados.gridRegistrosEncontradosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   bloqueia_CTRL_DEL(Key, Shift);
end;

procedure TfrmImportarDados.gridRegistrosEncontradosTitleClick(Column: TColumn);
begin
   // Nesse procedimento ocorre a ordenação da GRID através do clique na COLUNA
   qryPessoasImportadas.Close();

   if ( sOrdem = Column.FieldName )  then
   begin
       sOrdem := Column.FieldName + ' DESC ' ;
   end
   else
   begin
       sOrdem := Column.FieldName;
   end;
      
   qryPessoasImportadas.SQL.Text := '' +
   ' SELECT'   +
   '  cd_importada, ' +
   '  cd_pessoa_unimestre, ' +
   '  ds_nome, '            +
   '  ds_curso, '             +
   '  nr_classificacao,ds_proposito'+
   ' FROM '                           +
   '  pessoas_importadas ' +
   ' ORDER BY ' + sOrdem ;

   qryPessoasImportadas.Close();
   qryPessoasImportadas.Open();

end;

procedure TfrmImportarDados.leArquivo(ds_arquivo: string);
var
  objArquivo: TextFile;

  ds_nome,
  ds_curso,
  ds_linha,
  valoresInsert,
  sn_utiliza_virgula,
  ds_insert,
  ds_propositoImportacao : String;

  arrTString : TStrings;

  nr_classificacao_arquivo,
  nr_valor_inicial_nome,
  cd_vestibular,
  i, j,
  nr_porcetagem, cont_insert,
  totalPessoasImportadas : integer;

  classificacao : String;
  linhaAtual: TStrings;
  qryInsertPessoasImportadas : TUMZQuery;

  objPessoa : TPessoasImportadas;
  arrPessoasImportadas : TObjectList;
   NumberStr: AnsiString;
   C: Char;
begin
   // Inicialização da variaveis -- NAO RETIRAR
   nr_classificacao_arquivo := 0;
   ds_curso := '';
   ds_nome := '';
   ds_linha := '';
   cont_insert := 0;
   sn_utiliza_virgula := ',';
   ds_insert:= ' INSERT INTO ' +
   ' pessoas_importadas ( ' +
   ' ds_nome, '  +
   ' ds_consoantes_nome, '  +
   ' ds_curso, ' +
   ' nr_classificacao, ' +
   ' ds_proposito ' +
   ' ) VALUES ';

   dm.CriarConsulta(qryInsertPessoasImportadas);

   // Inicializa o array de Pessoas importadas pelo arquivo
   arrPessoasImportadas := TObjectList.Create();
   
   // Atribuição dos valores da barra de progresso
   prgLeituraArquivo.Position := 0;
   prgLeituraArquivo.Min := 0;
   prgLeituraArquivo.Max := 100;

  // Abrindo o arquivo
   AssignFile( objArquivo, ds_arquivo );
   // Preparando o arquivo para leitura
   Reset( objArquivo );

   // progress Bar
   prgLeituraArquivo.Visible:= True;
   lblPorcentagem.Visible:= true;
   prgLeituraArquivo.Position := 1;
   Sleep(1);
   Application.ProcessMessages;

   while not Eof( objArquivo ) do
   begin
      // Lendo o arquivo
      ReadLn( objArquivo, ds_linha );

      ds_linha := Trim(ds_linha);
      nr_classificacao_arquivo := 0;


      // Processa a linha apenas se não for vazia
      if ds_linha <> '' then
      begin

         // Se a linha começar com # é porque é um nome de curso
         if copy( ds_linha, 1, 1 ) = '#' then
         begin
            ds_curso := copy(
               ds_linha,
               2,
               Length(ds_linha)-1
            );

            ds_curso := Trim(ds_curso);
         end;

         // eh aluno
         if copy( ds_linha, 1, 1 ) <> '#' then
         begin

            // Extraí o número de classificação do aluno

            NumberStr := '';

            for I := 1 to Length(ds_linha) do
            begin
               C := ds_linha[I];
               
               if C in ['0'..'9'] then
               begin
                  NumberStr := NumberStr + C;
               end
               else
                  Break;
            end;

            if I > 1 then
               Dec(I);

            // Tenta converter o número de classificação
            
            if not TryStrToInt(NumberStr, nr_classificacao_arquivo) then
            begin
               nr_classificacao_arquivo := 0;
            end;

            ds_nome := ds_linha;

            // Recupera a classificação do aluno SE POSSUIR
            if ( nr_classificacao_arquivo <> 0 ) then
            begin
               ds_nome := AnsiRightStr(
                  ds_linha,
                  Length(ds_linha) - I
               );
            end;

            ds_nome := Trim(ds_nome);

            objPessoa := TPessoasImportadas.Create(
               ds_nome,
               ds_curso,
               nr_classificacao_arquivo
            );

            // Adiciona os valores lidos do arquivo para o array
            arrPessoasImportadas.Add(objPessoa);
         end;

      end;

      prgLeituraArquivo.Position := prgLeituraArquivo.Position + 1;

      if (prgLeituraArquivo.Position = 100 ) then
      begin
        prgLeituraArquivo.Position := 0;
      end;

      inc(cont_insert);

      if cont_insert = 500 then
      begin
         Sleep(1);
         Application.ProcessMessages;
         cont_insert := 0;
      end;
   end;

   CloseFile( objArquivo );

   // Verifica qual o Proposito selecionado através da comboBox
   case cbPropositoImportacao.ItemIndex of
      0 : ds_propositoImportacao:= 'Vestibular';
      1 : ds_propositoImportacao:= 'Concurso Público';
      2 : ds_propositoImportacao:= 'Processo seletivo';
      3 : ds_propositoImportacao:= txtOutros.Text;
   end;

   prgLeituraArquivo.Position := 1;
   lblPorcentagem.Visible:= true;
   Sleep(1);
   Application.ProcessMessages;
   cont_insert := 0;

   ds_nome := '';
   ds_curso := '';
   nr_classificacao_arquivo := 0;

   // Nesse FOR ocorre a concatenação para o INSERT AGRUPADO
   for j := 0 to arrPessoasImportadas.Count-1 do
   begin
      inc(cont_insert);
      nr_porcetagem := Trunc((j*100) / arrPessoasImportadas.Count);

     prgLeituraArquivo.Position := nr_porcetagem;
      Application.ProcessMessages;

      sn_utiliza_virgula := ',';

      // Verifica se deve colocar uma virgula ou ponto e virgula(;) no INSERT AGRUPADO
      if ( (j = arrPessoasImportadas.Count-1) OR (cont_insert = 100)) then
      begin
         sn_utiliza_virgula := ';';
      end;


      ds_nome := TRIM(
         TPessoasImportadas(
            arrPessoasImportadas.Items[j]
         ).ds_nome
      );

      // NOme sem acento
     ds_nome := SemAcento(ds_nome);

      ds_curso := TRIM(
         TPessoasImportadas(
            arrPessoasImportadas.Items[j]
         ).ds_curso
      );


      nr_classificacao_arquivo := TPessoasImportadas(
            arrPessoasImportadas.Items[j]
         ).nr_classificado;

      // INICIO -- CONCATENACAO PARA O INSERT AGRUPADO
      valoresInsert := valoresInsert +
      ' ( '
      + '"'
      +  SemAcento(ds_nome)
      + '" ,'
      + ' REMOVE_VOGAIS('
		+ 'sem_acento('
      + '"'
      + ds_nome
      + '" )), "'
      + ds_curso
      + '" , '
      + IntToStr( nr_classificacao_arquivo )
      +  ' , '
      + ' "'
      + TRIM(ds_propositoImportacao)
      + '" '
      + ')'
      + sn_utiliza_virgula;
      // FIM -- CONCATENACAO PARA O INSERT AGRUPADO

      // Limpa o ARRAY
      TPessoasImportadas(arrPessoasImportadas.Items[j]).Free;

      // Faz a insersação a cada 100 pessoas lidas
      if(cont_insert = 100) then
      begin
         qryInsertPessoasImportadas.SQL.Text := ds_insert + valoresInsert;
         qryInsertPessoasImportadas.ExecSQL();
         cont_insert:= 0;
         valoresInsert := '';
      end;

   end;

   // contabiliza a quantidade de pessoas importadas
   totalPessoasImportadas := arrPessoasImportadas.Count;

   // Insere o restante das pessoas
   if ( valoresInsert <> '' ) then
   begin
      qryInsertPessoasImportadas.SQL.Text := ( ds_insert + valoresInsert );
      qryInsertPessoasImportadas.ExecSQL();
   end;

  prgLeituraArquivo.Position := 100;
  totalImportados := totalPessoasImportadas + StrToInt(lblQtdRegistros.Caption);
  lblQtdRegistros.Caption := IntToStr(totalImportados);
end;

procedure TfrmImportarDados.pcImportarDadosChange(Sender: TObject);
begin
   qryPessoasImportadas.Close();
   qryPessoasImportadas.Open();

   // Nao permite o usuário avancar se nennhum arquivo foi importado(LIDO)
   if NOT ( qryPessoasImportadas.RecordCount > 0 ) then
   begin
      pcImportarDados.ActivePage := tsSelecionarArquivo;

      Mensagem(
         'Ainda não há nenhuma lista de aprovados no sistema.'
         + chr(13)
         + 'Para prosseguir importe pelo menos um arquivo.',
         'Erro',
         0
      );
      Exit;
   end;

end;

procedure TfrmImportarDados.pcImportarDadosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   // Bloqueia a navegacao pelas ABAS
   AllowChange := False;
end;

procedure TfrmImportarDados.pcMetodosBuscaChange(Sender: TObject);
var
   ds_metodo : String;
begin
   ds_metodo := pcMetodosBusca.ActivePage.Name;

   qryExemplos.Close();

   qryExemplos.SQL.Clear();
   qryExemplos.SQL.Add(
      ' SELECT '
      +'   cd_exemplo, '
      +'   ds_nome,     '
      +'   ds_comparar, '
      +'   sn_ok,       '
      +'	 ds_modo,      '
      +'	 vl_percentual '
      +' FROM  '
      +'	 cand_exemplos '
      +'  WHERE '
      +'   ds_modo = "'
      + ds_metodo
      + '"'
   );
   
   qryExemplos.Open();
end;


procedure TfrmImportarDados.qryExemplosSN_OKGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 // Verifica se o valor que vem da query na GRid é 1(um) caso verdadeiro escreve Sim
 // Caso False escreve Não
 if ( Sender.value = '1' ) then
   begin
      Text := 'Sim';
   end
   else
   begin
      Text := 'Não';
   end;
end;

procedure TfrmImportarDados.sbLerArquivosClick(Sender: TObject);
begin
   // Validação para saber se o proposito da importação foi selecionado
   if not (cbPropositoImportacao.ItemIndex <> -1 ) then
   begin
      Mensagem( 'Informe o propósito da sua importação!','Erro !', 0 );
      exit;
   end;

   // Validação para saber se o proposito da importação foi selecionado
   if ( cbPropositoImportacao.ItemIndex = 3 ) AND NOT ( txtOutros.Text <> '' ) then
   begin
      Mensagem( 'Informe o propósito da sua importação!','Erro !', 0 );
      exit;                                                            
   end;

   if FileExists( txtBuscar.Text ) then
   begin
      sbProcurar.Enabled := False;
      sbLerArquivos.Enabled := False;
      btnAvancarPasso01.Enabled := False;

      // Envia para funcao que lê o arquivo .TXT(extensão do Arquivo)
      leArquivo( txtBuscar.Text );
      Mensagem( 'Arquivo importado com sucesso !', 'Sucesso !', 0 );

      sbProcurar.Enabled := True;
      btnAvancarPasso01.Enabled := True;

      lblPorcentagem.Visible := False;
      prgLeituraArquivo.Visible := False;

      // Atualiza grid com os alunos importados
      qryPessoasImportadas.Close();
      qryPessoasImportadas.Open();
   end;
end;

procedure TfrmImportarDados.sbProcurarClick(Sender: TObject);
begin

  // Abre a pop-up para buscar o Arquivo TXT
  if ( odArquivoTXT.Execute ) then
  begin
    txtBuscar.Text := odArquivoTXT.FileName;
  end;

  if ( txtBuscar.Text <> '' ) then
  begin
     sbLerArquivos.Enabled := True;
  end;
end;

procedure TfrmImportarDados.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);

   frmSelColunas.SelecionaColunas(
      gridPassoFinal,
      'planilha_resultados_candidatos_classificados'
   );
end;

procedure TfrmImportarDados.separador1Click(Sender: TObject);
begin
// Validacao se existem registros para copiar para o CLipBoard (Ctrl+C)
   if qryFiltroFinal.Eof then
   begin
      Mensagem('Não existem registros para serem selecionados!');
      Exit;
   end;

   FullDBGridToClipBoard(
      gridPassoFinal,
      True,
      [
         1,
         1,
         1,
         1,
         1,
         1
      ]
   );

   Mensagem(
      'Informações copiadas.',
      Application.Title,
      MB_OK + MB_ICONINFORMATION,
      Handle
   );
   
end;

procedure TfrmImportarDados.btnCopiarSelecionadosClick(Sender: TObject);
var
   i: integer;
   ds_lista, ds_nova_linha : string;
begin
   // VAlidacao se existem registros para copiar para o CLipBoard (Ctrl+C)
   if qryFiltroFinal.Eof then
   begin
      Mensagem('Não existem registros para serem selecionados!');
      Exit;
   end;

   SelDBGridToClipBoard(gridPassoFinal, True);

   {GO TO BOOKMARK para pegar os selecionados}
   {
   if ( gridPassoFinal.SelectedRows.Count > 0 ) then
   begin

      ds_nova_linha := chr(13) + chr(10); // Caracteres para pular linhas para o CSV

      ds_lista := (
         'Nome'
         + chr(9) + 'Classificação'
         + chr(9) + 'Cursos'
         + chr(9) + 'Turmas'
         + chr(9) + 'Propósito Importação'
         + chr(9) + 'Email'
         + chr(9) + 'Telefone'
         + chr(9) + 'Cod. Pessoa'
         + chr(9) + 'Ano/Semestre'
         + chr(9) + 'Data Nascimento'
         + chr(9) + 'Celular'
         + ds_nova_linha
      );

      with dtsFiltroFinal.DataSet, gridPassoFinal do
      begin
         for i := 0 to gridPassoFinal.SelectedRows.Count - 1 do
         begin
            GotoBookmark(
               Pointer(
                  SelectedRows.Items[i]
               )
            );

            ds_lista := (
               ds_lista
               +  qryFiltroFinalDS_NOME.AsString
               + chr(9)
               + qryFiltroFinalDS_CLASSIFICACAO.AsString
               + chr(9)
               + qryFiltroFinalDS_CURSO.AsString
               + chr(9)
               + qryFiltroFinalDS_TURMA.AsString
               + chr(9)
               + qryFiltroFinalDS_PROPOSITO_IMPORTACAO.AsString
               + chr(9)
               + qryFiltroFinalDS_EMAIL.AsString
               + chr(9)
               + qryFiltroFinalDS_FONE.AsString
               + chr(9)
               + qryFiltroFinalCD_PESSOA.AsString
               + chr(9)
               + qryFiltroFinalNR_ANOSEMESTRE.AsString
               + chr(9)
               + qryFiltroFinaldt_nascimento.AsString
               + chr(9)
               + qryFiltroFinalDS_CELULAR.AsString
               + ds_nova_linha
            );
         end;
      end;
   end;

   Clipboard.AsText := ds_lista;
   }
   
   Mensagem(
      'Informações copiadas.',
      Application.Title,
      MB_OK
      + MB_ICONINFORMATION,
      Handle
   );
   
end;

procedure TfrmImportarDados.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
 // Tela de filtro de curso Padrão Unimestre
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, -1);

   // Seta o valor do Filtro no campo curso
   txtCursoFinal.Text := resultado_filtro.ds_curso;
end;

procedure TfrmImportarDados.tsMetodosComparacaoShow(Sender: TObject);
var
   ds_metodo : String;
begin
   totalPessoas := 0;

   totalMinutos4 := totalMinutos;

   totalMinutos := 0;

   // Definimos que a ABA 1 será a padrão ou seja sempre que abrir essa parte do
   // sistema essa sempre será a primeira aba a ser Exibida
   pcMetodosBusca.ActivePage := tsMetodo1;
   qryExemplos.Close();

   totalPessoas := ( totalImportados + totalGeralPasso02 );

   //Como definimos a ABA 1 como padrão, o primeito SQL de exemplo sempre será para ela
   qryExemplos.SQL.Clear();
   qryExemplos.SQL.Add(
      ' SELECT '
      +'   cd_exemplo, '
      +'   ds_nome,     '
      +'   ds_comparar, '
      +'   sn_ok,       '
      +'	 ds_modo,      '
      +'	 vl_percentual '
      +' FROM  '
      +'	 cand_exemplos '
      +'  WHERE '
      +'   ds_modo = "tsMetodo1" '
   );

   qryExemplos.Open();

   if sn_acessouPasso2 = True then
   begin
      CalculaEstimativa();
      ckbMetodo1.Checked := True;
      sn_acessouPasso2 := False; 
   end;

   if sn_acessouPasso4 = True then
   begin
     
      totalMinutos := totalMinutos4;

      totalMinutos4 := 0;

      sn_acessouPasso2 := False;
      sn_acessouPasso4 := False;
   end;

   btnRetornarPasso02.Enabled := True;
   btnAvancarPasso03.Enabled  := True;
end;

procedure TfrmImportarDados.tsPassoFinalShow(Sender: TObject);
begin
   // Atualiza QUERY
   qryFiltroFinal.Close();
   qryFiltroFinal.Open();
   atualizaQtdGridPassoFinal();
   
   DM.MontarPlanilha(
      gridPassoFinal,
      'planilha_resultados_candidatos_classificados'
   );
end;

procedure TfrmImportarDados.tsSelecionarArquivoShow(Sender: TObject);
var
 msgExclusao : String;
begin
msgExclusao := (
         'Ao prosseguir com esta operação você estará limpando '
         + 'os dados processados na importação anterior. Deseja continuar?'
      );
end;

procedure TfrmImportarDados.btnRetornarPasso01Click(Sender: TObject);
begin
   // Define a Pagina Que sera exibida
   pcImportarDados.ActivePage := tsSelecionarArquivo;
end;

procedure TfrmImportarDados.btnRetornarPasso02Click(Sender: TObject);
begin
   pcImportarDados.ActivePage := tsGruposAlunos;
   ckbMetodo1.Checked := false;
   ckbMetodo2.Checked := false;
   ckbMetodo3.Checked := false;
   ckbMetodo4.Checked := false;
end;

procedure TfrmImportarDados.btnVoltarPasso03Click(Sender: TObject);
var
   qryAtualizarPessoas : TUMZQuery;
   msg : String;
begin

   // Se o usuaário estiver no passo 04 e quiser voltar para o passo 3 irá executar o UPDATe
   // Que irá marcar todos como não encontrados
   msg := 'Ao Retornar esse passo a busca será novamente executada pelo sistema. Deseja continuar?';

   if ( Mensagem(msg,Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES ) then
   begin
      Exit;
   end;

   DM.CriarConsulta(qryAtualizarPessoas);

   qryAtualizarPessoas.SQL.Text := ''
   + ' UPDATE '
   + ' pessoas_importadas pi  '
   + ' SET '
   + ' pi.sn_encontrado = 0,'
   + ' pi.ds_metodo = "" ';

   qryAtualizarPessoas.ExecSQL();

   pcImportarDados.ActivePage := tsMetodosComparacao;
end;

procedure TfrmImportarDados.CalculaEstimativa;
var
   contador1,contador2, frequencia: Int64;
begin
   QueryPerformanceFrequency(frequencia);
   QueryPerformanceCounter(contador1);

   // Now (c2-c1)/f is the duration in secs of DoSomething

   // Atualiza grid com os alunos importados
//   qryMetodo1.Close();
//   qryMetodo1.Open();

   QueryPerformanceCounter(contador2);
   contador1 := (contador2 - contador1);
   total_metodo1 := contador1 / frequencia;


   {
      Metodo 02
   }

   frequencia := 0;
   contador1  := 0;
   contador2  := 0;

   QueryPerformanceFrequency(frequencia);
   QueryPerformanceCounter(contador1);

   // Now (c2-c1)/f is the duration in secs of DoSomething

   // Atualiza grid com os alunos importados
//   qryMetodo2.Close();
//   qryMetodo2.Open();

   QueryPerformanceCounter(contador2);
   contador1 := (contador2 - contador1);
   total_metodo2 := contador1 / frequencia;
  

   {
      Metodo 03
   }

   frequencia := 0;
   contador1  := 0;
   contador2  := 0;

   QueryPerformanceFrequency(frequencia);
   QueryPerformanceCounter(contador1);

   // Now (c2-c1)/f is the duration in secs of DoSomething

   // Atualiza grid com os alunos importados
//   qryMetodo3.Close();
//   qryMetodo3.Open();

   QueryPerformanceCounter(contador2);
   contador1 := (contador2 - contador1);
   total_metodo3 := contador1 / frequencia;


   {
      Metodo 04
   }

   frequencia := 0;
   contador1  := 0;
   contador2  := 0;

   QueryPerformanceFrequency(frequencia);
   QueryPerformanceCounter(contador1);

   // Now (c2-c1)/f is the duration in secs of DoSomething

   // Atualiza grid com os alunos importados
//   qryMetodo4.Close();
//   qryMetodo4.Open();

   QueryPerformanceCounter(contador2);
   contador1 := (contador2 - contador1);
   total_metodo4 := contador1 / frequencia;

end;

procedure TfrmImportarDados.btnAvancarPasso01Click(Sender: TObject);
begin
   qryPessoasImportadas.Close();
   qryPessoasImportadas.Open();

   // Nao permite o usuário avancar se nennhum arquivo foi importado(LIDO)

   if NOT ( qryPessoasImportadas.RecordCount > 0 ) then
   begin
      Mensagem(
         'Ainda não há nenhuma lista de aprovados no sistema.'
         + chr(13)
         + 'Para prosseguir importe pelo menos um arquivo.',
         'Erro',
         0
      );
      Exit;
   end; 

   // Se importou algum arquivo pode avancar
   pcImportarDados.ActivePage := tsGruposAlunos;
end;

procedure TfrmImportarDados.btnAvancarPasso02Click(Sender: TObject);
begin
   // Se importou algum arquivo pode avancar
   qryQtdCursosFiltros.Close();
   qryQtdCursosFiltros.Open();
   if (qryQtdCursosFiltros.Eof)  then
   begin

      Mensagem('É necessário adicionar um filtro contendo aluno(s) do Unimestre');
      Exit;
   end;
   pcImportarDados.ActivePage := tsMetodosComparacao;
end;

procedure TfrmImportarDados.btnAvancarPasso03Click(Sender: TObject);
begin
   // valida se foi selecionado algum método de Busca
   if NOT (ckbMetodo1.Checked = True) AND
      NOT (ckbMetodo2.Checked = True) AND
      NOT (ckbMetodo3.Checked = True) AND
      NOT (ckbMetodo4.Checked = True)
   then
   begin
      Mensagem('Selecione um método de busca!');
      Exit;
   end;

   Application.CreateForm(TfrmProcessaBuscaMetodos, frmProcessaBuscaMetodos);

   //Informa quais Checks foram marcados
   frmProcessaBuscaMetodos.set_sn_metodo1(ckbMetodo1.Checked);
   frmProcessaBuscaMetodos.set_sn_metodo2(ckbMetodo2.Checked);
   frmProcessaBuscaMetodos.set_sn_metodo3(ckbMetodo3.Checked);
   frmProcessaBuscaMetodos.set_sn_metodo4(ckbMetodo4.Checked);

   frmProcessaBuscaMetodos.Show;
   Sleep(10);
   frmProcessaBuscaMetodos.executarProgressBar();

   cbMetodo.ItemIndex := 0;
   btnRetornarPasso02.Enabled := False;
   btnAvancarPasso03.Enabled := False;
   
end;

procedure TfrmImportarDados.btnAvancarPassoFinalClick(Sender: TObject);
var
   msgContinuar : String;
begin
      msgContinuar := 'Ao concluir este passo, o processo será finalizado. '
      + 'E você poderá apenas visualizar os resultados para impressão e copia-los para o excel. '
      + 'Deseja continuar?';
      
      if Mensagem(
         msgContinuar,
         Application.Title,
         MB_YESNO + MB_ICONQUESTION
      ) = ID_YES
      then
      begin
         pcImportarDados.ActivePage := tsPassoFinal;
      end;
end;

procedure TfrmImportarDados.btnFiltrarClick(Sender: TObject);
var
   ds_filtro_metodo_busca,ds_filtro_nome_unimestre,
   ds_condicoes_sql, msg_valida_campos: String;

   total_registros_encontrados,
   total_registros_filtro,
   total_registros_marcados : Integer;
begin
   // Inicializa as variaveis
   ds_filtro_nome_unimestre    := txtNomeUnimestre.Text;
   ds_filtro_metodo_busca      := '';
   ds_condicoes_sql            := '';
   total_registros_encontrados := 0;
   total_registros_filtro      := 0;
   total_registros_marcados    := 0;

   qryQtdEncontrados.Close();
   qryFiltrarResultados.Close();

   // Valida se os campos estão vazios
   if ( TRIM(ds_filtro_nome_unimestre) = '' ) AND ( cbMetodo.ItemIndex = -1 ) then
   begin
      msg_valida_campos := 'Selecione algum filtro para continuar!';
      lblTotalRegistrosEncontrados.Caption := IntToStr(0);
      lblTotalRegistrosFiltro.Caption := IntToStr(0);
      ShowMessage(msg_valida_campos);
      Exit;
   end;

   case cbMetodo.ItemIndex of
      0 : ds_filtro_metodo_busca:= 'Todos os encontrados';
      1 : ds_filtro_metodo_busca:= 'Metodo1';
      2 : ds_filtro_metodo_busca:= 'Metodo2';
      3 : ds_filtro_metodo_busca:= 'Metodo3';
      4 : ds_filtro_metodo_busca:= 'Metodo4';
      5 : ds_filtro_metodo_busca:= 'Manual';
      6 : ds_filtro_metodo_busca:= 'Não Encontrados';
   end;

   qryFiltrarResultados.SQL.Clear();
   
   qryFiltrarResultados.SQL.ADD ('' +
      'SELECT '
      +  ' pi.cd_importada codigo, '
      +  ' IF ( '
      +'	pu.ds_nome IS NOT NULL, '
      +'	pu.ds_nome, '
      +'	p.nm_pessoa '
      +') AS nome_unimestre, '
      +  ' pi.ds_nome nome_importada, '
      +  ' pi.ds_metodo metodo_busca, '
      +  ' pi.sn_encontrado encontrado '
      +' FROM '
      +  ' pessoas_importadas pi '
      + ' LEFT JOIN pessoas p ON (            '
      + '	p.cd_pessoa = pi.cd_pessoa_unimestre '
      + ' ) '
      +' LEFT JOIN  pessoas_unimestre pu ON ( '
      +  ' pu.cd_pessoa_unimestre = pi.cd_pessoa_unimestre '
      +' ) '
   );

   ds_condicoes_sql := ' WHERE pi.sn_encontrado = :sn_encontrado ';
   qryFiltrarResultados.SQL.Add( ds_condicoes_sql );

   ds_condicoes_sql := ' AND ';

   qryFiltrarResultados.ParamByName('sn_encontrado').AsInteger := 1;
   
   if ( ds_filtro_metodo_busca = 'Não Encontrados' ) then
   begin
      qryFiltrarResultados.ParamByName('sn_encontrado').AsInteger := 0;
   end;

   // filtro Nome do candidato no Unimestre
   if ( Trim( ds_filtro_nome_unimestre ) <> '' ) then
   begin
      qryFiltrarResultados.SQL.Add( ds_condicoes_sql );
      qryFiltrarResultados.SQL.Add(
        ' ( pu.ds_nome LIKE "%'
        + ds_filtro_nome_unimestre
        + '%" OR '
        + ' pi.ds_nome LIKE "%'
        + ds_filtro_nome_unimestre
        + '%" ) '
      );
      ds_condicoes_sql := ' AND ';
   end;

   // filtro Pelo metodo de busca realizado
   if (Trim( ds_filtro_metodo_busca ) <> '') AND NOT
      (Trim( ds_filtro_metodo_busca ) = TRIM('Todos os encontrados')) AND NOT
      (ds_filtro_metodo_busca = 'Não Encontrados')  then
   begin

      qryFiltrarResultados.SQL.Add( ds_condicoes_sql );
      qryFiltrarResultados.SQL.Add(
         ' pi.ds_metodo = "'
         + ds_filtro_metodo_busca
         + '"'
      );
      ds_condicoes_sql := ' AND ';
   end;
   
   qryFiltrarResultados.SQL.Add( ' GROUP BY pi.ds_nome ' );

   qryFiltrarResultados.Open();

   // Seta como parametro o sn_encontrado para retornar a quantidade total de pessoas encontradas 
   qryQtdEncontrados.ParamByName('sn_encontrado').AsInteger := 1;
   qryQtdEncontrados.Open();

   total_registros_encontrados := (qryQtdEncontrados.FieldByName('qtdPessoasImportadas').AsInteger);
   total_registros_filtro := (qryFiltrarResultados.RecordCount);

   // Atualiza os Labels Com os totais
   lblTotalRegistrosEncontrados.Caption := (IntToStr(total_registros_encontrados));
   lblTotalRegistrosFiltro.Caption := (IntToStr(total_registros_filtro));

   gridPasso4.Columns[0].Visible := True;

   if (qryFiltrarResultados.RecordCount = 0 ) then
   begin
      gridPasso4.Columns[0].Visible := False;
   end;

   //if ( ds_filtro_metodo_busca <> 'Não Encontrados' ) then
   //begin
      qryFiltrarResultados.DisableControls();
      qryFiltrarResultados.First();

      while not qryFiltrarResultados.eof do
      begin
         if ( qryFiltrarResultados.FieldByName('encontrado').AsString = '1') then
         begin
            ASelList.Values[qryFiltrarResultados.FieldByName('codigo').asString] := '1';
         end;
         qryFiltrarResultados.Next;
      end;
//   end;
   gridPasso4.Repaint();
   qryFiltrarResultados.EnableControls();

   atualizarTotaisMarcados();
end;

procedure TfrmImportarDados.btnFiltrarFinalClick(Sender: TObject);
CONST
   SQL_BUSCA_FINAL =
   ' SELECT '
      + '   mt.anosemestre, '
      + '   pi.cd_pessoa_unimestre cd_pessoa, '
      + '   pi.ds_nome ds_nome, '
      + '   pi.nr_classificacao ds_classificacao, '
      + '   pi.ds_curso ds_curso, '
      + '   pi.ds_proposito ds_proposito_importacao, '
      + '  COALESCE(CONCAT( '
      + '         substr(p.ds_cpf,1,3), ".", '
      + '         substr(p.ds_cpf,4,3), '
      + '         ".", '
      + '         substr(p.ds_cpf,7,3), '
      + '         "-", '
      + '         substr(p.ds_cpf,10,2) '
      + '  ), "Não informado") ds_cpf, '
      + '   COALESCE(p.ds_identidade, "Não informado") ds_identidade, '
      + '   p_pai.nm_pessoa nm_pai, '
      + '   p_mae.nm_pessoa nm_mae, '
      + 'IF ( '
      + '   pu.ds_turma IS NOT NULL, '
      + '   pu.ds_turma, '
      + '   ( '
      + '      SELECT '
      + '         m.turma '
      + '      FROM '
      + '         matriculas m '
      + '      WHERE '
      + '         m.codigoaluno = pi.cd_pessoa_unimestre '
      + '      ORDER BY '
      + '         m.anosemestre DESC '
      + '      LIMIT 1 '
      + '   ) '
      + ') ds_turma, '
      + ' ( '
      + '   SELECT '
      + '      t.anosemestre '
      + '   FROM '
      + '      matriculas t '
      + '   WHERE '
      + '      pu.cd_pessoa_unimestre = t.codigoaluno '
      + '   ORDER BY '
      + '      t.anosemestre DESC '
      + '   LIMIT 1 '
      + ') nr_anosemestre, '
      + 'IF ( '
      + '   pu.ds_email IS NOT NULL, '
      + '   pu.ds_email, '
      + '   ( '
      + '      SELECT '
      + '         cp.ds_contato '
      + '      FROM '
      + '         contatos_pessoas cp '
      + '      WHERE '
      + '         cp.cd_pessoa = pi.cd_pessoa_unimestre '
      + '      AND cp.cd_contato = 4 '
      + '      LIMIT 1 '
      + '   ) '
      + ') ds_email, '
      + ' '
      + 'IF ( '
      + '   pu.ds_telefone IS NOT NULL, '
      + '   pu.ds_telefone, '
      + '   ( '
      + '      SELECT '
      + '         cp.ds_contato '
      + '      FROM '
      + '         contatos_pessoas cp '
      + '      WHERE '
      + '         cp.cd_pessoa = pi.cd_pessoa_unimestre '
      + '      AND cp.cd_contato = 1 '
      + '      LIMIT 1 '
      + '   ) '
      + ') ds_telefone, '
      + ' ( '
      + '   SELECT '
      + '      p.dt_nascimento '
      + '   FROM '
      + '      pessoas p '
      + '   WHERE '
      + '      p.cd_pessoa = pi.cd_pessoa_unimestre '
      + '   LIMIT 1 '
      + ') dt_nascimento, '
      + ' '
      + ' ( '
      + '   SELECT '
      + '      cp.ds_contato '
      + '   FROM '
      + '      contatos_pessoas cp '
      + '   WHERE '
      + '      cp.cd_pessoa = pi.cd_pessoa_unimestre '
      + '   AND cp.cd_contato = 3 '
      + '   LIMIT 1 '
      + ') ds_celular, '
      + '( '
      + '   SELECT '
      + '      cp.ds_contato  '
      + '   FROM '
      + '      contatos_pessoas cp '
      + '   WHERE '
      + '      cp.cd_pessoa = p.cd_pai '
      + '   AND cp.cd_contato = 3 '
      + '   LIMIT 1 '
      + ') ds_celular_pai, '
      + '( '
      + '   SELECT '
      + '      cp.ds_contato '
      + '   FROM '
      + '      contatos_pessoas cp '
      + '   WHERE '
      + '      cp.cd_pessoa = p.cd_mae '
      + '   AND cp.cd_contato = 3 '
      + '   LIMIT 1 '
      + ') ds_celular_mae, '
      + '( '
      + '   SELECT '
      + '      cp.ds_contato '
      + '   FROM '
      + '      contatos_pessoas cp '
      + '   WHERE '
      + '      cp.cd_pessoa = p.cd_resp_acad '
      + '   AND cp.cd_contato = 3 '
      + '   LIMIT 1 '
      + ') ds_celular_resp_acad, '
      + '( '
      + '      SELECT '
      + '         m.anosemestre '
      + '      FROM '
      + '         matriculas m '
      + '         INNER JOIN cursos_mestre cm ON ( cm.CD_CURSO = m.curso ) '
      + '      WHERE '
      + '         m.codigoaluno = pi.cd_pessoa_unimestre AND m.anosemestre <> mt.anosemestre '
      + '      ORDER BY '
      + '         m.anosemestre DESC , cm.NR_RELEVANCIA DESC '
      + '      LIMIT 1 '
      + ') anosemestre_anterior, '
      + '( '
      + '      SELECT '
      + '         COALESCE(m.turma, "Não informado" ) '
      + '      FROM '
      + '         matriculas m '
      + '         INNER Join cursos_mestre cm ON ( cm.CD_CURSO = m.curso ) '
      + '      WHERE '
      + '         m.codigoaluno = pi.cd_pessoa_unimestre AND m.anosemestre <> mt.anosemestre '
      + '      ORDER BY '
      + '         m.anosemestre DESC , cm.NR_RELEVANCIA DESC '
      + '      LIMIT 1 '
      + ') turma_anterior '
      + ' '
      + 'FROM '
      + '   pessoas_importadas pi '
      + 'LEFT JOIN pessoas_unimestre pu ON ( '
      + '   pi.cd_pessoa_unimestre = pu.cd_pessoa_unimestre '
      + ') '
      + 'LEFT JOIN pessoas p ON ( '
      + '   p.cd_pessoa = pi.cd_pessoa_unimestre '
      + ')  '
      + ' '
      + 'LEFT JOIN pessoas p_pai ON ( '
      + '   p_pai.cd_pessoa = p.cd_pai '
      + ') '
      + ' '
      + 'LEFT JOIN pessoas p_mae ON ( '
      + '   p_mae.cd_pessoa = p.cd_mae '
      + ') '
      + ' '
      + 'LEFT JOIN matriculas mt ON ( '
      + '   mt.codigoaluno = pi.cd_pessoa_unimestre AND '
      + '   mt.turma = pu.ds_turma '
      + ') '
      + ' '
      + 'WHERE '
      + '   pi.sn_encontrado = 1  ';

var
   ds_filtro_nome, ds_filtro_curso, ds_condicao_sql: String;
begin
   qryFiltroFinal.Close();

   ds_filtro_nome  := txtNomeFinal.Text;
   ds_filtro_curso := txtCursoFinal.Text;

   qryFiltroFinal.SQL.Clear();
   qryFiltroFinal.SQL.Add( SQL_BUSCA_FINAL  );

   ds_condicao_sql := ' AND ';

   if (TRIM(ds_filtro_nome) <> '') then
   begin
      qryFiltroFinal.SQL.Add(ds_condicao_sql);
      qryFiltroFinal.SQL.Add(
         ' pi.ds_nome LIKE "%'
         + ds_filtro_nome
         + '%"'
      );
      ds_condicao_sql := ' AND ';
   end;

   if (TRIM(ds_filtro_curso) <> '') then
   begin
      qryFiltroFinal.SQL.Add(ds_condicao_sql);
      qryFiltroFinal.SQL.Add(
         ' pi.ds_curso LIKE "%'
         + ds_filtro_curso
         + '%"'
      );
   end;

  qryFiltroFinal.SQL.Add( ' GROUP BY pi.ds_nome' );
  qryFiltroFinal.Open;
  atualizaQtdGridPassoFinal();
end;

procedure TfrmImportarDados.btnImprimirClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
   condicaoRelatorio, consultaCondicao: String;
   alias: TStringList;
   cd_pessoa_selecionado: Integer;
   data_str: String;
   myYear, myMonth, myDay : Word;
   dia, mes, ano: String;
   slFormulas : TStringList;
begin

   // mostra o Arquivo do relatorio
   infoRelatorio := PrincipalForm.GetInfoRpt('repListaAprovadosVestibular');
   sNomeRelatorio := 'repListaAprovadosVestibular.rpt';

 
   PrincipalForm.ImprimeRpt(
      sNomeRelatorio,
      -1,
      condicaoRelatorio,
      '',
      nil,
      nil,
      nil,
      nil,
      True,
      False,
      False
   );

   //qy.Locate('cd_pessoa', cd_pessoa_selecionado, [loCaseInsensitive]);
end;

procedure TfrmImportarDados.btnLimparCursoClick(Sender: TObject);
begin
   txtCursoFinal.Clear();
end;

procedure TfrmImportarDados.btnLimparFiltroFinalClick(Sender: TObject);
begin
   txtNomeFinal.Clear();
   txtCursoFinal.Clear();
end;

procedure TfrmImportarDados.btnLimparFiltrosClick(Sender: TObject);
begin
   txtNomeUnimestre.Clear();
   cbMetodo.ClearSelection();
end;

procedure TfrmImportarDados.tsConfirmarResultadosShow(Sender: TObject);
begin
   sn_acessouPasso4 := True;


   ASelList := TStringList.Create();
   atualizarTotaisMarcados();
   qryFiltrarResultados.Close();
   qryFiltrarResultados.ParamByName('sn_encontrado').AsInteger := 1; 
   qryFiltrarResultados.Open();
 
   qryFiltrarResultados.First();
   while not qryFiltrarResultados.Eof do
   begin
      if ( qryFiltrarResultados.FieldByName('encontrado').AsString = '1' ) then
      begin
         ASelList.Values[qryFiltrarResultados.FieldByName('codigo').asString] := '1';
      end;
      qryFiltrarResultados.Next;
   end;

   // Seta como parametro o sn_encontrado para retornar a quantidade total de pessoas encontradas
   qryQtdEncontrados.ParamByName('sn_encontrado').AsInteger := 1;
   qryQtdEncontrados.Close();
   qryQtdEncontrados.Open();

   lblTotalRegistrosEncontrados.Caption := (qryQtdEncontrados.FieldByName('qtdPessoasImportadas').AsString);
   lblTotalRegistrosFiltro.Caption := IntToStr(qryFiltrarResultados.RecordCount);

   if (qryFiltrarResultados.RecordCount = 0 ) then
   begin
      gridPasso4.Columns[0].Visible := False;
   end;

   txtNomeUnimestre.Clear;
   cbMetodo.ClearSelection;
end;

procedure TfrmImportarDados.tsGruposAlunosShow(Sender: TObject);
begin
   vstCursos.Clear;
   criarRegistro( vstCursos );
   vstCursos.Refresh;
   sn_acessouPasso2 := True;
   sn_acessouPasso4 := False;
   
   ckbMetodo2.checked := False;
   ckbMetodo3.checked := False;
   ckbMetodo4.checked := False;
end;

procedure TfrmImportarDados.vstCursosExpanding(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var Allowed: Boolean);
begin
   vstCursos.Expanded[Node] := Allowed;
end;

procedure TfrmImportarDados.vstCursosGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
   pFiltroGrid : PFiltrosGrid;
begin
   // Seta os valores para exibir VSTCURSOS (Componente)
   pFiltroGrid := PFiltrosGrid(Sender.GetNodeData(Node)^);
   
   case Column of
      0: CellText := '';
      1: CellText := pFiltroGrid.objFiltro.ds_curso;
      2: CellText := pFiltroGrid.objFiltro.cd_turma;
      3: CellText := IntToStr( pFiltroGrid.objFiltro.qtd_alunos );
   end;
end;

constructor TPessoasImportadas.Create(
      ds_nome1 : String;
      ds_curso1 : string;
      nr_classificado1 : integer
);
begin
   self.ds_nome := ds_nome1;
   self.ds_curso := ds_curso1;
   self.nr_classificado := nr_classificado1;
end;

// Atualiza o total de linhas marcadas na Grid
procedure TfrmImportarDados.atualizaEstimativa(
   sn_checado : Boolean;
   total_tempo : Double
);
begin

  if ( sn_checado = True ) then
  begin
      totalMinutos := totalMinutos + (total_tempo * totalPessoas);
  end
  else
  begin
     if ( totalMinutos > 0) then
     begin
        totalMinutos := totalMinutos - (total_tempo * totalPessoas);
     end;
  end;

  if totalMinutos < 0 then
  begin
   totalMinutos := 0;
  end;
  

   // Atualiza o label com a estimativa de tempo ao clicar no checkBOX
   lblQtdPessoas.Caption := (
      'Quantidade total de regitros a serem comparados: '
      +  FloatToStr(totalPessoas)
   );
   
end;

procedure TfrmImportarDados.atualizaQtdGridPassoFinal;
begin
   qryQtdFiltroFinal.Close();
   qryQtdFiltroFinal.Open();
   lblQtdTotalFiltro.Caption := qryQtdFiltroFinal.FieldByName('qtd_total_filtro').AsString;
end;

procedure TfrmImportarDados.atualizarTotaisMarcados;
begin
   qryMarcados.Close();
   qryMarcados.Open();
   lblTotalRegistrosMarcados.Caption := qryMarcados.FieldByName('qtdMarcados').AsString;
end;


function TfrmImportarDados.selecionaPai(
   cd_curso_pai_node : string;
   NodePai : PVirtualNode
) : Boolean;
var
   str_teste : String;
begin
   if (NodePai <> nil) then
   begin
      str_teste := PFiltrosGrid(vstCursos.GetNodeData(NodePai)^).objFiltro.cd_curso;

      // encontrou?
      if str_teste = cd_curso_pai_node then
      begin
          vstCursos.SetFocus;
          vstCursos.FocusedNode := NodePai;
          Result := true;
      end
      else
      begin
         // se nao encontrou
         // entao verifica no proximo Node
         selecionaPai(
            cd_curso_pai_node,
            vstCursos.GetNext(NodePai, false)
         );
         Result := false;

      end;
   end;

end;
end.
