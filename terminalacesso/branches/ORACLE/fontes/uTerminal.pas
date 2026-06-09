{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
unit uTerminal;

interface

uses
   General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Windows,
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, jpeg, ExtCtrls, DB, ZConnection, DateUtils, MPlayer, uCMD5,
   MMSystem, DBTables, uFSelecionarPessoa, ZDbcIntfs, UZDbcFuncs;

const
   MSG_NONE = '';
   MSG_ENT_ATRASADA     = 'O sistema detectou entrada atrasada!';
   MSG_SAIDA_ANTECIPADA = 'O sistema detectou saída antecipada!';
   MSG_ENT_MATUTINA     = 'Bom dia!';
   MSG_ENT_VESPERTINA   = 'Boa tarde!';
   MSG_ENT_NOTURNA      = 'Boa noite!';
   MSG_ESPERA           = 'Operação efetuada. Aguarde %s segundos.';
   MSG_ACESSO_NEGADO    = 'Acesso negado!';
   MSG_SAIDA_NORMAL     = 'Volte logo!';    
   MSG_NAO_CADASTRADO   = 'Aluno não cadastrado!';
   MSG_SEM_MATRICULA    = 'Aluno sem matrícula ou com restrições!';

type
   TUMTATipoAcao = (taNone, taEntradaAtrasada, taSaidaAntecipada, taEntradaMatutina,
      taEntradaVespertina, taEntradaNoturna, taMensagemEspera, taAcessoNegado,
      taSaidaNormal, taAlunoSemCadastro, taAlunoSemMatricula);

   TfrmTerminal = class(TForm)
      bvSep1: TBevel;
      pnFundoImagens: TPanel;
      bvSep2: TBevel;
      pnDados: TPanel;
      imInstituicao: TImage;
      imUniMestre: TImage;
      bvSep5: TBevel;
      bvSep6: TBevel;
      pnEntrada: TPanel;
      pnFotoAluno: TPanel;
      bvSep3: TBevel;
      lblTitNome: TLabel;
      lblTitTurma: TLabel;
      pnUltimoAcesso: TPanel;
      txtCodigo: TEdit;
      lblTitEntCodigo: TLabel;
      lblNome: TLabel;
      lblTurmas: TLabel;
      lblTitCodigo: TLabel;
      lblCodigo: TLabel;
      pnMensagem: TPanel;
      bvSep4: TBevel;
      imFotoAluno: TImage;
      Bevel1: TBevel;
      pnHoraAtual: TPanel;
      tmIntervalo: TTimer;
      qyGetHorarios: TUMZQuery;
      qyInsOcorrencia: TUMZQuery;
      qyGetConfig: TUMZQuery;
      qyGetEntrada: TUMZQuery;
      qyGetTurmaMatricula: TUMZQuery;
      qyGetConfigcd_configuracao: TIntegerField;
      qyGetConfigtx_ajuda: TMemoField;
      qyGetConfigcor_msg_terminal: TStringField;
      qyGetConfigds_msg_terminal: TStringField;
      qyGetConfigcd_tipo_ocorrencia: TIntegerField;
      qyGetConfigtx_msg_ocorrencia: TMemoField;
      qyGetConfigtx_sql_ocorrencia: TMemoField;
      qyGetConfigme_som_terminal: TBlobField;
      qyGetConfigsn_envia_ocorrencia: TSmallintField;
      qyGetConfigsn_permite_ocorrencia: TSmallintField;
    qryVerificaNrEntradas: TUMZQuery;
    qryBuscaUltimaEntrada: TUMZQuery;
    qryBuscaHorarioDaTurma: TUMZQuery;
    cpfTxt: TEdit;
      procedure FormCreate(Sender: TObject);
      procedure txtCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure tmIntervaloTimer(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   strict private
      Fecha: Boolean;
      dtData: TDateTime;
      Bloqueado: Boolean;
      Contador: Integer;
      FUMParametroGerarSaidasComoEntradas: Boolean;
      FUMParametroPermitirVariasEntradas: Boolean;

      function IsEntradaAtrasada(const ASCodAluno, ASAnoSemestre,LSTurma: string): boolean;
      function FuncaoPegarCdPessoa(cpf: string): string;
      function IsEntradaAtrasadaEspecifica(const ASCodAluno, ASAnoSemestre,LSTurma: string; LITempoTol: integer): boolean;
      function IsEntradaAtrasadaDataUnica(const ASCodAluno, ASAnoSemestre,LSTurma: string; dataAtual:TDateTime): boolean;
      function IsSaidaAntecipada(const ASCodAluno, ASAnoSemestre: string): boolean;
      function SubstituiVariaveisMsg(const ASMsgOcorrencia, ASCodAluno,
         ASAnoSemestre, ASSQLConsulta: string; const AICodTipo: integer): string;
      function RegistraOcorrencia(const AICodTipo, AICodProfessor: integer;
         const ASCodAluno, ASMsgOcorrencia, ASCodTurma, ASAnoSemestre,
         ASSQLConsulta: string): boolean;
      function GetTurmaMatricula(const ASCodPessoa: string;
         var ASAnoSemestre: string): string;
      procedure EmiteAvisoSonoro(AStremSom: TStream);
      procedure ExecutaProcessoPosAcao(const AUMTATipoAcao: TUMTATipoAcao;
         const AICodProfessor: integer; const ASCodAluno, ASCodTurma,
         ASAnoSemestre: string);
   private
      FPontoAcessoId: Cardinal;
      procedure MostraHora();
      procedure MostraMensagem(sMsg: string; iCor: TColor);
      procedure BloqueiaInput(bStatus: Boolean);
      procedure VerificaEntradaSaida(const ASCodAluno: string; const ABEspecial: boolean = false);
      procedure InsereAcesso(sCodPessoa: string; bSaida: Boolean; bFinalizado: Boolean; bEspecial: Boolean = False; dtData: TDateTime = 0; iCdEntrada: LongInt = 0; const ASAnoSemestre: string = '');
      procedure ChecaSaida();
      procedure BuscaPessoa();
      procedure UltimoAcesso(sCodPessoa: string; var dtData: TDateTime);
      procedure GeraFaltaTurma(slDados: TStringList);
      procedure FindPontoAcesso;
   public
      procedure GeraSaidaTodos(bNaoHoje: Boolean = False);
      procedure GeraFaltasFinal(slAnoSem: TStringList = nil);
      procedure GeraSaida(sCodPessoa: string; dtHoraEntrada: TDateTime; sCodEntrada: string; bEspecial: Boolean = False; dtSaida: TDateTime = 0; const ASAnoSemestre: string = '');
      procedure GeraEntrada(sCod: string; bEspecial: Boolean = False; dtEntrada: TDateTime = 0; const ASAnoSemestre: string = '');
      procedure AlunoInput();
      function AlunoCadastrado(var sCod: string): Boolean;
      function CarregaDadosAluno(sCod: string): Boolean;
      function CarregaDadosEspecial(sCod: string): Boolean;

      property ParametroGerarSaidasComoEntradas: Boolean read FUMParametroGerarSaidasComoEntradas;
      property ParametroPermitirVariasEntradas: Boolean read FUMParametroPermitirVariasEntradas;
   end;

var
  frmTerminal: TfrmTerminal;

implementation

uses uDM, uProgresso, uFechamento, uLoginManager, uUsuario;

{$R *.dfm}

procedure TfrmTerminal.FindPontoAcesso;
const
   SSQLSelectCatracaId = ''
      + 'SELECT '
      + '	CD_CATRACA '
      + 'FROM '
      + '	TA_CATRACA '
      + 'WHERE '
      + '	DS_IP = ? ';
var
   IP: AnsiString;
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   FPontoAcessoId := 0;
   IP := GetIPAddress;
   Statement := PrepareStatement(SSQLSelectCatracaId);
   try
      Statement.SetString(1, IP);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
            FPontoAcessoId := ResultSet.GetInt(1);
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Statement.Close;
      Statement := nil;
   end;
end;

procedure TfrmTerminal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyGetConfig.Close;
  if not Fecha then
  begin
    Action := caNone;
    Fecha := True;
  end
  else
  begin
    setBloqueio(False);
    Action := caFree;
  end;
end;

procedure TfrmTerminal.FormShow(Sender: TObject);
var
  sImagem: string;
begin
  setBloqueio(True);
  Self.Width := Screen.Width;
  Self.Height := Screen.Height;
  Bloqueado := False;

  //carrega imagem
  sImagem := iniWMestre.ReadString('TerminalAcesso', 'Imagem', '');
  if Length(sImagem) > 0 then begin
    if FileExists(sImagem) then begin
      imInstituicao.Picture.LoadFromFile(sImagem);
    end
    else begin
      imInstituicao.Picture.Free();
    end;
  end;
end;

procedure TfrmTerminal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if getTeclaEstado(VK_LMENU) And (Key = VK_F4) then begin
    Fecha := False;
  end;
  
  if Key = VK_ESCAPE then begin
    ChecaSaida();
  end;
end;

procedure TfrmTerminal.MostraHora();
begin
  pnHoraAtual.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss   ', DM.NowFromDB);
end;

procedure TfrmTerminal.tmIntervaloTimer(Sender: TObject);
begin
  MostraHora();
  if Contador >= 0 then
  begin
    Inc(Contador);
    if Contador >= 7 then
    begin
      pnDados.Visible := False;
      pnMensagem.Visible := False;
      pnUltimoAcesso.Visible := False;
      Contador := -1;
    end;
  end;

end;

procedure TfrmTerminal.AlunoInput();
const
   SSQLSelectCartoes = ''
      + 'SELECT '
      + '	CD_PESSOA, '
      + '	SN_ATIVO, '
      + '	DT_VALIDADE, '
      + '	CURRENT_TIMESTAMP '
      + 'FROM '
      + '	TA_CATRACA_IDENTIFICACAO '
      + 'WHERE '
      + '	NR_IDENTIFICACAO = ? OR '
      + '   CAST(NR_IDENTIFICACAO AS UNSIGNED) = ?'
      + ' ORDER BY SN_ATIVO DESC ';
var
   PessoaId, CartaoId: AnsiString;
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   Found, AllowAccess: Boolean;
begin
   CartaoId := SoNumeros(txtCodigo.Text);

   if CartaoId = '9999999999' then begin
      BuscaPessoa;
      Exit;
   end;

   BloqueiaInput(True);

   Found := False;
   AllowAccess := False;
   Statement := PrepareStatement(SSQLSelectCartoes);
   try
      Statement.SetString(1, CartaoId);
      Statement.SetString(2, CartaoId);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         Found := ResultSet.Next;
         
         if Found then
         begin
            PessoaId := ResultSet.GetString(1);
            AllowAccess :=
               (ResultSet.GetInt(2) = 1) and (
                  ResultSet.IsNull(3) or
                  (ResultSet.GetTimestamp(3) > ResultSet.GetTimestamp(4))
               );
         end;
         
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Statement.Close;
      Statement := nil;
   end;

   if Found and (not AllowAccess) then
   begin
      ExecutaProcessoPosAcao(taAcessoNegado,
         DM.qyUsuariosNomeCD_PESSOA.AsInteger, PessoaId, '', '');
      pnDados.Visible := False;
      BloqueiaInput(False);
      Exit;
   end;

   if not Found then
      PessoaId := CartaoId;

   if PessoaId = '' then
   begin
      BloqueiaInput(False);
      Exit;
   end;

   if not AlunoCadastrado(PessoaId) then
   begin
      ExecutaProcessoPosAcao(taAlunoSemCadastro,
         DM.qyUsuariosNomeCD_PESSOA.AsInteger, PessoaId, '', '');
      pnDados.Visible := False;
      BloqueiaInput(False);
      Exit;
   end;

   if not CarregaDadosAluno(PessoaId) then
   begin
      if not CarregaDadosEspecial(PessoaId) then
      begin
         ExecutaProcessoPosAcao(taAlunoSemMatricula,
            DM.qyUsuariosNomeCD_PESSOA.AsInteger, PessoaId, '', '');
         pnDados.Visible := False;
         BloqueiaInput(False);
         Exit;
      end;
      VerificaEntradaSaida(PessoaId, True);
      BloqueiaInput(False);
      Exit;
   end;

   VerificaEntradaSaida(PessoaId, False);
   BloqueiaInput(False);
end;

procedure TfrmTerminal.BloqueiaInput(bStatus: Boolean);
begin
  Bloqueado := bStatus;
  pnEntrada.Enabled := not bStatus;

  if not bStatus then
  begin
    txtCodigo.Text := '';
    cpfTxt.Text := '';
    txtCodigo.SetFocus();
    Contador := 0;
  end
  else
  begin
    Contador := -1;
  end;
end;

function TfrmTerminal.AlunoCadastrado(var sCod: string): Boolean;
var
  bRet: Boolean;
begin
   with DM.qyAux do
   begin
      Close();
      SQL.Text := 'SELECT COUNT(*) as conta FROM pessoas WHERE cd_pessoa = :cdpessoa';
      if ( DM.db.Protocol = DB_PROTOCOLO_ORACLE ) then
         SQL.Add( ' AND ROWNUM = 1 ' )
      else
         SQL.Add( ' LIMIT 1 ' );

      ParamByName('cdpessoa').Value := StrToInt(sCod);
      Open();
      bRet := StrToBool(FieldByName('conta').AsString);
      Close();
   end;

   //verifica codigo de matricula
   if not (bRet) then begin
     with DM.qyAux do
     begin
        Close();
        ParamCheck := True;
        Params.Clear();
        SQL.Text := 'SELECT DISTINCT codigoaluno FROM matriculas WHERE ((cd_matricula = :cd_matricula_semzeros) OR (cd_matricula = :cdmatricula))';
        ParamByName('cdmatricula').AsString := sCod;
        ParamByName('cd_matricula_semzeros').AsString := IntToStr(StrToInt(sCod));
        Open();

        if not DM.qyAux.Eof then begin
          sCod := FieldByName('codigoaluno').AsString;
          bRet := True;
        end;
        Close();
     end;
   end;
   Result := bRet;
end;

function TfrmTerminal.CarregaDadosEspecial(sCod: string): Boolean;
var
   sAux: string;
   Stream: TStream;
   JPEGImg: TJPEGImage;
begin
   with DM.qyTerminal do
   begin
      Close();
      //cria SQL de consulta
      SQL.Clear();
      SQL.Add(
      'SELECT                                                     '+
      '   prof.cd_pessoa, prof.sn_funcionario,                    '+
      '   prof.sn_professor, p.im_pessoa, p.nm_pessoa             '+
      'FROM                                                       '+
      '   professores prof                                        '+
      '   INNER JOIN pessoas p ON (prof.cd_pessoa = p.cd_pessoa)  '+ 
      'WHERE                                                      '+
      '   prof.cd_pessoa = :cdpessoa                              '
      );
      if ( DM.db.Protocol = DB_PROTOCOLO_ORACLE ) then
         SQL.Add( ' AND ROWNUM = 1 ' )
      else
         SQL.Add( ' LIMIT 1 ' );
      //passa parametros
      ParamByName('cdpessoa').Value := StrToInt(sCod);
      Open();

      if IsEmpty then
      begin
         Result := False;
      end
      else
      begin
        First();
        sAux := FillString(FieldByName('cd_pessoa').AsString, alRight, '0', 7, False);
        lblCodigo.Caption := Copy(sAux, 1, Length(sAux)-1) + '-' + Copy(sAux, Length(sAux), 1);

        lblNome.Caption := FieldByName('nm_pessoa').AsString;
        //turmas

        lblTitTurma.Caption := '';

        if FieldByName('sn_funcionario').AsString = 'S' then begin
          lblTurmas.Caption := 'Funcionário';
        end 
        else begin
          lblTurmas.Caption := 'Professor';
        end;

      if not FieldByName('im_pessoa').IsNull then
      begin
         Stream := CreateBlobStream(FieldByName('im_pessoa'), bmRead);
         try
            try
               imFotoAluno.Picture.Assign(FieldByName('im_pessoa'));
            except
               on E: EInvalidGraphic do
                  try
                     JPEGImg := TJPEGImage.Create;
                     try
                        JPEGImg.LoadFromStream(Stream);
                        imFotoAluno.Picture.Assign(JPEGImg);
                     finally
                        JPEGImg.Free;
                     end;
                  except
                     on E: EInvalidGraphic do
                        imFotoAluno.Picture := nil;
                  end;
            end;
         finally
            Stream.Free;
         end;
      end
      else
         imFotoAluno.Picture := nil;
         
        pnDados.Visible := True;
        Result := True;
      end;
      Close();
   end;
end;

function TfrmTerminal.CarregaDadosAluno(sCod: string): Boolean;
var
   sAux: string;
   Stream: TStream;
   JPEGImg: TJPEGImage;
begin
   with DM.qyTerminal do
   begin
      Close();
      //cria SQL de consulta
      SQL.Clear();
      SQL.Add(
      'SELECT'+
      '   m.codigoaluno, m.curso, m.turma, m.anosemestre,       '+
      '   p.im_pessoa, p.nm_pessoa                              '+
      'FROM                                                     '+
      '   matriculas m                                          '+
      '   INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) '+
      '   INNER JOIN turmas t ON (t.codigo = m.turma AND t.anosemestre = m.anosemestre AND t.curso = m.curso) '+
      '   INNER JOIN cursos_coligadas c ON (c.CD_CURSO = t.curso AND c.CD_COLIGADA = t.cd_coligada AND c.SN_ATIVO = 1) '+
      'WHERE                                                    '+
      '   m.codigoaluno = :cdpessoa                             '
      );
      sAux := DM.getParametro('ta_condicao_acesso');
      if (Length(sAux) > 0) then
      begin
        SQL.Add('AND (' + sAux + ') ');
      end;
      SQL.Add(
      'ORDER BY                                                 '+
      '   m.anosemestre DESC                                    '
      );

      //passa parametros
      ParamByName('cdpessoa').AsString := sCod;

      try
        Open();
      except
        Mensagem('Filtro de Condição de Acesso Inválido');
        Result := False;
        Exit;
      end;

      if IsEmpty then
      begin
         Result := False;
      end
      else
      begin
        First();
        sAux := FillString(FieldByName('codigoaluno').AsString, alRight, '0', 7, False);
        lblCodigo.Caption := Copy(sAux, 1, Length(sAux)-1) + '-' + Copy(sAux, Length(sAux), 1);

        lblNome.Caption := FieldByName('nm_pessoa').AsString;
        //turmas
        lblTitTurma.Caption := 'Turmas';
        lblTurmas.Caption := '';
        while not Eof do
        begin
          sAux := Copy(FieldByName('anosemestre').AsString, 1, 4) + '/' + Copy(FieldByName('anosemestre').AsString, 5, 1);
          lblTurmas.Caption := lblTurmas.Caption + Format('%s - %s (%s)', [FieldByName('turma').AsString, FieldByName('curso').AsString, sAux]) + #13;
          Next();
        end;

      if not FieldByName('im_pessoa').IsNull then
      begin
         Stream := CreateBlobStream(FieldByName('im_pessoa'), bmRead);
         try
            try
               imFotoAluno.Picture.Assign(FieldByName('im_pessoa'));
            except
               on E: EInvalidGraphic do
                  try
                     JPEGImg := TJPEGImage.Create;
                     try
                        JPEGImg.LoadFromStream(Stream);
                        imFotoAluno.Picture.Assign(JPEGImg);
                     finally
                        JPEGImg.Free;
                     end;
                  except
                     on E: EInvalidGraphic do
                        imFotoAluno.Picture := nil;
                  end;
            end;
         finally
            Stream.Free;
         end;
      end
      else
         imFotoAluno.Picture := nil;

        pnDados.Visible := True;
        Result := True;
      end;
      Close();
   end;

end;

procedure TfrmTerminal.MostraMensagem(sMsg: string; iCor: TColor);
begin
  pnMensagem.Caption := sMsg;
  pnMensagem.Font.Color := iCor;
  pnMensagem.Visible := True;
  Contador := 0;
end;

function TfrmTerminal.RegistraOcorrencia(const AICodTipo,
  AICodProfessor: integer; const ASCodAluno, ASMsgOcorrencia, ASCodTurma,
  ASAnoSemestre, ASSQLConsulta: string): boolean;
var
   LSMsgOcorrencia: string;
begin
   Result := true;
   LSMsgOcorrencia := SubstituiVariaveisMsg(ASMsgOcorrencia, ASCodAluno, ASAnoSemestre, ASSQLConsulta, AICodTipo);
   qyInsOcorrencia.ParamByName('cd_tipo').AsInteger := AICodTipo;
   qyInsOcorrencia.ParamByName('cd_pessoa').AsString := ASCodAluno;
   qyInsOcorrencia.ParamByName('ds_ocorrencia').AsString := LSMsgOcorrencia;
   qyInsOcorrencia.ParamByName('turmamat').AsString := ASCodTurma;
   qyInsOcorrencia.ParamByName('nr_anosemestre').AsString := ASAnoSemestre;
   qyInsOcorrencia.ParamByName('cd_professor').AsInteger := AICodProfessor;
   try
      qyInsOcorrencia.ExecSQL;
   except
      on E: Exception do
         Result := false;
   end;
end;

{ **
   Substituí as variáveis definidas na mensagem de envio de ocorrências ONLINE.
   As veriáveis são delimitadas pelo abre chaves e fecha chaves. 
}
function TfrmTerminal.SubstituiVariaveisMsg(const ASMsgOcorrencia, ASCodAluno,
  ASAnoSemestre, ASSQLConsulta: string; const AICodTipo: integer): string;
var
   LInd: integer;
   LFCampo: TField;
   LQyConsulta: TUMZQuery;
begin
   LQyConsulta := TUMZQuery.Create(Self);
   try
      LQyConsulta.Connection := DM.db;
      LQyConsulta.ParamCheck := true;
      LQyConsulta.SQL.Text := ASSQLConsulta;
      LQyConsulta.ParamByName('anosemestre').AsString := ASAnoSemestre;
      LQyConsulta.ParamByName('codigoaluno').AsString := ASCodAluno;
      LQyConsulta.ParamByName('cd_tipo').AsInteger := AICodTipo;
      try
         LQyConsulta.Open;
         if not LQyConsulta.IsEmpty then
         begin
            Result := ASMsgOcorrencia;
            for LInd := 0 to LQyConsulta.FieldCount - 1 do
            begin
               LFCampo := LQyConsulta.Fields[LInd];
               try
                  Result := StringReplace(Result, '{' + LFCampo.FieldName + '}', LFCampo.AsString, [rfReplaceAll]);
               finally
                  LFCampo := nil;
               end;
            end;
         end;
      except
         on Exception do raise;
      end;
   finally
      LQyConsulta.Close;
      FreeAndNil(LQyConsulta);
   end;
end;

procedure TfrmTerminal.VerificaEntradaSaida(const ASCodAluno: string;
   const ABEspecial: boolean = false);
var
  LIHora, LITempoBloq: integer;
  LBSaida: boolean;
  LDtUltimo, LDtEspera: TDateTime;
  LSCodEntrada, LSAnoSemestre, LSTurma, sSituacoes: string;
  LUMTATipoAcao: TUMTATipoAcao;
  LWAno, LWMes, LWDia: Word;
begin
   LUMTATipoAcao := taNone;
   // verifica se a data já foi armazenada
   if dtData = 0 then dtData := DM.NowFromDB;
   // decodifica a data atual
   DecodeDate(dtData, LWAno, LWMes, LWDia);
   LBSaida := false;
   
   // Seta as situações
   sSituacoes := '';
   sSituacoes := DM.getParametro('ta_situacoes_matricula_acesso');

   if Length(sSituacoes) = 0 then
   begin
      sSituacoes := '(1,2)';
   end;
   
   qyGetEntrada.SQL.Text := StringReplace(qyGetEntrada.SQL.Text, ':situacoes', sSituacoes, [rfReplaceAll]);

   qyGetEntrada.ParamByName('cd_pessoa').AsString := ASCodAluno;
   qyGetEntrada.Open;
   
   if qyGetEntrada.IsEmpty then
      LSTurma := GetTurmaMatricula(ASCodAluno, LSAnoSemestre)
   else
   begin
      LSTurma := qyGetEntrada.FieldByName('turma').AsString;
      LSAnoSemestre := qyGetEntrada.FieldByName('nr_anosemestre').AsString;
   end;
   try
      // verifica a data e hora do último acesso 
      UltimoAcesso(ASCodAluno, LDtEspera);
      try
         // define o tempo de bloqueio em segundos
         LITempoBloq := StrToInt(DM.getParametro('ta_tempo_espera'));
      except
         on E: EConvertError do LITempoBloq := 15;
      end;
      if LITempoBloq > 0 then
      begin
         // verifica se a data e hora do último acesso, somado ao tempo de espera,
         // é superior a data e hora atuais ....
         if DataSoma(LDtEspera, LITempoBloq, dpSegundo) > DM.NowFromDB then
            // e define a ação como bloqueio
            LUMTATipoAcao := taMensagemEspera;
      end;
      // se não colocou em modo de espera...
      if LUMTATipoAcao <> taMensagemEspera then
      begin

         if not qyGetEntrada.IsEmpty then
         begin

            while not qyGetEntrada.Eof do
            begin
            
               LBSaida := not qyGetEntrada.FieldByName('dt_saida').IsNull;

               if (not LBSaida) and (not ParametroGerarSaidasComoEntradas) then
               begin
                  LDtUltimo := qyGetEntrada.FieldByName('dt_entrada').AsDateTime;
                  LSAnoSemestre := qyGetEntrada.FieldByName('nr_anosemestre').AsString;
                  LSCodEntrada := qyGetEntrada.FieldByName('codigo').AsString;

                  GeraSaida(ASCodAluno, LDtUltimo, LSCodEntrada, ABEspecial, 0, LSAnoSemestre);

                  if LUMTATipoAcao = taNone then
                     LUMTATipoAcao := taSaidaNormal;

                  if IsSaidaAntecipada(ASCodAluno, LSAnoSemestre) then
                     LUMTATipoAcao := taSaidaAntecipada;
               end;

               qyGetEntrada.Next;
            end;

         end;

         if qyGetEntrada.IsEmpty or ParametroGerarSaidasComoEntradas then
         begin
            // é uma entrada...
            GeraEntrada(ASCodAluno, ABEspecial, 0, LSAnoSemestre);
            // verifica se é uma entrada atrasada
            if IsEntradaAtrasada(ASCodAluno, LSAnoSemestre, LSTurma) then
               LUMTATipoAcao := taEntradaAtrasada
            else
            begin
               // verifica o período do dia para saber qual mensagem deverá emitir
               LIHora := StrToInt(FormatDateTime('hh', DM.NowFromDB));
               if LIHora < 13 then
                  LUMTATipoAcao := taEntradaMatutina
               else if LIHora > 18 then
                  LUMTATipoAcao := taEntradaNoturna
               else
                  LUMTATipoAcao := taEntradaVespertina;
            end;
         end;

         if LDtEspera > 0 then
         begin
            pnUltimoAcesso.Caption := '   Último Acesso: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', LDtEspera);
            pnUltimoAcesso.Visible := true;
         end
         else
            pnUltimoAcesso.Visible := false;
      end;
      // executa o processo pós-ação
      ExecutaProcessoPosAcao(
         LUMTATipoAcao, DM.qyUsuariosNomecd_pessoa.AsInteger,
         ASCodAluno, LSTurma, LSAnoSemestre);
   finally
      qyGetEntrada.Close;
   end;
end;

procedure TfrmTerminal.GeraEntrada(sCod: string; bEspecial: Boolean = False; dtEntrada: TDateTime = 0; const ASAnoSemestre: string = '');
var
   LITipoAcao: integer;
   LSMensagem, codTurma: string;
   anoSemInterno: String;
begin
  InsereAcesso(sCod, False, False, bEspecial, dtEntrada, 0, ASAnoSemestre);

  if IsEntradaAtrasadaDataUnica(sCod, ASAnoSemestre, '', dtEntrada) then
  begin
      qyGetConfig.Locate('cd_configuracao', taEntradaAtrasada, []);

      if (qyGetConfig.FieldByName('sn_permite_ocorrencia').AsInteger = 1) and
         (qyGetConfig.FieldByName('sn_envia_ocorrencia').AsInteger = 1) then
      begin
         anoSemInterno := ASAnoSemestre;
         codTurma := GetTurmaMatricula(sCod, anoSemInterno);

         RegistraOcorrencia(
            qyGetConfig.FieldByName('cd_tipo_ocorrencia').AsInteger,
            0, sCod, qyGetConfig.FieldByName('tx_msg_ocorrencia').AsString,
            codTurma, anoSemInterno, qyGetConfig.FieldByName('tx_sql_ocorrencia').AsString);
      end;
  end;
end;

procedure TfrmTerminal.GeraSaida(sCodPessoa: string; dtHoraEntrada: TDateTime; sCodEntrada: string; bEspecial: Boolean = False; dtSaida: TDateTime = 0; const ASAnoSemestre: string = '');
const
   SSQLCallGerarSaida = 'CALL TA_GERAR_SAIDA(?, ?, ?, ?, ?, ?, ?, ?)';
var
   Statement: IZPreparedStatement;
begin
   if dtSaida = 0 then
      dtSaida := DM.NowFromDB;

   if ParametroGerarSaidasComoEntradas then
   begin
      GeraEntrada(sCodPessoa, bEspecial, dtSaida, ASAnoSemestre);
      Exit;
   end;

   Statement := PrepareStatement(SSQLCallGerarSaida);
   try
      Statement.SetString(1, sCodPessoa);
      Statement.SetTimestamp(2, dtHoraEntrada);
      Statement.SetString(3, sCodEntrada);
      Statement.SetInt(4, Ord(bEspecial));
      Statement.SetTimestamp(5, dtSaida);
      Statement.SetString(6, ASAnoSemestre);
      Statement.SetInt(7, 0);
      Statement.SetInt(8, FPontoAcessoId);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
      Statement := nil;
   end;
end;

procedure TfrmTerminal.InsereAcesso(sCodPessoa: string; bSaida: Boolean; bFinalizado: Boolean;
   bEspecial: Boolean = False; dtData: TDateTime = 0; iCdEntrada: LongInt = 0; const ASAnoSemestre: string = '');
const
   SSQLInsertAcesso = ''
      + 'INSERT INTO DIARIO_TERMINAL_ACESSOS ( '
      + '	CD_PESSOA, '
      + '	NR_ANOSEMESTRE, '
      + '	DT_ENTRADA, '
      + '	DT_SAIDA, '
      + '	SN_ESPECIAL, '
      + '	SN_FINALIZADO, '
      + '	CD_CATRACA_ENTRADA '
      + ') VALUES (?, ?, ?, ?, ?, ?, ?) ';

   SSQLSelectUltimoAcesso = ''
      + 'SELECT '
      + '	MAX(CODIGO) '
      + 'FROM '
      + '	DIARIO_TERMINAL_ACESSOS '
      + 'WHERE '
      + '	CD_PESSOA = ? ';

   SSQLUpdateAcesso = ''
      + 'UPDATE '
      + '	DIARIO_TERMINAL_ACESSOS '
      + 'SET '
      + '	DT_SAIDA = ?, '
      + '	SN_FINALIZADO = ?, '
      + '	CD_CATRACA_SAIDA = ? '
      + 'WHERE '
      + '	CODIGO = ? ';

   SSQLProcAcesso = ''
      + 'CALL TA_INSERE_ACESSO(?, ?, ?, ?, ?, ?, ?, ?, ?)';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
  qyExecuteProcedure: TUMZQuery;
  ultimoCodigo: Integer;
begin
   if bEspecial then
   begin
      if not bSaida then
      begin
         Statement := PrepareStatement(SSQLInsertAcesso);
         try
            Statement.SetString(1, sCodPessoa);
            Statement.SetString(2, DM.GetAnoSemestreAsStr(Now));
            Statement.SetTimestamp(3, dtData);
            Statement.SetNull(4, stUnknown);
            Statement.SetInt(5, 1);
            Statement.SetInt(6, Ord(bFinalizado));
            Statement.SetNull(7, stUnknown);
            if FPontoAcessoId <> 0 then
               Statement.SetInt(7, FPontoAcessoId);
            Statement.ExecutePrepared;
         finally
            Statement.Close;
            Statement := nil;
         end;

         Exit;
      end;

      Statement := PrepareStatement(SSQLSelectUltimoAcesso);
      try
         Statement.SetString(1, sCodPessoa);
         ResultSet := Statement.ExecuteQueryPrepared;
      finally
         Statement.Close;
         Statement := nil;
      end;

      try
         if ResultSet.Next then
         begin
            Statement := PrepareStatement(SSQLUpdateAcesso);
            try
               Statement.SetTimestamp(1, dtData);
               Statement.SetInt(2, Ord(bFinalizado));
               Statement.SetNull(3, stUnknown);
               if FPontoAcessoId <> 0 then
                  Statement.SetInt(3, FPontoAcessoId);
               Statement.SetInt(4, ResultSet.GetInt(1));
            finally
               Statement.Close;
               Statement := nil;
            end;
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;

      Exit;
   end;

   if dtData = 0 then
      dtData := DM.NowFromDB;

   Statement := PrepareStatement(SSQLProcAcesso);
   try
      Statement.SetString(1, sCodPessoa);
      Statement.SetInt(2, Ord(bSaida));
      Statement.SetInt(3, Ord(bFinalizado));
      Statement.SetInt(4, Ord(bEspecial));
      Statement.SetTimestamp(5, dtData);
      Statement.SetInt(6, iCdEntrada);
      Statement.SetString(7, ASAnoSemestre);
      Statement.SetInt(8, 0);
      Statement.SetInt(9, FPontoAcessoId);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
      Statement := nil;
   end;
end;

{ **
   Este método consulta o cadastro da turma de matrícula do aluno para buscar
   as informações de hora de início das aulas para a turma e a hora atual no
   banco de dados. À hora de início, são somados os minutos de tolerência
   definidos no parâmetro "ta_tempo_tolerancia". A hora de início, somados os
   minutos de tolerência, é comparada a hora atual para verifica se o aluno está
   efetuando uma entrada atrasada. Se sim, o retorno do método será True, caso
   contrário o retorno será False.
}
function TfrmTerminal.IsEntradaAtrasada(const ASCodAluno,
   ASAnoSemestre,LSTurma: string): boolean;
var
   LTHoraAtual, LTHoraInicio, LTHoraFim: TTime;
   LITempoTol: integer;
   LSTempoTol: string;
begin
   Result := false;
   LSTempoTol := Trim(DM.getParametro('ta_tempo_tolerancia'));
   try
      LITempoTol := StrToInt(LSTempoTol);
   except
      on E: EConvertError do LITempoTol := 0;
   end;
   qyGetHorarios.ParamByName('codigoaluno').AsString := ASCodAluno;
   qyGetHorarios.ParamByName('anosemestre').AsString := ASAnoSemestre;
   try
      qyGetHorarios.Open;
      if not qyGetHorarios.IsEmpty then
      begin
         LTHoraAtual := qyGetHorarios.FieldByName('horaatual').AsDateTime;
         LTHoraFim := qyGetHorarios.FieldByName('horafim').AsDateTime;
         LTHoraInicio := qyGetHorarios.FieldByName('horainicio').AsDateTime;
         LTHoraInicio := IncMinute(LTHoraInicio, LITempoTol);
         Result :=
            (TimeOf(LTHoraAtual) > TimeOf(LTHoraInicio)) and
            (TimeOf(LTHoraAtual) < TimeOf(LTHoraFim));
      end;
   finally
      qyGetHorarios.Close;
   end;

   if (result = true) AND (DM.getParametro('ta_checar_atrasados_horarios_aulas') = '1') then
   begin
      result := IsEntradaAtrasadaEspecifica(ASCodAluno,ASAnoSemestre,LSTurma,LITempoTol);
   end;
end;


function TfrmTerminal.FuncaoPegarCdPessoa(cpf: string): string;
var
   qyCdPessoa: TUMZQuery;
begin
   DM.CriarConsulta(qyCdPessoa);
   qyCdPessoa.SQL.Clear();
   qyCdPessoa.SQL.Add( ' SELECT cd_pessoa FROM PESSOAS WHERE DS_CPF = :cpf limit 1' );

   qyCdPessoa.ParamByName('cpf').AsString := cpf;
   qyCdPessoa.Open();

   Result:=   qyCdPessoa.FieldByName('cd_pessoa').AsString;

   qyCdPessoa.Close();
   FreeAndNil(qyCdPessoa);


end;



// Verifica através da turma do estudante se existe algum horario de invervalo e se ele esta voltando do mesmo
function TfrmTerminal.IsEntradaAtrasadaEspecifica(const ASCodAluno,
  ASAnoSemestre, LSTurma: string;LITempoTol : integer): boolean;
var
   hrEntradaAtual :String;
   tempoTotal : String;
begin
   qryVerificaNrEntradas.ParamByName('codigoaluno').AsString := ASCodAluno;
   qryVerificaNrEntradas.ParamByName('anosemestre').AsString := ASAnoSemestre;
   qryVerificaNrEntradas.Open;

   result := true;

   //Se tiver registros no dia verificamos pelo horario da turma se é volta de invervalo
   if(qryVerificaNrEntradas.FieldByName('acesso').AsInteger > 1 ) then
   begin
      qryBuscaUltimaEntrada.ParamByName('codigoaluno').AsString := ASCodAluno;
      qryBuscaUltimaEntrada.ParamByName('anosemestre').AsString := ASAnoSemestre;
      qryBuscaUltimaEntrada.Open;

      hrEntradaAtual := qryBuscaUltimaEntrada.FieldByName('entradaAtual').AsString;


      if(LITempoTol < 10) then
      begin
         tempoTotal := '00:0' + inttostr(LITempoTol);
      end else begin
         tempoTotal := '00:' + inttostr(LITempoTol);
      end;


      qryBuscaHorarioDaTurma.ParamByName('turma').AsString := LSTurma;
      qryBuscaHorarioDaTurma.ParamByName('intevalo').AsString := tempoTotal ;
      qryBuscaHorarioDaTurma.ParamByName('intevaloNegativo').AsString := '-' + tempoTotal ;
      qryBuscaHorarioDaTurma.ParamByName('hrEntrada').AsString :=  hrEntradaAtual;
      qryBuscaHorarioDaTurma.Open;

      //Não tem horarios no intervalo definido pelo cliente, então esta atrasado
      result := (qryBuscaHorarioDaTurma.FieldByName('temHorario').AsInteger = 0);
   end;

   qryBuscaUltimaEntrada.Close;
   qryVerificaNrEntradas.Close;
   qryBuscaHorarioDaTurma.Close;
end;


// Verifica se é atrasadsa a partir de uma data especifica (usado na importação de arquivo)
function TfrmTerminal.IsEntradaAtrasadaDataUnica(const ASCodAluno,
   ASAnoSemestre,LSTurma: string; dataAtual:TDateTime): boolean;
var
   LTHoraAtual, LTHoraInicio, LTHoraFim: TTime;
   LITempoTol: integer;
   LSTempoTol: string;
begin
   Result := false;
   LSTempoTol := Trim(DM.getParametro('ta_tempo_tolerancia'));
   try
      LITempoTol := StrToInt(LSTempoTol);
   except
      on E: EConvertError do LITempoTol := 0;
   end;
   qyGetHorarios.ParamByName('codigoaluno').AsString := ASCodAluno;
   qyGetHorarios.ParamByName('anosemestre').AsString := ASAnoSemestre;
   try
      qyGetHorarios.Open;
      if not qyGetHorarios.IsEmpty then
      begin
         LTHoraFim := qyGetHorarios.FieldByName('horafim').AsDateTime;
         LTHoraInicio := qyGetHorarios.FieldByName('horainicio').AsDateTime;
         LTHoraInicio := IncMinute(LTHoraInicio, LITempoTol);
         Result :=
            (TimeOf(dataAtual) > TimeOf(LTHoraInicio)) and
            (TimeOf(dataAtual) < TimeOf(LTHoraFim));
      end;
   finally
      qyGetHorarios.Close;
   end;
end;


{ **
   Consulta o cadastro da turma de matrícula do aluno no ano/semestre informado
   no parâmetro, para busca a hora de início da aula para a turma e a hora atual
   no banco de dados. As horas são comparadas para verificar se o aluno está
   efetuando uma saída antecipada. O retorno do método é True, caso o aluno
   esteja efetuando uma saída antecipada e False, caso contrário.
}
function TfrmTerminal.IsSaidaAntecipada(const ASCodAluno,
   ASAnoSemestre: string): boolean;
var
   LTHoraAtual, LTHoraFim: TTime;
begin
   Result := false;
   qyGetHorarios.ParamByName('codigoaluno').AsString := ASCodAluno;
   qyGetHorarios.ParamByName('anosemestre').AsString := ASAnoSemestre;
   try
      qyGetHorarios.Open;
      if not qyGetHorarios.IsEmpty then
      begin
         LTHoraFim := qyGetHorarios.FieldByName('horafim').AsDateTime;
         LTHoraAtual := qyGetHorarios.FieldByName('horaatual').AsDateTime;
         Result := TimeOf(LTHoraAtual) < TimeOf(LTHoraFim);
      end;
   finally
      qyGetHorarios.Close;
   end;
end;

procedure TfrmTerminal.ChecaSaida;
begin
   if DM.GetUsuarioLogado <> nil then
   begin
      if DM.GetUsuarioLogado.TemPermissao(10001, npAcesso, False) then begin
         Fecha := True;
         Self.Close();
      end;
  end;
end;

{ **
   Emite um aviso sonoro. Recebe como parâmetro um TBlobStream que contém o som
   a ser emitido. O som é copiado para um TMemoryStream que é tocado pela função
   PlaySound da DLL winmm do Windows.
}
procedure TfrmTerminal.EmiteAvisoSonoro(AStremSom: TStream);
var
   LMemoryStream: TMemoryStream;
begin
   LMemoryStream := TMemoryStream.Create;
   try
      LMemoryStream.CopyFrom(AStremSom, AStremSom.Size);
      PlaySound(LMemoryStream.Memory, 0, SND_SYNC or SND_MEMORY);
   finally
      FreeAndNil(LMemoryStream);
      FreeAndNil(AStremSom);
   end;
end;

{ **
   Este método executa uma série de ações após a execução e uma ação no
   Terminal. As possíveis ações estão definidas na enumeração TUMTATipoAcao, e
   deve ser passado como primeiro parâmetro do método o tipo de ação que deseja
   efetuar.
   Além disso, o método recebe o código do professor (pessoa logada no
   sistema), o código do aluno que está efetuando a ação, o código da turma na
   qual o aluno está matrículado e o ano/semestre da matrícula. Estas
   informações são utilizadas para gerar ocorrências ONLINE.
   A primeira ação efetuada é mostra a mensagem associada à ação na tela do
   terminal. Após emitir a mensagem, efetua-se a geração da ocorrência ONLINE.
   A última ação é a emissão do efeito sonoro, se configurado.
}
procedure TfrmTerminal.ExecutaProcessoPosAcao(
  const AUMTATipoAcao: TUMTATipoAcao; const AICodProfessor: integer;
  const ASCodAluno, ASCodTurma, ASAnoSemestre: string);
const
   SituacaoToCorMsg: array[TUMTATipoAcao] of TColor =
      (clRed, clRed, clRed, clBlue, clBlue, clBlue, clGreen, clRed, clBlue, clRed, clRed);

   SituacaoToMsg: array[TUMTATipoAcao] of string = (MSG_NONE,
      MSG_ENT_ATRASADA, MSG_SAIDA_ANTECIPADA, MSG_ENT_MATUTINA,
      MSG_ENT_VESPERTINA, MSG_ENT_NOTURNA, MSG_ESPERA, MSG_ACESSO_NEGADO,
      MSG_SAIDA_NORMAL, MSG_NAO_CADASTRADO, MSG_SEM_MATRICULA);
var
   LITipoAcao: integer;
   LSMensagem: string;
begin
   LITipoAcao := Ord(AUMTATipoAcao);
   if qyGetConfig.Locate('cd_configuracao', LITipoAcao, []) then
   begin
      MostraMensagem(
         qyGetConfig.FieldByName('ds_msg_terminal').AsString,
         HexToTColor(qyGetConfig.FieldByName('cor_msg_terminal').AsString));
      if (qyGetConfig.FieldByName('sn_permite_ocorrencia').AsInteger = 1) and
         (qyGetConfig.FieldByName('sn_envia_ocorrencia').AsInteger = 1) then
      begin
         RegistraOcorrencia(
            qyGetConfig.FieldByName('cd_tipo_ocorrencia').AsInteger,
            AICodProfessor, ASCodAluno, qyGetConfig.FieldByName('tx_msg_ocorrencia').AsString,
            ASCodTurma, ASAnoSemestre, qyGetConfig.FieldByName('tx_sql_ocorrencia').AsString);
      end;
      if not qyGetConfig.FieldByName('me_som_terminal').IsNull then
      begin
         EmiteAvisoSonoro(qyGetConfig.CreateBlobStream(qyGetConfigme_som_terminal, bmRead));
      end;
   end
   else
   begin
      LSMensagem := SituacaoToMsg[AUMTATipoAcao];
      if AUMTATipoAcao = taMensagemEspera then
         LSMensagem := Format(LSMensagem, [DM.getParametro('ta_tempo_espera')]);
      MostraMensagem(LSMensagem, SituacaoToCorMsg[AUMTATipoAcao]);
   end;
end;

procedure TfrmTerminal.BuscaPessoa();
var
   res: TResultadoFiltroPessoa;
begin
   if DM.GetUsuarioLogado <> nil then
   begin
      if DM.GetUsuarioLogado.TemPermissao(10001, npAlterar, False) then begin

         res := TfrmSelecionarPessoa.Filtrar([]);

         if res.filtrado then begin
            txtCodigo.Text := IntToStr(res.cd_pessoa);
         end;
    end;
  end;
end;

procedure TfrmTerminal.txtCodigoKeyPress(Sender: TObject; var Key: Char);
var
   testarConversaoInteger: Integer;
begin

  if not Bloqueado then
  begin
   if Key = #13 then
    begin

      if ( (cpfTxt.text) <> '') then
         txtCodigo.Text := FuncaoPegarCdPessoa(cpfTxt.text);


      if Length(txtCodigo.Text) > 20 then
      begin
         txtCodigo.Text := Copy(txtCodigo.Text, 0, 9);
      end;

      try

         if not (txtCodigo.Text = '9999999999') then
         begin
            testarConversaoInteger := StrToInt(txtCodigo.Text);
         end;
         
      except
        txtCodigo.Text := '';
        cpfTxt.Text := '';  
      end;
      
      AlunoInput();
      Exit;
    end;

    if not (Key in [#47..#58, #8]) then begin
      Key := #0;
    end;

    //Ultrapassou limite de Integer
    if Length(txtCodigo.Text) = 20 then
    begin
       Key := #0;
    end;

    if (TEdit(Sender).Text = '9999999999') then begin
      Key := #0;
    end;
  end
  else
  begin
    Key := #0;
  end;
end;

procedure TfrmTerminal.GeraSaidaTodos(bNaoHoje: Boolean = False);
var
   qyExecuteProcedure: TUMZQuery;
begin
   DM.CriarConsulta(qyExecuteProcedure);
   qyExecuteProcedure.SQL.Clear();
   qyExecuteProcedure.SQL.Add( ' CALL TA_GERAR_SAIDA_TODOS( :SN_IGNORAR_HOJE ) ' );

   if bNaoHoje then
      qyExecuteProcedure.ParamByName('SN_IGNORAR_HOJE').AsInteger := 1
   else
      qyExecuteProcedure.ParamByName('SN_IGNORAR_HOJE').AsInteger := 0;

   qyExecuteProcedure.ExecSQL(); 

   FreeAndNil(qyExecuteProcedure);
end;

{ **
   Pega na base de dados a turma de matrícula do aluno para o ano/semestre atual.
}
function TfrmTerminal.GetTurmaMatricula(const ASCodPessoa: string;
   var ASAnoSemestre: string): string;
var
   LSCondicao,
   LSQL,
   situacoes: string;
begin
   LSQL := qyGetTurmaMatricula.SQL.Text;

   situacoes := '';
   situacoes := DM.getParametro('ta_situacoes_matricula_acesso');

   if situacoes = '' then
   begin
      situacoes := '(1,2)';
   end;

   LSCondicao := DM.getParametro('ta_condicao_acesso');

   if Trim(LSCondicao) <> '' then
   begin
      LSCondicao := Format(' AND (%s) ', [LSCondicao]);
   end;

   qyGetTurmaMatricula.SQL.Text := Format(LSQL, [situacoes + LSCondicao]);
   qyGetTurmaMatricula.ParamByName('codigoaluno').AsString := ASCodPessoa;

   try
      qyGetTurmaMatricula.Open;

      if not qyGetTurmaMatricula.IsEmpty then
      begin
         Result := qyGetTurmaMatricula.FieldByName('turma').AsString;
         ASAnoSemestre := qyGetTurmaMatricula.FieldByName('anosemestre').AsString;
      end;
   finally
      qyGetTurmaMatricula.Close;
      qyGetTurmaMatricula.SQL.Text := LSQL;
   end;
end;

procedure TfrmTerminal.FormCreate(Sender: TObject);
var
  sDtMsg: string;
  dtDataServidor: TDateTime;
begin
   qyGetConfig.Open;
   dtDataServidor := DM.NowFromDB;
   FUMParametroGerarSaidasComoEntradas := StrToIntDef(DM.UsuarioLogado.GetColigadaLogada().GetParametro('ta_gerar_saidas_como_entradas'), 0) = 1;
   FUMParametroPermitirVariasEntradas :=  StrToIntDef(DM.UsuarioLogado.GetColigadaLogada().GetParametro('ta_permitir_importacao_varias_entradas'), 0) = 1;

   //verifica data atual
   if (FormatDateTime('yyyymmddhhnn', dtDataServidor) <> FormatDateTime('yyyymmddhhnn', DM.NowFromDB)) then begin
      sDtMsg := 'A data da máquina está diferente da do servidor ('+FormatDateTime('dd/mm/yyyy hh:nn', dtDataServidor)+').' + #13#13;
      sDtMsg := sDtMsg + 'Deseja corrigir a data?';

      if (Mensagem(sDtMsg, 'ATENÇÃO!!!!', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin
         SetSystemDate(dtDataServidor);
      end;
   end;
   FindPontoAcesso;
  MostraHora();
end;

procedure TfrmTerminal.UltimoAcesso(sCodPessoa: string; var dtData: TDateTime);
begin
  with DM.qyTerminal1 do begin
    Close();
    SQL.Clear();
    SQL.Add(
    'SELECT                       '+
    '   dt_entrada                '+
    'FROM                         '+
    '   diario_terminal_acessos   '+
    'WHERE                        '+
    '   cd_pessoa = :cdpessoa     ');

    if ( DM.db.Protocol = DB_PROTOCOLO_ORACLE ) then
      SQL.Add( ' AND ROWNUM = 1 ' );

    SQL.Add(
    'ORDER BY                     '+
    '   dt_entrada DESC           ' );

    if ( DM.db.Protocol <> DB_PROTOCOLO_ORACLE ) then
      SQL.Add( 'LIMIT 1' );

    ParamByName('cdpessoa').Value := StrToInt(sCodPessoa);
    Open();

    if not IsEmpty then begin
      dtData := FieldByName('dt_entrada').AsDateTime;
    end
    else begin
      dtData := 0;
    end;
    Close();
  end;
end;

procedure TfrmTerminal.GeraFaltasFinal(slAnoSem: TStringList);
var
  i: Integer;
  slTurmas: TStringList;
  slTemp: TStringList;
  sAux: string;
begin
   with DM.qyTerminal do begin

      Close();
      SQL.Clear();
      SQL.Add(
        'SELECT                                                   '+
        '	DISTINCT                                              '+
        '	DATE_FORMAT(dta.dt_entrada, ''%Y-%m-%d'') as tempo,   '+
        ' DATE_FORMAT(dta.dt_entrada, ''%d/%m/%Y'') as tempo1     '+
        'FROM                                                     '+
        '	diario_terminal_acessos dta                           '+
        'WHERE                                                    '+
        '  dta.sn_finalizado = 1 AND dta.sn_especial = 0          '+
        'ORDER BY                                                 '+
        '   tempo                                                 '
      );
      Open();

      if not IsEmpty then begin
         Application.CreateForm(TfFechamento, fFechamento);
      end;

      //carrega progressbar
      Application.CreateForm(TfrmProg, frmProg);

      if (Assigned(slAnoSem)) then begin
         slAnoSem.Clear();
         slAnoSem.Duplicates := dupIgnore;
       end;

      while not Eof do begin
         fFechamento.setDataFechamento(StrToDateTime(FieldByName('tempo1').AsString));
         if (fFechamento.iniciaFechamento() = ID_OK) then begin

            //faz fchamenteo
            slTurmas := fFechamento.getListaTurmas();

            frmProg.NovaBarra('Fechamento!');
            frmProg.SetMin(0);
            frmProg.SetMax(slTurmas.Count-1);
            frmProg.SetAtual(0);
            frmProg.SetText('Gerando Faltas...');

            for i := 0 to slTurmas.Count-1 do begin
               frmProg.SetAtual(i);
               slTemp := TStringList(slTurmas.Objects[i]);
               //checa se eh pra informar o anosemestre
               if (Assigned(slAnoSem)) then begin
                  sAux := slTemp.Values['anosemestre'] + ':' + slTemp.Values['curso'] + ':' + slTemp.Values['turma'];
                  if (slAnoSem.IndexOfName(sAux) = -1) then begin
                     slAnoSem.AddObject(sAux, slTemp);
                  end;
               end;
               GeraFaltaTurma(slTemp);
            end;
            FreeAndNil(slTurmas);
            frmProg.FechaBarra();

            DM.qyTerminal1.SQL.Text := '' +
            'UPDATE diario_terminal_acessos                              '+
            'SET                                                         '+
            'sn_finalizado = 2 WHERE sn_finalizado < 2 AND DATE_FORMAT(dt_entrada, ''%Y-%m-%d'') = '''+FieldByName('tempo').AsString+''' ';
            DM.qyTerminal1.ExecSQL();
         end;
         Next();
      end;

      FreeAndNil(frmProg);

      FreeAndNil(fFechamento);
      //atualiza tabela
      DM.qyTerminal1.SQL.Text := '' +
      'UPDATE diario_terminal_acessos                              '+
      'SET                                                         '+
      'dt_saida = DATE_FORMAT(dt_entrada, ''%Y-%m-%d 23:59:59'') WHERE sn_especial = 1 and dt_saida IS NULL     ';
      DM.qyTerminal1.ExecSQL();

   end;

end;

procedure TfrmTerminal.GeraFaltaTurma(slDados: TStringList);
var
   qyExecuteProcedure: TUMZQuery;
begin
   DM.CriarConsulta(qyExecuteProcedure);

   qyExecuteProcedure.SQL.Text := 'CALL TA_GERAR_FALTA_TURMA(:DATA, :CD_TURMA, :NR_ANOSEMESTRE)';
   qyExecuteProcedure.ParamByName('DATA').AsString := slDados.Values['data'];
   qyExecuteProcedure.ParamByName('CD_TURMA').AsString := slDados.Values['turma'];
   qyExecuteProcedure.ParamByName('NR_ANOSEMESTRE').AsString := slDados.Values['anosemestre'];

   qyExecuteProcedure.ExecSQL();

   FreeAndNil(qyExecuteProcedure);
end;

end.

