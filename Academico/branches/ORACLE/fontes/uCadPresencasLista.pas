unit uCadPresencasLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Buttons, CheckLst, uFSelecionarTurma,
  uFSelecionarPessoa;

type
  Tfrm_Presencas_Lista = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    pnTitulo: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    srcPresencas: TDataSource;
    pmQtd: TPopupMenu;
    Bevel1: TBevel;
    Bevel2: TBevel;
    grd: TDBGrid;
    tbData: TToolButton;
    tbAluno: TToolButton;
    tbDiario: TToolButton;
    ToolButton6: TToolButton;
    qyPresencas: TUMZQuery;
    pmDiario: TPopupMenu;
    odos1: TMenuItem;
    N1: TMenuItem;
    ApenasjImportados1: TMenuItem;
    Apenasnoimportados1: TMenuItem;
    pmAluno: TPopupMenu;
    pmData: TPopupMenu;
    odos2: TMenuItem;
    N2: TMenuItem;
    Selecionar1: TMenuItem;
    odos3: TMenuItem;
    N3: TMenuItem;
    Selecionar2: TMenuItem;
    pnData: TPanel;
    Panel2: TPanel;
    mcData: TMonthCalendar;
    SpeedButton1: TSpeedButton;
    tbTurma: TToolButton;
    pmTurma: TPopupMenu;
    odos4: TMenuItem;
    N4: TMenuItem;
    Selecionar3: TMenuItem;
    qyPresencascd_pessoa: TIntegerField;
    qyPresencasnm_pessoa: TStringField;
    qyPresencasdt_aula: TDateTimeField;
    qyPresencascodigo: TSmallintField;
    qyPresencasds_horario: TStringField;
    qyPresencasds_disc: TStringField;
    qyPresencassn_presente: TStringField;
    qyPresencassn_imp_diario: TStringField;
    qyPresencasturma: TStringField;
    tbSituacao: TToolButton;
    pmSituacao: TPopupMenu;
    miSitTodos: TMenuItem;
    MenuItem2: TMenuItem;
    miSitPresencas: TMenuItem;
    miSitFaltas: TMenuItem;
    qyPresencashr_inicio_fim: TStringField;
    qyPresencashr_inicio: TTimeField;
    qyPresencashr_fim: TTimeField;
    procedure qyPresencasCalcFields(DataSet: TDataSet);
    procedure SituacaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure Filtra;
    procedure grdDblClick(Sender: TObject);
    procedure ApenasjImportados1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure Apenasnoimportados1Click(Sender: TObject);
    procedure Selecionar1Click(Sender: TObject);
    procedure odos2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure odos3Click(Sender: TObject);
    procedure Selecionar2Click(Sender: TObject);
    procedure mcDataDblClick(Sender: TObject);
    procedure grdTitleClick(Column: TColumn);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure odos4Click(Sender: TObject);
    procedure Selecionar3Click(Sender: TObject);
  strict private
      resultado_filtro_turma : TResultadoFiltroTurma;
      resultado_filtro_pessoa : TResultadoFiltroPessoa;
      cd_pessoa : Integer;

      sn_imp_diario: string;
      cd_turma: string;
      dt_aula: string;
      grade: array[0..7] of string;
      ordem: array[0..7] of string;
      coluna: integer;
      sn_presente: string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frm_Presencas_Lista: Tfrm_Presencas_Lista;

implementation

uses Main, uDM, Math, StrUtils, uCadPresencas;

{$R *.dfm}

procedure Tfrm_Presencas_Lista.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Array para fazer a ordenação ao clicar na grade }
  grade[0] := 'dlp.cd_pessoa';
  grade[1] := 'dp.nm_pessoa';
  grade[2] := 'dlp.dt_aula';
  grade[3] := 'dlp.cd_horario';
  grade[4] := 'dh.hr_inicio';
  grade[5] := 'd.descricao';
  grade[6] := 'dlp.sn_presente';
  grade[7] := 'dlp.sn_imp_diario';

  coluna := -1;

  cd_turma := '';
  sn_presente := 'N';

  dt_aula := FormatDateTime( 'yyyy-mm-dd', DataHoje );  

  Filtra();
end;

procedure Tfrm_Presencas_Lista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Presencas_Lista.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Presencas_Lista.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Presencas_Lista.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure Tfrm_Presencas_Lista.Filtra;
var
  i : integer;
  orderby : boolean;
  bFlag: Boolean;
