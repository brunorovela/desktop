unit uFFichaSaudeCompleta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, UZDataset, DB,
  ZAbstractRODataset, ZAbstractDataset, Grids, DBGrids, ImgList, ToolWin, Mask,
  DBCtrls, ClassPessoa, ClassRegistros, ZDbcIntfs, UZDbcFuncs, uFSelecionarPessoa;

// Chave MD5 para o texto "Ficha de Saúde do Aluno"
const
   MD5_ABA_PADRAO_FICHA_ALUNO = 'eb573e3fad468f46dc61ea28dab2e2f9';
   CAPTION_ULTIMO_USUARIO_DEFAULT = '- Usuário não definido -';

type
  TfrmFichaSaudeCompleta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    lbIdade: TLabel;
    pnExibicaoFoto: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edNomePai: TEdit;
    edNomeMae: TEdit;
    edNomeResp: TEdit;
    edContatosPai: TEdit;
    edContatosMae: TEdit;
    edContatosResp: TEdit;
    lbContatosAluno: TLabel;
    pcAbasCategorias: TPageControl;
    tsFichaSaude: TTabSheet;
    tsAtendimentos: TTabSheet;
    tsProntuario: TTabSheet;
    qyAtendimentos: TUMZQuery;
    dsAtendimentos: TDataSource;
    qyAtendimentoscd_atendimento: TIntegerField;
    qyAtendimentoscd_pessoa: TIntegerField;
    qyAtendimentossn_acompanhado: TSmallintField;
    qyAtendimentosnm_acompanhante: TStringField;
    qyAtendimentossn_medicado_casa: TSmallintField;
    qyAtendimentosds_medicamento_casa: TStringField;
    qyAtendimentosds_pressao_arterial: TStringField;
    qyAtendimentosds_temperatura: TStringField;
    qyAtendimentossn_comunicado_telefone: TSmallintField;
    qyAtendimentossn_comunicado_agenda: TSmallintField;
    qyAtendimentossn_comunicado_email: TSmallintField;
    qyAtendimentossn_comunicado_ocorrencia: TSmallintField;
    qyAtendimentosds_comunicado_outros: TStringField;
    qyAtendimentoscd_retorno: TSmallintField;
    qyAtendimentosds_retorno_quem: TStringField;
    grdAtendimentos: TDBGrid;
    ImageList2: TImageList;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    qyAtendimentosvl_peso: TFloatField;
    Label13: TLabel;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Panel35: TPanel;
    Panel4: TPanel;
    sbSelecionarColuna: TSpeedButton;
    qyAtendimentosacompanhado: TStringField;
    qyAtendimentosmedicado_casa: TStringField;
    qyAtendimentoscomunicado_telefone: TStringField;
    qyAtendimentoscomunicado_agenda: TStringField;
    qyAtendimentoscomunicado_email: TStringField;
    qyAtendimentoscomunicado_ocorrencia: TStringField;
    qyAtendimentosretorno: TStringField;
    qyAtendimentosdt_atendimento: TDateField;
    sbFichaSaude: TScrollBox;
    pnNecessidadesEspeciais: TPanel;
    Label17: TLabel;
    edNecessidadesEspeciais: TEdit;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    toolBar: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    btnImprimir: TToolButton;
    DBMemo1: TDBMemo;
    qyAtendimentosds_procedimento_adotado_memo: TMemoField;
    qyAtendimentosds_procedimento_adotado: TStringField;
    qyAtendimentoscd_usuario: TIntegerField;
    Label18: TLabel;
    lbUltimoUsuario: TLabel;
    qyAtendimentoUltimoUsuario: TUMZReadOnlyQuery;
    qyAtendimentoUltimoUsuarionm_pessoa: TStringField;
    DBCheckBox7: TDBCheckBox;
    qyAtendimentossn_envia_notificacao: TSmallintField;
    procedure qyAtendimentosAfterPost(DataSet: TDataSet);
    procedure qyAtendimentosBeforePost(DataSet: TDataSet);
    procedure qyAtendimentosBeforeEdit(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure grdAtendimentosTitleClick(Column: TColumn);
    procedure qyAtendimentosCalcFields(DataSet: TDataSet);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure pcAbasCategoriasChange(Sender: TObject);
    procedure pcAbasCategoriasChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure grdAtendimentosDblClick(Sender: TObject);
    procedure qyAtendimentosNewRecord(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dsAtendimentosStateChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    arrNomesBackup : TStringList;

    { Private declarations }
    filtro_cd_pessoa: Integer;
    TemPermissaoAtendimentoProntuario,
    TemPermissaoCadastroDadosSaude: Boolean;
    ActiveButtonsLigado: Boolean;

    { Lista de ScrollBox }
    listaComponentesToResize: TStringList;

    { Pessoa Filtrada }
    Pessoa: TClassePessoa;

    { Tratamento de Campos }
    procedure SomenteNumeros(Sender: TObject; var Key: Char);

    { Impressão de Cupom }
    function GetCupomImpressao: String;

    { Outros }
    procedure CarregarPessoaFiltrada();
    procedure SalvarInformacoesAdicionaisPessoaFiltrada();
    procedure CarregarInformacoesAdicionaisPessoaFiltrada();
    procedure ReajustaLarguraContatos();
    procedure CarregarAbasCamposAdicionais();
    procedure VerificaBotoesAtivos();
    procedure ActiveButtons(Sender: TObject);
    procedure AbreQueryAtendimentos();
    procedure MudaDataSetAtendimentos(query: TUMZQuery; bMudaQuery: boolean = True);

    { Ações de Campos }
    procedure CampoAdicionalOutros(Sender: TObject); 
  public
    { Public declarations }
    procedure setCdPessoa(const cd_pessoa: Integer);
    function getCdPessoa(): Integer;
    class function HasFicha(const cd_pessoa: integer): Boolean;
    class function HasDeficiencia(const cd_pessoa: integer): Boolean;
    class procedure ClearFicha(const cd_pessoa: integer);
    class procedure ClearDeficiencia(const cd_pessoa: integer);
  end;

var
  frmFichaSaudeCompleta: TfrmFichaSaudeCompleta;

implementation

uses General, uDM, uUsuario, uCamposPlanilhas,
  uCadDeficiencias, uFCadDeficienciasCampos, uImpMens, Main, uImpressaoDOS;

{$R *.dfm}

{ TfrmFichaSaudeCompleta }

procedure TfrmFichaSaudeCompleta.AbreQueryAtendimentos;
begin
   qyAtendimentos.Close();
   qyAtendimentos.ParamByName('cd_pessoa').AsInteger := filtro_cd_pessoa;
   qyAtendimentos.Open();

   qyAtendimentos.SortedFields := 'dt_atendimento';
   qyAtendimentos.SortType := stAscending;
end;

procedure TfrmFichaSaudeCompleta.ActiveButtons(Sender: TObject);
begin
   if ActiveButtonsLigado AND
      ( not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npIncluir, True ) OR
        not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npAlterar, True ) ) then
   begin
      CarregarInformacoesAdicionaisPessoaFiltrada();
      Exit;
   end;   

   btnSalvar.Enabled := ActiveButtonsLigado;
   btnCancelar.Enabled := ActiveButtonsLigado;
end;

procedure TfrmFichaSaudeCompleta.btnAlterarClick(Sender: TObject);
begin
   if dsAtendimentos.DataSet = nil then
   begin
      Mensagem('Você deve selecionar um atendimento na aba "Atendimentos".', '', MB_ICONINFORMATION + MB_OK, Handle);
      Exit;
   end;   

   qyAtendimentos.Edit();
