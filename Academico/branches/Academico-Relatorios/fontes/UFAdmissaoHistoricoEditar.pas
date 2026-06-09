unit UFAdmissaoHistoricoEditar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset,
   StdCtrls, DBCtrls, UDateTimePicker, Mask, Buttons;

type
   TfrmAdmissaoHistoricoEditar = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnConfirmar: TBitBtn;
      bvlAreas: TBevel;
      dbckExtensao: TDBCheckBox;
      dbckGestao: TDBCheckBox;
      dbckGraduacaoDistancia: TDBCheckBox;
      dbckGraduacaoPresencial: TDBCheckBox;
      dbckPesquisa: TDBCheckBox;
      dbckPosDistancia: TDBCheckBox;
      dbckPosPresencial: TDBCheckBox;
      dbckSequencial: TDBCheckBox;
      dblcRegime: TDBLookupComboBox;
      dsHistorico: TDataSource;
      dtpFim: TDatePickerEx;
      dtpInicio: TDatePickerEx;
      lblAreas: TLabel;
      lblDataFim: TLabel;
      lblDataInicio: TLabel;
      lblRegime: TLabel;
      pnlDados: TPanel;
      qryAdmissao: TUMZReadOnlyQuery;
      qryAdmissaoDT_ADMISSAO: TDateField;
      qryAdmissaoDT_SAIDA: TDateField;
      qryHistorico: TUMZQuery;
      qryHistoricoAnterior: TUMZReadOnlyQuery;
      qryHistoricoAnteriorCD_REGIME: TIntegerField;
      qryHistoricoAnteriorSN_EXTENSAO: TSmallintField;
      qryHistoricoAnteriorSN_GESTAO: TSmallintField;
      qryHistoricoAnteriorSN_GRADUACAO_DISTANCIA: TSmallintField;
      qryHistoricoAnteriorSN_GRADUACAO_PRESENCIAL: TSmallintField;
      qryHistoricoAnteriorSN_PESQUISA: TSmallintField;
      qryHistoricoAnteriorSN_POS_DISTANCIA: TSmallintField;
      qryHistoricoAnteriorSN_POS_PRESENCIAL: TSmallintField;
      qryHistoricoAnteriorSN_SEQUENCIAL: TSmallintField;
      qryHistoricoCD_ADMISSAO: TLargeintField;
      qryHistoricoCD_ADMISSAO_HISTORICO: TLargeintField;
      qryHistoricoCD_REGIME: TIntegerField;
      qryHistoricoDS_REGIME: TStringField;
      qryHistoricoDT_FIM: TDateField;
      qryHistoricoDT_INICIO: TDateField;
      qryHistoricoSN_EXTENSAO: TSmallintField;
      qryHistoricoSN_GESTAO: TSmallintField;
      qryHistoricoSN_GRADUACAO_DISTANCIA: TSmallintField;
      qryHistoricoSN_GRADUACAO_PRESENCIAL: TSmallintField;
      qryHistoricoSN_PESQUISA: TSmallintField;
      qryHistoricoSN_POS_DISTANCIA: TSmallintField;
      qryHistoricoSN_POS_PRESENCIAL: TSmallintField;
      qryHistoricoSN_SEQUENCIAL: TSmallintField;
      qryInserirCampos: TUMZQuery;
      qryRegimes: TUMZReadOnlyQuery;
      qryRegimesCD_REGIME: TIntegerField;
      qryRegimesDS_REGIME: TStringField;
    procedure dtpFimSelectDate(const Value: TDate);
    procedure dtpInicioSelectDate(const Value: TDate);
    procedure dtpFimExit(Sender: TObject);
    procedure dtpInicioExit(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure qryHistoricoAfterOpen(DataSet: TDataSet);
      procedure qryHistoricoCD_REGIMEChange(Sender: TField);
   public
      procedure Insert(const AdmissaoID: UINT);
      procedure Edit(const HistoricoID: UINT);
   end;

var
   frmAdmissaoHistoricoEditar: TfrmAdmissaoHistoricoEditar;

implementation

uses
   Math;

{$R *.dfm}

procedure TfrmAdmissaoHistoricoEditar.dtpFimExit(Sender: TObject);
begin
   if dtpFim.Empty then
   begin
      if qryAdmissaoDT_SAIDA.IsNull then
         dtpInicio.MaxDate := 0;

      if not qryAdmissaoDT_SAIDA.IsNull then
         dtpInicio.MaxDate := qryAdmissaoDT_SAIDA.AsDateTime;
   end;

   if not dtpFim.Empty then
      dtpInicio.MaxDate := dtpFim.SelectedDate;
end;

procedure TfrmAdmissaoHistoricoEditar.dtpFimSelectDate(const Value: TDate);
begin
   if Value <> 0 then
      dtpInicio.MaxDate := Value;
end;

procedure TfrmAdmissaoHistoricoEditar.dtpInicioExit(Sender: TObject);
begin
   if dtpInicio.Empty then
   begin
      if qryAdmissaoDT_ADMISSAO.IsNull then
         dtpFim.MinDate := 0;

      if not qryAdmissaoDT_ADMISSAO.IsNull then
         dtpFim.MinDate := qryAdmissaoDT_ADMISSAO.AsDateTime;
   end;

   if not dtpInicio.Empty then
      dtpFim.MinDate := dtpInicio.SelectedDate;

   bbtnConfirmar.Enabled :=
      (not dtpInicio.Empty) and (not qryHistoricoCD_REGIME.IsNull);
end;

procedure TfrmAdmissaoHistoricoEditar.dtpInicioSelectDate(const Value: TDate);
begin
   if Value <> 0 then
      dtpFim.MinDate := Value;
end;

procedure TfrmAdmissaoHistoricoEditar.Edit(const HistoricoID: UINT);
begin
   bbtnConfirmar.Enabled := True;

   dtpInicio.MinDate := 0;
   dtpInicio.MaxDate := 0;
   dtpFim.MinDate := 0;
   dtpFim.MaxDate := 0;
   dtpInicio.Clear;
   dtpFim.Clear;

   qryHistorico.Close;
   qryHistorico.ParamByName('CD_ADMISSAO_HISTORICO').AsInteger := HistoricoID;
   qryHistorico.Open;
   qryHistorico.Edit;

   qryAdmissao.Close;
   qryAdmissao.ParamByName('CD_ADMISSAO').AsInteger := qryHistoricoCD_ADMISSAO.AsLargeInt;
   qryAdmissao.Open;

   dtpInicio.MinDate := qryAdmissaoDT_ADMISSAO.AsDateTime;
   dtpFim.MinDate := qryAdmissaoDT_ADMISSAO.AsDateTime;

   if not qryAdmissaoDT_SAIDA.IsNull then
   begin
      dtpInicio.MaxDate := qryAdmissaoDT_SAIDA.AsDateTime;
      dtpFim.MaxDate := qryAdmissaoDT_SAIDA.AsDateTime;
   end;
end;

procedure TfrmAdmissaoHistoricoEditar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   Inserting: Boolean; 
begin
   if ModalResult = mrOk then
   begin
      if dtpInicio.SelectedDate = 0 then
         qryHistoricoDT_INICIO.Clear;

      if dtpInicio.SelectedDate <> 0 then
         qryHistoricoDT_INICIO.AsDateTime := dtpInicio.SelectedDate;

      if dtpFim.SelectedDate = 0 then
         qryHistoricoDT_FIM.Clear;

      if dtpFim.SelectedDate <> 0 then
         qryHistoricoDT_FIM.AsDateTime := dtpFim.SelectedDate;

      Inserting := qryHistorico.State = dsInsert;

      qryHistorico.Post;

      if Inserting then
      begin
         qryInserirCampos.ParamByName('CD_ADMISSAO_HISTORICO').AsInteger := qryHistoricoCD_ADMISSAO_HISTORICO.AsLargeInt;
         qryInserirCampos.ExecSQL;
      end;
   end;

   if ModalResult = mrCancel then
      qryHistorico.Cancel;
end;

procedure TfrmAdmissaoHistoricoEditar.FormCreate(Sender: TObject);
begin
   qryRegimes.Open;
   dtpFim.Clear;
   dtpInicio.Clear;
end;

procedure TfrmAdmissaoHistoricoEditar.Insert(const AdmissaoID: UINT);
var
   FieldName: AnsiString;
   I: Integer;
   Today: TDate;
begin
   bbtnConfirmar.Enabled := False;
   
   dtpInicio.MinDate := 0;
   dtpInicio.MaxDate := 0;
   dtpFim.MinDate := 0;
   dtpFim.MaxDate := 0;
   dtpInicio.Clear;
   dtpFim.Clear;

   qryHistorico.Close;
   qryHistorico.ParamByName('CD_ADMISSAO_HISTORICO').Clear;
   qryHistorico.Open;
   qryHistorico.Insert;
   qryHistoricoCD_ADMISSAO.AsInteger := AdmissaoID;

   qryHistoricoAnterior.Close;
   qryHistoricoAnterior.ParamByName('CD_ADMISSAO').AsInteger := AdmissaoID;
   qryHistoricoAnterior.Open;

   if not qryHistoricoAnterior.IsEmpty then
   begin
      qryHistoricoCD_REGIME.AsInteger := qryHistoricoAnteriorCD_REGIME.AsInteger;
      qryHistoricoSN_SEQUENCIAL.AsInteger := qryHistoricoAnteriorSN_SEQUENCIAL.AsInteger;
      qryHistoricoSN_GRADUACAO_PRESENCIAL.AsInteger := qryHistoricoAnteriorSN_GRADUACAO_PRESENCIAL.AsInteger;
      qryHistoricoSN_GRADUACAO_DISTANCIA.AsInteger := qryHistoricoAnteriorSN_GRADUACAO_DISTANCIA.AsInteger;
      qryHistoricoSN_POS_PRESENCIAL.AsInteger := qryHistoricoAnteriorSN_POS_PRESENCIAL.AsInteger;
      qryHistoricoSN_POS_DISTANCIA.AsInteger := qryHistoricoAnteriorSN_POS_DISTANCIA.AsInteger;
      qryHistoricoSN_PESQUISA.AsInteger := qryHistoricoAnteriorSN_PESQUISA.AsInteger;
      qryHistoricoSN_EXTENSAO.AsInteger := qryHistoricoAnteriorSN_EXTENSAO.AsInteger;
      qryHistoricoSN_GESTAO.AsInteger := qryHistoricoAnteriorSN_GESTAO.AsInteger;
   end;

   qryAdmissao.Close;
   qryAdmissao.ParamByName('CD_ADMISSAO').AsInteger := AdmissaoID;
   qryAdmissao.Open;

   dtpInicio.MinDate := qryAdmissaoDT_ADMISSAO.AsDateTime;
   dtpFim.MinDate := qryAdmissaoDT_ADMISSAO.AsDateTime;

   if not qryAdmissaoDT_SAIDA.IsNull then
   begin
      dtpInicio.MaxDate := qryAdmissaoDT_SAIDA.AsDateTime;
      dtpFim.MaxDate := qryAdmissaoDT_SAIDA.AsDateTime;
   end;

   Today := Date;

   if qryAdmissaoDT_SAIDA.IsNull then
   begin
      if Today > qryAdmissaoDT_ADMISSAO.AsDateTime then
         dtpInicio.SelectedDate := Today
      else
         dtpInicio.SelectedDate := qryAdmissaoDT_ADMISSAO.AsDateTime;
   end
   else
   begin
      if Today < qryAdmissaoDT_SAIDA.AsDateTime then
         dtpInicio.SelectedDate := Today
      else
         dtpInicio.SelectedDate := qryAdmissaoDT_SAIDA.AsDateTime;
   end;
end;

procedure TfrmAdmissaoHistoricoEditar.qryHistoricoAfterOpen(DataSet: TDataSet);
begin
   if not qryHistorico.IsEmpty then
   begin
      if qryHistoricoDT_INICIO.IsNull then
         dtpInicio.Clear;

      if not qryHistoricoDT_INICIO.IsNull then
         dtpInicio.SelectedDate := qryHistoricoDT_INICIO.AsDateTime;

      if qryHistoricoDT_FIM.IsNull then
         dtpFim.Clear;

      if not qryHistoricoDT_FIM.IsNull then
         dtpFim.SelectedDate := qryHistoricoDT_FIM.AsDateTime;
   end;
end;

procedure TfrmAdmissaoHistoricoEditar.qryHistoricoCD_REGIMEChange(
  Sender: TField);
begin
   bbtnConfirmar.Enabled :=
      (not dtpInicio.Empty) and (not qryHistoricoCD_REGIME.IsNull);
end;

end.
