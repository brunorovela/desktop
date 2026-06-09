unit UFObservacoes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, uDM, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ExtCtrls,
   ImgList, ToolWin, ComCtrls, StdCtrls, Menus, ZDbcIntfs, UZDbcFuncs, Buttons,
   DBCtrls,DateUtils, regeXPR;

type
   { Esta enumeração define os tipos de observações que são possíveis registrar.
     okFinancial: Observações financeiras
     okRestrict: Observações financeiras restritas
     okMatriculation: Observações referentes à matrícula
     okPedagogical: Observações pedagógicas
     okEquivalencia: Observações da equivalencia de disciplinas
   }
   TObservationKind = (
      okFinancial,
      okRestrict,
      okMatriculation,
      okPedagogical,
      okSuplier,
      okEquivalencia,
      okTurmasProfessores
   );

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
    procedure FormCreate(Sender: TObject);
    procedure reObsHistClick(Sender: TObject);
    procedure reObsHistMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
      FObservacaoCreditoFinanceiro,  paramDias : string;
      FHasPermissao: Boolean;
      function HasPermission: Boolean;
      function GetRichEditFromPopup: TRichEdit;
      procedure LoadObservations;
      procedure LoadPermissions;
      procedure SetFilters;
      function GetWordFromCoordinates(RE: TRichEdit; x,y: Integer): string;
   public
      function getRTF(): String;
      class function GetAllObservations(const APersonCode: Cardinal;
         AKind: TObservationKind): AnsiString;
      class function HasObservations(const APersonCode: Cardinal;
         AKind: TObservationKind): Boolean; overload;
      class function HasObservations(const APersonCode: Cardinal): Boolean; overload;
      class procedure ClearObservations(const APersonCode: Cardinal);
      class procedure RegisterObservation(const APersonCode: Cardinal;
         const AKind: TObservationKind; const AContent: AnsiString); overload;
      class procedure RegisterObservation(const APersonCode: Cardinal;
         const AKind: TObservationKind; const AContent, ARTF: AnsiString); overload;
      class procedure ShowObservations(const AOwner: TComponent;
         const APersonCode: Cardinal; const AKind: TObservationKind; const AFecharAposInserir : Boolean = false; const AObservacaoCreditoFinanceiro : String = '' );
      class procedure VerificaTipoObservacoes(); overload;
   end;

var
   fObservacoes: TfObservacoes;

implementation

uses uUsuario, uDMDiario;

const
   { Esta matriz contém as chaves das permissões para acesso para cada tipo de
     observação. As chaves são indexadas pelo tipo da observações.
     okFinancial: UMFinanceiro.Obs.Financeiro
     okRestrict: UMFinanceiro.Obs.Fin.Restrita
     okMatriculation: Academico.Obs.Matricula
     okTurmasProfessores : Academico.Obs.TurmasProfessores
   }
   PermissionsKeys: array [TObservationKind] of AnsiString = (
      'UMFinanceiro.Obs.Financeiro',
      'UMFinanceiro.Obs.Fin.Restrita',
      'Academico.Obs.Matricula',
      'Academico.Obs.Pedagogico',
      'Academico.Obs.Fornecedeor',
      'Academico.Obs.Equivalencia',
      'Academico.Obs.TurmasProfessores'
   );

   
   { No banco de dados, os tipos de observações são identificados por uma sigla.
     Esta matriz usa os tipos de observação para indexar as suas siglas
     correspondentes:
     okFinancial: F
     okRestrict: R
     okMatriculation: M
     okPedagogical: P
     okEquivalencia: E
     okTurmasProfessores : T
   }
   ObsAcronyms: array [TObservationKind] of Char = (
      'F',
      'R',
      'M',
      'P' ,
      'S',
      'E',
      'T'
   );

   { Esta matriz mapeia os filtros de observação de acordo com o tipo indexado.
     okFinancial: Sigla = F
     okRestrict: Sigla = R
     okMatriculation: Sigla = M
     okPedagogical: Sigla = P
     okEquivalencia: Sigla = E
     okTurmasProfessores: Sigla = T
   }
   ObsFilters: array [TObservationKind] of AnsiString = (
      'SG_TIPO = ''F''' ,
      'SG_TIPO = ''R''' ,
      'SG_TIPO = ''M''' ,
      'SG_TIPO = ''P''' ,
      'SG_TIPO = ''S''' ,
      'SG_TIPO = ''E''' ,
      'SG_TIPO = ''T'''
   );

