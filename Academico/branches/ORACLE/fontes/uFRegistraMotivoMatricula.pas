unit uFRegistraMotivoMatricula;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, uDM, DB, ZConnection,
   General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMDateTimePicker, DBCtrls, UMLookupComboBox;

const
   DescricaoSituacoes: array[0..14] of string =
      ('', 'ATIVAR MATRÍCULA', '', 'CANCELAR MATRÍCULA', 'TRANCAR MATRÍCULA',
       'REGISTRAR DESISTÊNCIA', 'REGISTRAR ABANDONO', '', '', '',
       'MARCAR COMO RESERVA', '', '', '', '');

type
   TfRegistraMotivoMatricula = class(TForm)
    qyMotivos: TUMZQuery;
    qryUpdateMatriculaCurso: TUMZQuery;
    qySituacoes: TUMZQuery;
    pnMatriculaCurso: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbSituacoes: TComboBox;
    umdtsaidacurso: TUMDateTimePicker;
    mmMotivo: TMemo;
    cbMotivos: TComboBox;
    lbTMotivo: TLabel;
    pnTopo: TPanel;
    lbTurma: TLabel;
    lbCurso: TLabel;
    lbTAnoSem: TLabel;
    lbAnoSem: TLabel;
    lbNome: TLabel;
    lbTNome: TLabel;
    lbTTurma: TLabel;
    lbTCurso: TLabel;
    lbData: TLabel;
    lbTData: TLabel;
    lbTSituacao: TLabel;
    lbSituacao: TLabel;
    pnConfirmarSaida: TPanel;
    lbTDataSaida: TLabel;
    umdtSaida: TUMDateTimePicker;
    qySituacoesCD_SITUACAO: TIntegerField;
    qySituacoesDS_VALOR: TStringField;
    qySituacoesDS_SIGLA: TStringField;
    qySituacoesCD_SITUACAO_MATRICULA_TURMA: TIntegerField;
    qryObservacoes: TUMZQuery;
    procedure cbSituacoesChange(Sender: TObject);
    procedure cbMotivosSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   published
      qyAtuaDataSaida: TUMZQuery;
      pnTitulo: TPanel;
      tbAcoes: TToolBar;
      tbSep1: TToolButton;
      tbSalvar: TToolButton;
      tbSep2: TToolButton;
      tbCancelar: TToolButton;
      tbSep3: TToolButton;
      ilImagens: TImageList;
      bvSep1: TBevel;
      procedure CancelaRegistro(Sender: TObject);
      procedure ConfirmaRegistro(Sender: TObject); 
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure mmMotivoChange(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure setObservacaoMotivo( 
         const AICodUsuario, AICodPessoa, AIAnoSemestre,
         AICodSituacao: integer; const ASCodCurso, ASCodTurma, ASMotivo: string;
         const ADtRegistro: TDateTime;
         const AICodMotivo : Integer
      );
   strict private
      FICodPessoa: integer;
      FBAlterarMotivo: boolean;
      FIAnoSemestre: integer;
      FICodSituacao: integer;
      FSCodCurso: string;
      FSCodTurma: string;
      FDtRegistro: TDateTime;
      ICodSituacao: Integer;
      procedure RegistraDataSaida;
      procedure atualizaMatriculaCurso();
   private
      constructor Create(const AICodAluno, AICodSituacao, AIAnoSemestre: integer;
         const ASNomeAluno, ASCodCurso, ASCodTurma: string; AOwner: TComponent);
      destructor Destroy; override;
      class function RegistraMotivo(const AICodUsuario, AICodPessoa, AIAnoSemestre,
         AICodSituacao: integer; const ASCodCurso, ASCodTurma, ASMotivo: string;
         const ADtRegistro: TDateTime; const ABSilencioso: boolean; const AICodMotivo : Integer): boolean;
   public
      class function RegistraMotivoMatricula(const AICodAluno, AICodSituacao,
         AIAnoSemestre: integer; const ASNomeAluno, ASCodCurso, ASCodTurma: string;
         AOwner: TComponent): boolean; overload;
      class function RegistraMotivoMatricula(const AICodAluno, AICodSituacao,
         AIAnoSemestre: integer; const ASCodCurso, ASCodTurma: string): boolean; overload;
   end;

var
   fRegistraMotivoMatricula: TfRegistraMotivoMatricula;

implementation

const
   SQL_REGISTRA_MOTIVO =
      'INSERT INTO matriculas_motivos '+
         '(cd_usuario, cd_pessoa, nr_anosemestre, cd_curso, cd_turma, dt_registro,'+
          'cd_situacao, tx_motivo, cd_motivo) '+
      'VALUES '+
         '(:cd_usuario, :cd_pessoa, :nr_anosemestre, :cd_curso, :cd_turma, :dt_registro,'+
           ':cd_situacao, :tx_motivo, :cd_motivo)';

   MOTIVO_PADRAO = 'NÃO FOI REGISTRADO MOTIVO';

   Situacoes: array[0..14] of string = (
      'APROVADO', 'CURSANDO', 'EM EXAME', 'CANCELADA', 'TRANCADA', 'DESISTÊNCIA',
      'ABANDONO', 'TRANSF. EXTERNA', 'TRANSF. INTERNA', 'REPROVADO', 'RESERVADO',
      '2ª ÉPOCA', 'APROVEITAMENTO', '', 'CONCLUÍDO'
   );

{$R *.dfm}

{ TfRegistraMotivoMatricula }

constructor TfRegistraMotivoMatricula.Create(const AICodAluno, AICodSituacao,
  AIAnoSemestre: integer; const ASNomeAluno, ASCodCurso, ASCodTurma: string;
  AOwner: TComponent);
begin
   ICodSituacao := AICodSituacao;

   inherited Create(AOwner);
   
   Self.pnTitulo.Caption := DescricaoSituacoes[AICodSituacao];
   Self.FICodPessoa := AICodAluno;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FICodSituacao := AICodSituacao;
   Self.FBAlterarMotivo := True;
   Self.FSCodCurso := ASCodCurso;
   Self.FSCodTurma := ASCodTurma;
   Self.FDtRegistro := DM.DataAtual;
   Self.lbNome.Caption := ASNomeAluno;
   Self.lbAnoSem.Caption := Format('%d', [AIAnoSemestre]);
   Self.lbCurso.Caption := ASCodCurso;
   Self.lbTurma.Caption := ASCodTurma;
   Self.lbData.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Self.FDtRegistro);
   Self.lbSituacao.Caption := Situacoes[AICodSituacao];
   tbSalvar.Enabled :=
      ((Trim(mmMotivo.Lines.Text) <> '') or (not FICodSituacao in [3, 4, 5])) and
      (cbMotivos.ItemIndex > 0) and (cbSituacoes.ItemIndex > -1);
   self.qySituacoes.Close;
   self.qySituacoes.Open;

   if AICodSituacao = 1 then
   begin
      pnConfirmarSaida.Visible := False;
      Panel1.Visible := False;
      Self.Height := 410;
   end;

   if AICodSituacao in [3,4,5,6,7] then
   begin
      umdtSaida.Date := Now;
      umdtsaidacurso.Date := Now;
   end;
