{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uImportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, Buttons, CheckLst,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uFSelecionarPessoa,
  uFSelecionarCurso, uFSelecionarTurma;

type
  Tfrm_Importacao = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel6: TBevel;
    ImageList1: TImageList;
    qyInstituicoesVestibular: TUMZQuery;
    pcImportacao: TPageControl;
    tsArquivo: TTabSheet;
    tsAlunos: TTabSheet;
    tsConfirmacao: TTabSheet;
    tsConclusao: TTabSheet;
    qyInstituicoesVestibularcd_inst_vestibular: TIntegerField;
    qyInstituicoesVestibularnr_anosemestre: TSmallintField;
    qyInstituicoesVestibularcd_instituicao: TIntegerField;
    qyInstituicoesVestibulards_curso: TStringField;
    qyClassificados: TUMZQuery;
    qyClassificadoscd_candidato: TIntegerField;
    qyClassificadosnm_pessoa: TStringField;
    qyClassificadoscd_inst_vestibular: TIntegerField;
    qyAlunos: TUMZQuery;
    qyAlunoscd_pessoa: TIntegerField;
    qyAlunoscd_inst_vestibular: TIntegerField;
    qyAlunoscd_candidato: TIntegerField;
    Bevel10: TBevel;
    Label9: TLabel;
    SpeedButton7: TSpeedButton;
    Label10: TLabel;
    odArquivoTXT: TOpenDialog;
    qyAlunosds_status: TStringField;
    qyListaAlunos: TUMZQuery;
    qyListaAlunoscd_pessoa: TIntegerField;
    qyListaAlunosds_curso: TStringField;
    qyListaAlunosnm_pessoa: TStringField;
    qyListaAlunoscurso: TStringField;
    qyListaAlunosturma: TStringField;
    qyListaAlunosds_contato: TStringField;
    qyListaAlunoscd_candidato: TIntegerField;
    qyListaAlunosds_status: TStringField;
    srcListaAlunos: TDataSource;
    pnRodape: TPanel;
    Bevel22: TBevel;
    pnCorpo: TPanel;
    cklAlunos: TCheckListBox;
    Label7: TLabel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    cklClassificados: TCheckListBox;
    Panel1: TPanel;
    SpeedButton10: TSpeedButton;
    qyListaAlunoscd_inst_vestibular: TIntegerField;
    qyListaAlunosds_sigla_situacao: TStringField;
    Panel2: TPanel;
    Bevel3: TBevel;
    Panel5: TPanel;
    Bevel18: TBevel;
    Panel6: TPanel;
    Label1: TLabel;
    edAnoSemestre: TMaskEdit;
    UpDownCursos: TUpDown;
    Label2: TLabel;
    edIES: TEdit;
    SpeedButton1: TSpeedButton;
    lbIES: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    edArquivo: TEdit;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    DBGrid2: TDBGrid;
    srcInst: TDataSource;
    qyInst: TUMZQuery;
    qyInstnr_anosemestre: TSmallintField;
    qyInstds_curso: TStringField;
    qyInstnm_instituicao: TStringField;
    qyInstds_arquivo: TStringField;
    qyInstituicoesVestibulards_arquivo: TStringField;
    Panel8: TPanel;
    SpeedButton15: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    SpeedButton16: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Bevel1: TBevel;
    Panel11: TPanel;
    Label4: TLabel;
    edAnoSemestre2: TMaskEdit;
    udAnosemestre: TUpDown;
    Label5: TLabel;
    edDepto: TEdit;
    SpeedButton4: TSpeedButton;
    lbDepartamento: TLabel;
    Bevel4: TBevel;
    Label6: TLabel;
    edCurso: TEdit;
    SpeedButton5: TSpeedButton;
    lbCurso: TLabel;
    Bevel9: TBevel;
    Label8: TLabel;
    edTurma: TEdit;
    SpeedButton8: TSpeedButton;
    lbTurma: TLabel;
    Bevel11: TBevel;
    Label11: TLabel;
    edAluno: TEdit;
    SpeedButton9: TSpeedButton;
    lbAluno: TLabel;
    Bevel12: TBevel;
    SpeedButton17: TSpeedButton;
    Panel12: TPanel;
    Panel13: TPanel;
    SpeedButton11: TSpeedButton;
    Panel14: TPanel;
    Panel15: TPanel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    DBGrid1: TDBGrid;
    qyClassificadosnr_classificacao: TIntegerField;
    qyListaAlunosnr_classificacao: TIntegerField;
    cbTodosAnos: TCheckBox;
    qyListaAlunosanosemestre: TIntegerField;
    qyAlunossn_alterado: TIntegerField;
    procedure SpeedButton17Click(Sender: TObject);
    procedure cklClassificadosClickCheck(Sender: TObject);
    procedure cklAlunosClickCheck(Sender: TObject);
    procedure cklClassificadosKeyPress(Sender: TObject; var Key: Char);
    procedure cklClassificadosClick(Sender: TObject);
    procedure cklAlunosKeyPress(Sender: TObject; var Key: Char);
    procedure cklAlunosClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure pcImportacaoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);

    Function ValidaForm : boolean;
    Function ValidaForm2 : boolean;
    Function buscaChave( valor : integer; pular : integer ):integer;
    Procedure leArquivo( arquivo : string );
    Function temRegistros : boolean;
    Procedure apagarRegistros;

    procedure udAnoSemestre2Click(Sender: TObject;Button: TUDBtnType);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure insereAlunos;
    procedure fazComparacoes(cd_pessoa:integer);
    procedure listaAlunos;
    function BuscaNomePessoa( cd_pessoa : integer ) : string;
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure cklAlunosDblClick(Sender: TObject);
  private

     function Explode(Texto, Separador : String) : TStrings;
     function removeAcentos(Str: String): String;
     function removeEspacos(Str: String): String;

  public
    { Public declarations }
  end;

var
  frm_Importacao: Tfrm_Importacao;
  alunos : array of integer;
  alunos_situ : array of string;
  alunos_inst : array of integer;
  alunos_lista : array of integer;
  alunos_class : array of integer;
  alunos_class_lista : array of integer;

implementation

uses Main, uDM, uSelIES, uSelDepartamento,
  uInserirAluno, uListaAtual, uListaAlunos,
  uAlunosDetalhes, uSelIESVest, uFSplash;

{$R *.dfm}

procedure Tfrm_Importacao.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPress;
  end ;

   lbIES.Caption := '';
   lbDepartamento.Caption := '';
   lbCurso.Caption := '';
   lbTurma.Caption := '';
   lbAluno.Caption := '';
   edAnoSemestre.Text := IntToStr(ano_semestre);
   edAnoSemestre2.Text := IntToStr(ano_semestre);

   pcImportacao.ActivePage := tsArquivo;

  if temRegistros then begin
    if Mensagem('Há registros de outras importações, apagar?', 'Confirmação', 1) = 1 then
      apagarRegistros;
  end;

  qyInst.Close();
  qyInst.Open();

