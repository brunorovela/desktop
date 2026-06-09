unit uImpAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, ucrpe32,
  DB, UMDateTimePicker, uUsuario;

type
  TfrmImpAlunos = class(TForm)
    Panel1: TPanel;
    grpReimp: TRadioGroup;
    btnFechar: TButton;
    btnImprimir: TButton;
    cmb: TComboBox;
    Label1: TLabel;
    lstAnoSemestre: TListBox;
    lstCursos: TListBox;
    lstRequerimento: TListBox;
    lstTurma: TListBox;
    qryTurmasCursos: TUMZQuery;
    qryTurmasCursoscodigoaluno: TIntegerField;
    qryTurmasCursossituacao: TSmallintField;
    qryTurmasCursosturma: TStringField;
    qryTurmasCursosanosemestre: TSmallintField;
    qryTurmasCursosdataemissao: TDateTimeField;
    qryTurmasCursosds_situacao: TStringField;
    qryTurmasCursoscd_ingresso: TIntegerField;
    qryTurmasCursosds_ingresso: TStringField;
    qryTurmasCursoscd_padrao: TIntegerField;
    qryTurmasCursoscd_auxiliar: TLargeintField;
    qryTurmasCursosserie: TSmallintField;
    qryTurmasCursoscd_matricula_curso: TLargeintField;
    umdtReq: TUMDateTimePicker;
    Label2: TLabel;
    procedure cmbChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    arrTurmas: array of string;
    cd_turma: String;
    nr_anosemestre: Integer;
  end;

var
  frmImpAlunos: TfrmImpAlunos;

implementation

uses uMatriculas, Main, uDM, uAluno;

{$R *.DFM}



procedure TfrmImpAlunos.btnImprimirClick(Sender: TObject);
Var
   NomeRel : string;
   SFormula : String;
   slParametros: TStringList;
   wMes, wAno, wDia : Word;
begin
  case grpReimp.ItemIndex of

    0 : begin

      if lstCursos.Items[cmb.ItemIndex] = '' then
      begin
        Mensagem( 'Este curso não possui contrato formulado.', Application.Title,
                  MB_OK + 6 );
        Exit;
      end;

      FreeAndNil(slParametros);
      slParametros := TStringList.Create;

      DecodeDate(umdtReq.getDate, wAno, wMes, wDia);
      SplitString('data_impressao=[data_impressao]', ';', slParametros);

      slParametros.ValueFromIndex[0] := 'Date( '
         + intToStr(wano)
         + ', '
         + intToStr(wmes)
         + ', '
         + intToStr(wDia)
         + ')';

      NomeRel := lstCursos.Items[cmb.ItemIndex];
      SFormula := '';

      SFormula := SFormula + '{Matriculas.CodigoAluno} = ' + frm_Alunos.tblPessoacd_Pessoa.AsString;
      SFormula := Sformula + 'and {Matriculas.AnoSemestre} = ' + lstAnoSemestre.Items[cmb.ItemIndex];
      SFormula := Sformula + 'and';
      SFormula := Sformula + '{Matriculas.Turma} = "' + lstTurma.Items[cmb.ItemIndex] + '"';

      PrincipalForm.Rel.Printer.Prompt();

      PrincipalForm.ImprimeRpt(
         Self,
         NomeRel,
         -1,
         SFormula,
         '',
         slParametros,
         nil,
         nil,
         nil,
         true,
         False,
         nil,
         True
      );
      
      Exit;
    end;

    1 : begin

      if lstRequerimento.Items[cmb.ItemIndex] = '' then
      begin
        Mensagem( 'Este curso não possui requerimento formulado.', Application.Title,
                  MB_OK + MB_ICONSTOP );
        Exit;
      end;

      FreeAndNil(slParametros);
      slParametros := TStringList.Create;

      DecodeDate(umdtReq.getDate, wAno, wMes, wDia);
      SplitString('data_impressao=[data_impressao]', ';', slParametros);

      slParametros.ValueFromIndex[0] :=
         'Date( '
         + intToStr(wano)
         + ', '
         + intToStr(wmes)
         + ', '
         + intToStr(wDia)
         + ')';

      NomeRel := lstRequerimento.Items[cmb.ItemIndex];
      
      SFormula := '';

      SFormula := SFormula + '{Matriculas.AnoSemestre} = ' + lstAnoSemestre.Items[cmb.ItemIndex] + ' and ';

      SFormula := Sformula + '{Matriculas.Turma} = "' + lstTurma.Items[cmb.ItemIndex] + '" and ';

      SFormula := Sformula + '{Matriculas.CodigoAluno} = ' + frm_Alunos.tblPessoacd_Pessoa.AsString;

      PrincipalForm.Rel.Printer.Prompt();

      PrincipalForm.ImprimeRpt(
         Self,
         NomeRel,
         -1,
         SFormula,
         '',
         slParametros,
         nil,
         nil,
         nil,
         true,
         False,
         nil,
         True
      );

    end;

    2 : begin

      FreeAndNil(slParametros);
      slParametros := TStringList.Create;

      DecodeDate(umdtReq.getDate, wAno, wMes, wDia);
      SplitString('data_impressao=[data_impressao]', ';', slParametros);

      slParametros.ValueFromIndex[0] :=
         'Date( '
         + intToStr(wano)
         + ', '
         + intToStr(wmes)
         + ', '
         + intToStr(wDia)
         + ')';

      NomeRel := 'repProtocoloDoc.rpt';
      SFormula := '';

      SFormula := SFormula + '{Matriculas.CodigoAluno} = ' + frm_Alunos.tblPessoacd_Pessoa.AsString;
      SFormula := Sformula + 'and {Matriculas.AnoSemestre} = ' + lstAnoSemestre.Items[cmb.ItemIndex];
      SFormula := Sformula + 'and';
      SFormula := Sformula + '{Matriculas.Turma} = "' + lstTurma.Items[cmb.ItemIndex] + '"';

      PrincipalForm.Rel.Printer.Prompt();

      PrincipalForm.ImprimeRpt(
         Self,
         NomeRel,
         -1,
         SFormula,
         '',
         slParametros,
         nil,
         nil,
         nil,
         true,
         False,
         nil,
         True
      );
      Exit;

    end;
  end;
