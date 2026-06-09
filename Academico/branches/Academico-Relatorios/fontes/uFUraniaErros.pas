unit uFUraniaErros;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList, Grids, uUrania, DB,
   ZConnection, Contnrs, Menus, General, ZAbstractRODataset, ZAbstractDataset,
   ZDataset, UZDataset, uDM;

type
   { **
      Esta classe armazena as informações de um relacionamento turma/professor
      do Unimestre. Um relacionamento turma/professor é composto por um conjunto
      de dados que incluem o ano/semestre, o código do professor, o código da
      disciplina, o código do curso e o código da turma.
   }
   TUMTurmaProfessor = class(TObject)
   strict private
      FIAnoSemestre: integer;
      FICodProfessor: integer;
      FICodDisciplina: integer;
      FSCodCurso: string;
      FSCodTurma: string;
   private
      constructor Create(const AIAnoSemestre, AICodProfessor,
         AICodDisciplina: integer; const ASCodCurso, ASCodTurma: string);
      destructor Destroy; override;
      property AnoSemestre: integer read FIAnoSemestre;
      property CodProfessor: integer read FICodProfessor;
      property CodDisciplina: integer read FICodDisciplina;
      property CodCurso: string read FSCodCurso;
      property CodTurma: string read FSCodTurma;
   end;

   { **
      Esta classe representa um registro de horário do Unimestre. Um horário no
      Unimestre é composto por um código indentificador, um código equivalente
      no sistema Urânia, um caractere representando o turno ao qual o horário
      pertence, uma sigla representativa, uma chave para conjunção de horários,
      uma descrição, uma categoria, a hora inicial e a hora final.
   }
   TUMHorario = class(TObject)
   strict private
      FICodigo: integer;
      FICodUrania: integer;
      FCTurno: Char;
      FSSigla: string;
      FSChave: string;
      FSDescricao: string;
      FSCategoria: string;
      FTHoraInicio: TTime;
      FTHoraFim: TTime;
   private
      constructor Create(const AICodigo, AICodUrania: integer; const ASSigla,
         ASChave, ASDescricao, ASCategoria: string; ACTurno: Char;
         const ATHoraInicio, ATHoraFim: TTime);
      destructor Destroy; override;
      property Codigo: integer read FICodigo;
      property CodUrania: integer read FICodUrania;
      property Turno: Char read FCTurno;
      property Sigla: string read FSSigla;
      property Chave: string read FSChave;
      property Descricao: string read FSDescricao;
      property Categoria: string read FSCategoria;
      property HoraInicio: TTime read FTHoraInicio;
      property HoraFim: TTime read FTHoraFim;
   end;

   { **
      Declaração antecipada da classe TUMProfessor.
   }
   TUMProfessor = class;

   { **
      Esta classe representa uma disciplina no Unimestre. Uma disciplina no
      Unimestre possui como chave de identificação o seu código em conjunto com
      o código do curso ao qual a disciplina pertence. As outras informações
      são a sua sigla e sua descrição.
      Os atributos professor(FUMProfessor), vinculado(FBVinculado) e selecionado
      (FBSelecionado) não fazem parte do conjunto de atributos de uma disciplina
      no Unimestre. Eles estão inseridos aqui para auxiliar na montagem dos
      horários após importação do sistema Urânia.
      O atributo "professor" armazena um objeto do tipo TUMProfessor que indica
      à qual professor esta disciplina foi vinculada no sistema Urânia. Isto não
      significa, necessariamente, que o vinculo disciplina/professor definido
      aqui também esteja definido no Unimestre.
      O atributo "vinculado" indica se há um vinculo entre a disciplina e o
      professor no Unimestre. Este atributo também pode ser acionado caso o
      usuário efetue o vínculo manualmente pela grade de ajuste de horários.
      O atributo "selecionado" será ligado caso o usuário selecione esta
      disciplina para o professor na grade de ajuste de horários não importados.
   }
   TUMDisciplina = class(TObject)
   strict private
      FUMProfessor: TUMProfessor;
      FICodigo: integer;
      FSCodCurso: string;
      FSSigla: string;
      FSDescricao: string;
      FBVinculado: boolean;
      FBSelecionado: boolean;
   private
      constructor Create(const AICodigo: integer; const ASCodCurso, ASSigla,
         ASDescricao: string; const ABVinculado: boolean;
         const AUMProfessor: TUMProfessor);
      destructor Destroy; override;
      property Codigo: integer read FICodigo;
      property CodCurso: string read FSCodCurso;
      property Sigla: string read FSSigla;
      property Descricao: string read FSDescricao;
      property Selecionado: boolean read FBSelecionado write FBSelecionado;
      property Vinculado: boolean read FBVinculado write FBVinculado;
      property Professor: TUMProfessor read FUMProfessor;
   end;

   { **
      Esta enumeração define as situações na qual os professores podem se
      encontrar:
      spAtivado: professor ativo no Unimestre.
      spDesativado: professor não ativo no Unimestre.
      spNaoProfessor: não vinculado como professor no Unimestre.
      spNaoPessoa: não está cadastro como pessoa no Unimestre.
   }
   TUMSituacoesProfessor = (spAtivado, spDesativado, spNaoProfessor, spNaoPessoa);

   { **
      Esta classe armazena as informações referentes a um professor, não
      necessariamente existente no Unimestre. O professor é composto por um
      código e seu nome, além da lista de disciplinas vnculadas a ele pelo
      sistema Urânia.
      A lista de disciplinas possui como chave o código da turma. Para cada
      turma há um lista de disciplinas vinculadas ao professor pelo sistema
      Urânia naquela turma.
      O atributo situação(FUMSituacaoProfessor) indica qual é a situação
      cadastral do professor no sistema Unimestre.
   }
   TUMProfessor = class(TObject)
   strict private
      FICodigo: integer;
      FSNome: string;
      FSlDisciplinas: TStringList;
      FUMSituacaoProfessor: TUMSituacoesProfessor;
      function IsCarregado(const ASCodTurma: string): boolean;
      function ProcuraDisciplina(const AICodigo: integer; const ASCodCurso,
         ASCodTurma: string): boolean;
      function GetDisciplina(const ASCodTurma: string;
         const AIndice: integer): TUMDisciplina;
      function GetDisciplinasCount(const ASCodTurma: string): integer;
   private
      constructor Create(const AICodigo: Integer; const ASNome: string;
         const AUMSituacaoProfessor: TUMSituacoesProfessor);
      destructor Destroy; override;
      procedure AdicionaDisciplina(const AUMDisciplina: TUMDisciplina;
         const ASCodTurma: string);
      procedure ForcaCarregamento(const ASCodTurma: string);
      property Codigo: integer read FICodigo;
      property Nome: string read FSNome;
      property Carregado[const Turma: string]: boolean read IsCarregado;
      property Situacao: TUMSituacoesProfessor read FUMSituacaoProfessor write FUMSituacaoProfessor;
      property Disciplinas[const Turma: string; const I: integer]:
         TUMDisciplina read GetDisciplina;
      property DisciplinasCount[const Turma: string]:
         integer read GetDisciplinasCount;
   end;

   TfUraniaErros = class(TForm)
   published
      qyInsereProfessor: TUMZQuery;
      qyAtivaProfessor: TUMZQuery;
      qyTurmasHorarios: TUMZQuery;
      qyVinculaTurmaProfessor: TUMZQuery;
      pnLegenda: TPanel;
      bvSep4: TBevel;
      lbLegenda: TLabel;
      shVermelho: TShape;
      lbVermelho: TLabel;
      shVerde: TShape;
      lbVerde: TLabel;
      imOK: TImage;
      pmOpcoes: TPopupMenu;
      qyDisciplinas: TUMZQuery;
      qyProfessores: TUMZQuery;
      qyHorarios: TUMZQuery;
      pnTitulo: TPanel;
      bvSep1: TBevel;
      pnFiltros: TPanel;
      lbAnoSemT: TLabel;
      lbAnoSem: TLabel;
      lbCategoriaT: TLabel;
      lbCategoria: TLabel;
      lbTurmaT: TLabel;
      cbTurmas: TComboBox;
      bvSep2: TBevel;
      ilImagens: TImageList;
      tbAcoes: TToolBar;
      tbSep1: TToolButton;
      tbSalvar: TToolButton;
      tbSep2: TToolButton;
      tbFechar: TToolButton;
      tbSep3: TToolButton;
      bvSep3: TBevel;
      pnHorarios: TPanel;
      sgHorarios: TStringGrid;
      procedure SelecionaCelula(Sender: TObject);
      procedure cbTurmasSelect(Sender: TObject);
      procedure sgHorariosDrawCell(Sender: TObject; ACol, ARow: Integer;
         Rect: TRect; State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure sgHorariosMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure tbFecharClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure SalvaTurma(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   strict private
      FPontoClick: TPoint;
      FAProfessoresAtivados: array of integer;
      FOlTPVinculados: TObjectList;
      FSlTurmasImportadas: TStringList;
      FUMUraniaImportacao: TUMUraniaImportacao;
      function IsProfessorSelecionado(const AICodProfessor: integer): boolean;
      function IsTurmaImportada(const ASCodTurma: string): boolean;
      function GetProfessor(const AICodProfessor: integer): TUMProfessor;
      function GetUraniaImportacaoDB: TUMUraniaImportacaoDB;
      function IsTurmaProfessorVinculado(const AICodDisciplina, AIAnoSemestre,
         AICodProfessor: integer; const ASCodCurso, ASCodTurma: string): boolean;
      function VinculaTurmaProfessor(const AICodDisciplina, AIAnoSemestre,
         AICodProfessor: integer; const ASCodCurso, ASCodTurma: string): boolean;
      procedure GetDisciplinasProfessor(const AUMProfessor: TUMProfessor;
         const ASCodTurma: string; const AICodDisciplina: Integer);
      procedure CarregaTurmas;
      procedure CarregaHorarios;
      procedure CarregaProfessores;
      procedure CarregaGradeHorarios;
      procedure SelecionaDisciplina(Sender: TObject);
      procedure DestroiGradeHorarios;
      procedure MostraDisciplinaProfessor;
      procedure CarregaHorariosExistentes;
      procedure AtivaProfessor(const AUMProfessor: TUMProfessor);
   private
      constructor Create(AOwner: TComponent;
         const AUMUraniaImportacao: TUMUraniaImportacao);
      destructor Destroy; override;
      property UraniaImportacaoDB: TUMUraniaImportacaoDB read GetUraniaImportacaoDB;
   public
      class procedure VerificaErros(AOwner: TComponent;
         const AUMUraniaImportacao: TUMUraniaImportacao);
   end;

var
   fUraniaErros: TfUraniaErros;

implementation

{$R *.dfm}

const
   { Esta constante mapeia um conjunto de inteiros que são convertidos em um
     valor TUMSituacoesProfessor correspondente.
   }
   SnProfessorToSitProfessor: array[0..2] of TUMSituacoesProfessor =
      (spAtivado, spDesativado, spNaoProfessor);

   { SQL para buscar os vinculos de horários da turma e professores.
   }
   SQL_GET_HORARIOS =
      'SELECT '+
         'thc.nr_anosemestre AS anosemestre,'+
         'thc.cd_turma AS turma,'+
         'thc.cd_horario,'+
         'thc.nr_dia_semana AS dia_semana,'+
         'thc.cd_disciplina AS disciplina,'+
         'h.cd_horario_urania,'+
         'd.sigla,'+
         'd.descricao,'+
         'p.nm_pessoa,'+
         'p.cd_pessoa '+
      'FROM '+
         'turmas_horarios_config thc '+
            'JOIN turmasprofessores tp ON '+
               '(thc.nr_anosemestre = tp.anosemestre) AND '+
               '(thc.cd_turma = tp.turma) AND '+
               '(thc.cd_disciplina = tp.disciplina) AND '+
               '(thc.cd_professor = tp.professor) '+
            'JOIN disciplinas d ON '+
               '(tp.disciplina = d.codigo) AND '+
               '(tp.curso = d.curso) '+
            'JOIN horarios h ON '+
               '(thc.cd_horario = h.codigo) '+
            'JOIN pessoas p ON '+
               '(thc.cd_professor = p.cd_pessoa) '+
      'WHERE '+
         'thc.cd_turma IN (%s) AND '+
         'thc.nr_anosemestre = :anosemestre AND '+
         'IS_HORARIO_TURMA_ATIVA(NOW(), thc.dt_inicial, thc.dt_final, thc.sn_ativo) = 1 AND '+
         'h.ds_categoria = :ds_categoria';

{ TfUraniaErros }

{ **
   Este método efetua a ativação de um professor na base de dados do Unimestre.
   Primeiro verifica qual a situação do professor. Para professores desativados,
   ou seja, que estão cadastrados como professores do Unimestre mas que estão
   desativados, apenas ativa. Para pessoas não cadastradas como professores,
   efetua-se esse cadastro manualmente.
}
procedure TfUraniaErros.AtivaProfessor(const AUMProfessor: TUMProfessor);
begin
   case AUMProfessor.Situacao of
      spDesativado: // professor desativado
      begin
         qyAtivaProfessor.ParamByName('cd_pessoa').AsInteger := AUMProfessor.Codigo;
         try
            qyAtivaProfessor.ExecSQL;
         except
            on E: EDatabaseError do raise;
         end;
      end;
      spNaoProfessor: // não cadastrado como professor
      begin
         qyInsereProfessor.ParamByName('cd_pessoa').AsInteger := AUMProfessor.Codigo;
         try
            qyInsereProfessor.ExecSQL;
         except
            on E: EDatabaseError do raise;
         end;
      end;
   end;
end;

{ **
   Este método carrega os horários que não puderam ser importados corretamente
   do sistema Urânia e armazena esses horários em objetos para posterior
   consulta. Cada célula, combinação horário e dia da semana, possui uma lista
   com as turmas onde foi encontrado inconsistência neste horário. Cada índice
   de turma armazena um lista dos professores vinculados a este horário na turma
   pelo sistema Urânia. Cada professor, por sua vez, possui uma lista de
   disciplinas que foram vinculadas a ele no sistema Urânia, mas que não possuem
   vínculo no Unimestre.
}
procedure TfUraniaErros.CarregaGradeHorarios;
var
   LBAchou: boolean;
   I, J, K, L: integer;
   LObjeto: TObject;
   LOlProfessores: TObjectList;
   LSlTurmas: TStringList;
   LUMHorario: TUMHorario;
   LUMProfessor: TUMProfessor;
   LUMUraniaHorario: TUMUraniaHorario;
begin
   // Percorre a lista de horários onde houve inconsistência na importação
   for I := 0 to UraniaImportacaoDB.HorariosErradosCount - 1 do
   begin
      LUMUraniaHorario := UraniaImportacaoDB.HorariosErrados[I];
      // Percorre os horários da grade de horários.
      for J := 1 to sgHorarios.RowCount - 1 do
      begin
         LUMHorario := TUMHorario(sgHorarios.Objects[0, J]);
         // Verifica se o código Urânia deste horário no Unimestre
         // é equivalente ao código do horário no sistema Urânia 
         if LUMHorario.CodUrania = LUMUraniaHorario.Horario then
         begin
            LObjeto := sgHorarios.Objects[LUMUraniaHorario.DiaSemanaUM, J];
            // Verifica se já foi adicionado um objeto a esta célula
            if Assigned(LObjeto) then
            begin
               LSlTurmas := TStringList(LObjeto);
               LSlTurmas.Sort;
               // Verifica se a turma selecionada já foi inserida na lista
               if LSlTurmas.Find(LUMUraniaHorario.CodTurma, K) then
               begin
                  // Pega a lista de professores da turma e a percorre
                  LOlProfessores := TObjectList(LSlTurmas.Objects[K]);
                  LBAchou := false;
                  // Percorre a lista de professores da turma
                  for L := 0 to LOlProfessores.Count - 1 do
                     // Verifica se o professores deste horário já foi inserido
                     if TUMProfessor(LOlProfessores.Items[L]).Codigo = LUMUraniaHorario.CodProfessor then
                     begin
                        LBAchou := true;
                        Break;
                     end;
                  // Professor não inserido?
                  if not LBAchou then
                  begin
                     // Pega as informações do professor na base de dados
                     LUMProfessor := Self.GetProfessor(LUMUraniaHorario.CodProfessor);
                     // Se é uma pessoa válida no Unimestre ...
                     if LUMProfessor.Situacao <> spNaoPessoa then
                        // então pega as disciplinas vinculadas a ele
                        Self.GetDisciplinasProfessor(
                           LUMProfessor,
                           LUMUraniaHorario.CodTurma,
                           LUMUraniaHorario.CodDisciplina);
                     // Adiciona o professor à lista de professores
                     LOlProfessores.Add(LUMProfessor);
                  end;
               end
               else
               begin
                  // Turma ainda não inserida na lista
                  // Cria a lista de professores
                  LOlProfessores := TObjectList.Create;
                  // Pega as informações do professor na base de dados
                  LUMProfessor := Self.GetProfessor(LUMUraniaHorario.CodProfessor);
                  // Se é uma pessoa válida no Unimestre ...
                  if LUMProfessor.Situacao <> spNaoPessoa then
                     // então pega as disciplinas vinculadas a ele
                     Self.GetDisciplinasProfessor(
                        LUMProfessor,
                        LUMUraniaHorario.CodTurma,
                        LUMUraniaHorario.CodDisciplina);
                  // Adiciona o professor à lista de professores da turma
                  LOlProfessores.Add(LUMProfessor);
                  // Adiciona a turma e sua lista de professores na célula
                  LSlTurmas.AddObject(LUMUraniaHorario.CodTurma, LOlProfessores);
               end;
            end
            else
            begin
               // Nenhum objeto foi inserido na célula
               LSlTurmas := TStringList.Create;
               // Pega os dados do professor na base de dados
               LUMProfessor := Self.GetProfessor(LUMUraniaHorario.CodProfessor);
               // Se é uma pessoa válida no Unimestre...
               if LUMProfessor.Situacao <> spNaoPessoa then
                  // pega as disciplinas do professor
                  Self.GetDisciplinasProfessor(
                     LUMProfessor,
                     LUMUraniaHorario.CodTurma,
                     LUMUraniaHorario.CodDisciplina);
               // Cria a lista de professores e adiciona o professor a ela
               LOlProfessores := TObjectList.Create;
               LOlProfessores.Add(LUMProfessor);
               // Adiciona a turma e sua lista de professores na célula
               LSlTurmas.AddObject(LUMUraniaHorario.CodTurma, LOlProfessores);
               // Adiciona a lista de turmas à célula
               sgHorarios.Objects[LUMUraniaHorario.DiaSemanaUM, J] := LSlTurmas;
            end;
         end;
      end;
   end;
end;

{ **
   Carrega os horários cadastrados no sistema Unimestre cujo categoria é
   equivalente à categoria selecionada pelo usuário para efetuar a importação
   dos horários. O quantidade de horários encontrados será indicado pela
   quantidade de linhas na grade de horários, ou seja, cada linha representa um
   horário. Na primeira coluna de cada linha é armazenado um objeto do tipo
   TUMHorario, que possui todas as informações do horário. Esses objetos são
   acessados posteriormente para consulta e comparação.
}
procedure TfUraniaErros.CarregaHorarios;
var
   I: integer;
begin
   I := 1;
   try
      Self.qyHorarios.ParamByName('ds_categoria').AsString :=
         Self.FUMUraniaImportacao.Categoria;
      Self.qyHorarios.Open;
      Self.sgHorarios.RowCount := Self.qyHorarios.RecordCount + 1;
      while not Self.qyHorarios.Eof do
      begin
         Self.sgHorarios.Cells[0, I] :=
            Self.qyHorarios.FieldByName('hr_inicio').AsString;
         Self.sgHorarios.Objects[0, I] :=
            TUMHorario.Create(
               Self.qyHorarios.FieldByName('codigo').AsInteger,
               Self.qyHorarios.FieldByName('cd_horario_urania').AsInteger,
               Self.qyHorarios.FieldByName('ds_sigla').AsString,
               Self.qyHorarios.FieldByName('ds_chave').AsString,
               Self.qyHorarios.FieldByName('ds_horario').AsString,
               Self.qyHorarios.FieldByName('ds_categoria').AsString,
               Self.qyHorarios.FieldByName('turno').AsString[1],
               Self.qyHorarios.FieldByName('hr_inicio').AsDateTime,
               Self.qyHorarios.FieldByName('hr_fim').AsDateTime);
         Inc(I);
         Self.qyHorarios.Next;
      end;
   finally
      Self.qyHorarios.Close;
   end;
end;

{ **
   Consulta no Unimestre, todos os horários já vinculados para as turmas
   inseridas na "combobox" de turmas. O SQL que busca as informações, liga com
   as tabelas de "turmasprofessores", "disciplinas", "horarios" e "pessoas". O
   DataSet é mantido aberto para que possa ser consultado posteriormente.
}
procedure TfUraniaErros.CarregaHorariosExistentes;
var
   I: integer;
   LSTurmas: string;
begin
   for I := 0 to Self.cbTurmas.Items.Count - 1 do
   begin
      if I > 0 then
      begin
         LSTurmas := LSTurmas + ',';
      end;

      LSTurmas := LSTurmas + ':turma' + IntToStr(I);
   end;

   qyTurmasHorarios.SQL.Text := Format(SQL_GET_HORARIOS, [LSTurmas]);

   for I := 0 to Self.cbTurmas.Items.Count - 1 do
   begin
      qyTurmasHorarios.ParamByName('turma' + IntToStr(I)).AsString := cbTurmas.Items.Strings[I];
   end;

   qyTurmasHorarios.ParamByName('anosemestre').AsInteger := FUMUraniaImportacao.AnoSemestre;
   qyTurmasHorarios.ParamByName('ds_categoria').AsString := FUMUraniaImportacao.Categoria;

   qyTurmasHorarios.Open;
end;

{ **
   Percorre a lista de horários que não puderam ser importados para o Unimestre
   para criar uma lista com os códigos dos professores vinculados a estes
   horários e posteriormente buscar as informações cadastrais desses professores
   no Unimestre. O DataSet é mantido aberto para que os professores possam ser
   posteriormente consultados.
}
procedure TfUraniaErros.CarregaProfessores;
var
   I: integer;
   LSCodigos, LSCodigo: string;
begin
   LSCodigos := '';
   for I := 0 to UraniaImportacaoDB.HorariosErradosCount - 1 do
   begin
      LSCodigo :=
         Format('%d', [UraniaImportacaoDB.HorariosErrados[I].CodProfessor]);
      if AnsiPos(LSCodigo, LSCodigos) = 0 then
      begin
         if LSCodigos <> '' then
            LSCodigos := LSCodigos + ',';
         LSCodigos := LSCodigos + LSCodigo;
      end;
   end;
   Self.qyProfessores.SQL.Text := Format(qyProfessores.SQL.Text, [LSCodigos]);
   Self.qyProfessores.Open;
end;

{ **
   Percorre a lista de horários que não foram importados para pegar as turmas
   vinculadas a esses horários. As turmas são armazenadas em TStringList
   auxiliar, verificando se a turma já não foi inserida para evitar duplicidade.
   Depois, a lista de turmas é atribuída à "combobox" de turma. Antes, a lista
   é organizada em ordem alfabética com o método Sort da TStringList.
}
procedure TfUraniaErros.CarregaTurmas;
var
   I, Indice: integer;
   LSlTurmas: TStringList;
begin
   LSlTurmas := TStringList.Create;
   try
      for I := 0 to UraniaImportacaoDB.HorariosErradosCount - 1 do
      begin
         LSlTurmas.Sort;
         if not LSlTurmas.Find(UraniaImportacaoDB.HorariosErrados[I].CodTurma, Indice) then
            LSlTurmas.Add(UraniaImportacaoDB.HorariosErrados[I].CodTurma);
      end;
      LSlTurmas.Sort;
      Self.cbTurmas.Items := LSlTurmas;
   finally
      LSlTurmas := nil;
   end;
end;

{ **
   Este método é invocado pelo evento "OnSelect" da "combobox" de turmas. Quando
   este evento é acionado, verifica-se se esta turma já foi importada(ajustada),
   por consultar a TStringList auxiliar que armazena as turmas que já tiveram
   seus horários ajustados pelo usuário. Se a turma já foi reimportada, exibe o
   sinal de "certo" ao lado da "combobox" de turmas e desabilita o botão
   "F5 Salvar". Caso contrário, o sinal de "certo" não é exibido e o botão
   "F5 Salvar" é habilitado para o usuário. Depois chama o método responsável
   por exibir nas células a disciplina e professor vinculados àquele horário e
   também atualiza a grade de horários a fim de colorir as células.
}
procedure TfUraniaErros.cbTurmasSelect(Sender: TObject);
var
   LSCodTurma: string;
begin
   LSCodTurma := Self.cbTurmas.Items.Strings[Self.cbTurmas.ItemIndex];
   if Self.IsTurmaImportada(LSCodTurma) then
   begin
      Self.imOK.Visible := true;
      Self.tbSalvar.Enabled := false;
   end
   else
   begin
      Self.imOK.Visible := false;
      Self.tbSalvar.Enabled := true;
   end;
   Self.MostraDisciplinaProfessor;
   Self.sgHorarios.Refresh;
end;

{ **
   Construtor. Chama o construtor da classe pai, guarda referência para o objeto
   de importação do Urânia, inicializa um estrutura TStringList auxiliar
   (responsável por armazenar os códigos das turmas reimportadas) e cria uma
   lista de objetos que irá guardar a referência para as ligações
   turma/professor que foram vinculados manualmente pelo usuário(esta estrutura
   é acessada na rotina que salva as informações na base de dados).
}
constructor TfUraniaErros.Create(AOwner: TComponent;
  const AUMUraniaImportacao: TUMUraniaImportacao);
begin
   inherited Create(AOwner);
   Self.FUMUraniaImportacao := AUMUraniaImportacao;
   Self.FSlTurmasImportadas := TStringList.Create;
   Self.FOlTPVinculados := TObjectList.Create;
end;

{ **
   Percorre todas as células da grade de horários a fim de destruir todos os
   objetos nela armazenados. Primeiro percorre apenas a primeira coluna, onde
   são armazenados os objetos de horários do Unimestre(TUMHorario). Depois
   percorre as células que armazenam as informações de turmas, professores e
   suas disciplinas, destruindo objeto por objeto.
}
procedure TfUraniaErros.DestroiGradeHorarios;
var
   I, J, LCol, LLin: integer;
   LObjeto: TObject;
   LSlTurmas: TStringList;
   LUMProfessor: TUMProfessor;
   LOlProfessores: TObjectList;
begin
   for I := 1 to sgHorarios.RowCount do
      TUMHorario(sgHorarios.Objects[0, I]).Free;
   for LCol := 1 to sgHorarios.ColCount - 1 do
      for LLin := 1 to sgHorarios.RowCount - 1 do
      begin
         LObjeto := sgHorarios.Objects[LCol, LLin];
         if Assigned(LObjeto) then
         begin
            LSlTurmas := TStringList(LObjeto);
            for I := 0 to LSlTurmas.Count - 1 do
            begin
               LOlProfessores := TObjectList(LSlTurmas.Objects[I]);
               for J := LOlProfessores.Count - 1 downto 0 do
               begin
                  LUMProfessor := TUMProfessor(LOlProfessores.Items[J]);
                  FreeAndNil(LUMProfessor);
               end;
            end;
         end;
      end;
end;

{ **
   Destrutor do formulário. Destrói a TStringList de turmas, a grade de horários
   (todos os objetos nele armazenados), a lista de turmas/professores e a
   referência para o objeto de importação faz apontar para um valor nulo.
}
destructor TfUraniaErros.Destroy;
var
   I: integer;
begin
   Self.FUMUraniaImportacao := nil;
   FreeAndNil(Self.FSlTurmasImportadas);
   Self.DestroiGradeHorarios;
   for I := Self.FOlTPVinculados.Count - 1 downto 0 do
      TUMTurmaProfessor(Self.FOlTPVinculados.Items[I]).Free;
   inherited;
end;

{ **
   Este método é invocado no evento "OnDestroy" do formulário. Fecha todos os
   DataSet's que foram mantidos abertos para consulta. Libera os componentes
   visuais. 
}
procedure TfUraniaErros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Self.qyProfessores.Close;
   Self.qyDisciplinas.Close;
   Self.qyTurmasHorarios.Close;
   Action := caFree;
end;

{ **
   Este método é invocado no evento "OnCloseQuery" do formulário, ou seja,
   quando o usuário clica no botão fechar. Antes de fechar, questiona o usuário
   sobre se deseja realmente fechar o formulário quando ainda a turmas que não
   foram reimportadas.
}
procedure TfUraniaErros.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   Q_FECHAR_CPENDENCIA =
      'Há turmas não salvas. Deseja ignorar as alterações não salvas e fechar a janela?';
begin
   if Self.FSlTurmasImportadas.Count < Self.cbTurmas.Items.Count then
      CanClose := Mensagem(Q_FECHAR_CPENDENCIA, 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2, Self.Handle) = ID_YES
   else
      CanClose := true;
end;

{ **
   Este método é invocado pelo evento "OnCreate" do formulário. Primeiro carrega
   a "combobox" de turmas, carrega os horários do Unimestre, carregas os
   professores na base do Unimestre, carrega os horários já vinculados no
   Unimestre para as turmas em questão e carrega todas as possibilidades de
   horários.
}
procedure TfUraniaErros.FormCreate(Sender: TObject);
const
   IntToDiaSemana: array[1..7] of string =
      ('Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado');
var
   I: integer;
begin
   Self.CarregaTurmas;
   Self.CarregaHorarios;
   Self.CarregaProfessores;
   Self.CarregaHorariosExistentes;
   for I := 1 to 7 do
      Self.sgHorarios.Cells[I, 0] := IntToDiaSemana[I];
   Self.CarregaGradeHorarios;
   Self.lbAnoSem.Caption := Format('%d', [Self.FUMUraniaImportacao.AnoSemestre]);
   Self.lbAnoSem.Caption :=
      Copy(Self.lbAnoSem.Caption, 1, 4) + '/' + Copy(Self.lbAnoSem.Caption, 5, 1);
   Self.lbCategoria.Caption := Self.FUMUraniaImportacao.Categoria;
   if cbTurmas.Items.Count > 0 then
   begin
      cbTurmas.ItemIndex := 0;
      cbTurmasSelect(nil);
   end;
end;

{ **
   Este método é invocado no evento "OnKeyDown" do formulário. Processa as
   teclas de atalho "F5" e "F12", "Salvar" e "Fechar" respectivamente.
}
procedure TfUraniaErros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if Self.tbSalvar.Enabled then
            Self.SalvaTurma(nil);
      VK_F12:
         Self.tbFecharClick(nil);
   end;
end;

{ **
   Acessa a base de dados do Unimestre e busca todas as disciplinas vinculadas
   ao professor na turma selecionada. Além destas, também adiciona a disciplina
   passada como parâmetro, a fim de vinculá-la posteriormente caso necessário.
   Todas as disciplinas encontradas são adicionadas à lista de disciplinas do
   professor na turma selecionada. 
}
procedure TfUraniaErros.GetDisciplinasProfessor(
  const AUMProfessor: TUMProfessor; const ASCodTurma: string;
  const AICodDisciplina: Integer);
begin
   Self.qyDisciplinas.ParamByName('anosemestre').AsInteger :=
      Self.FUMUraniaImportacao.AnoSemestre;
   Self.qyDisciplinas.ParamByName('professor').AsInteger := AUMProfessor.Codigo;
   Self.qyDisciplinas.ParamByName('turma').AsString := ASCodTurma;
   Self.qyDisciplinas.ParamByName('codigo').AsInteger := AICodDisciplina;
   Self.qyDisciplinas.Open;
   try
      while not Self.qyDisciplinas.Eof do
      begin
         AUMProfessor.AdicionaDisciplina(
            TUMDisciplina.Create(
               Self.qyDisciplinas.FieldByName('codigo').AsInteger,
               Self.qyDisciplinas.FieldByName('curso').AsString,
               Self.qyDisciplinas.FieldByName('sigla').AsString,
               Self.qyDisciplinas.FieldByName('descricao').AsString,
               Self.qyDisciplinas.FieldByName('vinculado').AsInteger = 1,
               AUMProfessor),
            ASCodTurma);
         Self.qyDisciplinas.Next;
      end;
   finally
      Self.qyDisciplinas.Close;
   end;
end;

{ **
   Acessa o DataSet dos professores e procura o professor. Cria o objeto do
   professor e retorna a referência.
}
function TfUraniaErros.GetProfessor(
  const AICodProfessor: integer): TUMProfessor;
const
   NOME_PROFESSOR_INEXISTENTE = '%d: [PROFESSOR NÃO ENCONTRADO]';
begin
   if Self.qyProfessores.Locate('cd_pessoa', AICodProfessor, []) then
      Result :=
         TUMProfessor.Create(
            AICodProfessor, qyProfessores.FieldByName('nm_pessoa').AsString,
            SnProfessorToSitProfessor[qyProfessores.FieldByName('sn_professor').ASInteger])
   else
      Result :=
         TUMProfessor.Create(
            AICodProfessor, Format(NOME_PROFESSOR_INEXISTENTE, [AICodProfessor]),
            spNaoPessoa);
end;

function TfUraniaErros.GetUraniaImportacaoDB: TUMUraniaImportacaoDB;
begin
   Result := Self.FUMUraniaImportacao.UraniaImportacaoDB;
end;

{ **
   Verifica se este professor já foi selecionado para outro horário. Consulta a
   lista de professores ativados manualmente. Retorna TRUE se encontrar e FALSE
   se não encontrar.
}
function TfUraniaErros.IsProfessorSelecionado(
  const AICodProfessor: integer): boolean;
var
   I: integer;
begin
   Result := false;
   for I := Low(Self.FAProfessoresAtivados) to High(FAProfessoresAtivados) do
      if FAProfessoresAtivados[I] = AICodProfessor then
      begin
         Result := true;
         Break;
      end;
end;

{ **
   Verifica na lista de turmas já importadas, se esta turma já foi reimportada.
   Retorna TRUE se encontrar e FALSE se não encontrar.
}
function TfUraniaErros.IsTurmaImportada(const ASCodTurma: string): boolean;
var
   I: integer;
begin
   Self.FSlTurmasImportadas.Sort;
   Result := Self.FSlTurmasImportadas.Find(ASCodTurma, I);   
end;

{ **
   Verifica se a combinação disciplina, ano/semestre, professor, curso e turma
   já foi selecinada manualmente por consultar a lista de turmas/professores.
}
function TfUraniaErros.IsTurmaProfessorVinculado(const AICodDisciplina,
  AIAnoSemestre, AICodProfessor: integer; const ASCodCurso,
  ASCodTurma: string): boolean;
var
   I: integer;
begin
   Result := false;
   for I := 0 to Self.FOlTPVinculados.Count - 1 do
      with TUMTurmaProfessor(Self.FOlTPVinculados.Items[I]) do
      begin
         Result :=
            (AnoSemestre = AIAnoSemestre) and
            (CodProfessor = AICodProfessor) and
            (CodDisciplina = AICodDisciplina) and
            (CodCurso = ASCodCurso) and
            (CodTurma = ASCodTurma);
         if Result then
            Break;
      end;       
end;

{ **
   Percorre a grade de horários para exibir nas células a combinação disciplina/
   professor para àquele horário. Primeiro percorre apenas as células que foram
   importadas manualmente e depois as células que foram importadas automaticamente.
}
procedure TfUraniaErros.MostraDisciplinaProfessor;
var
   LBAchou: boolean;
   LSCodTurma: string;
   LCol, LLin, I, J, K: integer;
   LObjeto: TObject;
   LSlTurmas: TStringList;
   LUMHorario: TUMHorario;
   LUMProfessor: TUMProfessor;
   LOlProfessores: TObjectList;
begin
   LSCodTurma := Self.cbTurmas.Items.Strings[Self.cbTurmas.ItemIndex];
   // Percorre as colunas da grade de horários
   for LCol := 1 to sgHorarios.ColCount - 1 do
      // Percorre as linhas da grade de horários
      for LLin := 1 to sgHorarios.RowCount - 1 do
      begin
         // Limpa o conteúdo da célula
         sgHorarios.Cells[LCol, LLin] := '';
         LUMHorario := TUMHorario(sgHorarios.Objects[0, LLin]);
         LBAchou := false;
         // Percorre a lista de horários da importação do Urânia
         for I := 0 to FUMUraniaImportacao.HorarioCount - 1 do
            // Verifica se o horário é compatível com o horário do Unimestre
            // Verifica também o dia da semana (coluna da grade)
            if (FUMUraniaImportacao.Horarios[I].Horario = LUMHorario.CodUrania) and
               (FUMUraniaImportacao.Horarios[I].DiaSemanaUM = LCol) and
               (FUMUraniaImportacao.Horarios[I].CodTurma = LSCodTurma) then
            begin
               // Consulta o DataSet de horários para verificar se este horário
               // já está vinculado na base de dados do Unimestre
               LBAchou :=
                  qyTurmasHorarios.Locate(
                     'anosemestre;turma;dia_semana;disciplina;cd_horario_urania',
                     VarArrayOf([
                        FUMUraniaImportacao.AnoSemestre, LSCodTurma, LCol,
                        FUMUraniaImportacao.Horarios[I].CodDisciplina,
                        FUMUraniaImportacao.Horarios[I].Horario]), []);
               // O horário já está vinculado?
               if LBAchou then
               begin
                  // Escreve na célula a sigla da disciplina e o código do professor
                  sgHorarios.Cells[LCol, LLin] :=
                     qyTurmasHorarios.FieldByName('sigla').AsString + '/' +
                     qyTurmasHorarios.FieldByName('cd_pessoa').AsString;
                  // Quebra o loop pois já encontrou o horário
                  Break;
               end;
            end;
         // Não encontrou o horário?
         if not LBAchou then
         begin
            // Verifica o conteúdo da célula            
            LObjeto := sgHorarios.Objects[LCol, LLin];
            if Assigned(LObjeto) then
            begin
               LSlTurmas := TStringList(LObjeto);
               LSlTurmas.Sort;
               // Verifica se esta turma está inserida na célula
               if LSlTurmas.Find(LSCodTurma, I) then
               begin
                  // Percorre a lista de professores da turma
                  LOlProfessores := TObjectList(LSlTurmas.Objects[I]);
                  for J := 0 to LOlProfessores.Count - 1 do
                  begin
                     // Percorre a lista de disciplinas do professor na turma
                     LUMProfessor := TUMProfessor(LOlProfessores.Items[J]);
                     for K := 0 to LUMProfessor.DisciplinasCount[LSCodTurma] - 1 do
                     begin
                        // Verifica se alguma disciplina foi selecionada
                        if LUMProfessor.Disciplinas[LSCodTurma, K].Selecionado then
                        begin
                           // Escreve a sigla da disciplina e o código do professor na célula
                           sgHorarios.Cells[LCol, LLin] :=
                              LUMProfessor.Disciplinas[LSCodTurma, K].Sigla + '/' +
                              Format('%d', [LUMProfessor.Disciplinas[LSCodTurma, K].Codigo]);
                           // Quebra o loop pois já encontrou
                           Break;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

{ **
   Este método é invocado no evento "OnClick" do botão "F5 Salvar Turma".
   Monta-se uma lista com os horários selecionados manualmente pelo usuário e
   envia para o objeto de importação do Urânia para efetuar a reimportação dos
   horários da turma.
}
procedure TfUraniaErros.SalvaTurma(Sender: TObject);
const
   I_OPCOES =
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2;
   Q_SALVAR_ALTERACOES =
      'Deseja realmente salvar as alterações de horários para a turma "%s"?' + #13 +
      'Após salvar não será possível retornar as alterações.' + #13 + #13 +
      'Deseja prosseguir?';
var
   LSCodTurma: string;
   LObjeto: TObject;
   LSlTurmas: TStringList;
   LUMProfessor: TUMProfessor;
   LOlHorarios, LOlProfessores: TObjectList;
   LCol, LLin, I, J: integer;
begin
   LSCodTurma := Self.cbTurmas.Items.Strings[Self.cbTurmas.ItemIndex];
   // Questiona o usuário se deseja realmente efetuar a reimportação
   if Mensagem(Format(Q_SALVAR_ALTERACOES, [LSCodTurma]), 'Confirmação', I_OPCOES, Self.Handle) = ID_YES then
   begin
      // Cria uma lista de horários
      LOlHorarios := TObjectList.Create;
      // Percorre as colunas da grade de horários
      for LCol := 1 to sgHorarios.ColCount - 1 do
         // Percorre as linhas da grade de horários
         for LLin := 1 to sgHorarios.RowCount - 1 do
         begin
            // Verifica o objeto armazenado na célula 
            LObjeto := sgHorarios.Objects[LCol, LLin];
            if Assigned(LObjeto) then
            begin
               LSlTurmas := TStringList(LObjeto);
               LSlTurmas.Sort;
               // Verifica se a turma está inserida na célula
               if LSlTurmas.Find(LSCodTurma, I) then
               begin
                  // Percorre a lista de professores da turma 
                  LOlProfessores := TObjectList(LSlTurmas.Objects[I]);
                  for I := 0 to LOlProfessores.Count - 1 do
                  begin
                     // Percorre as disciplinas vinculadas ao professor na turma
                     LUMProfessor := TUMProfessor(LOlProfessores.Items[I]);
                     for J := 0 to LUMProfessor.DisciplinasCount[LSCodTurma] - 1 do
                        // Verifica se a disciplina foi selecionada manualmente
                        if LUMProfessor.Disciplinas[LSCodTurma, J].Selecionado then
                        begin
                           // Verifica se foi solicitada a ativação do professor
                           if LUMProfessor.Situacao in[spDesativado, spNaoProfessor] then
                              Self.AtivaProfessor(LUMProfessor);
                           // Verifica se a disciplina já foi vinculada ao professor
                           if not LUMProfessor.Disciplinas[LSCodTurma, J].Vinculado then
                              // Se a disciplina não foi vinculada então vincula
                              LUMProfessor.Disciplinas[LSCodTurma, J].Vinculado :=
                                 Self.VinculaTurmaProfessor(
                                    LUMProfessor.Disciplinas[LSCodTurma, J].Codigo,
                                    FUMUraniaImportacao.AnoSemestre,
                                    LUMProfessor.Codigo,
                                    LUMProfessor.Disciplinas[LSCodTurma, J].CodCurso,
                                    LSCodTurma);
                           // Se a disciplina foi vinculada com sucesso adiciona
                           // o horário à lista de horários a serem reimportados
                           if LUMProfessor.Disciplinas[LSCodTurma, J].Vinculado then
                              with TUMUraniaHorario(LOlHorarios.Items[LOlHorarios.Add(TUMUraniaHorario.Create)]) do
                              begin
                                 CodTurma := LSCodTurma;
                                 Horario := TUMHorario(sgHorarios.Objects[0, LLin]).CodUrania;
                                 CodProfessor := LUMProfessor.Codigo;
                                 CodDisciplina := LUMProfessor.Disciplinas[LSCodTurma, J].Codigo;
                                 DiaSemana := TUMUraniaDiaSemana(LCol - 1);
                              end;
                        end;
                  end;
               end;
            end;
         end;
      // Se há horários a reimportar ...
      if LOlHorarios.Count > 0 then
         // executa a reimportação dos horários
         Self.FUMUraniaImportacao.Executa(LOlHorarios);
      // Adiciona a turma a lista de turmas reimportadas
      Self.FSlTurmasImportadas.Add(LSCodTurma);
      // Desabilita o notão salvar
      Self.tbSalvar.Enabled := false;
      // Exibe o sinal de "certo" ao lado da combo de turmas
      Self.imOK.Visible := true;
      // Destrói os objetos de horários.
      for I := LOlHorarios.Count - 1 downto 0 do
         TUMUraniaHorario(LOlHorarios.Items[I]).Free;
      LOlHorarios := nil;
   end;
end;

{ **
   Este método é invocado no evento "OnClick" na grade de horários. Sobre a
   grade selecionada exibe uma Popup com as opções de disciplinas/professores
   disponíveis para àquele horário naquela turma selecionada.
}
procedure TfUraniaErros.SelecionaCelula(Sender: TObject);
var
   LBAchou: boolean;
   LPoint: TPoint;
   LSCodTurma: string;
   LCol, LLin, I, J, K, L: integer;
   LObjeto: TObject;
   LSlTurmas: TStringList;
   LOlProfessores: TObjectList;
   LUMProfessor: TUMProfessor;
   LUMDisciplina: TUMDisciplina;
   LMiOpcao: TMenuItem;
begin
   LBAchou := false;
   // Pega os pontos do atuais do click do mouse
   GetCursorPos(LPoint);
   // Limpa as opções da Popup
   Self.pmOpcoes.Items.Clear;
   // Com base na seleção da célula, pega a linha e coluna selecionadas
   sgHorarios.MouseToCell(Self.FPontoClick.X, Self.FPontoClick.Y, LCol, LLin);
   LObjeto := sgHorarios.Objects[LCol, LLin];
   LSCodTurma := Self.cbTurmas.Items.Strings[Self.cbTurmas.ItemIndex];
   // Verifica se este horário já está vinculado no Unimestre
   LBAchou :=
      qyTurmasHorarios.Locate(
        'anosemestre;turma;dia_semana;cd_horario_urania',
         VarArrayOf([FUMUraniaImportacao.AnoSemestre, LSCodTurma, LCol,
                     TUMHorario(sgHorarios.Objects[0, LLin]).CodUrania]), []);
   // Se o horário já está vinculado, então apenas exibe a seleção e não exibe
   // outras opções para seleção de disciplinas e professores
   if LBAchou then
   begin
      LMiOpcao := TMenuItem.Create(Self.pmOpcoes);
      LMiOpcao.Caption :=
         qyTurmasHorarios.FieldByName('sigla').AsString + ' - ' +
         qyTurmasHorarios.FieldByName('descricao').AsString + ' - ' +
         qyTurmasHorarios.FieldByName('nm_pessoa').AsString;
      LMiOpcao.Checked := true;
      Self.pmOpcoes.Items.Add(LMiOpcao);
      Self.pmOpcoes.Popup(LPoint.X, LPoint.Y);
   end
   else
      // Verifica o conteúdo do objeto da célula selecionada
      if Assigned(LObjeto) and (LObjeto is TStringList) then
      begin
         // Verifica se a turma selecionada está inserida na célula
         LSlTurmas := TStringList(LObjeto);
         LSlTurmas.Sort;
         if LSlTurmas.Find(LSCodTurma, J) then
         begin
            LBAchou := true;
            // Percorre a lista de professores da turma
            LOlProfessores := TObjectList(LSlTurmas.Objects[J]);
            for K := 0 to LOlProfessores.Count - 1 do
            begin
               // Verifica se há opções de disciplinas para o professor na turma
               LUMProfessor := TUMProfessor(LOlProfessores.Items[K]);
               if LUMProfessor.DisciplinasCount[LSCodTurma] > 0 then
               begin
                  LBAchou := false;
                  // Percorre a lista de disciplinas do professor na turma
                  for L := 0 to LUMProfessor.DisciplinasCount[LSCodTurma] - 1 do
                  begin
                     // Para cada disciplina encontrada para o professor,
                     // cria uma nova opção de menu Popup
                     LMiOpcao := TMenuItem.Create(Self.pmOpcoes);
                     LUMDisciplina := LUMProfessor.Disciplinas[LSCodTurma, L];
                     LMiOpcao.Caption :=
                        LUMDisciplina.Sigla + ' - ' +
                        LUMDisciplina.Descricao + ' - ' +
                        LUMProfessor.Nome;
                     // Se a disciplina não foi vinculada ao professor no Unimestre,
                     // exibe a palavra "não vinculado" no final
                     if not LUMDisciplina.Vinculado then
                        LMiOpcao.Caption :=
                           LMiOpcao.Caption + ' (não vinculado)';
                     // Armazena aqui a referência para o objeto de disciplina
                     LMiOpcao.VCLComObject := Pointer(LUMDisciplina);
                     // Se a disciplina foi selecionada então marca (checked)
                     LMiOpcao.Checked := LUMDisciplina.Selecionado;
                     // Se a turma ainda não foi importada e a diciplina não foi
                     // selecionada, então não chama a rotina de seleção de turma
                     if (not Self.IsTurmaImportada(LSCodTurma)) and (not LUMDisciplina.Selecionado) then
                        LMiOpcao.OnClick := Self.SelecionaDisciplina;
                     // Se a disciplina foi selecionada, então descarta as
                     // outras opções e exibe apenas o selecionado
                     if LUMDisciplina.Selecionado then
                     begin
                        Self.pmOpcoes.Items.Clear;
                        Self.pmOpcoes.Items.Add(LMiOpcao);
                        LBAchou := true;
                        LUMDisciplina := nil;
                        Break;
                     end;
                     // Adiciona a opção ao menu de opções
                     Self.pmOpcoes.Items.Add(LMiOpcao);
                  end;
               end;
               // Se achou uma disciplina seleciona então quebra o loop
               if LBAchou then
                  Break;
            end;
            // Se há opções então exibe a popup
            if Self.pmOpcoes.Items.Count > 0 then
               Self.pmOpcoes.Popup(LPoint.X, LPoint.Y);
         end;
      end;
end;

{ **
   Este método é invocado quando o usuário seleciona uma opção de disciplina/
   professor no menu popup de opções de horário. Se o professor selecionado
   não é ativo no Unimestre, o sistema questiona se o usuário deseja ativá-lo.
}
procedure TfUraniaErros.SelecionaDisciplina(Sender: TObject);
const
   MSG_QUEST_ATIVA_PROFESSOR =
      'Você está habilitando um professor que não está ativo como professor da instituição, deseja ativá-lo?';
var
   I: integer;
   LUMDisciplina: TUMDisciplina;
begin
   // Deseleciona todas as disciplinas
   for I := 0 to Self.pmOpcoes.Items.Count - 1 do
      TUMDisciplina(Self.pmOpcoes.Items.Items[I].VCLComObject).Selecionado := false;
   // Verifica se o professor está vinculado ou ativo no Unimestre ou se a sua
   // ativação foi solicitada anteriormente pelo usuário
   LUMDisciplina := TUMDisciplina(TMenuItem(Sender).VCLComObject); 
   if (LUMDisciplina.Professor.Situacao in[spDesativado, spNaoProfessor]) and
      (not Self.IsProfessorSelecionado(LUMDisciplina.Professor.Codigo)) then
   begin
      // Questiona o usuário se ele deseja realmente ativar este professor no Unimestre
      if Mensagem(MSG_QUEST_ATIVA_PROFESSOR, 'Atenção!', MB_YESNO + MB_ICONQUESTION, Self.Handle) = ID_YES then
      begin
         // Seleciona a disciplina
         LUMDisciplina.Selecionado := true;
         // Guarda o professor na lista de professores ativados manualmente
         SetLength(Self.FAProfessoresAtivados, Length(Self.FAProfessoresAtivados) + 1);
         Self.FAProfessoresAtivados[Length(Self.FAProfessoresAtivados) - 1] := LUMDisciplina.Professor.Codigo;
      end;
   end
   else
      // Seleciona a disciplina
      TUMDisciplina(TMenuItem(Sender).VCLComObject).Selecionado := true;
   Self.MostraDisciplinaProfessor;
   Self.sgHorarios.Refresh;
end;

{ **
   Este método é invocado pelo evento "OnDrawCell" da grade de horários.
   Verifica em cada célula da grade se existe um professor/disciplina
   selecionado. Onde houver seleção a célula será colorida de verde. Onde houve
   erro na importação e não fio selecionado professor/disciplina, exibirá em
   vermelho. Nas células onde não há horário ficará em branco.
}
procedure TfUraniaErros.sgHorariosDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   LCorCel: TColor;
   I, J: integer;
   LBAchou: boolean;
   LObjeto: TObject;
   LSlTurmas: TStringList;
   LUMProfessor: TUMProfessor;
   LOlProfessores: TObjectList;
   LSCodTurma, LSCell: string;
begin
   LBAchou := false;
   LSCell := sgHorarios.Cells[ACol, ARow];
   LSCodTurma := Self.cbTurmas.Items.Strings[Self.cbTurmas.ItemIndex];
   LObjeto := sgHorarios.Objects[ACol, ARow];
   if (ACol > 0) and (ARow > 0) then
   begin
      // A princípio a cor da célula será branca
      LCorCel := clWindow;
      // Verifica o conteúdo do objeto na célula
      if Assigned(LObjeto) then
      begin
         LSlTurmas := TStringList(LObjeto);
         LSlTurmas.Sort;
         // Verifica se a turma selecionada está aqui
         if LSlTurmas.Find(LSCodTurma, I) then
         begin
            // Percorre a lista de professores da turma
            LOlProfessores := TObjectList(LSlTurmas.Objects[I]);
            for I := 0 to LOlProfessores.Count - 1 do
            begin
               // Percorre a lista de disciplinas do professor na turma
               LUMProfessor := TUMProfessor(LOlProfessores.Items[I]);
               for J := 0 to LUMProfessor.DisciplinasCount[LSCodTurma] - 1 do
                  // Verifica se a disciplina foi selecionada
                  if TUMDisciplina(LUMProfessor.Disciplinas[LSCodTurma, J]).Selecionado then
                  begin
                     // A disciplina foi selecionada. Quebra o loop
                     LBAchou := true;
                     Break;
                  end;
               // Se existe disciplina seleciona a cor da célula será verde
               if LBAchou then
                  LCorCel := clLime
               // Caso contrário será vermelha
               else
                  LCorCel := clRed;
            end;
         end;
      end;
      // Não achou disciplina selecionada manualmente
      // Verifica se este horário já foi importado automaticamente
      if not LBAchou then
      begin
         // Consulta os horários já vinculados para a turma
         LBAchou :=
            qyTurmasHorarios.Locate(
               'anosemestre;turma;dia_semana;cd_horario_urania',
               VarArrayOf([FUMUraniaImportacao.AnoSemestre, LSCodTurma, ACol,
                           TUMHorario(sgHorarios.Objects[0, ARow]).Codigo]), []);
         // Se o horário está corretamente vinculado no Unimestre...
         if LBAchou then
         begin
            // então a cor da célula será verde
            LCorCel := clLime;
            LSCell :=
               qyTurmasHorarios.FieldByName('sigla').AsString + '/' +
               qyTurmasHorarios.FieldByName('cd_pessoa').AsString;
         end
         else
         begin
            // O horário não está vinculado
            // Verifica se o horário está entre àqueles que não puderam ser
            // importados automaticamente
            for I := 0 to FUMUraniaImportacao.HorarioCount - 1 do
            begin
               if (FUMUraniaImportacao.Horarios[I].CodTurma = LSCodTurma) and
                  (FUMUraniaImportacao.Horarios[I].DiaSemanaUM = ACol) and
                  (FUMUraniaImportacao.Horarios[I].Horario = TUMHorario(sgHorarios.Objects[0, ARow]).Codigo) then
               begin
                  for J := 0 to UraniaImportacaoDB.HorariosErradosCount - 1 do
                     if FUMUraniaImportacao.Horarios[I] = UraniaImportacaoDB.HorariosErrados[J] then
                     begin
                        // Horário não foi importado automaticamente
                        LBAchou := true;
                        Break;
                     end;
                  // Horário não importado a cor da célula é vermelha
                  if LBAchou then
                     LCorCel := clRed
                  // Horário importado a cor da célula é verde
                  else
                     LCorCel := clLime;
               end;
            end;
         end;
      end;
      // Pinta a célula na cor definida
      sgHorarios.Canvas.Brush.Color := LCorCel;
      sgHorarios.Canvas.FillRect(Rect);
      sgHorarios.Canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 2, LSCell);
   end;
end;

{ **
   Este método é invocado no evento "OnMouseDown" da grade de horários. Guarda
   os pontos atuais do click do mouse para posteriormente saber qual célula
   selecionar e saber onde exibir a Popup com as opções de disciplinas.
}
procedure TfUraniaErros.sgHorariosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Self.FPontoClick.X := X;
   Self.FPontoClick.Y := Y;
end;

{ **
   Este método é invocado no evento "OnClik" do botão "F12 Fechar".
}
procedure TfUraniaErros.tbFecharClick(Sender: TObject);
begin
   Self.Close;
end;

{ **
   Método estático que chama a tela para verificação de erros no processo de
   importação dos horários do Urânia.
}
class procedure TfUraniaErros.VerificaErros(AOwner: TComponent;
  const AUMUraniaImportacao: TUMUraniaImportacao);
begin
   if not Assigned(fUraniaErros) then
      fUraniaErros := TfUraniaErros.Create(AOwner, AUMUraniaImportacao);
   fUraniaErros.ShowModal;
   FreeAndNil(fUraniaErros);
end;

{ **
   Efetua o vínculo de discplina/turma/professor no Unimestre. Após efetuar o
   vínculo com sucesso, armazena o objeto na lista de turmas/professores
   vinculados manualmente para consultar posteriormente.
}
function TfUraniaErros.VinculaTurmaProfessor(const AICodDisciplina,
  AIAnoSemestre, AICodProfessor: integer; const ASCodCurso,
  ASCodTurma: string): boolean;
begin
   Result :=
      Self.IsTurmaProfessorVinculado(
         AICodDisciplina, AIAnoSemestre, AICodProfessor, ASCodCurso, ASCodTurma);
   if not Result then
   begin
      Result := true;
      Self.qyVinculaTurmaProfessor.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
      Self.qyVinculaTurmaProfessor.ParamByName('curso').AsString := ASCodCurso;
      Self.qyVinculaTurmaProfessor.ParamByName('turma').AsString := ASCodTurma;
      Self.qyVinculaTurmaProfessor.ParamByName('disciplina').AsInteger := AICodDisciplina;
      Self.qyVinculaTurmaProfessor.ParamByName('professor').AsInteger := AICodProfessor;
      try
         Self.qyVinculaTurmaProfessor.ExecSQL;
      except
         on E: EDatabaseError do
            Result := false;
      end;
      if Result then
         Self.FOlTPVinculados.Add(
            TUMTurmaProfessor.Create(
               AIAnoSemestre, AICodProfessor, AICodDisciplina, ASCodCurso, ASCodTurma));
   end;
end;

{ TUMHorario }

constructor TUMHorario.Create(const AICodigo, AICodUrania: integer;
  const ASSigla, ASChave, ASDescricao, ASCategoria: string; ACTurno: Char;
  const ATHoraInicio, ATHoraFim: TTime);
begin
   Self.FICodigo := AICodigo;
   Self.FICodUrania := AICodUrania;
   Self.FSSigla := ASSigla;
   Self.FSChave := ASChave;
   Self.FSDescricao := ASDescricao;
   Self.FSCategoria := ASCategoria;
   Self.FCTurno := ACTurno;
   Self.FTHoraInicio := ATHoraInicio;
   Self.FTHoraFim := ATHoraFim;
end;

destructor TUMHorario.Destroy;
begin
   inherited;
end;

{ TUMDisciplina }

constructor TUMDisciplina.Create(const AICodigo: integer; const ASCodCurso,
  ASSigla, ASDescricao: string; const ABVinculado: boolean;
  const AUMProfessor: TUMProfessor);
begin
   Self.FICodigo := AICodigo;
   Self.FSCodCurso := ASCodCurso;
   Self.FSSigla := ASSigla;
   Self.FSDescricao := ASDescricao;
   Self.FBVinculado := ABVinculado;
   Self.FBSelecionado := false;
   Self.FUMProfessor := AUMProfessor;
end;

destructor TUMDisciplina.Destroy;
begin
   inherited;
end;

{ TUMProfessor }

procedure TUMProfessor.AdicionaDisciplina(const AUMDisciplina: TUMDisciplina;
  const ASCodTurma: string);
var
   Indice: integer;
begin
   if not Self.ProcuraDisciplina(AUMDisciplina.Codigo, AUMDisciplina.CodCurso, ASCodTurma) then
   begin
      Self.FSlDisciplinas.Sort;
      if not Self.FSlDisciplinas.Find(ASCodTurma, Indice) then
         Indice := Self.FSlDisciplinas.AddObject(ASCodTurma, TObjectList.Create);
      TObjectList(Self.FSlDisciplinas.Objects[Indice]).Add(AUMDisciplina);
   end;
end;

constructor TUMProfessor.Create(const AICodigo: Integer; const ASNome: string;
   const AUMSituacaoProfessor: TUMSituacoesProfessor);
begin
   Self.FSlDisciplinas := TStringList.Create;
   Self.FUMSituacaoProfessor := AUMSituacaoProfessor;
   Self.FICodigo := AICodigo;
   Self.FSNome := ASNome;
end;

destructor TUMProfessor.Destroy;
var
   I, J: integer;
begin
   for I := 0 to Self.FSlDisciplinas.Count - 1 do
   begin
      for J := TObjectList(Self.FSlDisciplinas.Objects[I]).Count - 1 downto 0 do
         TUMDisciplina(TObjectList(Self.FSlDisciplinas.Objects[I]).Items[J]).Free;
   end;
   inherited;
end;

procedure TUMProfessor.ForcaCarregamento(const ASCodTurma: string);
var
   Indice: integer;
begin
   Self.FSlDisciplinas.Sort;
   if not Self.FSlDisciplinas.Find(ASCodTurma, Indice) then
      Self.FSlDisciplinas.AddObject(ASCodTurma, TObjectList.Create);
end;

function TUMProfessor.GetDisciplina(const ASCodTurma: string;
  const AIndice: integer): TUMDisciplina;
var
   Indice: integer;
begin
   Result := nil;
   Self.FSlDisciplinas.Sort;
   if Self.FSlDisciplinas.Find(ASCodTurma, Indice) then
      Result := TUMDisciplina(TObjectList(Self.FSlDisciplinas.Objects[Indice]).Items[AIndice]);
end;

function TUMProfessor.GetDisciplinasCount(const ASCodTurma: string): integer;
var
   Indice: integer;
begin
   Result := 0;
   Self.FSlDisciplinas.Sort;
   if Self.FSlDisciplinas.Find(ASCodTurma, Indice) then
      Result := TObjectList(Self.FSlDisciplinas.Objects[Indice]).Count;
end;

function TUMProfessor.IsCarregado(const ASCodTurma: string): boolean;
var
   Indice: integer;
begin
   Self.FSlDisciplinas.Sort;
   Result := Self.FSlDisciplinas.Find(ASCodTurma, Indice);
end;

function TUMProfessor.ProcuraDisciplina(const AICodigo: integer;
  const ASCodCurso, ASCodTurma: string): boolean;
var
   I, Indice: integer;
begin
   Result := false;
   Self.FSlDisciplinas.Sort;
   if Self.FSlDisciplinas.Find(ASCodTurma, Indice) then
      for I := 0 to TObjectList(Self.FSlDisciplinas.Objects[Indice]).Count - 1 do
         with TUMDisciplina(TObjectList(Self.FSlDisciplinas.Objects[Indice]).Items[I]) do
         begin
            if (Codigo = AICodigo) and (CodCurso = ASCodCurso) then
            begin
               Result := true;
               Break;
            end;
         end;
end;

{ TUMTurmaProfessor }

constructor TUMTurmaProfessor.Create(const AIAnoSemestre, AICodProfessor,
  AICodDisciplina: integer; const ASCodCurso, ASCodTurma: string);
begin
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FICodProfessor := AICodProfessor;
   Self.FICodDisciplina := AICodDisciplina;
   Self.FSCodCurso := ASCodCurso;
   Self.FSCodTurma := ASCodTurma;
end;

destructor TUMTurmaProfessor.Destroy;
begin
   inherited;
end;

end.


