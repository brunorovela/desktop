unit uFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, uFSelecionarPessoa, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, Grids, DBGrids, uDM, ToolWin,
  ImgList, Main, DateUtils, General, ClassRegistros;

type
  TfrmFacturas = class(TForm)
    pnMain: TPanel;
    paCabecalho: TPanel;
    pnFiltro: TPanel;
    dtInicio: TDateTimePicker;
    lbFiltroData: TLabel;
    lbFiltroAluno: TLabel;
    dtFim: TDateTimePicker;
    Label1: TLabel;
    cbEmitida: TCheckBox;
    cbCancelada: TCheckBox;
    Label2: TLabel;
    edAluno: TEdit;
    btFiltrar: TButton;
    qyFacturas: TUMZQuery;
    grdFacturas: TDBGrid;
    dsFacturas: TDataSource;
    qyFacturascd_factura: TLargeintField;
    qyFacturasdt_emissao: TDateTimeField;
    qyFacturascd_pessoa: TLargeintField;
    qyFacturasvl_total: TFloatField;
    qyFacturasdt_cancelamento: TDateTimeField;
    qyFacturasnm_pessoa: TStringField;
    separador: TSplitter;
    Panel1: TPanel;
    grdFacturaItens: TDBGrid;
    qyFacturasItens: TUMZQuery;
    dsFacturaItens: TDataSource;
    qyFacturasItensparcela: TSmallintField;
    qyFacturasItensdatavencimento: TDateTimeField;
    qyFacturasItensds_tipo_titulo: TStringField;
    qyFacturascd_situacao: TLargeintField;
    toolMatricula: TToolBar;
    ToolButton2: TToolButton;
    btGerarFacturas: TToolButton;
    ToolButton12: TToolButton;
    btImprimirFacturas: TToolButton;
    btCancelarFacturas: TToolButton;
    imgFacturas: TImageList;
    ToolButton4: TToolButton;
    sbtFiltraAluno: TSpeedButton;
    btFechar: TToolButton;
    ToolButton1: TToolButton;
    qyFacturasItensvl_item: TFloatField;
    qyFacturasItensds_situacao: TStringField;
    qyFacturasds_descricao: TStringField;
    qyFacturasItenscd_factura: TLargeintField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirFacturasClick(Sender: TObject);
    procedure btCancelarFacturasClick(Sender: TObject);
    procedure btGerarFacturasClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure dsFacturasDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure sbtFiltraAlunoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FcdPessoa: Integer;
    FnmPessoa: String;
    procedure SetnmPessoa(const Value: String);
    procedure SetcdPessoa(const Value: Integer);
    property cdPessoa: Integer read FcdPessoa write SetcdPessoa;
    property nmPessoa: String read FnmPessoa write SetnmPessoa;
  public
    { Public declarations }
  end;

var
  frmFacturas: TfrmFacturas;

implementation

uses
  uFacturasGerar;

{$R *.dfm}

procedure TfrmFacturas.btCancelarFacturasClick(Sender: TObject);
var
  qyFac           : TUMZQuery;
  qyFacItens      : TUMZQuery;
  qyMensalidades  : TUMZQuery;
  cd_factura      : Integer;
  ds_mensalidades : string;
  cd_situacao     : integer;
