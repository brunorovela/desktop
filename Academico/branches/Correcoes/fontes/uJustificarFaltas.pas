unit uJustificarFaltas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, General;

type
  TfrmJustificarFaltas = class(TForm)
    Panel1: TPanel;
    pcJustificativas: TPageControl;
    tsJustificar: TTabSheet;
    tsHistoricoJustificativas: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbTurma: TLabel;
    lbDataAula: TLabel;
    lbDisciplina: TLabel;
    lbAluno: TLabel;
    Label5: TLabel;
    mHistoricoJustificativasTurma: TMemo;
    Label6: TLabel;
    mJustificativa: TMemo;
    ImageList2: TImageList;
    toolPessoa: TToolBar;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    qyInsereJustificativa: TUMZQuery;
    qyCarregaHistorico: TUMZReadOnlyQuery;
    mHistoricoGeral: TMemo;
    Label8: TLabel;
    lbNomeAluno: TLabel;
    Label7: TLabel;
    qyCorrigeAulasAlunos: TUMZQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    Fturma: String;
    Fcodaluno: Integer;
    Fdataaula: TDateTime;
    Fdisciplina: Integer;
    Fanosemestre: Integer;
    Fnumeroaula: Integer;
    Fnrqtdaulas: Integer;
    Fbimestre: Integer;
    Fcdpessoa: Integer;
    FlbAluno: String;
    FlbDataAula: String;
    FlbDisciplina: String;
    FlbTurma: String;
    FpossuiFaltas: Boolean;
    procedure SetpossuiFaltas(const Value: Boolean);
    procedure SetlbAluno(const Value: String);
    procedure SetlbDataAula(const Value: String);
    procedure SetlbDisciplina(const Value: String);
    procedure SetlbTurma(const Value: String);
    procedure Setanosemestre(const Value: Integer);
    procedure Setbimestre(const Value: Integer);
    procedure Setcdpessoa(const Value: Integer);
    procedure Setnrqtdaulas(const Value: Integer);
    procedure Setnumeroaula(const Value: Integer);
    procedure Setdataaula(const Value: TDateTime);
    procedure Setdisciplina(const Value: Integer);
    procedure Setturma(const Value: String);

    // funções operacionais
    procedure salvaJustificativa();
    procedure carregaHistoricoJustificativas();
    procedure corrigeAulasAlunos();
  public
    property turma: String read Fturma write Setturma;
    property disciplina: Integer read Fdisciplina write Setdisciplina;
    property dataaula: TDateTime read Fdataaula write Setdataaula;
    property anosemestre: Integer read Fanosemestre write Setanosemestre;
    property bimestre: Integer read Fbimestre write Setbimestre;
    property numeroaula: Integer read Fnumeroaula write Setnumeroaula;
    property cdpessoa: Integer read Fcdpessoa write Setcdpessoa;
    property nrqtdaulas: Integer read Fnrqtdaulas write Setnrqtdaulas;
    property possuiFaltas: Boolean read FpossuiFaltas write SetpossuiFaltas;

    // Labels
    property lbTDisciplina: String read FlbDisciplina write SetlbDisciplina;
    property lbTTurma: String read FlbTurma write SetlbTurma;
    property lbTDataAula: String read FlbDataAula write SetlbDataAula;
    property lbTAluno: String read FlbAluno write SetlbAluno;
  end;

var
  frmJustificarFaltas: TfrmJustificarFaltas;

implementation

{$R *.dfm}

procedure TfrmJustificarFaltas.btnCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmJustificarFaltas.btnSalvarClick(Sender: TObject);
begin
   if not(possuiFaltas) then
   begin
      Mensagem(
         'O aluno '+lbAluno.Caption+' não possui faltas nessa aula ('+lbDataAula.Caption+') para justificar',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );
      
      Exit;
   end;

   salvaJustificativa;
end;

