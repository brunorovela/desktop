unit uAgrupamentoSelecionaDisciplina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, udm, StdCtrls, ZAbstractRODataset,
  ZAbstractDataset, UZDataset;

const
   WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TfrmAgrupamentoSelecionaDisciplina = class(TForm)
    dbgDisciplinasTurmas: TDBGrid;
    dsDisciplinasTurmas: TDataSource;
    qryDisciplinasTurmasU: TUMZQuery;
    qryDisciplinasTurmasUcd_turma: TStringField;
    qryDisciplinasTurmasUds_sigla: TStringField;
    qryDisciplinasTurmasUds_descricao: TStringField;
    qryDisciplinasTurmasUcd_disciplina_pai: TStringField;
    qryDisciplinasTurmasUcd_disciplina: TIntegerField;
    qryDisciplinasTurmasUcurso: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dbgDisciplinasTurmasTitleClick(Column: TColumn);
    procedure dbgDisciplinasTurmasColEnter(Sender: TObject);
  private
    { Private declarations }
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW; 
  public
    { Public declarations }
    procedure selecionaDisciplinas(nr_anosemestre, cd_disciplina_pai: String);
  end;

var
  frmAgrupamentoSelecionaDisciplina: TfrmAgrupamentoSelecionaDisciplina;
  FColunaFiltrada: TColumn;

implementation

uses uAgrupamentoDisciplinas, General;

{$R *.dfm}

procedure TfrmAgrupamentoSelecionaDisciplina.dbgDisciplinasTurmasColEnter(
  Sender: TObject);
begin
      dbgDisciplinasTurmas.BeginDrag( True );
end;

procedure TfrmAgrupamentoSelecionaDisciplina.dbgDisciplinasTurmasTitleClick(
  Column: TColumn);
var
   sql : String;
begin


   frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasU.Close;

   sql := 'select ' +
          'uni_t.codigo as cd_turma, ' +
          'uni_d.sigla as ds_sigla, ' +
          'uni_d.descricao as ds_descricao, ' +
          'uni_d.cd_disciplina_pai, ' +
          'uni_d.codigo as cd_disciplina, ' +
          'uni_d.curso ' +
          'from ' +
          '' +
          'disciplinas as uni_d ' +
          '' +
          'INNER JOIN turmas as uni_t ON ( ' +
          '   uni_t.curso = uni_d.curso ' +
          ') ' +
          '' +
          'INNER JOIN gradecurricular as uni_g ON (' +
          ' uni_g.anosemestre	 	= uni_t.anosemestre and ' +
          '	uni_g.cd_grade 			= uni_t.cd_grade and ' +
          '	uni_g.serie 				= uni_t.serie and ' +
          '	uni_g.turno 				= uni_t.turno and ' +
          ' uni_d.codigo = uni_g.disciplina' +
          ')' +
          'INNER JOIN cursos_coligadas as cc on ( ' +
          '   uni_t.curso = cc.cd_curso ' +
          ')  ' +
          '   ' +
          'WHERE ' +
          '   uni_t.anosemestre = :nr_anosemestre ' +
          '   AND uni_d.cd_disciplina_pai= :cd_disciplina_pai ' +
          '   AND cc.cd_coligada IN ( %s )';

   sql := Format(sql, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);


   if FColunaFiltrada <> Column then
   begin
      if Assigned( FColunaFiltrada) then
      begin
         FColunaFiltrada.Title.Font.Style := FColunaFiltrada.Title.Font.Style - [fsBold];
      end;

      FColunaFiltrada := Column;
      FColunaFiltrada.Title.Font.Style := FColunaFiltrada.Title.Font.Style + [fsBold];
      // tblHorarios.Close;

      sql := sql + ' order by ';
      sql := sql + Column.FieldName;

      frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasU.SQL.Text := sql;

   end;


   frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasU.ParamByName('nr_anosemestre').asString    := frmAGrupamentoDisciplinas.qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString;
   frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasU.ParamByName('cd_disciplina_pai').asString := frmAGrupamentoDisciplinas.qryDispDisciplinaAgrupamentoUcd_disciplina_pai.AsString;
   frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasU.Open;

end;

procedure TfrmAgrupamentoSelecionaDisciplina.FormShow(Sender: TObject);
begin
   // Post the custom message WM_AFTER_SHOW to our form
   PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TfrmAgrupamentoSelecionaDisciplina.selecionaDisciplinas(
  nr_anosemestre, cd_disciplina_pai: String);
begin
   qryDisciplinasTurmasU.Close;
   qryDisciplinasTurmasU.ParamByName('nr_anosemestre').asString    := nr_anosemestre;
   qryDisciplinasTurmasU.ParamByName('cd_disciplina_pai').asString := cd_disciplina_pai;
   qryDisciplinasTurmasU.SQL.Text := Format(qryDisciplinasTurmasU.SQL.Text, [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);
   qryDisciplinasTurmasU.Open;
end;

procedure TfrmAgrupamentoSelecionaDisciplina.WmAfterShow(var Msg: TMessage);
begin
   if ( qryDisciplinasTurmasU.RecordCount = 0 ) then
   begin
      Mensagem('Neste ano/semestre não existem turmas vinculadas a disciplina selecionada.',
         '', MB_OK + MB_ICONINFORMATION, Handle);
   end;
end;

end.
