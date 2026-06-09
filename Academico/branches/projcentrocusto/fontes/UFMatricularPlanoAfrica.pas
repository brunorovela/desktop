unit UFMatricularPlanoAfrica;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, DBCtrls, StdCtrls,
   DBClient, Grids, DBGrids, DateUtils, ComCtrls, Buttons, Mask, ImgList, Tabs,
   MidasLib;

type
   TfMatricularPlanoAfrica = class(TFrame)
      qryPlanoPgto: TUMZReadOnlyQuery;
      pnlPlanos: TPanel;
      lblPlanoPagto: TLabel;
      dsPlanoPgto: TDataSource;
      dblcPlanoPgto: TDBLookupComboBox;
      bvlSep1: TBevel;
      qryItensPlano: TUMZReadOnlyQuery;
      qryItensPlanoCD_PLANO_ITEM: TLargeintField;
      qryItensPlanoSN_PODE_REPETIR: TSmallintField;
      qryItensPlanoCD_TIPO_TITULO: TLargeintField;
      qryItensPlanoNR_PARCELAS: TIntegerField;
      qryItensPlanoVL_PARCELA: TFloatField;
      qryItensPlanoVL_DESCONTO: TFloatField;
      qryItensPlanoDT_INICIAL: TDateTimeField;
      qryItensPlanoDT_PRIMEIRA_PARC: TDateTimeField;
      qryItensPlanoDT_SEGUNDA_PARC: TDateTimeField;
      qryItensPlanoSN_DIA_UTIL: TSmallintField;
      qryItensPlanoSN_ULTIMO_DIA_MES: TSmallintField;
      qryItensPlanoCD_CONTA: TLargeintField;
      qryItensPlanoDS_TIPO_TITULO: TStringField;
      dbgParcelas: TDBGrid;
      cdsParcelas: TClientDataSet;
      cdsParcelasCD_TIPO_TITULO: TIntegerField;
      cdsParcelasDS_TIPO_TITULO: TStringField;
      cdsParcelasNR_PARCELA: TIntegerField;
      cdsParcelasDT_VENCTO: TDateTimeField;
      cdsParcelasVL_BRUTO: TCurrencyField;
      cdsParcelasVL_DESCONTO: TCurrencyField;
      cdsParcelasVL_BOLSA: TCurrencyField;
      cdsParcelasVL_EXTRA: TCurrencyField;
      cdsParcelasCD_RESPONSAVEL: TIntegerField;
      cdsParcelasNM_RESPONSAVEL: TStringField;
      dsParcelas: TDataSource;
      qryTotDiscAnuais: TUMZReadOnlyQuery;
      qryTotDiscAnuaisNR_DISCIPLINAS: TLargeintField;
      qryResponsavel: TUMZReadOnlyQuery;
      qryResponsavelCD_PESSOA: TIntegerField;
      qryResponsavelNM_PESSOA: TStringField;
      qryResponsavelCD_RESP_FINAN: TIntegerField;
      qryResponsavelNM_RESP_FINAN: TStringField;
      bvlSep2: TBevel;
      qryItensPlanoNR_DISC_MIN: TLargeintField;
      qryItensPlanoNR_DISC_MAX: TLargeintField;
      qryPlanoPgtoCD_PLANO: TLargeintField;
      qryPlanoPgtoDS_PLANO: TStringField;
      qryPlanoPgtoNR_ANOSEMESTRE: TIntegerField;
      qryPlanoPgtoCD_TURMA: TStringField;
      qryBolsas: TUMZReadOnlyQuery;
      qryBolsasCD_BOLSA: TIntegerField;
      qryBolsasDS_BOLSA: TStringField;
      qryBolsasSN_GRATUIDADE: TSmallintField;
      qryBolsasVL_FIXO_SUGERIDO: TFloatField;
      qryBolsasVL_PERC_SUGERIDO: TFloatField;
      cdsBolsas: TClientDataSet;
      cdsBolsasCD_BOLSA: TIntegerField;
      cdsBolsasDS_BOLSA: TStringField;
      cdsBolsasVL_FIXO_SUGERIDO: TCurrencyField;
      cdsBolsasVL_PERC_SUGERIDO: TCurrencyField;
      cdsBolsasCD_RESPONSAVEL: TIntegerField;
      cdsBolsasNM_RESPONSAVEL: TStringField;
      dsBolsas: TDataSource;
      cdsBolsasNR_TIPO: TIntegerField;
      cdsBolsasSN_APLICADO: TBooleanField;
      tcBolsas: TTabControl;
      lblBolsaNome: TLabel;
      dblcTipoBolsa: TDBLookupComboBox;
      lblValorBolsa: TLabel;
      dbeValorBolsa: TDBEdit;
      lblPercBolsa: TLabel;
      dbePercBolsa: TDBEdit;
      lblRespBolsa: TLabel;
      dbeRespBolsa: TDBEdit;
      dbeNomeRespBolsa: TDBEdit;
      sbBolsaSelResp: TSpeedButton;
      lblBolsaGratuidade: TLabel;
      sbAplicarBolsa: TSpeedButton;
      cdsBolsasSN_GRATUIDADE: TBooleanField;
      cdsParcelasCD_PESSOA: TIntegerField;
      cdsParcelasCD_PARCELA: TAutoIncField;
      cdsParcelasNR_TIPO: TIntegerField;
      cdsParcelasCD_PLANO_ITEM: TIntegerField;
      qryBolsaTiposTitulo: TUMZReadOnlyQuery;
      qryBolsaTiposTituloCD_BOLSAS_TIPO_TITULOS: TIntegerField;
      qryBolsaTiposTituloCD_BOLSA: TIntegerField;
      qryBolsaTiposTituloCD_TIPO_TITULO: TIntegerField;
      qryBolsaTiposTituloCD_COLIGADA: TIntegerField;
      lblDiscGradeTit: TLabel;
      lblDiscAnuaisTit: TLabel;
      lblDiscMatTit: TLabel;
      lblDiscGrade: TLabel;
      lblDiscAnuais: TLabel;
      lblDiscMat: TLabel;
      cdsParcelasCD_CONTA: TIntegerField;
      cdsParcelasCD_BOLSA: TIntegerField;
      sbRestaurar: TSpeedButton;
      procedure sbRestaurarClick(Sender: TObject);
      procedure tcBolsasChange(Sender: TObject);
      procedure sbAplicarBolsaClick(Sender: TObject);
      procedure sbBolsaSelRespClick(Sender: TObject);
      procedure dsBolsasDataChange(Sender: TObject; Field: TField);
      procedure cdsBolsasCD_BOLSAChange(Sender: TField);
      procedure dsPlanoPgtoDataChange(Sender: TObject; Field: TField);
   private
      FPlanoSelecionado: Integer;
      function GetCodRespFinan: Integer;
      function GetNomeRespFinan: string;
      procedure AplicaDescCondicional;
      procedure AplicaBolsaGratuidade;
      procedure AplicaDivisaoTitulos;
      procedure AplicaPlanoPgto;
      procedure RemoveDescCondicional;
      procedure RemoveBolsaGratuidade;
      procedure RemoveDivisaoTitulos;
   public
      procedure Finaliza;
      procedure Inicializa;
      procedure GeraMensalidades;
   end;

