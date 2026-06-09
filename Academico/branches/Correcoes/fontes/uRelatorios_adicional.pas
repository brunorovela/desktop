unit uRelatorios_adicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, StdCtrls, Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_relatorios_adicional = class(TForm)
    Panel1: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    sxDados: TScrollBox;
    qyCampos: TUMZQuery;
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tela: String;
    procedure carregar_campos(cd_relatorio: integer);
    procedure busca_campo_valor(ds_variaveis: string);
    function cria_campo(variavel, valor:String; iTopo: Integer):Integer;
  end;

var
  frm_relatorios_adicional: Tfrm_relatorios_adicional;

implementation

uses uDM, uRelatorios, urelatorios_financeiros, urelatorios_cp;

{$R *.dfm}

{ Tfrm_relatorios_adicional }

procedure Tfrm_relatorios_adicional.carregar_campos(cd_relatorio: integer);
begin
   { Função responsável por criar os campos adicionais do relatório }
   with Self.qyCampos do
   begin
      ParamByName( 'cd_relatorio' ).AsInteger := cd_relatorio;
      try
         Open;
         busca_campo_valor( FieldByName( 'ds_variaveis' ).AsString );
         Close;
         ShowModal;
      except
         on e:exception do
            ShowMessage('Não foi possível carregar os campos adicionais do Relatório.');
      end;
   end;

end;

function Tfrm_relatorios_adicional.cria_campo(variavel, valor: String; iTopo: Integer):Integer;
begin
   with TLabel.Create(sxDados) do
   Begin
      Parent   := sxDados;
      Left     := 5;
      Width    := 625;
      Top      := iTopo;
      Name     := 'lb_'+variavel;

      Caption  := valor;
      WordWrap := True;
   End;

   With TMemo.Create(sxDados) do
   Begin
      Parent  := sxDados;
      Left    := 5;
      Top     := iTopo+15;
      Text    := '';
      Width   := 610;
      Height  := 50;
      Name    := 'mm_'+variavel;
      Text    := '';
      Tag     := 0;

   End;

   result := iTopo + 50 + 20;
end;

procedure Tfrm_relatorios_adicional.btCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_relatorios_adicional.btConfirmarClick(Sender: TObject);
var
   i: integer;
   sAux: String;
begin
   for i:= 0 to sxDados.ComponentCount - 1 do
   Begin
       { verificar se o componente é um Memo }
       if sxDados.Components[i] is TMemo then
       Begin
         sAux := TMemo(sxDados.Components[i]).Name;
         Delete(sAux, 1, Pos('_', sAux));

         if(tela = 'academico_relatorios')then
         begin
            frm_Relatorios.CamposAdicionaisRelatorio.Add(sAux+'="'+StringReplace(TMemo(sxDados.Components[i]).Text, #$D#$A, '<BR>', [rfReplaceAll])+'"');
         end else if(tela = 'financeiro_contas_receber')then
         begin
            frm_relatorios_financeiros.CamposAdicionaisRelatorio.Add(sAux+'="'+StringReplace(TMemo(sxDados.Components[i]).Text, #$D#$A, '<BR>', [rfReplaceAll])+'"');
         end else if(tela = 'financeiro_conta_pg-gerenciais')then
         begin
            frm_relatorios_cp.CamposAdicionaisRelatorio.Add(sAux+'="'+StringReplace(TMemo(sxDados.Components[i]).Text, #$D#$A, '<BR>', [rfReplaceAll])+'"');
         end;
       End;
   End;
end;

procedure Tfrm_relatorios_adicional.busca_campo_valor(ds_variaveis: string);
var
   arrCampos: TStringList;
   variavel, variavel_valor: String;
   i, iTopo: integer;
begin
   { Função que irá criar os campos }
   arrCampos := TStringList.Create();
   iTopo := 5;

   SplitString(ds_variaveis, ';', arrCampos);

   for i := 0 to arrCampos.Count - 1 do
   begin
      if(Trim(arrCampos[i]) <> '')then
      begin
         variavel := arrCampos[i];
         Delete(variavel, Pos('=', variavel), Length(variavel));

         variavel_valor := arrCampos[i];
         Delete(variavel_valor, 1, Pos('=', arrCampos[i]));
         Delete(variavel_valor, 1, 1);
         Delete(variavel_valor, Length(variavel_valor), Length(variavel_valor));

         iTopo := cria_campo(variavel, variavel_valor, iTopo);
      end;
   end;

   arrCampos.Free;
end;

end.

