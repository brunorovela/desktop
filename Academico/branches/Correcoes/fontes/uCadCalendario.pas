unit uCadCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, ComCtrls, Grids, DBGrids, SQLExpr,
  Provider, ZConnection, ImgList, ToolWin, StdCtrls, Mask,
  DBCtrls, Menus, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMLookupComboBox, UMComboBox, UMEditNumerico, DateUtils;

type
   TTipoGeracaoSemana = (tgsSabado, tgsDomingo, tgsSemana);

  TFrmCadCalendario = class(TForm)
    pnTitulo: TPanel;
    dsCadastro: TDataSource;
    Bevel1: TBevel;
    toolPessoa: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyCalendario: TUMZQuery;
    qyCalendarionr_dia: TSmallintField;
    qyCalendarionr_mes: TSmallintField;
    qyCalendarionr_ano: TSmallintField;
    qyCalendariosn_biblioteca: TStringField;
    qyCalendariosn_financeiro: TStringField;
    qyCalendariosn_secretaria: TStringField;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    sbJaneiro: TSpeedButton;
    sbFevereiro: TSpeedButton;
    sbMarco: TSpeedButton;
    sbAbril: TSpeedButton;
    sbMaio: TSpeedButton;
    sbJunho: TSpeedButton;
    sbJulho: TSpeedButton;
    sbAgosto: TSpeedButton;
    sbSetembro: TSpeedButton;
    sbOutubro: TSpeedButton;
    sbNovembro: TSpeedButton;
    sbDezembro: TSpeedButton;
    edAno: TEdit;
    UpDown1: TUpDown;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    btnSabado: TToolButton;
    btnDomingo: TToolButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    rgSecretaria: TDBRadioGroup;
    rgFinanceiro: TDBRadioGroup;
    qyCalendariosn_biblioteca2: TStringField;
    qyCalendarioX_secretaria: TStringField;
    qyCalendarioX_financeiro: TStringField;
    pmQtd: TPopupMenu;
    btnSemana: TToolButton;
    qyCalendarioCD_COLIGADA: TIntegerField;
    GroupBox1: TGroupBox;
    UMLookupComboBox1: TUMLookupComboBox;
    sbColigada: TSpeedButton;
    qyColigadas: TUMZQuery;
    qyColigadascd_coligada: TIntegerField;
    qyColigadasnm_coligada: TStringField;
    qyColigadasnm_razao_social: TStringField;
    qyColigadasds_cnpj: TStringField;
    qyColigadascd_municipio: TLargeintField;
    qyColigadascd_escola: TLargeintField;
    qyColigadascd_unidade_rede: TLargeintField;
    qyColigadassn_academico: TIntegerField;
    qyColigadassn_financeiro: TIntegerField;
    qyColigadasds_codcliente: TStringField;
    qyColigadasnm_diretor_geral: TStringField;
    qyColigadasnm_diretor_acad: TStringField;
    qyColigadasnm_diretor_finan: TStringField;
    qyColigadasnm_testemunha1: TStringField;
    qyColigadasnm_testemunha2: TStringField;
    qyColigadasds_cpf_geral: TStringField;
    qyColigadasds_cpf_acad: TStringField;
    qyColigadasds_cpf_finan: TStringField;
    qyColigadasds_cpf_test1: TStringField;
    qyColigadasds_cpf_test2: TStringField;
    qyColigadasme_instituicao: TStringField;
    qyColigadasme_diretor: TStringField;
    qyColigadasds_cidade: TStringField;
    qyColigadasSN_MATRIZ: TSmallintField;
    qyColigadasCD_COLIGADA_MATRIZ: TIntegerField;
    qyColigadasds_estado: TStringField;
    qyColigadascd_instituicao_mec: TIntegerField;
    qyColigadasds_endereco: TStringField;
    qyColigadasds_numero: TStringField;
    qyColigadasds_complemento: TStringField;
    qyColigadasds_bairro: TStringField;
    qyColigadasds_cep: TStringField;
    qyColigadasds_email_geral: TStringField;
    qyColigadasds_latitude: TStringField;
    qyColigadasds_longitude: TStringField;
    qyColigadasds_nre: TStringField;
    qyColigadasds_ato_direto: TStringField;
    qyColigadasme_secretaria: TStringField;
    qyColigadasds_ato_secretaria: TStringField;
    qyColigadasds_ato_ofic_estab: TStringField;
    qyCalendarionm_coligada: TStringField;
    qryCategorias: TUMZQuery;
    dsCategorias: TDataSource;
    tbCategoria: TToolBar;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    qyCalendariocd_categoria: TIntegerField;
    qyCalendariodt_alteracao: TDateTimeField;
    qyCalendariocd_calendario: TIntegerField;
    qryCategoriascd_categoria: TIntegerField;
    qryCategoriasds_categoria: TStringField;
    qryCategoriasds_cor: TStringField;
    qryCalendarioEventos: TUMZQuery;
    qryCalendarioEventoscd_calendario: TIntegerField;
    qryCalendarioEventoscd_evento: TIntegerField;
    qryCalendarioEventosds_descricao: TStringField;
    qryCalendarioEventosdt_alteracao: TDateTimeField;
    dsEventos: TDataSource;
    cbCategorias: TUMComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qyCalendariods_descricao: TStringField;
    qyCalendariocd_evento: TSmallintField;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    qryCalendarioEventoshr_inicio: TTimeField;
    qryCalendarioEventoshr_fim: TTimeField;
    qyCalendariohr_inicio: TTimeField;
    qyCalendariohr_fim: TTimeField;
    procedure qyCalendarioAfterClose(DataSet: TDataSet);
    procedure qyCalendarioAfterOpen(DataSet: TDataSet);
    procedure qyCalendarioAfterEdit(DataSet: TDataSet);
    procedure cbCategoriasChange(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure qyCalendarioAfterCancel(DataSet: TDataSet);
    procedure qyCalendarioAfterPost(DataSet: TDataSet);
    procedure qyCalendarioBeforeEdit(DataSet: TDataSet);
    procedure qyCalendarioBeforeInsert(DataSet: TDataSet);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure btnSemanaClick(Sender: TObject);
    procedure sbColigadaClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure AtualizaMes(Opcao: integer);
    procedure CadastraDiaDaSemana(DiaDaSemana: TTipoGeracaoSemana; const salvar: Boolean = False);
    procedure sbJaneiroClick(Sender: TObject);
    procedure sbFevereiroClick(Sender: TObject);
    procedure sbMarcoClick(Sender: TObject);
    procedure sbAbrilClick(Sender: TObject);
    procedure sbMaioClick(Sender: TObject);
    procedure sbJunhoClick(Sender: TObject);
    procedure sbJulhoClick(Sender: TObject);
    procedure sbAgostoClick(Sender: TObject);
    procedure sbSetembroClick(Sender: TObject);
    procedure sbOutubroClick(Sender: TObject);
    procedure sbNovembroClick(Sender: TObject);
    procedure sbDezembroClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure qyCalendarioCalcFields(DataSet: TDataSet);
    procedure qyCalendarioAfterInsert(DataSet: TDataSet);
    procedure btnSabadoClick(Sender: TObject);
    procedure btnDomingoClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  strict private
      procedure CarregarCalendario(const nr_ano: String = ''; const nr_mes: Integer = -1);
      procedure carregaCategoria();
      procedure selecionaCategoria();
      function verificaCalendarioExistente():Integer;
      procedure atualizaCalendario(cd_calendario:integer);
      function inserirCalendario():Integer;
  private
    { Private declarations }
  public
    { Public declarations }
    Mes : integer;
  end;

var
  FrmCadCalendario: TFrmCadCalendario;
  Coluna : Integer;

implementation

uses Main, uDM, StrUtils, uItemCombo, uListaColigadas, uColigada,
   uFSelecionarColigada,uFCadastroCategoriasCalendario;

{$R *.dfm}

procedure TFrmCadCalendario.atualizaCalendario(cd_calendario:integer);
const
   SQL_ATUALIZA_CALENDARIO =
   ' UPDATE '
    + ' calendario '
    + ' SET '
    + '   nr_dia = :nr_dia, '
    + '   SN_BIBLIOTECA = :biblioteca, '
    + '   SN_FINANCEIRO = :financeiro, '
    + '   SN_SECRETARIA = :secretaria, '
    + '   cd_categoria = :categoria, '
    + '   dt_alteracao = now() '
    + ' WHERE '
    + ' cd_calendario = :calendario';
var
   qyAtualizaCalendario : TUMZQuery;
   dia_semana_atual : String;
   data : TDateTime;
begin
   DM.CriarConsulta(qyAtualizaCalendario);

   qyAtualizaCalendario.SQL.Add(SQL_ATUALIZA_CALENDARIO);
   qyAtualizaCalendario.ParamByName('biblioteca').AsString := qyCalendariosn_biblioteca.AsString;
   qyAtualizaCalendario.ParamByName('financeiro').AsString := qyCalendariosn_financeiro.AsString;
   qyAtualizaCalendario.ParamByName('secretaria').AsString := qyCalendariosn_secretaria.AsString;
   qyAtualizaCalendario.ParamByName('categoria').AsInteger := qyCalendariocd_categoria.AsInteger;
   qyAtualizaCalendario.ParamByName('nr_dia').AsInteger := StrToInt(DBEdit1.Text);
   qyAtualizaCalendario.ParamByName('calendario').AsInteger := cd_calendario;
   qyAtualizaCalendario.ExecSQL;

   FreeAndNil(qyAtualizaCalendario);
end;

procedure TFrmCadCalendario.AtualizaMes(Opcao: integer);
var
   ListaComponentes : array[1..12] of TSpeedButton;
   I : Integer;
begin
   ListaComponentes[1] := sbJaneiro;
   ListaComponentes[2] := sbFevereiro;
   ListaComponentes[3] := sbMarco;
   ListaComponentes[4] := sbAbril;
   ListaComponentes[5] := sbMaio;
   ListaComponentes[6] := sbJunho;
   ListaComponentes[7] := sbJulho;
   ListaComponentes[8] := sbAgosto;
   ListaComponentes[9] := sbSetembro;
   ListaComponentes[10] := sbOutubro;
   ListaComponentes[11] := sbNovembro;
   ListaComponentes[12] := sbDezembro; 

   for I := 1 to 12 do
      ListaComponentes[I].Font.Style := [];

   ListaComponentes[Opcao].Font.Style := [fsBold];

   CarregarCalendario(edAno.Text, Opcao);
end;

procedure TFrmCadCalendario.CadastraDiaDaSemana(DiaDaSemana: TTipoGeracaoSemana; const salvar: Boolean);
   procedure InserirDataCalendario(const dia, cd_coligada: Integer; const dia_semana: String;mes,ano:integer);
   const
   SQL_ATUALIZA_CALENDARIO =
      'INSERT IGNORE INTO calendario ('+
      '   nr_dia,nr_mes,nr_ano,sn_biblioteca,sn_financeiro,sn_secretaria,cd_coligada,dt_alteracao'+
      ')'+
      'VALUES ('+
      '     :nr_dia,:nr_mes,:nr_ano,:sn_biblioteca,:sn_financeiro,:sn_secretaria,:cd_coligada,now()'+
      ');';
   var
      dia_semana_atual : String;
      data : TDateTime;
      qyAtualizaCalendario : TUMZQuery;
      cd_calendario : integer;
      sn_biblioteca,sn_secretaria,sn_financeiro:string;
   begin
      dia_semana_atual := IntToStr(dia)+'/'+IntToStr(Mes)+'/'+edAno.Text;
      if not TryStrToDate(dia_semana_atual, data) then
         Exit;

      dia_semana_atual := FormatDateTime('dddd', data);

      if (
            ( ( dia_semana = 'Semana' ) AND ( dia_semana_atual <> 'Sábado' ) AND ( dia_semana_atual <> 'Domingo' ) ) OR
            ( dia_semana_atual = dia_semana )
         ) = false then
      begin
         exit;
      end;
      
      DM.CriarConsulta(qyAtualizaCalendario);
      qyAtualizaCalendario.SQL.Add(SQL_ATUALIZA_CALENDARIO);

      sn_biblioteca := 'S';
      sn_secretaria := 'S';
      sn_financeiro := 'S';

      if ( dia_semana <> 'Semana' ) then
      begin
         if dia_semana = 'Sábado' then
            sn_biblioteca := MidStr(DM.variavel_parametro('expediente_biblioteca'),9,1)
         else if dia_semana = 'Domingo' then
            sn_biblioteca:= RightStr(DM.variavel_parametro('expediente_biblioteca'),1);

         if dia_semana = 'Sábado' then
            sn_secretaria := MidStr(DM.variavel_parametro('expediente_secretaria'),9,1)
         else if dia_semana = 'Domingo' then
            sn_secretaria := RightStr(DM.variavel_parametro('expediente_secretaria'),1);

         if dia_semana = 'Sábado' then
            sn_financeiro := MidStr(DM.variavel_parametro('expediente_financeiro'),9,1)
         else if dia_semana = 'Domingo' then
            sn_financeiro:= RightStr(DM.variavel_parametro('expediente_financeiro'),1);
      end;

      qyAtualizaCalendario.ParamByName('sn_biblioteca').AsString := sn_biblioteca;
      qyAtualizaCalendario.ParamByName('sn_financeiro').AsString := sn_financeiro;
      qyAtualizaCalendario.ParamByName('sn_secretaria').AsString := sn_secretaria;
      qyAtualizaCalendario.ParamByName('nr_mes').AsInteger := mes;
      qyAtualizaCalendario.ParamByName('nr_dia').AsString := FormatDateTime('dd', data);
      qyAtualizaCalendario.ParamByName('nr_ano').AsInteger := ano;
      qyAtualizaCalendario.ParamByName('cd_coligada').AsInteger := cd_coligada;
      qyAtualizaCalendario.ExecSQL;

      if Dm.LastInsert <> 0 then
      begin;

         qryCalendarioEventos.Insert;
         qryCalendarioEventosds_descricao.AsString := dia_semana_atual;
         qryCalendarioEventosdt_alteracao.AsDateTime := dm.DataAtual;
         qryCalendarioEventoshr_inicio.AsString := '00:00:00';
         qryCalendarioEventoshr_fim.AsString := '00:00:00';
         qryCalendarioEventoscd_calendario.AsInteger := Dm.LastInsert;
         qryCalendarioEventos.Post;
      end;

      FreeAndNil(qyAtualizaCalendario);
   end;
var
   cd_coligada, i, j : Integer;
   ListaColigadasFilhas : TListaColigadas;
   mes,ano:integer;
begin

   if not salvar then
   begin
      if DiaDaSemana = tgsSabado then
         btnSabado.Tag := 1
      else if DiaDaSemana = tgsDomingo then
         btnDomingo.Tag := 1
      else if DiaDaSemana = tgsSemana then
         btnSemana.Tag := 1;

      UMLookupComboBox1.SetFocus();
      qyCalendario.Insert;

      CadastraDiaDaSemana(DiaDaSemana, True);
      Exit;
   end;

   { Se chegou aqui, então vamos salvar o dia da Semana escolhido }
   cd_coligada := qyCalendarioCD_COLIGADA.AsInteger;


   if cd_coligada = 0 then
   begin
      cd_coligada := dm.UsuarioLogado.ColigadaLogada;
   end;

   if ( DiaDaSemana = tgsSemana ) AND
      ( Mensagem('Deseja preencher os demais dias da semana com expediente?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes ) then
   begin
      qyCalendario.Cancel;
      Exit;
   end;

   mes := qyCalendarionr_mes.AsInteger;
   ano := qyCalendarionr_ano.AsInteger;
   qyCalendario.Cancel();

   ListaColigadasFilhas := DM.UsuarioLogado.GetListaColigadasFilhaSelecionada();
   for j := 0 to ListaColigadasFilhas.Count - 1 do
   begin

      for i := 1 to 31 do
      begin
         if DiaDaSemana = tgsSabado then
            InserirDataCalendario(i, ListaColigadasFilhas.Items[j].Codigo, 'Sábado',mes,ano)
         else if DiaDaSemana = tgsDomingo then
            InserirDataCalendario(i, ListaColigadasFilhas.Items[j].Codigo, 'Domingo',mes,ano)
         else if DiaDaSemana = tgsSemana then
            InserirDataCalendario(i, ListaColigadasFilhas.Items[j].Codigo, 'Semana',mes,ano);
      end;

      Application.ProcessMessages;
   end;

   qyCalendario.Close();
   qyCalendario.Open();
end;


procedure TFrmCadCalendario.carregaCategoria;
begin
   qryCategorias.Close;
   qryCategorias.Open;

   cbCategorias.Items.Clear;
   cbCategorias.AddItem('Selecione', nil);
   cbCategorias.ItemIndex := 0;

   qryCategorias.First;
   while not qryCategorias.Eof do
   begin
      cbCategorias.AddItem(
         qryCategoriasds_categoria.AsString,
         TItemCombo.Create(
            qryCategoriascd_categoria.AsString,
            qryCategoriasds_categoria.AsString
         )
      );
      qryCategorias.Next;
   end;
end;

procedure TFrmCadCalendario.CarregarCalendario(const nr_ano: String; const nr_mes: Integer);
const
   SQL_CALENDARIO =
   'SELECT '+
   '  c.nr_dia, '+
   '  c.nr_mes, '+
   '  c.nr_ano, '+
   '  c.sn_biblioteca, '+
   '  c.sn_financeiro, '+
   '  c.sn_secretaria, '+
   '  c.cd_coligada, '+
   '  c.cd_calendario, '+
   '  c.dt_alteracao, '+
   '  c.cd_categoria, '+
   '  u.ds_descricao, '+
   '  u.hr_inicio, '+
   '  u.hr_fim, '+
   '  u.cd_evento '+
   'FROM '+
   '  calendario c '+
   'LEFT JOIN unim_calendario_eventos u ON (u.cd_calendario = c.cd_calendario) '+
   'WHERE c.cd_coligada IN ( %s ) ';
   SQL_CALENDARIO_ORDER =
      ' ORDER BY c.nr_dia ';
begin
   if True then

   qyCalendario.Close;
   qyCalendario.SQL.Text := Format( SQL_CALENDARIO, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );

   if ( nr_ano <> '' ) AND ( nr_mes <> -1 ) then
   begin
      qyCalendario.SQL.Add('AND c.nr_ano = :nr_ano AND c.nr_mes = :nr_mes');
      qyCalendario.ParamByName('nr_ano').AsString := nr_ano;
      qyCalendario.ParamByName('nr_mes').AsInteger := nr_mes;
   end;

   qyCalendario.SQL.Add(SQL_CALENDARIO_ORDER);
   qyCalendario.Open;
end;

procedure TFrmCadCalendario.cbCategoriasChange(Sender: TObject);
begin
   if((cbCategorias.ItemIndex = -1) OR (TItemCombo(cbCategorias.Items.Objects[cbCategorias.ItemIndex]) = nil))then
   begin
      exit;
   end;
   qyCalendariocd_categoria.AsString := TItemCombo(cbCategorias.Items.Objects[cbCategorias.ItemIndex]).Codigo;
end;

procedure TFrmCadCalendario.btnAnteriorClick(Sender: TObject);
begin
   { Registro Anterior }
   dsCadastro.DataSet.Prior;
end;

procedure TFrmCadCalendario.btnProximoClick(Sender: TObject);
begin
   { Próximo Registro }
   dsCadastro.DataSet.Next;
end;

procedure TFrmCadCalendario.btnIncluirClick(Sender: TObject);
begin
   { Incluir um Novo Registro }
   PageControl1.ActivePageIndex := 0;
   qyCalendario.Insert;
   DBGrid1.Enabled := False;

   if qyColigadas.RecordCount = 1 then
   begin
      qyColigadas.First;
      qyCalendarioCD_COLIGADA.asInteger := qyColigadascd_coligada.asInteger;
   end;
end;

procedure TFrmCadCalendario.btnAlterarClick(Sender: TObject);
begin
   { Alterar o Registro Atual }
   PageControl1.ActivePageIndex := 0;
   dsCadastro.DataSet.Edit;
   DBGrid1.Enabled := False;
end;

procedure TFrmCadCalendario.btnExcluirClick(Sender: TObject);
const
   SQL_EXCLUI_EVENTO =
   'DELETE FROM unim_calendario_eventos WHERE cd_evento = :evento';
   SQL_EXCLUI_CALENDARIO =
   'DELETE FROM calendario WHERE cd_calendario = :calendario';
   SQL_ULTIMO_CALENDARIO =
   'SELECT cd_evento FROM unim_calendario_eventos WHERE cd_calendario = :calendario';
var
   qryExclui:TUMZQuery;
begin
   { Excluir o Registro Atual }
   if Mensagem('Excluir o Registro Atual',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrNo then
   Begin
      exit;
   End;

   dm.CriarConsulta(qryExclui);
   qryExclui.SQL.Add(SQL_EXCLUI_EVENTO);
   qryExclui.ParamByName('evento').AsString := qyCalendariocd_evento.AsString;
   qryExclui.ExecSQL;

   qryExclui.Close;
   qryExclui.SQL.Clear;
   qryExclui.SQL.Add(SQL_ULTIMO_CALENDARIO);
   qryExclui.ParamByName('calendario').AsString := qyCalendariocd_calendario.AsString;
   qryExclui.Open;

   if(qryExclui.RecordCount = 0) then
   begin
      qryExclui.Close;
      qryExclui.SQL.Clear;
      qryExclui.SQL.Add(SQL_EXCLUI_CALENDARIO);
      qryExclui.ParamByName('calendario').AsString := qyCalendariocd_calendario.AsString;
      qryExclui.ExecSQL;
   end;

   qyCalendario.Refresh;
   qryCalendarioEventos.Refresh;
end;

procedure TFrmCadCalendario.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
   if(qyCalendario.State = dsBrowse) then
   begin
      dtInicio.DateTime := qyCalendariohr_inicio.AsDateTime;
      dtFim.DateTime := qyCalendariohr_fim.AsDateTime;
   end;
   selecionaCategoria();
end;

procedure TFrmCadCalendario.dsCadastroStateChange(Sender: TObject);
var
   ativo, Edicao : Boolean;
begin
   ativo := True;

   if ( qyCalendario.State IN [dsInsert] ) AND
      ( ( btnSabado.Tag = 1 ) OR ( btnDomingo.Tag = 1 ) OR ( btnSemana.Tag = 1 ) ) then
   begin
      ativo := False;
   end;

   if ativo then
   begin
      btnSabado.Tag := 0;
      btnDomingo.Tag := 0;
      btnSemana.Tag := 0;
   end;

   Label2.Visible := ativo;
   Label3.Visible := ativo;
   DBEdit1.Visible := ativo;
   DBEdit2.Visible := ativo;
   rgSecretaria.Visible := ativo;
   rgFinanceiro.Visible := ativo;
   btnSabado.Enabled := ativo;
   btnDomingo.Enabled := ativo;
   btnSemana.Enabled := ativo;
   DBGrid1.Enabled := ativo;


   Edicao := dsCadastro.DataSet.State IN [dsInsert, dsEdit];

   btnIncluir.Enabled   := Not Edicao;
   btnAlterar.Enabled   := Not Edicao;
   btnExcluir.Enabled   := Not Edicao;
   btnSalvar.Enabled    := Edicao;
   btnCancelar.Enabled  := Edicao;
   btnFechar.Enabled    := Not Edicao;
   btnSabado.Enabled    := Not Edicao;
   btnDomingo.Enabled   := Not Edicao;
   btnSemana.Enabled    := Not Edicao;
end;

procedure TFrmCadCalendario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadCalendario.btnCancelarClick(Sender: TObject);
begin
   qyCalendario.Cancel;
end;

procedure TFrmCadCalendario.btnSalvarClick(Sender: TObject);
var
   valor : string;
   cd_calendario: Integer;
   cd_evento: integer;
   qtd_dias_mes : Word;
begin
   qyCalendariodt_alteracao.AsDateTime := dm.DataAtual;

   if ( btnSabado.Tag = 1 ) then
   begin
      CadastraDiaDaSemana(tgsSabado, True);
      Exit;
   end else if ( btnDomingo.Tag = 1 ) then
   begin
      CadastraDiaDaSemana(tgsDomingo, True);
      Exit;
   end else if ( btnSemana.Tag = 1 ) then
   begin
      CadastraDiaDaSemana(tgsSemana, True);
      Exit;
   end;

   if qyCalendarioCD_COLIGADA.AsInteger = 0 then
   begin
      Mensagem('Selecione uma Unidade de Ensino.');
      UMLookupComboBox1.SetFocus();
      Exit;
   end;

   if((DBEdit1.text = '') or (DBEdit2.text = ''))then
   begin
      Mensagem('Você precisa preencher todos os campos');
      Exit;
   end;

   qtd_dias_mes := DaysInAMonth(
      qyCalendarionr_ano.AsInteger,
      qyCalendarionr_mes.AsInteger
   );

   if((strtoint(DBEdit1.Text) <= 0) OR ( StrToInt(DBEdit1.Text) > qtd_dias_mes ))then
   begin
      Mensagem('Digite um dia válido!');
      DBEdit1.Clear;
      DBEdit1.SetFocus();
      Abort;
   end;

   DBEdit1.SetFocus;

   if(qyCalendario.State = dsInsert) then
   begin
      cd_calendario := verificaCalendarioExistente();
      //Novo calendário, não existia de fato, insere
      if (cd_calendario = 0) then
      begin
         cd_calendario :=  inserirCalendario();
      end else begin
         //Apenas atualiza o calendário existente
         atualizaCalendario(cd_calendario);
      end;
      
      qryCalendarioEventos.Insert;
      qryCalendarioEventoscd_calendario.AsInteger := cd_calendario;
      qryCalendarioEventosds_descricao.AsString := qyCalendariods_descricao.AsString;
      qryCalendarioEventosdt_alteracao.AsDateTime := dm.DataAtual;
      qryCalendarioEventoshr_inicio.AsDateTime := dtInicio.DateTime;
      qryCalendarioEventoshr_fim.AsDateTime := dtFim.DateTime;
      qryCalendarioEventos.Post;

      valor := inttostr(dm.LastInsert);

      qyCalendario.Cancel;
      qyCalendario.Refresh;
      qyCalendario.Locate('cd_evento',valor,[]);
      exit;
   end;

   //Atualiza o calendário existente
   atualizaCalendario(qyCalendariocd_calendario.AsInteger);

   //Atualiza o evento
   valor := qyCalendariocd_evento.AsString;
   qryCalendarioEventosds_descricao.AsString := qyCalendariods_descricao.AsString;
   qryCalendarioEventosdt_alteracao.AsDateTime := dm.DataAtual;
   qryCalendarioEventoshr_inicio.AsDateTime := dtInicio.DateTime;
   qryCalendarioEventoshr_fim.AsDateTime := dtFim.DateTime;
   qryCalendarioEventos.Post;

   //Recarrega
   qyCalendario.Cancel;
   qryCalendarioEventos.Cancel;
   qyCalendario.Refresh;
   qryCalendarioEventos.Refresh;

   qyCalendario.Locate('cd_evento',valor,[]);
end;

procedure TFrmCadCalendario.btnSemanaClick(Sender: TObject);
begin
   CadastraDiaDaSemana(tgsSemana);
end;

procedure TFrmCadCalendario.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCadCalendario.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   Height := 450;
   Width := 720;
   Left := 40;
   Top := 10;
   coluna := 0;

   edAno.Text := FormatDateTime('yyyy', DataHoje);
   Mes := StrToInt(FormatDateTime('MM', DataHoje));

   CarregarCalendario();

   AtualizaMes(Mes);

   carregaCategoria();
   Application.CreateForm( TformCategoriaCalendario, formCategoriaCalendario );
end;

function TFrmCadCalendario.inserirCalendario():integer;
const
   SQL_ATUALIZA_CALENDARIO =
   'INSERT INTO calendario ('+
   '   nr_dia,nr_mes,nr_ano,sn_biblioteca,sn_financeiro,sn_secretaria,cd_coligada,dt_alteracao,cd_categoria'+
   ')'+
   'VALUES ('+
   '     :nr_dia,:nr_mes,:nr_ano,:sn_biblioteca,:sn_financeiro,:sn_secretaria,:cd_coligada,now(),:cd_categoria'+
   ');';
var
   qyAtualizaCalendario : TUMZQuery;
   cd_calendario : integer;
begin
   DM.CriarConsulta(qyAtualizaCalendario);

   qyAtualizaCalendario.SQL.Add(SQL_ATUALIZA_CALENDARIO);
   qyAtualizaCalendario.ParamByName('sn_biblioteca').AsString := qyCalendariosn_biblioteca.AsString;
   qyAtualizaCalendario.ParamByName('sn_financeiro').AsString := qyCalendariosn_financeiro.AsString;
   qyAtualizaCalendario.ParamByName('sn_secretaria').AsString := qyCalendariosn_secretaria.AsString;
   qyAtualizaCalendario.ParamByName('cd_categoria').AsInteger := qyCalendariocd_categoria.AsInteger;
   qyAtualizaCalendario.ParamByName('nr_mes').AsInteger := qyCalendarionr_mes.AsInteger;
   qyAtualizaCalendario.ParamByName('nr_dia').AsInteger := strtoint(DBEdit1.Text);
   qyAtualizaCalendario.ParamByName('nr_ano').AsInteger := qyCalendarionr_ano.AsInteger;
   qyAtualizaCalendario.ParamByName('cd_coligada').AsInteger := qyCalendarioCD_COLIGADA.AsInteger;
   qyAtualizaCalendario.ExecSQL;

   FreeAndNil(qyAtualizaCalendario);

   result :=  dm.LastInsert;
end;

procedure TFrmCadCalendario.DBGrid1TitleClick(Column: TColumn);
Var
  sql : string;
begin
    { Destacar a coluna selecionada }
    DBGrid1.Columns[Coluna].Title.Font.Style := [];
    Coluna := Column.Index;
    DBGrid1.Columns[Coluna].Title.Font.Style := [fsbold,fsUnderline];
    { Alterar a Ordem de Classificação }
    DBGrid1.DataSource.DataSet.Close;
    sql := TUMZQuery(DBGrid1.DataSource.DataSet).SQL.Text;

    if Pos('ORDER BY', UPPERCASE(sql)) > 0 Then
       sql := copy(sql, 1, pos('ORDER BY',UPPERCASE(sql)) -1);

    //Caso seja por biblioteca
    if DBGrid1.Columns[coluna].FieldName = 'X_biblioteca' then
    begin
      sql := sql + ' Order by sn_biblioteca';
    end
    else//Caso seja por secretaria
    if DBGrid1.Columns[coluna].FieldName = 'X_secretaria' then
    begin
      sql := sql + ' Order by sn_secretaria';
    end
    else//Caso seja por financeiro
    if DBGrid1.Columns[coluna].FieldName = 'X_financeiro' then
    begin
      sql := sql + ' Order by sn_financeiro';
    end
    else//Caso seja por unidade
    if DBGrid1.Columns[coluna].FieldName = 'nm_coligada' then
    begin
      qyColigadas.Refresh;
      qyColigadas.First;
    end
    else//Demais campos
    begin
      sql := sql + ' Order by ' + DBGrid1.Columns[coluna].FieldName;
    end;

    TUMZQuery(DBGrid1.DataSource.DataSet).SQL.Text := sql;
    DBGrid1.DataSource.DataSet.open;
end;

procedure TFrmCadCalendario.btnConfirmarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   Close;
end;

procedure TFrmCadCalendario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btnIncluir.Enabled then btnIncluirClick( nil );   // Inclusão
      VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );   // Alteração
      VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );   // Excluir
      VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );     // Salvar
      VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil ); // Cancelar
      VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );    // Fechar
   end;