implementation

uses
   UFMatricular, uFSelecionarPessoa;

{$R *.dfm}

{ TfMatricularPlanoAfrica }

procedure TfMatricularPlanoAfrica.AplicaBolsaGratuidade;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.First;
   while not cdsParcelas.Eof do
   begin
      if qryBolsaTiposTitulo.Locate('CD_BOLSA',
         cdsBolsasCD_BOLSA.AsInteger, []) then
      begin
         cdsParcelas.Edit;
         cdsParcelasVL_BOLSA.AsCurrency :=
            (cdsParcelasVL_BRUTO.AsCurrency *
             cdsBolsasVL_PERC_SUGERIDO.AsFloat / 100
            ) +
            cdsBolsasVL_FIXO_SUGERIDO.AsCurrency;
         cdsParcelasCD_BOLSA.AsInteger := cdsBolsasCD_BOLSA.AsInteger;
      end;
      cdsParcelas.Next;
   end;
   if cdsParcelas.State = dsEdit then
   begin
      cdsParcelas.Post;
   end;
   cdsParcelas.Filtered := True; 
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.AplicaDescCondicional;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.First;
   while not cdsParcelas.Eof do
   begin
      if qryBolsaTiposTitulo.Locate('CD_BOLSA',
         cdsBolsasCD_BOLSA.AsInteger, []) then
      begin
         cdsParcelas.Edit;
         cdsParcelasVL_DESCONTO.AsCurrency :=
            (cdsParcelasVL_BRUTO.AsCurrency *
             cdsBolsasVL_PERC_SUGERIDO.AsFloat / 100
            ) +
            cdsBolsasVL_FIXO_SUGERIDO.AsCurrency;
         cdsParcelasCD_BOLSA.AsInteger := cdsBolsasCD_BOLSA.AsInteger;
      end;
      cdsParcelas.Next;
   end;
   if cdsParcelas.State = dsEdit then
   begin
      cdsParcelas.Post;
   end;
   cdsParcelas.Filtered := True;
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.AplicaDivisaoTitulos;
var
   TempDataSet: TCustomClientDataSet;
