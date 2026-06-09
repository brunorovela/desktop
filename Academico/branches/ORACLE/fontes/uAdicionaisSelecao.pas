unit uAdicionaisSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UZConnection,
  Dialogs, ExtCtrls, UZDataset, StdCtrls, uLoginManager, General, Buttons;

const
   NOME_LISTA_COMPONENTE = 'adicionaisSelecao';  

type
   TfrmAdicionaisSelecao = class(TForm)
      Panel1: TPanel;
      pnTopo: TPanel;
      sbAdicionais: TScrollBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
   private
      Fcd_campo: Integer;
      Fcd_pessoa: Integer;
      Fnm_campo: Integer;
    Fnm_pessoa: Integer;
    procedure Setnm_campo(const Value: Integer);
      
      procedure Setcd_pessoa(const Value: Integer);
      procedure Setcd_campo(const Value: Integer);
      
      procedure salvarAlteracoes(Sender: TObject);
   public
      property cd_campo: Integer read Fcd_campo write Setcd_campo;
      property cd_pessoa: Integer read Fcd_pessoa write Setcd_pessoa;
      property nm_campo: Integer read Fnm_campo write Setnm_campo;
   end;

var
  frmAdicionaisSelecao: TfrmAdicionaisSelecao;

implementation

uses DB, uPessoas_adicional;

{$R *.dfm}

procedure TfrmAdicionaisSelecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   I: Integer;
begin
   for I := ( sbAdicionais.ComponentCount -1 ) downto 0 do
   begin
      sbAdicionais.Components[I].Destroy;
   end;
end;

procedure TfrmAdicionaisSelecao.FormShow(Sender: TObject);
const
   SQL_CAMPO =
      ' SELECT COALESCE( pca.DS_CAMPO, pca.DS_CAMPO_DESCRICAO ) AS DS_CAMPO, pca.DS_TIPO, ' +
      '        pco.ME_SQL, pco.ME_OPCOES, pco.CD_OPCAO ' +
      ' FROM pessoas_campos_adicionais pca ' +
      '      LEFT JOIN pessoas_campos_opcoes pco ON ( pco.CD_OPCAO = pca.CD_OPCAO ) ' +
      ' WHERE pca.CD_CAMPO = :CD_CAMPO AND pca.SN_ATIVO = 1 ';

   SQL_BUSCA_VALORES =
      ' SELECT pfc.me_valor FROM pessoas_deficiencias_completo pfc WHERE '+
      ' pfc.cd_pessoa = :cd_pessoa AND pfc.cd_campo = :cd_campo ';
var
   i, itemIndex: Integer;
   qyBuscaCampo, qyAux, qryBuscaInformacoes: TUMZQuery;
   radioGroup: TRadioGroup;
   checkBox: TCheckBox;
   arrOpcoes, arrOpcoesPessoa: TStringList;
