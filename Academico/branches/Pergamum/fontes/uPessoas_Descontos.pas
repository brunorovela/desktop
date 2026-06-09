unit uPessoas_Descontos;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ImgList, ComCtrls, ToolWin, Grids, DBGrids, ExtCtrls, Db, ZConnection,
   StdCtrls, Mask, DBCtrls, Buttons, Variants, Menus, General, uFSelecionarTurma,
   ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ZSqlUpdate,
   uFSelecionarPessoa;

type
   TTipoFiltro = (tpNenhum, tpBeneficiado, tpIndicado, tpTurma, tpDesconto,
      tpTodos);
  
  Tfrm_Pessoas_Descontos = class(TForm)
    pnlTitulo: TPanel;
    bvlSep1: TBevel;
    dbgDescontos: TDBGrid;
    bvlSep2: TBevel;
    dsPessoasDesconto: TDataSource;
    qryPessoasDesconto: TUMZQuery;
    tlbOpcoesCadastro: TToolBar;
    btnSep3: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    btnSep4: TToolButton;
    btnFechar: TToolButton;
    btnSep6: TToolButton;
    ilOpcoesFiltro: TImageList;
    tlbOpcoesFiltro: TToolBar;
    ilOpcoesCadastro: TImageList;
    btnSep1: TToolButton;
    btnFiltroBeneficiado: TToolButton;
    btnFiltroIndicado: TToolButton;
    btnFiltroTurma: TToolButton;
    btnSep2: TToolButton;
    btnFiltroTodos: TToolButton;
    btnFiltroDesconto: TToolButton;
    btnSep5: TToolButton;
    sbSelColunas: TSpeedButton;
    qryPessoasDescontoCD_DESCONTO_PESSOA: TLargeintField;
    qryPessoasDescontoCD_PESSOA: TLargeintField;
    qryPessoasDescontoCD_DESCONTO: TLargeintField;
    qryPessoasDescontoVL_ANOSEM_INICIO: TIntegerField;
    qryPessoasDescontoVL_ANOSEM_FIM: TIntegerField;
    qryPessoasDescontoCD_DEPTO: TIntegerField;
    qryPessoasDescontoSN_PRIMEIRA_PARCELA: TStringField;
    qryPessoasDescontoCD_PESSOA_INDICADA: TLargeintField;
    qryPessoasDescontoDT_INICIO: TDateTimeField;
    qryPessoasDescontoDT_FIM: TDateTimeField;
    qryPessoasDescontoVL_PERCENTUAL: TFloatField;
    qryPessoasDescontoNR_PARC_INICIO: TSmallintField;
    qryPessoasDescontoNR_PARC_FIM: TIntegerField;
    qryPessoasDescontoDS_HISTORICO: TStringField;
    qryPessoasDescontoTX_OBSERVACOES: TMemoField;
    qryPessoasDescontoCD_RESPONSAVEL: TIntegerField;
    qryPessoasDescontoTP_DESCONTO: TSmallintField;
    qryPessoasDescontoDS_DEPARTAMENTO: TStringField;
    qryPessoasDescontoDS_PLANO: TStringField;
    qryPessoasDescontoNM_PESSOA: TStringField;
    qryPessoasDescontoNM_INDICADO: TStringField;
    qryPessoasDescontoNM_RESPONSAVEL: TStringField;
    bvlSep3: TBevel;
    bvlSep4: TBevel;
    updPessoasDesconto: TZUpdateSQL;
    chkFiltroAtivos: TCheckBox;
    btnSep7: TToolButton;
    qryPessoasDescontoSN_ATIVO: TStringField;
    qryPessoasDescontoCD_CURSO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure qryPessoasDescontoAfterRefresh(DataSet: TDataSet);
    procedure qryPessoasDescontoAfterOpen(DataSet: TDataSet);
    procedure chkFiltroAtivosClick(Sender: TObject);
    procedure dbgDescontosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure sbSelColunasClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPessoasDescontoStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnFiltroBeneficiadoClick(Sender: TObject);
    procedure btnFiltroIndicadoClick(Sender: TObject);
    procedure btnFiltroTurmaClick(Sender: TObject);
    procedure btnFiltroTodosClick(Sender: TObject);
    procedure btnFiltroDescontoClick(Sender: TObject);
  strict private
      resultado_filtro_turma : TResultadoFiltroTurma;
      resultado_filtro_pessoa : TResultadoFiltroPessoa;
  private
      FTipoFiltro: TTipoFiltro;
  public
     const
      SSQL =
      'SELECT DISTINCT ' +
         'PD.CD_DESCONTO_PESSOA, ' +
         'PD.CD_PESSOA, ' +
         'PD.CD_DESCONTO, ' +
         'PD.VL_ANOSEM_INICIO, ' +
         'PD.VL_ANOSEM_FIM, ' +
         'PD.CD_DEPTO, ' +
         'PD.SN_PRIMEIRA_PARCELA, ' +
         'PD.CD_PESSOA_INDICADA, ' +
         'PD.DT_INICIO, ' +
         'PD.DT_FIM, ' +
         'PD.VL_PERCENTUAL, ' +
         'PD.NR_PARC_INICIO, ' +
         'PD.NR_PARC_FIM, ' +
         'PD.DS_HISTORICO, ' +
         'PD.TX_OBSERVACOES, ' +
         'PD.CD_RESPONSAVEL, ' +
         'PD.TP_DESCONTO, ' +
         'DP.DESCRICAO DS_DEPARTAMENTO, ' +
         'D.DESCRICAOPLANO DS_PLANO, ' +
         'P.NM_PESSOA, ' +
         'I.NM_PESSOA NM_INDICADO, ' +
         'R.NM_PESSOA NM_RESPONSAVEL, ' +
         'PD.CD_CURSO, ' +
         'CAST(CASE ' +
            'WHEN NOW() BETWEEN PD.DT_INICIO AND PD.DT_FIM THEN "1" ' +
            'ELSE "0" ' +
         'END AS CHAR) SN_ATIVO ' +
      'FROM ' +
         'PESSOAS_DESCONTOS PD ' +

            'JOIN DEPARTAMENTOS DP ON ' +
               '(PD.CD_DEPTO = DP.CODIGO) ' +
               
            'JOIN PESSOAS P ON ' +
               '(PD.CD_PESSOA = P.CD_PESSOA) ' +

            'LEFT JOIN PLANOSDESCONTO D ON ' +
               '(PD.CD_DESCONTO = D.CODIGO) ' +

            'LEFT JOIN PESSOAS R ON ' +
               '(PD.CD_RESPONSAVEL = R.CD_PESSOA) ' +

            'LEFT JOIN PESSOAS I ON ' +
               '(PD.CD_PESSOA_INDICADA = I.CD_PESSOA) ' +
      'WHERE DP.cd_coligada IN (%s) %s';

      procedure Filtra;
  end;

