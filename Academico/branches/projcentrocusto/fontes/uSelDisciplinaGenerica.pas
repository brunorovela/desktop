unit uSelDisciplinaGenerica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, General, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  DB, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfrmSelDisciplinaGenerica = class(TForm)
    pnTitulo: TPanel;
    ilAcoes: TImageList;
    tbAcoes: TToolBar;
    btCancelar: TToolButton;
    tbSeparador2: TToolButton;
    btSelecionar: TToolButton;
    tbSeparador1: TToolButton;
    pnInformacoes: TPanel;
    lbInformacoes: TLabel;
    ilDisciplinas: TImageList;
    grDisciplinasGenericas: TDBGrid;
    qyDisciplinasGenericas: TUMZQuery;
    dsDisciplinasGenericas: TDataSource;
    qyDisciplinasGenericasnr_serie: TIntegerField;
    qyDisciplinasGenericasds_disciplina_generica: TStringField;
    qyDisciplinasGenericascd_disciplina_generica: TIntegerField;
    qyDisciplinasGenericasds_vinculo: TStringField;
    qyDisciplinasGenericascd_disciplina_optativa: TIntegerField;
    lbLegendaOptativa: TLabel;
    lbDiscOptativa: TLabel;
    procedure btCancelarClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure grDisciplinasGenericasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    procedure Filtrar;
    { Private declarations }
  public
    { Public declarations }
    iCodigoAluno : Integer;
    iAnoSemestre : Integer;
    sTurma : String;
    procedure SetDisciplinaOptativa(iDisciplinaOptativa: Integer; sDisciplinaOptativa: String);    
  end;

var
  frmSelDisciplinaGenerica: TfrmSelDisciplinaGenerica;

implementation

{$R *.dfm}

procedure TfrmSelDisciplinaGenerica.FormShow(Sender: TObject);
begin
   grDisciplinasGenericas.SelectedRows.Clear;

   Filtrar;
end;

procedure TfrmSelDisciplinaGenerica.grDisciplinasGenericasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   sChave: string;
   slDados: TStringList;
   i, bmpX, bmpY, imgIndex: Integer;
   oBitmap: TBitmap;
   fixRect : TRect;
   Bimg: Boolean;
begin

   Bimg := False;

   fixRect := Rect;
   if grDisciplinasGenericas.SelectedRows.CurrentRowSelected then begin
      grDisciplinasGenericas.Canvas.Font.Color:= clWhite;
      grDisciplinasGenericas.Canvas.Brush.Color := clNavy;
      grDisciplinasGenericas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;
   imgIndex := 0;

   // Disciplina genérica esta vinculada a outra optativa
   if (qyDisciplinasGenericas.FieldByName('cd_disciplina_optativa').AsInteger > 0) then
   begin
      grDisciplinasGenericas.Canvas.Font.Color:= clLtGray;
      grDisciplinasGenericas.Canvas.Brush.Color := clWhite;
      imgIndex := 1;
      Bimg := True;
   end;

   if ((Column.FieldName = '')) then  begin
      oBitmap := TBitmap.Create;
      try
         ilDisciplinas.GetBitmap(imgIndex, oBitmap);
         bmpX := (Rect.Left + (((Rect.Right - Rect.Left) - oBitmap.Width) div 2));
         bmpY := (Rect.Top + (((Rect.Bottom - Rect.Top) - oBitmap.Height) div 2));
         grDisciplinasGenericas.Canvas.Brush.Color := clWhite;
         grDisciplinasGenericas.Canvas.Pen.Style := psClear;
         fixRect.Right := fixRect.Right + 1;
         fixRect.Bottom := fixRect.Bottom + 1;
         grDisciplinasGenericas.Canvas.Rectangle(fixRect);
         grDisciplinasGenericas.Canvas.Draw(bmpX, bmpY, oBitmap);
      finally
         oBitmap.Free;
      end;
      fixRect := Rect;
   end
   else
   begin
      grDisciplinasGenericas.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
   end;

end;

procedure TfrmSelDisciplinaGenerica.btCancelarClick(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.CloseModal;
end;

procedure TfrmSelDisciplinaGenerica.btSelecionarClick(Sender: TObject);
begin
   // Verifica se a disciplina selecionada está vinculada a outra optativa, nese caso não permite a seleção dessa disciplina
   if (qyDisciplinasGenericas.FieldByName('cd_disciplina_optativa').AsInteger > 0) then
   begin
      Mensagem( 'Não é possível selecionar essa disciplina, pois o aluno já possui outra optativa vinculada a ela, você deve primeiro desvincular a optativa dessa disciplina.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
   end;

   Self.ModalResult := mrOk;
   Self.CloseModal;
end;

procedure TfrmSelDisciplinaGenerica.Filtrar();
begin

   qyDisciplinasGenericas.Close;
   qyDisciplinasGenericas.ParamByName('codigoaluno').AsInteger := iCodigoAluno;
   qyDisciplinasGenericas.ParamByName('anosemestre').AsInteger := iAnoSemestre;
   qyDisciplinasGenericas.ParamByName('turma').AsString := sTurma;
   qyDisciplinasGenericas.Open;

end;

procedure TfrmSelDisciplinaGenerica.SetDisciplinaOptativa(iDisciplinaOptativa: Integer; sDisciplinaOptativa: String);
begin
   lbDiscOptativa.Caption := '['+IntToStr(iDisciplinaOptativa)+'] '+sDisciplinaOptativa;
end;

end.
