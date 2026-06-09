unit uTiposPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, uDM, StdCtrls, Mask, DBCtrls, UMComboBox, UMAjuda, ComCtrls,
  ToolWin, ImgList, uItemCombo, General;

type
  TfrmTiposPessoas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    pnTopo: TPanel;
    qryTiposPessoas: TUMZQuery;
    dsTiposPessoas: TDataSource;
    qryTiposPessoascd_parentesco_tipo: TIntegerField;
    qryTiposPessoasds_pessoa_desc: TStringField;
    qryTiposPessoasds_parente_desc: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    cbTipoPessoaVinculo: TUMComboBox;
    Label3: TLabel;
    UMAjuda1: TUMAjuda;
    ilBotoes: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    qryTiposPessoascd_parentesco_relac: TLargeintField;
    procedure FormDestroy(Sender: TObject);
    procedure dsTiposPessoasDataChange(Sender: TObject; Field: TField);
    procedure dsTiposPessoasStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    {Carrega todos os tipos de pessoas para poder víncular na comboBox} 
    procedure carregaTiposPessoa();

    function isTipoUsado(cdTipo: Integer): Boolean;
    function getIndexComboVinculo(cdTipo: Integer): Integer;
  public
    { Public declarations }
  end;

var
  frmTiposPessoas: TfrmTiposPessoas;

implementation

uses
   uUsuario;

{$R *.dfm}

{ TfrmTiposPessoas }

procedure TfrmTiposPessoas.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.CadastroTiposPessoas', npAlterar, True ) then
   begin
      Exit;
   end;

   if isTipoUsado(qryTiposPessoascd_parentesco_tipo.AsInteger) then
   begin
      Mensagem(
         'Este tipo de pessoa possui vínculos no sistema! Recomendamos que '+
         'mantenha este registro no sistema para que não existam inconformidades no uso deste recurso.',
         'Aviso',
         MB_ICONWARNING + MB_OK
      );

      Exit;
   end;

   qryTiposPessoas.Edit;
end;

procedure TfrmTiposPessoas.btnCancelarClick(Sender: TObject);
begin
   qryTiposPessoas.Cancel;
end;

procedure TfrmTiposPessoas.btnExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.CadastroTiposPessoas', npExcluir, True ) then
   begin
      Exit;
   end;

   if not(isTipoUsado(qryTiposPessoascd_parentesco_tipo.AsInteger)) then
   begin
      qryTiposPessoas.Delete;
      carregaTiposPessoa;
   end
   else
   begin
      Mensagem(
         'Este tipo de pessoa possui vínculos no sistema! Recomendamos que '+
         'mantenha este registro no sistema para que não existam inconformidades no uso deste recurso.',
         'Aviso',
         MB_ICONWARNING + MB_OK
      );
   end;
end;

procedure TfrmTiposPessoas.btnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmTiposPessoas.btnInserirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.CadastroTiposPessoas', npIncluir, True ) then
   begin
      Exit;
   end;

   cbTipoPessoaVinculo.ItemIndex := 0;

   qryTiposPessoas.Insert;
end;

procedure TfrmTiposPessoas.btnSalvarClick(Sender: TObject);
begin
   if (cbTipoPessoaVinculo.ItemIndex > 0) and
      (qryTiposPessoascd_parentesco_relac.AsString <> TItemCombo(cbTipoPessoaVinculo.Items.Objects[cbTipoPessoaVinculo.ItemIndex]).getCodigo) then
   begin
      qryTiposPessoasds_parente_desc.AsString :=
         TItemCombo(cbTipoPessoaVinculo.Items.Objects[cbTipoPessoaVinculo.ItemIndex]).getDescricao;

      qryTiposPessoascd_parentesco_relac.AsInteger :=
         StrToInt(TItemCombo(cbTipoPessoaVinculo.Items.Objects[cbTipoPessoaVinculo.ItemIndex]).getCodigo);
   end;

//   qryTiposPessoascd_parentesco_relac.AsInteger := 8;

   qryTiposPessoas.Post;
   carregaTiposPessoa;
