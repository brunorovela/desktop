unit uFCopiaTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, StdCtrls, Grids, Buttons,
  Mask, ZDataset, UMDateTimePicker;

type
   TUMCheckBoxObj = class( TCheckBox )
   public
      FObjeto : TObject;
      FColigada : Integer;
   published
      property Objeto: TObject read FObjeto write FObjeto;
      property Coligada: Integer read FColigada write FColigada;
   end;

  TfCopiaTurma = class(TForm)
    pnTop: TPanel;
    pnTopEsquerda: TPanel;
    rgCopiarMaisUnidades: TRadioGroup;
    pnTopDireita: TPanel;
    pnRodape: TPanel;
    pnCentro: TPanel;
    pnCentroDireita: TPanel;
    pnCentroEsquerda: TPanel;
    pnCentroTopo: TPanel;
    pnCentroRodape: TPanel;
    sgCopiaTurmasColigadas: TStringGrid;
    bbtnSalvar: TBitBtn;
    pnRodape2: TPanel;
    pnAnosemestre: TPanel;
    Label1: TLabel;
    medAnosemestre: TMaskEdit;
    qryContaColigadas: TUMZReadOnlyQuery;
    bbtnCancelar: TSpeedButton;
    Panel1: TPanel;
    pnQuestionamentos: TPanel;
    Panel2: TPanel;
    rgCopiaGradesHorarios: TRadioGroup;
    rgCopiaDisciplinasTurmasProfessor: TRadioGroup;
    GroupBox1: TGroupBox;
    dtInicioFinan: TUMDateTimePicker;
    dtFimFinan: TUMDateTimePicker;
    Label20: TLabel;
    Label21: TLabel;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure rgCopiaDisciplinasTurmasProfessorClick(Sender: TObject);
    procedure sgCopiaTurmasColigadasDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgCopiarMaisUnidadesClick(Sender: TObject);
    procedure setCopiarMaisColigadas(Valor: Boolean);
    function getCopiarMaisColigadas(): Boolean;
    property CopiarMaisColigadas: Boolean   read getCopiarMaisColigadas write setCopiarMaisColigadas;
  private
    { Private declarations }
    FCurso, FColigadasFiltro: String;
    FColigada, FColigadaAtual: Integer;
    FAnoSemestre: Integer;

    FArrayColigadas, FArrayTurmas: TStringList;
    procedure setColigadaAtual(const Value: Integer);
    procedure setColigada(const Value: Integer);

    procedure MudarCheck(Sender: TObject);

    { Limpa StringGrid }
    procedure limparStringGrid();

    { Funções usadas pelas propertys }

    function getCopiarDisciplinasTurmasProfessor(): Boolean;
    procedure setCopiarDisciplinasTurmasProfessor(Valor: Boolean);
    function getCopiarGradesHorarios(): Boolean;
    procedure setCopiarGradesHorarios(Valor: Boolean);

    { Carrega o StringGrid de Turmas e Coligadas }
    procedure carregarTurmasFromCurso();
    procedure destroiObjetosAuxiliares();

    { Faz verificações antes da cópia de turma em si }
    function CopiarTurmas(): Boolean;
    { Verifica se o curso é ativo na coligada }
    function IsCursoAtivo( cd_curso: String; cd_coligada: Integer ): Boolean;
    { Verifica conflito de Turmas em outras coligadas }
    function temConflitoTurmaColigada(
         const cd_turma: String; const cd_coligada, nr_anosemestre: Integer ): Boolean;
    { Função que realmente executa a cópia de Turma }
    procedure CopiaTurmaEntreColigadas(
               const cd_turma, cd_turma_nova: String;
               const nr_anosemestre, nr_anosemestre_novo,
                     cd_coligada, cd_coligada_nova: Integer );
    procedure CopiarDisciplinasTurmasProfessorEntreColigadas(
               const cd_turma, cd_turma_nova: String;
               const nr_anosemestre, nr_anosemestre_novo,
                     cd_coligada: Integer );
    procedure CopiarGradesHorariosEntreColigadas(
               const cd_turma, cd_turma_nova: String;
               const nr_anosemestre, nr_anosemestre_novo,
                     cd_coligada: Integer );

    procedure AlinharCheks();

    { Propertys }
    property CopiarDisciplinasTurmasProfessor: Boolean
               read getCopiarDisciplinasTurmasProfessor
               write setCopiarDisciplinasTurmasProfessor;
    property CopiarGradesHorarios: Boolean
               read getCopiarGradesHorarios write setCopiarGradesHorarios;

    property Curso: String read FCurso write FCurso;
    property AnoSemestre: Integer read FAnoSemestre write FAnoSemestre;
    property Coligada: Integer read FColigada write setColigada;
    property ColigadaAtual: Integer read FColigadaAtual write setColigadaAtual;
    property ColigadasFiltro: String read FColigadasFiltro write FColigadasFiltro;
  public
    { Public declarations }
    procedure carregarTela(const cd_coligada, cd_coligada_atual: Integer; const coligadas, cd_curso: String; const nr_anosemestre: Integer; dt_inicio_finan,dt_fim_finan: TDate);
  end;

var
  fCopiaTurma: TfCopiaTurma;

implementation

uses uDM, uItemCombo, uUsuario, General, uCursos;

{$R *.dfm}

