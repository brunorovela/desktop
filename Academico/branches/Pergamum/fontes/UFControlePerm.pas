unit UFControlePerm;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
   DBCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   Contnrs, ImgList, ZSqlProcessor, General, ZDbcIntfs, UMComboBox, Mask,
  DBCGrids, DBClient;

type
   TFControlePerm = class(TForm)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      pnlGrupo: TPanel;
      pnlGrupoTit: TPanel;
      sbBuscaGrupo: TSpeedButton;
      bvlSep2: TBevel;
      pnlModulos: TPanel;
      pnlModulosTit: TPanel;
      bvlSep3: TBevel;
      dbgModulos: TDBGrid;
      pnlGeral: TPanel;
      splSeparador: TSplitter;
      pgcOpcoes: TPageControl;
      tbsPermissoes: TTabSheet;
      tbsColigadas: TTabSheet;
      pnlColigadas: TPanel;
      pnlUsuarios: TPanel;
      pnlBuscaUsuario: TPanel;
      bvlSep4: TBevel;
      pnlColigadasTit: TPanel;
      lblColigadas: TLabel;
      pnlUsuariosTit: TPanel;
      bvlSep6: TBevel;
      dbgUsuarios: TDBGrid;
      pnlOpcoes: TPanel;
      ledUsuario: TLabeledEdit;
      sbFiltrar: TSpeedButton;
      dsModulos: TDataSource;
      ledGrupo: TLabeledEdit;
      qryModulos: TUMZQuery;
      qryPermissoes: TUMZQuery;
      qryPermissoesCODIGO: TIntegerField;
      qryPermissoesNOME: TStringField;
      qryPermissoesPERMISSAO: TIntegerField;
      dsPermissoes: TDataSource;
      qryModulosDS_NOME_MODULO: TStringField;
      qryPermissoesCD_ACAO: TIntegerField;
      qryPessoasColigadas: TUMZQuery;
      qryPessoasColigadasCD_PESSOA: TIntegerField;
      qryPessoasColigadasNM_PESSOA: TStringField;
      qryPessoasColigadasCD_COLIGADA: TIntegerField;
      dsPessoasColigadas: TDataSource;
      qryPermissoesCHAVE: TStringField;
      ilMenu: TImageList;
      toolPessoa: TToolBar;
      ToolButton11: TToolButton;
      btnFechar: TToolButton;
      ToolButton2: TToolButton;
      sbAdicionar: TSpeedButton;
      sbExcluir: TSpeedButton;
      sbAdicionarGrupos: TSpeedButton;
      btnCopiarPriv: TToolButton;
      btnMarcar: TToolButton;
      btnDesmarcar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      cbColigadas: TUMComboBox;
      lbBusca: TLabeledEdit;
      qryModulosCD_MODULO: TLargeintField;
      pnTitulo: TPanel;
      pnlPermissoesTit: TPanel;
      pnPermissoes: TPanel;
      dbcPermissoes: TDBCtrlGrid;
      dbTexto: TDBText;
      dbAcesso: TDBCheckBox;
      dbAlteracao: TDBCheckBox;
      dbInclusao: TDBCheckBox;
      dbExclusao: TDBCheckBox;
      dbEspecial: TDBCheckBox;
      dbTodas: TDBCheckBox;
      pnHeader: TPanel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      qryPermissoesACESSO: TLargeintField;
      qryPermissoesINCLUSAO: TLargeintField;
      qryPermissoesALTERACAO: TLargeintField;
      qryPermissoesEXCLUSAO: TLargeintField;
      qryPermissoesESPECIAL: TLargeintField;
      qryPermissoesTODAS: TLargeintField;
      cdsPermissoes: TClientDataSet;
      IntegerField1: TIntegerField;
      IntegerField2: TIntegerField;
      IntegerField3: TIntegerField;
      StringField2: TStringField;
      LargeintField1: TLargeintField;
      LargeintField2: TLargeintField;
      LargeintField3: TLargeintField;
      LargeintField4: TLargeintField;
      LargeintField5: TLargeintField;
      LargeintField6: TLargeintField;
      cdsPermissoesNome: TStringField;
      qryUpdatePermissao: TUMZQuery;
    qryUpdateTodasPermissoes: TUMZQuery;
    qryInserePermissao: TUMZQuery;
    qryInsereTodasPermissoes: TUMZQuery;
    qryVerificaPermissaoFaltando: TUMZQuery;
    procedure lbBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure lbBuscaChange(Sender: TObject);
      procedure dbEspecialClick(Sender: TObject);
      procedure dbInclusaoClick(Sender: TObject);
      procedure dbAlteracaoClick(Sender: TObject);
      procedure dbExclusaoClick(Sender: TObject);
      procedure dbAcessoClick(Sender: TObject);
      procedure dbTodasClick(Sender: TObject);
      procedure qryPermissoesAfterOpen(DataSet: TDataSet);
      procedure pgcOpcoesChanging(Sender: TObject; var AllowChange: Boolean);
      procedure cbColigadasChange(Sender: TObject);
      procedure btnDesmarcarClick(Sender: TObject);
      procedure btnMarcarClick(Sender: TObject);
      procedure btnCopiarPrivClick(Sender: TObject);
      procedure sbAdicionarClick(Sender: TObject);
      procedure sbAdicionarGruposClick(Sender: TObject);
      procedure ledUsuarioKeyPress(Sender: TObject; var Key: Char);
      procedure dbgModulosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure sbxPermissoesClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure sbExcluirClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure sbFiltrarClick(Sender: TObject);
      procedure dbgUsuariosTitleClick(Column: TColumn);
      procedure pgcOpcoesChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure dsModulosDataChange(Sender: TObject; Field: TField);
      procedure sbBuscaGrupoClick(Sender: TObject);
   private
      FCodGrupo : Integer;
      carregando : Boolean;
      selecionandoTodos : Boolean;
      procedure CarregarColigadas();
      procedure CarregarPessoasGruposColigadas(ordenacao: string = '');
      procedure carregaPermissoes();
      procedure alterarPermissoes(nr_permissao:Integer);
      procedure alterarTodasPermissoes(marca:Boolean=true);
      procedure carregaQryPermissoes(nome:String='');
   public
      procedure setCodGrupo(CodGrupo : Integer);
      function  getCodGrupo: Integer;
   end;

