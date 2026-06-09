unit uEquivalenciaInterna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, ImgList, Grids, DBGrids, Buttons, DBCtrls, ComCtrls,
  ToolWin, ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfEquivalenciaInterna = class(TForm)
    ultimoseparador: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel3: TPanel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    sbBuscarA: TToolButton;
    ToolButton4: TToolButton;
    sbRegistrar: TToolButton;
    ToolButton1: TToolButton;
    sbAlterar: TToolButton;
    sbExcluir: TToolButton;
    ToolButton11: TToolButton;
    sbSelecionarColuna: TSpeedButton;
    ToolButton3: TToolButton;
    sbFechar: TToolButton;
    ToolButton2: TToolButton;
    DBGrade: TDBGrid;
    ImageList2: TImageList;
    qyEquivalencias: TUMZQuery;
    dsEquivalencias: TDataSource;
    qyEquivalenciascd_curso_eqvlc: TStringField;
    qyEquivalenciasds_curso_eqvlc: TStringField;
    qyEquivalenciascd_curso_eqvlt: TStringField;
    qyEquivalenciasds_curso_eqvlt: TStringField;
    qyEquivalenciasds_disc_eqvlt: TStringField;
    qyEquivalenciasds_disc_eqvlc: TStringField;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    qyAux: TUMZQuery;
    qyEquivalenciascd_grade_eqvlc: TLargeintField;
    qyEquivalenciascd_grade_eqvlt: TLargeintField;
    qyEquivalenciascd_equivalencia_grupo: TLargeintField;
    qyEquivalenciascd_grupo1: TLargeintField;
    qyEquivalenciascd_grupo2: TLargeintField;
    qyEquivalenciasds_disc_eqvlc_calc: TStringField;
    qyEquivalenciasds_disc_eqvlt_calc: TStringField;
    qyEquivalenciascd_disciplina: TIntegerField;
    qyEquivalenciassigla: TStringField;
    qyEquivalenciascd_disciplina_1: TIntegerField;
    qyEquivalenciassigla_1: TStringField;
    procedure qyEquivalenciasds_disc_eqvlt_calcGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qyEquivalenciasds_disc_eqvlc_calcGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbRegistrarClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure sbBuscarAClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGradeTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sSQL : string;
    sOrdem : String;
    sCurso : string;
    iDisciplina : Integer;
  public
    procedure filtrar();
    { Public declarations }
  end;

var
  fEquivalenciaInterna: TfEquivalenciaInterna;

implementation

uses uDM, uCamposPlanilhas, General, uFSelecionarCurso, uFSelecionarDisciplina, uEquivalenciaInternaAcoes,
  Main;

{$R *.dfm}

procedure TfEquivalenciaInterna.DBGradeTitleClick(Column: TColumn);
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

procedure TfEquivalenciaInterna.filtrar;
Var
   sFiltro : String;
   pLugar : Pointer;

begin

  pLugar := qyEquivalencias.GetBookmark();

  qyEquivalencias.Close();

  sFiltro := ' WHERE (1=1) ' ;

  if sCurso <> '' then begin

     sFiltro := sFiltro + ' AND equivalencia.cd_curso = ' + QuotedStr(sCurso) + ' ';

  end;

  if iDisciplina <> 0 then begin

    sFiltro := sFiltro + ' AND equivalencia.cd_disciplina = ' + IntToStr(iDisciplina);
  
  end;

  qyEquivalencias.SQLList.Values[qyEquivalencias.Connection.Protocol] := StringReplace(sSQL, '%FILTRO%', sfiltro, [rfReplaceAll]);

  if Length( sOrdem ) > 0 then
  begin
      qyEquivalencias.SortedFields := sOrdem;
  end else begin
      qyEquivalencias.SortedFields := '';
  end;

  qyEquivalencias.Open();

  if (pLugar <> nil) AND (qyEquivalencias.BookmarkValid(pLugar)) then begin
     qyEquivalencias.GotoBookmark(pLugar);
  end;


end;

procedure TfEquivalenciaInterna.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfEquivalenciaInterna.FormCreate(Sender: TObject);
begin

    DM.MontarPlanilha(DBGrade, 'planilha_equivalencia_interna');

    sOrdem := '';

    sSQL := qyEquivalencias.SQLList.Values[qyEquivalencias.Connection.Protocol];
    
end;

procedure TfEquivalenciaInterna.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if sbRegistrar.Enabled then sbRegistrarClick( nil );
      VK_F3 : if sbAlterar.Enabled then sbAlterarClick( nil );
      VK_F8 : if sbBuscarA.Enabled then sbBuscarAClick( nil );              
      VK_F9 : if sbExcluir.Enabled then sbExcluirClick( nil );
      VK_F12 : if sbFechar.Enabled then sbFecharClick( nil );
   end;
