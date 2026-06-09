unit uConfirmarMatricula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, checklst, Mask, Grids, DBGrids, Db, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ExtCtrls, ucrpe32, Menus;

type
  TfrmConfirmarMatricula = class(TForm)
    PageControl1: TPageControl;
    tsPlano: TTabSheet;
    tsVencimentos: TTabSheet;
    btnFechar: TButton;
    tblPlanos: TUMZQuery;
    tblPlanosCodigo: TIntegerField;
    tblPlanosTurma: TStringField;
    tblPlanosParcelas: TSmallintField;
    tblPlanosValorCobrado: TFloatField;
    tblPlanosValorContrato: TFloatField;
    tblPlanosTaxaMaterial: TFloatField;
    tblPlanosTaxaApostila: TFloatField;
    tblPlanosDesconto: TFloatField;
    tblPlanosMatricula: TFloatField;
    tblPlanosApartir: TDateTimeField;
    tblPlanosNumeroTaxasMaterial: TSmallintField;
    tblPlanosAnoSemestre: TSmallintField;
    tblPlanosDescricao: TStringField;
    dtcPlanos: TDataSource;
    tblItensPagamento: TUMZQuery;
    tblItensPagamentoCodigoPlano: TIntegerField;
    tblItensPagamentoMes: TSmallintField;
    tblItensPagamentoParcela: TSmallintField;
    tblItensPagamentoValorBruto: TFloatField;
    tblItensPagamentoValorDesconto: TFloatField;
    tblItensPagamentoValorExtra: TFloatField;
    tblItensPagamentoDescontoExtra: TFloatField;
    tblItensPagamentoValorTotal: TFloatField;
    tsImprimir: TTabSheet;
    Panel5: TPanel;
    btnRecibo: TButton;
    btnRequerimento: TButton;
    btnBloqueto: TButton;
    btnContrato: TButton;
    chkList: TCheckListBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    btnPlanosDesconto: TButton;
    radUtil: TRadioButton;
    txtDiaUtil: TEdit;
    radSempre: TRadioButton;
    txtSempreDia: TEdit;
    txtApartir: TMaskEdit;
    btnExecutarPlano: TButton;
    lst: TCheckListBox;
    Panel2: TPanel;
    grd2: TDBGrid;
    btnImprimir: TButton;
    pmQtd: TPopupMenu;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure InicializaArrays;
    procedure CalcularVencimento;
    procedure txtDiaUtilEnter(Sender: TObject);
    procedure txtDiaUtilExit(Sender: TObject);
    procedure txtDiaUtilKeyPress(Sender: TObject; var Key: Char);
    procedure txtSempreDiaExit(Sender: TObject);
    procedure txtSempreDiaEnter(Sender: TObject);
    procedure txtApartirExit(Sender: TObject);
    procedure txtApartirKeyPress(Sender: TObject; var Key: Char);
    procedure lstClickCheck(Sender: TObject);
    procedure lstMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnReciboClick(Sender: TObject);
    function AtualizarControle( dblValor : Single ) : Boolean;
    procedure AtualizarCaixa( Tipo : Byte; i : Integer );
    procedure btnRequerimentoClick(Sender: TObject);
    procedure btnBloquetoClick(Sender: TObject);
    procedure btnContratoClick(Sender: TObject);
    procedure btnExecutarPlanoClick(Sender: TObject);
    procedure GerarMensalidades;
    procedure grd2DblClick(Sender: TObject);
    procedure grd2KeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPlanosDescontoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
    ArrayValores : Array[0..20] of Single;
    ArrayDescontos : Array[0..20] of Single;
    ArrayDescontosExtra : Array[0..20] of Single;
    ArrayDatas : Array[0..20] of TDateTime;
    ArrayParcelas : Array[0..20] of Integer;
    ArrayValorExtra : Array[0..20] of Single;
    lngPlano : Longint; { VARIAVEL PARA DESIGNAR PLANO DE DESCONTO }
    { Public declarations }
  end;

var
  frmConfirmarMatricula: TfrmConfirmarMatricula;

implementation

uses uMatriculas, Main, uRepRecibo, uDinCh, uDM, uRepBloquetos,
  uPlanosDesconto, uManutMens;

{$R *.DFM}




