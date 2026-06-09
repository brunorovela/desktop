unit uListaCampos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, ZAbstractRODataset, ZDataset, uClassesUteis,
  ZAbstractDataset, UZDataset;

type
  TfListaCampos = class(TForm)
    twListaCampos: TTreeView;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    pnTitulo: TPanel;
    qyListaCampos: TUMZQuery;
    procedure FormShow(Sender: TObject);
    procedure twListaCamposDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    slObjetos: TStringList;
    { Private declarations }
  public
    { Public declarations }
    procedure ListaCampos(sConsulta: string);
    function getItem(iIndex: Integer): TItem;

    function ListaCamposModal(sConsulta: string): TItem;
  end;

var
  fListaCampos: TfListaCampos;

implementation

{$R *.dfm}

uses
   uDM;

{ TfListaCampos }

procedure TfListaCampos.ListaCampos(sConsulta: string);
var
   sTabela: string;
   node, node1: TTreeNode;
   Item: TItem;
   i: Integer;
begin
   Self.Caption := 'Clique e Arraste o campo..';
   with qyListaCampos do begin
      Close();
      ParamByName('nm_consulta').AsString := sConsulta;
      Open();

      if not IsEmpty then begin
         sTabela := '';
         i := 0;
         node := nil;
         slObjetos.Clear();
         twListaCampos.Items.Clear();
         while not Eof do begin
            if (sTabela <> FieldByName('nm_tabela').AsString) then begin
               Item := TItem.Create();
               Item.SetNome(FieldByName('nm_tabela').AsString);
               Item.setValor('');
               node := twListaCampos.Items.AddChild(nil, 'Descrição da tabela ' + FieldByName('nm_tabela').AsString);
               slObjetos.AddObject(IntTostr(node.AbsoluteIndex), Item);
               sTabela := FieldByName('nm_tabela').AsString;
            end;
            Item := TItem.Create();
            Item.SetNome(FieldByName('nm_tabela').AsString);
            Item.setValor(FieldByName('nm_campo').AsString);
            node1 := twListaCampos.Items.AddChild(node, FieldByName('ds_campo').AsString);
            slObjetos.AddObject(IntTostr(node1.AbsoluteIndex), Item);
            Next();
          end;
          twListaCampos.AutoExpand := True;
      end;
      Close();
   end;
end;

function TfListaCampos.getItem(iIndex: Integer): TItem;
var
   i: Integer;
begin
   i := slObjetos.IndexOf(IntToStr(iIndex));
   if (i <> -1) then begin
      Result := TItem(slObjetos.Objects[i]);
   end
   else begin
      Result := nil;
   end;
end;

procedure TfListaCampos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfListaCampos.FormCreate(Sender: TObject);
begin
   slObjetos := TStringList.Create();
end;

procedure TfListaCampos.FormDestroy(Sender: TObject);
begin
   FreeAndNil(slObjetos);
end;

function TfListaCampos.ListaCamposModal(sConsulta: string): TItem;
begin
   ListaCampos(sConsulta);
   Self.Caption := 'Dê dois cliques no campo...';
   if (Self.ShowModal() = mrOk) then begin
      Result := getItem(twListaCampos.Selected.AbsoluteIndex);
   end
   else begin
      Result := nil;
   end;
end;

procedure TfListaCampos.twListaCamposDblClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal();
end;

procedure TfListaCampos.FormShow(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

end.