begin
   cdsParcelas.DisableControls;
   
   cdsParcelas.Filter := 'NR_TIPO <> 0';
   while not cdsParcelas.IsEmpty do cdsParcelas.Delete;

   cdsParcelas.Filtered := False;

   TempDataSet := TCustomClientDataSet.Create(Self);
   try
      TempDataSet.Data := cdsParcelas.Data;
      TempDataSet.Open;

      while not TempDataSet.Eof do
      begin
         if qryBolsaTiposTitulo.Locate('CD_BOLSA',
            cdsBolsasCD_BOLSA.AsInteger, []) then
         begin
            cdsParcelas.Insert;

            cdsParcelasCD_TIPO_TITULO.AsInteger :=
               TempDataSet.FieldByName('CD_TIPO_TITULO').AsInteger;

            cdsParcelasDS_TIPO_TITULO.AsString :=
               TempDataSet.FieldByName('DS_TIPO_TITULO').AsString;

            cdsParcelasNR_PARCELA.AsInteger :=
               TempDataSet.FieldByName('NR_PARCELA').AsInteger;

            cdsParcelasDT_VENCTO.AsDateTime :=
               TempDataSet.FieldByName('DT_VENCTO').AsDateTime;

            cdsParcelasCD_PESSOA.AsInteger :=
               TempDataSet.FieldByName('CD_PESSOA').AsInteger;

            cdsParcelasNR_TIPO.AsInteger := 1;

            cdsParcelasVL_BRUTO.AsCurrency :=
               TempDataSet.FieldByName('VL_BRUTO').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency / 100 +
               cdsBolsasVL_FIXO_SUGERIDO.AsCurrency;

            cdsParcelasVL_DESCONTO.AsCurrency :=
               TempDataSet.FieldByName('VL_DESCONTO').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency / 100;

            cdsParcelasVL_BOLSA.AsCurrency :=
               TempDataSet.FieldByName('VL_BOLSA').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency / 100;

            cdsParcelasVL_EXTRA.AsCurrency :=
               TempDataSet.FieldByName('VL_EXTRA').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency /100;

            cdsParcelasCD_RESPONSAVEL.AsInteger :=
               cdsBolsasCD_RESPONSAVEL.AsInteger;
         
            cdsParcelasNM_RESPONSAVEL.AsString :=
               cdsBolsasNM_RESPONSAVEL.AsString;

            cdsParcelasCD_BOLSA.AsInteger := cdsBolsasCD_BOLSA.AsInteger;

            cdsParcelas.Insert;

            cdsParcelasCD_TIPO_TITULO.AsInteger :=
               TempDataSet.FieldByName('CD_TIPO_TITULO').AsInteger;

            cdsParcelasDS_TIPO_TITULO.AsString :=
               TempDataSet.FieldByName('DS_TIPO_TITULO').AsString;

            cdsParcelasNR_PARCELA.AsInteger :=
               TempDataSet.FieldByName('NR_PARCELA').AsInteger;

            cdsParcelasDT_VENCTO.AsDateTime :=
               TempDataSet.FieldByName('DT_VENCTO').AsDateTime;

            cdsParcelasCD_PESSOA.AsInteger :=
               TempDataSet.FieldByName('CD_PESSOA').AsInteger;

            cdsParcelasNR_TIPO.AsInteger := 2;

            cdsParcelasVL_BRUTO.AsCurrency :=
               TempDataSet.FieldByName('VL_BRUTO').AsCurrency -
               (
               TempDataSet.FieldByName('VL_BRUTO').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency / 100 +
               cdsBolsasVL_FIXO_SUGERIDO.AsCurrency
               );

            cdsParcelasVL_DESCONTO.AsCurrency :=
               TempDataSet.FieldByName('VL_DESCONTO').AsCurrency -
               (
               TempDataSet.FieldByName('VL_DESCONTO').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency / 100
               );

            cdsParcelasVL_BOLSA.AsCurrency :=
               TempDataSet.FieldByName('VL_BOLSA').AsCurrency -
               (
               TempDataSet.FieldByName('VL_BOLSA').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency / 100
               );

            cdsParcelasVL_EXTRA.AsCurrency :=
               TempDataSet.FieldByName('VL_EXTRA').AsCurrency -
               (
               TempDataSet.FieldByName('VL_EXTRA').AsCurrency *
               cdsBolsasVL_PERC_SUGERIDO.AsCurrency /100
               );

            cdsParcelasCD_RESPONSAVEL.AsInteger :=
               TempDataSet.FieldByName('CD_RESPONSAVEL').AsInteger;
            
            cdsParcelasNM_RESPONSAVEL.AsString :=
               TempDataSet.FieldByName('NM_RESPONSAVEL').AsString;

            cdsParcelasCD_BOLSA.AsInteger := cdsBolsasCD_BOLSA.AsInteger;
         end;
         
         TempDataSet.Next;
      end;
      TempDataSet.Close;

      if cdsParcelas.State = dsInsert then
         cdsParcelas.Post;

   finally
      TempDataSet.Free;
   end;

   cdsParcelas.Filtered := True;   
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.AplicaPlanoPgto;
var
   DiscSel, TotalDisc, MinDisc, MaxDisc, I: Integer;
   Vencto, VenctoPri, VenctoSeg: TDate;
   Ano, Mes, Dia: Word;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.EmptyDataSet;
   
   DiscSel := fMatricular.DiscSelecionadas;
   TotalDisc := DiscSel + qryTotDiscAnuaisNR_DISCIPLINAS.AsInteger;

   while not qryItensPlano.Eof do
   begin
      if (qryItensPlanoSN_PODE_REPETIR.AsInteger = 0) and
         cdsParcelas.Locate('CD_PLANO_ITEM', qryItensPlanoCD_PLANO_ITEM.AsInteger, []) then
      begin
         qryItensPlano.Next;
      end
      else if qryItensPlanoNR_DISC_MIN.AsInteger <= TotalDisc then
      begin
         MaxDisc := qryItensPlanoNR_DISC_MAX.AsInteger;
         MinDisc := qryItensPlanoNR_DISC_MIN.AsInteger;

         Vencto := qryItensPlanoDT_INICIAL.AsDateTime;

         if qryItensPlanoDT_PRIMEIRA_PARC.IsNull then
         begin
            VenctoPri := Vencto;
         end
         else
         begin
            VenctoPri := qryItensPlanoDT_PRIMEIRA_PARC.AsDateTime;
         end;

         if qryItensPlanoDT_SEGUNDA_PARC.IsNull then
         begin
            VenctoSeg := Vencto
         end
         else
         begin
            VenctoSeg := qryItensPlanoDT_SEGUNDA_PARC.AsDateTime;
         end;

         for I := 1 to qryItensPlanoNR_PARCELAS.AsInteger do
         begin
         
            if I > 2 then
            begin
               if qryItensPlanoSN_ULTIMO_DIA_MES.AsInteger = 1 then
               begin
                  DecodeDate(Vencto, Ano, Mes, Dia);
                  Vencto := EndOfAMonth(Ano, Mes);
               end;
               if qryItensPlanoSN_DIA_UTIL.AsInteger = 1 then
               begin
                  DecodeDate(Vencto, Ano, Mes, Dia);
                  if DayOfWeek(Vencto) = 1 then
                  begin
                     Vencto := IncDay(Vencto);
                  end;
               end;
            end;

            cdsParcelas.Insert;
            cdsParcelasCD_TIPO_TITULO.AsInteger := qryItensPlanoCD_TIPO_TITULO.AsInteger;
            cdsParcelasDS_TIPO_TITULO.AsString := qryItensPlanoDS_TIPO_TITULO.AsString;
            cdsParcelasNR_PARCELA.AsInteger := I;
            cdsParcelasVL_BRUTO.AsCurrency := qryItensPlanoVL_PARCELA.AsFloat;
            cdsParcelasVL_DESCONTO.AsCurrency := qryItensPlanoVL_DESCONTO.AsFloat;
            cdsParcelasVL_BOLSA.AsCurrency := 0;
            cdsParcelasVL_EXTRA.AsCurrency := 0;
            cdsParcelasCD_RESPONSAVEL.AsInteger := GetCodRespFinan;
            cdsParcelasNM_RESPONSAVEL.AsString := GetNomeRespFinan;
            cdsParcelasCD_PESSOA.AsInteger := fMatricular.Pessoa;
            cdsParcelasCD_PLANO_ITEM.AsInteger := qryItensPlanoCD_PLANO_ITEM.AsInteger;
            cdsParcelasNR_TIPO.AsInteger := 0;
            cdsParcelasCD_CONTA.AsInteger := qryItensPlanoCD_CONTA.AsInteger;

            case I of
               1:
                  begin
                     cdsParcelasDT_VENCTO.AsDateTime := VenctoPri;
                  end;
               2:
                  begin
                     cdsParcelasDT_VENCTO.AsDateTime := VenctoSeg;
                  end
                  else
                  begin
                     cdsParcelasDT_VENCTO.AsDateTime := Vencto;
                  end;
            end;
            cdsParcelas.Post;

            if I > 2 then
            begin
               Vencto := IncMonth(Vencto);
            end;
         end;

         qryItensPlano.Next;
         
         if not qryItensPlano.Eof then
         begin
            if MinDisc > qryItensPlanoNR_DISC_MIN.AsInteger then
            begin
               Dec(TotalDisc, MaxDisc);
            end;
         end
         else if TotalDisc > 0 then
         begin
            qryItensPlano.First;
         end;
      end
      else
      begin
         qryItensPlano.Next;
      end;
   end;
   cdsParcelas.Close;
   cdsParcelas.Open;
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.cdsBolsasCD_BOLSAChange(Sender: TField);
begin
   cdsBolsasVL_FIXO_SUGERIDO.AsCurrency := qryBolsasVL_FIXO_SUGERIDO.AsFloat;
   cdsBolsasVL_PERC_SUGERIDO.AsCurrency := qryBolsasVL_PERC_SUGERIDO.AsFloat;
   cdsBolsasSN_GRATUIDADE.AsBoolean := qryBolsasSN_GRATUIDADE.AsInteger = 1;
   sbAplicarBolsa.Enabled := not cdsBolsasCD_BOLSA.IsNull;
