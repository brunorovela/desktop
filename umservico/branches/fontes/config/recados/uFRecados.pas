unit uFRecados;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ToolWin, ComCtrls, Grids, DBGrids, DB, uAFuncoes,
   ZAbstractRODataset, StdCtrls, Spin, Buttons, SynEdit, uDMConexao,
   SynEditHighlighter, SynHighlighterSQL, ZAbstractDataset, UZDataset,
   ZConnection;

type
   TUMTipoRecado = (trRecadoOL = 1, trEmail);

   TUMTipoRecadoSet = set of TUMTipoRecado;

   TUMSvcRecado = class(TObject)
   strict private
      FICodigo: integer;
      FIIntervalo: integer;
      FSTitulo: string;
      FSDescricao: string;
      FSSQL: string;
      FSAssunto: string;
      FSMsgEmail: string;
      FSMsgRecado: string;
      FBAtivo: boolean;
      FUMTipoRecadoSet: TUMTipoRecadoSet;
      function GetTipoRecadoAsStr: string;
   private
      constructor Create(const AICodigo, AIIntervalo: integer; const ASTitulo,
         ASDescricao, ASSQL, ASAssunto, ASMsgEmail, ASMsgRecado: string;
         const ABAtivo: boolean; const AUMTipoRecadoSet: TUMTipoRecadoSet);
      destructor Destroy; override;
      property Codigo: integer read FICodigo;
      property Intervalo: integer read FIIntervalo write FIIntervalo;
      property Titulo: string read FSTitulo;
      property Descricao: string read FSDescricao write FSDescricao;
      property SQL: string read FSSQL write FSSQL;
      property Assunto: string read FSAssunto write FSAssunto;
      property MsgEmail: string read FSMsgEmail write FSMsgEmail;
      property MsgRecado: string read FSMsgRecado write FSMsgRecado;
      property Ativo: boolean read FBAtivo write FBAtivo;
      property TipoRecadoSet: TUMTipoRecadoSet read FUMTipoRecadoSet write FUMTipoRecadoSet;
      property TipoRecadoStr: string read GetTipoRecadoAsStr;
   end;

   TfRecados = class(TForm)
    procedure ckAtivoClick(Sender: TObject);
    procedure qyRecadosAfterOpen(DataSet: TDataSet);
   published
      qySalvaDados: TUMZQuery;
      tbAcoes: TToolBar;
      ilImagens: TImageList;
      bnSep1: TToolButton;
      bnAlterar: TToolButton;
      bnSep2: TToolButton;
      bnSalvar: TToolButton;
      bnSep3: TToolButton;
      bnCancelar: TToolButton;
      bnFechar: TToolButton;
      bnSep4: TToolButton;
      bvSep1: TBevel;
      pnListaRecados: TPanel;
      pnTitListaRecados: TPanel;
      bvSep2: TBevel;
      dgRecados: TDBGrid;
      dsRecados: TDataSource;
      qyRecados: TUMZQuery;
      bvSep3: TBevel;
      pnConfig: TPanel;
      pnTitConfig: TPanel;
      bvSep4: TBevel;
      lbDescricao: TLabel;
      mmDescricao: TMemo;
      ckAtivo: TCheckBox;
      lbIntervalo: TLabel;
      seIntervalo: TSpinEdit;
      cbTipoIntervalo: TComboBox;
      ckRecados: TCheckBox;
      bnRecado: TSpeedButton;
      ckEmails: TCheckBox;
      bnEmail: TSpeedButton;
      bnCopiarEmail: TSpeedButton;
      bnCopiarRecado: TSpeedButton;
      ledAssuntoEmail: TLabeledEdit;
      procedure bnFecharClick(Sender: TObject);
      procedure dsRecadosDataChange(Sender: TObject; Field: TField);
      procedure bnSalvarClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure ckRecadosClick(Sender: TObject);
      procedure ckEmailsClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bnEmailClick(Sender: TObject);
      procedure bnRecadoClick(Sender: TObject);
      procedure bnCopiarRecadoClick(Sender: TObject);
      procedure bnCopiarEmailClick(Sender: TObject);
      procedure bnCancelarClick(Sender: TObject);
      procedure bnAlterarClick(Sender: TObject);
      procedure dgRecadosDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
   strict private
      FUMSvcRecadoAtual: TUMSvcRecado;
      FUMConexao: TUMConexao;
      FCodigoRecadoAtivo: Integer;
      procedure LoadParametros(FConn: TZConnection);
      procedure CarregaRecados;
      procedure SalvaRecado;
      function GetVariaveis: TStringList;
      function GetIntervalo: integer;
   private
      constructor Create;
      destructor Destroy; override;
   public
      class procedure Mostra;
   end;

