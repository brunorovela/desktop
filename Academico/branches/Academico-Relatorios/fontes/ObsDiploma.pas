unit ObsDiploma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZConnection, Db, StdCtrls, ExtCtrls, DBCtrls, EllipseEdit, Buttons,
  wwDialog, wwidlg;

type
  TfmObsDiploma = class(TForm)
    mmobs: TDBMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    dsHist: TDataSource;
    quHist: TUMZQuery;
    usHist: TZUpdateSQL;
    qucurso: TUMZQuery;
    qucursodescricao: TStringField;
    DataSource2: TDataSource;
    quHistCURSO: TStringField;
    quHistOBS: TMemoField;
    Panel2: TPanel;
    DBText2: TDBText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel3: TPanel;
    LookupCursos: TwwLookupDialog;
    btnCurso: TSpeedButton;
    txtCurso: TEdit;
    lblCurso: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quHistBeforePost(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure eealunoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure txtCursoExit(Sender: TObject);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
  private
    wpcol  : tstringlist; //colunas a ser passadas
    procedure Inicia;
    procedure apertoubotao;
  public
    { Public declarations }
  end;

var
  fmObsDiploma: TfmObsDiploma;

implementation
uses udm,tabbusca;
{$R *.DFM}

procedure TfmObsDiploma.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfmObsDiploma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if quHist.active then begin
     showmessage('A operação ainda está pendente finalize-a!');
     abort;
  end;
  if quCurso.Active then quCurso.close;
  wpcol.Free;
  wpcol := nil;
  fmtabbusca.free;
  fmtabbusca := nil;

end;

procedure TfmObsDiploma.quHistBeforePost(DataSet: TDataSet);
begin
  if (txtcurso.Text = '') then begin
     showmessage('O curso deve ser preenchidos!');
     abort;
  end;
  if (quhist.FieldByName('curso').asstring       = '')  then
     quhist.FieldByName('curso').asstring       := txtcurso.text;

end;

procedure TfmObsDiploma.Button3Click(Sender: TObject);
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

procedure TfmObsDiploma.Button4Click(Sender: TObject);
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

procedure TfmObsDiploma.eealunoChange(Sender: TObject);
begin
  if quhist.active then
     abort;

end;

procedure TfmObsDiploma.FormShow(Sender: TObject);
begin
  if fmtabbusca = nil then
     Application.CreateForm( Tfmtabbusca, fmtabbusca );
  wpcol := tstringlist.create;
end;
procedure TfmObsDiploma.Inicia;
begin
  if (txtcurso.Text <> '') and (not quhist.active)then begin
     try
       quhist.parambyname('curso').asstring   := txtcurso.Text;
       quhist.open;
     except
       raise;
     end;
     txtcurso.ReadOnly := True;
  end;
end;
procedure TfmObsDiploma.ApertouBotao;
begin
 txtcurso.ReadOnly := False;
end;


procedure TfmObsDiploma.btnCursoClick(Sender: TObject);
begin
  { Pesquisar Cursos }
  DM.tblCursos.Close;
  DM.tblCursos.SQL.Clear;
  DM.tblCursos.SQL.Add( 'select DISTINCT Codigo, Descricao from Cursos ' );
  DM.tblCursos.SQL.Add( 'order by Codigo ASC' );
  DM.tblCursos.Prepare;
  DM.tblCursos.Open;

  if LookupCursos.Execute then
  begin
  
    txtCurso.Text := DM.tblCursosCodigo.AsString;

    if (txtcurso.Text <> '') and  (qucurso.active = False) then begin
       qucurso.ParamByName('codigo').asstring := txtcurso.Text;
       qucurso.active := True;
       if qucurso.FieldByName('descricao').asstring  = '' then  begin
	  showmessage('Curso não encontrado!');
	  qucurso.close;
	  txtcurso.Text := '';
	  abort;
       end;
    end;

    Inicia;
  end;

end;

procedure TfmObsDiploma.txtCursoExit(Sender: TObject);
begin
  if (txtcurso.Text <> '') and  (qucurso.active = False) then begin
     qucurso.ParamByName('codigo').asstring := txtcurso.Text;
     qucurso.active := True;
     if qucurso.FieldByName('descricao').asstring  = '' then  begin
	showmessage('Curso não encontrado!');
	qucurso.close;
	txtcurso.Text := '';
	abort;
     end;
  end;

 Inicia;

end;

procedure TfmObsDiploma.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 Then
   Begin
     if (txtcurso.Text <> '') and  (qucurso.active = False) then begin
	qucurso.ParamByName('codigo').asstring := txtcurso.Text;
	qucurso.active := True;
	if qucurso.FieldByName('descricao').asstring  = '' then  begin
	   showmessage('Curso não encontrado!');
	   qucurso.close;
	   txtcurso.Text := '';
	   abort;
	end;
     end;

     Inicia;

   End;
end;

end.

