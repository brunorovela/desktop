unit uCertificados;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, General,
   UZDataset, ZDataset, uDM, ZAbstractDataset, uModelTam;

type
   EUMTAMCertificadoErro = class(Exception);

   TUMTAMCertificadoLivro = class(TObject)
   strict private
      FICodigo: integer;
      FIPaginas: integer;
      FILinhas: integer;
      FIPaginaAtual: integer;
      FBAberto: boolean;
      FSNome: string;
      FSTipo: string;
      FSLastError: string;
      FQyRegistrosLivro: TUMZReadOnlyQuery;
      FQyRegistrosPagina: TUMZReadOnlyQuery;
      FQyLivroCheio: TUMZReadOnlyQuery;
      FQyPaginaCheia: TUMZReadOnlyQuery;
      FQyNumeroRegistro: TUMZReadOnlyQuery;
      FQyRegistroPessoa: TUMZReadOnlyQuery;
      FQyRegistra: TUMZQuery;
      FQyFechaLivro: TUMZQuery;
      FQyAtualizaPagina: TUMZQuery;
      procedure fecha;
      function getPagina: integer;
      function isCheio: boolean;
      function isPessoaRegistrada(const AIEvento, AIPessoa: integer): boolean;
      function isPaginaCheia(const AIPagina: integer): boolean;
      function getTotalRegistros: integer; overload;
      function getTotalRegistros(const AIPagina: integer): integer; overload;
      function getNumeroRegistro(const AIEvento: integer): integer;
   private
      constructor Create(const AICodigo, AIPaginas, AILinhas, AIPaginaAtual: integer;
         const ASNome, ASTipo: string; const ABAberto: boolean);
      destructor Destroy; override;
      procedure atualizaPagina;
      procedure registraCertificadoEvento(const AIEvento, AIPessoa: integer);
      property Codigo: integer read FICodigo;
      property Nome: string read FSNome;
      property PaginaAtual: integer read FIPaginaAtual;
      property Aberto: boolean read FBAberto;
      property Cheio: boolean read isCheio;
   end;

   TfCertificados = class(TForm)
    bnAdicionaLivro: TSpeedButton;
   published
      qyInsereAtividade: TUMZQuery;
      qyMatriculaAluno: TUMZReadOnlyQuery;
      bnFechar: TSpeedButton;
      pnTitulo: TPanel;
      bvSep1: TBevel;
      sbStatus: TStatusBar;
      pnRegistrar: TPanel;
      cbLivro: TComboBox;
      lbLivro: TLabel;
      ledPagina: TLabeledEdit;
      pbProgresso: TProgressBar;
      bnRegistrar: TSpeedButton;
      pnFiltros: TPanel;
      lbEvento: TLabel;
      cbEvento: TComboBox;
      ledPessoa: TLabeledEdit;
      bnPessoa: TSpeedButton;
      pnDados: TPanel;
      bvSep2: TBevel;
      bvSep3: TBevel;
      dgDados: TDBGrid;
      dsDados: TDataSource;
      qyDados: TUMZReadOnlyQuery;
      FQyHorasDeferidasAluno: TUMZReadOnlyQuery;
      procedure informaPessoa(Sender: TObject; var Key: Char);
      procedure informaPagina(Sender: TObject; var Key: Char);
//      procedure desenhaItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
      procedure selecionaPessoa(Sender: TObject);
      procedure registra(Sender: TObject);
      procedure selecionaEvento(Sender: TObject);
      procedure selecionaLivro(Sender: TObject);
      procedure fechaFormulario(Sender: TObject; var Action: TCloseAction);
      procedure mostraFormulario(Sender: TObject);
      procedure sair(Sender: TObject);
      procedure adicionaLivro(Sender: TObject);
   strict private
      function registraAtividade(const AICodPessoa, AIAnoSem, AIEtapa, AICodAtividade, AIHoras: integer;
         const ASCodCurso, ASAtividade, ASLocal: string; const ADtInicio, ADtTermino: TDateTime): boolean;
      function verificaSeAindaTemHorasLivres(const AICodigoPessoa , AIAnoSem, AICodigoAtivide: Integer):boolean;
      procedure getDadosMatricula(const AICodPessoa: integer);
      procedure carregaEventos;
      procedure carregaLivros;
      procedure filtra;
   end;

var
   fCertificados: TfCertificados;

implementation

uses
   uBuscaPessoa, uCadLivro;

