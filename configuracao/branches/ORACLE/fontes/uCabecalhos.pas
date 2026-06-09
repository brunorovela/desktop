unit uCabecalhos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, DBCtrls, ToolWin, uDM, DB, ZConnection,
  StdCtrls, Mask, Buttons, Grids, DBGrids, ExtDlgs, JPEG;

type
  TfrmCabecalhos = class(TForm)
    Panel3: TPanel;
    toolPessoa: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    pnFoto: TPanel;
    imCabecalho: TImage;
    qyCabecalho: TUMZQuery;
    qyCabecalhocd_cabecalho: TSmallintField;
    qyCabecalhoim_cabecalho: TBlobField;
    qyCabecalhods_cabecalhos: TStringField;
    dsCabecalho: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Bevel5: TBevel;
    AbrirImagem: TOpenPictureDialog;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsCabecalhoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure dsCabecalhoStateChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Function AtribuirImagem : boolean;
  public
    { Public declarations }
  end;

var
  frmCabecalhos: TfrmCabecalhos;

implementation

{$R *.dfm}

Function TfrmCabecalhos.AtribuirImagem : Boolean;
var
  BS:TBlobStream;
  Imagem:TJPEGImage;
  largura, altura : Integer;
begin
   { Procurar a foto da pessoa }

   if not AbrirImagem.Execute then
   begin
      result := false;
      exit;
   end;

   { Coloca a tabela em modo de edição }
   if not (qyCabecalho.State in [dsInsert, dsEdit]) then
      qyCabecalho.Edit;

   { Cria um componente BLOBStream baseado no campo da base de dados (qyPessoasFoto)
   em modo de gravação (Note: BMWRITE)  }
   BS := TBlobStream.Create((qyCabecalhoim_cabecalho as TBlobField), BMWRITE);
   { Cria um componente JPEG }
   Imagem := TJPEGImage.Create;
   { Abre a imagem do OpenPictureDialog para o componente JPEG criado anteriormente }
   Imagem.LoadFromFile(AbrirImagem.FileName);

   { Salva o Stream do componente JPEG no componente BLOBStream criado anteriormente }
   { Detalhe: o componente BLOBStream é necessário pois o campo na base é do tipo MEDIUMBLOB }
   Imagem.SaveToStream(BS);

   { Apenas abre a imagem no TImage que existe na tela (Name: Foto) }
   imcabecalho.Picture.Assign(Imagem);
//   imageFoto.Visible := True;
//   lbFoto.Visible := False;

   { Libera da memória os componentes que foram criados }
   BS.Free;
   Imagem.Free;

   result := true;

End;


procedure TfrmCabecalhos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCabecalhos.btnSalvarClick(Sender: TObject);
begin
   qyCabecalho.Post;
end;

procedure TfrmCabecalhos.btnCancelarClick(Sender: TObject);
begin
   qyCabecalho.Cancel;
end;

procedure TfrmCabecalhos.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrmCabecalhos.btnInserirClick(Sender: TObject);
var
   codigo : integer;

begin
   qyCabecalho.Last;
   codigo := qyCabecalho.fieldbyName('cd_cabecalho').AsInteger;

   qyCabecalho.Insert;
   qyCabecalho.fieldbyName('cd_cabecalho').AsInteger := codigo + 1;

   if not AtribuirImagem then exit;

   dbEdit2.SetFocus;
end;

procedure TfrmCabecalhos.btnAlterarClick(Sender: TObject);
begin

   qyCabecalho.Edit;

   if not AtribuirImagem then exit;

   dbEdit2.SetFocus;

end;

procedure TfrmCabecalhos.dsCabecalhoDataChange(Sender: TObject;
  Field: TField);
{ Mudança de registro }
var
  BS:TBlobStream;
  Imagem:TJPEGImage;
begin

   { Atualização da Foto }

   { Se houver alguma informação gravada no campo foto da tabela }
   if qyCabecalhoim_cabecalho.AsString <> '' Then
   Begin

      pnFoto.visible := True;

      { Cria o componente BLOBStream baseado no campo qyPessoasFoto em modo leitura (Note: BMREAD) }
      BS := TBlobStream.Create((qyCabecalhoim_cabecalho as TBlobField), BMREAD);

      { Cria o componente JPEG }
      Imagem := TJPEGImage.Create;
      { Abre no componente JPEG baseado no Stream criado anteriormente que já possui a imagem da base}
      Imagem.LoadFromStream(BS);

      { Apenas abre no componente TImage a foto que está aberta no componente JPEG (Imagem)}
      imCabecalho.Picture.Assign(Imagem);

      { Libera da memória os componentes criados }
      BS.Free;
      Imagem.Free;

   End
   { Caso contrário }
   Else
   begin
     { Coloca uma imagem qualquer no componente TImage }
     pnFoto.visible := false;
   end;


end;  { dsPessoaDataChange }


procedure TfrmCabecalhos.FormShow(Sender: TObject);
begin
   qyCabecalho.Close;
   qyCabecalho.Open;
end;

procedure TfrmCabecalhos.dsCabecalhoStateChange(Sender: TObject);
begin
  DBNavigator1.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];

end;

procedure TfrmCabecalhos.btnExcluirClick(Sender: TObject);
begin
   qyCabecalho.Delete;
end;

end.
