unit uFLancamentosContabeis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, Grids, DBGrids,
  uFLancamentosManuais, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, uDM, Buttons, DateUtils, uFSelecionarPessoa, ToolWin, General,
  uListaExecucao, uULancamentos, UMComboBox, uSelConta, uUsuario;

type
  TfrmLancamentosContabeis = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    tvAnos: TTreeView;
    Panel4: TPanel;
    Label1: TLabel;
    ilImagens: TImageList;
    lbAno: TLabel;
    edAno: TEdit;
    lbMes: TLabel;
    edMes: TEdit;
    lbDia: TLabel;
    edDia: TEdit;
    Label2: TLabel;
    edConta: TEdit;
    edValor: TEdit;
    Label3: TLabel;
    paCabecalho: TPanel;
    dbgContabeis: TDBGrid;
    qryLancamentos: TUMZQuery;
    dsLancamentos: TDataSource;
    qryLancamentosdt_movimento: TDateField;
    qryLancamentosvl_movimento: TFloatField;
    qryLancamentosds_compemento: TStringField;
    qryLancamentoscd_origem: TStringField;
    lbHistorico: TLabel;
    edHistorico: TEdit;
    lbComplemento: TLabel;
    edComplemento: TEdit;
    Label4: TLabel;
    edUsuario: TEdit;
    lbOrigem: TLabel;
    sbColigada: TSpeedButton;
    qryBuscaAnosDisponiveis: TUMZReadOnlyQuery;
    qryLancamentosds_historico: TStringField;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btInserir: TToolButton;
    btAlterar: TToolButton;
    btExcluir: TToolButton;
    ToolButton4: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    Panel5: TPanel;
    qryLancamentoscd_chave: TLargeintField;
    qryLancamentoscd_titulo: TIntegerField;
    Label5: TLabel;
    cbOrigens: TUMComboBox;
    SpeedButton1: TSpeedButton;
    btFiltrar: TBitBtn;
    SpeedButton2: TSpeedButton;
    qryLancamentoscredito: TStringField;
    qryLancamentosdebito: TStringField;
    qryLancamentoscd_operacao: TStringField;
    procedure dbgContabeisDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edContaKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbColigadaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btInserirClick(Sender: TObject);
    procedure edOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edComplementoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edHistoricoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDiaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edAnoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure tvAnosChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    // Usado para controle de cores na listagem
    Chave: Integer;
    Cores: TStringList;

    function mesExtenso(mes: Integer): String;
    function VerificaLancamento(cd_chave: Integer): Boolean;
    procedure ExcluirLancamento();
    procedure Filtra();
    procedure CarregaDatas();
    procedure PressionaFiltro(Key: Word);
    procedure AtualizaTreeView();
    // Carrega as origens da combo de Origem
    procedure CarregaOrigens();
  public
  end;

   // Objeto para representar os nodos da TTreeView
   TData = class
      Ano: String;
      Mes: String;
      Dia: String;
      constructor Create(Ano, Mes, Dia: String);
   end;

const
   SQL_BUSCA_LANCAMENTOS = ' SELECT '+
                           ' 	fc.dt_movimento, '+
                           ' 	CONCAT(fc.cd_credito, '' - '',fcpc_cre.ds_conta) AS credito, '+
                           ' 	concat(fc.cd_debito, '' - '',fcpc_deb.ds_conta) AS debito, '+
                           ' 	fc.vl_movimento, '+
                           ' 	fch.ds_historico, '+
                           ' 	fc.ds_historico AS ds_complemento, '+
                           ' 	fc.cd_origem, '+
                           '  fc.cd_chave, '+
                           '  fc.cd_titulo, '+
                           '  fc.cd_operacao '+
                           ' FROM '+
                           ' 	fin_contabil fc '+
                           ' LEFT JOIN fin_config_plano_contas fcpc_cre ON ( '+
                           ' 	fcpc_cre.cd_conta = fc.cd_credito '+
                           ' ) '+
                           ' LEFT JOIN fin_config_plano_contas fcpc_deb ON ( '+
                           ' 	fcpc_deb.cd_conta = fc.cd_debito '+
                           ' ) '+
                           ' LEFT JOIN fin_cp_historicos fch ON ( '+
                           ' 	fch.cd_historico = fc.cd_historico '+
                           ' ) ';