end;

destructor TfRegistraMotivoMatricula.Destroy;
begin
   inherited;
end;

procedure TfRegistraMotivoMatricula.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

end;

procedure TfRegistraMotivoMatricula.FormCreate(Sender: TObject);
var
   I, Select: Integer;
   Found: Boolean;
begin
  qyMotivos.Open();

  cbMotivos.AddItem('SELECIONE O MOTIVO DA ALTERAÇÃO',Nil);
  if not qyMotivos.IsEmpty then begin
     while not qyMotivos.eof do begin
        cbMotivos.AddItem(qyMotivos.FieldByName('ds_sigla').AsString,qyMotivos.getBookmark());
        qyMotivos.Next();
     end;
  end;

   I := -1;
   Select := -1;
   
   if not qySituacoes.IsEmpty then
   begin
      qySituacoes.First;
      while not qySituacoes.Eof do
      begin
         I := cbSituacoes.Items.AddObject(qySituacoesDS_VALOR.AsString, qySituacoes.GetBookmark);

         if not Found then
            if ICodSituacao = qySituacoesCD_SITUACAO_MATRICULA_TURMA.AsInteger then
            begin
               Found := True;
               Select := I
            end
            else if
               ((qySituacoesDS_SIGLA.AsString = 'CANC') and (ICodSituacao = 3)) or
               ((qySituacoesDS_SIGLA.AsString = 'TRANC') and (ICodSituacao = 4)) or
               ((qySituacoesDS_SIGLA.AsString = 'CURS') and (ICodSituacao = 1)) or
               ((qySituacoesDS_SIGLA.AsString = 'TRANS') and (ICodSituacao = 7)) or
               ((qySituacoesDS_SIGLA.AsString = 'ABAND') and (ICodSituacao in [5, 6])) then
               Select := I;
            
         qySituacoes.Next;
      end;
   end;

   cbSituacoes.ItemIndex := Select;
   
   SendMessage(mmMotivo.Handle, WM_VSCROLL, SB_TOP, 0); //vai pra primeira linha
   cbMotivos.ItemIndex := 0;
   mmMotivo.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure TfRegistraMotivoMatricula.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if Self.tbSalvar.Enabled then
            Self.ConfirmaRegistro(nil);
      VK_F6:
         if Self.tbCancelar.Enabled then
            Self.CancelaRegistro(nil);
   end;
