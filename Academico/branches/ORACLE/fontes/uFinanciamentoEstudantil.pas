unit uFinanciamentoEstudantil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, uFSelecionarPessoa, DB, ZConnection, uDM, StdCtrls,
  DBCtrls, ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Mask, UMLookupComboBox, Buttons;

type
  TfrmFinanciamentoEstudantil = class(TForm)
    pgFinanciamento: TPageControl;
    toolFinanciamento: TToolBar;
    tsTiposBolsa: TTabSheet;
    tsTiposAtividade: TTabSheet;
    ToolButton1: TToolButton;
    btSalvar: TToolButton;
    ImageList1: TImageList;
    btCancelar: TToolButton;
    ToolButton4: TToolButton;
    btBuscar: TToolButton;
    ToolButton6: TToolButton;
    btFechar: TToolButton;
    dsPessoa: TDataSource;
    tblPessoa: TUMZQuery;
    tblPessoacd_pessoa: TIntegerField;
    tblPessoasn_re_fies: TSmallintField;
    tblPessoasn_re_governo_estadual: TSmallintField;
    tblPessoasn_re_governo_municipal: TSmallintField;
    tblPessoasn_re_ies: TSmallintField;
    tblPessoasn_re_entidades_externas: TSmallintField;
    tblPessoasn_re_outros: TSmallintField;
    tblPessoasn_nre_prouni_integral: TSmallintField;
    tblPessoasn_nre_prouni_parcial: TSmallintField;
    tblPessoasn_nre_ies: TSmallintField;
    tblPessoasn_nre_governo_estadual: TSmallintField;
    tblPessoasn_nre_governo_municipal: TSmallintField;
    tblPessoasn_nre_entidades_externas: TSmallintField;
    tblPessoasn_nre_outros: TSmallintField;
    tblPessoasn_as_alimentacao: TSmallintField;
    tblPessoasn_as_moradia: TSmallintField;
    tblPessoasn_as_transporte: TSmallintField;
    tblPessoasn_as_mat_didatico: TSmallintField;
    tblPessoasn_as_bolsa_trabalho: TSmallintField;
    tblPessoasn_as_bolsa_permanencia: TSmallintField;
    tblPessoasn_at_complementar: TSmallintField;
    tblPessoasn_at_pesquisa: TSmallintField;
    tblPessoasn_at_extensao: TSmallintField;
    tblPessoasn_at_monitoria: TSmallintField;
    tblPessoasn_at_extracurricular: TSmallintField;
    tblPessoasn_at_re_pesquisa: TSmallintField;
    tblPessoasn_at_re_extensao: TSmallintField;
    tblPessoasn_at_re_monitoria: TSmallintField;
    tblPessoasn_at_re_extracurricular: TSmallintField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dbcbReFies: TDBCheckBox;
    dbcbReGovernoEstadual: TDBCheckBox;
    dbcbReGovernoMunicipal: TDBCheckBox;
    dbcbReIes: TDBCheckBox;
    dbcbReEntidadesExternas: TDBCheckBox;
    dbcbReOutros: TDBCheckBox;
    dbcbNreProUniIntegral: TDBCheckBox;
    dbcbNreProUniParcial: TDBCheckBox;
    dbcbNreIes: TDBCheckBox;
    dbcbNreGovernoEstadual: TDBCheckBox;
    dbcbNreGovernoMunicipal: TDBCheckBox;
    dbcbNreEntidadesExternas: TDBCheckBox;
    dbcbNreOutros: TDBCheckBox;
    Panel3: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    dsNomePessoa: TDataSource;
    tblNomePessoa: TUMZQuery;
    tblNomePessoanm_pessoa: TStringField;
    GroupBox3: TGroupBox;
    dbcbAtPesquisa: TDBCheckBox;
    dbcbAtExtensao: TDBCheckBox;
    dbcbAtMonitoria: TDBCheckBox;
    dbcbAtExtraCurricular: TDBCheckBox;
    dbrgPesquisa: TDBRadioGroup;
    dbrgExtensao: TDBRadioGroup;
    dbrgMonitoria: TDBRadioGroup;
    dbrgExtraCurricular: TDBRadioGroup;
    lbSelecione: TLabel;
    gbTipoSocial: TGroupBox;
    dbcbAlimentacao: TDBCheckBox;
    dbcbMoradia: TDBCheckBox;
    dbcbTransporte: TDBCheckBox;
    dbcbMatDidatico: TDBCheckBox;
    dbcbBolsaTrab: TDBCheckBox;
    dbcbBolsaPerm: TDBCheckBox;
    dbcbAtivFormacao: TDBCheckBox;
    pnFiltro: TPanel;
    dbnAnos: TDBNavigator;
    Label2: TLabel;
    dbAnoCenso: TDBEdit;
    tblPessoacd_curso: TStringField;
    dsCursos: TDataSource;
    qyCursos: TUMZQuery;
    Label1: TLabel;
    tblPessoanr_ano_censo: TIntegerField;
    qyCursoscd_curso: TStringField;
    qyCursosds_curso: TStringField;
    tblPessoads_curso: TStringField;
    cbCategoria: TUMLookupComboBox;
    pnCopia: TPanel;
    Label3: TLabel;
    btnCopiar: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    tblPessoacd_pessoa_bolsa: TIntegerField;
    tblPessoasn_parfor: TSmallintField;
    DBCheckBox3: TDBCheckBox;
    tblPessoasn_bolsa_educa_mais_brasil: TIntegerField;
    procedure btnCopiarClick(Sender: TObject);
    procedure tblPessoaBeforeEdit(DataSet: TDataSet);
    procedure tblPessoaBeforeInsert(DataSet: TDataSet);
    procedure dsPessoaStateChange(Sender: TObject);
    procedure dbnAnosBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure dbcbAtivFormacaoClick(Sender: TObject);
    procedure pgFinanciamentoChange(Sender: TObject);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure dbcbAtExtraCurricularClick(Sender: TObject);
    procedure dbcbAtMonitoriaClick(Sender: TObject);
    procedure dbcbAtExtensaoClick(Sender: TObject);
    procedure dbcbAtPesquisaClick(Sender: TObject);
    procedure tblPessoaBeforePost(DataSet: TDataSet);
    procedure tblPessoaBeforeCancel(DataSet: TDataSet);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    cd_pessoa: Integer ;
    procedure abreCampos(bPesquisa, bExtensao, bMonitoria, bExtraCurricular: boolean);
  public
    { Public declarations }
  end;

