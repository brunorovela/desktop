unit uCorrigir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Menus, DBCtrls, tlhelp32,
  ZDbcIntfs, uLkJSON;

type
  TfrmCorrigir = class(TForm)
    Bevel1: TBevel;
    lbStatus: TLabel;
    qyLeitura: TUMZQuery;
    qyLeituracd_prova_aluno: TIntegerField;
    qyLeituracd_prova_gabarito: TIntegerField;
    qyLeiturads_nome_gabarito: TStringField;
    qyLeituracd_pessoa: TIntegerField;
    qyLeituranm_pessoa: TStringField;
    qyLeituracd_turma: TStringField;
    qyLeituranr_anosemestre: TSmallintField;
    srcLeitura: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    reLog: TRichEdit;
    qyRespostas: TUMZQuery;
    srcRespostas: TDataSource;
    grdRespostas: TDBGrid;
    qyRespostasnr_questao: TSmallintField;
    qyRespostasds_resposta_aluno: TStringField;
    qyRespostasds_resposta_gabarito: TStringField;
    sbPararLeitura: TSpeedButton;
    sbIniciarLeitura: TSpeedButton;
    sbSalvarLog: TSpeedButton;
    sdLog: TSaveDialog;
    qyRespostascd_situacao: TSmallintField;
    qyRespostasds_situacao: TStringField;
    qyLeituracd_prova: TIntegerField;
    qyLeituranr_questao_inicial: TSmallintField;
    qyLeituranr_questao_final: TSmallintField;
    cbContabilizar: TCheckBox;
    qyLeituranr_parte: TIntegerField;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure sbSalvarLogClick(Sender: TObject);
    procedure sbIniciarLeituraClick(Sender: TObject);
    procedure sbPararLeituraClick(Sender: TObject);
    procedure srcLeituraDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

    { Private declarations }
    Procedure IniciaLeitora();
    Procedure ParaLeitora();
    function ErroLeitura():boolean;
    function ErroArquivo():boolean;
    function PerguntaLerUltimo():boolean;
    procedure ErroArquivoLayout();
    procedure ErroCodigoEquivalente();

    procedure EstadoBotoes( estado : boolean );
    procedure SalvaArquivoLog(sNomeArquivo:string;iTipoArquivo:integer);
    class function MataLeituraAnterior(const ASNomePrograma: string): integer;
    class procedure AtualizaSystray;
  public
    flgSearch : Boolean;
    PadraoCurso : String;
    PadraoTurma : String;
    PadraoProfessor : Integer;
    PadraoAnosemestre : Integer;

    cd_prova : integer;

    { Public declarations }
  end;
  TCorrecoes = class(TThread)
   protected
    Formulario : TfrmCorrigir;
    aRespostas : array of integer;
    sIdentificador : string;
    procedure Execute; override;
    procedure LerGabaritos();
    procedure LeArquivo();
    procedure LeGabarito();

    function IniciaLeitura():boolean;
    function ValidaArquivo():boolean;
    function BitParaClock( iBit:integer ) : integer;
    function ClockParaCodigo( iClocks : array of string ) : string;
   public
    constructor Create(Form:TfrmCorrigir);
  end;


var
   frmCorrigir: TfrmCorrigir;
   bCancelar : boolean;
   bStatus : boolean;

implementation

uses Main, uDM, uSelCursos, Math, Types;

{$R *.DFM}

{ INÍCIO - Classe da Thread }
constructor TCorrecoes.Create(Form: TfrmCorrigir);
begin
   Formulario := Form;
   inherited Create(False);
end;

procedure TCorrecoes.Execute;
begin
   LerGabaritos();
end;

procedure TCorrecoes.LerGabaritos();
var
   i : integer;
begin
   i := 0;
   while bCancelar = False do begin
      if IniciaLeitura then begin
         if ValidaArquivo = False then begin
            if Formulario.ErroArquivo = False then begin
               Formulario.lbStatus.Caption := 'Processo cancelado !';
               Mensagem('Tamanho de arquivo inválido! Passe o cartão novamente', Application.Title, MB_OK + MB_ICONERROR, frmCorrigir.Handle);
               Continue;
            end;
         end;

         if (bCancelar) AND (Formulario.PerguntaLerUltimo = False) then begin
            Formulario.lbStatus.Caption := 'Leitura finalizada !';
            Abort();
         end;
         // Lendo o arquivo, obtendo as respostas e o código equivalente
         LeArquivo();
         if Length(sIdentificador) = 0 then begin
            Formulario.lbStatus.Caption := 'Processo cancelado por ocasião de erro !';
            Formulario.ErroCodigoEquivalente();
            Continue;
         end;
         // Verificando as respostas e jogando na base de dados
         LeGabarito();
         Formulario.qyRespostas.Close();
         Formulario.qyRespostas.Open();
         i := i + 1;
      end
      else begin
         if Formulario.ErroLeitura = False then begin
            Formulario.lbStatus.Caption := 'Processo cancelado !';
            Mensagem('Erro na execução da leitura do cartão! Passe o cartão novamente', Application.Title, MB_OK + MB_ICONERROR, frmCorrigir.Handle);
            Continue;
         end;
      end;
   end;
