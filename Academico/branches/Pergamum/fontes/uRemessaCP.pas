unit uRemessaCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, StdCtrls, Mask, DBCtrls, Buttons,
  ToolWin, ImgList, Grids, DBGrids, General, Main, UZDataset,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UMLookupComboBox;

type
  TfRemessaCP = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    Panel1: TPanel;
    pgRemessa: TPageControl;
    tsNovaRemessa: TTabSheet;
    tsRemessasEnviadas: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsRemessa: TDataSource;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    btnCriarRemessa: TSpeedButton;
    bgCompromisso: TDBGrid;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    btnExportarRemessa: TToolButton;
    ToolButton4: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    ds_Compromissos: TDataSource;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    btnMarcar: TSpeedButton;
    btnDesmarcar: TSpeedButton;
    ImageList1: TImageList;
    sbSelecionarColuna: TSpeedButton;
    Label6: TLabel;
    cbRemessa: TComboBox;
    SpeedButton1: TSpeedButton;
    qryRemessas: TUMZQuery;
    qryCompromissos: TUMZReadOnlyQuery;
    qryRemessasCD_REMESSA: TLargeintField;
    qryRemessasNR_REMESSA: TLargeintField;
    qryRemessasDS_REMESSA: TStringField;
    qryRemessasDT_CRIACAO: TDateTimeField;
    qryRemessasDT_ENVIO: TDateTimeField;
    qryRemessasDT_RETORNO: TDateTimeField;
    qryRemessasCD_CAIXA: TLargeintField;
    qryRemessasCD_COLIGADA: TLargeintField;
    qryRemessasDT_CP_INICIO: TDateTimeField;
    qryRemessasDT_CP_FIM: TDateTimeField;
    qryRemessasCD_USUARIO: TLargeintField;
    qryRemessasdescConta: TStringField;
    qryCompromissosCD_TITULO: TLargeintField;
    qryCompromissosDS_DESPESA: TStringField;
    qryCompromissosNR_DOCUMENTO: TStringField;
    qryCompromissosNR_PARCELA: TIntegerField;
    qryCompromissosDT_PROVAVEL_PGTO: TDateTimeField;
    qryCompromissosVL_PENDENTE: TFloatField;
    qryCompromissosCD_PESSOA: TIntegerField;
    qryCompromissosNM_PESSOA: TStringField;
    qryCompromissosCD_REMESSA: TLargeintField;
    qryCompromissosDS_TIPO_TITULO: TStringField;
    qryCompromissosDS_FORMA_PGTO: TStringField;
    qryCompromissosselecao: TIntegerField;
    qryContas: TUMZReadOnlyQuery;
    qryContasDS_CAIXA: TStringField;
    qryAcao: TUMZReadOnlyQuery;
    qryAcaoCD_PESSOA: TIntegerField;
    qryAcaoCD_CONTATO: TIntegerField;
    qryAcaoDS_CONTATO: TStringField;
    qryEnviadas: TUMZReadOnlyQuery;
    qryEnviadasCD_REMESSA: TLargeintField;
    qryEnviadasDS_REMESSA: TStringField;
    qryContasCD_CAIXA: TIntegerField;
    UMLookupComboBox1: TUMLookupComboBox;
    Label7: TLabel;
    qryRemessasnm_coligada: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bgCompromissoTitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure pgRemessaChange(Sender: TObject);
    procedure btnExportarRemessaClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bgCompromissoCellClick(Column: TColumn);
    procedure bgCompromissoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btFecharClick(Sender: TObject);
    procedure dsRemessaStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCriarRemessaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    RemDados: TStringList;
    RemInfo: TStringList;

    iLoteNumero : Integer;
    sOrdem : String;
    ASelList: TStringList;
    Procedure IncluirRemessa();
    Procedure SalvarRemessa();
    Procedure CarregarCompromissos();
    Procedure ExportarDados();
    function getNomeArquivoRemessa(Layout : Integer): string;
    Function GerarDetalhes(Consulta : String; Layout : Integer; Tipo : Integer; DescricaoTipo : String; Remessa : Integer; Detalhes : Integer; Trailer : Integer ) : Boolean;
    function FormataSequencia(sValor: string; iSize: Integer; sFill: string): string;

    procedure CarregarContas();
  public
    { Public declarations }

    iLinhaCount: LongInt;
    iLinhaRegistroLote : LongInt;
  end;

var
  fRemessaCP: TfRemessaCP;

implementation

uses uDM, uCamposPlanilhas, StrUtils, uSplash, uUsuario, uItemCombo;

{$R *.dfm}

procedure TfRemessaCP.dsRemessaStateChange(Sender: TObject);
begin
    btnCriarRemessa.Enabled := qryRemessas.State in [dsInsert, dsEdit];
    btnExportarRemessa.Enabled := NOT (qryRemessas.State in [dsInsert, dsEdit] );