procedure TfrmJustificarFaltas.carregaHistoricoJustificativas;
begin
   mHistoricoJustificativasTurma.Text := '';
   mHistoricoGeral.Text := '';

   qyCarregaHistorico.Close;
   qyCarregaHistorico.ParamByName('cd_pessoa').AsInteger :=
      Self.cdpessoa;
   qyCarregaHistorico.Open;

   while not qyCarregaHistorico.Eof do
   begin
      if (qyCarregaHistorico.FieldByName('cd_turma').AsString = Self.turma) and
         (qyCarregaHistorico.FieldByName('cd_disciplina').AsInteger = Self.disciplina) then
      begin
         mHistoricoJustificativasTurma.Text :=
            mHistoricoJustificativasTurma.Text +
            'Ano/Semestre: '+
            qyCarregaHistorico.FieldByName('nr_anosemestre').AsString + #13#10 +
            'Turma: '+
            qyCarregaHistorico.FieldByName('cd_turma').AsString + #13#10 +
            'Disciplina: '+
            qyCarregaHistorico.FieldByName('descricao').AsString + #13#10 +
            'Etapa: '+
            qyCarregaHistorico.FieldByName('cd_bimestre').AsString + #13#10 +
            'Nr. aula: '+
            qyCarregaHistorico.FieldByName('nr_aula').AsString + #13#10 +
            'Data: '+
            qyCarregaHistorico.FieldByName('dataaula').AsString + #13#10 +
            'Qtde. aulas: '+
            qyCarregaHistorico.FieldByName('nr_qtd_aulas').AsString + #13#10 +
            'Usuário que justificou: '+
            qyCarregaHistorico.FieldByName('nm_usuario_registrou').AsString + #13#10 +
            'Justificativa: '+
            qyCarregaHistorico.FieldByName('ds_justificativa').AsString+ #13#10 + #13#10;
      end;

      mHistoricoGeral.Text :=
         mHistoricoGeral.Text +
         'Ano/Semestre: '+
         qyCarregaHistorico.FieldByName('nr_anosemestre').AsString + #13#10 +
         'Turma: '+
         qyCarregaHistorico.FieldByName('cd_turma').AsString + #13#10 +
         'Disciplina: '+
         qyCarregaHistorico.FieldByName('descricao').AsString + #13#10 +
         'Etapa: '+
         qyCarregaHistorico.FieldByName('cd_bimestre').AsString + #13#10 +
         'Nr. aula: '+
         qyCarregaHistorico.FieldByName('nr_aula').AsString + #13#10 +
         'Data: '+
         qyCarregaHistorico.FieldByName('dataaula').AsString + #13#10 +
         'Qtde. aulas: '+
         qyCarregaHistorico.FieldByName('nr_qtd_aulas').AsString + #13#10 +
         'Usuário que justificou: '+
         qyCarregaHistorico.FieldByName('nm_usuario_registrou').AsString + #13#10 +
         'Justificativa: '+
         qyCarregaHistorico.FieldByName('ds_justificativa').AsString+ #13#10 + #13#10;

      lbTurma.Caption := qyCarregaHistorico.FieldByName('cd_turma').AsString;
      lbDataAula.Caption := qyCarregaHistorico.FieldByName('dataaula').AsString;
      lbDisciplina.Caption := qyCarregaHistorico.FieldByName('descricao').AsString;
      lbAluno.Caption := qyCarregaHistorico.FieldByName('nm_pessoa').AsString;
      lbNomeAluno.Caption := qyCarregaHistorico.FieldByName('nm_pessoa').AsString;

      qyCarregaHistorico.Next;
   end;
end;

procedure TfrmJustificarFaltas.corrigeAulasAlunos;
begin
   qyCorrigeAulasAlunos.ParamByName('cd_pessoa').AsInteger := Self.cdpessoa;
   qyCorrigeAulasAlunos.ParamByName('cd_turma').AsString := Self.turma;
   qyCorrigeAulasAlunos.ParamByName('nr_anosem').AsInteger := Self.anosemestre;
   qyCorrigeAulasAlunos.ParamByName('cd_disciplina').AsInteger := Self.disciplina;
   qyCorrigeAulasAlunos.ParamByName('cd_bimestre').AsInteger := Self.bimestre;
   qyCorrigeAulasAlunos.ParamByName('nr_aula').AsInteger := Self.numeroaula;
   qyCorrigeAulasAlunos.ExecSQL; 
