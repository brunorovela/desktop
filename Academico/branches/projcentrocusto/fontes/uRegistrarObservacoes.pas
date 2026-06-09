unit uRegistrarObservacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, DBCtrls;

type
  Tfrm_RegistrarObservacoes = class(TForm)
    Bevel1: TBevel;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    moObservacao: TMemo;
    sbCancelar: TSpeedButton;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    reObservacoes: TRichEdit;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure reObservacoesEnter(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_RegistrarObservacoes: Tfrm_RegistrarObservacoes;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_RegistrarObservacoes.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_RegistrarObservacoes.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_RegistrarObservacoes.btnFecharClick(Sender: TObject);
begin
  if moObservacao.Text <> '' then
    flgSearch := True
  else
  begin
    Mensagem('Observação inválida.', 'Erro', MB_OK + MB_ICONERROR);
    Abort;
  end;

  Close;
end;

procedure Tfrm_RegistrarObservacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE : sbCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_RegistrarObservacoes.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_RegistrarObservacoes.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  flgSearch := False;
end;

procedure Tfrm_RegistrarObservacoes.sbCancelarClick(Sender: TObject);
begin

  flgSearch := False;
  Close;
end;

procedure Tfrm_RegistrarObservacoes.reObservacoesEnter(Sender: TObject);
begin
  moObservacao.SetFocus;
end;

end.

