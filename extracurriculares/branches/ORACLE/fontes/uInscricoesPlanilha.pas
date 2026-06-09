unit uInscricoesPlanilha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, Buttons,
  UZDataset, ZAbstractRODataset, ZAbstractDataset, ZDataset, UFGerarMens, uFSelecionarPessoa;

const
   MSG_CANC_ATIV = 'Cancelar Inscrição da atividade';
   MSG_CANC_INSC = 'Cancelar Inscrição do aluno';

type
   TUMTipoExclusao = (teAtividade, teInscricao);

  Tfrm_Inscricoes_Planilha = class(TForm)
    pnTitulo: TPanel;
    Panel4: TPanel;
    qryInscricoes: TUMZQuery;
    srcInscricoes: TDataSource;
    pmQtd: TPopupMenu;
    grd: TDBGrid;
    pnDatas: TPanel;
    bvTopo: TBevel;
    Label3: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    pmFiltroAtividades: TPopupMenu;
    odos1: TMenuItem;
    Selecionar1: TMenuItem;
    qryInscricoesField1: TStringField;
    qryInscricoesField2: TStringField;
    qryInscricoesField3: TStringField;
    qryInscricoesField4: TStringField;
    qryInscricoesField5: TStringField;
    bvInferior: TBevel;
    ImageList1: TImageList;
    tool: TToolBar;
    btModalidade: TToolButton;
    btTipoPessoa: TToolButton;
    btMes: TToolButton;
    ToolButton4: TToolButton;
    btPessoa: TToolButton;
    ToolButton5: TToolButton;
    btInscrever: TToolButton;
    btRenovarInscricao: TToolButton;
    ToolButton8: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    qryInscricoesField6: TStringField;
    qryInscricoesField7: TStringField;
    qryInscricoesField8: TStringField;
    qryInscricoesField9: TStringField;
    qryInscricoesField10: TStringField;
    qryInscricoesStringField11: TStringField;
    qryInscricoesField12: TStringField;
    qryInscricoesField13: TStringField;
    qryInscricoesField14: TStringField;
    qryInscricoesField15: TStringField;
    qryInscricoesField16: TStringField;
    qryInscricoesField17: TStringField;
    qryInscricoesField18: TStringField;
    qryInscricoesField19: TStringField;
    qryInscricoesField20: TStringField;
    qryInscricoesField21: TStringField;
    qryInscricoesField22: TStringField;
    qryInscricoesField23: TStringField;
    qryInscricoesField24: TStringField;
    qryInscricoesField25: TStringField;
    qryInscricoesField26: TStringField;
    qryInscricoesField27: TStringField;
    qryInscricoesField28: TStringField;
    qryInscricoesField29: TStringField;
    qryInscricoesField30: TStringField;
    pmFiltroTipoPessoa: TPopupMenu;
    pmFiltroMes: TPopupMenu;
    mes0: TMenuItem;
    N1: TMenuItem;
    mes1: TMenuItem;
    mes2: TMenuItem;
    mes3: TMenuItem;
    mes4: TMenuItem;
    mes5: TMenuItem;
    mes6: TMenuItem;
    mes7: TMenuItem;
    mes8: TMenuItem;
    mes9: TMenuItem;
    mes10: TMenuItem;
    mes11: TMenuItem;
    mes12: TMenuItem;
    qryInscricoesds_mes: TStringField;
    pmFiltroPessoa: TPopupMenu;
    odos2: TMenuItem;
    Selecionat1: TMenuItem;
    pmRenovar: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Rmes1: TMenuItem;
    Rmes2: TMenuItem;
    Rmes3: TMenuItem;
    Rmes4: TMenuItem;
    Rmes5: TMenuItem;
    Rmes6: TMenuItem;
    Rmes7: TMenuItem;
    Rmes8: TMenuItem;
    Rmes9: TMenuItem;
    Rmes10: TMenuItem;
    Rmes11: TMenuItem;
    Rmes12: TMenuItem;
    toolFinanceiro: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    btFinanceiro: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    qryInscricoesField31: TStringField;
    qryInscricoesField32: TStringField;
    qryInscricoesField33: TStringField;
    qryInscricoesField34: TStringField;
    qryInscricoesField35: TStringField;
    qryInscricoesField36: TStringField;
    qryInscricoesField37: TStringField;
    qryInscricoesField38: TStringField;
    qryInscricoesField39: TStringField;
    qryInscricoesField40: TStringField;
    qryInscricoesField41: TStringField;
    qryInscricoesField42: TStringField;
    qryInscricoesField43: TStringField;
    qryInscricoesField44: TStringField;
    qryInscricoesField45: TStringField;
    qryInscricoesField46: TStringField;
    qryInscricoesField47: TStringField;
    qryInscricoesField48: TStringField;
    qryInscricoesField49: TStringField;
    qryInscricoesField50: TStringField;
    qryInscricoesField51: TStringField;
    qryInscricoesField52: TStringField;
    qryInscricoesField53: TStringField;
    qryInscricoesField54: TStringField;
    qryInscricoesField55: TStringField;
    qryInscricoesField56: TStringField;
    qryInscricoesField57: TStringField;
    qryInscricoesField58: TStringField;
    qryInscricoesField59: TStringField;
    qryInscricoesField60: TStringField;
    qryInscricoesField61: TStringField;
    qryInscricoesField62: TStringField;
    qryInscricoesField63: TStringField;
    qryInscricoesField64: TStringField;
    qryInscricoesField65: TStringField;
    qryInscricoesField66: TStringField;
    qryInscricoesField67: TStringField;
    qryInscricoesField68: TStringField;
    qryInscricoesField69: TStringField;
    qryInscricoesField70: TStringField;
    qryInscricoesField71: TStringField;
    qryInscricoesField72: TStringField;
    qryInscricoesField73: TStringField;
    qryInscricoesField74: TStringField;
    qryInscricoesField75: TStringField;
    qryInscricoesField76: TStringField;
    qryInscricoesField77: TStringField;
    qryInscricoesField78: TStringField;
    qryInscricoesField79: TStringField;
    qryInscricoesField80: TStringField;
    qryInscricoesField81: TStringField;
    qryInscricoesField82: TStringField;
    qryInscricoesField83: TStringField;
    qryInscricoesField84: TStringField;
    qryInscricoesField85: TStringField;
    qryInscricoesField86: TStringField;
    qryInscricoesField87: TStringField;
    qryInscricoesField88: TStringField;
    qryInscricoesField89: TStringField;
    qryInscricoesField90: TStringField;
    qryInscricoesField91: TStringField;
    qryInscricoesField92: TStringField;
    qryInscricoesField93: TStringField;
    qryInscricoesField94: TStringField;
    qryInscricoesField95: TStringField;
    qryInscricoesField96: TStringField;
    qryInscricoesField97: TStringField;
    qryInscricoesField98: TStringField;
    qryInscricoesField99: TStringField;
    qryInscricoesField100: TStringField;
    popInscreverPaga: TMenuItem;
    PopInscreverIsenta: TMenuItem;
    popCancelarInscricao: TMenuItem;
    qryMatriculas: TUMZQuery;
    qyMatriculaAtividades: TUMZQuery;
    qyMatriculaAtividadesnr_anosemestre: TIntegerField;
    qyMatriculaAtividadescd_atividade: TIntegerField;
    qyMatriculaAtividadescd_pessoa: TIntegerField;
    qyMatriculaAtividadesnr_mes: TIntegerField;
    qyMatriculaAtividadesvl_atividade: TFloatField;
    qyMatriculaAtividadesds_observacao: TMemoField;
    qyMatriculaAtividadessn_paga: TSmallintField;
    qryMatriculasnm_pessoa: TStringField;
    qyInscricoesAtividades: TUMZQuery;
    qryRenova: TUMZQuery;
    qryInscricoesNM_PESSOA: TStringField;
    qryInscricoesNR_ANOSEMESTRE: TIntegerField;
    qryInscricoesCD_PESSOA: TIntegerField;
    qryInscricoesNR_MES: TIntegerField;
    qryInscricoesCD_TIPO_PESSOA: TIntegerField;
    qryInscricoesVL_TOTAL: TFloatField;
    qryInscricoesVL_DESCONTOS: TFloatField;
    qryInscricoesVL_PAGO: TFloatField;
    qryInscricoesDT_PAGAMENTO: TDateTimeField;
    qryInscricoesDT_EMISSAO: TDateTimeField;
    qryInscricoesCD_TURMA_MATRICULA: TStringField;
    qryAtividades: TUMZReadOnlyQuery;
    qryAtividadesCD_ATIVIDADE: TIntegerField;
    qryAtividadesDS_ATIVIDADE: TStringField;
    qryAtividadesDS_SIGLA: TStringField;
    qryMatriculasCD_PESSOA: TIntegerField;
    qryMatriculasNR_ANOSEMESTRE: TIntegerField;
    qryMatriculasNR_MES: TIntegerField;
    qryMatriculasCD_TIPO_PESSOA: TIntegerField;
    qryMatriculasVL_TOTAL: TFloatField;
    qryMatriculasVL_DESCONTOS: TFloatField;
    qryMatriculasVL_PAGO: TFloatField;
    qryMatriculasDT_EMISSAO: TDateTimeField;
    qryMatriculasDT_PAGAMENTO: TDateTimeField;
    qryMatriculasCD_TURMA_MATRICULA: TStringField;
    qryUpdValores: TUMZQuery;
    qryTiposPessoa: TUMZReadOnlyQuery;
    qryTiposPessoaCD_TIPO_PESSOA: TIntegerField;
    qryTiposPessoaDS_TIPO_PESSOA: TStringField;
    qryTiposPessoaSN_ATIVO: TSmallintField;
    qryTiposPessoaTP_PESSOA: TStringField;
    qryTiposPessoaDS_OBSERVACAO: TMemoField;
    procedure qryInscricoesBeforeOpen(DataSet: TDataSet);
    procedure qryInscricoesAfterClose(DataSet: TDataSet);
    procedure pmQtdPopup(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure popInscreverPagaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFecharClick(Sender: TObject);

    Procedure Filtra;
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure qryInscricoesCalcFields(DataSet: TDataSet);
    procedure btFecharClick(Sender: TObject);
    procedure btModalidadeClick(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure Selecionar1Click(Sender: TObject);
    procedure btTipoPessoaClick(Sender: TObject);
    Procedure SelecionaTipoPessoa( Sender: TObject );
    procedure mesClick(Sender: TObject);
    procedure RenovarInscriClick(Sender: TObject);
    procedure btMesClick(Sender: TObject);
    procedure odos2Click(Sender: TObject);
    procedure Selecionat1Click(Sender: TObject);
    procedure btPessoaClick(Sender: TObject);
    procedure btInscreverClick(Sender: TObject);
    procedure btRenovarInscricaoClick(Sender: TObject);
    procedure qryMatriculasAfterInsert(DataSet: TDataSet);
    procedure qyMatriculaAtividadesAfterInsert(DataSet: TDataSet);
    procedure btFinanceiroClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  strict private
    slListaAtividadesPessoas: TStringList;
    sFiltroListaAtividades: String;

    function getSnPaga(const cd_pessoa, cd_atividade, nr_mes: Integer): Integer;
    procedure setSnPaga(const cd_pessoa, cd_atividade, nr_mes, Value: Integer);

    property SnPaga[const cd_pessoa, cd_atividade, nr_mes: Integer]: Integer read getSnPaga write setSnPaga;
  private
    { Private declarations }
    FUMTipoExclusao: TUMTipoExclusao;
    procedure excluiMatriculaExtra(const AICodPessoa: integer; const AINrAnoSem: integer; const AINrMes: integer);
  public
    { Public declarations }

    Procedure Inscrever( iCodAtividade, iCodPessoa, iCodTipoPessoa, iMes, iAnoSemestre : integer; Paga : Boolean );
    Procedure CancelarInscricao( iCodAtividade, iCodPessoa, iCodTipoPessoa, iMes, iAnoSemestre : integer );


  end;

var
  frm_Inscricoes_Planilha: Tfrm_Inscricoes_Planilha;
  IAtividade, ITipoPessoa, IMes, IPessoa: integer;
  colunas: array[0..100] of integer;
  TipoPessoa, Mes: TMenuItem;

implementation

uses
   Main, uDM, Math, uSelAtividades, StrUtils, uInscrever, uUsuario;

{$R *.dfm}

procedure Tfrm_Inscricoes_Planilha.FormShow(Sender: TObject);
var
  Item: TMenuItem;
  wmes, wdia, wano : word;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  txtAnoSemestre.Text := IntToStr(ano_semestre);

  { Montando o Menu de tipos de pessoas }
  pmFiltroTipoPessoa.Items.Clear;

  Item := TMenuItem.Create(self);
  Item.Caption := 'Todos';
  Item.Name := 'i0';
  Item.OnClick := SelecionaTipoPessoa;
  Item.Checked := True;
  pmFiltroTipoPessoa.Items.Add(Item);
  TipoPessoa := Item;

  Item := TMenuItem.Create(self);
  Item.Caption := '-';
  pmFiltroTipoPessoa.Items.Add(Item);

  qryTiposPessoa.Close;
  qryTiposPessoa.Open;

  while not qryTiposPessoa.Eof do
  begin

    Item := TMenuItem.Create(self);
    Item.Caption := qryTiposPessoa.FieldByName('ds_tipo_pessoa').AsString;
    Item.Name := 'i' + qryTiposPessoa.FieldByName('cd_tipo_pessoa').AsString;
    Item.OnClick := SelecionaTipoPessoa;
    pmFiltroTipoPessoa.Items.Add(Item);

     qryTiposPessoa.Next;
  end;
  { / Montando o Menu de tipos de pessoas }

  { Habilitando/Desabilitando o botão financeiro de acordo com parâmetro }
  btFinanceiro.Enabled := DM.isTrue( DM.variavel_parametro('extra_sn_gerar_mensalidades') );
  
  DecodeDate(DataHoje, wano, wmes, wdia);

  IMes := wmes;

  mes0.Checked := False;
  mes1.Checked := False;
  mes2.Checked := False;
  mes3.Checked := False;
  mes4.Checked := False;
  mes5.Checked := False;
  mes6.Checked := False;
  mes7.Checked := False;
  mes8.Checked := False;
  mes9.Checked := False;
  mes10.Checked := False;
  mes11.Checked := False;
  mes12.Checked := False;

  Case wmes of

    1 : mes1.Checked := True;
    2 : mes2.Checked := True;
    3 : mes3.Checked := True;
    4 : mes4.Checked := True;
    5 : mes5.Checked := True;
    6 : mes6.Checked := True;
    7 : mes7.Checked := True;
    8 : mes8.Checked := True;
    9 : mes9.Checked := True;
    10 : mes10.Checked := True;
    11 : mes11.Checked := True;
    12 : mes12.Checked := True;

  end;

  Filtra;

end;

function Tfrm_Inscricoes_Planilha.getSnPaga(const cd_pessoa, cd_atividade, nr_mes: Integer): Integer;
var
   sChaveLista, valor : String;
begin
   sChaveLista := IntToStr( cd_pessoa ) + '_' +
                  IntToStr( cd_atividade ) + '_' + IntToStr( nr_mes );

   valor := trim(slListaAtividadesPessoas.Values[ sChaveLista ]);
   if (valor <> '1') AND (valor <> '0') then
   begin
      Result := -1;
   end else begin
      Result := StrToInt(valor);
   end;
end;

procedure Tfrm_Inscricoes_Planilha.grdDblClick(Sender: TObject);
Var
  posicao : TPoint;
begin
    GetCursorPos(posicao);
    pmQtd.Popup(posicao.X, posicao.Y);
end;

procedure Tfrm_Inscricoes_Planilha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   if slListaAtividadesPessoas <> nil then
      FreeAndNil(slListaAtividadesPessoas);
end;

procedure Tfrm_Inscricoes_Planilha.FormCreate(Sender: TObject);
begin
   IAtividade := 0;
   ITipoPessoa := 0;
   IPessoa := 0;
   ToolButton1.Enabled := DM.RequestPermission(
         'PlanilhaInscricoes.GerarMensalidades', npIncluir, False, Handle);

   ToolButton3.Enabled := DM.RequestPermission('ResgatarPagamentos',
         npAcesso, False, Handle);
end;

procedure Tfrm_Inscricoes_Planilha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         Filtra;
      VK_F12:
         btFechar.Click;
   end;
end;

procedure Tfrm_Inscricoes_Planilha.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Inscricoes_Planilha.Filtra;
const
   SOp = ' AND ';

   SWhere = 'WHERE ';
   
   SSQLInscricoes =
      'SELECT ' +
        'P.NM_PESSOA, ' +
        'EM.NR_ANOSEMESTRE, ' +
        'EM.CD_PESSOA, ' +
        'EM.NR_MES, ' +
        'EM.CD_TIPO_PESSOA, ' +
        'EM.VL_TOTAL, ' +
        'EM.VL_DESCONTOS, ' +
        'EM.VL_PAGO, ' +
        'EM.DT_PAGAMENTO, ' +
        'EM.DT_EMISSAO, ' +
        'EM.CD_TURMA_MATRICULA ' +
      'FROM '+
         'EXTRA_MATRICULAS EM ' +
            'JOIN PESSOAS P ON ' +
               '(EM.CD_PESSOA = P.CD_PESSOA) ' +
      '%s ' +
      'ORDER BY ' +
         'P.NM_PESSOA, ' +
         'EM.NR_MES';

   SFiltroAnoSem = 'EM.NR_ANOSEMESTRE = :NR_ANOSEMESTRE';

   SFiltroPessoa = 'EM.CD_PESSOA = :CD_PESSOA';

   SFiltroTipoPessoa = 'EM.CD_TIPO_PESSOA = :CD_TIPO_PESSOA';

   SFiltroMes = 'EM.NR_MES = :NR_MES';

   SFiltroAtividade =
      'WHERE EXISTS ' +
         '(' +
            'SELECT ' +
               'EMA.CD_ATIVIDADE ' +
            'FROM ' +
               'EXTRA_MATRICULAS_ATIVIDADES EMA ' +
            'WHERE ' +
               'EMA.NR_ANOSEMESTRE = EM.NR_ANOSEMESTRE AND ' +
               'EMA.CD_PESSOA = EM.CD_PESSOA AND ' +
               'EMA.NR_MES = EM.NR_MES AND ' +
               'EMA.CD_ATIVIDADE = :CD_ATIVIDADE' +
         ')' +
         'AND ';
var
   I: Integer;
   LParams: TParams;
   Filtros: string;

   ///   <summary>Adiciona um parâmetro de SQL à coleção de parâmetros
   ///   referenciada pelo objeto <c>LParams</c>, instância de <c>TParams</c>.
   ///   A coleção de parâmetros é lida posteriormente para substituir pelos
   ///   respectivos valores na consulta SQL</summary>
   ///
   ///   <param name="ParamName">Nome do parâmetro declarado na consulta SQL
   ///   sobre a qual deseja-se aplicar os filtros</param>
   ///   <param name="Value">Valor que será passado ao parâmetro da consulta
   ///   </param>
   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   // Remove da grade de informações todas as colunas existentes
   grd.Columns.Clear;

   // Adiciona as colunas fixas com as informações da pessoa, turma de matrícula
   // e o mês de inscrição na atividade extra-curricular
      
   with grd.Columns.Add do
   begin
      FieldName := 'CD_PESSOA';
      Title.Caption := 'Código';
   end;

   with grd.Columns.Add do
   begin
      FieldName := 'NM_PESSOA';
      Title.Caption := 'Nome';
      Width := 250;
   end;

   with grd.Columns.Add do
   begin
      FieldName := 'CD_TURMA_MATRICULA';
      Title.Caption := 'Turma';
      Width := 40;
   end;

   with grd.Columns.Add do
   begin
      FieldName := 'DS_MES';
      Title.Caption := 'Mês';
      Width := 60;
   end;

   // Resgata do banco de dados todas as atividades
   // extra-curriculares do ano/semestre corrente

   qryAtividades.Close;
   qryAtividades.ParamByName('NR_ANOSEMESTRE').AsString := txtAnoSemestre.Text;
   qryAtividades.Open;

   // Para cada atividade extra-curricular do ano/semestre corrente,
   // adiciona uma coluna à grade de informações

   I := grd.Columns.Count;
   while not qryAtividades.Eof do
   begin

      // Adiciona uma coluna para a atividade extra-curricular
      
      with grd.Columns.Add do
      begin
         FieldName := qryAtividadesCD_ATIVIDADE.AsString;
         Title.Caption := qryAtividadesDS_SIGLA.AsString;
         Title.Alignment := taCenter;
         Alignment := taCenter;
      end;

      // ?
      
      colunas[I] := qryAtividadesCD_ATIVIDADE.AsInteger;
      Inc(I);
      
      qryAtividades.Next;
   end;

   // Após adicionar as colunas das atividades extra-curriculares,
   // adiciona as colunas com informações de valores, descontos e
   // data de pagamento
   
   with grd.Columns.Add do
   begin
      FieldName := 'VL_TOTAL';
      Title.Caption := 'Vl. Total';
   end;

   with grd.Columns.Add do
   begin
      FieldName := 'VL_DESCONTOS';
      Title.Caption := 'Vl. Desconto';
   end;

   with grd.Columns.Add do
   begin
      FieldName := 'VL_PAGO';
      Title.Caption := 'Vl. Pago';
   end;

   with grd.Columns.Add do
   begin
      FieldName := 'DT_PAGAMENTO';
      Title.Caption := 'Data Pgto';
   end;

   // Verifica os filtros aplicados pelo usuário para montar o comando SQL para
   // consulta das informãções das atividades no banco de dados
      
   LParams := TParams.Create;
   try

      // Verifica se deseja filtrar por uma atividade específica
      
      if IAtividade > 0 then
      begin
         Filtros := SFiltroAtividade;
         AddParam('CD_ATIVIDADE', IAtividade);
      end
      else
         Filtros := SWhere;

      // Adiciona o filtro de ano/semestre
            
      Filtros := Filtros + SFiltroAnoSem;
      AddParam('NR_ANOSEMESTRE', txtAnoSemestre.Text);

      // Verifica se deseja filtrar uma pessoa
      
      if IPessoa > 0 then
      begin
         Filtros := Filtros + SOp + SFiltroPessoa;
         AddParam('CD_PESSOA', IPessoa);
      end;

      // Verifica filtro pelo tipo de pessoa

      if ITipoPessoa > 0 then
      begin
         Filtros := Filtros + SOp + SFiltroTipoPessoa;
         AddParam('CD_TIPO_PESSOA', ITipoPessoa);
      end;

      // Verifica se deseja filtrar o mês

      if IMes > 0 then
      begin
         Filtros := Filtros + SOp + SFiltroMes;
         AddParam('NR_MES', IMes);
      end;

      // Atribui a consulta SQL com o filtro selecionados
      
      qryInscricoes.Close;
      qryInscricoes.SQL.Text := Format(SSQLInscricoes, [Filtros]);

      // Substiui os parâmetros pelos valores filtrados pelo usuário
      sFiltroListaAtividades := '1=1';
      for I := 0 to LParams.Count - 1 do
      begin
         qryInscricoes.ParamByName(LParams.Items[I].Name).Value :=
               LParams.Items[I].Value;

         if LParams.Items[I].Name = 'CD_ATIVIDADE' then
         begin
            sFiltroListaAtividades := sFiltroListaAtividades +
            ' AND ema.' + LParams.Items[I].Name + ' = ' + QuotedStr(LParams.Items[I].Value);
         end else begin
            sFiltroListaAtividades := sFiltroListaAtividades +
            ' AND em.' + LParams.Items[I].Name + ' = ' + QuotedStr(LParams.Items[I].Value);
         end;

      end;
   finally
      LParams.Free;
   end;

   qryInscricoes.Open;
end;

procedure Tfrm_Inscricoes_Planilha.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text)
  else
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);

  Filtra;
