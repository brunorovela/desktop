unit uDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls,
  ComCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, DBCGrids, Menus;

type
  TfrmDocumentos = class(TForm)
    Panel3: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    lbAluno: TLabel;
    Label5: TLabel;
    tblDoc: TUMZQuery;
    tblDocCodigo: TSmallintField;
    tblDocDocumento: TStringField;
    tblDocObservacao: TMemoField;
    tblDocExiste: TBooleanField;
    dtcDoc: TDataSource;
    qAux: TUMZQuery;
    qProcDoc: TUMZQuery;
    tblDocSigla: TStringField;
    tblDocApresentou: TBooleanField;
    pmQtd: TPopupMenu;
    qryUpdateDoc: TUMZQuery;
    SpeedButton1: TSpeedButton;
    tblDoccd_siga: TIntegerField;
    tabFiltro: TTabControl;
    grdDocumentos: TDBGrid;
    SpeedButton2: TSpeedButton;
    tblDocCurso: TStringField;
    tblDocnr_altura: TIntegerField;
    tblDocnr_dpi: TIntegerField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure tabFiltroChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblDocCalcFields(DataSet: TDataSet);
    procedure grdDocumentosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharDocClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
    mudou : Boolean;
    Procedure registraDocumentoTabelaSiga( codDoc : String; aluno : String );
    procedure retiraDocumentacaoSiga();
    Procedure Filtrar();

  public
    CodigoAluno : Longint;
    Curso : string;
    { Public declarations }
  end;

var
  frmDocumentos: TfrmDocumentos;

implementation

uses
   Main, uObsDocumento, uUsuario, uDM, uDig, uDigDocumentos;

{$R *.DFM}


procedure TfrmDocumentos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDocumentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3 : grdDocumentosDblClick( nil );
    VK_F4 : grdDocumentosDblClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure TfrmDocumentos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDocumentos.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmDocumentos.Filtrar;
begin
   tblDoc.Close();
   if tabFiltro.TabIndex = 0 then begin

      tblDoc.SQL.Text := ' SELECT '
+ '    dd.curso,'
+ '    dd.sn_obrigatorio,'
+ '    dd.nr_grupo, '
+ '    d.codigo,'
+ '    d.documento,'
+ '    d.sigla,'
+ '    da.apresentou,'
+ '    da.observacao,'
+ '    da.sn_digitalizado,'
+ '    d.nr_dpi,'
+ '    d.nr_largura,'
+ '    d.nr_altura,'
+ '    da.dt_entrega,'
+ '   d.cd_siga'
+ ' FROM'
+ '   documentos_alunos da'
+ '   INNER JOIN pessoas pe ON (da.codigoaluno = pe.cd_pessoa)'
+ '   LEFT OUTER JOIN documentos_necessarios dd ON (da.cod_documento = dd.cod_documento AND dd.curso = :curso)'
+ '   INNER JOIN documentos d ON (da.cod_documento = d.codigo)'
+ ' WHERE'
+ '   (da.codigoaluno = :codigoaluno)'
+ '   AND (d.ds_sexo = "A" OR d.ds_sexo = pe.ds_sexo)'
+ '   AND (d.cd_tipo_pessoa = 1 OR d.cd_tipo_pessoa = 2)'
+ ' ORDER BY'
+ '   d.ordem, d.documento';


   tblDoc.ParamByName('curso').AsString := Curso;
   tblDoc.ParamByName('codigoaluno').AsInteger := CodigoAluno;
   end else begin
//      tblDoc.SQL.Text := ' SELECT d.Codigo, d.Documento, d.Sigla, d.cd_siga ' +
//                         '   FROM documentos as d ' +
//                         '  WHERE d.cd_tipo_pessoa IN (1,2) '+
//                         '  ORDER BY d.documento ';

      tblDoc.SQL.Text := ' SELECT '
