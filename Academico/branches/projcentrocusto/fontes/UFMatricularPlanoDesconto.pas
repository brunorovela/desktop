unit UFMatricularPlanoDesconto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, Grids, DBGrids, DBClient,
   StdCtrls, DBCtrls, Buttons, Provider, UMComboBox, UFMatricularPlano;

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
      pnlPlanosDescontoTit: TPanel;
      dsPlanosDesconto: TDataSource;
      dbgPlanosDesconto: TDBGrid;
      cdsParcelasOrigem: TClientDataSet;
      cdsParcelasOrigemCD_TIPO_TITULO: TIntegerField;
      cdsParcelasOrigemDS_TIPO_TITULO: TStringField;
      cdsParcelasOrigemNR_PARCELA: TIntegerField;
      cdsParcelasOrigemDT_VENCTO: TDateField;
      cdsParcelasOrigemVL_BRUTO: TCurrencyField;
      cdsParcelasOrigemVL_DESCONTO: TCurrencyField;
      cdsParcelasOrigemVL_BOLSA: TCurrencyField;
      cdsParcelasOrigemVL_EXTRA: TCurrencyField;
      cdsParcelasOrigemCD_RESPONSAVEL: TIntegerField;
      cdsParcelasOrigemNM_RESPONSAVEL: TStringField;
      cdsParcelasOrigemSN_DIVISIVEL: TBooleanField;
      cdsParcelasOrigemPtrItemPlano: TIntegerField;
      dsParcelasOrigem: TDataSource;
      dbgParcelasOrigem: TDBGrid;
      cdsParcelasOrigemSN_SELECIONADA: TBooleanField;
      pnlBotoes: TPanel;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      rbDescontoCondicional: TRadioButton;
      rbDescontoFixo: TRadioButton;
      cdsParcelasOrigemSN_SIMULADO: TBooleanField;
      sbSimular: TSpeedButton;
      pnlTitulo: TPanel;
      cdsParcelasOrigemCD_CONTA: TIntegerField;
    cdsPlanosDesconto: TClientDataSet;
    dspPlanosDesconto: TDataSetProvider;
    cdsPlanosDescontoCD_PLANO: TIntegerField;
    cdsPlanosDescontoDS_PLANO: TStringField;
    cdsPlanosDescontoVL_PERCENTUAL: TFloatField;
    cdsPlanosDescontoVL_FIXO: TFloatField;
    cdsPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField;
    cdsPlanosDescontoCD_TIPO_DESCONTO: TSmallintField;
    cdsParcelasOrigemCD_ACAO_MOVIMENTO: TLargeintField;
    cdsParcelasOrigemCD_DESC_CONDICIONAL: TLargeintField;
    cbTipoDesconto: TUMComboBox;
    Label1: TLabel;
    qryPlanosDescontoSN_CONDICIONAL: TSmallintField;
    cdsPlanosDescontoSN_CONDICIONAL: TSmallintField;
    cdsParcelasOrigemVL_DESC_EXTRA: TCurrencyField;
    procedure cbTipoDescontoChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkManterDescPlanoClick(Sender: TObject);
    procedure dbgParcelasOrigemCellClick(Column: TColumn);
    procedure cdsPlanosDescontoVL_PERCENTUALChange(Sender: TField);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
      procedure SimulaPlanoDesconto;
   public
      bPlanoSelecionado : boolean;
   end;

var
   fMatricularPlanoDesconto: TfMatricularPlanoDesconto;

implementation

uses uUsuario, uDM, uFMatricular;

{$R *.dfm}

procedure TfMatricularPlanoDesconto.bbtnCancelarClick(Sender: TObject);
begin
   bPlanoSelecionado := false;
end;

procedure TfMatricularPlanoDesconto.bbtnConfirmarClick(Sender: TObject);
begin
   bPlanoSelecionado := True;
end;

