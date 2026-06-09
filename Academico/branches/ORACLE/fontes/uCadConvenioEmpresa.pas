unit uCadConvenioEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, Buttons, ComCtrls, ToolWin, ImgList,
  uCadConvenioPgto, General, uCadConvenioEmpresaLog, ZSqlUpdate;
  
type
   TCovenio = record
   cd_pessoa   : string;
   dt_inicial  : TDateTime;
   dt_final    : TDateTime;
   sn_ativo    : integer;
end;


type
  TfrmCadConvenioEmpresa = class(TForm)
    pnTitulo: TPanel;
    lbPessoa: TLabel;
    lbDataInicio: TLabel;
    dbDataInicial: TDBEdit;
    lbDataFinal: TLabel;
    dbDatafinal: TDBEdit;
    lbContrato: TLabel;
    dbAtivo: TDBCheckBox;
    sbSelecionarPessoa: TSpeedButton;
    sbSelecionePDF: TSpeedButton;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton14: TToolButton;
    txtNomeEmpresa: TEdit;
    txtPDF: TEdit;
    sbExportar: TSpeedButton;
    odAbrirPDF: TOpenDialog;
    sdSalvarPDF: TSaveDialog;
    sbLimpar: TSpeedButton;
    sbConvenioLog: TSpeedButton;
    updConveniosPessoas: TZUpdateSQL;
    qyNfeConvenio: TUMZQuery;
    qyNfeConveniocd_convenio_pessoa: TIntegerField;
    qyNfeConvenionm_pessoa: TStringField;
    qyNfeConveniodt_inicial: TDateTimeField;
    qyNfeConveniodt_final: TDateTimeField;
    qyNfeConveniods_ativo: TStringField;
    qyNfeConveniosn_ativo: TSmallintField;
    qyNfeConveniocd_convenio: TLargeintField;
    qyNfeConveniods_cursos: TMemoField;
    qyNfeConveniosn_contrato: TStringField;
    dsNfeConvenio: TDataSource;
    qyNfeConveniome_pdf: TBlobField;
    procedure sbConvenioLogClick(Sender: TObject);
    procedure txtNomeEmpresaClick(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbSelecionePDFClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbFecharClick(Sender: TObject);
    procedure sbSelecionarPessoaClick(Sender: TObject);
  private
    cd_pessoa                 : integer;
    objConvenio               : ^TCovenio;
    sn_atualiza_contrato      : Boolean;
    sn_forca_salvar_contrato  : Boolean;
    function getPDFNaBase()   : Boolean;
    function existePessoa()   : Boolean;
    procedure gravaLog( acao  : string );

    procedure carregaValoresConvenio();

    { Private declarations }
  public
    procedure setCdPessoa( vl_cd_pessoa : integer );
    { Public declarations }
  end;

var
  frmCadConvenioEmpresa: TfrmCadConvenioEmpresa;

implementation

uses uDM, uUsuario, ClassPessoa, uFSelecionarPessoa;

{$R *.dfm}

procedure TfrmCadConvenioEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qyNfeConvenio.Cancel;
   frmCadConvenioPgto.qyNfeConveniosEmpresas.Close;
   frmCadConvenioPgto.qyNfeConveniosEmpresas.Open;

   if objConvenio <> nil then
   begin
      Dispose( objConvenio );
   end;

   if cd_pessoa <> 0 then
   begin
      frmCadConvenioPgto.qyNfeConveniosEmpresas.Locate('cd_pessoa', cd_pessoa, [loPartialKey]);
   end;

   Action := caFree;
end;

procedure TfrmCadConvenioEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5  : if btnSalvar.Enabled   then btnSalvarClick( nil );
      VK_F6  : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F12 : Self.Close;
   end;
end;

procedure TfrmCadConvenioEmpresa.FormShow(Sender: TObject);
begin
   if qyNfeConvenio.State in [dsEdit] then
   begin
      Self.carregaValoresConvenio();
   end;
   
   if Self.getPDFNaBase() = false then
   begin
      txtPDF.Text := '';
   end
   else
   begin
      txtPDF.Text := 'Contrato Codificado.'
   end;

   sn_atualiza_contrato       := false;
   sn_forca_salvar_contrato   := false;
   sbExportar.Enabled         := Self.getPDFNaBase();
end;

function TfrmCadConvenioEmpresa.getPDFNaBase: Boolean;
var
   bValor : Boolean;
begin
   bValor   := not TBlobField(qyNfeConvenio.FieldByName('me_pdf')).IsNull;
   result   := bValor;
end;

procedure TfrmCadConvenioEmpresa.gravaLog(acao : string);
var
   cd_convenio    : string;
   chave_log      : string;
   ds_alteracoes  : string;
   sn_ativo_old   : string;
   sn_ativo_new   : string;
begin

   if acao = 'insert' then
   begin
      cd_convenio := IntToStr( DM.LastInsert );

      ds_alteracoes := chr(13) + 'Código da pessoa: ' + IntToStr(cd_pessoa);

      if qyNfeConveniodt_inicial.AsDateTime <> 0 then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Data Inicial: ' + datetostr(qyNfeConveniodt_inicial.AsDateTime);
      end
      else
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Data Inicial: Não definida.';
      end;

      if qyNfeConveniodt_final.AsDateTime <> 0 then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Data Final: ' + datetostr(qyNfeConveniodt_final.AsDateTime);
      end
      else
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Data Final: Não Definida';
      end;

      if sn_atualiza_contrato = true then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Contrato: Foi selecionado.';
      end
      else
      begin
         if (sn_forca_salvar_contrato = true) and (dbAtivo.Checked) then
         begin
            ds_alteracoes := ds_alteracoes + chr(13) + 'Contrato: O usuário optou por incluir e ativar o convênio sem o contrato.';
         end;
      end;

      if qyNfeConveniosn_ativo.AsInteger = 1 then
      begin
         sn_ativo_new := 'Sim';
      end
      else
      begin
         sn_ativo_new := 'Falta Contrato.';
      end;

      ds_alteracoes := ds_alteracoes + chr(13) + 'Status de ativação: "' + sn_ativo_new + '".' ;

      chave_log   := cd_convenio + ':' + IntToStr(cd_pessoa) + ':ControlePgto';
      DM.setLog( frmCadConvenioPgto.getCdModulo(), 'Inclusao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Incluido um convênio de código ' + cd_convenio + '. Campos preenchidos: ' + ds_alteracoes );
   end;

   if acao = 'edit' then
   begin
      cd_convenio    := qyNfeConveniocd_convenio.AsString;
      chave_log      := cd_convenio + ':' + IntToStr(cd_pessoa)+ ':ControlePgto';;
      ds_alteracoes  := '';

      if objConvenio.cd_pessoa <> IntToStr(cd_pessoa) then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Código da pessoa: Mudou de ' + objConvenio.cd_pessoa + ' para ' + IntToStr(cd_pessoa);
      end;

      if objConvenio.dt_inicial <> qyNfeConveniodt_inicial.AsDateTime then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Data Inicial: Mudou de ' + datetostr(objConvenio.dt_inicial) + ' para ' + datetostr(qyNfeConveniodt_inicial.AsDateTime);
      end;

      if objConvenio.dt_final <> qyNfeConveniodt_final.AsDateTime then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Data Final: Mudou de ' + datetostr(objConvenio.dt_final) + ' para ' + datetostr(qyNfeConveniodt_final.AsDateTime);
      end;

      if sn_atualiza_contrato = true then
      begin
         ds_alteracoes := ds_alteracoes + chr(13) + 'Contrato: Foi selecionado.';
      end
      else
      begin
         if (sn_forca_salvar_contrato = true) and (dbAtivo.Checked) then
         begin
            ds_alteracoes := ds_alteracoes + chr(13) + 'Contrato: O usuário optou por alterar e ativar o convênio sem selecionar o contrato.';
         end;
      end;

      if objConvenio.sn_ativo <> qyNfeConveniosn_ativo.AsInteger then
      begin
         if objConvenio.sn_ativo = 1 then
         begin
            sn_ativo_old := 'Sim';
         end
         else
         begin
            sn_ativo_old := 'Falta Contrato.';
         end;

         if qyNfeConveniosn_ativo.AsInteger = 1 then
         begin
            sn_ativo_new := 'Sim';
         end
         else
         begin
            sn_ativo_new := 'Falta Contrato.';
         end;
         
         ds_alteracoes := ds_alteracoes + chr(13) + 'O status de ativação do convênio mudou de "' + sn_ativo_old + '" para "' + sn_ativo_new + '".' ;
      end;

      if ds_alteracoes <> '' then
      begin
         DM.setLog( frmCadConvenioPgto.getCdModulo(), 'Alteracao', chave_log , DM.UsuarioLogado.ColigadaLogada, 'Alterações efetuadas: ' + ds_alteracoes );
      end;
   end;
  
end;

procedure TfrmCadConvenioEmpresa.sbExportarClick(Sender: TObject);
var
   sCaminho : string;
begin
   if sdSalvarPDF.Execute then
   begin
      sCaminho := sdSalvarPDF.FileName;
   end;

   if sCaminho <> '' then
   begin
      TBlobField(qyNfeConvenio.FieldByName('me_pdf')).SaveToFile( sCaminho );
   end;
end;

procedure TfrmCadConvenioEmpresa.sbLimparClick(Sender: TObject);
begin
   if Mensagem('Deseja apagar o contrato?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mryes then
   begin
      TBlobField(qyNfeConvenio.FieldByName('me_pdf')).Clear;
      txtPDF.Text := '';
      qyNfeConveniosn_ativo.AsInteger := 0;
      sn_atualiza_contrato := true;

      sbExportar.Enabled := Self.getPDFNaBase();
   end;
end;

procedure TfrmCadConvenioEmpresa.sbSelecionarPessoaClick(Sender: TObject);
var
   nm_pessoa      : string;
   resultado      : TResultadoFiltroPessoa;
begin
   nm_pessoa      := '';

   resultado := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

   if resultado.filtrado then
   begin
      cd_pessoa := resultado.cd_pessoa;
      nm_pessoa := resultado.nm_pessoa;
   end;

   //atribui o retorno aos campos
   if  (cd_pessoa <> 0) and (nm_pessoa <> '')  then
   begin
      qyNfeConvenio.FieldByName('cd_pessoa').AsInteger := cd_pessoa;
      txtNomeEmpresa.Text := nm_pessoa;
   end;

end;

procedure TfrmCadConvenioEmpresa.sbSelecionePDFClick(Sender: TObject);
var
   sCaminho : string;
begin
   try

      if odAbrirPDF.Execute then
      begin
         sCaminho       := odAbrirPDF.FileName;
      end;

      if sCaminho <> '' then
      begin
         txtPDF.Text :=  sCaminho;
         TBlobField(qyNfeConvenio.FieldByName('me_pdf')).LoadFromFile(txtPDF.Text);

         qyNfeConveniosn_ativo.AsInteger := 1;
         sn_atualiza_contrato := true;
      end;

   except

      if sCaminho <> '' then
      begin
         txtPDF.Text :=  '';
         qyNfeConveniosn_ativo.AsInteger := 0;
         Mensagem('Não foi possivel importar o arquivo PDF. O arquivo está com problema ou não existe.',   'Atenção'    , MB_OK + MB_ICONQUESTION);
      end;

   end;

   sbExportar.Enabled := Self.getPDFNaBase();
end;

procedure TfrmCadConvenioEmpresa.setCdPessoa(vl_cd_pessoa: integer);
begin
   Self.cd_pessoa := vl_cd_pessoa;
end;

procedure TfrmCadConvenioEmpresa.sbConvenioLogClick(Sender: TObject);
var
   cd_chave_log   : string;
   cd_convenio    : string;
   cd_pessoa      : string;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.ConvenioPgto', npAcesso, True ) then Exit;
   Application.CreateForm( TfrmConvenioEmpresaLog, frmConvenioEmpresaLog );

   cd_convenio    := qyNfeConveniocd_convenio.AsString;
   cd_pessoa      := qyNfeConveniocd_convenio_pessoa.AsString;
   cd_chave_log   := cd_convenio + ':' + cd_pessoa + ':ControlePgto';

   frmConvenioEmpresaLog.setCdModulo( frmCadConvenioPgto.getCdModulo() );
   frmConvenioEmpresaLog.setCdChave( cd_chave_log );

   frmConvenioEmpresaLog.ShowModal;
end;

procedure TfrmCadConvenioEmpresa.btnCancelarClick(Sender: TObject);
begin
   qyNfeConvenio.Cancel;
   Self.Close();
end;

procedure TfrmCadConvenioEmpresa.tbFecharClick(Sender: TObject);
begin
   qyNfeConvenio.Cancel;
   Self.Close();
end;

procedure TfrmCadConvenioEmpresa.txtNomeEmpresaClick(Sender: TObject);
begin
   if trim(txtNomeEmpresa.Text) = '' then
   begin
      sbSelecionarPessoa.OnClick(nil);
   end;
end;

procedure TfrmCadConvenioEmpresa.btnSalvarClick(Sender: TObject);
const
   SQL_INSERT_NU_GRUPOS_PESSOA = 'INSERT INTO nu_grupos_pessoas (cd_grupo, cd_pessoa) VALUES ((SELECT cd_grupo FROM nu_grupos WHERE ds_papel = ''EMPRESAS''), :cd_pessoa )';
var
   acao : string;
   objPessoa: TClassePessoa;
   qyInsereGrupo: TUMZQuery;
begin
   if cd_pessoa <> 0  then
   begin
      if qyNfeConvenio.State in [dsInsert] then
      begin
         //verifica se a pessoa já existe em banco de dados.
         if Self.existePessoa() = true then
         begin
            exit;
         end;
      end;

      if dbAtivo.Checked then
      begin
         if Self.getPDFNaBase() = false then
         begin
            if Mensagem('Falta anexar o contrato. Deseja continuar?', 'Atenção', MB_YESNO + MB_ICONWARNING) = mryes then
            begin
               sn_forca_salvar_contrato := true;
            end
            else
            begin
               exit;
            end;

            objPessoa := TClassePessoa.Create(cd_pessoa);
            //atualiza o login
            if (objPessoa.Login = '') then
            begin
               objPessoa.setLogin( objPessoa.CNPJ );

            end;

            //atualiza a senha
            if (objPessoa.Senha = '')  then
            begin
               objPessoa.setSenha( objPessoa.CNPJ );
            end;
         end;
      end;

      if qyNfeConvenio.State in [dsInsert] then
      begin
         acao := 'insert';
      end;

      if qyNfeConvenio.State in [dsEdit] then
      begin
         acao := 'edit';
      end;

      qyNfeConvenio.Post;

      Self.gravaLog( acao );

      Self.Close();
   end
   else
   begin
      Mensagem('Selecione a pessoa.', 'Atenção', MB_OK + MB_ICONINFORMATION );
   end;
end;

procedure TfrmCadConvenioEmpresa.carregaValoresConvenio;
begin
   New(objConvenio);
   objConvenio.cd_pessoa   := qyNfeConveniocd_convenio_pessoa.AsString;
   objConvenio.dt_inicial  := qyNfeConveniodt_inicial.AsDateTime;
   objConvenio.dt_final    := qyNfeConveniodt_final.AsDateTime;
   objConvenio.sn_ativo    := qyNfeConveniosn_ativo.AsInteger;
end;

function TfrmCadConvenioEmpresa.existePessoa: Boolean;
var
   qyConvenio        : TUMZQuery;
   nm_pessoa         : string;
   cd_convenio       : string;
begin
   DM.CriarConsulta( qyConvenio );
   qyConvenio.Close;
   qyConvenio.SQL.Clear;
   qyConvenio.SQL.Text := 'SELECT '+
                          '  fnc.cd_convenio, '+
                          '  fnc.cd_pessoa, '+
                          '  p.nm_pessoa '+
                          'FROM '+
                          '  fin_nfe_convenios fnc '+
                          '  INNER JOIN pessoas p ON (p.cd_pessoa = fnc.cd_pessoa) '+
                          ' WHERE '+
                          '  fnc.cd_pessoa = :cd_pessoa';

   qyConvenio.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyConvenio.Open;

   if qyConvenio.RecordCount >= 1 then
   begin
      nm_pessoa   := qyConvenio.FieldByName('nm_pessoa').AsString;
      cd_convenio := qyConvenio.FieldByName('cd_convenio').AsString;
      result := true;

      FreeAndNil( qyConvenio );
      Mensagem('A empresa ' + nm_pessoa + ' já possui um convênio.' + chr(13) +
      'Nº Convênio: ' + cd_convenio, 'Atenção', MB_OK + MB_ICONWARNING);
   end
   else
   begin


      result := false;
   end;
end;

end.