end;

procedure TfrmFichaSaudeCompleta.btnCancelarClick(Sender: TObject);
var
   bDesvinculaQuery: boolean;
begin
   if ( pcAbasCategorias.ActivePage = tsAtendimentos ) then Exit;

   if ( pcAbasCategorias.ActivePage = tsProntuario ) then
   begin
      bDesvinculaQuery := qyAtendimentos.State in [dsInsert];
      qyAtendimentos.Cancel();

      if ( bDesvinculaQuery ) then
      begin
         MudaDataSetAtendimentos(nil);
      end;

      VerificaBotoesAtivos();
   end else begin
      CarregarInformacoesAdicionaisPessoaFiltrada();
   end;
end;

procedure TfrmFichaSaudeCompleta.btnExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude.Prontuario', npExcluir, True ) then Exit;

   if Mensagem('Deseja excluir este registro?',Application.Title,
      MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then
   begin
      qyAtendimentos.Delete();
   end;
end;

procedure TfrmFichaSaudeCompleta.btnImprimirClick(Sender: TObject);
var
   iPular, iTamanho, i, n: Integer;
   sPorta, strAut, LinhaDe, LinhaPara, sFormulaImpressao: String;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   if ( qyAtendimentos.RecNo = 0 ) OR
      ( dsAtendimentos.DataSet = nil ) OR
      ( Mensagem( 'Deseja imprimir as informações sobre o atendimento selecionado?', '', MB_YESNO + MB_ICONQUESTION, Handle ) <> mrYes ) then Exit;

   if ( DM.variavel_parametro('ficha_saude_impressao_tipo') = 'DOS' ) then
   begin
      try
         iPular := DM.GetUnimestreINI.ReadInteger('ImpressoraDOS', 'PularLinhas', 0);
         sPorta := DM.GetUnimestreINI.ReadString('ImpressoraDOS', 'Porta', Dm.variavel_parametro('impressao_dos_porta'));
      except
         iPular := 0;
         sPorta := '';
      end;

      try
         iTamanho := StrToInt(DM.variavel_parametro('impressao_tamanho'));
         if (iTamanho = 0) then
         begin
            iTamanho := 40;
         end;
      except
         iTamanho := 40;
      end;

      if sPorta = '' Then
      begin
         sPorta := 'LPT1';
      end;

      strAut := GetCupomImpressao;

      // Trocar #13 por ENTER
      strAut := ReplaceStr(strAut, '#13',  CHR(13) ) ;

      //Trocar negrito
      strAut := ReplaceStr(strAut, '<b>',  CHR(27) + 'E' ) ;
      strAut := ReplaceStr(strAut, '</b>',  CHR(27) + 'E' ) ;

      TImpressaoDOS.TratarFuncaoEsc( strAut );

      // Tratar os alinhamentos  CENTRO[string|tamanho]
      try
         while Pos('CENTRO[', strAut) > 0 do
         begin
            LinhaDe := Copy(strAut, Pos('CENTRO[', strAut), Pos(']', strAut) - Pos('CENTRO[', strAut) + 1);
            LinhaPara := Copy(LinhaDe, 8, Pos('|', LinhaDe) - 8);
            n := StrToInt(Copy(LinhaDe, Pos('|', LinhaDe) + 1, Pos(']', LinhaDe) - Pos('|', LinhaDe) - 1));

            strAut := ReplaceStr( strAut, LinhaDe, frmImpMens.Centro(LinhaPara, n) );
         end;

         // Tratar os alinhamentos  DIREITA[string|tamanho]

         while Pos('DIREITA[', strAut) > 0 do
         begin
            LinhaDe := Copy(strAut, Pos('DIREITA[', strAut), Pos(']', strAut) - Pos('DIREITA[', strAut) + 1);
            LinhaPara := Copy(LinhaDe, 9, Pos('|', LinhaDe) - 9);
            n := StrToInt(Copy(LinhaDe, Pos('|', LinhaDe) + 1, Pos(']', LinhaDe) - Pos('|', LinhaDe) - 1));

            strAut := ReplaceStr( strAut, LinhaDe, frmImpMens.Direita(LinhaPara, n) );
         end;
      except
      end;

      strAut := ReplaceStr(strAut, '<corte:tm18>', chr(ord(strtoint('29')))+chr(ord(strtoint( '+86')))+chr(ord(strtoint('+01'))));

      //verifica o pular
      for i := 0 to iPular do
      begin
         strAut := strAut + Chr(13);
      end;

      try
         TImpressaoDOS.ImprimirDOS(sPorta, strAut);
         Mensagem( 'Impressão do documento concluído.', '', MB_OK, Handle );
      except
         on E:EInOutError do
         begin
            Mensagem('Impressora desconectada ou não configurada, não foi possível realizar a impressão.' + #13+#13 + 'Porta de impressão: ' + sPorta, '', MB_ICONEXCLAMATION + MB_OK, Handle);
         end;
      end;
   end else begin
      { Imprimir o Recibo diretamente }
      sFormulaImpressao := '{pessoas_atendimentos.cd_atendimento} = ' + qyAtendimentoscd_atendimento.AsString;

      //imprime recibo

      infoRelatorio := PrincipalForm.GetInfoRpt('repFichaSaude');

      sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

      PodeExportar := True;
      
      if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
         PodeExportar := False;

      if not PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1,  sFormulaImpressao, '', nil, nil ,nil ,nil ,False ,False ,nil, PodeExportar) then 
      begin
         Mensagem( 'Impressão do documento concluído.', '', MB_OK, Handle );
      end;

      Self.Show;
   end;
end;

procedure TfrmFichaSaudeCompleta.btnIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude.Prontuario', npIncluir, True ) then
   begin
      if ( tsAtendimentos.TabVisible ) then
         pcAbasCategorias.ActivePage := tsAtendimentos
      else
         pcAbasCategorias.ActivePageIndex := 0;

      Exit;
   end;
   MudaDataSetAtendimentos(qyAtendimentos);
   qyAtendimentos.Insert();

   // Limpa o campo com o último usuário que realizou a alteração
   MudaDataSetAtendimentos(nil, False);
end;

procedure TfrmFichaSaudeCompleta.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmFichaSaudeCompleta.btnSalvarClick(Sender: TObject);
begin
   if ( pcAbasCategorias.ActivePage = tsAtendimentos ) then Exit;

   if ( pcAbasCategorias.ActivePage = tsProntuario ) then
   begin
      qyAtendimentos.Post();

      VerificaBotoesAtivos();
   end else begin
      SalvarInformacoesAdicionaisPessoaFiltrada();
   end;   
end;

procedure TfrmFichaSaudeCompleta.CampoAdicionalOutros(Sender: TObject);
var
   I: Integer;
begin
   if ( filtro_cd_pessoa <= 0 ) OR
      not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npIncluir, True ) OR
      not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npAlterar, True ) then Exit;

   if ( frmCadDeficienciasCampos = nil ) then
      Application.CreateForm( TfrmCadDeficienciasCampos, frmCadDeficienciasCampos );

   frmCadDeficienciasCampos.SetPessoa( Pessoa );
   frmCadDeficienciasCampos.SetCampo( TSpeedButton(Sender).Tag );

   frmCadDeficienciasCampos.ShowModal();
   Pessoa.ReloadNecessidadesEspeciaisCompleta();

   for I := 0 to TSpeedButton(Sender).Parent.Parent.ComponentCount - 1 do
      if ( TSpeedButton(Sender).Parent.Parent.Components[I] is TEdit ) then
      begin
         TEdit( TSpeedButton(Sender).Parent.Parent.Components[I] ).Text := ReplaceStr( Pessoa.NecessidadesEspeciaisCompleta[ TSpeedButton(Sender).Tag ], ';', ', ' );
         Break;
      end;
