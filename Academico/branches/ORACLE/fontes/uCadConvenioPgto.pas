unit uCadConvenioPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, Grids, DBGrids,udm, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, ZSqlUpdate, General, StdCtrls;

type
  TfrmCadConvenioPgto = class(TForm)
    pnTitulo: TPanel;
    pnEsquerdo: TPanel;
    pnDireito: TPanel;
    pnCriterios: TPanel;
    imgBotoes: TImageList;
    tbBotoesAcao: TToolBar;
    tpSeparador1: TToolButton;
    btnIncluirEmpresa: TToolButton;
    btnAlterarEmpresa: TToolButton;
    btnExcluirEmpresa: TToolButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnInserirCriterio: TToolButton;
    btnAlterarCriterio: TToolButton;
    btnExcluirCriterio: TToolButton;
    ToolButton5: TToolButton;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    btnIncluirAluno: TToolButton;
    btnAlterarAluno: TToolButton;
    btnExcluirAluno: TToolButton;
    ToolButton14: TToolButton;
    ToolBar3: TToolBar;
    ToolButton23: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    pnTituloEmpresa: TPanel;
    pnTituloCriterios: TPanel;
    pnTituloAlunoFuncionario: TPanel;
    gridEmpresas: TDBGrid;
    gridCriterios: TDBGrid;
    gridAlunosCriterios: TDBGrid;
    qyCriterios: TUMZQuery;
    qyNfeConveniosEmpresas: TUMZQuery;
    qyAlunosFuncionarios: TUMZQuery;
    dsCriterios: TDataSource;
    dsNfeConveniosEmpresas: TDataSource;
    dsAlunosFuncionarios: TDataSource;
    updConveniosPessoas: TZUpdateSQL;
    qyNfeConveniosEmpresascd_convenio_pessoa: TIntegerField;
    qyNfeConveniosEmpresasnm_pessoa: TStringField;
    qyNfeConveniosEmpresasdt_inicial: TDateTimeField;
    qyNfeConveniosEmpresasdt_final: TDateTimeField;
    qyNfeConveniosEmpresasds_ativo: TStringField;
    ToolButton6: TToolButton;
    updCriterios: TZUpdateSQL;
    updAlunosFuncionarios: TZUpdateSQL;
    qyCriterioscd_convenio_criterio: TIntegerField;
    qyCriterioscd_nfe_criterio_tipo: TIntegerField;
    qyCriteriosds_cargo: TStringField;
    qyCriterioscd_depto: TIntegerField;
    qyCriteriosvl_valor: TFloatField;
    qyCriteriosvl_valor_limite: TFloatField;
    qyCriteriosdescricao: TStringField;
    qyCriteriosds_tipo: TStringField;
    qyNfeConveniosEmpresassn_ativo: TSmallintField;
    qyAlunosFuncionarioscd_pessoa: TIntegerField;
    qyAlunosFuncionarioscd_convenio_criterio: TIntegerField;
    qyAlunosFuncionariosnm_pessoa: TStringField;
    qyAlunosFuncionariosds_cpf: TStringField;
    qyAlunosFuncionariosds_cargo: TStringField;
    qyNfeConveniosEmpresascd_convenio: TLargeintField;
    qyCriterioscd_convenio: TLargeintField;
    qrGruposPessoas: TUMZQuery;
    qyNfeConveniosEmpresasds_cursos: TMemoField;
    qyNfeConveniosEmpresassn_contrato: TStringField;
    Panel1: TPanel;
    cbFiltroAtivo: TComboBox;
    cbFiltroContrato: TComboBox;
    procedure cbFiltroContratoChange(Sender: TObject);
    procedure cbFiltroAtivoChange(Sender: TObject);
    procedure qyNfeConveniosEmpresasds_cursosGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure dsNfeConveniosEmpresasDataChange(Sender: TObject; Field: TField);
    procedure qyAlunosFuncionariosBeforeOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridAlunosCriteriosDblClick(Sender: TObject);
    procedure btnAlterarAlunoClick(Sender: TObject);
    procedure btnIncluirAlunoClick(Sender: TObject);
    procedure gridCriteriosDblClick(Sender: TObject);
    procedure btnAlterarCriterioClick(Sender: TObject);
    procedure btnInserirCriterioClick(Sender: TObject);
    procedure btnExcluirAlunoClick(Sender: TObject);
    procedure btnExcluirCriterioClick(Sender: TObject);
    procedure gridEmpresasDblClick(Sender: TObject);
    procedure btnExcluirEmpresaClick(Sender: TObject);
    procedure btnAlterarEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirEmpresaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton26Click(Sender: TObject);
  private
    cd_modulo : integer;
    procedure defineCdModulo();
    { Private declarations }
  public
    function getCdModulo( ) : integer;
    procedure setCdModulo( valor : integer );
    procedure filtrar();
    { Public declarations }
  end;