begin
   cd_factura     := qyFacturascd_factura.AsInteger;
   cd_situacao    := qyFacturascd_situacao.AsInteger;
   if (cd_situacao <> 2) and (cd_situacao <> 3) then
   begin

   if cd_factura <> 0 then
   begin

      if not (Mensagem('Deseja realmente cancelar a Factura ?', '', MB_YESNO + MB_ICONQUESTION, Handle) = IDYES ) then
      exit;

      DM.CriarConsulta( qyFac );

      //cancelar factura ( 2 - CANCELAMENTO MANUAL )
      qyFac.SQL.Text := 'UPDATE fin_facturas SET cd_situacao = 2, dt_cancelamento = NOW() WHERE cd_factura = :cd_factura';
      qyFac.ParamByName('cd_factura').AsInteger := cd_factura;
      qyFac.ExecSQL;

      //busca todas as mensalidades que pertenciam à factura cancelada
      DM.CriarConsulta( qyFacItens );
      qyFacItens.SQL.Text := 'SELECT GROUP_CONCAT(cd_mensalidade) as ds_mensalidades FROM fin_facturas_itens WHERE cd_factura = :cd_factura';
      qyFacItens.ParamByName('cd_factura').AsInteger := cd_factura;
      qyFacItens.Open;

      ds_mensalidades := qyFacItens.FieldByName('ds_mensalidades').AsString;

      //atualiza para que as mensalidade fiquem disponiveis para outra factura
      DM.CriarConsulta( qyMensalidades );
      qyMensalidades.SQL.Text := 'UPDATE mensalidades SET nr_nf = NULL, sn_nfe_gerada = 0 WHERE cd_mensalidade in('+ds_mensalidades+')';
      qyMensalidades.ExecSQL;

      FreeAndNil( qyFac );
      FreeAndNil( qyFacItens );
      FreeAndNil( qyMensalidades );

      qyFacturas.Refresh;
   end;
   end
   else
   begin
      Mensagem('A Factura Selecionada já está Cancelada', 'Aviso', MB_OK + MB_ICONINFORMATION );
   end;
end;

procedure TfrmFacturas.btGerarFacturasClick(Sender: TObject);
begin
   if Self.cdPessoa = 0 then
   begin
      Mensagem( 'Por favor, Selecione um Aluno.', 'Aviso', MB_OK + MB_ICONWARNING );
      exit;
   end;

   Application.CreateForm(TfrmFacturasGerar, frmFacturasGerar);

   if Self.cdPessoa <> 0 then
   begin
      frmFacturasGerar.SetcdPessoa(self.cdPessoa);
      frmFacturasGerar.SetnmPessoa(self.nmPessoa);

      frmFacturasGerar.edAluno.Text    := self.edAluno.Text;
      frmFacturasGerar.dtInicio.DateTime   := Self.dtInicio.DateTime;
      frmFacturasGerar.dtFinal.DateTime    := Self.dtFim.DateTime;
   end;

   frmFacturasGerar.ShowModal;
   Self.btFiltrar.Click;
end;

procedure TfrmFacturas.btImprimirFacturasClick(Sender: TObject);
var
   filtro          : String;
   sNomeRelatorio  : String;
   PodeExportar    : Boolean;
   infoRelatorio   : ClasseRegistros;
begin
   filtro      := '';
   filtro      := filtro + '{fin_facturas.cd_pessoa} = ' + IntToStr(Self.cdPessoa);

   if dtInicio.Time < dtFim.Time then
   begin
      filtro   := filtro + ' AND ( ToText( {fin_facturas.dt_emissao}, "yyyyMMdd") >= ' + QuotedStr(FormatDateTime('yyyyMMdd', dtInicio.DateTime));
      filtro   := filtro + ' AND ToText( {fin_facturas.dt_emissao}, "yyyyMMdd") <= ' + QuotedStr(FormatDateTime('yyyyMMdd', dtFim.DateTime)) + ' )';
   end
   else
   begin
      if dtInicio.Time > dtFim.Time then
      begin
         Mensagem( 'O período selecionado não é válido.', 'Aviso', MB_OK + MB_ICONWARNING );
         exit;
      end;
   end;

   if cbEmitida.Checked and cbCancelada.Checked then
   begin
      filtro := filtro + 'AND fs.cd_factura_situacao IN ( 1, 2, 3 ) ';
   end
   else if cbEmitida.Checked then
   begin
      filtro := filtro + 'AND fs.cd_factura_situacao IN ( 1 ) ';
   end
   else
   begin
      if cbCancelada.Checked then
      begin
         filtro := filtro + 'AND fs.cd_factura_situacao IN ( 2, 3 ) ';
      end;
   end;

   infoRelatorio  := PrincipalForm.GetInfoRpt('repFactura');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';
   PodeExportar   := True;
   
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
   begin
      PodeExportar := False;
   end;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, filtro, '', nil, nil, nil, nil, True, False, nil, PodeExportar);