end;

procedure TfrmFichaSaudeCompleta.CarregarAbasCamposAdicionais;
const
   SQL_LISTA_CATEGORIAS =
      ' SELECT COALESCE( pca.DS_CATEGORIA, ''Ficha de Saúde do Aluno'' ) AS DS_CATEGORIA, pca.DS_TIPO, ' +
      '        COALESCE( pca.DS_CAMPO, pca.DS_CAMPO_DESCRICAO ) AS DS_CAMPO, CASE WHEN pca.DS_CAMPO IS NOT NULL THEN pca.DS_CAMPO_DESCRICAO ELSE "" END AS DS_CAMPO_DESCRICAO,' +
      '        MD5(COALESCE( pca.DS_CATEGORIA, ''Ficha de Saúde do Aluno'' )) AS DS_CATEGORIA_MD5, ' +
      '        MD5(pca.CD_CAMPO) AS CD_CAMPO_MD5, pca.CD_CAMPO, ' +
      '        pco.ME_OPCOES, pco.ME_SQL ' +
      ' FROM pessoas_campos_adicionais pca ' +
      '      LEFT JOIN pessoas_campos_opcoes pco ON ( pco.CD_OPCAO = pca.CD_OPCAO AND pca.CD_CAMPO IS NOT NULL ) ' +
      ' WHERE pca.ds_pessoa = ''S'' AND pca.sn_ativo = 1 ' +
      ' ORDER BY pca.DS_CATEGORIA, pca.NR_ORDEM ';
var
   I: Integer;
   qyListaCategoriasCampos, qyAuxCamposME_SQL: TUMZQuery;
   tabSheet: TTabSheet;
   scrollBox: TScrollBox;
   ControlePaginas: Integer;
   listaAbas, listaCampos: TStringList;
   md5_categoria, md5_campo, strCampos, Separador: String;
   panelCampos, subPanelCampos: TPanel;
   labelCampos: TLabel;
   editMaskCampos: TMaskEdit;
   editCampos: TEdit;
   memoCampos: TMemo;
   comboboxCampos: TComboBox;
   speedButtonCampos: TSpeedButton;
begin
   listaAbas := TStringList.Create;
   listaCampos := TStringList.Create;

   if not TemPermissaoCadastroDadosSaude then
   begin
      tsFichaSaude.TabVisible := False;

      tsAtendimentos.PageIndex := 0;
      tsProntuario.PageIndex := 1;

      Exit;
   end;   

   DM.CriarConsulta( qyListaCategoriasCampos );
   DM.CriarConsulta( qyAuxCamposME_SQL );

   qyListaCategoriasCampos.SQL.Text := SQL_LISTA_CATEGORIAS;
   qyListaCategoriasCampos.Open;

   ControlePaginas := 0;
   tsFichaSaude.PageIndex := ControlePaginas;

   // Aqui já inserimos a 1ª aba (Ficha de Saúde do Aluno), pois ela não precisa ser criada
   listaAbas.Add( MD5_ABA_PADRAO_FICHA_ALUNO );

   while not qyListaCategoriasCampos.Eof do
   begin
      strCampos := '';
      listaCampos.Clear;

      // MD5 para saber se a aba já foi inserida ou não
      md5_categoria := qyListaCategoriasCampos.FieldByName('DS_CATEGORIA_MD5').AsString;

      // Se a aba ainda não foi inserida, então a criamos
      if ( listaAbas.IndexOf( md5_categoria ) = -1 ) then
      begin
         Inc(ControlePaginas);

         tabSheet := TTabSheet.Create( pcAbasCategorias );
         tabSheet.PageControl := pcAbasCategorias;
         tabSheet.Caption := qyListaCategoriasCampos.FieldByName('DS_CATEGORIA').AsString;
         tabSheet.Name := 'ts' + md5_categoria;
         tabSheet.PageIndex := ControlePaginas;
         tabSheet.Visible := TemPermissaoCadastroDadosSaude;

         scrollBox := TScrollBox.Create( tabSheet );
         scrollBox.Parent := tabSheet;
         scrollBox.Align := alClient;
         scrollBox.Name := 'sb' + md5_categoria;

         listaAbas.Add( md5_categoria );
      end else begin
         // Se a aba já existia, então procuramos ela
         if ( md5_categoria = MD5_ABA_PADRAO_FICHA_ALUNO ) then
         begin
            tabSheet := tsFichaSaude;
            scrollBox := sbFichaSaude;
         end else begin
            tabSheet := TTabSheet( pcAbasCategorias.FindComponent( 'ts' + md5_categoria ) );
            scrollBox := TScrollBox( tabSheet.FindComponent( 'sb' + md5_categoria ) );
         end;
      end;

      // Para que cada componente tenham um nome (que não seja aleatório),
      // pegamos o md5 do código do campo para usar como nome
      md5_campo := qyListaCategoriasCampos.FieldByName('CD_CAMPO_MD5').AsString;

      // Após a questão das abas estar ok, criamos os campos
      panelCampos := TPanel.Create( scrollBox );
      panelCampos.Parent := scrollBox;

      if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'M' ) then
         panelCampos.Height := 110
      else
         panelCampos.Height := 60;

      panelCampos.Name := 'pnCampo' + md5_campo;
      panelCampos.Align := alBottom; // Ué, mas pra que setar Align 2 vezes?
      panelCampos.Align := alTop; // Para manter os componentes já existentes na posição que estão
      panelCampos.Caption := '';

      labelCampos := TLabel.Create( panelCampos );
      labelCampos.Parent := panelCampos;
      labelCampos.Name := 'lbCampo' + md5_campo;
      labelCampos.Caption := qyListaCategoriasCampos.FieldByName('DS_CAMPO').AsString;
      if qyListaCategoriasCampos.FieldByName('DS_CAMPO_DESCRICAO').AsString <> '' then
      begin
         labelCampos.Caption := labelCampos.Caption + ' - ' + qyListaCategoriasCampos.FieldByName('DS_CAMPO_DESCRICAO').AsString;
      end;
      labelCampos.Left := 10;
      labelCampos.Top := 6;

      // Cria os campos com base no DS_TIPO
      if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'A' ) OR
         ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'D' ) then
      begin
         { Edit }
         editMaskCampos := TMaskEdit.Create( panelCampos );
         editMaskCampos.Parent := panelCampos;
         editMaskCampos.Name := 'edCampo' + md5_campo;
         editMaskCampos.Left := 10;
         editMaskCampos.Top := 25;
         editMaskCampos.Width := panelCampos.Width - editMaskCampos.Left - 10;

         if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'D' ) then
            editMaskCampos.EditMask := '!99/99/0000;1; '
         else
            editMaskCampos.EditMask := '';

         editMaskCampos.Text := '';
         editMaskCampos.Tag := qyListaCategoriasCampos.FieldByName('CD_CAMPO').AsInteger;
         editMaskCampos.OnChange := ActiveButtons;

         listaComponentesToResize.Add( tabSheet.Name + ':' + scrollBox.Name + ':' + panelCampos.Name + ':' + editMaskCampos.Name + ':1' );
      end else if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'M' ) then
      begin
         { Memo }
         memoCampos := TMemo.Create( panelCampos );
         memoCampos.Parent := panelCampos;
         memoCampos.Name := 'mmCampo' + md5_campo;
         memoCampos.Left := 10;
         memoCampos.Top := 25;
         memoCampos.Width := panelCampos.Width - memoCampos.Left - 10;
         memoCampos.Height := panelCampos.Height - memoCampos.Top - 10;
         memoCampos.Text := '';
         memoCampos.Tag := qyListaCategoriasCampos.FieldByName('CD_CAMPO').AsInteger;
         memoCampos.OnChange := ActiveButtons;

         listaComponentesToResize.Add( tabSheet.Name + ':' + scrollBox.Name + ':' + panelCampos.Name + ':' + memoCampos.Name + ':1' );
      end else if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'U' ) OR
                  ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'V' ) then
      begin
         { RadioGroup e CheckBox }
         editCampos := TEdit.Create( panelCampos );
         editCampos.Parent := panelCampos;

         if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'U' ) then
            editCampos.Name := 'edCampoRG' + md5_campo
         else
            editCampos.Name := 'edCampoCB' + md5_campo;

         editCampos.Left := 10;
         editCampos.Top := 25;
         editCampos.Width := panelCampos.Width - editCampos.Left - 32;
         editCampos.ReadOnly := True;        

         editCampos.Text := '';
         editCampos.Tag := qyListaCategoriasCampos.FieldByName('CD_CAMPO').AsInteger;

         subPanelCampos := TPanel.Create( panelCampos );
         subPanelCampos.Parent := panelCampos;
         if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'U' ) then
            subPanelCampos.Name := 'subpnCampoRG' + md5_campo
         else
            subPanelCampos.Name := 'subpnCampoCB' + md5_campo;
         subPanelCampos.Width := 28;
         subPanelCampos.Align := alRight;
         subPanelCampos.Caption := '';
         subPanelCampos.BevelOuter := bvNone;
         subPanelCampos.Tag := qyListaCategoriasCampos.FieldByName('CD_CAMPO').AsInteger;

         speedButtonCampos := TSpeedButton.Create( subPanelCampos );
         speedButtonCampos.Parent := subPanelCampos;
         if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'U' ) then
            speedButtonCampos.Name := 'sbCampoRG' + md5_campo
         else
            speedButtonCampos.Name := 'sbCampoCB' + md5_campo;
         speedButtonCampos.Left := 0;
         speedButtonCampos.Top := 22;
         speedButtonCampos.Width := 22;
         speedButtonCampos.Height := 22;
         speedButtonCampos.Flat := True;
         speedButtonCampos.NumGlyphs := 2;
         speedButtonCampos.Glyph := SpeedButton1.Glyph;
         speedButtonCampos.OnClick := CampoAdicionalOutros;
         speedButtonCampos.Tag := qyListaCategoriasCampos.FieldByName('CD_CAMPO').AsInteger;

         listaComponentesToResize.Add( tabSheet.Name + ':' + scrollBox.Name + ':' + panelCampos.Name + ':' + editCampos.Name + ':1' );
      end else if ( qyListaCategoriasCampos.FieldByName('DS_TIPO').AsString = 'S' ) then
      begin
         { Combobox }
         comboboxCampos := TComboBox.Create( panelCampos );
         comboboxCampos.Parent := panelCampos;
         comboboxCampos.Name := 'cbCampo' + md5_campo;
         comboboxCampos.Left := 10;
         comboboxCampos.Top := 25;
         comboboxCampos.Width := panelCampos.Width - comboboxCampos.Left - 10;
         comboboxCampos.Text := '';
         comboboxCampos.Style := csDropDownList;
         comboboxCampos.Items.Clear;
         comboboxCampos.ItemIndex := -1;
         comboboxCampos.Tag := qyListaCategoriasCampos.FieldByName('CD_CAMPO').AsInteger;
         comboboxCampos.OnChange := ActiveButtons;

         // Inserção dos valores
         if ( qyListaCategoriasCampos.FieldByName('ME_SQL').AsString = '' ) then
         begin
            strCampos := qyListaCategoriasCampos.FieldByName('ME_OPCOES').AsString;
         end else begin
            try
               qyAuxCamposME_SQL.Close();
               qyAuxCamposME_SQL.SQL.Text := qyListaCategoriasCampos.FieldByName('ME_SQL').AsString;
               qyAuxCamposME_SQL.Open();

               Separador := '';
               while not qyAuxCamposME_SQL.Eof do
               begin
                  strCampos := strCampos + Separador + qyAuxCamposME_SQL.Fields[1].AsString;
                  Separador := ';';

                  qyAuxCamposME_SQL.Next();
               end;               
            except
            end;
         end;

         SplitString( strCampos, ';', listaCampos );

         for I := 0 to listaCampos.Count - 1 do
            comboboxCampos.AddItem( trim( listaCampos[I] ), nil );

         listaComponentesToResize.Add( tabSheet.Name + ':' + scrollBox.Name + ':' + panelCampos.Name + ':' + comboboxCampos.Name + ':1' );
      end;

      qyListaCategoriasCampos.Next;
   end;

   Inc(ControlePaginas);
   tsAtendimentos.PageIndex := ControlePaginas;
   tsAtendimentos.TabVisible := TemPermissaoAtendimentoProntuario;
   Inc(ControlePaginas);
   tsProntuario.PageIndex := ControlePaginas;
   tsProntuario.TabVisible := TemPermissaoAtendimentoProntuario;