var
   frm_Pessoas_Descontos: Tfrm_Pessoas_Descontos;

implementation

uses
   uDM, Main, uUsuario, uSelDesconto, uCamposPlanilhas,
   UFPessoasDescontoCad, UFObservacoes;

{$R *.DFM}

procedure Tfrm_Pessoas_Descontos.Filtra;
const
   SFiltroPessoa = 'AND PD.CD_PESSOA = :CD_PESSOA';
   SFiltroIndicado = 'AND PD.CD_PESSOA_INDICADA = :CD_PESSOA';
   SFiltroTurma = 'AND EXISTS (SELECT M.CODIGOALUNO FROM MATRICULAS M WHERE PD.CD_PESSOA = M.CODIGOALUNO AND M.TURMA = :CD_TURMA AND M.ANOSEMESTRE = :NR_ANOSEMESTRE)';
   SFiltroDesconto = 'AND PD.CD_DESCONTO = :CD_DESCONTO';
begin
   if qryPessoasDesconto.Active then
   begin
      qryPessoasDesconto.Close;
   end;

   case FTipoFiltro of
      tpBeneficiado:
         begin
            qryPessoasDesconto.SQL.Text := Format(SSQL, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), SFiltroPessoa]);
            qryPessoasDesconto.ParamByName('CD_PESSOA').AsInteger :=
               resultado_filtro_pessoa.cd_pessoa;
         end;
      
      tpIndicado:
         begin
            qryPessoasDesconto.SQL.Text := Format(SSQL, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), SFiltroIndicado]);
            qryPessoasDesconto.ParamByName('CD_PESSOA').AsInteger :=
               resultado_filtro_pessoa.cd_pessoa;
         end;
      
      tpTurma:
         begin
            qryPessoasDesconto.SQL.Text := Format(SSQL, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), SFiltroTurma]);
            qryPessoasDesconto.ParamByName('CD_TURMA').AsString :=
               resultado_filtro_turma.cd_turma;
            qryPessoasDesconto.ParamByName('NR_ANOSEMESTRE').AsInteger :=
               resultado_filtro_turma.nr_anosemestre;
         end;
         
      tpDesconto:
         begin
            qryPessoasDesconto.SQL.Text := Format(SSQL, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), SFiltroDesconto]);
            qryPessoasDesconto.ParamByName('CD_DESCONTO').AsInteger :=
               frmSelDesconto.qryPlanoDescontocodigo.AsInteger;
         end;

      tpNenhum, tpTodos:
         begin
            qryPessoasDesconto.SQL.Text := Format(SSQL, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), '']);
         end;
   end;

   qryPessoasDesconto.Open;
