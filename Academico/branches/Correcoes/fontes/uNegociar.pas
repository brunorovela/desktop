unit uNegociar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Db, ZConnection, StdCtrls, checklst, ExtCtrls, DBCtrls, Mask, Spin,
  ComCtrls, Buttons, Math;

type
  TfrmNegociar = class(TForm)
    lst: TCheckListBox;
    Panel1: TPanel;
    lst2: TCheckListBox;
    Panel2: TPanel;
    Panel3: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    btn1x: TButton;
    btn2x: TButton;
    btn3x: TButton;
    btn4x: TButton;
    btn5x: TButton;
    btn6x: TButton;
    Panel4: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    txtJuros: TEdit;
    Label2: TLabel;
    qryPoupanca: TUMZQuery;
    btnCalcular: TButton;
    datApartir: TDateTimePicker;
    txtParcelas: TSpinEdit;
    Panel5: TPanel;
    btnFechar: TSpeedButton;
    btnConfirmar: TSpeedButton;
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
    tblMensalidadesAnoLetivo: TSmallintField;
    tblMensalidadesSemestre: TSmallintField;
    tblMensalidadesCodigoCarta: TIntegerField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesValorJurosCalc: TFloatField;
    tblMensalidadesBloqueto: TStringField;
    tblMensalidadesCurso: TStringField;
    tblMensalidadesDepto: TSmallintField;
    tblMensalidadesTipoParcela: TSmallintField;
    qryPoupancaMedia: TFloatField;
    Label3: TLabel;
    cbTurma: TComboBox;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    txtVlrEntrada: TEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblMensalidadescd_mensalidade_origem: TIntegerField;
    tblMensalidadescd_forma_pgto: TIntegerField;
    tblMensalidadescd_coligada: TSmallintField;
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btn1xClick(Sender: TObject);
    procedure btn2xClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure TransferirMensalidades;
    procedure TransferirEntrada;
    procedure lstClick(Sender: TObject);
    procedure tblMensalidadesBeforePost(DataSet: TDataSet);
    procedure FormHide(Sender: TObject);
    procedure txtJurosKeyPress(Sender: TObject; var Key: Char);
    procedure MarcarTodas(ck: TCheckListBox; situ: boolean);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Os Arrays foram aumentados de 30 para 100 posição por Claudionor }
    ArrayValores : Array [0..100] of Single;
    ArrayJuros : Array [0..100] of Single;
    ArrayCalculados : Array[0..100] of Single;
    ArrayDatas : Array[0..100] of TDateTime;
    ArrayDatasInicial : Array[0..100] of TDateTime;
    ArrayParcelas : Array[0..100] of Integer;
    ArrayCodParcelas : Array[0..100] of Integer;
    ArrayTodasTurmas : Array[0..100] of String[15];
    ArrayTurmas : Array[0..100] of String[15];
    ArrayAnoSemestre : Array[0..100] of Integer;
    ArrayParcelasNovas : Array[0..100] of Integer;
    intIndice : Integer;
    SomaJuros : Single;
    Bruto : Single;
    entrada : double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNegociar: TfrmNegociar;

implementation

uses Main, uMensalidades, uDM, uSenha, uMotivos, StrUtils, uClassMovimento;

{$R *.DFM}



procedure TfrmNegociar.tblMensalidadesCalcFields(DataSet: TDataSet);
var
  wYear, wMonth, wDay : Word;
