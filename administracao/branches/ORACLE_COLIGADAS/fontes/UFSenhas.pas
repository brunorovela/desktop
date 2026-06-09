unit UFSenhas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, Buttons, Grids, DBGrids, DB,
   ZAbstractRODataset, ZAbstractDataset, UZDataset, ZSqlUpdate, ZDbcIntfs,
   uRegExpr, DBCtrls, uUsuario, uUMNucleo, uFSelecionarPessoa,
   uFSelecionarCurso, uFSelecionarTurma;

type
  TfSenhas = class(TForm)
    pnlTitulo: TPanel;
    bvlSep1: TBevel;
    pnlLeft: TPanel;
    pnlFiltros: TPanel;
    bvlSep2: TBevel;
    lblGrupo: TLabel;
    lblPessoa: TLabel;
    lblAnoSemestre: TLabel;
    lblCurso: TLabel;
    lblTurma: TLabel;
    sbSelGrupo: TSpeedButton;
    sbSelPessoa: TSpeedButton;
    sbSelCurso: TSpeedButton;
    sbSelTurma: TSpeedButton;
    pnlFiltrosTit: TPanel;
    edtGrupo: TEdit;
    edtPessoa: TEdit;
    meAnoSemestre: TMaskEdit;
    udAnoSemestre: TUpDown;
    edtCurso: TEdit;
    edtTurma: TEdit;
    bvlSep3: TBevel;
    pnlOpcoes: TPanel;
    pnlOpcoesTit: TPanel;
    bvlSep4: TBevel;
    chkProvisoria: TCheckBox;
    chkSobreescrever: TCheckBox;
    rgSenha: TRadioGroup;
    lblNovaSenha: TLabel;
    edtNovaSenha: TEdit;
    splSep1: TSplitter;
    pnlDados: TPanel;
    pnlDadosTit: TPanel;
    bvlSep5: TBevel;
    dbgPessoas: TDBGrid;
    sbFiltrar: TSpeedButton;
    qryPessoas: TUMZQuery;
    qryAlunos: TUMZQuery;
    qryPessoasCD_PESSOA: TIntegerField;
    qryPessoasNM_PESSOA: TStringField;
    qryPessoasSN_SENHA_PROVISORIA: TStringField;
    qryPessoasDS_SENHA: TStringField;
    qryPessoasDT_NASCIMENTO: TDateTimeField;
    qryAlunosCD_PESSOA: TIntegerField;
    qryAlunosNM_PESSOA: TStringField;
    qryAlunosSN_SENHA_PROVISORIA: TStringField;
    qryAlunosDS_SENHA: TStringField;
    qryAlunosDT_NASCIMENTO: TDateTimeField;
    qryProfessores: TUMZQuery;
    qryProfessoresCD_PESSOA: TIntegerField;
    qryProfessoresNM_PESSOA: TStringField;
    qryProfessoresSN_SENHA_PROVISORIA: TStringField;
    qryProfessoresDS_SENHA: TStringField;
    qryProfessoresDT_NASCIMENTO: TDateTimeField;
    qryUsuarios: TUMZQuery;
    qryUsuariosCD_PESSOA: TIntegerField;
    qryUsuariosNM_PESSOA: TStringField;
    qryUsuariosSN_SENHA_PROVISORIA: TStringField;
    qryUsuariosDS_SENHA: TStringField;
    qryUsuariosDT_NASCIMENTO: TDateTimeField;
    dsPessoas: TDataSource;
    dsAlunos: TDataSource;
    dsProfessores: TDataSource;
    dsUsuarios: TDataSource;
    qryAlunosCD_TURMA: TStringField;
    qryAlunosCD_CURSO: TStringField;
    qryAlunosNR_ANOSEMESTRE: TSmallintField;
    qryProfessoresCD_TURMA: TStringField;
    qryProfessoresCD_CURSO: TStringField;
    qryProfessoresNR_ANOSEMESTRE: TSmallintField;
    bbtnConfirmar: TBitBtn;
    bbtnFechar: TBitBtn;
    pnlAtualizando: TPanel;
    lblAtualizando: TLabel;
    aniRunning: TAnimate;
    sbLimpar: TSpeedButton;
    qryPessoasSN_SENHA_DESC: TStringField;
    qryAlunosSN_SENHA_DESC: TStringField;
    qryProfessoresSN_SENHA_DESC: TStringField;
    qryUsuariosSN_SENHA_DESC: TStringField;
    pnlLegenda: TPanel;
    Label1: TLabel;
    pnlVermelho: TPanel;
    qryRespFinan: TUMZQuery;
    dsRespFinan: TDataSource;
    qryRespFinanCD_PESSOA: TIntegerField;
    qryRespFinanNM_PESSOA: TStringField;
    qryRespFinanSN_SENHA_PROVISORIA: TStringField;
    qryRespFinanDS_SENHA: TStringField;
    qryRespFinanDT_NASCIMENTO: TDateTimeField;
    qryRespFinanCD_TURMA: TStringField;
    qryRespFinanCD_CURSO: TStringField;
    qryRespFinanNR_ANOSEMESTRE: TSmallintField;
    dsRespAcad: TDataSource;
    qryRespAcad: TUMZQuery;
    dsRespUnificado: TDataSource;
    qryRespUnificado: TUMZQuery;
    qryCoordenador: TUMZQuery;
    dsCoordenador: TDataSource;
    qryCoordenadorCD_PESSOA: TIntegerField;
    qryCoordenadorNM_PESSOA: TStringField;
    qryCoordenadorSN_SENHA_PROVISORIA: TStringField;
    qryCoordenadorDS_SENHA: TStringField;
    qryCoordenadorDT_NASCIMENTO: TDateTimeField;
    qryCoordenadorcd_curso: TStringField;
    qryCoordenadorSN_SENHA_DESC: TStringField;
    qryRespAcadSN_SENHA_DESC: TStringField;
    qryRespFinanSN_SENHA_DESC: TStringField;
    qryRespUnificadoCD_PESSOA: TIntegerField;
    qryRespUnificadoNM_PESSOA: TStringField;
    qryRespUnificadoSN_SENHA_PROVISORIA: TStringField;
    qryRespUnificadoDS_SENHA: TStringField;
    qryRespUnificadoDT_NASCIMENTO: TDateTimeField;
    qryRespUnificadoCD_TURMA: TStringField;
    qryRespUnificadoCD_CURSO: TStringField;
    qryRespUnificadoNR_ANOSEMESTRE: TSmallintField;
    qryRespUnificadoSN_SENHA_DESC: TStringField;
    qryRespAcadCD_PESSOA: TIntegerField;
    qryRespAcadNM_PESSOA: TStringField;
    qryRespAcadSN_SENHA_PROVISORIA: TStringField;
    qryRespAcadDS_SENHA: TStringField;
    qryRespAcadDT_NASCIMENTO: TDateTimeField;
    qryRespAcadCD_TURMA: TStringField;
    qryRespAcadCD_CURSO: TStringField;
    qryRespAcadNR_ANOSEMESTRE: TSmallintField;
    qryCoordenadorSN_BLOQUEAR: TStringField;
    qryRespUnificadoSN_BLOQUEAR: TStringField;
    qryRespAcadSN_BLOQUEAR: TStringField;
    qryRespFinanSN_BLOQUEAR: TStringField;
    qryPessoasSN_BLOQUEAR: TStringField;
    qryProfessoresSN_BLOQUEAR: TStringField;
    qryUsuariosSN_BLOQUEAR: TStringField;
    qryAlunosSN_BLOQUEAR: TStringField;
    procedure chkProvisoriaClick(Sender: TObject);
    procedure qryRespUnificadoCalcFields(DataSet: TDataSet);
    procedure qryRespAcadCalcFields(DataSet: TDataSet);
    procedure qryRespFinanCalcFields(DataSet: TDataSet);
    procedure chkSobreescreverClick(Sender: TObject);
    procedure qryUsuariosCalcFields(DataSet: TDataSet);
    procedure qryProfessoresCalcFields(DataSet: TDataSet);
    procedure qryAlunosCalcFields(DataSet: TDataSet);
    procedure qryPessoasCalcFields(DataSet: TDataSet);
    procedure sbLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFecharClick(Sender: TObject);
    procedure edtNovaSenhaChange(Sender: TObject);
    procedure rgSenhaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgPessoasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbFiltrarClick(Sender: TObject);
    procedure sbSelTurmaClick(Sender: TObject);
    procedure sbSelCursoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbSelPessoaClick(Sender: TObject);
    procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure sbSelGrupoClick(Sender: TObject);
  private
    { Private declarations }
      function ValidatePassword(const Password: string): Boolean;
      procedure DoFilter;
      procedure DoUpdate;
      procedure ChangeConfirmState;
      procedure UpdateGroup(const Group: Integer);
  public
    { Public declarations }
  end;

