unit uCadCampos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, uMGerais,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, dblookup, UZDataset, uUsuario;

type
  TfCadCampos = class(TForm)
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
    dgListaUsuarios: TDBGrid;
    bvEspaco: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnFiltro: TBitBtn;
    cbTabelas: TComboBox;
    qyCadastronm_tabela: TStringField;
    qyCadastronm_campo: TStringField;
    qyCadastrods_campo: TStringField;
    qyCadastrods_tipo: TStringField;
    qyCadastrods_consulta: TStringField;
    qyCadastrosn_ativo: TSmallintField;
    qyCadastrosn_apagado: TSmallintField;
    qyCadastrosn_calculado: TSmallintField;
    procedure qyCadastroBeforeEdit(DataSet: TDataSet);
    procedure qyCadastroNewRecord(DataSet: TDataSet);
    procedure dgListaUsuariosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qyCadastroBeforePost(DataSet: TDataSet);
    procedure cbTabelasChange(Sender: TObject);
    procedure qyCadastroBeforeDelete(DataSet: TDataSet);
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
    //procedure AtualizaTabelas();
    procedure CarregaTabelas();

  end;

var
  fCadCampos: TfCadCampos;

implementation

{$R *.DFM}
uses
   uDM;

procedure TfCadCampos.FiltraDados;
var
   z,i: Integer;
begin
   if (Trim(cbTabelas.Text) <> '') then begin
     DM.AtualizaCampos(cbTabelas.Text);
   end;

   with qyCadastro do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add('SELECT * FROM expo_campos ');
      SQL.Add(' WHERE 1 = 1');
      SQL.Add(' AND nm_tabela = "' + Trim(cbTabelas.Text) + '" ');
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

procedure TfCadCampos.FormCreate(Sender: TObject);
begin
    slOrdem := TStringList.Create();
    slOrdem.Clear();
    iOrdemDefault := 1;
    slOrdem.Add('nm_tabela=NONE');
    slOrdem.Add('nm_campo=NONE');
    slOrdem.Add('ds_campo=NONE');
    slOrdem.Add('sn_ativo=NONE');
    CarregaTabelas();
end;

procedure TfCadCampos.FormShow(Sender: TObject);
begin
   FiltraDados();
end;

procedure TfCadCampos.dgListaUsuariosTitleClick(Column: TColumn);
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

procedure TfCadCampos.FormDestroy(Sender: TObject);
begin
   FreeAndNil(slOrdem);
end;

procedure TfCadCampos.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfCadCampos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfCadCampos.btnFiltroClick(Sender: TObject);
begin
   FiltraDados();
end;

procedure TfCadCampos.edFiltroTabKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      FiltraDados();
   end;
end;

procedure TfCadCampos.CarregaTabelas;
begin
   with qyRAux do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(' SELECT nm_tabela FROM expo_tabelas ');
      SQL.Add(' WHERE sn_apagada = 0 AND sn_ativo = 1 ORDER BY nm_tabela ');
      Open();

      cbTabelas.Clear();
      cbTabelas.AddItem('', nil);
      while not Eof do begin
         cbTabelas.AddItem(FieldByName('nm_tabela').AsString, nil);
         Next();
      end;
      Close();
   end;
end;

procedure TfCadCampos.qyCadastroBeforeDelete(DataSet: TDataSet);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12002, npExcluir, True)) then begin
      Abort();
   end;

   if (qyCadastrosn_calculado.AsInteger <> 1) then begin
      Abort();
   end;
end;

procedure TfCadCampos.qyCadastroBeforeEdit(DataSet: TDataSet);
begin
   if (qyCadastrosn_calculado.AsInteger = 0) then begin
      Abort;
   end;
end;

procedure TfCadCampos.cbTabelasChange(Sender: TObject);
begin
   FiltraDados();
end;

procedure TfCadCampos.qyCadastroBeforePost(DataSet: TDataSet);
begin
   //verifica acesso
   if not (DM.GetUsuarioLogado.TemPermissao(12002, npAlterar, True)) then begin
      Abort();
   end;
   if ((qyCadastrosn_calculado.AsInteger <> 1)
      or (Trim(qyCadastrods_consulta.AsString) = '')) then begin
         Abort();
   end;

end;

procedure TfCadCampos.dgListaUsuariosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if qyCadastrosn_apagado.AsInteger = 1 then begin
        dgListaUsuarios.Canvas.Brush.Color:= clRed;
        dgListaUsuarios.Canvas.Font.Color:= clWhite;
        dgListaUsuarios.Canvas.FillRect(Rect);
        dgListaUsuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end
   else if ((Column.Field.FieldName = 'nm_tabela') or (Column.Field.FieldName = 'nm_campo')) then begin
      if (qyCadastrosn_calculado.AsInteger = 1) then begin
         dgListaUsuarios.Canvas.Brush.Color:= clMenuBar;
         dgListaUsuarios.Canvas.Font.Color:= clWindowText;
         dgListaUsuarios.Canvas.FillRect(Rect);
         dgListaUsuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
end;

procedure TfCadCampos.qyCadastroNewRecord(DataSet: TDataSet);
begin
   qyCadastrosn_calculado.AsInteger := 1;
   qyCadastrosn_apagado.AsInteger := 0;
   qyCadastronm_tabela.AsString := cbTabelas.Text;
end;

end.
