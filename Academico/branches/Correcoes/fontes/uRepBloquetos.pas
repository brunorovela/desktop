unit uRepBloquetos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, Mask, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, uLoginManager, ZSqlUpdate, uRemessaClass;

type
  TPreparaBoleto = (pbImpressaoPadrao, pbImpressaoAluno, pbImpressaoEmpresa);

  TBoleto = class(TObject)
  private
    cdBoleto: integer;
    cdResponsavel: integer;
    cdPessoa: integer;
    cdConta: integer;
    cdLayout: integer;
    cdColigada: integer;
    nrNossoNumero: string;
    dtVencimento: TDateTime;
    vlNominal: Currency;
    vlDesconto: Currency;
  end;

  TLogImpressaoNN = class(TObject)
  private
    dsChave: string;
    nrNossoNumero: string;
    cdColigada: integer;
  end;

  TfrmRepBloquetos = class(TForm)
    tblBloquetos: TUMZQuery;
    qryUpdate: TUMZQuery;
    tblInserir: TUMZQuery;
    tblAux: TUMZQuery;
    tblEmpresas: TUMZQuery;
    tblBloquetosAgrupados: TUMZQuery;
    tblAux2: TUMZQuery;
    updMensalidade: TZUpdateSQL;
    updMensalidadeBoleto: TZUpdateSQL;
    procedure InserirBoletosIndividuais;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    function getNrDiaVencimentoPessoa(cdPessoa: integer): integer;
    function verificaIgnoraDDA(cdConta: integer): boolean;
    function verificaContaImpressao(strContaImpressao: string; perguntar: boolean; var cdConta: integer): boolean;
    function inserirBoleto(mensalidadesAgrupadas: TStringList; dtVencimentoBoleto: TDateTime = 0; preparaBoletoImpressao: TPreparaBoleto = pbImpressaoPadrao): TBoleto;
    function prepararRemessa(mensalidadesAgrupadas, mensalidadesAlterouConta: TStringList; boleto: TBoleto): string;
    procedure realizaCancelamentoDDA(cdMensalidade, nrParcela: integer; nmPessoa: string);
    procedure baixaNNAnterioresGeraNN(nossoNumeroAnterior, dsSituacao: string; var nossoNumeroValido: string; boleto: TBoleto);
    procedure atualizaMensalidade(mensalidadesAgrupadas: TStringList; nossoNumero: string; boleto: TBoleto);
    procedure atualizaBoleto(boleto: TBoleto; nossoNumero: string);
    procedure gravarLogsImpressao(logsImpressaoNN: TStringList; nossoNumeroNovo: string);
    procedure atualizarDataVencimento(cdAluno, cdResp, nrDiaVencimento: integer; dtVencimento: TDateTime; sFiltro: string; preparaBoletoImpressao: TPreparaBoleto);

  public
    { Public declarations }
    DDASimParaTodos, DDANaoParaTodos, mensagemExibidaDDA, flgBonus : Boolean;
    Impressos: Integer;

    Function PrepararBloquetosParaImpressao(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true; DataBoleto : TDateTime = 0; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = ''; preparaBoletoImpressao: TPreparaBoleto = pbImpressaoPadrao) : Boolean;
    Function PrepararBloquetosParaEmpresa(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = '' ) : Boolean;
    Function PrepararBloquetosParaAluno(sFiltro : String; Agrupado : Boolean; ContaImpressao : String;  ds_filtro_boletos : String = ''; cd_tipo_titulo: String = '' ) : Boolean;

    Function PrepararBloquetosRemessaNova(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true; DataBoleto : TDateTime = 0; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = ''; preparaBoletoImpressao: TPreparaBoleto = pbImpressaoPadrao) : Boolean;
    Function PrepararBloquetosRemessaAntiga(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true; DataBoleto : TDateTime = 0; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = '') : Boolean;

  end;

var
  frmRepBloquetos: TfrmRepBloquetos;
  objRemessa: TRemessa;

implementation

uses Main, uDM, Math, uImpBoletos;

{$R *.DFM}

procedure TfrmRepBloquetos.InserirBoletosIndividuais;
var resp : Integer;
begin

  Impressos := 0;
  resp := -1;

  Application.ProcessMessages;

  { Popular a tabela Bloquetos }


  tblBloquetos.First;

  while not tblBloquetos.Eof do
  Begin
     { Verificar se o bloqueto ja existe na tabela - Ja foi Impresso }
     tblAux.Close;
     tblAux.SQL.Text := 'Select * from bloquetos where cd_mensalidade = :cd_mensalidade ';
     tblAux.ParamByName('cd_mensalidade').AsInteger       := tblBloquetos.FieldByName('cd_mensalidade').AsInteger;
     tblAux.Open; 

     if not tblAux.Eof then
     Begin
        { Bloqueto ja foi impresso - apagar o anterior }
        tblAux.Close;
        tblAux.SQL.Text := 'delete from bloquetos where cd_mensalidade = :cd_mensalidade ';
        tblAux.ParamByName('cd_mensalidade').AsInteger      := tblBloquetos.FieldByName('cd_mensalidade').AsInteger;
        tblAux.ExecSQL;
     End;

     {Verificar se o Bloqueto ja foi impresso = Campo bloqueto='S"}


     if (DM.isTrue(tblBloquetos.FieldByName('Bloqueto').AsString)) and (resp <> mrAll) then
         resp := Messagedlg('O bloqueto ' + tblBloquetos.FieldByName('CodigoAluno').AsString + '/' + tblBloquetos.FieldByName('Parcela').AsString + ' ja foi impresso. Reimprimir?', mtConfirmation, [mbYes, mbAll, mbNo], 0);

     if resp <> mrNo then
     Begin

     { Inserir o bloqueto na tabela }
     tblInserir.ParamByName('cd_aluno').AsInteger            := tblBloquetos.FieldByName('CodigoAluno').AsInteger;
     tblInserir.ParamByName('nr_parcela').AsInteger          := tblBloquetos.FieldByName('parcela').AsInteger;
     tblInserir.ParamByName('dt_vencimento').AsString        := FormatDateTime('yyyy-mm-dd', tblBloquetos.FieldByName('datavencimento').AsDateTime);
     tblInserir.ParamByName('cd_turma').AsString             := tblBloquetos.FieldByName('Turma').AsString;
     tblInserir.ParamByName('ds_agencia_cedente').AsString   := tblBloquetos.FieldByName('AgenciaCodCedente').AsString;
     tblInserir.ParamByName('ds_cod_numerico').AsString      := '';
     tblInserir.ParamByName('ds_cod_barra').AsString         := '';
     tblInserir.ParamByName('ds_banco').AsString             := tblBloquetos.FieldByName('BancoCalc').AsString;

     { Verificar se o Bloqueto é em nome da Empresa }

     if  Dm.IsTrue(tblBloquetos.FieldByName('sn_bloqueto_empresa').AsString) then
     Begin
        tblEmpresas.Close;
        tblEmpresas.ParamByName('empresa').AsInteger := tblBloquetos.FieldByName('cd_empresa').AsInteger;
        tblEmpresas.Open;

        if not tblEmpresas.Eof Then
        Begin
           tblInserir.ParamByName('sn_bloqueto_empresa').AsString := 'S';
           tblInserir.ParamByName('nm_empresa').AsString          := tblEmpresas.FieldByName('nm_razao_social').AsString;
           tblInserir.ParamByName('ds_cnpj').AsString             := tblEmpresas.FieldByName('ds_cnpj').AsString;
        End
        Else
        Begin
           tblInserir.ParamByName('sn_bloqueto_empresa').AsString := 'N';
           tblInserir.ParamByName('nm_empresa').AsString          := '';
           tblInserir.ParamByName('ds_cnpj').AsString             := '';
        End;
     end
     else
     Begin
           tblInserir.ParamByName('sn_bloqueto_empresa').AsString := 'N';
           tblInserir.ParamByName('nm_empresa').AsString          := '';
           tblInserir.ParamByName('ds_cnpj').AsString             := '';
     End;
     
     tblInserir.ParamByName('cd_mensalidade').AsInteger := tblBloquetos.FieldByName('cd_mensalidade').AsInteger;

     tblInserir.ExecSQL;
     INC(impressos);

     End;

     tblBloquetos.Next;

  End;
end;

procedure TfrmRepBloquetos.FormCreate(Sender: TObject);
begin

  flgBonus := True;

end;

function TfrmRepBloquetos.PrepararBloquetosParaAluno(sFiltro: String;
  Agrupado: Boolean; ContaImpressao: String; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = ''): Boolean;
const
   SSQLSelectMensalidades = ''
      + ' SELECT '
      + ' 	CD_RESP, '
      + ' 	MIN(m.cd_mensalidade) cd_mensalidade, '
      + '   GROUP_CONCAT(DISTINCT m.cd_boleto) boletos, '
      + ' 	GROUP_CONCAT(DISTINCT m.cd_mensalidade) mensalidades, '
      + ' 	CODIGOALUNO, '
      + ' 	DATAVENCIMENTO, '
      + ' 	MAX( '
      + ' 		CASE '
      + ' 			WHEN m.cd_caixa = :cd_caixa AND COALESCE(m.nossonumero, '''') != '''' THEN m.nossonumero '
      + ' 			ELSE NULL '
      + ' 		END '
      + ' 	) nn_usar, '
      + ' 	MIN(COALESCE(NOSSONUMERO, "")) NN_INICIO, '
      + ' 	MAX(COALESCE(NOSSONUMERO, "")) NN_FIM, '
      + ' 	ROUND( '
      + ' 		SUM( '
      + ' 			COALESCE(VALORBRUTO, 0) +  '
      + ' 			COALESCE(VALOREXTRA, 0) +  '
      + ' 			COALESCE(VALORJUROS, 0) -  '
      + ' 			COALESCE(DESCONTOEXTRA, 0) - '
      + ' 			CASE '
      + ' 				WHEN COALESCE(SN_LIBERAR_DESCONTOS, 0) = 1 THEN COALESCE(VALORDESCONTO, 0) '
      + ' 				ELSE 0 '
      + ' 			END '
      + ' 		), '
      + ' 		2 '
      + ' 	) VL_BOLETO, '
      + ' 	ROUND( '
      + ' 		SUM( '
      + ' 			CASE '
      + ' 				WHEN COALESCE(SN_LIBERAR_DESCONTOS, 0) = 0 THEN COALESCE(VALORDESCONTO, 0) '
      + ' 				ELSE 0 '
      + ' 			END '
      + ' 		), '
      + ' 		2 '
      + ' 	) VL_DESCONTO, '
      + ' 	P.NR_DIA_VENCIMENTO, '
      + '   COALESCE(tt.ds_grupo_boleto, "A") ds_grupo_boleto '
      + ' FROM '
      + ' 	MENSALIDADES M '
      + ' 	INNER	JOIN PESSOAS P ON (M.CODIGOALUNO = P.CD_PESSOA) '
      + ' 	INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) '
      + ' WHERE '
      + ' 	%s%s '
      + ' 	AND SITUACAO IN (2, 10) AND '
      + ' 	M.CD_CAIXA = :cd_caixa '
      + ' GROUP BY '
      + ' 	M.CODIGOALUNO, '
      + ' 	DATAVENCIMENTO, '
      + '   COALESCE(tt.ds_grupo_boleto, "A") '
      + ' ORDER BY  '
      + ' 	M.CODIGOALUNO, '
      + ' 	DATAVENCIMENTO, '
      + '   COALESCE(tt.ds_grupo_boleto, "A") ';
Var
   iBoleto : Integer;
   sNossoNumero, S : String;
   sNossoNumeroAntivo : String;

   chaves : string;
   iConta : Integer;
   iColigada : Integer;
   sFiltroData : String;

   cd_tipo_titulo_filtro_sql, ds_filtro_sql_bloquetos : String;

   qBoleto : TUMZQuery;
   qyBlImp : TUMZQuery;
   qyBlImpAgrup: TUMZQuery;
   qyBlImpAcao: TUMZQuery;

   iPessoa : Integer;
   iDiaVencimento : Integer;
   dia, mes, ano : word;
   novoVenc :TDateTime;

   resp : Integer;
   sMsg : String;
   AlterarConta: Boolean;
   sNossoNumeroAntigo: String;
   sNossoNumeroNovo: String;

   log : String;
   qryNN : TUMZQuery;

   RemessaAlteracao : boolean;
   DDAYesToAll, DDANoToAll, bCancelarDDA: Boolean;
   qryDDA: TUMZQuery;
   iCancelamento, msgDDA: Integer;
begin

   dm.CriarConsulta(qryDDA);

   // A conta impressão é fundamental para agrupar boletos por empresa.
   if ContaImpressao = '' then exit;

   iConta := StrToInt(Copy(ContaImpressao, 1, Pos('=',ContaImpressao)-1));
   iColigada := StrToint(Copy(ContaImpressao, Pos('=',ContaImpressao)+1, length(ContaImpressao)));

   // Verificar se o boleto está bloqueado
   DM.CriarConsulta(qBoleto);

   qBoleto.UpdateMode := umUpdateChanged;
   // qBoleto.RequestLive := false;

   qBoleto.SQL.Text := ' SELECT sn_bloquear_boleto, dt_bloqueio_boleto FROM coligadas_matriz ' +
                         ' WHERE cd_coligada = ' + IntToStr(TLoginManager.GetInstancia.GetDM.GetUsuarioLogado.GetColigadaLogada.Codigo);

   qBoleto.Open();

   sFiltroData := ' AND 1=1 ';

   if qBoleto.FieldByName('sn_bloquear_boleto').AsInteger = 1 then begin
      sFiltroData := ' AND datavencimento <= "' + FormatDateTime('yyyy-mm-dd', qBoleto.FieldByName('dt_bloqueio_boleto').AsDateTime) + '" ';
   end;
   DM.CriarConsulta(qyBlImp);
   DM.CriarConsulta(qyBlImpAgrup);
   DM.CriarConsulta(qyBlImpAcao);

   // Selecionar os grupos de boletos que deverão ser impressos
   qyBlImp.Close();

   qyBlImp.SQL.Text :=
     ' SELECT GROUP_CONCAT(m.cd_mensalidade) mensalidades '+
     ' FROM mensalidades m ' +
     '  INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) ' +
     '  INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
     '  LEFT JOIN fin_cadastro_contas c ON (c.cd_caixa = m.cd_caixa) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     ' GROUP BY codigoaluno, datavencimento, COALESCE(tt.ds_grupo_boleto, "A") '+
     ' ORDER BY codigoaluno, datavencimento, COALESCE(tt.ds_grupo_boleto, "A") ';
   qyBlImp.Open();

// Verifica a conta da impressão
   while not qyBlImp.Eof do
   begin

      // Selecionar os grupos de boletos que deverão ser impressos
      qyBlImpAgrup.Close();

      qyBlImpAgrup.SQL.Text :=
        ' SELECT m.cd_mensalidade, m.cd_resp, m.datavencimento, m.nossonumero, ' +
        '   p.nr_dia_vencimento, m.cd_caixa, p.nm_pessoa nome, m.parcela, ' +
        '   tt.ds_tipo_titulo, c.ds_caixa, m.codigoaluno, m.anosemestre, m.turma, m.cd_coligada, m.dataemissao ' +
        ' FROM ' +
        '  mensalidades m ' +
        '  INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) ' +
        '  INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
        '  LEFT JOIN fin_cadastro_contas c ON (c.cd_caixa = m.cd_caixa) ' +
        ' WHERE m.cd_mensalidade IN ('+qyBlImp.FieldByName('mensalidades').AsString+') ' +
        ' ORDER BY m.codigoaluno, m.datavencimento, COALESCE(tt.ds_grupo_boleto, "A") ';
      qyBlImpAgrup.Open();

      sNossoNumeroNovo := '';

      while not qyBlImpAgrup.Eof do
      begin

        // Verificar se este boleto já foi impresso em outra conta
        if  (qyBlImpAgrup.FieldByName('cd_caixa').AsInteger <> iConta ) // Se o caixa que tem na mensalidade for diferente do caixa da impressao
            AND (qyBlImpAgrup.FieldByName('nossonumero').AsString <> '') // se o nosso número já está gerado
            AND (qyBlImpAgrup.FieldByName('cd_caixa').AsInteger > 0) // Se o caixa da mensalidade não estiver vazio
            AND (resp <> mrYesToAll)
            AND (resp <> mrNoToAll) then
        begin

            // ENTAO, pedir autorização para TROCAR
            sMsg := 'Você está alterando a conta de impressão do boleto de: ' + CHR(13) + CHR(13);
            sMsg := sMsg + '      ' + qyBlImpAgrup.FieldByName('nome').AsString + CHR(13);
            sMsg := sMsg + '      ' + 'Parcela: ' + qyBlImpAgrup.FieldByName('parcela').AsString + ' - ' + qyBlImpAgrup.FieldByName('ds_tipo_titulo').AsString + CHR(13);
            sMsg := sMsg + '      ' + 'Vencimento: ' + FormatDateTime('dd/mm/yyyy', qyBlImpAgrup.FieldByName('datavencimento').AsDateTime) + CHR(13);
            sMsg := sMsg + '      ' + 'Nosso Número: ' + qyBlImpAgrup.FieldByName('nossonumero').AsString + CHR(13) + CHR(13);
            sMsg := sMsg + 'que já havia sido impresso na conta ' + qyBlImpAgrup.FieldByName('ds_caixa').AsString + '.' + CHR(13) + 'Tem certeza que deseja alterar a conta?';

            resp := MensagemCustomizavel(sMsg, mtConfirmation, [mbYes, mbYesToAll, mbNo, mbNoToAll], ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'], 97 );

        end else if (qyBlImpAgrup.FieldByName('nossonumero').AsString = '') then
        begin
            // se o NN está VAZIO, ou nunca foi impresso, ou cd_caixa = 0
            //, então tem que setar o cd_caixa para poder imprimir a primeira vez nessa conta.
            AlterarConta := true;
        end;

        if ((resp <> 2) AND (resp <> mrNo) AND (resp <> mrNoToAll)) OR AlterarConta then
        begin

            sNossoNumeroAntigo := qyBlImpAgrup.FieldByName('nossonumero').AsString;

            if sNossoNumeroNovo = '' then
            begin
              sNossoNumeroNovo := DM.NovoNumero(0, '', 0, 0, iConta, qyBlImpAgrup.FieldByName('cd_coligada').AsInteger,qyBlImpAgrup.FieldByName('codigoaluno').AsInteger, Copy( qyBlImpAgrup.FieldByName('datavencimento').AsString, 9, 2 ), Copy( qyBlImpAgrup.FieldByName('dataemissao').AsString, 9, 2 ) );
            end;

            // Efetuar alteração individual de cada mensalidade, mesmo em caso de agrupamento
            // Guardar o Log de Alteração de Nosso números individuais

            chaves := FillString(qyBlImpAgrup.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                   qyBlImpAgrup.FieldByName('anosemestre').AsString + ';' + qyBlImpAgrup.FieldByName('turma').AsString + ';' +
                   qyBlImpAgrup.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qyBlImpAgrup.FieldByName('datavencimento').AsDateTime) + ';';

            qyBlImpAcao.SQL.Text :=
              ' UPDATE mensalidades SET cd_caixa = :cd_caixa, nossonumero = :nossonumero ' +
              '  WHERE cd_mensalidade = :cd_mensalidade ';

            qyBlImpAcao.ParamByName('cd_caixa').AsInteger := iConta;
            qyBlImpAcao.ParamByName('nossonumero').AsString := sNossoNumeroNovo;
            qyBlImpAcao.ParamByName('cd_mensalidade').AsInteger := qyBlImpAgrup.FieldByName('cd_mensalidade').AsInteger;

            qyBlImpAcao.ExecSQL();

            if sNossoNumeroAntigo = '' then begin
               DM.setLog(2013, 'alteracao', chaves, qyBlImpAgrup.FieldByName('cd_coligada').AsInteger, 'Impressão primeiro Boleto (NN = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '")' );
            end else begin
               DM.setLog(2013, 'alteracao', chaves, qyBlImpAgrup.FieldByName('cd_coligada').AsInteger, 'Alteração de Boletos (NN Atual = "'+ sNossoNumeroAntigo +'" NN Novo = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '" )');
            end;
        end;

        AlterarConta := false;

        qyBlImpAgrup.Next();
      end;

      qyBlImp.Next();
   end;

   FreeAndNil(qyBlImpAgrup);
   FreeAndNil(qyBlImpAcao);

   // Selecionar os grupos de boletos que deverão ser impressos

   qyBlImp.Close();
   S := Format(SSQLSelectMensalidades, [sFiltro, sFiltroData]);
   qyBlImp.SQL.Text := S;
   qyBlImp.ParamByName('cd_caixa').AsInteger := iConta;
   qyBlImp.Open();

   if qyBlImp.EOF then begin

      Mensagem('Não foi possível selecionar os dados para impressão dos boletos. Alguma informação está pendente.', 'Atenção', MB_OK + MB_ICONWARNING);
      result := false;

      FreeAndNil(qyBlImp);
      FreeAndNil(qBoleto);

      Exit;

   end;

   // Informar que está gerando boleto para empresa.
   // Perguntar se deseja agrupar as mensalidades com vencimento no mês mes em um unico boleto.
   iPessoa := -1;


   IF Mensagem('Atenção' + CHR(13) + CHR(13) +
     ' Você está imprimindo boletos agrupados por aluno.' + CHR(13) +
     ' Os boletos serão agrupados para cada aluno pela data de vencimento.' + CHR(13) + CHR(13) +
     ' Deseja padronizar o dia de vencimento dos títulos de mesmo mês? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION)
   = mrYes THEN begin
         while not qyBlImp.Eof do begin

            dia := 0;

            if (qyBlImp.FieldByName('cd_resp').AsInteger <> iPessoa) then begin

               iPessoa := qyBlImp.FieldByName('cd_resp').AsInteger;

               iDiaVencimento := qyBlImp.FieldByName('nr_dia_vencimento').AsInteger;

               if iDiaVencimento = 0 then begin
                  DecodeDate( qyBlImp.FieldByName('datavencimento').AsDateTime, ano, mes, dia );

                  iDiaVencimento := dia;

               end;
            end;

            if Dia = 0 then begin // Precisa atualizar

               qBoleto.Close();
               // qBoleto.RequestLive := true;
               qBoleto.SQL.Text :=
                ' SELECT m.cd_mensalidade, m.datavencimento, m.parcela, p.nm_pessoa '+
                ' FROM '+
                '   mensalidades m '+
                '   INNER JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
                '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
                ' WHERE ' + sFiltro +
                '   AND m.codigoaluno = ' + qyBlImp.FieldByName('codigoaluno').AsString +
                '   AND m.datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
                '   AND COALESCE(tt.ds_grupo_boleto, "A") LIKE "'+ qyBlImp.FieldByName('ds_grupo_boleto').AsString + '"' +
                '   AND (situacao = 2 OR situacao = 10) ';

               qBoleto.UpdateObject := updMensalidade;
               qBoleto.Open();

               while not qBoleto.EOF do begin


                  DM.CriarConsulta(qryDDA);
                  qryDDA.Close;
                  qryDDA.SQL.Text := ''+
                  '  SELECT                         '+
                  '   	rl.cd_origem,ro.cd_acao    '+
                  '  FROM                           '+
                  '  	rem_dados rd                  '+
                  '	  INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)              '+
                  '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)  '+
                  '  WHERE                                                                    '+
                  '	  rd.cd_mensalidade = :cd_mensalidade';

                  qryDDA.ParamByName('cd_mensalidade').AsInteger := qBoleto.FieldByName('cd_mensalidade').AsInteger;
                  qryDDA.Open;

                  bCancelarDDA := false;
                  iCancelamento := 0;
                  while not qryDDA.Eof do
                  begin

                     if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
                     begin
                        bCancelarDDA := true;
                     end;

                     if qryDDA.FieldByName('cd_acao').AsInteger = 101 then
                     begin
                        iCancelamento := iCancelamento +1;
                     end;

                     qryDDA.Next;
                  end;

                  if iCancelamento > 0 then
                  begin
                     bCancelarDDA := false;
                  end;

                  if ( bCancelarDDA = true ) then
                  begin

                     if ((DDAYesToAll = False) and (DDANoToAll = False)) then
                     begin

                        msgDDA :=
                           MensagemCustomizavel(
                              'Deseja cancelar o Débito Automático para a pessoa '
                                 + qBoleto.FieldByName('nm_pessoa').AsString
                                 + ' na parcela de número '
                                 + qBoleto.FieldByName('parcela').AsString +'?',
                              mtConfirmation,
                              [mbYes, mbYesToAll, mbNo, mbNoToAll],
                              ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'],
                              97
                           );

                        if (msgDDA = mrYesToAll) then
                        begin
                           DDAYesToAll := True;
                        end;
                                                                            
                        if (msgDDA = mrNoToAll) then
                        begin
                           DDANoToAll := True;
                        end;

                     end;

                     if ((not(DDANoToAll)) and ((DDAYesToAll) or (msgDDA = mrYes))) then
                     begin
                        DM.FazAcaoRemessa(arCancelamentoDDA, qBoleto.FieldByName('cd_mensalidade').AsInteger);
                        Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do Débito Automático ocorra.', Application.Title, MB_OK, Handle);
                     end;
                  end;

                   DecodeDate(qboleto.FieldByName('datavencimento').AsDateTime, ano, mes, dia);

                   novoVenc := DataValida(ano, mes, iDiaVencimento);

                   if qboleto.FieldByName('datavencimento').AsDateTime <> novoVenc then begin

                      log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',qboleto.FieldByName('datavencimento').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',novoVenc)+'].'+chr(13);
                      DM.gerar_log( 10, log, DM.UsuarioLogado.Pessoa.Codigo, qBoleto.FieldByName('cd_mensalidade').AsString );

                      qBoleto.Edit;
                      qBoleto.FieldByName('datavencimento').AsDateTime := novoVenc;
                      qBoleto.Post;

                   end;

                   qBoleto.Next();
               end;

            end;
            qyBlImp.Next();
         end;
   end;

// Atualizar a consulta com os novos vencimentos

   S := Format(SSQLSelectMensalidades, [sFiltro, sFiltroData]);
   qyBlImp.Close;
   qyBlImp.SQL.Text := S;
   qyBlImp.ParamByName('cd_caixa').AsInteger := iConta;
   qyBlImp.Open;

   while not qyBlImp.Eof do begin

      // Verificar se já existe um fin_boleto com as mesmas configurações

      qBoleto.Close();
      // qBoleto.RequestLive := false;
      
      qBoleto.SQL.Text :=
       ' SELECT * from fin_boleto  '  +
       '  WHERE cd_pessoa = ' + qyBlImp.FieldByName('codigoaluno').AsString +
       '    AND dt_vencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
       '  ORDER BY cd_boleto DESC limit 1 ';
      qBoleto.Open();

      // Verificar se é um boleto já impresso.
      // Qualquer alteração deverá trocar os NN e reimprimir

      RemessaAlteracao := False;
      
      if (qBoleto.Eof)
         OR (qBoleto.FieldByName('nr_nossonumero').AsString <> qyBlImp.FieldByName('nn_inicio').AsString)
         OR (qBoleto.FieldByName('nr_nossonumero').AsString <> qyBlImp.FieldByName('nn_fim').AsString)
         OR (qBoleto.FieldByName('vl_boleto').AsCurrency <> qyBlImp.FieldByName('vl_boleto').AsCurrency)
         OR (qBoleto.FieldByName('vl_desconto').AsCurrency <> qyBlImp.FieldByName('vl_desconto').AsCurrency)
         OR (qBoleto.FieldByName('cd_conta').AsInteger <> iConta)
      then begin
         // Inserir um novo fin_boleto
         // Atualizar as mensalidades (nossonumero e fin_boleto

         tblAux.Close();
         tblAux.SQL.Text :=
            ' INSERT INTO fin_boleto (cd_resp_finan, cd_pessoa, nr_nossonumero, ' +
            '    dt_impressao, dt_vencimento, vl_boleto, vl_desconto, cd_conta, cd_coligada) ' +
            ' VALUES (:cd_resp_finan, :cd_pessoa, :nr_nossonumero, :dt_impressao, :dt_vencimento, :vl_boleto, :vl_desconto, :cd_conta, :cd_coligada) ';

         tblAux.ParamByName('dt_impressao').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
         tblAux.ParamByName('vl_boleto').AsCurrency := qyBlImp.FieldByName('vl_boleto').AsCurrency;
         tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime);

         if (qyBlImp.FieldByName('nn_usar').AsString <> '') and (qyBlImp.FieldByNAme('boletos').AsString <> '') then begin
            // verificar se o mesmo boleto não está sendo utilizado em outros alunos/mensalidades

            Dm.CriarConsulta(qryNN);
            qryNN.Close();
            qryNN.SQL.Text := 'SELECT count(*) as resultado FROM mensalidades WHERE cd_boleto is not null AND cd_boleto > 0 and cd_boleto in (' + qyBlImp.FieldByNAme('boletos').AsString + ') '+
                              ' AND cd_mensalidade NOT IN ( '+ qyBlImp.FieldByName('mensalidades').Asstring + ' ); ';
            qryNN.OPen();

            if qryNN.FieldByName('resultado').AsInteger > 0 then begin
              sNossonumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, qyBlImp.FieldByName('cd_resp').AsInteger, Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ));

              qryNN.Close();
              qryNN.SQL.Text :=
                  'DELETE FROM REM_DADOS ' +
                  'USING ' +
                     'REM_DADOS ' +
                     'JOIN REM_OCORRENCIAS ' +
                        'JOIN REM_LAYOUTS ON ' +
                           '(REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA) ' +
                  'WHERE ' +
                     'REM_DADOS.CD_MENSALIDADE IN ( '+ qyBlImp.FieldByName('mensalidades').Asstring + ' ); ';
              qryNN.ExecSQL();
            end else begin
              sNossonumero := qyBlImp.FieldByName('nn_usar').AsString;

              // Verifiacar quais alterações e disparar remessa de alteração:

              if  (qBoleto.FieldByName('vl_boleto').AsCurrency >0 ) AND
                  ((qBoleto.FieldByName('vl_boleto').AsCurrency <> qyBlImp.FieldByName('vl_boleto').AsCurrency) OR (qBoleto.FieldByName('vl_desconto').AsCurrency <> qyBlImp.FieldByName('vl_desconto').AsCurrency))
              then begin
                 // Está sendo impresso um boleto com valor diferente
                 // Registrar ação de alteração para todas as parcelas envolvidas
                 RemessaAlteracao := True;
              end;

            end;

            FreeAndNil(qryNN);

         end else begin
            sNossonumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, qyBlImp.FieldByName('cd_resp').AsInteger, Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ));
         end;

         tblAux.ParamByName('cd_resp_finan').AsInteger := qyBlImp.FieldByName('cd_resp').AsInteger;
         tblAux.ParamByName('cd_pessoa').AsInteger := qyBlImp.FieldByName('codigoaluno').AsInteger;
         tblAux.ParamByName('nr_nossonumero').AsString := sNossoNumero;

         tblAux.ParamByName('vl_desconto').AsCurrency := qyBlImp.FieldByName('vl_desconto').AsCurrency;
         tblAux.ParamByName('cd_conta').AsInteger := iConta;
         tblAux.ParamByName('cd_coligada').AsInteger := iColigada;
         tblAux.ExecSQL();

         iBoleto := DM.LastInsert();

         // Atualizar as mensalidades

         qBoleto.Close();
         // qBoleto.RequestLive := true;
         qBoleto.SQL.Text :=
          ' SELECT m.* FROM '+
          '   mensalidades m ' +
          '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) '+
          ' WHERE ' + sFiltro + sFiltroData +
          '   AND codigoaluno = ' + qyBlImp.FieldByName('codigoaluno').AsString +
          '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
          '   AND COALESCE(tt.ds_grupo_boleto, "A") LIKE "'+ qyBlImp.FieldByName('ds_grupo_boleto').AsString + '"' +
          '   AND (situacao = 2 OR situacao = 10) ';
         qBoleto.UpdateObject := updMensalidadeBoleto;
         qBoleto.Open();


         while not qBoleto.Eof do begin

            sNossoNumeroAntivo := qBoleto.FieldByName('nossonumero').AsString;
            
            qBoleto.Edit;
            qBoleto.FieldByName('cd_caixa').AsInteger := iConta;
            qBoleto.FieldByName('nossonumero').AsString := sNossoNumero;
            qBoleto.FieldByName('cd_boleto').AsInteger := iBoleto;
            qBoleto.Post();

            chaves := FillString(qBoleto.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                   qBoleto.FieldByName('anosemestre').AsString + ';' + qBoleto.FieldByName('turma').AsString + ';' +
                   qBoleto.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qBoleto.FieldByName('datavencimento').AsDateTime) + ';';

            if sNossoNumeroAntivo = '' then begin
               DM.setLog(2013, 'alteracao', chaves, qBoleto.FieldByName('cd_coligada').AsInteger, 'Impressão primeiro Boleto (NN = "' + sNossoNumero +  '" CONTA = "' + IntToStr(iConta) + '")' );
            end else begin
               DM.setLog(2013, 'alteracao', chaves, qBoleto.FieldByName('cd_coligada').AsInteger, 'Alteração de Boletos (NN Atual = "'+ sNossoNumeroAntivo +'" NN Novo = "' + sNossoNumero +  '" CONTA = "' + IntToStr(iConta) + '" )');
            end;
            

            qBoleto.Next();

         end;


      end else begin
         sNossoNumero := qBoleto.FieldByName('nr_nossonumero').AsString;
         iBoleto := qBoleto.FieldByName('cd_boleto').AsInteger;
         // Somente atualizar o cd_boleto na tabela mensalidades

         qBoleto.Close();
         qBoleto.SQL.Text :=
         ' UPDATE '+
         '    mensalidades m '+
         '    INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) '+
         ' SET m.cd_boleto = ' + IntToStr(iBoleto) +
         ' WHERE ' + sFiltro + sFiltroData +
         '   AND m.codigoaluno = ' + qyBlImp.FieldByName('codigoaluno').AsString +
         '   AND m.datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
         '   AND COALESCE(tt.ds_grupo_boleto, "A") LIKE "'+ qyBlImp.FieldByName('ds_grupo_boleto').AsString + '"' +
         '   AND m.situacao in (2,10) ';

         qBoleto.ExecSQL();

      end;

      if RemessaAlteracao then begin
         DM.FazAcaoRemessa(arAltMensalidade, qyBlImp.FieldByName('cd_mensalidade').AsInteger, true, qyBlImp.FieldByName('mensalidades').AsString);      
      end;

      qyBlImp.Next();
   end;

   if (ds_filtro_boletos <> '') then
   begin
      ds_filtro_sql_bloquetos := ' AND ( ' + ds_filtro_boletos + ' ) ';
   end
   else
   begin
      ds_filtro_sql_bloquetos := ' AND 1=1 ';
   end;

   if cd_tipo_titulo <> '' then
   begin
      cd_tipo_titulo_filtro_sql := ' AND m.cd_tipo_titulo IN (' + cd_tipo_titulo + ') ';
   end
   else
   begin
      cd_tipo_titulo_filtro_sql := ' AND 1=1 ';
   end;

   tblBloquetos.SQL.Text :=
     ' SELECT                                                                   ' +
     '   m.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,         ' +
     '   r.nm_pessoa as responsavel, d.*, c.nr_banco banco, c.nm_banco,         ' +
     '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
     '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
     '   m.cd_mensalidade, a.cd_resp_finan, c.cd_caixa                          ' +
     '   , " " as ds_grupo_boleto ' +
     ' FROM (                                                                                       ' +
     '   mensalidades m                                                                             ' +
     '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
     '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
     '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
     '   INNER JOIN departamentos d ON (m.depto = d.Codigo)                                         ' +
     '   INNER JOIN fin_cadastro_contas c ON ( c.cd_caixa = m.cd_caixa )  ' +
     ' WHERE                                                                                        ' +
     '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and m.cd_caixa = '+ IntToStr(iConta) + ' and '+
     sFiltro + sFiltroData + ds_filtro_sql_bloquetos + cd_tipo_titulo_filtro_sql +
     ' ORDER BY m.codigoaluno, m.datavencimento, m.valorbruto DESC ' ;

   tblBloquetos.Open();
   tblBloquetos.FetchAll();

   if (tblBloquetos.IsEmpty) then begin
      Mensagem('Não foi possível selecionar os dados para impressão dos boletos. Alguma informação está pendente.', 'Atenção', MB_OK + MB_ICONWARNING);
      result := false;

      FreeAndNil(qyBlImp);
      FreeAndNil(qBoleto);

      Exit;
   end;

   FreeAndNil(qyBlImp);
   FreeAndNil(qBoleto);

   Result := True;