end;


procedure TfrmImpAlunos.cmbChange(Sender: TObject);
begin

   umdtReq.setDate( StrToDateTime(arrTurmas[cmb.ItemIndex + 1]) );
end;

procedure TfrmImpAlunos.FormShow(Sender: TObject);
const
   SQL_DATA_EMISSAO = ''+
   'SELECT                                      '+
	'  m.dataemissao, m.turma, m.anosemestre     '+
   'FROM                                        '+
	'  matriculas m                              '+
   'WHERE                                       '+
   '  m.cd_matricula_curso = :cd_matricula_curso '+
   'ORDER BY                                    '+
	'  m.AnoSemestre,                            '+
	'  m.cd_matricula_curso                      ';
var
   itemIndexTurma: Integer;
   qryBuscaDataEmissao: TUMZQuery;
   registroAtual : pointer;
begin
  { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   frm_Alunos.tblMatriculasEtapa.DisableControls;
   registroAtual := frm_Alunos.tblMatriculasEtapa.GetBookmark;

   frm_Alunos.tblMatriculasEtapa.Last;
   umdtReq.setDate(frm_Alunos.tblMatriculasEtapaDataEmissao.AsDateTime);
   cmb.Items.Clear;
   lstAnoSemestre.Items.Clear;
   lstTurma.Items.Clear;

   lstCursos.Items.Clear;
   lstRequerimento.Items.Clear;

   if(frm_Alunos.pgPessoa.TabIndex <> 7) then
   begin
      qryTurmasCursos.Close;
      qryTurmasCursos.ParamByName('cd_pessoa').AsInteger :=  frm_Alunos.tblPessoacd_pessoa.AsInteger;
      qryTurmasCursos.Open;
      qryTurmasCursos.First;
      umdtReq.setDate(qryTurmasCursosDataEmissao.AsDateTime);

      SetLength(arrTurmas, qryTurmasCursos.RecordCount + 1);

      while not qryTurmasCursos.Eof do
      begin
         cmb.Items.Add( qryTurmasCursosTurma.AsString + ' - ' + qryTurmasCursosAnoSemestre.DisplayText );

         arrTurmas[qryTurmasCursos.RecNo] := qryTurmasCursosdataemissao.AsString;

         DM.tblCursosTurma.Close;
         DM.tblCursosTurma.SQL.Clear;
         DM.tblCursosTurma.SQL.Text :=
            ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
            '   FROM TURMAS T ' +
            '  INNER JOIN CURSOS_COLIGADAS AS C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
            '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

         DM.tblCursosTurma.ParamByName('Turma').AsString := qryTurmasCursosTurma.AsString;
         DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := qryTurmasCursosAnoSemestre.AsInteger;
         DM.tblCursosTurma.Open;
         if DM.tblCursosTurmaDS_CONTRATO.AsString <> '' then
         begin
            lstCursos.Items.Add( DM.tblCursosTurmaDS_CONTRATO.AsString );
            lstRequerimento.Items.Add( DM.tblCursosTurmaDS_REQUERIMENTO.AsString );
         end
         else
         Begin
           lstCursos.Items.Add( '' );
           lstRequerimento.Items.Add( '' );
         end;
         lstAnoSemestre.Items.Add( qryTurmasCursosAnoSemestre.AsString );
         lstTurma.Items.Add( qryTurmasCursosturma.AsString );
         qryTurmasCursos.Next;
      end;
      cmb.ItemIndex := 0;
   end
   else
   begin

     DM.CriarConsulta(qryBuscaDataEmissao);
     qryBuscaDataEmissao.SQL.Text := SQL_DATA_EMISSAO;
     qryBuscaDataEmissao.ParamByName('cd_matricula_curso').AsInteger :=
        frm_Alunos.tblMatriculaCursoCD_MATRICULA_CURSO.AsInteger;

     qryBuscaDataEmissao.Open;

     SetLength(arrTurmas, frm_Alunos.tblMatriculasEtapa.RecordCount + 1);

     frm_Alunos.tblMatriculasEtapa.First;

     while not frm_Alunos.tblMatriculasEtapa.Eof do
     begin
       cmb.Items.Add( frm_Alunos.tblMatriculasEtapaTurma.AsString + ' - ' + frm_Alunos.tblMatriculasEtapaAnoSemestre.DisplayText );

       if (( uAluno.frm_Alunos.tblMatriculasEtapaturma.AsString = cd_turma ) AND
          ( uAluno.frm_Alunos.tblMatriculasEtapaanosemestre.AsInteger = nr_anosemestre)) then
       begin
         itemIndexTurma := frm_Alunos.tblMatriculasEtapa.RecNo;
       end;

       arrTurmas[frm_Alunos.tblMatriculasEtapa.RecNo] := frm_Alunos.tblMatriculasEtapadataemissao.AsString;

       DM.tblCursosTurma.Close;
       DM.tblCursosTurma.SQL.Clear;
         DM.tblCursosTurma.SQL.Text :=
            ' SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMENTO ' +
            '   FROM TURMAS T ' +
            '  INNER JOIN CURSOS_COLIGADAS C ON (T.CURSO = C.CD_CURSO AND T.CD_COLIGADA = C.CD_COLIGADA) ' +
            '  WHERE (T.CODIGO = :Turma) and (T.ANOSEMESTRE = :AnoSemestre)';

       DM.tblCursosTurma.ParamByName('Turma').AsString := frm_Alunos.tblMatriculasEtapaTurma.AsString;
       DM.tblCursosTurma.ParamByName('AnoSemestre').AsInteger := frm_Alunos.tblMatriculasEtapaAnoSemestre.AsInteger;
       DM.tblCursosTurma.Open;

       if ((DM.tblCursosTurmaDS_CONTRATO.AsString <> '') OR
          (DM.tblCursosTurmaDS_REQUERIMENTO.AsString <> '')) then
       Begin
         lstCursos.Items.Add( DM.tblCursosTurmaDS_CONTRATO.AsString );
         lstRequerimento.Items.Add( DM.tblCursosTurmaDS_REQUERIMENTO.AsString );
       End
       else
       Begin
         lstCursos.Items.Add( '' );
         lstRequerimento.Items.Add( '' );
       End;
       lstAnoSemestre.Items.Add( frm_Alunos.tblMatriculasEtapaAnoSemestre.AsString );
       lstTurma.Items.Add( frm_Alunos.tblMatriculasEtapaturma.AsString );
       frm_Alunos.tblMatriculasEtapa.Next;
     end;
     cmb.ItemIndex := itemIndexTurma - 1;
     umdtReq.setDate( StrToDateTime(arrTurmas[cmb.ItemIndex + 1]) );
   end;

   if not DM.UsuarioLogado.TemPermissao(1133, npAlterar, False) then
   begin
      umdtReq.Enabled := False;
   end;

   frm_Alunos.tblMatriculasEtapa.GotoBookmark(registroAtual);
   frm_Alunos.tblMatriculasEtapa.EnableControls;
end;

procedure TfrmImpAlunos.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmImpAlunos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F7 : btnImprimirClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;



end.