end;

procedure TfrmJustificarFaltas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmJustificarFaltas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F5 then btnSalvarClick(nil);
   if Key = VK_F6 then btnCancelarClick(nil);
end;

procedure TfrmJustificarFaltas.FormShow(Sender: TObject);
begin
   carregaHistoricoJustificativas;

   pcJustificativas.ActivePage := tsJustificar;

   if not(possuiFaltas) then
   begin
      pcJustificativas.ActivePage := tsHistoricoJustificativas;
   end;
end;

procedure TfrmJustificarFaltas.salvaJustificativa;
begin
   qyInsereJustificativa.ParamByName('nr_anosemestre').AsInteger := Self.anosemestre;
   qyInsereJustificativa.ParamByName('cd_turma').AsString := Self.turma;
   qyInsereJustificativa.ParamByName('cd_disciplina').AsInteger := Self.disciplina;
   qyInsereJustificativa.ParamByName('cd_bimestre').AsInteger := Self.bimestre;
   qyInsereJustificativa.ParamByName('nr_aula').AsInteger := Self.numeroaula;
   qyInsereJustificativa.ParamByName('dt_aula').AsDateTime := Self.dataaula;
   qyInsereJustificativa.ParamByName('cd_pessoa').AsInteger := Self.cdpessoa;
   qyInsereJustificativa.ParamByName('nr_qtd_aulas').AsInteger := Self.nrqtdaulas;
   qyInsereJustificativa.ParamByName('cd_usuario_registrou').AsInteger :=
      DM.UsuarioLogado.Pessoa.Codigo;
   qyInsereJustificativa.ParamByName('ds_justificativa').AsString :=
      mJustificativa.Text;
   qyInsereJustificativa.ExecSQL;

   mJustificativa.Text := '';
   mJustificativa.SetFocus;
   
   carregaHistoricoJustificativas;
   corrigeAulasAlunos;
end;

procedure TfrmJustificarFaltas.Setanosemestre(const Value: Integer);
begin
  Fanosemestre := Value;
end;

procedure TfrmJustificarFaltas.Setbimestre(const Value: Integer);
begin
  Fbimestre := Value;
end;

procedure TfrmJustificarFaltas.Setcdpessoa(const Value: Integer);
begin
  Fcdpessoa := Value;
end;

procedure TfrmJustificarFaltas.Setdataaula(const Value: TDateTime);
begin
  Fdataaula := Value;
end;

procedure TfrmJustificarFaltas.Setdisciplina(const Value: Integer);
begin
  Fdisciplina := Value;
end;

procedure TfrmJustificarFaltas.SetlbAluno(const Value: String);
begin
  lbAluno.Caption := Value;
  lbNomeAluno.Caption := Value;
end;

procedure TfrmJustificarFaltas.SetlbDataAula(const Value: String);
begin
  lbDataAula.Caption := Value;
end;

procedure TfrmJustificarFaltas.SetlbDisciplina(const Value: String);
begin
  Self.lbDisciplina.Caption := Value;
end;

procedure TfrmJustificarFaltas.SetlbTurma(const Value: String);
begin
  lbTurma.Caption := Value;
end;

procedure TfrmJustificarFaltas.Setnrqtdaulas(const Value: Integer);
begin
  Fnrqtdaulas := Value;
end;

procedure TfrmJustificarFaltas.Setnumeroaula(const Value: Integer);
begin
  Fnumeroaula := Value;
end;

procedure TfrmJustificarFaltas.SetpossuiFaltas(const Value: Boolean);
begin
  FpossuiFaltas := Value;
end;

procedure TfrmJustificarFaltas.Setturma(const Value: String);
begin
  Fturma := Value;
end;

end.