+ '    dd.curso,'
+ '    dd.sn_obrigatorio,'
+ '    dd.nr_grupo, '
+ '    d.codigo,'
+ '    d.documento,'
+ '    d.sigla,'
+ '    da.apresentou,'
+ '    da.observacao,'
+ '    da.sn_digitalizado,'
+ '    d.nr_dpi,'
+ '    d.nr_largura,'
+ '    d.nr_altura,'
+ '    da.dt_entrega,'
+ '   d.cd_siga'
+ ' FROM'
+ '   documentos_alunos da'
+ '   INNER JOIN pessoas pe ON (da.codigoaluno = pe.cd_pessoa)'
+ '   LEFT OUTER JOIN documentos_necessarios dd ON (da.cod_documento = dd.cod_documento AND dd.curso = :curso)'
+ '   INNER JOIN documentos d ON (da.cod_documento = d.codigo)'
+ ' WHERE'
+ '   (da.codigoaluno = :codigoaluno)'
+ '   AND (d.ds_sexo = "A" OR d.ds_sexo = pe.ds_sexo)'
+ '   AND (d.cd_tipo_pessoa = 1 OR d.cd_tipo_pessoa = 2)'
+ ' ORDER BY'
+ '   d.ordem, d.documento';


   tblDoc.ParamByName('curso').AsString := Curso;
   tblDoc.ParamByName('codigoaluno').AsInteger := CodigoAluno;
   end;
   tblDoc.Open();
end;

procedure TfrmDocumentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
// Tentar ativar as matrículas em reserva do aluno
Var
   qMAt : TUMZQuery;  
begin
   if mudou then begin
   
     DM.CriarConsulta(qMAt);

     qMAt.SQL.Text := 'SELECT codigoaluno, turma, anosemestre FROM matriculas' +
      ' WHERE codigoaluno = ' + IntToStr(CodigoAluno) +
      '   AND situacao = 10 ';
     qMAt.Open;

     while not qMAt.EOF do begin

       DM.Ativar_Matricula(qMAt.FieldByName('codigoaluno').AsInteger, qMAt.FieldByName('turma').AsString, qMAt.FieldByName('anosemestre').AsInteger);

       qMAt.Next();
     end;      


     FreeAndNil(qMAt);

   end;

  Action := caFree;
end;

procedure TfrmDocumentos.tabFiltroChange(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmDocumentos.tblDocCalcFields(DataSet: TDataSet);
begin
   qProcDoc.Close;
   qProcDoc.ParamByName('DOC').Value := tblDocCodigo.Value;
   qProcDoc.ParamByName('CodigoAluno').Value := CodigoAluno;
   qProcDoc.Open;
   
   if qProcDoc.Eof Then
   Begin
       tblDocApresentou.Value := False;
       tblDocObservacao.Value := '';
       tblDocExiste.Value := False;
   End
   Else
   Begin
       tblDocApresentou.Value := Dm.IsTRue(qPRocDoc.FieldByName('apresentou').AsString);
       tblDocObservacao.AsString := qPRocDoc.FieldByName('observacao').AsString;
   End;

end;

procedure TfrmDocumentos.grdDocumentosDblClick(Sender: TObject);
var
   Lugar : Pointer;
   ds_acao : String;
begin
    if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;

    // Inicializa Variavel      
    ds_acao := '';
    if CodigoAluno <> 0 then begin { Existe algum aluno Selecionado }

      mudou := true;

      { Inserir o Documento e Atualizar a consulta }
      qryUpdateDoc.ParamByName('CODIGOALUNO').Value := CodigoAluno;
      qryUpdateDoc.ParamByName('COD_DOCUMENTO').Value := tblDocCodigo.AsInteger;

      ds_acao := 'Marcou';   
      qryUpdateDoc.ParamByName('APRESENTOU').AsString := 'S';
      qryUpdateDoc.ParamByName('DT_ENTREGA').AsDateTime := Now();

      if tblDocApresentou.AsBoolean Then begin
         qryUpdateDoc.ParamByName('APRESENTOU').AsString := 'N';
         qryUpdateDoc.ParamByName('DT_ENTREGA').AsString := '';
         ds_acao := 'Desmarcou';
      end;

      // Grava os logs na tabela log_geral
      DM.setLog(
         1020,
         'Alteracao',
         IntToStr(CodigoAluno)
            + ';'
            + tblDocCodigo.AsString,
         DM.UsuarioLogado.ColigadaLogada,
         ds_acao
      );

      // Executa o replace na tabela de documentos
      qryUpdateDoc.ExecSQL();

      DM.setLog(
         1020,
         '',
         IntToStr(CodigoAluno) + ';' + tblDocCodigo.AsString,
         0,
         'Documento inserido pela matrícula'
      );

      if tblDoccd_siga.AsInteger > 0 then
      begin
        if not tblDocApresentou.AsBoolean then
        begin
           registraDocumentoTabelaSiga(IntToStr(tblDocCodigo.Value),inttostr(CodigoAluno) );
        end else begin
           retiraDocumentacaoSiga();
        end;
      end;

      lugar := tblDoc.GetBookmark();
      tblDoc.Close();
      tblDoc.Open();
      tblDoc.GotoBookmark(lugar);
    end
    else begin
       Mensagem('Nenhum aluno está selecionado!','Atenção', MB_OK + MB_ICONINFORMATION);
    end;

end;

procedure TfrmDocumentos.FormShow(Sender: TObject);
begin
  if trim(curso) = '' then begin
     tabFiltro.TabIndex := 1;
  end else begin
     tabFiltro.TabIndex := 0;
  end;

  Filtrar();
  mudou := false;
end;

procedure TfrmDocumentos.btnFecharDocClick(Sender: TObject);
begin
   close;
end;

procedure TfrmDocumentos.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDoc, pmQtd);

