unit uSelMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, ExtCtrls, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Mask, DBCtrls,
  DBIProcs, Menus, Buttons;

type
  TfrmSelMens = class(TForm)
    tblMensalidades: TZTable;
    Panel1: TPanel;
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
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesAnoLetivo: TSmallintField;
    tblMensalidadesSemestre: TSmallintField;
    tblMensalidadesBloqueto: TBooleanField;
    Label1: TLabel;
    txtCodigo: TEdit;
    tblAlunos: TZTable;
    dtcMensalidades: TDataSource;
    grd: TDBGrid;
    dtcAlunos: TDataSource;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesDescricaoSituacao: TStringField;
    tblAlunosCodigo: TIntegerField;
    tblAlunosNome: TStringField;
    tblMensalidadesNomeAluno: TStringField;
    tblPoupanca: TZTable;
    tblPoupancaData: TDateTimeField;
    tblPoupancaIndicePoupanca: TFloatField;
    tblPoupancaIndiceCorrigido: TFloatField;
    btnFechar: TButton;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesCodigoCarta: TIntegerField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure txtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure txtDinChKeyPress(Sender: TObject; var Key: Char);
    procedure txtDinChKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BaixarMensalidade;
    procedure grdDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblMensalidadesBeforePost(DataSet: TDataSet);
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    indIndice : Array[0..100] of Single;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelMens: TfrmSelMens;

implementation

uses uCaixa, uSelAlunos, uDM, uRepRecibo, uDinCh;

{$R *.DFM}

procedure TfrmSelMens.tblMensalidadesCalcFields(DataSet: TDataSet);
var
  wYear, wMonth, wDay : Word;
begin

  case tblMensalidadesSituacao.AsInteger of
    0 : tblMensalidadesDescricaoSituacao.AsString := 'OK';
    1 : tblMensalidadesDescricaoSituacao.AsString := 'PARC';
    2 :
    begin
      if ( tblMensalidadesDataVencimento.AsDateTime < Date ) and
         ( tblMensalidadesSituacao.Value = 2 ) then
      tblMensalidadesDescricaoSituacao.AsString := 'VENC'
    else
      tblMensalidadesDescricaoSituacao.AsString := 'PEND';
    end;
    3 : tblMensalidadesDescricaoSituacao.AsString := 'TRAN';
    4 : tblMensalidadesDescricaoSituacao.AsString := 'PERD';
    9 : tblMensalidadesDescricaoSituacao.AsString := 'PROT';
  end;

  if ( tblMensalidadesDataVencimento.AsDateTime < Date ) and
     ( tblMensalidadesSituacao.Value = 2 ) then
  begin
    DecodeDate( tblMensalidadesDataVencimento.AsDateTime,
                wYear, wMonth, wDay );
    tblMensalidadesValorTotalCalc.Value := ( tblMensalidadesValorBruto.Value +
      tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value ) *
      indIndice[Meses(tblMensalidadesDataVencimento.AsDateTime,Date)];

  end
  else
  begin
    tblMensalidadesValorTotalCalc.Value := ( ( tblMensalidadesValorBruto.Value -
      tblMensalidadesValorDesconto.Value + tblMensalidadesValorExtra.Value -
      tblMensalidadesDescontoExtra.Value ) );
  end;
end;

procedure TfrmSelMens.txtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if txtCodigo.Text <> '' then
      tblMensalidades.SetRange( [txtCodigo.Text, 2],
                                [txtCodigo.Text, 2] )
    else
    begin
      frmSelAlunos.ShowModal;
      txtCodigo.Text := frmSelAlunos.qryAlunosCodigo.AsString;
      tblMensalidades.SetRange( [frmSelAlunos.qryAlunosCodigo.AsInteger, 2],
                                [frmSelAlunos.qryAlunosCodigo.AsInteger, 2] );
    end;

    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelMens.FormShow(Sender: TObject);
var
  n : Integer;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Screen.Cursor := crHourGlass;
  { ******* ROTINA PARA MELHORAR VELOCIDADE DO CALC DAS MENS ********* }
  tblPoupanca.Open;
  tblPoupanca.Last;
  n := 1;
  indIndice[0] := 1.02; { 2% de MULTA }
  tblPoupanca.Prior;
  while not tblPoupanca.Bof do
  begin
    indIndice[n] := tblPoupancaIndiceCorrigido.Value;
    Inc( n );
    tblPoupanca.Prior;
  end;
  tblPoupanca.Close;
  { ******************************************************************* }

  tblAlunos.Open;
  if not tblMensalidades.Active then tblMensalidades.Open;
  txtCodigo.SetFocus;
  Screen.Cursor := crDefault;
end;