var
   fSenhas: TfSenhas;

implementation

uses
   UDM, UFBuscaGrupo, UFBuscaPessoa, UFBuscaTurma, ZConnection;

{$R *.dfm}

{ TfSenhas }

procedure TfSenhas.bbtnConfirmarClick(Sender: TObject);
begin
   DoUpdate;
   dbgPessoas.DataSource.DataSet.Close;
   dbgPessoas.DataSource.DataSet.Open;
end;

procedure TfSenhas.bbtnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfSenhas.ChangeConfirmState;
begin
   bbtnConfirmar.Enabled := (dbgPessoas.DataSource <> nil)
     and (not dbgPessoas.DataSource.DataSet.IsEmpty)
     and (dbgPessoas.DataSource.DataSet.RecordCount > 0)
     and (((rgSenha.ItemIndex = 0) or (rgSenha.ItemIndex = 2))
     or (Trim(edtNovaSenha.Text) <> ''));

   pnlOpcoes.Visible := (dbgPessoas.DataSource <> nil)
     and (not dbgPessoas.DataSource.DataSet.IsEmpty)
     and (dbgPessoas.DataSource.DataSet.RecordCount > 0);
end;

procedure TfSenhas.chkProvisoriaClick(Sender: TObject);
begin

   rgSenha.ItemIndex := 0;

   if ((chkSobreescrever.Checked = False) and (chkProvisoria.Checked)) then
   begin
      TCustomRadioGroup(rgsenha.Components[2]).Enabled := True;
   end
   else
   begin
      TCustomRadioGroup(rgsenha.Components[2]).Enabled := False;
   end;

end;

procedure TfSenhas.chkSobreescreverClick(Sender: TObject);
begin
   dbgPessoas.Repaint;

   rgSenha.ItemIndex := 0;

   if ((chkSobreescrever.Checked = False) and (chkProvisoria.Checked = True)) then
   begin
      TCustomRadioGroup(rgsenha.Components[2]).Enabled := True;
   end
   else
   begin
      TCustomRadioGroup(rgsenha.Components[2]).Enabled := False;
   end;

   
end;

