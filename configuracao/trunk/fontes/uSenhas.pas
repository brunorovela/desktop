unit uSenhas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, md5;

type
  TfrmSenhas = class(TForm)
    Panel3: TPanel;
    ImageList1: TImageList;
    qyPessoas: TQuery;
    srcPessoas: TDataSource;
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rgFiltro: TRadioGroup;
    edTurma: TEdit;
    edCurso: TEdit;
    edCodigoPessoa: TEdit;
    grd: TDBGrid;
    cbSenhaProvisoria: TCheckBox;
    rgSenha: TRadioGroup;
    edSenha: TEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qyPessoascd_pessoa: TIntegerField;
    qyPessoasnm_pessoa: TStringField;
    BitBtn1: TBitBtn;
    qyPessoassn_senha_provisoria: TStringField;
    qyPessoasds_senha: TStringField;
    qyPessoasdt_nascimento: TDateTimeField;
    cbRedefinirQuemJaTem: TCheckBox;
    qyPessoasUtilizaSenha: TStringField;
    qyAux: TQuery;
    edAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure bdeDs_variavelKeyPress(Sender: TObject; var Key: Char);
    procedure bdeDs_variavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgSenhaClick(Sender: TObject);
    procedure desabilita(objeto: TEdit);
    procedure desabilita2(objeto: TMaskEdit);
    procedure habilita(objeto: TEdit);
    procedure habilita2(objeto: TMaskEdit);
    procedure filtra;
    procedure FormShow(Sender: TObject);
    procedure edCodigoPessoaChange(Sender: TObject);
    procedure edAnoSemestreChange(Sender: TObject);
    procedure edTurmaChange(Sender: TObject);
    procedure edCursoChange(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure qyPessoasCalcFields(DataSet: TDataSet);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    function SubstituiTexto(origem, procurar, substituir: string): string;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhas: TfrmSenhas;
  strSenha : String;
  snSenha : string;

implementation

uses uPrincipal, uDM, ucCategorias, StrUtils, uSelCursos, uSelTurmas,
  uSel_Pessoas;

{$R *.DFM}

procedure TfrmSenhas.desabilita(objeto: TEdit);
begin
  objeto.enabled := False;
  objeto.Color := clBtnFace;
end;

procedure TfrmSenhas.desabilita2(objeto: TMaskEdit);
begin
  objeto.enabled := False;
  objeto.Color := clBtnFace;
end;

procedure TfrmSenhas.habilita(objeto: TEdit);
begin
  objeto.enabled := True;
  objeto.Color := clWindow;
end;

procedure TfrmSenhas.habilita2(objeto: TMaskEdit);
begin
  objeto.enabled := True;
  objeto.Color := clWindow;
end;

procedure TfrmSenhas.filtra;
begin

  qyPessoas.Close;
  qyPessoas.SQL.Clear;
  qyPessoas.SQL.Add(
    ' SELECT   ' +
    '   p.cd_pessoa, p.nm_pessoa, p.sn_senha_provisoria, p.ds_senha, p.dt_nascimento ' +
    ' FROM  ' +
    '  pessoas p  ');

  qyAux.Close;
  qyAux.SQL.Clear;
  qyAux.SQL.Add(' UPDATE pessoas p ');

  case rgFiltro.ItemIndex of

  0: begin  {Professor}
         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ', turmasprofessores tp WHERE ';

         qyAux.SQL.Text := qyAux.SQL.Text + ', turmasprofessores tp ' +
           ' SET p.sn_senha_provisoria = :sn_senha_provisoria, ' +
           ' p.ds_senha = $$ds_senha$$ WHERE ';

         if edCodigoPessoa.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'tp.professor = ''' + edCodigoPessoa.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'tp.professor = ''' + edCodigoPessoa.Text + ''' AND ';
         end;

         if edAnoSemestre.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'tp.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'tp.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
         end;

         if edTurma.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'tp.turma = ''' + edTurma.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'tp.turma = ''' + edTurma.Text + ''' AND ';
         end;

         if edCurso.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'tp.curso = ''' + edCurso.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'tp.curso = ''' + edCurso.Text + ''' AND ';
         end;

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'tp.professor = p.cd_pessoa ';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' GROUP BY  p.cd_pessoa ORDER BY p.nm_pessoa ';

         qyAux.SQL.Text := qyAux.SQL.Text + 'tp.professor = p.cd_pessoa ';

  end; // Professor

  1: begin {Aluno}
         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ', matriculas ma  WHERE ';

         qyAux.SQL.Text := qyAux.SQL.Text + ', ' + 'matriculas ma ' +
           ' SET p.sn_senha_provisoria = :sn_senha_provisoria, ' +
           ' p.ds_senha = $$ds_senha$$ WHERE ';

         if edCodigoPessoa.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
         end;

         if edAnoSemestre.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
         end;

         if edTurma.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
         end;

         if edCurso.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
         end;

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.codigoaluno = p.cd_pessoa ';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' GROUP BY  p.cd_pessoa ORDER BY p.nm_pessoa ';

         qyAux.SQL.Text := qyAux.SQL.Text +'ma.codigoaluno = p.cd_pessoa ';

  end; {Aluno}

  2: {Pessoa}
      begin // 2
         if edCodigoPessoa.Text = '' Then begin
//            Mensagem('Selecione uma pessoa para alterar a senha.', 'Atenção',  MB_OK);
            Exit;
         end;

         qyAux.SQL.Text := qyAux.SQL.Text + ' SET ' +
            'p.sn_senha_provisoria = :sn_senha_provisoria, p.ds_senha = $$ds_senha$$ ';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' WHERE p.cd_pessoa = ''' + edCodigoPessoa.Text + ''' ';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' GROUP BY  p.cd_pessoa ORDER BY p.nm_pessoa ';
         
         qyAux.SQL.Text := qyAux.SQL.Text + ' WHERE p.cd_pessoa = ''' + edCodigoPessoa.Text + ''' ';

  end; // Pessoa

  3: begin {Responsável Academico}

        qyPessoas.SQL.Clear;
        qyPessoas.SQL.Add(
          ' SELECT   ' +
          '   r.cd_pessoa, r.nm_pessoa, r.sn_senha_provisoria, r.ds_senha, r.dt_nascimento ' +
          ' FROM  ' +
          '   pessoas p  ');

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ', pessoas r, matriculas ma  WHERE ';

         qyAux.SQL.Text := qyAux.SQL.Text + ', pessoas r, matriculas ma ' +
           ' SET r.sn_senha_provisoria = :sn_senha_provisoria, ' +
           ' r.ds_senha = $$ds_senha$$ WHERE ';

         if edCodigoPessoa.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
         end;

         if edAnoSemestre.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
         end;

         if edTurma.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
         end;

         if edCurso.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
         end;

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' ma.codigoaluno = p.cd_pessoa AND ';
         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' p.cd_resp_acad = r.cd_pessoa ';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' GROUP BY  r.cd_pessoa ORDER BY r.nm_pessoa ';

         qyAux.SQL.Text := qyAux.SQL.Text + ' ma.codigoaluno = p.cd_pessoa AND ';
         qyAux.SQL.Text := qyAux.SQL.Text + ' p.cd_resp_acad = r.cd_pessoa ';

  end; {Resp Academico}

  4: begin {Responsável Financeiro}

        qyPessoas.SQL.Clear;
        qyPessoas.SQL.Add(
          ' SELECT   ' +
          '   r.cd_pessoa, r.nm_pessoa, r.sn_senha_provisoria, r.ds_senha, r.dt_nascimento ' +
          ' FROM  ' +
          '   pessoas p  ');

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ', pessoas r, matriculas ma  WHERE ';

         qyAux.SQL.Text := qyAux.SQL.Text + ', pessoas r, matriculas ma ' +
           ' SET r.sn_senha_provisoria = :sn_senha_provisoria, ' +
           ' r.ds_senha = $$ds_senha$$ WHERE ';

         if edCodigoPessoa.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
         end;

         if edAnoSemestre.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
         end;

         if edTurma.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
         end;

         if edCurso.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
         end;

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' ma.codigoaluno = p.cd_pessoa AND ';
         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' p.cd_resp_finan = r.cd_pessoa ';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' GROUP BY  r.cd_pessoa ORDER BY r.nm_pessoa ';

         qyAux.SQL.Text := qyAux.SQL.Text + ' ma.codigoaluno = p.cd_pessoa AND ';
         qyAux.SQL.Text := qyAux.SQL.Text + ' p.cd_resp_finan = r.cd_pessoa ';

  end; {Resp Financeiro}
  5: begin {Pai ou mãe}

        qyPessoas.SQL.Clear;
        qyPessoas.SQL.Add(
          ' SELECT   ' +
          '   r.cd_pessoa, r.nm_pessoa, r.sn_senha_provisoria, r.ds_senha, r.dt_nascimento ' +
          ' FROM  ' +
          '   pessoas p  ');

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ', pessoas r, matriculas ma  WHERE ';

         qyAux.SQL.Text := qyAux.SQL.Text + ', pessoas r, matriculas ma ' +
           ' SET r.sn_senha_provisoria = :sn_senha_provisoria, ' +
           ' r.ds_senha = $$ds_senha$$ WHERE ';

         if edCodigoPessoa.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.codigoaluno = ''' + edCodigoPessoa.Text + ''' AND ';
         end;

         if edAnoSemestre.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.anosemestre = ''' + edAnoSemestre.Text + ''' AND ';
         end;

         if edTurma.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.turma = ''' + edTurma.Text + ''' AND ';
         end;

         if edCurso.Text <> '' then begin
            qyPessoas.SQL.Text := qyPessoas.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
            qyAux.SQL.Text := qyAux.SQL.Text + 'ma.curso = ''' + edCurso.Text + ''' AND ';
         end;

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' ma.codigoaluno = p.cd_pessoa AND ';
         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' (p.cd_pai = r.cd_pessoa OR  p.cd_mae = r.cd_pessoa)';

         qyPessoas.SQL.Text := qyPessoas.SQL.Text + ' GROUP BY  r.cd_pessoa ORDER BY r.nm_pessoa ';

         qyAux.SQL.Text := qyAux.SQL.Text + ' ma.codigoaluno = p.cd_pessoa AND ';
         qyAux.SQL.Text := qyAux.SQL.Text + ' (p.cd_pai = r.cd_pessoa OR  p.cd_mae = r.cd_pessoa)';

  end; {Pai ou mãe}


  end; // Caso o Filtro selecionado seja...

  qyAux.SQL.Text := qyAux.SQL.Text + ' $$JaExistente$$ ';

  qyPessoas.Open;

end;

function TfrmSenhas.SubstituiTexto(origem, procurar, substituir: string): string;
var
  s1, s2 : string;
begin
  s1 := LeftStr(origem, pos(procurar, origem)-1);
  s2 := MidStr(origem, pos(procurar, origem)+length(procurar), length(origem));

  result := s1 + substituir + s2;
end;

procedure TfrmSenhas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSenhas.DBEdit1Enter(Sender: TObject);
begin
   frmPrincipal.MostraHint2(Sender);
end;

procedure TfrmSenhas.bdeDs_variavelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmSenhas.bdeDs_variavelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmSenhas.rgSenhaClick(Sender: TObject);
begin
if rgSenha.ItemIndex = 0 then
  desabilita(edSenha)
 else
  begin
    habilita(edSenha);
    edSenha.SetFocus;
  end;
end;

procedure TfrmSenhas.FormShow(Sender: TObject);
begin
  desabilita(edSenha);
  desabilita2(edAnoSemestre);
  desabilita(edTurma);
  desabilita(edCurso);
  edAnoSemestre.Text := IntToStr(ano_semestre);
end;

procedure TfrmSenhas.edCodigoPessoaChange(Sender: TObject);
begin
  filtra;
end;

procedure TfrmSenhas.edAnoSemestreChange(Sender: TObject);
begin
  filtra;
end;

procedure TfrmSenhas.edTurmaChange(Sender: TObject);
begin
  filtra;
end;

procedure TfrmSenhas.edCursoChange(Sender: TObject);
begin
  filtra;
end;

procedure TfrmSenhas.rgFiltroClick(Sender: TObject);
begin
{
  rgFiltro.ItemIndex onde:
  0 Professor
  1 Aluno
  2 Pessoa
  3 Responsável Financeiro
  4 Responsável Acadêmico
  5 Pai ou Mãe
}
  case rgFiltro.ItemIndex of
  0,1,3,4,5:
  begin
    habilita2(edAnoSemestre);
    habilita(edTurma);
    habilita(edCurso);
//    edAnoSemestre.Text := DM.variavel_parametro('estuda_desemp_escola_anosem');
  end;
  2:
  begin
    desabilita2(edAnoSemestre);
    desabilita(edTurma);
    desabilita(edCurso);
  end;
  end;

  filtra;
end;



procedure TfrmSenhas.BitBtn1Click(Sender: TObject);
var
  sn_senha_provisoria: string;
begin
   if not validaSenha(Self.edSenha.Text) then Exit;
   
if cbRedefinirQuemJaTem.Checked then
  if MessageDlg('Você selecionou a opção para redefinir as senhas já existentes. '+chr(13)+'Isso irá redefinir as senhas das pessoas que já estão as utilizando. '+chr(13)+'Clique em SIM se deseja realmente redefinir estas senhas. ', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
    Abort;

{
  qyPessoas.First;
  while not qyPessoas.Eof do begin

     qyAux.Close();
     qyAux.SQL.Text := 'UPDATE pessoas SET ';

     if cbSenhaProvisoria.Checked then
       qyAux.SQL.Text := qyAux.SQL.Text + 'sn_senha_provisoria = ''S'', '
      else
       qyAux.SQL.Text := qyAux.SQL.Text + 'sn_senha_provisoria = ''N'', ';

     if rgSenha.ItemIndex = 0 then
       qyAux.SQL.Text := qyAux.SQL.Text + 'ds_senha = md5(date_format(dt_nascimento,''%d%m%y'')) '
      else
       qyAux.SQL.Text := qyAux.SQL.Text + 'ds_senha = md5('''+edSenha.Text+''') ';

     if cbRedefinirQuemJaTem.Checked then
       qyAux.SQL.Text := qyAux.SQL.Text + 'WHERE cd_pessoa = :cd_pessoa'
      else
       qyAux.SQL.Text := qyAux.SQL.Text + 'WHERE cd_pessoa = :cd_pessoa  AND (sn_senha_provisoria = ''S'' OR isNull(sn_senha_provisoria))';

     qyAux.ParamByName('cd_pessoa').AsInteger := qyPessoas.FieldByName('cd_pessoa').AsInteger;
     qyAux.ExecSQL;

     qyPessoas.Next();
  end;
  }

  if cbSenhaProvisoria.Checked then
     qyAux.ParamByName('sn_senha_provisoria').AsString := 'S'
  else
     qyAux.ParamByName('sn_senha_provisoria').AsString := 'N';

  if rgSenha.ItemIndex = 0 then begin
     if rgFiltro.ItemIndex in [0,1,2] then
        qyAux.SQL.Text := ReplaceStr(qyAux.SQL.Text, '$$ds_senha$$', ' md5(date_format(p.dt_nascimento,"%d%m%y"))' )
     else
        qyAux.SQL.Text := ReplaceStr(qyAux.SQL.Text, '$$ds_senha$$', ' md5(date_format(r.dt_nascimento,"%d%m%y"))' )
  end
  else
     qyAux.SQL.Text := ReplaceStr(qyAux.SQL.Text, '$$ds_senha$$', ' md5("' + edSenha.Text + '")');

  if cbRedefinirQuemJaTem.Checked then
     qyAux.SQL.Text := ReplaceStr(qyAux.SQL.Text, '$$JaExistente$$', '')
  else begin
     if rgFiltro.ItemIndex in [0,1,2,3] then
        qyAux.SQL.Text := ReplaceStr(qyAux.SQL.Text, '$$JaExistente$$', ' AND (p.sn_senha_provisoria = ''S'' OR isNull(p.sn_senha_provisoria))')
     else
        qyAux.SQL.Text := ReplaceStr(qyAux.SQL.Text, '$$JaExistente$$', ' AND (r.sn_senha_provisoria = ''S'' OR isNull(r.sn_senha_provisoria))');
  end;

  qyAux.ExecSQL();     

  filtra;

  MessageDlg('Senhas geradas/redefinidas com sucesso. ', mtInformation, [mbOk], 0);

end;

procedure TfrmSenhas.qyPessoasCalcFields(DataSet: TDataSet);
begin
  if qyPessoas.FieldByName('sn_senha_provisoria').AsString = 'N' then
    qyPessoas.FieldByName('UtilizaSenha').AsString := 'X';
end;

procedure TfrmSenhas.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin

  { Incremento do AnoSemestre }

  if Button = btNext then
     edAnoSemestre.text := DM.incrementar_ano_semestre(edAnoSemestre.Text)
  else
    edAnoSemestre.text := DM.decrementar_ano_semestre(edAnoSemestre.Text);

  filtra;

end;                    

procedure TfrmSenhas.SpeedButton4Click(Sender: TObject);
begin
  { Pesquisar Cursos }
  frmSelCursos.ShowModal;
  if frmSelCursos.flgSearch then
  Begin
     edCurso.Text := frmSelCursos.qryCursoscodigo.AsString;
     edAnoSemestre.Text := frmSelCursos.qryCursosanosemestre.AsString;
  end;
  filtra
end;

procedure TfrmSenhas.SpeedButton3Click(Sender: TObject);
begin
  { Pesquisar Turmas }

  frmSelTurmas.ShowModal;
  if not frmSelTurmas.flgSearch then Exit;
  edTurma.Text := frmSelTurmas.qryTurmasTurma.AsString;
  edAnoSemestre.Text := frmSelTurmas.qryTurmasAnoSemestre.AsString;
  filtra;
end;

procedure TfrmSenhas.SpeedButton1Click(Sender: TObject);
begin
  { Pesquisar Aluno, Professor ou Pessoa }

  case rgFiltro.ItemIndex of
    0: frm_Sel_Pessoa.Tipo_Pessoa := Professor;
    1: frm_Sel_Pessoa.Tipo_Pessoa := Aluno;
    2: frm_Sel_Pessoa.Tipo_Pessoa := Pessoa;
  end;

  frm_Sel_Pessoa.ShowModal;

  if frm_Sel_Pessoa.flgSearch then
  Begin
     edCodigoPessoa.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('cd_pessoa').AsString;
     try
       edTurma.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('turma').AsString;
       edAnoSemestre.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('anosemestre').AsString;
     except
     End;
  End
  else Exit;

  filtra;
end;

procedure TfrmSenhas.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSenhas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSenhas.FormDestroy(Sender: TObject);
begin
   frmSenhas := nil;
end;

end.
