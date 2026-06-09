unit uBloqueioNotasEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Mask, ToolWin,
  ImgList, StrUtils;

type
  TfrmBloqueioEtapa = class(TForm)
    Label1: TLabel;
    txtCurso: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    txtTurma: TEdit;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    txtDisciplina: TEdit;
    SpeedButton3: TSpeedButton;
    txtBim: TEdit;
    udPBim: TUpDown;
    Label4: TLabel;
    Label5: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    ToolBar1: TToolBar;
    tbBloquear: TToolButton;
    ToolButton2: TToolButton;
    tbDesbloquear: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ilBotoes: TImageList;
    tbCancelar: TToolButton;
    ToolButton3: TToolButton;
    Label6: TLabel;
    txtDepto: TEdit;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    cbAproveitamento: TCheckBox;
    ckBloqNotas: TCheckBox;
    ckBloqFrequencia: TCheckBox;
    procedure txtDisciplinaExit(Sender: TObject);
    procedure txtTurmaExit(Sender: TObject);
    procedure txtCursoExit(Sender: TObject);
    procedure txtDeptoExit(Sender: TObject);
    procedure txtAnoSemestreExit(Sender: TObject);
    procedure tbDesbloquearClick(Sender: TObject);
    procedure tbBloquearClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure udPBimClick(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
      sAnoSem     : string;
      sDepto      : string;
      sCurso      : string;
      sTurma      : string;
      sDisciplina : string;
      sNDepto     : string;

      procedure CarregaItemBusca();
      function setBloqueio(bloquear:boolean):integer;
  public
    { Public declarations }
  end;

var
  frmBloqueioEtapa: TfrmBloqueioEtapa;

implementation

uses uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uDM, Main, uFSelecionarDepartamento, DB,
  ZConnection, uUMNucleo;

{$R *.dfm}

procedure TfrmBloqueioEtapa.udPBimClick(Sender: TObject; Button: TUDBtnType);
var
   i: Integer;
begin

   if txtBim.Text = '' then begin
      txtBim.Text := '1';
   end
   else begin
      try
         i := StrToInt(txtBim.Text);
      except
         i := 1;
      end;
      if Button = btNext then begin
         if (i < 10) then begin
           Inc(i);
         end;
      end
      else begin
         if (i > 1) then begin
            Dec(i);
         end;
      end;
      if (IntToStr(i) <> txtBim.Text) then begin
         txtBim.Text := IntToStr(i);
      end;

   end;
end;
procedure TfrmBloqueioEtapa.SpeedButton1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(sAnoSem));

   if resultado_filtro.filtrado then
   begin
      sAnosem := IntToStr( resultado_filtro.nr_anosemestre );
      sDepto := IntToStr( resultado_filtro.cd_departamento );
      sCurso := resultado_filtro.cd_curso;
      sTurma := '';
      sDisciplina := '';

      CarregaItemBusca();
   end;
end;

procedure TfrmBloqueioEtapa.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(sAnoSem), -1, -1, sCurso);

   if not resultado_filtro.filtrado then Exit;

   sAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
   sDepto := IntToStr( resultado_filtro.cd_departamento );
   sCurso := resultado_filtro.cd_curso;
   sTurma := resultado_filtro.cd_turma;
   sDisciplina := '';

   CarregaItemBusca();
end;

procedure TfrmBloqueioEtapa.SpeedButton3Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }
   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], sCurso, StrToInt(sAnosem), sTurma);

   if resultado_filtro.filtrado then
   begin
     sCurso := resultado_filtro.cd_curso;
     sDisciplina := IntToStr( resultado_filtro.cd_disciplina );
     CarregaItemBusca();
   end;
end;

procedure TfrmBloqueioEtapa.CarregaItemBusca();
begin
  txtAnoSemestre.Text := sAnoSem;
  txtDepto.Text := sDepto;
  txtCurso.Text := sCurso;
  txtTurma.Text := sTurma;
  txtDisciplina.Text := sDisciplina;
end;

procedure TfrmBloqueioEtapa.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmBloqueioEtapa.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
  sAnoSem := txtAnoSemestre.text;
  sDepto := '';
  sCurso := '';
  sDisciplina := '';

end;

procedure TfrmBloqueioEtapa.FormShow(Sender: TObject);
begin
   txtAnoSemestre.Text := IntToStr(ano_semestre);
   sAnoSem := txtAnoSemestre.Text;

   txtAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   UpDown2.Visible := txtAnoSemestre.Visible;
   Label5.Visible := txtAnoSemestre.Visible;
end;