end;

procedure TfrmDocumentos.registraDocumentoTabelaSiga(codDoc, aluno: String);
var
   qyDocumentos: TUMZQuery;
   cd_coligada, nr_codigo_siga_maior, nr_codigo_siga_atual, cd_local, cd_siga: Integer;
   me_observacao, ds_codigo_siga: String;
begin

   dm.CriarConsulta(qyDocumentos);

   {INICIO - BUSCA INFORMAÇÕES DE SIGA_TABELA}

   qyDocumentos.SQL.Text := ''+
   'SELECT '+
	'   doc.cd_siga AS cd_siga, '+
	'   st.cd_local AS cd_local, '+
   '   st.ds_codigo_siga AS ds_codigo_siga,  ' +
   '   st.me_observacao as me_observacao ' +
   ' FROM '+
	'    documentos doc '+
   ' INNER JOIN siga_tabela st ON (st.cd_siga = doc.cd_siga) '+
   ' WHERE '+
	'    codigo = :codigo ';
   
   qyDocumentos.ParamByName('codigo').asInteger := StrToInt(codDoc);
   qyDocumentos.Open;

   cd_siga := qyDocumentos.FieldByName('cd_siga').asInteger;
   cd_local := qyDocumentos.FieldByName('cd_local').asInteger;
   ds_codigo_siga := qyDocumentos.FieldByName('ds_codigo_siga').asString;
   me_observacao := qyDocumentos.FieldByName('me_observacao').asString;

   {FIM - BUSCA INFORMAÇÕES DE SIGA_TABELA}

   {INICIO - BUSCA PELO ATUAL NR_CODIGO_SIGA}

   qyDocumentos.SQL.Text := ''+
   ' SELECT                                   '+
	'    max(nr_codigo_siga) as nr_codigo_siga '+
   ' FROM                                     '+
	'    siga_documentos                       '+
   ' WHERE                                    '+
	'    cd_siga = :cd_siga                    ';

   qyDocumentos.ParamByName('cd_siga').asInteger := cd_siga;
   qyDocumentos.Open;

   nr_codigo_siga_atual := qyDocumentos.FieldByName('nr_codigo_siga').asInteger + 1;
   
   {FIM - BUSCA PELO ATUAL NR_CODIGO_SIGA}

   {INCIO - BUSCA CÓDIGO DA COLIGADA DO CURSO}

   qyDocumentos.SQL.Text := ' '+
   ' SELECT                   '+
   '     cd_coligada          '+
   ' FROM                     '+
   '     cursos_coligadas     '+
   ' WHERE                    '+
   '     cd_curso = :cd_curso ';

   qyDocumentos.ParamByName('cd_curso').AsString := Curso;
   qyDocumentos.Open;

   cd_coligada := qyDocumentos.FieldByName('cd_coligada').AsInteger;

   {FIM - BUSCA CÓDIGO DA COLIGADA DO CURSO}

   {INCIO - INSERE REGISTRO EM SIGA_DOCUMENTOS}
   qyDocumentos.SQL.Text := '     ' +
   'INSERT INTO siga_documentos ( ' +
   '    cd_documento,             ' +
   '    cd_uni_documento,         ' +
   '    cd_local,                 ' +
   '    cd_curso,                 ' +
   '    cd_siga,                  ' +
   '    cd_pessoa_cadastro,       ' +
   '    cd_pessoa_doc ,           ' +
   '    cd_pessoa_resp,           ' +
   '    cd_coligada,              ' +
   '    nr_codigo_siga,           ' + 
   '    ds_codigo_siga,           ' +
   '    me_descricao,             ' +
   '    dt_cadastro               ' +
   ' )                            ' +
   ' VALUES                       ' +
   ' (                            ' +
   '    null,                     ' +
   '    :cd_documento ,           ' +
   '    :cd_local ,               ' +
   '    :cd_curso ,               ' +
   '    :cd_siga ,                ' +
   '    :cd_pessoa_cadastro ,     ' +
   '    :cd_pessoa_doc ,          ' +
   '    :cd_pessoa_resp ,         ' +
   '    :cd_coligada ,            ' +
   '    :nr_codigo_siga ,         ' +
   '    :ds_codigo_siga ,         ' +
   '    :me_descricao ,           ' +
   '    :dt_cadastro              ' +
   ' );                           ' ;

   qyDocumentos.ParamByName('cd_documento').asInteger := StrToInt(codDoc);

   {Caso o registro siga do documento não possua um cd_local informado será
   informado nulo no campo, caso contrário será informado o cd_local normalmente}
   if cd_local <> 0 then
   begin
      qyDocumentos.ParamByName('cd_local').asInteger := cd_local;
   end
   else
   begin
      qyDocumentos.ParamByName('cd_local').Clear;
   end;

   qyDocumentos.ParamByName('cd_curso').asString := Curso;
   qyDocumentos.ParamByName('cd_siga').asInteger := cd_siga;
   qyDocumentos.ParamByName('cd_pessoa_cadastro').asInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
   qyDocumentos.ParamByName('cd_pessoa_doc').AsString := aluno;
   qyDocumentos.ParamByName('cd_pessoa_resp').asInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
   qyDocumentos.ParamByName('cd_coligada').asInteger := cd_coligada;
   qyDocumentos.ParamByName('nr_codigo_siga').asInteger := nr_codigo_siga_atual;
   qyDocumentos.ParamByName('ds_codigo_siga').asString := ds_codigo_siga + '.' + IntToStr(nr_codigo_siga_atual);
   qyDocumentos.ParamByName('me_descricao').asString := me_observacao;
   qyDocumentos.ParamByName('dt_cadastro').asString :=   FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);

   qyDocumentos.ExecSQL;
   {FIM - INSERE REGISTRO EM SIGA_DOCUMENTOS}
