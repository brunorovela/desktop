unit uTableFields;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, ComCtrls, ZAbstractRODataset, ZAbstractDataset,
  UZDataset;

type
  TItemProvas = class(TObject)
   private
      ABimestre, ATurma, ADisciplina, ANota : string;

    function getBimestre(): string;
    procedure setBimestre(sValor: string);
    function getTurma(): string;
    procedure setTurma(sValor: string);
    function getDisciplina(): string;
    procedure setDisciplina(sValor: string);
    function getNota(): string;
    procedure setNota(sValor: string);
      
   protected

   public
     constructor Create;
     destructor Destroy; override;

     property Bimestre: string read getBimestre write setBimestre;
     property Turma: string read getTurma write setTurma;
     property Disciplina: string read getDisciplina write setDisciplina;
     property Nota: string read getNota write setNota;
   published

   end;

  TfrmTableFields = class(TForm)
    Tree: TTreeView;
    qyProvas: TUMZQuery;
    procedure TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
    procedure limpaTree();
  public
    { Public declarations }
    procedure ConstroiTreeProvas(iAnoSemestre : Integer; sCodTurma, iCodDisciplina, iCodNotasIgnoradas : TStringList);
  end;

var
  frmTableFields: TfrmTableFields;

implementation

{$R *.dfm}

{ TfrmTableFields }

procedure TfrmTableFields.ConstroiTreeProvas(iAnoSemestre: Integer; sCodTurma,
  iCodDisciplina, iCodNotasIgnoradas: TStringList);
var
   i, i2, i3, etapa, disciplina, prova : Integer;
   aux, turma : String;
   oItem : TItemProvas;
begin
   limpaTree;      

   with qyProvas do
   begin
      Close;

      SQL.Clear;
      SQL.Add( ' SELECT	dp.*, d.descricao AS ds_disciplina, t.descricao AS ds_turma ' );
      SQL.Add( ' FROM diario_provas AS dp ' );
      SQL.Add( '     INNER JOIN turmas AS t ON (t.codigo = dp.turma AND t.anosemestre = dp.anosemestre) ' );
	   SQL.Add( '     INNER JOIN disciplinas AS d ON (d.codigo = dp.disciplina AND d.curso = t.curso) ' );
      SQL.Add( ' WHERE dp.anosemestre = :ANOSEMESTRE ' );

      // Turmas
      aux := '';
      for i := 0 to sCodTurma.Count - 1 do
         if ( i = 0 ) then
            aux := '''' + sCodTurma[i] + ''''
         else
            aux := aux + ', ''' + sCodTurma[i] + '''';

      if sCodTurma.Count > 0 then      
         SQL.Add( ' AND dp.turma IN ( ' + aux + ' ) ' );
      // Turmas

      // Disciplina
      aux := '';
      for i := 0 to iCodDisciplina.Count - 1 do
         if ( i = 0 ) then
            aux := iCodDisciplina[i]
         else
            aux := aux + ', ' + iCodDisciplina[i];

      if iCodDisciplina.Count > 0 then
         SQL.Add( ' AND dp.disciplina IN ( ' + aux + ' ) ' );
      // Disciplina

      // Notas Ignoradas
      aux := '';
      for i := 0 to iCodNotasIgnoradas.Count - 1 do
         if ( i = 0 ) then
            aux := iCodNotasIgnoradas[i]
         else
            aux := aux + ', ' + iCodNotasIgnoradas[i];

      if iCodNotasIgnoradas.Count > 0 then
         SQL.Add( ' AND dp.cd_prova NOT IN ( ' + aux + ' ) ' );
      // Notas Ignoradas
      

      SQL.Add( ' ORDER BY dp.bimestre, dp.turma, dp.disciplina, dp.nro_nota ' );

      ParamByName( 'ANOSEMESTRE' ).AsInteger := iAnoSemestre;

      Open;

      First;
      etapa := -1;

      while not Eof do
      begin
         if ( etapa <> FieldByName('bimestre').AsInteger ) then
         begin
            etapa := FieldByName('bimestre').AsInteger;

            oItem := TItemProvas.Create;
            oItem.Bimestre := IntToStr( etapa );

            Tree.Items.AddObject( Tree.TopItem, 'Etapa: ' + IntToStr( etapa ), oItem );
            i := Tree.Items.Count-1;
            disciplina := -1;
            turma := '';
            prova := -999;
         end;

         if ( turma <> FieldByName('turma').AsString ) then
         begin
            turma := FieldByName('turma').AsString;

            oItem := TItemProvas.Create;
            oItem.Bimestre := IntToStr( etapa );
            oItem.Turma := turma;

            Tree.Items.AddChildObject( Tree.Items[i], 'Turma: ' + FieldByName('ds_turma').AsString, oItem );
            i2 := Tree.Items.Item[i].Count-1;
            disciplina := -1;
         end;

         if ( disciplina <> FieldByName('disciplina').AsInteger ) then
         begin
            disciplina := FieldByName('disciplina').AsInteger;

            oItem := TItemProvas.Create;
            oItem.Bimestre := IntToStr( etapa );
            oItem.Turma := turma;
            oItem.Disciplina := IntToStr( disciplina );

            Tree.Items.AddChildObject( Tree.Items[i].Item[i2], 'Disciplina: ' + FieldByName('ds_disciplina').AsString, oItem );
            i3 := Tree.Items.Item[i].Item[i2].Count-1;
            prova := -999;
         end;

         if ( prova <> FieldByName('nro_nota').AsInteger ) then
         begin
            prova := FieldByName('nro_nota').AsInteger;

            oItem := TItemProvas.Create;
            oItem.Bimestre := IntToStr( etapa );
            oItem.Turma := turma;
            oItem.Disciplina := IntToStr( disciplina );
            oItem.Nota := IntToStr( prova );

            Tree.Items.AddChildObject( Tree.Items[i].Item[i2].Item[i3], 'Prova: ' + FieldByName('assunto').AsString, oItem );
         end;

         Next;
      end;

   end;
   
end;

procedure TfrmTableFields.limpaTree;
begin
   Tree.Items.Clear();
end;

procedure TfrmTableFields.TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
   Tree.BeginDrag(True);
end;

{ TItemProvas }

constructor TItemProvas.Create;
begin
   ABimestre := '';
   ATurma := '';
   ADisciplina := '';
   ANota := '';
end;

destructor TItemProvas.Destroy;
begin

  inherited;
end;

function TItemProvas.getBimestre: string;
begin
   Result := Self.ABimestre;
end;

function TItemProvas.getDisciplina: string;
begin
   Result := Self.ADisciplina;
end;

function TItemProvas.getNota: string;
begin
   Result := Self.ANota;
end;

function TItemProvas.getTurma: string;
begin
   Result := Self.ATurma;
end;

procedure TItemProvas.setBimestre(sValor: string);
begin
   Self.ABimestre := sValor;
end;

procedure TItemProvas.setDisciplina(sValor: string);
begin
   Self.ADisciplina := sValor;
end;

procedure TItemProvas.setNota(sValor: string);
begin
   Self.ANota := sValor;
end;

procedure TItemProvas.setTurma(sValor: string);
begin
   Self.ATurma := sValor;
end;

end.