var
  frmCadConvenioPgto: TfrmCadConvenioPgto;

implementation

uses uCadConvenioEmpresa, uCadConvenioCriterio, uCadConvenioAlunoFuncionario,
  uUsuario;

{$R *.dfm}

procedure TfrmCadConvenioPgto.btnAlterarEmpresaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npAlterar, True ) then Exit;
   
   if qyNfeConveniosEmpresas.RecordCount > 0 then
   begin
      Application.CreateForm( TfrmCadConvenioEmpresa, frmCadConvenioEmpresa );
      frmCadConvenioEmpresa.qyNfeConvenio.close();
      frmCadConvenioEmpresa.qyNfeConvenio.ParamByName('cd_convenio').AsInteger := qyNfeConveniosEmpresascd_convenio.AsInteger;
      frmCadConvenioEmpresa.qyNfeConvenio.open();

      frmCadConvenioEmpresa.qyNfeConvenio.edit;
      frmCadConvenioEmpresa.txtNomeEmpresa.Text := qyNfeConveniosEmpresasnm_pessoa.AsString;
      frmCadConvenioEmpresa.setCdPessoa( qyNfeConveniosEmpresascd_convenio_pessoa.AsInteger );
      frmCadConvenioEmpresa.ShowModal;
   end;
end;

procedure TfrmCadConvenioPgto.btnExcluirEmpresaClick(Sender: TObject);
var
   cd_convenio        : integer;
   cd_criterio        : string;
   cd_pessoa          : string;
   qyCriteriosEmpresa : TUMZQuery;
   qyCriteriosPessoas : TUMZQuery;
   chave_log          : string;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npExcluir, True ) then Exit;

   if qyNfeConveniosEmpresas.RecordCount > 0 then
   begin
      if  Mensagem('Este processo irá apagar o convênio selecionado, critérios e alunos vinculados. Deseja continuar?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
      begin
         cd_convenio := qyNfeConveniosEmpresascd_convenio.AsInteger;
         cd_pessoa   := qyNfeConveniosEmpresascd_convenio_pessoa.AsString;

         //apaga empresa
         qyNfeConveniosEmpresas.Delete;

         //lista todos os critérios da empresa
         DM.CriarConsulta( qyCriteriosEmpresa );
         qyCriteriosEmpresa.Close();
         qyCriteriosEmpresa.SQL.Clear;
         qyCriteriosEmpresa.SQL.Text := 'SELECT * FROM fin_nfe_convenios_criterios '+
         'WHERE cd_convenio = :cd_convenio';
         qyCriteriosEmpresa.ParamByName('cd_convenio').AsInteger := cd_convenio;
         qyCriteriosEmpresa.Open;

         if qyCriteriosEmpresa.RecordCount > 0 then
         begin

            DM.CriarConsulta( qyCriteriosPessoas );
            qyCriteriosPessoas.Close();
            qyCriteriosPessoas.SQL.Clear;

            while not qyCriteriosEmpresa.Eof do
            begin
               cd_criterio := qyCriteriosEmpresa.FieldByName('cd_convenio_criterio').AsString;

               //apaga todas as pessoas referente este critério
               qyCriteriosPessoas.SQL.Text := 'DELETE FROM fin_nfe_pessoas_conveniadas'+
               ' WHERE cd_convenio_criterio = :cd_convenio_criterio';
               qyCriteriosPessoas.ParamByName('cd_convenio_criterio').AsString := cd_criterio;
               qyCriteriosPessoas.ExecSQL;

               chave_log := IntToStr(cd_convenio) + ':' + cd_pessoa + ':' + cd_criterio;
               DM.setLog( Self.getCdModulo(), 'exclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Excluido todas as pessoas referente o critério '+ cd_criterio + '. Esse critério é referente a empresa de código ' + cd_pessoa +'. Essa empresa é referente ao convênio de código ' + inttostr(cd_convenio) + '. (Processo automático através da exclusão da empresa).' );

               qyCriteriosEmpresa.Next;
            end;

            //apaga todos os critérios da empresa.
            qyCriteriosEmpresa.Close();
            qyCriteriosEmpresa.SQL.Clear;
            qyCriteriosEmpresa.SQL.Text := 'DELETE FROM fin_nfe_convenios_criterios '+
            'WHERE cd_convenio = :cd_convenio ';

            qyCriteriosEmpresa.ParamByName('cd_convenio').AsInteger := cd_convenio;
            qyCriteriosEmpresa.ExecSQL;

            chave_log := IntToStr(cd_convenio) + ':' + cd_pessoa;
            DM.setLog( Self.getCdModulo(), 'exclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Excluido todos os critérios referentes a empresa de código ' + cd_pessoa +'. Essa empresa é referente ao convênio de código '+ inttostr(cd_convenio) +'. (Processo automático através da exclusão da empresa).' );

            FreeAndNil( qyCriteriosPessoas );
         end;

         chave_log := IntToStr(cd_convenio) + ':' + qyNfeConveniosEmpresascd_convenio_pessoa.AsString;
         DM.setLog( Self.getCdModulo(), 'exclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Excluido o convênio de número '+ inttostr(cd_convenio) + ' referente a empresa de código ' + cd_pessoa + '.' );

         FreeAndNil( qyCriteriosEmpresa );
      end;
   end
   else
   begin
      Mensagem('Tabela sem registro.', 'Aviso', MB_OK + MB_ICONINFORMATION);
   end;
end;

procedure TfrmCadConvenioPgto.btnIncluirAlunoClick(Sender: TObject);
Var
  P : Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npIncluir, True ) then Exit;
   
   //Somente se houver pelomenos um critério cadastrado
   if qyCriterios.RecordCount > 0  then
   begin
      Application.CreateForm( TfrmCadConveioPessoa, frmCadConveioPessoa );
      qyAlunosFuncionarios.Insert;
      frmCadConveioPessoa.setCdPessoa( 0 );
      frmCadConveioPessoa.ShowModal;

         // Atualiza grid
      P := qyNfeConveniosEmpresas.GetBookmark();
      Filtrar();

      qyNfeConveniosEmpresas.GotoBookmark(P);
   end;


