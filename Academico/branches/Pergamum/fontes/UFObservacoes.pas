unit UFObservacoes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, uDM, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
   ImgList, ToolWin, ComCtrls, StdCtrls, Menus, ZDbcIntfs, UZDbcFuncs, Buttons,
   DBCtrls;

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

   TfObservacoes = class(TForm)
      qryObservacoes: TUMZQuery;
      qryObservacoesCD_OBSERVACAO: TLargeintField;
      qryObservacoesCD_PESSOA: TIntegerField;
      qryObservacoesCD_USUARIO: TIntegerField;
      qryObservacoesDT_OBSERVACAO: TDateTimeField;
      qryObservacoesME_OBSERVACAO: TMemoField;
      qryObservacoesSG_TIPO: TStringField;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      pnlTitulo: TPanel;
      pnlHistorico: TPanel;
      pnlNovaObs: TPanel;
      splSep1: TSplitter;
      reObsHist: TRichEdit;
      lblObsHist: TLabel;
      lblNovaObs: TLabel;
      qryUsuario: TUMZReadOnlyQuery;
      qryUsuarioCD_PESSOA: TIntegerField;
      qryUsuarioDS_LOGIN: TStringField;
      qryObservacoesDS_LOGIN: TStringField;
      dsObservacoes: TDataSource;
      qryPessoa: TUMZReadOnlyQuery;
      qryPessoaCD_PESSOA: TIntegerField;
      qryPessoaNM_PESSOA: TStringField;
      qryObservacoesNM_PESSOA: TStringField;
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
    qryObservacoesME_OBSERVACAO_FORMATADO: TMemoField;
    reNovaObs: TRichEdit;
    qryInserirObservacao: TUMZQuery;
    btnSair: TToolButton;
    procedure btnSairClick(Sender: TObject);
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
      function getRTF(): String;
      class function GetAllObservations(const APersonCode: Cardinal;
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
   fObservacoes: TfObservacoes;

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
      'UMFinanceiro.Obs.Financeiro',
      'UMFinanceiro.Obs.Fin.Restrita',
      'Academico.Obs.Matricula',
      'Academico.Obs.Pedagogico',
      'Academico.Obs.Fornecedeor'
   );

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

procedure TfObservacoes.btnAlterarClick(Sender: TObject);
begin
   qryObservacoes.Edit;
end;

procedure TfObservacoes.btnCancelarClick(Sender: TObject);
begin
   qryObservacoes.Cancel;
   reNovaObs.Clear;
end;

procedure TfObservacoes.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfObservacoes.btnIncluirClick(Sender: TObject);
begin
   qryObservacoes.Insert;
   reNovaObs.SetFocus;
end;

procedure TfObservacoes.btnSalvarClick(Sender: TObject);
var
   StrAux :String;
begin


   if not (FFecharAposInserir) then
   begin
      qryObservacoesCD_PESSOA.AsInteger := FPersonCode;
      qryObservacoesCD_USUARIO.AsInteger := FUserCode;
      qryObservacoesDT_OBSERVACAO.AsDateTime := DM.DataAtual();
      qryObservacoesSG_TIPO.AsString := ObsAcronyms[FKind];
      qryObservacoesME_OBSERVACAO.AsString := reNovaObs.Text;
      qryObservacoesME_OBSERVACAO_FORMATADO.AsString := getRTF();
      qryObservacoes.Post;
      qryObservacoes.Refresh;
      qryObservacoes.Last;
   end
   else
   begin
      if reNovaObs.Text <> '' then
      begin
         StrAux := reNovaObs.Text;
         reNovaObs.Text := FObservacaoCreditoFinanceiro + StrAux;

         qryObservacoesCD_PESSOA.AsInteger := FPersonCode;
         qryObservacoesCD_USUARIO.AsInteger := FUserCode;
         qryObservacoesDT_OBSERVACAO.AsDateTime := DM.DataAtual();
         qryObservacoesSG_TIPO.AsString := ObsAcronyms[FKind];
         qryObservacoesME_OBSERVACAO.AsString := FObservacaoCreditoFinanceiro + reNovaObs.Text;
         qryObservacoesME_OBSERVACAO_FORMATADO.AsString := getRTF();
         qryObservacoes.Post;
         qryObservacoes.Refresh;
         qryObservacoes.Last;
      end;
   end;

   if FFecharAposInserir then
   begin
      close;
   end;
   
end;

class procedure TfObservacoes.ClearObservations(const APersonCode: Cardinal);
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

procedure TfObservacoes.copyClick(Sender: TObject);
begin
   GetRichEditFromPopup.CopyToClipboard;
end;

procedure TfObservacoes.CutClick(Sender: TObject);
begin
   GetRichEditFromPopup.CutToClipboard;
end;

procedure TfObservacoes.deleteClick(Sender: TObject);
begin
   GetRichEditFromPopup.ClearSelection;
end;

procedure TfObservacoes.dsObservacoesStateChange(Sender: TObject);
begin
   btnIncluir.Enabled   := qryObservacoes.State in [dsBrowse];
   btnSalvar.Enabled    := qryObservacoes.State in [dsInsert];
   btnCancelar.Enabled  := qryObservacoes.State in [dsInsert];
