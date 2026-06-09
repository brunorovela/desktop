unit uCompromisso_preparar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, DB, ZConnection, ComCtrls, ImgList,
  ToolWin, uDM, Mask, DBCtrls, Grids, DBGrids, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, General;

type
  Tfrm_Compromisso_Preparar = class(TForm)
    pnTitulo: TPanel;
    ImageList1: TImageList;
    qyPreparacao: TUMZQuery;
    qyPreparacaods_preparacao: TStringField;
    qyPreparacaodt_preparacao: TDateTimeField;
    qyPreparacaodt_pagamento: TDateTimeField;
    qyPreparacaosn_pgto_autorizado: TStringField;
    qyPreparacaosn_pgto_efetivado: TStringField;
    srcPreparacao: TDataSource;
    PageControl1: TPageControl;
    tsListaPagamentos: TTabSheet;
    tsNovaProgramacao: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    edValorTotal: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    pnGRid: TPanel;
    sgCompromissos: TStringGrid;
    qyAux: TUMZQuery;
    qyContas: TUMZQuery;
    qyPreparacaodsCaixa: TStringField;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    Bevel1: TBevel;
    qyItens: TUMZQuery;
    qyItensvl_baixa: TFloatField;
    qyItensvl_multa: TFloatField;
    qyItensvl_juros: TFloatField;
    qyItensvl_desconto: TFloatField;
    qyItenssn_baixado: TStringField;
    qyItensds_despesa: TStringField;
    qyItensdt_vencimento: TDateTimeField;
    qyItensnm_pessoa: TStringField;
    srcItens: TDataSource;
    DBGrid2: TDBGrid;
    qyPreparacaovalTotal: TCurrencyField;
    qyPreparacaovalSaldo: TCurrencyField;
    qyPreparacaocd_caixa: TIntegerField;
    qyPreparacaocd_coligada: TSmallintField;
    qyItenscd_coligada: TSmallintField;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    qyPreparacaocd_preparacao: TLargeintField;
    qyPreparacaonr_cheque: TLargeintField;
    qyItenscd_preparacao: TLargeintField;
    qyItenscd_titulo: TLargeintField;
    qyContasDS_CAIXA: TStringField;
    qyContasCD_CAIXA: TIntegerField;
    qyPreparacaocd_usuario_preparou: TIntegerField;
    qyPreparacaocd_usuario_aprovou: TLargeintField;
    qyPreparacaocd_usuario_baixou: TLargeintField;
    qyPreparacaocd_movimento_te: TLargeintField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qyPreparacaoAfterDelete(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure sgCompromissosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure sgCompromissosSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure srcPreparacaoStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure qyPreparacaoAfterPost(DataSet: TDataSet);
    procedure qyPreparacaoAfterInsert(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure tsNovaProgramacaoEnter(Sender: TObject);
    procedure sgCompromissosSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure sgCompromissosKeyPress(Sender: TObject; var Key: Char);
    procedure qyPreparacaoAfterOpen(DataSet: TDataSet);
    procedure qyPreparacaoCalcFields(DataSet: TDataSet);
  private
    linAnt : word;
    ColAnt : word;
    Procedure PreencherPagamento (DataSet : TUMZQuery);
    Procedure AdicionarCheckBox;
    Procedure limpaBuffer;
    Procedure AlinharCheck;
    Procedure SalvarTitulos;
    Function ExisteTitulo( titulo : integer) : Boolean;
    Function AlteraTotalTitulo ( linha : integer ) : Boolean;
    Function CalculaValorTotal : Currency;
    Procedure OnClickCkeck(Sender : TObject);
    procedure ApagarCheckBoxAnteriores;
  public
    cd_coligada: Integer;
  end;

var
  frm_Compromisso_Preparar: Tfrm_Compromisso_Preparar;

implementation

uses uContasPagar_Planilha, uClassMovimento, uUsuario, uColigada;

{$R *.dfm}

procedure Tfrm_Compromisso_Preparar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure Tfrm_Compromisso_Preparar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2: btnInserirClick(nil);
      VK_F3: btnAlterarClick(nil);
      VK_F4: btnExcluirClick(nil);
      VK_F5: btnSalvarClick(nil);
      VK_F6: btnCancelarClick(nil);
      VK_F12: btnFecharClick(nil);
   end;
end;

procedure Tfrm_Compromisso_Preparar.PreencherPagamento (DataSet : TUMZQuery);
Var
   linha : Integer;
begin
   Self.ApagarCheckBoxAnteriores;
   with sgCompromissos do
   begin

      // Zerar os dados atuais
      RowCount := 0;
      ColCount := 0;

      { Selecionar os compromissos já agendados para esta preparação }

      DataSet.FetchAll;

      if qyItens.RecordCount = 0 then
      begin
         RowCount       := 1
      end
      else
      begin
         RowCount       := (qyItens.RecordCount + 1);
      end;
      ColCount := 10;
      FixedCols := 0;

      // Composição dos Títulos e tamanho de colunas

      Cells[0,0] := '';
      ColWidths[0] := 30;

      Cells[1,0] := 'Vencimento';
      ColWidths[1] := 100;
      Cells[2,0] := 'Fornecedor';
      ColWidths[2] := 250;
      Cells[3,0] := 'Histórico';
      ColWidths[3] := 250;
      Cells[4,0] := 'Valor';
      ColWidths[4] := 70;
      Cells[5,0] := 'Multa';
      ColWidths[5] := 70;
      Cells[6,0] := 'Juros';
      ColWidths[6] := 70;
      Cells[7,0] := 'Desconto';
      ColWidths[7] := 70;
      Cells[8,0] := 'Total';
      ColWidths[8] := 70;
      Cells[9,0] := '';
      ColWidths[9] := 0;

      // Preencher com os dados ja programados - ALTERAÇAO
      qyItens.First;

      linha := 1;

      while not qyItens.Eof do
      begin

          Cells[1,linha] := FormatDateTime('dd/mm/yyyy',qyItens.FieldByName('dt_vencimento').AsDateTime);
          Cells[2,linha] := qyItens.FieldByName('nm_pessoa').AsString;
          Cells[3,linha] := qyItens.FieldByName('ds_despesa').AsString;
          Cells[4,linha] := FloatToStrF(qyItens.FieldByName('vl_baixa').AsCurrency, ffFixed, 12, 2);
          Cells[5,linha] := FloatToStrF(qyItens.FieldByName('vl_multa').AsCurrency, ffFixed, 12, 2);
          Cells[6,linha] := FloatToStrF(qyItens.FieldByName('vl_juros').AsCurrency, ffFixed, 12, 2);
          Cells[7,linha] := FloatToStrF(qyItens.FieldByName('vl_desconto').AsCurrency, ffFixed, 12, 2);
          Cells[9,linha] := qyItens.FieldByName('cd_titulo').AsString;

          AlteraTotalTitulo(linha);


          Cells[0, linha] := 'X';

          Inc(linha);

          qyItens.Next;
      end;

      // Preencher com os dados da tabela de compromissos
      DataSet.First;

      while not DataSet.Eof do
      begin
         if DataSet.FieldByName('vl_pendente').AsCurrency > 0 then
         begin

            // Verifica se este compromisso já não está vinculado à outra
            // preparação efetuada anteriormente, ou seja, se o campo
            // "CD_PREPARACAO" é diferente de NULO significa que este título
            // já está vinculado à outra preparação.
            if DataSet.FieldByName('cd_preparacao').IsNull and (not ExisteTitulo(DataSet.FieldByName('cd_titulo').AsInteger)) then
            begin
              RowCount := RowCount  + 1;
              Cells[1,linha] := FormatDateTime('dd/mm/yyyy',DataSet.FieldByName('dt_vencimento').AsDateTime);
              Cells[2,linha] := DataSet.FieldByName('nm_pessoa').AsString;
              Cells[3,linha] := DataSet.FieldByName('ds_despesa').AsString;
              Cells[4,linha] := FloatToStrF(DataSet.FieldByName('vl_pendente').AsCurrency, ffFixed, 12, 2);
              Cells[5,linha] := '0,00';
              Cells[6,linha] := '0,00';
              Cells[7,linha] := '0,00';
              Cells[9,linha] := DataSet.FieldByName('cd_titulo').AsString;
              Cells[0, linha] := '';

              AlteraTotalTitulo(linha);

              Inc(linha);
            end;
         end;

         DataSet.Next;
      end;

      FixedRows := 1;

      AdicionarCheckBox;

   end;

   CalculaValorTotal;
   
end;

procedure Tfrm_Compromisso_Preparar.FormShow(Sender: TObject);
begin
   self.cd_coligada := (TColigada(frm_Compromisso_Planilha.cbUnidadeEnsino.Items.Objects[frm_Compromisso_Planilha.cbUnidadeEnsino.ItemIndex]).Codigo);

   // Abrir o formulário
   qyContas.Close();

   qyContas.SQL.Clear;
   qyContas.SQL.Add(' SELECT c.cd_caixa, c.ds_caixa');
   qyContas.SQL.Add(' FROM fin_cadastro_contas c');
   qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (c.cd_caixa = u.cd_caixa) ');
   qyContas.SQL.Add(' WHERE c.sn_ativa = ''S'' ');
   qyContas.SQL.Add(Format(' AND (c.cd_coligada IN ( %s ) OR c.sn_todas_coligadas = 1)', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada()]));
   qyContas.SQL.Add(' AND u.cd_usuario = ' + IntToStr(DM.iCdPessoaLogado) );
   qyContas.SQL.Add(' ORDER by c.ds_caixa ');
   qyContas.Open();

   qyPreparacao.Close();
   qyPreparacao.ParamByName('cd_coligada').AsInteger := Self.cd_coligada;
   qyPreparacao.Open();

   PageControl1.ActivePage := tsListaPagamentos;
end;

procedure Tfrm_Compromisso_Preparar.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
      IF not (qyPreparacao.State in [dsInsert, dsEdit]) then
      begin
          MessageDlg('Utilize os botões [Incluir] ou [Alterar].', mtWarning, [mbOk], 0);
          AllowChange := False;
          Exit;
      end
      else
         AllowChange := True;
  end
  else
  begin
      IF (qyPreparacao.State in [dsInsert, dsEdit]) then
      begin
          MessageDlg('Utilize os botões [Salvar] ou [Cancelar].', mtWarning, [mbOk], 0);
          AllowChange := False;
          Exit;
      end
      else
         AllowChange := True;
  end;


end;

procedure Tfrm_Compromisso_Preparar.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure Tfrm_Compromisso_Preparar.AdicionarCheckBox;
var i: Integer;
    NovoCheckBox: TCheckBox;
begin
  limpaBuffer; // é bom não esquecer de limpar   controles não utilizados
  for i := 1 to sgCompromissos.RowCount - 1 do
    begin
       NovoCheckBox := TCheckBox.Create(pnGRid);
       NovoCheckBox.Width := 0;
       NovoCheckBox.Visible := false;
       NovoCheckBox.Caption := '';
       NovoCheckBox.Color := clWhite;
       NovoCheckBox.Tag := i;
       NovoCheckBox.Parent := pnGRid;
       NovoCheckBox.Enabled := True;
       NovoCheckBox.Checked := ( sgCompromissos.Cells[0,i] = 'X' );
       NovoCheckBox.OnClick := OnClickCkeck;
       sgCompromissos.Objects[0,i] := NovoCheckBox;

    end;
  AlinharCheck; // agora vamos alinhar o check na celular

end;


procedure Tfrm_Compromisso_Preparar.limpaBuffer;
var
  NovoCheckBox: TCheckBox;
  i: Integer;
begin
   for i := 1 to sgCompromissos.RowCount - 1 do
      begin
         NovoCheckBox := (sgCompromissos.Objects[0,i] as TCheckBox);
         if NovoCheckBox <> nil then // o objeto deve existir para poder ser destruído
         begin
            NovoCheckBox.Visible := false;
            sgCompromissos.Objects[0,i] := nil;
         end;
      end;
end;

procedure Tfrm_Compromisso_Preparar.AlinharCheck;
var
  NovoCheckBox: TCheckBox;
  Rect: TRect;
  i: Integer;
begin
  for i := 1 to sgCompromissos.RowCount - 1 do
    begin
       NovoCheckBox := (sgCompromissos.Objects[0,i] as TCheckBox);
       if NovoCheckBox <> nil then
         begin
           Rect := sgCompromissos.CellRect(0,i); // aqui descobrimos a posição da celula para utilizarmos no check
           // NovoCheckBox.Left := sgCompromissos.Left + Rect.Left+2;
           NovoCheckBox.Left := Rect.Left+4;
           // NovoCheckBox.Top := sgCompromissos.Top + Rect.Top+2;
           NovoCheckBox.Top := Rect.Top+2;
           NovoCheckBox.Width := Rect.Right - Rect.Left - 4;
           NovoCheckBox.Height := Rect.Bottom - Rect.Top - 2;
           NovoCheckBox.Visible := True;
        end;
     end;
end;

procedure Tfrm_Compromisso_Preparar.sgCompromissosDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var Txt : String;
    valor : Currency;
begin
  if not (gdFixed in State) then
     AlinharCheck;

  { Alinhar valores a direita }

  txt := sgCompromissos.Cells[ACol, ARow];

  If ACol in [4, 5, 6, 7, 8]  then //Coluna a ser alinhada a direita
  begin
       if ARow >= 1 then
       begin
          try
             valor := StrToCurr(txt);
             txt := FloatToStrF(valor, ffFixed, 12, 2);
          except
             txt := '0,00';
          end;
       end;

        sgCompromissos.Canvas.FillRect(Rect);
        Rect.Right := Rect.Right -2; // Espaçamento para texto não grudar na borda do grid
        DrawText(sgCompromissos.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_RIGHT);

 end;

end;

procedure Tfrm_Compromisso_Preparar.FormResize(Sender: TObject);
begin
   AlinharCheck;
end;

procedure Tfrm_Compromisso_Preparar.sgCompromissosSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
   { Colunas que não podem ser editadas }
   if ACol in [0, 1, 2, 3, 8, 9]  then
      sgCompromissos.Options := sgCompromissos.Options - [goEditing]
   else
      { As demais colunas podem ser editadas - valor, multa e juros }
      sgCompromissos.Options := sgCompromissos.Options + [goEditing];

   if (linAnt >= 1) then
   begin
      CanSelect := AlteraTotalTitulo(linAnt);
   end;

   if CanSelect then
   begin
      linAnt := ARow;
      colAnt := ACol;
      CalculaValorTotal;
   end;
   
end;


procedure Tfrm_Compromisso_Preparar.srcPreparacaoStateChange(
  Sender: TObject);
begin
    btnInserir.Enabled := not (qyPreparacao.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyPreparacao.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyPreparacao.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyPreparacao.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyPreparacao.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyPreparacao.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_Compromisso_Preparar.btnInserirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2041, npAcesso, True ) then Exit;
   
   qyPreparacao.Insert();
   PageControl1.ActivePage := tsNovaProgramacao;
   DBEdit2.SetFocus();
end;

procedure Tfrm_Compromisso_Preparar.btnAlterarClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 2041, npAlterar, True ) then Exit;

   qyPreparacao.Edit();
   PageControl1.ActivePage := tsNovaProgramacao;
   DBEdit2.SetFocus();