procedure TfSenhas.dbgPessoasDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if chkSobreescrever.Checked or
   (dbgPessoas.DataSource.DataSet.FieldByName('SN_SENHA_PROVISORIA').AsString = 'S') and
   (dbgPessoas.DataSource.DataSet.FieldByName('SN_BLOQUEAR').AsString = '0') then
   begin
     dbgPessoas.Canvas.Brush.Color:= clSkyBlue;
     dbgPessoas.Canvas.Font.Color:= clWhite;
     dbgPessoas.Canvas.FillRect(Rect);
     dbgPessoas.DefaultDrawDataCell(Rect, Column.Field, State);
   end;

   if (Column.FieldName = 'SN_BLOQUEAR') and Assigned(Column.Field) then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      dbgPessoas.Canvas.FillRect(Rect);
      DrawFrameControl(dbgPessoas.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsString = '0']);
   end;
end;

procedure TfSenhas.DoFilter;
const
   SSQLAlunos =
      'SELECT DISTINCT ' +
         'P.CD_PESSOA,' +
         'P.NM_PESSOA,' +
         'P.SN_SENHA_PROVISORIA,' +
         'P.DS_SENHA,' +
         'P.DT_NASCIMENTO,' +
         'M.TURMA CD_TURMA,' +
         'M.CURSO CD_CURSO,' +
         'M.ANOSEMESTRE NR_ANOSEMESTRE,' +
         'CASE ' +
            'WHEN ' +
               'EXISTS ( ' +
                  'SELECT DISTINCT ' +
                     'P_TO.CD_GRUPO ' +
                  'FROM ' +
                     'NU_GRUPOS_PESSOAS P_TO  ' +
                        'LEFT JOIN ( ' +
                           'SELECT DISTINCT ' +
                              'H.CD_GRUPO_LIBERADO ' +
                           'FROM ' +
                              'NU_GRUPOS_HIERARQUIA H ' +
                                 'JOIN NU_GRUPOS_PESSOAS P ON ' +
                                    '(H.CD_GRUPO = P.CD_GRUPO) ' +
                           'WHERE ' +
                              'P.CD_PESSOA = :CD_USUARIO ' +
                        ') T ON ' +
                           '(P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO)  ' +
                  'WHERE ' +
                     'P_TO.CD_PESSOA = P.CD_PESSOA AND ' +
                     'T.CD_GRUPO_LIBERADO IS NULL ' +
               ') ' +
            'THEN ''1'' ' +
            'ELSE ''0'' ' +
         'END SN_BLOQUEAR ' +
      'FROM ' +
         'PESSOAS P ' +
            'JOIN NU_GRUPOS_PESSOAS GP ON ' +
               '(P.CD_PESSOA = GP.CD_PESSOA) ' +
            'JOIN MATRICULAS M ON ' +
               '(P.CD_PESSOA = M.CODIGOALUNO) ' +
      'WHERE ' +
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         '(GP.CD_GRUPO = :CD_GRUPO or 0 = :CD_GRUPO)' +
         '%s ' +
      'GROUP BY ' +
         'P.CD_PESSOA';

   SSQLProfessores =
      'SELECT DISTINCT ' +
         'P.CD_PESSOA,' +
         'P.NM_PESSOA,' +
         'P.SN_SENHA_PROVISORIA,' +
         'P.DS_SENHA,' +
         'P.DT_NASCIMENTO,' +
         'TP.TURMA CD_TURMA,' +
         'TP.CURSO CD_CURSO,' +
         'TP.ANOSEMESTRE NR_ANOSEMESTRE,' +
         'CASE ' +
            'WHEN ' +
               'EXISTS ( ' +
                  'SELECT DISTINCT ' +
                     'P_TO.CD_GRUPO ' +
                  'FROM ' +
                     'NU_GRUPOS_PESSOAS P_TO  ' +
                        'LEFT JOIN ( ' +
                           'SELECT DISTINCT ' +
                              'H.CD_GRUPO_LIBERADO ' +
                           'FROM ' +
                              'NU_GRUPOS_HIERARQUIA H ' +
                                 'JOIN NU_GRUPOS_PESSOAS P ON ' +
                                    '(H.CD_GRUPO = P.CD_GRUPO) ' +
                           'WHERE ' +
                              'P.CD_PESSOA = :CD_USUARIO ' +
                        ') T ON ' +
                           '(P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO)  ' +
                  'WHERE ' +
                     'P_TO.CD_PESSOA = P.CD_PESSOA AND ' +
                     'T.CD_GRUPO_LIBERADO IS NULL ' +
               ') ' +
            'THEN ''1'' ' +
            'ELSE ''0'' ' +
         'END SN_BLOQUEAR ' +
      'FROM ' +
         'PESSOAS P ' +
            'JOIN NU_GRUPOS_PESSOAS GP ON ' +
               '(P.CD_PESSOA = GP.CD_PESSOA) ' +
            'JOIN TURMASPROFESSORES TP ON ' +
               '(TP.PROFESSOR = P.CD_PESSOA) ' +
      'WHERE ' +
         'TP.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'GP.CD_GRUPO = :CD_GRUPO ' +
         '%s ' +
      'GROUP BY ' +
         'P.CD_PESSOA';

   SSQLRespUnificado =
      'SELECT ' +
         'P1.CD_PESSOA,' +
         'P1.NM_PESSOA,' +
         'P1.SN_SENHA_PROVISORIA,' +
         'P1.DS_SENHA,' +
         'P1.DT_NASCIMENTO,' +
         'M.TURMA CD_TURMA,' +
         'M.CURSO CD_CURSO,' +
         'M.ANOSEMESTRE NR_ANOSEMESTRE,' +
         'CASE ' +
            'WHEN ' +
               'EXISTS ( ' +
                  'SELECT DISTINCT ' +
                     'P_TO.CD_GRUPO ' +
                  'FROM ' +
                     'NU_GRUPOS_PESSOAS P_TO  ' +
                        'LEFT JOIN ( ' +
                           'SELECT DISTINCT ' +
                              'H.CD_GRUPO_LIBERADO ' +
                           'FROM ' +
                              'NU_GRUPOS_HIERARQUIA H ' +
                                 'JOIN NU_GRUPOS_PESSOAS P ON ' +
                                    '(H.CD_GRUPO = P.CD_GRUPO) ' +
                           'WHERE ' +
                              'P.CD_PESSOA = :CD_USUARIO ' +
                        ') T ON ' +
                           '(P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO)  ' +
                  'WHERE ' +
                     'P_TO.CD_PESSOA = P1.CD_PESSOA AND ' +
                     'T.CD_GRUPO_LIBERADO IS NULL ' +
               ') ' +
            'THEN ''1'' ' +
            'ELSE ''0'' ' +
         'END SN_BLOQUEAR ' +
      'FROM ' +
         'PESSOAS P1 ' +
            ' JOIN PESSOAS P2 ON '+
              '(P2.CD_RESP_ACAD = P1.CD_PESSOA '+
                ' OR (P2.cd_pai = P1.CD_PESSOA AND P2.sn_pai_resp = 1 ) '+
                ' OR (P2.cd_mae = P1.CD_PESSOA AND P2.sn_mae_resp = 1) '+
              ' ) '+
              ' AND (P2.CD_RESP_FINAN = P1.CD_PESSOA) '+

            'JOIN MATRICULAS M ON ' +
               '(P2.CD_PESSOA = M.CODIGOALUNO) ' +
            'JOIN NU_GRUPOS_PESSOAS GP ON ' +
               '(P1.CD_PESSOA = GP.CD_PESSOA) ' +
      'WHERE ' +
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'GP.CD_GRUPO = :CD_GRUPO ' +
         '%s ' +
      'GROUP BY ' +
         'P1.CD_PESSOA';

   SSQLRespFinan =
      'SELECT ' +
         'P1.CD_PESSOA,' +
         'P1.NM_PESSOA,' +
         'P1.SN_SENHA_PROVISORIA,' +
         'P1.DS_SENHA,' +
         'P1.DT_NASCIMENTO,' +
         'M.TURMA CD_TURMA,' +
         'M.CURSO CD_CURSO,' +
         'M.ANOSEMESTRE NR_ANOSEMESTRE,' +
         'CASE ' +
            'WHEN ' +
               'EXISTS ( ' +
                  'SELECT DISTINCT ' +
                     'P_TO.CD_GRUPO ' +
                  'FROM ' +
                     'NU_GRUPOS_PESSOAS P_TO  ' +
                        'LEFT JOIN ( ' +
                           'SELECT DISTINCT ' +
                              'H.CD_GRUPO_LIBERADO ' +
                           'FROM ' +
                              'NU_GRUPOS_HIERARQUIA H ' +
                                 'JOIN NU_GRUPOS_PESSOAS P ON ' +
                                    '(H.CD_GRUPO = P.CD_GRUPO) ' +
                           'WHERE ' +
                              'P.CD_PESSOA = :CD_USUARIO ' +
                        ') T ON ' +
                           '(P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO)  ' +
                  'WHERE ' +
                     'P_TO.CD_PESSOA = P1.CD_PESSOA AND ' +
                     'T.CD_GRUPO_LIBERADO IS NULL ' +
               ') ' +
            'THEN ''1'' ' +
            'ELSE ''0'' ' +
         'END SN_BLOQUEAR ' +
      'FROM ' +
         'PESSOAS P1 ' +
            'JOIN PESSOAS P2 ON ' +
               '(P2.CD_RESP_FINAN = P1.CD_PESSOA) ' +
            'JOIN MATRICULAS M ON ' +
               '(P2.CD_PESSOA = M.CODIGOALUNO) ' +
            'JOIN NU_GRUPOS_PESSOAS GP ON ' +
               '(P1.CD_PESSOA = GP.CD_PESSOA) ' +
      'WHERE ' +
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'GP.CD_GRUPO = :CD_GRUPO ' +
         '%s ' +
      'GROUP BY ' +
         'P1.CD_PESSOA';

   SSQLRespAcad =
      'SELECT ' +
         'P1.CD_PESSOA,' +
         'P1.NM_PESSOA,' +
         'P1.SN_SENHA_PROVISORIA,' +
         'P1.DS_SENHA,' +
         'P1.DT_NASCIMENTO,' +
         'M.TURMA CD_TURMA,' +
         'M.CURSO CD_CURSO,' +
         'M.ANOSEMESTRE NR_ANOSEMESTRE,' +
         'CASE ' +
            'WHEN ' +
               'EXISTS ( ' +
                  'SELECT DISTINCT ' +
                     'P_TO.CD_GRUPO ' +
                  'FROM ' +
                     'NU_GRUPOS_PESSOAS P_TO  ' +
                        'LEFT JOIN ( ' +
                           'SELECT DISTINCT ' +
                              'H.CD_GRUPO_LIBERADO ' +
                           'FROM ' +
                              'NU_GRUPOS_HIERARQUIA H ' +
                                 'JOIN NU_GRUPOS_PESSOAS P ON ' +
                                    '(H.CD_GRUPO = P.CD_GRUPO) ' +
                           'WHERE ' +
                              'P.CD_PESSOA = :CD_USUARIO ' +
                        ') T ON ' +
                           '(P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO)  ' +
                  'WHERE ' +
                     'P_TO.CD_PESSOA = P1.CD_PESSOA AND ' +
                     'T.CD_GRUPO_LIBERADO IS NULL ' +
               ') ' +
            'THEN ''1'' ' +
            'ELSE ''0'' ' +
         'END SN_BLOQUEAR ' +
      'FROM ' +
         'PESSOAS P1 ' +
            'JOIN (' +
                     'SELECT ' +
                        'CD_RESP_ACAD, CD_PESSOA ' +
                     'FROM ' +
                        'PESSOAS ' +
                     'WHERE ' +
                        'CD_RESP_ACAD IS NOT NULL ' +
                     'UNION ' +
                     'SELECT ' +
                        'CD_PAI, CD_PESSOA ' +
                     'FROM ' +
                        'PESSOAS P ' +
                     'WHERE ' +
                        'P.SN_PAI_RESP = 1 ' +
                        'AND CD_PAI IS NOT NULL ' +
                     'UNION ' +
                     'SELECT ' +
                        'CD_MAE, CD_PESSOA ' +
                     'FROM ' +
                        'PESSOAS P ' +
                     'WHERE ' +
                        'P.SN_MAE_RESP = 1 ' +
                        'AND CD_MAE IS NOT NULL ' +
                  ') AS FILHO ON (FILHO.CD_RESP_ACAD = P1.CD_PESSOA) ' +
            'JOIN MATRICULAS M ON ' +
               '(FILHO.CD_PESSOA = M.CODIGOALUNO) ' +
            'LEFT JOIN NU_GRUPOS_PESSOAS GP ON ' +
               '(P1.CD_PESSOA = GP.CD_PESSOA) ' +
      'WHERE ' +
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'GP.CD_GRUPO = :CD_GRUPO ' +
         '%s ' +
      'GROUP BY ' +
         'P1.CD_PESSOA';

   SSQLCoordenador =
      'SELECT ' +
         'P.CD_PESSOA,' +
         'P.NM_PESSOA,' +
         'P.SN_SENHA_PROVISORIA,' +
         'P.DS_SENHA,' +
         'P.DT_NASCIMENTO,' +
         'CC.CD_CURSO,' +
         'CASE ' +
            'WHEN ' +
               'EXISTS ( ' +
                  'SELECT DISTINCT ' +
                     'P_TO.CD_GRUPO ' +
                  'FROM ' +
                     'NU_GRUPOS_PESSOAS P_TO  ' +
                        'LEFT JOIN ( ' +
                           'SELECT DISTINCT ' +
                              'H.CD_GRUPO_LIBERADO ' +
                           'FROM ' +
                              'NU_GRUPOS_HIERARQUIA H ' +
                                 'JOIN NU_GRUPOS_PESSOAS P ON ' +
                                    '(H.CD_GRUPO = P.CD_GRUPO) ' +
                           'WHERE ' +
                              'P.CD_PESSOA = :CD_USUARIO ' +
                        ') T ON ' +
                           '(P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO)  ' +
                  'WHERE ' +
                     'P_TO.CD_PESSOA = P.CD_PESSOA AND ' +
                     'T.CD_GRUPO_LIBERADO IS NULL ' +
               ') ' +
            'THEN ''1'' ' +
            'ELSE ''0'' ' +
         'END SN_BLOQUEAR ' +
      'FROM ' +
         'PESSOAS P ' +
            'JOIN CURSOS_COORDENADORES CC ON ' +
               '(CC.CD_PESSOA = P.CD_PESSOA) ' +
      'WHERE ' +
         '1 = 1 ' +
         '%s ' +
      'GROUP BY ' +
         'P.CD_PESSOA';

   SOp = ' AND ';
