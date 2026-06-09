unit uRetornoCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, Buttons, StdCtrls, DB, Main,
  General, ToolWin, ImgList, UZDataset, DBTables, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UMDateTimePicker, ClassRegistros;

type

  rConfig = record
    ds_seg : String;
    nr_tit_ini : Integer;
    nr_tit_tam : Integer;
    nr_val_ini : Integer;
    nr_val_tam : Integer;
    nr_dat_ini : Integer;
    nr_dat_tam : Integer;
    ds_dat_formato : String;
    nr_oco_ini : Integer;
    nr_oco_tam : Integer;
    nr_oco_qtd : Integer;
    nr_autentica_inicio : Integer;
    nr_autentica_tamanho : Integer;
  end;    

  TfRetornoCP = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    pgRetorno: TPageControl;
    tsProcessados: TTabSheet;
    tsItens: TTabSheet;
    grdItens: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    txtArquivo: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    pnRetorno: TPanel;
    Label2: TLabel;
    lblConta: TLabel;
    Label3: TLabel;
    lblRegistros: TLabel;
    Label5: TLabel;
    lblProcessados: TLabel;
    Bar: TProgressBar;
    qyArquivos: TUMZQuery;
    Panel3: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    dsArquivos: TDataSource;
    qyArquivosdt_processamento: TDateTimeField;
    qyArquivosnm_arquivo: TStringField;
    qyArquivosnm_usuario: TStringField;
    qyArquivosnm_banco: TStringField;
    qyArquivosds_caixa: TStringField;
    qyArquivosnm_coligada: TStringField;
    sbBaixar: TSpeedButton;
    OpenDialog: TOpenDialog;
    qyArquivoscd_banco: TStringField;
    qyArquivoscd_caixa: TIntegerField;
    qyItens: TUMZQuery;
    dsItem: TDataSource;
    qyItenscd_retorno: TIntegerField;
    qyItensnr_linha: TIntegerField;
    qyItensme_linha: TMemoField;
    qyItenscd_titulo: TIntegerField;
    qyItensdt_debito: TDateTimeField;
    qyItensvl_debito: TFloatField;
    qyItenscd_ocorrencia: TStringField;
    qyItenssn_baixado: TSmallintField;
    qyItensds_despesa: TStringField;
    qyItensnm_pessoa: TStringField;
    DBGrid1: TDBGrid;
    qyItensds_ocorrencia: TStringField;
    qyItensds_motivos: TStringField;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    qyItenssn_baixa: TStringField;
    qyArquivoscd_retorno: TIntegerField;
    umdtInicio: TUMDateTimePicker;
    umdtFim: TUMDateTimePicker;
    btnImprimir: TToolButton;
    ToolButton3: TToolButton;
    procedure grdItensCellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure pgRetornoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbBaixarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    aConfig : array of rConfig;

    // Variáveis que guardará em qual lugar deve ser processado o retorno
    iCaixa : Integer;
    iColigada : Integer;
    iLayout : Integer;
    sBanco : String;
    iCodigoRetorno : Integer;
    sds_reg_det : string; inr_reg_det_ini : Integer; inr_seg_ini : integer;
    

    Procedure CapturarArquivos();
    Procedure Filtrar();
    Procedure CarregarConfig();
    function BaixarCompromisso(cd_titulo : Integer; cd_coligada: Integer; vl_debito : double; dt_debito : TDateTime) : Integer;
    Function GetSegmento(ds_segmento : String) : Integer;
    Function GetMotivos(cd_banco : String; cd_motivos : String; nr_tamanho : Integer) : String;
    Function DeveBaixar(cd_banco : String; cd_motivo : String) : Smallint;
    Procedure ApropriaValoresCP(CodMovimento: Integer; CodTitulo : Integer; ValorBaixado: Currency);
  public
    { Public declarations }

  end;

var
  fRetornoCP: TfRetornoCP;

implementation

uses uDM, uClassMovimento;

{$R *.dfm}

procedure TfRetornoCP.ApropriaValoresCP(CodMovimento: Integer; CodTitulo : Integer; ValorBaixado: Currency);
Var
  iContaJuros : Integer;