end;

function TfrmRepBloquetos.PrepararBloquetosParaEmpresa(sFiltro: String;
  Agrupado: Boolean; ContaImpressao: String;  ds_filtro_boletos : String = ''; cd_tipo_titulo: String = '' ): Boolean;
const
   SSQLSelectMensalidades =
        ' SELECT '
      + ' 	MIN(m.cd_mensalidade) cd_mensalidade, '
      + ' 	GROUP_CONCAT(DISTINCT m.cd_boleto) boletos, '
      + ' 	GROUP_CONCAT(DISTINCT m.cd_mensalidade) mensalidades, '
      + ' 	COALESCE(m.cd_resp, m.codigoaluno) cd_resp, '
      + ' 	m.datavencimento, '
      + ' 	MAX( '
      + ' 		CASE '
      + ' 			WHEN m.cd_caixa = :cd_caixa AND COALESCE(m.nossonumero, '''') != '''' THEN m.nossonumero '
      + ' 			ELSE NULL '
      + ' 		END '
      + ' 	) nn_usar, '
      + ' 	MIN(COALESCE(m.nossonumero, '''')) nn_inicio, '
      + ' 	MAX(COALESCE(m.nossonumero, '''')) nn_fim, '
      + ' 	ROUND( '
      + ' 		SUM( '
      + ' 			COALESCE(m.valorbruto, 0) + '
      + ' 			COALESCE(m.valorextra, 0) + '
      + ' 			COALESCE(m.valorjuros, 0) - '
      + ' 			COALESCE(m.descontoextra, 0) - '
      + ' 			CASE '
      + ' 				WHEN COALESCE(m.sn_liberar_descontos, 0) = 1 THEN COALESCE(m.valordesconto, 0) '
      + ' 				ELSE 0 '
      + ' 			END '
      + ' 		), 2 '
      + ' 	) vl_boleto, '
      + '   ROUND(SUM(CASE '
      + ' 		WHEN COALESCE(m.sn_liberar_descontos, 0) = 0 THEN ROUND(COALESCE(m.valordesconto, 0), 2) '
      + ' 		ELSE 0 '
      + ' 	END), 2) vl_desconto, '
      + ' 	p.nr_dia_vencimento, '
      + '   COALESCE(tt.ds_grupo_boleto, "A") ds_grupo_boleto '
      + ' FROM '
      + ' 	mensalidades m '
      + ' 	INNER JOIN pessoas p ON (COALESCE(m.cd_resp, m.codigoaluno) = p.cd_pessoa) '
      + '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) '
      + ' WHERE '
      + ' 	%s%s AND '
      + ' 	m.situacao IN (2, 10) AND '
      + ' 	m.cd_caixa = :cd_caixa '
      + ' GROUP BY '
      + ' 	m.cd_resp, '
      + ' 	m.datavencimento, '
      + '   COALESCE(tt.ds_grupo_boleto, "A") '
      + ' ORDER BY '
      + ' 	m.cd_resp, '
      + ' 	m.datavencimento, '
      + '   COALESCE(tt.ds_grupo_boleto, "A") ';
Var
   iBoleto : Integer;
   sNossoNumero, S : String;
   sNossoNumeroAntivo : String;

   chaves : string;
   iConta : Integer;
   iColigada : Integer;
   sFiltroData : String;

   qBoleto : TUMZQuery;
   qyBlImp : TUMZQuery;
   qyBlImpAgrup: TUMZQuery;
   qyBlImpAcao: TUMZQuery;

   iPessoa : Integer;
   iDiaVencimento : Integer;
   dia, mes, ano : word;
   novoVenc :TDateTime;

   resp : Integer;
   sMsg : String;
   AlterarConta: Boolean;
   sNossoNumeroAntigo: String;
   sNossoNumeroNovo: String;

   log : String;
   qryNN : TUMZQuery;

   ds_filtro_sql_bloquetos: String;

   RemessaAlteracao : boolean;
   DDAYesToAll, DDANoToAll, bCancelarDDA: Boolean;
   qryDDA: TUMZQuery;
   iCancelamento, msgDDA: Integer;

   cd_tipo_titulo_filtro_sql: String;
begin

   DM.CriarConsulta(qryDDA);

   // A conta impressão é fundamental para agrupar boletos por empresa.
   if ContaImpressao = '' then exit;

   if (ds_filtro_boletos <> '') then
   begin
      ds_filtro_sql_bloquetos := ' AND (' + ds_filtro_boletos + ') ';
   end
   else
   begin
      ds_filtro_sql_bloquetos := ' AND 1=1 ';
   end;

   iConta := StrToInt(Copy(ContaImpressao, 1, Pos('=',ContaImpressao)-1));
   iColigada := StrToint(Copy(ContaImpressao, Pos('=',ContaImpressao)+1, length(ContaImpressao)));


   // Verificar se o boleto está bloqueado

   DM.CriarConsulta(qBoleto);

   qBoleto.UpdateMode := umUpdateChanged;
   // qBoleto.RequestLive := false;

   qBoleto.SQL.Text := 'SELECT CM.sn_bloquear_boleto, CM.dt_bloqueio_boleto FROM coligadas_matriz CM INNER JOIN coligadas c on (CM.cd_coligada = C.CD_COLIGADA_MATRIZ) ' +
                       ' WHERE C.cd_coligada = ' + IntToStr(iColigada);

   qBoleto.Open();

   sFiltroData := ' AND 1 = 1 ';

   if qBoleto.FieldByName('sn_bloquear_boleto').AsInteger = 1 then begin
      sFiltroData := ' AND datavencimento <= "' + FormatDateTime('yyyy-mm-dd', qBoleto.FieldByName('dt_bloqueio_boleto').AsDateTime) + '" ';
   end;

   DM.CriarConsulta(qyBlImp);
   DM.CriarConsulta(qyBlImpAgrup);
   DM.CriarConsulta(qyBlImpAcao);

   // Selecionar os grupos de boletos que deverão ser impressos
   qyBlImp.Close();

   qyBlImp.SQL.Text :=
     ' SELECT GROUP_CONCAT(m.cd_mensalidade) mensalidades '+
     ' FROM mensalidades m ' +
     '  INNER JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
     '  INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
     '  LEFT JOIN fin_cadastro_contas c ON (c.cd_caixa = m.cd_caixa) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     ' GROUP BY cd_resp, datavencimento, COALESCE(tt.ds_grupo_boleto, "A") '+
     ' ORDER BY cd_resp, datavencimento, COALESCE(tt.ds_grupo_boleto, "A") ';
   qyBlImp.Open();