var
   SQL, Papel, Filtro: AnsiString;
   Filtros: TStrings;
   Params: TParams;
   Param: TParam;
   DataSet: TUMZQuery;
   DataSource: TDataSource;

   SFiltroCurso, SFiltroTurma : String;

   I: Integer;
begin
   Filtros := TStringList.Create;
   Params := TParams.Create;

   SFiltroCurso := 'M.CURSO = :CD_CURSO';
   SFiltroTurma := 'M.TURMA = :CD_TURMA';
   
   try
      Params.CreateParam(ftUnknown, 'NR_ANOSEMESTRE', ptUnknown).AsString := meAnoSemestre.Text;
      Params.CreateParam(ftUnknown, 'CD_GRUPO', ptUnknown).AsInteger := edtGrupo.Tag;
      Params.CreateParam(ftUnknown, 'CD_USUARIO', ptUnknown).AsInteger := DM.UsuarioLogado.Pessoa.Codigo;

      Papel := '';

      if edtGrupo.Text <> '' then
      begin
         Papel := fBuscaGrupo.qryGruposDS_PAPEL.AsString;
      end;

      if edtPessoa.Text = '' then
      begin
         SQL := qryUsuarios.SQL.Text;
         DataSet := qryUsuarios;
         DataSource := dsUsuarios;
      end;

      if (Papel = 'ALUNO') or (trim(edtTurma.text) <> '') or (trim(edtCurso.text) <> '') then
      begin
         SQL := SSQLAlunos;
         DataSet := qryAlunos;
         DataSource := dsAlunos;
      end;

      if Papel = 'PROFESSOR' then
      begin
         SFiltroCurso := 'TP.curso = :CD_CURSO';
         SFiltroTurma := 'TP.turma = :CD_TURMA';

         SQL := SSQLProfessores;
         DataSet := qryProfessores;
         DataSource := dsProfessores;
      end;

      if Papel = 'RESP_UNIFICADO' then
      begin
         SQL := SSQLRespUnificado;
         DataSet := qryRespUnificado;
         DataSource := dsRespUnificado;
      end;

      if Papel = 'RESP_FINAN' then
      begin
         SQL := SSQLRespFinan;
         DataSet := qryRespFinan;
         DataSource := dsRespFinan;
      end;

      if Papel = 'RESP_ACAD' then
      begin
         SQL := SSQLRespAcad;
         DataSet := qryRespAcad;
         DataSource := dsRespAcad;
      end;

      if Papel = 'COORDENADOR' then
      begin
         SFiltroCurso := 'CC.cd_curso = :CD_CURSO';

         SQL := SSQLCoordenador;
         DataSet := qryCoordenador;
         DataSource := dsCoordenador;
      end;

      if edtPessoa.Text <> '' then
      begin
         SQL := qryPessoas.SQL.Text;
         DataSet := qryPessoas;
         DataSource := dsPessoas;
         Params.CreateParam(ftUnknown, 'CD_PESSOA', ptUnknown).AsInteger := edtPessoa.Tag;
      end;

      if edtCurso.Text <> '' then
      begin
         Filtros.Add(SFiltroCurso);
         Params.CreateParam(ftUnknown, 'CD_CURSO', ptUnknown).AsString := edtCurso.Text;
      end;

      if edtTurma.Text <> '' then
      begin
         Filtros.Add(SFiltroTurma);
         Params.CreateParam(ftUnknown, 'CD_TURMA', ptUnknown).AsString := edtTurma.Text;
      end;

      Filtro := '';

      for I := 0 to Filtros.Count - 1 do
      begin
         Filtro := Filtro + SOp + Filtros[I];
      end;

      SQL := Format(SQL, [Filtro]);

      DataSet.Close;
      DataSet.SQL.Text := SQL;

      for I := 0 to Params.Count - 1 do
      begin
         Param := DataSet.Params.FindParam(Params[I].Name);
         if Param <> nil then
         begin
            Param.Value := Params[I].Value;
         end;
      end;

      dbgPessoas.DataSource := DataSource;
      DataSet.Open;
      
   finally
      FreeAndNil(Filtros);
      FreeAndNil(Params);
   end;

   ChangeConfirmState;