end;

procedure Tfrm_Compromisso_Preparar.btnSalvarClick(Sender: TObject);
begin
   qyPreparacao.Post();

   qyItens.Close();
   qyItens.Open();

   PageControl1.ActivePage := tsListaPagamentos;
end;

procedure Tfrm_Compromisso_Preparar.qyPreparacaoAfterPost(
  DataSet: TDataSet);
begin
   // Salvar os Títulos a Pagar nesta preparação;
   SalvarTitulos;
   // Atualiza a consulta na "Planilha de Compromissos a Pagar", para atualizar
   // o vínculo com a tabela de preparação de pagamentos ("FIN_CP_PREPARACAO_ITENS").
   frm_Compromisso_Planilha.qryContasPagar.Close;
   frm_Compromisso_Planilha.qryContasPagar.Open;
end;

procedure Tfrm_Compromisso_Preparar.SalvarTitulos;
var
   n : integer;
Begin
   // Salvar os Títulos a Pagar

   { Apagar os títulos gravados anteriormente }
   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add('DELETE FROM fin_cp_preparacao_itens WHERE cd_preparacao = :CdPreparacao AND cd_coligada = :CdColigada');
   qyAux.ParamByName('CdPreparacao').AsInteger := qyPreparacao.FieldByName('cd_preparacao').AsInteger;
   qyAux.ParamByName('CdColigada').AsInteger := qyPreparacao.FieldByName('cd_coligada').AsInteger;
   qyAux.ExecSQL();

   { Inserir os novos títulos }
   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add('INSERT INTO fin_cp_preparacao_itens(cd_preparacao, cd_titulo, cd_coligada, vl_baixa, vl_multa, vl_juros, vl_desconto, sn_baixado) VALUES ');
   qyAux.SQL.Add('( :cd_preparacao, :cd_titulo, :cd_coligada, :vl_baixa, :vl_multa, :vl_juros, :vl_desconto, :sn_baixado ) ');

   for n:= 1 to sgCompromissos.RowCount - 1 do
   begin
        if TCheckBox(sgCompromissos.Objects[0, n]).Checked then
        begin
            qyAux.ParamByName('cd_preparacao').AsInteger := qyPreparacao.FieldByName('cd_preparacao').AsInteger;
            qyAux.ParamByName('cd_titulo').AsInteger := StrToInt(sgCompromissos.Cells[9, n]);
            qyAux.ParamByName('cd_coligada').AsInteger := Self.cd_coligada;
            qyAux.ParamByName('vl_baixa').AsFloat := StrToFloat(sgCompromissos.Cells[4, n]);
            qyAux.ParamByName('vl_multa').AsFloat := StrToFloat(sgCompromissos.Cells[5, n]);
            qyAux.ParamByName('vl_juros').AsFloat := StrToFloat(sgCompromissos.Cells[6, n]);
            qyAux.ParamByName('vl_desconto').AsFloat := StrToFloat(sgCompromissos.Cells[7, n]);
            qyAux.ParamByName('sn_baixado').AsString := 'N';

            qyAux.ExecSQL();

        end;
   end;