{$R *.dfm}

procedure TfObservacoes.btnAlterarClick(Sender: TObject);
begin
   qryObservacoes.Edit;
end;

procedure TfObservacoes.btnCancelarClick(Sender: TObject);
begin
   reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsBold];
   reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsItalic];
   reNovaObs.SelAttributes.Color := clBlack;
   reNovaObs.SelAttributes.Style := reNovaObs.SelAttributes.Style - [fsUnderline];
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
   msgObservacao :String;
begin
   // Insert para os professores
   if ( FKind = okTurmasProfessores ) AND
      not ( qryObservacoes.State in [ dsEdit ] )
   then
   begin
      //Insere
      fObservacoes.qryInserirObservacao.ParamByName('CD_USUARIO').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
      fObservacoes.qryInserirObservacao.ParamByName('DT_OBSERVACAO').AsDateTime := DM.DataAtual();
      fObservacoes.qryInserirObservacao.ParamByName('ME_OBSERVACAO').AsString := reNovaObs.Text;
      fObservacoes.qryInserirObservacao.ParamByName('SG_TIPO').AsString := ObsAcronyms[FKind];
      fObservacoes.qryInserirObservacao.ParamByName('ME_OBSERVACAO_FORMATADO').AsString := getRTF();;
      fObservacoes.qryInserirObservacao.ParamByName('ANOSEMESTRE').AsInteger  := DMDiario.qTurmasANOSEMESTRE.AsInteger;
      fObservacoes.qryInserirObservacao.ParamByName('CD_TURMA').AsString := DMDiario.qTurmasTURMA.AsString;
      fObservacoes.qryInserirObservacao.ParamByName('CD_DISCIPLINA').AsInteger := DMDiario.qTurmasDISCIPLINA.AsInteger;
      fObservacoes.qryInserirObservacao.ParamByName('NR_ETAPA').AsInteger := DMDiario.qTurmasBIMESTRE.AsInteger;

      fObservacoes.qryInserirObservacao.ExecSQL;

      btnCancelarClick(nil);
      fObservacoes.qryObservacoes.Close;
      fObservacoes.qryObservacoes.Open;
      Exit;
   end;


   if (FFecharAposInserir) AND (qryObservacoes.State = dsInsert) then
   begin
      //Se for vazio sai fora
      if reNovaObs.Text = '' then
      begin
         close;
      end;

      //Caso não substitui o texto
      reNovaObs.Text := FObservacaoCreditoFinanceiro + reNovaObs.Text;
   end;

   if qryObservacoes.State = dsInsert then
   begin
      //Insere
      qryObservacoesCD_PESSOA.AsInteger := FPersonCode;
      qryObservacoesCD_USUARIO.AsInteger := FUserCode;
      qryObservacoesDT_OBSERVACAO.AsDateTime := DM.DataAtual();
      qryObservacoesSG_TIPO.AsString := ObsAcronyms[FKind];
   end;
   
   if qryObservacoes.State = dsEdit then
   begin
      msgObservacao :=
         'Alteração de observação da pessoa, de:'
         + qryObservacoesME_OBSERVACAO.AsString
         + ' para: '
         + reNovaObs.Text;
         
      DM.setLog(
         1006,
         'Alteracao',
         'observacao;' + qryObservacoesCD_OBSERVACAO.AsString,
         dm.UsuarioLogado.ColigadaLogada,
         msgObservacao
      );
   end;

   qryObservacoesME_OBSERVACAO.AsString := reNovaObs.Text;
   qryObservacoesME_OBSERVACAO_FORMATADO.AsString := getRTF();
   qryObservacoes.Post;
   qryObservacoes.Refresh;

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
   btnSalvar.Enabled    := qryObservacoes.State in [dsInsert,dsEdit];
   btnCancelar.Enabled  := qryObservacoes.State in [dsInsert,dsEdit];
end;

procedure TfObservacoes.unDoClick(Sender: TObject);
begin
   GetRichEditFromPopup.Undo;
end;