end;

procedure TfrmFichaSaudeCompleta.CarregarInformacoesAdicionaisPessoaFiltrada;
var
   I: Integer;
   arr: TStringList;
   panelCampos: TPanel;
   strValores: String;
begin
   arr := TStringList.Create;

   Pessoa.ReloadNecessidadesEspeciaisCompleta();

   ActiveButtonsLigado := False;
   for I := 0 to listaComponentesToResize.Count - 1 do
   begin
      // arr[0] = TabSheet
      // arr[1] = ScrollBox
      // arr[2] = Panel
      // arr[3] = Componente em si
      // arr[4] = Se é editável ou não
      SplitString( listaComponentesToResize[I], ':', arr );

      if ( arr.Count >= 5 ) AND ( arr[4] = '1' ) then
      begin
         if ( arr[0] = tsFichaSaude.Name ) then
            panelCampos := TPanel( sbFichaSaude.FindComponent( arr[2] ) )
         else
            panelCampos := TPanel( pcAbasCategorias.FindComponent( arr[0] ).FindComponent( arr[1] ).FindComponent( arr[2] ) );
         if ( panelCampos = nil ) then Continue;

         if ( panelCampos.FindComponent( arr[3] ) is TMaskEdit ) then
            TMaskEdit( panelCampos.FindComponent( arr[3] ) ).Text := Pessoa.NecessidadesEspeciaisCompleta[ TMaskEdit( panelCampos.FindComponent( arr[3] ) ).Tag ]
         else if ( panelCampos.FindComponent( arr[3] ) is TMemo ) then
            TMemo( panelCampos.FindComponent( arr[3] ) ).Text := Pessoa.NecessidadesEspeciaisCompleta[ TMemo( panelCampos.FindComponent( arr[3] ) ).Tag ]
         else if ( panelCampos.FindComponent( arr[3] ) is TEdit ) then
            TEdit( panelCampos.FindComponent( arr[3] ) ).Text := ReplaceStr( Pessoa.NecessidadesEspeciaisCompleta[ TEdit( panelCampos.FindComponent( arr[3] ) ).Tag ], ';', ', ' )
         else if ( panelCampos.FindComponent( arr[3] ) is TComboBox ) then
         begin
            strValores := Pessoa.NecessidadesEspeciaisCompleta[ TComboBox( panelCampos.FindComponent( arr[3] ) ).Tag ];
            TComboBox( panelCampos.FindComponent( arr[3] ) ).ItemIndex := TComboBox( panelCampos.FindComponent( arr[3] ) ).Items.IndexOf( trim(strValores) );
         end;
      end;      
   end;
   ActiveButtons(nil);
   ActiveButtonsLigado := True;      
