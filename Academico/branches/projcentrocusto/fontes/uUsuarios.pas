unit uUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Db, ZConnection, Buttons, Mask, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls,
  ToolWin, ImgList, md5, Variants, Menus, uFSelecionarPessoa;

type
  TfrmUsuarios = class(TForm)
    Panel1: TPanel;
    dtcUsuarios: TDataSource;
    tblUsuarios: TUMZQuery;
    tblUsuariosCodigo: TIntegerField;
    tblUsuariosNome: TStringField;
    tblModulos: TUMZQuery;
    tblModulosCodigo: TSmallintField;
    dtcModulos: TDataSource;
    tblModulosModulo: TStringField;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnNovo: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton7: TToolButton;
    paCabecalho: TPanel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel2: TBevel;
    tblModulosCategoria: TStringField;
    tblListaModulos: TUMZQuery;
    dsListaModulos: TDataSource;
    tblListaModulosCodigoUsuario: TIntegerField;
    tblListaModulosCodigoModulo: TSmallintField;
    tblListaModulosCodigo: TSmallintField;
    tblListaModulosCategoria: TStringField;
    tblListaModulosModulo: TStringField;
    tblUsuariosSenha: TStringField;
    tblListaModulosIncluir: TStringField;
    tblListaModulosAlterar: TStringField;
    tblListaModulosDeletar: TStringField;
    tblListaModulosAcessar: TStringField;
    tblListaModulosEspecial: TStringField;
    btnCopiar: TToolButton;
    ToolButton3: TToolButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    pmQtdUsuarios: TPopupMenu;
    pmQtdModulos: TPopupMenu;
    ToolButton2: TToolButton;
    popPrivilegios: TPopupMenu;
    GroupBox1: TGroupBox;
    grd: TDBGrid;
    GroupBox2: TGroupBox;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    txtSenha: TDBEdit;
    txtUsuario: TDBEdit;
    DBCheckBox7: TDBCheckBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton1: TSpeedButton;
    tblUsuarioscd_pessoa: TIntegerField;
    tblUsuariosnm_pessoa: TStringField;
    SpeedButton2: TSpeedButton;
    pnFiltro: TPanel;
    ckMostrarAtivos: TCheckBox;
    tblUsuariosSN_ONLINE: TStringField;
    qryDeleteModulos: TUMZQuery;
    qryDeleteModUsuarios: TUMZQuery;
    qryInserePermissoes: TUMZQuery;
    qryInserePermNulas: TUMZQuery;
    qryInsPermNovoUsuario: TUMZQuery;
    qryMax: TUMZQuery;
    qryMaxMAX: TLargeintField;
    procedure tblUsuariosAfterPost(DataSet: TDataSet);
    procedure ckMostrarAtivosClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure popPrivilegiosPopup(Sender: TObject);
    procedure dtcUsuariosStateChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblUsuariosBeforePost(DataSet: TDataSet);
    procedure tblUsuariosNewRecord(DataSet: TDataSet);
    procedure tblModulosUsuariosAfterPost(DataSet: TDataSet);
    procedure txtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tblUsuariosSenhaSetText(Sender: TField; const Text: String);
    procedure btnCopiarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure tblUsuariosOnLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblListaModulosIncluirGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblListaModulosAlterarGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblListaModulosDeletarGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblListaModulosAcessarGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblListaModulosEspecialGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure grdDblClick(Sender: TObject);
    procedure tblUsuariosOnLineSetText(Sender: TField; const Text: String);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdUsuariosPopup(Sender: TObject);
    procedure pmQtdModulosPopup(Sender: TObject);
  private
    iUsuario : Integer ;
    Procedure CopiarPrivilegios(Sender : TObject);
  strict private
    procedure atualizaPermissoesGruposRel;
    procedure removePermissoesGruposRel;
    procedure inserePermissoesGruposRel;
    function temGruposRelExcluidos: boolean;
    function temGruposRelNovos: boolean;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses uDM;

{$R *.DFM}

procedure TfrmUsuarios.dtcUsuariosStateChange(Sender: TObject);
begin
  btnNovo.Enabled := (TDataSource( Sender ).State in [dsBrowse]);

  btnAlterar.Enabled := (TDataSource( Sender ).State in [dsBrowse]);

  btnSalvar.Enabled := (TDataSource( Sender ).State in [dsEdit, dsInsert]);

  btnExcluir.Enabled := (TDataSource( Sender ).State in [dsBrowse]);

  btnCancelar.Enabled := (TDataSource( Sender ).State in [dsEdit, dsInsert]) ;

