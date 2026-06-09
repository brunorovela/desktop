unit uCadDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Mask, dblookup, UMComboBox, uItemCombo,
  UMEditNumerico, UZSortedGrid;

type
  Tfrm_Documentos = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TZSortedGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    tblDocumento: TUMZQuery;
    dsDocumento: TDataSource;
    qMax: TUMZQuery;
    qMaxUltimo: TSmallintField;
    pmQtd: TPopupMenu;
    tblDocumentocodigo: TSmallintField;
    tblDocumentodocumento: TStringField;
    tblDocumentoprazo: TStringField;
    tblDocumentosigla: TStringField;
    tblDocumentoordem: TIntegerField;
    tblDocumentods_sexo: TStringField;
    qyUniDocs: TUMZQuery;
    dsTipoPessoa: TDataSource;
    qyTipoPessoa: TUMZQuery;
    qyTipoPessoacd_tipo_pessoa: TIntegerField;
    qyTipoPessoads_tipo_pessoa: TStringField;
    tblDocumentocd_tipo_pessoa: TIntegerField;
    tblDocumentolookup_tipo_pessoa: TStringField;
    qryTabelaSiga: TUMZQuery;
    dsTabelasiga: TDataSource;
    qryTabelaSigacd_siga: TLargeintField;
    qryTabelaSigacd_siga_pai: TLargeintField;
    qryTabelaSigacd_tipo: TLargeintField;
    qryTabelaSigacd_local: TLargeintField;
    qryTabelaSigads_codigo_siga: TStringField;
    qryTabelaSigads_assunto: TStringField;
    qryTabelaSigads_fase_corrente: TStringField;
    qryTabelaSigads_fase_intermediaria: TStringField;
    qryTabelaSigads_fase_final: TStringField;
    qryTabelaSigads_destinacao_final: TStringField;
    qryTabelaSigame_observacao: TStringField;
    qryTabelaSigasn_mec: TSmallintField;
    qryTabelaSigadt_cadastro: TDateTimeField;
    tblDocumentocd_siga: TIntegerField;
    qryModuloSiga: TUMZQuery;
    Panel4: TPanel;
    Bevel6: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblPermiteDigitalizar: TLabel;
    lblQuantidadedDPI: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbDocumento: TDBEdit;
    dbPrazo: TDBEdit;
    dbSigla: TDBEdit;
    dbOrgem: TDBEdit;
    rgSexo: TDBRadioGroup;
    dbCodigo: TDBEdit;
    dblcTipoPessoa: TDBLookupComboBox;
    cbTabelaSiga: TUMComboBox;
    dbLargura: TDBEdit;
    cbPermiteDigitalizar: TUMComboBox;
    cbQtdDPI: TUMComboBox;
    dbAltura: TDBEdit;
    tblDocumentosn_digitaliza: TStringField;
    tblDocumentoNR_DPI: TSmallintField;
    tblDocumentonr_altura: TSmallintField;
    tblDocumentonr_largura: TSmallintField;
    procedure cbQtdDPICloseUp(Sender: TObject);
    procedure cbPermiteDigitalizarCloseUp(Sender: TObject);
    procedure cbPermiteDigitalizarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblDocumentoBeforePost(DataSet: TDataSet);
    procedure cbTabelaSigaCloseUp(Sender: TObject);
    procedure cbTabelaSigaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTabelaSigaKeyPress(Sender: TObject; var Key: Char);
    procedure cbTabelaSigaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDocumentoDataChange(Sender: TObject; Field: TField);
    procedure tblDocumentoAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsDocumentoStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure tblDocumentoNewRecord(DataSet: TDataSet);
    procedure verificaQuantidadeDPICombo;
  private
    status: TDataSetState;
  public
    { Public declarations }
  end;

var
  frm_Documentos: Tfrm_Documentos;

implementation

uses Main, uDM, uUsuario, uChecarUsoColigada, uDocumento;

{$R *.dfm}

