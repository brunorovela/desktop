unit UFComprasAgendamentoSaida;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, ZDataset, ExtCtrls, StdCtrls, Provider,
   DBClient, ComCtrls, ToolWin, ImgList, Grids, DBGrids, UDBGrids, ZDbcIntfs,
   UZDbcFuncs;

type
   TfrmAgendamentoSaida = class(TForm)
      btnCancelar: TToolButton;
      btnConfirmar: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      cdsAgendamentos: TClientDataSet;
      cdsAgendamentoscd_agendamento: TLargeintField;
      cdsAgendamentosCD_PRODUTO: TStringField;
      cdsAgendamentosDS_PRODUTO: TStringField;
      cdsAgendamentosdt_fim_vigencia: TDateField;
      cdsAgendamentosdt_inicio_vigencia: TDateField;
      cdsAgendamentosmax_parcelas: TAggregateField;
      cdsAgendamentosmin_parcelas: TAggregateField;
      cdsAgendamentosNR_PARCELAS: TSmallintField;
      cdsAgendamentosnr_quantidade: TLargeintField;
      cdsAgendamentosNR_QUANTIDADE_ESTOQUE: TIntegerField;
      cdsAgendamentosnr_selecionado: TIntegerField;
      cdsAgendamentosSN_ACUMULAR_VALORES: TSmallintField;
      cdsAgendamentosSN_GERAR_TITULO: TSmallintField;
      cdsAgendamentosSN_IMPRIMIR_CUPOM: TSmallintField;
      cdsAgendamentossn_selecionado: TBooleanField;
      cdsAgendamentossum_selecionados: TAggregateField;
      cdsAgendamentosVL_PRODUTO: TFloatField;
      dbgAgendamentos: TSortedDBGrid;
      dsAgendamentos: TDataSource;
      dspAgendamentos: TDataSetProvider;
      ilAcoes: TImageList;
      lblInfo: TLabel;
      pnlInfo: TPanel;
      qryAgendamentos: TZReadOnlyQuery;
      qryAgendamentoscd_agendamento: TLargeintField;
      qryAgendamentosCD_PRODUTO: TStringField;
      qryAgendamentosDS_PRODUTO: TStringField;
      qryAgendamentosdt_fim_vigencia: TDateField;
      qryAgendamentosdt_inicio_vigencia: TDateField;
      qryAgendamentosNR_PARCELAS: TSmallintField;
      qryAgendamentosnr_quantidade: TLargeintField;
      qryAgendamentosNR_QUANTIDADE_ESTOQUE: TIntegerField;
      qryAgendamentosSN_ACUMULAR_VALORES: TSmallintField;
      qryAgendamentosSN_GERAR_TITULO: TSmallintField;
      qryAgendamentosSN_IMPRIMIR_CUPOM: TSmallintField;
      qryAgendamentosVL_PRODUTO: TFloatField;
      tlbAcoes: TToolBar;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure cdsAgendamentosAfterOpen(DataSet: TDataSet);
      procedure cdsAgendamentosCalcFields(DataSet: TDataSet);
      procedure dbgAgendamentosCellClick(Column: TColumn);
      procedure dbgAgendamentosDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn;
         State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure UpdateControls;
   public
      class function ShowAgendamentos(const PessoaId: Integer): Boolean;
      class function TemAgendamentos(const PessoaId: Integer): Boolean;
   end;

var
   frmAgendamentoSaida: TfrmAgendamentoSaida;

implementation
   uses
         uDM, uUsuario;
{$R *.dfm}

procedure TfrmAgendamentoSaida.btnCancelarClick(Sender: TObject);
const
   SCaptionConfirm = 'Confirmação';
   SMsgConfirm = ''
      + 'Deseja realmente cancelar a inclusão dos agendamentos ao registro de '
      + 'saída de produtos?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(Handle, SMsgConfirm, SCaptionConfirm,
      MB_ICONQUESTION or MB_YESNO);

   if UserChoice <> ID_YES then
      Exit;

   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmAgendamentoSaida.btnConfirmarClick(Sender: TObject);
const
   SCaptionConfirm = 'Confirmação';
   SMsgConfirm = ''
      + 'Deseja realmente confirmar a inclusão dos agendamentos selecionados '
      + 'ao registro de saída de produtos?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(Handle, SMsgConfirm, SCaptionConfirm,
      MB_ICONQUESTION or MB_YESNO);

   if UserChoice <> ID_YES then
      Exit;

   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmAgendamentoSaida.cdsAgendamentosAfterOpen(DataSet: TDataSet);
begin
   cdsAgendamentos.DisableControls;
   cdsAgendamentos.First;
   while not cdsAgendamentos.Eof do
   begin
      if (Date >= cdsAgendamentosdt_inicio_vigencia.AsDateTime) and
         (Date <= cdsAgendamentosdt_fim_vigencia.AsDateTime) then
      begin
         cdsAgendamentos.Edit;
         cdsAgendamentossn_selecionado.AsBoolean := True;
      end;
      cdsAgendamentos.Next;
   end;
   if cdsAgendamentos.State = dsEdit then
      cdsAgendamentos.Post;
   cdsAgendamentos.First;
   cdsAgendamentos.EnableControls;
