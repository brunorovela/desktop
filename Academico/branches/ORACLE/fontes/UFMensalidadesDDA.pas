unit UFMensalidadesDDA;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList, DB,
   ZAbstractRODataset, UZDataset, Grids, DBGrids, UDBGrids, DBClient, Provider;

type
   TfrmMensalidadesDDA = class(TForm)
      btnCancelar: TToolButton;
      btnDesmarcar: TToolButton;
      btnIgnorar: TToolButton;
      btnMarcar: TToolButton;
      btnSep1: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      cdsBoletos: TClientDataSet;
      cdsBoletosCD_BOLETO: TIntegerField;
      cdsBoletosCD_RESP_FINAN: TIntegerField;
      cdsBoletosDT_INCLUSAO: TDateTimeField;
      cdsBoletosDT_VENCIMENTO: TDateTimeField;
      cdsBoletosNM_PESSOA: TStringField;
      cdsBoletosNR_NOSSONUMERO: TStringField;
      cdsBoletosNR_SELECAO: TIntegerField;
      cdsBoletosSN_SELECAO: TBooleanField;
      cdsBoletosSUM_SELECIONADOS: TAggregateField;
      cdsBoletosVL_BOLETO: TFloatField;
      cdsBoletosVL_DESCONTO: TFloatField;
      dbgBoletos: TSortedDBGrid;
      dsBoletos: TDataSource;
      dspBoletos: TDataSetProvider;
      ilAcoes: TImageList;
      imgIcon: TImage;
      lblOrientacao: TLabel;
      lblTitulo: TLabel;
      pnlOrientacao: TPanel;
      qryBoletos: TUMZReadOnlyQuery;
      qryBoletosCD_BOLETO: TIntegerField;
      qryBoletosCD_RESP_FINAN: TIntegerField;
      qryBoletosDT_INCLUSAO: TDateTimeField;
      qryBoletosDT_VENCIMENTO: TDateTimeField;
      qryBoletosNM_PESSOA: TStringField;
      qryBoletosNR_NOSSONUMERO: TStringField;
      qryBoletosVL_BOLETO: TFloatField;
      qryBoletosVL_DESCONTO: TFloatField;
      tlbAcoes: TToolBar;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnDesmarcarClick(Sender: TObject);
      procedure btnIgnorarClick(Sender: TObject);
      procedure btnMarcarClick(Sender: TObject);
      procedure dbgBoletosCellClick(Column: TColumn);
      procedure dbgBoletosDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   private
      procedure UpdateButtonStatus;
   public
      class procedure CancelaDDA(const ParcelaInicio, ParcelaFim,
         PessoaId: Integer; const TurmaId: AnsiString); 
   end;

implementation

uses
   uRemessaClass;

{$R *.dfm}

procedure TfrmMensalidadesDDA.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfrmMensalidadesDDA.btnDesmarcarClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsBoletos.GetBookmark;
   cdsBoletos.DisableControls;
   cdsBoletos.First;
   while not cdsBoletos.Eof do
   begin
      cdsBoletos.Edit;
      cdsBoletosSN_SELECAO.AsBoolean := False;
      cdsBoletosNR_SELECAO.AsInteger := 0;
      cdsBoletos.Next;
   end;
   cdsBoletos.GotoBookmark(Bookmark);
   cdsBoletos.EnableControls;
   UpdateButtonStatus;
end;

procedure TfrmMensalidadesDDA.btnIgnorarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmMensalidadesDDA.btnMarcarClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsBoletos.GetBookmark;
   cdsBoletos.DisableControls;
   cdsBoletos.First;
   while not cdsBoletos.Eof do
   begin
      cdsBoletos.Edit;
      cdsBoletosSN_SELECAO.AsBoolean := True;
      cdsBoletosNR_SELECAO.AsInteger := 1;
      cdsBoletos.Next;
   end;
   cdsBoletos.GotoBookmark(Bookmark);
   cdsBoletos.EnableControls;
   UpdateButtonStatus;
end;

class procedure TfrmMensalidadesDDA.CancelaDDA(const ParcelaInicio, ParcelaFim,
  PessoaId: Integer; const TurmaId: AnsiString);
var
   Form: TfrmMensalidadesDDA;
   Found: Boolean;   
begin
   Application.CreateForm(TfrmMensalidadesDDA, Form);

   Form.cdsBoletos.Params.ParamByName('NR_PARCELA_INICIO').AsInteger := ParcelaInicio;
   Form.cdsBoletos.Params.ParamByName('NR_PARCELA_FIM').AsInteger := ParcelaFim;
   Form.cdsBoletos.Params.ParamByName('CD_PESSOA').AsInteger := PessoaId;
   Form.cdsBoletos.Params.ParamByName('CD_TURMA').AsString := TurmaId;
   Form.cdsBoletos.Open;

   Found := not Form.cdsBoletos.IsEmpty;

   if Found then
   begin
      Form.ShowModal;
   end;
   
   if not Found then
   begin
      Form.Free;
      Form := nil;
   end;

end;

procedure TfrmMensalidadesDDA.dbgBoletosCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.FieldByName('NR_SELECAO').AsInteger := Ord(Column.Field.AsBoolean);
      Column.Field.DataSet.Post;
      UpdateButtonStatus;
   end;
end;

procedure TfrmMensalidadesDDA.dbgBoletosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.Field.DataType = ftBoolean then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;
end;

procedure TfrmMensalidadesDDA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmMensalidadesDDA.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   TextQ = 'Tem certeza que deseja enviar o pedido de cancelamento do DDA para os boletos selecionados?';
   CaptionQ = 'Confirmação';
   TextD = 'O pedido de cancelamento do DDA para os boletos selecionados foi registrado com sucesso.';
   CaptionD = 'Informação';
   TextQC = 'Tem certeza que deseja ignorar os boletos que possuem DDA e continuar a impressão? Esses boletos não serão incluídos na impressão.';
var
   UserChoice: Integer;
   Remessa: TRemessa;
begin
   CanClose := True;
   
   if ModalResult = mrOk then
   begin

      UserChoice := MessageBox(0, TextQ, CaptionQ, MB_ICONQUESTION + MB_YESNO);

      CanClose := False;

      if UserChoice = ID_YES then
      begin
         CanClose := True;

         cdsBoletos.DisableControls;
         cdsBoletos.Filtered := True;
         cdsBoletos.First;

         Remessa := TRemessa.Create;
         try
            while not cdsBoletos.Eof do
            begin
               Remessa.CancelaDDA(cdsBoletosNR_NOSSONUMERO.AsString);
               cdsBoletos.Next;
            end;
         finally
            Remessa.Free;
            Remessa := nil;
         end;

         MessageBox(0, TextD, CaptionD, MB_ICONINFORMATION + MB_OK);
      end;
      
   end;

   if ModalResult = mrCancel then
   begin
      UserChoice := MessageBox(0, TextQC, CaptionQ, MB_ICONQUESTION + MB_YESNO);
      CanClose := UserChoice = ID_YES;
   end;
end;

procedure TfrmMensalidadesDDA.UpdateButtonStatus;
begin
   btnCancelar.Enabled := cdsBoletosSUM_SELECIONADOS.Value >0;
end;

end.
