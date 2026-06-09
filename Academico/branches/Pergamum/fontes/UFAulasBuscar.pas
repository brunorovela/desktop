unit UFAulasBuscar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, DB, ZAbstractRODataset, UZDataset, StdCtrls, Buttons,
   ComCtrls, Grids, DBGrids, UZSortedGrid, ZDbcIntfs, ZAbstractDataset;

type
   TfrmAulasBuscar = class(TForm)
      pnlFiltros: TPanel;
      lbleCurso: TLabeledEdit;
      sbBuscarCurso: TSpeedButton;
      lbleColigada: TLabeledEdit;
      sbBuscarUnidade: TSpeedButton;
      lbleTurma: TLabeledEdit;
      sbBuscarTurma: TSpeedButton;
      lbleDisciplina: TLabeledEdit;
      sbBuscarDisciplina: TSpeedButton;
      lbleGrupo: TLabeledEdit;
      lbleProfessor: TLabeledEdit;
      sbBuscarProfessor: TSpeedButton;
      sbBuscarGrupo: TSpeedButton;
      dtpDataInicio: TDateTimePicker;
      lblDataInicio: TLabel;
      lblDataFim: TLabel;
      dtpDataFim: TDateTimePicker;
      bbtnLimpar: TBitBtn;
      bbtnFiltrar: TBitBtn;
      bvlSep1: TBevel;
      pnlBotoes: TPanel;
      bvlSep2: TBevel;
      qryAulas: TUMZReadOnlyQuery;
      dbgAulas: TZSortedGrid;
      dsAulas: TDataSource;
      qryAulasCD_DIARIO_AULA: TLargeintField;
      qryAulasNR_AULA: TSmallintField;
      qryAulasNR_ANOSEMESTRE: TSmallintField;
      qryAulasCD_TURMA: TStringField;
      qryAulasNM_PESSOA: TStringField;
      qryAulasCD_CURSO: TStringField;
      qryAulasNR_ETAPA: TSmallintField;
      qryAulasDT_AULA: TDateTimeField;
      bbtnSelecionar: TBitBtn;
      bbtnCancelar: TBitBtn;
      lbleEstados: TLabeledEdit;
      lbleMunicipios: TLabeledEdit;
      sbBuscarEstado: TSpeedButton;
      sbBuscarMunicipio: TSpeedButton;
      qryAulasDS_DISCIPLINA: TStringField;
      qryAulasME_LOCAL_AULA: TMemoField;
    qryFiltros: TUMZQuery;
    qryFiltrosCD_USUARIO: TLargeintField;
    qryFiltrosDS_PARAMETRO: TStringField;
    qryFiltrosDS_VALOR: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgAulasDblClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bbtnLimparClick(Sender: TObject);
      procedure bbtnFiltrarClick(Sender: TObject);
      procedure sbBuscarGrupoClick(Sender: TObject);
      procedure sbBuscarProfessorClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure sbBuscarDisciplinaClick(Sender: TObject);
      procedure sbBuscarTurmaClick(Sender: TObject);
      procedure sbBuscarCursoClick(Sender: TObject);
      procedure sbBuscarUnidadeClick(Sender: TObject);
      procedure sbBuscarMunicipioClick(Sender: TObject);
      procedure sbBuscarEstadoClick(Sender: TObject);
   private
      FFiltroEstados: AnsiString;
      FFiltroMunicipios: AnsiString;
      FFiltroUnidade: Integer;
      FFiltroCurso: AnsiString;
      FFiltroTurma: AnsiString;
      FFiltroDisciplina: Integer;
      FFiltroProfessor: Integer;
      FFiltroGrupo: Integer;
      FFiltroAnoSemestre: Integer;
      procedure LoadFilters;
      procedure SaveFilters;
   end;

var
   frmAulasBuscar: TfrmAulasBuscar;

implementation

uses
   uDM, uFSelEstados, uFSelCidades, uFSelecionarColigada, uFSelecionarCurso,
   uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarPessoa,
   uFSelecionarGrupo, uUMNucleo, uLkJSON, ZConnection;