procedure TfrmBloqueioEtapa.tbCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmBloqueioEtapa.SpeedButton4Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

  if resultado_filtro.filtrado then
  begin
    sDepto := IntToStr(resultado_filtro.cd_departamento);
    sCurso := '';
    sTurma := '';
    sDisciplina := '';

    CarregaItemBusca();
  end;
end;

procedure TfrmBloqueioEtapa.tbBloquearClick(Sender: TObject);
var
  resposta : integer;
  log_checks: String;
begin
  resposta := setBloqueio(true);
  if resposta = ID_YES then begin
    Mensagem('Bloqueio efetuado com sucesso !', Application.Title, MB_OK+MB_ICONINFORMATION);

    log_checks := '';

    if ckBloqNotas.Checked then
    begin
       log_checks := log_checks + #13 + 'Alteração médias da Etapa: Marcado';
    end
    else
    begin
       log_checks := log_checks + #13 + 'Alteração médias da Etapa: Desmarcado';
    end;

    if ckBloqFrequencia.Checked then
    begin
       log_checks := log_checks + #13 + 'Alteração frequências da Etapa: Marcado';
    end
    else
    begin
       log_checks := log_checks + #13 + 'Alteração frequências da Etapa: Desmarcado';
    end;

    if cbAproveitamento.Checked then
    begin
       log_checks := log_checks + #13 + 'Congelar situações finais: Marcado';
    end
    else
    begin
       log_checks := log_checks + #13 + 'Congelar situações finais: Desmarcado';
    end;

    DM.setLog(
      1050,
      'Alteracao',
      'Bloqueio de etapa: ' + txtAnoSemestre.Text + ';' + txtBim.Text + ';' + txtDepto.Text + ';' + txtCurso.Text + ';' + txtTurma.Text + ';' + txtDisciplina.Text,
      0,
      'Bloqueado com os seguintes dados: ' + #13 + 'AnoSemestre: ' + txtAnoSemestre.Text + #13 + 'Bimestre: ' + txtBim.Text + #13 + 'Departamento: ' + txtDepto.Text + #13 + 'Curso: ' + txtCurso.Text + #13 + 'Turma: ' + txtTurma.Text + #13 + 'Disciplina: ' + txtDisciplina.Text + log_checks
    );

    Close();
  end
  else if resposta = ID_CANCEL then begin
    Close();
  end;
end;

procedure TfrmBloqueioEtapa.tbDesbloquearClick(Sender: TObject);
var
  resposta : integer;
  log_checks: String;
begin
  resposta := setBloqueio(false);
  if resposta = ID_YES then begin
    Mensagem('Desbloqueio efetuado com sucesso !', Application.Title, MB_OK+MB_ICONINFORMATION);


    log_checks := '';

    if ckBloqNotas.Checked then
    begin
       log_checks := log_checks + #13 + 'Alteração médias da Etapa: Marcado';
    end
    else
    begin
       log_checks := log_checks + #13 + 'Alteração médias da Etapa: Desmarcado';
    end;

    if ckBloqFrequencia.Checked then
    begin
       log_checks := log_checks + #13 + 'Alteração frequências da Etapa: Marcado';
    end
    else
    begin
       log_checks := log_checks + #13 + 'Alteração frequências da Etapa: Desmarcado';
    end;

    if cbAproveitamento.Checked then
    begin
       log_checks := log_checks + #13 + 'Congelar situações finais: Marcado';
    end
    else
    begin
       log_checks := log_checks + #13 + 'Congelar situações finais: Desmarcado';
    end;

    DM.setLog(
      1050,
      'Alteracao',
      'Desbloqueio de etapa: ' + txtAnoSemestre.Text + ';' + txtBim.Text + ';' + txtDepto.Text + ';' + txtCurso.Text + ';' + txtTurma.Text + ';' + txtDisciplina.Text,
      0,
      'Desbloqueado com os seguintes dados: ' + #13 + 'AnoSemestre: ' + txtAnoSemestre.Text + #13 + 'Bimestre: ' + txtBim.Text + #13 + 'Departamento: ' + txtDepto.Text + #13 + 'Curso: ' + txtCurso.Text + #13 + 'Turma: ' + txtTurma.Text + #13 + 'Disciplina: ' + txtDisciplina.Text + log_checks
    );

    Close();
  end
  else if resposta = ID_CANCEL then begin
    Close();
  end;
end;

function TfrmBloqueioEtapa.setBloqueio(bloquear: boolean):integer;
var
  LSQLTemp: string;
  sMsg : string;
  resposta : integer;
