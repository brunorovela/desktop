unit uRetornoCEF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, ComCtrls, StdCtrls, ExtCtrls, Buttons, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Grids,
  DBGrids, ImgList, ToolWin, Menus, ClassRegistros, uListaColigadas, uColigada,
  UMComboBox, ZDbcIntfs, UZDbcFuncs;

type
  Tfrm_Retorno_Banco = class(TForm)
    Panel1: TPanel;
    OpenDialog: TOpenDialog;
    dtcRetorno: TDataSource;
    dtcItens: TDataSource;
    qryDelete: TUMZQuery;
    tblRetorno: TUMZQuery;
    tblRetornoDataRetorno: TDateTimeField;
    tblRetornoBaixados: TSmallintField;
    tblRetornoRejeitados: TSmallintField;
    tblRetornoNomeArquivo: TStringField;
    tblItens: TUMZQuery;
    tblItensSequencia: TIntegerField;
    tblItensOcorrencia: TStringField;
    tblItensVencimento: TDateTimeField;
    tblItensValorTitulo: TFloatField;
    tblItensNossoNumero: TStringField;
    tblItensValorPago: TFloatField;
    tblItensValorAcrescimo: TFloatField;
    tblItensCodigoAluno: TIntegerField;
    tblItensParcela: TSmallintField;
    tblItensSequenciaNoArquivo: TIntegerField;
    tblItensDataPagamento: TDateTimeField;
    tblBanco: TUMZQuery;
    tblBancocd_banco: TStringField;
    tblBanconn_inicio: TSmallintField;
    tblBanconn_tam: TSmallintField;
    tblBanconm_banco: TStringField;
    tblBancobanco_inicio: TSmallintField;
    tblBancobanco_tam: TSmallintField;
    tblBancoretorno_inicio: TIntegerField;
    tblBancoocorre_inicio: TSmallintField;
    tblBancoocorre_tam: TSmallintField;
    tblBancovl_titulo_inicio: TSmallintField;
    tblBancovl_titulo_tam: TSmallintField;
    tblBancovl_pago_inicio: TSmallintField;
    tblBancovl_pago_tam: TSmallintField;
    tblBancovl_acresc_inicio: TSmallintField;
    tblBancovl_acresc_tam: TSmallintField;
    tblBancosequencia_inicio: TSmallintField;
    tblBancosequencia_tam: TSmallintField;
    tblBancodt_pgto_inicio: TSmallintField;
    tblBancodt_pgto_tam: TSmallintField;
    tblRetornooutras_ocorrencias: TSmallintField;
    pnHistorico: TPanel;
    ImageList1: TImageList;
    pmQtd: TPopupMenu;
    tblBancods_layout: TStringField;
    tblBancolayout_inicio: TSmallintField;
    tblBancolayout_tam: TSmallintField;
    tblBanconr_linha_header: TSmallintField;
    tblBanconr_linha_trailer: TSmallintField;
    tblBanconr_linha_registro: TSmallintField;
    tblBancoconta_inicio: TSmallintField;
    tblBancoconta_tam: TSmallintField;
    tblBancomotivo_inicio: TSmallintField;
    tblBancomotivo_tam: TSmallintField;
    tblItenscd_motivo: TStringField;
    tblMotivos: TUMZQuery;
    tblMotivoscd_motivo: TStringField;
    tblMotivosds_motivo: TStringField;
    tblMotivoscd_banco: TStringField;
    tblRetornocd_banco: TStringField;
    tblItensvl_tarifa: TFloatField;
    tblBancotarifa_inicio: TSmallintField;
    tblBancotarifa_tam: TSmallintField;
    tblBancosn_acrescimo_separado: TSmallintField;
    tblBancodt_pgto_formado: TStringField;
    pnBaixa: TPanel;
    lbConta: TLabel;
    lbBanco: TLabel;
    Bevel1: TBevel;
    Bar: TProgressBar;
    lblReg: TLabel;
    Panel2: TPanel;
    lblBaixados: TLabel;
    lblRejeitados: TLabel;
    lblRegistros: TLabel;
    lblOutras: TLabel;
    btnBaixar: TSpeedButton;
    btnCodigoDepartamento: TSpeedButton;
    txtArquivo: TEdit;
    Label1: TLabel;
    tblItensvalorbruto: TFloatField;
    tblItensvalordesconto: TFloatField;
    tblItensdescontoextra: TFloatField;
    tblItensvalorextra: TFloatField;
    tblItensnm_pessoa: TStringField;
    tblItensds_cpf: TStringField;
    tblItensds_motivo: TStringField;
    PageControl1: TPageControl;
    tsRetornos: TTabSheet;
    pgHistorico: TTabControl;
    grd: TDBGrid;
    Panel6: TPanel;
    ToolBar: TToolBar;
    sbExcluir: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    tsConteudo: TTabSheet;
    tcItens: TTabControl;
    grdItens: TDBGrid;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    sbSelecionarColuna: TSpeedButton;
    tblItensds_historico: TStringField;
    tblItensturma: TStringField;
    btBaixar: TToolButton;
    ToolButton8: TToolButton;
    btFechar: TToolButton;
    ToolButton10: TToolButton;
    qItensGrupo: TUMZQuery;
    qItensGrupoocorrencia: TStringField;
    tblBancodt_credito_inicio: TSmallintField;
    tblBancodt_credito_tam: TSmallintField;
    tblBancodt_credito_formato: TStringField;
    tblItensdt_credito: TDateTimeField;
    ToolButton1: TToolButton;
    tblBancolinha_ignorar_inicio: TSmallintField;
    tblBancolinha_ignorar_tamanho: TSmallintField;
    tblBancolinha_ignorar_texto: TStringField;
    tblItensresponsavel: TStringField;
    tblRetornocodigo: TIntegerField;
    tblRetornousuario: TIntegerField;
    tblItensCD_OCORRENCIA: TStringField;
    tblBancocarteira_inicio: TSmallintField;
    tblBancocateira_tam: TSmallintField;
    tblBanconn_inicio2: TSmallintField;
    tblBanconn_tam2: TSmallintField;
    tblBancocarteira_nn1: TStringField;
    tblBancocarteira_nn2: TStringField;
    tblBancofl_dt_pgto_inicio: TIntegerField;
    tblBancofl_dt_pgto: TStringField;
    Panel5: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    qryColigadas: TUMZQuery;
    tblRetornonm_coligada: TStringField;
    tblRetornocd_coligada: TSmallintField;
    SpeedButton1: TSpeedButton;
    ToolButton9: TToolButton;
    tblRetornods_caixa: TStringField;
    cbColigadas: TUMComboBox;
    tblBancods_separador_colunas: TStringField;
    tblBanconr_cpf_inicio: TSmallintField;
    tblBanconr_cpf_tam: TSmallintField;
    tblBancodt_venc_inicio: TSmallintField;
    tblBancodt_venc_tam: TSmallintField;
    tblBancodt_venc_formato: TStringField;
    tblBancosn_liberar_juros: TSmallintField;
    tblItenscodigoretorno: TIntegerField;
    tblItenscd_mensalidade: TIntegerField;
    tblItenssn_baixar: TStringField;
    tblItenssn_baixado: TLargeintField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure grdItensTitleClick(Column: TColumn);
    procedure cbColigadasCloseUp(Sender: TObject);
    procedure cbColigadasChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure tcItensChange(Sender: TObject);
    procedure dtcItensDataChange(Sender: TObject; Field: TField);
    procedure btFecharClick(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure txtArquivoKeyPress(Sender: TObject; var Key: Char);
    procedure sbFecharClick(Sender: TObject);
    procedure CapturarArquivo;
    procedure ProcessarArquivo;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbImprimirTudoClick(Sender: TObject);
    procedure pgHistoricoChange(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    strNossoNumero : String;
    matCobranca : String;
    CobFile : TextFile;
    lngInvalidos, lngBaixados, lngOutras, lngJaPagos, lngSize, lngLidos : Longint;
    lngCodigo : Longint;
    FileAux : File of Char;
    Baixado : Word;

    sColCarteira : String;
    sColValTarifa : String;
    sColValPago : String;
    sColSequencia : String;
    sColCPF : String;
    sColVencimento : String;
    sColOrdem : String;

    iColCPF, iColVencimento : Integer;

    ValPago : Currency;
    ValTitulo : Currency;
    ValAcrescimo : Currency;


    slColunas : TStringlist;
    slValTarifa : TStringList;
    // slValTarifa vai guardar o valor da tarifa para cada conta e data.
    // O formato do array vai armazenar da seguinte forma: CONTA:DATA = VALOR;

    function descobrir_layout : Boolean;
    function selecionaContaBaixar(sConta : String) : Integer;
    function pega_data_pgto : String;
    function pega_data_credito : String;
    procedure InserirItem( achou : boolean; ocorrencia : string; cd_ocorrencia : string );
    procedure BaixarMensa( Conta : Integer; ValorBaixa : Currency );
    Function BaixarDuplicados(Valor : Currency; Conta : Integer) : Currency;
    function BuscaNossoNumero( strNumero : String; sFiltro : String ) : Boolean;
    function getDataCredito(): TDateTime;
    function buscaSiglaSitPorNN(nossoNumero : String): String;

    { Private declarations }
  public
    procedure Filtrar; 

    { Public declarations }
  end;

var
  frm_Retorno_Banco: Tfrm_Retorno_Banco;
  strOcorrencia : string;
  strMotivo : String;
  sConta : String;
  Tarifa : Currency;
  bTarifaPorOcorrencia : Boolean;


implementation

uses Main, uDM, uBaixaBanco, uUsuario, uClassMovimento, uSelCaixa,
  uCamposPlanilhas, uExportaContabil, uRepRecibo, uItemCombo;

{$R *.DFM}

procedure Tfrm_Retorno_Banco.txtArquivoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if txtArquivo.Text = '' then
      CapturarArquivo
    else
      ProcessarArquivo;
    Key := #0;
  end;
end;

procedure Tfrm_Retorno_Banco.CapturarArquivo;
Var Arquivo: TextFile;
    linha : string;
begin
  if OpenDialog.Execute then
     txtArquivo.Text := OpenDialog.FileName
  else
     Exit;

  if not descobrir_layout then Exit;

  { Mostra o Banco }
  lbBanco.Caption := 'Banco :' + tblBanconm_banco.AsString;

  AssignFile( Arquivo, OpenDialog.FileName );
  Reset( Arquivo );

  lngSize := 0;
  readln(Arquivo, linha);

  while not EOF(Arquivo) do
  Begin
  
     if trim(linha) <> '' then begin

       if (tblBancolinha_ignorar_inicio.AsInteger > 0) AND (lngSize > tblBanconr_linha_header.AsInteger) then begin

          if copy(linha, tblBancolinha_ignorar_inicio.AsInteger, tblBancolinha_ignorar_tamanho.AsInteger) <> tblBancolinha_ignorar_texto.AsString then begin

              INC(lngSize);

          end else begin
             DEC(lngSize);
          end;

       end else begin
           INC(lngSize);
       end;
     end;

     readln(Arquivo, linha);
  End;

  if trim(linha) <> '' then begin
     INC(lngSize);
  end;

  CloseFile(Arquivo);

  lngSize := lngSize - tblBanconr_linha_header.AsInteger;
  lngSize := lngSize - tblBanconr_linha_trailer.AsInteger;

  lngSize := lngSize DIV tblBanconr_linha_registro.AsInteger;

  Bar.Max := lngSize;

  lblReg.Caption := 'Registros: ' + IntToStr( lngSize );
  lblRegistros.Caption := lblReg.Caption;

end;

procedure Tfrm_Retorno_Banco.cbColigadasChange(Sender: TObject);
var
  strColigadas : TStringList;
  i : Integer;
  sFiltro,sOperador : string;
begin
   if( cbColigadas.ItemIndex <> 0) then
   begin
      tblRetorno.Filter := 'cd_coligada ='+IntToStr(TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo);
      tblRetorno.Filtered := True;
   end
   else
   begin
      sFiltro := '';
      strColigadas := explode(DM.GetColigadas,',');
      for I := 0 to strColigadas.Count - 1 do
      begin
         sFiltro := sFiltro +sOperador+' cd_coligada = '+strColigadas[i]+' ';
         sOperador := 'or'
      end;
      tblRetorno.Filter := sFiltro;
      tblRetorno.Filtered := True;
   end;
end;

procedure Tfrm_Retorno_Banco.cbColigadasCloseUp(Sender: TObject);
begin
   DM.SalvaColigada(cbColigadas);
end;

procedure Tfrm_Retorno_Banco.ProcessarArquivo;
var
  Arquivo : TextFile;
  str, linha : String;
  nro_linha : integer;
  n : Integer;
  qyRetorno : TUMZQuery;
  qyMaxRetorno : TUMZReadOnlyQuery;
  slValTotal : TStringList;
  slValTarifa : TStringList;
  iContaBaixa : Integer;
  ValTarifa : Currency;

  iCaixa : Integer;

  mov : TMovimento;

  iMov : Integer;
  
  iContaTarifa,
  iCentroTarifa : Integer;

  qyTarifa : TUMZQuery;

  sAux : String;
  dtTarifa : TDateTime;

  siglaNN : String;
begin

   if cbColigadas.ItemIndex = 0 then
   begin
      Mensagem('Selecione uma coligada!', 'Aviso', MB_ICONWARNING + MB_OK);
      Exit;
   end;
   

   slValTotal := TStringList.Create;
   slValTarifa := TStringList.Create;

   iCaixa := -1;

  if tblBancoconta_inicio.AsInteger = 0 then begin

      // Não encontrou a Conta, pedir para selecionar

      if Mensagem('Não foi possível identificar a conta para lançar as baixas. Deseja selecionar a conta manualmente?', Application.Title, MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON1 )
      <> mrYes then Exit;

      frm_SelCAixa.ShowModal;

      if frm_SelCaixa.flgSearch then begin

         iCaixa := frm_SelCaixa.qyCaixacd_caixa.AsInteger;
         lbConta.Caption := 'Conta: ' + frm_SelCaixa.qyCaixads_caixa.AsString;

      end
      else begin

        exit;
      end;

  end;

  { Abrir o Arquivo retorno }

  {$I-}
  AssignFile( FileAux, txtArquivo.Text );
  Reset( FileAux );

  { Verificar se é um arquivo válido }
  if IOResult <> 0 then
  begin
    Mensagem( 'Arquivo inválido.', 'Erro', MB_OK, MB_ICONERROR);
    CloseFile( FileAux );
    FreeAndNil( FileAux );
    Exit;
  end;
  {$I+}

  { Fechar o Arquivo }
  CloseFile( FileAux );

  lngOutras := 0;
  lngInvalidos := 0;
  lngJaPagos := 0;
  lngLidos := 0;
  lngBaixados := 0;

  { Abrir o arquivo para a Baixa }
  AssignFile( CobFile, OpenDialog.FileName );
  Reset( CobFile );

  { passar as linhas do header... não precisamos mais dela }

  n := 1;

  matCobranca := '';

  // Ler o cabeçalho
  while n <= tblBanconr_linha_header.AsInteger do
  Begin
     ReadLn( CobFile, linha );
     if trim(linha) <> '' then begin
        matCobranca := matCobranca + linha;
        inc(n);
     end;
  end;


  if Mensagem('Confirma a baixa do arquivo retorno do banco ' + tblBanconm_banco.AsString + '?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
  <> mrYes then
  Begin
     CloseFile( CobFile );
     Exit;
  End;

  { Vefificar se é um arquivo RETORNO }
  if tblBancoretorno_inicio.AsInteger <> 0 then
  Begin

     if Copy( matCobranca, tblBancoretorno_inicio.AsInteger, 7 ) <> 'RETORNO' then
     begin

       Mensagem( 'Arquivo selecionado não é de retorno.', Application.Title, MB_OK + MB_ICONSTOP );
       CloseFile( CobFile );
       Exit;

     end;

  End;

  tblRetorno.First;

  Dm.CriarConsulta(qyRetorno);
  Dm.CriarConsulta(qyMaxRetorno);

  qyMaxRetorno.Close();
  qyMaxRetorno.SQL.Text := 'SELECT MAX(codigo) as maximo FROM retorno';
  qyMaxRetorno.Open();

  lngCodigo := qyMaxRetorno.FieldByName('maximo').AsInteger + 1;

  { Registrar as informações na tabela retorno }
  qyRetorno.Close;
  qyRetorno.SQL.Clear;
  qyRetorno.SQL.Add('INSERT INTO retorno ');
  qyRetorno.SQL.Add('( Codigo, DataRetorno, Baixados, Rejeitados, outras_ocorrencias, Usuario, NomeArquivo, cd_banco, cd_coligada, cd_caixa )');
  qyRetorno.SQL.Add('VALUES(:codigo, :dataretorno, :baixados, :rejeitados, :outras_ocorrencias, :usuario, :nomeArquivo, :cd_banco, :cd_coligada, :cd_caixa ) ');

  qyRetorno.ParamByName('codigo').AsInteger := lngCodigo;
  qyRetorno.ParamByName('cd_banco').AsString := tblBancocd_banco.AsString;
  qyRetorno.ParamByName('dataretorno').AsDateTime  := DataHoje;
  qyRetorno.ParamByName('baixados').AsInteger    := lngBaixados;
  qyRetorno.ParamByName('rejeitados').AsInteger  := lngInvalidos;
  qyRetorno.ParamByName('outras_ocorrencias').AsInteger := lngOutras;;
  qyRetorno.ParamByName('usuario').AsInteger     := DM.iCdPessoaLogado;
  qyRetorno.ParamByName('cd_coligada').AsInteger := TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo;
  qyRetorno.ParamByName('cd_caixa').AsInteger    := frm_SelCaixa.qyCaixacd_caixa.AsInteger;
  qyRetorno.ParamByName('nomearquivo').AsString  := ExtractFileName( txtArquivo.Text );

  qyRetorno.ExecSQL;


  // Verificar se está configurado uma TARIFA em código de OCORRENCIA
  // campo banco_codigo_retorno.sn_baixas = "T"

    DM.qAux2.Close;
    DM.qAux2.SQL.Clear;
    Dm.qAux2.SQL.Add('select * from banco_codigo_retorno');
    Dm.qAux2.SQL.Add('where cd_banco = :banco and sn_baixar = "T" AND cd_origem = 1');
    Dm.qAux2.ParamByName('banco').AsString := tblBancocd_banco.AsString;
    Dm.qAux2.Open;

    if not Dm.qAux2.EOF then begin
       bTarifaPorOcorrencia := true;
    end else begin
       bTarifaPorOcorrencia := false;
    end;    

  // Fim da tarifa por ocorrencia

  nro_linha := 0;

  while nro_linha < lngSize do
  begin

    Inc( lngLidos );

    { Apresentar resultados na tela }
    Bar.Position := lngLidos;

    lblReg.Caption := 'Registros: ' + IntToStr( lngLidos ) + ' de ' + IntToStr( lngSize );

    lblRejeitados.Caption := 'Rejeitados (N.N. não encontrado): ' + IntToStr( lngInvalidos );

    lblBaixados.Caption := 'Baixados: ' + IntToStr( lngBaixados );

    lblOutras.Caption := 'Outras Ocorrências: ' + IntToStr( lngOutras );

    Application.ProcessMessages;

    matCobranca := '';

    n := 1;

    while n <= tblBanconr_linha_registro.AsInteger do
    begin
       ReadLn( CobFile, linha );
       // Verificar se existe alguma linha para IGNORAR

       if tblBancolinha_ignorar_inicio.AsInteger > 0  then begin

          if copy(linha, tblBancolinha_ignorar_inicio.AsInteger, tblBancolinha_ignorar_tamanho.AsInteger) = tblBancolinha_ignorar_texto.AsString then begin

              n := 1;
              matCobranca := '';
              continue;

          end;

       end;

       if (trim(linha) <> '') OR EOF(CobFile) then begin
          matCobranca := matCobranca + linha;
          inc(n);
       end;
    end;

    // Arqui a variavel matCobranca tem a linha do destalhes completa // Verificar se trata-se de uso de CSV

    if tblBancods_separador_colunas.AsString <> '' then begin
       // É com separador = CSV
       FreeAndNil(slColunas);
       slColunas := TStringList.Create();
       SplitString(matCobranca, Trim(tblBancods_separador_colunas.AsString), slColunas);

       if tblBanconn_inicio.AsInteger > 0 then begin
           // Usa Nosso Número
           if tblBancocarteira_inicio.AsInteger > 0 then begin
              sColCarteira  := Trim(slColunas[tblBancocarteira_inicio.AsInteger-1]);
              if sColCarteira = tblBancocarteira_nn2.AsString then begin
                   strNossoNumero := Trim(slColunas[tblBanconn_inicio2.AsInteger-1]);
              end else begin
                   strNossoNumero :=  Trim(slColunas[tblBanconn_inicio.AsInteger-1]);
              end;
           end else begin
               strNossoNumero :=  Trim(slColunas[tblBanconn_inicio.AsInteger-1]);
           end;


       end else begin

           // Não usa NossoNúmero - Identificar pelo CPF e VENCIMENTO;

           sColCPF := Trim(slColunas[tblBanconr_cpf_inicio.AsInteger-1]);
           sColCPF := StringReplace(sColCPF, '-', '', [rfReplaceAll]);
           sColCPF := StringReplace(sColCPF, '.', '', [rfReplaceAll]);
           sColCPF := FillString(sColCPF, alRight, '0', 11, true);


           sColVencimento := Trim(slColunas[tblBancodt_venc_inicio.AsInteger-1]);
           sColVencimento := StringReplace(sColVencimento, '-', '', [rfReplaceAll]);
           sColVencimento := StringReplace(sColVencimento, '/', '', [rfReplaceAll]);

           if (tblBancodt_venc_formato.AsString = 'amd') then begin

               sColVencimento :=  Copy( sColVencimento, 1 + tblBancodt_venc_tam.AsInteger - 2, 2 )
                   + '/' + Copy( sColVencimento, 1 + tblBancodt_venc_tam.AsInteger - 4, 2 )
                   + '/' + Copy( sColVencimento, 1, tblBancodt_venc_tam.AsInteger - 4);

           end else begin

               sColVencimento :=  Copy( sColVencimento, 1, 2 )
                   + '/' + Copy( sColVencimento, 1 + 2 , 2 )
                   + '/' + Copy( sColVencimento, 1 + 4, tblBancodt_venc_tam.AsInteger - 4);
           end;

       end;


       if tblBancoconta_inicio.AsInteger > 0 then begin
          sConta := Trim(slColunas[tblBancoconta_inicio.AsInteger-1]);
       end;

       // Senão tiver configuração de código de ocorrencia no arquivo, assumir = OK - esse valor deve exitir em banco_codigo_retorno
       if tblBancoocorre_inicio.AsInteger = 0 then begin
          strOcorrencia := 'OK';
       end else begin
          strOcorrencia := Trim(slColunas[tblBancoocorre_inicio.AsInteger-1]);
       end;


       if tblBancomotivo_inicio.AsInteger > 0 then begin
          strMotivo := Trim(slColunas[tblBancomotivo_inicio.AsInteger-1]); 
       end else begin
          strMotivo := '';
       end;

       if tblBancotarifa_inicio.AsInteger > 0  then begin
          sColValTarifa := Trim(slColunas[tblBancotarifa_inicio.AsInteger-1]);
          ValTarifa := StrToCurr( sColValTarifa );
       end;

       sColValPago := Trim(slColunas[tblBancovl_pago_inicio.AsInteger-1]);
       ValPago := StrToCurr( sColValPago );


       sColValPago := Trim(slColunas[tblBancovl_titulo_inicio.AsInteger-1]);
       ValTitulo := StrToCurr( sColValPago  );

       if tblBancosn_acrescimo_separado.AsInteger = 1 then begin
          sColValPago := Trim(slColunas[tblBancovl_acresc_inicio.AsInteger-1]);
          ValAcrescimo := StrToCurr( sColValPago );
          ValPago := ValPago + ValAcrescimo
       end;

       sColSequencia := Trim(slColunas[ tblBancosequencia_inicio.AsInteger-1]);

//       Trim(slColunas[ ]);

    end else begin
       // Não é com separador

       if tblBanconn_inicio.AsInteger > 0 then begin
          // Busca por NN
           if tblBancocarteira_inicio.AsInteger > 0 then begin
              sColCarteira := Copy(matCobranca, tblBancocarteira_inicio.AsInteger, tblBancocateira_tam.AsInteger);
              if sColCarteira = tblBancocarteira_nn2.AsString then begin
                 strNossoNumero :=  Copy( matCobranca, tblBanconn_inicio2.AsInteger, tblBanconn_tam2.AsInteger );
              end else begin
                 strNossoNumero :=  Copy( matCobranca, tblBanconn_inicio.AsInteger, tblBanconn_tam.AsInteger );
              end;
           end else begin
              strNossoNumero :=  Copy( matCobranca, tblBanconn_inicio.AsInteger, tblBanconn_tam.AsInteger );
           end;

       end else begin
          // Não usa NossoNúmero - Identificar pelo CPF e VENCIMENTO;

           sColCPF := Trim( Copy(matCobranca, tblBanconr_cpf_inicio.AsInteger, tblBanconr_cpf_tam.AsInteger ) );
           sColCPF := StringReplace(sColCPF, '-', '', [rfReplaceAll]);
           sColCPF := StringReplace(sColCPF, '.', '', [rfReplaceAll]);
           sColCPF := FillString(sColCPF, alRight, '0', 11, true);


           if (tblBancodt_venc_formato.AsString = 'amd') then begin

              sColVencimento :=  Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + tblBancodt_venc_tam.AsInteger - 2, 2 )
                    + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + tblBancodt_venc_tam.AsInteger - 4, 2 )
                    + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger, tblBancodt_venc_tam.AsInteger - 4);

           end else begin

              sColVencimento :=  Copy( matCobranca, tblBancodt_venc_inicio.AsInteger, 2 )
                    + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + 2 , 2 )
                    + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + 4, tblBancodt_venc_tam.AsInteger - 4);

           end;
           
       end;


       if tblBancoconta_inicio.AsInteger > 0 then begin
          sConta := Copy(matCobranca, tblBancoconta_inicio.AsInteger, tblBancoconta_tam.AsInteger);
       end;

       if tblBancoocorre_inicio.AsInteger = 0 then begin
          strOcorrencia := 'OK';
       end else begin
          strOcorrencia := Copy( matCobranca, tblBancoocorre_inicio.AsInteger, tblBancoocorre_tam.AsInteger ) ;
       end;

       if tblBancomotivo_inicio.AsInteger > 0 then begin
          strMotivo := Copy(matCobranca, tblBancomotivo_inicio.AsInteger, tblBancomotivo_tam.AsInteger);
       end else begin
          strMotivo := '';
       end;

       if tblBancotarifa_inicio.AsInteger > 0  then begin
          sColValTarifa := Copy( matCobranca, tblBancotarifa_inicio.AsInteger, tblBancotarifa_tam.AsInteger);

          ValTarifa := StrToCurr(Copy( sColValTarifa, 1, tblBancotarifa_tam.AsInteger - 2 ) + ',' +
                        Copy( sColValTarifa, 1 + tblBancotarifa_tam.AsInteger - 2 ,  2 ));
       end;

       ValPago := StrToCurr(Copy( matCobranca, tblBancovl_pago_inicio.AsInteger, tblBancovl_pago_tam.AsInteger - 2 ) + ',' +
                                 Copy( matCobranca, tblBancovl_pago_inicio.AsInteger + tblBancovl_pago_tam.AsInteger - 2 ,  2 ));

       ValTitulo := StrToCurr(Copy( matCobranca, tblBancovl_titulo_inicio.AsInteger, tblBancovl_titulo_tam.AsInteger - 2 ) + ',' +
                                 Copy( matCobranca, tblBancovl_titulo_inicio.AsInteger + tblBancovl_titulo_tam.AsInteger - 2 ,  2 ));


       if tblBancosn_acrescimo_separado.AsInteger = 1 then begin
              ValAcrescimo := StrToCurr(Copy( matCobranca, tblBancovl_acresc_inicio.AsInteger, tblBancovl_acresc_tam.AsInteger - 2 ) + ',' +
                         Copy( matCobranca, tblBancovl_acresc_inicio.AsInteger + tblBancovl_acresc_tam.AsInteger - 2 ,  2 ));

              ValPago := ValPago +   ValAcrescimo;
       end;

       sColSequencia := Copy(matCobranca, tblBancosequencia_inicio.AsInteger, tblBancosequencia_tam.AsInteger);

    end;


    inc(nro_linha);

    if nro_linha > lngSize then Break;

    { NossoNumero }


    if tblBancoconta_inicio.AsInteger > 0 then begin
       lbConta.Caption := 'Conta: ' + sConta;
    end;

    // Buscar o código de OCORRENCIA  
    DM.qAux2.Close;
    DM.qAux2.SQL.Clear;
    Dm.qAux2.SQL.Add('select * from banco_codigo_retorno');
    Dm.qAux2.SQL.Add('where cd_banco = :banco and cd_retorno = :retorno AND cd_origem = 1');
    Dm.qAux2.ParamByName('banco').AsString := tblBancocd_banco.AsString;
    DM.qAux2.ParamByName('retorno').AsString := strOcorrencia;
    Dm.qAux2.Open;

    // Caso a ocorrencia não seja de baixa, zerar o valor pago, para não confundir visualmente o cliente.
    if DM.qAux2.FieldByName('sn_baixar').AsString = 'N' then begin
       ValPago := 0;
    end;

    

    // Pegar o valor da tarifa

   { Alterar Ocorrencia se usar remessa }


    // No caso da tarifa ser configurada por códig ode retorno, somente somar se a ocorrencia for sn_baixas = T
    // Claudionor
    
    if (tblBancotarifa_tam.AsInteger > 0) AND
       (
          (  not bTarifaPorOcorrencia ) OR
          ( (bTarifaPorOcorrencia AND (DM.qAux2.FieldByName('sn_baixar').AsString = 'T') ) )
       )
    then begin

            Tarifa := ValTarifa;

            if ValTarifa > 0  then begin

               if iCaixa < 0 then begin   // Não tem conta selecionada para baixa
                   iContaBaixa := selecionaContaBaixar(sConta);
               end
               else   // Tem que baixar sempre na conta selecionada no inicio
               begin
                    iContaBaixa := iCaixa;
               end;

               // Montar a chave do array como CONTA:DATACREDITO
               // O Sistema terá um lançamento de tarifa para cada uma dessa chave
               sAux := IntToStr(iContaBaixa);
               sAux := sAux + ':'  + Self.pega_data_credito();

               if slValTarifa.IndexOfName(sAux) < 0 then begin
                  slValTarifa.Add(sAux + '=' + FloatToStr(ValTarifa));
               end
               else begin
                  ValTarifa := ValTarifa + StrToFloat(slValTarifa.Values[sAux]);
                  slValTarifa.Values[sAux] := FloatToStr(ValTarifa);
               end;

            end;
    end else begin

       Tarifa := 0;

    end;    

    Baixado := 0;

    if DM.qAux2.Eof then    // A ocorrencia não foi cadastrada. O baixa deve ser ignorada
    Begin
        { Verificar se o nossonúmero existe }
        if BuscaNossoNumero( strNossoNumero, '' ) then // Verificar se o nn existe
        Begin
           Inc( lngOutras );
           InserirItem( True, 'OCORRENCIA (' + strOcorrencia + ')', strOcorrencia );
        End
        else
        Begin
           Inc( lngInvalidos );
           InserirItem( False, 'NN NAO ENC. (' + strOcorrencia + ')', strOcorrencia );
        End;
    End
    ELSE
    Begin
       if Dm.isTrue(DM.qAux2.FieldByName('sn_baixar').AsString) then
       Begin

       	if BuscaNossoNumero( strNossoNumero, ' (situacao = 2 OR situacao = 8 OR situacao = 10) ' ) then
        Begin
               // VERIFICAR A QUANTIDADE ENCONTRADA

               Baixado := 1;


               if DM.tblMensalidades.RecordCount > 1 then
               Begin

                   // Verificar nos parametros se deve baixar nossosnumeros duplicados
                   if (DM.variavel_parametro('financeiro_retorno_baixar_duplicados') = 'S') OR (DM.variavel_parametro('financeiro_retorno_baixar_duplicados') = 'P') then
                   begin

                      ValPago := BaixarDuplicados( ValPago, iCaixa);

                      if iCaixa < 0 then begin   // Não tem conta selecionada para baixa
                         iContaBaixa := selecionaContaBaixar(sConta);
                      end
                      else   // Tem que baixar sempre na conta selecionada no inicio
                      begin
                          iContaBaixa := iCaixa;
                      end;

                      if slValTotal.IndexOfName(IntToStr(iContaBaixa)) < 0 then begin
                         slValTotal.Add(IntToStr(iContaBaixa) + '=' + FloatToStr(ValPago));
                      end
                      else
                      begin
                         ValPago := ValPago + StrToFloat(slValTotal.Values[IntToStr(iContaBaixa)]);
                         slValTotal.Values[IntToStr(iContaBaixa)] := FloatToStr(ValPago);
                      end;
                   end
                   else
                   begin
                      if DM.variavel_parametro('financeiro_retorno_baixar_duplicados') = 'I' then begin
                         // Tentar baixar a maior parcela por completo
                         while (not Dm.tblMensalidades.Eof ) AND (ValPago >0) do
                         begin
                             DM.tblMensalidades.Edit();
                             DM.tblMensalidadesDataPagamento.AsString := pega_data_pgto();
                             if ValPago = Dm.tblMensalidadesValorTotalCalc.AsCurrency then begin
                                 Dm.tblMensalidades.Cancel();
                                 BaixarMensa(iCaixa, ValPago);

                                 if iCaixa < 0 then begin   // Não tem conta selecionada para baixa
                                    iContaBaixa := selecionaContaBaixar(sConta);
                                 end
                                 else   // Tem que baixar sempre na conta selecionada no inicio
                                 begin
                                     iContaBaixa := iCaixa;
                                 end;

                                 if slValTotal.IndexOfName(IntToStr(iContaBaixa)) < 0 then begin
                                    slValTotal.Add(IntToStr(iContaBaixa) + '=' + FloatToStr(ValPago));
                                 end
                                 else begin
                                    ValPago := ValPago + StrToFloat(slValTotal.Values[IntToStr(iContaBaixa)]);
                                    slValTotal.Values[IntToStr(iContaBaixa)] := FloatToStr(ValPago);
                                 end;

                                 ValPago := 0;

                             end;
                             Dm.tblMensalidades.Cancel();
                             DM.tblMensalidades.Next;
                         end;

                         if ValPago > 0 then begin
                              {
                             // Se não conseguiu baixar nenhuma, então baixar esse de menor valor parcial
                              BaixarMensa(iCaixa, ValPago);

                              if iCaixa < 0 then begin   // Não tem conta selecionada para baixa
                                 iContaBaixa := selecionaContaBaixar(sConta);
                              end
                              else   // Tem que baixar sempre na conta selecionada no inicio
                              begin
                                  iContaBaixa := iCaixa;
                              end;

                              if slValTotal.IndexOfName(IntToStr(iContaBaixa)) < 0 then begin
                                 slValTotal.Add(IntToStr(iContaBaixa) + '=' + FloatToStr(ValPago));
                              end
                              else begin
                                 ValPago := ValPago + StrToFloat(slValTotal.Values[IntToStr(iContaBaixa)]);
                                 slValTotal.Values[IntToStr(iContaBaixa)] := FloatToStr(ValPago);
                              end;

                              ValPago := 0;
                             }
                             Inc(lngOutras);
                             Baixado := 0;
                             InserirItem( true, 'VALOR APRESENTA DIVERGÊNCIAS', DM.qAux2.FieldByName('cd_retorno').AsString );

                         end
                      end
                      else
                      begin
                         Inc( lngJaPagos );
                        Inc( lngOutras );
                        Baixado := 0;
                        InserirItem( true, 'NN DUPLICADO - ' + DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString );
                      end;
                   end;
               End
               Else
               Begin

          	      BaixarMensa(iCaixa, ValPago);

                  if iCaixa < 0 then begin   // Não tem conta selecionada para baixa
                     iContaBaixa := selecionaContaBaixar(sConta);
                  end
                  else   // Tem que baixar sempre na conta selecionada no inicio
                  begin
                      iContaBaixa := iCaixa;
                  end;

                  if slValTotal.IndexOfName(IntToStr(iContaBaixa)) < 0 then begin
                     slValTotal.Add(IntToStr(iContaBaixa) + '=' + FloatToStr(ValPago));
                  end
                  else begin
                     ValPago := ValPago + StrToFloat(slValTotal.Values[IntToStr(iContaBaixa)]);
                     slValTotal.Values[IntToStr(iContaBaixa)] := FloatToStr(ValPago);
                  end;

                  // Fim da soma do valor pago
               End;


         End
      	 else
      	 begin
        	   if BuscaNossoNumero( strNossoNumero, ' (situacao = 0 OR situacao = 1) ' ) then
        	   begin
               // VERIFICAR A QUANTIDADE ENCONTRADA

            	      Inc( lngJaPagos );
                    Inc( lngOutras );
             	      InserirItem( true, 'JA PAGO - ' + DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString ); { 0 - JA PAGO }
             end
    	       else
             begin
                Inc( lngInvalidos );

                // Se o nosso numero não esta na situação OK verifica se não esta em uma especifica
                if BuscaNossoNumero( strNossoNumero, ' (situacao in (3,4,5)) ' ) then
                begin
                  siglaNN := buscaSiglaSitPorNN(strNossoNumero);
                  InserirItem( False, 'NN NAO BAIXADO - SIT(' + siglaNN + ') - ' + DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString );
                end
                else
                begin
                  InserirItem( False, 'NN NAO ENC. - ' + DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString );
                end;
             end;
      	 end;
       End
       Else  // Náo é baixa
       Begin
          { Verificar se o nossonúmero existe }
          if BuscaNossoNumero( strNossoNumero, '' ) then
          Begin
              if Dm.variavel_parametro('financeiro_retorno_baixar_duplicados') = 'S' then begin

                while not DM.tblMensalidades.Eof do begin

                  Inc( lngOutras );
                  InserirItem( true, DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString);

                  DM.tblMensalidades.Next();
                end;

              end else begin

                InserirItem( true, DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString);
              end;
          End
          else
          Begin
              Inc( lngInvalidos );
              InserirItem( false, 'NN NAO ENC. - ' + DM.qAux2.FieldByName('ds_ocorrencia').AsString, DM.qAux2.FieldByName('cd_retorno').AsString);
          End;
       End;

       // Computar as Tarifas

    End;


    { Apresentar resultados na tela }
    Bar.Position := lngLidos;

    lblReg.Caption := 'Registros: ' + IntToStr( lngLidos ) + ' de ' + IntToStr( lngSize );

    lblRejeitados.Caption := 'Rejeitados (N.N. não encontrado): ' + IntToStr( lngInvalidos );

    lblBaixados.Caption := 'Baixados: ' + IntToStr( lngBaixados );

    lblOutras.Caption := 'Outras Ocorrências: ' + IntToStr( lngOutras );

    Application.ProcessMessages;    

  end;

  { Atualiza as informações na tabela retorno (as quantidades de baixados, reijeitados, outras ocorrencias }

  qyRetorno.Close;
  qyRetorno.SQL.Clear;
  qyRetorno.SQL.Add('UPDATE retorno SET ');
  qyRetorno.SQL.Add('Baixados = :baixados, Rejeitados = :rejeitados, outras_ocorrencias = :outras_ocorrencias ');
  qyRetorno.SQL.Add('WHERE codigo = :codigo');

  qyRetorno.ParamByName('codigo').AsInteger := lngCodigo;
  qyRetorno.ParamByName('baixados').AsInteger    := lngBaixados;
  qyRetorno.ParamByName('rejeitados').AsInteger  := lngInvalidos;
  qyRetorno.ParamByName('outras_ocorrencias').AsInteger := lngOutras;

  qyRetorno.ExecSQL;

  Screen.Cursor := crDefault;

  Bar.Max := 0;
  lblReg.Caption := 'Registros:';

  DM.tblMensalidades.Close;

// Registrar lançamento na conta banco do ValorTotal

  // Registrar os debitos das Tarifas
  if slValTarifa.Count > 0 then begin

    if Mensagem('Deseja lançar as tarifas do retorno nas contas específicas?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then begin

        for n:= 0 to slValTarifa.Count - 1 do begin

            // Separar a chave para obter a conta e a data de crédito;
            sAux := slValTarifa.Names[n];
            iCaixa := StrToInt(Copy(sAux, 1, Pos(':', sAux) - 1));  // Conta
            dtTarifa := StrToDate(Copy(sAux, Pos(':', sAux) + 1));


            if iCaixa <> -1 then begin

               mov := TMovimento.Create;

               mov.Historico := Dm.variavel_parametro('financeiro_retorno_tarifa_historico');

               if mov.Historico = '' then begin

                  mov.Historico := 'TARIFAS BANCÁRIAS - BOLETOS';

               end;

               mov.ValorMovimento := StrToFloat(slValTarifa.ValueFromIndex[n]);

               mov.ValorEmDinheiro := StrToFloat(slValTarifa.ValueFromIndex[n]);
               mov.ValorEmCheque   := 0;
               mov.Mensalidade     := 0;
               mov.EntradaSaida    := 2;  // Débito na Conta
               mov.CodAcao         := Dm.BuscarCodigoAcaoPadrao( 4 );
               mov.NumeroDocumento := ExtractFileName( txtArquivo.Text );
               mov.DataLiberacao := Dm.DataAtual();
               mov.Origem := 1; // Contas a Receber;

               mov.DataMovimento := dtTarifa;

               mov.Coligada := TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo;

               iMov := mov.RegistrarMovimentacaoTe( iCaixa );

               // Buscar os códigos de plano de contas e centro de custo para tarifas

               DM.CriarConsulta(qyTarifa);
               qyTarifa.SQL.Text := ' SELECT cd_conta_tarifa, cd_centro_tarifa FROM fin_cadastro_contas ' +
                                    '  WHERE cd_caixa = ' +  IntToStr(iCaixa);

               qyTarifa.Open();

               iContaTarifa := qyTarifa.FieldByName('cd_conta_tarifa').AsInteger;
               iCentroTarifa := qyTarifa.FieldByName('cd_centro_tarifa').AsInteger;

               // Inserir apripriação para a tarifa

               qyTarifa.Close();

               qyTarifa.SQL.Text := 'INSERT INTO fin_apropria_te (cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento) '+
                                    'VALUES  (:cd_movimento_te, :cd_coligada, :cd_conta, :cd_centro, round(:vl_movimento,2)) ';

               qyTarifa.ParamByName('cd_movimento_te').AsInteger := iMov;
               qyTarifa.ParamByName('cd_coligada').AsInteger := TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo;

               qyTarifa.ParamByName('cd_conta').AsInteger := iContaTarifa;
               qyTarifa.ParamByName('cd_centro').AsInteger := iCentroTarifa;
               qyTarifa.ParamByName('vl_movimento').AsFloat := StrToFloat(slValTarifa.ValueFromIndex[n]);
               qyTarifa.ExecSQL();

               FreeAndNil(qyTarifa);

               FreeAndNil( mov );

            end;

        end;
    
    end;


  end;



// fim registro na conta banco

  FreeAndNil(qyRetorno);

  CloseFile( CobFile );

  tblRetorno.DisableControls;
  tblRetorno.Close;
  tblRetorno.Open;
  tblRetorno.First;
  tblRetorno.EnableControls;

  FreeAndNil(slValTotal);
  FreeAndNil(slValTarifa);
end;

Function Tfrm_Retorno_Banco.BaixarDuplicados(Valor: Currency; Conta: Integer): Currency;
const
   SSQLInsertRetornoItens =
      'INSERT INTO RETORNO_ITENS (' +
         'CD_RETORNO,' +
         'CD_OCORRENCIA,' +
         'DT_VENCIMENTO,' +
         'VL_TITULO,' +
         'NR_NOSSONUMERO,' +
         'VL_PAGO,' +
         'VL_ACRESCIMO,' +
         'CD_PESSOA,' +
         'NR_SEQUENCIA,' +
         'DT_PAGAMENTO,' +
         'DT_CREDITO)' +
      'VALUES ' +
         '(?, ?, ?, ?, ?, ?, 0, ?, ?, ?, ?)';
Var
   // Valores contidos na mensalidade do aluno
   aMensaTotalCalc : Array of Currency;  // Valor total calculado pelo UNIMESTRE
   aMensaLiquido   : Array of Currency;  // Valor Bruto + ValorExtra - DescontoExtra + ValorJuros(fixo)
   aMensaDesconto  : Array of Currency;  // Valor Desconto
   aMensaJuros     : Array of Currency;  // Juros CALCULADO - JUROS(fixo)

   //Valores que serão baixados
   aBaixaTotal     : Array of Currency; // Valor que será baixado (líquido)
   aBaixaLiquido   : Array of Currency; // Valor Bruto + ValorExtra - DescontoExtra + ValorJuros(fixo)
   aBaixaDesconto  : Array of Currency; // Valor Desconto
   aBaixaJuros     : Array of Currency; // Juros CALCULADO - JUROS(fixo)
   aBaixaDiferenca : Array of Currency;

   cValorPendente  : Currency;

   i : Integer;

   bBaixouTodas : Boolean;
   Stmt: IZPreparedStatement;
begin

   // Nova Lógica da Baixa DUPLICADA - BOLETOS AGRUPADOS
   // A tabela de mensalidades neste ponto tem todos os registos com o mesmo
   // NN em ordem decrescente de valor.

   // Guardar os valores atualizados das mensalidades encontradas
   Dm.tblMensalidades.First();

   // Definir tamanho dos Arrays;

   SetLength(aMensaTotalCalc, DM.tblMensalidades.RecordCount);
   SetLength(aMensaLiquido,   DM.tblMensalidades.RecordCount);
   SetLength(aMensaDesconto,  DM.tblMensalidades.RecordCount);
   SetLength(aMensaJuros,     DM.tblMensalidades.RecordCount);

   SetLength(aBaixaTotal,     DM.tblMensalidades.RecordCount);
   SetLength(aBaixaLiquido,   DM.tblMensalidades.RecordCount);
   SetLength(aBaixaDesconto,  DM.tblMensalidades.RecordCount);
   SetLength(aBaixaJuros,     DM.tblMensalidades.RecordCount);
   SetLength(aBaixaDiferenca, DM.tblMensalidades.RecordCount);

   i := 0;

   while not Dm.tblMensalidades.Eof do begin

      // Colocar a data de pagamento para saber o valor no dia do pagamento
      DM.tblMensalidades.Edit;

      DM.tblMensalidadesDataPagamento.AsString :=  pega_data_pgto();
      DM.tblMensalidadesdt_credito.AsString := pega_data_credito();

      aMensaTotalCalc[i] := DM.tblMensalidadesValorTotalCalc.AsCurrency;

      aMensaLiquido[i]   := DM.tblMensalidadesValorBruto.AsCurrency +
                            DM.tblMensalidadesValorExtra.AsCurrency +
                            DM.tblMensalidadesValorJuros.AsCurrency -
                            DM.tblMensalidadesDescontoExtra.AsCurrency;

      aMensaDesconto[i]  := DM.tblMensalidadesValorDesconto.AsCurrency;

      aMensaJuros[i]     := DM.tblMensalidadesValorJurosCalc.AsCurrency -
                            DM.tblMensalidadesValorJuros.AsCurrency;

      INC(i);

      DM.tblMensalidades.Cancel();

      DM.tblMensalidades.Next();

   end;

   cValorPendente := Valor;

   // Tentar baixar com o valor líquido

   bBaixouTodas := true;

   for i := 0 to Length(aMensaTotalCalc) - 1 do begin

      if (aMensaTotalCalc[i] <= cValorPendente) then begin
         aBaixaTotal[i]    := aMensaTotalCalc[i];
         aBaixaDesconto[i] := aMensaDesconto[i];
         aBaixaJuros[i]    := aMensaJuros[i];
         aBaixaDiferenca[i] := 0;
         cValorPendente := cValorPendente - aMensaTotalCalc[i];
      end else begin

         aBaixaDiferenca[i] := aMensaTotalCalc[i] - cValorPendente;
         bBaixouTodas  := false;

      end;


   end;

   // SE financeiro_retorno_baixar_duplicados não for IGUAL a P, então não é para retirar descontos e incluir juros, mas sim, deixar o valor
   // Pago a maior como BAIXA PENDENTE
   // Ou Seja, se é um retorno com vários nossonumeros, e o valor pago é maior do que o Valor líquido que o sistema está calculando,
   // E o parametro financeiro_retorno_baixar_duplicados está configurado com P, o sistema vai deixar a diferença paga a maior como BAIXA PENDENTE
   IF (DM.variavel_parametro('financeiro_retorno_baixar_duplicados') = 'S') THEN BEGIN

       // Após efetuar todas as baixas do valor líquido, se sobrar dinheiro,
       // Tentar retirar do desconto
       if (cValorPendente > 0) And (bBaixouTodas) then begin

          for i := 0 to Length(aBaixaDesconto) - 1 do begin

              // Se o aluno tinha desconto
              if (aBaixaDesconto[i] > 0) AND (aBaixaTotal[i] > 0)  then begin

                 if aMensaDesconto[i] <= cValorPendente then begin

                    cValorPendente := cValorPendente - aBaixaDesconto[i];
                    aBaixaTotal[i] := aBaixaTotal[i] + aBaixaDesconto[i];
                    aBaixaDesconto[i] := 0;

                 end else begin

                    aBaixaDesconto[i] := aBaixaDesconto[i] - cValorPendente;
                    aBaixaTotal[i] := aBaixaTotal[i] + cValorPendente;
                    cValorPendente := 0;

                 end;
              end;
          end;
       end;

       // Mesmo retirando o desconto, sobrou dinheiro
       // Verificar se ficou alguma parcela sem baixar para baixar parcial
       if cValorPendente > 0 then
       begin
          for i := Length(aBaixaDesconto) - 1 downto 0 do
          begin
              // Se o aluno tinha desconto
              if ((aBaixaTotal[i] = 0) and (cValorPendente > 0)) then
              begin
                  aBaixaTotal[i] := cValorPendente;
                  cValorPendente := 0
              end;
          end;
       end;

   end;


   // Mesmo verificando o desconto, ainda sobrou dinheiro...
   // Verificar se deve colocar como acréscimo ou gerar a diferença
   if RoundFloat(cValorPendente,2) > 0 then
   begin

      Stmt := PrepareStatement(SSQLInsertRetornoItens);
      try
         Stmt.SetInt(1, tblRetornocodigo.AsInteger + 1);
         Stmt.SetString(2, strOcorrencia);
         Stmt.SetDate(3, DM.tblMensalidadesDataVencimento.AsDateTime);
         Stmt.SetFloat(4, cValorPendente);
         Stmt.SetString(5, DM.tblMensalidadesNossoNumero.AsString);
         Stmt.SetFloat(6, cValorPendente);
         Stmt.SetInt(7, DM.tblMensalidadesCodigoAluno.AsInteger);
         Stmt.SetString(9, sColSequencia);
         Stmt.SetDate(10, StrToDate(pega_data_pgto));
         Stmt.SetDate(11, StrToDate(pega_data_credito));
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
      
   end;

   i := 0;
   DM.tblMensalidades.First;

   while not DM.tblMensalidades.Eof do
   begin
      if (aBaixaTotal[i] > 0) then
      begin
          BaixarMensa(Conta, aBaixaTotal[i]);
      end;
      Dm.tblMensalidades.Next;
      Inc(i);
   end;
end;

procedure Tfrm_Retorno_Banco.BaixarMensa( Conta : Integer ; ValorBaixa : Currency );
var
  flg : Boolean;
  NovoJuros : Currency;
  NovoBruto : Currency;
  ValorTotal : Currency;
  iCodMovTe : Integer;

  iContaBaixa : Integer;


  sAux : String;

begin

  flg := False;

//  try

     DM.tblMensalidades.Edit;

     { Valor Pago }
     DM.tblMensalidadesDataPagamento.AsString := pega_data_pgto();
     DM.tblMensalidadesdt_credito.AsString := pega_data_credito();

     DM.tblMensalidadesValorPago.AsCurrency := RoundFloat(ValorBaixa, 2);

//     DM.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesValorJurosCalc.AsCurrency;

     DM.tblMensalidadesUsuario.AsString := 'RETORNO';

     if Conta < 0 then begin   // Não tem conta selecionada para baixa
        iContaBaixa := selecionaContaBaixar(sConta);
     end else begin  // Tem que baixar sempre na conta selecionada no inicio
        iContaBaixa := conta;
     end;


     // Verificar se deve liberar os juros para todos os registros - configuração no banco_parametro_retorno
     if tblBancosn_liberar_juros.AsInteger = 1 then begin
        DM.tblMensalidadessn_liberar_juros.AsInteger := 1;
     end;
     
     flg := not (DM.BaixarMensalidade(iContaBaixa, ExtractFileName( txtArquivo.Text ), TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo));

//  except
//     DM.tblMensalidades.Cancel;
//  end;

  if not flg then
    InserirItem( True, 'OK' , DM.qAux2.FieldByName('cd_retorno').AsString)
  else
    InserirItem( True, 'PGTO PARCIAL', DM.qAux2.FieldByName('cd_retorno').AsString  );

  Inc( lngBaixados );
end;


procedure Tfrm_Retorno_Banco.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Retorno_Banco.FormShow(Sender: TObject);
const
   S_SQL_RETORNO =
      ' SELECT CODIGO, DATARETORNO, USUARIO, BAIXADOS, REJEITADOS, OUTRAS_OCORRENCIAS, ' +
      '        NOMEARQUIVO, CD_BANCO, c.CD_COLIGADA, c.nm_coligada, fcc.ds_caixa '+
      ' FROM RETORNO ' +
      '      INNER JOIN coligadas c ON (c.cd_coligada = retorno.cd_coligada) '+
      '      LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = Retorno.cd_caixa) '+
      ' WHERE c.cd_coligada IN ( %s ) ';

   S_SQL_RETORNO_MYSQL =
      S_SQL_RETORNO + ' ORDER BY CODIGO DESC LIMIT 30 ';

   S_SQL_RETORNO_ORACLE =
      S_SQL_RETORNO + ' AND ROWNUM <= 30 ORDER BY CODIGO DESC ';

   function GetSQLByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_RETORNO_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_RETORNO_MYSQL;

      { Filtrar somente as coligadas filhas logadas }
      Result := Format( Result, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   end;
var
   lista_coligadas_filhas : TListaColigadas;
   I : Integer; 
begin
   DM.CarregaColigadas(cbColigadas);
   DM.TodasMaiusculas(TForm(Sender));
   tblItens.Close;
   tblRetorno.Close;
   tblRetorno.SQL.Text := GetSQLByProtocol;
   tblRetorno.Open;
   PageControl1.ActivePageIndex := 0;
   cbColigadasChange(nil);
   sColOrdem := 'ri.nr_sequencia';
end;


procedure Tfrm_Retorno_Banco.FormHide(Sender: TObject);
begin
  tblRetorno.Close;
  tblItens.Close;
end;

procedure Tfrm_Retorno_Banco.InserirItem( achou : boolean; ocorrencia : string; cd_ocorrencia : string );
const
   SSQLInsertRetornoItensTitulos =
      'INSERT INTO RETORNO_ITENS_TITULOS (CD_RETORNO, NR_SEQUENCIA, CD_MENSALIDADE) VALUES (?, ?, ?)';
   SSQLInsertRetornoItens =
      'INSERT INTO RETORNO_ITENS (' +
         'CD_RETORNO,' +
         'DT_VENCIMENTO,' +
         'VL_TITULO,' +
         'NR_NOSSONUMERO,' +
         'VL_PAGO,' +
         'VL_ACRESCIMO,' +
         'CD_PESSOA,' +
         'CD_OCORRENCIA,' +
         'CD_MOTIVO,' +
         'NR_SEQUENCIA,' +
         'DT_PAGAMENTO,' +
         'DT_CREDITO,' +
         'VL_TARIFA,' +
         'CD_SITUACAO) ' +
      'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
Var
   Stmt: IZPreparedStatement;
begin

   Stmt := PrepareStatement(SSQLInsertRetornoItensTitulos);
   try
      Stmt.SetInt(1, lngCodigo);
      Stmt.SetString(2, sColSequencia);

      if achou then
         Stmt.SetInt(3, DM.tblMensalidadescd_mensalidade.AsInteger);

      if not achou then
         Stmt.SetNull(3, stInteger);

      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLInsertRetornoItens);
   try
      Stmt.SetInt(1, lngCodigo);
      Stmt.SetFloat(3, ValTitulo);

      if strNossoNumero = '' then
         Stmt.SetString(4, sColCPF + ';' + sColVencimento);

      if strNossoNumero <> '' then
         Stmt.SetString(4, strNossoNumero);

      if bTarifaPorOcorrencia and (tblBancotarifa_tam.AsInteger > 0) and
         (DM.qAux2.FieldByName('sn_baixar').AsString = 'T') then
         Stmt.SetFloat(5, 0)
      else
         Stmt.SetFloat(5, ValPago);

      if tblBancovl_acresc_inicio.AsInteger > 0 then
         Stmt.SetFloat(6, ValAcrescimo);

      if tblBancovl_acresc_inicio.AsInteger < 1 then
         Stmt.SetFloat(6, 0);

      Stmt.SetString(8, cd_ocorrencia);
      Stmt.SetString(9, strMotivo);
      Stmt.SetString(10, sColSequencia);
      Stmt.SetDate(11, StrToDate(pega_data_pgto));
      Stmt.SetDate(12, StrToDate(pega_data_credito));

      if tblBancotarifa_tam.AsInteger > 0 then
         Stmt.SetFloat(13, Tarifa);

      if tblBancotarifa_tam.AsInteger < 1 then
         Stmt.SetNull(13, stFloat);

      Stmt.SetInt(14, Baixado);

      if achou then
      begin
         Stmt.SetDate(2, DM.tblMensalidadesDataVencimento.AsDateTime);
         Stmt.SetInt(7, DM.tblMensalidadesCodigoAluno.AsInteger);
      end;

      if not achou then
      begin
         Stmt.SetNull(2, stDate);
         Stmt.SetNull(7, stInteger);
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

end;


procedure Tfrm_Retorno_Banco.PageControl1Change(Sender: TObject);
begin
    if PageControl1.ActivePageIndex = 0 then begin

       pnBaixa.Visible := true;

    end else begin

       pnBaixa.Visible := false;

       filtrar();

      tcItens.TabIndex := 0;

    end;
end;

{ Pega a data de crédito da Mensalidade filtrando pelo NossoNumero.
}
function Tfrm_Retorno_Banco.getDataCredito: TDateTime;
const
   SQL_DT_CREDITO =
      'SELECT '+
         'dt_credito '+
      'FROM '+
         'mensalidades '+
      'WHERE '+
         'nossonumero LIKE ''%:nn'' '+
      'ORDER BY '+
         'valorbruto DESC';
var
   sNossoNumero: string;
   qyDtCredito: TUMZQuery;
begin
   if Length(Self.strNossoNumero) < 8 then
   begin
      sNossoNumero := FillString(Self.strNossoNumero, alRight, '0', 8, false);
   end;
   Dm.CriarConsulta(qyDtCredito);
   try
      qyDtCredito.SQL.Text := StringReplace(SQL_DT_CREDITO, ':nn', sNossoNumero, [rfIgnoreCase]);
      qyDtCredito.Open;
      if qyDtCredito.IsEmpty then
      begin
         Result := DM.DataAtual;
      end else
      begin
         Result := qyDtCredito.FieldByName('dt_credito').AsDateTime;
      end;
   finally
      qyDtCredito.Close;
      qyDtCredito.Free;
   end;
end;

procedure Tfrm_Retorno_Banco.grdDblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  PageControl1Change(nil);

end;

procedure Tfrm_Retorno_Banco.grdItensTitleClick(Column: TColumn);
var
  n : Integer;
begin

  For n:= 0 to grdItens.Columns.Count - 1 do begin
       grdItens.Columns[n].Title.Font.Style := [];
  end;

  if sColOrdem = Column.FieldName then
     sColOrdem := Column.FieldName + ' DESC '
  else
     sColOrdem := Column.FieldName;

  Column.Title.Font.Style := [fsUnderline];

  Filtrar;

end;

procedure Tfrm_Retorno_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F9 : if sbExcluir.Enabled then sbExcluirClick( nil );
    VK_F12 : btFecharClick( nil );
  end;
end;


procedure Tfrm_Retorno_Banco.FormCreate(Sender: TObject);
begin
  Application.CreateForm( TfrmBaixarBanco, frmBaixarBanco );
  DM.MontarPlanilha(grdItens, 'planilha_retorno_campos');
  DM.MontarPlanilha(grd, 'planilha_retorno_campos_principal');
end;

function Tfrm_Retorno_Banco.BuscaNossoNumero( strNumero : String; sFiltro : String  ) : Boolean;
Var
   NovoNN : String;
   qBuscaBoleto : TUMZQuery;
   chaves : String;
   CdMensalidade : Integer;
begin


  // Busca normal pelo Nosso número
  if Trim(strNumero) <> '' then begin
  
      NovoNN := strNumero;

      IF Length(NovoNN) < 8 then begin
         NovoNN := FillString(NovoNN, alRight, '0', 8, false);
      end;

      Result := False;

 // Alterado por claudionor 14/01

  if sFiltro = '' then
  Begin
     Dm.tblMensalidades.SQL.Clear();
     Dm.tblMensalidades.SQL.Text :=
       ' SELECT * from Mensalidades WHERE ' +
       ' CONCAT(REPEAT("0",' + IntToStr(Length(NovoNN)) + ' -length(nossonumero)), nossonumero) = ''' + NovoNN + ''' ' +
       ' ORDER BY valorbruto DESC ';

  End else Begin
     Dm.tblMensalidades.SQL.Clear();
     Dm.tblMensalidades.SQL.Text :=
       ' SELECT * from Mensalidades WHERE ' +
       ' CONCAT(REPEAT("0",' + IntToStr(Length(NovoNN)) + ' -length(nossonumero)), nossonumero) = ''' + NovoNN + ''' AND ' +

       sFiltro +
       ' ORDER BY valorbruto DESC ';
  End;

      Dm.tblMensalidades.Open();
      Dm.tblMensalidades.FetchAll();

      Result := Dm.tblMensalidades.RecordCount > 0;

      if not Result AND Dm.isTrue(DM.qAux2.FieldByName('sn_baixar').AsString) then begin
         // Primeiro verificar se já está BAIXADO e PAGO..

         Dm.tblMensalidades.close();
         Dm.tblMensalidades.SQL.Clear();
         Dm.tblMensalidades.SQL.Text :=
           ' SELECT * from Mensalidades WHERE ' +
           ' CONCAT(REPEAT("0",' + IntToStr(Length(NovoNN)) + ' -length(nossonumero)), nossonumero) = ''' + NovoNN + ''' AND  (situacao = 0 OR situacao = 1) ' + 
           ' ORDER BY valorbruto DESC ';
         Dm.tblMensalidades.Open();
         Dm.tblMensalidades.FetchAll();

         IF (Dm.tblMensalidades.RecordCount > 0) THEN begin

            // Se não encontrou a parcela como pendente, mas encontrou como paga, então não restaurar o nosso número.
            Result := false ;
            Exit;

         end;

         // Se não encontrou nada, e for BAIXA, tentar identificar o NN na impressão do boleto

         // Pesquisar um boleto impresso com esse NN, relacionando com a mensalidade
         // do mesmo aluno, mesmo vencimento e mesmo valorbruto e pendente para baixa
         DM.CriarConsulta(qBuscaBoleto);
         qBuscaBoleto.Close();
         qBuscaBoleto.SQL.Text :=
           ' SELECT m.codigoaluno, m.anosemestre, m.cd_coligada, m.turma, m.parcela, m.datavencimento, m.cd_mensalidade, m.cd_caixa, m.nossonumero FROM fin_boleto as b ' +
           '  INNER JOIN mensalidades as m ON ( ' +
           '    m.codigoaluno = b.cd_pessoa AND m.datavencimento = b.dt_vencimento ' +
           '    AND round((COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALESCE(m.descontoextra,0) + COALESCE(m.valorjuros,0)),2) = round(b.vl_boleto,2) ' +
           '   ) WHERE b.nr_nossonumero = ''' + NovoNN + ''' AND situacao in (2,10) ' +
           ' GROUP BY m.codigoaluno, m.anosemestre, m.cd_coligada, m.turma, m.parcela, m.datavencimento, m.cd_mensalidade, m.cd_caixa, m.nossonumero ';
         qBuscaBoleto.Open();

         if qBuscaBoleto.RecordCount = 1 then begin
            // Somente considerar se achar um único registro
            // se não achar, ou achar mais, não baixar

            // Guardar um LOG da alteração do NN na planilha de mensalidades

            chaves := FillString(qBuscaBoleto.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                      qBuscaBoleto.FieldByName('anosemestre').AsString + ';' + qBuscaBoleto.FieldByName('turma').AsString + ';' +
                      qBuscaBoleto.FieldByName('parcela').AsString + ';' +
                      FormatDateTime('dd/mm/yyyy',qBuscaBoleto.FieldByName('datavencimento').AsDateTime) + ';';

            DM.setLog(2013, 'alteracao', chaves, qBuscaBoleto.FieldByName('cd_coligada').AsInteger, 'Restauração de NN (NN Atual = "'+ qBuscaBoleto.FieldByName('nossonumero').AsString +'" NN Novo = "' + NovoNN +  '" )');

            CdMensalidade := qBuscaBoleto.FieldByName('cd_mensalidade').AsInteger;

            // Preparar a tabela de mensalidades para baixar nesta
            Dm.tblMensalidades.Close();
            DM.tblMensalidades.SQL.Text :=
              ' SELECT * from Mensalidades WHERE ' +
              '   cd_mensalidade = ' + IntToStr(CdMensalidade);

            // Alterar a Mensalidade
            qBuscaBoleto.Close();
            qBuscaBoleto.SQL.Text := 'UPDATE mensalidades SET nossonumero = ''' + NovoNN + ''' WHERE cd_mensalidade = ' + IntToStr(CdMensalidade);
            qBuscaBoleto.ExecSQL();

            // Abrir a tabela
            Dm.tblMensalidades.Open();
            Dm.tblMensalidades.FetchAll();

            // Mudar o resultado para verdadeiro para baixar nessa mensalidade
            Result := true
         end;
      end;

  end else begin
     // Busca por CPF e Vencimento
     if (sColCPF <> '') AND (sColVencimento <> '') then begin

         Result := False;

         if sFiltro <> '' then begin
            sFiltro := ' AND ' + sFiltro;
         end;

         if tblBancocd_banco.AsString = 'FIE' then begin
           sFiltro := sFiltro + ' AND r.sn_nao_bloquear_financeiro = 1 ';
         end;


         Dm.tblMensalidades.SQL.Clear();
         Dm.tblMensalidades.SQL.Text :=
           ' SELECT Mensalidades.* from Mensalidades ' +
           ' INNER JOIN pessoas ON (pessoas.cd_pessoa = Mensalidades.codigoaluno) ' +
           ' INNER JOIN pessoas as r ON (r.cd_pessoa = Mensalidades.cd_resp)  ' +
           ' WHERE ' +
           '  pessoas.ds_cpf = :ds_cpf AND Mensalidades.datavencimento = :dt_venc ' +
           sFiltro +
           ' ORDER BY valorbruto DESC ';


         DM.tblMensalidades.ParamByName('ds_cpf').AsString := sColCPF;
         DM.tblMensalidades.ParamByName('dt_venc').AsString := FormatDateTime('yyyy-mm-dd', StrToDate(sColVencimento) );

         Dm.tblMensalidades.Open();
         Dm.tblMensalidades.FetchAll();

         Result := Dm.tblMensalidades.RecordCount > 0;

     
     end;
     
  end;

end;

function Tfrm_Retorno_Banco.buscaSiglaSitPorNN(nossoNumero: String): String;
const
   SQL_BUSCA_SIGLA_NN =
   'SELECT ds_sigla_situacao '+
   'FROM mensalidades M      '+
   'INNER JOIN situacoes_financeiras S ON (S.cd_situacao = M.situacao) '+
   'WHERE m.nossonumero like ''%';
var
   qryBuscaSigla : TUMZQuery;
begin
   dm.CriarConsulta(qryBuscaSigla);
   qryBuscaSigla.SQL.Add(SQL_BUSCA_SIGLA_NN);
   qryBuscaSigla.SQL.Text := SQL_BUSCA_SIGLA_NN + nossoNumero + '%''';
   qryBuscaSigla.Open;
   result := qryBuscaSigla.FieldByName('ds_sigla_situacao').AsString;
   qryBuscaSigla.Close;
end;

procedure Tfrm_Retorno_Banco.Filtrar;
const
   SFilterFmt = 'ocorrencia = %s';
Var sTab : String;
begin

    sTab := tcItens.Tabs.Strings[tcItens.tabIndex];

    qItensGrupo.Close;
    qItensGrupo.ParamByName('CodigoRetorno').AsInteger := tblRetornoCodigo.AsInteger;
    qItensGrupo.Open();

    tcItens.Tabs.Clear;
    tcItens.Tabs.Add('Todos os itens');

    while not qItensGrupo.EOF do begin
          tcItens.Tabs.Add(qItensGrupoocorrencia.AsString);
          qItensGrupo.Next();
    end;

    if tcItens.Tabs.IndexOf(sTab) = -1 then
        tcItens.TabIndex := 0
    else
        tcItens.TabIndex := tcItens.Tabs.IndexOf(sTab);

    tblItens.Close;
    tblItens.ParamByName('CodigoRetorno').AsInteger := tblRetornoCodigo.AsInteger;

    if tcItens.TabIndex = 0 then
    begin
      tblItens.Filtered := False;
    end;

    if tcItens.TabIndex <> 0 then
    begin
      tblItens.Filtered := True;
      tblItens.Filter := Format(SFilterFmt, [QuotedStr(tcItens.Tabs[tcItens.TabIndex])]);
    end;

    tblItens.Open;
end;

procedure Tfrm_Retorno_Banco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_Retorno_Banco.FormDestroy(Sender: TObject);
begin
  frm_retorno_banco := nil;
end;


procedure Tfrm_Retorno_Banco.btnCodigoDepartamentoClick(Sender: TObject);
begin
   CapturarArquivo;

end;

procedure Tfrm_Retorno_Banco.sbImprimirClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('repBaixasRetorno');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, '{retorno.codigo}= ' + tblRetornoCodigo.AsString, '', nil, nil, nil,nil, True, False, nil, PodeExportar);
end;

procedure Tfrm_Retorno_Banco.BitBtn1Click(Sender: TObject);
begin
    if txtArquivo.Text = '' then
      CapturarArquivo
    else
       ProcessarArquivo;
end;

procedure Tfrm_Retorno_Banco.sbExcluirClick(Sender: TObject);
const
   SSQLDeleteRetornoItens = 'DELETE FROM RETORNO_ITENS WHERE CD_RETORNO = ?';
   SSQLDeleteRetornoItensTitulos = 'DELETE FROM RETORNO_ITENS_TITULOS WHERE CD_RETORNO = ?';
var
   Stmt: IZPreparedStatement;
begin

   if not DM.UsuarioLogado.TemPermissao( 2004, npExcluir, True ) then Exit;

   if Mensagem('Tem certeza que deseja excluir o histórico de retorno da linha selecionada?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
   <> mrYes then Exit;

   Stmt := PrepareStatement(SSQLDeleteRetornoItensTitulos);
   try
      Stmt.SetInt(1, tblRetornocodigo.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLDeleteRetornoItens);
   try
      Stmt.SetInt(1, tblRetornocodigo.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

end;

procedure Tfrm_Retorno_Banco.sbImprimirTudoClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('repBaixasRetornoCompleto');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, '{retorno.codigo}= ' + tblRetornoCodigo.AsString, '', nil, nil, nil, nil, True, False, nil,PodeExportar);
end;

procedure Tfrm_Retorno_Banco.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grdItens, 'planilha_retorno_campos');
end;

function Tfrm_Retorno_Banco.pega_data_credito: String;
Var
  data         : string;
  dataValida   : TDateTime;
begin

  if tblBancodt_credito_inicio.AsInteger <= 0 then begin

     data := pega_data_pgto();

  end else begin


     if tblBancods_separador_colunas.AsString <> '' then begin

         data := Trim(slColunas[tblBancodt_credito_inicio.AsInteger-1]);
         data := StringReplace(data, '-', '', [rfReplaceAll]);
         data := StringReplace(data, '/', '', [rfReplaceAll]);


         // Esta flag força baixar pela data de pagamento, quando o registro tiver o conteudo do campo fl_dt_pagamento
         if tblBancofl_dt_pgto_inicio.AsInteger > 0 then begin
            if  Trim(slColunas[tblBancofl_dt_pgto_inicio.AsInteger-1]) = tblBancofl_dt_pgto.AsString then begin

               data := pega_data_pgto();
               result := data;
               exit;
           
            end;

         end;

         if (data = '') OR
            (data = FillString('0',alLeft, '0',tblBancodt_credito_tam.AsInteger,false))
         then
            data := pega_data_pgto()
         else if (tblBancodt_credito_formato.AsString = 'amd') then begin

            data :=  Copy( data, 1 + tblBancodt_credito_tam.AsInteger - 2, 2 )
                  + '/' + Copy( data, 1 + tblBancodt_credito_tam.AsInteger - 4, 2 )
                  + '/' + Copy( data, 1, tblBancodt_credito_tam.AsInteger - 4);

         end else begin

            data :=  Copy( data, 1, 2 )
                  + '/' + Copy( data, 1 + 2 , 2 )
                  + '/' + Copy( data, 1 + 4, tblBancodt_credito_tam.AsInteger - 4);

         end;


     end else begin      


         // Esta flag força baixar pela data de pagamento, quando o registro tiver o conteudo do campo fl_dt_pagamento
         if tblBancofl_dt_pgto_inicio.AsInteger > 0 then begin
            if Copy(matCobranca, tblBancofl_dt_pgto_inicio.AsInteger, Length(tblBancofl_dt_pgto.AsString)) = tblBancofl_dt_pgto.AsString then begin

               data := pega_data_pgto();
               result := data;
               exit;
           
            end;

         end;

         if (Trim(Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, tblBancodt_credito_tam.AsInteger )) = '') OR
            (Trim(Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, tblBancodt_credito_tam.AsInteger )) = FillString('0',alLeft, '0',tblBancodt_credito_tam.AsInteger,false))
         then
            data := pega_data_pgto()
         else if (tblBancodt_credito_formato.AsString = 'amd') then begin

            data :=  Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + tblBancodt_credito_tam.AsInteger - 2, 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + tblBancodt_credito_tam.AsInteger - 4, 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, tblBancodt_credito_tam.AsInteger - 4);

         end else begin

            data :=  Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + 2 , 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + 4, tblBancodt_credito_tam.AsInteger - 4);

         end;


     end;



     //verifica se o conteudo que foi pego está em formato de uma data válida.
     try
         dataValida := strtodate(data)
     except
         data       := pega_data_pgto();
     end;

  end;

  result := data;

