unit uContasPagar_Movimentacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, DBCtrls,
  ZSqlUpdate;

type
  Tfrm_ContasPagar_Movimentacoes = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    srcMovimentacoes: TDataSource;
    qyMovimentacoes: TUMZQuery;
    sbObservacao: TSpeedButton;
    updMovimentacoes: TZUpdateSQL;
    qyMovimentacoescd_titulo: TIntegerField;
    qyMovimentacoesnr_sequencia: TIntegerField;
    qyMovimentacoesdt_movimento: TDateTimeField;
    qyMovimentacoesvl_entrada: TFloatField;
    qyMovimentacoesvl_saida: TFloatField;
    qyMovimentacoesvl_multa: TFloatField;
    qyMovimentacoesvl_juros: TFloatField;
    qyMovimentacoesvl_desconto: TFloatField;
    qyMovimentacoesvl_liquido: TFloatField;
    qyMovimentacoesds_observacao: TMemoField;
    sbFechar: TSpeedButton;
    pmLog: TPopupMenu;
    qyMovimentacoesds_acao: TStringField;
    qyMovimentacoescd_coligada: TSmallintField;
    pgOpcoes: TPageControl;
    tsMovimentacao: TTabSheet;
    tsApropriacao: TTabSheet;
    grd: TDBGrid;
    DBGrid1: TDBGrid;
    srcApropriacoes: TDataSource;
    qyApropriacoes: TUMZQuery;
    qyApropriacoesds_conta: TStringField;
    qyApropriacoesds_centro: TStringField;
    qyApropriacoesvl_movimento: TFloatField;
    qyMovimentacoescd_usuario: TIntegerField;
    qyMovimentacoesUSUARIO: TStringField;
    qyMovimentacoesdt_pagamento: TDateTimeField;
    btnCancelar: TSpeedButton;
    qyMovimentacoescd_tipo_acao: TSmallintField;
    qyMovimentacoescd_movimento_te: TLargeintField;
    qyMovimentacoescd_acao: TLargeintField;
    tsEstorno: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblUsuario: TLabel;
    dtBaixa: TDBText;
    dtEstorno: TDBText;
    cdUsuario: TDBText;
    qryEstorno: TUMZQuery;
    qryEstornonm_pessoa: TStringField;
    qryEstornodt_baixa: TDateTimeField;
    qryEstornodt_estorno: TDateTimeField;
    qryEstornods_estorno: TMemoField;
    qryEstornods_caixa: TStringField;
    dsEstorno: TDataSource;
    lblCaixa: TLabel;
    lblDesc: TLabel;
    qyApropriacoesvl_apropriacao_parcela: TFloatField;
    qyMovimentacoescd_origem: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure pgOpcoesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbObservacaoClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
  private
    function getValorAbatimentos(cdColigada, cdTitulo, cdTipoAcao: Integer): Currency;
  public
    flgSearch : Boolean;
    Atualizar : Boolean;
    cd_titulo_principal : string;
    { Public declarations }
  end;

var
  frm_ContasPagar_Movimentacoes: Tfrm_ContasPagar_Movimentacoes;

implementation

uses Main, uDM, uRegistrarObservacoes, uUsuario;

{$R *.DFM}

function Tfrm_ContasPagar_Movimentacoes.getValorAbatimentos(cdColigada,
  cdTitulo, cdTipoAcao: Integer): Currency;
const
   SQL_BUSCA_ABATIMENTOS =
      '   SELECT '+
      '      SUM(m.vl_saida) abatimentos '+
      '   FROM '+
      '      fin_mov_cp m '+
      '   INNER JOIN fin_acoes_movimento tp ON (tp.cd_acao = m.cd_acao) '+
      '   LEFT JOIN usuarios u ON (m.cd_usuario = u.codigo) '+
      '   LEFT JOIN pessoas p ON (m.cd_usuario = p.cd_pessoa) '+
      '   WHERE '+
      '      cd_titulo = :cd_titulo '+
      '      AND cd_coligada = :cd_coligada '+
      '      AND tp.cd_origem = 2 '+
      '      AND tp.cd_tipo_acao = :cd_tipo_acao ';