end;

procedure TfObservacoes.unDoClick(Sender: TObject);
begin
   GetRichEditFromPopup.Undo;
end;

procedure TfObservacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   reObsHist.Clear;
   reNovaObs.Clear;
   btnSalvar.Enabled := False;
   qryObservacoes.Close;
   qryUsuario.Close;
   qryPessoa.Close;
end;

procedure TfObservacoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SPergunta = 'A observação não foi registrada. Deseja realmente sair?';
   SPerguntaCredito = 'A observação não foi registrada. Deseja realmente sair? Caso continue a alteração no crédito sera descartada. ';
   STitulo = 'Atenção';
   TipoMsg = MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO;
begin
   if not FFecharAposInserir then
   begin
      CanClose :=
         (not btnSalvar.Enabled) or
         (MessageBox(Handle, PChar(SPergunta), PChar(STitulo), TipoMsg) = ID_YES)
   end
   else
   begin
      CanClose :=
         (not btnSalvar.Enabled) or
         (MessageBox(Handle, PChar(SPerguntaCredito), PChar(STitulo), TipoMsg) = ID_YES)
   end;
end;

procedure TfObservacoes.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F12 :
         if btnSair.Enabled then
         begin
            btnSair.Click;
         end;
   end;
end;

procedure TfObservacoes.FormShow(Sender: TObject);
begin
   qryObservacoes.Last;
   reNovaObs.Clear;

   btnIncluir.Enabled := DM.UsuarioLogado.TemPermissao(
      FUserCode,
      PermissionsKeys[fObservacoes.FKind],
      npIncluir,
      false
   );

//   btnSalvar.Enabled  := DM.UsuarioLogado.TemPermissao(
//      FUserCode,
//      PermissionsKeys[fObservacoes.FKind],
//      npIncluir,
//      false
//   );
//
//   btnCancelar.Enabled := DM.UsuarioLogado.TemPermissao(
//      FUserCode,
//      PermissionsKeys[fObservacoes.FKind],
//      npIncluir,
//      false
//   );

   btnIncluir.Enabled   := qryObservacoes.State in [dsBrowse];
   btnSalvar.Enabled    := qryObservacoes.State in [dsInsert];
   btnCancelar.Enabled  := qryObservacoes.State in [dsInsert];
end;

class function TfObservacoes.GetAllObservations(const APersonCode: Cardinal;
  AKind: TObservationKind): AnsiString;
begin
   if HasObservations(APersonCode, AKind) then
      Result := fObservacoes.reObsHist.Text
   else
      Result := EmptyStr;
end;

class function TfObservacoes.HasObservations(const APersonCode: Cardinal;
  AKind: TObservationKind): Boolean;
begin
   if fObservacoes = nil then
   begin
      Application.CreateForm(TfObservacoes, fObservacoes);
   end;
   
   fObservacoes.FPersonCode := APersonCode;
   fObservacoes.FKind := AKind;
   fObservacoes.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := APersonCode;
   fObservacoes.SetFilters;
   fObservacoes.FShowAll := False;
   fObservacoes.qryObservacoes.Open;
   
   Result := not fObservacoes.qryObservacoes.IsEmpty;

   if not Result then
   begin
      fObservacoes.reObsHist.Clear;
   end;
   
   fObservacoes.btnSalvar.Enabled := False;
   fObservacoes.qryObservacoes.Close;
end;

class function TfObservacoes.HasObservations(
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
function TfObservacoes.HasPermission: Boolean;
begin
   if PermissionsKeys[FKind] <> '0' then
      Result := DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[FKind], npAcesso, True)
   else
      Result := true
end;

{ Carrega todas as observações do aluno para exibir na caixa de texto
}
procedure TfObservacoes.LoadObservations;
begin
   reObsHist.Clear;
   
   reObsHist.SelText := #13;

   while not qryObservacoes.Eof do
   begin
      reObsHist.SelStart := reObsHist.GetTextLen;
      reObsHist.SelLength := 0;
      reObsHist.SelText := qryObservacoesME_OBSERVACAO_FORMATADO.AsString;
      reObsHist.SelText := #13;
      reObsHist.SelText := #13;
      reObsHist.SelText := AnsiUpperCase(qryUsuarioDS_LOGIN.AsString);
      reObsHist.SelText := ' - ';
      reObsHist.SelText := qryObservacoesDT_OBSERVACAO.AsString;
      reObsHist.SelText := #13;
      reObsHist.SelText := '----------------------------------------------------';
      reObsHist.SelText := '----------------------------------------------------';
      reObsHist.SelText := #13;
      qryObservacoes.Next;
   end;
   
   pnlTitulo.Caption := AnsiUpperCase(qryPessoaNM_PESSOA.AsString);

end;

