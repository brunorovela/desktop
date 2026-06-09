unit uMonografias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ExtCtrls, DB, ZConnection, Grids, DBGrids,
  Buttons, StdCtrls, Mask, general, Main, Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset;

type
  TformMonografias = class(TForm)
    Panel1: TPanel;
    ImageList2: TImageList;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    dsMonografia: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnAluno: TSpeedButton;
    txtAnoSemestre: TMaskEdit;
    UpDownCursos: TUpDown;
    ckAnoSemestre: TCheckBox;
    qyMonografias: TUMZQuery;
    btnTurmas: TSpeedButton;
    popFicha: TPopupMenu;
    PorAluno1: TMenuItem;
    PorTurma1: TMenuItem;
    qryPessoas: TUMZQuery;
    dsPessoas: TDataSource;
    qyMonografiascd_turma: TStringField;
    qyMonografiascd_curso: TStringField;
    qyMonografiasnr_anosemestre: TIntegerField;
    qyMonografiascd_aceitou: TSmallintField;
    qyMonografiascd_situacao: TIntegerField;
    qyMonografiascd_forma_entrega: TIntegerField;
    qyMonografiasvl_pago: TFloatField;
    qyMonografiasdt_inicio: TDateField;
    qyMonografiasdt_entrega: TDateField;
    qyMonografiasdt_pag_orientador: TDateField;
    qyMonografiasds_nota_conceito: TStringField;
    qrySituacoes: TUMZQuery;
    dsSituacoes: TDataSource;
    qrySituacoescd_situacao: TIntegerField;
    qrySituacoesds_situacao: TStringField;
    qrySituacoesds_sigla_situacao: TStringField;
    qyMonografiasds_situacao: TStringField;
    dsSituacoesMonografias: TDataSource;
    qrySituacoesMonografias: TUMZQuery;
    qrySituacoesMonografiascd_situacao: TIntegerField;
    qrySituacoesMonografiasds_situacao: TStringField;
    qyMonografiasds_monografia_situacao: TStringField;
    qryFormaEnvio: TUMZQuery;
    dsFormaEnvio: TDataSource;
    qryFormaEnviocd_forma_entrega: TIntegerField;
    qryFormaEnviods_forma_envio: TStringField;
    qyMonografiasds_forma_envioo: TStringField;
    dsAreas: TDataSource;
    qryAreas: TUMZQuery;
    qryAreascd_area: TIntegerField;
    qryAreasds_area: TStringField;
    qyMonografiasds_area: TStringField;
    qyMonografiasds_tema: TMemoField;
    qyMonografiasds_ideia_inicial: TMemoField;
    qyMonografiasds_observacao: TMemoField;
    qyMonografiassn_indicacao: TSmallintField;
    qryCursos: TUMZQuery;
    dsCursos: TDataSource;
    qyMonografiasds_curso_codigo: TStringField;
    qyMonografiasds_pessoa_nome: TStringField;
    sbtTodos: TSpeedButton;
    qyMonografiasdt_envio_professor: TDateField;
    qyMonografiasdt_retorno_professor: TDateField;
    qyMonografiasdt_certificado: TDateField;
    qyMonografiasdt_aprovacao: TDateField;
    qyMonografiasdt_impressao_monografia: TDateField;
    qyMonografiasds_taxa: TStringField;
    qyMonografiasds_formato_cd: TStringField;
    qyMonografiascd_monografia: TLargeintField;
    qyMonografiascd_pessoa: TIntegerField;
    qyMonografiascd_area: TIntegerField;
    qyMonografiascd_orientador: TIntegerField;
    qryPessoascd_pessoa: TIntegerField;
    qryPessoasnm_pessoa: TStringField;
    qryOrientador: TUMZQuery;
    qryOrientadorcd_pessoa: TIntegerField;
    qryOrientadornm_pessoa: TStringField;
    qyMonografiasnm_pessoa: TStringField;
    qyMonografiasnm_orientador: TStringField;
    qryCursoscodigo: TStringField;
    qryCursosdescricao: TStringField;
    qyMonografiasdt_solicitacao_certificado: TDateField;
    qyMonografiasdt_recebimento_certificado: TDateField;
    qyMonografiasdt_recebimento_ata: TDateField;
    qyMonografiasdt_recebimento_artigo: TDateField;
    qyMonografiascd_unidade_certificadora: TIntegerField;
    procedure qyMonografiasCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbtTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTurmasClick(Sender: TObject);
    procedure ckAnoSemestreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure btnAlunoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure filtrar(bFiltroTodos : Boolean);
  private
    { Private declarations }
    lngCodigoAluno :Longint;
    lngCodigoTurma :string;
  public
    { Public declarations }
  end;

