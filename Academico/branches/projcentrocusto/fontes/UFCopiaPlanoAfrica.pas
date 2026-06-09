unit UFCopiaPlanoAfrica;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, ComCtrls, Buttons, UZDataset, DB, ZAbstractRODataset,
   ZAbstractDataset;

type
   TfCopiaPlanoAfrica = class(TForm)
    meAnoSemestre: TMaskEdit;
    lblAnoSemestre: TLabel;
    udAnoSemestre: TUpDown;
    chkCopiarTurmas: TCheckBox;
    bbtnConfirmar: TBitBtn;
    qryPlanos: TUMZQuery;
    qryPlanoTurmas: TUMZReadOnlyQuery;
    qryPlanoItens: TUMZReadOnlyQuery;
    qryPlanoTurmasCopia: TUMZQuery;
    qryPlanoItensCopia: TUMZQuery;
    qryPlanosCD_PLANO: TLargeintField;
    qryPlanosDS_PLANO: TStringField;
    qryPlanosNR_ANOSEM: TIntegerField;
    qryPlanoTurmasCopiaID_PLANO_TURMA: TLargeintField;
    qryPlanoTurmasCopiaCD_PLANO: TLargeintField;
    qryPlanoTurmasCopiaCD_TURMA: TStringField;
    qryPlanoTurmasCopiaNR_ANOSEM: TIntegerField;
    qryPlanoItensCopiaCD_PLANO_ITEM: TLargeintField;
    qryPlanoItensCopiaCD_PLANO: TLargeintField;
    qryPlanoItensCopiaNR_DISC_MIN: TSmallintField;
    qryPlanoItensCopiaNR_DISC_MAX: TSmallintField;
    qryPlanoItensCopiaSN_PODE_REPETIR: TSmallintField;
    qryPlanoItensCopiaCD_TIPO_TITULO: TLargeintField;
    qryPlanoItensCopiaNR_PARCELAS: TIntegerField;
    qryPlanoItensCopiaVL_PARCELA: TFloatField;
    qryPlanoItensCopiaVL_DESCONTO: TFloatField;
    qryPlanoItensCopiaDT_INICIAL: TDateTimeField;
    qryPlanoItensCopiaDT_PRIMEIRA_PARC: TDateTimeField;
    qryPlanoItensCopiaSN_DIA_UTIL: TSmallintField;
    qryPlanoTurmasID_PLANO_TURMA: TLargeintField;
    qryPlanoTurmasCD_PLANO: TLargeintField;
    qryPlanoTurmasCD_TURMA: TStringField;
    qryPlanoTurmasNR_ANOSEM: TIntegerField;
    qryPlanoItensCD_PLANO_ITEM: TLargeintField;
    qryPlanoItensCD_PLANO: TLargeintField;
    qryPlanoItensNR_DISC_MIN: TSmallintField;
    qryPlanoItensNR_DISC_MAX: TSmallintField;
    qryPlanoItensSN_PODE_REPETIR: TSmallintField;
    qryPlanoItensCD_TIPO_TITULO: TLargeintField;
    qryPlanoItensNR_PARCELAS: TIntegerField;
    qryPlanoItensVL_PARCELA: TFloatField;
    qryPlanoItensVL_DESCONTO: TFloatField;
    qryPlanoItensDT_INICIAL: TDateTimeField;
    qryPlanoItensDT_PRIMEIRA_PARC: TDateTimeField;
    qryPlanoItensSN_DIA_UTIL: TSmallintField;
    bbtnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
      FPlanoOrigem: Integer;
      function GetPlanoOrigem: Integer;
      procedure SetPlanoOrigem(const Value: Integer);
  public
    { Public declarations }
      property PlanoOrigem: Integer read GetPlanoOrigem write SetPlanoOrigem;
  end;

var
  fCopiaPlanoAfrica: TfCopiaPlanoAfrica;

implementation

uses
   uDM;

{$R *.dfm}

{ TfCopiaPlanoAfrica }

procedure TfCopiaPlanoAfrica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfCopiaPlanoAfrica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   SInfoSuccess = 'Plano copiado com sucesso.';
   SInfoError = 'Ocorreu um erro na tentativa de copiar o plano:'#13'%s';
   SCaptionSuccess = 'Informação';
   SCaptionError = 'Erro';
var
   S: string;
   LPlanoDestino: Integer;
