unit uPessoasInfoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uPessoasInformacoes, Mask, DBCtrls, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,DB, ZConnection,
  dblookup, ClassRegistros ,uItemCombo, UMComboBox, ComCtrls, UMDateTimePicker, uPessoas_adicional, uUsuario;

type
  TfPessoasInfoCad = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    qryPessoas: TUMZQuery;
    qryPessoascd_pessoa: TIntegerField;
    qryPessoasnm_pessoa: TStringField;
    PageControl1: TPageControl;
    tsInfo: TTabSheet;
    tsObs: TTabSheet;
    Panel3: TPanel;
    pannelobs: TPanel;
    Panel4: TPanel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Panel2: TPanel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Panel5: TPanel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Panel6: TPanel;
    lbl11: TLabel;
    DBMemo1: TDBMemo;
    qryInfoPor: TUMZQuery;
    pnCima: TPanel;
    dbDsInformacao: TDBMemo;
    Label2: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    Label11: TLabel;
    Label16: TLabel;
    cbStatus: TUMComboBox;
    nm_vendedor: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    cbNomePessoa: TComboBox;
    sbSelecionaPessoa: TSpeedButton;
    pnBaixo: TPanel;
    lblFone1: TLabel;
    lblFone2: TLabel;
    lblFone3: TLabel;
    lblFone4: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    btnCodigoCurso: TSpeedButton;
    Label7: TLabel;
    btnCodigoTurma: TSpeedButton;
    btnImprimirRelatorio: TSpeedButton;
    btnAreaAssunto: TSpeedButton;
    lblEstado: TLabel;
    sbBuscaCep: TSpeedButton;
    lbCep: TLabel;
    lblCidade: TLabel;
    lbBairro: TLabel;
    Label13: TLabel;
    LabelNumero: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    sbMaisInformacoes: TSpeedButton;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    cbAreaAssunto: TUMComboBox;
    DBEdit6: TDBEdit;
    DBEdit13: TDBEdit;
    dbe_turma: TDBEdit;
    dblcEstados: TDBLookupComboBox;
    dbCep: TDBEdit;
    dblcMunicipios: TDBLookupComboBox;
    dbBairro: TDBEdit;
    DBEdit3: TDBEdit;
    edNumero: TDBEdit;
    cbFormaConheceu: TComboBox;
    DBEdit5: TDBEdit;
    umdtRetorno: TUMDateTimePicker;
    checksnretorno: TCheckBox;
    dbe_horaRetorno: TDBEdit;
    cbInfoPor: TUMComboBox;
    pnMeio: TPanel;
    dbComplemento: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    umdtFiltroFim: TUMDateTimePicker;
    dbDependente: TDBEdit;
    Label19: TLabel;
    qryInserirPessoasInfoObservacao: TUMZQuery;
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);
    procedure btnImprimirRelatorioClick(Sender: TObject);
    procedure DBEdit13Change(Sender: TObject);
    procedure sbBuscaCepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure btnAreaAssuntoClick(Sender: TObject);
    procedure checksnretornoClick(Sender: TObject);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure cbNomePessoaExit(Sender: TObject);
    procedure sbSelecionaPessoaClick(Sender: TObject);
    procedure cbNomePessoaChange(Sender: TObject);
    procedure cbNomePessoaSelect(Sender: TObject);
    procedure cbNomePessoaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure dbDependenteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    function  get_codigo_curso() : String;
  private
   Fpermissao: TUMPermissoes;
    function salvarContato:boolean;
    procedure montaCombo(codigo : Integer);
    procedure preencheComboAreaAssunto;
    procedure preencheComboInfoPor;
    procedure preencheComboStatus;
    procedure selecionarOpcaoCombo();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPessoasInfoCad: TfPessoasInfoCad;
  bIncluindo: boolean;
  cursoFiltrado: String;
  anoSemestreUsado: Integer;
  cd_info_contatos_cadastro : Integer;
  
implementation

uses
   Main, uFSelecionarCurso, uFSelecionarTurma, uDM, uFSelecionarPessoa,
   uListaColigadas, uColigada, uFCadAssuntoArea, uSelCep;

{$R *.dfm}

procedure TfPessoasInfoCad.btnOkClick(Sender: TObject);
begin
   if ( bIncluindo )  then
      Close();

   if (salvarContato()) then
   begin
      fPessoasInformacoes.preencheAreaAssuntos;
      fPessoasInformacoes.Filtrar();
      Close();
   end;
end;

