unit uCadProvasAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Buttons, Menus, uDM, uUsuario, UMComboBox,UMLookupComboBox,uItemCombo, uLkJSON,
  ZDbcIntfs, ZSqlUpdate, ZSqlProcessor;

type
  TfrmCadProvasAlunos = class(TForm)
    qryCursos: TUMZQuery;
    dtcCursos: TDataSource;
    pmQtd: TPopupMenu;
    qryGabaritos: TUMZQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    grd: TDBGrid;
    Panel3: TPanel;
    btnImprimir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnFechar: TSpeedButton;
    Panel4: TPanel;
    cbGabaritosTodos: TUMComboBox;
    lbGabaritos: TLabel;
    Button1: TButton;
    qryCursosCD_PROVA_ALUNO: TIntegerField;
    qryCursosCD_PESSOA: TIntegerField;
    qryCursosNM_PESSOA: TStringField;
    qryCursosSN_RESPONDEU: TStringField;
    qryCursosCD_PROVA_GABARITO: TIntegerField;
    qryGabaritosCD_PROVA_GABARITO: TIntegerField;
    qryGabaritosDS_NOME_GABARITO: TStringField;
    qryCursosDS_NOME_GABARITO: TStringField;
    updProvaAluno: TZUpdateSQL;
    qryCursosNR_ACERTOS: TFloatField;
    qryCursosCD_TURMA: TStringField;
    qryCursosNR_ANOSEMESTRE: TSmallintField;
    procedure qryCursosBeforeDelete(DataSet: TDataSet);
    procedure qryCursosBeforePost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure carregaComboGabaritos();
    { Private declarations }
  public
    cd_prova : integer;
    cd_turma : string;
    nr_anosemestre : integer;

    { Public declarations }
  end;

var
  frmCadProvasAlunos: TfrmCadProvasAlunos;

implementation

uses Main, uSelCursos, Math, uCadProvas;

{$R *.DFM}

procedure TfrmCadProvasAlunos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmCadProvasAlunos.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmCadProvasAlunos.FormShow(Sender: TObject);
begin
   qryGabaritos.Close;
   qryGabaritos.ParamByName('CD_PROVA').AsInteger := cd_prova;
   qryGabaritos.Open;

   carregaComboGabaritos;

   qryCursos.Close();
   qryCursos.ParamByName('cd_prova').AsInteger := cd_prova;
   qryCursos.ParamByName('cd_turma').AsString := cd_turma;
   qryCursos.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qryCursos.Open();
end;

procedure TfrmCadProvasAlunos.qryCursosBeforeDelete(DataSet: TDataSet);
var
   S, Chave: AnsiString;
   JSON: TlkJSONobject;
begin
   S := UTF8Decode(TlkJSON.GenerateText(DM.RecordToJSON(DataSet)));

   JSON := TlkJSONobject.Create(False);
   try
      JSON.Add('formulario', Name);
      JSON.Add('botao', SpeedButton1.Name);

      Chave := UTF8Decode(TlkJSON.GenerateText(JSON));
   finally
      FreeAndNil(JSON);
   end;

   DM.Log(7001, Chave, S, tlExclusao);
end;

procedure TfrmCadProvasAlunos.qryCursosBeforePost(DataSet: TDataSet);
var
   S, Chave: AnsiString;
   JSON: TlkJSONobject;
begin
   if DataSet.State = dsEdit then
   begin
      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('antigo', DM.OldRecordToJSON(qryCursos));
         JSON.Add('novo', DM.RecordToJSON(qryCursos));
         S := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;

      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('formulario', Name);
         JSON.Add('cd_prova_aluno', qryCursosCD_PROVA_ALUNO.AsInteger);

         Chave := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;

      DM.Log(7001, Chave, S, tlAlteracao);
   end;
end;

procedure TfrmCadProvasAlunos.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmCadProvasAlunos.btnImprimirClick(Sender: TObject);
var
   iNumero : integer;
   sAlunos : string;
   bOR : boolean;