begin

  { Calculo dos Juros }
  if ( tblMensalidadesDataVencimento.AsDateTime < (DataHoje) ) and
    ( tblMensalidadesSituacao.Value = 2 ) then 
  begin
    { PARCELAS VENCIDAS }
    if tblMensalidadesParcela.AsInteger <> 0 then { Não corrigir taxa de material }
       begin
          DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wYear, wMonth, wDay );

          { Novo Cálculo, incluindo o Juros pendente }
          tblMensalidadesValorTotalCalc.Value := RoundFloat(
                ( tblMensalidadesValorBruto.Value +
                tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value +
                tblMensalidadesValorJuros.Value )  +
		DM.pegar_acrescimo(tblMensalidadescd_mensalidade.AsInteger, DataHoje) ,2 );

          { Novo Juros }
          tblMensalidadesValorJurosCalc.Value := RoundFloat(
                 tblMensalidadesValorTotalCalc.Value - ( tblMensalidadesValorBruto.Value +
                   tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value ), 2 );

       end

    else { Parcela ZERO - Taxa de Material }

       Begin
            tblMensalidadesValorTotalCalc.Value := RoundFloat( tblMensalidadesValorTotal.Value , 2 );
            tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value , 2 );
       End;
  end
  else
  { PARCELAS NÃO VENCIDAS }
  begin
       if (tblMensalidadesSituacao.Value = 0) or (tblMensalidadesSituacao.Value = 1) or (tblMensalidadesSituacao.Value = 3) Then
          tblMensalidadesValorTotalCalc.Value := RoundFloat( tblMensalidadesValorTotal.Value, 2 )
       Else
          tblMensalidadesValorTotalCalc.Value := RoundFloat(
             tblMensalidadesValorBruto.Value + tblMensalidadesValorExtra.Value -
             tblMensalidadesValorDesconto.Value - tblMensalidadesDescontoExtra.Value +
             tblMensalidadesValorJuros.Value, 2 );
       tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value, 2 );
  end;


end;

procedure TfrmNegociar.FormShow(Sender: TObject);
var
  wYear, wMonth, wDay : Word;
  n : Byte;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Screen.Cursor := crHourGlass;

  datApartir.Date := DataHoje;

  { Selecionar todas as mensalidades pendentes do Acadêmico }
  tblMensalidades.Close;
  tblMensalidades.SQL.Clear;
  tblMensalidades.SQL.Add( 'select * from Mensalidades where ' );
  tblMensalidades.SQL.Add( '(CodigoAluno = :Codigo) and ' );
  tblMensalidades.SQL.Add( '(Situacao = 2)' );
  tblMensalidades.SQL.Add( 'order by CodigoAluno, Parcela, DataVencimento, Turma' );
  tblMensalidades.ParamByName('Codigo').AsInteger := frmMensalidades.tblMensalidadesCodigoAluno.AsInteger;
  tblMensalidades.Prepare;
  tblMensalidades.Open;

  lst.Items.Clear;    // ListBox das parcelas pendentes
  lst2.Items.Clear;   // ListBox das parcelas calculadas
  n := 0;

  { Carregar todas as parcelas da tabela de mensalidades }
  while not tblMensalidades.EOF do
  begin

    ArrayValores[n]  := tblMensalidadesValorTotalCalc.Value;  // ValorTotal Reajustado até aqui
    ArrayJuros[n]    := tblMensalidadesValorJurosCalc.Value;  // Valor referente ao Juros (ja faz parte do ValorTotalCalc
    ArrayParcelas[n] := tblMensalidadesParcela.AsInteger;     // Número da Parcela Pendente
    ArrayCodParcelas[n] := tblMensalidadescd_mensalidade.AsInteger;
    ArrayTodasTurmas[n] := tblMensalidadesTurma.AsString;


    { Adicionar DISTINTAMENTE as turmas e anosemestre dos alunos }
    if cbTurma.Items.IndexOf(tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesAnoSemestre.AsString) < 0 Then
    Begin
       ArrayTurmas[n] := tblMensalidadesTurma.AsString;              // Adicionar a Turmas
       ArrayAnoSemestre[n] := tblMensalidadesAnoSemestre.AsInteger;  // Adicionar o Semestre

       { Adicionar no Combobox }
       cbTurma.Items.Add(tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesAnoSemestre.AsString);

    End;

    ArrayDatasInicial[n] := tblMensalidadesDataVencimento.AsDateTime;   // Vencimento

    { Adicionar o ListBox das pendentes }
    lst.Items.Add( Format( 'PARCELA %.2d', [tblMensalidadesParcela.AsInteger] ) +  ' - ' +
	 FormatDateTime( 'dd/mm/yyyy', tblMensalidadesDataVencimento.AsDateTime ) + ' - ' +
	 Format( '%8.2n', [tblMensalidadesValorTotalCalc.Value] ) );

    tblMensalidades.Next;
    Inc( n );

  end;

  cbTurma.ItemIndex := 0; // Selecionar a última TURMA
  ArrayValores[n] := 0.00;
  ArrayJuros[n] := 0.00;

  { Prepara a taxa de juros com a média dos últimos seis meses }
  { Se o índice da poupança não foi cadastrado, o Juros será igual a ZERO }
  qryPoupanca.Close;

  DecodeDate( DataHoje, wYear, wMonth, wDay );
  Dec( wMonth );
  if wMonth = 0 then
  begin
    wMonth := 12;
    Dec( wYear );
  end;
  qryPoupanca.ParamByName('DataFim').AsString := FormatDateTime('yyyy-mm-dd',EncodeDate( wYear, wMonth, 1 ));
  for n := 1 to 5 do
  begin
    Dec( wMonth );
    if wMonth = 0 then
    begin
      wMonth := 12;
      Dec( wYear );
    end;
  end;

  qryPoupanca.ParamByName('DataInicio').AsString := FormatDateTime('yyyy-mm-dd',EncodeDate( wYear, wMonth, 1 ));
  qryPoupanca.Open;

  txtJuros.Text := Format( '%8.4n', [qryPoupancaMedia.AsFloat] );

  Screen.Cursor := crDefault;