end;

procedure TfRemessaCP.ExportarDados;
Var
   qLotes : TUMZQuery;
   iLayout : Integer;
  sNome : String;   
begin
    // Exportar os dados

    frmSpl2 := TfrmSplash.Create(Self);
    frmSpl2.Processando(True);
    frmSpl2.setTitulo('Remessa de Compromissos');
    frmSpl2.setTexto('Salvando seleção de compromissos...');


    frmSpl2.setTexto('Carregando Layout...');

    DM.CriarConsulta(qLotes);

    // Buscar o código do layout
    qLotes.SQL.Text :=
       'SELECT * FROM rem_layouts ' +
       ' WHERE cd_origem = 2 AND cd_caixa = ' + qryRemessascd_caixa.AsString;
// Retirado por Claudionor em 14/06/2016 - Não deve checar a coligada, ela não é mais chave da tabela de caixa.
// O cd_coligada na rem_layout será apenas para especificar os compromissos que serão gerados.
//       '   AND cd_coligada = ' + qryRemessasCD_COLIGADA.AsString;
    qLotes.Open();

    if qLotes.Eof then
    begin
       // deve haver um layout de remessa configurado para esta conta
       Mensagem('Não existe layout de remessa para a conta selecionada.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
       FreeAndNil(qLotes);
       Exit;
    end;

    iLayout := qLotes.FieldByName('cd_layout').AsInteger;

    // Buscar os lotes a serem exportados

    qLotes.Close();
    qLotes.SQL.Clear();
    qLotes.SQL.Text :=
       ' SELECT * FROM rem_layouts_lotes ' +
       '  WHERE cd_layout = ' + IntToStr(iLayout) +
       '  ORDER BY nr_ordem ';
    qLotes.Open();

    if RemDados <> nil then begin
       FreeAndNil(RemDados);
    end;

    RemDados := TStringList.Create();
    iLinhaCount := 0;

    iLoteNumero := 0;

    // Processar cada Lote
    while NOT qLotes.Eof do begin

       // Carregar o SQL do Layout do Lote

       if RemInfo <> nil then begin
          FreeAndNil(RemInfo);
       end;

       RemInfo := TStringList.Create();

       frmSpl2.setTexto('Exportando Layout '+qLotes.FieldByName('ds_tipo').AsString+'...');

       if (qLotes.FieldByName('cd_tipo_detalhes').AsInteger <> -1) AND (qLotes.FieldByName('cd_tipo_trailer').AsInteger <> -1) then begin

           iLinhaRegistroLote := 0;

           if Not GerarDetalhes(qLotes.FieldByName('me_sql').AsString, iLayout, qLotes.FieldByName('cd_tipo').AsInteger, qLotes.FieldByName('ds_tipo').AsString, qryRemessascd_remessa.AsInteger, qLotes.FieldByName('cd_tipo_detalhes').AsInteger, qLotes.FieldByName('cd_tipo_trailer').AsInteger)
           then begin

              FreeAndNil(RemDados);
              frmSpl2.Processando(False);
              Exit;

//           end else begin

// Não é necessário gravar a cada lote enviado
//             RemDados.SaveToFile('c:\remessa\' + qLotes.FieldByName('ds_tipo').AsString);

//             RemDados.Clear();


           end;

       end;

       qLotes.Next();

    end;

    frmSpl2.setTexto('Salvando o Arquivo...');
    //salva em arquivo
    sNome := getNomeArquivoRemessa(iLayout);
    RemDados.SaveToFile(sNome);

    FreeAndNil(remDados);
    FreeAndNil(RemInfo);

    // Incrementar o Número da Remessa
    qLotes.Close();
    qLotes.SQL.Clear();
    qLotes.SQL.Add(' UPDATE rem_layouts SET nr_remessa = nr_remessa + 1 ');
    qLotes.SQL.Add(' WHERE cd_layout = ' + IntToStr(iLayout));
    qLotes.ExecSQL();

    FreeAndNil(qLotes);
end;

function TfRemessaCP.FormataSequencia(sValor: string; iSize: Integer;
  sFill: string): string;
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
   Result := sAux;
end;


procedure TfRemessaCP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfRemessaCP.FormCreate(Sender: TObject);
begin
  ASelList := TStringList.Create();
  DM.MontarPlanilha(bgCompromisso, 'planilha_cp_remessa_campos');
  sOrdem := 'P.NM_PESSOA, CP.dt_provavel_pgto';
end;

procedure TfRemessaCP.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ASelList);
end;

procedure TfRemessaCP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    VK_F12 : btFecharClick( nil );
  end;
end;