end;

procedure TfrmFichaSaudeCompleta.CarregarPessoaFiltrada;
begin
   // Carrega lista de atendimentos
   qyAtendimentos.Close();
   if ( filtro_cd_pessoa > 0 ) then
   begin
      AbreQueryAtendimentos();
   end;

   // Carrega objeto da pessoa (aluno) filtrado
   Pessoa := TClassePessoa.Create( filtro_cd_pessoa );

   // Carrega informações da pessoa, e dos responsáveis
   edCodigo.Text := IntToStr( filtro_cd_pessoa );
   edNome.Text := Pessoa.Nome;

   if ( Pessoa.TemFoto ) then
      Image1.Picture.Assign( Pessoa.Foto );   

   if ( Pessoa.Idade = 0 ) then
      lbIdade.Caption := '--'
   else
      lbIdade.Caption := IntToStr( Pessoa.Idade ) + ' Anos';

   lbContatosAluno.Caption := Pessoa.ContatosExtenso;

   // Necessidades Especiais
   edNecessidadesEspeciais.Text := Pessoa.NecessidadesEspeciaisExtenso;

   // Carrega informações dos Responsáveis 
   edNomePai.Text := Pessoa.Pai.Nome;
   edContatosPai.Text := Pessoa.Pai.ContatosExtenso;

   edNomeMae.Text := Pessoa.Mae.Nome;
   edContatosMae.Text := Pessoa.Mae.ContatosExtenso;

   edNomeResp.Text := Pessoa.RespAcad.Nome;
   edContatosResp.Text := Pessoa.RespAcad.ContatosExtenso;

   pcAbasCategorias.ActivePageIndex := 0;

   CarregarInformacoesAdicionaisPessoaFiltrada();
end;

class procedure TfrmFichaSaudeCompleta.ClearDeficiencia(
  const cd_pessoa: integer);
const
   SSQLClearDef = 'DELETE FROM PESSOAS_DEFICIENCIAS_COMPLETO WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLClearDef);
   try
      Statement.SetInt(1, cd_pessoa);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

class procedure TfrmFichaSaudeCompleta.ClearFicha(const cd_pessoa: integer);
const
   SSQLClearFicha = 'DELETE FROM PESSOAS_ATENDIMENTOS WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLClearFicha);
   try
      Statement.SetInt(1, cd_pessoa);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;

end;

procedure TfrmFichaSaudeCompleta.dsAtendimentosStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not ( qyAtendimentos.State IN [ dsInsert, dsEdit ] );
   btnAlterar.Enabled := not ( qyAtendimentos.State IN [ dsInsert, dsEdit ] );
   btnExcluir.Enabled := not ( qyAtendimentos.State IN [ dsInsert, dsEdit ] );

   btnSalvar.Enabled := ( qyAtendimentos.State IN [ dsInsert, dsEdit ] );
   btnCancelar.Enabled := ( qyAtendimentos.State IN [ dsInsert, dsEdit ] );
end;

procedure TfrmFichaSaudeCompleta.edCodigoExit(Sender: TObject);
begin
   if ( trim( edCodigo.Text ) = '' ) OR
      ( StrToInt( edCodigo.Text ) = filtro_cd_pessoa ) then Exit;

   filtro_cd_pessoa := StrToInt( edCodigo.Text );
   CarregarPessoaFiltrada();
end;

procedure TfrmFichaSaudeCompleta.FormCreate(Sender: TObject);
begin
   filtro_cd_pessoa := 0;
   edCodigo.OnKeyPress := SomenteNumeros;
   arrNomesBackup := TStringList.Create;

   listaComponentesToResize := TStringList.Create;
end;

procedure TfrmFichaSaudeCompleta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2: if btnIncluir.Visible AND btnIncluir.Enabled then btnIncluirClick(nil);
      VK_F3: if btnAlterar.Visible AND btnAlterar.Enabled then btnAlterarClick(nil);
      VK_F5: if btnSalvar.Visible AND btnSalvar.Enabled then btnSalvarClick(nil);
      VK_F6: if btnCancelar.Visible AND btnCancelar.Enabled then btnCancelarClick(nil);
      VK_F7: if btnImprimir.Visible AND btnImprimir.Enabled then btnImprimirClick(nil);             
      VK_F9: if btnExcluir.Visible AND btnExcluir.Enabled then btnExcluirClick(nil);
      VK_F12: btnSairClick(nil);
   end;
end;

procedure TfrmFichaSaudeCompleta.FormResize(Sender: TObject);
begin
   ReajustaLarguraContatos();
end;

procedure TfrmFichaSaudeCompleta.FormShow(Sender: TObject);
begin
   // Carrega as permissões que o usuário tem
   TemPermissaoAtendimentoProntuario := DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude.Prontuario', npAcesso, False );
   TemPermissaoCadastroDadosSaude := DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npAcesso, False );

   // Carrega a planilha de exibição de atendimentos
   DM.MontarPlanilha(grdAtendimentos, 'planilha_ficha_saude_atendimentos_campos');

   // Carregar abas
   CarregarAbasCamposAdicionais();

   // Ajusta os componentes na tela ao abrir e no onresize
   ReajustaLarguraContatos();

   // Se tiver alguma pessoa filtrada ao abrir a tela, carrega as informações dela
   if filtro_cd_pessoa > 0 then
   begin
      CarregarPessoaFiltrada();
   end;

   // Por algum bug escroto, tenho que setar o PageIndex 2 vezes, pois senão o conteúdo não aparece da 1ª guia
   pcAbasCategorias.ActivePageIndex := 1;
   pcAbasCategorias.ActivePageIndex := 0;

   VerificaBotoesAtivos();
end;

function TfrmFichaSaudeCompleta.getCdPessoa: Integer;
begin
   Result := filtro_cd_pessoa;
end;

