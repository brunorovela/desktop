unit uFListaDeCursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TformListagemDeCursos = class(TForm)
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lstAtuais: TCheckListBox;
    cbMarcar: TCheckBox;
    dsCursosNde: TDataSource;
    qryCursosNde: TUMZQuery;
    qryCursosNdecd_admissao: TIntegerField;
    qryCursosNdecd_curso: TStringField;
    lbPersonalizavel: TLabel;
    qryCursosNdesn_membro_nde: TSmallintField;
    qryCursosNdesn_coordenacao_nde: TSmallintField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbMarcarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure carregaCursos();
    { Private declarations }
  public
    cd_admisssao : integer;
    sn_coordenacao : integer;
    { Public declarations }
  end;

var
  formListagemDeCursos: TformListagemDeCursos;

implementation

uses uDM;

{$R *.dfm}

procedure TformListagemDeCursos.btnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TformListagemDeCursos.btnConfirmarClick(Sender: TObject);
const
   SQL_INSERE =
   'INSERT INTO funcionarios_cursos_nde VALUES (:admissao,:curso,:membro,:coord)';
   SQL_UPDATE_NDE =
   'UPDATE funcionarios_cursos_nde SET sn_membro_nde = :membro WHERE cd_admissao = :admissao AND cd_curso = :curso';
   SQL_UPDATE_COORD =
   'UPDATE funcionarios_cursos_nde SET sn_coordenacao_nde = :coord WHERE cd_admissao = :admissao AND cd_curso = :curso';
   SQL_SELECT_REGISTRO =
   'SELECT sn_membro_nde, sn_coordenacao_nde FROM funcionarios_cursos_nde WHERE cd_admissao = :admissao AND cd_curso = :curso';
var
   i:integer;
   lista: TStringList;
   qryFuncionario: TUMZQuery;
   cdCurso : string;
begin
   DM.CriarConsulta(qryFuncionario);

   for I := 0 to lstAtuais.Items.Count - 1 do
   begin
      With qryFuncionario do
      begin
         Close;
         SQL.Text := SQL_SELECT_REGISTRO;
         ParamByName('admissao').AsInteger := cd_admisssao;

         cdCurso := StringReplace(TStringList(lstAtuais.Items.Objects[i]).GetText,#$D#$A,'',[rfReplaceAll]);
         ParamByName('curso').AsString := cdCurso;
         Open;

         if (RecordCount = 0) then
         begin
            Close;
            SQL.Text := SQL_INSERE;
            ParamByName('admissao').AsInteger := cd_admisssao;
            ParamByName('curso').AsString := cdCurso;

            if((sn_coordenacao = 0) AND (lstAtuais.checked[i])) then
            begin
               ParamByName('membro').AsInteger := 1;
            end else begin
               ParamByName('membro').AsInteger := 0;
            end;

            if((sn_coordenacao = 1) AND (lstAtuais.checked[i])) then
            begin
               ParamByName('coord').AsInteger := 1;
            end else begin
               ParamByName('coord').AsInteger := 0;
            end;
            
            ExecSQL;
         end else
         begin
            Close;

            if (sn_coordenacao = 1) then
            begin
               SQL.Text := SQL_UPDATE_COORD;

               if(lstAtuais.checked[i]) then
               begin
                  ParamByName('coord').AsInteger := 1;
               end else begin
                  ParamByName('coord').AsInteger := 0;
               end;
            end else begin
               SQL.Text := SQL_UPDATE_NDE;

               if(lstAtuais.checked[i]) then
               begin
                  ParamByName('membro').AsInteger := 1;
               end else begin
                  ParamByName('membro').AsInteger := 0;
               end;
            end;

            ParamByName('admissao').AsInteger := cd_admisssao;
            ParamByName('curso').AsString := cdCurso;
            ExecSQL;
         end;
      end;
   end;

   qryFuncionario.Free;
   Close;
end;

procedure TformListagemDeCursos.carregaCursos;
const
   SQL_CURSOS =
   'Select cd_curso, ds_curso   from cursos_mestre';
var
  qryCarregaCursos : TUMZQuery;
  lista : TStringList;
begin
   DM.CriarConsulta(qryCarregaCursos);
   qryCarregaCursos.SQL.Text := SQL_CURSOS;
   qryCarregaCursos.Open;

   while not qryCarregaCursos.Eof do
   begin
      lista := TStringList.Create();
      lista.Add(qryCarregaCursos.FieldByName('cd_curso').AsString);

      lstAtuais.Items.AddObject(qryCarregaCursos.FieldByName('ds_curso').AsString,lista);

      qryCursosNde.Close;
      qryCursosNde.ParamByName('admissao').AsInteger := cd_admisssao;
      qryCursosNde.ParamByName('curso').AsString := qryCarregaCursos.FieldByName('cd_curso').AsString;
      qryCursosNde.Open;

      if(sn_coordenacao = 1) then
      begin
         if(qryCursosNdesn_coordenacao_nde.AsInteger = 1) then
         begin
            lstAtuais.checked[lstAtuais.Count -1] := true;
         end else begin
            lstAtuais.checked[lstAtuais.Count -1] := false;
         end;
      end else begin
         if(qryCursosNdesn_membro_nde.AsInteger = 1) then
         begin
            lstAtuais.checked[lstAtuais.Count -1] := true;
         end else begin
            lstAtuais.checked[lstAtuais.Count -1] := false;
         end;
      end;

      qryCarregaCursos.Next;
   end;

   qryCarregaCursos.Free;
   close;
end;

procedure TformListagemDeCursos.cbMarcarClick(Sender: TObject);
var
   i:integer;
begin
   for I := 0 to lstAtuais.Items.Count - 1 do
   begin
      lstAtuais.Checked[i] := (cbMarcar.Checked);
   end;
end;

procedure TformListagemDeCursos.FormShow(Sender: TObject);
begin
   carregaCursos();


   if(sn_coordenacao = 0) then
   begin
      lbPersonalizavel.Caption := ' membro NDE:';
   end;
end;

end.