procedure TfRemessaCP.FormShow(Sender: TObject);
begin
   // Iniciar o Formulário na Opção de Nova Remessa,
   // Sem apresentar nenhum compromisso.
   CarregarContas();

   if qryContas.EOF then
   begin
      Mensagem('Atenção' + CHR(13) + CHR(13) + 'Não existe contas vinculadas a um layout de exportação.' + CHR(13) + 'É preciso configurar este recurso para utilizá-lo.', 'Atenção', MB_OK + MB_ICONWARNING );
      Exit;
   end;

   IncluirRemessa();
end;

Function TfRemessaCP.GerarDetalhes(Consulta : String; Layout : Integer; Tipo : Integer; DescricaoTipo : String; Remessa : Integer; Detalhes : Integer; Trailer : Integer  ) : Boolean;
const
   S_GLUE_MYSQL = ', ';
   S_GLUE_ORACLE = ' || ';
   S_FORMATO_MYSQL = '%s(IFNULL(%s, ''''), %s, ''%s'')';
   S_FORMATO_ORACLE = '%s(NVL(%s, ''''), %s, ''%s'')';
   S_CONCAT_MYSQL = 'CONCAT(%s) as detalhes %s';
   S_CONCAT_ORACLE = '%s as detalhes %s';

   function GetFormatFieldByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_FORMATO_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_FORMATO_MYSQL;
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

var
   sSQL: string;
   sAux, sGlue: string;
   sFill, sSize, sValor: string;
   iCount: Integer;
   slAux: TStringList;
   sAjuda : String;
   lstContatos : array [1..10] of TStringList;
   iContatos : Integer;
   nContatos : Integer;
   qySQLDetalhes : TUMZQuery;
   sqlAux : String;
   qyAux : TUMZQuery;

