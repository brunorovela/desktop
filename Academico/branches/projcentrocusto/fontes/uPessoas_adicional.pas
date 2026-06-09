unit uPessoas_adicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, uDM, Mask, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UZConnection,
  Grids, DBGrids,General, DBCtrls, uAdicionaisSelecao, uUsuario, UMComboBox,
  UMEditNumerico, UMEditMonetario;

type
  Tfrm_pessoas_adicional = class(TForm)
    Panel1: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    qyCampos: TUMZQuery;
    qyCamposCD_CAMPO: TIntegerField;
    qyCamposDS_CAMPO: TStringField;
    qyCamposDS_CAMPO_DESCRICAO: TStringField;
    qyCamposDS_TIPO: TStringField;
    qyCamposDS_PESSOA: TStringField;
    qyCamposNR_ORDEM: TIntegerField;
    sxDados: TScrollBox;
    qyCadastroCampos_Opcoes: TUMZQuery;
    qyCadastroCampos_Opcoescd_opcao: TIntegerField;
    qyCadastroCampos_Opcoesds_opcao: TStringField;
    qyCadastroCampos_Opcoesme_sql: TMemoField;
    qyCadastroCampos_Opcoesme_opcoes: TMemoField;
    qyCadastroCampos_Opcoesds_conteudo: TStringField;
    tcExtras: TTabControl;
    qyCategorias: TUMZQuery;
    qyCamposDS_CATEGORIA: TStringField;
    pnlConcursos: TPanel;
    qryConcursos: TUMZQuery;
    ds_concurso: TDataSource;
    dbgConcursos: TDBGrid;
    qryConcursoscd_concurso: TLargeintField;
    qryConcursosTipo: TStringField;
    qryConcursosNome: TStringField;
    qryConcursosdt_cadastro: TDateTimeField;
    qryConcursosSituacao: TStringField;
    qryGrupos: TUMZQuery;
    qryGruposds_nome_grupo: TStringField;
    dsGrupos: TDataSource;
    pnlGrupos: TPanel;
    dbgGrupos: TDBGrid;
    qryGruposnm_coligada: TStringField;
    bbtnRemoverGrupo: TBitBtn;
    qyCamposcd_opcao: TIntegerField;
    pnlDDA: TPanel;
    lblConta: TLabel;
    dbConta: TDBEdit;
    dbAgencia: TDBEdit;
    Label1: TLabel;
    dbBanco: TDBEdit;
    lblBanco: TLabel;
    dbDocumento: TDBEdit;
    Label3: TLabel;
    rgSim: TRadioButton;
    lblDDA: TLabel;
    rgNao: TRadioButton;
    qryDDA: TUMZQuery;
    dsDDA: TDataSource;
    qryDDAnr_conta_corrente: TStringField;
    qryDDAds_banco: TStringField;
    qryDDAnr_agencia: TStringField;
    qryDDAnr_documento: TStringField;
    qryDDAsn_autoriza_debito: TSmallintField;
    qryDDAcd_pessoa: TIntegerField;
    SpeedButton1: TSpeedButton;
    QryLogGeral: TUMZQuery;
    qryConcursosds_area: TStringField;
    edExemploNumerico: TUMEditNumerico;
    lbNumerico: TLabel;
    procedure rgNaoClick(Sender: TObject);
    procedure rgSimClick(Sender: TObject);
    procedure bbtnRemoverGrupoClick(Sender: TObject);
    procedure tcExtrasChange(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    pessoa : integer;
    tipo : String;
    nm_campo: integer;
    procedure bloqueiaDDA(bHabilitar: Boolean);
    procedure cadastroOpcoes(Sender: TObject);
    procedure onExit(Sender: TObject);

    function validaCategoria(cd_acao: Integer; nivelPermissao: TUMNivelPermissao): Boolean;
    function getValorAdicionaisSelecao( cd_campo, cd_pessoa: Integer): String;
    
  public
    { Public declarations }


    function Montar_Dados(tipo_pessoa : string; codigo_pessoa : Integer) : boolean;
    procedure pular_campo(Sender: TObject; var Key: Char);
    Function explode(str,separator : string): TStringList;


end;

var
  frm_pessoas_adicional: Tfrm_pessoas_adicional;



implementation

uses DateUtils, uOpcoesItens, WideStrings;

{$R *.dfm}

{ Tfrm_pessoas_adicional }

function Tfrm_pessoas_adicional.Montar_Dados(tipo_pessoa: string;
  codigo_pessoa: Integer): boolean;
var
   intTopo : integer;
   iPosicaoSeparador : Integer;
   iContadorSrings : Integer;
   sSqlOriginal : string;
   sConteudo: string;
   lstItens : TStringList;
   qyConsultaLista,qryOrigem : TUMZQuery;
   sResultSQl : string;
   sChave : string  ;
   sValor : string  ;
   categoria_atual : string;

   permInserir,
   permEditar: Boolean;
begin
   nm_campo := 1;
   dm.CriarConsulta(qryOrigem);

   qryOrigem.SQL.Text :=
   ' SELECT                   '+
   '   cd_layout              '+
   ' FROM                     '+
   '   rem_layouts            '+
   ' WHERE                    '+
   '   cd_origem = 3          ';

   qryOrigem.Open;

   pessoa := codigo_pessoa;
   tipo := tipo_pessoa;

   qyCampos.Close;
   qyCampos.ParamByName('tipo_pessoa').AsString := tipo_pessoa;
   qyCampos.Open;
   qyCampos.First;


   qyCategorias.Close;
   qyCategorias.ParamByName('tipo_pessoa').AsString := tipo_pessoa;
   qyCategorias.Open;

   qryConcursos.Close;
   qryConcursos.ParamByName('cd_pessoa').AsInteger := codigo_pessoa;
   qryConcursos.Open;

   qryGrupos.Close;
   qryGrupos.ParamByName('cd_pessoa').AsInteger := codigo_pessoa;
   qryGrupos.Open;

   qryDDA.Close;
   qryDDA.ParamByName('cd_pessoa').AsInteger := codigo_pessoa;
   qryDDA.Open;

   if ( qryDDAsn_autoriza_debito.AsInteger = 1 ) then
   begin
     rgNao.Checked := false;
     rgSim.Checked := true;
     bloqueiaDDA( True )
   end
   else
   begin
     rgNao.Checked := true;
     rgSim.Checked := false;
     bloqueiaDDA( false )
   end;

   tcExtras.Tabs.Clear();

   while not qyCategorias.Eof do
   begin

      if validaCategoria(qyCategorias.FieldByName('cd_acao').AsInteger, npAcesso) then
      begin
         tcExtras.Tabs.Add(qyCategorias.FieldByName('ds_categoria').AsString);
      end;

      qyCategorias.Next();
   end;

   qyCategorias.First();

   // a categoria atual os campos são visibled:= true;
   categoria_atual := qyCategorias.FieldByName('ds_categoria').AsString;
   
   if categoria_atual = 'Geral' then
   begin
      categoria_atual:= '';
   end;

   // para cada categoria
   while  not qyCategorias.Eof do
   begin
      intTopo := 25;
      pessoa := codigo_pessoa;
      tipo := tipo_pessoa;

      permInserir := validaCategoria(qyCategorias.FieldByName('cd_acao').AsInteger, npIncluir);
      permEditar := validaCategoria(qyCategorias.FieldByName('cd_acao').AsInteger, npAlterar);

      qyCampos.Close;
      
      if (qyCategorias.FieldByName('ds_categoria').asString = 'Geral') then
      begin
            qyCampos.SQL.Text :=
               ' SELECT                                                        '+
               '   *                                                           '+
               ' FROM                                                          '+
               '   PESSOAS_CAMPOS_ADICIONAIS                                   '+
               ' WHERE                                                         '+
               '   DS_PESSOA = :tipo_pessoa AND                                '+
               '   SN_ATIVO = 1 AND                                            '+
               '   DS_CATEGORIA IS NULL                                      '+
               ' ORDER BY NR_ORDEM                                             ';
         qyCampos.ParamByName('tipo_pessoa').AsString := tipo_pessoa;
      end
      else
      begin
         qyCampos.SQL.Text :=
            ' SELECT                                                        '+
            '   *                                                           '+
            ' FROM                                                          '+
            '   PESSOAS_CAMPOS_ADICIONAIS                                   '+
            ' WHERE                                                         '+
            '   DS_PESSOA = :tipo_pessoa AND                                '+
            '   SN_ATIVO = 1 AND                                            '+
            '   DS_CATEGORIA = :ds_categoria                                '+
            ' ORDER BY                                                      '+
            '   DS_CATEGORIA, NR_ORDEM                                      ';
         qyCampos.ParamByName('tipo_pessoa').AsString := tipo_pessoa;
         qyCampos.ParamByName('ds_categoria').AsString := qyCategorias.FieldByName('ds_categoria').asString;
      end;

      qyCampos.Open;

      while not qyCampos.Eof do
      Begin
      nm_campo := nm_campo+1;
      qyCampos.FieldByName('cd_campo').AsInteger;

      if qyCampos.FieldByName('nr_ordem').AsInteger = 1 then
         intTopo := 25;

         { Criar o Label }

         with TLabel.Create(sxDados) do
         Begin
             Parent   := sxDados;
             Left     := 5;
             Width    := 625;
             Top      := intTopo;
             Hint     := qyCampos.FieldByName('ds_categoria').AsString;

             if qyCampos.FieldByName('ds_campo_descricao').AsString <> '' then begin
               Caption := qyCampos.FieldByName('ds_campo').AsString + ' - ' + qyCampos.FieldByName('ds_campo_descricao').AsString;
             end
             else begin
               Caption := qyCampos.FieldByName('ds_campo').AsString;
             end;

             Tag      := qyCampos.FieldByName('cd_campo').AsInteger;
             WordWrap := True;

             if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;
         End;

         if qyCampos.FieldByName('ds_tipo').AsString = 'M' then begin
           { Criar o Memo }

           With TMemo.Create(sxDados) do
           Begin
               Parent  := sxDados;
               Left    := 5;
               Top     := intTopo+15;
               Text    := '';
               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Width   := 590;
               Hint    := qyCampos.FieldByName('ds_categoria').AsString;

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               { Preencher os Dados }

               DM.qAux1.Close;
               Dm.qAux1.SQL.Clear;
               Dm.qAux1.SQL.Add('select * from pessoas_cadastro_memo where cd_pessoa = :pessoa and cd_campo = :campo');
               DM.qAux1.ParamByName('pessoa').AsInteger := codigo_pessoa;
               DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               Dm.qAux1.Open;

               if not DM.qAux1.Eof then
               begin
                  Text := DM.qAux1.FieldByName('ds_conteudo').AsString;

                  Enabled := permEditar;
               end
               else
               begin
                  Text := '';

                  Enabled := permInserir or permEditar;
               end;

               Dm.qAux1.Open;
           end;

           intTopo := intTopo + 91 + 20;
         end
         else if qyCampos.FieldByName('ds_tipo').AsString = 'N' then
         begin
            With TUMEditMonetario.Create(sxDados) do
            Begin
               Parent  := sxDados;
               Left    := 5;
               Top     := intTopo+15;
               Text    := '';
               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Width   := 590;
               Hint    := qyCampos.FieldByName('ds_categoria').AsString;
               OnExit  := Self.onExit;

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               { Preencher os Dados }

               DM.qAux1.Close;
               Dm.qAux1.SQL.Clear;
               Dm.qAux1.SQL.Add('select * from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo');
               DM.qAux1.ParamByName('pessoa').AsInteger := codigo_pessoa;
               DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               Dm.qAux1.Open;

               Text := '';

               if not DM.qAux1.Eof then
               begin
                  Text := DM.qAux1.FieldByName('ds_conteudo').AsString;
                  setValorDouble(DM.qAux1.FieldByName('ds_conteudo').AsString);

                  Enabled := permEditar;
               end
               else
               begin
                  Enabled := permInserir or permEditar;
                  Text := '';
               end;

               Dm.qAux1.Open;
            end;

            intTopo := intTopo + 40;   
         end
         else if qyCampos.FieldByName('ds_tipo').AsString = 'S' then
         begin
            with TUMComboBox.Create(sxDados) do
            begin
               Parent  := sxDados;
               left    := 5 ;
               Top     := intTopo + 15;
               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Style   := csDropDownList;
               Hint    := qyCampos.FieldByName('ds_categoria').AsString;
               Width   := 200;

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               qyCadastroCampos_Opcoes.Close;
               sSqlOriginal :=   qyCadastroCampos_Opcoes.SQL.Text;

               qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_pessoa ='''+IntToStr(codigo_pessoa)+'''');

               qyCadastroCampos_Opcoes.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
               qyCadastroCampos_Opcoes.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               qyCadastroCampos_Opcoes.Open;

               if(qyCadastroCampos_Opcoes.FieldByName('ds_conteudo').AsString <>'') then
               begin
                  sConteudo := qyCadastroCampos_Opcoes.FieldByName('ds_conteudo').AsString ;
               end
               else
               begin
                  qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal + ' LIMIT 1 ';
                  qyCadastroCampos_Opcoes.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
                  qyCadastroCampos_Opcoes.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
                  qyCadastroCampos_Opcoes.close;
                  qyCadastroCampos_Opcoes.Open;
               end;

               if(qyCadastroCampos_Opcoesme_sql.AsString ='') then
               begin
                  lstItens := explode(qyCadastroCampos_Opcoesme_opcoes.AsString,';');
               end
               else
               begin
                  DM.CriarConsulta(qyConsultaLista);
                  qyConsultaLista.SQL.Text := qyCadastroCampos_Opcoesme_sql.AsString;
                  qyConsultaLista.Open;
                  sResultSQl :='';
                  while not(qyConsultaLista.Eof) do
                  begin
                     sResultSQl := sResultSQl+qyConsultaLista.Fields[1].AsString+';';
                     qyConsultaLista.Next;
                  end;
                  lstItens:= explode(sResultSQl,';')
               end;
               
               qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal ;
               
               iContadorSrings := 0;

               Enabled := permEditar or permInserir;

               {Verifica qual item ja deve vir seleciona}
               while lstItens.Count > iContadorSrings do
               begin
                  iPosicaoSeparador := Length( lstItens.Strings[iContadorSrings] );

                  sChave := copy(lstItens.Strings[iContadorSrings], 0, iPosicaoSeparador );
                  sValor := copy(lstItens.Strings[iContadorSrings], 0, iPosicaoSeparador );

                  AddItem( sValor , TOpcoesItens.Create( sChave, sValor ) );
                  
                  if sChave = sConteudo then
                  begin
                     Enabled := permEditar;

                     ItemIndex := iContadorSrings;
                  end;
                     
                  inc(iContadorSrings);
               end;

               lstItens.Free;
               
               if ItemIndex = -1 then
                  ItemIndex := 0;
            end;

            intTopo := intTopo + 23 + 20;

         end
         else if (qyCampos.FieldByName('ds_tipo').AsString = 'U') or (qyCampos.FieldByName('ds_tipo').AsString = 'V') then
         begin

            with TEdit.Create(sxDados) do
            begin
               Parent  := sxDados;

               Left := 5;
               Top := intTopo + 15;

               Height := 21;
               Width := 570;

               Tag := qyCampos.FieldByName('cd_campo').AsInteger;
               Hint := qyCampos.FieldByName('ds_categoria').AsString;

               name := 'Campo' + IntToStr(nm_campo);

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               Text := Self.getValorAdicionaisSelecao(qyCampos.FieldByName('cd_campo').AsInteger, pessoa);
            end;

            with TSpeedButton.Create(sxDados) do
            begin
               Parent   := sxDados;

               Left     := 580;
               Top      := intTopo+15;

               Width    := 23;
               Height   := 21;
               
               Tag      := qyCampos.FieldByName('cd_campo').AsInteger;
               Hint     := qyCampos.FieldByName('ds_categoria').AsString;
               name     := 'btn' + IntToStr(nm_campo);

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               Glyph    := SpeedButton1.Glyph;
               OnClick  := cadastroOpcoes;
            end;

            intTopo := intTopo + 40;

         end
         else begin
           { Criar o MaskEdit }

           With TMaskEdit.Create(sxDados) do
           Begin
               Parent  := sxDados;
               Left    := 5;
               Top     := intTopo+15;

               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Width   := 590;
               Hint    := qyCampos.FieldByName('ds_categoria').AsString;

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               OnKeyPress := pular_campo;

               if qyCampos.FieldByName('ds_tipo').AsString = 'D' then
               Begin
                    EditMask := '!99/99/0000;1; ';
               End
               else
                   EditMask := '';

               { Preencher os Dados }

               DM.qAux1.Close;
               Dm.qAux1.SQL.Clear;
               Dm.qAux1.SQL.Add('select * from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo');
               DM.qAux1.ParamByName('pessoa').AsInteger := codigo_pessoa;
               DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               Dm.qAux1.Open;

               if not DM.qAux1.Eof then
               begin
                  Enabled := permEditar;
                  Text := DM.qAux1.FieldByName('ds_conteudo').AsString
               end
               else
               begin
                  Enabled := permInserir or permEditar;
                  Text := '';
               end;

               Dm.qAux1.Open;

           End;

           intTopo := intTopo + 23 + 20;
         end;

         qyCampos.Next;
      End;
      qyCategorias.Next;
   end;
   bbtnRemoverGrupo.Enabled :=  DM.UsuarioLogado.TemPermissao( 3001, npEspecial, false );
   tcExtras.Tabs.Add('Concursos');
   tcExtras.Tabs.Add('Grupos');
   if (( qryOrigem.RecNo > 0) and (tipo_pessoa = 'A')) then
   begin
      tcExtras.Tabs.Add('DA');   
   end;

   tcExtras.OnChange(nil);
   ShowModal;
   Result := True;

end;

procedure Tfrm_pessoas_adicional.onExit(Sender: TObject);
begin
   if TUMEditMonetario(Sender).getValorDouble = 0 then
   begin
      TUMEditMonetario(Sender).Text := '';
   end;
end;

Function Tfrm_pessoas_adicional.explode(str , separator : string):TStringList;
var
   p : Integer;
begin
   Result := TstringList.create;
   p := Pos(separator,str);
   while(p >0)do
   begin
      Result.Add(Copy(str,1,p-1));
      Delete(str,1,p+length(separator)-1);
      p:= Pos(separator,str);
   end;
   if(str <>'') then
   begin
      result.add(str)
   end;
end;

procedure Tfrm_pessoas_adicional.pular_campo(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;

procedure Tfrm_pessoas_adicional.rgNaoClick(Sender: TObject);
begin
  bloqueiaDDA(false);
end;

procedure Tfrm_pessoas_adicional.rgSimClick(Sender: TObject);
begin
  bloqueiaDDA(true);
end;

procedure Tfrm_pessoas_adicional.bloqueiaDDA( bHabilitar : Boolean );
begin
  dbConta.Enabled   := bHabilitar;
  dbAgencia.Enabled := bHabilitar;
  dbBanco.Enabled   := bHabilitar;
  dbDocumento.Enabled := bHabilitar;
end;

procedure Tfrm_pessoas_adicional.tcExtrasChange(Sender: TObject);
var
   categoria_atual : String;
   i, iIndiceAtual : integer;
begin
   categoria_atual := tcExtras.Tabs.Strings[tcExtras.tabIndex];

   if categoria_atual = 'Geral' then begin
      categoria_atual:= '';
   end;
   if categoria_atual = 'Concursos' then
   begin
      qryConcursos.Close;
      qryConcursos.Open;
      pnlConcursos.Visible := true;
      pnlGrupos.Visible    := false;
      pnlDDA.Visible       := false;
   end
   else if categoria_atual = 'Grupos' then
   begin
      qryGrupos.Close;
      qryGrupos.Open;
      pnlGrupos.Visible := true;
      pnlConcursos.Visible := false;
      pnlDDA.Visible       := false;
   end
   else if categoria_atual = 'DA' then
   begin
      pnlDDA.Visible       := true;
      pnlGrupos.Visible    := false;
      pnlConcursos.Visible := false;
   end
   else
   begin
      pnlDDA.Visible       := false;
      pnlGrupos.Visible    := false;
      pnlConcursos.Visible := false;
   end;


   for i:= 0 to sxDados.ComponentCount - 1 do
   Begin
       { verificar se o componente é um MASKEDIT }
       if sxDados.Components[i] is TLabel then
       Begin
          TLabel(sxDados.Components[i]).Visible := TLabel(sxDados.Components[i]).Hint = categoria_atual;
       end
       else if sxDados.Components[i] is TMaskEdit then
       Begin
          TMaskEdit(sxDados.Components[i]).Visible := TMaskEdit(sxDados.Components[i]).Hint = categoria_atual;
       End
       else if sxDados.Components[i] is TUMComboBox then
       begin
          TUMComboBox(sxDados.Components[i]).Visible := TUMComboBox(sxDados.Components[i]).Hint = categoria_atual;
       end

       { verificar se o componente é um Memo }
       else if sxDados.Components[i] is TMemo then
       Begin
          TMemo(sxDados.Components[i]).Visible := TMemo(sxDados.Components[i]).Hint = categoria_atual;
       End
       else if sxDados.Components[i] is TEdit then
       Begin
          TEdit(sxDados.Components[i]).Visible := TEdit(sxDados.Components[i]).Hint = categoria_atual;
       End
       else if sxDados.Components[i] is TSpeedButton then
       Begin
          TSpeedButton(sxDados.Components[i]).Visible := TSpeedButton(sxDados.Components[i]).Hint = categoria_atual;
       End;
   End;     

end;

function Tfrm_pessoas_adicional.validaCategoria(cd_acao: Integer; nivelPermissao: TUMNivelPermissao): Boolean;
var
   qryBuscaChave: TUMZReadOnlyQuery;
const
   SQL_BUSCA_CHAVE =
      'SELECT ' +
      '	CONCAT(nm.ds_chave, ''.'', nma.ds_chave) AS chave ' +
      'FROM ' +
      '	nu_modulos_acoes AS nma ' +
      'INNER JOIN nu_modulos AS nm ON( ' +
      ' 	nm.cd_modulo = nma.cd_modulo ' +
      ') ' +
      'WHERE ' +
      '	nma.cd_acao = :cd_acao';
begin
   Result := True;

   DM.CriarConsulta(qryBuscaChave);

   qryBuscaChave.SQL.Text := SQL_BUSCA_CHAVE;
   qryBuscaChave.ParamByName('cd_acao').AsInteger := cd_acao;
   qryBuscaChave.Open;

   if qryBuscaChave.RecordCount > 0 then
   begin
      Result := DM.UsuarioLogado.TemPermissao(
         DM.UsuarioLogado.Pessoa.Codigo,
         qryBuscaChave.FieldByName('chave').AsString,
         nivelPermissao,
         False);

      Exit;
   end;

   Result := False;
end;

procedure Tfrm_pessoas_adicional.btConfirmarClick(Sender: TObject);
var
   i : Integer;
   iIndiceAtual : Integer;
   iContadorObjetos :  Integer  ;
   qyAux3, qyAux4 : TUMZQuery;
begin
   if( tcExtras.Tabs.Strings[tcExtras.TabIndex] =  'DA' ) then
   begin
      if ( qryDDA.State <> dsInsert ) and ( qryDDA.State <> dsEdit ) then
      begin
        if ( qryDDA.RecNo > 0 ) then
        begin
          qryDDA.Edit;
        end
        else
        begin
          qryDDA.Insert;
        end;
      end;
       
      if ( rgSim.Checked ) then
      begin
        qryDDAsn_autoriza_debito.AsInteger := 1
      end
      else
      begin
        qryDDAsn_autoriza_debito.AsInteger := 0;
      end;

      if qryDDAcd_pessoa.AsInteger = 0 then
      begin
        qryDDAcd_pessoa.AsInteger := pessoa;       
      end;


      if ( qryDDA.State = dsInsert ) or ( qryDDA.State = dsEdit ) then
        qryDDA.Post;
   end
   else
   begin
     DM.CriarConsulta(qyAux3);
     DM.CriarConsulta(qyAux4);
     { Salvar os Campos Preenchidos }

     DM.qAux1.Close;
     Dm.qAux1.SQL.Clear;
     DM.qAux1.SQL.Text := 'delete from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo';

     DM.qAux2.Close;
     Dm.qAux2.SQL.Clear;
     DM.qAux2.SQL.Text := 'insert into pessoas_cadastro (cd_pessoa, cd_campo, ds_conteudo)';
     DM.qAux2.SQL.Add(' values (:pessoa, :campo, :conteudo) ');

     qyAux3.Close;
     qyAux3.SQL.Clear;
     qyAux3.SQL.Text := 'delete from pessoas_cadastro_memo where cd_pessoa = :pessoa and cd_campo = :campo';

     qyAux4.Close;
     qyAux4.SQL.Clear;
     qyAux4.SQL.Text := 'insert into pessoas_cadastro_memo (cd_pessoa, cd_campo, ds_conteudo)';
     qyAux4.SQL.Add(' values (:pessoa, :campo, :conteudo) ');

     for i:= 0 to sxDados.ComponentCount - 1 do
     Begin
         { verificar se o componente é um MASKEDIT }
         if sxDados.Components[i] is TMaskEdit then
         Begin
            { Apagar o valor anterior se houver }
            Dm.qAux1.ParamByName('pessoa').AsInteger := pessoa;
            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            Dm.qAux2.ParamByName('pessoa').AsInteger := pessoa;
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            Dm.qAux2.ParamByName('conteudo').AsString := TMaskEdit(sxDados.Components[i]).Text;
            DM.qAux2.ExecSQL;
         End {SENÂO verifica se é comboBox}
         else if sxDados.Components[i] is TUMComboBox then
         begin
            iIndiceAtual := (sxDados.Components[i] as TUMComboBox).ItemIndex;

            {SQL de campos e para os cursos}
            DM.qAux1.SQL.Text := 'delete from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo';
            DM.qAux2.SQL.Text := 'insert into pessoas_cadastro (cd_pessoa, cd_campo, ds_conteudo)';
            DM.qAux2.SQL.Add(' values (:pessoa, :campo, :conteudo) ');

            Dm.qAux1.ParamByName('pessoa').AsInteger := pessoa;
            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            Dm.qAux2.ParamByName('pessoa').AsInteger := pessoa;
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

            if (sxDados.Components[i] as TUMComboBox).Items.Count > 0 then
            begin
               Dm.qAux2.ParamByName('conteudo').AsString := ((sxDados.Components[i] as TUMComboBox).items.objects[iIndiceAtual] as TOpcoesItens).getDescricao;
            end
            else
            begin
               Dm.qAux2.ParamByName('conteudo').AsString := '';
            end;
               
            DM.qAux2.ExecSQL;

            for iContadorObjetos := (sxDados.Components[i] as TUMComboBox).Items.Count - 1 downto 0 do
            begin
              ((sxDados.Components[i] as TUMComboBox).Items.Objects[iContadorObjetos] as TOpcoesItens).Free;
            end;
            //desaloca objetos
         end
         { verificar se o componente é um EDITMonetario }
         else if sxDados.Components[i] is TUMEditMonetario then
         begin
            {SQL de campos e para os cursos}
            DM.qAux1.SQL.Text := 'delete from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo';
            DM.qAux2.SQL.Text := 'insert into pessoas_cadastro (cd_pessoa, cd_campo, ds_conteudo)';
            DM.qAux2.SQL.Add(' values (:pessoa, :campo, :conteudo) ');

            Dm.qAux1.ParamByName('pessoa').AsInteger := pessoa;
            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            Dm.qAux2.ParamByName('pessoa').AsInteger := pessoa;
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux2.ParamByName('conteudo').AsString := TUMEditMonetario(sxDados.Components[i]).getValorString;
            DM.qAux2.ExecSQL;
         end
         { verificar se o componente é um MEMO }
         else if sxDados.Components[i] is TMemo then
         Begin
            { Apagar o valor anterior se houver }
            qyAux3.ParamByName('pessoa').AsInteger := pessoa;
            qyAux3.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            qyAux3.ExecSQL;

            { Inserir o novo valor }
            qyAux4.ParamByName('pessoa').AsInteger := pessoa;
            qyAux4.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            qyAux4.ParamByName('conteudo').AsString := TMemo(sxDados.Components[i]).Text;
            qyAux4.ExecSQL;
         End;
     End;
     close;
   end;
end;

procedure Tfrm_pessoas_adicional.cadastroOpcoes(Sender: TObject);
var
   i: Integer;
   S: String;
Begin

   S := '';
   for I := 1 To Length(TSpeedButton(Sender).Name) Do
   begin
      if (TSpeedButton(Sender).Name[I] in ['0'..'9']) then
      begin
         S := S + Copy(TSpeedButton(Sender).Name, I, 1);
      end;
   end;
   
   if ( frmAdicionaisSelecao = nil ) then
   begin
      Application.CreateForm( TFrmAdicionaisSelecao, frmAdicionaisSelecao );
   end;

   frmAdicionaisSelecao.cd_pessoa := pessoa;
   frmAdicionaisSelecao.cd_campo := TSpeedButton(Sender).tag;
   frmAdicionaisSelecao.nm_campo := StrToInt(S);

   frmAdicionaisSelecao.ShowModal;




   for I := 0 to TSpeedButton(Sender).Parent.Parent.ComponentCount - 1 do
   begin
      if ( TSpeedButton(Sender).Parent.Parent.Components[I] is TEdit )
         and ( TEdit(TSpeedButton(Sender).Parent.Parent.Components[I]).Tag = TSpeedButton(Sender).tag) then
      begin
         TEdit( TSpeedButton(Sender).Parent.Parent.Components[I] ).Text :=
            Self.getValorAdicionaisSelecao(TSpeedButton(Sender).tag, pessoa);

         Break;
      end;
   end;
end;

procedure Tfrm_pessoas_adicional.bbtnRemoverGrupoClick(Sender: TObject);
var
   qryExcluiGrupos,qryAux: TUMZQuery;
   observacao,gruposExcluidos: String;
   i:integer;
begin
   if(Mensagem('Esta ação remove todos os grupos que o usuário está vinculado.'+
      ' Alguns grupos possuem rotinas de inclusão automática sendo '           +
      'que o usuário poderá ser vinculado novamente em breve. '                +
      'Tem certeza que deseja prosseguir?',  'Atenção',
      MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2 , Handle)= mrYes) then
   begin
      DM.CriarConsulta(qryAux);
      qryAux.SQL.Text :=
      ' SELECT cd_grupo           '+
      ' FROM                      '+
      '   nu_grupos_pessoas       '+
      ' WHERE                     '+
      '   cd_pessoa = '+IntToStr(pessoa);
      qryAux.Open;

      qryAux.First;
      gruposExcluidos := '';
      While not (qryAux.Eof) do
      begin
         gruposExcluidos := gruposExcluidos + qryAux.FieldByName('cd_grupo').AsString;
         qryAux.Next;
         if not qryAux.Eof then
            gruposExcluidos := gruposExcluidos + ',';
      end;


      DM.CriarConsulta(qryExcluiGrupos);
      qryExcluiGrupos.SQL.Text := ' '+
      ' DELETE                    '+
      ' FROM                      '+
      '   nu_grupos_pessoas       '+
      ' WHERE                     '+
      '   cd_pessoa = '+IntToStr(pessoa);
      qryExcluiGrupos.ExecSQL;
      qryExcluiGrupos.Free;
      qryGrupos.Close;
      qryGrupos.Open;

      with QryLogGeral do
      begin

         observacao := 'Pessoa ' + inttostr(pessoa) + ' removida dos grupos: ' + gruposExcluidos;

         ParamByName('PESSOA').value := pessoa;
         ParamByName('USUARIO').value  := dm.GetUsuarioLogado.Pessoa.Codigo;
         ParamByName('DATALOG').value := Now;
         ParamByName('MODULO').value := 53;
         ParamByName('CHAVE').value := inttostr(pessoa) + ';'
            + inttostr(dm.GetUsuarioLogado.Pessoa.Codigo)
            + ';' + DateTimeToStr(Now) ;
         ParamByName('ACAO').value := Null;
         ParamByName('OPERACAO').value := 4;
         ParamByName('COLIGADA').value := DM.UsuarioLogado.GetColigadaLogada.Codigo;
         ParamByName('OBSERVACAO').value := observacao;
         ExecSQL;
      end;



   end;


end;

procedure Tfrm_pessoas_adicional.btCancelarClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_pessoas_adicional.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
end;

function Tfrm_pessoas_adicional.getValorAdicionaisSelecao(cd_campo,
  cd_pessoa: Integer): String;
const
   SQL_BUSCA_INFORMACOES = ''+
      ' SELECT '+
      ' REPLACE(pdc.me_valor, '';'', '', '') AS valor '+
      ' FROM pessoas_deficiencias_completo pdc WHERE pdc.cd_pessoa = :cd_pessoa '+
      ' AND pdc.cd_campo = :cd_campo ';
var
   qyBuscaInformacoes: TUMZQuery;
begin
   DM.CriarConsulta(qyBuscaInformacoes);

   qyBuscaInformacoes.SQL.Text := SQL_BUSCA_INFORMACOES;

   qyBuscaInformacoes.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyBuscaInformacoes.ParamByName('cd_campo').AsInteger := cd_campo;

   qyBuscaInformacoes.Open;

   Result := qyBuscaInformacoes.FieldByName('valor').AsString;
end;

end.