end;

function TCorrecoes.IniciaLeitura():boolean;
begin
   TfrmCorrigir.MataLeituraAnterior(DM.sProgramaLeitora);
   Formulario.lbStatus.Caption := 'Aguardando passagem do cartão...';
   if ExecAndWait(ExtractFilePath(Application.ExeName)+DM.sProgramaLeitora, '', SW_HIDE) then begin
      Formulario.lbStatus.Caption := 'Gerando arquivo '+DM.sProgramaLeitoraArquivo+'...';
      Result := True;
   end
   else begin
      Result := False;
   end;
end;

function TCorrecoes.ValidaArquivo():boolean;
var
   iTamanhoNecessario : integer;
   iTamanho : integer;
begin

   Formulario.lbStatus.Caption := 'Analisando o arquivo gerado pela leitora...';
   with TFileStream.Create(DM.sProgramaLeitoraArquivo, fmOpenRead or fmShareExclusive) do begin
      try
         iTamanho := Size;
      finally
         Free;
      end;
   end;

   with DM do begin
      iTamanhoNecessario := (iClocksIdenti + (iClocksResposQuanti*iClocksResposGrupo))*iProgramaLeitoraBits;
   end;

   if iTamanho < iTamanhoNecessario then begin
      Result := False;
   end
   else begin
      Result := True;
   end;

end;

procedure TCorrecoes.LeArquivo();

   function Count0(Str: string): integer;
   begin
      Result := 0;
      while AnsiPos('0', Str) > 0 do
      begin
         Str := Copy(Str, AnsiPos('0', Str) + 1, Length(Str) - AnsiPos('0', Str));
         Inc(Result);
      end;      
   end;

var
   tArq : TextFile;
   sLinha : string;
   iNumero : integer;
   iPosicao : integer;
   iPosicaoReal : integer;
   aIdentificadores : array of string;
begin
   Formulario.lbStatus.Caption := 'Lendo arquivo...';

   SetLength(aRespostas, (DM.iClocksResposQuanti*DM.iClocksResposGrupo));
   SetLength(aIdentificadores, DM.iClocksIdenti);

   AssignFile ( tArq, DM.sProgramaLeitoraArquivo );
   try
      Reset ( tArq );
      iNumero := 1;
      while not Eof ( tArq ) do begin
         ReadLn ( tArq, sLinha );
         if iNumero > (DM.iClocksResposQuanti*DM.iClocksResposGrupo) then begin
            // Lê clocks identificadores
            while Pos('0', sLinha) <> 0 do begin
               iPosicao := BitParaClock(Pos('0', sLinha));
               if iPosicao < 10 then begin
                  aIdentificadores[DM.iClocksIdenti-(iNumero-(DM.iClocksResposQuanti*DM.iClocksResposGrupo))] := aIdentificadores[DM.iClocksIdenti-(iNumero-(DM.iClocksResposQuanti*DM.iClocksResposGrupo))] + '0' + IntToStr(iPosicao);
               end
               else begin
                  aIdentificadores[DM.iClocksIdenti-(iNumero-(DM.iClocksResposQuanti*DM.iClocksResposGrupo))] := aIdentificadores[DM.iClocksIdenti-(iNumero-(DM.iClocksResposQuanti*DM.iClocksResposGrupo))] + IntToStr(iPosicao);
               end;
               sLinha := Copy( sLinha, 1, Pos('0', sLinha)-1) + '1' + Copy( sLinha, Pos('0', sLinha)+1, Length(sLinha));
            end;
         end
         else begin
            // Lê clocks de respostas
            if Pos('0',sLinha) >= 1 then
            begin
               if Count0(sLinha) > 1 then
                  aRespostas[((DM.iClocksResposQuanti*DM.iClocksResposGrupo)-iNumero)] := -2
               else
                  aRespostas[((DM.iClocksResposQuanti*DM.iClocksResposGrupo)-iNumero)] := BitParaClock(Pos('0',sLinha));
            end
            else begin
               aRespostas[((DM.iClocksResposQuanti*DM.iClocksResposGrupo)-iNumero)] := -1;
            end;
         end;
         iNumero := iNumero + 1;
      end;
   finally
      CloseFile ( tArq );
   end;

   // Traduzindo os identificadores para código
   Formulario.lbStatus.Caption := 'Obtendo a identificação...';
   sIdentificador := ClockParaCodigo(aIdentificadores);

