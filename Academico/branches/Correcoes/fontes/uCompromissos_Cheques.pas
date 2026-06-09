unit uCompromissos_Cheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  uContasPagar_Planilha;

type
  Tfrm_compromisso_cheques = class(TForm)
    Panel3: TPanel;
    Bevel4: TBevel;
    Label1: TLabel;
    edCodTitulo: TEdit;
    Label2: TLabel;
    edDescricao: TEdit;
    Bevel1: TBevel;
    cbContas: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edCheque: TEdit;
    ckBaixarCompromisso: TCheckBox;
    ckCompensar: TCheckBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lbHistorico: TLabel;
    edHistorico: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure ckCompensarKeyPress(Sender: TObject; var Key: Char);
    procedure ckBaixarCompromissoKeyPress(Sender: TObject; var Key: Char);
    procedure edHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure cbContasKeyPress(Sender: TObject; var Key: Char);
    procedure edChequeKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckBaixarCompromissoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbContasChange(Sender: TObject);
  private    { Private declarations }


    qyTitulo : TUMZQuery;

    lstContas : Array [0..200] of integer;
    lstCheque : Array [0..200] of integer;

    Procedure PreencherComboContas;
    Procedure SelecionaTitulo;

  public                 
    { Public declarations }
    iCodTitulo: Integer;
    iCodColigada: Integer;
  end;

var
  frm_compromisso_cheques: Tfrm_compromisso_cheques;

implementation

uses uDM;

{$R *.dfm}

{ Tfrm_compromisso_cheques }

procedure Tfrm_compromisso_cheques.PreencherComboContas;
var
  qyContas : TUMZQuery;
  n : Integer;
begin

  DM.CriarConsulta(qyContas);

  qyContas.SQL.Clear;
  qyContas.SQL.Add(' SELECT c.cd_caixa, c.ds_caixa, c.nr_ultimo_cheque ');
  qyContas.SQL.Add(' FROM fin_cadastro_contas c');
  qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (c.cd_caixa = u.cd_caixa) ');
  qyContas.SQL.Add(' WHERE c.sn_ativa = ''S'' ');
  qyContas.SQL.Add(Format(' AND (c.cd_coligada IN ( %s ) OR c.sn_todas_coligadas = 1)', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada()]));
  qyContas.SQL.Add(' AND u.cd_usuario = ' + IntToStr(DM.iCdPessoaLogado) );
  qyContas.SQL.Add(' ORDER by c.ds_caixa ');
  qyContas.Open;

  qyContas.Open();

  cbContas.Items.Clear;

  n := 0;

  while not qyContas.Eof do begin
      cbContas.Items.Add(FillString(qyContas.FieldByName('cd_caixa').AsString, alRight, '0', 6, True ) + ' - ' + qyContas.FieldByName('ds_caixa').AsString);

      lstContas[n] := qyContas.FieldByName('cd_caixa').AsInteger;
      lstCheque[n] := qyContas.FieldByName('nr_ultimo_cheque').AsInteger;

      qyContas.Next();

      INC(n);
  end;

  cbContas.ItemIndex := -1;

  FreeAndNil(qyContas);

end;

procedure Tfrm_compromisso_cheques.cbContasChange(Sender: TObject);
begin

   if cbContas.ItemIndex >= 0 then begin
      edCheque.Text := IntToStr(lstCheque[cbContas.ItemIndex]);
   end;

end;

procedure Tfrm_compromisso_cheques.FormShow(Sender: TObject);
begin
    PreencherComboContas;

    SelecionaTitulo;

    ckBaixarCompromisso.Checked := false;
    ckCompensar.Checked := false;
    ckCompensar.Enabled := false;

    edHistorico.Enabled := False;
    lbHistorico.Enabled := False;
end;

procedure Tfrm_compromisso_cheques.ckBaixarCompromissoClick(Sender: TObject);
begin
   ckCompensar.Enabled := ckBaixarCompromisso.Checked;

   lbHistorico.Enabled := ckBaixarCompromisso.Checked;
   edHistorico.Enabled := ckBaixarCompromisso.Checked;
end;