end;

procedure TfMatricularPlanoAfrica.dsBolsasDataChange(Sender: TObject;
  Field: TField);
begin
   lblBolsaGratuidade.Visible := qryBolsasSN_GRATUIDADE.AsInteger = 1;
   sbBolsaSelResp.Enabled := qryBolsasSN_GRATUIDADE.AsInteger = 0;
   sbAplicarBolsa.Down := cdsBolsasSN_APLICADO.AsBoolean;
   sbAplicarBolsa.Enabled := not cdsBolsasCD_BOLSA.IsNull;
end;

procedure TfMatricularPlanoAfrica.dsPlanoPgtoDataChange(Sender: TObject;
  Field: TField);
begin
   cdsBolsas.EmptyDataSet;
   if FPlanoSelecionado <> qryPlanoPgtoCD_PLANO.AsInteger then
   begin
      FPlanoSelecionado := qryPlanoPgtoCD_PLANO.AsInteger;
      AplicaPlanoPgto;
   end;
end;

procedure TfMatricularPlanoAfrica.Finaliza;
begin
   cdsBolsas.Close;
   cdsBolsas.Data := Null;
   qryBolsas.Close;
   qryItensPlano.Close;
   qryPlanoPgto.Close;
   qryTotDiscAnuais.Close;
   qryBolsaTiposTitulo.Close;
   qryResponsavel.Close;
