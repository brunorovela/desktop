unit uCorrecaoManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Buttons, uTProva;

type
  TfrmCorrecaoManual = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    pnTitulo: TPanel;
    pnInconsistencias: TPanel;
    toolPessoa: TToolBar;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    pnCorrecao: TPanel;
    Bevel6: TBevel;
    ilDisciplinas: TImageList;
    ToolButton4: TToolButton;
    pnMostraInconsistencias: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    edCodProva: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edQtdCorrecoes: TEdit;
    Bevel8: TBevel;
    UpDown2: TUpDown;
    edNomeProva: TEdit;
    SpeedButton1: TSpeedButton;
    qyProva: TUMZQuery;
    qyProvacd_prova: TIntegerField;
    qyProvanr_prova: TSmallintField;
    qyProvads_prova: TStringField;
    qyProvanr_correcoes: TIntegerField;
    pnDadosAluno: TPanel;
    qyDadosAluno: TUMZQuery;
    qyDadosAlunocd_prova_aluno: TIntegerField;
    qyDadosAlunocd_pessoa: TIntegerField;
    qyDadosAlunocd_prova_gabarito: TIntegerField;
    qyDadosAlunonr_acertos: TFloatField;
    qyDadosAlunocd_turma: TStringField;
    qyDadosAlunonr_anosemestre: TSmallintField;
    qyDadosAlunonm_pessoa: TStringField;
    qyOperacoes: TUMZQuery;
    Panel5: TPanel;
    Bevel5: TBevel;
    edCodigoAluno: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lbTurma: TLabel;
    lbNomeAluno: TLabel;
    Bevel9: TBevel;
    pnQuestoes: TPanel;
    qyInconsistencias: TUMZQuery;
    qyInconsistenciascd_pessoa: TIntegerField;
    qyInconsistenciasnm_pessoa: TStringField;
    qyInconsistenciascd_turma: TStringField;
    srcInconsistencias: TDataSource;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    edNrParte: TEdit;
    updnNrParte: TUpDown;
    procedure updnNrParteChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure updnNrParteMouseLeave(Sender: TObject);
    procedure updnNrParteMouseEnter(Sender: TObject);
    procedure edNrParteChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodProvaKeyPress(Sender: TObject; var Key: Char);
    procedure AcertosTotalKeyPress(Sender: TObject; var Key: Char);
    procedure QuestoesSomatoriaKeyPress(Sender: TObject; var Key: Char);
    procedure QuestoesAltKeyPress(Sender: TObject; var Key: Char);
    procedure QuestoesDiscursivasKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure pnMostraInconsistenciasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    prova_selecionada : boolean;
    aluno_selecionado : boolean;
    ListaProvas : String;
    ListaProvasGabaritos : String;

    PrimeiroCampo : String;
    UltimoCampo : String;

    provaSelecionada : TProva;

    procedure FiltraProva();
    procedure GeraCamposQuestoes();
    procedure SalvaRespostas();
    procedure DestruirCampos();
    procedure FiltraPessoa();
  public
    { Public declarations }
  end;

var
  frmCorrecaoManual: TfrmCorrecaoManual;

implementation

uses Main, uDM, uCadProvasDisciplinas, uCadProvasTurmas, uCadProvasGabaritos,
  uCadProvasAlunos, uSelProvas, uDigitarQuestoes, uSelProva;

{$R *.dfm}

procedure TfrmCorrecaoManual.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   Self.Caption := pnTitulo.Caption;

   pnInconsistencias.Width := 10;

   edCodProva.SetFocus();

end;

procedure TfrmCorrecaoManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCorrecaoManual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCorrecaoManual.btnSairClick(Sender: TObject);
begin
  Close;
end;



procedure TfrmCorrecaoManual.pnMostraInconsistenciasClick(Sender: TObject);
begin
  if (pnInconsistencias.Width = 500) then begin
    qyInconsistencias.Close();
    pnMostraInconsistencias.Caption := '<';

    while (pnInconsistencias.Width > 10) do begin
      pnInconsistencias.Width := pnInconsistencias.Width - 10;
    end;

  end
  else begin
    if ( edCodProva.Text = '' ) then begin
       Exit;
    end;
    with qyInconsistencias do begin
       Close();
       ParamByName('cd_prova').AsInteger := StrToInt(edCodProva.Text);
       Open();
    end;
    pnMostraInconsistencias.Caption := '>';

    while (pnInconsistencias.Width < 500) do begin
      pnInconsistencias.Width := pnInconsistencias.Width + 10;
    end;

  end;