end;

procedure TFrmCadCalendario.btnImprimirClick(Sender: TObject);
begin
 //
end;

procedure TFrmCadCalendario.sbJaneiroClick(Sender: TObject);
begin
  Mes := 1;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbFevereiroClick(Sender: TObject);
begin
  Mes := 2;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbMarcoClick(Sender: TObject);
begin
  Mes := 3;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbAbrilClick(Sender: TObject);
begin
  Mes := 4;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbMaioClick(Sender: TObject);
begin
  Mes := 5;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbJunhoClick(Sender: TObject);
begin
  Mes := 6;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbJulhoClick(Sender: TObject);
begin
  Mes := 7;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbAgostoClick(Sender: TObject);
begin
  Mes := 8;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbColigadaClick(Sender: TObject);
begin
   if not TfrmSelecionarColigada.ShowModal() then Exit;

   if qyCalendario.RecordCount = 0 then
      qyCalendario.Insert();

   if not(qyCalendario.State IN [dsEdit, dsInsert]) then
      qyCalendario.Edit;

   qyCalendarioCD_COLIGADA.AsInteger := TfrmSelecionarColigada.getResultado.Codigo;
end;

procedure TFrmCadCalendario.sbSetembroClick(Sender: TObject);
begin
  Mes := 9;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.selecionaCategoria;
