unit UFMatricularPlanoDesconto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, Grids, DBGrids, DBClient,
   StdCtrls, DBCtrls, Buttons, Provider, UMComboBox, UFMatricularPlano,
  OleServer, OutlookXP, ImgList, ComCtrls, ToolWin;

type
   TfMatricularPlanoDesconto = class(TForm)
      qryPlanosDesconto: TUMZReadOnlyQuery;
      qryPlanosDescontoCD_PLANO: TIntegerField;
      qryPlanosDescontoDS_PLANO: TStringField;
      qryPlanosDescontoVL_PERCENTUAL: TFloatField;
      qryPlanosDescontoVL_FIXO: TFloatField;
      qryPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField;
      qryPlanosDescontoCD_TIPO_DESCONTO: TSmallintField;
      pnlParcelasOrigem: TPanel;
      pnlParcelasOrigemTit: TPanel;
      bvlSep1: TBevel;
      pnlPlanosDesconto: TPanel;
      dsPlanosDesconto: TDataSource;
      cdsParcelasPlanoDesconto: TClientDataSet;
      cdsParcelasPlanoDescontoCD_TIPO_TITULO: TIntegerField;
      cdsParcelasPlanoDescontoDS_TIPO_TITULO: TStringField;
      cdsParcelasPlanoDescontoNR_PARCELA: TIntegerField;
      cdsParcelasPlanoDescontoDT_VENCTO: TDateField;
      cdsParcelasPlanoDescontoVL_BRUTO: TCurrencyField;
      cdsParcelasPlanoDescontoVL_DESCONTO: TCurrencyField;
      cdsParcelasPlanoDescontoVL_EXTRA: TCurrencyField;
      cdsParcelasPlanoDescontoCD_RESPONSAVEL: TIntegerField;
      cdsParcelasPlanoDescontoNM_RESPONSAVEL: TStringField;
      cdsParcelasPlanoDescontoSN_DIVISIVEL: TBooleanField;
      cdsParcelasPlanoDescontoPtrItemPlano: TIntegerField;
      dsParcelasOrigem: TDataSource;
      dbgParcelasOrigem: TDBGrid;
      cdsParcelasPlanoDescontoSN_SELECIONADA: TBooleanField;
      pnlBotoes: TPanel;
      rbDescontoCondicional: TRadioButton;
      rbDescontoFixo: TRadioButton;
      cdsParcelasPlanoDescontoSN_SIMULADO: TBooleanField;
      sbSimular: TSpeedButton;
      pnlTitulo: TPanel;
      cdsParcelasPlanoDescontoCD_CONTA: TIntegerField;
      cdsPlanosDesconto: TClientDataSet;
      dspPlanosDesconto: TDataSetProvider;
      cdsPlanosDescontoCD_PLANO: TIntegerField;
      cdsPlanosDescontoDS_PLANO: TStringField;
      cdsPlanosDescontoVL_PERCENTUAL: TFloatField;
      cdsPlanosDescontoVL_FIXO: TFloatField;
      cdsPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField;
      cdsPlanosDescontoCD_TIPO_DESCONTO: TSmallintField;
      cdsParcelasPlanoDescontoCD_ACAO_MOVIMENTO: TLargeintField;
      cdsParcelasPlanoDescontoCD_DESC_CONDICIONAL: TLargeintField;
      cbTipoDesconto: TUMComboBox;
      Label1: TLabel;
      qryPlanosDescontoSN_CONDICIONAL: TSmallintField;
      cdsPlanosDescontoSN_CONDICIONAL: TSmallintField;
      cdsParcelasPlanoDescontoVL_DESC_EXTRA: TCurrencyField;
      cdsParcelasPlanoDescontoVL_CREDITO: TCurrencyField;
      cdsDescontosPlanoDesconto: TClientDataSet;
      cdsDescontosPlanoDescontoVL_DESCONTO: TCurrencyField;
      cdsDescontosPlanoDescontoCD_ACAO_MOVIMENTO: TIntegerField;
      cdsDescontosPlanoDescontoCD_TIPO_DESCONTO: TIntegerField;
      cdsDescontosPlanoDescontoCD_TIPO_COMPORTAMENTO: TIntegerField;
      cdsDescontosPlanoDescontoDS_OBSERVACAO: TStringField;
      cdsDescontosPlanoDescontoIDX_PARCELA: TIntegerField;
      cdsDescontosPlanoDescontoSN_DESCONTO_PLANO: TIntegerField;
      cdsParcelasPlanoDescontoIDX_PARCELA: TIntegerField;
      pnEsq: TPanel;
      dbgPlanosDesconto: TDBGrid;
      pnlPlanosDescontoTit: TPanel;
      pnDir: TPanel;
      Panel1: TPanel;
      dbgDescontosAplicados: TDBGrid;
      Inspectors1: TInspectors;
      Panel2: TPanel;
      ImageList1: TImageList;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      btIncluir: TBitBtn;
      cdsDescontosAplicados: TClientDataSet;
      dsDescontosAplicados: TDataSource;
      cdsDescontosAplicadosDS_PLANO_DESCONTO: TStringField;
      cdsDescontosAplicadosNR_PARCELAS_APLICADAS: TStringField;
      cdsParcelasPlanoDescontoBackup: TClientDataSet;
      cdsParcelasPlanoDescontoBackupCD_TIPO_TITULO: TIntegerField;
      cdsParcelasPlanoDescontoBackupDS_TIPO_TITULO: TStringField;
      cdsParcelasPlanoDescontoBackupNR_PARCELA: TIntegerField;
      cdsParcelasPlanoDescontoBackupDT_VENCTO: TDateField;
      cdsParcelasPlanoDescontoBackupVL_BRUTO: TCurrencyField;
      cdsParcelasPlanoDescontoBackupVL_DESCONTO: TCurrencyField;
      cdsParcelasPlanoDescontoBackupVL_EXTRA: TCurrencyField;
      cdsParcelasPlanoDescontoBackupCD_RESPONSAVEL: TIntegerField;
      cdsParcelasPlanoDescontoBackupNM_RESPONSAVEL: TStringField;
      cdsParcelasPlanoDescontoBackupSN_DIVISIVEL: TBooleanField;
      cdsParcelasPlanoDescontoBackupSN_SELECIONADA: TBooleanField;
      cdsParcelasPlanoDescontoBackupSN_SIMULADO: TBooleanField;
      cdsParcelasPlanoDescontoBackupCD_CONTA: TIntegerField;
      cdsParcelasPlanoDescontoBackupPtrItemPlano: TIntegerField;
      cdsParcelasPlanoDescontoBackupCD_ACAO_MOVIMENTO: TLargeintField;
      cdsParcelasPlanoDescontoBackupCD_DESC_CONDICIONAL: TLargeintField;
      cdsParcelasPlanoDescontoBackupVL_DESC_EXTRA: TCurrencyField;
      cdsParcelasPlanoDescontoBackupVL_CREDITO: TCurrencyField;
      cdsParcelasPlanoDescontoBackupIDX_PARCELA: TIntegerField;
      cdsDescontosPlanoDescontoBackup: TClientDataSet;
      cdsDescontosPlanoDescontoBackupVL_DESCONTO: TCurrencyField;
      cdsDescontosPlanoDescontoBackupCD_ACAO_MOVIMENTO: TIntegerField;
      cdsDescontosPlanoDescontoBackupCD_TIPO_DESCONTO: TIntegerField;
      cdsDescontosPlanoDescontoBackupCD_TIPO_COMPORTAMENTO: TIntegerField;
      cdsDescontosPlanoDescontoBackupDS_OBSERVACAO: TStringField;
      cdsDescontosPlanoDescontoBackupIDX_PARCELA: TIntegerField;
      cdsDescontosPlanoDescontoBackupSN_DESCONTO_PLANO: TIntegerField;
      procedure FormShow(Sender: TObject);
      procedure btIncluirClick(Sender: TObject);
      procedure ToolButton1Click(Sender: TObject);
      procedure cbTipoDescontoChange(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure chkManterDescPlanoClick(Sender: TObject);
      procedure dbgParcelasOrigemCellClick(Column: TColumn);
      procedure cdsPlanosDescontoVL_PERCENTUALChange(Sender: TField);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure rbDescontoFixoClick(Sender: TObject);
      procedure rbDescontoCondicionalClick(Sender: TObject);
      procedure sbSimularClick(Sender: TObject);
      procedure dsPlanosDescontoDataChange(Sender: TObject; Field: TField);
      procedure dbgParcelasOrigemTitleClick(Column: TColumn);
      procedure FormCreate(Sender: TObject);
      procedure dbgParcelasOrigemDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn;
         State: TGridDrawState);
   private
      listaParcelas : TStringList;
      procedure aplicaDescontoCondicional(valorDescontoCondicional: Currency);
      procedure aplicaDescontoFixo(valorDescontoFixo: Currency);
      procedure SimulaPlanoDesconto;
      procedure insereTituloDesconto(estaSimulando: Boolean);
      procedure salvaDescontosAtuais();
      procedure salvaMovimentacaoAtual();
      procedure recarregaDescontos();
      procedure recarregaMovimentacaoAtual();
   public
      bPlanoSelecionado : boolean;
   end;

