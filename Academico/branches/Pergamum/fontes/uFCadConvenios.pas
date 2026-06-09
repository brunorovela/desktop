unit uFCadConvenios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin, ImgList, DB, DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uItemCombo, uFSelecionarPessoa,
  UMEditMonetario,uDM, General;

type
  TfrmCadConvenios = class(TForm)
    pnlPrincipal: TPanel;
    pnlTopo: TPanel;
    Bevel1: TBevel;
    pnldados: TPanel;
    lblUnidade: TLabel;
    lblContrante: TLabel;
    edContratante: TEdit;
    sbBuscarContratante: TSpeedButton;
    rgTiposContratos: TRadioGroup;
    lblValorRepasse: TLabel;
    lblVencimento: TLabel;
    edVencimento: TEdit;
    lblPercent: TLabel;
    lblAnexar: TLabel;
    edAnexar: TEdit;
    sbAnexo: TSpeedButton;
    ImageList1: TImageList;
    toolAcoes: TToolBar;
    ToolButton22: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton35: TToolButton;
    chkAtivo: TCheckBox;
    qryUnidadeEnsino: TUMZQuery;
    qryUnidadeEnsinocd_coligada: TIntegerField;
    qryUnidadeEnsinonm_coligada: TStringField;
    cbUnidadeEnsino: TComboBox;
    qryConveniosCadastro: TUMZQuery;
    qryConveniosCadastrocd_contrato: TLargeintField;
    qryConveniosCadastrocd_pessoa: TLargeintField;
    qryConveniosCadastrocd_tipo: TLargeintField;
    qryConveniosCadastronr_dia_vencimento: TLargeintField;
    qryConveniosCadastrocd_coligada: TLargeintField;
    qryConveniosCadastrosn_ativo: TLargeintField;
    qryConveniosCadastrovl_contrato: TFloatField;
    opnBuscaArquivo: TOpenDialog;
    edValor: TUMEditMonetario;
    qryArquivo: TUMZQuery;
    svrArquivo: TSaveDialog;
    sbDownloadAnexo: TSpeedButton;
    edContrato: TEdit;
    lblContrato: TLabel;
    qryConveniosCadastrods_contrato: TStringField;
    qryUpdateArquivo: TUMZQuery;
    qryUpdateArquivonm_anexo: TStringField;
    qryUpdateArquivome_anexo: TMemoField;
    qryArquivocd_contrato: TIntegerField;
    qryArquivome_anexo: TMemoField;
    qryArquivonm_anexo: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbDownloadAnexoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure rgTiposContratosClick(Sender: TObject);
    procedure sbAnexoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure sbBuscarContratanteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sPath         : string;
    bModoInsercao : Boolean;
    iCodContrato  : Integer;
    bAnexar       : Boolean;
    procedure DownloadArquivo;
    procedure loadDados;
    procedure checkCamposObrigatorios;
    procedure SalvaPdf;
    procedure SalvaDados;
  public
    { Public declarations }
    function getContrato() : Integer;
    function getModoInsercao(): Boolean;
    procedure setContrato( cd_contrato : Integer );
    procedure setModoInsercao( Modo : Boolean );
  end;
const
  SQL_BUSCA_PESSOA = ' SELECT                     '+
                     '   nm_pessoa                '+
                     ' FROM                       '+
                     '   pessoas                  '+
                     ' WHERE                      '+
                     '   cd_pessoa = :cd_pessoa   ';

  SQL_GET_ANEXO_DADOS = ' SELECT                    '+
                        '    nm_anexo               '+
                        ' FROM                      '+
                        '    conv_anexos            '+
                        ' WHERE                     '+
                        '    cd_contrato = :cd_contrato';
var
  frmCadConvenios: TfrmCadConvenios;


implementation

{$R *.dfm}

procedure TfrmCadConvenios.btnCancelarClick(Sender: TObject);
begin
   qryConveniosCadastro.Cancel;
   Close;
end;

