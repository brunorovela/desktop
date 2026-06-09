unit uFCadRepasses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uFRepasseAluno, StdCtrls, Buttons, uFSelecionarTurma, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset ,uItemCombo , ufRepasseTurma,uFRepasseCertificado,
  ComCtrls, ToolWin, ImgList, DBCtrls, uDM, MidasLib;

type
  TfrmCadRepasses = class(TForm)
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    bvlTop: TBevel;
    pnlFiltro: TPanel;
    bvlFiltroBaixo: TBevel;
    pnlSubtitulo: TPanel;
    bvlSep: TBevel;
    pnlPrincipalInfo: TPanel;
    lblTurma: TLabel;
    edTurma: TEdit;
    sbBuscaTurma: TSpeedButton;
    lblSelecioneContrato: TLabel;
    cbContratos: TComboBox;
    lblTipoContrato: TLabel;
    qryContratoTurma: TUMZQuery;
    qryContratoTurmacd_contrato: TIntegerField;
    qryContratos: TUMZQuery;
    qryContratoscd_contrato: TLargeintField;
    qryContratosds_contrato: TStringField;
    qryContratoscd_tipo: TLargeintField;
    ImageList1: TImageList;
    qryContratosds_valor: TStringField;
    dbTipoContrato: TDBText;
    dsContrato: TDataSource;
    toolAcoes: TToolBar;
    ToolButton22: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton35: TToolButton;
    btnFechar: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbContratosChange(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure filtraContratos;
  private
    { Private declarations }
    frameAtual   : TFrame;
    cd_coligada : Integer;
    procedure montaComboContratos;
  public
    bAbortar     : Boolean;
    iAnoSemestre : Integer;
    procedure atualizaContratos;
    procedure salvarContratoTurma;
    procedure habilitarBotoes(bHabilita: Boolean);
    { Public declarations }
  end;


const
   SQL_ORIGEM_CONTRATOS =
   ' SELECT                            '+
   '   cc.cd_contrato,cc.ds_contrato,cc.cd_tipo,s.ds_valor '+
   ' FROM                              '+
   '   conv_contratos cc               '+
   '   INNER JOIN situacoes s ON ( s.cd_modulo = 2100 AND s.cd_situacao = cc.cd_tipo ) ' +
   ' WHERE cc.cd_coligada IN ( %s ) ';

   SQL_CONTRATOS_ORDENACAO  =
   ' ORDER BY                  '+
   '   ds_contrato             ';

var
  frmCadRepasses: TfrmCadRepasses;

implementation

uses uUsuario;

{$R *.dfm}

procedure TfrmCadRepasses.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadRepasses.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      btnFechar.Click
   else if Key = VK_F5 then
      btnSalvar.Click
   else if key = VK_F6 then
      btnCancelar.Click;
end;

procedure TfrmCadRepasses.FormShow(Sender: TObject);
begin
   cd_coligada := -1;
   qryContratos.Close;
   qryContratos.Open;
   montaComboContratos();
   habilitarBotoes(false);
   bAbortar := False;
end;

procedure TfrmCadRepasses.montaComboContratos();
begin
   cbContratos.Clear;
   qryContratos.First;
   while not qryContratos.Eof do
   begin
      cbContratos.AddItem( qryContratosds_contrato.AsString, TItemCombo.Create( qryContratoscd_contrato.AsString , qryContratoscd_tipo.AsString ));
      qryContratos.Next;
   end;
end;

procedure TfrmCadRepasses.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   edTurma.Text := resultado_filtro.cd_turma;
   iAnoSemestre := resultado_filtro.nr_anosemestre;
   cd_coligada := resultado_filtro.cd_coligada;
   filtraContratos;

   if( cbContratos.Items.Count > 0 ) then
   begin
      cbContratos.ItemIndex := 0;
      cbContratosChange(nil);
   end
   else
   begin
      try
         cbContratos.ItemIndex := -1;
         cbContratosChange(nil);
      except on E: Exception do
      end;

   end;
end;

procedure TfrmCadRepasses.atualizaContratos;
begin
   filtraContratos;
   cbContratos.ItemIndex := 0;
end;

procedure TfrmCadRepasses.btnCancelarClick(Sender: TObject);
begin
   habilitarBotoes(false);
   if( TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getDescricao = '0' ) then
   begin
      TFrmRepasseAluno(frameAtual).cancel;
   end
   else if( TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getDescricao = '1' )then
   begin
      TfrmRepasseTurma(frameAtual).cancel;
   end
   else if ( TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getDescricao = '2' )then
   begin
      TFrmRepasseCertificado(frameAtual).ativarFrame;
   end;
end;

procedure TfrmCadRepasses.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadRepasses.btnSalvarClick(Sender: TObject);
begin
   cbContratos.SetFocus;
   if bAbortar then
   begin
      bAbortar := False;
      Abort;
   end;

   if frameAtual is TFrmRepasseAluno then
   begin
      habilitarBotoes(False);
      TFrmRepasseAluno(frameAtual).salvar();
   end
   else if frameAtual is TfrmRepasseTurma then
   begin
      if TfrmRepasseTurma(frameAtual).qryGetRepasseTurma.State  = dsInsert then
      begin
         if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.IndicaoRepasse', npIncluir, True ) then
            Exit;
      end
      else
      begin
         if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.IndicaoRepasse', npAlterar, True ) then
            Exit;
      end;
      TfrmRepasseTurma(frameAtual).salvar();
      habilitarBotoes(False);
   end
   else if frameAtual is TFrmRepasseCertificado then
   begin
      habilitarBotoes(false);
      TFrmRepasseCertificado(frameAtual).salvar();
   end;
   salvarContratoTurma;
   filtraContratos;
   cbContratos.ItemIndex := 0;
   cbContratos.SetFocus;
end;

procedure TfrmCadRepasses.cbContratosChange(Sender: TObject);
begin
   FreeAndNil(frameAtual);
   if TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getDescricao = '0' then
   begin
      frameAtual := TFrmRepasseAluno.Create(pnlPrincipalInfo);
      frameAtual.Parent := pnlPrincipalInfo;
      TFrmRepasseAluno(frameAtual).formPai := Self;
      TFrmRepasseAluno(frameAtual).setCdTurma(edTurma.Text);
      TFrmRepasseAluno(frameAtual).setContrato(StrToInt(TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getCodigo));
      TFrmRepasseAluno(frameAtual).ativarFrame;
   end
   else if TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getDescricao = '1' then
   begin
      frameAtual  := TfrmRepasseTurma.Create( pnlPrincipalInfo );
      frameAtual.Parent := pnlPrincipalInfo;
      TfrmRepasseTurma(frameAtual).formPai    := Self;
      TfrmRepasseTurma(frameAtual).setCdTurma(edTurma.Text);
      TfrmRepasseTurma(frameAtual).setContrato(StrToInt(TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getCodigo));
      TfrmRepasseTurma(frameAtual).ativarFrame;
   end
   else  if TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getDescricao = '2' then
   begin
      frameAtual        := TFrmRepasseCertificado.create( pnlPrincipalInfo );
      TFrmRepasseCertificado(frameAtual).formPai := Self;
      TFrmRepasseCertificado(frameAtual).setCdTurma(edTurma.Text);
      TFrmRepasseCertificado(frameAtual).setContrato(StrToInt(TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getCodigo));
      TFrmRepasseCertificado(frameAtual).ativarFrame;
      frameAtual.Parent := pnlPrincipalInfo;
   end;
   qryContratos.Locate('cd_contrato',
                        TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getCodigo,
                        []
                       );
   lblTipoContrato.Visible := true;
   dbTipoContrato.Visible  := true;
   toolAcoes.Visible       := true;
   habilitarBotoes(false);
end;

procedure TfrmCadRepasses.salvarContratoTurma();
var
   qryVerificaContratoTurma : TUMZQuery;
begin
   DM.CriarConsulta(qryVerificaContratoTurma);
   qryVerificaContratoTurma.SQL.Text := ''+
   ' SELECT                              '+
   '   cd_contrato                       '+
   ' FROM                                '+
   '   conv_contratos_turmas             '+
   ' WHERE                               '+
   '   cd_contrato ='+ TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getCodigo ;
   qryVerificaContratoTurma.Open;

   if qryVerificaContratoTurma.FieldByName('cd_contrato').AsInteger = 0 then
   begin
      qryVerificaContratoTurma.Close;

      //se ainda nao tiver um contrato vinculado ao turma vincula o atual
      qryVerificaContratoTurma.SQL.Text := ' INSERT INTO conv_contratos_turmas( cd_contrato, cd_turma )'+
                                           ' VALUES ( :cd_contrato, :cd_turma ) ';
      qryVerificaContratoTurma.ParamByName('cd_contrato').AsInteger := StrToInt(TItemCombo(cbContratos.Items.Objects[cbContratos.ItemIndex]).getCodigo);
      qryVerificaContratoTurma.ParamByName('cd_turma').AsString     := edTurma.Text;
      qryVerificaContratoTurma.ExecSQL;


   end;
   FreeAndNil(qryVerificaContratoTurma);
end;

procedure TfrmCadRepasses.filtraContratos;
begin
   qryContratoTurma.Close;
   qryContratoTurma.ParamByName('cd_turma').AsString := edTurma.Text;
   qryContratoTurma.Open;

   if qryContratoTurmacd_contrato.AsInteger = 0 then
   begin
      qryContratos.Close;

      if cd_coligada = -1 then
         qryContratos.SQL.Text := Format( SQL_ORIGEM_CONTRATOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] )
      else
         qryContratos.SQL.Text := Format( SQL_ORIGEM_CONTRATOS, [IntToStr(cd_coligada)] );

      qryContratos.SQL.Text := qryContratos.SQL.Text + SQL_CONTRATOS_ORDENACAO;

      qryContratos.Open;
   end
   else
   begin
      qryContratos.Close;
      qryContratos.SQL.Text := SQL_ORIGEM_CONTRATOS +
                               ' AND             '+
                               '    cd_contrato =  '+
                               qryContratoTurmacd_contrato.AsString+
                               SQL_CONTRATOS_ORDENACAO;
      if cd_coligada = -1 then
         qryContratos.SQL.Text := Format( SQL_ORIGEM_CONTRATOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] )
      else
         qryContratos.SQL.Text := Format( SQL_ORIGEM_CONTRATOS, [IntToStr(cd_coligada)] );
         
      qryContratos.Open;
   end;
   montaComboContratos;
end;

procedure TfrmCadRepasses.habilitarBotoes( bHabilita : Boolean );
begin
   btnSalvar.Enabled   := bHabilita;
   btnCancelar.Enabled := bHabilita;
end;


end.