end;

function TCorrecoes.BitParaClock( iBit:integer ) : integer;
begin
   if DM.aArquivoLayout[iBit] = 'X' then begin
      Formulario.ErroArquivoLayout();
      Abort();
   end
   else begin
      Result := StrToInt(DM.aArquivoLayout[iBit]);
   end;
end;

function TCorrecoes.ClockParaCodigo( iClocks : array of string ) : string;
var
   iNumero1 : integer;
   iNumero2 : integer;
   iTemp1 : integer;
   sCodigo : string;
   aCodigo : array of string;
begin

   SetLength(aCodigo, DM.iClocksIdenti);

   for iNumero1 := 1 to DM.iClocksIdenti do begin

      for iNumero2 := 1 to (StrToInt(FloatToStr(Length(iClocks[iNumero1-1])/2))) do begin
         iTemp1 := StrToInt(Copy(iClocks[iNumero1-1], ((iNumero2*2)-1), 2));
         aCodigo[iNumero1-1] := aCodigo[iNumero1-1] + Copy(DM.aClocksIdentiOpcoesAltern[iNumero1-1], iTemp1, 1);
      end;
      aCodigo[iNumero1-1] := SortChar(aCodigo[iNumero1-1]);
      sCodigo := sCodigo + aCodigo[iNumero1-1];

   end;

   Result := sCodigo;

end;

procedure TCorrecoes.LeGabarito();
const
   SSQLSelectProvaAluno = 'SELECT `CD_PROVA_ALUNO`, `CD_PESSOA`, `CD_PROVA_GABARITO`, `NR_ACERTOS`, `CD_TURMA`, `NR_ANOSEMESTRE` FROM `LEITORA_PROVAS_ALUNOS` WHERE `CD_PROVA_ALUNO` = ?';
var
   iNumero : integer;
   iCodPessoa : integer;
   sNomePessoa : string;
   sCodTurma : string;
   iAnoSemestre : integer;
   iCodGabarito : integer;
   sNomeGabarito : string;
   iCodProvaAluno : integer;
   sAlfabeto : string;
   iAlternativas : integer;
   sResposta : string;
   iAcertos : double;
   iCertas, iErradas, iParciais : integer;
   sAux : string;
   sAux2 : string;
   iAux : integer;
   iAux2 : integer;
   rPeso : real;
   bSomatoria : boolean;
   iQuestaoInicial : integer;
   iQuestaoFinal : integer;
   iParteProva : Integer;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   JSON, JSONOld, JSONNew, JSONChave: TlkJSONobject;
   S, Chave: AnsiString;
