unit uAreasAtuacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset,
  uDM, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, ImgList,
  uUsuario, Buttons, General;

type
  TfrmAreasAtuacao = class(TForm)
    Panel1: TPanel;
    qryAreasAtuacao: TUMZQuery;
    dsAreasAtuacao: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
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
    ImageList1: TImageList;
    Panel4: TPanel;
    edDescricao: TDBEdit;
    dbmObservacao: TDBMemo;
    lbDescricao: TLabel;
    lbObservacao: TLabel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    edFiltro: TEdit;
    btnFiltrar: TBitBtn;
    Label1: TLabel;
    qryAreasAtuacaocd_area: TLargeintField;
    qryAreasAtuacaods_area: TStringField;
    qryAreasAtuacaome_observacoes: TStringField;
    qryAreasAtuacaoobservacao: TMemoField;
    Label2: TLabel;
    edCodigo: TDBEdit;
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsAreasAtuacaoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    function isVinculadaCurso(cd_area: Integer): Boolean;
  public
  end;

var
  frmAreasAtuacao: TfrmAreasAtuacao;

const
   SQL_AREAS_ATUACAO = ' SELECT '+
      ' 	caa.cd_area, '+
      ' 	caa.ds_area, '+
	   '  CAST(caa.me_observacoes as CHAR(255)) as me_observacoes, '+
      '  caa.me_observacoes as observacao ' +
      ' FROM '+
	   '  cursos_areas_atuacao caa ';

implementation

{$R *.dfm}

procedure TfrmAreasAtuacao.btnFiltrarClick(Sender: TObject);
begin
   qryAreasAtuacao.Close;
   qryAreasAtuacao.SQL.Text := SQL_AREAS_ATUACAO;

   if edFiltro.Text <> '' then
   begin
      qryAreasAtuacao.SQL.Add(' WHERE caa.ds_area LIKE ''%' + edFiltro.Text +'%'' ');
   end;

   qryAreasAtuacao.Open;
end;

procedure TfrmAreasAtuacao.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( dm.iCdPessoaLogado, 'Academico.AreasAtuacao', npAlterar, True ) then Exit;
   qryAreasAtuacao.Edit;
   edDescricao.SetFocus;
end;

procedure TfrmAreasAtuacao.btnCancelarClick(Sender: TObject);
begin
   qryAreasAtuacao.Cancel;
end;

procedure TfrmAreasAtuacao.btnExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( dm.iCdPessoaLogado, 'Academico.AreasAtuacao', npExcluir, True ) then Exit;

   if isVinculadaCurso(qryAreasAtuacaocd_area.AsInteger) then
   begin
      Mensagem(
         'Você não pode remover uma área vinculada a um curso.',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
   end
   else
   begin
      qryAreasAtuacao.Delete;
   end;
end;

procedure TfrmAreasAtuacao.btnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmAreasAtuacao.btnInserirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( dm.iCdPessoaLogado, 'Academico.AreasAtuacao', npIncluir, True ) then Exit;
   qryAreasAtuacao.Insert;
   edDescricao.SetFocus;
end;

procedure TfrmAreasAtuacao.btnSalvarClick(Sender: TObject);
begin
   qryAreasAtuacao.Post;
end;

procedure TfrmAreasAtuacao.dsAreasAtuacaoStateChange(Sender: TObject);
begin

   if qryAreasAtuacao.State in [dsEdit] then
   begin
      if not DM.UsuarioLogado.TemPermissao( dm.iCdPessoaLogado, 'Academico.AreasAtuacao', npIncluir, True ) then
      begin
         qryAreasAtuacao.Cancel;
         Exit;
      end;
   end;

   btnInserir.Enabled := not (qryAreasAtuacao.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled := not (qryAreasAtuacao.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled := not (qryAreasAtuacao.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled := qryAreasAtuacao.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryAreasAtuacao.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (qryAreasAtuacao.State in [dsInsert, dsEdit]);
end;

procedure TfrmAreasAtuacao.edFiltroKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      self.btnFiltrar.Click;
   end;
end;

procedure TfrmAreasAtuacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAreasAtuacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2 : btnInserirClick( nil );
      VK_F3 : btnAlterarClick( nil );
      VK_F5 : btnSalvarClick( nil );
      VK_F9 : btnExcluirClick( nil );
      VK_F6 : btnCancelarClick( nil );
      VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmAreasAtuacao.FormShow(Sender: TObject);
begin
   qryAreasAtuacao.Close;
   qryAreasAtuacao.SQL.Text := SQL_AREAS_ATUACAO;
   qryAreasAtuacao.Open;
end;

function TfrmAreasAtuacao.isVinculadaCurso(cd_area: Integer): Boolean;
var
   qryVerificaVinculoCurso: TUMZReadOnlyQuery;

const
   SQL_VERIFICA_VINCULO_CURSO =
      ' SELECT '+
      '  count(cd_curso) AS qtd '+
      ' FROM '+
      '  cursos_mestre '+
      ' WHERE '+
      '  cd_area = :cd_area ';

begin

   Result := False;

   DM.CriarConsulta(qryVerificaVinculoCurso);

   qryVerificaVinculoCurso.SQL.Text := SQL_VERIFICA_VINCULO_CURSO;
   qryVerificaVinculoCurso.ParamByName('cd_area').AsInteger := cd_area;
   qryVerificaVinculoCurso.Open;

   if qryVerificaVinculoCurso.FieldByName('qtd').AsInteger > 0 then
   begin

      Result := True;
      Exit;
   end;
end;

end.
