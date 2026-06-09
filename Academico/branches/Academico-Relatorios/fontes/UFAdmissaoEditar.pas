unit UFAdmissaoEditar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
   DBCtrls, StdCtrls, Mask, UDateTimePicker, Buttons;

type
   TfrmAdmissaoEditar = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnConfirmar: TBitBtn;
      dbeCodigo: TDBEdit;
      dbeHorasSemanais: TDBEdit;
      dbeObservacao: TDBEdit;
      dblcFuncao: TDBLookupComboBox;
      dblcSituacao: TDBLookupComboBox;
      dsAdmissao: TDataSource;
      dtpAdmissao: TDatePickerEx;
      dtpSaida: TDatePickerEx;
      lblCodigo: TLabel;
      lblDataAdmissao: TLabel;
      lblDataSaida: TLabel;
      lblFuncao: TLabel;
      lblHorasSemanais: TLabel;
      lblObservacao: TLabel;
      lblSituacao: TLabel;
      pnlDados: TPanel;
      qryAdmissao: TUMZQuery;
      qryAdmissaoCD_ADMISSAO: TLargeintField;
      qryAdmissaoCD_FUNCAO: TSmallintField;
      qryAdmissaoCD_PESSOA: TIntegerField;
      qryAdmissaoCD_SITUACAO: TIntegerField;
      qryAdmissaoDS_CODIGO_EXTERNO: TStringField;
      qryAdmissaoDS_FUNCAO: TStringField;
      qryAdmissaoDS_OBSERVACAO: TStringField;
      qryAdmissaoDS_SITUACAO: TStringField;
      qryAdmissaoDT_ADMISSAO: TDateField;
      qryAdmissaoDT_SAIDA: TDateField;
      qryAdmissaoVL_HORAS_SEMANAIS: TFloatField;
      qryHistorico: TUMZReadOnlyQuery;
      qryHistoricoDT_FIM: TDateField;
      qryHistoricoDT_INICIO: TDateField;
      qryOcupacoes: TUMZReadOnlyQuery;
      qryOcupacoesCD_FUNCAO: TSmallintField;
      qryOcupacoesDS_FUNCAO: TStringField;
      qrySituacoes: TUMZReadOnlyQuery;
      qrySituacoesCD_SITUACAO: TIntegerField;
      qrySituacoesDS_VALOR: TStringField;
      procedure dtpAdmissaoExit(Sender: TObject);
      procedure dtpAdmissaoSelectDate(const Value: TDate);
      procedure dtpSaidaExit(Sender: TObject);
      procedure dtpSaidaSelectDate(const Value: TDate);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure qryAdmissaoAfterOpen(DataSet: TDataSet);
      procedure qryAdmissaoCD_FUNCAOChange(Sender: TField);
      procedure qryAdmissaoCD_SITUACAOChange(Sender: TField);
   public
      procedure Insert(const PessoaID: UINT);
      procedure Edit(const AdmissaoID: UINT);
   end;

var
   frmAdmissaoEditar: TfrmAdmissaoEditar;

implementation

uses
   Math;

{$R *.dfm}

procedure TfrmAdmissaoEditar.dtpAdmissaoExit(Sender: TObject);
begin
   bbtnConfirmar.Enabled :=
      (not dtpAdmissao.Empty) and
      (not qryAdmissaoCD_FUNCAO.IsNull) and
      (not qryAdmissaoCD_SITUACAO.IsNull);

   if dtpAdmissao.Empty then
      dtpSaida.MinDate := 0;

   if not dtpAdmissao.Empty then
      dtpSaida.MinDate := dtpAdmissao.SelectedDate;
end;

procedure TfrmAdmissaoEditar.dtpAdmissaoSelectDate(const Value: TDate);
begin
   dtpSaida.MinDate := Value;
end;

procedure TfrmAdmissaoEditar.dtpSaidaExit(Sender: TObject);
begin
   if dtpSaida.Empty then
      dtpAdmissao.MaxDate := 0;

   if not dtpSaida.Empty then
      dtpAdmissao.MaxDate := dtpSaida.SelectedDate;
end;

procedure TfrmAdmissaoEditar.dtpSaidaSelectDate(const Value: TDate);
begin
   dtpAdmissao.MaxDate := Value;