{$R *.dfm}

procedure TfrmAulasBuscar.bbtnFiltrarClick(Sender: TObject);
const
   SQLAulas =
      'SELECT ' +
         'A.CD_DIARIO_AULA,' +
         'A.NRO_AULA NR_AULA,' +
         'A.ANOSEMESTRE NR_ANOSEMESTRE,' +
         'A.TURMA CD_TURMA,' +
         'P.NM_PESSOA,' +
         'T.CURSO CD_CURSO,' +
         'T.SERIE NR_ETAPA,' +
         'A.`DATA` DT_AULA, ' +
         'D.DESCRICAO DS_DISCIPLINA,' +
         'A.`ME_LOCAL_AULA` ' +
      'FROM ' +
         'DIARIO_AULAS A ' +
            'JOIN TURMAS T ON ' +
               '(A.ANOSEMESTRE = T.ANOSEMESTRE) AND ' +
               '(A.TURMA = T.CODIGO) ' +
            'JOIN DISCIPLINAS D ON ' +
               '(A.DISCIPLINA = D.CODIGO) AND ' +
               '(T.CURSO = D.CURSO) ' +
            'JOIN COLIGADAS C ON ' +
               '(T.CD_COLIGADA = C.CD_COLIGADA) ' +
            'JOIN PESSOAS P ON ' +
               '(A.CD_PROFESSOR = P.CD_PESSOA) ' +
      'WHERE %s';

   SQLFiltroCurso = 'T.CURSO = :CD_CURSO';
   SQLFiltroProfessor = 'P.CD_PESSOA = :CD_PESSOA';
   SQLFiltroTurma = 'T.CODIGO = :CD_TURMA';
   SQLFiltroAnoSemestre = 'A.ANOSEMESTRE = :NR_ANOSEMESTRE';
   SQLFiltroDisciplina = 'A.DISCIPLINA = :CD_DISCIPLINA';
   SQLFiltroGrupo = 'A.CD_GRUPO = :CD_GRUPO';
   SQLFiltroDataInicio = 'A.`DATA` >= :DT_INICIO';
   SQLFiltroDataFim = 'A.`DATA` <= :DT_FIM';
   SQLFiltroEstado = 'C.DS_ESTADO IN (%s)';
   SQLFiltroMunicipio = 'C.CD_MUNICIPIO IN (%s)';
   SQLFiltroUnidade = 'T.CD_COLIGADA = :CD_COLIGADA';
   SQLOp = ' AND ';
var
   I: Integer;
   Params: TParams;
   Filters: TStrings;
   SQL, S: AnsiString;
