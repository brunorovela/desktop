unit uFGerarRepasseMensal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, ExtCtrls,
  DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, General,ufCadRepasseJustificativa,
  ClassRegistros;

type
  TfrmGerarRepasse = class(TForm)
    pnlConteudo: TPanel;
    pnlTop: TPanel;
    bvlTop: TBevel;
    pnlFiltro: TPanel;
    bvlFiltroBaixo: TBevel;
    mkedPeriodo: TMaskEdit;
    lblMesAno: TLabel;
    btnGerarRepasse: TButton;
    btnImprimir: TButton;
    ImageList1: TImageList;
    toolAcoes: TToolBar;
    ToolButton22: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton35: TToolButton;
    btnFechar: TToolButton;
    Bevel1: TBevel;
    pnlPrincipal: TPanel;
    bvlSepTopo: TBevel;
    dbgPrincipal: TDBGrid;
    pnlSubtitulo: TPanel;
    pnlFiltros: TPanel;
    Bevel2: TBevel;
    qryGetAlunos: TUMZQuery;
    qryGetAlunostotal: TLargeintField;
    dsRepasses: TDataSource;
    qryGetRepassesGrid: TUMZQuery;
    qryGetRepassesGridcd_turma: TStringField;
    qryGetRepassesGridcd_contrato: TLargeintField;
    qryGetRepassesGridnr_mes_ano_ref: TStringField;
    qryGetRepassesGridparcela: TStringField;
    qryGetRepassesGridvl_total_repasse: TFloatField;
    qryGetRepassesGridnr_total_alunos: TLargeintField;
    qryGetRepassesGridvl_deducao: TFloatField;
    qryGetRepassesGridvl_acrescimo: TFloatField;
    qryGetRepassesGridds_observacao: TMemoField;
    qryGetRepassesGridcd_pessoa_log: TLargeintField;
    qryGetRepassesGridnr_parcela_atual: TLargeintField;
    qryGetRepassesGridnr_total_parcelas: TLargeintField;
    qryGetRepassesGriddescUnidades: TStringField;
    qryGetUnidades: TUMZQuery;
    qryGetUnidadesnm_coligada: TStringField;
    qryGetRepassesGridds_justificativa: TStringField;
    procedure qryGetRepassesGridCalcFields(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure mkedPeriodoChange(Sender: TObject);
    procedure qryGetRepassesGridBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsRepassesDataChange(Sender: TObject; Field: TField);
    procedure dsRepassesStateChange(Sender: TObject);
    procedure dbgPrincipalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryGetRepassesGridvl_deducaoChange(Sender: TField);
    procedure qryGetRepassesGridvl_acrescimoChange(Sender: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryGetRepassesGridBeforeEdit(DataSet: TDataSet);
    procedure mkedPeriodoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGerarRepasseClick(Sender: TObject);
  strict private
    procedure CarregarRepasses(const periodo: String);

  private
    procedure verificaRepasseExistente;
    procedure habilitarBotoes( bHabilitar : Boolean );
    function getParcAtual( DataInicio,MesRef : TDateTime ): integer;
    procedure InserirRepasse( var qyListaRepasses : TUMZReadOnlyQuery );
    function Explode(str, separador: string): TStringList;
    { Private declarations }
  public
    { Public declaratins }
    bSalvandoJustificativa   : Boolean;
    bRecalcular : Boolean;
    bSalvandoTela : Boolean;
    procedure gerarRepasse;
    procedure Salvar;
  end;
const
   SQL_DELETA_REPASSE_MES = ''+
      ' DELETE                  '+
      ' FROM                    '+
      '   conv_repasses_mensal  '+
      ' WHERE                   '+
      '   nr_mes_ano_ref = :nr_mes_ano_ref ';

   SQL_INSERE_REPASSE = ''+
      ' INSERT INTO conv_repasses_mensal (   '+
      '     cd_turma,                        '+
      '     cd_contrato,                     '+
      '     nr_mes_ano_ref,                  '+
      '     nr_parcela_atual,                '+
      '     nr_total_parcelas,               '+
      '     vl_total_repasse,                '+
      '     nr_total_alunos                  '+
      ' ) VALUES (                           '+
      ' 	  :cd_turma,                        '+
      ' 	  :cd_contrato,                     '+
      '    :nr_mes_ano_ref,                  '+
      '    :nr_parcela_atual,                '+
      '    :nr_total_parcelas,               '+
      '    :vl_total_repasse,                '+
      '    :nr_total_alunos                  '+
      ' )                                    ';
var
   frmGerarRepasse: TfrmGerarRepasse;

implementation

uses Main, uUsuario;

{$R *.dfm}

procedure TfrmGerarRepasse.btnCancelarClick(Sender: TObject);
begin
   habilitarBotoes(false);
   qryGetRepassesGrid.Cancel;
end;

procedure TfrmGerarRepasse.btnFecharClick(Sender: TObject);
begin
   qryGetRepassesGrid.Cancel;
   Close;
end;

procedure TfrmGerarRepasse.btnGerarRepasseClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.RelatorioRepasse', npIncluir, True ) then Exit;
   mkedPeriodoExit(nil);
   btnGerarRepasse.SetFocus;
   gerarRepasse();
   CarregarRepasses( mkedPeriodo.Text );
   verificaRepasseExistente;
end;

procedure TfrmGerarRepasse.btnImprimirClick(Sender: TObject);
var
   sFormula : string;
   lstExplode : TStringList;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   lstExplode := Explode(mkedPeriodo.Text , '/');
   sFormula   := '{@ano}=''' +lstExplode[1]+''' AND {@mes}=''' +lstExplode[0]+ '''';
   PrincipalForm.Rel.Printer.Prompt();

   infoRelatorio := PrincipalForm.GetInfoRpt('repConveniosRepasse');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio,-1,sFormula, '', nil, nil, nil, nil, true, False, nil, PodeExportar);
end;

procedure TfrmGerarRepasse.gerarRepasse;
const
   SQL_LISTA_REPASSES =
      ' SELECT cc.cd_tipo, sum(cr.vl_remessa) as valor_remessa, ' +
      '        DATE_FORMAT( cr.dt_inicio_repasse,''%m/%Y'') as mes_ano, ' +
      '        cr.nr_total_parcelas, count(*) as total_aluno, ' +
      '        cr.cd_turma, cc.cd_contrato, cc.cd_coligada, cc.vl_contrato ' +
      ' FROM conv_repasses cr ' +
      '      INNER JOIN conv_contratos cc ON ( cc.cd_contrato = cr.cd_contrato ) ' +
      ' WHERE DATE_FORMAT( dt_inicio_repasse,''%Y%m'') <= :ano_mes AND ' +
      '       cc.cd_coligada IN ( %s ) ' +
      ' GROUP BY cd_turma,nr_total_parcelas, DATE_FORMAT( dt_inicio_repasse,''%m/%Y'') ' +
      ' ORDER BY DATE_FORMAT( cr.dt_inicio_repasse,''%m/%Y''), cd_coligada ';

var
   ListAnoMes : TStringList;
   qyListaRepasses : TUMZReadOnlyQuery;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.IndicaoRepasse', npIncluir, True ) then Exit;
   ListAnoMes := Explode(mkedPeriodo.Text , '/');

   DM.CriarConsulta(qyListaRepasses);
   qyListaRepasses.SQL.Text := Format( SQL_LISTA_REPASSES, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qyListaRepasses.ParamByName('ano_mes').AsInteger := StrToInt(ListAnoMes[1]+ ListAnoMes[0]);
   qyListaRepasses.Open();

   InserirRepasse( qyListaRepasses );

   FreeAndNil( qyListaRepasses );
   FreeAndNil( ListAnoMes );
end;

procedure TfrmGerarRepasse.InserirRepasse( var qyListaRepasses : TUMZReadOnlyQuery );
var
   qryInsereRepasse : TUMZQuery;

   iParcAtual : Integer;
   sChaveAnterior, sChaveAtual: String;
begin
   dm.CriarConsulta(qryInsereRepasse);
   if bRecalcular then
   begin
      if (Mensagem(
                  'Deseja realmente recalcular o repasse do mês/ano '+mkedPeriodo.Text+'?'+#13+
                  'Esta ação ira apagar todos os dados salvos anteriormente sobre esse mês/ano',
                  '',
                  MB_YESNO, Handle)=mrYes) then
      begin
         qryInsereRepasse.Close;
         qryInsereRepasse.SQL.Text := SQL_DELETA_REPASSE_MES;
         qryInsereRepasse.ParamByName('nr_mes_ano_ref').AsString := mkedPeriodo.Text;
         qryInsereRepasse.ExecSQL;

      end
      else
      begin
         Abort;
      end;
   end;

   { Chave para Geração de Log. Só será gerado log quando ela estiver vazia, ou se a nova chave for diferente à que está na variável }
   sChaveAnterior := '';

   while not( qyListaRepasses.Eof ) do
   begin
      iParcAtual := getParcAtual(
                               strToDate('01/'+ qyListaRepasses.FieldByName('mes_ano').AsString) ,
                               StrToDate('01/'+mkedPeriodo.Text)
                             );

      if( qyListaRepasses.FieldByName('cd_tipo').AsInteger = 1 ) then
      begin
         if( iParcAtual <= qyListaRepasses.FieldByName('nr_total_parcelas').AsInteger ) then
         begin

            qryGetAlunos.Close;
            qryInsereRepasse.SQL.Text := SQL_INSERE_REPASSE;
            qryGetAlunos.ParamByName('cd_turma').AsString := qyListaRepasses.FieldByName('cd_turma').AsString;
            if (dm.UsaAnosemestre = true) then
            begin
               qryGetAlunos.ParamByName('anosemestre').AsInteger := dm.GetAnoSemestreAtual;
            end
            else
            begin
               qryGetAlunos.ParamByName('anosemestre').AsInteger := 1;
            end;
            qryGetAlunos.Open;
            qryInsereRepasse.ParamByName('cd_turma').AsString            := qyListaRepasses.FieldByName('cd_turma').AsString;
            qryInsereRepasse.ParamByName('cd_contrato').AsInteger        := qyListaRepasses.FieldByName('cd_contrato').AsInteger;
            qryInsereRepasse.ParamByName('nr_mes_ano_ref').AsString      := mkedPeriodo.Text;
            qryInsereRepasse.ParamByName('nr_parcela_atual').AsInteger   := iParcAtual;
            qryInsereRepasse.ParamByName('nr_total_parcelas').AsInteger  := qyListaRepasses.FieldByName('nr_total_parcelas').AsInteger;
            qryInsereRepasse.ParamByName('vl_total_repasse').asfloat     := qyListaRepasses.FieldByName('valor_remessa').asfloat/qyListaRepasses.FieldByName('nr_total_parcelas').AsInteger;
            qryInsereRepasse.ParamByName('nr_total_alunos').AsInteger    := qryGetAlunostotal.AsInteger;
            qryInsereRepasse.ExecSQL;
         end;
      end
      else if( qyListaRepasses.FieldByName('cd_tipo').AsInteger IN [0,2] ) then
      begin
         if( iParcAtual <= qyListaRepasses.FieldByName('nr_total_parcelas').AsInteger ) then
         begin
            qryInsereRepasse.Close;
            qryInsereRepasse.SQL.Text := SQL_INSERE_REPASSE;
            qryInsereRepasse.ParamByName('cd_turma').AsString            := qyListaRepasses.FieldByName('cd_turma').AsString;
            qryInsereRepasse.ParamByName('cd_contrato').AsInteger        := qyListaRepasses.FieldByName('cd_contrato').AsInteger;
            qryInsereRepasse.ParamByName('nr_mes_ano_ref').AsString      := mkedPeriodo.Text;
            qryInsereRepasse.ParamByName('nr_parcela_atual').AsInteger   := iParcAtual;
            qryInsereRepasse.ParamByName('nr_total_parcelas').AsInteger  := qyListaRepasses.FieldByName('nr_total_parcelas').AsInteger;
            // se o tipo for por % mensalidade
            if( qyListaRepasses.FieldByName('cd_tipo').AsInteger = 0 ) then
            begin
               qryInsereRepasse.ParamByName('vl_total_repasse').asfloat     := qyListaRepasses.FieldByName('valor_remessa').asfloat * (qyListaRepasses.FieldByName('vl_contrato').AsFloat/100) ;
            end
            else
            begin
               qryInsereRepasse.ParamByName('vl_total_repasse').asfloat     := qyListaRepasses.FieldByName('valor_remessa').asfloat;
            end;
            qryInsereRepasse.ParamByName('nr_total_alunos').AsInteger    := qyListaRepasses.FieldByName('total_aluno').AsInteger;
            qryInsereRepasse.ExecSQL;
         end;
      end;

      sChaveAtual := qyListaRepasses.FieldByName('mes_ano').AsString + ':' + qyListaRepasses.FieldByName('cd_coligada').AsString;
      if ( sChaveAnterior <> sChaveAtual ) then
      begin
         DM.setLog(2100 , 'Especial', qyListaRepasses.FieldByName('mes_ano').AsString+':'+DateToStr(now), qyListaRepasses.FieldByName('cd_coligada').AsInteger,'Foi regerado o repasse mensal');
         sChaveAnterior := sChaveAtual;
      end;

      qyListaRepasses.Next;
   end;
   FreeAndNil(qryInsereRepasse);

end;

procedure TfrmGerarRepasse.habilitarBotoes( bHabilitar : Boolean );
begin
   btnSalvar.Enabled := bHabilitar;
   btnCancelar.Enabled := bHabilitar;
   mkedPeriodo.Enabled := not(bHabilitar);
end;

procedure TfrmGerarRepasse.mkedPeriodoChange(Sender: TObject);
begin
   verificaRepasseExistente;
end;

procedure TfrmGerarRepasse.mkedPeriodoExit(Sender: TObject);
begin
   CarregarRepasses( mkedPeriodo.Text );
   verificaRepasseExistente;
end;

procedure TfrmGerarRepasse.qryGetRepassesGridBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.RelatorioRepasse', npAlterar, true ) then abort;
   habilitarBotoes(true);
end;

procedure TfrmGerarRepasse.qryGetRepassesGridBeforePost(DataSet: TDataSet);
begin
   qryGetRepassesGridcd_pessoa_log.AsInteger := DM.iCdPessoaLogado;
end;

procedure TfrmGerarRepasse.qryGetRepassesGridCalcFields(DataSet: TDataSet);
begin
   qryGetUnidades.Close;
   qryGetUnidades.ParamByName('cd_contrato').AsInteger := qryGetRepassesGridcd_contrato.AsInteger;
   qryGetUnidades.Open;
   qryGetRepassesGriddescUnidades.AsString := qryGetUnidadesnm_coligada.AsString;

   qryGetRepassesGridds_justificativa.AsString := qryGetRepassesGridds_observacao.AsString;
end;

procedure TfrmGerarRepasse.qryGetRepassesGridvl_acrescimoChange(Sender: TField);
begin
   Application.CreateForm(TfrmRepasseJustificativa ,  frmRepasseJustificativa);
   frmRepasseJustificativa.frmPai := Self;
   frmRepasseJustificativa.ShowModal;
end;

procedure TfrmGerarRepasse.qryGetRepassesGridvl_deducaoChange(Sender: TField);
begin
   if bSalvandoJustificativa = false then
   begin
      Application.CreateForm(TfrmRepasseJustificativa ,  frmRepasseJustificativa);
      frmRepasseJustificativa.frmPai := Self;
      frmRepasseJustificativa.ShowModal;
      bSalvandoJustificativa := false
   end;
end;

procedure TfrmGerarRepasse.Salvar;
begin
   if not bSalvandoTela then
   begin
      bSalvandoJustificativa := True;
      btnSalvarClick(nil);
      bSalvandoJustificativa := false;
   end;
end;

procedure TfrmGerarRepasse.verificaRepasseExistente;
begin
   CarregarRepasses( mkedPeriodo.Text );
   if DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.RelatorioRepasse', npEspecial, false ) then
   begin
      if ( not qryGetRepassesGrid.IsEmpty ) then
      begin
         btnGerarRepasse.Caption := 'Recalcular Repasse';
         bRecalcular := true;
      end
      else
      begin
         btnGerarRepasse.Caption := 'Gerar Repasse';
         bRecalcular := false
      end;
   end
   else
   begin
      if ( not  qryGetRepassesGrid.IsEmpty ) then
      begin
         btnGerarRepasse.Enabled := false;
      end
      else
      begin
         btnGerarRepasse.Enabled := true;
      end;
   end;
end;

function TfrmGerarRepasse.getParcAtual( DataInicio , MesRef : TDateTime): integer;
var
   retorno : Integer;
begin
   retorno := 1;
   while DataInicio < MesRef do
   begin
      DataInicio := IncMonth(DataInicio);
      retorno := retorno +1;
   end;
   Result := retorno;
end;


procedure TfrmGerarRepasse.btnSalvarClick(Sender: TObject);
begin
   bSalvandoTela := True;
   if not bSalvandoJustificativa then
       btnImprimir.SetFocus();
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.RelatorioRepasse', npEspecial, True ) then Exit;
   habilitarBotoes(false);
   qryGetRepassesGrid.Post;
   bSalvandoTela := False;
end;

procedure TfrmGerarRepasse.CarregarRepasses(const periodo: String);
const
   SQL_CARREGAR_REPASSES =
      ' SELECT	cd_turma, cd_contrato, nr_mes_ano_ref, ' +
      '        CONCAT(CONCAT(nr_parcela_atual,''/''),nr_total_parcelas) as parcela, ' +
      '        vl_total_repasse, nr_total_alunos, vl_deducao, vl_acrescimo, ' +
      '        ds_observacao, cd_pessoa_log, nr_parcela_atual, nr_total_parcelas ' +
      ' FROM conv_repasses_mensal ' +
      ' WHERE nr_mes_ano_ref = :nr_mes_ano_ref AND ' +
      '       cd_contrato IN ( SELECT cd_contrato FROM conv_contratos WHERE cd_coligada IN ( %s ) ) ' +
      ' ORDER BY nr_mes_ano_ref ';
begin
   qryGetRepassesGrid.Close;
   qryGetRepassesGrid.SQL.Text := Format( SQL_CARREGAR_REPASSES, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qryGetRepassesGrid.ParamByName('nr_mes_ano_ref').AsString := periodo;
   qryGetRepassesGrid.Open;
end;

procedure TfrmGerarRepasse.dbgPrincipalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // programção para evitar a inserção
  if (KEY in [VK_DOWN]) and ( dbgPrincipal.DataSource.DataSet.RecNo = dbgPrincipal.DataSource.DataSet.RecordCount )  then
    abort;
end;

procedure TfrmGerarRepasse.dsRepassesDataChange(Sender: TObject; Field: TField);
begin
   if qryGetRepassesGrid.State = dsBrowse then
      habilitarBotoes( false );
end;

procedure TfrmGerarRepasse.dsRepassesStateChange(Sender: TObject);
begin
   if (qryGetRepassesGrid.State =  dsInsert) then
      qryGetRepassesGrid.Cancel;
end;

function TfrmGerarRepasse.Explode(str, separador: string): TStringList;
var
  p: integer;
begin
  Result := TStringList.Create;

  p := Pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p-1));
    Delete(str, 1, p + Length(separador) - 1);
    p := Pos(separador, str);
  end;

  if (str <> '') then
    Result.Add(str);
end;

procedure TfrmGerarRepasse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmGerarRepasse.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F5 then
      btnSalvar.Click
   else if key = VK_F6 then
      btnCancelar.Click
   else if key = VK_F12 then
      btnFechar.Click;
end;

procedure TfrmGerarRepasse.FormShow(Sender: TObject);
begin
   habilitarBotoes(False);
   bSalvandoTela := False;
   bSalvandoJustificativa := False;
end;

end.