var
  formMonografias: TformMonografias;
const
   curAUTOREFETCH = $00050017;
implementation

uses uUsuario, uDM, uCadMonografias, uFSelecionarPessoa, uFSelecionarTurma, bde;

{$R *.dfm}


procedure TformMonografias.filtrar(bFiltroTodos : Boolean);
var
lugar : Pointer;
sFiltro,sOp :string;
begin
   if ((bFiltroTodos = false) and (lngCodigoAluno <> 0 ) and (lngCodigoTurma <> '')) or (bFiltroTodos = True) then
   begin
      if (not qyMonografias.EOF) AND (qyMonografias.Active) then begin
         lugar := qyMonografias.GetBookmark()
      end else begin
         lugar := nil;
      end;


      sFiltro := '';
      sOp := ' WHERE ';

      qyMonografias.Close();
      qyMonografias.SQL.Clear;
      qyMonografias.SQL.Text :=  '  SELECT   '+
                                 '    m.*      '+
                                 '  FROM     '+
                                 '    monografias m ' +
                                 ' INNER JOIN turmas t ON (t.codigo = m.cd_turma and m.nr_anosemestre = t.anosemestre AND t.cd_coligada in (' + Dm.GetColigadas() + ') ) ';

      if ckAnoSemestre.Checked then begin
         sFiltro := sFiltro + sOp + ' ( m.nr_anosemestre = '+ txtAnoSemestre.Text+') ';
         sOp := ' AND ';
      end;

      qyMonografias.SQL.Add(sFiltro);

      if (popFicha.Items[0].Checked) and (lngCodigoAluno <> 0) then
      begin
         qyMonografias.SQL.Add( sOp+' (m.cd_pessoa = :cd_pessoa)');
         qyMonografias.ParamByName('cd_pessoa').AsInteger := lngCodigoAluno;
         sOp := ' AND ';
      end;

      if (popFicha.Items[1].Checked) and (lngCodigoTurma <> '') then
      begin
         qyMonografias.SQL.Add( sOp+' (m.cd_turma = :cd_turma)');
         qyMonografias.ParamByName('cd_turma').AsString := lngCodigoTurma;
         sOp := ' AND ';
      end;


      qyMonografias.SQL.Add(' ORDER BY m.dt_inicio');


      qyMonografias.Open();


      // DbiSetProp(hDbiObj(qyMonografias.Handle), curAUTOREFETCH, Longint(TRUE));



      if (lugar <> nil) AND (qyMonografias.BookmarkValid(lugar)) then begin
         qyMonografias.GotoBookmark(lugar);
      end;
   end;
end;

procedure TformMonografias.btnAlterarClick(Sender: TObject);
begin
//alterar
  if not DM.UsuarioLogado.TemPermissao( 1152, npAlterar, True ) then Exit;

   if(qyMonografiascd_monografia.AsInteger = 0) then  Exit;

   Application.CreateForm(TformCadMonografias, formCadMonografias);

   qyMonografias.Edit();
   formCadMonografias.ShowModal;
   Filtrar(true);
end;

procedure TformMonografias.btnAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   //FILTRA POR ALUNO
   popFicha.Items[1].Checked := False;
   popFicha.Items[0].Checked := True;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
     lngCodigoAluno := resultado_filtro.cd_pessoa;
   end
   else Exit;

   filtrar(true);
end;

procedure TformMonografias.btnCancelarClick(Sender: TObject);
begin
//cancelar
qyMonografias.Cancel;
end;

