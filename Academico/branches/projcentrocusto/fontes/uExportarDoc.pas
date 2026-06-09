unit uExportarDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, ZConnection, ImgList,
  DBCtrls, ComCtrls, ToolWin, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, jpeg;

type
   TfrmExportarDoc = class(TForm)
      Panel1: TPanel;
      sbBuscaCurso: TSpeedButton;
      lblCurso: TLabel;
      lblTurma: TLabel;
      sbBuscaTurma: TSpeedButton;
      txtCurso: TEdit;
      txtTurma: TEdit;
      Panel4: TPanel;
      Panel2: TPanel;
      Panel3: TPanel;
      dbgAulas: TDBGrid;
      Panel5: TPanel;
      ImageList2: TImageList;
      Bevel2: TBevel;
      Bevel1: TBevel;
      Bevel3: TBevel;
      Panel6: TPanel;
      btnFiltrar: TBitBtn;
      txtDestino: TEdit;
      Label1: TLabel;
      dtcAlunos: TDataSource;
      qyExporta: TUMZQuery;
      qyListaAlunos: TUMZQuery;
      qyListaAlunoscodigoaluno: TIntegerField;
      qyListaAlunosnm_pessoa: TStringField;
      qyListaAlunosnome_pessoa: TStringField;
      txtDepto: TEdit;
      Label2: TLabel;
      sbFindDepto: TSpeedButton;
      toolPessoa: TToolBar;
      ToolButton6: TToolButton;
      DBNavigator1: TDBNavigator;
      ToolButton1: TToolButton;
      btGerar: TToolButton;
      ToolButton3: TToolButton;
      ToolButton4: TToolButton;
      btFechar: TToolButton;
      ToolButton2: TToolButton;
      ImageList1: TImageList;
      btFotos: TToolButton;
      qyListaAlunosdepto: TStringField;
      qyListaAlunosturma: TStringField;
      qyListaAlunoscurso: TStringField;
    Label3: TLabel;
    edAluno: TEdit;
    sbBuscaAluno: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbBuscaAlunoClick(Sender: TObject);
      procedure btFotosClick(Sender: TObject);
      procedure btFecharClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btGerarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure sbBuscaTurmaClick(Sender: TObject);
      procedure qyListaAlunosCalcFields(DataSet: TDataSet);
      procedure sbBuscaCursoClick(Sender: TObject);
      procedure sbFindDeptoClick(Sender: TObject);
      procedure ChecaLimpa(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      FSAnoSem: string;
      FSDeptoStr: string;
      FCodigoColigada: Integer;
      function LimpaString(sStr: string): string;
   public
      procedure Processando(bStatus: Boolean);
      procedure FiltraAlunos( PorTurma : Boolean );
      procedure GerarDocumentosAluno(sCodAluno, sNomeAluno: string);
      procedure GerarFotosAluno(sCodAluno, sNomeAluno, sCurso, sTurma: string);
      function MostraImagem(var Img: TJPEGImage; Campo: String): Boolean;
   strict private
      FSlPartesDoc: TStringList;
      function isDigitalizaNovo: boolean;
      function getSiglaParte(const ASCodParte: string): string;
      procedure exportaDocumentoNovo(const ASCodAluno, ASNomeAluno: string);
      procedure carregaPartesDoc;
   end;

var
  frmExportarDoc: TfrmExportarDoc;


implementation

{$R *.dfm}
uses
   uDM, uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDepartamento, uSplash, StrUtils, Main,
   uFSelecionarPessoa;

var
     frmSpl: TfrmSplash;
{ TfrmExportarDoc }

procedure TfrmExportarDoc.FiltraAlunos(PorTurma : Boolean);
var
   sAux: string;
begin
   if not (Length(txtDepto.Text) > 0) and not (Length(edAluno.Text) > 0)   then begin
      Mensagem('Você precisa selecionar pelo menos um departamento!!');
      Exit;
   end;

   with qyListaAlunos do begin
      Close();
      SQL.Clear();
      Params.Clear();
      //Verifica se a conexão é Oracle ou MySQL
      if Connection.Protocol = 'oracle' then //Oracle
      begin
         if not PorTurma then begin
            SQL.Add(''+
            'SELECT                                                                        '+
            '  FIRST_OCCURRENCE('+QuotedStr(txtDepto.Text)+') AS depto,                    '+
            '  m.codigoaluno,                                                              '+
            '  FIRST_OCCURRENCE(p.nm_pessoa) nm_pessoa,                                    '+
            '  FIRST_OCCURRENCE(m.curso) curso,                                            '+
            '  FIRST_OCCURRENCE(m.turma) turma                                             '+
            'FROM                                                                          '+
            '  matriculas m                                                                '+
            '  INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)                       '+
            '  INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = m.curso)                   '+
            'WHERE                                                                         '+
            '');
         end else begin
            SQL.Add(''+
            'SELECT                                                                        '+
            '  '+QuotedStr(txtDepto.Text)+' as depto,                                               '+
            '  m.codigoaluno,                                                              '+
            '  p.nm_pessoa,                                                                '+
            '  m.curso,                                                                    '+
            '  m.turma                                                                     '+
            'FROM                                                                          '+
            '  matriculas m                                                                '+
            '  INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)                       '+
            '  INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = m.curso)                   '+
            'WHERE                                                                         '+
            '');
         end;
      end else begin
         SQL.Add(''+
         'SELECT                                                                        '+
         '  '+QuotedStr(txtDepto.Text)+' as depto,                                               '+
         '  m.codigoaluno,                                                              '+
         '  p.nm_pessoa,                                                                '+
         '  m.curso,                                                                    '+
         '  m.turma                                                                     '+
         'FROM                                                                          '+
         '  matriculas m                                                                '+
         '  INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)                       '+
         '  INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = m.curso)                   '+
         'WHERE                                                                         '+
         '');
      end;
      sAux := '';
      if (Length(txtDepto.Text) > 0) then begin
         SQL.Add(sAux);
         SQL.Add('(cc.cd_depto = ' + txtDepto.Text + ')');
         sAux := ' AND ';
      end;
      if (Length(FSAnoSem) > 0) then begin
         SQL.Add(sAux);
         SQL.Add('(m.anosemestre = ' + FSAnoSem + ')');
         sAux := ' AND ';
      end;
      if (Length(txtCurso.Text) > 0) then begin
         SQL.Add(sAux);
         SQL.Add('(m.curso = ' + QuotedStr(txtCurso.Text) + ')');
         sAux := ' AND ';
      end;
      if (Length(txtTurma.Text) > 0) then begin
         SQL.Add(sAux);
         SQL.Add('(m.turma = ' + QuotedStr(txtTurma.Text) + ')');
         sAux := ' AND ';
      end;
      if (Length(edAluno.Text) > 0) then begin
         SQL.Add(sAux);
         SQL.Add('m.codigoaluno = "' + edAluno.Text + '"');
         sAux := ' AND ';
      end;

      if not PorTurma then begin

         SQL.Add(''+
         'GROUP BY                                                                      '+
         '   m.codigoaluno                                                              '+
         '');

      end;

      Open();
   end;

end;

procedure TfrmExportarDoc.sbFindDeptoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   { Pesquisar Departamentos }
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      txtDepto.Text := IntToStr(resultado_filtro.cd_departamento);
      FSDeptoStr := resultado_filtro.ds_departamento;
      FCodigoColigada := resultado_filtro.cd_coligada;
   end;
end;

procedure TfrmExportarDoc.sbBuscaAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   Begin
      edAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
   end;

   FiltraAlunos(False);
end;

procedure TfrmExportarDoc.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   if not (Length(txtDepto.Text) > 0) then begin
      Mensagem('Você precisa selecionar um Departamento antes de selecionar o curso!!');
      Exit;
   end;

   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], FCodigoColigada, -1, DM.GetAnoSemestreAtual());

   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      FSAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
      FiltraAlunos( False );
   end;
