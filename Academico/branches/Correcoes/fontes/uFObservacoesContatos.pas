unit UFObservacoesContatos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, uDM, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
   ImgList, ToolWin, ComCtrls, StdCtrls, Menus, ZDbcIntfs, UZDbcFuncs, Buttons,
   DBCtrls, Mask, UMDateTimePicker, UMComboBox;

type
   { Esta enumeração define os tipos de observações que são possíveis registrar.
     okFinancial: Observações financeiras
     okRestrict: Observações financeiras restritas
     okMatriculation: Observações referentes à matrícula
     okPedagogical: Observações pedagógicas
   }
   TObservationKind = (okFinancial, okRestrict, okMatriculation, okPedagogical, okSuplier);

   { Conjunto dos tipos de observações disponíveis.
   }
   TObservationKinds = set of TObservationKind;

   TuObservacoesContatos = class(TForm)
      qryObservacoes: TUMZQuery;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      pnlTitulo: TPanel;
      pnlHistorico: TPanel;
      pnlNovaObs: TPanel;
      splSep1: TSplitter;
      reObsHist: TRichEdit;
      lblObsHist: TLabel;
      lblNovaObs: TLabel;
      dsObservacoes: TDataSource;
      richEditContextMen: TPopupMenu;
      unDo: TMenuItem;
      Cut: TMenuItem;
      copy: TMenuItem;
      paste: TMenuItem;
      delete: TMenuItem;
      selectAll: TMenuItem;
      sbBibNegrito: TSpeedButton;
      sbBibItalico: TSpeedButton;
      sbVermelho: TSpeedButton;
      toolPessoa: TToolBar;
      btnIncluir: TToolButton;
      btnSalvar: TToolButton;
      ImageList2: TImageList;
      btnCancelar: TToolButton;
      sbBibSublinhado: TSpeedButton;
    reNovaObs: TRichEdit;
    qryInserirObservacao: TUMZQuery;
    qryObservacoescd_info_obs: TIntegerField;
    qryObservacoescd_usuario_registrou: TIntegerField;
    qryObservacoesme_observacao: TMemoField;
    qryObservacoesdt_observacao: TDateTimeField;
    btn_fechar: TToolButton;
    Panel1: TPanel;
    Label14: TLabel;
    umdtRetorno: TUMDateTimePicker;
    Label18: TLabel;
    cbStatus: TUMComboBox;
    Label16: TLabel;
    ed_hora_retorno: TMaskEdit;
    qryObservacoesds_status: TStringField;
    qryAtualizaStatusPessoasInfo: TUMZQuery;
    qryObservacoescd_informacao: TIntegerField;
    procedure btn_fecharClick(Sender: TObject);
    procedure qryObservacoesAfterPost(DataSet: TDataSet);
    procedure reNovaObsChange(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure sbVermelhoClick(Sender: TObject);
      procedure sbBibSublinhadoClick(Sender: TObject);
      procedure dsObservacoesStateChange(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure sbBibItalicoClick(Sender: TObject);
      procedure sbBibNegritoClick(Sender: TObject);
      procedure selectAllClick(Sender: TObject);
      procedure deleteClick(Sender: TObject);
      procedure pasteClick(Sender: TObject);
      procedure copyClick(Sender: TObject);
      procedure CutClick(Sender: TObject);
      procedure unDoClick(Sender: TObject);
      procedure richEditContextMenPopup(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure qryObservacoesAfterRefresh(DataSet: TDataSet);
      procedure qryObservacoesAfterOpen(DataSet: TDataSet);
      procedure qryObservacoesBeforeRefresh(DataSet: TDataSet);
      procedure btnSalvarClick(Sender: TObject);
      procedure reNovaObs1Change(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      FKind: TObservationKind;
      FShowAll: Boolean;
      FUserCode: Cardinal;
      FPersonCode: Cardinal;
      FPermissions: TObservationKinds;
      FFecharAposInserir: Boolean;
      FObservacaoCreditoFinanceiro: string;
      function HasPermission: Boolean;
      function GetRichEditFromPopup: TRichEdit;
      procedure LoadObservations;
      procedure LoadPermissions;
      procedure SetFilters;
   public

      cd_informacao: Integer;
      nm_pessoa_contato: String;


      procedure preencheStatus(const ds_status_atual_contato : String); 
      function getRTF(): String;
      function GetAllObservations(const APersonCode: Cardinal;
         AKind: TObservationKind): AnsiString;
      class function HasObservations(const APersonCode: Cardinal;
         AKind: TObservationKind): Boolean; overload;
      class function HasObservations(const APersonCode: Cardinal): Boolean; overload;
      class procedure ClearObservations(const APersonCode: Cardinal);
      class procedure RegisterObservation(const APersonCode: Cardinal;
         const AKind: TObservationKind; const AContent: AnsiString);
      class procedure ShowObservations(const AOwner: TComponent;
         const APersonCode: Cardinal; const AKind: TObservationKind; const AFecharAposInserir : Boolean = false; const AObservacaoCreditoFinanceiro : String = '' );

   end;

var
   uObservacoesContatos: TuObservacoesContatos;

implementation

uses uUsuario;

const
   { Esta matriz contém as chaves das permissões para acesso para cada tipo de
     observação. As chaves são indexadas pelo tipo da observações.
     okFinancial: UMFinanceiro.Obs.Financeiro
     okRestrict: UMFinanceiro.Obs.Fin.Restrita
     okMatriculation: Academico.Obs.Matricula
   }
   PermissionsKeys: array [TObservationKind] of AnsiString = (
      'UMFinanceiro.Obs.Financeiro', 'UMFinanceiro.Obs.Fin.Restrita',
      'Academico.Obs.Matricula', 'Academico.Obs.Pedagogico', '0');

   { No banco de dados, os tipos de observações são identificados por uma sigla.
     Esta matriz usa os tipos de observação para indexar as suas siglas
     correspondentes:
     okFinancial: F
     okRestrict: R
     okMatriculation: M
     okPedagogical: P
   }
   ObsAcronyms: array [TObservationKind] of Char = ('F', 'R', 'M', 'P' , 'S' );

   { Esta matriz mapeia os filtros de observação de acordo com o tipo indexado.
     okFinancial: Sigla = F
     okRestrict: Sigla = R
     okMatriculation: Sigla = M
     okPedagogical: Sigla = P
   }
   ObsFilters: array [TObservationKind] of AnsiString = ('SG_TIPO = ''F''',
      'SG_TIPO = ''R''', 'SG_TIPO = ''M''', 'SG_TIPO = ''P''' , 'SG_TIPO=''S''');

{$R *.dfm}

procedure TuObservacoesContatos.btnAlterarClick(Sender: TObject);
begin
   qryObservacoes.Edit;
end;

procedure TuObservacoesContatos.btnCancelarClick(Sender: TObject);
begin
   qryObservacoes.Cancel;
   reNovaObs.Clear;
end;

procedure TuObservacoesContatos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TuObservacoesContatos.btnIncluirClick(Sender: TObject);
begin
   qryObservacoes.Insert;
   reNovaObs.SetFocus;
end;

procedure TuObservacoesContatos.btnSalvarClick(Sender: TObject);
var
   StrAux :String;
   S: TStream;
begin
   S := TMemoryStream.Create;

   if reNovaObs.Text <> '' then
   begin
      StrAux := reNovaObs.Text;
      reNovaObs.Text := FObservacaoCreditoFinanceiro + StrAux;

      qryObservacoescd_usuario_registrou.AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
      qryObservacoesDT_OBSERVACAO.AsDateTime := umdtRetorno.Date + StrToTime(ed_hora_retorno.Text);
      qryObservacoesds_status.AsString := cbStatus.Text ; 

     try
      reNovaObs.Lines.SaveToStream(S);
      S.Position := 0;
      qryObservacoesME_OBSERVACAO.AsString := TStringStream(S).DataString;
      finally
         S.Free;
      end;

      reNovaObs.Lines.SaveToFile('ArqRTF.rtf');
      TBlobField(qryObservacoes.FieldByName('me_observacao')).SaveToFile('ArqRTF.rtf');
      qryObservacoescd_informacao.AsInteger := cd_informacao;
      qryObservacoes.Post;

      qryAtualizaStatusPessoasInfo.ParamByName('ds_status').AsString := cbStatus.Text;
      qryAtualizaStatusPessoasInfo.ParamByName('cd_informacao').AsInteger := cd_informacao;
      qryAtualizaStatusPessoasInfo.ExecSQL();

      qryObservacoes.Refresh;
      qryObservacoes.Last;
  end;
end;

class procedure TuObservacoesContatos.ClearObservations(const APersonCode: Cardinal);
const
   SSQLClearObs = 'DELETE FROM UNI_OBSERVACOES WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement(SSQLClearObs);
   try
      Statement.SetLong(1, APersonCode);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TuObservacoesContatos.copyClick(Sender: TObject);
begin
   GetRichEditFromPopup.CopyToClipboard;
end;

procedure TuObservacoesContatos.CutClick(Sender: TObject);
begin
   GetRichEditFromPopup.CutToClipboard;
end;

procedure TuObservacoesContatos.deleteClick(Sender: TObject);
begin
   GetRichEditFromPopup.ClearSelection;
end;

procedure TuObservacoesContatos.dsObservacoesStateChange(Sender: TObject);
begin
   btnIncluir.Enabled   := qryObservacoes.State in [dsBrowse];
   btnSalvar.Enabled    := qryObservacoes.State in [dsInsert];
   btnCancelar.Enabled  := qryObservacoes.State in [dsInsert];
end;

procedure TuObservacoesContatos.unDoClick(Sender: TObject);
begin
   GetRichEditFromPopup.Undo;
end;

procedure TuObservacoesContatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   reObsHist.Clear;
   reNovaObs.Clear;
   btnSalvar.Enabled := False;
   qryObservacoes.Close;
end;

procedure TuObservacoesContatos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SPergunta = 'A observação não foi registrada. Deseja realmente sair?';
   SPerguntaCredito = 'A observação não foi registrada. Deseja realmente sair? Caso continue a alteração no crédito sera descartada. ';
   STitulo = 'Atenção';
   TipoMsg = MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO;
begin
   if not FFecharAposInserir then
   CanClose := (not btnSalvar.Enabled) or
      (MessageBox(Handle, PChar(SPergunta), PChar(STitulo), TipoMsg) = ID_YES)
   else
   CanClose := (not btnSalvar.Enabled) or
      (MessageBox(Handle, PChar(SPerguntaCredito), PChar(STitulo), TipoMsg) = ID_YES)
end;

procedure TuObservacoesContatos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if btnSalvar.Enabled then
         begin
            btnSalvar.Click;
         end;
      VK_F2:
         if btnIncluir.Enabled then
         begin
            btnIncluir.Click;
         end;
      Vk_F6:
         if btnCancelar.Enabled then
         begin
            btnCancelar.Click;
         end;
      Vk_F12:
         if btn_fechar.Enabled then
         begin
            btn_fechar.Click;
         end;
   end;
end;

procedure TuObservacoesContatos.FormShow(Sender: TObject);
CONST
   SQL_OBS_CONTATOS = ''
   + ' SELECT '
   + '   pio.cd_info_obs,   '
   + '   pio.cd_informacao, '
   + '   pio.cd_usuario_registrou,'
   + '   pio.me_observacao,'
   + '   pio.dt_observacao,'
   + '   pio.ds_status'
   + ' FROM '
   + ' pessoas_info_observacoes pio '
   + ' WHERE'
   + '   pio.cd_informacao = %s';

   SQL_STATUS_CONTATOS = ''
      +' SELECT '
      +'	   pi.cd_informacao, '
+      '      pi.ds_status '
      +' FROM '
      +'	pessoas_info pi '
      +' WHERE '
      +'   pi.cd_informacao = %s ';

var
   ds_filtro, ds_status_padrao : String;
   qryBuscaStatus : TUMZQuery;
begin
   reNovaObs.Clear;

   qryObservacoes.SQL.Text := SQL_OBS_CONTATOS;
   ds_filtro := IntToStr(cd_informacao);

   qryObservacoes.SQL.Text := Format(qryObservacoes.SQL.Text, [ds_filtro]);
         
   try
      qryObservacoes.Open;
      qryObservacoes.Last;

      ds_status_padrao := qryObservacoes.FieldByName('ds_status').AsString;

      // Se não tem ds_status da ultima observação(pessoas_info_obs)
      // Pega o ds_status da INFORMACAO em pessoas_info
      if ( qryObservacoes.IsEmpty ) then
      begin    
         DM.CriarConsulta(qryBuscaStatus);
         qryBuscaStatus.Close;
         qryBuscaStatus.SQL.Text := SQL_STATUS_CONTATOS;
         ds_filtro := IntToStr(cd_informacao);
         qryBuscaStatus.SQL.Text := Format(qryBuscaStatus.SQL.Text, [ds_filtro]);
         qryBuscaStatus.Open;
         qryBuscaStatus.Last;
         ds_status_padrao := qryBuscaStatus.FieldByName('ds_status').AsString;
         FreeAndNil(qryBuscaStatus);
      end;
      
      preencheStatus( ds_status_padrao );
      
      umdtRetorno.Date := DM.DataAtual();
      ed_hora_retorno.Text := FormatDateTime('hh:mm',Now);
   except
      //
   end;


end;


class function TuObservacoesContatos.HasObservations(const APersonCode: Cardinal;
  AKind: TObservationKind): Boolean;
begin
   if uObservacoesContatos = nil then
   begin
      Application.CreateForm(TuObservacoesContatos, uObservacoesContatos);
   end;
   
   uObservacoesContatos.FPersonCode := APersonCode;
   uObservacoesContatos.FKind := AKind;
   uObservacoesContatos.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := APersonCode;
   uObservacoesContatos.SetFilters;
   uObservacoesContatos.FShowAll := False;
   uObservacoesContatos.qryObservacoes.Open;
   
   Result := not uObservacoesContatos.qryObservacoes.IsEmpty;

   if not Result then
   begin
      uObservacoesContatos.reObsHist.Clear;
   end;
   
   uObservacoesContatos.btnSalvar.Enabled := False;
   uObservacoesContatos.qryObservacoes.Close;
end;

class function TuObservacoesContatos.HasObservations(
  const APersonCode: Cardinal): Boolean;
const
   SSQLFindObs = 'SELECT CD_OBSERVACAO FROM UNI_OBSERVACOES WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLFindObs);
   try
      Statement.SetLong(1, APersonCode);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         Result := ResultSet.Next;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;
end;

{ Verifica se o usuário possui permissão para acessar as observações do tipo
  requerido.
}
function TuObservacoesContatos.HasPermission: Boolean;
begin
   if PermissionsKeys[FKind] <> '0' then
      Result := DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[FKind], npAcesso, True)
   else
      Result := true
end;

{ Carrega todas as observações do aluno para exibir na caixa de texto
}
procedure TuObservacoesContatos.LoadObservations;
var
   qyUsuario: TUMZQuery;
   ds_status : String;
begin
   reObsHist.Clear;
   reObsHist.SelText := #13;

   if qryObservacoes.RecordCount > 0 then
   begin

      qryObservacoes.First;
      dm.CriarConsulta(qyUsuario);

      while not qryObservacoes.Eof do
      begin
         ds_status := 'Sem Status';
         qyUsuario.SQL.Text := ''
            + 'SELECT '
            + ' p.nm_pessoa '
            + ' FROM pessoas p '
            + ' WHERE '
            + ' p.cd_pessoa = ' + qryObservacoescd_usuario_registrou.AsString;
         qyUsuario.Open;
         reObsHist.SelStart := reObsHist.GetTextLen;
         reObsHist.SelLength := 0;
         reObsHist.SelText := Trim(qryObservacoesME_OBSERVACAO.AsString);
         reObsHist.SelText := #13;
         reObsHist.SelText := #13;
         reObsHist.SelText := AnsiUpperCase(qyUsuario.FieldByName('nm_pessoa').AsString);
         reObsHist.SelText := ' - ';
         reObsHist.SelText := qryObservacoesDT_OBSERVACAO.AsString;
         if ( qryObservacoesds_status.AsString <> '' ) then
         begin
             ds_status := qryObservacoesds_status.AsString;
         end;
         reObsHist.SelText := ' - Status: ' + ds_status;
         reObsHist.SelText := #13;
         reObsHist.SelText := '----------------------------------------------------';
         reObsHist.SelText := '----------------------------------------------------';
         reObsHist.SelText := #13;
         qryObservacoes.Next;
      end;
   end;   
   pnlTitulo.Caption := AnsiUpperCase(nm_pessoa_contato);
end;

{ Carrega todas as permissões de acesso às observações disponíveis para o
  usuário. O usuário somente visualizará as observações para as quais ele possui
  acesso. As permissões são carregadas num conjunto de permissões que será
  filtrado posteriormente para efetuar o filtro.
}
procedure TuObservacoesContatos.LoadPermissions;
begin
   FPermissions := [];
   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okFinancial], npAcesso,
      False) then
      Include(FPermissions, okFinancial);
   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okRestrict], npAcesso,
      False) then
      Include(FPermissions, okRestrict);
   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okMatriculation], npAcesso,
      False) then
      Include(FPermissions, okMatriculation);
   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okPedagogical], npAcesso,
      False) then
      Include(FPermissions, okPedagogical);
   Include(FPermissions, okSuplier);