{ TfCopiaTurma }

procedure TfCopiaTurma.AlinharCheks;
var
   NewCheckBox: TUMCheckBoxObj;
   Rect: TRect;
   I: Integer;
begin
   for I := 1 to sgCopiaTurmasColigadas.RowCount do
   begin
      if not (sgCopiaTurmasColigadas.Objects[ 1, I ] is TUMCheckBoxObj) then
         Continue;                                                

      NewCheckBox := TUMCheckBoxObj(sgCopiaTurmasColigadas.Objects[ 1, I ]);

      if ( NewCheckBox <> nil ) then
      begin
         Rect := sgCopiaTurmasColigadas.CellRect(1, I);

         if ( Rect.Left = 0 ) AND ( Rect.Top = 0 ) then
            NewCheckBox.Visible := False
         else begin
            NewCheckBox.Left := sgCopiaTurmasColigadas.Left + Rect.Left + 72;
            NewCheckBox.Top := sgCopiaTurmasColigadas.Top + Rect.Top + 4;
            NewCheckBox.Visible := True;
         end;
      end;      
   end;
end;

procedure TfCopiaTurma.bbtnCancelarClick(Sender: TObject);
begin
   self.Close;
end;

procedure TfCopiaTurma.carregarTela(const cd_coligada, cd_coligada_atual: Integer; const coligadas, cd_curso: String; const nr_anosemestre: Integer;dt_inicio_finan,dt_fim_finan: TDate);
begin
   Curso := cd_curso;
   AnoSemestre := nr_anosemestre;
   Coligada := cd_coligada;
   ColigadaAtual := cd_coligada_atual;

   if ( coligadas = '' ) then
      ColigadasFiltro := '(-1)'
   else
      ColigadasFiltro := '(' + coligadas + ')';

   if not CopiarMaisColigadas then
      Coligada := ColigadaAtual;   

   medAnosemestre.Clear;
   //limparStringGrid();

   if DM.UsaAnosemestre then
      pnAnosemestre.Height := 30
   else
      pnAnosemestre.Height := 0;

   rgCopiarMaisUnidades.ItemIndex := -1;
   rgCopiaDisciplinasTurmasProfessor.ItemIndex := -1;
   rgCopiaGradesHorarios.ItemIndex := -1;

   dtInicioFinan.setDate(dt_inicio_finan);
   dtFimFinan.setDate(dt_fim_finan);

   Self.ShowModal;
end;

{ Esta ação carrega as coligadas na Grid,
  ATENÇÃO: Ela é chamada no evento OnClick do rgCopiarMaisUnidades, ao carregar a tela
            o valor do radiogroup é setado, já carregando as coligadas,
            por padrão somente a logada }
procedure TfCopiaTurma.carregarTurmasFromCurso();
var
   I, Linhas, Colunas: Integer;
   qyTurmas: TUMZReadOnlyQuery;
   CheckBox: TUMCheckBoxObj;
