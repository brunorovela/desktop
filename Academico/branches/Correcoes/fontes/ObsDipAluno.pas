unit ObsDipAluno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZConnection, Db, StdCtrls, ExtCtrls, DBCtrls, Buttons,
  ComCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ZSqlUpdate;

type
  TfmObsDipAluno = class(TForm)
    mmobs: TDBMemo;
    Panel1: TPanel;
    dsHist: TDataSource;
    quHist: TUMZQuery;
    usHist: TZUpdateSQL;
    qualuno: TUMZQuery;
    DataSource1: TDataSource;
    qucurso: TUMZQuery;
    DataSource2: TDataSource;
    Panel2: TPanel;
    DBText2: TDBText;
    DBText1: TDBText;
    Bevel1: TBevel;
    Panel3: TPanel;
    Bevel2: TBevel;
    lblCurso: TLabel;
    txtCurso: TEdit;
    btnCurso: TSpeedButton;
    Label9: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    SpeedButton2: TSpeedButton;
    txtCodigoAluno: TEdit;
    lblCodigoAluno: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnFechar: TSpeedButton;
    quHistcodigoaluno: TIntegerField;
    quHistcurso: TStringField;
    quHistobs: TMemoField;
    qualunonm_pessoa: TStringField;
    qucursodescricao: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure dsHistStateChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quHistBeforePost(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure eecursoExit(Sender: TObject);
    procedure eealunoChange(Sender: TObject);
    procedure eealunoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    wpcol  : tstringlist; //colunas a ser passadas
    procedure Inicia;
    procedure apertoubotao;
  public
    { Public declarations }
  end;

var
  fmObsDipAluno: TfmObsDipAluno;

implementation

uses udm,tabbusca, uFSelecionarPessoa, Main, uFSelecionarCurso, uUMNucleo, ClassCursos;
{$R *.DFM}

procedure TfmObsDipAluno.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfmObsDipAluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if quHist.state in [dsinsert, dsedit] then begin
     Mensagem('A operação ainda está pendente finalize-a!');
     abort;
  end;
  if quAluno.Active then quAluno.close;
  if quCurso.Active then quCurso.close;
  wpcol.Free;
  wpcol := nil;

   if fmtabbusca <> nil then
   begin
      fmtabbusca.free;
      fmtabbusca := nil;
   end;
end;

procedure TfmObsDipAluno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
      VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
   end;
end;

procedure TfmObsDipAluno.quHistBeforePost(DataSet: TDataSet);
begin
  if (txtcurso.Text = '') or (txtCodigoAluno.Text = '') then begin
     Mensagem('O Aluno e o curso devem ser preenchidos!');
     abort;
  end;
  if (quhist.FieldByName('codigoaluno').asstring = '') or
     (quhist.FieldByName('curso').asstring       = '')  then
     quhist.FieldByName('codigoaluno').asinteger := strtoint(txtCodigoAluno.text);
     quhist.FieldByName('curso').asstring        := txtCurso.text;
     quhist.FieldByName('nr_anosemestre').AsString        := txtAnoSemestre.Text;

end;

procedure TfmObsDipAluno.btnGravarClick(Sender: TObject);
begin
TRY
  // se estiver vazio não grava
  if mmobs.Text = '' then
    exit;

  if quHist.active then begin
     With Dm.db do Begin
        ExecuteDirect('DELETE FROM obsdipaluno WHERE codigoaluno='+txtCodigoAluno.text+
                  ' AND curso ='''+txtCurso.Text+''' AND nr_anosemestre = '+txtAnoSemestre.Text);
        ExecuteDirect('INSERT INTO obsdipaluno (codigoaluno, curso, obs, nr_anosemestre) VALUES ('+
              txtCodigoAluno.text+', '''+txtCurso.Text+''', '''+mmobs.Text+''','+txtAnoSemestre.Text+ ')');
     end;
     quHist.close;
  end;
FINALLY
  ApertouBotao;
END;
  mmobs.SetFocus;
end;

procedure TfmObsDipAluno.btnCancelarClick(Sender: TObject);
begin
try
  if quHist.active then begin
     if quHist.state in [dsinsert,dsedit] then
        quHist.Cancel;
     quHist.close;
  end;
finally
  ApertouBotao;
end;
txtCodigoAluno.SetFocus;
end;

procedure TfmObsDipAluno.eecursoExit(Sender: TObject);
begin
  if (txtCodigoAluno.Text <> '') and  (qucurso.active = False) then begin
     qucurso.ParamByName('codigo').asstring := txtCodigoAluno.Text;
     qucurso.active := True;
     if qucurso.FieldByName('descricao').asstring  = '' then  begin
        Mensagem('Curso não encontrado!');
        qucurso.close;
        txtCodigoAluno.Text := '';
        abort;
     end;
     Inicia;
  end;
end;

procedure TfmObsDipAluno.eealunoChange(Sender: TObject);
begin
  if quhist.active then
     abort;

end;

procedure TfmObsDipAluno.eealunoExit(Sender: TObject);
begin
  if (txtCodigoAluno.Text <> '') and  (qualuno.active = false) then begin
     qualuno.ParamByName('codigo').asinteger := strtoint(txtCodigoAluno.Text);
     qualuno.active := True;
     if qualuno.FieldByName('nm_pessoa').asstring  = '' then  begin
        Mensagem('Aluno não encontrado!');
        qualuno.close;
        txtCodigoAluno.Text := '';
        abort;
     end;
     Inicia;
  end;
end;

procedure TfmObsDipAluno.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Montar o TreeView }
  txtAnoSemestre.text := IntToStr(ano_semestre);

  // Bloquear Anosemestre
  txtAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre;
  Label9.Visible := txtAnoSemestre.Visible;
  UpDown2.Visible := txtAnoSemestre.Visible;
end;

procedure TfmObsDipAluno.Inicia;
begin
  if (txtCurso.Text <> '') and (txtCodigoAluno.Text <> '') then begin
     try
       quhist.Close(); 
       quhist.parambyname('cdAluno').asInteger := strtoint(txtCodigoAluno.Text);
       quhist.parambyname('curso').asstring    := txtCurso.Text;
//       quhist.parambyname('nr_anosemestre').AsString    := txtAnoSemestre.Text;
       quhist.Open;
     except
       raise;
     end;
     txtCurso.ReadOnly := True;
     txtCodigoAluno.ReadOnly := True;
     txtAnoSemestre.ReadOnly := True;
  end;
end;
procedure TfmObsDipAluno.ApertouBotao;
begin
 if quAluno.Active then quAluno.close;
 txtCurso.ReadOnly := False;
 txtCodigoAluno.ReadOnly := False;
 txtCodigoAluno.text := '';
end;


procedure TfmObsDipAluno.btnCursoClick(Sender: TObject);
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

   Inicia;
end;

procedure TfmObsDipAluno.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro_pessoa : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro_pessoa := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro_pessoa.filtrado then
   begin
     txtCodigoAluno.Text := IntToStr(resultado_filtro_pessoa.cd_pessoa);
     txtCurso.Text := ClasseCursos.GetCursoFromTurma( resultado_filtro_pessoa.cd_turma, resultado_filtro_pessoa.nr_anosemestre );
   End
   else Exit;

  //if (txtCodigoAluno.Text <> '') and  (qualuno.active = false) then begin
  if (txtCodigoAluno.Text <> '') then begin

     qualuno.close();
     qualuno.ParamByName('codigo').asinteger := strtoint(txtCodigoAluno.Text);
     qualuno.open();
     if qualuno.FieldByName('nm_pessoa').asstring  = '' then
     begin
        Mensagem('Aluno não encontrado!');
        qualuno.close;
        txtCodigoAluno.Text := '';
        abort;
     end;

     Inicia;
  end;
end;

procedure TfmObsDipAluno.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  inicia;
  
end;

procedure TfmObsDipAluno.dsHistStateChange(Sender: TObject);
begin
   btnGravar.Enabled := quHist.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := quHist.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (quHist.State in [dsInsert, dsEdit]);
end;

procedure TfmObsDipAluno.txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then begin
       Key := #0;
       Inicia;
   end;
end;

end.
