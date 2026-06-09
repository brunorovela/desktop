unit uFinanceiro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, checklst, ExtCtrls, Db, ZConnection, Buttons, General,
   ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmFinanceiro = class(TForm)
    Panel1: TPanel;
    lst: TCheckListBox;
    btnFechar: TSpeedButton;
    btnSituacao: TButton;
    btnObservacoes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSituacaoClick(Sender: TObject);
    procedure InicializaArrays;
    procedure btnObservacoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    lngCodigo : Longint;
    ArrayDatas : Array[0..255] of TDateTime;
    ArrayParcelas : Array[0..255] of Integer;
    ArrayTurmas : Array[0..255] of String[5];
  public
    intSituacao : Integer;
    procedure ShowDebitos( lngCodigoAluno : Longint; cd_coligada : string );
    { Public declarations }
  end;

var
  frmFinanceiro: TfrmFinanceiro;

implementation

uses Main, uDM, UFObservacoes, uUsuario;

{$R *.DFM}


procedure TfrmFinanceiro.InicializaArrays;
var
  n : Integer;
  datZero : TDateTime;
begin
  datZero := 0;
  for n := Low( ArrayTurmas ) to High( ArrayTurmas ) do ArrayTurmas[n] := '';
  for n := Low( ArrayParcelas ) to High( ArrayParcelas ) do ArrayParcelas[n] := 0;
  for n := Low( ArrayDatas ) to High( ArrayDatas ) do ArrayDatas[n] := datZero;
end;

procedure TfrmFinanceiro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFinanceiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
  if Key = Ord( 'O' ) then btnObservacoesClick( nil );
end;

procedure TfrmFinanceiro.btnSituacaoClick(Sender: TObject);
var
  n : Integer;
begin
  Screen.Cursor := crHourGlass;

//  DM.tblMensalidades.Filter := '';
//  DM.tblMensalidades.CancelRange;

  try
  DM.db.StartTransaction;
  for n := 0 to lst.Items.Count - 1 do
  begin
    if lst.Checked[n] then
    begin

      DM.tblMensalidades.Close;
      DM.tblMensalidades.SQL.Clear;
      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( 'CodigoAluno = :CodigoAluno and ' );
      DM.tblMensalidades.SQL.Add( 'Parcela = :Parcela and ' );
      DM.tblMensalidades.SQL.Add( 'DataVencimento = :DataVencimento and ' );
      DM.tblMensalidades.SQL.Add( 'Turma = :Turma' );
      DM.tblMensalidades.ParamByName('CodigoAluno').AsInteger := lngCodigo;
      DM.tblMensalidades.ParamByName('Parcela').AsInteger := ArrayParcelas[n];
      DM.tblMensalidades.ParamByName('DataVencimento').AsString := DateToStr(ArrayDatas[n]);
      DM.tblMensalidades.ParamByName('Turma').AsString := ArrayTurmas[n];
      DM.tblMensalidades.Open;

      if DM.tblMensalidades.RecordCount > 0 then
      begin
        DM.tblMensalidades.Edit;
        DM.tblMensalidadesSituacao.AsInteger := intSituacao;
        DM.tblMensalidades.Post;
      end;
    end;
  end;
  DM.db.Commit;
  except
    DM.db.Rollback;
    Mensagem( 'Ocorreu um erro inesperado ao realizar esta operação.', Application.Title,
               MB_OK + MB_ICONSTOP );
    Screen.Cursor := crDefault;
    Exit;
  end;

  Screen.Cursor := crDefault;

  Mensagem( 'Ítens atualizados com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

  Close;

end;

procedure TfrmFinanceiro.btnObservacoesClick(Sender: TObject);
begin
   TfObservacoes.ShowObservations(Self, lngCodigo, okFinancial);
end;

procedure TfrmFinanceiro.ShowDebitos( lngCodigoAluno : Longint;  cd_coligada : string );
var
   n: Integer;
   parametroFinanceiroFiltro : String;
begin
   lngCodigo := lngCodigoAluno;
   PrincipalForm.pnlMsg.Caption := '';
   PrincipalForm.pnlMsg.Caption := ' Carregando Módulo: Débitos...';
   Screen.Cursor := crHourGlass;
   
   DM.tblMensalidades.Close;
   DM.tblMensalidades.SQL.Clear;
   DM.tblMensalidades.SQL.Add('SELECT * FROM MENSALIDADES WHERE');
   DM.tblMensalidades.SQL.Add('CODIGOALUNO = :CODIGOALUNO AND ');

   // Verifica se o parâmetro matricula_avisa_financeiro_filtro foi configurado
   // e utiliza-o como condição para o SQL que mostra as pendências
   // tenta primeiro buscar da coligada especifica
   
   parametroFinanceiroFiltro :=  Trim(DM.getParametroPorColigadaNaoLogada('matricula_avisa_financeiro_filtro',cd_coligada));
   if(parametroFinanceiroFiltro = '') then
   begin
      parametroFinanceiroFiltro := Trim(DM.variavel_parametro('matricula_avisa_financeiro_filtro'));
   end;

   if parametroFinanceiroFiltro <> '' then
   begin
      DM.tblMensalidades.SQL.Add(parametroFinanceiroFiltro);
   end
   else
   begin
      DM.tblMensalidades.SQL.Add('SITUACAO = 2');
   end;
   DM.tblMensalidades.ParamByName('CODIGOALUNO').AsInteger := lngCodigoAluno;
   DM.tblMensalidades.Open;
   DM.tblMensalidades.First;

   lst.Items.Clear;
   InicializaArrays;
   n := 0;
   
   while not DM.tblMensalidades.Eof do
   begin
      ArrayParcelas[n] := DM.tblMensalidadesParcela.AsInteger;
      ArrayTurmas[n] := DM.tblMensalidadesTurma.AsString;
      ArrayDatas[n] := DM.tblMensalidadesDataVencimento.AsDateTime;
      lst.Items.Add(
         Format('PARCELA %.2d', [DM.tblMensalidadesParcela.AsInteger]) +  ' - ' +
         FormatDateTime('dd/mm/yyyy', DM.tblMensalidadesDataVencimento.AsDateTime) + ' - ' +
         Format('%8.2n', [DM.tblMensalidadesValorTotalCalc.Value]) + ' - ' +
         DM.tblMensalidadesTurma.AsString);
      Inc(n);
      DM.tblMensalidades.Next;
   end;
   Screen.Cursor := crDefault;
   PrincipalForm.pnlMsg.Caption := '';

   if TfObservacoes.HasObservations(lngCodigoAluno, okFinancial) then
      btnObservacoes.Font.Style := []
   else
      btnObservacoes.Font.Style := [fsBold];
   
   ShowModal;
end;

procedure TfrmFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFinanceiro.FormCreate(Sender: TObject);
begin
   if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
   begin
      btnObservacoes.Caption := DM.variavel_parametro('botao_observacoes_nome');
      if Trim(btnObservacoes.Caption) = EmptyStr then
         btnObservacoes.Caption := '&Observações';
   end;
end;

end.

