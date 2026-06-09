unit uRemessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ImgList, DBCtrls, ToolWin, DB,
  ZConnection, Grids, DBGrids, Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, DBTables, DBClient, Provider,
  ZSqlUpdate, UMDateTimePicker;

type
   TfrmRemessa = class(TForm)
      Bevel4: TBevel;
      pnRemessaTit: TPanel;
      Panel1: TPanel;
      lblLayout: TLabel;
      ultimoseparador: TBevel;
      toolPessoa: TToolBar;
      ToolButton6: TToolButton;
      DBNavigator1: TDBNavigator;
      ToolButton1: TToolButton;
      btIncluir: TToolButton;
      btAlterar: TToolButton;
      btExcluir: TToolButton;
      ToolButton3: TToolButton;
      tblCalcular: TToolButton;
      ToolButton4: TToolButton;
      btFechar: TToolButton;
      ToolButton2: TToolButton;
      ImageList2: TImageList;
      ckbData: TCheckBox;
      cbSituacao: TComboBox;
      lblSituacao: TLabel;
      lblAte: TLabel;
      cbListaLayouts: TComboBox;
      dtcRegistros: TDataSource;
      qyAux: TUMZQuery;
      pnCentral: TPanel;
      pnEdicao: TPanel;
      Bevel1: TBevel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      CheckBox1: TCheckBox;
      sbBuscaTurma: TSpeedButton;
      Edit1: TEdit;
      ComboBox1: TComboBox;
      popAltera: TPopupMenu;
      Baixar1: TMenuItem;
      Cancelamento1: TMenuItem;
      Desconto1: TMenuItem;
      Protesto1: TMenuItem;
      Estorno1: TMenuItem;
      Alterao1: TMenuItem;
      Negociao1: TMenuItem;
      Prorrogao1: TMenuItem;
      Impresso1: TMenuItem;
      Insero1: TMenuItem;
      qyAcao: TUMZQuery;
      ckbProtesto: TCheckBox;
      PageControl1: TPageControl;
      tsRegistros: TTabSheet;
      tsResumo: TTabSheet;
      dbgAprovacao: TDBGrid;
      DBGrid1: TDBGrid;
      qyResumo: TUMZQuery;
      qyResumods_ocorrencia: TStringField;
      qyResumoValTotal: TFloatField;
      dsResumo: TDataSource;
      qyRegistros: TUMZQuery;
      qyRegistroscodigoaluno: TIntegerField;
      qyRegistrosnm_pessoa: TStringField;
      qyRegistrosparcela: TSmallintField;
      qyRegistrosturma: TStringField;
      qyRegistrosvalortotal: TFloatField;
      qyRegistrosvalorpago: TFloatField;
      qyRegistrosds_situacao: TStringField;
      qyRegistrosds_ocorrencia: TStringField;
      Label6: TLabel;
      cbCentroCusto: TComboBox;
      qyRegistroscd_remessa: TLargeintField;
      qryLayoutEspec: TUMZReadOnlyQuery;
      qryLayoutEspecNR_INICIO: TIntegerField;
      qryLayoutEspecNR_TAMANHO: TIntegerField;
      qryLayoutEspecCHR_FILL: TStringField;
      qryLayout: TUMZReadOnlyQuery;
      qryContatos: TUMZReadOnlyQuery;
      qryContatosCD_PESSOA: TIntegerField;
      qryContatosCD_CONTATO: TIntegerField;
      qryContatosDS_CONTATO: TStringField;
      qyCentroCustos: TUMZReadOnlyQuery;
      qyCentroCustosCD_CENTRO: TLargeintField;
      qyCentroCustosDS_CENTRO: TStringField;
      qyResumoQtdAlunos: TLargeintField;
      qyResumoQtdTitulos: TLargeintField;
      popAlterarDDA: TPopupMenu;
      DbitoAutomtico1: TMenuItem;
      CancelamentodeDbito1: TMenuItem;
      cdsRegistros: TClientDataSet;
      dspRegistros: TDataSetProvider;
      cdsRegistroscodigoaluno: TIntegerField;
      cdsRegistrosnm_pessoa: TStringField;
      cdsRegistrosparcela: TSmallintField;
      cdsRegistrosturma: TStringField;
      cdsRegistrosvalortotal: TFloatField;
      cdsRegistrosvalorpago: TFloatField;
      cdsRegistrosds_situacao: TStringField;
      cdsRegistrosds_ocorrencia: TStringField;
      cdsRegistroscd_remessa: TLargeintField;
      cdsRegistrosativo: TBooleanField;
      pmAtivos: TPopupMenu;
      miMarcar: TMenuItem;
      miDesmarcar: TMenuItem;
      updRegistros: TZUpdateSQL;
      qryLayoutEspecDS_VALOR: TMemoField;
      qyRegistrosnossonumero: TStringField;
      cdsRegistrosnossonumero: TStringField;
      qyRegistrosds_tipo_titulo: TStringField;
      cdsRegistrosds_tipo_titulo: TStringField;
    umdtFiltroInicio: TUMDateTimePicker;
    umdtFiltroFim: TUMDateTimePicker;
    procedure UMDateTimePicker1ChangeDate(Sender: TObject);
    procedure umdtFiltroInicioChangeDate(Sender: TObject);
      procedure miDesmarcarClick(Sender: TObject);
      procedure miMarcarClick(Sender: TObject);
      procedure dbgAprovacaoCellClick(Column: TColumn);
      procedure dbgAprovacaoDrawColumnCell(Sender: TObject; const Rect: TRect;
        DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure CancelamentodeDbito1Click(Sender: TObject);
      procedure DbitoAutomtico1Click(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure cbCentroCustoChange(Sender: TObject);
      procedure ckbProtestoClick(Sender: TObject);
      procedure dbgAprovacaoTitleClick(Column: TColumn);
      procedure FormCreate(Sender: TObject);
      procedure qyRegistrosAfterOpen(DataSet: TDataSet);
      procedure qyRegistrosBeforeClose(DataSet: TDataSet);
      procedure Insero1Click(Sender: TObject);
      procedure Impresso1Click(Sender: TObject);
      procedure Prorrogao1Click(Sender: TObject);
      procedure Negociao1Click(Sender: TObject);
      procedure Alterao1Click(Sender: TObject);
      procedure Estorno1Click(Sender: TObject);
      procedure Protesto1Click(Sender: TObject);
      procedure Desconto1Click(Sender: TObject);
      procedure Cancelamento1Click(Sender: TObject);
      procedure Baixar1Click(Sender: TObject);
      procedure dbgAprovacaoKeyDown(Sender: TObject; var Key: Word;
        Shift: TShiftState);
      procedure btIncluirClick(Sender: TObject);
      procedure btExcluirClick(Sender: TObject);
      procedure btFecharClick(Sender: TObject);
      procedure tblCalcularClick(Sender: TObject);
      procedure cbSituacaoChange(Sender: TObject);
      procedure dtFiltroFimChange(Sender: TObject);
      procedure dtFiltroInicioChange(Sender: TObject);
      procedure ckbDataClick(Sender: TObject);
      procedure cbListaLayoutsChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      aLayouts: array of LongInt;
      aNumRemessa : array of Integer;
      slLayoutsIndex: TStringList;
      RemDados: TStringList;
      RemInfo: TStringList;
      FListaOrdem: TStringList;
      AListaMap: TStringList;
      iLinhaCount: LongInt;
      LILinhaContinua : LongInt;
      bFiltraTodos : Boolean;
      bk: Pointer;

      { Private declarations }
      function getNomeArquivoRemessa(): string;
      function FormataSequencia(sValor: string; iSize: Integer; sFill: string; isSomenteNumeros: Boolean = False): string;

      function getNumeroArquivoRemessa(): Integer;
      function tbKeyIsDown(const Key: integer): boolean;
   public
      { Public declarations }
      cd_layout : String;
      procedure FiltraDados( cd_layout : String);
      procedure   ExportaDados();

      function GeraCabecalho(): Boolean;
      function GeraDetalhes(): Boolean;
      function GeraMensagens(): Boolean;
      function GeraRodape(): Boolean;
      procedure AlteraSituacao(iCodAcao: Integer);

   end;

var
  frmRemessa: TfrmRemessa;

implementation

{$R *.dfm}

uses
   General, uDM, Main, uSplash, StrUtils, uGerarRemessa, uUsuario, uSelecionarLayout;


procedure TfrmRemessa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmRemessa.FormCreate(Sender: TObject);
begin
   bFiltraTodos := true;
   FListaOrdem := TStringList.Create;
   AListaMap := TStringList.Create();
   AListaMap.Add('codigoaluno=mensalidade.codigaluno');
   AListaMap.Add('nm_pessoa=aluno.nm_pessoa');
   AListaMap.Add('turma=mensalidades.turma');
   AListaMap.Add('valorpago=mensalidades.valorpago');
   AListaMap.Add('valortotal=(COALESCE(mensalidades.valorbruto,0) + COALESCE(mensalidades.valorextra,0) + COALESCE(mensalidades.valorjuros,0) - COALESCE(mensalidades.descontoextra,0) )');
   AListaMap.Add('ds_situacao=situacoes_financeiras.ds_situacao');
   AListaMap.Add('cd_remessa=remessa.cd_remessa');
end;

procedure TfrmRemessa.FormShow(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 0;

   slLayoutsIndex := TStringList.Create();

   umdtFiltroFim.Date := Now();
   umdtFiltroInicio.Date := Now();
   cd_layout := '';
   //carrega lista de layouts
   with qyAux do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT '
      + ' CD_LAYOUT, NM_LAYOUT, NR_REMESSA '
      + ' FROM REM_LAYOUTS '
      + ' WHERE SN_ATIVO = 1'
      + ' AND cd_coligada = :cd_coligada '  
      + ' AND ( cd_origem = 1 or cd_origem = 3) ORDER BY NM_LAYOUT'+
      '');
      ParamByName('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
      Open();
      cbListaLayouts.Clear();
      SetLength(aLayouts, 0);
      SetLength(aNumRemessa, 0);
      if not IsEmpty then begin
         //preenche a combo
         while not Eof do begin
            SetLength(aLayouts, High(aLayouts)+2);
            SetLength(aNumRemessa, High(aNumRemessa)+2);
            aLayouts[High(aLayouts)] := FieldByName('cd_layout').AsInteger;
            aNumRemessa[High(aNumRemessa)] := FieldByName('nr_remessa').AsInteger;
            cbListaLayouts.AddItem(FieldByName('nm_layout').AsString, nil);
            slLayoutsIndex.Add(FieldByName('cd_layout').AsString+'='+IntToStr(RecNo-1));
            Next();
         end;
      end;
   end;

   //Adiciona a opção de selecionar varioso layouts na combo
   cbListaLayouts.AddItem('Selecionar múltiplos layouts', nil);

   qyCentroCustos.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyCentroCustos.Open;

   with qyCentroCustos do
   begin
      if not IsEmpty then begin
         //preenche a combo
         while not Eof do begin
            cbCentroCusto.AddItem(qyCentroCustosds_centro.AsString , pointer(qyCentroCustos.GetBookmark));
            Next();
         end;
      end;
   end;
end;

procedure TfrmRemessa.FiltraDados( cd_layout : String);
const
   S_SQL_REGISTROS_MYSQL =
      'SELECT ' +
         'M.CODIGOALUNO,' +
         'A.NM_PESSOA,' +
         'M.PARCELA,' +
         'M.TURMA,' +
         'COALESCE(M.VALORBRUTO, 0) + COALESCE(M.VALOREXTRA, 0) + COALESCE(M.VALORJUROS, 0) - COALESCE(M.DESCONTOEXTRA, 0) VALORTOTAL,' +
         'M.VALORPAGO,' +
         'S.DS_SITUACAO,' +
         'O.DS_OCORRENCIA,' +
         'D.CD_REMESSA,' +
         'M.NOSSONUMERO, ' +
         'FCT.ds_tipo_titulo ' +
      'FROM ' +
         'REM_DADOS D ' +
            'JOIN MENSALIDADES M ON ' +
               '(D.CD_MENSALIDADE = M.CD_MENSALIDADE) ' +
               'JOIN PESSOAS A ON ' +
                  '(M.CODIGOALUNO = A.CD_PESSOA) ' +
                  'JOIN PESSOAS R ON ' +
                     '(A.CD_RESP_FINAN = R.CD_PESSOA) ' +
               'JOIN SITUACOES_FINANCEIRAS S ON ' +
                  '(M.SITUACAO = S.CD_SITUACAO) ' +
            'JOIN REM_LAYOUTS L ON ' +
               '(D.CD_LAYOUT = L.CD_LAYOUT) ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(D.CD_OCORRENCIA = O.CD_OCORRENCIA) AND ' +
               '(D.CD_LAYOUT = O.CD_LAYOUT) ' +
            'LEFT JOIN fin_config_tipos_titulo fct on (fct.cd_tipo_titulo = m.cd_tipo_titulo) ' +
      'WHERE ' +
         'D.CD_LAYOUT IN ( :CD_LAYOUT ) AND :coligadas %s ' +
      'GROUP BY ' +
         'D.CD_REMESSA ' +
      'ORDER BY ' +
         '%s';

   S_SQL_REGISTROS_ORACLE =
      'SELECT ' +
         'CAST(FIRST_OCCURRENCE(M.CODIGOALUNO) AS NUMBER(9)) CODIGOALUNO,' +
         'FIRST_OCCURRENCE(A.NM_PESSOA) NM_PESSOA,' +
         'CAST(FIRST_OCCURRENCE(M.PARCELA) AS NUMBER(5)) PARCELA,' +
         'FIRST_OCCURRENCE(M.TURMA) TURMA,' +
         'COALESCE(CAST(FIRST_OCCURRENCE(M.VALORBRUTO) AS FLOAT(126)), 0) + ' +
            'COALESCE(CAST(FIRST_OCCURRENCE(M.VALOREXTRA) AS FLOAT(126)), 0) + ' +
            'COALESCE(CAST(FIRST_OCCURRENCE(M.VALORJUROS) AS FLOAT(126)), 0) + ' +
            'COALESCE(CAST(FIRST_OCCURRENCE(M.DESCONTOEXTRA) AS FLOAT (126)), 0) VALORTOTAL,' +
         'CAST(FIRST_OCCURRENCE(M.VALORPAGO) AS FLOAT(126)) VALORPAGO,' +
         'FIRST_OCCURRENCE(S.DS_SITUACAO) DS_SITUACAO,' +
         'FIRST_OCCURRENCE(O.DS_OCORRENCIA) DS_OCORRENCIA,' +
         'D.CD_REMESSA ' +
      'FROM ' +
         'REM_DADOS D ' +
            'JOIN MENSALIDADES M ON ' +
               '(D.CD_MENSALIDADE = M.CD_MENSALIDADE) ' +
               'JOIN PESSOAS A ON ' +
                  '(M.CODIGOALUNO = A.CD_PESSOA) ' +
                  'JOIN PESSOAS R ON ' +
                     '(A.CD_RESP_FINAN = R.CD_PESSOA) ' +
               'JOIN SITUACOES_FINANCEIRAS S ON ' +
                  '(M.SITUACAO = S.CD_SITUACAO) ' +
            'JOIN REM_LAYOUTS L ON ' +
               '(D.CD_LAYOUT = L.CD_LAYOUT) ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(D.CD_OCORRENCIA = O.CD_OCORRENCIA) AND ' +
               '(D.CD_LAYOUT = O.CD_LAYOUT) ' +
      'WHERE ' +
         'D.CD_LAYOUT = :CD_LAYOUT AND M.CD_COLIGADA IN ( %s ) %s ' +
      'GROUP BY ' +
         'D.CD_REMESSA ' +
      'ORDER BY ' +
         '%s';

   S_SQL_RESUMO_MYSQL =
      'SELECT ' +
         'O.DS_OCORRENCIA,' +
         'COUNT(DISTINCT M.CODIGOALUNO) QTDALUNOS,' +
         'COUNT(DISTINCT D.CD_REMESSA) QTDTITULOS,' +
         'SUM(COALESCE(m.valorbruto,0)) + SUM(COALESCE(m.valorextra,0)) + SUM(COALESCE(m.valorjuros,0))- SUM(COALESCE(m.descontoextra,0)) VALTOTAL '+
      'FROM ' +
         'REM_DADOS D ' +
            'JOIN MENSALIDADES M ON ' +
               '(D.CD_MENSALIDADE = M.CD_MENSALIDADE) ' +
               'JOIN PESSOAS A ON ' +
                  '(M.CODIGOALUNO = A.CD_PESSOA) ' +
                  'JOIN PESSOAS R ON ' +
                     '(A.CD_RESP_FINAN = R.CD_PESSOA) ' +
               'JOIN SITUACOES_FINANCEIRAS S ON ' +
                  '(M.SITUACAO = S.CD_SITUACAO) ' +
            'JOIN REM_LAYOUTS L ON ' +
               '(D.CD_LAYOUT = L.CD_LAYOUT) ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(D.CD_OCORRENCIA = O.CD_OCORRENCIA) AND ' +
               '(D.CD_LAYOUT = O.CD_LAYOUT) ' +
      'WHERE ' +
         'D.CD_LAYOUT IN ( :CD_LAYOUT ) AND :coligadas %s ' +
      'GROUP BY ' +
         'O.DS_OCORRENCIA ' +
      'ORDER BY ' +
         'O.DS_OCORRENCIA';

   S_SQL_RESUMO_ORACLE =
      'SELECT ' +
         'O.DS_OCORRENCIA,' +
         'CAST(COUNT(DISTINCT M.CODIGOALUNO) AS NUMBER(19)) QTDALUNOS,' +
         'CAST(COUNT(DISTINCT D.CD_REMESSA) AS NUMBER(19)) QTDTITULOS,' +
         'SUM(COALESCE(m.valorbruto,0)) + SUM(COALESCE(m.valorextra,0)) + SUM(COALESCE(m.valorjuros,0))- SUM(COALESCE(m.descontoextra,0)) VALTOTAL '+
      'FROM ' +
         'REM_DADOS D ' +
            'JOIN MENSALIDADES M ON ' +
               '(D.CD_MENSALIDADE = M.CD_MENSALIDADE) ' +
               'JOIN PESSOAS A ON ' +
                  '(M.CODIGOALUNO = A.CD_PESSOA) ' +
                  'JOIN PESSOAS R ON ' +
                     '(A.CD_RESP_FINAN = R.CD_PESSOA) ' +
               'JOIN SITUACOES_FINANCEIRAS S ON ' +
                  '(M.SITUACAO = S.CD_SITUACAO) ' +
            'JOIN REM_LAYOUTS L ON ' +
               '(D.CD_LAYOUT = L.CD_LAYOUT) ' +
            'JOIN REM_OCORRENCIAS O ON ' +
               '(D.CD_OCORRENCIA = O.CD_OCORRENCIA) AND ' +
               '(D.CD_LAYOUT = O.CD_LAYOUT) ' +
      'WHERE ' +
         'D.CD_LAYOUT = :CD_LAYOUT AND :coligadas %s ' +
      'GROUP BY ' +
         'O.DS_OCORRENCIA ' +
      'ORDER BY ' +
         'O.DS_OCORRENCIA';

   S_FORMAT_ORDER_MYSQL = '%s %s, ';
   S_FORMAT_ORDER_ORACLE = 'FIRST_OCCURRENCE(%s) %s, ';
   S_OP = ' AND ';
   S_ORDEM_PADRAO_MYSQL = 'D.DT_ACAO ASC';
   S_ORDEM_PADRAO_ORACLE = 'FIRST_OCCURRENCE(D.DT_ACAO) ASC';
   S_FIL_DTACAO_ENTRE = 'D.DT_ACAO BETWEEN :DT_ACAO_MENOR AND :DT_ACAO_MAIOR';
   S_FIL_SITUACAO = 'D.SN_ENVIADO = :SN_ENVIADO';
   S_FIL_CENTROCUSTO = 'M.CD_CENTRO_CUSTO = :CD_CENTRO_CUSTO';
   S_FIL_PROTESTO = 'M.SITUACAO <> 9';
   S_COLIGADAS = 'M.CD_COLIGADA IN ( %s )';
var
   I: integer;
   LSFiltro, LSOrdem: string;
   LParams: TParams;
   LColigadas: String;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

   function GetSQLRecordsByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_REGISTROS_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_REGISTROS_MYSQL;

      LColigadas := Format(S_COLIGADAS, [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);

      Result := StringReplace(
         Result,
         ':coligadas',
         LColigadas,
         [rfIgnoreCase, rfReplaceAll]
     );
   end;

   function GetDefaultOrderByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_ORDEM_PADRAO_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_ORDEM_PADRAO_MYSQL;
   end;

   function GetFormatOrderByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_FORMAT_ORDER_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_FORMAT_ORDER_MYSQL;
   end;

   function GetSQLSumaryByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_RESUMO_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_RESUMO_MYSQL;

      LColigadas := Format(S_COLIGADAS, [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);

      Result := StringReplace(
         Result,
         ':coligadas',
         LColigadas,
         [rfIgnoreCase, rfReplaceAll]
      );
   end;

begin

   LColigadas := S_COLIGADAS;

   if (Length(aLayouts) = 0) then
   begin
      Mensagem('Não há Layout configurado.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   LParams := TParams.Create;
   try
      if ckbData.Checked then
      begin
         LSFiltro := S_OP + S_FIL_DTACAO_ENTRE;
         AddParam('DT_ACAO_MENOR', formatdatetime('yyyy-mm-dd 00:00:01', umdtFiltroInicio.Date) );
         AddParam('DT_ACAO_MAIOR', formatdatetime('yyyy-mm-dd 23:59:59', umdtFiltroFim.Date ) );
      end;

      if cbSituacao.ItemIndex < 2 then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_SITUACAO;
         AddParam('SN_ENVIADO', cbSituacao.ItemIndex);
      end;

      if not bFiltraTodos then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_CENTROCUSTO;
         AddParam('CD_CENTRO_CUSTO', qyCentroCustoscd_centro.AsInteger);
      end;

      if not ckbProtesto.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_PROTESTO;
      end;

      qyRegistros.Close;
   
      for I := 0 to FListaOrdem.Count - 1 do
      begin
         LSOrdem := LSOrdem + Format(GetFormatOrderByProtocol, [FListaOrdem.Names[I], FListaOrdem.ValueFromIndex[I]]);
      end;
      LSOrdem := LSOrdem + GetDefaultOrderByProtocol;

      qyRegistros.SQL.Text := Format(GetSQLRecordsByProtocol, [LSFiltro, LSOrdem]);
      for I := 0 to LParams.Count - 1 do
      begin
         qyRegistros.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      end;
      if ( cd_layout <> '' ) then
      begin
         qyRegistros.SQL.TExt := StringReplace(
            qyRegistros.SQL.TExt,
            ':CD_LAYOUT',
            cd_layout,
            [rfReplaceAll, rfIgnoreCase]
         );
      end else
      begin
         qyRegistros.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];      
      end;
      
      qyRegistros.Open;

      if not cdsRegistros.Active then
         cdsRegistros.Open;
            
      cdsRegistros.Refresh;

      qyResumo.Close;
      qyResumo.SQL.Text := Format(GetSQLSumaryByProtocol, [LSFiltro]);
      for I := 0 to LParams.Count - 1 do
      begin
         qyResumo.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      end;
      if ( cd_layout <> '' ) then
      begin
         qyRegistros.SQL.TExt := StringReplace(
            qyRegistros.SQL.TExt,
            ':CD_LAYOUT',
            cd_layout,
            [rfReplaceAll, rfIgnoreCase]
         );
      end else
      begin
         qyResumo.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];      
      end;
      qyResumo.Open;
   finally
      LParams.Free;
      LParams := nil;
   end;
end;

procedure TfrmRemessa.cbCentroCustoChange(Sender: TObject);
begin
// vai para o registro selecionado e filltra
   if cbCentroCusto.ItemIndex <> 0 then begin
      qyCentroCustos.GotoBookmark(Pointer(cbCentroCusto.Items.Objects[cbCentroCusto.ItemIndex]));
      bFiltraTodos := false
   end
   else
      bFiltraTodos := true;
   FiltraDados( cd_layout );
end;

procedure TfrmRemessa.cbListaLayoutsChange(Sender: TObject);
var
   qryGetDadosOrigem : TUMZQuery;
begin
   // A cada mudanca zera a viariavel
   
   if ( cbListaLayouts.Text = 'Selecionar múltiplos layouts') then
   begin
      Application.CreateForm(TfrmSelecionarLayout, frmSelecionarLayout);
      if frmSelecionarLayout.ShowModal = mrOk then
      begin
        cd_layout := '';
        btIncluir.Enabled := False;
        cd_layout := frmSelecionarLayout.layout_multiplo;
      end else begin
        cd_layout := '';
        btIncluir.Enabled := false;
        Exit;
      end;
   end
   else
   begin
      cd_layout := '';
      btIncluir.Enabled := True;
   end;

   if (cd_layout = '') and (cbListaLayouts.Text = 'Selecionar múltiplos layouts') then
   begin
      Mensagem('Não há Layout configurado.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   pnRemessaTit.Caption := 'GERAR ARQUIVO DE REMESSA (Número = ' + IntToStr(aNumRemessa[cbListaLayouts.ItemIndex]) + ')';
   FiltraDados( cd_layout );

   dm.CriarConsulta( qryGetDadosOrigem );
   qryGetDadosOrigem.SQL.Text := ''+
   '   SELECT                     '+
   '     cd_origem                '+
   '   FROM                       '+
   '     rem_layouts              '+
   '   WHERE                      '+
   '    cd_layout IN (:cd_layout) ';

   if ( cd_layout <> '' ) then
   begin
         qryGetDadosOrigem.ParamByName('cd_layout').AsString := cd_layout;
   end else
   begin
      qryGetDadosOrigem.ParamByName('cd_layout').AsInteger := aLayouts[cbListaLayouts.ItemIndex];
   end;

   qryGetDadosOrigem.Open;

   while not qryGetDadosOrigem.Eof do
   begin
      if (qryGetDadosOrigem.FieldByName('cd_origem').AsInteger = 3) then
      begin
        btAlterar.DropdownMenu := popAlterarDDA;
      end
      else
      begin
        btAlterar.DropdownMenu := popAltera;
      end;
      qryGetDadosOrigem.Next;
   end;
end;

procedure TfrmRemessa.ckbDataClick(Sender: TObject);
begin
   umdtFiltroInicio.Enabled := ckbData.Checked;
   umdtFiltroFim.Enabled := ckbData.Checked;
   FiltraDados( cd_layout );
end;

procedure TfrmRemessa.ckbProtestoClick(Sender: TObject);
begin
   FiltraDados(cd_layout);
end;

procedure TfrmRemessa.dtFiltroInicioChange(Sender: TObject);
begin
   if ( umdtFiltroInicio.Date > umdtFiltroFim.Date) then begin
      umdtFiltroFim.Date := umdtFiltroInicio.Date;
   end;
   FiltraDados(cd_layout);
end;

procedure TfrmRemessa.dtFiltroFimChange(Sender: TObject);
begin
   if (umdtFiltroFim.Date < umdtFiltroInicio.Date) then begin
      umdtFiltroInicio.Date := umdtFiltroFim.Date;
   end;
   FiltraDados(cd_layout);
end;

procedure TfrmRemessa.cbSituacaoChange(Sender: TObject);
begin
   FiltraDados(cd_layout);
end;

function TfrmRemessa.tbKeyIsDown(const Key: integer): boolean;
begin
   Result := GetKeyState(Key) and 128 > 0;
end;

procedure TfrmRemessa.tblCalcularClick(Sender: TObject);
var
   i, indexAtual: Integer;
   arrLayouts: TStringList;
begin

   // Verifica se está usando multiplos layouts
   if cd_layout <> '' then
   begin
      arrLayouts := explode(cd_layout, ',');
   end else begin
      arrLayouts := TStringList.Create;
      arrLayouts.Add(IntToStr(aLayouts[cbListaLayouts.ItemIndex]));
   end;

   // Varre os layouts da combo para fazer a exportação, conforme os layout selecionados
   indexAtual := cbListaLayouts.ItemIndex;
   for i := 0 to arrLayouts.Count - 1 do
   begin
      cbListaLayouts.ItemIndex := StrToInt(slLayoutsIndex.Values[arrLayouts[i]]);
      ExportaDados();
   end;

   // Retorna o indice que estava anteriomente para combo
   cbListaLayouts.ItemIndex := indexAtual;
   
   FiltraDados(cd_layout);
end;

procedure TfrmRemessa.UMDateTimePicker1ChangeDate(Sender: TObject);
begin
   if (umdtFiltroFim.Date < umdtFiltroInicio.Date) then begin
      umdtFiltroInicio.Date := umdtFiltroFim.Date;
   end;
   FiltraDados(cd_layout);
end;

procedure TfrmRemessa.umdtFiltroInicioChangeDate(Sender: TObject);
begin
   if ( umdtFiltroInicio.Date > umdtFiltroFim.Date) then begin
      umdtFiltroFim.Date := umdtFiltroInicio.Date;
   end;
   FiltraDados(cd_layout);
end;

procedure TfrmRemessa.ExportaDados();
const
   S_SQL_UPD_ORACLE =
      'UPDATE REM_DADOS D ' +
      'SET ' +
         'D.SN_ENVIADO = 1 ' +
      'WHERE EXISTS ( ' +
         'SELECT ' +
            'M.CD_MENSALIDADE ' +
         'FROM ' +
            'MENSALIDADES M,' +
            'SITUACOES_FINANCEIRAS S ' +
         'WHERE ' +
            'D.CD_MENSALIDADE = M.CD_MENSALIDADE AND ' +
            'M.SITUACAO = S.CD_SITUACAO AND ' +
            'D.CD_LAYOUT = :CD_LAYOUT %s ' +
      ')';
   S_SQL_UPD_MYSQL =
      'UPDATE REM_DADOS D ' +
         'JOIN MENSALIDADES M ON ' +
            '(D.CD_MENSALIDADE = M.CD_MENSALIDADE) ' +
            'JOIN SITUACOES_FINANCEIRAS S ON ' +
               '(M.SITUACAO = S.CD_SITUACAO) ' +
      'SET ' +
         'D.SN_ENVIADO = 1 ' +
      'WHERE ' +
         'D.CD_LAYOUT = :CD_LAYOUT %s';

   function GetSQLUpdateByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_UPD_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_UPD_MYSQL;
   end;

var
  sNome : String;
begin
   frmSpl2 := TfrmSplash.Create(Self);
   frmSpl2.Processando(True);
   frmSpl2.setTitulo('Remessa');
   frmSpl2.setTexto('Analisando estrutura de Layout...');

   if RemDados <> nil then begin
      FreeAndNil(RemDados);
   end;
   RemDados := TStringList.Create();
   RemInfo := TStringList.Create();
   iLinhaCount := 0;

   frmSpl2.setTexto('Criando Cabeçalho...');
   
   //cria o cabecalho
   if not GeraCabecalho() then begin
      FreeAndNil(RemDados);
      frmSpl2.Processando(False);
      Exit;
   end;

   frmSpl2.setTexto('Criando Detalhes...');
   //cria o  corpo
   if not GeraDetalhes() then begin
      FreeAndNil(RemDados);
      frmSpl2.Processando(False);
      Exit;
   end;

   frmSpl2.setTexto('Criando Rodapé...');
   //cria o final
   if not GeraRodape() then begin
      FreeAndNil(RemDados);
      frmSpl2.Processando(False);
      Exit;
   end;

   frmSpl2.setTexto('Salvando o Arquivo...');
   //salva em arquivo
   sNome := getNomeArquivoRemessa();
   RemDados.SaveToFile(sNome);
   FreeAndNil(RemDados);


   frmSpl2.setTexto('Atualizando dados...');
   //atualiza rem_dados como enviado
   with qyAux do
   begin
      if cbSituacao.ItemIndex <> 1 then
      begin
         Close();
         SQL.Clear();
         SQL.Add('UPDATE rem_dados remessa ');
         SQL.Add('   INNER JOIN mensalidades ON (remessa.cd_mensalidade = mensalidades.cd_mensalidade) ');
         SQL.Add('   INNER JOIN situacoes_financeiras ON (mensalidades.situacao = situacoes_financeiras.cd_situacao) ');
         SQL.Add(' SET remessa.sn_enviado = 1 ');
         SQL.Add(' WHERE remessa.sn_enviado = 0 ');
         SQL.Add(' AND remessa.cd_layout = '+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + '    ');

         if not (ckbProtesto.Checked) then begin
            SQL.Add(' AND situacoes_financeiras.cd_situacao NOT IN (9) ');
         end;
         if (ckbData.Checked) then begin
            SQL.Add('AND (DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', umdtFiltroInicio.Date) + '" AND');
            SQL.Add('DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', umdtFiltroFim.Date) + '") ');
         end;
         ExecSQL();
      end;

      Close();
      SQL.Clear();
      SQL.Add(' UPDATE rem_layouts SET nr_remessa = ' + IntToStr(getNumeroArquivoRemessa()+1) ) ;
      SQL.Add(' WHERE cd_layout = ' + IntToStr(aLayouts[cbListaLayouts.ItemIndex]));
      ExecSQL();

      aNumRemessa[cbListaLayouts.ItemIndex] := aNumRemessa[cbListaLayouts.ItemIndex] + 1;

      pnRemessaTit.Caption := 'GERAR ARQUIVO DE REMESSA (Número = ' + IntToStr(aNumRemessa[cbListaLayouts.ItemIndex]) + ')';

   end;
   frmSpl2.Processando(False);

  //tudo ok.. mandamensagem
   Mensagem('Arquivo de Remessa ' + sNome + Chr(13) + 'Foi gerado com sucesso!!');

end;

function TfrmRemessa.getNomeArquivoRemessa(): string;
var
   nome, sAux : string;
   i, cont : Integer;
   qLayout : TUMZQuery;
   NmArquivo : String;
   ix : integer;
   dia, mes, ano : word;

   aM : Array [1..12] of string;
begin
  // Função para descobrir o nome do arquivo remessa

  // Buscar o padrao do nome do arquivo na tabela remessas

  DM.CriarConsulta(qLayout);

  qLayout.SQL.Text := 'SELECT nm_arquivo FROM rem_layouts WHERE cd_layout = ' + IntToStr(aLayouts[cbListaLayouts.ItemIndex]);
  qLayout.Open();

  NmArquivo := Trim(qLayout.FieldByName('nm_arquivo').AsString);

  if NmArquivo = '' then begin // Formato Padrão, continuar usando o mesmo modelo

     NmArquivo := 'CB[dd][mm]A[c].REM';

  end;

  // Substituir [mm] pelo mes com 2 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[mm]', FormatDateTime('mm', Now()));

  // Substituir [dd] pelo dia com 2 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[dd]', FormatDateTime('dd', Now()));

  // Substituir [aa] pelo ano com 2 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[aa]', FormatDateTime('yy', Now()));

  // Substituir [aa] pelo ano com 4 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[aa]', FormatDateTime('yyyy', Now()));

  if Pos('[m]', NmArquivo) > 0 then begin

     DecodeDate(Now, ano, mes, dia);

     case mes of
       1..9 : NmArquivo := ReplaceStr(NmArquivo, '[m]', IntToStr(mes));
       10   : NmArquivo := ReplaceStr(NmArquivo, '[m]', 'O');
       11   : NmArquivo := ReplaceStr(NmArquivo, '[m]', 'N');
       12   : NmArquivo := ReplaceStr(NmArquivo, '[m]', 'D');
     End;

  end;

  Nome := NmArquivo;

  if Pos('|CRM|', NmArquivo) > 0 then begin
    // Retirar o | e testar
    // Regra específica para o banco SICREDI
    // CRM RM2 RM3 ...
    nome := ReplaceStr(NmArquivo, '|', '');

    if not FileExists(nome) then begin
       result := nome;
       Exit;
    end else begin

      NmArquivo := ReplaceStr(NmArquivo, '|CRM|', 'RM[c]');
      ix:= 2;

    end;

  end else begin

    ix := 1;

  end;

  cont := 0;

  if Pos('[c]', NmArquivo) > 0 then cont := 9;

  for i := ix to cont do begin

     Nome := ReplaceStr(NmArquivo, '[c]', FillString(IntToStr(i), alRight, '0', 1, false));

     if not FileExists(nome) then begin
        result := nome;
        Exit;
     end;

  end;

  Result := nome;

  Exit;

end;

function TfrmRemessa.GeraMensagens(): Boolean;
begin
   Result := True;
end;

function TfrmRemessa.GeraDetalhes(): Boolean;
const
   S_SQL_DADOS =
      'SELECT                     '+
         'dda.nr_conta_corrente,  '+
         'dda.ds_banco,           '+
         'dda.nr_agencia,         '+
         'dda.nr_documento,       '+
         'dda.sn_autoriza_debito, '+
         'aluno.cd_pessoa codaluno, responsavel.cd_pessoa codresp, %s DETALHES %s ' +
      'FROM ' +
      'REM_DADOS remessa ' +
         'JOIN MENSALIDADES ON ' +
            '(remessa.CD_MENSALIDADE = MENSALIDADES.CD_MENSALIDADE) ' +
            'JOIN PESSOAS aluno ON ' +
               '(MENSALIDADES.CODIGOALUNO = aluno.CD_PESSOA) ' +
               'JOIN PESSOAS responsavel ON ' +
                  '(aluno.CD_RESP_FINAN = responsavel.CD_PESSOA) ' +
         'JOIN REM_LAYOUTS layout ON ' +
            '(remessa.CD_LAYOUT = layout.CD_LAYOUT) ' +
            'LEFT JOIN FIN_CADASTRO_CONTAS financeiro ON ' +
               '(layout.CD_CAIXA = financeiro.CD_CAIXA)  ' +
            'LEFT JOIN pessoas_debito_automatico dda ON ( ' +
            ' dda.cd_pessoa = MENSALIDADES.codigoaluno )'+
      'WHERE ' +
         'layout.CD_LAYOUT = :CD_LAYOUT %s ' +
      'GROUP BY ' +
         'MENSALIDADES.CD_RESP,' +
         'IF(IFNULL(MENSALIDADES.NOSSONUMERO, "")="", MENSALIDADES.CD_MENSALIDADE, MENSALIDADES.NOSSONUMERO),' +
         'remessa.cd_ocorrencia' ;
   S_OP = ' AND ';
   S_FIL_DTACAO_ENTRE= 'remessa.DT_ACAO BETWEEN :DT_ACAO_MENOR AND :DT_ACAO_MAIOR';
   S_FIL_SITUACAO = 'remessa.SN_ENVIADO = :SN_ENVIADO';
   S_REGISTRO_SEQUENCIA = '[registro_sequencia]';
   S_REGISTRO_SEQUENCIA1 = '[registro_sequencia1]';
   S_REGISTRO_SEQUENCIA2 = '[registro_sequencia2]';
   S_LINHA_NUMERO = '[linha_numero]';
   S_GLUE_MYSQL = ', ';
   S_GLUE_ORACLE = ' || ';
   S_FORMATED_VALUE_MYSQL_WITHOUT_PAD = 'IFNULL(%s, '''')';
   S_FORMATED_VALUE_MYSQL = '%s(IFNULL(%s,''''), %s, ''%s'')';
   S_FORMATED_VALUE_ORACLE = '%s(NVL(%s,''''), %s, ''%s'')';
   S_CONCAT_MYSQL = 'CONCAT(%s)';
   S_CONCAT_ORACLE = ' %s ';
var
   I, LIContatos, LIContador, LIContaLinhas,
   LIContLinhaCont: integer;
   LSGlue, LSSQL, LSValue, LSSize, LSFill, LSTemp, LSFiltro: string;
   LSlTemp: TStringList;
   LParams: TParams;
   LContatos: array[1..10] of TStringList;

   function GetFormatedValueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_FORMATED_VALUE_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_FORMATED_VALUE_MYSQL;
   end;

   function GetGlueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_GLUE_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_GLUE_MYSQL;
   end;

   function GetConcatByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_CONCAT_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_CONCAT_MYSQL;
   end;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   qryLayoutEspec.Close;
   qryLayoutEspec.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];
   qryLayoutEspec.ParamByName('CD_TIPO').AsInteger := 2;
   qryLayoutEspec.Open;

   LIContLinhaCont := 1;

   while not qryLayoutEspec.Eof do
   begin
      LSValue := StringReplace(qryLayoutEspecDS_VALOR.AsString, '"', '''', [rfReplaceAll]);
      LSSize  := qryLayoutEspecNR_TAMANHO.AsString;
      LSFill  := qryLayoutEspecCHR_FILL.AsString;

      // Preenchimento padrão
      if LSFill = '' then LSFill := ' ';

      // Valor padrão
      if LSValue = '' then LSValue := ''' ''';

      // Parâmetro fixo
      if (LSValue = S_REGISTRO_SEQUENCIA) or (LSValue = S_REGISTRO_SEQUENCIA1)
         or (LSValue = S_REGISTRO_SEQUENCIA2) then
      begin
         RemInfo.Values['RegSeq.Size'] := LSSize;
         RemInfo.Values['RegSeq.Fill'] := LSFill;
         LSTemp := Format('''%s''', [LSValue]);
      end
      else if LSValue = S_LINHA_NUMERO then
      begin
         RemInfo.Values['Linha.Size'] := LSSize;
         RemInfo.Values['Linha.Fill'] := LSFill;
         LSTemp := Format('''%s''', [LSValue]);
      end
      else if LSValue = '[linha_continua]' then
      begin
         RemInfo.Values['LinhaC.Size'] := LSSize;
         RemInfo.Values['LinhaC.Fill'] := LSFill;

         // Eu quero ver quantas vezes ele passou por aqui
         RemInfo.Values['LinhaC.Qtd'] := RemInfo.Values['LinhaC.Qtd'] + 'X';
         
         LSTemp := Format('''[linha_continua_%d]''', [LIContLinhaCont]);
         
         Inc(LIContLinhaCont);
      end
      else if LeftStr(LSValue, 4) = '[dv:' then
      begin
         // Digito verificador
         LSlTemp := TStringList.Create;
         try
            LSTemp := Copy(LSValue, 2, Length(LSValue) - 2);
            SplitString(LSTemp, ':', LSlTemp);
            RemInfo.Values['DV.Num'] := LSlTemp.Strings[1];
            RemInfo.Values['DV.Tipo'] := LSlTemp.Strings[2];
            RemInfo.Values['DV.Banco'] := LSlTemp.Strings[3];
            RemInfo.Values['DV.Valor'] :=  Format(', (%s) DIGITO_VERIFICADOR', [LSlTemp.Strings[4]]);
            RemInfo.Values['DV.Size'] := LSSize;
            RemInfo.Values['DV.Fill'] := LSFill;
            LSTemp := '''[DIGITO_VERIFICADOR]''';
         finally
            LSlTemp.Free;
         end;
      end
      else if LeftStr(LSValue, 9) = '[contato:' then
      begin
         // Contato
         Inc(LIContatos);
         LContatos[LIContatos] := TStringList.Create;
         LSlTemp := TStringList.Create;
         try
            LSTemp := Copy(LSValue, 2, Length(LSValue) - 2);
            SplitString(LSTemp, ':', LSlTemp);
            LContatos[LIContatos].Values['Pessoa'] := LSlTemp.Strings[1];
            LContatos[LIContatos].Values['Contato'] := LSlTemp.Strings[2];
            LContatos[LIContatos].Values['Cont.Size'] := LSSize;
            LContatos[LIContatos].Values['Cont.Fill'] := LSFill;
            // Formato: [contato:aluno/responsavel:contato:tamanho]
            LSTemp := Format('''[contato_%d]''', [LIContatos]);
         finally
            LSlTemp.Free;
         end;
      end
      else if LeftStr(LSValue, 25) = '[contato_somente_numeros:' then
      begin
         // Contato
         Inc(LIContatos);
         LContatos[LIContatos] := TStringList.Create;
         LSlTemp := TStringList.Create;
         try
            LSTemp := Copy(LSValue, 2, Length(LSValue) - 2);
            SplitString(LSTemp, ':', LSlTemp);
            LContatos[LIContatos].Values['Pessoa'] := LSlTemp.Strings[1];
            LContatos[LIContatos].Values['Contato'] := LSlTemp.Strings[2];
            LContatos[LIContatos].Values['Cont.Size'] := LSSize;
            LContatos[LIContatos].Values['Cont.Fill'] := LSFill;
            LContatos[LIContatos].Values['Mascara'] := 'contato_somente_numeros';
            // Formato: [contato:aluno/responsavel:contato:tamanho]
            LSTemp := Format('''[contato_%d]''', [LIContatos]);
         finally
            LSlTemp.Free;
         end;
      end
      else if LSSize = '-1' then
      begin
         LSTemp := Format(S_FORMATED_VALUE_MYSQL_WITHOUT_PAD, [LSValue]);
      end
      else
      begin
         // Lado do preenchimento
         if LSFill = '0' then LSTemp := 'LPAD'
         else LSTemp := 'RPAD';
         LSTemp := Format(GetFormatedValueByProtocol, [LSTemp, LSValue, LSSize, LSFill]);
      end;
      
      LSSQL := LSSQL + LSGlue + LSTemp;
      LSGlue := GetGlueByProtocol;
      qryLayoutEspec.Next;
   end;
   qryLayoutEspec.Close;

   if LSSQL = '' then LSSQL := '''''';

   LParams := TParams.Create;
   try
      if ckbData.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_DTACAO_ENTRE;
         AddParam('DT_ACAO_MENOR', formatdatetime('yyyy-mm-dd 00:00:01', umdtFiltroInicio.Date) );
         AddParam('DT_ACAO_MAIOR', formatdatetime('yyyy-mm-dd 23:59:59', umdtFiltroFim.Date ) );

      end;

      if cbSituacao.ItemIndex < 2 then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_SITUACAO;
         AddParam('SN_ENVIADO', cbSituacao.ItemIndex);
      end;

      qryLayout.Close;
      qryLayout.SQL.Text := Format(S_SQL_DADOS, [Format(GetConcatByProtocol, [LSSQL]), RemInfo.Values['DV.Valor'], LSFiltro]);
      for I := 0 to LParams.Count - 1 do
         qryLayout.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      try
         qryLayout.Open;
         if not qryLayout.IsEmpty then
         begin
            LIContador := 1;

            while not qryLayout.Eof do
            begin
               Inc(LIContaLinhas);
               Inc(iLinhaCount);
               LSTemp := qryLayout.FieldByName('DETALHES').AsString;
               // Digito verificador
               if RemInfo.Values['DV.Valor'] <> '' then
               begin
                  if RemInfo.Values['DV.Num'] = '11' then
                     LSGlue := DV11(
                        qryLayout.FieldByName('DIGITO_VERIFICADOR').AsString,
                        RemInfo.Values['DV.Tipo'],
                        RemInfo.Values['DV.Banco'])
                  else if RemInfo.Values['DV.Num'] = '10' then
                     LSGlue := DV10(
                        qryLayout.FieldByName('DIGITO_VERIFICADOR').AsString,
                        RemInfo.Values['DV.Banco'])
                  else if RemInfo.Values['DV.Num'] = 'A2' then
                     LSGlue := DVA2(
                        qryLayout.FieldByName('DIGITO_VERIFICADOR').AsString,
                        RemInfo.Values['DV.Tipo'],
                        RemInfo.Values['DV.Banco'])
                  else
                     LSGlue := '0';
                  // Substitui
                  LSTemp :=
                     StringReplace(LSTemp, '[DIGITO_VERIFICADOR]',
                        FormataSequencia(LSGlue, StrToInt(RemInfo.Values['DV.Size']),
                           RemInfo.Values['DV.FIll']), [rfReplaceAll]);
               end;

               if RemInfo.Values['RegSeq.Size'] <> '' then
               begin
                  LSTemp :=
                     StringReplace(LSTemp, S_REGISTRO_SEQUENCIA,
                        FormataSequencia(Format('%d', [LIContador]),
                           StrToInt(RemInfo.Values['RegSeq.Size']),
                           RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
                  LSTemp :=
                     StringReplace(LSTemp, S_REGISTRO_SEQUENCIA1,
                        FormataSequencia(Format('%d', [LIContador * 2 - 1]),
                           StrToInt(RemInfo.Values['RegSeq.Size']),
                           RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
                  LSTemp :=
                     StringReplace(LSTemp, S_REGISTRO_SEQUENCIA2,
                        FormataSequencia(Format('%d', [LIContador * 2]),
                           StrToInt(RemInfo.Values['RegSeq.Size']),
                           RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
               end;

               if RemInfo.Values['Linha.Size'] <> '' then
                  LSTemp :=
                     StringReplace(LSTemp, S_LINHA_NUMERO,
                        FormataSequencia(Format('%d', [iLinhaCount]),
                           StrToInt(RemInfo.Values['Linha.Size']),
                           RemInfo.Values['Linha.Fill']), [rfReplaceAll]);

               if RemInfo.Values['LinhaC.Size'] <> '' then
               begin
                  LIContLinhaCont := Length(RemInfo.Values['LinhaC.Qtd']);
                  for LIContLinhaCont := 1 to Length(RemInfo.Values['LinhaC.Qtd']) do
                  begin
                     LSTemp :=
                        StringReplace(LSTemp,
                           Format('[linha_continua_%d]', [LIContLinhaCont]),
                           FormataSequencia(IntToStr(LILinhaContinua),
                           StrToInt(RemInfo.Values['LinhaC.Size']),
                           RemInfo.Values['LinhaC.Fill']), [rfReplaceAll]);
                     Inc(LILinhaContinua);
                  end;

               end;

               for I := 1 to LIContatos do
               begin
                  qryContatos.Close;
                  if LContatos[I].Values['Pessoa'] = 'responsavel' then
                     qryContatos.ParamByName('CD_PESSOA').AsInteger :=
                        qryLayout.FieldByName('CODRESP').AsInteger
                  else
                     qryContatos.ParamByName('CD_PESSOA').AsInteger :=
                        qryLayout.FieldByName('CODALUNO').AsInteger;

                  qryContatos.ParamByName('CD_CONTATO').AsString := LContatos[I].Values['Contato'];
                  qryContatos.Open;

                  if LContatos[I].Values['Mascara'] = '' then
                  begin
                     LSTemp :=
                        StringReplace(LSTemp, Format('[contato_%d]', [I]),
                           FormataSequencia(qryContatosDS_CONTATO.AsString,
                              StrToInt(LContatos[I].Values['Cont.Size']),
                              LContatos[I].Values['Cont.Fill']), [rfReplaceAll]);
                  end;

                  if LContatos[I].Values['Mascara'] <> '' then
                  begin
                     LSTemp :=
                     StringReplace(LSTemp, Format('[contato_%d]', [I]),
                        FormataSequencia(qryContatosDS_CONTATO.AsString,
                           StrToInt(LContatos[I].Values['Cont.Size']),
                           LContatos[I].Values['Cont.Fill'], True), [rfReplaceAll]);
                  end;
               end;

               while AnsiPos('||', LSTemp) > 0 do
               begin
                  RemDados.Add(Copy(LSTemp, 1, AnsiPos('||', LSTemp) - 1));
                  LSTemp := Copy(LSTemp, AnsiPos('||', LSTemp) + 2, Length(LSTemp));
               end;
               
               RemDados.Add(LSTemp);
               Inc(LIContador);
               qryLayout.Next;
            end;
            Result := true;
         end
         else
         begin
            Mensagem('Nenhum registro de cabeçalho!!', 'Erro!', MB_ICONERROR + MB_OK, Handle);
            Result := false;
         end;
         qryLayout.Close;
      except
         Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Detalhes)', 'Erro!', MB_ICONERROR + MB_OK, Handle);
         Result := false;
      end;
      qryLayout.Close;
   finally
      LParams.Free;
      LParams := nil;
   end;
end;


function TfrmRemessa.GeraRodape(): Boolean;
const
   S_SQL_DADOS =
      'SELECT %s RODAPE ' +
      'FROM ' +
      'REM_DADOS remessa ' +
         'JOIN MENSALIDADES ON ' +
            '(remessa.CD_MENSALIDADE = MENSALIDADES.CD_MENSALIDADE) ' +
            'JOIN PESSOAS aluno ON ' +
               '(MENSALIDADES.CODIGOALUNO = aluno.CD_PESSOA) ' +
               'JOIN PESSOAS responsavel ON ' +
                  '(aluno.CD_RESP_FINAN = responsavel.CD_PESSOA) ' +
         'JOIN REM_LAYOUTS layout ON ' +
            '(remessa.CD_LAYOUT = layout.CD_LAYOUT) ' +
            'LEFT JOIN FIN_CADASTRO_CONTAS financeiro ON ' +
               '(layout.CD_CAIXA = financeiro.CD_CAIXA)  ' +
      'WHERE ' +
         'layout.CD_LAYOUT = :CD_LAYOUT %s ' +
      'GROUP BY ' +
         'layout.CD_LAYOUT';
   S_OP = ' AND ';
   S_FIL_DTACAO_ENTRE= 'remessa.DT_ACAO BETWEEN :DT_ACAO_MENOR AND :DT_ACAO_MAIOR';
   S_FIL_SITUACAO = 'remessa.SN_ENVIADO = :SN_ENVIADO';
   S_ARQUIVO_NUMERO = '[arquivo_numero]';
   S_LINHA_NUMERO = '[linha_numero]';
   S_LINHAS_TOTAL = '[linhas_total]';
   S_GLUE_MYSQL = ', ';
   S_GLUE_ORACLE = ' || ';
   S_FORMATED_VALUE_MYSQL_WITHOUT_PAD = 'IFNULL(%s, '''')';
   S_FORMATED_VALUE_MYSQL = '%s(IFNULL(%s,''''), %s, ''%s'')';
   S_FORMATED_VALUE_ORACLE = '%s(NVL(%s,''''), %s, ''%s'')';
   S_CONCAT_MYSQL = 'CONCAT(%s)';
   S_CONCAT_ORACLE = ' %s ';
var
   sSQL: string;
   sAux, sGlue: string;
   sFill, sSize, sValor: string;
   LParams: TParams;
   I, LIContaLinhas: integer;
   LSValue, LSSize, LSFill, LSTemp, LSSQL, LSGlue, LSFiltro: string;

   function GetFormatedValueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_FORMATED_VALUE_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_FORMATED_VALUE_MYSQL;
   end;

   function GetGlueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_GLUE_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_GLUE_MYSQL;
   end;

   function GetConcatByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_CONCAT_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_CONCAT_MYSQL;
   end;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;
   
begin
   qryLayoutEspec.Close;
   qryLayoutEspec.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];
   qryLayoutEspec.ParamByName('CD_TIPO').AsInteger := 4;
   qryLayoutEspec.Open;

   while not qryLayoutEspec.Eof do
   begin
      LSValue := StringReplace(qryLayoutEspecDS_VALOR.AsString, '"', '''', [rfReplaceAll]);
      LSSize := qryLayoutEspecNR_TAMANHO.AsString;
      LSFill := qryLayoutEspecCHR_FILL.AsString;

      // Parâmetro fixo
      if LSValue = S_ARQUIVO_NUMERO then
         LSValue := Format('''%d''', [getNumeroArquivoRemessa + 1])
      // Valor padrão
      else if LSValue = '' then
         LSValue := ''' ''';

      if LSValue = S_LINHAS_TOTAL then
      begin
         LSValue := IntToStr(RemDados.Count);
      end;
      
      // Preenchimento padrão
      if LSFill = '' then LSFill := ' ';

      if LSValue = S_LINHA_NUMERO then
      begin
         RemInfo.Values['Linha.Size'] := LSSize;
         RemInfo.Values['Linha.Fill'] := LSFill;
         LSTemp := Format('''%s''', [LSValue]);
      end
      else if LSSize = '-1' then
      begin
         LSTemp := Format(S_FORMATED_VALUE_MYSQL_WITHOUT_PAD, [LSValue]);
      end
      else
      begin
         // Lado do preenchimento
         if LSFill = '0' then LSTemp := 'LPAD'
         else LSTemp := 'RPAD';

         LSTemp := Format(GetFormatedValueByProtocol, [LSTemp, LSValue, LSSize, LSFill]);
      end;
      LSSQL := LSSQL + LSGlue + LSTemp;
      LSGlue := GetGlueByProtocol;

      qryLayoutEspec.Next;
   end;
   qryLayoutEspec.Close;

   if LSSQL = '' then LSSQL := '''''';

   LParams := TParams.Create;
   try
      if ckbData.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_DTACAO_ENTRE;
         AddParam('DT_ACAO_MENOR', formatdatetime('yyyy-mm-dd 00:00:01', umdtFiltroInicio.Date) );
         AddParam('DT_ACAO_MAIOR', formatdatetime('yyyy-mm-dd 23:59:59', umdtFiltroFim.Date ) );
      end;

      if cbSituacao.ItemIndex < 2 then
      begin
         LSFiltro := LSFiltro + S_OP + S_FIL_SITUACAO;
         AddParam('SN_ENVIADO', cbSituacao.ItemIndex);
      end;

      qryLayout.Close;
      qryLayout.SQL.Text := Format(S_SQL_DADOS, [Format(GetConcatByProtocol, [LSSQL]), LSFiltro]);
      qryLayout.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];
      for I := 0 to LParams.Count - 1 do
         qryLayout.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;

      try
         qryLayout.Open;
         if not qryLayout.IsEmpty then
         begin
            Inc(LIContaLinhas);
            Inc(iLinhaCount);
            LSTemp := qryLayout.FieldByName('RODAPE').AsString;

            if RemInfo.Values['Linha.Size'] <> '' then
               LSTemp :=
                  StringReplace(LSTemp, S_LINHA_NUMERO,
                     FormataSequencia(Format('%d', [iLinhaCount]),
                        StrToInt(RemInfo.Values['Linha.Size']),
                        RemInfo.Values['Linha.Fill']), [rfReplaceAll]);

            while AnsiPos('||', LSTemp) > 0 do
            begin
               RemDados.Add(Copy(LSTemp, 1, AnsiPos('||', LSTemp) - 1));
               LSTemp := Copy(LSTemp, AnsiPos('||', LSTemp) + 2, Length(LSTemp));
            end;

            RemDados.Add(LSTemp);
            Result := true;
         end
         else
         begin
            Mensagem('Nenhum registro de rodapé!', 'Erro!', MB_ICONERROR + MB_OK, Handle);
            Result := false;
         end;
      except
         Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Rodape)', 'Erro!', MB_ICONERROR + MB_OK, Handle);
         Result := false;
      end;
      qryLayout.Close;
   finally
      LParams.Free;
      LParams := nil;
   end;
end;

function TfrmRemessa.GeraCabecalho: boolean;
const
   S_SQL_LAYOUT =
      'SELECT %s CABECALHO ' +
      'FROM REM_LAYOUTS layout ' +
      'LEFT JOIN FIN_CADASTRO_CONTAS financeiro ON ' +
      '(layout.CD_CAIXA = financeiro.CD_CAIXA) ' +
      'WHERE layout.CD_LAYOUT = :CD_LAYOUT';
   S_ARQUIVO_NUMERO = '[arquivo_numero]';
   S_LINHA_NUMERO = '[linha_numero]';
   S_GLUE_MYSQL = ', ';
   S_GLUE_ORACLE = ' || ';
   S_FORMATED_VALUE_MYSQL = '%s(IFNULL(%s,''''), %s, ''%s'')';
   S_FORMATED_VALUE_ORACLE = '%s(NVL(%s,''''), %s, ''%s'')';
   S_CONCAT_MYSQL = 'CONCAT(%s)';
   S_CONCAT_ORACLE = ' %s ';
var
   LSValue, LSSize, LSFill, LSTemp, LSGlue, LSSQL: string;

   function GetFormatedValueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_FORMATED_VALUE_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_FORMATED_VALUE_MYSQL;
   end;

   function GetGlueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_GLUE_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_GLUE_MYSQL;
   end;

   function GetConcatByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_CONCAT_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_CONCAT_MYSQL;
   end;

begin
   qryLayoutEspec.Close;
   qryLayoutEspec.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];
   qryLayoutEspec.ParamByName('CD_TIPO').AsInteger := 1;
   qryLayoutEspec.Open;

   LILinhaContinua := 1;

   while not qryLayoutEspec.Eof do
   begin
      LSValue := StringReplace(qryLayoutEspecDS_VALOR.AsString, '"', '''', [rfReplaceAll]);
      LSSize := qryLayoutEspecNR_TAMANHO.AsString;
      LSFill := qryLayoutEspecCHR_FILL.AsString;

      // Preenchimento fixo
      if LSValue = S_ARQUIVO_NUMERO then
         LSValue := Format('''%d''', [getNumeroArquivoRemessa + 1])
      // Valor padrão
      else if LSValue = '' then
         LSValue := ''' ''';

      // Preenchimento padrão
      if LSFill = '' then LSFill := ' ';

      if LSValue = S_LINHA_NUMERO then
      begin
         RemInfo.Values['Linha.Size'] := LSSize;
         RemInfo.Values['Linha.Fill'] := LSFill;
         LSTemp := Format('''%s''', [LSValue]);
      end
      else if LSValue = '[linha_continua]' then
      begin
         RemInfo.Values['LinhaC.Size'] := LSSize;
         RemInfo.Values['LinhaC.Fill'] := LSFill;

         LSTemp := '''[linha_continua_cab]''';
      end
      else
      begin
         // Lado do preenchimento
         if LSFill = '0' then LSTemp := 'LPAD'
         else LSTemp := 'RPAD';
         LSTemp := Format(GetFormatedValueByProtocol, [LSTemp, LSValue, LSSize, LSFill]);
      end;
      LSSQL := LSSQL + LSGlue + LSTemp;
      LSGlue := GetGlueByProtocol;
      qryLayoutEspec.Next;
   end;
   qryLayoutEspec.Close;

   if LSSQL = '' then LSSQL := '''''';

   qryLayout.Close;
   qryLayout.SQL.Text := Format(S_SQL_LAYOUT, [Format(GetConcatByProtocol, [LSSQL])]);
   qryLayout.ParamByName('CD_LAYOUT').AsInteger := aLayouts[cbListaLayouts.ItemIndex];
   try
      qryLayout.Open;
      if not qryLayout.IsEmpty then
      begin
         Inc(iLinhaCount);
         LSTemp := qryLayout.FieldByName('CABECALHO').AsString;
         if RemInfo.Values['Linha.Size'] <> '' then
            LSTemp :=
               StringReplace(LSTemp, S_LINHA_NUMERO,
               FormataSequencia(
                  Format('%d', [iLinhaCount]),
                  StrToInt(RemInfo.Values['Linha.Size']),
                  RemInfo.Values['Linha.Fill']), [rfReplaceAll]);

         if RemInfo.Values['LinhaC.Size'] <> '' then begin
            LSTemp :=
               StringReplace(LSTemp, '[linha_continua_cab]',
               FormataSequencia(
                  Format('%d', [LILinhaContinua]),
                  StrToInt(RemInfo.Values['LinhaC.Size']),
                  RemInfo.Values['LinhaC.Fill']), [rfReplaceAll]);
               LILinhaContinua := LILinhaContinua + 1;
         end;       

         while AnsiPos('||', LSTemp) > 0 do
         begin
            RemDados.Add(Copy(LSTemp, 1, AnsiPos('||', LSTemp) - 1));
            LSTemp := Copy(LSTemp, AnsiPos('||', LSTemp) + 2, Length(LSTemp));
         end;
         RemDados.Add(LSTemp);
         Result := true;
      end
      else
      begin
         Mensagem('Nenhum registro de cabeçalho!!', 'Erro!', MB_ICONERROR + MB_OK, Handle);
         Result := false;
      end;
   except
      Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Cabecalho)', 'Erro!', MB_ICONERROR + MB_OK, Handle);
      Result := false;
   end;
   qryLayout.Close;
end;

function TfrmRemessa.getNumeroArquivoRemessa(): Integer;
begin
   Result := aNumRemessa[cbListaLayouts.ItemIndex];
end;

procedure TfrmRemessa.btFecharClick(Sender: TObject);
begin
   Close();
end;

function TfrmRemessa.FormataSequencia(sValor: string; iSize: Integer;
  sFill: string; isSomenteNumeros: Boolean = False ): string;
var
   sAux: string;
begin
   sAux := DupeString(sFill, iSize);
   if (sFill = '0') then begin
      sAux := sAux + (sValor);
      sAux := RightStr(sAux, iSize);
   end
   else begin
      sAux := sValor + sAux;
      sAux := LeftStr(sAux, iSize);
   end;

   if isSomenteNumeros = True then
   begin
      sAux := stringReplace(sAux, '(', '', []);
      sAux := stringReplace(sAux, ')', '', []);
      sAux := stringReplace(sAux, '-', '', []);
   end;
   
   Result := sAux;
end;

procedure TfrmRemessa.btExcluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npExcluir, true) then
   begin
      if Mensagem('Tem certeza que deseja excluir o(s) item(s) selecionado(s) da Remessa?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION ) <> mrYes then Exit;

      cdsRegistros.DisableControls;
      cdsRegistros.Filter := 'ativo';
      cdsRegistros.Filtered := true;
      cdsRegistros.First;

      while not cdsRegistros.IsEmpty do
      begin
         cdsRegistros.Delete;
      end;

      cdsRegistros.ApplyUpdates(0);
      cdsRegistros.Filtered := false;
      cdsRegistros.EnableControls;
   end;
end;

procedure TfrmRemessa.btIncluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npIncluir, true) then
   begin
      if (cbListaLayouts.ItemIndex = -1) then begin
         Mensagem('Você precisa selecionar um layout para incluir!');
         Exit;
      end;

      if not PrincipalForm.ProcuraForm( TForm(fGerarRemessa) ) then begin
         Application.CreateForm( TfGerarRemessa, fGerarRemessa )
      end;

      fGerarRemessa.iCodLayout := aLayouts[cbListaLayouts.ItemIndex];
      fGerarRemessa.mskAnoSem.Text := IntToStr(ano_semestre);
      fGerarRemessa.ShowModal;

      FiltraDados(cd_layout);
   end;
end;

procedure TfrmRemessa.dbgAprovacaoCellClick(Column: TColumn);
begin
   if (Column.Field.DataType = ftBoolean)then
   begin
      Column.Grid.DataSource.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Grid.DataSource.DataSet.Post;
   end
   else if tbKeyIsDown(VK_CONTROL) then
   begin
      cdsRegistros.Edit;
      cdsRegistrosativo.AsBoolean := not cdsRegistrosativo.AsBoolean;
      cdsRegistros.Post;
   end;
end;

procedure TfrmRemessa.dbgAprovacaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array [Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.FieldName = 'ativo' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);
      dbgAprovacao.Canvas.FillRect(Rect);
      DrawFrameControl(dbgAprovacao.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;
end;

procedure TfrmRemessa.dbgAprovacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      btExcluirClick(nil);
   end;

   case key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btIncluir.Enabled then btIncluirClick( nil );
      VK_F9 : if btExcluir.Enabled then btExcluirClick( nil );
      VK_F12 : if btFechar.Enabled then btFecharClick( nil );
   end;



end;

procedure TfrmRemessa.dbgAprovacaoTitleClick(Column: TColumn);
const
   S_ASC = 'ASC';
   S_DESC = 'DESC';
var
   I: integer;
begin
   FListaOrdem.Sort;

   if FListaOrdem.Find(Column.FieldName, I) and (Column.FieldName <> 'ativo') then
   begin
      if FListaOrdem.Values[Column.FieldName] = S_ASC then
      begin
         FListaOrdem.Values[Column.FieldName] := S_DESC;
         Column.Title.Color := clGreen;
      end
      else
      begin
         FListaOrdem.Delete(I);
         Column.Title.Color := clBtnFace;
      end;
   end
   else if Column.FieldName <> 'ativo' then
   begin
      FListaOrdem.Values[Column.FieldName] := S_ASC;
      Column.Title.Color := clBlue;
   end;
   
   if Column.FieldName <> 'ativo' then
      FiltraDados(cd_layout);
end;

procedure TfrmRemessa.AlteraSituacao(iCodAcao: Integer);
var
   iCodRemessa: Integer;
begin
   if ((qyRegistros.Active) and (not qyRegistros.IsEmpty)) then begin
      with qyAux do begin
         Close();
         SQL.Clear();
         Params.Clear();
         SQL.Add('SELECT cd_ocorrencia FROM rem_ocorrencias WHERE cd_layout = '+IntToStr(aLayouts[cbListaLayouts.ItemIndex])+' AND cd_acao='+IntToStr(iCodAcao));
         Open();
         if Not IsEmpty then begin
            iCodRemessa := FieldByName('cd_ocorrencia').AsInteger;
            Close();
            SQL.Clear();
            Params.Clear();
            SQL.Add(' UPDATE rem_dados r SET r.cd_ocorrencia = '+IntToStr(iCodRemessa)+' WHERE r.cd_remessa = '+qyRegistroscd_remessa.AsString+'   ');
            ExecSQL();
            qyRegistros.Close();
            qyRegistros.Open();
         end;
         Close();
      end;
   end
   else begin
      Mensagem('Selecione um registro para modificar!!');
   end;

end;

procedure TfrmRemessa.Baixar1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(0);
end;

procedure TfrmRemessa.Cancelamento1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(1);
end;

procedure TfrmRemessa.CancelamentodeDbito1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(101);
end;

procedure TfrmRemessa.DbitoAutomtico1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(100);
end;

procedure TfrmRemessa.Desconto1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(2);
end;

procedure TfrmRemessa.Protesto1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(3);
end;

procedure TfrmRemessa.Estorno1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(4);
end;

procedure TfrmRemessa.Alterao1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(5);
end;

procedure TfrmRemessa.Negociao1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(6);
end;

procedure TfrmRemessa.Prorrogao1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(7);
end;

procedure TfrmRemessa.Impresso1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(8);
end;

procedure TfrmRemessa.Insero1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2062, npAlterar, true) then
      AlteraSituacao(9);
end;

procedure TfrmRemessa.miDesmarcarClick(Sender: TObject);
var
   pos: TBookmark;
begin
   pos := cdsRegistros.GetBookmark;
   cdsRegistros.DisableControls;
   cdsRegistros.First;
   while not cdsRegistros.Eof do
   begin
      cdsRegistros.Edit;
      cdsRegistrosativo.AsBoolean := false;
      cdsRegistros.Next;   
   end;

   if cdsRegistros.State in [dsEdit] then
   begin
      cdsRegistros.Post;   
   end;

   cdsRegistros.Filtered := false;
   cdsRegistros.EnableControls;
   cdsRegistros.GotoBookmark(pos);
end;

procedure TfrmRemessa.miMarcarClick(Sender: TObject);
var
   pos: TBookmark;
begin
   pos := cdsRegistros.GetBookmark;
   cdsRegistros.DisableControls;
   cdsRegistros.First;
   while not cdsRegistros.Eof do
   begin
      cdsRegistros.Edit;
      cdsRegistrosativo.AsBoolean := true;
      cdsRegistros.Next;   
   end;

   if cdsRegistros.State in [dsEdit] then
   begin
      cdsRegistros.Post;   
   end;

   cdsRegistros.Filtered := false;
   cdsRegistros.EnableControls;
   cdsRegistros.GotoBookmark(pos);
end;

procedure TfrmRemessa.qyRegistrosBeforeClose(DataSet: TDataSet);
begin
   if not (qyRegistros.IsEmpty) then begin
      bk := qyRegistros.GetBookmark();
   end
   else begin
      bk := nil;
   end;
end;

procedure TfrmRemessa.qyRegistrosAfterOpen(DataSet: TDataSet);
begin
   if (bk <> nil) AND (cdsRegistros.BookmarkValid(bk)) then begin
      qyRegistros.GotoBookmark(bk);
   end;
end;



end.