begin
   DM.CriarConsulta(qyTurmas);

   FArrayColigadas.Clear;
   FArrayTurmas.Clear;

   limparStringGrid();
   Linhas := 1;
   Colunas := 1;

   for I := 0 to DM.ArrayColigadasUsuario.Count - 1 do
   begin
      if (not CopiarMaisColigadas) AND
         (IntToStr(ColigadaAtual) <> TItemCombo(DM.ArrayColigadasUsuario.Objects[I]).getCodigo() ) then
         Continue;

      if DM.UsuarioLogado.TemPermissao( 1148, npIncluir, True,
                                        StrToInt(TItemCombo(DM.ArrayColigadasUsuario.Objects[I]).getCodigo()) ) AND
         (IsCursoAtivo( Curso, StrToInt(TItemCombo(DM.ArrayColigadasUsuario.Objects[I]).getCodigo()) )) then
      begin
         FArrayColigadas.AddObject(
            TItemCombo(DM.ArrayColigadasUsuario.Objects[I]).getCodigo(),
            DM.ArrayColigadasUsuario.Objects[I]);

         Inc(Colunas);
         sgCopiaTurmasColigadas.Cells[FArrayColigadas.Count, 0] := TItemCombo(DM.ArrayColigadasUsuario.Objects[I]).getDescricao();
      end;
   end;

   if ((( CopiarMaisColigadas ) OR ( not CopiarMaisColigadas AND not DM.UsaAnosemestre )) AND
      not (((FArrayColigadas.Count = 1) AND (Coligada = StrToInt(TItemCombo(FArrayColigadas.Objects[0]).getCodigo())))) OR
      ((FArrayColigadas.Count = 1) AND (not DM.UsaAnosemestre))) then
      sgCopiaTurmasColigadas.Options := sgCopiaTurmasColigadas.Options + [goEditing]
   else
      sgCopiaTurmasColigadas.Options := sgCopiaTurmasColigadas.Options - [goEditing];   

   with qyTurmas do
   begin
      SQL.Clear();
      SQL.Add( ' SELECT codigo AS cd_turma, cd_coligada ' );
      SQL.Add( ' FROM turmas ' );
      SQL.Add( ' WHERE curso = :cd_curso AND ' );

      if DM.UsaAnosemestre then
      begin
         SQL.Add('anosemestre = :nr_anosemestre ');
         ParamByName('nr_anosemestre').AsInteger := AnoSemestre;
      end
      else
      begin
         SQL.Add('sn_ativa = :sn_ativa');
         ParamByName('sn_ativa').AsInteger := frmCursos.UMFiltroDataAnoSem.getTurmasAtivas();

         if ( frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked ) then
         begin
            SQL.Add(' AND DATE_FORMAT(datainicio, :formato) >= :datainicio ');
            ParamByName('datainicio').AsString := frmCursos.UMFiltroDataAnoSem.getDataInicio();
         end;

         if ( frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked ) then
         begin
            SQL.Add(' AND DATE_FORMAT(datafim, :formato) <= :datafim ');
            ParamByName('datafim').AsString := frmCursos.UMFiltroDataAnoSem.getDataFim();
         end;

         if frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked OR
            frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked then
            ParamByName('formato').AsString := DATE_FORMAT_GERAL;
      end;

      if (Coligada > 0) and (ColigadaAtual >= 1) then
      begin
         SQL.Add('AND cd_coligada IN ' + ColigadasFiltro);
      end;
      
      ParamByName( 'cd_curso' ).AsString := Curso;

      Open();

      while not Eof do
      begin
         FArrayTurmas.AddObject(FieldByName('cd_turma').AsString, TItemCombo.Create(FieldByName('cd_coligada').AsString, ''));

         Inc(Linhas);

         sgCopiaTurmasColigadas.Cells[0, RecNo] := FieldByName('cd_turma').AsString;
         if (
               ((not CopiarMaisColigadas) AND DM.UsaAnosemestre) OR
               (
                  (FArrayColigadas.Count = 1) AND
                  (Coligada = StrToInt(TItemCombo(FArrayColigadas.Objects[0]).getCodigo()))
               ) AND
               not ((FArrayColigadas.Count = 1) AND (not DM.UsaAnosemestre))) then
         begin
            CheckBox := TUMCheckBoxObj.Create(pnCentro);

            CheckBox.Caption := '';
            CheckBox.Visible := False;
            CheckBox.Parent := pnCentro;
            CheckBox.Color := clWhite;
            CheckBox.Width := 14;
            CheckBox.Objeto := TItemCombo.Create( FieldByName('cd_turma').AsString, '0', '' );
            CheckBox.Coligada := FieldByName('cd_coligada').AsInteger;
            CheckBox.OnClick := MudarCheck;

            sgCopiaTurmasColigadas.Objects[1, qyTurmas.RecNo] := CheckBox;
         end;

         Next();
      end;
   end;

   if Colunas = 1 then
      Inc(Colunas);
   if Linhas = 1 then
      Inc(Linhas);

   sgCopiaTurmasColigadas.ColCount := Colunas;
   sgCopiaTurmasColigadas.RowCount := Linhas;
end;

procedure TfCopiaTurma.CopiarDisciplinasTurmasProfessorEntreColigadas(
  const cd_turma, cd_turma_nova: String; const nr_anosemestre,
  nr_anosemestre_novo, cd_coligada: Integer);
var
   qyCopiaDisciplinasTurmasProfessor: TUMZQuery;
   campos: String;
