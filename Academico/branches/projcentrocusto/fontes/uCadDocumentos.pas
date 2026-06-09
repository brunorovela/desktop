unit uCadDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Mask, dblookup, UMComboBox, uItemCombo;

type
  Tfrm_Documentos = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel4: TPanel;
    Bevel6: TBevel;
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
    Label1: TLabel;
    dbDocumento: TDBEdit;
    Label2: TLabel;
    dbPrazo: TDBEdit;
    Label3: TLabel;
    dbSigla: TDBEdit;
    Label4: TLabel;
    dbOrgem: TDBEdit;
    rgSexo: TDBRadioGroup;
    Label5: TLabel;
    dbCodigo: TDBEdit;
    qyUniDocs: TUMZQuery;
    dsTipoPessoa: TDataSource;
    qyTipoPessoa: TUMZQuery;
    qyTipoPessoacd_tipo_pessoa: TIntegerField;
    qyTipoPessoads_tipo_pessoa: TStringField;
    tblDocumentocd_tipo_pessoa: TIntegerField;
    tblDocumentolookup_tipo_pessoa: TStringField;
    dblcTipoPessoa: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
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
    cbTabelaSiga: TUMComboBox;
    tblDocumentocd_siga: TIntegerField;
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
  private
    { Private declarations }
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
   
end;

procedure Tfrm_Documentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
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
var
   qyVerificaExcluir: TUMZQuery;
begin
   if DM.UsuarioLogado.TemPermissao(1113, npExcluir, true) then
   begin

      //Verifica se o documento que está a ser excluido esta vínculado a algum Aluno (documentos_alunos)
      DM.CriarConsulta(qyVerificaExcluir);
      qyVerificaExcluir.SQL.Text := ''+
      ' SELECT count(da.cod_documento) as qtdDocAlunos' +
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
      ' SELECT count(dn.cod_documento) as qtdDocNecessarios' +
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

     if Mensagem( 'Deseja realmente excluir ?', Application.Title,
        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
     begin
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

   if cbTabelaSiga.ItemIndex > -1 then
   begin
      tblDocumentocd_siga.AsInteger := 
         StrToInt(
            TItemcombo(cbTabelaSiga.Items.Objects[cbTabelaSiga.ItemIndex]).getCodigo
         );
   end;

   if (tblDocumento.State = dsInsert) then
   begin
      DM.setLog(
          1113,
          '',
          tblDocumento.FieldByName('codigo').asString,
          0,
          'Inserido documento'
       );
   end;

   if (tblDocumento.State = dsEdit ) then
   begin
      DM.setLog(
          1113,
          '',
          tblDocumento.FieldByName('codigo').asString,
          0,
          'Alterado documento'
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



procedure Tfrm_Documentos.tblDocumentoAfterPost(DataSet: TDataSet);
var
   slFields: TStringList;
   i: Integer;
   sAux: String;
begin
   slFields := TStringList.Create();
   with DM.qyAux do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Text := 'SELECT * FROM documentos WHERE codigo = :codigo';
      ParamByName('codigo').AsString := tblDocumento.FieldByName('codigo').AsString;
      Open();
      if not IsEmpty then begin
         for i := 0 to Fields.Count - 1 do begin
            slFields.Add(Fields[i].FieldName + '='+Fields[i].AsString);
         end;
      end
      else begin
         Close();
         Exit;
      end;
      Close();
   end;

   if (tblDocumento.State in [dsInsert]) then begin
      with qyUniDocs do begin
         Close();
         SQL.Clear();
         SQL.Add('INSERT INTO documentos VALUES (');
         sAux := '';
         for i := 0 to slFields.Count-1 do begin
            SQL.Add(sAux + '"' + slFields.ValueFromIndex[i]+ '"" ');
            sAux := ', ';
         end;
         SQL.Add(')');
         ExecSQL();
      end;
   end
   else if (tblDocumento.State in [dsEdit]) then begin
      with qyUniDocs do begin
         Close();
         SQL.Clear();
         SQL.Add('UPDATE documentos SET');
         sAux := '';
         for i := 0 to slFields.Count-1 do begin
            SQL.Add(sAux + slFields.Names[i] + '="' + slFields.ValueFromIndex[i]+ '"');
            sAux := ', ';
         end;
         SQL.Add('  WHERE codigo = '+ slFields.Values['codigo'] + '');
         SQL.Add('   LIMIT 1 ');
         ExecSQL();
      end;
   end;
end;

end.

