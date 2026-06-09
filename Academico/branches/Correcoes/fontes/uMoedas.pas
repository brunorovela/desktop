unit uMoedas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, ZConnection, StdCtrls, Mask,
  DBCtrls, Grids, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfMoedas = class(TForm)
    Panel3: TPanel;
    Bevel1: TBevel;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    tcCotacoes: TTabControl;
    Panel1: TPanel;
    Bevel5: TBevel;
    qyCotacoes: TUMZQuery;
    qyCotacoesdt_cotacao: TDateTimeField;
    qyCotacoesvl_moeda_cota: TFloatField;
    qyMoedasBase: TUMZQuery;
    qyMoedasBaseds_moeda: TStringField;
    qyMoedasBaseds_sigla: TStringField;
    qyCotacoesdsMoedaBase: TStringField;
    qyMoedasCambio: TUMZQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qyCotacoesdsMoedaCambio: TStringField;
    dsCotacoes: TDataSource;
    Label1: TLabel;
    dbMoedaBase: TDBLookupComboBox;
    Label2: TLabel;
    dbMoedaCambio: TDBLookupComboBox;
    Label3: TLabel;
    dbData: TDBEdit;
    Label4: TLabel;
    dbValor: TDBEdit;
    DBGrid1: TDBGrid;
    qyMoedasBasecd_moeda: TLargeintField;
    qyMoedasCambiocd_moeda: TLargeintField;
    qyCotacoescd_moeda_base: TLargeintField;
    qyCotacoescd_moeda_cota: TLargeintField;
    qyCotacoesID_COTACOES: TLargeintField;
    procedure dsCotacoesStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbMoedaBaseKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure tcCotacoesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    aCodMoedas : Array of Integer;
    iMoeda : Integer;

    Procedure filtrar();
  public
    { Public declarations }
  end;

var
  fMoedas: TfMoedas;

implementation

uses uDM, Main;

{$R *.dfm}

procedure TfMoedas.btnAlterarClick(Sender: TObject);
begin
   qyCotacoes.Edit();
   qyCotacoescd_moeda_base.AsInteger := iMoeda;

   if tcCotacoes.TabIndex >=1 then begin

      qyCotacoescd_moeda_cota.AsInteger := aCodMoedas[tcCotacoes.TabIndex];
      dbData.SetFocus();

   end else begin

      dbMoedaCambio.SetFocus();

   end;
end;

procedure TfMoedas.btnCancelarClick(Sender: TObject);
begin
  qyCotacoes.Post();
end;

procedure TfMoedas.btnExcluirClick(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir o câmbio da data selecionada?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = mrYes then begin

      qyCotacoes.Delete;

   end;

end;

procedure TfMoedas.btnFecharClick(Sender: TObject);
begin
   close();
end;

procedure TfMoedas.btnInserirClick(Sender: TObject);
begin
   qyCotacoes.Insert();
   qyCotacoescd_moeda_base.AsInteger := iMoeda;

   if tcCotacoes.TabIndex >= 1 then begin

      qyCotacoescd_moeda_cota.AsInteger := aCodMoedas[tcCotacoes.TabIndex];
      dbData.SetFocus();

   end else begin

      dbMoedaCambio.SetFocus();

   end;
   
end;

procedure TfMoedas.btnSalvarClick(Sender: TObject);
begin
   qyCotacoes.Post();
   filtrar();
end;

procedure TfMoedas.dbMoedaBaseKeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;

   if key = #13 then begin
   
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;

   end;

end;

procedure TfMoedas.dsCotacoesStateChange(Sender: TObject);
begin
   btnInserir.Enabled  := not (qyCotacoes.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled  := not (qyCotacoes.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled  := not (qyCotacoes.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled   := (qyCotacoes.State in [dsInsert, dsEdit]);
   btnCancelar.Enabled := (qyCotacoes.State in [dsInsert, dsEdit]);
   btnFechar.Enabled   := not (qyCotacoes.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled     := not (qyCotacoes.State in [dsInsert, dsEdit]);
end;

procedure TfMoedas.filtrar;
begin
  qyCotacoes.Close();
  qyCotacoes.SQL.Text := ' SELECT * FROM fin_moedas_cotacoes ';

  if (tcCotacoes.TabIndex > 0) then begin
    qyCotacoes.SQL.Add(' WHERE cd_moeda_cota = ' + IntToStr(aCodMoedas[tcCotacoes.TabIndex]));
  end;
  qyCotacoes.SQL.Add(' ORDER BY cd_moeda_base, dt_cotacao, cd_moeda_cota ');

  qyCotacoes.Open();
end;

procedure TfMoedas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfMoedas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;

end;

procedure TfMoedas.FormShow(Sender: TObject);
var
  i : Integer;
begin
   // Preparar as Guias
   // Preencher os Arrays com os códigos das moedas bases;

    qyMoedasBase.Close();
    qyMoedasBase.Open();
    qyMoedasCambio.Close();
    qyMoedasCambio.Open();

    SetLength(aCodMoedas, qyMoedasBase.RecordCount + 1);
    tcCotacoes.Tabs.Clear();
    tcCotacoes.Tabs.Add('Todas as moedas');

    i := 0;

    aCodMoedas[i] := -1;

    i := 1;


    while not qyMoedasBase.Eof do begin
       tcCotacoes.Tabs.Add(qyMoedasBaseds_moeda.AsString);
       aCodMoedas[i] := qyMoedasBasecd_moeda.AsInteger;

       INC(i);
       qyMoedasBase.Next();
    end;

    // Pegar a Moeda Base
    if DM.variavel_parametro('financeiro_moeda_base') = ''  then begin
       iMoeda := 0;
    end else begin
       iMoeda := StrToInt(DM.variavel_parametro('financeiro_moeda_base'));
    end;

    filtrar();

end;

procedure TfMoedas.tcCotacoesChange(Sender: TObject);
begin
   filtrar();
end;

end.