begin
   DM.CriarConsulta(qyCopiaDisciplinasTurmasProfessor);

   with qyCopiaDisciplinasTurmasProfessor do
   begin
      SQL.Clear();

      campos :=
         ' cd_turmaprofessor, anosemestre, curso, turma, disciplina, ' +
         ' professor, numeroaulas, situacao, cd_categoria, ds_sala ';
      SQL.Add( ' INSERT INTO turmasprofessores ( ' + campos + ' ) ' );

      campos :=
         ' NULL, :nr_anosemestre_novo, tp.curso, :cd_turma_nova, tp.disciplina, ' +
         ' tp.professor, tp.numeroaulas, tp.situacao, tp.cd_categoria, tp.ds_sala ';
      SQL.Add( ' SELECT ' + campos + ' FROM turmas t ' );
      SQL.Add( ' INNER JOIN turmasprofessores tp ON ( tp.curso = t.curso AND tp.turma = t.codigo AND tp.anosemestre = t.anosemestre )' );
      SQL.Add( '    WHERE t.anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '          t.codigo = :cd_turma AND t.cd_coligada = :cd_coligada ' );

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;

      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_turma_nova').AsString := cd_turma_nova;

      ParamByName('cd_coligada').AsInteger := cd_coligada;
      ExecSQL;
   end;
end;

procedure TfCopiaTurma.CopiarGradesHorariosEntreColigadas(const cd_turma,
  cd_turma_nova: String; const nr_anosemestre, nr_anosemestre_novo,
  cd_coligada: Integer);
var
   qyCopiaHorariosTurmas: TUMZQuery;
   campos: String;
begin
   DM.CriarConsulta(qyCopiaHorariosTurmas);

   with qyCopiaHorariosTurmas do
   begin
      SQL.Clear();

      campos :=
         ' nr_anosemestre, cd_turma, cd_horario, nr_dia_semana, cd_disciplina, ' +
         ' cd_professor, cd_turma_base, ds_legenda, dt_inicial, dt_final, sn_ativo ';

      SQL.Add( ' INSERT INTO turmas_horarios_config ( ' + campos + ' ) ' );

      campos :=
         ' :nr_anosemestre_novo, :cd_turma_nova, thc.cd_horario, ' +
         ' thc.nr_dia_semana, thc.cd_disciplina, thc.cd_professor, thc.cd_turma_base, ' +
         ' thc.ds_legenda, NULL, NULL, 1 ';
      SQL.Add( ' SELECT ' + campos + ' FROM turmas t ' );
      SQL.Add( ' INNER JOIN turmas_horarios_config thc ON ( thc.nr_anosemestre = t.anosemestre AND thc.cd_turma_base = t.codigo AND thc.cd_turma_base = thc.cd_turma )' );
      SQL.Add( '    WHERE t.anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '          t.codigo = :cd_turma AND t.cd_coligada = :cd_coligada AND thc.sn_ativo = 1 ' );

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;

      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_turma_nova').AsString := cd_turma_nova;

      ParamByName('cd_coligada').AsInteger := cd_coligada;
      ExecSQL;
   end;
end;

function TfCopiaTurma.CopiarTurmas: Boolean;
var
   IColigada, ITurma: Integer;
   cd_turma_antiga, cd_turma_nova: String;
   cd_coligada_nova, nr_anosemestre, i: Integer;
   tem_conflito, sair_fora: Boolean;
begin
   tem_conflito := False;
   Result := False;

   if ( DM.UsaAnosemestre ) then
      nr_anosemestre := StrToInt(ReplaceStr(medAnosemestre.Text, '/', ''))
   else
      nr_anosemestre := ANOSEMESTRE_PADRAO;

   if ( CopiarMaisColigadas ) OR
      ((FArrayColigadas.Count = 1) AND (not DM.UsaAnosemestre)) then
   begin
      tem_conflito := true;
      sair_fora := False;
      while tem_conflito AND not sair_fora do
      begin
         tem_conflito := false;

         for IColigada := 0 to FArrayColigadas.Count - 1 do
         begin
            for ITurma := 0 to FArrayTurmas.Count - 1 do
            begin
               if (trim(sgCopiaTurmasColigadas.Cells[ IColigada+1, ITurma+1 ]) <> '') then
               begin
                  cd_turma_nova := sgCopiaTurmasColigadas.Cells[ IColigada+1, ITurma+1 ];
                  cd_coligada_nova := StrToInt(TItemCombo(FArrayColigadas.Objects[IColigada]).getCodigo());

                  if (temConflitoTurmaColigada(cd_turma_nova, cd_coligada_nova, nr_anosemestre)) then
                  begin
                     tem_conflito := True;

                     {if DM.UsaAnosemestre then begin}
                        if InputQuery('Código Inválido','A turma de código "' + cd_turma_nova + '"  já existe na unidade de ensino "' + TItemCombo(FArrayColigadas.Objects[IColigada]).getDescricao() + '".'+Chr(13)+'Informe um novo código:',cd_turma_nova) then
                        begin
                           sgCopiaTurmasColigadas.Cells[ IColigada+1, ITurma+1 ] := cd_turma_nova;
                        end else begin
                           sair_fora := True;
                        end;
                        break;
                     {end
                     else
                     begin
                        Mensagem(
                           'Foi detectado que a turma "' + cd_turma_nova + '" já existe na coligada "' + TItemCombo(FArrayColigadas.Objects[IColigada]).getDescricao() + '"',
                           'Conflito de Turmas', MB_OK + MB_ICONWARNING, Handle
                        );
                     end;}
                  end;
               end;
            end;
         end;
      end;

      if (not tem_conflito) AND not sair_fora then
      begin
         for IColigada := 0 to FArrayColigadas.Count - 1 do
            for ITurma := 0 to FArrayTurmas.Count - 1 do
               if (trim(sgCopiaTurmasColigadas.Cells[ IColigada+1, ITurma+1 ]) <> '') then
               begin
                  cd_turma_nova := sgCopiaTurmasColigadas.Cells[ IColigada+1, ITurma+1 ];
                  cd_coligada_nova := StrToInt(TItemCombo(FArrayColigadas.Objects[IColigada]).getCodigo());           

                  CopiaTurmaEntreColigadas(
                     FArrayTurmas[ITurma], cd_turma_nova,
                     AnoSemestre, nr_anosemestre,
                     StrToInt(TItemCombo(FArrayTurmas.Objects[ITurma]).getCodigo()), cd_coligada_nova
                  );              
               end;
         Mensagem('Turmas copiadas com sucesso!', 'Cópia de Turma', MB_OK + MB_ICONINFORMATION, Handle);
         Result := True;
      end;
   end
   else
   begin
      tem_conflito := true;
      sair_fora := False;
      while tem_conflito AND not sair_fora do begin
         tem_conflito := false;
         for I := 0 to pnCentro.ComponentCount - 1 do
         begin
            if ( pnCentro.Components[I] is TUMCheckBoxObj ) AND
               ( TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).getDescricao() = '1' ) then
            begin
               //
               cd_turma_nova := TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).getCodigo();
               cd_coligada_nova := Coligada;

               if Trim(TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).getVariavel()) = '' then
               begin
                  TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).setVariavel(cd_turma_nova);
               end;

               if (temConflitoTurmaColigada(cd_turma_nova, cd_coligada_nova, nr_anosemestre)) then
               begin
                  tem_conflito := True;
                  if DM.UsaAnosemestre then begin
                     if InputQuery('Código Inválido','A turma de código "' + cd_turma_nova + '"  já existe na unidade de ensino "' + TItemCombo(FArrayColigadas.Objects[IColigada]).getDescricao() + '".'+Chr(13)+'Informe um novo código:',cd_turma_nova) then
                     begin
                        TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).setCodigo(cd_turma_nova);
                     end else begin
                        sair_fora := True;
                     end;
                     break;
                  end
                  else
                  begin
                     Mensagem(
                        'Foi detectado que a turma "' + cd_turma_nova + '" já existe na coligada "' + TItemCombo(FArrayColigadas.Objects[IColigada]).getDescricao() + '"',
                        'Conflito de Turmas', MB_OK + MB_ICONWARNING, Handle
                     );
                  end;
               end;
            end;
         end;
      end;      

      if not(tem_conflito) AND not(sair_fora) then
      begin
         for I := 0 to pnCentro.ComponentCount - 1 do
         begin
            if ( pnCentro.Components[I] is TUMCheckBoxObj ) AND
               ( TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).getDescricao() = '1' ) then
            begin
               cd_turma_antiga := TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).getVariavel();
               cd_turma_nova := TItemCombo(TUMCheckBoxObj( pnCentro.Components[I] ).Objeto).getCodigo();
               cd_coligada_nova := Coligada;

               if ( cd_turma_antiga = '' ) then
                  cd_turma_antiga := cd_turma_nova;               

               CopiaTurmaEntreColigadas(
                  cd_turma_antiga,
                  cd_turma_nova,
                  AnoSemestre,
                  nr_anosemestre,
                  TUMCheckBoxObj( pnCentro.Components[I] ).Coligada,
                  cd_coligada_nova
               );

               if ( CopiarDisciplinasTurmasProfessor ) then
                  CopiarDisciplinasTurmasProfessorEntreColigadas(
                     cd_turma_antiga,
                     cd_turma_nova,
                     AnoSemestre,
                     nr_anosemestre,
                     Coligada
                  );


               if ( CopiarGradesHorarios ) then
                  CopiarGradesHorariosEntreColigadas(
                     cd_turma_antiga,
                     cd_turma_nova,
                     AnoSemestre,
                     nr_anosemestre,
                     Coligada
                  );
            end;         
         end;
         Result := True;
         Mensagem(
            'Turmas copiadas com sucesso!',
            'Cópia de Turma',
            MB_OK + MB_ICONINFORMATION,
            Handle
         );
      end;
   end;