end;

procedure TfMatricularPlanoAfrica.GeraMensalidades;
begin
   fMatricular.cdsMensalidades.DisableControls;
   fMatricular.cdsMensalidades.EmptyDataSet;

   cdsParcelas.DisableControls;
   cdsParcelas.First;

   while not cdsParcelas.Eof do
   begin
      fMatricular.cdsMensalidades.Insert;
      fMatricular.cdsMensalidadesCD_TIPO_TITULO.AsInteger :=
         cdsParcelasCD_TIPO_TITULO.AsInteger;
      fMatricular.cdsMensalidadesDS_TIPO_TITULO.AsString :=
         cdsParcelasDS_TIPO_TITULO.AsString;
      fMatricular.cdsMensalidadesNR_PARCELA.AsInteger :=
         cdsParcelasNR_PARCELA.AsInteger;
      fMatricular.cdsMensalidadesDT_VENCTO.AsDateTime :=
         cdsParcelasDT_VENCTO.AsDateTime;
      fMatricular.cdsMensalidadesVL_BRUTO.AsCurrency :=
         cdsParcelasVL_BRUTO.AsCurrency;
      fMatricular.cdsMensalidadesVL_DESCONTO.AsCurrency :=
         cdsParcelasVL_DESCONTO.AsCurrency;
      fMatricular.cdsMensalidadesVL_BOLSA.AsCurrency :=
         cdsParcelasVL_BOLSA.AsCurrency;
      fMatricular.cdsMensalidadesVL_EXTRA.AsCurrency  :=
         cdsParcelasVL_EXTRA.AsCurrency;
      fMatricular.cdsMensalidadesCD_RESPONSAVEL.AsInteger :=
         cdsParcelasCD_RESPONSAVEL.AsInteger;
      fMatricular.cdsMensalidadesNM_RESPONSAVEL.AsString :=
         cdsParcelasNM_RESPONSAVEL.AsString;
      fMatricular.cdsMensalidadesSN_CREDITO.AsString := #78;
      fMatricular.cdsMensalidadesDS_HISTORICO.AsString :=
         cdsParcelasDS_TIPO_TITULO.AsString;
      fMatricular.cdsMensalidadesCD_ITEM_PLANO.AsInteger :=
         cdsParcelasCD_PLANO_ITEM.AsInteger;
      fMatricular.cdsMensalidadesSN_PERDOAR.AsBoolean := False;
      fMatricular.cdsMensalidadesSN_RECIBO_IMP.AsBoolean := False;
      fMatricular.cdsMensalidadesNR_CREDITOS.AsFloat := 0;
      fMatricular.cdsMensalidadesCD_CONTA.AsInteger :=
         cdsParcelasCD_CONTA.AsInteger;
      fMatricular.cdsMensalidadesCD_BOLSA.AsInteger :=
         cdsParcelasCD_BOLSA.AsInteger;
      cdsParcelas.Next;
   end;

   if fMatricular.cdsMensalidades.State = dsInsert then
   begin
      fMatricular.cdsMensalidades.Post;
   end;

   cdsParcelas.EnableControls;
   fMatricular.cdsMensalidades.EnableControls;