begin
   Filters := TStringList.Create;
   Params := TParams.Create;
   try
      if FFiltroEstados <> EmptyStr then
      begin
         Filters.Add(Format(SQLFiltroEstado, [FFiltroEstados]));
      end;

      if FFiltroMunicipios <> EmptyStr then
      begin
         Filters.Add(Format(SQLFiltroMunicipio, [FFiltroMunicipios]));
      end;

      if FFiltroUnidade <> -1 then
      begin
         Filters.Add(SQLFiltroUnidade);
         Params.CreateParam(ftUnknown, 'CD_COLIGADA', ptUnknown).AsInteger := FFiltroUnidade;
      end;

      if FFiltroCurso <> EmptyStr then
      begin
         Filters.Add(SQLFiltroCurso);
         Params.CreateParam(ftUnknown, 'CD_CURSO', ptUnknown).AsString := FFiltroCurso;
      end;

      if FFiltroTurma <> EmptyStr then
      begin
         Filters.Add(SQLFiltroTurma);
         Params.CreateParam(ftUnknown, 'CD_TURMA', ptUnknown).AsString := FFiltroTurma;
      end;

      if FFiltroDisciplina <> -1 then
      begin
         Filters.Add(SQLFiltroDisciplina);
         Params.CreateParam(ftUnknown, 'CD_DISCIPLINA', ptUnknown).AsInteger := FFiltroDisciplina;
      end;

      if FFiltroProfessor <> -1 then
      begin
         Filters.Add(SQLFiltroProfessor);
         Params.CreateParam(ftUnknown, 'CD_PESSOA', ptUnknown).AsInteger := FFiltroProfessor;
      end;

      if FFiltroGrupo <> -1 then
      begin
         Filters.Add(SQLFiltroGrupo);
         Params.CreateParam(ftUnknown, 'CD_GRUPO', ptUnknown).AsInteger := FFiltroGrupo;
      end;

      if dtpDataInicio.Checked then
      begin
         Filters.Add(SQLFiltroDataInicio);
         Params.CreateParam(ftUnknown, 'DT_INICIO', ptUnknown).AsDate := dtpDataInicio.Date;
      end;

      if dtpDataFim.Checked then
      begin
         Filters.Add(SQLFiltroDataFim);
         Params.CreateParam(ftUnknown, 'DT_FIM', ptUnknown).AsDate := dtpDataFim.Date;
      end;

      if FFiltroAnoSemestre <> -1 then
      begin
         Filters.Add(SQLFiltroAnoSemestre);
         Params.CreateParam(ftUnknown, 'NR_ANOSEMESTRE', ptUnknown).AsInteger := FFiltroAnoSemestre;
      end;

      S := EmptyStr;

      for I := 0 to Filters.Count - 1 do
      begin
         if S <> EmptyStr then
            S := Format('%s%s', [S, SQLOp]);

         S := Format('%s%s', [S, Filters.Strings[I]]);
      end;

      if S <> EmptyStr then
      begin
         SQL := Format(SQLAulas, [S]);

         qryAulas.Close;
         qryAulas.SQL.Text := SQL;

         for I := 0 to Params.Count - 1 do
         begin
            qryAulas.ParamByName(Params.Items[I].Name).Value := Params.Items[I].Value;
         end;

         qryAulas.Open;
      end;
      
   finally
      FreeAndNil(Filters);
      FreeAndNil(Params);
   end;
end;

procedure TfrmAulasBuscar.bbtnLimparClick(Sender: TObject);
begin
   FFiltroEstados := EmptyStr;
   FFiltroMunicipios := EmptyStr;
   FFiltroUnidade := -1;
   FFiltroCurso := EmptyStr;
   FFiltroTurma := EmptyStr;
   FFiltroDisciplina := -1;
   FFiltroProfessor := -1;
   FFiltroGrupo := -1;
   FFiltroAnoSemestre := -1;

   lbleEstados.Clear;
   lbleMunicipios.Clear;
   lbleColigada.Clear;
   lbleCurso.Clear;
   lbleTurma.Clear;
   lbleDisciplina.Clear;
   lbleProfessor.Clear;
   lbleGrupo.Clear;
   dtpDataInicio.Checked := False;
   dtpDataFim.Checked := False;
end;

procedure TfrmAulasBuscar.dbgAulasDblClick(Sender: TObject);
begin
   if not qryAulas.IsEmpty then
   begin
      ModalResult := mrOk;
      CloseModal;
   end;
end;

procedure TfrmAulasBuscar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfrmAulasBuscar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := (not qryAulas.IsEmpty) or (ModalResult = mrCancel);   
end;

procedure TfrmAulasBuscar.FormCreate(Sender: TObject);
const
   SQLGruposDiario = 'SELECT COUNT(CD_GRUPO) FROM DIARIO_GRUPOS';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   I: Integer;
