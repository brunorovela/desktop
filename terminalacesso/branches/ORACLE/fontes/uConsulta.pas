unit uConsulta;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, Buttons, ImgList, DBCtrls, ComCtrls, ToolWin, ZConnection, Grids,
   DBGrids, StdCtrls, ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
   UZDataset, General, uFSelecionarPessoa, Mask, UDateTimePicker, UZSortedGrid,
   ZDbcIntfs, UZDbcFuncs;

type
   TfrmConsulta = class(TForm)
      bbtnFiltrar: TBitBtn;
      bbtnLimpar: TBitBtn;
      btnFechar: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      cbFiltroTipo: TComboBox;
      dbgRegistros: TDBGrid;
      dblcFiltroCatracaEntrada: TDBLookupComboBox;
      dblcFiltroCatracaSaida: TDBLookupComboBox;
      dsCatracaEntrada: TDataSource;
      dsCatracaSaida: TDataSource;
      dsRegistros: TDataSource;
      dtpFiltroDataFinal: TDateTimePicker;
      dtpFiltroDataInicio: TDateTimePicker;
      edtFiltroPessoaCodigo: TEdit;
      edtFiltroPessoaNome: TEdit;
      ilOpcoes: TImageList;
      lblFiltroAnoSem: TLabel;
      lblFiltroCatracaEntrada: TLabel;
      lblFiltroCatracaSaida: TLabel;
      lblFiltroDataFinal: TLabel;
      lblFiltroDataInicio: TLabel;
      lblFiltroPessoa: TLabel;
      lblFiltroTipo: TLabel;
      meAnoSem: TMaskEdit;
      pnlFiltros: TPanel;
      pnlTitulo: TPanel;
      qryCatracaEntrada: TZReadOnlyQuery;
      qryCatracaEntradaCD_CATRACA: TLargeintField;
      qryCatracaEntradaNM_CATRACA: TStringField;
      qryCatracaSaida: TZReadOnlyQuery;
      qryCatracaSaidaCD_CATRACA: TLargeintField;
      qryCatracaSaidaNM_CATRACA: TStringField;
      qryRegistros: TZReadOnlyQuery;
      qryRegistrosCD_CATRACA_ENTRADA: TLargeintField;
      qryRegistrosCD_CATRACA_SAIDA: TLargeintField;
      qryRegistrosCD_PESSOA: TIntegerField;
      qryRegistrosCODIGO: TIntegerField;
      qryRegistrosDS_ESPECIAL: TStringField;
      qryRegistrosDS_SITUACAO: TStringField;
      qryRegistrosDS_TIPO: TStringField;
      qryRegistrosDT_ENTRADA: TDateTimeField;
      qryRegistrosDT_REGISTRO: TDateField;
      qryRegistrosDT_SAIDA: TDateTimeField;
      qryRegistrosHR_ENTRADA: TStringField;
      qryRegistrosHR_SAIDA: TStringField;
      qryRegistrosNM_CATRACA_ENTRADA: TStringField;
      qryRegistrosNM_CATRACA_SAIDA: TStringField;
      qryRegistrosNM_PESSOA: TStringField;
      qryRegistrosNR_ANOSEMESTRE: TIntegerField;
      qryRegistrosSN_ESPECIAL: TSmallintField;
      qryRegistrosSN_FINALIZADO: TSmallintField;
      sbFiltroBuscaPessoa: TSpeedButton;
      tlbOpcoes: TToolBar;
      udAnoSem: TUpDown;
    Button1: TButton;
    qryRegistrosCD_RESPONSAVEL: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure dbgRegistrosTitleClick(Column: TColumn);
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure bbtnLimparClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure edtFiltroPessoaCodigoExit(Sender: TObject);
      procedure edtFiltroPessoaCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure sbFiltroBuscaPessoaClick(Sender: TObject);
      procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
   private
      procedure ApplyFilters;
      procedure CleanFilters;
   end;

var
   frmConsulta: TfrmConsulta;
   nr_coluna : Integer;