end;

function TfMatricularPlanoAfrica.GetCodRespFinan: Integer;
begin
   if qryResponsavelCD_RESP_FINAN.AsInteger = 0 then
   begin
      Result := qryResponsavelCD_PESSOA.AsInteger;
   end
   else
   begin
      Result := qryResponsavelCD_RESP_FINAN.AsInteger;
   end;
end;

function TfMatricularPlanoAfrica.GetNomeRespFinan: string;
begin
   if qryResponsavelCD_RESP_FINAN.AsInteger = 0 then
   begin
      Result := qryResponsavelNM_PESSOA.AsString;
   end
   else
   begin
      Result := qryResponsavelNM_RESP_FINAN.AsString;
   end;
end;

procedure TfMatricularPlanoAfrica.Inicializa;
var
   DiscGrade, DiscAnuais: Integer;
begin
   FPlanoSelecionado := -1;
   qryPlanoPgto.DisableControls;

   qryBolsas.Open;
   cdsBolsas.CreateDataSet;
   cdsBolsas.Open;

   qryPlanoPgto.Open;
   qryTotDiscAnuais.Open;

   qryItensPlano.Filter := Format('NR_DISC_MIN <= %d', [fMatricular.DiscSelecionadas]);

   DiscAnuais := qryTotDiscAnuaisNR_DISCIPLINAS.AsInteger;
   DiscGrade := fMatricular.qryDisciplinasGrade.RecordCount + DiscAnuais;
   qryItensPlano.ParamByName('NR_DISC_GRADE').AsInteger := DiscGrade;
   qryItensPlano.Open;

   lblDiscGrade.Caption := Format('%d', [DiscGrade]);
   lblDiscAnuais.Caption := Format('%d', [DiscAnuais]);
   lblDiscMat.Caption := Format('%d', [fMatricular.DiscSelecionadas]);

   qryBolsaTiposTitulo.Open;
   qryResponsavel.Open;
   qryPlanoPgto.EnableControls;
   qryPlanoPgto.First;

   dblcPlanoPgto.KeyValue := qryPlanoPgtoCD_PLANO.AsInteger;
