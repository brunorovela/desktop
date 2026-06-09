unit UFGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, Buttons,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, ToolWin, ImgList,
  ZDataset, CheckLst, DBClient, MidasLib, ZDbcIntfs, UZDbcFuncs;

type
  TFAlteraGrupo = class(TForm)
    pnFundo: TPanel;
    pnlTitulo: TPanel;
    pnLeft: TPanel;
    dbgGrupos: TDBGrid;
    pnlGrid: TPanel;
    pnlBotton: TPanel;
    pnlTop: TPanel;
    pnlGridConteudo: TPanel;
    lblNome: TLabel;
    dbNome: TDBEdit;
    qryGrupos: TUMZQuery;
    dsGrupos: TDataSource;
    toolPessoa: TToolBar;
    ToolButton11: TToolButton;
    btnInclui: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    ilMenu: TImageList;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    pnlHierarquia: TPanel;
    pnlGrupos: TPanel;
    bvlSep3: TBevel;
    bvlSep1: TBevel;
    bvlsep2: TBevel;
    Bevel1: TBevel;
    dsHierarquia: TDataSource;
    pnlDados  : TPanel;
    dbgHierarquia: TDBGrid;
    cdsHierarquia: TClientDataSet;
    qryHierarquia: TUMZQuery;
    qryHierarquiads_nome_grupo: TStringField;
    qryHierarquiads_nome_grupo_liberado: TStringField;
    qryHierarquiacd_grupo_liberado: TIntegerField;
    qryLogs: TUMZQuery;
    qryInsereHierarquia: TUMZQuery;
    btnAdd: TBitBtn;
    btnDell: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    qryExisteHierarquia: TUMZQuery;
    qryInsertHierarquia: TUMZQuery;
    qryInsertHierarquiacd_grupo: TIntegerField;
    qryInsertHierarquiacd_grupo_alternar: TIntegerField;
    qryInsertHierarquiacd_grupo_liberado: TIntegerField;
    lastInsertId: TUMZQuery;
    lastInsertIdlast_insert: TLargeintField;
    btnDuplicar: TToolButton;
    btnSep1: TToolButton;
    qryGruposCD_GRUPO: TIntegerField;
    qryGruposDS_NOME_GRUPO: TStringField;
    procedure btnDuplicarClick(Sender: TObject);
    procedure pnlTituloEnter(Sender: TObject);
    procedure qryGruposAfterCancel(DataSet: TDataSet);
    procedure btnAddClick(Sender: TObject);
    procedure btnDellClick(Sender: TObject);
    procedure qryGruposAfterPost(DataSet: TDataSet);
    procedure dsGruposDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure dbgHierarquiaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgHierarquiaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure StringGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure qryGruposBeforePost(DataSet: TDataSet);
    procedure qryGruposBeforeEdit(DataSet: TDataSet);
    procedure qryGruposBeforeInsert(DataSet: TDataSet);
    procedure dbgGruposDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure clbProvasDiarioDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure qryGruposBeforeDelete(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure qryGruposBeforeCancel(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure limpaGrade();

  private
    { Private declarations }
     LstExcluidos     : TStringList;
     Indice           : Integer;
     bInserindo       : Boolean;
     bEditando        : Boolean;
     bMostraMenssagem : Boolean;

     procedure Filtrar(bHierarquia : Boolean);
  protected

  public
    { Public declarations }
    lstInsercao : TStringList;
  end;

const
   SqlOrigem = 'SELECT          '+
               '   *            '+
               'FROM            '+
               '   nu_grupos    ';

var
  FAlteraGrupo: TFAlteraGrupo;

implementation

{$R *.dfm}
uses
   uDm,General,UFBuscaGrupo, uItemCombo, UFGrupoDuplicar, uUsuario;

procedure TFAlteraGrupo.btnAddClick(Sender: TObject);
begin

   if (DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo,
      'UMNucleo.Grupos.DefinirHierarquias', npIncluir, False )) then
   begin
      Application.CreateForm(TFBuscaGrupos , FBuscaGrupos );
      FBuscaGrupos.Show;
   end
   else
   begin
      Mensagem('Você não possui permissão de inserção nesta tela');
   end;
   
end;

procedure TFAlteraGrupo.btnAlterarClick(Sender: TObject);
begin
   bEditando := True;
   qryGrupos.Edit;
end;

procedure TFAlteraGrupo.btnCancelarClick(Sender: TObject);
begin
   bEditando :=  false;
   bInserindo := false;
   qryGrupos.Cancel;
end;

procedure TFAlteraGrupo.btnDellClick(Sender: TObject);
begin

   if (DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo,
      'UMNucleo.Grupos.DefinirHierarquias', npExcluir, False )) then
   begin
      LstExcluidos.Add(cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsString);
      cdsHierarquia.Delete;
      if(qryGrupos.State <> dsInsert) or (qryGrupos.State <> dsEdit ) then
      begin
         btnAlterar.Click;
      end;
   end
   else
   begin
      Mensagem('Você não possui permissão de exclusão nesta tela');
   end;
   