procedure TfrmConfirmarMatricula.btnFecharClick(Sender: TObject);
begin
  if PageControl1.ActivePage = TTabSheet(tsImprimir) then
  begin
    ModalResult := mrOk;
    Close;
  end
  else
  begin
    if Mensagem( 'Deseja cancelar a confirmação da matrícula?', Application.Title,
                 MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    begin
      ModalResult := mrCancel;
      Close;
    end;
  end;
end;


procedure TfrmConfirmarMatricula.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  tblPlanos.Close;
  tblPlanos.ParamByName('Turma').AsString :=
    frmMatriculas.tblMatriculasTurma.AsString;
  tblPlanos.ParamByName('AnoSemestre').AsInteger :=
    frmMatriculas.tblMatriculasAnoSemestre.AsInteger;
  tblPlanos.Prepare;
  tblPlanos.DisableControls;
  tblPlanos.Open;
  tblPlanos.Locate( 'Codigo',
    frmMatriculas.tblMatriculasPlanoPagamento.AsInteger, [loCaseInsensitive] );
  tblPlanos.EnableControls;
  PageControl1.ActivePage := TTabSheet(tsPlano);

  ModalResult := mrCancel;
end;

procedure TfrmConfirmarMatricula.PageControl1Change(Sender: TObject);
var
  wYear, wMonth, wDay : Word;
begin
  if PageControl1.ActivePage = TTabSheet(PageControl1.Pages[1]) then
  begin
    InicializaArrays;
    lst.Clear;
    chkList.Clear;
//    if DataHoje <= tblPlanosApartir.AsDateTime then //29/03/2000 - MILTON
//    DISSE QUE MATRICULA TEM QUE SEGUIR DATA FIXADA NO PLANO DE PAGAMENTO
      txtApartir.Text := FormatDateTime( 'dd/mm/yyyy', tblPlanosApartir.AsDateTime );
//    else
//      txtApartir.Text := FormatDateTime( 'dd/mm/yyyy', DataHoje );
    txtDiaUtil.SetFocus;
    CalcularVencimento;
//    if DataHoje <= tblPlanosApartir.AsDateTime then
      DecodeDate( tblPlanosApartir.AsDateTime, wYear, wMonth, wDay );
//    else
//      DecodeDate( DataHoje, wYear, wMonth, wDay );
  end;

  if PageControl1.ActivePage = TTabSheet(tsImprimir) then
  begin
    chkList.Items := lst.Items;
  end;

end;

procedure TfrmConfirmarMatricula.InicializaArrays;
var
  n : Integer;
  datZero : TDateTime;
begin
  datZero := 0;
  for n := Low( ArrayValores ) to High( ArrayValores ) do ArrayValores[n] := 0;
  for n := Low( ArrayValorExtra ) to High( ArrayValorExtra ) do
    ArrayValorExtra[n] := 0;
  for n := Low( ArrayDescontos ) to High( ArrayDescontos ) do ArrayDescontos[n] := 0;
  for n := Low( ArrayDescontosExtra ) to High( ArrayDescontosExtra ) do
    ArrayDescontosExtra[n] := 0;
  for n := Low( ArrayParcelas ) to High( ArrayParcelas ) do ArrayParcelas[n] := 0;
  for n := Low( ArrayDatas ) to High( ArrayDatas ) do ArrayDatas[n] := datZero;
end;

procedure TfrmConfirmarMatricula.CalcularVencimento;
var
  n, i : Byte;
  wDay, wMonth, wYear : Word;
  MyDay : TDateTime;
  strAux : String;
begin

  tblItensPagamento.Close;
  tblItensPagamento.Open;
  tblItensPagamento.First;

  lngPlano := 0;
  lst.Clear;

  i := 0;
  if ( (tblPlanosTaxaApostila.Value = 0) and (tblPlanosTaxaMaterial.Value <> 0) ) or
     ( (tblPlanosTaxaMaterial.Value <> 0) and (tblPlanosMatricula.Value <> 0) ) then
  begin

    if ArrayValores[i] = 0 then
    begin
      if tblPlanosMatricula.Value = 0 then
        ArrayValores[i] := tblPlanosTaxaMaterial.Value
      else
        ArrayValores[i] := tblPlanosMatricula.Value;
    end;

    lst.Items.Add( 'PARCELA 00' + ' - ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) +
        ' - ' + Format( '%8.2n', [ArrayValores[i]] ) );

    ArrayDatas[i] := DataHoje;
    ArrayParcelas[i] := 0;

    if ArrayValores[i] = 0 then
    begin
      if tblPlanosMatricula.Value = 0 then
        ArrayValores[i] := tblPlanosTaxaMaterial.Value
      else
        ArrayValores[i] := tblPlanosMatricula.Value;
    end;

    ArrayDescontos[i] := 0;
    ArrayDescontosExtra[i] := 0;
    ArrayValorExtra[i] := 0;
    i := 1;
  end;

  DecodeDate( StrToDate( txtApartir.Text ), wYear, wMonth, wDay );

  if radUtil.Checked then
  begin

    while not tblItensPagamento.Eof do
    begin

      MyDay := DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) );

      ArrayValores[i] := tblItensPagamentoValorBruto.Value;
      ArrayDescontos[i] := tblItensPagamentoValorDesconto.Value;
      ArrayDescontosExtra[i] := tblItensPagamentoDescontoExtra.Value;
      ArrayValorExtra[i] := tblItensPagamentoValorExtra.Value;

      if MyDay <= DataHoje then
        ArrayDatas[i] := DataHoje
      else
        ArrayDatas[i] := MyDay;

      ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;

      lst.Items.Add(
        Format( 'PARCELA %.2d', [tblItensPagamentoParcela.AsInteger] ) + ' - ' +
        FormatDateTime( 'dd/mm/yyyy', ArrayDatas[i] ) + ' - ' +
        Format( '%8.2n', [ArrayValores[i] - ArrayDescontos[i] +
                          ArrayValorExtra[i] - ArrayDescontosExtra[i] ]) );

      tblItensPagamento.Next;
      MyDay := MyDay + 30;
      Inc( i );
      DecodeDate( MyDay, wYear, wMonth, wDay );
      MyDay := DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) );
    end;
  end;

  strAux := txtApartir.Text;
  if radSempre.Checked then
  begin

    wDay := StrToInt( txtSempreDia.Text );

    n := 1;
    DecodeDate( StrToDate( txtSempreDia.Text + Copy( strAux, 3, 8 ) ),
      wYear, wMonth, wDay );
      
    while not tblItensPagamento.Eof do
    begin

      MyDay := EncodeDate( wYear, wMonth, wDay );

      case DayOfWeek( MyDay ) of
        1 : MyDay := MyDay + 1;
        7 : MyDay := MyDay + 2;
      end;

      ArrayValores[i] := tblItensPagamentoValorBruto.Value;
      ArrayDescontos[i] := tblItensPagamentoValorDesconto.Value;
      ArrayDescontosExtra[i] := tblItensPagamentoDescontoExtra.Value;
      ArrayValorExtra[i] := tblItensPagamentoValorExtra.Value;

      if MyDay <= DataHoje then
        ArrayDatas[i] := DataHoje
      else
        ArrayDatas[i] := MyDay;

      ArrayParcelas[i] := tblItensPagamentoParcela.AsInteger;

      lst.Items.Add(
        Format( 'PARCELA %.2d', [tblItensPagamentoParcela.AsInteger] ) + ' - ' +
        FormatDateTime( 'dd/mm/yyyy', ArrayDatas[i] ) + ' - ' +
        Format( '%8.2n', [ArrayValores[i] - ArrayDescontos[i] +
                          ArrayValorExtra[i] - ArrayDescontosExtra[i] ]) );

      tblItensPagamento.Next;

      wMonth := wMonth + 1;
      if wMonth = 13 then
      begin
        wMonth := 1;
        wYear := wYear + 1;
      end;
      MyDay := EncodeDate( wYear, wMonth, wDay );
      Inc( i );
    end;
  end;
