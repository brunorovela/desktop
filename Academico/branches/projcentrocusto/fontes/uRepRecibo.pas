unit uRepRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmRepRecibo = class(TForm)
    tblMensalidades: TUMZQuery;
    tblMensalidadesCodigoAluno: TIntegerField;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorJuros: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesNome: TStringField;
    tblMensalidadesResponsavel: TStringField;
    tblMensalidadesDescricao: TStringField;
    tblMensalidadesContrato: TStringField;
    tblMensalidadesNomeTurma: TStringField;
    tblMensalidadesReferente: TStringField;
    tblMensalidadesExtenso: TStringField;
    tblMensalidadesCodigo: TStringField;
    tblMensalidadesDepto: TSmallintField;
    tblMensalidadesBloqueto: TStringField;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblInserir: TUMZQuery;
    tblAux: TUMZQuery;
    qyAux: TUMZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TFinReciboManager = class(TObject)
  private
    AMensalidade: TUMZQuery;
    ACodigoMensalidade: Integer;
    procedure loadMensalidade();
    function inserirRecibo(): Integer;
    function valorParaExtenso(): String;
    function getProximoNumeroRecibo(): Integer;
    function EhEstorno(): Boolean;
  public
    constructor Create(iCodMensalidade: Integer);
    procedure setMensalidade(iCodMensalidade: Integer);
    function imprimirRecibo(): Boolean;
    function estornarMensalidade(): Boolean;
  end;



var
  frmRepRecibo: TfrmRepRecibo;
  oRecibo: TFinReciboManager;

implementation

uses Main, uDM;

{$R *.DFM}

{ TFinReciboManager }

constructor TFinReciboManager.Create(iCodMensalidade: Integer);
begin
  setMensalidade(iCodMensalidade);
end;

function TFinReciboManager.EhEstorno: Boolean;
var
  AQuery: TUMZQuery;
begin
  //cria a consulta
  DM.CriarConsulta(AQuery);
  AQuery.SQL.Text := 'SELECT sn_estorno FROM recibos WHERE cd_recibo = ' + AMensalidade.FieldByName('cd_recibo').AsString;
  AQuery.Open();
  
  Result := AQuery.FieldByName('sn_estorno').AsInteger = 1;
end;

function TFinReciboManager.estornarMensalidade(): Boolean;
var
  AQuery: TUMZQuery;