end;

procedure TfrmNegociar.btnCalcularClick(Sender: TObject);
var
  wYear, wMonth, wDay : Word;    // Data inicial do 1o Pagamento
  wAno, wMes, wDia : Word;       // Data de Hoje (negociação)
  a,
  n,  // diferença de meses da data de Hoje até a data do 1o Pgto
  i,  // Contador Auxiliar
  x : Integer;
  MyDay: TDateTime;
  pmt,        // Valor Mensal das Prestações
  dblTotal,   // Valor Presente (Capital inicial)
  dblJuros : Single;   // Tx de Juros
  fap : double;
  fv : double;
  flgAux : Boolean;

begin
   if txtParcelas.Value <= 0 then Exit;

   { Verificando se na Entrada foi digitado um número }
   if ( txtVlrEntrada.text <> '' ) then
   begin
     try
       entrada := StrToFloat(txtVlrEntrada.text);
     except
       entrada := 0;
       MessageDlg('Digite um valor numérico no campo Entrada.', mtWarning, [mbOK], 0);
       exit;
     end;
   end
   else entrada := 0;

   { Cálculo das Parcelas Negociadas }

   flgAux := False;
   Screen.Cursor := crHourGlass;

   { --- Inicio do Cálculo Financeiro -- }
   dblTotal := 0;
   SomaJuros := 0;
   try
      dblJuros := StrToFloat( Trim( txtJuros.Text ) ) / 100;
   except
      dblJuros := 0;
   end;

   {
   Verificar o total das prestações
   O valor das mensalidades já são reajustados até a data de hoje
   terá que calcular juros somente da data de hoje em diante.
   }

   for n := 0 to lst.Items.Count - 1 do
   begin
     if lst.Checked[n] then Begin
       dblTotal := dblTotal + ArrayValores[n];
       SomaJuros := SomaJuros + ArrayJuros[n];
     End
   end;

   { Se tiver informado um valor pra entrada, já desconta a mesma }
   if ( entrada > 0 ) then
   begin
    dblTotal := dblTotal - entrada;
   end;

   Bruto:= dblTotal - SomaJuros;

   lst2.Items.Clear;

   DecodeDate( datApartir.Date, wYear, wMonth, wDay );

   DecodeDate( DataHoje, wAno, wMes, wDia );

   n := 0;

   if StrToFloat(txtJuros.Text) > 0 Then
   Begin
      n := Meses( DataHoje, datApartir.Date );  // Dif de meses

      if (n > 1) then // Cobrar juros composto até a data de inicio
	  dblTotal := dblTotal * Power( (1 + dblJuros), (n-1));

      if txtParcelas.Value >= 1 then
      Begin

	 fap := (1 - (Power(1 + dblJuros, -txtParcelas.Value))) / dblJuros;

	 if n <= 0 Then
	    fap := fap * (1 + dblJuros);

	 pmt := dblTotal / fap;

      End;
   End
   else
      pmt := dblTotal / txtParcelas.Value;

    { -- Fim do Cálculo Financeiro -- }

    MyDay := datApartir.Date;
    n := 0;
    i := 0;
    a := 0;

    Bruto := Bruto / txtParcelas.Value;

    while n <= txtParcelas.Value - 1 do  { Loop para as parcelas }
    begin
      case DayOfWeek( MyDay ) of   { Sábado ou Domingo }
	1 : MyDay := MyDay + 1;
	7 : MyDay := MyDay + 2;
      end;
