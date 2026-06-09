unit uFBorges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Spin, uSvcConfClasses, Buttons;

type
   TfBorges = class(TFrame)
   published
      gbConfig: TGroupBox;
      lbIntervalo: TLabel;
      lbRegistros: TLabel;
      cbIntervalo: TComboBox;
      ckIntervalo: TCheckBox;
      seIntervalo: TSpinEdit;
      seRegistros: TSpinEdit;
      gbServicos: TGroupBox;
      ckPessoas: TCheckBox;
      ckBibMultas: TCheckBox;
      gbConexao: TGroupBox;
      bnConnBorges: TSpeedButton;
      bnConnCOC: TSpeedButton;
      bnConnDecisao: TSpeedButton;
      procedure bnConnDecisaoClick(Sender: TObject);
      procedure bnConnCOCClick(Sender: TObject);
      procedure bnConnBorgesClick(Sender: TObject);
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

{ TfBorges }

procedure TfBorges.AlteraConfiguracao(Sender: TObject);
begin
   fPrincipal.bnDescartar.Enabled := Parent <> nil;
   fPrincipal.bnSalvar.Enabled := Parent <> nil;
end;

procedure TfBorges.bnConnBorgesClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.DadosConexaoBorges;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao.Borges', fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.IniFile) then
      begin
         fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.DadosConexaoBorges := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

procedure TfBorges.bnConnCOCClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.DadosConexaoCOC;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao.COC', fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.IniFile) then
      begin
         fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.DadosConexaoCOC := LSlDadosConn;
         fPrincipal.bnDescartar.Enabled := Parent <> nil;
         fPrincipal.bnSalvar.Enabled := Parent <> nil;
      end;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

procedure TfBorges.bnConnDecisaoClick(Sender: TObject);
var
   LSlDadosConn: TStringList;
begin
   LSlDadosConn := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.DadosConexaoDecisao;
   try
      if TfConexao.GetDadosConexao(Self, LSlDadosConn, 'Conexao.Decisao', fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.IniFile) then
         fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.DadosConexaoDecisao := LSlDadosConn;
   finally
      FreeAndNil(LSlDadosConn);
   end;
end;

constructor TfBorges.Create(AOwner: TComponent);
begin
   inherited;
   ckIntervalo.Checked := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.IntervaloEntreExecucoes;
   seIntervalo.Value := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.Intervalo;
   cbIntervalo.ItemIndex := TipoIntervaloToIndex[fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.TipoIntervalo];
   seRegistros.Value := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.NumRegistrosIteracao;
   ckPessoas.Checked := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.GetStatusServico('Pessoa');
   ckBibMultas.Checked := fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.GetStatusServico('BibMultas');
end;

procedure TfBorges.Salva;
begin
   fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.IntervaloEntreExecucoes := ckIntervalo.Checked;
   fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.Intervalo := seIntervalo.Value;
   fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.TipoIntervalo := IndexToTipoIntervalo[cbIntervalo.ItemIndex];
   fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.NumRegistrosIteracao := seRegistros.Value;
   fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.SetStatusServico(ckPessoas.Checked, 'Pessoa');
   fUMSvcConfiguracoes.UMSvcBorgesMendoncaIni.SetStatusServico(ckBibMultas.Checked, 'BibMultas');
end;

end.