end;

procedure TfrmAdmissaoEditar.Edit(const AdmissaoID: UINT);
begin
   bbtnConfirmar.Enabled := True;

   dtpAdmissao.Clear;
   dtpSaida.Clear;
   dtpAdmissao.MinDate := 0;
   dtpAdmissao.MaxDate := 0;
   dtpSaida.MinDate := 0;
   dtpSaida.MaxDate := 0;

   qryAdmissao.Close;
   qryAdmissao.ParamByName('CD_ADMISSAO').AsInteger := AdmissaoID;
   qryAdmissao.Open;
   qryAdmissao.Edit;

   qryHistorico.Close;
   qryHistorico.Open;

   if not qryHistorico.IsEmpty then
   begin
      if not qryHistoricoDT_INICIO.IsNull then
         dtpAdmissao.MaxDate := qryHistoricoDT_INICIO.AsDateTime;

      if not qryHistoricoDT_FIM.IsNull then
         dtpSaida.MinDate := qryHistoricoDT_FIM.AsDateTime;
   end;
end;

procedure TfrmAdmissaoEditar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOk then
   begin
      if dtpAdmissao.SelectedDate = 0 then
         qryAdmissaoDT_ADMISSAO.Clear;

      if dtpAdmissao.SelectedDate <> 0 then
         qryAdmissaoDT_ADMISSAO.AsDateTime := dtpAdmissao.SelectedDate;

      if dtpSaida.SelectedDate = 0 then
         qryAdmissaoDT_SAIDA.Clear;

      if dtpSaida.SelectedDate <> 0 then
         qryAdmissaoDT_SAIDA.AsDateTime := dtpSaida.SelectedDate;

      qryAdmissao.Post;
   end;

   if ModalResult = mrCancel then
      qryAdmissao.Cancel;
end;

procedure TfrmAdmissaoEditar.FormCreate(Sender: TObject);
begin
   qryOcupacoes.Open;
   qrySituacoes.Open;
end;

procedure TfrmAdmissaoEditar.Insert(const PessoaID: UINT);
begin
   bbtnConfirmar.Enabled := False;

   dtpAdmissao.MinDate := 0;
   dtpAdmissao.MaxDate := 0;
   dtpSaida.MinDate := 0;
   dtpSaida.MaxDate := 0;
   dtpAdmissao.Clear;
   dtpSaida.Clear;

   qryAdmissao.Close;
   qryAdmissao.ParamByName('CD_ADMISSAO').Clear;
   qryAdmissao.Open;
   qryAdmissao.Insert;
   qryAdmissaoCD_PESSOA.AsInteger := PessoaID;
end;

procedure TfrmAdmissaoEditar.qryAdmissaoAfterOpen(DataSet: TDataSet);
begin
   if qryAdmissao.IsEmpty then
   begin
      dtpAdmissao.SelectedDate := Date;
      dtpSaida.Clear;
   end;

   if not qryAdmissao.IsEmpty then
   begin
      if qryAdmissaoDT_ADMISSAO.IsNull then
         dtpAdmissao.Clear;

      if not qryAdmissaoDT_ADMISSAO.IsNull then
         dtpAdmissao.SelectedDate := qryAdmissaoDT_ADMISSAO.AsDateTime;

      if qryAdmissaoDT_SAIDA.IsNull then
         dtpSaida.Clear;

      if not qryAdmissaoDT_SAIDA.IsNull then
         dtpSaida.SelectedDate := qryAdmissaoDT_SAIDA.AsDateTime;
   end;
end;

procedure TfrmAdmissaoEditar.qryAdmissaoCD_FUNCAOChange(Sender: TField);
begin
   bbtnConfirmar.Enabled :=
      (not dtpAdmissao.Empty) and
      (not qryAdmissaoCD_FUNCAO.IsNull) and
      (not qryAdmissaoCD_SITUACAO.IsNull);
end;

procedure TfrmAdmissaoEditar.qryAdmissaoCD_SITUACAOChange(Sender: TField);
begin
   bbtnConfirmar.Enabled :=
      (not dtpAdmissao.Empty) and
      (not qryAdmissaoCD_FUNCAO.IsNull) and
      (not qryAdmissaoCD_SITUACAO.IsNull);
end;

end.