var
  frmFinanciamentoEstudantil: TfrmFinanciamentoEstudantil;

implementation
   uses General,uFCopiaFinanciamento;
{$R *.dfm}

procedure TfrmFinanciamentoEstudantil.btCancelarClick(Sender: TObject);
begin
   if(tblPessoa.State in [dsEdit, dsInsert])then
      tblPessoa.Cancel();
end;

procedure TfrmFinanciamentoEstudantil.btFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmFinanciamentoEstudantil.btnCopiarClick(Sender: TObject);
begin
   formCopiaFinanceiro.Show;
end;

procedure TfrmFinanciamentoEstudantil.btSalvarClick(Sender: TObject);
var censo : string;
begin
   censo := '';
   {ajusta o ano censo para salvar}
   censo := dbAnoCenso.Text;
   censo := Copy(censo, 0 , 4);
   if(tblPessoa.State in [dsEdit, dsInsert])then
      tblPessoanr_ano_censo.Text := censo;
      tblPessoa.Post();
end;

procedure TfrmFinanciamentoEstudantil.dbcbAtExtensaoClick(Sender: TObject);
begin
   if(pgFinanciamento.ActivePage = tsTiposAtividade)then
   begin
      abreCampos(dbcbAtPesquisa.checked, dbcbAtExtensao.Checked, dbcbAtMonitoria.Checked, dbcbAtExtraCurricular.checked);
   end;
end;

procedure TfrmFinanciamentoEstudantil.dbcbAtExtraCurricularClick(
  Sender: TObject);
begin
   if(pgFinanciamento.ActivePage = tsTiposAtividade)then
   begin
      abreCampos(dbcbAtPesquisa.checked, dbcbAtExtensao.Checked, dbcbAtMonitoria.Checked, dbcbAtExtraCurricular.checked);
   end;
end;

procedure TfrmFinanciamentoEstudantil.dbcbAtMonitoriaClick(Sender: TObject);
begin
   if(pgFinanciamento.ActivePage = tsTiposAtividade)then
   begin
      abreCampos(dbcbAtPesquisa.checked, dbcbAtExtensao.Checked, dbcbAtMonitoria.Checked, dbcbAtExtraCurricular.checked);
   end;
end;

