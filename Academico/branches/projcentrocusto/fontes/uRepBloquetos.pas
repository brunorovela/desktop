unit uRepBloquetos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, Mask, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, uLoginManager; 

type
  TfrmRepBloquetos = class(TForm)
    tblBloquetos: TUMZQuery;
    qryUpdate: TUMZQuery;
    tblInserir: TUMZQuery;
    tblAux: TUMZQuery;
    tblEmpresas: TUMZQuery;
    tblBloquetosAgrupados: TUMZQuery;
    tblAux2: TUMZQuery;
    procedure InserirBoletosIndividuais;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flgBonus : Boolean;
    Impressos: Integer;

    Function PrepararBloquetosParaImpressao(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true ) : Boolean;
    Function PrepararBloquetosParaEmpresa(sFiltro : String; Agrupado : Boolean; ContaImpressao : String) : Boolean;
    Function PrepararBloquetosParaAluno(sFiltro : String; Agrupado : Boolean; ContaImpressao : String) : Boolean;

  end;

var
  frmRepBloquetos: TfrmRepBloquetos;

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
  Agrupado: Boolean; ContaImpressao: String): Boolean;
Var
   iBoleto : Integer;
   sNossoNumero : String;
   sNossoNumeroAntivo : String;

   chaves : string;
   iConta : Integer;
   iColigada : Integer;
   sFiltroData : String;

   qBoleto : TUMZQuery;
   qyBlImp : TUMZQuery;

   iPessoa : Integer;
   iDiaVencimento : Integer;
   dia, mes, ano : word;
   novoVenc :TDateTime;

   log : String;
begin
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

   sFiltroData := '';

   if qBoleto.FieldByName('sn_bloquear_boleto').AsInteger = 1 then begin
      sFiltroData := ' AND datavencimento <= "' + FormatDateTime('yyyy-mm-dd', qBoleto.FieldByName('dt_bloqueio_boleto').AsDateTime) + '" ';
   end;
   DM.CriarConsulta(qyBlImp);

   // Selecionar os grupos de boletos que deverão ser impressos
   qyBlImp.Close();
   qyBlImp.SQL.Text :=
     ' SELECT cd_resp,codigoaluno, datavencimento, MIN(IFNULL(nossonumero, "")) nn_inicio, MAX(IFNULL(nossonumero, "")) nn_fim, Round(SUM(IFNULL(valorbruto, 0) + IFNULL(valorextra, 0) + IFNULL(valorjuros, 0) - IFNULL(descontoextra, 0)),2) As vl_boleto, ' +
     '   Round(SUM(IFNULL(valordesconto, 0)),2) As vl_desconto,  p.nr_dia_vencimento    ' +
     ' FROM mensalidades as m ' +
     '  INNER JOIN pessoas as p ON (m.codigoaluno = p.cd_pessoa) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     ' GROUP BY m.codigoaluno, datavencimento ' +
     ' ORDER BY m.codigoaluno, datavencimento ';
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
                ' SELECT * FROM mensalidades as m' +
                ' WHERE ' + sFiltro + sFiltroData +
                '   AND codigoaluno = ' + qyBlImp.FieldByName('codigoaluno').AsString +
                '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
                '   AND (situacao = 2 OR situacao = 10) ';

               qBoleto.Open();

               while not qBoleto.EOF do begin


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

   qyBlImp.Close();
   qyBlImp.SQL.Text :=
     ' SELECT IFNULL(m.cd_resp, m.codigoaluno) as cd_resp, , codigoaluno, datavencimento, MIN(IFNULL(nossonumero, "")) nn_inicio, MAX(IFNULL(nossonumero, "")) nn_fim, ' +
     '        Round(SUM(IFNULL(valorbruto, 0) + IFNULL(valorextra, 0) + IFNULL(valorjuros, 0) - IFNULL(descontoextra, 0)),2) As vl_boleto, ' +
     '   Round(SUM(IFNULL(valordesconto, 0)),2) As vl_desconto,  p.nr_dia_vencimento    ' +
     ' FROM mensalidades as m ' +
     '  INNER JOIN pessoas as p ON (m.cd_resp = p.cd_pessoa) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     ' GROUP BY m.codigoaluno, datavencimento ' +
     ' ORDER BY m.codigoaluno, datavencimento ';
   qyBlImp.Open();

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
         tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime);

         sNossonumero := DM.NovoNumero(0, '', 0, 0, iConta, iColigada, qyBlImp.FieldByName('cd_resp').AsInteger, Copy( tblAux.ParamByName('dt_vencimento').AsString, 3, 2 ), Copy( tblAux.ParamByName('dt_impressao').AsString, 3, 2 ) );

         tblAux.ParamByName('cd_resp_finan').AsInteger := qyBlImp.FieldByName('cd_resp').AsInteger;
         tblAux.ParamByName('cd_pessoa').AsInteger := qyBlImp.FieldByName('codigoaluno').AsInteger;
         tblAux.ParamByName('nr_nossonumero').AsString := sNossoNumero;
         tblAux.ParamByName('vl_boleto').AsCurrency := qyBlImp.FieldByName('vl_boleto').AsCurrency;
         tblAux.ParamByName('vl_desconto').AsCurrency := qyBlImp.FieldByName('vl_desconto').AsCurrency;
         tblAux.ParamByName('cd_conta').AsInteger := iConta;
         tblAux.ParamByName('cd_coligada').AsInteger := iColigada;
         tblAux.ExecSQL();

         iBoleto := DM.LastInsert();

         // Atualizar as mensalidades

         qBoleto.Close();
         // qBoleto.RequestLive := true;
         qBoleto.SQL.Text :=
          ' SELECT * FROM mensalidades as m' +
          ' WHERE ' + sFiltro + sFiltroData +
          '   AND codigoaluno = ' + qyBlImp.FieldByName('codigoaluno').AsString +
          '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
          '   AND (situacao = 2 OR situacao = 10) ';

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
         ' UPDATE mensalidades as m SET cd_boleto = ' + IntToStr(iBoleto) +
         ' WHERE ' + sFiltro + sFiltroData +
         '   AND codigoaluno = ' + qyBlImp.FieldByName('codigoaluno').AsString +
         '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
         '   AND situacao in (2,10) ';

         qBoleto.ExecSQL();

      end;

      qyBlImp.Next();
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
     '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and                                                 ' +
     sFiltro + sFiltroData +
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
  Agrupado: Boolean; ContaImpressao: String): Boolean;