implementation

{$R *.dfm}

uses
   uDM;

procedure TfrmConsulta.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      meAnoSem.Text := DM.incrementar_ano_semestre(meAnoSem.Text);
   end;
   
   if Button = btPrev then
   begin
      meAnoSem.Text := DM.decrementar_ano_semestre(meAnoSem.Text);
   end;
end;

procedure TfrmConsulta.ApplyFilters;
const
   SSQLSelectRecords = ''
      + 'SELECT '
      + '    d.CODIGO, '
      + '    d.CD_PESSOA, '
      + '    d.NR_ANOSEMESTRE, '
      + '    d.DT_ENTRADA, '
      + '    d.DT_SAIDA, '
      + '    d.SN_ESPECIAL, '
      + '    d.SN_FINALIZADO, '
      + '    d.CD_CATRACA_ENTRADA, '
      + '    d.CD_CATRACA_SAIDA, '
      + '    p2.NM_PESSOA AS CD_RESPONSAVEL, '
      + '    DATE(d.DT_ENTRADA) DT_REGISTRO, '
      + '    DATE_FORMAT(d.DT_ENTRADA, ''%%H:%%i:%%s'') HR_ENTRADA, '
      + '    DATE_FORMAT(d.DT_SAIDA, ''%%H:%%i:%%s'') HR_SAIDA, '
      + '    CASE '
      + '        WHEN d.DT_SAIDA IS NULL THEN ''ENTRADA'' '
      + '        ELSE ''ENTRADA/SAÍDA'' '
      + '    END DS_TIPO, '
      + '    CASE '
      + '        WHEN d.SN_ESPECIAL = 1 THEN ''ESPECIAL'' '
      + '        ELSE ''ALUNO'' '
      + '    END DS_ESPECIAL, '
      + '    CASE '
      + '        WHEN d.SN_FINALIZADO = 0 THEN ''ABERTO'' '
      + '        WHEN d.SN_FINALIZADO = 1 THEN ''REGISTRADO'' '
      + '        WHEN d.SN_FINALIZADO = 2 THEN ''FINALIZADO'' '
      + '        ELSE '''' '
      + '    END DS_SITUACAO, '
      + '    ce.NM_CATRACA NM_CATRACA_ENTRADA, '
      + '    cs.NM_CATRACA NM_CATRACA_SAIDA, '
      + '    p.NM_PESSOA '
      + 'FROM '
      + '    diario_terminal_acessos d '
      + '        JOIN pessoas p ON '
      + '            (d.CD_PESSOA = p.CD_PESSOA) '
      + '        LEFT JOIN pessoas p2 ON '
      + '            (d.cd_responsavel = p2.CD_PESSOA) '
      + '        LEFT JOIN ta_catraca ce ON '
      + '            (d.CD_CATRACA_ENTRADA = ce.CD_CATRACA) '
      + '        LEFT JOIN ta_catraca cs ON '
      + '            (d.CD_CATRACA_SAIDA = cs.CD_CATRACA) '
      + 'WHERE '
      + '    %s '
      + 'ORDER BY d.DT_ENTRADA Desc, d.dt_saida DESC';
   SFiltroAnoSemFmt = 'd.NR_ANOSEMESTRE = %s';
   SFiltroDataDeFmt = 'd.DT_ENTRADA >= ''%s''';
   SFiltroDataAteFmt = 'd.DT_ENTRADA <= ''%s''';
   SFiltroPresentes = 'd.SN_FINALIZADO = 0 AND d.DT_SAIDA IS NULL';
   SFiltroEntradas = 'd.SN_FINALIZADO IN (0, 1) AND d.DT_SAIDA IS NOT NULL';
   SFiltroSaidas = 'd.SN_FINALIZADO IN (0, 1) AND d.DT_SAIDA IS NOT NULL';
   SFiltroFinalizados = 'd.SN_FINALIZADO = 2';
   SFiltroPessoaFmt = 'd.CD_PESSOA = %s';
   SFiltroCatracaEntradaFmt = 'd.CD_CATRACA_ENTRADA = %s';
   SFiltroCatracaSaidaFmt = 'd.CD_CATRACA_SAIDA = %s';
   SDateTimeToIsoFmt = 'yyyy-mm-dd hh:nn:ss';
   FiltroTipoByIndex: array[0..4] of AnsiString = (SFiltroPresentes,
      SFiltroEntradas, SFiltroSaidas, SFiltroFinalizados, '');
