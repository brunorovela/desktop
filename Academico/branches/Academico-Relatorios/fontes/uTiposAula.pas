unit uTiposAula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, uDM, Grids, DBGrids, ComCtrls, ToolWin, ImgList,
  General;

type
  TfrmTiposAula = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qyTiposAula: TUMZQuery;
    dsTiposAula: TDataSource;
    qyTiposAulacd_aula_tipo: TIntegerField;
    qyTiposAulads_aula_tipo: TStringField;
    qyTiposAulads_chave: TStringField;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edDescricao: TDBEdit;
    Label2: TLabel;
    edChave: TDBEdit;
    ImageList2: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyTiposAulaAfterEdit(DataSet: TDataSet);
    procedure qyTiposAulaAfterInsert(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dsTiposAulaStateChange(Sender: TObject);
  private
    function isExclusaoValida(cd_aula_tipo: Integer): Boolean;  
  public
    { Public declarations }
  end;

var
  frmTiposAula: TfrmTiposAula;

implementation

{$R *.dfm}

procedure TfrmTiposAula.btnAlterarClick(Sender: TObject);
begin
   qyTiposAula.Edit;
end;

procedure TfrmTiposAula.btnCancelarClick(Sender: TObject);
begin
   qyTiposAula.Cancel;
end;

procedure TfrmTiposAula.btnExcluirClick(Sender: TObject);
begin
   if not(isExclusaoValida(qyTiposAulacd_aula_tipo.AsInteger)) then
   begin
      Mensagem(
         'Este tipo de aula ja está em uso, você não pode excluí-lo.',
         'Aviso',
         MB_OK + MB_ICONWARNING,
         Handle
      );
      
      Exit;
   end;

   if Mensagem(
         'Deseja realmente excluir este registro?',
         'Aviso',
         MB_YESNO + MB_ICONWARNING,
         Handle   
      ) = mrYes then
   begin
      qyTiposAula.Delete;   
   end;
end;

procedure TfrmTiposAula.btnIncluirClick(Sender: TObject);
begin
   qyTiposAula.Insert;
end;

procedure TfrmTiposAula.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmTiposAula.btnSalvarClick(Sender: TObject);
begin
   if edDescricao.Text = '' then
   begin
      Mensagem(
         'O campo descrição é obrigatório, favor preencha algum dado neste campo',
         'Aviso',
         MB_OK + MB_ICONEXCLAMATION,
         Handle
      );
      
      Exit;
   end;

   if edChave.Text = '' then
   begin
      Mensagem(
         'O campo chave é obrigatório, favor preencha algum dado neste campo',
         'Aviso',
         MB_OK + MB_ICONEXCLAMATION,
         Handle
      );
      
      Exit;
   end;   

   qyTiposAula.Post;
end;

procedure TfrmTiposAula.dsTiposAulaStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not(qyTiposAula.State IN [dsInsert, dsEdit]);
   btnAlterar.Enabled := not(qyTiposAula.State IN [dsInsert, dsEdit]);
   btnExcluir.Enabled := not(qyTiposAula.State IN [dsInsert, dsEdit]);

   btnCancelar.Enabled := qyTiposAula.State IN [dsInsert, dsEdit];
   btnSalvar.Enabled := qyTiposAula.State IN [dsInsert, dsEdit];

   edChave.Enabled := qyTiposAula.State IN [dsInsert];
end;

procedure TfrmTiposAula.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmTiposAula.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2: if ( btnIncluir.Enabled   ) then btnIncluirClick( nil );
      VK_F3: if ( btnAlterar.Enabled   ) then btnAlterarClick( nil );
      VK_F5: if ( btnSalvar.Enabled    ) then btnSalvarClick( nil );
      VK_F6: if ( btnCancelar.Enabled  ) then btnCancelarClick( nil );
      VK_F9: if ( btnExcluir.Enabled   ) then btnExcluirClick( nil );
      VK_F12: btnSairClick( nil );
   end;
end;

procedure TfrmTiposAula.FormShow(Sender: TObject);
begin
   qyTiposAula.Close;
   qyTiposAula.Open;
end;

function TfrmTiposAula.isExclusaoValida(cd_aula_tipo: Integer): Boolean;
const
   SQL_IS_EXCLUSAO_VALIDA =
      ' SELECT '+
      '     COUNT(cd_aula_tipo) AS qtd '+
      '  FROM '+
      '     diario_aulas '+
      '  WHERE '+
      '     cd_aula_tipo = :cd_aula_tipo ';
      
   SQL_IS_EXCLUSAO_VALIDA2 =
      'SELECT '+
	   '   COUNT(cd_aula_tipo) AS qtd '+
      'FROM '+
      '	aulas_tipos_parametros '+
      'WHERE '+
      '	cd_aula_tipo = :cd_aula_tipo ';
var
   qyIsExclusaoValida,
   qyIsExclusaoValida2: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsExclusaoValida);
   DM.CriarConsulta(qyIsExclusaoValida2);

   qyIsExclusaoValida.SQL.Text := SQL_IS_EXCLUSAO_VALIDA;
   qyIsExclusaoValida.ParamByName('cd_aula_tipo').AsInteger := cd_aula_tipo;
   qyIsExclusaoValida.Open;

   qyIsExclusaoValida2.SQL.Text := SQL_IS_EXCLUSAO_VALIDA2;
   qyIsExclusaoValida2.ParamByName('cd_aula_tipo').AsInteger := cd_aula_tipo;
   qyIsExclusaoValida2.Open;

   Result := not(qyIsExclusaoValida.FieldByName('qtd').AsInteger > 0)
             and not(qyIsExclusaoValida2.FieldByName('qtd').AsInteger > 0);

   FreeAndNil(qyIsExclusaoValida);
   FreeAndNil(qyIsExclusaoValida2);
end;

procedure TfrmTiposAula.qyTiposAulaAfterEdit(DataSet: TDataSet);
begin
   edDescricao.SetFocus;
end;

procedure TfrmTiposAula.qyTiposAulaAfterInsert(DataSet: TDataSet);
begin
   edDescricao.SetFocus;
end;

end.