end;

function Tfrm_Retorno_Banco.pega_data_pgto: String;
Var
  data : string;
begin

  if tblBancods_separador_colunas.AsString <> ''  then begin

     data := Trim(slColunas[tblBancodt_pgto_inicio.AsInteger-1]);
     data := StringReplace(data, '-', '', [rfReplaceAll]);
     data := StringReplace(data, '/', '', [rfReplaceAll]);

     if (tblBancodt_pgto_formado.AsString = 'amd') then begin

         data :=  Copy( data, 1 + tblBancodt_pgto_tam.AsInteger - 2, 2 )
               + '/' + Copy( data, 1 + tblBancodt_pgto_tam.AsInteger - 4, 2 )
               + '/' + Copy( data, 1, tblBancodt_pgto_tam.AsInteger - 4);

     end else begin

         data :=  Copy( data, 1, 2 )
               + '/' + Copy( data, 1 + 2 , 2 )
               + '/' + Copy( data, 1 + 4, tblBancodt_pgto_tam.AsInteger - 4);

     end;


  end else begin

      if (tblBancodt_pgto_formado.AsString = 'amd') then begin

         data :=  Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + tblBancodt_pgto_tam.AsInteger - 2, 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + tblBancodt_pgto_tam.AsInteger - 4, 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger, tblBancodt_pgto_tam.AsInteger - 4);

      end else begin

         data :=  Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger, 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + 2 , 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + 4, tblBancodt_pgto_tam.AsInteger - 4);

      end;

      
  end;



  result := data;


