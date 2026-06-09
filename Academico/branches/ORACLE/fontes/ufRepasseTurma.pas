unit ufRepasseTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMEditMonetario, Mask, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, udm;

type
  TfrmRepasseTurma = class(TFrame)
    pnlPrincipalTurma: TPanel;
    pnlTopoRepasse: TPanel;
    lblDescricao: TLabel;
    bvlSep1: TBevel;
    pnlDadosRepasse: TPanel;
    lblInicioRepasse: TLabel;
    lblValor: TLabel;
    mkedInicioRepasse: TMaskEdit;
    edValor: TUMEditMonetario;
    lblQtdParcelas: TLabel;
    edQtdParcelas: TEdit;
    qryGetRepasseTurma: TUMZQuery;
    qryGetRepasseTurmacd_turma: TStringField;
    qryGetRepasseTurmavl_remessa: TFloatField;
    qryGetRepasseTurmanr_total_parcelas: TIntegerField;
    qryGetRepasseTurmainicio_repasse: TStringField;
    qryGetRepasseTurmacd_contrato: TLargeintField;
    qryGetRepasseTurmadt_inicio_repasse: TDateTimeField;
    procedure edValorChange(Sender: TObject);
    procedure edQtdParcelasChange(Sender: TObject);
    procedure mkedInicioRepasseChange(Sender: TObject);
  private
    { Private declarations }
    cd_contrato : Integer;
    cd_turma    : string;

  public
    { Public declarations }
    formPai : tform ;
    procedure cancel;
    procedure setContrato( iContrato : Integer);
    procedure setCdTurma( sTurma : string );
    procedure ativarFrame();
    procedure salvar();
    function  getContrato() : Integer;
    function  getCdTurma() : string;
  end;
implementation

{$R *.dfm}
uses
   uFCadRepasses;

{ TfrmRepasseTurma }

procedure TfrmRepasseTurma.ativarFrame;
begin
   qryGetRepasseTurma.Close;
   qryGetRepasseTurma.ParamByName('cd_contrato').AsInteger := getContrato;
   qryGetRepasseTurma.ParamByName('cd_turma').AsString     := getCdTurma;
   qryGetRepasseTurma.Open;
   
   mkedInicioRepasse.Text := qryGetRepasseTurmainicio_repasse.AsString;
   edValor.setValorDouble(qryGetRepasseTurmavl_remessa.AsString);
   edQtdParcelas.Text     := qryGetRepasseTurmanr_total_parcelas.AsString;
end;

procedure TfrmRepasseTurma.cancel;
begin
   qryGetRepasseTurma.Cancel;
   ativarFrame;
   TfrmCadRepasses(formPai).habilitarBotoes(false);
end;

procedure TfrmRepasseTurma.edQtdParcelasChange(Sender: TObject);
begin
   TfrmCadRepasses(formPai).habilitarBotoes(true);
end;

procedure TfrmRepasseTurma.edValorChange(Sender: TObject);
begin
   TfrmCadRepasses(formPai).habilitarBotoes(true);
end;

function TfrmRepasseTurma.getCdTurma: string;
begin
   Result := cd_turma;
end;

function TfrmRepasseTurma.getContrato: Integer;
begin
   Result := cd_contrato;
end;

procedure TfrmRepasseTurma.mkedInicioRepasseChange(Sender: TObject);
begin
   TfrmCadRepasses(formPai).habilitarBotoes(true);
      
end;

procedure TfrmRepasseTurma.salvar;
begin
   qryGetRepasseTurma.First;
   if qryGetRepasseTurma.Eof then
   begin
      qryGetRepasseTurma.Insert;
      qryGetRepasseTurmacd_turma.AsString     := getCdTurma;
      qryGetRepasseTurmacd_contrato.AsInteger := getContrato;
      qryGetRepasseTurmavl_remessa.AsFloat    := edValor.getValorDouble;
      qryGetRepasseTurmanr_total_parcelas.AsInteger := StrToInt(edQtdParcelas.Text);
      qryGetRepasseTurmadt_inicio_repasse.AsDateTime := StrToDate('01/'+mkedInicioRepasse.Text);
      qryGetRepasseTurma.Post;
      TfrmCadRepasses(formPai).habilitarBotoes(false);
   end
   else
   begin
      qryGetRepasseTurma.Edit;
      qryGetRepasseTurmavl_remessa.AsFloat            := edValor.getValorDouble;
      qryGetRepasseTurmanr_total_parcelas.AsInteger   := StrToInt(edQtdParcelas.Text);
      qryGetRepasseTurmadt_inicio_repasse.AsDateTime  := StrToDate('01/'+mkedInicioRepasse.Text);
      qryGetRepasseTurma.Post;
      TfrmCadRepasses(formPai).habilitarBotoes(false);
   end;
end;

procedure TfrmRepasseTurma.setCdTurma(sTurma: string);
begin
   cd_turma := sTurma;
end;

procedure TfrmRepasseTurma.setContrato(iContrato: Integer);
begin
   cd_contrato := iContrato;
end;

end.
