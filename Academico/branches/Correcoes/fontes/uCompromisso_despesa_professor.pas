unit uCompromisso_despesa_professor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UMComboBox, ComCtrls, Mask,
  uItemCompromisso, DB, UZDataset, General;

type
  TfrmDespesaProfessor = class(TForm)
    pnTitulo: TPanel;
    lbAnoSemestre: TLabel;
    cmbDisciplinaProfessor: TUMComboBox;
    lbdisciplina: TLabel;
    pnBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    upAnoSemestre: TUpDown;
    meAnoSemestre: TMaskEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure upAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    cd_pessoa        : string;
    turma_disciplina : string;

    { Private declarations }
  public
    procedure getProfessorDisciplinas();
    procedure limparComboProfessorDisciplina();
    procedure selecionaDisciplina();

    procedure setAnosemestre( valor : string );
    procedure setCdPessoa( valor: string );
    procedure setTurmaDisciplina( valor: string );
    function getCdPessoa() : string;
    function getAnosemestre() : string;
    function getTurmaDisciplina(): string;
    { Public declarations }

    property nr_anosemestre   : string read getAnosemestre  write setAnosemestre;
  end;

var
  frmDespesaProfessor: TfrmDespesaProfessor;

implementation

uses Main, uDM, uCompromisso_cadastro;

{$R *.dfm}

procedure TfrmDespesaProfessor.btnCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmDespesaProfessor.btnConfirmarClick(Sender: TObject);
var
   arrTurmaDiscplina : TStringList;
   codigo            : string;
   cd_turma          : string;
   cd_disciplina     : string;
   descricao         : string;
begin
   if cmbDisciplinaProfessor.ItemIndex <> -1 then
   begin
      arrTurmaDiscplina := TStringList.Create();

      codigo      := (cmbDisciplinaProfessor.Items.Objects[ cmbDisciplinaProfessor.itemIndex ] as TItemCompromisso).getCodigo();
      descricao   := (cmbDisciplinaProfessor.Items.Objects[ cmbDisciplinaProfessor.itemIndex ] as TItemCompromisso).getDescricao();
      SplitString ( codigo, ';', arrTurmaDiscplina );

      cd_turma       := arrTurmaDiscplina[0];
      cd_disciplina  := arrTurmaDiscplina[1];

      frmCompromissoCadastro.setCdTurmaDiscAnoSem( cd_turma, cd_disciplina, nr_anosemestre );
      frmCompromissoCadastro.txtTurmaProfessor.Text := descricao;
      frmCompromissoCadastro.alterou_turma := True;

      FreeAndNil( arrTurmaDiscplina );

      Self.Close();
   end
   else
   begin
      Mensagem('Selecione a disciplina', 'Aviso', MB_OK + MB_ICONINFORMATION);
      cmbDisciplinaProfessor.SetFocus();
   end;
end;

procedure TfrmDespesaProfessor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   limparComboProfessorDisciplina();
   Action := caFree;
end;

procedure TfrmDespesaProfessor.FormShow(Sender: TObject);
begin
   if trim(nr_anosemestre) = '' then
   begin
      nr_anosemestre := inttostr(ano_semestre);
   end;

   //recupera a lista de disciplinas
   getProfessorDisciplinas();

   //seleciona a disciplina se houver
   Self.selecionaDisciplina();
end;

function TfrmDespesaProfessor.getAnosemestre: string;
begin
   Result := meAnoSemestre.Text;
end;

function TfrmDespesaProfessor.getCdPessoa: string;
begin
   Result := Self.cd_pessoa;
end;

procedure TfrmDespesaProfessor.getProfessorDisciplinas;
var
   qyProfessorDisciplinas  : TUMZQuery;
   objItem                 : TItemCompromisso;
   codigo                  : string;
   descricao               : string;
begin
   Self.limparComboProfessorDisciplina();

   DM.CriarConsulta( qyProfessorDisciplinas );
   qyProfessorDisciplinas.Close();
   qyProfessorDisciplinas.SQL.Clear;
   qyProfessorDisciplinas.SQL.Add('SELECT');
   qyProfessorDisciplinas.SQL.Add(' tp.turma, d.codigo, d.descricao ');
   qyProfessorDisciplinas.SQL.Add('FROM');
   qyProfessorDisciplinas.SQL.Add(' turmasprofessores tp ');
   qyProfessorDisciplinas.SQL.Add(' INNER JOIN disciplinas d ON( tp.curso = d.curso AND tp.disciplina = d.codigo ) ');
   qyProfessorDisciplinas.SQL.Add('WHERE');
   qyProfessorDisciplinas.SQL.Add(' tp.professor = :cd_pessoa ');
   qyProfessorDisciplinas.SQL.Add(' AND tp.anosemestre = :anosemestre ');
   qyProfessorDisciplinas.SQL.Add(' ORDER BY d.descricao ');

   qyProfessorDisciplinas.ParamByName('cd_pessoa').AsString    := Self.getCdPessoa();
   qyProfessorDisciplinas.ParamByName('anosemestre').AsString  := Self.getAnosemestre();
   qyProfessorDisciplinas.Open();

   while not qyProfessorDisciplinas.Eof do
   begin
      codigo := CONCAT(qyProfessorDisciplinas.FieldByName('turma').AsString,
      ';', qyProfessorDisciplinas.FieldByName('codigo').AsString);

      descricao := CONCAT(qyProfessorDisciplinas.FieldByName('turma').AsString,
      ' - ', qyProfessorDisciplinas.FieldByName('descricao').AsString);

      objItem := TItemCompromisso.Create( codigo, descricao );

      cmbDisciplinaProfessor.Items.AddObject( objItem.getDescricao, objItem );

      qyProfessorDisciplinas.Next;
   end;

   FreeAndNil( qyProfessorDisciplinas );
end;

function TfrmDespesaProfessor.getTurmaDisciplina: string;
begin
   Result := Self.turma_disciplina;
end;

procedure TfrmDespesaProfessor.limparComboProfessorDisciplina;
var
   i : integer;
begin
   if cmbDisciplinaProfessor.Items.Count > 0 then
   begin

   //libera os objetos da combo
   for i := cmbDisciplinaProfessor.Items.Count - 1 downto 0 do
   begin
      (cmbDisciplinaProfessor.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbDisciplinaProfessor.Clear;

   end;
end;

procedure TfrmDespesaProfessor.selecionaDisciplina();
var
   i      : integer;
   codigo : string;
begin
   if trim(Self.getTurmaDisciplina()) <> '' then
   begin
      for i := 0 to cmbDisciplinaProfessor.Items.Count - 1 do
      begin
         codigo := (cmbDisciplinaProfessor.Items.Objects[ i ] as TItemCompromisso).getCodigo();

         if codigo = Self.getTurmaDisciplina() then
         begin
            cmbDisciplinaProfessor.ItemIndex := i;
            break;
         end;
      end;
   end;
end;

procedure TfrmDespesaProfessor.setAnosemestre(valor: string);
begin
   meAnoSemestre.Text := valor;
end;

procedure TfrmDespesaProfessor.setCdPessoa( valor: string );
begin
   Self.cd_pessoa := valor;
end;

procedure TfrmDespesaProfessor.setTurmaDisciplina(valor: string);
begin
   Self.turma_disciplina := valor;
end;

procedure TfrmDespesaProfessor.upAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      nr_anosemestre := DM.incrementar_ano_semestre( nr_anosemestre );
   end
   else
   begin
      nr_anosemestre := DM.decrementar_ano_semestre( nr_anosemestre );
   end;

   Self.getProfessorDisciplinas();
end;

end.
