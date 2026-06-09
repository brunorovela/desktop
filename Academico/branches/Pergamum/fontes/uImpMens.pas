unit uImpMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  DB, UZDataset, Buttons, Contnrs, uMensalidadesBaixarParcelaClass, ComCtrls,
  UMAjuda, UMDateTimePicker;

type
   TUMRecMensalidade = packed record
      Cd_Mensalidade : integer;
      CodigoAluno: integer;
      CodigoCaixa: integer;
      CodigoDepto: integer;
      AnoSemestre: integer;
      CodigoRecibo: integer;
      CodigoColigada: integer;
      CodigoSituacao: integer;
      CodigoMensalidade: integer;
      CodTurma: string;
      NossoNumero: string;
      DtVencto: TDateTime;
   end;

   PUMRecMensalidade = ^TUMRecMensalidade;

  TfrmImpMens = class(TForm)
    Panel1: TPanel;
    grp1: TGroupBox;
    radSelecionado: TRadioButton;
    btnFechar: TButton;
    btnImprimir: TButton;
    grp2: TGroupBox;
    radSelecionado2: TRadioButton;
    GroupBox1: TGroupBox;
    radExtratoTotal: TRadioButton;
    radExtratoVencidos: TRadioButton;
    radExtratoPendente: TRadioButton;
    radParcela: TRadioButton;
    radFiscal: TRadioButton;
    sbPropriedades: TSpeedButton;
    edParcelaDe: TEdit;
    edParcelaAte: TEdit;
    Label1: TLabel;
    cbContas: TComboBox;
    sbBloqueaConta: TSpeedButton;
    Query1: TUMZQuery;
    qyUpdMens: TUMZQuery;
    radAgrupado: TRadioButton;
    qryTitulosResp: TUMZQuery;
    lblCopias: TLabel;
    chkAgrupar: TCheckBox;
    ckbDataBoleto: TCheckBox;
    UMAjuda1: TUMAjuda;
    txtDtBoleto: TUMDateTimePicker;
    rbMensalidadesAgrupadas: TRadioButton;
    procedure txtDtBoletoChangeDate(Sender: TObject);
    procedure ckbDataBoletoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure radSelecionadoClick(Sender: TObject);
    procedure sbBloqueaContaClick(Sender: TObject);
    procedure radParcelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edParcelaDeKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Imprimir;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grp2Enter(Sender: TObject);
    procedure grp1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure sbPropriedadesClick(Sender: TObject);
  private
    { Private declarations }
    FCopias: Integer;
    temPermissaoAlterarConta : Boolean;
    ButtonAgrupadoIsCupom: Boolean;

    FUMRecMensalidade: PUMRecMensalidade;
    
    ListaContas : TStringList;
    Procedure ApresentarContas ( ContaPadrao : Integer ) ;
    procedure verificaDataNovoVencimento();
    Function ProcuraCodigo(codigo: Integer; ListaCodigos: array of Integer): Integer;
    function GetChequesMensalidade(Codigo: Integer): String;
    function getCodigoSituacoesProtesto(): String;
  public
    { Public declarations }

    MensalidadesAgrupadas: String;

    function escreveCupons(const AICodMensalidade: integer): String;
    function escreveCheque(const AICodMensalidade: String): String;
    function escreveNegocia(const cd_mensalidade: Integer): String;

    procedure ImprimirReciboDOS(cd_mensalidade: String;
                                    const SomenteCupons: Boolean = False);

    procedure ImprimeReciboMensalidadesAgrupadasDOS( const Mensalidades: String );

    Function Direita( texto : String; tamanho : integer ) : string;
    Function Centro( texto : String; tamanho : integer ) : string;

    function isEstorno(cd_mensalidade: Integer): Boolean;

    property RecMensalidade: PUMRecMensalidade read FUMRecMensalidade write FUMRecMensalidade;
  end;


var
  frmImpMens: TfrmImpMens;


implementation

uses uRepBloquetos, uRepRecibo, Main, uDM, Math, uUsuario, uMensalidades,
  IniFiles, ClassComprasEntradaSaida, ClassRegistros, uImpressaoDOS, uCobranca;

{$R *.DFM}


procedure TfrmImpMens.ApresentarContas(ContaPadrao: Integer);
var
   qyContas : TUMZQuery;

   sContaPadrao : String;