end;

procedure TFAlteraGrupo.btnDuplicarClick(Sender: TObject);
const
   SMessageConfirm = 'Você está prestes a replicar este grupo com um novo nome. Serão mantidas as permissões e hierarquias existentes no grupo selecionado neste momento. Caso deseje continuar, informe o nome do novo grupo e clique em confirmar.';
   SCaption = 'Confirmação';
begin
   MessageBox(Handle, PChar(SMessageConfirm), PChar(SCaption), MB_ICONINFORMATION or MB_OK);
   Application.CreateForm(TfGrupoDuplicar, fGrupoDuplicar);
   fGrupoDuplicar.SourceGroup := qryGruposcd_grupo.AsInteger;
   if fGrupoDuplicar.ShowModal = mrOk then
   begin
      Filtrar(True);
      qryGrupos.Locate('CD_GRUPO', fGrupoDuplicar.NewGroup, []);
   end;                          
end;

procedure TFAlteraGrupo.btnExcluirClick(Sender: TObject);
const
   SSQLDelBibModalidadesGrp =
      'DELETE FROM BIB_MODALIDADES_MOVIMENTO_GRP WHERE CD_BIB_GRUPO IN ' +
      '(SELECT CD_BIB_GRUPO FROM BIB_GRUPOS WHERE CD_GRUPO = ?)';
   SSQLDelBibGrupo = 'DELETE FROM BIB_GRUPOS WHERE CD_GRUPO = ?';
   SSQLDelPessoasGrp = 'DELETE FROM NU_GRUPOS_PESSOAS WHERE CD_GRUPO = ?';
   SSQLDelPermissoesGrp = 'DELETE FROM NU_GRUPOS_PERMISSOES WHERE CD_GRUPO = ?';
   SSQLDelHierarquiaGrp =
      'DELETE FROM NU_GRUPOS_HIERARQUIA WHERE CD_GRUPO = ? OR CD_GRUPO_LIBERADO = ?';

   SCapConfirm = 'Confirmação';
   SCapInform = 'Informação';
   SMsgConfirmDel =
      'Deseja realmente realizar a exclusão do grupo selecionado?';
   SMsgInformDel = 'A exclusão do grupo foi efetuada com sucesso.';

   BtnFlags = MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2;
var
   Statement: IZPreparedStatement;
begin
   if MessageBox(Handle, PChar(SMsgConfirmDel), PChar(SCapConfirm), BtnFlags) = ID_YES then
   begin

      try
         // Realiza a exclusão das modalidades de movimento vinculadas ao
         // grupo da biblioteca que está ligada ao grupo que será excluído
      
         Statement := PrepareStatement(SSQLDelBibModalidadesGrp);
         try
            Statement.SetInt(1, qryGruposCD_GRUPO.AsInteger);
            Statement.ExecutePrepared;
         finally
            Statement.Close;
         end;

         // Realiza a exclusão do grupo da biblioteca vinculado a este grupo

         Statement := PrepareStatement(SSQLDelBibGrupo);
         try
            Statement.SetInt(1, qryGruposCD_GRUPO.AsInteger);
            Statement.ExecutePrepared;
         finally
            Statement.Close;
         end;

         // Realiza a exclusão do vínculo das pessoas com este grupo

         Statement := PrepareStatement(SSQLDelPessoasGrp);
         try
            Statement.SetInt(1, qryGruposCD_GRUPO.AsInteger);
            Statement.ExecutePrepared;
         finally
            Statement.Close;
         end;

         // Realiza a exclusão de todas as permissões vinculadas a este grupo
      
         Statement := PrepareStatement(SSQLDelPermissoesGrp);
         try
            Statement.SetInt(1, qryGruposCD_GRUPO.AsInteger);
            Statement.ExecutePrepared;
         finally
            Statement.Close;
         end;

         // Realiza a exclusão das hierarquias deste grupo

         Statement := PrepareStatement(SSQLDelHierarquiaGrp);
         try
            Statement.SetInt(1, qryGruposCD_GRUPO.AsInteger);
            Statement.SetInt(2, qryGruposCD_GRUPO.AsInteger);
            Statement.ExecutePrepared;
         finally
            Statement.Close;
         end;

         // Realiza a exclusão do grupo
         qryGrupos.Delete;

         MessageBox(Handle, PChar(SMsgInformDel), PChar(SCapInform), MB_ICONINFORMATION or MB_OK);
      except
         on E: Exception do raise;
      end;
   end;