Var
   iBoleto : Integer;
   sNossoNumero : String;
   sNossoNumeroAntivo : String;

   chaves : string;
   iConta : Integer;
   iColigada : Integer;
   sFiltroData : String;

   qBoleto : TUMZQuery;
   qyBlImp : TUMZQuery;

   iPessoa : Integer;
   iDiaVencimento : Integer;
   dia, mes, ano : word;
   novoVenc :TDateTime;

   log : String;
   qryNN : TUMZQuery;

   RemessaAlteracao : boolean;
begin
   // A conta impressão é fundamental para agrupar boletos por empresa.
   if ContaImpressao = '' then exit;

   iConta := StrToInt(Copy(ContaImpressao, 1, Pos('=',ContaImpressao)-1));
   iColigada := StrToint(Copy(ContaImpressao, Pos('=',ContaImpressao)+1, length(ContaImpressao)));


   // Verificar se o boleto está bloqueado

   DM.CriarConsulta(qBoleto);

   qBoleto.UpdateMode := umUpdateChanged;
   // qBoleto.RequestLive := false;

   qBoleto.SQL.Text := 'SELECT CM.sn_bloquear_boleto, CM.dt_bloqueio_boleto FROM coligadas_matriz CM INNER JOIN coligadas c on (CM.cd_coligada = C.CD_COLIGADA_MATRIZ) ' +
                       ' WHERE C.cd_coligada = ' + IntToStr(iColigada);

   qBoleto.Open();

   sFiltroData := '';

   if qBoleto.FieldByName('sn_bloquear_boleto').AsInteger = 1 then begin
      sFiltroData := ' AND datavencimento <= "' + FormatDateTime('yyyy-mm-dd', qBoleto.FieldByName('dt_bloqueio_boleto').AsDateTime) + '" ';
   end;

   DM.CriarConsulta(qyBlImp);

   // Selecionar os grupos de boletos que deverão ser impressos
   qyBlImp.Close();
   qyBlImp.SQL.Text :=
     ' SELECT cd_resp, datavencimento, MIN(IFNULL(nossonumero, "")) nn_inicio, MAX(IFNULL(nossonumero, "")) nn_fim, Round(SUM(IFNULL(valorbruto, 0) + IFNULL(valorextra, 0) + IFNULL(valorjuros, 0) - IFNULL(descontoextra, 0)),2) As vl_boleto, ' +
     '   Round(SUM(IFNULL(valordesconto, 0)),2) As vl_desconto,  p.nr_dia_vencimento    ' +
     ' FROM mensalidades as m ' +
     '  INNER JOIN pessoas as p ON (m.cd_resp = p.cd_pessoa) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     ' GROUP BY cd_resp, datavencimento ' +
     ' ORDER BY cd_resp, datavencimento ';
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
                ' SELECT * FROM mensalidades as m' +
                ' WHERE ' + sFiltro + sFiltroData +
                '   AND cd_resp = ' + qyBlImp.FieldByName('cd_resp').AsString +
                '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
                '   AND (situacao = 2 OR situacao = 10) ';

               qBoleto.Open();

               while not qBoleto.EOF do begin


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

   qyBlImp.Close();
   qyBlImp.SQL.Text :=
     ' SELECT MIN(m.cd_mensalidade) as cd_mensalidade, group_concat(DISTINCT m.cd_boleto) as boletos, group_concat(DISTINCT m.cd_mensalidade) as mensalidades,  IFNULL(m.cd_resp, m.codigoaluno) as cd_resp, datavencimento, MAX(IF(m.cd_caixa = ' + IntToStr(iConta) + ' AND m.nossonumero <> "", m.nossonumero, null)) as nn_usar, ' +
     ' MIN(IFNULL(nossonumero, "")) nn_inicio, MAX(IFNULL(nossonumero, "")) nn_fim, Round(SUM(IFNULL(valorbruto, 0) + IFNULL(valorextra, 0) + IFNULL(valorjuros, 0) - IFNULL(descontoextra, 0)),2) As vl_boleto, ' +
     '   Round(SUM(IFNULL(valordesconto, 0)),2) As vl_desconto,  p.nr_dia_vencimento    ' +
     ' FROM mensalidades as m ' +
     '  INNER JOIN pessoas as p ON (m.cd_resp = p.cd_pessoa) ' +
     ' WHERE ' + sFiltro + sFiltroData +  ' AND situacao in (2,10) ' +
     ' GROUP BY cd_resp, datavencimento ' +
     ' ORDER BY cd_resp, datavencimento ';
   qyBlImp.Open();

   while not qyBlImp.Eof do begin

      // Verificar se já existe um fin_boleto com as mesmas configurações

      qBoleto.Close();
      // qBoleto.RequestLive := false;

      qBoleto.SQL.Text :=
       ' SELECT * from fin_boleto  '  +
       '  WHERE cd_resp_finan = ' + qyBlImp.FieldByName('cd_resp').AsString +
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
          ' SELECT * FROM mensalidades as m' +
          ' WHERE ' + sFiltro + sFiltroData +
          '   AND cd_resp = ' + qyBlImp.FieldByName('cd_resp').AsString +
          '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
          '   AND (situacao = 2 OR situacao = 10) ';

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
         ' UPDATE mensalidades as m SET cd_boleto = ' + IntToStr(iBoleto) +
         ' WHERE ' + sFiltro + sFiltroData +
         '   AND cd_resp = ' + qyBlImp.FieldByName('cd_resp').AsString +
         '   AND datavencimento = "' + FormatDateTime('yyyy-mm-dd', qyBlImp.FieldByName('datavencimento').AsDateTime) + '" ' +
         '   AND situacao in (2,10) ';

         qBoleto.ExecSQL();

      end;

      if RemessaAlteracao then begin
         DM.FazAcaoRemessa(arAltMensalidade, qyBlImp.FieldByName('cd_mensalidade').AsInteger, true, qyBlImp.FieldByName('mensalidades').AsString);      
      end;

      qyBlImp.Next();
   end;

   tblBloquetos.SQL.Text :=
     ' SELECT                                                                   ' +
     '   m.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,         ' +
     '   r.nm_pessoa as responsavel, d.*, c.nr_banco banco, c.nm_banco,         ' +
     '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
     '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
     '   m.cd_mensalidade, a.cd_resp_finan, c.cd_caixa                          ' +
     '   , IFNULL(tt.ds_grupo_boleto, "A") as ds_grupo_boleto                   ' +
     ' FROM (                                                                                       ' +
     '   mensalidades m                                                                             ' +
     '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
     '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
     '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
     '   INNER JOIN departamentos d ON (m.depto = d.Codigo)                                         ' +
     '   INNER JOIN fin_cadastro_contas c ON ( c.cd_caixa = m.cd_caixa )  ' +
     '   LEFT JOIN fin_tipos_titulo as tt ON (m.cd_tipo_titulo = tt.cd_tipo_titulo AND m.cd_coligada = tt.cd_coligada) ' +
     ' WHERE                                                                                        ' +
     '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and                                                 ' +
     sFiltro + sFiltroData +
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

