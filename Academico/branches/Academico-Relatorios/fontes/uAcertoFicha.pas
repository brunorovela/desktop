unit uAcertoFicha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, DB,General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, ZConnection, uDMDiario, Menus, ImgList,
  Buttons, ZSqlUpdate;

type
  TfrmAcertoFicha = class(TForm)
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel7: TBevel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    Bevel6: TBevel;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    lblSigla: TLabel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel4: TBevel;
    pnNotas: TPanel;
    pnTitulo: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    pnAvaliacao2: TPanel;
    lbAvaliacao1: TLabel;
    dbAvaliacao_2: TDBEdit;
    dbFalta2: TDBEdit;
    pnAvaliacao3: TPanel;
    Label8: TLabel;
    dbAvaliacao_3: TDBEdit;
    dbFalta3: TDBEdit;
    pnAvaliacao4: TPanel;
    Label9: TLabel;
    dbAvaliacao_4: TDBEdit;
    dbFalta4: TDBEdit;
    pnAvaliacao5: TPanel;
    Label10: TLabel;
    dbAvaliacao_5: TDBEdit;
    dbFalta5: TDBEdit;
    pnAvaliacao6: TPanel;
    Label11: TLabel;
    dbAvaliacao_6: TDBEdit;
    dbFalta6: TDBEdit;
    pnAvaliacao7: TPanel;
    Label12: TLabel;
    dbAvaliacao_7: TDBEdit;
    dbFalta7: TDBEdit;
    pnAvaliacao8: TPanel;
    Label17: TLabel;
    dbAvaliacao_8: TDBEdit;
    dbFalta8: TDBEdit;
    pnAvaliacao1: TPanel;
    Label18: TLabel;
    dbAvaliacao_1: TDBEdit;
    dbFalta1: TDBEdit;
    pnAvaliacao9: TPanel;
    Label19: TLabel;
    dbAvaliacao_9: TDBEdit;
    dbFalta9: TDBEdit;
    pnAvaliacao10: TPanel;
    Label20: TLabel;
    dbAvaliacao_10: TDBEdit;
    dbFalta10: TDBEdit;
    pnExame: TPanel;
    lbExame: TLabel;
    dbExame: TDBEdit;
    lbSegunda: TLabel;
    dbSegunda: TDBEdit;
    Bevel1: TBevel;
    pnAproveita: TPanel;
    DBCheckBox1: TDBCheckBox;
    pnBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    btnFechar: TButton;
    Bevel8: TBevel;
    pnMedia: TPanel;
    Bevel12: TBevel;
    Label21: TLabel;
    lblMediaFinalConceito: TLabel;
    txtMF: TDBEdit;
    Bevel9: TBevel;
    Panel2: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    lblAluno: TLabel;
    DBEdit4: TDBEdit;
    pnSituacao: TPanel;
    Label13: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dbExame1: TDBEdit;
    lbExameBi: TLabel;
    dbExame2: TDBEdit;
    dbExame3: TDBEdit;
    dbExame4: TDBEdit;
    dbExame5: TDBEdit;
    dbExame6: TDBEdit;
    dbExame7: TDBEdit;
    dbExame8: TDBEdit;
    dbExame9: TDBEdit;
    dbExame10: TDBEdit;
    Label14: TLabel;
    dbDefinitiva1: TDBEdit;
    dbDefinitiva2: TDBEdit;
    dbDefinitiva3: TDBEdit;
    dbDefinitiva4: TDBEdit;
    dbDefinitiva5: TDBEdit;
    dbDefinitiva6: TDBEdit;
    dbDefinitiva7: TDBEdit;
    dbDefinitiva8: TDBEdit;
    dbDefinitiva9: TDBEdit;
    dbDefinitiva10: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    dbFaltouExame: TDBCheckBox;
    dbFaltou2Epoca: TDBCheckBox;
    blEtapa1: TBevel;
    blEtapa2: TBevel;
    blEtapa3: TBevel;
    blEtapa4: TBevel;
    blEtapa5: TBevel;
    blEtapa6: TBevel;
    blEtapa7: TBevel;
    blEtapa8: TBevel;
    blEtapa9: TBevel;
    blEtapa10: TBevel;
    sbBloqEtapa1: TSpeedButton;
    pmBloqueios012: TPopupMenu;
    miDesbloqueada: TMenuItem;
    miBloqueada: TMenuItem;
    miDigitadaManualmente: TMenuItem;
    sbBloqEtapa2: TSpeedButton;
    sbBloqEtapa3: TSpeedButton;
    sbBloqEtapa4: TSpeedButton;
    sbBloqEtapa5: TSpeedButton;
    sbBloqEtapa6: TSpeedButton;
    sbBloqEtapa7: TSpeedButton;
    sbBloqEtapa8: TSpeedButton;
    sbBloqEtapa9: TSpeedButton;
    sbBloqEtapa10: TSpeedButton;
    qyBloquearEtapa: TUMZQuery;
    pnMediaCurso: TPanel;
    Bevel22: TBevel;
    Label16: TLabel;
    sbBloqMediaCurso: TSpeedButton;
    qyMediaFinalCurso: TUMZQuery;
    txtMFC: TDBEdit;
    updMediaFinalCurso: TZUpdateSQL;
    dsMediaFinalCurso: TDataSource;
    qyMediaFinalCursonr_media_curso: TFloatField;
    qyMediaFinalCursocd_matricula_curso: TLargeintField;
    qyMediaFinalCursosn_bloqueio_nr_media_curso: TSmallintField;
    pmBloqueios02: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    Panel4: TPanel;
    Bevel2: TBevel;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    qyAtualizarDtSaida: TUMZQuery;
    sbBloqFaltas1: TSpeedButton;
    sbBloqFaltas2: TSpeedButton;
    sbBloqFaltas3: TSpeedButton;
    sbBloqFaltas4: TSpeedButton;
    sbBloqFaltas5: TSpeedButton;
    sbBloqFaltas6: TSpeedButton;
    sbBloqFaltas7: TSpeedButton;
    sbBloqFaltas8: TSpeedButton;
    sbBloqFaltas9: TSpeedButton;
    sbBloqFaltas10: TSpeedButton;
    pmBloqueios01: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    sbBloqExame: TSpeedButton;
    sbBloqSegundaEpoca: TSpeedButton;
    cbDispensadoDefinitivo1: TCheckBox;
    cbDispensadoDefinitivo2: TCheckBox;
    cbDispensadoDefinitivo3: TCheckBox;
    cbDispensadoDefinitivo4: TCheckBox;
    cbDispensadoDefinitivo5: TCheckBox;
    cbDispensadoDefinitivo6: TCheckBox;
    cbDispensadoDefinitivo7: TCheckBox;
    cbDispensadoDefinitivo8: TCheckBox;
    cbDispensadoDefinitivo9: TCheckBox;
    cbDispensadoDefinitivo10: TCheckBox;
    pnMediaAnual: TPanel;
    Bevel13: TBevel;
    Label22: TLabel;
    txtMA: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    qryAulasJustificadas: TUMZQuery;
    edFaltaJustificada1: TEdit;
    edFaltaInjustificada1: TEdit;
    qryParametroFaltaJustificada: TUMZQuery;
    qryParametroFaltaJustificadasn_faltas_justificadas: TSmallintField;
    qryAulasJustificadasnr_etapa: TIntegerField;
    qryAulasJustificadasnr_faltas: TIntegerField;
    edFaltaInjustificada2: TEdit;
    edFaltaJustificada3: TEdit;
    edFaltaInjustificada3: TEdit;
    edFaltaJustificada2: TEdit;
    edFaltaJustificada4: TEdit;
    edFaltaInjustificada4: TEdit;
    edFaltaJustificada5: TEdit;
    edFaltaInjustificada5: TEdit;
    edFaltaJustificada7: TEdit;
    edFaltaInjustificada7: TEdit;
    edFaltaJustificada6: TEdit;
    edFaltaInjustificada6: TEdit;
    edFaltaJustificada8: TEdit;
    edFaltaInjustificada8: TEdit;
    edFaltaJustificada9: TEdit;
    edFaltaInjustificada9: TEdit;
    edFaltaJustificada10: TEdit;
    edFaltaInjustificada10: TEdit;
    qrySalvarFaltasJustificadas: TUMZQuery;
    procedure edFaltaAtualizarTotalExit(Sender: TObject);
    procedure txtMFEnter(Sender: TObject);
    procedure dbAvaliacao_1Enter(Sender: TObject);
    procedure txtMFKeyPress(Sender: TObject; var Key: Char);
    procedure qyMediaFinalCursonr_media_cursoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cbDispensado1Click(Sender: TObject);
    procedure sbBloqFaltas1Click(Sender: TObject);
    procedure miClick(Sender: TObject);
    procedure sbBloqEtapaClick(Sender: TObject);
    procedure dbAvaliacao_1Exit(Sender: TObject);
    procedure dbFaltouExameClick(Sender: TObject);
    procedure dbFaltou2EpocaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbBloqueadoFreq_1Click(Sender: TObject);
    procedure dbBloqueado_1Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbAvaliacao_1KeyPress(Sender: TObject; var Key: Char);
    procedure dbAvaliacao_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbFalta1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbFalta1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    sbBloqueio: TSpeedButton;

    nota : ARRAY [1..10] of Double;
    notad : ARRAY [1..10] of Double;
    falta : ARRAY [1..10] of Double;
    exame : ARRAY [1..10] of Double;
    exameFinal, mediaFinal, segundaEpoca, frequencia : Double;
    situacao : integer;
    aproveitamento : string;
    procedure atualizarTotalFaltas(etapa: Integer);

    procedure OnSaveMediaFinal(Sender: TDBEdit; value: String);

  public
    procedure get_nomenclatura_parametros_avaliacao();

  end;