procedure TfPessoasInfoCad.cbNomePessoaChange(Sender: TObject);
begin
   fPessoasInformacoes.qryPessoasInfoFiltrarnm_pessoa.AsString := cbNomePessoa.Text;

end;

procedure TfPessoasInfoCad.cbNomePessoaExit(Sender: TObject);
begin
   try
      if (cbNomePessoa.ItemIndex = -1) AND qryPessoas.Active then
      begin
         if qryPessoas.Locate('nm_pessoa', cbNomePessoa.Text, [loCaseInsensitive]) then
         begin
            fPessoasInformacoes.qryPessoasInfoFiltrarnm_pessoa.AsString :=
               qryPessoasnm_pessoa.AsString;
            fPessoasInformacoes.qryPessoasInfoFiltrarcd_pessoa.AsInteger :=
            qryPessoascd_pessoa.AsInteger;
         end;
      end;
   except on E: Exception do
   end;

end;

procedure TfPessoasInfoCad.cbNomePessoaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      qryPessoas.Close;
      qryPessoas.ParamByName('nm_pessoa').AsString := cbNomePessoa.Text + '%';
      qryPessoas.Open;
      cbNomePessoa.Items.Clear;
      while not qryPessoas.Eof do
      begin
         cbNomePessoa.AddItem(qryPessoasnm_pessoa.AsString, qryPessoas.GetBookmark);
         qryPessoas.Next;
      end;
      cbNomePessoa.SelectAll;
   end;
end;

procedure TfPessoasInfoCad.cbNomePessoaSelect(Sender: TObject);
begin
   if cbNomePessoa.Items.Objects[cbNomePessoa.ItemIndex] <> nil then
   begin
      qryPessoas.GotoBookmark(Pointer(cbNomePessoa.Items.Objects[cbNomePessoa.ItemIndex]));
      fPessoasInformacoes.qryPessoasInfoFiltrarcd_pessoa.AsInteger := qryPessoascd_pessoa.AsInteger;
      fPessoasInformacoes.qryPessoasInfoFiltrarnm_pessoa.AsString := qryPessoasnm_pessoa.AsString;
   end;
end;

procedure TfPessoasInfoCad.cbStatusChange(Sender: TObject);
var
   qyStatus: TUMZQuery;
   auxiliarAtual : Integer;
   auxiliarNovo : Integer;
   i: integer;
begin
   auxiliarAtual := 0;
   auxiliarNovo := 0;
   
   if(cbStatus.Text = 'Selecione')then
   begin
      exit;
   end;

   if(cbStatus.Text = fPessoasInformacoes.qryPessoasInfoFiltrards_status.AsString) THEN
   begin
      exit;
   end;

   DM.CriarConsulta(qyStatus);
   qyStatus.SQL.Text := 'SELECT ds_valor, cd_auxiliar from situacoes where cd_modulo = 1035 and cd_auxiliar in (1,99,100) order by ds_valor';
   qyStatus.Open;
   while not (qyStatus.Eof) do
   begin
      if (cbStatus.Text = qyStatus.FieldByName('ds_valor').AsString) then
      begin
         auxiliarNovo := qyStatus.FieldByName('cd_auxiliar').AsInteger;
      end;

      if (fPessoasInformacoes.qryPessoasInfoFiltrards_status.AsString = qyStatus.FieldByName('ds_valor').AsString) then
      begin
         auxiliarAtual := qyStatus.FieldByName('cd_auxiliar').AsInteger;
      end;

      qyStatus.Next;
   end;

   //Alterou para uma situação que precisa de permissão especial
   if not((auxiliarAtual = 99) AND (auxiliarNovo = 100)) then
   begin
      exit;
   end;

   if (npEspecial in Fpermissao) then
   begin
      exit;
   end;

   Mensagem('Você não tem permissão para alterar esta situação','Atenção', MB_OK , Handle);

   i := 0;
   qyStatus.First;
   while not (qyStatus.Eof) do
   begin

      if (fPessoasInformacoes.qryPessoasInfoFiltrards_status.AsString = qyStatus.FieldByName('ds_valor').AsString) then
      begin
         cbStatus.ItemIndex := i;
         break;
      end;

      qyStatus.Next;
      i := i + 1;
   end;
end;

procedure TfPessoasInfoCad.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure TfPessoasInfoCad.checksnretornoClick(Sender: TObject);
begin

   if checksnretorno.Checked then
   begin
      umdtRetorno.Enabled := True;
   end;

   if not(checksnretorno.Checked) then
   begin
      umdtRetorno.Enabled := False;
   end;