end;

procedure TfrmCadConvenioPgto.btnIncluirEmpresaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npIncluir, True ) then Exit;
   Application.CreateForm( TfrmCadConvenioEmpresa, frmCadConvenioEmpresa );
   frmCadConvenioEmpresa.qyNfeConvenio.close();
   frmCadConvenioEmpresa.qyNfeConvenio.ParamByName('cd_convenio').AsInteger := -1;
   frmCadConvenioEmpresa.qyNfeConvenio.open();
   frmCadConvenioEmpresa.qyNfeConvenio.Insert;
   frmCadConvenioEmpresa.qyNfeConveniosn_ativo.AsInteger := 0;
   frmCadConvenioEmpresa.ShowModal;
end;

procedure TfrmCadConvenioPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadConvenioPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F12 : Self.Close;
   end;
end;

procedure TfrmCadConvenioPgto.FormShow(Sender: TObject);
begin
   Filtrar();
   qyCriterios.Open;
   qyAlunosFuncionarios.Open;

   //busca o código do módulo para geração de logs.
   Self.defineCdModulo();
end;

function TfrmCadConvenioPgto.getCdModulo() : integer;
begin
   Result := Self.cd_modulo;
end;

procedure TfrmCadConvenioPgto.gridAlunosCriteriosDblClick(Sender: TObject);
begin
   btnAlterarAluno.OnClick(nil);
end;

procedure TfrmCadConvenioPgto.gridCriteriosDblClick(Sender: TObject);
begin
   btnAlterarCriterio.OnClick(nil);
end;

procedure TfrmCadConvenioPgto.gridEmpresasDblClick(Sender: TObject);
begin
   btnAlterarEmpresa.OnClick(nil);
end;

procedure TfrmCadConvenioPgto.qyAlunosFuncionariosBeforeOpen(DataSet: TDataSet);
var
   cd_convenio          : integer;
begin
   if qyNfeConveniosEmpresas.RecordCount > 0 then
   begin
      cd_convenio := qyNfeConveniosEmpresascd_convenio.AsInteger;

      if cd_convenio <> 0 then
      begin
         qyAlunosFuncionarios.ParamByName('cd_convenio').AsInteger := cd_convenio;
      end;
   end;
end;

procedure TfrmCadConvenioPgto.qyNfeConveniosEmpresasds_cursosGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Sender.AsString;
end;

procedure TfrmCadConvenioPgto.setCdModulo(valor: integer);
begin
   Self.cd_modulo := valor;
end;

