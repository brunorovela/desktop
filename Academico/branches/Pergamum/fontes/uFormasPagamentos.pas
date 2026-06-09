unit uFormasPagamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, UMComboBox, Mask, Grids, DBGrids, Buttons,
  ComCtrls, ToolWin, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, ImgList, uDM, General, uUsuario, UMAjuda;

type
  TfrmFormasPagamento = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    ilBotoes: TImageList;
    qryFormasPgto: TUMZQuery;
    dsFormasPgto: TDataSource;
    Panel2: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    Bevel7: TBevel;
    Panel6: TPanel;
    rgFiltroAtivo: TRadioGroup;
    Panel7: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    dbeVencDebito: TDBEdit;
    cbChavePgto: TComboBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Bevel5: TBevel;
    qryUpdatePgto: TUMZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    qryFormasPgtoCD_FORMA_PGTO: TLargeintField;
    qryFormasPgtoCD_COLIGADA_MATRIZ: TIntegerField;
    qryFormasPgtoDS_FORMA_PGTO: TStringField;
    qryFormasPgtoSN_CADASTRA_CHEQUE: TSmallintField;
    qryFormasPgtoSN_ATIVO: TSmallintField;
    qryFormasPgtoSN_COMPENSA_AUTO: TSmallintField;
    qryFormasPgtoCD_CHAVE_PGTO: TStringField;
    qryFormasPgtoSN_PADRAO_COMPROMISSO_AULA: TSmallintField;
    dbckPadraoCompromissoAula: TDBCheckBox;
    qryRemovePadrao: TUMZQuery;
    hlpPadrao: TUMAjuda;
    procedure qryFormasPgtoAfterPost(DataSet: TDataSet);
    procedure qryFormasPgtoSN_COMPENSA_AUTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryFormasPgtoSN_ATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryFormasPgtoSN_CADASTRA_CHEQUEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryFormasPgtoAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure rgFiltroAtivoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cbChavePgtoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsFormasPgtoDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsFormasPgtoStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    function alteraTexto(ds_param : Variant) : String;
  private
    sOrdem : String;
  public
    { Public declarations }
  end;

var
  frmFormasPagamento: TfrmFormasPagamento;

implementation

uses uIUMDataModule, ZDbcIntfs;

{$R *.dfm}

function TfrmFormasPagamento.alteraTexto(ds_param: Variant): String;
begin
   {
      Verifica se o valor que vem da query na Grid é 1(um)
      caso verdadeiro escreve Sim, Caso seja 0(zero) escreve Não
   }
   Result := 'Não';
   if Null = ds_param then
   begin
      Result := 'Não'
   end
   else if ds_param = '1' then
   begin
      Result := 'Sim'
   end;
end;

procedure TfrmFormasPagamento.btnAlterarClick(Sender: TObject);
begin

   if DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.FormaPgto', npAlterar, True )then
   begin
      qryFormasPgto.Edit;
   end;

end;

procedure TfrmFormasPagamento.btnCancelarClick(Sender: TObject);
begin
   qryFormasPgto.Cancel;
end;

procedure TfrmFormasPagamento.btnExcluirClick(Sender: TObject);
const
   S_MSG_CONFIRMA_EXCLUSAO = 'Deseja realmente excluir a forma de pagamento selecionada?';
   S_MSG_NAO_EXCLUSAO = 'Esta forma de pagamento possui vínculo com %d registros de contas a pagar e, portanto, não pode ser excluída.';
   S_SQL_SEL_CONTAS = 'SELECT COUNT(*) TOTAL FROM FIN_CONTAS_PAGAR cp JOIN COLIGADAS c ON (cp.CD_COLIGADA = c.CD_COLIGADA) WHERE cp.CD_FORMA_PGTO = ? AND c.CD_COLIGADA_MATRIZ = ?';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   S: AnsiString;
