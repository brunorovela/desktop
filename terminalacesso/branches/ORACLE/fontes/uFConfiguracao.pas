unit uFConfiguracao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB, ZConnection,
   StdCtrls, Buttons, DBCtrls, MMSystem, General,
   ZAbstractRODataset, ZAbstractDataset,
   ZDataset, UZDataset, Mask, uDM, DBTables, uUsuario;

type
   TfConfiguracao = class(TForm)
    sbExcluirSom: TSpeedButton;
    qyConfiguracoesme_som_terminal: TBlobField;
    procedure sbExcluirSomClick(Sender: TObject);
   published
      sbConfig: TScrollBox;
      bnSelecionaCor: TSpeedButton;
      bnSelecionaSom: TSpeedButton;
      bnTestarSom: TSpeedButton;
      bvSep4: TBevel;
      dbckOcorrencia: TDBCheckBox;
      dbeMsgTerminal: TDBEdit;
      dblcbTiposOc: TDBLookupComboBox;
      gbMensagem: TGroupBox;
      lbVariaveis: TLabel;
      lbMensagem: TLabel;
      tvVariaveis: TTreeView;
      mmMsgOcorrencia: TDBMemo;
      lbAjuda: TLabel;
      lbCorMensagem: TLabel;
      lbMsgTerminal: TLabel;
      lbTipoOcorrencia: TLabel;
      ledSom: TLabeledEdit;
      mmAjuda: TDBMemo;
      pnConfigTit: TPanel;
      sCorSelecionada: TShape;
      cdCores: TColorDialog;
      qyConfiguracoescor_msg_terminal: TStringField;
      dsTiposOc: TDataSource;
      qyConfiguracoesdsTipoOc: TStringField;
      qyConfiguracoescd_tipo_ocorrencia: TIntegerField;
      qyConfiguracoescd_configuracao: TIntegerField;
      qyConfiguracoestx_ajuda: TMemoField;
      qyConfiguracoesds_msg_terminal: TStringField;
      qyConfiguracoestx_msg_ocorrencia: TMemoField;
      qyConfiguracoestx_sql_ocorrencia: TMemoField;
      qyConfiguracoessn_envia_ocorrencia: TSmallintField;
      qyConfiguracoessn_permite_ocorrencia: TSmallintField;
      qyConfiguracoesds_configuracao: TStringField;
      odSom: TOpenDialog;
      qyTiposOc: TUMZQuery;
      pnTitulo: TPanel;
      ilImagens: TImageList;
      tbAcoes: TToolBar;
      bnSep1: TToolButton;
      bnAlterar: TToolButton;
      bnSep2: TToolButton;
      bnSalvar: TToolButton;
      bnCancelar: TToolButton;
      bnSep3: TToolButton;
      bnFechar: TToolButton;
      bnSep4: TToolButton;
      bvSep1: TBevel;
      bvSep2: TBevel;
      pnAcoes: TPanel;
      pnAcoesTit: TPanel;
      bvSep3: TBevel;
      dgAcoes: TDBGrid;
      dsAcoes: TDataSource;
      qyConfiguracoes: TUMZQuery;
      spSep1: TSplitter;
      qySQLConsulta: TUMZQuery;
      procedure dgAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure bnTestarSomClick(Sender: TObject);
      procedure qyConfiguracoesAfterOpen(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure bnFecharClick(Sender: TObject);
      procedure bnSelecionaSomClick(Sender: TObject);
      procedure bnSalvarClick(Sender: TObject);
      procedure bnCancelarClick(Sender: TObject);
      procedure bnAlterarClick(Sender: TObject);
      procedure tvVariaveisMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure dsAcoesDataChange(Sender: TObject; Field: TField);
      procedure qyConfiguracoesAfterRefresh(DataSet: TDataSet);
      procedure FormCreate(Sender: TObject);
      procedure dbckOcorrenciaClick(Sender: TObject);
      procedure mmMsgOcorrenciaDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; var Accept: Boolean);
      procedure mmMsgOcorrenciaDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure bnSelecionaCorClick(Sender: TObject);
      procedure qyConfiguracoesBeforeEdit(DataSet: TDataSet);
      procedure qyConfiguracoessn_envia_ocorrenciaChange(Sender: TField);
   strict private
      FSVariavelSel: string;
      procedure PreencheListaVariaveis;
   end;

var
   fConfiguracao: TfConfiguracao;

implementation

{$R *.dfm}

procedure TfConfiguracao.bnAlterarClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(10042, npAlterar, true) then
   begin
      qyConfiguracoes.Edit;
      bnSelecionaCor.Enabled := true;
      bnSelecionaSom.Enabled := true;
      sbExcluirSom.Enabled := True;
      bnTestarSom.Enabled := not qyConfiguracoes.FieldByName('me_som_terminal').IsNull;
      bnAlterar.Enabled := false;
      bnSalvar.Enabled := true;
      bnCancelar.Enabled := true;
      bnFechar.Enabled := false;
      dgAcoes.Enabled := false;
   end;