end;

procedure TuObservacoesContatos.pasteClick(Sender: TObject);
begin
   GetRichEditFromPopup.PasteFromClipboard;
end;

procedure TuObservacoesContatos.qryObservacoesAfterOpen(DataSet: TDataSet);
begin
   LoadObservations;
end;

procedure TuObservacoesContatos.qryObservacoesAfterPost(DataSet: TDataSet);
begin
   reNovaObs.Clear;
end;

procedure TuObservacoesContatos.qryObservacoesAfterRefresh(DataSet: TDataSet);
begin
   LoadObservations;
end;

procedure TuObservacoesContatos.qryObservacoesBeforeRefresh(DataSet: TDataSet);
begin
   reObsHist.Clear;
end;

class procedure TuObservacoesContatos.RegisterObservation(const APersonCode: Cardinal;
  const AKind: TObservationKind; const AContent: AnsiString);
begin
   if uObservacoesContatos = nil then
   begin
      Application.CreateForm(TuObservacoesContatos, uObservacoesContatos);
   end;

   uObservacoesContatos.qryInserirObservacao.ParamByName('CD_PESSOA').AsInteger := APersonCode;
   uObservacoesContatos.qryInserirObservacao.ParamByName('CD_USUARIO').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
   uObservacoesContatos.qryInserirObservacao.ParamByName('DT_OBSERVACAO').AsDateTime := DM.DataAtual();
   uObservacoesContatos.qryInserirObservacao.ParamByName('ME_OBSERVACAO').AsString := AContent;
   uObservacoesContatos.qryInserirObservacao.ParamByName('SG_TIPO').AsString := ObsAcronyms[AKind];
   uObservacoesContatos.qryInserirObservacao.ParamByName('ME_OBSERVACAO_FORMATADO').AsString := AContent;

   uObservacoesContatos.qryInserirObservacao.ExecSQL;
