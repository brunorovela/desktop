unit uFCadContratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, ComCtrls, ToolWin, ImgList,
  Buttons, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset , uFcadConvenios,
  FileCtrl, uItemCombo, Main, General, uDM;

type
  TfrmCadContratos = class(TForm)
    ImageList1: TImageList;
    toolAtividades: TToolBar;
    ToolButton22: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton31: TToolButton;
    btnFechar: TToolButton;
    pnlPrincipal: TPanel;
    bvlRodaPe: TBevel;
    dbgContratos: TDBGrid;
    pnlTopFiltros: TPanel;
    bvlFiltroTopo: TBevel;
    bvlFiltroBaixo: TBevel;
    pnlFiltros: TPanel;
    lblUnidade: TLabel;
    lblTipoContrato: TLabel;
    lblAtivo: TLabel;
    cbUnidadeEnsino: TComboBox;
    cbTipoContrato: TComboBox;
    cbAtivo: TComboBox;
    btnFiltrar: TBitBtn;
    qryUnidadeEnsino: TUMZQuery;
    qryUnidadeEnsinocd_coligada: TIntegerField;
    qryUnidadeEnsinonm_coligada: TStringField;
    qryTipoContrato: TUMZQuery;
    qryTipoContratocd_situacao: TIntegerField;
    qryTipoContratods_valor: TStringField;
    qryContratos: TUMZQuery;
    dsContratos: TDataSource;
    qryContratoscd_contrato: TLargeintField;
    qryContratoscd_tipo: TLargeintField;
    qryContratoscd_pessoa: TLargeintField;
    qryContratosnr_dia_vencimento: TLargeintField;
    qryContratoscd_coligada: TLargeintField;
    qryContratossn_ativo: TLargeintField;
    qryContratosvl_contrato: TFloatField;
    qryContratosnm_pessoa: TStringField;
    qryContratosnm_coligada: TStringField;
    qryContratosds_valor: TStringField;
    qryContratosds_ativo: TStringField;
    ToolButton1: TToolButton;
    pnlTop: TPanel;
    bvlTopo: TBevel;
    pnlDados: TPanel;
    Panel1: TPanel;
    Bevel1: TBevel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure qryContratosCalcFields(DataSet: TDataSet);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    procedure filtar;
    { Private declarations }
  public
    { Public declarations }
  end;

const
   SQL_ORIGEM_LISTAGEM =
   ' SELECT           '+
   '   cc.cd_contrato,  '+
   '   cc.cd_tipo,      '+
   '   cc.cd_pessoa,    '+
   '   cc.nr_dia_vencimento, '+
   '   cc.cd_coligada,       '+
   '   cc.sn_ativo,          '+
   '   cc.vl_contrato,       '+
   '   p.nm_pessoa,          '+
   '   c.nm_coligada,        '+
   '   s.ds_valor            '+
   ' FROM                    '+
   '   conv_contratos cc     '+
   '   INNER JOIN pessoas p ON (p.cd_pessoa = cc.cd_pessoa)'+
   '   INNER JOIN coligadas c ON (c.cd_coligada = cc.cd_coligada)'+
   '   INNER JOIN situacoes s ON (s.cd_situacao = cc.cd_tipo AND s.cd_modulo = 2100) ' +
   ' WHERE c.cd_coligada IN ( %s ) ';

   SQL_ORIGEM_LISTAGEM_ORDENACAO =
   ' ORDER BY             '+
   '    c.nm_coligada       ';

var
  frmCadContratos: TfrmCadContratos;

implementation

uses uUsuario;

{$R *.dfm}

procedure TfrmCadContratos.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.Cadastro', npAlterar , True ) then Exit;

   Application.CreateForm(TfrmCadConvenios , frmCadConvenios);

   // seta para true para dizer que é uma insercao
   frmCadConvenios.setModoInsercao(false);
   frmCadConvenios.setContrato(qryContratoscd_contrato.AsInteger);
   frmCadConvenios.ShowModal;
   FreeAndNil(frmCadConvenios);
   filtar;

end;

