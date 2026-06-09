unit uDiario_Classe_Exportacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, Buttons, 
  Db, ZConnection, IBDatabase, IBSQL, IBCustomDataSet, IBTable,
  FileCtrl, md5, ToolWin, ImgList, Menus;

type
  Tfrm_Diario_Classe_Exportacao = class(TForm)
    Panel1: TPanel;
    qProfessores: TUMZQuery;
    Database1: TZConnection;
    qTurmas: TUMZQuery;
    dsTurmas: TDataSource;
    qAux: TUMZQuery;
    qAlunos: TUMZQuery;
    qFicha: TUMZQuery;
    tParametros: TZTable;
    tParametrosNomeFantasia: TStringField;
    tParametrosRazaSocial: TStringField;
    tParametrosEndereco: TStringField;
    tParametrosBairro: TStringField;
    tParametrosCidade: TStringField;
    tParametrosEstado: TStringField;
    tParametrosEstadoCompleto: TStringField;
    tParametrosEmail: TStringField;
    tParametrosTelefone: TStringField;
    qTurmasCurso: TStringField;
    qTurmasDsCurso: TStringField;
    qTurmasCodigo: TStringField;
    qTurmasDisciplina: TSmallintField;
    qTurmasDescricao: TStringField;
    qTurmasAnoSemestre: TSmallintField;
    qTurmasBimestre: TIntegerField;
    qTurmasQtadeBimestres: TSmallintField;
    qTurmasImport: TUMZQuery;
    qCursos: TUMZQuery;
    Panel2: TPanel;
    Label1: TLabel;
    eAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    eProfessor: TEdit;
    Label2: TLabel;
    eCurso: TEdit;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    gdTurmas: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    Diretorio: TDirectoryListBox;
    Drive: TDriveComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel7: TPanel;
    Bevel3: TBevel;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btProcuraProfessor: TToolButton;
    btProcuraCurso: TToolButton;
    Bevel4: TBevel;
    btCopiarDisquete: TToolButton;
    pmQtdTurmas: TPopupMenu;
    procedure btProcuraProfessorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eBimestreChange(Sender: TObject);
    Procedure ListarTurmas;
    procedure eAnoSemestreChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btCopiarDisqueteClick(Sender: TObject);
    procedure btProcuraCursoClick(Sender: TObject);
    procedure qTurmasCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure eCursoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmQtdTurmasPopup(Sender: TObject);
  private
    { Private declarations }

    Function Formata_Inteiros( value : Integer; Tamanho : Integer ) : String;
    Function Formata_Datas( value : TDateTime ) : String;
    Function Formata_Textos( value : String; Tamanho : Integer) : String;
    Function Formata_Numeros( value : double ) : String;
    function nomear(nome : string) : String;

  public
    { Public declarations }
  end;

var
  frm_Diario_Classe_Exportacao: Tfrm_Diario_Classe_Exportacao;
  Professor : Integer;
  Curso : String;
  login, senha : string;

implementation

uses uDM;

{$R *.DFM}

procedure Tfrm_Diario_Classe_Exportacao.btProcuraProfessorClick(Sender: TObject);
{
  Abre a janela para procurar um Professor
  É apresentado todos os professores do AnoSemestre Selecionado
}
begin
  with qProfessores do
  Begin
     Close;
     SQL.Clear;
     SQl.Add('select DISTINCT P.Nome, P.codigo, P.Senha, T.AnoSemestre');
     Sql.Add('From Professores P, TurmasPRofessores T');
     Sql.Add('Where P.codigo = T.Professor AND T.AnoSemestre = :anosemestre');
     SQL.Add( 'order by Nome' );

     ParamByName('AnoSemestre').AsInteger := StrToInt(eAnoSemestre.Text);
     Prepare;
     Open;
  End;

{//  if wwLookupProfessor.Execute then
  begin
     eProfessor.Text := qProfessores.FieldByName('Nome').AsString;
     Professor := qProfessores.FieldByName('Codigo').AsInteger;
     Login := qProfessores.FieldByName('Codigo').AsString;
     Senha := qProfessores.FieldByName('senha').AsString;
     ListarTurmas;
  end;
}//
end;

procedure Tfrm_Diario_Classe_Exportacao.FormShow(Sender: TObject);
Var mes, dia, ano : word;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Definir Ano/Semestre }

  DecodeDate(Date, ano, mes, dia);

  if mes >= 7 then
     eAnoSemestre.Text := IntToStr(Ano) + '2'
  Else
     eAnoSemestre.Text := IntToStr(Ano) + '1';
     
  Professor := 0;
end;