implementation

uses uDM, uFichaIndividual, uUsuario, uAvaliacoesConceitos;

{$R *.DFM}

procedure TfrmAcertoFicha.btnFecharClick(Sender: TObject);
begin
  if DM.tblFichaIndividual.State in [dsInsert,dsEdit] then DM.tblFichaIndividual.Cancel;
  Close;
end;

procedure TfrmAcertoFicha.cbDispensado1Click(Sender: TObject);
var
   nomeCampo, nomeCampoDefinitivo: String;
begin
   nomeCampo := 'Nota' + StringReplace(TCheckBox(Sender).Name, 'cbDispensadoDefinitivo', '', [rfIgnoreCase]);
   nomeCampoDefinitivo := 'Nota_d' + StringReplace(TCheckBox(Sender).Name, 'cbDispensadoDefinitivo', '', [rfIgnoreCase]);

   DM.tblFichaIndividual.Edit;
   if TCheckBox(Sender).Checked then
   begin
      DM.tblFichaIndividual.FieldByName(nomeCampo).AsFloat := -1;
      DM.tblFichaIndividual.FieldByName(nomeCampoDefinitivo).AsFloat := -1;
   end else begin
      if DM.tblFichaIndividual.FieldByName(nomeCampo).OldValue >= 0 then
      begin
         DM.tblFichaIndividual.FieldByName(nomeCampo).AsFloat := DM.tblFichaIndividual.FieldByName(nomeCampo).OldValue;
      end else begin
         DM.tblFichaIndividual.FieldByName(nomeCampo).Clear;
      end;

      if DM.tblFichaIndividual.FieldByName(nomeCampoDefinitivo).OldValue >= 0 then
      begin
         DM.tblFichaIndividual.FieldByName(nomeCampoDefinitivo).AsFloat := DM.tblFichaIndividual.FieldByName(nomeCampoDefinitivo).OldValue;
      end else begin
         DM.tblFichaIndividual.FieldByName(nomeCampoDefinitivo).Clear;
      end;
   end;
end;

procedure TfrmAcertoFicha.btnConfirmarClick(Sender: TObject);
var
  etapas_bloqueadas, log, logDesc : string;
  chaves : string;
  n, atividade, I : Integer;
  faltasParaNular : TStringList;
  sn_etapa_bloqueada: Boolean;
