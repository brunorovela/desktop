unit UFVouchersCadastro;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
   DBCtrls, StdCtrls, Mask, UDateTimePicker, ComCtrls, Buttons, Spin, StrUtils,
   uLkJSON;

type
   TfrmVouchersCadastro = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnConfirmar: TBitBtn;
      dbeCodigo: TDBEdit;
      dbeDesconto: TDBEdit;
      dbeDescricao: TDBEdit;
      dbeFornecedor: TDBEdit;
      dbePrefixo: TDBEdit;
      dbeSufixo: TDBEdit;
      dsLote: TDataSource;
      dtpVencto: TDateTimePicker;
      lblCodigo: TLabel;
    lbDescontoP: TLabel;
      lblDescricao: TLabel;
      lblFornecedor: TLabel;
      lblPrefixo: TLabel;
      lblQuantidade: TLabel;
      lblSufixo: TLabel;
      lblVencto: TLabel;
      pnlDados: TPanel;
      qryDeleteVouchers: TUMZQuery;
      qryFornecedor: TUMZReadOnlyQuery;
      qryFornecedorCD_PESSOA: TIntegerField;
      qryFornecedorNM_PESSOA: TStringField;
      qryLote: TUMZQuery;
      qryLoteCD_FORNECEDOR: TIntegerField;
      qryLoteCD_LOTE: TLargeintField;
      qryLoteDS_LOTE: TStringField;
      qryLoteDS_PREFIXO: TStringField;
      qryLoteDS_SUFIXO: TStringField;
      qryLoteDT_VENCIMENTO: TDateField;
      qryLoteNM_FORNECEDOR: TStringField;
      qryLoteNR_QUANTIDADE: TLargeintField;
      qryLoteVL_DESCONTO: TFloatField;
      qryTotalizadores: TUMZReadOnlyQuery;
      qryTotalizadoresNR_TOTAL: TLargeintField;
      qryTotalizadoresNR_ULTIMO: TLargeintField;
      qryTotalizadoresNR_UTILIZADOS: TLargeintField;
      qryVouchers: TUMZQuery;
      qryVouchersCD_LOTE: TLargeintField;
      qryVouchersCD_PESSOA: TIntegerField;
      qryVouchersCD_VOUCHER: TLargeintField;
      qryVouchersDS_VOUCHER: TStringField;
      qryVouchersDT_VENCIMENTO: TDateField;
      qryVouchersNR_SEQUENCIAL: TLargeintField;
      qryVouchersVL_DESCONTO: TFloatField;
      sbBuscarFornecedor: TSpeedButton;
      speQuantidade: TSpinEdit;
    qryVouchersVL_DESCONTO_VISTA: TFloatField;
    qryLoteVL_DESCONTO_VISTA: TFloatField;
    dbDescontoVista: TDBEdit;
    lbDesconto: TLabel;
    cbVoucherUnico: TCheckBox;
    rbDescontoFixo: TRadioButton;
    rbDescontoPercentual: TRadioButton;
    qryLoteTP_DESCONTO: TStringField;
    qryVouchersTP_DESCONTO: TStringField;
    procedure rbDescontoFixoClick(Sender: TObject);
    procedure rbDescontoPercentualClick(Sender: TObject);
    procedure cbVoucherUnicoClick(Sender: TObject);
    procedure qryLoteVL_DESCONTO_VISTAChange(Sender: TField);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure qryLoteCD_FORNECEDORChange(Sender: TField);
      procedure qryLoteDS_LOTEChange(Sender: TField);
      procedure qryLoteVL_DESCONTOChange(Sender: TField);
      procedure sbBuscarFornecedorClick(Sender: TObject);
   private
      FJSONOldRecord: TlkJSONobject;
    procedure alternarTextos;
    procedure BloqueiaQuantidade;
      function ValidateForm: Boolean;
      procedure CreateVouchers(const Start: Integer);
      procedure UpdateVouchers;
      procedure SaveLog(const NewRecord: Boolean);
   public
      class function Insert: TModalResult;
      class function Edit(const ID: Cardinal): TModalResult;
   end;

var
   frmVouchersCadastro: TfrmVouchersCadastro;

implementation

{$R *.dfm}

uses
   uDM, uFSelecionarPessoa;

{ TfrmVouchersCadastro }

