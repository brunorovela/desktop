unit UFControlePerm;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
   DBCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   Contnrs, ImgList, ZSqlProcessor, General, ZDbcIntfs, UMComboBox;

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
      sbxPermissoes: TScrollBox;
      pnlPermissoesTit: TPanel;
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
      qryModulosCD_MODULO: TIntegerField;
      qryModulosDS_NOME_MODULO: TStringField;
      qryModulosDS_DESCRICAO: TStringField;
      qryModulosDS_CHAVE: TStringField;
      qryModulosSN_FIXO: TSmallintField;
      qryModulosSN_ONLINE: TSmallintField;
      qryModulosME_ICONE: TBlobField;
      qryModulosSN_VISUAL: TSmallintField;
      qryModulosNR_ORDEM: TLargeintField;
      qryPermissoesCD_ACAO: TIntegerField;
      qryInserePerm: TUMZQuery;
      qryInserePermNR_PERMISSAO: TIntegerField;
      qryInserePermCD_PERMISSAO: TIntegerField;
      qryInserePermCD_GRUPO: TIntegerField;
      qryInserePermCD_ACAO: TIntegerField;
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
    lblFocus: TLabel;
    sbAdicionarGrupos: TSpeedButton;
    btnCopiarPriv: TToolButton;
    btnMarcar: TToolButton;
    btnDesmarcar: TToolButton;
    btnSep1: TToolButton;
    btnSep2: TToolButton;
    cbColigadas: TUMComboBox;
    procedure pgcOpcoesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure cbColigadasChange(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnCopiarPrivClick(Sender: TObject);
    procedure sbAdicionarClick(Sender: TObject);
    procedure sbAdicionarGruposClick(Sender: TObject);
    procedure ledUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure dbgModulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbxPermissoesClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
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
   strict private
      procedure CarregarColigadas();
      procedure CarregarPessoasGruposColigadas(ordenacao: string = '');
   private
      FBgerou   : Boolean;
      FCodGrupo : Integer;
      ContadorObjs :  integer ;
      procedure setBgerou(Bgerou : Boolean);
      procedure checkTodosClick(Sender: TObject);
      function  getBgerou: Boolean;
      procedure CheckPermissoesClick(Sender: TObject);
      procedure CheckPermissoesKeyPress(Sender: TObject; var Key: Char );
      procedure LabelPermiClick(Sender: TObject);
      procedure LabelSetFocusClick(Sender: TObject);
   public
      procedure setCodGrupo(CodGrupo : Integer);
      function  getCodGrupo: Integer;
   end;

var
  FControlePerm: TFControlePerm;
  ListaItens: TObjectList;
  StrUltimoRegistro: string;
  SqlOrigemUsuario : String;
  bChecandoTodos   : Boolean;
  bAlterandoPerm   : Boolean;
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
    //  begin
   begin
      dbgModulos.Canvas.Brush.Color:=clBlue; //Altere para a cor q vc deseja
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
var
   Topo : Integer;
   i    : Integer;
   Esquerda : Integer;
   EsquerdaTopo : Integer;
   Inctopo : Integer;
   NomeAcao : string;
   RestoNome : string;
   Permissao : Boolean;
   Perm1  : TCheckBox;
   Perm2  : TCheckBox;
   Perm3  : TCheckBox;
   Perm4  : TCheckBox;
   Perm5  : TCheckBox;
begin
   qryPermissoes.Close;
   qryPermissoes.ParamByName('cd_grupo').AsInteger  := getCodGrupo ;
   qryPermissoes.ParamByName('cd_modulo').AsInteger := qryModulosCD_MODULO.AsInteger;
   qryPermissoes.Open;
   Topo:= 25 ;
   // variaveis para controle de espaçamento do topo
   EsquerdaTopo := 602;
   Inctopo := 50;

   sbxPermissoes.Visible := false;

   LockWindowUpdate(sbxPermissoes.Handle);
   if ContadorObjs <> 0 then
   begin
      if getBgerou = false then
      begin
         for I := ContadorObjs -1  downto 0 do
         begin
            ListaItens.Delete(I);
         end;
         setBgerou(true);
      end;
   end;

   // criando os Tlabels do cabecalho
   ListaItens.Add(TLabel.Create(sbxPermissoes));
   with TLabel(ListaItens.Items[0]) do begin
      Width := 15;
      Caption := 'Acesso';
      Parent := sbxPermissoes;
      Left := EsquerdaTopo;
      Top := Topo;
      Visible := True;
   end;
   EsquerdaTopo  := EsquerdaTopo + Inctopo;
   ListaItens.Add(TLabel.Create(sbxPermissoes));

   with TLabel(ListaItens.Items[1]) do begin
      Width := 15;
      Caption := 'Inclusão';
      Parent := sbxPermissoes;
      Left :=  EsquerdaTopo;
      Top := Topo;
      Visible := True;
   end;
   EsquerdaTopo  := EsquerdaTopo + Inctopo;
   ListaItens.Add(TLabel.Create(sbxPermissoes));

   with TLabel(ListaItens.Items[2]) do begin
      Width := 15;
      Caption := 'Alteração';
      Parent := sbxPermissoes;
      Left := EsquerdaTopo;
      Top := Topo;
      Visible := True;
   end;
   ListaItens.Add(TLabel.Create(sbxPermissoes));
   EsquerdaTopo  := EsquerdaTopo + Inctopo;

   with TLabel(ListaItens.Items[3]) do begin
      Width := 15;
      Caption := 'Exclusão';
      Parent := sbxPermissoes;
      Left :=  EsquerdaTopo ;
      Top := Topo;
      Visible := True;
   end;
   EsquerdaTopo  := EsquerdaTopo + Inctopo;
   ListaItens.Add(TLabel.Create(sbxPermissoes));
   with TLabel(ListaItens.Items[4]) do begin
      Width := 15;
      Caption := 'Especial';
      Parent := sbxPermissoes;
      Left := EsquerdaTopo;
      Top := Topo;
      Visible := True;
   end;
   EsquerdaTopo  := EsquerdaTopo + Inctopo;
   ListaItens.Add(TLabel.Create(sbxPermissoes));

   with TLabel(ListaItens.Items[5]) do begin
      Width := 15;
      Caption := 'Selecionar Todas';
      Parent := sbxPermissoes;
      Left := EsquerdaTopo;
      Top := Topo;
      Visible := True;
   end;

   // inicializa o contador de objetos em 6 devid aos objetos ja criados
   ContadorObjs := 6;
   // agora começa a criação das checkbox
   topo := Topo + 30;
   esquerda := 15;
   with qryPermissoes do
   begin
      while not eof do
      begin
         esquerda := 15;
         ListaItens.Add(TBevel.Create(sbxPermissoes));
         with TBevel(ListaItens[ContadorObjs]) do
         begin
            Parent := sbxPermissoes;
            Left := esquerda;
            OnClick :=LabelSetFocusClick;
            Width := 1000;
            Top := Topo-10;
            Height := 2;
            Shape := bsTopLine;
            Visible := true;
         end;
         inc(ContadorObjs);
         // assume o nome ação = nome da permissão
         NomeAcao := qryPermissoesNOME.AsString;
         RestoNome := '';
         // se a string for grande separa ela em duas
         if Length(qryPermissoesNOME.AsString)>350 then
         begin
            NomeAcao := Copy(qryPermissoesNOME.AsString ,0,350);
            RestoNome := Copy(qryPermissoesNOME.AsString,350,Length(qryPermissoesNOME.AsString));
            // cria o label que mostra todo nome
            ListaItens.Add( TLabel.Create(sbxPermissoes));
            with TLabel(ListaItens[ContadorObjs]) do
            begin
               WordWrap := true;
               Width    := 400;
               caption  := NomeAcao+RestoNome;
               Parent   := sbxPermissoes;
               Left     := esquerda;
               Top      := topo;
               Visible  := false;
            end;
            Inc(ContadorObjs);
         end;

         ListaItens.Add(TLabel.Create(sbxPermissoes));
         with TLabel(ListaItens[ContadorObjs]) do
         begin
            Width   := 200;
            // o name dele vai ser o ContadorObjs anterior
            Name    := 'lbl_'+IntToStr(ContadorObjs-1);
            if (RestoNome = '') then
            begin
               Caption := NomeAcao
            end
            else
            begin
               OnClick := LabelPermiClick;
               Caption := NomeAcao+'(...)';
            end;
            OnClick :=LabelSetFocusClick;
            Parent  := sbxPermissoes;
            Left    := 15;
            Top     := topo + 2;
            Visible := True;
         end;
         inc(ContadorObjs);
         Perm1 := TCheckBox.Create(sbxPermissoes);
         ListaItens.Add(Perm1);
         esquerda := esquerda + 600;

         with TCheckBox(ListaItens[ContadorObjs]) do
         begin
            Width := 15;
            Caption := '';
            Name := 'chk_'+qryPermissoesCD_ACAO.AsString+'_1'+'_'+IntToStr(ContadorObjs);
            parent := sbxPermissoes;
            Left := esquerda;
            Top := topo+2;
            Checked := (1 and qryPermissoesPERMISSAO.AsInteger = 1) ;
            OnClick := CheckPermissoesClick;
            OnKeyPress := CheckPermissoesKeyPress;
         end;
         inc(ContadorObjs);
         Perm2 := TCheckBox.Create(sbxPermissoes);
         ListaItens.Add(Perm2);
         esquerda := Esquerda + 50;

         with TCheckBox(ListaItens[ContadorObjs]) do
         begin
            Width := 15;
            Name := 'chk_'+qryPermissoesCD_ACAO.AsString+'_2'+'_'+IntToStr(ContadorObjs-1);
            Caption := '';
            Parent := sbxPermissoes;
            Left := esquerda;
            Top := topo+2;
            Checked := (2 and qryPermissoesPERMISSAO.AsInteger = 2);
            OnClick := CheckPermissoesClick;
            OnKeyPress := CheckPermissoesKeyPress;
         end;
         inc(ContadorObjs);
         Perm3 := TCheckBox.Create(sbxPermissoes);
         ListaItens.Add(Perm3);
         esquerda := Esquerda + 50;

         with TCheckBox(ListaItens[ContadorObjs])do
         begin
            Width := 15;
            Name := 'chk_'+qryPermissoesCD_ACAO.AsString+'_4'+'_'+IntToStr(ContadorObjs-2);
            Caption := '';
            Parent := sbxPermissoes;
            Left := esquerda;
            Top := topo+2;
            Checked := (4 and qryPermissoesPERMISSAO.AsInteger = 4);
            OnClick := CheckPermissoesClick;
            OnKeyPress := CheckPermissoesKeyPress;
         end;
         inc(ContadorObjs);
         Perm4 := TCheckBox.Create(sbxPermissoes);
         ListaItens.Add(Perm4);
         esquerda := Esquerda + 50;

         with TCheckBox(ListaItens[ContadorObjs])do
         begin
            Width := 15;
            Name := 'chk_'+qryPermissoesCD_ACAO.AsString+'_8'+'_'+IntToStr(ContadorObjs-3);
            Caption := '';
            Parent := sbxPermissoes;
            Left := esquerda;
            Top := topo+2;
            Checked := (8 and qryPermissoesPERMISSAO.AsInteger = 8);
            OnClick := CheckPermissoesClick;
            OnKeyPress := CheckPermissoesKeyPress;
         end;
         inc(ContadorObjs);
         Perm5 := TCheckBox.Create(sbxPermissoes);
         ListaItens.Add(Perm5);
         esquerda := Esquerda + 50;

         with TCheckBox(ListaItens[ContadorObjs]) do
         begin
            Width := 15;
            Name := 'chk_'+qryPermissoesCD_ACAO.AsString+'_16'+'_'+IntToStr(ContadorObjs-4);
            Caption := '';
            Parent := sbxPermissoes;
            Left := esquerda;
            Top := topo+2;
            Checked := (16 and qryPermissoesPERMISSAO.AsInteger = 16);
            OnClick := CheckPermissoesClick;
            OnKeyPress := CheckPermissoesKeyPress;
         end;
         inc(ContadorObjs);
         ListaItens.Add(TCheckBox.Create(sbxPermissoes));
         esquerda := Esquerda + 50;
         with TCheckBox(ListaItens[ContadorObjs])  do
         begin
            Width := 15;
            Name := 'chk_'+qryPermissoesCD_ACAO.AsString+'_'+IntToStr(ContadorObjs) ;
            Caption := '';
            Parent := sbxPermissoes;
            Left := esquerda;
            Top := topo+2;
            Checked := Perm1.Checked and Perm2.Checked and Perm3.Checked and Perm4.Checked
                       and Perm5.Checked ;
         
            OnClick := checkTodosClick;
            OnKeyPress := CheckPermissoesKeyPress;
         end;
         inc(ContadorObjs);
         topo := Topo + 38;
         Next;
      end;
   end;
  LockWindowUpdate(0);
   sbxPermissoes.Visible :=true;
   setBgerou(false);

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

   if (DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo,
      'UMNucleo.Grupos.DefinirHierarquias', npAcesso, False )) then
   begin
      Application.CreateForm(TFAlteraGrupo , FAlteraGrupo );
   end
   else
   begin
      Mensagem('Você não possui permissão de acesso a esta tela');
   end;

