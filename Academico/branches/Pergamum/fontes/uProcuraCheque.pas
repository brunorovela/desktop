unit uProcuraCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, ComCtrls, DBCtrls, CheckLst, DB, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UMDateTimePicker,
  uListaColigadas, uColigada, uColigadaMatriz;

type
  TfrmProcuraCheque = class(TForm)
    pcBuscar: TPageControl;
    tsBuscar: TTabSheet;
    txtCheque_Banco: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    txtCheque_Agencia: TEdit;
    txtCheque_CC: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    txtCheque_nro: TEdit;
    txtCheque_Data: TMaskEdit;
    Label9: TLabel;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    tsBuscarAvancado: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    mskAnoSem: TMaskEdit;
    udAnoSem: TUpDown;
    Label15: TLabel;
    txtAluno: TEdit;
    sbBuscaAluno: TSpeedButton;
    Label18: TLabel;
    cbListaSituacao: TComboBox;
    edABanco: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edAAgencia: TEdit;
    edACheque: TEdit;
    edACCorrente: TEdit;
    Label16: TLabel;
    ckbData: TCheckBox;
    lblDataAte: TLabel;
    tsIncAlt: TTabSheet;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    edIBanco: TEdit;
    edIAgencia: TEdit;
    edINumero: TEdit;
    edIConta: TEdit;
    Label26: TLabel;
    Label1: TLabel;
    edIValor: TEdit;
    Label2: TLabel;
    cbISituacao: TComboBox;
    btnCodigoAluno: TSpeedButton;
    Label3: TLabel;
    clbParcelas: TCheckListBox;
    Label25: TLabel;
    edAluno: TEdit;
    Label27: TLabel;
    mmObservacoes: TMemo;
    qyParcelas: TUMZQuery;
    Label28: TLabel;
    lbNome: TLabel;
    cbContas: TComboBox;
    Label29: TLabel;
    lbPessoa: TLabel;
    Label30: TLabel;
    cbListaConta: TComboBox;
    lblEmissaoAte: TLabel;
    ckbEmissao: TCheckBox;
    Label32: TLabel;
    FLbTitVlCheque: TLabel;
    FCbVlMenorIgual: TCheckBox;
    FCbVlMaiorIgual: TCheckBox;
    FEdVlMenorIgual: TEdit;
    FEdVlMaiorIgual: TEdit;
    Label31: TLabel;
    Ednm_titular: TEdit;
    Label33: TLabel;
    txtnm_titular: TEdit;
    sbBuscaTitular: TSpeedButton;
    umdtVencInicial: TUMDateTimePicker;
    umdtVencFinal: TUMDateTimePicker;
    umdtEmissaoDe: TUMDateTimePicker;
    umdtEmissaoAte: TUMDateTimePicker;
    umdtCompensacao: TUMDateTimePicker;
    Label34: TLabel;
    clbUnidades: TCheckListBox;
    sbTodasUnidades: TSpeedButton;
    sbNenhumaUnidade: TSpeedButton;
    chkMostrarCaixasInativos: TCheckBox;
    procedure sbNenhumaUnidadeClick(Sender: TObject);
    procedure sbTodasUnidadesClick(Sender: TObject);
    procedure sbBuscaTitularClick(Sender: TObject);
    procedure ckbEmissaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clbParcelasEnter(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure edIValorKePress(Sender: TObject; var Key: Char);
    procedure ckbDataClick(Sender: TObject);
    procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure sbBuscaAlunoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure txtValor(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure listaParcelas();
    procedure habilitaFiltroValor(Sender: TObject);
    procedure recebeValorCheque(Sender: TObject; var Key: Char);
    procedure fimDigitacaoValor(Sender: TObject);
  strict private
    FColigadas: TStrings;
    procedure CarregarParcelas();
  private
    function ProcuraCodigo(codigo: Integer; ListaCodigos: array of Integer): Integer;
    procedure CarregaUnidades();
    procedure setaColigadasSelecionadas();
  public
    flagCancel: Boolean;
    slSituacoes: TStringList;
    lngAluno: longint;
    iCheque: Integer;
    bAlterou: boolean;
    sn_selecionou_todas_coligadas : boolean;
    aListaMensalidades: array of Integer;
    ListaContas : Array of Integer;
    procedure setTab(newTab: TTabSheet);
    procedure carregaContas(ContaPadrao: Integer = 0);
    procedure bloquearCampos(bloqueado: boolean);
    property Coligadas: TStrings read FColigadas write FColigadas;
  end;

var
  frmProcuraCheque: TfrmProcuraCheque;


implementation

uses uDM, uFSelecionarPessoa, General, uClassMovimento, uUsuario,
  uIUMDataModule, Contnrs;

{$R *.DFM}

procedure TfrmProcuraCheque.txtValor(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TfrmProcuraCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE : Close;
  end;
end;




procedure TfrmProcuraCheque.FormShow(Sender: TObject);
begin
   bAlterou:= False;
   if pcBuscar.ActivePage = tsBuscarAvancado then begin
      carregaContas(0);
      cbListaConta.ItemIndex:=0;
   end else if pcBuscar.ActivePage = tsIncAlt then begin
      edINumero.SetFocus();
   end;

   CarregaUnidades();
end;

procedure TfrmProcuraCheque.habilitaFiltroValor(Sender: TObject);
begin
   if (Sender = Self.FCbVlMenorIgual) then
   begin
      Self.FEdVlMenorIgual.Enabled := Self.FCbVlMenorIgual.Checked;
   end
   else if (Sender = Self.FCbVlMaiorIgual) then
   begin
      Self.FEdVlMaiorIgual.Enabled := Self.FCbVlMaiorIgual.Checked;
   end;
end;

procedure TfrmProcuraCheque.listaParcelas;
var
   iCont: Integer;
begin
   CarregarParcelas();

   aListaMensalidades:=nil;
   SetLength(aListaMensalidades,qyParcelas.RecordCount);

   clbParcelas.Items.Clear;
   while not qyParcelas.EOF do begin
      iCont := clbParcelas.Items.Add('Parc. '+qyParcelas.FieldByName('parcela').AsString+
      ' '+FormatDateTime('dd/mm/yyyy', qyParcelas.FieldByName('datapagamento').AsDateTime )+
      ' '+Format( '%8.2n', [qyParcelas.FieldByName('valorpago').AsCurrency])
      );

      aListaMensalidades[iCont] := qyParcelas.FieldByName('cd_mensalidade').AsInteger;

      if qyParcelas.FieldByName('cd_cheque').AsString <> '' then
         clbParcelas.Checked[iCont]:= True;
      
      qyParcelas.Next();
   end;
end;

procedure TfrmProcuraCheque.setaColigadasSelecionadas();
var
   I: Integer;
begin
   FColigadas.Clear;
   for I := 0 to clbUnidades.Count - 1 do
      if clbUnidades.Checked[I] then
         FColigadas.Add(Format('%d', [TColigada(clbUnidades.Items.Objects[I]).Codigo]));
end;

procedure TfrmProcuraCheque.setTab(newTab: TTabSheet);
var
   i: Integer;
begin
   for i := 0 to pcBuscar.PageCount - 1 do begin
      if pcBuscar.Pages[i] = newTab then begin
         newTab.TabVisible := True;
      end
      else begin
         pcBuscar.Pages[i].TabVisible := False;
      end;
   end;
   pcBuscar.ActivePage := newTab;
end;

procedure TfrmProcuraCheque.FormCreate(Sender: TObject);
var
   i: Integer;
begin
   FColigadas := TStringList.Create;
   setTab(tsBuscar);
   slSituacoes := TStringList.Create();
   if cbListaSituacao.Items.Count = 0 then begin
      //carrega situacoes
      DM.CarregaSituacoes(slSituacoes, 2050, sitDescricao);

      cbListaSituacao.Clear();
      cbISituacao.Clear();
      cbListaSituacao.AddItem('Todas as Situações', nil);
      
      for i := 0 to slSituacoes.Count - 1 do begin
         cbListaSituacao.AddItem(slSituacoes.ValueFromIndex[i], nil);
         cbISituacao.AddItem(slSituacoes.ValueFromIndex[i], nil);
      end;

   end;
end;

procedure TfrmProcuraCheque.carregaContas(ContaPadrao : Integer = 0);
var
   qyContas : TUMZQuery;
   Movimento : TMovimento;
   tp_Conta: word;  cd_Abertura : Integer;
begin

   Dm.CriarConsulta(qyContas);

   Movimento := TMovimento.create;

   qyContas.SQL.Clear;
{
   qyContas.SQL.Text := '' +
     ' SELECT cc.cd_caixa, cc.ds_caixa, cc.tp_conta, u.sn_padrao  ' +
     ' FROM fin_cadastro_contas cc                          ' +
     ' INNER JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa AND cc.cd_coligada = u.cd_coligada) ' +
     ' WHERE cc.sn_ativa = "S"           ' +
     '   AND cc.cd_coligada = ' + IntToStr(Dm.iColigadaSelecionada) +
     '   AND u.cd_usuario = ' + DM.tblUsuariosNomeCodigo.AsString +
     ' ORDER by cc.ds_caixa              ';
}
   qyContas.SQL.Text := Format(
     ' SELECT cc.cd_caixa, cc.ds_caixa, cc.tp_conta, cc.cd_coligada ' +
     ' FROM fin_cadastro_contas cc                          ' +
     ' WHERE cc.sn_ativa = ''S''           ' +
     '   AND ( cc.cd_coligada IN ( %s ) OR cc.sn_todas_coligadas = 1 ) ' +
     ' ORDER by cc.ds_caixa ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );


   qyContas.Open();

   cbContas.Items.Clear;
   cbListaConta.Items.Clear;
   cbListaConta.Items.Add('Todas as Contas');

   setlength( ListaContas, 0 );

   while not qyContas.Eof do
   begin
         { Somente inserir as contas que poderão ser utilizadas para a Baixa }
         if Movimento.VerificaContaAtiva(qyContas.FieldByNAme('cd_caixa').AsInteger, tp_Conta, cd_Abertura,
            qyContas.FieldByNAme('cd_coligada').AsInteger ) then
         begin
             if (tp_Conta <> 3) OR (cd_Abertura > 0) then
             begin
                cbContas.Items.Add(qyContas.FieldByName('ds_caixa').AsString);
                cbListaConta.Items.Add(qyContas.FieldByName('ds_caixa').AsString);
                SetLength(listaContas, length(listacontas) + 1);
                ListaContas[length(listacontas) - 1] := qyContas.FieldByName('cd_caixa').AsInteger;
             end;

         end;

         qyContas.Next;

   end;
   
   { Verificar qual a conta padrão será utilizada }
   if ContaPadrao <> 0  then
      cbContas.ItemIndex :=  ProcuraCodigo(ContaPadrao, ListaContas);
   //cbContas.ItemIndex := 0;

   Movimento.Free;
end;

procedure TfrmProcuraCheque.CarregarParcelas;
const
   SQL_CARREGAR_PARCELAS =
      ' SELECT M.CD_MENSALIDADE, M.PARCELA, M.DATAPAGAMENTO, M.VALORPAGO, C.CD_CHEQUE ' +
      ' FROM MENSALIDADES M ' +
      '      LEFT JOIN FIN_CHEQUES_MENSALIDADES C ON ( ' +
      '         M.CD_MENSALIDADE = C.CD_MENSALIDADE AND ' +
      '         C.CD_CHEQUE = :CHEQUE ) ' +
      ' WHERE M.SITUACAO IN (0,1) AND M.CODIGOALUNO = :ALUNO AND ' +
      '       M.CD_COLIGADA IN ( %s ) ' +
      ' ORDER BY M.DATAPAGAMENTO DESC, M.PARCELA ASC ';
begin
   qyParcelas.Close();
   qyParcelas.SQL.Text := Format( SQL_CARREGAR_PARCELAS, [ DM.UsuarioLogado.GetColigadasFilhaSelecionada() ] );
   qyParcelas.ParamByName('aluno').AsInteger := lngAluno;
   qyParcelas.ParamByName('cheque').AsInteger := iCheque;
   qyParcelas.Open();
end;

procedure TfrmProcuraCheque.CarregaUnidades;
var
   listaColigadas :  TListaColigadas;
   i,j: integer;
begin

   if listaColigadas = nil then
   begin
      listaColigadas := TListaColigadas.Create();

   end;

   listaColigadas := DM.GetUsuarioLogado.GetListaColigadasFilhaSelecionada;
   for i := 0 to listaColigadas.Count - 1 do
   begin
      clbUnidades.Items.AddObject(TColigada(listaColigadas[ i ]).Nome,listaColigadas[ i ]);

      if FColigadas <> nil then
      begin
         for j := 0 to FColigadas.Count - 1 do
         begin
            if (strtoint(FColigadas[j]) = TColigada(listaColigadas[ i ]).Codigo)  then
            begin
               clbUnidades.Checked[i] := true;
               break;
            end;
         end;
      end
      else
      begin
         clbUnidades.Checked[i] := true;
      end;

   end;

end;

function TfrmProcuraCheque.ProcuraCodigo(codigo: Integer;
  ListaCodigos: array of Integer): Integer;
var
   n : word;
begin
   result := -1;

   For n := 0 to Length(ListaCodigos) - 1 do
   begin
       if ListaCodigos[n] = Codigo then
       begin
          result := n;
          exit;
       end
   end;

end;

procedure TfrmProcuraCheque.recebeValorCheque(Sender: TObject; var Key: Char);
begin
   if Key in['.', ','] then // Digitou vírgula (,) ou ponto (.)
   begin
      // Procura por outras vírgulas no valor
      if AnsiPos(',', TEdit(Sender).Text) > 0 then
      begin
         Key := #0;  // Não permite mais que uma vírgula
      end else
      begin
         Key := ','; // Converte para vírgula se digitou ponto
      end;
   end
   else if Key = #13 then // Pressionou ENTER
   begin
      if (Sender = Self.FEdVlMenorIgual) then
      begin
         Self.FCbVlMaiorIgual.SetFocus;
      end else
      begin
         Self.ckbData.SetFocus;
      end;
   end
   // Não pressionou um número
   else if not (Key in ['0'..'9', #8]) then
   begin
      Key := #0;
   end;        
end;

procedure TfrmProcuraCheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   iAnoSem: Integer;
begin

   Self.FCbVlMenorIgual.Checked := (Trim(Self.FEdVlMenorIgual.Text) <> '') and Self.FCbVlMenorIgual.Checked;
   Self.FCbVlMaiorIgual.Checked := (Trim(Self.FEdVlMaiorIgual.Text) <> '') and Self.FCbVlMaiorIgual.Checked;

   if flagCancel then Exit;

   //valida entrada
   if pcBuscar.ActivePage = tsBuscarAvancado then begin

      //anosemestre
      if (Length(mskAnoSem.Text) > 4) then begin

         try
            iAnoSem := StrToInt(mskAnoSem.Text);
         except
            Mensagem('O Ano/Semestre precisa ser preenchido corretamente!!');
            mskAnoSem.SetFocus();
            CanClose := False;
            Exit;
         end;
      end;
      
      //data
      if (ckbData.Checked) then begin
         if (umdtVencInicial.getDate > umdtVencFinal.getDate) then begin
            Mensagem('A Data Inicial deve ser menor que a data Final!!');
            umdtVencInicial.SetFocus();
            CanClose := False;
            Exit;
         end;
      end;

      //data
      if (ckbEmissao.Checked) then begin
         if (umdtEmissaoDe.getDate > umdtEmissaoAte.getDate) then begin
            Mensagem('A Data Inicial deve ser menor que a data Final!!');
            umdtEmissaoDe.SetFocus();
            CanClose := False;
            Exit;
         end;
      end;   

      //codigo da acao
      if not (cbListaSituacao.ItemIndex > -1) then begin
            Mensagem('Uma situação deve ser selecionada!!');
            cbListaSituacao.SetFocus();
            CanClose := False;
            Exit;
      end;

      // Valores
      if (Self.FCbVlMenorIgual.Checked and Self.FCbVlMaiorIgual.Checked) and
         (StrToFloat(Self.FEdVlMaiorIgual.Text) > StrToFloat(Self.FEdVlMenorIgual.Text)) then
      begin
         Mensagem('O valor para o campo "Maior ou igual à" não pode ser maior que o valor do campo "Menor ou igual à"!');
         Self.FCbVlMaiorIgual.SetFocus;
         CanClose := False;
         Exit;
      end;

   end;
end;

procedure TfrmProcuraCheque.sbBuscaAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

  if resultado_filtro.filtrado then
  Begin
     txtAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
     try
       mskAnoSem.Text := IntToStr(resultado_filtro.nr_anosemestre);
     except
     End;
  End
  else Exit;
end;

procedure TfrmProcuraCheque.sbBuscaTitularClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

  if resultado_filtro.filtrado then
  Begin
     txtnm_titular.Text := resultado_filtro.nm_pessoa;
  End
  else
  Exit;
end;

procedure TfrmProcuraCheque.sbNenhumaUnidadeClick(Sender: TObject);
var
   i : integer;
begin

   for i := 0 to clbUnidades.items.Count - 1 do
   begin
      clbUnidades.Checked[i] := false;
   end;
end;

procedure TfrmProcuraCheque.sbTodasUnidadesClick(Sender: TObject);
var
   i : integer;
begin

   for i := 0 to clbUnidades.items.Count - 1 do
   begin
      clbUnidades.Checked[i] := true;
   end;
                       
end;

procedure TfrmProcuraCheque.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Pessoa }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);
                       
   if resultado_filtro.filtrado then
   begin
      edAluno.text   := IntToStr(resultado_filtro.cd_pessoa);
      lbNome.Caption := resultado_filtro.nm_pessoa;
      lngAluno       := resultado_filtro.cd_pessoa;
      listaParcelas();
   end;
end;



procedure TfrmProcuraCheque.btnOkClick(Sender: TObject);
begin
   setaColigadasSelecionadas();

   if (pcBuscar.ActivePage = tsIncAlt) AND (cbISituacao.ItemIndex = -1) then begin
      Mensagem('Para prosseguir é necessário informar uma Situação!',Application.Title, MB_OK + MB_ICONWARNING);
      Exit;
   end;

  if (pcBuscar.ActivePage = tsIncAlt) AND (cbContas.ItemIndex = -1) then begin
      Mensagem('Para prosseguir é necessário informar uma conta!',Application.Title, MB_OK + MB_ICONWARNING);
      Exit;
   end;

   ModalResult := mrOk;

   flagCancel := False;
end;

procedure TfrmProcuraCheque.bloquearCampos(bloqueado: boolean);
begin
   edAluno.Enabled := not bloqueado;
   btnCodigoAluno.Enabled := not bloqueado;
   clbParcelas.Enabled := not bloqueado;

   if bloqueado then begin
      lbPessoa.Caption := 'Existem duas pessoas associadas a este cheque. ' + CHR(13) + 'Não é possível alterar vínculo do Título.';   
   end;
end;

procedure TfrmProcuraCheque.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   flagCancel := True;

   Close();
end;


procedure TfrmProcuraCheque.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     mskAnoSem.text := DM.incrementar_ano_semestre(mskAnoSem.Text);
  end
  else
  begin
    mskAnoSem.text := DM.decrementar_ano_semestre(mskAnoSem.Text);
  end;
end;


procedure TfrmProcuraCheque.ckbDataClick(Sender: TObject);
begin
   umdtVencInicial.Enabled := ckbData.Checked;
   umdtVencFinal.Enabled := ckbData.Checked;
   lblDataAte.Enabled := ckbData.Checked;
end;

procedure TfrmProcuraCheque.ckbEmissaoClick(Sender: TObject);
begin
   umdtEmissaoAte.Enabled := ckbEmissao.Checked;
   umdtEmissaoDe.Enabled := ckbEmissao.Checked;
   lblEmissaoAte.Enabled := ckbEmissao.Checked;
end;

procedure TfrmProcuraCheque.clbParcelasEnter(Sender: TObject);
begin
   bAlterou:=true;
end;

procedure TfrmProcuraCheque.edIValorKePress(Sender: TObject; var Key: Char);
var
  dblAux : Single;
begin
  if Key = '.' then Key := ',';

  if (Key in ['0' .. '9', #8, ',']) then
     Key:= key
  else begin
     Key := #0;
     exit;
  end;

  if Key = #13 then
  begin
    try
      dblAux := RoundFloat( StrToFloat( edIValor.Text ) , 2 );

      edIValor.Text := Trim( Format( '%8.2f', [RoundFloat( (dblAux), 2 )] ) );
      umdtCompensacao.SetFocus;
    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      edIValor.SetFocus;
      edIValor.SelectAll;
      raise;
      Exit;
    end;
  end;
end;

procedure TfrmProcuraCheque.fimDigitacaoValor(Sender: TObject);
begin
   if Trim(TEdit(Sender).Text) = '' then
   begin
      if Sender = Self.FEdVlMenorIgual then
      begin
         Self.FCbVlMenorIgual.Checked := False;
      end else
      begin
         Self.FCbVlMaiorIgual.Checked := False;
      end;
   end
   else if AnsiPos(',', TEdit(Sender).Text) = 0 then
   begin
      TEdit(Sender).Text := TEdit(Sender).Text + ',00';
   end
   else if AnsiPos(',', TEdit(Sender).Text) = Length(TEdit(Sender).Text) then
   begin
      TEdit(Sender).Text := TEdit(Sender).Text + '00';
   end;
end;

end.