end;

procedure TuObservacoesContatos.reNovaObs1Change(Sender: TObject);
begin
   btnSalvar.Enabled := Trim(reNovaObs.Lines.Text) <> EmptyStr;
end;

procedure TuObservacoesContatos.reNovaObsChange(Sender: TObject);
begin
   if (reNovaObs.Text <> '') AND NOT(qryObservacoes.State IN [dsInactive]) then
   begin
      qryObservacoes.Insert;
   end;
end;

procedure TuObservacoesContatos.richEditContextMenPopup(Sender: TObject);
var
   re: TRichEdit;
begin
   re := GetRichEditFromPopup;
end;

procedure TuObservacoesContatos.sbBibItalicoClick(Sender: TObject);
begin
   if sbBibItalico.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style + [fsItalic];
   end
   else
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsItalic];
   end;
end;

procedure TuObservacoesContatos.sbBibNegritoClick(Sender: TObject);
begin
   if sbBibNegrito.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style + [fsBold];
   end
   else
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsBold];
   end;
end;

procedure TuObservacoesContatos.sbVermelhoClick(Sender: TObject);
begin
   if sbVermelho.Down then
   begin
      reNovaObs.SelAttributes.Color := clRed;
   end
   else
   begin
      reNovaObs.SelAttributes.Color := clBlack;
   end;