// Verifica a conta da impressão
   while not qyBlImp.Eof do
   begin

      // Selecionar os grupos de boletos que deverão ser impressos
      qyBlImpAgrup.Close();

      qyBlImpAgrup.SQL.Text :=
        ' SELECT m.cd_mensalidade, m.cd_resp, m.datavencimento, m.nossonumero, ' +
        '   p.nr_dia_vencimento, m.cd_caixa, p.nm_pessoa nome, m.parcela, ' +
        '   tt.ds_tipo_titulo, c.ds_caixa, m.codigoaluno, m.anosemestre, m.turma, m.cd_coligada, m.dataemissao ' +
        ' FROM ' +
        '  mensalidades m ' +
        '  INNER JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
        '  INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
        '  LEFT JOIN fin_cadastro_contas c ON (c.cd_caixa = m.cd_caixa) ' +
        ' WHERE m.cd_mensalidade IN ('+qyBlImp.FieldByName('mensalidades').AsString+') ' +
        ' ORDER BY m.cd_resp, m.datavencimento, COALESCE(tt.ds_grupo_boleto, "A") ';
      qyBlImpAgrup.Open();

      sNossoNumeroNovo := '';

      while not qyBlImpAgrup.Eof do
      begin

        // Verificar se este boleto já foi impresso em outra conta
        if  (qyBlImpAgrup.FieldByName('cd_caixa').AsInteger <> iConta ) // Se o caixa que tem na mensalidade for diferente do caixa da impressao
            AND (qyBlImpAgrup.FieldByName('nossonumero').AsString <> '') // se o nosso número já está gerado
            AND (qyBlImpAgrup.FieldByName('cd_caixa').AsInteger > 0) // Se o caixa da mensalidade não estiver vazio
            AND (resp <> mrYesToAll)
            AND (resp <> mrNoToAll) then
        begin

            // ENTAO, pedir autorização para TROCAR
            sMsg := 'Você está alterando a conta de impressão do boleto de: ' + CHR(13) + CHR(13);
            sMsg := sMsg + '      ' + qyBlImpAgrup.FieldByName('nome').AsString + CHR(13);
            sMsg := sMsg + '      ' + 'Parcela: ' + qyBlImpAgrup.FieldByName('parcela').AsString + ' - ' + qyBlImpAgrup.FieldByName('ds_tipo_titulo').AsString + CHR(13);
            sMsg := sMsg + '      ' + 'Vencimento: ' + FormatDateTime('dd/mm/yyyy', qyBlImpAgrup.FieldByName('datavencimento').AsDateTime) + CHR(13);
            sMsg := sMsg + '      ' + 'Nosso Número: ' + qyBlImpAgrup.FieldByName('nossonumero').AsString + CHR(13) + CHR(13);
            sMsg := sMsg + 'que já havia sido impresso na conta ' + qyBlImpAgrup.FieldByName('ds_caixa').AsString + '.' + CHR(13) + 'Tem certeza que deseja alterar a conta?';

            resp := MensagemCustomizavel(sMsg, mtConfirmation, [mbYes, mbYesToAll, mbNo, mbNoToAll], ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'], 97 );

        end else if (qyBlImpAgrup.FieldByName('nossonumero').AsString = '') then
        begin
            // se o NN está VAZIO, ou nunca foi impresso, ou cd_caixa = 0
            //, então tem que setar o cd_caixa para poder imprimir a primeira vez nessa conta.
            AlterarConta := true;
        end;

        if ((resp <> 2) AND (resp <> mrNo) AND (resp <> mrNoToAll)) OR AlterarConta then
        begin

            sNossoNumeroAntigo := qyBlImpAgrup.FieldByName('nossonumero').AsString;

            if sNossoNumeroNovo = '' then
            begin
              sNossoNumeroNovo := DM.NovoNumero(0, '', 0, 0, iConta, qyBlImpAgrup.FieldByName('cd_coligada').AsInteger,qyBlImpAgrup.FieldByName('codigoaluno').AsInteger, Copy( qyBlImpAgrup.FieldByName('datavencimento').AsString, 9, 2 ), Copy( qyBlImpAgrup.FieldByName('dataemissao').AsString, 9, 2 ) );
            end;

            // Efetuar alteração individual de cada mensalidade, mesmo em caso de agrupamento
            // Guardar o Log de Alteração de Nosso números individuais

            chaves := FillString(qyBlImpAgrup.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                   qyBlImpAgrup.FieldByName('anosemestre').AsString + ';' + qyBlImpAgrup.FieldByName('turma').AsString + ';' +
                   qyBlImpAgrup.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qyBlImpAgrup.FieldByName('datavencimento').AsDateTime) + ';';

            qyBlImpAcao.SQL.Text :=
              ' UPDATE mensalidades SET cd_caixa = :cd_caixa, nossonumero = :nossonumero ' +
              '  WHERE cd_mensalidade = :cd_mensalidade ';

            qyBlImpAcao.ParamByName('cd_caixa').AsInteger := iConta;
            qyBlImpAcao.ParamByName('nossonumero').AsString := sNossoNumeroNovo;
            qyBlImpAcao.ParamByName('cd_mensalidade').AsInteger := qyBlImpAgrup.FieldByName('cd_mensalidade').AsInteger;

            qyBlImpAcao.ExecSQL();

            if sNossoNumeroAntigo = '' then begin
               DM.setLog(2013, 'alteracao', chaves, qyBlImpAgrup.FieldByName('cd_coligada').AsInteger, 'Impressão primeiro Boleto (NN = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '")' );
            end else begin
               DM.setLog(2013, 'alteracao', chaves, qyBlImpAgrup.FieldByName('cd_coligada').AsInteger, 'Alteração de Boletos (NN Atual = "'+ sNossoNumeroAntigo +'" NN Novo = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '" )');
            end;
        end;

        AlterarConta := false;

        qyBlImpAgrup.Next();
      end;
      
      qyBlImp.Next();
   end;

   FreeAndNil(qyBlImpAgrup);
   FreeAndNil(qyBlImpAcao);

   // Selecionar os grupos de boletos que deverão ser impressos
   qyBlImp.Close();

   qyBlImp.SQL.Text :=
     ' SELECT cd_resp, datavencimento, MIN(IFNULL(nossonumero, "")) nn_inicio, MAX(IFNULL(nossonumero, "")) nn_fim, Round(SUM(IFNULL(valorbruto, 0) + IFNULL(valorextra, 0) + IFNULL(valorjuros, 0) - IFNULL(descontoextra, 0)),2) As vl_boleto, ' +
     '   Round(SUM(IFNULL(valordesconto, 0)),2) As vl_desconto,  p.nr_dia_vencimento, COALESCE(tt.ds_grupo_boleto, "A") ds_grupo_boleto ' +
     ' FROM mensalidades m ' +
     '  INNER JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
     '  INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     '   AND m.cd_caixa = ' + IntToStr(iConta) +
     ' GROUP BY cd_resp, datavencimento, COALESCE(tt.ds_grupo_boleto, "A") ' +
     ' ORDER BY cd_resp, datavencimento, COALESCE(tt.ds_grupo_boleto, "A") ';
   qyBlImp.Open();

   if qyBlImp.EOF then begin

      Mensagem('Não foi possível selecionar os dados para impressão dos boletos. Alguma informação está pendente.', 'Atenção', MB_OK + MB_ICONWARNING);
      result := false;

      FreeAndNil(qyBlImp);
      FreeAndNil(qBoleto);

      Exit;

   end;

   // Informar que está gerando boleto para empresa.
   // Perguntar se deseja agrupar as mensalidades com vencimento no mês mes em um unico boleto.
   iPessoa := -1;


   IF Mensagem('Atenção' + CHR(13) + CHR(13) +
     ' Você está imprimindo boletos agrupados por responsável financeiro.' + CHR(13) +
     ' Os boletos serão agrupados para cada responsável pela data de vencimento.' + CHR(13) + CHR(13) +
     ' Deseja padronizar o dia de vencimento dos títulos de mesmo mês? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION)
   = mrYes THEN begin

         while not qyBlImp.Eof do begin

            dia := 0;

            if (qyBlImp.FieldByName('cd_resp').AsInteger <> iPessoa) then begin

               iPessoa := qyBlImp.FieldByName('cd_resp').AsInteger;

               iDiaVencimento := qyBlImp.FieldByName('nr_dia_vencimento').AsInteger;

               if iDiaVencimento = 0 then begin
                  DecodeDate( qyBlImp.FieldByName('datavencimento').AsDateTime, ano, mes, dia );

                  iDiaVencimento := dia;

               end;
            end;

            if Dia = 0 then begin // Precisa atualizar

               qBoleto.Close();
               // qBoleto.RequestLive := true;
               qBoleto.SQL.Text :=
                ' SELECT m.cd_mensalidade, m.datavencimento, m.parcela, p.nm_pessoa '+
                ' FROM '+
                '   mensalidades m '+
                '   INNER JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
                '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
                ' WHERE ' + sFiltro + sFiltroData +
                '   AND m.cd_resp = ' + qyBlImp.FieldByName('cd_resp').AsString +
                '   AND m.datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
                '   AND COALESCE(tt.ds_grupo_boleto, "A") LIKE "'+ qyBlImp.FieldByName('ds_grupo_boleto').AsString + '"' +
                '   AND (m.situacao = 2 OR m.situacao = 10) ';
               qBoleto.UpdateObject := updMensalidade;
               qBoleto.Open();

               while not qBoleto.EOF do begin

                  DM.CriarConsulta(qryDDA);
                  qryDDA.Close;
                  qryDDA.SQL.Text := ''+
                  '  SELECT                         '+
                  '   	rl.cd_origem,ro.cd_acao    '+
                  '  FROM                           '+
                  '  	rem_dados rd                  '+
                  '	  INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)              '+
                  '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)  '+
                  '  WHERE                                                                    '+
                  '	  rd.cd_mensalidade = :cd_mensalidade';

                  qryDDA.ParamByName('cd_mensalidade').AsInteger := qBoleto.FieldByName('cd_mensalidade').AsInteger;
                  qryDDA.Open;

                  bCancelarDDA := false;
                  iCancelamento := 0;
                  while not qryDDA.Eof do
                  begin

                     if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
                     begin
                        bCancelarDDA := true;
                     end;

                     if qryDDA.FieldByName('cd_acao').AsInteger = 101 then
                     begin
                        iCancelamento := iCancelamento +1;
                     end;

                     qryDDA.Next;
                  end;

                  if iCancelamento > 0 then
                  begin
                     bCancelarDDA := false;
                  end;

                  if ( bCancelarDDA = true ) then
                  begin

                     if ((DDAYesToAll = False) and (DDANoToAll = False)) then
                     begin

                        msgDDA :=
                           MensagemCustomizavel(
                              'Deseja cancelar o Débito Automático para a pessoa '
                                 + qBoleto.FieldByName('nome').AsString
                                 + ' na parcela de número '
                                 + qBoleto.FieldByName('parcela').AsString +'?',
                              mtConfirmation,
                              [mbYes, mbYesToAll, mbNo, mbNoToAll],
                              ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'],
                              97
                           );

                        if (msgDDA = mrYesToAll) then
                        begin
                           DDAYesToAll := True;
                        end;
                                                                            
                        if (msgDDA = mrNoToAll) then
                        begin
                           DDANoToAll := True;
                        end;

                     end;

                     if ((not(DDANoToAll)) and ((DDAYesToAll) or (msgDDA = mrYes))) then
                     begin
                        DM.FazAcaoRemessa(arCancelamentoDDA, qBoleto.FieldByName('cd_mensalidade').AsInteger);
                        Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do Débito Automático ocorra.', Application.Title, MB_OK, Handle);
                     end;
                  end;


                   DecodeDate(qboleto.FieldByName('datavencimento').AsDateTime, ano, mes, dia);

                   novoVenc := DataValida(ano, mes, iDiaVencimento);

                   if qboleto.FieldByName('datavencimento').AsDateTime <> novoVenc then begin

                      log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',qboleto.FieldByName('datavencimento').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',novoVenc)+'].'+chr(13);
                      DM.gerar_log( 10, log, DM.UsuarioLogado.Pessoa.Codigo, qboleto.FieldByName('cd_mensalidade').AsString );

                      qBoleto.Edit;
                      qBoleto.FieldByName('datavencimento').AsDateTime := novoVenc;
                      qBoleto.Post;

                   end;

                   qBoleto.Next();
               end;

            end;
            qyBlImp.Next();
         end;
   end;

// Atualizar a consulta com os novos vencimentos

   S := Format(SSQLSelectMensalidades, [sFiltro, sFiltroData]);
   qyBlImp.Close;
   qyBlImp.SQL.Text := S;
   qyBlImp.ParamByName('cd_caixa').AsInteger := iConta;
   qyBlImp.Open;

   while not qyBlImp.Eof do begin

      // Verificar se já existe um fin_boleto com as mesmas configurações

      qBoleto.Close();
      // qBoleto.RequestLive := false;

      qBoleto.SQL.Text :=
       ' SELECT * from fin_boleto  '  +
       '  WHERE cd_pessoa = ' + qyBlImp.FieldByName('cd_resp').AsString +
       '    AND dt_vencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
       '  ORDER BY cd_boleto DESC limit 1 ';
      qBoleto.Open();

      // Verificar se é um boleto já impresso.
      // Qualquer alteração deverá trocar os NN e reimprimir

      RemessaAlteracao := false;

      if (qBoleto.Eof)
         OR (qBoleto.FieldByName('nr_nossonumero').AsString <> qyBlImp.FieldByName('nn_inicio').AsString)
         OR (qBoleto.FieldByName('nr_nossonumero').AsString <> qyBlImp.FieldByName('nn_fim').AsString)
         OR (qBoleto.FieldByName('vl_boleto').AsCurrency <> qyBlImp.FieldByName('vl_boleto').AsCurrency)
         OR (qBoleto.FieldByName('vl_desconto').AsCurrency <> qyBlImp.FieldByName('vl_desconto').AsCurrency)
         OR (qBoleto.FieldByName('cd_conta').AsInteger <> iConta)
      then begin
         // Inserir um novo fin_boleto
         // Atualizar as mensalidades (nossonumero e fin_boleto

         tblAux.Close();
         tblAux.SQL.Text :=
            ' INSERT INTO fin_boleto (cd_resp_finan, cd_pessoa, nr_nossonumero, ' +
            '    dt_impressao, dt_vencimento, vl_boleto, vl_desconto, cd_conta, cd_coligada) ' +
            ' VALUES (:cd_resp_finan, :cd_pessoa, :nr_nossonumero, :dt_impressao, :dt_vencimento, :vl_boleto, :vl_desconto, :cd_conta, :cd_coligada) ';

         tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime);
         tblAux.ParamByName('vl_boleto').AsCurrency := qyBlImp.FieldByName('vl_boleto').AsCurrency;
         tblAux.ParamByName('dt_impressao').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);

         // REVISAR AQUI - Está mudando o nosso número se alterou o valor de um boleto
         // **************************************************************************
         // **************************************************************************
         // **************************************************************************

         if (qyBlImp.FieldByName('nn_usar').AsString <> '') and (qyBlImp.FieldByNAme('boletos').AsString <> '') then begin
            // verificar se o mesmo boleto não está sendo utilizado em outros alunos/mensalidades


            Dm.CriarConsulta(qryNN);
            qryNN.Close();
            qryNN.SQL.Text := 'SELECT count(*) as resultado FROM mensalidades WHERE cd_boleto is not null AND cd_boleto > 0 and cd_boleto in (' + qyBlImp.FieldByNAme('boletos').AsString + ') '+
                              ' AND cd_mensalidade NOT IN ( '+ qyBlImp.FieldByName('mensalidades').Asstring + ' ); ';
            qryNN.OPen();

            if qryNN.FieldByName('resultado').AsInteger > 0 then begin
              sNossonumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, qyBlImp.FieldByName('cd_resp').AsInteger, Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ));

              qryNN.Close();
                      qryNN.SQL.Text :=
                          'DELETE FROM REM_DADOS ' +
                          'USING ' +
                             'REM_DADOS ' +
                             'JOIN REM_OCORRENCIAS ' +
                                'JOIN REM_LAYOUTS ON ' +
                                   '(REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA) ' +
                          'WHERE ' +
                             'REM_DADOS.CD_MENSALIDADE IN ( '+ qyBlImp.FieldByName('mensalidades').Asstring + ' ); ';
              qryNN.ExecSQL();
            end else begin
              sNossonumero := qyBlImp.FieldByName('nn_usar').AsString;

              // Verifiacar quais alterações e disparar remessa de alteração:

                 if  (qBoleto.FieldByName('vl_boleto').AsCurrency >0 )
                 AND
                    ( (qBoleto.FieldByName('vl_boleto').AsCurrency <> qyBlImp.FieldByName('vl_boleto').AsCurrency) OR  (qBoleto.FieldByName('vl_desconto').AsCurrency <> qyBlImp.FieldByName('vl_desconto').AsCurrency) )
                 then begin
                    // Está sendo impresso um boleto com valor diferente
                    // Registrar ação de alteração para todas as parcelas envolvidas

                    RemessaAlteracao := True;


                  end;


            end;

            FreeAndNil(qryNN);

         end else begin
            sNossonumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, qyBlImp.FieldByName('cd_resp').AsInteger, Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ));
         end;

         tblAux.ParamByName('cd_resp_finan').AsInteger := qyBlImp.FieldByName('cd_resp').AsInteger;
         tblAux.ParamByName('cd_pessoa').AsInteger := qyBlImp.FieldByName('cd_resp').AsInteger;
         tblAux.ParamByName('nr_nossonumero').AsString := sNossoNumero;

         tblAux.ParamByName('vl_desconto').AsCurrency := qyBlImp.FieldByName('vl_desconto').AsCurrency;
         tblAux.ParamByName('cd_conta').AsInteger := iConta;
         tblAux.ParamByName('cd_coligada').AsInteger := iColigada;
         tblAux.ExecSQL();

         iBoleto := DM.LastInsert();

         // Atualizar as mensalidades

         qBoleto.Close();
         // qBoleto.RequestLive := true;
         qBoleto.SQL.Text :=
          ' SELECT m.* FROM ' +
          '   mensalidades m' +
          '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) '+
          ' WHERE ' + sFiltro + sFiltroData +
          '   AND cd_resp = ' + qyBlImp.FieldByName('cd_resp').AsString +
          '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
          '   AND COALESCE(tt.ds_grupo_boleto, "A") LIKE "'+ qyBlImp.FieldByName('ds_grupo_boleto').AsString + '"' +
          '   AND (situacao = 2 OR situacao = 10) ';
         qBoleto.UpdateObject := updMensalidadeBoleto;
         qBoleto.Open();


         while not qBoleto.Eof do begin

            sNossoNumeroAntivo := qBoleto.FieldByName('nossonumero').AsString;

            qBoleto.Edit;
            qBoleto.FieldByName('cd_caixa').AsInteger := iConta;
            qBoleto.FieldByName('nossonumero').AsString := sNossoNumero;
            qBoleto.FieldByName('cd_boleto').AsInteger := iBoleto;
            qBoleto.Post();

            chaves := FillString(qBoleto.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                   qBoleto.FieldByName('anosemestre').AsString + ';' + qBoleto.FieldByName('turma').AsString + ';' +
                   qBoleto.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qBoleto.FieldByName('datavencimento').AsDateTime) + ';';

            if sNossoNumeroAntivo = '' then begin
               DM.setLog(2013, 'alteracao', chaves, qBoleto.FieldByName('cd_coligada').AsInteger, 'Impressão primeiro Boleto (NN = "' + sNossoNumero +  '" CONTA = "' + IntToStr(iConta) + '" )' );
            end else begin
               DM.setLog(2013, 'alteracao', chaves, qBoleto.FieldByName('cd_coligada').AsInteger, 'Alteração de Boletos (NN Atual = "'+ sNossoNumeroAntivo +'" NN Novo = "' + sNossoNumero +  '" CONTA = "' + IntToStr(iConta) + '" )');
            end;


            qBoleto.Next();

         end;


      end else begin
         sNossoNumero := qBoleto.FieldByName('nr_nossonumero').AsString;
         iBoleto := qBoleto.FieldByName('cd_boleto').AsInteger;
         // Somente atualizar o cd_boleto na tabela mensalidades

         qBoleto.Close();
         qBoleto.SQL.Text :=
         ' UPDATE '+
         '   mensalidades m '+
         '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) '+
         ' SET m.cd_boleto = ' + IntToStr(iBoleto) +
         ' WHERE ' + sFiltro + sFiltroData +
         '   AND m.cd_resp = ' + qyBlImp.FieldByName('cd_resp').AsString +
         '   AND m.datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
         '   AND COALESCE(tt.ds_grupo_boleto, "A") LIKE "'+ qyBlImp.FieldByName('ds_grupo_boleto').AsString + '"' +         
         '   AND m.situacao in (2,10) ';

         qBoleto.ExecSQL();

      end;

      if RemessaAlteracao then begin
         DM.FazAcaoRemessa(arAltMensalidade, qyBlImp.FieldByName('cd_mensalidade').AsInteger, true, qyBlImp.FieldByName('mensalidades').AsString);      
      end;

      qyBlImp.Next();
   end;

   if (cd_tipo_titulo <> '') then
   begin
      cd_tipo_titulo_filtro_sql := ' AND m.cd_tipo_titulo IN ( ' + cd_tipo_titulo + ' )';
   end;

   if (ds_filtro_sql_bloquetos = '') then
   begin
      ds_filtro_sql_bloquetos := ' AND 1 = 1 ';
   end;

   tblBloquetos.SQL.Text :=
     ' SELECT                                                                   ' +
     '   m.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,         ' +
     '   r.nm_pessoa as responsavel, d.*, c.nr_banco banco, c.nm_banco,         ' +
     '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
     '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
     '   m.cd_mensalidade, a.cd_resp_finan, c.cd_caixa,                         ' +
     '   COALESCE(tt.ds_grupo_boleto, "A") ds_grupo_boleto                   ' +
     ' FROM (                                                                                       ' +
     '   mensalidades m                                                                             ' +
     '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
     '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
     '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
     '   INNER JOIN departamentos d ON (m.depto = d.Codigo)                                         ' +
     '   INNER JOIN fin_cadastro_contas c ON ( c.cd_caixa = m.cd_caixa )  ' +
     '   INNER JOIN fin_tipos_titulo tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
     ' WHERE                                                                                        ' +
     '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and m.cd_caixa = '+ IntToStr(iConta) + ' and '+
     sFiltro + sFiltroData + ds_filtro_sql_bloquetos + cd_tipo_titulo_filtro_sql +
     ' ORDER BY m.codigoaluno, m.datavencimento, m.valorbruto DESC ' ;
   // tblBloquetos.Prepare();
   tblBloquetos.Open();
   tblBloquetos.FetchAll();

   if (tblBloquetos.IsEmpty) then begin
      Mensagem('Não foi possível selecionar os dados para impressão dos boletos. Alguma informação está pendente.', 'Atenção', MB_OK + MB_ICONWARNING);
      result := false;

      FreeAndNil(qyBlImp);
      FreeAndNil(qBoleto);

      Exit;
   end;

   FreeAndNil(qyBlImp);
   FreeAndNil(qBoleto);

   Result := True;


