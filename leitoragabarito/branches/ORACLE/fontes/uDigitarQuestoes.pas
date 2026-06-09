unit uDigitarQuestoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, ImgList;

type
  TfrmDigitarQuestoes = class(TForm)
    btnFechar: TSpeedButton;
    qyRespostas: TUMZQuery;
    srcRespostas: TDataSource;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    lbNome: TLabel;
    procedure qyRespostasAfterEdit(DataSet: TDataSet);
    procedure qyRespostasNewRecord(DataSet: TDataSet);
    procedure qyRespostasBeforePost(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    slPesos: TStringList;
  public
    flgSearch : Boolean;
    cd_prova_aluno : integer;
    ds_nome_aluno : string;
    sQuestoes: string;
    sPesos: string;
    cValorAntigo: Currency;
    bPular: Boolean;
    { Public declarations }
  end;

var
  frmDigitarQuestoes: TfrmDigitarQuestoes;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmDigitarQuestoes.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmDigitarQuestoes.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmDigitarQuestoes.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmDigitarQuestoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmDigitarQuestoes.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmDigitarQuestoes.FormShow(Sender: TObject);
var
   slQuestoes: TStringList;
   slPesosTemp: TStringList;
   sSql: string;
   i: integer;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  lbNome.Caption := ds_nome_aluno;
  with qyRespostas do begin
     Close();
     slQuestoes := SplitStr(sQuestoes, ',');
     for i := 0 to slQuestoes.Count-1 do begin
        if Length(sSql) > 0 then begin
           sSql := sSql + ' OR ';
        end;
        sSql := sSql + ' nr_questao = '+trim(slQuestoes.Strings[i]);
     end;
     SQL.Text := StringReplace(SQL.Text, '$questoes$', sSql, []);

     ParamByName('cd_prova_aluno').AsInteger := cd_prova_aluno;
     Open();
  end;

  slPesosTemp := SplitStr(sPesos, ',');
  slPesos := TStringList.Create();
  for i := 0 to slPesosTemp.Count-1 do begin
     try
        slPesos.Add(slQuestoes.Strings[i]+'='+slPesosTemp.Strings[i]);
     except
        //continue;
     end;
  end;
end;

procedure TfrmDigitarQuestoes.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmDigitarQuestoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if qyRespostas.State in [dsEdit] then begin
     qyRespostas.Post();
  end;
end;

procedure TfrmDigitarQuestoes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      if qyRespostas.State in [dsEdit] then begin
         qyRespostas.Post();
         if bPular then begin
            qyRespostas.Next();
         end
         else begin
            qyRespostas.Edit();
         end;
      end;
   end;
end;

procedure TfrmDigitarQuestoes.qyRespostasAfterEdit(DataSet: TDataSet);
begin
   cValorAntigo := qyRespostas.FieldByName('db_pontuacao').AsCurrency;
end;

procedure TfrmDigitarQuestoes.qyRespostasBeforePost(DataSet: TDataSet);
begin
  bPular := true;
  if qyRespostas.FieldByName('db_pontuacao').AsCurrency > StrToCurr(slPesos.Values[qyRespostas.FieldByName('nr_questao').AsString]) then begin
     bPular := false;
     Mensagem('A pontuação do aluno deve ser menor ou igual ao peso da questão !', Application.Title, MB_OK+MB_ICONEXCLAMATION);
     qyRespostas.FieldByName('db_pontuacao').AsCurrency := cValorAntigo;
  end;
end;

procedure TfrmDigitarQuestoes.qyRespostasNewRecord(DataSet: TDataSet);
begin
   qyRespostas.Cancel();
end;

end.