end;

procedure TfPessoasInfoCad.btnAreaAssuntoClick(Sender: TObject);
var
   i: Integer;
begin
   Application.CreateForm(TuFrmCadAssuntoArea, uFrmCadAssuntoArea);
   if uFrmCadAssuntoArea.ShowModal = mrOk then
   begin
      preencheComboAreaAssunto;
      fPessoasInformacoes.qryPessoasInfoFiltrards_area_assunto.AsString := uFrmCadAssuntoArea.qyAreasAssuntosds_valor.AsString;
      for I := 0 to cbAreaAssunto.Items.Count - 1 do
      begin
         if cbAreaAssunto.Items[i] = uFrmCadAssuntoArea.qyAreasAssuntosds_valor.AsString then
         begin
            cbAreaAssunto.ItemIndex := i;
         end;
      end;
   end;
end;

procedure TfPessoasInfoCad.btnCancelClick(Sender: TObject);
begin
   if fPessoasInformacoes.qryPessoasInfoFiltrar.State in dsEditModes then
   begin
      fPessoasInformacoes.qryPessoasInfoFiltrar.Cancel;
   end;
   fPessoasInformacoes.Filtrar();
   Close;
end;

procedure TfPessoasInfoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryPessoas.Close;
   if fPessoasInformacoes.qryPessoasInfoFiltrar.State in dsEditModes then
      fPessoasInformacoes.qryPessoasInfoFiltrar.Cancel;
   fPessoasInfoCad := nil;
   Action := caFree;
end;

procedure TfPessoasInfoCad.FormCreate(Sender: TObject);
const
   SChave = 'Academico.ContatosInformacoesDependente';
begin
   Fpermissao := DM.UsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo,
      SChave);
   bIncluindo := false;
end;

procedure TfPessoasInfoCad.FormShow(Sender: TObject);
var
   arrObs : TStringList;

   tamanho_janela,
   i,
   j: Integer;

   qBuscaNomeVendedor,
   qyBuscaSituacoes,
   qrySituacoes: TUMZQuery;
