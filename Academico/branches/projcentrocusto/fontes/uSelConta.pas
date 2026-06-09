unit uSelConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus,
  Buttons, uULancamentos;

type
   Tfrm_SelConta = class(TForm)
    qyPlanosContas: TUMZQuery;
    srcPlanosContas: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    edClassificacao: TEdit;
    pmQtd: TPopupMenu;
    Label1: TLabel;
    edDescricao: TEdit;
    btnFechar: TSpeedButton;
    btnConfirmar: TBitBtn;
    qyPlanosContasCD_CONTA: TLargeintField;
    qyPlanosContasDS_CONTA: TStringField;
    qyPlanosContasCD_CLASSIFICACAO: TStringField;
    qyPlanosContasCD_APROPRIACAO: TIntegerField;
    qyPlanosContasTP_CONTA: TIntegerField;
    qyPlanosContasTP_ENTRADA_SAIDA: TIntegerField;
    qyPlanosContasSN_ATIVO: TSmallintField;
    qyPlanosContasCD_CONTA_CONTABIL: TStringField;
    qyPlanosContasCD_CLASS1: TIntegerField;
    qyPlanosContasCD_CLASS2: TIntegerField;
    qyPlanosContasCD_CLASS3: TIntegerField;
    qyPlanosContasCD_CLASS4: TIntegerField;
    qyPlanosContasCD_CLASS5: TIntegerField;
    qyPlanosContasCD_CLASS6: TIntegerField;
    qyPlanosContasCD_CLASS7: TIntegerField;
    qyPlanosContasCD_CLASS8: TIntegerField;
    qyPlanosContasCD_CLASS9: TIntegerField;
    qyPlanosContasCD_GRUPO_PRINCIPAL: TIntegerField;
    qyPlanosContasCD_CRITERIO: TLargeintField;
    qyPlanosContasSN_CUSTEIO: TSmallintField;
    qyPlanosContasDS_FORMULA_CALCULO: TStringField;
    qyPlanosContasCD_GRUPO_CUSTEIO: TLargeintField;
    qyPlanosContasDS_OBSERVACAO: TMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edClassificacaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    class var TipoConta: TTiposConta;
  public
  
    flgSearch,
    SomenteAnalitico,
    buscaTudo: Boolean;
    
    class procedure setTipoConta(TipoConta: TTiposConta);
  end;

var
  frm_SelConta: Tfrm_SelConta;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_SelConta.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_SelConta.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_SelConta.btnConfirmarClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_SelConta.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_SelConta.edClassificacaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin

    if edClassificacao.Text = '' then
       edDescricao.SetFocus()
    else
       grd.SetFocus;
       
    Filtra();

    Key := #0;
  end;
end;

procedure Tfrm_SelConta.edDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin

    if edDescricao.Text = '' then
       edClassificacao.SetFocus()
    else
       grd.SetFocus;
       
    Filtra();

    Key := #0;
  end;
end;

procedure Tfrm_SelConta.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_SelConta.FormShow(Sender: TObject);
var
   i: Integer;
begin
   { Parâmetros do usuário }
   DM.Parametros_usuario(TForm(Sender));

   Filtra();

   edClassificacao.SetFocus;
end;

procedure Tfrm_SelConta.Filtra();
begin
   qyPlanosContas.Close;
   qyPlanosContas.SQL.Clear;
   qyPlanosContas.SQL.Add(' SELECT                                       ');
   qyPlanosContas.SQL.Add('    *                                          ');
   qyPlanosContas.SQL.Add(' FROM                                         ');
   qyPlanosContas.SQL.Add('  fin_config_plano_contas                           ');

   qyPlanosContas.SQL.Add(Format(' WHERE cd_coligada_matriz = %d', [DM.GetUsuarioLogado.GetColigadaLogada.Codigo]));
   qyPlanosContas.SQL.Add('  AND sn_ativo = 1 ');

   if edClassificacao.Text <> '' then
   begin
      qyPlanosContas.SQL.Add('   AND cd_classificacao LIKE :cd_classificacao  ');
      qyPlanosContas.ParamByName('cd_classificacao').AsString := edClassificacao.Text + '%';
   end;

   if Self.TipoConta = tcAtivo then
   begin
      qyPlanosContas.SQL.Add(' AND cd_grupo_contas = 2 ');
   end;

   if Self.TipoConta = tcResultado then
   begin
      qyPlanosContas.SQL.Add(' AND cd_grupo_contas = 4 ');
   end;

   if edDescricao.Text <> '' then
   begin
      qyPlanosContas.SQL.Add('   AND ds_conta LIKE :ds_conta                  ');
      qyPlanosContas.ParamByName('ds_conta').AsString := '%' + edDescricao.Text + '%';
   end;

   if Self.SomenteAnalitico then
   begin
      qyPlanosContas.SQL.Add('   AND tp_conta = 1 ');
   end;

   qyPlanosContas.SQL.Add('ORDER BY                                    ');
   qyPlanosContas.SQL.Add('   cd_classificacao                         ');

   qyPlanosContas.Open();
end;

procedure Tfrm_SelConta.pmQtdPopup(Sender: TObject);
begin

  DM.quantidade_registros(qyPlanosContas, pmQtd);

end;

class procedure Tfrm_SelConta.setTipoConta(TipoConta: TTiposConta);
begin
   Self.TipoConta := TipoConta;
end;

procedure Tfrm_SelConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Self.TipoConta := tcOutro;
   Self.SomenteAnalitico := false;
end;

procedure Tfrm_SelConta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (flgSearch = true) AND
      (
         (qyPlanosContastp_conta.AsInteger = 2) and
         not(buscaTudo)
      )
   then
   begin
      Mensagem('Atenção' + CHR(13) + CHR(13) + 'Não é possível selecionar uma conta Sintética para efetuar lançamentos', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      CanClose := false;
   end
   else
   begin
      DM.Set_Parametros_usuario(TForm(Sender));
      CanClose := True;
   end;

   Self.buscaTudo := False;
end;

procedure Tfrm_SelConta.FormCreate(Sender: TObject);
begin
   Self.TipoConta := tcOutro;
   Self.buscaTudo := False;
end;

procedure Tfrm_SelConta.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

end.