procedure TfrmCadConvenios.SalvaDados;
begin
   qryConveniosCadastrods_contrato.AsString        := edContrato.Text;
   qryConveniosCadastrocd_coligada.AsInteger       := StrToInt(TItemCombo(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).getCodigo());
   qryConveniosCadastrovl_contrato.AsFloat         := edValor.getValorDouble;
   qryConveniosCadastronr_dia_vencimento.AsInteger := StrToInt(edVencimento.Text);
   qryConveniosCadastrocd_tipo.AsInteger           := rgTiposContratos.itemIndex;
   if (chkAtivo.Checked = true) then
   begin
      qryConveniosCadastrosn_ativo.AsInteger := 1;
   end
   else
   begin
      qryConveniosCadastrosn_ativo.AsInteger := 0;
   end;
   qryConveniosCadastro.Post;
end;

procedure TfrmCadConvenios.SalvaPdf;
var
   bfArquivo         : TBlobField;
   iCodigoContrato   : Integer;
begin
   // inserindo um registro na tabela conv_anexoss
   if( getModoInsercao = true ) then
   begin
      iCodigoContrato := DM.LastInsert;
   end
   else
   begin
      iCodigoContrato := qryConveniosCadastrocd_contrato.AsInteger;
   end;

   qryArquivo.Close;
   qryArquivo.ParamByName('cd_contrato').AsInteger := iCodigoContrato;
   qryArquivo.Open;

   if qryArquivo.IsEmpty then
   begin
      qryArquivo.Insert;
      qryArquivocd_contrato.AsInteger := iCodigoContrato;
   end
   else
      qryArquivo.Edit;

   bfArquivo := TBlobField(qryArquivo.FieldByName('me_anexo'));
   bfArquivo.LoadFromFile(sPath);

   qryArquivonm_anexo.AsString     := edAnexar.Text;
   qryArquivome_anexo.AsString    := bfArquivo.AsString;
   qryArquivo.Post;


end;

procedure TfrmCadConvenios.btnSalvarClick(Sender: TObject);
begin
   toolAcoes.SetFocus;
   checkCamposObrigatorios;
   salvaDados;
   if(bAnexar = true) then
   begin
      salvaPdf;
   end;
   Close;
end;

procedure TfrmCadConvenios.DownloadArquivo;
var
   qryBaixarArquivo : TUMZQuery;
begin
   dm.CriarConsulta(qryBaixarArquivo);
   qryBaixarArquivo.SQL.Text := ' SELECT                 '+
                                '   me_anexo             '+
                                ' FROM                   '+
                                '   conv_anexos          '+
                                ' WHERE                  '+
                                '   cd_contrato ='+qryConveniosCadastrocd_contrato.AsString;
   qryBaixarArquivo.Open;
   if  svrArquivo.Execute() then
   begin
      (qryBaixarArquivo.FieldByName('me_anexo') as TBlobField).SaveToFile(svrArquivo.FileName);
   end;
end;

procedure TfrmCadConvenios.checkCamposObrigatorios();
begin
   if edValor.Text = '' then
   begin
      Mensagem( 'O campo valor de repasse é obrigatório', 'Atenção', MB_OK+MB_ICONEXCLAMATION, Handle );
      Abort;
   end;
   if rgTiposContratos.ItemIndex = -1 then
   begin
      Mensagem( 'O campo tipo de repasse é obrigatório', 'Atenção', MB_OK+MB_ICONEXCLAMATION, Handle );
      Abort;
   end;
end;

procedure TfrmCadConvenios.loadDados();
var
   qryGetNmPessoa : TUMZQuery;
   qryGetAnexo    : TUMZQuery;
begin
   // carega todos os dados menos a combo de unidades
   DM.CriarConsulta(qryGetNmPessoa);
   DM.CriarConsulta(qryGetAnexo);

   qryGetNmPessoa.Close;
   qryGetNmPessoa.SQL.Text := SQL_BUSCA_PESSOA;
   qryGetNmPessoa.ParamByName('cd_pessoa').AsInteger := qryConveniosCadastrocd_pessoa.AsInteger;
   qryGetNmPessoa.Open;

   edContratante.Text := qryGetNmPessoa.FieldByName('nm_pessoa').AsString;
   rgTiposContratos.ItemIndex :=  qryConveniosCadastrocd_tipo.AsInteger;
   edValor.Text := qryConveniosCadastrovl_contrato.AsString;
   edVencimento.Text := qryConveniosCadastronr_dia_vencimento.AsString;
   edContrato.Text   := qryConveniosCadastrods_contrato.AsString;

   qryGetAnexo.Close;
   qryGetAnexo.SQL.Text := SQL_GET_ANEXO_DADOS;
   qryGetAnexo.ParamByName('cd_contrato').AsInteger := qryConveniosCadastrocd_contrato.AsInteger;
   qryGetAnexo.Open;
   edAnexar.Text     := qryGetAnexo.FieldByName('nm_anexo').AsString;

   if qryConveniosCadastrosn_ativo.AsInteger = 1 then
   begin
      chkAtivo.Checked  := True;
   end
   else
   begin
      chkAtivo.Checked  := false;   
   end;

   if edAnexar.Text <> '' then
      sbDownloadAnexo.Visible := true
   else
      sbDownloadAnexo.Visible := false;

   FreeAndNil(qryGetNmPessoa);
   FreeAndNil(qryGetAnexo);