end;

procedure Tfrm_Retorno_Banco.pgHistoricoChange(Sender: TObject);
const
   S_SQL_RETORNO_MYSQL =
      'SELECT '+
         'CODIGO,' +
         'DATARETORNO,' +
         'USUARIO,' +
         'BAIXADOS,' +
         'REJEITADOS,' +
         'OUTRAS_OCORRENCIAS,' +
         'NOMEARQUIVO,' +
         'NM_COLIGADA,' +
         'C.CD_COLIGADA,' + 
         'fcc.ds_caixa,' +
         'CD_BANCO '+
      'FROM ' +
         'RETORNO ' +
         'LEFT JOIN coligadas c ON (c.cd_coligada = retorno.cd_coligada) ' +
         'LEFT JOIN fin_cadastro_contas fcc ON ( fcc.cd_caixa = retorno.cd_caixa AND fcc.cd_coligada = retorno.cd_coligada ) ' +
      'WHERE ( c.cd_coligada IS NULL OR c.cd_coligada IN ( %s ) ) ' +
      'ORDER BY ' +
         'CODIGO DESC ';

   S_SQL_RETORNO_LIMIT_MYSQL = S_SQL_RETORNO_MYSQL + 'LIMIT 20';

   S_SQL_RETORNO_ORACLE =
      'SELECT '+
         'CODIGO,' +
         'DATARETORNO,' +
         'USUARIO,' +
         'BAIXADOS,' +
         'REJEITADOS,' +
         'OUTRAS_OCORRENCIAS,' +
         'NOMEARQUIVO,' +
         'NM_COLIGADA,' +
         'C.CD_COLIGADA,' +
         'fcc.ds_caixa,' +
         'CD_BANCO '+
      'FROM ' +
         'RETORNO ' +
         'LEFT JOIN coligadas c ON (c.cd_coligada = retorno.cd_coligada) ' +
         'LEFT JOIN fin_cadastro_contas fcc ON ( fcc.cd_caixa = retorno.cd_caixa AND fcc.cd_coligada = retorno.cd_coligada ) ' +
      'WHERE ( c.cd_coligada IS NULL OR c.cd_coligada IN ( %s ) ) ' +
      'ORDER BY ' +
         'CODIGO DESC ';

   S_SQL_RETORNO_LIMIT_ORACLE =
      'SELECT '+
         'CODIGO,' +
         'DATARETORNO,' +
         'USUARIO,' +
         'BAIXADOS,' +
         'REJEITADOS,' +
         'OUTRAS_OCORRENCIAS,' +
         'NOMEARQUIVO,' +
         'NM_COLIGADA,' +
         'C.CD_COLIGADA,' +
         'fcc.ds_caixa,' +
         'CD_BANCO '+
      'FROM ' +
         'RETORNO                                                        '+
         'LEFT JOIN coligadas c ON (c.cd_coligada = retorno.cd_coligada) ' +
         'LEFT JOIN fin_cadastro_contas fcc ON ( fcc.cd_caixa = retorno.cd_caixa AND fcc.cd_coligada = retorno.cd_coligada ) ' +
      'WHERE ' +
         '( c.cd_coligada IS NULL OR c.cd_coligada IN ( %s ) ) AND ROWNUM <= 20 ' +
      'ORDER BY ' +
         'CODIGO DESC ';

   SQLReturnMySQL: array[boolean] of string =
      (S_SQL_RETORNO_MYSQL, S_SQL_RETORNO_LIMIT_MYSQL);
   SQLReturnOracle: array[boolean] of string =
      (S_SQL_RETORNO_ORACLE, S_SQL_RETORNO_LIMIT_ORACLE);

   function GetSQLByProtocol(const Limited: boolean): string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := SQLReturnOracle[Limited]
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := SQLReturnMySQL[Limited];

      Result := Format( Result, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   end;
begin
   tblRetorno.Close;
   tblRetorno.SQL.Text := GetSQLByProtocol(pgHistorico.TabIndex = 0);
   tblRetorno.Open;
end;

procedure Tfrm_Retorno_Banco.ToolButton1Click(Sender: TObject);
var
   NomeRel, selecao : String;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   if not DM.UsuarioLogado.TemPermissao( 2002, npAcesso, True ) then Exit;

   if Mensagem('Este procedimento irá gerar e imprimir recibos para todos os itens do retorno.'#13'Deseja continuar?', 'Atenção', MB_YESNO) <> mrYes then Exit;

   // Gerar todos os recibos

   try

      tcItens.TabIndex := 0;
      filtrar();

      tblItens.DisableControls();

      tblItens.First;

      oRecibo := TFinReciboManager.Create(tblItenscd_mensalidade.AsInteger);

      while not tblItens.Eof do begin
      try
         oRecibo.setMensalidade(tblItenscd_mensalidade.AsInteger);
         oRecibo.imprimirRecibo();

         tblItens.Next();
      except
         //ignorar
      end;

      end;

      FreeAndNil(oRecibo);

      tblItens.First();      

   finally

      tblItens.EnableControls();
      
   end;

   NomeRel := '.rpt';
   selecao := '{retorno.codigo} = ' + tblRetornoCodigo.AsString;

   infoRelatorio := PrincipalForm.GetInfoRpt('repReciboRetorno');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+NomeRel;

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;


   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '',nil,nil,nil,nil, true, False, nil, PodeExportar);

end;

procedure Tfrm_Retorno_Banco.ToolButton3Click(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('repBaixasRetornoCompleto');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, '{retorno.codigo}= ' + tblRetornoCodigo.AsString, '', nil, nil, nil,nil, True, False, nil, PodeExportar);
end;

procedure Tfrm_Retorno_Banco.ToolButton4Click(Sender: TObject);
var
  sFiltro : String;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   sFiltro := '';
   // Apresentar somente os itens do retorno selecionado
   sFiltro := '{retorno.codigo}= ' + tblRetornoCodigo.AsString;
   // Apresentar somente os que tem valor pago = SOMENTE BAIXAS
   sFiltro := sFiltro + ' AND {itensretorno.valorpago} > 0 ';

   infoRelatorio := PrincipalForm.GetInfoRpt('repBaixasRetorno');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFiltro, '', nil, nil, nil, nil, True, False, nil, PodeExportar);

