unit uRelatorios_cartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ClassRegistros;

type
  Tfrm_Relatorios_cartas = class(TForm)
    Bevel4: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Label1: TLabel;
    pnDados: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Panel1: TPanel;
    Bevel6: TBevel;
    Panel4: TPanel;
    pnDigitacao: TPanel;
    sbImprimir: TSpeedButton;
    sbFechar: TSpeedButton;
    sbPropriedades: TSpeedButton;
    ImageList1: TImageList;
    qRelatorios: TUMZQuery;
    popTurmas: TPopupMenu;
    Label2: TLabel;
    Memo1: TMemo;
    gpVariasImpressoes: TGroupBox;
    lblAnoSemestre: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    lblCurso: TLabel;
    txtCurso: TEdit;
    btnCodigoCurso: TSpeedButton;
    lblTurma: TLabel;
    txtTurma: TEdit;
    btnCodigoTurma: TSpeedButton;
    lblDisciplina: TLabel;
    txtDisciplina: TEdit;
    btnCodigoDisciplina: TSpeedButton;
    lblCodigoAluno: TLabel;
    txtCodigoAluno: TEdit;
    btnCodigoAluno: TSpeedButton;
    lblProfessor: TLabel;
    txtProfessor: TEdit;
    btnCodigoProfessor: TSpeedButton;
    lblData: TLabel;
    ckDtFiltrar: TCheckBox;
    lblDtInicial: TLabel;
    txtDtInicial: TDateTimePicker;
    lblDtFinal: TLabel;
    txtDtFinal: TDateTimePicker;
    rdgTipoImpressao: TRadioGroup;
    ckbAbertas: TCheckBox;
    ckbBaixadas: TCheckBox;
    gpUnicaImpressao: TGroupBox;
    edNrOcorrencia: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ckFiltroOc: TCheckBox;
    ckNaoGeraNovoNumero: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ckFiltroOcClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbPropriedadesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure txtCodigoAlunoExit(Sender: TObject);
    procedure ckDtFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbFecharClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCodigoProfessorClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure btnCodigoDisciplinaClick(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure MyClick(Sender:TObject);
  private
    sCartas : String;
    procedure prepararImpressoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Relatorios_cartas: Tfrm_Relatorios_cartas;

implementation

uses
   uFSelecionarDepartamento, uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarPessoa, uDM,
  Main;

{$R *.dfm}

procedure Tfrm_Relatorios_cartas.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      txtCodigoAluno.Text := IntToStr( resultado_filtro.cd_pessoa );
      try
         txtTurma.Text := resultado_filtro.cd_turma;
         txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
      except
      end;
   end
   else Exit;
end;

procedure Tfrm_Relatorios_cartas.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
end;

procedure Tfrm_Relatorios_cartas.btnCodigoDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }
   // Aproveitamos a própria variável de retorno, para setar os padrões das informações
   // que serão usadas no filtro. De início devemos inicializar todas com -1 (Integer's) e ''(String's)
   resultado_filtro.nr_anosemestre := -1;
   resultado_filtro.cd_curso := '';
   resultado_filtro.cd_turma := '';
   resultado_filtro.cd_professor := -1;


  if txtAnoSemestre.Enabled then
     resultado_filtro.nr_anosemestre := StrToInt(txtAnoSemestre.Text);

  if txtCurso.Enabled then
     resultado_filtro.cd_curso := txtCurso.Text;

  if txtTurma.Enabled then
     resultado_filtro.cd_turma := txtturma.Text;

  if txtProfessor.Enabled then
     if txtProfessor.Text <> '' then
        resultado_filtro.cd_professor := StrToInt(txtProfessor.Text);

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([],
      resultado_filtro.cd_curso, resultado_filtro.nr_anosemestre, resultado_filtro.cd_turma,
      resultado_filtro.cd_professor);

   if resultado_filtro.filtrado then
   begin
      txtDisciplina.Text := IntToStr( resultado_filtro.cd_disciplina );
   end;
end;

procedure Tfrm_Relatorios_cartas.btnCodigoProfessorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if resultado_filtro.filtrado then
   begin
      txtProfessor.Text := IntToStr( resultado_filtro.cd_pessoa );
      if txtTurma.Text = '' Then
      begin
	      txtTurma.Text := resultado_filtro.cd_turma;
	      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
     end;
   end
   else Exit;