procedure Tfrm_Documentos.FormShow(Sender: TObject);
var
   I:Integer;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblDocumento.Close;
   tblDocumento.Open;
   
   qryTabelaSiga.Open;

   cbTabelaSiga.Items.Clear;

   cbTabelaSiga.addItem(
         'Selecione',
         TItemCombo.create(
            qryTabelaSigacd_siga.asString,
            'Selecione'
         )
      );

   qryTabelaSiga.First;
   while not(qryTabelaSiga.EOF) do
   begin

      cbTabelaSiga.addItem(
         qryTabelaSigads_codigo_siga.asString + ' - ' + qryTabelaSigads_assunto.AsString,
         TItemCombo.create(
            qryTabelaSigacd_siga.asString,
            qryTabelaSigads_assunto.AsString
         )
      );

      qryTabelaSiga.Next;
   end;
    
   if cbTabelaSiga.Items.Count > 0 then
   begin
      cbTabelaSiga.ItemIndex := 0;
   end;

   if (tblDocumento.State = dsBrowse) then
   begin
      for I := 0 to (cbTabelaSiga.items.Count - 1) do
      begin
         if (TItemcombo(cbTabelaSiga.Items.Objects[i]).getCodigo = tblDocumentocd_siga.asString) then
         begin
            cbTabelaSiga.ItemIndex := i;
         end;
      end;
   end;

   qryModuloSiga.Close;
   qryModuloSiga.Open;
   if not(qryModuloSiga.FieldByName('sn_ativo').AsString = '1') then
   begin
      cbTabelaSiga.Enabled := false;
   end;

end;

procedure Tfrm_Documentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Documentos.FormCreate(Sender: TObject);
const
   SMsgSemConexao =
      'Não foi possivel estabelecer conexão com a base de documentos do UNIMESTRE.';
begin
   if not DM.ConectaUnimestreDocs then
   begin
      Mensagem(SMsgSemConexao, 'Erro', MB_ICONERROR + MB_OK, Handle);
      Abort;
   end;
end;

procedure Tfrm_Documentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Documentos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Documentos.btnExcluirClick(Sender: TObject);
const
   SQL_EXCLUIR_DOCS =
      ' DELETE '+
      '   FROM '+
      '      documentos '+
      '   WHERE '+
      '      codigo = :codigo ';
var
   qyVerificaExcluir,
   qyExcluiDocs: TUMZQuery;
begin
   if DM.UsuarioLogado.TemPermissao(1113, npExcluir, true) then
   begin
      //Verifica se o documento que está a ser excluido esta vínculado a algum Aluno (documentos_alunos)
      DM.CriarConsulta(qyVerificaExcluir);
      
      qyVerificaExcluir.SQL.Text := ''+
         ' SELECT count(da.cod_documento) as qtdDocAlunos ' +
         ' FROM documentos dd                                      ' +
         ' INNER JOIN documentos_alunos da                         ' +
         '    ON (da.cod_documento = dd.codigo)                    ' +
         ' WHERE dd.codigo = :codigoDoc                            ';

      qyVerificaExcluir.ParamByName('codigoDoc').asInteger :=
         tblDocumento.FieldByName('codigo').asInteger;

      qyVerificaExcluir.Open;

      if (qyVerificaExcluir.FieldByName('qtdDocAlunos').asInteger > 0) then
      begin
         Mensagem('Não é possível excluir o documento pois o mesmo esta vínculado a Alunos', '', MB_OK + MB_ICONINFORMATION);
         exit;
      end;

      qyVerificaExcluir.Close;

      //Verifica se o documento que está a ser excluido esta vínculado a algum Curso (documentos_necessarios)
      qyVerificaExcluir.SQL.Text := ''+
         ' SELECT count(dn.cod_documento) as qtdDocNecessarios ' +
         ' FROM documentos dd                                      ' +
         ' INNER JOIN documentos_necessarios dn                    ' +
         '    ON (dn.cod_documento = dd.codigo)                    ' +
         ' WHERE dd.codigo = :codigoDoc                            ';

      qyVerificaExcluir.ParamByName('codigoDoc').asInteger :=
         tblDocumento.FieldByName('codigo').asInteger;

      qyVerificaExcluir.Open;

      if (qyVerificaExcluir.FieldByName('qtdDocNecessarios').asInteger > 0) then
      begin
         Mensagem('Não é possível excluir o documento pois o mesmo esta vínculado a cursos como um documento necessário', '', MB_OK + MB_ICONINFORMATION);
         exit;
      end;

      if TChecarUsoColigada.Create( TDocumento.Create( tblDocumentocodigo.AsInteger ) ).NaoPossuiPermissao() then
      begin
         exit;
      end;

      if Mensagem(
            'Deseja realmente excluir ?',
            Application.Title,
            MB_YESNO + MB_ICONQUESTION) = ID_YES then
      begin
         DM.setLog(
            1113,
            'Exclusao',
            'codigo;documento;prazo;sigla;ordem;ds_sexo',
            0,
            'Excluido documento -> '+
            tblDocumentocodigo.AsString+';'+
            tblDocumentodocumento.AsString+';'+
            tblDocumentoprazo.AsString+';'+
            tblDocumentosigla.AsString+';'+
            tblDocumentoordem.AsString+';'+
            tblDocumentods_sexo.AsString
         );

         DM.CriarConsultaDOCs(qyExcluiDocs);

         qyExcluiDocs.SQL.Text := SQL_EXCLUIR_DOCS;
         qyExcluiDocs.ParamByName('codigo').AsInteger :=
            tblDocumento.FieldByName('codigo').asInteger;
         qyExcluiDocs.ExecSQL;   

         tblDocumento.Delete;
      end;
   end;