var
   Filters: TStrings;
   S: AnsiString;
   I: Integer;
begin
   Filters := TStringList.Create;
   try
      if Trim(meAnoSem.Text) <> EmptyStr then
      begin
         S := Format(SFiltroAnoSemFmt, [meAnoSem.Text]);
         Filters.Add(S);
      end;

      if dtpFiltroDataInicio.Checked then
      begin
         S := FormatDateTime(SDateTimeToIsoFmt, dtpFiltroDataInicio.DateTime);
         S := Format(SFiltroDataDeFmt, [S]);
         Filters.Add(S);
      end;

      if dtpFiltroDataFinal.Checked then
      begin
         S := FormatDateTime(SDateTimeToIsoFmt, dtpFiltroDataFinal.DateTime);
         S := Format(SFiltroDataAteFmt, [S]);
         Filters.Add(S);
      end;

      S := FiltroTipoByIndex[cbFiltroTipo.ItemIndex];

      if S <> '' then
      begin
         Filters.Add(S);
      end;

      if edtFiltroPessoaCodigo.Text <> '' then
      begin
         S := Format(SFiltroPessoaFmt, [edtFiltroPessoaCodigo.Text]);
         Filters.Add(S);
      end;

      if dblcFiltroCatracaEntrada.KeyValue <> Null then
      begin
         S := Format(SFiltroCatracaEntradaFmt, [dblcFiltroCatracaEntrada.KeyValue]);
         Filters.Add(S);
      end;

      if dblcFiltroCatracaSaida.KeyValue <> Null then
      begin
         S := Format(SFiltroCatracaSaidaFmt, [dblcFiltroCatracaSaida.KeyValue]);
         Filters.Add(S);
      end;

      S := '';

      if Filters.Count > 0 then
      begin

         for I := 0 to Filters.Count - 1 do
         begin
            if S <> '' then
               S := S + ' AND ';
            S := S + Filters[I];
         end;

         S := Format(SSQLSelectRecords, [S]);

         qryRegistros.Close;
         qryRegistros.SQL.Text := S;
         qryRegistros.Open;
      end;
   finally
      FreeAndNil(Filters);
   end;
end;

procedure TfrmConsulta.bbtnFiltrarClick(Sender: TObject);
begin
   ApplyFilters;
end;

procedure TfrmConsulta.bbtnLimparClick(Sender: TObject);
begin
   CleanFilters;
end;

procedure TfrmConsulta.btnFecharClick(Sender: TObject);
begin
   Close;
end;



procedure TfrmConsulta.Button1Click(Sender: TObject);
var
   codigo : string;
   resultado_filtro : TResultadoFiltroPessoa;
   qryAtualiza : TUMZQuery;
begin

   //verifica se está selecionado algo no dbgrid
   if qryRegistrosCODIGO.AsInteger >= 1 Then
   begin
      codigo:= qryRegistrosCODIGO.AsString;
      resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa);
   end
   else
   begin
      Mensagem('Por favor, selecione um registro');
   end;

   if resultado_filtro.filtrado then
   begin
   //depois de filtrar a pessoa ele faz update no cd_responsavel para alterar
   DM.CriarConsulta(qryAtualiza);
   qryAtualiza.SQL.Add('UPDATE diario_terminal_acessos SET cd_responsavel = :cd_responsavel where codigo = :codigo');
   qryAtualiza.ParamByName('cd_responsavel').AsString := IntToStr(resultado_filtro.cd_pessoa);
   qryAtualiza.ParamByName('codigo').AsString := codigo;
   qryAtualiza.ExecSQL;
   FreeAndNil(qryAtualiza);
   qryRegistros.close;
   qryRegistros.open;
   qryRegistros.Locate('CODIGO',codigo,[])

   end;
