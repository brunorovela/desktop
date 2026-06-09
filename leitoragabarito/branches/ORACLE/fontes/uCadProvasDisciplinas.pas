unit uCadProvasDisciplinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls, Buttons;

type
  TfrmCadProvasDisciplinas = class(TForm)
    Bevel1: TBevel;
    sbSalvarFechar: TSpeedButton;
    btnFechar: TSpeedButton;
    edDisciplina: TEdit;
    Label1: TLabel;
    sbSalvar: TSpeedButton;
    Bevel2: TBevel;
    grd: TDBGrid;
    qyDisciplinas: TUMZQuery;
    srcDisciplinas: TDataSource;
    Label3: TLabel;
    qyDisciplinascd_disciplina: TIntegerField;
    qyDisciplinasds_disciplina: TStringField;
    qyDisciplinascd_curso: TStringField;
    procedure grdDblClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure edDisciplinaKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSalvarFecharClick(Sender: TObject);

  private
    { Private declarations }

    procedure Filtra();
    procedure Salvar();
    procedure Fechar();
  public
    flgSearch : Boolean;
    cd_prova : integer;
    { Public declarations }
  end;

var
  frmCadProvasDisciplinas: TfrmCadProvasDisciplinas;

implementation

uses Main, uDM, uCadProvas;

{$R *.DFM}

procedure TfrmCadProvasDisciplinas.btnFecharClick(Sender: TObject);
begin
  Fechar();
end;

procedure TfrmCadProvasDisciplinas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmCadProvasDisciplinas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
end;

procedure TfrmCadProvasDisciplinas.sbSalvarFecharClick(Sender: TObject);
begin
   Salvar();
   Fechar();
end;

procedure TfrmCadProvasDisciplinas.edDisciplinaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if Key = #13 then begin
      Filtra();
   end;

end;

procedure TfrmCadProvasDisciplinas.Filtra();
begin

   with qyDisciplinas do begin
      Close();
      ParamByName('ds_disciplina').AsString := '%'+edDisciplina.Text+'%';
      Open();
   end;

end;

procedure TfrmCadProvasDisciplinas.Salvar();
var
   iNumero : integer;
   sNumero : string;
begin

   with grd.SelectedRows do begin

      if Count < 1 then begin
         Mensagem( 'Selecione pelo menos uma disciplina.', Application.Title, MB_OK + MB_ICONINFORMATION );
         Abort();
      end;

      with DM.qyAux do begin
         SQL.Text := '' +
            'INSERT INTO leitora_provas_disciplinas ( ' +
            '   cd_prova, ' +
            '   cd_curso, ' +
            '   cd_disciplina ' +
            ') VALUES ';
      end;

      if Count = 1 then begin

         with DM.qyAux2 do begin
            Close();
            SQL.Text := 'SELECT d.codigo, d.curso, d.descricao FROM leitora_provas_disciplinas pd INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) WHERE pd.cd_prova = :cd_prova AND pd.cd_curso = :cd_curso AND pd.cd_disciplina = :cd_disciplina';
            ParamByName('cd_prova').AsInteger := cd_prova;
            ParamByName('cd_curso').AsString := qyDisciplinas.FieldByName('cd_curso').AsString;
            ParamByName('cd_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
            Open();
         end;

         if not DM.qyAux2.Eof then begin
            Mensagem( 'A disciplina '+DM.qyAux2.FieldByName('descricao').AsString+' do curso '+DM.qyAux2.FieldByName('curso').AsString+' já está cadastrada.'+chr(13)+'Portanto não será cadastrada novamente.', Application.Title, MB_OK + MB_ICONINFORMATION );
         end
         else begin
            with DM.qyAux do begin
               SQL.Add('(:cd_prova,:cd_curso,:cd_disciplina)');
               ParamByName('cd_prova').AsInteger := cd_prova;
               ParamByName('cd_curso').AsString := qyDisciplinas.FieldByName('cd_curso').AsString;
               ParamByName('cd_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
               ExecSQL();
            end;
         end;

      end
      else begin
         for iNumero:= 0 to Count - 1 do begin
            sNumero := IntToStr(iNumero);
            grd.DataSource.DataSet.GotoBookmark(Pointer(Items[iNumero]));

            with DM.qyAux2 do begin
               Close();
               SQL.Text := 'SELECT d.codigo, d.curso, d.descricao FROM leitora_provas_disciplinas pd INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) WHERE pd.cd_prova = :cd_prova AND pd.cd_curso = :cd_curso AND pd.cd_disciplina = :cd_disciplina';
               ParamByName('cd_prova').AsInteger := cd_prova;
               ParamByName('cd_curso').AsString := qyDisciplinas.FieldByName('cd_curso').AsString;
               ParamByName('cd_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
               Open();
            end;

            if not DM.qyAux2.Eof then begin
               Mensagem( 'A disciplina '+DM.qyAux2.FieldByName('descricao').AsString+' do curso '+DM.qyAux2.FieldByName('curso').AsString+' já está cadastrada.'+chr(13)+'Portanto não será cadastrada novamente.', Application.Title, MB_OK + MB_ICONINFORMATION );
            end
            else begin
               with DM.qyAux do begin
                  if SQL.Count >= 2 then begin
                     SQL.Add(',');
                  end;
                  SQL.Add('(:cd_prova'+sNumero+',:cd_curso'+sNumero+',:cd_disciplina'+sNumero+')');
                  ParamByName('cd_prova'+sNumero).AsInteger := cd_prova;
                  ParamByName('cd_curso'+sNumero).AsString := qyDisciplinas.FieldByName('cd_curso').AsString;
                  ParamByName('cd_disciplina'+sNumero).AsInteger := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
               end;
            end;

         end;
         DM.qyAux.ExecSQL();
      end;

   end;

   frmCadProvas.qyDisciplinas.Close();
   frmCadProvas.qyDisciplinas.Open();

end;

procedure TfrmCadProvasDisciplinas.Fechar();
begin
  flgSearch := True;
  Close;
end;

procedure TfrmCadProvasDisciplinas.sbSalvarClick(Sender: TObject);
begin
   Salvar();
end;

procedure TfrmCadProvasDisciplinas.grdDblClick(Sender: TObject);
begin
  Salvar();
end;

end.
