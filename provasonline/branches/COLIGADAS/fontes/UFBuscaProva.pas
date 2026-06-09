unit UFBuscaProva;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ComCtrls, ToolWin, ImgList, Grids,
   DBGrids, DB, ZAbstractRODataset, UZDataset, DBCtrls, UMComboBox,
   ZAbstractDataset, uItemCombo;

type
   TfBuscaProva = class(TForm)
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      pnlFiltros: TPanel;
      lblResp: TLabel;
      lblAnoSem: TLabel;
      meAnoSem: TMaskEdit;
      udAnoSem: TUpDown;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnSelecionar: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      ilBotoes: TImageList;
      bvlSep3: TBevel;
      dbgProvas: TDBGrid;
      qryProvas: TUMZReadOnlyQuery;
      dsProvas: TDataSource;
      qryProvasDS_SN_AVALIACAO: TStringField;
      qryProfessores: TUMZReadOnlyQuery;
      qryProfessoresCD_PESSOA: TIntegerField;
      qryProfessoresNM_PESSOA: TStringField;
      dsProfessores: TDataSource;
      lblDisc: TLabel;
      qryDisciplinas: TUMZReadOnlyQuery;
      qryProvasCD_DISCIPLINA_PAI: TStringField;
      qryProvasDS_PROVA: TStringField;
      qryProvasDT_INICIO: TDateTimeField;
      qryProvasDT_FIM: TDateTimeField;
      qryProvasSN_AVALIACAO: TSmallintField;
      qryProvasNM_RESPONSAVEL: TStringField;
      dsDisciplinas: TDataSource;
      qryDisciplinasCD_DISCIPLINA_PAI: TStringField;
      qryDisciplinasDS_DISCIPLINA: TStringField;
      qryProvasDS_DISCIPLINA: TStringField;
      qryDisciplinasCD_RESPONSAVEL: TIntegerField;
      qryProvasCD_PROVA: TIntegerField;
      qryProvasCD_RESPONSAVEL: TIntegerField;
      btnArquivos: TToolButton;
      qryProvasDS_AVALIACAO: TStringField;
      qryTipoProva: TUMZQuery;
      cbTipoProva: TUMComboBox;
      Label1: TLabel;
      qryProvasCD_AVALIACAO_TIPO: TIntegerField;
      qryTipoProvacd_avaliacao_tipo: TIntegerField;
      qryTipoProvads_avaliacao: TStringField;
    cbProfessores: TUMComboBox;
    cbDisciplinas: TUMComboBox;
    qryDisciplinasCD_DISCIPLINA: TIntegerField;
    procedure cbDisciplinasChange(Sender: TObject);
    procedure cbProfessoresChange(Sender: TObject);
      procedure cbTipoProvaChange(Sender: TObject);
      procedure btnArquivosClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnSelecionarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure dbgProvasTitleClick(Column: TColumn);
      procedure meAnoSemChange(Sender: TObject);
      procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
      procedure FormCreate(Sender: TObject);
      procedure qryProvasCalcFields(DataSet: TDataSet);
      procedure filtrar_prova();
      procedure filtrar_disciplinas();
      procedure filtrar_professores();
   end;

var
   fBuscaProva: TfBuscaProva;

implementation

uses
   UDM, UFArquivosProva, uUsuario;

{$R *.dfm}

procedure TfBuscaProva.btnArquivosClick(Sender: TObject);
begin
   TfArquivosProva.ShowFiles(qryProvasCD_PROVA.AsInteger);
end;

procedure TfBuscaProva.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfBuscaProva.btnSelecionarClick(Sender: TObject);
begin
   if not qryProvas.IsEmpty then
   begin
      ModalResult := mrOk;
      CloseModal;
   end;
end;

procedure TfBuscaProva.cbDisciplinasChange(Sender: TObject);
begin
   filtrar_prova();
end;

procedure TfBuscaProva.cbProfessoresChange(Sender: TObject);
begin
   filtrar_disciplinas();
   filtrar_prova();
end;

procedure TfBuscaProva.cbTipoProvaChange(Sender: TObject);
begin
   filtrar_prova();
end;

procedure TfBuscaProva.dbgProvasTitleClick(Column: TColumn);
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
 
      SortedFields.DelimitedText := qryProvas.IndexFieldNames;
 
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
 
      qryProvas.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfBuscaProva.filtrar_disciplinas;