end;

{ Atualiza as permissões para os grupos de relatórios para os usuários.
}
procedure TfrmUsuarios.atualizaPermissoesGruposRel;
begin
   if Self.temGruposRelExcluidos then
      Self.removePermissoesGruposRel;
   if Self.temGruposRelNovos then
      Self.inserePermissoesGruposRel;
end;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  tblUsuarios.Edit;
  txtUsuario.SetFocus;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
Var
   codigo : Integer;
begin
  if tblUsuarios.State in [dsInsert, dsEdit] then
  Begin
     codigo := tblUsuariosCodigo.AsInteger;
     tblUsuarios.Post;
     tblUsuarios.Close;
     tblUsuarios.Open;
     tblUsuarios.Locate('Codigo',IntToStr(codigo), []);
  End;
end;

procedure TfrmUsuarios.ckMostrarAtivosClick(Sender: TObject);
begin
   if Self.ckMostrarAtivos.Checked then
      Self.tblUsuarios.Filtered := false
   else
      Self.tblUsuarios.Filtered := true;
end;

procedure TfrmUsuarios.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnNovo.Enabled then btnNovoClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
  end;
end;


procedure TfrmUsuarios.tblUsuariosAfterPost(DataSet: TDataSet);
begin
   Dm.tblModulos.First;
   { Inserir os Modulos para o usuário ao Salvar }
   While not Dm.tblModulos.Eof do
   Begin // preencher todos os novos módulos para o usuário
   try
      qryInsPermNovoUsuario.ParamByName('usuario').AsInteger := iUsuario;
      qryInsPermNovoUsuario.ParamByName('modulo').AsInteger := Dm.tblModulosCodigo.AsInteger;
      qryInsPermNovoUsuario.ExecSQL;
   except
      // Se o usuário ja possui esse modulo relacionado
   end;
   Dm.tblModulos.Next;
   End;
end;

procedure TfrmUsuarios.tblUsuariosBeforePost(DataSet: TDataSet);
begin
  iUsuario := tblUsuariosCodigo.AsInteger;
  if DM.FindUser(tblUsuariosNome.AsString) then
  begin
    if tblUsuarios.State in [dsInsert] then
    begin
      Mensagem( 'Usuário já cadastrado.', Application.Title, MB_OK + MB_ICONSTOP );
      Abort;
    end;
  end;
end;

procedure TfrmUsuarios.tblUsuariosNewRecord(DataSet: TDataSet);
begin
   qryMax.Close;
   qryMax.Open;
   tblUsuariosCodigo.Value := qryMaxMax.AsInteger + 1;
   qryMax.Close;


end;

procedure TfrmUsuarios.tblModulosUsuariosAfterPost(DataSet: TDataSet);
begin
  grd.SetFocus;
end;

procedure TfrmUsuarios.txtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext( TWinControl( Sender ), True, True );
    Key := #0;
  end;
end;

procedure TfrmUsuarios.FormDestroy(Sender: TObject);
begin
  frmUsuarios := nil;
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  tblUsuarios.Open;
  tblModulos.Open;
end;

procedure TfrmUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblModulos.Close;
  tblUsuarios.Close;
  Action := caFree;
end;

procedure TfrmUsuarios.btnNovoClick(Sender: TObject);
begin
  txtUsuario.SetFocus;

  tblUsuarios.Insert;
end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  tblUsuarios.Cancel;
end;

procedure TfrmUsuarios.tblUsuariosSenhaSetText(Sender: TField;
  const Text: String);
begin
   Sender.AsString := MD5Print(MD5String(Text));
end;

{ Verifica se foi excluído algum grupo de relatório.
}
function TfrmUsuarios.temGruposRelExcluidos: boolean;
const
   SQL_GRP_EXC =
      'SELECT '+
         'm.modulo '+
      'FROM '+
         'modulos  m '+
            'LEFT JOIN relatorios  r ON(r.ds_grupo = m.modulo) '+
      'WHERE '+
         'm.categoria = ''Impressão'' AND '+
         '(r.cd_relatorio IS NULL OR '+
            '(SELECT COUNT(*) FROM relatorios WHERE ds_grupo = m.modulo) = '+
		      '(SELECT COUNT(*) FROM relatorios WHERE ds_grupo = m.modulo AND sn_disponivel <> ''S'')) '+
      'GROUP BY '+
         'm.modulo';