procedure TfrmFinanciamentoEstudantil.dbcbAtPesquisaClick(Sender: TObject);
begin
   if(pgFinanciamento.ActivePage = tsTiposAtividade)then
   begin
      abreCampos(dbcbAtPesquisa.checked, dbcbAtExtensao.Checked, dbcbAtMonitoria.Checked, dbcbAtExtraCurricular.checked);
   end;
end;

procedure TfrmFinanciamentoEstudantil.dbnAnosBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
   if (Button = nbInsert) then
   begin
      cd_pessoa := tblPessoacd_pessoa.AsInteger;
   end
   else if (Button = nbDelete) then begin
      if(Mensagem('Deseja efetuar a exclusão deste registro?', Application.Title, MB_YESNO, Handle) = mrNo) then
      begin
         Abort;
      end;
   end;
end;

procedure TfrmFinanciamentoEstudantil.dbcbAtivFormacaoClick(Sender: TObject);
begin
   GroupBox3.Visible := dbcbAtivFormacao.Checked;
end;

procedure TfrmFinanciamentoEstudantil.dsPessoaDataChange(Sender: TObject;
  Field: TField);
begin
   if(pgFinanciamento.ActivePage = tsTiposAtividade)then
   begin
      abreCampos(dbcbAtPesquisa.checked, dbcbAtExtensao.Checked, dbcbAtMonitoria.Checked, dbcbAtExtraCurricular.checked);
   end;

   qyCursos.Close;
   qyCursos.ParamByName('cd_pessoa').AsString := tblPessoacd_pessoa.AsString;
   qyCursos.Open;
end;

procedure TfrmFinanciamentoEstudantil.dsPessoaStateChange(Sender: TObject);
begin
   if tblPessoa.State in [dsInsert] then
   begin
      tblPessoacd_pessoa.AsInteger := cd_pessoa;
   end;
end;

procedure TfrmFinanciamentoEstudantil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmFinanciamentoEstudantil.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_F5:  btSalvarClick( nil );
      VK_F6:  btCancelarClick( nil );
      VK_F8:  btBuscarClick( nil );
      VK_F12: btFecharClick( nil );
   end;
end;

procedure TfrmFinanciamentoEstudantil.FormShow(Sender: TObject);
begin
   cd_pessoa := -1;
   Application.CreateForm( TformCopiaFinanceiro, formCopiaFinanceiro );
end;

procedure TfrmFinanciamentoEstudantil.pgFinanciamentoChange(Sender: TObject);
begin
   if(pgFinanciamento.ActivePage = tsTiposAtividade)then
   begin
      abreCampos(dbcbAtPesquisa.checked, dbcbAtExtensao.Checked, dbcbAtMonitoria.Checked, dbcbAtExtraCurricular.checked);
   end;
end;

procedure TfrmFinanciamentoEstudantil.tblPessoaBeforeCancel(DataSet: TDataSet);
begin
   btSalvar.Enabled := False;
   btCancelar.Enabled := False;
end;

procedure TfrmFinanciamentoEstudantil.tblPessoaBeforeEdit(DataSet: TDataSet);
begin
   btSalvar.Enabled := True;
   btCancelar.Enabled := True;
end;

procedure TfrmFinanciamentoEstudantil.tblPessoaBeforeInsert(DataSet: TDataSet);
begin
   btSalvar.Enabled := True;
   btCancelar.Enabled := True;
end;

procedure TfrmFinanciamentoEstudantil.tblPessoaBeforePost(DataSet: TDataSet);
var
   qryVerificaDuplicidade: TUMZQuery;
begin

   if (tblPessoacd_curso.AsString = '') then
   begin
      Mensagem('Você deve selecionar um curso para o financiamento.', Application.Title, MB_OK, Handle);
      tblPessoa.Cancel;
      exit;
   end;

   if ((tblPessoa.State = dsInsert) or
      (tblPessoacd_curso.CurValue <> tblPessoacd_curso.AsString) or
      (tblPessoanr_ano_censo.CurValue <> tblPessoanr_ano_censo.AsString)) then
   begin
      DM.CriarConsulta(qryVerificaDuplicidade);
      qryVerificaDuplicidade.SQL.Add('SELECT count(*) as cont FROM pessoas_bolsas where cd_pessoa = :pessoa and nr_ano_censo = :ano and cd_curso = :curso');
      qryVerificaDuplicidade.ParamByName('pessoa').AsString := tblPessoacd_pessoa.AsString;
      qryVerificaDuplicidade.ParamByName('ano').AsString := tblPessoanr_ano_censo.AsString;
      qryVerificaDuplicidade.ParamByName('curso').AsString := tblPessoacd_curso.AsString;
      qryVerificaDuplicidade.Open;

      if(qryVerificaDuplicidade.FieldByName('cont').AsInteger > 0) then
      begin
         Mensagem('Esse aluno já possui um financiamento nesta turma e neste ano.', Application.Title, MB_OK, Handle);
         tblPessoa.Cancel;
         exit;
      end;
   end;

   btSalvar.Enabled := False;
   btCancelar.Enabled := False;