end;

procedure Tfrm_Compromisso_Preparar.qyPreparacaoAfterDelete(DataSet: TDataSet);
begin
   // Atualiza a consulta na "Planilha de Compromissos a Pagar", para atualizar
   // o vínculo com a tabela de preparação de pagamentos ("FIN_CP_PREPARACAO_ITENS").
   frm_Compromisso_Planilha.qryContasPagar.Close;
   frm_Compromisso_Planilha.qryContasPagar.Open;
end;

procedure Tfrm_Compromisso_Preparar.qyPreparacaoAfterInsert(DataSet: TDataSet);
begin
   qyPreparacao.FieldByName('cd_preparacao').AsInteger := DM.ProximoId('cd_preparacao', 'fin_cp_preparacao');
   qyPreparacao.FieldByName('cd_coligada').AsInteger := Self.cd_coligada;
   qyPreparacao.FieldByName('dt_preparacao').AsDateTime := Date;
   qyPreparacao.FieldByName('dt_pagamento').AsDateTime := Date;
   qyPreparacao.FieldByName('sn_pgto_efetivado').AsString := 'N';
   qyPreparacao.FieldByName('sn_pgto_autorizado').AsString := 'N';
   qyPreparacao.FieldByName('cd_usuario_preparou').AsInteger := DM.iCdPessoaLogado;
