unit UFMatriculasTotais;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, DBClient, Provider,
   Grids, DBGrids, StdCtrls;

type
   TfrmMatriculasTotais = class(TForm)
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      cdsIngressos: TClientDataSet;
      cdsIngressosCD_INGRESSO: TIntegerField;
      cdsIngressosDS_INGRESSO: TStringField;
      cdsIngressosNR_QUANTIDADE: TIntegerField;
      cdsIngressosSN_ATIVO: TSmallintField;
      cdsSituacoes: TClientDataSet;
      cdsSituacoesCD_SITUACAO: TIntegerField;
      cdsSituacoesCD_SITUACAO_PAI: TIntegerField;
      cdsSituacoesDS_SITUACAO: TStringField;
      cdsSituacoesNR_ORDEM_FINAL: TIntegerField;
      cdsSituacoesNR_QUANTIDADE: TIntegerField;
      cdsSituacoesNR_QUANTIDADE_ATIVO: TIntegerField;
      cdsSituacoesSUM_TOTAL_ATIVO: TAggregateField;
      dbgIngressos: TDBGrid;
      dbgSituacoes: TDBGrid;
      dsIngressos: TDataSource;
      dspIngressos: TDataSetProvider;
      dspSituacoes: TDataSetProvider;
      dsSituacoes: TDataSource;
      lblAtivos: TLabel;
      lblAtivosNumero: TLabel;
      lblTotal: TLabel;
      lblTotalNumero: TLabel;
      pnlIngressos: TPanel;
      pnlIngressosTitulo: TPanel;
      pnlQuantidades: TPanel;
      pnlSituacoes: TPanel;
      pnlSituacoesTitulo: TPanel;
      pnlTotais: TPanel;
      qryIngressos: TUMZReadOnlyQuery;
      qryIngressosCD_INGRESSO: TIntegerField;
      qryIngressosDS_INGRESSO: TStringField;
      qryIngressosSN_ATIVO: TSmallintField;
      qrySituacoes: TUMZReadOnlyQuery;
      qrySituacoesCD_SITUACAO: TIntegerField;
      qrySituacoesCD_SITUACAO_PAI: TIntegerField;
      qrySituacoesDS_SITUACAO: TStringField;
      qrySituacoesNR_ORDEM_FINAL: TIntegerField;
      procedure cdsIngressosCalcFields(DataSet: TDataSet);
      procedure cdsSituacoesCalcFields(DataSet: TDataSet);
      procedure FormDeactivate(Sender: TObject);
   public
      procedure Load;
   end;

var
   frmMatriculasTotais: TfrmMatriculasTotais;

implementation

uses
   uMatriculas;

{$R *.dfm}

procedure TfrmMatriculasTotais.cdsIngressosCalcFields(DataSet: TDataSet);
const
   FilterFmt = 'CD_INGRESSO = %d';
var
   S: AnsiString;
   I: Integer;
begin
   if DataSet.State = dsInternalCalc then
   begin
      S := Format(FilterFmt, [DataSet.FieldByName('CD_INGRESSO').AsInteger]);
      frmMatriculas.tblMatriculas.Filter := S;
      I := frmMatriculas.tblMatriculas.RecordCount;
      DataSet.FieldByName('NR_QUANTIDADE').AsInteger := I;
   end;
end;

procedure TfrmMatriculasTotais.cdsSituacoesCalcFields(DataSet: TDataSet);
const
   FilterFmt = 'SITUACAO = %d';
var
   S: AnsiString;
   I: Integer;
begin
   if DataSet.State = dsInternalCalc then
   begin
      S := Format(FilterFmt, [DataSet.FieldByName('CD_SITUACAO').AsInteger]);
      frmMatriculas.tblMatriculas.Filter := S;
      I := frmMatriculas.tblMatriculas.RecordCount;
      DataSet.FieldByName('NR_QUANTIDADE').AsInteger := I;

      if DataSet.FieldByName('CD_SITUACAO_PAI').AsInteger in [3, 4, 5, 6, 7, 8] then
         DataSet.FieldByName('NR_QUANTIDADE_ATIVO').AsInteger := 0
      else
         DataSet.FieldByName('NR_QUANTIDADE_ATIVO').AsInteger := I;
   end;
end;

procedure TfrmMatriculasTotais.FormDeactivate(Sender: TObject);
begin
   Hide;
end;

procedure TfrmMatriculasTotais.Load;
const
   FmtInteger = '%d';
var
   Bookmark: TBookmark;
begin
   Bookmark := frmMatriculas.tblMatriculas.GetBookmark;
   frmMatriculas.tblMatriculas.DisableControls;
   frmMatriculas.tblMatriculas.Filtered := True;

   cdsSituacoes.DisableControls;
   cdsIngressos.DisableControls;
   
   cdsSituacoes.Close;
   cdsIngressos.Close;

   cdsSituacoes.Open;
   cdsIngressos.Open;

   lblAtivosNumero.Caption := cdsSituacoesSUM_TOTAL_ATIVO.AsString;

   frmMatriculas.tblMatriculas.Filtered := False;
   lblTotalNumero.Caption := Format(FmtInteger, [frmMatriculas.tblMatriculas.RecordCount]);

   cdsSituacoes.EnableControls;
   cdsIngressos.EnableControls;

   frmMatriculas.tblMatriculas.EnableControls;
   frmMatriculas.tblMatriculas.GotoBookmark(Bookmark);
end;

end.
