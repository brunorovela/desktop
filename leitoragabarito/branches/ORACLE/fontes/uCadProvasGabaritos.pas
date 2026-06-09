unit uCadProvasGabaritos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls, Buttons, ImgList, ToolWin,
  Tabs, UMLookupComboBox;

type
  TfrmCadProvasGabaritos = class(TForm)
    Bevel1: TBevel;
    btnFechar: TSpeedButton;
    Bevel2: TBevel;
    qyGabarito: TUMZQuery;
    srcGabarito: TDataSource;
    qyGabaritocd_prova_gabarito: TIntegerField;
    qyGabaritocd_prova: TIntegerField;
    qyGabaritods_nome_gabarito: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    qyRespostas: TUMZQuery;
    qyRespostascd_prova_gabarito_resposta: TIntegerField;
    qyRespostascd_prova_gabarito: TIntegerField;
    qyRespostasnr_alternativas: TSmallintField;
    qyRespostasnr_questao: TSmallintField;
    qyRespostasds_resposta: TStringField;
    qyRespostascd_prova_disciplina: TIntegerField;
    grdRespostas: TDBGrid;
    srcRespostas: TDataSource;
    qyDisciplina: TUMZQuery;
    qyDisciplinadescricao: TStringField;
    srcDisciplina: TDataSource;
    pnQuestoes: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbAlternativas: TDBEdit;
    DBEdit3: TDBEdit;
    dbResposta: TDBEdit;
    toolResposta: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    lcDisciplina: TUMLookupComboBox;
    qyDisciplinacd_prova_disciplina: TIntegerField;
    lbPeso: TLabel;
    dbePeso: TDBEdit;
    qyRespostasvl_peso: TFloatField;
    DBCheckBox1: TDBCheckBox;
    qyRespostascd_situacao: TSmallintField;
    qyRespostassn_anulada: TStringField;
    dbcDiscursiva: TDBCheckBox;
    qyRespostassn_discursiva: TSmallintField;
    DBCheckBox2: TDBCheckBox;
    qyRespostassn_parcial: TSmallintField;
    qyRespostassn_parcial_x: TStringField;
    qyRespostasnr_parte: TIntegerField;
    tsPartes: TTabSet;
    Label6: TLabel;
    lbParteSelecionada: TLabel;
    procedure tsPartesChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure grdRespostasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbcDiscursivaKeyPress(Sender: TObject; var Key: Char);
    procedure dbcDiscursivaClick(Sender: TObject);
    procedure grdRespostasDblClick(Sender: TObject);
    procedure qyRespostasCalcFields(DataSet: TDataSet);
    procedure qyRespostasBeforePost(DataSet: TDataSet);
    procedure dbePesoKeyPress(Sender: TObject; var Key: Char);
    procedure lcDisciplinaKeyPress(Sender: TObject; var Key: Char);
    procedure dbAlternativasKeyPress(Sender: TObject; var Key: Char);
    procedure dbRespostaKeyPress(Sender: TObject; var Key: Char);
    procedure qyRespostasAfterInsert(DataSet: TDataSet);
    procedure qyGabaritoNewRecord(DataSet: TDataSet);
    procedure srcRespostasStateChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure qyRespostasAfterPost(DataSet: TDataSet);
    procedure qyRespostasNewRecord(DataSet: TDataSet);
    procedure qyRespostasBeforeInsert(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure srcGabaritoDataChange(Sender: TObject; Field: TField);
    procedure srcRespostasDataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSalvarFecharClick(Sender: TObject);

  private
    { Private declarations }

    procedure Salvar();
    procedure Fechar();
    procedure FiltrarParteSelecionada();
  public
    flgSearch : Boolean;
    cd_prova : integer;
    cd_prova_gabarito : integer;

    iUltimo : Integer;

    procedure LoadNumeroPartes(nr_partes : Integer);
    { Public declarations }
  end;

var
  frmCadProvasGabaritos: TfrmCadProvasGabaritos;

implementation

uses Main, uDM, uSelDisciplinas, uCadProvas;

{$R *.DFM}

procedure TfrmCadProvasGabaritos.btnFecharClick(Sender: TObject);
begin
   Salvar();
   Fechar();
end;

procedure TfrmCadProvasGabaritos.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmCadProvasGabaritos.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   qyDisciplina.Close();
   qyDisciplina.Open();

   FiltrarParteSelecionada();
end;

procedure TfrmCadProvasGabaritos.sbSalvarFecharClick(Sender: TObject);
begin
   Salvar();
   Fechar();
end;

procedure TfrmCadProvasGabaritos.Salvar();
begin
   if qyRespostas.State in [dsInsert,dsEdit] then begin
      qyRespostas.Post();
   end;
   if qyGabarito.State in [dsInsert,dsEdit] then begin
      qyGabarito.Post();
   end;
end;

procedure TfrmCadProvasGabaritos.Fechar();
begin
  flgSearch := True;
  Close;
end;

procedure TfrmCadProvasGabaritos.FiltrarParteSelecionada();
begin
   qyRespostas.Filtered := False;
   qyRespostas.Filter := 'nr_parte = ' + IntToStr(tsPartes.Tag);
   qyRespostas.Filtered := True;

   lbParteSelecionada.Caption := tsPartes.Tabs[tsPartes.Tag-1];
   qyRespostas.Open();
   qyRespostas.Locate('nr_questao', 1,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmCadProvasGabaritos.sbSalvarClick(Sender: TObject);
begin
   Salvar();
end;

procedure TfrmCadProvasGabaritos.srcRespostasDataChange(Sender: TObject;
  Field: TField);
begin
   qyDisciplina.Close();
   qyDisciplina.Open();

   dbResposta.Enabled := not dbcDiscursiva.Checked;
   dbAlternativas.Enabled := not dbcDiscursiva.Checked;

   if dbcDiscursiva.Checked then
   begin
      lbPeso.Caption := 'Peso/Pontuação máxima:';
   end else begin
      lbPeso.Caption := 'Peso:';
   end;
end;

procedure TfrmCadProvasGabaritos.srcGabaritoDataChange(Sender: TObject;
  Field: TField);
begin
   qyRespostas.Close();
   qyRespostas.Open();

   qyDisciplina.Close();
   qyDisciplina.Open();
end;

procedure TfrmCadProvasGabaritos.SpeedButton1Click(Sender: TObject);
begin
   frmSelDisciplinas.cd_prova := cd_prova;
   frmSelDisciplinas.ShowModal();
   if frmSelDisciplinas.flgSearch then begin
      if not (qyRespostas.State in [dsInsert,dsEdit]) then begin
         qyRespostas.Edit();
      end;
      qyRespostas.FieldByName('cd_prova_disciplina').AsInteger := frmSelDisciplinas.qryCursos.FieldByName('cd_prova_disciplina').AsInteger;
   end;
end;

procedure TfrmCadProvasGabaritos.SpeedButton2Click(Sender: TObject);
begin
   dbResposta.SetFocus();
   qyRespostas.Insert();
end;

procedure TfrmCadProvasGabaritos.qyRespostasBeforeInsert(DataSet: TDataSet);
begin
   with qyGabarito do
   begin
     if State in [dsInsert,dsEdit] then
     begin
        Post();
        Close();
        ParamByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
        Open();
     end;
   end;

   with DM.qyAux do
   begin
      Close();
      SQL.Text := 'SELECT MAX(nr_questao) AS nr_questao FROM leitora_provas_gabaritos_resp WHERE cd_prova_gabarito = :cd_prova_gabarito AND nr_parte = :nr_parte';
      ParamByName('cd_prova_gabarito').AsInteger := qyGabarito.FieldByName('cd_prova_gabarito').AsInteger;
      ParamByName('nr_parte').AsInteger := tsPartes.Tag;
      Open();

      if Eof then
      begin
         iUltimo := 1;
      end else begin
         iUltimo := FieldByName('nr_questao').AsInteger+1;
      end;
   end;
end;

procedure TfrmCadProvasGabaritos.qyRespostasNewRecord(DataSet: TDataSet);
begin
   with DataSet do
   begin
      FieldByName('nr_parte').AsInteger := tsPartes.Tag;

      FieldByName('cd_prova_gabarito').AsInteger := qyGabarito.FieldByName('cd_prova_gabarito').AsInteger;
      FieldByName('nr_questao').AsInteger := iUltimo;

      FieldByName('sn_parcial').AsInteger := StrToInt(DM.variavel_parametro('sn_parcial_padrao'));
   end;
end;

procedure TfrmCadProvasGabaritos.qyRespostasAfterPost(DataSet: TDataSet);
var
  reg : Pointer;

begin
   reg := DataSet.GetBookmark();
   DataSet.Close();
   DataSet.Open();

   if DataSet.BookmarkValid(reg) then
      DataSet.GotoBookmark(reg);
end;

procedure TfrmCadProvasGabaritos.btnInserirClick(Sender: TObject);
begin
   dbResposta.Enabled := true;
   dbAlternativas.Enabled := true;
   
   dbResposta.SetFocus();
   qyRespostas.Insert();
end;

procedure TfrmCadProvasGabaritos.btnAlterarClick(Sender: TObject);
begin
   dbResposta.SetFocus();
   qyRespostas.Edit();
end;

procedure TfrmCadProvasGabaritos.btnSalvarClick(Sender: TObject);
var questao : string;
begin
{
   if not DM.ValidaResposta(dbResposta.Text) then begin
      Mensagem( 'Informe uma resposta válida (A a Z, ou 0 a 999) !', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;
   if not DM.VerificaNumero(dbAlternativas.Text) then begin
      Mensagem( 'A quantidade de alternativas deve ser um número !', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;
   if StrToInt(dbAlternativas.Text) > 10 then begin
      Mensagem( 'O número máximo de alterantivas aceitas é 10 !', Application.Title, MB_OK + MB_ICONINFORMATION );
      Abort();
   end;
}  {Recupera o numero da questao alterada para dar um locate }
   questao := DBEdit3.Text;
   qyRespostas.Post();
   qyRespostas.Close();
   qyRespostas.Open();
   qyRespostas.Locate('nr_questao', questao, [loCaseInsensitive,loPartialKey]);
end;

procedure TfrmCadProvasGabaritos.btnCancelarClick(Sender: TObject);
begin
   qyRespostas.Cancel();
end;

procedure TfrmCadProvasGabaritos.btnExcluirClick(Sender: TObject);
var
   iNumero : integer;
begin

   with grdRespostas.SelectedRows do begin

      if Count < 1 then begin
         Mensagem( 'Selecione pelo menos uma resposta.', Application.Title, MB_OK + MB_ICONINFORMATION );
         Abort();
      end;

      if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) <> ID_YES then begin
         Abort();
      end;

      for iNumero:= 0 to Count - 1 do begin
         grdRespostas.DataSource.DataSet.GotoBookmark(Pointer(Items[iNumero]));
         with DM.qyAux do begin
            SQL.Text := 'DELETE FROM leitora_provas_gabaritos_resp WHERE cd_prova_gabarito_resposta = :cd_prova_gabarito_resposta';
            ParamByName('cd_prova_gabarito_resposta').AsInteger := qyRespostas.FieldByName('cd_prova_gabarito_resposta').AsInteger;
            ExecSQL();
         end;
      end;

   end;

   qyRespostas.Close();
   qyRespostas.Open();

end;

procedure TfrmCadProvasGabaritos.srcRespostasStateChange(Sender: TObject);
var
   estado : boolean;
begin
   estado := (qyRespostas.State in [dsInsert, dsEdit]);
   btnInserir.Enabled := not estado;
   btnAlterar.Enabled := not estado;
   btnExcluir.Enabled := not estado;

   btnSalvar.Enabled := estado;
   btnCancelar.Enabled := estado;
end;

procedure TfrmCadProvasGabaritos.tsPartesChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
var
   salvarQuery : Boolean;
begin
   if (frmCadProvas <> nil) AND (NewTab = tsPartes.Tabs.Count-1) then
   begin
      AllowChange := Mensagem('Adicionar mais uma parte na prova?', '', MB_YESNO + MB_ICONQUESTION, Handle) = mrYes;

      if NOT(AllowChange) then
         Exit;

      salvarQuery := False;
      if NOT(frmCadProvas.qyProvas.State IN [dsEdit]) then
      begin
         frmCadProvas.qyProvas.Edit();
         salvarQuery := True;
      end;

      frmCadProvas.qyProvasnr_qtd_partes_gabarito.AsInteger := tsPartes.Tabs.Count;

      if (salvarQuery) then
      begin
         frmCadProvas.qyProvas.Post();
      end;

      LoadNumeroPartes(tsPartes.Tabs.Count);
   end;

   tsPartes.Tag := NewTab+1;
   FiltrarParteSelecionada();
end;

procedure TfrmCadProvasGabaritos.qyGabaritoNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('cd_prova').AsInteger := cd_prova;

   with DM.qyAux do begin
      Close();
      SQL.Text := 'SELECT If(isNull(MAX(cd_prova_gabarito)),1,MAX(cd_prova_gabarito)+1) AS cd_prova_gabarito FROM leitora_provas_gabaritos';
      Open();
      cd_prova_gabarito := FieldByName('cd_prova_gabarito').AsInteger;

      qyGabarito.FieldByName('cd_prova_gabarito').AsInteger := cd_prova_gabarito;
   end;
end;

procedure TfrmCadProvasGabaritos.qyRespostasAfterInsert(DataSet: TDataSet);
begin
   if qyDisciplina.RecordCount = 1 then begin
      qyRespostas.FieldByName('cd_prova_disciplina').AsInteger := qyDisciplina.FieldByName('cd_prova_disciplina').AsInteger;
   end;
end;

procedure TfrmCadProvasGabaritos.dbRespostaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin
    dbAlternativas.SetFocus();
  end;

end;

procedure TfrmCadProvasGabaritos.dbAlternativasKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin
    lcDisciplina.SetFocus();
  end;

end;

procedure TfrmCadProvasGabaritos.dbcDiscursivaClick(Sender: TObject);
begin
   dbResposta.Enabled := not dbcDiscursiva.Checked;
   dbAlternativas.Enabled := not dbcDiscursiva.Checked;

end;

procedure TfrmCadProvasGabaritos.dbcDiscursivaKeyPress(Sender: TObject;
  var Key: Char);
begin
   dbResposta.Enabled := not dbcDiscursiva.Checked;
   dbAlternativas.Enabled := not dbcDiscursiva.Checked;

end;

procedure TfrmCadProvasGabaritos.lcDisciplinaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin
    dbePeso.SetFocus();
  end;

end;

procedure TfrmCadProvasGabaritos.LoadNumeroPartes(nr_partes: Integer);
var
   I : Integer;
begin
   tsPartes.Tabs.Clear();
   for I := 1 to nr_partes do
   begin
      tsPartes.Tabs.Add('Parte ' + IntToStr(I));
   end;

   if (frmCadProvas <> nil) then
   begin
      tsPartes.Tabs.Add(' + ');
   end;

   tsPartes.Tag := 1;

   if tsPartes.Tabs.Count > 0 then
      tsPartes.TabIndex := 0;
end;

procedure TfrmCadProvasGabaritos.dbePesoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then begin
    btnSalvarClick(nil);
    btnInserirClick(nil);
  end;

end;

procedure TfrmCadProvasGabaritos.qyRespostasBeforePost(DataSet: TDataSet);
begin

  if Dataset.FieldByName('nr_alternativas').AsString = '' then begin
    Dataset.FieldByName('nr_alternativas').AsInteger := 5;
  end;

  Dataset.FieldByName('ds_resposta').AsString := UpperCase(Dataset.FieldByName('ds_resposta').AsString);

  if (DM.VerificaeNumero(Dataset.FieldByName('ds_resposta').AsString)) AND (Length(Dataset.FieldByName('ds_resposta').AsString) = 1) then begin
    Dataset.FieldByName('ds_resposta').AsString := '0' + Dataset.FieldByName('ds_resposta').AsString;
  end;

end;

procedure TfrmCadProvasGabaritos.qyRespostasCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('cd_situacao').AsInteger = 3 then
    DataSet.FieldByName('sn_anulada').AsString := 'X';

  if DataSet.FieldByName('sn_parcial').AsInteger = 1 then
    DataSet.FieldByName('sn_parcial_x').AsString := 'X'
  else
    DataSet.FieldByName('sn_parcial_x').AsString := '';
end;

procedure TfrmCadProvasGabaritos.grdRespostasDblClick(Sender: TObject);
begin
  if grdRespostas.SelectedIndex = 4 then begin
    qyRespostas.Edit();

    if qyRespostas.FieldByName('cd_situacao').AsInteger = -1 then
      qyRespostas.FieldByName('cd_situacao').AsInteger := 3
    else if qyRespostas.FieldByName('cd_situacao').AsInteger = 3 then
      qyRespostas.FieldByName('cd_situacao').AsInteger := -1;

    qyRespostas.Post();
  end;
end;

procedure TfrmCadProvasGabaritos.grdRespostasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   cor : TColor;
begin
   // pega a cor que vem do campo calculado
   case qyRespostasnr_parte.AsInteger of
      1, 6, 11, 16, 21, 26: cor := clWebLemonChiffon;
      2, 7, 12, 17, 22, 27: cor := clWebIvory;
      3, 8, 13, 18, 23, 28: cor := clWebPapayaWhip;
      4, 9, 14, 19, 24, 29: cor := clWebBisque;
      5, 10, 15, 20, 25, 30: cor := clWebLavenderBlush;
      else begin
         cor := clWebLavender;
      end;
   end;

   grdRespostas.Canvas.Brush.Color := cor;
   grdRespostas.Canvas.Font.Color := clBlack;

   if gdFocused in State then
   begin
      grdRespostas.Canvas.Brush.Color:= clBlue;
      grdRespostas.Canvas.Font.Color := clWhite;
   end;

   grdRespostas.Canvas.FillRect(Rect);
   grdRespostas.DefaultDrawDataCell(Rect, Column.Field, State);
end;

end.
