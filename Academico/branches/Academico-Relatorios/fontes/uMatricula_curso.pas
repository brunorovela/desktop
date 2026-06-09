unit uMatricula_curso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls, StdCtrls, Mask,
  ExtCtrls, Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TFrmMatricula_Curso = class(TFrame)
    TabControl1: TTabControl;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbDataSaida: TLabel;
    Label6: TLabel;
    btnCurso: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbSituacao: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbCurso: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DbDataSaida: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ToolBar4: TToolBar;
    btnConfirmar: TToolButton;
    ToolButton8: TToolButton;
    btnCancelar: TToolButton;
    dbSituacao: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    qyMatriculaCurso: TUMZQuery;
    qyMatriculaCursocd_matricula_curso: TIntegerField;
    qyMatriculaCursocd_pessoa: TIntegerField;
    qyMatriculaCursonr_matricula: TStringField;
    qyMatriculaCursocd_curso: TStringField;
    qyMatriculaCursocd_grade: TIntegerField;
    qyMatriculaCursonr_anosem_ingresso: TIntegerField;
    qyMatriculaCursocd_turno: TStringField;
    qyMatriculaCursodt_ingresso: TDateTimeField;
    qyMatriculaCursocd_ingresso: TIntegerField;
    qyMatriculaCursocd_instituicao: TIntegerField;
    qyMatriculaCursocd_situacao: TIntegerField;
    qyMatriculaCursonr_anosem_conclusao: TIntegerField;
    qyMatriculaCursodt_conclusao: TDateTimeField;
    qyMatriculaCursodt_colacao: TDateTimeField;
    qyMatriculaCursodt_exp_diploma: TDateTimeField;
    qyMatriculaCursodt_saida: TDateTimeField;
    qyMatriculaCursods_obs: TStringField;
    qyMatriculaCursodescIngressos: TStringField;
    qyMatriculaCursodescInstituicoes: TStringField;
    qyMatriculaCursods_situacao: TStringField;
    dsMatriculaCurso: TDataSource;
    ImageList2: TImageList;
    ImageList1: TImageList;
    qySituacoes: TUMZQuery;
    Label14: TLabel;
    procedure qyMatriculaCursoNewRecord(DataSet: TDataSet);
    procedure qyMatriculaCursoBeforePost(DataSet: TDataSet);
    procedure qyMatriculaCursoBeforeOpen(DataSet: TDataSet);
    procedure DBEdit3Enter(Sender: TObject);
    procedure dbCursoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
    iRetorno : Integer;
  public
    { Public declarations }

    iCodPessoa : Integer;

    aMatriculas : Array [0..100] of Integer;

    iAnoSemAtual : Integer;

    Procedure AtualizarGuias;
    Procedure SelecionarMatricula(CodMatricula : Integer);
    Procedure EditarMatricula(CodMatricula : Integer);
    Function IncluirMatricula() : Integer;
    Function ObterUltimoCodigo() : Integer;
    
  end;

implementation

uses uDM, uFSelecionarCurso, uCursoColigada;

{$R *.dfm}

{ TFrmMatricula_Curso }

procedure TFrmMatricula_Curso.AtualizarGuias;
Var
   qyAux : TUMZQuery;
   i : Integer;
begin
   Dm.CriarConsulta(qyAux);

   qyAux.SQL.Text :=
     ' SELECT mc.cd_matricula_curso, mc.cd_pessoa, mc.cd_curso, c.descricao, mc.nr_anosem_ingresso ' +
     ' FROM matriculas_curso mc INNER JOIN pessoas p ON (p.cd_pessoa = mc.cd_pessoa) ' +
     ' INNER JOIN cursos c ON (c.codigo = mc.cd_curso AND c.anosemestre = mc.nr_anosem_ingresso) '+
     ' WHERE mc.cd_pessoa = ' + IntToStr(iCodPessoa) +
     ' ORDER BY mc.nr_anosem_ingresso DESC ';

   qyAux.Open();

   TabControl1.Tabs.Clear;

   TabControl1.Tabs.Add('[Matricular novo curso]');
   aMatriculas[0] := -1;

   i := 1;

   while not qyAux.Eof do begin

      TabControl1.Tabs.Add(qyAux.FieldByName('descricao').AsString + ' (' + qyAux.FieldByName('nr_anosem_ingresso').AsString + ')');

      aMatriculas[i] := qyAux.FieldByName('cd_matricula_curso').AsInteger;
      INC(i);

      qyAux.Next();

   end;
end;

procedure TFrmMatricula_Curso.btnCancelarClick(Sender: TObject);
begin
   iRetorno := -1;
   qyMatriculaCurso.Cancel();
end;