end;

procedure Tfrm_Pessoas_Descontos.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2021, npAlterar, True) then
   begin
      Application.CreateForm(TfPessoasDescontoCad, fPessoasDescontoCad);

      if fPessoasDescontoCad.qryPessoaDesconto.Active then
      begin
         fPessoasDescontoCad.qryPessoaDesconto.Close;
      end;

      fPessoasDescontoCad.qryPessoaDesconto.ParamByName('CD_PESSOA').AsInteger :=
         qryPessoasDescontoCD_PESSOA.AsInteger;

      fPessoasDescontoCad.qryPessoaDesconto.Open;
      fPessoasDescontoCad.qryPessoaDesconto.Locate('CD_DESCONTO_PESSOA',
         qryPessoasDescontoCD_DESCONTO_PESSOA.AsInteger, []);

      fPessoasDescontoCad.rbAplicaBruto.Checked := fPessoasDescontoCad.qryPessoaDescontonr_forma_aplicar_divisao.AsInteger = 1;
      fPessoasDescontoCad.rbAplicaLiquido.Checked := fPessoasDescontoCad.qryPessoaDescontonr_forma_aplicar_divisao.AsInteger = 2;

      fPessoasDescontoCad.qryPessoaDesconto.Edit;

      fPessoasDescontoCad.sbSelBeneficiado.Enabled := False;

      if fPessoasDescontoCad.ShowModal = mrOk then
         qryPessoasDesconto.Refresh;
   end;
end;

procedure Tfrm_Pessoas_Descontos.btnExcluirClick(Sender: TObject);
const
   SMsgConfirmExc = 'Deseja realmente excluir a programação de desconto selecionada?';
begin
   if DM.UsuarioLogado.TemPermissao(2021, npExcluir, True) then
   begin
      if MessageDlg(SMsgConfirmExc, mtConfirmation, [mbYes, mbNo], -1) = mrYes then
      begin
         qryPessoasDesconto.Delete;
      end;
   end;
end;

procedure Tfrm_Pessoas_Descontos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Pessoas_Descontos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F1:
         PrincipalForm.confSobre.Click;
      VK_F2:
         btnInserir.Click;
      VK_F3:
         btnAlterar.Click;
      VK_F9:
         btnExcluir.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

procedure Tfrm_Pessoas_Descontos.FormShow(Sender: TObject);
begin
   if frmSelDesconto = nil then
      Application.CreateForm(TfrmSelDesconto, frmSelDesconto);
end;

procedure Tfrm_Pessoas_Descontos.qryPessoasDescontoAfterOpen(DataSet: TDataSet);
begin
   pnlTitulo.Caption := Format('PROGRAMAÇÃO DE DESCONTOS (%d registros encontrados)',
      [qryPessoasDesconto.RecordCount]);
end;

procedure Tfrm_Pessoas_Descontos.qryPessoasDescontoAfterRefresh(
  DataSet: TDataSet);
begin
   pnlTitulo.Caption := Format('PROGRAMAÇÃO DE DESCONTOS (%d registros encontrados)',
      [qryPessoasDesconto.RecordCount]);
   btnAlterar.Enabled := not qryPessoasDesconto.IsEmpty;
end;

procedure Tfrm_Pessoas_Descontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if frmSelDesconto <> nil then
   begin
      frmSelDesconto.Free;
      frmSelDesconto := nil;
   end;

   Action := caFree;
end;

procedure Tfrm_Pessoas_Descontos.FormCreate(Sender: TObject);
begin
   FTipoFiltro := tpNenhum;
   DM.MontarPlanilha(dbgDescontos, 'planilha_prog_desconto');
end;