//      ArrayCalculados[n] := RoundFloat( ( dblTotal / txtParcelas.Value ), 2 );
      ArrayCalculados[n] := RoundFloat( ( pmt ), 2 );
      ArrayDatas[n] := MyDay;

      if DM.variavel_parametro('mensalidades_parcela_negociada') <> '' then
      Begin
         try
            i := n + StrToInt(DM.variavel_parametro('mensalidades_parcela_negociada')) + a;
         except
            i := n + 20 + a;
         end;
      end
      else
      Begin
         i := n + 20 + a;
      End;

      flgAux := False;
      while not flgAux do
      begin
         DM.tblMensalidades.Close;
         DM.tblMensalidades.SQL.Clear;
         DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
         DM.tblMensalidades.SQL.Add( '(CodigoAluno = :Codigo) and ' );
         DM.tblMensalidades.SQL.Add( '(Parcela = :Parcela) and ' );
         DM.tblMensalidades.SQL.Add( '(DataVencimento = :Data) and ' );
         DM.tblMensalidades.SQL.Add( '(Turma = :Turma)' );
         DM.tblMensalidades.ParamByName('Codigo').AsInteger := frmMensalidades.tblMensalidadesCodigoAluno.AsInteger;
         DM.tblMensalidades.ParamByName('Parcela').AsInteger := i;
         DM.tblMensalidades.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',MyDay);
	 DM.tblMensalidades.ParamByName('Turma').AsString := ArrayTurmas[cbTurma.ItemIndex];
         DM.tblMensalidades.Prepare;
         DM.tblMensalidades.Open;

         if DM.tblMensalidades.RecordCount > 0 then  { Se existe essa mensalidade }
         begin
            i := i + 1;
            a := a + 1;
         end
          else flgAux := True;
       end;

      ArrayParcelasNovas[n] := i;
      i := 0;

      lst2.Items.Add( Format( 'PARCELA %.2d', [ArrayParcelasNovas[n]] ) +  ' - ' +
         FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] ) + ' - ' +
         Format( '%8.2n', [ArrayCalculados[n]] ) );
      Inc( n );
      Inc( wMonth );
      if wMonth = 13 then
      begin
        wMonth := 1;
        Inc( wYear );
      end;
      if ( wMonth = 2 ) and ( wDay >= 30 ) then wDay := 28;
      try
        MyDay := EncodeDate( wYear, wMonth, wDay );
      except
        MyDay := EncodeDate( wYear, wMonth, wDay - 1 );
      end;
    end;
  Screen.Cursor := crDefault;
end;


procedure TfrmNegociar.btn1xClick(Sender: TObject);
begin
  txtParcelas.Value := 1;
  datApartir.Date := DataHoje + 30;
  btnCalcularClick( nil );
end;

procedure TfrmNegociar.btn2xClick(Sender: TObject);
begin
  txtParcelas.Value := TButton( Sender ).Tag;
  btnCalcularClick( nil );
end;

procedure TfrmNegociar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5 : btnCalcularClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;


procedure TfrmNegociar.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmNegociar.btnConfirmarClick(Sender: TObject);
var
  strUsuario : String;
  strMotivo : String;
  strParcelas : String;
  n, x : Integer;
  Juros, ValorTotal : Single;
  subtrair: integer;

  movimento : TMovimento;
