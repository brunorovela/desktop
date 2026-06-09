unit UFLGTCComunicado;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UZDataset, DB, ZAbstractRODataset, ZAbstractDataset, ExtCtrls,
   DBCtrls, StdCtrls, Buttons, DBGrids, IdHTTP;

type
   TfrmLGTCComunicado = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnEnviar: TBitBtn;
      chkNotificarOutros: TCheckBox;
      chkSituacaoAula: TCheckBox;
      dbckConsultor: TDBCheckBox;
      dbckCoordenador: TDBCheckBox;
      dbckNotificarProfessor: TDBCheckBox;
      dblcObjetivo: TDBLookupComboBox;
      dblcSituacaoAula: TDBLookupComboBox;
      dblcSituacaoDespesa: TDBLookupComboBox;
      dbmComplemento: TDBMemo;
      dsComunicado: TDataSource;
      edtOutrosEmails: TEdit;
      lblComplemento: TLabel;
      lblEnviarPara: TLabel;
      lblObjetivo: TLabel;
      lblOrientacao: TLabel;
      lblSituacaoDespesa: TLabel;
      pnlDados: TPanel;
      qryComunicado: TUMZQuery;
      qryComunicadoAula: TUMZQuery;
      qryComunicadoAulaCD_COMUNICADO: TLargeintField;
      qryComunicadoAulaCD_DIARIO_AULA: TLargeintField;
      qryComunicadoCD_COMUNICADO: TLargeintField;
      qryComunicadoCD_OBJETIVO: TSmallintField;
      qryComunicadoCD_SITUACAO_AULA: TIntegerField;
      qryComunicadoCD_SITUACAO_DESPESA: TLargeintField;
      qryComunicadoDS_EMAIL_OUTROS: TMemoField;
      qryComunicadoDS_OBJETIVO: TStringField;
      qryComunicadoDS_SITUACAO_AULA: TStringField;
      qryComunicadoDS_SITUACAO_DESPESA: TStringField;
      qryComunicadoME_COMPLEMENTO_MENSAGEM: TMemoField;
      qryComunicadoME_TEMPLATE: TMemoField;
      qryComunicadoSN_NOTIFICAR_CONSULTOR: TSmallintField;
      qryComunicadoSN_NOTIFICAR_COORDENADOR: TSmallintField;
      qryComunicadoSN_NOTIFICAR_PROFESSOR: TSmallintField;
      qryObjetivos: TUMZReadOnlyQuery;
      qryObjetivosCD_OBJETIVO: TSmallintField;
      qryObjetivosDS_OBJETIVO: TStringField;
      qrySituacaoAula: TUMZReadOnlyQuery;
      qrySituacaoAulaCD_SITUACAO: TIntegerField;
      qrySituacaoAulaDS_SIGLA: TStringField;
      qrySituacaoAulaDS_VALOR: TStringField;
      qrySituacaoDespesa: TUMZReadOnlyQuery;
      qrySituacaoDespesaCD_SITUACAO: TLargeintField;
      qrySituacaoDespesaDS_CHAVE: TStringField;
      qrySituacaoDespesaDS_SITUACAO: TStringField;
      procedure chkNotificarOutrosClick(Sender: TObject);
      procedure chkSituacaoAulaClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      function GetTemplate: AnsiString;
      procedure Save;
      procedure UpdateAulas;
   public
      class function New: TModalResult;
   end;

var
   frmLGTCComunicado: TfrmLGTCComunicado;

implementation

{$R *.dfm}

uses
   uContAulasProvas, ZDbcIntfs, UZDbcFuncs, uDM, UFLGTCDespesasResumo;

procedure TfrmLGTCComunicado.chkNotificarOutrosClick(Sender: TObject);
begin
   edtOutrosEmails.Enabled := chkNotificarOutros.Checked;
end;

procedure TfrmLGTCComunicado.chkSituacaoAulaClick(Sender: TObject);
begin
   dblcSituacaoAula.Enabled := chkSituacaoAula.Checked;
end;

procedure TfrmLGTCComunicado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if ModalResult = mrOk then
      Save;

   if ModalResult = mrNone then
      Exit;

   if ModalResult <> mrOk then
      qryComunicado.Cancel;

   Action := caFree;
   frmLGTCComunicado := nil;
end;

function TfrmLGTCComunicado.GetTemplate: AnsiString;

   function GetListaAulas: AnsiString;
   var
      SelectedRows: TBookmarkList;
      Bookmark: TBookmark;
      Items: TStrings;
      I: Integer;
   begin
      Result := '';
      Items := TStringList.Create;
      try
         Items.Delimiter := ',';
         
         SelectedRows := frmContAulasProvas.dbgAulas.SelectedRows;

         for I := 0 to SelectedRows.Count - 1 do
         begin
            Bookmark := TBookmark(SelectedRows[I]);

            frmContAulasProvas.qyAulas.GotoBookmark(Bookmark);
            Items.Add(frmContAulasProvas.qyAulascd_diario_aula.AsString);
         end;

         Result := Items.DelimitedText;

      finally
         FreeAndNil(Items);
      end;
   end;

const
   SURLFmt = '%sprojetos/unimestre/logistica/template.php?aulas=%s&situacao=%u';
var
   Response: TStringStream;
   HTTP: TIdHTTP;
   URL, S: AnsiString;
