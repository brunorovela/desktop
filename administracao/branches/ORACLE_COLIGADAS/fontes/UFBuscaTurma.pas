unit UFBuscaTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, DB, ZAbstractRODataset, UZDataset,
  DBCtrls, Buttons, Grids, DBGrids;

type
  TfBuscaTurma = class(TForm)
    pnlTitle: TPanel;
    bvlSep1: TBevel;
    qryUnits: TUMZReadOnlyQuery;
    qryUnitsCD_COLIGADA: TIntegerField;
    qryUnitsNM_COLIGADA: TStringField;
    dsUnits: TDataSource;
    qryDepts: TUMZReadOnlyQuery;
    dsDepts: TDataSource;
    qryCourses: TUMZReadOnlyQuery;
    dsCourses: TDataSource;
    pnlAll: TPanel;
    pnlFilters: TPanel;
    lblUnit: TLabel;
    lblDept: TLabel;
    lblCourse: TLabel;
    pnlCustomFilter: TPanel;
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
    dblcUnits: TDBLookupComboBox;
    dblcDepts: TDBLookupComboBox;
    dblcCourses: TDBLookupComboBox;
    bvlSep2: TBevel;
    pnlBotoes: TPanel;
    bvlSep3: TBevel;
    sbSelecionar: TSpeedButton;
    sbFechar: TSpeedButton;
    dbgClasses: TDBGrid;
    qryViewClasses: TUMZReadOnlyQuery;
    qryUnitsCD_PESSOA: TIntegerField;
    qryDeptsCD_DEPTO: TSmallintField;
    qryDeptsDS_DEPTO: TStringField;
    qryDeptsCD_PESSOA: TIntegerField;
    qryDeptsCD_COLIGADA: TIntegerField;
    qryCoursesCD_CURSO: TStringField;
    qryCoursesCD_COLIGADA: TSmallintField;
    qryCoursesCD_DEPTO: TSmallintField;
    dsViewClasses: TDataSource;
    qryViewClassesCD_TURMA: TStringField;
    qryViewClassesNR_ANOSEMESTRE: TSmallintField;
    qryViewClassesCD_SITUACAO: TSmallintField;
    qryViewClassesCD_COLIGADA: TIntegerField;
    qryViewClassesCD_DEPTO: TSmallintField;
    qryViewClassesCD_CURSO: TStringField;
    qryViewClassesDT_INICIO: TDateTimeField;
    qryViewClassesDT_FIM: TDateTimeField;
    qryViewClassesSN_ATIVA: TSmallintField;
    qryViewClassesNM_COLIGADA: TStringField;
    qryStatus: TUMZReadOnlyQuery;
    qryStatusCODIGO: TLargeintField;
    qryStatusCD_MODULO: TLargeintField;
    qryStatusCD_SITUACAO: TIntegerField;
    qryStatusDS_VALOR: TStringField;
    qryStatusDS_SIGLA: TStringField;
    qryViewClassesDS_SITUACAO: TStringField;
    procedure dsUnitsDataChange(Sender: TObject; Field: TField);
    procedure dbgClassesDblClick(Sender: TObject);
    procedure sbSelecionarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpFinalDateChange(Sender: TObject);
    procedure dtpInitDateChange(Sender: TObject);
    procedure chkFinalDateClick(Sender: TObject);
    procedure chkInitDateClick(Sender: TObject);
    procedure chkActiveClassesClick(Sender: TObject);
    procedure dbgClassesTitleClick(Column: TColumn);
    procedure udYearSemesterClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      procedure DoFilter;
  public
    { Public declarations }
      class function SelectClass: Boolean;
  end;

var
  fBuscaTurma: TfBuscaTurma;

implementation

uses
   UDM;

{$R *.dfm}

procedure TfBuscaTurma.chkActiveClassesClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaTurma.chkFinalDateClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaTurma.chkInitDateClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaTurma.dbgClassesDblClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfBuscaTurma.dbgClassesTitleClick(Column: TColumn);
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

      SortedFields.DelimitedText := qryViewClasses.IndexFieldNames;

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

      qryViewClasses.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfBuscaTurma.DoFilter;
const
   SOp = ' AND ';
var
   Filter: string;
begin
   Filter := '';
   if dblcUnits.KeyValue <> Null then
      Filter := Format('CD_COLIGADA = %d', [qryUnitsCD_COLIGADA.AsInteger]);

   if dblcDepts.KeyValue <> Null then
   begin
      if Filter <> '' then
         Filter := Filter + SOp;
      Filter := Filter + Format('CD_DEPTO = %d', [qryDeptsCD_DEPTO.AsInteger]);
   end;

   if dblcCourses.KeyValue <> Null then
   begin
      if Filter <> '' then
         Filter := Filter + SOp;
      Filter := Filter + Format('CD_CURSO = %s', [QuotedStr(qryCoursesCD_CURSO.AsString)]);
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

   qryViewClasses.Filter := Filter;
   if not qryViewClasses.Active then qryViewClasses.Open;
end;

procedure TfBuscaTurma.dsUnitsDataChange(Sender: TObject; Field: TField);
begin
   if TDBLookupComboBox(Sender).KeyValue <> Null then DoFilter;
end;

procedure TfBuscaTurma.dtpFinalDateChange(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaTurma.dtpInitDateChange(Sender: TObject);
begin
   DoFilter;
end;

procedure TfBuscaTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfBuscaTurma.FormCreate(Sender: TObject);
begin
   if DM.UseYearSemester then
   begin
      pnlFilterYearSemester.Align := alClient;
      pnlFilterYearSemester.Visible := True;
      pnlFilterPeriod.Visible := False;
   end
   else
   begin
      pnlFilterPeriod.Align := alClient;
      pnlFilterPeriod.Visible := True;
      pnlFilterYearSemester.Visible := False;
   end;
   meYearSemester.Text := DM.GetCurrYearSemester;
   qryUnits.ParamByName('CD_PESSOA').AsInteger := DM.qryUsuarioCD_PESSOA.AsInteger;
   qryUnits.Open;
   qryDepts.Open;
   qryCourses.Open;
   qryStatus.Open;
end;

procedure TfBuscaTurma.FormDestroy(Sender: TObject);
begin
   qryViewClasses.Close;
   qryCourses.Close;
   qryDepts.Close;
   qryUnits.Close;
end;

procedure TfBuscaTurma.sbFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfBuscaTurma.sbSelecionarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

class function TfBuscaTurma.SelectClass: Boolean;
begin
   if fBuscaTurma = nil then
      Application.CreateForm(TfBuscaTurma, fBuscaTurma);
   Result := fBuscaTurma.ShowModal = mrOk;
end;

procedure TfBuscaTurma.udYearSemesterClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meYearSemester.Text := DM.IncYearSemester(meYearSemester.Text)
   else if Button = btPrev then
      meYearSemester.Text := DM.DecYearSemester(meYearSemester.Text);
   DoFilter;
end;

end.