end;

procedure TfrmExportarDoc.qyListaAlunosCalcFields(DataSet: TDataSet);
begin
   qyListaAlunosnome_pessoa.AsString := LimpaString(qyListaAlunosnm_pessoa.AsString);
end;

function TfrmExportarDoc.LimpaString(sStr: string): string;
begin
   sStr := StringReplace(sStr, '/', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, '\', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, '*', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, '?', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, '<', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, '>', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, '|', '', [rfReplaceAll, rfIgnoreCase]);
   sStr := StringReplace(sStr, ':', '', [rfReplaceAll, rfIgnoreCase]);
   Result := sStr;
end;

procedure TfrmExportarDoc.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   if (Length(txtCurso.Text) = 0) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma turma, por causa do Ano/Semestre', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftCurso, bftAnosemestre, bftDepartamento],
      StrToInt(FSAnoSem), FCodigoColigada, StrToInt(txtDepto.Text), txtCurso.Text);

   if not resultado_filtro.filtrado then Exit;

   txtTurma.Text := resultado_filtro.cd_turma;
   FiltraAlunos( False );
end;

procedure TfrmExportarDoc.btnFiltrarClick(Sender: TObject);
begin
   FiltraAlunos( False );
end;

{ Busca na tabela de situações as partes de documento cadastradas no unimestre.
}
procedure TfrmExportarDoc.carregaPartesDoc;
const
   SQL_PARTES = 'SELECT cd_situacao, ds_sigla FROM situacoes WHERE cd_modulo = 1020';