begin
   umdtRetorno.Date := DM.DataAtual();
   montaCombo(fPessoasInformacoes.qryPessoasInfoFiltrarcd_coligada.AsInteger);

   // Começo da posição 1 pois a primeira posição é apensar "Selecione a unidade de ensino",
   // e não possui um objeto TColigada associado.
   for j := 1 to cbUnidadeEnsino.Items.Count - 1 do
   begin
      if TColigada(cbUnidadeEnsino.Items.Objects[j]).Codigo = fPessoasInformacoes.qryPessoasInfoFiltrarcd_coligada.AsInteger then
      begin
         cbUnidadeEnsino.ItemIndex := j;
      end;
   end;

   cd_info_contatos_cadastro := 0;

   arrObs := TStringList.Create();
   tamanho_janela := 0;
   if DM.variavel_parametro('contatos_campos_obs') <> '' then
   begin
      SplitString(DM.variavel_parametro('contatos_campos_obs'), ';', arrObs);

      if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') ) then
      begin
         Panel5.Visible := True;
         Label8.Caption := arrObs[0];
         Label8.Visible := True;
         DBEdit8.Visible := True;
         if not( (arrObs[1] = null) or (trim(arrObs[1]) = '') )then
         begin
            Panel4.Visible := True;
            Label9.Caption := arrObs[1];
            Label9.Visible := True;
            DBEdit9.Visible := True;
            if not( (arrObs[2] = null) or (trim(arrObs[2]) = '') )then
            begin
               Panel2.Visible := True;
               Label10.Caption := arrObs[2];
               Label10.Visible := True;
               DBEdit10.Visible := True;
               if not( (arrObs[3] = null) or (trim(arrObs[3]) = '') )then
               begin
                  Panel6.Visible := True;
                  lbl11.Caption := arrObs[3];
                  lbl11.Visible := True;
                  DBMemo1.Visible := True;
               end;
            end;
         end;
      end;
   end else
   begin
      tsObs.Destroy;
   end;

   if ( fPessoasInformacoes.qryPessoasInfoFiltrar.State = dsInsert ) then
   begin
      dbe_horaRetorno.Text := FormatDateTime('HH:NN:ss',Now);
   end;

   if fPessoasInformacoes.qryPessoasInfoFiltrar.State = dsEdit then
      cbNomePessoa.Text := fPessoasInformacoes.qryPessoasInfoFiltrarnm_pessoa.AsString;

   try
      dbDsInformacao.SetFocus();
   except

   end;

   DM.CriarConsulta(qrySituacoes);
   qrySituacoes.SQL.Text := 'SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1 ORDER BY ds_valor';
   qrySituacoes.Open;

   cbFormaConheceu.Clear;
   cbFormaConheceu.AddItem( 'Selecione', TItemCombo.Create('0', 'Selecione') );
   cbFormaConheceu.ItemIndex := 0;

   preencheComboAreaAssunto;
   preencheComboInfoPor;

   if checksnretorno.State = cbGrayed then
   begin
      checksnretorno.Checked :=  False;
   end;

   checksnretorno.Checked := False;
   if (((fPessoasInformacoes.qryPessoasInfoFiltrardt_retorno.AsDateTime = 1) or
      (fPessoasInformacoes.qryPessoasInfoFiltrardt_retorno.asString = '')) = false) then
   begin
      checksnretorno.Checked := True;
      umdtRetorno.Date := fPessoasInformacoes.qryPessoasInfoFiltrardt_retorno.AsDateTime;
   end;

   checksnretornoClick(self);
   i := 1;
   while not qrySituacoes.Eof do
   begin
      cbFormaConheceu.AddItem(qrySituacoes.FieldByName('ds_valor').AsString, TItemCombo.Create( qrySituacoes.FieldByName('cd_situacao').AsString, qrySituacoes.FieldByName('ds_valor').AsString ) );

      if StrToInt(qrySituacoes.FieldByName('cd_situacao').AsString) = fPessoasInformacoes.qryPessoasInfoFiltrarcd_conhecimento.AsInteger then
         cbFormaConheceu.ItemIndex := i;

      inc(i);
      qrySituacoes.Next;
   end;

   lblFone1.Caption := DM.variavel_parametro('pessoascontatos_telefone1');
   lblFone2.Caption := DM.variavel_parametro('pessoascontatos_telefone2');
   lblFone3.Caption := DM.variavel_parametro('pessoascontatos_telefone3');
   lblFone4.Caption := DM.variavel_parametro('pessoascontatos_telefone4');

   cbFormaConheceu.AddItem( 'Outro', TItemCombo.Create('8', 'Outro') );

   if fPessoasInformacoes.qryPessoasInfoFiltrarcd_conhecimento.AsInteger = 8 then
      cbFormaConheceu.ItemIndex := i;

   cbStatus.Clear;
   cbStatus.AddItem( 'Selecione', TItemCombo.Create('0', 'Selecione') );
   cbStatus.ItemIndex := 0;
   preencheComboStatus;

   nm_vendedor.Caption := 'Sem consultor';
   if fPessoasInformacoes.qryPessoasInfoFiltrarcd_consultor.AsInteger > 0 then
   begin
      DM.CriarConsulta(qBuscaNomeVendedor);

      qBuscaNomeVendedor.SQL.Text := 'Select nm_pessoa FROM pessoas WHERE cd_pessoa = :cd_consultor';
      qBuscaNomeVendedor.ParamByName('cd_consultor').AsInteger := fPessoasInformacoes.qryPessoasInfoFiltrarcd_consultor.AsInteger;
      qBuscaNomeVendedor.Open;

      if qBuscaNomeVendedor.RecordCount > 0 then
      begin
         nm_vendedor.Caption := qBuscaNomeVendedor.FieldByName('nm_pessoa').AsString;
      end;
   end;

   fPessoasInfoCad.Height := 652;
   pnMeio.Visible := false;
   if(npAcesso in Fpermissao) then
   begin
      fPessoasInfoCad.Height := 655;
      pnMeio.Visible := true;

      umdtFiltroFim.Date := DataHoje;
      if not(fPessoasInformacoes.qryPessoasInfoFiltrardt_nascimento.IsNull) then
      begin
         umdtFiltroFim.Date := fPessoasInformacoes.qryPessoasInfoFiltrardt_nascimento.AsDateTime;
      end;
   end;

end;

procedure TfPessoasInfoCad.sbBuscaCepClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSelCep, frmSelCep);

  frmSelCep.ShowModal;

  if frmSelCep.flgSearch then
  begin
    dbCep.Text := frmSelCep.qyCep.FieldByName('ds_cep').AsString;
    fPessoasInformacoes.qryPessoasInfoFiltrards_uf.AsString    := frmSelCep.qyCep.FieldByName('ds_uf').AsString;
    fPessoasInformacoes.qryPessoasInfoFiltrards_cidade.AsString       := frmSelCep.qyCep.FieldByName('nm_cidade').AsString;
    dbBairro.Text       := frmSelCep.qyCep.FieldByName('nm_bairro').AsString;
    fPessoasInformacoes.qryPessoasInfoFiltrards_endereco.AsString := frmSelCep.qyCep.FieldByName('nm_logradouro').AsString;
  end;
  FreeAndNil(frmSelCep);