end;

procedure Tfrm_Inscricoes_Planilha.qryInscricoesAfterClose(DataSet: TDataSet);
begin
   if slListaAtividadesPessoas <> nil then
      slListaAtividadesPessoas.Clear();
end;

procedure Tfrm_Inscricoes_Planilha.qryInscricoesBeforeOpen(DataSet: TDataSet);
const
   SQL_LISTA_ATIVIDADES_PESSOAS =
      ' SELECT ema.cd_atividade, ema.sn_paga, em.cd_pessoa, em.nr_mes ' +
      ' FROM extra_matriculas em ' +
      '      INNER JOIN extra_matriculas_atividades ema ON ( ' +
		'         ema.nr_anosemestre = em.nr_anosemestre AND ' +
      '         ema.cd_pessoa = em.cd_pessoa AND ' +
      '         ema.nr_mes = em.nr_mes ) ' +
      ' WHERE %s';
var
   qyListaAtividadesPessoas: TUMZQuery;
begin
   DM.CriarConsulta(qyListaAtividadesPessoas);
   qyListaAtividadesPessoas.SQL.Text := Format( SQL_LISTA_ATIVIDADES_PESSOAS, [sFiltroListaAtividades] );
   qyListaAtividadesPessoas.Open();

   if slListaAtividadesPessoas = nil then
      slListaAtividadesPessoas :=  TStringList.Create
   else
      slListaAtividadesPessoas.Clear;

   { Se a query não é vazia, preenche o StringList com as informações }
   if not qyListaAtividadesPessoas.Eof then
   begin
      while not qyListaAtividadesPessoas.Eof do
      begin
         SnPaga[ qyListaAtividadesPessoas.FieldByName('cd_pessoa').AsInteger,
                 qyListaAtividadesPessoas.FieldByName('cd_atividade').AsInteger,
                 qyListaAtividadesPessoas.FieldByName('nr_mes').AsInteger ] := qyListaAtividadesPessoas.FieldByName('sn_paga').AsInteger;

         qyListaAtividadesPessoas.Next;
      end;
   end;

   FreeAndNil( qyListaAtividadesPessoas );