end;

procedure Tfrm_Compromisso_Preparar.btnCancelarClick(Sender: TObject);
var
   n : Integer;
begin

   qyPreparacao.Cancel();

   For n:= 1 to sgCompromissos.RowCount - 1 do
   begin
       TCheckBox(sgCompromissos.Objects[0, n]).Checked := False;
   end;

   PageControl1.ActivePage := tsListaPagamentos;

end;

procedure Tfrm_Compromisso_Preparar.tsNovaProgramacaoEnter(
  Sender: TObject);
begin
   PreencherPagamento(frm_Compromisso_Planilha.qryContasPagar);
end;

function Tfrm_Compromisso_Preparar.ExisteTitulo(titulo: integer): Boolean;
var
   n : integer;
begin
   result := false;
   for n := 1 to sgCompromissos.RowCount - 1 do
   begin
       if sgCompromissos.Cells[9, n] = IntToStr(titulo) then
       begin
          Result := true;
          exit;
       end;     
   end;
end;

function Tfrm_Compromisso_Preparar.AlteraTotalTitulo(
  linha: integer): Boolean;
var
   multa, juros, valor, desconto,
   total : currency;
begin

   { Verificar se a Entrada é maior q o valor Pendente }
   qyAux.Close;
   qyAux.SQL.Clear;
   qyAux.SQL.Add(' SELECT                                   ');
   qyAux.SQL.Add('   	cp.cd_titulo,                         ');
   qyAux.SQL.Add('   	SUM(m.vl_entrada) AS vl_entradas,     ');
   qyAux.SQL.Add('   	SUM(m.vl_saida) AS vl_saidas          ');
   qyAux.SQL.Add(' FROM                                     ');
   qyAux.SQL.Add('   	fin_contas_pagar cp                   ');
   qyAux.SQL.Add(' LEFT JOIN fin_mov_cp m                   ');
   qyAux.SQL.Add('    ON (m.cd_titulo = cp.cd_titulo)       ');
   qyAux.SQL.Add(' WHERE  cp.cd_titulo = :CdTitulo          ');
   qyAux.SQL.Add(' AND cp.cd_coligada = :cd_coligada           ');
   qyAux.SQL.Add(' GROUP BY cp.cd_titulo                    ');

   qyAux.ParamByName('CdTitulo').AsInteger := StrToInt(sgCompromissos.Cells[9, linha]);
   qyAux.ParamByName('cd_coligada').AsInteger := Self.cd_coligada;
   qyAux.Open;

   try
      valor := StrToFloat(sgCompromissos.Cells[4, linha])
   except
      valor := 0;
      sgCompromissos.Cells[4, linha] := '0,00';
      Result := False;
      Exit;
   end;

   // Valor digitado é maior que o valor pendente?
   if ( valor > (qyAux.FieldByName('vl_entradas').AsCurrency - qyAux.FieldByName('vl_saidas').AsCurrency) )
   then begin
       MessageDlg('Não é possível baixar um valor maior que o valor pendente', mtWarning, [mbOk], 0);
       sgCompromissos.Cells[4, linha] := FloatToStrF((qyAux.FieldByName('vl_entradas').AsCurrency - qyAux.FieldByName('vl_saidas').AsCurrency), ffFixed, 12, 2);
       Result := false;
       Exit;
   end;

   try
      multa := StrToFloat(sgCompromissos.Cells[5, linha])
   except
      multa := 0;
      sgCompromissos.Cells[5, linha] := '0,00';
      Result := False;
      Exit;
   end;

   try
      juros := StrToFloat(sgCompromissos.Cells[6, linha])
   except
      juros := 0;
      sgCompromissos.Cells[6, linha] := '0,00';
      Result := False;
      Exit;
   end;

   try
      desconto := StrToFloat(sgCompromissos.Cells[7, linha])
   except
      juros := 0;
      sgCompromissos.Cells[7, linha] := '0,00';
      Result := False;
      Exit;
   end;

   total := valor + multa + juros - desconto;

   sgCompromissos.Cells[8, linha] := FloatToStrF(total, ffFixed, 12, 2);

   Result := True;
   Exit;