end;

procedure TfrmTiposPessoas.carregaTiposPessoa;
const
   SQL_BUSCA_TIPOS_PESSOA =
      ' SELECT '+
      '     cd_parentesco_tipo, '+
      '     ds_pessoa_desc '+
      '  FROM '+
      '     pessoas_parentesco_tipos ';
var
   qryTiposPessoaVincula: TUMZReadOnlyQuery;
begin
   cbTipoPessoaVinculo.Items.Clear;

   DM.CriarConsulta(qryTiposPessoaVincula);

   qryTiposPessoaVincula.SQL.Text := SQL_BUSCA_TIPOS_PESSOA;
   qryTiposPessoaVincula.Open;

   cbTipoPessoaVinculo.AddItem(
      'Selecione',
      TItemCombo.Create(
         '0',
         'Selecione'
      )
   );

   while not qryTiposPessoaVincula.Eof do
   begin
      cbTipoPessoaVinculo.AddItem(
         qryTiposPessoaVincula.FieldByName('ds_pessoa_desc').AsString,
         TItemCombo.Create(
            qryTiposPessoaVincula.FieldByName('cd_parentesco_tipo').AsString,
            qryTiposPessoaVincula.FieldByName('ds_pessoa_desc').AsString
         )
      );

      qryTiposPessoaVincula.Next;
   end;
end;

procedure TfrmTiposPessoas.dsTiposPessoasDataChange(Sender: TObject;
  Field: TField);
begin
   if qryTiposPessoas.State = dsBrowse then
   begin
      cbTipoPessoaVinculo.ItemIndex := getIndexComboVinculo(qryTiposPessoascd_parentesco_relac.AsInteger);
   end;
end;

procedure TfrmTiposPessoas.dsTiposPessoasStateChange(Sender: TObject);
begin
   btnInserir.Enabled := not (qryTiposPessoas.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled := not (qryTiposPessoas.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled := not (qryTiposPessoas.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled := qryTiposPessoas.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryTiposPessoas.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (qryTiposPessoas.State in [dsInsert, dsEdit]);
   cbTipoPessoaVinculo.Enabled := qryTiposPessoas.State in [dsInsert, dsEdit];
end;

procedure TfrmTiposPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmTiposPessoas.FormDestroy(Sender: TObject);
begin
   frmTiposPessoas := nil;
end;

procedure TfrmTiposPessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2: btnInserirClick( nil );
      VK_F3: btnAlterarClick( nil );
      VK_F5: btnSalvarClick( nil );
      VK_F9: btnExcluirClick( nil );
      VK_F6: btnCancelarClick( nil );
      VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmTiposPessoas.FormShow(Sender: TObject);
begin
   carregaTiposPessoa();

   qryTiposPessoas.Close;
   qryTiposPessoas.Open;
end;

function TfrmTiposPessoas.getIndexComboVinculo(cdTipo: Integer): Integer;
var
   i: integer;
begin
   for I := 0 to cbTipoPessoaVinculo.Items.Count - 1 do
   begin
      if TItemCombo(cbTipoPessoaVinculo.Items.Objects[i]).getCodigo = IntToStr(cdTipo) then
      begin
         Result := i;
         Exit;
      end;
   end;
end;

function TfrmTiposPessoas.isTipoUsado(cdTipo: Integer): Boolean;
const
   SQL_IS_USADO =
      ' SELECT '+
      '     count(cd_parente) AS qtd '+
      '  FROM '+
      '     pessoas_parentesco '+
      '  WHERE '+
      '     cd_parentesco_tipo = :cd_parentesco_tipo ';
var
   qryIsTipoUsado: TUMZReadOnlyQuery;
begin

   DM.CriarConsulta(qryIsTipoUsado);
   qryIsTipoUsado.SQL.Text := SQL_IS_USADO;
   qryIsTipoUsado.ParamByName('cd_parentesco_tipo').AsInteger := cdTipo;
   qryIsTipoUsado.Open;

   Result := (qryIsTipoUsado.FieldByName('qtd').AsInteger > 0);
end;

end.
