unit uListaConvenios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ZConnection, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, uDM;

type
  TfListaConvenios = class(TForm)
    treeofConvenios: TTreeView;
    qConveniados: TUMZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure treeofConveniosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
//    objStringList : TStringList;
   bLimparSQL: Boolean;

  public
    { Public declarations }
    procedure limpaTree();
    procedure iniciaTree();

    { Bloquear convenios }
    procedure BloquearConveniosTurma(const nr_anosemestre: integer; const cd_curso, cd_turma: String);
  end;

var
  fListaConvenios: TfListaConvenios;

implementation

uses uCursos, General;

{$R *.dfm}

// inicia a tree
procedure TfListaConvenios.BloquearConveniosTurma(const nr_anosemestre: integer;
  const cd_curso, cd_turma: String);
begin
   bLimparSQL := True;

   with qConveniados do
   begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT * FROM instituicoes_ensino');
      SQL.Add('WHERE sn_convenio = 1 AND');
      SQL.Add('      cd_instituicao NOT IN (SELECT cd_instituicao FROM turmas_convenios WHERE anosemestre = :NR_ANOSEMESTRE AND curso = :CD_CURSO AND turma = :CD_TURMA)');
      SQL.Add('ORDER BY nm_instituicao ASC');

      ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
      ParamByName('CD_CURSO').AsString := cd_curso;
      ParamByName('CD_TURMA').AsString := cd_turma;
   end;
end;

procedure TfListaConvenios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if bLimparSQL then
   begin
      qConveniados.Close();
      qConveniados.SQL.Text := 'select * from instituicoes_ensino where sn_convenio=1 order by nm_instituicao asc';

      bLimparSQL := False;
   end;
end;

procedure TfListaConvenios.FormCreate(Sender: TObject);
begin
   bLimparSQL := False;
end;

procedure TfListaConvenios.iniciaTree();
var
  NoPrincipal : TTreeNode;
begin

   self.limpaTree();

   with qConveniados do begin
      Close();
      Open();

      if (bLimparSQL) AND (RecordCount = 0) then
      begin
         Mensagem( 'Todos os convênios já foram cadastrados para esta turma ou não existem convênios disponíveis.' );
      end;

      First;
   end;

//   objStringList := TStringList.Create;

   NoPrincipal := treeofConvenios.items.Add( treeofConvenios.TopItem, 'Escolha:' );

   while not qConveniados.Eof do
   begin

//      objStringList.AddObject(
//         qConveniados.FieldByName('cd_instituicao').asstring,
//         treeofConvenios.Items.AddChild( NoPrincipal, qConveniados.FieldByName('nm_instituicao').DisplayText )
//      );
      treeofConvenios.Items.AddChild( NoPrincipal, qConveniados.FieldByName('nm_instituicao').DisplayText);
      qConveniados.Next;
   end;
end;


// inicia dragDrop
{procedure TfListaConvenios.TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
begin

   glogal_cd_instituicao := objStringList.Names[ objStringList.IndexOfObject( Source as TTreeNode ) ];
   treeofConvenios.BeginDrag(True);

end;}


// limpa a tree
procedure TfListaConvenios.LimpaTree;
begin
  treeofConvenios.Items.Clear();
end;



procedure TfListaConvenios.treeofConveniosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   treeofConvenios.BeginDrag(true);
   Self.qConveniados.Locate('nm_instituicao', (Sender as TTreeView).GetNodeAt(X, Y).Text, [loCaseInsensitive]);
   glogal_cd_instituicao := Self.qConveniados.FieldByName('cd_instituicao').AsString;
//   glogal_cd_instituicao := objStringList.Strings[ objStringList.IndexOfObject( (Sender as TTreeView).GetNodeAt( x, y ) ) ];
end;

end.

