unit uFRepasseCertificado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, DBClient, midaslib , uDM, General; 

type
  TFrmRepasseCertificado = class(TFrame)
    pnlPrincipal: TPanel;
    pnlTopoRepasse: TPanel;
    lblDescricao: TLabel;
    pnlPrincipalRepasse: TPanel;
    dbgRepasse: TDBGrid;
    qryGetAlunos: TUMZQuery;
    cdsCertificadoRepasse: TClientDataSet;
    qryGetAlunoscodigoaluno: TIntegerField;
    qryGetAlunosnm_pessoa: TStringField;
    cdsCertificadoRepassecd_pessoa: TIntegerField;
    cdsCertificadoRepassenm_pessoa: TStringField;
    cdsAtivo: TClientDataSet;
    cdsAtivocd_situacao: TIntegerField;
    cdsAtivods_situacao: TStringField;
    cdsCertificadoRepassedesc_certificado: TStringField;
    dsCertificado: TDataSource;
    cdsCertificadoRepassesn_certificado: TIntegerField;
    qryContrato: TUMZQuery;
    qryContratovl_contrato: TFloatField;
    qryVerificaRepasse: TUMZQuery;
    qryVerificaRepasserepetido: TLargeintField;
    cdsCertificadoRepassedt_repasse: TDateField;
    qryGetAlunosdt_inicio_repasse: TDateTimeField;
    qryContratocd_coligada: TLargeintField;
    qryGetAlunossn_repasse: TIntegerField;
    qryGetAlunoscd_repasse: TLargeintField;
    procedure qryGetAlunosCalcFields(DataSet: TDataSet);
    procedure dsCertificadoDataChange(Sender: TObject; Field: TField);
    procedure cdsCertificadoRepassedt_repasseSetText(Sender: TField;
      const Text: string);
    procedure dbgRepasseDblClick(Sender: TObject);
    procedure cdsCertificadoRepasseBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    cd_contrato  : integer;
    cd_turma     : string;
    bCarregando  : Boolean;
    procedure carregaGrid;
  public
    { Public declarations }
    formPai : TForm;
    function  getContrato() : Integer;
    function  getCdTurma() : string;
    procedure setCdTurma( sTurma : string );
    procedure setContrato( iContrato : Integer);
    procedure salvar();
    procedure ativarFrame;

  end;

const
   SQL_INSERT_REPASSE =     ''+
   'INSERT INTO conv_repasses '+
   '(                        '+
   '  cd_contrato,           '+
   '  cd_pessoa,             '+
   '  cd_turma,              '+
   '  vl_remessa,            '+
   '  nr_total_parcelas,     '+
   '  dt_inicio_repasse      '+
   ') VALUES                 '+
   '(                        '+
   '  :cd_contrato,          '+
   '  :cd_pessoa,            '+
   '  :cd_turma,             '+
   '  :vl_remessa,           '+
   '  :nr_total_parcelas,    '+
   '  :dt_inicio_repasse     '+
   ')                        ';

   SQL_UPDATE_REPASSE = ''+
   'UPDATE                                   '+
   '  conv_repasses                          '+
   'SET                                      '+
   '  vl_remessa = :vl_remessa,              '+
   '  nr_total_parcelas = :nr_total_parcelas,  '+
   '  dt_inicio_repasse = :dt_inicio_repasse '+
   'WHERE                                    '+
   '  cd_contrato = :cd_contrato AND         '+
   '  cd_pessoa = :cd_pessoa     AND         '+
   '  cd_turma = :cd_turma ';

   SQL_DELETE_REPASSE = ''+
   'DELETE                                   '+
   'FROM                                     '+
   '  conv_repasses                          '+
   'WHERE                                    '+
   '  cd_contrato = :cd_contrato AND         '+
   '  cd_pessoa = :cd_pessoa     AND         '+
   '  cd_turma = :cd_turma ';



implementation