begin

  { verificar se é possível negociar com datas retroativas }

  if DM.variavel_parametro('financeiro_negociar_data_anterior') = 'N' then
  Begin
     if datApartir.Date < DataHoje then
     begin
        Mensagem( 'Não é possível negociar com data menor que data atual.',
                 Application.Title, MB_OK + MB_ICONSTOP );
       Exit;
     end;
  end;

  strParcelas := '';

  try
  DM.db.StartTransaction;

  { strParcelas terá uma string com o número de todas as parcelas
    '20, 21, 22, 23....'
  }
  for x := 0 to lst2.Items.Count - 1 do
    strParcelas := strParcelas + IntToStr( ArrayParcelasNovas[x] ) + ', ';

  Delete( strParcelas, Length( strParcelas ) - 1, 2 );

  strUsuario := DM.tblUsuariosNomeNome.AsString;

  if Mensagem( 'Deseja confirmar o(s) cálculo(s) ?', Application.Title,
               MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
    if PasswordDlg.Autorizar( 2017, taIncluir, False ) then
    begin
      Application.CreateForm( TfrmMotivos, frmMotivos );
      for n := 0 to lst.Items.Count - 1 do  { Marcar cada parcela como negociada }
      begin
        if lst.Checked[n] then  { se a parcela estiver marcada para negociação }
        begin
          with frmMensalidades do
          begin
            { Verificar se já existe motivo para essa parcela }
            if DM.FindMotivo( frmMensalidades.tblMensalidadesCodigoAluno.AsInteger,
                              ArrayParcelas[n], ArrayDatasInicial[n], ArrayTodasTurmas[n] ) then
              DM.tblMotivos.Edit
            else
              DM.tblMotivos.Insert;
            DM.tblMotivosMotivo.AsString := 'TRANSFERIDO PARA PARCELA ' + strParcelas;
            DM.tblMotivosCodigoAluno.AsInteger := frmMensalidades.tblMensalidadesCodigoAluno.AsInteger;
            DM.tblMotivosParcela.AsInteger := ArrayParcelas[n];
            Dm.tblMotivosParcela.AsString := ArrayTodasTurmas[n];
            DM.tblMotivosDataMotivo.AsString := DateToStr(ArrayDatasInicial[n]) ;
            DM.tblMotivosAutorizadoPor.AsInteger := DM.tblUsuariosNomeCodigo.AsInteger;
            DM.tblMotivos.Post;
            DM.tblMotivos.Close;
          end;

          DM.tblMensalidades.Close;
          DM.tblMensalidades.SQL.Clear;
          DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
          DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade) ' );
          DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger := ArrayCodParcelas[n];
          DM.tblMensalidades.Prepare;
          DM.tblMensalidades.Open;

          DM.tblMensalidades.Edit;
          DM.tblMensalidadesDataPagamento.AsString := DateToStr(DataHoje);

          DM.tblMensalidadesValorPago.Value := 0;

          Juros := Dm.tblMensalidadesValorJurosCalc.Value;
          ValorTotal := Dm.tblMensalidadesValorTotalCalc.Value;

          Dm.tblMensalidadesValorJuros.Value := Juros;
          Dm.tblMensalidadesValorTotal.Value := ValorTotal;

          DM.tblMensalidadesSituacao.Value := 3; { NEGOCIADA }
          DM.tblMensalidades.Post;

          // Criar movimento de Saida, como Negociada
          // Acão padrao = 12

          Movimento := TMovimento.create();
          Movimento.TipoDeAcao := BaixarporCancelamento;
          Movimento.CodigoTitulo := DM.tblMensalidadescd_mensalidade_origem.AsInteger;
          Movimento.Coligada := DM.tblMensalidadescd_coligada.AsInteger;
          Movimento.CodigoMovimento := DM.tblMensalidadescd_mensalidade.AsInteger; // Aqui é que tem q alterar na planilha de mensalidades
          Movimento.CodAcao :=  DM.BuscarCodigoAcaoPadrao(12);
          Movimento.Observacao := 'TRANSFERIDO PARA PARCELA ' + strParcelas;
          Movimento.ValorMovimento := DM.tblMensalidadesValorBruto.AsCurrency + DM.tblMensalidadesValorExtra.AsCurrency  - DM.tblMensalidadesDescontoExtra.AsCurrency;

          Movimento.RegistrarMovimentacaoCR(0);

          FreeAndNil(movimento);
          
          DM.FazAcaoRemessa(arAltMensalidade, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);

        end;
      end;


      intIndice := 0;
      while intIndice <= lst2.Items.Count - 1 do
      begin
        TransferirMensalidades;
        Inc( intIndice );
      end;

      if ( txtVlrEntrada.Text <> '' ) then
        TransferirEntrada;

    end;

    if not DM.FindUser(strUsuario) then Abort;
    Mensagem( 'Parcelas negociadas com sucesso.', Application.Title,
               MB_OK + MB_ICONINFORMATION );

  end;

  DM.db.Commit;
  except
    DM.db.Rollback;
    Mensagem( 'Ocorreu um erro inesperado durante a negociação.' + #13 +
              'Contate o Administrador do Sistema.', Application.Title,
              MB_OK + MB_ICONSTOP );
    Screen.Cursor := crDefault;
    Exit;
  end;

  Close;