end;

procedure Tfrm_Documentos.btnFecharClick(Sender: TObject);
begin
   tblDocumento.Close;
   tblDocumento.Open;

   //atualiza documentos digitalizados
   //AtualizaDD();


   Close;
end;

procedure Tfrm_Documentos.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1113, npIncluir, true) then
   begin
      dbCodigo.SetFocus;
      DM.qAux1.Close;
      DM.qAux1.SQL.Clear;
      Dm.qAux1.SQL.Add('select max(codigo) ultimo from documentos');
      Dm.qAux1.Open;
      tblDocumento.Insert;
      tblDocumentocodigo.AsInteger := DM.qAux1.FieldByName('ultimo').AsInteger + 1;
      Dm.qAux1.Close;
   end;
   cbTabelaSiga.ItemIndex := 0;
end;

procedure Tfrm_Documentos.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1113, npAlterar, true) then
   begin

      if TChecarUsoColigada.Create( TDocumento.Create( tblDocumentocodigo.AsInteger ) ).NaoPossuiPermissao() then
      begin
        exit;
      end;

      dbCodigo.SetFocus;
      tblDocumento.Edit;
   end;
end;

procedure Tfrm_Documentos.btnSalvarClick(Sender: TObject);
var
   lugar : Pointer;
   I: Integer;
begin
   lugar := tblDocumento.GetBookmark;

   if cbTabelaSiga.ItemIndex > 0 then
   begin
      tblDocumentocd_siga.AsInteger := 
         StrToInt(
            TItemcombo(cbTabelaSiga.Items.Objects[cbTabelaSiga.ItemIndex]).getCodigo
         );
   end;

   if cbQtdDPI.ItemIndex > 0 then
   begin
      tblDocumentoNR_DPI.AsInteger := strToInt(cbQtdDPI.Text);
   end else
   begin
      tblDocumentoNR_DPI.AsInteger := 0;
   end;

   if cbPermiteDigitalizar.ItemIndex >= 0 then
   begin
      case cbPermiteDigitalizar.ItemIndex of
         0 :
            begin
               tblDocumentosn_digitaliza.AsString := 'S';
            end;
         1 :
            begin
               tblDocumentosn_digitaliza.AsString := 'N';
               tblDocumentoNR_DPI.AsInteger := 0;
               tblDocumentonr_altura.AsInteger := 0;
               tblDocumentonr_largura.AsInteger := 0;
            end;
      end;
   end;

   grd.SetFocus;

   if (tblDocumento.State = dsInsert) then
   begin
      DM.setLog(
         1113,
         'Inclusao',
         'codigo;documento;prazo;sigla;ordem;ds_sexo',
         0,
         'Inserido documento -> '+
         tblDocumentocodigo.AsString+';'+
         tblDocumentodocumento.AsString+';'+
         tblDocumentoprazo.AsString+';'+
         tblDocumentosigla.AsString+';'+
         tblDocumentoordem.AsString+';'+
         tblDocumentods_sexo.AsString
      );
   end;

   if (tblDocumento.State = dsEdit ) then
   begin
      DM.setLog(
         1113,
         'Alteracao',
         'codigo;documento;prazo;sigla;ordem;ds_sexo',
         0,
         'Alterado documento -> ' +
         tblDocumentocodigo.AsString+';'+
         tblDocumentodocumento.AsString+';'+
         tblDocumentoprazo.AsString+';'+
         tblDocumentosigla.AsString+';'+
         tblDocumentoordem.AsString+';'+
         tblDocumentods_sexo.AsString
      );
   end;

   tblDocumento.Post;
   tblDocumento.Close;
   tblDocumento.Open;

   if (tblDocumento.State = dsBrowse) then
   begin
      for I := 0 to (cbTabelaSiga.items.Count - 1) do
      begin
         if (TItemcombo(cbTabelaSiga.Items.Objects[i]).getCodigo = tblDocumentocd_siga.asString) then
         begin
            cbTabelaSiga.ItemIndex := i;
         end;
      end;
   end;

   tblDocumento.GotoBookmark(lugar);

