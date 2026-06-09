unit ClassPlanosPagamento;

interface

uses
   Forms, SysUtils, Classes, UZDataSet, ClassRegistros, Controls, Variants;

Type
   TClassePlanosPagamento = class(TObject)

      private
      protected
      public 
         function GetParcelaFromTipoTitulo( cd_tipo_titulo: Integer ): Integer;
         function hasDistratoContratual( nr_anosemestre: Integer; cd_curso, cd_turma: String;
                                         cd_pessoa, cd_situacao: Integer ): Boolean;
         function getDistratoContratual( nr_anosemestre: Integer; cd_curso, cd_turma: String;
                                         cd_pessoa: Integer; sTitulosCancelados : string  ): ClasseRegistros;

         // Essa função foi criada para pegar os códigos dos títulos cancelados antes de efetuar
         // qualquer cancelamento de matrícula. Isso se faz necessário pois esses títulos não poderão
         // ser utilizados para compor a selação de mensalidades para geração das multas.

         function getDistratoTitulosCancelados( nr_anosemestre: Integer; cd_curso, cd_turma: String;
                                         cd_pessoa: Integer ): String;

         procedure GeraMensalidadeDistratoContratual( nr_anosemestre: Integer; cd_curso, cd_turma: String;
                                         cd_pessoa: Integer; sTitulosCancelados : string );
         function CopiaPlanoPagamento( const cd_plano, cd_coligada, nr_anosemestre: Integer;
                                         dt_apartir: TDateTime; const CopiaTurmas: Boolean;
                                         const CalculaParcelas: Boolean;
                                         const CopiarItens: Boolean ): Integer;

         function getPlanoFromTurma( const nr_anosemestre, cd_coligada, cd_plano_matricula: Integer;
                                     const cd_curso, cd_turma: String ): Double;

   end;

var
   ClassePlanosPagamento: TClassePlanosPagamento;

implementation

uses uDM, DB, ClassCursos, ClassTurmas, General, uRepRecibo, Main,
  uRepBloquetos, uUsuario, uImpMens, Dialogs;

{ TClassePlanosPagamento }

function TClassePlanosPagamento.CopiaPlanoPagamento(const cd_plano, cd_coligada,
   nr_anosemestre: Integer; dt_apartir: TDateTime; const CopiaTurmas: Boolean;
   const CalculaParcelas: Boolean; const CopiarItens: Boolean): Integer;