end;

procedure TuObservacoesContatos.selectAllClick(Sender: TObject);
begin
   GetRichEditFromPopup.SelectAll;
end;

function TuObservacoesContatos.GetAllObservations(const APersonCode: Cardinal;
  AKind: TObservationKind): AnsiString;
begin
   if HasObservations(APersonCode, AKind) then
      Result := uObservacoesContatos.reObsHist.Text
   else
      Result := EmptyStr;
end;

function TuObservacoesContatos.GetRichEditFromPopup: TRichEdit;
begin
   result := TRichEdit(richEditContextMen.PopupComponent);
end;

function TuObservacoesContatos.getRTF: String;
var
  strStream: TStringStream;
begin
   strStream := TStringStream.Create('') ;
   try
     reNovaObs.PlainText := False;
     reNovaObs.Lines.SaveToStream(strStream) ;
     Result := strStream.DataString;
   finally
     strStream.Free
   end;
end;

{ Este método define o filtro que será utilizado para exibir as observações.
  Se foi habilitado para exibir as observações de todos os tipos, verifica quais
  permissões o usuário possui para montar o filtro, caso contrário, filtrará
  apenas para o tipo de observação sinalizado. 
}
procedure TuObservacoesContatos.SetFilters;
const
   OP = ' OR ';