end;

procedure Tfrm_Retorno_Banco.ToolButton6Click(Sender: TObject);
begin
  Close;

end;

procedure Tfrm_Retorno_Banco.btBaixarClick(Sender: TObject);
begin

  Application.CreateForm(TfrmBaixarBanco, frmBaixarBanco);
  frmBaixarBanco.iCodigoAluno := tblItensCodigoAluno.AsInteger;
  frmBaixarBanco.sNomeAluno := tblItensnm_pessoa.AsString;
  frmBaixarBanco.ShowModal;

end;

procedure Tfrm_Retorno_Banco.btFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Retorno_Banco.btnBaixarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2004, npIncluir, True ) then Exit;
      if txtArquivo.Text = '' then
         CapturarArquivo
      else
         ProcessarArquivo;
end;

procedure Tfrm_Retorno_Banco.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblRetorno, pmQtd);
end;

function Tfrm_Retorno_Banco.descobrir_layout: Boolean;
{ Função para descobrir qual o layout está sendo baixado }
var
  Arquivo : TextFile;
  strbanco, strlayout, linha, linhaAux : String;
  n : Integer;
begin

  AssignFile( Arquivo, txtArquivo.Text );
  Reset( Arquivo );

  { Será feita a análise sempre na primeira linha do arquivo };

  linha := '';

  n := 1;
  while (n <= 10) AND (not EOF(Arquivo)) do Begin
     readln(Arquivo, linhaAux);
     linha := linha + linhaAux;
     inc(n);
  end;

  CloseFile(Arquivo);

  tblBanco.Close;
  tblBanco.SQL.Clear;
  tblBanco.SQL.Add('SELECT * from banco_parametro_retorno');
  tblBanco.SQL.Add('ORDER by cd_banco, ds_layout');
  tblBanco.Open;

  tblBanco.First;

  { Testar todos os layout até encontrar o correto }

  while not tblBanco.Eof do
  begin
     strbanco  := Copy(linha, tblBancobanco_inicio.AsInteger, tblBancobanco_tam.AsInteger);
     strlayout := Copy(linha, tblBancolayout_inicio.AsInteger, tblBancolayout_tam.AsInteger);

     if (trim(strbanco) = Trim(tblBancocd_banco.AsString)) AND (trim(strlayout) = Trim(tblBancods_layout.AsString))
     then
     Begin
         { Encontrou o Layout Correto / Pode encerrar a procura e processar o arquivo }

         { A tabela banco ficará posicionada no banco correto }

         Result := True;
         Exit

     end;

     tblBanco.Next;
  end;

  { Se chegar aqui nenhum banco foi cadastrado }

  Result := false;

  Mensagem('Este arquivo não foi identificado como um arquivo de retorno', 'Atenção', MB_OK + MB_ICONWARNING);