var
   index : Integer;
begin
   if(qryCategorias.State = dsInactive) then
   begin
      exit;
   end;

   index := 0;
   if(qyCalendariocd_categoria.AsInteger = 0)then
   begin
      cbCategorias.ItemIndex := index;
      exit;
   end;

   qryCategorias.First;
   while not qryCategorias.Eof do
   begin
      inc(index);
      if(qryCategoriascd_categoria.AsInteger = qyCalendariocd_categoria.AsInteger) then
      begin
         break;
      end;


      qryCategorias.Next;
   end;

   cbCategorias.ItemIndex := index;
end;

procedure TFrmCadCalendario.ToolButton7Click(Sender: TObject);
begin
   formCategoriaCalendario.cd_categoria := 0;
   formCategoriaCalendario.cd_calendario := 0;
   formCategoriaCalendario.modo := 1;
   formCategoriaCalendario.ShowModal;
   carregaCategoria();
   selecionaCategoria();
end;

procedure TFrmCadCalendario.ToolButton9Click(Sender: TObject);
begin
   formCategoriaCalendario.cd_categoria := qryCategoriascd_categoria.AsInteger;
   formCategoriaCalendario.cd_calendario := qyCalendariocd_calendario.AsInteger;
   formCategoriaCalendario.modo := 2;
   formCategoriaCalendario.ShowModal;
   carregaCategoria();
   selecionaCategoria();