procedure TfrmCadConvenioPgto.btnExcluirAlunoClick(Sender: TObject);
var
   chave_log   : string;
   cd_pessoa   : string;
   cd_convenio : string;
   cd_criterio : string;
   P: Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npExcluir, True ) then Exit;

   if qyAlunosFuncionarios.RecordCount > 0 then
   begin
      if  Mensagem('Deseja apagar a pessoa selecionada?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
      begin
         cd_pessoa   := qyAlunosFuncionarioscd_pessoa.AsString;
         cd_criterio := qyAlunosFuncionarioscd_convenio_criterio.AsString;
         cd_convenio := qyNfeConveniosEmpresascd_convenio.AsString;

         qyAlunosFuncionarios.Delete;

         chave_log :=  cd_convenio + ':' + cd_criterio + ':' + cd_pessoa;
         DM.setLog( Self.getCdModulo(), 'exclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Excluido o aluno de código '+ cd_pessoa + '. Vinculado ao critério de código ' + cd_criterio + '. Critério referente ao convênio de código ' + cd_convenio +'.' );

         P := qyNfeConveniosEmpresas.GetBookmark();
         Filtrar();

         qyNfeConveniosEmpresas.GotoBookmark(P);
      end;
   end
   else
   begin
      Mensagem('Tabela sem registro.', 'Aviso', MB_OK + MB_ICONINFORMATION);
   end;

end;

procedure TfrmCadConvenioPgto.ToolButton26Click(Sender: TObject);
begin
   qyCriterios.Cancel;
   qyNfeConveniosEmpresas.Cancel;
   qyAlunosFuncionarios.Cancel;

   Self.Close();
end;

procedure TfrmCadConvenioPgto.btnInserirCriterioClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npIncluir, True ) then Exit;
   
   //Somente se houver pelomenos uma empresa cadastrada
   if qyNfeConveniosEmpresas.RecordCount > 0  then
   begin
      Application.CreateForm( TfrmCadConvenioCriterio, frmCadConvenioCriterio );
      qyCriterios.Insert;
      qyCriterioscd_convenio.AsInteger := qyNfeConveniosEmpresascd_convenio.AsInteger;
      frmCadConvenioCriterio.ShowModal;
   end;
end;

procedure TfrmCadConvenioPgto.cbFiltroAtivoChange(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmCadConvenioPgto.cbFiltroContratoChange(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmCadConvenioPgto.defineCdModulo;
var
   qyModulo    : TUMZQuery;
   cd_modulo   : integer;
begin
   DM.CriarConsulta( qyModulo );
   qyModulo.Close;
   qyModulo.SQL.Clear;
   qyModulo.SQL.Text := 'SELECT cd_modulo FROM nu_modulos where ds_chave = ''UMFinanceiro''';
   qyModulo.Open;

   cd_modulo := qyModulo.FieldByName('cd_modulo').AsInteger;

   Self.setCdModulo( cd_modulo );

   FreeAndNil( qyModulo );
end;

procedure TfrmCadConvenioPgto.dsNfeConveniosEmpresasDataChange(Sender: TObject;
  Field: TField);
begin
   qyAlunosFuncionarios.Close;
   qyAlunosFuncionarios.Open;
end;

procedure TfrmCadConvenioPgto.filtrar;
CONST SQL =
    'SELECT '+
    '  nf_con.cd_convenio,     '+
    '  nf_con.cd_pessoa,       '+
    '  nf_con.dt_inicial,      '+
    '  nf_con.dt_final,        '+
    '  nf_con.sn_ativo,        '+
    '  p.nm_pessoa,            '+
    '  IF(                     '+
    '  nf_con.sn_ativo = 1,    '+
    '  "X",                    '+
    '  "Não"                   '+
    '  ) AS ds_ativo,          '+
    '  IF(                     '+
    '    ISNULL(nf_con.me_pdf),'+
    '    "Não",                '+
    '    "X"                   '+
    '  ) AS sn_contrato,       '+
    '  IFNULL((                '+
    '  	SELECT                '+
    '  		GROUP_CONCAT( DISTINCT(mc.cd_curso) SEPARATOR '', '' )  '+
    '  	FROM                                                     '+
    '  	  	fin_nfe_pessoas_conveniadas fnpc                      '+
    '  		INNER JOIN fin_nfe_convenios_criterios fncc ON (      '+
    '  		  fncc.cd_convenio_criterio = fnpc.cd_convenio_criterio '+
    '  	)                                                          '+
    '  		INNER JOIN matriculas_curso mc ON (                     '+
    '      mc.cd_pessoa = fnpc.cd_pessoa                            '+
    '  		)                                                       '+
    '  		WHERE                                                   '+
    '  			fncc.cd_convenio = nf_con.cd_convenio                '+
    '  	),"") AS ds_cursos                                         '+
    '  FROM                                                         '+
    '    fin_nfe_convenios as nf_con                                '+
    '  INNER JOIN pessoas p ON (                                    '+
    '    nf_con.cd_pessoa = p.cd_pessoa )                           '+
    ' WHERE 1= 1 ';

begin
   qyNfeConveniosEmpresas.Close();
   qyNfeConveniosEmpresas.SQL.Text := SQL;
   if cbFiltroAtivo.ItemIndex = 1 then begin
       qyNfeConveniosEmpresas.SQL.Add(' AND nf_con.sn_ativo = 1 ');
   end else if cbFiltroAtivo.ItemIndex = 2 then begin
       qyNfeConveniosEmpresas.SQL.Add(' AND nf_con.sn_ativo = 0 '); 
   end;

   if cbFiltroContrato.ItemIndex = 1 then begin
       qyNfeConveniosEmpresas.SQL.Add(' AND nf_con.me_pdf is not null ');
   end else if cbFiltroContrato.ItemIndex = 2 then begin
       qyNfeConveniosEmpresas.SQL.Add(' AND nf_con.me_pdf is null ');
   end;
   qyNfeConveniosEmpresas.SQL.Add(' ORDER BY nf_con.sn_ativo desc, p.nm_pessoa ');
   qyNfeConveniosEmpresas.Open;
end;

procedure TfrmCadConvenioPgto.btnAlterarAlunoClick(Sender: TObject);
Var
   P : Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npAlterar, True ) then Exit;
   
   //Somente se houver pelomenos uma empresa cadastrada
   if qyAlunosFuncionarios.RecordCount > 0  then
   begin
      Application.CreateForm( TfrmCadConveioPessoa, frmCadConveioPessoa );
      qyAlunosFuncionarios.edit;
      frmCadConveioPessoa.txtNomeEmpresa.Text := qyAlunosFuncionariosnm_pessoa.AsString;
      frmCadConveioPessoa.setCdPessoa( qyAlunosFuncionarioscd_convenio_criterio.AsInteger );
      frmCadConveioPessoa.ShowModal;
      P := qyNfeConveniosEmpresas.GetBookmark();
      Filtrar();

      qyNfeConveniosEmpresas.GotoBookmark(P);
   end;

end;

procedure TfrmCadConvenioPgto.btnAlterarCriterioClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npAlterar, True ) then Exit;
   
   //Somente se houver pelomenos uma empresa cadastrada
   if qyCriterios.RecordCount > 0  then
   begin
      Application.CreateForm( TfrmCadConvenioCriterio, frmCadConvenioCriterio );
      qyCriterios.edit;
      frmCadConvenioCriterio.setCdCriterio( qyCriterioscd_convenio_criterio.AsInteger );
      frmCadConvenioCriterio.ShowModal;
   end;