begin
   if ModalResult = mrOk then
   try
      qryPlanos.Close;
      qryPlanos.ParamByName('CD_PLANO').AsInteger := PlanoOrigem;
      qryPlanos.Open;

      if not qryPlanos.IsEmpty then
      begin
         S := qryPlanosDS_PLANO.AsString;
         qryPlanos.Insert;
         qryPlanosDS_PLANO.AsString := S;
         qryPlanosNR_ANOSEM.AsString := meAnoSemestre.Text;
         qryPlanos.Post;
         LPlanoDestino := qryPlanosCD_PLANO.AsInteger;

         qryPlanoItensCopia.Close;
         qryPlanoItensCopia.ParamByName('CD_PLANO').AsInteger := LPlanoDestino;
         qryPlanoItensCopia.Open;
         
         qryPlanoItens.Close;
         qryPlanoItens.ParamByName('CD_PLANO').AsInteger := PlanoOrigem;
         qryPlanoItens.Open;
         while not qryPlanoItens.Eof do
         begin
            qryPlanoItensCopia.Insert;
            qryPlanoItensCopiaCD_PLANO.AsInteger := LPlanoDestino;
            qryPlanoItensCopiaNR_DISC_MIN.AsInteger :=
                  qryPlanoItensNR_DISC_MIN.AsInteger;
            qryPlanoItensCopiaNR_DISC_MAX.AsInteger :=
                  qryPlanoItensNR_DISC_MAX.AsInteger;
            qryPlanoItensCopiaSN_PODE_REPETIR.AsInteger :=
                  qryPlanoItensSN_PODE_REPETIR.AsInteger;
            qryPlanoItensCopiaCD_TIPO_TITULO.AsInteger :=
                  qryPlanoItensCD_TIPO_TITULO.AsInteger;
            qryPlanoItensCopiaNR_PARCELAS.AsInteger :=
                  qryPlanoItensNR_PARCELAS.AsInteger;
            qryPlanoItensCopiaVL_PARCELA.AsFloat :=
                  qryPlanoItensVL_PARCELA.AsFloat;
            qryPlanoItensCopiaVL_DESCONTO.AsFloat :=
                  qryPlanoItensVL_DESCONTO.AsFloat;
            qryPlanoItensCopiaDT_INICIAL.AsDateTime :=
                  qryPlanoItensDT_INICIAL.AsDateTime;
            qryPlanoItensCopiaDT_PRIMEIRA_PARC.AsDateTime :=
                  qryPlanoItensDT_PRIMEIRA_PARC.AsDateTime;
            qryPlanoItensCopiaSN_DIA_UTIL.AsInteger :=
                  qryPlanoItensSN_DIA_UTIL.AsInteger;
            qryPlanoItens.Next;
         end;
         qryPlanoItens.Close;
         
         if qryPlanoItensCopia.State = dsInsert then
            qryPlanoItensCopia.Post;
         qryPlanoItensCopia.Close;

         if chkCopiarTurmas.Checked then
         begin
            qryPlanoTurmasCopia.Close;
            qryPlanoTurmasCopia.ParamByName('CD_PLANO').AsInteger :=
                  LPlanoDestino;
            qryPlanoTurmasCopia.Open;
         
            qryPlanoTurmas.Close;
            qryPlanoTurmas.ParamByName('CD_PLANO').AsInteger := PlanoOrigem;
            qryPlanoTurmas.ParamByName('NR_ANOSEM').AsString :=
                  meAnoSemestre.Text;
            qryPlanoTurmas.Open;
            while not qryPlanoTurmas.Eof do
            begin
               qryPlanoTurmasCopia.Insert;
               qryPlanoTurmasCopiaCD_PLANO.AsInteger := LPlanoDestino;
               qryPlanoTurmasCopiaCD_TURMA.AsString :=
                     qryPlanoTurmasCD_TURMA.AsString;
               qryPlanoTurmasCopiaNR_ANOSEM.AsString := meAnoSemestre.Text;
               qryPlanoTurmas.Next;
            end;
            qryPlanoTurmas.Close;

            if qryPlanoTurmasCopia.State = dsInsert then
               qryPlanoTurmasCopia.Post;
            qryPlanoTurmasCopia.Close;
         end;
      end;
      qryPlanos.Close;
      MessageBox(Handle, PChar(SInfoSuccess), PChar(SCaptionSuccess),
            MB_ICONINFORMATION + MB_OK);
   except
      on E: EZDatabaseError do
         MessageBox(Handle, PChar(SInfoError), PChar(SCaptionError),
               MB_ICONERROR + MB_OK);
   end;
end;

procedure TfCopiaPlanoAfrica.FormCreate(Sender: TObject);
begin
   meAnoSemestre.Text :=
         DM.incrementar_ano_semestre(Format('%d', [DM.GetAnoSemestreAtual]));
end;

function TfCopiaPlanoAfrica.GetPlanoOrigem: Integer;
begin
   Result := FPlanoOrigem;
end;

procedure TfCopiaPlanoAfrica.SetPlanoOrigem(const Value: Integer);
begin
   FPlanoOrigem := Value;
end;

procedure TfCopiaPlanoAfrica.udAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSemestre.Text := DM.incrementar_ano_semestre(meAnoSemestre.Text)
   else
      meAnoSemestre.Text := DM.decrementar_ano_semestre(meAnoSemestre.Text);
end;

end.