const
   SQL_COPIA_PLANO_PAGAMENTO =
      ' INSERT INTO FIN_PLANOS ( ' +
      '    CD_PLANO, CD_COLIGADA, CD_TIPO_PLANO, DS_PLANO, ' +
      '    NR_ANOSEMESTRE, NR_PARCELAS, VL_COBRADO, VL_CONTRATO, ' +
      '    VL_TAXAMATERIAL, VL_TAXAAPOSTILA, VL_DESCONTO, ' +
      '    VL_MATRICULA, DT_APARTIR, NR_TAXASMATERIAL, ' +
      '    DS_PARAGRAFO3, NR_DIAS_PARCELA_ZERO, SN_DIAS_UTEIS, ' +
      '    SN_CREDITOS, NR_CREDITOS_BASE, NR_MAX_DISCIPLINAS, ' +
      '    cd_acao_movimento_desc_cond, cd_acao_movimento_desc_fixo,sn_vigencia, ' +
      ' SN_USAR_MATRICULA_ONLINE, NR_TIPO_VENCTO, NR_FORMULA_VENCTO, NR_FORMULA_OPERADOR, ' +
      ' NR_FORMULA_DIAS, NR_ORDEM '+
      ' ) ' +
      ' SELECT ' +
      '    NULL, :CD_COLIGADA, CD_TIPO_PLANO, DS_PLANO, ' +
      '    :NR_ANOSEMESTRE, NR_PARCELAS, VL_COBRADO, VL_CONTRATO, ' +
      '    VL_TAXAMATERIAL, VL_TAXAAPOSTILA, VL_DESCONTO, ' +
      '    VL_MATRICULA, :DT_APARTIR, NR_TAXASMATERIAL, ' +
      '    DS_PARAGRAFO3, NR_DIAS_PARCELA_ZERO, SN_DIAS_UTEIS, ' +
      '    SN_CREDITOS, NR_CREDITOS_BASE, NR_MAX_DISCIPLINAS, ' +
      '    cd_acao_movimento_desc_cond, cd_acao_movimento_desc_fixo,sn_vigencia, SN_USAR_MATRICULA_ONLINE, ' +
      ' NR_TIPO_VENCTO, NR_FORMULA_VENCTO, NR_FORMULA_OPERADOR, NR_FORMULA_DIAS, NR_ORDEM ' +
      ' FROM FIN_PLANOS ' +
      ' WHERE CD_PLANO = :CD_PLANO ';

   SQL_COPIA_ITENS_PLANO =
      ' INSERT INTO fin_planos_itens ( '+
	   ' cd_plano, nr_parcela, vl_bruto, vl_desconto, vl_extra, vl_desconto_extra, vl_total, nr_dia, '+
	   ' nr_mes, nr_ano, nr_creditos_minimos, sn_credito_parcela, cd_tipo_parcela, sn_divisivel, '+
      ' NR_FORMULA_VENCTO, NR_FORMULA_OPERADOR, NR_FORMULA_DIAS  ' +
      ') SELECT '+
		' :cd_plano_novo, nr_parcela, vl_bruto, vl_desconto, vl_extra, vl_desconto_extra, vl_total, nr_dia, '+
		' nr_mes, nr_ano, nr_creditos_minimos, sn_credito_parcela, cd_tipo_parcela, sn_divisivel, '+
      ' NR_FORMULA_VENCTO, NR_FORMULA_OPERADOR, NR_FORMULA_DIAS  ' +
	   'FROM '+
		' fin_planos_itens '+
	   'WHERE '+
		' CD_PLANO = :cd_plano ';

   SQL_COPIA_PLANO_TURMAS =
      ' INSERT INTO FIN_PLANOS_TURMAS ( ' +
      '    CD_PLANO, CD_CURSO, CD_TURMA ' +
      ' ) ' +
      ' SELECT :CD_PLANO_NOVO, fpt.CD_CURSO, fpt.CD_TURMA ' +
      ' FROM fin_planos_turmas fpt ' +
      '      INNER JOIN turmas t ON ( ' +
      '         t.curso = fpt.CD_CURSO AND t.codigo = fpt.CD_TURMA AND ' +
      '         t.anosemestre = :NR_ANOSEMESTRE AND t.cd_coligada in [$COLIGADAS$] ' +
      '      ) ' +
      ' WHERE fpt.CD_PLANO = :CD_PLANO ';

   SQL_COPIA_DISTRATO =
      ' INSERT INTO FIN_PLANOS_DISTRATOS ( ' +
      '    CD_DISTRATO, CD_PLANO, VL_COBRANCA, SN_ATIVO, CD_TIPO_VALOR, ' +
      '    NR_DIAS_VENCIMENTO, CD_TIPO_TITULO ' +
      ' ) ' +
      ' SELECT ' +
      '    NULL, :CD_PLANO_NOVO, VL_COBRANCA, SN_ATIVO, CD_TIPO_VALOR, ' +
      '    NR_DIAS_VENCIMENTO, CD_TIPO_TITULO ' +
      ' FROM FIN_PLANOS_DISTRATOS ' +
      ' WHERE CD_PLANO = :CD_PLANO ';

   SQL_COPIA_DISTRATO_SITUACOES_MATRICULA =
      ' INSERT INTO FIN_PLANOS_DISTRATOS_SIT_MATRI ( ' +
      '    CD_DISTRATO, CD_SITUACAO ' +
      ' ) ' +
      ' SELECT :CD_DISTRATO_NOVO, fpdsm.CD_SITUACAO ' +
      ' FROM fin_planos_distratos fpd ' +
      '      INNER JOIN FIN_PLANOS_DISTRATOS_SIT_MATRI fpdsm ON (fpdsm.CD_DISTRATO = fpd.CD_DISTRATO) ' +
      ' WHERE fpd.CD_PLANO = :CD_PLANO ';

   SQL_COPIA_DISTRATO_TIPOS_TITULO =
      ' INSERT INTO FIN_PLANOS_DISTRATOS_TIPO_TITU ( ' +
      '    CD_DISTRATO, CD_TIPO_TITULO ' +
      ' ) ' +
      ' SELECT :CD_DISTRATO_NOVO, fpdsm.CD_TIPO_TITULO ' +
      ' FROM fin_planos_distratos fpd ' +
      '      INNER JOIN fin_planos_distratos_tipo_titu fpdsm ON (fpdsm.CD_DISTRATO = fpd.CD_DISTRATO) ' +
      ' WHERE fpd.CD_PLANO = :CD_PLANO ';
      