end;

procedure TFAlteraGrupo.btnFecharClick(Sender: TObject);
begin
   if(qryGrupos.State = dsInsert) or (qryGrupos.State = dsEdit) then
   begin
      Mensagem('Você deve salvar ou cancelar antes de fechar' , 'Atenção', MB_OK + MB_ICONEXCLAMATION,Handle);
      Exit;
   end;
   Close;
end;

procedure TFAlteraGrupo.btnIncluiClick(Sender: TObject);
begin
   bInserindo := true;
   qryGrupos.Insert;
end;

procedure TFAlteraGrupo.btnSalvarClick(Sender: TObject);
var
   i : Integer;
   PrimeiroReg : Integer;
   UltimoReg : Integer;
   qryRegistroDuplica, qryVerificaGrupoPermissao : TUMZQuery;
   grupos: TStringList;
   lastInsert : Integer;
   inserirAdmin : Boolean;
begin
   lastInsert := 0;
   inserirAdmin := True;

   DM.CriarConsulta(qryRegistroDuplica);
   DM.CriarConsulta(qryVerificaGrupoPermissao);
   
   qryRegistroDuplica.SQL.Text := ''+
   ' SELECT                        '+
   '    cd_grupo                   '+
   ' FROM                          '+
   '    nu_grupos                  '+
   ' WHERE                         '+
   '    ds_nome_grupo = '+QuotedStr(dbNome.Text);

   qryRegistroDuplica.Open;

   qryVerificaGrupoPermissao.SQL.Text := '                                 '+
   ' SELECT                                                                '+
   '     gp.nr_permissao                                                   '+
   ' FROM                                                                  '+
   '      nu_grupos_permissoes gp                                          '+
   '      INNER JOIN nu_modulos_acoes ma  ON (gp.cd_acao = ma.cd_acao)     '+
   ' WHERE ma.ds_chave = ''3001'' AND gp.cd_grupo = :cd_grupo              ';


   if ( qryRegistroDuplica.FieldByName('cd_grupo').AsInteger = 0 )or ( qryRegistroDuplica.FieldByName('cd_grupo').AsInteger = qryGruposcd_grupo.AsInteger) then
   begin
      qryGrupos.Post;
      lastInsert := qryGruposcd_grupo.AsInteger;

      grupos := TStringlist.Create;
      grupos := dm.getGrupos(dm.iCdPessoaLogado);

      for i := 0 to grupos.Count - 1 do
      begin

         // Verificar se o grupo da pessoa tem permissão de inserir grupos, do contrário não receberá hierarquia
         qryVerificaGrupoPermissao.Close();
         qryVerificaGrupoPermissao.ParamByName('cd_grupo').AsInteger := StrToInt(grupos[i]);
         qryVerificaGrupoPermissao.Open();

         if (qryVerificaGrupoPermissao.RecordCount > 0) AND (qryVerificaGrupoPermissao.FieldByName('nr_permissao').AsInteger >0)  then
         begin
            qryInsertHierarquia.Close;
            qryInsertHierarquia.Open;
            qryInsertHierarquia.Insert;
            qryInsertHierarquiacd_grupo.AsString := grupos[i];
            qryInsertHierarquiacd_grupo_liberado.AsInteger := lastInsert;
            try
               qryInsertHierarquia.Post;

               if inserirAdmin AND (grupos[i] = '1') then
               begin
                  inserirAdmin := False;
               end;
            except
            end;
         end;


      end;

      // Insere por padrão para o grupo 1
      // Somente se realmente for necessário, pois, na iteração acima, pode ocorrer de já ter sido inserido
      if inserirAdmin then
      begin
         qryInsertHierarquia.Close;
         qryInsertHierarquia.Open;
         qryInsertHierarquia.Insert;
         qryInsertHierarquiacd_grupo.AsInteger := 1;
         qryInsertHierarquiacd_grupo_liberado.AsInteger := lastInsert;
         try
            qryInsertHierarquia.Post;
         except
         end;
      end;

      qryInsertHierarquia.Close;
   end
   else
   begin
      Mensagem('Registro duplicado!'+#13+'Favor escolher outro nome para o grupo.' , 'Atenção', MB_OK + MB_ICONEXCLAMATION,Handle);
   end;

   qryRegistroDuplica.Free;
end;

procedure TFAlteraGrupo.clbProvasDiarioDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     Accept := (Source is TTreeView);
end;

procedure TFAlteraGrupo.dbgGruposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if  ( gdSelected in State ) then
    //  begin
   begin
      dbgGrupos.Canvas.Brush.Color:=clBlue; //Altere para a cor q vc deseja
      dbgGrupos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TFAlteraGrupo.dbgHierarquiaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
   MyTreeNode: TTreeNode;
begin
   if qryGrupos.State <> dsInsert then
      btnAlterar.Click;

   if Source is TTreeView then
   begin
      MyTreeNode := FBuscaGrupos.Tree.Selected;
      if(not(cdsHierarquia.Locate('cdsHierarquiaCodigoLiberado',TItemCombo(MyTreeNode.Data).getCodigo(),[]))) then
      begin
         cdsHierarquia.Append;
         cdsHierarquia.FieldByName('cdsHierarquiaCodigo').AsInteger := qryGruposcd_grupo.AsInteger;
         cdsHierarquia.FieldByName('cdsHierarquiaDescricao').AsString := TItemCombo(MyTreeNode.Data).getDescricao();
         cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsInteger := strtoint(TItemCombo(MyTreeNode.Data).getCodigo());
         cdsHierarquia.Post;
      end
      else
      begin
         Mensagem('Atenção registro duplicado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION,Handle)
      end;
      FBuscaGrupos.SetFocus
   end;
end;

procedure TFAlteraGrupo.dbgHierarquiaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;

procedure TFAlteraGrupo.dsGruposDataChange(Sender: TObject; Field: TField);
begin
   if(qryGrupos.State <> dsEdit) AND (qryGrupos.State <> dsInsert) AND not(bInserindo) then
   begin
      limpaGrade;
      qryHierarquia.Close;
      qryHierarquia.ParamByName('hierarquia').AsInteger := qryGruposcd_grupo.AsInteger;
      qryHierarquia.Open;
      qryHierarquia.First;
      while not(qryHierarquia.Eof) do
      begin
         cdsHierarquia.Append;
         cdsHierarquia.FieldByName('cdsHierarquiaCodigo').AsInteger   := qryGruposcd_grupo.AsInteger;
         cdsHierarquia.FieldByName('cdsHierarquiaDescricao').AsString := qryHierarquiads_nome_grupo_liberado.AsString;
         cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsInteger := qryHierarquiacd_grupo_liberado.AsInteger;
         cdsHierarquia.Post;
         qryHierarquia.Next;
      end;
   end;

end;

procedure TFAlteraGrupo.Filtrar(bHierarquia : Boolean);
{
var
   qryVerificaGrupo     : TUMZQuery;
   qryGruposHierarquia  : TUMZQuery;
   bUsuarioComun        : Boolean;
   strGruposLiberar     : string;
}
begin
   qryGrupos.Close;
   qryGrupos.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
   qryGrupos.Open;
   {
   bUsuarioComun := true ;

   // ve se a pessoa logada faz parte do grupo 1 que sempre sera o admin
   DM.CriarConsulta(qryVerificaGrupo);
   qryVerificaGrupo.SQL.Text := 'SELECT                                                              '+
                                '  ngp.cd_pessoa, g.CD_GRUPO cd_grupo, g.ds_nome_grupo               '+
                                'FROM                                                                '+
                                '  NU_GRUPOS g                                                       '+
                                '  INNER JOIN nu_grupos_pessoas ngp ON (ngp.cd_grupo = g.cd_grupo)   '+
                                'WHERE                                 '+
                                '  g.CD_GRUPO  = 1 AND                 '+
                                '  ngp.CD_PESSOA = '+IntToStr(DM.iCdPessoaLogado);
   qryVerificaGrupo.Open;
   if( qryVerificaGrupo.FieldByName('cd_grupo').AsInteger = 1) then
   begin
      bUsuarioComun := false;
   end;


   qryGrupos.Close;
   qryGrupos.SQL.Text := SqlOrigem;
   qryGrupos.SQL.Text := qryGrupos.SQL.Text             +
                         ' WHERE                       '+
                         ' 1=1                         ';

    // se o pessoa nao estiver no grupo administradores
   if (bUsuarioComun) then
   begin
      qryGrupos.SQL.Text := qryGrupos.SQL.Text            +
                            'AND                       '+
                            '   sn_bloqueado = 0         ';
   end;

    // se poder ver apenas a hierarquia
   if(bHierarquia) then
   begin
      DM.CriarConsulta(qryGruposHierarquia);
      qryGruposHierarquia.SQL.Text :=
      ' SELECT DISTINCT                                                             '+
      '    cd_grupo_liberado as grupo           '+
      ' FROM                                                                '+
      '   nu_grupos_hierarquia ngh                                          '+
      '   INNER JOIN nu_grupos_pessoas ngp ON (ngp.cd_grupo = ngh.cd_grupo) '+
      ' WHERE                                                               '+
      '   ngp.cd_pessoa = :pessoa                                           ';
      qryGruposHierarquia.ParamByName('pessoa').AsInteger := DM.iCdPessoaLogado;
      qryGruposHierarquia.Open;

      strGruposLiberar := '';
      while not qryGruposHierarquia.Eof do begin
         strGruposLiberar := strGruposLiberar + qryGruposHierarquia.FieldByName('grupo').AsString;
         qryGruposHierarquia.Next;
         if not qryGruposHierarquia.Eof then begin
            strGruposLiberar := strGruposLiberar + ', ';
         end;
      end;

      qryGrupos.SQL.Text :=  qryGrupos.SQL.Text         +
      ' AND cd_grupo IN ( '+strGruposLiberar+' )';
   end;

   qryGrupos.SQL.Text := qryGrupos.SQL.Text                      +
                         'ORDER BY                                 '+
                         '   ds_nome_grupo                         ';
   qryGrupos.Open
   }
end;

procedure TFAlteraGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFAlteraGrupo.FormCreate(Sender: TObject);
begin
   bInserindo := false;
   cdsHierarquia.CreateDataSet;
   Indice := 0;
   LstExcluidos := TStringList.Create;
end;

procedure TFAlteraGrupo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
      VK_F2 :
      begin
         if (btnInclui.Enabled = true) then
            btnInclui.Click
      end;
      VK_F3 :
      begin
         if (btnAlterar.Enabled = true) then
            btnAlterar.Click
      end;
      VK_F9 :
      begin
         if (btnExcluir.Enabled = true) then
            btnExcluir.Click
      end;
      VK_F5 :
      begin
         if (btnSalvar.Enabled = true) then
            btnSalvar.Click
      end;
      VK_F6 :
      begin
         if (btnCancelar.Enabled = true) then
            btnCancelar.Click
      end;
      VK_F12 :
      begin
         if (btnFechar.Enabled = true) then
            btnFechar.Click
      end;

   end;
end;

procedure TFAlteraGrupo.FormShow(Sender: TObject);
begin
   Filtrar(true);
   LstExcluidos.Clear;

   bMostraMenssagem     :=  true;
   btnDuplicar.Enabled := True;
   btnInclui.Enabled    :=  true;
   btnAlterar.Enabled   :=  true;
   btnExcluir.Enabled   :=  true;
   btnSalvar.Enabled    :=  false;
   btnCancelar.Enabled  :=  false;
end;

procedure TFAlteraGrupo.limpaGrade;
begin
   cdsHierarquia.Close;
   cdsHierarquia.CreateDataSet;
end;


procedure TFAlteraGrupo.pnlTituloEnter(Sender: TObject);
begin
   bMostraMenssagem := true; 
end;

procedure TFAlteraGrupo.qryGruposAfterCancel(DataSet: TDataSet);
begin
   dbgGrupos.Enabled := true;
end;

procedure TFAlteraGrupo.qryGruposAfterPost(DataSet: TDataSet);
var
   qryInereHierarquia : TUMZQuery;
   qryExcluirIndice   : TUMZQuery;
   i                  : Integer;
begin
    // caso de inserção
   if(not(bEditando)) then
   begin
      DM.CriarConsulta(qryInereHierarquia);
      cdsHierarquia.First;
      while not(cdsHierarquia.Eof)do
      begin
         qryInsereHierarquia.ParamByName('cd_grupo').AsInteger := qryGruposCD_GRUPO.AsInteger;
         qryInsereHierarquia.ParamByName('cd_grupo_liberado').AsInteger := cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsInteger;
         qryInsereHierarquia.ExecSQL;
         cdsHierarquia.Next;
      end;
      DM.CriarConsulta(qryExcluirIndice);
      for I := 0 to LstExcluidos.Count - 1 do
      begin
         qryExcluirIndice.SQL.Text :=
         ' DELETE FROM nu_grupos_hierarquia WHERE                             '+
         ' cd_grupo_liberado ='+LstExcluidos[i]                                +
         ' AND                                                                '+
         ' cd_grupo = '+ qryGruposCD_GRUPO.AsString;
         qryExcluirIndice.ExecSQL;
      end;
         // LOGS
      qryLogs.Close;
      qryLogs.ParamByName('cd_grupo').AsInteger := qryGruposCD_GRUPO.AsInteger;
      qryLogs.Open;
      DM.setLog(
         1,'inclusao',
         qryGruposcd_grupo.AsString+':'+ IntToStr(DM.UsuarioLogado.ColigadaLogada)+
         ':'+ IntToStr(DM.iCdPessoaLogado)+'-'+DateToStr(now()),
         DM.UsuarioLogado.ColigadaLogada, 'Foi incluido o grupo '+
         qryGruposds_nome_grupo.AsString+' pelo usuario  '+
          IntToStr(DM.iCdPessoaLogado)+#13+' Grupos que pertence a hierarquia'+
         qryLogs.FieldByName('logs').AsString
      );
   end;
   limpaGrade;
   qryHierarquia.Close;
   qryHierarquia.ParamByName('hierarquia').AsInteger := qryGruposcd_grupo.AsInteger;
   qryHierarquia.Open;
   qryHierarquia.First;
   while not(qryHierarquia.Eof) do
   begin
      cdsHierarquia.Append;
      cdsHierarquia.FieldByName('cdsHierarquiaCodigo').AsInteger   := qryGruposcd_grupo.AsInteger;
      cdsHierarquia.FieldByName('cdsHierarquiaDescricao').AsString := qryHierarquiads_nome_grupo_liberado.AsString;
      cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsInteger := qryHierarquiacd_grupo_liberado.AsInteger;
      cdsHierarquia.Post;
      qryHierarquia.Next;
   end;
   bInserindo := false;
   bEditando :=  false;
   LstExcluidos.Clear;
   dbgGrupos.Enabled := true;
   qryInereHierarquia.Free;
   qryExcluirIndice.Free;
end;

procedure TFAlteraGrupo.qryGruposBeforeCancel(DataSet: TDataSet);
begin
   if(bEditando) OR (bInserindo)then
   begin
      if(bMostraMenssagem) then
         Mensagem('Você deve salvar ou cancelar para poder selecionar outro grupo' , 'Atenção', MB_OK + MB_ICONEXCLAMATION,Handle);
      bMostraMenssagem := false;
      pnlTitulo.SetFocus;
      // feito para corrigir um bug da dbgrid que chamava duas vezes o cancel
      bMostraMenssagem := true;
      Abort;
   end;
   btnDuplicar.Enabled := True;
   btnInclui.Enabled    :=  true;
   btnAlterar.Enabled   :=  true;
   btnExcluir.Enabled   :=  true;
   btnSalvar.Enabled    :=  false;
   btnCancelar.Enabled  :=  false;
   limpaGrade;
end;

procedure TFAlteraGrupo.qryGruposBeforeDelete(DataSet: TDataSet);
begin
   DM.setLog(1,
               'Exclusao',
               qryGruposcd_grupo.AsString+':'+ IntToStr(DM.iCdPessoaLogado)+
               ':'+ IntToStr(DM.iCdPessoaLogado)+'-'+DateToStr(now()),
               DM.UsuarioLogado.ColigadaLogada, 'Foi excluido o grupo '+
               qryGruposds_nome_grupo.AsString+' pelo usuario  '+
               IntToStr(DM.iCdPessoaLogado)
            );
end;

procedure TFAlteraGrupo.qryGruposBeforeEdit(DataSet: TDataSet);
begin
   btnDuplicar.Enabled := False;
   btnInclui.Enabled    :=  false;
   btnAlterar.Enabled   :=  false;
   btnExcluir.Enabled   :=  false;
   btnSalvar.Enabled    :=  true;
   btnCancelar.Enabled  :=  true;

   dbNome.SetFocus;
end;

procedure TFAlteraGrupo.qryGruposBeforeInsert(DataSet: TDataSet);
begin
   btnDuplicar.Enabled := False;
   btnInclui.Enabled    :=  false;
   btnAlterar.Enabled   :=  false;
   btnExcluir.Enabled   :=  false;
   btnSalvar.Enabled    :=  true;
   btnCancelar.Enabled  :=  true;

   limpaGrade;
   dbNome.SetFocus;
   LstExcluidos.Clear;
end;

procedure TFAlteraGrupo.qryGruposBeforePost(DataSet: TDataSet);
var
   i : Integer;
   qryExcluirIndice : TUMZQuery;
begin

   bEditando := (qryGrupos.State = dsEdit);
   btnDuplicar.Enabled := True;
   btnInclui.Enabled    :=  true;
   btnAlterar.Enabled   :=  true;
   btnExcluir.Enabled   :=  true;
   btnSalvar.Enabled    :=  false;
   btnCancelar.Enabled  :=  false;
   if(qryGrupos.State = dsEdit) then
   begin

      cdsHierarquia.First;
      while not(cdsHierarquia.Eof)do
      begin
         qryExisteHierarquia.Close;
         qryExisteHierarquia.ParamByName('cd_grupo').AsInteger := qryGruposcd_grupo.AsInteger;
         qryExisteHierarquia.ParamByName('cd_grupo_liberado').AsInteger :=cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsInteger;
         qryExisteHierarquia.open;

         if (qryExisteHierarquia.Eof)then
         begin
            qryInsereHierarquia.ParamByName('cd_grupo').AsInteger := qryGruposcd_grupo.AsInteger;
            qryInsereHierarquia.ParamByName('cd_grupo_liberado').AsInteger := cdsHierarquia.FieldByName('cdsHierarquiaCodigoLiberado').AsInteger;
            qryInsereHierarquia.ExecSQL;

         end;
         cdsHierarquia.Next;

      end;
      DM.CriarConsulta(qryExcluirIndice);
      for I := 0 to LstExcluidos.Count - 1 do
      begin
         qryExcluirIndice.SQL.Text :=
         ' DELETE FROM nu_grupos_hierarquia WHERE                              '+
         ' cd_grupo_liberado ='+LstExcluidos[i]                                 +
         ' AND                                                                 '+
         ' cd_grupo = '+qryGruposcd_grupo.AsString;
         qryExcluirIndice.ExecSQL;
      end;
// LOGS
      qryLogs.Close;
      qryLogs.ParamByName('cd_grupo').AsInteger := qryGruposcd_grupo.AsInteger;
      qryLogs.Open;
      DM.setLog(
         1,'alteracao',
         qryGruposcd_grupo.AsString+':'+ IntToStr(DM.UsuarioLogado.ColigadaLogada)+
         ':'+         IntToStr(DM.iCdPessoaLogado)+'-'+DateToStr(now()),
         DM.UsuarioLogado.ColigadaLogada, 'Foi alterado o grupo '+
         qryGruposds_nome_grupo.AsString+' pelo usuario  '+
         IntToStr(DM.iCdPessoaLogado)+#13+' Grupos que pertence a hierarquia '+
         qryLogs.FieldByName('logs').AsString
      );
   end
   else
      bInserindo := true

end;

procedure TFAlteraGrupo.StringGrid1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;

end.