end;

procedure TfSenhas.DoUpdate;
const
   SSQLUpdate =
      'UPDATE PESSOAS SET SN_SENHA_PROVISORIA = ?, DS_SENHA = MD5(?) WHERE CD_PESSOA = ?';

   SSQLUpdateSemSenha =
      'UPDATE PESSOAS SET SN_SENHA_PROVISORIA = ? WHERE CD_PESSOA = ?';


   SCaptionInfo = 'Informação';
   SCaptionOverwrite = 'Confirmação';
   SConfirmOverwrite =
      'Você selecionou a opção para redefinir as senhas já existentes. Isso irá redefinir as senhas das pessoas que já estão as utilizando. Tem certeza que deseja prosseguir?';
   SInfoSuccess =
      'As senhas foram redefinidas com sucesso. Os usuários que não estão sob a hierarquia do usuário autenticado não tiveram suas senhas redefinidas.';
var
   Statement: IZPreparedStatement;
   SQLSemSenha: Boolean;
begin
   if ((rgSenha.ItemIndex = 2) and (TCustomRadioGroup(rgsenha.Components[2]).Enabled)) then
   begin
      Statement := DM.conn.DbcConnection.PrepareStatement(SSQLUpdateSemSenha);
      SQLSemSenha := True;
   end
   else
   begin
      Statement := DM.conn.DbcConnection.PrepareStatement(SSQLUpdate);
      SQLSemSenha := False;
   end;


   if (((rgSenha.ItemIndex = 1) and ValidatePassword(edtNovaSenha.Text)) or
      ((rgSenha.ItemIndex = 0) or (rgSenha.ItemIndex = 2))) then
   begin
      if (not chkSobreescrever.Checked) or
         (MessageBox(Handle, PChar(SConfirmOverwrite), PChar(SCaptionOverwrite), MB_ICONQUESTION or MB_YESNO) = ID_YES) then
      begin
         dbgPessoas.DataSource.DataSet.First;
         while not dbgPessoas.DataSource.DataSet.Eof do
         begin

            if dbgPessoas.DataSource.DataSet.FieldByName('SN_BLOQUEAR').AsString = '0' then
            begin
               if (SQLSemSenha = True) then
               begin
                  Statement.SetString(1, 'S');
                  Statement.SetInt(2, dbgPessoas.DataSource.DataSet.FieldByName('CD_PESSOA').AsInteger);

                  Statement.ExecutePrepared;
               end;

               if (SQLSemSenha = False) then
               begin

                  if chkSobreescrever.Checked or
                     (dbgPessoas.DataSource.DataSet.FieldByName('SN_SENHA_PROVISORIA').AsString = 'S') or
                     (dbgPessoas.DataSource.DataSet.FieldByName('SN_SENHA_PROVISORIA').AsString = '') then
                  begin

                     if chkProvisoria.Checked then
                     begin
                        Statement.SetString(1, 'S')
                     end
                     else
                     begin
                        Statement.SetString(1, 'N');
                     end;

                     if rgSenha.ItemIndex = 0 then
                     begin
                        Statement.SetString(2, FormatDateTime('ddmmyy', dbgPessoas.DataSource.DataSet.FieldByName('DT_NASCIMENTO').AsDateTime))
                     end
                     else
                     begin
                        Statement.SetString(2, edtNovaSenha.Text);
                     end;

                     Statement.SetInt(3, dbgPessoas.DataSource.DataSet.FieldByName('CD_PESSOA').AsInteger);

                     Statement.ExecutePrepared;
                  end;

               end;
            end;

            dbgPessoas.DataSource.DataSet.Next;
         end;
         MessageBox(Handle, PChar(SInfoSuccess), PChar(SCaptionInfo), MB_ICONINFORMATION or MB_OK);
      end;
   end;
