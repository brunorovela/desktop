unit uDinCh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Mask, ComCtrls, dbTables, Ucmc7;

type
   TCheque = class(TObject)

      private
         sBanco: string;
         sAgencia: string;
         sContaCorrente: string;
         sNumero: string;
         dValor: Double;
         dtData: TDateTime;

      protected

      public
         procedure setBanco(sValor: string);
         procedure setAgencia(sValor: string);
         procedure setNumero(sInputValor: string);
         procedure setValor(dInputValor: Double);
         procedure setData(dtInputData: TDateTime);
         procedure setContaCorrente(sValor: string);

         function getBanco(): string;
         function getAgencia(): string;
         function getNumero(): string;
         function getValor(): Double;
         function getData(): TDateTime;
         function getContaCorrente(): string;

         constructor Create;
         destructor Destroy; override;
      published

   end;
  TfrmDinCh = class(TForm)
    Panel1: TPanel;
    pnlValor: TPanel;
    txtDin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtCh: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ckbDeposito: TCheckBox;
    pcDocumento: TPageControl;
    tsCheque: TTabSheet;
    tsTalao: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblPosicao: TLabel;
    txtCheque_Banco: TEdit;
    txtCheque_Agencia: TEdit;
    txtCheque_CC: TEdit;
    txtCheque_nro: TEdit;
    txtCheque_Valor: TEdit;
    txtCheque_Data: TMaskEdit;
    lblTotal: TLabel;
    btChequeProx: TButton;
    btChequeAnt: TButton;
    btChequeAdd: TButton;
    btChequeDel: TButton;
    Label3: TLabel;
    edNumeroTalao: TEdit;
    procedure edNumeroTalaoExit(Sender: TObject);
    procedure ckbDepositoClick(Sender: TObject);
    procedure txtCheque_DataEnter(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure txtChExit(Sender: TObject);
    procedure txtAlteraCheque(Sender: TObject);
    procedure btChequeDelClick(Sender: TObject);
    procedure btChequeAddClick(Sender: TObject);
    procedure btChequeAntClick(Sender: TObject);
    procedure btChequeProxClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtChKeyPress(Sender: TObject; var Key: Char);
    procedure txtDinKeyPress(Sender: TObject; var Key: Char);
    procedure txtChEnter(Sender: TObject);
    procedure txtDinEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure txtCheque_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure txtCheque_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure txtCheque_DataKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure Expande(TemCheque : Boolean); 
  private
    { Private declarations }

    procedure AtualizaTotalCheques();
    procedure MostraItem(i: Integer);
    procedure AddCheque();
    procedure RemoveCheque(i: Integer);
    procedure AtualizaPosicao();
    procedure SalvaCheque();
    procedure SalvaDeposito();

  public
    dblValor : Currency;
    dblDin, dblCh : Currency;
    UltimoAluno : Integer;
    AlunoAtual : Integer;
    Cancelar : Boolean;
    slCheques: TStringList;
    iCheque: Integer;
    bSalvarCheque: Boolean;
    iCaixa: Integer;
    { Public declarations }
  end;

var
  frmDinCh: TfrmDinCh;

implementation

uses Main, Math, uDM;

{$R *.DFM}

procedure TfrmDinCh.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  cancelar := False;
  frmDinCh.Width := 220;

  if AlunoAtual <> UltimoAluno then
  Begin
    { Limpar dados do Banco }
    frmDinCh.txtCheque_Banco.Text := '';
    frmDinCh.txtCheque_Agencia.Text := '';
    frmDinCh.txtCheque_CC.Text := ''; 
    frmDinCh.txtCheque_nro.Text := '';
    frmDinCh.txtCheque_Valor.Text := '0';
    frmDinCh.txtCheque_Data.Text := FormatDateTime('dd/mm/yyyy', DataHoje);
    iCheque := 0;
    slCheques.Clear();
    AtualizaTotalCheques();
  End;

  dblDin := 0;
  pnlValor.Caption := Format( '%8.2n', [dblValor] ) + '  ';
  txtCh.Text := Trim( Format( '%8.2f', [dblValor] ) );

  txtDin.Text := '';

  edNumeroTalao.Text := '';
  ckbDeposito.Checked := false;

  txtCh.SetFocus();
  txtCh.SelectAll;


end;

procedure TfrmDinCh.txtChKeyPress(Sender: TObject; var Key: Char);
var
  dblAux : Single;
begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin
    Key := #0;
    try
      dblAux := RoundFloat( StrToFloat( txtCh.Text ) , 2 );
      dblCh := dblAux;
      if dblCh < dblValor then
      dblDin := RoundFloat( ( dblValor - dblCh ), 2 );

      if ( dblDin > -0.000000000000001 ) and
         ( dblDin <  0.100000000000000 ) then dblDin := 0;

      txtDin.Text := Trim( Format( '%8.2f', [RoundFloat( (dblValor - dblCh), 2 )] ) );
      txtDin.SetFocus;
      txtDin.SelectAll;

      Expande(dblCh > 0);

    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      txtCh.SetFocus;
      txtCh.SelectAll;
      raise;
      Exit;
    end;
  end;

end;

procedure TfrmDinCh.txtDinKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if key = #13 then
  Begin
  
     if dblCh = 0 then
     Begin
        btnOk.SetFocus();
     End;

  End;
end;


procedure TfrmDinCh.txtChEnter(Sender: TObject);
begin
  btnOk.Enabled := False;
end;

procedure TfrmDinCh.txtDinEnter(Sender: TObject);
begin
  btnOk.Enabled := True;
  btnCancel.Enabled := True;
end;

procedure TfrmDinCh.FormCreate(Sender: TObject);
begin
  dblDin := 0;
  dblCh := 0;
  slCheques := TStringList.Create();
  slCheques.Clear();
end;

procedure TfrmDinCh.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  dblAux : Double;
  i: Integer;
  dValor: Double;
begin
  if cancelar then begin
     canclose := True;
     exit;
  end;
  try
    dblAux := RoundFloat( StrToFloat( txtDin.Text ), 2 );
    dblDin := dblAux;
    if ( dblDin > -0.000000000000001 ) and
       ( dblDin <  0.000000000000001 ) then dblDin := 0;

    CanClose := True;

  except

    Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
    txtDin.SetFocus;
    txtDin.SelectAll;
    CanClose := False;

    raise;

    Exit;

  end;

  try
    dblAux := RoundFloat( StrToFloat( txtCh.Text ), 2 );
    dblCh := dblAux;
    if ( dblCh > -0.000000000000001 ) and
       ( dblCh <  0.000000000000001 ) then dblCh := 0;

    CanClose := True;

  except
    Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
    txtCh.SetFocus;
    txtCh.SelectAll;
    CanClose := False;

    raise;

    Exit;
  end;

  if RoundFloat(dblCh + dblDin,2) <> RoundFloat(DM.tblMensalidadesValorPago.AsCurrency,2) then begin
     Mensagem('Existe alguma inconcistência no valor informado de dinheiro e cheque.', 'Atenção', MB_OK + MB_ICONWARNING);
     CanClose := False;
     Exit;
  end;


   //verifica valor dos cheques
   if (dblCh > 0) AND (NOT ckbDeposito.checked) then begin

      SalvaCheque();
      dValor := 0;
      for i := 0 to slCheques.Count - 1 do begin
         if slCheques.Objects[i] is TCheque then begin
            dValor := dValor + TCheque(slCheques.Objects[i]).getValor();
         end;
      end;
      if (RoundFloat(dValor,2) < RoundFloat(StrToFloat(txtCh.Text),2)) then begin
         if Mensagem('Valor de Cheques inferior ao informado. Deseja continuar mesmo assim?', 'Atenção', MB_YESNO + MB_ICONWARNING) = mrYes then
            CanClose := true
         else
            CanClose := False;
         Exit;
      end;

   end;
end;

procedure TfrmDinCh.txtCheque_ValorKeyPress(Sender: TObject;
  var Key: Char);
var
  dblAux : Single;
begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin
    try
      dblAux := RoundFloat( StrToFloat( txtCheque_Valor.Text ) , 2 );

      txtCheque_Valor.Text := Trim( Format( '%8.2f', [RoundFloat( (dblAux), 2 )] ) );
      txtCheque_Data.SetFocus;
      txtCheque_Data.SelectAll;
    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      txtCheque_Valor.SetFocus;
      txtCheque_Valor.SelectAll;

      raise;

      Exit;
    end;
  end;

end;

procedure TfrmDinCh.txtCheque_BancoKeyPress(Sender: TObject;
  var Key: Char);
Var
     g_infCheque : TInfCheque;  
begin
   if key = #13 Then
   Begin
      if Copy(txtCheque_Banco.Text, 1, 1) = '<' then begin
      
        if CMC7Ok(txtCheque_Banco.Text , g_infCheque) then begin

           txtCheque_Banco.Text := g_infcheque.banc;
           txtCheque_Agencia.Text := g_infcheque.agen;
           txtCheque_CC.Text := g_infcheque.cont;
           txtCheque_nro.Text := g_infcheque.nume;

           btnOk.SetFocus();

        end else begin

           Application.MessageBox(pchar('Erro na leitura do cheque!'),'Aviso', MB_OK + MB_ICONEXCLAMATION) ;
           txtCheque_Banco.Clear;
           txtCheque_Banco.SetFocus();

        end;      
      end else begin
         SelectNext(Sender as TWinControl, True, True);
      end;
      Key := #0;
   End;
end;

procedure TfrmDinCh.txtCheque_DataEnter(Sender: TObject);
begin
   SalvaCheque();
end;

procedure TfrmDinCh.txtCheque_DataKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 Then
   Begin
       btnOk.SetFocus;
       Key := #0;
   End;

end;

procedure TfrmDinCh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UltimoAluno := AlunoAtual;
end;

procedure TfrmDinCh.btnCancelClick(Sender: TObject);
begin
   Cancelar := True;
end;

procedure TfrmDinCh.AddCheque;
begin
   iCheque := slCheques.Count;
   txtCheque_Banco.Text := '';
   txtCheque_Agencia.Text := '';
   txtCheque_CC.Text := '';
   txtCheque_nro.Text := '';
   txtCheque_Data.Text := '';
   txtCheque_Valor.Text := '0';
   txtCheque_Banco.SetFocus();
   AtualizaPosicao();
end;

procedure TfrmDinCh.AtualizaTotalCheques;
var
   i: Integer;
   dValor: Double;
begin
   dValor := 0;
   for i := 0 to slCheques.Count - 1 do begin

      if slCheques.Objects[i] is TCheque then begin
         dValor := dValor + TCheque(slCheques.Objects[i]).getValor();
      end;
   end;
   lblTotal.Caption := Format( '%8.2n', [dValor] ) + ' ';
end;

procedure TfrmDinCh.MostraItem(i: Integer);
var
   cCh: TCheque;
begin

   if (i < 0) then begin
      Mensagem('Você está no último Cheque!!');
      Exit;
   end;
   if (i >= slCheques.Count) then begin
      Mensagem('Você está no primeiro Cheque!!');
      Exit;
   end;

   iCheque := i;

   if slCheques.Objects[i] is TCheque then begin
      cCh := TCheque(slCheques.Objects[i]);
      iCheque := i;
      txtCheque_Banco.Text := cCh.getBanco();
      txtCheque_Agencia.Text := cCh.getAgencia();
      txtCheque_CC.Text := cCh.getContaCorrente();
      txtCheque_nro.Text := cCh.getNumero();
      if cCh.getData <> 0 then begin
         txtCheque_Data.Text := FormatDateTime('dd/mm/yyyy', cCh.getData());
      end
      else begin
         txtCheque_Data.Text := '';
      end;
      txtCheque_Valor.Text := Trim( Format( '%8.2n', [cCh.getValor()] ));
      txtCheque_Banco.SetFocus();
   end;
   AtualizaPosicao();

end;

procedure TfrmDinCh.RemoveCheque(i: Integer);
var
   cCh: TCheque;
begin


   if slCheques.Objects[i] is TCheque then begin
      cCh := TCheque(slCheques.Objects[i]);
      slCheques.Delete(i);
      FreeAndNil(cCh);
      iCheque := 0;
      MostraItem(iCheque);
      AtualizaTotalCheques();
      AtualizaPosicao();
   end;

end;

{ TCheque }

procedure TCheque.setData(dtInputData: TDateTime);
begin
   dtData := dtInputData;
end;

constructor TCheque.Create;
begin
  inherited;

end;

procedure TCheque.setBanco(sValor: string);
begin
   sBanco := sValor;
end;

function TCheque.getNumero: string;
begin
   Result := sNumero;
end;

procedure TCheque.setValor(dInputValor: Double);
begin
   dValor := dInputValor;
end;

function TCheque.getAgencia: string;
begin
   Result := sAgencia;
end;

procedure TCheque.setNumero(sInputValor: string);
begin
   sNumero := sInputValor;
end;

function TCheque.getBanco: string;
begin
   Result := sBanco;
end;

function TCheque.getValor: Double;
begin
   Result := dValor;
end;

destructor TCheque.Destroy;
begin

  inherited;
end;

procedure TCheque.setAgencia(sValor: string);
begin
   sAgencia := sValor;
end;

function TCheque.getData: TDateTime;
begin
   Result := dtData;
end;


function TCheque.getContaCorrente: string;
begin
   Result := sContaCorrente;
end;

procedure TCheque.setContaCorrente(sValor: string);
begin
   sContaCorrente := sValor;
end;

procedure TfrmDinCh.AtualizaPosicao;
begin
   lblPosicao.Caption := IntToStr(iCheque+1) + ' de ' + IntToStr(slCheques.Count);
end;


procedure TfrmDinCh.SalvaCheque;
var
   sCh: TCheque;
   dtData: TDateTime;
begin
   if not bSalvarCheque then begin
      Exit;
   end;

   if (iCheque >= 0) then begin

      if (iCheque < slCheques.Count) then begin
         //verifica se tem algo naquela posicao e remove
         if slCheques.Objects[iCheque] is TCheque then begin
            sCh := TCheque(slCheques.Objects[iCheque]);
            FreeAndNil(sCh);
            slCheques.Delete(iCheque);
         end;
      end;

      bSalvarCheque := False;

      sCh := TCheque.Create();
      sCh.setBanco(txtCheque_Banco.Text);
      sch.setAgencia(txtCheque_Agencia.Text);
      sCh.setContaCorrente(txtCheque_CC.Text);
      sCh.setNumero(txtCheque_nro.Text);
      txtCheque_Valor.Text := StringReplace(txtCheque_Valor.Text, '.', '', [rfReplaceAll]);
      if txtCheque_Valor.Text = '' then begin
         txtCheque_Valor.Text := '0';
      end;
      sCh.setValor(RoundFloat( StrToFloat(txtCheque_Valor.Text), 2));
      //atualiza a data
      if ((txtCheque_Data.Text = '') or (txtCheque_Data.Text = '  /  /  ') or (txtCheque_Data.Text =  '__/__/__')) then begin
         sCh.setData(0);
      end
      else begin
         try
            dtData := StrToDate(txtCheque_Data.Text);
            sCh.setData(dtData);
         except
            sCh.setData(Now());
         end;
      end;
      slCheques.InsertObject(iCheque, '', (sCh));
      AtualizaTotalCheques();
      AtualizaPosicao();
   end;
end;

procedure TfrmDinCh.SalvaDeposito;
begin
  // Salvar o Depósito
end;

procedure TfrmDinCh.btChequeProxClick(Sender: TObject);
begin
   if (iCheque+1 >= 0) and (iCheque+1 < slCheques.Count) then begin
      SalvaCheque();
      Inc(iCheque);
      MostraItem(iCheque);
   end;
end;

procedure TfrmDinCh.btChequeAntClick(Sender: TObject);
begin

   if (iCheque > 0) and (iCheque-1 < slCheques.Count) then begin
      SalvaCheque();
      Dec(iCheque);
      MostraItem(iCheque);
   end;
end;

procedure TfrmDinCh.btChequeAddClick(Sender: TObject);
begin
   SalvaCheque();
   AddCheque();
end;

procedure TfrmDinCh.btChequeDelClick(Sender: TObject);
begin
   RemoveCheque(iCheque);
end;

procedure TfrmDinCh.txtAlteraCheque(Sender: TObject);
begin
   bSalvarCheque := True;
end;

procedure TfrmDinCh.txtChExit(Sender: TObject);
var
  dblAux : Single;
begin
    try
      try
         dblAux := RoundFloat( StrToFloat( txtCh.Text ) , 2 );
      except
         txtCh.Text := '0,00';
         dblAux := 0;
      end;
      dblCh := dblAux;
      if dblCh < dblValor then
      dblDin := RoundFloat( ( dblValor - dblCh ), 2 );

      if ( dblDin > -0.000000000000001 ) and
         ( dblDin <  0.100000000000000 ) then dblDin := 0;

      txtDin.Text := Trim( Format( '%8.2f', [RoundFloat( (dblValor - dblCh), 2 )] ) );
      txtDin.SetFocus;
      txtDin.SelectAll;

      btnOk.Enabled := true;

      Expande(dblCh > 0);

    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      txtCh.SetFocus;
      txtCh.SelectAll;
      raise;
      Exit;
    end;
end;

procedure TfrmDinCh.btnOkClick(Sender: TObject);
begin
   SalvaCheque();
   SalvaDeposito();
end;

procedure TfrmDinCh.ckbDepositoClick(Sender: TObject);
begin
   Expande(False);
end;

procedure TfrmDinCh.edNumeroTalaoExit(Sender: TObject);
Var
  qyProcura : TUMZQuery;
  sTexto : String;
begin
  if Trim(edNumeroTalao.Text) = '' then begin
     Exit;
  end;

  // Procurar pelo Número de Depósito
  DM.CriarConsulta(qyProcura);

  qyProcura.SQL.Text :=
    ' SELECT p.nm_pessoa, m.datapagamento, m.valorpago ' +
    '   FROM mensalidades m INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) ' +
    '  WHERE m.ds_deposito = ' + QuotedStr(edNumeroTalao.Text) + ' ';
  qyProcura.Open();

  if NOT qyProcura.Eof then begin
     sTexto := 'Atenção:' + CHR(13) + CHR(13);
     sTexto := 'Este talão de depósito já foi utilizado para baixar o seguinte título: ' + CHR(13) + CHR(13);

     while not qyProcura.Eof do begin

         sTexto := sTexto + FillString(qyProcura.FieldByName('nm_pessoa').AsString, alLeft, ' ', 35, false);
         sTexto := sTexto + '  ' + FormatDateTime('dd/mm/yyyy', qyProcura.FieldByName('datapagamento').AsDateTime);
         sTexto := sTexto + '  ' + Format( '%8.2n', [qyProcura.FieldByName('valorpago').AsCurrency] );
         sTexto := sTexto + CHR(13);

         qyProcura.Next;

     end;

     sTexto := sTexto + CHR(13) + CHR(13);

     sTexto := sTexto + 'Deseja continuar a baixa com o mesmo número de depósito?';

     if Mensagem(sTexto, 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then begin

        edNumeroTalao.SetFocus();
     
     end else begin

        btnOkClick(Self);
        Self.ModalResult := mrOk;
        CloseModal();

     end;

  end else begin

     btnOk.SetFocus();

  end;


end;

procedure TfrmDinCh.Expande(TemCheque: Boolean);
begin
   if (TemCheque OR ckbDeposito.checked) then begin
       frmDinCh.Width := 470;

       if ckbDeposito.Checked then begin
           pcDocumento.Pages[0].TabVisible := false;
           pcDocumento.Pages[1].TabVisible := True;
           edNumeroTalao.SetFocus;
       end else begin
           if AlunoAtual <> UltimoAluno then begin
               txtCheque_Valor.Text := FloatToStrF(dblCh, ffFixed, 8, 2);
           end;
           pcDocumento.Pages[1].TabVisible := false;
           pcDocumento.Pages[0].TabVisible := true;
           txtCheque_Banco.SetFocus;
       end;


   end else
       frmDinCh.Width := 220;
end;

End.