begin

   sAlunos := '';
   bOR := False;
   with grd.SelectedRows do begin

      if Count < 1 then begin
         Mensagem( 'Selecione pelo menos um aluno.', Application.Title, MB_OK + MB_ICONINFORMATION );
         Abort();
      end;

         if Count = 1 then begin
            if Mensagem( 'Imprimir os cartões da prova selecionada, do aluno '+qryCursos.FieldByName('nm_pessoa').AsString+' ?', Application.Title,
              MB_YESNO + MB_ICONQUESTION ) = ID_YES then
            begin
               PrincipalForm.ImprimeRpt(DM.sRelatoriosGabaritos, -1, '{leitora_provas_alunos.cd_prova_aluno} = '+qryCursos.FieldByName('cd_prova_aluno').AsString, '', nil, nil, nil, True);
            end;
         end
         else begin
            for iNumero:= 0 to Count - 1 do begin
               grd.DataSource.DataSet.GotoBookmark(Pointer(Items[iNumero]));
               if bOR then begin
                  sAlunos := sAlunos + ' OR ';
               end
               else begin
                  bOR := True;
               end;
               sAlunos := sAlunos + '{leitora_provas_alunos.cd_prova_aluno} = '+qryCursos.FieldByName('cd_prova_aluno').AsString;
            end;
            PrincipalForm.ImprimeRpt(DM.sRelatoriosGabaritos, -1, sAlunos, '', nil, nil, nil, True);
         end;

   end;

end;

procedure TfrmCadProvasAlunos.Button1Click(Sender: TObject);
const
   SMsgSemGabarito = 'É necessário selecionar um gabarito para prosseguir.';
   SMsgConfirmaAlteracao = 'Esta opção altera somente gabaritos para provas que os alunos ainda não responderam. Tem certeza que deseja aplicar este gabarito a todos alunos desta turma?';

   SSQLSelectProvasAlunos =
      'SELECT ' +
         'A.`CD_PROVA_ALUNO`,' +
         'A.`CD_PESSOA`,' +
         'A.`CD_PROVA_GABARITO`,' +
         'A.`NR_ACERTOS`,' +
         'A.`CD_TURMA`,' +
         'A.`NR_ANOSEMESTRE` ' +
      'FROM ' +
         '`LEITORA_PROVAS_ALUNOS` A ' +
      'WHERE ' +
         'A.`CD_TURMA` = ? AND ' +
         'A.`NR_ANOSEMESTRE` = ? AND ' +
	      'EXISTS ( ' +
		      'SELECT ' +
			      'G.`CD_PROVA_GABARITO` ' +
		      'FROM ' +
			      '`LEITORA_PROVAS_GABARITOS` G ' +
		      'WHERE ' +
			      'A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND ' +
			      'G.`CD_PROVA` = ? ' +
	      ') AND ' +
	      'NOT EXISTS ( ' +
		      'SELECT ' +
			      'R.`CD_PROVA_ALUNO_RESPOSTA` ' +
		      'FROM ' +
			      '`LEITORA_PROVAS_ALUNOS_RESP` R ' +
		      'WHERE ' +
			      'A.`CD_PROVA_ALUNO` = R.`CD_PROVA_ALUNO`)';
               
   SSQLUpdateProvasAlunos =
      'UPDATE `LEITORA_PROVAS_ALUNOS` A ' +
      'SET ' +
	      'A.`CD_PROVA_GABARITO` = ? ' +
      'WHERE ' +
	      'EXISTS ( ' +
		      'SELECT ' +
			      'G.`CD_PROVA_GABARITO` ' +
		      'FROM ' +
			      '`LEITORA_PROVAS_GABARITOS` G ' +
		      'WHERE ' +
			      'A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND ' +
			      'A.`CD_TURMA` = ? AND ' +
			      'A.`NR_ANOSEMESTRE` = ? AND ' +
			      'G.`CD_PROVA` = ? ' +
	      ') AND ' +
	      'NOT EXISTS ( ' +
		      'SELECT ' +
			      'R.`CD_PROVA_ALUNO_RESPOSTA` ' +
		      'FROM ' +
			      '`LEITORA_PROVAS_ALUNOS_RESP` R ' +
		      'WHERE ' +
			      'A.`CD_PROVA_ALUNO` = R.`CD_PROVA_ALUNO`)';
               
   function GetChave(const GabaritoID: AnsiString): AnsiString;
   var
      JSON: TlkJSONobject;
   begin
      JSON := TlkJSONobject.Create(False);
      try
         JSON.Add('formulario', Name);
         JSON.Add('botao', Button1.Name);
         JSON.Add('gabarito', GabaritoID);

         Result := UTF8Decode(TlkJSON.GenerateText(JSON));
      finally
         FreeAndNil(JSON);
      end;
   end;