procedure TFrmMatricula_Curso.btnConfirmarClick(Sender: TObject);
begin
   if qyMatriculaCurso.State in [dsInsert, dsEdit] then begin
      qyMatriculaCurso.Post();
   end;
   iRetorno := ObterUltimoCodigo();

   qyMatriculaCurso.Close();
   qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := iRetorno;
   qyMatriculaCurso.Open();
end;

procedure TFrmMatricula_Curso.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
   CursoColigada : TCursoColigada;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, qyMatriculaCursonr_anosem_ingresso.AsInteger);

  if resultado_filtro.filtrado then
  Begin
      CursoColigada := TCursoColigada.Create( resultado_filtro.cd_curso, resultado_filtro.cd_coligada, True );

      qyMatriculaCursocd_curso.AsString := resultado_filtro.cd_curso;
      qyMatriculaCursonr_anosem_ingresso.AsInteger := resultado_filtro.nr_anosemestre;
      qyMatriculaCursocd_grade.AsInteger := CursoColigada.Grade;
      if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
         qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodPessoa,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
      else
         qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodPessoa,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSemAtual );

      FreeAndNil(CursoColigada);
  end;
end;

procedure TFrmMatricula_Curso.dbCursoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      Key := #0;
      SelectNext(Sender as TWinControl, True, True);
   end;
end;

procedure TFrmMatricula_Curso.DBEdit3Enter(Sender: TObject);
begin
     if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodPessoa,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
     else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodPessoa,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSemAtual );

end;

procedure TFrmMatricula_Curso.EditarMatricula(CodMatricula: Integer);
begin

   SelecionarMatricula(CodMatricula);
   qyMatriculaCurso.Edit();
   
end;

function TFrmMatricula_Curso.IncluirMatricula(): Integer;
begin
  iRetorno := -1;
  SelecionarMatricula(-1);
  qyMatriculaCurso.Insert();
  qyMatriculaCurso.FieldByName('cd_pessoa').AsInteger := iCodPessoa;
  qyMatriculaCurso.FieldByName('dt_ingresso').AsDateTime := Dm.DataAtual;
  qyMatriculaCurso.FieldByName('nr_anosem_ingresso').AsInteger := iAnoSemAtual;
  qyMatriculaCurso.FieldByName('cd_situacao').AsInteger := 1; // ATIVO;
  Result := iRetorno;
end;

function TFrmMatricula_Curso.ObterUltimoCodigo(): Integer;
Var
  qAux : TUMZQuery;
begin
  DM.CriarConsulta(qAux);
  qAux.SQL.Text :=
     ' SELECT cd_matricula_curso FROM matriculas_curso ' +
     ' WHERE cd_pessoa = ' + IntToStr( iCodPessoa ) +
     ' ORDER BY cd_matricula_curso DESC LIMIT 1 ';
  qAux.Open();
  if qAux.EOF then
     Result := -1
  else
     Result := qAux.FieldByName('cd_matricula_curso').AsInteger;
     
  FreeAndNil(qAux);
end;


procedure TFrmMatricula_Curso.qyMatriculaCursoBeforeOpen(DataSet: TDataSet);
begin
   qySituacoes.Close();
   qySituacoes.Open();
end;

procedure TFrmMatricula_Curso.qyMatriculaCursoBeforePost(DataSet: TDataSet);
begin
   if qyMatriculaCursonr_matricula.AsString = '' then begin

      if qyMatriculaCursocd_ingresso.AsInteger <> 3 then
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodPessoa,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, qyMatriculaCursonr_anosem_ingresso.AsInteger )
      else
        qyMatriculaCursonr_matricula.AsString := DM.NovoCodMatricula(iCodPessoa,qyMatriculaCursocd_curso.AsString, qyMatriculaCursonr_anosem_ingresso.AsInteger, iAnoSemAtual );
   end;

end;

procedure TFrmMatricula_Curso.qyMatriculaCursoNewRecord(DataSet: TDataSet);
begin
   qyMatriculaCursocd_grade.AsInteger := 1;
end;

procedure TFrmMatricula_Curso.SelecionarMatricula(CodMatricula: Integer);
begin
  // Selecionar a matrícula existente
  qyMatriculaCurso.Close();
  qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := CodMatricula;
  qyMatriculaCurso.Open();
end;

procedure TFrmMatricula_Curso.TabControl1Change(Sender: TObject);
begin

   if qyMatriculaCurso.State in [dsInsert, dsEdit] then begin
      qyMatriculaCurso.Cancel();
   end;

   if TabControl1.TabIndex = 0 then begin

      IncluirMatricula();

   end else begin

      EditarMatricula(aMatriculas[TabControl1.TabIndex]);

   end;

end;

end.