begin
   bFlag := False;

   with qyPresencas do begin
      Close;
      SQL.Clear();

      SQL.Add('SELECT                                                                       ');
      SQL.Add('   dlp.cd_pessoa, p.nm_pessoa, dlp.dt_aula, h.codigo, h.ds_horario,          ');
      SQL.Add('   h.hr_inicio, h.hr_fim,                 ');
      SQL.Add('   d.descricao AS ds_disc, dlp.sn_presente, dlp.sn_imp_diario, f.turma       ');
      SQL.Add('FROM                                                                         ');
      SQL.Add('  diario_lista_presenca dlp                                                  ');
      SQL.Add('  INNER JOIN fichaindividual f ON (dlp.cd_pessoa = f.codigoaluno) AND (dlp.nr_anosemestre = f.anosemestre) AND (dlp.cd_turma = f.turma) AND (dlp.cd_disciplina = f.disciplina) ');
      SQL.Add('  INNER JOIN disciplinas d ON (f.curso = d.curso) AND (dlp.cd_disciplina = d.codigo)  ');
      SQL.Add('  INNER JOIN pessoas p ON (dlp.cd_pessoa = p.cd_pessoa)                      ');
      SQL.Add('  INNER JOIN horarios h ON (dlp.cd_horario = h.codigo)                       ');
      SQL.Add('WHERE                                                                        ');
      SQL.Add('   1 = 1                                                                     ');
      if sn_presente <> '' then
      begin
         SQL.Add('	AND dlp.sn_presente = :sn_presente                         ');
         ParamByName( 'sn_presente' ).AsString := sn_presente;
         bFlag := True;
      end;

      if dt_aula <> '' then
      begin
         if connection.protocol = DB_PROTOCOL_ORACLE then begin
            SQL.Add('	AND dlp.dt_aula >= TO_DATE(:dt_aula1, ''YYYY-MM-DD HH24:MI:SS'')                                           ');
            SQL.Add('	AND dlp.dt_aula <= TO_DATE(:dt_aula2, ''YYYY-MM-DD HH24:MI:SS'')                                           ');
            ParamByName( 'dt_aula1' ).AsString := dt_aula+' 00:00:00';
            ParamByName( 'dt_aula2' ).AsString := dt_aula+' 23:59:59';
         end else if connection.protocol = DB_PROTOCOL_MYSQL then begin
            SQL.Add('	AND dlp.dt_aula = :dt_aula                                           ');
            ParamByName( 'dt_aula' ).AsString := dt_aula;
         end;
         bFlag := True;
      end;

      if cd_pessoa <> 0 then
      begin
         SQL.Add('	AND f.anosemestre = :nr_anosemestre                                ');
         SQL.Add('	AND f.turma = :cd_turma                                            ');
         SQL.Add('	AND dlp.cd_pessoa = :cd_pessoa                                       ');
         ParamByName( 'nr_anosemestre' ).AsInteger := resultado_filtro_pessoa.nr_anosemestre;
         ParamByName( 'cd_turma' ).AsString := resultado_filtro_pessoa.cd_turma;
         ParamByName( 'cd_pessoa' ).AsInteger := cd_pessoa;
         bFlag := True;
      end;

      if cd_turma <> '' then
      begin
         SQL.Add('	AND f.anosemestre = :nr_anosemestre2                               ');
         SQL.Add('	AND f.turma = :cd_turma2                                           ');
         ParamByName( 'nr_anosemestre2' ).AsInteger := resultado_filtro_turma.nr_anosemestre;
         ParamByName( 'cd_turma2' ).AsString := cd_turma;
         bFlag := True;
      end;

      if sn_imp_diario <> '' then
      begin
         SQL.Add('	AND dlp.sn_imp_diario = :sn_imp_diario                               ');
         ParamByName( 'sn_imp_diario' ).AsString := sn_imp_diario;
         bFlag := True;
      end;

      if (not bFlag) and (connection.protocol = DB_PROTOCOL_ORACLE) then begin
         SQL.Add('AND ROWNUM <= 1000');
      end;

      { Fazendo a ordenação }
      SQL.Add('ORDER BY                                                               ');
      if coluna >= 0 then begin
         SQL.Add(' '+grade[coluna]+' '+ordem[coluna]+'                                 ')
      end
      else begin
         SQL.Add(' dlp.dt_aula                                                          ');
      end;
      if (not bFlag) and (connection.protocol = DB_PROTOCOL_MYSQL) then begin
         SQL.Add('LIMIT 1000');
      end;

  end;
  qyPresencas.Open();
end;

procedure Tfrm_Presencas_Lista.grdDblClick(Sender: TObject);
var
  posicao: Pointer;