procedure TfrmVouchersCadastro.BloqueiaQuantidade();
begin

  if cbVoucherUnico.Checked then
  begin
    speQuantidade.Enabled := false;
    speQuantidade.Text := '1';
  end
  else
    speQuantidade.Enabled := true;
end;

procedure TfrmVouchersCadastro.cbVoucherUnicoClick(Sender: TObject);
begin
  BloqueiaQuantidade();
end;

procedure TfrmVouchersCadastro.CreateVouchers(const Start: Integer);
const
   SDescFmt = '%s%s%s';
   SIDFmt = '%s%u';
   SError = 'Ocorreu um erro durante o lançamento dos vouchers. Nenhum voucher foi criado.';
var
   I, Total: Integer;
   S, Prefix, Sufix, ID: AnsiString;
begin

   DM.db.StartTransaction;

   try

      qryVouchers.Close;
      qryVouchers.ParamByName('CD_LOTE').AsInteger := qryLoteCD_LOTE.AsLargeInt;
      qryVouchers.Open;

      Prefix := qryLoteDS_PREFIXO.AsString;
      Sufix := qryLoteDS_SUFIXO.AsString;
      Total := qryLoteNR_QUANTIDADE.AsLargeInt;

      for I := Start to Total do
      begin
         qryVouchers.Insert;
         qryVouchersCD_LOTE.AsLargeInt := qryLoteCD_LOTE.AsLargeInt;
         qryVouchersNR_SEQUENCIAL.AsLargeInt := I;
         qryVouchersVL_DESCONTO.AsFloat := qryLoteVL_DESCONTO.AsFloat;
         qryVouchersVL_DESCONTO_VISTA.AsFloat := qryLoteVL_DESCONTO_VISTA.AsFloat;
         qryVouchersTP_DESCONTO.AsString := qryLoteTP_DESCONTO.AsString;         
         qryVouchersDS_VOUCHER.AsString := '';

         if not qryLoteDT_VENCIMENTO.IsNull then
            qryVouchersDT_VENCIMENTO.AsDateTime := qryLoteDT_VENCIMENTO.AsDateTime;

         qryVouchers.Post;

         ID := '';

         if Total >1 then
         begin

           if qryVouchersCD_VOUCHER.AsLargeInt > 99 then
           begin
              ID := qryVouchersCD_VOUCHER.AsString;
           end;

           if qryVouchersCD_VOUCHER.AsLargeInt < 100 then
           begin
              ID := Format(SIDFmt, [StringOfChar('0', 3), qryVouchersCD_VOUCHER.AsLargeInt]);
              ID := AnsiRightStr(ID, 3);
           end;
         end;

         S := Format(SDescFmt, [Prefix, ID, Sufix]);
         qryVouchers.Edit;
         qryVouchersDS_VOUCHER.AsString := S;
         qryVouchers.Post;
      end;

      DM.db.Commit;
      
   except
   
      on E: Exception do
      begin
         DM.db.Rollback;
         MessageDlg(SError, mtError, [mbOK], -1);
      end;
      
   end;

end;