begin

   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyBuscaCampo);
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyAux);
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qryBuscaInformacoes);

   qryBuscaInformacoes.SQL.Text := SQL_BUSCA_VALORES;
   qryBuscaInformacoes.ParamByName('cd_campo').AsInteger := cd_campo;
   qryBuscaInformacoes.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qryBuscaInformacoes.Open;

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
      begin
         SplitString( qyBuscaCampo.FieldByName('ME_OPCOES').AsString, ';', arrOpcoes );
      end;

      for I := 0 to arrOpcoes.Count - 1 do
      begin
         arrOpcoes[I] := trim( arrOpcoes[I] );
      end;
      
   end
   else
   begin
   
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
      radioGroup := TRadioGroup.Create( sbAdicionais );
      radioGroup.Parent := sbAdicionais;
      radioGroup.Width := sbAdicionais.Width - 34;
      radioGroup.Left := 12;
      radioGroup.Height := 33 + ( arrOpcoes.Count * 18 );
      radioGroup.Top := 3;
      radioGroup.Name := NOME_LISTA_COMPONENTE;
      radioGroup.Caption := qyBuscaCampo.FieldByName( 'DS_CAMPO' ).AsString;
      radioGroup.Items := arrOpcoes;

      for I := 0 to arrOpcoes.Count - 1 do
      begin
         if Trim(arrOpcoes[i]) = Trim(qryBuscaInformacoes.FieldByName('me_valor').AsString) then
         begin
            itemIndex := i;
         end;
      end;
      
      radioGroup.ItemIndex := itemIndex;
      radioGroup.OnClick := salvarAlteracoes;
   end
   else if ( qyBuscaCampo.FieldByName( 'DS_TIPO' ).AsString = 'V' ) then
   begin

      SplitString( qryBuscaInformacoes.FieldByName('me_valor').AsString, ';', arrOpcoesPessoa );
      
      for I := 0 to arrOpcoes.Count - 1 do
      begin
         checkBox := TCheckBox.Create( sbAdicionais );
         checkBox.Parent := sbAdicionais;
         checkBox.Width := sbAdicionais.Width - 34;
         checkBox.Left := 12;
         checkBox.Top := 5 + ( I * 23 );
         checkBox.Name := NOME_LISTA_COMPONENTE + IntToStr( I );
         checkBox.Caption := arrOpcoes[I];
         checkBox.Checked := ( arrOpcoesPessoa.IndexOf( arrOpcoes[I] ) > -1 );
         checkBox.OnClick := SalvarAlteracoes;
      end;         
   end;
end;

procedure TfrmAdicionaisSelecao.salvarAlteracoes(Sender: TObject);
const
   SQL_SALVAR_ALTERACOES =
      ' REPLACE INTO pessoas_deficiencias_completo( cd_pessoa, cd_campo, me_valor ) ' +
      ' VALUES ( :cd_pessoa, :cd_campo, :me_valor ) ';
var
   I: Integer;
   qyUpdate: TUMZQuery;
   me_valor, Separador: string;
begin

   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyUpdate);

   qyUpdate.SQL.Text := SQL_SALVAR_ALTERACOES;
   
   qyUpdate.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyUpdate.ParamByName('cd_campo').AsInteger := cd_campo;

   if ( sbAdicionais.FindComponent( NOME_LISTA_COMPONENTE ) is TRadioGroup ) then
   begin
      me_valor := TRadioGroup(
         sbAdicionais.FindComponent( NOME_LISTA_COMPONENTE ) ).Items[
            TRadioGroup( sbAdicionais.FindComponent( NOME_LISTA_COMPONENTE ) ).ItemIndex
         ];
   end
   else
   begin

      Separador := '';
      
      for I := 0 to sbAdicionais.ComponentCount - 1 do
      begin
         if not ( sbAdicionais.Components[I] is TCheckBox ) OR
            ( not TCheckBox( sbAdicionais.Components[I] ).Checked ) then Continue;

         me_valor := me_valor + Separador + TCheckBox( sbAdicionais.Components[I] ).Caption;
         Separador := ';';
      end;
   end;

   qyUpdate.ParamByName('me_valor').AsString := me_valor;
   qyUpdate.ExecSQL;   

   for I := 0 to frm_pessoas_adicional.sxDados.ComponentCount -1 do
   begin
      if frm_pessoas_adicional.sxDados.Components[I] is TEdit then
      begin
         if TEdit(frm_pessoas_adicional.sxDados.Components[I]).Name = 'Campo'+InttoStr(nm_campo) then
         begin
            TEdit(frm_pessoas_adicional.sxDados.Components[I]).Text := me_valor;
         end;
      end;
   end;
end;

procedure TfrmAdicionaisSelecao.Setcd_campo(const Value: Integer);
begin
  Fcd_campo := Value;
end;

procedure TfrmAdicionaisSelecao.Setcd_pessoa(const Value: Integer);
begin
  Fcd_pessoa := Value;
end;

procedure TfrmAdicionaisSelecao.Setnm_campo(const Value: Integer);
begin
  Fnm_campo := Value;
end;

procedure TfrmAdicionaisSelecao.SpeedButton1Click(Sender: TObject);
begin
   Self.Close;
end;

end.
