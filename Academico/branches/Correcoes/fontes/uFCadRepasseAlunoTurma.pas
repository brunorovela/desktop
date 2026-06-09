unit uFCadRepasseAlunoTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UMEditMonetario, ComCtrls, ToolWin, ImgList, Mask,
  DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, General ;

type
  TFrmCadRepasseAlunoTurma = class(TForm)
    pnlPrincipal: TPanel;
    pnlTop: TPanel;
    bvlSep1: TBevel;
    lblValor: TLabel;
    edValorRepasse: TUMEditMonetario;
    lblQtdParcelas: TLabel;
    edQtdParcelas: TEdit;
    mkIniciarRepasse: TMaskEdit;
    lblIniciarRepasse: TLabel;
    ImageList1: TImageList;
    toolAcoes: TToolBar;
    ToolButton22: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton35: TToolButton;
    qryGetAlunoRepasse: TUMZQuery;
    qryGetAlunoRepassecodigoaluno: TIntegerField;
    qryGetAlunoRepassenm_pessoa: TStringField;
    qryGetAlunoRepassevl_remessa: TFloatField;
    qryGetAlunoRepassenr_total_parcelas: TIntegerField;
    qryGetAlunoRepassemes_ano: TStringField;
    qryVerificaRepasse: TUMZQuery;
    qryVerificaRepasserepetido: TLargeintField;
    qryInformacoesContratos: TUMZQuery;
    qryInformacoesContratosvl_contrato: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    cd_contrato : Integer;
    cd_turma    : string;
  public
    { Public declarations }
    bCancelou   : Boolean;
    function getContrato() : integer;
    procedure setContrato( iCdContrato : integer );
    function getTurma() : string;
    procedure setTurma( iCdTurma : string );
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
   
var
  FrmCadRepasseAlunoTurma: TFrmCadRepasseAlunoTurma;

implementation
uses
uFCadRepasses;

{$R *.dfm}

{ TFrmCadRepasseAlunoTurma }

procedure TFrmCadRepasseAlunoTurma.btnCancelarClick(Sender: TObject);
begin
   bCancelou :=  True;
   Close;
end;

procedure TFrmCadRepasseAlunoTurma.btnSalvarClick(Sender: TObject);
var
   qryInsereRegistro : TUMZQuery;
   DataRepasse : string;
begin
   
   bCancelou :=  false;
   DataRepasse := '';
   qryInformacoesContratos.Close;
   qryInformacoesContratos.ParamByName('cd_contrato').AsInteger := getContrato;
   qryInformacoesContratos.Open;

   qryGetAlunoRepasse.Close;
   qryGetAlunoRepasse.ParamByName('cd_turma').AsString := getTurma;
   if (dm.UsaAnosemestre = true) then
   begin
      qryGetAlunoRepasse.ParamByName('anosemestre').AsInteger := frmCadRepasses.iAnoSemestre;
   end
   else
   begin
      qryGetAlunoRepasse.ParamByName('anosemestre').AsInteger := 1;
   end;

   qryGetAlunoRepasse.Open;
   while not( qryGetAlunoRepasse.eof ) do
   begin
      qryVerificaRepasse.Close;
      qryVerificaRepasse.ParamByName('cd_contrato').AsInteger := getContrato;
      qryVerificaRepasse.ParamByName('cd_pessoa').AsInteger   := qryGetAlunoRepassecodigoaluno.AsInteger;
      qryVerificaRepasse.ParamByName('cd_turma').AsString     := getTurma;
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
      qryInsereRegistro.ParamByName('cd_pessoa').AsInteger   := qryGetAlunoRepassecodigoaluno.AsInteger;
      qryInsereRegistro.ParamByName('cd_turma').AsString     := getTurma;
      qryInsereRegistro.ParamByName('vl_remessa').AsFloat    := edValorRepasse.getValorDouble;
      try
         qryInsereRegistro.ParamByName('nr_total_parcelas').AsInteger := StrToInt(edQtdParcelas.text);
      except
         Mensagem('O campo quantidade de parcelas é de preenchimento obrigatório' , 'Atenção' , MB_OK+MB_ICONEXCLAMATION, Handle);
         Abort;
      end;
      if(mkIniciarRepasse.Text <> '')then
      begin
         try
            dataRepasse :=  '01/'+mkIniciarRepasse.Text;
            StrToDate(DataRepasse);
         except
            Mensagem('Deve ser preenchida uma data válida','Atenção', MB_OK+MB_ICONEXCLAMATION, Handle);
            Abort;
         end;

         qryInsereRegistro.ParamByName('dt_inicio_repasse').AsDate := StrToDate(dataRepasse);


      end;
      qryInsereRegistro.ExecSQL;
      qryGetAlunoRepasse.Next;
   end;
   Close;
end;

procedure TFrmCadRepasseAlunoTurma.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key =  VK_F5 then
      btnSalvar.Click
   else  if key = VK_F6 then
      btnCancelar.Click;
end;

procedure TFrmCadRepasseAlunoTurma.FormShow(Sender: TObject);
begin
    bCancelou := False;
end;

function TFrmCadRepasseAlunoTurma.getContrato : integer;
begin
   result := cd_contrato;
end;

function TFrmCadRepasseAlunoTurma.getTurma: string;
begin
   Result := cd_turma;
end;

procedure TFrmCadRepasseAlunoTurma.setContrato(iCdContrato : integer);
begin
   cd_contrato := iCdContrato;
end;

procedure TFrmCadRepasseAlunoTurma.setTurma(iCdTurma: string);
begin
   cd_turma := iCdTurma;
end;

end.