end;


{
  Realiza verificações sobre a conta de impressão repassada,
  Apenas aborta o processo quando não é repassada a conta de impressão e
  deve perguntar sobre a mesma
}

function TfrmRepBloquetos.verificaContaImpressao(strContaImpressao: string; perguntar: boolean; var cdConta: integer): boolean;
begin

  Result := true;

  // Se veio o código da conta para emissão dos boletos e repassado em determinado formato
  if (strContaImpressao <> '') and (Pos('=', strContaImpressao) > 0) then
  begin
    cdConta := StrToInt(Copy(strContaImpressao, 1, Pos('=',strContaImpressao)-1));

  // Se apenas veio o código da conta para emissão dos boletos
  end else if (strContaImpressao <> '') then
  begin
    cdConta := StrToInt(strContaImpressao);

  // Quando não é repassado a conta e deve perguntar ao usuário sobre a alteração de conta
  // aborta o processo, pois não foi possível identificar a nova conta para impressão
  // Retorno false nessa função = aborta o processo
  end else if perguntar then
  begin
    Result := false;
      
  end;
    
end;

{
  Retorna o número de dia de vencimento definido no cadastro da pessoa
  no campo "nr_dia_vencimento"
}

function TfrmRepBloquetos.getNrDiaVencimentoPessoa(cdPessoa: integer): integer;
var
  qyGetDiaVencimento: TUMZQuery;
begin
  DM.CriarConsulta(qyGetDiaVencimento);

  qyGetDiaVencimento.SQL.Text :=
    ' SELECT '+
    '     COALESCE(nr_dia_vencimento, 0) nr_dia_vencimento '+
    ' FROM '+
    '     pessoas '+
    ' WHERE '+
    '     cd_pessoa = '+IntToStr(cdPessoa);

  qyGetDiaVencimento.Open;

  Result := qyGetDiaVencimento.FieldByName('nr_dia_vencimento').AsInteger;

  FreeAndNil(qyGetDiaVencimento);
end;

{
  Realiza verificações sobre o DDA (Débito Automático Autorizado)
  Se no cadastro da conta estiver marcado para ignorar o DDA, então
  deve retornar true, para ignorar as pessoas que possuem DDA.
}

function TfrmRepBloquetos.verificaIgnoraDDA(cdConta: integer): boolean;
var
  qryVerificaIgnoraDDA: TUMZQuery;
begin
  DM.CriarConsulta(qryVerificaIgnoraDDA);

  qryVerificaIgnoraDDA.SQL.Text :=
    ' SELECT '+
    '     sn_ignorar_dda '+
    ' FROM '+
    '     fin_cadastro_contas '+
    ' WHERE '+
    '     cd_caixa = '+IntToStr(cdConta);

  qryVerificaIgnoraDDA.Open;

  Result := false;

  if qryVerificaIgnoraDDA.FieldByName('sn_ignorar_dda').AsInteger = 1 then
  begin
    Result := true;
  end;

  FreeAndNil(qryVerificaIgnoraDDA);
end;


{
  Realiza verificações para verificar se deve
  cancelar um DDA (Débito Automático Autorizado)
  Caso positivo envia remessa de cancelamento de DDA
}

procedure TfrmRepBloquetos.realizaCancelamentoDDA(cdMensalidade, nrParcela: integer; nmPessoa: string);
var
  qyVerificaDDA: TUMZQuery;
  cancelarDDA: boolean;
  opcaoCancelarDDA, cancelamento: integer;
begin
  DM.CriarConsulta(qyVerificaDDA);

  // Monta SQL para verificar se possui algum DDA ligado as
  // mensalidades impressas  
  qyVerificaDDA.Close;
  qyVerificaDDA.SQL.Text :=
    ' SELECT '+
    '   rl.cd_origem, '+
    '   ro.cd_acao '+
    ' FROM '+
    '   mensalidades m '+
    '	  INNER JOIN rem_envios re ON (re.nr_nossonumero = m.nossonumero) '+      
    '	  INNER JOIN rem_layouts rl ON (rl.cd_layout = re.cd_layout) '+
    '  	INNER JOIN rem_ocorrencias ro ON (ro.cd_ocorrencia = re.cd_ocorrencia) '+
    ' WHERE '+
    '	  m.cd_mensalidade = :cd_mensalidade';

  qyVerificaDDA.ParamByName('cd_mensalidade').AsInteger := cdMensalidade;
  qyVerificaDDA.Open;

  cancelarDDA := false;
  cancelamento := 0;

  // Varre as mensalidades ligadas a DDA
  while not qyVerificaDDA.Eof do
  begin

    if qyVerificaDDA.FieldByName('cd_origem').AsInteger = 3 then
    begin
      cancelarDDA := true;
    end;

    if qyVerificaDDA.FieldByName('cd_acao').AsInteger = 101 then
    begin
      cancelamento := cancelamento + 1;
    end;

    qyVerificaDDA.Next;
  end;

  if cancelamento > 0 then
  begin
    cancelarDDA := false;
  end;

  // Se possui e deve cancelar DDA do aluno
  if ( cancelarDDA = true ) then
  begin

    // Verifica qual a resposta para pergunta de aplicar o cancelamento de DDA para todos
    if ((DDASimParaTodos = False) and (DDANaoParaTodos = False)) then
    begin

      // Apresenta a mensagem de cancelamento de DDA
      opcaoCancelarDDA :=
        MensagemCustomizavel(
          'Deseja cancelar o Débito Automático para a pessoa ' + nmPessoa +
          ' na parcela de número ' + IntToStr(nrParcela) +'?',
          mtConfirmation,
          [mbYes, mbYesToAll, mbNo, mbNoToAll],
          ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'],
          97
        );

      // Se usuário optou por cancelar todos os DDA
      if (opcaoCancelarDDA = mrYesToAll) then
      begin
        DDASimParaTodos := True;
      end;

      // Se usuário optou por NÃO cancelar todos os DDA
      if (opcaoCancelarDDA = mrNoToAll) then
      begin
        DDANaoParaTodos := True;
      end;

    end;

    // Verifica qual a resposta para cancelamento de DDA do usuário
    if ((not(DDANaoParaTodos)) and ((DDASimParaTodos) or (opcaoCancelarDDA = mrYes))) then
    begin
      // Caso o usuário deseje cancelar o DDA, envia ação de remessa para cancelamento
      //DM.FazAcaoRemessa(arCancelamentoDDA, cdMensalidade);

      if mensagemExibidaDDA = False then
      begin
        Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do Débito Automático ocorra.', Application.Title, MB_OK, Handle);

        if DDASimParaTodos then
        begin
          mensagemExibidaDDA := True;
        end;
      end;
    end;

  end;

end;

{
  Realiza o SQL para conseguir os valores das mensalidades agrupadas
  cria a FIN_BOLETO e retorna um tipo TBoleto com as informações inseridas
}

function TfrmRepBloquetos.inserirBoleto(mensalidadesAgrupadas: TStringList; dtVencimentoBoleto: TDateTime = 0; preparaBoletoImpressao: TPreparaBoleto = pbImpressaoPadrao): TBoleto;
const
   SQL_GET_BOLETO =
        ' SELECT '
      + ' 	m.cd_resp cd_responsavel, '
      + ' 	m.codigoaluno cd_pessoa, '
      + ' 	m.cd_caixa, '
      + ' 	l.cd_layout, '
      + ' 	m.cd_coligada, '
      + ' 	m.datavencimento dt_vencimento, '
      + ' 	ROUND( '
      + ' 		SUM( '
      + ' 			GET_ACRESCIMOS(m.cd_mensalidade, [DATA_CORRECAO]) + '
      + ' 			COALESCE(m.valorbruto, 0) + '
      + ' 			COALESCE(m.valorextra, 0) + '
      + ' 			COALESCE(m.valorjuros, 0) - '
      + ' 			COALESCE(m.descontoextra, 0) - '
      + ' 			CASE '
      + ' 				WHEN COALESCE(m.sn_liberar_descontos, 0) = 1 THEN GET_DESCONTOS(m.cd_mensalidade, [DATA_CORRECAO]) '
      + ' 				ELSE 0 '
      + ' 			END '
      + ' 		), 2 '
      + ' 	) vl_nominal, '
      + ' ROUND( '
      + ' 	SUM( '
      + ' 		CASE '
      + ' 			WHEN COALESCE(m.sn_liberar_descontos, 0) = 0 THEN GET_DESCONTOS(m.cd_mensalidade, [DATA_CORRECAO]) '
      + ' 			ELSE 0 '
      + ' 		END '
      + ' 	), 2 '
      + ' ) vl_desconto '
      + ' FROM '
      + ' 	mensalidades m '
      + ' 		LEFT JOIN rem_layouts l ON '
      + ' 			(m.cd_caixa = l.cd_caixa AND l.cd_origem = 1) '
      + ' WHERE '
      + ' 	m.cd_mensalidade IN (:cd_mensalidades) '
      + ' GROUP BY '
      + ' 	m.cd_resp ';

  SQL_INSERIR_FIN_BOLETO =
    ' INSERT INTO fin_boleto (cd_resp_finan, cd_pessoa, nr_nossonumero, '+
    '    dt_impressao, dt_vencimento, vl_boleto, vl_desconto, cd_conta, cd_coligada) '+
    ' VALUES (:cd_resp_finan, :cd_pessoa, :nr_nossonumero, :dt_impressao, '+
    '    :dt_vencimento, :vl_boleto, :vl_desconto, :cd_conta, :cd_coligada) ';
var
  qyGetDadosBoleto, qyInserirBoleto: TUMZQuery;
  boleto: TBoleto;
begin

  // Se nenhuma mensalidade foi repassada não tem nada ser feito
  if not(mensalidadesAgrupadas.Count > 0) then
  begin
    Exit;
  end;

  DM.CriarConsulta(qyGetDadosBoleto);
  DM.CriarConsulta(qyInserirBoleto);

  mensalidadesAgrupadas.Delimiter := ',';

  qyGetDadosBoleto.Close;
  qyGetDadosBoleto.SQL.Text := SQL_GET_BOLETO;
  qyGetDadosBoleto.SQL.Text := ReplaceStr( qyGetDadosBoleto.SQL.Text, ':cd_mensalidades', mensalidadesAgrupadas.DelimitedText );

  if dtVencimentoBoleto = 0 then
  begin
    // Uma data bem antiga para que o boleto seja impresso como se nunca estivesse vencido, com todas as informações originais
    qyGetDadosBoleto.SQL.Text := ReplaceStr( qyGetDadosBoleto.SQL.Text, '[DATA_CORRECAO]', '"1999-08-13"' );
  end else begin
    qyGetDadosBoleto.SQL.Text := ReplaceStr( qyGetDadosBoleto.SQL.Text, '[DATA_CORRECAO]', '"' + FormatDateTime('yyyy-mm-dd', dtVencimentoBoleto ) + '"' );
  end;

  qyGetDadosBoleto.Open;

  boleto := nil;

  if not qyGetDadosBoleto.Eof then
  begin

    boleto := TBoleto.Create;

    boleto.cdPessoa := qyGetDadosBoleto.FieldByName('cd_pessoa').AsInteger;
    boleto.cdResponsavel := qyGetDadosBoleto.FieldByName('cd_pessoa').AsInteger;

    // Se possui responsável usa o que está na mensalidade, caso contrário o código do aluno
    if qyGetDadosBoleto.FieldByName('cd_responsavel').AsInteger <> 0 then
    begin
      boleto.cdResponsavel := qyGetDadosBoleto.FieldByName('cd_responsavel').AsInteger;
    end;

    boleto.cdConta := qyGetDadosBoleto.FieldByName('cd_caixa').AsInteger;
    boleto.cdLayout := qyGetDadosBoleto.FieldByName('cd_layout').AsInteger;
    boleto.cdColigada := qyGetDadosBoleto.FieldByName('cd_coligada').AsInteger;

    // Se foi informada uma data de vencimento na impressão utiliza ela como
    // base para geração da remessa e fin_boletos 
    boleto.dtVencimento := dtVencimentoBoleto;
    if dtVencimentoBoleto = 0 then
    begin
      boleto.dtVencimento := qyGetDadosBoleto.FieldByName('dt_vencimento').AsDateTime;
    end;

    boleto.vlNominal := qyGetDadosBoleto.FieldByName('vl_nominal').AsCurrency;
    boleto.vlDesconto := qyGetDadosBoleto.FieldByName('vl_desconto').AsCurrency;
  end;

  // Insere o registro de impressão na FIN_BOLETO
  qyInserirBoleto.Close;
  qyInserirBoleto.SQL.Text := SQL_INSERIR_FIN_BOLETO;
  qyInserirBoleto.ParamByName('cd_resp_finan').AsInteger := boleto.cdResponsavel;

  if (preparaBoletoImpressao = pbImpressaoAluno) or (preparaBoletoImpressao = pbImpressaoEmpresa) then
  begin
    qyInserirBoleto.ParamByName('cd_pessoa').AsInteger := boleto.cdResponsavel;
  end else begin
    qyInserirBoleto.ParamByName('cd_pessoa').AsInteger := boleto.cdPessoa;
  end;

  qyInserirBoleto.ParamByName('nr_nossonumero').AsString := '';
  qyInserirBoleto.ParamByName('dt_impressao').AsDateTime := DataHoje;
  qyInserirBoleto.ParamByName('dt_vencimento').AsDateTime := boleto.dtVencimento;
  qyInserirBoleto.ParamByName('vl_boleto').AsCurrency := boleto.vlNominal;
  qyInserirBoleto.ParamByName('vl_desconto').AsCurrency := boleto.vlDesconto;
  qyInserirBoleto.ParamByName('cd_conta').AsInteger := boleto.cdConta;
  qyInserirBoleto.ParamByName('cd_coligada').AsInteger := boleto.cdColigada;
  qyInserirBoleto.ExecSQL;

  // Preenche o código do boleto
  boleto.cdBoleto := Dm.LastInsert;

  // Retorna o boleto gerado
  Result := boleto;

  // Liberar a memória utilizada
  FreeAndNil(qyGetDadosBoleto);
  FreeAndNil(qyInserirBoleto);
end;

{
  Registra a ação de baixa, caso o NN estiver na fila ou rejeitado,
  apenas ignora a remessa, gera um NN valido para ser usado (se não existir um)
  e registra o novo envio na remessa do NN válido
}

procedure TfrmRepBloquetos.baixaNNAnterioresGeraNN(nossoNumeroAnterior, dsSituacao: string; var nossoNumeroValido: string; boleto: TBoleto);
begin
  // Pedido de baixa para os registrados, ignora os não registrados
  objRemessa.registraAcaoBaixa(
    nossoNumeroAnterior,
    objRemessa.getSituacaoNossoNumero(dsSituacao)
  );

  // Se não possui NN para reaproveitar, gera um novo
  if nossoNumeroValido = '' then
  begin
    nossoNumeroValido := DM.NovoNumero(
      0, '', 0, 0,
      boleto.cdConta,
      boleto.cdColigada,
      boleto.cdPessoa,
      Copy(DateTimeToStr(boleto.dtVencimento), 3, 2),
      Copy(FormatDateTime('yyyy-mm-dd', DataHoje), 3, 2)
    );
  end;

end;

{
  Atualiza a mensalidade, com o novo NN válido e
  a informação de cd_boleto gerada
}

procedure TfrmRepBloquetos.atualizaMensalidade(mensalidadesAgrupadas: TStringList; nossoNumero: string; boleto: TBoleto);
const
  SQL_ATUALIZAR_MENSALIDADE =
    ' UPDATE '+
    '     mensalidades '+
    ' SET '+
    '     nossonumero = :nr_nossonumero, '+
    '     cd_boleto = :cd_boleto '+
    ' WHERE '+
    '     cd_mensalidade IN (:cd_mensalidades)';
var
  qyAtualizarMensalidade: TUMZQuery;
begin

  DM.CriarConsulta(qyAtualizarMensalidade);

  mensalidadesAgrupadas.Delimiter := ',';

  qyAtualizarMensalidade.Close;
  qyAtualizarMensalidade.SQL.Text := SQL_ATUALIZAR_MENSALIDADE;
  qyAtualizarMensalidade.SQL.Text := ReplaceStr( qyAtualizarMensalidade.SQL.Text, ':cd_mensalidades', mensalidadesAgrupadas.DelimitedText );
  qyAtualizarMensalidade.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAtualizarMensalidade.ParamByName('cd_boleto').AsInteger := boleto.cdBoleto;
  qyAtualizarMensalidade.ExecSQL;

  FreeAndNil(qyAtualizarMensalidade);
end;

{
  Atualiza a fin_boleto com a informação do NN válido
  que foi enviado para a remessa
}

procedure TfrmRepBloquetos.atualizaBoleto(boleto: TBoleto; nossoNumero: string);
const
  SQL_ATUALIZAR_MENSALIDADE =
    ' UPDATE '+
    '     fin_boleto '+
    ' SET '+
    '     nr_nossonumero = :nr_nossonumero '+
    ' WHERE '+
    '     cd_boleto = :cd_boleto';
var
  qyAtualizarBoleto: TUMZQuery;
begin

  DM.CriarConsulta(qyAtualizarBoleto);

  qyAtualizarBoleto.Close;
  qyAtualizarBoleto.SQL.Text := SQL_ATUALIZAR_MENSALIDADE;
  qyAtualizarBoleto.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAtualizarBoleto.ParamByName('cd_boleto').AsInteger := boleto.cdBoleto;
  qyAtualizarBoleto.ExecSQL;

  FreeAndNil(qyAtualizarBoleto);
end;

{
  Grava os logs de impressão e troca de NN
}

procedure TfrmRepBloquetos.gravarLogsImpressao(logsImpressaoNN: TStringList; nossoNumeroNovo: string);
var
  i: integer;
  logImpressao: TLogImpressaoNN;
begin

  // Varre os logs armazenados
  for i := 0 to logsImpressaoNN.Count-1 do
  begin
    // Busca o log de impressão do nosso numero
    logImpressao := TLogImpressaoNN(logsImpressaoNN.Objects[i]);

    if logImpressao.nrNossoNumero <> nossoNumeroNovo then
    begin
      // Inserir o log de impressão do NN da mensalidade
      DM.setLog(2013, 'alteracao', logImpressao.dsChave, logImpressao.cdColigada,
        'Modificado o NN (NN Anterior = "' + logImpressao.nrNossoNumero +  '" NN Novo = "' + nossoNumeroNovo + '")' );
    end;
    
  end;

end;

{
  Atualiza a data de vencimento de uma mensalidade
  A nova data é montada com o mês e ano da atual mas o dia é padronizado
  para o dia informado na procedure 
}

procedure TfrmRepBloquetos.atualizarDataVencimento(cdAluno, cdResp, nrDiaVencimento: integer; dtVencimento: TDateTime; sFiltro: string; preparaBoletoImpressao: TPreparaBoleto);
const
  SQL_ATUALIZAR_DATA_VENCIMENTO =
    ' UPDATE '+
    '     mensalidades '+
    ' SET '+
    '     datavencimento = CONCAT(LPAD(YEAR(datavencimento), 4, "0"),"-",LPAD(MONTH(datavencimento), 2, "0"),"-",LPAD(:nr_dia_vencimento, 2, "0")) '+
    ' WHERE '+
    '     situacao IN (2, 10) AND '+
    '     datavencimento = :dt_vencimento ';
var
  qyAtualizarDataVencimento: TUMZQuery;
  nrAno, nrMes, nrDia: word;
  novoVencimento: TDatetime;
  dsLog: string;