procedure TfMatricularPlanoDesconto.cbTipoDescontoChange(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      fMatricular.FrmPlanoBrasil.CarregaTitulosDesconto;
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
      fMatricular.FrmPlanoBrasil.CarregaTitulosDesconto;
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.dbgParcelasOrigemCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Grid.DataSource.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Grid.DataSource.DataSet.Post;
   end;
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
      cdsParcelasOrigem.DisableControls;
      cdsParcelasOrigem.First;
      while not cdsParcelasOrigem.Eof do
      begin
         cdsParcelasOrigem.Edit;
         cdsParcelasOrigemSN_SELECIONADA.AsBoolean :=
            not cdsParcelasOrigemSN_SELECIONADA.AsBoolean;
         cdsParcelasOrigem.Post;
         cdsParcelasOrigem.Next;
      end;
      cdsParcelasOrigem.EnableControls;
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
      fMatricular.FrmPlanoBrasil.CarregaTitulosDesconto;
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfMatricularPlanoDesconto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOk then
   begin
      if not sbSimular.Down then
      begin
         SimulaPlanoDesconto;
      end;
   end;
end;

procedure TfMatricularPlanoDesconto.FormCreate(Sender: TObject);
var
   TemPermissao: Boolean;
begin
   cdsParcelasOrigem.CreateDataSet;
   cdsParcelasOrigem.Active := true;

   cdsPlanosDesconto.Active := true;

   TemPermissao := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Alunos.Matricula.Matricular.PlanoDesconto', npAlterar, False);

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

procedure TfMatricularPlanoDesconto.rbDescontoCondicionalClick(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      fMatricular.FrmPlanoBrasil.CarregaTitulosDesconto;
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.rbDescontoFixoClick(Sender: TObject);
begin
   if sbSimular.Down then
   begin
      fMatricular.FrmPlanoBrasil.CarregaTitulosDesconto;
      SimulaPlanoDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.sbSimularClick(Sender: TObject);
begin
   if cdsParcelasOrigem.State = dsEdit then
   begin
      cdsParcelasOrigem.Post;
   end;

   if sbSimular.Down then
   begin
      SimulaPlanoDesconto;
   end
   else
   begin
      fMatricular.FrmPlanoBrasil.CarregaTitulosDesconto;
   end;
end;

procedure TfMatricularPlanoDesconto.SimulaPlanoDesconto;
var
   ValorDesconto, Indice, ValorTotal: Currency;
begin
   cdsParcelasOrigem.DisableControls;
   cdsParcelasOrigem.Filter := 'SN_SELECIONADA';
   cdsParcelasOrigem.Filtered := True;
   cdsParcelasOrigem.First;

   while not cdsParcelasOrigem.Eof do
   begin

      cdsParcelasOrigem.Edit;

      // Verifica se o desconto é valor REAL ou um PERCENTUAL
      if cdsPlanosDescontoVL_PERCENTUAL.AsCurrency > 0 then
      begin
         // Caso PERCENTUAL então cálcula o valor do desconto que será aplicado
         ValorDesconto := (
            cdsParcelasOrigemVL_BRUTO.AsCurrency -
            cdsParcelasOrigemVL_DESC_EXTRA.AsCurrency) *
            cdsPlanosDescontoVL_PERCENTUAL.AsCurrency / 100;
      end
      else
      begin
         // Caso REAL somente atribui armazena o valor do desconto
         ValorDesconto := cdsPlanosDescontoVL_FIXO.AsCurrency;
      end;

      // Verifica se o desconto é FIXO ou CONDICIONAL:

      // CONDICIONAL - coluna VALORDESCONTO na tabela de MENSALIDADES
      if rbDescontoCondicional.Checked then
      begin

         // Grava o código da ação de movimento para desconto condicional
         cdsParcelasOrigemCD_DESC_CONDICIONAL.AsInteger := cdsPlanosDescontoCD_ACAO_MOVIMENTO.AsInteger;

         // Verifica o tipo de desconto a ser utilizado:
         // 0 - Soma
         // 1 - Proporcional
         // 2 - Sobrepor
         case cbTipoDesconto.ItemIndex of

            0:
               // Aplica o desconto condicional programado utilizando a
               // forma de aplicação do tipo soma, ou seja, mantém o
               // desconto condicional pré-definido no plano de pagamento
               // e adiciona o desconto condicional programado para esta
               // pessoa

                  cdsParcelasOrigemVL_DESCONTO.AsCurrency :=
                     cdsParcelasOrigemVL_DESCONTO.AsCurrency + ValorDesconto;

            1:
               // Aplica o desconto condicional de forma proporcional ao
               // desconto condicional aplicado à parcela conforme o plano
               // de pagamento selecionado

               begin
                  Indice :=
                     cdsParcelasOrigemVL_DESCONTO.AsCurrency /
                     cdsParcelasOrigemVL_BRUTO.AsCurrency;

                  ValorDesconto :=
                     (cdsParcelasOrigemVL_BRUTO.AsCurrency - ValorDesconto) *
                        Indice + ValorDesconto;

                  cdsParcelasOrigemVL_DESCONTO.AsCurrency := ValorDesconto;
               end;

            2:
               // Aplica o desconto condicional programado na forma de
               // sobreposição ao desconto condicional cadastrado no
               // plano de pagamento selecionado no processo de
               // matrícula da pessoa

               cdsParcelasOrigemVL_DESCONTO.AsCurrency := ValorDesconto;
         end;

         // Verifica se os descontos ultrapassam o valor da parcela
         if (cdsParcelasOrigemVL_BRUTO.AsCurrency +
             cdsParcelasOrigemVL_EXTRA.AsCurrency -
             cdsParcelasOrigemVL_DESC_EXTRA.AsCurrency) < ValorDesconto then
         begin
            // Se os descontos ultrapassarem o valor da parcela ajusta
            // para que o desconto condicional somente complete o valor da parcela
            cdsParcelasOrigemVL_DESCONTO.AsCurrency :=
               cdsParcelasOrigemVL_BRUTO.AsCurrency +
               cdsParcelasOrigemVL_EXTRA.AsCurrency -
               cdsParcelasOrigemVL_DESC_EXTRA.AsCurrency
         end;
      end
      else
      // FIXO - coluna DESCONTOEXTRA na tabela de MENSALIDADES
      if rbDescontoFixo.Checked then
      begin

         // Grava o código da ação de movimento para desconto fixo
         cdsParcelasOrigemCD_ACAO_MOVIMENTO.AsInteger := cdsPlanosDescontoCD_ACAO_MOVIMENTO.AsInteger;

         // O desconto fixo sempre é somado ao desconto que já existe
         cdsParcelasOrigemVL_BOLSA.AsCurrency :=
            cdsParcelasOrigemVL_DESC_EXTRA.AsCurrency +
            ValorDesconto;

         // Verifica o tipo de desconto a ser utilizado, esses tipos de desconto
         // influenciam somente no desconto condicional (e não no fixo):
         // 0 - Soma (Não modifica o desconto condicional)
         // 1 - Proporcional (Reajusta o valor do desconto condicional de forma proporcional)
         // 2 - Sobrepor (Zera o desconto condicional)
         case cbTipoDesconto.ItemIndex of
            0: ; // Não modifica o desconto condicional
            1:
               // Reajusta o valor do desconto condicional (proporcionalmente)
               begin
                  Indice :=
                     cdsParcelasOrigemVL_DESCONTO.AsCurrency /
                     cdsParcelasOrigemVL_BRUTO.AsCurrency;

                  ValorDesconto := (
                     cdsParcelasOrigemVL_BRUTO.AsCurrency -
                     cdsParcelasOrigemVL_BOLSA.AsCurrency) * Indice;

                  cdsParcelasOrigemVL_DESCONTO.AsCurrency := ValorDesconto;
               end; 
            2:
               // Remove o desconto condicional
               cdsParcelasOrigemVL_DESCONTO.AsCurrency := 0;
         end;

         //////////////////////////////////////////
         // TRATAMENTO PARA QUANDO OS DESCONTOS
         // ULTRAPASSAM O VALOR DA PARCELA
         //////////////////////////////////////////

         // Cálcula o valor total da parcela
         ValorTotal :=
            cdsParcelasOrigemVL_BRUTO.AsCurrency +
            cdsParcelasOrigemVL_EXTRA.AsCurrency;

         // Verifica se o valor de desconto FIXO é maior que o valor total da parcela
         if ValorTotal < cdsParcelasOrigemVL_BOLSA.AsCurrency then
         begin
            // Se desconto FIXO é maior que valor da parcela, altera o valor de desconto FIXO para ser igual o valor da parcela
            cdsParcelasOrigemVL_BOLSA.AsCurrency :=
               cdsParcelasOrigemVL_BRUTO.AsCurrency +
               cdsParcelasOrigemVL_EXTRA.AsCurrency;
            // Zera o desconto CONDICIONAL
            cdsParcelasOrigemVL_DESCONTO.AsCurrency := 0;
         end
         else

         // Verifica se o valor de desconto CONDICIONAL é maior do que ainda
         // se precisa pagar na parcela (valor da PARCELA - desconto FIXO)
         if (ValorTotal - cdsParcelasOrigemVL_BOLSA.AsCurrency) <
            cdsParcelasOrigemVL_DESCONTO.AsCurrency then
         begin
            // Se for maior então ajusta o desconto CONDICIONAL para cobrir
            // o restante que falta pagar
            cdsParcelasOrigemVL_DESCONTO.AsCurrency :=
               ValorTotal - cdsParcelasOrigemVL_BOLSA.AsCurrency;
         end;

      end;
      cdsParcelasOrigemSN_SIMULADO.AsBoolean := True;
      cdsParcelasOrigem.Post;

      cdsParcelasOrigem.Next;
   end;

   cdsParcelasOrigem.Filtered := False;
   cdsParcelasOrigem.EnableControls;
end;

end.
