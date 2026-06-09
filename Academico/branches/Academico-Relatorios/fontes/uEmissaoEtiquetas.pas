unit uEmissaoEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, ZConnection, DBCtrls, Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Ucrpe32, StdCtrls, Mask, Menus;

type
  TfrmEmissaoEtiquetas = class(TForm)
    Panel2: TPanel;
    btnSair2: TSpeedButton;
    btnPesquisar2: TSpeedButton;
    btnImprimir2: TSpeedButton;
    btnCancelar2: TSpeedButton;
    btnExcluir2: TSpeedButton;
    btnSalvar2: TSpeedButton;
    btnAlterar2: TSpeedButton;
    btnNovo2: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnNovo: TSpeedButton;
    Navigator: TDBNavigator;
    Panel1: TPanel;
    tblControle: TUMZQuery;
    dtcControle: TDataSource;
    Panel3: TPanel;
    grd: TDBGrid;
    tblControleCodigo: TIntegerField;
    tblControleDescricao: TStringField;
    tblControleDataEmissao: TDateTimeField;
    grd2: TDBGrid;
    tblEtiquetas: TUMZQuery;
    dtcEtiquetas: TDataSource;
    tblEtiquetasCodigoAluno: TIntegerField;
    tblEtiquetasCodigoControle: TIntegerField;
    qryMax: TUMZQuery;
    Button1: TButton;
    qryMatriculas: TUMZQuery;
    qryMatriculasCodigoAluno: TIntegerField;
    qryMatriculasTurma: TStringField;
    Button2: TButton;
    qryBonus: TUMZQuery;
    qryBonusAlunoBeneficiado: TIntegerField;
    qryBonusAnoSemestre: TIntegerField;
    qryDelete: TUMZQuery;
    qryMatriculasAnoSemestre: TSmallintField;
    grp: TRadioGroup;
    tblEtiquetasTurma: TStringField;
    tblEtiquetasAnoSemestre: TSmallintField;
    pmQtdControle: TPopupMenu;
    pmQtdEtiquetas: TPopupMenu;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtcControleStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblEtiquetasBeforeInsert(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure tblControleNewRecord(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grd2KeyPress(Sender: TObject; var Key: Char);
    procedure dtcControleDataChange(Sender: TObject; Field: TField);
    procedure tblEtiquetasNewRecord(DataSet: TDataSet);
    procedure tblEtiquetasAfterPost(DataSet: TDataSet);
    procedure pmQtdControlePopup(Sender: TObject);
    procedure pmQtdEtiquetasPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmissaoEtiquetas: TfrmEmissaoEtiquetas;

implementation

uses Main, uDM, uSelTurmas;

{$R *.DFM}


procedure TfrmEmissaoEtiquetas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmissaoEtiquetas.btnNovoClick(Sender: TObject);
begin
  tblControle.Insert;
  grd.SetFocus;
end;

procedure TfrmEmissaoEtiquetas.btnAlterarClick(Sender: TObject);
begin
  tblControle.Edit;
  grd.SetFocus;
end;

procedure TfrmEmissaoEtiquetas.btnSalvarClick(Sender: TObject);
begin
  tblControle.Post;
end;

procedure TfrmEmissaoEtiquetas.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir a lista?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
    Screen.Cursor := crHourGlass;
    DM.db.StartTransaction;
    qryDelete.Close;
    qryDelete.ParamByName('CodigoControle').AsInteger := tblControleCodigo.asInteger;
    qryDelete.ExecSQL;
    tblControle.Delete;
    DM.db.Commit;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEmissaoEtiquetas.btnCancelarClick(Sender: TObject);
begin
  tblControle.Cancel;
end;

procedure TfrmEmissaoEtiquetas.dtcControleStateChange(Sender: TObject);
begin
  btnNovo.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnNovo2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnSalvar2.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnExcluir2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnCancelar2.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnImprimir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnImprimir2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnPesquisar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnPesquisar2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  if TDataSource( Sender ).State in [dsInsert, dsEdit] then
    grd.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit]
  else
    grd.Options := [dgRowSelect,dgTitles,dgIndicator,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit];
end;

procedure TfrmEmissaoEtiquetas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnNovo.Enabled then btnNovoClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F4 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F5 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
{    VK_F7 : btnImprimirClick( nil );}
{    VK_F8 : btnPesquisarClick( nil );}
    VK_F12 : btnSairClick( nil );
  end;
  if ( Shift = [ssCtrl] ) and ( Key = VK_UP ) then Navigator.btnClick( nbFirst );
  if ( Shift = [ssCtrl] ) and ( Key = VK_DOWN ) then Navigator.btnClick( nbLast );
  if ( Shift = [ssCtrl] ) and ( Key = VK_LEFT ) then Navigator.btnClick( nbPrior );
  if ( Shift = [ssCtrl] ) and ( Key = VK_RIGHT ) then Navigator.btnClick( nbNext );
end;

procedure TfrmEmissaoEtiquetas.tblEtiquetasBeforeInsert(DataSet: TDataSet);
begin
  if tblControle.State in [dsInsert, dsEdit] then tblControle.Post;
end;


procedure TfrmEmissaoEtiquetas.btnImprimirClick(Sender: TObject);
Var NomeRel : String;
    SFormula : String;
begin

  case grp.ItemIndex of
    0 : NomeRel := 'repEtiquetas2.rpt';
    1 : NomeRel := 'repSeedAdvogado.rpt';
    2 : NomeRel := 'repCartaGenerica.rpt';
    3 : NomeRel := 'repVencidosLista.rpt';
    4 : NomeRel := 'repCracha.rpt';
    5 : NomeRel := 'repCartaCobranca.rpt';
    6 : NomeRel := 'repSeed.rpt';
  end;

  SFormula := '{ControleEtiquetas.Codigo} = ' + tblControleCodigo.AsString;

  // ***** CASO ESPECIAL DA LISTA DE VENCIDOS ******** //
  if (grp.ItemIndex = 3) or (grp.ItemIndex = 5) then
  begin
    SFormula := SFormula + ' and {Mensalidades.Situacao} = 2' ;
    SFormula := SFormula + ' and {Mensalidades.DataVencimento} < ' + 'Date(' + FormatDateTime('yyyy,mm,dd', DataHoje) + ')';
    SFormula := SFormula + ' and {Mensalidades.AnoSemestre} = 20001';
  end;

  if (grp.ItemIndex = 3) Then   // Somente imprimir Nomes e Endereços se for VencidosLista
  Begin

       PrincipalForm.PrintRpt(NomeRel, Sformula,
       ['NomeFantasia','RazaoSocial','Endereco','Endereco2'],
       [ Dm.variavel_parametro('cliente_nome_fantasia') , Dm.variavel_parametro('cliente_razao_social') , Dm.variavel_parametro('cliente_endereco') , Dm.variavel_parametro('cliente_telefone') + ' - ' + Dm.variavel_parametro('cliente_cidade') + ' - ' + Dm.variavel_parametro('cliente_estado') ],
       [],True);

       Exit;
  End;

  PrincipalForm.PrintRpt(NomeRel, Sformula, [], [], [],True);

end;

procedure TfrmEmissaoEtiquetas.FormShow(Sender: TObject);
begin
  tblEtiquetas.Open;
  tblControle.Open;
end;

procedure TfrmEmissaoEtiquetas.FormHide(Sender: TObject);
begin
  tblControle.Close;
  tblEtiquetas.Close;
end;

procedure TfrmEmissaoEtiquetas.tblControleNewRecord(DataSet: TDataSet);
begin
  tblControleDataEmissao.AsDateTime := DataHoje;
  qryMax.Close;
  qryMax.SQL.Clear;
  qryMax.SQL.Add( 'select Max(Codigo) from ControleEtiquetas' );
  qryMax.Open;

  tblControleCodigo.AsInteger := qryMax.Fields[0].AsInteger + 1;
  qryMax.Close;
end;

procedure TfrmEmissaoEtiquetas.Button1Click(Sender: TObject);
begin
  frmSelTurmas.ShowModal;
  if not frmSelTurmas.flgSearch then Exit;

  if Mensagem( 'Deseja confirmar a turma selecionada?', Application.Title,
             MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  Screen.Cursor := crHourGlass;
  try
  DM.db.StartTransaction;

  if tblControle.State in [dsBrowse] then tblControle.Append;
  if tblControleDescricao.AsString = '' then
    tblControleDescricao.AsString := 'SELEÇÃO TURMA: ' +
      frmSelTurmas.qryTurmasTurma.AsString;

  qryMatriculas.Close;
  qryMatriculas.ParamByName('Turma').AsString := frmSelTurmas.qryTurmasTurma.AsString;
  qryMatriculas.ParamByName('AnoSemestre').AsInteger := frmSelTurmas.qryTurmasAnoSemestre.AsInteger;
  qryMatriculas.Prepare;
  qryMatriculas.Open;

  tblControle.DisableControls;
  qryMatriculas.First;
  while not qryMatriculas.Eof do
  begin
    tblEtiquetas.Append;
    tblEtiquetasCodigoAluno.AsInteger := qryMatriculasCodigoAluno.AsInteger;
    tblEtiquetasTurma.AsString := qryMatriculasTurma.AsString;
    tblEtiquetasAnoSemestre.AsInteger := qryMatriculasAnoSemestre.AsInteger;
    tblEtiquetas.Post;
    qryMatriculas.Next;
  end;

  except
    tblControle.EnableControls;
    DM.db.Rollback;
    Mensagem( 'Ocorreu um erro inesperado' + #13 +
              'Favor contatar o Administrador do Sistema.', Application.Title,
              MB_OK + MB_ICONSTOP );
  end;
  DM.db.Commit;
  tblControle.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmEmissaoEtiquetas.Button2Click(Sender: TObject);
var
  strAux : String;
  flg : Boolean;
begin

  flg := InputQuery( Application.Title,
                     'Digite o Ano/Semestre (aaaas)',strAux );

  if not flg then Exit;

  if Mensagem( 'Deseja confirmar a seleção do Bônus.', Application.Title,
               MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  Screen.Cursor := crHourGlass;
  try


  DM.db.StartTransaction;

  qryBonus.Close;
  qryBonus.ParamByName('AnoSemestre').AsInteger := StrToInt( strAux );
  qryBonus.Prepare;
  qryBonus.Open;

  if tblControle.State in [dsBrowse] then tblControle.Append;

  if tblControleDescricao.AsString = '' then
    tblControleDescricao.AsString := 'SELEÇÃO BONUS: ' +
      FormatMaskText( '0000/0;0;*', strAux );

  tblControle.DisableControls;
  qryBonus.First;
  while not qryBonus.Eof do
  begin
    tblEtiquetas.Append;
    tblEtiquetasCodigoAluno.AsInteger := qryBonusAlunoBeneficiado.AsInteger;
    tblEtiquetas.Post;
    qryBonus.Next;
  end;

  except
    DM.db.Rollback;
    tblControle.EnableControls;
    Mensagem( 'Ocorreu um erro inesperado.' + #13 +
              'Favor contatar o Administrador do Sistema.', Application.Title,
              MB_OK + MB_ICONSTOP );
  end;
  DM.db.Commit;
  tblControle.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmEmissaoEtiquetas.grd2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DELETE : begin
      if tblEtiquetas.State in [dsBrowse] then tblEtiquetas.Delete;
    end;
  end;
end;

procedure TfrmEmissaoEtiquetas.grd2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and
     ( (grd2.SelectedField = tblEtiquetasTurma) or
       (grd2.SelectedField = tblEtiquetasCodigoAluno) ) then
  begin
    if tblEtiquetas.State in [dsInsert, dsEdit] then
    begin
      tblEtiquetas.Post;
      tblEtiquetas.Append;
    end;
    Key := #0;
  end;
end;

procedure TfrmEmissaoEtiquetas.dtcControleDataChange(Sender: TObject;
  Field: TField);
begin
  if Field = nil then
  begin
    tblEtiquetas.Close;
    tblEtiquetas.ParamByName('CodigoControle').AsInteger := tblControleCodigo.AsInteger;
    if not tblEtiquetas.Prepared then tblEtiquetas.Prepare;
    tblEtiquetas.Open;
  end;
end;

procedure TfrmEmissaoEtiquetas.tblEtiquetasNewRecord(DataSet: TDataSet);
begin
  tblEtiquetasCodigoControle.AsInteger := tblControleCodigo.AsInteger;
end;

procedure TfrmEmissaoEtiquetas.tblEtiquetasAfterPost(DataSet: TDataSet);
begin
  Dataset.DisableControls;
  Dataset.Close;
  Dataset.Open;
  Dataset.Last;
  Dataset.EnableControls;
end;

procedure TfrmEmissaoEtiquetas.pmQtdControlePopup(Sender: TObject);
begin
  DM.quantidade_registros(tblControle, pmQtdControle);

end;

procedure TfrmEmissaoEtiquetas.pmQtdEtiquetasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblEtiquetas, pmQtdEtiquetas);

end;

end.