procedure Tfrm_Pessoas_Descontos.dbgDescontosTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;

      SortedFields.NameValueSeparator := ' ';
 
      SortedFields.DelimitedText := qryPessoasDesconto.IndexFieldNames;
 
      for I := 0 to SortedFields.Count - 1 do

         if SortedFields.Names[I] = Column.FieldName then
         begin

            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;

            Found := True;
            Break;
         end;

      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;

      qryPessoasDesconto.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure Tfrm_Pessoas_Descontos.dsPessoasDescontoStateChange(Sender: TObject);
begin
   btnInserir.Enabled := dsPessoasDesconto.State = dsBrowse;
   btnAlterar.Enabled := (dsPessoasDesconto.State = dsBrowse) and
      (not qryPessoasDesconto.IsEmpty);
   btnExcluir.Enabled := dsPessoasDesconto.State = dsBrowse;
end;

procedure Tfrm_Pessoas_Descontos.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2021, npIncluir, True) then
   begin
      Application.CreateForm(TfPessoasDescontoCad, fPessoasDescontoCad);

      if fPessoasDescontoCad.qryPessoaDesconto.Active then
      begin
         fPessoasDescontoCad.qryPessoaDesconto.Close;
      end;

      fPessoasDescontoCad.qryPessoaDesconto.ParamByName('CD_PESSOA').Clear;

      fPessoasDescontoCad.qryPessoaDesconto.Open;

      fPessoasDescontoCad.rbAplicaBruto.Checked := fPessoasDescontoCad.qryPessoaDescontonr_forma_aplicar_divisao.AsInteger = 1;
      fPessoasDescontoCad.rbAplicaLiquido.Checked := fPessoasDescontoCad.qryPessoaDescontonr_forma_aplicar_divisao.AsInteger = 2;

      fPessoasDescontoCad.qryPessoaDesconto.Insert;

      if fPessoasDescontoCad.ShowModal = mrOk then
      begin
         if not fPessoasDescontoCad.qryPessoaDescontoTX_OBSERVACOES.IsNull then
         begin
            TfObservacoes.RegisterObservation(
               fPessoasDescontoCad.qryPessoaDescontoCD_PESSOA.AsInteger,
               okFinancial,
               fPessoasDescontoCad.qryPessoaDescontoTX_OBSERVACOES.AsString
            );
         end;

         if qryPessoasDesconto.Active then
            qryPessoasDesconto.Refresh
         else
         begin
            FTipoFiltro := tpBeneficiado;
            Filtra;
         end;
      end;
   end;
end;

procedure Tfrm_Pessoas_Descontos.chkFiltroAtivosClick(Sender: TObject);
begin
   if chkFiltroAtivos.Checked then
   begin
      qryPessoasDesconto.Filter := 'SN_ATIVO = 1';
      qryPessoasDesconto.Filtered := True;
   end
   else
   begin
      qryPessoasDesconto.Filtered := False;
   end;

   if qryPessoasDesconto.Active then
   begin
      pnlTitulo.Caption := Format('PROGRAMAÇÃO DE DESCONTOS (%d registros encontrados)',
         [qryPessoasDesconto.RecordCount]);
   end;
end;

procedure Tfrm_Pessoas_Descontos.btnFiltroBeneficiadoClick(Sender: TObject);
begin
   resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro_pessoa.filtrado then
   begin
      FTipoFiltro := tpBeneficiado;
      Filtra;
   end;
end;

procedure Tfrm_Pessoas_Descontos.btnFiltroIndicadoClick(Sender: TObject);
begin
   resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro_pessoa.filtrado then
   begin
      FTipoFiltro := tpIndicado;
      Filtra;
   end;
end;

procedure Tfrm_Pessoas_Descontos.btnFiltroTurmaClick(Sender: TObject);
begin
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro_turma.filtrado then
   begin
      FTipoFiltro := tpTurma;
      Filtra;
   end;
end;

procedure Tfrm_Pessoas_Descontos.btnFiltroTodosClick(Sender: TObject);
begin
   chkFiltroAtivos.State := cbUnchecked;
   FTipoFiltro := tpTodos;
   Filtra;
end;

procedure Tfrm_Pessoas_Descontos.btnFiltroDescontoClick(Sender: TObject);
begin
   frmSelDesconto.ShowModal;

   if frmSelDesconto.flgSearch then
   begin
      FTipoFiltro := tpDesconto;
      Filtra;
   end;
end;

procedure Tfrm_Pessoas_Descontos.sbSelColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(dbgDescontos, 'planilha_prog_desconto');
end;

end.