begin

  DM.CriarConsulta(qyAtualizarDataVencimento);

  qyAtualizarDataVencimento.UpdateMode := umUpdateChanged;

  qyAtualizarDataVencimento.Close();

  if preparaBoletoImpressao = pbImpressaoAluno then
  begin

    qyAtualizarDataVencimento.SQL.Text :=
      ' SELECT m.cd_mensalidade, m.datavencimento, m.parcela, p.nm_pessoa FROM mensalidades m JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
      ' WHERE ' + sFiltro +
      '   AND m.codigoaluno = ' + IntToStr(cdAluno) +
      '   AND m.datavencimento = "' + FormatDateTime('yyyy-mm-dd', dtVencimento) + '" ' +
      '   AND situacao IN (2, 10) ';

  end;

  if preparaBoletoImpressao = pbImpressaoEmpresa then
  begin

    qyAtualizarDataVencimento.SQL.Text :=
      ' SELECT m.cd_mensalidade, m.datavencimento, m.parcela, p.nm_pessoa FROM mensalidades m JOIN pessoas p ON (m.cd_resp = p.cd_pessoa) ' +
      ' WHERE ' + sFiltro +
      '   AND m.cd_resp = ' + IntToStr(cdResp) +
      '   AND m.datavencimento = "' + FormatDateTime('yyyy-mm-dd', dtVencimento) + '" ' +
      '   AND situacao IN (2, 10) ';

  end;

  qyAtualizarDataVencimento.UpdateObject := updMensalidade;
  qyAtualizarDataVencimento.Open();

  while not qyAtualizarDataVencimento.Eof do
  begin

     DecodeDate(qyAtualizarDataVencimento.FieldByName('datavencimento').AsDateTime, nrAno, nrMes, nrDia);

     novoVencimento := DataValida(nrAno, nrMes, nrDiaVencimento);

     if qyAtualizarDataVencimento.FieldByName('datavencimento').AsDateTime <> novoVencimento then
     begin

        dsLog := dsLog + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',qyAtualizarDataVencimento.FieldByName('datavencimento').AsDateTime)+'] => ['+FormatDateTime('dd/mm/yyyy',novoVencimento)+'].'+chr(13);
        DM.gerar_log( 10, dsLog, DM.UsuarioLogado.Pessoa.Codigo, qyAtualizarDataVencimento.FieldByName('cd_mensalidade').AsString );

        qyAtualizarDataVencimento.Edit;
        qyAtualizarDataVencimento.FieldByName('datavencimento').AsDateTime := novoVencimento;
        qyAtualizarDataVencimento.Post;

     end;

     qyAtualizarDataVencimento.Next();
  end;

  // Liberar a memória utilizada pela função
  FreeAndNil(qyAtualizarDataVencimento);  
end;

function TfrmRepBloquetos.prepararRemessa(mensalidadesAgrupadas, mensalidadesAlterouConta: TStringList; boleto: TBoleto): string;
const
  SQL_STATUS_NN =
    ' SELECT '+
    '     m.cd_mensalidade, '+
    '	    m.nossonumero nr_nossonumero, '+
    '	    CASE WHEN rem.cd_mensalidade IS NULL THEN "" ELSE rs.ds_situacao END ds_situacao, '+
	  '     CASE WHEN m.cd_mensalidade IN (:cd_mensa_alterou_conta) THEN 1 ELSE 0 END sn_alterou_conta, '+
    '     CASE WHEN re.cd_ocorrencia IN (SELECT cd_ocorrencia FROM rem_ocorrencias WHERE cd_acao = :cd_acao AND cd_layout = :cd_layout AND sn_ativo = 1) THEN 1 ELSE 0 END sn_baixa_registrada, '+
    '     CASE WHEN ((rs.nr_nossonumero IS NULL) AND (re.cd_envio IS NULL) OR '+
    '                (rs.nr_nossonumero IS NOT NULL AND rs.cd_envio_atual IS NULL)) AND '+
    '		    		  (m.cd_caixa IS NOT NULL) THEN 1 ELSE 0 END sn_nossonumero_ja_gerado, '+
    '     (SELECT cd_envio FROM rem_envios WHERE nr_nossonumero = m.nossonumero AND cd_arquivo IS NULL AND sn_ignorado = 0 LIMIT 1) sn_possui_envio_fila, '+
    '     CASE WHEN m2.cd_mensalidade IS NOT NULL THEN 1 ELSE 0 END sn_outras_mensa_com_mesmo_nn '+
    ' FROM '+
    '     mensalidades m '+
    '     LEFT JOIN rem_status rs ON (m.nossonumero is not null AND m.nossonumero <> "" AND rs.nr_nossonumero = m.nossonumero) '+
    '     LEFT JOIN rem_envios re ON ( '+
      '         m.nossonumero is not null AND m.nossonumero <> "" AND  '+
		'         re.nr_nossonumero = m.nossonumero AND '+
		'         re.sn_ignorado = 0 '+
    '	    ) '+
    '     LEFT JOIN rem_envios_mensalidades rem ON ( '+
    '           m.nossonumero is not null AND m.nossonumero <> "" AND '+
		'         rem.cd_envio = re.cd_envio AND '+
    '     		rem.cd_mensalidade IN (:cd_mensalidades) '+
    '   	) '+
    '     LEFT JOIN mensalidades m2 ON ( '+
    '         m.nossonumero is not null AND m.nossonumero <> "" AND '+ 
    '         m2.nossonumero = m.nossonumero AND '+
    '         m2.cd_mensalidade NOT IN (:cd_mensalidades) '+
    '     ) '+
    ' WHERE '+
    '      m.cd_mensalidade IN (:cd_mensalidades) '+
    ' GROUP BY '+
    '     m.cd_mensalidade ';
var
  qyStatusNN: TUMZQuery;

  nossoNumeroProcessado: TStringList;

  dsSituacao, nossoNumero, nossoNumeroValido: string;

  cdLayout: integer;

  situacaoNN: TSituacaoNN;

  acaoRemessa: uRemessaClass.TAcaoRemessa;

  possuiRegistro, possuiFila, possuiBaixa,
  possuiNNDiferentes, possuiAlteracaoConta, possuiNNRejeitadoSemEnvio,
  snDiffVencimento, snDiffDesconto, snDiffResponsavel, snDiffOutro,
  possuiOutrasMensaComMesmoNN, igualUltimaEnvio,
  registrarRemessa, acaoRemessaNaFila,
  enviouAltVencimento, enviouAltDesconto, enviouAltOutrosDados: boolean;
begin

  // Se nenhuma mensalidade foi repassada não tem nada ser feito
  if not(mensalidadesAgrupadas.Count > 0) then
  begin
    Exit;
  end;

  DM.CriarConsulta(qyStatusNN);

  // Busca a ação de remessa
  acaoRemessa := objRemessa.getAcaoRemessa(tarBaixa);

  // Busca a situação de todos os NN das mensalidades enviadas
  mensalidadesAgrupadas.Delimiter := ',';
  mensalidadesAlterouConta.Delimiter := ',';

  qyStatusNN.Close;
  qyStatusNN.SQL.Text := SQL_STATUS_NN;

  qyStatusNN.SQL.Text := ReplaceStr( qyStatusNN.SQL.Text, ':cd_mensalidades', mensalidadesAgrupadas.DelimitedText );

  if mensalidadesAlterouConta.Count > 0 then
  begin
    qyStatusNN.SQL.Text := ReplaceStr( qyStatusNN.SQL.Text, ':cd_mensa_alterou_conta', mensalidadesAlterouConta.DelimitedText );
  end;
  qyStatusNN.SQL.Text := ReplaceStr( qyStatusNN.SQL.Text, ':cd_mensa_alterou_conta', '-1' );

  qyStatusNN.ParamByName('cd_layout').AsInteger := boleto.cdLayout;
  qyStatusNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();

  qyStatusNN.Open;

  // Inicia como se nenhum NN possui registro
  possuiRegistro := false;
  possuiFila := false;
  possuiNNRejeitadoSemEnvio := false;
  possuiBaixa := false;
  possuiNNDiferentes := false;
  possuiAlteracaoConta := false;
  possuiOutrasMensaComMesmoNN := false;
  nossoNumeroValido := '';

  // Define o primeiro NN da lista
  nossoNumero := qyStatusNN.FieldByName('nr_nossonumero').AsString;

  {
    Primeiro verifica dentro os títulos impressos se algum deles:
    - Está registrado (R,E)
    - Está na fila para remessa (F,R)
    - Possui NN diferente dos demais (impresso em outra ocasião)
    - Alterada a conta de impressão
    - Busca um NN válido (esteja em Fila e sem alteração conta)
  }
  while not qyStatusNN.Eof do
  begin
    dsSituacao := qyStatusNN.FieldByName('ds_situacao').AsString;
    situacaoNN := objRemessa.getSituacaoNossoNumero(dsSituacao);

    // Confere se a situação do NN é REGISTRADO ou EXPORTADO
    if (situacaoNN = snnRegistrado) or
       (situacaoNN = snnExportado) then
    begin
      possuiRegistro := true;
    end;

    // Confere se a situação do NN é FILA ou REJEITADO
    if (situacaoNN = snnFila) or
       (situacaoNN = snnRejeitado) then
    begin
      possuiFila := true;
    end;

    // Se o NN está com status de rejeitado e NÃO possui envio na fila
    if (situacaoNN = snnRejeitado) and
       (qyStatusNN.FieldByName('sn_possui_envio_fila').AsInteger = 0) then
    begin
      possuiNNRejeitadoSemEnvio := true;
    end;

    // Confere se a situação do NN é BAIXADA ou LIQUIDADO SEM REGISTRO
    // ou possui ação de baixa na fila de remessa
    if (situacaoNN = snnBaixado) or
       (situacaoNN = snnLiquidadoSemRegistro) or
       (qyStatusNN.FieldByName('sn_baixa_registrada').AsInteger = 1) then
    begin
      possuiBaixa := true;
    end;

    // Confere se algum NN é diferente dos demais
    if nossoNumero <> qyStatusNN.FieldByName('nr_nossonumero').AsString then
    begin
      possuiNNDiferentes := true;
    end;

    // Confere se alguma conta foi alterada durante a impressão
    if qyStatusNN.FieldByName('sn_alterou_conta').AsInteger = 1 then
    begin
      possuiAlteracaoConta := true;
    end;

    // Confere se existe alguma outra mensalidade (que não está sendo impressa)
    // com o mesmo NN das mensalidades impressas
    if qyStatusNN.FieldByName('sn_outras_mensa_com_mesmo_nn').AsInteger = 1 then
    begin
      possuiOutrasMensaComMesmoNN := true;
    end;

    {
      Verifica se é possível reaproveitar um NN de uma mensalidade que estiver
      na fila ou rejeitada, somente fazer isso se a mensalidade não possuir NN
      diferentes ou for de contas diferentes, pois pode ser NN de outra conta
      e o NN não pode estar baixado e não possuir outras mensalidades com o
      mesmo NN e possui um NN valido e possui um NN valido (não utilizado por
      outras mensalidades)
    }
    if (nossoNumeroValido = '') and
       (not possuiNNDiferentes) and (not possuiAlteracaoConta) and
       (not possuiBaixa) and (not possuiOutrasMensaComMesmoNN) and
       ((situacaoNN = snnFila) or
        (situacaoNN = snnRejeitado) or
        (qyStatusNN.FieldByName('sn_nossonumero_ja_gerado').AsInteger = 1)) then
    begin
      nossoNumeroValido := qyStatusNN.FieldByName('nr_nossonumero').AsString
    end;

    qyStatusNN.Next();
  end;

  {
    Realiza a lógica de remessa para impressão
    1) Verifica se NN possui registro
    (S) Verifica se alterou dados criticos ou títulos possuem NN diferentes,
        possui alteração de conta ou NN está baixado
        (S) Pedido de baixa dos NN registrados, ignora os não registrados,
            pega NN válido (ou gera novo) e inclui na remessa
        (N) Verifica se alterou somente o vencimento e/ou descontos e/ou resp
            (S) Pedido de alteração de vecnimento e/ou descontos do NN
            (N) Apenas reimpressão (não faz nada)
    (N) Tenta o 2 ou 3, senão o 3
    2) Verifica se está na fila para remessa (F, J)
        (S) Verifica se alterou qualquer dado ou títulos possuem NN diferentes,
            possui alteração de conta ou NN está baixado
            (S) Ignora os NN não registrados, pega NN válido (ou gera novo)
                e inclui na remessa
            (N) Apenas reimpressão (não faz nada)
        (N) Apenas reimpressão (não faz nada)
    3) É uma impressão nova, gera nosso número e inclui na remessa
  }

  registrarRemessa := false;

  nossoNumeroProcessado := TStringList.Create;

  qyStatusNN.First;
  while not qyStatusNN.Eof do
  begin

    // Pega o NN que está varrendo no momento
    nossoNumero := qyStatusNN.FieldByName('nr_nossonumero').AsString;
    // Pega a situação do NN que está varrendo
    dsSituacao := qyStatusNN.FieldByName('ds_situacao').AsString;

    // Não processa NN que já foram processas anteriormente
    if nossoNumeroProcessado.IndexOf(nossoNumero) >= 0 then
    begin
      qyStatusNN.Next();
      continue;
    end;

    // Add o NN como processado
    nossoNumeroProcessado.Add(nossoNumero);

    // Se algum NN possui registro
    if possuiRegistro then
    begin

      // Verifica se alterou a conta ou algum dado crítico ou possuem NN diferentes
      if possuiNNDiferentes or possuiAlteracaoConta or possuiBaixa then
      begin
        self.baixaNNAnterioresGeraNN(nossoNumero, dsSituacao, nossoNumeroValido, boleto);
        registrarRemessa := true;
        
        qyStatusNN.Next();
        continue;
      end;

      // Verifica se a remessa do NN enviada é igual a última, caso contrário
      // quais informações são diferentes
      igualUltimaEnvio := objRemessa.ehRemessaIgualUltimoEnvio(
        nossoNumero, boleto.cdLayout, boleto.cdResponsavel, boleto.dtVencimento,
        boleto.vlNominal, boleto.vlDesconto,
        snDiffVencimento, snDiffDesconto, snDiffResponsavel, snDiffOutro
      );

      // Se for igual ao útlimo envio, apenas reimpressão não faz nada
      if igualUltimaEnvio then
      begin
        qyStatusNN.Next();
        continue;
      end;

      // Verifica se alterou a conta ou algum dado crítico
      if snDiffOutro then
      begin
        self.baixaNNAnterioresGeraNN(nossoNumero, dsSituacao, nossoNumeroValido, boleto);
        registrarRemessa := true;

        qyStatusNN.Next();
        continue;
      end else
      begin

        // Se possui alguma alteração de responsável, desconto ou vencimento
        // Busca se existe a ação a ser realizada já na fila para envio
        if snDiffVencimento or snDiffDesconto or snDiffResponsavel then
        begin

          if snDiffVencimento then
          begin
            acaoRemessaNaFila := objRemessa.verificaAcaoEstaFila(nossoNumero, tarProrrogar);
          end;

          if (not acaoRemessaNaFila) and snDiffDesconto then
          begin
            acaoRemessaNaFila := objRemessa.verificaAcaoEstaFila(nossoNumero, tarDesconto);
          end;

          if (not acaoRemessaNaFila) and snDiffResponsavel then
          begin
            acaoRemessaNaFila := objRemessa.verificaAcaoEstaFila(nossoNumero, tarAlteracaoMensalidade);
          end;

        end;

        // Se a ação de alteração de dados já está na fila para envio
        if acaoRemessaNaFila then
        begin
          // Ignora as ações de alteração que já se encontram na fila e adiciona
          // as ações novamente, com valores atualizados
          objRemessa.ignorarRemessaAlteracaoDados(nossoNumero);

          // Recupera as informações atualizadas da mensalidade para efetuar os novos registros
          // e quais as diferenças da impressão atual com o registro atual 
          igualUltimaEnvio := objRemessa.ehRemessaIgualUltimoEnvio(
            nossoNumero, boleto.cdLayout, boleto.cdResponsavel, boleto.dtVencimento,
            boleto.vlNominal, boleto.vlDesconto,
            snDiffVencimento, snDiffDesconto, snDiffResponsavel, snDiffOutro
          );
        end;

        // Inicializa as variaveis que identificam se foi possível enviar os pedidos de alterações
        enviouAltVencimento := True;
        enviouAltDesconto := True;
        enviouAltOutrosDados := True;

        // Verifica se houve alteração do vencimento
        if snDiffVencimento then
        begin
          enviouAltVencimento := objRemessa.enviaAlteracaoVencimento(nossoNumero, boleto.dtVencimento, boleto.cdBoleto);
        end;

        // Verifica se houve alteração de desconto
        if snDiffDesconto then
        begin
          enviouAltDesconto := objRemessa.enviaAlteracaoDesconto(nossoNumero, boleto.vlDesconto, boleto.cdBoleto);
        end;

        // Verifica se houve alteração de responsável
        if snDiffResponsavel then
        begin
          enviouAltOutrosDados := objRemessa.enviaAlteracaoOutrosDados(nossoNumero, boleto.cdResponsavel, boleto.cdBoleto);
        end;

        {
          Se houve modificação de vencimento, desconto ou responsável e não foi possível
          enviar o pedido de alteração (porque não está configurado a ação de envio).
          A ação pode não estar configurada porque o banco não aceita essas instruções,
          nesse caso o sistema envia um pedido de baixa e registra um novo NN
        }
        if (snDiffVencimento and not enviouAltVencimento) or
           (snDiffDesconto and not enviouAltDesconto) or
           (snDiffResponsavel and not enviouAltOutrosDados) then
        begin
          self.baixaNNAnterioresGeraNN(nossoNumero, dsSituacao, nossoNumeroValido, boleto);
          registrarRemessa := true;

          qyStatusNN.Next();
          continue;
        end;

      end;

    // Verifica se algum NN está na fila ou rejeitado
    end else if possuiFila then
    begin

      // Verifica se alterou a conta ou algum dado crítico ou possuem NN diferentes
      if possuiNNDiferentes or possuiAlteracaoConta or possuiBaixa then
      begin
        self.baixaNNAnterioresGeraNN(nossoNumero, dsSituacao, nossoNumeroValido, boleto);
        registrarRemessa := true;

        qyStatusNN.Next();
        continue;
      end;

      // Verifica se a remessa do NN enviada é igual a última, caso contrário
      // quais informações são diferentes
      igualUltimaEnvio := objRemessa.ehRemessaIgualUltimoEnvio(
        nossoNumero, boleto.cdLayout, boleto.cdResponsavel, boleto.dtVencimento,
        boleto.vlNominal, boleto.vlDesconto,
        snDiffVencimento, snDiffDesconto, snDiffResponsavel, snDiffOutro
      );

      // Se for igual ao útlimo envio e o último envio possui arquivo rejeitado
      // sem envios na fila
      if igualUltimaEnvio and possuiNNRejeitadoSemEnvio then
      begin
        // Adiciona novamente na fila para envio o NN rejeitado
        // (pode ser uma reimpressão para corrigir alguma informação)
        registrarRemessa := true;

        qyStatusNN.Next();
        continue;
      // Se for igual ao útlimo envio, apenas reimpressão não faz nada
      end else if igualUltimaEnvio then
      begin
        qyStatusNN.Next();
        continue;
      end;

      // Qualquer diferença nesse caso ignora o NN anterior
      self.baixaNNAnterioresGeraNN(nossoNumero, dsSituacao, nossoNumeroValido, boleto);
      registrarRemessa := true;

    // Primeira impressão então gera novo NN e inclue na remessa
    end else begin

      // Se não possui NN para reaproveitar, gera um novo
      if nossoNumeroValido = '' then
      begin
        nossoNumeroValido := DM.NovoNumero(
          0, '', 0, 0,
          boleto.cdConta,
          boleto.cdColigada,
          boleto.cdPessoa,
          Copy(DateTimeToStr(boleto.dtVencimento), 3, 2),
          Copy(FormatDateTime('yyyy-mm-dd', DataHoje), 3, 2)
        );
      end;

      registrarRemessa := true;

    end;

    qyStatusNN.Next();
  end;

  // Se não foi definido um nosso número válido é porque ele não foi alterado
  // nesse caso pega o que já existia
  if nossoNumeroValido = '' then
  begin
    nossoNumeroValido := nossoNumero;
  end;

  // Atualiza dados das mensalidades (nossonumero, cd_boleto)
  self.atualizaMensalidade(mensalidadesAgrupadas, nossoNumeroValido, boleto);

  // Verifica se deve registrar uma nova remessa para o NN
  if registrarRemessa then
  begin
    // Registrar remessa do nosso número
    objRemessa.registraAcaoEnvio(
      nossoNumeroValido,
      boleto.cdLayout,
      boleto.cdResponsavel,
      boleto.cdBoleto,
      boleto.dtVencimento,
      boleto.vlNominal,
      boleto.vlDesconto,
      mensalidadesAgrupadas
    );
  end;

  // Retorna o nosso número gerado para remessa
  Result := nossoNumeroValido;

  // Liberar a memória utilizada
  FreeAndNil(qyStatusNN);
end;

function TfrmRepBloquetos.PrepararBloquetosParaImpressao(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true; DataBoleto : TDateTime = 0; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = ''; preparaBoletoImpressao: TPreparaBoleto = pbImpressaoPadrao ) : Boolean;
begin

  // Se for o novo processo de remessa configurado
  if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
  begin
    Result := PrepararBloquetosRemessaNova(sFiltro, Agrupado, ContaImpressao, bPerguntar, DataBoleto, ds_filtro_boletos, cd_tipo_titulo, preparaBoletoImpressao);

  // Para o processo de remessa antigo, verificar se é impressão preparada padrão
  end else if preparaBoletoImpressao = pbImpressaoPadrao then
  begin
    Result := PrepararBloquetosRemessaAntiga(sFiltro, Agrupado, ContaImpressao, bPerguntar, DataBoleto, ds_filtro_boletos, cd_tipo_titulo);

  // Para o processo de remessa antigo, verificar se é impressão preparada para empresa    
  end else if preparaBoletoImpressao = pbImpressaoEmpresa then
  begin
    Result := frmRepBloquetos.PrepararBloquetosParaEmpresa(sFiltro, Agrupado, ContaImpressao, ds_filtro_boletos, cd_tipo_titulo);

  // Para o processo de remessa antigo, verificar se é impressão preparada para aluno
  end else if preparaBoletoImpressao = pbImpressaoAluno then
  begin
    Result := frmRepBloquetos.PrepararBloquetosParaAluno(sFiltro, Agrupado, ContaImpressao, ds_filtro_boletos, cd_tipo_titulo);

  end;
  
end;

