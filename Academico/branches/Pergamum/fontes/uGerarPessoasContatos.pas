unit uGerarPessoasContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UZDataset, DB, ZAbstractRODataset,
  ZAbstractDataset, uItemCombo, uDM;

type
  TuFGerarPessoaContatos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    cbNomePessoa: TComboBox;
    Label1: TLabel;
    edCPF: TEdit;
    dsPessoasContatos: TDataSource;
    qyBuscaCadastro: TUMZQuery;
    dsBuscaCadastro: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSelecionaPessoaClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edCPFKeyPress(Sender: TObject; var Key: Char);
    procedure Filtra();
  private
    { Private declarations }
  public
    cd_informacao: Integer;
  end;

var
  uFGerarPessoaContatos: TuFGerarPessoaContatos;

implementation

uses uFSelecionarPessoasContatos, uAluno, uLoginManager, uPessoasInformacoes,
  uPessoas;

{$R *.dfm}

procedure TuFGerarPessoaContatos.btnOkClick(Sender: TObject);
begin
   if ( cbNomePessoa.Text = '' ) then
   begin
      showMessage('Não é possível gerar um cadastro de pessoa para um contato que não possui um nome.');
      exit;
   end;


   Filtra;
end;

procedure TuFGerarPessoaContatos.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #8 then
   begin
      Exit;
   end;

   if Length(edCPF.Text) = 3 then
   begin
      edCPF.Text := edCPF.Text + '.';
      edCPF.Selstart := Length(edCPF.text);
   end;

   if Length(edCPF.Text) = 7 then
   begin
      edCPF.Text := edCPF.Text + '.';
      edCPF.Selstart := Length(edCPF.text);
   end;

   if Length(edCPF.Text) = 11 then
   begin
      edCPF.Text := edCPF.Text + '-';
      edCPF.Selstart := Length(edCPF.text);
   end;
end;

procedure TuFGerarPessoaContatos.Filtra;
CONST
   SQL_BUSCA_NOME = ''+
   'SELECT                    '+
	'  *                       '+
   'FROM                      '+
	'  pessoas                 '+
   'WHERE                     '+
	'  nm_pessoa = :nm_pessoa  ';


   SQL_BUSCA_CPF = ''+
   'SELECT              '+
   '  *                 '+
   'FROM                '+
   '  pessoas           '+
   'WHERE               '+
   '  ds_cpf = :ds_cpf  ';
