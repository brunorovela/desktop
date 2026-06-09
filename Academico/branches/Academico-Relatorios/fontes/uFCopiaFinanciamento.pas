unit uFCopiaFinanciamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, General;

type
  TformCopiaFinanceiro = class(TForm)
    Panel1: TPanel;
    pnTitulo: TPanel;
    Panel3: TPanel;
    gbDestino: TGroupBox;
    lbDTAnoSem: TLabel;
    edAnoSemDest: TMaskEdit;
    udDAnoSem: TUpDown;
    pnMatricula: TPanel;
    gbOrigem: TGroupBox;
    lbOTAnoSem: TLabel;
    UpDown1: TUpDown;
    edAnoSemOrigem: TMaskEdit;
    Bevel9: TBevel;
    Panel2: TPanel;
    btnCopiarTurma: TSpeedButton;
    qryInsereBolsas: TUMZQuery;
    qryBuscaFinan: TUMZQuery;
    qryLimpaBolsas: TUMZQuery;
    procedure btnCopiarTurmaClick(Sender: TObject);
    procedure udDAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
  private
    procedure gravalog(strDadosExcluidos:String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCopiaFinanceiro: TformCopiaFinanceiro;

implementation

USES uDM, uUsuario;

{$R *.dfm}
procedure TformCopiaFinanceiro.btnCopiarTurmaClick(Sender: TObject);
var
   numExistentes : Integer;
   msg: String;
begin
   if(edAnoSemOrigem.Text = '') OR (edAnoSemDest.Text = '') then
   begin
      exit;
   end;

   qryBuscaFinan.ParamByName('anosemdest').AsString := edAnoSemDest.Text;
   qryBuscaFinan.Open;

   numExistentes := qryBuscaFinan.FieldByName('countpessoas').AsInteger;
   if (numExistentes > 0) then
   begin
      msg :=  'Existem '+ IntToStr(numExistentes) + ' alunos com dados gerados em ' + edAnoSemDest.Text +
         '. Deseja sobrescrever as informações com os dados de ' + edAnoSemOrigem.Text +
         ', ou manter o que ja foi informando em ' + edAnoSemDest.Text + ' ?';

      if (Mensagem(msg,Application.Title, MB_YESNO + MB_ICONWARNING ) = mrNo) then
      begin
         exit;
      end;

      qryLimpaBolsas.ParamByName('anoatual').AsString := edAnoSemDest.Text;
      qryLimpaBolsas.ExecSQL;
   end;

   qryInsereBolsas.ParamByName('anosemorigem').AsString := edAnoSemOrigem.Text;
   qryInsereBolsas.ParamByName('anosemdestino').AsString := edAnoSemDest.Text;
   qryInsereBolsas.ExecSQL;

   gravalog(IntToStr(numExistentes));

   if (Mensagem('Operação realizada com sucesso, deseja continuar na tela?',Application.Title, MB_YESNO + MB_ICONWARNING ) = mrNo) then
   begin
      self.Close;
   end;
end;

procedure TformCopiaFinanceiro.FormShow(Sender: TObject);
var
   anoSemAtual: integer;
   anoAtual: Integer;
begin
   anoSemAtual := DM.GetAnoSemestreAtual;
   anoAtual := strtoint(copy(inttostr(anoSemAtual),0,4));
   edAnoSemOrigem.Text := inttostr(anoAtual);
   inc(anoAtual);
   edAnoSemDest.Text := inttostr(anoAtual);
end;

procedure TformCopiaFinanceiro.gravalog(strDadosExcluidos:String);
const
   SQL_GRAVA_LOG =
      'INSERT INTO log_geral (cd_usuario,dt_log,cd_modulo,cd_chave,cd_operacao,cd_coligada,ds_observacoes) '+
      'VALUES (:usuario,NOW(),1058,:chave,0,:coligada,:observacao) ';
var
   qyGravaLog : TUMZQuery;
   observacao : String;
begin
   DM.CriarConsulta( qyGravaLog );

   observacao := ' Importados dados do ano ' + edAnoSemOrigem.Text + ' para ' + edAnoSemDest.Text;

   if(strDadosExcluidos > '0') then
   begin
      observacao := observacao + '. Substituidos ' + strDadosExcluidos + ' dados ja existentes';
   end;

   observacao := observacao + '.';

   qyGravaLog.SQL.Text := SQL_GRAVA_LOG;
   qyGravaLog.ParamByName('usuario').AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
   qyGravaLog.ParamByName('coligada').AsInteger := dm.UsuarioLogado.ColigadaLogada;
   qyGravaLog.ParamByName('observacao').AsString := observacao;
   qyGravaLog.ParamByName('chave').AsString := 'Pessoas -> Financiamento Estundantil';

   qyGravaLog.ExecSQL;

   FreeAndNil(qyGravaLog);
end;

procedure TformCopiaFinanceiro.udDAnoSemClick(Sender: TObject; Button: TUDBtnType);
var
   novoAno:Integer;
begin
   case Button of
      btNext:
      begin
         novoAno := (strtoint(edAnoSemDest.Text)) + 1;
      end;
      btPrev:
         novoAno := (strtoint(edAnoSemDest.Text)) - 1;
   end;

   edAnoSemDest.Text := inttostr(novoAno);
end;

procedure TformCopiaFinanceiro.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
   novoAno:Integer;
begin
   case Button of
      btNext:
      begin
         novoAno := (strtoint(edAnoSemOrigem.Text)) + 1;
      end;
      btPrev:
         novoAno := (strtoint(edAnoSemOrigem.Text)) - 1;
   end;

   edAnoSemOrigem.Text := inttostr(novoAno);
end;

end.