end;




procedure TfrmConfirmarMatricula.txtDiaUtilEnter(Sender: TObject);
begin
  radUtil.Checked := True;
end;

procedure TfrmConfirmarMatricula.txtDiaUtilExit(Sender: TObject);
begin
  CalcularVencimento;
end;

procedure TfrmConfirmarMatricula.txtDiaUtilKeyPress(Sender: TObject;
  var Key: Char);
var
  wYear, wMonth, wDay : Word;
begin
  if Key = #13 then
  begin
    DecodeDate( StrToDate( txtApartir.Text ), wYear, wMonth, wDay );
    txtApartir.Text := FormatDateTime( 'dd/mm/yyyy',
      DiaUtil( wYear, wMonth, StrToInt( txtDiaUtil.Text ) ) );
    txtApartir.SetFocus;
    txtAPartirKeyPress( txtApartir, Key );
    Key := #0;
  end;
end;

procedure TfrmConfirmarMatricula.txtSempreDiaExit(Sender: TObject);
begin
  CalcularVencimento;
end;

procedure TfrmConfirmarMatricula.txtSempreDiaEnter(Sender: TObject);
begin
  radSempre.Checked := True;
end;

procedure TfrmConfirmarMatricula.txtApartirExit(Sender: TObject);
begin
  CalcularVencimento;
