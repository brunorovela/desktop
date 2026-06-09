unit UFRelConfig;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, Grids, DBGrids, UDM, DB,
   ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls, DBCtrls, Mask,
   SynEditHighlighter, SynHighlighterSQL, SynEdit,
   SynDBEdit, uLoginManager, uUsuario;

type
   TfRelConfig = class(TForm)
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      pnlTitulo: TPanel;
      tlbFerrmntas: TToolBar;
      btnSep1: TToolButton;
      btnIncluir: TToolButton;
      btnAlterar: TToolButton;
      btnExcluir: TToolButton;
      btnSep2: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      btnFechar: TToolButton;
      btnSep4: TToolButton;
      ilFerrmntas: TImageList;
      pnlLista: TPanel;
      splSep1: TSplitter;
      pnlListaTitulo: TPanel;
      bvlSep5: TBevel;
      dbgRelatorios: TDBGrid;
      dsRelatorios: TDataSource;
      pnlDados: TPanel;
      pnlDadosTitulo: TPanel;
      sbxDados: TScrollBox;
      bvlSep6: TBevel;
      qryRelatorios: TUMZQuery;
      qryRelatoriosNM_RELATORIO: TStringField;
      qryRelatoriosCD_MODULO: TIntegerField;
      qryRelatoriosCD_CABECALHO: TIntegerField;
      qryRelatoriosDS_GRUPO: TStringField;
      qryRelatoriosNM_ARQUIVO: TStringField;
      qryRelatoriosDS_PARAMETROS: TStringField;
      qryRelatoriosDS_FORMULA: TMemoField;
      qryRelatoriosDS_SQL_EXP: TMemoField;
      qryRelatoriosDS_ESPECIAL: TMemoField;
      qryRelatoriosDS_ORDEM: TStringField;
      qryRelatoriosSN_DISPONIVEL: TStringField;
      qryRelatoriosDS_FORMULA_GRUPO: TStringField;
      qryRelatoriosDS_SQL: TMemoField;
      qryRelatoriosDS_SQL_ORDEM: TStringField;
      qryRelatoriosSN_IMPRESSAO_NUMERO: TStringField;
      qryRelatoriosDS_VARIAVEIS: TStringField;
      lblNome: TLabel;
      dbeNome: TDBEdit;
      lblGrupo: TLabel;
      dbeGrupo: TDBEdit;
      lblArquivo: TLabel;
      dbeArquivo: TDBEdit;
      lblParametros: TLabel;
      dbeParametros: TDBEdit;
      lblFormula: TLabel;
      dbmFormula: TDBMemo;
      lblEspecial: TLabel;
      dbmEspecial: TDBMemo;
      lblOrdem: TLabel;
      dbeOrdem: TDBEdit;
      lblFormulaGrupo: TLabel;
      dbeFormulaGrupo: TDBEdit;
      lblSQL: TLabel;
      dbrgModulo: TDBRadioGroup;
      dbsedSQL: TDBSynEdit;
      ssqlHighlighter: TSynSQLSyn;
      dbchNumeroImp: TDBCheckBox;
      dbchDisponivel: TDBCheckBox;
    qryRelatoriosCD_RELATORIO: TLargeintField;
      procedure dbgRelatoriosTitleClick(Column: TColumn);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnFecharClick(Sender: TObject);
      procedure dsRelatoriosStateChange(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
   end;

var
   fRelConfig: TfRelConfig;

implementation

const
   SActionKey = 'UMAdministracao.Relatorios.Cadastro';

{$R *.dfm}

procedure TfRelConfig.btnAlterarClick(Sender: TObject);
begin
   qryRelatorios.Edit;
end;

procedure TfRelConfig.btnCancelarClick(Sender: TObject);
begin
   qryRelatorios.Cancel;
end;

procedure TfRelConfig.btnExcluirClick(Sender: TObject);
const
   SCapConfirm = 'Confirmação';
   SMsgConfirm = 'Deseja realmente excluir o registro selecionado?';
begin
   if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
      qryRelatorios.Delete;   
end;

procedure TfRelConfig.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfRelConfig.btnIncluirClick(Sender: TObject);
begin
   dbeNome.SetFocus;
   qryRelatorios.Insert;
end;

procedure TfRelConfig.btnSalvarClick(Sender: TObject);
begin
   qryRelatorios.Post;
end;

procedure TfRelConfig.dbgRelatoriosTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := #59;
      SortedFields.StrictDelimiter := True;
      SortedFields.NameValueSeparator := #32;
      SortedFields.DelimitedText := qryRelatorios.IndexFieldNames;

      for I := 0 to SortedFields.Count - 1 do
         if SortedFields.Names[I] = Column.FieldName then
         begin
            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;
            Found := True;
            Break;
         end;

      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;

      qryRelatorios.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfRelConfig.dsRelatoriosStateChange(Sender: TObject);
begin

   btnIncluir.Enabled := (qryRelatorios.State = dsBrowse) and
      (DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npIncluir, False));

   btnAlterar.Enabled := (qryRelatorios.State = dsBrowse) and
      (not qryRelatorios.IsEmpty) and
      (DM.GetUsuarioLogado.TemPermissao(
            DM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npAlterar, False));

   btnExcluir.Enabled := (qryRelatorios.State = dsBrowse) and
      (not qryRelatorios.IsEmpty) and
      (DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npExcluir, False));

   btnSalvar.Enabled := qryRelatorios.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryRelatorios.State in [dsInsert, dsEdit];
   btnFechar.Enabled := qryRelatorios.State = dsBrowse;
end;

procedure TfRelConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryRelatorios.Close;
   Action := caFree;
end;

procedure TfRelConfig.FormCreate(Sender: TObject);
begin
   qryRelatorios.Open;
   btnIncluir.Enabled := DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npIncluir, False);

   btnAlterar.Enabled := DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npAlterar, False);
      
   btnExcluir.Enabled := DM.GetUsuarioLogado.TemPermissao(
      DM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npExcluir, False);
end;

procedure TfRelConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if btnIncluir.Enabled then
            btnIncluir.Click;
      VK_F3:
         if btnAlterar.Enabled then
            btnAlterar.Click;
      VK_F9:
         if btnExcluir.Enabled then
            btnExcluir.Click;
      VK_F5:
         if btnSalvar.Enabled then
            btnSalvar.Click;
      VK_F6:
         if btnCancelar.Enabled then
            btnCancelar.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

end.
