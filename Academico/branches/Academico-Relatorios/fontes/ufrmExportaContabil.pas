unit ufrmExportaContabil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ImgList, DBCtrls, ToolWin, DB,
  ZConnection, Grids, DBGrids, Menus;

type
   TfrmExportaContabil = class(TForm)
      Bevel4: TBevel;
    pnRemessaTit: TPanel;
      Panel1: TPanel;
      lblLayout: TLabel;
      ultimoseparador: TBevel;
      toolPessoa: TToolBar;
      ToolButton6: TToolButton;
      DBNavigator1: TDBNavigator;
      ToolButton1: TToolButton;
      tblCalcular: TToolButton;
      ToolButton4: TToolButton;
      btFechar: TToolButton;
      ToolButton2: TToolButton;
      ImageList2: TImageList;
      dtFiltroFim: TDateTimePicker;
      cbSituacao: TComboBox;
      lblSituacao: TLabel;
      dtFiltroInicio: TDateTimePicker;
      lblAte: TLabel;
    cbDatas: TComboBox;
      qyRegistros: TUMZQuery;
      dtcRegistros: TDataSource;
      qyAux: TUMZQuery;
    qyRegistroscodigoaluno: TIntegerField;
    qyRegistrosnm_pessoa: TStringField;
    qyRegistrosparcela: TSmallintField;
    qyRegistrosturma: TStringField;
    qyRegistrosvalortotal: TFloatField;
    qyRegistrosvalorpago: TFloatField;
    qyRegistrosds_situacao: TStringField;
    qyRegistrosds_ocorrencia: TStringField;
    pnCentral: TPanel;
    pnEdicao: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    sbBuscaTurma: TSpeedButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    qyRegistroscd_remessa: TIntegerField;
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
    PageControl1: TPageControl;
    tsRegistros: TTabSheet;
    tsResumo: TTabSheet;
    dbgAprovacao: TDBGrid;
    DBGrid1: TDBGrid;
    qyResumo: TUMZQuery;
    qyResumods_ocorrencia: TStringField;
    qyResumoQtdAlunos: TFloatField;
    qyResumoQtdTitulos: TFloatField;
    qyResumoValTotal: TFloatField;
    dsResumo: TDataSource;
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
    procedure cbDatasChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
   private
      aLayouts: array of LongInt;
      aNumRemessa : array of Integer;
      RemDados: TStringList;
      RemInfo: TStringList;
      AListaOrdem: TStringList;
      AListaMap: TStringList;
      iLinhaCount: LongInt;
      bk: Pointer;

      { Private declarations }
      function getNomeArquivoRemessa(): string;
      function FormataSequencia(sValor: string; iSize: Integer; sFill: string): string;

      function getNumeroArquivoRemessa(): Integer;
   public
      { Public declarations }

      procedure FiltraDados();
      procedure ExportaDados();

      function GeraCabecalho(): Boolean;
      function GeraDetalhes(): Boolean;
      function GeraMensagens(): Boolean;
      function GeraRodape(): Boolean;
      procedure AlteraSituacao(iCodAcao: Integer);

   end;

var
  frmExportaContabil: TfrmExportaContabil;

implementation

{$R *.dfm}

uses
   General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM, Main, uSplash, StrUtils, uGerarRemessa;


procedure TfrmExportaContabil.FormShow(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 0;
   
   dtFiltroFim.DateTime := Now();
   dtFiltroInicio.DateTime := Now();

   //carrega lista de layouts
   with qyAux do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT cd_layout, nm_layout, nr_remessa FROM rem_layouts WHERE sn_ativo = 1 ORDER BY nm_layout'+
      '');
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
            Next();
         end;
      end;

   end;

end;

procedure TfrmExportaContabil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmExportaContabil.FormCreate(Sender: TObject);
begin
   AListaOrdem := TStringList.Create();
   AListaMap := TStringList.Create();
   AListaMap.Add('codigoaluno=mensalidade.codigaluno');
   AListaMap.Add('nm_pessoa=aluno.nm_pessoa');
   AListaMap.Add('turma=mensalidades.turma');
   AListaMap.Add('valorpago=mensalidades.valorpago');
   AListaMap.Add('valortotal=(IFNULL(mensalidades.valorbruto,0) + IFNULL(mensalidades.valorextra,0) + IFNULL(mensalidades.valorjuros,0) - IFNULL(mensalidades.descontoextra,0) )');
   AListaMap.Add('ds_situacao=situacoes_financeiras.ds_situacao');
   AListaMap.Add('cd_remessa=remessa.cd_remessa');
