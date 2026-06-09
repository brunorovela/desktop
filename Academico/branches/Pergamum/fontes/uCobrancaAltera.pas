unit uCobrancaAltera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZConnection, StdCtrls, DBCtrls, Mask, Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
  TfrmCobrancaAltera = class(TForm)
    Panel3: TPanel;
    Bevel6: TBevel;
    qyCobranca: TUMZQuery;
    dtcCobranca: TDataSource;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    qyResposaveis: TUMZQuery;
    qyCobrancadsResposaveis: TStringField;
    qySituacoes: TUMZQuery;
    qyCobrancadsSituacoes: TStringField;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    qyCobrancaCD_COBRANCA: TLargeintField;
    qyCobrancaDT_REGISTRO: TDateTimeField;
    qyCobrancaCD_SITUACAO: TLargeintField;
    qyCobrancaSN_SPC: TSmallintField;
    qyCobrancaDT_SPC_INCLUSAO: TDateTimeField;
    qyCobrancaDT_SPC_RETIRADA: TDateTimeField;
    qyCobrancaSN_JURIDICO: TSmallintField;
    qyCobrancaDT_JURIDICO_INCLUSAO: TDateTimeField;
    qyCobrancaDT_JURIDICO_RETIRADA: TDateTimeField;
    qyCobrancaCD_RESPONSAVEL: TLargeintField;
    qyCobrancaDT_RETORNO: TDateTimeField;
    qySituacoesCODIGO: TLargeintField;
    qySituacoesCD_MODULO: TLargeintField;
    qySituacoesCD_SITUACAO: TIntegerField;
    qySituacoesDS_VALOR: TStringField;
    qySituacoesDS_SIGLA: TStringField;
    qySituacoesCD_AUXILIAR: TLargeintField;
    qySituacoesME_DESCRICAO: TMemoField;
    qyResposaveisCODIGO: TIntegerField;
    qyResposaveisNM_USUARIO: TStringField;
    dbchSerasa: TDBCheckBox;
    qyCobrancaSN_SERASA: TSmallintField;
    qyCobrancaDT_SERASA_INCLUSAO: TDateTimeField;
    qyCobrancaDT_SERASA_RETIRADA: TDateTimeField;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    qyCobrancaCD_PESSOA: TIntegerField;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    dbCartorio: TDBCheckBox;
    qyCobrancaSN_CARTORIO: TSmallintField;
    qyCobrancaDT_CARTORIO_INCLUSAO: TDateTimeField;
    qyCobrancaDT_CARTORIO_RETIRADA: TDateTimeField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iCobranca : Integer;
  end;

var
  frmCobrancaAltera: TfrmCobrancaAltera;

implementation

uses uCobranca, uUsuario;

{$R *.dfm}

procedure TfrmCobrancaAltera.btCancelarClick(Sender: TObject);
begin

   qyCobranca.Cancel();
   Close();
end;

procedure TfrmCobrancaAltera.btConfirmarClick(Sender: TObject);
var
   Bookmark: TBookmark;
   I: Integer;
begin
   if qyCobranca.State in [dsInsert, dsEdit] then
   begin
      if qyCobrancaCD_RESPONSAVEL.OldValue <> qyCobrancaCD_RESPONSAVEL.AsInteger then
      begin
         if qyCobrancaCD_RESPONSAVEL.OldValue = Null then
            I := 0
         else
            I := qyCobrancaCD_RESPONSAVEL.OldValue;
         
         DM.setLog(2053, 'alteracao',
            Format('%d;%d;%d', [
               qyCobrancaCD_COBRANCA.AsInteger, I,
               qyCobrancaCD_RESPONSAVEL.AsInteger]),
            DM.UsuarioLogado.ColigadaLogada,
            'Alteração do responsável do registro de cobrança'
         );
      end;
      qyCobranca.Post;
   end;
   Close;
   Bookmark := frmCobranca.qyCobranca.GetBookmark;
   frmCobranca.qyCobranca.DisableControls;
   frmCobranca.Filtrar;
   if frmCobranca.qyCobranca.BookmarkValid(Bookmark) then
      frmCobranca.qyCobranca.GotoBookmark(Bookmark);
   frmCobranca.qyCobranca.EnableControls;
end;

procedure TfrmCobrancaAltera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCobrancaAltera.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ( Key = VK_ESCAPE) then
   begin
      btCancelarClick(nil);
   end;
end;

procedure TfrmCobrancaAltera.FormShow(Sender: TObject);
begin
   if iCobranca = 0 then Close();

   qyCobrancaCD_RESPONSAVEL.ReadOnly := not DM.UsuarioLogado.TemPermissao(
      DM.iCdPessoaLogado,
      'UMFinanceiro.Recebimentos.Cobranca.Responsavel',
      npAcesso,
      False
   );

   DBLookupComboBox1.Enabled := not qyCobrancaCD_RESPONSAVEL.ReadOnly;

   qyCobranca.Close();
   qyCobranca.ParamByName('cd_cobranca').AsInteger := iCobranca;
   qyCobranca.Open();

   if not ( DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'UMFinanceiro.Recebimentos.Cobranca.Responsavel', npAlterar, false)) then
   begin
      qyResposaveis.SQL.ADD(' AND US.CD_PESSOA = ' + intToStr(DM.iCdPessoaLogado));
   end;

   if ( qyCobrancaCD_RESPONSAVEL.AsString = '' ) then begin
      qyCobrancaCD_RESPONSAVEL.ReadOnly := NOT DM.UsuarioLogado.TemPermissao(
         DM.iCdPessoaLogado,
         'UMFinanceiro.Recebimentos.Cobranca.Responsavel',
         npIncluir,
         False
      );
      
      DBLookupComboBox1.Enabled :=  NOT qyCobrancaCD_RESPONSAVEL.ReadOnly;
   end
   else
   begin
      qyCobrancaCD_RESPONSAVEL.ReadOnly := NOT DM.UsuarioLogado.TemPermissao(
         DM.iCdPessoaLogado,
         'UMFinanceiro.Recebimentos.Cobranca.Responsavel',
         npAlterar,
         False
      );
      
      DBLookupComboBox1.Enabled :=  NOT qyCobrancaCD_RESPONSAVEL.ReadOnly;
   end;

   qyCobranca.Close();
   qyCobranca.ParamByName('cd_cobranca').AsInteger := iCobranca;
   qyCobranca.Open();

   qyCobranca.Edit();

   if dbCartorio.State = cbGrayed then
   begin
      dbCartorio.State := cbUnchecked;
   end;
end;

end.