end;

procedure TfrmCadConvenioPgto.btnExcluirCriterioClick(Sender: TObject);
var
   qyCriteriosEmpresa : TUMZQuery;
   chave_log          : string;
   cd_pessoa          : string;
   cd_convenio        : string;
   cd_criterio        : string;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npExcluir, True ) then Exit;
   
   if qyCriterios.RecordCount > 0 then
   begin
      if  Mensagem('Este processo irá apagar o critério selecionado e os alunos vinculados. Deseja continuar?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
      begin
         DM.CriarConsulta( qyCriteriosEmpresa );
         qyCriteriosEmpresa.Close();
         qyCriteriosEmpresa.SQL.Clear;

         //apaga todas as pessoas referente este critério
         qyCriteriosEmpresa.SQL.Text := 'DELETE FROM fin_nfe_pessoas_conveniadas'+
         ' WHERE cd_convenio_criterio = :cd_convenio_criterio';
         qyCriteriosEmpresa.ParamByName('cd_convenio_criterio').AsString := qyCriterioscd_convenio_criterio.AsString;
         qyCriteriosEmpresa.ExecSQL;

         cd_criterio := qyCriterioscd_convenio_criterio.AsString;
         cd_convenio := qyNfeConveniosEmpresascd_convenio.AsString;
         cd_pessoa   := qyNfeConveniosEmpresascd_convenio_pessoa.AsString;
         
         chave_log := cd_convenio + ':' + cd_criterio + ':' + cd_pessoa;
         DM.setLog( Self.getCdModulo(), 'exclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Excluido o critério de código '+ cd_criterio +'. Critério referente ao convênio de código ' + cd_convenio + '. Empresa de código ' + cd_pessoa);

         FreeAndNil( qyCriteriosEmpresa );

         qyCriterios.Delete;
      end;
   end
   else
   begin
      Mensagem('Tabela sem registro.', 'Aviso', MB_OK + MB_ICONINFORMATION);
   end;
end;

end.