Procedure Tfrm_Diario_Classe_Exportacao.ListarTurmas;
Begin
     {
       Listar as Turmas do Professor Selecionado
       Essas Turmas é que serão Importadas para o Diário
     }
     if Professor <> 0 Then
	With qturmas do
	Begin
	    Close;
	    ParamByNAme('Professor').AsInteger := Professor;
	    ParamByNAme('AnoSemestre').AsInteger := StrToInt(eAnoSemestre.Text);
	    ParamByName('Curso').AsString := '%' + eCurso.Text + '%';
	    Prepare;
	    Open;
	    if not EOF Then
	       btCopiarDisquete.Enabled := True
	    Else
	       btCopiarDisquete.Enabled := False;
	End;
End;


procedure Tfrm_Diario_Classe_Exportacao.eBimestreChange(Sender: TObject);
begin
   { Se ja escolheu um professor então listar suas turmas }
   if Professor <> 0 Then
      ListarTurmas;
end;

procedure Tfrm_Diario_Classe_Exportacao.eAnoSemestreChange(Sender: TObject);
begin
   { Se ja escolheu um professor então listar suas turmas }
   if Professor <> 0 Then
      ListarTurmas;
end;

procedure Tfrm_Diario_Classe_Exportacao.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
{ Proc. usada para controlar o SpinEdit (AnoSemestre) }
begin

  intAno := StrToInt(Copy(eAnoSemestre.Text,1,4));
  intSemestre := StrToInt(Copy(eAnoSemestre.Text,5,1));

  if Button = btNext then
  begin
    Inc( intSemestre );
    if intSemestre = 3 then
    begin
      Inc( intAno );
      intSemestre := 1;
    end;
  end
  else
  begin
    Dec( intSemestre );
    if intSemestre = 0 then
    begin
      Dec( intAno );
      intSemestre := 2;
    end;
  end;

  eAnoSemestre.Text := IntToStr( intAno ) + IntToStr( intSemestre );

  ListarTurmas;
end;


procedure Tfrm_Diario_Classe_Exportacao.btCopiarDisqueteClick(Sender: TObject);
Var mes, dia, ano : word;
    MesExt : Array[1..12] of string[5];
    arquivo : SYSTEM.TEXT;
    nome_arquivo : String;
    linha : String;
