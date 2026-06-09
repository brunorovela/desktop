unit uBaixaBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls, Menus, uClassMovimento, ZConnection,
  StdCtrls, Buttons, DBCtrls, ZDbcIntfs, UZDbcFuncs;

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
const
   SSQLInsertRetornoItens =
      'INSERT IGNORE INTO RETORNO_ITENS (' +
         'CD_RETORNO,' +
         'CD_OCORRENCIA,' +
         'DT_VENCIMENTO,' +
         'VL_TITULO,' +
         'NR_NOSSONUMERO,' +
         'VL_PAGO,' +
         'VL_ACRESCIMO,' +
         'CD_PESSOA,' +
         'NR_SEQUENCIA,' +
         'DT_PAGAMENTO,' +
         'DT_CREDITO)' +
      'VALUES (?, ?, ?, ?, '''', ?, 0, ?, ?, ?, ?)';
   SSQLUpdateRetornoItens =
      'UPDATE RETORNO_ITENS SET ' +
         'NR_NOSSONUMERO = ?,' +
         'DT_VENCIMENTO = ?,' +
         'CD_PESSOA = ?,' +
         'VL_TITULO = ?,' +
         'VL_PAGO = ?,' +
         'CD_SITUACAO = 10 ' +
      'WHERE ' +
         'CD_RETORNO = ? AND ' +
         'NR_SEQUENCIA = ?';
   SSQLUpdateRetornoItensTitulos =
      'UPDATE RETORNO_ITENS_TITULOS SET ' +
         'CD_MENSALIDADE = ? ' +
      'WHERE ' +
         'CD_RETORNO = ? AND ' +
         'NR_SEQUENCIA = ?';
var
   ContaID, ColigadaID: Integer;
   ValorRetorno, ValorTitulo: Currency;
   Movimento: TMovimento;
   Stmt: IZPreparedStatement;
begin

  if DM.tblMensalidadesSituacao.AsInteger in [0, 1] then Exit;

  if Mensagem( 'Deseja baixar esta parcela manualmente ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then exit;

  if Mensagem('Não foi possível identificar a conta para lançar as baixas. Deseja selecionar a conta manualmente?', Application.Title, MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON1 )
  <> mrYes then Exit;

  frm_SelCAixa.ShowModal;

  if frm_SelCaixa.flgSearch then begin
     ContaID := frm_SelCaixa.qyCaixacd_caixa.AsInteger;
     ColigadaID := frm_SelCaixa.qyCaixacd_coligada.AsInteger;
  end
  else begin
     
     exit;
  end;

  try

  // Verificar Valor para Baixar Se o valor do retorno for maior, dar a possibilidade de criar uma parcial do retorno;
  //

  DM.tblMensalidades.Edit;

  Dm.tblMensalidadescd_coligada.AsInteger := ColigadaID;
  
  DM.tblMensalidadesDataPagamento.AsString := frm_Retorno_Banco.tblItensDataPagamento.AsString;
  Dm.tblMensalidadesdt_credito.AsString := frm_Retorno_Banco.tblItensdt_credito.AsString;

  ValorRetorno := frm_Retorno_Banco.tblItensValorPago.AsCurrency;

  if ValorRetorno > Dm.tblMensalidadesValorTotalCalc.Value then begin
     case Mensagem('O valor pago neste retorno é maior do que o valor total da mensalidade selecionada. Deseja manter a diferença em aberto para baixar em outra parcela posteriormente?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) of
        mrCancel : Exit;

        mrYes:
         begin
            ValorTitulo := ValorRetorno - DM.tblMensalidadesValorTotalCalc.Value;

            Stmt := PrepareStatement(SSQLInsertRetornoItens);
            try
               Stmt.SetInt(1, frm_Retorno_Banco.tblItensCodigoRetorno.AsInteger);
               Stmt.SetString(2, frm_Retorno_Banco.tblItensCD_OCORRENCIA.AsString);
               Stmt.SetDate(3, frm_Retorno_Banco.tblItensVencimento.AsDateTime);
               Stmt.SetFloat(4, ValorTitulo);
               Stmt.SetFloat(5, ValorTitulo);
               Stmt.SetInt(6, DM.tblMensalidadesCodigoAluno.AsInteger);
               Stmt.SetInt(7, frm_Retorno_Banco.tblItensSequenciaNoArquivo.AsInteger);
               Stmt.SetDate(8, frm_Retorno_Banco.tblItensDataPagamento.AsDateTime);
               Stmt.SetDate(9, frm_Retorno_Banco.tblItensdt_credito.AsDateTime);
               Stmt.ExecutePrepared;
            finally
               Stmt.Close;
               Stmt := nil;
            end;

            ValorRetorno := Dm.tblMensalidadesValorTotalCalc.Value;

         end;
     end;
  end;

//  DM.tblMensalidades.Edit;

  DM.tblMensalidadesValorPago.AsCurrency := ValorRetorno;
  DM.tblMensalidadesDataPagamento.AsString := frm_Retorno_Banco.tblItensDataPagamento.AsString;
  Dm.tblMensalidadesdt_credito.AsString := frm_Retorno_Banco.tblItensdt_credito.AsString;

  DM.tblMensalidadesUsuario.AsString := 'RETORNO';

//  DM.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesValorJurosCalc.AsCurrency;

  DM.BaixarMensalidade(ContaID, frm_Retorno_Banco.tblRetornoNomeArquivo.AsString, ColigadaID);

  except
    DM.tblMensalidades.Cancel;
  end;

  // Atualizar a tabela de retorno

   Stmt := PrepareStatement(SSQLUpdateRetornoItens);
   try
      Stmt.SetString(1, DM.tblMensalidadesNossoNumero.AsString);
      Stmt.SetDate(2, DM.tblMensalidadesDataVencimento.AsDateTime);
      Stmt.SetInt(3, DM.tblMensalidadesCodigoAluno.AsInteger);
      Stmt.SetFloat(4, ValorRetorno);
      Stmt.SetFloat(5, ValorRetorno);
      Stmt.SetInt(6, frm_Retorno_Banco.tblItensCodigoRetorno.AsInteger);
      Stmt.SetInt(7, frm_Retorno_Banco.tblItensSequencia.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLUpdateRetornoItensTitulos);
   try
      Stmt.SetInt(1, DM.tblMensalidadescd_mensalidade.AsInteger);
      Stmt.SetInt(2, frm_Retorno_Banco.tblItensCodigoRetorno.AsInteger);
      Stmt.SetInt(3, frm_Retorno_Banco.tblItensSequencia.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

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