begin
  if DM.db.Protocol = DB_PROTOCOL_MYSQL then
  begin
     with DM.qyAux do begin
       Close();

       SQL.Text := ' ' +
         'UPDATE ' +
         '   fichaindividual f ' +
         '   INNER JOIN turmas t ON ( t.codigo = f.turma AND t.anosemestre = f.anosemestre ) ' +
         '   INNER JOIN cursos_coligadas c ON ( c.cd_curso = t.curso AND c.cd_coligada = t.cd_coligada ) ' +
         'SET ';

       if bloquear then begin
          if ckBloqNotas.Checked then
          begin
             SQL.Add('f.sn_bloqueado' + txtBim.Text + ' = :sn_bloqueado,');
          end;
          if ckBloqFrequencia.Checked then
          begin
             SQL.Add('f.sn_bloq_freq' + txtBim.Text + ' = :sn_bloq_freq,');
          end;
          if (cbAproveitamento.Checked) then
          begin
             SQL.Add('f.aproveitamento = ''S'', f.sn_bloq_freq_global = 1,');
          end;
       end
       else begin
          if ckBloqNotas.Checked then
          begin
             SQL.Add('f.sn_bloqueado' + txtBim.Text + ' = :sn_bloqueado,');
          end;
          if ckBloqFrequencia.Checked then
          begin
             SQL.Add('f.sn_bloq_freq' + txtBim.Text + ' = :sn_bloq_freq,');
          end;
          SQL.Add('f.aproveitamento = ''N'', f.sn_bloq_freq_global = 0,');
       end;

       LSQLTemp := Trim(SQL.Text);
       if AnsiEndsStr(',', LSQLTemp) then
       begin
          LSQLTemp := Copy(SQL.Text, 1, Length(LSQLTemp))
       end;
       SQL.Text := LSQLTemp;

       SQL.Add(' WHERE f.anosemestre = :nr_anosemestre AND f.sn_bloqueado' + txtBim.Text + ' <> 2 ');

       sMsg := 'Tem certeza que deseja ';

       if bloquear then begin
         if Params.FindParam('sn_bloqueado') <> nil then
            ParamByName('sn_bloqueado').AsInteger := 1;
         if Params.FindParam('sn_bloq_freq') <> nil then
            ParamByName('sn_bloq_freq').AsInteger := 1;
         sMsg := sMsg + 'bloquear';
       end
       else begin
         if Params.FindParam('sn_bloqueado') <> nil then
            ParamByName('sn_bloqueado').AsInteger := 0;
         if Params.FindParam('sn_bloq_freq') <> nil then
            ParamByName('sn_bloq_freq').AsInteger := 0;
         sMsg := sMsg + 'desbloquear';
       end;

       ParamByName('nr_anosemestre').AsInteger := StrToInt(sAnoSem);
       sMsg := sMsg + ' a ficha individual da etapa '+txtBim.Text+' de todos os alunos de '+Copy(sAnoSem,1,4)+'/'+Copy(sAnoSem,5,1);

       if Length(sDepto) > 0 then begin
         SQL.Text := SQL.Text + '   AND c.cd_depto = :cd_cepto ';
         ParamByName('cd_cepto').AsInteger := StrToInt(sDepto);
         sMsg := sMsg + ', departamento '+sDepto;
       end;

       if Length(sCurso) > 0 then begin
         SQL.Text := SQL.Text + '   AND f.curso = :cd_curso ';
         ParamByName('cd_curso').AsString := sCurso;
         sMsg := sMsg + ', curso '+sCurso;
       end;

       if Length(sTurma) > 0 then begin
         SQL.Text := SQL.Text + '   AND f.turma = :cd_turma ';
         ParamByName('cd_turma').AsString := sTurma;
         sMsg := sMsg + ', turma '+sTurma;
       end;

       if Length(sDisciplina) > 0 then begin
         SQL.Text := SQL.Text + '   AND f.disciplina = :cd_disciplina ';
         ParamByName('cd_disciplina').AsInteger := StrToInt(sDisciplina);
         sMsg := sMsg + ', disciplina '+sDisciplina;
       end;

       sMsg := sMsg + ' ?';

       resposta := Mensagem(sMsg, Application.Title, MB_YESNOCANCEL+MB_ICONQUESTION);
       if resposta = ID_YES then begin
         ExecSQL();
       end;

       Result := resposta;

     end;
  end
  else
  begin
   with DM.qyAux do begin
      Close();

      SQL.Text := ' ' +
        'UPDATE ' +
        '   fichaindividual f ' +
        'SET ';

      if bloquear then begin
         if ckBloqNotas.Checked then
         begin
            SQL.Add('f.sn_bloqueado' + txtBim.Text + ' = :sn_bloqueado,');
         end;
         if ckBloqFrequencia.Checked then
         begin
            SQL.Add('f.sn_bloq_freq' + txtBim.Text + ' = :sn_bloq_freq,');
         end;
         if (cbAproveitamento.Checked) then
         begin
            SQL.Add('f.aproveitamento = ''S'', f.sn_bloq_freq_global = 1,');
         end;
      end
      else
      begin
         if ckBloqNotas.Checked then
         begin
            SQL.Add('f.sn_bloqueado' + txtBim.Text + ' = :sn_bloqueado,');
         end;
         if ckBloqFrequencia.Checked then
         begin
            SQL.Add('f.sn_bloq_freq' + txtBim.Text + ' = :sn_bloq_freq,');
         end;
         SQL.Add('f.aproveitamento = ''N'', f.sn_bloq_freq_global = 0,');
      end;

      LSQLTemp := Trim(SQL.Text);
      if AnsiEndsStr(',', LSQLTemp) then
      begin
         LSQLTemp := Copy(SQL.Text, 1, Length(LSQLTemp))
      end;
      SQL.Text := LSQLTemp;

      SQL.Add('WHERE EXISTS                 (    '+
         '   SELECT                              '+
         '     *                                 '+
         '   FROM                                '+
         '     cursos c                          '+
         '   WHERE                               '+
         '  	c.anosemestre = f.anosemestre AND '+
         '     c.codigo = f.curso AND            '+
         '     f.anosemestre = :nr_anosemestre ' );

      sMsg := 'Tem certeza que deseja ';

      if bloquear then begin
        if Params.FindParam('sn_bloqueado') <> nil then
           ParamByName('sn_bloqueado').AsInteger := 1;
        if Params.FindParam('sn_bloq_freq') <> nil then
           ParamByName('sn_bloq_freq').AsInteger := 1;
        sMsg := sMsg + 'bloquear';
      end
      else
      begin
        if Params.FindParam('sn_bloqueado') <> nil then
           ParamByName('sn_bloqueado').AsInteger := 0;
        if Params.FindParam('sn_bloq_freq') <> nil then
           ParamByName('sn_bloq_freq').AsInteger := 0;
        sMsg := sMsg + 'desbloquear';
      end;

      ParamByName('nr_anosemestre').AsInteger := StrToInt(sAnoSem);
      sMsg := sMsg + ' a ficha individual da etapa '+txtBim.Text+' de todos os alunos de '+Copy(sAnoSem,1,4)+'/'+Copy(sAnoSem,5,1);

      if Length(sDepto) > 0 then begin
        SQL.Text := SQL.Text + '   AND c.depto = :cd_cepto ';
        ParamByName('cd_cepto').AsInteger := StrToInt(sDepto);
        sMsg := sMsg + ', departamento '+sDepto;
      end;

      if Length(sCurso) > 0 then begin
        SQL.Text := SQL.Text + '   AND f.curso = :cd_curso ';
        ParamByName('cd_curso').AsString := sCurso;
        sMsg := sMsg + ', curso '+sCurso;
      end;

      if Length(sTurma) > 0 then begin
        SQL.Text := SQL.Text + '   AND f.turma = :cd_turma ';
        ParamByName('cd_turma').AsString := sTurma;
        sMsg := sMsg + ', turma '+sTurma;
      end;

      if Length(sDisciplina) > 0 then begin
        SQL.Text := SQL.Text + '   AND f.disciplina = :cd_disciplina ';
        ParamByName('cd_disciplina').AsInteger := StrToInt(sDisciplina);
        sMsg := sMsg + ', disciplina '+sDisciplina;
      end;
      SQL.Add(' ) ');
      sMsg := sMsg + ' ?';

      resposta := Mensagem(sMsg, Application.Title, MB_YESNOCANCEL+MB_ICONQUESTION);
      if resposta = ID_YES then begin
        ExecSQL();
      end;

      Result := resposta;
    end;
  
  end;

end;

procedure TfrmBloqueioEtapa.txtAnoSemestreExit(Sender: TObject);
begin
   sAnoSem := txtAnoSemestre.Text;
end;

procedure TfrmBloqueioEtapa.txtDeptoExit(Sender: TObject);
begin
   sDepto := txtDepto.Text;
end;

procedure TfrmBloqueioEtapa.txtCursoExit(Sender: TObject);
begin
   sCurso := txtCurso.Text;
end;

procedure TfrmBloqueioEtapa.txtTurmaExit(Sender: TObject);
begin
   sTurma := txtTurma.Text;
end;

procedure TfrmBloqueioEtapa.txtDisciplinaExit(Sender: TObject);
begin
   sDisciplina := txtDisciplina.Text;
end;

end.