begin

   S := DM.variavel_parametro('online_endereco_local');
   URL := Format(SURLFmt, [S, GetListaAulas,
      qryComunicadoCD_SITUACAO_DESPESA.AsLargeInt]);

   Result := '';

   Response := TStringStream.Create('');
   try
      HTTP := TIdHTTP.Create(nil);
      try
         HTTP.Get(URL, Response);

         if HTTP.ResponseCode = 200 then
            Result := Response.DataString;

      finally
         FreeAndNil(HTTP);
      end;
   finally
      FreeAndNil(Response);
   end;
end;

class function TfrmLGTCComunicado.New: TModalResult;
begin
   Application.CreateForm(TfrmLGTCComunicado, frmLGTCComunicado);

   frmLGTCComunicado.qryComunicado.Open;
   frmLGTCComunicado.qryComunicado.Insert;
   frmLGTCComunicado.qryComunicadoSN_NOTIFICAR_CONSULTOR.AsInteger := 0;
   frmLGTCComunicado.qryComunicadoSN_NOTIFICAR_COORDENADOR.AsInteger := 0;
   frmLGTCComunicado.qryComunicadoSN_NOTIFICAR_PROFESSOR.AsInteger := 0;
   Result := frmLGTCComunicado.ShowModal;
end;

procedure TfrmLGTCComunicado.Save;
const
   SConfirmaCP = 'A situação selecionada está configurada para gerar compromissos para as despesas vinculadas com a aula.'#13'Ao salvar a alteração desta aula o sistema irá lançar automaticamente os compromissos para as suas despesas.'#13'Deseja continuar?';
var
   I, SituacaoCP, UserChoice: Integer;
   Bookmark: TBookmark;
   SelectedRows: TBookmarkList;
   S: AnsiString;
   GerarCP: Boolean;
begin
   S := DM.variavel_parametro('LogisticaAulas.Compromisso.Gerar.SituacaoAula');

   SituacaoCP := StrToIntDef(S, 0);

   GerarCP := False;

   if chkSituacaoAula.Checked and
      (qryComunicadoCD_SITUACAO_AULA.AsInteger = SituacaoCP) then
   begin

      UserChoice := MessageDlg(SConfirmaCP, mtConfirmation, [mbYes, mbNo], -1);

      if UserChoice = ID_NO then
      begin
         ModalResult := mrNone;
         Exit;
      end;

      GerarCP := True;         
   end;

   if chkSituacaoAula.Checked then
      UpdateAulas;

   if chkNotificarOutros.Checked then
      qryComunicadoDS_EMAIL_OUTROS.AsString := edtOutrosEmails.Text;

   if not chkSituacaoAula.Checked then
      qryComunicadoCD_SITUACAO_AULA.Clear;

   qryComunicadoME_TEMPLATE.AsString := GetTemplate;
   qryComunicado.Post;

   qryComunicadoAula.Open;

   frmContAulasProvas.qyAulas.DisableControls;
   try
      SelectedRows := frmContAulasProvas.dbgAulas.SelectedRows;

      for I := 0 to SelectedRows.Count - 1 do
      begin
         Bookmark := TBookmark(SelectedRows[I]);
         frmContAulasProvas.qyAulas.GotoBookmark(Bookmark);

         qryComunicadoAula.Insert;
         qryComunicadoAulaCD_DIARIO_AULA.AsLargeInt := frmContAulasProvas.qyAulascd_diario_aula.AsLargeInt;
         qryComunicadoAulaCD_COMUNICADO.AsLargeInt := qryComunicadoCD_COMUNICADO.AsLargeInt;

         if GerarCP then
            ModalResult := TfrmLGTCDespesasResumo.ShowDespesas(frmContAulasProvas.qyAulascd_diario_aula.AsLargeInt);

      end;

      if qryComunicadoAula.State = dsInsert then
         qryComunicadoAula.Post;
      
   finally
      frmContAulasProvas.qyAulas.EnableControls;
   end;

   qryComunicadoAula.Close;
end;

procedure TfrmLGTCComunicado.UpdateAulas;
const
   SQLUpdateAulas = 'UPDATE `DIARIO_AULAS` SET `CD_SITUACAO` = ? WHERE `CD_DIARIO_AULA` IN (%s)';
var
   I: Integer;
   Bookmark: TBookmark;
   SelectedRows: TBookmarkList;
   RecordList: TStrings;
   S, List: AnsiString;
   Stmt: IZPreparedStatement;
begin
   RecordList := TStringList.Create;
   try

      RecordList.Delimiter := ',';
   
      frmContAulasProvas.qyAulas.DisableControls;

      try

         SelectedRows := frmContAulasProvas.dbgAulas.SelectedRows;

         for I := 0 to SelectedRows.Count - 1 do
         begin
            Bookmark := TBookmark(SelectedRows[I]);
            frmContAulasProvas.qyAulas.GotoBookmark(Bookmark);
            RecordList.Add(frmContAulasProvas.qyAulascd_diario_aula.AsString);
         end;

         List := RecordList.DelimitedText;

         S := Format(SQLUpdateAulas, [List]);

         Stmt := PrepareStatement(S);
         try
            Stmt.SetInt(1, qryComunicadoCD_SITUACAO_AULA.AsInteger);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
         end;
         
      finally
         frmContAulasProvas.qyAulas.EnableControls;
      end;
      
   finally
      FreeAndNil(RecordList);
   end;
end;

end.
