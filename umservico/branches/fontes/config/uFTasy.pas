unit uFTasy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Spin, uSvcConfClasses, Buttons;

type
   TfTasy = class(TFrame)
   published
      gbConexao: TGroupBox;
      bnConnUnimestre: TSpeedButton;
      bnConnTasy: TSpeedButton;
      gbConfig: TGroupBox;
      lbIntervalo: TLabel;
      lbRegistros: TLabel;
      cbIntervalo: TComboBox;
      ckIntervalo: TCheckBox;
      seIntervalo: TSpinEdit;
      seRegistros: TSpinEdit;
      gbServicos: TGroupBox;
      ckPessoas: TCheckBox;
      procedure bnConnTasyClick(Sender: TObject);
      procedure bnConnUnimestreClick(Sender: TObject);
      procedure AlteraConfiguracao(Sender: TObject);
   public
      constructor Create(AOwner: TComponent);
      procedure Salva;
   end;

implementation

uses
   uFPrincipal, uFConexao;

const
   TipoIntervaloToIndex: array[TUMTipoIntervalo] of integer = (0, 1, 2);
   IndexToTipoIntervalo: array[0..2] of TUMTipoIntervalo = (tiMinuto, tiHora, tiDia);

{$R *.dfm}

{ TfTasy }

procedure TfTasy.AlteraConfiguracao(Sender: TObject);
begin
   fPrincipal.bnDescartar.Enabled := Parent <> nil;
   fPrincipal.bnSalvar.Enabled := Parent <> nil;
end;

procedure TfTasy.bnConnTasyClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcTasyIni.DadosConexaoTasy;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao.Tasy', fUMSvcConfiguracoes.UMSvcTasyIni.IniFile) then
      begin
         fUMSvcConfiguracoes.UMSvcTasyIni.DadosConexaoTasy := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

procedure TfTasy.bnConnUnimestreClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcTasyIni.DadosConexaoUnimestre;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao', fUMSvcConfiguracoes.UMSvcTasyIni.IniFile) then
      begin
         fUMSvcConfiguracoes.UMSvcTasyIni.DadosConexaoUnimestre := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

constructor TfTasy.Create(AOwner: TComponent);
begin
   inherited;
   ckIntervalo.Checked := fUMSvcConfiguracoes.UMSvcTasyIni.IntervaloEntreExecucoes;
   seIntervalo.Value := fUMSvcConfiguracoes.UMSvcTasyIni.Intervalo;
   cbIntervalo.ItemIndex := TipoIntervaloToIndex[fUMSvcConfiguracoes.UMSvcTasyIni.TipoIntervalo];
   seRegistros.Value := fUMSvcConfiguracoes.UMSvcTasyIni.NumRegistrosIteracao;
   ckPessoas.Checked := fUMSvcConfiguracoes.UMSvcTasyIni.GetStatusServico('Pessoa');
end;

procedure TfTasy.Salva;
begin
   fUMSvcConfiguracoes.UMSvcTasyIni.IntervaloEntreExecucoes := ckIntervalo.Checked;
   fUMSvcConfiguracoes.UMSvcTasyIni.Intervalo := seIntervalo.Value;
   fUMSvcConfiguracoes.UMSvcTasyIni.TipoIntervalo := IndexToTipoIntervalo[cbIntervalo.ItemIndex];
   fUMSvcConfiguracoes.UMSvcTasyIni.NumRegistrosIteracao := seRegistros.Value;
   fUMSvcConfiguracoes.UMSvcTasyIni.SetStatusServico(ckPessoas.Checked, 'Pessoa');
end;

end.
