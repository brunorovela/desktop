unit uNegociacaoSimula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, general,uNegociacao,
  UMDateTimePicker;

type
  TfrmNegociacaoSimula = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    edDescricao: TEdit;
    Panel3: TPanel;
    umdtPrazo: TUMDateTimePicker;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    frmNegocia : TfrmNegociacao;
    { Public declarations }
  end;

var
  frmNegociacaoSimula: TfrmNegociacaoSimula;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmNegociacaoSimula.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOk then begin

   with frmNegocia do begin

       qyAux.Close();                
       qyAux.SQL.Text :=
         ' SELECT cd_simulacao, ds_simulacao, dt_prazo FROM fin_negocia_simula ' +
         '  WHERE dt_prazo >= :data ' +
         '    AND cd_pessoa = :cd_pessoa ' +
         '    AND trim(ds_simulacao) = :descricao ';

       qyAux.ParamByName('cd_pessoa').AsInteger := CodigoAluno;
       qyAux.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual());
       qyAux.ParamByName('descricao').AsString := trim(Self.edDescricao.Text);
       qyAux.Open;

       if not qyAux.Eof then begin

         Mensagem('Não é possível inserir esta simulação com o nome "' + Self.edDescricao.Text + '". '
         + CHR(13) + 'A pessoa já possui uma simulação com este nome.'
         + CHR(13) + CHR(13) + 'Altere a descrição da simulação e salve novamente.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
         
         CanClose := False;

       end else begin

         CanClose := true;

       end;


   end;
   end;

end;

end.