function TfrmFichaSaudeCompleta.GetCupomImpressao: String;
begin
   Result := DM.variavel_parametro('ficha_saude_campos');

   Result := StringReplace( Result, '[unidade_nome]', DM.variavel_parametro('cliente_razao_social'), [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[DATA]',  FormatDateTime('dd/mm/yyyy', Now() ), [rfReplaceAll, rfIgnoreCase] ) ;

   Result := StringReplace( Result, '[dt_atendimento]', FormatDateTime('dd/mm/yyyy', qyAtendimentosdt_atendimento.AsDateTime) , [rfReplaceAll, rfIgnoreCase] );

   Result := StringReplace( Result, '[HORA]',  FormatDateTime('hh:nn', Now() ), [rfReplaceAll, rfIgnoreCase] ) ;

   Result := StringReplace( Result, '[codigo]', IntToStr( Pessoa.Codigo ), [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[nome]', Pessoa.Nome, [rfReplaceAll, rfIgnoreCase] );

   if ( qyAtendimentossn_acompanhado.AsInteger = 1 ) then
   begin
      Result := StringReplace( Result, '[acompanhado_sim]', 'X', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[acompanhado_nao]', ' ', [rfReplaceAll, rfIgnoreCase] );
   end else begin
      Result := StringReplace( Result, '[acompanhado_sim]', ' ', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[acompanhado_nao]', 'X', [rfReplaceAll, rfIgnoreCase] );
   end;

   Result := StringReplace( Result, '[nome_acompanhante]', qyAtendimentosnm_acompanhante.AsString, [rfReplaceAll, rfIgnoreCase] );

   if ( qyAtendimentossn_medicado_casa.AsInteger = 1 ) then
   begin
      Result := StringReplace( Result, '[medicado_casa_sim]', 'X', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[medicado_casa_nao]', ' ', [rfReplaceAll, rfIgnoreCase] );
   end else begin
      Result := StringReplace( Result, '[medicado_casa_sim]', ' ', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[medicado_casa_nao]', 'X', [rfReplaceAll, rfIgnoreCase] );
   end;

   Result := StringReplace( Result, '[medicamento_casa]', qyAtendimentosds_medicamento_casa.AsString, [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[pressao_arterial]', qyAtendimentosds_pressao_arterial.AsString, [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[temperatura]', qyAtendimentosds_temperatura.AsString, [rfReplaceAll, rfIgnoreCase] );

   if ( qyAtendimentossn_comunicado_telefone.AsInteger = 1 ) then
   begin
      Result := StringReplace( Result, '[comunicado_telefone_sim]', 'X', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_telefone_nao]', ' ', [rfReplaceAll, rfIgnoreCase] );
   end else begin
      Result := StringReplace( Result, '[comunicado_telefone_sim]', ' ', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_telefone_nao]', 'X', [rfReplaceAll, rfIgnoreCase] );
   end;

   if ( qyAtendimentossn_comunicado_agenda.AsInteger = 1 ) then
   begin
      Result := StringReplace( Result, '[comunicado_agenda_sim]', 'X', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_agenda_nao]', ' ', [rfReplaceAll, rfIgnoreCase] );
   end else begin
      Result := StringReplace( Result, '[comunicado_agenda_sim]', ' ', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_agenda_nao]', 'X', [rfReplaceAll, rfIgnoreCase] );
   end;

   if ( qyAtendimentossn_comunicado_email.AsInteger = 1 ) then
   begin
      Result := StringReplace( Result, '[comunicado_email_sim]', 'X', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_email_nao]', ' ', [rfReplaceAll, rfIgnoreCase] );
   end else begin
      Result := StringReplace( Result, '[comunicado_email_sim]', ' ', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_email_nao]', 'X', [rfReplaceAll, rfIgnoreCase] );
   end;

   if ( qyAtendimentossn_comunicado_ocorrencia.AsInteger = 1 ) then
   begin
      Result := StringReplace( Result, '[comunicado_ocorrencia_sim]', 'X', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_ocorrencia_nao]', ' ', [rfReplaceAll, rfIgnoreCase] );
   end else begin
      Result := StringReplace( Result, '[comunicado_ocorrencia_sim]', ' ', [rfReplaceAll, rfIgnoreCase] );
      Result := StringReplace( Result, '[comunicado_ocorrencia_nao]', 'X', [rfReplaceAll, rfIgnoreCase] );
   end;

   Result := StringReplace( Result, '[comunicado_outros]', qyAtendimentosds_comunicado_outros.AsString, [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[retornou_para]', qyAtendimentosretorno.AsString, [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[retornou_com_quem]', qyAtendimentosds_retorno_quem.AsString, [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[procedimento_adotado]', qyAtendimentosds_procedimento_adotado.AsString, [rfReplaceAll, rfIgnoreCase] );
   Result := StringReplace( Result, '[peso]', qyAtendimentosvl_peso.AsString, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmFichaSaudeCompleta.grdAtendimentosDblClick(Sender: TObject);
begin
   pcAbasCategorias.ActivePage := tsProntuario;
   MudaDataSetAtendimentos(qyAtendimentos);
   VerificaBotoesAtivos();
end;

procedure TfrmFichaSaudeCompleta.grdAtendimentosTitleClick(Column: TColumn);
var
   campo_ordenacao: String;
begin
   if ( Column.FieldName = 'acompanhado' ) then
      campo_ordenacao := 'sn_acompanhado'
   else if ( Column.FieldName = 'medicado_casa' ) then
      campo_ordenacao := 'sn_medicamento_casa'
   else if ( Column.FieldName = 'comunicado_telefone' ) then
      campo_ordenacao := 'sn_comunicado_telefone'
   else if ( Column.FieldName = 'comunicado_agenda' ) then
      campo_ordenacao := 'sn_comunicado_agenda'
   else if ( Column.FieldName = 'comunicado_email' ) then
      campo_ordenacao := 'sn_comunicado_email'
   else if ( Column.FieldName = 'comunicado_ocorrencia' ) then
      campo_ordenacao := 'sn_comunicado_ocorrencia'
   else if ( Column.FieldName = 'retorno' ) then
      campo_ordenacao := 'cd_retorno'
   else
      campo_ordenacao := Column.FieldName;

   if ( campo_ordenacao <> qyAtendimentos.SortedFields ) then
   begin
      qyAtendimentos.SortedFields := campo_ordenacao;
      qyAtendimentos.SortType := stAscending;
   end else begin
      case qyAtendimentos.SortType of
         stAscending: qyAtendimentos.SortType := stDescending;
         stDescending: begin
            qyAtendimentos.SortedFields := '';
            qyAtendimentos.SortType := stIgnored;
         end;
         stIgnored: qyAtendimentos.SortType := stAscending;
      end;
   end;
end;

class function TfrmFichaSaudeCompleta.HasDeficiencia(
  const cd_pessoa: integer): Boolean;
const
   SSQLFindDef = 'SELECT CD_PESSOA_DEFICIENCIA FROM PESSOAS_DEFICIENCIAS_COMPLETO WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLFindDef);
   try
      Statement.SetInt(1, cd_pessoa);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         Result := ResultSet.Next;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;
end;

class function TfrmFichaSaudeCompleta.HasFicha(
  const cd_pessoa: integer): Boolean;
const
   SSQLFindFicha = 'SELECT CD_ATENDIMENTO FROM PESSOAS_ATENDIMENTOS WHERE CD_PESSOA = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLFindFicha);
   try
      Statement.SetInt(1, cd_pessoa);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         Result := ResultSet.Next;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;
end;

procedure TfrmFichaSaudeCompleta.MudaDataSetAtendimentos(query: TUMZQuery; bMudaQuery: boolean);
var
   cd_usuario_alteracao: Integer;
begin
   if bMudaQuery then
      dsAtendimentos.DataSet := query;

   qyAtendimentoUltimoUsuario.Close;
   if ( query = nil ) then
   begin
      lbUltimoUsuario.Caption := CAPTION_ULTIMO_USUARIO_DEFAULT;
   end else begin
      if ( TryStrToInt( qyAtendimentoscd_usuario.AsString, cd_usuario_alteracao ) ) AND
         ( Trim( arrNomesBackup.Values[ IntToStr(cd_usuario_alteracao) ] ) <> EmptyStr ) then
      begin
         lbUltimoUsuario.Caption := arrNomesBackup.Values[ IntToStr(cd_usuario_alteracao) ];
      end else begin
         qyAtendimentoUltimoUsuario.ParamByName('cd_usuario').AsInteger := cd_usuario_alteracao;
         qyAtendimentoUltimoUsuario.Open;
         if qyAtendimentoUltimoUsuario.RecordCount = 1 then
         begin
            lbUltimoUsuario.Caption := qyAtendimentoUltimoUsuarionm_pessoa.AsString;
            arrNomesBackup.Values[ IntToStr(cd_usuario_alteracao) ] := qyAtendimentoUltimoUsuarionm_pessoa.AsString;
         end else begin
            lbUltimoUsuario.Caption := CAPTION_ULTIMO_USUARIO_DEFAULT;
         end;
      end;
   end;
end;

procedure TfrmFichaSaudeCompleta.pcAbasCategoriasChange(Sender: TObject);
begin
   VerificaBotoesAtivos();

   if ( pcAbasCategorias.ActivePage = tsProntuario ) then
   begin
      MudaDataSetAtendimentos(nil);
   end else begin
      MudaDataSetAtendimentos(qyAtendimentos);
   end;
end;

procedure TfrmFichaSaudeCompleta.pcAbasCategoriasChanging(Sender: TObject;
  var AllowChange: Boolean);
var
   status: String;
begin
   if ( filtro_cd_pessoa <= 0 ) then
   begin
      Mensagem( 'Você deve selecionar um aluno.', '', MB_ICONEXCLAMATION + MB_OK, Handle );
      AllowChange := False;
   end;   

   if AllowChange AND
      ( pcAbasCategorias.ActivePage = tsProntuario ) AND
      ( qyAtendimentos.State IN [ dsInsert, dsEdit ] ) then
   begin
      if ( qyAtendimentos.State IN [ dsInsert ] ) then
         status := 'Inclusão'
      else
         status := 'Edição';      

      Mensagem( 'Para alterar de aba é necessário Salvar ou Cancelar a ' + status + ' de registro.', '', MB_ICONEXCLAMATION + MB_OK, Handle );
      AllowChange := False;
   end;
end;

procedure TfrmFichaSaudeCompleta.qyAtendimentosAfterPost(DataSet: TDataSet);
begin
   MudaDataSetAtendimentos(qyAtendimentos, False);
end;

procedure TfrmFichaSaudeCompleta.qyAtendimentosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude.Prontuario', npAlterar, True ) then Abort();
end;

procedure TfrmFichaSaudeCompleta.qyAtendimentosBeforePost(DataSet: TDataSet);
begin
   // Se o usuário está editando um atendimento,
   // então vamos salvar o código do último usuário que fez modificação
   if ( qyAtendimentos.State IN [ dsInsert, dsEdit ] ) then
   begin
      qyAtendimentoscd_usuario.AsInteger := DM.iCdPessoaLogado;
   end;   
end;

procedure TfrmFichaSaudeCompleta.qyAtendimentosCalcFields(DataSet: TDataSet);
begin
   // Veio acompanhado?
   if ( qyAtendimentossn_acompanhado.AsInteger = 1 ) then
      qyAtendimentosacompanhado.AsString := 'X'
   else
      qyAtendimentosacompanhado.AsString := '';

   // Foi medicado em casa?
   if ( qyAtendimentossn_medicado_casa.AsInteger = 1 ) then
      qyAtendimentosmedicado_casa.AsString := 'X'
   else
      qyAtendimentosmedicado_casa.AsString := '';

   // Comunicado por telefone?
   if ( qyAtendimentossn_comunicado_telefone.AsInteger = 1 ) then
      qyAtendimentoscomunicado_telefone.AsString := 'X'
   else
      qyAtendimentoscomunicado_telefone.AsString := '';

   // Comunicado por agenda?
   if ( qyAtendimentossn_comunicado_agenda.AsInteger = 1 ) then
      qyAtendimentoscomunicado_agenda.AsString := 'X'
   else
      qyAtendimentoscomunicado_agenda.AsString := '';

   // Comunicado por email?
   if ( qyAtendimentossn_comunicado_email.AsInteger = 1 ) then
      qyAtendimentoscomunicado_email.AsString := 'X'
   else
      qyAtendimentoscomunicado_email.AsString := '';

   // Comunicado por ocorrência?
   if ( qyAtendimentossn_comunicado_ocorrencia.AsInteger = 1 ) then
      qyAtendimentoscomunicado_ocorrencia.AsString := 'X'
   else
      qyAtendimentoscomunicado_ocorrencia.AsString := '';

   // Retornou para?
   case qyAtendimentoscd_retorno.AsInteger of
      1: qyAtendimentosretorno.AsString := 'SALA DE AULA';
      2: qyAtendimentosretorno.AsString := 'CASA';
      3: qyAtendimentosretorno.AsString := 'OUTROS';
      else
         qyAtendimentosretorno.AsString := ''
   end;

   qyAtendimentosds_procedimento_adotado.AsString := qyAtendimentosds_procedimento_adotado_memo.AsString;
end;

procedure TfrmFichaSaudeCompleta.qyAtendimentosNewRecord(DataSet: TDataSet);
begin
   qyAtendimentoscd_pessoa.AsInteger := filtro_cd_pessoa;
   qyAtendimentosdt_atendimento.AsDateTime := DM.DataAtual();

   // Por padrão, o local de retorno é outros
   qyAtendimentoscd_retorno.AsInteger := 3;

   // Por padrão, todos não-selecionados
   qyAtendimentossn_acompanhado.AsInteger := 0;
   qyAtendimentossn_medicado_casa.AsInteger := 0;
   qyAtendimentossn_comunicado_telefone.AsInteger := 0;
   qyAtendimentossn_comunicado_agenda.AsInteger := 0;
   qyAtendimentossn_comunicado_email.AsInteger := 0;
   qyAtendimentossn_comunicado_ocorrencia.AsInteger := 0;
end;

procedure TfrmFichaSaudeCompleta.ReajustaLarguraContatos;
var
   I: Integer;
   arr: TStringList;
   panelCampos: TPanel;
begin
   lbContatosAluno.Width := Panel3.Width - lbContatosAluno.Left - 5;

   edContatosPai.Width := Panel3.Width - edContatosPai.Left - 5;
   edContatosMae.Width := edContatosPai.Width;
   edContatosResp.Width := edContatosPai.Width;

   DBEdit2.Width := tsProntuario.Width - DBEdit2.Left - 8;
   DBEdit3.Width := tsProntuario.Width - DBEdit3.Left - 8;
   DBEdit7.Width := tsProntuario.Width - DBEdit7.Left - 8;
   DBEdit8.Width := tsProntuario.Width - DBEdit8.Left - 8;
   DBMemo1.Width := tsProntuario.Width - DBMemo1.Left - 8;

   edNecessidadesEspeciais.Width := pnNecessidadesEspeciais.Width - edNecessidadesEspeciais.Left - 32;

   arr := TStringList.Create;
   for I := 0 to listaComponentesToResize.Count - 1 do
   begin
      // arr[0] = TabSheet
      // arr[1] = ScrollBox
      // arr[2] = Panel
      // arr[3] = Componente em si
      // arr[4] = Se é editável ou não
      SplitString( listaComponentesToResize[I], ':', arr );

      if ( arr[0] = tsFichaSaude.Name ) then
         panelCampos := TPanel( sbFichaSaude.FindComponent( arr[2] ) )
      else
         panelCampos := TPanel( pcAbasCategorias.FindComponent( arr[0] ).FindComponent( arr[1] ).FindComponent( arr[2] ) );
      if ( panelCampos = nil ) then Continue;

      if ( panelCampos.FindComponent( arr[3] ) is TMaskEdit ) then
         TMaskEdit( panelCampos.FindComponent( arr[3] ) ).Width := panelCampos.Width - TMaskEdit( panelCampos.FindComponent( arr[3] ) ).Left - 10
      else if ( panelCampos.FindComponent( arr[3] ) is TEdit ) then
         TEdit( panelCampos.FindComponent( arr[3] ) ).Width := panelCampos.Width - TEdit( panelCampos.FindComponent( arr[3] ) ).Left - 32
      else if ( panelCampos.FindComponent( arr[3] ) is TMemo ) then
         TMemo( panelCampos.FindComponent( arr[3] ) ).Width := panelCampos.Width - TMemo( panelCampos.FindComponent( arr[3] ) ).Left - 10
      else if ( panelCampos.FindComponent( arr[3] ) is TComboBox ) then
         TComboBox( panelCampos.FindComponent( arr[3] ) ).Width := panelCampos.Width - TComboBox( panelCampos.FindComponent( arr[3] ) ).Left - 10;
   end;      
end;

procedure TfrmFichaSaudeCompleta.SalvarInformacoesAdicionaisPessoaFiltrada;
var
   I: Integer;
   arr: TStringList;
   panelCampos: TPanel;
   qySalvaNecessidadeEspecial: TUMZQuery;
begin
   arr := TStringList.Create;
   DM.CriarConsulta(qySalvaNecessidadeEspecial);

   ActiveButtonsLigado := False;
   for I := 0 to listaComponentesToResize.Count - 1 do
   begin
      // arr[0] = TabSheet
      // arr[1] = ScrollBox
      // arr[2] = Panel
      // arr[3] = Componente em si
      // arr[4] = Se é editável ou não
      SplitString( listaComponentesToResize[I], ':', arr );

      if ( arr.Count >= 5 ) AND ( arr[4] = '1' ) then
      begin
         qySalvaNecessidadeEspecial.Close();
         qySalvaNecessidadeEspecial.SQL.Clear();

         if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
         begin
            qySalvaNecessidadeEspecial.SQL.Add(' MERGE INTO PESSOAS_DEFICIENCIAS_COMPLETO PDC USING ( ');
            qySalvaNecessidadeEspecial.SQL.Add('    SELECT :cd_pessoa AS CD_PESSOA, ');
            qySalvaNecessidadeEspecial.SQL.Add('           :cd_campo AS CD_CAMPO, ');
            qySalvaNecessidadeEspecial.SQL.Add('           :me_valor AS ME_VALOR FROM DUAL ');
            qySalvaNecessidadeEspecial.SQL.Add(' ) PDC2 ON (PDC.CD_PESSOA = PDC2.CD_PESSOA AND PDC.CD_CAMPO = PDC2.CD_CAMPO) ');
            qySalvaNecessidadeEspecial.SQL.Add(' WHEN MATCHED THEN UPDATE SET PDC.ME_VALOR = PDC2.ME_VALOR ');
            qySalvaNecessidadeEspecial.SQL.Add(' WHEN NOT MATCHED THEN ');
            qySalvaNecessidadeEspecial.SQL.Add('    INSERT (PDC.CD_PESSOA, PDC.CD_CAMPO, PDC.ME_VALOR) VALUES (PDC2.CD_PESSOA, PDC2.CD_CAMPO, PDC2.ME_VALOR) ');
         end else begin
            qySalvaNecessidadeEspecial.SQL.Add('REPLACE INTO pessoas_deficiencias_completo ( cd_pessoa, cd_campo, me_valor )');
            qySalvaNecessidadeEspecial.SQL.Add('VALUES ( :cd_pessoa, :cd_campo, :me_valor )');
         end;

         qySalvaNecessidadeEspecial.ParamByName('cd_pessoa').AsInteger := filtro_cd_pessoa;

         if ( arr[0] = tsFichaSaude.Name ) then
            panelCampos := TPanel( sbFichaSaude.FindComponent( arr[2] ) )
         else
            panelCampos := TPanel( pcAbasCategorias.FindComponent( arr[0] ).FindComponent( arr[1] ).FindComponent( arr[2] ) );
         if ( panelCampos = nil ) then Continue;

         if ( panelCampos.FindComponent( arr[3] ) is TMaskEdit ) then
         begin
            qySalvaNecessidadeEspecial.ParamByName('cd_campo').AsInteger := TMaskEdit( panelCampos.FindComponent( arr[3] ) ).Tag;
            if ( TMaskEdit( panelCampos.FindComponent( arr[3] ) ).EditMask = '' ) then
               qySalvaNecessidadeEspecial.ParamByName('me_valor').AsString := TMaskEdit( panelCampos.FindComponent( arr[3] ) ).Text
            else begin
               //
            end;
         end
         else if ( panelCampos.FindComponent( arr[3] ) is TMemo ) then
         begin
            qySalvaNecessidadeEspecial.ParamByName('cd_campo').AsInteger := TMemo( panelCampos.FindComponent( arr[3] ) ).Tag;
            qySalvaNecessidadeEspecial.ParamByName('me_valor').AsString := TMemo( panelCampos.FindComponent( arr[3] ) ).Text;
         end
         else if ( panelCampos.FindComponent( arr[3] ) is TComboBox ) then
         begin
            qySalvaNecessidadeEspecial.ParamByName('cd_campo').AsInteger := TComboBox( panelCampos.FindComponent( arr[3] ) ).Tag;
            qySalvaNecessidadeEspecial.ParamByName('me_valor').AsString := TComboBox( panelCampos.FindComponent( arr[3] ) ).Text;
         end else begin
            Continue;
         end;

         qySalvaNecessidadeEspecial.ExecSQL();
      end;      
   end;
   ActiveButtons(nil);
   ActiveButtonsLigado := True;
end;

procedure TfrmFichaSaudeCompleta.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grdAtendimentos, 'planilha_ficha_saude_atendimentos_campos');
end;

procedure TfrmFichaSaudeCompleta.setCdPessoa(const cd_pessoa: Integer);
begin
   filtro_cd_pessoa := cd_pessoa;
end;

procedure TfrmFichaSaudeCompleta.SomenteNumeros(Sender: TObject; var Key: Char);
begin
   if not ( Key IN ['0'..'9', Chr(8), Chr(9)] ) then Key := #0;
end;

procedure TfrmFichaSaudeCompleta.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if not resultado.filtrado then
   begin
      Exit;
   end;

   filtro_cd_pessoa := resultado.cd_pessoa;
   CarregarPessoaFiltrada();
end;

procedure TfrmFichaSaudeCompleta.SpeedButton2Click(Sender: TObject);
begin
   if ( filtro_cd_pessoa <= 0 ) OR
      not DM.UsuarioLogado.TemPermissao( 1056, npAcesso, True ) OR
      not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npIncluir, True ) OR
      not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npAlterar, True ) then Exit;

   Application.CreateForm(TfrmCadDeficiencias,frmCadDeficiencias);

   frmCadDeficiencias.CodigoAluno      := filtro_cd_pessoa;
   frmCadDeficiencias.lbPessoa.Caption := edNome.Text;
   frmCadDeficiencias.ShowModal;

   edNecessidadesEspeciais.Text := Pessoa.NecessidadesEspeciaisExtenso;
end;

procedure TfrmFichaSaudeCompleta.VerificaBotoesAtivos;
begin
   btnSalvar.Visible := ( pcAbasCategorias.ActivePage <> tsAtendimentos );
   btnCancelar.Visible := ( pcAbasCategorias.ActivePage <> tsAtendimentos );

   // Botões do atendimento
   btnImprimir.Visible := ( pcAbasCategorias.ActivePage = tsAtendimentos ) OR
                          ( ( pcAbasCategorias.ActivePage = tsProntuario ) AND ( qyAtendimentos.RecNo > 0 ) );
   btnExcluir.Visible := ( pcAbasCategorias.ActivePage = tsAtendimentos );

   // Botões do prontuário
   ToolButton4.Visible := ( pcAbasCategorias.ActivePage = tsProntuario );
   btnIncluir.Visible := ( pcAbasCategorias.ActivePage = tsProntuario );
   btnAlterar.Visible := ( pcAbasCategorias.ActivePage = tsProntuario );
end;

end.