{ Carrega todas as permissões de acesso às observações disponíveis para o
  usuário. O usuário somente visualizará as observações para as quais ele possui
  acesso. As permissões são carregadas num conjunto de permissões que será
  filtrado posteriormente para efetuar o filtro.
}
procedure TfObservacoes.LoadPermissions;
begin
   FPermissions := [];
   
   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okFinancial], npAcesso, False) then
   begin
      Include(FPermissions, okFinancial);
   end;

   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okRestrict], npAcesso, False) then
   begin
      Include(FPermissions, okRestrict);
   end;

   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okMatriculation], npAcesso, False) then
   begin
      Include(FPermissions, okMatriculation);
   end;

   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okPedagogical], npAcesso, False) then
   begin
      Include(FPermissions, okPedagogical);
   end;
   
   Include(FPermissions, okSuplier);
end;

procedure TfObservacoes.pasteClick(Sender: TObject);
begin
   GetRichEditFromPopup.PasteFromClipboard;
end;

procedure TfObservacoes.qryObservacoesAfterOpen(DataSet: TDataSet);
begin
   LoadObservations;
end;

procedure TfObservacoes.qryObservacoesAfterPost(DataSet: TDataSet);
begin
   reNovaObs.Clear;
end;

procedure TfObservacoes.qryObservacoesAfterRefresh(DataSet: TDataSet);
begin
   LoadObservations;
end;

procedure TfObservacoes.qryObservacoesBeforeRefresh(DataSet: TDataSet);
begin
   reObsHist.Clear;
end;

class procedure TfObservacoes.RegisterObservation(const APersonCode: Cardinal;
  const AKind: TObservationKind; const AContent: AnsiString);
begin
   if fObservacoes = nil then
   begin
      Application.CreateForm(TfObservacoes, fObservacoes);
   end;

   fObservacoes.qryInserirObservacao.ParamByName('CD_PESSOA').AsInteger := APersonCode;
   fObservacoes.qryInserirObservacao.ParamByName('CD_USUARIO').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
   fObservacoes.qryInserirObservacao.ParamByName('DT_OBSERVACAO').AsDateTime := DM.DataAtual();
   fObservacoes.qryInserirObservacao.ParamByName('ME_OBSERVACAO').AsString := AContent;
   fObservacoes.qryInserirObservacao.ParamByName('SG_TIPO').AsString := ObsAcronyms[AKind];
   fObservacoes.qryInserirObservacao.ParamByName('ME_OBSERVACAO_FORMATADO').AsString := AContent;

   fObservacoes.qryInserirObservacao.ExecSQL;
end;

procedure TfObservacoes.reNovaObs1Change(Sender: TObject);
begin
   btnSalvar.Enabled := Trim(reNovaObs.Lines.Text) <> EmptyStr;
end;

procedure TfObservacoes.reNovaObsChange(Sender: TObject);
begin
   if ( DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[fObservacoes.FKind], npIncluir, false) )
   then
   begin
      if (reNovaObs.Text <> '') AND NOT(qryObservacoes.State IN [dsInactive]) then
      begin
         qryObservacoes.Insert;
      end;
   end;
end;

procedure TfObservacoes.richEditContextMenPopup(Sender: TObject);
var
   re: TRichEdit;
begin
   re := GetRichEditFromPopup;
end;

procedure TfObservacoes.sbBibItalicoClick(Sender: TObject);
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

procedure TfObservacoes.sbBibNegritoClick(Sender: TObject);
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

procedure TfObservacoes.sbVermelhoClick(Sender: TObject);
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

procedure TfObservacoes.selectAllClick(Sender: TObject);
begin
   GetRichEditFromPopup.SelectAll;
end;

function TfObservacoes.GetRichEditFromPopup: TRichEdit;
begin
   result := TRichEdit(richEditContextMen.PopupComponent);
end;

function TfObservacoes.getRTF: String;
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
procedure TfObservacoes.SetFilters;
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
class procedure TfObservacoes.ShowObservations(const AOwner: TComponent;
   const APersonCode: Cardinal; const AKind: TObservationKind; const AFecharAposInserir : Boolean = false; const AObservacaoCreditoFinanceiro : String = ''  );
begin

   if fObservacoes = nil then
   begin
      Application.CreateForm(TfObservacoes, fObservacoes);
   end;
   
   fObservacoes.FPersonCode := APersonCode;
   fObservacoes.FUserCode := DM.UsuarioLogado.Pessoa.Codigo;
   fObservacoes.FKind := AKind;

   fObservacoes.FShowAll := DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S';

   if fObservacoes.HasPermission then
   begin

      fObservacoes.LoadPermissions;
      fObservacoes.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := APersonCode;
      fObservacoes.SetFilters;
      fObservacoes.qryObservacoes.Open;
      fObservacoes.qryUsuario.Open;
      fObservacoes.qryPessoa.Open;
      fObservacoes.FFecharAposInserir := AFecharAposInserir;
      fObservacoes.FObservacaoCreditoFinanceiro := AObservacaoCreditoFinanceiro;
      fObservacoes.ShowModal;
   end;
end;

procedure TfObservacoes.btnSairClick(Sender: TObject);
begin
  close();
end;

procedure TfObservacoes.sbBibSublinhadoClick(Sender: TObject);
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