end;

procedure TfrmCorrecaoManual.updnNrParteChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
var
   IParte : Integer;
begin
   if updnNrParte.Tag <> 1 then Exit;

   AllowChange := provaSelecionada <> nil;
   if AllowChange then
   begin
      IParte := StrToInt(edNrParte.Text);
      if (Direction = updUp) AND (IParte < provaSelecionada.QuantidadePartesGabarito) then
      begin
         Inc(IParte);
      end else if (Direction = updDown) AND (IParte > 1) then
      begin
         Dec(IParte);
      end;
      edNrParte.Text := IntToStr(IParte);
   end else begin
      Mensagem('Você deve selecionar uma prova.');
   end;
end;

procedure TfrmCorrecaoManual.updnNrParteMouseEnter(Sender: TObject);
begin
   updnNrParte.Tag := 1;
end;

procedure TfrmCorrecaoManual.updnNrParteMouseLeave(Sender: TObject);
begin
   updnNrParte.Tag := 0;
end;

procedure TfrmCorrecaoManual.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then begin
     if StrToInt(edQtdCorrecoes.Text) < 9 then begin
       edQtdCorrecoes.Text := IntToStr(StrToInt(edQtdCorrecoes.Text)+1);
     end;
  end
  else if Button = btPrev then begin
     if StrToInt(edQtdCorrecoes.Text) > 1 then begin
       edQtdCorrecoes.Text := IntToStr(StrToInt(edQtdCorrecoes.Text)-1);
     end;
  end;

  if (Button = btNext) OR (Button = btPrev) then begin
    if (StrToInt(edQtdCorrecoes.Text) > qyProva.FieldByName('nr_correcoes').AsInteger) then begin
        edQtdCorrecoes.Text := IntToStr(StrToInt(edQtdCorrecoes.Text)-1);
    end;
    if edCodigoAluno.Text <> '' then
       FiltraPessoa();
  end;

end;