uses
   uFCadRepasses, uItemCombo, uUsuario;

{$R *.dfm}

{ TFrmRepasseCertificado }

function TFrmRepasseCertificado.getCdTurma: string;
begin
   Result := cd_turma;
end;

function TFrmRepasseCertificado.getContrato: Integer;
begin
   Result := cd_contrato;
end;

procedure TFrmRepasseCertificado.qryGetAlunosCalcFields(DataSet: TDataSet);
begin
  if qryGetAlunoscd_repasse.AsInteger = 0 then
  begin
    qryGetAlunossn_repasse.AsInteger  := 0;
  end
  else
  begin
    qryGetAlunossn_repasse.AsInteger  := 1;
  end;
end;

procedure TFrmRepasseCertificado.setCdTurma(sTurma: string);
begin
   cd_turma := sTurma;
end;

procedure TFrmRepasseCertificado.setContrato(iContrato: Integer);
begin
   cd_contrato := iContrato;
end;

procedure TFrmRepasseCertificado.carregaGrid;
begin
   bCarregando := True;
   cdsCertificadoRepasse.Close;
   cdsCertificadoRepasse.CreateDataSet;
   while not qryGetAlunos.Eof do
   begin
      cdsCertificadoRepasse.Append;
      cdsCertificadoRepassecd_pessoa.AsInteger     := qryGetAlunoscodigoaluno.AsInteger;
      cdsCertificadoRepassenm_pessoa.AsString      := qryGetAlunosnm_pessoa.AsString;
     cdsCertificadoRepassesn_certificado.AsString := qryGetAlunossn_repasse.AsString;

      if( qryGetAlunosdt_inicio_repasse.AsDateTime <> 0) then
      begin
         cdsCertificadoRepassedt_repasse.AsDateTime   := qryGetAlunosdt_inicio_repasse.AsDateTime;
      end;
      cdsCertificadoRepasse.Post;
      qryGetAlunos.Next;
   end;
   bCarregando := false