var
   qyCopiaPlanoPagamento: TUMZQuery;
   cd_plano_novo, cd_distrato_novo: Integer;
begin
   DM.CriarConsulta(qyCopiaPlanoPagamento);

   { Faz cópia do Plano de Pagamento } 
   qyCopiaPlanoPagamento.SQL.Text := SQL_COPIA_PLANO_PAGAMENTO;

   qyCopiaPlanoPagamento.ParamByName('CD_PLANO').AsInteger := cd_plano;
   qyCopiaPlanoPagamento.ParamByName('CD_COLIGADA').AsInteger := cd_coligada;
   qyCopiaPlanoPagamento.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyCopiaPlanoPagamento.ParamByName('DT_APARTIR').AsDateTime := dt_apartir;

   qyCopiaPlanoPagamento.ExecSQL();
   cd_plano_novo := DM.LastInsert();

   qyCopiaPlanoPagamento.Close();

   { Copia as Turmas }
   if ( CopiaTurmas ) then
   begin
      qyCopiaPlanoPagamento.SQL.Text := StringReplace(SQL_COPIA_PLANO_TURMAS, '[$COLIGADAS$]', '(' + DM.GetUsuarioLogado.GetColigadasFilhaSelecionada + ')', [rfReplaceAll]);

      qyCopiaPlanoPagamento.ParamByName('CD_PLANO').AsInteger := cd_plano;
      qyCopiaPlanoPagamento.ParamByName('CD_PLANO_NOVO').AsInteger := cd_plano_novo;
      qyCopiaPlanoPagamento.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;

      qyCopiaPlanoPagamento.ExecSQL();
      qyCopiaPlanoPagamento.Close();
   end;

   if CopiarItens then
   begin
      qyCopiaPlanoPagamento.SQL.Text := SQL_COPIA_ITENS_PLANO;

      qyCopiaPlanoPagamento.ParamByName('cd_plano').AsInteger := cd_plano;
      qyCopiaPlanoPagamento.ParamByName('cd_plano_novo').AsInteger := cd_plano_novo;

      qyCopiaPlanoPagamento.ExecSQL();
      qyCopiaPlanoPagamento.Close()
   end;

   { Copia os Distratos }
   qyCopiaPlanoPagamento.SQL.Text := SQL_COPIA_DISTRATO;

   qyCopiaPlanoPagamento.ParamByName('CD_PLANO').AsInteger := cd_plano;
   qyCopiaPlanoPagamento.ParamByName('CD_PLANO_NOVO').AsInteger := cd_plano_novo;

   qyCopiaPlanoPagamento.ExecSQL();
   cd_distrato_novo := DM.LastInsert();

   qyCopiaPlanoPagamento.Close();

   { Copia as situações de matrículas do Distrato }
   qyCopiaPlanoPagamento.SQL.Text := SQL_COPIA_DISTRATO_SITUACOES_MATRICULA;

   qyCopiaPlanoPagamento.ParamByName('CD_PLANO').AsInteger := cd_plano;
   qyCopiaPlanoPagamento.ParamByName('CD_DISTRATO_NOVO').AsInteger := cd_distrato_novo;

   qyCopiaPlanoPagamento.ExecSQL();
   qyCopiaPlanoPagamento.Close();

   { Copia os tipos de titulos do Distrato } 
   qyCopiaPlanoPagamento.SQL.Text := SQL_COPIA_DISTRATO_TIPOS_TITULO;

   qyCopiaPlanoPagamento.ParamByName('CD_PLANO').AsInteger := cd_plano;
   qyCopiaPlanoPagamento.ParamByName('CD_DISTRATO_NOVO').AsInteger := cd_distrato_novo;

   qyCopiaPlanoPagamento.ExecSQL();
   qyCopiaPlanoPagamento.Close();

   Result := cd_plano_novo;
end;

procedure TClassePlanosPagamento.GeraMensalidadeDistratoContratual(
  nr_anosemestre: Integer; cd_curso, cd_turma: String; cd_pessoa: Integer; sTitulosCancelados : string);
var
   arrDistrato: ClasseRegistros;
   cd_coligada_turma, cd_depto_turma, cd_mensalidade, nr_parcela: Integer;
   sMensagem: String;
   dt_vencimento : TDateTime;