procedure Tfrm_compromisso_cheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_compromisso_cheques.btnConfirmarClick(Sender: TObject);
Var
   qyAtualiza : TUMZQuery;
   iNroCheque : Integer;
   sChave : String;
begin
   // Verificar se selecionou uma conta
   if cbContas.ItemIndex < 0 then begin
      Mensagem('Selecione uma conta para registrar o cheque.', 'Atenção', MB_OK + MB_ICONWARNING);
      cbContas.SetFocus();
      Exit;
   end;

   if Trim(edCheque.Text) = '' then begin
      Mensagem('Preencha o número do cheque que será utilizado para efetuar o pagamento.', 'Atenção', MB_OK + MB_ICONWARNING);
      edCheque.SetFocus();
      Exit;
   end;

   iNroCheque := RC_StrToInt(edCheque.Text);

   DM.CriarConsulta(qyAtualiza);
   qyAtualiza.Close();
   qyAtualiza.SQL.Text :=
      ' UPDATE fin_contas_pagar                   ' +
      '    SET nr_cheque = ' + IntToStr(iNroCheque) + ', ' +
      '    cd_caixa = ' + IntToStr(lstContas[cbContas.ItemIndex]) +
      ' WHERE cd_titulo = ' + IntToStr(iCodTitulo) +
      '    AND cd_coligada = ' + IntToStr(Self.iCodColigada);

   qyAtualiza.ExecSQL();

   qyAtualiza.SQL.Text :=
      ' UPDATE fin_cadastro_contas   ' +
      ' SET nr_ultimo_cheque = ' + IntToStr(iNroCheque + 1) +
      ' WHERE cd_caixa = ' + IntToStr(lstContas[cbContas.ItemIndex]) +
      '    AND cd_coligada = ' + IntToStr(DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

   sChave := IntToStr(iCodTitulo) + ';' + IntToStr(DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

   DM.setLog(2033, 'Alteracao', sChave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo, 'Programou pagamento com o Cheque "'+IntToStr(iNroCheque)+'" da Conta "'+IntToStr(lstContas[cbContas.ItemIndex])+'"');

   qyAtualiza.ExecSQL();
   Close();
end;

procedure Tfrm_compromisso_cheques.edChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then begin
        Key := #0;
        SelectNext(Sender as TWinControl, True, True);
        exit;
     end;

     if not (key in ['0'..'9', #8]) then begin
        key := #0;
        exit;
     end;
end;

procedure Tfrm_compromisso_cheques.cbContasKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then begin
        Key := #0;
        SelectNext(Sender as TWinControl, True, True);
        exit;
     end;
end;

procedure Tfrm_compromisso_cheques.edHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then begin
        Key := #0;
        SelectNext(Sender as TWinControl, True, True);
        exit;
     end;
end;

procedure Tfrm_compromisso_cheques.ckBaixarCompromissoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then begin
        Key := #0;
        SelectNext(Sender as TWinControl, True, True);
        exit;
     end;
end;

procedure Tfrm_compromisso_cheques.ckCompensarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then begin
        Key := #0;
        SelectNext(Sender as TWinControl, True, True);
        exit;
     end;
end;

procedure Tfrm_compromisso_cheques.btnCancelarClick(Sender: TObject);
begin
   Close();
end;

procedure Tfrm_compromisso_cheques.SelecionaTitulo;
var n : Integer;
begin
    DM.CriarConsulta(qyTitulo);
    qyTitulo.Close;
    qyTitulo.SQL.Text :=
       ' SELECT * from fin_contas_pagar ' +
       ' WHERE cd_titulo = ' + IntToStr(iCodTitulo) +
       '    AND cD_coligada = ' + IntToStr(Self.iCodColigada) ;
    qyTitulo.Open();   

    edCodTitulo.Text := IntToStr(iCodTitulo);
    edDescricao.Text := qyTitulo.FieldByName('ds_despesa').AsString;

    edHistorico.Text := edDescricao.Text;

    // Definir a Conta Padrão....

    for n:= 0 to Length(lstContas)-1 do begin
        if qyTitulo.FieldByName('cd_caixa').AsInteger = lstContas[n] then begin
           cbContas.ItemIndex := n;
           edCheque.Text := IntToStr(lstCheque[n]);
           Exit;
        end;
    end;

    Exit;
end;

end.