begin

   if qyMediaFinalCurso.State in [dsInsert,dsEdit] then
   Begin
      qyMediaFinalCurso.Post;

      if DM.tblAvaliacao.FieldByName('sn_usar_media_curso').AsInteger > 0 then
      begin

        if TDBEdit(FindComponent('txtMFC')).Modified then
        begin
            qyBloquearEtapa.SQL.Text := ''+
            ' UPDATE ' +
            '     fichaindividual f ' +
            '	   INNER JOIN matriculas m ON (m.anosemestre = f.anosemestre AND m.turma = f.turmamatricula AND m.codigoaluno = f.codigoaluno) ' +
            '     INNER JOIN matriculas_curso mc ON (m.cd_matricula_curso = mc.cd_matricula_curso) ' +
            ' SET ' +
            '     mc.sn_bloqueio_nr_media_curso = 2 ' +
            ' WHERE '+
            '     f.codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString +
            '     AND f.anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString +
            '     AND f.turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"' +
            '     AND f.disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString +
            '     AND mc.sn_bloqueio_nr_media_curso = 0';

            qyBloquearEtapa.ExecSQL;
        end;

      end;
  end;

  if DM.tblFichaIndividual.State in [dsInsert,dsEdit] then
  Begin
     faltasParaNular := TStringList.Create;

     for I := 1 to 10 do
     begin
        if (FindComponent('dbFalta' + IntToStr(I)) = nil) OR
           (FindComponent('pnAvaliacao' + IntToStr(I)) = nil) OR
           NOT(TPanel(FindComponent('pnAvaliacao' + IntToStr(I))).Visible) then
        begin
           Break;
        end;

        if TDBEdit(FindComponent('dbFalta' + IntToStr(I))).Modified AND
           (TDBEdit(FindComponent('dbFalta' + IntToStr(I))).Text = '') then
        begin
           faltasParaNular.Add(IntToStr(I));
        end;
     end;

     // Copia o campo mediafinal para o campo ds_media
     if DM.tblAvaliacaosn_conceitos.AsString <> 'S' then
     begin
        DM.tblFichaIndividualds_media.AsString := txtMF.Text;
     end;

     DM.tblFichaIndividual.Post;

     // Se estiver utilizando faltas justificadas, salva a informação de falta justificada na base
     if qryParametroFaltaJustificada.FieldByName('sn_faltas_justificadas').AsInteger = 1 then
     begin
         for n := DM.tblAvaliacao.FieldByName('NR_AVALIACOES').AsInteger DOWNTO 1 do
         begin
            // Atualiza as faltas justificadas informadas
            qrySalvarFaltasJustificadas.ParamByName('nr_anosemestre').AsInteger := DM.tblFichaIndividualAnoSemestre.AsInteger;
            qrySalvarFaltasJustificadas.ParamByName('cd_turma').AsString := DM.tblFichaIndividualTurma.AsString;
            qrySalvarFaltasJustificadas.ParamByName('cd_pessoa').AsInteger := DM.tblFichaIndividualCodigoAluno.AsInteger;
            qrySalvarFaltasJustificadas.ParamByName('cd_disciplina').AsInteger := DM.tblFichaIndividualdisciplina.AsInteger;
            qrySalvarFaltasJustificadas.ParamByName('nr_serie').AsInteger := DM.tblFichaIndividualSerie.AsInteger;
            qrySalvarFaltasJustificadas.ParamByName('nr_etapa').AsInteger := n;
            qrySalvarFaltasJustificadas.ParamByName('nr_faltas').AsInteger := 0;
            if (TEdit(FindComponent('edFaltaJustificada' + IntToStr(n))).Text <> '') then
            begin
               qrySalvarFaltasJustificadas.ParamByName('nr_faltas').AsInteger := StrToInt(TEdit(FindComponent('edFaltaJustificada' + IntToStr(n))).Text);
            end;
            qrySalvarFaltasJustificadas.ExecSQL;
         end;
     end;

     for I := 0 to faltasParaNular.Count - 1 do
     begin
         DM.ZerarFaltaEtapaAluno(
            StrToInt(faltasParaNular[I]),
            DM.tblFichaIndividualAnoSemestre.AsInteger,
            DM.tblFichaIndividualTurma.AsString,
            DM.tblFichaIndividualdisciplina.AsInteger,
            DM.tblFichaIndividualCodigoAluno.AsInteger
         );
     end;

     // Atualização do campo de data de saída na fichaindividual, caso situação for 3, 4, 5 ou 6 (cancelamento, trancamento, desistência ou abandono)
     qyAtualizarDtSaida.Close;
     qyAtualizarDtSaida.ParamByName('codigoaluno').AsInteger := frmFichaIndividual.tblFichaCodigoAluno.AsInteger;
     qyAtualizarDtSaida.ParamByName('turma').AsString        := frmFichaIndividual.tblFichaTurma.AsString;
     qyAtualizarDtSaida.ParamByName('anosemestre').AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
     qyAtualizarDtSaida.ParamByName('Disciplina').AsInteger  := frmFichaIndividual.tblFichadisciplina.AsInteger;
     qyAtualizarDtSaida.ExecSQL;

     // Bloqueia as etapas que o usuário modificou as notas
     etapas_bloqueadas := '';
     sn_etapa_bloqueada := False;
     for n := DM.tblAvaliacao.FieldByName('NR_AVALIACOES').AsInteger DOWNTO 1 do
     begin

         if TDBEdit(FindComponent('dbAvaliacao_' + IntToStr(n))).Modified or
            TDBEdit(FindComponent('dbDefinitiva' + IntToStr(n))).Modified then begin

               qyBloquearEtapa.SQL.Text := 'UPDATE fichaindividual SET sn_bloqueado'+IntToStr(n)+' = 2 WHERE '+
                                           ' codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString+
                                           ' AND anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString+
                                           ' AND turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"'+
                                           ' AND disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString+
                                           ' AND sn_bloqueado'+IntToStr(n)+' = 0';

               qyBloquearEtapa.ExecSQL;

               sn_etapa_bloqueada := True;
               etapas_bloqueadas := etapas_bloqueadas + IntToStr(n) + ', ';

         end;

     end;

     chaves := DM.tblFichaIndividual.FieldByName('codigoaluno').AsString + ';' +
               DM.tblFichaIndividual.FieldByName('anosemestre').AsString + ';' +
               DM.tblFichaIndividual.FieldByName('turma').AsString + ';' +
               DM.tblFichaIndividual.FieldByName('disciplina').AsString + ';';

     log := '';

     for n:= 1 to 10 do begin

        if DM.tblFichaIndividual.FieldByName('Nota' + IntToStr(n)).AsFloat <> Nota[n] then
           log := log + 'Nota '+ IntToStr(n) +  ': ['+FloatToStr(Nota[n])+'] => ['+DM.tblFichaIndividual.FieldByName('Nota' + IntToStr(n)).AsString+'].'+chr(13);
        if DM.tblFichaIndividual.FieldByName('Falta' + IntToStr(n)).AsFloat <> Falta[n] then
           log := log + 'Falta '+ IntToStr(n) + ': ['+FloatToStr(Falta[n])+'] => ['+DM.tblFichaIndividual.FieldByName('Falta' + IntToStr(n)).AsString+'].'+chr(13);
        if DM.tblFichaIndividual.FieldByName('Exame' + IntToStr(n)).AsFloat <> Exame[n] then
           log := log + 'Exame '+ IntToStr(n) + ': ['+FloatToStr(Exame[n])+'] => ['+DM.tblFichaIndividual.FieldByName('Exame' + IntToStr(n)).AsString+'].'+chr(13);
        if DM.tblFichaIndividual.FieldByName('nota_d' + IntToStr(n)).AsFloat <> notad[n] then
           log := log + 'Nota Def. ' + IntToStr(n) + ': ['+FloatToStr(notad[n])+'] => ['+DM.tblFichaIndividual.FieldByName('nota_d' + IntToStr(n)).AsString+'].'+chr(13);

     end;

     atividade := 0;
     logDesc := '';
     logDesc := logDesc + 'Aluno: '+DM.tblFichaIndividual.FieldByName('codigoaluno').AsString+', ';

     if DM.tblFichaIndividual.FieldByName('NotaExame').AsFloat <> exameFinal then
       log := log + 'Exame Final: ['+FloatToStr(exameFinal)+'] => ['+DM.tblFichaIndividual.FieldByName('NotaExame').AsString+'].'+chr(13);

     if DM.tblFichaIndividual.FieldByName('NotaExame').AsFloat <> exameFinal then begin
         logDesc := logDesc + 'Nota: '+DM.tblFichaIndividual.FieldByName('NotaExame').AsString+', ';
         atividade := uDMDiario.ATIVIDADE_EXAME;
     end;

     if DM.tblFichaIndividual.FieldByName('MediaFinal').AsFloat <> mediaFinal then
       log := log + 'Média Final: ['+FloatToStr(mediaFinal)+'] => ['+DM.tblFichaIndividual.FieldByName('MediaFinal').AsString+'].'+chr(13);

     if DM.tblFichaIndividual.FieldByName('MediaFinal').AsFloat <> mediaFinal then begin
         logDesc := logDesc + 'Ajuste na média final: '+DM.tblFichaIndividual.FieldByName('MediaFinal').AsString+', ';
         atividade := uDMDiario.ATIVIDADE_MEDIA;
     end;

     if DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsFloat <> segundaEpoca then
       log := log + 'Segunda Época: ['+FloatToStr(segundaEpoca)+'] => ['+DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsString+'].'+chr(13);

     if DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsFloat <> segundaEpoca then begin
         logDesc := logDesc + 'Nota: '+DM.tblFichaIndividual.FieldByName('Segunda_Epoca').AsString+', ';
         atividade := uDMDiario.ATIVIDADE_SEGUNDA_EPOCA;
     end;

     if DM.tblFichaIndividual.FieldByName('Frequencia').AsFloat <> frequencia then
       log := log + 'Freqüência: ['+FloatToStr(frequencia)+'] => ['+DM.tblFichaIndividual.FieldByName('Frequencia').AsString+'].'+chr(13);

     if DM.tblFichaIndividual.FieldByName('Situacao').AsInteger <> situacao then
       log := log + 'Situação: ['+IntToStr(situacao)+'] => ['+DM.tblFichaIndividual.FieldByName('Situacao').AsString+'].'+chr(13);
     if DM.tblFichaIndividual.FieldByName('Aproveitamento').AsString <> aproveitamento then
       log := log + 'Média Congelada: ['+aproveitamento+'] => ['+DM.tblFichaIndividual.FieldByName('Aproveitamento').AsString+'].'+chr(13);

     logDesc := logDesc + 'Anosemestre: '+DM.tblFichaIndividual.FieldByName('anosemestre').AsString+', ';
     logDesc := logDesc + 'Turma: '+DM.tblFichaIndividual.FieldByName('turma').AsString+', ';
     logDesc := logDesc + 'Disciplina: '+ DM.tblFichaIndividual.FieldByName('disciplina').AsString+' [Acadêmico]';

     if atividade <> 0 then begin
        { Insere log de alteração de nota de exame }
        DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, atividade, logDesc, DM.iCdPessoaLogado);
     end;

     DM.gerar_log(9, log, DM.iCdPessoaLogado, chaves);

     if (sn_etapa_bloqueada = True) then
     begin
        DM.gerar_log(9, 'Bloqueada(s) a(s) etapa(s): ' + etapas_bloqueadas, DM.iCdPessoaLogado, chaves);
     end;

  end;

 Close;
