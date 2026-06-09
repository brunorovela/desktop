unit UFParams;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, DB, ZAbstractRODataset,
   ZAbstractDataset, UZDataset, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons,
   md5, uUsuario;

type
   TfParams = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      ilOpcoes: TImageList;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnIncluir: TToolButton;
      btnAlterar: TToolButton;
      btnSep2: TToolButton;
      btnExcluir: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      btnFechar: TToolButton;
      btnSep4: TToolButton;
      bvlSep3: TBevel;
      splSep1: TSplitter;
      qryParams: TUMZQuery;
      qryParamsDS_VARIAVEL: TStringField;
      qryParamsSN_RESTRITO: TStringField;
      qryParamsDS_VARIAVEL_USUARIO: TMemoField;
      qryParamsCD_CATEGORIA: TIntegerField;
      qryParamsCD_TIPO: TSmallintField;
      qryParamsCD_COLIGADA: TSmallintField;
      dsParams: TDataSource;
      qryCategorias: TUMZReadOnlyQuery;
      qryCategoriasCD_CATEGORIA: TIntegerField;
      qryCategoriasDS_CATEGORIA: TStringField;
      qryParamsNM_CATEGORIA: TStringField;
      qryParamsNM_TIPO: TStringField;
      qryParamsDS_AJUDA: TStringField;
      pnlFiltros: TPanel;
      pnlGeral: TPanel;
      bvlSep7: TBevel;
      pnlRegistros: TPanel;
      bvlSep6: TBevel;
      dbgParams: TDBGrid;
      pnlRegistrosTit: TPanel;
      pnlFiltrosTit: TPanel;
      bvlSep8: TBevel;
      ledParametro: TLabeledEdit;
      ledValor: TLabeledEdit;
      sbFiltrar: TSpeedButton;
      sbLimpar: TSpeedButton;
      qryParamsDS_VALOR: TMemoField;
      qryParamsDS_VALOR_STRING: TStringField;
    pnlCadastro: TScrollBox;
    lblCategoria: TLabel;
    lblVariavel: TLabel;
    lblDescricao: TLabel;
    bvlSep4: TBevel;
    lblValor: TLabel;
    bvlSep5: TBevel;
    lblTipo: TLabel;
    dbeVariavel: TDBEdit;
    dbmDescricao: TDBMemo;
    pnlCadastroTit: TPanel;
    meValorAnoSem: TMaskEdit;
    udAnoSem: TUpDown;
    dtpValorData: TDateTimePicker;
    dtpValorHora: TDateTimePicker;
    dbmValor: TDBMemo;
    dbeTipo: TDBEdit;
    edtValor: TEdit;
    mmSenha: TMemo;
    rgValor: TRadioGroup;
    dbeCategoria: TDBEdit;
      procedure rgValorClick(Sender: TObject);
      procedure edtValorKeyPress(Sender: TObject; var Key: Char);
      procedure dbgParamsDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure ledValorKeyPress(Sender: TObject; var Key: Char);
      procedure ledParametroKeyPress(Sender: TObject; var Key: Char);
      procedure sbLimparClick(Sender: TObject);
      procedure sbFiltrarClick(Sender: TObject);
      procedure meValorAnoSemKeyPress(Sender: TObject; var Key: Char);
      procedure dtpValorDataChange(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure dbgParamsTitleClick(Column: TColumn);
      procedure qryParamsAfterPost(DataSet: TDataSet);
      procedure dtpValorHoraChange(Sender: TObject);
      procedure qryParamsBeforePost(DataSet: TDataSet);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure dsParamsStateChange(Sender: TObject);
      procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
      procedure dsParamsDataChange(Sender: TObject; Field: TField);
      procedure qryParamsCalcFields(DataSet: TDataSet);
      procedure FormCreate(Sender: TObject);
   private
      procedure OnlyNumberOnKeyPress(Sender: TObject; var Key: Char);
      procedure OneLetterOnKeyPress(Sender: TObject; var Key: Char);
   end;

var
   fParams: TfParams;

implementation

uses
   UDM;

const
   ParamTypes: array [0..9] of string = ('Texto', 'Número', 'Sim ou não',
      'Apenas uma letra', 'Texto criptografado', 'Senha', 'Ano/semestre',
      'Data', 'Hora', 'Data e hora');
   
   SDefaultSQL =
   'SELECT DS_VARIAVEL, DS_VALOR, SN_RESTRITO, DS_VARIAVEL_USUARIO, CD_CATEGORIA, CD_TIPO, CD_COLIGADA FROM PARAMETROS %s%s';

{$R *.dfm}

procedure TfParams.btnAlterarClick(Sender: TObject);
begin
   qryParams.Edit;
end;

procedure TfParams.btnCancelarClick(Sender: TObject);
begin
   qryParams.Cancel;
end;

procedure TfParams.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfParams.btnSalvarClick(Sender: TObject);
begin
   qryParams.Post;
end;

procedure TfParams.dbgParamsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (qryParamsCD_TIPO.AsInteger in [4, 5]) and (Column.FieldName = 'DS_VALOR_STRING') then
   begin
      TDBGrid(Column.Grid).Canvas.Brush.Color := clWindowText;
      TDBGrid(Column.Grid).Canvas.Font.Color := clWindowText;
      TDBGrid(Column.Grid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfParams.dbgParamsTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := #59;
      SortedFields.StrictDelimiter := True;
      SortedFields.NameValueSeparator := #32;
 
      SortedFields.DelimitedText := qryParams.IndexFieldNames;
 
      for I := 0 to SortedFields.Count - 1 do
 
         if SortedFields.Names[I] = Column.FieldName then
         begin
 
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
 
            Found := True;
            Break;
         end;
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      qryParams.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfParams.dsParamsDataChange(Sender: TObject; Field: TField);
var
   LDateTime: TDateTime;
begin
   rgValor.Enabled := False;

   if qryParamsCD_TIPO.AsInteger = 1 then
      dbmValor.OnKeyPress := OnlyNumberOnKeyPress
   else if qryParamsCD_TIPO.AsInteger = 3 then
      dbmValor.OnKeyPress := OneLetterOnKeyPress
   else
      dbmValor.OnKeyPress := nil;

   dbmValor.Visible := not (qryParamsCD_TIPO.AsInteger in [4, 5]);
   mmSenha.Visible := not dbmValor.Visible;
   dbmValor.Enabled := not (qryParamsCD_TIPO.AsInteger in [2, 4, 5, 6, 7, 8 ,9]);
   edtValor.Enabled := qryParamsCD_TIPO.AsInteger in [4, 5];
   meValorAnoSem.Enabled := qryParamsCD_TIPO.AsInteger = 6;
   udAnoSem.Enabled := qryParamsCD_TIPO.AsInteger = 6;
   dtpValorData.Enabled := qryParamsCD_TIPO.AsInteger in [7, 9];
   dtpValorHora.Enabled := qryParamsCD_TIPO.AsInteger in [8, 9];

   if qryParams.State <> dsEdit then
   begin
   
      edtValor.Clear;
      rgValor.ItemIndex := -1;
      meValorAnoSem.Clear;
      dtpValorData.Date := Date;
      dtpValorHora.Time := Time;
      
      case qryParamsCD_TIPO.AsInteger of
         2:
            if qryParamsDS_VALOR.AsString = 'S' then
               rgValor.ItemIndex := 0
            else if qryParamsDS_VALOR.AsString = 'N' then
               rgValor.ItemIndex := 1;
         4, 5:
            edtValor.Text := qryParamsDS_VALOR.AsString;
         6:
            meValorAnoSem.Text := qryParamsDS_VALOR.AsString;
         7:
            if TryStrToDate(qryParamsDS_VALOR.AsString, LDateTime) then
            begin
               dtpValorData.Date := LDateTime
            end;
         8:
            if TryStrToTime(qryParamsDS_VALOR.AsString, LDateTime) then
            begin
               dtpValorHora.Time := TTime(LDateTime)
            end;
         9:
            if TryStrToDateTime(qryParamsDS_VALOR.AsString, LDateTime) then
            begin
               dtpValorData.Date := TDate(LDateTime);
               dtpValorHora.Time := TTime(LDateTime);
            end
      end;
   end;
   rgValor.Enabled := qryParamsCD_TIPO.AsInteger = 2;
end;

procedure TfParams.dsParamsStateChange(Sender: TObject);
begin
   btnAlterar.Enabled :=
      (qryParams.State = dsBrowse) and
      (not qryParams.IsEmpty) and
      DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Parametros.Gerenciar', npAlterar, False);

   btnSalvar.Enabled := qryParams.State in [dsEdit, dsInsert];
   btnCancelar.Enabled := qryParams.State in [dsEdit, dsInsert];
   btnFechar.Enabled := qryParams.State = dsBrowse;
end;

procedure TfParams.dtpValorDataChange(Sender: TObject);
begin
   if qryParams.State <> dsOpening then
      qryParams.Edit;
end;

procedure TfParams.dtpValorHoraChange(Sender: TObject);
begin
   dtpValorData.Time := dtpValorHora.Time;
   if qryParams.State <> dsOpening then
      qryParams.Edit;
end;

procedure TfParams.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
   if not (qryParams.State in [dsOpening, dsEdit]) then
      qryParams.Edit;
end;

procedure TfParams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryParams.Close;
   Action := caFree;
end;

procedure TfParams.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := qryParams.State = dsBrowse;
end;

procedure TfParams.FormCreate(Sender: TObject);
begin
   qryParams.Open;
end;

procedure TfParams.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F3:
         btnAlterar.Click;
      VK_F5:
         btnSalvar.Click;
      VK_F6:
         btnCancelar.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

procedure TfParams.ledParametroKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then ledValor.SetFocus;
end;

procedure TfParams.ledValorKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (Trim(ledParametro.Text + ledValor.Text) <> '') then
      sbFiltrar.Click;
end;

procedure TfParams.meValorAnoSemKeyPress(Sender: TObject; var Key: Char);
begin
   if qryParams.State <> dsOpening then
      qryParams.Edit;
end;

procedure TfParams.OneLetterOnKeyPress(Sender: TObject; var Key: Char);
begin
   if (TDBMemo(Sender).SelLength = 0) and
      ((Length(TDBMemo(Sender).Lines.Text) > 0) and not (Key in [#8, #127])) then
      Key := #0
   else if Key in [#48..#57] then
      Key := #0;
end;

procedure TfParams.OnlyNumberOnKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#48..#57, #8]) then Key := #0
end;

procedure TfParams.qryParamsAfterPost(DataSet: TDataSet);
begin
   qryParams.EnableControls;
end;

procedure TfParams.qryParamsBeforePost(DataSet: TDataSet);
begin
   qryParams.DisableControls;
   case qryParamsCD_TIPO.AsInteger of
      2:
         if rgValor.ItemIndex = 0 then
            qryParamsDS_VALOR.AsString := 'S'
         else if rgValor.ItemIndex = 1 then
            qryParamsDS_VALOR.AsString := 'N';
      4:
         qryParamsDS_VALOR.AsString := MD5Print(MD5String(edtValor.Text));
      5:
         qryParamsDS_VALOR.AsString := edtValor.Text;
      6:
         qryParamsDS_VALOR.AsString := meValorAnoSem.Text;
      7:
         qryParamsDS_VALOR.AsString := FormatDateTime('dd/mm/yyyy', dtpValorData.Date);
      8:
         qryParamsDS_VALOR.AsString := FormatDateTime('hh:nn:ss', dtpValorHora.Time);
      9:
         qryParamsDS_VALOR.AsString := FormatDateTime('dd/mm/yyyy hh:nn:ss', dtpValorData.DateTime);
   end;
end;

procedure TfParams.qryParamsCalcFields(DataSet: TDataSet);
begin
   if qryParamsCD_TIPO.AsInteger in [1..10] then
      qryParamsNM_TIPO.AsString := ParamTypes[qryParamsCD_TIPO.AsInteger]
   else
      qryParamsNM_TIPO.AsString := 'Tipo indefinido';
   qryParamsDS_AJUDA.AsString := qryParamsDS_VARIAVEL_USUARIO.AsString;
   qryParamsDS_VALOR_STRING.AsString := qryParamsDS_VALOR.AsString;
end;

procedure TfParams.rgValorClick(Sender: TObject);
begin
   if (not (qryParams.State in [dsOpening, dsEdit])) and rgValor.Enabled then
      qryParams.Edit;
end;

procedure TfParams.sbFiltrarClick(Sender: TObject);
const
   SOp = ' OR ';
   SWhere = 'WHERE ';
var
   LFilter: string;
begin
   if Trim(ledParametro.Text) <> '' then
   begin
      LFilter := Format('DS_VARIAVEL LIKE ''%s''', [AnsiQuotedStr(ledParametro.Text, #37)]);
   end
   else
      LFilter := '';

   if Trim(ledValor.Text) <> '' then
   begin
      if LFilter <> '' then
         LFilter := LFilter + SOp;
      LFilter := LFilter + Format('DS_VALOR LIKE ''%s''', [AnsiQuotedStr(ledValor.Text, #37)]);
   end;

   qryParams.Close;
   if LFilter <> '' then
      qryParams.SQL.Text := Format(SDefaultSQL, [SWhere, LFilter])
   else
      qryParams.SQL.Text := Format(SDefaultSQL, ['', '']);
   qryParams.Open;
end;

procedure TfParams.sbLimparClick(Sender: TObject);
begin
   ledParametro.Clear;
   ledValor.Clear;
   qryParams.Close;
   qryParams.SQL.Text := Format(SDefaultSQL, ['', '']);
   qryParams.Open;
end;

procedure TfParams.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meValorAnoSem.Text := DM.IncYearSemester(meValorAnoSem.Text)
   else if Button = btPrev then
      meValorAnoSem.Text := DM.DecYearSemester(meValorAnoSem.Text);
   if qryParams.State <> dsOpening then
      qryParams.Edit;
end;

end.