var
   qyGrpExc: TUMZQuery;
begin
   DM.CriarConsulta(qyGrpExc);
   try
      qyGrpExc.ParamCheck := False;
      qyGrpExc.SQL.Text := SQL_GRP_EXC;
      qyGrpExc.Open;
      Result := not qyGrpExc.IsEmpty;
   finally
      qyGrpExc.Close;
      qyGrpExc.Free;
   end;
end;

{ Verifica se foi inserido algum novo grupo de relatório ao qual não foi
  associado permissão.
}
function TfrmUsuarios.temGruposRelNovos: boolean;
const
   SQL_GRP_NOVO =
      'SELECT '+
         'r.ds_grupo '+
      'FROM '+
         'relatorios r '+
            'LEFT JOIN modulos m ON(r.ds_grupo = m.modulo AND m.categoria = ''Impressão'') '+
      'WHERE '+
         'm.codigo IS NULL '+
      'GROUP BY '+
         'r.ds_grupo';
var
   qyGrpNovo: TUMZQuery;
begin
   DM.CriarConsulta(qyGrpNovo);
   try
      qyGrpNovo.ParamCheck := False;
      qyGrpNovo.SQL.Text := SQL_GRP_NOVO;
      qyGrpNovo.Open;
      Result := not qyGrpNovo.IsEmpty;
   finally
      qyGrpNovo.Close;
      qyGrpNovo.Free;
   end;
end;

procedure TfrmUsuarios.btnCopiarClick(Sender: TObject);
Var
   codigoNovo{, CodigoAtual} : Integer;
   novo_usuario : string;