{
  Nova função para preparar os boletos para impressão (utiliza novo modelo remessa)
  PASSO 1) Percorre todos os títulos que serão impressos
    - Realiza o cancelamento de DDA (se optado pelo usuário)
    - Realiza o ajuste do caixa (troca de conta) das mensalidades
      impressas (solicita autorização do usuário)
  PASSO 2)
    - Monta novamente a consulta para verificar se deve padronizar os dias de
      vencimento das mensalidades, acrescentando como filtro o caixa escolhido
      para impressão (traz somente mensalidades desse caixa)
    - Padroniza os dias de vencimento das mensalidades
      (solicita autorização do usuário)
  PASSO 3) Inclusão na fin_boleto e geração da remessa (geração NN)
    - Agrupa os títulos (que devem ser agrupados) insere na fin_boletos
      e realiza a lógica de geração da remessa sobre os títulos agrupados
    - Grava log das ações realizadas
}

function TfrmRepBloquetos.PrepararBloquetosRemessaNova(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true; DataBoleto : TDateTime = 0; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = ''; preparaBoletoImpressao: TPreparaBoleto = pbImpressaoPadrao ) : Boolean;
const
  SQL_BOLETOS_IMPRIMIR_CAMPOS =
    ' SELECT DISTINCT ' +
    '     m2.cd_mensalidade, m2.cd_caixa, m2.cd_coligada, m2.datavencimento, '+
    '     m2.parcela, m2.anosemestre, m2.turma, m2.codigoaluno, m2.nossonumero, '+
    '     m2.cd_resp, a.nm_pessoa nome, tt.ds_tipo_titulo, c2.ds_caixa, '+
    // verificar a conta padrão para impressão do boleto (ou da turma, ou do departamento)
    '     CASE WHEN COALESCE(t.cd_caixa,0) > 0 THEN t.cd_caixa '+
    '          ELSE d.cd_boleto_padrao END cd_boleto_padrao, '+
    // verificar se pode alterar a conta padrão, ou da turma ou do departamento
    '     CASE WHEN COALESCE(t.cd_caixa,0) > 0 THEN t.sn_alterar_boleto '+
    '          ELSE d.sn_alterar_boleto END sn_alterar_boleto, ' ;

  SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO =
    ' CONCAT(COALESCE(m2.cd_resp, m2.codigoaluno), m2.codigoaluno, DATE_FORMAT(m2.datavencimento,"%Y-%m-%d"), '+
    '   COALESCE(tt.ds_grupo_boleto, "A")) ds_grupo_boleto ';

  SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO_EMPRESA =
    ' CONCAT(COALESCE(m2.cd_resp, m2.codigoaluno), DATE_FORMAT(m2.datavencimento,"%Y-%m-%d"), '+
    '   COALESCE(tt.ds_grupo_boleto, "A")) ds_grupo_boleto ';

  SQL_BOLETOS_IMPRIMIR_CAMPO_DESAGRUPADO =
    ' CONCAT("A",m2.cd_mensalidade) ds_grupo_boleto ';

  SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO =
    ' FROM '+
    '     mensalidades m ' +
    '     INNER JOIN mensalidades m2 ON ( '+
    '         m.codigoaluno = m2.codigoaluno AND '+
    '         m.datavencimento = m2.datavencimento AND '+
    '         m2.situacao IN (2,10) AND  '+
    '         COALESCE(m.cd_resp, m.codigoaluno) = COALESCE(m2.cd_resp, m2.codigoaluno) '+
    '     ) ' +
    '     INNER JOIN fin_tipos_titulo tt1 ON ( '+
    '         m.cd_tipo_titulo = tt1.cd_tipo_titulo AND '+
    '         m.cd_coligada = tt1.cd_coligada '+
    '     ) ' +
    '     INNER JOIN fin_tipos_titulo tt ON ( '+
    '         m2.cd_tipo_titulo = tt.cd_tipo_titulo AND '+
    '         m2.cd_coligada = tt.cd_coligada AND ' +
    '         COALESCE(tt1.ds_grupo_boleto, "A") = COALESCE(tt.ds_grupo_boleto, "A") AND '+
    '         tt1.cd_coligada_matriz = tt.cd_coligada_matriz '+
    '     ) ' ;

  SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO_ALUNO =
    ' FROM '+
    '     mensalidades m ' +
    '     INNER JOIN mensalidades m2 ON ( '+
    '         m.codigoaluno = m2.codigoaluno AND '+
    '         m.datavencimento = m2.datavencimento AND '+
    '         m2.situacao IN (2,10) '+
    '     ) ' +
    '     INNER JOIN fin_tipos_titulo tt1 ON ( '+
    '         m.cd_tipo_titulo = tt1.cd_tipo_titulo AND '+
    '         m.cd_coligada = tt1.cd_coligada '+
    '     ) ' +
    '     INNER JOIN fin_tipos_titulo tt ON ( '+
    '         m2.cd_tipo_titulo = tt.cd_tipo_titulo AND '+
    '         m2.cd_coligada = tt.cd_coligada AND ' +
    '         COALESCE(tt1.ds_grupo_boleto, "A") = COALESCE(tt.ds_grupo_boleto, "A") AND '+
    '         tt1.cd_coligada_matriz = tt.cd_coligada_matriz '+
    '     ) ';

  SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO_EMPRESA =
    ' FROM '+
    '     mensalidades m ' +
    '     INNER JOIN mensalidades m2 ON ( '+
    '         m.datavencimento = m2.datavencimento AND '+
    '         m2.situacao IN (2,10) AND  '+
    '         m.cd_resp = m2.cd_resp '+
    '     ) ' +
    '     INNER JOIN fin_tipos_titulo tt1 ON ( '+
    '         m.cd_tipo_titulo = tt1.cd_tipo_titulo AND '+
    '         m.cd_coligada = tt1.cd_coligada '+
    '     ) ' +
    '     INNER JOIN fin_tipos_titulo tt ON ( '+
    '         m2.cd_tipo_titulo = tt.cd_tipo_titulo AND '+
    '         m2.cd_coligada = tt.cd_coligada AND ' +
    '         COALESCE(tt1.ds_grupo_boleto, "A") = COALESCE(tt.ds_grupo_boleto, "A") AND '+
    '         tt1.cd_coligada_matriz = tt.cd_coligada_matriz '+
    '     ) ' ;

  SQL_BOLETOS_IMPRIMIR_TABELAS_DESAGRUPADO =
    ' FROM '+
    '     mensalidades m ' +
    '     INNER JOIN mensalidades m2 ON (m.cd_mensalidade = m2.cd_mensalidade) ' +
    '     INNER JOIN fin_tipos_titulo tt ON ( '+
    '         m2.cd_tipo_titulo = tt.cd_tipo_titulo AND '+
    '         m2.cd_coligada = tt.cd_coligada '+
    '     ) ';

   SQL_BOLETOS_IMPRIMIR_TABELAS =
    '     INNER JOIN departamentos d ON (d.codigo = m2.depto) '+
    '     INNER JOIN pessoas a ON (m2.codigoaluno = a.cd_pessoa) '+
    '     INNER JOIN turmas t ON (t.codigo = m2.turma AND t.anosemestre = m2.anosemestre ) '+
    '     INNER JOIN coligadas coo ON ( coo.cd_coligada = t.cd_coligada ) '+
    '     INNER JOIN coligadas_matriz cm ON ( coo.cd_coligada_matriz = cm.cd_coligada ) '+
    '     INNER JOIN fin_cadastro_contas c ON (c.cd_caixa = :cd_caixa) '+
    '     LEFT JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa) '+
    '     LEFT JOIN fin_cadastro_contas c2 ON (c2.cd_caixa = m2.cd_caixa) ' +
    '     LEFT JOIN pessoas_debito_automatico as pda ON (pda.cd_pessoa =  m2.codigoaluno AND pda.sn_autoriza_debito = 1) '  +
    ' WHERE '+
    '     c.sn_ativa = "S" AND '+
    '     pda.cd_pessoa IS NULL AND ' + // Somente se não tem debito automatico
    '     m.situacao IN (2,10) AND '+
     // A linha abaixo vai selecionar somente a mensalidade somente se a conta padrão do departamento/turma for a conta que está sendo impressa
     // ou se a opção sn_alterar_boleto no departamento/turma estiver setada como 1 (pode mudar a conta do boleto)
    '     ( '+
    '       (CASE WHEN COALESCE(t.cd_caixa, 0) > 0 THEN t.cd_caixa ELSE d.cd_boleto_padrao END = :cd_caixa) OR '+
    '       (CASE WHEN COALESCE(t.cd_caixa, 0) > 0 THEN t.sn_alterar_boleto ELSE d.sn_alterar_boleto END = 1) '+
    '     ) AND ' +
    // As linhas abaixo não selecionarão mensalidades que possuem DDA na fila de envio desde que estejam canceladas
    ' NOT EXISTS ( ' +
    '     SELECT ' +
    '         re.cd_envio ' +
    '     FROM ' +
    '         rem_envios re ' +
    '         INNER JOIN rem_ocorrencias ro ON (re.cd_ocorrencia = ro.cd_ocorrencia AND ro.cd_layout = re.cd_layout) ' +
    '         INNER JOIN rem_acoes ra ON (ro.cd_acao = ra.cd_acao) ' +
    '         LEFT JOIN rem_envios re2 ON ( '+
    '             re2.nr_nossonumero = re.nr_nossonumero AND '+
	 '             re2.cd_layout = re.cd_layout AND '+
	 '             re2.sn_ignorado = 0 AND '+
	 '             re2.cd_envio <> re.cd_envio AND '+
	 '             re2.cd_ocorrencia = ( '+
	 '	               SELECT '+
	 '		               sub_ro.cd_ocorrencia '+
	 '	               FROM '+
	 '		               rem_acoes sub_ra '+
	 '		               INNER JOIN rem_ocorrencias sub_ro ON (sub_ra.cd_acao = sub_ro.cd_acao) '+
	 '	               WHERE '+
	 '		               sub_ra.ds_chave = "cancelar_dda" AND sub_ro.cd_layout = re.cd_layout '+
	 '             ) '+
    '          ) '+
    '     WHERE ' +
    '         re.nr_nossonumero = m.nossonumero AND ' +
    '         re.sn_ignorado = 0 AND ' +
    '         ro.sn_ativo = 1 AND ' +
    '         ra.ds_chave = "incluir_dda" AND ' +
    '         ISNULL(re2.cd_layout) ' +
    ' ) ';

  SQL_BOLETOS_IMPRIMIR_IGNORAR_DDA =
    '     AND a.cd_pessoa NOT IN (SELECT cd_pessoa FROM pessoas_debito_automatico WHERE sn_autoriza_debito = 1) ';

  SQL_BOLETOS_IMPRIMIR_FILTRO_DT_VENCIMENTO =
    '     AND ( '+
    '           (cm.sn_bloquear_boleto = 1 AND m.datavencimento <= cm.dt_bloqueio_boleto) OR '+
    '           (cm.sn_bloquear_boleto != 1) OR '+
    '           (cm.sn_bloquear_boleto IS NULL) '+
    '     ) ';

  SQL_BOLETOS_IMPRIMIR_ORDER =
    ' ORDER BY '+
    '     m.codigoaluno, m.datavencimento, COALESCE(tt.ds_grupo_boleto, "A"), m2.nossonumero = "", m2.valorbruto DESC ';

  SQL_BOLETOS_IMPRIMIR_ORDER_ALUNO =
    ' ORDER BY '+
    '     m.codigoaluno, m.datavencimento, COALESCE(tt.ds_grupo_boleto, "A"), m2.nossonumero = "", m2.valorbruto DESC ';

  SQL_BOLETOS_IMPRIMIR_ORDER_EMPRESA =
    ' ORDER BY '+
    '     m.cd_resp, m.datavencimento, COALESCE(tt.ds_grupo_boleto, "A"), m2.nossonumero = "", m2.valorbruto DESC ';

var
  cdConta, imprimirBoletoOutraConta,
  cdPessoaResp, nrDiaVencimento,
  padronizarDiaVencimento: integer;

  nrDia, nrMes, nrAno: word;

  nossoNumero, chaveLog,
  textMensagem, grupoBoleto,
  nrNossoNumeroAnterior: string;

  mensalidadesAlterouConta,
  mensalidadesAgrupadas,
  logsImpressaoNN: TStringList;

  boleto: TBoleto;

  logImpressao: TLogImpressaoNN;

  qyAtualizarMensalidade: TUMZQuery;