procedure TfrmCadContratos.btnExcluirClick(Sender: TObject);
var
   qryContratosTurmas : TUMZQuery;
   qryContratosDeleta : TUMZQuery;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.Cadastro', npExcluir, true) then Exit;

   if(Mensagem('Deseja realmente excluir este contrato?',
               'Atenção',
               MB_YESNO+MB_ICONQUESTION ,
               Handle) = mrYes) then
   begin
      dm.CriarConsulta(qryContratosTurmas);
      DM.CriarConsulta(qryContratosDeleta);
      qryContratosTurmas.Close;
      qryContratosTurmas.SQL.Text :=  '  SELECT                          '+
                                      '    count(*) as total             '+
                                      '  FROM                            '+
                                      '     conv_contratos_turmas        '+
                                      '  WHERE                           '+
                                      '     cd_contrato = '+qryContratoscd_contrato.AsString;
      qryContratosTurmas.Open;

      if qryContratosTurmas.FieldByName('total').AsInteger = 0 then
      begin
         qryContratosDeleta.SQL.Text := 'DELETE FROM conv_anexos WHERE cd_contrato ='+qryContratoscd_contrato.AsString;
         qryContratosDeleta.ExecSQL;
         qryContratosDeleta.SQL.Text := 'DELETE FROM conv_contratos WHERE cd_contrato ='+qryContratoscd_contrato.AsString;
         qryContratosDeleta.ExecSQL;
      end
      else
      begin

         qryContratosDeleta.SQL.Text := 'UPDATE                  '+
                                        '  conv_contratos        '+
                                        'SET                     '+
                                        '  sn_ativo = 0          '+
                                        'WHERE                   '+
                                        '  cd_contrato ='+qryContratoscd_contrato.AsString;
         qryContratosDeleta.ExecSQL;
         Mensagem('O contrato foi apenas desativado ainda existem turmas vinculadas ao mesmo.',
               'Atenção',
               MB_OK+MB_ICONEXCLAMATION ,
               Handle);
      end;
   end;
   FreeAndNil(qryContratosTurmas);
   FreeAndNil(qryContratosDeleta);
   filtar;
end;

procedure TfrmCadContratos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadContratos.btnFiltrarClick(Sender: TObject);
begin
   filtar;
end;

procedure TfrmCadContratos.filtar;
begin
   qryContratos.Close;

   if cbUnidadeEnsino.ItemIndex <> 0 then
   begin
      qryContratos.SQL.Text := Format( SQL_ORIGEM_LISTAGEM, [TItemCombo(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).getCodigo()] );
   end else begin
      qryContratos.SQL.Text := Format( SQL_ORIGEM_LISTAGEM, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   end;

   if cbTipoContrato.ItemIndex <> 0 then
   begin
      qryContratos.SQL.Text := qryContratos.SQL.Text + ' AND cc.cd_tipo  = :cd_tipo ';
      qryContratos.ParamByName('cd_tipo').AsString := TItemCombo(cbTipoContrato.Items.Objects[cbTipoContrato.ItemIndex]).getCodigo();
   end;

   if cbAtivo.ItemIndex <> 0 then
   begin
      qryContratos.SQL.Text := qryContratos.SQL.Text + ' AND cc.sn_ativo = :sn_ativo ';

      if cbAtivo.ItemIndex = 1 then
      begin
         qryContratos.ParamByName('sn_ativo').AsInteger := 1;
      end else begin
         qryContratos.ParamByName('sn_ativo').AsInteger := 0;
      end;
   end;

   qryContratos.Open;
end;

procedure TfrmCadContratos.btnIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.Cadastro', npIncluir , True ) then Exit;

   Application.CreateForm(TfrmCadConvenios , frmCadConvenios);
   // seta para true para dizer que é uma insercao
   frmCadConvenios.setModoInsercao(true);
   frmCadConvenios.ShowModal;
   FreeAndNil(frmCadConvenios);

   filtar;
end;

procedure TfrmCadContratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadContratos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if( Key =  VK_F2 )then
      btnIncluir.Click
   else if Key = VK_F3 then
      btnAlterar.Click
   else if Key = VK_F9 then
      btnExcluir.Click
   else if key = VK_F12 then
      btnFechar.Click;        
end;

procedure TfrmCadContratos.FormShow(Sender: TObject);
begin
   qryUnidadeEnsino.Close;
   qryUnidadeEnsino.SQL.Text := Format('SELECT cd_coligada, nm_coligada FROM coligadas WHERE cd_coligada IN (%s)', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);
   qryUnidadeEnsino.Open;

   cbUnidadeEnsino.AddItem( 'Selecione',
      TItemCombo.Create( '-1', 'Selecione' ) );

   while not( qryUnidadeEnsino.Eof ) do
   begin
      cbUnidadeEnsino.AddItem( qryUnidadeEnsinonm_coligada.AsString ,
         TItemCombo.Create(qryUnidadeEnsinocd_coligada.AsString ,qryUnidadeEnsinonm_coligada.AsString ) );

      qryUnidadeEnsino.Next
   end;
   cbUnidadeEnsino.ItemIndex := 0;

   qryTipoContrato.Close;
   qryTipoContrato.Open;
   cbTipoContrato.AddItem(
                          'Selecione',
                          TItemCombo.Create(
                              '-1',
                              'Selecione'
                          )
                      );
   while not(qryTipoContrato.Eof) do
   begin
      cbTipoContrato.AddItem(
                                qryTipoContratods_valor.AsString,
                                TItemCombo.Create(
                                    qryTipoContratocd_situacao.AsString,
                                    qryTipoContratods_valor.AsString
                                )
                            );
      qryTipoContrato.Next;
   end;
   cbTipoContrato.ItemIndex := 0;
   cbAtivo.ItemIndex := 0;
   filtar;
end;

procedure TfrmCadContratos.qryContratosCalcFields(DataSet: TDataSet);
begin
   if qryContratossn_ativo.AsInteger <> 0 then
   begin
      qryContratosds_ativo.AsString := 'Sim';
   end
   else
   begin
      qryContratosds_ativo.AsString := 'Não';
   end;
end;

end.
