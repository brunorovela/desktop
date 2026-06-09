unit UFFinRepasseTurma;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Spin, UMEditMonetario, Buttons, DateUtils,
   UZDbcFuncs, ZDbcIntfs, uUsuario, Mask;

type
   TfrmFinRepasseTurma = class(TForm)
      edtValor: TUMEditMonetario;
      lblInicio: TLabel;
      lblParcelas: TLabel;
      lblValor: TLabel;
      meReferencia: TMaskEdit;
      pnlDados: TPanel;
      sbCancel: TSpeedButton;
      sbOk: TSpeedButton;
      speParcelas: TSpinEdit;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbCancelClick(Sender: TObject);
      procedure sbOkClick(Sender: TObject);
   public
      class function Edit(const Left, Top, ContratoID, AnoSemestre: Integer;
         const TurmaID: AnsiString): Boolean;
   end;

implementation

{$R *.dfm}

{ TfrmFinRepasseTurma }

class function TfrmFinRepasseTurma.Edit(const Left, Top, ContratoID,
  AnoSemestre: Integer; const TurmaID: AnsiString): Boolean;
const
   DefaultDateFmt = '01/%s';
   SQLSelect = ''
      + ' SELECT '
      + '   NR_PARCELAS, '
      + '   VL_REPASSE, '
      + '   DT_REFERENCIA '
      + ' FROM '
      + '   CONV_CONTRATOS_TURMAS '
      + ' WHERE '
      + '   CD_CONTRATO = ? AND '
      + '   CD_TURMA = ? AND '
      + '   NR_ANOSEMESTRE = ? ';
      
   SQLUpdate = ''
      + ' UPDATE '
      + '   CONV_CONTRATOS_TURMAS '
      + ' SET '
      + '   NR_PARCELAS = ?, '
      + '   VL_REPASSE = ?, '
      + '   DT_REFERENCIA = ? '
      + ' WHERE '
      + '   CD_CONTRATO = ? AND '
      + '   CD_TURMA = ? AND '
      + '   NR_ANOSEMESTRE = ? ';
var
   Form: TfrmFinRepasseTurma;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   StartDate: TDate;
begin
   Application.CreateForm(TfrmFinRepasseTurma, Form);

   Form.meReferencia.EditText := FormatDateTime('mm/yyyy', Date);
   Form.speParcelas.Value := 1;
   Form.edtValor.setValor(0);

   Stmt := PrepareStatement(SQLSelect);
   try
      Stmt.SetInt(1, ContratoID);
      Stmt.SetString(2, TurmaID);
      Stmt.SetInt(3, AnoSemestre);
      
      Rs := Stmt.ExecuteQueryPrepared;
      
      try
         if Rs.Next then
         begin
            Form.meReferencia.EditText := FormatDateTime('mm/yyyy', Rs.GetDate(3));
            Form.speParcelas.Value := Rs.GetInt(1);
            Form.edtValor.setValor(Rs.GetDouble(2));
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Form.Left := Left;
   Form.Top := Top;

   Result := Form.ShowModal = mrOk;

   if Result then
   begin

      StartDate := StrToDate(Format(DefaultDateFmt, [Form.meReferencia.Text]));

      Stmt := PrepareStatement(SQLUpdate);
      try
         Stmt.SetInt(1, Form.speParcelas.Value);
         Stmt.SetDouble(2, Form.edtValor.getValorDouble);
         Stmt.SetDate(3, StartDate);
         Stmt.SetInt(4, ContratoID);
         Stmt.SetString(5, TurmaID);
         Stmt.SetInt(6, AnoSemestre);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
      
   end;
end;

procedure TfrmFinRepasseTurma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFinRepasseTurma.sbCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmFinRepasseTurma.sbOkClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

end.