begin

   Dm.CriarConsulta(qyContas);

   qyContas.SQL.Clear;
   qyContas.SQL.Add(' SELECT cd_caixa, ds_caixa, tp_conta, cd_coligada  ');
   qyContas.SQL.Add(' FROM fin_cadastro_contas             ');
   qyContas.SQL.Add(' WHERE sn_ativa = ''S''               ');
   qyContas.SQL.Add(Format('   AND (cd_coligada IN (%s) OR sn_todas_coligadas = 1 ) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]));
   qyContas.SQL.Add('   AND nm_arquivo_bloqueto is NOT NULL AND nm_arquivo_bloqueto <> ''''   ');
   qyContas.SQL.Add(' ORDER by ds_caixa                    ');
   qyContas.Open;

   cbContas.Items.Clear;

   ListaContas := TStringList.Create();
   
   while not qyContas.Eof do begin

      cbContas.Items.Add(qyContas.FieldByName('ds_caixa').AsString);
      ListaContas.Add(qyContas.FieldByName('cd_caixa').AsString);

      qyContas.Next;

   end;
   
   { Verificar qual a conta padrão será utilizada }

   // cbContas.ItemIndex :=  // (ContaPadrao, ListaContas);

   if (FUMRecMensalidade.CodigoCaixa <> 0) then
      sContaPadrao := Format('%d', [FUMRecMensalidade.CodigoCaixa]) 
   else
      sContaPadrao := DM.ContaBoletoPadrao(FUMRecMensalidade.CodigoDepto, FUMRecMensalidade.CodTurma, FUMRecMensalidade.AnoSemestre);

   cbContas.ItemIndex := ListaContas.IndexOf(sContaPadrao);

   cbContas.Enabled := (Dm.variavel_parametro('financeiro_boleto_escolha_aluno') = 'S') AND
                       temPermissaoAlterarConta AND not sbBloqueaConta.Down;
end;


procedure TfrmImpMens.btnFecharClick(Sender: TObject);
begin
  Close;
end;

// Toda impressão de mensalidades agrupadas o recibo deve vir de um sql
// que fica salvo em parâmetros no sistema.
procedure TfrmImpMens.ImprimeReciboMensalidadesAgrupadasDOS(
  const Mensalidades: String);
var
   ImpressoraDOS: TImpressaoDOS;
   porta,
   recibo,
   cupomProdutos,
   negociacoes,
   cheques: String;
   pularLinhas,
   i: Integer;
   SQLParametro: TUMZQuery;
   linhasRecibo,
   mensalidadesSeparadas: TStringList;
begin
   pularLinhas := DM.GetUnimestreINI.ReadInteger('ImpressoraDOS', 'PularLinhas', 0);
   porta := DM.GetUnimestreINI.ReadString('ImpressoraDOS', 'Porta', DM.variavel_parametro('impressao_dos_porta'));

   if pularLinhas < 1 then
   begin
      pularLinhas := 1;
   end;

   ImpressoraDOS := TImpressaoDOS.Create(porta);

   DM.CriarUniConsulta(SQLParametro);

   SQLParametro.SQL.Text := ReplaceStr(DM.variavel_parametro('sql_recibo_impressao'), '%s', Mensalidades);
   SQLParametro.Open;

   recibo := SQLParametro.FieldByName('recibo').AsString;

   // Inicio negrito
   recibo := ReplaceStr(recibo, '[b]', CHR(27) + 'E');
   recibo := ReplaceStr(recibo, '[/b]', CHR(27) + 'F');
   // Fecha negrito

   // Corte da maquina
   recibo := ReplaceStr(
      recibo,
      '<corte:tm18>',
      chr(ord(strtoint('29')))+chr(ord(strtoint( '+86')))+chr(ord(strtoint('+01')))
   );

   mensalidadesSeparadas := explode(Mensalidades, ',');

   cheques := '';
   cupomProdutos := '';
   negociacoes := '';

   cheques := escreveCheque(Mensalidades);

   for I := 0 to mensalidadesSeparadas.Count - 1 do
   begin
      if ClasseComprasEntradaSaida.PodeImprimirCupom(
            StrToInt(Trim(mensalidadesSeparadas.Strings[I])), True) then
      begin
         if Pos( '[cupom_produtos]', recibo ) > 0 then
         begin
            cupomProdutos :=
               cupomProdutos +
               escreveCupons(StrToInt(Trim(mensalidadesSeparadas.Strings[I])));
         end;
      end;

      if Pos('[negociacoes]', recibo) > 0 then
      begin
         negociacoes :=
            negociacoes +
            Self.escreveNegocia(StrToInt(Trim(mensalidadesSeparadas.Strings[I])));
      end;
   end;

   recibo := ReplaceStr(recibo, '[cupom_produtos]', cupomProdutos);
   recibo := ReplaceStr(recibo, '[negociacoes]', negociacoes);
   recibo := ReplaceStr(recibo, '[cheques]', cheques);
   recibo := ReplaceStr(recibo, '[usuario]', DM.GetUsuarioLogado.Pessoa.Login);

   ImpressoraDOS.TratarFuncaoEsc(recibo);

   linhasRecibo := explode(recibo, '[/n]');

   for I := 0 to linhasRecibo.Count - 1 do
   begin
      ImpressoraDOS.Imprimir(linhasRecibo.Strings[i]);
   end;

   ImpressoraDOS.PularLinhas(pularLinhas);
   ImpressoraDOS.Finalizar();

   FreeAndNil(ImpressoraDOS);
end;

procedure TfrmImpMens.Imprimir;
Var
   NomeRel, selecao : string;
   ano, mes, dia : word;
   sFiltroAux : String;
   bAgrupado  : Boolean;
   slFormulas : TStringList;
   qryDDA     : TUMZQuery;
   bCancelarDDA : Boolean;
   iCancelamento : Integer;
   sNomeRelatorio,
   Mensalidades,
   codigosSituacoes: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
   sChaveNN : String;
   dtBoleto : TDateTime;
begin

  slFormulas := TStringList.Create();

  { Selecionar o Nome do Relatório }
  if (radExtratoPendente.Checked) or (radExtratoVencidos.Checked) then begin
    NomeRel := 'repExtratoMensalidade';
    infoRelatorio := PrincipalForm.GetInfoRpt(NomeRel);
    sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';
  end;

  if (radExtratoTotal.Checked) then begin
      NomeRel := 'repExtratoTotalMensalidade';
      { Imprimir Relatório }
      slFormulas.Add('nm_titulo="EXTRATO FINANCEIRO TOTAL"');

      infoRelatorio := PrincipalForm.GetInfoRpt(NomeRel);
      sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

      PodeExportar := True;
      if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
         PodeExportar := False;

      PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1,'{Extrato_de_Mensalidades.CodigoAluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]), '',slFormulas,nil,nil, nil, true);
      Exit;
  end;

  codigosSituacoes := Self.getCodigoSituacoesProtesto();

  if (radExtratoPendente.Checked) then begin
      { Imprimir Relatório }

      if codigosSituacoes <> '' then
      begin
         selecao := Format(
            '{Extrato_de_Mensalidades.CodigoAluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ' and ({Extrato_de_Mensalidades.Situacao} IN [2 %s])',
            [', ' + Self.getCodigoSituacoesProtesto()]
         );
      end
      else
      begin
         selecao := Format(
            '{Extrato_de_Mensalidades.CodigoAluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ' and ({Extrato_de_Mensalidades.Situacao} IN [2 %s])',
            ['']
         );
      end;
      
      slFormulas.Add('nm_titulo="EXTRATO FINANCEIRO PENDENTE/VENCIDO"');

      PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '',slFormulas,nil,nil,nil, true);
      Exit;
  end;

  if (radExtratoVencidos.Checked) then begin
      { Imprimir Relatório }
      DecodeDate(DataHoje, ano, mes, dia);

      slFormulas.Add('nm_titulo="EXTRATO FINANCEIRO VENCIDO"');

      if codigosSituacoes <> '' then
      begin
         selecao := Format(
            '({Extrato_de_Mensalidades.datavencimento} < DATE(' + IntToStr(ano)+  ', ' + IntTOStr(mes) + ', ' + IntToStr(dia) + ') ) and ({Extrato_de_Mensalidades.CodigoAluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ') and ({Extrato_de_Mensalidades.Situacao} IN [2 %s])',
            [', ' + Self.getCodigoSituacoesProtesto()]
         );
      end
      else
      begin
         selecao := Format(
            '({Extrato_de_Mensalidades.datavencimento} < DATE(' + IntToStr(ano)+  ', ' + IntTOStr(mes) + ', ' + IntToStr(dia) + ') ) and ({Extrato_de_Mensalidades.CodigoAluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ') and ({Extrato_de_Mensalidades.Situacao} IN [2 %s])',
            ['']
         );
      end;

      PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '',slFormulas,nil,nil,nil, true);
      Exit;
  end;


  if (radSelecionado.Checked) or (radParcela.Checked) then
  begin
     // Verificar se foi utilizado a cheque da alteração de data do boleto

     if ckbDataBoleto.Checked then begin
        dtBoleto := txtDtBoleto.getDate;
     end else begin
        dtBoleto := 0;
     end;


     DM.CriarConsulta(qryDDA);
     qryDDA.Close;
     qryDDA.SQL.Text := ''+
     '  SELECT                         '+
     '   	rl.cd_origem,ro.cd_acao      '+
     '  FROM                           '+
     '  	rem_dados rd'+
     '	  INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)'+
     '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)'+
     '  WHERE                                                       '+
     '	  rd.cd_mensalidade = :cd_mensalidade';
     qryDDA.ParamByName('cd_mensalidade').AsInteger := FUMRecMensalidade.Cd_Mensalidade;
     qryDDA.Open;

     bCancelarDDA := false;
     iCancelamento := 0;
     while not qryDDA.Eof do
     begin
      if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
        bCancelarDDA := true;
      if qryDDA.FieldByName('cd_acao').AsInteger = 101 then
        iCancelamento := iCancelamento +1;
      qryDDA.Next;
     end;
     if iCancelamento > 1 then
       bCancelarDDA := false;


     if ( bCancelarDDA = true ) then
     begin
     if ( Mensagem('Deseja cancelar o Débito Automático?', Application.Title, MB_YESNO, Handle) = mrYes ) then
     begin
       DM.FazAcaoRemessa(arCancelamentoDDA, FUMRecMensalidade.Cd_Mensalidade);
       Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do DDA ocorra.', Application.Title, MB_OK, Handle);
     end
     else
       exit;
     end;

     Application.CreateForm( TfrmRepBloquetos, frmRepBloquetos );

     { Selecionar os bloquetos }

     if radSelecionado.Checked then begin
        { Mesmo em caso de bloqueto agrupado, pode passar o cd_mensalidade
        if sbAgrupado.Down then begin
           sFiltroAux := ' (m.codigoaluno = "' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + '" AND ';
           sFiltroAux := sFiltroAux + ' (m.situacao = 2 or m.situacao = 10) AND ';
           sFiltroAux :=  sFiltroAux + ' m.datavencimento = "' + FormatDateTime( 'yyyy-mm-dd', FUMRecMensalidade.DtVencto ) + '" ) ';
        end
        else begin
           sFiltroAux := ' (m.cd_mensalidade = "' + Format('%d', [FUMRecMensalidade.CodigoMensalidade]) + '") ';
        end;
        }
        sFiltroAux := ' (m.cd_mensalidade = "' + Format('%d', [FUMRecMensalidade.CodigoMensalidade]) + '") ';
     end
     else begin
        sFiltroAux := ' (m.codigoaluno = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ') ';
        sFiltroAux := sFiltroAux + ' and (m.situacao = 2 or m.situacao = 10) ';
        sFiltroAux := sFiltroAux + ' and (m.parcela >= ' + edParcelaDe.Text + ' and m.parcela <= ' + edParcelaAte.Text + ') ';
        sFiltroAux := sFiltroAux + ' and (m.turma = "' + FUMRecMensalidade.CodTurma + '") ';
     end;

     bAgrupado := chkAgrupar.Checked;

     if not frmRepBloquetos.PrepararBloquetosParaImpressao(sFiltroAux, bAgrupado, ListaContas[cbContas.ItemIndex], true, dtBoleto) then begin
        Exit;
     end;

     { Nenhum Bloqueto foi Impresso }

     if radSelecionado.Checked then begin
        { Mesmo em bloqueto agrupado, repassar para o relatório o cd_mensalidade }
         if chkAgrupar.Checked then begin
            selecao := '{mensalidades.codigoaluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ' and {fin_cadastro_contas.sn_ativa} = "S"';
            selecao := selecao + ' AND {mensalidades.situacao} IN [2,10] ';
            selecao := selecao + ' AND ToText({mensalidades.datavencimento}, "yyyyMMdd") = "' + FormatDateTime( 'yyyymmdd', FUMRecMensalidade.DtVencto ) +'" ';
            // Forcar a impressão para o caixa selecionado
            selecao := selecao + ' AND {mensalidades.cd_caixa} = ' + ListaContas[cbContas.ItemIndex];
        end else
        begin
            selecao := '{mensalidades.cd_mensalidade} = ' + Format('%d', [FUMRecMensalidade.CodigoMensalidade]) + ' and {fin_cadastro_contas.sn_ativa} = "S"';
        end;
     end
     else begin
        selecao := ' {fin_cadastro_contas.sn_ativa} = "S" and {mensalidades.codigoaluno} = ' + Format('%d', [FUMRecMensalidade.CodigoAluno]) + ' and ' ;
        selecao := selecao + ' {mensalidades.parcela} >= ' + edParcelaDe.Text + ' and {mensalidades.parcela} <= ' + edParcelaAte.Text + ' and ';
        selecao := selecao + ' {mensalidades.turma} = "' + FUMRecMensalidade.CodTurma + '" and ';
        selecao := selecao + ' ({mensalidades.situacao} = 2 or {mensalidades.situacao} = 10 )';
     end;

     // Pegar nome do arquivo do Boletos
     NomeRel := Dm.NomeDoBoleto(FUMRecMensalidade.CodigoDepto, FUMRecMensalidade.CodTurma, FUMRecMensalidade.AnoSemestre, ListaContas[cbContas.ItemIndex]);

     if PrincipalForm.ImprimeRpt(Self, NomeRel, -1, selecao, '',nil,nil,nil,nil, true, False, nil, True) then begin
        // Bloqueto Impresso

        Self.qyUpdMens.Close;
        Self.qyUpdMens.SQL.Text := 'update mensalidades set bloqueto = ''S'',  ocorrencia_retorno = 0';
        Self.qyUpdMens.SQL.Add('where ');

        if radSelecionado.Checked then begin
           Self.qyUpdMens.SQL.Add( '(mensalidades.cd_mensalidade = :cd_mensalidade)');
           Self.qyUpdMens.ParamByName('cd_mensalidade').AsInteger := FUMRecMensalidade.cd_mensalidade;
           // DM.FazAcaoRemessa(arImpBoleto, Self.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
        end
        else begin
           Self.qyUpdMens.SQL.Add( ' (mensalidades.situacao = 2 or mensalidades.situacao = 10) and ');
           Self.qyUpdMens.SQL.Add( '(mensalidades.codigoaluno = :codigo) and ');
           Self.qyUpdMens.SQL.Add( '(mensalidades.parcela >= ' + edParcelaDe.Text +  ' and mensalidades.parcela <= ' + edParcelaAte.Text + ') and ');
           Self.qyUpdMens.SQL.Add( '(mensalidades.turma = :turma)');
           Self.qyUpdMens.ParamByName('Codigo').AsInteger := FUMRecMensalidade.CodigoAluno;
           Self.qyUpdMens.ParamByName('Turma').AsString := FUMRecMensalidade.CodTurma;
        end;

        Self.qyUpdMens.ExecSQL();

//******************      RESOLVER O PROBLEMA DE AÇÃO DE REMESSA PARA BOLETOS AGRUPADOS
// Alterado a Lógica: Claudionor 07/05
// O agrupamento está sendo feito na Ação de Remessa
//        frmRepBloquetos.tblBloquetos.First();
//        while not frmRepBloquetos.tblBloquetos.Eof do begin
//            DM.FazAcaoRemessa(arImpBoleto, frmRepBloquetos.tblBloquetos.FieldByName('cd_mensalidade').AsInteger);
//            frmRepBloquetos.tblBloquetos.Next();
//        end;
//     frmRepBloquetos.tblBloquetos.First();
//     DM.FazAcaoRemessa(arImpBoleto, frmRepBloquetos.tblBloquetos.FieldByName('cd_mensalidade').AsInteger, true);

        sChaveNN := '';
        frmRepBloquetos.tblBloquetos.First();
        while not frmRepBloquetos.tblBloquetos.Eof do begin
            if (sChaveNN <> frmRepBloquetos.tblBloquetos.FieldByName('nossonumero').AsString) then begin
               DM.FazAcaoRemessa(arImpBoleto, frmRepBloquetos.tblBloquetos.FieldByName('cd_mensalidade').AsInteger, bAgrupado);
               sChaveNN := frmRepBloquetos.tblBloquetos.FieldByName('nossonumero').AsString;
            end;
            frmRepBloquetos.tblBloquetos.Next();
        end;


     end;

     FreeAndNil(frmRepBloquetos);

     Exit;

  End;

  if radSelecionado2.Checked then
  begin

     PrincipalForm.Rel.PrintOptions.Copies := FCopias;

     if not (FUMRecMensalidade.CodigoSituacao in [2, 10]) then
     begin
        // Mensalidade está baixada - habilitar impressão do recibo

        oRecibo := TFinReciboManager.Create(FUMRecMensalidade.CodigoMensalidade);
        oRecibo.imprimirRecibo();

        FreeAndNil(oRecibo);

        infoRelatorio := PrincipalForm.GetInfoRpt('relatorio_padrao_recibo');
        sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

        PodeExportar := True;
        if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
           PodeExportar := False;
           
        selecao := '{mensalidades.cd_mensalidade} = ' + Format('%d', [FUMRecMensalidade.CodigoMensalidade]);

        PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '',nil,nil,nil,nil, true, False, nil, PodeExportar);

     end else if (Dm.variavel_parametro('fin_recibo_estorno') <> '') then
     begin
        // Se tem recibo, a parcela está aberta e tem recibo de estorno

        oRecibo := TFinReciboManager.Create(FUMRecMensalidade.CodigoMensalidade);
        {Manda o parâmetro como true, pois se for áfrica deve gerar um recibo como se fosse estorno}
        oRecibo.imprimirRecibo(true);
        
        infoRelatorio := PrincipalForm.GetInfoRpt('fin_recibo_agrupado');
        sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

        PodeExportar := True;
        if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
           PodeExportar := False;

        selecao := '{mensalidades.cd_mensalidade} = ' + Format('%d', [FUMRecMensalidade.CodigoMensalidade]);
        selecao := selecao + ' AND {recibos.sn_estorno} = 1 ';

        PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '',nil,nil,nil,nil, true, False, nil, PodeExportar);

     end;
     Exit;
  end;

   if radAgrupado.Checked then
   begin
      if ( not ButtonAgrupadoIsCupom ) then
      begin
         { Se entrou aqui, irá fazer a programaçãoa NORMAL do botão de Agrupado }
         selecao := '';
         qryTitulosResp.Close;
         qryTitulosResp.ParamByName('cd_mensalidade').AsInteger := FUMRecMensalidade.CodigoMensalidade;
         qryTitulosResp.Open;
         
         if not qryTitulosResp.IsEmpty then
         begin
            while not qryTitulosResp.Eof do
            begin
               if selecao <> '' then
               begin
                  selecao := selecao + ',';
               end;
               
               selecao := selecao + qryTitulosResp.FieldByName('cd_mensalidade').AsString;
               oRecibo := TFinReciboManager.Create(qryTitulosResp.FieldByName('cd_mensalidade').AsInteger);
               try
                  oRecibo.imprimirRecibo;
               finally
                  FreeAndNil(oRecibo);
               end;
               qryTitulosResp.Next;
            end;
            selecao := Format('{mensalidades.cd_mensalidade} in [%s]', [selecao]);
         end;

         infoRelatorio := PrincipalForm.GetInfoRpt('fin_recibo_agrupado');
         sNomeRelatorio := infoRelatorio.Campo['nm_arquivo'];

         if Trim(sNomeRelatorio) = '' then
         begin
            infoRelatorio := PrincipalForm.GetInfoRpt('relatorio_padrao_recibo');
            sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';
         end
         else
         begin
            sNomeRelatorio := sNomeRelatorio + '.rpt';
         end;

         PodeExportar := True;
         if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
            PodeExportar := False;
            
         PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '', nil, nil, nil, nil, true, False, nil, PodeExportar);
      end else begin
         if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.PlanilhaRecebimentos.Imprimir.CuponsProdutos', npAcesso, True ) then Exit;
         
         { Se entrou aqui, irá fazer uma programação DIFERENTE, sendo a opção de Cupom.
            Pois quando o Cupom está ativo, o Agrupado sempre está inativo, então aproveitamos este botão }
         ImprimirReciboDOS(IntToStr(FUMRecMensalidade.CodigoMensalidade), True);
      end;
      
      Exit;
   end;

   if (rbMensalidadesAgrupadas.Checked) or
      ((radFiscal.Checked) AND (radFiscal.tag = 1)) then
   begin

      if DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') = 'S' then
      begin
         ImprimirReciboDOS(Self.MensalidadesAgrupadas);
      end
      else
      begin
         ImprimirReciboDOS(IntToStr(FUMRecMensalidade.CodigoMensalidade), False);
      end;

      Mensagem('Recibo impresso com sucesso!', 'Aviso', MB_ICONEXCLAMATION + MB_OK);

      Exit;
   end
   else
   begin
      if (radFiscal.Checked) AND (radFiscal.tag = 2) then
      begin
         // Selecionar a Parcela Selecionada na tela anterio para impressão da Autenticação

         DM.tblMensalidades.Close();
         DM.tblMensalidades.SQL.Text := ' SELECT * FROM Mensalidades WHERE ' +
                                    ' cd_mensalidade = :CdMensalidade ';
         DM.tblMensalidades.ParamByName('CdMensalidade').asInteger := FUMRecMensalidade.CodigoMensalidade;
         DM.tblMensalidades.Open();

         TFrmMensalidades.AutenticarMensalidade();
         Exit;
      end;
   end;
end;


procedure TfrmImpMens.btnImprimirClick(Sender: TObject);
begin
   Imprimir;
end;

procedure TfrmImpMens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmImpMens.grp2Enter(Sender: TObject);
begin
  radSelecionado.Checked := False;
  radExtratoTotal.Checked := False;
  radExtratoVencidos.Checked := False;
  radExtratoPendente.Checked := False;
  radParcela.Checked := False;  
end;

procedure TfrmImpMens.grp1Enter(Sender: TObject);
begin
  radSelecionado2.Checked := False;
  radExtratoTotal.Checked := False;
  radExtratoVencidos.Checked := False;
  radExtratoPendente.Checked := False;
  radAgrupado.Checked := false;
  radFiscal.Checked := False;
  rbMensalidadesAgrupadas.Checked := False;
end;

procedure TfrmImpMens.FormShow(Sender: TObject);
var
   temPermissao2aViaReciboForcado: boolean;
   reciboFiscalAgrupado: Boolean;
begin
   ButtonAgrupadoIsCupom := False;

   reciboFiscalAgrupado := (DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') = 'S');

   temPermissaoAlterarConta := DM.UsuarioLogado.TemPermissao( 2052, npAcesso, False );
   temPermissao2aViaReciboForcado := DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.PlanilhaRecebimentos.Imprimir.Impresao2ViaForcado', npAcesso, False );

   cbContas.Enabled      := False;

   cbContas.Clear();

   DM.Parametros_usuario(Self);

   radParcela.Checked := False;
   radSelecionado.Checked := False;
   radSelecionado2.Checked := False;
   radExtratoTotal.Checked := False;
   radExtratoPendente.Checked := False;
   radExtratoVencidos.Checked := False;
   radAgrupado.Checked := false;
   rbMensalidadesAgrupadas.Checked := False;
   rbMensalidadesAgrupadas.Visible := False;

   if DM.variavel_parametro('mensalidades_recibo_tipo') = 'DOS' then
   Begin
      radSelecionado2.Caption := '&Impressora';
      radFiscal.Caption := '&Fiscal';
      radFiscal.Visible := True;
      radFiscal.Tag := 1;
   end
   else
   Begin
      radSelecionado2.Caption := '&Selecionado';
      radFiscal.Caption := '';
      radFiscal.Visible := False;
   end;

   if (DM.variavel_parametro('financeiro_qtd_autenticacao_baixa') = '-1') then
   begin
      radSelecionado2.Caption := '&Selecionado';
      radFiscal.Caption := '&Autenticar';
      radFiscal.Visible := True;
      radFiscal.Tag := 2;
   end;

   { "financeiro_boletos_agrupados" indica que o recibo é agrupado e será impresso
     por RELATÓRIO do crystal;
     "agrupa_impressao_mensalidades_baixar" indica que o recibo é agrupado por
      recibo fiscal portanto NÃO deve aparecer a opção de agrupado}

   if (DM.variavel_parametro('financeiro_boletos_agrupados') = 'S') then
   begin
      chkAgrupar.Checked := True;
      chkAgrupar.Enabled := True;
   end
   else
   begin
      chkAgrupar.Checked := False;
      chkAgrupar.Enabled := False;
   end;

   if not (FUMRecMensalidade.CodigoSituacao in [2, 10]) then
   begin
      // Mensalidade está baixada - habilitar impressão do recibo
      radSelecionado2.Enabled := True;
      radAgrupado.Enabled := true;
   end
   else if (Dm.variavel_parametro('fin_recibo_estorno') <> '') and (isEstorno(FUMRecMensalidade.Cd_Mensalidade)) then
   begin
      // Se tem recibo, a parcela está aberta e tem recibo de estorno
      radSelecionado2.Enabled := true;
      radAgrupado.Enabled := true;
      radSelecionado2.Caption := 'Estorno';
   end
   else
   begin
      radSelecionado2.Enabled := False;
      radAgrupado.Enabled := false;
   end;

   radFiscal.Enabled := not (FUMRecMensalidade.CodigoSituacao in [2, 10]);

   if (Dm.variavel_parametro('financeiro_forcar_recibo') <> '') AND (not temPermissao2aViaReciboForcado) then
   begin
      radFiscal.Visible := False;
      radSelecionado2.Enabled := false;
      radAgrupado.Enabled := false;
      radSelecionado2.Caption := 'Somente durante a baixa';

      if ClasseComprasEntradaSaida.IsMensalidadeFromProduto(RecMensalidade.Cd_Mensalidade) AND
         ClasseComprasEntradaSaida.MensalidadeBaixadaBanco(RecMensalidade.Cd_Mensalidade) then
      begin
         { Atenção como está opção não precisa ser visível quando as condições acima são verdadeiras,
            aproveitaremos o radio Agrupamento para a funcionalidade de Cupom }
         ButtonAgrupadoIsCupom := True;
      end;
   end;

   { A opção Agrupado não precisa ser usada quando a opção Cupom está habilitada,
      pelas condições que são acessadas acima, o Agrupado sempre está desabilitado }
   if ( ButtonAgrupadoIsCupom ) then
   begin
      radAgrupado.Caption := '&Cupom';
      radAgrupado.Enabled := True;
   end
   else
      radAgrupado.Caption := 'A&grupado';


   { se a impressão de recibos fiscal agrupados estiver habilitada
     não mostra o radAgrupado pois pode confundir o usuário }

   { caso esteja habilitada impressão de recibos fiscais agrupados mostra o radio
   como "Fiscal agrupado" }
   if reciboFiscalAgrupado then
   begin
      rbMensalidadesAgrupadas.Visible := True;
      rbMensalidadesAgrupadas.Top := 67;
      grp2.Height := 100;

      radAgrupado.Visible := False;
   end;

   if frmMensalidades <> nil then
   begin
      // Tratamento de exceção.
      // Devemos tratar melhor a chamada deste formulário - Claudionor 14/07/2015.

      if uMensalidades.frmMensalidades.tblMensalidadesSituacao.AsInteger = 2 then
      begin
         radAgrupado.Enabled := False;
      end;

   end
   else if frmCobranca <> nil then
   begin
      if uCobranca.frmCobranca.tblMensalidadesSituacao.AsInteger = 2 then
      begin
         radAgrupado.Enabled := False;
      end;
   end
   else
   begin
      radAgrupado.Enabled := False;
   end;

   txtDtBoleto.setDate(Now());
   ckbDataBoleto.Checked := false;

   if( trim(dm.variavel_parametro('limite_max_altera_vencimento_local')) = '') then
   begin
      ckbDataBoleto.Enabled := false;
      UMAjuda1.Caption := UMAjuda1.Caption + 'Solicite a ativação desta nova função para a equipe de Atendimento do UNIMESTRE, através de um chamado.';
   end;

end;


function TfrmImpMens.GetChequesMensalidade(Codigo: Integer): String;
const
   SQL_BUSCA_CHEQUES = 'SELECT GROUP_CONCAT(m.cd_cheque SEPARATOR '', '') AS cheques '+
      ' FROM fin_cheques_mensalidades m WHERE m.cd_mensalidade = :cd_mensalidade ' +
      ' GROUP BY m.cd_mensalidade ';
var
   qryBuscaCheques: TUMZQuery;
begin
   DM.CriarConsulta(qryBuscaCheques);

   qryBuscaCheques.SQL.Text := SQL_BUSCA_CHEQUES;

   qryBuscaCheques.ParamByName('cd_mensalidade').AsInteger := Codigo;

   qryBuscaCheques.Open;

   Result := qryBuscaCheques.FieldByName('cheques').AsString;
end;

function TfrmImpMens.getCodigoSituacoesProtesto: String;
var
   qryBuscaSituacoes: TUMZReadOnlyQuery;
const
   SQL_SITUACOES_PROTESTO =
      ' SELECT '+
      ' 	GROUP_CONCAT(cd_situacao) AS codigos '+
      ' FROM '+
      ' 	situacoes_financeiras sf '+
      ' WHERE '+
      ' 	sf.sn_protesto = 1 ';
begin

   DM.CriarConsulta(qryBuscaSituacoes);
   qryBuscaSituacoes.SQL.Text := SQL_SITUACOES_PROTESTO;
   qryBuscaSituacoes.Open;

   Result := qryBuscaSituacoes.FieldByName('codigos').AsString;
end;

procedure TfrmImpMens.GroupBox1Enter(Sender: TObject);
begin
  radSelecionado.Checked := False;
  radSelecionado2.Checked := False;
  radAgrupado.Checked := false;
end;

procedure TfrmImpMens.ImprimirReciboDOS(cd_mensalidade: String; const SomenteCupons: Boolean = False);
Var
   LRegistraImpressaoCupom    : Boolean;
   ImpressoraDOS              : TImpressaoDOS;
   i, iTamanho, n, iPular     : Integer;
   posIni, posFim, posi, j    : Integer;
   qyDepto, qryNegociacoes    : TUMZQuery;
   strAut, LinhaDe, sPorta,
   LinhaPara, sMensagemCheque,
   mensalidades_recibo_layout,
   copia, nome_do_campo,
   substitui_original,
   titulo_negocia             : String;
begin

   if DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') = 'S' then
   begin
      Self.ImprimeReciboMensalidadesAgrupadasDOS(cd_mensalidade);
      Exit;
   end;

    // Efetuar a impressão do recibo do código de mensalidade passado
    DM.tblMensalidades.Close();
    DM.tblMensalidades.SQL.Text := ' SELECT * FROM mensalidades WHERE cd_mensalidade = ' + cd_mensalidade;
    DM.tblMensalidades.Open();

    try
      iPular := DM.GetUnimestreINI.ReadInteger('ImpressoraDOS', 'PularLinhas', 0);
      sPorta := DM.GetUnimestreINI.ReadString('ImpressoraDOS', 'Porta', Dm.variavel_parametro('impressao_dos_porta'));
    except
      iPular := 0;
      sPorta := '';
    end;

    if not ( TryStrToInt( DM.variavel_parametro('impressao_tamanho'), iTamanho ) ) then
    begin
      iTamanho := 40;
    end;

   { Pegar os dados do Responsavel }

    Dm.qAux2.Close;
    Dm.qAux2.SQL.Text := 'SELECT p1.cd_pessoa as cd_pessoa, p1.nm_pessoa as nm_pessoa, IFNULL(p2.nm_pessoa, p1.nm_pessoa) as nm_resp FROM pessoas as p1 LEFT JOIN pessoas as p2 ON (p1.cd_resp_finan =  p2.cd_pessoa) where p1.cd_pessoa = :codigo';
    Dm.qAux2.ParamByName('codigo').AsInteger := Dm.tblMensalidadesCodigoAluno.AsInteger;
    Dm.qAux2.Open;

    if sPorta = '' Then
    begin
       sPorta := 'LPT1';
    end;

    DM.CriarConsulta(qyDepto);
    qyDepto.SQL.Text := ' SELECT * from departamentos WHERE codigo = :codigo ';
    qyDepto.ParamByName('codigo').AsInteger := DM.tblMensalidadesDepto.AsInteger;
    qyDepto.Open();

   try
      ImpressoraDOS := TImpressaoDOS.Create(sPorta);

      mensalidades_recibo_layout := Dm.variavel_parametro('mensalidades_recibo_layout');
      
      if (not SomenteCupons) and
         (mensalidades_recibo_layout = 'modelo01') then
      begin
      
         ImpressoraDOS.Imprimir(CHR(27) + 'R'); // Desativar Tabulação

         ImpressoraDOS.Imprimir('');                 // Retorno do Carro

         ImpressoraDOS.Imprimir(CHR(27) + 'E' );          // Negrito
         ImpressoraDOS.Imprimir(Centro(SemAcento(qyDepto.FieldByName('razaosocial').AsString), iTamanho+8));
         ImpressoraDOS.Imprimir(Centro(SemAcento(qyDepto.FieldByName('descricao').AsString),iTamanho+8));
         ImpressoraDOS.Imprimir(CHR(27) + 'F' );          // Fim do Negrito
         ImpressoraDOS.Imprimir(Centro(SemAcento(DM.variavel_parametro('cliente_endereco')) + ' - ' + SemAcento(DM.variavel_parametro('cliente_bairro')), iTamanho+8));
         ImpressoraDOS.Imprimir(Centro(SemAcento(DM.variavel_parametro('cliente_cep')) +  '-' + SemAcento(DM.variavel_parametro('cliente_cidade')) + '-' + SemAcento(DM.variavel_parametro('cliente_estado')), iTamanho+8));
         ImpressoraDOS.Imprimir(Centro(SemAcento(DM.variavel_parametro('cliente_telefone')) + ' - ' + 'CNPJ: ' + SemAcento(qyDepto.FieldByName('ds_cnpj').AsString),iTamanho + 8));

         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir(' ');

         ImpressoraDOS.Imprimir(CHR(27) + 'E' );
         ImpressoraDOS.Imprimir(Centro('RECIBO DE PAGAMENTO',iTamanho+8));
         ImpressoraDOS.Imprimir(CHR(27) + 'F' );
         ImpressoraDOS.Imprimir('------------------------------------------------');
         ImpressoraDOS.Imprimir('SACADO..: ' + SemAcento(Dm.qAux2.FieldByName('nm_resp').AsString));
         ImpressoraDOS.Imprimir('ALUNO...: ' + SemAcento(Dm.qAux2.FieldByName('nm_pessoa').AsString) );
         ImpressoraDOS.Imprimir('Cod.Alu.: ' + DM.tblMensalidadesCodigoAluno.AsString + '      Cod. Tit.: ' + cd_mensalidade) ;
         ImpressoraDOS.Imprimir('------------------------------------------------');

         // Procurar a Parcela na tabela de Parcelas

         Dm.qAux2.Close;
         DM.qAux2.SQL.Clear;
         DM.qAux2.SQL.Add('select * from fin_tipos_titulo where cd_tipo_titulo = ' + DM.tblMensalidadescd_tipo_titulo.AsString);
         Dm.qAux2.Open;

         if Trim(Dm.qAux2.FieldByName('ds_tipo_titulo').AsString) <> ''
         then
         begin
            ImpressoraDOS.Imprimir('Referente a ' + Dm.qAux2.FieldByName('ds_tipo_titulo').AsString)
         end
         else
         begin
            ImpressoraDOS.Imprimir('Parcela.: ' + Dm.tblMensalidadesParcela.AsString + ' - Turma: ' + Dm.tblMensalidadesTurma.AsString + ' (' + Dm.tblMensalidadesAnoSemestre.DisplayText + ')' );
         end;

         ImpressoraDOS.Imprimir('Data de Vencimento: ' + FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataVencimento.AsDateTime));
         ImpressoraDOS.Imprimir('Data de Pagamento.: ' + FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataPagamento.AsDateTime ));
         ImpressoraDOS.Imprimir('Valor ............: R$' + Direita(FloatToStrF(Dm.tblMensalidadesValorPago.AsCurrency - Dm.tblMensalidadesValorJuros.AsCurrency + Dm.tblMensalidadesValorDesconto.AsCurrency, ffFixed, 9, 2 ),22));
         ImpressoraDOS.Imprimir('Acrescimo.........: R$' + Direita(FloatToStrF(Dm.tblMensalidadesValorJuros.AsCurrency, ffFixed, 9, 2 ),22));
         ImpressoraDOS.Imprimir('Desconto..........: R$' + Direita(FloatToStrF(Dm.tblMensalidadesValorDesconto.AsCurrency, ffFixed, 9, 2 ),22));
         ImpressoraDOS.Imprimir('TOTAL ............: R$' + Direita(FloatToStrF(Dm.tblMensalidadesValorPago.AsCurrency, ffFixed, 9, 2 ),22));
         ImpressoraDOS.Imprimir(escreveCheque(Dm.tblMensalidades.FieldByName('cd_mensalidade').AsString));
         ImpressoraDOS.Imprimir('------------------------------------------------');
         ImpressoraDOS.Imprimir(' ' );
         ImpressoraDOS.Imprimir(' ' );

      end
      else if (mensalidades_recibo_layout = 'modelo_personalizado') OR SomenteCupons then
      begin

         if not SomenteCupons then
         begin
            // Este item usa o modelo PERSONALIZADO, definido no parâmetro financeiro_recibo_campos

            strAut := DM.variavel_parametro('financeiro_recibo_campos');


            // Abrir a query com algumas informações importantes para substituir

            Dm.qAux2.Close;
            Dm.qAux2.SQL.Text :=
               ' SELECT p1.cd_pessoa as cd_pessoa, ' +
               '        p1.nm_pessoa as nm_pessoa, IFNULL(p2.nm_pessoa, p1.nm_pessoa) as nm_resp, ' +
               '        tt.ds_tipo_titulo, c.ds_caixa, c.cd_caixa ' +
               '   FROM mensalidades as m ' +
               '  INNER JOIN pessoas as p1 ON (m.codigoaluno = p1.cd_pessoa) ' +
               '   LEFT JOIN fin_tipos_titulo as tt ON (tt.cd_tipo_titulo = m.cd_tipo_titulo AND tt.cd_coligada = m.cd_coligada) ' +
               '   LEFT JOIN fin_mov_tesouraria as t ON (t.cd_mensalidade = m.cd_mensalidade AND t.nr_estorno = 0 and t.cd_acao <> 18 ) ' +
               '   LEFT JOIN fin_cadastro_contas as c ON (c.cd_caixa = t.cd_caixa) ' + 
               '   LEFT JOIN pessoas as p2 ON (p1.cd_resp_finan =  p2.cd_pessoa) ' +
               '  WHERE m.cd_mensalidade = :codigo ';
            Dm.qAux2.ParamByName('codigo').AsInteger := Dm.tblMensalidadescd_mensalidade.AsInteger;
            Dm.qAux2.Open; 

            { GERAR IMPRESSÃO DAS NEGOCIAÇÕES VINCULADAS Á MENSALIDADE }
            titulo_negocia := '';
            copia := '';
            
            posIni := 0;
            posFim := 0;

            posIni := Pos('[negocia]', strAut);
            posFim := Pos('[/negocia]', strAut);

            {Verifica se existe uma configuração para as negociações da
            MENSALIDADE}
            if (posIni > 0) and (posFim > 0) then
            begin
               DM.CriarConsulta(qryNegociacoes);

               {Verifica se possui título}
               posIni := Pos('[negocia_titulo]', strAut);
               posFim := Pos('[/negocia_titulo]', strAut);

               if (posIni > 0) and (posFim > 0) then
               begin
                  titulo_negocia := Trim(Copy(strAut, posIni, posFim - posIni + 17));
               end;

               posIni := Pos('[negocia]', strAut);
               posFim := Pos('[/negocia]', strAut);

               {SQL que busca os valores diposníveis referente as
               negociações da MENSALIDADE}
               qryNegociacoes.SQL.Text := ' SELECT ';
               qryNegociacoes.SQL.Add(' mo.*, ');
               qryNegociacoes.SQL.Add(' fne.* ');
               qryNegociacoes.SQL.Add(' FROM ');
               qryNegociacoes.SQL.Add(' mensalidades as  m');
               qryNegociacoes.SQL.Add(' INNER JOIN fin_negocia_parc_nova AS fn ON ( m.cd_mensalidade = fn.cd_mensalidade ) ');
               qryNegociacoes.SQL.Add(' INNER JOIN fin_negocia_parc_atual AS fa ON ( fn.cd_negocia = fa.cd_negocia ) ');
               qryNegociacoes.SQL.Add(' INNER JOIN fin_negocia fne ON ( fa.cd_negocia = fne.cd_negocia ) ');
               qryNegociacoes.SQL.Add(' INNER JOIN mensalidades AS mo ON ( fa.cd_mensalidade = mo.cd_mensalidade ) ');
               qryNegociacoes.SQL.Add(' WHERE ');
               qryNegociacoes.SQL.Add(' m.cd_mensalidade = :codigo_mensalidade ');

               qryNegociacoes.ParamByName('codigo_mensalidade').AsInteger :=
                  Dm.tblMensalidadescd_mensalidade.AsInteger;

               qryNegociacoes.Open;

               {Aqui salva o valor entre [negocia] até [/negocia] para poder
               substituir após montar a string com as variáveis ja substituidas}
               substitui_original := Copy(strAut, posIni, posFim - posIni + 10);

               {CASO nao tenha nenhuma negociação o sistema limpa os campos que
               apareceriam}
               if qryNegociacoes.RecordCount = 0 then
               begin
                  strAut := ReplaceStr(strAut, substitui_original, EmptyStr);
               end
               else
               begin

                  {Percorre todas negociações vinculadas a MENSALIDADE}
                  for I := 0 to qryNegociacoes.RecordCount - 1 do
                  begin

                     {Aqui copiamos uma vez todo o [negocia][/negocia] para
                     gerar um para cada parcela.}
                     copia := Trim(copia) + Trim(Copy(strAut, posIni, posFim - posIni + 10));

                     copia := ReplaceStr(copia, titulo_negocia, EmptyStr);
                     copia := ReplaceStr(copia, '[negocia]', EmptyStr);
                     copia := ReplaceStr(copia, '[/negocia]', EmptyStr);

                     {Percorre todos campos disponíveis para substituir por variáveis}
                     for j := 0 to qryNegociacoes.FieldList.Count - 1 do
                     begin

                        {Verifica se existe uma variável com o campo atual}
                        if Pos( '[negocia_'+qryNegociacoes.FieldList.Fields[j].FieldName+']', copia ) > 0 then
                        begin

                           {Caso exista uma variável para o campo atual a
                           substituimos pelo valor do campo}
                           copia := ReplaceStr(
                              copia,
                              '[negocia_'+qryNegociacoes.FieldList.Fields[j].FieldName+']',
                              qryNegociacoes.FieldList.Fields[j].AsString
                           );
                        end;
                     end;

                     qryNegociacoes.Next;

                  end;

                  {Retira os rótulos do título}
                  titulo_negocia := ReplaceStr(titulo_negocia, '[negocia_titulo]', EmptyStr);
                  titulo_negocia := ReplaceStr(titulo_negocia, '[/negocia_titulo]', EmptyStr);

                  strAut := ReplaceStr(strAut, substitui_original, Trim(titulo_negocia) + Trim(copia));

               end;
            end;

            { TROCAR os dados do DEPARTAMENTO }

            strAut := ReplaceStr(strAut, '[razao_social]',     qyDepto.FieldByName('razaosocial').AsString);
            strAut := ReplaceStr(strAut, '[cnpj]',             qyDepto.FieldByName('ds_cnpj').AsString);
            strAut := ReplaceStr(strAut, '[depto_endereco]',   qyDepto.FieldByName('ds_endereco').AsString);
            strAut := ReplaceStr(strAut, '[depto_bairro]',     qyDepto.FieldByName('ds_bairro').AsString);
            strAut := ReplaceStr(strAut, '[depto_cidade]',     qyDepto.FieldByName('ds_cidade').AsString);
            strAut := ReplaceStr(strAut, '[depto_estado]',     qyDepto.FieldByName('ds_estado').AsString);
            strAut := ReplaceStr(strAut, '[depto_cep]',        qyDepto.FieldByName('ds_cep').AsString);

            { TROCAR os dados do RESPOSAVEL }

            strAut := ReplaceStr(strAut, '[cd_pessoa]',        Dm.qAux2.FieldByName('cd_pessoa').AsString);
            strAut := ReplaceStr(strAut, '[nm_pessoa]',        Dm.qAux2.FieldByName('nm_pessoa').AsString);
            strAut := ReplaceStr(strAut, '[nm_resp]',          Dm.qAux2.FieldByName('nm_resp').AsString);
            strAut := ReplaceStr(strAut, '[ds_tipo_titulo]',   Dm.qAux2.FieldByName('ds_tipo_titulo').AsString);
            strAut := ReplaceStr(strAut, '[ds_caixa]',         Dm.qAux2.FieldByName('ds_caixa').AsString);
            strAut := ReplaceStr(strAut, '[cd_caixa]',         Dm.qAux2.FieldByName('cd_caixa').AsString);
            strAut := ReplaceStr(strAut, '[cd_mensalidade]',   Dm.tblMensalidadescd_mensalidade.AsString);

            strAut := ReplaceStr(strAut, '[datavencimento]', FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataVencimento.AsDateTime));
            strAut := ReplaceStr(strAut, '[datapagamento]',  FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataPagamento.AsDateTime));
            strAut := ReplaceStr(strAut, '[valorbruto]',     FloatToStrF(Dm.tblMensalidadesValorBruto.AsCurrency, ffFixed, 9, 2 )) ;
            strAut := ReplaceStr(strAut, '[valorjuros]',     FloatToStrF(Dm.tblMensalidadesValorJuros.AsCurrency, ffFixed, 9, 2 )) ;
            strAut := ReplaceStr(strAut, '[valordesconto]',  FloatToStrF(Dm.tblMensalidadesValorDesconto.AsCurrency, ffFixed, 9, 2 )) ;
            strAut := ReplaceStr(strAut, '[descontoextra]',  FloatToStrF(Dm.tblMensalidadesDescontoExtra.AsCurrency, ffFixed, 9, 2 )) ;
            strAut := ReplaceStr(strAut, '[cd_autenticacao]',   Dm.tblMensalidadescd_autenticacao.AsString);

            if Dm.tblMensalidadessn_liberar_juros.AsInteger = 1 then begin

               strAut := ReplaceStr(strAut, '[valorliquido]', FloatToStrF(DM.tblMensalidadesValorBruto.AsCurrency
                                                            + DM.tblMensalidadesValorExtra.AsCurrency
                                                            - Dm.tblMensalidadesDescontoExtra.AsCurrency
                                                            - DM.tblMensalidadesValorDesconto.AsCurrency
                                                            + DM.tblMensalidadesValorJuros.AsCurrency , ffFixed, 9, 2 )) ;

               strAut := ReplaceStr(strAut, '[valorabono]', FloatToStrF(DM.tblMensalidadesValorJuros.AsCurrency * -1 , ffFixed, 9, 2 )) ;

               strAut := ReplaceStr(strAut, '[ABONO]', 'Obs' + CHR(13) + 'Concedido abono na parcela ' + DM.tblMensalidadesParcela.AsString);

            end else begin

               strAut := ReplaceStr(strAut, '[valorliquido]', FloatToStrF(DM.tblMensalidadesValorBruto.AsCurrency
                                                            + DM.tblMensalidadesValorExtra.AsCurrency
                                                            - Dm.tblMensalidadesDescontoExtra.AsCurrency, ffFixed, 9, 2 )) ;

               strAut := ReplaceStr(strAut, '[valorabono]', '0,00');
               strAut := ReplaceStr(strAut, '[ABONO]', '');

            end;
         end else begin
            strAut := '[cupom_produtos]';
         end;

         { Vamos fazer as impressões de boletos aqui em cima, pois algumas das variaveis abaixo,
           são utilizadas no "escreveCupons" }
         if ( ClasseComprasEntradaSaida.PodeImprimirCupom( StrToInt(cd_mensalidade), True ) ) then
         begin
            if Pos( '[cupom_produtos]', strAut ) > 0 then
            begin
               strAut := ReplacesTR(strAut, '[cupom_produtos]', escreveCupons(Dm.tblMensalidades.FieldByName('cd_mensalidade').AsInteger));
               LRegistraImpressaoCupom := True;
            end;
         end else begin
            LRegistraImpressaoCupom := False;
            if SomenteCupons then
            begin
               Mensagem( 'Os cupons já foram impressos.', '', MB_OK + MB_ICONEXCLAMATION, Handle );
               Exit;
            end else begin
               strAut := ReplacesTR(strAut, '[cupom_produtos]', '');
            end;
         end;

         strAut := ReplaceStr(strAut, '[valorpago]',  FloatToStrF(Dm.tblMensalidadesValorPago.AsCurrency, ffFixed, 9, 2 ));
         strAut := ReplaceStr(strAut, '[turma]',  Dm.tblMensalidadesTurma.AsString );
         strAut := ReplaceStr(strAut, '[curso]',  Dm.tblMensalidadesTurma.AsString );
         strAut := ReplaceStr(strAut, '[anosemestre]',  Dm.tblMensalidadesAnoSemestre.AsString );
         strAut := ReplaceStr(strAut, '[nossonumero]',  Dm.tblMensalidadesNossoNumero.AsString );
         strAut := ReplaceStr(strAut, '[parcela]',  Dm.tblMensalidadesParcela.AsString );
         strAut := ReplaceStr(strAut, '[usuario]',  Dm.tblMensalidadesUsuario.AsString );
         strAut := ReplaceStr(strAut, '[DATA]',  FormatDateTime('dd/mm/yyyy', now()) );
         strAut := ReplaceStr(strAut, '[HORA]',  FormatDateTime('hh:nn', now()) );
         if Pos('[cheques]', strAut) > 0 then begin
            strAut := ReplaceStr(strAut, '[cheques]', escreveCheque(Dm.tblMensalidades.FieldByName('cd_mensalidade').AsString));
         end;

         // Trocar #13 por ENTER
         strAut := ReplaceStr(strAut, '#13',  CHR(13) ) ;

         //Trocar negrito
         strAut := ReplaceStr(strAut, '<b>',  CHR(27) + 'E' ) ;
         strAut := ReplaceStr(strAut, '</b>',  CHR(27) + 'E' ) ;

         TImpressaoDOS.TratarFuncaoEsc( strAut );

         strAut := ReplaceStr(strAut, '<corte:tm18>', chr(ord(strtoint('29')))+chr(ord(strtoint( '+86')))+chr(ord(strtoint('+01'))));

         // Tratar os alinhamentos  CENTRO[string|tamanho]

         while Pos('CENTRO[', strAut) > 0 do
         begin
             LinhaDe := Copy(strAut, Pos('CENTRO[', strAut), Pos(']', strAut) - Pos('CENTRO[', strAut) + 1);
             LinhaPara := Copy(LinhaDe, 8, Pos('|', LinhaDe) - 8);
             n := StrToInt(Copy(LinhaDe, Pos('|', LinhaDe) + 1, Pos(']', LinhaDe) - Pos('|', LinhaDe) - 1));

             strAut := ReplaceStr( strAut, LinhaDe, Centro(LinhaPara, n) );
         end;

         // Tratar os alinhamentos  DIREITA[string|tamanho]

         while Pos('DIREITA[', strAut) > 0 do
         begin
             LinhaDe := Copy(strAut, Pos('DIREITA[', strAut), Pos(']', strAut) - Pos('DIREITA[', strAut) + 1);
             LinhaPara := Copy(LinhaDe, 9, Pos('|', LinhaDe) - 9);
             n := StrToInt(Copy(LinhaDe, Pos('|', LinhaDe) + 1, Pos(']', LinhaDe) - Pos('|', LinhaDe) - 1));

             strAut := ReplaceStr( strAut, LinhaDe, Direita(LinhaPara, n) );
         end;

         ImpressoraDOS.Imprimir(strAut);

      end
      else if mensalidades_recibo_layout = 'modelo_personalizado_sql' then
      begin
         Self.ImprimeReciboMensalidadesAgrupadasDOS(cd_mensalidade);

         if LRegistraImpressaoCupom then
         begin
            ClasseComprasEntradaSaida.RegistraImpressaoCupom( StrToInt(cd_mensalidade), True );
         end;

         Exit;
      end
      else
      begin

         ImpressoraDOS.Imprimir(' ' );          // Negrito
         ImpressoraDOS.Imprimir(Centro(SemAcento(qyDepto.FieldByName('razaosocial').AsString),iTamanho));
         ImpressoraDOS.Imprimir(Centro(SemAcento(qyDepto.FieldByName('descricao').AsString),iTamanho));
         ImpressoraDOS.Imprimir(' ' );
         ImpressoraDOS.Imprimir(Centro(SemAcento(DM.variavel_parametro('cliente_endereco')) + ' - ' + SemAcento(DM.variavel_parametro('cliente_bairro')),iTamanho));
         ImpressoraDOS.Imprimir(Centro(SemAcento(DM.variavel_parametro('cliente_cep')) +  '-' + SemAcento(DM.variavel_parametro('cliente_cidade')) + '-' + SemAcento(DM.variavel_parametro('cliente_estado')),iTamanho+8));
         ImpressoraDOS.Imprimir(Centro(SemAcento(DM.variavel_parametro('cliente_telefone')) + ' - ' + 'CNPJ: ' + SemAcento(qyDepto.FieldByName('ds_cnpj').AsString),iTamanho));

         ImpressoraDOS.Imprimir(' ' );
         ImpressoraDOS.Imprimir(Centro('RECIBO DE PAGAMENTO',iTamanho));
         ImpressoraDOS.Imprimir('Data: ' + FormatDateTime('dd/mm/yyyy', now()) + ' ' + FormatDateTime('hh:nn', now()));
         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir('Resp.: ' + SemAcento(Copy(Dm.qAux2.FieldByName('nm_resp').AsString,1,33)));
         ImpressoraDOS.Imprimir('Codigo: '+ Dm.tblMensalidadesCodigoAluno.AsString+FillString('',alLeft,' ',iTamanho-Length(Dm.tblMensalidadesNossoNumero.AsString+Dm.tblMensalidadesCodigoAluno.AsString)-19,false)+'N. Titulo: '+Dm.tblMensalidadesNossoNumero.AsString );
         ImpressoraDOS.Imprimir('Aluno: ' + SemAcento(Copy(Dm.qAux2.FieldByName('nm_pessoa').AsString,1,33)) );

         Dm.qAux2.Close;
         DM.qAux2.SQL.Clear;
         DM.qAux2.SQL.Text := ''+
          ' SELECT c.descricao curso, t.descricao turma FROM cursos c ' +
          ' INNER JOIN turmas t ON (t.curso = c.codigo AND t.anosemestre = c.anosemestre) ' +
          ' WHERE t.codigo = "' + Dm.tblMensalidadesTurma.AsString + '" ' +
          ' AND t.anosemestre = ' + Dm.tblMensalidadesAnoSemestre.AsString ;
         Dm.qAux2.Open;

         ImpressoraDOS.Imprimir('Curso: ' + DM.qAux2.FieldByName('curso').AsString );
         ImpressoraDOS.Imprimir('Turma: ' + DM.qAux2.FieldByName('turma').AsString + FillString('', alLeft, ' ', iTamanho - Length(DM.qAux2.FieldByName('turma').AsString)-15, false) + 'Parc: ' + FillString(Dm.tblMensalidadesParcela.AsString, alRight, '0', 2, false ));
         ImpressoraDOS.Imprimir('Venc.: ' + FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataVencimento.AsDateTime) + '       Pgto: ' + FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataPagamento.AsDateTime ));
         ImpressoraDOS.Imprimir('Ref. ' + Dm.tblMensalidadesds_historico.AsString);
         ImpressoraDOS.Imprimir('Valor do Titulo .: R$ ' + Direita(FloatToStrF(Dm.tblMensalidadesValorBruto.AsCurrency, ffFixed, 9, 2 ),18));
         ImpressoraDOS.Imprimir('Valor do Recibo .: R$ ' + Direita(FloatToStrF(Dm.tblMensalidadesValorPago.AsCurrency, ffFixed, 9, 2 ),18));
         ImpressoraDOS.Imprimir(escreveCheque(Dm.tblMensalidades.FieldByName('cd_mensalidade').AsString) );
         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir(Dm.tblMensalidadesNossoNumero.AsString + ' ' + FormatDateTime('ddmmmyyyy', DM.tblMensalidadesDataPagamento.AsDateTime) + '**R$' + FloatToStrF(Dm.tblMensalidadesValorPago.AsCurrency, ffFixed, 9, 2 ) + ' ' + FillString(Dm.tblMensalidadesUsuario.AsString, alRight, '0', 3, false));
         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir(' ');
         ImpressoraDOS.Imprimir(' ');

      end;

      ImpressoraDOS.PularLinhas(iPular);
      ImpressoraDOS.Finalizar();

      if LRegistraImpressaoCupom then
         ClasseComprasEntradaSaida.RegistraImpressaoCupom( StrToInt(cd_mensalidade), True );
   except
      on E:EInOutError do
      begin
         Mensagem('Impressora desconectada ou não configurada, não foi possível realizar a impressão.' + #13+#13 + 'Porta de impressão: ' + ImpressoraDOS.GetPorta(), '', MB_ICONEXCLAMATION + MB_OK, Handle);
      end;
   end;

   Close;
end;

function TfrmImpMens.isEstorno(cd_mensalidade: Integer): Boolean;
const
   SQL_IS_ESTORNO =
      ' SELECT '+
      '      count(cd_mensalidade) AS qtd '+
      '   FROM '+
      '      fin_estornos '+
      '   WHERE '+
      '      cd_mensalidade = :cd_mensalidade ';
var
   qyIsEstorno: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsEstorno);

   qyIsEstorno.SQL.Text := SQL_IS_ESTORNO;
   qyIsEstorno.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;
   qyIsEstorno.Open;

   Result := qyIsEstorno.FieldByName('qtd').AsInteger > 0
end;

function TfrmImpMens.ProcuraCodigo(codigo: Integer;
  ListaCodigos: array of Integer): Integer;
var
   n : word;
begin
   result := -1;

   For n := 0 to Length(ListaCodigos) - 1 do
   begin
       if ListaCodigos[n] = Codigo then
       begin
          result := n;
          exit;
       end
   end;

end;

function TfrmImpMens.Direita(texto: String; tamanho : integer): string;
var novo : String;
begin
   novo := Trim(texto);

   while Length(novo) < tamanho do
   begin
      novo := ' ' + novo;
   end;

   Result := novo;

end;

function TfrmImpMens.Centro(texto: String; tamanho: integer): string;
var novo : String;
begin
   novo := Trim(texto);

   while Length(novo) < tamanho do
   begin
      novo := ' ' + novo + ' ';
   end;

   Result := novo;

end;

procedure TfrmImpMens.ckbDataBoletoClick(Sender: TObject);
begin
   txtDtBoleto.Enabled := ckbDataBoleto.Checked;
end;

procedure TfrmImpMens.sbBloqueaContaClick(Sender: TObject);
begin
   // Mudar isso
   // Resp: Ta mudei... agora essa ação é realizada no Show do Form,
   // e é guardado numa variavel se a pessoa tem ou não permissão.
   if not temPermissaoAlterarConta then begin
       sbBloqueaConta.Down := True;
       Exit;
   end;

   cbContas.Enabled := not sbBloqueaConta.Down;

   if not cbContas.Enabled then
      ApresentarContas(0);

end;

procedure TfrmImpMens.sbPropriedadesClick(Sender: TObject);
begin
    //Mostra a Janela de configuracao da impressora
    PrincipalForm.Rel.Printer.Prompt;
    PrincipalForm.Rel.Printer.SetCurrent;
end;

procedure TfrmImpMens.txtDtBoletoChangeDate(Sender: TObject);
begin
   verificaDataNovoVencimento();
end;

procedure TfrmImpMens.verificaDataNovoVencimento;
var
   nrDiasMaxData: integer;
   strData: string;
   apenasData, novaData: TDate;
begin
   nrDiasMaxData := strtoint(dm.variavel_parametro('limite_max_altera_vencimento_local'));

   strData := DateToStr(now());
   apenasData := StrToDate(strData);

   if (txtDtBoleto.getDate < apenasData) then
   begin
      txtDtBoleto.setDate(apenasData);
   end;

   if ((txtDtBoleto.getDate -apenasData ) > nrDiasMaxData) then
   begin
      novaData:= apenasData + nrDiasMaxData;
      txtDtBoleto.setDate(novaData);

      // Assume a data máxima e retorna mensagem
      Mensagem('A data máxima para impressão deste boleto é: '+FormatDateTime('dd/mm/yyyy', novaData)+'.', Application.Title, MB_OK+MB_ICONWARNING, Handle);
   end;
end;

procedure TfrmImpMens.edParcelaDeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
       SelectNext( Sender as TWinControl, True, True );
       Key := #0;
   end;
   if not (Key in ['0'..'9',#8]) then begin
      Key := #0;
      Exit;
   end;
end;

function TfrmImpMens.escreveCheque(const AICodMensalidade: String): string;
const
      S_BANCO    = 'Bco ';    // Título do banco
      S_AGENCIA  = 'Ag ';     // Título da agência
      S_CONTA    = 'CC ';     // Título da conta
      S_DTCOMP   = 'Dt ';     // Título da data de compensação

      // Tamanho dos títulos da primeira linha somados
      I_TAMANHO_LINHA1 =
         Length(S_BANCO) + Length(S_AGENCIA);
      // Tamanho dos títulos da segunda linha somados
      I_TAMANHO_LINHA2 = Length(S_CONTA) + Length(S_DTCOMP);
      
      // SQL para trazer todos os cheques ligados à mensalidade
      SQL =
      'SELECT '+
      '  CONCAT(''('', GROUP_CONCAT(c.ds_cheque SEPARATOR '', ''), '')'') AS ds_cheque'+
      ' , c.ds_conta, c.ds_banco, c.ds_agencia, DATE_FORMAT(c.dt_compensacao, "%d/%m/%y") dt_compensacao '+
      'FROM '+
      '  fin_cheques c JOIN fin_cheques_mensalidades cm USING(cd_cheque)'+
      'WHERE '+
      ' cm.cd_mensalidade IN (%s) '+
      'GROUP BY c.ds_conta, c.ds_banco, c.ds_agencia';
var
   qyCheque          : TUMZQuery;

   sMensagemCheque,
   pularLinha        : String;

begin
   DM.CriarConsulta(qyCheque);
   
   try
      qyCheque.ParamCheck := True;
      qyCheque.SQL.Text := StringReplace(SQL, '%s', AICodMensalidade, [rfReplaceAll, rfIgnoreCase]);
      qyCheque.Open;

      if DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') = 'S' then
      begin
         pularLinha := '[/n]';
      end
      else
      begin
         pularLinha := CHR(13) + CHR(10);
      end;

      if not qyCheque.Eof then
      begin
         sMensagemCheque := Dm.variavel_parametro('financeiro_recibo_cheques_msg');
         sMensagemCheque := ReplaceStr(sMensagemCheque, '#13', pularLinha);

         if Length(sMensagemCheque) > 1 then
         begin
            sMensagemCheque := sMensagemCheque + pularLinha;
         end;
      end;

      while not qyCheque.Eof do
      begin

         sMensagemCheque :=
            sMensagemCheque +
            S_BANCO +
            qyCheque.FieldByName('ds_banco').AsString +
            ' ';

         sMensagemCheque :=
            sMensagemCheque +
            S_AGENCIA +
            qyCheque.FieldByName('ds_agencia').AsString +
            ' ';

         sMensagemCheque :=
            sMensagemCheque +
            S_CONTA +
            qyCheque.FieldByName('ds_conta').AsString +
            ' ';

         sMensagemCheque :=
            sMensagemCheque +
            S_DTCOMP +
            qyCheque.FieldByName('dt_compensacao').AsString +
            pularLinha;

         sMensagemCheque :=
            sMensagemCheque +
            qyCheque.FieldByName('ds_cheque').AsString;

         qyCheque.Next;

      end;

   finally
      FreeAndNil(qyCheque);
   end;
   
   Result := sMensagemCheque;
end;

function TfrmImpMens.escreveCupons(const AICodMensalidade: integer): string;
var
   registros_cupons : ClasseRegistros;
   conteudo_cupom, conteudo_cupom_aux, strAuxQtdCupons: String;
   nr_quantidade: Integer;
begin
   Result := '';

   if ClasseComprasEntradaSaida.hasCompraFromMensalidade( AICodMensalidade ) = 0 then Exit;

   registros_cupons := ClasseComprasEntradaSaida.GetCuponsMensalidade( AICodMensalidade );
   conteudo_cupom := DM.variavel_parametro( 'financeiro_cupom_campos' );

   while not registros_cupons.IsFim do
   begin
      nr_quantidade := registros_cupons.Campo['nr_quantidade'];
      conteudo_cupom_aux := '';

      while nr_quantidade > 0 do
      begin
         strAuxQtdCupons := '';

         if registros_cupons.Campo['tp_impressao_cupom'] = 'A' then
         begin
            strAuxQtdCupons := ' (' + IntToStr( nr_quantidade ) + 'x)';
            nr_quantidade := 1;
         end;

         conteudo_cupom_aux := conteudo_cupom_aux + Chr(13) + conteudo_cupom;

         conteudo_cupom_aux := ReplaceStr(conteudo_cupom_aux, '[DATA]',  FormatDateTime('dd/mm/yyyy', now()) ) ;
         conteudo_cupom_aux := ReplaceStr(conteudo_cupom_aux, '[HORA]',  FormatDateTime('hh:nn', now()) ) ;

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_nome]',
            registros_cupons.Campo['nm_coligada'], [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_cnpj]',
            registros_cupons.Campo['ds_cnpj'], [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_endereco]',
            registros_cupons.Campo['cliente_endereco'], [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[unidade_telefone]',
            registros_cupons.Campo['cliente_telefone'], [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[cd_pessoa]',
            IntToStr(registros_cupons.Campo['cd_pessoa']), [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[nm_pessoa]',
            registros_cupons.Campo['nm_pessoa'], [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[produto_nome]',
            registros_cupons.Campo['ds_produto'] + strAuxQtdCupons, [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[turma]',
            registros_cupons.Campo['turma'] + strAuxQtdCupons, [rfReplaceAll, rfIgnoreCase] );

         conteudo_cupom_aux := StringReplace( conteudo_cupom_aux, '[produto_valor]',
                       FloatToStrF(registros_cupons.Campo['vl_produto'], ffFixed, 9, 2 ) + strAuxQtdCupons, [rfReplaceAll, rfIgnoreCase] );

         Dec(nr_quantidade);
      end;

      Result := Result + conteudo_cupom_aux;

      registros_cupons.Proximo;
   end;
end;


function TfrmImpMens.escreveNegocia(const cd_mensalidade: Integer): String;
var
   titulo_negocia,
   copia,
   substitui_original,
   formato: String;
   
   posIni,
   posFim,
   I,
   J: Integer;

   qryNegociacoes: TUMZQuery;
begin
   { GERAR IMPRESSÃO DAS NEGOCIAÇÕES VINCULADAS Á MENSALIDADE }
   titulo_negocia := '';
   copia := '';

   formato := DM.variavel_parametro('recibo_negociacoes');

   posIni := 0;
   posFim := 0;

   posIni := Pos('[negocia]', formato);
   posFim := Pos('[/negocia]', formato);

   {Verifica se existe uma configuração para as negociações da
   MENSALIDADE}
   if (posIni > 0) and (posFim > 0) then
   begin
      DM.CriarConsulta(qryNegociacoes);

      {Verifica se possui título}
      posIni := Pos('[negocia_titulo]', formato);
      posFim := Pos('[/negocia_titulo]', formato);

      if (posIni > 0) and (posFim > 0) then
      begin
         titulo_negocia := Trim(Copy(formato, posIni, posFim - posIni + 17));
      end;

      posIni := Pos('[negocia]', formato);
      posFim := Pos('[/negocia]', formato);

      {SQL que busca os valores diposníveis referente as
      negociações da MENSALIDADE}
      qryNegociacoes.SQL.Text := ' SELECT ';
      qryNegociacoes.SQL.Add(' mo.*, ');
      qryNegociacoes.SQL.Add(' fne.* ');
      qryNegociacoes.SQL.Add(' FROM ');
      qryNegociacoes.SQL.Add(' mensalidades as  m');
      qryNegociacoes.SQL.Add(' INNER JOIN fin_negocia_parc_nova AS fn ON ( m.cd_mensalidade = fn.cd_mensalidade ) ');
      qryNegociacoes.SQL.Add(' INNER JOIN fin_negocia_parc_atual AS fa ON ( fn.cd_negocia = fa.cd_negocia ) ');
      qryNegociacoes.SQL.Add(' INNER JOIN fin_negocia fne ON ( fa.cd_negocia = fne.cd_negocia ) ');
      qryNegociacoes.SQL.Add(' INNER JOIN mensalidades AS mo ON ( fa.cd_mensalidade = mo.cd_mensalidade ) ');
      qryNegociacoes.SQL.Add(' WHERE ');
      qryNegociacoes.SQL.Add(' m.cd_mensalidade = :codigo_mensalidade ');

      qryNegociacoes.ParamByName('codigo_mensalidade').AsInteger := cd_mensalidade;

      qryNegociacoes.Open;

      {Aqui salva o valor entre [negocia] até [/negocia] para poder
      substituir após montar a string com as variáveis ja substituidas}
      substitui_original := Copy(formato, posIni, posFim - posIni + 10);

      {CASO nao tenha nenhuma negociação o sistema limpa os campos que
      apareceriam}
      if qryNegociacoes.RecordCount = 0 then
      begin
         Result := '';
      end
      else
      begin

         {Percorre todas negociações vinculadas a MENSALIDADE}
         for I := 0 to qryNegociacoes.RecordCount - 1 do
         begin

            {Aqui copiamos uma vez todo o [negocia][/negocia] para
            gerar um para cada parcela.}
            copia := Trim(copia) + Trim(Copy(formato, posIni, posFim - posIni + 10));

            copia := ReplaceStr(copia, titulo_negocia, EmptyStr);
            copia := ReplaceStr(copia, '[negocia]', EmptyStr);
            copia := ReplaceStr(copia, '[/negocia]', EmptyStr);

            {Percorre todos campos disponíveis para substituir por variáveis}
            for j := 0 to qryNegociacoes.FieldList.Count - 1 do
            begin

               {Verifica se existe uma variável com o campo atual}
               if Pos( '[negocia_'+qryNegociacoes.FieldList.Fields[j].FieldName+']', copia ) > 0 then
               begin

                  {Caso exista uma variável para o campo atual a
                  substituimos pelo valor do campo}
                  copia := ReplaceStr(
                     copia,
                     '[negocia_'+qryNegociacoes.FieldList.Fields[j].FieldName+']',
                     qryNegociacoes.FieldList.Fields[j].AsString
                  );
               end;
            end;

            qryNegociacoes.Next;

         end;

         {Retira os rótulos do título}
         titulo_negocia := ReplaceStr(titulo_negocia, '[negocia_titulo]', EmptyStr);
         titulo_negocia := ReplaceStr(titulo_negocia, '[/negocia_titulo]', EmptyStr);

         Result := Trim(titulo_negocia) + Trim(copia);
      end;
   end;
end;

procedure TfrmImpMens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM.Set_Parametros_usuario(Self);
end;

procedure TfrmImpMens.FormCreate(Sender: TObject);
var
   S: string;
begin
   S := DM.variavel_parametro('FINANCEIRO_IMPRESSAO_QTD_COPIAS');

   if TryStrToInt(S, FCopias) then
   begin
      if FCopias < 1 then FCopias := 1;
   end
   else
   begin
      FCopias := 1;
   end;

   lblCopias.Caption := Format('(cópias: %d)', [FCopias]);

   New(FUMRecMensalidade);
end;

procedure TfrmImpMens.FormDestroy(Sender: TObject);
begin
   Dispose(FUMRecMensalidade);
end;

procedure TfrmImpMens.radParcelaClick(Sender: TObject);
begin
    edParcelaDe.Enabled := radParcela.Checked;
    edParcelaAte.Enabled := radParcela.Checked;
    ApresentarContas(0);
end;

procedure TfrmImpMens.radSelecionadoClick(Sender: TObject);
begin
    ApresentarContas(0);
end;

end.