class procedure TfObservacoes.VerificaTipoObservacoes;
CONST

   BUSCA_OBS =  ' SELECT '
      + '   CD_OBSERVACAO, '
      + '   CD_PESSOA, '
      + '   CD_USUARIO , '
      + '   DT_OBSERVACAO, '
      + '   ME_OBSERVACAO, '
      + '   SG_TIPO, '
      + '   ME_OBSERVACAO_FORMATADO '
      + 'FROM '
      + '   UNI_OBSERVACOES '
      + 'WHERE '
      + '   CD_PESSOA = :CD_PESSOA ' ;
            
   INSERIR_OBS = ' INSERT INTO '
      + '  UNI_OBSERVACOES ( '
      + '    CD_PESSOA, '
      + '    CD_USUARIO, '
      + '    DT_OBSERVACAO, '
      + '    ME_OBSERVACAO, '
      + '    SG_TIPO, '
      + '    ME_OBSERVACAO_FORMATADO '
      + '  ) '
      + '  VALUES ( '
      + '    :CD_PESSOA, '
      + '    :CD_USUARIO, '
      + '    :DT_OBSERVACAO, '
      + '    :ME_OBSERVACAO, '
      + '    :SG_TIPO, '
      + '    :ME_OBSERVACAO_FORMATADO '
      + '  ) ' ;

  BUSCA_OBS_PROFESSORES =
        ' SELECT '
      + '    CD_OBSERVACAO, '
      + '    CD_PESSOA , '
      + '    CD_USUARIO , '
      + '    DT_OBSERVACAO, '
      + '    ME_OBSERVACAO, '
      + '    SG_TIPO, '
      + '    ANOSEMESTRE, '
      + '    CD_TURMA, '
      + '    CD_DISCIPLINA, '
      + '    NR_ETAPA, '
      + '    ME_OBSERVACAO_FORMATADO '
      + ' FROM '
      + '    uni_observacoes_professores '
      + ' WHERE '
      +  '  ANOSEMESTRE = :ANOSEMESTRE '
      + ' AND CD_TURMA = :CD_TURMA '
      + ' AND CD_DISCIPLINA = :CD_DISCIPLINA '
      + ' AND NR_ETAPA = :NR_ETAPA  ';
      
   INSERIR_OBS_PROFESSORES =
       ' INSERT INTO '
      + '   uni_observacoes_professores ( '
      + '      CD_USUARIO, '
      + '      ANOSEMESTRE, '
      + '      CD_TURMA, '
      + '      CD_DISCIPLINA, '
      + '      NR_ETAPA, '
      + '      DT_OBSERVACAO, '
      + '      SG_TIPO, '
      + '      ME_OBSERVACAO, '
      + '      ME_OBSERVACAO_FORMATADO '
      + '   ) '
      + '   VALUES ( '
      + '      :CD_USUARIO, '
      + '      :ANOSEMESTRE, '
      + '      :CD_TURMA, '
      + '      :CD_DISCIPLINA, '
      + '      :NR_ETAPA, '
      + '      :DT_OBSERVACAO, '
      + '      :SG_TIPO, '
      + '      :ME_OBSERVACAO, '
      + '      :ME_OBSERVACAO_FORMATADO '
      + '   ) ';
begin

   fObservacoes.qryObservacoes.SQL.Clear();
   fObservacoes.qryInserirObservacao.SQL.Clear();
   fObservacoes.qryObservacoes.SQL.Text := BUSCA_OBS;
   fObservacoes.qryInserirObservacao.SQL.Text := INSERIR_OBS;

   {
      Se for do tipo okTurmasProfessores, então altera as consultas para buscar
      da tabela de uni_observacoes_professores
   }

   if ( fObservacoes.FKind = okTurmasProfessores ) then
   begin
      fObservacoes.qryObservacoes.SQL.Clear();
      fObservacoes.qryInserirObservacao.SQL.Clear();
      fObservacoes.qryObservacoes.SQL.Text := BUSCA_OBS_PROFESSORES;
      fObservacoes.qryInserirObservacao.SQL.Text := INSERIR_OBS_PROFESSORES;

      fObservacoes.qryObservacoes.ParamByName('ANOSEMESTRE').AsInteger := DMDiario.qTurmasANOSEMESTRE.AsInteger;
      fObservacoes.qryObservacoes.ParamByName('CD_TURMA').AsString := DMDiario.qTurmasTURMA.AsString;
      fObservacoes.qryObservacoes.ParamByName('CD_DISCIPLINA').AsInteger := DMDiario.qTurmasDISCIPLINA.AsInteger;
      fObservacoes.qryObservacoes.ParamByName('NR_ETAPA').AsInteger := DMDiario.qTurmasBIMESTRE.AsInteger;
   end;
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