end;

procedure TfrmDocumentos.retiraDocumentacaoSiga;
var
   qyDocumentos : TUMZQuery;
begin
   DM.CriarConsulta(qyDocumentos);

   qyDocumentos.SQL.Text := ''+
   ' SELECT               '+
   '    nr_codigo_siga    '+
   ' FROM                 '+
   '    siga_documentos   '+
   ' WHERE                '+
   '    cd_siga = :cd_siga';

   qyDocumentos.ParamByName('cd_siga').asInteger := tblDoccd_siga.AsInteger;
   qyDocumentos.Open;

   if (qyDocumentos.RecordCount > 0) then
   begin

      Mensagem(
         'Você está indicando que um documento recebido não está mais recebido.' + #10+#13 +
            'Favor verificar o recebimento deste documento também no módulo de Documentação '+
            'SIGA que está habilitado para a sua instituição.',
         'UNMIESTRE',
         MB_OK + MB_ICONWARNING + MB_DEFBUTTON3,
         Handle
      );

   end;

   qyDocumentos.Free;
end;

procedure TfrmDocumentos.SpeedButton1Click(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar , True) then Exit;
    if tblDocApresentou.AsString = 'X' then
    begin
       if frmObsDoc = nil then
         Application.CreateForm(TfrmObSDoc, frmObSDoc);

       frmObsDoc.lbDoc.Caption := tblDocDocumento.Value;
       frmObSDoc.eDoc.Text := tblDocObservacao.Value;
       if frmObsDoc.ShowModal = mrOk Then  { Apresentar o form para digitar OBS. }
       Begin
          { Atualizar a Observação do Documento }
          qAux.SQL.Clear;
          qAux.SQL.Add('Update Documentos_Alunos Set Observacao = :OBS');
          qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
          qAux.ParamByName('ALUNO').Value := CodigoAluno;
          qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
          qAux.ParamByName('OBS').Value := frmObsDoc.eDoc.Text;
          qAux.ExecSQL;
          tblDoc.Close;
          tblDoc.Open;
       End;

       frmObsDoc.Free;
       frmObsDoc := nil;
    end
    else
    begin
       Begin
          Mensagem('Não é possível salvar observações para documentos que não foram apresentados para a instituição!', 'Anteção', MB_OK + MB_ICONWARNING,Handle);
       End;
    end;



