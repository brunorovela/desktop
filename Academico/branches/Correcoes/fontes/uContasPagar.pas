unit uContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, ZConnection, uDM, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TFrmSelContasPagar = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtCodigo: TEdit;
    txtDescricao: TEdit;
    txtDocumento: TEdit;
    Bevel1: TBevel;
    grdProfessor: TDBGrid;
    btnSelecionar: TSpeedButton;
    btnFechar: TSpeedButton;
    qryCompromissos: TUMZQuery;
    dtcCompromissos: TDataSource;
    qryCompromissosnm_pessoa: TStringField;
    qryCompromissosds_despesa: TStringField;
    qryCompromissosnr_documento: TStringField;
    qryCompromissosdt_vencimento: TDateTimeField;
    Label4: TLabel;
    txtValor: TEdit;
    qryCompromissosCD_TITULO: TLargeintField;
    procedure txtValorKeyPress(Sender: TObject; var Key: Char);
    procedure grdProfessorDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure txtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDocumentoEnter(Sender: TObject);
    procedure txtDescricaoEnter(Sender: TObject);
    procedure txtCodigoEnter(Sender: TObject);
  private
    { Private declarations }

    Procedure filtra;
  public
    { Public declarations }
    flgSearch : Boolean;
  end;

var
  FrmSelContasPagar: TFrmSelContasPagar;

implementation

{$R *.dfm}

procedure TFrmSelContasPagar.txtCodigoEnter(Sender: TObject);
begin
   txtDescricao.Clear;
   txtDescricao.Clear;
end;

procedure TFrmSelContasPagar.txtDescricaoEnter(Sender: TObject);
begin
   txtCodigo.Clear;
   txtDocumento.Clear;
end;

procedure TFrmSelContasPagar.txtDocumentoEnter(Sender: TObject);
begin
   txtCodigo.Clear;
   txtDocumento.Clear;
end;

procedure TFrmSelContasPagar.txtCodigoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then begin
      Key := #0;
      if TEdit(Sender).Text = '' then
      	 txtDescricao.SetFocus
      else
         filtra();
  end;

end;

procedure TFrmSelContasPagar.txtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin
      Key := #0;
      if TEdit(Sender).Text = '' then
      	 txtDocumento.SetFocus
      else
         filtra();
  end;

end;

procedure TFrmSelContasPagar.txtDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin
      Key := #0;
      if TEdit(Sender).Text = '' then
      	 txtValor.SetFocus
      else
         filtra();
  end;

end;

procedure TFrmSelContasPagar.filtra();
var
   filtrou : Boolean;
begin
    // Filtrar os dados;

    qryCompromissos.Close();
    qryCompromissos.SQL.Text :=
       ' SELECT cp.cd_titulo, p.nm_pessoa, cp.ds_despesa, cp.nr_documento, cp.dt_vencimento ' +
       ' FROM fin_contas_pagar cp INNER JOIN pessoas p ON ( cp.cd_pessoa = p.cd_pessoa ) ' +
       Format(' WHERE cp.cd_coligada IN (%s)', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);

    filtrou := false;

    if trim(txtCodigo.Text) <> '' then begin
       qryCompromissos.SQL.Add(' AND cp.cd_titulo = '+QuotedStr(txtCodigo.Text) );
       filtrou := true;
    end;

    if Trim(txtDescricao.Text) <> '' then begin
       qryCompromissos.SQL.Add(' AND ( cp.ds_despesa LIKE ''%' + txtDescricao.Text + '%'' ');
       qryCompromissos.SQL.Add(' OR cp.ds_historico LIKE ''%' + txtDescricao.Text + '%'' )');
       filtrou := true;
    end;

    if Trim(txtDocumento.Text) <> '' then begin
       qryCompromissos.SQL.Add(' AND cp.nr_documento like ''%' + txtDocumento.Text + '%'' ');
       filtrou := true;
    end;

    if Trim(txtValor.Text) <> '' then begin
       qryCompromissos.SQL.Add(' AND cp.vl_despesa = :Valor ');
       qryCompromissos.ParamByName('Valor').AsFloat := StrToFloat(txtValor.Text);
       filtrou := true;
    end;

    if filtrou then begin
       qryCompromissos.SQL.Add(' ORDER BY cp.ds_despesa ');
       qryCompromissos.Open();
    end;

    if qryCompromissos.Eof OR (qryCompromissos.RecordCount = 0) then
    begin
       Mensagem('Nenhum compromisso encontrado.', 'Busca', MB_OK + MB_ICONINFORMATION);
       flgSearch := false;
       exit;
    end else begin
       flgSearch := true;
    end;
end;

procedure TFrmSelContasPagar.FormCreate(Sender: TObject);
begin
  flgSearch := false;
end;

procedure TFrmSelContasPagar.btnSelecionarClick(Sender: TObject);
begin
   if (qryCompromissos.EOF OR (qryCompromissos.RecordCount = 0)) then
      flgSearch := false
   else
      flgSearch := true;

   Close();
end;

procedure TFrmSelContasPagar.txtValorKeyPress(Sender: TObject; var Key: Char);
begin

   if Key = #13 then begin
   
      Key := #0;
      if TEdit(Sender).Text = '' then
      	 txtCodigo.SetFocus
      else
         filtra();
   
   end;

   if(Key in['.']) then
   begin
      Key :=  ',';
   end;

   if not (Key in ['0'..'9',',',#8]) then begin
      Key := #0;
   end;
   
end;

procedure TFrmSelContasPagar.btnFecharClick(Sender: TObject);
begin
   flgSearch := false;
   Close();
end;

procedure TFrmSelContasPagar.grdProfessorDblClick(Sender: TObject);
begin
   btnSelecionarClick(nil);
end;

end.