begin

   Formulario.lbStatus.Caption := 'Lendo o gabarito...';
   iAcertos := 0;

   with DM.qyAux3 do begin
      Close();
      SQL.Text := ' ' +
         'REPLACE INTO ' +
         '  leitora_provas_alunos_resp( ' +
         '     cd_prova_aluno, ' +
         '     nr_questao, ' +
         '     ds_resposta, ' +
         '     cd_situacao, ' +
         '     nr_parte ' +
         '  )VALUES ';
   end;

   with Formulario.qyLeitura do
   begin
      Close();
      ParamByName('cd_equivalente').AsString := sIdentificador;
      Open();

      if Eof then begin
         Formulario.ErroCodigoEquivalente();
         Abort();
      end;

      iCodPessoa := FieldByName('cd_pessoa').AsInteger;
      sNomePessoa := FieldByName('nm_pessoa').AsString;
      sCodTurma := FieldByName('cd_turma').AsString;
      iAnoSemestre := FieldByName('nr_anosemestre').AsInteger;
      iCodGabarito := FieldByName('cd_prova_gabarito').AsInteger;
      sNomeGabarito := FieldByName('ds_nome_gabarito').AsString;
      iCodProvaAluno := FieldByName('cd_prova_aluno').AsInteger;
      iQuestaoInicial := FieldByName('nr_questao_inicial').AsInteger;
      iQuestaoFinal := FieldByName('nr_questao_final').AsInteger;
      iParteProva := FieldByName('nr_parte').AsInteger;

      with DM.qyAux do begin
         Close();
         SQL.Text := 'DELETE FROM leitora_provas_alunos_resp WHERE cd_prova_aluno = :cd_prova_aluno AND (nr_questao >= :nr_questao_inicial AND nr_questao <= :nr_questao_final) AND nr_parte = :nr_parte';
         ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
         ParamByName('nr_questao_inicial').AsInteger := iQuestaoInicial;
         ParamByName('nr_questao_final').AsInteger := iQuestaoFinal;
         ParamByName('nr_parte').AsInteger := iParteProva;
         ExecSQL();
      end;

      if Formulario.cbContabilizar.Checked then begin
        with DM.qyAux do begin
           Close();
           SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = 0 WHERE cd_prova_aluno = :cd_prova_aluno';
           ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
           ExecSQL();
        end;
      end;

      Formulario.lbStatus.Caption := 'Corrigindo questões...';
   end;

   with DM.qyAux do
   begin
      Close();
      SQL.Text := 'SELECT * FROM leitora_provas_gabaritos_resp WHERE sn_discursiva <> 1 AND cd_prova_gabarito = :cd_prova_gabarito AND (nr_questao >= :nr_questao_inicial AND nr_questao <= :nr_questao_final) AND nr_parte = :nr_parte ORDER BY nr_questao';
      ParamByName('cd_prova_gabarito').AsInteger := iCodGabarito;
      ParamByName('nr_questao_inicial').AsInteger := iQuestaoInicial;
      ParamByName('nr_questao_final').AsInteger := iQuestaoFinal;
      ParamByName('nr_parte').AsInteger := iParteProva;
      Open();
      iNumero := 1;
      sAlfabeto := 'ABCDEFGHIJKLMNOPGRSTUVXZ';
      while not Eof do begin
         bSomatoria := DM.VerificaeNumero(FieldByName('ds_resposta').AsString);
         if FieldByName('nr_alternativas').AsString = '' then begin
            iAlternativas := 0;
         end
         else begin
            iAlternativas := FieldByName('nr_alternativas').AsInteger;
         end;
         rPeso := FieldByName('vl_peso').AsFloat;

         // Caso seja uma questão somatória
         if bSomatoria then begin
            // marcou duas alternativas em uma das linhas
            if (aRespostas[iNumero] = -2) or (aRespostas[iNumero - 1] = -2) then
            begin
               sResposta := ' ';
            end
            else
            begin
               if aRespostas[iNumero-1] <> -1 then begin
                  sResposta := IntToStr(aRespostas[iNumero-1]-1-DM.aClocksResposConfigInicio[0]);
               end
               else begin
                  sResposta := ' ';
               end;
               if aRespostas[iNumero] <> -1 then begin
                  sResposta := sResposta + IntToStr(aRespostas[iNumero]-1-DM.aClocksResposConfigInicio[1]);
               end
               else begin
                  sResposta := sResposta + ' ';
               end;
            end;
         end
         // Caso contrário (caso seja múltipla-escolha)
         else begin
            if aRespostas[iNumero - 1] = -2 then
            begin
               sResposta := ' ';
            end
            else if aRespostas[iNumero-1] <> -1 then begin
               sResposta := Copy(sAlfabeto, aRespostas[iNumero-1]-DM.aClocksResposConfigInicio[0], 1);
            end
            else begin
               sResposta := ' ';
            end;
         end;

         with DM.qyAux2 do begin
            Close();
            SQL.Text := 'SELECT cd_prova_aluno FROM leitora_provas_alunos_resp WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
            ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
            ParamByName('nr_questao').AsInteger := DM.qyAux.FieldByName('nr_questao').AsInteger;
            ParamByName('nr_parte').AsInteger := iParteProva;
            Open();
            if not Eof then begin
               Close();
               SQL.Text := 'UPDATE leitora_provas_alunos_resp SET ds_resposta = :ds_resposta WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
               ParamByName('ds_resposta').AsString := sResposta;
               ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
               ParamByName('nr_questao').AsInteger := DM.qyAux.FieldByName('nr_questao').AsInteger;
               ParamByName('nr_parte').AsInteger := iParteProva;
               ExecSQL();
            end
            else begin
               with DM.qyAux3 do begin
                  if iNumero > 1 then begin
                     SQL.Add(',');
                  end;
                  SQL.Add('(:cd_prova_aluno'+IntToStr(iNumero)+',:nr_questao'+IntToStr(iNumero)+',:ds_resposta'+IntToStr(iNumero)+',-1, :nr_parte'+IntToStr(iNumero)+')');
                  ParamByName('ds_resposta'+IntToStr(iNumero)).AsString := sResposta;
                  ParamByName('cd_prova_aluno'+IntToStr(iNumero)).AsInteger := iCodProvaAluno;
                  ParamByName('nr_questao'+IntToStr(iNumero)).AsInteger := DM.qyAux.FieldByName('nr_questao').AsInteger;
                  ParamByName('nr_parte'+IntToStr(iNumero)).AsInteger := iParteProva;
               end;
            end;
         end;

         if Formulario.cbContabilizar.Checked then
         begin

            with DM.qyAux2 do
            begin
               Close();
               DM.qyAux5.Close();
               if sResposta = DM.qyAux.FieldByName('ds_resposta').AsString then
               begin
                  iAcertos := iAcertos + rPeso;
                  iCertas := iCertas + 1;

                  if pos(',',FloatToStr(rPeso)) > 0 then
                  begin
                     SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),'+Copy(FloatToStr(rPeso),1,pos(',',FloatToStr(rPeso))-1)+'.'+Copy(FloatToStr(rPeso),pos(',',FloatToStr(rPeso))+1)+',nr_acertos + '+Copy(FloatToStr(rPeso),1,pos(',',FloatToStr(rPeso))-1)+'.'+Copy(FloatToStr(rPeso),pos(',',FloatToStr(rPeso))+1)+') WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                  end else begin
                     SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),'+FloatToStr(rPeso)+',nr_acertos + '+FloatToStr(rPeso)+') WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                  end;

                  DM.qyAux5.SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 0 WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
               end
               else if trim(sResposta) = '' then
               begin
                  iErradas := iErradas + 1;
                  SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),0,nr_acertos) WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                  DM.qyAux5.SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
               end
               else if (DM.qyAux.FieldByName('sn_parcial').AsInteger = 1) AND
                        bSomatoria AND (StrToInt(trim(sResposta)) <= DM.qyAux.FieldByName('ds_resposta').AsInteger) AND
                        (Length(trim(sResposta)) = Length(trim(DM.qyAux.FieldByName('ds_resposta').AsString))) then
               begin
                  sAux := DM.DecompoeNumero(DM.qyAux.FieldByName('ds_resposta').AsInteger);
                  sAux2 := DM.DecompoeNumero(StrToInt(trim(sResposta)));
                  while Pos(';',sAux2) > 0 do begin
                     if Pos(Copy(sAux2, 1, pos(';',sAux2)-1), sAux) = 0 then begin
                        iAux := -1;
                     end;
                     sAux2 := Copy(sAux2, pos(';',sAux2)+1);
                  end;

                  if iAux = -1 then
                  begin
                     iErradas := iErradas + 1;
                     SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),0,nr_acertos) WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                     DM.qyAux5.SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
                  end else begin
                     iAux := 0;
                     sAux := DM.DecompoeNumero(DM.qyAux.FieldByName('ds_resposta').AsInteger);
                     while Pos(';',sAux) > 0 do
                     begin
                        sAux2 := DM.DecompoeNumero(StrToInt(trim(sResposta)));
                        while Pos(';',sAux2) > 0 do
                        begin
                           if Copy(sAux, 1, pos(';',sAux)-1) = Copy(sAux2, 1, pos(';',sAux2)-1) then
                           begin
                              iAux := iAux + 1;
                           end;
                           sAux2 := Copy(sAux2, pos(';',sAux2)+1);
                        end;
                        sAux := Copy(sAux, pos(';',sAux)+1);
                        iAux2 := iAux2 + 1;
                     end;

                     iAcertos := iAcertos + RoundFloat(((iAux/iAux2)/rPeso),2);
                     iParciais := iParciais + 1;
                     if pos(',',FloatToStr((iAux/iAux2)/rPeso)) > 0 then
                     begin
                        SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),'+Copy(FloatToStr(rPeso),1,pos(',',FloatToStr(rPeso))-1)+'.'+Copy(FloatToStr(rPeso),pos(',',FloatToStr(rPeso))+1)+',nr_acertos + round('+Copy(FloatToStr((iAux/iAux2)/rPeso),1,pos(',',FloatToStr((iAux/iAux2)/rPeso))-1)+'.'+Copy(FloatToStr((iAux/iAux2)/rPeso),pos(',',FloatToStr((iAux/iAux2)/rPeso))+1)+',2)) WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                     end else begin
                        if pos(',',FloatToStr(rPeso)) > 0 then
                        begin
                           SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),'+Copy(FloatToStr(rPeso),1,pos(',',FloatToStr(rPeso))-1)+'.'+Copy(FloatToStr(rPeso),pos(',',FloatToStr(rPeso))+1)+',nr_acertos + round('+FloatToStr((iAux/iAux2)/rPeso)+',2)) WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                        end else begin
                           SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),'+FloatToStr(rPeso)+',nr_acertos + round('+FloatToStr((iAux/iAux2)/rPeso)+',2)) WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                        end;
                     end;
                     DM.qyAux5.SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 1 WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
                  end;
               end else begin
                  iErradas := iErradas + 1;
                  SQL.Text := 'UPDATE leitora_provas_alunos_dis SET nr_acertos = IF(isNull(nr_acertos),0,nr_acertos) WHERE cd_prova_aluno = :cd_prova_aluno AND cd_prova_disciplina = :cd_prova_disciplina';
                  DM.qyAux5.SQL.Text := 'UPDATE leitora_provas_alunos_resp SET cd_situacao = 2 WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_parte = :nr_parte';
               end;

               ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
               ParamByName('cd_prova_disciplina').AsInteger := DM.qyAux.FieldByName('cd_prova_disciplina').AsInteger;
               ExecSQL();

               with DM.qyAux5 do
               begin
                  ParamByName('cd_prova_aluno').AsInteger := iCodProvaAluno;
                  ParamByName('nr_questao').AsInteger := DM.qyAux.FieldByName('nr_questao').AsInteger;
                  ParamByName('nr_parte').AsInteger := iParteProva;
                  ExecSQL();
               end;
            end;
         end;

         iNumero := iNumero + 2;
         Next();
      end;

      if DM.qyAux3.SQL.Count >= 2 then
      begin
         sResposta := DM.qyAux3.SQL.Text;
         DM.qyAux3.ExecSQL();
      end;

      if Formulario.cbContabilizar.Checked then
      begin

         Stmt := DM.db.DbcConnection.PrepareStatement(SSQLSelectProvaAluno);
         try
            Stmt.SetResultSetConcurrency(rcUpdatable);

            Stmt.SetInt(1, iCodProvaAluno);

            Rs := Stmt.ExecuteQueryPrepared;
            try
               if Rs.Next then
               begin
                  // Rs.MoveToCurrentRow;

                  JSONOld := DM.RecordToJSON(Rs);

                  Rs.UpdateDouble(4, iAcertos);
                  Rs.UpdateRow;

                  JSONNew := DM.RecordToJSON(Rs);

                  JSON := TlkJSONobject.Create(False);
                  try
                     JSON.Add('anterior', JSONOld);
                     JSON.Add('novo', JSONNew);

                     S := UTF8Decode(TlkJSON.GenerateText(JSON));
                  finally
                     FreeAndNil(JSON);
                  end;

                  JSONChave := TlkJSONobject.Create(False);
                  try
                     JSONChave.Add('formulario', Name);
                     JSONChave.Add('classe', ClassName);
                     JSONChave.Add('metodo', 'LeGabarito');
                     JSONChave.Add('cd_prova_aluno', iCodProvaAluno);

                     Chave := UTF8Decode(TlkJSON.GenerateText(JSONChave));
                  finally
                     FreeAndNil(JSONChave);
                  end;

                  DM.Log(7001, Chave, S, tlAlteracao);
               end;
            finally
               Rs.Close;
            end;
         finally
            Stmt.Close;
         end;
      end;

   end;

   Formulario.lbStatus.Caption := 'Leitura do gabarito concluída !';
   if Formulario.cbContabilizar.Checked then
   begin
     Formulario.reLog.Lines.Add('Aluno ['+IntToStr(iCodPessoa)+'] => Certas: ['+IntToStr(iCertas)+'], erradas: ['+IntToStr(iErradas)+'] , parciais: ['+IntToStr(iParciais)+'], Total: ['+FloatToStr(((iNumero-1)/2))+']. Pontuação: ['+FloatToStr(iAcertos)+']');
   end else begin
     Formulario.reLog.Lines.Add('Aluno ['+IntToStr(iCodPessoa)+'] => Total de questões: ['+FloatToStr(((iNumero-1)/2))+'].');
   end;
