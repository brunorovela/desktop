unit uFrameParentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, uDM, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, DB, Grids, DBGrids, ZConnection, ExtCtrls, StdCtrls,
  Buttons, Mask, DBCtrls, ComCtrls, ToolWin, ImgList, uOutrasPessoasEdicao;

type
  TfrParentes = class(TFrame)
    qyParentes: TUMZQuery;
    qyParentesTipos: TUMZQuery;
    dtcParentes: TDataSource;
    DBGrid1: TDBGrid;
    dtcParentesTipos: TDataSource;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    qyPessoa: TUMZQuery;
    dtcPessoa: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Buscar: TBitBtn;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    btIncluir_Pessoa: TToolButton;
    btAlterar_Pessoa: TToolButton;
    btExcluir_Pessoa: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    Bevel4: TBevel;
    qyAux: TUMZQuery;
    qyParentesnm_pessoa: TStringField;
    qyParentescd_pessoa: TIntegerField;
    qyParentesds_cpf: TStringField;
    qyParentesds_pessoa_desc: TStringField;
    qyParentescd_parentesco_tipo: TIntegerField;
    procedure btIncluir_PessoaClick(Sender: TObject);
    procedure btExcluir_PessoaClick(Sender: TObject);
    procedure btAlterar_PessoaClick(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
  private
      FCodPessoa, FTipo, FCodParente: integer;

      procedure excluirOutrasPessoas();
      
  public
      procedure TrocaPessoa(iPessoa: Integer = 0);
    { Public declarations }
  end;

implementation

uses
   uFSelecionarPessoa;

{$R *.dfm}

procedure TfrParentes.btAlterar_PessoaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmOutrasPessoas, frmOutrasPessoas);

   frmOutrasPessoas.cd_pessoa := FCodPessoa;

   frmOutrasPessoas.carregaTiposPessoas();

   frmOutrasPessoas.alterarOutraPessoa(
      qyParentescd_pessoa.AsInteger,
      qyParentescd_parentesco_tipo.AsInteger,
      qyParentesnm_pessoa.AsString
   );

   frmOutrasPessoas.ShowModal;

   qyParentes.close;
   qyParentes.ParamByName('cd_pessoa').AsInteger :=
      FCodPessoa;
   qyParentes.Open;
end;

procedure TfrParentes.btExcluir_PessoaClick(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir o parente selecionado?','Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
   begin
      excluirOutrasPessoas();
   end;

   qyParentes.close;
   qyParentes.ParamByName('cd_pessoa').AsInteger :=
      FCodPessoa;
   qyParentes.Open;
end;

procedure TfrParentes.btIncluir_PessoaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmOutrasPessoas, frmOutrasPessoas);
   frmOutrasPessoas.cd_pessoa := FCodPessoa;
   frmOutrasPessoas.carregaTiposPessoas;
   frmOutrasPessoas.ShowModal;

   qyParentes.close;
   qyParentes.ParamByName('cd_pessoa').AsInteger :=
      FCodPessoa;
   qyParentes.Open;
end;

procedure TfrParentes.BuscarClick(Sender: TObject);
begin
   trocaPessoa();
end;

procedure TfrParentes.excluirOutrasPessoas;
const
   SQL_DELETE_OUTRAS_PESSOAS =
      'DELETE FROM'+
      '   PESSOAS_PARENTESCO '+
      'WHERE'+
      '   (cd_pessoa = %d or cd_pessoa = %d) and (cd_parente = %d or cd_parente = %d)';
var
   qryExcluirRelacionamento: TUMZQuery;
begin

   DM.CriarConsulta(qryExcluirRelacionamento);

   qryExcluirRelacionamento.SQL.Text := Format(
      SQL_DELETE_OUTRAS_PESSOAS,
      [  qyParentescd_pessoa.AsInteger,
         FCodPessoa,
         qyParentescd_pessoa.AsInteger,
         FCodPessoa
      ]
   );

   qryExcluirRelacionamento.ExecSQL;
end;

procedure TfrParentes.TrocaPessoa(iPessoa: Integer);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   if ((iPessoa = FCodPessoa) and (FCodPessoa <> 0)) then
   begin
      Exit;
   end;

   if (iPessoa > 0) then
   begin
      FCodPessoa := iPessoa;
   end
   else
   begin
      resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

      if resultado_filtro.filtrado then
      begin
         FCodPessoa := resultado_filtro.cd_pessoa;
      end
      else
      begin
         FCodPessoa := 0;
      end;
   end;

   qyParentes.Close;
   qyParentes.ParamByName('cd_pessoa').AsInteger :=
      FCodPessoa;
   qyParentes.Open;
end;

end.