var
   qySit: TUMZQuery;
begin
   // Inicializa a lista que armazenará as informações
   Self.FSlPartesDoc := TStringList.Create;
   DM.CriarConsulta(qySit);
   try
      qySit.ParamCheck := false;
      qySit.SQL.Text := SQL_PARTES;
      try
         qySit.Open; // Efetua a consulta
      except
         on E: Exception do
         begin
            Mensagem('Não foi possível recuperar as informações das partes do documento.' + #13 + E.Message, 'Erro!', MB_ICONERROR, Self.Handle);
         end;
      end;
      if qySit.IsEmpty then // Verifica se há registros
      begin
         Mensagem('Não foi encontrado cadastro de partes de documentos.', 'Atenção!', MB_ICONWARNING, Self.Handle);
      end
      else
      begin
         // Armazena os registro na lista
         while not qySit.Eof do
         begin
            Self.FSlPartesDoc.Values[qySit.FieldByName('cd_situacao').AsString] :=
               qySit.FieldByName('ds_sigla').AsString;
            qySit.Next;
         end;
      end;
   finally
      qySit.Close;
      qySit.Free;
   end;
end;

procedure TfrmExportarDoc.ChecaLimpa(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
   end;
end;

{ Rotina para exportação de documentos que utilizam a nova estrutura.
}
procedure TfrmExportarDoc.exportaDocumentoNovo(const ASCodAluno,
  ASNomeAluno: string);
const
   // SQL para exportar os documentos
   SQL_EXP =
      'SELECT '+
         'd.codigo,'+
         'd.documento,'+
         'da.im_documento,'+
         'da.cd_tipo '+
      'FROM '+
         'documentos d JOIN documentos_alunos da ON(d.codigo = da.cd_documento) '+
      'WHERE '+
         'da.cd_pessoa = :cd_pessoa '+
      'ORDER BY '+
         'd.documento';
var
   sDir, sFile: string;
   jpg: TJPEGImage;
   qyExp: TUMZQuery;

   // Tenta carregar a imagem
   function carregaImagem(): boolean;
   var
      stream: TStream;
      memStream: TMemoryStream;
   begin
      Result := False;
      if LeftStr(qyExp.FieldByName('im_documento').AsString, 3) = 'ÿØÿ' then
      begin
         memStream := TMemoryStream.Create;
         try
            stream := qyExp.CreateBlobStream(qyExp.FieldByName('im_documento'), bmRead);
            try
               memStream.LoadFromStream(stream);
               // Verifica o tamanho do documento
               if stream.Size > 0 then
               begin
                  jpg.LoadFromStream(memStream);
                  Result := true;
               end;
            finally
               stream.Free;
            end;
         finally
            memStream.Free;
         end;
      end;
   end;

begin
   jpg := TJPEGImage.Create;
   try
      DM.CriarConsulta(qyExp);
      try
         // Efetua a consulta dos documentos
         qyExp.Connection := DM.dbDocs;
         //qyExp.DatabaseName := 'UniDocs'; // Aponta para a base de dados do UNIMESTRE DOCS
         qyExp.SQL.Text := SQL_EXP;
         qyExp.ParamCheck := true;
         qyExp.ParamByName('cd_pessoa').AsString := ASCodAluno;
         try
            qyExp.Open;
         except
            on E:Exception do
            begin
               Mensagem('Não foi possível resgatar os documentos do aluno na base de dados!');
               Exit;
            end;
         end;
         // Verifica se encontrou algum documento
         if not qyExp.IsEmpty then
         begin
            // Tenta criar diretório do departamento
            sDir := Self.txtDestino.Text + '\' + Self.LimpaString(Self.FSDeptoStr);
            if not DirectoryExists(sDir) then
            begin
               MkDir(sDir);
               if not DirectoryExists(sDir) then
               begin
                  Mensagem('Não foi possível criar o diretório do departamento!');
                  Exit;
               end;
            end;
            // Tenta criar diretório do aluno
            sDir := sDir + '\' + LeftStr(Self.LimpaString(ASNomeAluno), 100);
            if not DirectoryExists(sDir) then
            begin
               MkDir(sDir);
               if not DirectoryExists(sDir) then
               begin
                  Mensagem('Não foi possível criar o diretório do estudante!');
                  Exit;
               end;
            end;
            // Percorre os documentos encontrados
            while not qyExp.Eof do
            begin
               // Tenta carregar a imagem
               if carregaImagem then
               begin
                  // Define o caminho completo da imagem
                  sFile := sDir + '\' + Self.LimpaString(qyExp.FieldByName('documento').AsString) + '_' + Self.LimpaString(Self.getSiglaParte(qyExp.FieldByName('cd_tipo').AsString)) + '.jpg';
                  // Salva a imagem
                  jpg.SaveToFile(sFile);
               end;
               qyExp.Next;
            end;
         end;
      finally
         qyExp.Close;
         qyExp.Free;
      end;
   finally
      jpg.Free;
   end;
end;

procedure TfrmExportarDoc.FormShow(Sender: TObject);
begin
   txtDestino.Text := ExtractFileDrive( strWindows ) + '\Documentos\';
   if Self.isDigitalizaNovo then
   begin
      Self.carregaPartesDoc;
   end;
end;

procedure TfrmExportarDoc.GerarDocumentosAluno(sCodAluno, sNomeAluno: string);
var
   sAux, sAux1: string;
   iAux: Integer;
   Jpg:  TJPEGImage;
begin


   Jpg := TJPEGImage.Create();

   with qyExporta do begin
      Connection := DM.dbDocs;
      //DataBaseName := 'UniDocs';
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT                                                                        '+
      '  d.documento,                                                                '+
      '  dd.im_doc1,                                                                 '+
      '  dd.im_doc2,                                                                 '+
      '  dd.im_doc3,                                                                 '+
      '  dd.im_doc4                                                                  '+
      'FROM                                                                          '+
      '  documentos d                                                                '+
      '  INNER JOIN documentos_digitalizados dd ON (d.codigo = dd.cd_documento)      '+
      'WHERE                                                                         '+
      '  dd.cd_pessoa = '+SCodAluno+'                                                          '+
      '');
      Open();
      if not IsEmpty then begin
         sAux := txtDestino.Text + '\' + LimpaString(FSDeptoStr);
         //cria diretorio do depto
         if not (DirectoryExists(sAux)) then begin
            MkDir(sAux);
            if not (DirectoryExists(sAux)) then begin
                Mensagem('Não foi possível Criar o Diretório do Departamento!!');
                Exit;
            end;
         end;
         sNomeAluno := LimpaString(sNomeAluno);


         sAux := sAux + '\' + LeftStr(sNomeAluno, 3);
         //cria diretorio do depto
         if not (DirectoryExists(sAux)) then begin
            MkDir(sAux);
            if not (DirectoryExists(sAux)) then begin
                Mensagem('Não foi possível Criar o Diretório do Departamento!!');
                Exit;
            end;
         end;

         sAux := sAux + '\' + LimpaString(sNomeAluno);
         //cria diretorio do depto
         if not (DirectoryExists(sAux)) then begin
            MkDir(sAux);
            if not (DirectoryExists(sAux)) then begin
                Mensagem('Não foi possível Criar o Diretório do Estudante!!');
                Exit;
            end;
         end;

         qyExporta.First();
         //faz o loop
         while not qyExporta.Eof do begin
            for iAux := 1 to 4 do begin
               if MostraImagem(Jpg, 'im_doc' + IntToStr(iAux)) then begin
                  sAux1 := sAux + '\' + LimpaString(qyExporta.FieldByName('documento').AsString) + '_parte'+IntToStr(iAux)+'.jpg';
                  Jpg.SaveToFile(sAux1);
               end;
            end; //for
            qyExporta.Next();
         end; //while
      end; //if isempty
   end; //with
end;


procedure TfrmExportarDoc.GerarFotosAluno(sCodAluno, sNomeAluno, sCurso, sTurma: string);
var
   sAux, sAux1: string;
   iAux: Integer;
   Jpg:  TJPEGImage;
begin


   Jpg := TJPEGImage.Create();

   with qyExporta do begin
      Connection := DM.db;
      // DataBaseName := 'WMestre12';
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT                                                                '+
      '  p.cd_pessoa,                                                        '+
      '  p.im_pessoa                                                         '+
      'FROM                                                                  '+
      '  pessoas p                                                           '+
      'WHERE                                                                 '+
      '  p.cd_pessoa = '+SCodAluno+'                                         '+
      '');
      Open();
      if not IsEmpty then begin
         sAux := txtDestino.Text + '\' + TRIM(LimpaString(FSDeptoStr));
         //cria diretorio do depto
         if not (DirectoryExists(sAux)) then begin
            MkDir(sAux);
            if not (DirectoryExists(sAux)) then begin
                Mensagem('Não foi possível Criar o Diretório do Departamento!!');
                Exit;
            end;
         end;

         sNomeAluno := LimpaString(sNomeAluno);


         sAux := sAux + '\' + TRIM(LimpaString(sCurso)) + '_';;
         
         //cria diretorio do depto
         if not (DirectoryExists(sAux)) then begin
            MkDir(sAux);
            if not (DirectoryExists(sAux)) then begin
                Mensagem('Não foi possível Criar o Diretório do Curso!!');
                Exit;
            end;
         end;

         sAux := sAux + '\' + TRIM(LimpaString(sTurma)) + '_';
         //cria diretorio do depto
         if not (DirectoryExists(sAux)) then begin
            MkDir(sAux);
            if not (DirectoryExists(sAux)) then begin
                Mensagem('Não foi possível Criar o Diretório da Turma!!');
                Exit;
            end;
         end;

         qyExporta.First();
         //faz o loop
         while not qyExporta.Eof do begin
            if MostraImagem(Jpg, 'im_pessoa') then begin
               sAux1 := sAux + '\' + LimpaString(qyExporta.FieldByName('cd_pessoa').AsString)+'.jpg';
               Jpg.SaveToFile(sAux1);
            end;
            qyExporta.Next();
         end; //while
      end; //if isempty
   end; //with