end;

procedure TfrmAcertoFicha.btnCancelarClick(Sender: TObject);
begin
  if DM.tblFichaIndividual.State in [dsInsert,dsEdit] then DM.tblFichaIndividual.Cancel;
  Close;
end;

procedure TfrmAcertoFicha.FormShow(Sender: TObject);
const
   VALOR_NOTA_ALUNO_DISPENSADO = -1;
var
  n : Integer;
  altura, largura : Integer;
  faltasInjustificadas : Integer;
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   txtMF.DataField := 'MediaFinal';
   pnTitulo.Visible := True;
   lblMediaFinalConceito.Caption := 'Média Final';

   Label3.Visible := DM.UsaAnosemestre;
   DBText3.Visible := DM.UsaAnosemestre;

   Dm.tblAvaliacao.Close;
   DM.tblAvaliacao.ParamByName('Turma').AsString := frmFichaIndividual.tblFichaTurma.Asstring;
   DM.tblAvaliacao.ParamByName('AnoSemestre').AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
   Dm.tblAvaliacao.Open;

   { Altera o nome a descricao do tipo de avalicao }
   get_nomenclatura_parametros_avaliacao();
   { Altera o nome a descricao do tipo de avalicao }

   DM.tblSituacoes.Close;
   Dm.tblSituacoes.Open;

   DM.tblFichaIndividual.Close;
   DM.tblFichaIndividual.SQL.Clear;
   DM.tblFichaIndividual.SQL.Add( 'SELECT * FROM FICHAINDIVIDUAL WHERE' );
   DM.tblFichaIndividual.SQL.Add( 'TURMA = :TURMA AND' );
   DM.tblFichaIndividual.SQL.Add( 'ANOSEMESTRE = :ANOSEMESTRE AND' );

   DM.tblFichaIndividual.SQL.Add( 'CODIGOALUNO = :CODIGOALUNO AND' );
   DM.tblFichaIndividual.ParamByName('CODIGOALUNO').AsInteger := frmFichaIndividual.tblFichaCodigoAluno.AsInteger;

   DM.tblFichaIndividual.SQL.Add( 'DISCIPLINA = :DISCIPLINA AND' );
   DM.tblFichaIndividual.ParamByName('DISCIPLINA').AsInteger := frmFichaIndividual.tblFichaDisciplina.AsInteger;

   DM.tblFichaIndividual.SQL.Add('TURMAMATRICULA = :TURMAMATRICULA');
   DM.tblFichaIndividual.ParamByName('TURMAMATRICULA').AsString := frmFichaIndividual.tblFichaTurmaMatricula.AsString;

   lblAluno.Caption := frmFichaIndividual.tblFichaNome.AsString;
   lblSigla.Caption := frmFichaIndividual.tblFichaSigla.AsString;

   DM.tblFichaIndividual.ParamByName('ANOSEMESTRE').AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
   DM.tblFichaIndividual.ParamByName('TURMA').AsString := frmFichaIndividual.tblFichaTurma.Asstring;
   DM.tblFichaIndividual.Open;

   cbDispensadoDefinitivo1.Checked := DM.tblFichaIndividualnota_d1.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo2.Checked := DM.tblFichaIndividualnota_d2.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo3.Checked := DM.tblFichaIndividualnota_d3.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo4.Checked := DM.tblFichaIndividualnota_d4.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo5.Checked := DM.tblFichaIndividualnota_d5.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo6.Checked := DM.tblFichaIndividualnota_d6.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo7.Checked := DM.tblFichaIndividualnota_d7.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo8.Checked := DM.tblFichaIndividualnota_d8.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo9.Checked := DM.tblFichaIndividualnota_d9.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;
   cbDispensadoDefinitivo10.Checked := DM.tblFichaIndividualnota_d10.AsFloat = VALOR_NOTA_ALUNO_DISPENSADO;

   qryParametroFaltaJustificada.Close;
   qryParametroFaltaJustificada.ParamByName('nr_anosemestre').AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
   qryParametroFaltaJustificada.ParamByName('cd_turma').AsString := frmFichaIndividual.tblFichaTurma.AsString;
   qryParametroFaltaJustificada.ParamByName('cd_disciplina').AsInteger := frmFichaIndividual.tblFichadisciplina.AsInteger;
   qryParametroFaltaJustificada.Open;

   qyMediaFinalCurso.ParamByName('codigoaluno').AsInteger := frmFichaIndividual.tblFichaCodigoAluno.AsInteger;
   qyMediaFinalCurso.ParamByName('anosemestre').AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
   qyMediaFinalCurso.ParamByName('turma').AsString := frmFichaIndividual.tblFichaTurma.Asstring;
   qyMediaFinalCurso.ParamByName('disciplina').AsInteger := frmFichaIndividual.tblFichaDisciplina.AsInteger;
   qyMediaFinalCurso.Open;

   // Tamanho height inicial da tela
   altura := 770;
   largura := 830;

   // Se não tiver exame e segunda época desativa o painel para informações dos dois
   if not Dm.isTrue(Dm.tblAvaliacao.FieldByName('SN_EXAME').AsString) and
      not Dm.isTrue(Dm.tblAvaliacao.FieldByName('SN_SEGUNDA_EPOCA').AsString) Then
   Begin
      pnExame.Visible := False;
      altura := altura - 75;
   end;

   // Caso não tenha Segunda Época
   if not Dm.isTrue(Dm.tblAvaliacao.FieldByName('SN_EXAME').AsString) Then
   Begin
      dbExame.Visible := False;
      lbExame.Visible := False;
      dbFaltouExame.Visible := False;
      sbBloqExame.Visible := False;
   end else begin
      if DM.tblFichaIndividual.FieldByName('sn_bloqueio_nota_exame').AsInteger = 0 then begin
         TSpeedButton(FindComponent('sbBloqExame')).Glyph := miDesbloqueada.Bitmap;
      end else begin
         TSpeedButton(FindComponent('sbBloqExame')).Glyph := miBloqueada.Bitmap;
      end;
   end;

   // Caso não tenha Exame
   if not Dm.isTrue(Dm.tblAvaliacao.FieldByName('SN_SEGUNDA_EPOCA').AsString) Then
   Begin
      dbSegunda.Visible := False;
      lbSegunda.Visible := False;
      dbFaltou2Epoca.Visible := False;
      sbBloqSegundaEpoca.Visible := False;
   end else begin
      if DM.tblFichaIndividual.FieldByName('sn_bloqueio_2epoca').AsInteger = 0 then begin
         TSpeedButton(FindComponent('sbBloqSegundaEpoca')).Glyph := miDesbloqueada.Bitmap;
      end else begin
         TSpeedButton(FindComponent('sbBloqSegundaEpoca')).Glyph := miBloqueada.Bitmap;
      end;
   end;

   // Verifica se bloqueia o campo para digitação da nota e falta do exame / segunda época
   dbExame.Enabled := (not dbFaltouExame.Checked) and (DM.tblFichaIndividual.FieldByName('sn_bloqueio_nota_exame').AsInteger = 0);
   dbFaltouExame.Enabled := (DM.tblFichaIndividual.FieldByName('sn_bloqueio_nota_exame').AsInteger = 0);
   dbSegunda.Enabled := (not dbFaltou2Epoca.Checked) and (DM.tblFichaIndividual.FieldByName('sn_bloqueio_2epoca').AsInteger = 0);
   dbFaltou2Epoca.Enabled := (DM.tblFichaIndividual.FieldByName('sn_bloqueio_2epoca').AsInteger = 0);

   // Desativa informação de Recuperação da Etapa se cliente não utilizar
   if (DM.tblAvaliacao.FieldByName('sn_recuperacao').AsString <> 'S') or
      (DM.tblAvaliacao.FieldByName('sn_diario_online').AsInteger = 1) then
   begin
      lbExameBi.Visible := False;
      Label14.Left := Label14.Left - 71; // Desloca o elemento do lado direto para a esquerda a fim de ocupar o espaço que ficou vago
      Label7.Left := Label7.Left - 71; // Desloca o elemento do lado direto para a esquerda a fim de ocupar o espaço que ficou vago
      largura := largura - 50; // Diminui o tamanho da tela
   end;

   if DM.tblAvaliacao.FieldByName('NR_AVALIACOES').AsInteger > 0 Then
   Begin
      for n:= 1 to 10 do begin

         if (n > DM.tblAvaliacao.FieldByName('NR_AVALIACOES').AsInteger) OR
            (
               (DM.tblAvaliacaosn_notas.AsString <> 'S') AND
               (DM.tblAvaliacaosn_conceitos_parciais.AsString <> 'S') AND
               (DM.tblAvaliacaosn_conceitos.AsString = 'S')
            ) then
         begin
            altura := altura - 27;
            TPanel(FindComponent('pnAvaliacao' + IntToStr(n))).Visible := False;
            Continue;
         end;

         if (DM.tblAvaliacao.FieldByName('sn_recuperacao').AsString <> 'S') or
            (DM.tblAvaliacao.FieldByName('sn_diario_online').AsInteger = 1) then
         begin
            TDBEdit(FindComponent('dbExame' + IntToStr(n))).Visible := False;
            // Desloca os elementos do lado direto para a esquerda a fim de ocupar o espaço que ficou vago
            TDBEdit(FindComponent('dbDefinitiva' + IntToStr(n))).Left := TDBEdit(FindComponent('dbDefinitiva' + IntToStr(n))).Left - 71;
            TCheckBox(FindComponent('cbDispensadoDefinitivo' + IntToStr(n))).Left := TCheckBox(FindComponent('cbDispensadoDefinitivo' + IntToStr(n))).Left - 71;
            TBevel(FindComponent('blEtapa' + IntToStr(n))).Left := TBevel(FindComponent('blEtapa' + IntToStr(n))).Left - 71;
            TSpeedButton(FindComponent('sbBloqFaltas' + IntToStr(n))).Left := TSpeedButton(FindComponent('sbBloqFaltas' + IntToStr(n))).Left - 71;
            TDBEdit(FindComponent('dbFalta' + IntToStr(n))).Left := TDBEdit(FindComponent('dbFalta' + IntToStr(n))).Left - 71;
         end;

         if DM.tblFichaIndividual.FieldByName('sn_bloqueado'+IntToStr(n)).AsInteger = 0 then begin
            TSpeedButton(FindComponent('sbBloqEtapa' + IntToStr(n))).Glyph := miDesbloqueada.Bitmap;
         end else if DM.tblFichaIndividual.FieldByName('sn_bloqueado'+IntToStr(n)).AsInteger = 1 then begin
            TSpeedButton(FindComponent('sbBloqEtapa' + IntToStr(n))).Glyph := miBloqueada.Bitmap;
         end else begin
            TSpeedButton(FindComponent('sbBloqEtapa' + IntToStr(n))).Glyph := miDigitadaManualmente.Bitmap;
         end;

         TDBEdit(FindComponent('dbAvaliacao_' + IntToStr(n))).Enabled := DM.tblFichaIndividual.FieldByName('sn_bloqueado'+IntToStr(n)).AsInteger = 0;
         TDBEdit(FindComponent('dbFalta' + IntToStr(n))).Enabled := DM.tblFichaIndividual.FieldByName('sn_bloq_freq'+IntToStr(n)).AsInteger = 0;

         if TDBEdit(FindComponent('dbFalta' + IntToStr(n))).Enabled then
         begin
            TSpeedButton(FindComponent('sbBloqFaltas' + IntToStr(n))).Glyph := miDesbloqueada.Bitmap;
         end else begin
            TSpeedButton(FindComponent('sbBloqFaltas' + IntToStr(n))).Glyph := miBloqueada.Bitmap;
         end;

         // Verifica se o parametro de avaliação da turma NÃO utiliza diário online
         if DM.tblAvaliacao.FieldByName('sn_diario_online').AsInteger = 0 then
         begin
            // Caso não utiliza diário online, abre o campo para digitação da RE sempre
            TDBEdit(FindComponent('dbExame' + IntToStr(n))).Enabled := True;
         end else begin
            // Caso utiliza diário online, verifica bloqueio
            TDBEdit(FindComponent('dbExame' + IntToStr(n))).Enabled := DM.tblFichaIndividual.FieldByName('sn_bloqueado'+IntToStr(n)).AsInteger = 0;
         end;

         TDBEdit(FindComponent('dbDefinitiva' + IntToStr(n))).Enabled := DM.tblFichaIndividual.FieldByName('sn_bloqueado'+IntToStr(n)).AsInteger = 0;

      end;

      if (DM.tblAvaliacaosn_notas.AsString <> 'S') AND
         (DM.tblAvaliacaosn_conceitos_parciais.AsString <> 'S') AND
         (DM.tblAvaliacaosn_conceitos.AsString = 'S') then
      begin
         lblMediaFinalConceito.Caption := 'Conceito';
         txtMF.DataField := 'ds_media';
         pnTitulo.Visible := False;
      end;
   end else begin
      pnMedia.visible := False;
      pnMediaAnual.Visible := false;
      altura := altura - 120;
   end;

   // Esconde a informação de média final do aluno no curso caso não utilize
   if DM.tblAvaliacao.FieldByName('sn_usar_media_curso').AsInteger <> 1 then
   begin
      pnMediaCurso.visible := False;
      altura := altura - 60;
   end else begin
      if qyMediaFinalCurso.FieldByName('sn_bloqueio_nr_media_curso').AsInteger = 0 then begin
         TSpeedButton(FindComponent('sbBloqMediaCurso')).Glyph := miDesbloqueada.Bitmap;
      end else begin
         TSpeedButton(FindComponent('sbBloqMediaCurso')).Glyph := miDigitadaManualmente.Bitmap;
      end;
   end;

   if qryParametroFaltaJustificada.FieldByName('sn_faltas_justificadas').AsInteger = 1 then
   begin
      // Ajusta o Posicionamento das labels (troca a ordem para F.Jus., F.Inj. e Faltas
      Label7.Left := 534;
      Label23.Left := 454;
      Label24.Left := 494;
      for n:= 1 to 10 do begin
         qryAulasJustificadas.Close;
         qryAulasJustificadas.ParamByName('nr_anosemestre').AsInteger := frmFichaIndividual.tblFichaAnoSemestre.AsInteger;
         qryAulasJustificadas.ParamByName('cd_turma').AsString := frmFichaIndividual.tblFichaTurma.AsString;
         qryAulasJustificadas.ParamByName('cd_pessoa').AsInteger := frmFichaIndividual.tblFichaCodigoAluno.AsInteger;
         qryAulasJustificadas.ParamByName('cd_disciplina').AsInteger := frmFichaIndividual.tblFichaDisciplina.AsInteger;
         qryAulasJustificadas.ParamByName('nr_serie').AsInteger := frmFichaIndividual.tblFichaSerie.AsInteger;
         qryAulasJustificadas.ParamByName('nr_etapa').AsInteger := n;
         qryAulasJustificadas.Open;
         // Atribui as faltas justificadas e injustificadas
         TEdit(FindComponent('edFaltaJustificada' + IntToStr(n))).Text := qryAulasJustificadas.FieldByName('nr_faltas').AsString;
         faltasInjustificadas := (DM.tblFichaIndividual.FieldByName('falta'+IntToStr(n)).AsInteger - qryAulasJustificadas.FieldByName('nr_faltas').AsInteger);
         TEdit(FindComponent('edFaltaInjustificada' + IntToStr(n))).Text := IntToStr(faltasInjustificadas);
         // Bloqueia o campo de digitação de faltas
         TDBEdit(FindComponent('dbFalta' + IntToStr(n))).ReadOnly := True;
         // Ajusta o posicionamento dos campos
         TEdit(FindComponent('edFaltaJustificada' + IntToStr(n))).Left := 454;
         TEdit(FindComponent('edFaltaInjustificada' + IntToStr(n))).Left := 494;
         TDBEdit(FindComponent('dbFalta' + IntToStr(n))).Left := 534;
      end;
   end else begin
      Label23.Visible := False;
      Label24.Visible := False;
      for n:= 1 to 10 do begin
         TEdit(FindComponent('edFaltaJustificada' + IntToStr(n))).Visible := False;
         TEdit(FindComponent('edFaltaInjustificada' + IntToStr(n))).Visible := False;
      end;
      largura := largura - 85;
   end;

   if (DM.tblFichaIndividual.FieldByName('sn_possui_adap').AsInteger = 0) AND (DM.tblFichaIndividual.FieldByName('sn_possui_depen').AsInteger = 0) then
   begin
      Panel4.Visible := false;
   end
   else
   begin
      DBEdit1.Visible := true;
      altura := altura + 60;
   end;

   Self.Height := altura;
   Self.Width := largura;

   for n := 1 to 10 do begin

      nota[n]   := DM.tblFichaIndividual.FieldByName('NOTA' + IntToStr(n)).AsFloat;
      falta[n]  := DM.tblFichaIndividual.FieldByName('FALTA' + IntToStr(n)).AsFloat;
      exame[n]  := DM.tblFichaIndividual.FieldByName('EXAME' + IntToStr(n)).AsFloat;
      notad[n]  := DM.tblFichaIndividual.FieldByName('NOTA_D' + IntToStr(n)).AsFloat;

   end;

   exameFinal     := DM.tblFichaIndividual.FieldByName('NOTAEXAME').AsFloat;
   mediaFinal     := DM.tblFichaIndividual.FieldByName('MEDIAFINAL').AsFloat;
   segundaEpoca   := DM.tblFichaIndividual.FieldByName('SEGUNDA_EPOCA').AsFloat;
   frequencia     := DM.tblFichaIndividual.FieldByName('FREQUENCIA').AsFloat;

   situacao       := DM.tblFichaIndividual.FieldByName('SITUACAO').AsInteger;
   aproveitamento := DM.tblFichaIndividual.FieldByName('APROVEITAMENTO').AsString;

   DM.tblFichaIndividual.Edit;
   qyMediaFinalCurso.Edit;