var
   UserChoice: Integer;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   TurmaID, GabaritoID, S: AnsiString;
   AnoSemestre, ProvaID: Integer;
   JSON: TlkJSONobject;
begin

   if cbGabaritosTodos.ItemIndex = -1 then
      MessageDlg(SMsgSemGabarito, mtInformation, [mbOK], -1);

   if cbGabaritosTodos.ItemIndex <> -1 then
   begin

      UserChoice := MessageDlg(SMsgConfirmaAlteracao, mtConfirmation, [mbYes, mbNo], -1);

      if UserChoice = ID_YES then
      begin
         GabaritoID := TItemCombo(cbGabaritosTodos.Items.Objects[cbGabaritosTodos.ItemIndex]).getCodigo;
         TurmaID := qryCursos.ParamByName('cd_turma').AsString;
         ProvaID := qryCursos.ParamByName('cd_prova').AsInteger;
         AnoSemestre := qryCursos.ParamByName('nr_anosemestre').AsInteger;

         Stmt := DM.db.DbcConnection.PrepareStatement(SSQLSelectProvasAlunos);
         try
            Stmt.SetString(1, TurmaID);
            Stmt.SetInt(2, AnoSemestre);
            Stmt.SetInt(3, ProvaID);

            Rs := Stmt.ExecuteQueryPrepared;
            try
               JSON := TlkJSONobject.Create(False);
               try
                  JSON.Add('registros', DM.DataSetToJSON(Rs));

                  S := UTF8Decode(TlkJSON.GenerateText(JSON));

                  DM.Log(7001, GetChave(GabaritoID), S, tlAlteracao);
               finally
                  FreeAndNil(JSON);
               end;
            finally
               Rs.Close;
            end;
         finally
            Stmt.Close;
         end;

         Stmt := DM.db.DbcConnection.PrepareStatement(SSQLUpdateProvasAlunos);
         try
            Stmt.SetString(1, GabaritoID);
            Stmt.SetString(2, TurmaID);
            Stmt.SetInt(3, AnoSemestre);
            Stmt.SetInt(4, ProvaID);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
         end;

         qryCursos.Refresh;
         qryGabaritos.Refresh;
      end;

   end;
end;

procedure TfrmCadProvasAlunos.carregaComboGabaritos;
begin
   cbGabaritosTodos.Items.Clear;

   qryGabaritos.First;

   while not qryGabaritos.Eof do
   begin

      cbGabaritosTodos.AddItem(
         qryGabaritosds_nome_gabarito.AsString,
         TItemCombo.Create(
            qryGabaritoscd_prova_gabarito.AsString,
            qryGabaritosds_nome_gabarito.AsString
         )
      );

      qryGabaritos.Next;
   end;

   cbGabaritosTodos.ItemIndex := -1;
end;

procedure TfrmCadProvasAlunos.SpeedButton1Click(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao( 7001, npEspecial, True ) then Exit;

   with grd.SelectedRows do begin

      if Count < 1 then begin
         Mensagem( 'Selecione pelo menos um aluno.', Application.Title, MB_OK + MB_ICONINFORMATION );
         Abort();
      end;

      if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then begin
         Abort();
      end;

      grd.SelectedRows.Delete;

   end;

   qryCursos.Close();
   qryCursos.Open();

   frmCadProvas.qyTurmas.Close();
   frmCadProvas.qyTurmas.Open();
end;

end.