var
  frmLancamentosContabeis: TfrmLancamentosContabeis;

implementation

uses uColigadaMatriz, uItemCombo, uFSelecionarHistoricos;

{$R *.dfm}

procedure TfrmLancamentosContabeis.AtualizaTreeView;
var
   objData, objDataAux: TData;
   i: Integer;
begin
   objData := TData.Create(edAno.Text, edMes.Text, edDia.Text);

   for I := 0 to tvAnos.Items.Count - 1 do
   begin

      objDataAux := TData(tvAnos.Items.Item[i].Data);

      if (objData.Ano = objDataAux.Ano) and
         (objData.Mes = objDataAux.Mes) and
         (objData.Dia = objDataAux.Dia) then
      begin
         tvAnos.Items.Item[i].Selected := True;
      end;
   end;
end;

procedure TfrmLancamentosContabeis.btAlterarClick(Sender: TObject);
begin

   if not(DM.GetUsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Gerenciar.Lancamento.Contabil', npAlterar, True)) then
   begin
      Exit;
   end;

   if not VerificaLancamento(qryLancamentoscd_chave.AsInteger) then
   begin
      Mensagem(
         'Você não pode alterar este lançamento pois ja existe um compromisso baixado',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
      Exit;
   end;

   if qryLancamentoscd_origem.AsString <> 'CO' then
   begin
      Mensagem(
         'Você não pode alterar um lançamento que não seja manual',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
      Exit;
   end;

   Application.CreateForm(TfrmLancamentosManuais, frmLancamentosManuais);
   
   frmLancamentosManuais.alteraLancamentos(qryLancamentoscd_chave.AsInteger);

   frmLancamentosManuais.ShowModal;

   btFiltrar.Click;
end;

procedure TfrmLancamentosContabeis.btExcluirClick(Sender: TObject);
var
   Dia, Mes, Ano: String;
begin

   if not(DM.GetUsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Gerenciar.Lancamento.Contabil', npExcluir, True)) then
   begin
      Exit;
   end;

   if Mensagem('Tem certeza que deseja excluir este lançamento ?', 'Aviso', MB_ICONWARNING + MB_YESNO) = mrYes then
   begin
      ExcluirLancamento;
      
      Dia := edDia.Text;
      Mes := edMes.Text;
      Ano := edAno.Text;

      CarregaDatas;

      edAno.Text := Ano;
      edDia.Text := Dia;
      edMes.Text := Mes;
      
      btFiltrar.Click;
   end;
end;

procedure TfrmLancamentosContabeis.btFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLancamentosContabeis.btFiltrarClick(Sender: TObject);
begin
   Chave := 1;
   Cores.Clear;
   Filtra;
   AtualizaTreeView;
end;

procedure TfrmLancamentosContabeis.btInserirClick(Sender: TObject);
var
   Dia, Mes, Ano: String;
begin

   if not(DM.GetUsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Gerenciar.Lancamento.Contabil', npIncluir, True)) then
   begin
      Exit;
   end;

   Application.CreateForm(TfrmLancamentosManuais, frmLancamentosManuais);

   Dia := edDia.Text;
   Mes := edMes.Text;
   Ano := edAno.Text;

   if (edDia.Text <> '') and
      (edMes.Text <> '') and
      (edAno.Text <> '')
   then
   begin

      if Length(edDia.Text) = 1 then
      begin
         Dia := '0' + edDia.Text;
      end;

      if Length(edMes.Text) = 1 then
      begin
         Mes := '0' + edMes.Text; 
      end;

      frmLancamentosManuais.edData.Text := Dia + '/' + Mes + '/' + edAno.Text;
   end;

   frmLancamentosManuais.ShowModal;

   Dia := edDia.Text;
   Mes := edMes.Text;
   Ano := edAno.Text;

   CarregaDatas;

   edAno.Text := Ano;
   edDia.Text := Dia;
   edMes.Text := Mes;

   btFiltrar.Click;
end;

procedure TfrmLancamentosContabeis.CarregaDatas;
var
   nodoAno, nodoMes, nodoDia: TTreeNode;
   objData: TData;
   i, j: Integer;
begin
   tvAnos.Items.Clear;

   tvAnos.Items.BeginUpdate;

   qryBuscaAnosDisponiveis.Close;
   qryBuscaAnosDisponiveis.Open;

   while not qryBuscaAnosDisponiveis.Eof do
   begin

      objData := TData.Create(
         qryBuscaAnosDisponiveis.FieldByName('ano').AsString,
         '',
         ''
      );

      nodoAno := tvAnos.Items.AddObject(nil, objData.Ano, objData);
      nodoAno.SelectedIndex := 1;

      for i := 1 to 12 do
      begin

         objData := TData.Create(
            qryBuscaAnosDisponiveis.FieldByName('ano').AsString,
            IntToStr(i),
            ''
         );

         nodoMes := tvAnos.Items.AddChildObject(nodoAno, mesExtenso(i), objData);
         nodoMes.SelectedIndex := 1;

         for j := 1 to DaysInAMonth(qryBuscaAnosDisponiveis.FieldByName('ano').AsInteger, i) do
         begin

            objData := TData.Create(
               qryBuscaAnosDisponiveis.FieldByName('ano').AsString,
               IntToStr(i),
               IntToStr(j)
            );

            nodoDia := tvAnos.Items.AddChildObject(nodoMes, objData.Dia, objData);
            nodoDia.SelectedIndex := 1;

         end;

      end;

      qryBuscaAnosDisponiveis.Next;
   end;

   tvAnos.Items.EndUpdate;
end;

procedure TfrmLancamentosContabeis.CarregaOrigens;
var
   Item: TItemCombo;
begin
   cbOrigens.Items.Clear;

   Item := TItemCombo.Create('-1', 'Selecione');
   cbOrigens.Items.AddObject(item.descricao, item);

   Item := TItemCombo.Create('CP', 'Contas a pagar');
   cbOrigens.Items.AddObject(item.descricao, item);

   Item := TItemCombo.Create('CR', 'Contas de receber');
   cbOrigens.Items.AddObject(item.descricao, item);

   Item := TItemCombo.Create('CO', 'Lançamentos manuais');
   cbOrigens.Items.AddObject(item.descricao, item);

   Item := TItemCombo.Create('TE', 'Tesouraria');
   cbOrigens.Items.AddObject(item.descricao, item);

   cbOrigens.ItemIndex := 0;
end;

procedure TfrmLancamentosContabeis.dbgContabeisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if cores.Values[qryLancamentoscd_chave.AsString] = '' then
   begin
      if Chave = 1 then
      begin
         Chave := 2;
      end
      else
      begin
         Chave := 1;
      end;

      cores.Values[qryLancamentoscd_chave.AsString] := IntToStr(chave);
   end;

   if cores.Values[qryLancamentoscd_chave.AsString] = '1' then
   begin
      dbgContabeis.Canvas.Brush.Color := clWebLemonChiffon;
   end
   else
   begin
      dbgContabeis.Canvas.Brush.Color := clWebBisque;
   end;
   
   if (gdSelected in State)  then
   begin
      dbgContabeis.Canvas.Brush.Color:= clBlue;
   end;

   dbgContabeis.Canvas.FillRect(Rect);
   dbgContabeis.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmLancamentosContabeis.edAnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edComplementoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(Key in ['0'..'9', #13, #8]) then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosContabeis.edDiaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edHistoricoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edMesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.edUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//   if K then
   
end;

procedure TfrmLancamentosContabeis.edValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   PressionaFiltro(Key);
end;

procedure TfrmLancamentosContabeis.ExcluirLancamento;
var
   listaExecucao: TListaExecucao;
   ExecRatCP: TExecucaoRateioCP;
   ExecRatLC: TExecucaoRateioLC;
   ExecCompromisso: TExecucaoCompromisso;
   ExecLancamento: TExecucaoLancamento;
   Chave: Integer;
begin

   listaExecucao := TListaExecucao.Create;

   qryLancamentos.DisableControls;

   Chave := qryLancamentoscd_chave.AsInteger;

   qryLancamentos.First;

   while not qryLancamentos.Eof do
   begin

      ExecRatLC := TExecucaoRateioLC.Create(teDelete);
      ExecRatLC.Chave := Chave;
      listaExecucao.Add(ExecRatLC);

      ExecLancamento := TExecucaoLancamento.Create(teDelete, Chave);
      listaExecucao.Add(ExecLancamento);

      if qryLancamentoscd_chave.AsInteger = Chave then
      begin
         if (qryLancamentoscd_titulo.AsInteger <> 0) and
            (qryLancamentoscd_operacao.AsString = 'CP') then
         begin
            ExecCompromisso := TExecucaoCompromisso.Create(teDelete);
            ExecCompromisso.Titulo := qryLancamentoscd_titulo.AsInteger;

            listaExecucao.Add(ExecCompromisso);

            ExecRatCP := TExecucaoRateioCP.Create(teDelete);
            ExecRatCP.Titulo := qryLancamentoscd_titulo.AsInteger;

            ListaExecucao.Add(ExecRatCP);
         end;

         if (qryLancamentoscd_titulo.AsInteger <> 0) and
            ((qryLancamentoscd_operacao.AsString = 'MV') or
            (qryLancamentoscd_operacao.AsString = 'MS')) then
         begin
            DM.ExcluirMovimento(qryLancamentoscd_titulo.AsInteger, qryLancamentoscd_operacao.AsString);
            DM.setLog(3000, 'Exclusao', qryLancamentoscd_titulo.AsString, DM.UsuarioLogado.ColigadaLogada, 'Excluiu movimento pela alteração de lançamentos contábeis');
         end;            

      end;
      qryLancamentos.Next;
   end;

   listaExecucao.ExecuteAll();

   qryLancamentos.EnableControls;
end;

procedure TfrmLancamentosContabeis.Filtra;
var
   Separador: String;
begin
   qryLancamentos.SQL.Text := SQL_BUSCA_LANCAMENTOS;

   Separador := ' WHERE ';

   if edAno.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'DATE_FORMAT(fc.dt_movimento,''%Y'') = :ano' );
      qryLancamentos.ParamByName('ano').AsString := edAno.Text;

      Separador := ' AND ';
   end;

   if edMes.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'DATE_FORMAT(fc.dt_movimento,''%c'') = :mes' );
      qryLancamentos.ParamByName('mes').AsString := edMes.Text;

      Separador := ' AND ';
   end;

   if edDia.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'DATE_FORMAT(fc.dt_movimento,''%e'') = :dia' );
      qryLancamentos.ParamByName('dia').AsString := edDia.Text;

      Separador := ' AND ';
   end;

   if edConta.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + '(fc.cd_credito = :cd_conta OR fc.cd_debito = :cd_conta)' );
      qryLancamentos.ParamByName('cd_conta').AsInteger := StrToInt(edConta.Text);

      Separador := ' AND ';
   end;

   if edValor.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'fc.vl_movimento = :nr_valor' );
      qryLancamentos.ParamByName('nr_valor').AsFloat := StrToFloat(edValor.Text);

      Separador := ' AND ';
   end;

   if edHistorico.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'fc.cd_historico = :cd_historico' );
      qryLancamentos.ParamByName('cd_historico').AsInteger := StrToInt(edHistorico.Text);

      Separador := ' AND ';
   end;

   if edComplemento.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'fc.ds_historico LIKE :ds_historico');
      qryLancamentos.ParamByName('ds_historico').AsString := '%' + edComplemento.Text + '%';

      Separador := ' AND ';
   end;

   if edUsuario.Text <> '' then
   begin
      qryLancamentos.SQL.Add( Separador + 'fc.cd_usuario = :cd_usuario');
      qryLancamentos.ParamByName('cd_usuario').AsString := edUsuario.Text;

      Separador := ' AND ';
   end;

   if cbOrigens.ItemIndex > 0 then
   begin
      qryLancamentos.SQL.Add( Separador + 'fc.cd_origem = :ds_origem');
      qryLancamentos.ParamByName('ds_origem').AsString := TItemCombo(cbOrigens.Items.Objects[cbOrigens.ItemIndex]).getCodigo;

      Separador := ' AND ';
   end;

   qryLancamentos.SQL.Add(' ORDER BY ');
   qryLancamentos.SQL.Add('   fc.dt_movimento, fc.cd_chave, fc.cd_debito DESC, fc.cd_credito, fc.cd_historico, fc.ds_historico ');

   qryLancamentos.Open;
