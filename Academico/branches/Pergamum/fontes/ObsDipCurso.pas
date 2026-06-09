unit ObsDipCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZConnection, Db, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, Mask,
  Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ZSqlUpdate;

type
  TfmObsDipCurso = class(TForm)
    mmobs: TDBMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    dsHist: TDataSource;
    quHist: TUMZQuery;
    usHist: TZUpdateSQL;
    qucurso: TUMZQuery;
    DataSource2: TDataSource;
    Panel2: TPanel;
    Label9: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    DBText2: TDBText;
    Bevel1: TBevel;
    Panel3: TPanel;
    Bevel2: TBevel;
    btnCurso: TSpeedButton;
    txtCurso: TEdit;
    lblCurso: TLabel;
    quHistcurso: TStringField;
    quHistanosemestre: TSmallintField;
    quHistobs: TMemoField;
    qucursodescricao: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quHistBeforePost(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure eecursoExit(Sender: TObject);
    procedure eecursoKeyPress(Sender: TObject; var Key: Char);
    procedure eecursoEllipsisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure btnCursoClick(Sender: TObject);
  private
    wpcol  : tstringlist; //colunas a ser passadas
    procedure Inicia;
    procedure apertoubotao;
  public
    { Public declarations }
  end;

var
  fmObsDipCurso: TfmObsDipCurso;

implementation

uses udm,tabbusca, Main, uFSelecionarCurso, uUMNucleo;
{$R *.DFM}

procedure TfmObsDipCurso.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfmObsDipCurso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if quHist.active then begin
     Mensagem('A operação ainda está pendente finalize-a!');
     abort;
  end;
  if quCurso.Active then quCurso.close;
  wpcol.Free;
  wpcol := nil;
  fmtabbusca.free;
  fmtabbusca := nil;

end;

procedure TfmObsDipCurso.quHistBeforePost(DataSet: TDataSet);
begin
  if (txtcurso.Text = '') or (txtAnoSemestre.Text = '') then begin
     Mensagem('O curso deve ser preenchido!');
     abort;
  end;
  if (quhist.FieldByName('anosemestre').asstring = '') or
     (quhist.FieldByName('curso').asstring       = '')  then begin
     quhist.FieldByName('anosemestre').asinteger := strtoint(txtAnoSemestre.Text);
     quhist.FieldByName('curso').asstring       := txtcurso.text;
  end;   
end;

procedure TfmObsDipCurso.Button3Click(Sender: TObject);
begin
TRY
  if quHist.active then begin
     if quHist.state in [dsinsert,dsedit] then
        quHist.Post;
     quHist.close;
     qucurso.close;
  end;
FINALLY
  ApertouBotao;
END;
txtcurso.SetFocus;
txtcurso.text := '';
end;

procedure TfmObsDipCurso.Button4Click(Sender: TObject);
begin
try
  if quHist.active then begin
     if quHist.state in [dsinsert,dsedit] then
        quHist.Cancel;
     quHist.close;
     qucurso.close;
  end;
finally
  ApertouBotao;
end;
txtcurso.SetFocus;
txtcurso.text := '';
end;

procedure TfmObsDipCurso.eecursoExit(Sender: TObject);
begin
  if (txtcurso.Text <> '') and  (qucurso.active = False) then begin
     qucurso.ParamByName('codigo').asstring := txtcurso.Text;
     qucurso.active := True;
     if qucurso.FieldByName('descricao').asstring  = '' then  begin
	Mensagem('Curso não encontrado!');
	qucurso.close;
	abort;
     end;
  end;
  Inicia;
end;

procedure TfmObsDipCurso.eecursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     eecursoEllipsisClick(nil);
end;

procedure TfmObsDipCurso.eecursoEllipsisClick(Sender: TObject);
begin
   if fmtabbusca = nil then
      Application.CreateForm( Tfmtabbusca, fmtabbusca );

  wpcol.clear;
  wpcol.Add('Ano/Semestre');
  wpcol.Add('Código');
  wpcol.Add('Descrição');
  if txtcurso.text <> '' then
     fmtabbusca.mostra('SELECT ANOSEMESTRE,CODIGO,DESCRICAO  FROM CURSOS ',
                        'WHERE DESCRICAO LIKE '''+txtcurso.text+'''',
			'',
                         wpcol,DM.db.database,464)
  else
     fmtabbusca.mostra('SELECT ANOSEMESTRE,CODIGO,DESCRICAO  FROM CURSOS ',
                        '','',wpcol,DM.db.database,464);
  if (fmtabbusca.wpprimeiro <> '') then begin
     txtcurso.text       := fmtabbusca.wpprimeiro;
  end;
end;

procedure TfmObsDipCurso.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   txtAnoSemestre.text := IntToStr(ano_semestre);

   // Bloquear Anosemestre
  txtAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre;
  Label9.Visible := txtAnoSemestre.Visible;
  UpDown2.Visible := txtAnoSemestre.Visible;
end;

procedure TfmObsDipCurso.Inicia;
begin
  if (txtcurso.Text <> '') and (not quhist.active)then begin
     try
       quhist.parambyname('anosemestre').asInteger := strtoint(txtAnoSemestre.Text);
       quhist.parambyname('curso').asstring   := txtcurso.Text;
       quhist.open;
     except
       raise;
     end;
     txtcurso.ReadOnly := True;
     UpDown2.enabled  := False;
     txtAnoSemestre.ReadOnly := True;
  end;
end;
procedure TfmObsDipCurso.ApertouBotao;
begin
 txtcurso.ReadOnly := False;
 UpDown2.enabled  := True;
 txtAnoSemestre.ReadOnly := False;
end;

procedure TfmObsDipCurso.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;
end;


procedure TfmObsDipCurso.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestre.Text := IntToStr( resultado_filtro.nr_anosemestre );

      if (txtcurso.Text <> '') and  (qucurso.active = False) then
      begin
      	qucurso.ParamByName('codigo').asstring := txtcurso.Text;
      	qucurso.active := True;
      	if  qucurso.FieldByName('descricao').asstring  = '' then
         begin
      	   Mensagem('Curso não encontrado!');
      	   qucurso.close;
       	   abort;
         end;
      end;
      Inicia;
   end;
end;

end.