end;

procedure Tfrm_Compromisso_Preparar.ApagarCheckBoxAnteriores;
var
   I: integer;
begin
   for I := Self.sgCompromissos.RowCount downto 0 do
   begin
      if Assigned(Self.sgCompromissos.Objects[0, I]) then
      begin
         Self.sgCompromissos.Objects[0, I].Free;
         Self.sgCompromissos.Objects[0, I] := nil;
      end;
   end;
end;

procedure Tfrm_Compromisso_Preparar.sgCompromissosSetEditText(
  Sender: TObject; ACol, ARow: Integer; const Value: String);
var
    valor_teste : Currency;
begin

    AlteraTotalTitulo(ARow);

    CalculaValorTotal;

end;

function Tfrm_Compromisso_Preparar.CalculaValorTotal: Currency;
var
   n : integer;
   soma : currency;

begin

   soma := 0;

   for n := 1 to sgCompromissos.RowCount - 1 do
   begin
      if TCheckBox(sgCompromissos.Objects[0, n]).Checked then
         soma := soma + StrToCurr(sgCompromissos.cells[8,n]);
   end;

   edValorTotal.Text := FloatToStrF(soma, ffFixed, 12, 2);

end;

procedure Tfrm_Compromisso_Preparar.OnClickCkeck(Sender: TObject);
begin
   CalculaValorTotal;