begin

  // Verifica se o objeto remessa ainda não está criado
  // Nesse caso inicializa o mesmo
  if not Assigned(objRemessa) then
  begin
    objRemessa := TRemessa.Create;
  end;

  {
    A variável bPerguntar indica se deve apresentar mensagens/perguntas ao usuários
    Nesse caso se for false, assume a resposta padrão "sim para todos" quando estiver
    imprimindo boletos em outra conta
  }
  if bPerguntar = false then
  begin
    imprimirBoletoOutraConta := mrYesToAll;
  end;

  // Verificações sobre a conta de impressão repassada
  if not self.verificaContaImpressao(ContaImpressao, bPerguntar, cdConta) then
  begin
    Mensagem('Não foi possível identificar a conta de impressão do boleto', 'UNIMESTRE', MB_OK + MB_ICONWARNING, Handle);
    Result := false;
    Exit;
  end;
  
  {
    Começa a montar o SQL com todos os boletos que podem ser impressos nessa
    conta, o SQL já exclui dos filtros as mensalidades cujo departamento
    obriga a imprimir em conta diferente.
    departamentos.cd_boleto_padrao + departamentos.sn_alterar_boleto = 0
  }

  tblBloquetos.Close();

  tblBloquetos.SQL.Text := SQL_BOLETOS_IMPRIMIR_CAMPOS;

  // Se o prepara boleto para impressão for padrão
  if preparaBoletoImpressao = pbImpressaoPadrao then
  begin

    // Verifica se é boleto agrupado, para montar o SQL de acordo
    if Agrupado then
    begin
      // Prepara o campo de agrupamento para lógica de agrupamento do boleto
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO);
      // Tabelas que contenham todas as mensalidades do mesmo aluno, com o mesmo vencimento
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO);
    end else begin
      // Prepara o campo de agrupamento para lógica de agrupamento do boleto
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_DESAGRUPADO);
      // Liga com a própria mensalidade para possuir alias m2 sem alterar a lógica
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_DESAGRUPADO);
    end;

  // Se está preparando um boleto para impressão de aluno
  end else if preparaBoletoImpressao = pbImpressaoAluno then
  begin

    // Prepara o campo de agrupamento para lógica de agrupamento do boleto de aluno
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO);
    // Tabelas que contenham todas as mensalidades do mesmo aluno, com o mesmo vencimento
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO_ALUNO);

  // Se está preparando um boleto para impressão de empresa
  end else if preparaBoletoImpressao = pbImpressaoEmpresa then
  begin

    // Prepara o campo de agrupamento para lógica de agrupamento do boleto de empresa
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO_EMPRESA);
    // Tabelas que contenham todas as mensalidades do mesmo responsável, com o mesmo vencimento
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO_EMPRESA);

  end;


  // Adiciona as demais tabelas ao SQL dos boletos
  tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS);

  // Se foi repassado um filtro de boletos adicionais, inclui o mesmo no SQL
  if (ds_filtro_boletos <> '') then
  begin
    tblBloquetos.SQL.Add(' AND (' + ds_filtro_boletos + ') ' );
  end;

  // Verifica se deve ignorar pessoas com DDA
  if self.verificaIgnoraDDA(cdConta) then
  begin
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_IGNORAR_DDA);
  end;

  // Adiciona outros filtros repassados por parâmetro
  tblBloquetos.SQL.Add(' AND ' + sFiltro );
  
  // Adiciona o filtro de data de vencimento
  tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_FILTRO_DT_VENCIMENTO);

  // Se o prepara boleto para impressão for padrão
  // Esta ordem é importante para bloquetos agrupados
  if preparaBoletoImpressao = pbImpressaoPadrao then
  begin
    tblBloquetos.SQL.Add( SQL_BOLETOS_IMPRIMIR_ORDER );

  end else if preparaBoletoImpressao = pbImpressaoAluno then
  begin
    tblBloquetos.SQL.Add( SQL_BOLETOS_IMPRIMIR_ORDER_ALUNO );

  // Se está preparando um boleto para impressão de empresa
  end else if preparaBoletoImpressao = pbImpressaoEmpresa then
  begin
    tblBloquetos.SQL.Add( SQL_BOLETOS_IMPRIMIR_ORDER_EMPRESA );

  end;

  // Seta o caixa que será impresso no SQL 
  tblBloquetos.ParamByName('cd_caixa').AsInteger := cdConta;

  // Executa o SQL que retorna os boletos para impressão
  tblBloquetos.Open();

  // Verifica se o SQL possui resultados, caso não apresenta mensagem ao
  // usuário se o parâmetro bPerguntar for verdadeiro
  if tblBloquetos.IsEmpty and bPerguntar then
  begin
    Mensagem('Não foi possível selecionar os dados para impressão dos boletos. O filtro selecionado não encontrou nenhum título.', 'Atenção', MB_OK + MB_ICONWARNING);
    Result := false;
    Exit;
  end;

  {
    PASSO 1) Percorre todos os títulos que serão impressos
    - [TODO] Realiza o cancelamento de DDA (se optado pelo usuário)
    - Realiza o ajuste do caixa (troca de conta) das mensalidades
      impressas (solicita autorização do usuário)
  }
  mensalidadesAlterouConta := TStringList.Create;
  DM.CriarConsulta(qyAtualizarMensalidade);

  tblBloquetos.Filter := 'cd_caixa <> '+IntToStr(cdConta);
  tblBloquetos.Filtered := True;

  while not tblBloquetos.Eof do
  begin

    {
    // Realiza as verificações e cancelamento de DDA caso necessário (com ações de remessa)
    // O sistema ainda não está realizando essas verificações na remessa nova, portanto,
    // comentei essa parte de momento e elas serão implementadas no chamado do DDA,
    // verificar como otimizar a performance quando forem implementadas, possívelmente ela
    // vai sair desse local
    self.realizaCancelamentoDDA(
      tblBloquetos.FieldByName('cd_mensalidade').AsInteger,
      tblBloquetos.FieldByName('parcela').AsInteger,
      tblBloquetos.FieldByName('nome').AsString
    );
    }

    // A cada mensalidade percorrida, verificar se a conta é diferente da selecionada
    if (tblBloquetos.FieldByName('cd_caixa').AsInteger <> cdConta) then
    begin

      // Verificar se este boleto já foi impresso em outra conta e
      // ainda não foi definida uma opção padrão
      if (tblBloquetos.FieldByName('cd_caixa').AsInteger > 0) and
         (imprimirBoletoOutraConta <> mrYesToAll) and
         (imprimirBoletoOutraConta <> mrNoToAll) then
      begin

           // Pedir autorização para TROCAR a conta do boleto
           textMensagem := 'Você está alterando a conta de impressão do boleto de: ' + CHR(13) + CHR(13);
           textMensagem := textMensagem + '      ' + tblBloquetos.FieldByName('nome').AsString + CHR(13);
           textMensagem := textMensagem + '      ' + 'Parcela: ' + tblBLoquetos.FieldByName('parcela').AsString + ' - ' + tblBloquetos.FieldByName('ds_tipo_titulo').AsString + CHR(13);
           textMensagem := textMensagem + '      ' + 'Vencimento: ' + FormatDateTime('dd/mm/yyyy', tblBloquetos.FieldByName('datavencimento').AsDateTime) + CHR(13);
           textMensagem := textMensagem + '      ' + 'Nosso Número: ' + tblBloquetos.FieldByName('nossonumero').AsString + CHR(13) + CHR(13);
           textMensagem := textMensagem + 'que já havia sido impresso na conta ' + tblBloquetos.FieldByName('ds_caixa').AsString + '.' + CHR(13) + 'Tem certeza que deseja alterar a conta?';

           imprimirBoletoOutraConta := MensagemCustomizavel(textMensagem, mtConfirmation, [mbYes, mbYesToAll, mbNo, mbNoToAll], ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'], 97 );
      end;

      // Verifica se o usuário autorizou imprimir o boleto em outra conta ou
      // ainda não possui uma conta definida
      if ((imprimirBoletoOutraConta <> mrCancel) and
          (imprimirBoletoOutraConta <> mrNo) and
          (imprimirBoletoOutraConta <> mrNoToAll)) or
          (tblBloquetos.FieldByName('cd_caixa').AsInteger = 0) then
      begin

        // Efetuar alteração individual de cada mensalidade, mesmo em caso de agrupamento
        // Guardar o log de alteração de nosso números individuais
        chaveLog := FillString(tblBloquetos.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                 tblBloquetos.FieldByName('anosemestre').AsString + ';' + tblBloquetos.FieldByName('turma').AsString + ';' +
                 tblBloquetos.FieldByName('parcela').AsString + ';' +
                 FormatDateTime('dd/mm/yyyy',tblBloquetos.FieldByName('datavencimento').AsDateTime) + ';';

        // Adicionar essa mensalidade como uma mensalidade que o usuário trocou a conta
        mensalidadesAlterouConta.Add(tblBloquetos.FieldByName('cd_mensalidade').AsString);

        // Altera a conta e o nosso número da mensalidade
        qyAtualizarMensalidade.SQL.Text :=
          ' UPDATE mensalidades SET cd_caixa = :cd_caixa ' +
          ' WHERE cd_mensalidade = :cd_mensalidade ';

        qyAtualizarMensalidade.ParamByName('cd_caixa').AsInteger := cdConta;
        qyAtualizarMensalidade.ParamByName('cd_mensalidade').AsInteger := tblBloquetos.FieldByName('cd_mensalidade').AsInteger;

        qyAtualizarMensalidade.ExecSQL();

        DM.setLog(2013, 'alteracao', chaveLog, tblBloquetos.FieldByName('cd_coligada').AsInteger,
                  'Troca de conta da mensalidade '+tblBloquetos.FieldByName('cd_mensalidade').AsString+
                  '. Conta antiga: '+tblBloquetos.FieldByName('cd_caixa').AsString+' Conta nova: '+IntToStr(cdConta)+')' );

      end;

    end;  

    tblBloquetos.Next();
  end;

  // Reseta os filtros da query
  tblBloquetos.Filter := '';
  tblBloquetos.Filtered := False;

  // Fecha a consulta de boletos
  tblBloquetos.Close();

  {
    PASSO 2)
    - Monta novamente a consulta para verificar se deve padronizar os dias de
      vencimento das mensalidades, acrescentando como filtro o caixa escolhido
      para impressão (traz somente mensalidades desse caixa)
    - Padroniza os dias de vencimento das mensalidades
      (solicita autorização do usuário)
  }

  tblBloquetos.SQL.Text := SQL_BOLETOS_IMPRIMIR_CAMPOS;

  // Se o prepara boleto para impressão for padrão
  if preparaBoletoImpressao = pbImpressaoPadrao then
  begin

    // Verifica se é boleto agrupado, para montar o SQL de acordo
    if Agrupado then
    begin
      // Prepara o campo de agrupamento para lógica de agrupamento do boleto
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO);
      // Tabelas que contenham todas as mensalidades do mesmo aluno, com o mesmo vencimento
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO);
    end else begin
      // Prepara o campo de agrupamento para lógica de agrupamento do boleto
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_DESAGRUPADO);
      // Liga com a própria mensalidade para possuir alias m2 sem alterar a lógica
      tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_DESAGRUPADO);
    end;

  // Se está preparando um boleto para impressão de aluno
  end else if preparaBoletoImpressao = pbImpressaoAluno then
  begin

    // Prepara o campo de agrupamento para lógica de agrupamento do boleto de aluno
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO);
    // Tabelas que contenham todas as mensalidades do mesmo aluno, com o mesmo vencimento
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO_ALUNO);

  // Se está preparando um boleto para impressão de empresa
  end else if preparaBoletoImpressao = pbImpressaoEmpresa then
  begin

    // Prepara o campo de agrupamento para lógica de agrupamento do boleto de empresa
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_CAMPO_AGRUPADO_EMPRESA);
    // Tabelas que contenham todas as mensalidades do mesmo responsável, com o mesmo vencimento
    tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS_AGRUPADO_EMPRESA);

  end;

  // Adiciona as demais tabelas ao SQL dos boletos
  tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_TABELAS);

  // Se foi repassado um filtro de boletos adicionais, inclui o mesmo no SQL
  if (ds_filtro_boletos <> '') then
  begin
    tblBloquetos.SQL.Add(' AND (' + ds_filtro_boletos + ') ' );
  end;
  
  // Adiciona outros filtros repassados por parâmetro
  tblBloquetos.SQL.Add(' AND ' + sFiltro );

  // Adiciona o filtro de data de vencimento
  tblBloquetos.SQL.Add(SQL_BOLETOS_IMPRIMIR_FILTRO_DT_VENCIMENTO);
  tblBloquetos.SQL.Add(' AND m2.cd_caixa = :cd_caixa2 ');

  if cd_tipo_titulo <> '' then
  begin
    tblBloquetos.SQL.Add(' AND m.cd_tipo_titulo IN ( ' + cd_tipo_titulo + ' ) ');
  end;

  // Filtra o caixa selecionado na impressão,
  // apenas parcelas com esse caixa serão impressas
  tblBloquetos.ParamByName('cd_caixa').AsInteger := cdConta;
  tblBloquetos.ParamByName('cd_caixa2').AsInteger := cdConta;

  // Se o prepara boleto para impressão for padrão
  // Esta ordem é importante para bloquetos agrupados
  if preparaBoletoImpressao = pbImpressaoPadrao then
  begin
    tblBloquetos.SQL.Add( SQL_BOLETOS_IMPRIMIR_ORDER );

  end else if preparaBoletoImpressao = pbImpressaoAluno then
  begin
    tblBloquetos.SQL.Add( SQL_BOLETOS_IMPRIMIR_ORDER_ALUNO );

  // Se está preparando um boleto para impressão de empresa
  end else if preparaBoletoImpressao = pbImpressaoEmpresa then
  begin
    tblBloquetos.SQL.Add( SQL_BOLETOS_IMPRIMIR_ORDER_EMPRESA );

  end;

  // Se for preparação de boleto de Empresa ou Aluno
  // Solicita se deseja padronizar os dias de vencimento dos títulos de mesmo mês
  if (preparaBoletoImpressao = pbImpressaoAluno) then
  begin

    padronizarDiaVencimento := Mensagem('Atenção' + CHR(13) + CHR(13) +
      ' Você está imprimindo boletos agrupados por aluno.' + CHR(13) +
      ' Os boletos serão agrupados para cada aluno pela data de vencimento.' + CHR(13) + CHR(13) +
      ' Deseja padronizar o dia de vencimento dos títulos de mesmo mês? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION);

  end else if (preparaBoletoImpressao = pbImpressaoEmpresa) then
  begin

    padronizarDiaVencimento := Mensagem('Atenção' + CHR(13) + CHR(13) +
      ' Você está imprimindo boletos agrupados por responsável financeiro.' + CHR(13) +
      ' Os boletos serão agrupados para cada responsável pela data de vencimento.' + CHR(13) + CHR(13) +
      ' Deseja padronizar o dia de vencimento dos títulos de mesmo mês? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION);

  end;

  // Abre novamente a consulta dos boletos para inserir os registros na
  // tabela de Bloquetos e/ou fin_boletos
  tblBloquetos.Open();
  tblBloquetos.FetchAll();

  // Se nenhum registro estiver preparado, ABORTAR a operação de impressão
  if tblBloquetos.Eof and bPerguntar then
  begin
    Mensagem('Nenhum título selecionado pode ser impresso nesta conta.', 'UNIMESTRE', MB_OK+ MB_ICONWARNING, Handle);
    Result := false;
    Exit;
  end;

  // Inicia a pessoa responsável como -1
  cdPessoaResp := -1;

  // Varre as mensalidades que serão impressas e
  // Usuário autorizou padronizar o dia de vencimento do boleto
  while (padronizarDiaVencimento = mrYes) and (not tblBloquetos.Eof) do
  begin

    // Verifica qual o dia de vencimento que deve ser utilizado
    nrDia := 0;
    if (tblBloquetos.FieldByName('cd_resp').AsInteger <> cdPessoaResp) then
    begin
       cdPessoaResp := tblBloquetos.FieldByName('cd_resp').AsInteger;

       // Busca o dia de vencimento configurado no cadastro da pessoa
       if preparaBoletoImpressao = pbImpressaoAluno then
       begin
         nrDiaVencimento := self.getNrDiaVencimentoPessoa(tblBloquetos.FieldByName('codigoaluno').AsInteger);
       end;

       // Busca o dia de vencimento configurado no cadastro da pessoa
       if preparaBoletoImpressao = pbImpressaoEmpresa then
       begin
         nrDiaVencimento := self.getNrDiaVencimentoPessoa(tblBloquetos.FieldByName('cd_resp').AsInteger);
       end;

       // Se não existir um dia de vencimento configurado no cadastro da pessoa
       // utiliza o dia de vencimento da primeira mensalidade
       if nrDiaVencimento = 0 then
       begin
          DecodeDate( tblBloquetos.FieldByName('datavencimento').AsDateTime, nrAno, nrMes, nrDia );
          nrDiaVencimento := nrDia;
       end;
    end;

    // Altera a data de vencimento da parcela
    if nrDia = 0 then
    begin
      self.atualizarDataVencimento(
        tblBloquetos.FieldByName('codigoaluno').AsInteger,
        tblBloquetos.FieldByName('cd_resp').AsInteger,
        nrDiaVencimento,
        tblBloquetos.FieldByName('datavencimento').AsDateTime,
        sFiltro,
        preparaBoletoImpressao
      );
    end;

    tblBloquetos.Next();

  end;


  {
    PASSO 3) Inclusão na fin_boleto e geração da remessa
    - Agrupa os títulos (que devem ser agrupados) em váriavel de controle,
      insere os títulos agrupados na fin_boletos e por fim realiza a lógica de
      geração da remessa sobre os títulos agrupados
    - Grava log das ações realizadas
  }

  // Agrupa os registros pela coluna de agrupamento, para os boletos com mais de
  // uma mensalidade o código de todas estará disponível na coluna de GROUP_CONCAT
  tblBloquetos.Close;
  tblBloquetos.SQL.Text := 'SELECT m.*, '+
                           '  GROUP_CONCAT(m.cd_mensalidade) cd_mensalidades, '+
                           '  GROUP_CONCAT(m.parcela) nr_parcelas '+
                           'FROM ( '+tblBloquetos.SQL.Text + ') m '+
                           'GROUP BY m.ds_grupo_boleto';
  tblBloquetos.Open();
  tblBloquetos.FetchAll();

  // Cria um TStringList para armazenar as mensalidades agrupadas
  mensalidadesAgrupadas := TStringList.Create;
  // Cria um TStringList para armazenar as chaves de logs que serão geradas
  logsImpressaoNN := TStringList.Create;

  // Varre as mensalidades que serão impressas
  while not tblBloquetos.Eof do
  begin

    // Adiciona as mensalidades agrupadas ao StringList (diretamente pelo DelimitedText)
    mensalidadesAgrupadas.Delimiter := ',';
    mensalidadesAgrupadas.DelimitedText := tblBloquetos.FieldByName('cd_mensalidades').AsString;

    // Insere o boleto (fin_boleto)
    boleto := self.inserirBoleto(mensalidadesAgrupadas, DataBoleto, preparaBoletoImpressao);

    // Preparar remessa
    nossoNumero := self.prepararRemessa(mensalidadesAgrupadas, mensalidadesAlterouConta, boleto);

    // Atualiza o nosso número na fin_boletos
    self.atualizaBoleto(boleto, nossoNumero);

    // Cria a chave o log dessa mensalidade
    chaveLog := FillString(tblBloquetos.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
      tblBloquetos.FieldByName('anosemestre').AsString + ';' + tblBloquetos.FieldByName('turma').AsString + ';' +
      tblBloquetos.FieldByName('nr_parcelas').AsString + ';' +
      FormatDateTime('dd/mm/yyyy',tblBloquetos.FieldByName('datavencimento').AsDateTime) + ';';

    // Cria o log de impressão do nosso numero
    logImpressao := TLogImpressaoNN.Create;
    logImpressao.dsChave := chaveLog;
    logImpressao.cdColigada := tblBloquetos.FieldByName('cd_coligada').AsInteger;
    logImpressao.nrNossoNumero := tblBloquetos.FieldByName('nossonumero').AsString;

    // Armazena o log de impressão no TStringList
    logsImpressaoNN.AddObject(chaveLog, logImpressao);

    // Grava log das operações
    self.gravarLogsImpressao(logsImpressaoNN, nossoNumero);

    // Zera o stringlist dos logs de impressão
    logsImpressaoNN.Clear;

    // Zera o stringlist que agrupa as mensalidades
    mensalidadesAgrupadas.Clear;

    tblBloquetos.Next();
  end;

  Result := True;

  // Liberar a memória das variáveis utilizadas
  FreeAndNil(qyAtualizarMensalidade);
end;

Function TfrmRepBloquetos.PrepararBloquetosRemessaAntiga(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true; DataBoleto : TDateTime = 0; ds_filtro_boletos : String = ''; cd_tipo_titulo: String = '' ) : Boolean;
const
   S_SQL_CAMPOS = ' SELECT DISTINCT                                             ' +
     '   m2.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,        ' +
     '   r.nm_pessoa as responsavel, c.nr_banco banco, c.nm_banco,         ' +
     '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
     '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
     '   a.cd_resp_finan, m2.cd_caixa, tt.ds_tipo_titulo, c2.ds_caixa, m.cd_resp,  ' +
     // verificar a conta padrão para impressão do boleto (ou da turma, ou do departamento)
     '   IF(COALESCE(t.cd_caixa,0) > 0, t.cd_caixa, d.cd_boleto_padrao) AS cd_boleto_padrao, ' +
     // verificar se pode alterar a conta padrão, ou da turma ou do departamento
     '   IF(COALESCE(t.cd_caixa,0) > 0, t.sn_alterar_boleto, d.sn_alterar_boleto) AS sn_alterar_boleto,  ';
   S_SQL_CAMPO_CORRECAO =
        ' CASE '
      + ' 	WHEN COALESCE(m2.sn_liberar_descontos, 0) = 0 THEN GET_DESCONTOS(m2.cd_mensalidade, [DATA_CORRECAO]) '
      + ' 	ELSE 0 '
      + ' END desconto_corrigido, '
      + '  '
      + ' COALESCE(m2.valorbruto, 0) - '
      + ' COALESCE(m2.descontoextra, 0) + '
      + ' COALESCE(m2.valorjuros, 0) + '
      + ' COALESCE(m2.valorextra, 0) + '
      + ' GET_ACRESCIMOS(m2.cd_mensalidade, [DATA_CORRECAO]) - '
      + ' CASE '
      + ' 	WHEN COALESCE(m2.sn_liberar_descontos, 0) = 1 THEN GET_DESCONTOS(m2.cd_mensalidade, [DATA_CORRECAO]) '
      + ' 	ELSE 0 '
      + ' END valor_corrigido, ';

   S_SQL_CAMPO_AGRUPADO = ' CONCAT(COALESCE(m2.cd_resp, m2.codigoaluno), m2.codigoaluno, DATE_FORMAT(m2.datavencimento,"%Y-%m-%d"), COALESCE(tt.ds_grupo_boleto, "A")) as ds_grupo_boleto  ';
   S_SQL_CAMPO_DESAGRUPADO = ' CONCAT("A",m2.cd_mensalidade) as ds_grupo_boleto ';

   S_SQL_FROM_AGRUPADO = ' FROM                                                                                                           ' +
     '   mensalidades m                                                                                                                   ' +
     '   INNER JOIN mensalidades m2 ON (m.codigoaluno = m2.codigoaluno AND m.datavencimento = m2.datavencimento AND m2.situacao in (2,10) AND IFNULL(m.cd_resp, m.codigoaluno) = IFNULL(m2.cd_resp, m2.codigoaluno) )' +
     '   INNER JOIN fin_tipos_titulo as tt1 ON (m.cd_tipo_titulo = tt1.cd_tipo_titulo AND m.cd_coligada = tt1.cd_coligada)                ' +
     '   INNER JOIN fin_tipos_titulo as tt ON (m2.cd_tipo_titulo = tt.cd_tipo_titulo AND m2.cd_coligada = tt.cd_coligada                  ' +
     '      AND COALESCE(tt1.ds_grupo_boleto, ''A'') = COALESCE(tt.ds_grupo_boleto, ''A''))                                               ';

   S_SQL_FROM_DESAGRUPADO = ' FROM                                                                                        ' +
     '   mensalidades m                                                                                                   ' +
     '   INNER JOIN mensalidades m2 ON (m.cd_mensalidade = m2.cd_mensalidade)                                             ' +
     '   INNER JOIN fin_tipos_titulo as tt ON (m2.cd_tipo_titulo = tt.cd_tipo_titulo AND m2.cd_coligada = tt.cd_coligada)   ';

   S_SQL_INNERS =

     '   INNER JOIN departamentos as d ON (d.codigo = m2.depto)                                                         ' +
     '   INNER JOIN pessoas a ON (m.CodigoAluno = a.cd_pessoa)                                                          ' +
     '   INNER JOIN turmas t ON (t.codigo = m2.turma AND t.anosemestre = m2.anosemestre )                               ' +
     '   INNER JOIN coligadas coo ON ( coo.cd_coligada = t.cd_coligada )                                                ' +
     '   INNER JOIN coligadas_matriz cm ON ( coo.cd_coligada_matriz = cm.cd_coligada )                                                ' +
     '   INNER JOIN fin_cadastro_contas c ON (c.cd_caixa = :cd_caixa)                                                   ' +
     '   LEFT JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                                         ' +
     '   LEFT JOIN fin_cadastro_contas as c2 ON (c2.cd_caixa = m2.cd_caixa)                                             ' +
     ' WHERE                                                                                                            ' +
     '   (c.sn_ativa = ''S'') and m.situacao in (2,10)                                                                  ' +
     // A linha abaixo vai selecionar somente a mensalidade somente se a conta padrão do departamento/turma for a conta que está sendo impressa
     // ou se a opção sn_alterar_boleto no departamento/turma estiver setada como 1 (pode mudar a conta do boleto)
     ' AND (IF(COALESCE(t.cd_caixa,0) > 0, t.cd_caixa, d.cd_boleto_padrao) = :cd_caixa OR IF(COALESCE(t.cd_caixa,0) > 0, t.sn_alterar_boleto, d.sn_alterar_boleto) = 1) ';

   S_FIL_DATA_VENCTO_ORA = ' AND ( ( cm.sn_bloquear_boleto = 1 AND TO_CHAR(M.DATAVENCIMENTO, ''YYYY-MM-DD'') <= TO_CHAR(cm.DT_BLOQUEIO_BOLETO, ''YYYY-MM-DD'') ) OR ( cm.sn_bloquear_boleto != 1 ) ) ';
   S_FIL_DATA_VENCTO_MYSQL = ' AND ( ( cm.sn_bloquear_boleto = 1 AND M.DATAVENCIMENTO <= cm.DT_BLOQUEIO_BOLETO ) OR ( cm.sn_bloquear_boleto != 1 ) OR ( ISNULL(cm.sn_bloquear_boleto) ) )';


   S_SQL_ORDER = ' ORDER BY m.codigoaluno, m.datavencimento, COALESCE(tt.ds_grupo_boleto, ''A''), m2.nossonumero = '''', m2.valorbruto DESC ';
Var
   iBoleto : Integer;
   sGrupo : String;
   dSomaValor : Currency;
   dSomaDesconto : Currency;
   dVencimento : TDateTime;
   iCdResponsa : Integer;
   iCdPessoa : Integer;
   sNossoNumero : String;
   iConta : Integer;
   iColigada : Integer;
   sCodigosMensa : string;
   qyBlImpAcao : TUMZQuery;
   chaves : string;

   sFiltroData : String;
   sNNsAntigos : String;
   msgDDA, resp : Integer;
   sMsg : String;
   AlterarConta : Boolean;
   qryVerificaIgnoraDDA: TUMZQuery;
   qryNN : TUMZQuery;
   qryDDA : TUMZQuery;
   bCancelarDDA: Boolean;
   iCancelamento: Integer;
begin
   if bPerguntar = false then
   begin
     resp := mrYesToAll;
   end;

   sFiltroData := '';

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      sFiltroData := S_FIL_DATA_VENCTO_ORA
   else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
      sFiltroData := S_FIL_DATA_VENCTO_MYSQL;

   // Arrumar o código da conta para emissão de boletos e o código da Coligada;
   if ContaImpressao <> '' then begin

      if Pos('=', ContaImpressao) > 0 then begin

         iConta := StrToInt(Copy(ContaImpressao, 1, Pos('=',ContaImpressao)-1));

      end else begin

         iConta := StrToInt(ContaImpressao);

      end;

   end else begin
      if bPerguntar then
      begin
        Mensagem('Não foi possível identificar a conta de impressão do boleto', 'UNIMESTRE', MB_OK+ MB_ICONWARNING, Handle);
        Exit;
      end;

   end;


   // Montar o SQL com todos os boletos que podem ser impressos nessa conta
   // esse SQL, já exclui dos filtros mensalidades cujo departamento obriga a imprimir em conta diferente
   // departamentos.cd_boleto_padrao + departamentos.sn_alterar_boleto = 0

   tblBloquetos.Close();

   tblBloquetos.SQL.Text := S_SQL_CAMPOS;

    // Verificar se é agrupado ou não, e alterar o grupo do boleto
   if Agrupado then begin
      tblBloquetos.SQL.Add(S_SQL_CAMPO_AGRUPADO);
   end else begin
      tblBloquetos.SQL.Add(S_SQL_CAMPO_DESAGRUPADO);
   end;

   if Agrupado then begin
      // Se o boleto for agrupado, então ligar pegar todas as mensaliddes correspondentes do mesmo aluno, com o mesmo vencimento
      tblBloquetos.SQL.Add(S_SQL_FROM_AGRUPADO);
   end else begin
      // Se o boleto não for agrupado, então ligar com a própria mensalidade para não trazer registros repetidos
      tblBloquetos.SQL.Add(S_SQL_FROM_DESAGRUPADO);
   end;
   tblBloquetos.SQL.Add(S_SQL_INNERS);

   if (ds_filtro_boletos <> '') then
   begin
      tblBloquetos.SQL.Add(' AND (' + ds_filtro_boletos + ') ' );
   end;

   DM.CriarConsulta(qryVerificaIgnoraDDA);

   qryVerificaIgnoraDDA.SQL.Text := 'SELECT sn_ignorar_dda FROM fin_cadastro_contas WHERE cd_caixa = '+IntToStr(iConta);

   qryVerificaIgnoraDDA.Open;

   if qryVerificaIgnoraDDA.FieldByName('sn_ignorar_dda').AsInteger = 1 then
   begin
      tblBloquetos.SQL.Add(' AND a.cd_pessoa NOT IN (SELECT cd_pessoa FROM pessoas_debito_automatico WHERE sn_autoriza_debito = 1) ');
   end;

   tblBloquetos.SQL.Add(' AND ' + sFiltro + sFiltroData );

   // Esta ordem é importante para bloquetos agrupados

   tblBloquetos.SQL.Add( S_SQL_ORDER );

   // Abre a tabela de Bloquetos para inserir os registros na tabela de Bloquetos e/ou fin_boletos;

   tblBloquetos.ParamByName('cd_caixa').AsInteger := iConta;

   tblBloquetos.Open();
   //tblBloquetos.FetchAll();

   if (tblBloquetos.IsEmpty) and bPerguntar then begin
      Mensagem('Não foi possível selecionar os dados para impressão dos boletos. O filtro selecionado não encontrou nenhum título.', 'Atenção', MB_OK + MB_ICONWARNING);
      result := false;
      Exit;
   end;


   // 1o PASSO: Percorrer todos os títulos que serão impressos
   // Ajustar o cd_caixa e o NN

   DM.CriarConsulta(qyBlImpAcao);
   AlterarConta := false;

   while not tblBloquetos.Eof do
   begin

      DM.CriarConsulta(qryDDA);
      qryDDA.Close;
      qryDDA.SQL.Text := ''+
      '  SELECT                         '+
      '   	rl.cd_origem,ro.cd_acao    '+
      '  FROM                           '+
      '  	rem_dados rd                  '+
      '	INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)              '+
      '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)  '+
      '  WHERE                                                                    '+
      '	  rd.cd_mensalidade = :cd_mensalidade';

      qryDDA.ParamByName('cd_mensalidade').AsInteger := tblBloquetos.FieldByName('cd_mensalidade').AsInteger;
      qryDDA.Open;

      bCancelarDDA := false;
      iCancelamento := 0;
      while not qryDDA.Eof do
      begin

         if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
         begin
            bCancelarDDA := true;
         end;

         if qryDDA.FieldByName('cd_acao').AsInteger = 101 then
         begin
            iCancelamento := iCancelamento +1;
         end;

         qryDDA.Next;
      end;

      if iCancelamento > 0 then
      begin
         bCancelarDDA := false;
      end;

      if ( bCancelarDDA = true ) then
      begin

         if ((DDASimParaTodos = False) and (DDANaoParaTodos = False)) then
         begin

            msgDDA :=
               MensagemCustomizavel(
                  'Deseja cancelar o Débito Automático para a pessoa '
                     + tblBloquetos.FieldByName('nome').AsString
                     + ' na parcela de número '
                     + tblBloquetos.FieldByName('parcela').AsString +'?',
                  mtConfirmation,
                  [mbYes, mbYesToAll, mbNo, mbNoToAll],
                  ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'],
                  97
               );

            if (msgDDA = mrYesToAll) then
            begin
               DDASimParaTodos := True;
            end;
                                                                            
            if (msgDDA = mrNoToAll) then
            begin
               DDANaoParaTodos := True;
            end;

         end;

         if ((not(DDANaoParaTodos)) and ((DDASimParaTodos) or (msgDDA = mrYes))) then
         begin
            DM.FazAcaoRemessa(arCancelamentoDDA, tblBloquetos.FieldByName('cd_mensalidade').AsInteger);

            if mensagemExibidaDDA = False then
            begin
               Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do Débito Automático ocorra.', Application.Title, MB_OK, Handle);

               if DDASimParaTodos then
               begin
                  mensagemExibidaDDA := True;
               end;

            end;
         end;
      end;

// ---------------------------------------------------------------------------------------------------
           // A cada mensalidade percorrida, verificar se a conta está correta, ou se o NN está vazio
           // Criar um Novo nosso número para esses casos
// ---------------------------------------------------------------------------------------------------
      if (tblBloquetos.FieldByName('cd_caixa').AsInteger <> iConta) OR (tblBloquetos.FieldByName('nossonumero').AsString = '')
      then
      begin

            // Verificar se este boleto já foi impresso em outra conta
            if  (tblBloquetos.FieldByName('cd_caixa').AsInteger <> iConta ) // Se o caixa que tem na mensalidade for diferente do caixa da impressao
            AND (tblBloquetos.FieldByName('NossoNumero').AsString <> '') // se o nosso número já está gerado
            AND (tblBloquetos.FieldByName('cd_caixa').AsInteger > 0) // Se o caixa da mensalidade não estiver vazio
//            AND (DM.isTrue(tblBloquetos.FieldByName('Bloqueto').AsString)) // Se já foi impresso bloqueto
//   Desabilitado, pois o sistema não estava colocando o bloqueto = S -- claudionor 07/03
            AND (resp <> mrYesToAll)
            AND (resp <> mrNoToAll)

            THEN begin

                 // ENTAO, pedir autorização para TROCAR
                 sMsg := 'Você está alterando a conta de impressão do boleto de: ' + CHR(13) + CHR(13);
                 sMsg := sMsg + '      ' + tblBloquetos.FieldByName('nome').AsString + CHR(13);
                 sMsg := sMsg + '      ' + 'Parcela: ' + tblBLoquetos.FieldByName('parcela').AsString + ' - ' + tblBloquetos.FieldByName('ds_tipo_titulo').AsString + CHR(13);
                 sMsg := sMsg + '      ' + 'Vencimento: ' + FormatDateTime('dd/mm/yyyy', tblBloquetos.FieldByName('datavencimento').AsDateTime) + CHR(13);
                 sMsg := sMsg + '      ' + 'Nosso Número: ' + tblBloquetos.FieldByName('nossonumero').AsString + CHR(13) + CHR(13);
                 sMsg := sMsg + 'que já havia sido impresso na conta ' + tblBloquetos.FieldByName('ds_caixa').AsString + '.' + CHR(13) + 'Tem certeza que deseja alterar a conta?';

                 resp := MensagemCustomizavel(sMsg, mtConfirmation, [mbYes, mbYesToAll, mbNo, mbNoToAll], ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'], 97 );
            end
            else if (tblBloquetos.FieldByName('NossoNumero').AsString = '')
            then begin
                // se o NN está VAZIO, ou nunca foi impresso, ou cd_caixa = 0
                //, então tem que setar o cd_caixa para poder imprimir a primeira vez nessa conta.

                AlterarConta := true;

            end;


            if ( (resp <> 2) AND (resp <> mrNo) AND (resp <> mrNoToAll) ) OR AlterarConta then begin


               // Efetuar alteração individual de cada mensalidade, mesmo em caso de agrupamento
               // Guardar o Log de Alteração de Nosso números individuais

                chaves := FillString(tblBloquetos.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                       tblBloquetos.FieldByName('anosemestre').AsString + ';' + tblBloquetos.FieldByName('turma').AsString + ';' +
                       tblBloquetos.FieldByName('parcela').AsString + ';' +
                       FormatDateTime('dd/mm/yyyy',tblBloquetos.FieldByName('datavencimento').AsDateTime) + ';';

                sNossoNumero := tblBloquetos.FieldByName('nossonumero').AsString;

                qyBlImpAcao.SQL.Text :=
                ' UPDATE mensalidades SET cd_caixa = :cd_caixa, nossonumero = :nossonumero ' +
                '  WHERE cd_mensalidade = :cd_mensalidade ';

                qyBlImpAcao.ParamByName('cd_caixa').AsInteger := iConta;
                qyBlImpAcao.ParamByName('nossonumero').AsString := DM.NovoNumero(0, '', 0, 0, iConta, tblBloquetos.FieldByName('cd_coligada').AsInteger,tblBloquetos.FieldByName('codigoaluno').AsInteger, Copy( tblBloquetos.FieldByName('datavencimento').AsString, 9, 2 ), Copy( tblBloquetos.FieldByName('dataemissao').AsString, 9, 2 ) );
                qyBlImpAcao.ParamByName('cd_mensalidade').AsInteger := tblBloquetos.FieldByName('cd_mensalidade').AsInteger;

                qyBlImpAcao.ExecSQL();

                if sNossoNumero = '' then begin
                   DM.setLog(2013, 'alteracao', chaves, tblBloquetos.FieldByName('cd_coligada').AsInteger, 'Impressão primeiro Boleto (NN = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '")' );
                end else begin
                   DM.setLog(2013, 'alteracao', chaves, tblBloquetos.FieldByName('cd_coligada').AsInteger, 'Alteração de Boletos (NN Atual = "'+ sNossoNumero +'" NN Novo = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '" )');
                end;

            end;

            AlterarConta := false;            

      end;
      tblBloquetos.Next();
   end;

   FreeAndNil(qyBlImpAcao);


   // Agora reabrir a tabela, somente para atualizar o NN e o cd_caixa alterado anteriormente
   // Acrescentar o filtro do cd_caixa, para imprimir SOMENTE os bloquetos que estão OK!

// -------------------------------------
   tblBloquetos.Close();

   tblBloquetos.SQL.Text := S_SQL_CAMPOS;

   if DataBoleto = 0 then begin
      tblBloquetos.SQL.Add( ReplaceStr(S_SQL_CAMPO_CORRECAO, '[DATA_CORRECAO]', '"1999-08-13"' ) );  // Uma data bem antiga para que o boleto seja impresso como se nunca estivesse vencido, com todas as informações originais
   end else begin
      tblBloquetos.SQL.Add( ReplaceStr( S_SQL_CAMPO_CORRECAO, '[DATA_CORRECAO]', '"' + FormatDateTime('yyyy-mm-dd', DataBoleto ) + '"' ) );
   end;

    // Verificar se é agrupado ou não, e alterar o grupo do boleto
   if Agrupado then begin
      tblBloquetos.SQL.Add(S_SQL_CAMPO_AGRUPADO);
   end else begin
      tblBloquetos.SQL.Add(S_SQL_CAMPO_DESAGRUPADO);
   end;

   if Agrupado then begin
      // Se o boleto for agrupado, então ligar pegar todas as mensaliddes correspondentes do mesmo aluno, com o mesmo vencimento
      tblBloquetos.SQL.Add(S_SQL_FROM_AGRUPADO);
   end else begin
      // Se o boleto não for agrupado, então ligar com a própria mensalidade para não trazer registros repetidos
      tblBloquetos.SQL.Add(S_SQL_FROM_DESAGRUPADO);
   end;

   tblBloquetos.SQL.Add(S_SQL_INNERS);

   tblBloquetos.SQL.Add(' AND ' + sFiltro + sFiltroData );
   tblBloquetos.SQL.Add(' AND m2.cd_caixa = :cd_caixa2 ');

   if cd_tipo_titulo <> '' then
   begin
      tblBloquetos.SQL.Add(' AND m.cd_tipo_titulo IN ( ' + cd_tipo_titulo + ' ) ');
   end;

   tblBloquetos.ParamByName('cd_caixa').AsInteger := iConta;
   tblBloquetos.ParamByName('cd_caixa2').AsInteger := iConta;

   // Esta ordem é importante para bloquetos agrupados

   tblBloquetos.SQL.Add( S_SQL_ORDER );

   // Abre a tabela de Bloquetos para inserir os registros na tabela de Bloquetos e/ou fin_boletos;

   tblBloquetos.Open();
   tblBloquetos.FetchAll();
// -------------------------------------

   // Se nenhum registro estiver preparado, ABORTAR a operação de impressão

   if tblBloquetos.Eof and bPerguntar then begin
      Mensagem('Nenhum título selecionado pode ser impresso nesta conta.', 'UNIMESTRE', MB_OK+ MB_ICONWARNING, Handle);
      Result := false;
      Exit;           
   end;


   // Inserir na tabela de Boletos

   tblAux.Close();
   tblAux.SQL.Text :=
      ' INSERT INTO fin_boleto (cd_resp_finan, cd_pessoa, nr_nossonumero, ' +
      '    dt_impressao, dt_vencimento, vl_boleto, vl_desconto, cd_conta, cd_coligada) ' +
      ' VALUES (:cd_resp_finan, :cd_pessoa, :nr_nossonumero, :dt_impressao, :dt_vencimento, :vl_boleto, :vl_desconto, :cd_conta, :cd_coligada) ';

   // Pegar Valores Iniciais
   sGrupo := tblBloquetos.FieldByName('ds_grupo_boleto').AsString;

   iCdPessoa := tblBloquetos.FieldByName('CodigoAluno').AsInteger;
   iCdResponsa := tblBloquetos.FieldByName('cd_resp').AsInteger;
   iConta := tblBloquetos.FieldByName('cd_caixa').AsInteger;
   iColigada := tblBloquetos.FieldByName('cd_coligada').AsInteger;
   sNossoNumero := tblBloquetos.FieldByName('NossoNumero').AsString;

   dVencimento := tblBloquetos.FieldByName('DataVencimento').AsDateTime;
   dSomaValor := 0;
   dSomaDesconto := 0;

   sCodigosMensa := '';

   sNNsAntigos := '';


   // 2o PASSO: Efetuar a inclusão em fin_boleto e bloquetos
   // SOMENTE PARA AS MENSALIDADES QUE TEM O CD_CAIXA SETADO e o NN <> ''

   while not tblBloquetos.Eof do begin

      // Verificar o cd_caixa da mensalidade

      // A Partir deste momento


           dSomaValor := dSomaValor + (tblBloquetos.FieldByName('valor_corrigido').AsCurrency );
           dSomaDesconto := dSomaDesconto + (tblBloquetos.FieldByName('desconto_corrigido').AsCurrency);

           sCodigosMensa := sCodigosMensa + tblBloquetos.FieldByName('cd_mensalidade').AsString + ',';

           if tblBloquetos.FieldByName('NossoNumero').AsString <> '' then begin
              if Pos(tblBloquetos.FieldByName('NossoNumero').AsString, sNNsAntigos) <= 0 then begin
                 sNNsAntigos := sNNsAntigos + tblBloquetos.FieldByName('NossoNumero').AsString + '/';
              end;

           end;

           chaves := FillString(tblBloquetos.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                       tblBloquetos.FieldByName('anosemestre').AsString + ';' + tblBloquetos.FieldByName('turma').AsString + ';' +
                       tblBloquetos.FieldByName('parcela').AsString + ';' +
                       FormatDateTime('dd/mm/yyyy',tblBloquetos.FieldByName('datavencimento').AsDateTime) + ';';

           tblBloquetos.Next();

           if (sGrupo <> (tblBloquetos.FieldByName('ds_grupo_boleto').AsString)) OR (tblBloquetos.Eof) then begin

              sCodigosMensa := Copy(sCodigosMensa, 1, length(sCodigosMensa) - 1);

              // Neste momento, temos que verificar se existe algum fin_boleto, com o mesmo NN que está sendo utilizado, e
              // Com os valores ou pessoas diferentes... Se sim, criar outro NN


              DM.qyAux2.Close();
              DM.qyAux2.SQL.Text := ''+
                  ' SELECT group_concat(DISTINCT f.cd_boleto) as boletos, date_format(MAX(m.datavencimento), "%Y%m%d") as mensa_venci, date_format(MAX(f.dt_vencimento), "%Y%m%d") as boleto_venci,' +
                  ' MIN(m.cd_mensalidade) as cd_mensalidade, ROUND(SUM(IFNULL(m.valorbruto,0) + IFNULL(m.valorextra,0)+ IFNULL(m.valorjuros,0)- IFNULL(m.descontoextra,0)),2) as soma_mensalidades, ROUND(IFNULL(f.vl_boleto,0),2) as vl_boleto ' +
                  '   FROM mensalidades as m' +
                  '  LEFT JOIN fin_boleto as f ON (f.cd_boleto = m.cd_boleto and f.cd_boleto <> 0) ' +
                  '  WHERE m.cd_mensalidade in ( '+ sCodigosMensa + ' ) ' +
                  '  GROUP BY m.cd_resp; ';

              DM.qyAux2.Open();

              // A seleção é feita antes de alterar as parcelas,
              // mas a ação de remessa deve ser disparada apenas depois.


              { Claudionor: 07/05 Desativado a opção de gerar um novo nosso número quando o valor do boleto for diferente
                Deverá manter o mesmo nosso número e enviar ação de remessa de alteração


              if not Dm.qyAux2.Eof
              then begin
                 sNossoNumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, iCdPessoa,  Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ) );
              end;

              }

              // Verficar se este boleto está vinculado a um boleto desmembrado. NEste caso, deve gera NN diferente e retirar da remessa de etrada para forcar nova geracao

              if (not Dm.qyAux2.Eof) and (DM.qyAux2.FieldByNAme('boletos').AsString <> '')
              then begin
                  Dm.CriarConsulta(qryNN);
                  qryNN.Close();
                  qryNN.SQL.Text := 'SELECT count(*) as resultado FROM mensalidades WHERE cd_boleto is not null AND cd_boleto > 0 and cd_boleto in (' + DM.qyAux2.FieldByNAme('boletos').AsString + ') '+
                                    ' AND cd_mensalidade NOT IN ( '+ sCodigosMensa + ' ); ';
                  qryNN.OPen();

                  if qryNN.FieldByName('resultado').AsInteger > 0 then begin
                     sNossoNumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, iCdPessoa,  Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ) );

                  // Apagar as remessas enviadas para esses casos nossos números, pois vai ter que criar um novo de remessa

                      qryNN.Close();
                      qryNN.SQL.Text :=
                          'DELETE FROM REM_DADOS ' +
                          'USING ' +
                             'REM_DADOS ' +
                             'JOIN REM_OCORRENCIAS ' +
                                'JOIN REM_LAYOUTS ON ' +
                                   '(REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA) ' +
                          'WHERE ' +
                             'REM_DADOS.CD_MENSALIDADE IN ( '+ sCodigosMensa + ' ); ';
                      qryNN.ExecSQL();
                  end;

                  FreeAndNil(qryNN);

              end;              


              tblAux.ParamByName('dt_impressao').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
              if DataBoleto = 0 then begin
                 tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', dVencimento);
              end else begin
                 tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', DataBoleto);
              end;


              if iCdResponsa = 0 then begin
                  tblAux.ParamByName('cd_resp_finan').AsInteger := iCdPessoa;
              end else begin
                  tblAux.ParamByName('cd_resp_finan').AsInteger := iCdResponsa;
              end;
              tblAux.ParamByName('cd_pessoa').AsInteger := iCdPessoa;
              tblAux.ParamByName('nr_nossonumero').AsString := sNossoNumero;
              tblAux.ParamByName('vl_boleto').AsCurrency := dSomaValor;
              tblAux.ParamByName('vl_desconto').AsCurrency := dSomaDesconto;
              tblAux.ParamByName('cd_conta').AsInteger := iConta;
              tblAux.ParamByName('cd_coligada').AsInteger := iColigada;
              tblAux.ExecSQL();

              // Pegar Código do Boleto inserido
              iBoleto := DM.LastInsert();

              // Atualizar o cd_boleto e o nossonúmero na tabela mensalidades

              if length(sNNsAntigos) > 0 then begin
                 sNNsAntigos := Copy(sNNsAntigos, 1, length(sNNsAntigos) - 1);
              end;

              tblBloquetosAgrupados.Close();
              tblBloquetosAgrupados.SQL.Text :=
                 ' UPDATE mensalidades SET cd_boleto = ' + IntToStr(iBoleto) +
                 '  , nossonumero = ''' + sNossoNumero + ''' ' +
                 '  , cd_caixa = ''' + IntToStr(iConta) + ''' ' +
                 ' WHERE cd_mensalidade IN ( ' + sCodigosMensa + ') ';
              tblBloquetosAgrupados.ExecSQL();

              if (not Dm.qyAux2.Eof) then begin

                 if (DM.qyAux2.FieldByName('soma_mensalidades').AsCurrency <> DM.qyAux2.FieldByName('vl_boleto').AsCurrency )
                 AND (DM.qyAux2.FieldByName('vl_boleto').AsCurrency >0 )
                 then begin
                    // Está sendo impresso um boleto com valor diferente
                    // Registrar ação de alteração para todas as parcelas envolvidas

                    DM.FazAcaoRemessa(arAltMensalidade, DM.qyAux2.FieldByName('cd_mensalidade').AsInteger, true, sCodigosMensa);

                  end else if (DM.qyAux2.FieldByName('mensa_venci').AsString <> DM.qyAux2.FieldByName('boleto_venci').AsString ) then begin
                  
                     DM.FazAcaoRemessa(arProrrogar, DM.qyAux2.FieldByName('cd_mensalidade').AsInteger, true, sCodigosMensa);

                  end;

              end;

              Dm.qyAux2.Close();


              // Guardar Log
              // Arrumar o log, para não guardar quando for só de 1 para 1.

              if (trim(sNossoNumero) <> trim(sNNsAntigos)) then
              begin

                 if DM.isTrue(DM.variavel_parametro('financeiro_boletos_agrupados')) then
                 begin
                    DM.setLog(2013, 'alteracao', chaves, tblBloquetos.FieldByName('cd_coligada').AsInteger, 'Alteração de NN (NN = "' + sNNsAntigos +  '" PARA = "' + sNossoNumero + '")' );
                 end
                 else
                 begin
                    DM.setLog(2013, 'alteracao', chaves, tblBloquetos.FieldByName('cd_coligada').AsInteger, 'NN Alterado (NN = "' + sNNsAntigos +  '" PARA = "' + sNossoNumero + '")' );
                 end;

              end;



              sCodigosMensa := '';

              sNNsAntigos := '';

              if not tblBloquetos.Eof then begin

                 sGrupo := tblBloquetos.FieldByName('ds_grupo_boleto').AsString;

                 iCdPessoa := tblBloquetos.FieldByName('CodigoAluno').AsInteger;
                 iCdResponsa := tblBloquetos.FieldByName('cd_resp').AsInteger;
                 iConta := tblBloquetos.FieldByName('cd_caixa').AsInteger;
                 iColigada := tblBloquetos.FieldByName('cd_coligada').AsInteger;
                 sNossoNumero := tblBloquetos.FieldByName('NossoNumero').AsString;
                 dVencimento := tblBloquetos.FieldByName('DataVencimento').AsDateTime;
                 dSomaValor := 0;
                 dSomaDesconto := 0;

              end;


           end;


   end;

   Result := True;

end;

end.