begin

  {if ( grd.SelectedIndex = 6 ) AND ( qyPresencas.FieldByName( 'sn_imp_diario' ).AsString = 'N' ) then
  begin

    DM.qAux1.Close;
    DM.qAux1.SQL.Text := 'UPDATE diario_lista_presenca SET sn_presente = :sn_presente WHERE cd_pessoa = :cd_pessoa AND cd_horario = :cd_horario AND dt_aula = :dt_aula';
    DM.qAux1.ParamByName( 'cd_pessoa' ).AsInteger := qyPresencas.FieldByName( 'cd_pessoa' ).AsInteger;
    DM.qAux1.ParamByName( 'cd_horario' ).AsInteger := qyPresencas.FieldByName( 'codigo' ).AsInteger;
    DM.qAux1.ParamByName( 'dt_aula' ).AsDate := qyPresencas.FieldByName( 'dt_aula' ).AsDateTime;

    if ( DM.isTrue( qyPresencas.FieldByName( 'sn_presente' ).AsString ) ) then
      DM.qAux1.ParamByName( 'sn_presente' ).AsString := 'N'
    else
      DM.qAux1.ParamByName( 'sn_presente' ).AsString := 'S';

    DM.qAux1.ExecSQL;

    DM.qAux1.Close;
    DM.qAux1.SQL.Text := 'UPDATE diario_lista_presenca SET sn_atualizado = 0 WHERE cd_pessoa = :cd_pessoa AND dt_aula = :dt_aula';
    DM.qAux1.ParamByName( 'cd_pessoa' ).AsInteger := qyPresencas.FieldByName( 'cd_pessoa' ).AsInteger;
    DM.qAux1.ParamByName( 'dt_aula' ).AsDate := qyPresencas.FieldByName( 'dt_aula' ).AsDateTime;
    DM.qAux1.ExecSQL;

    posicao := qyPresencas.GetBookmark;
    Filtra;
    qyPresencas.GotoBookmark( posicao );

  end;}



end;

procedure Tfrm_Presencas_Lista.ApenasjImportados1Click(Sender: TObject);
begin

  TMenuItem( Sender ).Checked := True;
  odos1.Checked := False;
  Apenasnoimportados1.Checked := False;
  tbDiario.Marked := True;
  sn_imp_diario := 'S';

  Filtra;

end;

procedure Tfrm_Presencas_Lista.odos1Click(Sender: TObject);
begin

  TMenuItem( Sender ).Checked := True;
  ApenasjImportados1.Checked := False;
  Apenasnoimportados1.Checked := False;
  tbDiario.Marked := False;
  sn_imp_diario := '';

  Filtra;

end;

procedure Tfrm_Presencas_Lista.Apenasnoimportados1Click(Sender: TObject);
begin

  TMenuItem( Sender ).Checked := True;
  odos1.Checked := False;
  ApenasjImportados1.Checked := False;
  tbDiario.Marked := True;
  sn_imp_diario := 'N';

  Filtra;

end;

procedure Tfrm_Presencas_Lista.Selecionar1Click(Sender: TObject);
begin
   resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro_pessoa.filtrado then
   begin
      if not ( resultado_filtro_pessoa.Aba = afpEstudante ) then
      begin
         MessageDlg( 'Selecione um aluno !', mtInformation, [mbOK], 0 );
         Abort;
      end;

      cd_pessoa := resultado_filtro_pessoa.cd_pessoa;
      tbAluno.Marked := True;
      TMenuItem( Sender ).Checked := True;
      odos2.Checked := False;

      Filtra;
  end;
end;

procedure Tfrm_Presencas_Lista.odos2Click(Sender: TObject);
begin

    cd_pessoa := 0;
    tbAluno.Marked := False;
    TMenuItem( Sender ).Checked := True;
    Selecionar1.Checked := False;
    Filtra;

end;

procedure Tfrm_Presencas_Lista.SpeedButton1Click(Sender: TObject);
begin
  pnData.Visible := False;
end;

procedure Tfrm_Presencas_Lista.odos3Click(Sender: TObject);
begin

  dt_aula := '';
  Filtra;
  TMenuItem( Sender ).Checked := True;
  Selecionar2.Checked := False;
  tbData.Marked := False;


end;

procedure Tfrm_Presencas_Lista.Selecionar2Click(Sender: TObject);
begin

  pnData.Top := frm_Presencas_Lista.Height - toolPessoa.Height - 50 - pnData.Height;
  pnData.Visible := True;

end;