end;

procedure TfPessoasInfoCad.sbMaisInformacoesClick(Sender: TObject);
var
   bPrecisaRecarregar, mostraConcursoGrupo: boolean;
begin
   bPrecisaRecarregar := false;
   mostraConcursoGrupo := false;
   bIncluindo := False;

   if ( fPessoasInformacoes.qryPessoasInfoFiltrar.State in [dsInsert] )  then
   begin

      if Mensagem(
         'Deseja confirmar o cadastro desta informação?'
         + #13
         + 'Ao aceitar este cadastro, os dados dessa informação serão salvos.',
         'Confirmação',
         MB_YESNO + MB_ICONQUESTION
      ) <> mrYes Then Exit;


      bIncluindo := True;
   end;

   if fPessoasInformacoes.qryPessoasInfoFiltrarcd_informacao.AsInteger <> 0 then
   begin
      cd_info_contatos_cadastro :=
         fPessoasInformacoes.qryPessoasInfoFiltrarcd_informacao.AsInteger;
   end;

   if bIncluindo then
   begin
      bPrecisaRecarregar:= salvarContato();
      cd_info_contatos_cadastro := DM.LastInsert();

      if not ( bPrecisaRecarregar ) then
      begin
         bIncluindo := False;
      end;

      if (bPrecisaRecarregar) then
      begin
         if not( fPessoasInformacoes.qryPessoasInfoFiltrar.State in [dsInsert, dsEdit]) then
         begin
            fPessoasInformacoes.qryPessoasInfoFiltrar.Edit;
         end;

         Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);
         frm_Pessoas_adicional.Montar_Dados(
            'C',
            cd_info_contatos_cadastro,
            mostraConcursoGrupo
         );
      end
   end
   else
   begin
      Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);
      frm_Pessoas_adicional.Montar_Dados(
         'C',
         cd_info_contatos_cadastro,
         mostraConcursoGrupo
      );
   end;
end;

procedure TfPessoasInfoCad.sbSelecionaPessoaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      cbNomePessoa.Text := resultado_filtro.nm_pessoa;
      fPessoasInformacoes.qryPessoasInfoFiltrarcd_pessoa.AsInteger := resultado_filtro.cd_pessoa;
      fPessoasInformacoes.qryPessoasInfoFiltrarnm_pessoa.AsString := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfPessoasInfoCad.selecionarOpcaoCombo;
var
   i : integer;
begin
   i := 0;

   qryInfoPor.Close;
   qryInfoPor.Open;
   while not qryInfoPor.Eof do
   begin
      // Marca a opção que esta gravada no banco
      if ( fPessoasInformacoes.qryPessoasInfoFiltrarcd_origem.AsInteger = qryInfoPor.FieldByName('cd_situacao').AsInteger) then
      begin
         cbInfoPor.ItemIndex := i;
         exit;
      end;
      
      inc(i);

      qryInfoPor.Next;
   end;
   // Se não tem nenhuma opção, a padrão é a primeira "Telefone"
   cbInfoPor.ItemIndex := 1;
end;

procedure TfPessoasInfoCad.DBEdit13Change(Sender: TObject);
begin
  if DBEdit13.Text = '' then
  begin
    anoSemestreUsado := -1;
    cursoFiltrado:= '';
  end;
  cursoFiltrado := get_codigo_curso();
end;

function TfPessoasInfoCad.get_codigo_curso() : String;
var
   qryGetCodigoCurso : TUMZQuery;
   codigo : String;
begin

   Dm.CriarConsulta(qryGetCodigoCurso);
   qryGetCodigoCurso.SQL.Text := ''
     + ' SELECT '
     +     ' cm.CD_CURSO cd_curso '
     + ' FROM '
     +    '	cursos_mestre cm '
     + ' WHERE '
     +    '	DS_CURSO = :ds_curso ';

   qryGetCodigoCurso.ParamByName('ds_curso').AsString := DBEdit13.Text;
   qryGetCodigoCurso.Open();

   codigo := qryGetCodigoCurso.FieldByName('cd_curso').AsString;

   qryGetCodigoCurso.Close();
   Result := codigo;
