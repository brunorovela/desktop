unit uBolsasTipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DBCtrls, ComCtrls, ToolWin, Grids, DBGrids, ExtCtrls, DB,
  ZConnection, StdCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons,
  UMLookupComboBox;

type
  TFrmBolsasTipos = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    btIncluir: TToolButton;
    btAlterar: TToolButton;
    btExcluir: TToolButton;
    ToolButton4: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    Panel1: TPanel;
    Splitter1: TSplitter;
    bgCheques: TDBGrid;
    ScrollBox1: TScrollBox;
    qyBolsas: TUMZQuery;
    qyBolsascd_bolsa: TIntegerField;
    qyBolsasds_bolsa: TStringField;
    qyBolsassn_gratuidade: TSmallintField;
    qyBolsasvl_fixo_sugerido: TFloatField;
    qyBolsasvl_perc_sugerido: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsBolsas: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    btSalvar: TToolButton;
    btCancelar: TToolButton;
    qyBolsasTitulos: TUMZQuery;
    Panel2: TPanel;
    Label3: TLabel;
    dsBolsasTitulos: TDataSource;
    qyBolsasTitulosds_tipo_titulo: TStringField;
    qyBolsasTituloscd_tipo_titulo: TIntegerField;
    qyBolsasTituloscd_coligada: TIntegerField;
    qyBolsasTituloscd_bolsa: TIntegerField;
    dgTitulos: TDBGrid;
    qyBolsasTituloscd_bolsas_tipo_titulos: TLargeintField;
    procedure qyBolsasNewRecord(DataSet: TDataSet);
    procedure dgTitulosDblClick(Sender: TObject);
    procedure qyBolsasAfterOpen(DataSet: TDataSet);
    procedure qyBolsasTituloscd_bolsas_tipo_titulosGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure dsBolsasStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    Procedure Filtrar();
  public
    { Public declarations }
  end;

var
  FrmBolsasTipos: TFrmBolsasTipos;

implementation

uses uDM, Main;

{$R *.dfm}

{ TFrmBolsasTipos }

procedure TFrmBolsasTipos.btAlterarClick(Sender: TObject);
begin

  DBEdit2.SetFocus();
  qyBolsas.Edit();

end;

procedure TFrmBolsasTipos.btCancelarClick(Sender: TObject);
begin

   qyBolsas.Cancel;
   Filtrar();

end;

procedure TFrmBolsasTipos.btExcluirClick(Sender: TObject);
begin

  if Mensagem('Deseja realmente excluir o plano de bolsa selecionado?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then begin

     Exit;

  end else begin

     qyBolsas.Delete();
     Filtrar();

  end;
  
end;

procedure TFrmBolsasTipos.btFecharClick(Sender: TObject);
begin

   Close();
   
end;

procedure TFrmBolsasTipos.btIncluirClick(Sender: TObject);
begin

   DBEdit2.SetFocus();
   qyBolsas.Insert();

end;

procedure TFrmBolsasTipos.btSalvarClick(Sender: TObject);
begin

   qyBolsas.Post();
   Filtrar();

end;

procedure TFrmBolsasTipos.dgTitulosDblClick(Sender: TObject);
Var
   qyAux : TUMZQuery;
begin

   if (dgTitulos.SelectedIndex <> 0) OR (not qyBolsasTitulos.Active) then begin

      Exit;

   end;

   DM.CriarConsulta(qyAux);

   if qyBolsasTituloscd_bolsas_tipo_titulos.AsInteger = -1 then begin
      // Não existe --> INCLUIR

      qyAux.SQL.Text := ' INSERT INTO fin_bolsas_tipos_titulos (cd_bolsas_tipo_titulos, cd_bolsa, cd_tipo_titulo, cd_coligada) ' +
      ' VALUES (NULL, '+qyBolsascd_bolsa.AsString+', ' + qyBolsasTituloscd_tipo_titulo.AsString + ', ' + qyBolsasTituloscd_coligada.AsString + ') ';

   end else begin
      // Existe Excluir

      qyAux.SQL.Text := ' DELETE FROM fin_bolsas_tipos_titulos WHERE ' +
      ' cd_bolsas_tipo_titulos = ' + qyBolsasTituloscd_bolsas_tipo_titulos.AsString;

   end;

   qyAux.ExecSQL();

   qyBolsasTitulos.Close();
   qyBolsasTitulos.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyBolsasTitulos.Open();   

end;

procedure TFrmBolsasTipos.dsBolsasStateChange(Sender: TObject);
begin
  btIncluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TFrmBolsasTipos.Filtrar;
Var
  pPos : Pointer;
begin
   // Atualizar grade e posicionar o cursos

   pPos := qyBolsas.GetBookmark();

   if qyBolsas.UpdatesPending then begin

      qyBolsas.ApplyUpdates();

   end;
   
   qyBolsas.Close();
   qyBolsas.Open();


   if pPos <> nil then begin

       if qyBolsas.BookmarkValid(pPos) then begin

          qyBolsas.GotoBookmark(pPos);

       end;
       
   end;

end;

procedure TFrmBolsasTipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   Action := caFree;

end;

procedure TFrmBolsasTipos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmBolsasTipos.FormShow(Sender: TObject);
begin

   Filtrar();

end;

procedure TFrmBolsasTipos.qyBolsasAfterOpen(DataSet: TDataSet);
begin
   if qyBolsas.IsEmpty then
   begin
      qyBolsasTitulos.Close()
   end else begin
      qyBolsasTitulos.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
      qyBolsasTitulos.Open();
   end;
end;

procedure TFrmBolsasTipos.qyBolsasNewRecord(DataSet: TDataSet);
begin
    qyBolsassn_gratuidade.AsInteger := 1;
end;

procedure TFrmBolsasTipos.qyBolsasTituloscd_bolsas_tipo_titulosGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsInteger = -1 then
      Text := ''
  Else
      Text := 'X';
end;

end.