begin
   arrDistrato := Self.getDistratoContratual( nr_anosemestre, cd_curso, cd_turma, cd_pessoa, sTitulosCancelados );
   cd_coligada_turma := DM.getColigadaByTurma(cd_turma, nr_anosemestre);
   cd_depto_turma := ClasseCursos.GetDepartamento( cd_curso, cd_coligada_turma );
   dt_vencimento := Date+arrDistrato.Campo['NR_DIAS_VENCIMENTO'];
   nr_parcela := Self.GetParcelaFromTipoTitulo( arrDistrato.Campo['CD_TIPO_TITULO'] );

   if arrDistrato.Campo['VL_MENSALIDADE'] > 0 then begin

      cd_mensalidade := DM.GerarMensalidade(
         cd_pessoa,
         nr_parcela,
         cd_turma,
         arrDistrato.Campo['VL_MENSALIDADE'],
         0,
         nr_anosemestre,
         dt_vencimento,
         dt_vencimento,
         2, // Situação de Pendente
         cd_curso, // Departamento do Curso
         cd_depto_turma,
         0,
         -1,
         0,
         0,
         'Distrato Contratual Turma: ' + cd_turma,
         arrDistrato.Campo['CD_TIPO_TITULO'],
         arrDistrato.Campo['CD_PLANO'],
         ClasseTurmas.GetCentroCusto(nr_anosemestre, cd_curso, cd_turma, cd_coligada_turma),
         0,
         0,
         'N',
         0,
         0,
         10,
         0,
         0, // 0 = Dentro da função é recuperado o cd_resp_finan
         cd_coligada_turma
      );

      sMensagem := 'Operação realizada com sucesso. '+
                  'Existe uma regra de Distrato Contratual configurada para esta Turma.' +
                  Chr(13) + 'Foi gerado um valor de R$ ' + FormatFloat('###,###,##0.00',arrDistrato.Campo['VL_MENSALIDADE']) +
                  ' com vencimento em ' + FormatDateTime('DD/MM/YYYY', (Date+arrDistrato.Campo['NR_DIAS_VENCIMENTO'])) + '.';

      case  MensagemCustomizavel(sMensagem, mtConfirmation, mbOKCancel, ['Fechar', 'Fechar e Imprimir'],170) of
         { Se for 1 não tem o que fazer, somente fecha a mensagem
         1: begin
            //
         end; }
         mrCancel : begin
            if not DM.UsuarioLogado.TemPermissao( 2002, npAcesso, True ) then Exit;
            try
               Application.CreateForm(TfrmImpMens, frmImpMens);

               frmImpMens.radSelecionado.Checked := True;
               frmImpMens.chkAgrupar.Checked := False;

               frmImpMens.RecMensalidade.CodigoAluno := cd_pessoa;
               frmImpMens.RecMensalidade.CodigoDepto := cd_depto_turma;
               frmImpMens.RecMensalidade.AnoSemestre := nr_anosemestre;
               frmImpMens.RecMensalidade.CodigoColigada := cd_coligada_turma;
               frmImpMens.RecMensalidade.CodigoMensalidade := cd_mensalidade;
               frmImpMens.RecMensalidade.CodTurma := cd_turma;
               frmImpMens.Imprimir();
               frmImpMens.Close();
            finally
               frmImpMens.Free;
            end;
         end;
      end;

   end;

end;

function TClassePlanosPagamento.getDistratoContratual(nr_anosemestre: Integer;
   cd_curso, cd_turma: String; cd_pessoa: Integer; sTitulosCancelados : string ): ClasseRegistros;