procedure TfObservacoes.FormCreate(Sender: TObject);
begin
   fObservacoes.VerificaTipoObservacoes();
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

   paramDias := Dm.variavel_parametro('nr_dias_altera_observacao');

   btnIncluir.Enabled   := qryObservacoes.State in [dsBrowse];
   btnSalvar.Enabled    := qryObservacoes.State in [dsInsert,dsEdit];
   btnCancelar.Enabled  := qryObservacoes.State in [dsInsert,dsEdit];
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

   fObservacoes.VerificaTipoObservacoes();

   if ( fObservacoes.FKind <> okTurmasProfessores ) then
   begin
      fObservacoes.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := APersonCode;
   end;

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
var
   textoEditar :String;
begin
   reObsHist.Clear;

   reObsHist.SelText := #13;

   qryObservacoes.First;

   paramDias := Dm.variavel_parametro('nr_dias_altera_observacao');

   while not qryObservacoes.Eof do
   begin


      
      textoEditar := '';
      if ( StrToInt(paramDias) > 0 ) and ( qryObservacoesCD_USUARIO.AsInteger = DM.GetUsuarioLogado.Pessoa.Codigo  ) then
      begin
         {
            Deixamos o código da observação oculto para o usuário.
            Para isso utilizamos na string abaixo o comando -> \v
            Tudo que vier após esse comando estará oculto para visualização
            Para que texto volte a ser impresso, utilizamos o comando -> \v0

            Depois, conseguimos recuperar o código da observação clicada

            Utilizamos -> $$ como identificador para localizar o codigo da observacao
         }
         textoEditar :=
            '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcharset0 Tahoma;}{\f1\fnil Tahoma;}}'+
            '{\colortbl ;\red0\green0\blue255;}' +
            '\viewkind4\uc1\pard\cf1\ul\b\f0\fs16 EDITAR\v$$' + qryObservacoesCD_OBSERVACAO.AsString + '$$ \v0 \cf0\ulnone\b0\f1\par }';
      end;

      reObsHist.SelStart := reObsHist.GetTextLen;
      reObsHist.SelLength := 0;
      reObsHist.SelText := qryObservacoesME_OBSERVACAO_FORMATADO.AsString;
      reObsHist.SelText := #13;
      reObsHist.SelText := #13;
      reObsHist.SelText := AnsiUpperCase(qryUsuarioDS_LOGIN.AsString);
      reObsHist.SelText := ' - ';
      reObsHist.SelText := qryObservacoesDT_OBSERVACAO.AsString;
      if ( Length(textoEditar) > 0 ) then
      begin
         reObsHist.SelText := ' - ';
         reObsHist.SelText := textoEditar;
      end;
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

   if DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[okEquivalencia], npAcesso, False) then
   begin
      Include(FPermissions, okEquivalencia);
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
  const AKind: TObservationKind; const AContent, ARTF: AnsiString);
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
   fObservacoes.qryInserirObservacao.ParamByName('ME_OBSERVACAO_FORMATADO').AsString := ARTF;

   fObservacoes.qryInserirObservacao.ExecSQL;
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
   if FHasPermissao then
   begin
      if (Trim(reNovaObs.Text) <> '') and not (qryObservacoes.State in dsEditModes) then
      begin
         qryObservacoes.Insert;
      end;
   end;
end;

procedure TfObservacoes.reObsHistClick(Sender: TObject);
var
   CursorPoint: TPoint;
   strBusca, strAtual, ds_codigo_obs : String;
   nrDias, CharIndex, I:Integer;
   expressao : TRegeXPR;
