unit uFBiblioshop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Spin, Buttons;

type
   TfBiblioshop = class(TFrame)
   published
      gbConexao: TGroupBox;
      bnConnUnimestre: TSpeedButton;
      bnConnBiblioShop: TSpeedButton;
      lbIntervalo: TLabel;
      cbIntervalo: TComboBox;
      ckIntervalo: TCheckBox;
      lbRegistros: TLabel;
      seIntervalo: TSpinEdit;
      seRegistros: TSpinEdit;
      gbConfig: TGroupBox;
      gbServicos: TGroupBox;
      ckPessoas: TCheckBox;
      procedure AlteraConfiguracao(Sender: TObject);
      procedure bnConnBiblioShopClick(Sender: TObject);
      procedure bnConnUnimestreClick(Sender: TObject);
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

{ TfBiblioshop }

procedure TfBiblioshop.AlteraConfiguracao(Sender: TObject);
begin
   fPrincipal.bnDescartar.Enabled := Parent <> nil;
   fPrincipal.bnSalvar.Enabled := Parent <> nil;
end;

procedure TfBiblioshop.bnConnBiblioShopClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcBiblioshopIni.DadosConexaoBiblioShop;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao.Biblioshop', fUMSvcConfiguracoes.UMSvcBiblioshopIni.IniFile) then
      begin
         fUMSvcConfiguracoes.UMSvcBiblioshopIni.DadosConexaoBiblioShop := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

procedure TfBiblioshop.bnConnUnimestreClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcBiblioshopIni.DadosConexaoUnimestre;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao', fUMSvcConfiguracoes.UMSvcBiblioshopIni.IniFile ) then
      begin
         fUMSvcConfiguracoes.UMSvcBiblioshopIni.DadosConexaoUnimestre := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

constructor TfBiblioshop.Create(AOwner: TComponent);
begin
   inherited;
   ckIntervalo.Checked := fUMSvcConfiguracoes.UMSvcBiblioshopIni.IntervaloEntreExecucoes;
   seIntervalo.Value := fUMSvcConfiguracoes.UMSvcBiblioshopIni.Intervalo;
   cbIntervalo.ItemIndex := TipoIntervaloToIndex[fUMSvcConfiguracoes.UMSvcBiblioshopIni.TipoIntervalo];
   seRegistros.Value := fUMSvcConfiguracoes.UMSvcBiblioshopIni.NumRegistrosIteracao;
   ckPessoas.Checked := fUMSvcConfiguracoes.UMSvcBiblioshopIni.GetStatusServico('Pessoas');
end;

procedure TfBiblioshop.Salva;
begin
   fUMSvcConfiguracoes.UMSvcBiblioshopIni.IntervaloEntreExecucoes := ckIntervalo.Checked;
   fUMSvcConfiguracoes.UMSvcBiblioshopIni.Intervalo := seIntervalo.Value;
   fUMSvcConfiguracoes.UMSvcBiblioshopIni.TipoIntervalo := IndexToTipoIntervalo[cbIntervalo.ItemIndex];
   fUMSvcConfiguracoes.UMSvcBiblioshopIni.NumRegistrosIteracao := seRegistros.Value;
   fUMSvcConfiguracoes.UMSvcBiblioshopIni.SetStatusServico(ckPessoas.Checked, 'Pessoas');
end;

end.
