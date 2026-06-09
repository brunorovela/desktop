unit uDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls,
  ComCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, DBCGrids, Menus;

type
  TfrmDocumentos = class(TForm)
    Panel3: TPanel;
    grdDocumentos: TDBGrid;
    Bevel1: TBevel;
    Label2: TLabel;
    lbAluno: TLabel;
    Label5: TLabel;
    tblDoc: TUMZQuery;
    tblDocCodigo: TSmallintField;
    tblDocDocumento: TStringField;
    tblDocObservacao: TStringField;
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
  public
    CodigoAluno : Longint;
    Curso : string;
    { Public declarations }
  end;

var
  frmDocumentos: TfrmDocumentos;

implementation

uses Main, uObsDocumento, uUsuario, uDM;

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
var Lugar : Pointer;
begin
    if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;

    if CodigoAluno <> 0 then begin { Existe algum aluno Selecionado }

       mudou := true;

       { Inserir o Documento e Atualizar a consulta }
       qryUpdateDoc.ParamByName('CODIGOALUNO').Value := CodigoAluno;
       qryUpdateDoc.ParamByName('COD_DOCUMENTO').Value := tblDocCodigo.AsInteger;

       if tblDocApresentou.AsBoolean Then begin
          qryUpdateDoc.ParamByName('APRESENTOU').AsString := 'N';
          DM.setLog(1020, 'Alteracao', IntToStr(CodigoAluno) + ';' + tblDocCodigo.AsString, DM.UsuarioLogado.ColigadaLogada, 'Desmarcou');
       end
       else begin
          qryUpdateDoc.ParamByName('APRESENTOU').AsString := 'S';
          DM.setLog(1020, 'Alteracao', IntToStr(CodigoAluno) + ';' + tblDocCodigo.AsString, DM.UsuarioLogado.ColigadaLogada, 'Marcou');
       end;

//       Dm.ativar_matricula()

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
  tblDoc.Close;
  tblDoc.Open;
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

end.