end;

procedure TfRegistraMotivoMatricula.mmMotivoChange(Sender: TObject);
begin
   tbSalvar.Enabled :=
      ((Trim(mmMotivo.Lines.Text) <> '') or (not FICodSituacao in [3, 4, 5])) and
      (cbMotivos.ItemIndex > 0) and (cbSituacoes.ItemIndex > -1);
end;

procedure TfRegistraMotivoMatricula.atualizaMatriculaCurso;
begin
   self.qryUpdateMatriculaCurso.Close;
   if( Self.FICodSituacao = 1 ) then
   begin
      // Salvar a data como NULL no banco
      Self.qryUpdateMatriculaCurso.ParamByName('dataconc').Clear;
   end else begin
      Self.qryUpdateMatriculaCurso.ParamByName('dataconc').AsString := FormatDateTime('yyyy-mm-dd', umdtSaidaCurso.Date);
   end;

   Self.qryUpdateMatriculaCurso.ParamByName('situacao').AsInteger := Self.qySituacoesCD_SITUACAO.AsInteger;
   Self.qryUpdateMatriculaCurso.ParamByName('curso').AsString := Self.FSCodCurso;
   Self.qryUpdateMatriculaCurso.ParamByName('codigoaluno').AsInteger := Self.FICodPessoa;
   Self.qryUpdateMatriculaCurso.ExecSQL;
end;

procedure TfRegistraMotivoMatricula.CancelaRegistro(Sender: TObject);
//var
//   LBSucesso: boolean;
begin
//   LBSucesso :=
//      TfRegistraMotivoMatricula.RegistraMotivo(
//         DM.tblUsuariosNomeCodigo.AsInteger, Self.FICodPessoa, Self.FIAnoSemestre,
//         Self.FICodSituacao, Self.FSCodCurso, Self.FSCodTurma, MOTIVO_PADRAO,
//         Self.FDtRegistro, false);
   Self.ModalResult := mrCancel;
   Self.CloseModal;
end;

procedure TfRegistraMotivoMatricula.cbMotivosSelect(Sender: TObject);
begin

   // Verifica se poderá alterar o Motivo
   if (trim(mmMotivo.Text) <> qyMotivos.FieldByName('ds_valor').AsString) and (trim(mmMotivo.Lines.Text)  <> '') then begin
      FBAlterarMotivo := False;
   end;

   // Se estiver vazio deixa alterar
   if trim(mmMotivo.Lines.Text)  = '' then
      FBAlterarMotivo := true;
   


   // Se foi selecionado um motivo
   if cbMotivos.ItemIndex > 0 then
   begin
      qyMotivos.GotoBookmark(Pointer(cbMotivos.Items.Objects[cbMotivos.ItemIndex]));
      // Se o  motivo preenchido continua sendo igual a situação da caixa de seleção
      if FBAlterarMotivo then begin
        mmMotivo.Clear();
        mmMotivo.Lines.Add(qyMotivos.FieldByName('ds_valor').AsString);
      end;
   end;

   tbSalvar.Enabled :=
      ((Trim(mmMotivo.Lines.Text) <> '') or (not FICodSituacao in [3, 4, 5])) and
      (cbMotivos.ItemIndex > 0) and (cbSituacoes.ItemIndex > -1);


end;

procedure TfRegistraMotivoMatricula.cbSituacoesChange(Sender: TObject);
var
   Bookmark: TBookmark;
   I: Integer;
