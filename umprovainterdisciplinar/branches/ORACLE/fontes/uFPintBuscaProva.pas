unit uFPintBuscaProva;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Mask, Buttons, Grids,
   DBGrids, DB, ZConnection, uDM, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset;

type
   TfPIntBuscaProvas = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      ilImagens: TImageList;
      tlbAcoes: TToolBar;
      btnSep1: TToolButton;
      btnSelecionar: TToolButton;
      btnSep2: TToolButton;
      btnSair: TToolButton;
      btnSep3: TToolButton;
      bvlSep3: TBevel;
      pnlFiltros: TPanel;
      meAnoSem: TMaskEdit;
      udAnoSem: TUpDown;
      chkAnoSem: TCheckBox;
      chkData: TCheckBox;
      dtpData: TDateTimePicker;
      chkDescricao: TCheckBox;
      edtDescricao: TEdit;
      btnFiltrar: TBitBtn;
      bvlSep4: TBevel;
      dbgProvas: TDBGrid;
      dsProvas: TDataSource;
      qryProvas: TUMZQuery;
    procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
      procedure qryProvasAfterOpen(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgProvasDblClick(Sender: TObject);
      procedure btnSelecionarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
      procedure btnSairClick(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure chkDescricaoClick(Sender: TObject);
      procedure chkDataClick(Sender: TObject);
      procedure chkAnoSemClick(Sender: TObject);
      procedure dbgProvasDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
   strict private
      FICodigoProva: integer;
   public
      class function GetProva(AOwner: TComponent): integer;
      property CodigoProva: integer read FICodigoProva;
   end;

var
  fPIntBuscaProvas: TfPIntBuscaProvas;

implementation

{$R *.dfm}

procedure TfPIntBuscaProvas.btnFiltrarClick(Sender: TObject);
const
   SQL_GET_PROVAS =
      'SELECT '+
         'cd_prova,'+
         'ds_prova,'+
         'nr_anosemestre,'+
         'dt_inicio_cadastro,'+
         'dt_fim_cadastro,'+
         'dt_prova,'+
         'dt_divulgacao,'+
         'sn_finalizada '+
      'FROM '+
         'pint_provas';

   SQL_FILTRO_DATA =
      'DATE(dt_prova) = :dt_prova';

   SQL_FILTRO_ANOSEM =
      'nr_anosemestre = :nr_anosemestre';

   SQL_FILTRO_DESC =
      'ds_prova LIKE :ds_prova';

   SQL_GET_PROVAS_ANOSEM =
      SQL_GET_PROVAS + ' WHERE ' + SQL_FILTRO_ANOSEM;

   SQL_GET_PROVA_ANOSEM_DATA =
      SQL_GET_PROVAS_ANOSEM + ' AND ' + SQL_FILTRO_DATA;

   SQL_GET_PROVA_ANOSEM_DESC =
      SQL_GET_PROVAS_ANOSEM + ' AND ' + SQL_FILTRO_DESC;

   SQL_GET_PROVA_ANOSEM_DATA_DESC =
      SQL_GET_PROVA_ANOSEM_DATA + ' AND ' + SQL_FILTRO_DESC;

   SQL_GET_PROVAS_DATA =
      SQL_GET_PROVAS + ' WHERE '+ SQL_FILTRO_DATA;

   SQL_GET_PROVAS_DATA_DESC =
      SQL_GET_PROVAS_DATA + ' AND ' + SQL_FILTRO_DESC;

   SQL_GET_PROVAS_DESC =
      SQL_GET_PROVAS + ' WHERE '+ SQL_FILTRO_DESC;
begin
   qryProvas.Close;
   if chkAnoSem.Checked then
   begin
      if chkData.Checked then
      begin
         if chkDescricao.Checked then
         begin
            qryProvas.SQL.Text := SQL_GET_PROVA_ANOSEM_DATA_DESC;
            qryProvas.ParamByName('ds_prova').AsString := '%' + edtDescricao.Text + '%';
         end
         else
         begin
            qryProvas.SQL.Text := SQL_GET_PROVA_ANOSEM_DATA;
         end;
         qryProvas.ParamByName('dt_prova').AsString := FormatDateTime('yyyy-mm-dd', dtpData.Date);
      end
      else if chkDescricao.Checked then
      begin
         qryProvas.SQL.Text := SQL_GET_PROVA_ANOSEM_DESC;
         qryProvas.ParamByName('ds_prova').AsString := '%' + edtDescricao.Text + '%';
      end
      else
      begin
         qryProvas.SQL.Text := SQL_GET_PROVAS_ANOSEM;
      end;
      qryProvas.ParamByName('nr_anosemestre').AsString := meAnoSem.Text;
   end
   else if chkData.Checked then
   begin
      if chkDescricao.Checked then
      begin
         qryProvas.SQL.Text := SQL_GET_PROVAS_DATA_DESC;
         qryProvas.ParamByName('ds_prova').AsString := '%' + edtDescricao.Text + '%';
      end
      else
      begin
         qryProvas.SQL.Text := SQL_GET_PROVAS_DATA;
      end;
      qryProvas.ParamByName('dt_prova').AsString := FormatDateTime('yyyy-mm-dd', dtpData.Date);
   end
   else if chkDescricao.Checked then
   begin
      qryProvas.SQL.Text := SQL_GET_PROVAS_DESC;
      qryProvas.ParamByName('ds_prova').AsString := '%' + edtDescricao.Text + '%';
   end
   else
   begin
      qryProvas.SQL.Text := SQL_GET_PROVAS;
   end;
   qryProvas.Open;
end;

procedure TfPIntBuscaProvas.btnSairClick(Sender: TObject);
begin
   FICodigoProva := -1;
   Close;
end;

procedure TfPIntBuscaProvas.btnSelecionarClick(Sender: TObject);
begin
   FICodigoProva := qryProvas.FieldByName('cd_prova').AsInteger;
   Close;
end;

procedure TfPIntBuscaProvas.chkAnoSemClick(Sender: TObject);
begin
   meAnoSem.Enabled := chkAnoSem.Checked;
   udAnoSem.Enabled := chkAnoSem.Checked;
end;

procedure TfPIntBuscaProvas.chkDataClick(Sender: TObject);
begin
   dtpData.Enabled := chkData.Enabled;
end;

procedure TfPIntBuscaProvas.chkDescricaoClick(Sender: TObject);
begin
   edtDescricao.Enabled := chkDescricao.Enabled;
end;

procedure TfPIntBuscaProvas.dbgProvasDblClick(Sender: TObject);
begin
   FICodigoProva := qryProvas.FieldByName('cd_prova').AsInteger;
   Close;
end;

procedure TfPIntBuscaProvas.dbgProvasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[boolean] of integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   LRect: TRect;
begin
   if Column.FieldName = 'sn_finalizada' then
   begin
      LRect := Rect;
      InflateRect(LRect, -1, -1);
      dbgProvas.Canvas.FillRect(LRect);
      DrawFrameControl(
         dbgProvas.Canvas.Handle, LRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger = 1]);
   end;
end;

procedure TfPIntBuscaProvas.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      btnFiltrarClick(nil);
end;

procedure TfPIntBuscaProvas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM.Set_Parametro_usuario(chkAnoSem, Name);
   DM.Set_Parametro_usuario(chkData, Name);
   DM.Set_Parametro_usuario(chkDescricao, Name);
   DM.Set_Parametro_usuario(edtDescricao, Name);
   DM.Set_Parametro_usuario(meAnoSem, Name);
   DM.Set_Parametro_usuario_valor(dtpData.Name, FormatDateTime('dd/mm/yyyy', dtpData.Date), Name);
end;

procedure TfPIntBuscaProvas.FormCreate(Sender: TObject);
var
   LSValor: string;
begin
   FICodigoProva := -1;
   DM.Get_Parametro_usuario(chkAnoSem, Name);
   DM.Get_Parametro_usuario(chkData, Name);
   DM.Get_Parametro_usuario(chkDescricao, Name);
   LSValor := DM.Get_Parametro_usuario_valor(meAnoSem.Name, Name);
   if Trim(LSValor) <> '' then
      meAnoSem.Text := LSValor
   else
      meAnoSem.Text := Format('%d', [DM.GetAnoSemestreAtual]);
   LSValor := DM.Get_Parametro_usuario_valor(dtpData.Name, Name);
   if Trim(LSValor) <> '' then
      dtpData.Date := StrToDate(LSValor);
   edtDescricao.Text := DM.Get_Parametro_usuario_valor(edtDescricao.Name, Name);
end;

procedure TfPIntBuscaProvas.qryProvasAfterOpen(DataSet: TDataSet);
begin
   btnSelecionar.Enabled := not qryProvas.IsEmpty;
end;

procedure TfPIntBuscaProvas.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSem.Text := DM.incrementar_ano_semestre(meAnoSem.Text)
   else
      meAnoSem.Text := DM.decrementar_ano_semestre(meAnoSem.Text);
end;

class function TfPIntBuscaProvas.GetProva(AOwner: TComponent): integer;
begin
   if not Assigned(fPIntBuscaProvas) then
      fPIntBuscaProvas := TfPIntBuscaProvas.Create(AOwner);
   fPIntBuscaProvas.ShowModal;
   try
      Result := fPIntBuscaProvas.CodigoProva;
   finally
      FreeAndNil(fPIntBuscaProvas);
   end;
end;

end.