procedure TfrmCorrecaoManual.edCodProvaKeyPress(Sender: TObject; var Key: Char);
begin
   edCodigoAluno.Text := '';
   aluno_selecionado := False;
   lbNomeAluno.Caption := '-';
   lbTurma.Caption := '-';
   DestruirCampos();

   prova_selecionada := False;
   if ( Key = #13 ) then begin
      FiltraProva();
   end;
end;

procedure TfrmCorrecaoManual.edNrParteChange(Sender: TObject);
begin
   if provaSelecionada <> nil then
   begin
      GeraCamposQuestoes();
   end;
end;

procedure TfrmCorrecaoManual.FiltraProva();
begin
   edNomeProva.Text := '';
                                   
   if ( edCodProva.Text = '' ) then
   begin
      Exit;
   end;

   try
      with qyProva do
      begin
         Close();
         ParamByName('cd_prova').AsInteger := StrToInt(edCodProva.Text);
         Open();

         if (StrToInt(edQtdCorrecoes.Text) > FieldByName('nr_correcoes').AsInteger) then begin
            Mensagem('A prova não tem tantas correções !', Application.Title, MB_OK + MB_ICONERROR);
            edQtdCorrecoes.Text := '1';
         end;
      end;
   except
      Mensagem('O código de prova deve ser númerico !', Application.Title, MB_OK + MB_ICONERROR);
      Exit;
   end;

   if ( qyProva.Eof ) then
   begin
      Mensagem('Prova inexistente !', Application.Title, MB_OK + MB_ICONERROR);
      Exit;
   end else begin
      provaSelecionada := TProva.Create(qyProvacd_prova.AsInteger);
   end;

   edNomeProva.Text := qyProva.FieldByName('nr_prova').AsString + ' - ' + qyProva.FieldByName('ds_prova').AsString;
   edCodigoAluno.SetFocus();

   prova_selecionada := true;

   // Da um 'refresh' nas inconsistencias caso elas estejam abertas
   with qyInconsistencias do
   begin
       Close();
       ParamByName('cd_prova').AsInteger := StrToInt(edCodProva.Text);
       Open();
       DBGrid1.Refresh;
    end;

end;

procedure TfrmCorrecaoManual.edCodigoAlunoKeyPress(Sender: TObject;
  var Key: Char);
const
   SQL_PROXIMA_PROVA =
      'SELECT '+
         'cd_proxima_prova '+
      'FROM '+
         'leitora_provas '+
      'WHERE '+
         'cd_prova = :Prova AND '+
         'IfNull(cd_proxima_prova,0) <> 0';
begin

   aluno_selecionado := False;

   if ( Key = #27 ) then
   begin
      edCodigoAluno.Text := '';
   end;

   if ( (Key <> #13) OR (edCodigoAluno.Text = '') ) then
   begin
      Exit;
   end;
   
   ListaProvas := '-1';
   ListaProvasGabaritos := '-1';
   
   if Trim(qyProva.FieldByName('cd_prova').AsString) <> '' then
   begin
      ListaProvas := ListaProvas + ', ' + qyProva.FieldByName('cd_prova').AsString;
   end;

   DM.qyAux4.Close;
   DM.qyAux4.SQL.Text := SQL_PROXIMA_PROVA;
   DM.qyAux4.ParamByName('Prova').AsInteger := frmSelProva.qyProva.FieldByName('cd_prova').AsInteger;
   Dm.qyAux4.Open;

   while not DM.qyAux4.Eof do
   begin
       ListaProvas := ListaProvas + ', ' + DM.qyAux4.FieldByName('cd_proxima_prova').AsString;
       DM.qyAux4.ParamByName('Prova').AsInteger := DM.qyAux4.FieldByName('cd_proxima_prova').AsInteger;
       DM.qyAux4.Close;
       Dm.qyAux4.Open;
   end;

   FiltraPessoa();
end;

procedure TfrmCorrecaoManual.GeraCamposQuestoes();
var
   left_ant   : integer;
   top_ant    : integer;
   usaEfeitosEspeciais : Boolean;
begin

   if ( not prova_selecionada ) then begin
      Mensagem('Selecione uma prova !', Application.Title, MB_OK + MB_ICONERROR);
      edCodProva.SelectAll();
      Exit;
   end;

   if ( not aluno_selecionado ) then begin
      Mensagem('Selecione uma pessoa !', Application.Title, MB_OK + MB_ICONERROR);
      edCodigoAluno.SelectAll();
      Exit;
   end;

   usaEfeitosEspeciais := DM.db.SQLHourGlass;
   DM.db.SQLHourGlass := False;

   left_ant := 8;
   top_ant  := 8;

   // Apaga os campos atuais da tela
   qyOperacoes.DisableControls;
   DestruirCampos();

   // Selecionar a resposta dos gabaritos - GABARITO OFICIAL
   qyOperacoes.Close();
   qyOperacoes.SQL.Text :=
       ' SELECT lpgr.cd_prova_gabarito_resposta, lpgr.cd_prova_gabarito, nr_questao, ds_resposta,  sn_discursiva, lpgr.vl_peso vl_peso, cd_prova_aluno, lpgr.nr_parte '+
       ' FROM leitora_provas_gabaritos_resp lpgr ' +
       ' INNER JOIN leitora_provas_alunos lpa ON (lpgr.cd_prova_gabarito = lpa.cd_prova_gabarito) ' +
       ' WHERE lpgr.cd_prova_gabarito in ( ' + ListaProvasGabaritos + ' ) AND lpa.cd_pessoa = :cd_pessoa AND lpgr.nr_parte = :nr_parte' +
       ' ORDER BY lpgr.nr_questao, lpgr.cd_prova_gabarito ' ;
   qyOperacoes.ParamByName('nr_parte').AsInteger := StrToInt(edNrParte.Text);
   qyOperacoes.ParamByName('cd_pessoa').AsInteger := qyDadosAlunocd_pessoa.AsInteger;

   qyOperacoes.Open();

   if ( qyOperacoes.Eof ) then begin

      qyOperacoes.EnableControls;
      DM.db.SQLHourGlass := usaEfeitosEspeciais;

      Mensagem('Não é possível efetuar a correção, nenhum gabarito cadastrado.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;

   end;

   PrimeiroCampo := 'edQuestao_' + qyOperacoes.FieldByName('nr_questao').AsString;

   // Para cada questão do GABARITO
   while not qyOperacoes.Eof do
   begin

      //Selecionar 1 questão do aluno - RESPOSTA DO ALUNO
      DM.qyAux2.Close();
      DM.qyAux2.SQL.Text := 'SELECT * FROM leitora_provas_alunos_resp WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_correcao = :nr_correcao AND nr_parte = :nr_parte';
      DM.qyAux2.ParamByName('cd_prova_aluno').AsInteger := qyOperacoes.FieldByName('cd_prova_aluno').AsInteger;
      DM.qyAux2.ParamByName('nr_questao').AsInteger := qyOperacoes.FieldByName('nr_questao').AsInteger;
      DM.qyAux2.ParamByName('nr_correcao').AsInteger := StrToInt(edQtdCorrecoes.Text);
      DM.qyAux2.ParamByName('nr_parte').AsInteger := qyOperacoes.FieldByName('nr_parte').AsInteger;
      DM.qyAux2.Open();

      // Se não tiver resposta na tabela, inserir a resposta do aluno...
      if (DM.qyAux2.Eof) and
         (qyOperacoes.FieldByName('sn_discursiva').AsInteger <> 1) then
      begin

         DM.qyAux3.Close();
         DM.qyAux3.SQL.Text := ' ' +
            'INSERT INTO leitora_provas_alunos_resp( ' +
            '  cd_prova_aluno, ' +
            '  nr_questao, ' +
            '  ds_resposta, ' +
            '  cd_situacao, ' +
            '  nr_correcao, ' +
            '  nr_parte ' +
            ') VALUES( ' +
            '  :cd_prova_aluno, ' +
            '  :nr_questao, ' +
            '  '''', ' +
            '  -1, ' +
            '  :nr_correcao, ' +
            '  :nr_parte ' +
            ')';
         DM.qyAux3.ParamByName('cd_prova_aluno').AsInteger := qyOperacoes.FieldByName('cd_prova_aluno').AsInteger;
         DM.qyAux3.ParamByName('nr_questao').AsInteger := qyOperacoes.FieldByName('nr_questao').AsInteger;
         DM.qyAux3.ParamByName('nr_correcao').AsInteger := StrToInt(edQtdCorrecoes.Text);
         DM.qyAux3.ParamByName('nr_parte').AsInteger := qyOperacoes.ParamByName('nr_parte').AsInteger;
         DM.qyAux3.ExecSQL();
         
      end;

      // Criar os campos na tela

      if ( top_ant+22 > pnQuestoes.Height ) then begin
          top_ant  := 8;
          left_ant := left_ant + 100;
      end;

      with TLabel.Create(frmCorrecaoManual) do begin
          Parent  := pnQuestoes;
          Name    := 'lbQuestao_'+qyOperacoes.FieldByName('nr_questao').AsString;
          Caption := qyOperacoes.FieldByName('nr_questao').AsString + ')';
          Left    := left_ant;
          Top     := top_ant;
          Visible := True;
      end;

      with TEdit.Create(frmCorrecaoManual) do begin
         Parent  := pnQuestoes;
         Name    := 'edQuestao_'+qyOperacoes.FieldByName('nr_questao').AsString;
         Tag     := qyOperacoes.FieldByName('sn_discursiva').AsInteger;

         if Tag = 1 then begin
            Text    := DM.qyAux2.FieldByName('db_pontuacao').AsString;
         end
         else begin
            Text    := DM.qyAux2.FieldByName('ds_resposta').AsString;
         end;

         // Left    := left_ant + TEdit(frmCorrecaoManual.FindComponent('lbQuestao_'+qyOperacoes.FieldByName('nr_questao').AsString)).Width + 5;
         Left    := left_ant + 20;
         Top     := top_ant-2;
         Width   := 40;
         Visible := True;

         if (qyOperacoes.FieldByName('sn_discursiva').AsInteger = 1) then begin

            OnKeyPress := QuestoesDiscursivasKeyPress;

         end else begin

            if ( DM.VerificaeNumero(qyOperacoes.FieldByName('ds_resposta').AsString) ) then begin

               OnKeyPress := QuestoesSomatoriaKeyPress;

            end else begin

               OnKeyPress := QuestoesAltKeyPress;

            end;
         end;

      end;

      left_ant := left_ant;
      top_ant  := top_ant + 30;

      qyOperacoes.Next();
   end;

   UltimoCampo := 'edQuestao_' + qyOperacoes.FieldByName('nr_questao').AsString;

   TEdit(frmCorrecaoManual.FindComponent(PrimeiroCampo)).SetFocus();
   TEdit(frmCorrecaoManual.FindComponent(PrimeiroCampo)).SelectAll();

   qyOperacoes.EnableControls;

   DM.db.SQLHourGlass := usaEfeitosEspeciais;
end;

procedure TfrmCorrecaoManual.AcertosTotalKeyPress(Sender: TObject; var Key: Char);
begin
   // Total de acertos

   if ( Key <> #13 ) then begin
      Exit;
   end;

   SalvaRespostas();
end;

procedure TfrmCorrecaoManual.QuestoesSomatoriaKeyPress(Sender: TObject; var Key: Char);
var
   proximo_campo : string;
   novo_conteudo : string;
   i             : integer;
begin
   // Questão somatória

   if ( Key <> #13 ) then begin
      Exit;
   end;

   novo_conteudo := TEdit(Sender).Text;
   for i := Length(TEdit(Sender).Text) downto 1 do begin
       if (Pos('.', TEdit(Sender).Text) > 0) OR (Pos(',', TEdit(Sender).Text) > 0) then begin
          if ( (Copy(TEdit(Sender).Text, i, 1) = '0') OR (Copy(TEdit(Sender).Text, i, 1) = '.') OR (Copy(TEdit(Sender).Text, i, 1) = ',') ) then begin
             novo_conteudo := Copy(TEdit(Sender).Text, 1, i-1);
          end
          else begin
             break;
          end;
       end;
   end;
   TEdit(Sender).Text := novo_conteudo;
   
   try

     if TEdit(Sender).Name <> UltimoCampo then begin

        proximo_campo := 'edQuestao_' + IntToStr(StrToInt(Copy(TEdit(Sender).Name, Pos('_', TEdit(Sender).Name)+1, 2))+1);

        TEdit(frmCorrecaoManual.FindComponent(proximo_campo)).SetFocus();
        TEdit(frmCorrecaoManual.FindComponent(proximo_campo)).SelectAll();

     end else begin

        SalvaRespostas();

     end;

   except
   end;
end;

procedure TfrmCorrecaoManual.QuestoesAltKeyPress(Sender: TObject; var Key: Char);
const
   letras : array[1..9] of char = ('A','B','C','D','E','F','G','H','I');
var
   proximo_campo : string;
begin
   // Questão múltipla escolha

   try

     if Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9'] then begin
        TEdit(Sender).Text := letras[StrToInt(Key)];
        Key := #0;
     end
     else if ( Key in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'] ) then begin
        TEdit(Sender).Text := UpperCase(Key);
        Key := #0;
     end;

     if TEdit(Sender).Name <> UltimoCampo then begin

        proximo_campo := 'edQuestao_' + IntToStr(StrToInt(Copy(TEdit(Sender).Name, Pos('_', TEdit(Sender).Name)+1, 2))+1);

        TEdit(frmCorrecaoManual.FindComponent(proximo_campo)).SetFocus();
        TEdit(frmCorrecaoManual.FindComponent(proximo_campo)).SelectAll();

     end else begin

        SalvaRespostas();

     end;

   except
   end;
end;

procedure TfrmCorrecaoManual.QuestoesDiscursivasKeyPress(Sender: TObject;
  var Key: Char);
var
   proximo_campo : string;
begin
   // Questão discursiva

   if Key = #13 then begin
      try

        if TEdit(Sender).Name <> UltimoCampo then begin
           proximo_campo := 'edQuestao_' + IntToStr(StrToInt(Copy(TEdit(Sender).Name, Pos('_', TEdit(Sender).Name)+1, 2))+1);
   
           TEdit(frmCorrecaoManual.FindComponent(proximo_campo)).SetFocus();
           TEdit(frmCorrecaoManual.FindComponent(proximo_campo)).SelectAll();

        end else begin

           SalvaRespostas();

        end;
      except
      end;
   end;
end;

procedure TfrmCorrecaoManual.SalvaRespostas();
var
   edQuestao : TEdit;
   msgErro: String;
   slQuestoesErro: TStringList;
begin

   // Gravar todos os campos na base de dados

   // Para cada componente existente na tela

   qyOperacoes.First();

   msgErro := '';
   slQuestoesErro := TStringList.Create;
   slQuestoesErro.Clear;

   while not qyOperacoes.Eof do
   begin
      edQuestao := TEdit(frmCorrecaoManual.FindComponent('edQuestao_' + qyOperacoes.FieldByName('nr_questao').AsString));

      DM.qyAux5.Close();

      if edQuestao.Tag = 1 then
      begin
         if StrToCurr(ReplaceStr(edQuestao.Text, ',', ',')) > qyOperacoes.FieldByName('vl_peso').AsCurrency then
         begin
            msgErro := 'A pontuação do aluno deve ser menor ou igual ao peso da questão!'+#13;
            msgErro := msgErro + 'Questões: ';

            slQuestoesErro.Add(qyOperacoes.FieldByName('nr_questao').AsString);
         end
         else
         begin
            if edQuestao.Text <> '' then
            begin
               DM.qyAux5.SQL.Text := 'REPLACE INTO leitora_provas_alunos_resp (db_pontuacao,';
               DM.qyAux5.SQL.Add(' cd_prova_aluno, nr_questao, cd_situacao, nr_correcao, nr_parte) ');
               DM.qyAux5.SQL.Add(' VALUES (:db_pontuacao, :cd_prova_aluno, :nr_questao, -1, :nr_correcao, :nr_parte)');

               DM.qyAux5.ParamByName('db_pontuacao').AsCurrency :=  StrToCurr(ReplaceStr(edQuestao.Text, ',', ','));
            end;
         end;
      end
      else
      begin
         DM.qyAux5.SQL.Text := 'UPDATE leitora_provas_alunos_resp SET ds_resposta = :ds_resposta WHERE cd_prova_aluno = :cd_prova_aluno AND nr_questao = :nr_questao AND nr_correcao = :nr_correcao AND nr_parte = :nr_parte';
         DM.qyAux5.ParamByName('ds_resposta').AsString :=  ReplaceStr(edQuestao.Text, ',', '.');
      end;

      DM.qyAux5.ParamByName('cd_prova_aluno').AsInteger := qyOperacoes.FieldByName('cd_prova_aluno').AsInteger;
      DM.qyAux5.ParamByName('nr_questao').AsInteger := qyOperacoes.FieldByName('nr_questao').AsInteger;
      DM.qyAux5.ParamByName('nr_correcao').AsInteger := StrToInt(edQtdCorrecoes.Text);
      DM.qyAux5.ParamByName('nr_parte').AsInteger := qyOperacoes.FieldByName('nr_parte').AsInteger;
      DM.qyAux5.ExecSQL();

      qyOperacoes.Next();
   end;

   if slQuestoesErro.Count > 0 then
   begin
      slQuestoesErro.Delimiter := ',';
      msgErro := msgErro + slQuestoesErro.DelimitedText;
      Mensagem(msgErro, Application.Title, MB_OK+MB_ICONEXCLAMATION);
      slQuestoesErro.Free;
   end
   else
   begin
      edCodigoAluno.Text := '';
      edCodigoAluno.SetFocus();
      aluno_selecionado := False;
      lbNomeAluno.Caption := '-';
      lbTurma.Caption := '-';
      DestruirCampos();
   end;
end;

procedure TfrmCorrecaoManual.DestruirCampos();
var
   i : integer;
   destruir : array of string;
begin
   for i := 0 to frmCorrecaoManual.ComponentCount-1 do begin
      try
         if ( (Pos('lbQuestao_', frmCorrecaoManual.Components[i].Name) > 0) OR (Pos('edQuestao_', frmCorrecaoManual.Components[i].Name) > 0) ) then begin
            SetLength(destruir, Length(destruir)+1);
            destruir[Length(destruir)-1] := frmCorrecaoManual.Components[i].Name;
         end;
      except
      end;
   end;

   if ( Length(destruir) = 0 ) then begin
      Exit;
   end;

   for i := 0 to Length(destruir)-1 do begin
      if ( (Pos('lbQuestao_', destruir[i]) > 0) ) then begin
         with TLabel( frmCorrecaoManual.FindComponent(destruir[i]) ) do begin
            Destroy;
         end;
         //FreeAndNil(lbQuestao);
      end;
      if ( (Pos('edQuestao_', destruir[i]) > 0) ) then begin
         with TEdit( frmCorrecaoManual.FindComponent(destruir[i]) ) do begin
            Destroy;
         end;
         //FreeAndNil(edQuestao);
      end;
   end;
end;

procedure TfrmCorrecaoManual.DBGrid1DblClick(Sender: TObject);
begin
   edCodigoAluno.Text := qyInconsistencias.FieldByName('cd_pessoa').AsString;
   pnMostraInconsistenciasClick(nil);
   FiltraPessoa();
end;

procedure TfrmCorrecaoManual.FiltraPessoa();
begin
   aluno_selecionado := False;

   lbNomeAluno.Caption := '-';
   lbTurma.Caption := '-';

   if (not prova_selecionada) then
   begin
      Mensagem('Selecione uma prova !', Application.Title, MB_OK + MB_ICONERROR);
      edCodProva.SelectAll();
      Exit;
   end;

   // Carrega a prova do aluno

   with qyDadosAluno do
   begin
      Close();
      SQL.Text := '' +
       ' SELECT pa.*, p.nm_pessoa  ' +
       ' FROM                      ' +
       '    leitora_provas_alunos pa  ' +
       ' 	LEFT JOIN matriculas m ON (m.codigoaluno = pa.cd_pessoa AND m.anosemestre = pa.nr_anosemestre AND m.turma = pa.cd_turma)  '+
		 '    INNER JOIN pessoas p ON (p.cd_pessoa = pa.cd_pessoa)  '+
       '    INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_gabarito = pa.cd_prova_gabarito)  ' +
       ' WHERE   ' +
       ' 	pg.cd_prova in ( ' + ListaProvas + ' ) AND ' +
       '    p.cd_pessoa = :cd_pessoa ';

      try
        ParamByName('cd_pessoa').AsInteger := StrToInt(edCodigoAluno.Text);
      except
         Mensagem('O código de pessoa deve ser numérico !', Application.Title, MB_OK + MB_ICONERROR);
         edCodigoAluno.SelectAll();
         Exit;
      end;

      Open();
   end;

   if ( qyDadosAluno.Eof ) then
   begin
      Mensagem('Pessoa inexistente ou não faz parte desta prova !', Application.Title, MB_OK + MB_ICONERROR);
      edCodigoAluno.SelectAll();
      Exit;
   end;

   lbNomeAluno.Caption := qyDadosAluno.FieldByName('nm_pessoa').AsString;
   lbTurma.Caption := qyDadosAluno.FieldByName('cd_turma').AsString;

   // carregar os gabaritos do aluno

   ListaProvasGabaritos := ' -1';

   while not qyDadosAluno.Eof  do
   begin

      ListaProvasGabaritos := ListaProvasGabaritos + ', ' + qyDadosAluno.FieldByName('cd_prova_gabarito').AsString;

      qyDadosAluno.Next();
   end;

   aluno_selecionado := True;

   GeraCamposQuestoes();
end;

procedure TfrmCorrecaoManual.SpeedButton1Click(Sender: TObject);
begin

   frmSelProva.ShowModal;
   if frmSelProva.flgSearch then
   begin
      edCodigoAluno.Text := '';
      aluno_selecionado := False;
      lbNomeAluno.Caption := '-';
      lbTurma.Caption := '-';
      DestruirCampos();

      prova_selecionada := False;

      edCodProva.Text := IntToStr(frmSelProva.qyProva.FieldByName('cd_prova').AsInteger);

      // Verificar se a prova selecionada tem outras provas para correção em conjunto:

      ListaProvas :=  '-1';
      ListaProvasGabaritos := '-1';

      ListaProvas := ListaProvas + ', ' + frmSelProva.qyProva.FieldByName('cd_prova').AsString;

      DM.qyAux4.Close();
      DM.qyAux4.SQL.Text := 'SELECT cd_proxima_prova FROM leitora_provas ' +
       ' WHERE cd_prova = :Prova '  +
       ' AND IfNull(cd_proxima_prova,0) <> 0 ';
      DM.qyAux4.ParamByName('Prova').AsInteger := frmSelProva.qyProva.FieldByName('cd_prova').AsInteger;
      Dm.qyAux4.Open();

      while not DM.qyAux4.Eof do
      begin

          ListaProvas := ListaProvas + ', ' + DM.qyAux4.FieldByName('cd_proxima_prova').AsString;

          DM.qyAux4.ParamByName('Prova').AsInteger := DM.qyAux4.FieldByName('cd_proxima_prova').AsInteger;
          DM.qyAux4.Close();
          Dm.qyAux4.Open();
      
      end;

      // MultiProvas é um Array que contém o código de todas as provas agrupadas - para digitação sequencial.      

      FiltraProva();
   end;

end;

procedure TfrmCorrecaoManual.btnFecharClick(Sender: TObject);
begin
   Close();
end;

end.
