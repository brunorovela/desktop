unit uFCadDeficienciasCampos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClassPessoa, StdCtrls, ExtCtrls, UZDataset;

const
   NOME_LISTA_COMPONENTE = 'listaDados';

type
  TfrmCadDeficienciasCampos = class(TForm)
    bvInfoPessoa: TBevel;
    pnTopo: TPanel;
    lbInfoPessoa: TLabel;
    lbPessoa: TLabel;
    ScrollBox1: TScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Pessoa: TClassePessoa;
    cd_campo: Integer;

    procedure LoadCampo();
    procedure SalvarAlteracoes(Sender: TObject);
  public
    { Public declarations }
    procedure SetPessoa( const ObjPessoa: TClassePessoa );
    procedure SetCampo( const Campo: Integer );
  end;

var
  frmCadDeficienciasCampos: TfrmCadDeficienciasCampos;

implementation

uses uDM, General, DB;

{$R *.dfm}

{ TfrmCadDeficienciasCampos }

procedure TfrmCadDeficienciasCampos.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   I: Integer;
begin
   for I := ( ScrollBox1.ComponentCount -1 ) downto 0 do
   begin
      ScrollBox1.Components[I].Destroy;
   end;
end;

procedure TfrmCadDeficienciasCampos.FormShow(Sender: TObject);
begin
   lbPessoa.Caption := Pessoa.Nome;
   LoadCampo();
end;

procedure TfrmCadDeficienciasCampos.LoadCampo;
const
   SQL_CAMPO =
      ' SELECT COALESCE( pca.DS_CAMPO, pca.DS_CAMPO_DESCRICAO ) AS DS_CAMPO, pca.DS_TIPO, ' +
      '        pco.ME_SQL, pco.ME_OPCOES, pco.CD_OPCAO ' +
      ' FROM pessoas_campos_adicionais pca ' +
      '      LEFT JOIN pessoas_campos_opcoes pco ON ( pco.CD_OPCAO = pca.CD_OPCAO ) ' +
      ' WHERE pca.CD_CAMPO = :CD_CAMPO AND pca.SN_ATIVO = 1 ';
var
   I: Integer;
   qyBuscaCampo, qyAux: TUMZQuery;
   radioGroup: TRadioGroup;
   checkBox: TCheckBox;
   arrOpcoes, arrOpcoesPessoa: TStringList;