const
   SQL_GET_REGISTROS_LIVRO =
      'SELECT '+
         'cd_pessoa '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_livro = :cd_livro';

   SQL_GET_REGISTROS_PAGINA =
      'SELECT '+
         'cd_pessoa '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_livro = :cd_livro AND '+
         'nr_folha = :nr_folha';

   SQL_IS_LIVRO_CHEIO =
      'SELECT '+
         'IF((nr_paginas * nr_linhas) <= :nr_registros, 1, 0) AS cheio '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_livro';

   SQL_IS_PAGINA_CHEIA =
      'SELECT '+
         'IF(nr_linhas <= :nr_registros, 1, 0) AS cheio '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_livro';

   SQL_REGISTRA_CERTIFICADO =
      'INSERT INTO certificado_eventos(cd_evento, cd_pessoa, cd_livro, nr_folha, nr_registro, dt_registro) '+
      'VALUES(:cd_evento, :cd_pessoa, :cd_livro, :nr_folha, :nr_registro, NOW())';

   SQL_FECHA_LIVRO =
      'UPDATE certificado_livros '+
      'SET sn_aberto = 0 '+
      'WHERE cd_cert_livro = :cd_livro';

   SQL_ATUALIZA_PAGINA =
      'UPDATE certificado_livros '+
      'SET pg_atual = :nr_pagina '+
      'WHERE cd_cert_livro = :cd_livro';

   SQL_GET_PROX_REGISTRO =
      'SELECT '+
         '(IFNULL(MAX(IFNULL(nr_registro, 0)), 0) + 1) AS nr_registro '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_livro = :cd_livro';

   SQL_GET_CERT_PESSOA =
      'SELECT '+
         'cd_evento,'+
         'cd_pessoa '+
      'FROM '+
         'certificado_eventos '+
      'WHERE '+
         'cd_evento = :cd_evento AND '+
         'cd_pessoa = :cd_pessoa';

   SQL_GET_HORAS_DEFERIDAS =
      'SELECT '+
		'	IFNULL(SUM(al.nr_horas),"0") as total, '+
      '	ga.nr_horas as limite, '+
      '  ga.ds_ge_atividade as ds_ge_atividade '+
      'FROM '+
      '  ge_atividades AS ga '+
      '  LEFT JOIN ge_alunos AS al ON(al.cd_ge_atividade = ga.cd_ge_atividade AND al.nr_anosem = :nr_anosemestre and al.cd_pessoa = :cd_pessoa  and (al.cd_situacao = 1 OR (al.cd_situacao IS NULL OR al.cd_situacao=0 ) ) )   '+
		'WHERE  '+
		'	ga.cd_ge_atividade = :cd_ge_atividade 	'+
      'GROUP BY '+
		'	ga.cd_ge_atividade ';

   SQL_GET_CERTIFICADOS_EVENTO =
      'SELECT '+
         'i.CD_EVENTO,'+
         'i.CD_INSCRICAO,'+
         'i.CD_PESSOA,'+
         'IFNULL(p.nm_pessoa, i.NM_PESSOA) nm_pessoa,'+
         'v.nr_horas_evento,'+
         'v.nr_horas_participacao,'+
         'v.vl_presenca,'+
         'l.cd_cert_livro,'+
         'IF('+
            '(v.sn_certificar = 1) AND '+
            '(e.VL_PRESENCA <= v.vl_presenca) AND '+
            '(l.nm_livro IS NULL) AND '+
            '(c.nr_folha IS NULL) AND '+
            '(c.nr_registro IS NULL), 1, 0) is_registrar,'+
         'IFNULL(l.nm_livro, "") nm_livro,'+
         'IFNULL(c.nr_folha, "") nr_folha,'+
         'IFNULL(c.nr_registro, "") nr_registro '+
      'FROM '+
         'view_eventos_carga v '+
            'JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO) '+
                  'JOIN tam_eventos e USING(CD_EVENTO) '+
               'LEFT JOIN pessoas p ON(i.CD_PESSOA = p.cd_pessoa) '+
            'LEFT JOIN certificado_eventos c ON(i.CD_EVENTO = c.cd_evento AND i.CD_PESSOA = c.cd_pessoa) '+
               'LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cert_livro) '+
      'WHERE '+
         'i.CD_EVENTO = :cd_evento';

   SQL_GET_CERTIFICADOS_EVENTO_PESSOA =
      'SELECT '+
         'i.CD_EVENTO,'+
         'i.CD_INSCRICAO,'+
         'i.CD_PESSOA,'+
         'IFNULL(p.nm_pessoa, i.NM_PESSOA) nm_pessoa,'+
         'v.nr_horas_evento,'+
         'v.nr_horas_participacao,'+
         'v.vl_presenca,'+
         'l.cd_cert_livro,'+
         'IF('+
            '(v.sn_certificar = 1) AND '+
            '(e.VL_PRESENCA <= v.vl_presenca) AND '+
            '(l.nm_livro IS NULL) AND '+
            '(c.nr_folha IS NULL) AND '+
            '(c.nr_registro IS NULL), 1, 0) is_registrar,'+
         'IFNULL(l.nm_livro, "") nm_livro,'+
         'IFNULL(c.nr_folha, "") nr_folha,'+
         'IFNULL(c.nr_registro, "") nr_registro '+
      'FROM '+
         'view_eventos_carga v '+
            'JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO) '+
                  'JOIN tam_eventos e USING(CD_EVENTO) '+
               'LEFT JOIN pessoas p ON(i.CD_PESSOA = p.cd_pessoa) '+
            'LEFT JOIN certificado_eventos c ON(i.CD_EVENTO = c.cd_evento AND i.CD_PESSOA = c.cd_pessoa) '+
               'LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cert_livro) '+
      'WHERE '+
         'i.CD_EVENTO = :cd_evento AND '+
         'i.CD_PESSOA = :cd_pessoa';

   MSG_ERRO_FECHA_LIVRO =
      'Ocorreu um erro ao tentar fechar o livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_ERRO_GET_PROX_REG =
      'Ocorreu um erro ao tentar pegar o próximo número de registro do livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_LIMITE_PAGINAS =
      'O livro atingiu o limite de páginas. Selecione outro livro para prosseguir.';

   MSG_ERRO_GET_TOTAL =
      'Ocorreu um erro ao tentar resgatar o total de registros cadastrados para o livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_ERRO_GET_TOTAL_PAGINA =
      'Ocorreu um erro ao tentar resgatar o total de registros na página $nr_pagina$ no livro $nm_livro$ : ' + #13 + '$erro$';

   MSG_ERRO_IS_LIVRO_CHEIO =
      'Ocorreu um erro ao tentar verificar a disponibilidade de espaço do livro $nm_livro$ : $erro$';

   MSG_ERRO_IS_PAGINA_CHEIA =
      'Ocorreu um erro ao tentar verificar a disponibilidade de espaço na página $nr_pagina$ do livro $nm_livro$ : $erro$';

   MSG_ERRO_GET_CERT_PESSOA =
      'Ocorreu um erro ao tentar verificar certificados previamente cadastrados para o aluno $cd_aluno$ no evento $cd_evento$ : $erro$';

   MSG_ERRO_REGISTRA_CERT =
      'Ocorreu um erro ao tentar registrar certificado para o aluno $cd_aluno$ no evento $cd_evento$ : $erro$';

   MSG_SUCESSO =
      'Os certificados foram registrados com sucesso!';

   MSG_LIVRO_CHEIO =
      'O livro está completo! Não é possível inserir mais registros.' + #13 +
      'Você precisa selecionar outro livro para continuar!';

   MSG_ERRO_ATUALIZA_PAGINA =
      'Ocorreu um erro ao tentar atualizar a página do livro : $erro$';

   MSG_ERRO_HORAS_DEFERIDAS =
      'Ocorreu um erro ao tentar buscar as horas deferidas desse aluno : $erro$';