end;

procedure TfPessoasInfoCad.dbDependenteKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then begin
       SelectNext(Sender As TWinControl, True, True);
       Key := #0;
   end;
end;

procedure TfPessoasInfoCad.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Curso }

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Por favor informe uma unidade de ensino!','Atenção', MB_OK , Handle);
      abort;
   end;

   resultado_filtro := TfrmSelecionarCurso.Filtrar([], TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);

   if not resultado_filtro.filtrado then Exit;

   fPessoasInformacoes.qryPessoasInfoFiltrards_curso.AsString := resultado_filtro.ds_curso;
   cursoFiltrado   := resultado_filtro.cd_curso;
   anoSemestreUsado:= resultado_filtro.nr_anosemestre;
   montaCombo( resultado_filtro.cd_coligada );
end;

procedure TfPessoasInfoCad.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   coligada: integer;
begin
   { Pesquisar Turmas }

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Por favor informe uma unidade de ensino!','Atenção', MB_OK , Handle);
      abort;
   end;
   if anoSemestreUsado = 0 then
   begin
     anoSemestreUsado:= -1;
   end;
   
   coligada :=  TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;
   resultado_filtro := TfrmSelecionarTurma.Filtrar([],anoSemestreUsado,-1,-1,cursoFiltrado);


   if not resultado_filtro.filtrado then Exit;

   fPessoasInformacoes.qryPessoasInfoFiltrarcd_turma.AsString := resultado_filtro.cd_turma;

   anoSemestreUsado := resultado_filtro.nr_anosemestre;
   
   montaCombo( resultado_filtro.cd_coligada );
end;

procedure TfPessoasInfoCad.btnImprimirRelatorioClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
   sFSelecao, ds_operador: String;
begin
   if ( (dbe_turma.Text = '' ) AND (DBEdit13.Text = '' )) then
   begin
      Mensagem(
         'Por favor informe os campos corretamente!',
         'Atenção',
         MB_OK ,
         Handle
      );
      Exit;
   end;

   sFSelecao := '';
   ds_operador := '';
   if (DBEdit13.Text <> '' ) then
   begin
     sFSelecao := '{turmas.curso} = "' + cursoFiltrado + '"';
   end;

   if ( dbe_turma.Text <> '' ) then
   begin
      if sFSelecao <> '' then
      begin
         ds_operador := ' AND ';
      end;
      // Adiciona o codigo da turma
      sFSelecao := ''+
         sFSelecao
         + ds_operador
         + '{turmas.codigo} = "'
         + dbe_turma.Text
         + '"';
   end;

   if ( anoSemestreUsado > 0 ) then
   begin
      if sFSelecao <> '' then
      begin
         ds_operador := ' AND ';
      end;

      sFSelecao := ''+
         sFSelecao
         + ds_operador
         + '{turmas.anosemestre} = '
         +  IntToStr( anoSemestreUsado );
   end;

   sNomeRelatorio := 'repInfoCursosTurmasPlanilhaContatos.rpt';

   PrincipalForm.ImprimeRpt(
      Self,
      sNomeRelatorio,
      -1,
      sFSelecao,
      '',
      nil,
      nil,
      nil,
      nil,
      True,
      False,
      nil,
      True
   );
   
end;

procedure TfPessoasInfoCad.montaCombo(codigo : Integer);
begin
   DM.CarregaColigadas(cbUnidadeEnsino);
end;

procedure TfPessoasInfoCad.preencheComboAreaAssunto;
var
   i: Integer;
   qyAreasAssuntos: TUMZQuery;
begin
   cbAreaAssunto.Items.Clear;

   i:=0;
   DM.CriarConsulta(qyAreasAssuntos);

   qyAreasAssuntos.SQL.Text := 'SELECT * from situacoes where cd_modulo = 1035 and ISNULL(cd_auxiliar)';

   qyAreasAssuntos.Open;

   while not (qyAreasAssuntos.Eof) do
   begin

      cbAreaAssunto.Items.Add(qyAreasAssuntos.fieldbyname('ds_valor').AsString);

      if (fPessoasInformacoes.qryPessoasInfoFiltrards_area_assunto.AsString = qyAreasAssuntos.FieldByName('ds_valor').AsString) then
      begin
         cbAreaAssunto.ItemIndex := i;
      end;

      qyAreasAssuntos.Next;
      i := i + 1;
   end;
end;

procedure TfPessoasInfoCad.preencheComboInfoPor;
var
   i : integer;
