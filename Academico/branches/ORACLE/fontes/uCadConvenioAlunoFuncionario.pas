unit uCadConvenioAlunoFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, udm, uCadConvenioPgto, Buttons, StdCtrls,
  DBCtrls, DB, General, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfrmCadConveioPessoa = class(TForm)
    Panel1: TPanel;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton14: TToolButton;
    lbPessoa: TLabel;
    txtNomeEmpresa: TEdit;
    sbSelecionarPessoa: TSpeedButton;
    lbCargoCriterio: TLabel;
    dbCriterio: TDBLookupComboBox;
    procedure txtNomeEmpresaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSelecionarPessoaClick(Sender: TObject);
  private
    cd_pessoa        : integer;
    function existePessoaEmpresa( cd_pessoa : integer ): Boolean;
    { Private declarations }
  public
    procedure setCdPessoa( vl_cd_pessoa : integer );
    { Public declarations }
  end;

var
  frmCadConveioPessoa: TfrmCadConveioPessoa;

implementation

uses uFSelecionarPessoa;

{$R *.dfm}

procedure TfrmCadConveioPessoa.btnCancelarClick(Sender: TObject);
begin
   frmCadConvenioPgto.qyAlunosFuncionarios.Cancel;
   Self.Close();
end;

procedure TfrmCadConveioPessoa.btnSalvarClick(Sender: TObject);
var
   cd_empresa        : string;
   cd_convenio       : string;
   cd_criterio       : string;
   chave_log         : string;
begin
   if dbCriterio.KeyValue = null then
   begin
      Mensagem('Selecione o Critério.', 'Atenção', MB_OK + MB_ICONINFORMATION );
      exit;
   end;

   if self.cd_pessoa <> 0 then
   begin
      //antes de gravar a pessoa verifica se ela faz parte de outro convenio
      if Self.existePessoaEmpresa( cd_pessoa ) = false then
      begin

         if frmCadConvenioPgto.qyAlunosFuncionarios.State in [dsInsert] then
         begin
            cd_empresa  := frmCadConvenioPgto.qyNfeConveniosEmpresascd_convenio_pessoa.AsString;
            cd_convenio := frmCadConvenioPgto.qyNfeConveniosEmpresascd_convenio.AsString;
            cd_criterio := frmCadConvenioPgto.qyCriterioscd_convenio_criterio.AsString;
            
            chave_log := cd_convenio + ':' + cd_empresa + ':' + cd_criterio + ':' + inttostr(cd_pessoa);

            DM.setLog( frmCadConvenioPgto.getCdModulo(), 'inclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Incluido a pessoa de código '+ inttostr(cd_pessoa) +' no critério ' + cd_criterio + '. Critério referente a empresa de código ' + cd_empresa);
         end;

         frmCadConvenioPgto.qyAlunosFuncionarios.Post;
         Self.Close();

      end;
   end
   else
   begin
      Mensagem('Selecione a pessoa.', 'Atenção', MB_OK + MB_ICONINFORMATION );
   end;
end;

function TfrmCadConveioPessoa.existePessoaEmpresa(cd_pessoa: integer): Boolean;
var
   qyPessoaConvenio  : TUMZQuery;
   nm_pessoa         : string;
   nm_empresa        : string;
   nm_criterio       : string;
begin
   DM.CriarConsulta( qyPessoaConvenio );
   qyPessoaConvenio.Close;
   qyPessoaConvenio.SQL.Clear;
   qyPessoaConvenio.SQL.Text := 'SELECT '  +
                                   'fnpc.cd_pessoa, '+
                                   'p.nm_pessoa, '    +
                                   'emp.nm_pessoa nm_empresa, '+
                                   'fncc.ds_cargo '+
                                'FROM '                        +
                                   'fin_nfe_pessoas_conveniadas fnpc '+
                                   'INNER JOIN fin_nfe_convenios_criterios fncc ON (fncc.cd_convenio_criterio = fnpc.cd_convenio_criterio) '+
                                   'INNER JOIN fin_nfe_convenios fnc ON (fnc.cd_convenio = fncc.cd_convenio) '+
                                   'INNER JOIN pessoas p ON(p.cd_pessoa = fnpc.cd_pessoa) '+
                                   'INNER JOIN pessoas emp ON (emp.cd_pessoa = fnc.cd_pessoa) '+
                                'WHERE '+
                                   'fnpc.cd_pessoa = :cd_pessoa';

   qyPessoaConvenio.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyPessoaConvenio.Open;

   if qyPessoaConvenio.RecordCount >= 1 then
   begin
      nm_pessoa   := qyPessoaConvenio.FieldByName('nm_pessoa').AsString;
      nm_empresa  := qyPessoaConvenio.FieldByName('nm_empresa').AsString;
      nm_criterio := qyPessoaConvenio.FieldByName('ds_cargo').AsString;

      result := true;
      Mensagem(nm_pessoa + ' já esta vinculado(a) à empresa '+nm_empresa+' no cargo '+nm_criterio, 'Atenção', MB_OK + MB_ICONWARNING);
   end
   else
   begin
      result := false;
   end;
end;

procedure TfrmCadConveioPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmCadConvenioPgto.qyAlunosFuncionarios.Cancel;
   frmCadConvenioPgto.qyAlunosFuncionarios.Close;
   frmCadConvenioPgto.qyAlunosFuncionarios.Open;

   if cd_pessoa <> 0 then
   begin
      frmCadConvenioPgto.qyAlunosFuncionarios.Locate('cd_pessoa', cd_pessoa, [loPartialKey]);
   end;

   Action := caFree;
end;

procedure TfrmCadConveioPessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5  : if btnSalvar.Enabled   then btnSalvarClick( nil );
      VK_F6  : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F12 : Self.Close;
   end;
end;

procedure TfrmCadConveioPessoa.sbSelecionarPessoaClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
   nm_pessoa      : string;
begin
   nm_pessoa      := '';

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.filtrado then
   begin
      cd_pessoa := resultado.cd_pessoa;
      nm_pessoa := resultado.nm_pessoa;
   end;

   //atribui o retorno aos campos
   if  (cd_pessoa <> 0) and (nm_pessoa <> '')  then
   begin
      frmCadConvenioPgto.qyAlunosFuncionarios.FieldByName('cd_pessoa').AsInteger := cd_pessoa;
      txtNomeEmpresa.Text := nm_pessoa;
   end;
end;

procedure TfrmCadConveioPessoa.setCdPessoa(vl_cd_pessoa: integer);
begin
   Self.cd_pessoa := vl_cd_pessoa;
end;

procedure TfrmCadConveioPessoa.txtNomeEmpresaClick(Sender: TObject);
begin
   if trim(txtNomeEmpresa.Text) = '' then
   begin
      sbSelecionarPessoa.OnClick(nil);
   end;
end;

end.