end;

procedure TFControlePerm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFControlePerm.FormCreate(Sender: TObject);
begin
   setBgerou(false);
   bAlterandoPerm := false;
   bChecandoTodos := false;
   // cria a objectlist para armazenar os obbjetos
   ListaItens := TObjectList.Create;

   tbsPermissoes.Enabled := False;
   tbsColigadas.Enabled := False;

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

procedure TFControlePerm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
   msg: Cardinal;
   code: Cardinal;
   i, n: Integer;
begin
   if WindowFromPoint( mouse.Cursorpos ) = sbxPermissoes.Handle then begin
      Handled := true;
   if ssShift In Shift Then
      msg := WM_HSCROLL
   else
   msg := WM_VSCROLL;

   if WheelDelta < 0 Then
      code := SB_LINEDOWN
   else
      code := SB_LINEUP;
   n:= Mouse.WheelScrollLines;
   for i:= 1 to n Do
      sbxPermissoes.Perform( msg, code, 0 );
      sbxPermissoes.Perform( msg, SB_ENDSCROLL, 0 );
   end;
end;

function TFControlePerm.getBgerou : Boolean ;
begin
   Result := FBgerou;
end;

procedure TFControlePerm.setBgerou(Bgerou : Boolean);
begin
   FBgerou := Bgerou;