end;

procedure TfrmAgendamentoSaida.cdsAgendamentosCalcFields(DataSet: TDataSet);
begin
   if cdsAgendamentosnr_quantidade.AsInteger >
      cdsAgendamentosNR_QUANTIDADE_ESTOQUE.AsInteger then
      cdsAgendamentossn_selecionado.Clear;

   cdsAgendamentosnr_selecionado.AsInteger :=
      Ord(cdsAgendamentossn_selecionado.AsBoolean);
end;

procedure TfrmAgendamentoSaida.dbgAgendamentosCellClick(Column: TColumn);
begin
   if Column.Field.DataType <> ftBoolean then
      Exit;

   if cdsAgendamentosnr_quantidade.AsInteger >
      cdsAgendamentosNR_QUANTIDADE_ESTOQUE.AsInteger then
      Exit;
   
   Column.Field.DataSet.Edit;
   Column.Field.AsBoolean := not Column.Field.AsBoolean;
   Column.Field.DataSet.Post;
   UpdateControls;
end;

procedure TfrmAgendamentoSaida.dbgAgendamentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
   ColorAlizarim = $003C4CE7;
   ColorTurquoise = $009CBC1A;
   ColorSunFlower = $000FC4F1;
var
   DrawRect: TRect;
begin
   if Column.Field.DataType = ftBoolean then
   begin
   
      if cdsAgendamentosnr_quantidade.AsInteger >
         cdsAgendamentosNR_QUANTIDADE_ESTOQUE.AsInteger then
      begin
         Exit;
      end;
      
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(dbgAgendamentos.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
      Exit;
   end;

   if (gdSelected in State) or (gdFocused in State) then
   begin
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   if cdsAgendamentosnr_quantidade.AsInteger >
      cdsAgendamentosNR_QUANTIDADE_ESTOQUE.AsInteger then
   begin
      dbgAgendamentos.Canvas.Font.Color := clWhite;
      dbgAgendamentos.Canvas.Brush.Color := ColorSunFlower;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   if cdsAgendamentosdt_fim_vigencia.AsDateTime < Date then
   begin
      dbgAgendamentos.Canvas.Font.Color := clWhite;
      dbgAgendamentos.Canvas.Brush.Color := ColorAlizarim;
      dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;

   dbgAgendamentos.Canvas.Font.Color := clWhite;
   dbgAgendamentos.Canvas.Brush.Color := ColorTurquoise;
   dbgAgendamentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAgendamentoSaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

class function TfrmAgendamentoSaida.ShowAgendamentos(
  const PessoaId: Integer): Boolean;

   function GetNomePessoa: AnsiString;
   const
      SSQLSelectNomePessoa = ''
         + 'SELECT '
         + '	nm_pessoa '
         + 'FROM '
         + '	pessoas '
         + 'WHERE '
         + '	cd_pessoa = ? ';
   var
      Stmt: IZPreparedStatement;
      Rs: IZResultSet;
   begin
      Result := '';
      Stmt := PrepareStatement(SSQLSelectNomePessoa);
      try
         Stmt.SetInt(1, PessoaId);
         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
               Result := Rs.GetString(1);
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;
var
   sn_permissao : boolean;
begin
   if frmAgendamentoSaida = nil then
      Application.CreateForm(TfrmAgendamentoSaida, frmAgendamentoSaida);

   with frmAgendamentoSaida do
   begin

     // Verifica se tem a permissão necessária para está ação
   sn_permissao :=
    DM.UsuarioLogado.TemPermissao(0,
               'UMFinanceiro.ProdutoConfirmarAgendamentosPendentes', npAcesso, false);

     if not(sn_permissao) then
     begin
       btnConfirmar.Enabled := sn_permissao;
       dbgAgendamentos.Enabled :=  sn_permissao;
     end;

      cdsAgendamentos.Close;
      cdsAgendamentos.Params.ParamByName('cd_pessoa').AsInteger := PessoaId;
      cdsAgendamentos.Open;
      UpdateControls;
      lblInfo.Caption := Format(lblInfo.Caption, [GetNomePessoa]);
      Result := ShowModal = mrOk;
   end;
   
end;

class function TfrmAgendamentoSaida.TemAgendamentos(
  const PessoaId: Integer): Boolean;
const
   SSQLProcuraAgenda = ''
      + 'SELECT '
      + '	1 '
      + 'FROM '
      + '	comp_agendamento a '
      + 'WHERE '
      + '	a.ds_situacao = ''Pendente'' AND '
      + '	a.cd_pessoa = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := False;
   Stmt := PrepareStatement(SSQLProcuraAgenda);
   try
      Stmt.SetInt(1, PessoaId);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Result := Rs.Next;         
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmAgendamentoSaida.UpdateControls;
begin
   btnConfirmar.Enabled := cdsAgendamentossum_selecionados.Value > 0;
end;

end.
