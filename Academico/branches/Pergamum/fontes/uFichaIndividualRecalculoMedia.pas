unit uFichaIndividualRecalculoMedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, ComCtrls, ToolWin, General;

type
  TfrmFichaIndividualRecalculoMedia = class(TForm)
    pnTitulo: TPanel;
    pnConteudo: TPanel;
    lbInfo1: TLabel;
    edUniversoCalculo: TEdit;
    lbInfo2: TLabel;
    cbEtapa1: TCheckBox;
    cbEtapa2: TCheckBox;
    cbEtapa3: TCheckBox;
    cbEtapa4: TCheckBox;
    cbEtapa6: TCheckBox;
    cbEtapa7: TCheckBox;
    cbEtapa8: TCheckBox;
    cbEtapa9: TCheckBox;
    cbEtapa5: TCheckBox;
    cbEtapa10: TCheckBox;
    lbInfo3: TLabel;
    lbInfo4: TLabel;
    toolPessoa: TToolBar;
    btAlterar: TToolButton;
    ToolButton2: TToolButton;
    btSalvar: TToolButton;
    ilMenu: TImageList;
    procedure btSalvarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cd_turma_matricula: String;
    nr_anosemestre: Integer;
    calcularMedia: Boolean;
  public
    { Public declarations }
    procedure setTurmaMatricula(cdTurmaMatricula: string);
    function getTurmaMatricula(): string;

    procedure setAnosemestre(nrAnosemestre: Integer);
    function getAnosemestre(): Integer;

    procedure setMensagemUniverso(mensagem: string);

    function getCalcularMedia(): Boolean;
    function getEtapas: TStringList;    
  end;

var
  frmFichaIndividualRecalculoMedia: TfrmFichaIndividualRecalculoMedia;

implementation

uses uDM, ClassTurmas;

{$R *.dfm}

procedure TfrmFichaIndividualRecalculoMedia.btAlterarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFichaIndividualRecalculoMedia.btSalvarClick(Sender: TObject);
begin
   calcularMedia := True;
   Close;
end;

procedure TfrmFichaIndividualRecalculoMedia.FormCreate(Sender: TObject);
begin
   // Inicializa as variáveis
   cd_turma_matricula := '';
   nr_anosemestre := -1;
end;

procedure TfrmFichaIndividualRecalculoMedia.FormShow(Sender: TObject);
var
   nr_etapas, i : Integer;
begin
   if (nr_anosemestre = -1) or (cd_turma_matricula = '') then
   begin

      lbInfo2.Caption := 'Será realizado somente o cálculo da média final desses alunos. (não são calculadas as médias das etapas por meio dessa ação)';

      lbInfo3.Visible := False;
      lbInfo4.Visible := False;

   end else begin

      //Recupera o numero de etapas de uma turma matrícula
      nr_etapas := StrToIntDef(ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma_matricula, '', 'nr_avaliacoes'), 0);

      // Mostra somente as etapas que pertencem a turma matrícula do aluno (parametro de avaliação)
      for i := 1 to nr_etapas do
      begin
         TCheckBox(FindComponent('cbEtapa' + IntToStr(i))).Visible := True;
      end;

   end;

end;

procedure TfrmFichaIndividualRecalculoMedia.setTurmaMatricula(cdTurmaMatricula: string);
begin
   cd_turma_matricula := cdTurmaMatricula;
end;

function TfrmFichaIndividualRecalculoMedia.getTurmaMatricula() : string;
begin
   Result := cd_turma_matricula;
end;

procedure TfrmFichaIndividualRecalculoMedia.setAnosemestre(nrAnosemestre: Integer);
begin
   nr_anosemestre := nrAnosemestre;
end;

function TfrmFichaIndividualRecalculoMedia.getAnosemestre() : Integer;
begin
   Result := nr_anosemestre;
end;

procedure TfrmFichaIndividualRecalculoMedia.setMensagemUniverso(mensagem: string);
begin
   edUniversoCalculo.Text := mensagem;
end;

function TfrmFichaIndividualRecalculoMedia.getCalcularMedia(): Boolean;
begin
   Result := calcularMedia;
end;

function TfrmFichaIndividualRecalculoMedia.getEtapas(): TStringList;
var
   etapas: TStringList;
begin
   etapas := TStringList.Create;

   if cbEtapa1.Checked then etapas.Add('1');
   if cbEtapa2.Checked then etapas.Add('2');
   if cbEtapa3.Checked then etapas.Add('3');
   if cbEtapa4.Checked then etapas.Add('4');
   if cbEtapa5.Checked then etapas.Add('5');
   if cbEtapa6.Checked then etapas.Add('6');
   if cbEtapa7.Checked then etapas.Add('7');
   if cbEtapa8.Checked then etapas.Add('8');
   if cbEtapa9.Checked then etapas.Add('9');
   if cbEtapa10.Checked then etapas.Add('10');

   Result := etapas;
end;

end.