{$R *.dfm}

{ TUMTAMCertificadoLivro }

procedure TUMTAMCertificadoLivro.atualizaPagina;
begin
   Self.FQyAtualizaPagina.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   Self.FQyAtualizaPagina.ParamByName('nr_pagina').AsInteger := Self.FIPaginaAtual;
   try
      Self.FQyAtualizaPagina.ExecSQL;
   except
      on E: Exception do
         raise EUMTAMCertificadoErro.Create(StringReplace(MSG_ERRO_ATUALIZA_PAGINA, '$erro$', E.Message, []));
   end;
end;

constructor TUMTAMCertificadoLivro.Create(const AICodigo, AIPaginas, AILinhas,
  AIPaginaAtual: integer; const ASNome, ASTipo: string;
  const ABAberto: boolean);
begin
   Self.FICodigo := AICodigo;
   Self.FIPaginas := AIPaginas;
   Self.FILinhas := AILinhas;
   Self.FIPaginaAtual := AIPaginaAtual;
   Self.FBAberto := ABAberto;
   Self.FSNome := ASNome;
   Self.FSTipo := ASTipo;

   Self.FQyRegistrosLivro := DM.newROQuery;
   Self.FQyRegistrosPagina := DM.newROQuery;
   Self.FQyLivroCheio := Dm.newROQuery;
   Self.FQyPaginaCheia := DM.newROQuery;
   Self.FQyNumeroRegistro := DM.newROQuery;
   Self.FQyRegistroPessoa := DM.newROQuery;
   Self.FQyRegistra := DM.newQuery;
   Self.FQyFechaLivro := DM.newQuery;
   Self.FQyAtualizaPagina := DM.newQuery;

   Self.FQyRegistrosLivro.SQL.Text := SQL_GET_REGISTROS_LIVRO;
   Self.FQyRegistrosPagina.SQL.Text := SQL_GET_REGISTROS_PAGINA;
   Self.FQyLivroCheio.SQL.Text := SQL_IS_LIVRO_CHEIO;
   Self.FQyPaginaCheia.SQL.Text := SQL_IS_PAGINA_CHEIA;
   Self.FQyNumeroRegistro.SQL.Text := SQL_GET_PROX_REGISTRO;
   Self.FQyRegistroPessoa.SQL.Text := SQL_GET_CERT_PESSOA;
   Self.FQyRegistra.SQL.Text := SQL_REGISTRA_CERTIFICADO;
   Self.FQyFechaLivro.SQL.Text := SQL_FECHA_LIVRO;
   Self.FQyAtualizaPagina.SQL.Text := SQL_ATUALIZA_PAGINA;


   Self.FQyRegistrosLivro.ParamCheck := True;
   Self.FQyRegistrosPagina.ParamCheck := True;
   Self.FQyLivroCheio.ParamCheck := True;
   Self.FQyPaginaCheia.ParamCheck := True;
   Self.FQyNumeroRegistro.ParamCheck := True;
   Self.FQyRegistroPessoa.ParamCheck := True;
   Self.FQyRegistra.ParamCheck := True;
   Self.FQyFechaLivro.ParamCheck := True;
   Self.FQyAtualizaPagina.ParamCheck := True;