end;
{ FIM - Classe da Thread }


procedure TfrmCorrigir.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmCorrigir.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

class procedure TfrmCorrigir.AtualizaSystray;
var
   LInput: TInput;
   LRect: TRect;
   LPoint: TPoint;
   LCXFullScreen, LCYFullScreen, LSkipPixels, LXPos: integer;
   LHwndTask, LHwndTray: HWND;
begin
   LHwndTask := FindWindow('Shell_TrayWnd', nil);
   LHwndTray := FindWindowEx(LHwndTask, 0, 'traynotifywnd', nil);
   SendMessage(LHwndTray, WM_PAINT, 0, 0);
   LSkipPixels := GetSystemMetrics(SM_CXSMICON);
   if LHwndTray <> 0 then
   begin
      GetCursorPos(LPoint);
      LInput.Itype := INPUT_MOUSE;
      LInput.mi.mouseData := 0;
      LInput.mi.time := 0;
      LInput.mi.dwFlags := (MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE);
      LCXFullScreen := GetSystemMetrics(SM_CXSCREEN);
      LCYFullScreen := GetSystemMetrics(SM_CYSCREEN);
      GetWindowRect(LHwndTray, LRect);
      LRect.Top := Trunc(LRect.Top + LSkipPixels / 2);
      LRect.Left := Trunc(LRect.Left + LSkipPixels / 2);
      while LRect.Top < LRect.Bottom do
      begin
         LInput.mi.dy := Trunc((LRect.Top * 65535) / LCYFullScreen);
         LXPos := LRect.Left;
         while LXPos < LRect.Right do
         begin
            LInput.mi.dx := Trunc((LXPos * 65535) / LCXFullScreen);
            SendInput(1, LInput, SizeOf(TInput));
            Sleep(1);
            Inc(LXPos, LSkipPixels);
         end;
         Inc(LRect.Top, LSkipPixels);
      end;
      LInput.mi.dx := Trunc((LPoint.X * 65535) / LCXFullScreen);
      LInput.mi.dy := Trunc((LPoint.Y * 65535) / LCYFullScreen);
      SendInput(1, LInput, SizeOf(TInput));
   end;