end;

procedure Tfrm_Compromisso_Preparar.sgCompromissosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
   begin
       Key := #0;
       Exit;
   end;
end;

procedure Tfrm_Compromisso_Preparar.qyPreparacaoAfterOpen(
  DataSet: TDataSet);
begin
   qyItens.Open;
end;

procedure Tfrm_Compromisso_Preparar.qyPreparacaoCalcFields(
  DataSet: TDataSet);

var
   qySaldo : TUMZQuery;
   movimento : Tmovimento;
begin
   // Buscar o Saldo Atual e a Soma de Itens
   DM.CriarConsulta(qySaldo);

   qySaldo.SQL.Clear();
   qySaldo.SQL.Add(' SELECT                      ');
   qySaldo.SQL.Add('   SUM(vl_baixa) baixa, SUM(vl_multa) multa, SUM(vl_juros) juros, SUM(vl_desconto) desconto ');
   qySaldo.SQL.Add(' FROM fin_cp_preparacao_itens ');
   qySaldo.SQL.Add(' WHERE cd_preparacao = :CdPreparacao AND cd_coligada = :Cdcoligada ');

   qySaldo.ParamByName('CdPreparacao').AsInteger := qyPreparacaocd_preparacao.AsInteger;
   qySaldo.ParamByName('CdColigada').AsInteger := qyPreparacaocd_coligada.AsInteger;

   qySaldo.Open();

   qyPreparacaovalTotal.AsCurrency := qySaldo.FieldByNAme('baixa').AsCurrency +
                                      qySaldo.FieldByNAme('multa').AsCurrency +
                                      qySaldo.FieldByNAme('juros').AsCurrency -
                                      qySaldo.FieldByNAme('desconto').AsCurrency;

   // Pegar o novo saldo
   movimento := Tmovimento.Create();
   qyPreparacaovalSaldo.AsCurrency := movimento.NovoSaldo(qyPreparacaocd_caixa.AsInteger, False);
   movimento.Free();

   FreeAndNil(qySaldo);

end;

procedure Tfrm_Compromisso_Preparar.btnExcluirClick(Sender: TObject);
begin
   if qyPreparacao.RecordCount > 0 then
   begin
      if not DM.UsuarioLogado.TemPermissao( 2041, npExcluir, True ) then Exit;

      if MessageDlg('Deseja excluir a preparação de pagamentos selecionada?', mtConfirmation, [mbYes, mbNo], 0)
      <> mrYes then Exit;


      with Dm.qyAux1 do begin

         Close;
         SQL.Clear;
         SQL.Add(
         ' DELETE FROM                  ' +
         '    fin_cp_preparacao_itens   ' +
         ' WHERE                        ' +
         ' cd_preparacao = :CdPrepara   ' +
         ' AND cd_coligada = :CdColigada ');

         ParamByName('CdPrepara').AsInteger := qyPreparacaocd_preparacao.AsInteger;
         ParamByName('CdColigada').AsInteger := qyPreparacaocd_coligada.AsInteger;

         ExecSQL();

      end;

      qyPreparacao.Delete();
   end
   else
   begin
      Mensagem('Não existem registros para serem removidos.', 'Atenção', MB_OK + MB_ICONWARNING);
   end;
end;

end.