var
   Filter: AnsiString;
begin
   Filter := EmptyStr;
   if FShowAll then
   begin
      if okFinancial in FPermissions then
         Filter := ObsFilters[okFinancial];
      if okRestrict in FPermissions then
      begin
         if Filter <> EmptyStr then
            Filter := Filter + OP;
         Filter := Filter + ObsFilters[okRestrict];
      end;
      if okMatriculation in FPermissions then
      begin
         if Filter <> EmptyStr then
            Filter := Filter + OP;
         Filter := Filter + ObsFilters[okMatriculation];
      end;
      if okPedagogical in FPermissions then
      begin
         if Filter <> EmptyStr then
            Filter := Filter + OP;
         Filter := Filter + ObsFilters[okPedagogical];
      end;
      if okSuplier in FPermissions then
      begin
         if Filter <> EmptyStr then
            Filter := Filter + OP;
         Filter := Filter + ObsFilters[okSuplier];
      end;
   end
   else
      Filter := ObsFilters[FKind];
   qryObservacoes.Filter := Filter;
end;

{ Exibe a tela para gerenciamento das observações do aluno.
}
class procedure TuObservacoesContatos.ShowObservations(const AOwner: TComponent;
   const APersonCode: Cardinal; const AKind: TObservationKind; const AFecharAposInserir : Boolean = false; const AObservacaoCreditoFinanceiro : String = ''  );
