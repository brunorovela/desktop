unit uFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, ImgList, ExtCtrls;

type
  TfFechamento = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    ImageList2: TImageList;
    Bevel1: TBevel;
    clbTurmas: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnNenhuma: TBitBtn;
    btnTodas: TBitBtn;
    Label3: TLabel;
    lblData: TLabel;
    Panel1: TPanel;
    btnContinuar: TBitBtn;
    btnIgnorar: TBitBtn;
    tmpTurma: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmpTurmaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnIgnorarClick(Sender: TObject);
    procedure btnNenhumaClick(Sender: TObject);
    procedure btnTodasClick(Sender: TObject);
  private
    { Private declarations }
    dtFechamento: TDateTime;
    procedure carregaGradeTurmas();
  public
    { Public declarations }
    procedure setDataFechamento(dtData: TDateTime);
    function getDataFechamento(): TDateTime;

    function getListaTurmas(): TStringList;
    function TurmaSelecionada(): Boolean;
    function iniciaFechamento(dtData: TDateTime = 0): Integer;
  end;

var
  fFechamento: TfFechamento;

implementation

{$R *.dfm}

uses
   uDM, Main, DB;

{ TfFechamento }

procedure TfFechamento.setDataFechamento(dtData: TDateTime);
begin
   Self.dtFechamento := dtData;
end;

procedure TfFechamento.tmpTurmaTimer(Sender: TObject);
begin
  btnContinuar.Enabled := TurmaSelecionada;
end;

function TfFechamento.TurmaSelecionada: Boolean;
var
  i       : integer;
  bAtivo  : boolean;
begin
  bAtivo := false;

  //Verifica se existe alguma tuma no listbox
  if (clbTurmas.items.count > 0) then
  begin
    //Se existe turmas no listbox percorre a lista até o final
    for i := 0 to clbTurmas.Items.Count-1 do
    begin
      //Se encontrar alguma turma selecionada ativa o botão continuar e encerra a busca.
      if (clbTurmas.Checked[i]) then
      begin
        bAtivo := true;
        break;
      end;
    end;
  end
  else
  begin
    //Se não existe turma no listbox não há necessitade de deixar o timer ativo.
    tmpTurma.Enabled := false;
  end;

  TurmaSelecionada := bAtivo;
end;

function TfFechamento.getListaTurmas: TStringList;
var
   i: Integer;
begin
   Result := TStringList.Create();

   for i := 0 to (clbTurmas.Items.Count -1) do begin
      if (clbTurmas.Checked[i] = True) then begin
         Result.AddObject(IntToStr(i), clbTurmas.Items.Objects[i]);
      end;
   end;
end;

function TfFechamento.getDataFechamento: TDateTime;
begin
   Result := Self.dtFechamento;
end;

function TfFechamento.iniciaFechamento(dtData: TDateTime): Integer;
begin
   if (dtData <> 0) then begin
      Self.setDataFechamento(dtData);
   end;
   lblData.Caption := FormatDateTime('dd/mm/yyyy', Self.dtFechamento);
   lblData.Caption := lblData.Caption + ' (' + LongDayNames[DayOfWeek(dtFechamento)] + ')';
   carregaGradeTurmas();

   Result := Self.ShowModal;
end;

procedure TfFechamento.carregaGradeTurmas();
var
   sAux: string;
   slDados: TStringList;
begin
   with DM.qyTerminal2 do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT                                                                            ');
      SQL.Add('	 m.curso, m.turma, m.anosemestre, CAST(SUM(IF(ISNULL(dta.cd_pessoa),0, 1)) AS SIGNED) as conta   ');
      SQL.Add('FROM                                                                              ');
      SQL.Add('  matriculas m                                                                    ');
      SQL.Add('  INNER JOIN turmas t ON (m.anosemestre = t.anosemestre) AND (m.turma = t.codigo) ');
      SQL.Add('	 INNER JOIN cursos_coligadas c ON (t.curso = c.CD_CURSO) AND (c.CD_COLIGADA = t.cd_coligada) ');
      SQL.Add('	 LEFT OUTER JOIN diario_terminal_acessos dta ON (m.codigoaluno = dta.cd_pessoa AND LEFT(dta.dt_entrada, 10) = "'+FormatDateTime('yyyy-mm-dd', Self.dtFechamento)+'")  ');
      SQL.Add('WHERE                                                                             ');
      SQL.Add('    m.situacao IN (0,1,2,9,11) AND                                                                            ');
      SQL.Add('	 t.sn_terminal_acesso = 1 AND                                                    ');
      SQL.Add('	 ((dta.sn_finalizado = 1 AND dta.sn_especial = 0) OR (dta.cd_pessoa IS NULL))    ');
      sAux := DM.getParametro('ta_condicao_acesso');
      if (Length(sAux) > 0) then begin
         SQL.Add('AND ' + sAux);
      end;
      SQL.Add('GROUP BY                                                         ');
      SQL.Add(' 	m.anosemestre, m.curso, m.turma                               ');
      SQL.Add('ORDER BY                                                         ');
      SQL.Add(' 	m.anosemestre, m.curso, m.turma                               ');
      Open();

      clbTurmas.Items.Clear();

      while not DM.qyTerminal2.Eof do begin

         sAux := Copy(FieldByName('anosemestre').AsString, 1, 4) + '/' + Copy(FieldByName('anosemestre').AsString, 5, 1);
         sAux := sAux + ' - ' + FieldByName('turma').AsString;
         sAux := sAux + ': ' + Format('%4.0d', [DM.qyTerminal2.FieldByName('conta').AsInteger]) + ' aluno(s)';

         slDados := TStringList.Create();
         slDados.Add('anosemestre='+FieldByName('anosemestre').AsString);
         slDados.Add('turma='+FieldByName('turma').AsString);
         slDados.Add('curso='+FieldByName('curso').AsString);
         slDados.Add('data='+FormatDateTime('yyyy-mm-dd', Self.dtFechamento));

         clbTurmas.Items.AddObject(sAux, slDados);

         if (DM.qyTerminal2.FieldByName('conta').AsInteger > 0) then begin
            clbTurmas.Checked[clbTurmas.Items.Count-1] := True;
         end
         else begin
            clbTurmas.Checked[clbTurmas.Items.Count-1] := False;
         end;
         Next();
      end;
      Close();
      //FreeAndNil(slDados);

   end;
end;

procedure TfFechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmpTurma.Enabled := false;
end;

procedure TfFechamento.FormShow(Sender: TObject);
begin
  tmpTurma.Enabled := true;
end;

procedure TfFechamento.btnTodasClick(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to clbTurmas.Items.Count-1 do begin
      clbTurmas.Checked[i] := True;
   end;
end;

procedure TfFechamento.btnNenhumaClick(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to clbTurmas.Items.Count-1 do begin
      clbTurmas.Checked[i] := False;
   end;
end;

procedure TfFechamento.btnIgnorarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal();
end;

procedure TfFechamento.btnContinuarClick(Sender: TObject);
begin
  if TurmaSelecionada then
  begin
    ModalResult := mrOk;
    CloseModal();
  end
  else
  begin
    Showmessage('Para continuar é necessário selecionar uma turma na lista acima. ' + CHR(13) + 'Se não existir nenhuma turma clique no botão Ignorar.')
  end;
end;

end.