var
  FControlePerm: TFControlePerm;

implementation

uses
   uFSelGrupo, uDM, uUsuario, UFSelPessoa, IBCustomDataSet, UFGrupos, UZDbcFuncs,
   UFGrupoCopiarPerms, uColigada, uColigadaMatriz;

{$R *.dfm}

procedure TFControlePerm.sbBuscaGrupoClick(Sender: TObject);
begin
   Application.CreateForm(TFSelGrupos, FSelGrupos);
   fSelGrupos.edNome.Text := ledGrupo.Text;
   fSelGrupos.filtrar(false);
   FSelGrupos.ShowModal;
   if FSelGrupos.getFflgResult then
   begin
      setCodGrupo(fSelGrupos.getCodSelecionado);
      ledGrupo.Text := FSelGrupos.getNomeSelecionado;
      dbgModulos.Enabled := true;
      pgcOpcoes.ActivePageIndex :=0;
      qryModulos.Close;
      qryModulos.Open;
   end;
end;
procedure TFControlePerm.sbExcluirClick(Sender: TObject);
const
   MSG_CONFIRMACAO =
      'Este usuário está vinculado a Unidade de Ensino Matriz, ' +
      'desta forma quando novas Unidades de Ensino filiais são incluídas, ele automaticamente é vinculado à unidade. ' +
      'Removendo o usuário desta Unidade, o mesmo não será mais vinculado automaticamente.' + Chr(13) + 'Deseja continuar?';
   MSG_CONFIRMACAO_TODAS =
      'Esta é uma Unidade de Ensino Matriz. Ao remover a pessoa deste grupo, ' +
      'ela não será mais incluída automaticamente nas demais Unidades de Ensino filiadas.' + Chr(13) +
      'Deseja remove-lo de todas as Unidades de Ensino filiadas?';