procedure Tfrm_Presencas_Lista.mcDataDblClick(Sender: TObject);
begin

  pnData.Visible := False;
  dt_aula := FormatDateTime( 'yyyy-mm-dd', mcData.Date );

  odos3.Checked := False;
  Selecionar2.Checked := True;
  tbData.Marked := True;

  Filtra;

end;

procedure Tfrm_Presencas_Lista.grdTitleClick(Column: TColumn);
var
  i, maior : integer;
begin

  coluna := Column.Index;

  if ( ordem[ Column.Index ] = '' ) then
  begin
    ordem[ Column.Index ] := 'ASC';
    Column.Title.Font.Style := [fsBold];
  end
  else if ( ordem[ Column.Index ] = 'DESC' ) then
  begin
    ordem[ Column.Index ] := '';
    coluna := -1;
    Column.Title.Font.Style := [];
  end
  else if ( ordem[ Column.Index ] = 'ASC' ) then
  begin
    ordem[ Column.Index ] := 'DESC';
    Column.Title.Font.Style := [fsBold,fsUnderline];
  end;

  for i := 0 to 7 do
  begin

    if ( i <> coluna ) then
      Column.Title.Font.Style := [];

  end;

  Filtra;

end;

procedure Tfrm_Presencas_Lista.grdKeyPress(Sender: TObject; var Key: Char);
var
  posicao: Pointer;
begin

  {if ( key = #32 ) AND ( grd.SelectedIndex = 6 ) AND ( qyPresencas.FieldByName( 'sn_imp_diario' ).AsString = 'N' ) then
  begin

    DM.qAux1.Close;
    DM.qAux1.SQL.Text := 'UPDATE diario_lista_presenca SET sn_presente = :sn_presente WHERE cd_pessoa = :cd_pessoa AND cd_horario = :cd_horario AND dt_aula = :dt_aula';
    DM.qAux1.ParamByName( 'cd_pessoa' ).AsInteger := qyPresencas.FieldByName( 'cd_pessoa' ).AsInteger;
    DM.qAux1.ParamByName( 'cd_horario' ).AsInteger := qyPresencas.FieldByName( 'codigo' ).AsInteger;
    DM.qAux1.ParamByName( 'dt_aula' ).AsDate := qyPresencas.FieldByName( 'dt_aula' ).AsDateTime;

    if ( DM.isTrue( qyPresencas.FieldByName( 'sn_presente' ).AsString ) ) then
      DM.qAux1.ParamByName( 'sn_presente' ).AsString := 'N'
    else
      DM.qAux1.ParamByName( 'sn_presente' ).AsString := 'S';

    DM.qAux1.ExecSQL;

    DM.qAux1.Close;
    DM.qAux1.SQL.Text := 'UPDATE diario_lista_presenca SET sn_atualizado = 0 WHERE cd_pessoa = :cd_pessoa AND dt_aula = :dt_aula';
    DM.qAux1.ParamByName( 'cd_pessoa' ).AsInteger := qyPresencas.FieldByName( 'cd_pessoa' ).AsInteger;
    DM.qAux1.ParamByName( 'dt_aula' ).AsDate := qyPresencas.FieldByName( 'dt_aula' ).AsDateTime;
    DM.qAux1.ExecSQL;

    posicao := qyPresencas.GetBookmark;
    Filtra;
    qyPresencas.GotoBookmark( posicao );

  end;}

end;

procedure Tfrm_Presencas_Lista.odos4Click(Sender: TObject);
begin

    cd_turma := '';
    tbTurma.Marked := False;
    TMenuItem( Sender ).Checked := True;
    Selecionar3.Checked := False;
    Filtra;

end;

procedure Tfrm_Presencas_Lista.qyPresencasCalcFields(DataSet: TDataSet);
begin
   Self.qyPresencashr_inicio_fim.AsString :=
      Self.qyPresencashr_inicio.AsString + ' às ' + Self.qyPresencashr_fim.AsString;
end;

procedure Tfrm_Presencas_Lista.Selecionar3Click(Sender: TObject);
begin
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro_turma.filtrado then
   begin
      cd_turma := resultado_filtro_turma.cd_turma;
      tbTurma.Marked := True;
      TMenuItem( Sender ).Checked := True;
      odos4.Checked := False;
      Filtra;
   end;
end;

procedure Tfrm_Presencas_Lista.SituacaoClick(Sender: TObject);
begin
   case TMenuItem(Sender).Tag of
    0: sn_presente := '';
    1: sn_presente := 'N';
    2: sn_presente := 'S';
   end;
   miSitTodos.Checked := False;
   miSitPresencas.Checked := False;
   miSitFaltas.Checked := False;
   TMenuItem(Sender).Checked := True;
   Filtra;

end;

end.

