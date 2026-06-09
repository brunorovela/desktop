unit uBaixaBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls, Menus, uClassMovimento, ZConnection,
  StdCtrls, Buttons, DBCtrls;

type
  TfrmBaixarBanco = class(TForm)
    DBGrid1: TDBGrid;
    dtcMensalidades: TDataSource;
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    lbCodigo: TLabel;
    Label2: TLabel;
    lbNome: TLabel;
    btnCodigoAluno: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    btBaixar: TBitBtn;
    btFechar: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure btBaixarClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure Filtrar;
    Procedure CorrigirRejeitados;
  public
    { Public declarations }
    iCodigoAluno : Integer;
    sNomeAluno : String;
  end;

var
  frmBaixarBanco: TfrmBaixarBanco;

implementation

{$R *.DFM}

uses uDM, uRetornoCEF, uSelCaixa, uFSelecionarPessoa, uExportaContabil;

procedure TfrmBaixarBanco.btBaixarClick(Sender: TObject);
begin
  // Baixar
  DBGrid1DblClick(nil);
end;

procedure TfrmBaixarBanco.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
     iCodigoAluno := resultado_filtro.cd_pessoa;
     sNomeAluno :=  resultado_filtro.nm_pessoa;

     filtrar();
   end
   else Exit;
end;

procedure TfrmBaixarBanco.CorrigirRejeitados;
begin
    
end;

procedure TfrmBaixarBanco.DBGrid1DblClick(Sender: TObject);
var
  wAno, wMes, wDia : Word;
  intSituacao : Integer;
  dblParcial : Double;
  flg : Boolean;
  NovoJuros : Currency;
  NovoBruto : Currency;
  ValorTotal : Currency;
  iCodMovTe : Integer;
  conta : Integer;
  conta_coligada :Integer;
  cValorRetorno : Currency;
  Movimento : Tmovimento;

  qRetorno : TUMZQuery;