end;

procedure TfrmNegociar.TransferirMensalidades;
var
  wYear, wMonth, wDay : Word;
  n, intParcela : Integer;

begin
  { Verificar para qual turma a coisa vai ser negociada }


  Screen.Cursor := crHourGlass;
  DecodeDate( ArrayDatas[intIndice], wYear, wMonth, wDay );

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := ArrayAnoSemestre[cbTurma.ItemIndex];
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := ArrayTurmas[cbTurma.ItemIndex];
  DM.tblDeptoCursoTurma.Prepare;
  DM.tblDeptoCursoTurma.Open;

  DM.GerarMensalidade(
    frmMensalidades.tblMensalidadesCodigoAluno.AsInteger,
    ArrayParcelasNovas[intIndice],
    ArrayTurmas[cbTurma.ItemIndex],
    Bruto, ArrayCalculados[intIndice] - Bruto, //ArrayCalculados[intIndice], 0 ,
    ArrayAnoSemestre[cbTurma.ItemIndex],
    ArrayDatas[intIndice], 1,
    DM.tblDeptoCursoTurmaCurso.AsString,
    DM.tblDeptoCursoTurmaDepto.AsInteger, 4, -1 ); // 4  = Novas parcelas Negociadas

  Screen.Cursor := crDefault;
end;

procedure TfrmNegociar.TransferirEntrada;
var
  wYear, wMonth, wDay : Word;
  n, intParcela : Integer;

begin
  { Verificar para qual turma a coisa vai ser negociada }


  Screen.Cursor := crHourGlass;
  DecodeDate( DataHoje, wYear, wMonth, wDay );

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := ArrayAnoSemestre[cbTurma.ItemIndex];
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := ArrayTurmas[cbTurma.ItemIndex];
  DM.tblDeptoCursoTurma.Prepare;
  DM.tblDeptoCursoTurma.Open;

  DM.GerarMensalidade(
    frmMensalidades.tblMensalidadesCodigoAluno.AsInteger,
    (ArrayParcelasNovas[intIndice-1]+1),
    ArrayTurmas[cbTurma.ItemIndex],
    entrada, 0, //ArrayCalculados[intIndice], 0 ,
    ArrayAnoSemestre[cbTurma.ItemIndex],
    DataHoje, 2,
    DM.tblDeptoCursoTurmaCurso.AsString,
    DM.tblDeptoCursoTurmaDepto.AsInteger, 4, -1 ); // 4  = Novas parcelas Negociadas

    Screen.Cursor := crDefault;
end;

procedure TfrmNegociar.lstClick(Sender: TObject);
begin
  lst2.Items.Clear;
  btnCalcularClick( nil );
end;

procedure TfrmNegociar.tblMensalidadesBeforePost(DataSet: TDataSet);
var
  wAno, wMes, wDia : Word;
begin

  DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );
  tblMensalidadesDataBaseCorrecao.AsDateTime := EncodeDate( wAno, wMes, 1 );

end;

procedure TfrmNegociar.FormHide(Sender: TObject);
begin
  DM.InicializaTabelaMatriculas;
end;

procedure TfrmNegociar.txtJurosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TfrmNegociar.MarcarTodas(ck: TCheckListBox; situ: boolean);
var
  i : integer;
begin

  for i := 0 to (ck.Items.Count-1) do
    ck.Checked[i] := situ;

end;

procedure TfrmNegociar.SpeedButton6Click(Sender: TObject);
begin
    MarcarTodas(lst,true);
end;

procedure TfrmNegociar.SpeedButton7Click(Sender: TObject);
begin
  MarcarTodas(lst,false);
end;

procedure TfrmNegociar.SpeedButton4Click(Sender: TObject);
begin
    MarcarTodas(lst2,true);
end;

procedure TfrmNegociar.SpeedButton5Click(Sender: TObject);
begin
    MarcarTodas(lst2,false);
end;

end.