end;

procedure Tfrm_Documentos.cbPermiteDigitalizarChange(Sender: TObject);
begin
   if ( cbPermiteDigitalizar.ItemIndex = 0 ) then
   begin
      cbQtdDPI.Enabled  := True;
      dbLargura.Enabled := True;
      dbAltura.Enabled  := True;
   end
   else
   begin
      cbQtdDPI.Enabled  := False;
      dbLargura.Enabled := False;
      dbAltura.Enabled  := False;
   end;
end;

procedure Tfrm_Documentos.cbPermiteDigitalizarCloseUp(Sender: TObject);
begin
   tblDocumento.Edit;
end;

procedure Tfrm_Documentos.cbQtdDPICloseUp(Sender: TObject);
begin
   tblDocumento.Edit;
end;

procedure Tfrm_Documentos.cbTabelaSigaCloseUp(Sender: TObject);
begin
   tblDocumento.Edit;
end;

procedure Tfrm_Documentos.cbTabelaSigaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Key := 0;
end;

procedure Tfrm_Documentos.cbTabelaSigaKeyPress(Sender: TObject; var Key: Char);
begin
   Key := #0;
end;

procedure Tfrm_Documentos.cbTabelaSigaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Key := 0;
end;

procedure Tfrm_Documentos.btnCancelarClick(Sender: TObject);
begin
   tblDocumento.Cancel;
   tblDocumento.Refresh;
end;

procedure Tfrm_Documentos.dsDocumentoDataChange(Sender: TObject; Field: TField);
var
   i: Integer;
begin
   if (tblDocumento.State = dsBrowse) then
   begin

      cbTabelaSiga.ItemIndex := 0;

      for I := 0 to (cbTabelaSiga.items.Count - 1) do
      begin
         if (TItemcombo(cbTabelaSiga.Items.Objects[i]).getCodigo = tblDocumentocd_siga.asString) then
         begin
            cbTabelaSiga.ItemIndex := i;
         end;
      end;

      //Verifica se o documento foi salvo com a opção de digitalizacao como SIM
      if tblDocumentosn_digitaliza.AsString = 'S' then
      begin
         cbPermiteDigitalizar.ItemIndex := 0;
      end
      else
      begin
         cbPermiteDigitalizar.ItemIndex := 1;   
   	  end;

      // Traz a opção que foi salva pra esse registro
      verificaQuantidadeDPICombo;

     {
      Chama o método para verificar se deve bloquear os campos
      cada vez que o registro selecionado for trocado
     }
     cbPermiteDigitalizarChange( nil );

   end;
end;

procedure Tfrm_Documentos.dsDocumentoStateChange(Sender: TObject);
var
   i: Integer;
begin

   if (tblDocumento.State in [dsInsert, dsEdit]) and (TChecarUsoColigada.Create( TDocumento.Create( tblDocumentocodigo.AsInteger ) ).NaoPossuiPermissao()) then
   begin
      tblDocumento.Cancel;
   end;

   btnInserir.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled := tblDocumento.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := tblDocumento.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_Documentos.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDocumento, pmQtd);