end;

{ Busca o nome da sigla na lista de parte com base no código da parte.
  Se não encontrar retorno mesmo o código.
}
function TfrmExportarDoc.getSiglaParte(const ASCodParte: string): string;
begin
   Result := Self.FSlPartesDoc.Values[ASCodParte];
   if Result = '' then
   begin
      Result := ASCodParte;
   end;
end;

{ Verifica se o cliente utiliza a nova tela de digitalização de documentos.
}
function TfrmExportarDoc.isDigitalizaNovo: boolean;
begin
   Result := Dm.variavel_parametro('sn_digitaliza_nova') = 'S';
end;

procedure TfrmExportarDoc.btFotosClick(Sender: TObject);
var
   i: Integer;
begin
   if not DirectoryExists(txtDestino.Text) then begin
      //tenta criar
      MkDir(txtDestino.Text);
      if not DirectoryExists(txtDestino.Text) then begin
         Mensagem('Destino Inválido!!!');
         Exit;
      end;
   end;
   FiltraAlunos(True);
   if not qyListaAlunos.IsEmpty then begin
      qyListaAlunos.First();
      Processando(True);
      i := 1;
      while not qyListaAlunos.Eof do begin
         Inc(i);
         frmSpl.Label1.Caption := 'Processando Registro: ' + IntToStr(i) + ' de ' + IntToStr(qyListaAlunos.RecordCount);
         Application.ProcessMessages();
         GerarFotosAluno(qyListaAlunoscodigoaluno.AsString, qyListaAlunosnome_pessoa.AsString, qyListaAlunoscurso.AsString, qyListaAlunosturma.AsString);
         qyListaAlunos.Next();
      end;
      Processando(False);
   end
   else begin
      Mensagem('Nenhum registro a ser exportado!!');
      Exit;
   end;