end;

destructor TUMTAMCertificadoLivro.Destroy;
begin
   Self.FQyRegistrosLivro.Close;
   Self.FQyRegistrosPagina.Close;
   Self.FQyLivroCheio.Close;
   Self.FQyPaginaCheia.Close;
   Self.FQyNumeroRegistro.Close;
   Self.FQyRegistroPessoa.Close;
   FreeAndNil(Self.FQyRegistrosLivro);
   FreeAndNil(Self.FQyRegistrosPagina);
   FreeAndNil(Self.FQyLivroCheio);
   FreeAndNil(Self.FQyPaginaCheia);
   FreeAndNil(Self.FQyNumeroRegistro);
   FreeAndNil(Self.FQyRegistroPessoa);
   FreeAndNil(Self.FQyRegistra);
   FreeAndNil(Self.FQyFechaLivro);
   FreeAndNil(Self.FQyAtualizaPagina);
   inherited;
end;

procedure TUMTAMCertificadoLivro.fecha;
begin
   Self.FQyFechaLivro.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyFechaLivro.ExecSQL;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_FECHA_LIVRO, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.getNumeroRegistro(
  const AIEvento: integer): integer;
begin
   Self.FQyNumeroRegistro.Close;
   Self.FQyNumeroRegistro.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyNumeroRegistro.Open;
      if Self.FQyNumeroRegistro.IsEmpty then
         Result := 1
      else
         Result := Self.FQyNumeroRegistro.FieldByName('nr_registro').AsInteger;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_PROX_REG, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.getPagina: integer;
begin
   Result := Self.FIPaginaAtual;
   try
      while Self.isPaginaCheia(Result) and (Result <= Self.FIPaginas) do
         Inc(Result);
   except
      on E: EUMTAMCertificadoErro do raise;
   end;
   if Result > Self.FIPaginas then
   begin
      Self.fecha;
      raise EUMTAMCertificadoErro.Create(MSG_LIMITE_PAGINAS);
   end
   else
      Self.FIPaginaAtual := Result;
