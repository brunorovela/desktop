unit uFRepasseAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, udm, MidasLib, DBClient, ComCtrls, ToolWin, ImgList, uFCadRepasseAlunoTurma,
  General;
type
  TFrmRepasseAluno = class(TFrame)
    pnlDados: TPanel;
    dbgRepasse: TDBGrid;
    pnlTopoRepasse: TPanel;
    bvlSepTopo: TBevel;
    lblDescricao: TLabel;
    btnInsercaoAutomatica: TButton;
    pnlSubtitulo: TPanel;
    qryGetAlunos: TUMZQuery;
    qryGetAlunoscodigoaluno: TIntegerField;
    qryGetAlunosnm_pessoa: TStringField;
    qryGetAlunosvl_remessa: TFloatField;
    qryGetAlunosnr_total_parcelas: TIntegerField;
    cdsAlunosRepasse: TClientDataSet;
    dsAlunoRepasse: TDataSource;
    ImageList1: TImageList;
    qryVerificaRepasse: TUMZQuery;
    qryVerificaRepasserepetido: TLargeintField;
    bvlSep2: TBevel;
    cdsAlunosRepassenm_pessoa: TStringField;
    cdsAlunosRepassevl_liquido: TFloatField;
    cdsAlunosRepassecd_pessoa: TIntegerField;
    cdsAlunosRepassecd_turma: TStringField;
    cdsAlunosRepassenr_total_parcelas: TIntegerField;
    cdsAlunosRepassemes_ano_parcela: TStringField;
    qryGetAlunosmes_ano: TStringField;
    procedure cdsAlunosRepassemes_ano_parcelaSetText(Sender: TField;
      const Text: string);
    procedure cdsAlunosRepasseBeforeEdit(DataSet: TDataSet);
    procedure btnInsercaoAutomaticaClick(Sender: TObject);

  private
    { Private declarations }
    cd_contrato  : integer;
    cd_turma     : string;
    procedure carregaGrid;
  public
    formPai : tform ;
    procedure salvar;
    procedure cancel;
    procedure ativarFrame;
    procedure setContrato( iContrato : Integer);
    function  getContrato() : Integer;
    procedure setCdTurma( sTurma : string );
    function  getCdTurma() : string;

    { Public declarations }
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

implementation

uses
   ufCadRepasses, uUsuario;

{$R *.dfm}
procedure TFrmRepasseAluno.ativarFrame();
begin
   qryGetAlunos.Close;
   qryGetAlunos.ParamByName('cd_turma').AsString := getCdTurma();
   if (dm.UsaAnosemestre = true) then
   begin
      qryGetAlunos.ParamByName('anosemestre').AsInteger := frmCadRepasses.iAnoSemestre;
   end
   else
   begin
      qryGetAlunos.ParamByName('anosemestre').AsInteger := 1;
   end;
   qryGetAlunos.Open;
   carregaGrid;
end;

procedure TFrmRepasseAluno.cancel();
begin
   cdsAlunosRepasse.Cancel;
   ativarFrame;
end;

procedure TFrmRepasseAluno.salvar();
var
   dataRepasse : string;
   qryInsereRegistro : TUMZQuery;
begin
   dataRepasse := '';
   cdsAlunosRepasse.First;
   while not cdsAlunosRepasse.Eof do
   begin
      if ( cdsAlunosRepassevl_liquido.AsFloat <> 0 ) or
         ( cdsAlunosRepassenr_total_parcelas.AsInteger <> 0 ) or
         ( cdsAlunosRepassemes_ano_parcela.AsString <> '') then
      begin
         qryVerificaRepasse.Close;
         qryVerificaRepasse.ParamByName('cd_contrato').AsInteger := getContrato;
         qryVerificaRepasse.ParamByName('cd_pessoa').AsInteger   := cdsAlunosRepassecd_pessoa.AsInteger;
         qryVerificaRepasse.ParamByName('cd_turma').AsString     := cdsAlunosRepassecd_turma.AsString;
         qryVerificaRepasse.Open;
         dm.CriarConsulta(qryInsereRegistro);
         if qryVerificaRepasserepetido.AsInteger = 0 then
         begin
            qryInsereRegistro.SQL.Text := SQL_INSERT_REPASSE;
         end
         else
         begin
            qryInsereRegistro.SQL.Text := SQL_UPDATE_REPASSE;
         end;
         qryInsereRegistro.ParamByName('cd_contrato').AsInteger := getContrato;
         qryInsereRegistro.ParamByName('cd_pessoa').AsInteger   := cdsAlunosRepassecd_pessoa.AsInteger;
         qryInsereRegistro.ParamByName('cd_turma').AsString     := cdsAlunosRepassecd_turma.AsString;
         qryInsereRegistro.ParamByName('vl_remessa').AsFloat    := cdsAlunosRepassevl_liquido.AsFloat;
         qryInsereRegistro.ParamByName('nr_total_parcelas').AsInteger := cdsAlunosRepassenr_total_parcelas.AsInteger;
         if(cdsAlunosRepassemes_ano_parcela.AsString <> '')then
         begin
            dataRepasse :=  '01/'+cdsAlunosRepassemes_ano_parcela.AsString;
            qryInsereRegistro.ParamByName('dt_inicio_repasse').AsDate := StrToDate(dataRepasse);
         end;
         qryInsereRegistro.ExecSQL;
      end;
      cdsAlunosRepasse.Next;
   end;
