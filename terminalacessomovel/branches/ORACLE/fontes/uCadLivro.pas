unit uCadLivro;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ImgList, ToolWin, Spin, StdCtrls, DB, DBTables,
   General, UZDataset, ZAbstractDataset, ZDataset, uDMConexao;

type
   TfCadLivro = class(TForm)
   published
      qyInsereLivro: TUMZQuery;
      pnTitulo: TPanel;
      tbAcoes: TToolBar;
      ilImagens: TImageList;
      bnSep1: TToolButton;
      bnSalvar: TToolButton;
      bnSep2: TToolButton;
      bnCancelar: TToolButton;
      bnSep3: TToolButton;
      bvSep1: TBevel;
      bvSep2: TBevel;
      ledNome: TLabeledEdit;
      lbPaginas: TLabel;
      sePaginas: TSpinEdit;
      lbLinhas: TLabel;
      seLinhas: TSpinEdit;
      procedure ProcessaTeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure Salva(Sender: TObject);
      procedure Cancela(Sender: TObject);
      procedure FechaFormulario(Sender: TObject; var Action: TCloseAction);
   private
      constructor Create(AOwner: TComponent);
   public
      class function AdicionaLivro(AOwner: TComponent): string;
   end;

var
   fCadLivro: TfCadLivro;

implementation

{$R *.dfm}

{ TfCadLivro }

class function TfCadLivro.AdicionaLivro(AOwner: TComponent): string;
begin
   if not Assigned(fCadLivro) then
      fCadLivro := TfCadLivro.Create(AOwner);
   try
      case fCadLivro.ShowModal of
         mrOk: Result := fCadLivro.ledNome.Text;
         mrCancel: Result := '';
      end;
   finally
      FreeAndNil(fCadLivro);
   end;
end;

procedure TfCadLivro.Salva(Sender: TObject);
const
   MSG_AVISO = 'É necessário informar o nome do livro para efetuar o cadastro!';
   MSG_ERRO = 'Ocorreu um erro na tentativa de salvar o cadastro do novo livro na base de dados : ' + #13;
begin
   if Trim(Self.ledNome.Text) = '' then
      Mensagem(MSG_AVISO, 'Atenção!', MB_ICONWARNING)
   else
   begin
      Self.qyInsereLivro.ParamByName('nm_livro').AsString := Self.ledNome.Text;
      Self.qyInsereLivro.ParamByName('nr_paginas').AsInteger := Self.sePaginas.Value;
      Self.qyInsereLivro.ParamByName('nr_linhas').AsInteger := Self.seLinhas.Value;
      try
         Self.qyInsereLivro.ExecSQL;
      except
         on E: Exception do
            Mensagem(MSG_ERRO + E.Message, Application.Title, MB_ICONERROR);
      end;
      Self.ModalResult := mrOk;
      Self.CloseModal;
   end;
end;

constructor TfCadLivro.Create(AOwner: TComponent);
begin
   inherited;
end;

procedure TfCadLivro.FechaFormulario(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfCadLivro.ProcessaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5: Self.Salva(nil);
      VK_F6: Self.Cancela(nil);
   end;
end;

procedure TfCadLivro.Cancela(Sender: TObject);
const
   MSG_PERGUNTA = 'Tem certeza que deseja cancelar a inserção do novo livro?';
begin
   if Mensagem(MSG_PERGUNTA, Application.Title, MB_YESNO) = ID_YES then
   begin
      Self.ModalResult := mrCancel;
      Self.CloseModal;
   end;
end;

end.