end;

procedure TfSenhas.edtNovaSenhaChange(Sender: TObject);
begin
   ChangeConfirmState;
end;

procedure TfSenhas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfSenhas.FormCreate(Sender: TObject);
begin
   meAnoSemestre.Text := DM.GetCurrYearSemester;

   edtGrupo.Enabled := DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Senhas.Gerenciar.Grupos', npAlterar, False);

   if not TUMNucleo.GetParametroUsaAnosemestre then
   begin
      meAnoSemestre.Visible := False;
      udAnoSemestre.Visible := False;
      lblAnoSemestre.Visible := False;   
   end;

   sbSelGrupo.Enabled := edtGrupo.Enabled;
   aniRunning.ResName := 'LOADING';
end;

procedure TfSenhas.qryAlunosCalcFields(DataSet: TDataSet);
begin
  if (qryAlunosSN_SENHA_PROVISORIA.AsString <> 'S') then
    qryAlunosSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryAlunosSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.qryPessoasCalcFields(DataSet: TDataSet);
begin
  if ( qryPessoasSN_SENHA_PROVISORIA.AsString <> 'S' ) then
    qryPessoasSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryPessoasSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.qryProfessoresCalcFields(DataSet: TDataSet);
begin
  if ( qryProfessoresSN_SENHA_PROVISORIA.AsString <> 'S' ) then
    qryProfessoresSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryProfessoresSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.qryRespAcadCalcFields(DataSet: TDataSet);
