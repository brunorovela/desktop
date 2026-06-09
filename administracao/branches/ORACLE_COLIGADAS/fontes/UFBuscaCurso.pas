unit UFBuscaCurso;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, Grids, DBGrids, Buttons, DB,
   ZAbstractRODataset, UZDataset;

type
   TfBuscaCurso = class(TForm)
      pnlTitle: TPanel;
      pnlAll: TPanel;
      pnlFilters: TPanel;
      pnlFilter: TPanel;
      lblFilter: TLabel;
      edtFilter: TEdit;
      bvlSep1: TBevel;
      pnlFilterYearSemester: TPanel;
      lblYearSemester: TLabel;
      meYearSemester: TMaskEdit;
      udYearSemester: TUpDown;
      pnlFilterPeriod: TPanel;
      chkActiveClasses: TCheckBox;
      chkInitDate: TCheckBox;
      dtpInitDate: TDateTimePicker;
      chkFinalDate: TCheckBox;
      dtpFinalDate: TDateTimePicker;
      pnlButtons: TPanel;
      bvlSep2: TBevel;
      dbgCourses: TDBGrid;
      sbSelecionar: TSpeedButton;
      sbFechar: TSpeedButton;
      qryCourses: TUMZReadOnlyQuery;
      dsCourses: TDataSource;
      qryCoursesCD_CURSO: TStringField;
      qryCoursesDS_CURSO: TStringField;
      qryCoursesNM_COLIGADA: TStringField;
      qryCoursesNR_ANOSEMESTRE: TSmallintField;
      qryCoursesDT_INICIO: TDateTimeField;
      qryCoursesDT_FIM: TDateTimeField;
      qryCoursesSN_ATIVA: TSmallintField;
    procedure dbgCoursesTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgCoursesDblClick(Sender: TObject);
      procedure dtpInitDateChange(Sender: TObject);
      procedure dtpFinalDateChange(Sender: TObject);
      procedure chkInitDateClick(Sender: TObject);
      procedure chkFinalDateClick(Sender: TObject);
      procedure chkActiveClassesClick(Sender: TObject);
      procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
      procedure sbFecharClick(Sender: TObject);
      procedure sbSelecionarClick(Sender: TObject);
      procedure udYearSemesterClick(Sender: TObject; Button: TUDBtnType);
      procedure FormCreate(Sender: TObject);
      procedure DoFilter;
   public
      class function SelectCourse: Boolean;
   end;

var
   fBuscaCurso: TfBuscaCurso;

implementation

uses
   UDM;

{$R *.dfm}

procedure TfBuscaCurso.chkActiveClassesClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaCurso.chkFinalDateClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaCurso.chkInitDateClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaCurso.dbgCoursesDblClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfBuscaCurso.dbgCoursesTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
 
      SortedFields.NameValueSeparator := ' ';
 
      SortedFields.DelimitedText := qryCourses.IndexFieldNames;
 
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
 
      qryCourses.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfBuscaCurso.DoFilter;
const
   SOp = ' AND ';
var
   Filter, S: string;
begin
   Filter := '';

   if Trim(edtFilter.Text) <> '' then
   begin
      S := QuotedStr('*' + edtFilter.Text + '*');
      Filter := Format('(CD_CURSO LIKE %s OR DS_CURSO LIKE %s)', [S, S]);
   end;

   if pnlFilterYearSemester.Visible then
   begin
      if Filter <> '' then
         Filter := Filter + SOp;
      Filter := Filter + Format('NR_ANOSEMESTRE = %s', [meYearSemester.Text]);
   end
   else
   begin
      if Filter <> '' then
         Filter := Filter + SOp;
      Filter := Filter + Format('SN_ATIVA = %d', [Ord(chkActiveClasses.Checked)]);
      if chkInitDate.Checked then
      begin
         Filter := Filter + SOp;
         Filter := Filter + Format('DT_INICIO >= %s', [QuotedStr(FormatDateTime('yyyy-mm-dd', dtpInitDate.Date))]);
      end;
      if chkFinalDate.Checked then
      begin
         Filter := Filter + SOp;
         Filter := Filter + Format('DT_FIM <= %s', [QuotedStr(FormatDateTime('yyyy-mm-dd', dtpFinalDate.Date))]);
      end;
   end;

   qryCourses.Filter := Filter;
   if not qryCourses.Active then qryCourses.Open;
end;

procedure TfBuscaCurso.dtpFinalDateChange(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaCurso.dtpInitDateChange(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaCurso.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then DoFilter;
end;

procedure TfBuscaCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfBuscaCurso.FormCreate(Sender: TObject);
begin
   if DM.UseYearSemester then
   begin
      pnlFilterYearSemester.Align := alClient;
      pnlFilterYearSemester.Visible := True;
      pnlFilterPeriod.Visible := False;
      meYearSemester.Text := DM.GetCurrYearSemester;
   end
   else
   begin
      pnlFilterPeriod.Align := alClient;
      pnlFilterPeriod.Visible := True;
      pnlFilterYearSemester.Visible := False;
      dtpInitDate.Date := Date;
      dtpFinalDate.Date := Date;
   end;
   qryCourses.ParamByName('CD_PESSOA').AsInteger := DM.qryUsuarioCD_PESSOA.AsInteger;
   DoFilter;
end;

procedure TfBuscaCurso.sbFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfBuscaCurso.sbSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

class function TfBuscaCurso.SelectCourse: Boolean;
begin
   if fBuscaCurso = nil then
      Application.CreateForm(TfBuscaCurso, fBuscaCurso);
   Result := fBuscaCurso.ShowModal = mrOk;
end;

procedure TfBuscaCurso.udYearSemesterClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meYearSemester.Text := DM.IncYearSemester(meYearSemester.Text)
   else if Button = btPrev then
      meYearSemester.Text := DM.DecYearSemester(meYearSemester.Text);
   DoFilter;
end;

end.
