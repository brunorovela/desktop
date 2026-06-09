unit uExportaContabil;

interface

uses DB, ZConnection, uDM, Dialogs, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Windows, Classes, SysUtils;

Type
   TAcao = (acGerarTituloCR, acBaixarTituloCR, acCancelarTituloCR);


   Procedure IncluirAcaoContabil(Titulo : Integer; Acao : TAcao);
//   Procedure AlterarAcaoContabil(Titulo : Integer; Acao : TAcao);
//   Procedure ExcluirAcaoContabil(Titulo : Integer; Acao : TAcao);

//   Function ExisteAcaoContabil(Titulo : Integer; Acao : TAcao) : Boolean;

   Function SelecionarCodigoAcao(Acao : TAcao) : Integer;



implementation


Function SelecionarCodigoAcao(Acao : TAcao) : Integer;
// Procura por uma ação ATIVA na tabela fin_exporta_contabil_acoes
// Retornando o código da mesma ou -1 quando não ativa ou inexistente

Var
   qAcao : TUMZQuery;
begin

   Dm.CriarConsulta(qAcao);

   try
      qAcao.SQL.Text :=
        ' SELECT cd_acao FROM fin_exporta_contabil_acoes ' +
        ' WHERE ds_acao = :acao AND sn_ativo = 1 ';

      case Acao of
         acGerarTituloCR:
            qAcao.ParamByName('acao').AsString := 'acGerarTituloCR' ;
         acBaixarTituloCR:
            qAcao.ParamByName('acao').AsString := 'acBaixarTituloCR' ;
         acCancelarTituloCR:
            qAcao.ParamByName('acao').AsString := 'acCancelarTituloCR' ;
         else
            result := -1;
            Exit;
      end;

      qAcao.Open();
   Except
      // Caso não exista a tabela fin_exporta_contabil
      result := 1;
      Exit;
   end;

   if qAcao.IsEmpty then begin
      result := -1;
   end else begin
      result := qAcao.FieldByName('cd_acao').AsInteger;
   end;

   FreeAndNil(qAcao);

end;



Procedure IncluirAcaoContabil(Titulo : Integer; Acao : TAcao);
// Insere uma Acao na tabela fin_exporta_contabil
Var
   qAcao : TUMZQuery;
   iCodAcao : Integer;
   sHistorico : String;
begin

   iCodAcao := SelecionarCodigoAcao(Acao);

   if iCodAcao < 0 then begin
      // Ação inexistente ou não liberada para uso

      exit;

   end;

   DM.CriarConsulta(qAcao);

   qAcao.SQL.Text :=
    ' INSERT INTO fin_exporta_contabil  ( ' +
    '    cd_exporta,                      ' +
    '    cd_acao,                         ' +
    '    cd_titulo,                       ' +
    '    dt_registro,                     ' +
    '    dt_movimento,                    ' +
    '    cd_debito,                       ' +
    '    cd_credito,                      ' +
    '    vl_movimento,                    ' +
    '    ds_historico,                    ' +
    '    sn_exportado                     ' +
    ' ) ';

   case Acao of

      acGerarTituloCR : begin
         // Buscar as informações da mensalidade

         sHistorico := 'CONCAT(t.ds_tipo_titulo, " - Parc. ", m.parcela, " - " , pe.nm_pessoa)'; 
         qAcao.SQL.Add(
           ' SELECT NULL,                 ' +
           '   ' + IntToStr(iCodAcao)  + ', ' +
           '   m.cd_mensalidade,            ' +
           '   now(),                       ' +
           '   m.datavencimento,            ' +
           '   pd.cd_conta_contabil,        ' +
           '   pc.cd_conta_contabil,        ' +
           '   IFNULL(m.valorbruto, 0) + IFNULL(m.valorextra,0) - IFNULL(descontoextra,0), ' +
           '   ' + sHistorico + ',          ' +
           '   0                            ' +
           ' FROM                           ' +
           '   mensalidades m               ' +
           '   INNER JOIN fin_tipos_titulo t ON ( m.cd_tipo_titulo = t.cd_tipo_titulo AND m.cd_coligada = t.cd_coligada ) ' +
           '   INNER JOIN fin_plano_contas pd ON ( t.cd_coligada = pd.cd_coligada AND t.cd_conta_debito = pd.cd_conta) ' +
           '   INNER JOIN fin_plano_contas pc ON ( t.cd_coligada = pc.cd_coligada AND t.cd_conta = pc.cd_conta) ' +
           '   INNER JOIN pessoas pe ON (m.codigoaluno = pe.cd_pessoa)  '+ 
           ' WHERE                          ' +
           '   m.cd_mensalidade = ' + IntToStr(Titulo)
         );
      
      end;

      acBaixarTituloCR : begin
         // Buscar as informações do fin_mov_tesouraria

         sHistorico := 'CONCAT("Pgto - ", t.ds_tipo_titulo, " - Parc. ", m.parcela, " - " , pe.nm_pessoa)'; 
         qAcao.SQL.Add(
           ' SELECT NULL,                 ' +
           '   ' + IntToStr(iCodAcao)  + ', ' +
           '   m.cd_mensalidade,            ' +
           '   now(),                       ' +
           '   m.datapagamento,             ' +
           '   pd.cd_conta_contabil,        ' +
           '   pc.cd_conta_contabil,        ' +
           '   m.valorpago,                 ' +
           '   ' + sHistorico + ',          ' +
           '   0                            ' +
           ' FROM                           ' +
           '   mensalidades m               ' +
           '   INNER JOIN fin_mov_tesouraria mt ON (m.cd_mensalidade = mt.cd_mensalidade AND m.cd_coligada = mt.cd_coligada AND mt.nr_estorno = 0) ' +
           '   INNER JOIN fin_cadastro_contas cc ON (mt.cd_caixa = cc.cd_caixa) ' +
           '   INNER JOIN fin_tipos_titulo t ON ( m.cd_tipo_titulo = t.cd_tipo_titulo AND m.cd_coligada = t.cd_coligada ) ' +
           '   INNER JOIN fin_plano_contas pd ON ( cc.cd_coligada = pd.cd_coligada AND cc.cd_plano_conta = pd.cd_conta) ' +
           '   INNER JOIN fin_plano_contas pc ON ( t.cd_coligada = pc.cd_coligada AND t.cd_conta_debito = pc.cd_conta) ' +
           '   INNER JOIN pessoas pe ON (m.codigoaluno = pe.cd_pessoa)  '+ 
           ' WHERE                          ' +
           '   m.cd_mensalidade = ' + IntToStr(Titulo)
         );
      
      end;

   end;

   qAcao.ExecSQL();
   FreeAndNil(qAcao);
      
end;


end.