end;

procedure TfrmConsulta.CleanFilters;
begin
   meAnoSem.Text := DM.GetAnoSemestreAsStr(Date);
   dtpFiltroDataInicio.Date := Date;
   dtpFiltroDataInicio.Checked := False;
   dtpFiltroDataFinal.Date := Date;
   dtpFiltroDataFinal.Checked := False;
   cbFiltroTipo.ItemIndex := 4;
   edtFiltroPessoaCodigo.Clear;
   edtFiltroPessoaNome.Clear;
   dblcFiltroCatracaEntrada.KeyValue := Null;
   dblcFiltroCatracaSaida.KeyValue := Null;
end;

procedure TfrmConsulta.dbgRegistrosTitleClick(Column: TColumn);
var
   ds_ordem, sql, ds_cima, ds_baixo : String;
begin
   ds_ordem:= '';

   dbgRegistros.Columns[nr_coluna].Title.Font.Style := [];
   nr_coluna := Column.Index;
   dbgRegistros.Columns[nr_coluna].Title.Font.Style := [fsbold,fsUnderline];

   ds_ordem :=  ' ORDER BY ' + dbgRegistros.Columns[nr_coluna].FieldName;

   dbgRegistros.DataSource.DataSet.Close;
   sql := TUMZQuery(dbgRegistros.DataSource.DataSet).SQL.Text;

   if Pos('DESC', UPPERCASE(sql)) > 0 Then
   begin
     sql := copy(sql, 1, pos('DESC',UPPERCASE(sql)) -1);
   end
   else
   begin
     ds_ordem := ds_ordem + ' DESC ';
   end;

   if Pos('ORDER BY', UPPERCASE(sql)) > 0 Then
      sql := copy(sql, 1, pos('ORDER BY',UPPERCASE(sql)) -1);

   sql := sql + ' ' + ds_ordem;

   TUMZQuery(dbgRegistros.DataSource.DataSet).SQL.Text := sql;
   dbgRegistros.DataSource.DataSet.Open();

end;

procedure TfrmConsulta.edtFiltroPessoaCodigoExit(Sender: TObject);
const
   SSQLSelectNomePessoa = ''
      + 'SELECT '
      + '    nm_pessoa '
      + 'FROM '
      + '    pessoas '
      + 'WHERE '
      + '    cd_pessoa = ? ';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   edtFiltroPessoaNome.Clear;
   
   Statement := PrepareStatement(SSQLSelectNomePessoa);
   try
      Statement.SetString(1, edtFiltroPessoaCodigo.Text);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
         begin
            edtFiltroPessoaNome.Text := ResultSet.GetStringByName('nm_pessoa');
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Statement.Close;
      Statement := nil;
   end;
end;

procedure TfrmConsulta.edtFiltroPessoaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8, #9, #48..#57, #127]) then
      Key := #0;   
end;

procedure TfrmConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmConsulta.FormCreate(Sender: TObject);
begin
   qryCatracaEntrada.Open;
   qryCatracaSaida.Open;
   qryRegistros.DisableControls;

   CleanFilters;

   dtpFiltroDataInicio.Date := Now;
   dtpFiltroDataInicio.Checked := true;
   dtpFiltroDataFinal.Date := Now;
   dtpFiltroDataFinal.Checked := true;

   ApplyFilters;
   qryRegistros.EnableControls;
end;

procedure TfrmConsulta.sbFiltroBuscaPessoaClick(Sender: TObject);
var
   ResFiltroPessoa: TResultadoFiltroPessoa;
begin
   ResFiltroPessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante);
   if ResFiltroPessoa.filtrado then
   begin
      edtFiltroPessoaCodigo.Text := Format('%d', [ResFiltroPessoa.cd_pessoa]);
      edtFiltroPessoaNome.Text := ResFiltroPessoa.nm_pessoa;
   end;
end;

end.