begin

   if (edCPF.Text <> '') then
   begin
      qyBuscaCadastro.SQL.Text := SQL_BUSCA_CPF;

      qyBuscaCadastro.ParamByName('ds_cpf').AsString := edCPF.Text;

      qyBuscaCadastro.Open;

      //Verifica se já existe este CPF
      if (qyBuscaCadastro.RecordCount > 0) then
      begin

         if MessageDlg('Já existe uma pessoa cadastrada com este CPF, deseja visualizar o cadastro desta pessoa?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
         begin
            Application.CreateForm(Tfrm_Alunos, frm_Alunos);
            frm_Alunos.selecionaPessoa(qyBuscaCadastro.FieldByName('cd_pessoa').AsInteger);

            fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

            fPessoasInformacoes.qyPessoasInfo.Edit;
            fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
            fPessoasInformacoes.qyPessoasInfo.Post;

            fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

            Self.Close;
            Exit;

         end

      end;

      qyBuscaCadastro.SQL.Text := SQL_BUSCA_NOME;

      qyBuscaCadastro.ParamByName('nm_pessoa').AsString := cbNomePessoa.Text;

      qyBuscaCadastro.Open;

      //Se já existe uma pessoa com esse nome
      if (qyBuscaCadastro.RecordCount > 0) then
      begin

         if MessageDlg('Já existe uma pessoa cadastrada com este mesmo nome, deseja visualizar o cadastro desta pessoa?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
         begin
            Application.CreateForm(Tfrm_Alunos, frm_Alunos);
            frm_Alunos.selecionaPessoa(qyBuscaCadastro.FieldByName('cd_pessoa').AsInteger);

            fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

            fPessoasInformacoes.qyPessoasInfo.Edit;
            fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
            fPessoasInformacoes.qyPessoasInfo.Post;

            fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

            Self.Close;
            Exit;
         end;

      end;

      if MessageDlg('Deseja criar um novo cadastro para a pessoa selecionada?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
      begin
         Application.CreateForm(Tfrm_Alunos, frm_Alunos);
         frm_Alunos.importaPessoaModuloContatos(StrToInt(TItemCombo(cbNomePessoa.Items.Objects[cbNomePessoa.ItemIndex]).getCodigo), edcpf.text);

         fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

         fPessoasInformacoes.qyPessoasInfo.Edit;
         fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
         fPessoasInformacoes.qyPessoasInfo.Post;

         fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

         Self.Close;
         Exit;
      end;
      
   end
   //Pesquisa somente pelo nome de pessoa
   else if (cbNomePessoa.Text <> '') then
   begin

      qyBuscaCadastro.SQL.Text := SQL_BUSCA_NOME;

      qyBuscaCadastro.ParamByName('nm_pessoa').AsString := cbNomePessoa.Text;

      qyBuscaCadastro.Open;

      if (qyBuscaCadastro.RecordCount > 0) then
      begin

         if MessageDlg('Já existe uma pessoa cadastrada com este mesmo nome, deseja visualizar o cadastro desta pessoa?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
         begin
            Application.CreateForm(Tfrm_Alunos, frm_Alunos);
            frm_Alunos.selecionaPessoa(qyBuscaCadastro.FieldByName('cd_pessoa').AsInteger);

            fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

            fPessoasInformacoes.qyPessoasInfo.Edit;
            fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
            fPessoasInformacoes.qyPessoasInfo.Post;

            fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

            Self.Close;
            Exit;
         end;
         
      end;

      if MessageDlg('Deseja criar um novo cadastro para a pessoa selecionada?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
      begin
         Application.CreateForm(Tfrm_Alunos, frm_Alunos);
         frm_Alunos.importaPessoaModuloContatos(StrToInt(TItemCombo(cbNomePessoa.Items.Objects[cbNomePessoa.ItemIndex]).getCodigo), edcpf.text);

         fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

         fPessoasInformacoes.qyPessoasInfo.Edit;
         fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
         fPessoasInformacoes.qyPessoasInfo.Post;

         fPessoasInformacoes.qyPessoasInfo.Locate('cd_informacao', cd_informacao, []);

         Self.Close;
         Exit;
      end;
      
   end;

end;

procedure TuFGerarPessoaContatos.FormCreate(Sender: TObject);
begin
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyBuscaCadastro);
   dsBuscaCadastro.DataSet := qyBuscaCadastro;
end;

procedure TuFGerarPessoaContatos.FormShow(Sender: TObject);
CONST
   SQL_CONTATOS_PESSOAS = ''+
   'SELECT                       '+
   '  cd_informacao, nm_pessoa   '+
   'FROM                         '+
	'  pessoas_info               '+
   'WHERE                        '+
	'  nm_pessoa IS NOT NULL      '+
   'ORDER BY                     '+
   '  nm_pessoa                  ';
var
   qyCarregaComboCadastro: TUMZQuery;
   defaultSQLHourGlass : Boolean;
begin

   defaultSQLHourGlass := qyBuscaCadastro.Connection.SQLHourGlass;
   qyBuscaCadastro.Connection.SQLHourGlass := False;

   qyBuscaCadastro.Connection.SQLHourGlass := defaultSQLHourGlass;

   DM.CriarConsulta(qyCarregaComboCadastro);

   qyCarregaComboCadastro.SQL.Text := SQL_CONTATOS_PESSOAS;

   qyCarregaComboCadastro.Open;

   qyCarregaComboCadastro.First;

   cbNomePessoa.Clear;

   while not (qyCarregaComboCadastro.Eof) do
   begin

      cbNomePessoa.Items.AddObject(
         qyCarregaComboCadastro.FieldByName('nm_pessoa').AsString,
         TItemCombo.Create(
            qyCarregaComboCadastro.FieldByName('cd_informacao').asString,
            qyCarregaComboCadastro.FieldByName('nm_pessoa').AsString
         )
      );

      if qyCarregaComboCadastro.FieldByName('cd_informacao').AsInteger = cd_informacao then
      begin
         cbNomePessoa.ItemIndex := cbNomePessoa.Items.Count - 1;
      end;


      qyCarregaComboCadastro.Next;
   end;
   
end;

procedure TuFGerarPessoaContatos.sbSelecionaPessoaClick(Sender: TObject);
var
   resultadoPessoasContatos: TResultadoFiltroPessoasContatos;
begin
   resultadoPessoasContatos := TfrmSelecionarPessoasContatos.Filtrar([]);
end;

end.