end;

procedure TfrmCadConvenios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_F5 then
      btnSalvar.Click
   else if Key = VK_F6 then
      btnCancelar.Click;
end;

procedure TfrmCadConvenios.FormShow(Sender: TObject);
var
   indiceCombo : Integer;
begin
   indiceCombo := 0;

   qryUnidadeEnsino.Close;
   qryUnidadeEnsino.SQL.Text := Format('SELECT cd_coligada, nm_coligada FROM coligadas WHERE cd_coligada IN (%s)', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);
   qryUnidadeEnsino.Open;
   qryUnidadeEnsino.First;

   if(getModoInsercao = true) then
   begin
      // se for uma insercao
      qryConveniosCadastro.Close;
      qryConveniosCadastro.Open;
      qryConveniosCadastro.Insert;
   end
   else
   begin
      // se for uma alteracao
      qryConveniosCadastro.Close;
      qryConveniosCadastro.ParamByName('cd_contrato').AsInteger := getContrato;
      qryConveniosCadastro.Open;
      loadDados;
      qryConveniosCadastro.Edit;
   end;

   while not(qryUnidadeEnsino.Eof) do
   begin
      cbUnidadeEnsino.AddItem(
                                 qryUnidadeEnsinonm_coligada.AsString ,
                                 TItemCombo.Create(qryUnidadeEnsinocd_coligada.AsString ,qryUnidadeEnsinonm_coligada.AsString )
                              );
      if( qryConveniosCadastrocd_coligada.AsInteger = qryUnidadeEnsinocd_coligada.AsInteger )then
      begin
         cbUnidadeEnsino.ItemIndex := indiceCombo;
      end;
      qryUnidadeEnsino.Next;
      indiceCombo := indiceCombo +1;
   end;

   bAnexar := False;
   
end;

function TfrmCadConvenios.getModoInsercao(): Boolean;
begin
   Result := bModoInsercao;
end;

procedure TfrmCadConvenios.rgTiposContratosClick(Sender: TObject);
begin
   if rgTiposContratos.ItemIndex  <> 0 then
   begin
      lblPercent.Visible := false;
   end
   else
   begin
      lblPercent.Visible := true;
   end;
end;

procedure TfrmCadConvenios.sbAnexoClick(Sender: TObject);
var
   listaPath : TStringList;
begin
   if opnBuscaArquivo.Execute then
   begin
      if opnBuscaArquivo.FileName <> '' then
      begin
         sPath := opnBuscaArquivo.FileName;

         listaPath := TStringList.Create;
         listaPath.Delimiter := '\';
         listaPath.DelimitedText := sPath;

         edAnexar.Text := listaPath.Strings[listaPath.Count -1];

         bAnexar := true;
      end;
   end;
end;

procedure TfrmCadConvenios.sbBuscarContratanteClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if (resultado_filtro.filtrado) then
   Begin
      qryConveniosCadastrocd_pessoa.AsInteger := resultado_filtro.cd_pessoa;
      edContratante.Text := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfrmCadConvenios.sbDownloadAnexoClick(Sender: TObject);
begin
   DownloadArquivo;
end;

procedure TfrmCadConvenios.setModoInsercao( Modo : Boolean );
begin
   bModoInsercao :=  Modo;
end;

function TfrmCadConvenios.getContrato() : Integer;
begin
   Result := iCodContrato;
end;

procedure TfrmCadConvenios.setContrato( cd_contrato : Integer );
begin
   iCodContrato := cd_contrato;
end;

end.