end;

procedure TfCopiaTurma.CopiaTurmaEntreColigadas(const cd_turma,
  cd_turma_nova: String; const nr_anosemestre, nr_anosemestre_novo, cd_coligada,
  cd_coligada_nova: Integer);
var
   qyCopiaTurma: TUMZQuery;
   campos, ignore: String;
begin
   DM.CriarConsulta(qyCopiaTurma);

   with qyCopiaTurma do
   begin
      { Cópia a Turma }
      SQL.Clear();

      campos :=
         ' anosemestre, codigo, curso, grau, serie, turno, descricao, ' +
         ' contrato, vagas, sn_bloquear_vagas, horainicio, horafim, ' +
         ' datainicio, datafim, idadeconclusao, dataconclusao, ' +
         ' diassemanaisletivos, horarioletivo, horasaula, obshistorico, ' +
         ' professor_responsavel, sn_inscricao_online, cd_avaliacao, ' +
         ' vl_ordem, cd_campus, cd_proxima_turma, cd_centro, ' +
         ' sn_terminal_acesso, cd_caixa, sn_usar_plano, sn_alterar_boleto, cd_coligada, nr_min_alunos, ' +
         ' cd_grade, sn_bloquear_disc_pendentes, cd_etapa_mec, ' +
         ' cd_unidade_certificadora, sn_turma_especial, id_turma, cd_sala,  ' +
         ' sn_ativa, obscontrato, obsgerais, cd_situacao, dt_inicio_monografia, dt_fim_monografia, '+
         ' dt_inicio_financeiro, dt_fim_financeiro';

      if (nr_anosemestre = nr_anosemestre_novo) then
      begin
         campos := campos + ', cd_plano_padrao ';
      end;

      SQL.Add( ' INSERT INTO turmas ( ' + campos + ' ) ' );

      campos :=
         ' :nr_anosemestre_novo, :cd_turma_nova, curso, grau, serie, turno, descricao, ' +
         ' contrato, vagas, sn_bloquear_vagas, horainicio, horafim, ' +
         ' :datainicio, :datafim, idadeconclusao, :datafim, ' +
         ' diassemanaisletivos, horarioletivo, horasaula, obshistorico, ' +
         ' professor_responsavel, sn_inscricao_online, cd_avaliacao, ' +
         ' vl_ordem, cd_campus, cd_proxima_turma, cd_centro, ' +
         ' sn_terminal_acesso, cd_caixa, sn_usar_plano, sn_alterar_boleto, :cd_coligada_nova, nr_min_alunos, ' +
         ' cd_grade, sn_bloquear_disc_pendentes, cd_etapa_mec, ' +
         ' cd_unidade_certificadora, sn_turma_especial, NULL, cd_sala,  ' +
         ' sn_ativa, obscontrato, obsgerais, cd_situacao, dt_inicio_monografia, dt_fim_monografia, '+
         ' :datainicio, :datafim';

      if (nr_anosemestre = nr_anosemestre_novo) then
      begin
         campos := campos + ', cd_plano_padrao ';
      end;

      SQL.Add( '    SELECT ' + campos + ' FROM turmas ' );
      SQL.Add( '    WHERE anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '          codigo = :cd_turma AND cd_coligada = :cd_coligada ' );

      qyCopiaTurma.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      qyCopiaTurma.ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;

      qyCopiaTurma.ParamByName('cd_turma').AsString := cd_turma;
      qyCopiaTurma.ParamByName('cd_turma_nova').AsString := cd_turma_nova;

      qyCopiaTurma.ParamByName('cd_coligada').AsInteger := cd_coligada;
      qyCopiaTurma.ParamByName('cd_coligada_nova').AsInteger := cd_coligada_nova;

      qyCopiaTurma.ParamByName('datainicio').AsDate := dtInicioFinan.getDate;
      qyCopiaTurma.ParamByName('datafim').AsDate := dtFimFinan.getDate;

      ExecSQL;

      frmCursos.setTurmaCentroCusto(
         cd_turma_nova,
         nr_anosemestre_novo,
         True
      );

      ignore := '';
      if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         ignore := 'IGNORE';      

      { Copia os dados extras da turma }
      SQL.Clear;
      campos :=
         ' cd_curso, cd_turma, cd_campo, ds_conteudo, nr_anosemestre ';
      SQL.Add( ' INSERT '+ignore+' INTO cursos_turmas_cadastro ( ' + campos + ' ) ' );

      campos :=
         ' ctc.cd_curso, :cd_turma_nova, ctc.cd_campo, ctc.ds_conteudo, :nr_anosemestre_novo ';
      SQL.Add( ' SELECT ' + campos + ' FROM turmas t ' );
      SQL.Add( ' INNER JOIN cursos_turmas_cadastro ctc ON (ctc.cd_turma = t.codigo and ctc.nr_anosemestre = t.anosemestre) ' );
      SQL.Add( '    WHERE t.anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '          t.codigo = :cd_turma AND t.cd_coligada = :cd_coligada ' );
      SQL.Add( ' GROUP BY t.codigo ' );

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;

      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_turma_nova').AsString := cd_turma_nova;

      ParamByName('cd_coligada').AsInteger := cd_coligada;

      ExecSQL;

      { Copia os dados extras da turma (memo) }
      SQL.Clear;
      campos :=
         ' cd_curso, cd_turma, cd_campo, ds_conteudo, nr_anosemestre ';
      SQL.Add( ' INSERT '+ignore+' INTO cursos_turmas_cadastro_memo ( ' + campos + ' ) ' );

      campos :=
         ' ctcm.cd_curso, :cd_turma_nova, ctcm.cd_campo, ctcm.ds_conteudo, :nr_anosemestre_novo ';
      SQL.Add( ' SELECT ' + campos + ' FROM turmas t ' );
      SQL.Add( ' INNER JOIN cursos_turmas_cadastro_memo ctcm ON (ctcm.cd_turma = t.codigo and ctcm.nr_anosemestre = t.anosemestre) ' );
      SQL.Add( '    WHERE t.anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '          t.codigo = :cd_turma AND t.cd_coligada = :cd_coligada ' );
      SQL.Add( ' GROUP BY t.codigo ');

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;

      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_turma_nova').AsString := cd_turma_nova;

      ParamByName('cd_coligada').AsInteger := cd_coligada;

      ExecSQL;

      { Copia os anexos vinculados a turma }
      SQL.Clear;
      campos :=
         ' cd_curso, cd_turma, cd_campo, nm_arquivo, me_arquivo, tipo_arquivo, nr_anosemestre ';
      SQL.Add( ' INSERT '+ignore+' INTO cursos_turmas_cadastro_arq ( ' + campos + ' ) ' );

      campos :=
         ' ctca.cd_curso, :cd_turma_nova, ctca.cd_campo, ctca.nm_arquivo, ctca.me_arquivo, ctca.tipo_arquivo, :nr_anosemestre_novo ';
      SQL.Add( ' SELECT ' + campos + ' FROM turmas t ' );
      SQL.Add( ' INNER JOIN cursos_turmas_cadastro_arq ctca ON (ctca.cd_turma = t.codigo and ctca.nr_anosemestre = t.anosemestre) ' );
      SQL.Add( '    WHERE t.anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '          t.codigo = :cd_turma AND t.cd_coligada = :cd_coligada ' );
      SQL.Add( ' GROUP BY t.codigo ');

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;

      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_turma_nova').AsString := cd_turma_nova;

      ParamByName('cd_coligada').AsInteger := cd_coligada;

      ExecSQL;

      SQL.Clear;

      SQL.TEXT := ''+
         'INSERT INTO turmas_disciplinas_optativas (  '+
	      '  nr_anosemestre,                           '+
	      '  cd_curso,                                 '+
	      '  cd_turma,                                 '+
	      '  cd_disciplina_generica,                   '+
	      '  cd_disciplina_optativa                    '+
         ')                                           '+
         'SELECT                                      '+
	      '  :nr_anosemestre_novo,                     '+
	      '  cd_curso,                                 '+
	      '  :cd_turma_nova,                           '+
	      '  cd_disciplina_generica,                   '+
	      '  cd_disciplina_optativa                    '+
         'FROM                                        '+
	      '  turmas_disciplinas_optativas              '+
         'WHERE                                       '+
	      '  nr_anosemestre = :nr_anosemestre_antigo   '+
         '  AND cd_turma =  :cd_turma_antiga          ';

      ParamByName('nr_anosemestre_novo').AsInteger := nr_anosemestre_novo;
      ParamByName('nr_anosemestre_antigo').AsInteger := nr_anosemestre;

      ParamByName('cd_turma_nova').AsString := cd_turma_nova;
      ParamByName('cd_turma_antiga').AsString := cd_turma;

      ExecSQL;
            
   end;
 end;

procedure TfCopiaTurma.destroiObjetosAuxiliares;
var
   I: Integer;
begin
   for I := pnCentro.ComponentCount - 1 downto 0 do
      if ( pnCentro.Components[ I ] is TUMCheckBoxObj ) then
         pnCentro.Components[ I ].Destroy;
end;

procedure TfCopiaTurma.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
   erros: String;
begin
   CanClose := True;

   if Self.ModalResult = mrOk then
   begin
      CanClose := False;

      erros := '';

      if rgCopiarMaisUnidades.ItemIndex = -1 then
      begin
         erros := erros + #13 + '    - Deseja copiar as turmas para mais unidades de ensino?';
      end;

      if (not CopiarMaisColigadas) AND (rgCopiaDisciplinasTurmasProfessor.ItemIndex = -1) then
      begin
         erros := erros + #13 + '    - Deseja copiar as disciplinas e turmas do professor?';
      end;

      if (not CopiarMaisColigadas) AND (CopiarDisciplinasTurmasProfessor) AND (rgCopiaGradesHorarios.ItemIndex = -1) then
      begin
         erros := erros + #13 + '    - Deseja copiar as grades de horários?';
      end;

      if erros <> '' then
      begin
         Mensagem('É necessário preencher as seguintes informações antes de prosseguir: ' + erros, '', MB_OK + MB_ICONWARNING, Handle);
         Exit;
      end;

      if (DM.UsaAnosemestre) then
      begin
         try
            { Parece loucura, mas isso serve para saber se o anosemestre está valido }
            if ( Length(IntToStr( StrToInt( ReplaceStr( medAnosemestre.Text, '/', '' ) ) )) = 5 ) then
            begin
               //
            end
            else
            begin
               Mensagem('O Ano/Semestre deve possuir 5 dígitos', 'Atenção', MB_OK + MB_ICONEXCLAMATION, Handle);
               Exit;
            end;
         except
            Mensagem('Ano/Semestre inválido, o Ano/Semestre deve possuir 5 dígitos', 'Atenção', MB_OK + MB_ICONEXCLAMATION, Handle);
            Exit;
         end;
      end;

      CanClose := CopiarTurmas();
   end;
end;

procedure TfCopiaTurma.FormCreate(Sender: TObject);
begin
   FArrayColigadas := TStringList.Create();
   FArrayTurmas := TStringList.Create();
end;

procedure TfCopiaTurma.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5: bbtnSalvar.Click;
      VK_F6: bbtnCancelar.Click;
   end;
end;

procedure TfCopiaTurma.FormShow(Sender: TObject);
var
   qryVerificaCursos: TUMZQuery;
begin

   DM.CriarConsulta(qryVerificaCursos);

   qryVerificaCursos.SQL.Text := ''+
      ' SELECT '+
      ' 	COUNT(*) as quantidade '+
      ' FROM '+
      ' 	cursos_coligadas '+
      ' WHERE '+
      ' CD_CURSO = :cd_curso';

   qryVerificaCursos.ParamByName('cd_curso').AsString := FCurso;   

   qryVerificaCursos.Open;

   qryContaColigadas.Close;
   qryContaColigadas.Open;
   
   if (qryContaColigadas.FieldByName('cont').AsInteger = 1) or (qryVerificaCursos.FieldByName('quantidade').AsInteger = 1) then
   begin
      pnTop.Visible := false;
      rgCopiarMaisUnidades.ItemIndex := 1;
      rgCopiarMaisUnidadesClick(nil);
   end
   else
   begin
      rgCopiarMaisUnidades.ItemIndex := -1;
      pnTop.Visible := true;
   end;
end;

{ Função chamada pela PROPERTY CopiarMaisColigadas }
function TfCopiaTurma.getCopiarDisciplinasTurmasProfessor: Boolean;
begin
   Result := (rgCopiaDisciplinasTurmasProfessor.ItemIndex = 0);
end;

function TfCopiaTurma.getCopiarGradesHorarios: Boolean;
begin
   Result := (rgCopiaGradesHorarios.ItemIndex = 0);
end;

function TfCopiaTurma.getCopiarMaisColigadas: Boolean;
begin
   Result := (rgCopiarMaisUnidades.ItemIndex = 0);
end;

function TfCopiaTurma.IsCursoAtivo(cd_curso: String;
  cd_coligada: Integer): Boolean;
var
   qyVerificaCursoAtivo: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyVerificaCursoAtivo);
   Result := False;

   with qyVerificaCursoAtivo do
   begin
      SQL.Clear();
      SQL.Add( ' SELECT count(cd_curso) AS registros ' );
      SQL.Add( ' FROM cursos_coligadas ' );
      SQL.Add( ' WHERE cd_coligada = :cd_coligada AND cd_curso = :cd_curso AND ' );
      SQL.Add( '       sn_ativo = 1 ' );

      ParamByName('cd_coligada').AsInteger := cd_coligada;
      ParamByName('cd_curso').AsString := cd_curso;

      Open();

      if FieldByName( 'registros' ).AsInteger > 0 then
         Result := True
      else
         Result := False;
   end;
end;

procedure TfCopiaTurma.limparStringGrid;
var
   I: Integer;
begin
   for I := sgCopiaTurmasColigadas.ColCount downto 1 do
      sgCopiaTurmasColigadas.Cols[I].Clear;

   for I := sgCopiaTurmasColigadas.RowCount downto 1 do
      sgCopiaTurmasColigadas.Rows[I].Clear;

   sgCopiaTurmasColigadas.ColCount := 2;
   sgCopiaTurmasColigadas.RowCount := 2;

   sgCopiaTurmasColigadas.Cells[1, 1] := '';
end;

procedure TfCopiaTurma.MudarCheck(Sender: TObject);
begin
   if (TItemCombo(TUMCheckBoxObj(Sender).Objeto).getDescricao() = '0') then
      TItemCombo(TUMCheckBoxObj(Sender).Objeto).setDescricao('1')
   else
      TItemCombo(TUMCheckBoxObj(Sender).Objeto).setDescricao('0');
end;

procedure TfCopiaTurma.rgCopiaDisciplinasTurmasProfessorClick(Sender: TObject);
begin
   if (not CopiarDisciplinasTurmasProfessor) then
      CopiarGradesHorarios := False;

   rgCopiaGradesHorarios.Enabled := CopiarDisciplinasTurmasProfessor;
end;

procedure TfCopiaTurma.rgCopiarMaisUnidadesClick(Sender: TObject);
begin
   if rgCopiarMaisUnidades.ItemIndex = -1 then
      Exit;

   destroiObjetosAuxiliares();
   carregarTurmasFromCurso();

   if ( FArrayColigadas.Count = 0 ) AND ( rgCopiarMaisUnidades.ItemIndex = 1 ) then
   begin
      Mensagem('A Unidade de Ensino atual não está vinculada ao curso da turma.');
   end;

   rgCopiaDisciplinasTurmasProfessor.Enabled := (not CopiarMaisColigadas);
   rgCopiaGradesHorarios.Enabled := (not CopiarMaisColigadas);

   if (CopiarMaisColigadas) then
   begin
      CopiarDisciplinasTurmasProfessor := False;
      CopiarGradesHorarios := False;
   end;   
end;

{ Função chamada pela PROPERTY CopiarMaisColigadas }
procedure TfCopiaTurma.setColigada(const Value: Integer);
begin
   FColigada := Value;
end;

procedure TfCopiaTurma.setColigadaAtual(const Value: Integer);
begin
   FColigadaAtual := Value;
end;

procedure TfCopiaTurma.setCopiarDisciplinasTurmasProfessor(Valor: Boolean);
begin
   if rgCopiaDisciplinasTurmasProfessor.ItemIndex = -1 then
      Exit;

   if (Valor) then
      rgCopiaDisciplinasTurmasProfessor.ItemIndex := 0
   else
      rgCopiaDisciplinasTurmasProfessor.ItemIndex := 1;
end;

procedure TfCopiaTurma.setCopiarGradesHorarios(Valor: Boolean);
begin
   if rgCopiaGradesHorarios.ItemIndex = -1 then
      Exit;   

   if (Valor) then
      rgCopiaGradesHorarios.ItemIndex := 0
   else
      rgCopiaGradesHorarios.ItemIndex := 1;
end;

procedure TfCopiaTurma.setCopiarMaisColigadas(Valor: Boolean);
begin
   if (Valor) then
      rgCopiarMaisUnidades.ItemIndex := 0
   else
      rgCopiarMaisUnidades.ItemIndex := 1;
end;

procedure TfCopiaTurma.sgCopiaTurmasColigadasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
   if not (gdFixed in State) then
      if ((ARow > 0) AND (not CopiarMaisColigadas) AND
         (sgCopiaTurmasColigadas.Objects[1, ARow] is TUMCheckBoxObj)) OR
         (((FArrayColigadas.Count = 1) AND (Coligada = StrToInt(TItemCombo(FArrayColigadas.Objects[0]).getCodigo())))) AND
         not ((FArrayColigadas.Count = 1) AND (not DM.UsaAnosemestre)) then
      begin
         AlinharCheks();
      end;
end;

function TfCopiaTurma.temConflitoTurmaColigada(const cd_turma: String;
  const cd_coligada, nr_anosemestre: Integer): Boolean;
var
   qyVerificaConflito: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyVerificaConflito);
   Result := False;

   with qyVerificaConflito do
   begin
      SQL.Clear();
      SQL.Add( ' SELECT count(codigo) AS registros ' );
      SQL.Add( ' FROM turmas ' );
      SQL.Add( ' WHERE anosemestre = :nr_anosemestre AND ' );
      SQL.Add( '       codigo = :cd_turma ' );

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;

      Open();

      Result := (FieldByName('registros').AsInteger > 0);      
   end;
end;

end.