class function TfrmVouchersCadastro.Edit(const ID: Cardinal): TModalResult;
begin
   Application.CreateForm(TfrmVouchersCadastro, frmVouchersCadastro);

   frmVouchersCadastro.qryLote.Close;
   frmVouchersCadastro.qryLote.ParamByName('CD_LOTE').AsInteger := ID;
   frmVouchersCadastro.qryLote.Open;

   frmVouchersCadastro.FJSONOldRecord := DM.RecordToJSON(frmVouchersCadastro.qryLote);

   frmVouchersCadastro.qryFornecedor.Close;
   frmVouchersCadastro.qryFornecedor.ParamByName('CD_FORNECEDOR').AsInteger :=
      frmVouchersCadastro.qryLoteCD_FORNECEDOR.AsInteger;
   frmVouchersCadastro.qryFornecedor.Open;

   frmVouchersCadastro.qryLote.Refresh;
   frmVouchersCadastro.qryLote.Edit;

   if frmVouchersCadastro.qryLoteDT_VENCIMENTO.IsNull then
   begin
      frmVouchersCadastro.dtpVencto.Date := Date;
      frmVouchersCadastro.dtpVencto.Checked := False;
   end;

   frmVouchersCadastro.speQuantidade.Value := frmVouchersCadastro.qryLoteNR_QUANTIDADE.AsLargeInt;

   if not frmVouchersCadastro.qryLoteDT_VENCIMENTO.IsNull then
   begin
      frmVouchersCadastro.dtpVencto.Date := frmVouchersCadastro.qryLoteDT_VENCIMENTO.AsDateTime;
   end;

   frmVouchersCadastro.qryTotalizadores.Close;
   frmVouchersCadastro.qryTotalizadores.ParamByName('CD_LOTE').AsInteger := ID;
   frmVouchersCadastro.qryTotalizadores.Open;

   if frmVouchersCadastro.qryTotalizadoresNR_UTILIZADOS.AsLargeInt > 0 then
   begin
      frmVouchersCadastro.dbeFornecedor.ReadOnly := True;
      frmVouchersCadastro.dbeFornecedor.Color := clBtnFace;
      frmVouchersCadastro.dtpVencto.Enabled := False;
      frmVouchersCadastro.dtpVencto.Color := clBtnFace;
      frmVouchersCadastro.dbePrefixo.ReadOnly := True;
      frmVouchersCadastro.dbePrefixo.Color := clBtnFace;
      frmVouchersCadastro.dbeSufixo.ReadOnly := True;
      frmVouchersCadastro.dbeSufixo.Color := clBtnFace;
      frmVouchersCadastro.dbeDesconto.ReadOnly := True;
      frmVouchersCadastro.dbeDesconto.Color := clBtnFace;
      frmVouchersCadastro.speQuantidade.MinValue := frmVouchersCadastro.qryLoteNR_QUANTIDADE.AsInteger;
   end;
   
   frmVouchersCadastro.rbDescontoPercentual.Checked := frmVouchersCadastro.qryLoteTP_DESCONTO.AsString = 'P';
   frmVouchersCadastro.rbDescontoFixo.Checked := frmVouchersCadastro.qryLoteTP_DESCONTO.AsString = 'F';

   if frmVouchersCadastro.qryLoteNR_QUANTIDADE.AsInteger = 1 then begin
     frmVouchersCadastro.cbVoucherUnico.Checked := true;
     frmVouchersCadastro.BloqueiaQuantidade();
   end;   

   Result := frmVouchersCadastro.ShowModal;
end;

procedure TfrmVouchersCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryLote.Close;
   Action := caFree;
   frmVouchersCadastro := nil;
end;

procedure TfrmVouchersCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   SMsgCamposObrigatorios = 'Preencha todos os campos obrigatórios para salvar o registro.';
   SMsgCancelarInclusao = 'Deseja realmente cancelar a inclusão do registro de lote?';
   SMsgCancelarEdicao = 'Deseja realmente cancelar a alteração do registro de lote?';
var
   S: AnsiString;
   UserChoice: Integer;
   NewRecord: Boolean;
begin
   if ModalResult = mrOk then
   begin

      CanClose := ValidateForm;

      if CanClose then
      begin

         if dtpVencto.Checked then
            qryLoteDT_VENCIMENTO.AsDateTime := dtpVencto.Date;

         if not dtpVencto.Checked then
            qryLoteDT_VENCIMENTO.Clear;

         qryLoteNR_QUANTIDADE.AsInteger := speQuantidade.Value;

         qryLoteTP_DESCONTO.AsString := 'F';

         if rbDescontoPercentual.Checked then
            qryLoteTP_DESCONTO.AsString := 'P';


         NewRecord := qryLote.State = dsInsert;

         qryLote.Post;

         SaveLog(NewRecord);

         if NewRecord then
            CreateVouchers(1);

         if not NewRecord then
            UpdateVouchers;
         
      end;

      if not CanClose then
         MessageDlg(SMsgCamposObrigatorios, mtInformation, [mbOK], -1);

   end;

   if ModalResult <> mrOk then
   begin
      if qryLote.State = dsInsert then
         S := SMsgCancelarInclusao;

      if qryLote.State = dsEdit then
         S := SMsgCancelarEdicao;

      UserChoice := MessageDlg(S, mtConfirmation, [mbYes, mbNo], -1);

      CanClose := UserChoice = ID_YES;

      if CanClose then
         qryLote.Cancel;

   end;
end;

class function TfrmVouchersCadastro.Insert: TModalResult;
begin
   Application.CreateForm(TfrmVouchersCadastro, frmVouchersCadastro);

   frmVouchersCadastro.qryLote.Close;
   frmVouchersCadastro.qryLote.Open;
   frmVouchersCadastro.qryLote.Insert;
   frmVouchersCadastro.dtpVencto.Date := Date;
   frmVouchersCadastro.dtpVencto.Checked := False;

   Result := frmVouchersCadastro.ShowModal;