var
   resposta : Integer;
begin
   if Mensagem('Deseja retirar essa pessoa da Unidade de Ensino selecionada?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = mryes then
   begin
      if cbColigadas.Items.Objects[cbColigadas.ItemIndex] is TColigada then
      begin
         if DM.UsuarioLogado.GetColigadaLogada.UsuarioNoGrupo(
               qryPessoasColigadasCD_PESSOA.AsInteger, FCodGrupo ) then
         begin
            if Mensagem(MSG_CONFIRMACAO, '', MB_ICONEXCLAMATION + MB_YESNO, Handle) = mrYes then
            begin
               DM.UsuarioLogado.GetColigadaLogada.RemoverGrupoUsuario(
                  qryPessoasColigadasCD_PESSOA.AsInteger, FCodGrupo
               );

               TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).RemoverGrupoUsuario( qryPessoasColigadasCD_PESSOA.AsInteger, FCodGrupo );
            end;
         end else begin
            TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).RemoverGrupoUsuario( qryPessoasColigadasCD_PESSOA.AsInteger, FCodGrupo );
         end;
      end
      else if cbColigadas.Items.Objects[cbColigadas.ItemIndex] is TColigadaMatriz then
      begin
         resposta := Mensagem(MSG_CONFIRMACAO_TODAS, 'Aviso', MB_YESNOCANCEL + MB_ICONWARNING);

         // Se a resposta for Sim ou Não, então fazemos a ação. Caso seja Cancelar, não fazemos nada.
         if resposta in [mrYes, mrNo] then
         begin
            DM.UsuarioLogado.GetColigadaLogada.RemoverGrupoUsuario(
               qryPessoasColigadasCD_PESSOA.AsInteger, FCodGrupo, resposta = mrYes );
         end;
      end;

      qryPessoasColigadas.Refresh;
   end;
end;

procedure TFControlePerm.sbFiltrarClick(Sender: TObject);
begin
   CarregarPessoasGruposColigadas();
end;

procedure TFControlePerm.sbxPermissoesClick(Sender: TObject);
begin
   pnlTitulo.SetFocus;
end;

procedure TFControlePerm.dbgModulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (gdSelected in State) then
   begin
      dbgModulos.Canvas.Brush.Color:=clBlue;
      dbgModulos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TFControlePerm.dbgUsuariosTitleClick(Column: TColumn);
begin
   CarregarPessoasGruposColigadas( Trim(Column.FieldName) );
   Column.Title.Font.Color := clBlue;
   dbgUsuarios.Columns[Column.Index].Title.Font.Color := clBlack;
end;

procedure TFControlePerm.dsModulosDataChange(Sender: TObject; Field: TField);
begin
   Self.carregaQryPermissoes();
end;

function TFControlePerm.getCodGrupo(): Integer ;
begin
   Result := FCodGrupo;
end;

procedure TFControlePerm.setCodGrupo(CodGrupo : Integer);
begin
   FCodGrupo := CodGrupo;
end;

procedure TFControlePerm.sbAdicionarClick(Sender: TObject);
begin
   Application.CreateForm(TFSelPessoa, FSelPessoa);
   FSelPessoa.ShowModal;
end;

procedure TFControlePerm.sbAdicionarGruposClick(Sender: TObject);
begin
   if not (DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo,
      'UMNucleo.Grupos.DefinirHierarquias', npAcesso, False )) then
   begin
      Mensagem('Você não possui permissão de acesso a esta tela');
      exit;
   end;

   Application.CreateForm(TFAlteraGrupo , FAlteraGrupo );
end;

procedure TFControlePerm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFControlePerm.FormCreate(Sender: TObject);
begin
   tbsPermissoes.Enabled := False;
   tbsColigadas.Enabled := False;
   selecionandoTodos := false;
   carregando := false;

   //Se tiver a permissão de Gerenciar Usuarios Grupos abre a tela de
   //usuários de grupos por padrão.
   if DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo,
      'ControleAcesso.Gerenciar.Usuarios.Grupos', npAcesso, False ) then
   begin
      pgcOpcoes.ActivePage := tbsColigadas;
      tbsColigadas.Enabled := True;
   end;

   //Se tiver a permissão de Permissões / Módulos, mesmo já possuindo a
   //permissão de Gerenciar Usuarios Grupos, abre a tela de Permissões.
   if DM.UsuarioLogado.TemPermissao( 3001, npAcesso, False ) then
   begin
      pgcOpcoes.ActivePage := tbsPermissoes;
      tbsPermissoes.Enabled := True;
   end;
