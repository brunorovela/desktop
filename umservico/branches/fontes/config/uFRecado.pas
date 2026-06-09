unit uFRecado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Spin, Buttons, uFRecados, uFHistorico, ComCtrls, ImgList,
  ExtCtrls, DB, ZAbstractRODataset, ZDataset, ZAbstractDataset, UZDataset;

type
   TfRecado = class(TFrame)
   published
      chkAutenticacao: TCheckBox;
      lblConexaoSeguro: TLabel;
      cbConexaoSegura: TComboBox;
      qySalvaParamSMTP: TUMZQuery;
      qyDadosSMTP: TUMZQuery;
      bnConexao: TSpeedButton;
      pcConfig: TPageControl;
      tsConfig: TTabSheet;
      tsEmail: TTabSheet;
      ilImagens: TImageList;
      ledServidor: TLabeledEdit;
      ledUsuario: TLabeledEdit;
      ledSenha: TLabeledEdit;
      ledRemetente: TLabeledEdit;
      ledNome: TLabeledEdit;
      ledDominio: TLabeledEdit;
      ledOrganizacao: TLabeledEdit;
      lbIntervaloSMTP: TLabel;
      lbPorta: TLabel;
      lbLimite: TLabel;
      seIntervaloSMTP: TSpinEdit;
      seLimite: TSpinEdit;
      sePorta: TSpinEdit;
      bnConfig: TSpeedButton;
      bnLogs: TSpeedButton;
      gbConfig: TGroupBox;
      lbIntervalo: TLabel;
      cbIntervalo: TComboBox;
      ckIntervalo: TCheckBox;
      seIntervalo: TSpinEdit;
      procedure Configura(Sender: TObject);
      procedure Logs(Sender: TObject);
      procedure bnConexaoClick(Sender: TObject);
      procedure AlteraConfiguracao(Sender: TObject);
      procedure qyDadosSMTPAfterOpen(DataSet: TDataSet);
   strict private
      FBAlteraSMTP: boolean;
      procedure SalvaDadosSMTP;
   public
      constructor Create(AOwner: TComponent);
      procedure Salva;
   end;

implementation

uses
   uFPrincipal, uSvcConfClasses, uFConexao;

const
   TipoIntervaloToIndex: array[TUMTipoIntervalo] of integer = (0, 1, 2);
   IndexToTipoIntervalo: array[0..2] of TUMTipoIntervalo = (tiMinuto, tiHora, tiDia);

{$R *.dfm}

{ TfRecados }

procedure TfRecado.AlteraConfiguracao(Sender: TObject);
begin
   fPrincipal.bnDescartar.Enabled := Parent <> nil;
   fPrincipal.bnSalvar.Enabled := Parent <> nil;
   FBAlteraSMTP :=
      ((Sender is TWinControl) and (TWinControl(Sender).Parent = tsEmail)) or
      (Sender is TSpinEdit);
end;

procedure TfRecado.bnConexaoClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcRecadosIni.DadosConexao;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao', fUMSvcConfiguracoes.UMSvcRecadosIni.IniFile) then
      begin
         fUMSvcConfiguracoes.UMSvcRecadosIni.DadosConexao := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

procedure TfRecado.Configura(Sender: TObject);
begin
   TfRecados.Mostra;
end;

constructor TfRecado.Create(AOwner: TComponent);
begin
   inherited;
   ckIntervalo.Checked := fUMSvcConfiguracoes.UMSvcRecadosIni.IntervaloEntreExecucoes;
   seIntervalo.Value := fUMSvcConfiguracoes.UMSvcRecadosIni.Intervalo;
   cbIntervalo.ItemIndex := TipoIntervaloToIndex[fUMSvcConfiguracoes.UMSvcRecadosIni.TipoIntervalo];
   qyDadosSMTP.Connection := fPrincipal.UMConexao.Conn;
   qySalvaParamSMTP.Connection := fPrincipal.UMConexao.Conn;
   qyDadosSMTP.Open;
end;

procedure TfRecado.Logs(Sender: TObject);
begin
   TfHistorico.mostra;
end;