end;

procedure Tfrm_Relatorios_cartas.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;
   txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );
end;

procedure Tfrm_Relatorios_cartas.ckDtFiltrarClick(Sender: TObject);
begin
   lblDtInicial.Enabled := ckDtFiltrar.Checked;
   txtDtInicial.Enabled := ckDtFiltrar.Checked;
   lblDtFinal.Enabled := ckDtFiltrar.Checked;
   txtDtFinal.Enabled := ckDtFiltrar.Checked;
end;

procedure Tfrm_Relatorios_cartas.ckFiltroOcClick(Sender: TObject);
var
   contrario : Boolean;
begin
   gpUnicaImpressao.Enabled := ckFiltroOc.Checked;
   Label3.Enabled := ckFiltroOc.Checked;
   edNrOcorrencia.Enabled := ckFiltroOc.Checked;
   
   if(ckFiltroOc.Checked)then
      contrario := false
   else begin
      edNrOcorrencia.Text := '';
      contrario := true;
   end;
      
   gpVariasImpressoes.Enabled := contrario;
   
   lblAnoSemestre.Enabled := contrario;
   txtAnoSemestre.Enabled := contrario;
   UpDown1.Enabled := contrario;
   
   lblCurso.Enabled := contrario;
   txtCurso.Enabled := contrario;
   btnCodigoCurso.Enabled := contrario;
   
   lblTurma.Enabled := contrario;
   txtTurma.Enabled := contrario;
   btnCodigoTurma.Enabled := contrario;
   
   lblDisciplina.Enabled := contrario;
   txtDisciplina.Enabled := contrario;
   btnCodigoDisciplina.Enabled := contrario;
   
   lblCodigoAluno.Enabled := contrario;
   txtCodigoAluno.Enabled := contrario;
   btnCodigoAluno.Enabled := contrario;
   
   lblProfessor.Enabled := contrario;
   txtProfessor.Enabled := contrario;
   btnCodigoProfessor.Enabled := contrario;
   
   lblData.Enabled := contrario;
   ckDtFiltrar.Enabled := contrario;
   
   lblDtInicial.Enabled := contrario;
   txtDtInicial.Enabled := contrario;
   
   lblDtFinal.Enabled := contrario;
   txtDtFinal.Enabled := contrario;

   rdgTipoImpressao.Enabled := contrario;
   ckbAbertas.Enabled := contrario;
   ckbBaixadas.Enabled := contrario;
   ckNaoGeraNovoNumero.Enabled := contrario;

end;

procedure Tfrm_Relatorios_cartas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Relatorios_cartas.FormCreate(Sender: TObject);
begin
   TRadioButton(rdgTipoImpressao.Buttons[0]).WordWrap := True;
   TRadioButton(rdgTipoImpressao.Buttons[1]).WordWrap := True;
end;

procedure Tfrm_Relatorios_cartas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F7 : if sbImprimir.Enabled then sbImprimirClick( nil );
    VK_F12 : if sbFechar.Enabled then sbFecharClick( nil );
  end;
end;

procedure Tfrm_Relatorios_cartas.FormShow(Sender: TObject);
begin
   txtDtInicial.DateTime := DM.DataAtual;
   txtDtFinal.DateTime := DM.DataAtual;

   lblAnoSemestre.Visible := DM.UsaAnosemestre;
   txtAnoSemestre.Visible := DM.UsaAnosemestre;
   UpDown1.Visible := DM.UsaAnosemestre;

    txtCurso.Clear;
    txtTurma.Clear;
    txtDisciplina.Clear;
    txtCodigoAluno.Clear;
    txtProfessor.Clear;

    { Montar o TreeView }

    txtAnoSemestre.text := IntToStr(ano_semestre);
end;

procedure Tfrm_Relatorios_cartas.MyClick(Sender: TObject);
begin
   txtTurma.Text := popTurmas.Items[TMenuItem( Sender ).MenuIndex].Caption;
  txtTurma.SetFocus;
end;

procedure Tfrm_Relatorios_cartas.sbFecharClick(Sender: TObject);
begin
     Close;
