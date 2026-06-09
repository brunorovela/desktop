unit uPessoasInformacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DBCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, DB,
  ZConnection, general, StdCtrls, Buttons, ShellAPI, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, UMComboBox, Menus, dblookup;

type
  TfPessoasInformacoes = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    btIncluir: TToolButton;
    btAlterar: TToolButton;
    btExcluir: TToolButton;
    ToolButton4: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    DBGrid1: TDBGrid;
    qyPessoasInfo: TUMZQuery;
    dsPessoasInfo: TDataSource;
    qyPessoasInfods_informacao: TStringField;
    qyPessoasInfonm_pessoa: TStringField;
    qyPessoasInfods_contatos: TStringField;
    qyPessoasInfodt_informacao: TDateTimeField;
    qyPessoasInfocd_origem: TSmallintField;
    qyPessoasInfocd_turma: TStringField;
    Panel1: TPanel;
    edTurma: TEdit;
    btnCodigoTurma: TSpeedButton;
    qyPessoasInfods_telefone2: TStringField;
    qyPessoasInfods_email: TStringField;
    qyPessoasInfods_obs1: TStringField;
    qyPessoasInfods_obs2: TStringField;
    qyPessoasInfods_obs3: TStringField;
    qyPessoasInfods_origem: TStringField;
    qyPessoasInfocd_coligada: TIntegerField;
    qyPessoasInfonm_usuario: TStringField;
    btEnviarEmailTodos: TToolButton;
    btEnviarEmail: TToolButton;
    qryPessoasInfoFiltrar: TUMZQuery;
    dsPessoasInfoFiltrar: TDataSource;
    qryPessoasInfoFiltrards_informacao: TStringField;
    qryPessoasInfoFiltrarnm_pessoa: TStringField;
    qryPessoasInfoFiltrards_contatos: TStringField;
    qryPessoasInfoFiltrardt_informacao: TDateTimeField;
    qryPessoasInfoFiltrarcd_origem: TSmallintField;
    qryPessoasInfoFiltrarcd_turma: TStringField;
    qryPessoasInfoFiltrards_obs1: TStringField;
    qryPessoasInfoFiltrards_obs2: TStringField;
    qryPessoasInfoFiltrards_obs3: TStringField;
    qryPessoasInfoFiltrards_telefone2: TStringField;
    qryPessoasInfoFiltrards_email: TStringField;
    qryPessoasInfoFiltrarcd_coligada: TIntegerField;
    qryPessoasInfoFiltrarnm_usuario: TStringField;
    qyPessoasInfocd_informacao: TLargeintField;
    qryPessoasInfoFiltrarcd_informacao: TLargeintField;
    qryPessoasInfoFiltrarcd_pessoa: TLargeintField;
    qyPessoasInfocd_pessoa: TLargeintField;
    qyPessoasInfonm_coligada: TStringField;
    qyPessoasInfods_cidade: TStringField;
    qyPessoasInfods_uf: TStringField;
    qyPessoasInfods_estado: TStringField;
    qyEstados: TUMZQuery;
    qyEstadosds_uf: TStringField;
    dtEstados: TDataSource;
    qryPessoasInfoFiltrards_cidade: TStringField;
    qryPessoasInfoFiltrards_uf: TStringField;
    qyMunicipios: TUMZQuery;
    qyPessoasInfods_cidade_lk: TStringField;
    qyPessoasInfocd_conhecimento: TIntegerField;
    qyPessoasInfods_endereco: TStringField;
    qyPessoasInfods_telefone3: TStringField;
    qyPessoasInfods_telefone4: TStringField;
    qyPessoasInfods_curso: TStringField;
    qyPessoasInfodt_retorno: TDateTimeField;
    qyPessoasInfods_area_assunto: TStringField;
    dtMunicipios: TDataSource;
    Label1: TLabel;
    cbAreaAssuntoFiltro: TComboBox;
    GroupBox1: TGroupBox;
    dtFiltroFim: TDateTimePicker;
    lblAte: TLabel;
    dtFiltroInicio: TDateTimePicker;
    ckbData: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dtFimRetorno: TDateTimePicker;
    dtIniRetorno: TDateTimePicker;
    cbDataRetorno: TCheckBox;
    Label3: TLabel;
    Edit1: TEdit;
    sbCurso: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbMatricula: TComboBox;
    imgAnexo: TImageList;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    cbInfPor: TUMComboBox;
    pmContatos: TPopupMenu;
    pmOutrosFiltros: TPopupMenu;
    btContatosFiltros: TButton;
    btOutrosFiltros: TButton;
    qyPessoasInfods_obs4: TStringField;
    Label5: TLabel;
    Label8: TLabel;
    cbEstado: TComboBox;
    cbCidade: TComboBox;
    qyMunicipiosFiltro: TUMZQuery;
    procedure cbEstadoChange(Sender: TObject);
    procedure sbCursoClick(Sender: TObject);
    procedure btOutrosFiltrosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btContatosFiltrosClick(Sender: TObject);
    procedure contatosFiltra(Sender: TObject);
    procedure outrosFiltrosClick(Sender: TObject);
    procedure preencheContatosFiltro(Sender: TObject);
    procedure preencheOutrosFiltros(arrCamposObs: TStringList);
    procedure qyPessoasInfoAfterPost(DataSet: TDataSet);
    procedure qyPessoasInfoBeforeOpen(DataSet: TDataSet);
    procedure dsPessoasInfoFiltrarDataChange(Sender: TObject; Field: TField);
    procedure btEnviarEmailClick(Sender: TObject);
    procedure btEnviarEmailTodosClick(Sender: TObject);
    procedure qyPessoasInfoCalcFields(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ckbTurmaClick(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure ckbDataClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsPessoasInfoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    sOrdem : String;

    Function CountPos(const subtext: String; Text: String): Integer;
    function Subst(Text,NewChar,OldChar:String):String;
  public
    { Public declarations }
    Procedure Filtrar;
    Procedure preencheAreaAssuntos;
  end;

var
  fPessoasInformacoes: TfPessoasInformacoes;

implementation

uses uPessoasInfoCad, uUsuario, uDM, uFSelecionarCurso, uFSelecionarTurma, Main , uItemCombo, uFCadAssuntoArea;

{$R *.dfm}

procedure TfPessoasInformacoes.Filtrar;
const
   S_FILTRO_DTINFO_MYSQL = '(pi.dt_informacao BETWEEN ''%s'' AND ''%s'') ';

   S_FILTRO_DTRETORNO_MYSQL = '(pi.dt_retorno BETWEEN ''%s'' AND ''%s'') ';

   S_FILTRO_DTINFO_ORACLE = '(TO_CHAR(pi.dt_informacao, ''YYYY-MM-DD'') BETWEEN ''%s'' AND ''%s'') ';

   S_FILTRO_ORIGEM = 'pi.cd_origem = %d ';

   S_FILTRO_TURMA = 'pi.cd_turma = ''%s'' ';

   S_FILTRO_AREA_ASSUNTO = 'pi.ds_area_assunto = ''%s'' ';

   S_OP = ' AND ';
var
   S_SQL_COMMATRICULA_TURMA : string;

   S_SQL_COMMATRICULA  : string;

   S_SQL_SEMMATRICULA_TURMA : string;

   S_SQL_SEMMATRICULA : string ;

   S_SQL_PADRAO : string ;

   LICodOrigem: integer;
   LSFiltro: string;
   sColigadas : string;
   indice : Integer;
   lugar : Pointer;
   snMaisFiltro, i : Integer;
begin
  sColigadas := DM.GetTodasColigadas();

  S_SQL_COMMATRICULA_TURMA :=
         'SELECT DISTINCT '+
         'pi.cd_informacao,'+
         'pi.ds_informacao,'+
         'pi.nm_pessoa,'+
         'pi.ds_contatos,'+
         'pi.dt_informacao,'+
         'pi.cd_origem,'+
         'pi.cd_turma,'+
         'pi.ds_obs1,'+
         'pi.ds_obs2,'+
         'pi.ds_obs3,'+
         'pi.ds_telefone2,'+
         'pi.ds_email,'+
         'pi.cd_coligada,'+
         'pi.nm_usuario,'+
         'pi.cd_pessoa, '+
         'pi.ds_cidade, '+
         'pi.ds_uf '+
      'FROM '+
         'pessoas_info pi '+
            'JOIN matriculas m ON '+
               '(pi.cd_pessoa = m.codigoaluno) '+
      'WHERE '+
         'pi.cd_coligada in ( '+sColigadas+') AND '+
         'm.turma = :turma %s '+
      'ORDER BY %s';
  S_SQL_COMMATRICULA :=
      'SELECT DISTINCT '+
         'pi.cd_informacao,'+
         'pi.ds_informacao,'+
         'pi.nm_pessoa,'+
         'pi.ds_contatos,'+
         'pi.dt_informacao,'+
         'pi.cd_origem,'+
         'pi.cd_turma,'+
         'pi.ds_obs1,'+
         'pi.ds_obs2,'+
         'pi.ds_obs3,'+
         'pi.ds_telefone2,'+
         'pi.ds_email,'+
         'pi.cd_coligada,'+
         'pi.nm_usuario,'+
         'pi.cd_pessoa, '+
         'pi.ds_cidade, '+
         'pi.ds_uf '+
      'FROM '+
         'pessoas_info pi '+
            'JOIN matriculas m ON '+
               '(pi.cd_pessoa = m.codigoaluno) '+
      'WHERE '+
         'pi.cd_coligada in ('+sColigadas+') %s '+
      'ORDER BY %s';
  S_SQL_SEMMATRICULA_TURMA :=
      'SELECT DISTINCT '+
         'pi.cd_informacao,'+
         'pi.ds_informacao,'+
         'pi.nm_pessoa,'+
         'pi.ds_contatos,'+
         'pi.dt_informacao,'+
         'pi.cd_origem,'+
         'pi.cd_turma,'+
         'pi.ds_obs1,'+
         'pi.ds_obs2,'+
         'pi.ds_obs3,'+
         'pi.ds_telefone2,'+
         'pi.ds_email,'+
         'pi.cd_coligada,'+
         'pi.nm_usuario,'+
         'pi.cd_pessoa, '+
         'pi.ds_cidade, '+
         'pi.ds_uf '+
      'FROM '+
         'pessoas_info pi '+
            'LEFT JOIN matriculas m ON '+
               '(pi.cd_pessoa = m.codigoaluno AND m.turma = :turma) '+
      'WHERE '+
         'pi.cd_coligada in ('+sColigadas+')AND '+
         'm.codigoaluno IS NULL %s '+
      'ORDER BY %s';

  S_SQL_SEMMATRICULA :=
      'SELECT DISTINCT '+
         'pi.cd_informacao,'+
         'pi.ds_informacao,'+
         'pi.nm_pessoa,'+
         'pi.ds_contatos,'+
         'pi.dt_informacao,'+
         'pi.cd_origem,'+
         'pi.cd_turma,'+
         'pi.ds_obs1,'+
         'pi.ds_obs2,'+
         'pi.ds_obs3,'+
         'pi.ds_telefone2,'+
         'pi.ds_email,'+
         'pi.cd_coligada,'+
         'pi.nm_usuario,'+
         'pi.cd_pessoa, '+
         'pi.ds_cidade, '+
         'pi.ds_uf '+
      'FROM '+
         'pessoas_info pi '+
            'LEFT JOIN matriculas m ON '+
               '(pi.cd_pessoa = m.codigoaluno) '+
      'WHERE '+
         'cd_coligada in ('+sColigadas+') AND '+
         'm.codigoaluno IS NULL %s '+
      'ORDER BY %s';
   
   S_SQL_PADRAO :=
         'SELECT DISTINCT '+
         'pi.cd_informacao,'+
         'pi.ds_informacao,'+
         'pi.nm_pessoa,'+
         'pi.ds_contatos,'+
         'pi.dt_informacao,'+
         'pi.cd_origem,'+
         'pi.cd_turma,'+
         'pi.ds_obs1,'+
         'pi.ds_obs2,'+
         'pi.ds_obs3,'+
         'pi.ds_telefone2,'+
         'pi.ds_email,'+
         'pi.cd_coligada,'+
         'pi.nm_usuario,'+
         'pi.cd_pessoa, '+
         'pi.ds_cidade, '+
         'pi.ds_uf '+
      'FROM '+
         'pessoas_info pi '+
      'WHERE '+
         'cd_coligada in ('+sColigadas+') %s  '+
      'ORDER BY %s';

   LSFiltro := '';

   if qryPessoasInfoFiltrar.Active and (not qryPessoasInfoFiltrar.IsEmpty) then
   begin
      lugar := qryPessoasInfoFiltrar.GetBookmark;
   end
   else
   begin
      lugar := nil;
   end;

   qryPessoasInfoFiltrar.Close;

   if ckbData.Checked then
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         LSFiltro :=
            LSFiltro +
            Format(S_FILTRO_DTINFO_ORACLE, [
               FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date),
               FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date)])
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         LSFiltro :=
            LSFiltro +
            Format(S_FILTRO_DTINFO_MYSQL, [
               FormatDateTime('yyyy-mm-dd', dtFiltroInicio.Date) + ' 00:00:00',
               FormatDateTime('yyyy-mm-dd', dtFiltroFim.Date) + ' 23:59:59']);
   end;

   if (cbDataRetorno.Checked) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;
         
      LSFiltro :=
            LSFiltro +
            Format(S_FILTRO_DTRETORNO_MYSQL, [
               FormatDateTime('yyyy-mm-dd', dtIniRetorno.Date) + ' 00:00:00',
               FormatDateTime('yyyy-mm-dd', dtFimRetorno.Date) + ' 23:59:59']);
   end;

   if ((cbInfPor.ItemIndex <> 0) and (cbInfPor.ItemIndex <> -1)) then
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;

      if cbInfPor.ItemIndex = 1 then
         LICodOrigem := 1
      else if cbInfPor.ItemIndex = 2 then
         LICodOrigem := 2
      else if cbInfPor.ItemIndex = 3 then
         LICodOrigem := 4
      else if cbInfPor.ItemIndex = 4 then
         LICodOrigem := 3;

      LSFiltro := LSFiltro + Format(S_FILTRO_ORIGEM, [LICodOrigem]);
   end;

   if ((cbMatricula.ItemIndex = 0) or (cbMatricula.ItemIndex = -1)) then
   begin
      qryPessoasInfoFiltrar.SQL.Text := S_SQL_PADRAO
   end
   else if cbMatricula.ItemIndex = 1 then
   begin
      if Trim(edTurma.Text) <> '' then
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_COMMATRICULA_TURMA;
      end
      else
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_COMMATRICULA;
      end;
   end
   else
   begin
      if Trim(edTurma.Text) <> '' then
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_SEMMATRICULA_TURMA;
      end
      else
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_SEMMATRICULA;
      end;
   end;

   if Trim(edTurma.Text) <> '' then
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;
      LSFiltro := LSFiltro + Format(S_FILTRO_TURMA, [edTurma.Text]);
   end;

   if Edit1.Text <> '' then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(' pi.ds_curso = ''%s'' ', [Edit1.Text]);
   end;

   if (cbAreaAssuntoFiltro.ItemIndex <> 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(S_FILTRO_AREA_ASSUNTO, [cbAreaAssuntoFiltro.Text]);
   end;

   if (cbEstado.ItemIndex > 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format('pi.ds_uf = ''%s'' ', [cbEstado.Text]);
   end;

   if (cbCidade.ItemIndex > 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format('pi.ds_cidade = ''%s'' ', [cbCidade.Text]);
   end;

   //Contatos
   if btContatosFiltros.Caption <> 'Filtrar contatos' then
   begin

      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + '( ';
      end
      else
      begin
         LSFiltro :=  '( ';
      end;

      snMaisFiltro := 0;

      //filtra todos os contatos
      if btContatosFiltros.Caption = 'Todos os contatos' then
      begin
         //
      end;

      //E-Mail
      if pmContatos.Items[3].Checked then
      begin
         LSFiltro := LSFiltro + ' pi.ds_email LIKE ''%'+ Edit4.Text +'%'' ';
         snMaisFiltro := 1;
      end;

      //Telefone 1
      if pmContatos.Items[4].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_contatos LIKE ''%'+ Edit4.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_contatos LIKE ''%'+ Edit4.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      //Telefone 2
      if pmContatos.Items[5].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_telefone2 LIKE ''%'+ Edit4.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_telefone2 LIKE ''%'+ Edit4.Text +'%'' ';
            snMaisFiltro := 1;
         end;

      end;

      //Telefone 3
      if pmContatos.Items[6].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_telefone3 LIKE ''%'+ Edit4.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_telefone3 LIKE ''%'+ Edit4.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      //Telefone 4
      if pmContatos.Items[7].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_telefone3 LIKE ''%'+ Edit4.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_telefone3 LIKE ''%'+ Edit4.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      LSFiltro := LSFiltro + ' ) ';
   end;

   //Outros filtros
   if btOutrosFiltros.Caption <> 'Outros Filtros' then
   begin

      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + '( ';
      end
      else
      begin
         LSFiltro :=  '( ';
      end;

      snMaisFiltro := 0;

      //filtra todos os contatos
      if btOutrosFiltros.Caption = 'Todos os filtros' then
      begin
         //
      end;

      //Nome Pessoa
      if pmOutrosFiltros.Items[3].Checked then
      begin
         LSFiltro := LSFiltro + ' pi.nm_pessoa LIKE ''%'+ Edit5.Text +'%'' ';
         snMaisFiltro := 1;
      end;

      //Desc. da Informação
      if pmOutrosFiltros.Items[4].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_informacao LIKE ''%'+ Edit5.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_informacao LIKE ''%'+ Edit5.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      //Campo obs 1
      if pmOutrosFiltros.Items.Count > 5 then
      begin

         if pmOutrosFiltros.Items[5].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs1 LIKE ''%'+ Edit5.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs1 LIKE ''%'+ Edit5.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;
         
      end;

      //Campo obs 2
      if pmOutrosFiltros.Items.Count > 6 then
      begin
         if pmOutrosFiltros.Items[6].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs2 LIKE ''%'+ Edit5.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs2 LIKE ''%'+ Edit5.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;
      end;

      //Campo obs 3
      if pmOutrosFiltros.Items.Count > 7 then
      begin

         if pmOutrosFiltros.Items[7].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs3 LIKE ''%'+ Edit5.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs3 LIKE ''%'+ Edit5.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;

      end;

      //Campo obs 4
      if pmOutrosFiltros.Items.Count > 8 then
      begin
         if pmOutrosFiltros.Items[8].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs4 LIKE ''%'+ Edit5.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs4 LIKE ''%'+ Edit5.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;
      end;

      LSFiltro := LSFiltro + ' ) ';
   end;

   if LSFiltro <> '' then
   begin
      LSFiltro := S_OP + LSFiltro;
   end;

   qryPessoasInfoFiltrar.SQL.Text := Format(qryPessoasInfoFiltrar.SQL.Text, [LSFiltro, sOrdem]);
   if qryPessoasInfoFiltrar.Params.FindParam('turma') <> nil then
      qryPessoasInfoFiltrar.ParamByName('turma').AsString := edTurma.Text;
   qryPessoasInfoFiltrar.Open;
   
   if (lugar <> nil) AND (qryPessoasInfoFiltrar.BookmarkValid(lugar)) then begin
      qryPessoasInfoFiltrar.GotoBookmark(lugar);
   end;
   
end;

procedure TfPessoasInformacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfPessoasInformacoes.btIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1035, npIncluir, True ) then Exit;

   Application.CreateForm(TfPessoasInfoCad, fPessoasInfoCad);

   qyPessoasInfo.Insert();
   qyPessoasInfocd_origem.AsInteger := 1;
   qyPessoasInfodt_informacao.AsDateTime := DM.DataAtual();
   fPessoasInfoCad.Position := poScreenCenter;
   fPessoasInfoCad.Showmodal;
end;

procedure TfPessoasInformacoes.btAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1035, npAlterar, True ) then Exit;

    Application.CreateForm(TfPessoasInfoCad, fPessoasInfoCad);
    qyPessoasInfo.Edit();
    fPessoasInfoCad.Position := poScreenCenter;
    fPessoasInfoCad.Showmodal;
end;

procedure TfPessoasInformacoes.btExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1035, npExcluir, True ) then Exit;

   if Mensagem('Deseja realmente excluir as informações do contato selecionado?','Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes
   then begin

      qyPessoasInfo.Delete();
      Filtrar();

   end;
end;

procedure TfPessoasInformacoes.btFecharClick(Sender: TObject);
begin
   close();
end;

procedure TfPessoasInformacoes.FormShow(Sender: TObject);
var
  arrObs : TStringList;
  parametro : String;
  CountCaracter, ultimaposicao: integer;
  qyAreaAssunto: TUMZQuery;
  itemAux: TMenuItem;
begin
   {ATENÇÂO: manter a posição de obs1, obs2 e obs3 na mesma ordem atual e os três sempre por ultimo.}

   //Cria itens
   preencheContatosFiltro(Self);

   ultimaposicao := DBGrid1.Columns.Count-1;

   qyMunicipios.Open;
   qyEstados.Open;

   qyEstados.First;
   cbEstado.Items.Add('');
   while not (qyEstados.Eof) do
   begin
      cbEstado.Items.Add(qyEstadosds_uf.asString);
      qyEstados.Next;
   end;

   dtFiltroInicio.Date := DataHoje;
   dtFiltroFim.Date := DataHoje;
   dtIniRetorno.Date := DataHoje;
   dtFimRetorno.Date := DataHoje;

   arrObs := TStringList.Create();
   if(trim(DM.variavel_parametro('contatos_campos_obs')) = '')then
      parametro := ';;'
   else
      parametro := DM.variavel_parametro('contatos_campos_obs');
   CountCaracter := self.CountPos(';', parametro);

   if(CountCaracter = 0)then
      parametro := parametro+';;'
   else if(CountCaracter = 1)then
      parametro := parametro+';';

   SplitString(parametro, ';', arrObs);

   preencheOutrosFiltros(arrObs);

   if ( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
      DBGrid1.Columns[ultimaPosicao-2].Visible := false;
   if ( (arrObs[1] = null) or (trim(arrObs[1]) = '') )then
   begin
      DBGrid1.Columns[ultimaPosicao-1].Visible := false;
   end;
   if ( (arrObs[2] = null) or (trim(arrObs[2]) = '') )then
      DBGrid1.Columns[ultimaPosicao].Visible := false;
      DBGrid1.Columns.Add;
   DBGrid1.Columns[ultimaPosicao+1].Visible := false;
   if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
   begin
     DBGrid1.Columns[ultimaPosicao-2].Title.Caption := arrObs[0];
     if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
     begin
        DBGrid1.Columns[ultimaPosicao-1].Title.Caption := arrObs[1];
        if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
        begin
           DBGrid1.Columns[ultimaPosicao].Title.Caption := arrObs[2];
        end;
     end;
   end;
   DBGrid1.Columns[ultimaPosicao+1].Title.Caption := arrObs[2];

   preencheAreaAssuntos;

   sOrdem := ' cd_informacao DESC ';
   qyPessoasInfo.Open;
   Filtrar();
end;

procedure TfPessoasInformacoes.outrosFiltrosClick(Sender: TObject);
var
   qtdTotalItens, contMarcados, contNaoMarcados, i: Integer;
begin
   if TMenuItem(Sender).Tag = -1 then
   begin

      btOutrosFiltros.Caption := 'Todos os filtros';
      btOutrosFiltros.Hint := '';
      
      For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
      begin
         pmOutrosFiltros.Items[i].Checked := True;
      end;
   end // Desmarcar todas
   else if TMenuItem(Sender).Tag = -2 then
   begin

      btOutrosFiltros.Caption := 'Outros Filtros';
      btOutrosFiltros.Hint := '';

      For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
      begin
         pmOutrosFiltros.Items[i].Checked := False;
      end;
   end
   else  //Selecionou alguma opção de filtro por campo especifico
   begin
      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;

      contMarcados := 0;
      For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
      begin
         if pmOutrosFiltros.Items[i].Checked = False then
         begin
            contNaoMarcados := contNaoMarcados + 1;
         end;

         if pmOutrosFiltros.Items[i].Checked = True then
         begin
            contMarcados := contMarcados + 1;
         end;
      end;

      i:=i-3;
      
      if contNaoMarcados = i then
      begin
         btOutrosFiltros.Caption := 'Outros Filtros';
      end;

      if contMarcados > 0 then
      begin
         btOutrosFiltros.Hint := '';
         btOutrosFiltros.Caption := '';

         if contMarcados = i then
         begin
            btOutrosFiltros.Caption := 'Todos os filtros';
         end;

         qtdTotalItens := i;
         btOutrosFiltros.Caption := '';
         For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
         begin
            if contMarcados > 1 then
            begin
               if pmOutrosFiltros.Items[i].Checked then
               begin
                  if btOutrosFiltros.Caption = '' then
                  begin
                     btOutrosFiltros.Caption := pmOutrosFiltros.Items[i].Caption;
                     btOutrosFiltros.Hint := pmOutrosFiltros.Items[i].Caption;
                     if length(btOutrosFiltros.Caption) > 15 then
                     begin
                        btOutrosFiltros.Caption := btOutrosFiltros.Caption + ', ...';
                     end;
                  end
                  else
                  begin
                     if Length(btOutrosFiltros.Caption) > 15 then
                     begin
                        btOutrosFiltros.Hint := btOutrosFiltros.Hint + ', ' + pmOutrosFiltros.Items[i].Caption;
                     end
                     else
                     begin
                        btOutrosFiltros.Caption := btOutrosFiltros.Caption + ', ' + pmOutrosFiltros.Items[i].Caption;

                        if Length(btOutrosFiltros.Caption) > 15 then
                        begin
                           btOutrosFiltros.Caption := btOutrosFiltros.Caption + ', ...';
                        end;

                        btOutrosFiltros.Hint := btOutrosFiltros.Hint + ', ' + pmOutrosFiltros.Items[i].Caption;
                     end;
                  end;
               end;
            end;
            
            if ((contMarcados = 1) and (pmOutrosFiltros.Items[i].Checked = true)) then
            begin
               btOutrosFiltros.Caption := pmOutrosFiltros.Items[i].Caption;
            end;
            
         end;
         if contMarcados = 0 then
         begin
            btOutrosFiltros.Caption := 'Outros Filtros';
         end;

         if contMarcados = qtdTotalItens then
         begin
            btOutrosFiltros.Caption := 'Todos os filtros';
         end;
      end;
      
      btOutrosFiltros.ShowHint := True;
      if TMenuItem(Sender).Tag = -1 then
      begin
         TMenuItem(Sender).Checked := False;
      end;
   end;
end;

procedure TfPessoasInformacoes.preencheAreaAssuntos;
var
   qyAreaAssunto: TUMZQuery;
begin

   dm.CriarConsulta(qyAreaAssunto);
   qyAreaAssunto.SQL.Text := 'SELECT * FROM situacoes where cd_modulo = 1035';
   qyAreaAssunto.Open;

   qyAreaAssunto.First;

   cbAreaAssuntoFiltro.Clear;
   cbAreaAssuntoFiltro.Items.Add('Todos');

   while not (qyAreaAssunto.Eof) do
   begin
      cbAreaAssuntoFiltro.Items.Add(qyAreaAssunto.FieldByName('ds_valor').asString);
      qyAreaAssunto.Next;
   end;

   cbAreaAssuntoFiltro.ItemIndex := 0;
end;

procedure TfPessoasInformacoes.preencheContatosFiltro(Sender: TObject);
var
   itemAux: TMenuItem;
begin
   
   //Item Selecionar todos os contatos
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := 'Selecionar Todos';
   itemAux.Tag := -1;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item Selecionar desmarcar os contatos
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := 'Desmarcar Todos';
   itemAux.Tag := -2;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item Separador
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := '-';
   itemAux.Tag := -3;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item E-mail
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := 'E-mail';
   itemAux.Tag := 1;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 1(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone1');
   itemAux.Tag := 2;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 2(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone2');
   itemAux.Tag := 3;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 3(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone3');
   itemAux.Tag := 4;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 4(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone4');
   itemAux.Tag := 5;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);
   
end;

procedure TfPessoasInformacoes.preencheOutrosFiltros(arrCamposObs: TStringList);
var
   itemAux: TMenuItem;
   ultimaPosicao: Integer;
begin
   //Item Selecionar todos os contatos
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Selecionar Todos';
   itemAux.Tag := -1;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Selecionar desmarcar os contatos
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Desmarcar Todos';
   itemAux.Tag := -2;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Separador
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := '-';
   itemAux.Tag := -3;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Nome pessoa
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Nome Pessoa';
   itemAux.Tag := 1;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Desc. da informação.
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Desc. da Informação';
   itemAux.Tag := 2;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   if arrCamposObs.Count > 0 then
   begin

      if ( (arrCamposObs[0] <> null) AND (trim(arrCamposObs[0]) <> '') )then
      begin

         //Campo 1 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[0];
         itemAux.Tag := 3;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
      
   end;


   if arrCamposObs.Count > 1 then
   begin
      if ( (arrCamposObs[1] <> null) AND (trim(arrCamposObs[1]) <> '') )then
      begin

         //Campo 2 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[1];
         itemAux.Tag := 5;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
   end;
   

   if arrCamposObs.Count > 2 then
   begin

      if ( (arrCamposObs[2] <> null) AND (trim(arrCamposObs[2]) <> '') )then
      begin

         //Campo 3 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[2];
         itemAux.Tag := 5;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
   end;


   if arrCamposObs.Count > 3 then
   begin

      if ( (arrCamposObs[3] <> null) AND (trim(arrCamposObs[3]) <> '') )then
      begin

         //Campo 4 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[3];
         itemAux.Tag := 6;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
   end;
end;

procedure TfPessoasInformacoes.qyPessoasInfoAfterPost(DataSet: TDataSet);
begin
    qryPessoasInfoFiltrar.Close;
    qryPessoasInfoFiltrar.Open;
end;

procedure TfPessoasInformacoes.qyPessoasInfoBeforeOpen(DataSet: TDataSet);
begin
   qyEstados.open;
   qyMunicipios.Open;
end;

procedure TfPessoasInformacoes.qyPessoasInfoCalcFields(DataSet: TDataSet);
begin
   case qyPessoasInfocd_origem.AsInteger of
      1: qyPessoasInfods_origem.AsString := '1. Telefone';
      2: qyPessoasInfods_origem.AsString := '2. E-Mail';
      3: qyPessoasInfods_origem.AsString := '3. Pessoalmente';
      4: qyPessoasInfods_origem.AsString := '4. Site';
   end;
end;

procedure TfPessoasInformacoes.sbCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, DM.GetAnoSemestreAtual);

   if not resultado_filtro.filtrado then Exit;
   Edit1.Text := resultado_filtro.ds_curso;

end;

function TfPessoasInformacoes.Subst(Text, NewChar, OldChar: String): String;
var
   Cont : Integer;
begin
   if NewChar = OldChar then
   begin
      Result := Text;
      Exit;
   end;

   cont := Pos(OldChar,Text);

   while Cont > 0 do
   begin
      Delete(Text,Cont,Length(OldChar));
      Insert(NewChar,Text,Cont);
      cont := Pos(OldChar,Text);
   end;

   Result := Text;
end;

procedure TfPessoasInformacoes.btContatosFiltrosClick(Sender: TObject);
begin
   pmContatos.Popup(btContatosFiltros.Left, btContatosFiltros.Top + btContatosFiltros.Height + 140);
end;

procedure TfPessoasInformacoes.dsPessoasInfoDataChange(Sender: TObject;
  Field: TField);
begin
    btIncluir.Enabled  := not (qyPessoasInfo.State in [dsInsert, dsEdit]);
    btAlterar.Enabled  := not (qyPessoasInfo.State in [dsInsert, dsEdit]);
    btExcluir.Enabled  := not (qyPessoasInfo.State in [dsInsert, dsEdit]);
    btFechar.Enabled   := not (qyPessoasInfo.State in [dsInsert, dsEdit]);
    if((qyPessoasInfo.FieldByName('ds_email').IsNull) or (trim(qyPessoasInfo.FieldByName('ds_email').AsString) = ''))then
      Self.btEnviarEmail.Visible := false
    else
      Self.btEnviarEmail.Visible := true;

    if(Self.qyPessoasInfo.RecordCount > 0)then
      btEnviarEmailTodos.Visible := True
    else
      btEnviarEmailTodos.Visible := False;

end;

procedure TfPessoasInformacoes.dsPessoasInfoFiltrarDataChange(Sender: TObject;
  Field: TField);
begin
   qyPessoasInfo.Locate('cd_informacao', qryPessoasInfoFiltrarcd_informacao.AsInteger, []);
end;

procedure TfPessoasInformacoes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btIncluir.Enabled then btIncluirClick( nil );
    VK_F3 : if btAlterar.Enabled then btAlterarClick( nil );
    VK_F9 : if btExcluir.Enabled then btExcluirClick( nil );
    VK_F12 : if btFechar.Enabled then btFecharClick( nil );
  end;

end;

procedure TfPessoasInformacoes.DBGrid1TitleClick(Column: TColumn);
var
   n : smallint;
begin
  // Clique no título da grade... ordenar pela coluna clicada
  if(Column.FieldName = 'ds_origem') then
    Column.FieldName := 'cd_origem';

  if dbGrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to dbGrid1.Columns.Count - 1 do begin
       dbGrid1.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  if(Column.FieldName = 'cd_origem') then
    Column.FieldName := 'ds_origem';

  Column.Title.Font.Style := [fsUnderline];

  Filtrar();
end;

procedure TfPessoasInformacoes.cbEstadoChange(Sender: TObject);
begin
   qyMunicipiosFiltro.SQL.Text := 'Select * From municipios where ds_uf = :uf order by ds_municipio';
   qyMunicipiosFiltro.ParamByName('uf').AsString := cbEstado.Text;

   qyMunicipiosFiltro.Open;
   qyMunicipiosFiltro.First;

   cbCidade.Clear;
   cbCidade.Items.Add('');
   while not (qyMunicipiosFiltro.Eof) do
   begin
      cbCidade.Items.Add(qyMunicipiosFiltro.FieldByName('ds_municipio').asString);
      qyMunicipiosFiltro.Next;
   end;
end;

procedure TfPessoasInformacoes.ckbDataClick(Sender: TObject);
begin

   dtIniRetorno.Enabled := cbDataRetorno.Checked;
   dtFimRetorno.Enabled := cbDataRetorno.Checked;

end;

procedure TfPessoasInformacoes.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
  { Pesquisar Turmas }
  resultado_filtro := TfrmSelecionarTurma.Filtrar([], DM.GetAnoSemestreAtual);

   if not resultado_filtro.filtrado then Exit;
   edTurma.Text := resultado_filtro.cd_turma;

end;

procedure TfPessoasInformacoes.btOutrosFiltrosClick(Sender: TObject);
begin
   pmOutrosFiltros.Items.Count;
   pmOutrosFiltros.Popup(btOutrosFiltros.Left, btOutrosFiltros.Top + btOutrosFiltros.Height + 140);
end;

procedure TfPessoasInformacoes.Button1Click(Sender: TObject);
begin
   Filtrar();
end;

procedure TfPessoasInformacoes.btEnviarEmailClick(Sender: TObject);
begin
   if (not qyPessoasInfo.FieldByName('ds_email').IsNull) and (Trim(qyPessoasInfo.FieldByName('ds_email').AsString) <> '') then
      ShellExecute(GetDesktopWindow,'open', PChar('mailto:' + qyPessoasInfo.FieldByName('ds_email').AsString),nil,nil,sw_ShowNormal);
end;

procedure TfPessoasInformacoes.btEnviarEmailTodosClick(Sender: TObject);
var
   emails, email : string;
   i, conta, qtd: integer;
begin
   Self.qryPessoasInfoFiltrar.First;
   emails := 'mailto:';
   conta := 0;

   while not Self.qryPessoasInfoFiltrar.Eof do
   begin
      if not(Self.qryPessoasInfoFiltrar.FieldByName('ds_email').IsNull) and (Self.qryPessoasInfoFiltrar.FieldByName('ds_email').AsString <> '')then
      begin
         // Adiciona o email na lista de emails
         if(emails <> 'mailto:')then
            emails := emails + ';';
         email := Self.qryPessoasInfoFiltrar.FieldByName('ds_email').AsString;
         emails := emails + email;

         // Verifica a quantidade de emails em cada contato
         qtd := 0;
         for i := 0 to Length(email) do
         begin
            if(email[i] = '@')then
               qtd := qtd + 1;
         end;

         // Acrescenta o contador
         conta := conta + qtd;

         // Se o contador chegar no limite definido no parâmetro ele cria uma nova instância do gerenciador de email
         if(conta = StrToInt(DM.variavel_parametro('dividi_numeros_contatos'))) and (StrToInt(DM.variavel_parametro('dividi_numeros_contatos')) <> 0)then
         begin
            ShellExecute(GetDesktopWindow,'open', PChar(emails),nil,nil,sw_ShowNormal);
            conta := 0;
            emails := 'mailto:';
         end else if (conta > StrToInt(DM.variavel_parametro('dividi_numeros_contatos'))) and (StrToInt(DM.variavel_parametro('dividi_numeros_contatos')) <> 0)then
         begin
            ShellExecute(GetDesktopWindow,'open', PChar('mailto:'+email),nil,nil,sw_ShowNormal);
            ShellExecute(GetDesktopWindow,'open', PChar(StringReplace(emails, email, '', [])),nil,nil,sw_ShowNormal);
            conta := 0;
            emails := 'mailto:';
         end;
      end;
      Self.qryPessoasInfoFiltrar.Next;
   end;

   if(emails <> 'mailto:')then
   begin
      ShellExecute(GetDesktopWindow,'open', PChar(emails),nil,nil,sw_ShowNormal);
   end;
end;


procedure TfPessoasInformacoes.ckbTurmaClick(Sender: TObject);
begin
   edTurma.Enabled := True;
   btnCodigoTurma.Enabled := True;   
end;

procedure TfPessoasInformacoes.contatosFiltra(Sender: TObject);
var
   qtdTotalItens, contNaoMarcados, contMarcados, i:integer;
   strCaptionMenu: String;
begin

   // Selecionar Todas
   if TMenuItem(Sender).Tag = -1 then
   begin

      btContatosFiltros.Caption := 'Todos os contatos';
      btContatosFiltros.Hint := '';
      
      For i:= 3 to pmContatos.Items.Count - 1 do
      begin
         pmContatos.Items[i].Checked := True;
      end;
   end // Desmarcar todas
   else if TMenuItem(Sender).Tag = -2 then
   begin

      btContatosFiltros.Caption := 'Filtrar contatos';
      btContatosFiltros.Hint := '';

      For i:= 3 to pmContatos.Items.Count - 1 do
      begin
         pmContatos.Items[i].Checked := False;
      end;
   end
   else  //Selecionou alguma opção de filtro por campo especifico
   begin
      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;

      contMarcados := 0;
      For i:= 3 to pmContatos.Items.Count - 1 do
      begin
         if pmContatos.Items[i].Checked = False then
         begin
            contNaoMarcados := contNaoMarcados + 1;
         end;

         if pmContatos.Items[i].Checked = True then
         begin
            contMarcados := contMarcados + 1;
         end;
      end;

      i:=i-3;
      
      if contNaoMarcados = i then
      begin
         btContatosFiltros.Caption := 'Filtrar contatos';
      end;

      if contMarcados > 0 then
      begin
         btContatosFiltros.Hint := '';
         btContatosFiltros.Caption := '';

         if contMarcados = i then
         begin
            btContatosFiltros.Caption := 'Todos os contatos';
         end;

         qtdTotalItens := i;
         btContatosFiltros.Caption := '';
         For i:= 3 to pmContatos.Items.Count - 1 do
         begin
            if contMarcados > 1 then
            begin
               if pmContatos.Items[i].Checked then
               begin
                  if btContatosFiltros.Caption = '' then
                  begin
                     btContatosFiltros.Caption := pmContatos.Items[i].Caption;
                     btContatosFiltros.Hint := pmContatos.Items[i].Caption;
                     if length(btContatosFiltros.Caption) > 15 then
                     begin
                        btContatosFiltros.Caption := btContatosFiltros.Caption + ', ...';
                     end;
                  end
                  else
                  begin
                     if Length(btContatosFiltros.Caption) > 15 then
                     begin
                        btContatosFiltros.Hint := btContatosFiltros.Hint + ', ' + pmContatos.Items[i].Caption;
                     end
                     else
                     begin
                        btContatosFiltros.Caption := btContatosFiltros.Caption + ', ' + pmContatos.Items[i].Caption;

                        if Length(btContatosFiltros.Caption) > 15 then
                        begin
                           btContatosFiltros.Caption := btContatosFiltros.Caption + ', ...';
                        end;

                        btContatosFiltros.Hint := btContatosFiltros.Hint + ', ' + pmContatos.Items[i].Caption;
                     end;
                  end;
               end;
            end;
            
            if ((contMarcados = 1) and (pmContatos.Items[i].Checked = true)) then
            begin
               btContatosFiltros.Caption := pmContatos.Items[i].Caption;
            end;
            
         end;
         if contMarcados = 0 then
         begin
            btContatosFiltros.Caption := 'Filtrar contatos';
         end;

         if contMarcados = qtdTotalItens then
         begin
            btContatosFiltros.Caption := 'Todos os contatos';
         end;
      end;
      
      btContatosFiltros.ShowHint := True;
      if TMenuItem(Sender).Tag = -1 then
      begin
         TMenuItem(Sender).Checked := False;
      end;
   end;

end;

function TfPessoasInformacoes.CountPos(const subtext: String;
  Text: String): Integer;
begin
   if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0) then
    Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, subtext, '', [rfReplaceAll]))) div
      Length(subtext);
end;

end.