begin
  // Apropria os valores do contas a pagar

  iContaJuros := 0;

  if Dm.variavel_parametro('plano_contas_juros_pagos') <> '' then begin
     iContaJuros := StrToInt(Dm.variavel_parametro('plano_contas_juros_pagos'));
  end;

  DM.qyAux.Close();
  Dm.qyAux.SQL.Clear();

  Dm.qyAux.SQL.Add(
    ' INSERT INTO fin_apropria_te                            ' +
    '  (cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento)  ');

  if iContajuros = 0 then begin
     Dm.qyAux.SQL.Add(
      ' SELECT                                                 ' +
      '    :CdMovTe,  t.cd_coligada, a.cd_conta, a.cd_centro,                 ' +
      '    (a.vl_movimento / t.vl_total_despesa * :ValorBaixado)     ' +
      ' FROM                                                   ' +
      '    fin_apropria_cp a                                   ' +
      '    INNER JOIN fin_contas_pagar t ON (a.cd_titulo = t.cd_titulo_principal AND a.cd_coligada = t.cd_coligada) ' +
      ' WHERE                                                  ' +
      '   t.cd_titulo = :CdTitulo AND                          ' +
      Format( '   a.cd_coligada IN ( %s ) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] ) );
      DM.qyAux.ParamByName('CdMovTe').AsInteger := CodMovimento;
      DM.qyAux.ParamByName('CdTitulo').AsInteger := CodTitulo;
      Dm.qyAux.ParamByName('ValorBaixado').AsCurrency := ValorBaixado;
      Dm.qyAux.ExecSQL();

  end else begin
     // Inserir o valor líquido

     Dm.qyAux.SQL.Add(
      ' SELECT                                                 ' +
      '    :CdMovTe,  t.cd_coligada, a.cd_conta, a.cd_centro,                 ' +
      '    (a.vl_movimento / t.vl_total_despesa * :ValorBaixado) - (a.vl_movimento / t.vl_total_despesa * (IFNULL(c.vl_juros,0) + IFNULL(c.vl_multa,0))) ' +
      ' FROM                                                   ' +
      '    fin_apropria_cp a                                   ' +
      '    INNER JOIN fin_contas_pagar t ON (a.cd_titulo = t.cd_titulo_principal AND a.cd_coligada = t.cd_coligada) ' +
      '    INNER JOIN fin_mov_cp c ON (t.cd_titulo = c.cd_titulo AND c.cd_coligada = t.cd_coligada AND c.cd_movimento_te = :CdMovTe2) ' +
      ' WHERE                                                  ' +
      '   t.cd_titulo = :CdTitulo AND                          ' +
      Format( '   a.cd_coligada IN ( %s ) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] ) );
     DM.qyAux.ParamByName('CdMovTe').AsInteger := CodMovimento;
     DM.qyAux.ParamByName('CdMovTe2').AsInteger := CodMovimento;
     DM.qyAux.ParamByName('CdTitulo').AsInteger := CodTitulo;
     Dm.qyAux.ParamByName('ValorBaixado').AsCurrency := ValorBaixado;
     Dm.qyAux.ExecSQL();

     DM.qyAux.Close();
     Dm.qyAux.SQL.Clear();

     Dm.qyAux.SQL.Add(
      ' INSERT INTO fin_apropria_te                            ' +
      '  (cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento)  ');


     Dm.qyAux.SQL.Add(
      ' SELECT                                                 ' +
      '    :CdMovTe,  t.cd_coligada, ' + IntToStr(iContaJuros) + ' , a.cd_centro,                 ' +
      '    SUM(a.vl_movimento / t.vl_total_despesa * (IFNULL(c.vl_juros,0) + IFNULL(c.vl_multa,0))) ' +
      ' FROM                                                   ' +
      '    fin_apropria_cp a                                   ' +
      '    INNER JOIN fin_contas_pagar t ON (a.cd_titulo = t.cd_titulo_principal AND a.cd_coligada = t.cd_coligada) ' +
      '    INNER JOIN fin_mov_cp c ON (t.cd_titulo = c.cd_titulo AND t.cd_coligada = c.cd_coligada AND c.cd_movimento_te = :CdMovTe2) ' +
      ' WHERE                                                  ' +
      '   t.cd_titulo = :CdTitulo AND                          ' +
      Format( '   a.cd_coligada IN ( %s ) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] ) +
      ' GROUP BY a.cd_centro                                   ' );
     DM.qyAux.ParamByName('CdMovTe').AsInteger := CodMovimento;
     DM.qyAux.ParamByName('CdMovTe2').AsInteger := CodMovimento;
     DM.qyAux.ParamByName('CdTitulo').AsInteger := CodTitulo;
     Dm.qyAux.ExecSQL();
  end;
end;

function TfRetornoCP.BaixarCompromisso(cd_titulo: Integer; cd_coligada: Integer; vl_debito: double;
  dt_debito: TDateTime) : integer;
Var
   qTitulo : TUMZQuery;
   Movimento    : TMovimento;
   CodMovimento : Integer;
begin
   { RETORNOS
     1 = BAIXADO
     2 = JÁ BAIXADO
     0 = INEXISTENTE
   }
   // Baixar o compromisso
   Dm.CriarConsulta(qTitulo);
   qTitulo.SQL.Text :=
     ' SELECT cd_titulo, cd_coligada, ds_despesa, nr_documento, cd_caixa, cd_forma_pgto, cd_situacao FROM fin_contas_pagar ' +
     '  WHERE cd_titulo = :cd_titulo ';
//      '    AND cd_coligada = :cd_coligada ';
// Não faz mais sentido o filtro por coligada, pois a coligada passada é apenas do cadastro de contas

   qTitulo.ParamByName('cd_titulo').AsInteger := cd_titulo;
//   qTitulo.ParamByName('cd_coligada').AsInteger := cd_coligada;
   qTitulo.Open();

   // Carregar a coligada correta

   cd_coligada := qTitulo.FieldByName('cd_coligada').AsInteger; 

   if qTitulo.Eof then begin

      Result := 0;
      Exit;

   end;

   // Achou o compromisso? Então pode baixar!

   // Verificar se o compromisso já foi pago

   if qTitulo.FieldByName('cd_situacao').AsInteger = 2 then begin
      // Compromisso já baixado

      Result := 2;
      Exit;

   end;

   // Registrar Movimentação na Tesouraria

   movimento := TMovimento.Create;

   with movimento do
   begin

      CodAcao         := 17;
      Historico       := qTitulo.FieldByName('ds_despesa').AsString;
      NumeroDocumento := qTitulo.FieldByName('nr_documento').AsString;
      NumeroDoCheque  := 0;
      ValorMovimento  := vl_debito;
      ValorEmDinheiro := vl_debito;
      ValorEmCheque   := 0;
      Origem          := 2;
      EntradaSaida    := 2;
      DataMovimento   := dt_debito;
      CodigoTitulo    := cd_titulo;
      FormaDePagamento := qTitulo.FieldByName('cd_forma_pgto').AsInteger;

      Coligada := cd_coligada;

      RegistrarMovimentacaoTe(qTitulo.FieldByName('cd_caixa').AsInteger);

      CodMovimento := CodigoMovimento;

   end;
   FreeAndNil(movimento);

   // Registrar movimentação CP

   Movimento := TMovimento.Create;

   Movimento.TipoDeAcao := BaixarporPagamento;

   Movimento.CodigoTitulo := cd_titulo;
   Movimento.Coligada     := cd_coligada;
   Movimento.CodAcao :=  16; // Ação padrão de baixa de compromissos
   Movimento.ValorMovimento := vl_debito;
   Movimento.ValorMulta := 0;
   Movimento.ValorJuros := 0;
   Movimento.ValorLiquido := vl_debito;
   Movimento.Observacao := '';
   Movimento.DataLiberacao := dt_debito;

   Movimento.RegistrarMovimentacaoCP(CodMovimento);

   ApropriaValoresCP(CodMovimento, cd_titulo, vl_debito);

   FreeAndNil(movimento);

   Result := 1;

end;

procedure TfRetornoCP.btFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfRetornoCP.btnCodigoDepartamentoClick(Sender: TObject);
begin
   CapturarArquivos;
   Bar.Position := 0;
end;

procedure TfRetornoCP.CapturarArquivos;
Var
   Arquivo: TextFile;
   linha : string;

   qAux : TUMZQuery;

   sContaAux : String;
   sBancoAux : String;
   sLayout : String;

   iQtdLayouts : Integer;
   iRegDetalhe : Integer;
   sRegDetalhe : String;

   iRegistros : Integer;

begin

  // Ler as posições das contas no layout; O arquivo deve ser de um desses layouts;
  Dm.CriarConsulta(qAux);
  qAux.SQL.Text :=
  ' SELECT l.cd_layout, l.cd_caixa, l.cd_coligada, l.ret_conta_inicio, l.ret_conta, l.ret_banco_inicio, l.ret_banco, c.ds_caixa, l.ds_reg_det, l.nr_reg_det_ini, l.nr_seg_ini ' +
  '   FROM rem_layouts l INNER JOIN fin_cadastro_contas c ON (c.cd_caixa = l.cd_caixa)'  +
  '  WHERE ( l.ret_banco_inicio > 0 OR l.ret_conta_inicio > 0 ) ';
  qAux.Open();

  if qAux.Eof then begin
     // Não existe layout cadastrado

     Mensagem('Atenção' + CHR(13)+CHR(13)+
              'Não existe layouts de remessa de compromissos configurados para esta Unidade.',
              'UNIMESTRE', 
              MB_OK + MB_ICONWARNING, Handle);

     FreeAndNil(qAux);
     Exit;

  end;              

   // Ler o arquivo e identificar se é um arquivo de retorno válido;

  if OpenDialog.Execute then
     txtArquivo.Text := OpenDialog.FileName
  else
     Exit;


  pnRetorno.Visible := False;

  // Abrir o arquivo
  AssignFile( Arquivo, txtArquivo.Text );
  Reset( Arquivo );

  // Ler a primeira linha do arquivo
  // Obrigatoriamente a identificação do layout (conta e banco) devem estar contidas na primeira linha do arquivo
  readln(Arquivo, linha);

  qAux.First();

  // Define a quantidade de layouts possíveis... deve ter somente 1
  
  iQtdLayouts := 0;
  while not qAux.Eof do begin

     sContaAux := Copy(linha, qAux.FieldByName('ret_conta_inicio').AsInteger, Length(qAux.FieldByName('ret_conta').AsString));
     sBancoAux := Copy(linha, qAux.FieldByName('ret_banco_inicio').AsInteger, Length(qAux.FieldByName('ret_banco').AsString));

     if (sContaAux = qAux.FieldByName('ret_conta').AsString) AND  (sBancoAux = qAux.FieldByName('ret_banco').AsString) then begin
        iQtdLayouts := iQtdLayouts + 1;

        iCaixa    := qAux.FieldByName('cd_caixa').AsInteger;
        iColigada := qAux.FieldByName('cd_coligada').AsInteger;
        iLayout   := qAux.FieldByName('cd_layout').AsInteger;
        sBanco    := qAux.FieldByName('ret_banco').AsString;
        sLayout   := qAux.FieldByName('ds_caixa').AsString;

        sds_reg_det := qAux.FieldByName('ds_reg_det').AsString;
        inr_reg_det_ini := qAux.FieldByName('nr_reg_det_ini').AsInteger;
        inr_seg_ini := qAux.FieldByName('nr_seg_ini').AsInteger;

        iRegDetalhe := qAux.FieldByName('nr_reg_det_ini').AsInteger;
        sRegDetalhe := qAux.FieldByName('ds_reg_det').AsString;
     end;

     qAux.Next();

  end;

  if iQtdLayouts <= 0 then begin

       Mensagem('Atenção' + CHR(13)+CHR(13)+
                'Não foi possível identificar o layout deste arquivo.' + CHR(13) + CHR(13) + 'Confira se este é realmente um arquivo de retorno!',
                'UNIMESTRE',
                MB_OK + MB_ICONERROR, Handle);


      CloseFile(Arquivo);

     FreeAndNil(qAux);
     Exit;

  end else if  iQtdLayouts >= 2 then begin

       Mensagem('Atenção' + CHR(13)+CHR(13)+
                'Não foi possível identificar o layout deste arquivo. O Sistema identificou mais do que uma possibilidade de layout. ' + CHR(13) + CHR(13) + 'Consulte o Suporte Técnico do UNIMESTRE!',
                'UNIMESTRE',
                MB_OK + MB_ICONERROR, Handle);

       CloseFile(Arquivo);
       FreeAndNil(qAux);
       Exit;

  end;

  // Se tiver apenas um layout, deve continuar

  // Apresentar o layout na tela

  lblConta.Caption := sLayout;
  lblProcessados.Caption := '';
  lblRegistros.Caption := '';

  // Ler a quantidade de registros que existem no arquivo

  iRegistros := 0;
  while NOT EOF(Arquivo) do begin

    if Copy(linha, iRegDetalhe, Length(sRegDetalhe)) = sRegDetalhe then begin
       INC(iRegistros);
    end;

    Readln(Arquivo, linha);

  end;

  lblRegistros.Caption := IntToStr(iRegistros);


  CloseFile(Arquivo);

  if iRegistros <= 0  then begin

      Mensagem('Atenção' + CHR(13)+CHR(13)+
              'O arquivo não contém registros para serem processados.',
              'UNIMESTRE',
              MB_OK + MB_ICONWARNING, Handle);

      sbBaixar.Visible := false;
      pnRetorno.Visible := false;

  end else begin
      sbBaixar.Visible := true;
      pnRetorno.Visible := true;

  end;
          
end;

procedure TfRetornoCP.CarregarConfig();
Var
   qConfig : TUMZQuery;
   iQtd : Integer;
begin

   DM.CriarConsulta(qConfig);
   qConfig.SQL.Text :=
     ' SELECT cd_layout, ds_seg, nr_tit_ini, nr_tit_tam, nr_val_ini, nr_val_tam, nr_dat_ini, nr_dat_tam, ds_dat_formato, nr_oco_ini, nr_oco_tam, nr_oco_qtd, nr_autentica_inicio, nr_autentica_tamanho ' +
     '   FROM banco_cp_retorno ' +
     '  WHERE cd_layout = ' + IntToStr(iLayout);
   qConfig.Open();

   SetLength(aConfig, qConfig.RecordCount );

   iQtd := 0;

   while not qConfig.Eof do begin
   
      aConfig[iQtd].ds_seg     := qConfig.FieldByName('ds_seg').AsString;
      aConfig[iQtd].nr_tit_ini := qConfig.FieldByName('nr_tit_ini').AsInteger;
      aConfig[iQtd].nr_tit_tam := qConfig.FieldByName('nr_tit_tam').AsInteger;
      aConfig[iQtd].nr_val_ini := qConfig.FieldByName('nr_val_ini').AsInteger;
      aConfig[iQtd].nr_val_tam := qConfig.FieldByName('nr_val_tam').AsInteger;
      aConfig[iQtd].nr_dat_ini := qConfig.FieldByName('nr_dat_ini').AsInteger;
      aConfig[iQtd].nr_dat_tam := qConfig.FieldByName('nr_dat_tam').AsInteger;
      aConfig[iQtd].ds_dat_formato := qConfig.FieldByName('ds_dat_formato').AsString;
      aConfig[iQtd].nr_oco_ini := qConfig.FieldByName('nr_oco_ini').AsInteger;
      aConfig[iQtd].nr_oco_tam := qConfig.FieldByName('nr_oco_tam').AsInteger;
      aConfig[iQtd].nr_oco_qtd := qConfig.FieldByName('nr_oco_qtd').AsInteger;
      aConfig[iQtd].nr_autentica_inicio := qConfig.FieldByName('nr_autentica_inicio').AsInteger;
      aConfig[iQtd].nr_autentica_tamanho := qConfig.FieldByName('nr_autentica_tamanho').AsInteger;

      Inc(iQtd);

      qConfig.Next();
      
   end;

   FreeAndNil(qConfig);

end;

function TfRetornoCP.DeveBaixar(cd_banco: String; cd_motivo : string): Smallint;
Var
   qMotivos : TUMZQuery;
begin

   DM.CriarConsulta(qMotivos);
   qMotivos.SQL.Text :=
      ' SELECT sn_baixar FROM banco_codigo_retorno ' +
      '  WHERE cd_origem = 2 AND cd_banco = :cd_banco ' +
      '    AND cd_retorno = :cd_retorno ';

   qMotivos.Close();
   qMotivos.ParamByName('cd_banco').AsString := cd_banco;
   qMotivos.ParamByName('cd_retorno').AsString := cd_motivo;
   qMotivos.Open();


   if qMotivos.Eof  then begin

      Result := 0 // Ocorrencia não cadastrada

   end else begin

      if qMotivos.FieldByName('sn_baixar').AsString = 'S' then begin

         Result := 1 // Pode baixar

      end else begin

         Result := 2 // Não Pode baixar

      end;

   end;

  FreeAndNil(qMotivos);
end;

procedure TfRetornoCP.Filtrar;
begin
  // Filtrar os arquivos já processados;

  qyArquivos.Close();
  qyArquivos.ParamByName('data1').AsString := FormatDateTime('yyyy-mm-dd', umdtInicio.Date) + ' 00:00:00';
  qyArquivos.ParamByName('data2').AsString := FormatDateTime('yyyy-mm-dd', umdtFim.Date) + ' 23:59:59';
  qyArquivos.Open();
end;

procedure TfRetornoCP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfRetornoCP.FormCreate(Sender: TObject);
begin
   pnRetorno.Visible := false;
   txtArquivo.Text := '';
end;

procedure TfRetornoCP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btFecharClick( nil );
  end;

end;

procedure TfRetornoCP.FormShow(Sender: TObject);
begin
   // Posicionar na primeira guia
   pgRetorno.ActivePageIndex := 0;

   // Colocar o filtro de data padrão - ULTIMA SEMANA
   umdtInicio.Date := Date() - 7;
   umdtFim.Date    := Date();

   Filtrar();
end;

function TfRetornoCP.GetMotivos(cd_banco : String; cd_motivos: String;
  nr_tamanho: Integer): String;
Var
   qMotivos : TUMZQuery;
   sMotivos : String;
   sCodigos : String;
   sOp : String;
begin

   DM.CriarConsulta(qMotivos);
   qMotivos.SQL.Text :=
      ' SELECT * FROM banco_codigo_retorno ' +
      '  WHERE cd_origem = 2 AND cd_banco = :cd_banco ' +
      '    AND cd_retorno = :cd_retorno ';

   qMotivos.ParamByName('cd_banco').AsString := cd_banco;

   sCodigos := cd_motivos;
   sMotivos := '';
   sOp := '';

   while trim(sCodigos) <> '' do begin
      qMotivos.Close();
      qMotivos.ParamByName('cd_retorno').AsString := Copy(sCodigos, 1, nr_tamanho);
      qMotivos.Open();

      sMotivos := sMotivos + sOp + qMotivos.FieldByName('ds_ocorrencia').AsString;
      sOp := ', ';

      sCodigos := Copy(sCodigos, nr_tamanho + 1, Length(sCodigos));

   end;

   Result := sMotivos;

   FreeAndNil(qMotivos);
end;

function TfRetornoCP.GetSegmento(ds_segmento: String): Integer;
var
  i: Integer;
begin
   // Retornar a posição do Array que corresponde ao registro com
   // as configurações do segmento que está procurando.
   // Se não encontrar retornar -1

   for i := 0 to length(aConfig) - 1 do begin

      if aConfig[i].ds_seg = ds_segmento then begin

         Result := i;
         Exit;

      end;

   end;

   // Se chegou até aqui é porque não encontrou o segmento, retornar -1

   Result := -1;

end;

procedure TfRetornoCP.grdItensCellClick(Column: TColumn);
begin
   btnImprimir.Enabled := true;
end;

procedure TfRetornoCP.pgRetornoChange(Sender: TObject);
begin
   if pgRetorno.ActivePage = tsItens then begin

      if qyItens.Active then begin
         if qyItens.ParamByName('cd_retorno').AsInteger <> qyArquivoscd_retorno.AsInteger then begin
            qyItens.Close();
            qyItens.ParamByName('cd_retorno').AsInteger := qyArquivoscd_retorno.AsInteger;
            qyItens.Open();
         end;
      end else begin
            qyItens.Close();
            qyItens.ParamByName('cd_retorno').AsInteger := qyArquivoscd_retorno.AsInteger;
            qyItens.Open();
      end;

   end;

end;

procedure TfRetornoCP.SpeedButton1Click(Sender: TObject);
begin
   Filtrar();
end;

procedure TfRetornoCP.btnImprimirClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('repRetornoCompromisso');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, '{retorno_cp.cd_retorno}= ' + qyArquivoscd_retorno.AsString, '', nil, nil, nil,nil, True, False, nil, PodeExportar);
end;

procedure TfRetornoCP.sbBaixarClick(Sender: TObject);
Var
   Arquivo: TextFile;
   linha : string;
   qItens,qryAtualiza : TUMZQuery;
   iLinha : Integer;
   VlDebito : Currency;
   sdata : String;
   sOcorrencia : String;

   sTitulo : String;
   iTitulo : Integer;

   sMotivos :String;
   sAutenticacao: String;

   iSeg : Integer;
   snBaixado : Smallint;
   iRetBaixa : Integer;

   iBaixados : Integer;

begin
   DM.CriarConsulta(qItens);
   DM.CriarConsulta(qryAtualiza);

   qryAtualiza.SQL.Text :=
      'UPDATE retorno_cp_itens SET ds_autenticacao = :autentica WHERE cd_retorno = :retorno AND nr_linha = :linha';

   // Carregar os itens de configurações por segmento
   CarregarConfig();

   // Inserir a tabela de retorno
   qItens.Close();
   qItens.SQL.Text :=
     ' INSERT INTO retorno_cp (cd_retorno, dt_processamento, nm_arquivo, cd_usuario, cd_banco, cd_caixa, cd_coligada) ' +
     ' VALUES (NULL, now(), :nm_arquivo, :cd_usuario, :cd_banco, :cd_caixa, :cd_coligada) ';

   qItens.ParamByName('nm_arquivo').AsString := ExtractFileName(txtArquivo.Text);
   qItens.ParamByName('cd_usuario').AsInteger := DM.iCdPessoaLogado;
   qItens.ParamByName('cd_banco').AsString := sBanco;
   qItens.ParamByName('cd_caixa').AsInteger := iCaixa;
   qItens.ParamByName('cd_coligada').AsInteger := iColigada;

   qItens.ExecSQL;

   iCodigoRetorno := DM.LastInsert();

   qItens.Close();
   qItens.SQL.Text :=
     ' INSERT INTO retorno_cp_itens (cd_retorno, nr_linha, me_linha, sn_baixado, vl_debito, dt_debito, cd_ocorrencia, ds_motivos, cd_titulo, ds_autenticacao) ' +
     ' VALUES (:cd_retorno, :nr_linha, :me_linha, :sn_baixado, :vl_debito, :dt_debito, :cd_ocorrencia, :ds_motivos, :cd_titulo, :autentica) ';

   // Abrir o arquivo
   AssignFile( Arquivo, txtArquivo.Text );
   Reset( Arquivo );

   iLinha := 1;

   Bar.Min := 1;
   Bar.Max := StrToInt(lblRegistros.Caption);

   iBaixados := 0;

   while NOT EOF(Arquivo) do begin

       Readln(Arquivo, linha);

       // Selecionar o Segmento
       iSeg := GetSegmento(Copy(linha, inr_seg_ini, 1));

       if Copy(linha, inr_reg_det_ini, 1) = sds_reg_det then begin

         if aConfig[iSeg].nr_tit_ini > 0 then begin


           // Buscar Valor Pago;
           VlDebito := StrToCurr(Copy( linha, aConfig[iSeg].nr_val_ini, aConfig[iSeg].nr_val_tam - 2 ) + ',' +
                                     Copy( linha, aConfig[iSeg].nr_val_ini + aConfig[iSeg].nr_val_tam - 2 ,  2 ));

           // Pegar a data do débito
           // sData :=  Copy( linha, aConfig[iSeg].nr_dat_ini, 2 ) + '/' + Copy( linha, aConfig[iSeg].nr_dat_ini + 2 , 2 ) + '/' + Copy( linha, aConfig[iSeg].nr_dat_ini + 4, aConfig[iSeg].nr_dat_tam - 4);

           // Pegar a data conforme o formado: Claudionor 17/06/2015

           if (aConfig[iSeg].ds_dat_formato = 'amd') then begin

             sData :=  Copy( linha, aConfig[iSeg].nr_dat_ini + aConfig[iSeg].nr_dat_tam - 2, 2 )
               + '/' + Copy( linha, aConfig[iSeg].nr_dat_ini + aConfig[iSeg].nr_dat_tam - 4, 2 )
               + '/' + Copy( linha, aConfig[iSeg].nr_dat_ini, aConfig[iSeg].nr_dat_tam - 4);

           end else begin

              sData :=  Copy( linha, aConfig[iSeg].nr_dat_ini, 2 )
                + '/' + Copy( linha, aConfig[iSeg].nr_dat_ini + 2 , 2 )
                + '/' + Copy( linha, aConfig[iSeg].nr_dat_ini + 4, aConfig[iSeg].nr_dat_tam - 4);

           end;

           //Pegar a primeira ocorrência
           sOcorrencia := Copy(linha, aConfig[iSeg].nr_oco_ini, aConfig[iSeg].nr_oco_tam );

           // Buscar os motivos da Ocorrência - gravar como string
           sMotivos := Copy(linha, aConfig[iSeg].nr_oco_ini + aConfig[iSeg].nr_oco_tam, (aConfig[iSeg].nr_oco_tam * aConfig[iSeg].nr_oco_qtd) - aConfig[iSeg].nr_oco_tam);
           sMotivos := GetMotivos(sBanco, sMotivos, aConfig[iSeg].nr_oco_tam);

           // Pegar o código do Título
           sTitulo := Copy(linha, aConfig[iSeg].nr_tit_ini, aConfig[iSeg].nr_tit_tam);

           // Busca a autenticação (se houver)
           sAutenticacao := copy( linha, aConfig[iSeg].nr_autentica_inicio, aConfig[iSeg].nr_autentica_tamanho);

           Try
              iTitulo := StrToInt(sTitulo);
              sTitulo := IntToStr(iTitulo);
           except
              sTitulo := '';
              iTitulo := 0;
           end;

           iRetBaixa := DeveBaixar(sBanco, sOcorrencia);

           if iRetBaixa = 0 then begin
              snBaixado := 0;
              sMotivos := trim('* OCORRENCIA NÃO CADASTRADA * ' + sMotivos);
           end else begin

              if iRetBaixa = 2 then begin
                 snBaixado := 0;
                 sMotivos := trim('* NÃO BAIXADO * ' + sMotivos);

              end else begin

                 iRetBaixa := BaixarCompromisso(iTitulo, iColigada, vlDebito, StrToDate(sData));

                 if iRetBaixa = 1 then begin
                    snBaixado := 1;
                    Inc(iBaixados);
                 end else if iRetBaixa = 2 then begin
                    snBaixado := 0;
                    sMotivos := trim('* TÍTULO JA BAIXADO * ' + sMotivos);
                 end else if iRetBaixa = 0 then begin
                    snBaixado := 0;
                    sMotivos := trim('* TÍTULO NÃO ENCONTRADO * ' + sMotivos);
                 end;

              end;

           end;


           // Inserir o Item
           qItens.ParamByName('cd_retorno').AsInteger := iCodigoRetorno;
           qItens.ParamByName('nr_linha').AsInteger := iLinha;
           qItens.ParamByName('me_linha').AsString := linha;
           qItens.ParamByName('sn_baixado').AsInteger := 0;
           qItens.ParamByName('vl_debito').AsCurrency := VlDebito;
           qItens.ParamByName('dt_debito').AsString :=  FormatDateTime('yyyy-mm-dd hh:nn:sss', StrToDate(sData));
           qItens.ParamByName('cd_ocorrencia').AsString := sOcorrencia;
           qItens.ParamByName('cd_titulo').AsString := sTitulo;
           qItens.ParamByName('ds_motivos').AsString := sMotivos;
           qItens.ParamByName('sn_baixado').AsInteger := snBaixado;
           qItens.ParamByName('autentica').AsString := sAutenticacao;

           qItens.ExecSQL();
           INC(iLinha);

         end
         else if (aConfig[iSeg].nr_autentica_inicio > 0) then
         begin
           //Se não tem o inicio de registro mas tem um segmento verificamos apenas se não é a linha com a informação de Autenticação
           sAutenticacao := copy( linha, aConfig[iSeg].nr_autentica_inicio, aConfig[iSeg].nr_autentica_tamanho);
           if(sAutenticacao <> '') then
           begin
              qryAtualiza.Close;
              qryAtualiza.ParamByName('autentica').AsString := sAutenticacao;
              qryAtualiza.ParamByName('retorno').AsInteger := iCodigoRetorno;
              qryAtualiza.ParamByName('linha').AsInteger := iLinha -1;
              qryAtualiza.ExecSQL;
           end;

         end;

         Bar.Position := Bar.Position + 1;
         Application.ProcessMessages();

       end;

   end;

   CloseFile(Arquivo);

   lblProcessados.Caption := IntToStr(iBaixados); 

   Mensagem('Arquivo Processado com sucesso!', 'UNIMESTRE', MB_OK, HANDLE);

   sbBaixar.Visible := false;

   Filtrar();

end;

end.