end;

procedure TfrmDocumentos.SpeedButton2Click(Sender: TObject);
var
   LDocsNecessarios: TIntegerArray;
  largura, altura, dpi: Integer;
  lugar : Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npAcesso, True ) then Exit;

   if not (DM.variavel_parametro('sn_digitaliza_nova') = 'S') then
   begin
      Mensagem(
         'Para utilizar essa funcionalidade, é necessário configurar o parâmetro "sn_digitaliza_nova" com o valor "S"!',
         'Atenção',
         MB_OK + MB_ICONINFORMATION
      );
      Exit;
   end;

   Application.CreateForm(TFDigDocumentos, FDigDocumentos);

   if CodigoAluno <> 0 then
   begin
      tblDoc.First;

      while not tblDoc.Eof do
      begin
         if not tblDocCurso.IsNull Then
         begin
            SetLength(LDocsNecessarios, Length(LDocsNecessarios) + 1);
            LDocsNecessarios[Length(LDocsNecessarios) - 1] :=
               tblDoc.FieldByName('codigo').AsInteger;
         end;

         tblDoc.Next;
      end;
         
      FDigDocumentos.DocsNecessarios := LDocsNecessarios;
      FDigDocumentos.iCodAluno:= CodigoAluno;
      FDigDocumentos.iCodCurso := Curso;

      FDigDocumentos.DelphiTwain1.LibraryLoaded := True;
      FDigDocumentos.DelphiTwain1.SourceManagerLoaded := True;
         
      // Deixar entrar na tela mesmo se não tiver scanner.
      if not ((FDigDocumentos.DelphiTwain1.LibraryLoaded) and (FDigDocumentos.DelphiTwain1.SourceManagerLoaded)) then
      begin
         FDigDocumentos.btnDigitalizar.Enabled := false;
      end;

      // Selecionar a última origem de digitalização utilizada
      try
         Origem := StrToInt(Dm.variavel_parametro('digitalizacao_origem'));
      except
         Origem := -1;
      end;

      FDigDocumentos.ShowModal();
      tblDoc.close();
      tblDoc.Open();
   end;
  
end;

end.