begin
   // Gerar Detalhes para remessa

   //tras as especificacoes para montar a grade
   Dm.criarConsulta(qyAux);
   
   with qyAux do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add(''+
      'SELECT                                         '+
      '	nr_inicio, nr_tamanho, ds_valor, chr_fill    '+
      'FROM                                           '+
      '	rem_layout_espec rle                         '+
      'WHERE                                          '+
      '	cd_layout = '+ IntToStr(Layout)       + '    '+
      '	AND cd_tipo = '+ IntToStr(Tipo)       + '    '+
      'ORDER BY                                       '+
      '	nr_inicio                                    '+
      '');
      Open();

      if not IsEmpty then begin
         sGlue := '';
         sSQL := '';

         iContatos := 0;

         while not Eof do begin
            sValor := StringReplace(FieldByName('ds_valor').AsString, '"', '''', [rfReplaceAll]);
            sSize := FieldByName('nr_tamanho').AsString;
            sFill := FieldByName('chr_fill').AsString;

            //preenchimento padrao
            if (sFill = '') then begin
               sFill := ' ';
            end;

            //valor padrao
            if (sValor = '') then begin
               sValor := ''' ''';
            end;

            //parametro fixo
            if ( sValor = '[lote_numero]' ) then begin

               RemInfo.Values['RegLotNum.Size'] := sSize;
               RemInfo.Values['RegLotNum.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if ( sValor = '[lote_ultimo]' ) then begin

               RemInfo.Values['RegLotNum.Size'] := sSize;
               RemInfo.Values['RegLotNum.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if ( sValor = '[registro_sequencia]' ) then begin

               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if (sValor = '[registro_sequencia1]') then begin
               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if (sValor = '[registro_sequencia2]') then begin
               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if (sValor = '[registro_sequencia_b]') then begin
               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if (sValor = '[linha_numero]') then begin
               RemInfo.Values['Linha.Size'] := sSize;
               RemInfo.Values['Linha.Fill'] := sFill;
               sAux := ''''+sValor+'''';
            end
            else if (LeftStr(sValor,4) = '[dv:') then begin
               //digito verificador
               slAux := TStringList.Create();
               sAux := Copy(sValor, 2, (Length(sValor)-2));
               SplitString(sAux, ':', slAux);
               RemInfo.Values['DV.Num'] := slAux.Strings[1];
               RemInfo.Values['DV.Tipo'] := slAux.Strings[2];
               RemInfo.Values['DV.Banco'] := slAux.Strings[3];
               RemInfo.Values['DV.Valor'] := ', (' + slAux.Strings[4] + ') as digito_verificador';
               RemInfo.Values['DV.Size'] := sSize;
               RemInfo.Values['DV.Fill'] := sFill;
               FreeAndNil(slAux);
               sAux := '''[digito_verificador]''';
            end
            else if (LeftStr(sValor,9) = '[contato:') then begin
               // Contatos

               INC(iContatos);
               lstContatos[iContatos] := TStringList.Create;

               slAux := TStringList.Create();
               sAux := Copy(sValor, 2, (Length(sValor)-2));
               SplitString(sAux, ':', slAux);

               lstContatos[iContatos].Values['Pessoa'] := slAux.Strings[1];
               lstContatos[iContatos].Values['Contato'] := slAux.Strings[2];
               lstContatos[iContatos].Values['Cont.Size'] := sSize;
               lstContatos[iContatos].Values['Cont.Fill'] := sFill;

               // Montar como [contato:aluno/responsavel:contato:tamanho]
               sAux := '''[contato_' + IntToStr(iContatos) +']''';

            end
            else begin
               //lado do preenchimento
               if (sFill = '0') then begin
                  sAux := 'LPAD';
               end
               else begin
                  sAux := 'RPAD';
               end;
               sAux := Format(GetFormatFieldByProtocol, [sAux, sValor, sSize, sFill]);
            end;
            sSQL := sSQL + sGlue + sAux;
            sGlue := GetGlueByProtocol;
            Next();
         end;
      end;

      if (sSQL = '') then begin
         sSQL := '''''';
      end;

      //pega a linha resultado
      Close();
      SQL.Clear();
      SQL.Text := ReplaceStr(Consulta, '[campos]', Format(GetConcatByProtocol, [sSQL, RemInfo.Values['DV.Valor']]));

      if Params.FindParam('cd_remessa') <> nil then begin

          ParamByName('cd_remessa').AsInteger := Remessa;

      end;

      try
        Open();
        if not IsEmpty then begin
            iCount := 1;

            while not Eof do begin
               INC(iLinhaRegistroLote);
               Inc(iLinhaCount);
               sAux := FieldByName('detalhes').AsString;

               //digito verificador
               if (RemInfo.Values['DV.Valor'] <> '') then begin
                  if (RemInfo.Values['DV.Num'] = '11') then
                     sGlue := DV11(FieldByName('digito_verificador').AsString, RemInfo.Values['DV.Tipo'], RemInfo.Values['DV.Banco'])
                  else if (RemInfo.Values['DV.Num'] = '10') then
                     sGlue := DV10(FieldByName('digito_verificador').AsString, RemInfo.Values['DV.Banco'])
                  else if (RemInfo.Values['DV.Num'] = 'A2') then
                      sGlue := DVA2(FieldByName('digito_verificador').AsString, RemInfo.Values['DV.Tipo'], RemInfo.Values['DV.Banco'])
                  else                       
                     sGlue := '0';
                 //substitui
                 sAux := StringReplace(sAux, '[digito_verificador]', FormataSequencia((sGlue), StrToInt(RemInfo.Values['DV.Size']), RemInfo.Values['DV.Fill']), [rfReplaceAll]);
               end;

               if (RemInfo.Values['RegSeq.Size'] <> '') then begin
                  sAux := StringReplace(sAux, '[registro_sequencia]', FormataSequencia(IntToStr(iCount), StrToInt(RemInfo.Values['RegSeq.Size']), RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
                  sAux := StringReplace(sAux, '[registro_sequencia1]', FormataSequencia(IntToStr((iCount*2)-1), StrToInt(RemInfo.Values['RegSeq.Size']), RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
                  sAux := StringReplace(sAux, '[registro_sequencia2]', FormataSequencia(IntToStr(iCount*2), StrToInt(RemInfo.Values['RegSeq.Size']), RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
                  sAux := StringReplace(sAux, '[registro_sequencia_b]', FormataSequencia(IntToStr(iLinhaRegistroLote), StrToInt(RemInfo.Values['RegSeq.Size']), RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
               end;

               if (RemInfo.Values['RegLotNum.Size'] <> '') then begin

                  if Pos('[lote_numero]', sAux) > 0 then begin
                     INC(iLoteNumero);
                     sAux := StringReplace(sAux, '[lote_numero]', FormataSequencia(IntToStr(iLoteNumero), StrToInt(RemInfo.Values['RegLotNum.Size']), RemInfo.Values['RegLotNum.Fill']), [rfReplaceAll]);
                  end;

                  if Pos('[lote_ultimo]', sAux) > 0 then begin
                     sAux := StringReplace(sAux, '[lote_ultimo]', FormataSequencia(IntToStr(iLoteNumero), StrToInt(RemInfo.Values['RegLotNum.Size']), RemInfo.Values['RegLotNum.Fill']), [rfReplaceAll]);
                  end;

               end;
               
               if (RemInfo.Values['Linha.Size'] <> '') then begin
                  sAux := StringReplace(sAux, '[linha_numero]', FormataSequencia(IntToStr(iLinhaCount), StrToInt(RemInfo.Values['Linha.Size']), RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
               end;

               For nContatos := 1 To iContatos do begin

                   qryAcao.Close();
                   qryAcao.ParamByName('CD_CONTATO').AsInteger := StrToInt(lstContatos[nContatos].Values['Contato']);

                   if lstContatos[nContatos].Values['Pessoa'] = 'responsavel' then
                     qryAcao.ParamByName('CD_PESSOA').AsInteger := FieldByName('codresp').AsInteger
                  else
                     qryAcao.ParamByName('CD_PESSOA').AsInteger := FieldByName('codaluno').AsInteger;

                  qryAcao.Open();

                  sAux := StringReplace(sAux, '[contato_' + IntToStr(nContatos) +  ']', FormataSequencia(qryAcao.FieldByName('ds_contato').AsString, StrToInt(lstContatos[nContatos].Values['Cont.Size']), lstContatos[nContatos].Values['Cont.Fill']), [rfReplaceAll]);
               end;

               while Pos('||', sAux) > 0  do begin
                  RemDados.Add( Copy(sAux, 1, Pos('||', sAux) - 1)) ;
                  sAux := Copy(sAux, Pos('||', sAux) +2, length(sAux) );
                  Inc(iLinhaCount);
               end;

               RemDados.Add(sAux);
               
               // Para cada registro de lote processado, verificar seus filhos cd_tipo_detalhe e cd_tipo_trailer
               // Recursividade

               if Detalhes > 0 then begin

                  DM.CriarConsulta(qySQLDetalhes);
                  qySQLDetalhes.SQL.Text :=
                     ' SELECT * FROM rem_layouts_lotes ' +
                     '  WHERE cd_layout = ' + IntToStr(Layout) +
                     '    AND cd_tipo = ' + IntToStr(Detalhes) +
                     '  ORDER BY nr_ordem ';
                  qySQLDetalhes.Open();

                  frmSpl2.setTexto('Exportando Layout '+qySQLDetalhes.FieldByName('ds_tipo').AsString+'...');

                  sqlAux :=  qySQLDetalhes.FieldByName('me_sql').AsString;

                  // Tentar trocar os parametros pelo valor contido no SQL "pai"
                  if FieldList.IndexOf('cd_titulo_banco') >= 0 then begin
                  sqlAux := StringReplace(sqlAux, ':cd_titulo_banco', '''' + FieldByName('cd_titulo_banco').AsString + '''', [rfReplaceAll]);
                  end;

                  if FieldList.IndexOf('cd_forma_banco') >= 0 then begin
                  sqlAux := StringReplace(sqlAux, ':cd_forma_banco', '''' + FieldByName('cd_forma_banco').AsString + '''', [rfReplaceAll]);
                  end;

                  if FieldList.IndexOf('cd_titulo') >= 0 then begin
                     sqlAux := StringReplace(sqlAux, ':cd_titulo', '"' + FieldByName('cd_titulo').AsString + '"', [rfReplaceAll]);
                  end;

                  if Not GerarDetalhes(sqlAux, Layout, qySQLDetalhes.FieldByName('cd_tipo').AsInteger, qySQLDetalhes.FieldByName('ds_tipo').AsString, qryRemessascd_remessa.AsInteger, qySQLDetalhes.FieldByName('cd_tipo_detalhes').AsInteger, qySQLDetalhes.FieldByName('cd_tipo_trailer').AsInteger)
                  then begin

                       FreeAndNil(RemDados);
                       frmSpl2.Processando(False);
                       Exit;

                  end;
                  FreeAndNil(qySQLDetalhes);

               end;

               if Trailer > 0 then begin

                  DM.CriarConsulta(qySQLDetalhes);
                  qySQLDetalhes.SQL.Text :=
                     ' SELECT * FROM rem_layouts_lotes ' +
                     '  WHERE cd_layout = ' + IntToStr(Layout) +
                     '    AND cd_tipo = ' + IntToStr(Trailer) +
                     '  ORDER BY nr_ordem ';
                  qySQLDetalhes.Open();

                  frmSpl2.setTexto('Exportando Layout '+qySQLDetalhes.FieldByName('ds_tipo').AsString+'...');

                  sqlAux :=  qySQLDetalhes.FieldByName('me_sql').AsString;
                  if FieldList.IndexOf('cd_titulo_banco') >= 0 then begin
                  sqlAux := StringReplace(sqlAux, ':cd_titulo_banco', '''' + FieldByName('cd_titulo_banco').AsString + '''', [rfReplaceAll]);
                  end;

                  if FieldList.IndexOf('cd_forma_banco') >= 0 then begin
                  sqlAux := StringReplace(sqlAux, ':cd_forma_banco', '''' + FieldByName('cd_forma_banco').AsString + '''', [rfReplaceAll]);
                  end;

                  if FieldList.IndexOf('cd_titulo') >= 0 then begin
                    sqlAux := StringReplace(sqlAux, ':cd_titulo', '"' + FieldByName('cd_titulo').AsString + '"', [rfReplaceAll]);
                  end;

                  if Not GerarDetalhes(sqlAux, Layout, qySQLDetalhes.FieldByName('cd_tipo').AsInteger, qySQLDetalhes.FieldByName('ds_tipo').AsString, qryRemessascd_remessa.AsInteger, qySQLDetalhes.FieldByName('cd_tipo_detalhes').AsInteger, qySQLDetalhes.FieldByName('cd_tipo_trailer').AsInteger)
                  then begin

                       FreeAndNil(RemDados);
                       frmSpl2.Processando(False);
                       Exit;

                  end;
                  FreeAndNil(qySQLDetalhes);

               end;

               Inc(iCount);
               Next();



            end;
            Result := True;
        end
        else begin
//         Mensagem('Nenhum registro de cabecalho!!');
         Result := true;
        end;
      except
         Mensagem('Erro no Layout do Arquivo de Remessa ('+DescricaoTipo+')');
         Result := False;
      end;
      Close();
   end;
  

end;

function TfRemessaCP.getNomeArquivoRemessa(Layout : Integer): string;
var
   nome : string;
   i, cont : Integer;
   qLayout : TUMZQuery;
   NmArquivo : String;

   dia, mes, ano : word;

   aM : Array [1..12] of string;
begin
  // Função para descobrir o nome do arquivo remessa

  // Buscar o padrao do nome do arquivo na tabela remessas

  DM.CriarConsulta(qLayout);

  qLayout.SQL.Text := 'SELECT nm_arquivo FROM rem_layouts WHERE cd_layout = ' + IntToStr(Layout);
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

  cont := 0;

  if Pos('[c]', NmArquivo) > 0 then cont := 9;

  for i := 1 to cont do begin

    Nome := ReplaceStr(NmArquivo, '[c]', FillString(IntToStr(i), alRight, '0', 1, false));

    if not FileExists(nome) then begin
       result := nome;
       Exit;
    end;

  end;  

  Result := nome;

  Exit;

end;

procedure TfRemessaCP.IncluirRemessa;
begin
   // Incluir uma nova remessa
   pgRemessa.ActivePage := tsNovaRemessa;

   qryCompromissos.Close();
   
   qryRemessas.Close();
   qryRemessas.SQL.Text :=
     ' SELECT * ' +
     '   FROM fin_remessa_cp '  +
     '  WHERE cd_remessa = :cd_remessa ';
   qryRemessas.ParamByName('cd_remessa').AsInteger := -1;

   qryRemessas.Open;

   qryRemessas.Insert();
   qryRemessasnr_remessa.AsInteger := DM.ProximoId('NR_REMESSA', 'FIN_REMESSA_CP');
   qryRemessasdt_criacao.AsDateTime := DM.DataAtual();
   qryRemessascd_usuario.AsInteger := DM.iCdPessoaLogado;
   qryRemessasds_remessa.AsString := 'Remessa de Pagamentos ' + FormatDateTime('dd/mm/yyyy', DM.DataAtual());
   qryRemessasdt_cp_inicio.AsDateTime := Date();
   qryRemessasdt_cp_fim.AsDateTime := Date();

   if qryContas.RecordCount = 1 then
   begin
      qryRemessascd_caixa.AsInteger := qryContascd_caixa.AsInteger;
   end;

   dbeDescricao.SetFocus();
end;

procedure TfRemessaCP.pgRemessaChange(Sender: TObject);
begin
   if pgRemessa.ActivePage = tsRemessasEnviadas then
   begin
      qryEnviadas.Close;
      qryEnviadas.Open;
      cbRemessa.Clear;
      while not qryEnviadas.Eof do
      begin
         cbRemessa.AddItem(qryEnviadasDS_REMESSA.AsString, TItemCombo.Create(
            qryEnviadasCD_REMESSA.AsString,
            qryEnviadasDS_REMESSA.AsString
         ));

         qryEnviadas.Next;
      end;
      qryEnviadas.Close;
   end;
end;

procedure TfRemessaCP.SalvarRemessa;
Var
  iUltimaRemessa : Integer;
begin
   // Verificar Se foram preenchidos os campos necessários;

   if qryRemessasdt_cp_inicio.AsString = '' then begin
       // Se não selecionou uma data inicial, então não pode salvar
       Mensagem('Você precisa informar uma data inicial para os pagamentos.', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
       Exit;
   end;

   if qryRemessasdt_cp_fim.AsString = '' then begin
       // Se não selecionou uma data final, então não pode salvar
       Mensagem('Você precisa informar uma data final para os pagamentos.', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
       Exit;
   end;

   if qryRemessascd_caixa.AsInteger = 0 then begin
       // Se não selecionou uma conta, então não pode salvar
       Mensagem('Você precisa selecionar uma conta de pagamento para continuar.', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
       Exit;
   end;

   if qryRemessasCD_COLIGADA.AsInteger = 0 then
   begin
      // Se não selecionou uma unidade de ensino, então não pode salvar
      Mensagem('Você precisa selecionar uma Unidade de Ensino.', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
      UMLookupComboBox1.SetFocus;
      Exit;
   end;

   // Se chegou aqui, é porque preenchou os campos neessários, então ele pode salvar e listar os compromissos para seleção.


   if qryRemessas.State = dsInsert then begin

     qryRemessas.Post();
     iUltimaRemessa := DM.LastInsert();

   end else begin

     qryRemessas.Post();
     iUltimaRemessa := qryRemessascd_remessa.AsInteger;

   end;


   qryRemessas.Close();
   qryRemessas.ParamByName('cd_remessa').AsInteger := iUltimaRemessa;
   qryRemessas.Open();
   

   // Filtrar os compromissos dentro do período selecionado

   CarregarCompromissos();


end;

procedure TfRemessaCP.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(bgCompromisso, 'planilha_cp_remessa_campos');
end;

procedure TfRemessaCP.SpeedButton1Click(Sender: TObject);
begin
    // Filtrar a remessa selecionada
    qryRemessas.close();
    qryRemessas.ParamByName('cd_remessa').AsString := TItemCombo(cbRemessa.Items.Objects[cbRemessa.ItemIndex]).getCodigo();
    qryRemessas.Open();

    pgRemessa.ActivePage := tsNovaRemessa;

    // Filtrar os compromissos do período
    
    CarregarCompromissos();
    
end;

procedure TfRemessaCP.bgCompromissoCellClick(Column: TColumn);
var
   PG: TPoint;
   GC: TGridCoord;
begin
   PG := bgCompromisso.ScreenToClient(Mouse.CursorPos);
   GC := bgCompromisso.MouseCoord( PG.X, PG.Y ) ;

   //1 coluna
   if GC.X = 1 then begin
      if ASelList.Values [ qryCompromissoscd_titulo.AsString ] = '1' then begin
         ASelList.Values [ qryCompromissoscd_titulo.AsString ] := '0';
      end
      else begin
         ASelList.Values [ qryCompromissoscd_titulo.AsString ] := '1';
      end;
      bgCompromisso.Repaint();
   end;
end;

procedure TfRemessaCP.bgCompromissoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
        
var
  DrawRect: TRect;
begin
    if Column.FieldName = 'selecao' then begin
       bgCompromisso.Canvas.FillRect(Rect);
       if (gdFocused in State) then begin
              DrawRect.Left := Rect.Left + 1;
       end
       else begin
          DrawRect.Left := Rect.Left + 2;
       end;

       DrawRect.Right := Rect.Right - 2;
       DrawRect.Top := Rect.Top + 2;
       DrawRect.Bottom := Rect.Bottom - 2;
       DrawFrameControl(bgCompromisso.Canvas.Handle,
            DrawRect,
            DFC_BUTTON,
            ISChecked[ ASelList.Values[ qryCompromissosCD_TITULO.AsString ] = '1' ]
       );

    end;
end;

procedure TfRemessaCP.bgCompromissoTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      // Os campos são separados por ;
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;

      // Espaço é o separador entre o nome do campo e o seu valor (Asc ou Desc)
      SortedFields.NameValueSeparator := ' ';

      // qrySample é o componente TZQuery/TZReadOnlyQuery ligado à grid
      SortedFields.DelimitedText := qryCompromissos.IndexFieldNames;
 
      // Percorre todos os campos sobre os quais foi aplicado ordenação
      for I := 0 to SortedFields.Count - 1 do
 
         // Verifica se o campo é o mesmo selecionado pelo usuário
         // Caso sim, significa que o campo já possui uma ordenação
 
         if SortedFields.Names[I] = Column.FieldName then
         begin
 
            // Verifica se a ordenação é Asc ou Desc
 
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               // Se a ordenação é Asc, então muda para Desc
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               // Se a ordenação é Desc, então remove a ordenação do campo
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
 
            // Sinaliza que o campo foi encontrado e quebra o loop
 
            Found := True;
            Break;
         end;
 
      // Se o campo não foi encontrado, significa que
      // ele não possui ordenação
      // Vamos aplicar a ordenação ascendente
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      // Configura a propriedade da query
      qryCompromissos.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;


procedure TfRemessaCP.btFecharClick(Sender: TObject);
begin
   qryRemessas.Cancel();
   Close();
end;

procedure TfRemessaCP.btnCriarRemessaClick(Sender: TObject);
begin
   SalvarRemessa();
end;

procedure TfRemessaCP.btnDesmarcarClick(Sender: TObject);
begin
   qryCompromissos.DisableControls();
   qryCompromissos.First();

   while not qryCompromissos.Eof do
   begin
      if ASelList.Values[ qryCompromissosCD_TITULO.AsString ] = '1' then
      begin
         ASelList.Values[ qryCompromissosCD_TITULO.AsString ] := '0';
      end;

      qryCompromissos.Next;
   end;

   bgCompromisso.Repaint();

   qryCompromissos.First();
   qryCompromissos.EnableControls();
end;

procedure TfRemessaCP.btnExportarRemessaClick(Sender: TObject);
Var
   qAtualiza: TUMZQuery;
   i : Integer;
begin

   // Gravar as remessas no banco de dados
   Dm.CriarConsulta(qAtualiza);

   qAtualiza.SQL.Text := 'UPDATE fin_contas_pagar SET cd_remessa = :cd_remessa WHERE cd_titulo = :cd_titulo AND cd_coligada = :cd_coligada ';

   qryCompromissos.First();


   for i := 0 to ASelList.Count - 1 do begin

      if (ASelList.ValueFromIndex[i] = '1') then begin
         qAtualiza.ParamByName('cd_remessa').AsInteger := qryRemessascd_remessa.AsInteger;
         qAtualiza.ParamByName('cd_titulo').AsString := ASelList.Names[i];
         qAtualiza.ParamByName('cd_coligada').AsInteger := qryRemessascd_coligada.AsInteger;
         qAtualiza.ExecSQL();
      end;
   end;

   FreeAndNil(qAtualiza);

   ExportarDados();

   frmSpl2.Processando(False);


end;

procedure TfRemessaCP.btnMarcarClick(Sender: TObject);
begin

   qryCompromissos.DisableControls();
   qryCompromissos.First();

   While not qryCompromissos.Eof do begin

      ASelList.Values[ qryCompromissosCD_TITULO.AsString ] := '1';

      qryCompromissos.Next;

   end;
   bgCompromisso.Repaint();
   qryCompromissos.EnableControls();
end;

procedure TfRemessaCP.CarregarCompromissos;
Var
   Autoriza : Boolean ;
begin
   // Verificar se o cliente pode
   Autoriza := DM.UsuarioLogado.TemPermissao( 2046, npIncluir, false );

   ASelList.Clear();

   qryCompromissos.Close();

   qryCompromissos.ParamByName('data_inicio').AsDateTime := qryRemessasdt_cp_inicio.AsDateTime;
   qryCompromissos.ParamByName('data_fim').AsDateTime := qryRemessasdt_cp_fim.AsDateTime;

   if Autoriza then begin
      qryCompromissos.ParamByName('autoriza').AsInteger := 1;
   end else begin
      qryCompromissos.ParamByName('autoriza').AsInteger := 0;
   end;
   
//   qryCompromissos.ParamByName('autoriza').AsBoolean := Autoriza;
   qryCompromissos.ParamByName('remessa').AsInteger := qryRemessascd_remessa.AsInteger;
   qryCompromissos.ParamByName('caixa').AsInteger := qryRemessascd_caixa.AsInteger;
   qryCompromissos.ParamByName('coligada').AsInteger := qryRemessascd_coligada.AsInteger;

   qryCompromissos.Open();

   // Marcar os Checks dos compromissos já assinalados

   qryCompromissos.DisableControls();

   while Not qryCompromissos.Eof do begin


      if qryCompromissosCD_REMESSA.AsInteger = qryRemessascd_remessa.AsInteger then Begin

         ASelList.Values[ qryCompromissosCD_TITULO.AsString ] := '1';

      end;

      qryCompromissos.Next();
   end;

   bgCompromisso.Repaint();

   qryCompromissos.First();

   qryCompromissos.EnableControls();

end;

procedure TfRemessaCP.CarregarContas;
const
   SQL_CARREGAR_CONTAS =
      ' SELECT DISTINCT C.CD_CAIXA, C.DS_CAIXA ' +
      ' FROM FIN_CADASTRO_CONTAS C ' +
      '      INNER JOIN FIN_CONTAS_USUARIOS U ON ( ' +
      '         C.CD_CAIXA = U.CD_CAIXA AND C.CD_COLIGADA = U.CD_COLIGADA ' +
      '      ) ' +
      '      INNER JOIN REM_LAYOUTS L ON ( ' +
      '         C.CD_CAIXA = L.CD_CAIXA AND C.CD_COLIGADA = L.CD_COLIGADA AND ' +
      '         L.CD_ORIGEM = 2 ' +
      '      ) ' +
      ' WHERE C.CD_COLIGADA IN (%s) AND U.CD_USUARIO = :CD_USUARIO ' +
      ' ORDER BY C.DS_CAIXA ';
begin
   qryContas.Close;
   qryContas.SQL.Text := Format( SQL_CARREGAR_CONTAS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qryContas.ParamByName('CD_USUARIO').AsInteger :=  DM.iCdPessoaLogado;
   qryContas.Open();
end;

end.
