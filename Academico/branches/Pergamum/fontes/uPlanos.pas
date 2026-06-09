unit uPlanos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus;

type
  TfrmPlanos = class(TForm)
    dtcPlanos: TDataSource;
    tblPlanos: TUMZQuery;
    tblPlanosCodigo: TIntegerField;
    tblPlanosTurma: TStringField;
    tblPlanosParcelas: TSmallintField;
    tblPlanosValorCobrado: TFloatField;
    tblPlanosValorContrato: TFloatField;
    tblPlanosTaxaApostila: TFloatField;
    tblPlanosDesconto: TFloatField;
    tblPlanosMatricula: TFloatField;
    qryMax: TUMZQuery;
    Panel3: TPanel;
    tblItens: TUMZQuery;
    dtcItens: TDataSource;
    tblItensCodigoPlano: TIntegerField;
    tblItensMes: TSmallintField;
    tblItensValorBruto: TFloatField;
    tblItensValorDesconto: TFloatField;
    tblItensValorExtra: TFloatField;
    tblItensDescontoExtra: TFloatField;
    tblItensValorTotal: TFloatField;
    tblPlanosDescricao: TStringField;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    tblPlanosAnoSemestre: TSmallintField;
    tblItensParcela: TSmallintField;
    qryInsertPlano: TUMZQuery;
    qryInsertParcelas: TUMZQuery;
    qryDelete: TUMZQuery;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label1: TLabel;
    btnCalcular: TSpeedButton;
    btnCopiar: TSpeedButton;
    Bevel1: TBevel;
    Panel6: TPanel;
    Bevel3: TBevel;
    pnAnoSemestre: TPanel;
    Label14: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    Bevel5: TBevel;
    dbCurso: TDBComboBox;
    Label13: TLabel;
    tblPlanosCurso: TStringField;
    tblPlanosPARAGRAFO3: TStringField;
    Label15: TLabel;
    dbTurma: TDBComboBox;
    Bevel6: TBevel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Bevel7: TBevel;
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
    ImageList1: TImageList;
    tblItensnr_dia: TSmallintField;
    tblItensnr_ano: TSmallintField;
    tblPlanosnr_dias_parczero: TSmallintField;
    DBCheckBox1: TDBCheckBox;
    tblPlanossn_creditos: TStringField;
    tblPlanosnr_creditos_base: TFloatField;
    tblItensnr_creditos_minimos: TFloatField;
    tblItenssn_credito_parcela: TStringField;
    pmQtdItens: TPopupMenu;
    pmQtdPlanos: TPopupMenu;
    qyTipoTit: TUMZQuery;
    tblItenscd_coligada: TSmallintField;
    tblItenscd_tipo_parcela: TSmallintField;
    qyTipoTitcd_tipo_titulo: TSmallintField;
    qyTipoTitds_tipo_titulo: TStringField;
    qyTipoTitct_tipo_titulo: TSmallintField;
    tblItensdescTipoTitulo: TStringField;
    pgTipoPlano: TPageControl;
    tsValorFixo: TTabSheet;
    tsValorCreditos: TTabSheet;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    tblPlanoscd_coligada: TSmallintField;
    tblPlanoscd_tipo_plano: TSmallintField;
    dbckbDiasUteis: TDBCheckBox;
    tblPlanossn_dias_uteis: TStringField;
    qyTipoTitcd_conta: TLargeintField;
    qyTipoTitcd_coligada: TIntegerField;
    qyTipoTitcd_padrao: TIntegerField;
    tblPlanosnr_max_disciplinas: TLargeintField;
    tblPlanosAPARTIR: TDateTimeField;
    qryMaxULTIMO: TLargeintField;
    Label19: TLabel;
    tblPlanosnm_coligada: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure tblPlanosAfterOpen(DataSet: TDataSet);
    procedure tblItensBeforeDelete(DataSet: TDataSet);
    procedure tblPlanosBeforeDelete(DataSet: TDataSet);
    procedure tblPlanosBeforePost(DataSet: TDataSet);
    procedure dtcPlanosDataChange(Sender: TObject; Field: TField);
    procedure pgTipoPlanoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgTipoPlanoChange(Sender: TObject);
    procedure tblPlanosValorCobradoChange(Sender: TField);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtcPlanosStateChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblPlanosNewRecord(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCalcularClick(Sender: TObject);
    procedure tblItensBeforePost(DataSet: TDataSet);
    procedure btnCopiarClick(Sender: TObject);
    function NovoCodigoPlano : Longint;
    procedure FormDestroy(Sender: TObject);
    procedure tblPlanosCursoChange(Sender: TField);
    procedure dbTurmaEnter(Sender: TObject);
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure pmQtdItensPopup(Sender: TObject);
    procedure pmQtdPlanosPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanos: TfrmPlanos;

implementation

uses Main, uDM, uPlanosCopiar, Math;

{$R *.DFM}

procedure TfrmPlanos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanos.btnNovoClick(Sender: TObject);
begin
  tblPlanos.Insert;
  grd.SetFocus;
end;

procedure TfrmPlanos.btnAlterarClick(Sender: TObject);
begin
  tblPlanos.Edit;
  dbeDescricao.SetFocus;
end;

procedure TfrmPlanos.btnSalvarClick(Sender: TObject);
var
  xCod : String;
begin
  tblPlanos.Post;
end;

procedure TfrmPlanos.btnCancelarClick(Sender: TObject);
begin
  tblPlanos.Cancel;
end;

procedure TfrmPlanos.dtcPlanosDataChange(Sender: TObject; Field: TField);
begin
   if (tblPlanos.State in [dsInsert, dsEdit]) then begin

       Exit;

   end;

   case tblPlanoscd_tipo_plano.AsInteger of

     1 : begin

        pgTipoPlano.ActivePageIndex := 0;

     end;
     2 : begin

        pgTipoPlano.ActivePageIndex := 1;

     end;
     3 : begin

        pgTipoPlano.ActivePageIndex := 2;

     end;

   end;


   
end;

procedure TfrmPlanos.dtcPlanosStateChange(Sender: TObject);
begin
  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  if TDataSource( Sender ).State in [dsInsert, dsEdit] then
    grd.Options := [dgEditing,dgTitles,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit]
  else
    grd.Options := [dgRowSelect,dgTitles,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit];

  if TDataSource( Sender ).State in [dsEdit, dsInsert] then begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   Dm.qAux2.SQL.Text := 'Select codigo from cursos where anosemestre = :anosemestre';
   Dm.qAux2.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
   Dm.qAux2.Open;

   dbCurso.Items.Clear;

   while not Dm.qAux2.Eof do
   Begin
       dbCurso.Items.Add(Dm.qAux2.FieldByName('codigo').AsString);
       Dm.qAux2.Next;
   End;

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;
   Dm.qAux2.SQL.Text := 'Select codigo from turmas where anosemestre = :anosemestre';
   Dm.qAux2.SQL.Add('and curso = :curso');
   Dm.qAux2.ParamByName('anosemestre').AsString := txtAnoSemestre.Text;
   Dm.qAux2.ParamByName('curso').AsString := tblPlanosCurso.AsString;
   Dm.qAux2.Open;

   dbTurma.Items.Clear;

   while not Dm.qAux2.Eof do
   Begin
       dbTurma.Items.Add(Dm.qAux2.FieldByName('codigo').AsString);
       Dm.qAux2.Next;
   End;   
   
  end;


end;

procedure TfrmPlanos.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

    qryDelete.SQL.Clear;
    qryDelete.SQL.Add( 'delete from ItensPlanosPagamento where' );
    qryDelete.SQL.Add( 'CodigoPlano = :CodigoPlano' );
    qryDelete.ParamByName('CodigoPlano').AsInteger := tblPlanosCodigo.AsInteger;
    qryDelete.ExecSQL;

    tblPlanos.Delete;
  end;
end;

procedure TfrmPlanos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnInserir.Enabled then btnInserirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F10 : if btnCopiar.Enabled then btnCopiarClick( nil );
    VK_F11 : if btnCalcular.Enabled then btnCalcularClick(nil);
    VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
  end;
end;

procedure TfrmPlanos.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   txtAnoSemestre.text := IntToStr(ano_semestre);

   { SQL Direto via programação pelo motivo do cd_coligada IN }
   tblPlanos.Close();
   tblPlanos.SQL.Clear();
   tblPlanos.SQL.Add('select * from PlanosPagamento');
   tblPlanos.SQL.Add('where anosemestre = :AnoSemestre AND');
   tblPlanos.SQL.Add('      cd_coligada IN ( ' + DM.GetColigadas() + ' ) ');
   tblPlanos.SQL.Add('order by Curso, Turma, Descricao');

   tblPlanos.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   tblPlanos.Open;


   tblItens.Close();
   tblItens.SQL.Clear();
   tblItens.SQL.Add('select * from ItensPlanosPagamento');
   tblItens.SQL.Add('where CodigoPlano = :Codigo AND');
   tblItens.SQL.Add('      cd_coligada IN ( ' + DM.GetColigadas() + ' )');
   tblItens.SQL.Add('order by Parcela');
   tblItens.Open;
   
end;

procedure TfrmPlanos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblPlanos.Close;
  tblItens.Close;
  Action := caFree;
end;

procedure TfrmPlanos.tblPlanosNewRecord(DataSet: TDataSet);
begin
   qryMax.Close;
   qryMax.Open;
   tblPlanosCodigo.AsInteger := qryMax.Fields[0].AsInteger + 1;
   tblPlanosAnoSemestre.AsInteger := StrToInt(txtAnoSemestre.Text);
   tblPlanossn_creditos.AsString := 'N';
   tblPlanoscd_tipo_plano.AsInteger := 1;
   tblPlanosnr_max_disciplinas.AsInteger := 99;

   if Dm.qryColigadas.RecordCount =1 then begin
      tblPlanoscd_coligada.AsInteger := DM.qryColigadasCD_COLIGADA.AsInteger;
   end;

   pgTipoPlano.ActivePageIndex := 0;
   qryMax.Close;
end;



procedure TfrmPlanos.tblPlanosValorCobradoChange(Sender: TField);
begin
   if tblPlanos.State in [dsInsert, dsEdit] then begin
      tblPlanosValorContrato.AsCurrency := tblPlanosValorCobrado.AsCurrency;
   end;
end;

procedure TfrmPlanos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanos.btnInserirClick(Sender: TObject);
begin
  dbeDescricao.SetFocus;
  tblPlanos.Append;
  tblPlanossn_dias_uteis.AsString := 'N';
end;

procedure TfrmPlanos.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmPlanos.dbeDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmPlanos.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin

  if tblPlanos.State in [dsInsert, dsEdit] then Exit;

  if Button = btNext then
  begin
    txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  tblPlanos.Close;
  tblPlanos.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  tblPlanos.Open;
end;

procedure TfrmPlanos.btnCalcularClick(Sender: TObject);
var
  n : Byte;
  wAno, wMes, wDia, wDia_Apartir : Word;
  dataVencimento : TDateTime;
  nAux : Integer;
  nTotParc : Integer;
  iTipoMensalidade : Integer;
  pPosicao : Pointer;
  bUltimoDia : Boolean;
  iMesAtual : Integer;
  
begin

  if Mensagem( 'Deseja calcular o valor das parcelas?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  if tblPlanos.State in [dsInsert, dsEdit] then begin
     btnSalvarClick(nil);
  end;

  // excluir itens de pagamento antes de calcular parcelas
  qryDelete.SQL.Clear;
  qryDelete.SQL.Add( 'DELETE from ItensPlanosPagamento where' );
  qryDelete.SQL.Add( 'CodigoPlano = :CodigoPlano AND cd_coligada = :cd_coligada' );
  qryDelete.ParamByName('CodigoPlano').AsInteger := tblPlanosCodigo.AsInteger;
  qryDelete.ParamByName('cd_coligada').AsInteger := tblPlanoscd_coligada.AsInteger;
  qryDelete.ExecSQL;
  // *****************************************************

  qyTipoTit.Close();
  qyTipoTit.ParamByName('cd_coligada').AsInteger := tblPlanoscd_coligada.AsInteger;
  qyTipoTit.Open();
  qyTipoTit.First;

  iTipoMensalidade := 0;

  // Selecionar o tipo de título padrão para as mensalidades;
  While not qyTipoTit.EOF do begin
     if qyTipoTitcd_padrao.AsInteger = 1 then // cd_padrao = 1 - Mensalidade
        iTipoMensalidade := qyTipoTitcd_tipo_titulo.AsInteger;
     qyTipoTit.Next();
  end;

  // Se não tiver um tipo de título padrão
  if iTipoMensalidade = 0  then begin
    Mensagem('Não é possível gerar as parcelas. Vá em Cadastro >> Tipo de Títulos e defina um padrão', 'Atenção', MB_OK + MB_ICONWARNING);
    tblItens.Close();
    tblItens.Open();
    Exit;
  end;


  Screen.Cursor := crHourGlass;

  tblItens.DisableControls;

  DecodeDate( tblPlanosApartir.AsDateTime, wAno, wMes, wDia_Apartir );

  bUltimoDia := (DaysPerMonth[wmes] = wDia_Apartir);

  try
     nAux := StrToInt(Dm.variavel_parametro('mensalidade_numero_parc_zero'));
     if nAux = 1 then begin
        nAux := 2;
        nTotParc := tblPlanosParcelas.AsInteger + 1;
     end
     else begin
        nAux := 1;
        nTotParc := tblPlanosParcelas.AsInteger ;
     end

  except
     nAux := 1;
     nTotParc := tblPlanosParcelas.AsInteger;
  end;

  // Inserir a Parcela Zero nos Itens de Pagamento Também!

  if tblPlanosMatricula.AsFloat > 0 then begin

     tblItens.Insert();
     tblItens.FieldByName('Mes').AsInteger := 0;
     tblItens.FieldByName('nr_dia').AsInteger := 0;
     tblItens.FieldByName('nr_ano').AsInteger := 0;
     tblItens.FieldByName('Parcela').AsInteger := nAux - 1;
     tblItens.FieldByName('ValorBruto').AsFloat := tblPlanosMatricula.AsFloat;
     tblItens.FieldByName('ValorDesconto').AsFloat := 0;
     tblItens.FieldByName('sn_credito_parcela').AsString := 'N';
     tblItens.FieldByName('DescontoExtra').AsFloat := 0;
     tblItens.FieldByName('cd_tipo_parcela').AsInteger := iTipoMensalidade;
     tblItens.FieldByName('cd_coligada').AsInteger := tblPlanoscd_coligada.AsInteger;
     tblItens.Post();
     
  end;

  for n := nAux to nTotParc do
  begin

    wDia := wDia_Apartir;

    if bUltimoDia then begin

       wDia := DaysPerMonth[wmes];
       dataVencimento := EncodeDate(wAno, wMes, wDia);

    end else begin


      iMesAtual := wMes;      

      if Dm.IsTrue(tblPlanos.FieldByName('sn_dias_uteis').AsString) then
      Begin
         datavencimento := DiaUtil(wano, wmes, wdia, tblPlanoscd_coligada.AsInteger);

         DecodeDate(datavencimento, wAno, wMes, wDia);
      End;

      dataVencimento := DataValida(wAno, wMes, wDia);

      case DayOfWeek(dataVencimento) of
        1 : dataVencimento := dataVencimento + 1;
        7 : dataVencimento := dataVencimento + 2;
      End;

    end;

    DecodeDate(datavencimento, wAno, wMes, wDia);

    tblItens.Insert();
    tblItens.FieldByName('Mes').AsInteger := wMes;
    tblItens.FieldByName('nr_dia').AsInteger := wDia;
    tblItens.FieldByName('nr_ano').AsInteger := wAno;
    tblItens.FieldByName('Parcela').AsInteger := n;
    tblItens.FieldByName('ValorBruto').AsFloat := tblPlanosValorCobrado.AsFloat;
    tblItens.FieldByName('ValorDesconto').AsFloat := tblPlanosDesconto.AsFloat;
    tblItens.FieldByName('sn_credito_parcela').AsString := tblPlanossn_creditos.AsString;
    tblItens.FieldByName('cd_tipo_parcela').AsInteger := iTipoMensalidade;
    tblItens.FieldByName('cd_coligada').AsInteger := tblPlanoscd_coligada.AsInteger;

    if (tblPlanosTaxaApostila.AsFloat > 0) then
      tblItens.FieldByName('ValorExtra').AsFloat := tblPlanosTaxaApostila.AsFloat
    else
      tblItens.FieldByName('ValorExtra').AsFloat := 0;

    tblItens.FieldByName('DescontoExtra').AsFloat := 0;
    tblItens.Post();

    { calculo do dia }

    if wmes <= iMesAtual then begin
        Inc(wMes);
    end;

    if wMes = 13 then
    Begin
       wMes := 1;
       wAno := wAno + 1;
    end;

  end;
  tblItens.Refresh;
  tblItens.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmPlanos.tblItensBeforeDelete(DataSet: TDataSet);
begin

   DM.setLog( 2006, 'Exclusao'
              , tblItensCodigoPlano.AsString + ';' + tblItensParcela.AsString + ';' + tblItensMes.AsString + ';' + tblItensnr_ano.AsString + ';'
              , tblItenscd_coligada.AsInteger
              , 'Plano: ' + tblPlanosDescricao.AsString + CHR(13) +
                'Total: ' + FloatToStrF(tblItensValorTotal.AsCurrency, ffNumber, 12, 2) + CHR(13) +
                'Cr.Min: ' + tblItensnr_creditos_minimos.AsString );

end;

procedure TfrmPlanos.tblItensBeforePost(DataSet: TDataSet);
begin
  tblItensCodigoPlano.AsINteger := tblPlanosCodigo.Asinteger;

  tblItensValorTotal.asFloat :=
      ( tblItensValorBruto.AsFloat - tblItensValorDesconto.AsFloat +
      tblItensValorExtra.AsFloat - tblItensDescontoExtra.AsFloat );

  if tblItens.State = dsInsert then begin

     DM.setLog( 2006, 'Inclusao'
              , tblItensCodigoPlano.AsString + ';' + tblItensParcela.AsString + ';' + tblItensMes.AsString + ';' + tblItensnr_ano.AsString + ';'
              , tblItenscd_coligada.AsInteger
              , 'Plano: ' + tblPlanosDescricao.AsString + CHR(13) +
                'Total: ' + FloatToStrF(tblItensValorTotal.AsCurrency, ffNumber, 12, 2) + CHR(13) +
                'Cr.Min: ' + tblItensnr_creditos_minimos.AsString );

  end else begin

     DM.setLog( 2006, 'Alteracao'
              , tblItensCodigoPlano.AsString + ';' + tblItensParcela.AsString + ';' + tblItensMes.AsString + ';'+ tblItensnr_ano.AsString + ';'
              , tblItenscd_coligada.AsInteger
              , 'Plano: ' + tblPlanosDescricao.AsString + CHR(13) +
                'Total: ' + FloatToStrF(tblItensValorTotal.AsCurrency, ffNumber, 12, 2) + CHR(13) +
                'Cr.Min: ' + tblItensnr_creditos_minimos.AsString );

  end;
      

end;



procedure TfrmPlanos.btnCopiarClick(Sender: TObject);
var
  strAux, strTurma, strCurso, strDat : String;
  flg : Boolean;
  lngCodigo, lngAtual : Longint;
  difMes : Integer;
  NovoMes, NovoAno : Word;
begin

  {Application.CreateForm(TfrmPlanosCopiar, frmPlanosCopiar);

  frmPlanosCopiar.txtAnoSemestre.Text := txtAnoSemestre.Text;
  frmPlanosCopiar.TxtTurma.Text := tblPlanosTurma.AsString;
  frmPlanosCopiar.txtCurso.Text := tblPlanosCurso.AsString;
  frmPlanosCopiar.txtApartir.DateTime := tblPlanosApartir.AsDateTime;

  if frmPlanosCopiar.ShowModal <> mrAll Then
     Exit;

  strAux := frmPlanosCopiar.txtAnoSemestre.Text;
  strTurma := frmPlanosCopiar.TxtTurma.Text;
  strDat := DateToStr(frmPlanosCopiar.txtApartir.DateTime);
  strCurso := frmPlanosCopiar.txtCurso.Text;

  frmPlanosCopiar.Free;

  try
  DM.db.StartTransaction;

  lngCodigo := NovoCodigoPlano;
  lngAtual := tblPlanosCodigo.AsInteger;
  with qryInsertPlano do
  begin

    ParamByName('NovoCodigo').AsInteger := lngCodigo;
    ParamByName('NovaColigada').AsInteger := tblPlanoscd_coligada.AsInteger;
    ParamByName('NovoAnoSemestre').AsInteger := StrToInt( strAux );
    ParamByName('NovaTurma').AsString := strTurma;
    ParamByName('NovoCurso').AsString := strCurso;
    if tblPlanosAnoSemestre.AsInteger <> StrToInt( strAux ) then
       ParamByName('NovaDescricao').AsString := tblPlanosDescricao.AsString + '_COPIA'
    else
       ParamByName('NovaDescricao').AsString := tblPlanosDescricao.AsString;
    ParamByName('NovaParcelas').AsInteger := tblPlanosParcelas.AsInteger;
    ParamByName('NrDiasParczero').AsInteger := tblPlanosnr_dias_parczero.AsInteger;
    ParamByName('SnDiasUteis').AsString := tblPlanossn_dias_uteis.AsString;
    ParamByName('NovoValorCobrado').AsFloat := tblPlanosValorCobrado.AsFloat;
    ParamByName('NovoValorContrato').AsFloat := tblPlanosValorContrato.AsFloat;
    ParamByName('NovaTaxaApostila').AsFloat := tblPlanosTaxaApostila.AsFloat;
    ParamByName('NovoDesconto').AsFloat := tblPlanosDesconto.AsFloat;
    ParamByName('NovaMatricula').AsFloat := tblPlanosMatricula.AsFloat;
    ParamByName('NovoApartir').AsDateTime := StrToDate(strDat);
    ParamByName('NovoParagrafo3').AsString := tblPlanosPARAGRAFO3.AsString;
    ParamByName('sn_creditos').AsString := tblPlanossn_creditos.AsString;
    ParamByName('nr_creditos_base').AsFloat := tblPlanosnr_creditos_base.AsFloat;
    ParamByName('CdTipoPlano').AsInteger := tblPlanoscd_tipo_plano.AsInteger;

    DM.setLog( 2006, 'Inclusao'
           , IntToStr(lngCodigo) + ';'
           , tblPlanoscd_coligada.AsInteger
           , 'Plano: ' + tblPlanosDescricao.AsString + 
             ' - Plano copiado' + CHR(13) +
             'Curso: ' + strCurso + CHR(13) +
             'Turma: ' + strTurma + CHR(13) +
             'A Partir: ' + FormatDateTime('dd/mm/yyyy', StrToDate(strDat)) );
    

    ExecSQL;
  end;

  // Quandidade de Mes que avançou;
  difMes := TRUNC(DataDiif(tblPlanosApartir.AsDateTime, StrToDate(strDat)) / 30);

  tblItens.First;
  while not tblItens.Eof do
  Begin
     try
        NovoMes := tblItensMes.AsInteger + difMes;

        NovoAno :=  tblItensnr_ano.AsInteger;

        while NovoMes > 12 do begin  
             NovoAno := NovoAno + 1;
             NovoMes := NovoMes - 12;
        end;

        while NovoMes <= 0 do begin
             NovoAno := NovoAno - 1;
             NovoMes := NovoMes + 12;
        end;

        with qryInsertParcelas do
        begin
          ParamByName('NovoCodigo').AsInteger := lngCodigo;
          ParamByName('NovaColigada').AsInteger := tblItenscd_coligada.AsInteger;
          ParamByName('Mes').AsInteger :=    NovoMes;
          ParamByName('nr_ano').AsInteger := NovoAno;
          ParamByName('nr_dia').AsInteger := tblItensnr_dia.AsInteger;
          ParamByName('Parcela').AsInteger := tblItensParcela.AsInteger;
          ParamByName('ValorBruto').AsFloat := tblItensValorBruto.AsFloat;
          ParamByName('ValorDesconto').AsFloat := tblItensValorDesconto.AsFloat;
          ParamByName('ValorExtra').AsFloat := tblItensValorExtra.AsFloat;
          ParamByName('DescontoExtra').AsFloat := tblItensValorExtra.AsFloat;
          ParamByName('ValorTotal').AsFloat := tblItensValorTotal.AsFloat;
          ParamByName('nr_creditos_minimos').AsFloat := tblItensnr_creditos_minimos.AsFloat;
          ParamByName('sn_credito_parcela').AsString := tblItenssn_credito_parcela.AsString;
          ParamByName('CdTipoParcela').AsInteger := tblItenscd_tipo_parcela.AsInteger;
          ExecSQL;
        end;
     except
     end;
     tblItens.Next;
  end;

  DM.db.Commit;
  except
    DM.db.Rollback;
    Mensagem( 'Ocorreu um erro inesperado durante esta operação.' + #13 +
              'Contate o Administrador do Sistema.',
              Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

  tblPlanos.DisableControls;
  tblPlanos.Refresh;

  if tblPlanos.Locate( 'Codigo', lngCodigo, [loCaseInsensitive] ) then
  begin
    btnCalcularClick(nil);
  end;

  tblPlanos.Locate( 'Codigo', lngAtual, [loCaseInsensitive] );

  tblPlanos.EnableControls;
  Mensagem( 'Operação efetuada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
   }
end;

function TfrmPlanos.NovoCodigoPlano : Longint;
begin
  qryMax.Close;
  qryMax.Open;
  Result := qryMax.Fields[0].AsInteger + 1;
  qryMax.Close;
end;

procedure TfrmPlanos.pgTipoPlanoChange(Sender: TObject);
begin

   if not (tblPlanos.State in [dsInsert, dsEdit]) then begin

       Exit;

   end;


   case pgTipoPlano.ActivePageIndex of
     0 : begin

        tblPlanoscd_tipo_plano.AsInteger := 1;
        tblPlanossn_creditos.AsString := 'N';

     end;
     1 : begin

        tblPlanossn_creditos.AsString := 'S';
        tblPlanoscd_tipo_plano.AsInteger := 2;

     end;
     2 : begin

        tblPlanossn_creditos.AsString := 'N';
        tblPlanoscd_tipo_plano.AsInteger := 3;

     end;

   end;



end;

procedure TfrmPlanos.pgTipoPlanoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if not (tblPlanos.State in [dsInsert, dsEdit]) then begin

       AllowChange := False;
       Exit;

   end;
   AllowChange := True;

end;

procedure TfrmPlanos.FormDestroy(Sender: TObject);
begin
  frmPlanos := nil;
end;

procedure TfrmPlanos.tblPlanosCursoChange(Sender: TField);
begin
   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;
   Dm.qAux2.SQL.Text := 'Select codigo from turmas where anosemestre = :anosemestre';
   Dm.qAux2.SQL.Add('and curso = :curso');
   Dm.qAux2.ParamByName('anosemestre').AsInteger := tblPlanosAnoSemestre.AsInteger;
   Dm.qAux2.ParamByName('curso').AsString := tblPlanosCurso.AsString;
   Dm.qAux2.Open;

   dbTurma.Items.Clear;

   while not Dm.qAux2.Eof do
   Begin
       dbTurma.Items.Add(Dm.qAux2.FieldByName('codigo').AsString);
       Dm.qAux2.Next;
   End;
   
end;

procedure TfrmPlanos.dbTurmaEnter(Sender: TObject);
begin
   tblPlanosCursoChange(nil);
end;

procedure TfrmPlanos.dbeDescricaoEnter(Sender: TObject);
begin
   PrincipalForm.MostraHint2(Sender);
end;

procedure TfrmPlanos.pmQtdItensPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblItens, pmQtdItens);

end;

procedure TfrmPlanos.pmQtdPlanosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblPlanos, pmQtdPlanos);

end;

procedure TfrmPlanos.tblPlanosAfterOpen(DataSet: TDataSet);
begin
   qyTipoTit.Close();
   qyTipoTit.ParamByName('cd_coligada').AsInteger := tblPlanoscd_coligada.AsInteger;
   qyTipoTit.Open();
end;

procedure TfrmPlanos.tblPlanosBeforeDelete(DataSet: TDataSet);
begin

   DM.setLog( 2006, 'Exclusao'
              , tblPlanosCodigo.AsString + ';'
              , tblPlanoscd_coligada.AsInteger
              , 'Plano: ' + tblPlanosDescricao.AsString + CHR(13) +
                'Curso: ' + tblPlanosCurso.AsString + CHR(13) +
                'Turma: ' + tblPlanosTurma.AsString + CHR(13) +
                'A Partir: ' + FormatDateTime('dd/mm/yyyy', tblPlanosApartir.AsDateTime) );

end;

procedure TfrmPlanos.tblPlanosBeforePost(DataSet: TDataSet);
begin
  // Registrar o log de Alterações

   if tblPlanoscd_coligada.AsString = '' then
      Abort;

  if tblPlanos.State = dsInsert then begin

     DM.setLog( 2006, 'Inclusao'
              , tblPlanosCodigo.AsString + ';'
              , tblPlanoscd_coligada.AsInteger
              , 'Plano: ' + tblPlanosDescricao.AsString + CHR(13) + 
                'Curso: ' + tblPlanosCurso.AsString + CHR(13) +
                'Turma: ' + tblPlanosTurma.AsString + CHR(13) +
                'A Partir: ' + FormatDateTime('dd/mm/yyyy', tblPlanosApartir.AsDateTime) );

  end else begin

   DM.setLog( 2006, 'Alteracao'
              , tblPlanosCodigo.AsString + ';'
              , tblPlanoscd_coligada.AsInteger
              , 'Plano: ' + tblPlanosDescricao.AsString + CHR(13) +
                'Curso: ' + tblPlanosCurso.AsString + CHR(13) +
                'Turma: ' + tblPlanosTurma.AsString + CHR(13) +
                'A Partir: ' + FormatDateTime('dd/mm/yyyy', tblPlanosApartir.AsDateTime) );

  end;


end;

end.