CONST
   DS_SQL = 'SELECT DISTINCT '
            +'   M.CD_DISCIPLINA_PAI, '
            +'   D.CODIGO CD_DISCIPLINA, '
            +'   M.DS_DISCIPLINA,'
            +'   T.PROFESSOR CD_RESPONSAVEL   '
            +' FROM '
            +'   DISCIPLINAS_MESTRE M '
            +    ' JOIN POL_PROVAS P ON '
            +     '    (M.CD_DISCIPLINA_PAI = P.CD_DISCIPLINA_PAI) '
            +     ' JOIN DISCIPLINAS D ON '
            +     '   (M.CD_DISCIPLINA_PAI = D.CD_DISCIPLINA_PAI) '
            +     '    JOIN TURMASPROFESSORES T ON '
            +     '       (P.NR_ANOSEMESTRE = T.ANOSEMESTRE) AND '
            +     '       (D.CURSO = T.CURSO) AND '
            +     '       (D.CODIGO = T.DISCIPLINA) AND '
            +     '       (P.CD_RESPONSAVEL = T.PROFESSOR) '
            +' WHERE '
            +'   M.SN_ATIVA = 1 AND '
            +'   P.NR_ANOSEMESTRE = :NR_ANOSEMESTRE ';
begin
   qryDisciplinas.Close;
   qryDisciplinas.SQL.Clear;

   qryDisciplinas.SQL.Add( DS_SQL );
   qryDisciplinas.ParamByName('NR_ANOSEMESTRE').AsInteger := meAnoSem.Tag;


   //Irá filtrar apenas disciplinas do professor selecionado
   if ( (cbProfessores.Text <> '') AND ( cbProfessores.ItemIndex <> 0 ) ) then
   begin
      qryDisciplinas.SQL.Add(
         ' AND P.CD_RESPONSAVEL = '
         + TItemCombo(
              cbProfessores.Items.Objects[cbProfessores.ItemIndex]
           ).getCodigo()
      );
   end;
 
   qryDisciplinas.SQL.Add( ' GROUP BY M.CD_DISCIPLINA_PAI ' );

   qryDisciplinas.Open;

   cbDisciplinas.Clear;
   cbDisciplinas.Items.AddObject( 'TODOS', TItemCombo.Create('0', 'TODOS') );
   cbDisciplinas.ItemIndex := 0;
   
   while not qryDisciplinas.Eof do
   begin
      cbDisciplinas.Items.AddObject(
         qryDisciplinas.FieldByName('DS_DISCIPLINA').AsString
         + '('
         +  qryDisciplinas.FieldByName('CD_DISCIPLINA').AsString
         + ')',
         TItemCombo.Create(
           qryDisciplinas.FieldByName('CD_DISCIPLINA_PAI').AsString,
           qryDisciplinas.FieldByName('DS_DISCIPLINA').AsString
         )
      );
      qryDisciplinas.Next();
   end;
   qryDisciplinas.Close();
end;

procedure TfBuscaProva.filtrar_professores;
begin
   qryProfessores.Close;
   qryProfessores.ParamByName('NR_ANOSEMESTRE').AsInteger := meAnoSem.Tag;
   qryProfessores.Open;

   cbProfessores.Clear;
   cbProfessores.Items.AddObject( 'TODOS', TItemCombo.Create('0', 'TODOS') );
   cbProfessores.ItemIndex := 0;

   while not qryProfessores.Eof do
   begin
      cbProfessores.Items.AddObject(
         qryProfessores.FieldByName('NM_PESSOA').AsString,
         TItemCombo.Create(
           qryProfessores.FieldByName('CD_PESSOA').AsString,
           qryProfessores.FieldByName('NM_PESSOA').AsString
         )
      );
      qryProfessores.Next();
   end;
   qryProfessores.Close();
end;

procedure TfBuscaProva.filtrar_prova;
var
   ds_operador : String;
