unit uCadConsultas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, dblookup, CheckLst,
  UZDataset;

type
  TfCadConsultas = class(TForm)
    pnTitulo: TPanel;
    pnConteudo: TPanel;
    Bevel3: TBevel;
    Panel1: TPanel;
    Panel5: TPanel;
    pgTurmas: TPageControl;
    tsSQL: TTabSheet;
    Panel7: TPanel;
    Label3: TLabel;
    Panel6: TPanel;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel3: TPanel;
    grd: TDBGrid;
    ilAcoes: TImageList;
    toolPessoa: TToolBar;
    tlbSep1: TToolButton;
    dbNav: TDBNavigator;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    tlbSep3: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    tlbSep4: TToolButton;
    btnFechar: TToolButton;
    tlbSep5: TToolButton;
    bvEspaco: TBevel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    qyCadastro: TUMZQuery;
    dsCadastro: TDataSource;
    dsCategorias: TDataSource;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dbCategoria: TDBLookupComboBox;
    Label6: TLabel;
    qyRCategorias: TUMZQuery;
    qyRCategoriasds_valor: TStringField;
    qyTabelas: TUMZQuery;
    qyCadastronm_consulta: TStringField;
    qyCadastrods_consulta: TStringField;
    qyCadastrome_sql: TBlobField;
    qyCadastrosn_ativo: TSmallintField;
    qyRAux: TUMZQuery;
    qyCadastrods_categoria: TStringField;
    tsAjuda: TTabSheet;
    Memo1: TMemo;
    qyRTabelas: TUMZQuery;
    tsTabelas: TTabSheet;
    Panel10: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    dbgTabela: TDBGrid;
    DBNavigator1: TDBNavigator;
    qyTabelasnm_consulta: TStringField;
    qyTabelasnm_tabela: TStringField;
    qyTabelasnm_tabela_real: TStringField;
    dsTabelas: TDataSource;
    qyRTabelasnm_tabela: TStringField;
    qyTabelastabelareal: TStringField;
    tsCampos: TTabSheet;
    dbgCampos: TDBGrid;
    Panel8: TPanel;
    Label5: TLabel;
    Panel9: TPanel;
    DBNavigator2: TDBNavigator;
    qyCampos: TUMZQuery;
    dsCampos: TDataSource;
    qyCamposnm_consulta: TStringField;
    qyCamposnm_tabela: TStringField;
    qyCamposnm_campo: TStringField;
    qyCamposds_valor: TStringField;
    qyCampossn_sql: TSmallintField;
    qyCamposme_sql: TMemoField;
    qyRTabelasCampos: TUMZQuery;
    StringField1: TStringField;
    qyCamposnometabela: TStringField;
    qyCadastrocd_categoria: TIntegerField;
    qyRCategoriascd_situacao: TIntegerField;
    procedure qyCadastroNewRecord(DataSet: TDataSet);
    procedure qyCamposNewRecord(DataSet: TDataSet);
    procedure qyCamposBeforePost(DataSet: TDataSet);
    procedure dbgCamposEditButtonClick(Sender: TObject);
    procedure qyTabelasnm_tabela_realChange(Sender: TField);
    procedure qyTabelasNewRecord(DataSet: TDataSet);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qyCadastroBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure qyCadastroAfterOpen(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure grdTitleClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    bkCadastro: Pointer;
    slOrdem: TStringList;
    iOrdemDefault: Integer;
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados();
  end;

var
  fCadConsultas: TfCadConsultas;

implementation

uses uMain, uDM, uClassesUteis, uDefineSQL;

{$R *.DFM}

procedure TfCadConsultas.btnInserirClick(Sender: TObject);
begin
   //verifica acesso
   qyCadastro.Last();
   qyCadastro.Insert();
//   qyCadastrosn_ativo.AsInteger := 1;
   //pgTurmas.ActivePageIndex :=  0;
end;

procedure TfCadConsultas.btnAlterarClick(Sender: TObject);
begin
   //verifica acesso
   if qyCadastro.RecordCount <= 0 then begin
      Mensagem('Nenhum registro a ser editado!');
      Exit;
   end;
   qyCadastro.Edit();
   //pgTurmas.ActivePageIndex := 0;
end;

procedure TfCadConsultas.btnExcluirClick(Sender: TObject);
var
   sMsg: string;
begin
   //verifica acesso
   sMsg := 'CUIDADO!!!!' + #13 + #13;
   sMsg := sMsg + 'Apagando esta consulta você estará apagando também todos os ';
   sMsg := sMsg + 'dados relativos à ele!! ' + #13 + #13;
   sMsg := sMsg + 'TEM CERTEZA QUE DESEJA APAGAR?? ' + #13 + #13;

   if (Mensagem(sMsg, 'Atenção!', MB_ICONQUESTION + MB_OKCANCEL, Self.Handle) = mrOk) then begin
      DM.apagaRegistros('expo_consulta_tabelas', ' nm_consulta = "' + qyCadastronm_consulta.AsString + '"');
      qyCadastro.Delete();
   end;
   bkCadastro := qyCadastro.GetBookmark();
end;

procedure TfCadConsultas.FiltraDados();
var
   z,i: Integer;
begin
   with qyCadastro do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add('SELECT * FROM expo_consultas ');
      SQL.Add(' WHERE 1 = 1');
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

procedure TfCadConsultas.grdTitleClick(Column: TColumn);
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

procedure TfCadConsultas.FormCreate(Sender: TObject);
begin
    slOrdem := TStringList.Create();
    slOrdem.Clear();
    iOrdemDefault := 0;
    slOrdem.Add('nm_consulta=NONE');
    slOrdem.Add('ds_consulta=NONE');
    slOrdem.Add('cd_categoria=NONE');
    slOrdem.Add('sn_ativo=NONE');
end;

procedure TfCadConsultas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (qyCadastro.State in [dsInsert, dsEdit]) then begin
      Mensagem('Registro em Edição!! Impossível Fechar!!');
      CanClose := False;
   end
   else begin
      Canclose := True;
   end;
end;

procedure TfCadConsultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfCadConsultas.dsCadastroStateChange(Sender: TObject);
var
   bBrowse: Boolean;
begin
   bBrowse :=  not (qyCadastro.State in [dsInsert, dsEdit]);
   btnInserir.Enabled := bBrowse;
   btnAlterar.Enabled := bBrowse;
   btnExcluir.Enabled := bBrowse;
   btnSalvar.Enabled := not bBrowse;
   btnCancelar.Enabled := not bBrowse;
   btnFechar.Enabled := bBrowse;
   dbCategoria.Enabled := not bBrowse;
   dbNav.Enabled := bBrowse;
   grd.Enabled := bBrowse;
   DBEdit1.Enabled := (qyCadastro.State in [dsInsert]);
   if qyCadastro.IsEmpty then begin
      dbgTabela.Enabled := False;
      dbgCampos.Enabled := False;
   end
   else begin
      dbgTabela.Enabled := bBrowse;
      dbgCampos.Enabled := bBrowse;
   end;

end;

procedure TfCadConsultas.btnCancelarClick(Sender: TObject);
begin
   bkCadastro := qyCadastro.GetBookmark();
   qyCadastro.Cancel();
end;

procedure TfCadConsultas.qyCadastroAfterOpen(DataSet: TDataSet);
begin
   if not (bkCadastro = nil) then begin
      if qyCadastro.BookmarkValid(bkCadastro) then begin
         qyCadastro.GotoBookmark(bkCadastro);
         bkCadastro := nil;
      end;
   end;
   qyRCategorias.Close();
   qyRCategorias.Open();
   qyTabelas.Close();
   qyTabelas.Open();
   qyRTabelas.Close();
   qyRTabelas.Open();
   qyRTabelasCampos.Close();
   qyRTabelasCampos.Open();
   qyCampos.Close();
   qyCampos.Open();
end;

procedure TfCadConsultas.btnSalvarClick(Sender: TObject);
begin
   bkCadastro := qyCadastro.GetBookmark();
   qyCadastro.Post();
   qyCadastro.Close();
   qyCadastro.Open();
end;

procedure TfCadConsultas.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfCadConsultas.FormShow(Sender: TObject);
begin
   FiltraDados();
   pgTurmas.ActivePageIndex := 0;
end;

procedure TfCadConsultas.qyCadastroBeforePost(DataSet: TDataSet);
var
   iConta: Integer;
begin
   if (qyCadastro.State in [dsInsert]) then begin
      if (Trim(qyCadastronm_consulta.AsString) = '') then begin
         Mensagem('O Campo nome deve ser preenchido e deve ser único!!');
         Abort;
         Exit;
      end;
      //faz as verificacoes
      with qyRAux do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Text := 'SELECT COUNT(*) as conta FROM expo_consultas WHERE nm_consulta = "' + Trim(qyCadastronm_consulta.AsString) + '"';
         Open();
         iConta := 0;
         if not IsEmpty then begin
            iConta := FieldByName('conta').AsInteger;
         end;
      end;
      if (iConta > 0) then begin
         Mensagem('O Campo nome deve ser único!!');
         Abort;
      end;
   end;
end;

procedure TfCadConsultas.qyCadastroNewRecord(DataSet: TDataSet);
begin
   qyCadastrosn_ativo.AsInteger := 1;
end;

procedure TfCadConsultas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         btnInserirClick( nil );
      VK_F3 :
         btnAlterarClick( nil );
      VK_F5 :
         btnSalvarClick( nil );
      VK_F4 :
         btnExcluirClick( nil );
      VK_F6 :
         btnCancelarClick( nil );
      VK_F12 :
         btnFecharClick( nil );
   end;
end;

procedure TfCadConsultas.FormDestroy(Sender: TObject);
begin
   FreeAndNil(slOrdem);
end;

procedure TfCadConsultas.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9', 'A'..'z', '-', '.', '_']) then begin
      Key := #0;
   end;
end;

procedure TfCadConsultas.qyTabelasNewRecord(DataSet: TDataSet);
begin
   //qyTabelasnm_tabela_real.AsString := qyCadastronm_consulta.AsString;
   qyTabelasnm_consulta.AsString := qyCadastronm_consulta.AsString;
end;

procedure TfCadConsultas.qyTabelasnm_tabela_realChange(Sender: TField);
begin
   //nome vazio
   qyTabelasnm_tabela.AsString := qyTabelasnm_tabela_real.AsString;
end;

procedure TfCadConsultas.dbgCamposEditButtonClick(Sender: TObject);
var
   fd: TfDefineSQL;
begin
   if not (qyCampos.State in [dsInsert, dsEdit]) then begin
      qyCampos.Edit();
   end;

   fd := TfDefineSQL.NovaJanela(qyCamposme_sql.AsString);
   if (fd.ShowJanela() = mrOk) then begin
      qyCamposme_sql.AsString := fd.getConteudo();
      if (Trim(qyCamposme_sql.AsString) = '') then begin
         qyCampossn_sql.AsInteger := 1;
      end
      else begin
         qyCampossn_sql.AsInteger := 0;
      end;
   end;
   FreeAndNil(fd);
end;

procedure TfCadConsultas.qyCamposBeforePost(DataSet: TDataSet);
var
   iConta: Integer;
begin

   if (Trim(qyCamposnm_tabela.AsString) = '') then begin
      Mensagem('a Tabela deve ser definida!!');
      Abort;
      Exit;
   end;
   if (Trim(qyCamposnm_campo.AsString) = '') then begin
      Mensagem('O Campo deve ser definido!!');
      Abort;
      Exit;
   end;
   if (qyCampossn_sql.AsInteger = 1) then begin
      if (Trim(qyCamposme_sql.AsString) = '') then begin
         Mensagem('O SQL deve ser definido!!');
         Abort;
         Exit;
      end;
   end;

   //faz as verificacoes
   with qyRAux do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add(
         'SELECT                          '+
         '	COUNT(*) as conta             '+
         'FROM                            '+
         '	expo_campos ecc               '+
         'WHERE                           '+
         '	ecc.nm_tabela = :nm_tabela       '+
         '	AND ecc.nm_campo = :nm_campo     '
      );
      Params.ParamByName('nm_tabela').AsString := Trim(qyCamposnm_tabela.AsString);
      Params.ParamByName('nm_campo').AsString := Trim(qyCamposnm_campo.AsString);
      Open();
      iConta := 0;
      if not IsEmpty then begin
         iConta := FieldByName('conta').AsInteger;
      end;
      Close();
      if (iConta = 0) then begin
         Params.Clear();
         SQL.Clear();
         SQL.Add(
            'SELECT                          '+
            '	COUNT(*) as conta             '+
            'FROM                            '+
            '	expo_consulta_campos ecc      '+
            'WHERE                           '+
            '	ecc.nm_consulta =  :nm_consulta  '+
            '	AND ecc.nm_tabela = :nm_tabela   '+
            '	AND ecc.nm_campo = :nm_campo     '
         );
         Params.ParamByName('nm_consulta').AsString := Trim(qyCadastronm_consulta.AsString);
         Params.ParamByName('nm_tabela').AsString := Trim(qyCamposnm_tabela.AsString);
         Params.ParamByName('nm_campo').AsString := Trim(qyCamposnm_campo.AsString);
         Open();
         iConta := 0;
         if not IsEmpty then begin
            iConta := FieldByName('conta').AsInteger;
         end;
      end;
   end;

   if qyCampos.State in [dsInsert] then begin
      if (iConta > 0) then begin
         Mensagem('O Campo tabela e nome deve ser único!!');
         Abort;
         Exit;
      end;
   end
   else if qyCampos.State in [dsEdit] then begin
      if (iConta > 1) then begin
         Mensagem('O Campo tabela e nome deve ser único!!');
         Abort;
         Exit;
      end;
   end;
end;

procedure TfCadConsultas.qyCamposNewRecord(DataSet: TDataSet);
begin
   qyCamposnm_consulta.AsString := qyCadastronm_consulta.AsString;
   qyCampossn_sql.AsInteger := 0;
end;

end.