begin
  Result := True;
  //checa se tem recibo
  if (AMensalidade.FieldByName('cd_recibo').AsInteger > 0) then begin
    //tem recibo, remove as informacoes
    if (Mensagem('Você está tentando estornar uma mensalidade que possui recibo já impresso! Tem certeza que deseja prosseguir?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes) then begin
      DM.CriarConsulta(AQuery);
      // AQuery.RequestLive := False;
      //remove do recibo primeiro
      AQuery.SQL.Text := 'UPDATE recibos SET sn_estorno = 1, cd_turma = NULL, nr_parcela = NULL, dt_vencimento = NULL, nr_impressoes = 0 WHERE cd_recibo = :cd_recibo';
      AQuery.ParamByName('cd_recibo').AsInteger := AMensalidade.FieldByName('cd_recibo').AsInteger;
      AQuery.ExecSQL();

      // Não vou remover a ligação da mensalidade para poder imprimir RECIBO com informações do ESTORNO.
      //remove as informacoes da mensalidade
      // AQuery.SQL.Text := 'UPDATE mensalidades SET cd_recibo = NULL WHERE cd_mensalidade = :cd_mensalidade';
      // AQuery.ParamByName('cd_mensalidade').AsInteger := AMensalidade.FieldByName('cd_mensalidade').AsInteger;
      // AQuery.ExecSQL();
      // Result := True;
    end
    else begin
      Result := False;
    end;
  end;
end;


function TFinReciboManager.getProximoNumeroRecibo: Integer;
var
  AQuery: TUMZQuery;
  sValor: string;
  iRet : Integer;
begin
  //cria a consulta
  DM.CriarConsulta(AQuery);
  AQuery.SQL.Text := 'SELECT MAX(nr_recibo) as maximo FROM recibos';
  AQuery.Open();
  Result := 0;
  if (AQuery.IsEmpty() or AQuery.FieldByName('maximo').IsNull) then begin
    //pega do parametro
    sValor := DM.variavel_parametro('fin_inicio_nr_recibo');
    try
      iRet := StrToInt(sValor);
    except
      iRet := 1;
    end;
  end
  else begin
    iRet := AQuery.FieldByName('maximo').AsInteger + 1;
  end;
  Result := iRet;
end;

function TFinReciboManager.imprimirRecibo(): Boolean;
var
  AQuery: TUMZQuery;
begin
  try
  if ((AMensalidade.FieldByName('cd_recibo').AsString = '') OR EhEstorno()) then begin
    //nao tem recibo na tabela, tenta inserir.
    inserirRecibo();
  end
  else begin
    //atualiza data
    //cria a consulta
    DM.CriarConsulta(AQuery);
    // AQuery.RequestLive := False;
    AQuery.SQL.Text := 'UPDATE recibos SET dt_impressao = NOW(), nr_impressoes = nr_impressoes+1 WHERE cd_recibo = :cd_recibo';
    AQuery.ParamByName('cd_recibo').AsInteger := AMensalidade.FieldByName('cd_recibo').AsInteger;
    AQuery.ExecSQL();
    FreeAndNil(AQuery);
  end;
  except
     //ignorar
  end;
end;

function TFinReciboManager.inserirRecibo(): Integer;
var
  AQuery: TUMZQuery;
  iRecibo: Integer;
begin

  iRecibo := getProximoNumeroRecibo();

  //cria a consulta
  DM.CriarConsulta(AQuery);
  // AQuery.RequestLive := False;  
  AQuery.SQL.Text := 'INSERT INTO recibos '+
    '(cd_mensalidade, cd_aluno, nr_parcela, cd_turma, dt_vencimento, dt_impressao, dt_recibo, ds_extenso, nr_recibo, cd_pessoa ) '+
    ' VALUES '                                                                                              +
    '(:cd_mensalidade, :cd_aluno, :nr_parcela, :cd_turma, :dt_vencimento, NOW(), NOW(), :ds_extenso, :nr_recibo, :cd_pessoa ) ';
  AQuery.ParamByName('cd_mensalidade').AsInteger := ACodigoMensalidade;
  AQuery.ParamByName('cd_aluno').AsInteger := AMensalidade.FieldByName('codigoaluno').ASInteger;
  AQuery.ParamByName('nr_parcela').AsInteger := AMensalidade.FieldByName('parcela').AsInteger;
  AQuery.ParamByName('dt_vencimento').AsString := FormatDateTime('yyyy-mm-dd', AMensalidade.FieldByName('datavencimento').AsDateTime);
  AQuery.ParamByName('cd_turma').AsString := AMensalidade.FieldByName('turma').AsString;
  AQuery.ParamByName('ds_extenso').AsString := valorParaExtenso();
  AQuery.ParamByName('nr_recibo').AsInteger := iRecibo;
  AQuery.ParamByName('cd_pessoa').AsInteger := DM.iCdPessoaLogado;
  AQuery.ExecSQL();

  //carrega o ultimo id
  Result := DM.LastInsert();

  //atualiza amensalidade
  AQuery.SQL.Text := 'UPDATE mensalidades SET cd_recibo = :cd_recibo WHERE cd_mensalidade = :cd_mensalidade';
  AQuery.ParamByName('cd_mensalidade').AsInteger := AMensalidade.FieldByName('cd_mensalidade').AsInteger;
  AQuery.ParamByName('cd_recibo').AsInteger := Result;
  AQuery.ExecSQL();
  loadMensalidade();
  FreeAndNil(AQuery);
end;

procedure TFinReciboManager.loadMensalidade;
begin
  if (AMensalidade <> nil) then begin
    AMensalidade.Close();
  end;
  FreeAndNil(AMensalidade);
  //cria a consulta
  DM.CriarConsulta(AMensalidade);
  AMensalidade.SQL.Text := 'SELECT * FROM mensalidades WHERE cd_mensalidade = :codigo';
  AMensalidade.ParamByName('codigo').AsInteger := ACodigoMensalidade;
  AMensalidade.Open();
end;

procedure TFinReciboManager.setMensalidade(iCodMensalidade: Integer);
begin
  if (iCodMensalidade <> ACodigoMensalidade) then begin
    ACodigoMensalidade := iCodMensalidade;
    loadMensalidade();
  end;
end;

function TFinReciboManager.valorParaExtenso(): String;
var
  strRetorno : String;
  n : Integer;
begin

  { Extenso }
  acRetorno := '';
  Converte(AMensalidade.FieldByName('valorpago').AsFloat);

  n := 0;
  strRetorno := '(';
  while acRetorno[n] <> #0 do
  begin
    strRetorno := strRetorno + acRetorno[n];
    Inc( n );
  end;
  strRetorno := Uppercase( strRetorno );
  strRetorno := strRetorno + ' ) * ';

  while Length( strRetorno ) < 250 do
  begin
    strRetorno := strRetorno + '* ';
  end;
  Result := strRetorno;
end;

end.