end;


procedure Tfrm_Relatorios_cartas.prepararImpressoes;
var
   qyOcorrencias, qyCartas, qyAtualizar: TUMZQuery;
   iCodCarta : Integer;

begin
   // Cria qryes

   sCartas:='';
   DM.CriarConsulta(qyOcorrencias);
   DM.CriarConsulta(qyCartas);
   DM.CriarConsulta(qyAtualizar);
   qyAtualizar.ParamCheck := true;
   try
      // Busca todas as pessoas que possuem ocorrências
      qyOcorrencias.SQL.Text := ''+
         'SELECT                   '+
         '	cd_pessoa               '+
         'FROM                      '+
         '	ocorrencias o        '+
         '	INNER JOIN turmas t ON (o.turmamat = t.codigo AND t.anosemestre = o.nr_anosemestre)'+
         'WHERE o.sn_liberado = '+QuotedStr('S')+' AND o.cd_situacao IN (0';

      if not(ckFiltroOc.Checked)then
      begin
         // Verifica que situações deve imprimir
         if ckbAbertas.Checked then begin
            qyOcorrencias.SQL.Add(',1');      
         end;
         if ckbBaixadas.Checked then begin
            qyOcorrencias.SQL.Add(',2');
         end;
         qyOcorrencias.SQL.Add(')');

         // Filtros
         if rdgTipoImpressao.ItemIndex = 1 then
            qyOcorrencias.SQL.Add(' AND o.sn_carta = 1');
         if trim(txtAnoSemestre.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.nr_anosemestre = '+txtAnoSemestre.Text);
         if trim(txtCurso.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND t.curso = "'+txtCurso.Text+'"');
         if trim(txtTurma.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND t.codigo = "'+txtTurma.Text+'"');
         if Trim(txtDisciplina.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.cd_disciplina ='+txtDisciplina.Text);
         if Trim(txtCodigoAluno.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.cd_pessoa ='+txtCodigoAluno.Text);
         if Trim(txtProfessor.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.cd_professor ='+txtProfessor.Text);
         if ckDtFiltrar.Checked then begin
            qyOcorrencias.SQL.Add(' AND (o.dt_registro >= "'+formatDateTime('yyyy-mm-dd',txtDtInicial.DateTime)+'" AND o.dt_registro <= "'+formatDateTime('yyyy-mm-dd',txtDtFinal.DateTime)+'")');
         end;
         qyOcorrencias.SQL.Add(' GROUP BY o.cd_pessoa');
      end else begin
         qyOcorrencias.SQL.Add(',1,2)');
         qyOcorrencias.SQL.Add(' AND o.cd_carta = '+edNrOcorrencia.Text);
      end;
      qyOcorrencias.Open;

      
      // Tem pessoas com ocorrências a serem impressas
      if not(ckFiltroOc.Checked)then
      begin
         if not(ckNaoGeraNovoNumero.Checked)then
         begin
            if not qyOcorrencias.IsEmpty then begin
               while not qyOcorrencias.Eof do begin
                  // Insere a carta para a Pessoa Atual do Laço
                  qyCartas.SQL.Text:= 'INSERT INTO ocorrencias_cartas (cd_carta, cd_pessoa, dt_envio) VALUES ( NULL, :cd_pessoa, now())';
                  qyCartas.ParamByName('cd_pessoa').AsInteger := qyOcorrencias.FieldByName('cd_pessoa').AsInteger;
                  qyCartas.ExecSQL();
                  iCodCarta := DM.LastInsert;

                  // Atualizar código da carta
                  qyAtualizar.SQL.Text := ''+
                     'UPDATE                          '+
                     '	ocorrencias o                 '+
                     '	INNER JOIN turmas t ON (o.turmamat = t.codigo AND t.anosemestre = o.nr_anosemestre)'+
                     '  INNER JOIN pessoas p ON( o.cd_pessoa = p.cd_pessoa )'+
                     'SET                             '+
                     '  o.cd_carta= :cd_carta         '+
                     'WHERE  o.cd_situacao in (0';

                  // Verifica que situações deve imprimir
                  if ckbAbertas.Checked then begin
                     qyAtualizar.SQL.Add(',1');
                  end;
                  if ckbBaixadas.Checked then begin
                     qyAtualizar.SQL.Add(',2');
                  end;
                  qyAtualizar.SQL.Add(')');

                  qyAtualizar.SQL.Add(' AND o.cd_pessoa ='+qyOcorrencias.FieldByName('cd_pessoa').AsString);
                  qyAtualizar.SQL.Add(' AND (p.sn_bloq_cartas <> 1 OR p.sn_bloq_cartas IS NULL) ');

                  // Filtros
                  if rdgTipoImpressao.ItemIndex = 1 then
                     qyAtualizar.SQL.Add(' AND o.sn_carta = 1');
                  if trim(txtAnoSemestre.Text) <> '' then
                     qyAtualizar.SQL.Add(' AND o.nr_anosemestre = '+txtAnoSemestre.Text);
                  if trim(txtCurso.Text) <> '' then
                     qyAtualizar.SQL.Add(' AND t.curso = "'+txtCurso.Text+'"');
                  if trim(txtTurma.Text) <> '' then
                     qyAtualizar.SQL.Add(' AND t.codigo = "'+txtTurma.Text+'"');
                  if Trim(txtDisciplina.Text) <> '' then
                     qyAtualizar.SQL.Add(' AND o.cd_disciplina ='+txtDisciplina.Text);
                  if Trim(txtProfessor.Text) <> '' then
                     qyAtualizar.SQL.Add(' AND o.cd_professor ='+txtProfessor.Text);
                  if ckDtFiltrar.Checked then begin
                     qyAtualizar.SQL.Add(' AND (o.dt_registro >= "'+formatDateTime('yyyy-mm-dd',txtDtInicial.DateTime)+'" AND o.dt_registro <= "'+formatDateTime('yyyy-mm-dd',txtDtFinal.DateTime)+'")');
                  end;
                  qyAtualizar.ParamByName('cd_carta').Value := iCodCarta;
                  qyAtualizar.ExecSQL();

                  // Próxima pessoa
                  qyOcorrencias.Next();
               end;
            end;
         end;
      end;

      // Pegar cartas a serem impressas
      qyOcorrencias.Close();
      qyOcorrencias.SQL.Text := ''+
         'SELECT                   '+
         '	DISTINCT o.cd_carta    '+
         'FROM                     '+
         '	ocorrencias o       '+
         '	INNER JOIN turmas t ON (o.turmamat = t.codigo AND t.anosemestre = o.nr_anosemestre)'+
         '	INNER JOIN ocorrencias_cartas c ON (o.cd_carta = c.cd_carta)'+
         'WHERE  o.cd_situacao IN (0';

      if not (ckFiltroOc.Checked)then
      begin
         // Verifica que situações deve imprimir
         if ckbAbertas.Checked then begin
            qyOcorrencias.SQL.Add(',1');      
         end;
         if ckbBaixadas.Checked then begin
            qyOcorrencias.SQL.Add(',2');
         end;
         qyOcorrencias.SQL.Add(')');

         // Filtros
         if rdgTipoImpressao.ItemIndex = 1 then
            qyOcorrencias.SQL.Add(' AND o.sn_carta = 1');
         if trim(txtAnoSemestre.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.nr_anosemestre = '+txtAnoSemestre.Text);
         if trim(txtCurso.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND t.curso = "'+txtCurso.Text+'"');
         if trim(txtTurma.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND t.codigo = "'+txtTurma.Text+'"');
         if Trim(txtDisciplina.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.cd_disciplina ='+txtDisciplina.Text);
         if Trim(txtCodigoAluno.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.cd_pessoa ='+txtCodigoAluno.Text);
         if Trim(txtProfessor.Text) <> '' then
            qyOcorrencias.SQL.Add(' AND o.cd_professor ='+txtProfessor.Text);
         if ckDtFiltrar.Checked then begin
            qyOcorrencias.SQL.Add(' AND (o.dt_registro >= "'+formatDateTime('yyyy-mm-dd',txtDtInicial.DateTime)+'" AND o.dt_registro <= "'+formatDateTime('yyyy-mm-dd',txtDtFinal.DateTime)+'")');
         end;
         qyOcorrencias.SQL.Add(' GROUP BY o.cd_carta');
      end else begin
         qyOcorrencias.SQL.Add(',1,2)');
         qyOcorrencias.SQL.Add('AND o.cd_carta = :carta');
         qyOcorrencias.ParamByName('carta').AsInteger := StrToInt(edNrOcorrencia.Text);
      end;
      
      qyOcorrencias.Open;

      // Monta as cartas a serem impressas


      while not qyOcorrencias.Eof do begin
         if sCartas <> '' then
            sCartas := sCartas+',';
         sCartas := sCartas+qyOcorrencias.FieldByName('cd_carta').AsString;
         qyOcorrencias.Next();
      end;


      // Atualizar SITUAÇÃO
      qyAtualizar.SQL.Text := ''+
         'UPDATE                   '+
         '	ocorrencias o        '+
         '	INNER JOIN turmas t ON (o.turmamat = t.codigo AND t.anosemestre = o.nr_anosemestre)'+
         'SET                       '+
         '  o.cd_situacao = 1 '+
         'WHERE  o.cd_situacao in (0)';

      if not(ckFiltroOc.Checked)then
      begin
         // Filtros
         if trim(txtAnoSemestre.Text) <> '' then
            qyAtualizar.SQL.Add(' AND o.nr_anosemestre = '+txtAnoSemestre.Text);
         if trim(txtCurso.Text) <> '' then
            qyAtualizar.SQL.Add(' AND t.curso = "'+txtCurso.Text+'"');
         if trim(txtTurma.Text) <> '' then
            qyAtualizar.SQL.Add(' AND t.codigo = "'+txtTurma.Text+'"');
         if Trim(txtDisciplina.Text) <> '' then
            qyAtualizar.SQL.Add(' AND o.cd_disciplina ='+txtDisciplina.Text);
         if Trim(txtCodigoAluno.Text) <> '' then
            qyAtualizar.SQL.Add(' AND o.cd_pessoa ='+txtCodigoAluno.Text);
         if Trim(txtProfessor.Text) <> '' then
            qyAtualizar.SQL.Add(' AND o.cd_professor ='+txtProfessor.Text);
         if ckDtFiltrar.Checked then begin
            qyAtualizar.SQL.Add(' AND (o.dt_registro >= :pInicio AND o.dt_registro <= :pFim)');
            qyAtualizar.ParamByName('pInicio').AsString := formatDateTime('yyyy-mm-dd',txtDtInicial.DateTime);
            qyAtualizar.ParamByName('pFim').AsString := formatDateTime('yyyy-mm-dd',txtDtFinal.DateTime);
         end;
      end else begin
         qyAtualizar.SQL.Add(' AND o.cd_carta = '+edNrOcorrencia.Text);
      end;

      qyAtualizar.ExecSQL();
   finally
      // Destrói as qryes
      qyOcorrencias.Close;
      qyOcorrencias.Free;
      qyCartas.Close;
      qyCartas.Free;
      qyAtualizar.Close;
      qyAtualizar.Free;
   end;
end;

procedure Tfrm_Relatorios_cartas.sbImprimirClick(Sender: TObject);
var
  sArqRelatorio: string;
  sParametros: string;
  sFSelecao: string;
  sFGrupo: string;
  sFiltroShow: string;
  sAux: string;
  pAtual : string;
  slFormulas: TstringList;
  slOrdem: TStringList;
  bAux: Boolean;
  iNum: LongInt;
  sFiltro : String;
  sOp : String;
  pCampo : String;
  pAtual_Aux : String;
  i: Integer;
  wMes, wAno, wDia : Word;
  sSQL : String;
  slSQL : TStringList;
  slSQLExp : TStringList;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   // Prepara as cartas para Impressão
   prepararImpressoes();


   if length(sCartas) > 0 then begin
     if not(ckFiltroOc.Checked)then
     begin
        sFSelecao := ' {ocorrencias.cd_carta} IN [' + sCartas + '] ';
        if(Length(txtTurma.Text) > 0)then
            sFSelecao := sFSelecao + ' AND {ocorrencias.turmamat} = "'+txtTurma.Text+'"';
        if(Length(txtDisciplina.Text) > 0)then
            sFSelecao := sFSelecao + ' AND {ocorrencias.cd_disciplina} = '+txtDisciplina.Text;
        if(Length(txtCodigoAluno.Text) > 0) then
            sFSelecao := sFSelecao + ' AND {ocorrencias.cd_pessoa} = '+txtCodigoAluno.Text;
        if(Length(txtProfessor.Text) > 0)then
            sFSelecao := sFSelecao + ' AND {ocorrencias.cd_professor} = '+txtProfessor.Text;
        if(ckDtFiltrar.Checked)then
            sFSelecao := sFSelecao + ' AND {ocorrencias.dt_registro} >= Date('+FormatDateTime('yyyy,mm,dd', txtDtInicial.Date)+') AND {ocorrencias.dt_registro} <= Date('+FormatDateTime('yyyy,mm,dd', txtDtFinal.Date)+')';
     end
     else
        sFSelecao := ' {ocorrencias.cd_carta} = '+edNrOcorrencia.Text;

     slFormulas := TStringList.Create();

     slFormulas.Add('ds_conteudo="' + StringReplace(Memo1.Lines.Text, #$D#$A, '<BR>', [rfReplaceAll]) + '"');
     if(ckDtFiltrar.Checked and not ckFiltroOc.Checked)then
     begin
        slFormulas.Add('data_inicio=Date('+FormatDateTime('yyyy,mm,dd', txtDtInicial.Date)+') ');
        slFormulas.Add('data_fim=Date('+FormatDateTime('yyyy,mm,dd', txtDtFinal.Date)+') ');
     end;

     infoRelatorio := PrincipalForm.GetInfoRpt('repCartasOcorrenciasPadrao');

     sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

     PodeExportar := True;
     if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

     bAux := PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFSelecao, '', slFormulas,  nil, nil, nil, true, False, nil, PodeExportar);

     FreeAndNil(slFormulas);

   end else begin

     Mensagem('Não existe nenhuma ocorrência para o filtro selecionado.', 'Atenção', MB_OK + MB_ICONINFORMATION);

   end;


end;

procedure Tfrm_Relatorios_cartas.sbPropriedadesClick(Sender: TObject);
begin
   // Mostra a Janela de configuracao da impressora
    PrincipalForm.getRelatorio().Printer.Prompt();
    PrincipalForm.GetRelatorio().Printer.SetCurrent();
end;

procedure Tfrm_Relatorios_cartas.txtCodigoAlunoExit(Sender: TObject);
var
   qyListaMatriculas : TUMZReadOnlyQuery;
begin
   if txtCodigoAluno.Text = '' then Exit;

   while popTurmas.Items.Count > 0 do popTurmas.Items.Delete(0);

   if Pos(',', txtCodigoAluno.Text) > 0 then Exit;

   DM.CriarConsulta(qyListaMatriculas);

   qyListaMatriculas.SQL.Add( 'SELECT cd_pessoa, nm_pessoa , Matriculas.AnoSemestre, ' +
      'Matriculas.Curso, Matriculas.Turma FROM Pessoas LEFT JOIN ' +
      ' Matriculas ON ( Pessoas.cd_pessoa = Matriculas.CodigoAluno ) ' +
      ' WHERE Pessoas.cd_pessoa = :Codigo and Matriculas.AnoSemestre = :AnoSemestre' );
   qyListaMatriculas.SQL.Add( ' order by Matriculas.AnoSemestre' );
   qyListaMatriculas.ParamByName('Codigo').AsInteger := StrToInt( txtCodigoAluno.Text );
   qyListaMatriculas.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
   qyListaMatriculas.Open;

   while not qyListaMatriculas.Eof do
   begin
      popTurmas.Items.Add(
         NewItem( qyListaMatriculas.FieldByName('Turma').AsString, 0, False, True, MyClick, 0, '' ) );
      qyListaMatriculas.Next;
   end;

   if popTurmas.Items.Count = 1 then
      txtTurma.Text := qyListaMatriculas.FieldByNAme('Turma').AsString;

  FreeAndNil(qyListaMatriculas);
end;

procedure Tfrm_Relatorios_cartas.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
     { Incremento do AnoSemestre }

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
end;

end.

