{
#TIT= Módulos e Usuários
#OBJ= Definir permissôes a usuários bem como cadastrar e excluir os mesmos
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Db, DBTables, Buttons, Mask, Grids, DBGrids,
  General, ComCtrls, ToolWin, ImgList, md5, Variants, Menus, ZAbstractRODataset,
  ZAbstractDataset, UZDataset;

type
  TfrmUsuarios = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dtcUsuarios: TDataSource;
    tblUsuarios: TUMZQuery;
    tblUsuariosCodigo: TIntegerField;
    tblUsuariosNome: TStringField;
    tblModulos: TUMZQuery;
    tblModulosCodigo: TSmallintField;
    dtcModulos: TDataSource;
    grd: TDBGrid;
    tblModulosModulo: TStringField;
    qryMax: TUMZQuery;
    qryMaxMax: TIntegerField;
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
    Bevel3: TBevel;
    Bevel5: TBevel;
    tblModulosCategoria: TStringField;
    tblListaModulos: TUMZQuery;
    dsListaModulos: TDataSource;
    tblListaModulosCodigoUsuario: TIntegerField;
    tblListaModulosCodigoModulo: TSmallintField;
    tblListaModulosCodigo: TSmallintField;
    tblListaModulosCategoria: TStringField;
    tblListaModulosModulo: TStringField;
    tblUsuariosSenha: TStringField;
    tblUsuariosOnLine: TStringField;
    tblListaModulosIncluir: TStringField;
    tblListaModulosAlterar: TStringField;
    tblListaModulosDeletar: TStringField;
    tblListaModulosAcessar: TStringField;
    tblListaModulosEspecial: TStringField;
    btnCopiar: TToolButton;
    ToolButton3: TToolButton;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    txtUsuario: TDBEdit;
    Label2: TLabel;
    txtSenha: TDBEdit;
    DBCheckBox7: TDBCheckBox;
    pmQtdUsuarios: TPopupMenu;
    pmQtdModulos: TPopupMenu;
    UMZQuery1: TUMZQuery;
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
    procedure tblUsuariosAfterPost(DataSet: TDataSet);
    procedure grdDblClick(Sender: TObject);
    procedure tblUsuariosOnLineSetText(Sender: TField; const Text: String);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdUsuariosPopup(Sender: TObject);
    procedure pmQtdModulosPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
    VK_F4 : if btnSalvar.Enabled then btnSalvarClick( nil );
{    VK_F5 : if btnExcluir.Enabled then btnExcluirClick( nil );}
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
  end;
end;


procedure TfrmUsuarios.tblUsuariosBeforePost(DataSet: TDataSet);
begin

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

procedure TfrmUsuarios.btnCopiarClick(Sender: TObject);
Var
   codigoNovo, CodigoAtual : Integer;
   novo_usuario : string;

begin
   if MessageDlg('Deseja criar um novo usuário com os mesmos direito do usuário selecionado?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then Exit;

   { Copiar usuário };

   CodigoAtual := tblUsuariosCodigo.AsInteger;

   qryMax.Close;
   qryMax.Open;
   CodigoNovo := qryMaxMax.AsInteger + 1;
   qryMax.Close;

   Dm.qyAux1.Close;
   Dm.qyAux1.SQL.Clear;
   Dm.qyAux1.sql.Add('insert into usuarios (codigo, nome, senha, online)');
   Dm.qyAux1.sql.Add('values (:codigo, :nome, :senha, :online)');

   novo_usuario := tblUsuariosNome.AsString + '_COPIA';

   Dm.qyAux1.ParamByName('codigo').AsInteger := CodigoNovo;
   Dm.qyAux1.ParamByName('nome').AsString := novo_usuario;
   Dm.qyAux1.ParamByName('senha').AsString := '';
   Dm.qyAux1.ParamByName('online').AsString := 'N';
   Dm.qyAux1.ExecSQL;

   Dm.qyAux1.Close;
   Dm.qyAux1.Sql.Clear;
   Dm.qyAux1.sql.Add('insert into modulosusuarios (codigousuario, codigomodulo, incluir, alterar, deletar, acessar, especial )');
   Dm.qyAux1.sql.Add('VALUES ('+ IntToStr(CodigoNovo) +', :codigomodulo, :incluir, :alterar, :deletar, :acessar, :especial )');

   tblListaModulos.First;

   while not tblListaModulos.Eof do
   Begin
     try
      Dm.qyAux1.ParamByName('codigomodulo').AsInteger := tblListaModulosCodigoModulo.ASInteger;
      Dm.qyAux1.ParamByName('incluir').AsString := tblListaModulosIncluir.ASString;
      Dm.qyAux1.ParamByName('alterar').AsString := tblListaModulosAlterar.ASString;
      Dm.qyAux1.ParamByName('deletar').AsString := tblListaModulosDeletar.ASString;
      Dm.qyAux1.ParamByName('acessar').AsString := tblListaModulosAcessar.ASString;
      Dm.qyAux1.ParamByName('especial').AsString := tblListaModulosEspecial.ASString;

      Dm.qyAux1.ExecSQL;

     finally
      tblListaModulos.Next;

     end;

   End;

   MessageDlg('Usuário copiado com sucesso.', mtInformation, [mbOk], 0);

   tblUsuarios.Close;
   tblUsuarios.Open;
   tblUsuarios.Locate('Nome', novo_usuario, []);

end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
   dm.tbModulos.Close;
   dm.tbModulos.Open;
   tblListaModulos.Close;
   tblListaModulos.Open;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin

   if DM.qyUsuariosNome.FieldByName('Nome').AsString = 'ADMIN' Then
   Begin

      if Messagedlg('Tem certeza que deseja excluir o usuário selecionado?', mtInformation, [mbYes, mbNo], 0) =
      mrYEs Then
      Begin
          Dm.qyAux1.Close;
          Dm.qyAux1.Sql.Clear;
          Dm.qyAux1.sql.Add('delete from modulosusuarios');
          Dm.qyAux1.sql.Add('where codigousuario = :codigo');
          Dm.qyAux1.ParamByName('codigo').AsInteger := tblUsuariosCodigo.ASInteger;

         tblUsuarios.Delete;
         tblUsuarios.Close;
         tblUsuarios.Open;
      End;

   End
   Else // Não permitir qualquer usuário ter acesso a esta opção
   Begin

      if Messagedlg('A exclusão de usuários só pode ser feita pelo Administrador do Sistema, porém é possível retirar todos os acessos desse usuário. Deseja continuar?', mtInformation, [mbYes, mbNo], 0) =
      mrYEs Then
      Begin

        Dm.qyAux1.Close;
        Dm.qyAux1.Sql.Clear;
        Dm.qyAux1.sql.Add('update modulosusuarios set incluir = ''N'', alterar = ''N'', deletar = ''N'', acessar = ''N'', especial = ''N''');
        Dm.qyAux1.sql.Add('where codigousuario = :codigo and codigomodulo = :modulo');

        tblListaModulos.First;

        while not tblListaModulos.Eof do
        Begin
          try
            Dm.qyAux1.ParamByName('codigo').AsInteger := tblListaModulosCodigoUsuario.ASInteger;
            Dm.qyAux1.ParamByName('modulo').AsInteger := tblListaModulosCodigoModulo.ASInteger;

            Dm.qyAux1.ExecSQL;

          finally
           tblListaModulos.Next;

          end;

        End;

        tblUsuarios.Edit;
        tblUsuariosOnLine.AsString := 'N';
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

procedure TfrmUsuarios.tblUsuariosAfterPost(DataSet: TDataSet);
begin

    Dm.tbModulos.First;
    { Inserir os Modulos para o usuário ao Salvar }

    Dm.qyAux1.Close;
    Dm.qyAux1.SQL.Clear;
    DM.qyAux1.SQL.Add('INSERT INTO modulosusuarios ');
    Dm.qyAux1.SQL.Add('(codigousuario, codigomodulo, incluir, alterar, deletar, acessar, especial) ');
    Dm.qyAux1.SQL.Add(' VALUES (:usuario, :modulo, ''N'', ''N'', ''N'', ''N'', ''N'')');

    While not Dm.tbModulos.Eof do
    Begin // preencher todos os novos módulos para o usuário

         try
             DM.qyAux1.ParamByName('usuario').AsInteger := tblUsuariosCodigo.AsInteger;
             DM.qyAux1.ParamByName('modulo').AsInteger := Dm.tbModulos.FieldByName('Codigo').AsInteger;
             DM.qyAux1.ExecSQL;
         except
              // Se o usuário ja possui esse modulo relacionado
         end;

         Dm.tbModulos.Next;

    End;


end;

procedure TfrmUsuarios.grdDblClick(Sender: TObject);
var
   usuario, modulo : integer;
begin

   Dm.qyAux1.Close;
   DM.qyAux1.SQL.Clear;
   Dm.qyAux1.SQL.Add(' update modulosusuarios ');

   case grd.SelectedIndex of
      2 : Begin // Acesso
             if Dm.isTrue(tblListaModulosAcessar.AsString) then
                Dm.qyAux1.SQL.Add(' set Acessar = ''N''')
             else
                Dm.qyAux1.SQL.Add(' set Acessar = ''S''');
          End;
      3 : Begin // Incluir
             if Dm.isTrue(tblListaModulosIncluir.AsString) then
                Dm.qyAux1.SQL.Add(' set Incluir = ''N''')
             else
                Dm.qyAux1.SQL.Add(' set Incluir = ''S''');
          End;
      4 : Begin // Alterar
             if Dm.isTrue(tblListaModulosAlterar.AsString) then
                Dm.qyAux1.SQL.Add(' set Alterar = ''N''')
             else
                Dm.qyAux1.SQL.Add(' set Alterar = ''S''');
          End;
      5 : Begin // Deletar
             if Dm.isTrue(tblListaModulosDeletar.AsString) then
                Dm.qyAux1.SQL.Add(' set Deletar = ''N''')
             else
                Dm.qyAux1.SQL.Add(' set Deletar = ''S''');
          End;
      6 : Begin // Especial
             if Dm.isTrue(tblListaModulosEspecial.AsString) then
                Dm.qyAux1.SQL.Add(' set Acessar = ''N'', Incluir = ''N'', Alterar = ''N'', Deletar = ''N'', Especial = ''N''')
             else
                Dm.qyAux1.SQL.Add(' set Acessar = ''S'', Incluir = ''S'', Alterar = ''S'', Deletar = ''S'', Especial = ''S''')
          End;
      Else
      Begin
         Exit;

      End

   end;

   DM.qyAux1.SQL.Add('where codigousuario = :codigo and codigomodulo = :modulo');
   Dm.qyAux1.ParamByName('codigo').AsInteger := tblListaModulosCodigoUsuario.ASInteger;
   Dm.qyAux1.ParamByName('modulo').AsInteger := tblListaModulosCodigoModulo.ASInteger;
   Dm.qyAux1.ExecSQL;

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

procedure TfrmUsuarios.pmQtdUsuariosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblUsuarios, pmQtdUsuarios);

end;

procedure TfrmUsuarios.pmQtdModulosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblListaModulos, pmQtdModulos);

end;

end.
