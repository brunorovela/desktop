unit uCadCampus;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
   StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
   ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
  Tfrm_Campus = class(TForm)
    Bevel7: TBevel;
    Panel3: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyCampus: TUMZQuery;
    Bevel2: TBevel;
    Panel5: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    srcCampus: TDataSource;
    grdCampus: TDBGrid;
    tbIncluir: TToolButton;
    tbAlterar: TToolButton;
    tbExcluir: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    tbSalvar: TToolButton;
    tbCancelar: TToolButton;
    qyCampuscd_campus: TIntegerField;
    qyCampusds_endereco: TStringField;
    qyCampusnr_numero: TIntegerField;
    qyCampusds_bairro: TStringField;
    qyCampusds_cidade: TStringField;
    qyCampusds_estado: TStringField;
    qyCampuscd_pessoa_coordenador: TIntegerField;
    qyCampusnm_pessoa_coordenador: TStringField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
    DBEdit1: TDBEdit;
    Bevel3: TBevel;
    SpeedButton1: TSpeedButton;
    DBText1: TDBText;
    qyCampusds_codigo: TStringField;
    Label1: TLabel;
    cbUnidades: TComboBox;
    qyCampuscd_coligada: TSmallintField;
    procedure cbUnidadesSelect(Sender: TObject);
    procedure srcCampusDataChange(Sender: TObject; Field: TField);
    procedure srcCampusStateChange(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbAlterarClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qyCoordenadoresAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure srcCoordenadoresStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Campus: Tfrm_Campus;
  Coluna, Linha: integer;
  cd_item: array[1..50] of integer;
  cd_horario: array[1..50] of integer;
  cd_disciplina: array[1..50] of integer;
  ds_disciplina: array[1..50] of string;
  professor: array[1..50] of integer;

implementation

uses Main, uDM, uFSelecionarTurma, StrUtils, uFSelecionarPessoa, uItemCombo, uUsuario;

{$R *.dfm}

procedure Tfrm_Campus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Campus.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if tbIncluir.Enabled  then tbIncluirClick( nil );
    VK_F3 : if tbAlterar.Enabled  then tbAlterarClick( nil );
    VK_F9 : if tbExcluir.Enabled  then tbExcluirClick( nil );
    VK_F5 : if tbSalvar.Enabled   then tbSalvarClick( nil );
    VK_F6 : if tbCancelar.Enabled then tbCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Campus.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Campus.cbUnidadesSelect(Sender: TObject);
var
   CodColigada : Integer;
begin
   qyCampus.Edit;

   CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());

   if CodColigada <> 0 then begin
      qyCampus.FieldByName('cd_coligada').AsString := TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo();
   end;
   
end;

procedure Tfrm_Campus.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Campus.srcCoordenadoresStateChange(Sender: TObject);
var
  bEditando : boolean;
begin
   tbIncluir.Enabled  := not bEditando;
   tbAlterar.Enabled  := not bEditando;
   tbExcluir.Enabled  := not bEditando;

   tbSalvar.Enabled   := bEditando;
   tbCancelar.Enabled := bEditando;
end;

procedure Tfrm_Campus.tbExcluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1114, npExcluir, true) then
      if Mensagem('Tem certeza que deseja excluir o coordenador selecionado ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes Then begin
         qyCampus.Delete;
      end;
end;

procedure Tfrm_Campus.FormShow(Sender: TObject);
var
   i : Integer;
   SQLCampus : string;
begin

  qyCampus.Close; 

  SQLCampus := 'SELECT * FROM campus WHERE cd_coligada IN (' + DM.GetColigadas() + ') OR cd_coligada IS NULL';

  qyCampus.SQL.Text := SQLCampus;

  qyCampus.Open;

  cbUnidades.AddItem('Selecione', TItemCombo.Create( '0', 'Selecione' ));

  cbUnidades.ItemIndex := 0;

  for i := 0 to DM.ArrayColigadasUsuario.Count - 1 do
   begin
      cbUnidades.Items.AddObject(
         TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getDescricao(),
         DM.ArrayColigadasUsuario.Objects[i]
      );

      // Verifica se a coligada selecionada é a coligada que está varrendo
      if StrToInt(TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getCodigo()) = qyCampus.FieldByName('cd_coligada').AsInteger then begin
         cbUnidades.ItemIndex := i+1;
      end

   end;

end;

procedure Tfrm_Campus.qyCoordenadoresAfterPost(DataSet: TDataSet);
begin
  DataSet.Close;
  DataSet.Open;
end;

procedure Tfrm_Campus.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Pessoa }
   if not (qyCampus.State in [dsInsert,dsEdit]) then
   begin
      exit;
   end;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      qyCampus.FieldByName('cd_pessoa_coordenador').AsInteger := resultado_filtro.cd_pessoa;
   end;
end;

procedure Tfrm_Campus.tbIncluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1114, npIncluir, true) then
   begin
      DBEdit2.SetFocus;
      qyCampus.Insert;
   end;
end;

procedure Tfrm_Campus.tbAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1114, npAlterar, true) then
      qyCampus.Edit;
end;

procedure Tfrm_Campus.tbSalvarClick(Sender: TObject);
var
  CodColigada : Integer;
begin
  // Seta a coligada com a coligada selecionada
  CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());

  if CodColigada <> 0 then begin
     qyCampus.FieldByName('cd_coligada').AsInteger := CodColigada;
  end;

  qyCampus.Post;
end;

procedure Tfrm_Campus.tbCancelarClick(Sender: TObject);
begin
  qyCampus.Cancel;
end;

procedure Tfrm_Campus.srcCampusDataChange(Sender: TObject; Field: TField);
var
   i, CodColigada : Integer;
begin

   if not (qyCampus.State in [dsInsert,dsEdit]) then begin
      cbUnidades.ItemIndex := 0;
   end;

   for i := 0 to cbUnidades.Items.Count - 1 do
   begin
      CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[i]).getCodigo());

      // Verifica se a coligada selecionada é a coligada que está varrendo
      if (CodColigada = qyCampus.FieldByName('cd_coligada').AsInteger) and
         (qyCampus.FieldByName('cd_coligada').AsInteger <> 0) and
          not (qyCampus.State in [dsInsert,dsEdit]) then begin
         cbUnidades.ItemIndex := i;
      end;
   end;
   
end;

procedure Tfrm_Campus.srcCampusStateChange(Sender: TObject);
var
  estado : boolean;
begin
  estado := (qyCampus.State in [dsInsert,dsEdit]);

  tbIncluir.Enabled := not estado;
  tbAlterar.Enabled := not estado;
  tbExcluir.Enabled := not estado;

  tbSalvar.Enabled := estado;
  tbCancelar.Enabled := estado;
end;

end.