var
   qyBuscaAbatimentos: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyBuscaAbatimentos);

   Result := 0;

   qyBuscaAbatimentos.SQL.Text := SQL_BUSCA_ABATIMENTOS;
   qyBuscaAbatimentos.ParamByName('cd_titulo').AsInteger := cdTitulo;
   qyBuscaAbatimentos.ParamByName('cd_coligada').AsInteger := cdColigada;
   qyBuscaAbatimentos.ParamByName('cd_tipo_acao').AsInteger := cdTipoAcao;
   qyBuscaAbatimentos.Open;

   if qyBuscaAbatimentos.RecordCount > 0 then
   begin
      Result := qyBuscaAbatimentos.FieldByName('abatimentos').AsCurrency;
   end;
end;

procedure Tfrm_ContasPagar_Movimentacoes.grdKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then begin
    flgSearch := True;
    Close;
    Key := #0;
  end;

end;

procedure Tfrm_ContasPagar_Movimentacoes.btnCancelarClick(Sender: TObject);
var
   qyAcao : TUMZQuery;

   vlAbatimento: String;
begin
   // Pegar os valores do Movimento;

   if not DM.UsuarioLogado.TemPermissao(2039, npAcesso, True ) then Exit;

   Dm.CriarConsulta(qyAcao);
   qyAcao.Close;
   Case qyMovimentacoescd_tipo_acao.AsInteger of

      1 : begin
           Mensagem('Para cancelar um pagamento, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
           Exit;

      end;

      2, 3 :
         begin  // Baixa Por Cancelamento ou Desconto
            if Mensagem('Tem certeza que deseja desfazer a ação de movimento?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION, Handle) <> mrYES then
            begin
               Exit;
            end;

            {Deve diminuir o valor do abatimento do compromisso caso o mesmo,
            tenha sido cancelado}
            vlAbatimento := '';

            if (qyMovimentacoescd_origem.AsInteger = 2) and
               ((qyMovimentacoescd_tipo_acao.AsInteger = 3) or (qyMovimentacoescd_tipo_acao.AsInteger = 2))then 
            begin
               vlAbatimento := ', vl_abatimento = vl_abatimento - ' + StringReplace(CurrToStr(qyMovimentacoesvl_saida.AsCurrency), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' ';
            end;

            qyAcao.Close;
            qyAcao.SQL.Clear;
            qyAcao.SQL.Add(
               ' UPDATE fin_contas_pagar     '  +
               ' SET cd_situacao = 1         ' + vlAbatimento +
               ' WHERE cd_titulo = :cd_titulo AND cd_coligada = :cd_coligada '
            );

            qyAcao.ParamByName('cd_titulo').AsInteger := qyMovimentacoescd_titulo.AsInteger;
            qyAcao.ParamByName('cd_coligada').AsInteger := qyMovimentacoescd_coligada.AsInteger;
            qyAcao.ExecSQL();

            Atualizar := True;
      end;

      else
      begin
         Mensagem('Este movimento só pode ser cancelado com a Exclusão do título.', 'Atenção', MB_OK, Handle);
         Exit;
      end
   end;

   qyAcao.Close;
   qyAcao.SQL.Clear;
   qyAcao.SQL.Add(
     ' DELETE FROM fin_mov_cp '  +
     '  WHERE cd_titulo = :cd_titulo ' +
     '    AND cd_coligada = :cd_coligada ' + 
     '    AND nr_sequencia = :NrSequencia '
   );
   qyAcao.ParamByName('cd_titulo').AsInteger := qyMovimentacoescd_titulo.AsInteger;
   qyAcao.ParamByName('cd_coligada').AsInteger := qyMovimentacoescd_coligada.AsInteger;
   qyAcao.ParamByName('NrSequencia').AsInteger := qyMovimentacoesnr_sequencia.AsInteger;
   qyAcao.ExecSQL();

   qyMovimentacoes.Close();
   qyMovimentacoes.Open();
   FreeAndNil(qyAcao);
end;

procedure Tfrm_ContasPagar_Movimentacoes.btnFecharClick(Sender: TObject);
begin
  // Fechar o formulário
  
  flgSearch := False;
  Close;
end;

procedure Tfrm_ContasPagar_Movimentacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Teclas de Atalho
  
  case Key of
    VK_F11 : sbObservacaoClick( nil );
    VK_F12 : sbFecharClick( nil );
  end;
end;

procedure Tfrm_ContasPagar_Movimentacoes.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_ContasPagar_Movimentacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if frm_RegistrarObservacoes <> nil then
   begin
      frm_RegistrarObservacoes.Free;
      frm_RegistrarObservacoes := nil;
   end;
end;

procedure Tfrm_ContasPagar_Movimentacoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  qyMovimentacoes.Close();
  qyApropriacoes.Close();
end;

procedure Tfrm_ContasPagar_Movimentacoes.sbObservacaoClick(Sender: TObject);
begin
  // Registrar Observações

   if not DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
         'UMFinanceiro.Obs.Financeiro', npAcesso, False) then Exit;

   if frm_RegistrarObservacoes = nil then
      Application.CreateForm(Tfrm_RegistrarObservacoes, frm_RegistrarObservacoes);

   frm_RegistrarObservacoes.reObservacoes.Lines.Clear;
   frm_RegistrarObservacoes.moObservacao.Lines.Clear;
   frm_RegistrarObservacoes.reObservacoes.Text := qyMovimentacoes.FieldByName('ds_observacao').AsString;
   frm_RegistrarObservacoes.ShowModal;

   if frm_RegistrarObservacoes.flgSearch then
   begin
      try
         qyMovimentacoes.Edit();
         DM.RegistraObservacoes(qyMovimentacoes.FieldByName('ds_observacao'), frm_RegistrarObservacoes.moObservacao.Text);
         qyMovimentacoes.Post();
         qyMovimentacoes.ApplyUpdates();
      except
         Mensagem('Ocorreu uma falha inesperada, por favor tente novamente.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      end;
   end;
end;

procedure Tfrm_ContasPagar_Movimentacoes.sbFecharClick( Sender: TObject);
begin
  // Fechar o formulário
  Close();
end;

procedure Tfrm_ContasPagar_Movimentacoes.FormShow(Sender: TObject);
begin
   // Ao abrir o formulário
   
   pgOpcoes.ActivePageIndex := 0;
   qyApropriacoes.Close();
   qryEstorno.Close;
   if trim(cd_titulo_principal) <> '' then
   begin
      qyApropriacoes.ParamByName('cd_titulo').AsInteger := StrToInt(cd_titulo_principal);
      qyApropriacoes.ParamByName('cd_titulo_abat').AsInteger := qyMovimentacoescd_titulo.AsInteger;
      qryEstorno.ParamByName('cd_titulo').AsInteger     := StrToInt(cd_titulo_principal);
   end
   else
   begin
      qryEstorno.ParamByName('cd_titulo').AsInteger          := StrToInt(cd_titulo_principal);
      qyApropriacoes.ParamByName('cd_titulo').AsInteger      := qyMovimentacoescd_titulo.AsInteger;
      qyApropriacoes.ParamByName('cd_titulo_abat').AsInteger := qyMovimentacoescd_titulo.AsInteger;
   end;
   qyApropriacoes.ParamByName('cd_coligada').AsInteger := qyMovimentacoescd_coligada.AsInteger;
   qyApropriacoes.ParamByName('cd_coligada_abat').AsInteger := qyMovimentacoescd_coligada.AsInteger;
   qyApropriacoes.Open();
   qryEstorno.Open;
   if qryEstorno.RecordCount = 0 then
   begin
      tsEstorno.TabVisible := false;
   end
   else
   begin
      tsEstorno.TabVisible := true;
   end;

   lblDesc.Caption  := qryEstornods_estorno.AsString;
   lblCaixa.Caption := qryEstornods_caixa.AsString;


   Atualizar := False;
end;

procedure Tfrm_ContasPagar_Movimentacoes.pgOpcoesChange(Sender: TObject);
begin
   // Botão observações deve ser apresentado só na movimentação;

   sbObservacao.Visible := pgOpcoes.ActivePageIndex = 0

end;

end.