end;

procedure TfEquivalenciaInterna.qyEquivalenciasds_disc_eqvlc_calcGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
var
   valor: TStringList;
begin

   valor := TStringList.Create;

   valor.Clear;

   SplitString(qyEquivalencias.FieldByName('ds_disc_eqvlc').AsString, '/', valor);
   valor.Sort;
   valor.Delimiter := '/';
   Text := StringReplace(valor.DelimitedText, '"', '', [rfReplaceAll]);

   FreeAndNil(valor);

end;

procedure TfEquivalenciaInterna.qyEquivalenciasds_disc_eqvlt_calcGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
var
   valor: TStringList;
begin

   valor := TStringList.Create;

   valor.Clear;

   SplitString(qyEquivalencias.FieldByName('ds_disc_eqvlt').AsString, '/', valor);
   valor.Sort;
   valor.Delimiter := '/';
   Text := StringReplace(valor.DelimitedText, '"', '', [rfReplaceAll]);

   FreeAndNil(valor);

end;

procedure TfEquivalenciaInterna.sbAlterarClick(Sender: TObject);
begin
   Application.CreateForm(TfEquivInternaAcoes, fEquivInternaAcoes);
   fEquivInternaAcoes.showEquivalenciaAcoes(qyEquivalenciascd_equivalencia_grupo.AsInteger, qyEquivalenciascd_grupo1.AsInteger, qyEquivalenciascd_grupo2.AsInteger);
   Filtrar();
end;

procedure TfEquivalenciaInterna.sbBuscarAClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      sCurso := resultado_filtro.cd_curso;
      filtrar();
   end;
end;

procedure TfEquivalenciaInterna.sbExcluirClick(Sender: TObject);
var
   Grupos: TDuploInteger;
   Grupo: Integer;
   iFound: Integer;
begin
   if Mensagem('Você tem certeza que deseja excluir a equivalencia selecionada?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
      Grupos[1] := qyEquivalenciascd_grupo1.AsInteger;
      Grupos[2] := qyEquivalenciascd_grupo2.AsInteger;

      for Grupo in Grupos do begin

         with qyAux do begin
            //checa se o grupo está sendo usado mais de uma vez
            Close();
            SQL.Text := 'SELECT COALESCE(COUNT(*),0) as conta FROM disciplinas_equiv_grupos WHERE cd_grupo1 = :grupo or cd_grupo2 = :grupo';
            ParamByName('grupo').AsInteger := Grupo;
            Open();
            iFound := FieldByName('conta').AsInteger;
            Close();

            if (iFound = 1) then begin
               Close();
               SQL.Text := 'DELETE FROM disciplinas_equiv_interna WHERE cd_grupo = :grupo';
               ParamByName('grupo').AsInteger := Grupo;
               ExecSQL();
               Close();
            end;
         end;
      end;

      //apaga o relacionamento
      with qyAux do begin
         Close();
         SQL.Text := 'DELETE FROM disciplinas_equiv_grupos WHERE cd_equivalencia_grupo = :grupo';
         ParamByName('grupo').AsInteger := qyEquivalenciascd_equivalencia_grupo.AsInteger;
         ExecSQL();

         DM.setLog(
                  1000000,
                  'Exclusao',
                  IntToStr(Grupo),
                  0,
                  'Grupo: ' + IntToStr(Grupo) + ', ' +
                  'Disciplina(s): ' + qyEquivalenciasds_disc_eqvlc.AsString
               );
               
         Close();
      end;
      Filtrar();
   end;
end;

procedure TfEquivalenciaInterna.sbFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfEquivalenciaInterna.sbRegistrarClick(Sender: TObject);
begin
   Application.CreateForm(TfEquivInternaAcoes, fEquivInternaAcoes);
   fEquivInternaAcoes.showEquivalenciaAcoes();
   Filtrar();
end;

procedure TfEquivalenciaInterna.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(DBGrade, 'planilha_equivalencia_interna');
end;

procedure TfEquivalenciaInterna.ToolButton5Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   resultado_filtro := TfrmSelecionarDisciplina.FiltrarCurso([], sCurso);

   if resultado_filtro.filtrado then
   begin
      iDisciplina := resultado_filtro.cd_disciplina;
      sCurso := resultado_filtro.cd_curso;

      Filtrar();
   end;
end;

procedure TfEquivalenciaInterna.ToolButton7Click(Sender: TObject);
begin
    iDisciplina := 0;
    sCurso := '';

    filtrar();
end;

end.