begin
  if ( qryRespAcadSN_SENHA_PROVISORIA.AsString <> 'S' ) then
    qryRespAcadSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryRespAcadSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.qryRespFinanCalcFields(DataSet: TDataSet);
begin
  if ( qryRespFinanSN_SENHA_PROVISORIA.AsString <> 'S' ) then
    qryRespFinanSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryRespFinanSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.qryRespUnificadoCalcFields(DataSet: TDataSet);
begin
  if ( qryRespUnificadoSN_SENHA_PROVISORIA.AsString <> 'S' ) then
    qryRespUnificadoSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryRespUnificadoSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.qryUsuariosCalcFields(DataSet: TDataSet);
begin
  if ( qryUsuariosSN_SENHA_PROVISORIA.AsString <> 'S' ) then
    qryUsuariosSN_SENHA_DESC.AsString := 'Definitiva'
  else
    qryUsuariosSN_SENHA_DESC.AsString := 'Provisória';
end;

procedure TfSenhas.rgSenhaClick(Sender: TObject);
begin
   edtNovaSenha.Enabled := rgSenha.ItemIndex = 1;
   ChangeConfirmState;

   if ((dbgPessoas.DataSource <> nil) and (not dbgPessoas.DataSource.DataSet.IsEmpty)) then
      dbgPessoas.DataSource.DataSet.First;

   {
   while not dbgPessoas. do
   begin
      if chkSobreescrever.Checked or
         (dbgPessoas.DataSource.DataSet.FieldByName('SN_SENHA_PROVISORIA').AsString <> 'S') then
      begin

      end;
      dbgPessoas.DataSource.DataSet.Next;
   end;
   }
end;

procedure TfSenhas.sbFiltrarClick(Sender: TObject);
begin
   DoFilter;
end;

procedure TfSenhas.sbLimparClick(Sender: TObject);
begin
   meAnoSemestre.Text := DM.GetCurrYearSemester;
   edtGrupo.Clear;
   edtGrupo.Tag := 0;
   edtPessoa.Clear;
   edtPessoa.Tag := 0;
   edtCurso.Clear;
   edtTurma.Clear;
end;

procedure TfSenhas.sbSelCursoClick(Sender: TObject);
var
   res: TResultadoFiltroCurso;
begin

   res := TfrmSelecionarCurso.Filtrar([]);

   if res.filtrado then
   begin
      edtCurso.Text := res.cd_curso;
      meAnoSemestre.Text := IntToStr(res.nr_anosemestre);
   end;
end;

procedure TfSenhas.sbSelGrupoClick(Sender: TObject);
var
   GroupTwoOrThree: Boolean;
begin
   if TfBuscaGrupo.SelectGroup then
   begin
      edtGrupo.Text := fBuscaGrupo.qryGruposDS_NOME_GRUPO.AsString;
      edtGrupo.Tag := fBuscaGrupo.qryGruposCD_GRUPO.AsInteger;
      pnlAtualizando.Visible := True;
      aniRunning.Active := True;
      DM.conn.ShowSQLHourGlass;
      Application.ProcessMessages;
      UpdateGroup(fBuscaGrupo.qryGruposCD_GRUPO.AsInteger);
      DM.conn.HideSQLHourGlass;
      aniRunning.Active := False;
      pnlAtualizando.Visible := False;
      Application.ProcessMessages;

      GroupTwoOrThree := (fBuscaGrupo.qryGruposCD_GRUPO.AsInteger in [2, 3, 6, 7 ]) or
      (fBuscaGrupo.qryGruposCD_GRUPO.AsInteger = 999);
      
      lblAnoSemestre.Enabled := GroupTwoOrThree;
      lblGrupo.Enabled := True;
      lblPessoa.Enabled := False;
      lblCurso.Enabled := GroupTwoOrThree OR (fBuscaGrupo.qryGruposDS_PAPEL.AsString = 'COORDENADOR')  ;
      lblTurma.Enabled := GroupTwoOrThree;

      meAnoSemestre.Enabled := GroupTwoOrThree;
      edtGrupo.Enabled := True;
      edtPessoa.Enabled := False;
      edtCurso.Enabled := GroupTwoOrThree OR (fBuscaGrupo.qryGruposDS_PAPEL.AsString = 'COORDENADOR') ;
      edtTurma.Enabled := GroupTwoOrThree;

      edtPessoa.Clear;
      edtPessoa.Tag := 0;

      udAnoSemestre.Enabled := GroupTwoOrThree;
      sbSelCurso.Enabled := GroupTwoOrThree OR (fBuscaGrupo.qryGruposDS_PAPEL.AsString = 'COORDENADOR')  ;
      sbSelTurma.Enabled := GroupTwoOrThree;

      if not GroupTwoOrThree then
      begin
         edtCurso.Clear;
         edtTurma.Clear;
      end;
   end;