end;

procedure TfConfiguracao.bnCancelarClick(Sender: TObject);
var
   LICodigo: integer;
begin
   qyConfiguracoes.Cancel;
   bnSelecionaCor.Enabled := false;
   bnSelecionaSom.Enabled := false;
   sbExcluirSom.Enabled := False;
   bnTestarSom.Enabled := false;
   dgAcoes.Enabled := true;
   bnSalvar.Enabled := false;
   bnCancelar.Enabled := false;
   bnFechar.Enabled := true;
   LICodigo := qyConfiguracoes.FieldByName('cd_configuracao').AsInteger;
   qyConfiguracoes.Close;
   qyConfiguracoes.Open;
   qyConfiguracoes.Locate('cd_configuracao', LICodigo, []);
end;

procedure TfConfiguracao.bnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfConfiguracao.bnSalvarClick(Sender: TObject);
var
   LICodigo: integer;
begin
   qyConfiguracoes.Post;
   bnSelecionaCor.Enabled := false;
   bnSelecionaSom.Enabled := false;
   sbExcluirSom.Enabled := False;
   bnTestarSom.Enabled := false;
   dgAcoes.Enabled := true;
   bnSalvar.Enabled := false;
   bnCancelar.Enabled := false;
   bnFechar.Enabled := true;
   LICodigo := qyConfiguracoes.FieldByName('cd_configuracao').AsInteger;
   qyConfiguracoes.Close;
   qyConfiguracoes.Open;
   qyConfiguracoes.Locate('cd_configuracao', LICodigo, []);
end;

procedure TfConfiguracao.bnSelecionaCorClick(Sender: TObject);
begin
   if cdCores.Execute then
   begin
      sCorSelecionada.Brush.Color := cdCores.Color;
      qyConfiguracoes.FieldByName('cor_msg_terminal').AsString :=
         TColorToHex(cdCores.Color);
   end;
end;

procedure TfConfiguracao.bnSelecionaSomClick(Sender: TObject);
begin
   if odSom.Execute then
   begin
      ledSom.Text := 'Som selecionado';
      ledSom.Color := clInfoBk;
      (qyConfiguracoes.FieldByName('me_som_terminal') as TBlobField).LoadFromFile(odSom.FileName);
      bnTestarSom.Enabled := true;
   end;
end;

procedure TfConfiguracao.bnTestarSomClick(Sender: TObject);
const
   MSG_SEM_SOM = 'Não foi definido um som para esta ação.';
var
   LBsSom: TStream;
   LMsSom: TMemoryStream;
begin
   if qyConfiguracoes.FieldByName('me_som_terminal').IsNull then
   begin
      Mensagem(MSG_SEM_SOM, 'Informação.', MB_ICONINFORMATION, Self.Handle);
   end
   else
   begin
      LBsSom := qyConfiguracoes.CreateBlobStream(qyConfiguracoesme_som_terminal, bmRead);
      try
         LMsSom := TMemoryStream.Create;
         try
            LMsSom.CopyFrom(LBsSom, LBsSom.Size);
            Screen.Cursor := crHourGlass;
            PlaySound(LMsSom.Memory, 0, SND_SYNC or SND_MEMORY);
            Screen.Cursor := crDefault;
         finally
            FreeAndNil(LMsSom);
         end;
      finally
         FreeAndNil(LBsSom);
      end;
   end;
end;

procedure TfConfiguracao.dbckOcorrenciaClick(Sender: TObject);
begin
   lbTipoOcorrencia.Visible := dbckOcorrencia.Checked;
   gbMensagem.Visible := dbckOcorrencia.Checked;
   dblcbTiposOc.Visible := dbckOcorrencia.Checked;
end;