end;

procedure TFrmCadCalendario.sbOutubroClick(Sender: TObject);
begin
  Mes := 10;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbNovembroClick(Sender: TObject);
begin
  Mes := 11;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.sbDezembroClick(Sender: TObject);
begin
  Mes := 12;
  AtualizaMes(Mes);
end;

procedure TFrmCadCalendario.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      edAno.Text := IntToStr(StrToInt(edAno.Text)+1);
   end else begin
      edAno.Text := IntToStr(StrToInt(edAno.Text)-1);
   end;

   AtualizaMes(Mes);
end;


function TFrmCadCalendario.verificaCalendarioExistente: Integer;
const
   SQL_BUSCA_CALENDARIO =
   'SELECT cd_calendario FROM calendario WHERE nr_dia = :dia AND nr_mes = :mes AND nr_ano = :ano AND cd_coligada = :coligada';
var
   qyCalendarioExistente : TUMZQuery;
   cd_calendario: Integer;
begin
   DM.CriarConsulta(qyCalendarioExistente);
   qyCalendarioExistente.SQL.Add(SQL_BUSCA_CALENDARIO);
   qyCalendarioExistente.ParamByName('dia').AsInteger := qyCalendarionr_dia.AsInteger;
   qyCalendarioExistente.ParamByName('mes').AsInteger := qyCalendarionr_mes.AsInteger;
   qyCalendarioExistente.ParamByName('ano').AsInteger := qyCalendarionr_ano.AsInteger;
   qyCalendarioExistente.ParamByName('coligada').AsInteger := qyCalendarioCD_COLIGADA.AsInteger;
   qyCalendarioExistente.Open;

   cd_calendario := 0;
   if(qyCalendarioExistente.RecordCount > 0) then
   begin
      cd_calendario := qyCalendarioExistente.FieldByName('cd_calendario').AsInteger;
   end;

   qyCalendarioExistente.Close;
   result := cd_calendario;