end;

function TUMTAMCertificadoLivro.getTotalRegistros: integer;
begin
   Result := 0;
   Self.FQyRegistrosLivro.Close;
   Self.FQyRegistrosLivro.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyRegistrosLivro.Open;
      Result := Self.FQyRegistrosLivro.RecordCount;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_TOTAL, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError); 
      end;
   end;
end;

function TUMTAMCertificadoLivro.getTotalRegistros(
  const AIPagina: integer): integer;
begin
   Result := 0;
   Self.FQyRegistrosPagina.Close;
   Self.FQyRegistrosPagina.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   Self.FQyRegistrosPagina.ParamByName('nr_folha').AsInteger := AIPagina;
   try
      Self.FQyRegistrosPagina.Open;
      Result := Self.FQyRegistrosPagina.RecordCount;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_TOTAL_PAGINA, '$nr_pagina$', IntToStr(AIPagina), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.isCheio: boolean;
begin
   Result := False;
   Self.FQyLivroCheio.Close;
   Self.FQyLivroCheio.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyLivroCheio.ParamByName('nr_registros').AsInteger := Self.getTotalRegistros;
      Self.FQyLivroCheio.Open;
      Result := Self.FQyLivroCheio.FieldByName('cheio').AsInteger = 1;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_IS_LIVRO_CHEIO, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.isPaginaCheia(const AIPagina: integer): boolean;