var
   fMatricularPlanoDesconto: TfMatricularPlanoDesconto;

implementation

uses uUsuario, uDM, uFMatricular, General;

{$R *.dfm}

procedure TfMatricularPlanoDesconto.bbtnCancelarClick(Sender: TObject);
begin
   bPlanoSelecionado := false;
   while not cdsDescontosAplicados.IsEmpty do cdsDescontosAplicados.Delete;
   while not cdsParcelasPlanoDescontoBackup.IsEmpty do cdsParcelasPlanoDescontoBackup.Delete;
end;

procedure TfMatricularPlanoDesconto.bbtnConfirmarClick(Sender: TObject);
begin
   //Se tiver selecionado o simular retira o mesmo para inserir o desconto selecionado
   if sbSimular.Down then
   begin
      //Ao desativar volta a tela para o estado inicial ou alterado antes da simução
      recarregaDescontos();
      recarregaMovimentacaoAtual();
   end;

   bPlanoSelecionado := True;
end;

procedure TfMatricularPlanoDesconto.btIncluirClick(Sender: TObject);
var
   i:integer;
   modificador,parcelasSelecionadas:String;
begin

   //Se tiver selecionado o simular retira o mesmo para inserir o desconto selecionado
   if sbSimular.Down then
   begin
      //Ao desativar volta a tela para o estado inicial ou alterado antes da simução
      recarregaDescontos();
      recarregaMovimentacaoAtual();
      sbSimular.Down := false;
   end;
   insereTituloDesconto(false);
   parcelasSelecionadas := '';
   modificador := '';
   for I := 0 to self.listaParcelas.Count - 1 do
   begin
      parcelasSelecionadas := parcelasSelecionadas + modificador + self.listaParcelas.Strings[i];
      modificador := ',';
   end;
   self.listaParcelas.Clear;

   cdsDescontosAplicados.Open;
   cdsDescontosAplicados.Insert;
   cdsDescontosAplicadosDS_PLANO_DESCONTO.AsString := cdsPlanosDescontoDS_PLANO.AsString;
   cdsDescontosAplicadosNR_PARCELAS_APLICADAS.AsString := parcelasSelecionadas;
   cdsDescontosAplicados.Post;

   if not ( cdsDescontosAplicados.IsEmpty ) then
   begin
      bbtnConfirmar.Enabled := true;
   end;