end;

procedure Tfrm_Inscricoes_Planilha.qryInscricoesCalcFields(
  DataSet: TDataSet);
var
  i: integer;
begin
   qryInscricoesds_mes.AsString :=
         LongMonthNames[qryInscricoes.FieldByName('nr_mes').AsInteger];

  for i := 4 to grd.Columns.Count-5 do
  begin
    try
      if (colunas[i] > 0 ) AND
            ( SnPaga[ qryInscricoes.FieldByName('cd_pessoa').AsInteger,
               colunas[i], qryInscricoes.FieldByName('nr_mes').AsInteger ] > -1 ) then
        if SnPaga[ qryInscricoes.FieldByName('cd_pessoa').AsInteger,
                   colunas[i], qryInscricoes.FieldByName('nr_mes').AsInteger ] = 1 then
           qryInscricoes.FieldByName(IntToStr(colunas[i])).AsString := 'P'
        else
           qryInscricoes.FieldByName(IntToStr(colunas[i])).AsString := 'I'
    except
    end;

  end;

end;

procedure Tfrm_Inscricoes_Planilha.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Inscricoes_Planilha.btModalidadeClick(Sender: TObject);
begin
   btModalidade.CheckMenuDropdown;
end;

procedure Tfrm_Inscricoes_Planilha.odos1Click(Sender: TObject);
begin

  TMenuItem( Sender ).Checked := True;
  Selecionar1.Checked := False;

  IAtividade := 0;
  btModalidade.Marked := False;

  Filtra;