begin
   GetCursorPos(CursorPoint);
   CursorPoint := reObsHist.ScreenToClient(CursorPoint);

   strAtual  := GetWordFromCoordinates(
      reObsHist,
      CursorPoint.X,
      CursorPoint.Y
   );

   expressao := TRegeXPR.Create();

   expressao.Expression := '\$\$[0-9]+\$\$';

   expressao.ModifierM := True;
   expressao.ModifierS := False;

   strAtual := StringReplace(
      strAtual,
      'EDITAR',
      '',
      [rfReplaceAll, rfIgnoreCase]
   );

   ds_codigo_obs := '';
   if( expressao.Exec( strAtual ) ) then
   begin
      ds_codigo_obs := System.Copy(
         strAtual,
         expressao.MatchPos[0],
         expressao.MatchLen[0]
      );

      ds_codigo_obs := StringReplace(
         ds_codigo_obs,
         '$$',
         '',
         [rfReplaceAll, rfIgnoreCase]
      );
   end;
   
   qryObservacoes.First;
   while not qryObservacoes.Eof do
   begin

      if ds_codigo_obs = qryObservacoesCD_OBSERVACAO.AsString then
      begin
         if not ( DM.UsuarioLogado.TemPermissao(FUserCode, PermissionsKeys[fObservacoes.FKind], npAlterar, false) ) then
         begin
            exit;
         end;

         //Só pode editar observações feitas por ele
         if not (DM.UsuarioLogado.Pessoa.Codigo = qryObservacoesCD_USUARIO.AsInteger) then
         begin
            MessageBox(Handle, 'Só é possivel editar observações que você cadastrou.', 'Atenção', MB_OK);
            exit;
         end;

         nrDias := 0;
         if(paramDias <> '') then
         begin
            nrDias := strtoint(paramDias);
         end;

         if(DaysBetween(strtodate(datetostr(qryObservacoesDT_OBSERVACAO.AsDateTime)),strtodate(datetostr(dm.DataAtual))) > nrDias) then
         begin
            MessageBox(Handle, 'Número de dias máximo para alterar a observação excedido.', 'Atenção', MB_OK);
            exit;
         end;

         //Edita e seta o texto do registro
         qryObservacoes.Edit;
         reNovaObs.Text := qryObservacoesME_OBSERVACAO_FORMATADO.AsString;

         break;
      end;
      
      reNovaObs.Clear;
      qryObservacoes.Next;
   end;

end;

procedure TfObservacoes.reObsHistMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   i,j: Integer;
begin
   {
      i := reObsHist.SelStart;
      while ((reObsHist.SelText[i] <> ' ') and (reObsHist.SelText[i] <> #13)) do Dec(i);

      j:=i+1;

      IF (copy(reObsHist.SelText,j,7) = 'http://') then
      begin
         while ((reObsHist.SelText[j] <> ' ') and (reObsHist.SelText[j] <> #13)) do Inc(j);
         reNovaObs.Text := copy(reObsHist.SelText,i+1,j-i-1);
      end;
  }
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

function TfObservacoes.GetWordFromCoordinates(RE: TRichEdit; x,
  y: Integer): string;
var
   CharIndex, i,l: Integer;
   text: String;
   Delimiters: Set of Char;
   P: TPoint;
begin
   Delimiters:=[#32, #10, #13];
   P:=Point(X, Y);

   // Get complete RE text:
   text:=RE.Text; l:=Length(text); if l<1 then Exit;

   // What is the index of the char at this coordinates?
   CharIndex:=RE.Perform(EM_CHARFROMPOS, 0, Integer(@P))+1;

   // Grab all chars to the left:
   i:=CharIndex;
   repeat
      if text[i] in Delimiters then Break;
      Result:=text[i]+Result; Dec(i);
   until (i<1);

   // Grab all chars to the right:
   i:=CharIndex+1;
   repeat
      if text[i] in Delimiters then Break;
      Result:=Result+text[i]; Inc(i);
   until (i>l);
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

{ Exibe a tela para gerenciamento das observações Registradas.
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
   fObservacoes.FHasPermissao := DM.UsuarioLogado.TemPermissao(
      fObservacoes.FUserCode, PermissionsKeys[fObservacoes.FKind], npIncluir,
      False);

   if fObservacoes.FKind <> okTurmasProfessores then
   begin
      fObservacoes.FShowAll := DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S';
   end;  

   if fObservacoes.HasPermission then
   begin

      fObservacoes.LoadPermissions;

      fObservacoes.VerificaTipoObservacoes();

      if fObservacoes.FKind <> okTurmasProfessores then
      begin
         fObservacoes.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := APersonCode;
      end;

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