begin

   if uObservacoesContatos = nil then
   begin
      Application.CreateForm(TuObservacoesContatos, uObservacoesContatos);
   end;
   
   uObservacoesContatos.FPersonCode := APersonCode;
   uObservacoesContatos.FUserCode := DM.UsuarioLogado.Pessoa.Codigo;
   uObservacoesContatos.FKind := AKind;

   uObservacoesContatos.FShowAll := DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S';

   if uObservacoesContatos.HasPermission then
   begin

      uObservacoesContatos.LoadPermissions;
      uObservacoesContatos.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := APersonCode;
      uObservacoesContatos.SetFilters;
      uObservacoesContatos.qryObservacoes.Open;
      uObservacoesContatos.FFecharAposInserir := AFecharAposInserir;
      uObservacoesContatos.FObservacaoCreditoFinanceiro := AObservacaoCreditoFinanceiro;
      uObservacoesContatos.ShowModal;
   end;
end;

procedure TuObservacoesContatos.preencheStatus( const ds_status_atual_contato : String );
var
   qyStatus: TUMZQuery;
   indice,indiceSelecionado: Integer;
begin

   dm.CriarConsulta(qyStatus);
   qyStatus.SQL.Text := ''
      + ' SELECT '
      + '    s.codigo codigo, '
      + '    s.cd_modulo  cd_modulo, '
      + '    s.cd_situacao cd_situacao, '
      + '    s.ds_valor ds_valor'
      + ' FROM'
      + '    situacoes s '
      + ' WHERE'
      + '    cd_modulo = 1035 AND '
      + '    cd_auxiliar IN (1,99,100) '
      + ' ORDER BY '
      + '    ds_valor';
      
   qyStatus.Open;

   qyStatus.First;

   cbStatus.Clear;
   cbStatus.Items.Add('');
   
   indice := 1;
   while not (qyStatus.Eof) do
   begin
      if (ds_status_atual_contato = qyStatus.FieldByName('ds_valor').AsString )
      then
      begin
         indiceSelecionado :=  indice;
      end;
      
      cbStatus.Items.Add(qyStatus.FieldByName('ds_valor').asString);
      inc(indice);
      qyStatus.Next;
   end;

   cbStatus.ItemIndex := indiceSelecionado;


end;

procedure TuObservacoesContatos.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TuObservacoesContatos.sbBibSublinhadoClick(Sender: TObject);
begin
   if sbBibSublinhado.Down then
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style + [fsUnderline];
   end
   else
   begin
      reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsUnderline];
   end;
end;

end.