var
   fRecados: TfRecados;

implementation

uses
   uFPrincipal, uFConfigMsg;

{$R *.dfm}

procedure TfRecados.bnAlterarClick(Sender: TObject);
begin
   seIntervalo.Enabled := true;
   ledAssuntoEmail.Enabled := ckEmails.Checked;
   ckAtivo.Enabled := true;
   ckRecados.Enabled := true;
   ckEmails.Enabled := true;
   cbTipoIntervalo.Enabled := true;
   mmDescricao.Enabled := true;
   bnRecado.Enabled := ckRecados.Checked;
   bnEmail.Enabled := ckEmails.Checked;
   bnCopiarEmail.Enabled := ckRecados.Checked;
   bnCopiarRecado.Enabled := ckEmails.Checked;
   bnAlterar.Enabled := false;
   bnSalvar.Enabled := true;
   bnCancelar.Enabled := true;
   bnFechar.Enabled := false;
   dgRecados.Enabled := false;
end;

procedure TfRecados.bnCancelarClick(Sender: TObject);
begin
   seIntervalo.Enabled := false;
   ledAssuntoEmail.Enabled := false;
   ckAtivo.Enabled := false;
   ckRecados.Enabled := false;
   ckEmails.Enabled := false;
   cbTipoIntervalo.Enabled := false;
   mmDescricao.Enabled := false;
   bnRecado.Enabled := false;
   bnEmail.Enabled := false;
   bnCopiarEmail.Enabled := false;
   bnCopiarRecado.Enabled := false;
   bnAlterar.Enabled := not qyRecados.IsEmpty;
   bnSalvar.Enabled := false;
   bnCancelar.Enabled := false;
   bnFechar.Enabled := true;
   dgRecados.Enabled := true;
end;

procedure TfRecados.bnCopiarEmailClick(Sender: TObject);
const
   MSG_PERGUNTA_COPIA =
      'Você tem certeza que deseja sobreescrever a mensagem de RECADOS com a mensagem padrão de E-MAILS?' + #13 +
      'A mensagem anterior será sobreescrita e não será possível recuperá-la.';