end;

procedure TfrmAcertoFicha.get_nomenclatura_parametros_avaliacao;
var
	sl_nomes_param_avaliacao: TStringList;
	i,nr_pos : Integer;
   nm_unimestre, nm_cliente : String;
begin
	sl_nomes_param_avaliacao := TStringList.Create;
   lbExame.Caption := 'Exame Final';
   lbSegunda.Caption := '2ª Época:';
	try
		sl_nomes_param_avaliacao.Delimiter := ';';
		sl_nomes_param_avaliacao.DelimitedText  := DM.tblAvaliacao.FieldByName('ds_sigla').AsString;
      nr_pos := 0;
      nm_unimestre := '';
      nm_cliente := '';
      
		for i := 0 to sl_nomes_param_avaliacao.Count - 1 do
		begin
         nr_pos := pos('=', sl_nomes_param_avaliacao[i]);

         nm_unimestre := copy(
            sl_nomes_param_avaliacao[i],
            0,
            nr_pos-1
         );

         nm_cliente := copy(
            sl_nomes_param_avaliacao[i],
            nr_pos+1,
            length(sl_nomes_param_avaliacao[i])-nr_pos
         );

         if ( nm_unimestre = 'notaexame' ) then
         begin
            lbExame.Caption := nm_cliente;
         end;

         if ( nm_unimestre = 'segunda_epoca' ) then
         begin
            lbSegunda.Caption := nm_cliente;
         end;
		end;

	finally
		sl_nomes_param_avaliacao.Free;
	end;
   
