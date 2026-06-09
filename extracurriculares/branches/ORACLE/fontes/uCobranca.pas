unit uCobranca;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
   Menus, Buttons, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
   UZDataset, ZSqlUpdate, uFSelecionarPessoa;

type
  Tfrm_Cobranca = class(TForm)
    srcMatriculas: TDataSource;
    Bevel1: TBevel;
    grd: TDBGrid;
    pmQtd: TPopupMenu;
    sbFechar: TSpeedButton;
    Label1: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    Label2: TLabel;
    edCodPessoa: TEdit;
    sbProcuraPessoa: TSpeedButton;
    DBText1: TDBText;
    qyMatriculas: TUMZQuery;
    qyMatriculasnm_pessoa: TStringField;
    qyMatriculasCD_PESSOA: TIntegerField;
    qyMatriculasNR_MES: TIntegerField;
    qyMatriculasVL_TOTAL: TFloatField;
    qyMatriculasVL_DESCONTOS: TFloatField;
    qyMatriculasVL_PAGO: TFloatField;
    qyMatriculasDT_PAGAMENTO: TDateTimeField;
    qyMatriculasDS_MES: TStringField;
    qyMatriculasNR_ANOSEMESTRE: TIntegerField;
    updMatriculas: TZUpdateSQL;
    qyMatriculasVL_PENDENTE: TFloatField;
    pnlNome: TPanel;
    procedure qyMatriculasVL_PAGOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure grdDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbFecharClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure sbProcuraPessoaClick(Sender: TObject);
    procedure edCodPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure qyMatriculasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_Cobranca: Tfrm_Cobranca;

implementation

uses
   Main, uDM, UFInputMoney;

{$R *.DFM}

procedure Tfrm_Cobranca.grdDblClick(Sender: TObject);
const
   SCaption = 'UNIMESTRE';
   SConfirm = 'Confirmação';
   SInfo = 'Informação';
   SAtencao = 'Atenção';
   SMsgValorAlto =
         'O valor informado é superior ao valor líquido da parcela'#13 +
         'Deseja continuar mesmo assim?';
   SMsgValorBaixo =
         'O valor informado é inferior ao valor líquido da parcela.'#13 +
         'Deseja continuar mesmo assim?';
   SMsgConfirm =
   'A cobrança de: %s'#13'referente ao mês de %s'#13'foi efetuada com sucesso!';
   SMsgValorInv = 'Valor inválido'#13'Não é possível continuar.';
var
   Pendente, Valor: Currency;
   S, Prompt: string;
begin

   Pendente := qyMatriculasVL_PENDENTE.AsFloat;
   S := Format('%f', [Pendente]);
   Prompt := 'Valor a baixar:';

   if TfInputMoney.InputMoney(SCaption, Prompt, S) then
   begin
      if TryStrToCurr(S, Valor) then
      begin
         if Valor > 0 then
            if (Valor <= Pendente) or (MessageBox(Handle, PChar(SMsgValorAlto),
                  PChar(SConfirm), MB_ICONQUESTION + MB_YESNO) = ID_YES) then
               if (Valor = Pendente) or (MessageBox(Handle,
                     PChar(SMsgValorBaixo), PChar(SConfirm),
                     MB_ICONQUESTION + MB_YESNO) = ID_YES) then
               begin
                  qyMatriculas.Edit;
                  qyMatriculasVL_PAGO.AsFloat :=
                        qyMatriculasVL_PAGO.AsFloat + Valor;
                  qyMatriculasDT_PAGAMENTO.AsDateTime := DataHoje;
                  qyMatriculas.Post;
                  MessageBox(Handle, PChar(Format(SMsgConfirm, [
                        qyMatriculasnm_pessoa.AsString,
                        qyMatriculasDS_MES.AsString])), PChar(SInfo),
                        MB_ICONINFORMATION + MB_OK);
                  Filtra;
               end;
      end
      else
         MessageBox(Handle, PChar(SMsgValorInv), PChar(SAtencao),
               MB_ICONWARNING + MB_OK);
   end;
end;

procedure Tfrm_Cobranca.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Cobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Cobranca.txtDepartamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_Cobranca.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  txtAnoSemestre.text := IntToStr(ano_semestre);

  Filtra;

  txtAnoSemestre.SetFocus;

end;

procedure Tfrm_Cobranca.Filtra;
begin

  qyMatriculas.Close;
  qyMatriculas.ParamByName('nr_anosemestre').AsString := txtAnoSemestre.Text;
  qyMatriculas.ParamByName('cd_pessoa').AsString := edCodPessoa.Text;
  qyMatriculas.Open;

  edCodPessoa.SetFocus;

end;

procedure Tfrm_Cobranca.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyMatriculas, pmQtd);

end;

procedure Tfrm_Cobranca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Cobranca.sbFecharClick(Sender: TObject);
begin

Close;
end;

procedure Tfrm_Cobranca.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text)
  else
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);

  if edCodPessoa.Text <> '' then
    Filtra;

end;

procedure Tfrm_Cobranca.sbProcuraPessoaClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

  if resultado.filtrado then
  begin
    edCodPessoa.Text := IntToStr(resultado.cd_pessoa);
    Filtra;
  end;
end;

procedure Tfrm_Cobranca.edCodPessoaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 then
    Filtra;

end;

procedure Tfrm_Cobranca.qyMatriculasCalcFields(DataSet: TDataSet);
begin
   qyMatriculasDS_MES.AsString := LongMonthNames[qyMatriculasNR_MES.AsInteger];
   qyMatriculasVL_PENDENTE.AsFloat :=
         Abs(qyMatriculasVL_TOTAL.AsFloat - qyMatriculasVL_PAGO.AsFloat -
             qyMatriculasVL_DESCONTOS.AsFloat);
end;

procedure Tfrm_Cobranca.qyMatriculasVL_PAGOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.IsNull and (not qyMatriculas.IsEmpty) then
      Text := '0,00'
   else
      Text := Sender.AsString;
end;

end.