begin
   cbInfoPor.Items.Clear;

   qryInfoPor.Close;
   qryInfoPor.Open;

   while not qryInfoPor.Eof do
   begin
      cbInfoPor.AddItem(
         qryInfoPor.FieldByName('ds_valor').AsString,
         TItemCombo.Create(
            qryInfoPor.FieldByName('cd_situacao').AsString,
            qryInfoPor.FieldByName('ds_valor').AsString
         )
      );
      qryInfoPor.Next;
   end;

   // Se já tem uma opção cadastrar deixa essa opção selecionada
   selecionarOpcaoCombo();

end;

procedure TfPessoasInfoCad.preencheComboStatus;
var
   i: Integer;
   qyStatus: TUMZQuery;
begin
   cbStatus.Items.Clear;

   i:=0;
   DM.CriarConsulta(qyStatus);

   qyStatus.SQL.Text := 'SELECT * from situacoes where cd_modulo = 1035 and cd_auxiliar in (1,99,100) order by ds_valor';

   qyStatus.Open;

   while not (qyStatus.Eof) do
   begin
      
      cbStatus.Items.Add(qyStatus.fieldbyname('ds_valor').AsString);
      if (fPessoasInformacoes.qryPessoasInfoFiltrards_status.AsString = qyStatus.FieldByName('ds_valor').AsString) then
      begin
         cbStatus.ItemIndex := i;
      end;

      qyStatus.Next;
      i := i + 1;
   end;
end;

function TfPessoasInfoCad.salvarContato(): boolean;
var
   qyDataRetorno: TUMZQuery;
   qyFormaConheceu: TUMZQuery;
   mensagemExtra : String;
   cd_origem : String;
   sn_registrar_obs : Boolean;