end;

procedure TFControlePerm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      btnFechar.OnClick(nil);
end;

procedure TFControlePerm.alterarPermissoes(nr_permissao:Integer);
begin
   if not(DM.UsuarioLogado.TemPermissao( 3001, npIncluir, False )) then
   begin
      Mensagem('Você possui apenas a permissão de acesso.');
      exit;
   end;

   if not(cdsPermissoes.State in [DsInsert,DsEdit]) then
   begin
      exit;
   end;

   if carregando then
   begin
      exit;
   end;

   qryUpdatePermissao.Close;
   qryUpdatePermissao.ParamByName('permissao').AsInteger := nr_permissao;
   qryUpdatePermissao.ParamByName('grupo').AsInteger := Self.getCodGrupo();
   qryUpdatePermissao.ParamByName('acao').AsString := cdsPermissoes.FieldByName('Cd_acao').AsString;
   qryUpdatePermissao.ExecSQL;

   if (qryUpdatePermissao.RowsAffected = 0) then
   begin
      qryInserePermissao.Close;
      qryInserePermissao.ParamByName('nr_permissao').AsInteger := nr_permissao;
      qryInserePermissao.ParamByName('grupo').AsInteger := Self.getCodGrupo();
      qryInserePermissao.ParamByName('cd_acao').AsString := cdsPermissoes.FieldByName('Cd_acao').AsString;
      qryInserePermissao.ExecSQL;
   end;
end;

procedure TFControlePerm.alterarTodasPermissoes(marca: Boolean);
const
   SMsgConfirm = 'Tem certeza que deseja alterar todas as permissões para o grupo [%s] no módulo [%s]?';
var
   Msg: string;
   permissao : Integer;
begin
   Msg := Format(SMsgConfirm, [ledGrupo.Text, qryModulosDS_NOME_MODULO.AsString]);
   if MessageBox(Handle, PChar(Msg), PChar('Confirmação'), MB_ICONQUESTION or MB_YESNO) = ID_NO then
   begin
      exit;
   end;

   permissao := 0;
   if(marca) then
   begin
      permissao := 31;
   end;

   qryUpdateTodasPermissoes.Close;
   qryUpdateTodasPermissoes.ParamByName('grupo').AsInteger := self.getCodGrupo();
   qryUpdateTodasPermissoes.ParamByName('permissao').AsInteger := permissao;
   qryUpdateTodasPermissoes.ParamByName('modulo').AsInteger := qryModulosCD_MODULO.AsInteger;
   qryUpdateTodasPermissoes.ExecSQL;

   qryVerificaPermissaoFaltando.Close;
   qryVerificaPermissaoFaltando.ParamByName('grupo').AsInteger := self.getCodGrupo();
   qryVerificaPermissaoFaltando.ParamByName('modulo').AsInteger := qryModulosCD_MODULO.AsInteger;
   qryVerificaPermissaoFaltando.Open;

   //Tenta inserir as permissões no caso que elas ainda n existiam
   if(qryVerificaPermissaoFaltando.FieldByName('contAcao').AsInteger > 0) then
   begin
      qryInsereTodasPermissoes.Close;
      qryInsereTodasPermissoes.ParamByName('permissao').AsInteger := permissao;
      qryInsereTodasPermissoes.ParamByName('grupo').AsInteger := Self.getCodGrupo();
      qryInsereTodasPermissoes.ParamByName('modulo').AsInteger := qryModulosCD_MODULO.AsInteger;
      qryInsereTodasPermissoes.ExecSQL;
   end;

   qryPermissoes.Refresh;
   carregaPermissoes();
end;