end;

procedure TFrmCadCalendario.qyCalendarioCalcFields(DataSet: TDataSet);
begin
   if qyCalendario.FieldByName('sn_biblioteca').AsString = 'N' then
      qyCalendario.FieldByName('X_biblioteca').AsString := 'X';

   if qyCalendario.FieldByName('sn_secretaria').AsString = 'N' then
      qyCalendario.FieldByName('X_secretaria').AsString := 'X';

   if qyCalendario.FieldByName('sn_financeiro').AsString = 'N' then
      qyCalendario.FieldByName('X_financeiro').AsString := 'X';
end;

procedure TFrmCadCalendario.qyCalendarioAfterCancel(DataSet: TDataSet);
begin
   cbCategorias.Enabled := false;
   tbCategoria.Enabled := false;
   dtInicio.Enabled := false;
   dtFim.Enabled := false;
   qryCalendarioEventos.Cancel;
end;

procedure TFrmCadCalendario.qyCalendarioAfterClose(DataSet: TDataSet);
begin
   qryCalendarioEventos.close;
end;

procedure TFrmCadCalendario.qyCalendarioAfterEdit(DataSet: TDataSet);
begin
   qryCalendarioEventos.Close;
   qryCalendarioEventos.ParamByName('calendario').AsInteger := qyCalendariocd_calendario.AsInteger;
   qryCalendarioEventos.ParamByName('cd_evento').AsInteger := qyCalendariocd_evento.AsInteger;
   qryCalendarioEventos.Open;
   qryCalendarioEventos.Edit;