end;

procedure TFControlePerm.btnCopiarPrivClick(Sender: TObject);
begin
   Application.CreateForm(TfGrupoCopiarPerms, fGrupoCopiarPerms);
   fGrupoCopiarPerms.GroupCode := FCodGrupo;
   fGrupoCopiarPerms.GroupName := ledGrupo.Text;
   if fGrupoCopiarPerms.ShowModal = mrOk then dsModulosDataChange(dsModulos, nil);
end;

procedure TFControlePerm.btnDesmarcarClick(Sender: TObject);
const
   SCaption = 'Confirmação';
   SMsgConfirm = 'Tem certeza que deseja desmarcar todas as permissões para o grupo [%s] no módulo [%s]?';
var
   Msg: string;
   Statement: IZPreparedStatement;
begin
   Msg := Format(SMsgConfirm, [ledGrupo.Text, qryModulosDS_NOME_MODULO.AsString]);
   if MessageBox(Handle, PChar(Msg), PChar(SCaption), MB_ICONQUESTION or MB_YESNO) = ID_YES then
   begin
      DM.db.ShowSQLHourGlass;
      Application.ProcessMessages;

      Statement := PrepareStatement('UPDATE NU_GRUPOS_PERMISSOES SET NR_PERMISSAO = 0 WHERE CD_GRUPO = ? AND NR_PERMISSAO <> 0 AND CD_ACAO IN (SELECT CD_ACAO FROM NU_MODULOS_ACOES WHERE CD_MODULO = ?)');
      try
         Statement.SetInt(1, FCodGrupo);
         Statement.SetInt(2, qryModulosCD_MODULO.AsInteger);
         Statement.ExecutePrepared;
      finally
         Statement.Close;
      end;

      DM.db.HideSQLHourGlass;
      Application.ProcessMessages;
      dsModulosDataChange(dsModulos, nil);
   end;
