unit UFNFSeCad;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, StdCtrls, Buttons, Grids,
   DBGrids, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, StrUtils,
   Math, uFNFSeTitulos, xmldom, XMLIntf, msxmldom, XMLDoc, SOAPHTTPTrans,
   General, UFNFSeHist, UMDateTimePicker;

type
   TfNFSeCad = class(TFrame)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnIncluir: TToolButton;
      btnExcluir: TToolButton;
      btnSep2: TToolButton;
      btnTitulos: TToolButton;
      btnSep3: TToolButton;
      btnWebServices: TToolButton;
      btnSep4: TToolButton;
      btnFechar: TToolButton;
      btnSep5: TToolButton;
      ilImagens: TImageList;
      bvlSep2: TBevel;
      pnlFiltros: TPanel;
      pnlFiltrosTit: TPanel;
      bvlSep3: TBevel;
      rgSituacao: TRadioGroup;
      gbDataEnvio: TGroupBox;
      chkDataEnvioDe: TCheckBox;
      lblDataEnvioAte: TLabel;
      sbFiltrar: TSpeedButton;
      bvlSep4: TBevel;
      dbgLoteRps: TDBGrid;
      dsLoteRps: TDataSource;
      qryLoteRps: TUMZQuery;
      qrySituacao: TUMZReadOnlyQuery;
      btnHistorico: TToolButton;
      sbLimparFiltros: TSpeedButton;
      qryRemoveTitulos: TUMZQuery;
      qryLoteRpsNM_SITUACAO: TStringField;
      qryLoteRpsCD_LOTE: TLargeintField;
      qryLoteRpsCD_SITUACAO: TSmallintField;
      qryLoteRpsNR_LOTE: TLargeintField;
      qryLoteRpsNR_PROTOCOLO: TStringField;
      qryLoteRpsDT_RECEBIMENTO: TDateTimeField;
      qryLoteRpsDT_ENVIO: TDateTimeField;
      qryLoteRpsDT_CRIACAO: TDateTimeField;
      qryLoteRpsSN_EXCLUIDO: TSmallintField;
      qrySituacaoCD_SITUACAO: TSmallintField;
      qrySituacaoNM_SITUACAO: TStringField;
      btnReenviar: TToolButton;
    umdtEnvioInicio: TUMDateTimePicker;
    umdtEnvioFim: TUMDateTimePicker;
      procedure btnReenviarClick(Sender: TObject);
      procedure btnWebServicesClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dsLoteRpsDataChange(Sender: TObject; Field: TField);
      procedure btnHistoricoClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnTitulosClick(Sender: TObject);
      procedure qryLoteRpsAfterOpen(DataSet: TDataSet);
      procedure btnIncluirClick(Sender: TObject);
      procedure sbLimparFiltrosClick(Sender: TObject);
      procedure sbFiltrarClick(Sender: TObject);
      procedure chkDataEnvioDeClick(Sender: TObject);
   private
      function GetNextCode: Largeint;
   public
      property NexCode: Largeint read GetNextCode;
   end;

implementation

uses
   UFNFSeWS;

{$R *.dfm}

procedure TfNFSeCad.btnExcluirClick(Sender: TObject);
const
   SConfirmacao =
      'Deseja realmente exluir este lote Rps?' + #13 + 'Todos os títulos ' +
      'financeiros vinculados a este lote ficarão pendentes, ' + #13 +
      'sendo necessário reenviá-los.' + #13 + #13 + 'Deseja prosseguir?';
begin
   if Mensagem(SConfirmacao, 'Questionamento',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Handle) = ID_YES then
   begin
      qryRemoveTitulos.ParamByName('NR_NF').AsInteger := qryLoteRpsCD_LOTE.AsInteger;
      qryRemoveTitulos.ExecSQL;
      qryLoteRps.Edit;
      qryLoteRpsSN_EXCLUIDO.AsInteger := 1;
      qryLoteRps.Post;
   end;
end;

procedure TfNFSeCad.btnFecharClick(Sender: TObject);
begin
   fNFSeWS.Close;
end;

procedure TfNFSeCad.btnHistoricoClick(Sender: TObject);
begin
   TfNFSeHist.ShowLogs(Self.Owner, qryLoteRpsCD_LOTE.AsInteger);
end;

procedure TfNFSeCad.btnIncluirClick(Sender: TObject);
begin
   Visible := False;
   fNFSeWS.ShowFilter;
end;

procedure TfNFSeCad.btnReenviarClick(Sender: TObject);
const
   SFilter = 'M.NR_NF = %d';
   SConfirmacao = 'Antes de efetuar o reenvio certifique-se de que todos os ' +
      'erros foram corrigidos.' + #13 + #13 + 'Deseja prosseguir?';
   SInformacao = 'Reenvio do lote efetuado com sucesso.';
var
   Filter: string;