end;

procedure TfrmExportaContabil.FiltraDados();
var
   i: Integer;
begin

   with qyRegistros do begin
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      ' SELECT ec.*,  ea.cd_origem, deb.ds_conta conta_debito, cre.ds_conta conta_credito ' +
      ' FROM fin_exporta_contabil ec ' +
      ' INNER JOIN fin_exporta_contabil_acoes ea ON (ea.cd_acao = ec.cd_acao) '+
      ' INNER JOIN fin_plano_contas deb ON (ec.cd_debito = deb.cd_conta) '+
      ' INNER JOIN fin_plano_contas cre ON (ec.cd_credito = cre.cd_conta) '+
      ' WHERE (1=1) ');

      if (cbDatas.ItemIndex = 1) then begin
         SQL.Add(' AND (DATE_FORMAT(ec.dt_movimento, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + '" AND');
         SQL.Add(' DATE_FORMAT(ec.dt_movimento, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + '") ');
      end else if (cbDatas.ItemIndex = 1) then begin
         SQL.Add(' AND (DATE_FORMAT(ec.dt_registro, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + '" AND');
         SQL.Add(' DATE_FORMAT(ec.dt_registro, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + '") ');
      end;
               
      if (cbSituacao.ItemIndex < 2) then begin
         SQL.Add(' AND remessa.sn_exportado = ' + IntToStr(cbSituacao.ItemIndex));
      end;

      //processa ordem
      SQL.Add(' ORDER BY ');
      for i := 0 to AListaOrdem.Count - 1 do begin
         SQL.Add( AListaMap.Values[AListaOrdem.Names[i]] + ' ' + AListaOrdem.ValueFromIndex[i] + ', ');
      end;
      SQL.Add(' ec.dt_movimento');
      Open();
   end;

 {  with qyResumo do begin
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT                                                                '+
      '  rem_ocorrencias.ds_ocorrencia,                                      '+
      '  Count(DISTINCT mensalidades.codigoaluno) QtdAlunos,                 '+
      '  Count( DISTINCT remessa.cd_remessa)  QtdTitulos,                    '+
      '  SUM(mensalidades.valortotal) ValTotal                               '+
      'FROM                                                                   '+
      '  rem_dados remessa                                                    '+
      '  INNER JOIN mensalidades ON (remessa.cd_mensalidade = mensalidades.cd_mensalidade) '+
      '  INNER JOIN pessoas aluno ON (mensalidades.codigoaluno = aluno.cd_pessoa)          '+
      '  INNER JOIN pessoas responsavel ON (aluno.cd_resp_finan = responsavel.cd_pessoa)   '+
      '  INNER JOIN situacoes_financeiras ON (mensalidades.situacao = situacoes_financeiras.cd_situacao) '+
      '  INNER JOIN rem_layouts ON (remessa.cd_layout = rem_layouts.cd_layout)                           '+
      '  INNER JOIN rem_ocorrencias ON (remessa.cd_ocorrencia = rem_ocorrencias.cd_ocorrencia) AND (remessa.cd_layout = rem_ocorrencias.cd_layout)  '+
      'WHERE'+
      '  remessa.cd_layout = '+  IntToStr(aLayouts[cbListaLayouts.ItemIndex]) +
      '');

      if (ckbData.Checked) then begin
         SQL.Add(' AND (DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + '" AND');
         SQL.Add(' DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + '") ');
      end;

      if (cbSituacao.ItemIndex < 2) then begin
         SQL.Add(' AND remessa.sn_enviado = ' + IntToStr(cbSituacao.ItemIndex));
      end;

      if not ckbProtesto.Checked then begin
         SQL.Add(' AND mensalidades.situacao <> 9 ');
      end;

      SQL.Add(' GROUP BY rem_ocorrencias.ds_ocorrencia ');
      //processa ordem
      SQL.Add(' ORDER BY rem_ocorrencias.ds_ocorrencia');
      Open();
   end;  }

end;

procedure TfrmExportaContabil.cbDatasChange(Sender: TObject);
begin
   pnRemessaTit.Caption := 'GERAR ARQUIVO DE REMESSA (Número = ' + IntToStr(aNumRemessa[cbListaLayouts.ItemIndex]) + ')';
   FiltraDados();
end;

procedure TfrmExportaContabil.ckbDataClick(Sender: TObject);
begin
   dtFiltroInicio.Enabled := ckbData.Checked;
   dtFiltroFim.Enabled := ckbData.Checked;
   FiltraDados();
end;

procedure TfrmExportaContabil.ckbProtestoClick(Sender: TObject);
begin
   FiltraDados();
end;

procedure TfrmExportaContabil.dtFiltroInicioChange(Sender: TObject);
begin
   if (dtFiltroFim.Date < dtFiltroInicio.Date) then begin
      dtFiltroFim.Date := dtFiltroInicio.Date;
   end;
   FiltraDados();
end;

procedure TfrmExportaContabil.dtFiltroFimChange(Sender: TObject);
begin
   if (dtFiltroFim.Date > dtFiltroInicio.Date) then begin
      dtFiltroInicio.Date := dtFiltroFim.Date;
   end;
   FiltraDados();
end;

procedure TfrmExportaContabil.cbSituacaoChange(Sender: TObject);
begin
   FiltraDados();
end;

procedure TfrmExportaContabil.tblCalcularClick(Sender: TObject);
begin
   ExportaDados();
   FiltraDados();
end;

procedure TfrmExportaContabil.ExportaDados();
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
   with qyAux do begin
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
         SQL.Add('AND (DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + '" AND');
         SQL.Add('DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + '") ');
      end;
      ExecSQL();

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

function TfrmExportaContabil.getNomeArquivoRemessa(): string;
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

function TfrmExportaContabil.GeraMensagens(): Boolean;
begin
   Result := True;
end;

function TfrmExportaContabil.GeraDetalhes(): Boolean;
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
begin
   //tras as especificacoes para montar a grade
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
      '	cd_layout = '+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + '    '+
      '	AND cd_tipo = 2                              '+
      'ORDER BY                                       '+
      '	nr_inicio                                    '+
      '');
      Open();

      if not IsEmpty then begin
         sGlue := '';
         sSQL := '';

         iContatos := 0;

         while not Eof do begin
            sValor := FieldByName('ds_valor').AsString;
            sSize := FieldByName('nr_tamanho').AsString;
            sFill := FieldByName('chr_fill').AsString;

            //preenchimento padrao
            if (sFill = '') then begin
               sFill := ' ';
            end;

            //valor padrao
            if (sValor = '') then begin
               sValor := '" "';
            end;

            //parametro fixo
            if ( sValor = '[registro_sequencia]' ) then begin

               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := '"'+sValor+'"';
            end
            else if (sValor = '[registro_sequencia1]') then begin
               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := '"'+sValor+'"';
            end
            else if (sValor = '[registro_sequencia2]') then begin
               RemInfo.Values['RegSeq.Size'] := sSize;
               RemInfo.Values['RegSeq.Fill'] := sFill;
               sAux := '"'+sValor+'"';
            end
            else if (sValor = '[linha_numero]') then begin
               RemInfo.Values['Linha.Size'] := sSize;
               RemInfo.Values['Linha.Fill'] := sFill;
               sAux := '"'+sValor+'"';
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
               sAux := '"[digito_verificador]"';
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
               sAux := '"[contato_' + IntToStr(iContatos) +']"';

            end
            else begin
               //lado do preenchimento
               if (sFill = '0') then begin
                  sAux := 'LPAD';
               end
               else begin
                  sAux := 'RPAD';
               end;
               sAux := sAux + '(IFNULL('+ sValor +',""), '+ sSize +', "'+ sFill +'")';
            end;
            sSQL := sSQL + sGlue + sAux;
            sGlue := ', ';
            Next();
         end;
      end;

      if (sSQL = '') then begin
         sSQL := '""';
      end;

      //pega a linha resultado
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT aluno.cd_pessoa codaluno, responsavel.cd_pessoa codresp,                               ' +
      '  CONCAT('+ sSQL + ') as detalhes '+RemInfo.Values['DV.Valor']+'                               '+
      'FROM                                                                                           '+
      '   rem_dados remessa                                                                           '+
      '   INNER JOIN mensalidades ON (remessa.cd_mensalidade = mensalidades.cd_mensalidade)           '+
      '   INNER JOIN pessoas aluno ON (mensalidades.codigoaluno = aluno.cd_pessoa)                    '+
      '   INNER JOIN pessoas responsavel ON (aluno.cd_resp_finan = responsavel.cd_pessoa)             '+
      '   INNER JOIN rem_layouts layout ON (remessa.cd_layout = layout.cd_layout)                     '+
      '   LEFT OUTER JOIN fin_cadastro_contas financeiro ON (layout.cd_caixa = financeiro.cd_caixa AND layout.cd_coligada = financeiro.cd_coligada)   '+
      'WHERE                                                                                          '+
      '  layout.cd_layout = '+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + '                      '+
      '');
      if (ckbData.Checked) then begin
         SQL.Add('AND (DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + '" AND');
         SQL.Add('DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + '") ');
      end;

      if (cbSituacao.ItemIndex < 2) then begin
         SQL.Add('AND remessa.sn_enviado = ' + IntToStr(cbSituacao.ItemIndex));
      end;

      try
        Open();
        if not IsEmpty then begin
            iCount := 1;
            while not Eof do begin
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
               end;
               if (RemInfo.Values['Linha.Size'] <> '') then begin
                  sAux := StringReplace(sAux, '[linha_numero]', FormataSequencia(IntToStr(iLinhaCount), StrToInt(RemInfo.Values['Linha.Size']), RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
               end;

               For nContatos := 1 To iContatos do begin

                   qyAcao.Close();
                   qyAcao.SQL.Text :=
                    ' Select * from contatos_pessoas   ' +
                    ' WHERE cd_pessoa = :pessoa        ' +
                    '   AND cd_contato = :contato      ' +
                    ' ORDER by ds_contato DESC LIMIT 1 ';

                   qyAcao.ParamByName('contato').AsInteger := StrToInt(lstContatos[nContatos].Values['Contato']);

                   if lstContatos[nContatos].Values['Pessoa'] = 'responsavel' then
                     qyAcao.ParamByName('pessoa').AsInteger := FieldByName('codresp').AsInteger
                  else
                     qyAcao.ParamByName('pessoa').AsInteger := FieldByName('codaluno').AsInteger;

                  qyAcao.Open();

                  sAux := StringReplace(sAux, '[contato_' + IntToStr(nContatos) +  ']', FormataSequencia(qyAcao.FieldByName('ds_contato').AsString, StrToInt(lstContatos[nContatos].Values['Cont.Size']), lstContatos[nContatos].Values['Cont.Fill']), [rfReplaceAll]);
               end;

               while Pos('||', sAux) > 0  do begin
                  RemDados.Add( Copy(sAux, 1, Pos('||', sAux) - 1)) ;
                  sAux := Copy(sAux, Pos('||', sAux) +2, length(sAux) );
               end;

               RemDados.Add(sAux);
               // RemDados.Add(qyAux.SQL.Text);
               
               Inc(iCount);
               Next();
            end;
            Result := True;
        end
        else begin
         Mensagem('Nenhum registro de cabecalho!!');
         Result := False;
        end;
      except
         Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Detalhes)');
         Result := False;
      end;
      Close();
   end;

end;


function TfrmExportaContabil.GeraRodape(): Boolean;
var
   sSQL: string;
   sAux, sGlue: string;
   sFill, sSize, sValor: string;
begin
   //tras as especificacoes para montar a grade
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
      '	cd_layout = '+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + '   '+
      '	AND cd_tipo = 4                              '+
      'ORDER BY                                       '+
      '	nr_inicio                                    '+
      '');
      Open();

      if not IsEmpty then begin
         sGlue := '';
         sSQL := '';
         while not Eof do begin
            sValor := FieldByName('ds_valor').AsString;
            sSize := FieldByName('nr_tamanho').AsString;
            sFill := FieldByName('chr_fill').AsString;

            //parametro fixo
            if (sValor = '[arquivo_numero]') then begin
               sValor := '"' + IntToStr(getNumeroArquivoRemessa()+1) + '"';
            end;

            //preenchimento padrao
            if (sFill = '') then begin
               sFill := ' ';
            end;

            //valor padrao
            if (sValor = '') then begin
               sValor := '" "';
            end;

            if (sValor = '[linha_numero]') then begin
               RemInfo.Values['Linha.Size'] := sSize;
               RemInfo.Values['Linha.Fill'] := sFill;
               sAux := '"'+sValor+'"';
            end
            else begin
               //lado do preenchimento
               if (sFill = '0') then begin
                  sAux := 'LPAD';
               end
               else begin
                  sAux := 'RPAD';
               end;
               sAux := sAux + '(IFNULL('+ sValor +',""), '+ sSize +', "'+ sFill +'")';
            end;
            sSQL := sSQL + sGlue + sAux;
            sGlue := ', ';
               
            Next();
         end;
      end;

      if (sSQL = '') then begin
         sSQL := '""';
      end;
      
      //pega a linha resultado
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT              '+
      'CONCAT('+ sSQL + ') as rodape   '+
      'FROM                                                                                           '+
      '   rem_dados remessa                                                                           '+
      '   INNER JOIN mensalidades ON (remessa.cd_mensalidade = mensalidades.cd_mensalidade)           '+
      '   INNER JOIN pessoas aluno ON (mensalidades.codigoaluno = aluno.cd_pessoa)                    '+
      '   INNER JOIN pessoas responsavel ON (aluno.cd_resp_finan = responsavel.cd_pessoa)             '+
      '   INNER JOIN rem_layouts layout ON (remessa.cd_layout = layout.cd_layout)                     '+
      '   LEFT OUTER JOIN fin_cadastro_contas financeiro ON (layout.cd_caixa = financeiro.cd_caixa AND layout.cd_coligada = financeiro.cd_coligada)   '+
      'WHERE                                                   '+
      '  layout.cd_layout = '+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + ' ');

      if (ckbData.Checked) then begin
         SQL.Add('AND (DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") >= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + '" AND');
         SQL.Add('DATE_FORMAT(remessa.dt_acao, "%Y-%m-%d") <= "'+ FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + '") ');
      end;

      if (cbSituacao.ItemIndex < 2) then begin
         SQL.Add('AND remessa.sn_enviado = ' + IntToStr(cbSituacao.ItemIndex));
      end;

      SQL.Add('GROUP BY layout.cd_layout                                                ');


      try
        Open();
        if not IsEmpty then begin
            Inc(iLinhaCount);
            sAux := FieldByName('rodape').AsString;
            
            if (RemInfo.Values['Linha.Size'] <> '') then begin
               sAux := StringReplace(sAux, '[linha_numero]', FormataSequencia(IntToStr(iLinhaCount), StrToInt(RemInfo.Values['Linha.Size']), RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
            end;

            while Pos('||', sAux) > 0  do begin
                  RemDados.Add( Copy(sAux, 1, Pos('||', sAux) - 1) ) ;
                  sAux := Copy(sAux, Pos('||', sAux) +2, length(sAux) );
            end;

            RemDados.Add(sAux);
            Result := True;
        end
        else begin
         Mensagem('Nenhum registro de cabecalho!!');
         Result := False;
        end;
      except
         Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Rodape)');
         Result := False;
      end;
      Close();
   end;

end;

function TfrmExportaContabil.GeraCabecalho(): Boolean;
var
   sSQL: string;
   sAux, sGlue: string;
   sFill, sSize, sValor: string;
begin
   //tras as especificacoes para montar a grade
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
      '	cd_layout = +'+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + '    '+
      '	AND cd_tipo = 1                              '+
      'ORDER BY                                       '+
      '	nr_inicio                                    '+
      '');
      Open();

      if not IsEmpty then begin
         sGlue := '';
         sSQL := '';
         while not Eof do begin
            sValor := FieldByName('ds_valor').AsString;
            sSize := FieldByName('nr_tamanho').AsString;
            sFill := FieldByName('chr_fill').AsString;

            //parametro fixo
            if (sValor = '[arquivo_numero]') then begin
               sValor := '"' + IntToStr(getNumeroArquivoRemessa()+1) + '"';
            end;
            //preenchimento padrao
            if (sFill = '') then begin
               sFill := ' ';
            end;
            
            //valor padrao
            if (sValor = '') then begin
               sValor := '" "';
            end;
            if (sValor = '[linha_numero]') then begin
               RemInfo.Values['Linha.Size'] := sSize;
               RemInfo.Values['Linha.Fill'] := sFill;
               sAux := '"'+sValor+'"';
            end
            else begin
               //lado do preenchimento
               if (sFill = '0') then begin
                  sAux := 'LPAD';
               end
               else begin
                  sAux := 'RPAD';
               end;
               sAux := sAux + '(IFNULL('+ sValor +',""), '+ sSize +', "'+ sFill +'")';
            end;
            sSQL := sSQL + sGlue + sAux;
            sGlue := ', ';

            Next();
         end;
      end;

      if (sSQL = '') then begin
         sSQL := '""';
      end;

      //pega a linha resultado
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT              '+
      'CONCAT('+ sSQL + ') as cabecalho         '+
      'FROM                '+
      '   rem_layouts layout                                   '+
      '   LEFT OUTER JOIN fin_cadastro_contas financeiro ON    '+
      '   (layout.cd_caixa = financeiro.cd_caixa AND layout.cd_coligada = financeiro.cd_coligada)              '+
      'WHERE                                                   '+
      '  layout.cd_layout = '+ IntToStr(aLayouts[cbListaLayouts.ItemIndex]) + ' '+
      '');

      try
        Open();
        if not IsEmpty then begin
            Inc(iLinhaCount);
            sAux := FieldByName('cabecalho').AsString;

            if (RemInfo.Values['Linha.Size'] <> '') then begin
               sAux := StringReplace(sAux, '[linha_numero]', FormataSequencia(IntToStr(iLinhaCount), StrToInt(RemInfo.Values['Linha.Size']), RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
            end;

            while Pos('||', sAux) > 0  do begin
                  RemDados.Add( Copy(sAux, 1, Pos('||', sAux) - 1) ) ;
                  sAux := Copy(sAux, Pos('||', sAux) +2, length(sAux) );
            end;

            RemDados.Add(sAux);
            Result := True;
        end
        else begin
         Mensagem('Nenhum registro de cabecalho!!');
         Result := False;
        end;
      except
         Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Cabecalho)');
         Result := False;
      end;
      Close();
      
   end;

end;

function TfrmExportaContabil.getNumeroArquivoRemessa(): Integer;
begin
   Result := aNumRemessa[cbListaLayouts.ItemIndex];
end;

procedure TfrmExportaContabil.btFecharClick(Sender: TObject);
begin
   Close();
end;

function TfrmExportaContabil.FormataSequencia(sValor: string; iSize: Integer;
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

procedure TfrmExportaContabil.btExcluirClick(Sender: TObject);
var
   i: Integer;
begin
  if Mensagem('Tem certeza que deseja excluir o(s) item(s) selecionado(s) da Remessa?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION ) <> mrYes then Exit;

  for i := 0 to (dbgAprovacao.SelectedRows.Count -1) do begin
     if (qyRegistros.BookmarkValid(Pointer(dbgAprovacao.SelectedRows.Items[i]))) then begin
        qyRegistros.GotoBookmark(Pointer(dbgAprovacao.SelectedRows.Items[i]));
     end
     else begin
        Continue;
     end;
     qyAux.Close;
     qyAux.SQL.Clear;
     qyAux.SQL.Text := 'DELETE FROM rem_dados WHERE cd_remessa = ' + qyRegistros.FieldByName('cd_remessa').AsString + ' LIMIT 1';
     qyAux.ExecSQL;
  end;
  qyRegistros.MoveBy(-(dbgAprovacao.SelectedRows.Count -1));

  qyRegistros.Close();
  qyRegistros.Open();
end;

procedure TfrmExportaContabil.btIncluirClick(Sender: TObject);
begin
   if (cbListaLayouts.ItemIndex = -1) then begin
      Mensagem('Você precisa selecionar um layout para incluir!');
      Exit;
   end;

   if not PrincipalForm.ProcuraForm( TForm(fGerarRemessa) ) then begin
      Application.CreateForm( TfGerarRemessa, fGerarRemessa )
   end;

   fGerarRemessa.iCodLayout := aLayouts[cbListaLayouts.ItemIndex];
   fGerarRemessa.ShowModal;

   FiltraDados;

end;

procedure TfrmExportaContabil.dbgAprovacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      btExcluirClick(nil);
   end;
end;

procedure TfrmExportaContabil.dbgAprovacaoTitleClick(Column: TColumn);
begin
   if (AListaOrdem.IndexOf(Column.FieldName) = -1) then begin
      AListaOrdem.Add(Column.FieldName + '=ASC');
      Column.Title.Color := clBlue;
   end
   else begin
      if (AListaOrdem.Values[Column.FieldName] = 'ASC') then begin
         AListaOrdem.Values[Column.FieldName] := 'DESC';
         Column.Title.Color := clGreen;
      end
      else if (AListaOrdem.Values[Column.FieldName] = 'DESC') then begin
         AListaOrdem.Values[Column.FieldName] := '';
         Column.Title.Color := clBlack;
      end
      else begin
         AListaOrdem.Values[Column.FieldName] := 'ASC';
         Column.Title.Color := clBlue;
      end;
   end;
   FiltraDados();
end;

procedure TfrmExportaContabil.AlteraSituacao(iCodAcao: Integer);
var
   iCodRemessa: Integer;
begin
   if ((qyRegistros.Active) and (not qyRegistros.IsEmpty)) then begin
      if not ((iCodAcao >= 0) or (iCodAcao <= 9)) then begin
         Exit;
      end;
      with qyAux do begin
         Close();
         SQL.Clear();
         Params.Clear();
         SQL.Add('SELECT cd_ocorrencia FROM rem_ocorrencias WHERE cd_layout = '+IntToStr(aLayouts[cbListaLayouts.ItemIndex])+' AND cd_acao='+IntToStr(iCodAcao)+' LIMIT 1');
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

procedure TfrmExportaContabil.Baixar1Click(Sender: TObject);
begin
   AlteraSituacao(0);
end;

procedure TfrmExportaContabil.Cancelamento1Click(Sender: TObject);
begin
   AlteraSituacao(1);
end;

procedure TfrmExportaContabil.Desconto1Click(Sender: TObject);
begin
   AlteraSituacao(2);
end;

procedure TfrmExportaContabil.Protesto1Click(Sender: TObject);
begin
   AlteraSituacao(3);
end;

procedure TfrmExportaContabil.Estorno1Click(Sender: TObject);
begin
   AlteraSituacao(4);
end;

procedure TfrmExportaContabil.Alterao1Click(Sender: TObject);
begin
   AlteraSituacao(5);
end;

procedure TfrmExportaContabil.Negociao1Click(Sender: TObject);
begin
   AlteraSituacao(6);
end;

procedure TfrmExportaContabil.Prorrogao1Click(Sender: TObject);
begin
   AlteraSituacao(7);
end;

procedure TfrmExportaContabil.Impresso1Click(Sender: TObject);
begin
   AlteraSituacao(8);
end;

procedure TfrmExportaContabil.Insero1Click(Sender: TObject);
begin
   AlteraSituacao(9);
end;

procedure TfrmExportaContabil.qyRegistrosBeforeClose(DataSet: TDataSet);
begin
   if not (qyRegistros.IsEmpty) then begin
      bk := qyRegistros.GetBookmark();
   end
   else begin
      bk := nil;
   end;
end;

procedure TfrmExportaContabil.qyRegistrosAfterOpen(DataSet: TDataSet);
begin
   if (bk <> nil) AND (not qyRegistros.Eof)then begin
      qyRegistros.GotoBookmark(bk);
   end;
end;



end.