const
   SQL_GETDISTRATOCONTRATUAL =
      ' SELECT fpd.* ' +
      ' FROM matriculas m ' +
      '      INNER JOIN fin_planos_distratos fpd ON ( fpd.CD_PLANO = m.planopagamento ) ' +
      ' WHERE fpd.SN_ATIVO = 1 AND m.curso = :CD_CURSO AND m.turma = :CD_TURMA AND ' +
      '       m.anosemestre = :NR_ANOSEMESTRE AND m.codigoaluno = :CD_PESSOA ' +
      '';

   SQL_GETVALORDISTRATOCONTRATUAL =
      ' SELECT SUM(valorbruto) AS valor ' +
      ' FROM mensalidades ' +
      ' WHERE curso = :CD_CURSO AND turma = :CD_TURMA AND ' +
      '       anosemestre = :NR_ANOSEMESTRE AND codigoaluno = :CD_PESSOA AND ' +
      '       cd_tipo_titulo IN ( SELECT CD_TIPO_TITULO FROM FIN_PLANOS_DISTRATOS_TIPO_TITU WHERE CD_DISTRATO = :CD_DISTRATO ) ';

   SQL_GETVALORDISTRATOCONTRATUAL_PROPOCIONAL_MES_VENCIMENTO =
      ' SELECT SUM(                                                                                                                          '+
      '           IF(                                                                                                                        '+
      '              MONTH(datavencimento) = MONTH(NOW()) and YEAR(datavencimento) = YEAR(NOW()),                                                                                   '+
      '              (valorbruto /DAY(last_day(NOW())) * day(NOW())) +                                                                       '+
      '              ((valorbruto - (valorbruto /DAY(last_day(NOW())) * day(NOW()))) * :percentual /100 ), valorbruto * :percentual /100)    '+
      '        ) AS valor                                                                                                                    '+
      ' FROM mensalidades                                                                                                                    '+
      ' WHERE curso = :CD_CURSO AND turma = :CD_TURMA AND                                                                                    '+
      '       anosemestre = :NR_ANOSEMESTRE AND codigoaluno = :CD_PESSOA AND                                                                 '+
      '       cd_tipo_titulo IN ( SELECT CD_TIPO_TITULO FROM FIN_PLANOS_DISTRATOS_TIPO_TITU WHERE CD_DISTRATO = :CD_DISTRATO )               ';

   FILTRO_A_VENCER = ' AND datavencimento >= now() ';

   FILTRO_A_VENCER_MAIS_MES = ' AND (datavencimento >= now() OR MONTH(datavencimento) = MONTH(NOW()))';   

   FILTRO_VENCIDOS = ' AND datavencimento < now() ';
var
   qyGetDistratoContratual : TUMZQuery;
begin
   DM.CriarConsulta(qyGetDistratoContratual);
   Result := ClasseRegistros.Create();

   qyGetDistratoContratual.SQL.Text := SQL_GETDISTRATOCONTRATUAL;
   qyGetDistratoContratual.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyGetDistratoContratual.ParamByName('CD_CURSO').AsString := cd_curso;
   qyGetDistratoContratual.ParamByName('CD_TURMA').AsString := cd_turma;
   qyGetDistratoContratual.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyGetDistratoContratual.Open();

   Result.CarregarQuery(qyGetDistratoContratual);

   if ( Result.Campo['CD_TIPO_VALOR'] = 1 ) then
   begin
      Result.Campo['VL_MENSALIDADE'] := Result.Campo['VL_COBRANCA'];
   end else begin
      qyGetDistratoContratual.Close();
      qyGetDistratoContratual.SQL.Text := SQL_GETVALORDISTRATOCONTRATUAL;

      if ( Result.Campo['SN_TIPO_PARCELA'] = 3 ) then
      begin
        // Para este caso a soma dos valores é diferenciada
        // Proporcao da parcela referente aos dias que já passaram do mês (cobrados integralmente) + percentual de cancelamento aplicado sobre os dias restantes + soma das demais parcelas pendentes
        qyGetDistratoContratual.SQL.Text := SQL_GETVALORDISTRATOCONTRATUAL_PROPOCIONAL_MES_VENCIMENTO;
        qyGetDistratoContratual.sql.Add( FILTRO_A_VENCER_MAIS_MES );
      end
      else if ( Result.Campo['SN_TIPO_PARCELA'] = 2 ) then
      begin
        qyGetDistratoContratual.sql.Add( FILTRO_A_VENCER );
      end
      else if( Result.Campo['SN_TIPO_PARCELA'] = 1 ) then
      begin
        qyGetDistratoContratual.sql.Add( FILTRO_VENCIDOS );
      end;

      qyGetDistratoContratual.SQL.Add(' AND cd_mensalidade not in (' + sTitulosCancelados + ') ');
      
      qyGetDistratoContratual.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
      qyGetDistratoContratual.ParamByName('CD_CURSO').AsString := cd_curso;
      qyGetDistratoContratual.ParamByName('CD_TURMA').AsString := cd_turma;
      qyGetDistratoContratual.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
      qyGetDistratoContratual.ParamByName('CD_DISTRATO').AsInteger := Result.Campo['CD_DISTRATO'];
      if ( Result.Campo['SN_TIPO_PARCELA'] = 3 ) then
      begin
         qyGetDistratoContratual.ParamByName('percentual').AsFloat := Result.CampoDouble['VL_COBRANCA'];
      end;
      qyGetDistratoContratual.Open();

      // Para o tipo_parcela = 3 precisei já fazer o calculo pelo SQL
      if ( Result.Campo['SN_TIPO_PARCELA'] <> 3 ) then
      begin
         Result.Campo['VL_MENSALIDADE'] := ((qyGetDistratoContratual.FieldByName('valor').AsFloat * Result.CampoDouble['VL_COBRANCA']) / 100);
      end
      else
      begin
         Result.Campo['VL_MENSALIDADE']   := qyGetDistratoContratual.FieldByName('valor').AsFloat;
      end;
   end;

   FreeAndNil(qyGetDistratoContratual);
