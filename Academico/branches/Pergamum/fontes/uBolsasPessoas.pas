unit uBolsasPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, DBCtrls, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ZConnection, StdCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, Buttons, uDM;

type
  TFiltro = (fEstudante, fResponsavel, fBolsa, Nenhum, Todos);
  TFrmBolsasPessoas = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    ImageList2: TImageList;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Splitter1: TSplitter;
    bgCheques: TDBGrid;
    qyBolsasPessoas: TUMZQuery;
    dsBolsasPessoas: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    qyBolsasTipos: TUMZQuery;
    qyBolsasTiposds_bolsa: TStringField;
    qyBolsasTiposvl_fixo_sugerido: TFloatField;
    qyBolsasTiposvl_perc_sugerido: TFloatField;
    DBLookupComboBox1: TDBLookupComboBox;
    qyBolsasPessoasdt_inicio: TDateTimeField;
    qyBolsasPessoasdt_termino: TDateTimeField;
    qyBolsasPessoasvl_percentual: TFloatField;
    qyBolsasPessoasvl_fixo: TFloatField;
    qyBolsasPessoasds_historico: TStringField;
    qyPessoas: TUMZQuery;
    qyPessoasnm_pessoa: TStringField;
    qyBolsasPessoasNmAluno: TStringField;
    qyBolsasPessoasNmResp: TStringField;
    qyBolsasPessoasdescBolsa: TStringField;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    DBNavigator2: TDBNavigator;
    ToolButton5: TToolButton;
    btIncluir: TToolButton;
    btAlterar: TToolButton;
    btExcluir: TToolButton;
    ToolButton10: TToolButton;
    btSalvar: TToolButton;
    btCancelar: TToolButton;
    ToolButton13: TToolButton;
    btFechar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    sbAluno: TSpeedButton;
    sbResp: TSpeedButton;
    qyBolsasPessoascd_bolsa_pessoa: TIntegerField;
    qyBolsasPessoascd_bolsa: TIntegerField;
    qyBolsasPessoascd_aluno: TLargeintField;
    qyBolsasPessoascd_resp: TLargeintField;
    qyBolsasTiposcd_bolsa: TIntegerField;
    qyBolsasTipossn_gratuidade: TSmallintField;
    qyPessoascd_pessoa: TIntegerField;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure sbRespClick(Sender: TObject);
    procedure sbAlunoClick(Sender: TObject);
    procedure dsBolsasPessoasStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Filtrar();
  public
    { Public declarations }
  end;

var
  FrmBolsasPessoas: TFrmBolsasPessoas;
  FiltroAtual : TFiltro;
  iCodigoAtual : Integer;

implementation

uses uFSelecionarPessoa, Main;

{$R *.dfm}

procedure TFrmBolsasPessoas.btAlterarClick(Sender: TObject);
begin

   DBEdit1.SetFocus();
   qyBolsasPessoas.Edit();

end;

procedure TFrmBolsasPessoas.btCancelarClick(Sender: TObject);
begin

   qyBolsasPessoas.Cancel;
   Filtrar();


end;

procedure TFrmBolsasPessoas.btExcluirClick(Sender: TObject);
begin
  if Mensagem('Deseja realmente excluir a bolsa/convênio selecionada?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then begin

     Exit;

  end else begin

     qyBolsasPessoas.Delete();
     Filtrar();
  
  end;
end;

procedure TFrmBolsasPessoas.btFecharClick(Sender: TObject);
begin

   Close();

end;

procedure TFrmBolsasPessoas.btIncluirClick(Sender: TObject);
begin

   DBEdit1.SetFocus();
   qyBolsasPessoas.Insert();

end;

procedure TFrmBolsasPessoas.btSalvarClick(Sender: TObject);
begin

   qyBolsasPessoas.Post();
   Filtrar();


end;

procedure TFrmBolsasPessoas.dsBolsasPessoasStateChange(Sender: TObject);
begin
  btIncluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TFrmBolsasPessoas.Filtrar;
Var
  pPos : Pointer;
begin
   // Atualizar grade e posicionar o cursos

   pPos := qyBolsasPessoas.GetBookmark();

   if qyBolsasPessoas.UpdatesPending then begin

      qyBolsasPessoas.ApplyUpdates();

   end;
   
   qyBolsasPessoas.Close();

   // Aplicar o Filtro;

   qyBolsasPessoas.SQL.Text :=
    ' SELECT * FROM fin_bolsas_pessoas bp ';

   if FiltroAtual = fEstudante then begin

      qyBolsasPessoas.SQL.Add(' WHERE cd_aluno = ' + IntToStr(iCodigoAtual) );

   end else if FiltroAtual = fResponsavel then begin

      qyBolsasPessoas.SQL.Add(' WHERE cd_resp = ' + IntToStr(iCodigoAtual) );

   end;

   qyBolsasPessoas.SQL.Add(' ORDER By cd_bolsa_pessoa DESC ');
   qyBolsasPessoas.Open();

   if pPos <> nil then begin

       if qyBolsasPessoas.BookmarkValid(pPos) then begin

          qyBolsasPessoas.GotoBookmark(pPos);

       end;
       
   end;
   
end;


procedure TFrmBolsasPessoas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   Action := caFree;

end;

procedure TFrmBolsasPessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btIncluirClick( nil );
    VK_F3 : btAlterarClick( nil );
    VK_F9 : btExcluirClick( nil );
    VK_F5 : btSalvarClick( nil );
    VK_F6 : btCancelarClick( nil );
    VK_F12 : btFecharClick( nil );
  end;

end;

procedure TFrmBolsasPessoas.FormShow(Sender: TObject);
begin

   qyBolsasTipos.Close();
   qyBolsasTipos.Open();

   qyPessoas.Close();
   qyPessoas.Open();

   FiltroAtual := Todos;

   Filtrar();

end;

procedure TFrmBolsasPessoas.sbAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
     qyBolsasPessoascd_aluno.AsInteger := resultado_filtro.cd_pessoa;
   end
   else Exit;
end;

procedure TFrmBolsasPessoas.sbRespClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
     qyBolsasPessoascd_resp.AsInteger := resultado_filtro.cd_pessoa;
   end
   else Exit;
end;

procedure TFrmBolsasPessoas.ToolButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      iCodigoAtual := resultado_filtro.cd_pessoa;
      FiltroAtual := fEstudante;
      Filtrar();
   end
   else Exit;
end;

procedure TFrmBolsasPessoas.ToolButton2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
     iCodigoAtual := resultado_filtro.cd_pessoa;
     FiltroAtual := fResponsavel;
     Filtrar();
   end
   else Exit;
end;

procedure TFrmBolsasPessoas.ToolButton4Click(Sender: TObject);
begin

   FiltroAtual := fBolsa;
   Filtrar();
   
end;

end.