Function TfrmRepBloquetos.PrepararBloquetosParaImpressao(sFiltro : String; Agrupado : Boolean; ContaImpressao : String; bPerguntar : Boolean = true ) : Boolean;
const
   S_SQL_CAMPOS = ' SELECT DISTINCT                                             ' +
     '   m2.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,        ' +
     '   r.nm_pessoa as responsavel, c.nr_banco banco, c.nm_banco,         ' +
     '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
     '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
     '   a.cd_resp_finan, m2.cd_caixa, tt.ds_tipo_titulo, c2.ds_caixa,          ' +
     // verificar a conta padrão para impressão do boleto (ou da turma, ou do departamento)
     '   IF(COALESCE(t.cd_caixa,0) > 0, t.cd_caixa, d.cd_boleto_padrao) AS cd_boleto_padrao, ' +
     // verificar se pode alterar a conta padrão, ou da turma ou do departamento
     '   IF(COALESCE(t.cd_caixa,0) > 0, t.sn_alterar_boleto, d.sn_alterar_boleto) AS sn_alterar_boleto,  ';

   S_SQL_CAMPO_AGRUPADO = ' CONCAT(m2.codigoaluno, DATE_FORMAT(m2.datavencimento,"%Y-%m-%d"), COALESCE(tt.ds_grupo_boleto, "A")) as ds_grupo_boleto  ';
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
   resp : Integer;
   sMsg : String;
   AlterarConta : Boolean;
   qryVerificaIgnoraDDA: TUMZQuery;
   qryNN : TUMZQuery;
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

   while not tblBloquetos.Eof do begin

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


            if ( (resp <> mrNo) AND (resp <> mrNoToAll) ) OR AlterarConta then begin


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
   iCdResponsa := tblBloquetos.FieldByName('cd_resp_finan').AsInteger;
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


           dSomaValor := dSomaValor + (tblBloquetos.FieldByName('ValorBruto').AsCurrency + tblBloquetos.FieldByName('ValorExtra').AsCurrency + tblBloquetos.FieldByName('ValorJuros').AsCurrency - tblBloquetos.FieldByName('DescontoExtra').AsCurrency);
           dSomaDesconto := dSomaDesconto + (tblBloquetos.FieldByName('ValorDesconto').AsCurrency);

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
              tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', dVencimento);

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
                 iCdResponsa := tblBloquetos.FieldByName('cd_resp_finan').AsInteger;
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