end;

procedure TfrmLancamentosContabeis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLancamentosContabeis.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F2 then
   begin
      btInserir.Click;
   end;

   if Key = VK_F3 then
   begin
      btAlterar.Click;
   end;

   if Key = VK_F9 then
   begin
      btExcluir.Click;
   end;

   if Key = VK_F12 then
   begin
      btFechar.Click
   end;
end;

procedure TfrmLancamentosContabeis.FormShow(Sender: TObject);
begin
   CarregaDatas;
   CarregaOrigens;
   
   Chave := 1;

   Cores := TStringList.Create;
end;

function TfrmLancamentosContabeis.mesExtenso(mes: Integer): String;
begin
   case mes of
      1: Result := 'Janeiro';
      2: Result := 'Fevereiro';
      3: Result := 'Março';
      4: Result := 'Abril';
      5: Result := 'Maio';
      6: Result := 'Junho';
      7: Result := 'Julho';
      8: Result := 'Agosto';
      9: Result := 'Setembro';
      10: Result := 'Outubro';
      11: Result := 'Novembro';
      12: Result := 'Dezembro';
   end;
end;

procedure TfrmLancamentosContabeis.PressionaFiltro(Key: Word);
begin
   if Key = VK_RETURN then
   begin
      Filtra;
      AtualizaTreeView();
   end;