procedure TfConfiguracao.dgAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   CtrlState: array[boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   LCheckBoxRect: TRect;
begin
   if Column.FieldName = 'sn_envia_ocorrencia' then
   begin
      dgAcoes.Canvas.FillRect(Rect);
      LCheckBoxRect.Left := Rect.Left + 2;
      LCheckBoxRect.Right := Rect.Right - 2;
      LCheckBoxRect.Top := Rect.Top + 2;
      LCheckBoxRect.Bottom := Rect.Bottom - 2;
      DrawFrameControl(dgAcoes.Canvas.Handle, LCheckBoxRect, DFC_BUTTON, CtrlState[(Column.Field.AsInteger = 1)]);
   end;
end;

procedure TfConfiguracao.dsAcoesDataChange(Sender: TObject; Field: TField);
begin
   if qyConfiguracoes.State = dsBrowse then
   begin
      ledSom.Clear;
      dbckOcorrencia.Visible := qyConfiguracoes.FieldByName('sn_permite_ocorrencia').AsInteger = 1;
      sCorSelecionada.Brush.Color := HexToTColor(qyConfiguracoes.FieldByName('cor_msg_terminal').AsString);
      if qyConfiguracoes.FieldByName('me_som_terminal').IsNull then
      begin
         ledSom.Color := clBtnFace;
         ledSom.Text := 'Não foi configurado som para a ação...';
      end
      else
      begin
         ledSom.Color := clInfoBk;
         ledSom.Text := 'Som para a ação já configurado...';
      end;
   end;
   qySQLConsulta.SQL.Text := qyConfiguracoes.FieldByName('tx_sql_ocorrencia').AsString;
   PreencheListaVariaveis;
end;

procedure TfConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qyTiposOc.Close;
   qyConfiguracoes.Close;
   Action := caFree;
end;

procedure TfConfiguracao.FormCreate(Sender: TObject);
begin
   qyConfiguracoes.Open;
end;

procedure TfConfiguracao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfConfiguracao.mmMsgOcorrenciaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   tvVariaveis.EndDrag(Source = tvVariaveis);
   mmMsgOcorrencia.SelText := FSVariavelSel;
end;

procedure TfConfiguracao.mmMsgOcorrenciaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := Source = tvVariaveis;
   //http://www.unitoops.com/uoole/examples/memotest.htm
   mmMsgOcorrencia.SelStart :=
      LOWORD(SendMessage(mmMsgOcorrencia.Handle, EM_CHARFROMPOS, 0, MakeLParam(X, Y)));
   mmMsgOcorrencia.SetFocus;
end;

procedure TfConfiguracao.PreencheListaVariaveis;
var
   LInd: integer;
begin
   tvVariaveis.Items.Clear;
   qySQLConsulta.ParamByName('anosemestre').AsInteger := 0;
   qySQLConsulta.ParamByName('codigoaluno').AsInteger := 0;
   try
      qySQLConsulta.ParamByName('cd_tipo').AsInteger := 0;
   except
   end;
   try
      qySQLConsulta.Open;
      for LInd := 0 to qySQLConsulta.FieldCount - 1 do
         tvVariaveis.Items.Add(tvVariaveis.TopItem, qySQLConsulta.Fields[LInd].FieldName);
   finally
      qySQLConsulta.Close;
   end;
end;

procedure TfConfiguracao.qyConfiguracoesAfterOpen(DataSet: TDataSet);
begin
   bnAlterar.Enabled := not qyConfiguracoes.IsEmpty;
end;

procedure TfConfiguracao.qyConfiguracoesAfterRefresh(DataSet: TDataSet);
begin
   if not qyConfiguracoes.FieldByName('cd_tipo_ocorrencia').IsNull then
      qyTiposOc.Locate('cd_tipo', qyConfiguracoes.FieldByName('cd_tipo_ocorrencia').AsInteger, []);
   bnAlterar.Enabled := not qyConfiguracoes.IsEmpty;
end;

procedure TfConfiguracao.qyConfiguracoesBeforeEdit(DataSet: TDataSet);
begin
   bnTestarSom.Enabled := not qyConfiguracoes.FieldByName('me_som_terminal').IsNull;
   bnSelecionaSom.Enabled := true;
   sbExcluirSom.Enabled := True;
   bnAlterar.Enabled := false;
   bnSalvar.Enabled := true;
   bnCancelar.Enabled := true;
   bnFechar.Enabled := false;
   dgAcoes.Enabled := false;
end;

procedure TfConfiguracao.qyConfiguracoessn_envia_ocorrenciaChange(
  Sender: TField);
const
   MSG_SEM_PESSOA =
      'Para utilizar o envio automático de ocorrências,' + #13 +
      'é necessário que seu usuário esteja vinculado a um cadastro de pessoa:' + #13 +
      '(Sistema Acadêmico > Configurações > Usuários > Seu usuário, víncule-o a um cadastro de pessoa)';
begin
   if (Sender.AsInteger = 1) and DM.UtilizaEnvioOcorrencias and (DM.GetUsuarioLogado = nil) then
   begin
      Mensagem(MSG_SEM_PESSOA, 'Atenção!', MB_OK + MB_ICONWARNING, Self.Handle);
      Sender.AsInteger := 0;
      Abort;
   end;
end;

procedure TfConfiguracao.sbExcluirSomClick(Sender: TObject);
begin
   qyConfiguracoesme_som_terminal.Clear;
   bnTestarSom.Enabled := False;
end;

procedure TfConfiguracao.tvVariaveisMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (qyConfiguracoes.State = dsEdit) and (tvVariaveis.GetNodeAt(X, Y) <> nil) then
   begin
      FSVariavelSel := '{' + tvVariaveis.GetNodeAt(X, Y).Text + '}';
      tvVariaveis.BeginDrag(true);
   end;
end;

end.