end;

procedure Tfrm_Retorno_Banco.dtcItensDataChange(Sender: TObject; Field: TField);
begin
  btBaixar.Enabled := ((tblItenssn_baixado.AsInteger = 0) AND (tblItenssn_baixar.AsString = 'S'));
end;

function Tfrm_Retorno_Banco.selecionaContaBaixar(sConta : String): Integer;
begin
  // Verificar a Conta para Baixar

  with DM.qyAux do begin
     Close;
     SQL.Clear;
     SQL.Add(
       ' SELECT cd_caixa, ds_caixa, nr_banco, nr_conta, ds_identificacao_retorno   ' +
       ' FROM fin_cadastro_contas              ' +
       ' WHERE ds_identificacao_retorno = :DsConta AND sn_ativa = ''S'' '
     );
     ParamByName('DsConta').AsString := sConta;
     Open();

     if not Eof then begin
            Result := FieldByName('cd_caixa').AsInteger;
            EXit;
     end
     else begin
         result := -1;
         Exit;
     end;
  end;

end;

procedure Tfrm_Retorno_Banco.SpeedButton1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grd, 'planilha_retorno_campos_principal');   
end;

procedure Tfrm_Retorno_Banco.tcItensChange(Sender: TObject);

begin

   filtrar();

end;

end.