begin
   FFiltroEstados := EmptyStr;
   FFiltroMunicipios := EmptyStr;
   FFiltroUnidade := -1;
   FFiltroCurso := EmptyStr;
   FFiltroTurma := EmptyStr;
   FFiltroDisciplina := -1;
   FFiltroProfessor := -1;
   FFiltroGrupo := -1;
   FFiltroAnoSemestre := -1;

   dtpDataInicio.Date := Date;
   dtpDataFim.Date := Date;

   dtpDataInicio.Checked := False;
   dtpDataFim.Checked := False;

   try
      Stmt := DM.db.DbcConnection.PrepareStatement(SQLGruposDiario);
      ResultSet := Stmt.ExecuteQueryPrepared;

      if (not ResultSet.Next) or (ResultSet.GetInt(1) = 0) then
      begin
         lbleGrupo.Enabled := False;
         sbBuscarGrupo.Enabled := False;
      end;

   finally
      ResultSet.Close;
      Stmt.Close;
   end;

   qryAulasNR_ANOSEMESTRE.Visible := TUMNucleo.GetParametroUsaAnosemestre;

   if not qryAulasNR_ANOSEMESTRE.Visible then
   begin
      qryAulasNR_ANOSEMESTRE.Tag := 0;

      for I := 0 to dbgAulas.Columns.Count - 1 do
         if dbgAulas.Columns[I].FieldName = 'NR_ANOSEMESTRE' then
         begin
            dbgAulas.Columns[I].Visible := False;
            Break;         
         end;
   end;

   LoadFilters;
end;

procedure TfrmAulasBuscar.FormDestroy(Sender: TObject);
begin
   SaveFilters;
end;

procedure TfrmAulasBuscar.FormShow(Sender: TObject);
begin
   lbleEstados.SetFocus;
end;

procedure TfrmAulasBuscar.LoadFilters;
const
   FmtFilter = '%s.%%';
   FmtParameter = '%s.%s';
var
   S: AnsiString;
   JSON: TlkJSONbase;