end;

procedure TfrmVouchersCadastro.qryLoteCD_FORNECEDORChange(Sender: TField);
begin
   dbeFornecedor.Color := clWindow;
end;

procedure TfrmVouchersCadastro.qryLoteDS_LOTEChange(Sender: TField);
begin
   dbeDescricao.Color := clWindow;
end;

procedure TfrmVouchersCadastro.qryLoteVL_DESCONTOChange(Sender: TField);
begin
   dbeDesconto.Color := clWindow;
end;

procedure TfrmVouchersCadastro.qryLoteVL_DESCONTO_VISTAChange(Sender: TField);
begin
   dbDescontoVista.Color := clWindow;
end;

procedure TfrmVouchersCadastro.alternarTextos();
begin
  if rbDescontoPercentual.Checked then
  begin
    lbDesconto.Caption := 'Desconto (%)';
    lbDescontoP.Caption := 'Desconto Prazo (%)'
  end
  else
  begin
    lbDesconto.Caption := 'Desconto (R$)';
    lbDescontoP.Caption := 'Desconto Prazo (R$)';
  end
end;

procedure TfrmVouchersCadastro.rbDescontoFixoClick(Sender: TObject);
begin
  alternarTextos;
end;

procedure TfrmVouchersCadastro.rbDescontoPercentualClick(Sender: TObject);
begin
  alternarTextos();
end;

procedure TfrmVouchersCadastro.SaveLog(const NewRecord: Boolean);
var
   JSON: TlkJSONobject;
   S, Operacao: AnsiString;
begin
   if NewRecord then
   begin
      JSON := DM.RecordToJSON(qryLote);
      Operacao := 'Inclusao';
   end;

   if not NewRecord then
   begin
      JSON := TlkJSONobject.Create(False);
      JSON.Add('antigo', FJSONOldRecord);
      JSON.Add('novo', DM.RecordToJSON(qryLote));
      
      Operacao := 'Alteracao';
   end;

   S := UTF8Decode(TlkJSON.GenerateText(JSON));

   DM.setLog(0, Operacao, qryLoteCD_LOTE.AsString, DM.UsuarioLogado.ColigadaLogada, S);

   FreeAndNil(JSON);
end;

procedure TfrmVouchersCadastro.sbBuscarFornecedorClick(Sender: TObject);
var
   ResultFiltro: TResultadoFiltroPessoa;
begin
   ResultFiltro := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);
   if ResultFiltro.filtrado then
   begin
      qryFornecedor.Close;
      qryFornecedor.ParamByName('CD_FORNECEDOR').AsInteger := ResultFiltro.cd_pessoa;
      qryFornecedor.Open;
      qryLoteCD_FORNECEDOR.AsInteger := ResultFiltro.cd_pessoa;
   end;
end;

procedure TfrmVouchersCadastro.UpdateVouchers;
begin
   if qryTotalizadoresNR_UTILIZADOS.AsLargeInt = 0 then
   begin
      qryDeleteVouchers.Close;
      qryDeleteVouchers.ParamByName('CD_LOTE').AsInteger := qryLoteCD_LOTE.AsLargeInt;
      qryDeleteVouchers.ExecSQL;
      CreateVouchers(1);
   end;

   if qryTotalizadoresNR_UTILIZADOS.AsLargeInt > 0 then
   begin
      CreateVouchers(qryTotalizadoresNR_ULTIMO.AsLargeInt + 1);
   end;
end;

function TfrmVouchersCadastro.ValidateForm: Boolean;
begin
   Result := True;

   if qryLoteCD_FORNECEDOR.IsNull then
   begin
      Result := False;
      dbeFornecedor.Color := clInfoBk;
   end;

   if qryLoteDS_LOTE.IsNull then
   begin
      Result := False;
      dbeDescricao.Color := clInfoBk;
   end;

   if qryLoteVL_DESCONTO.IsNull then
   begin
      Result := False;
      dbeDesconto.Color := clInfoBk;
   end;

      if qryLoteVL_DESCONTO_VISTA.IsNull then
   begin
      Result := False;
      dbDescontoVista.Color := clInfoBk;
   end;
   
end;

end.
