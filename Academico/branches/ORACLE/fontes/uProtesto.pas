unit uProtesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Grids, DBGrids, ExtCtrls, ZConnection, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Mask, Menus,
  ComCtrls, Buttons, ClassRegistros;

type
  TfrmEmProtesto = class(TForm)
    dtcEmProtesto: TDataSource;
    Panel1: TPanel;
    qryUpdate: TUMZQuery;
    tblEmProtesto: TUMZQuery;
    tblEmProtestoParcela: TSmallintField;
    tblEmProtestoDataVencimento: TDateTimeField;
    tblEmProtestoTurma: TStringField;
    tblEmProtestoValor: TFloatField;
    tblEmProtestoDataEmissao: TDateTimeField;
    tblEmProtestoUsuario: TStringField;
    tblEmProtestoNossoNumero: TStringField;
    tblEmProtestoGerado: TStringField;
    Panel2: TPanel;
    btnFechar: TButton;
    btnImprimir: TButton;
    btnExcluir: TButton;
    Panel3: TPanel;
    tblApresentaEmProtesto: TUMZQuery;
    tblApresentaEmProtestocodigoaluno: TIntegerField;
    tblApresentaEmProtestoparcela: TSmallintField;
    tblApresentaEmProtestodatavencimento: TDateTimeField;
    tblApresentaEmProtestoturma: TStringField;
    tblApresentaEmProtestovalor: TFloatField;
    tblApresentaEmProtestodataemissao: TDateTimeField;
    tblApresentaEmProtestousuario: TStringField;
    tblApresentaEmProtestonossonumero: TStringField;
    tblApresentaEmProtestonm_pessoa: TStringField;
    Panel4: TPanel;
    pmQtd: TPopupMenu;
    tcProtestos: TTabControl;
    grd: TDBGrid;
    sbSelecionado: TSpeedButton;
    sbTodos: TSpeedButton;
    sbSelecionarColuna: TSpeedButton;
    tblApresentaEmProtestogerado: TStringField;
    tblApresentaEmProtestods_historico: TStringField;
    tblApresentaEmProtestojuros: TFloatField;
    tblEmProtestocodigoaluno: TIntegerField;
    tblEmProtestocd_mensalidade: TLargeintField;
    tblApresentaEmProtestocd_mensalidade: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure tcProtestosChange(Sender: TObject);
    procedure sbTodosClick(Sender: TObject);
    procedure sbSelecionadoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblEmProtestoNewRecord(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
    SitProtestos : Array of Integer;
    Procedure Filtrar();
  public
    iAlunoSelecionado : Integer;
    { Public declarations }
  end;

var
  frmEmProtesto: TfrmEmProtesto;

implementation

uses
   uDM, Main, uCamposPlanilhas, uUsuario;

{$R *.DFM}


procedure TfrmEmProtesto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmProtesto.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Screen.Cursor := crHourGlass;
  Screen.Cursor := crDefault;


  // Criar as Guias com as opções de Protestos;

  SetLength(SitProtestos, 1);

  Dm.tblSituacoesFinanceiras.Close();
  DM.tblSituacoesFinanceiras.Open();
  tcProtestos.Tabs.Clear;
  tcProtestos.Tabs.Add('[Todas as Anotações]');
  
  SitProtestos[0] := -1;

  while not DM.tblSituacoesFinanceiras.Eof do begin

     if DM.tblSituacoesFinanceirassn_protesto.AsInteger = 1 then begin

        tcProtestos.Tabs.Add(DM.tblSituacoesFinanceirasds_situacao.AsString);

        SetLength(SitProtestos, Length(SitProtestos) + 1);
        SitProtestos[Length(SitProtestos)- 1 ] := DM.tblSituacoesFinanceirascd_situacao.AsInteger;        
     
     end;

     DM.tblSituacoesFinanceiras.Next();

  end;

  tcProtestos.TabIndex := 0;

  if iAlunoSelecionado = 0 then begin

     sbTodos.Down := true;
     sbSelecionado.Enabled := false;

  end else begin

     sbSelecionado.Down := true;
     sbSelecionado.Enabled := true;

  end;

  Filtrar();

end;

procedure TfrmEmProtesto.tblEmProtestoNewRecord(DataSet: TDataSet);
begin
  tblEmProtestoDataEmissao.AsDateTime := DM.DataAtual();
end;


procedure TfrmEmProtesto.tcProtestosChange(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmEmProtesto.btnExcluirClick(Sender: TObject);
Var Posicao : Pointer;
begin
  if not DM.UsuarioLogado.TemPermissao( 2018, npExcluir, True ) then Exit;
   
  if Mensagem( 'Deseja retirar a parcela de protesto ?', Application.Title,
               MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
      { Alterar a situacao para pendente }
       qryUpdate.Close;

       qryUpdate.SQL.Clear;

       //Verifica se a conexão é Oracle ou MySQL
       if qryUpdate.Connection.Protocol = 'oracle' then //Oracle
       begin
         qryUpdate.SQL.Text := '' +
            ' MERGE INTO mensalidades m USING ' +
            ' (SELECT ' +
            '    m.cd_mensalidade AS cd_mensalidade ' +
            '  FROM                ' +
            '    mensalidades m,                ' +
            '    situacoes_financeiras s        ' +
            '  WHERE ' +
            '    m.situacao = s.cd_situacao AND ' +
            '    m.cd_mensalidade = ' + tblApresentaEmProtestocd_mensalidade.AsString + ' AND ' +
            '    s.sn_protesto = 1) m2 ON (m.cd_mensalidade = m2.cd_mensalidade) ' +
            ' WHEN MATCHED THEN ' +
            '  UPDATE SET m.situacao = 2 ';
         qryUpdate.ExecSQL();
       end else begin
         qryUpdate.SQL.Text := '' +
            ' UPDATE mensalidades m ' +
            ' INNER JOIN situacoes_financeiras s ' +
            '    ON (m.situacao = s.cd_situacao) ' +
            ' SET situacao = 2                   ' +
            ' WHERE m.cd_mensalidade = ' + tblApresentaEmProtestocd_mensalidade.AsString +
            '   AND s.sn_protesto = 1 ';

         qryUpdate.ExecSQL();
       end;

       { Remover da tabela de Protestos }

       qryUpdate.Close;
       qryUpdate.SQL.Clear;

       qryUpdate.SQL.Text := '' +
         ' DELETE FROM EmProtesto   ' +
         ' WHERE cd_mensalidade = ' + tblApresentaEmProtestocd_mensalidade.AsString;
       qryUpdate.ExecSQL();

       Posicao := tblApresentaEmProtesto.GetBookmark();
       tblApresentaEmProtesto.Close;
       tblApresentaEmProtesto.Open;
       if tblApresentaEmProtesto.BookmarkValid(Posicao) then begin
          tblApresentaEmProtesto.GotoBookmark(Posicao);
       end else begin
          tblApresentaEmProtesto.Last();
       end;            

  end;
end;

procedure TfrmEmProtesto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5 : btnExcluirClick( nil );
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmEmProtesto.Filtrar;
begin
   tblApresentaEmProtesto.Close;

   tblApresentaEmProtesto.SQL.Text := Format(
   'SELECT '+
      'emp.codigoaluno, '+
      'emp.parcela, '+
      'emp.datavencimento, '+
      'emp.turma, '+
      'emp.valor, '+
      'emp.dataemissao, '+
      'emp.usuario, '+
      'emp.gerado, '+
      'emp.nossonumero, '+
      'emp.cd_mensalidade, '+
      'COALESCE(m.ds_historico, '''') ds_historico, '+
      '(CASE WHEN M.cd_mensalidade IS NULL THEN 0 ' +
      '      ELSE GET_ACRESCIMOS(M.cd_mensalidade, NULL) '+
	   ' END) juros, '+
      'p.nm_pessoa '+
   'FROM '+
      'emprotesto emp '+
         'JOIN pessoas p ON (emp.codigoaluno = p.cd_pessoa) '+
         'LEFT JOIN mensalidades m ON (emp.cd_mensalidade = m.cd_mensalidade) ' +
         'LEFT JOIN turmas t ON ( t.codigo = m.turma AND t.anosemestre = m.anosemestre ) ' +
   'WHERE ( t.codigo IS NULL OR t.cd_coligada IN ( %s ) ) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);

   if tcProtestos.TabIndex > 0 then
   begin
      tblApresentaEmProtesto.SQL.Add('AND m.situacao = ' + IntToStr(SitProtestos[tcProtestos.TabIndex]));
   end;

   if sbSelecionado.Down  then
   begin
      tblApresentaEmProtesto.SQL.Add('AND p.cd_pessoa = ' + IntToStr(iAlunoSelecionado));
   end;

  tblApresentaEmProtesto.SQL.Add( 'ORDER BY p.nm_pessoa ');

  tblApresentaEmProtesto.Open;
end;

procedure TfrmEmProtesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmEmProtesto.FormCreate(Sender: TObject);
begin
   DM.MontarPlanilha(Self.grd, 'planilha_protestos_campos');
end;

procedure TfrmEmProtesto.btnImprimirClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('repMensalidadesEmProtesto');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   if(sbSelecionado.Down) then
   begin

      //imprime somente o aluno selecionado
      PrincipalForm.ImprimeRpt(Self, sNomeRelatorio,-1,'{pessoas.cd_pessoa} = '+IntToStr(iAlunoSelecionado),'',nil,nil,nil,nil,True, False, nil, PodeExportar);
   end
   else
   begin
      //imprime todos
      PrincipalForm.ImprimeRpt(Self, sNomeRelatorio,-1,'','',nil,nil,nil,nil,True, False, nil, PodeExportar);
   end;

end;

procedure TfrmEmProtesto.pmQtdPopup(Sender: TObject);
begin

  DM.quantidade_registros(tblApresentaEmProtesto, pmQtd);

end;

procedure TfrmEmProtesto.sbSelecionadoClick(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmEmProtesto.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(Self.grd, 'planilha_protestos_campos');
end;

procedure TfrmEmProtesto.sbTodosClick(Sender: TObject);
begin

   Filtrar();
end;

end.

