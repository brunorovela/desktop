unit uOutrasPessoasEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UMComboBox, uDM, ZAbstractTable,
  ZDataset, ZAbstractRODataset, ZAbstractDataset, UZDataset, uItemCombo,
  uFSelecionarPessoa, Main, uTiposPessoas, uUsuario;

type
  TfrmOutrasPessoas = class(TForm)
    pnMain: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    cbTiposPessoas: TUMComboBox;
    btnSalvar: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    cd_outra_pessoa,
    cd_outra_pessoa_excluir: Integer;

    editando: Boolean;
    
    procedure salvaOutraPessoa();
    procedure excluirOutrasPessoas();
  public
    cd_pessoa: Integer;

    procedure alterarOutraPessoa( cd_outra_pessoa, cd_tipo_outra_pessoa: Integer; nm_outra_pessoa: String );
    procedure carregaTiposPessoas();
  end;

var
  frmOutrasPessoas: TfrmOutrasPessoas;

implementation

{$R *.dfm}

{ TForm2 }

procedure TfrmOutrasPessoas.alterarOutraPessoa(cd_outra_pessoa,
  cd_tipo_outra_pessoa: Integer; nm_outra_pessoa: String);
var
   i: integer;
begin
   // Deixa selecionado o tipo anterior
   for I := 0 to cbTiposPessoas.Items.Count - 1 do
   begin
      if TItemCombo(cbTiposPessoas.Items.Objects[i]).codigo = IntToStr(cd_tipo_outra_pessoa) then
      begin
         cbTiposPessoas.ItemIndex := i;
      end;
   end;

   // Mostra nome e guarda código da pessoa anterior
   Self.cd_outra_pessoa := cd_outra_pessoa;
   Edit1.Text := nm_outra_pessoa;

   // Preciso guardar qual usuário correto para excluir
   Self.cd_outra_pessoa_excluir := cd_outra_pessoa;

   // Confirma que esta em edição
   editando := True;
end;

procedure TfrmOutrasPessoas.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmOutrasPessoas.btnSalvarClick(Sender: TObject);
begin
   if cbTiposPessoas.ItemIndex > -1 then
   begin
      salvaOutraPessoa();
      Self.Close;
   end;
end;

procedure TfrmOutrasPessoas.carregaTiposPessoas();
const
   SQL_BUSCA_TIPOS_PESSOA =
      ' SELECT '+
      ' 	cd_parentesco_tipo, '+
      ' 	ds_pessoa_desc, '+
      '  cd_parentesco_relac '+
      ' FROM '+
      ' 	pessoas_parentesco_tipos ';
var
   qryTiposPessoas: TUMZReadOnlyQuery;
begin

   DM.CriarConsulta(qryTiposPessoas);
   qryTiposPessoas.SQL.Text := SQL_BUSCA_TIPOS_PESSOA;
   qryTiposPessoas.Open;

   cbTiposPessoas.Items.Clear;

   while not qryTiposPessoas.Eof do
   begin
      cbTiposPessoas.AddItem(
         qryTiposPessoas.FieldByName('ds_pessoa_desc').AsString,
         TItemCombo.Create(
            qryTiposPessoas.FieldByName('cd_parentesco_tipo').AsString,
            qryTiposPessoas.FieldByName('ds_pessoa_desc').AsString,
            qryTiposPessoas.FieldByName('cd_parentesco_relac').AsString
         )
      );

      qryTiposPessoas.Next;
   end;
end;

procedure TfrmOutrasPessoas.excluirOutrasPessoas;
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
      [  cd_outra_pessoa_excluir,
         cd_pessoa,
         cd_outra_pessoa_excluir,
         cd_pessoa
      ]
   );

   qryExcluirRelacionamento.ExecSQL;
end;

procedure TfrmOutrasPessoas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   cd_outra_pessoa_excluir := 0;
end;

procedure TfrmOutrasPessoas.salvaOutraPessoa;
const
   SQL_INSERE_OUTRA_PESSOA = 
      'INSERT INTO PESSOAS_PARENTESCO'+
      '   (CD_PESSOA, CD_PARENTE, CD_PARENTESCO_TIPO)'+
      'VALUES'+
      '   (:CD_PARENTE, :CD_PESSOA,'+
      '      (SELECT CD_PARENTESCO_RELAC'+
      '       FROM PESSOAS_PARENTESCO_TIPOS'+
      '       WHERE CD_PARENTESCO_TIPO = :CD_PARENTESCO_TIPO)'+
      '   )';
var
   qryInserirRelacionamento: TUMZQuery;
begin

   DM.CriarConsulta(qryInserirRelacionamento);

   if editando then
   begin
      excluirOutrasPessoas();
   end;

   qryInserirRelacionamento.SQL.Text := SQL_INSERE_OUTRA_PESSOA;

   qryInserirRelacionamento.ParamByName('CD_PARENTE').AsInteger :=
      cd_outra_pessoa;
   qryInserirRelacionamento.ParamByName('CD_PESSOA').AsInteger :=
      cd_pessoa;
   qryInserirRelacionamento.ParamByName('CD_PARENTESCO_TIPO').AsString :=
      TItemCombo(cbTiposPessoas.Items.Objects[cbTiposPessoas.ItemIndex]).codigo;   

   qryInserirRelacionamento.ExecSQL;   

   qryInserirRelacionamento.ParamByName('CD_PARENTE').AsInteger :=
      cd_pessoa;
   qryInserirRelacionamento.ParamByName('CD_PESSOA').AsInteger :=
      cd_outra_pessoa;
   qryInserirRelacionamento.ParamByName('CD_PARENTESCO_TIPO').AsString :=
      TItemCombo(cbTiposPessoas.Items.Objects[cbTiposPessoas.ItemIndex]).variavel;

   qryInserirRelacionamento.ExecSQL;
end;

procedure TfrmOutrasPessoas.SpeedButton1Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'Academico.CadastroTiposPessoas', npAcesso, True ) then
   begin
      Exit;
   end;

   if frmTiposPessoas = nil then
   begin
      Application.CreateForm( TfrmTiposPessoas, frmTiposPessoas );
   end
   else
   begin
      frmTiposPessoas.Show;
   end;
   
   Self.Close;
end;

procedure TfrmOutrasPessoas.SpeedButton2Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.filtrado then
   begin
      Edit1.Text := resultado.nm_pessoa;
      cd_outra_pessoa := resultado.cd_pessoa;
   end;
end;

end.