begin
   if Mensagem(SConfirmacao, 'Pergunta', MB_YESNO + MB_ICONQUESTION, Handle) =
      ID_YES then
   begin
      Enabled := False;
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      Filter := Format(SFilter, [qryLoteRpsCD_LOTE.AsInteger]);
      fNFSeWS.qryTitulos.Close;
      fNFSeWS.qryConsulta.Locate('CD_CONSULTA', 1, []);
      fNFSeWS.qryTitulos.SQL.Text :=
         Format(fNFSeWS.qryConsultaTX_CONSULTA.AsString, [Filter]);
      fNFSeWS.qryTitulos.Open;
      try
         fNFSeWS.Send(False);
      except
         on E: Exception do
         begin
            Screen.Cursor := crDefault;
            Application.ProcessMessages;
            Enabled := True;
            Abort;
         end;
      end;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      Enabled := True;
      Mensagem(SInformacao, 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
   end;
end;

procedure TfNFSeCad.btnTitulosClick(Sender: TObject);
begin
   TfNFSeTitulos.MostraTitulos(Self, qryLoteRpsCD_LOTE.AsInteger);
end;

procedure TfNFSeCad.btnWebServicesClick(Sender: TObject);
const
   SConfirmacao = 'Deseja efetuar a consulta da situação do lote RPS?';
   SInformacao = 'A consulta foi efetuada com sucesso. ' +
      'Acompanhe no histórico o resultado.';
begin
   if Mensagem(SConfirmacao, 'Pergunta', MB_YESNO + MB_ICONQUESTION, Handle) =
      ID_YES then
   begin
      Enabled := False;
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      try
         fNFSeWS.Query;
      except
         on E: Exception do
         begin
            Screen.Cursor := crDefault;
            Application.ProcessMessages;
            Enabled := True;
            Abort;
         end;
      end;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      Enabled := True;
      Mensagem(SInformacao, 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
   end;
end;

procedure TfNFSeCad.chkDataEnvioDeClick(Sender: TObject);
begin
   umdtEnvioInicio.Enabled := chkDataEnvioDe.Checked;
   umdtEnvioFim.Enabled := chkDataEnvioDe.Checked;
   lblDataEnvioAte.Enabled := chkDataEnvioDe.Checked;
end;

procedure TfNFSeCad.dsLoteRpsDataChange(Sender: TObject; Field: TField);
begin
   btnExcluir.Enabled := qryLoteRpsCD_SITUACAO.AsInteger in [0, 1, 3];
   btnReenviar.Enabled := qryLoteRpsCD_SITUACAO.AsInteger in [0, 3];
   btnWebServices.Enabled := not qryLoteRpsNR_PROTOCOLO.IsNull;
end;

function TfNFSeCad.GetNextCode: Largeint;
begin
   Result := 0;
   qryLoteRps.First;
   while not qryLoteRps.Eof do
   begin
      Result := Max(Result, qryLoteRpsCD_LOTE.AsInteger);
      qryLoteRps.Next;
   end;
   Result := Result + 1;
end;

procedure TfNFSeCad.qryLoteRpsAfterOpen(DataSet: TDataSet);
begin
   btnExcluir.Enabled := not qryLoteRps.IsEmpty;
   btnTitulos.Enabled := not qryLoteRps.IsEmpty;
   btnHistorico.Enabled := not qryLoteRps.IsEmpty;
end;

procedure TfNFSeCad.sbFiltrarClick(Sender: TObject);
const
   SDateTimeFormat = 'yyyy-mm-dd hh:nn:ss';
   SFiltroSituacao = 'CD_SITUACAO = %d';
   SFiltroDataEnvio = 'DT_ENVIO >= %s AND DT_ENVIO <= %s';
   SOp = ' AND ';
var
   Filtro: string;
begin
   Filtro := '';

   // Verifica a situação selecionada para definir o filtro pela situação do
   // lote RPS. Se selecionou para visualizar os lotes em todas as situações,
   // então não aplicará este filtro.
   
   if rgSituacao.ItemIndex < 4 then
   begin
      Filtro := Format(SFiltroSituacao, [rgSituacao.ItemIndex + 1]);
   end;

   // Verifica se o usuário deseja aplicar o filtro pela data de envio do lote
   // RPS através do Web Services da Nota Fiscal de Serviços Eletrônica 

   if chkDataEnvioDe.Checked then
   begin
      if Filtro <> '' then
         Filtro := Filtro + SOp;
      Filtro := Filtro + Format(SFiltroDataEnvio,
         [QuotedStr(FormatDateTime(SDateTimeFormat, umdtEnvioInicio.Date)),
          QuotedStr(FormatDateTime(SDateTimeFormat, umdtEnvioFim.Date))]);
   end;

   // Verifica se existem filtros configurados e aplica-os à Query. Se não
   // houverem filtros, exibe todos os lotes RPS cadastrados no banco de dados.

   if Filtro <> '' then
   begin
      qryLoteRps.Filter := Filtro;
      qryLoteRps.Filtered := True;
   end
   else
      qryLoteRps.Filtered := False;
end;

procedure TfNFSeCad.sbLimparFiltrosClick(Sender: TObject);
begin
   chkDataEnvioDe.Checked := False;
   rgSituacao.ItemIndex := 4;
   qryLoteRps.Filtered := False;
end;

end.