end;

procedure TfrmFinanciamentoEstudantil.abreCampos(bPesquisa, bExtensao, bMonitoria, bExtraCurricular: boolean);
begin

   dbrgPesquisa.Visible := bPesquisa;
   dbrgPesquisa.Enabled := bPesquisa;

   dbrgExtensao.Visible := bExtensao;
   dbrgExtensao.Enabled := bExtensao;

   dbrgMonitoria.Visible := bMonitoria;
   dbrgMonitoria.Enabled := bMonitoria;

   dbrgExtraCurricular.Visible := bExtraCurricular;
   dbrgExtraCurricular.Enabled := bExtraCurricular;

   GroupBox3.Visible := dbcbAtivFormacao.Checked;
end;

procedure TfrmFinanciamentoEstudantil.btBuscarClick(Sender: TObject);
var
   qPessoaBolsa   : TUMZQuery;
   cd_pessoa      : integer;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   //Inicia variáveis
   qPessoaBolsa   := nil;
   cd_pessoa      := 0;

   //Abre tela de Busca
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   //A tela de busca retorna o código da pessoa
   if resultado_filtro.filtrado then
   begin
   
      if pnCopia.Visible = true then
      begin
         pnCopia.Visible := false;   
      end;

      //Recupera o código da pessoa selecionada
      cd_pessoa := resultado_filtro.cd_pessoa;

      //Verifica se essa pessoa já possui informações na tabela de pessoas_bolsas
      tblPessoa.Close;
      tblPessoa.Sql.Text := 'Select * from pessoas_bolsas Where cd_pessoa = ' + IntToStr(cd_pessoa);
      tblPessoa.Open;

      //Se não existir registro pergunta se quer incluir
      if tblPessoa.RecordCount = 0 then
      begin
         if Mensagem('Esse aluno não possui Financiamento Estudantil, deseja incluir?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
         begin
            //Insere o aluno na tabela de pessoas_bolsas
            DM.CriarConsulta( qPessoaBolsa );
            qPessoaBolsa.Close;
            qPessoaBolsa.SQL.Text := 'INSERT INTO pessoas_bolsas (cd_pessoa) VALUES (:cd_pessoa)';
            qPessoaBolsa.ParamByName('cd_pessoa').Value := cd_pessoa;
            qPessoaBolsa.ExecSQL;

            //Libera objeto da memória
            FreeAndNil(qPessoaBolsa);

            //Recupera o aluno novamente na tabela de pessoas_bolsas já que acabou de incluir
            tblPessoa.Close;
            tblPessoa.Sql.Text := 'Select * from pessoas_bolsas Where cd_pessoa = :cd_pessoa';
            tblPessoa.ParamByName('cd_pessoa').Value := cd_pessoa;
            tblPessoa.Open;
         end;
      end;

      //Se houver pessoa na tabela de pessoas_bolsa habilita os controles.
      if tblPessoa.RecordCount > 0 then
      begin
         //Habilita os controles
         lbSelecione.Visible  := False;
         GroupBox1.Enabled    := True;
         GroupBox2.Enabled    := True;
         GroupBox3.Enabled    := True;
         gbTipoSocial.Enabled := True;

         //Busca o nome da pessoa
         tblNomePessoa.Close;
         tblNomePessoa.SQL.Clear();
         tblNomePessoa.SQL.Text := 'SELECT nm_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa';
         tblNomePessoa.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
         tblNomePessoa.Open;
      end
      else
      Begin
         tblPessoa.Close;
         tblNomePessoa.Close;
         cd_pessoa            := 0;
         lbSelecione.Visible  := True;
         GroupBox1.Enabled    := False;
         GroupBox2.Enabled    := False;
         GroupBox3.Enabled    := False;
         gbTipoSocial.Enabled := False;
      end;


   end;

end;

end.


