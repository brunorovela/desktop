unit uEscolas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, ExtCtrls, Grids, DBGrids, DBCtrls, Buttons, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, StdCtrls, Mask,
  ComCtrls, ToolWin, ImgList, Menus ,jpeg,ExtDlgs,uPessoas;

type
  TfrmEscolas = class(TForm)
    paCabecalho: TPanel;
    tblEscolas: TUMZQuery;
    dtcEscolas: TDataSource;
    tblEscolasnm_instituicao: TStringField;
    tblEscolasds_endereco: TStringField;
    tblEscolasds_complemento: TStringField;
    tblEscolasds_bairro: TStringField;
    tblEscolasds_cidade: TStringField;
    tblEscolasds_estado: TStringField;
    tblEscolasds_cep: TStringField;
    tblEscolasds_diretor: TStringField;
    tblEscolasds_tipo: TStringField;
    tblEscolasds_telefone1: TStringField;
    tblEscolasds_telefone2: TStringField;
    tblEscolasds_email: TStringField;
    tblEscolasds_site: TStringField;
    tblEscolassn_educacao_infantil: TStringField;
    tblEscolassn_ensino_fundamental: TStringField;
    tblEscolassn_ensino_medio: TStringField;
    tblEscolassn_ensino_superior: TStringField;
    tblEscolassn_cursos_profissionalizantes: TStringField;
    pnCadastro: TScrollBox;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    dblEstado: TDBLookupComboBox;
    Label42: TLabel;
    tblEscolasdescEstado: TStringField;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    tblEscolassn_ensino_especial: TStringField;
    DBCheckBox6: TDBCheckBox;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    pmQtd: TPopupMenu;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    tblEscolassn_unidade_certificadora: TSmallintField;
    tblEscolassn_convenio: TSmallintField;
    Panel1: TPanel;
    imageFoto: TImage;
    AbrirFoto: TSavePictureDialog;
    pmFoto: TPopupMenu;
    mIAlterar: TMenuItem;
    mIExcluir: TMenuItem;
    MenuItem3: TMenuItem;
    mICancelar: TMenuItem;
    dbeDiretor: TDBEdit;
    Label1: TLabel;
    tblEscolascd_instituicao: TIntegerField;
    dbeNmFantasia: TDBEdit;
    Label12: TLabel;
    dbeCredenciamento: TDBEdit;
    Label13: TLabel;
    tblEscolasds_credenciamento: TStringField;
    tblEscolasnm_fantasia: TStringField;
    qryImagem: TUMZQuery;
    qryImagemim_logo: TBlobField;
    qryImagemcd_instituicao: TIntegerField;
    Label6: TLabel;
    cmbPais: TComboBox;
    lblPais: TLabel;
    qryPaises: TUMZQuery;
    qryPaisescd_pais: TLargeintField;
    qryPaisesds_pais: TStringField;
    qryEstado: TUMZQuery;
    qryEstadocd_mec: TLargeintField;
    qryEstadods_uf: TStringField;
    qryEstadods_estado: TStringField;
    qryEstadocd_pais: TIntegerField;
    pnlDireita: TPanel;
    qryFiltros: TUMZReadOnlyQuery;
    qryFiltroscd_instituicao: TIntegerField;
    qryFiltrosnm_instituicao: TStringField;
    pnlFiltro: TPanel;
    ledInstitucao: TLabeledEdit;
    Panel2: TPanel;
    grd: TDBGrid;
    lblTotal: TLabel;
    spLocalizar: TSpeedButton;
    sbLimpar: TSpeedButton;
    tblEscolasDS_OBSERVACAO: TMemoField;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    qryMunicipios: TUMZQuery;
    tblEscolascd_municipio: TIntegerField;
    qryMunicipiosds_municipio: TStringField;
    cbMunicipio: TComboBox;
    qryMunicipioscd_municipio: TLargeintField;
    tblEscolasdt_inicio_irregular: TDateField;
    tblEscolasdt_fim_irregular: TDateField;
    DbInicioIrregular: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DbFimIrregular: TDBEdit;
    tblEscolassn_irregular: TSmallintField;
    DBCheckBox9: TDBCheckBox;
    Label17: TLabel;
    Label18: TLabel;
    dbeCodigoMec: TDBEdit;
    Label19: TLabel;
    tblEscolascd_instituicao_mec: TIntegerField;
    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbFimIrregularEnter(Sender: TObject);
    procedure cbMunicipioChange(Sender: TObject);    
    procedure sbLimparClick(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure ledInstitucaoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPaisChange(Sender: TObject);
    procedure cmbPaisSelect(Sender: TObject);
    procedure tblEscolasBeforeDelete(DataSet: TDataSet);
    procedure tblEscolasAfterEdit(DataSet: TDataSet);
    procedure tblEscolasBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure mICancelarClick(Sender: TObject);
    procedure mIExcluirClick(Sender: TObject);
    procedure dtcEscolasDataChange(Sender: TObject; Field: TField);
    procedure imageFotoDblClick(Sender: TObject);
    procedure dtcEscolasStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tblEscolasNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tblEscolasAfterPost(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure geraLogs();
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
    bEditando : Boolean;
    iQtdGeral : Integer;
    sUltimoFiltro : string;
    lng: Longint;
    Acao : Integer;
    bImagemModificada : Boolean;
    sInstDeletada : string;
    strCampos :TStringList;
    strLogsObservacao :string;
    sNomeAntes,
    sCidadeAntes,
    sEstadoAntes : String;
    procedure localizar(nm_instituicao: string);
    procedure carregarCidades();
    procedure salvarCidades();
  public
    { Public declarations }
  end;

var
  frmEscolas: TfrmEscolas;

implementation

uses uDM, Main, uItemCombo, uUsuario;

{$R *.DFM}


procedure TfrmEscolas.dtcEscolasDataChange(Sender: TObject; Field: TField);
var
  BS: TStream;
  Imagem:TJPEGImage;
  indice:Integer;
  qryGetPais:TUMZQuery;
begin
  DM.CriarConsulta(qryGetPais);
  qryGetPais.SQL.Text := 'SELECT cd_pais FROM estados WHERE ds_uf ='''+tblEscolasds_estado.AsString+'''';
  qryGetPais.Open;
  { Atualização da Foto }
  qryImagem.Close;
  qryImagem.ParamByName('cd_instituicao').AsInteger := tblEscolascd_instituicao.AsInteger;
  qryImagem.Open;
  { Se houver alguma informação gravada no campo foto da tabela }
  if qryImagemim_logo.AsString <> '' Then
  Begin

     imageFoto.visible := True;
     Panel1.Caption := '';
     try
         { Cria o componente BLOBStream baseado no campo qyPessoasFoto em modo leitura (Note: BMREAD) }
         BS := qryImagem.CreateBlobStream(qryImagemim_logo, bmRead);
//         BS := TBlobStream.Create((tblEscolasim_logo as TBlobField), BMREAD);

         { Cria o componente JPEG }
         Imagem := TJPEGImage.Create;
         { Abre no componente JPEG baseado no Stream criado anteriormente que já possui a imagem da base}
         Imagem.LoadFromStream(BS);

         { Apenas abre no componente TImage a foto que está aberta no componente JPEG (Imagem)}
         imageFoto.Picture.Assign(Imagem);
     except
         imageFoto.visible := false;
         Panel1.Caption := 'FOTO';
     end;

     { Libera da memória os componentes criados }
     FreeAndNil(BS);
     FreeAndNil(Imagem);

  End
  { Caso contrário }
  else begin
    { Coloca uma imagem qualquer no componente TImage }
    imageFoto.visible := false;
    Panel1.Caption := 'FOTO';
  end;

  if (qryGetPais.FieldByName('cd_pais').AsString <> '') and not(beditando)then
  begin
     for indice := 0 to cmbPais.Items.Count - 1 do
     begin
        if (TItemCombo(cmbPais.Items.Objects[indice]).getCodigo = qryGetPais.FieldByName('cd_pais').AsString)then
        begin
          cmbPais.ItemIndex := indice;
          Break;
        end;
     end;
  end
  else
  begin
     cmbPais.ItemIndex := -1;
  end;
  cmbPaisChange(nil);
  beditando := false;
  qryGetPais.Free;

  DbInicioIrregular.ReadOnly := not (tblEscolassn_irregular.AsInteger = 1);
  DbFimIrregular.ReadOnly := not (tblEscolassn_irregular.AsInteger = 1);

  if(tblEscolasdescEstado.AsString <> tblEscolasdescEstado.CurValue) then
  begin
    carregarCidades();
  end;
end;

procedure TfrmEscolas.dtcEscolasStateChange(Sender: TObject);
var
i : integer;
sNome : string;
sValor : string;
begin
   if (tblEscolas.State in [dsEdit, dsInsert] ) then
   begin
      for i := 0 to tblEscolas.FieldCount - 1 do
      begin
         if (tblEscolas.Fields[i].Name <>'im_log') and (tblEscolas.Fields[i].FieldName <> 'cd_instituicao')  then
         begin
            sNome  := tblEscolas.Fields[i].FieldName;

            sValor := tblEscolas.Fields[i].AsString;

            strCampos.Values[sNome] := sValor ;
         end;
      end;
   end;
   btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
   btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
   btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
   btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
   btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];

   if TDataSource( Sender ).State = dsInsert  then
   begin
      Acao := 1;
   end
   else
   begin
      if TDataSource( Sender ).State = dsEdit then
      begin
         Acao := 2;
      end;
   end;
   
  //pnCadastro.Visible := TDataSource( Sender ).State in [ dsEdit, dsInsert ];


end;

procedure TfrmEscolas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnIncluir.Enabled then btnIncluirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
  end;
end;

procedure TfrmEscolas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblEscolas.Close;

  Dm.tblEscolas.Close();
  Dm.tblEscolas.Open();

  Action := caFree;
end;

procedure TfrmEscolas.FormCreate(Sender: TObject);
begin

   bEditando := false;
   strCampos := TStringList.Create();
   qryPaises.Close;
   qryPaises.Open;
   sUltimoFiltro := '';
   while not(qryPaises.Eof) do
   begin
      cmbPais.AddItem(qryPaisesds_pais.AsString , TItemCombo.Create(qryPaisescd_pais.AsString,qryPaisesds_pais.AsString));
      qryPaises.Next;
   end;
end;

procedure TfrmEscolas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEscolas.btnIncluirClick(Sender: TObject);
begin
  //pnCadastro.Visible := True;
  if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.CadInstituicaoEnsino', npIncluir, True ) then Exit;

  DBEdit2.SetFocus;
  tblEscolas.Append;
end;

procedure TfrmEscolas.btnAlterarClick(Sender: TObject);
begin
  //pnCadastro.Visible := True;
    if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.CadInstituicaoEnsino', npAlterar, True ) then Exit;
  tblEscolas.Edit;
  DBEdit2.SetFocus;
end;

procedure TfrmEscolas.btnSalvarClick(Sender: TObject);
var
   nomeInstituicao : String;
begin
   pnCadastro.setfocus();
   if DBEdit2.Text = '' then begin
      Mensagem('O campo "Nome da Instituição" é obrigatório! Para encerrar a digitação sem salvar, clique em CANCELAR.',Application.Title, MB_ICONEXCLAMATION+MB_OK );
      exit;
   end;
   nomeInstituicao := DBEdit2.Text;
   salvarCidades();
   tblEscolas.Post;
   tblEscolas.Locate('nm_instituicao',nomeInstituicao,[]);
end;

procedure TfrmEscolas.carregarCidades;
var
   encontrou : Boolean;
begin
   encontrou := false;
   qryMunicipios.Close;
   qryMunicipios.ParamByName('ds_uf').AsString := qryEstadods_uf.AsString;
   qryMunicipios.Open;
   cbMunicipio.ItemIndex := -1;
   cbMunicipio.Items.Clear;

   while not qryMunicipios.Eof do
   begin
      cbMunicipio.Items.Add(qryMunicipiosds_municipio.AsString);
      if (qryMunicipioscd_municipio.AsString = tblEscolascd_municipio.AsString) then
      begin
         cbMunicipio.ItemIndex := cbMunicipio.Items.IndexOf(qryMunicipiosds_municipio.AsString);
         encontrou := true;
      end;
      qryMunicipios.Next;
   end;

   //Se não achou é uma cidade sem codigo, ou seja, escrita errada
   if not(encontrou) then
   begin
      cbMunicipio.Items.Add(tblEscolasds_cidade.AsString);
      cbMunicipio.ItemIndex := cbMunicipio.Items.IndexOf(tblEscolasds_cidade.AsString);
   end;
end;

procedure TfrmEscolas.cbMunicipioChange(Sender: TObject);
var
   municipioSelecionado : Integer;
begin
   if not (tblEscolas.State in [dsEdit,dsInsert]) then
   begin
      municipioSelecionado := cbMunicipio.ItemIndex;
      tblEscolas.Edit;
      cbMunicipio.ItemIndex := municipioSelecionado;
   end;
end;

procedure TfrmEscolas.cmbPaisChange(Sender: TObject);
begin
   qryEstado.Close;
   if(cmbPais.ItemIndex <> -1)then
   begin
      qryEstado.ParamByName('cd_pais').AsInteger := StrToInt( TItemCombo(cmbPais.Items.Objects[cmbPais.ItemIndex]).getcodigo);
   end
   else
   begin
      qryEstado.ParamByName('cd_pais').AsInteger :=0;
   end;
   qryEstado.Open;

end;

procedure TfrmEscolas.cmbPaisSelect(Sender: TObject);
var
   iCombo : Integer;
begin
   iCombo := cmbPais.ItemIndex;
   qryEstado.Close;
   qryEstado.ParamByName('cd_pais').AsInteger  := StrToInt(TItemCombo(cmbPais.Items.Objects[cmbPais.ItemIndex]).getCodigo);
   qryEstado.Open;
   bEditando:= true;
   tblEscolas.Edit;
   cmbPais.ItemIndex := iCombo;
end;

procedure TfrmEscolas.btnExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.CadInstituicaoEnsino', npExcluir, True ) then Exit;
  if Mensagem('Deseja excluir este registro?',Application.Title,
               MB_YESNO + MB_ICONQUESTION ) = id_Yes then
  begin
      sInstDeletada := tblEscolasnm_instituicao.AsString;
      acao:=3;
      geralogs();
      tblEscolas.Delete;
  end;
end;

procedure TfrmEscolas.btnCancelarClick(Sender: TObject);
var
  nomeInstituicao : String;
begin
  tblEscolas.Cancel;
  tblEscolas.Locate('nm_instituicao',nomeInstituicao,[]);
end;

procedure TfrmEscolas.tblEscolasNewRecord(DataSet: TDataSet);
begin
  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Add( 'select Max(cd_instituicao) from Instituicoes_ensino' );
  Dm.qAux1.Open;
  tblEscolascd_instituicao.AsInteger := Dm.qAux1.Fields[0].Asinteger + 1;

end;

procedure TfrmEscolas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  tblEscolas.Open;
end;


{
   procedure ComparaCampos
   Parametros para montagem da string
   1 -   Inclusão
   2 -   Alteração
   3 -   Exclusão
}
procedure TfrmEscolas.geralogs();
var
sValor_Antigo : string;
i : Integer; 
begin
   if (Acao = 2) then
   begin
      for i := 0 to tblEscolas.Fields.Count - 1 do
      begin
         sValor_Antigo := strCampos.Values[tblEscolas.Fields[i].fieldName];
         if (tblEscolas.Fields[i].FieldName <> 'im_logo') and (sValor_Antigo <>  tblEscolas.Fields[i].asString) and (tblEscolas.Fields[i].FieldName <> 'cd_instituicao') then
         begin
            strLogsObservacao := strLogsObservacao+'Campo: '+tblEscolas.Fields[i].FieldName +' Valor antigo: '+ sValor_Antigo +'  Valor:'+ tblEscolas.Fields[i].AsString+#13
         end
         else
         begin
            if(tblEscolas.Fields[i].FieldName = 'im_logo')then
            begin
               if (bImagemModificada) then
                  strLogsObservacao := strLogsObservacao+'O campo imagem foi modificado';
            end;
         end;
      end;
   end;
   if (Acao = 1)  then
   begin
      for i := 0 to tblEscolas.Fields.Count - 1 do
      begin
         if (tblEscolas.Fields[i].FieldName <> 'im_logo')and (tblEscolas.Fields[i].FieldName <> 'cd_instituicao')then
         begin
            strLogsObservacao := strLogsObservacao+'Campo: '+tblEscolas.Fields[i].FieldName +' Valor:'+ tblEscolas.Fields[i].AsString+#13
         end
         else
         begin
            if (bImagemModificada) then
               strLogsObservacao := strLogsObservacao+'O campo imagem foi modificado';
         end;
      end;
   end;
   if(Acao=3)then
   begin
      strLogsObservacao := 'Foi deletada a instituição '+sInstDeletada;
   end;
   Case Acao of
      1:  DM.setLog(1004,'Inclusao',IntToStr(lng)+':'+DateToStr(now()), DM.UsuarioLogado.ColigadaLogada , strLogsObservacao);
      2:  DM.setLog(1004,'Alteracao', tblEscolascd_instituicao.AsString+':'+DateToStr(Now) , DM.UsuarioLogado.ColigadaLogada, strLogsObservacao);
      3:  DM.setLog(1004,'Exclusao', tblEscolascd_instituicao.AsString+':'+DateToStr(Now)  , DM.UsuarioLogado.ColigadaLogada, strLogsObservacao);
   end;
   bImagemModificada := false;
   strLogsObservacao :='';

end;


procedure TfrmEscolas.tblEscolasAfterEdit(DataSet: TDataSet);
begin
   // Guardar as informações de nome da Instituição, cidade e estado antes da alteração

   sNomeAntes   := tblEscolasnm_instituicao.AsString;
   sCidadeAntes := tblEscolasds_cidade.AsString;
   sEstadoAntes := tblEscolasds_estado.AsString;
end;

procedure TfrmEscolas.tblEscolasAfterPost(DataSet: TDataSet);
begin
  lng := tblEscolascd_instituicao.AsInteger;

  geralogs;
  strLogsObservacao := '';

  Dataset.Close;
  Dataset.Open;
  Dataset.Locate( 'cd_instituicao', lng, [loCaseInsensitive] );

end;

procedure TfrmEscolas.tblEscolasBeforeDelete(DataSet: TDataSet);
Var
   sAux : String;
   qAux: TUMZQuery;
   bG : boolean;
   bS : boolean;
begin
   // Verificar se esta instituição está em uso no histórico anterior do aluno
      Dm.CriarConsulta(qAux);

      qAux.Close();
      qAux.Sql.Text :=
        ' SELECT count(*) AS QTD from historico_escolas_grau WHERE cd_instituicao = ' + tblEscolascd_instituicao.AsString;
      qAux.Open();

      bG := qAux.FieldByName('QTD').AsInteger > 0;

      qAux.Close();
      qAux.Sql.Text :=
        ' SELECT count(*) AS QTD from historico_escolas_series WHERE cd_instituicao = ' + tblEscolascd_instituicao.AsString;
      qAux.Open();

      bS := qAux.FieldByName('QTD').AsInteger > 0;

      if (bG OR bS) then begin

           sAux := 'Atenção' + CHR(13) + CHR(13) +
                   'Você está excluindo uma Instituição de Ensino que está vinculada ao Histórico de alguns estudantes. ' + CHR(13) + CHR(13);
           sAux := sAux + 'Deseja realmente continuar?';

           if Mensagem(sAux, 'UNIMESTRE', MB_YESNO + MB_ICONWARNING, Handle) = mrYes then begin

              if BG then begin

                 qAux.Close();
                 qAux.SQL.Text :=
                   ' UPDATE historico_escolas_grau ' +
                   '    SET cd_instituicao = NULL ' +
                   '  WHERE cd_instituicao = :cd_instituicao ';
                 qAux.ParamByName('cd_instituicao').AsInteger := tblEscolascd_instituicao.AsInteger;

                 qAux.ExecSQL();

              end;

              if bS then begin

                 qAux.Close();
                 qAux.SQL.Text :=
                   ' UPDATE historico_escolas_series ' +
                   '    SET cd_instituicao = NULL ' +
                   '  WHERE cd_instituicao = :cd_instituicao ';

                 qAux.ParamByName('cd_instituicao').AsInteger := tblEscolascd_instituicao.AsInteger;

                 qAux.ExecSQL();

              end;

           end else begin

              // Abortar a Edição

              FreeAndNil(qAux);

              Abort;

           end;

      end;

      FreeAndNil(qAux);
end;

procedure TfrmEscolas.tblEscolasBeforePost(DataSet: TDataSet);
Var
   sAux : String;
   qAux: TUMZQuery;
   bG : boolean;
   bS : boolean;
begin
   if (tblEscolasnm_instituicao.AsString <> sNomeAntes) OR
      (tblEscolasds_cidade.AsString <> sCidadeAntes) OR
      (tblEscolasds_estado.AsString <> sEstadoAntes)
   then begin


      // Verificar se esta instituição está em uso no histórico anterior do aluno
      Dm.CriarConsulta(qAux);

      qAux.Close();
      qAux.Sql.Text :=
        ' SELECT count(*) AS QTD from historico_escolas_grau WHERE cd_instituicao = ' + tblEscolascd_instituicao.AsString;
      qAux.Open();

      bG := qAux.FieldByName('QTD').AsInteger > 0;

      qAux.Close();
      qAux.Sql.Text :=
        ' SELECT count(*) AS QTD from historico_escolas_series WHERE cd_instituicao = ' + tblEscolascd_instituicao.AsString;
      qAux.Open();

      bS := qAux.FieldByName('QTD').AsInteger > 0;

      if (bG OR bS) then begin
      
           sAux := 'Atenção' + CHR(13) + CHR(13) +
                   'Você está alterando as seguintes dados da Instituição: ' + CHR(13) + CHR(13);
           if (tblEscolasnm_instituicao.AsString <> sNomeAntes) then begin
              sAux := sAux + '- Nome de: ' +  sNomeAntes + CHR(13) +
                             '   para: ' + tblEscolasnm_instituicao.AsString + CHR(13);
           end;

           if (tblEscolasds_cidade.AsString <> sCidadeAntes) then begin
              sAux := sAux + '- Cidade de: ' +  sCidadeAntes + CHR(13) +
                             '   para: ' + tblEscolasds_cidade.AsString + CHR(13);
           end;

           if (tblEscolasds_estado.AsString <> sEstadoAntes) then begin
              sAux := sAux + '- Estado de: ' +  sEstadoAntes + CHR(13) +
                             '   para: ' + tblEscolasds_estado.AsString + CHR(13);
           end;

           sAux := sAux + CHR(13) + 'Essas informações estão registradas no histórico anterior de alguns alunos. ';
           sAux := sAux + 'Se você continuar, esses alunos terão suas informações também alteradas. ';
           sAux := sAux + 'Para não alterar os históricos dos alunos, você deve cancelar essa ação e incluir uma nova instituição de ensino.' + CHR(13) + CHR(13);

           sAux := sAux + 'Deseja confirmar a alteração no cadastro da Instituição e também nos históricos dos alunos?';

           if Mensagem(sAux, 'UNIMESTRE', MB_YESNO + MB_ICONWARNING, Handle) = mrYes then begin

              if BG then begin

                 qAux.Close();
                 qAux.SQL.Text :=
                   ' UPDATE historico_escolas_grau ' +
                   '    SET ds_escola = :nm_instituicao' +
                   '      , ds_escola_cidade = :ds_cidade ' +
                   '      , ds_escola_estado = :ds_estado ' +
                   '  WHERE cd_instituicao = :cd_instituicao ';

                 qAux.ParamByName('nm_instituicao').AsString := tblEscolasnm_instituicao.AsString;
                 qAux.ParamByName('ds_cidade').AsString := tblEscolasds_cidade.AsString;
                 qAux.ParamByName('ds_estado').AsString := tblEscolasds_estado.AsString;
                 qAux.ParamByName('cd_instituicao').AsInteger := tblEscolascd_instituicao.AsInteger;

                 qAux.ExecSQL();

              end;

              if bS then begin

                 qAux.Close();
                 qAux.SQL.Text :=
                   ' UPDATE historico_escolas_series ' +
                   '    SET ds_escola = :nm_instituicao' +
                   '      , ds_escola_cidade = :ds_cidade ' +
                   '      , ds_escola_estado = :ds_estado ' +
                   '  WHERE cd_instituicao = :cd_instituicao ';

                 qAux.ParamByName('nm_instituicao').AsString := tblEscolasnm_instituicao.AsString;
                 qAux.ParamByName('ds_cidade').AsString := tblEscolasds_cidade.AsString;
                 qAux.ParamByName('ds_estado').AsString := tblEscolasds_estado.AsString;
                 qAux.ParamByName('cd_instituicao').AsInteger := tblEscolascd_instituicao.AsInteger;

                 qAux.ExecSQL();

              end;

           end else begin

              // Abortar a Edição
              
              FreeAndNil(qAux);

              Abort;

           end;   

      end;
      FreeAndNil(qAux);
   end;
end;

procedure TfrmEscolas.grdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if( tblEscolas.FieldByName('sn_irregular').AsInteger = 1) then
   begin
       grd.Canvas.Brush.Color := clRed;
   end;
   grd.DefaultDrawDataCell(Rect, grd.columns[datacol].field, State);
end;

procedure TfrmEscolas.grdTitleClick(Column: TColumn);
Var strAux : String;
begin
   tblEscolas.Close;
   tblEscolas.SQL.Text := 'select * from instituicoes_ensino';
   case column.Index of
       0 : strAux := 'Order by cd_instituicao';
       1 : strAux := 'Order by nm_instituicao';
       2 : strAux := 'Order by ds_diretor';
       3 : strAux := 'Order by ds_telefone1';
       4 : strAux := 'Order by ds_telefone2';
       5 : strAux := 'Order by ds_telefone1';
   Else
       strAux := 'Order by cd_instituicao';
   End;
   tblEscolas.Sql.Add(strAux);
   tblEscolas.Open;

end;


procedure TfrmEscolas.imageFotoDblClick(Sender: TObject);
var
  Imagem:TJPEGImage;
  BS: TStream;
begin

   pnCadastro.setfocus();
   if (tblEscolas.State = dsInsert)or (tblEscolas.State = dsEdit) then
      tblEscolas.Post;
   { Procurar a foto da pessoa }
   qryImagem.Edit;
   AbrirFoto.Execute;
   if AbrirFoto.FileName <> '' Then Begin
      { Cria um componente JPEG }
      Imagem := TJPEGImage.Create;
      bImagemModificada := true;
      BS := qryImagem.CreateBlobStream(qryImagemim_logo, bmWrite);
      { Abre a imagem do OpenPictureDialog para o componente JPEG criado anteriormente }
      Imagem.LoadFromFile(AbrirFoto.FileName);

      { Apenas abre a imagem no TImage que existe na tela (Name: Foto) }
      frm_Pessoas.ResizeFoto(Imagem, 500, 500);
      imageFoto.Picture.Assign(Imagem);
      Panel1.Caption := '';
      imageFoto.Visible:= true; 

      { Abre a imagem do OpenPictureDialog para o componente JPEG criado anteriormente }

      Imagem.SaveToStream(BS);


      { Libera da memória os componentes que foram criados }
      FreeAndNil(Imagem);
      TBlobField(qryImagemim_logo).LoadFromStream(BS);
      qryImagem.Post();
      AbrirFoto.FileName:='';
   End;
   qryImagem.Cancel;


end;



procedure TfrmEscolas.mIExcluirClick(Sender: TObject);
begin
//excluir
   bImagemModificada := true;
    { Coloca a tabela em modo de edição }
   qryImagem.Edit;
   qryImagemim_logo.AsString := '';
   //tblEscolasim_pessoa.AsString := '';
   bImagemModificada := true;
   imageFoto.Visible := False;
   Panel1.Caption := 'Foto';
   qryImagem.Post();
end;

procedure TfrmEscolas.mICancelarClick(Sender: TObject);
begin
//cancelar

end;

procedure TfrmEscolas.DbFimIrregularEnter(Sender: TObject);
begin
   if(tblEscolasdt_inicio_irregular.IsNull) then
   begin
      DbInicioIrregular.SetFocus;
   end;
end;

procedure TfrmEscolas.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 Then
   Begin
      SelectNext(Sender As TWinControl, True, True);
      Key := #0;
   End;
end;

procedure TfrmEscolas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblEscolas, pmQtd);
end;

procedure TfrmEscolas.salvarCidades;
var
   qyBuscaCodigo : TUMZQuery;
begin
   dm.CriarConsulta(qyBuscaCodigo);
   qyBuscaCodigo.SQL.Add('SELECT cd_municipio FROM municipios WHERE ds_municipio = ''' + cbMunicipio.Items[cbMunicipio.itemindex] + ''' AND uf = :uf  ');
   qyBuscaCodigo.ParamByName('uf').AsString := qryEstadods_uf.AsString;
   qyBuscaCodigo.Open;

   if (qyBuscaCodigo.FieldByName('cd_municipio').AsString <> '') then
   begin
      tblEscolascd_municipio.AsString := qyBuscaCodigo.FieldByName('cd_municipio').AsString ;
      tblEscolasds_cidade.AsString := cbMunicipio.Items[cbMunicipio.itemindex];
   end;
end;

procedure TfrmEscolas.sbFiltrarClick(Sender: TObject);
begin
   localizar(ledInstitucao.Text);
end;

procedure TfrmEscolas.sbLimparClick(Sender: TObject);
begin
   ledInstitucao.Text := '';
end;

procedure TfrmEscolas.spLocalizarClick(Sender: TObject);
begin
   try
      localizar(ledInstitucao.Text);
   except on E: Exception do
   end;
end;

procedure TfrmEscolas.ledInstitucaoKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then
      spLocalizarClick(nil);
end;

procedure TfrmEscolas.localizar(nm_instituicao : string);
begin
   if (nm_instituicao <> sUltimoFiltro) then
   begin
      iQtdGeral := 1;
      qryFiltros.Close;
      qryFiltros.ParamByName('nm_instituicao').AsString := '%'+nm_instituicao+'%';
      qryFiltros.Open;
      qryFiltros.First;
      sUltimoFiltro := nm_instituicao;
   end
   else
   begin
      if (qryFiltros.Active = false) then
      begin
         qryFiltros.Close;
         qryFiltros.ParamByName('nm_instituicao').AsString := '%'+nm_instituicao+'%';
         qryFiltros.Open;
      end;
      if(iQtdGeral < qryFiltros.RecordCount)then
      begin
         iQtdGeral := iQtdGeral + 1;
         qryFiltros.Next;
      end
      else
      begin
         iQtdGeral := 1;
         qryFiltros.First;
      end;
   end;
   tblEscolas.Locate('cd_instituicao',qryFiltroscd_instituicao.AsInteger,[]);
   if(qryFiltros.RecordCount <> 0)then
   begin
      lblTotal.Caption := '('+ IntToStr(iQtdGeral)+'/'+IntToStr(qryFiltros.RecordCount)+')';
   end
   else
   begin
      lblTotal.Caption := 'Nenhum registro.';  
   end;
end;

end.