begin
   qryProvas.Close;
   qryProvas.SQL.Clear;
   qryProvas.DisableControls;

   qryProvas.SQL.Add(
        ' SELECT  '
      + '    R.CD_PROVA, '
      + '    R.CD_RESPONSAVEL,'
      + '    R.CD_DISCIPLINA_PAI, '
      + '    R.DS_PROVA, '
      + '    R.DT_INICIO, '
      + '    R.DT_FIM, '
      + '    R.SN_AVALIACAO,  '
      + '    A.DS_AVALIACAO, '
      + '    R.CD_AVALIACAO_TIPO '
      + ' FROM '
      + '    POL_PROVAS R '
      + ' JOIN AVALIACOES_TIPOS A ON '
      + '    ( R.CD_AVALIACAO_TIPO = A.CD_AVALIACAO_TIPO ) '
      + ' WHERE '
      + '   R.SN_ATIVO = 1 '
   );

   ds_operador := ' AND ';

   if ( trim(meAnoSem.Text) <> '' ) then
   begin
      qryProvas.SQL.Add(
           ds_operador
         + ' R.NR_ANOSEMESTRE = '
         + meAnoSem.Text
      );
   end;

   if ( (cbProfessores.Text <> '') AND ( cbProfessores.ItemIndex <> 0 ) ) then
   begin
      qryProvas.SQL.Add(
           ds_operador
         + ' R.CD_RESPONSAVEL = '
         + TItemCombo(
              cbProfessores.Items.Objects[cbProfessores.ItemIndex]
           ).getCodigo()
      );
   end;

   if ( (cbDisciplinas.Text <> '') AND ( cbDisciplinas.ItemIndex <> 0 ) ) then
   begin
      qryProvas.SQL.Add(
           ds_operador
         + ' R.CD_DISCIPLINA_PAI = "'
         + TItemCombo(
              cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]
           ).getCodigo()
         + '"'
      );
   end;

   if ( (cbTipoProva.Text <> '') AND ( cbTipoProva.ItemIndex <> 0 ) ) then
   begin
      qryProvas.SQL.Add(
           ds_operador
         + ' R.CD_AVALIACAO_TIPO = '
         + TItemCombo(
              cbTipoProva.Items.Objects[cbTipoProva.ItemIndex]
           ).getCodigo()
      );
   end;

   qryProvas.Open;
   qryProvas.EnableControls;
end;

procedure TfBuscaProva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfBuscaProva.FormCreate(Sender: TObject);
begin
   meAnoSem.Tag  := DM.CurrYearSemester;
   meAnoSem.Text := Format('%d', [meAnoSem.Tag]);
end;

procedure TfBuscaProva.FormShow(Sender: TObject);
begin
   btnArquivos.Enabled := DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo,
      'ProvaOnline.Desktop.Impressao.Selecao.Download',
      npAcesso,
      False
   );

   cbTipoProva.Clear;
   qryTipoProva.Open();
   cbTipoProva.Items.AddObject( 'TODOS', TItemCombo.Create('0', 'TODOS') );
   cbTipoProva.ItemIndex := 0;
   while not qryTipoProva.Eof do
   begin
      cbTipoProva.Items.AddObject(
         qryTipoProva.FieldByName('ds_avaliacao').AsString,
         TItemCombo.Create(
           qryTipoProva.FieldByName('cd_avaliacao_tipo').AsString,
           qryTipoProva.FieldByName('ds_avaliacao').AsString
         )
      );
      qryTipoProva.Next();
   end;
   qryTipoProva.Close();
end;

procedure TfBuscaProva.meAnoSemChange(Sender: TObject);
begin
   filtrar_professores();
   filtrar_disciplinas();
   filtrar_prova();
end;

procedure TfBuscaProva.qryProvasCalcFields(DataSet: TDataSet);
begin
   if qryProvasSN_AVALIACAO.AsInteger = 0 then
      qryProvasDS_SN_AVALIACAO.AsString := 'Trabalho'
   else if qryProvasSN_AVALIACAO.AsInteger = 1 then
      qryProvasDS_SN_AVALIACAO.AsString := 'Prova online'
   else if qryProvasSN_AVALIACAO.AsInteger = 2 then
      qryProvasDS_SN_AVALIACAO.AsString := 'Prova presencial';
end;

procedure TfBuscaProva.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then meAnoSem.Tag := DM.IncYearSemester(meAnoSem.Tag)
   else meAnoSem.Tag := DM.DecYearSemester(meAnoSem.Tag);
   meAnoSem.Text := Format('%d', [meAnoSem.Tag]);
end;

end.