{ Função alterada por Claudionor Silveira
Data: 22/12/2011

Function TfrmRepBloquetos.PrepararBloquetosParaImpressao(sFiltro : String; Agrupado : Boolean; ContaImpressao : String) : Boolean;
const
   S_FIL_DATA_VENCTO_ORA = ' AND TO_CHAR(M.DATAVENCIMENTO, ''YYYY-MM-DD'') <= ''%s'' ';
   S_FIL_DATA_VENCTO_MYSQL = ' AND M.DATAVENCIMENTO <= ''%s'' ';
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
   qyBlImp, qyBlImpAcao : TUMZQuery;
   chaves : string;
   qBloqueio : TUMZQuery;

   sFiltroData : String;
   sNNsAntigos : String;
   resp : Integer;
   sMsg : String;   
begin

   DM.CriarConsulta(qBloqueio);

   // Verificar se o boleto está bloqueado
   qBloqueio.SQL.Text := ' SELECT sn_bloquear_boleto, dt_bloqueio_boleto FROM coligadas ' +
                         ' WHERE cd_coligada = ' + IntToStr(Dm.iColigadaSelecionada);

   qBloqueio.Open();

   sFiltroData := '';

   if qBloqueio.FieldByName('sn_bloquear_boleto').AsInteger = 1 then
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         sFiltroData := S_FIL_DATA_VENCTO_ORA
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         sFiltroData := S_FIL_DATA_VENCTO_MYSQL;
      sFiltroData := Format(sFiltroData, [FormatDateTime('yyyy-mm-dd', qBloqueio.FieldByName('DT_BLOQUEIO_BOLETO').AsDateTime)]);
   end;

   FreeAndNil(qBloqueio);

    resp := -1;


   // Arrumar o código da conta para emissão de boletos e o código da Coligada;
   if ContaImpressao <> '' then begin

      if Pos('=', ContaImpressao) > 0 then begin

         iConta := StrToInt(Copy(ContaImpressao, 1, Pos('=',ContaImpressao)-1));

      end else begin

         iConta := StrToInt(ContaImpressao);

      end;


      DM.CriarConsulta(qyBlImp);
      DM.CriarConsulta(qyBlImpAcao);

      qyBlImp.SQL.Text :=
            ' SELECT m.anosemestre, m.cd_caixa, m.bloqueto, m.codigoaluno, m.cd_mensalidade, m.cd_coligada, m.parcela, m.datavencimento, m.nossonumero ' +
            '      , p.nm_pessoa, t.ds_tipo_titulo, c.ds_caixa, m.turma ' +
            '   FROM mensalidades as m ' +
            '  INNER JOIN pessoas as p ON (p.cd_pessoa = m.codigoaluno) ' +
            '   LEFT JOIN fin_tipos_titulo as t ON (t.cd_tipo_titulo = m.cd_tipo_titulo AND t.cd_coligada = m.cd_coligada) ' +
            '   LEFT JOIN fin_cadastro_contas as c ON (c.cd_caixa = m.cd_caixa) ' +
            ' WHERE ' + sFiltro + sFiltroData;
      
      qyBlImp.Open();

      while not qyBlImp.Eof do begin
         if (qyBlImp.FieldByName('cd_caixa').AsInteger <> iConta)
            OR (qyBlImp.FieldByName('nossonumero').AsString = '')

         then begin

            if  (qyBlImp.FieldByName('cd_caixa').AsInteger <> iConta )
            AND (qyBlImp.FieldByName('nossonumero').AsString <> '')
            AND (qyBlImp.FieldByName('cd_caixa').AsInteger > 0)
            AND (DM.IsTrue(qyBlImp.FieldByName('bloqueto').AsString))
            AND (resp <> mrYesToAll)
            AND (resp <> mrNoToAll)

            THEN begin
                 sMsg := 'Você está alterando a conta de impressão do boleto de: ' + CHR(13) + CHR(13);
                 sMsg := sMsg + '      ' + qyBlImp.FieldByName('nm_pessoa').AsString + CHR(13);
                 sMsg := sMsg + '      ' + 'Parcela: ' + qyBlImp.FieldByName('parcela').AsString + ' - ' + qyBlImp.FieldByName('ds_tipo_titulo').AsString + CHR(13);
                 sMsg := sMsg + '      ' + 'Vencimento: ' + FormatDateTime('dd/mm/yyyy', qyBlImp.FieldByName('datavencimento').AsDateTime) + CHR(13);
                 sMsg := sMsg + '      ' + 'Nosso Número: ' + qyBlImp.FieldByName('nossonumero').AsString + CHR(13) + CHR(13);
                 sMsg := sMsg + 'que já havia sido impresso na conta ' + qyBlImp.FieldByName('ds_caixa').AsString + '.' + CHR(13) + 'Tem certeza que deseja alterar a conta?';

                 resp := MensagemCustomizavel(sMsg, mtConfirmation, [mbYes, mbYesToAll, mbNo, mbNoToAll], ['Sim', 'Não', 'Não para Todos', 'Sim para Todos'], 97 );
            end;

            if (resp <> mrNo) AND (resp <> mrNoToAll) then begin

            // Guardar o Log de Alteração de Nossonúmeros

                chaves := FillString(qyBlImp.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                       qyBlImp.FieldByName('anosemestre').AsString + ';' + qyBlImp.FieldByName('turma').AsString + ';' +
                       qyBlImp.FieldByName('parcela').AsString + ';' +
                       FormatDateTime('dd/mm/yyyy',qyBlImp.FieldByName('datavencimento').AsDateTime) + ';';

                sNossoNumero :=qyBlImp.FieldByName('nossonumero').AsString;

                qyBlImpAcao.SQL.Text :=
                ' UPDATE mensalidades SET cd_caixa = :cd_caixa, nossonumero = :nossonumero ' +
                '                   , bloqueto = "N" ' + // Colocado como N para não perguntar novamente se quer reimprimir na função inserirboletosindividuais
                '  WHERE cd_mensalidade = :cd_mensalidade ';

                qyBlImpAcao.ParamByName('cd_caixa').AsInteger := iConta;
                qyBlImpAcao.ParamByName('nossonumero').AsString := DM.NovoNumero(0, '', 0, 0, qyBlImpAcao.ParamByName('cd_caixa').AsInteger,qyBlImp.FieldByName('cd_coligada').AsInteger,qyBlImp.FieldByName('codigoaluno').AsInteger );
                qyBlImpAcao.ParamByName('cd_mensalidade').AsInteger := qyBlImp.FieldByName('cd_mensalidade').AsInteger;

                qyBlImpAcao.ExecSQL();

                if sNossoNumero = '' then begin
                   DM.setLog(2013, 'alteracao', chaves, qyBlImp.FieldByName('cd_coligada').AsInteger, 'Impressão primeiro Boleto (NN = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '")' );
                end else begin
                   DM.setLog(2013, 'alteracao', chaves, qyBlImp.FieldByName('cd_coligada').AsInteger, 'Alteração de Boletos (NN Atual = "'+ sNossoNumero +'" NN Novo = "' + qyBlImpAcao.ParamByName('nossonumero').AsString +  '" CONTA = "' + IntToStr(iConta) + '" )');
                end;

            end;
         end;

         qyBlImp.Next();
      end;

      FreeAndNil(qyBlImp);
      FreeAndNil(qyBlImpAcao);

      // Montar o SQL para impressão específica em uma conta

       tblBloquetos.Close();
       if Agrupado then begin

           tblBloquetos.SQL.Text :=
            ' SELECT DISTINCT                                                          ' +
            '   m2.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,        ' +
            '   r.nm_pessoa as responsavel, c.nr_banco banco, c.nm_banco,         ' +
            '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
            '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
            '   a.cd_resp_finan, c.cd_caixa                          ' +
            '   , COALESCE(tt.ds_grupo_boleto, ''A'') as ds_grupo_boleto ' +
            ' FROM (                                                                                       ' +
            '   mensalidades m                                                                             ' +
            '   INNER JOIN mensalidades m2 ON (m.codigoaluno = m2.codigoaluno AND m.datavencimento = m2.datavencimento AND m2.situacao in (2,10)) ' +
            '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
            '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
            '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
            '   INNER JOIN fin_cadastro_contas c ON ((c.cd_caixa = m.cd_caixa )) ' +
            '   LEFT JOIN fin_tipos_titulo as tt ON (m2.cd_tipo_titulo = tt.cd_tipo_titulo AND m2.cd_coligada = tt.cd_coligada) ' +
            ' WHERE                                                                                        ' +
            '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and                                                 ' +
            sFiltro + sFiltroData +
            ' ORDER BY m.codigoaluno, m.datavencimento, COALESCE(tt.ds_grupo_boleto, ''A''), m2.nossonumero = '''', m2.valorbruto DESC ' ;

       end else begin

          tblBloquetos.SQL.Text :=
            ' SELECT                                                                   ' +
            '   m.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,         ' +
            '   r.nm_pessoa as responsavel, d.*, c.nr_banco banco, c.nm_banco,         ' +
            '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
            '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
            '   m.cd_mensalidade, a.cd_resp_finan, c.cd_caixa, " " as ds_grupo_boleto  ' +
            ' FROM (                                                                                       ' +
            '   mensalidades m                                                                             ' +
            '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
            '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
            '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
            '   INNER JOIN departamentos d ON (m.depto = d.Codigo)                                         ' +
            '   INNER JOIN fin_cadastro_contas c ON ((c.cd_caixa = m.cd_caixa )) ' +
            ' WHERE                                                                                        ' +
            '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and                                                 ' +
            sFiltro + sFiltroData +
            ' ORDER BY m.codigoaluno, m.datavencimento, m.valorbruto DESC ' ;
       end;

   end else begin

       tblBloquetos.Close();

       if Agrupado then begin

          tblBloquetos.SQL.Text :=
            ' SELECT DISTINCT                                                                  ' +
            '   m2.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,         ' +
            '   r.nm_pessoa as responsavel, c.nr_banco banco, c.nm_banco,         ' +
            '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
            '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
            '   a.cd_resp_finan, c.cd_caixa                          ' +
            '   , IFNULL(tt.ds_grupo_boleto, ''A'') as ds_grupo_boleto ' +
            ' FROM (                                                                                       ' +
            '   mensalidades m                                                                             ' +
            '   INNER JOIN mensalidades m2 ON (m.codigoaluno = m2.codigoaluno AND m.datavencimento = m2.datavencimento AND m2.situacao in (2,10)) ' +
            '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
            '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
            '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
            '   INNER JOIN fin_cadastro_contas c ON ((c.cd_caixa = t.cd_caixa)  OR ' +
            '   (c.cd_caixa = d.cd_boleto_padrao AND (t.cd_caixa = 0 OR isNull(t.cd_caixa)) ))  ' +
            '   LEFT JOIN fin_tipos_titulo as tt ON (m2.cd_tipo_titulo = tt.cd_tipo_titulo AND m2.cd_coligada = tt.cd_coligada) ' +
            ' WHERE                                                                                        ' +
            '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and                                                 ' +
            sFiltro + sFiltroData +
            ' ORDER BY m.codigoaluno, m.datavencimento, COALESCE(tt.ds_grupo_boleto, ''A''), m2.nossonumero = '''', m2.valorbruto DESC ' ;

       end else begin

            tblBloquetos.SQL.Text :=
            ' SELECT                                                                   ' +
            '   m.*, a.ds_cpf cpf, r.ds_cpf cpf_responsavel, a.nm_pessoa nome,         ' +
            '   r.nm_pessoa as responsavel, d.*, c.nr_banco banco, c.nm_banco,         ' +
            '   c.nr_agencia agencia, c.nr_conta contacorrente, c.ds_mensagem_bloqueto,' +
            '   c.nr_uso_banco, c.nr_carteira, a.sn_bloqueto_empresa, a.cd_empresa,    ' +
            '   m.cd_mensalidade, a.cd_resp_finan, c.cd_caixa, '' '' as ds_grupo_boleto  ' +
            ' FROM (                                                                                       ' +
            '   mensalidades m                                                                             ' +
            '   INNER JOIN pessoas a ON  m.CodigoAluno = a.cd_pessoa)                                      ' +
            '   INNER JOIN pessoas r ON (a.cd_resp_finan = r.cd_pessoa)                                    ' +
            '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre )             ' +
            '   INNER JOIN departamentos d ON (m.depto = d.Codigo)                                         ' +
            '   INNER JOIN fin_cadastro_contas c ON ((c.cd_caixa = t.cd_caixa )  OR ' +
            '   (c.cd_caixa = d.cd_boleto_padrao AND (t.cd_caixa = 0 OR t.cd_caixa IS NULL) ))  ' +
            ' WHERE                                                                                        ' +
            '   (c.sn_ativa = ''S'') and m.situacao in (2,10) and                                                 ' +
            sFiltro + sFiltroData +
            ' ORDER BY m.codigoaluno, m.datavencimento, m.valorbruto DESC ' ;

       end;

   end;

   // Abre a tabela de Bloquetos para inserir os registros na tabela de Bloquetos;
   // Este procedimento deve

   // SE tiver cd_caixa na tabela de turmas, filtrar a conta com este campo
   // SENÃO verificar se tem o cd_boleto_padrao no cadastro de departamentos
   // SENÃO Enviar mensagem pedindo para configurar a conta no cadastro...

   // VERIFICAR O PARAMETRO PARA IMPRESSAO DE BOLETOS


   tblBloquetos.Open();
   tblBloquetos.FetchAll();

   if (tblBloquetos.IsEmpty) then begin
      Mensagem('Não foi possível selecionar os dados para impressão dos boletos. Alguma informação está pendente.', 'Atenção', MB_OK + MB_ICONWARNING);
      result := false;
      Exit;
   end;

   if not Agrupado then begin
      InserirBoletosIndividuais;
      result := true;
      Exit;
   end;

   // Inserir na tabela de Boletos

   tblAux.Close();
   tblAux.SQL.Text :=
      ' INSERT INTO fin_boleto (cd_resp_finan, cd_pessoa, nr_nossonumero, ' +
      '    dt_impressao, dt_vencimento, vl_boleto, vl_desconto, cd_conta, cd_coligada) ' +
      ' VALUES (:cd_resp_finan, :cd_pessoa, :nr_nossonumero, :dt_impressao, :dt_vencimento, :vl_boleto, :vl_desconto, :cd_conta, :cd_coligada) ';

   // Pegar Valores Iniciais
   sGrupo := tblBloquetosCodigoAluno.AsString + tblBloquetosDataVencimento.AsString + tblBloquetos.FieldByName('ds_grupo_boleto').AsString;

   iCdPessoa := tblBloquetosCodigoAluno.AsInteger;
   iCdResponsa := tblBloquetoscd_resp_finan.AsInteger;
   iConta := tblBloquetoscd_caixa.AsInteger;
   iColigada := tblBloquetoscd_coligada.AsInteger;
   sNossoNumero := tblBloquetosNossoNumero.AsString;
   dVencimento := tblBloquetosDataVencimento.AsDateTime;
   dSomaValor := 0;
   dSomaDesconto := 0;

   tblAux2.Close();
   tblAux2.SQL.Text := ' SELECT CD_BOLETO FROM FIN_BOLETO ORDER BY CD_BOLETO DESC';

   sCodigosMensa := '';

   sNNsAntigos := '';

   while not tblBloquetos.Eof do begin

           dSomaValor := dSomaValor + (tblBloquetosValorBruto.AsCurrency + tblBloquetosValorExtra.AsCurrency + tblBloquetosValorJuros.AsCurrency - tblBloquetosDescontoExtra.AsCurrency);
           dSomaDesconto := dSomaDesconto + (tblBloquetosValorDesconto.AsCurrency);

           sCodigosMensa := sCodigosMensa + tblBloquetoscd_mensalidade.AsString + ',';

           if tblBloquetosNossoNumero.AsString <> '' then begin
              sNNsAntigos := sNNsAntigos + tblBloquetosNossoNumero.AsString + '/';
           end;

           tblBloquetos.Next();

           if (sGrupo <> (tblBloquetosCodigoAluno.AsString + tblBloquetosDataVencimento.AsString + tblBloquetos.FieldByName('ds_grupo_boleto').AsString)) OR (tblBloquetos.Eof) then begin

              tblAux.ParamByName('cd_resp_finan').AsInteger := iCdResponsa;
              tblAux.ParamByName('cd_pessoa').AsInteger := iCdPessoa;
              tblAux.ParamByName('nr_nossonumero').AsString := sNossoNumero;
              tblAux.ParamByName('dt_impressao').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
              tblAux.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', dVencimento);
              tblAux.ParamByName('vl_boleto').AsCurrency := dSomaValor;
              tblAux.ParamByName('vl_desconto').AsCurrency := dSomaDesconto;
              tblAux.ParamByName('cd_conta').AsInteger := iConta;
              tblAux.ParamByName('cd_coligada').AsInteger := iColigada;
              tblAux.ExecSQL();

              // Pegar Código do Boleto inserido
              tblAux2.Close();
              tblAux2.Open();
              iBoleto := tblAux2.FieldByName('cd_boleto').AsInteger;

              // Atualizar o cd_boleto e o nossonúmero na tabela mensalidades

              sCodigosMensa := Copy(sCodigosMensa, 1, length(sCodigosMensa) - 1);

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

              // Guardar Log
              DM.setLog(2013, 'alteracao', chaves, tblBloquetoscd_coligada.AsInteger, 'Agrupamento de Boletos (NN = "' + sNNsAntigos +  '" PARA = "' + sNossoNumero + '")' );

              sCodigosMensa := '';

              sNNsAntigos := '';

              if not tblBloquetos.Eof then begin

                 sGrupo := tblBloquetosCodigoAluno.AsString + tblBloquetosDataVencimento.AsString + tblBloquetos.FieldByName('ds_grupo_boleto').AsString;

                 iCdPessoa := tblBloquetosCodigoAluno.AsInteger;
                 iCdResponsa := tblBloquetoscd_resp_finan.AsInteger;
                 iConta := tblBloquetoscd_caixa.AsInteger;
                 iColigada := tblBloquetoscd_coligada.AsInteger;
                 sNossoNumero := tblBloquetosNossoNumero.AsString;
                 dVencimento := tblBloquetosDataVencimento.AsDateTime;
                 dSomaValor := 0;
                 dSomaDesconto := 0;

              end;


           end;


   end;

   Result := True;

end;
-- Fim prepararbloquetoparaimpressao}

end.

