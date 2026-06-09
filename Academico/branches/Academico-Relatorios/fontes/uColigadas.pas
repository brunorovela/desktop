unit uColigadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, Grids, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  uItemCombo;

type
  tpModulo = (ModuloAcademico, ModuloFinanceiro);
  Tfrm_Coligadas = class(TForm)
    Panel3: TPanel;
    Bevel4: TBevel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryColigadas: TUMZQuery;
    dsColigadas: TDataSource;
    qryColigadascd_coligada: TSmallintField;
    qryColigadasnm_coligada: TStringField;
    qryColigadasnm_razao_social: TStringField;
    qryColigadasds_cnpj: TStringField;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Function SelecionarColigada(Modulo : tpModulo) : Smallint;
    Function BuscarNumeroColigada(Modulo : tpModulo ) : SmallInt;
    procedure recarregarParametros();
  end;

var
  frm_Coligadas: Tfrm_Coligadas;
  PrimeiraColigada : Boolean;
  SQLColigadas : string;
implementation

uses uDM,UFLogin, Main;

{$R *.dfm}

{ Tfrm_Coligadas }

Function Tfrm_Coligadas.SelecionarColigada(Modulo : tpModulo) : Smallint;
var
   coligadas: String;
begin
   if (DM.iCdPessoaLogado <> 0 ) then
   begin

      qryColigadas.Close();
         
      qryColigadas.SQL.Text := ' SELECT * FROM coligadas WHERE cd_coligada IN (' + DM.GetTodasColigadas + ') ';

      if (Modulo = ModuloAcademico) then
      begin
       qryColigadas.SQL.Add( ' AND sn_academico = 1 ');
      end;

      if (Modulo = ModuloFinanceiro) then
      begin
       qryColigadas.SQL.Add( ' AND sn_financeiro = 1 ');
      end;

      qryColigadas.SQL.Add(' ORDER BY nm_coligada ');

      qryColigadas.Open();


      if qryColigadas.RecordCount = 1 then begin
       dm.iColigadaSelecionada := qryColigadasCd_Coligada.AsInteger;
       dm.sColigadaSelecionada := qryColigadasnm_coligada.AsString;
       DM.sColigadaSelecionadaRazao := qryColigadasnm_razao_social.AsString;

       Result := Dm.iColigadaSelecionada;

        if DM.lite then
          PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + PrincipalForm.MostraVersao() + ') - LITE'
        else
          PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + PrincipalForm.MostraVersao() + ')';

       Exit;

      end
      else if (qryColigadas.RecordCount > 1) then begin
       // Posicionar na coligada padrão
       qryColigadas.Locate('cd_coligada', IntToStr(DM.iColigadaSelecionada), []);

       if (ShowModal = mrOk) then begin
          dm.iColigadaSelecionada := qryColigadasCd_Coligada.AsInteger;
          dm.sColigadaSelecionada := qryColigadasnm_coligada.AsString;
          DM.sColigadaSelecionadaRazao := qryColigadasnm_razao_social.AsString;

          if Modulo = ModuloAcademico then
             PrincipalForm.iColigadaAcademico := qryColigadasCd_Coligada.AsInteger
          else
             PrincipalForm.iColigadaFinanceiro := qryColigadasCd_Coligada.AsInteger;

          if DM.lite then
            PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + PrincipalForm.MostraVersao() + ') - LITE'
          else
            PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + PrincipalForm.MostraVersao() + ')';
            
          Result := DM.iColigadaSelecionada;

          Exit;

       end;
      end
      else begin // Não existe Coligada Cadastrada para este módulo

       result := -1;

      end;
   end
   else
   begin
      DM.iColigadaSelecionada := 1;
      BitBtn1.Click;
   end;

   // recarrega os parametros necessários da Inicialização

end;

procedure Tfrm_Coligadas.BitBtn1Click(Sender: TObject);
begin
    CloseModal;

    dm.iColigadaSelecionada := qryColigadasCd_Coligada.AsInteger;
    dm.sColigadaSelecionada := qryColigadasnm_coligada.AsString;
    DM.sColigadaSelecionadaRazao := qryColigadasnm_razao_social.AsString;

    PrincipalForm.iColigadaAcademico := qryColigadasCd_Coligada.AsInteger;
    PrincipalForm.iColigadaFinanceiro := qryColigadasCd_Coligada.AsInteger;

    if DM.lite then
      PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + PrincipalForm.MostraVersao() + ') - LITE'
    else
      PrincipalForm.Caption := Application.Title + ' - ' + DM.sColigadaSelecionada+ ' - (' + PrincipalForm.MostraVersao() + ')';      

    if(DM.LogouNaFilha = True) then
    begin
      Dm.ArrayColigadasUsuario.Clear();
      DM.ArrayColigadasUsuario.AddObject(
               IntToStr(DM.iColigadaSelecionada),
               TItemCombo.Create(
                  IntToStr(DM.iColigadaSelecionada),
                  DM.sColigadaSelecionada,
                  '0'));
    end;
    recarregarParametros();
    Exit;
end;

procedure Tfrm_Coligadas.DBGrid1DblClick(Sender: TObject);
begin
    BitBtn1.Click();
end;

procedure Tfrm_Coligadas.recarregarParametros;
begin
   fLogin.carregarPermissoes();
end;

function Tfrm_Coligadas.BuscarNumeroColigada(Modulo: tpModulo): SmallInt;
begin

    qryColigadas.Close();

    qryColigadas.SQL.Text := ' SELECT * FROM coligadas WHERE ';

    if (Modulo = ModuloAcademico) then begin
       qryColigadas.SQL.Add( ' sn_academico = 1 ');
    end;
    if (Modulo = ModuloFinanceiro) then begin
       qryColigadas.SQL.Add( ' sn_financeiro = 1 ');
    end;

    qryColigadas.SQL.Add(' ORDER BY nm_coligada ');

    qryColigadas.Open();

    result := qryColigadas.RecordCount;

end;

end.