end;

procedure TfMatricularPlanoDesconto.cbTipoDescontoChange(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      recarregaDescontos();
      recarregaMovimentacaoAtual();
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.cdsPlanosDescontoVL_PERCENTUALChange(
  Sender: TField);
begin
   sbSimular.Down := False;
end;

procedure TfMatricularPlanoDesconto.chkManterDescPlanoClick(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      recarregaDescontos();
      recarregaMovimentacaoAtual();
      SimulaPlanoDesconto;
   end;
end;


procedure TfMatricularPlanoDesconto.dbgParcelasOrigemCellClick(Column: TColumn);
var
   listaParcelasSelecionadas : TStringList;
var
   PG: TPoint;
   GC: TGridCoord;
   parcelaSelecionada : Integer;
   contador : Integer;
begin
   listaParcelasSelecionadas := TStringList.Create;

   PG := dbgParcelasOrigem.ScreenToClient(Mouse.CursorPos);
   GC := dbgParcelasOrigem.MouseCoord( PG.X, PG.Y ) ;

   if Column.Field.DataType = ftBoolean then
   begin
      Column.Grid.DataSource.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Grid.DataSource.DataSet.Post;

      if sbSimular.Down then
      begin

         //Guarda as parcelas selecionadas agora
         cdsParcelasPlanoDesconto.First;
         contador := 1;
         while not cdsParcelasPlanoDesconto.Eof do
         begin
            listaParcelasSelecionadas.Values[cdsParcelasPlanoDescontoIDX_PARCELA.AsString] := '-1';
            if (cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean) then
            begin
               listaParcelasSelecionadas.Values[cdsParcelasPlanoDescontoIDX_PARCELA.AsString] := cdsParcelasPlanoDescontoIDX_PARCELA.AsString;
            end;

            //Guarda a posição clicada em tela
            if(GC.Y = contador) then
            begin
               parcelaSelecionada := cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger;
            end;

            inc(contador);
            cdsParcelasPlanoDesconto.Next;
         end;

         //Retoma valores antes da simulação
         recarregaDescontos();
         recarregaMovimentacaoAtual();

         //Após recarregar os valores inicias seleciona as mesmas parcelas de antes
         cdsParcelasPlanoDesconto.First;
         while not cdsParcelasPlanoDesconto.Eof do
         begin
            cdsParcelasPlanoDesconto.Edit;
            //Seleciona se estava selecionada antes
            cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean := (listaParcelasSelecionadas.Values[cdsParcelasPlanoDescontoIDX_PARCELA.AsString] <> '-1');
            cdsParcelasPlanoDesconto.Post;
            cdsParcelasPlanoDesconto.Next;
         end;

         //Atualiza as parcelas selecionadas na query de backup
         cdsParcelasPlanoDescontoBackup.First;
         while not cdsParcelasPlanoDescontoBackup.Eof do
         begin
            cdsParcelasPlanoDescontoBackup.Edit;
            cdsParcelasPlanoDescontoBackupSN_SELECIONADA.AsBoolean := (listaParcelasSelecionadas.Values[cdsParcelasPlanoDescontoBackupIDX_PARCELA.AsString] <> '-1');
            cdsParcelasPlanoDescontoBackup.Post;
            cdsParcelasPlanoDescontoBackup.Next;
         end;

         //Simula o desconto selecionado
         SimulaPlanoDesconto;

         //Posiciona no campo selecionado anteriormente
         cdsParcelasPlanoDesconto.First;
         while not cdsParcelasPlanoDesconto.Eof do
         begin
            if (parcelaSelecionada = cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger) then
            begin
               break;
            end;
            cdsParcelasPlanoDesconto.Next;
         end;

      end;
   end;

   listaParcelasSelecionadas.Free;
end;

procedure TfMatricularPlanoDesconto.dbgParcelasOrigemDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
   IsChecked: array [Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   R: TRect;
   Checado : Integer;
begin
   if Column.FieldName = 'SN_SELECIONADA' then
   begin
      {DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);
      dbgParcelasOrigem.Canvas.FillRect(Rect);
      DrawFrameControl(dbgParcelasOrigem.Canvas.Handle, DrawRect,
         DFC_BUTTON, IsChecked[Column.Field.AsBoolean]);}

      dbgParcelasOrigem.Canvas.FillRect(Rect);

      if ( Column.Field.AsBoolean ) then
      begin
         Checado := DFCS_CHECKED
      end else begin
         Checado := 0;
      end;

      R := Rect;

      InflateRect(R, -2, -2);
      DrawFrameControl(dbgParcelasOrigem.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Checado);

      // GAMBIARRA para não aparecer a palavra "True" e "False" no lugar da CheckBox
      TStringGrid(dbgParcelasOrigem).Col := TStringGrid(dbgParcelasOrigem).Col + 1;
      TStringGrid(dbgParcelasOrigem).Col := TStringGrid(dbgParcelasOrigem).Col - 1;
   end;
end;

procedure TfMatricularPlanoDesconto.dbgParcelasOrigemTitleClick(
  Column: TColumn);
begin
   if Column.FieldName = 'SN_SELECIONADA' then
   begin
      cdsParcelasPlanoDesconto.DisableControls;
      cdsParcelasPlanoDesconto.First;
      while not cdsParcelasPlanoDesconto.Eof do
      begin
         cdsParcelasPlanoDesconto.Edit;
         cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean :=
            not cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean;
         cdsParcelasPlanoDesconto.Post;
         cdsParcelasPlanoDesconto.Next;
      end;
      cdsParcelasPlanoDesconto.EnableControls;
   end;
end;

procedure TfMatricularPlanoDesconto.dsPlanosDescontoDataChange(Sender: TObject;
  Field: TField);
begin

   // Verifica se a bolsa é para desconto condicional ou extra, marca a opção padrão na tela de aplicação de desconto
   if cdsPlanosDescontoSN_CONDICIONAL.AsInteger > 0 then
   begin
      rbDescontoCondicional.Checked := True;
      rbDescontoFixo.Checked := False;
   end else begin
      rbDescontoCondicional.Checked := False;
      rbDescontoFixo.Checked := True;
   end;

   // Define o tipo de desconto padrão selecionado
   // Se o tipo de desconto for 0 - SOMA, 1 - PROPORCIONAL e 2 - SOBREPOR
   cbTipoDesconto.ItemIndex := cdsPlanosDescontoCD_TIPO_DESCONTO.AsInteger;

   if sbSimular.Down then
   begin
      recarregaDescontos();
      recarregaMovimentacaoAtual();
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfMatricularPlanoDesconto.FormCreate(Sender: TObject);
var
   TemPermissao: Boolean;
begin
   cdsParcelasPlanoDesconto.CreateDataSet;
   cdsParcelasPlanoDesconto.Active := true;

   cdsPlanosDesconto.Active := true;
   
   TemPermissao := DM.UsuarioLogado.TemPermissao(2020, npAcesso, False);

   dbgPlanosDesconto.Columns.Items[1].ReadOnly := not TemPermissao;
   dbgPlanosDesconto.Columns.Items[2].ReadOnly := not TemPermissao;
   qryPlanosDesconto.Open;

   // Verifica se a bolsa é para desconto condicional ou extra, marca a opção padrão na tela de aplicação de desconto
   if qryPlanosDescontoSN_CONDICIONAL.AsInteger > 0 then
   begin
      rbDescontoCondicional.Checked := True;
      rbDescontoFixo.Checked := False;
   end else begin
      rbDescontoCondicional.Checked := False;
      rbDescontoFixo.Checked := True;
   end;

   // Define o tipo de desconto padrão selecionado
   // Se o tipo de desconto for 0 - SOMA, 1 - PROPORCIONAL e 2 - SOBREPOR
   cbTipoDesconto.ItemIndex := qryPlanosDescontoCD_TIPO_DESCONTO.AsInteger;
end;

procedure TfMatricularPlanoDesconto.FormShow(Sender: TObject);
begin
   self.listaParcelas := TStringList.Create;
   bbtnConfirmar.Enabled := false;
end;

procedure TfMatricularPlanoDesconto.insereTituloDesconto(estaSimulando: Boolean);
var
   valorDesconto: Currency;
begin
   cdsParcelasPlanoDesconto.DisableControls;
   cdsParcelasPlanoDesconto.Filter := 'SN_SELECIONADA';
   cdsParcelasPlanoDesconto.Filtered := True;
   cdsParcelasPlanoDesconto.First;

   while not cdsParcelasPlanoDesconto.Eof do
   begin
      cdsParcelasPlanoDesconto.Edit;

      if not estaSimulando then
      begin
         self.listaParcelas.Add(cdsParcelasPlanoDescontoNR_PARCELA.AsString);
      end;
      
      // Verifica se o desconto é valor REAL ou um PERCENTUAL
      if cdsPlanosDescontoVL_PERCENTUAL.AsCurrency > 0 then
      begin
         // Caso PERCENTUAL então cálcula o valor do desconto que será aplicado
         valorDesconto := (cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency - cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency) * (cdsPlanosDescontoVL_PERCENTUAL.AsCurrency / 100);
      end
      else
      begin
         // Caso REAL somente atribui armazena o valor do desconto
         valorDesconto := cdsPlanosDescontoVL_FIXO.AsCurrency;
      end;

      valorDesconto := RoundFloat(valorDesconto, 2);

      // Verifica se existe algum valor de desconto
      if ( valorDesconto > 0 ) then
      begin

         // Verifica se foi selecionado para aplicação de desconto como FIXO
         if rbDescontoFixo.Checked then
         begin
            aplicaDescontoFixo(valorDesconto);
         end;

         // Verifica se foi selecionado para aplicação de desconto como CONDICIONAL
         if rbDescontoCondicional.Checked then
         begin
            aplicaDescontoCondicional(valorDesconto);
         end;         

      end;

      cdsParcelasPlanoDescontoSN_SIMULADO.AsBoolean := estaSimulando;
      cdsParcelasPlanoDesconto.Post;

      cdsParcelasPlanoDesconto.Next;
   end;

   cdsParcelasPlanoDesconto.Filtered := False;
   cdsParcelasPlanoDesconto.EnableControls;
end;

procedure TfMatricularPlanoDesconto.rbDescontoCondicionalClick(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      recarregaDescontos();
      recarregaMovimentacaoAtual();
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.rbDescontoFixoClick(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      recarregaDescontos();
      recarregaMovimentacaoAtual();
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.recarregaDescontos;
begin
   cdsParcelasPlanoDesconto.DisableControls;

   //Zera tabela
   while not cdsParcelasPlanoDesconto.IsEmpty do cdsParcelasPlanoDesconto.Delete;

   cdsParcelasPlanoDescontoBackup.First;
   while not cdsParcelasPlanoDescontoBackup.Eof do
   begin
      cdsParcelasPlanoDesconto.Insert;
      cdsParcelasPlanoDescontoPtrItemPlano.AsInteger := cdsParcelasPlanoDescontoBackupPtrItemPlano.AsInteger;
      cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger := cdsParcelasPlanoDescontoBackupIDX_PARCELA.AsInteger;
      cdsParcelasPlanoDescontoCD_TIPO_TITULO.AsInteger := cdsParcelasPlanoDescontoBackupCD_TIPO_TITULO.AsInteger;
      cdsParcelasPlanoDescontoDS_TIPO_TITULO.AsString := cdsParcelasPlanoDescontoBackupDS_TIPO_TITULO.AsString;
      cdsParcelasPlanoDescontoNR_PARCELA.AsInteger := cdsParcelasPlanoDescontoBackupNR_PARCELA.AsInteger;
      cdsParcelasPlanoDescontoDT_VENCTO.AsDateTime := cdsParcelasPlanoDescontoBackupDT_VENCTO.AsDateTime;
      cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency := cdsParcelasPlanoDescontoBackupVL_BRUTO.AsCurrency;
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := cdsParcelasPlanoDescontoBackupVL_DESCONTO.AsCurrency;
      cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency := cdsParcelasPlanoDescontoBackupVL_DESC_EXTRA.AsCurrency;
      cdsParcelasPlanoDescontoVL_EXTRA.AsCurrency := cdsParcelasPlanoDescontoBackupVL_EXTRA.AsCurrency;
      cdsParcelasPlanoDescontoVL_CREDITO.AsCurrency := cdsParcelasPlanoDescontoBackupVL_CREDITO.AsCurrency;
      cdsParcelasPlanoDescontoCD_RESPONSAVEL.AsInteger := cdsParcelasPlanoDescontoBackupCD_RESPONSAVEL.AsInteger;
      cdsParcelasPlanoDescontoNM_RESPONSAVEL.AsString := cdsParcelasPlanoDescontoBackupNM_RESPONSAVEL.AsString;
      cdsParcelasPlanoDescontoSN_DIVISIVEL.AsBoolean := cdsParcelasPlanoDescontoBackupSN_DIVISIVEL.AsBoolean;
      cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean := cdsParcelasPlanoDescontoBackupSN_SELECIONADA.AsBoolean;
      cdsParcelasPlanoDescontoSN_SIMULADO.AsBoolean := cdsParcelasPlanoDescontoBackupSN_SIMULADO.AsBoolean;
      cdsParcelasPlanoDescontoCD_CONTA.AsInteger := cdsParcelasPlanoDescontoBackupCD_CONTA.AsInteger;
      cdsParcelasPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger := cdsParcelasPlanoDescontoBackupCD_ACAO_MOVIMENTO.AsInteger;
      cdsParcelasPlanoDescontoCD_DESC_CONDICIONAL.AsInteger := cdsParcelasPlanoDescontoBackupCD_DESC_CONDICIONAL.AsInteger;
      
      cdsParcelasPlanoDescontoBackup.Next;
   end;

   if cdsParcelasPlanoDesconto.State = dsInsert then
   begin
      cdsParcelasPlanoDesconto.Post;
   end;

   cdsParcelasPlanoDesconto.EnableControls;
end;

procedure TfMatricularPlanoDesconto.recarregaMovimentacaoAtual;
begin
   cdsParcelasPlanoDesconto.DisableControls;

   //Zera tabela
   while not cdsDescontosPlanoDesconto.IsEmpty do cdsDescontosPlanoDesconto.Delete;

   cdsDescontosPlanoDescontoBackup.First;
   while not cdsDescontosPlanoDescontoBackup.Eof do
   begin
      cdsDescontosPlanoDesconto.Insert;
      cdsDescontosPlanoDescontoVL_DESCONTO.AsCurrency := cdsDescontosPlanoDescontoBackupVL_DESCONTO.AsCurrency;
      cdsDescontosPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosPlanoDescontoBackupCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosPlanoDescontoCD_TIPO_DESCONTO.AsInteger := cdsDescontosPlanoDescontoBackupCD_TIPO_DESCONTO.AsInteger;
      cdsDescontosPlanoDescontoCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosPlanoDescontoBackupCD_TIPO_COMPORTAMENTO.AsInteger;
      cdsDescontosPlanoDescontoDS_OBSERVACAO.AsString := cdsDescontosPlanoDescontoBackupDS_OBSERVACAO.AsString;
      cdsDescontosPlanoDescontoIDX_PARCELA.AsInteger := cdsDescontosPlanoDescontoBackupIDX_PARCELA.AsInteger;
      cdsDescontosPlanoDescontoSN_DESCONTO_PLANO.AsInteger := cdsDescontosPlanoDescontoBackupSN_DESCONTO_PLANO.AsInteger;

      cdsDescontosPlanoDescontoBackup.Next;
   end;

   if cdsDescontosPlanoDesconto.State = dsInsert then
   begin
      cdsDescontosPlanoDesconto.Post;
   end;

   cdsParcelasPlanoDesconto.EnableControls;
end;

procedure TfMatricularPlanoDesconto.salvaDescontosAtuais;
begin
   cdsParcelasPlanoDesconto.DisableControls;

   //Zera tabela
   while not cdsParcelasPlanoDescontoBackup.IsEmpty do cdsParcelasPlanoDescontoBackup.Delete;

   cdsParcelasPlanoDesconto.First;
   while not cdsParcelasPlanoDesconto.Eof do
   begin
      cdsParcelasPlanoDescontoBackup.Insert;
      cdsParcelasPlanoDescontoBackupPtrItemPlano.AsInteger := cdsParcelasPlanoDescontoPtrItemPlano.AsInteger;
      cdsParcelasPlanoDescontoBackupIDX_PARCELA.AsInteger := cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger;
      cdsParcelasPlanoDescontoBackupCD_TIPO_TITULO.AsInteger := cdsParcelasPlanoDescontoCD_TIPO_TITULO.AsInteger;
      cdsParcelasPlanoDescontoBackupDS_TIPO_TITULO.AsString := cdsParcelasPlanoDescontoDS_TIPO_TITULO.AsString;
      cdsParcelasPlanoDescontoBackupNR_PARCELA.AsInteger := cdsParcelasPlanoDescontoNR_PARCELA.AsInteger;
      cdsParcelasPlanoDescontoBackupDT_VENCTO.AsDateTime := cdsParcelasPlanoDescontoDT_VENCTO.AsDateTime;
      cdsParcelasPlanoDescontoBackupVL_BRUTO.AsCurrency := cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency;
      cdsParcelasPlanoDescontoBackupVL_DESCONTO.AsCurrency := cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency;
      cdsParcelasPlanoDescontoBackupVL_DESC_EXTRA.AsCurrency := cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency;
      cdsParcelasPlanoDescontoBackupVL_EXTRA.AsCurrency := cdsParcelasPlanoDescontoVL_EXTRA.AsCurrency;
      cdsParcelasPlanoDescontoBackupVL_CREDITO.AsCurrency := cdsParcelasPlanoDescontoVL_CREDITO.AsCurrency;
      cdsParcelasPlanoDescontoBackupCD_RESPONSAVEL.AsInteger := cdsParcelasPlanoDescontoCD_RESPONSAVEL.AsInteger;
      cdsParcelasPlanoDescontoBackupNM_RESPONSAVEL.AsString := cdsParcelasPlanoDescontoNM_RESPONSAVEL.AsString;
      cdsParcelasPlanoDescontoBackupSN_DIVISIVEL.AsBoolean := cdsParcelasPlanoDescontoSN_DIVISIVEL.AsBoolean;
      cdsParcelasPlanoDescontoBackupSN_SELECIONADA.AsBoolean := cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean;
      cdsParcelasPlanoDescontoBackupSN_SIMULADO.AsBoolean := cdsParcelasPlanoDescontoSN_SIMULADO.AsBoolean;
      cdsParcelasPlanoDescontoBackupCD_CONTA.AsInteger := cdsParcelasPlanoDescontoCD_CONTA.AsInteger;
      cdsParcelasPlanoDescontoBackupCD_ACAO_MOVIMENTO.AsInteger := cdsParcelasPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger;
      cdsParcelasPlanoDescontoBackupCD_DESC_CONDICIONAL.AsInteger := cdsParcelasPlanoDescontoCD_DESC_CONDICIONAL.AsInteger;

      cdsParcelasPlanoDesconto.Next;
   end;

   if cdsParcelasPlanoDescontoBackup.State = dsInsert then
   begin
      cdsParcelasPlanoDescontoBackup.Post;
   end;

   cdsParcelasPlanoDesconto.EnableControls;
end;

procedure TfMatricularPlanoDesconto.salvaMovimentacaoAtual;
begin
   cdsParcelasPlanoDesconto.DisableControls;

   //Zera tabela
   while not cdsDescontosPlanoDescontoBackup.IsEmpty do cdsDescontosPlanoDescontoBackup.Delete;

   cdsDescontosPlanoDesconto.First;
   while not cdsDescontosPlanoDesconto.Eof do
   begin
      cdsDescontosPlanoDescontoBackup.Insert;
      cdsDescontosPlanoDescontoBackupVL_DESCONTO.AsCurrency := cdsDescontosPlanoDescontoVL_DESCONTO.AsCurrency;
      cdsDescontosPlanoDescontoBackupCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosPlanoDescontoBackupCD_TIPO_DESCONTO.AsInteger := cdsDescontosPlanoDescontoCD_TIPO_DESCONTO.AsInteger;
      cdsDescontosPlanoDescontoBackupCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosPlanoDescontoCD_TIPO_COMPORTAMENTO.AsInteger;
      cdsDescontosPlanoDescontoBackupDS_OBSERVACAO.AsString := cdsDescontosPlanoDescontoDS_OBSERVACAO.AsString;
      cdsDescontosPlanoDescontoBackupIDX_PARCELA.AsInteger := cdsDescontosPlanoDescontoIDX_PARCELA.AsInteger;
      cdsDescontosPlanoDescontoBackupSN_DESCONTO_PLANO.AsInteger := cdsDescontosPlanoDescontoSN_DESCONTO_PLANO.AsInteger;

      cdsDescontosPlanoDesconto.Next;
   end;

   if cdsDescontosPlanoDescontoBackup.State = dsInsert then
   begin
      cdsDescontosPlanoDescontoBackup.Post;
   end;

   cdsParcelasPlanoDesconto.EnableControls;
end;

procedure TfMatricularPlanoDesconto.sbSimularClick(Sender: TObject);
begin
   if cdsParcelasPlanoDesconto.State = dsEdit then
   begin
      cdsParcelasPlanoDesconto.Post;
   end;


   if sbSimular.Down then
   begin
      //Ao ativar a simulação reseta a lista de parcelas, antes guarda alterações numa cds auxiliar
      salvaDescontosAtuais();
      salvaMovimentacaoAtual();
      SimulaPlanoDesconto();
   end else begin
      //Ao desativar volta a tela para o estado inicial ou alterado antes da simução
      recarregaDescontos();
      recarregaMovimentacaoAtual();
   end;
end;

procedure TfMatricularPlanoDesconto.SimulaPlanoDesconto;
begin
   insereTituloDesconto(true);
end;

procedure TfMatricularPlanoDesconto.ToolButton1Click(Sender: TObject);
begin
   cdsParcelasPlanoDesconto.Post;
end;

procedure TfMatricularPlanoDesconto.aplicaDescontoFixo(valorDescontoFixo: Currency);
var
   valorDescontoAcumulado, idxPercentualPlano,
   valorTotal, diffDesconto: Currency;
begin

   // Soma o desconto fixo
   valorDescontoAcumulado := cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency + valorDescontoFixo;

   //SOMA
   if ( cbTipoDesconto.ItemIndex = TIPO_DESCONTO_SOMA ) then
   begin
      // Não faz NADA (não mexe) no desconto condicional

   //PROPORCIONAL
   end else if ( cbTipoDesconto.ItemIndex = TIPO_DESCONTO_PROPORCIONAl ) then
   begin
      // Faz o desconto proporcional do desconto condicional
      idxPercentualPlano := (cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency / (cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency-cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency));
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := (cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency - valorDescontoAcumulado) * idxPercentualPlano;

   // SOBREPOR
   end else begin
      // Zera o desconto condicional
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := 0;
   end;

   cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency, 2);

   cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency := valorDescontoAcumulado;

   // Cálcula o valor total (valor bruto + valor extra)
   valorTotal := cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency + cdsParcelasPlanoDescontoVL_EXTRA.AsCurrency;

   // Verifica se os descontos não são maiores
   diffDesconto := valorTotal - cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency;
            
   // Se o desconto fixo for menor que zero significa que o valor do desconto é maior que a mensalidade
   if ( diffDesconto <= 0 ) then
   begin
      // Desconto Extra (fixo) será o valor da mensalidade (pois não se pode descontar mais que o total da mensalidade)
      cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency := valorTotal;

      // Se o último desconto aplicado é maior que o necessário para pagar o título
      // ajusta o desconto para ser exatamente o valor que falta para pagar do título
      if (diffDesconto < 0) then
      begin
         // Subtrai a diferença do valor do desconto (deixa o desconto com o valor que falta para completar o título)
         valorDescontoFixo := valorDescontoFixo - Abs(diffDesconto);
      end;

   end;

   //Cria a acao de movimento
   if ( cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency > 0 ) then
   begin
      cdsDescontosPlanoDesconto.Open;
      cdsDescontosPlanoDesconto.Insert;
      cdsDescontosPlanoDescontoIDX_PARCELA.AsInteger := cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger;
      cdsDescontosPlanoDescontoVL_DESCONTO.AsCurrency := valorDescontoFixo;
      cdsDescontosPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger := cdsPlanosDescontoCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosPlanoDescontoCD_TIPO_DESCONTO.AsInteger := DESCONTO_FIXO;
      cdsDescontosPlanoDescontoDS_OBSERVACAO.AsString := cdsPlanosDescontoDS_PLANO.AsString;
      cdsDescontosPlanoDescontoCD_TIPO_COMPORTAMENTO.AsInteger := cbTipoDesconto.ItemIndex;
      cdsDescontosPlanoDescontoSN_DESCONTO_PLANO.AsInteger := 0;
      cdsDescontosPlanoDesconto.Post;
   end;

end;

procedure TfMatricularPlanoDesconto.aplicaDescontoCondicional(valorDescontoCondicional: Currency);
var
   idxPercentualPlano, valorTotal, diffDesconto: Currency;
begin

   //SOMA
   if ( cbTipoDesconto.ItemIndex = TIPO_DESCONTO_SOMA ) then
   begin
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency + valorDescontoCondicional;

   //PROPORCIONAL
   end else if ( cbTipoDesconto.ItemIndex = TIPO_DESCONTO_PROPORCIONAl ) then
   begin
      idxPercentualPlano := (cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency / (cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency-cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency));
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := (((cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency - cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency) - valorDescontoCondicional) * idxPercentualPlano) + valorDescontoCondicional;

   //SOBREPOR
   end else begin
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := valorDescontoCondicional;
   end;

   cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency, 2);

   // Verifica se os descontos não são maiores
   valorTotal := (cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency + cdsParcelasPlanoDescontoVL_EXTRA.AsCurrency);
   diffDesconto := (valorTotal - cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency);

   // Se o desconto fixo for menor que zero significa que o valor do desconto é maior que a mensalidade
   if ( diffDesconto < 0 ) then
   begin
      diffDesconto := 0;
   end;

   if ( cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency > diffDesconto ) then
   begin
      cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency := diffDesconto;
   end;

   cdsParcelasPlanoDescontoCD_DESC_CONDICIONAL.AsInteger := cdsPlanosDescontoCD_ACAO_MOVIMENTO.AsInteger;

   //Cria a acao de movimento
   if ( cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency > 0 ) then
   begin
      cdsDescontosPlanoDesconto.Open;
      cdsDescontosPlanoDesconto.Insert;
      cdsDescontosPlanoDescontoIDX_PARCELA.AsInteger := cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger;
      cdsDescontosPlanoDescontoVL_DESCONTO.AsCurrency := valorDescontoCondicional;
      cdsDescontosPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger := cdsPlanosDescontoCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosPlanoDescontoCD_TIPO_DESCONTO.AsInteger := DESCONTO_CONDICIONAL;
      cdsDescontosPlanoDescontoDS_OBSERVACAO.AsString := cdsPlanosDescontoDS_PLANO.AsString;
      cdsDescontosPlanoDescontoCD_TIPO_COMPORTAMENTO.AsInteger := cbTipoDesconto.ItemIndex;
      cdsDescontosPlanoDescontoSN_DESCONTO_PLANO.AsInteger := 0;
      cdsDescontosPlanoDesconto.Post;
   end;

end;

end.