end;

procedure TfrmConfirmarMatricula.txtApartirKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    CalcularVencimento;
    Key := #0;
  end;
end;


procedure TfrmConfirmarMatricula.lstClickCheck(Sender: TObject);
begin
  if chkList.Checked[chkList.ItemIndex] then
    chkList.Checked[chkList.ItemIndex] := False
  else
    chkList.Checked[chkList.ItemIndex] := True;

end;

procedure TfrmConfirmarMatricula.lstMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if chkList.Checked[chkList.ItemIndex] then
    chkList.Checked[chkList.ItemIndex] := True
  else
    chkList.Checked[chkList.ItemIndex] := False;
end;

procedure TfrmConfirmarMatricula.btnReciboClick(Sender: TObject);
begin
  if chkList.ItemIndex = -1 then
  begin
    Mensagem( 'Selecione uma parcela para que seja impresso o recibo.', Application.Title,
      MB_OK + MB_ICONSTOP );
    Exit;
  end;

  PrincipalForm.pnlMsg.Caption := '';
  PrincipalForm.pnlMsg.Caption := ' Imprimindo Recibo...';

  Screen.Cursor := crHourGlass;

  if not PrincipalForm.ProcuraForm( TForm(frmRepRecibo) ) then
    Application.CreateForm( TfrmRepRecibo, frmrepRecibo );

  with frmRepRecibo do
  begin
    if not chkList.Checked[chkList.ItemIndex] then
    begin

      frmManutencaoMens.lngCodigoAluno := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
      frmManutencaoMens.intParcela := ArrayParcelas[chkList.ItemIndex];
      frmManutencaoMens.datVencimento := ArrayDatas[chkList.ItemIndex];
      frmManutencaoMens.strTurma := frmMatriculas.tblMatriculasTurma.AsString;
      frmManutencaoMens.strAluno := frmMatriculas.tblMatriculasNome.AsString;

      if frmManutencaoMens.ShowModal = mrCancel then
      begin
        Mensagem( 'Operação cancelada.', Application.Title, MB_OK + MB_ICONSTOP );
        if DM.tblMensalidades.State in [dsInsert, dsEdit] then tblMensalidades.Cancel;
        Screen.Cursor := crDefault;
        Exit;
      end;

    end;

    if not chkList.Checked[chkList.ItemIndex] then
      chkList.Checked[chkList.ItemIndex] := True;

    tblMensalidades.Close;
    tblMensalidades.ParamByName('Codigo').AsInteger := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
    tblMensalidades.ParamByName('Parcela').AsInteger := ArrayParcelas[chkList.ItemIndex];
    tblMensalidades.ParamByName('Data').AsString := DateToStr(ArrayDatas[chkList.ItemIndex]);
    tblMensalidades.ParamByName('Turma').AsString := frmMatriculas.tblMatriculasTurma.AsString;
    tblMensalidades.Prepare;
    tblMensalidades.Open;
{//    Report.Print; }//
  end;
  PrincipalForm.pnlMsg.Caption := '';
  Screen.Cursor := crDefault;
end;

function TfrmConfirmarMatricula.AtualizarControle( dblValor : Single ) : Boolean;
begin
  frmDinCh.dblValor := dblValor;
  if frmDinCh.ShowModal = mrCancel then
  begin
    Result := False;
    Exit;
  end;

  DM.tblControle.Close;
  DM.tblControle.ParamByName('Situacao').AsString := 'A';
  DM.tblControle.Prepare;
  DM.tblControle.Open;

  DM.tblControle.Edit;
  DM.tblControleRecebido.Value := DM.tblControleRecebido.Value + dblValor;
  DM.tblControleDinheiro.Value := DM.tblControleDinheiro.Value + frmDinCh.dblDin;
  DM.tblControleCheque.Value := DM.tblControleCheque.Value + frmDinCh.dblCh;
  DM.tblControleMensalidade.Value := DM.tblControleMensalidade.Value + dblValor;
  DM.tblControle.Post;
  Result := True;
end;

procedure TfrmConfirmarMatricula.AtualizarCaixa( Tipo : Byte; i : Integer );
begin
  DM.tblCaixa.Append;
  case Tipo of

    0 :
    begin
      DM.tblCaixaDescricao.AsString := 'TAXA DE MATERIAL ' +
          frmMatriculas.tblMatriculasCodigoAluno.DisplayText;

      DM.tblMensalidades.Close;
      DM.tblMensalidades.SQL.Clear;
      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( 'CodigoAluno = :CodigoAluno and' );
      DM.tblMensalidades.SQL.Add( 'Parcela = :Parcela and' );
      DM.tblMensalidades.SQL.Add( 'DataVencimento = :DataVencimento and' );
      DM.tblMensalidades.SQL.Add( 'Turma = :Turma' );

      DM.tblMensalidades.ParamByName('CodigoAluno').AsInteger :=
        frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
      DM.tblMensalidades.ParamByName('Parcela').Asinteger := ArrayParcelas[i];
      DM.tblMensalidades.ParamByName('DataVencimento').asString := DateToStr(ArrayDatas[i]);
      DM.tblMensalidades.ParamByName('Turma').AsString :=
        frmMatriculas.tblMatriculasTurma.AsString;

      DM.tblMensalidades.Prepare;
      DM.tblMensalidades.Open;

      DM.tblMensalidades.Edit;
      DM.tblMensalidadesValorPago.Value := DM.tblMensalidadesValorTotal.Value;
      DM.tblMensalidadesSituacao.Value := 0;
      DM.tblMensalidadesDataPagamento.Value := DataHoje;
      DM.tblMensalidades.Post;
    end;

    1 :
    begin
      DM.tblCaixaDescricao.AsString := 'BAIXA MENSALIDADE ' +
        frmMatriculas.tblMatriculasCodigoAluno.DisplayText + '-' +
          IntToStr(ArrayParcelas[i]);

      DM.tblMensalidades.Close;
      DM.tblMensalidades.SQL.Clear;
      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( 'CodigoAluno = :CodigoAluno and ' );
      DM.tblMensalidades.ParamByName('CodigoAluno').AsInteger :=
        frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
      DM.tblMensalidades.SQL.Add( 'Parcela = :Parcela and ' );
      DM.tblMensalidades.ParamByName('Parcela').AsInteger := ArrayParcelas[i];
      DM.tblMensalidades.SQL.Add( 'DataVencimento = :DataVencimento and ' );
      DM.tblMensalidades.ParamByName('DataVencimento').AsString := DateToStr(ArrayDatas[i]);
      DM.tblMensalidades.SQL.Add( 'Turma = :Turma ' );
      DM.tblMensalidades.ParamByName('Turma').AsString :=
        frmMatriculas.tblMatriculasTurma.AsString;
      DM.tblMensalidades.Open;

      DM.tblMensalidades.Edit;
      DM.tblMensalidadesValorPago.Value := DM.tblMensalidadesValorTotal.Value;
      DM.tblMensalidadesDataPagamento.Value := DataHoje;
      DM.tblMensalidadesSituacao.Value := 0;
      DM.tblMensalidades.Post;
    end;

  end;
  DM.tblCaixaValorDinheiro.Value := RoundFloat( frmDinCh.dblDin, 2 );
  DM.tblCaixaValorCheque.Value := RoundFloat( frmDinCh.dblCh, 2 );
  DM.tblCaixaCodigoAluno.AsInteger := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
  DM.tblCaixaParcela.AsInteger := ArrayParcelas[i];
  DM.tblCaixaDataLcto.AsDateTime := Now;
  DM.tblCaixaDataVencimento.AsString := DateToStr(ArrayDatas[i]);
  DM.tblCaixaTurma.AsString := frmMatriculas.tblMatriculasTurma.AsString;
  DM.tblCaixaDebitoCredito.AsString := 'C';
  if ( frmDinCh.dblDin > 0 ) and ( frmDinCh.dblCh > 0 ) then
    DM.tblCaixaDinheiroCheque.AsString := 'A';
  if ( frmDinCh.dblDin > 0 ) and ( frmDinCh.dblCh = 0 ) then
    DM.tblCaixaDinheiroCheque.AsString := 'D';
  if ( frmDinCh.dblDin = 0 ) and ( frmDinCh.dblCh > 0 ) then
    DM.tblCaixaDinheiroCheque.AsString := 'C';
  DM.tblCaixa.Post;
end;



procedure TfrmConfirmarMatricula.btnRequerimentoClick(Sender: TObject);
begin
  PrincipalForm.pnlMsg.Caption := '';
  PrincipalForm.pnlMsg.Caption := ' Imprimindo Requerimento...';

  Screen.Cursor := crHourGlass;

  PrincipalForm.Report.ReportName := strReports + '\' + 'repRequerimentoMatricula.rpt';

  PrincipalForm.Report.Connect.Password := SenhaBD;
  PrincipalForm.Report.Selection.Formula.Clear;
  PrincipalForm.Report.PrintOptions.Copies := 1;

  PrincipalForm.Report.Selection.Formula.Add( '{Matriculas.AnoSemestre} = ' +
    frmMatriculas.tblMatriculasAnoSemestre.AsString + ' and ' );
  PrincipalForm.Report.Selection.Formula.Add( '{Matriculas.Turma} = "' +
    frmMatriculas.tblMatriculasTurma.AsString + '" and' );
  PrincipalForm.Report.Selection.Formula.Add( '{Matriculas.CodigoAluno} = ' +
    frmMatriculas.tblMatriculasCodigoAluno.AsString );

  PrincipalForm.Report.Output := toPrinter;

  PrincipalForm.Report.execute;

  Screen.Cursor := crDefault;
  PrincipalForm.pnlMsg.Caption := '';
end;

procedure TfrmConfirmarMatricula.btnBloquetoClick(Sender: TObject);
begin
  if chkList.ItemIndex = -1 then
  begin
    Mensagem( 'Selecione uma parcela para que seja impresso o bloqueto.', Application.Title,
      MB_OK + MB_ICONSTOP );
    Exit;
  end;

  if ( chkList.ItemIndex = 0 ) and ( ArrayParcelas[0] = 0 ) then
  begin
    Mensagem( 'Não é possível imprimir bloqueto da Taxa de Material', Application.Title,
              MB_OK + MB_ICONSTOP );
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  PrincipalForm.pnlMsg.Caption := '';
  PrincipalForm.pnlMsg.Caption := ' Imprimindo Bloqueto...';

  with frmRepBloquetos do
  begin
    tblBloquetos.Close;
    tblBloquetos.ParamByName('Codigo').AsInteger :=
      frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
    tblBloquetos.ParamByName('Parcela').AsInteger :=
      ArrayParcelas[chkList.ItemIndex];
    tblBloquetos.ParamByName('Data').AsString := DateToStr(ArrayDatas[chkList.ItemIndex]);
    tblBloquetos.ParamByName('Turma').AsString :=
      frmMatriculas.tblMatriculasTurma.AsString;
    tblBloquetos.Prepare;
    tblBloquetos.Open;

    if Dm.IsTrue(tblBloquetosBloqueto.AsString) then
    begin
      if Mensagem( 'Bloqueto já impresso. Deseja reimprimí-lo ?', Application.Title,
                MB_YESNO + MB_ICONQUESTION ) = ID_NO then
      begin
        Screen.Cursor := crDefault;
        Exit;
      end;
    end;

{//    ppReport.Print; }//


  end;
  Screen.Cursor := crDefault;
  PrincipalForm.pnlMsg.Caption := '';

end;

procedure TfrmConfirmarMatricula.btnContratoClick(Sender: TObject);
begin
  PrincipalForm.pnlMsg.Caption := '';
  PrincipalForm.pnlMsg.Caption := ' Imprimindo Contrato...';

  Screen.Cursor := crHourGlass;

  DM.tblCursosTurma.Close;
  DM.tblCursosTurma.SQL.Clear;
  DM.tblCursosTurma.SQL.Add( 'select C.*, T.* from Cursos C INNER JOIN' );
  DM.tblCursosTurma.SQL.Add( 'Turmas T ON (T.Curso = C.Codigo and ' );
  DM.tblCursosTurma.SQL.Add( 'T.AnoSemestre = C.AnoSemestre) where' );
  DM.tblCursosTurma.SQL.Add( '(T.Codigo = :Turma) and (T.AnoSemestre = :AnoSemestre)' );
  DM.tblCursosTurma.ParamByName('Turma').AsString :=
    frmMatriculas.tblMatriculasTurma.AsString;
  DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger :=
    frmMatriculas.tblMatriculasAnoSemestre.AsInteger;
  DM.tblCursosTurma.Prepare;
  DM.tblCursosTurma.Open;

  if DM.tblCursosTurmaCodigo.AsString <> '' then
    PrincipalForm.Report.ReportName := strReports + '\' +
      DM.tblCursosTurmaContrato.AsString
  else
  begin
    Mensagem( 'Este curso não possui contrato formulado.', Application.Title,
              MB_OK + MB_ICONSTOP );
    Exit;
  end;

//  PrincipalForm.Report.DiscardSavedData := True;
  PrincipalForm.Report.Connect.Password := SenhaBD;
  PrincipalForm.Report.Selection.Formula.Clear;
  PrincipalForm.Report.PrintOptions.Copies := 2;

  PrincipalForm.Report.Selection.Formula.Add( '{Matriculas.CodigoAluno} = ' +
    frmMatriculas.tblMatriculasCodigoAluno.AsString + ' and ' );
  PrincipalForm.Report.Selection.Formula.Add( '{Matriculas.AnoSemestre} = ' +
    frmMatriculas.tblMatriculasAnoSemestre.AsString + ' and ' );
  PrincipalForm.Report.Selection.Formula.Add( '{Matriculas.Turma} = "' +
    frmMatriculas.tblMatriculasTurma.AsString + '"' );

  PrincipalForm.Report.Output := toPrinter;
  PrincipalForm.Report.execute;

  Screen.Cursor := crDefault;
  PrincipalForm.pnlMsg.Caption := '';
end;



procedure TfrmConfirmarMatricula.btnExecutarPlanoClick(Sender: TObject);
var
  MyKey : Char;
  n : Byte;
  flg : Boolean;
begin
  MyKey := #13;
  flg := False;
  for n := Low( ArrayDescontosExtra ) to High( ArrayDescontosExtra ) do
  begin
    if RoundFloat( ArrayDescontosExtra[n], 2 ) <> 0 then
    begin
      flg := True;
      Break;
    end;
  end;

  if not flg then
  begin
    if Mensagem( 'Deseja aplicar desconto ?', Application.Title,
      MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON2 ) = ID_YES then
    begin
      btnPlanosDescontoClick( nil );
      Exit;
    end;
  end;

  if Mensagem( 'Deseja registrar a Matrícula ?', Application.Title,
               MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

  try
    DM.db.StartTransaction;

    PrincipalForm.pnlMsg.Caption := ' Excluindo mensalidades reservadas...';

    Dm.qAux1.Close;
    Dm.qAux1.SQL.Clear;
    Dm.qAux1.SQL.Add( 'delete from Mensalidades where Situacao = 10 and Turma = :Turma and' );
    Dm.qAux1.SQL.Add( 'AnoSemestre = :AnoSemestre and' );
    Dm.qAux1.SQL.Add( 'CodigoAluno = :CodigoAluno' );
    Dm.qAux1.ParamByName('Turma').AsString := frmMatriculas.tblMatriculasTurma.AsString;
    Dm.qAux1.ParamByName('CodigoAluno').AsInteger := frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
    Dm.qAux1.ParamByName('AnoSemestre').AsInteger := frmMatriculas.tblMatriculasAnoSemestre.AsInteger;
    Dm.qAux1.ExecSQL;

    Screen.Cursor := crHourGlass;

    PrincipalForm.pnlMsg.Caption := ' Registrando Matrícula...';

    // 1 - Alterar situacao de reservado para cursando ( 10 -> 1 )
    DM.tblMatriculas.Close;
    DM.tblMatriculas.ParamByName('CodigoAluno').AsInteger :=
      frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
    DM.tblMatriculas.ParamByName('AnoSemestre').AsInteger :=
      frmMatriculas.tblMatriculasAnoSemestre.AsInteger;
    DM.tblMatriculas.ParamByName('Turma').AsString :=
      frmMatriculas.tblMatriculasTurma.AsString;
    DM.tblMatriculas.Prepare;
    DM.tblMatriculas.Open;
    DM.tblMatriculas.Edit;
    DM.tblMatriculasSituacao.AsInteger := 1;
    DM.tblMatriculasPlanoPagamento.AsInteger := tblPlanosCodigo.AsInteger;
    DM.tblMatriculas.Post;

    PrincipalForm.pnlMsg.Caption := '';
    PrincipalForm.pnlMsg.Caption := ' Gerando Mensalidades...';

    // 2 - Gerar Financeiro
    GerarMensalidades;

    // 3 - Gerar Documentacao
    DM.GerarDocumentacao( frmMatriculas.tblMatriculasCodigoAluno.AsInteger,
                          frmMatriculas.tblMatriculasAnoSemestre.AsInteger );

    // 4 - Matricular Grade Curricular
    DM.MatricularGrade( frmMatriculas.tblMatriculasCodigoAluno.AsInteger,
                        frmMatriculas.tblMatriculasTurma.AsString,
                        frmMatriculas.tblMatriculasAnoSemestre.AsInteger );

    PrincipalForm.pnlMsg.Caption := '';
    Screen.Cursor := crDefault;
    PageControl1.SelectNextPage( True );
    DM.db.Commit;

    ModalResult := mrOk;
  except
    DM.db.Rollback;
    Mensagem( 'Ocorreu um erro inesperado durante o registro da matrícula.' + #13 +
              'Contate o Administrador do Sistema.', Application.Title, MB_OK + MB_ICONSTOP );
    Screen.Cursor := crDefault;
    ModalResult := mrCancel;
    Exit;
  end;
  end;

end;

procedure TfrmConfirmarMatricula.GerarMensalidades;
var
  n : Byte;
  wDia, wMes, wAno : Word;
  MyDay : TDateTime;
  strAux : String;
begin

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger :=
    frmMatriculas.tblMatriculasAnoSemestre.AsInteger;
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString :=
    frmMatriculas.tblMatriculasTurma.AsString;
  DM.tblDeptoCursoTurma.Prepare;
  DM.tblDeptoCursoTurma.Open;

  for n := 0 to lst.Items.Count - 1 {tblPlanosParcelas.AsInteger} do
  begin

    DM.qryInsert.Close;

    DM.qryInsert.ParamByName('Curso').AsString := DM.tblDeptoCursoTurmaCurso.AsString;
    DM.qryInsert.ParamByName('Depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;

    DM.qryInsert.ParamByName('CodigoAluno').asInteger :=
      frmMatriculas.tblMatriculasCodigoAluno.AsInteger;
    DM.qryInsert.ParamByname('Parcela').AsSmallInt := ArrayParcelas[n];
    DM.qryInsert.ParamByName('Turma').AsString :=
      frmMatriculas.tblMatriculasTurma.AsString;
    DM.qryInsert.ParamByName('DataEmissao').AsString := DateToStr(DataHoje);
    DM.qryInsert.ParamByName('NossoNumero').AsString := DM.NovoNumero(DM.tblDeptoCursoTurmaDepto.AsInteger);
    DM.qryInsert.ParamByName('ValorBruto').AsFloat := RoundFloat( ArrayValores[n], 2 );

    DM.qryInsert.ParamByName('ValorDesconto').AsFloat := ArrayDescontos[n];

    DM.qryInsert.ParamByName('DescontoExtra').AsFloat := ArrayDescontosExtra[n];
    DM.qryInsert.ParamByName('ValorExtra').AsFloat := ArrayValorExtra[n];
    DM.qryInsert.ParamByName('ValorTotal').AsFloat :=
      RoundFloat( ( ArrayValores[n] + ArrayValorExtra[n] -
                    ArrayDescontos[n] - ArrayDescontosExtra[n] ), 2 );
    DM.qryInsert.ParamByName('ValorJuros').AsFloat := 0;
    DM.qryInsert.ParamByName('Situacao').AsSmallInt := 2;
    DM.qryInsert.ParamByName('Usuario').AsString := DM.tblUsuariosNomeNome.AsString;
    DM.qryInsert.ParamByName('AnoLetivo').AsInteger := 0; {NAO E MAIS NECESSARIO}
    DM.qryInsert.ParamByName('Semestre').AsInteger := 0; {NAO E MAIS NECESSARIO}
    DM.qryInsert.ParamByName('Bloqueto').AsString := 'N';
    DM.qryInsert.ParamByName('CodigoCarta').AsInteger := 0;
    DM.qryInsert.ParamByName('AnoSemestre').AsInteger :=
      frmMatriculas.tblMatriculasAnoSemestre.AsInteger;

    DM.qryInsert.ParamByName('IndiceCorrecao').AsFloat := 0;

    DM.qryInsert.ParamByName('DataVencimento').AsString := DateToStr(ArrayDatas[n]);

    DecodeDate( ArrayDatas[n], wAno, wMes, wDia );
    DM.qryInsert.ParamByName('DataBaseCorrecao').AsString := DateToStr(EncodeDate( wAno, wMes, 1 ));

    DM.qryInsert.ExecSQL;
    DM.qryInsert.Close;

  end;
end;


procedure TfrmConfirmarMatricula.grd2DblClick(Sender: TObject);
begin
  PageControl1.SelectNextPage( True );
end;

procedure TfrmConfirmarMatricula.grd2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    PageControl1.SelectNextPage( True );
    Key := #0;
  end;
end;


procedure TfrmConfirmarMatricula.btnImprimirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmConfirmarMatricula.btnPlanosDescontoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPlanosDesconto, frmPlanosDesconto);
  frmPlanosDesconto.intTela := 2;
  frmPlanosDesconto.ShowModal;
end;

procedure TfrmConfirmarMatricula.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmConfirmarMatricula.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblPlanos, pmQtd);

end;

end.