procedure TFControlePerm.btnCopiarPrivClick(Sender: TObject);
begin
   Application.CreateForm(TfGrupoCopiarPerms, fGrupoCopiarPerms);
   fGrupoCopiarPerms.GroupCode := FCodGrupo;
   fGrupoCopiarPerms.GroupName := ledGrupo.Text;
   if fGrupoCopiarPerms.ShowModal = mrOk then dsModulosDataChange(dsModulos, nil);
end;

procedure TFControlePerm.btnDesmarcarClick(Sender: TObject);
begin
   Self.alterarTodasPermissoes(false);
end;

procedure TFControlePerm.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFControlePerm.btnMarcarClick(Sender: TObject);
begin
   Self.alterarTodasPermissoes();
end;

procedure TFControlePerm.carregaQryPermissoes(nome: String);
begin
   qryPermissoes.Close;
   qryPermissoes.ParamByName('cd_grupo').AsInteger  := getCodGrupo ;
   qryPermissoes.ParamByName('cd_modulo').AsInteger := qryModulosCD_MODULO.AsInteger;
   qryPermissoes.Open;

   qryPermissoes.Filtered := false;
   qryPermissoes.Filter := Format(' NOME LIKE %s', [QuotedStr(AnsiQuotedStr(lbBusca.Text,#42))]);
   qryPermissoes.Filtered := true;
   Self.carregaPermissoes();
end;

//Passa as permissões da query para o dataset para poder interferir com o componente
procedure TFControlePerm.carregaPermissoes;
begin
   carregando := true;
   cdsPermissoes.DisableControls;
   cdsPermissoes.EmptyDataSet;
   cdsPermissoes.Open;
   
   qryPermissoes.Last;
   while not qryPermissoes.bof do
   begin
      cdsPermissoes.Insert;
      cdsPermissoes.FieldByName('Codigo').AsString := qryPermissoesCODIGO.AsString;
      cdsPermissoes.FieldByName('Nome').AsString := qryPermissoesNome.AsString;
      cdsPermissoes.FieldByName('Permissao').AsString := qryPermissoesPermissao.AsString;
      cdsPermissoes.FieldByName('Cd_acao').AsString := qryPermissoesCD_ACAO.AsString;
      cdsPermissoes.FieldByName('Chave').AsString := qryPermissoesChave.AsString;
      cdsPermissoes.FieldByName('Acesso').AsString := qryPermissoesAcesso.AsString;
      cdsPermissoes.FieldByName('Inclusao').AsString := qryPermissoesInclusao.AsString;
      cdsPermissoes.FieldByName('Alteracao').AsString := qryPermissoesALTERACAO.AsString;
      cdsPermissoes.FieldByName('Exclusao').AsString  := qryPermissoesEXCLUSAO.AsString;
      cdsPermissoes.FieldByName('Especial').AsString  := qryPermissoesESPECIAL.AsString;
      cdsPermissoes.FieldByName('Todas').AsString   := qryPermissoesTODAS.AsString;
      
      qryPermissoes.Prior;
   end;
   qryPermissoes.First;

   if cdsPermissoes.State = dsInsert then
   begin
      cdsPermissoes.Post;
   end;

   cdsPermissoes.EnableControls;
   carregando := false;
end;

procedure TFControlePerm.CarregarColigadas;
const
   SQL_COLIGADAS =
      '( SELECT cd_coligada, CONCAT( nm_coligada, '' - Todas as Unidades'' ) AS nm_coligada, 1 AS sn_matriz ' +
      '  FROM coligadas_matriz WHERE cd_coligada = :cd_coligada_matriz ) ' +
      ' UNION ' +
      '( SELECT cd_coligada, nm_coligada, 0 AS sn_matriz FROM coligadas WHERE cd_coligada_matriz = :cd_coligada_matriz )';
var
   qyColigadas : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyColigadas);

   qyColigadas.SQL.Text := SQL_COLIGADAS;
   qyColigadas.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyColigadas.Open();

   while not qyColigadas.Eof do
   begin
      if ( qyColigadas.FieldByName('sn_matriz').AsInteger = 1 ) then
      begin

         cbColigadas.AddItem( qyColigadas.FieldByName('nm_coligada').AsString,
            TColigadaMatriz.Create(
               qyColigadas.FieldByName('cd_coligada').AsInteger,
               qyColigadas.FieldByName('nm_coligada').AsString
            ));
      end else begin
         cbColigadas.AddItem( qyColigadas.FieldByName('nm_coligada').AsString,
            TColigada.Create(
               qyColigadas.FieldByName('cd_coligada').AsInteger,
               qyColigadas.FieldByName('nm_coligada').AsString
            ) );
      end;

      qyColigadas.Next;
   end;

   cbColigadas.ItemIndex := 0;

   FreeAndNil(qyColigadas);
end;

procedure TFControlePerm.CarregarPessoasGruposColigadas(ordenacao: string);
const
   SQL_PESSOAS_COLIGADAS_MATRIZ =
      ' SELECT p.cd_pessoa, UPPER(p.nm_pessoa) AS nm_pessoa, npm.cd_coligada_matriz AS cd_coligada ' +
      ' FROM nu_pessoas_matriz npm ' +
      '      INNER JOIN pessoas p ON ( p.cd_pessoa = npm.cd_pessoa ) ' +
      ' WHERE npm.cd_coligada_matriz = :cd_coligada AND npm.cd_grupo = :cd_grupo [nm_pessoa] ' +
      ' ORDER BY p.[ordem] ';
   SQL_PESSOAS_COLIGADAS =
      ' SELECT p.cd_pessoa, UPPER(p.nm_pessoa) AS nm_pessoa, ngp.cd_coligada ' +
      ' FROM nu_grupos_pessoas ngp INNER JOIN pessoas p ON ( p.cd_pessoa = ngp.cd_pessoa ) ' +
      ' WHERE ( ngp.cd_coligada = :cd_coligada OR ngp.cd_coligada = 0 ) AND ' +
      '       ngp.cd_grupo = :cd_grupo [nm_pessoa] ' +
      ' ORDER BY p.[ordem] ';
var
   sql, filtro_nm_pessoa : string;
   cd_coligada : Integer;
begin
   filtro_nm_pessoa := Trim(ledUsuario.Text);

   qryPessoasColigadas.Close();

   if ( cbColigadas.Items.Objects[cbColigadas.ItemIndex] is TColigadaMatriz ) then
   begin
      sql := SQL_PESSOAS_COLIGADAS_MATRIZ;
      cd_coligada := TColigadaMatriz(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo;
   end else begin
      sql := SQL_PESSOAS_COLIGADAS;
      cd_coligada := TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo;
   end;

   if ( filtro_nm_pessoa = '' ) then
   begin
      sql := StringReplace(sql, '[nm_pessoa]', '', []);
   end else begin
      sql := StringReplace(sql, '[nm_pessoa]', 'AND p.nm_pessoa = ' + QuotedStr('%' + filtro_nm_pessoa + '%'), []);
   end;

   if ( ordenacao = '' ) then
      ordenacao := 'nm_pessoa';

   sql := StringReplace(sql, '[ordem]', ordenacao, []);

   qryPessoasColigadas.SQL.Text := sql;
   qryPessoasColigadas.ParamByName('cd_coligada').AsInteger := cd_coligada;
   qryPessoasColigadas.ParamByName('cd_grupo').AsInteger := getCodGrupo;

   qryPessoasColigadas.Open();
end;

procedure TFControlePerm.cbColigadasChange(Sender: TObject);
begin
   CarregarPessoasGruposColigadas();
end;

procedure TFControlePerm.dbAcessoClick(Sender: TObject);
var
   somador : Integer;
begin
   if carregando or selecionandoTodos then
   begin
      exit;
   end;

   if not(cdsPermissoes.State in [DsInsert,DsEdit]) then
   begin
      exit;
   end;

   somador := 0;
   //Clicou nesse, inverte o valor
   if not (cdsPermissoes.FieldByName('Acesso').AsString = '1') then
   begin
      somador := somador + 1;
   end;    

   if (cdsPermissoes.FieldByName('Inclusao').AsString = '1') then
   begin
      somador := somador + 2;
   end;  

   if (cdsPermissoes.FieldByName('Alteracao').AsString = '1') then
   begin
      somador := somador + 4;
   end; 

   if (cdsPermissoes.FieldByName('Exclusao').AsString = '1') then
   begin
      somador := somador + 8;
   end;  

   if (cdsPermissoes.FieldByName('Especial').AsString = '1') then
   begin
      somador := somador + 16;
   end; 
   
   Self.alterarPermissoes(somador);
end;

procedure TFControlePerm.lbBuscaChange(Sender: TObject);
begin
   qryPermissoes.Refresh;
   qryPermissoes.Filtered := false;
   qryPermissoes.Filter := Format(' NOME LIKE %s', [QuotedStr(AnsiQuotedStr(lbBusca.Text,#42))]);
   qryPermissoes.Filtered := true;
   carregaPermissoes();
end;

procedure TFControlePerm.lbBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if (qryPermissoes.State in [dsInactive]) then
   begin
      Mensagem('Você deve selecionar um grupo primeiro!');
      Key := #0;
      exit;
   end;
end;

procedure TFControlePerm.ledUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13 ) then
      sbFiltrar.Click;
end;

procedure TFControlePerm.dbEspecialClick(Sender: TObject);
var
   somador:integer;
begin
   if carregando or selecionandoTodos then
   begin
      exit;
   end;

   if not(cdsPermissoes.State in [DsInsert,DsEdit]) then
   begin
      exit;
   end;

   somador := 0;

   if (cdsPermissoes.FieldByName('Acesso').AsString = '1') then
   begin
      somador := somador + 1;
   end;

   if (cdsPermissoes.FieldByName('Inclusao').AsString = '1') then
   begin
      somador := somador + 2;
   end;

   if (cdsPermissoes.FieldByName('Alteracao').AsString = '1') then
   begin
      somador := somador + 4;
   end;

   if (cdsPermissoes.FieldByName('Exclusao').AsString = '1') then
   begin
      somador := somador + 8;
   end;

   //Clicou nesse, inverte o valor
   if not(cdsPermissoes.FieldByName('Especial').AsString = '1') then
   begin
      somador := somador + 16;
   end;

   Self.alterarPermissoes(somador);
end;

procedure TFControlePerm.dbExclusaoClick(Sender: TObject);
var
   somador:integer;
begin
   if carregando or selecionandoTodos then
   begin
      exit;
   end;

   if not(cdsPermissoes.State in [DsInsert,DsEdit]) then
   begin
      exit;
   end;

   somador := 0;

   if (cdsPermissoes.FieldByName('Acesso').AsString = '1') then
   begin
      somador := somador + 1;
   end;

   if (cdsPermissoes.FieldByName('Inclusao').AsString = '1') then
   begin
      somador := somador + 2;
   end;

   if (cdsPermissoes.FieldByName('Alteracao').AsString = '1') then
   begin
      somador := somador + 4;
   end;

   //Clicou nesse, inverte o valor
   if not(cdsPermissoes.FieldByName('Exclusao').AsString = '1') then
   begin
      somador := somador + 8;
   end;

   if (cdsPermissoes.FieldByName('Especial').AsString = '1') then
   begin
      somador := somador + 16;
   end;

   Self.alterarPermissoes(somador);
end;

procedure TFControlePerm.dbAlteracaoClick(Sender: TObject);
var
   somador:integer;
begin
   if carregando or selecionandoTodos then
   begin
      exit;
   end;

   if not(cdsPermissoes.State in [DsInsert,DsEdit]) then
   begin
      exit;
   end;

   somador := 0;

   if (cdsPermissoes.FieldByName('Acesso').AsString = '1') then
   begin
      somador := somador + 1;
   end;

   if (cdsPermissoes.FieldByName('Inclusao').AsString = '1') then
   begin
      somador := somador + 2;
   end;  

   //Clicou nesse, inverte o valor
   if not(cdsPermissoes.FieldByName('Alteracao').AsString = '1') then
   begin
      somador := somador + 4;
   end; 

   if (cdsPermissoes.FieldByName('Exclusao').AsString = '1') then
   begin
      somador := somador + 8;
   end;  

   if (cdsPermissoes.FieldByName('Especial').AsString = '1') then
   begin
      somador := somador + 16;
   end;

   Self.alterarPermissoes(somador);
end;

procedure TFControlePerm.dbInclusaoClick(Sender: TObject);
var
   somador:integer;
begin
   if carregando or selecionandoTodos then
   begin
      exit;
   end;

   if not(cdsPermissoes.State in [DsInsert,DsEdit]) then
   begin
      exit;
   end;

   somador := 0;

   if (cdsPermissoes.FieldByName('Acesso').AsString = '1') then
   begin
      somador := somador + 1;
   end;

   //Clicou nesse, inverte o valor
   if not(cdsPermissoes.FieldByName('Inclusao').AsString = '1') then
   begin
      somador := somador + 2;
   end;  

   if (cdsPermissoes.FieldByName('Alteracao').AsString = '1') then
   begin
      somador := somador + 4;
   end; 

   if (cdsPermissoes.FieldByName('Exclusao').AsString = '1') then
   begin
      somador := somador + 8;
   end;  

   if (cdsPermissoes.FieldByName('Especial').AsString = '1') then
   begin
      somador := somador + 16;
   end;

   Self.alterarPermissoes(somador);
end;

procedure TFControlePerm.dbTodasClick(Sender: TObject);
var
   todos: String;
   NumeroPermissao: Integer;
begin
   if(cdsPermissoes.State in [DsInsert,DsEdit]) AND NOT(carregando) then
   begin
      selecionandoTodos := true;

      if not(DM.UsuarioLogado.TemPermissao( 3001, npIncluir, False )) then
      begin
         Mensagem('Você possui apenas a permissão de acesso.');
         exit;
      end;

      todos := '0';
      NumeroPermissao := 0;
      if(cdsPermissoes.FieldByName('Todas').AsString = '0') then
      begin
         todos := '1';
         NumeroPermissao := 31;
      end;
      cdsPermissoes.FieldByName('Acesso').AsString    := todos;
      cdsPermissoes.FieldByName('Inclusao').AsString  := todos;
      cdsPermissoes.FieldByName('Alteracao').AsString := todos;
      cdsPermissoes.FieldByName('Exclusao').AsString  := todos;
      cdsPermissoes.FieldByName('Especial').AsString  := todos;
      cdsPermissoes.FieldByName('Todas').AsString     := todos;

      self.alterarPermissoes(NumeroPermissao);

      selecionandoTodos := false;
   end;
end;

procedure TFControlePerm.pgcOpcoesChange(Sender: TObject);
begin
   if pgcOpcoes.ActivePage = tbsColigadas then
   begin
      if cbColigadas.Items.Count = 0 then
      begin
         CarregarColigadas();
      end;

      CarregarPessoasGruposColigadas( 'nm_pessoa' );
   end;
end;

procedure TFControlePerm.pgcOpcoesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if pgcOpcoes.ActivePage = tbsColigadas then
   begin

      if not(DM.UsuarioLogado.TemPermissao( 3001, npAcesso, False )) then
      begin
         Mensagem('Você não possui permissão para acessar esta tela!');
         AllowChange := False;
      end;

   end;

   if pgcOpcoes.ActivePage = tbsPermissoes then
   begin
      if not(DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo,
         'ControleAcesso.Gerenciar.Usuarios.Grupos', npAcesso, False )) then
      begin
         Mensagem('Você não possui permissão para acessar esta tela!');
         AllowChange := False;
      end;

      if qryModulosCD_MODULO.AsInteger = -1 then
      begin
         Mensagem('Você deve selecionar um módulo para prosseguir.');
         AllowChange := False;

      end;
      
   end;
end;

procedure TFControlePerm.qryPermissoesAfterOpen(DataSet: TDataSet);
begin
   dbcPermissoes.Visible := not qryPermissoes.IsEmpty;
   pnPermissoes.Visible :=  not qryPermissoes.IsEmpty;
   pnHeader.Visible := not qryPermissoes.IsEmpty;
end;

end.