begin
   I := cbSituacoes.ItemIndex;
   if I <> -1 then
   begin
      Bookmark := TBookmark(cbSituacoes.Items.Objects[I]);
      qySituacoes.GotoBookmark(Bookmark);
      FICodSituacao := qySituacoesCD_SITUACAO.AsInteger;
   end;

   tbSalvar.Enabled :=
      ((Trim(mmMotivo.Lines.Text) <> '') or (not FICodSituacao in [3, 4, 5])) and
      (cbMotivos.ItemIndex > 0) and (cbSituacoes.ItemIndex > -1);
end;

procedure TfRegistraMotivoMatricula.ConfirmaRegistro(Sender: TObject);
var
   LBSucesso: boolean;
begin
   if ((self.FICodSituacao = 3) or (Self.FICodSituacao = 6) or
       (Self.FICodSituacao = 5) or (Self.FICodSituacao = 4))then
   begin
      if (umdtSaida.Date > Now) then
      begin
         Mensagem(
            'Você deve selecionar uma data menor que a data atual!',
            '',
            MB_OK + MB_ICONERROR,
            Handle
         );
         exit;
      end;
   end;

   if (umdtSaidaCurso.Date < umdtSaida.Date) then
   begin
      Mensagem(
         'Você deve selecionar uma data de saída do curso maior ou igual a data de saída da turma!',
         '',
         MB_OK + MB_ICONERROR,
         Handle
      );
      exit;
   end;

   { Verifica a situação da turma que o aluno esta matriculado }
   if ( Self.ICodSituacao in [3,4,5,6,7] ) then
   begin
      Self.RegistraDataSaida;
   end;
   qySituacoes.GotoBookmark(Pointer(cbSituacoes.Items.Objects[cbSituacoes.ItemIndex]));
   Self.atualizaMatriculaCurso;

   LBSucesso :=
      TfRegistraMotivoMatricula.RegistraMotivo(
         DM.iCdPessoaLogado,
         Self.FICodPessoa,
         Self.FIAnoSemestre,
         Self.FICodSituacao,
         Self.FSCodCurso,
         Self.FSCodTurma,
         Self.mmMotivo.Lines.Text,
         Self.FDtRegistro,
         false,
         qyMotivos.FieldByName('cd_situacao').AsInteger
      );

   setObservacaoMotivo(
         DM.iCdPessoaLogado,
         Self.FICodPessoa,
         Self.FIAnoSemestre,
         Self.FICodSituacao,
         Self.FSCodCurso,
         Self.FSCodTurma,
         Self.mmMotivo.Lines.Text,
         Self.FDtRegistro,
         qyMotivos.FieldByName('cd_situacao').AsInteger
   );
   
   Self.ModalResult := mrOk;
   Self.CloseModal;
end;

procedure TfRegistraMotivoMatricula.RegistraDataSaida;
begin
   Self.qyAtuaDataSaida.ParamByName('datasaida').AsString := FormatDateTime('yyyy-mm-dd', umdtSaida.Date);
   Self.qyAtuaDataSaida.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   Self.qyAtuaDataSaida.ParamByName('turma').AsString := Self.FSCodTurma;
   Self.qyAtuaDataSaida.ParamByName('curso').AsString := Self.FSCodCurso;
   Self.qyAtuaDataSaida.ParamByName('codigoaluno').AsInteger := Self.FICodPessoa;
   Self.qyAtuaDataSaida.ExecSQL;
end;

class function TfRegistraMotivoMatricula.RegistraMotivo(const AICodUsuario,
  AICodPessoa, AIAnoSemestre, AICodSituacao: integer; const ASCodCurso,
  ASCodTurma, ASMotivo: string; const ADtRegistro: TDateTime;
  const ABSilencioso: boolean; const AICodMotivo : Integer): boolean;
const
   MSG_ERRO = 'Não foi possível registrar motivo da alteração da situação da matrícula devido a erro:' + #13 + '%s';
var
   LQyRegistraMotivo: TUMZQuery;