end;

procedure Tfrm_Importacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Importacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Importacao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Importacao.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_Importacao.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     edAnoSemestre.text := DM.incrementar_ano_semestre(edAnoSemestre.Text);
  end
  else
  begin
     edAnoSemestre.text := DM.decrementar_ano_semestre(edAnoSemestre.Text);
  end;


end;

procedure Tfrm_Importacao.udAnoSemestre2Click(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     edAnoSemestre2.text := DM.incrementar_ano_semestre(edAnoSemestre2.Text);
  end
  else
  begin
     edAnoSemestre2.text := DM.decrementar_ano_semestre(edAnoSemestre2.Text);
  end;


end;

procedure Tfrm_Importacao.pcImportacaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := False;
end;

function Tfrm_Importacao.removeAcentos(Str: String): String;
const
   ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
   SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
   x: Integer;
begin

   for x := 1 to Length(Str) do
   begin
      if Pos(Str[x],ComAcento) <> 0 then
      Str[x] := SemAcento[Pos(Str[x], ComAcento)];
      Result := Str;
   end;

end;

function Tfrm_Importacao.removeEspacos(Str: String): String;
const
  cDouble = '  ';
   cOne = ' ';
begin
   result := Str;
   while pos(cDouble,result) > 0 do
   begin
      result := StringReplace(result,cDouble,cOne,[rfReplaceAll]);
   end;
end;

procedure Tfrm_Importacao.SpeedButton1Click(Sender: TObject);
begin

  frm_Sel_IES.ShowModal;
  if frm_Sel_IES.flgSearch then begin
    edIES.Text := frm_Sel_IES.qyIES.FieldByName('cd_instituicao').AsString;
    lbIES.Caption := frm_Sel_IES.qyIES.FieldByName('nm_instituicao').AsString;
  end;

end;

procedure Tfrm_Importacao.SpeedButton4Click(Sender: TObject);
begin

  frmSelDepartamento.ShowModal;
  if frmSelDepartamento.flgSearch then begin
    edDepto.Text := frmSelDepartamento.qryDepartamento.FieldByName('codigo').AsString;
    lbDepartamento.Caption := frmSelDepartamento.qryDepartamento.FieldByName('descricao').AsString;
  end;

end;

procedure Tfrm_Importacao.SpeedButton2Click(Sender: TObject);
begin

  if odArquivoTXT.Execute then
    edArquivo.Text := odArquivoTXT.FileName;

end;

Function Tfrm_Importacao.ValidaForm : boolean;
begin

  if edIES.Text = '' then begin
    Result := false;
    Exit;
  end else if edArquivo.Text = '' then begin
    Result := false;
    Exit;
  end else
    Result := True;

end;

Function Tfrm_Importacao.ValidaForm2 : boolean;
begin

  if edIES.Text = '' then begin
    Result := false;
    Exit;
  end else
    Result := True;

end;

Function Tfrm_Importacao.buscaChave( valor : integer;pular : integer ) : integer;
var
  i : integer;
  chave : integer;
begin

  chave := -1;
  
  i := 0;
  while (i < Length(alunos)) do
  begin
    if(alunos[i] = valor) then
    begin
      if(pular = 0) then
      begin
         break;
      end else begin
       dec(pular);
      end;
    end;
    i := i + 1;
  end;
  if alunos[i] = valor then begin
    chave := i;
  end;

  Result := chave;
end;

Procedure Tfrm_Importacao.leArquivo( arquivo : string );
var
  arq: TextFile;
  linha: String;
  ds_curso: String;
  i, cd_vestibular: Integer;
  classificacao, nome: String;
  linhaAtual: TStrings;
begin

   // Abrindo o arquivo
   AssignFile ( arq, arquivo );
   // Preparando o arquivo para leitura
   Reset ( arq );

   // Lendo o arquivo
   ReadLn ( arq, linha );
   while not Eof ( arq ) do
   begin

      linha := Trim(linha);
      // Processa a linha apenas se não for vazia
      if linha <> '' then begin

         // Se a linha começar com # é porque é um nome de curso
         if copy( linha , 1 , 1 ) = '#' then
         begin

            ds_curso := copy( linha , 2 , Length(linha)-1 );
            ds_curso := Trim( ds_curso );
            with qyInstituicoesVestibular do
            begin
               Close;
               Open;
               Insert;
               FieldByName('nr_anosemestre').AsString := edAnoSemestre.Text;
               FieldByName('cd_instituicao').AsString := edIES.Text;
               FieldByName('ds_curso').AsString := ds_curso;
               FieldByName('ds_arquivo').AsString := arquivo;
               Post;
               Close;
               Open;
               Last;
            end;
            qyInst.Close();
            qyInst.Open();
            cd_vestibular := qyInstituicoesVestibular.FieldByName('cd_inst_vestibular').AsInteger;

      end
      else
      begin

         // Só processa nomes de classificados se já tiver um curso definido
         if (ds_curso <> '') then
         begin

            qyClassificados.Close;
            qyClassificados.Open;
            qyClassificados.Insert;

            nome := '';

            linhaAtual := TStringList.Create;
            linhaAtual := Explode(linha, ' ');

            try
               qyClassificados.FieldByName('nr_classificacao').asInteger := StrToInt(linhaAtual[0]);

               for I := 1 to linhaAtual.Count -1 do   
               begin
                  nome := nome + ' ' + linhaAtual[i];
               end;
               
            except
               qyClassificados.FieldByName('nr_classificacao').Clear;

               for I := 0 to linhaAtual.Count -1 do
               begin
                  nome := nome + ' ' + linhaAtual[i];
               end;

            end;

            qyClassificados.FieldByName('nm_pessoa').AsString := Trim(nome);
            qyClassificados.FieldByName('cd_inst_vestibular').AsInteger := cd_vestibular;
            qyClassificados.Post;

         end;

      end;

   end;

   ReadLn ( arq, linha );
   end;

   // Fazendo o processo todo para a última linha do arquivo
   linha := Trim(linha);
   // Processa a linha apenas se não for vazia
   if linha <> '' then begin

      // Se alinha começar com # é porque é um nome de curso
      if copy( linha , 1 , 1 ) = '#' then
      begin

         ds_curso := copy( linha , 2 , Length(linha)-1 );
         qyInstituicoesVestibular.Close;
         qyInstituicoesVestibular.Open;
         qyInstituicoesVestibular.Insert;
         qyInstituicoesVestibular.FieldByName('nr_anosemestre').AsString := edAnoSemestre.Text;
         qyInstituicoesVestibular.FieldByName('cd_instituicao').AsString := edIES.Text;
         qyInstituicoesVestibular.FieldByName('ds_curso').AsString := ds_curso;
         qyInstituicoesVestibular.Post;
         qyInstituicoesVestibular.Close;
         qyInstituicoesVestibular.Open;
         qyInstituicoesVestibular.Last;
         cd_vestibular := qyInstituicoesVestibular.FieldByName('cd_inst_vestibular').AsInteger;

      end
      else
      begin

         // Só processa nomes de classificados se já tiver um curso definido
         if (ds_curso <> '') then
         begin

            qyClassificados.Close;
            qyClassificados.Open;
            qyClassificados.Insert;

            nome := '';

            linhaAtual := TStringList.Create;
            linhaAtual := Explode(linha, ' ');

            try
               qyClassificados.FieldByName('nr_classificacao').asInteger := StrToInt(linhaAtual[0]);

               for I := 1 to linhaAtual.Count -1 do   
               begin
                  nome := nome + ' ' + linhaAtual[i];
               end;
               
            except
               qyClassificados.FieldByName('nr_classificacao').Clear;

               for I := 0 to linhaAtual.Count -1 do
               begin
                  nome := nome + ' ' + linhaAtual[i];
               end;

            end;

            qyClassificados.FieldByName('nm_pessoa').AsString := Trim(nome);
            qyClassificados.FieldByName('cd_inst_vestibular').AsInteger := cd_vestibular;
            qyClassificados.Post;

         end;

      end;

   end;

   // Fechando o arquivo
   CloseFile ( arq );

end;

Function Tfrm_Importacao.temRegistros : boolean;
begin

  Result := False;

  qyInstituicoesVestibular.Close;
  qyInstituicoesVestibular.Open;
  if qyInstituicoesVestibular.RecordCount > 0 then begin
    Result := True;
    Exit;
  end;

  qyClassificados.Close;
  qyClassificados.Open;
  if qyInstituicoesVestibular.RecordCount > 0 then begin
    Result := True;
    Exit;
  end;

  qyAlunos.Close;
  qyAlunos.Open;
  if qyAlunos.RecordCount > 0 then begin
    Result := True;
    Exit;
  end;

end;

Procedure Tfrm_Importacao.apagarRegistros;
begin

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Text := 'DELETE FROM instituicoes_vestibular';
  DM.qyAux1.ExecSQL;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Text := 'DELETE FROM classificados_vestibular';
  DM.qyAux1.ExecSQL;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Text := 'DELETE FROM alunos_vestibular';
  DM.qyAux1.ExecSQL;

end;

procedure Tfrm_Importacao.SpeedButton3Click(Sender: TObject);
begin

  if not temRegistros then
    Mensagem('Ainda não há nenhuma lista de aprovados no sistema.'+chr(13)+'Para prosseguir importe pelo menos um arquivo.', 'Erro', 0)
  else
    pcImportacao.ActivePage := tsAlunos;

end;

procedure Tfrm_Importacao.insereAlunos;
var
   sql_pessoas: String;
   qyPreComparacoes: TUMZQuery;
   RecNo, totalAlunos: Integer;
begin

  DM.qyAux3.Close;
  DM.qyAux3.SQL.Clear;

   DM.qyAux3.SQL.Add('SELECT ');
   DM.qyAux3.SQL.Add('  p.cd_pessoa, p.nm_pessoa ');
   DM.qyAux3.SQL.Add('FROM ');
   DM.qyAux3.SQL.Add('  pessoas p ');
   DM.qyAux3.SQL.Add('  INNER JOIN matriculas m ON (p.cd_pessoa = m.codigoaluno) ');
   DM.qyAux3.SQL.Add('  INNER JOIN turmas t ON ( ');
   DM.qyAux3.SQL.Add('     m.turma = t.codigo ');
   DM.qyAux3.SQL.Add('     AND m.anosemestre = t.anosemestre ');
   DM.qyAux3.SQL.Add('     AND m.curso = t.curso ');
   DM.qyAux3.SQL.Add('  ) ');
   DM.qyAux3.SQL.Add('  INNER JOIN cursos_coligadas cc ON ( ');
   DM.qyAux3.SQL.Add('     cc.CD_CURSO = m.curso ');
   DM.qyAux3.SQL.Add('     AND t.cd_coligada = cc.CD_COLIGADA ');
   DM.qyAux3.SQL.Add('  ) ');
   DM.qyAux3.SQL.Add('  WHERE ');
   DM.qyAux3.SQL.Add('     1=1 ');

  if cbTodosAnos.Checked = False then
  begin
    DM.qyAux3.SQL.Add(' AND m.anosemestre = :nr_anosemestre ');
    DM.qyAux3.ParamByName('nr_anosemestre').AsString := edAnoSemestre2.Text;
  end;

  if Mensagem( 'Deseja exibir apenas alunos ativos?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
    DM.qyAux3.SQL.Add(' AND (m.situacao NOT IN (3,4,5,6,7,8,10)) ');
  end;

  if ( edDepto.text <> '' ) then begin
    DM.qyAux3.SQL.Add(' AND cc.cd_depto = :cd_depto');
    DM.qyAux3.ParamByName('cd_depto').AsString := edDepto.Text;
  end;

  if ( edCurso.text <> '' ) then begin
    DM.qyAux3.SQL.Add(' AND m.curso = :cd_curso');
    DM.qyAux3.ParamByName('cd_curso').AsString := edCurso.Text;
  end;

  if ( edTurma.text <> '' ) then begin
    DM.qyAux3.SQL.Add(' AND m.turma = :cd_turma');
    DM.qyAux3.ParamByName('cd_turma').AsString := edTurma.Text;
  end;

  if ( edAluno.text <> '' ) then begin
    DM.qyAux3.SQL.Add(' AND m.codigoaluno = :cd_pessoa');
    DM.qyAux3.ParamByName('cd_pessoa').AsString := edAluno.Text;
  end;

  DM.qyAux3.SQL.Add('GROUP BY ');
  DM.qyAux3.SQL.Add(' p.cd_pessoa ');
  DM.qyAux3.SQL.Add('ORDER BY ');
  DM.qyAux3.SQL.Add(' p.nm_pessoa ');
  DM.qyAux3.Open;

  if DM.qyAux3.Eof then begin
    MessageDlg('Estes critérios não retornaram nenhum resultado.', mtInformation, [mbOK], 0);
    Abort;
  end;

  
  sql_pessoas := DM.qyAux3.SQL.Text;

  sql_pessoas := StringReplace(sql_pessoas, ':nr_anosemestre',    edAnoSemestre2.Text,                [rfReplaceAll, rfIgnoreCase]);
  sql_pessoas := StringReplace(sql_pessoas, ':cd_depto',          '"'+edDepto.Text+'"',               [rfReplaceAll, rfIgnoreCase]);
  sql_pessoas := StringReplace(sql_pessoas, ':cd_curso',          '"'+edCurso.Text+'"',               [rfReplaceAll, rfIgnoreCase]);
  sql_pessoas := StringReplace(sql_pessoas, ':cd_turma',          '"'+edTurma.Text+'"',               [rfReplaceAll, rfIgnoreCase]);
  sql_pessoas := StringReplace(sql_pessoas, ':cd_pessoa',         '"'+edAluno.Text+'"',               [rfReplaceAll, rfIgnoreCase]);
  sql_pessoas := StringReplace(sql_pessoas, 'SELECT p.cd_pessoa', 'SELECT p.cd_pessoa, p.nm_pessoa ', [rfReplaceAll, rfIgnoreCase]);

  DM.CriarConsulta(qyPreComparacoes);

  qyPreComparacoes.SQL.Text := ''+
  'UPDATE                      '+
  '   classificados_vestibular '+
  'SET                         '+
  '   ds_primeiro_nome = SUBSTR(nm_pessoa, 1, POSITION(" " IN nm_pessoa))';

  qyPreComparacoes.ExecSQL;

  qyPreComparacoes.Close;
  qyPreComparacoes.SQL.Clear;

  qyPreComparacoes.SQL.Text := '' +
  'DROP TEMPORARY TABLE IF EXISTS alunos_terceiro_ano_pn;';

  qyPreComparacoes.ExecSQL;

  qyPreComparacoes.Close;
  qyPreComparacoes.SQL.Clear;

  qyPreComparacoes.SQL.Text := '' +
  'CREATE TEMPORARY TABLE alunos_terceiro_ano_pn AS '+
  'SELECT '+
  '   cd_pessoa, '+
  '   nm_pessoa, '+
  '   SUBSTR(nm_pessoa, 1, POSITION(" " IN nm_pessoa)) primeiro_nome '+
  'FROM '+
  '   ( '+ sql_pessoas + ' ) as sql_adicao';

  qyPreComparacoes.ExecSQL;

  try

  totalAlunos := DM.qyAux3.RecordCount;

  RecNo := 0;

  TfSplash.GetInstancia().ShowSplashScreen('Aguarde',
     Format('Adicionando pessoas e realizando comparações de nomes, pessoa %d de %d', [RecNo, totalAlunos]));


  while not DM.qyAux3.Eof do begin

    RecNo := RecNo + 1;

    fazComparacoes(DM.qyAux3.FieldByName('cd_pessoa').AsInteger);
    DM.qyAux3.Next;

    TfSplash.GetInstancia().SetSplashText(Format('Adicionando pessoas e realizando comparações de nomes, pessoa %d de %d', [RecNo, totalAlunos]));

  end;
  
  TfSplash.GetInstancia().CloseSplashScreen();
  Mensagem('Alunos registrados com sucesso !', 'Sucesso !', 0);

  except
    on E:Exception do
    begin
      TfSplash.GetInstancia().CloseSplashScreen();
      raise E;
    end;
  end;
end;

procedure Tfrm_Importacao.fazComparacoes(cd_pessoa:integer);
CONST
   SQL_COMPARACAO_PESSOAS = ''+
   'SELECT '+
	'  * '+
   'FROM '+
	'( '+
   '  SELECT '+
	'  	*, SOUNDEX(nomeCertoc), '+
   '     SOUNDEX(nomeParecidoc) '+
   '  FROM '+
   '     ( '+
   '        SELECT '+
	'			  ata.cd_pessoa, '+
	'				ata.primeiro_nome nomeCerto, '+
	'				ata.nm_pessoa nomeCertoc, '+
	'				cv.ds_primeiro_nome nomeParecido, '+
	'				cv.nm_pessoa nomeParecidoc, '+
	'				cv.cd_candidato, '+
	'				cv.cd_inst_vestibular '+
	'			FROM '+
	'				alunos_terceiro_ano_pn ata, '+
	'				classificados_vestibular cv '+
	'			WHERE '+
	'				cd_pessoa = :cd_pessoa AND '+
	'				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SOUNDEX(ata.primeiro_nome),"V",""),"C",""),"S",""),"H",""),"Ç",""),"Y",""),"W","") '+
	'					LIKE '+
	'				CONCAT(SUBSTR(REPLACE(REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (SOUNDEX(cv.ds_primeiro_nome),"V",""),"C",""),"S",""),"H",""),"Ç",""),"Y",""),"W",""),1,4),"%") '+
	'		) soundexes '+
	'	WHERE '+
	'		levenshtein_ratio ( '+
	'			SOUNDEX(nomeCertoc), '+
	'			SOUNDEX(nomeParecidoc) '+
	'		) > :param_comparacao1 '+
	') soundex_semelhante '+
   'WHERE '+
	'  levenshtein_ratio (nomeCertoc, nomeParecidoc) > :param_comparacao2 ';
var
   qyBuscaParam: TUMZQuery;
begin

  DM.CriarConsulta(qyBuscaParam);

  qyBuscaParam.SQL.Text := 'SELECT ds_valor FROM parametros WHERE ds_variavel = "percentual_comparacao_vestibular_estatistica"';

  qyBuscaParam.Open;

  qyAlunos.Close;
  qyAlunos.Open;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.TEXT := SQL_COMPARACAO_PESSOAS;
  DM.qyAux1.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
  DM.qyAux1.ParamByName('param_comparacao2').AsInteger := StrToInt(qyBuscaParam.FieldByName('ds_valor').asString);
  DM.qyAux1.ParamByName('param_comparacao1').AsInteger := StrToInt(qyBuscaParam.FieldByName('ds_valor').asString);
  DM.qyAux1.Open;

  DM.qyAux2.Close;
  DM.qyAux2.SQL.Clear;
  DM.qyAux2.SQL.Add('SELECT cd_pessoa FROM alunos_vestibular WHERE cd_inst_vestibular = :cd_inst_vestibular AND cd_pessoa = :cd_pessoa');

  if DM.qyAux1.Eof then begin
    DM.qyAux2.Close;
    DM.qyAux2.ParamByName('cd_inst_vestibular').AsInteger := 0;
    DM.qyAux2.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
    DM.qyAux2.Open;

    if DM.qyAux2.Eof then begin
      qyAlunos.Insert;
      qyAlunos.FieldByName('cd_pessoa').AsInteger := cd_pessoa;
      qyAlunos.FieldByName('ds_status').AsString := 'Não Encontrado';
      qyAlunos.FieldByName('sn_alterado').AsInteger := 0;
      qyAlunos.Post;
    end;
  end;

  while not DM.qyAux1.Eof do begin

    DM.qyAux2.Close;
    DM.qyAux2.ParamByName('cd_inst_vestibular').AsInteger := DM.qyAux1.FieldByName('cd_inst_vestibular').AsInteger;
    DM.qyAux2.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
    DM.qyAux2.Open;

    if DM.qyAux2.Eof then begin

      qyAlunos.Insert;
      qyAlunos.FieldByName('cd_pessoa').AsInteger := cd_pessoa;
      qyAlunos.FieldByName('cd_inst_vestibular').AsInteger := DM.qyAux1.FieldByName('cd_inst_vestibular').AsInteger;
      qyAlunos.FieldByName('cd_candidato').AsInteger := DM.qyAux1.FieldByName('cd_candidato').AsInteger;

      // Verificando se é idêntico
      if UpperCase(removeAcentos(DM.qyAux1.FieldByName('nomeCertoc').AsString)) = UpperCase(removeAcentos(DM.qyAux1.FieldByName('nomeParecidoc').AsString)) then
        qyAlunos.FieldByName('ds_status').AsString := 'Idêntico'
      else
        qyAlunos.FieldByName('ds_status').AsString := 'Confirmar';

      qyAlunos.FieldByName('sn_alterado').AsInteger := 0;

      qyAlunos.Post;

    end;

  DM.qyAux1.Next;
  end;

end;

function Tfrm_Importacao.BuscaNomePessoa( cd_pessoa : integer ) : string;
begin
  DM.qyPessoas.Close;
  DM.qyPessoas.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
  DM.qyPessoas.Open;

  Result := DM.qyPessoas.FieldByName('nm_pessoa').AsString;
end;

procedure Tfrm_Importacao.listaAlunos;
CONST
   SQL_UPDATE_STATUS_ALUNOS_VESTIBULAR = ''+
   'UPDATE alunos_vestibular set ds_status = :ds_status '+
   'WHERE cd_pessoa = :cd_pessoa AND cd_candidato = :cd_candidato AND cd_inst_vestibular = :cd_inst_vestibular';
var
  i : integer;
  j: integer;
  chave_count, chave : integer;
  qyBuscaCodPessoas: TUMZQuery;
  qyBuscaCandidatosCodPessoa: TUMZQuery;
  qyUpdateStatus: TUMZQuery;
  terminar: Boolean;
begin

  dm.CriarConsulta(qyBuscaCodPessoas);
  dm.CriarConsulta(qyBuscaCandidatosCodPessoa);
  dm.CriarConsulta(qyUpdateStatus);

  qyAlunos.Close;
  qyAlunos.Open;

  cklAlunos.Items.Clear;
  cklClassificados.Items.Clear;

  SetLength(alunos, qyAlunos.RecordCount);
  SetLength(alunos_situ, qyAlunos.RecordCount);
  SetLength(alunos_inst, qyAlunos.RecordCount);
  SetLength(alunos_lista, qyAlunos.RecordCount);

  i := 0;
  while not qyAlunos.Eof do
  begin

    cklAlunos.Items.Add( qyAlunos.FieldByName('cd_pessoa').AsString + ' - ' + BuscaNomePessoa(qyAlunos.FieldByName('cd_pessoa').AsInteger) + ': ' + qyAlunos.FieldByName('ds_status').AsString );

    if (qyAlunos.FieldByName('cd_candidato').AsString <> '') then begin
      cklAlunos.ItemIndex := i;
      cklAlunos.Checked[i] := True;
      if qyAlunos.FieldByName('ds_status').AsString = 'Confirmar' then begin
        cklAlunos.State[i] := cbGrayed;
      end
      else if (qyAlunos.FieldByName('ds_status').AsString = 'Não confirmado') then begin
        cklAlunos.Checked[i] := False;
      end;
    end;

    alunos[i] := qyAlunos.FieldByName('cd_pessoa').AsInteger;
    alunos_situ[i] := qyAlunos.FieldByName('ds_status').AsString;
    alunos_inst[i] := qyAlunos.FieldByName('cd_inst_vestibular').AsInteger;
    alunos_lista[i] := -1;

  i := i + 1;
  qyAlunos.Next;
  end;

  qyClassificados.Close;
  qyClassificados.Open;
  SetLength(alunos_class_lista, qyClassificados.RecordCount);
  SetLength(alunos_class, qyClassificados.RecordCount);
  i := 0;
  while not qyClassificados.Eof do begin

   if ((qyClassificados.FieldByName('cd_candidato').AsInteger = 108424) or
      (qyClassificados.FieldByName('cd_candidato').AsInteger = 107511)) then
   begin
      alunos_class[i] := qyClassificados.FieldByName('cd_candidato').AsInteger;
   end;


    cklClassificados.Items.Add( qyClassificados.FieldByName('nm_pessoa').AsString );
    alunos_class[i] := qyClassificados.FieldByName('cd_candidato').AsInteger;
    alunos_class_lista[i] := -1;

    if qyAlunos.Locate('cd_candidato', qyClassificados.FieldByName('cd_candidato').AsInteger, []) then begin
      cklClassificados.ItemIndex := i;
      cklClassificados.Checked[i] := True;
      if qyAlunos.FieldByName('ds_status').AsString = 'Confirmar' then begin
        cklClassificados.State[i] := cbGrayed;
      end
      else if (qyAlunos.FieldByName('ds_status').AsString = 'Não confirmado') then begin
        cklClassificados.Checked[i] := False;
      end;

      chave := buscaChave(qyAlunos.FieldByName('cd_pessoa').AsInteger, 0);
      j := 0;

      while((alunos_lista[chave] <> -1) AND (chave <> -1)) do
      begin
         j := j +1;

         chave := buscaChave(qyAlunos.FieldByName('cd_pessoa').AsInteger,j);

      end;

      if chave >= 0 then begin
        alunos_class_lista[i] := chave;
      end; 

      qyBuscaCodPessoas.SQL.Text := ''+
      ' SELECT                       '+
      '  cd_pessoa, ds_status        '+
      ' FROM                         '+
      '  alunos_vestibular           '+
      ' WHERE                        '+
      '  cd_candidato = :cd_candidato';

      qyBuscaCodPessoas.ParamByName('cd_candidato').AsInteger :=
         qyClassificados.FieldByName('cd_candidato').AsInteger;

      qyBuscaCodPessoas.Open;

      qyBuscaCodPessoas.First;

      while not qyBuscaCodPessoas.Eof do
      begin

         qyBuscaCandidatosCodPessoa.SQL.Text := ''+
         ' SELECT '+
         '     cv.nm_pessoa, '+
	      '     av.* '+
         '  FROM '+
	      '     alunos_vestibular av '+
         '  INNER JOIN pessoas p ON (p.cd_pessoa = av.cd_pessoa) '+
         '  INNER JOIN classificados_vestibular cv ON ( '+
	      '     cv.cd_candidato = av.cd_candidato '+
         '  )' +
         '  WHERE '+
         '     av.cd_pessoa = :cd_pessoa '+
         '  ORDER BY '+
	      '     cv.nm_pessoa; ';


         qyBuscaCandidatosCodPessoa.ParamByName('cd_pessoa').AsInteger :=
            qyBuscaCodPessoas.FieldByName('cd_pessoa').AsInteger;
            
         qyBuscaCandidatosCodPessoa.Open;

         qyBuscaCandidatosCodPessoa.First;

         qyBuscaCandidatosCodPessoa.Locate('cd_candidato', qyBuscaCandidatosCodPessoa.FieldByName('cd_candidato').AsInteger, []);

         if (qyBuscaCandidatosCodPessoa.RecordCount > 0) then
         begin
            chave_count := 0;

            terminar := False;

            while terminar = False do
            begin

               chave := buscaChave(qyBuscaCodPessoas.FieldByName('cd_pessoa').AsInteger, (chave_count));

               if ((alunos_lista[chave] = -1) or (chave_count > qyBuscaCandidatosCodPessoa.RecordCount)) then
               begin
                  alunos_lista[chave] := i;

                  terminar := True;
               end;

               chave_count := chave_count + 1;

            end;
            
         end;

         try

         {[i] = posição da lista de classificados | [chave] = posição da lsita de alunos }


         if qyAlunos.FieldByName('sn_alterado').AsInteger = 0 then
         begin

            if (removeEspacos(UpperCase(removeAcentos(BuscaNomePessoa(qyBuscaCandidatosCodPessoa.FieldByName('cd_pessoa').AsInteger))))
                = (removeEspacos(UpperCase(removeAcentos(cklClassificados.Items[i]))))) then
            begin
               cklClassificados.Checked[i] := True;
               alunos_class_lista[chave] := i;
               cklAlunos.Items[chave] := StringReplace(cklAlunos.Items[chave], qyAlunosds_status.AsString, 'Idêntico', [rfReplaceAll, rfIgnoreCase]);
               cklAlunos.Checked[chave] := True;

               qyUpdateStatus.SQL.Text := SQL_UPDATE_STATUS_ALUNOS_VESTIBULAR;

               qyUpdateStatus.ParamByName('ds_status').asString := 'Idêntico';
               qyUpdateStatus.ParamByName('cd_pessoa').AsInteger := qyAlunoscd_pessoa.AsInteger;
               qyUpdateStatus.ParamByName('cd_candidato').AsInteger := qyAlunoscd_candidato.AsInteger;
               qyUpdateStatus.ParamByName('cd_inst_vestibular').AsInteger := qyAlunoscd_inst_vestibular.AsInteger;

               cklAlunos.Items[chave] := StringReplace(cklAlunos.Items[chave], 'Confirmar', 'Idêntico', [rfReplaceAll, rfIgnoreCase]);

               qyUpdateStatus.ExecSQL;

               alunos_situ[chave] := 'Idêntico';

            end
            else
            begin
               if (qyBuscaCodPessoas.FieldByName('ds_status').AsString = 'Idêntico') then
               begin
                  cklAlunos.Checked[chave] := False;
                  cklClassificados.State[i] := cbGrayed;
                  alunos_class_lista[chave] := i;
                  cklAlunos.Items[chave] := StringReplace(cklAlunos.Items[chave], 'Idêntico', 'Confirmar', [rfReplaceAll, rfIgnoreCase]);
                  cklAlunos.State[chave] := cbGrayed;

                  qyUpdateStatus.SQL.Text := SQL_UPDATE_STATUS_ALUNOS_VESTIBULAR;

                  qyUpdateStatus.ParamByName('ds_status').asString := 'Confirmar';
                  qyUpdateStatus.ParamByName('cd_pessoa').AsInteger := qyAlunoscd_pessoa.AsInteger;
                  qyUpdateStatus.ParamByName('cd_candidato').AsInteger := qyAlunoscd_candidato.AsInteger;
                  qyUpdateStatus.ParamByName('cd_inst_vestibular').AsInteger := qyAlunoscd_inst_vestibular.AsInteger;

                  alunos_situ[chave] := 'Confirmar';

                  qyUpdateStatus.ExecSQL;
               end
               else
               if ((qyAlunos.FieldByName('ds_status').AsString = 'Confirmar')) then
               begin
                  cklAlunos.Checked[chave] := False;
                  cklClassificados.State[i] := cbGrayed;
                  alunos_class_lista[chave] := i;
                  cklAlunos.Items[chave] := StringReplace(cklAlunos.Items[chave], 'Idêntico', 'Confirmar', [rfReplaceAll, rfIgnoreCase]);
                  cklAlunos.State[chave] := cbGrayed;

                  alunos_situ[chave] := 'Confirmar';
               end
               else
               if (qyAlunos.FieldByName('ds_status').AsString = 'Não confirmado') then
               begin
                  cklClassificados.Checked[i] := False;
                  cklAlunos.Checked[chave] := False;
                  alunos_class_lista[chave] := i;

                  alunos_situ[chave] := 'Não confirmado';
               end;
            end;
            
         end;

         qyBuscaCodPessoas.Next;

         except
            qyBuscaCodPessoas.Next;
         end;

      end;

    end;


  i := i + 1;
  qyClassificados.Next;
  end;

end;

procedure Tfrm_Importacao.SpeedButton6Click(Sender: TObject);
begin

  listaAlunos;

  pcImportacao.ActivePage := tsConfirmacao;

end;

procedure Tfrm_Importacao.SpeedButton5Click(Sender: TObject);
var
   res: TResultadoFiltroCurso;
begin

   res := TfrmSelecionarCurso.Filtrar([]);

   if res.filtrado then
   begin
      edCurso.Text := res.cd_curso;
      lbCurso.Caption := res.ds_curso;
   end;
end;

procedure Tfrm_Importacao.SpeedButton8Click(Sender: TObject);
var
   res: TResultadoFiltroTurma;
begin

   res := TfrmSelecionarTurma.Filtrar([]);

   if res.filtrado then
   begin
      edTurma.Text := res.cd_turma;
      lbTurma.Caption := res.ds_turma;
   end;
end;

procedure Tfrm_Importacao.SpeedButton9Click(Sender: TObject);
var
   res: TResultadoFiltroPessoa;
begin

   res := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if res.filtrado then
   begin
      edAluno.Text := IntToStr(res.cd_pessoa);
      lbAluno.Caption := res.nm_pessoa;
   end;
end;

procedure Tfrm_Importacao.SpeedButton10Click(Sender: TObject);
var
  i : integer;
begin

  {
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Text := 'DELETE FROM alunos_vestibular WHERE cd_pessoa = :cd_pessoa';

  for i := 0 to cklAlunos.Items.Count-1 do begin
    cklAlunos.ItemIndex := i;
    cklAlunos.Items.Strings[cklAlunos.ItemIndex] := cklAlunos.Items.Strings[cklAlunos.ItemIndex];
    if not cklAlunos.Checked[cklAlunos.ItemIndex] then begin
      with DM.qyAux1 do begin
        Close();
        ParamByName('cd_pessoa').AsInteger := alunos[cklAlunos.ItemIndex];
        ExecSQL();
      end;
    end;
  end;
  }

  qyListaAlunos.Close;
  qyListaAlunos.Open;
  pcImportacao.ActivePage := tsConclusao;

end;

procedure Tfrm_Importacao.SpeedButton11Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Importacao.SpeedButton12Click(Sender: TObject);
begin
  pcImportacao.ActivePage := tsArquivo;
end;

procedure Tfrm_Importacao.SpeedButton15Click(Sender: TObject);
begin
  if not ValidaForm2 then begin
    Mensagem('Não deixe de selecionar a Instituição de Ensino Superior!', 'Erro !', 0);
    Exit;
  end;

  if not PrincipalForm.ProcuraForm( TForm(frm_Lista) ) then
    Application.CreateForm( Tfrm_Lista, frm_Lista );

  frm_Lista.lbAnoSemestre.Caption := edAnoSemestre.Text;
  frm_Lista.lbInstituicao.Caption := lbIES.Caption;
  frm_Lista.qyLista.Close;
  frm_Lista.qyLista.ParamByName('cd_instituicao').AsInteger := StrToInt( edIES.Text );
  frm_Lista.qyLista.ParamByName('nr_anosemestre').AsInteger := StrToInt( edAnoSemestre.Text );
  frm_Lista.qyLista.Open;
  frm_Lista.ShowModal;

end;

procedure Tfrm_Importacao.SpeedButton14Click(Sender: TObject);
begin

  if not ValidaForm then begin
    Mensagem('Não deixe de selecionar a Instituição de Ensino Superior nem o Arquivo !', 'Erro !', 0);
    Exit;
  end;
  
  if FileExists(edArquivo.Text) then begin
    leArquivo(edArquivo.Text);

    Mensagem('Arquivo importado com sucesso !', 'Sucesso !', 0);

    if not PrincipalForm.ProcuraForm( TForm(frm_Lista) ) then
      Application.CreateForm( Tfrm_Lista, frm_Lista );

    frm_Lista.lbAnoSemestre.Caption := edAnoSemestre.Text;
    frm_Lista.lbInstituicao.Caption := lbIES.Caption;
    frm_Lista.qyLista.Close;
    frm_Lista.qyLista.ParamByName('cd_instituicao').AsInteger := StrToInt( edIES.Text );
    frm_Lista.qyLista.ParamByName('nr_anosemestre').AsInteger := StrToInt( edAnoSemestre.Text );
    frm_Lista.qyLista.Open;
    frm_Lista.ShowModal;
  end else begin
    Mensagem('Arquivo informado inexistente !', 'Erro !', 0);
    Exit;
  end;

end;

procedure Tfrm_Importacao.SpeedButton16Click(Sender: TObject);
begin

  if not PrincipalForm.ProcuraForm( TForm(frm_ListaAlunos) ) then
    Application.CreateForm( Tfrm_ListaAlunos, frm_ListaAlunos );

  frm_ListaAlunos.qyLista.Close;

  frm_ListaAlunos.qyLista.Open;
  frm_ListaAlunos.ShowModal;

end;

procedure Tfrm_Importacao.SpeedButton13Click(Sender: TObject);
begin

  insereAlunos;

end;

procedure Tfrm_Importacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Importacao.cklAlunosDblClick(Sender: TObject);
begin
  frm_Detalhes.qyDetalhes.Close;
  frm_Detalhes.qyDetalhes.ParamByName('nr_anosemestre').AsString := edAnoSemestre.Text;
  frm_Detalhes.qyDetalhes.ParamByName('cd_pessoa').AsInteger := alunos[cklAlunos.ItemIndex];
  frm_Detalhes.qyDetalhes.ParamByName('cd_inst_vestibular').AsInteger := alunos_inst[cklAlunos.ItemIndex];
  frm_Detalhes.qyDetalhes.Open;

  frm_Detalhes.ShowModal;
end;

procedure Tfrm_Importacao.cklAlunosClick(Sender: TObject);
begin
  if alunos_lista[cklAlunos.ItemIndex] >= 0 then begin
    cklClassificados.ItemIndex := alunos_lista[cklAlunos.ItemIndex];
  end;
end;

procedure Tfrm_Importacao.cklAlunosKeyPress(Sender: TObject; var Key: Char);
begin
  if alunos_lista[cklAlunos.ItemIndex] >= 0 then begin
    cklClassificados.ItemIndex := alunos_lista[cklAlunos.ItemIndex];
  end;
end;

procedure Tfrm_Importacao.cklClassificadosClick(Sender: TObject);
begin
  if alunos_class_lista[cklClassificados.ItemIndex] >= 0 then begin
    cklAlunos.ItemIndex := alunos_class_lista[cklClassificados.ItemIndex];
  end;
end;

procedure Tfrm_Importacao.cklClassificadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if alunos_class_lista[cklClassificados.ItemIndex] >= 0 then begin
    cklAlunos.ItemIndex := alunos_class_lista[cklClassificados.ItemIndex];
  end;
end;

function Tfrm_Importacao.Explode(Texto, Separador: String): TStrings;
var 
    strItem       : String; 
    ListaAuxUTILS : TStrings; 
    NumCaracteres, 
    TamanhoSeparador, 
    I : Integer; 
Begin 
    ListaAuxUTILS    := TStringList.Create; 
    strItem          := ''; 
    NumCaracteres    := Length(Texto); 
    TamanhoSeparador := Length(Separador); 
    I                := 1; 
    While I <= NumCaracteres Do 
      Begin 
        If (Copy(Texto,I,TamanhoSeparador) = Separador) or (I = NumCaracteres) Then 
          Begin 
            if (I = NumCaracteres) then strItem := strItem + Texto[I]; 
            ListaAuxUTILS.Add(trim(strItem)); 
            strItem := ''; 
            I := I + (TamanhoSeparador-1); 
          end 
        Else 
            strItem := strItem + Texto[I]; 

        I := I + 1; 
      End; 
    Explode := ListaAuxUTILS; 
end;

procedure Tfrm_Importacao.cklAlunosClickCheck(Sender: TObject);
CONST
   SQL_CANDIDATO = ''+
   'SELECT                          '+
	'  cd_candidato                  '+
   'FROM                            '+
	'  classificados_vestibular      '+
   'WHERE                           '+
	'  cd_candidato IN (             '+
   '     (                          '+
   '        SELECT                  '+
	'     		cd_candidato         '+
   '        FROM                    '+
   '           alunos_vestibular    '+
   '        WHERE                   '+
   '           cd_pessoa = :cd_aluno'+
   '     )                          '+
	'  )                             '+
   '  AND UPPER(nm_pessoa) LIKE UPPER(:nm_candidato) ';

var
   qryBuscaCandidato: TUMZQuery;
   cd_candidato: Integer;
begin
  if alunos_lista[cklAlunos.ItemIndex] >= 0 then begin
    cklClassificados.ItemIndex := alunos_lista[cklAlunos.ItemIndex];
    cklClassificados.Checked[cklClassificados.ItemIndex] := cklAlunos.Checked[cklAlunos.ItemIndex];

    dm.CriarConsulta(qryBuscaCandidato);

    qryBuscaCandidato.SQL.Text := SQL_CANDIDATO;
    qryBuscaCandidato.ParamByName('cd_aluno').AsInteger := alunos[cklAlunos.ItemIndex];
    qryBuscaCandidato.ParamByName('nm_candidato').asString := cklClassificados.Items[cklClassificados.itemIndex];
    qryBuscaCandidato.Open;

    cd_candidato := qryBuscaCandidato.FieldByName('cd_candidato').AsInteger;

    qryBuscaCandidato.Close;

    if (alunos_situ[cklAlunos.ItemIndex] = 'Confirmar') AND (cklAlunos.Checked[cklAlunos.ItemIndex]) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('ds_status').AsString := 'Semelhante';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();

        alunos_situ[cklAlunos.ItemIndex] := 'Semelhante';
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Semelhante';
    end
    else if (alunos_situ[cklAlunos.ItemIndex] = 'Confirmar') AND (not (cklAlunos.Checked[cklAlunos.ItemIndex])) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();

        alunos_situ[cklAlunos.ItemIndex] := 'Não confirmado';
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';
    end
    else if (alunos_situ[cklAlunos.ItemIndex] = 'Semelhante') AND (not (cklAlunos.Checked[cklAlunos.ItemIndex])) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
        
        alunos_situ[cklAlunos.ItemIndex] := 'Não confirmado';
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';
    end
    else if (alunos_situ[cklAlunos.ItemIndex] = 'Idêntico') AND (not (cklAlunos.Checked[cklAlunos.ItemIndex])) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
        
        alunos_situ[cklAlunos.ItemIndex] := 'Não confirmado';
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';
    end
    else if ((alunos_situ[cklAlunos.ItemIndex] = 'Não confirmado') AND (cklAlunos.Checked[cklAlunos.ItemIndex])) then
    begin
    
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('ds_status').AsString := 'Semelhante';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
        
        alunos_situ[cklAlunos.ItemIndex] := 'Semelhante';
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Semelhante';

    end
    else if ((alunos_situ[cklAlunos.ItemIndex] = 'Não confirmado') AND (not(cklAlunos.Checked[cklAlunos.ItemIndex]))) then
    begin
    
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();

        alunos_situ[cklAlunos.ItemIndex] := 'Não confirmado';
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';

    end;
  end
  else if (alunos_lista[cklAlunos.ItemIndex] = -1) AND (cklAlunos.Checked[cklAlunos.ItemIndex]) then begin

    with qyClassificados do begin
      Close();
      Open();
      Locate('cd_candidato', alunos_class[cklClassificados.ItemIndex], []);
    end;
    if Mensagem('Atribuir o aluno ['+BuscaNomePessoa(alunos[cklAlunos.ItemIndex])+'] desta instituição ao aluno ['+qyClassificados.FieldByName('nm_pessoa').AsString+'] aprovado no vestibular ?', 'Confirmação', 1) = 1 then begin

      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa;cd_candidato', VarArrayOf([alunos[cklAlunos.ItemIndex], cd_candidato]), []);
        Edit();
        FieldByName('cd_candidato').AsInteger := alunos_class[cklClassificados.ItemIndex];
        FieldByName('cd_inst_vestibular').AsInteger := qyClassificados.FieldByName('cd_inst_vestibular').AsInteger;
        FieldByName('ds_status').AsString := 'Semelhante';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();

        alunos_situ[cklAlunos.ItemIndex] := 'Semelhante';
      end;
      cklClassificados.Checked[cklClassificados.ItemIndex] := cklAlunos.Checked[cklAlunos.ItemIndex];
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Semelhante';

    end;
  end;

end;

procedure Tfrm_Importacao.cklClassificadosClickCheck(Sender: TObject);
begin
  if alunos_class_lista[cklClassificados.ItemIndex] >= 0 then begin
    cklAlunos.ItemIndex := alunos_class_lista[cklClassificados.ItemIndex];
    cklAlunos.Checked[cklAlunos.ItemIndex] := cklClassificados.Checked[cklClassificados.ItemIndex];

    if (alunos_situ[cklAlunos.ItemIndex] = 'Confirmar') AND (cklAlunos.Checked[cklAlunos.ItemIndex]) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('ds_status').AsString := 'Semelhante';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Semelhante';
    end
    else if (alunos_situ[cklAlunos.ItemIndex] = 'Confirmar') AND (not (cklAlunos.Checked[cklAlunos.ItemIndex])) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';
    end
    else if (alunos_situ[cklAlunos.ItemIndex] = 'Semelhante') AND (not (cklAlunos.Checked[cklAlunos.ItemIndex])) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';
    end
    else if (alunos_situ[cklAlunos.ItemIndex] = 'Idêntico') AND (not (cklAlunos.Checked[cklAlunos.ItemIndex])) then begin
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';
    end
    else if ((alunos_situ[cklAlunos.ItemIndex] = 'Não confirmado') AND (cklAlunos.Checked[cklAlunos.ItemIndex])) then
    begin
    
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('ds_status').AsString := 'Semelhante';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Semelhante';

    end
    else if ((alunos_situ[cklAlunos.ItemIndex] = 'Não confirmado') AND (not(cklAlunos.Checked[cklAlunos.ItemIndex]))) then
    begin
    
      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('ds_status').AsString := 'Não confirmado';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Não confirmado';

    end;
         
  end
  else if (alunos_lista[cklAlunos.ItemIndex] = -1) AND (cklClassificados.Checked[cklClassificados.ItemIndex]) then begin

    with qyClassificados do begin
      Close();
      Open();
      Locate('cd_candidato', alunos_class[cklClassificados.ItemIndex], []);
    end;
    if Mensagem('Atribuir o aluno ['+BuscaNomePessoa(alunos[cklAlunos.ItemIndex])+'] desta instituição ao aluno ['+qyClassificados.FieldByName('nm_pessoa').AsString+'] aprovado no vestibular ?', 'Confirmação', 1) = 1 then begin

      with qyAlunos do begin
        Close();
        Open();
        Locate('cd_pessoa', alunos[cklAlunos.ItemIndex], []);
        Edit();
        FieldByName('cd_candidato').AsInteger := alunos_class[cklClassificados.ItemIndex];
        FieldByName('cd_inst_vestibular').AsInteger := qyClassificados.FieldByName('cd_inst_vestibular').AsInteger;
        FieldByName('ds_status').AsString := 'Semelhante';
        FieldByName('sn_alterado').AsInteger := 1;
        Post();
      end;
      cklAlunos.Checked[cklAlunos.ItemIndex] := cklClassificados.Checked[cklClassificados.ItemIndex];
      cklAlunos.Items.Strings[cklAlunos.ItemIndex] := IntToStr(alunos[cklAlunos.ItemIndex]) + ' - ' + BuscaNomePessoa(alunos[cklAlunos.ItemIndex]) + ': Semelhante';

    end;
  end;
end;

procedure Tfrm_Importacao.SpeedButton17Click(Sender: TObject);
begin
  pcImportacao.ActivePage := tsAlunos;
end;

end.