end;

function TClassePlanosPagamento.getDistratoTitulosCancelados(
  nr_anosemestre: Integer; cd_curso, cd_turma: String;
  cd_pessoa: Integer): String;
const

     SQL_GETTITULOS_CANCELADOS =
      ' SELECT IFNULL(GROUP_CONCAT(cd_mensalidade), ''-1'') AS registros ' +
      ' FROM mensalidades ' +
      ' WHERE situacao in (4,5) AND curso = :CD_CURSO AND turma = :CD_TURMA AND ' +
      '       anosemestre = :NR_ANOSEMESTRE AND codigoaluno = :CD_PESSOA';
var
   qyGetDistratoContratual : TUMZQuery;
begin

   // Essa função foi criada para pegar os códigos dos títulos cancelados antes de efetuar
   // qualquer cancelamento de matrícula. Isso se faz necessário pois esses títulos não poderão
   // ser utilizados para compor a selação de mensalidades para geração das multas.


   DM.CriarConsulta(qyGetDistratoContratual);

   qyGetDistratoContratual.SQL.Text := SQL_GETTITULOS_CANCELADOS;

   qyGetDistratoContratual.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyGetDistratoContratual.ParamByName('CD_CURSO').AsString := cd_curso;
   qyGetDistratoContratual.ParamByName('CD_TURMA').AsString := cd_turma;
   qyGetDistratoContratual.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyGetDistratoContratual.Open();

   result := qyGetDistratoContratual.FieldByName('registros').AsString;

   FreeAndNil(qyGetDistratoContratual);
end;

function TClassePlanosPagamento.GetParcelaFromTipoTitulo(
  cd_tipo_titulo: Integer ): Integer;
const
   SQL_GETPARCELAFROMTIPOTITULO =
      ' SELECT nr_parcela FROM fin_tipos_titulo WHERE cd_tipo_titulo = :CD_TIPO_TITULO ';
var
   qyGetParcelaFromTipoTitulo: TUMZQuery;
begin
   DM.CriarConsulta(qyGetParcelaFromTipoTitulo);

   qyGetParcelaFromTipoTitulo.SQL.Text := SQL_GETPARCELAFROMTIPOTITULO;
   qyGetParcelaFromTipoTitulo.ParamByName('CD_TIPO_TITULO').AsInteger := cd_tipo_titulo;
   qyGetParcelaFromTipoTitulo.Open();

   Result := qyGetParcelaFromTipoTitulo.FieldByName('nr_parcela').AsInteger;
   FreeAndNil(qyGetParcelaFromTipoTitulo);
end;

function TClassePlanosPagamento.hasDistratoContratual(nr_anosemestre: Integer;
   cd_curso, cd_turma: String; cd_pessoa, cd_situacao: Integer): Boolean;
const
   SQL_HASDISTRATOCONTRATUAL =
      ' SELECT COUNT(*) AS registros ' +
      ' FROM matriculas m ' +
      '      INNER JOIN fin_planos_distratos fpd ON ( fpd.CD_PLANO = m.planopagamento ) ' +
      '      INNER JOIN fin_planos_distratos_sit_matri fpdst ON (fpdst.CD_DISTRATO = fpd.CD_DISTRATO) ' +
      ' WHERE fpd.SN_ATIVO = 1 AND m.curso = :CD_CURSO AND m.turma = :CD_TURMA AND ' +
      '       m.anosemestre = :NR_ANOSEMESTRE AND m.codigoaluno = :CD_PESSOA AND ' +
      '       fpdst.CD_SITUACAO = :CD_SITUACAO ' +
      '';
