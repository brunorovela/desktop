unit uFCadastroTiposProvas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, Grids,
  DBGrids, ImgList, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls;

type
  TfrmCadastroTiposAvaliacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qyTiposAvaliacao: TUMZQuery;
    dsTiposAvaliacao: TDataSource;
    DBGrid1: TDBGrid;
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
    ImageList2: TImageList;
    Label1: TLabel;
    Chave: TLabel;
    edDescricao: TDBEdit;
    edChave: TDBEdit;
    dbrgTipoAvaliacao: TDBRadioGroup;
    qyTiposAvaliacaocd_avaliacao_tipo: TIntegerField;
    qyTiposAvaliacaods_avaliacao: TStringField;
    qyTiposAvaliacaocd_tipo: TIntegerField;
    qyTiposAvaliacaods_tipo: TStringField;
    GroupBox1: TGroupBox;
    ckDiarioLocal: TDBCheckBox;
    ckDiarioOnline: TDBCheckBox;
    ckProducaoAcademica: TDBCheckBox;
    ckProvaOnline: TDBCheckBox;
    qyTiposAvaliacaosn_diario_local: TStringField;
    qyTiposAvaliacaosn_diario_online: TStringField;
    qyTiposAvaliacaosn_producao_academica: TStringField;
    qyTiposAvaliacaosn_prova_online: TStringField;
    qyTiposAvaliacaods_chave: TStringField;
    DBCheckBox1: TDBCheckBox;
    qyTiposAvaliacaosn_prova_online_presencial: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    Label2: TLabel;
    qyTiposAvaliacaosn_necessita_deferimento: TStringField;
    procedure dsTiposAvaliacaoDataChange(Sender: TObject; Field: TField);
    procedure qyTiposAvaliacaoCalcFields(DataSet: TDataSet);
    procedure dsTiposAvaliacaoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    function hasAvaliacoesVinculadas(const cd_avaliacao_tipo: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroTiposAvaliacao: TfrmCadastroTiposAvaliacao;

implementation

uses uDM, General, uUsuario;

{$R *.dfm}

procedure TfrmCadastroTiposAvaliacao.btnAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2071, npAlterar, True ) then Exit;

   qyTiposAvaliacao.Edit;
end;

procedure TfrmCadastroTiposAvaliacao.btnCancelarClick(Sender: TObject);
begin
   qyTiposAvaliacao.Cancel;
end;

