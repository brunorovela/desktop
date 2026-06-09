unit uWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

const
   WIZARD_ACAO_CANCELAR: string = 'cancelar';
   WIZARD_ACAO_ANTERIOR: string = 'anterior';
   WIZARD_ACAO_PROXIMO: string = 'proximo';
   WIZARD_ACAO_FINALIZAR: string = 'finalizar';

type
  TfWizard = class(TForm)
    pnAcoes: TPanel;
    btnCancelar: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    btnFinalizar: TBitBtn;
    pcPassos: TPageControl;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    AAcoes: TStringList;
    { Private declarations }
  public
    constructor Create(AOwner: TObject);

    procedure desabilitaAcoes(Acoes: array of string);
    procedure habilitaAcoes(Acoes: array of string);

    procedure setPagina(tsPage: TPage); overload;
    procedure setPagina(sPagina: string); overload;
    procedure setPagina(iPagina: Integer); overload;
    procedure setPaginaTitulo(sPagina: string);
    { Public declarations }
  end;

var
  fWizard: TfWizard;

implementation

{$R *.dfm}

{ TForm1 }

constructor TfWizard.Create(AOwner: TObject);
begin
   AAcoes := TStringList.Create();
   AAcoes.AddObject(WIZARD_ACAO_CANCELAR, btnCancelar);
   AAcoes.AddObject(WIZARD_ACAO_ANTERIOR, btnAnterior);
   AAcoes.AddObject(WIZARD_ACAO_PROXIMO, btnProximo);
   AAcoes.AddObject(WIZARD_ACAO_FINALIZAR, btnFinalizar);
end;

procedure TfWizard.desabilitaAcoes(Acoes: array of string);
begin

end;

procedure TfWizard.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   Mensagem('Você tem certeza que deseja cancelar este Passo a Passo?' + Chr(13)
      + 'Todas as opções definidas até agora serão perdidas!', 'ATENÇÃO!!',
      MB_ICONQUESTION + MB_YESNO) ;
end;

procedure TfWizard.habilitaAcoes(Acoes: array of string);
begin

end;

procedure TfWizard.setPagina(tsPage: TPage);
begin

end;

procedure TfWizard.setPagina(iPagina: Integer);
begin

end;

procedure TfWizard.setPagina(sPagina: string);
begin

end;

procedure TfWizard.setPaginaTitulo(sPagina: string);
begin

end;

end.