end;
   
procedure TfrmAcertoFicha.miClick(Sender: TObject);
var
   menuItem: TMenuItem;
   bloqueio, sn_registra_log : Boolean;
   msgLog, chaveLog, acao_realizada : String;
begin
   menuItem := TMenuItem(Sender);
   sbBloqueio.Glyph := menuItem.Bitmap;
   
   msgLog := '';
   chaveLog := '';
   sn_registra_log := False;

   case menuItem.Tag of
      0 : begin
         acao_realizada := 'Desbloqueio';
      end;
      1 : begin
         acao_realizada := 'Bloqueio';
      end;
      2 : begin
         acao_realizada := 'Bloqueio manual';
      end;
   end;


   if ( Pos('sbBloqFaltas', sbBloqueio.Name) > 0 ) then
   begin

      qyBloquearEtapa.SQL.Text := ''+
            ' UPDATE ' +
            '     fichaindividual ' +
            ' SET ' +
            '     sn_bloq_freq' + IntToStr(sbBloqueio.Tag) + ' = ' + IntToStr(menuItem.Tag) +
            ' WHERE '+
            '     codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString +
            '     AND anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString +
            '     AND turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"' +
            '     AND disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString;

      qyBloquearEtapa.ExecSQL;

      sn_registra_log := True;
      msgLog := 'Bloqueio de faltas para a etapa: ' + IntToStr(sbBloqueio.Tag)
         + ' - Ação realizada: ' + acao_realizada
         + ' - Para o aluno: ' + frmFichaIndividual.tblFichaCodigoAluno.AsString;

      chaveLog :=
         'codigoaluno:'+frmFichaIndividual.tblFichaCodigoAluno.AsString
         + ';anosemestre:' +frmFichaIndividual.tblFichaAnoSemestre.AsString
         + ';turma:'+frmFichaIndividual.tblFichaTurma.AsString
         + ';disciplina:'+frmFichaIndividual.tblFichadisciplina.AsString;

      bloqueio := menuItem.Tag = 1;
      TDBEdit(FindComponent('dbFalta' + IntToStr(sbBloqueio.Tag))).Enabled := not bloqueio;

   end
   else if (sbBloqueio.Name = 'sbBloqMediaCurso') then
   begin

      qyBloquearEtapa.SQL.Text := 'UPDATE fichaindividual SET sn_bloq_freq'+IntToStr(sbBloqueio.Tag)+' = '+IntToStr(menuItem.Tag)+' WHERE ' +
                                  ' codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString+
                                  ' AND anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString+
                                  ' AND turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"'+
                                  ' AND disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString;

      qyBloquearEtapa.ExecSQL;

      sn_registra_log := True;
      msgLog := 'Bloqueio da média do curso para etapa: ' + IntToStr(sbBloqueio.Tag)
         + ' - Ação realizada: ' + acao_realizada
         + ' - Para o aluno: ' + frmFichaIndividual.tblFichaCodigoAluno.AsString;

      chaveLog :=
         'codigoaluno:' + frmFichaIndividual.tblFichaCodigoAluno.AsString
         + ';anosemestre:' + frmFichaIndividual.tblFichaAnoSemestre.AsString
         + ';turma:' + frmFichaIndividual.tblFichaTurma.AsString
         + ';disciplina:' + frmFichaIndividual.tblFichadisciplina.AsString;

      bloqueio := menuItem.Tag = 1;
      TDBEdit(FindComponent('dbFalta' + IntToStr(sbBloqueio.Tag))).Enabled := not bloqueio;

   end
   else if (sbBloqueio.Name = 'sbBloqExame') then
   begin

      qyBloquearEtapa.SQL.Text := 'UPDATE fichaindividual SET sn_bloqueio_nota_exame = '+IntToStr(menuItem.Tag)+' WHERE ' +
                                  ' codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString+
                                  ' AND anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString+
                                  ' AND turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"'+
                                  ' AND disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString;

      qyBloquearEtapa.ExecSQL;


      sn_registra_log := True;
      msgLog := 'Bloqueio da nota do exame'
         + ' - Ação realizada: ' + acao_realizada
         + ' - Para o aluno: ' + frmFichaIndividual.tblFichaCodigoAluno.AsString;

      chaveLog :=
         'codigoaluno:'+frmFichaIndividual.tblFichaCodigoAluno.AsString
         + ';anosemestre:' +frmFichaIndividual.tblFichaAnoSemestre.AsString
         + ';turma:'+frmFichaIndividual.tblFichaTurma.AsString
         + ';disciplina:'+frmFichaIndividual.tblFichadisciplina.AsString;

      dbExame.Enabled := (not dbFaltouExame.Checked) and (not (menuItem.Tag = 1));
      dbFaltouExame.Enabled := not (menuItem.Tag = 1);

   end
   else if (sbBloqueio.Name = 'sbBloqSegundaEpoca') then
   begin

      qyBloquearEtapa.SQL.Text := 'UPDATE fichaindividual SET sn_bloqueio_2epoca = '+IntToStr(menuItem.Tag)+' WHERE ' +
                                  ' codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString+
                                  ' AND anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString+
                                  ' AND turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"'+
                                  ' AND disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString;

      qyBloquearEtapa.ExecSQL;


      sn_registra_log := True;
      msgLog := 'Bloqueio de Segunda Época'
         + ' - Ação realizada: ' + acao_realizada
         + ' - Para o aluno: ' + frmFichaIndividual.tblFichaCodigoAluno.AsString;

      chaveLog :=
         'codigoaluno:'+frmFichaIndividual.tblFichaCodigoAluno.AsString
         + ';anosemestre:' +frmFichaIndividual.tblFichaAnoSemestre.AsString
         + ';turma:'+frmFichaIndividual.tblFichaTurma.AsString
         + ';disciplina:'+frmFichaIndividual.tblFichadisciplina.AsString;

      dbSegunda.Enabled := (not dbFaltou2Epoca.Checked) and (not (menuItem.Tag = 1));
      dbFaltou2Epoca.Enabled := not (menuItem.Tag = 1);

   end else begin { SENÃO, é bloqueio de etapas (notas) }

      qyBloquearEtapa.SQL.Text := 'UPDATE fichaindividual SET sn_bloqueado'+IntToStr(sbBloqueio.Tag)+' = '+IntToStr(menuItem.Tag)+' WHERE ' +
                                  ' codigoaluno = '+frmFichaIndividual.tblFichaCodigoAluno.AsString+
                                  ' AND anosemestre = '+frmFichaIndividual.tblFichaAnoSemestre.AsString+
                                  ' AND turma = "'+frmFichaIndividual.tblFichaTurma.AsString+'"'+
                                  ' AND disciplina = '+frmFichaIndividual.tblFichadisciplina.AsString;

      qyBloquearEtapa.ExecSQL;

      sn_registra_log := True;
      msgLog := 'Bloqueio de média para a etapa:' +  IntToStr(sbBloqueio.Tag)
         + ' - Ação realizada: ' + acao_realizada
         + ' - Para o aluno: ' + frmFichaIndividual.tblFichaCodigoAluno.AsString;

      chaveLog :=
         'codigoaluno:'+frmFichaIndividual.tblFichaCodigoAluno.AsString
         + ';anosemestre:' +frmFichaIndividual.tblFichaAnoSemestre.AsString
         + ';turma:'+frmFichaIndividual.tblFichaTurma.AsString
         + ';disciplina:'+frmFichaIndividual.tblFichadisciplina.AsString;
              
      bloqueio := menuItem.Tag in [1, 2];
      TDBEdit(FindComponent('dbAvaliacao_' + IntToStr(sbBloqueio.Tag))).Enabled := not bloqueio;
      TDBEdit(FindComponent('dbExame' + IntToStr(sbBloqueio.Tag))).Enabled := not bloqueio;
      TDBEdit(FindComponent('dbDefinitiva' + IntToStr(sbBloqueio.Tag))).Enabled := not bloqueio;
   end;

   // Verifica se deve gravar o LOG
   if ( sn_registra_log ) then
   begin
      DM.setLog(
         1006,
         'Alteracao',
         chaveLog,
         DM.UsuarioLogado.GetColigadaLogada.Codigo,
         msgLog
      );
   end;