begin
   Result := False;
   Self.FQyPaginaCheia.Close;
   Self.FQyPaginaCheia.ParamByName('cd_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyPaginaCheia.ParamByName('nr_registros').AsInteger := Self.getTotalRegistros(AIPagina);
      Self.FQyPaginaCheia.Open;
      Result := Self.FQyPaginaCheia.FieldByName('cheio').AsInteger = 1;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_IS_PAGINA_CHEIA, '$nr_pagina$', IntToStr(AIPagina), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$nm_livro$', Self.FSNome, []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

function TUMTAMCertificadoLivro.isPessoaRegistrada(const AIEvento,
  AIPessoa: integer): boolean;
begin
   Result := False;
   Self.FQyRegistroPessoa.Close;
   Self.FQyRegistroPessoa.ParamByName('cd_pessoa').AsInteger := AIPessoa;
   Self.FQyRegistroPessoa.ParamByName('cd_evento').AsInteger := AIEvento;
   try
      Self.FQyRegistroPessoa.Open;
      Result := not Self.FQyRegistroPessoa.IsEmpty;
   except
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_GET_CERT_PESSOA, '$cd_aluno$', IntToStr(AIPessoa), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$cd_evento$', IntToStr(AIEvento), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

procedure TUMTAMCertificadoLivro.registraCertificadoEvento(const AIEvento,
  AIPessoa: integer);
begin
   try
      if not Self.isPessoaRegistrada(AIEvento, AIPessoa) then
      begin
         Self.FQyRegistra.ParamByName('cd_evento').AsInteger := AIEvento;
         Self.FQyRegistra.ParamByName('cd_pessoa').AsInteger := AIPessoa;
         Self.FQyRegistra.ParamByName('cd_livro').AsInteger := Self.FICodigo;
         Self.FQyRegistra.ParamByName('nr_folha').AsInteger := Self.getPagina;
         Self.FQyRegistra.ParamByName('nr_registro').AsInteger := Self.getNumeroRegistro(AIEvento);
         Self.FQyRegistra.ExecSQL;
      end;
   except
      on E: EUMTAMCertificadoErro do raise;
      on E: Exception do
      begin
         Self.FSLastError := StringReplace(MSG_ERRO_REGISTRA_CERT, '$cd_aluno$', IntToStr(AIPessoa), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$cd_evento$', IntToStr(AIEvento), []);
         Self.FSLastError := StringReplace(Self.FSLastError, '$erro$', E.Message, []);
         raise EUMTAMCertificadoErro.Create(Self.FSLastError);
      end;
   end;
end;

{ TfCertificados }

procedure TfCertificados.adicionaLivro(Sender: TObject);
var
   sLivro: string;
   i: integer;
begin
   sLivro := TfCadLivro.AdicionaLivro(Self);
   if sLivro <> '' then
   begin
      Self.cbLivro.Clear;
      Self.carregaLivros;
      for i := 0 to Self.cbLivro.Items.Count - 1 do
         if sLivro = Self.cbLivro.Items.Strings[i] then
            Break;
      Self.cbLivro.ItemIndex := i;
      Self.ledPagina.Text := IntToStr(TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[i]).PaginaAtual);
   end;   
end;

procedure TfCertificados.carregaEventos;
const
   SQL_GET_EVENTOS =
      'SELECT '+
         'CD_EVENTO,'+
         'DS_EVENTO,'+
         'DT_EVENTO,'+
         'DT_EVENTO_FIM,'+
         'DS_SENHA,'+
         'SN_CHECAR_FIN_ACESSO,'+
         'SN_LIBERAR_INSCRICOES,'+
         'IFNULL(CD_GE_ATIVIDADE, 0) CD_GE_ATIVIDADE,'+
         'ME_LOCAL '+
      'FROM '+
         'tam_eventos '+
      'ORDER BY DS_EVENTO';
var
   qyEventos: TUMZReadOnlyQuery;
begin
   qyEventos := DM.newROQuery;
   try
      qyEventos.ParamCheck := False;
      qyEventos.SQL.Text := SQL_GET_EVENTOS;
      qyEventos.Open;
      Self.cbEvento.Enabled := not qyEventos.IsEmpty;
      while not qyEventos.Eof do
      begin
         Self.cbEvento.AddItem(
            qyEventos.FieldByName('DS_EVENTO').AsString,
            TUMEvento.Create(
               qyEventos.FieldByName('CD_EVENTO').AsInteger,
               qyEventos.FieldByName('DS_EVENTO').AsString,
               qyEventos.FieldByName('DT_EVENTO').AsDateTime,
               qyEventos.FieldByName('DS_SENHA').AsString,
               qyEventos.FieldByName('SN_CHECAR_FIN_ACESSO').AsInteger = 1,
               qyEventos.FieldByName('SN_LIBERAR_INSCRICOES').AsInteger = 1,
               qyEventos.FieldByName('CD_GE_ATIVIDADE').AsInteger,
               qyEventos.FieldByName('ME_LOCAL').AsString,
               qyEventos.FieldByName('DT_EVENTO_FIM').AsDateTime));
         qyEventos.Next;
      end;
   finally
      qyEventos.Close;
      FreeAndNil(qyEventos);
   end;
end;

procedure TfCertificados.carregaLivros;
const
   SQL_GET_LIVROS =
      'SELECT '+
         'cd_cert_livro,'+
         'nm_livro,'+
         'cd_tipo,'+
         'nr_paginas,'+
         'nr_linhas,'+
         'pg_atual,'+
         'sn_aberto '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_tipo = "E" AND '+
         'sn_aberto = 1';
var
   qyLivros: TUMZReadOnlyQuery;
begin
   qyLivros := DM.newROQuery;
   try
      qyLivros.ParamCheck := False;
      qyLivros.SQL.Text := SQL_GET_LIVROS;
      qyLivros.Open;
      Self.cbLivro.Enabled := not qyLivros.IsEmpty;
      while not qyLivros.Eof do
      begin
         Self.cbLivro.Items.AddObject(
            qyLivros.FieldByName('nm_livro').AsString,
            TUMTAMCertificadoLivro.Create(
               qyLivros.FieldByName('cd_cert_livro').AsInteger,
               qyLivros.FieldByName('nr_paginas').AsInteger,
               qyLivros.FieldByName('nr_linhas').AsInteger,
               qyLivros.FieldByName('pg_atual').AsInteger,
               qyLivros.FieldByName('nm_livro').AsString,
               qyLivros.FieldByName('cd_tipo').AsString,
               (qyLivros.FieldByName('sn_aberto').AsInteger = 1)));
         qyLivros.Next;
      end;
   finally
      qyLivros.Close;
      FreeAndNil(qyLivros);
   end;
end;

//procedure TfCertificados.desenhaItem(Control: TWinControl; Index: integer;
//  Rect: TRect; State: TOwnerDrawState);
//begin
//   Self.cbEvento.Canvas.TextOut(Rect.Left + 2, Rect.Top, Self.cbEvento.Items.Values[Self.cbEvento.Items.Names[Index]]);
//end;

procedure TfCertificados.fechaFormulario(Sender: TObject;
  var Action: TCloseAction);
var
   i: integer;
begin
   for i := 0 to Self.cbLivro.Items.Count - 1 do
      TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[i]).Free;
   for i := 0 to Self.cbEvento.Items.Count - 1 do
      TUMEvento(Self.cbEvento.Items.Objects[i]).Free;
   Action := caFree;
