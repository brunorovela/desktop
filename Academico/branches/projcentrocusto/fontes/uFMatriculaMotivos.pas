unit uFMatriculaMotivos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, DBCtrls, ComCtrls, Grids, DBGrids, DB, ZConnection,
  ToolWin, ImgList, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  uDM;

type
   TfMatriculaMotivos = class(TForm)
    Splitter1: TSplitter;
    qyTiposMotivos: TUMZQuery;
    cbMotivos: TDBLookupComboBox;
    dsTiposMotivos: TDataSource;
    qyTiposMotivosCD_SITUACAO: TIntegerField;
    qyTiposMotivosDS_VALOR: TStringField;
    qyTiposMotivosDS_SIGLA: TStringField;
    qyMotivosds_usuario: TStringField;
    qyMotivosnr_anosemestre: TSmallintField;
    qyMotivoscd_curso: TStringField;
    qyMotivoscd_turma: TStringField;
    qyMotivosdt_registro: TDateTimeField;
    qyMotivostx_motivo: TMemoField;
    qyMotivosds_situacao: TStringField;
    qyMotivosds_sigla: TStringField;
    Splitter2: TSplitter;
    tbAlterar: TToolButton;
    tbConfirmar: TToolButton;
    tbCancelar: TToolButton;
    ilBarra: TImageList;
    ilBarraDesabilitado: TImageList;
    qyAtualizaMotivo: TUMZQuery;
    dsAtualizaMotivo: TDataSource;
    qyMotivosCD_MATRICULA_MOTIVO: TLargeintField;
    procedure FormShow(Sender: TObject);
    procedure cbMotivosClick(Sender: TObject);
    procedure dsMotivosDataChange(Sender: TObject; Field: TField);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbConfirmarClick(Sender: TObject);
    procedure tbAlterarClick(Sender: TObject);
    procedure qyMotivosBeforeOpen(DataSet: TDataSet);
   published
      liImagens: TImageList;
      tbAcoes: TToolBar;
      tbSep1: TToolButton;
      tbFechar: TToolButton;
      tbSep2: TToolButton;
      spSep: TSplitter;
      pnMotivo: TPanel;
      pnMotivoTit: TPanel;
      mmMotivo: TDBMemo;
      pnAluno: TPanel;
      bvSep2: TBevel;
      dgMotivos: TDBGrid;
      dsMotivos: TDataSource;
      qyMotivos: TUMZQuery;
      procedure tbFecharClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      constructor Create(const AICodAluno: Integer; const ASNomeAluno: string;
         AOwner: TComponent);
      destructor Destroy; override;
   public
      class procedure MostraMotivos(const AICodAluno: Integer;
         const ASNomeAluno: string; AOwner: TComponent);
   end;

var
   fMatriculaMotivos: TfMatriculaMotivos;
   bPodeAlterar : Boolean;

implementation

uses uUsuario;

{$R *.dfm}

{ TfMatriculaMotivos }

procedure TfMatriculaMotivos.cbMotivosClick(Sender: TObject);
begin
//  if True then
   
end;

constructor TfMatriculaMotivos.Create(const AICodAluno: Integer;
   const ASNomeAluno: string; AOwner: TComponent);
begin
   inherited Create(AOwner);
   Self.pnAluno.Caption := Format('%d - %s', [AICodAluno, ASNomeAluno]);
   Self.qyMotivos.ParamByName('cd_pessoa').AsInteger := AICodAluno;
   Self.qyMotivos.Open;
   Self.qyMotivos.Last;
end;

destructor TfMatriculaMotivos.Destroy;
begin
   inherited;
end;

procedure TfMatriculaMotivos.dsMotivosDataChange(Sender: TObject;
  Field: TField);
begin
  tbCancelarClick(Sender);
  qyAtualizaMotivo.Close();
  qyAtualizaMotivo.ParamByName('cd_matricula_motivo').AsInteger :=  qyMotivoscd_matricula_motivo.Value;
  qyAtualizaMotivo.Open();


end;

procedure TfMatriculaMotivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfMatriculaMotivos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   Self.ModalResult := mrOk;
end;

procedure TfMatriculaMotivos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
      VK_ESCAPE, VK_F12:
         Self.CloseModal;
      VK_F3:
        tbAlterarClick(Sender);
      VK_F5:
        tbConfirmarClick(Sender);
      VK_F6:
        tbCancelarClick(Sender);
   end;
end;

procedure TfMatriculaMotivos.FormShow(Sender: TObject);
begin
  cbMotivos.Enabled :=false;
  if not(DM.UsuarioLogado.TemPermissao(1145, npAlterar, true)) then
  begin
    tbAlterar.Enabled := false;
  end;
end;

class procedure TfMatriculaMotivos.MostraMotivos(const AICodAluno: Integer;
   const ASNomeAluno: string; AOwner: TComponent);
begin
   if not Assigned(fMatriculaMotivos) then
      fMatriculaMotivos := TfMatriculaMotivos.Create(AICodAluno, ASNomeAluno, AOwner);
   try
      fMatriculaMotivos.ShowModal;
   finally
      FreeAndNil(fMatriculaMotivos);
   end;
end;

procedure TfMatriculaMotivos.qyMotivosBeforeOpen(DataSet: TDataSet);
begin
   qyTiposMotivos.Open();
end;

procedure TfMatriculaMotivos.tbFecharClick(Sender: TObject);
begin
   Self.ModalResult := mrOk;
   Self.CloseModal;
end;

procedure TfMatriculaMotivos.tbAlterarClick(Sender: TObject);
begin
  cbMotivos.Enabled := true;
  mmMotivo.Enabled := true;
  cbMotivos.ReadOnly := false;
  mmMotivo.Enabled := true;
  mmMotivo.ReadOnly := false;
  tbConfirmar.Visible := true;
  tbCancelar.Visible := true;
  tbAlterar.Visible:= false;
  qyAtualizaMotivo.Edit();
  cbMotivos.SetFocus();
end;

procedure TfMatriculaMotivos.tbCancelarClick(Sender: TObject);
begin
  tbAlterar.Visible := true;
  tbConfirmar.Visible := False;
  tbCancelar.Visible := False;
  cbMotivos.Enabled := false;
  mmMotivo.Enabled := false;
  qyAtualizaMotivo.Cancel();

end;

procedure TfMatriculaMotivos.tbConfirmarClick(Sender: TObject);
begin

  tbAlterar.Visible := true;
  tbConfirmar.Visible := False;
  tbCancelar.Visible := False;
  cbMotivos.Enabled := False;
  mmMotivo.Enabled := false;
  qyAtualizaMotivo.Post();
end;

end.