end;

procedure TfrmAcertoFicha.OnSaveMediaFinal(Sender: TDBEdit; value: String);
begin
   if (Sender.DataField = 'MediaFinal') then
   begin
      if (value = '') then
      begin
         DM.tblFichaIndividual.Edit;
         Sender.Field.AsString := '';
         Sender.Modified := True;
         exit;
      end;
      
      if (TAvaliacoesConceitos.GetInstancia().GetNotaFromConceito(DM.tblAvaliacaocd_avaliacao.AsInteger, value) <>
         Sender.Field.AsFloat) then
      begin
         DM.tblFichaIndividual.Edit;
         Sender.Field.AsFloat := TAvaliacoesConceitos.GetInstancia().GetNotaFromConceito(DM.tblAvaliacaocd_avaliacao.AsInteger, value);
         Sender.Modified := True;
      end;
      
   end else begin
      if UpperCase(value) <> Sender.Field.AsString then
      begin
         DM.tblFichaIndividual.Edit;
         Sender.Field.AsString := UpperCase(value);
         Sender.Modified := True;
      end;
   end;
end;

procedure TfrmAcertoFicha.qyMediaFinalCursonr_media_cursoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   DisplayText := True;

   if DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         DM.tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      );
   end else begin
      Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, DM.tblAvaliacaonr_casas_decimais.AsInteger ) ;
   end;
end;

procedure TfrmAcertoFicha.sbBloqEtapaClick(Sender: TObject);
var
   point: TPoint;
begin
   sbBloqueio := Sender as TSpeedButton;
   sbBloqueio.PopupMenu := pmBloqueios012;
   GetCursorPos(point);
   sbBloqueio.PopupMenu.Popup(point.X, point.Y);
end;

procedure TfrmAcertoFicha.sbBloqFaltas1Click(Sender: TObject);
var
   point: TPoint;