begin
   if Mensagem(MSG_PERGUNTA_COPIA, 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      FUMSvcRecadoAtual.MsgRecado := FUMSvcRecadoAtual.MsgEmail;
end;

procedure TfRecados.bnCopiarRecadoClick(Sender: TObject);
const
   MSG_PERGUNTA_COPIA =
      'Você tem certeza que deseja sobreescrever a mensagem de E-MAILS com a mensagem padrão de RECADOS?' + #13 +
      'A mensagem anterior será sobreescrita e não será possível recuperá-la.';
begin
   if Mensagem(MSG_PERGUNTA_COPIA, 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      FUMSvcRecadoAtual.MsgEmail := FUMSvcRecadoAtual.MsgRecado;
end;

procedure TfRecados.bnEmailClick(Sender: TObject);
var
   LSMsg: string;
begin
   LSMsg := FUMSvcRecadoAtual.MsgEmail;
   if TfConfigMsg.GetMensagem(GetVariaveis, LSMsg, Self) then
      FUMSvcRecadoAtual.MsgEmail := LSMsg;
end;

procedure TfRecados.bnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfRecados.bnRecadoClick(Sender: TObject);
var
   LSMsg: string;
begin
   LSMsg := FUMSvcRecadoAtual.MsgRecado;
   if TfConfigMsg.GetMensagem(GetVariaveis, LSMsg, Self) then
      FUMSvcRecadoAtual.MsgRecado := LSMsg;
end;

procedure TfRecados.bnSalvarClick(Sender: TObject);
const
   BoolToTipoRecadoSet: array[boolean, boolean] of TUMTipoRecadoSet =
      (([trRecadoOL], [trRecadoOL]), ([trEMail], [trRecadoOL, trEMail]));
begin
   seIntervalo.Enabled := false;
   ledAssuntoEmail.Enabled := false;
   ckAtivo.Enabled := false;
   ckRecados.Enabled := false;
   ckEmails.Enabled := false;
   cbTipoIntervalo.Enabled := false;
   mmDescricao.Enabled := false;
   bnCopiarEmail.Enabled := false;
   bnCopiarRecado.Enabled := false;
   bnAlterar.Enabled := not qyRecados.IsEmpty;
   bnSalvar.Enabled := false;
   bnCancelar.Enabled := false;
   bnFechar.Enabled := true;
   FUMSvcRecadoAtual.Intervalo := GetIntervalo;
   FUMSvcRecadoAtual.Assunto := ledAssuntoEmail.Text;
   FUMSvcRecadoAtual.Ativo := ckAtivo.Checked;
   FUMSvcRecadoAtual.Descricao := mmDescricao.Lines.Text;
   FUMSvcRecadoAtual.TipoRecadoSet :=
      BoolToTipoRecadoSet[ckEmails.Checked, ckRecados.Checked];
   SalvaRecado;
   cbTipoIntervalo.ItemIndex := 0;
   qyRecados.Refresh;
   dgRecados.Enabled := true;
   bnAlterar.Enabled := not qyRecados.IsEmpty;
   qyRecados.Locate('cd_recado', FUMSvcRecadoAtual.Codigo, []);
end;

procedure TfRecados.CarregaRecados;
begin
   qyRecados.Open;
   bnAlterar.Enabled := not qyRecados.IsEmpty;
end;

procedure TfRecados.ckAtivoClick(Sender: TObject);
begin
   ckRecados.Checked := false;
   ckEmails.Checked := false;
end;

procedure TfRecados.ckEmailsClick(Sender: TObject);
begin
   bnEmail.Enabled := ckEmails.Checked and ckEmails.Enabled;
   ledAssuntoEmail.Enabled := ckEmails.Checked and ckEmails.Enabled;
   bnCopiarRecado.Enabled := ckEmails.Checked and ckEmails.Enabled;;
end;

procedure TfRecados.ckRecadosClick(Sender: TObject);
begin
   bnRecado.Enabled := ckRecados.Checked and ckRecados.Enabled;
   bnCopiarEmail.Enabled := ckRecados.Enabled and ckRecados.Checked;
end;

constructor TfRecados.Create;
begin
   inherited Create(Application);
   FUMConexao := TUMConexao.Create(nil);
   FUMConexao.Conectar(fUMSvcConfiguracoes.UMSvcRecadosIni.IniFile, 'Conexao', false);
   qyRecados.Connection := FUMConexao.Conn;
   qySalvaDados.Connection := FUMConexao.Conn;
   LoadParametros(FUMConexao.Conn);
   CarregaRecados;
end;

destructor TfRecados.Destroy;
begin
   if Assigned(FUMSvcRecadoAtual) then
      FreeAndNil(FUMSvcRecadoAtual);
   inherited;
end;

procedure TfRecados.dgRecadosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   CtrlState: array[boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   LCheckBoxRect: TRect;
begin
   if Column.FieldName = 'sn_ativo' then
   begin
      dgRecados.Canvas.FillRect(Rect);
      LCheckBoxRect.Left := Rect.Left + 2;
      LCheckBoxRect.Right := Rect.Right - 2;
      LCheckBoxRect.Top := Rect.Top + 2;
      LCheckBoxRect.Bottom := Rect.Bottom - 2;
      DrawFrameControl(dgRecados.Canvas.Handle, LCheckBoxRect, DFC_BUTTON, CtrlState[(Column.Field.AsInteger = FCodigoRecadoAtivo)]);
   end;
end;

procedure TfRecados.dsRecadosDataChange(Sender: TObject; Field: TField);
const
   StrToTipoRecadoSet: array['1'..'3'] of TUMTipoRecadoSet =
      ([trRecadoOL], [trEMail], [trRecadoOL, trEMail]);
begin
   if Assigned(FUMSvcRecadoAtual) then
   begin
      FUMSvcRecadoAtual.Free;
   end;

   if not qyRecados.IsEmpty then
   begin
      FUMSvcRecadoAtual := TUMSvcRecado.Create(
         qyRecados.FieldByName('cd_recado').AsInteger,
         qyRecados.FieldByName('nr_intervalo').AsInteger,
         qyRecados.FieldByName('ds_titulo').AsString,
         qyRecados.FieldByName('me_descricao').AsString,
         qyRecados.FieldByName('me_sql').AsString,
         qyRecados.FieldByName('ds_assunto').AsString,
         qyRecados.FieldByName('me_msg_email').AsString,
         qyRecados.FieldByName('me_msg_recado').AsString,
         qyRecados.FieldByName('sn_ativo').AsInteger = FCodigoRecadoAtivo,
         StrToTipoRecadoSet[qyRecados.FieldByName('tp_recado').AsString[1]]
      );

      mmDescricao.Lines.Text := FUMSvcRecadoAtual.Descricao;
      seIntervalo.Value := FUMSvcRecadoAtual.Intervalo;
      ckAtivo.Checked := FUMSvcRecadoAtual.Ativo;
      ckRecados.Checked :=
         (trRecadoOL in FUMSvcRecadoAtual.TipoRecadoSet) and FUMSvcRecadoAtual.Ativo;
      ckEmails.Checked :=
         (trEmail in FUMSvcRecadoAtual.TipoRecadoSet) and FUMSvcRecadoAtual.Ativo;
      ledAssuntoEmail.Text := FUMSvcRecadoAtual.Assunto;
      bnRecado.Enabled := false;
      bnEmail.Enabled := false;
   end;
end;

procedure TfRecados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfRecados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F3:
         if bnAlterar.Enabled then
            bnAlterarClick(nil);
      VK_F5:
         if bnSalvar.Enabled then
            bnSalvarClick(nil);
      VK_F6:
         if bnCancelar.Enabled then
            bnCancelarClick(nil);
      VK_F12:
         if bnFechar.Enabled then
            bnFecharClick(nil);
   end;
end;

function TfRecados.GetIntervalo: integer;
begin
   case cbTipoIntervalo.ItemIndex of
      0:
         Result := seIntervalo.Value;
      1:
         Result := seIntervalo.Value * 60;
      2:
         Result := seIntervalo.Value * 60 * 24;   
   end;
end;

function TfRecados.GetVariaveis: TStringList;
var
   I: integer;
   LQySQL: TUMZReadOnlyQuery;
begin
   Result := TStringList.Create;
   LQySQL := FUMConexao.newROQuery;
   try
      LQySQL.SQL.Text := qyRecados.FieldByName('me_sql').AsString;
      LQySQL.Open;
      for I := 0 to LQySQL.FieldCount - 1 do
         Result.Add(LQySQL.Fields[I].DisplayName);
   finally
      FUMConexao.freeROQuery(LQySQL);
   end;
end;

procedure TfRecados.LoadParametros(FConn: TZConnection);
const
   SQL_BUSCA_PARAMETROS =
      'SELECT ds_valor FROM nu_parametros WHERE ds_parametro = :ds_parametro';
var
   qyBuscaParametros: TUMZQuery;
begin
   qyBuscaParametros := TUMZQuery.Create(nil);
   qyBuscaParametros.Connection := FConn;

   qyBuscaParametros.SQL.Text := SQL_BUSCA_PARAMETROS;
   qyBuscaParametros.ParamByName('ds_parametro').AsString := 'codigo_sn_ativo';
   qyBuscaParametros.Open();

   FCodigoRecadoAtivo := StrToIntDef(qyBuscaParametros.FieldByName('ds_valor').AsString, 1);
   if NOT(FCodigoRecadoAtivo >= 1) then
   begin
      FCodigoRecadoAtivo := 1;
   end;

   qyBuscaParametros.Close();
   FreeAndNil(qyBuscaParametros);
end;

class procedure TfRecados.Mostra;
begin
   if not Assigned(fRecados) then
      fRecados := TfRecados.Create;
   try
      fRecados.ShowModal;
   finally
      FreeAndNil(fRecados);
   end;
end;

procedure TfRecados.qyRecadosAfterOpen(DataSet: TDataSet);
begin
   pnConfig.Enabled := not qyRecados.IsEmpty;
end;

procedure TfRecados.SalvaRecado;
begin
   qySalvaDados.ParamByName('me_descricao').AsString := FUMSvcRecadoAtual.Descricao;
   qySalvaDados.ParamByName('ds_assunto').AsString := FUMSvcRecadoAtual.Assunto;
   qySalvaDados.ParamByName('me_msg_email').AsString := FUMSvcRecadoAtual.MsgEmail;
   qySalvaDados.ParamByName('me_msg_recado').AsString := FUMSvcRecadoAtual.MsgRecado;

   if FUMSvcRecadoAtual.Ativo then
   begin
      qySalvaDados.ParamByName('sn_ativo').AsInteger := FCodigoRecadoAtivo
   end else begin
      qySalvaDados.ParamByName('sn_ativo').AsInteger := 0;
   end;

   qySalvaDados.ParamByName('nr_intervalo').AsInteger := FUMSvcRecadoAtual.Intervalo;
   qySalvaDados.ParamByName('tp_recado').AsString := FUMSvcRecadoAtual.TipoRecadoStr;
   qySalvaDados.ParamByName('cd_recado').AsInteger := FUMSvcRecadoAtual.Codigo;
   try
      qySalvaDados.ExecSQL;
   except
      on E: EZDatabaseError do raise;
   end;  
end;

{ TUMSvcRecado }

constructor TUMSvcRecado.Create(const AICodigo, AIIntervalo: integer;
  const ASTitulo, ASDescricao, ASSQL, ASAssunto, ASMsgEmail,
  ASMsgRecado: string; const ABAtivo: boolean;
  const AUMTipoRecadoSet: TUMTipoRecadoSet);
begin
   Self.FICodigo := AICodigo;
   Self.FIIntervalo := AIIntervalo;
   Self.FSTitulo := ASTitulo;
   Self.FSDescricao := ASDescricao;
   Self.FSSQL := ASSQL;
   Self.FSAssunto := ASAssunto;
   Self.FSMsgEmail := ASMsgEmail;
   Self.FSMsgRecado := ASMsgRecado;
   Self.FBAtivo := ABAtivo;
   Self.FUMTipoRecadoSet := AUMTipoRecadoSet;
end;

destructor TUMSvcRecado.Destroy;
begin
   inherited;
end;

function TUMSvcRecado.GetTipoRecadoAsStr: string;
begin
   if Self.FUMTipoRecadoSet = [trRecadoOL, trEmail] then
      Result := '3'
   else if Self.FUMTipoRecadoSet = [trEmail] then
      Result := '2'
   else
      Result := '1';
end;

end.