end;

procedure Tfrm_Inscricoes_Planilha.Selecionar1Click(Sender: TObject);
begin

  frm_SelAtividades.txtAnoSemestre.Text := txtAnoSemestre.Text;
  frm_SelAtividades.ShowModal;
  if frm_SelAtividades.flgSearch then
  Begin
    TMenuItem( Sender ).Checked := True;
    Selecionat1.Checked := False;
    odos1.Checked := False;
    odos2.Checked := True;

    IAtividade := frm_SelAtividades.qyAtividades.FieldByName('cd_atividade').AsInteger;
    IPessoa := 0;
    btModalidade.Marked := True;
    btPessoa.Marked := False;
    Filtra;
  end;

end;

procedure Tfrm_Inscricoes_Planilha.btTipoPessoaClick(Sender: TObject);
begin
   btTipoPessoa.CheckMenuDropdown;
end;

Procedure Tfrm_Inscricoes_Planilha.SelecionaTipoPessoa( Sender: TObject );
begin
  TipoPessoa.Checked := False;
  TMenuItem( Sender ).Checked := True;
  ITipoPessoa := StrToInt( MidStr(TMenuItem( Sender ).Name, 2, Length(TMenuItem( Sender ).Name)) );
  TipoPessoa := TMenuItem( Sender );

  if TMenuItem( Sender ).Name = 'i0' then
    btTipoPessoa.Marked := False
  else
    btTipoPessoa.Marked := True;

  Filtra;
end;

procedure Tfrm_Inscricoes_Planilha.setSnPaga(const cd_pessoa, cd_atividade, nr_mes, Value: Integer);
var
   sChaveLista : String;
begin
   sChaveLista := IntToStr( cd_pessoa ) + '_' +
                  IntToStr( cd_atividade ) + '_' + IntToStr( nr_mes );

   slListaAtividadesPessoas.Values[ sChaveLista ] := IntToStr(Value);
