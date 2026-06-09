unit uAtivCompCopiaCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, Mask, ToolWin, ExtCtrls, Buttons;

type
  TfrmAtivCompCopiaCurso = class(TForm)
    lbSelecioneAnoSemestre: TLabel;
    pnTopoCopiaCurso: TPanel;
    tbBotoes: TToolBar;
    btnConfirmar: TToolButton;
    tbSeparador1: TToolButton;
    btnCancelar: TToolButton;
    txtAnoSemestreCopia: TMaskEdit;
    UpDownCursos: TUpDown;
    imgBotoes: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    txtCurso: TEdit;
    btnCodigoCurso: TSpeedButton;
    txtGrade: TEdit;
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtivCompCopiaCurso: TfrmAtivCompCopiaCurso;

implementation

{$R *.dfm}
uses
   Main, uDM, General, ZAbstractRODataset, ZAbstractDataset,
   ZDataset, UZDataset, uFSelecionarCurso;

procedure TfrmAtivCompCopiaCurso.btnCancelarClick(Sender: TObject);
begin
   Self.CloseModal();
   Self.Close;
end;

procedure TfrmAtivCompCopiaCurso.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      txtCurso.Text := resultado_filtro.cd_curso;
      txtAnoSemestreCopia.Text := IntToStr( resultado_filtro.nr_anosemestre );
   end;
end;

procedure TfrmAtivCompCopiaCurso.btnConfirmarClick(Sender: TObject);
begin
      if Mensagem('Confirma a cópia da grade conforme os itens informados?', 'Aviso', MB_YESNO + MB_ICONWARNING) = mrYes then
      begin
         Self.ModalResult := mrOk;
         Self.CloseModal();
      end;
end;

procedure TfrmAtivCompCopiaCurso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAtivCompCopiaCurso.UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
   begin
      txtAnoSemestreCopia.text := DM.incrementar_ano_semestre( txtAnoSemestreCopia.Text );
   end
   else
   begin
      txtAnoSemestreCopia.text := DM.decrementar_ano_semestre( txtAnoSemestreCopia.Text );
   end;
end;

end.