end;

procedure TfSenhas.sbSelPessoaClick(Sender: TObject);
var
   res: TResultadoFiltroPessoa;
begin

   res := TfrmSelecionarPessoa.Filtrar([]);

   if res.filtrado then
   begin
      edtPessoa.Text := res.nm_pessoa;
      edtPessoa.Tag := res.cd_pessoa;
      
      meAnoSemestre.Enabled := False;
      udAnoSemestre.Enabled := False;

      edtPessoa.Enabled := True;
      edtGrupo.Enabled := False;
      edtCurso.Enabled := False;
      edtTurma.Enabled := False;

      sbSelCurso.Enabled := False;
      sbSelTurma.Enabled := False;

      lblAnoSemestre.Enabled := False;
      lblGrupo.Enabled := False;
      lblPessoa.Enabled := True;
      lblCurso.Enabled := False;
      lblTurma.Enabled := False;

      edtCurso.Clear;
      edtTurma.Clear;
      edtGrupo.Clear;
      edtGrupo.Tag := 0;

      DoFilter;
   end;
end;

procedure TfSenhas.sbSelTurmaClick(Sender: TObject);
var
   res:  TResultadoFiltroTurma;
begin

   res := TfrmSelecionarTurma.Filtrar([]);

   if res.filtrado then
   begin
      edtTurma.Text := res.cd_turma;
      edtCurso.Text := res.cd_curso;
      meAnoSemestre.Text := IntToStr(res.nr_anosemestre);
   end;
end;

procedure TfSenhas.udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSemestre.Text := DM.IncYearSemester(meAnoSemestre.Text)
   else if Button = btPrev then
      meAnoSemestre.Text := DM.DecYearSemester(meAnoSemestre.Text);
end;

procedure TfSenhas.UpdateGroup(const Group: Integer);
const
   SSQLUnidades =
      'SELECT DISTINCT ' +
         'C.CD_COLIGADA,' +
         'C.NM_COLIGADA ' +
      'FROM ' +
         'COLIGADAS C ' +
            'JOIN NU_GRUPOS_PESSOAS GP ON ' +
               '(C.CD_COLIGADA = GP.CD_COLIGADA) ' +
               'LEFT JOIN COLIGADAS C2 ON ' +
                  '(C.CD_COLIGADA_MATRIZ = C2.CD_COLIGADA) AND ' +
                  '(GP.CD_COLIGADA = C2.CD_COLIGADA) AND ' +
                  '(C2.SN_MATRIZ = 1) ' +
      'WHERE ' +
         '(C.SN_FINANCEIRO = 1 OR C.SN_ACADEMICO = 1) ';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := DM.conn.DbcConnection.PrepareStatement(SSQLUnidades);
   Statement.SetInt(1, DM.qryUsuarioCD_PESSOA.AsInteger);
   ResultSet := Statement.ExecuteQueryPrepared;
   try
      Statement := DM.conn.DbcConnection.PrepareStatement('CALL SPA_ATUALIZA_GRUPO(?, ?)');
      try
         while ResultSet.Next do
         begin
            Statement.SetInt(1, Group);
            Statement.SetInt(2, ResultSet.GetIntByName('CD_COLIGADA'));
            Statement.ExecutePrepared;
         end;
      finally
         Statement.Close;
      end;
   finally
      ResultSet.Close;
   end;
end;

function TfSenhas.ValidatePassword(const Password: string): Boolean;
const
   SDefMsg =
      'A senha informada não respeita os padrões definidos pela instituição para criação de senhas.';
   SError =
      '9 - Ocorreu um erro na validação da senha informada: '#13'%s';
   SSQLParms =
      'SELECT DS_VARIAVEL, DS_VALOR FROM PARAMETROS WHERE CD_COLIGADA = 0 AND DS_VARIAVEL IN (''senha_expr'', ''senha_erro_msg'')';
var
   I: Integer;
   RegExpr: TRegExpr;
   Expr, Msg: string;
   ResultSet: IZResultSet;
begin
   Result := True;
   
   ResultSet := DM.conn.DbcConnection.CreateStatement.ExecuteQuery(SSQLParms);
   
   while ResultSet.Next do
      if ResultSet.GetStringByName('DS_VARIAVEL') = 'senha_expr' then
         Expr := ResultSet.GetStringByName('DS_VALOR')
      else if ResultSet.GetStringByName('DS_VARIAVEL') = 'senha_erro_msg' then
         Msg := ResultSet.GetStringByName('DS_VALOR');

   ResultSet.Close;

   if Trim(Expr) <> '' then
   begin
      if Trim(Msg) = '' then Msg := SDefMsg;
      RegExpr := TRegExpr.Create;
      RegExpr.Expression := Expr;
      try
         for I := 1 to Length(Password) do
            if not RegExpr.Exec(Password[I]) then
            begin
               Result := False;
               MessageBox(Handle, PChar(Msg), PChar('Atenção'), MB_ICONERROR or MB_OK);
               Break;
            end;
         RegExpr.LastError;
      except
         on E: ERegExpr do
         begin
            Result := False;
            MessageBox(Handle, PChar(Format(SError, [E.Message])), PChar('Erro'), MB_ICONERROR or MB_OK);
         end;
      end;
   end
   else
      Result := True;
end;

end.