end;

procedure TfrmFacturas.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFacturas.btFiltrarClick(Sender: TObject);
begin
   if Self.cdPessoa = 0 then
   begin
      Mensagem( 'Por favor, Selecione um Aluno.', 'Aviso', MB_OK + MB_ICONWARNING );
      exit;
   end;

   if dtInicio.Time > dtFim.Time then
   begin
      Mensagem( 'O período selecionado não é válido.', 'Aviso', MB_OK + MB_ICONWARNING );
      exit;
   end;

   qyFacturas.Close();
   qyFacturasItens.Close();

   qyFacturas.SQL.Text := 'SELECT ';
   qyFacturas.SQL.Add('	fs.ds_descricao, ');
   qyFacturas.SQL.Add('	ff.*, ');
   qyFacturas.SQL.Add('	p.nm_pessoa ');
   qyFacturas.SQL.Add('FROM ');
   qyFacturas.SQL.Add('	fin_facturas ff ');
   qyFacturas.SQL.Add(' INNER JOIN fin_facturas_situacoes fs ON (fs.cd_factura_situacao = ff.cd_situacao) ');
   qyFacturas.SQL.Add(' INNER JOIN pessoas p ON (p.cd_pessoa = ff.cd_pessoa) ');
   qyFacturas.SQL.Add('WHERE ');
   qyFacturas.SQL.Add(' p.cd_pessoa = :cd_pessoa ');
   qyFacturas.SQL.Add(' AND ( ff.dt_emissao >= :dt_inicio AND ff.dt_emissao <= :dt_fim) ');

   qyFacturas.ParamByName('cd_pessoa').AsInteger   := Self.cdPessoa;
   qyFacturas.ParamByName('dt_inicio').AsString    := FormatDateTime('yyyy-mm-dd', dtInicio.DateTime)+' 00:00:00';
   qyFacturas.ParamByName('dt_fim').AsString       := FormatDateTime('yyyy-mm-dd', dtFim.DateTime)+' 23:59:59';


   if cbEmitida.Checked and cbCancelada.Checked then
   begin
      qyFacturas.SQL.Add('AND fs.cd_factura_situacao IN ( 1, 2, 3 ) ');
   end
   else if cbEmitida.Checked then
   begin
      qyFacturas.SQL.Add('AND fs.cd_factura_situacao IN ( 1 ) ' );
   end
   else
   begin
      if cbCancelada.Checked then
      begin
         qyFacturas.SQL.Add('AND fs.cd_factura_situacao IN ( 2, 3 ) ');
      end;
   end;
   qyFacturas.SQL.Add(' ORDER BY ff.cd_factura ');
   qyFacturas.Open();
   qyFacturasItens.Open();
end;

procedure TfrmFacturas.dsFacturasDataChange(Sender: TObject; Field: TField);
var
   cd_situacao : integer;
begin
   cd_situacao := qyFacturascd_situacao.AsInteger;
   btCancelarFacturas.Enabled := ( (cd_situacao <> 2) and (cd_situacao <> 3) );
end;

procedure TfrmFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFacturas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F12: Close;
  end;
end;

procedure TfrmFacturas.FormShow(Sender: TObject);
begin
  pnFiltro.SetFocus;
  dtInicio.DateTime := StrToDate ( '01/' + FormatDateTime ( 'mm/yyyy',  Date ) );;
  dtFim.DateTime    := Date;
end;

procedure TfrmFacturas.SetcdPessoa(const Value: Integer);
begin
  FcdPessoa := Value;
end;

procedure TfrmFacturas.SetnmPessoa(const Value: String);
begin
  FnmPessoa := Value;
end;

procedure TfrmFacturas.sbtFiltraAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
    edAluno.Text := IntToStr( resultado_filtro.cd_pessoa ) + ' - ' + resultado_filtro.nm_pessoa;

    self.SetnmPessoa(resultado_filtro.nm_pessoa);
    self.SetcdPessoa(resultado_filtro.cd_pessoa);
   end;

   btFiltrar.Click;
end;

end.