end;


procedure TfrmExportarDoc.btGerarClick(Sender: TObject);
var
   i: Integer;
begin
   if not DirectoryExists(txtDestino.Text) then begin
      //tenta criar
      MkDir(txtDestino.Text);
      if not DirectoryExists(txtDestino.Text) then begin
         Mensagem('Destino Inválido!!!');
         Exit;
      end;
   end;
   if not qyListaAlunos.IsEmpty then begin
      qyListaAlunos.First();
      Processando(True);
      i := 1;
      while not qyListaAlunos.Eof do begin
         Inc(i);
         frmSpl.Label1.Caption := 'Processando Registro: ' + IntToStr(i) + ' de ' + IntToStr(qyListaAlunos.RecordCount);
         Application.ProcessMessages();
         if Self.isDigitalizaNovo then
         begin
            Self.exportaDocumentoNovo(qyListaAlunoscodigoaluno.AsString, qyListaAlunosnome_pessoa.AsString);
         end
         else
         begin
            GerarDocumentosAluno(qyListaAlunoscodigoaluno.AsString, qyListaAlunosnome_pessoa.AsString);
         end;
         qyListaAlunos.Next();
      end;
      Processando(False);
   end
   else begin
      Mensagem('Nenhum registro a ser exportado!!');
      Exit;
   end;