begin
   PageControl1.ActivePage := tsInfo;
   Result:= true;

   sn_registrar_obs := False;
   DBEdit1.SetFocus;
   dbDsInformacao.SetFocus;

   mensagemExtra := '';
   
   {Verificação de campo obrigatorio da combo da forma que conheceu}
   DM.CriarConsulta(qyFormaConheceu);
   qyFormaConheceu.SQL.Text := ''
     + 'SELECT '
     + ' sn_obrigatorio '
     + ' FROM '
     + ' nu_cadastro_obrigatorio_campo '
     + ' WHERE '
     + ' ds_chave = "cbFormaConheceu" ' 
     + ' AND '
     + ' cd_cadastro = 53';
     
   qyFormaConheceu.Open;

   if qyFormaConheceu.FieldByName('sn_obrigatorio').AsInteger = 1 then
   begin

      if cbFormaConheceu.ItemIndex = 0 then
      begin
         mensagemExtra := mensagemExtra + #13 + 'Forma conheceu a Instituição';
      end;
   end;
   qyFormaConheceu.Close;
  {Verificação de campo obrigatorio da combo da forma que conheceu}

  DM.CriarConsulta(qyDataRetorno);
   qyDataRetorno.SQL.Text := 'select sn_obrigatorio from nu_cadastro_obrigatorio_campo where ds_chave = ''dtRetorno'' AND cd_cadastro = 53';
   qyDataRetorno.Open;

   if qyDataRetorno.FieldByName('sn_obrigatorio').AsInteger = 1 then
   begin
      if checksnretorno.Checked = False then
      begin
         mensagemExtra := mensagemExtra + #13 + 'Favor informe uma data de retorno!';
      end;
   end;
   qyDataRetorno.Close;

   if ((cbUnidadeEnsino.ItemIndex = -1) or (cbUnidadeEnsino.Text = 'Selecione uma Unidade de Ensino')) then
   begin
      //Mensagem('Selecione uma Unidade de Ensino','Atenção', MB_OK , Handle);
      mensagemExtra := mensagemExtra + #13 + 'Selecione uma Unidade de Ensino';
   end;
   {
   if fPessoasInformacoes.qyPessoasInfocd_turma.AsString = '' then
   begin
      //Mensagem('Favor selecionar uma turma!','Atenção', MB_OK , Handle);
      mensagemExtra := mensagemExtra + #13 + 'Favor selecionar uma turma';
   end;
   }
   if not(DM.CamposObrigatoriosPreenchidos(self, '', true, mensagemExtra)) then
   begin
      result := false;
      exit;
   end;

   begin
      cd_origem := TItemCombo(cbInfoPor.Items.Objects[cbInfoPor.ItemIndex]).getCodigo();

      fPessoasInformacoes.qryPessoasInfoFiltrards_area_assunto.AsString := cbAreaAssunto.Text;
      fPessoasInformacoes.qryPessoasInfoFiltrarcd_origem.AsString := cd_origem;
      
      if checksnretorno.Checked = True then
      begin
         if ( dbe_horaRetorno.Text = '  :  :  ' ) then
         begin
           dbe_horaRetorno.Text := '00:00:00'
         end;
          
         fPessoasInformacoes.qryPessoasInfoFiltrardt_retorno.AsDateTime := umdtRetorno.Date + StrToTime(dbe_horaRetorno.Text);
      end
      else
      begin
         fPessoasInformacoes.qryPessoasInfoFiltrardt_retorno.Clear;
      end;      
      
      if(fPessoasInformacoes.qryPessoasInfoFiltrarnm_usuario.IsNull)then
         fPessoasInformacoes.qryPessoasInfoFiltrarnm_usuario.AsString := DM.sLogin;

      if StrToInt(TItemCombo(cbFormaConheceu.Items.Objects[cbFormaConheceu.ItemIndex]).getCodigo) <> 0 then
         fPessoasInformacoes.qryPessoasInfoFiltrarcd_conhecimento.AsInteger := StrToInt(TItemCombo(cbFormaConheceu.Items.Objects[cbFormaConheceu.ItemIndex]).getCodigo);

      if (StrToInt(TItemCombo(cbFormaConheceu.Items.Objects[cbFormaConheceu.ItemIndex]).getCodigo) = 0) and (fPessoasInformacoes.qryPessoasInfoFiltrar.state = dsEdit) then
         fPessoasInformacoes.qryPessoasInfoFiltrarcd_conhecimento.Clear;

      if cbStatus.Text <> '' then
      begin
         if ( fPessoasInformacoes.qryPessoasInfoFiltrards_status.AsString <> cbStatus.Text) then
         begin
            // Altera para true quando houve alteração do status para lancar uma nova observacao
            // com o status atualizado
            sn_registrar_obs := True;
         end;

         fPessoasInformacoes.qryPessoasInfoFiltrards_status.asString := cbStatus.Text;
      end;

      if (cbStatus.Text = '') and (fPessoasInformacoes.qryPessoasInfoFiltrar.state = dsEdit) then
         fPessoasInformacoes.qryPessoasInfoFiltrards_status.Clear;

      fPessoasInformacoes.qryPessoasInfoFiltrarcd_coligada.AsInteger := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;

      if(npAcesso in Fpermissao) then
      begin
         fPessoasInformacoes.qryPessoasInfoFiltrardt_nascimento.AsDateTime := umdtFiltroFim.Date;
      end;

      if (fPessoasInformacoes.qryPessoasInfoFiltrar.State = dsInsert) then
      begin
         DM.setLog(
            1035,
            'Inclusao',
            'InformacoesContato',
            0,
            'Criado novo registro de contatos e informações: Unidade de ensino: ' +
               IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo) + ' | Nome pessoas de contato: '
               + cbNomePessoa.text
         );
      end;

      if (fPessoasInformacoes.qryPessoasInfoFiltrar.State = dsEdit) then
      begin

         if (sn_registrar_obs) then
         begin
            qryInserirPessoasInfoObservacao.ParamByName('cd_informacao').AsInteger := fPessoasInformacoes.qryPessoasInfoFiltrarcd_informacao.AsInteger;
            qryInserirPessoasInfoObservacao.ParamByName('cd_usuario_registrou').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
            qryInserirPessoasInfoObservacao.ParamByName('me_observacao').AsString := 'Alteração de status realizado pela tela Informações de contato';
            qryInserirPessoasInfoObservacao.ParamByName('ds_status').AsString := cbStatus.Text;

            qryInserirPessoasInfoObservacao.ExecSQL;
         end;


         DM.setLog(
            1035,
            'alteracao',
            'InformacoesContato',
            1,
            'Alterado registro de contatos e informações de código: ' +
               fPessoasInformacoes.qryPessoasInfoFiltrarcd_informacao.AsString +
               ' da pessoa: ' + fPessoasInformacoes.qryPessoasInfoFiltrarnm_pessoa.AsString
         );
      end;

      if ( fPessoasInformacoes.qryPessoasInfoFiltrarcd_turma.AsString = '') then
      begin
         fPessoasInformacoes.qryPessoasInfoFiltrarcd_turma.AsString  := '';
      end;
      fPessoasInformacoes.qryPessoasInfoFiltrar.Post;
   end;
end;

end.