end;

procedure Tfrm_Inscricoes_Planilha.mesClick(Sender: TObject);
begin
 // Mes.Checked := False;

  mes0.Checked := False;
  mes1.Checked := False;
  mes2.Checked := False;
  mes3.Checked := False;
  mes4.Checked := False;
  mes5.Checked := False;
  mes6.Checked := False;
  mes7.Checked := False;
  mes8.Checked := False;
  mes9.Checked := False;
  mes10.Checked := False;
  mes11.Checked := False;
  mes12.Checked := False;

  
  TMenuItem( Sender ).Checked := True;
  IMes := StrToInt( MidStr(TMenuItem( Sender ).Name, 4, Length(TMenuItem( Sender ).Name)) );
  Mes := TMenuItem( Sender );

  if TMenuItem( Sender ).Name = 'mes0' then
    btMes.Marked := False
  else
    btMes.Marked := True;

  Filtra;
end;

procedure Tfrm_Inscricoes_Planilha.RenovarInscriClick(Sender: TObject);
const
   SQuest =
         'Tem certeza que deseja transferir todas as inscrições ' +
         'selecionadas para o novo mês?';

   SSQLMatriculas =
         'SELECT ' +
            'CD_PESSOA,' +
            'NR_ANOSEMESTRE,' +
            'NR_MES,' +
            'CD_TIPO_PESSOA,' +
            'VL_TOTAL,' +
            'VL_DESCONTOS,' +
            'VL_PAGO,' +
            'DT_EMISSAO,' +
            'DT_PAGAMENTO,' +
            'CD_TURMA_MATRICULA ' +
         'FROM ' +
            'EXTRA_MATRICULAS ' +
         'WHERE ' +
            'NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
            'NR_MES = :NR_MES %s';

   SFiltroPessoa = 'AND CD_PESSOA = :CD_PESSOA';
var
   TotalAtividades, NovoMes: Integer;
   ValorTotal, ValorDesconto, DescontoExtra: Currency;
begin
   // A renovação só pode ser realizada se um mês ou pessoa foi selecionado
    
   if (IMes + IPessoa) > 0 then
   begin

      // Solicita confirmação do usuário para realizar a renovação
      
      if MessageBox(Handle, PChar(SQuest), PChar('Confimação'), MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin

         // Obtém o mês selecionado para a renovação da inscrição
         NovoMes := TMenuItem(Sender).Tag;

         // Resgata as matrículas para os filtros aplicados
         
         qryMatriculas.Close;
         if IPessoa <> 0 then
         begin
            qryMatriculas.SQL.Text := Format(SSQLMatriculas, [SFiltroPessoa]);
            qryMatriculas.ParamByName('CD_PESSOA').AsInteger := IPessoa;
         end
         else
            qryMatriculas.SQL.Text := Format(SSQLMatriculas, [EmptyStr]);

         qryMatriculas.ParamByName('NR_ANOSEMESTRE').AsInteger :=
               qryInscricoesNR_ANOSEMESTRE.AsInteger;
         qryMatriculas.ParamByName('NR_MES').AsInteger := NovoMes;
         qryMatriculas.Open;

         // Percorre as inscrições para realizar a renovação

         qryInscricoes.First;
         while not qryInscricoes.Eof do
         begin
         
            // Para cada inscrição encontrada realiza uma nova matrícula
            
            qryMatriculas.Insert;
            qryMatriculasCD_PESSOA.AsInteger :=
                  qryInscricoesCD_PESSOA.AsInteger;
            qryMatriculasNR_ANOSEMESTRE.AsInteger :=
                  qryInscricoesNR_ANOSEMESTRE.AsInteger;
            qryMatriculasNR_MES.AsInteger := NovoMes;
            qryMatriculasCD_TIPO_PESSOA.AsInteger :=
                  qryInscricoesCD_TIPO_PESSOA.AsInteger;
            qryMatriculasCD_TURMA_MATRICULA.AsString :=
                  qryInscricoesCD_TURMA_MATRICULA.AsString;



            // Tenta realizar a transação
            
            try
               qryMatriculas.Post;
            except
               on E: EZDatabaseError do
                  qryMatriculas.Cancel;
            end;

            // Realiza a renovação inserindo uma nova matrícula na atividade
            
            qryRenova.ParamByName('MES_RENOVAR').AsInteger := NovoMes;
            qryRenova.ParamByName('NR_ANOSEMESTRE').AsString :=
                  qryInscricoesNR_ANOSEMESTRE.AsString;
            qryRenova.ParamByName('NR_MES').AsInteger :=
                  qryInscricoesNR_MES.AsInteger;
            qryRenova.ParamByName('CD_PESSOA').AsInteger :=
                  qryInscricoesCD_PESSOA.AsInteger;

            qryRenova.ExecSQL;


            // Atualiza os valores da atividade
            
            TotalAtividades := DM.BuscarNroAtividades(
                  qryInscricoesNR_ANOSEMESTRE.AsInteger,
                  qryInscricoesCD_PESSOA.AsInteger, NovoMes
            );
            ValorTotal := DM.BuscarValorBruto(
                  qryInscricoesNR_ANOSEMESTRE.AsInteger,
                  qryInscricoesCD_PESSOA.AsInteger, NovoMes,
                  qryInscricoesCD_TIPO_PESSOA.AsInteger
            );
            ValorDesconto := DM.BuscarValorDesconto(
                  qryInscricoesNR_ANOSEMESTRE.AsInteger, TotalAtividades,
                  qryInscricoesCD_TIPO_PESSOA.AsInteger, ValorTotal
            );
            DescontoExtra := DM.BuscarDescontoExtra(
                  qryInscricoesNR_ANOSEMESTRE.AsInteger, TotalAtividades,
                  qryInscricoesCD_TIPO_PESSOA.AsInteger
            );
            ValorTotal := ValorTotal - DescontoExtra;

            if ValorTotal = ValorDesconto then
            begin
               ValorTotal := 0;
               ValorDesconto := 0;
            end;

            qryUpdValores.ParamByName('CD_PESSOA').AsInteger :=
                  qryInscricoesCD_PESSOA.AsInteger;
            qryUpdValores.ParamByName('NR_ANOSEMESTRE').AsInteger :=
                  qryInscricoesNR_ANOSEMESTRE.AsInteger;
            qryUpdValores.ParamByName('NR_MES').AsInteger :=
                  qryInscricoesNR_MES.AsInteger;
            qryUpdValores.ParamByName('VL_TOTAL').AsFloat := ValorTotal;
            qryUpdValores.ParamByName('VL_DESCONTO').AsFloat := ValorDesconto;
            qryUpdValores.ExecSQL;
            
            qryInscricoes.Next;
         end;
      end;
   end;
   
   Filtra;
end;

procedure Tfrm_Inscricoes_Planilha.btMesClick(Sender: TObject);
begin
   btMes.CheckMenuDropdown;
end;

procedure Tfrm_Inscricoes_Planilha.odos2Click(Sender: TObject);
begin

  TMenuItem( Sender ).Checked := True;
  Selecionat1.Checked := False;

  IPessoa := 0;
  btPessoa.Marked := False;

  Filtra;

end;

procedure Tfrm_Inscricoes_Planilha.pmQtdPopup(Sender: TObject);
Var
    iCodAtividade : integer;
    iColuna : integer;
begin
  popCancelarInscricao.Caption := MSG_CANC_ATIV;
  iColuna := grd.SelectedIndex;
  iCodAtividade := colunas[iColuna];

  if iCodAtividade > 0 then begin
      Dm.qyAux1.Close();
      Dm.qyAux1.SQL.Text := ' ' +
        'SELECT ' +
          'a.ds_atividade, m.sn_paga ' +
        'FROM ' +
          'extra_matriculas_atividades m ' +
            'INNER JOIN extra_atividades a ON (m.cd_atividade = a.cd_atividade AND m.nr_anosemestre = a.nr_anosemestre) ' +
        'WHERE ' +
          'm.cd_atividade = :cd_atividade AND ' +
          'm.cd_pessoa = :cd_pessoa AND ' +
          'm.nr_mes = :nr_mes AND ' +
          'm.nr_anosemestre = :nr_anosemestre';
      DM.qyAux1.ParamByName('cd_atividade').AsInteger := iCodAtividade;
      DM.qyAux1.ParamByName('cd_pessoa').AsInteger := qryInscricoes.FieldByName('cd_pessoa').AsInteger;
      DM.qyAux1.ParamByName('nr_mes').AsInteger := qryInscricoes.FieldByName('nr_mes').AsInteger;
      DM.qyAux1.ParamByName('nr_anosemestre').AsString := txtAnoSemestre.Text;
      DM.qyAux1.Open();
      if Dm.qyAux1.Eof then begin
         popCancelarInscricao.Enabled := False;
      end
      else begin
         popCancelarInscricao.Enabled := True;
      end;
      Self.FUMTipoExclusao := teAtividade;
  end
  else
  begin
    if iColuna in[0, 1] then
    begin
      popCancelarInscricao.Caption := MSG_CANC_INSC;
      popCancelarInscricao.Enabled := True;
      Self.FUMTipoExclusao := teInscricao;
    end
    else
    begin
      popCancelarInscricao.Enabled := False;
    end;
  end;
end;

procedure Tfrm_Inscricoes_Planilha.Selecionat1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa; 
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);
   
   if resultado.filtrado then
   Begin
    TMenuItem( Sender ).Checked := True;
    Selecionar1.Checked := False;
    odos1.Checked := True;
    odos2.Checked := False;

    IPessoa := resultado.cd_pessoa;
    IAtividade := 0;
    btPessoa.Marked := True;
    btModalidade.Marked := False;
    Filtra;
  end;

