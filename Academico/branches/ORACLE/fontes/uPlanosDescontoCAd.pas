unit uPlanosDescontoCAd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, UMAjuda;

type
  TfrmPlanosDescontoCad = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    Bevel1: TBevel;
    tblPlanos: TUMZQuery;
    tblPlanosCodigo: TIntegerField;
    tblPlanosPercentualDesconto: TFloatField;
    tblPlanosValorDesconto: TFloatField;
    dtcPlanosDesconto: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    qryMax: TUMZQuery;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    DBNavigator1: TDBNavigator;
    pmQtd: TPopupMenu;
    qyAcoes: TUMZQuery;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    tblPlanosAcaoMovimento: TStringField;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    qyTipos: TUMZQuery;
    dtcTipos: TDataSource;
    qyTiposcd_situacao: TIntegerField;
    qyTiposds_valor: TStringField;
    qyTiposds_sigla: TStringField;
    tblPlanossn_condicional: TSmallintField;
    tblPlanoscd_tipo_desconto: TSmallintField;
    qyAcoescd_acao: TLargeintField;
    tblPlanoscd_acao_movimento: TLargeintField;
    qryMaxULTIMO: TLargeintField;
    tblPlanosdescricaoplano: TStringField;
    lblOrientacao: TLabel;
    UMAjuda2: TUMAjuda;
    procedure tblPlanosAfterPost(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblPlanosNewRecord(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function NovoCodigoPlano : Longint;
    procedure FormDestroy(Sender: TObject);
    procedure dtcPlanosDescontoStateChange(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  strict private
    function descontoCondicionalValido(const alerta: Boolean = True): Boolean;
    function acaoBaixaSelecionada(): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanosDescontoCad: TfrmPlanosDescontoCad;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmPlanosDescontoCad.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanosDescontoCad.btnNovoClick(Sender: TObject);
begin
  tblPlanos.Insert;
  grd.SetFocus;
end;

procedure TfrmPlanosDescontoCad.btnAlterarClick(Sender: TObject);
begin
  dbeDescricao.SetFocus;
  tblPlanos.Edit;
end;

procedure TfrmPlanosDescontoCad.btnSalvarClick(Sender: TObject);
var
   posicaoAtual: Pointer;
begin

   if not acaoBaixaSelecionada() then
   begin
      DBLookupComboBox1.SetFocus;
      Exit;
   end;

   if not descontoCondicionalValido() then
   begin
      DBEdit3.SetFocus;
      Exit;
   end;

   tblPlanos.Post;

   // Salva a posição atual do registro
   posicaoAtual := tblPlanos.GetBookmark;
   // Recarrega os valores salvos na grid
   tblPlanos.close;
   tblPlanos.Open;

   // Restaura a posição do registro que estava antes de salvar
   if tblPlanos.BookmarkValid(posicaoAtual) then
   begin
      tblPlanos.GotoBookmark(posicaoAtual);
   end;
end;

procedure TfrmPlanosDescontoCad.btnCancelarClick(Sender: TObject);
begin
  tblPlanos.Cancel;
end;

procedure TfrmPlanosDescontoCad.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    tblPlanos.Delete;

end;

procedure TfrmPlanosDescontoCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure TfrmPlanosDescontoCad.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  qyAcoes.Close();
  qyAcoes.Open();

  tblPlanos.Close();
  tblPlanos.Open();

  qyTipos.Close();
  qyTipos.Open();

end;

procedure TfrmPlanosDescontoCad.grdTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      // Os campos são separados por ;
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
 
      // Espaço é o separador entre o nome do campo e o seu valor (Asc ou Desc)
      SortedFields.NameValueSeparator := ' ';
 
      // qrySample é o componente TZQuery/TZReadOnlyQuery ligado à grid
      SortedFields.DelimitedText := tblPlanos.IndexFieldNames;
 
      // Percorre todos os campos sobre os quais foi aplicado ordenação
      for I := 0 to SortedFields.Count - 1 do
 
         // Verifica se o campo é o mesmo selecionado pelo usuário
         // Caso sim, significa que o campo já possui uma ordenação
 
         if SortedFields.Names[I] = Column.FieldName then
         begin
 
            // Verifica se a ordenação é Asc ou Desc
 
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               // Se a ordenação é Asc, então muda para Desc
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               // Se a ordenação é Desc, então remove a ordenação do campo
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
 
            // Sinaliza que o campo foi encontrado e quebra o loop
 
            Found := True;
            Break;
         end;
 
      // Se o campo não foi encontrado, significa que
      // ele não possui ordenação
      // Vamos aplicar a ordenação ascendente
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      // Configura a propriedade da query
      tblPlanos.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfrmPlanosDescontoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblPlanos.Close();
  qyTipos.Close();
  Action := caFree;
end;

procedure TfrmPlanosDescontoCad.tblPlanosAfterPost(DataSet: TDataSet);
var
   sDescricao: String;
begin
   // Posiciona no registro incluído
   sDescricao := tblPlanosdescricaoplano.AsString;
   tblPlanos.Refresh;
   tblPlanos.Locate('descricaoplano',sDescricao,[]);
end;

procedure TfrmPlanosDescontoCad.tblPlanosNewRecord(DataSet: TDataSet);
begin
  qryMax.Close;
  qryMax.Open;
  tblPlanosCodigo.AsInteger := qryMax.Fields[0].AsInteger + 1;
  qryMax.Close;
end;

procedure TfrmPlanosDescontoCad.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanosDescontoCad.btnInserirClick(Sender: TObject);
begin
  dbeDescricao.SetFocus;
  tblPlanos.Append;
end;

procedure TfrmPlanosDescontoCad.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key in ['.'] then
  begin
    Key := ',';
  end;

  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmPlanosDescontoCad.dbeDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

function TfrmPlanosDescontoCad.NovoCodigoPlano : Longint;
begin
  qryMax.Close;
  qryMax.Open;
  Result := qryMax.Fields[0].AsInteger + 1;
  qryMax.Close;
end;

procedure TfrmPlanosDescontoCad.FormDestroy(Sender: TObject);
begin
  frmPlanosDescontoCad := nil;
end;

function TfrmPlanosDescontoCad.descontoCondicionalValido(const alerta: Boolean): Boolean;
var
   vl_percentual : Double;
const
   MSG_DESCONTO_INVALIDO =
      'Quando a opção "Desconto Condicional" está habilitada, '+
      'o valor "% de Desc." não pode ser de 100%.';
begin
   vl_percentual := StrToFloatDef(trim(StringReplace(DBEdit3.Text, '%', '', [rfReplaceAll])), 0);

   Result := (vl_percentual < 100) OR not(DBCheckBox1.Checked);

   if not(Result) AND alerta then
      Mensagem( MSG_DESCONTO_INVALIDO, '', MB_ICONEXCLAMATION + MB_OK, Handle );
end;

function TfrmPlanosDescontoCad.acaoBaixaSelecionada(): Boolean;
const
   MSG_ACAO_BAIXA = 'A seleção de uma ação de baixa é obrigatória.';
begin
   Result := True;

   if tblPlanoscd_acao_movimento.IsNull then
   begin
      Result := False;
      Mensagem( MSG_ACAO_BAIXA, '', MB_ICONEXCLAMATION + MB_OK, Handle );
   end;
end;

procedure TfrmPlanosDescontoCad.dtcPlanosDescontoStateChange(
  Sender: TObject);
begin

  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];

end;

procedure TfrmPlanosDescontoCad.DBEdit1Enter(Sender: TObject);
begin
   PrincipalForm.MostraHint2(Sender);
end;

procedure TfrmPlanosDescontoCad.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblPlanos, pmQtd);

end;

end.