end;

procedure TfCertificados.filtra;
begin
   Self.qyDados.Close;
   if Trim(Self.ledPessoa.Text) = '' then
   begin
      Self.qyDados.SQL.Text := SQL_GET_CERTIFICADOS_EVENTO;
      Self.qyDados.ParamByName('cd_evento').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
      Self.qyDados.Open;
   end
   else
   begin
      Self.qyDados.SQL.Text := SQL_GET_CERTIFICADOS_EVENTO_PESSOA;
      Self.qyDados.ParamByName('cd_evento').AsInteger := TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento;
      Self.qyDados.ParamByName('cd_pessoa').AsString := Self.ledPessoa.Text;
      Self.qyDados.Open;
   end;
   Self.cbLivro.Enabled := not Self.qyDados.IsEmpty;
//   Self.ledPagina.Enabled := not Self.qyDados.IsEmpty;
//   Self.bnRegistrar.Enabled := not Self.qyDados.IsEmpty;
   Self.sbStatus.Panels[1].Text := IntToStr(Self.qyDados.RecordCount) + ' registros encontrados';
end;

procedure TfCertificados.getDadosMatricula(const AICodPessoa: integer);
begin
   Self.qyMatriculaAluno.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
   Self.qyMatriculaAluno.Open;
end;

procedure TfCertificados.informaPagina(Sender: TObject; var Key: Char);
begin
   if (Trim(Self.ledPagina.Text) <> '') and (Key = #13) then
      Self.registra(nil)
   else if not (Key in[#48..#57, #8]) then
      Key := #0;
end;

procedure TfCertificados.informaPessoa(Sender: TObject; var Key: Char);
begin
   if (Trim(Self.ledPagina.Text) <> '') and (Key = #13) then
      Self.filtra
   else if not (Key in[#48..#57, #8]) then
      Key := #0;
end;

procedure TfCertificados.mostraFormulario(Sender: TObject);
begin
   Self.carregaEventos;
   Self.carregaLivros;
end;

procedure TfCertificados.registra(Sender: TObject);
var
   bSucesso: boolean;
begin
   bSucesso := True;
   Self.qyDados.First;
   try
      with TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]) do
      begin
         if Cheio then
         begin
            Mensagem(MSG_LIVRO_CHEIO, Application.Title, MB_ICONERROR);
         end
         else
         begin
            Self.sbStatus.Panels[2].Text := 'Registrando ...';
            Self.pbProgresso.Min := 0;
            Self.pbProgresso.Max := Self.qyDados.RecordCount;
            while not Self.qyDados.Eof do
            begin
               Self.pbProgresso.Position := Self.qyDados.RecNo;
               //se pode registrar 
               if qyDados.FieldByName('is_registrar').AsInteger = 1 then
               begin
                  try
                     registraCertificadoEvento(
                        qyDados.FieldByName('CD_EVENTO').AsInteger,
                        qyDados.FieldByName('CD_PESSOA').AsInteger);
                     with TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]) do
                     begin
                        if CodAtividade > 0 then
                        begin
                           Self.getDadosMatricula(Self.qyDados.FieldByName('CD_PESSOA').AsInteger);
                           if not Self.registraAtividade(
                                 Self.qyDados.FieldByName('CD_PESSOA').AsInteger,
                                 Self.qyMatriculaAluno.FieldByName('anosemestre').AsInteger,
                                 Self.qyMatriculaAluno.FieldByName('serie').AsInteger,
                                 CodAtividade, Self.qyDados.FieldByName('nr_horas_evento').AsInteger,
                                 Self.qyMatriculaAluno.FieldByName('curso').AsString,
                                 DescricaoEvento, Local, DataEvento, DataFim) then
                           begin
                              Exit;
                           end;
                        end;
                     end;
                  except
                     on E: Exception do
                     begin
                        bSucesso := False;
                        Mensagem(E.Message, Application.Title, MB_ICONERROR);
                        Break;
                     end;
                  end;
               end;
               Self.qyDados.Next;
            end;
            atualizaPagina;
            if bSucesso then
               Mensagem(MSG_SUCESSO, Application.Title, MB_ICONINFORMATION);
         end;
      end;
   finally
      Self.sbStatus.Panels[2].Text := '';
      Self.filtra;
      Self.pbProgresso.Position := 0;
      Self.ledPagina.Text := IntToStr(TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]).PaginaAtual);
   end;