end;

procedure TfrmLancamentosContabeis.sbColigadaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa);

   if resultado_filtro.filtrado then
   begin
      edUsuario.Text := IntToStr(resultado_filtro.cd_pessoa);
   end;
end;

procedure TfrmLancamentosContabeis.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoHistoricos;
   index: String;
begin
   index := IntToStr(TSpeedButton(Sender).Tag);

   resultado := TfrmSelecionarHistoricos.Filtrar();

   // -1 = não filtrou nenhum histórico
   if resultado.cd_historico <> -1 then
   begin
      edHistorico.Text := IntToStr(resultado.cd_historico);
   end;
end;

procedure TfrmLancamentosContabeis.SpeedButton2Click(Sender: TObject);
begin
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      edConta.Text := frm_SelConta.qyPlanosContascd_conta.AsString;
   end;
end;

procedure TfrmLancamentosContabeis.tvAnosChange(Sender: TObject; Node: TTreeNode);
var
   ObjData: TData;
begin
   ObjData := TData(Node.Data);

   edAno.Text := ObjData.Ano;
   edMes.Text := ObjData.Mes;
   edDia.Text := ObjData.Dia;

   Filtra;
end;

function TfrmLancamentosContabeis.VerificaLancamento(
  cd_chave: Integer): Boolean;
const
   SQL_VERIFICA_COMPROMISSO_BAIXADO =
      ' SELECT '+
      ' 	count(*) AS qtd '+
      ' FROM '+
      ' 	fin_contabil fc '+
      ' INNER JOIN fin_contas_pagar fcp ON (fcp.cd_titulo = fc.cd_titulo) '+
      ' WHERE '+
      ' 	fc.cd_chave = :cd_chave '+
      '  AND fcp.cd_situacao = 2 ';
var
   qryVerificaLancamento: TUMZReadOnlyQuery;      
begin

   DM.CriarConsulta(qryVerificaLancamento);

   Result := True;

   qryVerificaLancamento.SQL.Text := SQL_VERIFICA_COMPROMISSO_BAIXADO;
   qryVerificaLancamento.ParamByName('cd_chave').AsInteger := cd_chave;
   qryVerificaLancamento.Open;

   if qryVerificaLancamento.FieldByName('qtd').AsInteger > 0 then
   begin
      Result := False;
   end;
end;

{ TData }

constructor TData.Create(Ano, Mes, Dia: String);
begin
   Self.Ano := Ano;
   Self.Mes := Mes;
   Self.Dia := Dia;
end;

end.