begin
   sbBloqueio := Sender as TSpeedButton;
   sbBloqueio.PopupMenu := pmBloqueios01;
   GetCursorPos(point);
   sbBloqueio.PopupMenu.Popup(point.X, point.Y);
end;

procedure TfrmAcertoFicha.txtMFEnter(Sender: TObject);
begin
   if (DM.tblAvaliacaosn_conceitos.AsString = 'S') OR
      (DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S') then
   begin
      TAvaliacoesConceitos.GetInstancia().AbrirCampoConceito(DM.tblAvaliacaocd_avaliacao.AsInteger, TDBEdit(Sender), ['****', 'DISP'], OnSaveMediaFinal);
   end;
end;

procedure TfrmAcertoFicha.txtMFKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = '*') AND (TDBEdit(Sender).DataField = 'MediaFinal') then
   begin
      DM.tblFichaIndividual.Edit;
      TDBEdit(Sender).Field.AsFloat := -2;
      Key := #0;
   end
   else if key = #13 then
   begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   end;
end;

procedure TfrmAcertoFicha.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmAcertoFicha.FormCreate(Sender: TObject);
begin
   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
      { Insere log de acesso ao diário }
      DMDiario.inserirLogAcesso;
   end;
end;

procedure TfrmAcertoFicha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6 : btnCancelarClick(nil);
    VK_F7 : btnConfirmarClick(nil);
    VK_F12 : btnFecharClick(nil);
  end;
end;

procedure TfrmAcertoFicha.dbAvaliacao_1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = '*' then
   begin
      DM.tblFichaIndividual.Edit;
      TDBEdit(Sender).Field.AsFloat := -2;
      Key := #0;
   end
   else if key = #13 then
   begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   end;
end;

procedure TfrmAcertoFicha.dbAvaliacao_1Enter(Sender: TObject);
begin
   if DM.tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      TAvaliacoesConceitos.GetInstancia().AbrirCampoConceito(DM.tblAvaliacaocd_avaliacao.AsInteger, TDBEdit(Sender), ['****', 'DISP']);
   end;
end;

procedure TfrmAcertoFicha.dbAvaliacao_1Exit(Sender: TObject);
const
   sNomeCampoExame = 'dbExame%d';       
   sNomeCampoNotaDefinitiva = 'dbDefinitiva%d';
var
   objTemp: TObject;
   dbEditSender, dbEditExame, dbEditNotaDefinitiva: TDBEdit;
   tag: Integer;
   nomeCampoExame, nomeCampoNotaDefinitiva: String;
begin
   dbEditSender := TDBEdit(Sender);
   tag := dbEditSender.Tag;

   // Se foi digitado algo dentro do campo
   if (dbEditSender.Modified) then
   begin
      nomeCampoExame := Format(sNomeCampoExame, [tag]);
      nomeCampoNotaDefinitiva := Format(sNomeCampoNotaDefinitiva, [tag]);

      objTemp := self.FindComponent(nomeCampoExame);
      if objTemp <> nil then
      begin
         dbEditExame := TDBEdit (objTemp);
      end;

      objTemp := self.FindComponent(nomeCampoNotaDefinitiva);
      if objTemp <> nil then
      begin
         dbEditNotaDefinitiva := TDBEdit (objTemp);
      end;

      if dbEditExame.Field.IsNull then
      begin
         DM.tblFichaIndividual.Edit;
         dbEditNotaDefinitiva.Field.AsFloat := dbEditSender.Field.AsFloat;
      end;
   end;
end;

procedure TfrmAcertoFicha.dbAvaliacao_1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext(ActiveControl,True,True);
    VK_UP : SelectNext(ActiveControl,False,True);
  end;

end;

procedure TfrmAcertoFicha.dbFalta1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Tratamento para quando não for digitado um número então não interpretar
   if (Key < 48) or (Key > 57) then Exit; // Verifica números 0-9 do teclado normal
   if (Key < 96) or (Key > 105) then Exit; // Verifica números de 0-9 do teclado numérico

   case Key of
      VK_DOWN : SelectNext(ActiveControl,True,True);
      VK_UP : SelectNext(ActiveControl,False,True);
   end;
   
end;

procedure TfrmAcertoFicha.dbFalta1KeyPress(Sender: TObject; var Key: Char);
begin
   dbFalta1.Modified := True;

   if key = #13 then
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
       Exit;
   End;

   if not (Key in [#8, #48..#57, #127]) then
      Key := #0;

end;

procedure TfrmAcertoFicha.dbFaltou2EpocaClick(Sender: TObject);
begin
   dbSegunda.Enabled := not dbFaltou2Epoca.Checked;

   if ( DM.tblFichaIndividual.State IN [dsInsert, dsEdit] ) AND
      ( not dbSegunda.Enabled ) then
      DM.tblFichaIndividualSegunda_Epoca.Clear;
end;

procedure TfrmAcertoFicha.dbFaltouExameClick(Sender: TObject);
begin
   dbExame.Enabled := not dbFaltouExame.Checked;

   if ( DM.tblFichaIndividual.State IN [dsInsert, dsEdit] ) AND
      ( not dbExame.Enabled ) then
      DM.tblFichaIndividualNotaExame.Clear;   
end;

procedure TfrmAcertoFicha.edFaltaAtualizarTotalExit(Sender: TObject);
var
   etapa: Integer;
begin
   etapa := TEdit(Sender).Tag;
   atualizarTotalFaltas(etapa);
end;

procedure TfrmAcertoFicha.dbBloqueadoFreq_1Click(Sender: TObject);
var
   Ordem: integer;
   Ligado: boolean;
begin
   Ordem := TDBCheckBox(Sender).Tag;
   Ligado := not TDBCheckBox(Sender).Checked;
   TDBEdit(FindComponent('dbFalta' + IntToStr(Ordem))).Enabled := Ligado;
end;

procedure TfrmAcertoFicha.dbBloqueado_1Click(Sender: TObject);
var
   n : word;
   ligado : Boolean;
begin
   n := TDBCheckBox(Sender).Tag;
   ligado := not TDBCheckBox(Sender).Checked;
   TDBEdit(FindComponent('dbAvaliacao_' + IntToStr(n))).Enabled := ligado;
   TDBEdit(FindComponent('dbExame' + IntToStr(n))).Enabled := ligado;
   TDBEdit(FindComponent('dbDefinitiva' + IntToStr(n))).Enabled := ligado;
end;

procedure TfrmAcertoFicha.atualizarTotalFaltas(etapa: Integer);
var
   totalFaltas: Integer;
   edFaltasJustificadas: TEdit;
   edFaltasInjustificadas: TEdit;
begin
   if Trim(TEdit(FindComponent('edFaltaJustificada'+IntToStr(etapa))).Text) = '' then
   begin
      TEdit(FindComponent('edFaltaJustificada'+IntToStr(etapa))).Text := '0';
   end;

   if Trim(TEdit(FindComponent('edFaltaInjustificada'+IntToStr(etapa))).Text) = '' then
   begin
      TEdit(FindComponent('edFaltaInjustificada'+IntToStr(etapa))).Text := '0';
   end;

   totalFaltas := StrToInt(TEdit(FindComponent('edFaltaJustificada'+IntToStr(etapa))).Text) + StrToInt(TEdit(FindComponent('edFaltaInjustificada'+IntToStr(etapa))).Text);

   if not(DM.tblFichaIndividual.State in [dsInsert, dsEdit]) then
   begin
      DM.tblFichaIndividual.Edit;
   end;

   DM.tblFichaIndividual.FieldByName('falta' + IntToStr(etapa)).AsInteger := totalFaltas;
end;

end.