end;


function TfCertificados.registraAtividade(const AICodPessoa, AIAnoSem, AIEtapa,
  AICodAtividade, AIHoras: integer; const ASCodCurso, ASAtividade,
  ASLocal: string; const ADtInicio, ADtTermino: TDateTime): boolean;
begin
   if( Self.verificaSeAindaTemHorasLivres(AICodPessoa,AIAnoSem,AICodAtividade) )then
   begin
      Result := True;
      Self.qyInsereAtividade.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
      Self.qyInsereAtividade.ParamByName('nr_anosem').AsInteger := AIAnoSem;
      Self.qyInsereAtividade.ParamByName('nr_etapa').AsInteger := AIEtapa;
      Self.qyInsereAtividade.ParamByName('cd_ge_atividade').AsInteger := AICodAtividade;
      Self.qyInsereAtividade.ParamByName('nr_horas').AsInteger := AIHoras;
      Self.qyInsereAtividade.ParamByName('cd_curso').AsString := ASCodCurso;
      Self.qyInsereAtividade.ParamByName('ds_atividade').AsString := ASAtividade;
      Self.qyInsereAtividade.ParamByName('ds_local').AsString := ASLocal;
      Self.qyInsereAtividade.ParamByName('dt_inicio').AsDateTime := ADtInicio;
      Self.qyInsereAtividade.ParamByName('dt_termino').AsDateTime := ADtTermino;
      Self.qyInsereAtividade.ParamByName('nr_horas_original').AsInteger := AIHoras;
      Self.qyInsereAtividade.ParamByName('cd_situacao').AsInteger := 1;
      try
         Self.qyInsereAtividade.ExecSQL;
      except
         on E: Exception do
         begin
            Result := false;
            Mensagem(E.Message, Application.Title, MB_ICONERROR);
         end;
      end;
   end
   else
   begin
      Result:=true;
   end;

end;

function TfCertificados.verificaSeAindaTemHorasLivres(const AICodigoPessoa,
  AIAnoSem, AICodigoAtivide : Integer): boolean;
begin
   Self.FQyHorasDeferidasAluno := DM.newROQuery;
   try
      with Self.FQyHorasDeferidasAluno do
      begin
         SQL.Text := SQL_GET_HORAS_DEFERIDAS;
         ParamCheck := true;
         ParamByName('cd_pessoa').asInteger := AICodigoPessoa;
         ParamByName('nr_anosemestre').asInteger := AIAnoSem;
         ParamByName('cd_ge_atividade').asInteger := AICodigoAtivide;
         try
            Open();
         except
            on E: Exception do
            begin
               Result:=false;
               raise EUMTAMCertificadoErro.Create(StringReplace(MSG_ERRO_HORAS_DEFERIDAS, '$erro$', E.Message, []));
            end;
         end;

         if not EOF then
         begin
            if( FieldByName('total').AsInteger <= FieldByName('limite').AsInteger) then
            begin
                Result := true;
                exit;
            end;
         end;

      end;
   finally
         FreeAndNil(Self.FQyHorasDeferidasAluno);
   end;
   
   Result :=false;
end;

procedure TfCertificados.sair(Sender: TObject);
begin
   Self.Close;
end;

procedure TfCertificados.selecionaEvento(Sender: TObject);
begin
   Self.ledPessoa.Enabled := True;
   Self.bnPessoa.Enabled := True;
   Self.filtra;
end;

procedure TfCertificados.selecionaLivro(Sender: TObject);
begin
   Self.ledPagina.Enabled := True;
   Self.bnRegistrar.Enabled := True;
   Self.ledPagina.Text :=
      IntToStr(TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]).PaginaAtual);
   Self.sbStatus.Panels[0].Text := 'Livro ' + TUMTAMCertificadoLivro(Self.cbLivro.Items.Objects[Self.cbLivro.ItemIndex]).Nome;
end;

procedure TfCertificados.selecionaPessoa(Sender: TObject);
begin
   Self.ledPessoa.Text :=
      TfBuscaPessoas.getPessoa(Self,
         TUMEvento(Self.cbEvento.Items.Objects[Self.cbEvento.ItemIndex]).CodigoEvento,
         Self.cbEvento.Items.ValueFromIndex[self.cbEvento.ItemIndex]);
   Self.filtra;
end;


end.
