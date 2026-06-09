unit uSelecionarLayout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, CheckLst, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uDm ,
  Buttons, DBCtrls, ZConnection, Menus,  ZDataset, DBTables, Provider,
  ZSqlUpdate, UMDateTimePicker, ImgList;

type
  TfrmSelecionarLayout = class(TForm)
    pnSelecionarLayout: TPanel;
    pnPrincipal: TPanel;
    clbLayouts: TCheckListBox;
    qyListaLayout: TUMZQuery;
    toolPessoa: TToolBar;
    btIncluir: TToolButton;
    btFechar: TToolButton;
    ImageList2: TImageList;
    ToolButton1: TToolButton;
    Label1: TLabel;
    procedure btIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     sn_marcados : Boolean;
     layout_multiplo : String;
     cd_layout_multiplo : integer;
  end;

var
  frmSelecionarLayout: TfrmSelecionarLayout;

implementation

uses
   General, uItemCombo, uRemessa;

{$R *.dfm}

procedure TfrmSelecionarLayout.btFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmSelecionarLayout.btIncluirClick(Sender: TObject);
var
   i : integer;
   primeiro_checado : Boolean;
begin
   primeiro_checado:= False;

   // concatena as opções marcadas
   for i := 0 to clbLayouts.Items.Count-1 do
   begin
      if ( clbLayouts.Checked[i] ) then
      begin
         if (primeiro_checado = false) then
         begin
            primeiro_checado := true;
         end
         else
         begin
            layout_multiplo := layout_multiplo + ',';
         end;
         cd_layout_multiplo := StrToInt(TItemCombo(clbLayouts.Items.Objects[i]).getCodigo());

         layout_multiplo := ( layout_multiplo + IntToStr(cd_layout_multiplo) );
      end;
   end;

   ModalResult := mrOk;
end;


procedure TfrmSelecionarLayout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2  : btIncluirClick( nil );
    VK_F12 : Self.Close;
  end;

end;

procedure TfrmSelecionarLayout.FormShow(Sender: TObject);
var
   i, j : integer;
   bEncontrou: Boolean;
   arrLayoutsSelecionados: TStringList;
begin
   // Lista dos layouts
   qyListaLayout.Close;
   qyListaLayout.ParamByName('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyListaLayout.Open;
   
   sn_marcados := False;
   i := 0;
   arrLayoutsSelecionados := explode(frmRemessa.cd_layout, ',');

   while NOT ( qyListaLayout.Eof ) do
   begin
     i := clbLayouts.Items.AddObject(
         qyListaLayout.FieldByName('nm_layout').AsString ,
         TItemCombo.Create(
            qyListaLayout.FieldByName('cd_layout').AsString,
            qyListaLayout.FieldByName('nm_layout').AsString
         )
      );
      
      clbLayouts.Checked[i] := False;

      bEncontrou := false;
      for j := 0 to arrLayoutsSelecionados.Count - 1 do
      begin
         if qyListaLayout.FieldByName('cd_layout').AsString = arrLayoutsSelecionados[j] then
         begin
            bEncontrou := true;
            break;
         end;
      end;

      if bEncontrou then
      begin
         clbLayouts.Checked[i] := True;
      end;
      
      qyListaLayout.Next;
   end;
end;


procedure TfrmSelecionarLayout.ToolButton1Click(Sender: TObject);
var
   i : integer;
begin
   if NOT ( sn_marcados ) then
   begin
      for i:= 0 to clbLayouts.Items.Count-1 do
      begin
         clbLayouts.Checked[i] := True;
      end;
      sn_marcados := True;
   end else
   begin
      for i:= 0 to clbLayouts.Items.Count-1 do
      begin
         clbLayouts.Checked[i] := False;
      end;
      sn_marcados := False;   
   end;
end;

end.
