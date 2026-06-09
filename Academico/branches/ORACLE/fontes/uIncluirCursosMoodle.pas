unit uIncluirCursosMoodle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, ImgList, ExtCtrls, uDM,  DB,
  ZAbstractRODataset, ZAbstractDataset,UZDataset,BDE, Buttons, Mask, DBCtrls,
  UMComboBox;

type
  TfrmIncluirCursosMoodle = class(TForm)
    Panel1: TPanel;
    ImageList2: TImageList;
    lbleDescricao: TLabeledEdit;
    lbleSigla: TLabeledEdit;
    lbleCodigoKonviva: TLabeledEdit;
    chkKonviva: TCheckBox;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    rgImportar: TRadioGroup;
    lblTipoProva: TLabel;
    qryTipoAvaliacao: TUMZReadOnlyQuery;
    qryTipoAvaliacaoCD_AVALIACAO_TIPO: TIntegerField;
    qryTipoAvaliacaoDS_AVALIACAO: TStringField;
    dsTipoAvaliacao: TDataSource;
    dblcTipoAvaliacao: TDBLookupComboBox;
    cbSistemaIntegraIncluir: TUMComboBox;
    qryNuIntegracaoExternaIncluir: TUMZQuery;
    qryNuIntegracaoExternaIncluircd_sistema: TIntegerField;
    qryNuIntegracaoExternaIncluirds_sistema: TStringField;
    procedure rgImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkKonvivaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CarregaComboIntegracaoExterna( CONST cd_moodle_curso : Integer );
  private
    { Private declarations }
  public
   {}
  end;

var
  frmIncluirCursosMoodle: TfrmIncluirCursosMoodle;

implementation

uses
   uCursosMoodle, uItemCombo;
   
{$R *.dfm}

procedure TfrmIncluirCursosMoodle.chkKonvivaClick(Sender: TObject);
var
   I: Integer;
begin
   lbleCodigoKonviva.Enabled := chkKonviva.Checked;
   rgImportar.Enabled := chkKonviva.Checked;

   if chkKonviva.Checked and (cbSistemaIntegraIncluir.ItemIndex < 1) then
   begin
      for I := 0 to cbSistemaIntegraIncluir.Items.Count - 1 do
      begin
         if cbSistemaIntegraIncluir.Items.Strings[I] = 'Konviva' then
         begin
            cbSistemaIntegraIncluir.ItemIndex := I;
            Break;
         end;
      end;
   end;
end;

procedure TfrmIncluirCursosMoodle.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   MESSAGE = 'O preenchimento dos campos "Descrição", "Sigla" e "Sistema" é obrigatório.'#13'Se a opção "Enviar este curso para o ambiente EAD do Konviva" está marcada, então o preenchimento do campo "Código Konviva" também é obrigatório.';
begin
   CanClose :=
      (ModalResult = mrCancel) or
      (
         (cbSistemaIntegraIncluir.ItemIndex > 0) and
         (Trim(lbleDescricao.Text) <> EmptyStr) and
         (Trim(lbleSigla.Text) <> EmptyStr) and
         ((Trim(lbleCodigoKonviva.Text) <> EmptyStr) or (not chkKonviva.Checked))
      );

   if not CanClose then
   begin
      MessageDlg(MESSAGE, mtInformation, [mbOK], 0);
   end;
end;

procedure TfrmIncluirCursosMoodle.FormCreate(Sender: TObject);
begin
   qryTipoAvaliacao.Open;
end;

procedure TfrmIncluirCursosMoodle.CarregaComboIntegracaoExterna(CONST cd_moodle_curso : Integer);
var
   indexCombo : Integer;
begin
   qryNuIntegracaoExternaIncluir.Close;
   qryNuIntegracaoExternaIncluir.Open;

   qryNuIntegracaoExternaIncluir.First();

   cbSistemaIntegraIncluir.Clear();

   if ( cd_moodle_curso < 1 ) then
   begin
      cbSistemaIntegraIncluir.Items.AddObject(
         'Selecione...',
         TItemCombo.Create(
            '0',
            'Selecione'
         )
      );
   end;

   indexCombo := 0;
   while not qryNuIntegracaoExternaIncluir.Eof do
   begin
      if qryNuIntegracaoExternaIncluircd_sistema.AsInteger > 0 then
      begin

         cbSistemaIntegraIncluir.Items.AddObject(
            qryNuIntegracaoExternaIncluirds_sistema.AsString,
            TItemCombo.Create(
                  qryNuIntegracaoExternaIncluircd_sistema.AsString,
                  qryNuIntegracaoExternaIncluirds_sistema.AsString
               )
            );

         if ( qryNuIntegracaoExternaIncluircd_sistema.AsInteger = cd_moodle_curso )  then
         begin
            cbSistemaIntegraIncluir.ItemIndex := indexCombo;
         end;
      end;

      inc( indexCombo );
      qryNuIntegracaoExternaIncluir.Next();
   end;
end;

procedure TfrmIncluirCursosMoodle.FormShow(Sender: TObject);
begin
   lbleDescricao.SetFocus;
end;

procedure TfrmIncluirCursosMoodle.rgImportarClick(Sender: TObject);
begin
   lblTipoProva.Enabled := rgImportar.ItemIndex = 1;
   dblcTipoAvaliacao.Enabled := rgImportar.ItemIndex = 1;
end;

end.