begin
   S := Format(FmtFilter, [Name]);
   qryFiltros.Close;
   qryFiltros.ParamByName('CD_USUARIO').AsInteger := DM.iCdPessoaLogado;
   qryFiltros.ParamByName('DS_PARAMETRO').AsString := S;
   qryFiltros.Open;

   bbtnLimpar.Click;

   if not qryFiltros.IsEmpty then
   begin

      S := Format(FmtParameter, [Name, lbleEstados.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleEstados.Text := JSON.Field['component'].Value;
            FFiltroEstados := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleMunicipios.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleMunicipios.Text := JSON.Field['component'].Value;
            FFiltroMunicipios := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleColigada.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleColigada.Text := JSON.Field['component'].Value;
            FFiltroUnidade := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleCurso.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleCurso.Text := JSON.Field['component'].Value;
            FFiltroCurso := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleTurma.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleTurma.Text := JSON.Field['component'].Value;
            FFiltroTurma := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleDisciplina.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleDisciplina.Text := JSON.Field['component'].Value;
            FFiltroDisciplina := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleGrupo.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleGrupo.Text := JSON.Field['component'].Value;
            FFiltroGrupo := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, lbleProfessor.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            lbleProfessor.Text := JSON.Field['component'].Value;
            FFiltroProfessor := JSON.Field['value'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, dtpDataInicio.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            dtpDataInicio.DateTime := JSON.Field['component'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;

      S := Format(FmtParameter, [Name, dtpDataFim.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         JSON := TlkJSON.ParseText(UTF8Encode(qryFiltrosDS_VALOR.AsString));
         try
            dtpDataFim.DateTime := JSON.Field['component'].Value;
         finally
            FreeAndNil(JSON);
         end;
      end;
      
   end;
end;

procedure TfrmAulasBuscar.SaveFilters;
const
   FmtParameter = '%s.%s';
var
   S: AnsiString;
   JSON: TlkJSONobject;
begin
   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroEstados);
      JSON.Add('component', lbleEstados.Text);

      S := Format(FmtParameter, [Name, lbleEstados.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroMunicipios);
      JSON.Add('component', lbleMunicipios.Text);

      S := Format(FmtParameter, [Name, lbleMunicipios.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroUnidade);
      JSON.Add('component', lbleColigada.Text);

      S := Format(FmtParameter, [Name, lbleColigada.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroCurso);
      JSON.Add('component', lbleCurso.Text);

      S := Format(FmtParameter, [Name, lbleCurso.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroTurma);
      JSON.Add('component', lbleTurma.Text);

      S := Format(FmtParameter, [Name, lbleTurma.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroDisciplina);
      JSON.Add('component', lbleDisciplina.Text);

      S := Format(FmtParameter, [Name, lbleDisciplina.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroGrupo);
      JSON.Add('component', lbleGrupo.Text);

      S := Format(FmtParameter, [Name, lbleGrupo.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('value', FFiltroProfessor);
      JSON.Add('component', lbleProfessor.Text);

      S := Format(FmtParameter, [Name, lbleProfessor.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
         qryFiltros.Edit
      else
      begin
         qryFiltros.Insert;
         qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
         qryFiltrosDS_PARAMETRO.AsString := S;
      end;

      qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
      qryFiltros.Post;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('component', dtpDataInicio.DateTime);

      S := Format(FmtParameter, [Name, dtpDataInicio.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         if dtpDataInicio.Checked then
         begin
            qryFiltros.Edit;
            qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
            qryFiltros.Post;
         end
         else
            qryFiltros.Delete;
      end
      else
         if dtpDataInicio.Checked then
         begin
            qryFiltros.Insert;
            qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
            qryFiltrosDS_PARAMETRO.AsString := S;
            qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
            qryFiltros.Post;
         end;
         
   finally
      FreeAndNil(JSON);
   end;

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('component', dtpDataFim.DateTime);

      S := Format(FmtParameter, [Name, dtpDataInicio.Name]);

      if qryFiltros.Locate('DS_PARAMETRO', S, [loCaseInsensitive]) then
      begin
         if dtpDataFim.Checked then
         begin
            qryFiltros.Edit;
            qryFiltrosDS_VALOR.AsString := UTF8Decode(TlkJSON.GenerateText(JSON));
            qryFiltros.Post;
         end
         else
            qryFiltros.Delete;
      end
      else
         if dtpDataFim.Checked then
         begin
            qryFiltros.Insert;
            qryFiltrosCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
            qryFiltrosDS_PARAMETRO.AsString := S;
         end;

   finally
      FreeAndNil(JSON);
   end;

end;

procedure TfrmAulasBuscar.sbBuscarUnidadeClick(Sender: TObject);
begin
   if TfrmSelecionarColigada.ShowModal(lbleEstados.Text, lbleMunicipios.Text) then
   begin
      lbleColigada.Text := TfrmSelecionarColigada.getResultado.Nome;
      FFiltroUnidade := TfrmSelecionarColigada.getResultado.Codigo;
   end;
end;

procedure TfrmAulasBuscar.sbBuscarCursoClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroCurso;
begin
   if FFiltroUnidade = -1 then
      ResultadoFiltro := TfrmSelecionarCurso.Filtrar([])
   else
      ResultadoFiltro := TfrmSelecionarCurso.Filtrar([], FFiltroUnidade);

   if ResultadoFiltro.filtrado then
   begin
      lbleCurso.Text := ResultadoFiltro.cd_curso;
      FFiltroCurso := ResultadoFiltro.cd_curso;
      
      lbleColigada.Text := ResultadoFiltro.nm_coligada;
      FFiltroUnidade := ResultadoFiltro.cd_coligada;

      FFiltroAnoSemestre := ResultadoFiltro.nr_anosemestre;
   end;
end;

procedure TfrmAulasBuscar.sbBuscarDisciplinaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroDisciplina;
begin
   ResultadoFiltro := TfrmSelecionarDisciplina.Filtrar([bfdCurso],
      FFiltroCurso, DM.GetAnoSemestreAtual);

   if ResultadoFiltro.filtrado then
   begin
      lbleDisciplina.Text := ResultadoFiltro.ds_disciplina;
      FFiltroDisciplina := ResultadoFiltro.cd_disciplina;
      
      lbleCurso.Text := ResultadoFiltro.cd_curso;
      FFiltroCurso := ResultadoFiltro.cd_curso;

      FFiltroAnoSemestre := ResultadoFiltro.nr_anosemestre;
   end;
end;

procedure TfrmAulasBuscar.sbBuscarEstadoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelEstados, frmSelEstados);
   
   frmSelEstados.CarregaTelaFiltro(lbleEstados.Text, sceFromColigadas);

   if frmSelEstados.Filtrar then
   begin
      lbleEstados.Text := frmSelEstados.GetStrEstadosSelecionados(True);
      FFiltroEstados := frmSelEstados.GetStrEstadosSelecionados(False);
   end;   
end;

procedure TfrmAulasBuscar.sbBuscarMunicipioClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelCidades, frmSelCidades);
   frmSelCidades.CarregaTelaFiltro(FFiltroEstados, FFiltroMunicipios, sccFromColigadas);

   if frmSelCidades.Filtrar then
   begin
      lbleMunicipios.Text := frmSelCidades.GetStrCidadesSelecionadas(True);
      FFiltroMunicipios := frmSelCidades.GetIntCidadesSelecionadas;
   end;
end;

procedure TfrmAulasBuscar.sbBuscarProfessorClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if ResultadoFiltro.filtrado then
   begin
      FFiltroProfessor := ResultadoFiltro.cd_pessoa;
      lbleProfessor.Text := ResultadoFiltro.nm_pessoa;

      FFiltroAnoSemestre := ResultadoFiltro.nr_anosemestre;
   end;
   
end;

procedure TfrmAulasBuscar.sbBuscarTurmaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroTurma;
begin
   ResultadoFiltro.cd_coligada := -1;

   if FFiltroUnidade <> -1 then
      ResultadoFiltro.cd_coligada := FFiltroUnidade;

   ResultadoFiltro := TfrmSelecionarTurma.Filtrar([],
      DM.GetAnoSemestreAtual, ResultadoFiltro.cd_coligada, -1, FFiltroCurso);

   if ResultadoFiltro.filtrado then
   begin
      lbleColigada.Text := ResultadoFiltro.nm_coligada;
      FFiltroUnidade := ResultadoFiltro.cd_coligada;
      
      lbleCurso.Text := ResultadoFiltro.cd_curso;
      FFiltroCurso := ResultadoFiltro.cd_curso;
      
      lbleTurma.Text := ResultadoFiltro.cd_turma;
      FFiltroTurma := ResultadoFiltro.cd_turma;

      FFiltroAnoSemestre := ResultadoFiltro.nr_anosemestre;
   end;
end;

procedure TfrmAulasBuscar.sbBuscarGrupoClick(Sender: TObject);
const
   MsgSelecionarCurso = 'É necessário selecionar um curso antes de selecionar um grupo.';
var
   ResultadoFiltro: TResultadoFiltroGrupo;
begin

   if FFiltroCurso = EmptyStr then
   begin
      MessageDlg(MsgSelecionarCurso, mtWarning, [mbOK], 0);
      Exit;
   end;

   ResultadoFiltro := TfrmSelecionarGrupo.Filtrar([], FFiltroCurso,
      FFiltroAnoSemestre, FFiltroTurma, FFiltroDisciplina, FFiltroProfessor);   

   if ResultadoFiltro.filtrado then
   begin
      lbleGrupo.Text := ResultadoFiltro.nm_grupo;
      FFiltroGrupo := ResultadoFiltro.cd_grupo;

      lbleCurso.Text := ResultadoFiltro.cd_curso;   
      FFiltroCurso := ResultadoFiltro.cd_curso;

      lbleTurma.Text := ResultadoFiltro.cd_turma;      
      FFiltroTurma := ResultadoFiltro.cd_turma;

      lbleDisciplina.Text := ResultadoFiltro.ds_disciplina;
      FFiltroDisciplina := ResultadoFiltro.cd_disciplina;

      lbleProfessor.Text := ResultadoFiltro.nm_professor;
      FFiltroProfessor := ResultadoFiltro.cd_professor;
      
      FFiltroAnoSemestre := ResultadoFiltro.nr_anosemestre;
   end;
   
end;

end.