Begin

  // Os Meses são para formular o nome do Arquivo;
  MesExt[1]  := 'Jan';
  MesExt[2]  := 'Fev';
  MesExt[3]  := 'Mar';
  MesExt[4]  := 'Abr';
  MesExt[5]  := 'Mai';
  MesExt[6]  := 'Jun';
  MesExt[7]  := 'Jul';
  MesExt[8]  := 'Ago';
  MesExt[9]  := 'Set';
  MesExt[10] := 'Out';
  MesExt[11] := 'Nov';
  MesExt[12] := 'Dez';

  DecodeDate(Date, ano, mes, dia);

  { Dar nome para o Arquivo }

  nome_arquivo := nomear(eProfessor.Text);
  nome_arquivo := nome_arquivo + '_' + eAnoSemestre.Text + '_' + MesExt[mes];

  nome_arquivo := Diretorio.Directory + '\'+ nome_arquivo + '.UNI';

  AssignFile(arquivo, nome_arquivo);
  Rewrite(arquivo);

  { Gravar dados do professor }

  linha := '';
  linha := linha + '01';  // Identificação do Tipo = PROFESSORES
  linha := linha + Formata_Inteiros(Professor, 7);
  linha := linha + eAnoSemestre.Text;
  linha := linha + Formata_Textos(eProfessor.Text, 100);
  linha := linha + Formata_Textos(tParametrosNomeFantasia.Text, 100);
  linha := linha + Formata_Textos(tParametrosRazaSocial.Text, 100);
  linha := linha + Formata_Textos(tParametrosEmail.Text, 100);
  linha := linha + Formata_Textos(login, 32);
  linha := linha + Formata_Textos(senha, 32);

  // Criptografar a Linha

  linha := linha + MD5Print(MD5String(linha));

  writeln(arquivo, linha);

 { Gravar dados das TURMAS }
  qTurmas.First;

  while not qTurmas.Eof do
  Begin

      linha := '';
      linha := linha + '02';  // Identificação do Tipo = TURMAS
      linha := linha + Formata_Textos(qTurmasCodigo.AsString, 15);
      linha := linha + Formata_Inteiros(qTurmasDisciplina.AsInteger, 10);
      linha := linha + eAnoSemestre.Text;
      linha := linha + Formata_Inteiros(qTurmasBimestre.AsInteger, 2);
      linha := linha + Formata_Inteiros(qTurmasQtadeBimestres.AsInteger, 2);
      linha := linha + Formata_Textos(qTurmasDescricao.AsString, 50);
      linha := linha + Formata_Textos(qTurmasCurso.AsString, 15);
      linha := linha + Formata_Textos(qTurmasDsCurso.AsString, 80);
      linha := linha + Formata_Textos(' ', 200); // Fórmula Média não é exportada da secretaria;

      linha := linha + MD5Print(MD5String(linha));

      writeln(arquivo, linha);

      qTurmas.Next;
  End;

  { Importar para Tabela de Matriculas }

  qTurmas.First;

  While not qTurmas.Eof Do Begin

       With qAlunos do
       Begin
	   { Preparar os Dados dos Alunos para Importação }
	   Close;
	   ParamByNAme('Professor').AsInteger := Professor;
	   ParamByNAme('AnoSemestre').AsInteger := qTurmas.FieldByName('AnoSemestre').AsInteger;
	   ParamByNAme('Turma').AsString := qTurmas.FieldByName('Codigo').Value;
	   ParamByName('Curso').AsString := qTurmas.FieldByName('Curso').Value;
	   ParamByName('Disciplina').AsString := qTurmas.FieldByName('Disciplina').Value;
	   Prepare;
	   Open;
       End;

       qAlunos.First;

       { Inserir todos os alunos da Turma Atual (loop externo)}
       while not qAlunos.Eof do Begin

	   linha := '';
	   linha := linha + '05';  // Identificação do Tipo = FICHAS
	   linha := linha + Formata_Textos(qTurmasCodigo.AsString, 15);
	   linha := linha + Formata_Inteiros(qTurmasDisciplina.AsInteger, 10);
	   linha := linha + eAnoSemestre.Text;
	   linha := linha + Formata_Inteiros(qTurmasBimestre.AsInteger, 2);
	   linha := linha + Formata_Inteiros(qAlunos.FieldByName('CODIGOALUNO').AsInteger, 10);
	   linha := linha + Formata_Textos(qAlunos.FieldByName('ALUNO').AsString, 100);
	   linha := linha + Formata_Inteiros(qAlunos.FieldByName('SITUACAO').AsInteger, 2);
	   linha := linha + Formata_Textos('', 50); // Observação não é exportada pela secretaria
	   linha := linha + Formata_Datas(qAlunos.FieldByName('DATASAIDA').AsDateTime);

	   linha := linha + MD5Print(MD5String(linha));
	   
	   writeln(arquivo, linha);

	   qAlunos.Next;
       End;

       qTurmas.Next;
  End;

  { Importar para Tabela de ficha // Não é usado para Universidade }

  qTurmas.First;
  while not qTurmas.Eof do Begin

       qficha.Close;
       qficha.ParamByName('Turma').Value := qTurmas.FieldByName('Codigo').Value;
       qficha.ParamByName('Disciplina').Value := qTurmas.FieldByName('Disciplina').Value;
       qficha.ParamByName('AnoSemestre').Value := qTurmas.FieldByName('AnoSemestre').Value;
       qficha.Prepare;
       qFicha.Open;

       While not qFicha.EOF do Begin

	   linha := '';
	   linha := linha + '07';  // Identificação do Tipo = FICHAS
	   linha := linha + Formata_Textos(qTurmasCodigo.AsString, 15);
	   linha := linha + Formata_Inteiros(qTurmasDisciplina.AsInteger, 10);
	   linha := linha + eAnoSemestre.Text;
	   linha := linha + Formata_Inteiros(qFicha.FieldByName('codigoaluno').AsInteger, 10);
	   linha := linha + Formata_Numeros(qFicha.FieldByName('Nota1').AsFloat);
	   linha := linha + Formata_Numeros(qFicha.FieldByName('Nota2').AsFloat);
	   linha := linha + Formata_Numeros(qFicha.FieldByName('Nota3').AsFloat);
	   linha := linha + Formata_Numeros(qFicha.FieldByName('Nota4').AsFloat);
	   linha := linha + Formata_Inteiros(qFicha.FieldByName('Faltas').AsInteger,5);

	   linha := linha + MD5Print(MD5String(linha));
	   
	   writeln(arquivo, linha);

	   qficha.Next;
       End;

       qTurmas.Next;

  End;

  CloseFile(arquivo);
  Messagedlg('Arquivo Exportado com sucesso.', mtInformation, [mbOk], 0); 

  qTurmas.EnableControls;

end;

procedure Tfrm_Diario_Classe_Exportacao.btProcuraCursoClick(Sender: TObject);
begin
  with qProfessores do
  Begin
     Close;
     SQL.Clear;
     SQL.Add( 'select DISTINCT Curso from Diario_Extrair_Turmas where AnoSemestre = :AnoSemestre' );
     SQL.Add( 'order by Curso' );
     ParamByName('AnoSemestre').AsInteger := StrToInt(eAnoSemestre.Text);
     Prepare;
     Open;
  End;

end;

procedure Tfrm_Diario_Classe_Exportacao.qTurmasCalcFields(DataSet: TDataSet);
begin
  With qTurmasImport do Begin
      Close;
      ParamByName('TURMA').VAlue := qTurmas.FieldByName('Codigo').Value;
      ParamByName('CURSO').VAlue := qTurmas.FieldByName('Curso').Value;
      ParamByName('Disciplina').VAlue := qTurmas.FieldByName('Disciplina').Value;
      ParamByName('AnoSemestre').Value := qTurmas.FieldByName('AnoSemestre').Value;
      Open;
      try
         if qTurmasImport.FieldByNamE('BIM').Value >= qTurmas.FieldByName('QtadeBimestres').Value then
            qTurmasBimestre.Value := 0
         Else
            qTurmasBimestre.Value := qTurmasImport.FieldByNamE('BIM').Value + 1;
      Except
           qTurmasBimestre.Value := 1;
      End;

  End;
end;

procedure Tfrm_Diario_Classe_Exportacao.SpeedButton1Click(Sender: TObject);
begin
  with qCursos do
  Begin
     Close;
     SQL.Clear;
     SQL.Add( 'select DISTINCT Curso, DSCURSO from Diario_Extrair_Turmas where AnoSemestre >= :AnoSemestre' );
     SQL.Add( 'order by CURSO' );
     ParamByName('AnoSemestre').AsInteger := StrToInt(eAnoSemestre.Text);
     Prepare;
     Open;
  End;

{//  if wwLookupCursos.Execute then
  begin
     eCurso.Text := qCursos.FieldByName('CURSO').AsString;
     ListarTurmas;
  end;
}//

end;

procedure Tfrm_Diario_Classe_Exportacao.eCursoExit(Sender: TObject);
begin
   ListarTurmas;
end;

function Tfrm_Diario_Classe_Exportacao.Formata_Inteiros(value, Tamanho: Integer): String;
Var
   Text : String;
begin
   Text := IntToStr(value);

   While Length(Text) < Tamanho do
	Text := '0' + Text;

   result := Text;
end;

function Tfrm_Diario_Classe_Exportacao.Formata_Datas(value: TDateTime): String;
Var
   Text : String;
begin

   Text := FormatDateTime('ddmmyyyy', value);

   result := Text;
   
end;

function Tfrm_Diario_Classe_Exportacao.Formata_Textos(value: String;
  Tamanho: Integer): String;
Var
   Text : String;
begin

   Text := value;

   While Length(Text) < Tamanho do
      Text := Text + ' ';

   result := Text;

end;

function Tfrm_Diario_Classe_Exportacao.nomear(nome: string): String;
Var acentos, semacentos : String;
    indice, posicao : integer;
begin
  // Script para descobrir se existe acentuação no nome do arquivo
  acentos    := 'ÁÉÍÓÚÃÕáéíóúàèìòùâêîôûãõçABCDEFGHIJKLMNOPQRSTUVXYZ !@#$%¨&*()+=`´{[ª^~}]º|<>,:;?/§¹²³°£¢'; //Lista de caracteres inválidos
  semacentos := 'aeiouaoaeiouaeiouaeiouaocabcdefghijklmnopqrstuvxyz______________________________________';  // Lista de caracteres equivalentes

  For Indice := 1 To Length(nome) do
  Begin
      posicao := Pos(Copy(nome,indice,1),acentos);
      if posicao > 0 Then
        nome := Copy(nome,1,indice-1) + Copy(semacentos,posicao,1) + Copy(nome,indice+1,Length(nome))
  End;

  result := nome // ' Retorna o valor da função

end;


function Tfrm_Diario_Classe_Exportacao.Formata_Numeros(value: double): String;
Var
   Text : String;
begin
   Text := Trim(FloatToStrF(value, ffFixed, 5, 2)) ;

   Text := Copy(Text, 1, Length(Text) - 3) + Copy(Text, Length(Text)-1, 2);

   while Length(Text) < 4 do
	Text := '0' + Text;

   Result := Text;

end;

procedure Tfrm_Diario_Classe_Exportacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Diario_Classe_Exportacao.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Diario_Classe_Exportacao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F8 : btProcuraProfessor.Click;
      VK_F9 : btProcuraCurso.Click;
      VK_F12 : btnFechar.Click;
   End;
end;

procedure Tfrm_Diario_Classe_Exportacao.pmQtdTurmasPopup(Sender: TObject);
begin
  DM.quantidade_registros(qTurmas, pmQtdTurmas);

end;

end.

