unit uCadTabelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, uMGerais,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, dblookup, UZDataset;

type
  TfCadTabelas = class(TForm)
    pnTitulo: TPanel;
    pnConteudo: TPanel;
    Panel2: TPanel;
    ilAcoes: TImageList;
    toolPessoa: TToolBar;
    tlbSep1: TToolButton;
    dbNav: TDBNavigator;
    btnFechar: TToolButton;
    tlbSep5: TToolButton;
    qyCadastro: TUMZQuery;
    dsCadUsuarios: TDataSource;
    qyAux: TUMZQuery;
    qyRAux: TUMZQuery;
    pnFiltro: TPanel;
    Label13: TLabel;
    Label20: TLabel;
    dgListaUsuarios: TDBGrid;
    bvEspaco: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnFiltro: TBitBtn;
    edFiltroDesc: TEdit;
    edFiltroTab: TEdit;
    qyCadastronm_tabela: TStringField;
    qyCadastrods_descricao: TStringField;
    qyCadastrosn_ativo: TSmallintField;
    qyCadastrosn_apagada: TSmallintField;
    procedure edFiltroTabKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dgListaUsuariosTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    slOrdem: TStringList;
    iOrdemDefault: Integer;
    { Private declarations }
  public
    procedure FiltraDados();

  end;

var
  fCadTabelas: TfCadTabelas;

implementation

{$R *.DFM}
uses
   uDM;


procedure TfCadTabelas.FiltraDados;
var
   z,i: Integer;
begin
   with qyCadastro do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add('SELECT * FROM expo_tabelas ');
      SQL.Add(' WHERE 1 = 1');
      if (Trim(edFiltroTab.Text) <> '') then begin
         SQL.Add(' AND nm_tabela LIKE "' + edFiltroTab.Text + '" ');
      end;
      if (Trim(edFiltroDesc.Text) <> '') then begin
         SQL.Add(' AND ds_descricao LIKE "' + edFiltroDesc.Text + '" ');
      end;
      SQL.Add(' ORDER BY ');

      z := slOrdem.Count-1;
      for i := 0 to z do begin
         if not (slOrdem.ValueFromIndex[i] = 'NONE') then begin
            SQL.Add(slOrdem.Names[i] + ' ' + slOrdem.ValueFromIndex[i]);
            SQL.Add(', ');
         end;
      end;
      SQL.Add(slOrdem.Names[iOrdemDefault]);
      Open();
   end;
end;

procedure TfCadTabelas.FormCreate(Sender: TObject);
begin
    slOrdem := TStringList.Create();
    slOrdem.Clear();
    iOrdemDefault := 1;
    slOrdem.Add('cd_tabela=NONE');
    slOrdem.Add('nm_tabela=NONE');
    slOrdem.Add('ds_alias=NONE');
    slOrdem.Add('ds_descricao=NONE');
    slOrdem.Add('sn_ativo=NONE');
end;

procedure TfCadTabelas.FormShow(Sender: TObject);
begin

   DM.AtualizaTabelas();
   FiltraDados();
end;

procedure TfCadTabelas.dgListaUsuariosTitleClick(Column: TColumn);
var
   sCampo: string;
   i: Integer;
   sValor: string;
begin
   if qyCadastro.State in [dsEdit] then begin
      Exit;
   end;
   sCampo := Column.FieldName;
   i := slOrdem.IndexOfName(sCampo);


   if (i <> -1) then begin
      sValor := slOrdem.ValueFromIndex[i];
      if (sValor = 'NONE') then begin
         slOrdem.Values[sCampo] := 'ASC';
         Column.Title.Font.Color := clBlue;
         Column.Title.Font.Style := [fsBold];
      end
      else if (sValor = 'ASC') then begin
         slOrdem.Values[sCampo] := 'DESC';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end
      else if (sValor = 'DESC') then begin
         slOrdem.Values[sCampo] := 'NONE';
         Column.Title.Font.Color := clBlack;
         Column.Title.Font.Style := [];
      end;
   end;
   FiltraDados();
end;

procedure TfCadTabelas.FormDestroy(Sender: TObject);
begin
   FreeAndNil(slOrdem);
end;

procedure TfCadTabelas.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfCadTabelas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfCadTabelas.btnFiltroClick(Sender: TObject);
begin
   FiltraDados();
end;

procedure TfCadTabelas.edFiltroTabKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      FiltraDados();
   end;
end;

end.
