unit uGradesExtras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, DBCtrls, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ZConnection, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset;

type
  tFiltro = (Nenhum, FiltroAluno, FiltroTurma);
  TFrmGradesExtras = class(TForm)
    Panel3: TPanel;
    Bevel4: TBevel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    sbRegistrar: TToolButton;
    sbAlterar: TToolButton;
    sbExcluir: TToolButton;
    ToolButton4: TToolButton;
    sbBuscarAluno: TToolButton;
    ToolButton11: TToolButton;
    sbFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    ultimoseparador: TBevel;
    DBGrade: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    qyExtras: TUMZQuery;
    dsExtras: TDataSource;
    sbSelecionarColuna: TSpeedButton;
    ToolButton3: TToolButton;
    qyExtrascd_curso: TStringField;
    qyExtrasnr_horas: TFloatField;
    qyExtrasds_local: TStringField;
    qyExtrasdt_inicio: TDateTimeField;
    qyExtrasdt_termino: TDateTimeField;
    qyExtrasnm_pessoa: TStringField;
    qyExtrasapelido: TStringField;
    qyExtrasds_ge_atividade: TStringField;
    qyExtrasds_ge_area: TStringField;
    qyExtrasds_atividade: TStringField;
    qyExtrascd_ge_aluno: TLargeintField;
    qyExtrascd_pessoa: TLargeintField;
    qyExtrasnr_anosem: TIntegerField;
    qyExtrascd_ge_atividade: TLargeintField;
    qyExtrasds_ge_grupo_original: TMemoField;
    qyExtrasds_ge_grupo: TStringField;
    qyExtrasnr_etapa: TIntegerField;
    procedure qyExtrasCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbExcluirClick(Sender: TObject);
    procedure DBGradeDblClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbRegistrarClick(Sender: TObject);
    procedure DBGradeTitleClick(Column: TColumn);
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbBuscarAlunoClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    UltimoFiltro : tFiltro;
    sSQL : string;
    sOrdem : String;
    iCodigoAluno : Integer;

    Procedure Filtrar();

  public
    { Public declarations }
  end;

var
  FrmGradesExtras: TFrmGradesExtras;

implementation

uses uDM, uCamposPlanilhas, uFSelecionarTurma, uFSelecionarPessoa,
   uGradesExtrasCad, uUsuario, uUMNucleo;

{$R *.dfm}

procedure TFrmGradesExtras.DBGradeDblClick(Sender: TObject);
begin
   sbAlterarClick(nil);
end;

procedure TFrmGradesExtras.DBGradeTitleClick(Column: TColumn);
var
   n : smallint;
begin
  // Clique no título da grade... ordenar pela coluna clicada

  if DBGrade.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to DBGrade.Columns.Count - 1 do begin
       DBGrade.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  Column.Title.Font.Style := [fsUnderline];

  Filtrar();
end;

procedure TFrmGradesExtras.Filtrar;
Var
   sFiltro : String;
   pLugar : Pointer;
begin

  pLugar := qyExtras.GetBookmark();

  qyExtras.Close();

  case UltimoFiltro of
    Nenhum : begin

       Exit;
    end;
    FiltroAluno : begin
        sFiltro := ' AND p.cd_pessoa = ' + IntToStr(iCodigoAluno);
    end;

  end;

  qyExtras.SQL.Text := sSQL + sFiltro;

  if Length( sOrdem ) > 0 then
      qyExtras.SQL.Add( 'ORDER BY ' + sOrdem + ', nr_anosem ' )
  else
      qyExtras.SQL.Add( 'ORDER BY nr_anosem, ds_ge_atividade ' );

  qyExtras.Open();

  if (pLugar <> nil) AND (qyExtras.BookmarkValid(pLugar)) then begin
     qyExtras.GotoBookmark(pLugar);
  end;


end;

procedure TFrmGradesExtras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmGradesExtras.FormCreate(Sender: TObject);
begin
   UltimoFiltro := Nenhum;

   DM.MontarPlanilha(DBGrade, 'planilha_grade_extra');

   // Verifica se deve ou não mostrar a coluna de anosemestre
   DM.BloquearComponenteAnosemestre(DBGrade, 'nr_anosem');

   sOrdem := '';

   sSQL := qyExtras.SQL.Text;