procedure TformMonografias.btnExcluirClick(Sender: TObject);
begin
//deletar
  if not DM.UsuarioLogado.TemPermissao( 1152, npExcluir, True ) then     Exit;

  if(qyMonografiascd_monografia.AsInteger = 0) then  Exit;

   if Mensagem('Deseja realmente excluir as informações da monografia selecionada?','Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes
   then begin
      //qyMonografias.RequestLive := true;
      qyMonografias.Delete();
      //qyMonografias.RequestLive := false;
      filtrar(true);

   end;
end;

procedure TformMonografias.btnIncluirClick(Sender: TObject);
begin
//incluir
  if not DM.UsuarioLogado.TemPermissao( 1152, npIncluir, True ) then Exit;


   Application.CreateForm(TformCadMonografias, formCadMonografias);
   DBGrid1.DataSource := nil;
   if dm.db.Protocol = DB_PROTOCOL_MYSQL then
   begin
      qyMonografias.SQL.Text := 'SELECT * FROM monografias limit 1';
   end
   else
   begin
      qyMonografias.SQL.Text := 'SELECT * FROM monografias WHERE rownum <= 1';   
   end;
   qyMonografias.Close;
   qyMonografias.Open;
   qyMonografias.Insert();
   qyMonografiasdt_inicio.AsString := DateToStr(DataHoje);
   formCadMonografias.ShowModal;
   DBGrid1.DataSource := dsMonografia;
   qyMonografias.Close;
   Filtrar(false);
end;

procedure TformMonografias.btnSairClick(Sender: TObject);
begin
//fechar
   close();
end;

procedure TformMonografias.btnSalvarClick(Sender: TObject);
begin
//salvar
end;


procedure TformMonografias.btnTurmasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   popFicha.Items[1].Checked := True;
   popFicha.Items[0].Checked := False;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);
  
   if not resultado_filtro.filtrado then Exit;

   lngCodigoTurma := resultado_filtro.cd_turma;
   filtrar(true);
end;

procedure TformMonografias.ckAnoSemestreClick(Sender: TObject);
begin
   filtrar(true);
end;


procedure TformMonografias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TformMonografias.FormCreate(Sender: TObject);
begin
  DM.Parametros_usuario(TForm(Sender));
  if txtAnoSemestre.text = '' then begin
      txtAnoSemestre.text := IntToStr(DM.GetAnoSemestreAtual);
  end;
end;


procedure TformMonografias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F2 : if btnIncluir.Enabled then btnIncluirClick( nil );
      VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
      VK_F8 : if btnAluno.Enabled then btnAlunoClick( nil );
      VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
      VK_F11 : if btnTurmas.Enabled then btnTurmasClick( nil );
      VK_F12 : if btnSair.Enabled then btnSairClick( nil );
   end;
end;

procedure TformMonografias.FormShow(Sender: TObject);
begin
   if not(DM.UsaAnosemestre) then
   begin
      ckAnoSemestre.Visible  := false;
      txtAnoSemestre.Visible := false;
      UpDownCursos.Visible := false;
   end;
end;

procedure TformMonografias.qyMonografiasCalcFields(DataSet: TDataSet);
begin
   qryPessoas.Close;
   qryPessoas.ParamByName('cd_pessoa').AsInteger := qyMonografiascd_pessoa.AsInteger;
   qryPessoas.Open;
   qryOrientador.Close;
   qryOrientador.ParamByName('cd_orientador').AsInteger := qyMonografiascd_orientador.AsInteger;
   qryOrientador.Open;
   qyMonografiasnm_pessoa.AsString := qryPessoasnm_pessoa.AsString;
   qyMonografiasnm_orientador.AsString := qryOrientadornm_pessoa.AsString;
end;

procedure TformMonografias.sbtTodosClick(Sender: TObject);
begin
  popFicha.Items[1].Checked := False;
  popFicha.Items[0].Checked := False;
  ckAnoSemestre.Checked := False;
  Filtrar(true);
end;

procedure TformMonografias.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    filtrar(true);
    Key := #0;
  end;
end;

procedure TformMonografias.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
  filtrar(true);
end;

end.