var
   qyHasDistratoContratual: TUMZQuery;
begin
   DM.CriarConsulta(qyHasDistratoContratual);

   qyHasDistratoContratual.SQL.Text := SQL_HASDISTRATOCONTRATUAL;
   qyHasDistratoContratual.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyHasDistratoContratual.ParamByName('CD_CURSO').AsString := cd_curso;
   qyHasDistratoContratual.ParamByName('CD_TURMA').AsString := cd_turma;
   qyHasDistratoContratual.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyHasDistratoContratual.ParamByName('CD_SITUACAO').AsInteger := cd_situacao;
   qyHasDistratoContratual.Open();

   Result := (qyHasDistratoContratual.FieldByName('registros').AsInteger > 0);

   FreeAndNil(qyHasDistratoContratual);
end;

function TClassePlanosPagamento.getPlanoFromTurma(const nr_anosemestre, cd_coligada, cd_plano_matricula: Integer; const cd_curso, cd_turma: String): Double;
const
   SQL_DADOS_PLANO_FROM_PLANO_TURMA =
      ' SELECT CASE WHEN fp.SN_CREDITOS = 1 THEN (fp.VL_COBRADO / fp.NR_CREDITOS_BASE) ELSE 0 END AS VL_CREDITO, ' +
      '        fp.NR_PARCELAS ' +
      ' FROM fin_planos_turmas fpt ' +
      '      INNER JOIN fin_planos fp ON ( fp.CD_PLANO = fpt.CD_PLANO ) ' +
      '      INNER JOIN turmas as t ON (t.codigo = fpt.cd_turma AND t.anosemestre = fp.NR_ANOSEMESTRE AND t.CD_PLANO_PADRAO = fp.CD_PLANO) ' +
      '      INNER JOIN coligadas c ON (c.cd_coligada_matriz = fp.CD_COLIGADA) ' +
      ' WHERE fp.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND c.CD_COLIGADA = :CD_COLIGADA AND ' +
      '       fpt.CD_CURSO = :CD_CURSO AND fpt.CD_TURMA = :CD_TURMA ';
   SQL_GET_PARCELAS_FROM_PLANO_MATRICULA =
      'SELECT NR_PARCELAS FROM fin_planos WHERE cd_plano = :CD_PLANO';
var
   qyGetDadosFromPlanoTurma: TUMZReadOnlyQuery;
   qyGetParcelasFromPlanoMatricula: TUMZReadOnlyQuery;
   vl_credito: Double;
   nr_parcelas_plano_turma, nr_parcelas_plano_matricula: Integer;
begin
   DM.CriarConsulta(qyGetDadosFromPlanoTurma);
   DM.CriarConsulta(qyGetParcelasFromPlanoMatricula);

   qyGetDadosFromPlanoTurma.SQL.Text := SQL_DADOS_PLANO_FROM_PLANO_TURMA;
   qyGetDadosFromPlanoTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyGetDadosFromPlanoTurma.ParamByName('CD_COLIGADA').AsInteger := cd_coligada;
   qyGetDadosFromPlanoTurma.ParamByName('CD_CURSO').AsString := cd_curso;
   qyGetDadosFromPlanoTurma.ParamByName('CD_TURMA').AsString := cd_turma;
   qyGetDadosFromPlanoTurma.Open();

   vl_credito := qyGetDadosFromPlanoTurma.FieldByName('VL_CREDITO').AsFloat;
   nr_parcelas_plano_turma := qyGetDadosFromPlanoTurma.FieldByName('NR_PARCELAS').AsInteger;

   qyGetParcelasFromPlanoMatricula.SQL.Text := SQL_GET_PARCELAS_FROM_PLANO_MATRICULA;
   qyGetParcelasFromPlanoMatricula.ParamByName('CD_PLANO').AsInteger := cd_plano_matricula;
   qyGetParcelasFromPlanoMatricula.Open();

   nr_parcelas_plano_matricula := qyGetParcelasFromPlanoMatricula.FieldByName('NR_PARCELAS').AsInteger;

   if nr_parcelas_plano_matricula > 0 then
   begin
      vl_credito := (vl_credito * nr_parcelas_plano_turma) / nr_parcelas_plano_matricula;
   end;

   Result := vl_credito;

   FreeAndNil(qyGetDadosFromPlanoTurma);
   FreeAndNil(qyGetParcelasFromPlanoMatricula);
end;

end.