end;

procedure Tfrm_Inscricoes_Planilha.btPessoaClick(Sender: TObject);
begin
   btPessoa.CheckMenuDropdown;
end;

procedure Tfrm_Inscricoes_Planilha.btInscreverClick(Sender: TObject);
begin
   if DM.RequestPermission('PlanilhaInscricoes', npIncluir, True, Handle) then
   begin
      if not PrincipalForm.ProcuraForm(frm_Inscrever) then
         Application.CreateForm(Tfrm_Inscrever, frm_Inscrever);

      frm_Inscrever.iMes := IMes;
      frm_Inscrever.ShowModal;

      Filtra;
   end;
end;

procedure Tfrm_Inscricoes_Planilha.btRenovarInscricaoClick(
  Sender: TObject);
const
   SCaptionAtencao = 'Atenção';
   SMsgSemFiltro =
         'É necessário efetuar um filtro no mês ou na pessoa para renovar ' +
         'inscrições.';
begin
   if (IMes = 0) and (IPessoa = 0) then
      MessageBox(Handle, PChar(SMsgSemFiltro), PChar(SCaptionAtencao),
         MB_ICONWARNING + MB_OK)
   else
      btRenovarInscricao.CheckMenuDropdown;
end;

procedure Tfrm_Inscricoes_Planilha.qryMatriculasAfterInsert(
  DataSet: TDataSet);
begin

  qryMatriculas.FieldByName('dt_emissao').AsString := DateToStr( DataHoje );
  qryTiposPessoa.Open;

end;

procedure Tfrm_Inscricoes_Planilha.qyMatriculaAtividadesAfterInsert(
  DataSet: TDataSet);
begin

  qyMatriculaAtividades.FieldByName('nr_anosemestre').AsInteger := qryMatriculas.FieldByName('nr_anosemestre').AsInteger;
  qyMatriculaAtividades.FieldByName('cd_pessoa').AsInteger := qryMatriculas.FieldByName('cd_pessoa').AsInteger;

end;

procedure Tfrm_Inscricoes_Planilha.btFinanceiroClick(Sender: TObject);
begin

  toolFinanceiro.Visible := not toolFinanceiro.Visible;
  btFinanceiro.Marked := not btFinanceiro.Marked; 

end;

procedure Tfrm_Inscricoes_Planilha.ToolButton1Click(Sender: TObject);
begin
      { Se não existir filtro de mês, avisa que para renovar o mesmo é necessário }
      if ((IMes = 0) and (IPessoa = 0)) or qryInscricoes.IsEmpty  then
      begin
         MessageBox(Handle, PChar('É necessário efetuar um filtro no mês ou na pessoa para gerar mensalidades.'), PChar('Atenção'), MB_ICONWARNING + MB_OK);
         Exit;
      end;

      if not PrincipalForm.ProcuraForm(fGerarMens) then
      Application.CreateForm(TfGerarMens, fGerarMens);

      fGerarMens.ShowModal;
      Filtra;
end;

procedure Tfrm_Inscricoes_Planilha.ToolButton3Click(Sender: TObject);
begin
   DM.ResgataPagamentos;
   Filtra;
   MessageBox(Handle, PChar('Pagamentos resgatados com sucesso !'),
         PChar('Informação'), MB_ICONINFORMATION + MB_OK);
end;

Procedure Tfrm_Inscricoes_Planilha.Inscrever( iCodAtividade, iCodPessoa, iCodTipoPessoa, iMes, iAnoSemestre : integer; Paga : Boolean  );
var
  iQtdAtividades : Integer;
  cValorAtividade : Currency;
  cValorTotal : Currency;
  cVAlorDesconto : Currency;
  cDescontoExtra : Currency;