end;

procedure TfrmExportarDoc.Processando(bStatus: Boolean);
begin
   if bStatus then begin

      if frmSpl = nil then begin
         frmSpl := TfrmSplash.Create(Self);
      end;
      frmSpl.Position := poMainFormCenter;
      //ifrmSpl.FormStyle := fsStayOnTop;
      frmSpl.Label1.Caption := 'Exportando Documentos...';
      frmSpl.Show();
   end
   else begin
      if frmSpl <> nil then begin
         FreeAndNil(frmSpl);
      end;
   end;

end;

function TfrmExportarDoc.MostraImagem(var Img: TJPEGImage; Campo: String): Boolean;
var
   b: TStream;
   m: TMemoryStream;
   sCampo: string;
begin
   Result := False;
   sCampo := Campo;
   if (LeftStr(qyExporta.FieldByName(sCampo).AsString, 3) = 'ÿØÿ') then
   begin
      m := TMemoryStream.Create();
      b := qyExporta.CreateBlobStream(qyExporta.FieldByName(sCampo), bmRead);
      try
         m.LoadFromStream(b);
         if b.Size > 0 then
         begin
            img.LoadFromStream(m);
            Result := True;
         end;
      finally
         m.Free();
         b.Free();
      end;
   end;

end;



procedure TfrmExportarDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(Self.FSlPartesDoc) then
   begin
      Self.FSlPartesDoc.Free;
   end;
   Action := caFree;
end;

procedure TfrmExportarDoc.FormCreate(Sender: TObject);
const
   SMsgSemConexao =
      'Não foi possivel estabelecer conexão com a base de documentos do UNIMESTRE.';
begin
   if not DM.ConectaUnimestreDocs then
   begin
      Mensagem(SMsgSemConexao, 'Erro', MB_ICONERROR + MB_OK, Handle);
      Abort;
   end;
end;

procedure TfrmExportarDoc.btFecharClick(Sender: TObject);
begin
   Self.Close();
end;

end.