end;

procedure TFrmGradesExtras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2 : if sbRegistrar.Enabled then sbRegistrarClick( nil );
      VK_F3 : if sbAlterar.Enabled then sbAlterarClick( nil );
      VK_F9 : if sbExcluir.Enabled then sbExcluirClick( nil );
      VK_F8 : if sbBuscarAluno.Enabled then sbBuscarAlunoClick( nil );
      VK_F12 : if sbFechar.Enabled then sbFecharClick( nil );
   end;
end;

procedure TFrmGradesExtras.qyExtrasCalcFields(DataSet: TDataSet);
begin
   qyExtrasds_ge_grupo.AsString := qyExtrasds_ge_grupo_original.AsString;
end;

procedure TFrmGradesExtras.sbAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1053, npAlterar, True ) then Exit;

   Application.CreateForm(TFrmGradesExtraCad, FrmGradesExtraCad);

   FrmGradesExtraCad.qyExtraAluno.Close;
   FrmGradesExtraCad.qyExtraAluno.ParamByName('cd_ge_aluno').AsInteger := qyExtrascd_ge_aluno.AsInteger;
   FrmGradesExtraCad.qyExtraAluno.Open();

   FrmGradesExtraCad.qyExtraAluno.Edit();

   FrmGradesExtraCad.ShowModal();
   Filtrar;
end;

procedure TFrmGradesExtras.sbBuscarAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      iCodigoAluno := resultado_filtro.cd_pessoa;
      UltimoFiltro := FiltroAluno;
      Filtrar();
   end;
end;

procedure TFrmGradesExtras.sbExcluirClick(Sender: TObject);
Var
   qyDel : TUMZQuery;
begin
   if not DM.UsuarioLogado.TemPermissao( 1053, npExcluir, True ) then Exit;

   if qyExtras.IsEmpty then Exit;

   if Mensagem('Deseja excluir a atividade selecionada da grade extra do aluno?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON3) <> mrYes then Exit;

   Dm.CriarConsulta(qyDel);

   qyDel.SQL.Text := 'DELETE FROM ge_alunos WHERE cd_ge_aluno = ' + qyExtrascd_ge_aluno.AsString;
   qyDel.ExecSQL();

   FreeAndNil(qyDel);

   Filtrar();   
end;

procedure TFrmGradesExtras.sbFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TFrmGradesExtras.sbRegistrarClick(Sender: TObject);
var
   qyUltimaMatricula: TUMZReadOnlyQuery;
begin
   if not DM.UsuarioLogado.TemPermissao( 1053, npIncluir, True ) then Exit;

   Application.CreateForm(TFrmGradesExtraCad, FrmGradesExtraCad);

   FrmGradesExtraCad.qyExtraAluno.Close();
   FrmGradesExtraCad.qyExtraAluno.ParamByName('cd_ge_aluno').AsInteger := -1;
   FrmGradesExtraCad.qyExtraAluno.Open();

   FrmGradesExtraCad.qyExtraAluno.Insert();

   FrmGradesExtraCad.qyExtraAlunocd_pessoa.AsInteger := iCodigoAluno;

   if (not qyExtras.IsEmpty) AND (qyExtras.Active) then begin
      // Buscar as matrículas
      DM.CriarConsulta(qyUltimaMatricula);
      qyUltimaMatricula.SQL.Text := 'SELECT curso, anosemestre FROM matriculas WHERE codigoaluno = '+qyExtrascd_pessoa.AsString+' ORDER BY anosemestre DESC';
      qyUltimaMatricula.Open();

      FrmGradesExtraCad.qyExtraAlunocd_pessoa.AsInteger := qyExtrascd_pessoa.AsInteger;
      FrmGradesExtraCad.qyExtraAlunocd_curso.AsString := qyUltimaMatricula.FieldByName('curso').AsString;
      FrmGradesExtraCad.qyExtraAlunonr_anosem.AsInteger := qyUltimaMatricula.FieldByName('anosemestre').AsInteger;

   end;   

   FrmGradesExtraCad.ShowModal();
   Filtrar();
end;

procedure TFrmGradesExtras.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(DBGrade, 'planilha_grade_extra');
end;

end.