begin

  if DM.tblMensalidadesSituacao.AsInteger in [0, 1] then Exit;

  if Mensagem( 'Deseja baixar esta parcela manualmente ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then exit;

  if Mensagem('Não foi possível identificar a conta para lançar as baixas. Deseja selecionar a conta manualmente?', Application.Title, MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON1 )
  <> mrYes then Exit;

  frm_SelCAixa.ShowModal;

  if frm_SelCaixa.flgSearch then begin
     conta := frm_SelCaixa.qyCaixacd_caixa.AsInteger;
     conta_coligada := frm_SelCaixa.qyCaixacd_coligada.AsInteger;
  end
  else begin
     
     exit;
  end;

  flg := False;

  try

  // Verificar Valor para Baixar Se o valor do retorno for maior, dar a possibilidade de criar uma parcial do retorno;
  //

  DM.tblMensalidades.Edit;

  Dm.tblMensalidadescd_coligada.AsInteger := conta_coligada;
  
  DM.tblMensalidadesDataPagamento.AsString := frm_Retorno_Banco.tblItensDataPagamento.AsString;
  Dm.tblMensalidadesdt_credito.AsString := frm_Retorno_Banco.tblItensdt_credito.AsString;

  cValorRetorno := frm_Retorno_Banco.tblItensValorPago.AsCurrency;

  if cValorRetorno > Dm.tblMensalidadesValorTotalCalc.Value then begin
     case Mensagem('O valor pago neste retorno é maior do que o valor total da mensalidade selecionada. Deseja manter a diferença em aberto para baixar em outra parcela posteriormente?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) of
        mrCancel : Exit;

        mrYes : begin
           DM.CriarConsulta(qRetorno);
           qRetorno.SQL.Text :=
             ' INSERT INTO itensretorno (codigoretorno, ocorrencia, cd_ocorrencia, ' +
             '    vencimento, valortitulo, nossonumero, valorpago, valoracrescimo,      ' +
             '    codigoaluno, parcela, sequencianoarquivo, datapagamento, dt_credito)  ' +
             ' VALUES (:codigoretorno, :ocorrencia, :cd_ocorrencia,         ' +
             '    :vencimento, :valortitulo, :nossonumero, :valorpago, :valoracrescimo, ' +
             '    :codigoaluno, :parcela, :sequencianoarquivo, :datapagamento, :dt_credito) ';

           qRetorno.ParamByName('codigoretorno').AsInteger := frm_Retorno_Banco.tblItensCodigoRetorno.AsInteger;
           qRetorno.ParamByName('ocorrencia').AsString := 'Retorno Parcial';
           qRetorno.ParamByName('cd_ocorrencia').AsString := frm_Retorno_Banco.tblItenscd_ocorrencia.AsString;
           qRetorno.ParamByName('vencimento').AsDateTime := frm_Retorno_Banco.tblItensVencimento.AsDateTime;
           qRetorno.ParamByName('valortitulo').AsFloat := cValorRetorno - Dm.tblMensalidadesValorTotalCalc.Value;
           qRetorno.ParamByName('nossonumero').AsString := '';
           qRetorno.ParamByName('valorpago').AsFloat := cValorRetorno - Dm.tblMensalidadesValorTotalCalc.Value;
           qRetorno.ParamByName('valoracrescimo').AsFloat := 0;
           qRetorno.ParamByName('codigoaluno').AsInteger := Dm.tblMensalidadesCodigoAluno.AsInteger;
           qRetorno.ParamByName('Parcela').AsInteger := frm_Retorno_Banco.tblItensParcela.AsInteger;
           qRetorno.ParamByName('sequencianoarquivo').AsInteger := frm_Retorno_Banco.tblItensSequenciaNoArquivo.AsInteger;
           qRetorno.ParamByName('datapagamento').AsDateTime := frm_Retorno_Banco.tblItensDataPagamento.AsDateTime;
           qRetorno.ParamByName('dt_credito').AsDateTime := frm_Retorno_Banco.tblItensdt_credito.AsDateTime;

           qRetorno.ExecSQL();

           cValorRetorno := Dm.tblMensalidadesValorTotalCalc.Value;

           FreeAndNil(qRetorno);

        end;
     end;
  end;

//  DM.tblMensalidades.Edit;

  DM.tblMensalidadesValorPago.AsCurrency := cValorRetorno;
  DM.tblMensalidadesDataPagamento.AsString := frm_Retorno_Banco.tblItensDataPagamento.AsString;
  Dm.tblMensalidadesdt_credito.AsString := frm_Retorno_Banco.tblItensdt_credito.AsString;

  DM.tblMensalidadesUsuario.AsString := 'RETORNO';

//  DM.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesValorJurosCalc.AsCurrency;

  DM.BaixarMensalidade(conta, frm_Retorno_Banco.tblRetornoNomeArquivo.AsString, conta_coligada);

  except
    DM.tblMensalidades.Cancel;
  end;

  // Atualizar a tabela de retorno

  Dm.CriarConsulta(qRetorno);

  qRetorno.SQL.Text := 'UPDATE itensretorno SET ' +
                       '   nossonumero = :nossonumero, ' +
                       '   vencimento = :vencimento, ' +
                       '   parcela = :parcela, ' +
                       '   codigoaluno = :codigoaluno, ' +
                       '   ocorrencia = :ocorrencia, ' +
                       '   valortitulo = :valortitulo, ' +
                       '   valorpago = :valorpago, ' +
                       '   cd_mensalidade = :cd_mensalidade, ' +
                       '   sn_baixado = 1 ' +
                       ' WHERE ' +
                       '   codigoretorno = :codigoretorno AND ' +
                       '   sequencia = :sequencia ';

  qRetorno.ParamByName('nossonumero').AsString := DM.tblMensalidadesNossoNumero.AsString;
  qRetorno.ParamByName('vencimento').AsDateTime := DM.tblMensalidadesDataVencimento.AsDateTime;
  qRetorno.ParamByName('parcela').AsString := DM.tblMensalidadesParcela.AsString;
  qRetorno.ParamByName('codigoaluno').AsString := DM.tblMensalidadesCodigoAluno.AsString;
  qRetorno.ParamByName('ocorrencia').AsString := 'OK - Manual';
  qRetorno.ParamByName('valortitulo').AsFloat := cValorRetorno;
  qRetorno.ParamByName('ValorPago').AsFloat := cValorRetorno;
  qRetorno.ParamByName('cd_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade.AsInteger;

  qRetorno.ParamByName('codigoretorno').AsInteger := frm_Retorno_Banco.tblItensCodigoRetorno.AsInteger;
  qRetorno.ParamByName('sequencia').AsInteger := frm_Retorno_Banco.tblItensSequencia.AsInteger;

  qRetorno.ExecSQL();

  frm_Retorno_Banco.Filtrar;

  Self.Close();
  
end;


procedure TfrmBaixarBanco.Filtrar;
begin

    DM.tblMensalidades.Close;

    if iCodigoAluno > 0  then begin

        DM.tblMensalidades.SQL.Clear;
        DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
        DM.tblMensalidades.SQL.Add( 'CodigoAluno = :CodigoAluno and' );
        DM.tblMensalidades.SQL.Add( '(Situacao = 2 OR Situacao = 10) ORDER BY datavencimento, parcela' );
        DM.tblMensalidades.ParamByName('CodigoAluno').AsInteger := iCodigoAluno;
        DM.tblMensalidades.Open;
        DM.tblMensalidades.FetchAll();

        lbCodigo.Caption := IntToStr(iCodigoAluno);
        lbNome.Caption := sNomeAluno;


    end;

    btBaixar.Enabled := (Dm.tblMensalidades.Active) AND (Dm.tblMensalidades.RecordCount > 0);

end;

procedure TfrmBaixarBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmBaixarBanco.FormShow(Sender: TObject);
begin

   lbCodigo.Caption := '';
   lbNome.Caption := '';
   Filtrar();

end;

end.