Begin

  frm_Inscricoes_Planilha.Cursor := crHourGlass;

  with DM.qyAux2 do begin

    Close;
    SQL.Text := ' ' +
      'SELECT ' +
        'vl_atividade ' +
      'FROM ' +
        'extra_valores_pessoas ' +
      'WHERE ' +
        'cd_atividade = :cd_atividade AND ' +
        'nr_anosemestre = :nr_anosemestre AND ' +
        'cd_tipo_pessoa = :cd_tipo_pessoa';
    ParamByName('cd_atividade').AsInteger := iCodAtividade;
    ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
    ParamByName('cd_tipo_pessoa').AsInteger := iCodTipoPessoa;
    Open;

    cValorAtividade := FieldByName('vl_atividade').AsCurrency;

  end;

  with qyInscricoesAtividades do begin

    // Inscrevendo na atividade
      ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
      ParamByName('cd_atividade').AsInteger := iCodAtividade;
      ParamByName('cd_pessoa').AsInteger := iCodPessoa;
      ParamByName('nr_mes').AsInteger := iMes;
      ParamByName('vl_atividade').AsFloat := cValorAtividade;
      if Paga then
         ParamByName('sn_paga').AsInteger := 1
      else
         ParamByName('sn_paga').AsInteger := 0;


      ExecSQL;

      // Atualizar o Valor Total e os descontos

      iQtdAtividades :=  Dm.BuscarNroAtividades(iAnoSemestre, iCodPessoa, iMes );
      cValorTotal    :=  Dm.BuscarValorBruto(iAnoSemestre, iCodPessoa, iMes, iCodTipoPessoa );
      cValorDesconto :=  Dm.BuscarValorDesconto(iAnoSemestre, iQtdAtividades , iCodTipoPessoa, cValorTotal );
      cDescontoExtra :=  Dm.BuscarDescontoExtra(iAnoSemestre, iQtdAtividades , iCodTipoPessoa );

      cValorTotal := cValorTotal - cDescontoExtra;

        if cValorTotal = cVAlorDesconto then begin
           cValorTotal := 0;
           cValorDesconto := 0;
        end;


      // Atualizar o valor para o Mes atual

      with DM.qyAux2 do begin

           Close;
           SQL.Clear;
           SQL.Add(
            ' UPDATE extra_matriculas                          ' +
            ' SET vl_total = :VlTotal, vl_descontos = :VlDesconto ' +
            ' WHERE cd_pessoa = :CdPessoa AND nr_anosemestre = :NrAnoSemestre AND nr_mes = :NrMes '
           );

           ParambyName('CdPessoa').AsInteger := iCodPessoa;
           ParamByName('NrAnoSemestre').AsInteger := iAnoSemestre;
           ParamByName('NrMes').AsInteger := iMes;
           ParamByName('VlTotal').AsFloat := cValorTotal;
           ParamByName('VlDesconto').AsFloat := cValorDesconto;
           ExecSQL;

      end;

  end;

  frm_Inscricoes_Planilha.Cursor := crDefault;

End;

procedure Tfrm_Inscricoes_Planilha.popInscreverPagaClick(
  Sender: TObject);
var
  iColuna : integer;
  iCodAtividade : integer;
  sCampo : string;
  acao : Integer;