end;

procedure Tfrm_Documentos.tblDocumentoNewRecord(DataSet: TDataSet);
begin
  tblDocumentods_sexo.AsString := 'A';
end;

procedure Tfrm_Documentos.verificaQuantidadeDPICombo;
begin
   case tblDocumentoNR_DPI.AsInteger of
      100 :
         begin
            cbQtdDPI.ItemIndex := 1;
         end;
      200 :
         begin
            cbQtdDPI.ItemIndex := 2;
         end;
      300 :
         begin
            cbQtdDPI.ItemIndex := 3;
         end;
      else
         begin
            cbQtdDPI.ItemIndex := 0;
         end;
   end;
end;

procedure Tfrm_Documentos.tblDocumentoAfterPost(DataSet: TDataSet);
const
   SQL_VERIFICA_EXISTE =
      ' SELECT '+
      '      count(codigo) AS qtd '+
      '   FROM '+
      '      documentos '+
      '   WHERE '+
      '      codigo = :codigo; ';
var
   slFields: TStringList;
   
   i: Integer;

   sAux: String;

   qyAtualizaDocs,
   qyVerificaDocumentoDocs: TUMZQuery;
begin
   slFields := TStringList.Create();
   
   with DM.qyAux do
   begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Text := 'SELECT * FROM documentos WHERE codigo = :codigo';
      ParamByName('codigo').AsString := tblDocumento.FieldByName('codigo').AsString;
      Open();

      if not IsEmpty then
      begin
         for i := 0 to Fields.Count - 1 do
         begin
            slFields.Add(Fields[i].FieldName + '='+Fields[i].AsString);
         end;
      end
      else
      begin
         Close();
         Exit;
      end;
      
      Close();
   end;

   DM.CriarConsultaDOCs(qyAtualizaDocs);
   DM.CriarConsultaDOCs(qyVerificaDocumentoDocs);

   qyVerificaDocumentoDocs.SQL.Text := SQL_VERIFICA_EXISTE;
   qyVerificaDocumentoDocs.ParamByName('codigo').AsInteger :=
      tblDocumento.FieldByName('codigo').AsInteger;
   qyVerificaDocumentoDocs.Open;

   {
      Por padrão fará o UPDATE, assim não gerará erro de cadastro duplicado
   }
   status := dsEdit;
   if qyVerificaDocumentoDocs.FieldByName('qtd').AsInteger = 0 then
   begin
      status := dsInsert;
   end;

   if (status in [dsInsert]) then
   begin
      qyAtualizaDocs.Close();

      qyAtualizaDocs.SQL.Clear();

      qyAtualizaDocs.SQL.Add('INSERT INTO documentos VALUES (');

      sAux := '';
      for i := 0 to slFields.Count-1 do
      begin
         qyAtualizaDocs.SQL.Add(
            sAux
            + '"'
            + slFields.ValueFromIndex[i]
            + '"'
         );
         sAux := ', ';
      end;

      qyAtualizaDocs.SQL.Add(')');
      qyAtualizaDocs.ExecSQL();
   end
   else if (status in [dsEdit]) then
   begin
      qyAtualizaDocs.Close();

      qyAtualizaDocs.SQL.Clear();
      qyAtualizaDocs.SQL.Add('UPDATE documentos SET');
      sAux := '';

      for i := 0 to slFields.Count-1 do
      begin
         qyAtualizaDocs.SQL.Add(
            sAux + slFields.Names[i]
            + '="'
            + slFields.ValueFromIndex[i]
            + '"'
         );
         sAux := ', ';
      end;

      qyAtualizaDocs.SQL.Add(
         '  WHERE codigo = '
         + slFields.Values['codigo']
         + ''
      );
      
      qyAtualizaDocs.SQL.Add('   LIMIT 1 ');

      qyAtualizaDocs.ExecSQL();
   end;
end;

procedure Tfrm_Documentos.tblDocumentoBeforePost(DataSet: TDataSet);
begin
   status := tblDocumento.State;
end;

end.

