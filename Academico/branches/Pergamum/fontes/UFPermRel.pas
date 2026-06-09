unit UFPermRel;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ImgList, ToolWin, uDM, Grids, DBGrids, DB,
   ZAbstractRODataset, UZDataset, StdCtrls, Buttons, UFSelGrupo, ZSqlProcessor,
   Contnrs, ZAbstractDataset;

type
   TfPermRel = class(TForm)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      tlbOpcoes: TToolBar;
      ilImagens: TImageList;
      btnSep1: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      bvlSep2: TBevel;
      pnlModulos: TPanel;
      splSep: TSplitter;
      pnlModulosTit: TPanel;
      bvlSep3: TBevel;
      dbgModulos: TDBGrid;
      dsModulos: TDataSource;
      qryModulos: TUMZReadOnlyQuery;
      qryModulosCD_MODULO: TIntegerField;
      qryModulosDS_NOME_MODULO: TStringField;
      qryModulosDS_DESCRICAO: TStringField;
      qryModulosDS_CHAVE: TStringField;
      pnlPerm: TPanel;
      pnlGrupo: TPanel;
      bvlSep4: TBevel;
      pnlGrupoTit: TPanel;
      bvlSep5: TBevel;
      ledGrupo: TLabeledEdit;
      sbSelGrupo: TSpeedButton;
      pnlGruposTit: TPanel;
      bvlSep6: TBevel;
      scriptAtualizaRel: TZSQLProcessor;
      qryPermissoes: TUMZReadOnlyQuery;
      qryPermissoesCD_ACAO: TIntegerField;
      qryPermissoesCD_MODULO: TIntegerField;
      qryPermissoesDS_NOME_ACAO: TStringField;
      qryPermissoesDS_CHAVE: TStringField;
      qryPermissoesDS_GRUPO: TStringField;
      qryUpdPerm: TUMZQuery;
      qryPermissoesCD_GRUPO: TIntegerField;
      pnlPermissoes: TPanel;
      sbxPermissoes: TScrollBox;
    qryPermissoesNR_PERMISSAO: TLargeintField;
    qryRe: TUMZQuery;
    scriptAtualizaRelOracle: TZSQLProcessor;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnFecharClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dsModulosDataChange(Sender: TObject; Field: TField);
      procedure FormCreate(Sender: TObject);
      procedure SetPermission(Sender: TObject);
      procedure sbSelGrupoClick(Sender: TObject);
      procedure CheckTodos(Sender: TObject);
      procedure VerificaTodos;

   private
      FCodGrupo : Integer;
      bChktodos : Boolean;
      bCheckItem : Boolean;
      ChkTodos  : TCheckBox;
      bChecaVisual : Boolean;
      function CreateNewPanel(const Action, Grupo: Integer;
         const Caption: string; const Checked: Boolean): TPanel;
      procedure ShowPermissions;
      procedure DeletaAcoes();
      procedure DestroyPermissions;
   end;

var
   fPermRel: TfPermRel;

implementation

{$R *.dfm}

procedure TfPermRel.btnFecharClick(Sender: TObject);
begin
   Close;
end;

function TfPermRel.CreateNewPanel(const Action, Grupo: Integer;
   const Caption: string; const Checked: Boolean): TPanel;
var
   Bevel: TBevel;
   CheckBox: TCheckBox;
begin
   Result := TPanel.Create(sbxPermissoes);
   Result.Parent := sbxPermissoes;
   Result.Align := alTop;
   Result.BevelOuter := bvNone;
   Result.Padding.Left := 5;
   Result.Height := 28;

   Bevel := TBevel.Create(Result);
   Bevel.Parent := Result;
   Bevel.Align := alBottom;
   Bevel.Shape := bsBottomLine;
   Bevel.Height := 2;

   CheckBox := TCheckBox.Create(Result);
   CheckBox.Name := Format('chk_%d_%d', [Action, Grupo]);
   CheckBox.Parent := Result;
   CheckBox.Align := alClient;
   CheckBox.Checked := Checked;
   CheckBox.Caption := Caption;
   CheckBox.OnClick := SetPermission;
end;

procedure TfPermRel.DestroyPermissions;
var
   Component: TComponent;
   I, J: Integer;
begin
   for I := sbxPermissoes.ComponentCount - 1 downto 0 do
   begin
      for J := sbxPermissoes.Components[I].ComponentCount - 1 downto 0 do
      begin
         Component := sbxPermissoes.Components[I].Components[J];
         sbxPermissoes.Components[I].RemoveComponent(Component);
         Component.Free;
      end;
      Component := sbxPermissoes.Components[I];
      sbxPermissoes.RemoveComponent(Component);
      Component.Free;
   end;
end;

procedure TfPermRel.dsModulosDataChange(Sender: TObject; Field: TField);
begin
   if FCodGrupo > 0 then
   begin
      dbgModulos.Enabled := False;
      sbxPermissoes.Visible := False;
      LockWindowUpdate(sbxPermissoes.Handle);
      DestroyPermissions;
      ShowPermissions;
      LockWindowUpdate(0);
      sbxPermissoes.Visible := True;
      dbgModulos.Enabled := True;
      VerificaTodos;
   end;
end;

procedure TfPermRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfPermRel.FormCreate(Sender: TObject);
begin
   bChecaVisual := false;
   bCheckItem   := false;
   bChktodos    := false;
   if(DM.db.Protocol = DB_PROTOCOL_MYSQL)then
   begin
      scriptAtualizaRel.Parse;
      scriptAtualizaRel.Execute;
   end
   else
   begin
      dm.db.ExecuteDirect(scriptAtualizaRelOracle.Script.Text);
   end;

   qryModulos.Open;
   DeletaAcoes;
