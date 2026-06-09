unit uSelInstituicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, UZDataset,
  ZAbstractRODataset, ZAbstractDataset;

type
  TFrmSelInstituicao = class(TForm)
    pnTitulo: TPanel;
    Bevel6: TBevel;
    Panel1: TPanel;
    Label2: TLabel;
    txCodigo: TEdit;
    Label1: TLabel;
    txNome: TEdit;
    Bevel1: TBevel;
    grdPessoa: TDBGrid;
    Panel2: TPanel;
    btnFechar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qryInstituicao: TUMZQuery;
    dtcInstituicao: TDataSource;
    qryInstituicaonm_instituicao: TStringField;
    qryInstituicaods_cidade: TStringField;
    qryInstituicaods_estado: TStringField;
    Label3: TLabel;
    txCidade: TEdit;
    ckbTodas: TCheckBox;
    qryInstituicaocd_instituicao: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbTodasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure grdPessoaDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure txCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure txNomeKeyPress(Sender: TObject; var Key: Char);
    procedure txCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure txCidadeEnter(Sender: TObject);
    procedure txNomeEnter(Sender: TObject);
    procedure txCodigoEnter(Sender: TObject);
  private
    { Private declarations }
    Procedure Filtrar();
  public
    { Public declarations }
    flgSearch : Boolean;
  end;

var
  FrmSelInstituicao: TFrmSelInstituicao;

implementation

uses uDM;

{$R *.dfm}

procedure TFrmSelInstituicao.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  close();
end;

procedure TFrmSelInstituicao.ckbTodasClick(Sender: TObject);
begin

   if ckbTodas.Checked then begin

      txCodigo.Clear();
      txNome.Clear();
      txCidade.Clear();

   end;

   Filtrar();
   
end;

procedure TFrmSelInstituicao.Filtrar;
begin
 // Filtrar as Instituições

  qryInstituicao.Close();
  qryInstituicao.SQL.Clear();
  qryInstituicao.Params.Clear();


  qryInstituicao.SQL.Text :=
     ' SELECT cd_instituicao, nm_instituicao, ds_cidade, ds_estado ' +
     '   FROM instituicoes_ensino ' ;

  // Desabilitar a Procedure Onclik para não ter redundancia

  ckbTodas.OnClick := nil;

  if trim(txCodigo.Text) <> '' then begin
     qryInstituicao.SQL.Add(' WHERE cd_instituicao = :cd_instituicao ');
     qryInstituicao.ParamByName('cd_instituicao').AsString := trim(txCodigo.Text);
     ckbTodas.Checked := false;
  end else if trim(txNome.Text) <> '' then begin
     qryInstituicao.SQL.Add(' WHERE nm_instituicao like :nm_instituicao ');
     qryInstituicao.ParamByName('nm_instituicao').AsString := '%' + trim(txNome.Text) + '%';
     ckbTodas.Checked := false;
  end else if trim(txCidade.Text) <> '' then begin
     qryInstituicao.SQL.Add(' WHERE ds_cidade like :ds_cidade ');
     qryInstituicao.ParamByName('ds_cidade').AsString := '%' + trim(txCidade.Text) + '%';
     ckbTodas.Checked := false;
  end else if not ckbTodas.Checked then begin
     qryInstituicao.SQL.Add(' WHERE 1 <> 1 ');
  end;

  ckbTodas.OnClick := ckbTodasClick;


  qryInstituicao.SQL.Add(' ORDER BY nm_instituicao ');

  qryInstituicao.Open();

  grdPessoa.SetFocus();


end;

procedure TFrmSelInstituicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM.Set_Parametros_usuario(TForm(Sender));
    
end;

procedure TFrmSelInstituicao.FormShow(Sender: TObject);
begin
   DM.Parametros_usuario(TForm(Sender));
   Filtrar();
end;

procedure TFrmSelInstituicao.grdPessoaDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TFrmSelInstituicao.grdPessoaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    flgSearch := True;
    Close;
  end;
end;

procedure TFrmSelInstituicao.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TFrmSelInstituicao.txCidadeEnter(Sender: TObject);
begin
   txNome.Clear();
   txCodigo.Clear();
end;

procedure TFrmSelInstituicao.txCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
         txCodigo.SetFocus()
      else
      	 filtrar(); 
  End;

end;

procedure TFrmSelInstituicao.txCodigoEnter(Sender: TObject);
begin
   txNome.Clear();
   txCidade.Clear();
end;

procedure TFrmSelInstituicao.txCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
         txNome.SetFocus()
      else
      	 filtrar(); 
  End;
end;

procedure TFrmSelInstituicao.txNomeEnter(Sender: TObject);
begin
   txCodigo.Clear();
   txCidade.Clear();
end;

procedure TFrmSelInstituicao.txNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  Begin
      Key := #0;
      if TEdit(Sender).Text = '' Then
         txCidade.SetFocus()
      else
      	 filtrar(); 
  End;

end;

end.