begin

   if DM.UsuarioLogado.TemPermissao(0, 'UMFinanceiro.FormaPgto', npAlterar, True) then
   begin
   
      if Mensagem(S_MSG_CONFIRMA_EXCLUSAO, 'Confirmação', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = mrYes then
      begin

         Stmt := DM.db.DbcConnection.PrepareStatement(S_SQL_SEL_CONTAS);
         try
            Stmt.SetInt(1, qryFormasPgtoCD_FORMA_PGTO.AsInteger);
            Stmt.SetInt(2, qryFormasPgtoCD_COLIGADA_MATRIZ.AsInteger);

            ResultSet := Stmt.ExecuteQueryPrepared;
            try
               if ResultSet.Next and (ResultSet.GetInt(1) > 0) then
               begin
                  S := Format(S_MSG_NAO_EXCLUSAO, [ResultSet.GetInt(1)]);
                  Mensagem(S, 'Informação', MB_OK + MB_ICONEXCLAMATION);
               end
               else
               begin
               
                  DM.setLog(123654, 'Exclusão', 'Exclusão', 0, DM.getQueryJson(qryFormasPgto));
                  
                  qryFormasPgto.Edit;
                  qryFormasPgtoSN_ATIVO.AsInteger := 0;
                  qryFormasPgto.Post;
               end;
            finally
               ResultSet.Close;
            end;
         finally
            Stmt.Close;
         end;
      end;
   end;
end;

procedure TfrmFormasPagamento.btnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmFormasPagamento.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.FormaPgto', npIncluir, True )then
   begin
      qryFormasPgto.Insert;
   end;
end;

procedure TfrmFormasPagamento.btnSalvarClick(Sender: TObject);
begin
   qryFormasPgto.Post;
end;

procedure TfrmFormasPagamento.cbChavePgtoChange(Sender: TObject);
begin
   if ( not qryFormasPgto.IsEmpty ) then
   begin
      qryFormasPgto.Edit;

      case cbChavePgto.ItemIndex of
         0:
            qryFormasPgtocd_chave_pgto.AsString := '';
         1:
            qryFormasPgtocd_chave_pgto.AsString := '[BOLETO]';
         2:
            qryFormasPgtocd_chave_pgto.AsString := '[ARRECADACAO]';
         3:
            qryFormasPgtocd_chave_pgto.AsString := '[CREDITO_CC]';
         4:
            qryFormasPgtocd_chave_pgto.AsString := '[DARF]';
         5:
            qryFormasPgtocd_chave_pgto.AsString := '[GPS]';
      end;
   end;
end;

procedure TfrmFormasPagamento.DBGrid1TitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStrings;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
      SortedFields.NameValueSeparator := ' ';
      SortedFields.DelimitedText := qryFormasPgto.IndexFieldNames;

      for I := 0 to SortedFields.Count - 1 do
      begin
      
         if SortedFields.Names[I] = Column.FieldName then
         begin

            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
            
            Found := True;
            Break;
         end;

      end;

      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;

      qryFormasPgto.IndexFieldNames := SortedFields.DelimitedText;
      
   finally
      SortedFields.Free;
   end;
end;

procedure TfrmFormasPagamento.dsFormasPgtoDataChange(Sender: TObject;
  Field: TField);
begin
   if qryFormasPgto.State = dsBrowse then
   begin
   
      if qryFormasPgtocd_chave_pgto.AsString = '[CREDITO_CC]' THEN
      begin
         cbChavePgto.ItemIndex := 3;
      end;

      if qryFormasPgtocd_chave_pgto.AsString = '[BOLETO]' THEN
      begin
         cbChavePgto.ItemIndex := 1;
      end;

      if qryFormasPgtocd_chave_pgto.AsString = '[ARRECADACAO]' THEN
      begin
         cbChavePgto.ItemIndex := 2;
      end;

      if qryFormasPgtocd_chave_pgto.AsString = '[DARF]' THEN
      begin
         cbChavePgto.ItemIndex := 4;
      end;

      if qryFormasPgtocd_chave_pgto.AsString = '[GPS]' THEN
      begin
         cbChavePgto.ItemIndex := 5;
      end;

      if ((qryFormasPgtocd_chave_pgto.AsString = null)
         or (qryFormasPgtocd_chave_pgto.AsString = '')) THEN
      begin
         cbChavePgto.ItemIndex := 0;
      end;

      if qryFormasPgtoSN_CADASTRA_CHEQUE.AsInteger = 1 then
      begin
         DBCheckBox1.Checked := True;
      end
      else
      begin
         DBCheckBox1.Checked := False;
      end;

      if qryFormasPgtoSN_COMPENSA_AUTO.AsInteger = 1 then
      begin
         DBCheckBox2.Checked := True;
      end
      else
      begin
         DBCheckBox2.Checked := False;
      end;

      if qryFormasPgtoSN_ATIVO.AsInteger = 1 then
      begin
         DBCheckBox3.Checked := True;
      end
      else
      begin
         DBCheckBox3.Checked := False;
      end;
   end;
end;

procedure TfrmFormasPagamento.dsFormasPgtoStateChange(Sender: TObject);
var
   editando: Boolean;
begin
   editando := qryFormasPgto.State in [dsInsert, dsEdit];

   btnSalvar.Enabled    := editando;
   btnCancelar.Enabled  := editando;

   btnInserir.Enabled := not editando;
   btnExcluir.Enabled := not editando;
   btnAlterar.Enabled := not editando;
   DBGrid1.Enabled := not editando;

   if qryFormasPgto.State = dsInsert then
   begin
      qryFormasPgtocd_coligada_matriz.AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   end;
end;

procedure TfrmFormasPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFormasPagamento.FormDestroy(Sender: TObject);
begin
   frmFormasPagamento := nil;
end;

procedure TfrmFormasPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2 : btnInserirClick( nil );
      VK_F3 : btnAlterarClick( nil );
      VK_F5 : btnSalvarClick( nil );
      VK_F9 : btnExcluirClick( nil );
      VK_F6 : btnCancelarClick( nil );
      VK_F12 : btnFecharClick( nil );
   end;
end;

procedure TfrmFormasPagamento.FormShow(Sender: TObject);
begin
   qryFormasPgto.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryFormasPgto.Open;
   rgFiltroAtivo.ItemIndex := 0;
end;

procedure TfrmFormasPagamento.qryFormasPgtoAfterOpen(DataSet: TDataSet);
begin
   btnAlterar.Enabled := (qryFormasPgto.State = dsBrowse) and (not qryFormasPgto.IsEmpty);
   btnExcluir.Enabled := (qryFormasPgto.State = dsBrowse) and (not qryFormasPgto.IsEmpty);
end;

procedure TfrmFormasPagamento.qryFormasPgtoAfterPost(DataSet: TDataSet);
begin
   if qryFormasPgtoSN_PADRAO_COMPROMISSO_AULA.AsInteger = 1 then
   begin
      qryRemovePadrao.ParamByName('CD_FORMA_PGTO').AsInteger := qryFormasPgtoCD_FORMA_PGTO.AsLargeInt;
      qryRemovePadrao.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := qryFormasPgtoCD_COLIGADA_MATRIZ.AsInteger;
      qryRemovePadrao.ExecSQL;
      qryFormasPgto.Refresh;
   end;
end;

procedure TfrmFormasPagamento.qryFormasPgtoSN_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   {
      Verifica se o valor que vem da query na Grid é 1(um)
      caso verdadeiro escreve Sim, Caso seja 0(zero) escreve Não
   }
   Text := alteraTexto( Sender.value );
end;

procedure TfrmFormasPagamento.qryFormasPgtoSN_CADASTRA_CHEQUEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   {
      Verifica se o valor que vem da query na Grid é 1(um)
      caso verdadeiro escreve Sim, Caso seja 0(zero) escreve Não
   }
   Text := alteraTexto( Sender.value );
end;

procedure TfrmFormasPagamento.qryFormasPgtoSN_COMPENSA_AUTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   {
      Verifica se o valor que vem da query na Grid é 1(um)
      caso verdadeiro escreve Sim, Caso seja 0(zero) escreve Não
   }
   Text := alteraTexto( Sender.value );
end;

procedure TfrmFormasPagamento.rgFiltroAtivoClick(Sender: TObject);
var
   S: AnsiString;
begin
   qryFormasPgto.Close;

   if rgFiltroAtivo.ItemIndex = 0 then
   begin
      qryFormasPgto.Filter := 'SN_ATIVO = 1';
      qryFormasPgto.Filtered := True;
   end
   else if rgFiltroAtivo.ItemIndex = 1 then
   begin
      qryFormasPgto.Filter := 'SN_ATIVO = 0';
      qryFormasPgto.Filtered := True;
   end
   else
   begin
      qryFormasPgto.Filtered := False;
   end;
   
   qryFormasPgto.Open;
end;

end.