procedure TfRecado.qyDadosSMTPAfterOpen(DataSet: TDataSet);
begin
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.servidor', []) then
      ledServidor.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledServidor.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.usuario', []) then
      ledUsuario.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledUsuario.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.senha', []) then
      ledSenha.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledSenha.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.remetente', []) then
      ledRemetente.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledRemetente.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.nome', []) then
      ledNome.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledNome.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.dominio', []) then
      ledDominio.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledDominio.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.organizacao', []) then
      ledOrganizacao.Text := qyDadosSMTP.FieldByName('ds_valor').AsString
   else
      ledOrganizacao.Clear;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.intervalo', []) then
      try
         seIntervaloSMTP.Value := StrToInt(qyDadosSMTP.FieldByName('ds_valor').AsString);
      except
         on E: Exception do
            seIntervaloSMTP.Value := 0;
      end
   else
      seIntervaloSMTP.Value := 0;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.limite', []) then
      try
         seLimite.Value := StrToInt(qyDadosSMTP.FieldByName('ds_valor').AsString);
      except
         on E: Exception do
            seLimite.Value := 0
      end
   else
      seLimite.Value := 0;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.porta', []) then
      try
         sePorta.Value := StrToInt(qyDadosSMTP.FieldByName('ds_valor').AsString);
      except
         on E: Exception do
            sePorta.Value := 0;
      end
   else
      sePorta.Value := 25;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.autenticacao', []) then
      chkAutenticacao.Checked := qyDadosSMTP.FieldByName('ds_valor').AsString = '1'
   else
      chkAutenticacao.Checked := false;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.usatls', []) then
   begin
      if qyDadosSMTP.FieldByName('ds_valor').AsString = '1' then
         cbConexaoSegura.ItemIndex := cbConexaoSegura.Items.IndexOf('TLS');
   end
   else
      cbConexaoSegura.ItemIndex := 0;
   if qyDadosSMTP.Locate('ds_parametro', 'smtp.usassl', []) then
   begin
      if qyDadosSMTP.FieldByName('ds_valor').AsString = '1' then
         cbConexaoSegura.ItemIndex := cbConexaoSegura.Items.IndexOf('SSL');
   end
   else
      cbConexaoSegura.ItemIndex := 0;
end;

procedure TfRecado.Salva;
begin
   fUMSvcConfiguracoes.UMSvcRecadosIni.IntervaloEntreExecucoes := ckIntervalo.Checked;
   fUMSvcConfiguracoes.UMSvcRecadosIni.Intervalo := seIntervalo.Value;
   fUMSvcConfiguracoes.UMSvcRecadosIni.TipoIntervalo := IndexToTipoIntervalo[cbIntervalo.ItemIndex];
   if FBAlteraSMTP then SalvaDadosSMTP;
end;

procedure TfRecado.SalvaDadosSMTP;
begin
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.servidor';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledServidor.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.usuario';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledUsuario.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.senha';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledSenha.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.remetente';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledRemetente.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.nome';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledNome.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.dominio';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledDominio.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.organizacao';
   qySalvaParamSMTP.ParamByName('ds_valor').AsString := ledOrganizacao.Text;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.intervalo';
   qySalvaParamSMTP.ParamByName('ds_valor').AsInteger := seIntervaloSMTP.Value;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.limite';
   qySalvaParamSMTP.ParamByName('ds_valor').AsInteger := seLimite.Value;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.porta';
   qySalvaParamSMTP.ParamByName('ds_valor').AsInteger := sePorta.Value;
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.usatls';
   if cbConexaoSegura.ItemIndex = 1 then
      qySalvaParamSMTP.ParamByName('ds_valor').AsString := '1'
   else
      qySalvaParamSMTP.ParamByName('ds_valor').AsString := '0';
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.usassl';
   if cbConexaoSegura.ItemIndex = 2 then
      qySalvaParamSMTP.ParamByName('ds_valor').AsString := '1'
   else
      qySalvaParamSMTP.ParamByName('ds_valor').AsString := '0';
   qySalvaParamSMTP.ExecSQL;
   qySalvaParamSMTP.ParamByName('ds_parametro').AsString := 'smtp.autenticacao';
   if chkAutenticacao.Checked then
      qySalvaParamSMTP.ParamByName('ds_valor').AsString := '1'
   else
      qySalvaParamSMTP.ParamByName('ds_valor').AsString := '0';
   qySalvaParamSMTP.ExecSQL;
end;

end.