begin
   Result := true;
   DM.CriarConsulta(LQyRegistraMotivo);
   try
      LQyRegistraMotivo.SQL.Text := SQL_REGISTRA_MOTIVO;
      LQyRegistraMotivo.ParamCheck := true;
      LQyRegistraMotivo.ParamByName('cd_usuario').AsInteger := AICodUsuario;
      LQyRegistraMotivo.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
      LQyRegistraMotivo.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;
      LQyRegistraMotivo.ParamByName('cd_curso').AsString := ASCodCurso;
      LQyRegistraMotivo.ParamByName('cd_turma').AsString := ASCodTurma;
      LQyRegistraMotivo.ParamByName('dt_registro').AsString := FormatDateTime('yyyy-mm-dd', ADtRegistro);
      LQyRegistraMotivo.ParamByName('cd_situacao').AsInteger := AICodSituacao;
      LQyRegistraMotivo.ParamByName('cd_motivo').AsInteger := AICodMotivo;
      if Trim(ASMotivo) = '' then
         LQyRegistraMotivo.ParamByName('tx_motivo').AsString := MOTIVO_PADRAO
      else
         LQyRegistraMotivo.ParamByName('tx_motivo').AsString := ASMotivo;
      try
         LQyRegistraMotivo.ExecSQL;
      except
         on E: EDatabaseError do
         begin
            if not ABSilencioso then
               Mensagem(Format(MSG_ERRO, [E.Message]), 'ERRO!', MB_ICONERROR);
            Result := false;
         end;
      end;
   finally
      FreeAndNil(LQyRegistraMotivo);
   end;
end;

class function TfRegistraMotivoMatricula.RegistraMotivoMatricula(
  const AICodAluno, AICodSituacao, AIAnoSemestre: integer; const ASCodCurso,
  ASCodTurma: string): boolean;
begin
   Result :=
      TfRegistraMotivoMatricula.RegistraMotivo(
         DM.iCdPessoaLogado, AICodAluno, AIAnoSemestre,
         AICodSituacao, ASCodCurso, ASCodTurma, MOTIVO_PADRAO, DM.DataAtual, true, 0);
end;

procedure TfRegistraMotivoMatricula.setObservacaoMotivo(
   const AICodUsuario,  AICodPessoa, AIAnoSemestre, AICodSituacao: integer;
   const ASCodCurso, ASCodTurma, ASMotivo: string;
   const ADtRegistro: TDateTime;
   const AICodMotivo : Integer);
var
   ds_obs : String;
begin

     Self.qryObservacoes.SQL.Clear;
     Self.qryObservacoes.SQL.Text := ''
     +  ' INSERT INTO uni_observacoes ( '
     +  '  CD_PESSOA, '
     +  '  CD_USUARIO, '
     +  '  DT_OBSERVACAo, '
     +  '  ME_OBSERVACAO, '
     +  '  SG_TIPO, '
     +  '  ME_OBSERVACAO_FORMATADO '
     +  ' ) VALUES ( '
     +  '    :CD_PESSOA,'
     +  '    :CD_USUARIO, '
     +  '    :DT_OBSERVACAO,'
     +  '    :ME_OBSERVACAO,'
     +  '    :SG_TIPO, '
     +  '    :ME_OBSERVACAO_FORMATADO )';
     

   ds_obs := ASMotivo
             + #13
             + '[Registro gerado a partir do Cadastro de Motivos da Planilha de Matrículas]'
             + #13;
   Self.qryObservacoes.ParamByName('CD_PESSOA').AsInteger := AICodPessoa ;
   Self.qryObservacoes.ParamByName('CD_USUARIO').AsInteger := AICodUsuario;
   Self.qryObservacoes.ParamByName('DT_OBSERVACAO').AsString := FormatDateTime('yyyy-mm-dd HH:mm:ss', Now);
   Self.qryObservacoes.ParamByName('ME_OBSERVACAO').AsString := ds_obs;
   Self.qryObservacoes.ParamByName('SG_TIPO').AsString := 'M';
   Self.qryObservacoes.ParamByName('ME_OBSERVACAO_FORMATADO').AsString := ds_obs;

   Self.qryObservacoes.ExecSQL;
end;

class function TfRegistraMotivoMatricula.RegistraMotivoMatricula(
  const AICodAluno, AICodSituacao, AIAnoSemestre: integer; const ASNomeAluno,
  ASCodCurso, ASCodTurma: string; AOwner: TComponent): boolean;
begin
   if not Assigned(fRegistraMotivoMatricula) then
      fRegistraMotivoMatricula :=
         TfRegistraMotivoMatricula.Create(AICodAluno, AICodSituacao, AIAnoSemestre,
            ASNomeAluno, ASCodCurso, ASCodTurma, AOwner);
   try
      Result := (fRegistraMotivoMatricula.ShowModal = mrOk);
   finally
      FreeAndNil(fRegistraMotivoMatricula);
   end;
end;

end.