end;
procedure TFrmRepasseCertificado.cdsCertificadoRepasseBeforeEdit(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.IndicaoRepasse', npAlterar, True ) then Abort;
   TfrmCadRepasses(formPai).habilitarBotoes(true);
end;

procedure TFrmRepasseCertificado.cdsCertificadoRepassedt_repasseSetText(
  Sender: TField; const Text: string);
begin
   try
      Sender.Value := StrToDate(Text);
   except
      TfrmCadRepasses(formPai).bAbortar := true;
      Mensagem('Deve ser preenchida uma data válida','Atenção', MB_OK+MB_ICONEXCLAMATION, Handle);
      Abort;
   end;
end;

procedure TFrmRepasseCertificado.dbgRepasseDblClick(Sender: TObject);
begin
   if (dbgRepasse.SelectedField = cdsCertificadoRepassedesc_certificado) then
   begin
      if cdsCertificadoRepasse.State = dsBrowse then
         cdsCertificadoRepasse.Edit;
      if( cdsCertificadoRepassesn_certificado.AsInteger = 1 ) then
      begin
         cdsCertificadoRepassesn_certificado.AsInteger := 0;
         cdsCertificadoRepassedt_repasse.Clear;
      end
      else
      begin
         cdsCertificadoRepassesn_certificado.AsInteger := 1;      
      end;
   end;
end;

procedure TFrmRepasseCertificado.dsCertificadoDataChange(Sender: TObject;
  Field: TField);
begin
   if Field <> nil then
   begin
      if (bCarregando = false) AND (Field.FieldName = 'desc_certificado') then
      begin
         bCarregando := True;
         if (cdsCertificadoRepassedesc_certificado.AsString = 'Sim') then
         begin
             cdsCertificadoRepassedt_repasse.AsDateTime :=  Now;
         end
         else
         begin
            cdsCertificadoRepassedt_repasse.Clear;
         end;
         bCarregando := false;
      end;
   end;

end;

procedure TFrmRepasseCertificado.ativarFrame();
begin
   bCarregando :=  false;
   qryGetAlunos.Close;
   qryGetAlunos.ParamByName('cd_turma').AsString     := getCdTurma;
   if (dm.UsaAnosemestre = true) then
   begin
      qryGetAlunos.ParamByName('anosemestre').AsInteger := frmCadRepasses.iAnoSemestre;
   end
   else
   begin
      qryGetAlunos.ParamByName('anosemestre').AsInteger := 1;
   end;
   qryGetAlunos.Open;

   cdsAtivo.Close;
   cdsAtivo.CreateDataSet;

   cdsAtivo.Append;
   cdsAtivocd_situacao.AsInteger := 0;
   cdsAtivods_situacao.AsString  := 'Não';
   cdsAtivo.Post;

   cdsAtivo.Append;
   cdsAtivocd_situacao.AsInteger := 1;
   cdsAtivods_situacao.AsString  := 'Sim';
   cdsAtivo.Post;

   carregaGrid;
end;

procedure TFrmRepasseCertificado.salvar();
var
   qryInsereRepasse : TUMZQuery;
begin
   DM.CriarConsulta(qryInsereRepasse);
   qryContrato.Close;
   qryContrato.ParamByName('cd_contrato').AsInteger := getContrato;
   qryContrato.Open;
   cdsCertificadoRepasse.First;
   while not(cdsCertificadoRepasse.Eof) do
   begin
      if cdsCertificadoRepassesn_certificado.AsInteger = 1 then
      begin
         qryVerificaRepasse.Close;
         qryVerificaRepasse.ParamByName('cd_contrato').AsInteger := getContrato;
         qryVerificaRepasse.ParamByName('cd_turma').AsString     := getCdTurma;
         qryVerificaRepasse.ParamByName('cd_pessoa').AsInteger   := cdsCertificadoRepassecd_pessoa.AsInteger;
         qryVerificaRepasse.Open;
         if( qryVerificaRepasserepetido.AsInteger  = 0 )then
         begin
            qryInsereRepasse.SQL.Text := SQL_INSERT_REPASSE;
         end
         else
         begin
            qryInsereRepasse.SQL.Text := SQL_UPDATE_REPASSE;
         end;
         qryInsereRepasse.ParamByName('cd_contrato').AsInteger := getContrato;
         qryInsereRepasse.ParamByName('cd_pessoa').AsInteger   := cdsCertificadoRepassecd_pessoa.AsInteger;
         qryInsereRepasse.ParamByName('cd_turma').AsString     := getCdTurma;
         qryInsereRepasse.ParamByName('vl_remessa').AsFloat    := qryContratovl_contrato.AsFloat;
         qryInsereRepasse.ParamByName('nr_total_parcelas').AsFloat    := 1;
         qryInsereRepasse.ParamByName('dt_inicio_repasse').AsDateTime := cdsCertificadoRepassedt_repasse.AsDateTime;
         qryInsereRepasse.ExecSQL;
      end
      else
      begin
         qryInsereRepasse.SQL.Text := SQL_DELETE_REPASSE;
         qryInsereRepasse.ParamByName('cd_contrato').AsInteger := getContrato;
         qryInsereRepasse.ParamByName('cd_pessoa').AsInteger   := cdsCertificadoRepassecd_pessoa.AsInteger;
         qryInsereRepasse.ParamByName('cd_turma').AsString     := getCdTurma;
         qryInsereRepasse.ExecSQL;
         DM.setLog(2100 , 'Exclusao',intToStr(getContrato)+':'+cdsCertificadoRepassecd_pessoa.AsString+':'+getCdTurma, qryContratocd_coligada.AsInteger,'O certificado foi marcado como não impresso');
      end;
      cdsCertificadoRepasse.Next;
   end;
   FreeAndNil(qryInsereRepasse);
   ativarFrame;
end;


end.