begin
  iColuna := grd.SelectedIndex;
  iCodAtividade := colunas[iColuna];

  sCampo := grd.Columns[grd.SelectedIndex].FieldName;

  acao := TMenuItem(Sender).Tag;

  if acao = 1 then begin

        if Mensagem( 'Deseja inscrever uma atividade PAGA para o aluno '+qryInscricoes.FieldByName('nm_pessoa').AsString+'?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
          Inscrever(iCodAtividade,qryInscricoes.FieldByName('cd_pessoa').AsInteger,qryInscricoes.FieldByName('cd_tipo_pessoa').AsInteger,qryInscricoes.FieldByName('nr_mes').AsInteger,StrToInt(txtAnoSemestre.Text), True);
          qryInscricoes.Close;
          qryInscricoes.Open;
        end;

  end
  else if acao = 2 then begin

        if Mensagem( 'Deseja inscrever uma atividade ISENTA para o aluno '+qryInscricoes.FieldByName('nm_pessoa').AsString+'?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
          Inscrever(iCodAtividade,qryInscricoes.FieldByName('cd_pessoa').AsInteger,qryInscricoes.FieldByName('cd_tipo_pessoa').AsInteger,qryInscricoes.FieldByName('nr_mes').AsInteger,StrToInt(txtAnoSemestre.Text), False);
          qryInscricoes.Close;
          qryInscricoes.Open;
        end;

  end else begin

    case Self.FUMTipoExclusao of
       teAtividade:
       begin
         if Mensagem( 'Deseja cancelar a inscrição do aluno '+qryInscricoes.FieldByName('nm_pessoa').AsString+' da atividade: '+ Dm.qyAux1.FieldByName('ds_atividade').AsString+' ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
           CancelarInscricao(iCodAtividade,qryInscricoes.FieldByName('cd_pessoa').AsInteger,qryInscricoes.FieldByName('cd_tipo_pessoa').AsInteger,qryInscricoes.FieldByName('nr_mes').AsInteger,StrToInt(txtAnoSemestre.Text));
           qryInscricoes.Close;
           qryInscricoes.Open;
         end;
       end;
       teInscricao:
       begin
         if Mensagem('Deseja cancelar a inscrição do aluno '+qryInscricoes.FieldByName('nm_pessoa').AsString+' no mês: '+ qryInscricoes.FieldByName('nr_mes').AsString+' ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
         begin
           Self.excluiMatriculaExtra(
             Self.qryInscricoes.FieldByName('cd_pessoa').AsInteger,
             Self.qryInscricoes.FieldByName('nr_anosemestre').AsInteger,
             Self.qryInscricoes.FieldByName('nr_mes').AsInteger);
             qryInscricoes.Close;
             qryInscricoes.Open;
         end;
       end;
    end;

  end;

end;

Procedure Tfrm_Inscricoes_Planilha.CancelarInscricao( iCodAtividade, iCodPessoa, iCodTipoPessoa, iMes, iAnoSemestre : integer );
var
  iQtdAtividades : Integer;
  cValorTotal : Currency;
  cValorDesconto : Currency;
  cDescontoExtra : Currency;
Begin

  frm_Inscricoes_Planilha.Cursor := crHourGlass;


  with DM.qyAux1 do begin

    // Cancelando inscrição na atividade
    Close;
    SQL.Text := ' ' +
      'DELETE FROM extra_matriculas_atividades ' +
      'WHERE ' +
        'nr_anosemestre = :nr_anosemestre AND ' +
        'cd_atividade = :cd_atividade AND ' +
        'cd_pessoa = :cd_pessoa AND ' +
        'nr_mes = :nr_mes ';

    ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
    ParamByName('cd_atividade').AsInteger := iCodAtividade;
    ParamByName('cd_pessoa').AsInteger := iCodPessoa;
    ParamByName('nr_mes').AsInteger := iMes;
    ExecSQL;

  end;

  // Atualizar o Valor Total e os descontos

  iQtdAtividades :=  Dm.BuscarNroAtividades(iAnoSemestre, iCodPessoa, iMes );

  if iQtdAtividades > 0 then begin

      cValorTotal :=     Dm.BuscarValorBruto(iAnoSemestre, iCodPessoa, iMes, iCodTipoPessoa );
      cValorDesconto :=  Dm.BuscarValorDesconto(iAnoSemestre, iQtdAtividades , iCodTipoPessoa, cValorTotal );
      cDescontoExtra :=  Dm.BuscarDescontoExtra(iAnoSemestre, iQtdAtividades , iCodTipoPessoa );

      cValorTotal := cValorTotal - cDescontoExtra;

      if cValorTotal = cVAlorDesconto then begin
         cValorTotal := 0;
         cValorDesconto := 0;
      end;


      // Atualizar o valor para o Mes atual

      with DM.qyAux2 do begin

         Close;
         SQL.Clear;
         SQL.Add(
          ' UPDATE extra_matriculas                          ' +
          ' SET vl_total = :VlTotal, vl_descontos = :VlDesconto ' +
          ' WHERE cd_pessoa = :CdPessoa AND nr_anosemestre = :NrAnoSemestre AND nr_mes = :NrMes '
         );

         ParambyName('CdPessoa').AsInteger := iCodPessoa;
         ParamByName('NrAnoSemestre').AsInteger := iAnoSemestre;
         ParamByName('NrMes').AsInteger := iMes;
         ParamByName('VlTotal').AsFloat := cValorTotal;
         ParamByName('VlDesconto').AsFloat := cValorDesconto;
         ExecSQL;

      end;

  end
  else begin
      with DM.qyAux2 do begin

         Close;
         SQL.Clear;
         SQL.Add(
          ' DELETE FROM extra_matriculas ' +
          ' WHERE ' +
            'nr_anosemestre = :nr_anosemestre AND ' +
            'cd_pessoa = :cd_pessoa AND ' +
            'nr_mes = :nr_mes '
          );

         ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
         ParamByName('cd_pessoa').AsInteger := iCodPessoa;
         ParamByName('nr_mes').AsInteger := iMes;
         ExecSQL;
      end;
  end;

  frm_Inscricoes_Planilha.Cursor := crDefault;

End;

procedure Tfrm_Inscricoes_Planilha.excluiMatriculaExtra(const AICodPessoa,
  AINrAnoSem, AINrMes: integer);
const
   MSG_TEM_ATIVS =
      'O aluno possui inscrições em atividades neste mês.'+
      'A exclusão da inscrição do aluno no mês implicará na exclusão dessas atividades.' +
      #13 + 'Deseja prosseguir?';
   MSG_SEM_EXC =
      'O processo de exclusão foi cancelado.';
   MSG_EXC_SUCESSO =
      'A exclusão da inscrição do aluno no mês foi efetuada com sucesso!';
   MSG_ERRO_EXC_ATIVS =
      'Ocorreu um erro ao tentar efetuar a exclusão das atividades do aluno!';
   MSG_ERRO_EXC_INSC =
      'Ocorreu um erro ao tentar efetuar a exclusão da inscrição do aluno no mês!';
   MSG_ERRO_EXC =
      'Não foi possível efetuar a exclusão da inscrição do aluno no mês!';
   SQL_VER_ATIVS =
      'SELECT '+
         'COUNT(*) AS atividades '+
      'FROM '+
         'extra_matriculas_atividades '+
      'WHERE '+
         'nr_anosemestre = :nr_anosemestre AND '+
         'cd_pessoa = :cd_pessoa AND '+
         'nr_mes = :nr_mes';
   SQL_EXC_ATIVS =
      'DELETE FROM '+
         'extra_matriculas_atividades '+
      'WHERE '+
         'nr_anosemestre = :nr_anosemestre AND '+
         'cd_pessoa = :cd_pessoa AND '+
         'nr_mes = :nr_mes';
   SQL_EXC_MATR =
      'DELETE FROM '+
         'extra_matriculas '+
      'WHERE '+
         'nr_anosemestre = :nr_anosemestre AND '+
         'cd_pessoa = :cd_pessoa AND '+
         'nr_mes = :nr_mes';
var
   qyExc: TUMZQuery;
   bPossuiAtivs, bExcluir: boolean;
begin
   DM.CriarConsulta(qyExc);
   try
      qyExc.SQL.Text := SQL_VER_ATIVS;
      qyExc.ParamCheck := True;
      qyExc.ParamByName('nr_anosemestre').AsInteger := AINrAnoSem;
      qyExc.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
      qyExc.ParamByName('nr_mes').AsInteger := AINrMes;
      qyExc.Open;
      bExcluir := True;
      bPossuiAtivs := not qyExc.IsEmpty;
      if bPossuiAtivs then
      begin
         bExcluir := (Mensagem(MSG_TEM_ATIVS, 'Atencão!', MB_ICONWARNING + MB_YESNO) = ID_YES);
      end;
      if bExcluir then
      begin
         // Efetuar a exclusão aqui
         qyExc.Close;
         if bPossuiAtivs then
         begin
            // Se possui atividades, exclui as atividades do aluno
            qyExc.SQL.Text := SQL_EXC_ATIVS;
            qyExc.ParamByName('nr_anosemestre').AsInteger := AINrAnoSem;
            qyExc.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
            qyExc.ParamByName('nr_mes').AsInteger := AINrMes;
            try
               qyExc.ExecSQL;
            except
               on E: Exception do
                  Mensagem(MSG_ERRO_EXC_ATIVS + #13 + E.Message, 'Erro!', MB_ICONERROR);
            end;
         end;
         // Excluí a matrícula do aluno no mês
         qyExc.SQL.Text := SQL_EXC_MATR;
         qyExc.ParamByName('nr_anosemestre').AsInteger := AINrAnoSem;
         qyExc.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
         qyExc.ParamByName('nr_mes').AsInteger := AINrMes;
         try
            qyExc.ExecSQL;
         except
            on E: Exception do
               Mensagem(MSG_ERRO_EXC_INSC + #13 + E.Message, 'Erro!', MB_ICONERROR);
         end;
         Mensagem(MSG_EXC_SUCESSO, 'Informação', MB_ICONINFORMATION);
      end
      else
      begin
         Mensagem(MSG_SEM_EXC, 'Informação', MB_ICONINFORMATION);
      end;
   finally
      qyExc.Free;
   end;
end;

procedure Tfrm_Inscricoes_Planilha.ToolButton11Click(Sender: TObject);
Var
  iQtdAtividades : Integer;
  cValorTotal : Currency;
  cValorDesconto : Currency;
  cDescontoExtra : Currency;
begin
   if MessageBox(Handle, PChar('Esse procedimento irá atualizar os valores e descontos para as pessoas selecionadas. Tem certeza que deseja continuar?'),
      PChar('Atenção'), MB_ICONQUESTION + MB_YESNO) <> ID_YES then Exit;

   qryInscricoes.First;

   while not qryInscricoes.Eof do
   begin

        iQtdAtividades :=  Dm.BuscarNroAtividades(qryInscricoesnr_anosemestre.AsInteger, qryInscricoescd_pessoa.AsInteger, qryInscricoesnr_mes.AsInteger );
        cValorTotal :=     Dm.BuscarValorBruto(qryInscricoesnr_anosemestre.AsInteger, qryInscricoescd_pessoa.AsInteger, qryInscricoesnr_mes.AsInteger, qryInscricoescd_tipo_pessoa.AsInteger);
        cValorDesconto :=  Dm.BuscarValorDesconto(qryInscricoesnr_anosemestre.AsInteger, iQtdAtividades ,qryInscricoescd_tipo_pessoa.AsInteger, cValorTotal );
        cDescontoExtra :=  Dm.BuscarDescontoExtra(qryInscricoesnr_anosemestre.AsInteger, iQtdAtividades ,qryInscricoescd_tipo_pessoa.AsInteger);

        cValorTotal := cValorTotal - cDescontoExtra;

        if cValorTotal = cVAlorDesconto then begin
           cValorTotal := 0;
           cValorDesconto := 0;
        end;


        // Atualizar o valor para o Mes atual

        with DM.qyAux2 do begin

           Close;
           SQL.Clear;
           SQL.Add(
            ' UPDATE extra_matriculas                          ' +
            ' SET vl_total = :VlTotal, vl_descontos = :VlDesconto ' +
            ' WHERE cd_pessoa = :CdPessoa AND nr_anosemestre = :NrAnoSemestre AND nr_mes = :NrMes '
           );

           ParambyName('CdPessoa').AsInteger := qryInscricoescd_pessoa.AsInteger;
           ParamByName('NrAnoSemestre').AsInteger := qryInscricoesnr_anosemestre.AsInteger;
           ParamByName('NrMes').AsInteger := qryInscricoesnr_mes.AsInteger;
           ParamByName('VlTotal').AsFloat := cValorTotal;
           ParamByName('VlDesconto').AsFloat := cValorDesconto;
           ExecSQL;

        end;

      qryInscricoes.Next;
   end;

   qryInscricoes.Close;
   qryInscricoes.Open;
end;

end.