end;
procedure TfPermRel.DeletaAcoes();
begin
   // deleta acoes inexistente
end;


procedure TfPermRel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

procedure TfPermRel.SetPermission(Sender: TObject);
const
   BoolToPerm: array [Boolean] of Integer = (0, 1);
var
   Strings: TStringList;
   Acao, Grupo: string;
   CheckBox: TCheckBox;
begin
   CheckBox := TCheckBox(Sender);
   Strings := TStringList.Create;
   ExtractStrings(['_'], [' '], PChar(CheckBox.Name), Strings);
   Acao := Strings.Strings[1];
   Grupo := Strings.Strings[2];
   qryUpdPerm.ParamByName('NR_PERMISSAO').AsInteger :=
      BoolToPerm[CheckBox.Checked];
   qryUpdPerm.ParamByName('CD_ACAO').AsString := Acao;
   qryUpdPerm.ParamByName('CD_GRUPO').AsString := Grupo;
   qryUpdPerm.ExecSQL;
   if not(bChktodos) then
   begin
      VerificaTodos;
   end;

end;

procedure TfPermRel.VerificaTodos;
var
I : Integer;
J : Integer;
Component : TObject;
bChkTodos : Boolean;
begin
  bChkTodos := true;
  for I := sbxPermissoes.ComponentCount - 2 downto 0 do
  begin
     for J := sbxPermissoes.Components[I].ComponentCount - 1 downto 0 do
     begin
        begin
            Component := sbxPermissoes.Components[I].Components[J];
            if Component is TCheckBox then
            begin
               bChkTodos := TCheckBox(Component).Checked and bChkTodos;
            end;
         end;
      end;
   end;
   bCheckItem := true;
   ChkTodos.Checked := bChkTodos;
   bCheckItem := false;
end;

procedure TfPermRel.CheckTodos(Sender : TObject);
var
I : Integer;
J : Integer;
Component : TObject;
begin
   bChecaVisual := False or bCheckItem;
   bChktodos := true;
   if not(bChecaVisual)then
   begin
      if TCheckBox(Sender).Checked = true then
      begin
         for I := sbxPermissoes.ComponentCount - 2  downto 0 do
         begin
            for J := sbxPermissoes.Components[I].ComponentCount - 1 downto 0 do
            begin
               Component := sbxPermissoes.Components[I].Components[J];
               if Component is TCheckBox then
               begin
                  TCheckBox(Component).Checked := true
               end;
            end;
         end;
      end
      else
      begin
         for I := sbxPermissoes.ComponentCount - 2 downto 0 do
         begin
            for J := sbxPermissoes.Components[I].ComponentCount - 1 downto 0 do
            begin
               Component := sbxPermissoes.Components[I].Components[J];
               if Component is TCheckBox then
               begin
                  TCheckBox(Component).Checked := False;
               end;
            end;
         end;
      end;
   end;
   bChktodos := False;

end;


procedure TfPermRel.ShowPermissions;
var
   bevel    : TBevel;
   panel    : TPanel;
begin
   qryPermissoes.Close;
   qryPermissoes.ParamByName('CD_MODULO').AsInteger :=
      qryModulosCD_MODULO.AsInteger;
   qryPermissoes.ParamByName('CD_GRUPO').AsInteger := FCodGrupo;
   qryPermissoes.Open;
   qryPermissoes.Last;
   while not qryPermissoes.Bof do
   begin
      CreateNewPanel(
         qryPermissoesCD_ACAO.AsInteger,
         FCodGrupo, qryPermissoesDS_GRUPO.AsString,
         1 and qryPermissoesNR_PERMISSAO.AsInteger = 1);
      qryPermissoes.Prior;
   end;
    //cria o marcar todos
   panel := TPanel.Create(sbxPermissoes);
   with panel do
   begin
      Parent := sbxPermissoes;
      Align := alTop;
      BevelOuter := bvNone;
      Padding.Left := 5;
      Height := 28;

      Bevel := TBevel.Create(sbxPermissoes);
      Bevel.Parent := panel;
      Bevel.Align := alBottom;
      Bevel.Shape := bsBottomLine;
      Bevel.Height := 2;

      ChkTodos := TCheckBox.Create(Bevel);
      ChkTodos.Name := 'ChkTodos';
      ChkTodos.Caption :='Marcar todos';
      ChkTodos.Parent := panel;
      ChkTodos.Align := alClient;
      ChkTodos.Checked := false;
      ChkTodos.OnClick := CheckTodos;
   end;
   //fim cria marcartodos
end;

procedure TfPermRel.sbSelGrupoClick(Sender: TObject);
begin
   if fSelGrupos = nil then
      Application.CreateForm(TfSelGrupos, fSelGrupos);
   fSelGrupos.Filtrar(true);
   fSelGrupos.ShowModal;
   if fSelGrupos.getFflgResult then
   begin
      ledGrupo.Text := fSelGrupos.getNomeSelecionado;
      FCodGrupo := fSelGrupos.getCodSelecionado;
      sbxPermissoes.Visible := False;
      LockWindowUpdate(sbxPermissoes.Handle);
      DestroyPermissions;
      ShowPermissions;
      LockWindowUpdate(0);
      VerificaTodos;
      sbxPermissoes.Visible := True;
   end;
end;

end.