begin
   DM.CriarConsulta( qyBuscaCampo );
   DM.CriarConsulta( qyAux );
   arrOpcoes := TStringList.Create;
   arrOpcoesPessoa := TStringList.Create;

   qyBuscaCampo.SQL.Text := SQL_CAMPO;
   qyBuscaCampo.ParamByName('CD_CAMPO').AsInteger := cd_campo;
   qyBuscaCampo.Open();

   if ( qyBuscaCampo.FieldByName( 'DS_TIPO' ).AsString <> 'U' ) AND
      ( qyBuscaCampo.FieldByName( 'DS_TIPO' ).AsString <> 'V' ) then
   begin
      Mensagem('Este tipo de campo não é suportado pela tela.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
      Close();
   end;

   if ( qyBuscaCampo.FieldByName( 'ME_SQL' ).AsString = '' ) then
   begin
      if ( not qyBuscaCampo.FieldByName('CD_OPCAO').IsNull ) then
         SplitString( qyBuscaCampo.FieldByName('ME_OPCOES').AsString, ';', arrOpcoes );      

      for I := 0 to arrOpcoes.Count - 1 do
         arrOpcoes[I] := trim( arrOpcoes[I] );         
   end else begin
      qyAux.SQL.Text := qyBuscaCampo.FieldByName( 'ME_SQL' ).AsString;
      qyAux.Open();

      while not qyAux.Eof do
      begin
         arrOpcoes.Add( trim(qyAux.Fields[1].AsString) );
         qyAux.Next();
      end;       
   end;   

   if ( qyBuscaCampo.FieldByName( 'DS_TIPO' ).AsString = 'U' ) then
   begin
      radioGroup := TRadioGroup.Create( ScrollBox1 );
      radioGroup.Parent := ScrollBox1;
      radioGroup.Width := ScrollBox1.Width - 34;
      radioGroup.Left := 12;
      radioGroup.Height := 33 + ( arrOpcoes.Count * 18 );
      radioGroup.Top := 3;
      radioGroup.Name := NOME_LISTA_COMPONENTE;
      radioGroup.Caption := qyBuscaCampo.FieldByName( 'DS_CAMPO' ).AsString;
      radioGroup.Items := arrOpcoes;
      radioGroup.ItemIndex := arrOpcoes.IndexOf( trim(Pessoa.NecessidadesEspeciaisCompleta[ cd_campo ]) );
      radioGroup.OnClick := SalvarAlteracoes;
   end else if ( qyBuscaCampo.FieldByName( 'DS_TIPO' ).AsString = 'V' ) then
   begin
      SplitString( Pessoa.NecessidadesEspeciaisCompleta[ cd_campo ], ';', arrOpcoesPessoa );
      for I := 0 to arrOpcoes.Count - 1 do
      begin
         checkBox := TCheckBox.Create( ScrollBox1 );
         checkBox.Parent := ScrollBox1;
         checkBox.Width := ScrollBox1.Width - 34;
         checkBox.Left := 12;
         checkBox.Top := 5 + ( I * 23 );
         checkBox.Name := NOME_LISTA_COMPONENTE + IntToStr( I );
         checkBox.Caption := arrOpcoes[I];
         checkBox.Checked := ( arrOpcoesPessoa.IndexOf( arrOpcoes[I] ) > -1 );
         checkBox.OnClick := SalvarAlteracoes;
      end;         
   end;
end;

procedure TfrmCadDeficienciasCampos.SalvarAlteracoes(Sender: TObject);
const
   SQL_SALVAR_ALTERACOES =
      ' REPLACE INTO pessoas_deficiencias_completo( cd_pessoa, cd_campo, me_valor ) ' +
      ' VALUES ( :cd_pessoa, :cd_campo, :me_valor ) ';
var
   I: Integer;
   qyUpdate: TUMZQuery;
   me_valor, Separador: string;
begin
   DM.CriarConsulta( qyUpdate );
   qyUpdate.SQL.Text := SQL_SALVAR_ALTERACOES;
   qyUpdate.ParamByName('cd_pessoa').AsInteger := Pessoa.Codigo;
   qyUpdate.ParamByName('cd_campo').AsInteger := cd_campo;

   if ( ScrollBox1.FindComponent( NOME_LISTA_COMPONENTE ) is TRadioGroup ) then
   begin
      me_valor := TRadioGroup( ScrollBox1.FindComponent( NOME_LISTA_COMPONENTE ) ).Items[ TRadioGroup( ScrollBox1.FindComponent( NOME_LISTA_COMPONENTE ) ).ItemIndex ];
   end else begin
      Separador := '';
      for I := 0 to ScrollBox1.ComponentCount - 1 do
      begin
         if not ( ScrollBox1.Components[I] is TCheckBox ) OR
            ( not TCheckBox( ScrollBox1.Components[I] ).Checked ) then Continue;

         me_valor := me_valor + Separador + TCheckBox( ScrollBox1.Components[I] ).Caption;
         Separador := ';';
      end;
   end;

   qyUpdate.ParamByName('me_valor').AsString := me_valor;
   qyUpdate.ExecSQL;   
end;

procedure TfrmCadDeficienciasCampos.SetCampo(const Campo: Integer);
begin
   cd_campo := Campo;
end;

procedure TfrmCadDeficienciasCampos.SetPessoa(const ObjPessoa: TClassePessoa);
begin
   Pessoa := ObjPessoa;
end;

end.