end;

procedure TfrmCorrigir.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmCorrigir.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmCorrigir.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmCorrigir.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmCorrigir.IniciaLeitora();
begin
   bCancelar := False;
   EstadoBotoes(True);
   TCorrecoes.Create(frmCorrigir);
end;

class function TfrmCorrigir.MataLeituraAnterior(const ASNomePrograma: string): integer;
const
   PROCESS_TERMINATE = $0001;
var
   LNomePrograma: string;
   LContinue: boolean;
   LSnapshotHandle: THandle;
   LProcessEntry32: TProcessEntry32;
begin
   Result := 0;
   LNomePrograma := AnsiUpperCase(ASNomePrograma);
   LSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   LProcessEntry32.dwSize := SizeOf(LProcessEntry32);
   LContinue := Process32First(LSnapshotHandle, LProcessEntry32);
   while LContinue do
   begin
      if (AnsiUpperCase(ExtractFileName(LProcessEntry32.szExeFile)) = LNomePrograma) or
         (AnsiUpperCase(LProcessEntry32.szExeFile) = LNomePrograma) then
         Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), LProcessEntry32.th32ProcessID), 1));
      LContinue := Process32Next(LSnapshotHandle, LProcessEntry32);
   end;
   CloseHandle(LSnapshotHandle);
   TfrmCorrigir.AtualizaSystray;
