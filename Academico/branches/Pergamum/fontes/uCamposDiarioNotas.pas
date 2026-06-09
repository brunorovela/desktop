unit uCamposDiarioNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UMGrid,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmCamposDiarioNotas = class(TForm)
    Panel3: TPanel;
    Bevel4: TBevel;
    lbDisponiveis: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    lbUtilizadas: TListBox;
    btInsereUm: TSpeedButton;
    btRemoveUm: TSpeedButton;
    btInsereTodos: TSpeedButton;
    btRemoveTodos: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbGravarPadrao: TCheckBox;
    sbParaCima: TSpeedButton;
    sbParaBaixo: TSpeedButton;
    procedure sbParaBaixoClick(Sender: TObject);
    procedure sbParaCimaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btRemoveTodosClick(Sender: TObject);
    procedure btInsereTodosClick(Sender: TObject);
    procedure btRemoveUmClick(Sender: TObject);
    procedure btInsereUmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    Function SelecionaColunas( grd : TUMGrid; ParametroColunasAtuais : String ) : String;
  end;

var
  frmCamposDiarioNotas: TfrmCamposDiarioNotas;

implementation

uses uDM;

{$R *.dfm}

{ TfrmSelColunas }

function TfrmCamposDiarioNotas.SelecionaColunas(grd: TUMGrid; ParametroColunasAtuais: String): String;
var
  n : Integer;
  lstUtilizados : TStringList;
  lstCampos : TStringList;
  sCampos, sOp: String;
begin

   lstUtilizados := TStringList.Create;
   lstCampos := TStringList.Create;

   SplitString(DM.variavel_parametro(ParametroColunasAtuais), ';', lstUtilizados);

   lbDisponiveis.Items.Clear;
   lbUtilizadas.Items.Clear;

   For n := 0 to lstUtilizados.Count - 1 do begin
      try
         if lstUtilizados.Strings[n] <> '' then
         begin
            lbUtilizadas.Items.Add(grd.DataSource.DataSet.FieldByName(lstUtilizados.Strings[n]).DisplayLabel);
         end
      except
      end;
   end;

   For n := 0 TO grd.DataSource.DataSet.FieldCount - 1 do begin

      if grd.ListaCampos.Campo[ grd.DataSource.DataSet.Fields[n].FieldName ].Tag = 1 then begin

        lstCampos.Add(grd.DataSource.DataSet.Fields[n].DisplayLabel + '=' + grd.DataSource.DataSet.Fields[n].FieldName);

        if lstUtilizados.IndexOf(grd.DataSource.DataSet.Fields[n].FieldName) < 0 then begin
           lbDisponiveis.Items.Add(grd.DataSource.DataSet.Fields[n].DisplayLabel);
        end;

      end;

   end;

   if ShowModal() = mrAll then begin

      For n := 0 TO grd.DataSource.DataSet.FieldCount - 1 do begin
         if grd.ListaCampos.Campo[ grd.DataSource.DataSet.Fields[n].FieldName ].Tag = 1 then begin
            grd.ListaCampos.Campo[ grd.DataSource.DataSet.Fields[n].FieldName ].SetVisivel(False);
         end;
      end;

      For n := 0 To lbUtilizadas.Items.Count - 1 do begin
         sCampos := sCampos + lstCampos.Values[lbUtilizadas.Items.Strings[n]] + ';';
         grd.ListaCampos.Campo[ lstCampos.Values[lbUtilizadas.Items.Strings[n]] ].SetVisivel(True);
      end;

      sCampos := Copy(sCampos, 1, Length(sCampos)-1);

      if cbGravarPadrao.Checked then
         DM.set_variavel_parametro(ParametroColunasAtuais, sCampos);

      //DM.MontarPlanilha(grd, sCampos);
      //Grade: TDBGrid; Campos: String
        {
      lstCampos := TStringList.Create;

      SplitString(sCampos, ';', lstCampos);

      // Se não tiver campos, manter o que foi configurado visualmente...
      if lstCampos.Count = 0 then Exit;

      For n := 0 To lstCampos.Count -1 do begin
         grd.ListaCampos.Campo[ lstCampos[n] ].SetVisivel(True);
      End;
         }
      //grd.Refresh;
      grd.CarregarRegistros;
      grd.Repaint;
      grd.Refresh;


   end;

end;

procedure TfrmCamposDiarioNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCamposDiarioNotas.sbParaBaixoClick(Sender: TObject);
Var
  iAtual : Integer;
begin
  iAtual := lbUtilizadas.ItemIndex;
  if iAtual < lbUtilizadas.Count -1 then begin
     lbUtilizadas.Items.Move(iAtual, iAtual +1) ;
     lbUtilizadas.Selected[iAtual + 1] := true;
  end;
end;

procedure TfrmCamposDiarioNotas.sbParaCimaClick(Sender: TObject);
Var
  iAtual : Integer;
begin
  iAtual := lbUtilizadas.ItemIndex;
  if iAtual > 0 then begin
     lbUtilizadas.Items.Move(iAtual, iAtual -1) ;
     lbUtilizadas.Selected[iAtual - 1] := true;
  end;
end;

procedure TfrmCamposDiarioNotas.btInsereUmClick(Sender: TObject);
begin

   if lbDisponiveis.ItemIndex >= 0 then begin
     lbUtilizadas.Items.Add(lbDisponiveis.Items.Strings[lbDisponiveis.ItemIndex]);
     lbDisponiveis.DeleteSelected;
   end

end;

procedure TfrmCamposDiarioNotas.btRemoveUmClick(Sender: TObject);
begin

   if lbUtilizadas.ItemIndex >= 0 then begin
     lbDisponiveis.Items.Add(lbUtilizadas.Items.Strings[lbUtilizadas.ItemIndex]);
     lbUtilizadas.DeleteSelected;
   end;

end;

procedure TfrmCamposDiarioNotas.btInsereTodosClick(Sender: TObject);
begin

   lbUtilizadas.Items.AddStrings(lbDisponiveis.Items);
   lbDisponiveis.Items.Clear;

end;

procedure TfrmCamposDiarioNotas.btRemoveTodosClick(Sender: TObject);
begin

   lbDisponiveis.Items.AddStrings(lbUtilizadas.Items);
   lbUtilizadas.Items.Clear;

end;

procedure TfrmCamposDiarioNotas.BitBtn2Click(Sender: TObject);
begin
   ModalResult := mrAll;
   CloseModal();
end;

end.