end;


procedure TFrmRepasseAluno.btnInsercaoAutomaticaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.IndicaoRepasse', npEspecial, True ) then Abort;

   if FrmCadRepasseAlunoTurma = nil then
      Application.CreateForm(TFrmCadRepasseAlunoTurma , FrmCadRepasseAlunoTurma);

   FrmCadRepasseAlunoTurma.setContrato(getContrato);
   FrmCadRepasseAlunoTurma.setTurma(getCdTurma);
   FrmCadRepasseAlunoTurma.ShowModal;
   if (FrmCadRepasseAlunoTurma.bCancelou = false) then
   begin
      FreeAndNil(FrmCadRepasseAlunoTurma);
      TfrmCadRepasses(formPai).salvarContratoTurma;
      TfrmCadRepasses(formPai).atualizaContratos;
      ativarFrame();
   end;
end;

procedure TFrmRepasseAluno.carregaGrid;
begin
   cdsAlunosRepasse.Close;
   cdsAlunosRepasse.CreateDataSet;
   while not qryGetAlunos.Eof do
   begin
      cdsAlunosRepasse.Append;
      cdsAlunosRepassenm_pessoa.AsString          := qryGetAlunosnm_pessoa.AsString;
      cdsAlunosRepassecd_pessoa.AsInteger         := qryGetAlunoscodigoaluno.AsInteger;
      if( qryGetAlunosvl_remessa.AsFloat <> 0 ) then
      begin
         cdsAlunosRepassevl_liquido.AsFloat          := qryGetAlunosvl_remessa.AsFloat;
      end;
      if( qryGetAlunosnr_total_parcelas.AsFloat <> 0) then
      begin
         cdsAlunosRepassenr_total_parcelas.AsInteger := qryGetAlunosnr_total_parcelas.AsInteger;
      end;
      if qryGetAlunosmes_ano.AsString <> '' then
      begin
         cdsAlunosRepassemes_ano_parcela.AsString    := qryGetAlunosmes_ano.AsString;
      end;
      cdsAlunosRepassecd_turma.AsString           := getCdTurma;
      cdsAlunosRepasse.Post;
      qryGetAlunos.Next;
   end;
end;

procedure TFrmRepasseAluno.cdsAlunosRepasseBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Contratos.IndicaoRepasse', npAlterar, True ) then Abort;

   TfrmCadRepasses(formPai).habilitarBotoes(true);
end;

procedure TFrmRepasseAluno.cdsAlunosRepassemes_ano_parcelaSetText(
  Sender: TField; const Text: string);
begin
   try
      StrToDate('01/'+Text);
      Sender.Value := Text;
   except
      TfrmCadRepasses(formPai).bAbortar := True;
      Mensagem('Deve ser preenchida uma data válida','Atenção', MB_OK+MB_ICONEXCLAMATION, Handle);
      Abort;
   end;

end;

function TFrmRepasseAluno.getCdTurma() : string;
begin
   Result := cd_turma;
end;

procedure TFrmRepasseAluno.setCdTurma( sTurma : string);
begin
   cd_turma := sTurma;
end;

function TFrmRepasseAluno.getContrato : Integer;
begin
   Result := cd_contrato;
end;

procedure TFrmRepasseAluno.setContrato( iContrato : Integer );
begin
   cd_contrato := iContrato;
end;


end.