end;

procedure TfMatricularPlanoAfrica.RemoveBolsaGratuidade;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.First;
   while not cdsParcelas.Eof do
   begin
      cdsParcelas.Edit;
      cdsParcelasVL_BOLSA.AsCurrency := 0;
      cdsParcelasCD_BOLSA.Clear;
      cdsParcelas.Next;
   end;
   if cdsParcelas.State = dsEdit then
   begin
      cdsParcelas.Post;
   end;
   cdsParcelas.Filtered := True;
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.RemoveDescCondicional;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.First;
   while not cdsParcelas.Eof do
   begin
      cdsParcelas.Edit;
      cdsParcelasVL_DESCONTO.AsCurrency := 0;
      cdsParcelasCD_BOLSA.Clear;
      cdsParcelas.Next;
   end;
   if cdsParcelas.State = dsEdit then
   begin
      cdsParcelas.Post;
   end;
   cdsParcelas.Filtered := True;
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.RemoveDivisaoTitulos;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.Filter := 'NR_TIPO <> 0';
   while not cdsParcelas.IsEmpty do cdsParcelas.Delete;
   cdsParcelas.Filter := 'NR_TIPO = 0';
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlanoAfrica.sbAplicarBolsaClick(Sender: TObject);
const
   STitMsg = 'Atenção';
   SMsgSemResp = 'É necessário selecionar um responsável financeiro.';
   MsgFlags = MB_ICONWARNING or MB_OK;
begin
   if not (cdsBolsas.State in dsEditModes) then
   begin
      cdsBolsas.Edit;
   end;
   
   if not cdsBolsasSN_APLICADO.AsBoolean then
   begin
      cdsBolsasSN_APLICADO.AsBoolean := True;
      case tcBolsas.TabIndex of
         0:
            AplicaDescCondicional;
         1:
            AplicaBolsaGratuidade;
         2:
            if cdsBolsasCD_RESPONSAVEL.IsNull then
            begin
               cdsBolsasSN_APLICADO.AsBoolean := False;
               MessageBox(Handle, PChar(SMsgSemResp), PChar(STitMsg), MsgFlags);
            end
            else
               AplicaDivisaoTitulos;
      end;
   end
   else
   begin
      cdsBolsasSN_APLICADO.AsBoolean := False;
      case tcBolsas.TabIndex of
         0:
            RemoveDescCondicional;
         1:
            RemoveBolsaGratuidade;
         2:
            RemoveDivisaoTitulos;
      end;
   end;
   
   Application.ProcessMessages;
   sbAplicarBolsa.Down := cdsBolsasSN_APLICADO.AsBoolean;
end;

procedure TfMatricularPlanoAfrica.sbBolsaSelRespClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa);

   if resultado_filtro.filtrado then
   begin
      cdsBolsasCD_RESPONSAVEL.AsInteger := resultado_filtro.cd_pessoa;
      cdsBolsasNM_RESPONSAVEL.AsString := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfMatricularPlanoAfrica.sbRestaurarClick(Sender: TObject);
begin
   Finaliza;
   Inicializa;
end;

procedure TfMatricularPlanoAfrica.tcBolsasChange(Sender: TObject);
var
   Achou: Boolean;
begin
   if cdsBolsas.State in dsEditModes then
   begin
      cdsBolsas.Post;
   end;

   Achou := False;
   cdsBolsas.DisableControls;
   cdsBolsas.First;
   while not cdsBolsas.Eof do
   begin
      if cdsBolsasNR_TIPO.AsInteger = tcBolsas.TabIndex then
      begin
         Achou := True;
         Break;
      end;
      cdsBolsas.Next;
   end;

   if not Achou then
   begin
      cdsBolsas.Insert;
      cdsBolsasNR_TIPO.AsInteger := tcBolsas.TabIndex;
      cdsBolsasSN_APLICADO.AsBoolean := False;
   end;
   cdsBolsas.EnableControls;
end;

end.
