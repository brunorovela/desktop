unit uPessoas_adicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, uDM, Mask, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UZConnection,
  Grids, DBGrids,General, DBCtrls, uAdicionaisSelecao, uUsuario, UMComboBox,
  UMEditNumerico, UMEditMonetario, uFSelecionarPessoa, CheckLst;

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
    qryConcursosarea_final: TStringField;
    qryGruposcd_grupo_pessoa: TIntegerField;
    qryGruposcd_grupo: TIntegerField;
    procedure rgNaoClick(Sender: TObject);
    procedure rgSimClick(Sender: TObject);
    procedure bbtnRemoverGrupoClick(Sender: TObject);
    procedure tcExtrasChange(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    codigo : integer;
    tipo : String;
    nm_campo: integer;
    procedure gravarMemo(componente: TComponent);
    procedure gravarCheckListBox(componente: TComponent);
    procedure gravarEditMonetario(componente: TComponent);
    procedure gravarComboBox(componente: TComponent);
    procedure gravarMaskEdit(componente: TComponent);
    procedure bloqueiaDDA(bHabilitar: Boolean);
    procedure cadastroOpcoes(Sender: TObject);
    procedure onClickCampoBuscaPessoas(Sender: TObject);
    procedure onExit(Sender: TObject);

    function validaCategoria(cd_acao: Integer; nivelPermissao: TUMNivelPermissao): Boolean;
    function getValorAdicionaisSelecao( cd_campo, cd_pessoa: Integer): String;

  protected
    resultado_filtro : TResultadoFiltroPessoa;
    arrayBuscaPessoas: array of integer;
  public
    { Public declarations }


    function Montar_Dados(tipo_pessoa : string; codigo_pessoa : Integer; mostraGrupoConcurso: Boolean = true) : boolean;
    procedure pular_campo(Sender: TObject; var Key: Char);
    Function explode(str,separator : string): TStringList;


end;

var
  frm_pessoas_adicional: Tfrm_pessoas_adicional;



implementation

uses DateUtils, uOpcoesItens, WideStrings,uItemCombo;

{$R *.dfm}

{ Tfrm_pessoas_adicional }

function Tfrm_pessoas_adicional.Montar_Dados(tipo_pessoa: string;
  codigo_pessoa: Integer; mostraGrupoConcurso: Boolean = true): boolean;
var
   intTopo, j, i, iIndiceAtual : integer;
   iPosicaoSeparador : Integer;
   iContadorSrings : Integer;
   sSqlOriginal : string;
   sConteudo: string;
   lstItens, lstCheckList: TStringList;
   qyConsultaLista,qryOrigem : TUMZQuery;
   sResultSQl : string;
   sChave : string  ;
   sValor : string  ;
   categoria_atual : string;

   permInserir,
   permEditar: Boolean;
begin
   nm_campo := 1;
   SetLength(arrayBuscaPessoas, 10000);
   dm.CriarConsulta(qryOrigem);

   qryOrigem.SQL.Text :=
   ' SELECT                   '+
   '   cd_layout              '+
   ' FROM                     '+
   '   rem_layouts            '+
   ' WHERE                    '+
   '   cd_origem = 3          ';

   qryOrigem.Open;

   codigo := codigo_pessoa;
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
      codigo := codigo_pessoa;
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
               if (tipo = 'C') then
               begin
                  Dm.qAux1.SQL.Add('select * from contatos_cadastro_memo where cd_informacao = :pessoa and cd_campo = :campo');
               end else begin
                  Dm.qAux1.SQL.Add('select * from pessoas_cadastro_memo where cd_pessoa = :pessoa and cd_campo = :campo');
               end;

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
               if (tipo = 'C') then
               begin
                  Dm.qAux1.SQL.Add('select * from contatos_cadastro where cd_informacao = :pessoa and cd_campo = :campo');
               end else begin
                  Dm.qAux1.SQL.Add('select * from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo');
               end;

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

               if (tipo = 'C') then
               begin
                qyCadastroCampos_Opcoes.SQL.Text := StringReplace(
                     qyCadastroCampos_Opcoes.SQL.Text,
                     'pessoas_cadastro',
                     'contatos_cadastro',
                     [rfReplaceAll]
                   );
               end;
               
               qyCadastroCampos_Opcoes.Close;
               sSqlOriginal := qyCadastroCampos_Opcoes.SQL.Text;

               if (tipo = 'C') then
               begin
                  qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_informacao =''' + IntToStr(codigo) + '''');
               end
               else
               begin
                  qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_pessoa =''' + IntToStr(codigo) + '''');
               end;

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

               Text := Self.getValorAdicionaisSelecao(qyCampos.FieldByName('cd_campo').AsInteger, codigo);
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
         else if qyCampos.FieldByName('ds_tipo').AsString = 'P' then
         begin


           With TMaskEdit.Create(sxDados) do
           Begin
               Parent  := sxDados;
               Left    := 5;
               Top     := intTopo+15;

               arrayBuscaPessoas[qyCampos.FieldByName('cd_campo').AsInteger] := -1;

               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Width   := 500;
               Hint    := qyCampos.FieldByName('ds_categoria').AsString;

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               OnKeyPress := pular_campo;
               EditMask := '';
               Enabled := True;
               ReadOnly := True;


               with TSpeedButton.Create(sxDados) do
               begin
                  Parent   := sxDados;

                  Left     := 510;
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
                  OnClick  := onClickCampoBuscaPessoas;
               end;

               { Preencher os Dados }

               DM.qAux1.Close;
               Dm.qAux1.SQL.Clear;

               if (tipo = 'C') then
               begin
                  Dm.qAux1.SQL.TEXT := '        '+
                  'SELECT                       '+
                  '  p.cd_pessoa,               '+
                  '  p.nm_pessoa,               '+
                  '  pc.cd_campo,               '+
                  '  pc.ds_conteudo             '+
                  'FROM                         '+
                  '  contatos_cadastro pc        '+
                  '  INNER JOIN pessoas p ON (pc.ds_conteudo = p.cd_pessoa) '+
                  'WHERE                        '+
                  '  pc.cd_informacao = :pessoa '+
                  '  AND pc.cd_campo = :campo   ';
               end else begin
                  Dm.qAux1.SQL.TEXT := '        '+
                  'SELECT                       '+
                  '  p.cd_pessoa,               '+
                  '  p.nm_pessoa,               '+
                  '  pc.cd_campo,               '+
                  '  pc.ds_conteudo             '+
                  'FROM                         '+
                  '  pessoas_cadastro pc        '+
                  '  INNER JOIN pessoas p ON (pc.ds_conteudo = p.cd_pessoa) '+
                  'WHERE                        '+
                  '  pc.cd_pessoa = :pessoa     '+
                  '  AND pc.cd_campo = :campo   ';
               end;

               DM.qAux1.ParamByName('pessoa').AsInteger := codigo_pessoa;
               DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               Dm.qAux1.Open;

               if not DM.qAux1.Eof then
               begin
                  Text := DM.qAux1.FieldByName('cd_pessoa').AsString + ' - ' + DM.qAux1.FieldByName('nm_pessoa').AsString
               end
               else
               begin
                  Text := '';
               end;

               Dm.qAux1.Open;

           End;

           intTopo := intTopo + 23 + 20;

         end
         else
         if qyCampos.FieldByName('ds_tipo').AsString = 'X' then
         begin
            with TCheckListBox.Create(sxDados) do
            begin
               Parent  := sxDados;
               left    := 5 ;
               Top     := intTopo + 15;
               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Hint    := qyCampos.FieldByName('ds_categoria').AsString;
               Width   := 200;
               name    := 'ckl' + IntToStr(nm_campo);

               if categoria_atual = qyCampos.FieldByName('ds_categoria').AsString then
                  Visible := true
               else
                  Visible := false;

               qyCadastroCampos_Opcoes.Close;
               
               if (tipo = 'C') then
               begin
                qyCadastroCampos_Opcoes.SQL.Text := StringReplace(
                     qyCadastroCampos_Opcoes.SQL.Text,
                     'pessoas_cadastro',
                     'contatos_cadastro',
                     [rfReplaceAll]
                   );
               end;

               sSqlOriginal :=   qyCadastroCampos_Opcoes.SQL.Text;

               if (tipo = 'C') then
               begin
                  qyCadastroCampos_Opcoes.SQL.add(
                     ' AND ctc.cd_informacao ='''
                     + IntToStr(codigo_pessoa)
                     + ''''
                  );
               end else begin
                  qyCadastroCampos_Opcoes.SQL.add(
                     ' AND ctc.cd_pessoa ='''
                     + IntToStr(codigo_pessoa)
                     + ''''
                  );
               end;

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
                  lstItens := explode(qyCadastroCampos_Opcoesme_opcoes.AsString,'[;]');
                  lstCheckList := explode(sConteudo, '[;]');
               end
               else
               begin
                  DM.CriarConsulta(qyConsultaLista);
                  qyConsultaLista.SQL.Text := qyCadastroCampos_Opcoesme_sql.AsString;
                  qyConsultaLista.Open;
                  sResultSQl :='';
                  
                  while not(qyConsultaLista.Eof) do
                  begin
                     sResultSQl := sResultSQl+qyConsultaLista.Fields[1].AsString+'[;]';
                     qyConsultaLista.Next;
                  end;
                  lstItens:= explode(sResultSQl,'[;]');
                  lstCheckList := explode(sConteudo, '[;]');
               end;

               qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal ;

               iContadorSrings := 0;

               Enabled := permEditar or permInserir;

               while lstItens.Count > iContadorSrings do
               begin
                  iPosicaoSeparador := Length( lstItens.Strings[iContadorSrings] );

                  sChave := copy(
                     lstItens.Strings[iContadorSrings],
                     0,
                     iPosicaoSeparador
                  );

                  sValor := copy(
                     lstItens.Strings[iContadorSrings],
                     0,
                     iPosicaoSeparador
                  );

                  AddItem( sValor , TOpcoesItens.Create( sChave, sValor ) );

                  Enabled := permEditar;
                  ItemIndex := iContadorSrings;

                  for j := 0 to lstCheckList.Count - 1 do
                  begin
                     iIndiceAtual := ItemIndex;
                     if ( sChave = lstCheckList.Strings[j] ) then
                     begin
                        Checked[iIndiceAtual] := True;
                     end;
                  end;

                  inc(iContadorSrings);
               end;

               lstItens.Free;

               if ItemIndex = -1 then
               begin
                  ItemIndex := 0;
               end;
               
               intTopo := intTopo + 23 + 20;

            end;
         end
         else if qyCampos.FieldByName('ds_tipo').AsString = 'C' then
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

               if (tipo = 'C') then
               begin
                qyCadastroCampos_Opcoes.SQL.Text := StringReplace(
                     qyCadastroCampos_Opcoes.SQL.Text,
                     'pessoas_cadastro',
                     'contatos_cadastro',
                     [rfReplaceAll]
                   );
               end;
               
               qyCadastroCampos_Opcoes.Close;
               sSqlOriginal := qyCadastroCampos_Opcoes.SQL.Text;

               if (tipo = 'C') then
               begin
                  qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_informacao =''' + IntToStr(codigo) + '''');
               end
               else
               begin
                  qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_pessoa =''' + IntToStr(codigo) + '''');
               end;

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

               DM.CriarConsulta(qyConsultaLista);
               qyConsultaLista.SQL.Text := qyCadastroCampos_Opcoesme_sql.AsString;
               qyConsultaLista.Open;
               sResultSQl :='';
               while not(qyConsultaLista.Eof) do
               begin
                  I :=
                     Items.AddObject(
                        qyConsultaLista.Fields[1].AsString,
                        TOpcoesItens.Create(
                           qyConsultaLista.Fields[0].AsString,
                           qyConsultaLista.Fields[1].AsString
                        )
                     );

                  if qyConsultaLista.Fields[0].AsString = sConteudo then
                  begin
                     Enabled := permEditar;
                     ItemIndex := I;
                  end;

                  sResultSQl := sResultSQl+qyConsultaLista.Fields[1].AsString+';';
                  qyConsultaLista.Next;
               end;

               qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal ;

               if ItemIndex = -1 then
                  ItemIndex := 0;
            end;

            intTopo := intTopo + 23 + 20;

         end

         else
         begin
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
               
               if (tipo = 'C') then
               begin
                  Dm.qAux1.SQL.Add('select * from contatos_cadastro where cd_informacao = :pessoa and cd_campo = :campo');
               end else begin
                  Dm.qAux1.SQL.Add('select * from pessoas_cadastro where cd_pessoa = :pessoa and cd_campo = :campo');
               end;
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

   if mostraGrupoConcurso = true then
   begin
      tcExtras.Tabs.Add('Concursos');
      tcExtras.Tabs.Add('Grupos');
   end
   else
   begin
     tcExtras.Tabs.Add('');
   end;
   
   if (( qryOrigem.RecNo > 0) and (tipo_pessoa = 'A')) then
   begin
      tcExtras.Tabs.Add('DA');   
   end;

   tcExtras.OnChange(nil);
   ShowModal;
   Result := True;

end;

procedure Tfrm_pessoas_adicional.onClickCampoBuscaPessoas(Sender: TObject);
var
   i: Integer;
   S: String;
Begin

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa, DM.GetAnoSemestreAtual);

   for I := sxDados.ComponentCount - 1 downto 0 do
   begin

      if sxDados.Components[I] is TMaskEdit then
      begin

         if (sxDados.Components[i] as TMaskEdit).Tag = TSpeedButton(Sender).Tag then
         begin

            (sxDados.Components[I] as TMaskEdit).Text :=
               intToStr(resultado_filtro.cd_pessoa) + ' - ' + resultado_filtro.nm_pessoa;

            arrayBuscaPessoas[TSpeedButton(Sender).Tag] := resultado_filtro.cd_pessoa;

         end;
      end;
   end;
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
      qryGrupos.First;
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

       else if sxDados.Components[i] is TCheckListBox  then
       begin
          TCheckListBox(sxDados.Components[i]).Visible := TCheckListBox(sxDados.Components[i]).Hint = categoria_atual;
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
      '  CONCAT(nm.ds_chave, ''.'', nma.ds_chave) AS chave ' +
      'FROM ' +
      '  nu_modulos_acoes AS nma ' +
      'INNER JOIN nu_modulos AS nm ON( ' +
      '  nm.cd_modulo = nma.cd_modulo ' +
      ') ' +
      'WHERE ' +
      '  nma.cd_acao = :cd_acao';
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
   i: Integer;
begin
   if( tcExtras.Tabs.Strings[tcExtras.TabIndex] =  'DA' ) then
   begin
      if ( qryDDA.State <> dsInsert ) and ( qryDDA.State <> dsEdit ) then
      begin
         if ( qryDDA.RecNo > 0 ) then
         begin
            qryDDA.Edit;
         end else begin
            qryDDA.Insert;
         end;
      end;

      if ( rgSim.Checked ) then
      begin
         qryDDAsn_autoriza_debito.AsInteger := 1
      end else begin
         qryDDAsn_autoriza_debito.AsInteger := 0;
      end;

      if qryDDAcd_pessoa.AsInteger = 0 then
      begin
         qryDDAcd_pessoa.AsInteger := codigo;
      end;


      if ( qryDDA.State = dsInsert ) or ( qryDDA.State = dsEdit ) then
         qryDDA.Post;
   end
   else
   begin
      { Salvar os Campos Preenchidos }
      for i:= 0 to sxDados.ComponentCount - 1 do
      begin

         { verificar se o componente é MASKEDIT }
         if sxDados.Components[i] is TMaskEdit then
         begin

            gravarMaskEdit(sxDados.Components[i]);

         { verifica se o componente é COMBOBOX}
         end else if sxDados.Components[i] is TUMComboBox then
         begin

            gravarComboBox(sxDados.Components[i]);

         { verificar se o componente é EDITMONETARIO }
         end else if sxDados.Components[i] is TUMEditMonetario then
         begin

            gravarEditMonetario(sxDados.Components[i]);

         { verificar se o componente é CHECKLISTBOX }            
         end else if sxDados.Components[i] is TCheckListBox then
         begin

            gravarCheckListBox(sxDados.Components[i]);

         { verificar se o componente é MEMO }   
         end else if sxDados.Components[i] is TMemo then
         begin

            gravarMemo(sxDados.Components[i]);
            
         end;
      end;
      close;
   end;
end;

procedure Tfrm_pessoas_adicional.gravarMaskEdit(componente: TComponent);
var
   qrySalvarInformacoes: TUMZQuery;
begin

   DM.CriarConsulta(qrySalvarInformacoes);

   if ( tipo <> 'C' ) then
   begin

      { Apagar o valor anterior se houver }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM pessoas_cadastro WHERE cd_pessoa = :cd_pessoa AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO pessoas_cadastro(cd_pessoa, cd_campo, ds_conteudo) VALUES (:cd_pessoa, :cd_campo, :ds_conteudo)';

      if arrayBuscaPessoas[componente.Tag] > 0 then
      begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := IntToStr(arrayBuscaPessoas[componente.Tag]);
      end else begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := TMaskEdit(componente).Text;
      end;

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   if ( tipo = 'C' ) then
   begin

      {SQL de campos e para os cursos}
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM contatos_cadastro WHERE cd_informacao = :cd_informacao AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO contatos_cadastro (cd_informacao, cd_campo, ds_conteudo) VALUES (:cd_informacao, :cd_campo, :ds_conteudo)';

      if arrayBuscaPessoas[componente.Tag] > 0 then
      begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := IntToStr(arrayBuscaPessoas[componente.Tag]);
      end else begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := TMaskEdit(componente).Text;
      end;

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   FreeAndNil(qrySalvarInformacoes);
   
end;

procedure Tfrm_pessoas_adicional.gravarComboBox(componente: TComponent);
var
   iIndiceAtual, iContadorObjetos: Integer;
   qrySalvarInformacoes: TUMZQuery;
begin

   DM.CriarConsulta(qrySalvarInformacoes);

   iIndiceAtual := (componente as TUMComboBox).ItemIndex;

   if ( tipo <> 'C' ) then
   begin
      { Apagar o valor anterior se houver }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM pessoas_cadastro WHERE cd_pessoa = :cd_pessoa AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO pessoas_cadastro(cd_pessoa, cd_campo, ds_conteudo) VALUES (:cd_pessoa, :cd_campo, :ds_conteudo)';

      if (componente as TUMComboBox).Items.Count > 0 then
      begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := ((componente as TUMComboBox).items.objects[iIndiceAtual] as TOpcoesItens).getCodigo;
      end else begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := '';
      end;

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;


   end;

   if ( tipo = 'C' ) then
   begin
      {SQL de campos e para os cursos}
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM contatos_cadastro WHERE cd_informacao = :cd_informacao AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO contatos_cadastro (cd_informacao, cd_campo, ds_conteudo) VALUES (:cd_informacao, :cd_campo, :ds_conteudo)';

      if (componente as TUMComboBox).Items.Count > 0 then
      begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := ((componente as TUMComboBox).items.objects[iIndiceAtual] as TOpcoesItens).getDescricao;
      end else begin
         qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := '';
      end;

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   for iContadorObjetos := (componente as TUMComboBox).Items.Count - 1 downto 0 do
   begin
      ((componente as TUMComboBox).Items.Objects[iContadorObjetos] as TOpcoesItens).Free;
   end;

   FreeAndNil(qrySalvarInformacoes);
   
end;

procedure Tfrm_pessoas_adicional.gravarEditMonetario(componente: TComponent);
var
   qrySalvarInformacoes: TUMZQuery;
begin

   DM.CriarConsulta(qrySalvarInformacoes);

   if ( tipo <> 'C' ) then
   begin

      { Apagar o valor anterior se houver }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM pessoas_cadastro WHERE cd_pessoa = :cd_pessoa AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO pessoas_cadastro(cd_pessoa, cd_campo, ds_conteudo) VALUES (:cd_pessoa, :cd_campo, :ds_conteudo)';

      qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := TUMEditMonetario(componente).getValorString;
      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   if ( tipo = 'C' ) then
   begin

      {SQL de campos e para os cursos}
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM contatos_cadastro WHERE cd_informacao = :cd_informacao AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO contatos_cadastro (cd_informacao, cd_campo, ds_conteudo) VALUES (:cd_informacao, :cd_campo, :ds_conteudo)';

      qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := TUMEditMonetario(componente).getValorString;      
      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   FreeAndNil(qrySalvarInformacoes);

end;

procedure Tfrm_pessoas_adicional.gravarCheckListBox(componente: TComponent);
var
   j, iIndiceAtual: Integer;
   sAux: String;
   qrySalvarInformacoes: TUMZQuery;
begin

   DM.CriarConsulta(qrySalvarInformacoes);

   if ( tipo <> 'C' ) then
   begin
   
      { Apagar o valor anterior se houver }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM pessoas_cadastro WHERE cd_pessoa = :cd_pessoa AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO pessoas_cadastro(cd_pessoa, cd_campo, ds_conteudo) VALUES (:cd_pessoa, :cd_campo, :ds_conteudo)';

      sAux := '';
      for j := 0 to (componente as TCheckListBox).Count - 1 do
      begin
         iIndiceAtual := (componente as TCheckListBox).ItemIndex;
         if ( (componente as TCheckListBox).Checked[j] ) then
         begin
           if ( sAux <> '' ) then
            begin
               sAux := sAux
               + '[;]'
               + (
                  ( componente as TCheckListBox).items.objects[j] as TOpcoesItens
               ).getDescricao;

            end else
            begin
               sAux := (
                  ( componente as TCheckListBox).items.objects[j] as TOpcoesItens
               ).getDescricao;
            end;
         end;
      end;

      qrySalvarInformacoes.ParamByName('conteudo').AsString := sAux;
      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   if ( tipo = 'C' ) then
   begin

      {SQL de campos e para os cursos}
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM contatos_cadastro WHERE cd_informacao = :cd_informacao AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO contatos_cadastro (cd_informacao, cd_campo, ds_conteudo) VALUES (:cd_informacao, :cd_campo, :ds_conteudo)';

      sAux := '';
      for j := 0 to (componente as TCheckListBox).Count - 1 do
      begin
         iIndiceAtual := (componente as TCheckListBox).ItemIndex;
         if ( (componente as TCheckListBox).Checked[j] ) then
         begin
           if ( sAux <> '' ) then
            begin
               sAux := sAux
               + '[;]'
               + (
                  ( componente as TCheckListBox).items.objects[j] as TOpcoesItens
               ).getDescricao;

            end else
            begin
               sAux := (
                  ( componente as TCheckListBox).items.objects[j] as TOpcoesItens
               ).getDescricao;
            end;
         end;
      end;

      qrySalvarInformacoes.ParamByName('conteudo').AsString := sAux;
      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   FreeAndNil(qrySalvarInformacoes);
   
end;

procedure Tfrm_pessoas_adicional.gravarMemo(componente: TComponent);
var
   qrySalvarInformacoes: TUMZQuery;
begin

   DM.CriarConsulta(qrySalvarInformacoes);

   if ( tipo <> 'C' ) then
   begin
      { Apagar o valor anterior se houver }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM pessoas_cadastro_memo WHERE cd_pessoa = :cd_pessoa AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO pessoas_cadastro_memo(cd_pessoa, cd_campo, ds_conteudo) VALUES (:cd_pessoa, :cd_campo, :ds_conteudo)';

      qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := TMemo(componente).Text;
      qrySalvarInformacoes.ParamByName('cd_pessoa').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   if ( tipo = 'C' ) then
   begin

      {SQL de campos e para os cursos}
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'DELETE FROM contatos_cadastro_memo WHERE cd_informacao = :cd_informacao AND cd_campo = :cd_campo';

      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

      { Inserir o novo valor }
      qrySalvarInformacoes.Close;
      qrySalvarInformacoes.SQL.Clear;
      qrySalvarInformacoes.SQL.Text := 'INSERT INTO contatos_cadastro_memo (cd_informacao, cd_campo, ds_conteudo) VALUES (:cd_informacao, :cd_campo, :ds_conteudo)';

      qrySalvarInformacoes.ParamByName('ds_conteudo').AsString := TMemo(componente).Text;
      qrySalvarInformacoes.ParamByName('cd_informacao').AsInteger := codigo;
      qrySalvarInformacoes.ParamByName('cd_campo').AsInteger := componente.Tag;
      qrySalvarInformacoes.ExecSQL;

   end;

   FreeAndNil(qrySalvarInformacoes);
   
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

   frmAdicionaisSelecao.cd_pessoa := codigo;
   frmAdicionaisSelecao.cd_campo := TSpeedButton(Sender).tag;
   frmAdicionaisSelecao.nm_campo := StrToInt(S);

   frmAdicionaisSelecao.ShowModal;




   for I := 0 to TSpeedButton(Sender).Parent.Parent.ComponentCount - 1 do
   begin
      if ( TSpeedButton(Sender).Parent.Parent.Components[I] is TEdit )
         and ( TEdit(TSpeedButton(Sender).Parent.Parent.Components[I]).Tag = TSpeedButton(Sender).tag) then
      begin
         TEdit( TSpeedButton(Sender).Parent.Parent.Components[I] ).Text :=
            Self.getValorAdicionaisSelecao(TSpeedButton(Sender).tag, codigo);

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
   if(Mensagem(
      'Deseja realmente remover esta pessoa do grupo "'
         + qryGruposds_nome_grupo.AsString
         + '"?',
         'Atenção',
         MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2 , Handle
      ) = mrYes) then
   begin
      gruposExcluidos := qryGruposcd_grupo.AsString;

      DM.CriarConsulta(qryExcluiGrupos);
      qryExcluiGrupos.SQL.Text := ''
         + ' DELETE FROM '
         + '   nu_grupos_pessoas '
         + ' WHERE '
         + '   cd_grupo_pessoa = ' + qryGruposcd_grupo_pessoa.AsString;
      qryExcluiGrupos.ExecSQL;
      qryExcluiGrupos.Free;
      qryGrupos.Close;
      qryGrupos.Open;

      with QryLogGeral do
      begin
         observacao := ''+
            'Pessoa '
            + inttostr(codigo)
            + ' removida do(s) grupo(s): '
            + gruposExcluidos ;

         ParamByName('PESSOA').value := codigo;
         ParamByName('USUARIO').value  := dm.GetUsuarioLogado.Pessoa.Codigo;
         ParamByName('DATALOG').value := Now;
         ParamByName('MODULO').value := 53;
         ParamByName('CHAVE').value := inttostr(codigo) + ';'
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