procedure TfrmCadastroTiposAvaliacao.btnExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2071, npExcluir, True ) then Exit;

   if ( hasAvaliacoesVinculadas( qyTiposAvaliacaocd_avaliacao_tipo.AsInteger ) ) then
   begin
      Mensagem('Existem avaliações ligadas a este tipo. ' + Chr(VK_RETURN) +
               'Para desabilitar o uso, acesse o menu Cadastros > Parâmetros de Avaliação '+
               'e desative as formas de avaliação que não devem ser utilizadas.',
               Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end else if ( Mensagem('Deseja realmente excluir ?',
                          Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = mrYes ) then
   begin
      qyTiposAvaliacao.Delete;
   end;
end;

procedure TfrmCadastroTiposAvaliacao.btnIncluirClick(Sender: TObject);
begin                   
   if not DM.UsuarioLogado.TemPermissao( 2071, npIncluir, True ) then Exit;

   edDescricao.SetFocus;
   qyTiposAvaliacao.Insert;
end;

procedure TfrmCadastroTiposAvaliacao.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmCadastroTiposAvaliacao.btnSalvarClick(Sender: TObject);
var
   mensagemErro : string;
   possuiErro : bool;
begin
   mensagemErro := '';
   possuiErro := false;

   if Trim(edDescricao.Text) = '' then begin
      possuiErro := true;
      mensagemErro := '- Descrição'+char(13);
   end;

   if Trim(edChave.Text) = '' then begin
      possuiErro := true;
      mensagemErro := mensagemErro + '- Chave'+char(13);
   end;

   if possuiErro then begin
      Mensagem('Necessário informar:'+char(13)+''+mensagemErro,
          Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   qyTiposAvaliacao.Post;

   qyTiposAvaliacao.Close;
   qyTiposAvaliacao.Open;
end;

procedure TfrmCadastroTiposAvaliacao.dsTiposAvaliacaoDataChange(Sender: TObject;
  Field: TField);
var
   i : integer;  
begin

     // Verifica se possui parametro de avaliação vinculado a esse tipo de avaliação
     if ( hasAvaliacoesVinculadas( qyTiposAvaliacao.FieldByName('cd_avaliacao_tipo').AsInteger ) ) then begin

        // Não permite editar a chave
        edChave.Enabled := False;

        // 1-CNS ou 2-NCNS, permite alterar entre um e outro somente
        if qyTiposAvaliacao.FieldByName('cd_tipo').AsInteger IN [1, 2] then begin

           dbrgTipoAvaliacao.Enabled := True;
           dbrgTipoAvaliacao.Controls[ 0 ].Enabled := True;
           dbrgTipoAvaliacao.Controls[ 1 ].Enabled := True;
           dbrgTipoAvaliacao.Controls[ 2 ].Enabled := False;
           dbrgTipoAvaliacao.Controls[ 3 ].Enabled := False;

        // 3-PS ou 4-RE, não permite alterar o tipo
        end else if qyTiposAvaliacao.FieldByName('cd_tipo').AsInteger IN [3, 4] then begin

           dbrgTipoAvaliacao.Enabled := False;

        end;

     end else begin

        edChave.Enabled := True; 
        dbrgTipoAvaliacao.Enabled := True;
        for i := 0 to 3 do
           dbrgTipoAvaliacao.Controls[ i ].Enabled := True;

     end;

end;

procedure TfrmCadastroTiposAvaliacao.dsTiposAvaliacaoStateChange(Sender: TObject);
begin
   // Caso estiver inserindo novo tipo de avaliação seleciona por padrão um tipo
   if qyTiposAvaliacao.State IN [ dsInsert ] then begin
      qyTiposAvaliacao.FieldByName('cd_tipo').AsInteger := 1;

      qyTiposAvaliacao.FieldByName('sn_diario_local').AsString := 'N';
      qyTiposAvaliacao.FieldByName('sn_diario_online').AsString := 'N';
      qyTiposAvaliacao.FieldByName('sn_producao_academica').AsString := 'N';
      qyTiposAvaliacao.FieldByName('sn_prova_online').AsString := 'N';
      qyTiposAvaliacao.FieldByName('sn_prova_online_presencial').AsString := 'N';      

   end;

   btnIncluir.Enabled := not (qyTiposAvaliacao.State IN [ dsInsert, dsEdit ]);
   btnAlterar.Enabled := not (qyTiposAvaliacao.State IN [ dsInsert, dsEdit ]);
   btnExcluir.Enabled := not (qyTiposAvaliacao.State IN [ dsInsert, dsEdit ]);

   btnCancelar.Enabled := qyTiposAvaliacao.State IN [ dsInsert, dsEdit ];
   btnSalvar.Enabled := qyTiposAvaliacao.State IN [ dsInsert, dsEdit ];
end;

procedure TfrmCadastroTiposAvaliacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadastroTiposAvaliacao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadastroTiposAvaliacao.FormShow(Sender: TObject);
begin
   qyTiposAvaliacao.Open;
end;

function TfrmCadastroTiposAvaliacao.hasAvaliacoesVinculadas(
  const cd_avaliacao_tipo: Integer): Boolean;
const
   SQL_HAS_AVALIACOES_VINCULADAS =
      ' SELECT COUNT(*) AS registros FROM avaliacoes_tipos_parametros ' +
      ' WHERE cd_avaliacao_tipo = :CD_AVALIACAO_TIPO ';
var
   qyHasAvaliacoesVinculadas: TUMZQuery;
begin
   DM.CriarConsulta(qyHasAvaliacoesVinculadas);

   qyHasAvaliacoesVinculadas.Close;
   qyHasAvaliacoesVinculadas.SQL.Text := SQL_HAS_AVALIACOES_VINCULADAS;
   qyHasAvaliacoesVinculadas.ParamByName('CD_AVALIACAO_TIPO').AsInteger := cd_avaliacao_tipo;
   qyHasAvaliacoesVinculadas.Open;

   Result := qyHasAvaliacoesVinculadas.FieldByName('registros').AsInteger > 0;

   FreeAndNil(qyHasAvaliacoesVinculadas);
end;

procedure TfrmCadastroTiposAvaliacao.qyTiposAvaliacaoCalcFields(
  DataSet: TDataSet);
var
   tipo : integer;
begin

   tipo := qyTiposAvaliacao.FieldByName('cd_tipo').AsInteger;

   if (tipo = 1) then begin

      qyTiposAvaliacao.FieldByName('ds_tipo').AsString := 'CNS';

   end else if (tipo = 2) then begin

      qyTiposAvaliacao.FieldByName('ds_tipo').AsString := 'NCNS';

   end else if (tipo = 3) then begin

      qyTiposAvaliacao.FieldByName('ds_tipo').AsString := 'PS';

   end else if (tipo = 4) then begin

      qyTiposAvaliacao.FieldByName('ds_tipo').AsString := 'RE';

   end;

end;

end.