end;

procedure TfrmCorrigir.ParaLeitora();
begin
   EstadoBotoes(False);
   lbStatus.Caption := 'Processo parado !';
   bCancelar := True;
end;

procedure TfrmCorrigir.sbCancelarClick(Sender: TObject);
begin
   lbStatus.Caption := 'Última leitura !';
   bCancelar := True;
end;

procedure TfrmCorrigir.FormShow(Sender: TObject);
begin
   lbStatus.Caption := '';
   IniciaLeitora();
end;

function TfrmCorrigir.ErroLeitura():boolean;
begin
   Result:= Mensagem(
      'Ocorreu um problema na execução do programa da leitora.' + #13 + 'Deseja tentar novamente ?',
      Application.Title, MB_YESNO + MB_ICONQUESTION ) = mrYes;
end;

function TfrmCorrigir.ErroArquivo():boolean;
begin
   if not PrincipalForm.ProcuraForm(frmCorrigir) then begin
     Result := False;
   end
   else begin
      if Mensagem( 'Aparentemente o arquivo gerado pela leitora está incorreto.'+chr(13)+'Deseja continuar mesmo assim ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
         Result := True;
      end
      else begin
         Result := False;
      end;
   end;
end;

function TfrmCorrigir.PerguntaLerUltimo():boolean;
begin
   if Mensagem( 'Você solicitou Parar Leitura.'+chr(13)+'Deseja ler o cartão atual ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then begin
      Result := True;
   end
   else begin
      Result := False;
   end;
end;

procedure TfrmCorrigir.ErroArquivoLayout();
begin
   Mensagem( 'Falha no layout do arquivo !'+chr(13)+'Entre em contato com o suporte do sistema.', Application.Title, MB_OK + MB_ICONERROR );
end;

procedure TfrmCorrigir.ErroCodigoEquivalente();
begin
   Mensagem( 'Não foi possível obter o Código Equivalente do cartão !'+chr(13)+'Entre em contato com o suporte do sistema.', Application.Title, MB_OK + MB_ICONERROR );
end;

procedure TfrmCorrigir.srcLeituraDataChange(Sender: TObject; Field: TField);
begin
   qyRespostas.Close();
   qyRespostas.Open();
end;

procedure TfrmCorrigir.EstadoBotoes( estado : boolean );
begin
   if estado then begin
      sbIniciarLeitura.Enabled := False;
   end
   else begin
      sbIniciarLeitura.Enabled := True;
   end;
   sbPararLeitura.Enabled := not sbIniciarLeitura.Enabled;
   sbSalvarLog.Enabled := sbIniciarLeitura.Enabled;
end;

procedure TfrmCorrigir.sbPararLeituraClick(Sender: TObject);
begin
   ParaLeitora();
   TfrmCorrigir.MataLeituraAnterior(DM.sProgramaLeitora);
end;

procedure TfrmCorrigir.sbIniciarLeituraClick(Sender: TObject);
begin
   IniciaLeitora();
end;

procedure TfrmCorrigir.sbSalvarLogClick(Sender: TObject);
begin
   sdLog.InitialDir := ExtractFilePath( Application.ExeName );
   if sdLog.Execute() then begin
      SalvaArquivoLog(sdLog.FileName,sdLog.FilterIndex);
   end;
end;

procedure TfrmCorrigir.SalvaArquivoLog(sNomeArquivo:string;iTipoArquivo:integer);
var
   arqLog : TextFile;
   iNumero : integer;
   sLinha : string;
   sAux : string;
begin
   AssignFile ( arqLog, sNomeArquivo );
   Rewrite ( arqLog );

   if iTipoArquivo = 1 then begin
      for iNumero := 0 to reLog.Lines.Count-1 do begin
         Writeln ( arqLog, reLog.Lines[iNumero] );
         Writeln ( arqLog, '-------------------------------------------------------------------------------------------' );
      end;
      Writeln ( arqLog, '-------------------------------------------------------------------------------------------' );
      Writeln ( arqLog, 'Total de leituras: '+IntToStr(reLog.Lines.Count) );
   end
   else begin
      Writeln ( arqLog, 'Cód.Aluno;Acertos;Erros;Parciais;Total;Pontos;' );
      for iNumero := 0 to reLog.Lines.Count-1 do begin
         sAux := reLog.Lines[iNumero];
         sLinha := '';

         sAux := Copy(sAux, pos('[',sAux)+1, Length(sAux));
         sLinha := sLinha + Copy(sAux, 1, pos(']',sAux)-1)+';';

         sAux := Copy(sAux, pos('[',sAux)+1, Length(sAux));
         sLinha := sLinha + Copy(sAux, 1, pos(']',sAux)-1)+';';

         sAux := Copy(sAux, pos('[',sAux)+1, Length(sAux));
         sLinha := sLinha + Copy(sAux, 1, pos(']',sAux)-1)+';';

         sAux := Copy(sAux, pos('[',sAux)+1, Length(sAux));
         sLinha := sLinha + Copy(sAux, 1, pos(']',sAux)-1)+';';

         sAux := Copy(sAux, pos('[',sAux)+1, Length(sAux));
         sLinha := sLinha + Copy(sAux, 1, pos(']',sAux)-1)+';';

         sAux := Copy(sAux, pos('[',sAux)+1, Length(sAux));
         sLinha := sLinha + Copy(sAux, 1, pos(']',sAux)-1)+';';

         Writeln ( arqLog, sLinha );
      end;
      Writeln ( arqLog, '' );
      Writeln ( arqLog, 'Total de leituras:;;;;;'+IntToStr(reLog.Lines.Count)+';' );
   end;
   CloseFile( arqLog );
end;

end.