end;

procedure TFControlePerm.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFControlePerm.btnMarcarClick(Sender: TObject);
const
   SCaption = 'Confirmação';
   SMsgConfirm = 'Tem certeza que deseja marcar todas as permissões para o grupo [%s] no módulo [%s]?';
var
   Msg: string;
   Statement: IZPreparedStatement;
begin
   Msg := Format(SMsgConfirm, [ledGrupo.Text, qryModulosDS_NOME_MODULO.AsString]);
   if MessageBox(Handle, PChar(Msg), PChar(SCaption), MB_ICONQUESTION or MB_YESNO) = ID_YES then
   begin
      DM.db.ShowSQLHourGlass;
      Application.ProcessMessages;
      Statement := PrepareStatement('UPDATE NU_GRUPOS_PERMISSOES SET NR_PERMISSAO = 31 WHERE CD_GRUPO = ? AND NR_PERMISSAO <> 31 AND CD_ACAO IN (SELECT CD_ACAO FROM NU_MODULOS_ACOES WHERE CD_MODULO = ?)');
      try
         Statement.SetInt(1, FCodGrupo);
         Statement.SetInt(2, qryModulosCD_MODULO.AsInteger);
         Statement.ExecutePrepared;
      finally
         Statement.Close;
      end;

      Statement := PrepareStatement('INSERT INTO NU_GRUPOS_PERMISSOES (CD_GRUPO, CD_ACAO, NR_PERMISSAO) SELECT ?, A.CD_ACAO, 31 FROM NU_MODULOS_ACOES A LEFT JOIN NU_GRUPOS_PERMISSOES P ON (A.CD_ACAO = P.CD_ACAO) AND (P.CD_GRUPO = ?) WHERE P.CD_PERMISSAO IS NULL AND A.CD_MODULO = ?');
      try
         Statement.SetInt(1, FCodGrupo);
         Statement.SetInt(2, FCodGrupo);
         Statement.SetInt(3, qryModulosCD_MODULO.AsInteger);
         Statement.ExecutePrepared;
      finally
         Statement.Close;
      end;
      DM.db.HideSQLHourGlass;
      Application.ProcessMessages;
      dsModulosDataChange(dsModulos, nil);
   end;
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