procedure TfrmSelMens.FormHide(Sender: TObject);
begin
  {tblMensalidades.Close;}
  tblAlunos.Close;
end;

procedure TfrmSelMens.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if ( txtCodigo.Text = '' ) then Exit;
    BaixarMensalidade;
    Key := #0;
  end;
end;



procedure TfrmSelMens.txtDinChKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Uppercase( Key ) = 'D' ) or ( UpperCase( Key ) = 'C' ) then
    grd.SetFocus
  else
    Key := #0;
end;

procedure TfrmSelMens.txtDinChKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP : txtCodigo.SetFocus;
  end;
end;

procedure TfrmSelMens.BaixarMensalidade;
var
  lngCodigo : Longint;
  datVencimento : TDateTime;
  intParcela : Integer;
  strTurma : String;
begin

    Screen.Cursor := crHourGlass;


    frmDinCh.dblValor := tblMensalidadesValorTotalCalc.Value;
    if frmDinCh.ShowModal = mrCancel then
    begin
      Exit;
    end;

    frmCaixa.tblCaixa.Append;
    frmCaixa.tblCaixaDescricao.AsString := 'BAIXA MENSALIDADE ' +
      tblMensalidadesCodigoAluno.DisplayText + '-' +
      tblMensalidadesParcela.DisplayText;
    frmCaixa.tblCaixaValorDinheiro.Value := RoundFloat( frmDinCh.dblDin, 2 );
    frmCaixa.tblCaixaValorCheque.Value := RoundFloat( frmDinCh.dblCh, 2 );
    frmCaixa.tblCaixaCodigoAluno.AsInteger := tblMensalidadesCodigoAluno.AsInteger;
    frmCaixa.tblCaixaParcela.AsInteger := tblMensalidadesParcela.AsInteger;
    frmCaixa.tblCaixaDataVencimento.AsDateTime := tblMensalidadesDataVencimento.AsDateTime;
    frmCaixa.tblCaixaTurma.AsString := tblMensalidadesTurma.AsString;
    frmCaixa.tblCaixaDebitoCredito.AsString := 'C';

    frmCaixa.tblCaixa.Post;
    frmCaixa.tblCaixa.Refresh;
    frmCaixa.AtualizarControle;

    tblMensalidades.Edit;
    tblMensalidadesValorPago.Value := tblMensalidadesValorTotalCalc.Value;
    tblMensalidadesDataPagamento.AsDateTime := Date;
    tblMensalidadesUsuario.AsString := DM.tblUsuariosNomeNome.AsString;
    tblMensalidadesSituacao.Value := 0;

    strTurma := tblMensalidadesTurma.AsString;
    lngCodigo := tblMensalidadesCodigoAluno.AsInteger;
    datVencimento := tblMensalidadesDataVencimento.AsDateTime;
    intParcela := tblMensalidadesParcela.AsInteger;

    tblMensalidades.Post;

    tblMensalidades.Refresh;

    Application.ProcessMessages;

    if Mensagem( 'Deseja imprimir recibo ?', Application.Title,
                 MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    begin
      Application.CreateForm( TfrmRepRecibo, frmRepRecibo );
      with frmRepRecibo do
      begin
        tblMensalidades.Close;
        tblMensalidades.ParamByName('Codigo').AsInteger := lngCodigo;
        tblMensalidades.ParamByName('Parcela').AsInteger := intParcela;
        tblMensalidades.ParamByName('Data').AsDateTime := datVencimento;
        tblMensalidades.ParamByName('Turma').AsString := strTurma;
        tblMensalidades.Prepare;
        tblMensalidades.Open;
        Report.Print;
      end;

    end;

    Screen.Cursor := crDefault;
    Close;
end;

procedure TfrmSelMens.grdDblClick(Sender: TObject);
begin
  if ( txtCodigo.Text = '' ) then Exit;
  BaixarMensalidade;
end;


procedure TfrmSelMens.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelMens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelMens.tblMensalidadesBeforePost(DataSet: TDataSet);
var
  wAno, wMes, wDia : Word;
begin
  DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );
  tblMensalidadesDataBaseCorrecao.AsDateTime := EncodeDate( wAno, wMes, 1 );

  if tblMensalidadesDataVencimento.Value < tblMensalidadesDataPagamento.Value then
  begin
    tblPoupanca.FindKey( [tblMensalidadesDataBaseCorrecao.Value] );
    tblMensalidadesIndiceCorrecao.Value := tblPoupancaIndiceCorrigido.Value;
  end;

end;

procedure TfrmSelMens.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros_table(tblMensalidades, pmQtd);

end;

procedure TfrmSelMens.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelMens.SpeedButton1Click(Sender: TObject);
begin
  if ( txtCodigo.Text = '' ) then Exit;
  BaixarMensalidade;
end;

end.

