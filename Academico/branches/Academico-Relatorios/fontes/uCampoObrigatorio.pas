unit uCampoObrigatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, CheckLst, ComCtrls, ToolWin, uItemCombo,
  UMComboBox, uDM;

type
  TuCamposObrigatorios = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    dsCadastro: TDataSource;
    RadioListar: TRadioGroup;
    qryCadastroObrigatorio: TUMZQuery;
    qryCampoObrigatorio: TUMZQuery;
    dsCampo: TDataSource;
    qryCampoObrigatoriocd_cadastro_campo: TIntegerField;
    qryCampoObrigatoriocd_cadastro: TIntegerField;
    qryCampoObrigatorionm_campo: TStringField;
    qryCampoObrigatoriods_chave: TStringField;
    qryCampoObrigatorionr_ordem: TIntegerField;
    qryCampoObrigatoriosn_obrigatorio: TSmallintField;
    CheckCampos: TCheckListBox;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    qryCampoObrigatoriosn_opcional: TSmallintField;
    qryCadastroObrigatoriocd_cadastro: TIntegerField;
    qryCadastroObrigatorionm_cadastro: TStringField;
    qryCadastroObrigatoriods_chave: TStringField;
    qryCadastroObrigatoriosn_ativo_validacao: TSmallintField;
    ComboCadastro: TUMComboBox;
    procedure ComboCadastroChange(Sender: TObject);
    procedure CheckCamposClickCheck(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioListarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure verificaAfrica;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uCamposObrigatorios: TuCamposObrigatorios;

implementation

{$R *.dfm}

procedure TuCamposObrigatorios.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TuCamposObrigatorios.CheckCamposClickCheck(Sender: TObject);
var
   i: integer;
begin

   for i := 0 to CheckCampos.Count - 1 do
   begin
      qryCampoObrigatorio.Locate('cd_cadastro_campo', StrToInt(TItemCombo(CheckCampos.Items.Objects[i]).getCodigo), []);
      qryCampoObrigatorio.Edit;

      if CheckCampos.Checked[i] then
      begin
         qryCampoObrigatoriosn_obrigatorio.asInteger := 1
      end
      else
      begin
         qryCampoObrigatoriosn_obrigatorio.asInteger := 0;
      end;

      qryCampoObrigatorio.Post;
   end;
end;

procedure TuCamposObrigatorios.ComboCadastroChange(Sender: TObject);
begin
   RadioListar.OnClick(self);
end;

procedure TuCamposObrigatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryCadastroObrigatorio.Close;
   qryCampoObrigatorio.Close;
   Action := caFree;

end;

procedure TuCamposObrigatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if (Key = VK_F12) then
   begin
      close;
   end;

end;

procedure TuCamposObrigatorios.FormShow(Sender: TObject);
begin

   //Este procedimento verificará se o cliente é da áfrica ou não,
   //exibindo apenas os cadastros específicos de cada cliente.
   verificaAfrica;

   qryCadastroObrigatorio.Active := true;
   qryCampoObrigatorio.Active := true;

   while not(qryCadastroObrigatorio.Eof) do
   begin
      ComboCadastro.Items.AddObject(
         qryCadastroObrigatorionm_cadastro.asString, TItemCombo.Create(
         IntToStr(qryCadastroObrigatoriocd_cadastro.AsInteger),
         qryCadastroObrigatorionm_cadastro.asString
      ));

      qryCadastroObrigatorio.Next;
   end;

   ComboCadastro.ItemIndex:=0;

   RadioListar.ItemIndex := 0;
end;

procedure TuCamposObrigatorios.RadioListarClick(Sender: TObject);
var
   contador : Integer;
begin
   contador := 0;
   qryCampoObrigatorio.Close;

   if RadioListar.ItemIndex = 0 then
   begin
     qryCampoObrigatorio.SQL.Text := 'SELECT * FROM nu_cadastro_obrigatorio_campo '+
     'WHERE sn_visivel = 0 and cd_cadastro = :cd_cadastro ' +
     'order by nr_ordem';
   end
   else begin
     qryCampoObrigatorio.SQL.Text := 'SELECT * FROM nu_cadastro_obrigatorio_campo '+
     'WHERE sn_visivel = 0 and cd_cadastro = :cd_cadastro '+
     'order by nm_campo';
   end;

   qryCampoObrigatorio.ParamByName('cd_cadastro').AsInteger := StrToInt(TItemCombo(ComboCadastro.Items.Objects[ComboCadastro.ItemIndex]).getCodigo);

   qryCampoObrigatorio.Open;

   CheckCampos.Clear;

   while not(qryCampoObrigatorio.Eof) do
   begin
      CheckCampos.Items.AddObject(qryCampoObrigatorionm_campo.asString, TItemCombo.Create(
      IntToStr(qryCampoObrigatoriocd_cadastro_campo.AsInteger),
      qryCampoObrigatorionm_campo.asString
         ));

      if qryCampoObrigatoriosn_obrigatorio.AsInteger = 1 then
      begin
         CheckCampos.Checked[contador] := True;
      end;

      if (qryCampoObrigatoriosn_opcional.AsInteger = 0 )then
      begin
         CheckCampos.ItemEnabled[contador] := False;
      end;
      
      contador:= contador + 1;
      qryCampoObrigatorio.Next;
   end;
end;

procedure TuCamposObrigatorios.verificaAfrica;
var
   i: Integer;
   qryAux: TUMZquery;
begin
   Dm.CriarConsulta(qryAux);

   qryAux.SQL.Text := ' SELECT ds_valor '+
                      ' FROM parametros '+
                      ' WHERE ds_variavel = "sn_africa"';
   qryAux.Open;

   if (qryAux.FieldByName('ds_valor').AsString = 'N') then
   begin
      qryAux.SQL.Text:= ' UPDATE nu_cadastro_obrigatorio '+
                        ' SET sn_ativo_validacao = 0 '+
                        ' WHERE cd_cadastro IN (21,22,23,24,25,26,'+
                        '27,28,29,30,31,32,33,34,35,36,37,38)';
      qryAux.ExecSQL;

      qryAux.SQL.Text:= ' UPDATE nu_cadastro_obrigatorio '+
                        ' SET sn_ativo_validacao = 1 '+
                        ' WHERE cd_cadastro IN (1,2,3,4,5,6,7,8,9,'+
                        '10,11,12,13,14,15,16,17,18, 19, 20)';
      qryAux.ExecSQL;

   end
   else
   begin
      qryAux.SQL.Text:= ' UPDATE nu_cadastro_obrigatorio '+
                        ' SET sn_ativo_validacao = 0 '+
                        ' WHERE cd_cadastro IN (1,2,3,4,5,6,7,8,9,'+
                        '10,11,12,13,14,15,16,17,18, 19, 20)';
      qryAux.ExecSQL;

      qryAux.SQL.Text:= ' UPDATE nu_cadastro_obrigatorio '+
                        ' SET sn_ativo_validacao = 1 '+
                        ' WHERE cd_cadastro IN (21,22,23,24,25,26,'+
                        '27,28,29,30,31,32,33,34,35,36,37,38)';
      qryAux.ExecSQL;

      qryAux.SQL.Text:= ' UPDATE nu_cadastro_obrigatorio ' +
                        ' SET nm_cadastro = replace( nm_cadastro, "África ", "" )';
      qryAux.ExecSQL;
   end;
end;

end.