procedure TFControlePerm.CheckPermissoesClick(Sender : TObject);
var
   LstPermAlterada  : TStringList;
   Permissao        : string;
   Valor            : string;
   chkTodos         : TCheckBox;
   codPrimeiroLinha : Integer;
   i                : Integer;
   bPerms           : Boolean;
begin

   if not(DM.UsuarioLogado.TemPermissao( 3001, npIncluir, False )) then
   begin
     TCheckBox(Sender).OnClick := nil;

      if(TCheckBox(Sender).Checked = false) then
      begin
         TCheckBox(Sender).State := cbChecked;
      end
      else
      begin
         TCheckBox(Sender).State := cbUnchecked;
      end;

      TCheckBox(Sender).OnClick := CheckPermissoesClick;

      Mensagem('Você possui apenas a permissão de acesso.');
      
      exit;
   end;

   lstPermAlterada := TStringList.Create;
   bAlterandoPerm  := true;
   ExtractStrings(['_'], [' '],
               PChar(TCheckBox(Sender).name), lstPermAlterada);

   Permissao := LstPermAlterada.Strings[1];
   Valor     := LstPermAlterada.Strings[2];

   qryInserePerm.Close;
   qryInserePerm.ParamByName('cd_grupo').AsInteger := getCodGrupo;
   qryInserePerm.ParamByName('cd_acao').AsInteger  := StrToInt(Permissao);
   qryInserePerm.Open;

   if (TCheckBox(Sender).Checked) then
   begin
      qryInserePerm.Edit;

      qryInserePermCD_GRUPO.AsInteger  := getCodGrupo;
      qryInserePermCD_ACAO.AsInteger   := StrToInt(Permissao);
      qryInserePermNR_PERMISSAO.AsInteger := qryInserePermNR_PERMISSAO.AsInteger
                                             + StrToInt(Valor);
      DM.setLog(1,'Inclusao',intToStr(getCodGrupo)+':'+qryInserePermCD_ACAO.AsString+':'+qryInserePermNR_PERMISSAO.AsString+'-'+DateToStr(now()), DM.UsuarioLogado.ColigadaLogada, 'Foi adicionada a perm '+qryInserePermCD_ACAO.AsString+'('+Valor+') para o grupo '+qryInserePermCD_GRUPO.AsString +' '+DateTimeToStr(Now));
      qryInserePerm.Post;
   end
   else
   begin
      qryInserePerm.Edit;

      qryInserePermCD_GRUPO.AsInteger  := getCodGrupo;
      qryInserePermCD_ACAO.AsInteger   := StrToInt(Permissao);
      qryInserePermNR_PERMISSAO.AsInteger := qryInserePermNR_PERMISSAO.AsInteger
                                             - StrToInt(Valor);
      DM.setLog(1,'Exclusao',intToStr(getCodGrupo)+':'+qryInserePermCD_ACAO.AsString+':'+qryInserePermNR_PERMISSAO.AsString+'-'+DateToStr(now()), DM.UsuarioLogado.ColigadaLogada, 'Foi excluida a perm '+qryInserePermCD_ACAO.AsString+'('+valor+') para o grupo '+qryInserePermCD_GRUPO.AsString+' '+DateTimeToStr(Now) );
      qryInserePerm.Post;

   end;
   // tira o check do botao todos caso seja desbilitado
   codPrimeiroLinha := StrToInt(LstPermAlterada[3]);
   chkTodos := TCheckBox(ListaItens[codPrimeiroLinha+5]);
   bPerms := true;
   if(TCheckBox(Sender).Checked = false) then
   begin
      chkTodos.Checked := false;
   end
   else
   begin
      // checa se todos estão prenchidos

      if TCheckBox(Sender).Checked = true then
      begin
         for i := codPrimeiroLinha to codPrimeiroLinha + 4  do
         begin
            bPerms := bPerms and TCheckBox(ListaItens[i]).Checked;
         end;

      end;
      chkTodos.Checked := bPerms or bChecandoTodos;
   end;
   lstPermAlterada.Free;
   bAlterandoPerm := false;
