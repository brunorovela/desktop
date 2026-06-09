unit uDisciplinasOptativas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ComCtrls;

type
  TfDisciplinasOptativas = class(TForm)
    tvDisciplinasOptativas: TTreeView;
    qDisciplinasOptativas: TUMZQuery;
    qDisciplinasOptativascd_disciplina_optativa: TIntegerField;
    qDisciplinasOptativasdescricao_optativa: TStringField;
    qDisciplinasOptativasdescricao_generica: TStringField;
    qDisciplinasOptativascd_disciplina_generica: TIntegerField;
    procedure tvDisciplinasOptativasMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDisciplinasOptativas(nr_anosemestre: Integer; cd_turma: String);
  end;

var
  fDisciplinasOptativas: TfDisciplinasOptativas;

implementation

{$R *.dfm}

procedure TfDisciplinasOptativas.CarregaDisciplinasOptativas(nr_anosemestre: Integer; cd_turma: String);
var
   nodoPai: TTreeNode;
   discGenerica: Integer;
begin

   // Busca todas as disciplinas optativas que a turma pode possuir com suas respectivas genéricas
   qDisciplinasOptativas.Close;
   qDisciplinasOptativas.ParamByName('cd_turma').AsString := cd_turma;
   qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qDisciplinasOptativas.Open;

   // Limpa a arvore para listagem das disciplinas a serem escolhidas
   tvDisciplinasOptativas.Items.Clear();

   // Verifica se existe alguma disciplina optativa a ser selecionada para a turma
   if qDisciplinasOptativas.Eof then
   begin
      tvDisciplinasOptativas.Items.Add(tvDisciplinasOptativas.TopItem, 'Nenhuma disciplina optativa para selecionar!');
      Exit;            
   end;

   // Varre a lista de discilinas genéricas
   qDisciplinasOptativas.First;
   while not qDisciplinasOptativas.Eof do
   begin

      if discGenerica <> qDisciplinasOptativas.FieldByName('cd_disciplina_generica').AsInteger then
      begin
         // Grava o nodo pai, a disciplina genérica optativa
         nodoPai := tvDisciplinasOptativas.Items.Add(tvDisciplinasOptativas.TopItem, qDisciplinasOptativas.FieldByName('descricao_generica').AsString);
         discGenerica := qDisciplinasOptativas.FieldByName('cd_disciplina_generica').AsInteger;
      end;

      // Grava o nodo filho, as disciplinas optativas disponíveis para a disciplina genérica em questão
      tvDisciplinasOptativas.Items.AddChild(nodoPai, qDisciplinasOptativas.FieldByName('descricao_optativa').AsString);

      qDisciplinasOptativas.Next;
   end;

   tvDisciplinasOptativas.FullExpand;
end;

procedure TfDisciplinasOptativas.tvDisciplinasOptativasMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   disciplinaGenerica, disciplinaOptativa: TTreeNode;
begin
   disciplinaOptativa := (Sender as TTreeView).GetNodeAt(X, Y);

   // Se não for um nodo PAI
   if (disciplinaOptativa <> nil) and (not disciplinaOptativa.HasChildren) then
   begin
      // Pega o nodo pai (disciplina genérica)
      disciplinaGenerica := disciplinaOptativa.Parent;

      // Deve existir uma disciplina genérica
      if disciplinaGenerica <> nil then
      begin
         tvDisciplinasOptativas.BeginDrag(true);

         // Posiciona o SQL nas disciplinas que irão ser transferidas
         Self.qDisciplinasOptativas.Locate('descricao_optativa;descricao_generica', VarArrayOf([disciplinaOptativa.Text, disciplinaGenerica.Text]), [loCaseInsensitive]);

         //Self.qDisciplinasGenericasOptativas.Locate('descricao', disciplinaGenerica.Text, [loCaseInsensitive]);
      end;

   end;
end;

end.