begin
   if Mensagem('Deseja criar um novo usuário com os mesmos direito do usuário selecionado?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

   { Copiar usuário };

   //CodigoAtual := tblUsuariosCodigo.AsInteger;

   qryMax.Close;
   qryMax.Open;
   CodigoNovo := qryMaxMax.AsInteger + 1;
   qryMax.Close;

   Dm.qAux1.Close;
   Dm.qAux1.SQL.Clear;
   Dm.qAux1.sql.Add('insert into usuarios (codigo, nome, senha, sn_online)');
   Dm.qAux1.sql.Add('values (:codigo, :nome, :senha, :online)');

   novo_usuario := tblUsuariosNome.AsString + '_COPIA';

   Dm.qAux1.ParamByName('codigo').AsInteger := CodigoNovo;
   Dm.qAux1.ParamByName('nome').AsString := novo_usuario;
   Dm.qAux1.ParamByName('senha').AsString := '';
   Dm.qAux1.ParamByName('online').AsString := 'N';
   Dm.qAux1.ExecSQL;

   Dm.qAux1.Close;
   Dm.qAux1.Sql.Clear;
   Dm.qAux1.sql.Add('insert into modulosusuarios (codigousuario, codigomodulo, incluir, alterar, deletar, acessar, especial )');
   Dm.qAux1.sql.Add('VALUES ('+ IntToStr(CodigoNovo) +', :codigomodulo, :incluir, :alterar, :deletar, :acessar, :especial )');

   tblListaModulos.First;

   while not tblListaModulos.Eof do
   Begin
     try
      Dm.qAux1.ParamByName('codigomodulo').AsInteger := tblListaModulosCodigoModulo.ASInteger;
      Dm.qAux1.ParamByName('incluir').AsString := tblListaModulosIncluir.ASString;
      Dm.qAux1.ParamByName('alterar').AsString := tblListaModulosAlterar.ASString;
      Dm.qAux1.ParamByName('deletar').AsString := tblListaModulosDeletar.ASString;
      Dm.qAux1.ParamByName('acessar').AsString := tblListaModulosAcessar.ASString;
      Dm.qAux1.ParamByName('especial').AsString := tblListaModulosEspecial.ASString;
      Dm.qAux1.ExecSQL;

     finally
      tblListaModulos.Next;

     end;

   End;

   Mensagem('Usuário copiado com sucesso.', 'UNI-MESTRE', MB_OK + MB_ICONEXCLAMATION);

   tblUsuarios.Close;
   tblUsuarios.Open;
   tblUsuarios.Next;
   tblUsuarios.Locate('Nome', novo_usuario, []);

end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
   // Inicializar Usuarios
   Self.atualizaPermissoesGruposRel;
   qryInserePermNulas.ExecSQL;
   dm.tblModulos.Close;
   dm.tblModulos.Open;
   tblListaModulos.Close;
   tblListaModulos.Open;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin

   if DM.qryPermissoesDS_LOGIN.AsString = 'ADMIN' Then
   Begin

      if Mensagem('Tem certeza que deseja excluir o usuário selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYEs Then
      Begin
          Dm.qAux1.Close;
          Dm.qAux1.Sql.Clear;
          Dm.qAux1.sql.Add('delete from modulosusuarios');
          Dm.qAux1.sql.Add('where codigousuario = :codigo');
          Dm.qAux1.ParamByName('codigo').AsInteger := tblUsuariosCodigo.ASInteger;

         tblUsuarios.Delete;
         tblUsuarios.Close;
         tblUsuarios.Open;
      End;

   End
   Else // Não permitir qualquer usuário ter acesso a esta opção
   Begin

      if Mensagem('Você está prestes a excluir as permissões de um usuário e retirar seu acesso do UNIMESTRE, tem certeza que deseja prosseguir?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) =
      mrYEs Then
      Begin

        Dm.qAux1.Close;
        Dm.qAux1.Sql.Clear;
        Dm.qAux1.sql.Add('update modulosusuarios set incluir = ''N'', alterar = ''N'', deletar = ''N'', acessar = ''N'', especial = ''N''');
        Dm.qAux1.sql.Add('where codigousuario = :codigo and codigomodulo = :modulo');

        tblListaModulos.First;

        while not tblListaModulos.Eof do
        Begin
          try
            Dm.qAux1.ParamByName('codigo').AsInteger := tblListaModulosCodigoUsuario.ASInteger;
            Dm.qAux1.ParamByName('modulo').AsInteger := tblListaModulosCodigoModulo.ASInteger;

            Dm.qAux1.ExecSQL;

          finally
           tblListaModulos.Next;

          end;

        End;

        tblUsuarios.Edit;
        tblUsuariossn_online.AsString := 'N';
        tblUsuarios.Post;


      End;


   End;


end;

procedure TfrmUsuarios.tblUsuariosOnLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Dm.IsTrue(Sender.AsString) then
      Text := 'X'
   else
      Text := ' ';
end;

procedure TfrmUsuarios.tblListaModulosIncluirGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Dm.IsTrue(Sender.AsString) then
      Text := 'X'
   else
      Text := ' ';

end;

procedure TfrmUsuarios.tblListaModulosAlterarGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Dm.IsTrue(Sender.AsString) then
      Text := 'X'
   else
      Text := ' ';

end;

procedure TfrmUsuarios.tblListaModulosDeletarGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Dm.IsTrue(Sender.AsString) then
      Text := 'X'
   else
      Text := ' ';

end;

procedure TfrmUsuarios.tblListaModulosAcessarGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Dm.IsTrue(Sender.AsString) then
      Text := 'X'
   else
      Text := ' ';

end;

procedure TfrmUsuarios.tblListaModulosEspecialGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Dm.IsTrue(Sender.AsString) then
      Text := 'X'
   else
      Text := ' ';

end;

procedure TfrmUsuarios.grdDblClick(Sender: TObject);
var
   usuario, modulo : integer;
begin

   Dm.qAux1.Close;
   DM.qAux1.SQL.Clear;
   Dm.qAux1.SQL.Add(' update modulosusuarios ');

   case grd.SelectedIndex of
      2 : Begin // Acesso
             if Dm.isTrue(tblListaModulosAcessar.AsString) then
                Dm.qAux1.SQL.Add(' set Acessar = ''N''')
             else
                Dm.qAux1.SQL.Add(' set Acessar = ''S''');
          End;
      3 : Begin // Incluir
             if Dm.isTrue(tblListaModulosIncluir.AsString) then
                Dm.qAux1.SQL.Add(' set Incluir = ''N''')
             else
                Dm.qAux1.SQL.Add(' set Incluir = ''S''');
          End;
      4 : Begin // Alterar
             if Dm.isTrue(tblListaModulosAlterar.AsString) then
                Dm.qAux1.SQL.Add(' set Alterar = ''N''')
             else
                Dm.qAux1.SQL.Add(' set Alterar = ''S''');
          End;
      5 : Begin // Deletar
             if Dm.isTrue(tblListaModulosDeletar.AsString) then
                Dm.qAux1.SQL.Add(' set Deletar = ''N''')
             else
                Dm.qAux1.SQL.Add(' set Deletar = ''S''');
          End;
      6 : Begin // Especial
             if Dm.isTrue(tblListaModulosEspecial.AsString) then
                Dm.qAux1.SQL.Add(' set Acessar = ''N'', Incluir = ''N'', Alterar = ''N'', Deletar = ''N'', Especial = ''N''')
             else
                Dm.qAux1.SQL.Add(' set Acessar = ''S'', Incluir = ''S'', Alterar = ''S'', Deletar = ''S'', Especial = ''S''')
          End;
      Else
      Begin
         Exit;

      End

   end;

   DM.qAux1.SQL.Add('where codigousuario = :codigo and codigomodulo = :modulo');
   Dm.qAux1.ParamByName('codigo').AsInteger := tblListaModulosCodigoUsuario.ASInteger;
   Dm.qAux1.ParamByName('modulo').AsInteger := tblListaModulosCodigoModulo.ASInteger;
   Dm.qAux1.ExecSQL;

   usuario := tblListaModulos.FieldByName('CodigoUsuario').AsInteger;
   modulo  := tblListaModulos.FieldByName('CodigoModulo').AsInteger;

   tblListaModulos.Close;
   tblListaModulos.Open;

   tblListaModulos.Locate('CodigoUsuario;CodigoModulo', vararrayof([usuario, modulo]), []);

end;

procedure TfrmUsuarios.tblUsuariosOnLineSetText(Sender: TField;
  const Text: String);
begin
   if Text = 'X' then
      Sender.AsString := 'S'
   else
      Sender.AsString := 'N';

end;

procedure TfrmUsuarios.grdKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = 'X' then
   Begin
       grdDblClick(nil);
       Key := #0;
   End;
end;

procedure TfrmUsuarios.inserePermissoesGruposRel;

   { Pega o último código de módulo de impressão inserido.
   }
   function getCodigoMaior: integer;
   const
      SQL_COD_MAIOR = 'SELECT MAX(codigo) codigo FROM modulos WHERE categoria = ''Impressão''';
   var
      qyMaxCod: TUMZQuery;
   begin
      DM.CriarConsulta(qyMaxCod);
      try
         qyMaxCod.ParamCheck := False;
         qyMaxCod.SQL.Text := SQL_COD_MAIOR;
         qyMaxCod.Open;
         if qyMaxCod.FieldByName('codigo').IsNull then
            Result := 8000
         else
            Result := qyMaxCod.FieldByName('codigo').AsInteger;
      finally
         qyMaxCod.Close;
         qyMaxCod.Free;
      end;
   end;

   { Insere os novos módulos para definir permissões para grupos de relatórios.
   }
   procedure insereNovosModulos(AICodInicial: integer);
   const
      SQL_INSERE =
         'INSERT INTO modulos(codigo, categoria, modulo) VALUES(:codigo, ''Impressão'', :modulo)';
      SQL_NOVOS =
         'SELECT '+
            'r.ds_grupo '+
         'FROM '+
            'RELATORIOS r '+
               'LEFT JOIN MODULOS  m '+
                  'ON(r.ds_grupo = m.modulo AND m.categoria = ''Impressão'') '+
         'WHERE '+
            'm.codigo IS NULL '+
         'GROUP BY '+
            'r.ds_grupo';
   var
      qyInsMod, qyNovos: TUMZQuery;
   begin
      DM.CriarConsulta(qyNovos);
      try
         qyNovos.ParamCheck := False;
         qyNovos.SQL.Text := SQL_NOVOS;
         qyNovos.Open;
         if not qyNovos.IsEmpty then
         begin
            DM.CriarConsulta(qyInsMod);
            try
               qyInsMod.ParamCheck := True;
               qyInsMod.SQL.Text := SQL_INSERE;
               while not qyNovos.Eof do
               begin
                  Inc(AICodInicial);
                  qyInsMod.ParamByName('codigo').AsInteger := AICodInicial;
                  qyInsMod.ParamByName('modulo').AsString := qyNovos.FieldByName('ds_grupo').AsString;
                  qyInsMod.ExecSQL;
                  qyNovos.Next;
               end;
            finally
               qyInsMod.Free;
            end;
         end;
      finally
         qyNovos.Close;
         qyNovos.Free;
      end;
   end;

   { Insere as novas permissões.
   }
   procedure inserePermissoes;
   begin
      qryInserePermissoes.ExecSQL;

   end;

begin
   insereNovosModulos(getCodigoMaior);
   inserePermissoes;
end;

procedure TfrmUsuarios.pmQtdUsuariosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblUsuarios, pmQtdUsuarios);

end;

procedure TfrmUsuarios.pmQtdModulosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblListaModulos, pmQtdModulos);

end;

procedure TfrmUsuarios.popPrivilegiosPopup(Sender: TObject);
var
   lugar : Pointer;
   menu : TMenuItem;
begin
   // Preencher o Pop Menu
   tblUsuarios.DisableControls();
   lugar := tblUsuarios.GetBookmark();

   tblUsuarios.First;

   popPrivilegios.Items.Clear();

   while not tblUsuarios.EOF do begin

      menu := TMenuItem.Create(popPrivilegios);
      menu.Caption := tblUsuariosNome.AsString;
      menu.Tag := tblUsuariosCodigo.AsInteger;
      menu.OnClick := CopiarPrivilegios;
      popPrivilegios.Items.Add(menu);

      tblUsuarios.Next();
   end;

   menu := TMenuItem.Create(popPrivilegios);
   menu.Caption := '-';
   menu.Tag := 0;
   popPrivilegios.Items.Add(menu);

   menu := TMenuItem.Create(popPrivilegios);
   menu.Caption := 'Cancelar';
   menu.Tag := 0;
   popPrivilegios.Items.Add(menu);

   tblUsuarios.GotoBookmark(lugar);
   tblUsuarios.EnableControls();
end;

{ Remove as permissões dos usuários para os grupos de relatórios excluídos.
}
procedure TfrmUsuarios.removePermissoesGruposRel;
begin
   qryDeleteModUsuarios.ExecSQL;
   qryDeleteModulos.ExecSQL;
end;

procedure TfrmUsuarios.CopiarPrivilegios(Sender : TObject);
var
   qyConsulta : TUMZQuery;
   qyAltera : TUMZQuery;
begin
    DM.CriarConsulta(qyConsulta);
    qyConsulta.SQL.Text := 'SELECT  '+
                           ' *      '+
                           'FROM    '+
                           '  MODULOSUSUARIOS '+
                           'WHERE             '+
                           '  codigousuario = :usuario2';
    qyConsulta.ParamByName('usuario2').AsInteger := TMenuItem(Sender).Tag;
    qyConsulta.Open;
    DM.CriarConsulta(qyAltera);
    if Mensagem('Deseja atribuir as propriedades do usuário ' + TMenuItem(Sender).Caption + ' para o usuário ' + tblUsuariosNome.AsString + '?', 'Confirmação', MB_YESNOCANCEL ) <> mrYes then Exit;
      qyConsulta.First;

      while not(qyConsulta.Eof) do
      begin
         qyAltera.SQL.Text :=
         'UPDATE                    '+
         '  MODULOSUSUARIOS         '+
         'SET                       '+
         '  acessar = :acessar   ,'+
         '  alterar = :alterar   ,'+
         '  deletar = :deletar   ,'+
         '  incluir = :incluir   ,'+
         '  especial = :especial '+
         'WHERE                  '+
         '  codigousuario = :usuario1 AND codigomodulo  =:modulo';
         qyAltera.ParamByName('usuario1').AsInteger := tblUsuariosCodigo.AsInteger;
         qyAltera.ParamByName('acessar').AsString   := qyConsulta.FieldByName('acessar').AsString;
         qyAltera.ParamByName('alterar').AsString   := qyConsulta.FieldByName('alterar').AsString;
         qyAltera.ParamByName('deletar').AsString   := qyConsulta.FieldByName('deletar').AsString;
         qyAltera.ParamByName('incluir').AsString   := qyConsulta.FieldByName('incluir').AsString;
         qyAltera.ParamByName('especial').AsString  := qyConsulta.FieldByName('especial').AsString;
         qyAltera.ParamByName('modulo').AsInteger   :=  qyConsulta.FieldByName('codigomodulo').AsInteger;
         qyAltera.ExecSQL();
         qyConsulta.Next;
      end;


end;

procedure TfrmUsuarios.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.filtrado then
   begin
   
      if not (tblUsuarios.State in [dsEdit, dsInsert]) then
      begin
         tblUsuarios.Edit();
      end;
      
      tblUsuarios.FieldByName('cd_pessoa').AsInteger := resultado.cd_pessoa;
   end;
end;

procedure TfrmUsuarios.SpeedButton2Click(Sender: TObject);
begin
   if not (tblUsuarios.State in [dsEdit, dsInsert]) then begin
      tblUsuarios.Edit();
   end;
   tblUsuarios.FieldByName('cd_pessoa').AsString := '';
   tblUsuarios.Post();
end;

end.