end;

procedure TFControlePerm.CheckPermissoesKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFControlePerm.LabelSetFocusClick(Sender: TObject);
begin
   sbxPermissoes.SetFocus;
end;


procedure TFControlePerm.ledUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13 ) then
      sbFiltrar.Click;
end;

procedure TFControlePerm.LabelPermiClick(Sender: TObject);
var
   ContObjs : integer;
begin
   Tlabel(Sender).Visible := false;
   ContObjs := StrToInt(Copy(TLabel(Sender).Name ,5 , Length(TLabel(Sender).Name)));
   Tlabel(ListaItens[ContObjs]).Visible := true;
   sbxPermissoes.SetFocus;
end;

procedure TFControlePerm.checkTodosClick(Sender: TObject);
var

   lstPermTodos : TStringList;
   cont : Integer;
   i : Integer;
begin

   if not(DM.UsuarioLogado.TemPermissao( 3001, npIncluir, False )) then
   begin
     TCheckBox(Sender).OnClick := nil;

      if(TCheckBox(Sender).Checked = false) then
      begin
         TCheckBox(Sender).State := cbChecked;
      end
      else
      begin
         TCheckBox(Sender).State := cbUnchecked;
      end;

      TCheckBox(Sender).OnClick := CheckPermissoesClick;

      Mensagem('Você possui apenas a permissão de acesso.');

      exit;
   end;

   lstPermTodos := TStringList.Create;

   ExtractStrings(['_'], [' '],
               PChar(TCheckBox(Sender).name), lstPermTodos);
   if TCheckBox(Sender).Checked = true then
   begin
      bChecandoTodos := true;
      for i := StrToInt(lstPermTodos[2]) downto  StrToInt(lstPermTodos[2])-5 do
      begin
         TCheckBox(ListaItens[i]).Checked := true
      end;
      bChecandoTodos := false;
   end
   else
   begin if not(bAlterandoPerm) then
      for i := StrToInt(lstPermTodos[2])-5 to StrToInt(lstPermTodos[2]) do
      begin
         TCheckBox(ListaItens[i]).Checked := false;
      end;
   end;
   lstPermTodos.Free;

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
      
   end;
end;

end.