end;

procedure TFrmCadCalendario.qyCalendarioAfterInsert(DataSet: TDataSet);
begin
   dsCadastro.DataSet.FieldByName('nr_mes').AsInteger := Mes;
   dsCadastro.DataSet.FieldByName('nr_ano').AsString := edAno.Text;
   dsCadastro.DataSet.FieldByName('sn_biblioteca').AsString := 'N';
   dsCadastro.DataSet.FieldByName('sn_secretaria').AsString := 'N';
   dsCadastro.DataSet.FieldByName('sn_financeiro').AsString := 'N';
   dtInicio.DateTime := 0;
   dtFim.DateTime := 0;


   if dm.qryColigadas.RecordCount = 1  then
   begin
      dm.qryColigadas.First();
      UMLookupComboBox1.KeyValue := dm.qryColigadasCD_COLIGADA.AsInteger;
   end;

   qryCalendarioEventos.Insert;
end;

procedure TFrmCadCalendario.qyCalendarioAfterOpen(DataSet: TDataSet);
begin
   qryCalendarioEventos.Close;
   qryCalendarioEventos.ParamByName('calendario').AsInteger := qyCalendariocd_calendario.AsInteger;
   qryCalendarioEventos.ParamByName('cd_evento').AsInteger := qyCalendariocd_evento.AsInteger;
   qryCalendarioEventos.Open;
end;

procedure TFrmCadCalendario.qyCalendarioAfterPost(DataSet: TDataSet);
begin
    cbCategorias.Enabled := false;
    tbCategoria.Enabled := false;
    dtInicio.Enabled := true;
    dtFim.Enabled := true;
end;

procedure TFrmCadCalendario.qyCalendarioBeforeEdit(DataSet: TDataSet);
begin
    cbCategorias.Enabled := true;
    tbCategoria.Enabled := true;
    dtInicio.Enabled := true;
    dtFim.Enabled := true;
end;

procedure TFrmCadCalendario.qyCalendarioBeforeInsert(DataSet: TDataSet);
begin
   cbCategorias.Enabled := true;
   tbCategoria.Enabled := true;
   dtInicio.Enabled := true;
   dtFim.Enabled := true;
end;

procedure TFrmCadCalendario.btnSabadoClick(Sender: TObject);
begin
   CadastraDiaDaSemana(tgsSabado);
end;

procedure TFrmCadCalendario.btnDomingoClick(Sender: TObject);
begin
   CadastraDiaDaSemana(tgsDomingo);
end;

procedure TFrmCadCalendario.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyCalendario, pmQtd);

end;

end.


